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
      ?auto_52099 - BLOCK
      ?auto_52100 - BLOCK
      ?auto_52101 - BLOCK
      ?auto_52102 - BLOCK
      ?auto_52103 - BLOCK
      ?auto_52104 - BLOCK
    )
    :vars
    (
      ?auto_52105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52105 ?auto_52104 ) ( CLEAR ?auto_52105 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52099 ) ( ON ?auto_52100 ?auto_52099 ) ( ON ?auto_52101 ?auto_52100 ) ( ON ?auto_52102 ?auto_52101 ) ( ON ?auto_52103 ?auto_52102 ) ( ON ?auto_52104 ?auto_52103 ) ( not ( = ?auto_52099 ?auto_52100 ) ) ( not ( = ?auto_52099 ?auto_52101 ) ) ( not ( = ?auto_52099 ?auto_52102 ) ) ( not ( = ?auto_52099 ?auto_52103 ) ) ( not ( = ?auto_52099 ?auto_52104 ) ) ( not ( = ?auto_52099 ?auto_52105 ) ) ( not ( = ?auto_52100 ?auto_52101 ) ) ( not ( = ?auto_52100 ?auto_52102 ) ) ( not ( = ?auto_52100 ?auto_52103 ) ) ( not ( = ?auto_52100 ?auto_52104 ) ) ( not ( = ?auto_52100 ?auto_52105 ) ) ( not ( = ?auto_52101 ?auto_52102 ) ) ( not ( = ?auto_52101 ?auto_52103 ) ) ( not ( = ?auto_52101 ?auto_52104 ) ) ( not ( = ?auto_52101 ?auto_52105 ) ) ( not ( = ?auto_52102 ?auto_52103 ) ) ( not ( = ?auto_52102 ?auto_52104 ) ) ( not ( = ?auto_52102 ?auto_52105 ) ) ( not ( = ?auto_52103 ?auto_52104 ) ) ( not ( = ?auto_52103 ?auto_52105 ) ) ( not ( = ?auto_52104 ?auto_52105 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52105 ?auto_52104 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52107 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_52107 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_52107 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52108 - BLOCK
    )
    :vars
    (
      ?auto_52109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52108 ?auto_52109 ) ( CLEAR ?auto_52108 ) ( HAND-EMPTY ) ( not ( = ?auto_52108 ?auto_52109 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52108 ?auto_52109 )
      ( MAKE-1PILE ?auto_52108 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52115 - BLOCK
      ?auto_52116 - BLOCK
      ?auto_52117 - BLOCK
      ?auto_52118 - BLOCK
      ?auto_52119 - BLOCK
    )
    :vars
    (
      ?auto_52120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52120 ?auto_52119 ) ( CLEAR ?auto_52120 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52115 ) ( ON ?auto_52116 ?auto_52115 ) ( ON ?auto_52117 ?auto_52116 ) ( ON ?auto_52118 ?auto_52117 ) ( ON ?auto_52119 ?auto_52118 ) ( not ( = ?auto_52115 ?auto_52116 ) ) ( not ( = ?auto_52115 ?auto_52117 ) ) ( not ( = ?auto_52115 ?auto_52118 ) ) ( not ( = ?auto_52115 ?auto_52119 ) ) ( not ( = ?auto_52115 ?auto_52120 ) ) ( not ( = ?auto_52116 ?auto_52117 ) ) ( not ( = ?auto_52116 ?auto_52118 ) ) ( not ( = ?auto_52116 ?auto_52119 ) ) ( not ( = ?auto_52116 ?auto_52120 ) ) ( not ( = ?auto_52117 ?auto_52118 ) ) ( not ( = ?auto_52117 ?auto_52119 ) ) ( not ( = ?auto_52117 ?auto_52120 ) ) ( not ( = ?auto_52118 ?auto_52119 ) ) ( not ( = ?auto_52118 ?auto_52120 ) ) ( not ( = ?auto_52119 ?auto_52120 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52120 ?auto_52119 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52121 - BLOCK
      ?auto_52122 - BLOCK
      ?auto_52123 - BLOCK
      ?auto_52124 - BLOCK
      ?auto_52125 - BLOCK
    )
    :vars
    (
      ?auto_52126 - BLOCK
      ?auto_52127 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52126 ?auto_52125 ) ( CLEAR ?auto_52126 ) ( ON-TABLE ?auto_52121 ) ( ON ?auto_52122 ?auto_52121 ) ( ON ?auto_52123 ?auto_52122 ) ( ON ?auto_52124 ?auto_52123 ) ( ON ?auto_52125 ?auto_52124 ) ( not ( = ?auto_52121 ?auto_52122 ) ) ( not ( = ?auto_52121 ?auto_52123 ) ) ( not ( = ?auto_52121 ?auto_52124 ) ) ( not ( = ?auto_52121 ?auto_52125 ) ) ( not ( = ?auto_52121 ?auto_52126 ) ) ( not ( = ?auto_52122 ?auto_52123 ) ) ( not ( = ?auto_52122 ?auto_52124 ) ) ( not ( = ?auto_52122 ?auto_52125 ) ) ( not ( = ?auto_52122 ?auto_52126 ) ) ( not ( = ?auto_52123 ?auto_52124 ) ) ( not ( = ?auto_52123 ?auto_52125 ) ) ( not ( = ?auto_52123 ?auto_52126 ) ) ( not ( = ?auto_52124 ?auto_52125 ) ) ( not ( = ?auto_52124 ?auto_52126 ) ) ( not ( = ?auto_52125 ?auto_52126 ) ) ( HOLDING ?auto_52127 ) ( not ( = ?auto_52121 ?auto_52127 ) ) ( not ( = ?auto_52122 ?auto_52127 ) ) ( not ( = ?auto_52123 ?auto_52127 ) ) ( not ( = ?auto_52124 ?auto_52127 ) ) ( not ( = ?auto_52125 ?auto_52127 ) ) ( not ( = ?auto_52126 ?auto_52127 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_52127 )
      ( MAKE-5PILE ?auto_52121 ?auto_52122 ?auto_52123 ?auto_52124 ?auto_52125 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52128 - BLOCK
      ?auto_52129 - BLOCK
      ?auto_52130 - BLOCK
      ?auto_52131 - BLOCK
      ?auto_52132 - BLOCK
    )
    :vars
    (
      ?auto_52133 - BLOCK
      ?auto_52134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52133 ?auto_52132 ) ( ON-TABLE ?auto_52128 ) ( ON ?auto_52129 ?auto_52128 ) ( ON ?auto_52130 ?auto_52129 ) ( ON ?auto_52131 ?auto_52130 ) ( ON ?auto_52132 ?auto_52131 ) ( not ( = ?auto_52128 ?auto_52129 ) ) ( not ( = ?auto_52128 ?auto_52130 ) ) ( not ( = ?auto_52128 ?auto_52131 ) ) ( not ( = ?auto_52128 ?auto_52132 ) ) ( not ( = ?auto_52128 ?auto_52133 ) ) ( not ( = ?auto_52129 ?auto_52130 ) ) ( not ( = ?auto_52129 ?auto_52131 ) ) ( not ( = ?auto_52129 ?auto_52132 ) ) ( not ( = ?auto_52129 ?auto_52133 ) ) ( not ( = ?auto_52130 ?auto_52131 ) ) ( not ( = ?auto_52130 ?auto_52132 ) ) ( not ( = ?auto_52130 ?auto_52133 ) ) ( not ( = ?auto_52131 ?auto_52132 ) ) ( not ( = ?auto_52131 ?auto_52133 ) ) ( not ( = ?auto_52132 ?auto_52133 ) ) ( not ( = ?auto_52128 ?auto_52134 ) ) ( not ( = ?auto_52129 ?auto_52134 ) ) ( not ( = ?auto_52130 ?auto_52134 ) ) ( not ( = ?auto_52131 ?auto_52134 ) ) ( not ( = ?auto_52132 ?auto_52134 ) ) ( not ( = ?auto_52133 ?auto_52134 ) ) ( ON ?auto_52134 ?auto_52133 ) ( CLEAR ?auto_52134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52128 ?auto_52129 ?auto_52130 ?auto_52131 ?auto_52132 ?auto_52133 )
      ( MAKE-5PILE ?auto_52128 ?auto_52129 ?auto_52130 ?auto_52131 ?auto_52132 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52137 - BLOCK
      ?auto_52138 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_52138 ) ( CLEAR ?auto_52137 ) ( ON-TABLE ?auto_52137 ) ( not ( = ?auto_52137 ?auto_52138 ) ) )
    :subtasks
    ( ( !STACK ?auto_52138 ?auto_52137 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52139 - BLOCK
      ?auto_52140 - BLOCK
    )
    :vars
    (
      ?auto_52141 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_52139 ) ( ON-TABLE ?auto_52139 ) ( not ( = ?auto_52139 ?auto_52140 ) ) ( ON ?auto_52140 ?auto_52141 ) ( CLEAR ?auto_52140 ) ( HAND-EMPTY ) ( not ( = ?auto_52139 ?auto_52141 ) ) ( not ( = ?auto_52140 ?auto_52141 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52140 ?auto_52141 )
      ( MAKE-2PILE ?auto_52139 ?auto_52140 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52142 - BLOCK
      ?auto_52143 - BLOCK
    )
    :vars
    (
      ?auto_52144 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52142 ?auto_52143 ) ) ( ON ?auto_52143 ?auto_52144 ) ( CLEAR ?auto_52143 ) ( not ( = ?auto_52142 ?auto_52144 ) ) ( not ( = ?auto_52143 ?auto_52144 ) ) ( HOLDING ?auto_52142 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52142 )
      ( MAKE-2PILE ?auto_52142 ?auto_52143 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52145 - BLOCK
      ?auto_52146 - BLOCK
    )
    :vars
    (
      ?auto_52147 - BLOCK
      ?auto_52151 - BLOCK
      ?auto_52150 - BLOCK
      ?auto_52149 - BLOCK
      ?auto_52148 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52145 ?auto_52146 ) ) ( ON ?auto_52146 ?auto_52147 ) ( not ( = ?auto_52145 ?auto_52147 ) ) ( not ( = ?auto_52146 ?auto_52147 ) ) ( ON ?auto_52145 ?auto_52146 ) ( CLEAR ?auto_52145 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52151 ) ( ON ?auto_52150 ?auto_52151 ) ( ON ?auto_52149 ?auto_52150 ) ( ON ?auto_52148 ?auto_52149 ) ( ON ?auto_52147 ?auto_52148 ) ( not ( = ?auto_52151 ?auto_52150 ) ) ( not ( = ?auto_52151 ?auto_52149 ) ) ( not ( = ?auto_52151 ?auto_52148 ) ) ( not ( = ?auto_52151 ?auto_52147 ) ) ( not ( = ?auto_52151 ?auto_52146 ) ) ( not ( = ?auto_52151 ?auto_52145 ) ) ( not ( = ?auto_52150 ?auto_52149 ) ) ( not ( = ?auto_52150 ?auto_52148 ) ) ( not ( = ?auto_52150 ?auto_52147 ) ) ( not ( = ?auto_52150 ?auto_52146 ) ) ( not ( = ?auto_52150 ?auto_52145 ) ) ( not ( = ?auto_52149 ?auto_52148 ) ) ( not ( = ?auto_52149 ?auto_52147 ) ) ( not ( = ?auto_52149 ?auto_52146 ) ) ( not ( = ?auto_52149 ?auto_52145 ) ) ( not ( = ?auto_52148 ?auto_52147 ) ) ( not ( = ?auto_52148 ?auto_52146 ) ) ( not ( = ?auto_52148 ?auto_52145 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52151 ?auto_52150 ?auto_52149 ?auto_52148 ?auto_52147 ?auto_52146 )
      ( MAKE-2PILE ?auto_52145 ?auto_52146 ) )
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
      ?auto_52160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52160 ?auto_52159 ) ( CLEAR ?auto_52160 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52156 ) ( ON ?auto_52157 ?auto_52156 ) ( ON ?auto_52158 ?auto_52157 ) ( ON ?auto_52159 ?auto_52158 ) ( not ( = ?auto_52156 ?auto_52157 ) ) ( not ( = ?auto_52156 ?auto_52158 ) ) ( not ( = ?auto_52156 ?auto_52159 ) ) ( not ( = ?auto_52156 ?auto_52160 ) ) ( not ( = ?auto_52157 ?auto_52158 ) ) ( not ( = ?auto_52157 ?auto_52159 ) ) ( not ( = ?auto_52157 ?auto_52160 ) ) ( not ( = ?auto_52158 ?auto_52159 ) ) ( not ( = ?auto_52158 ?auto_52160 ) ) ( not ( = ?auto_52159 ?auto_52160 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52160 ?auto_52159 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52161 - BLOCK
      ?auto_52162 - BLOCK
      ?auto_52163 - BLOCK
      ?auto_52164 - BLOCK
    )
    :vars
    (
      ?auto_52165 - BLOCK
      ?auto_52166 - BLOCK
      ?auto_52167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52165 ?auto_52164 ) ( CLEAR ?auto_52165 ) ( ON-TABLE ?auto_52161 ) ( ON ?auto_52162 ?auto_52161 ) ( ON ?auto_52163 ?auto_52162 ) ( ON ?auto_52164 ?auto_52163 ) ( not ( = ?auto_52161 ?auto_52162 ) ) ( not ( = ?auto_52161 ?auto_52163 ) ) ( not ( = ?auto_52161 ?auto_52164 ) ) ( not ( = ?auto_52161 ?auto_52165 ) ) ( not ( = ?auto_52162 ?auto_52163 ) ) ( not ( = ?auto_52162 ?auto_52164 ) ) ( not ( = ?auto_52162 ?auto_52165 ) ) ( not ( = ?auto_52163 ?auto_52164 ) ) ( not ( = ?auto_52163 ?auto_52165 ) ) ( not ( = ?auto_52164 ?auto_52165 ) ) ( HOLDING ?auto_52166 ) ( CLEAR ?auto_52167 ) ( not ( = ?auto_52161 ?auto_52166 ) ) ( not ( = ?auto_52161 ?auto_52167 ) ) ( not ( = ?auto_52162 ?auto_52166 ) ) ( not ( = ?auto_52162 ?auto_52167 ) ) ( not ( = ?auto_52163 ?auto_52166 ) ) ( not ( = ?auto_52163 ?auto_52167 ) ) ( not ( = ?auto_52164 ?auto_52166 ) ) ( not ( = ?auto_52164 ?auto_52167 ) ) ( not ( = ?auto_52165 ?auto_52166 ) ) ( not ( = ?auto_52165 ?auto_52167 ) ) ( not ( = ?auto_52166 ?auto_52167 ) ) )
    :subtasks
    ( ( !STACK ?auto_52166 ?auto_52167 )
      ( MAKE-4PILE ?auto_52161 ?auto_52162 ?auto_52163 ?auto_52164 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52168 - BLOCK
      ?auto_52169 - BLOCK
      ?auto_52170 - BLOCK
      ?auto_52171 - BLOCK
    )
    :vars
    (
      ?auto_52174 - BLOCK
      ?auto_52173 - BLOCK
      ?auto_52172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52174 ?auto_52171 ) ( ON-TABLE ?auto_52168 ) ( ON ?auto_52169 ?auto_52168 ) ( ON ?auto_52170 ?auto_52169 ) ( ON ?auto_52171 ?auto_52170 ) ( not ( = ?auto_52168 ?auto_52169 ) ) ( not ( = ?auto_52168 ?auto_52170 ) ) ( not ( = ?auto_52168 ?auto_52171 ) ) ( not ( = ?auto_52168 ?auto_52174 ) ) ( not ( = ?auto_52169 ?auto_52170 ) ) ( not ( = ?auto_52169 ?auto_52171 ) ) ( not ( = ?auto_52169 ?auto_52174 ) ) ( not ( = ?auto_52170 ?auto_52171 ) ) ( not ( = ?auto_52170 ?auto_52174 ) ) ( not ( = ?auto_52171 ?auto_52174 ) ) ( CLEAR ?auto_52173 ) ( not ( = ?auto_52168 ?auto_52172 ) ) ( not ( = ?auto_52168 ?auto_52173 ) ) ( not ( = ?auto_52169 ?auto_52172 ) ) ( not ( = ?auto_52169 ?auto_52173 ) ) ( not ( = ?auto_52170 ?auto_52172 ) ) ( not ( = ?auto_52170 ?auto_52173 ) ) ( not ( = ?auto_52171 ?auto_52172 ) ) ( not ( = ?auto_52171 ?auto_52173 ) ) ( not ( = ?auto_52174 ?auto_52172 ) ) ( not ( = ?auto_52174 ?auto_52173 ) ) ( not ( = ?auto_52172 ?auto_52173 ) ) ( ON ?auto_52172 ?auto_52174 ) ( CLEAR ?auto_52172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52168 ?auto_52169 ?auto_52170 ?auto_52171 ?auto_52174 )
      ( MAKE-4PILE ?auto_52168 ?auto_52169 ?auto_52170 ?auto_52171 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52175 - BLOCK
      ?auto_52176 - BLOCK
      ?auto_52177 - BLOCK
      ?auto_52178 - BLOCK
    )
    :vars
    (
      ?auto_52179 - BLOCK
      ?auto_52181 - BLOCK
      ?auto_52180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52179 ?auto_52178 ) ( ON-TABLE ?auto_52175 ) ( ON ?auto_52176 ?auto_52175 ) ( ON ?auto_52177 ?auto_52176 ) ( ON ?auto_52178 ?auto_52177 ) ( not ( = ?auto_52175 ?auto_52176 ) ) ( not ( = ?auto_52175 ?auto_52177 ) ) ( not ( = ?auto_52175 ?auto_52178 ) ) ( not ( = ?auto_52175 ?auto_52179 ) ) ( not ( = ?auto_52176 ?auto_52177 ) ) ( not ( = ?auto_52176 ?auto_52178 ) ) ( not ( = ?auto_52176 ?auto_52179 ) ) ( not ( = ?auto_52177 ?auto_52178 ) ) ( not ( = ?auto_52177 ?auto_52179 ) ) ( not ( = ?auto_52178 ?auto_52179 ) ) ( not ( = ?auto_52175 ?auto_52181 ) ) ( not ( = ?auto_52175 ?auto_52180 ) ) ( not ( = ?auto_52176 ?auto_52181 ) ) ( not ( = ?auto_52176 ?auto_52180 ) ) ( not ( = ?auto_52177 ?auto_52181 ) ) ( not ( = ?auto_52177 ?auto_52180 ) ) ( not ( = ?auto_52178 ?auto_52181 ) ) ( not ( = ?auto_52178 ?auto_52180 ) ) ( not ( = ?auto_52179 ?auto_52181 ) ) ( not ( = ?auto_52179 ?auto_52180 ) ) ( not ( = ?auto_52181 ?auto_52180 ) ) ( ON ?auto_52181 ?auto_52179 ) ( CLEAR ?auto_52181 ) ( HOLDING ?auto_52180 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52180 )
      ( MAKE-4PILE ?auto_52175 ?auto_52176 ?auto_52177 ?auto_52178 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52182 - BLOCK
      ?auto_52183 - BLOCK
      ?auto_52184 - BLOCK
      ?auto_52185 - BLOCK
    )
    :vars
    (
      ?auto_52187 - BLOCK
      ?auto_52186 - BLOCK
      ?auto_52188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52187 ?auto_52185 ) ( ON-TABLE ?auto_52182 ) ( ON ?auto_52183 ?auto_52182 ) ( ON ?auto_52184 ?auto_52183 ) ( ON ?auto_52185 ?auto_52184 ) ( not ( = ?auto_52182 ?auto_52183 ) ) ( not ( = ?auto_52182 ?auto_52184 ) ) ( not ( = ?auto_52182 ?auto_52185 ) ) ( not ( = ?auto_52182 ?auto_52187 ) ) ( not ( = ?auto_52183 ?auto_52184 ) ) ( not ( = ?auto_52183 ?auto_52185 ) ) ( not ( = ?auto_52183 ?auto_52187 ) ) ( not ( = ?auto_52184 ?auto_52185 ) ) ( not ( = ?auto_52184 ?auto_52187 ) ) ( not ( = ?auto_52185 ?auto_52187 ) ) ( not ( = ?auto_52182 ?auto_52186 ) ) ( not ( = ?auto_52182 ?auto_52188 ) ) ( not ( = ?auto_52183 ?auto_52186 ) ) ( not ( = ?auto_52183 ?auto_52188 ) ) ( not ( = ?auto_52184 ?auto_52186 ) ) ( not ( = ?auto_52184 ?auto_52188 ) ) ( not ( = ?auto_52185 ?auto_52186 ) ) ( not ( = ?auto_52185 ?auto_52188 ) ) ( not ( = ?auto_52187 ?auto_52186 ) ) ( not ( = ?auto_52187 ?auto_52188 ) ) ( not ( = ?auto_52186 ?auto_52188 ) ) ( ON ?auto_52186 ?auto_52187 ) ( ON ?auto_52188 ?auto_52186 ) ( CLEAR ?auto_52188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52182 ?auto_52183 ?auto_52184 ?auto_52185 ?auto_52187 ?auto_52186 )
      ( MAKE-4PILE ?auto_52182 ?auto_52183 ?auto_52184 ?auto_52185 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52192 - BLOCK
      ?auto_52193 - BLOCK
      ?auto_52194 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_52194 ) ( CLEAR ?auto_52193 ) ( ON-TABLE ?auto_52192 ) ( ON ?auto_52193 ?auto_52192 ) ( not ( = ?auto_52192 ?auto_52193 ) ) ( not ( = ?auto_52192 ?auto_52194 ) ) ( not ( = ?auto_52193 ?auto_52194 ) ) )
    :subtasks
    ( ( !STACK ?auto_52194 ?auto_52193 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52195 - BLOCK
      ?auto_52196 - BLOCK
      ?auto_52197 - BLOCK
    )
    :vars
    (
      ?auto_52198 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_52196 ) ( ON-TABLE ?auto_52195 ) ( ON ?auto_52196 ?auto_52195 ) ( not ( = ?auto_52195 ?auto_52196 ) ) ( not ( = ?auto_52195 ?auto_52197 ) ) ( not ( = ?auto_52196 ?auto_52197 ) ) ( ON ?auto_52197 ?auto_52198 ) ( CLEAR ?auto_52197 ) ( HAND-EMPTY ) ( not ( = ?auto_52195 ?auto_52198 ) ) ( not ( = ?auto_52196 ?auto_52198 ) ) ( not ( = ?auto_52197 ?auto_52198 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52197 ?auto_52198 )
      ( MAKE-3PILE ?auto_52195 ?auto_52196 ?auto_52197 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52199 - BLOCK
      ?auto_52200 - BLOCK
      ?auto_52201 - BLOCK
    )
    :vars
    (
      ?auto_52202 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52199 ) ( not ( = ?auto_52199 ?auto_52200 ) ) ( not ( = ?auto_52199 ?auto_52201 ) ) ( not ( = ?auto_52200 ?auto_52201 ) ) ( ON ?auto_52201 ?auto_52202 ) ( CLEAR ?auto_52201 ) ( not ( = ?auto_52199 ?auto_52202 ) ) ( not ( = ?auto_52200 ?auto_52202 ) ) ( not ( = ?auto_52201 ?auto_52202 ) ) ( HOLDING ?auto_52200 ) ( CLEAR ?auto_52199 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52199 ?auto_52200 )
      ( MAKE-3PILE ?auto_52199 ?auto_52200 ?auto_52201 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52203 - BLOCK
      ?auto_52204 - BLOCK
      ?auto_52205 - BLOCK
    )
    :vars
    (
      ?auto_52206 - BLOCK
      ?auto_52209 - BLOCK
      ?auto_52207 - BLOCK
      ?auto_52208 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52203 ) ( not ( = ?auto_52203 ?auto_52204 ) ) ( not ( = ?auto_52203 ?auto_52205 ) ) ( not ( = ?auto_52204 ?auto_52205 ) ) ( ON ?auto_52205 ?auto_52206 ) ( not ( = ?auto_52203 ?auto_52206 ) ) ( not ( = ?auto_52204 ?auto_52206 ) ) ( not ( = ?auto_52205 ?auto_52206 ) ) ( CLEAR ?auto_52203 ) ( ON ?auto_52204 ?auto_52205 ) ( CLEAR ?auto_52204 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52209 ) ( ON ?auto_52207 ?auto_52209 ) ( ON ?auto_52208 ?auto_52207 ) ( ON ?auto_52206 ?auto_52208 ) ( not ( = ?auto_52209 ?auto_52207 ) ) ( not ( = ?auto_52209 ?auto_52208 ) ) ( not ( = ?auto_52209 ?auto_52206 ) ) ( not ( = ?auto_52209 ?auto_52205 ) ) ( not ( = ?auto_52209 ?auto_52204 ) ) ( not ( = ?auto_52207 ?auto_52208 ) ) ( not ( = ?auto_52207 ?auto_52206 ) ) ( not ( = ?auto_52207 ?auto_52205 ) ) ( not ( = ?auto_52207 ?auto_52204 ) ) ( not ( = ?auto_52208 ?auto_52206 ) ) ( not ( = ?auto_52208 ?auto_52205 ) ) ( not ( = ?auto_52208 ?auto_52204 ) ) ( not ( = ?auto_52203 ?auto_52209 ) ) ( not ( = ?auto_52203 ?auto_52207 ) ) ( not ( = ?auto_52203 ?auto_52208 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52209 ?auto_52207 ?auto_52208 ?auto_52206 ?auto_52205 )
      ( MAKE-3PILE ?auto_52203 ?auto_52204 ?auto_52205 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52210 - BLOCK
      ?auto_52211 - BLOCK
      ?auto_52212 - BLOCK
    )
    :vars
    (
      ?auto_52216 - BLOCK
      ?auto_52215 - BLOCK
      ?auto_52213 - BLOCK
      ?auto_52214 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52210 ?auto_52211 ) ) ( not ( = ?auto_52210 ?auto_52212 ) ) ( not ( = ?auto_52211 ?auto_52212 ) ) ( ON ?auto_52212 ?auto_52216 ) ( not ( = ?auto_52210 ?auto_52216 ) ) ( not ( = ?auto_52211 ?auto_52216 ) ) ( not ( = ?auto_52212 ?auto_52216 ) ) ( ON ?auto_52211 ?auto_52212 ) ( CLEAR ?auto_52211 ) ( ON-TABLE ?auto_52215 ) ( ON ?auto_52213 ?auto_52215 ) ( ON ?auto_52214 ?auto_52213 ) ( ON ?auto_52216 ?auto_52214 ) ( not ( = ?auto_52215 ?auto_52213 ) ) ( not ( = ?auto_52215 ?auto_52214 ) ) ( not ( = ?auto_52215 ?auto_52216 ) ) ( not ( = ?auto_52215 ?auto_52212 ) ) ( not ( = ?auto_52215 ?auto_52211 ) ) ( not ( = ?auto_52213 ?auto_52214 ) ) ( not ( = ?auto_52213 ?auto_52216 ) ) ( not ( = ?auto_52213 ?auto_52212 ) ) ( not ( = ?auto_52213 ?auto_52211 ) ) ( not ( = ?auto_52214 ?auto_52216 ) ) ( not ( = ?auto_52214 ?auto_52212 ) ) ( not ( = ?auto_52214 ?auto_52211 ) ) ( not ( = ?auto_52210 ?auto_52215 ) ) ( not ( = ?auto_52210 ?auto_52213 ) ) ( not ( = ?auto_52210 ?auto_52214 ) ) ( HOLDING ?auto_52210 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52210 )
      ( MAKE-3PILE ?auto_52210 ?auto_52211 ?auto_52212 ) )
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
      ?auto_52220 - BLOCK
      ?auto_52223 - BLOCK
      ?auto_52222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52217 ?auto_52218 ) ) ( not ( = ?auto_52217 ?auto_52219 ) ) ( not ( = ?auto_52218 ?auto_52219 ) ) ( ON ?auto_52219 ?auto_52221 ) ( not ( = ?auto_52217 ?auto_52221 ) ) ( not ( = ?auto_52218 ?auto_52221 ) ) ( not ( = ?auto_52219 ?auto_52221 ) ) ( ON ?auto_52218 ?auto_52219 ) ( ON-TABLE ?auto_52220 ) ( ON ?auto_52223 ?auto_52220 ) ( ON ?auto_52222 ?auto_52223 ) ( ON ?auto_52221 ?auto_52222 ) ( not ( = ?auto_52220 ?auto_52223 ) ) ( not ( = ?auto_52220 ?auto_52222 ) ) ( not ( = ?auto_52220 ?auto_52221 ) ) ( not ( = ?auto_52220 ?auto_52219 ) ) ( not ( = ?auto_52220 ?auto_52218 ) ) ( not ( = ?auto_52223 ?auto_52222 ) ) ( not ( = ?auto_52223 ?auto_52221 ) ) ( not ( = ?auto_52223 ?auto_52219 ) ) ( not ( = ?auto_52223 ?auto_52218 ) ) ( not ( = ?auto_52222 ?auto_52221 ) ) ( not ( = ?auto_52222 ?auto_52219 ) ) ( not ( = ?auto_52222 ?auto_52218 ) ) ( not ( = ?auto_52217 ?auto_52220 ) ) ( not ( = ?auto_52217 ?auto_52223 ) ) ( not ( = ?auto_52217 ?auto_52222 ) ) ( ON ?auto_52217 ?auto_52218 ) ( CLEAR ?auto_52217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52220 ?auto_52223 ?auto_52222 ?auto_52221 ?auto_52219 ?auto_52218 )
      ( MAKE-3PILE ?auto_52217 ?auto_52218 ?auto_52219 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52227 - BLOCK
      ?auto_52228 - BLOCK
      ?auto_52229 - BLOCK
    )
    :vars
    (
      ?auto_52230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52230 ?auto_52229 ) ( CLEAR ?auto_52230 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52227 ) ( ON ?auto_52228 ?auto_52227 ) ( ON ?auto_52229 ?auto_52228 ) ( not ( = ?auto_52227 ?auto_52228 ) ) ( not ( = ?auto_52227 ?auto_52229 ) ) ( not ( = ?auto_52227 ?auto_52230 ) ) ( not ( = ?auto_52228 ?auto_52229 ) ) ( not ( = ?auto_52228 ?auto_52230 ) ) ( not ( = ?auto_52229 ?auto_52230 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52230 ?auto_52229 ) )
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
      ?auto_52234 - BLOCK
      ?auto_52235 - BLOCK
      ?auto_52236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52234 ?auto_52233 ) ( CLEAR ?auto_52234 ) ( ON-TABLE ?auto_52231 ) ( ON ?auto_52232 ?auto_52231 ) ( ON ?auto_52233 ?auto_52232 ) ( not ( = ?auto_52231 ?auto_52232 ) ) ( not ( = ?auto_52231 ?auto_52233 ) ) ( not ( = ?auto_52231 ?auto_52234 ) ) ( not ( = ?auto_52232 ?auto_52233 ) ) ( not ( = ?auto_52232 ?auto_52234 ) ) ( not ( = ?auto_52233 ?auto_52234 ) ) ( HOLDING ?auto_52235 ) ( CLEAR ?auto_52236 ) ( not ( = ?auto_52231 ?auto_52235 ) ) ( not ( = ?auto_52231 ?auto_52236 ) ) ( not ( = ?auto_52232 ?auto_52235 ) ) ( not ( = ?auto_52232 ?auto_52236 ) ) ( not ( = ?auto_52233 ?auto_52235 ) ) ( not ( = ?auto_52233 ?auto_52236 ) ) ( not ( = ?auto_52234 ?auto_52235 ) ) ( not ( = ?auto_52234 ?auto_52236 ) ) ( not ( = ?auto_52235 ?auto_52236 ) ) )
    :subtasks
    ( ( !STACK ?auto_52235 ?auto_52236 )
      ( MAKE-3PILE ?auto_52231 ?auto_52232 ?auto_52233 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52237 - BLOCK
      ?auto_52238 - BLOCK
      ?auto_52239 - BLOCK
    )
    :vars
    (
      ?auto_52241 - BLOCK
      ?auto_52242 - BLOCK
      ?auto_52240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52241 ?auto_52239 ) ( ON-TABLE ?auto_52237 ) ( ON ?auto_52238 ?auto_52237 ) ( ON ?auto_52239 ?auto_52238 ) ( not ( = ?auto_52237 ?auto_52238 ) ) ( not ( = ?auto_52237 ?auto_52239 ) ) ( not ( = ?auto_52237 ?auto_52241 ) ) ( not ( = ?auto_52238 ?auto_52239 ) ) ( not ( = ?auto_52238 ?auto_52241 ) ) ( not ( = ?auto_52239 ?auto_52241 ) ) ( CLEAR ?auto_52242 ) ( not ( = ?auto_52237 ?auto_52240 ) ) ( not ( = ?auto_52237 ?auto_52242 ) ) ( not ( = ?auto_52238 ?auto_52240 ) ) ( not ( = ?auto_52238 ?auto_52242 ) ) ( not ( = ?auto_52239 ?auto_52240 ) ) ( not ( = ?auto_52239 ?auto_52242 ) ) ( not ( = ?auto_52241 ?auto_52240 ) ) ( not ( = ?auto_52241 ?auto_52242 ) ) ( not ( = ?auto_52240 ?auto_52242 ) ) ( ON ?auto_52240 ?auto_52241 ) ( CLEAR ?auto_52240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52237 ?auto_52238 ?auto_52239 ?auto_52241 )
      ( MAKE-3PILE ?auto_52237 ?auto_52238 ?auto_52239 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52243 - BLOCK
      ?auto_52244 - BLOCK
      ?auto_52245 - BLOCK
    )
    :vars
    (
      ?auto_52246 - BLOCK
      ?auto_52248 - BLOCK
      ?auto_52247 - BLOCK
      ?auto_52249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52246 ?auto_52245 ) ( ON-TABLE ?auto_52243 ) ( ON ?auto_52244 ?auto_52243 ) ( ON ?auto_52245 ?auto_52244 ) ( not ( = ?auto_52243 ?auto_52244 ) ) ( not ( = ?auto_52243 ?auto_52245 ) ) ( not ( = ?auto_52243 ?auto_52246 ) ) ( not ( = ?auto_52244 ?auto_52245 ) ) ( not ( = ?auto_52244 ?auto_52246 ) ) ( not ( = ?auto_52245 ?auto_52246 ) ) ( not ( = ?auto_52243 ?auto_52248 ) ) ( not ( = ?auto_52243 ?auto_52247 ) ) ( not ( = ?auto_52244 ?auto_52248 ) ) ( not ( = ?auto_52244 ?auto_52247 ) ) ( not ( = ?auto_52245 ?auto_52248 ) ) ( not ( = ?auto_52245 ?auto_52247 ) ) ( not ( = ?auto_52246 ?auto_52248 ) ) ( not ( = ?auto_52246 ?auto_52247 ) ) ( not ( = ?auto_52248 ?auto_52247 ) ) ( ON ?auto_52248 ?auto_52246 ) ( CLEAR ?auto_52248 ) ( HOLDING ?auto_52247 ) ( CLEAR ?auto_52249 ) ( ON-TABLE ?auto_52249 ) ( not ( = ?auto_52249 ?auto_52247 ) ) ( not ( = ?auto_52243 ?auto_52249 ) ) ( not ( = ?auto_52244 ?auto_52249 ) ) ( not ( = ?auto_52245 ?auto_52249 ) ) ( not ( = ?auto_52246 ?auto_52249 ) ) ( not ( = ?auto_52248 ?auto_52249 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52249 ?auto_52247 )
      ( MAKE-3PILE ?auto_52243 ?auto_52244 ?auto_52245 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52250 - BLOCK
      ?auto_52251 - BLOCK
      ?auto_52252 - BLOCK
    )
    :vars
    (
      ?auto_52256 - BLOCK
      ?auto_52255 - BLOCK
      ?auto_52254 - BLOCK
      ?auto_52253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52256 ?auto_52252 ) ( ON-TABLE ?auto_52250 ) ( ON ?auto_52251 ?auto_52250 ) ( ON ?auto_52252 ?auto_52251 ) ( not ( = ?auto_52250 ?auto_52251 ) ) ( not ( = ?auto_52250 ?auto_52252 ) ) ( not ( = ?auto_52250 ?auto_52256 ) ) ( not ( = ?auto_52251 ?auto_52252 ) ) ( not ( = ?auto_52251 ?auto_52256 ) ) ( not ( = ?auto_52252 ?auto_52256 ) ) ( not ( = ?auto_52250 ?auto_52255 ) ) ( not ( = ?auto_52250 ?auto_52254 ) ) ( not ( = ?auto_52251 ?auto_52255 ) ) ( not ( = ?auto_52251 ?auto_52254 ) ) ( not ( = ?auto_52252 ?auto_52255 ) ) ( not ( = ?auto_52252 ?auto_52254 ) ) ( not ( = ?auto_52256 ?auto_52255 ) ) ( not ( = ?auto_52256 ?auto_52254 ) ) ( not ( = ?auto_52255 ?auto_52254 ) ) ( ON ?auto_52255 ?auto_52256 ) ( CLEAR ?auto_52253 ) ( ON-TABLE ?auto_52253 ) ( not ( = ?auto_52253 ?auto_52254 ) ) ( not ( = ?auto_52250 ?auto_52253 ) ) ( not ( = ?auto_52251 ?auto_52253 ) ) ( not ( = ?auto_52252 ?auto_52253 ) ) ( not ( = ?auto_52256 ?auto_52253 ) ) ( not ( = ?auto_52255 ?auto_52253 ) ) ( ON ?auto_52254 ?auto_52255 ) ( CLEAR ?auto_52254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52250 ?auto_52251 ?auto_52252 ?auto_52256 ?auto_52255 )
      ( MAKE-3PILE ?auto_52250 ?auto_52251 ?auto_52252 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52257 - BLOCK
      ?auto_52258 - BLOCK
      ?auto_52259 - BLOCK
    )
    :vars
    (
      ?auto_52263 - BLOCK
      ?auto_52261 - BLOCK
      ?auto_52262 - BLOCK
      ?auto_52260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52263 ?auto_52259 ) ( ON-TABLE ?auto_52257 ) ( ON ?auto_52258 ?auto_52257 ) ( ON ?auto_52259 ?auto_52258 ) ( not ( = ?auto_52257 ?auto_52258 ) ) ( not ( = ?auto_52257 ?auto_52259 ) ) ( not ( = ?auto_52257 ?auto_52263 ) ) ( not ( = ?auto_52258 ?auto_52259 ) ) ( not ( = ?auto_52258 ?auto_52263 ) ) ( not ( = ?auto_52259 ?auto_52263 ) ) ( not ( = ?auto_52257 ?auto_52261 ) ) ( not ( = ?auto_52257 ?auto_52262 ) ) ( not ( = ?auto_52258 ?auto_52261 ) ) ( not ( = ?auto_52258 ?auto_52262 ) ) ( not ( = ?auto_52259 ?auto_52261 ) ) ( not ( = ?auto_52259 ?auto_52262 ) ) ( not ( = ?auto_52263 ?auto_52261 ) ) ( not ( = ?auto_52263 ?auto_52262 ) ) ( not ( = ?auto_52261 ?auto_52262 ) ) ( ON ?auto_52261 ?auto_52263 ) ( not ( = ?auto_52260 ?auto_52262 ) ) ( not ( = ?auto_52257 ?auto_52260 ) ) ( not ( = ?auto_52258 ?auto_52260 ) ) ( not ( = ?auto_52259 ?auto_52260 ) ) ( not ( = ?auto_52263 ?auto_52260 ) ) ( not ( = ?auto_52261 ?auto_52260 ) ) ( ON ?auto_52262 ?auto_52261 ) ( CLEAR ?auto_52262 ) ( HOLDING ?auto_52260 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52260 )
      ( MAKE-3PILE ?auto_52257 ?auto_52258 ?auto_52259 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52264 - BLOCK
      ?auto_52265 - BLOCK
      ?auto_52266 - BLOCK
    )
    :vars
    (
      ?auto_52267 - BLOCK
      ?auto_52270 - BLOCK
      ?auto_52268 - BLOCK
      ?auto_52269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52267 ?auto_52266 ) ( ON-TABLE ?auto_52264 ) ( ON ?auto_52265 ?auto_52264 ) ( ON ?auto_52266 ?auto_52265 ) ( not ( = ?auto_52264 ?auto_52265 ) ) ( not ( = ?auto_52264 ?auto_52266 ) ) ( not ( = ?auto_52264 ?auto_52267 ) ) ( not ( = ?auto_52265 ?auto_52266 ) ) ( not ( = ?auto_52265 ?auto_52267 ) ) ( not ( = ?auto_52266 ?auto_52267 ) ) ( not ( = ?auto_52264 ?auto_52270 ) ) ( not ( = ?auto_52264 ?auto_52268 ) ) ( not ( = ?auto_52265 ?auto_52270 ) ) ( not ( = ?auto_52265 ?auto_52268 ) ) ( not ( = ?auto_52266 ?auto_52270 ) ) ( not ( = ?auto_52266 ?auto_52268 ) ) ( not ( = ?auto_52267 ?auto_52270 ) ) ( not ( = ?auto_52267 ?auto_52268 ) ) ( not ( = ?auto_52270 ?auto_52268 ) ) ( ON ?auto_52270 ?auto_52267 ) ( not ( = ?auto_52269 ?auto_52268 ) ) ( not ( = ?auto_52264 ?auto_52269 ) ) ( not ( = ?auto_52265 ?auto_52269 ) ) ( not ( = ?auto_52266 ?auto_52269 ) ) ( not ( = ?auto_52267 ?auto_52269 ) ) ( not ( = ?auto_52270 ?auto_52269 ) ) ( ON ?auto_52268 ?auto_52270 ) ( ON ?auto_52269 ?auto_52268 ) ( CLEAR ?auto_52269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52264 ?auto_52265 ?auto_52266 ?auto_52267 ?auto_52270 ?auto_52268 )
      ( MAKE-3PILE ?auto_52264 ?auto_52265 ?auto_52266 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52275 - BLOCK
      ?auto_52276 - BLOCK
      ?auto_52277 - BLOCK
      ?auto_52278 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_52278 ) ( CLEAR ?auto_52277 ) ( ON-TABLE ?auto_52275 ) ( ON ?auto_52276 ?auto_52275 ) ( ON ?auto_52277 ?auto_52276 ) ( not ( = ?auto_52275 ?auto_52276 ) ) ( not ( = ?auto_52275 ?auto_52277 ) ) ( not ( = ?auto_52275 ?auto_52278 ) ) ( not ( = ?auto_52276 ?auto_52277 ) ) ( not ( = ?auto_52276 ?auto_52278 ) ) ( not ( = ?auto_52277 ?auto_52278 ) ) )
    :subtasks
    ( ( !STACK ?auto_52278 ?auto_52277 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52279 - BLOCK
      ?auto_52280 - BLOCK
      ?auto_52281 - BLOCK
      ?auto_52282 - BLOCK
    )
    :vars
    (
      ?auto_52283 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_52281 ) ( ON-TABLE ?auto_52279 ) ( ON ?auto_52280 ?auto_52279 ) ( ON ?auto_52281 ?auto_52280 ) ( not ( = ?auto_52279 ?auto_52280 ) ) ( not ( = ?auto_52279 ?auto_52281 ) ) ( not ( = ?auto_52279 ?auto_52282 ) ) ( not ( = ?auto_52280 ?auto_52281 ) ) ( not ( = ?auto_52280 ?auto_52282 ) ) ( not ( = ?auto_52281 ?auto_52282 ) ) ( ON ?auto_52282 ?auto_52283 ) ( CLEAR ?auto_52282 ) ( HAND-EMPTY ) ( not ( = ?auto_52279 ?auto_52283 ) ) ( not ( = ?auto_52280 ?auto_52283 ) ) ( not ( = ?auto_52281 ?auto_52283 ) ) ( not ( = ?auto_52282 ?auto_52283 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52282 ?auto_52283 )
      ( MAKE-4PILE ?auto_52279 ?auto_52280 ?auto_52281 ?auto_52282 ) )
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
    )
    :precondition
    ( and ( ON-TABLE ?auto_52284 ) ( ON ?auto_52285 ?auto_52284 ) ( not ( = ?auto_52284 ?auto_52285 ) ) ( not ( = ?auto_52284 ?auto_52286 ) ) ( not ( = ?auto_52284 ?auto_52287 ) ) ( not ( = ?auto_52285 ?auto_52286 ) ) ( not ( = ?auto_52285 ?auto_52287 ) ) ( not ( = ?auto_52286 ?auto_52287 ) ) ( ON ?auto_52287 ?auto_52288 ) ( CLEAR ?auto_52287 ) ( not ( = ?auto_52284 ?auto_52288 ) ) ( not ( = ?auto_52285 ?auto_52288 ) ) ( not ( = ?auto_52286 ?auto_52288 ) ) ( not ( = ?auto_52287 ?auto_52288 ) ) ( HOLDING ?auto_52286 ) ( CLEAR ?auto_52285 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52284 ?auto_52285 ?auto_52286 )
      ( MAKE-4PILE ?auto_52284 ?auto_52285 ?auto_52286 ?auto_52287 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52289 - BLOCK
      ?auto_52290 - BLOCK
      ?auto_52291 - BLOCK
      ?auto_52292 - BLOCK
    )
    :vars
    (
      ?auto_52293 - BLOCK
      ?auto_52294 - BLOCK
      ?auto_52295 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52289 ) ( ON ?auto_52290 ?auto_52289 ) ( not ( = ?auto_52289 ?auto_52290 ) ) ( not ( = ?auto_52289 ?auto_52291 ) ) ( not ( = ?auto_52289 ?auto_52292 ) ) ( not ( = ?auto_52290 ?auto_52291 ) ) ( not ( = ?auto_52290 ?auto_52292 ) ) ( not ( = ?auto_52291 ?auto_52292 ) ) ( ON ?auto_52292 ?auto_52293 ) ( not ( = ?auto_52289 ?auto_52293 ) ) ( not ( = ?auto_52290 ?auto_52293 ) ) ( not ( = ?auto_52291 ?auto_52293 ) ) ( not ( = ?auto_52292 ?auto_52293 ) ) ( CLEAR ?auto_52290 ) ( ON ?auto_52291 ?auto_52292 ) ( CLEAR ?auto_52291 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52294 ) ( ON ?auto_52295 ?auto_52294 ) ( ON ?auto_52293 ?auto_52295 ) ( not ( = ?auto_52294 ?auto_52295 ) ) ( not ( = ?auto_52294 ?auto_52293 ) ) ( not ( = ?auto_52294 ?auto_52292 ) ) ( not ( = ?auto_52294 ?auto_52291 ) ) ( not ( = ?auto_52295 ?auto_52293 ) ) ( not ( = ?auto_52295 ?auto_52292 ) ) ( not ( = ?auto_52295 ?auto_52291 ) ) ( not ( = ?auto_52289 ?auto_52294 ) ) ( not ( = ?auto_52289 ?auto_52295 ) ) ( not ( = ?auto_52290 ?auto_52294 ) ) ( not ( = ?auto_52290 ?auto_52295 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52294 ?auto_52295 ?auto_52293 ?auto_52292 )
      ( MAKE-4PILE ?auto_52289 ?auto_52290 ?auto_52291 ?auto_52292 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52296 - BLOCK
      ?auto_52297 - BLOCK
      ?auto_52298 - BLOCK
      ?auto_52299 - BLOCK
    )
    :vars
    (
      ?auto_52302 - BLOCK
      ?auto_52300 - BLOCK
      ?auto_52301 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52296 ) ( not ( = ?auto_52296 ?auto_52297 ) ) ( not ( = ?auto_52296 ?auto_52298 ) ) ( not ( = ?auto_52296 ?auto_52299 ) ) ( not ( = ?auto_52297 ?auto_52298 ) ) ( not ( = ?auto_52297 ?auto_52299 ) ) ( not ( = ?auto_52298 ?auto_52299 ) ) ( ON ?auto_52299 ?auto_52302 ) ( not ( = ?auto_52296 ?auto_52302 ) ) ( not ( = ?auto_52297 ?auto_52302 ) ) ( not ( = ?auto_52298 ?auto_52302 ) ) ( not ( = ?auto_52299 ?auto_52302 ) ) ( ON ?auto_52298 ?auto_52299 ) ( CLEAR ?auto_52298 ) ( ON-TABLE ?auto_52300 ) ( ON ?auto_52301 ?auto_52300 ) ( ON ?auto_52302 ?auto_52301 ) ( not ( = ?auto_52300 ?auto_52301 ) ) ( not ( = ?auto_52300 ?auto_52302 ) ) ( not ( = ?auto_52300 ?auto_52299 ) ) ( not ( = ?auto_52300 ?auto_52298 ) ) ( not ( = ?auto_52301 ?auto_52302 ) ) ( not ( = ?auto_52301 ?auto_52299 ) ) ( not ( = ?auto_52301 ?auto_52298 ) ) ( not ( = ?auto_52296 ?auto_52300 ) ) ( not ( = ?auto_52296 ?auto_52301 ) ) ( not ( = ?auto_52297 ?auto_52300 ) ) ( not ( = ?auto_52297 ?auto_52301 ) ) ( HOLDING ?auto_52297 ) ( CLEAR ?auto_52296 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52296 ?auto_52297 )
      ( MAKE-4PILE ?auto_52296 ?auto_52297 ?auto_52298 ?auto_52299 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52303 - BLOCK
      ?auto_52304 - BLOCK
      ?auto_52305 - BLOCK
      ?auto_52306 - BLOCK
    )
    :vars
    (
      ?auto_52308 - BLOCK
      ?auto_52307 - BLOCK
      ?auto_52309 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52303 ) ( not ( = ?auto_52303 ?auto_52304 ) ) ( not ( = ?auto_52303 ?auto_52305 ) ) ( not ( = ?auto_52303 ?auto_52306 ) ) ( not ( = ?auto_52304 ?auto_52305 ) ) ( not ( = ?auto_52304 ?auto_52306 ) ) ( not ( = ?auto_52305 ?auto_52306 ) ) ( ON ?auto_52306 ?auto_52308 ) ( not ( = ?auto_52303 ?auto_52308 ) ) ( not ( = ?auto_52304 ?auto_52308 ) ) ( not ( = ?auto_52305 ?auto_52308 ) ) ( not ( = ?auto_52306 ?auto_52308 ) ) ( ON ?auto_52305 ?auto_52306 ) ( ON-TABLE ?auto_52307 ) ( ON ?auto_52309 ?auto_52307 ) ( ON ?auto_52308 ?auto_52309 ) ( not ( = ?auto_52307 ?auto_52309 ) ) ( not ( = ?auto_52307 ?auto_52308 ) ) ( not ( = ?auto_52307 ?auto_52306 ) ) ( not ( = ?auto_52307 ?auto_52305 ) ) ( not ( = ?auto_52309 ?auto_52308 ) ) ( not ( = ?auto_52309 ?auto_52306 ) ) ( not ( = ?auto_52309 ?auto_52305 ) ) ( not ( = ?auto_52303 ?auto_52307 ) ) ( not ( = ?auto_52303 ?auto_52309 ) ) ( not ( = ?auto_52304 ?auto_52307 ) ) ( not ( = ?auto_52304 ?auto_52309 ) ) ( CLEAR ?auto_52303 ) ( ON ?auto_52304 ?auto_52305 ) ( CLEAR ?auto_52304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52307 ?auto_52309 ?auto_52308 ?auto_52306 ?auto_52305 )
      ( MAKE-4PILE ?auto_52303 ?auto_52304 ?auto_52305 ?auto_52306 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52310 - BLOCK
      ?auto_52311 - BLOCK
      ?auto_52312 - BLOCK
      ?auto_52313 - BLOCK
    )
    :vars
    (
      ?auto_52316 - BLOCK
      ?auto_52314 - BLOCK
      ?auto_52315 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52310 ?auto_52311 ) ) ( not ( = ?auto_52310 ?auto_52312 ) ) ( not ( = ?auto_52310 ?auto_52313 ) ) ( not ( = ?auto_52311 ?auto_52312 ) ) ( not ( = ?auto_52311 ?auto_52313 ) ) ( not ( = ?auto_52312 ?auto_52313 ) ) ( ON ?auto_52313 ?auto_52316 ) ( not ( = ?auto_52310 ?auto_52316 ) ) ( not ( = ?auto_52311 ?auto_52316 ) ) ( not ( = ?auto_52312 ?auto_52316 ) ) ( not ( = ?auto_52313 ?auto_52316 ) ) ( ON ?auto_52312 ?auto_52313 ) ( ON-TABLE ?auto_52314 ) ( ON ?auto_52315 ?auto_52314 ) ( ON ?auto_52316 ?auto_52315 ) ( not ( = ?auto_52314 ?auto_52315 ) ) ( not ( = ?auto_52314 ?auto_52316 ) ) ( not ( = ?auto_52314 ?auto_52313 ) ) ( not ( = ?auto_52314 ?auto_52312 ) ) ( not ( = ?auto_52315 ?auto_52316 ) ) ( not ( = ?auto_52315 ?auto_52313 ) ) ( not ( = ?auto_52315 ?auto_52312 ) ) ( not ( = ?auto_52310 ?auto_52314 ) ) ( not ( = ?auto_52310 ?auto_52315 ) ) ( not ( = ?auto_52311 ?auto_52314 ) ) ( not ( = ?auto_52311 ?auto_52315 ) ) ( ON ?auto_52311 ?auto_52312 ) ( CLEAR ?auto_52311 ) ( HOLDING ?auto_52310 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52310 )
      ( MAKE-4PILE ?auto_52310 ?auto_52311 ?auto_52312 ?auto_52313 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52317 - BLOCK
      ?auto_52318 - BLOCK
      ?auto_52319 - BLOCK
      ?auto_52320 - BLOCK
    )
    :vars
    (
      ?auto_52321 - BLOCK
      ?auto_52322 - BLOCK
      ?auto_52323 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52317 ?auto_52318 ) ) ( not ( = ?auto_52317 ?auto_52319 ) ) ( not ( = ?auto_52317 ?auto_52320 ) ) ( not ( = ?auto_52318 ?auto_52319 ) ) ( not ( = ?auto_52318 ?auto_52320 ) ) ( not ( = ?auto_52319 ?auto_52320 ) ) ( ON ?auto_52320 ?auto_52321 ) ( not ( = ?auto_52317 ?auto_52321 ) ) ( not ( = ?auto_52318 ?auto_52321 ) ) ( not ( = ?auto_52319 ?auto_52321 ) ) ( not ( = ?auto_52320 ?auto_52321 ) ) ( ON ?auto_52319 ?auto_52320 ) ( ON-TABLE ?auto_52322 ) ( ON ?auto_52323 ?auto_52322 ) ( ON ?auto_52321 ?auto_52323 ) ( not ( = ?auto_52322 ?auto_52323 ) ) ( not ( = ?auto_52322 ?auto_52321 ) ) ( not ( = ?auto_52322 ?auto_52320 ) ) ( not ( = ?auto_52322 ?auto_52319 ) ) ( not ( = ?auto_52323 ?auto_52321 ) ) ( not ( = ?auto_52323 ?auto_52320 ) ) ( not ( = ?auto_52323 ?auto_52319 ) ) ( not ( = ?auto_52317 ?auto_52322 ) ) ( not ( = ?auto_52317 ?auto_52323 ) ) ( not ( = ?auto_52318 ?auto_52322 ) ) ( not ( = ?auto_52318 ?auto_52323 ) ) ( ON ?auto_52318 ?auto_52319 ) ( ON ?auto_52317 ?auto_52318 ) ( CLEAR ?auto_52317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52322 ?auto_52323 ?auto_52321 ?auto_52320 ?auto_52319 ?auto_52318 )
      ( MAKE-4PILE ?auto_52317 ?auto_52318 ?auto_52319 ?auto_52320 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52326 - BLOCK
      ?auto_52327 - BLOCK
    )
    :vars
    (
      ?auto_52328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52328 ?auto_52327 ) ( CLEAR ?auto_52328 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52326 ) ( ON ?auto_52327 ?auto_52326 ) ( not ( = ?auto_52326 ?auto_52327 ) ) ( not ( = ?auto_52326 ?auto_52328 ) ) ( not ( = ?auto_52327 ?auto_52328 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52328 ?auto_52327 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52329 - BLOCK
      ?auto_52330 - BLOCK
    )
    :vars
    (
      ?auto_52331 - BLOCK
      ?auto_52332 - BLOCK
      ?auto_52333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52331 ?auto_52330 ) ( CLEAR ?auto_52331 ) ( ON-TABLE ?auto_52329 ) ( ON ?auto_52330 ?auto_52329 ) ( not ( = ?auto_52329 ?auto_52330 ) ) ( not ( = ?auto_52329 ?auto_52331 ) ) ( not ( = ?auto_52330 ?auto_52331 ) ) ( HOLDING ?auto_52332 ) ( CLEAR ?auto_52333 ) ( not ( = ?auto_52329 ?auto_52332 ) ) ( not ( = ?auto_52329 ?auto_52333 ) ) ( not ( = ?auto_52330 ?auto_52332 ) ) ( not ( = ?auto_52330 ?auto_52333 ) ) ( not ( = ?auto_52331 ?auto_52332 ) ) ( not ( = ?auto_52331 ?auto_52333 ) ) ( not ( = ?auto_52332 ?auto_52333 ) ) )
    :subtasks
    ( ( !STACK ?auto_52332 ?auto_52333 )
      ( MAKE-2PILE ?auto_52329 ?auto_52330 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52334 - BLOCK
      ?auto_52335 - BLOCK
    )
    :vars
    (
      ?auto_52337 - BLOCK
      ?auto_52336 - BLOCK
      ?auto_52338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52337 ?auto_52335 ) ( ON-TABLE ?auto_52334 ) ( ON ?auto_52335 ?auto_52334 ) ( not ( = ?auto_52334 ?auto_52335 ) ) ( not ( = ?auto_52334 ?auto_52337 ) ) ( not ( = ?auto_52335 ?auto_52337 ) ) ( CLEAR ?auto_52336 ) ( not ( = ?auto_52334 ?auto_52338 ) ) ( not ( = ?auto_52334 ?auto_52336 ) ) ( not ( = ?auto_52335 ?auto_52338 ) ) ( not ( = ?auto_52335 ?auto_52336 ) ) ( not ( = ?auto_52337 ?auto_52338 ) ) ( not ( = ?auto_52337 ?auto_52336 ) ) ( not ( = ?auto_52338 ?auto_52336 ) ) ( ON ?auto_52338 ?auto_52337 ) ( CLEAR ?auto_52338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52334 ?auto_52335 ?auto_52337 )
      ( MAKE-2PILE ?auto_52334 ?auto_52335 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52339 - BLOCK
      ?auto_52340 - BLOCK
    )
    :vars
    (
      ?auto_52343 - BLOCK
      ?auto_52341 - BLOCK
      ?auto_52342 - BLOCK
      ?auto_52344 - BLOCK
      ?auto_52345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52343 ?auto_52340 ) ( ON-TABLE ?auto_52339 ) ( ON ?auto_52340 ?auto_52339 ) ( not ( = ?auto_52339 ?auto_52340 ) ) ( not ( = ?auto_52339 ?auto_52343 ) ) ( not ( = ?auto_52340 ?auto_52343 ) ) ( not ( = ?auto_52339 ?auto_52341 ) ) ( not ( = ?auto_52339 ?auto_52342 ) ) ( not ( = ?auto_52340 ?auto_52341 ) ) ( not ( = ?auto_52340 ?auto_52342 ) ) ( not ( = ?auto_52343 ?auto_52341 ) ) ( not ( = ?auto_52343 ?auto_52342 ) ) ( not ( = ?auto_52341 ?auto_52342 ) ) ( ON ?auto_52341 ?auto_52343 ) ( CLEAR ?auto_52341 ) ( HOLDING ?auto_52342 ) ( CLEAR ?auto_52344 ) ( ON-TABLE ?auto_52345 ) ( ON ?auto_52344 ?auto_52345 ) ( not ( = ?auto_52345 ?auto_52344 ) ) ( not ( = ?auto_52345 ?auto_52342 ) ) ( not ( = ?auto_52344 ?auto_52342 ) ) ( not ( = ?auto_52339 ?auto_52344 ) ) ( not ( = ?auto_52339 ?auto_52345 ) ) ( not ( = ?auto_52340 ?auto_52344 ) ) ( not ( = ?auto_52340 ?auto_52345 ) ) ( not ( = ?auto_52343 ?auto_52344 ) ) ( not ( = ?auto_52343 ?auto_52345 ) ) ( not ( = ?auto_52341 ?auto_52344 ) ) ( not ( = ?auto_52341 ?auto_52345 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52345 ?auto_52344 ?auto_52342 )
      ( MAKE-2PILE ?auto_52339 ?auto_52340 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52346 - BLOCK
      ?auto_52347 - BLOCK
    )
    :vars
    (
      ?auto_52348 - BLOCK
      ?auto_52352 - BLOCK
      ?auto_52350 - BLOCK
      ?auto_52351 - BLOCK
      ?auto_52349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52348 ?auto_52347 ) ( ON-TABLE ?auto_52346 ) ( ON ?auto_52347 ?auto_52346 ) ( not ( = ?auto_52346 ?auto_52347 ) ) ( not ( = ?auto_52346 ?auto_52348 ) ) ( not ( = ?auto_52347 ?auto_52348 ) ) ( not ( = ?auto_52346 ?auto_52352 ) ) ( not ( = ?auto_52346 ?auto_52350 ) ) ( not ( = ?auto_52347 ?auto_52352 ) ) ( not ( = ?auto_52347 ?auto_52350 ) ) ( not ( = ?auto_52348 ?auto_52352 ) ) ( not ( = ?auto_52348 ?auto_52350 ) ) ( not ( = ?auto_52352 ?auto_52350 ) ) ( ON ?auto_52352 ?auto_52348 ) ( CLEAR ?auto_52351 ) ( ON-TABLE ?auto_52349 ) ( ON ?auto_52351 ?auto_52349 ) ( not ( = ?auto_52349 ?auto_52351 ) ) ( not ( = ?auto_52349 ?auto_52350 ) ) ( not ( = ?auto_52351 ?auto_52350 ) ) ( not ( = ?auto_52346 ?auto_52351 ) ) ( not ( = ?auto_52346 ?auto_52349 ) ) ( not ( = ?auto_52347 ?auto_52351 ) ) ( not ( = ?auto_52347 ?auto_52349 ) ) ( not ( = ?auto_52348 ?auto_52351 ) ) ( not ( = ?auto_52348 ?auto_52349 ) ) ( not ( = ?auto_52352 ?auto_52351 ) ) ( not ( = ?auto_52352 ?auto_52349 ) ) ( ON ?auto_52350 ?auto_52352 ) ( CLEAR ?auto_52350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52346 ?auto_52347 ?auto_52348 ?auto_52352 )
      ( MAKE-2PILE ?auto_52346 ?auto_52347 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52353 - BLOCK
      ?auto_52354 - BLOCK
    )
    :vars
    (
      ?auto_52355 - BLOCK
      ?auto_52358 - BLOCK
      ?auto_52356 - BLOCK
      ?auto_52357 - BLOCK
      ?auto_52359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52355 ?auto_52354 ) ( ON-TABLE ?auto_52353 ) ( ON ?auto_52354 ?auto_52353 ) ( not ( = ?auto_52353 ?auto_52354 ) ) ( not ( = ?auto_52353 ?auto_52355 ) ) ( not ( = ?auto_52354 ?auto_52355 ) ) ( not ( = ?auto_52353 ?auto_52358 ) ) ( not ( = ?auto_52353 ?auto_52356 ) ) ( not ( = ?auto_52354 ?auto_52358 ) ) ( not ( = ?auto_52354 ?auto_52356 ) ) ( not ( = ?auto_52355 ?auto_52358 ) ) ( not ( = ?auto_52355 ?auto_52356 ) ) ( not ( = ?auto_52358 ?auto_52356 ) ) ( ON ?auto_52358 ?auto_52355 ) ( ON-TABLE ?auto_52357 ) ( not ( = ?auto_52357 ?auto_52359 ) ) ( not ( = ?auto_52357 ?auto_52356 ) ) ( not ( = ?auto_52359 ?auto_52356 ) ) ( not ( = ?auto_52353 ?auto_52359 ) ) ( not ( = ?auto_52353 ?auto_52357 ) ) ( not ( = ?auto_52354 ?auto_52359 ) ) ( not ( = ?auto_52354 ?auto_52357 ) ) ( not ( = ?auto_52355 ?auto_52359 ) ) ( not ( = ?auto_52355 ?auto_52357 ) ) ( not ( = ?auto_52358 ?auto_52359 ) ) ( not ( = ?auto_52358 ?auto_52357 ) ) ( ON ?auto_52356 ?auto_52358 ) ( CLEAR ?auto_52356 ) ( HOLDING ?auto_52359 ) ( CLEAR ?auto_52357 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52357 ?auto_52359 )
      ( MAKE-2PILE ?auto_52353 ?auto_52354 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52360 - BLOCK
      ?auto_52361 - BLOCK
    )
    :vars
    (
      ?auto_52366 - BLOCK
      ?auto_52362 - BLOCK
      ?auto_52364 - BLOCK
      ?auto_52365 - BLOCK
      ?auto_52363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52366 ?auto_52361 ) ( ON-TABLE ?auto_52360 ) ( ON ?auto_52361 ?auto_52360 ) ( not ( = ?auto_52360 ?auto_52361 ) ) ( not ( = ?auto_52360 ?auto_52366 ) ) ( not ( = ?auto_52361 ?auto_52366 ) ) ( not ( = ?auto_52360 ?auto_52362 ) ) ( not ( = ?auto_52360 ?auto_52364 ) ) ( not ( = ?auto_52361 ?auto_52362 ) ) ( not ( = ?auto_52361 ?auto_52364 ) ) ( not ( = ?auto_52366 ?auto_52362 ) ) ( not ( = ?auto_52366 ?auto_52364 ) ) ( not ( = ?auto_52362 ?auto_52364 ) ) ( ON ?auto_52362 ?auto_52366 ) ( ON-TABLE ?auto_52365 ) ( not ( = ?auto_52365 ?auto_52363 ) ) ( not ( = ?auto_52365 ?auto_52364 ) ) ( not ( = ?auto_52363 ?auto_52364 ) ) ( not ( = ?auto_52360 ?auto_52363 ) ) ( not ( = ?auto_52360 ?auto_52365 ) ) ( not ( = ?auto_52361 ?auto_52363 ) ) ( not ( = ?auto_52361 ?auto_52365 ) ) ( not ( = ?auto_52366 ?auto_52363 ) ) ( not ( = ?auto_52366 ?auto_52365 ) ) ( not ( = ?auto_52362 ?auto_52363 ) ) ( not ( = ?auto_52362 ?auto_52365 ) ) ( ON ?auto_52364 ?auto_52362 ) ( CLEAR ?auto_52365 ) ( ON ?auto_52363 ?auto_52364 ) ( CLEAR ?auto_52363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52360 ?auto_52361 ?auto_52366 ?auto_52362 ?auto_52364 )
      ( MAKE-2PILE ?auto_52360 ?auto_52361 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52367 - BLOCK
      ?auto_52368 - BLOCK
    )
    :vars
    (
      ?auto_52369 - BLOCK
      ?auto_52372 - BLOCK
      ?auto_52373 - BLOCK
      ?auto_52370 - BLOCK
      ?auto_52371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52369 ?auto_52368 ) ( ON-TABLE ?auto_52367 ) ( ON ?auto_52368 ?auto_52367 ) ( not ( = ?auto_52367 ?auto_52368 ) ) ( not ( = ?auto_52367 ?auto_52369 ) ) ( not ( = ?auto_52368 ?auto_52369 ) ) ( not ( = ?auto_52367 ?auto_52372 ) ) ( not ( = ?auto_52367 ?auto_52373 ) ) ( not ( = ?auto_52368 ?auto_52372 ) ) ( not ( = ?auto_52368 ?auto_52373 ) ) ( not ( = ?auto_52369 ?auto_52372 ) ) ( not ( = ?auto_52369 ?auto_52373 ) ) ( not ( = ?auto_52372 ?auto_52373 ) ) ( ON ?auto_52372 ?auto_52369 ) ( not ( = ?auto_52370 ?auto_52371 ) ) ( not ( = ?auto_52370 ?auto_52373 ) ) ( not ( = ?auto_52371 ?auto_52373 ) ) ( not ( = ?auto_52367 ?auto_52371 ) ) ( not ( = ?auto_52367 ?auto_52370 ) ) ( not ( = ?auto_52368 ?auto_52371 ) ) ( not ( = ?auto_52368 ?auto_52370 ) ) ( not ( = ?auto_52369 ?auto_52371 ) ) ( not ( = ?auto_52369 ?auto_52370 ) ) ( not ( = ?auto_52372 ?auto_52371 ) ) ( not ( = ?auto_52372 ?auto_52370 ) ) ( ON ?auto_52373 ?auto_52372 ) ( ON ?auto_52371 ?auto_52373 ) ( CLEAR ?auto_52371 ) ( HOLDING ?auto_52370 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52370 )
      ( MAKE-2PILE ?auto_52367 ?auto_52368 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52374 - BLOCK
      ?auto_52375 - BLOCK
    )
    :vars
    (
      ?auto_52376 - BLOCK
      ?auto_52377 - BLOCK
      ?auto_52379 - BLOCK
      ?auto_52378 - BLOCK
      ?auto_52380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52376 ?auto_52375 ) ( ON-TABLE ?auto_52374 ) ( ON ?auto_52375 ?auto_52374 ) ( not ( = ?auto_52374 ?auto_52375 ) ) ( not ( = ?auto_52374 ?auto_52376 ) ) ( not ( = ?auto_52375 ?auto_52376 ) ) ( not ( = ?auto_52374 ?auto_52377 ) ) ( not ( = ?auto_52374 ?auto_52379 ) ) ( not ( = ?auto_52375 ?auto_52377 ) ) ( not ( = ?auto_52375 ?auto_52379 ) ) ( not ( = ?auto_52376 ?auto_52377 ) ) ( not ( = ?auto_52376 ?auto_52379 ) ) ( not ( = ?auto_52377 ?auto_52379 ) ) ( ON ?auto_52377 ?auto_52376 ) ( not ( = ?auto_52378 ?auto_52380 ) ) ( not ( = ?auto_52378 ?auto_52379 ) ) ( not ( = ?auto_52380 ?auto_52379 ) ) ( not ( = ?auto_52374 ?auto_52380 ) ) ( not ( = ?auto_52374 ?auto_52378 ) ) ( not ( = ?auto_52375 ?auto_52380 ) ) ( not ( = ?auto_52375 ?auto_52378 ) ) ( not ( = ?auto_52376 ?auto_52380 ) ) ( not ( = ?auto_52376 ?auto_52378 ) ) ( not ( = ?auto_52377 ?auto_52380 ) ) ( not ( = ?auto_52377 ?auto_52378 ) ) ( ON ?auto_52379 ?auto_52377 ) ( ON ?auto_52380 ?auto_52379 ) ( ON ?auto_52378 ?auto_52380 ) ( CLEAR ?auto_52378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52374 ?auto_52375 ?auto_52376 ?auto_52377 ?auto_52379 ?auto_52380 )
      ( MAKE-2PILE ?auto_52374 ?auto_52375 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52386 - BLOCK
      ?auto_52387 - BLOCK
      ?auto_52388 - BLOCK
      ?auto_52389 - BLOCK
      ?auto_52390 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_52390 ) ( CLEAR ?auto_52389 ) ( ON-TABLE ?auto_52386 ) ( ON ?auto_52387 ?auto_52386 ) ( ON ?auto_52388 ?auto_52387 ) ( ON ?auto_52389 ?auto_52388 ) ( not ( = ?auto_52386 ?auto_52387 ) ) ( not ( = ?auto_52386 ?auto_52388 ) ) ( not ( = ?auto_52386 ?auto_52389 ) ) ( not ( = ?auto_52386 ?auto_52390 ) ) ( not ( = ?auto_52387 ?auto_52388 ) ) ( not ( = ?auto_52387 ?auto_52389 ) ) ( not ( = ?auto_52387 ?auto_52390 ) ) ( not ( = ?auto_52388 ?auto_52389 ) ) ( not ( = ?auto_52388 ?auto_52390 ) ) ( not ( = ?auto_52389 ?auto_52390 ) ) )
    :subtasks
    ( ( !STACK ?auto_52390 ?auto_52389 ) )
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
    )
    :precondition
    ( and ( CLEAR ?auto_52394 ) ( ON-TABLE ?auto_52391 ) ( ON ?auto_52392 ?auto_52391 ) ( ON ?auto_52393 ?auto_52392 ) ( ON ?auto_52394 ?auto_52393 ) ( not ( = ?auto_52391 ?auto_52392 ) ) ( not ( = ?auto_52391 ?auto_52393 ) ) ( not ( = ?auto_52391 ?auto_52394 ) ) ( not ( = ?auto_52391 ?auto_52395 ) ) ( not ( = ?auto_52392 ?auto_52393 ) ) ( not ( = ?auto_52392 ?auto_52394 ) ) ( not ( = ?auto_52392 ?auto_52395 ) ) ( not ( = ?auto_52393 ?auto_52394 ) ) ( not ( = ?auto_52393 ?auto_52395 ) ) ( not ( = ?auto_52394 ?auto_52395 ) ) ( ON ?auto_52395 ?auto_52396 ) ( CLEAR ?auto_52395 ) ( HAND-EMPTY ) ( not ( = ?auto_52391 ?auto_52396 ) ) ( not ( = ?auto_52392 ?auto_52396 ) ) ( not ( = ?auto_52393 ?auto_52396 ) ) ( not ( = ?auto_52394 ?auto_52396 ) ) ( not ( = ?auto_52395 ?auto_52396 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52395 ?auto_52396 )
      ( MAKE-5PILE ?auto_52391 ?auto_52392 ?auto_52393 ?auto_52394 ?auto_52395 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52397 - BLOCK
      ?auto_52398 - BLOCK
      ?auto_52399 - BLOCK
      ?auto_52400 - BLOCK
      ?auto_52401 - BLOCK
    )
    :vars
    (
      ?auto_52402 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52397 ) ( ON ?auto_52398 ?auto_52397 ) ( ON ?auto_52399 ?auto_52398 ) ( not ( = ?auto_52397 ?auto_52398 ) ) ( not ( = ?auto_52397 ?auto_52399 ) ) ( not ( = ?auto_52397 ?auto_52400 ) ) ( not ( = ?auto_52397 ?auto_52401 ) ) ( not ( = ?auto_52398 ?auto_52399 ) ) ( not ( = ?auto_52398 ?auto_52400 ) ) ( not ( = ?auto_52398 ?auto_52401 ) ) ( not ( = ?auto_52399 ?auto_52400 ) ) ( not ( = ?auto_52399 ?auto_52401 ) ) ( not ( = ?auto_52400 ?auto_52401 ) ) ( ON ?auto_52401 ?auto_52402 ) ( CLEAR ?auto_52401 ) ( not ( = ?auto_52397 ?auto_52402 ) ) ( not ( = ?auto_52398 ?auto_52402 ) ) ( not ( = ?auto_52399 ?auto_52402 ) ) ( not ( = ?auto_52400 ?auto_52402 ) ) ( not ( = ?auto_52401 ?auto_52402 ) ) ( HOLDING ?auto_52400 ) ( CLEAR ?auto_52399 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52397 ?auto_52398 ?auto_52399 ?auto_52400 )
      ( MAKE-5PILE ?auto_52397 ?auto_52398 ?auto_52399 ?auto_52400 ?auto_52401 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52403 - BLOCK
      ?auto_52404 - BLOCK
      ?auto_52405 - BLOCK
      ?auto_52406 - BLOCK
      ?auto_52407 - BLOCK
    )
    :vars
    (
      ?auto_52408 - BLOCK
      ?auto_52409 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52403 ) ( ON ?auto_52404 ?auto_52403 ) ( ON ?auto_52405 ?auto_52404 ) ( not ( = ?auto_52403 ?auto_52404 ) ) ( not ( = ?auto_52403 ?auto_52405 ) ) ( not ( = ?auto_52403 ?auto_52406 ) ) ( not ( = ?auto_52403 ?auto_52407 ) ) ( not ( = ?auto_52404 ?auto_52405 ) ) ( not ( = ?auto_52404 ?auto_52406 ) ) ( not ( = ?auto_52404 ?auto_52407 ) ) ( not ( = ?auto_52405 ?auto_52406 ) ) ( not ( = ?auto_52405 ?auto_52407 ) ) ( not ( = ?auto_52406 ?auto_52407 ) ) ( ON ?auto_52407 ?auto_52408 ) ( not ( = ?auto_52403 ?auto_52408 ) ) ( not ( = ?auto_52404 ?auto_52408 ) ) ( not ( = ?auto_52405 ?auto_52408 ) ) ( not ( = ?auto_52406 ?auto_52408 ) ) ( not ( = ?auto_52407 ?auto_52408 ) ) ( CLEAR ?auto_52405 ) ( ON ?auto_52406 ?auto_52407 ) ( CLEAR ?auto_52406 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52409 ) ( ON ?auto_52408 ?auto_52409 ) ( not ( = ?auto_52409 ?auto_52408 ) ) ( not ( = ?auto_52409 ?auto_52407 ) ) ( not ( = ?auto_52409 ?auto_52406 ) ) ( not ( = ?auto_52403 ?auto_52409 ) ) ( not ( = ?auto_52404 ?auto_52409 ) ) ( not ( = ?auto_52405 ?auto_52409 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52409 ?auto_52408 ?auto_52407 )
      ( MAKE-5PILE ?auto_52403 ?auto_52404 ?auto_52405 ?auto_52406 ?auto_52407 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52410 - BLOCK
      ?auto_52411 - BLOCK
      ?auto_52412 - BLOCK
      ?auto_52413 - BLOCK
      ?auto_52414 - BLOCK
    )
    :vars
    (
      ?auto_52415 - BLOCK
      ?auto_52416 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52410 ) ( ON ?auto_52411 ?auto_52410 ) ( not ( = ?auto_52410 ?auto_52411 ) ) ( not ( = ?auto_52410 ?auto_52412 ) ) ( not ( = ?auto_52410 ?auto_52413 ) ) ( not ( = ?auto_52410 ?auto_52414 ) ) ( not ( = ?auto_52411 ?auto_52412 ) ) ( not ( = ?auto_52411 ?auto_52413 ) ) ( not ( = ?auto_52411 ?auto_52414 ) ) ( not ( = ?auto_52412 ?auto_52413 ) ) ( not ( = ?auto_52412 ?auto_52414 ) ) ( not ( = ?auto_52413 ?auto_52414 ) ) ( ON ?auto_52414 ?auto_52415 ) ( not ( = ?auto_52410 ?auto_52415 ) ) ( not ( = ?auto_52411 ?auto_52415 ) ) ( not ( = ?auto_52412 ?auto_52415 ) ) ( not ( = ?auto_52413 ?auto_52415 ) ) ( not ( = ?auto_52414 ?auto_52415 ) ) ( ON ?auto_52413 ?auto_52414 ) ( CLEAR ?auto_52413 ) ( ON-TABLE ?auto_52416 ) ( ON ?auto_52415 ?auto_52416 ) ( not ( = ?auto_52416 ?auto_52415 ) ) ( not ( = ?auto_52416 ?auto_52414 ) ) ( not ( = ?auto_52416 ?auto_52413 ) ) ( not ( = ?auto_52410 ?auto_52416 ) ) ( not ( = ?auto_52411 ?auto_52416 ) ) ( not ( = ?auto_52412 ?auto_52416 ) ) ( HOLDING ?auto_52412 ) ( CLEAR ?auto_52411 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52410 ?auto_52411 ?auto_52412 )
      ( MAKE-5PILE ?auto_52410 ?auto_52411 ?auto_52412 ?auto_52413 ?auto_52414 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52417 - BLOCK
      ?auto_52418 - BLOCK
      ?auto_52419 - BLOCK
      ?auto_52420 - BLOCK
      ?auto_52421 - BLOCK
    )
    :vars
    (
      ?auto_52422 - BLOCK
      ?auto_52423 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52417 ) ( ON ?auto_52418 ?auto_52417 ) ( not ( = ?auto_52417 ?auto_52418 ) ) ( not ( = ?auto_52417 ?auto_52419 ) ) ( not ( = ?auto_52417 ?auto_52420 ) ) ( not ( = ?auto_52417 ?auto_52421 ) ) ( not ( = ?auto_52418 ?auto_52419 ) ) ( not ( = ?auto_52418 ?auto_52420 ) ) ( not ( = ?auto_52418 ?auto_52421 ) ) ( not ( = ?auto_52419 ?auto_52420 ) ) ( not ( = ?auto_52419 ?auto_52421 ) ) ( not ( = ?auto_52420 ?auto_52421 ) ) ( ON ?auto_52421 ?auto_52422 ) ( not ( = ?auto_52417 ?auto_52422 ) ) ( not ( = ?auto_52418 ?auto_52422 ) ) ( not ( = ?auto_52419 ?auto_52422 ) ) ( not ( = ?auto_52420 ?auto_52422 ) ) ( not ( = ?auto_52421 ?auto_52422 ) ) ( ON ?auto_52420 ?auto_52421 ) ( ON-TABLE ?auto_52423 ) ( ON ?auto_52422 ?auto_52423 ) ( not ( = ?auto_52423 ?auto_52422 ) ) ( not ( = ?auto_52423 ?auto_52421 ) ) ( not ( = ?auto_52423 ?auto_52420 ) ) ( not ( = ?auto_52417 ?auto_52423 ) ) ( not ( = ?auto_52418 ?auto_52423 ) ) ( not ( = ?auto_52419 ?auto_52423 ) ) ( CLEAR ?auto_52418 ) ( ON ?auto_52419 ?auto_52420 ) ( CLEAR ?auto_52419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52423 ?auto_52422 ?auto_52421 ?auto_52420 )
      ( MAKE-5PILE ?auto_52417 ?auto_52418 ?auto_52419 ?auto_52420 ?auto_52421 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52424 - BLOCK
      ?auto_52425 - BLOCK
      ?auto_52426 - BLOCK
      ?auto_52427 - BLOCK
      ?auto_52428 - BLOCK
    )
    :vars
    (
      ?auto_52430 - BLOCK
      ?auto_52429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52424 ) ( not ( = ?auto_52424 ?auto_52425 ) ) ( not ( = ?auto_52424 ?auto_52426 ) ) ( not ( = ?auto_52424 ?auto_52427 ) ) ( not ( = ?auto_52424 ?auto_52428 ) ) ( not ( = ?auto_52425 ?auto_52426 ) ) ( not ( = ?auto_52425 ?auto_52427 ) ) ( not ( = ?auto_52425 ?auto_52428 ) ) ( not ( = ?auto_52426 ?auto_52427 ) ) ( not ( = ?auto_52426 ?auto_52428 ) ) ( not ( = ?auto_52427 ?auto_52428 ) ) ( ON ?auto_52428 ?auto_52430 ) ( not ( = ?auto_52424 ?auto_52430 ) ) ( not ( = ?auto_52425 ?auto_52430 ) ) ( not ( = ?auto_52426 ?auto_52430 ) ) ( not ( = ?auto_52427 ?auto_52430 ) ) ( not ( = ?auto_52428 ?auto_52430 ) ) ( ON ?auto_52427 ?auto_52428 ) ( ON-TABLE ?auto_52429 ) ( ON ?auto_52430 ?auto_52429 ) ( not ( = ?auto_52429 ?auto_52430 ) ) ( not ( = ?auto_52429 ?auto_52428 ) ) ( not ( = ?auto_52429 ?auto_52427 ) ) ( not ( = ?auto_52424 ?auto_52429 ) ) ( not ( = ?auto_52425 ?auto_52429 ) ) ( not ( = ?auto_52426 ?auto_52429 ) ) ( ON ?auto_52426 ?auto_52427 ) ( CLEAR ?auto_52426 ) ( HOLDING ?auto_52425 ) ( CLEAR ?auto_52424 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52424 ?auto_52425 )
      ( MAKE-5PILE ?auto_52424 ?auto_52425 ?auto_52426 ?auto_52427 ?auto_52428 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52431 - BLOCK
      ?auto_52432 - BLOCK
      ?auto_52433 - BLOCK
      ?auto_52434 - BLOCK
      ?auto_52435 - BLOCK
    )
    :vars
    (
      ?auto_52436 - BLOCK
      ?auto_52437 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52431 ) ( not ( = ?auto_52431 ?auto_52432 ) ) ( not ( = ?auto_52431 ?auto_52433 ) ) ( not ( = ?auto_52431 ?auto_52434 ) ) ( not ( = ?auto_52431 ?auto_52435 ) ) ( not ( = ?auto_52432 ?auto_52433 ) ) ( not ( = ?auto_52432 ?auto_52434 ) ) ( not ( = ?auto_52432 ?auto_52435 ) ) ( not ( = ?auto_52433 ?auto_52434 ) ) ( not ( = ?auto_52433 ?auto_52435 ) ) ( not ( = ?auto_52434 ?auto_52435 ) ) ( ON ?auto_52435 ?auto_52436 ) ( not ( = ?auto_52431 ?auto_52436 ) ) ( not ( = ?auto_52432 ?auto_52436 ) ) ( not ( = ?auto_52433 ?auto_52436 ) ) ( not ( = ?auto_52434 ?auto_52436 ) ) ( not ( = ?auto_52435 ?auto_52436 ) ) ( ON ?auto_52434 ?auto_52435 ) ( ON-TABLE ?auto_52437 ) ( ON ?auto_52436 ?auto_52437 ) ( not ( = ?auto_52437 ?auto_52436 ) ) ( not ( = ?auto_52437 ?auto_52435 ) ) ( not ( = ?auto_52437 ?auto_52434 ) ) ( not ( = ?auto_52431 ?auto_52437 ) ) ( not ( = ?auto_52432 ?auto_52437 ) ) ( not ( = ?auto_52433 ?auto_52437 ) ) ( ON ?auto_52433 ?auto_52434 ) ( CLEAR ?auto_52431 ) ( ON ?auto_52432 ?auto_52433 ) ( CLEAR ?auto_52432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52437 ?auto_52436 ?auto_52435 ?auto_52434 ?auto_52433 )
      ( MAKE-5PILE ?auto_52431 ?auto_52432 ?auto_52433 ?auto_52434 ?auto_52435 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52438 - BLOCK
      ?auto_52439 - BLOCK
      ?auto_52440 - BLOCK
      ?auto_52441 - BLOCK
      ?auto_52442 - BLOCK
    )
    :vars
    (
      ?auto_52443 - BLOCK
      ?auto_52444 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52438 ?auto_52439 ) ) ( not ( = ?auto_52438 ?auto_52440 ) ) ( not ( = ?auto_52438 ?auto_52441 ) ) ( not ( = ?auto_52438 ?auto_52442 ) ) ( not ( = ?auto_52439 ?auto_52440 ) ) ( not ( = ?auto_52439 ?auto_52441 ) ) ( not ( = ?auto_52439 ?auto_52442 ) ) ( not ( = ?auto_52440 ?auto_52441 ) ) ( not ( = ?auto_52440 ?auto_52442 ) ) ( not ( = ?auto_52441 ?auto_52442 ) ) ( ON ?auto_52442 ?auto_52443 ) ( not ( = ?auto_52438 ?auto_52443 ) ) ( not ( = ?auto_52439 ?auto_52443 ) ) ( not ( = ?auto_52440 ?auto_52443 ) ) ( not ( = ?auto_52441 ?auto_52443 ) ) ( not ( = ?auto_52442 ?auto_52443 ) ) ( ON ?auto_52441 ?auto_52442 ) ( ON-TABLE ?auto_52444 ) ( ON ?auto_52443 ?auto_52444 ) ( not ( = ?auto_52444 ?auto_52443 ) ) ( not ( = ?auto_52444 ?auto_52442 ) ) ( not ( = ?auto_52444 ?auto_52441 ) ) ( not ( = ?auto_52438 ?auto_52444 ) ) ( not ( = ?auto_52439 ?auto_52444 ) ) ( not ( = ?auto_52440 ?auto_52444 ) ) ( ON ?auto_52440 ?auto_52441 ) ( ON ?auto_52439 ?auto_52440 ) ( CLEAR ?auto_52439 ) ( HOLDING ?auto_52438 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52438 )
      ( MAKE-5PILE ?auto_52438 ?auto_52439 ?auto_52440 ?auto_52441 ?auto_52442 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52445 - BLOCK
      ?auto_52446 - BLOCK
      ?auto_52447 - BLOCK
      ?auto_52448 - BLOCK
      ?auto_52449 - BLOCK
    )
    :vars
    (
      ?auto_52450 - BLOCK
      ?auto_52451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52445 ?auto_52446 ) ) ( not ( = ?auto_52445 ?auto_52447 ) ) ( not ( = ?auto_52445 ?auto_52448 ) ) ( not ( = ?auto_52445 ?auto_52449 ) ) ( not ( = ?auto_52446 ?auto_52447 ) ) ( not ( = ?auto_52446 ?auto_52448 ) ) ( not ( = ?auto_52446 ?auto_52449 ) ) ( not ( = ?auto_52447 ?auto_52448 ) ) ( not ( = ?auto_52447 ?auto_52449 ) ) ( not ( = ?auto_52448 ?auto_52449 ) ) ( ON ?auto_52449 ?auto_52450 ) ( not ( = ?auto_52445 ?auto_52450 ) ) ( not ( = ?auto_52446 ?auto_52450 ) ) ( not ( = ?auto_52447 ?auto_52450 ) ) ( not ( = ?auto_52448 ?auto_52450 ) ) ( not ( = ?auto_52449 ?auto_52450 ) ) ( ON ?auto_52448 ?auto_52449 ) ( ON-TABLE ?auto_52451 ) ( ON ?auto_52450 ?auto_52451 ) ( not ( = ?auto_52451 ?auto_52450 ) ) ( not ( = ?auto_52451 ?auto_52449 ) ) ( not ( = ?auto_52451 ?auto_52448 ) ) ( not ( = ?auto_52445 ?auto_52451 ) ) ( not ( = ?auto_52446 ?auto_52451 ) ) ( not ( = ?auto_52447 ?auto_52451 ) ) ( ON ?auto_52447 ?auto_52448 ) ( ON ?auto_52446 ?auto_52447 ) ( ON ?auto_52445 ?auto_52446 ) ( CLEAR ?auto_52445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52451 ?auto_52450 ?auto_52449 ?auto_52448 ?auto_52447 ?auto_52446 )
      ( MAKE-5PILE ?auto_52445 ?auto_52446 ?auto_52447 ?auto_52448 ?auto_52449 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52453 - BLOCK
    )
    :vars
    (
      ?auto_52454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52454 ?auto_52453 ) ( CLEAR ?auto_52454 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52453 ) ( not ( = ?auto_52453 ?auto_52454 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52454 ?auto_52453 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52455 - BLOCK
    )
    :vars
    (
      ?auto_52456 - BLOCK
      ?auto_52457 - BLOCK
      ?auto_52458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52456 ?auto_52455 ) ( CLEAR ?auto_52456 ) ( ON-TABLE ?auto_52455 ) ( not ( = ?auto_52455 ?auto_52456 ) ) ( HOLDING ?auto_52457 ) ( CLEAR ?auto_52458 ) ( not ( = ?auto_52455 ?auto_52457 ) ) ( not ( = ?auto_52455 ?auto_52458 ) ) ( not ( = ?auto_52456 ?auto_52457 ) ) ( not ( = ?auto_52456 ?auto_52458 ) ) ( not ( = ?auto_52457 ?auto_52458 ) ) )
    :subtasks
    ( ( !STACK ?auto_52457 ?auto_52458 )
      ( MAKE-1PILE ?auto_52455 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52459 - BLOCK
    )
    :vars
    (
      ?auto_52462 - BLOCK
      ?auto_52460 - BLOCK
      ?auto_52461 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52462 ?auto_52459 ) ( ON-TABLE ?auto_52459 ) ( not ( = ?auto_52459 ?auto_52462 ) ) ( CLEAR ?auto_52460 ) ( not ( = ?auto_52459 ?auto_52461 ) ) ( not ( = ?auto_52459 ?auto_52460 ) ) ( not ( = ?auto_52462 ?auto_52461 ) ) ( not ( = ?auto_52462 ?auto_52460 ) ) ( not ( = ?auto_52461 ?auto_52460 ) ) ( ON ?auto_52461 ?auto_52462 ) ( CLEAR ?auto_52461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52459 ?auto_52462 )
      ( MAKE-1PILE ?auto_52459 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52463 - BLOCK
    )
    :vars
    (
      ?auto_52465 - BLOCK
      ?auto_52466 - BLOCK
      ?auto_52464 - BLOCK
      ?auto_52467 - BLOCK
      ?auto_52469 - BLOCK
      ?auto_52468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52465 ?auto_52463 ) ( ON-TABLE ?auto_52463 ) ( not ( = ?auto_52463 ?auto_52465 ) ) ( not ( = ?auto_52463 ?auto_52466 ) ) ( not ( = ?auto_52463 ?auto_52464 ) ) ( not ( = ?auto_52465 ?auto_52466 ) ) ( not ( = ?auto_52465 ?auto_52464 ) ) ( not ( = ?auto_52466 ?auto_52464 ) ) ( ON ?auto_52466 ?auto_52465 ) ( CLEAR ?auto_52466 ) ( HOLDING ?auto_52464 ) ( CLEAR ?auto_52467 ) ( ON-TABLE ?auto_52469 ) ( ON ?auto_52468 ?auto_52469 ) ( ON ?auto_52467 ?auto_52468 ) ( not ( = ?auto_52469 ?auto_52468 ) ) ( not ( = ?auto_52469 ?auto_52467 ) ) ( not ( = ?auto_52469 ?auto_52464 ) ) ( not ( = ?auto_52468 ?auto_52467 ) ) ( not ( = ?auto_52468 ?auto_52464 ) ) ( not ( = ?auto_52467 ?auto_52464 ) ) ( not ( = ?auto_52463 ?auto_52467 ) ) ( not ( = ?auto_52463 ?auto_52469 ) ) ( not ( = ?auto_52463 ?auto_52468 ) ) ( not ( = ?auto_52465 ?auto_52467 ) ) ( not ( = ?auto_52465 ?auto_52469 ) ) ( not ( = ?auto_52465 ?auto_52468 ) ) ( not ( = ?auto_52466 ?auto_52467 ) ) ( not ( = ?auto_52466 ?auto_52469 ) ) ( not ( = ?auto_52466 ?auto_52468 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52469 ?auto_52468 ?auto_52467 ?auto_52464 )
      ( MAKE-1PILE ?auto_52463 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52470 - BLOCK
    )
    :vars
    (
      ?auto_52476 - BLOCK
      ?auto_52475 - BLOCK
      ?auto_52471 - BLOCK
      ?auto_52472 - BLOCK
      ?auto_52473 - BLOCK
      ?auto_52474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52476 ?auto_52470 ) ( ON-TABLE ?auto_52470 ) ( not ( = ?auto_52470 ?auto_52476 ) ) ( not ( = ?auto_52470 ?auto_52475 ) ) ( not ( = ?auto_52470 ?auto_52471 ) ) ( not ( = ?auto_52476 ?auto_52475 ) ) ( not ( = ?auto_52476 ?auto_52471 ) ) ( not ( = ?auto_52475 ?auto_52471 ) ) ( ON ?auto_52475 ?auto_52476 ) ( CLEAR ?auto_52472 ) ( ON-TABLE ?auto_52473 ) ( ON ?auto_52474 ?auto_52473 ) ( ON ?auto_52472 ?auto_52474 ) ( not ( = ?auto_52473 ?auto_52474 ) ) ( not ( = ?auto_52473 ?auto_52472 ) ) ( not ( = ?auto_52473 ?auto_52471 ) ) ( not ( = ?auto_52474 ?auto_52472 ) ) ( not ( = ?auto_52474 ?auto_52471 ) ) ( not ( = ?auto_52472 ?auto_52471 ) ) ( not ( = ?auto_52470 ?auto_52472 ) ) ( not ( = ?auto_52470 ?auto_52473 ) ) ( not ( = ?auto_52470 ?auto_52474 ) ) ( not ( = ?auto_52476 ?auto_52472 ) ) ( not ( = ?auto_52476 ?auto_52473 ) ) ( not ( = ?auto_52476 ?auto_52474 ) ) ( not ( = ?auto_52475 ?auto_52472 ) ) ( not ( = ?auto_52475 ?auto_52473 ) ) ( not ( = ?auto_52475 ?auto_52474 ) ) ( ON ?auto_52471 ?auto_52475 ) ( CLEAR ?auto_52471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52470 ?auto_52476 ?auto_52475 )
      ( MAKE-1PILE ?auto_52470 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52477 - BLOCK
    )
    :vars
    (
      ?auto_52479 - BLOCK
      ?auto_52480 - BLOCK
      ?auto_52481 - BLOCK
      ?auto_52482 - BLOCK
      ?auto_52483 - BLOCK
      ?auto_52478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52479 ?auto_52477 ) ( ON-TABLE ?auto_52477 ) ( not ( = ?auto_52477 ?auto_52479 ) ) ( not ( = ?auto_52477 ?auto_52480 ) ) ( not ( = ?auto_52477 ?auto_52481 ) ) ( not ( = ?auto_52479 ?auto_52480 ) ) ( not ( = ?auto_52479 ?auto_52481 ) ) ( not ( = ?auto_52480 ?auto_52481 ) ) ( ON ?auto_52480 ?auto_52479 ) ( ON-TABLE ?auto_52482 ) ( ON ?auto_52483 ?auto_52482 ) ( not ( = ?auto_52482 ?auto_52483 ) ) ( not ( = ?auto_52482 ?auto_52478 ) ) ( not ( = ?auto_52482 ?auto_52481 ) ) ( not ( = ?auto_52483 ?auto_52478 ) ) ( not ( = ?auto_52483 ?auto_52481 ) ) ( not ( = ?auto_52478 ?auto_52481 ) ) ( not ( = ?auto_52477 ?auto_52478 ) ) ( not ( = ?auto_52477 ?auto_52482 ) ) ( not ( = ?auto_52477 ?auto_52483 ) ) ( not ( = ?auto_52479 ?auto_52478 ) ) ( not ( = ?auto_52479 ?auto_52482 ) ) ( not ( = ?auto_52479 ?auto_52483 ) ) ( not ( = ?auto_52480 ?auto_52478 ) ) ( not ( = ?auto_52480 ?auto_52482 ) ) ( not ( = ?auto_52480 ?auto_52483 ) ) ( ON ?auto_52481 ?auto_52480 ) ( CLEAR ?auto_52481 ) ( HOLDING ?auto_52478 ) ( CLEAR ?auto_52483 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52482 ?auto_52483 ?auto_52478 )
      ( MAKE-1PILE ?auto_52477 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52484 - BLOCK
    )
    :vars
    (
      ?auto_52489 - BLOCK
      ?auto_52488 - BLOCK
      ?auto_52490 - BLOCK
      ?auto_52486 - BLOCK
      ?auto_52487 - BLOCK
      ?auto_52485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52489 ?auto_52484 ) ( ON-TABLE ?auto_52484 ) ( not ( = ?auto_52484 ?auto_52489 ) ) ( not ( = ?auto_52484 ?auto_52488 ) ) ( not ( = ?auto_52484 ?auto_52490 ) ) ( not ( = ?auto_52489 ?auto_52488 ) ) ( not ( = ?auto_52489 ?auto_52490 ) ) ( not ( = ?auto_52488 ?auto_52490 ) ) ( ON ?auto_52488 ?auto_52489 ) ( ON-TABLE ?auto_52486 ) ( ON ?auto_52487 ?auto_52486 ) ( not ( = ?auto_52486 ?auto_52487 ) ) ( not ( = ?auto_52486 ?auto_52485 ) ) ( not ( = ?auto_52486 ?auto_52490 ) ) ( not ( = ?auto_52487 ?auto_52485 ) ) ( not ( = ?auto_52487 ?auto_52490 ) ) ( not ( = ?auto_52485 ?auto_52490 ) ) ( not ( = ?auto_52484 ?auto_52485 ) ) ( not ( = ?auto_52484 ?auto_52486 ) ) ( not ( = ?auto_52484 ?auto_52487 ) ) ( not ( = ?auto_52489 ?auto_52485 ) ) ( not ( = ?auto_52489 ?auto_52486 ) ) ( not ( = ?auto_52489 ?auto_52487 ) ) ( not ( = ?auto_52488 ?auto_52485 ) ) ( not ( = ?auto_52488 ?auto_52486 ) ) ( not ( = ?auto_52488 ?auto_52487 ) ) ( ON ?auto_52490 ?auto_52488 ) ( CLEAR ?auto_52487 ) ( ON ?auto_52485 ?auto_52490 ) ( CLEAR ?auto_52485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52484 ?auto_52489 ?auto_52488 ?auto_52490 )
      ( MAKE-1PILE ?auto_52484 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52491 - BLOCK
    )
    :vars
    (
      ?auto_52496 - BLOCK
      ?auto_52492 - BLOCK
      ?auto_52497 - BLOCK
      ?auto_52494 - BLOCK
      ?auto_52493 - BLOCK
      ?auto_52495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52496 ?auto_52491 ) ( ON-TABLE ?auto_52491 ) ( not ( = ?auto_52491 ?auto_52496 ) ) ( not ( = ?auto_52491 ?auto_52492 ) ) ( not ( = ?auto_52491 ?auto_52497 ) ) ( not ( = ?auto_52496 ?auto_52492 ) ) ( not ( = ?auto_52496 ?auto_52497 ) ) ( not ( = ?auto_52492 ?auto_52497 ) ) ( ON ?auto_52492 ?auto_52496 ) ( ON-TABLE ?auto_52494 ) ( not ( = ?auto_52494 ?auto_52493 ) ) ( not ( = ?auto_52494 ?auto_52495 ) ) ( not ( = ?auto_52494 ?auto_52497 ) ) ( not ( = ?auto_52493 ?auto_52495 ) ) ( not ( = ?auto_52493 ?auto_52497 ) ) ( not ( = ?auto_52495 ?auto_52497 ) ) ( not ( = ?auto_52491 ?auto_52495 ) ) ( not ( = ?auto_52491 ?auto_52494 ) ) ( not ( = ?auto_52491 ?auto_52493 ) ) ( not ( = ?auto_52496 ?auto_52495 ) ) ( not ( = ?auto_52496 ?auto_52494 ) ) ( not ( = ?auto_52496 ?auto_52493 ) ) ( not ( = ?auto_52492 ?auto_52495 ) ) ( not ( = ?auto_52492 ?auto_52494 ) ) ( not ( = ?auto_52492 ?auto_52493 ) ) ( ON ?auto_52497 ?auto_52492 ) ( ON ?auto_52495 ?auto_52497 ) ( CLEAR ?auto_52495 ) ( HOLDING ?auto_52493 ) ( CLEAR ?auto_52494 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52494 ?auto_52493 )
      ( MAKE-1PILE ?auto_52491 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52498 - BLOCK
    )
    :vars
    (
      ?auto_52503 - BLOCK
      ?auto_52499 - BLOCK
      ?auto_52502 - BLOCK
      ?auto_52504 - BLOCK
      ?auto_52500 - BLOCK
      ?auto_52501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52503 ?auto_52498 ) ( ON-TABLE ?auto_52498 ) ( not ( = ?auto_52498 ?auto_52503 ) ) ( not ( = ?auto_52498 ?auto_52499 ) ) ( not ( = ?auto_52498 ?auto_52502 ) ) ( not ( = ?auto_52503 ?auto_52499 ) ) ( not ( = ?auto_52503 ?auto_52502 ) ) ( not ( = ?auto_52499 ?auto_52502 ) ) ( ON ?auto_52499 ?auto_52503 ) ( ON-TABLE ?auto_52504 ) ( not ( = ?auto_52504 ?auto_52500 ) ) ( not ( = ?auto_52504 ?auto_52501 ) ) ( not ( = ?auto_52504 ?auto_52502 ) ) ( not ( = ?auto_52500 ?auto_52501 ) ) ( not ( = ?auto_52500 ?auto_52502 ) ) ( not ( = ?auto_52501 ?auto_52502 ) ) ( not ( = ?auto_52498 ?auto_52501 ) ) ( not ( = ?auto_52498 ?auto_52504 ) ) ( not ( = ?auto_52498 ?auto_52500 ) ) ( not ( = ?auto_52503 ?auto_52501 ) ) ( not ( = ?auto_52503 ?auto_52504 ) ) ( not ( = ?auto_52503 ?auto_52500 ) ) ( not ( = ?auto_52499 ?auto_52501 ) ) ( not ( = ?auto_52499 ?auto_52504 ) ) ( not ( = ?auto_52499 ?auto_52500 ) ) ( ON ?auto_52502 ?auto_52499 ) ( ON ?auto_52501 ?auto_52502 ) ( CLEAR ?auto_52504 ) ( ON ?auto_52500 ?auto_52501 ) ( CLEAR ?auto_52500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52498 ?auto_52503 ?auto_52499 ?auto_52502 ?auto_52501 )
      ( MAKE-1PILE ?auto_52498 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52505 - BLOCK
    )
    :vars
    (
      ?auto_52506 - BLOCK
      ?auto_52511 - BLOCK
      ?auto_52508 - BLOCK
      ?auto_52510 - BLOCK
      ?auto_52509 - BLOCK
      ?auto_52507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52506 ?auto_52505 ) ( ON-TABLE ?auto_52505 ) ( not ( = ?auto_52505 ?auto_52506 ) ) ( not ( = ?auto_52505 ?auto_52511 ) ) ( not ( = ?auto_52505 ?auto_52508 ) ) ( not ( = ?auto_52506 ?auto_52511 ) ) ( not ( = ?auto_52506 ?auto_52508 ) ) ( not ( = ?auto_52511 ?auto_52508 ) ) ( ON ?auto_52511 ?auto_52506 ) ( not ( = ?auto_52510 ?auto_52509 ) ) ( not ( = ?auto_52510 ?auto_52507 ) ) ( not ( = ?auto_52510 ?auto_52508 ) ) ( not ( = ?auto_52509 ?auto_52507 ) ) ( not ( = ?auto_52509 ?auto_52508 ) ) ( not ( = ?auto_52507 ?auto_52508 ) ) ( not ( = ?auto_52505 ?auto_52507 ) ) ( not ( = ?auto_52505 ?auto_52510 ) ) ( not ( = ?auto_52505 ?auto_52509 ) ) ( not ( = ?auto_52506 ?auto_52507 ) ) ( not ( = ?auto_52506 ?auto_52510 ) ) ( not ( = ?auto_52506 ?auto_52509 ) ) ( not ( = ?auto_52511 ?auto_52507 ) ) ( not ( = ?auto_52511 ?auto_52510 ) ) ( not ( = ?auto_52511 ?auto_52509 ) ) ( ON ?auto_52508 ?auto_52511 ) ( ON ?auto_52507 ?auto_52508 ) ( ON ?auto_52509 ?auto_52507 ) ( CLEAR ?auto_52509 ) ( HOLDING ?auto_52510 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52510 )
      ( MAKE-1PILE ?auto_52505 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52512 - BLOCK
    )
    :vars
    (
      ?auto_52515 - BLOCK
      ?auto_52514 - BLOCK
      ?auto_52517 - BLOCK
      ?auto_52518 - BLOCK
      ?auto_52513 - BLOCK
      ?auto_52516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52515 ?auto_52512 ) ( ON-TABLE ?auto_52512 ) ( not ( = ?auto_52512 ?auto_52515 ) ) ( not ( = ?auto_52512 ?auto_52514 ) ) ( not ( = ?auto_52512 ?auto_52517 ) ) ( not ( = ?auto_52515 ?auto_52514 ) ) ( not ( = ?auto_52515 ?auto_52517 ) ) ( not ( = ?auto_52514 ?auto_52517 ) ) ( ON ?auto_52514 ?auto_52515 ) ( not ( = ?auto_52518 ?auto_52513 ) ) ( not ( = ?auto_52518 ?auto_52516 ) ) ( not ( = ?auto_52518 ?auto_52517 ) ) ( not ( = ?auto_52513 ?auto_52516 ) ) ( not ( = ?auto_52513 ?auto_52517 ) ) ( not ( = ?auto_52516 ?auto_52517 ) ) ( not ( = ?auto_52512 ?auto_52516 ) ) ( not ( = ?auto_52512 ?auto_52518 ) ) ( not ( = ?auto_52512 ?auto_52513 ) ) ( not ( = ?auto_52515 ?auto_52516 ) ) ( not ( = ?auto_52515 ?auto_52518 ) ) ( not ( = ?auto_52515 ?auto_52513 ) ) ( not ( = ?auto_52514 ?auto_52516 ) ) ( not ( = ?auto_52514 ?auto_52518 ) ) ( not ( = ?auto_52514 ?auto_52513 ) ) ( ON ?auto_52517 ?auto_52514 ) ( ON ?auto_52516 ?auto_52517 ) ( ON ?auto_52513 ?auto_52516 ) ( ON ?auto_52518 ?auto_52513 ) ( CLEAR ?auto_52518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52512 ?auto_52515 ?auto_52514 ?auto_52517 ?auto_52516 ?auto_52513 )
      ( MAKE-1PILE ?auto_52512 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52525 - BLOCK
      ?auto_52526 - BLOCK
      ?auto_52527 - BLOCK
      ?auto_52528 - BLOCK
      ?auto_52529 - BLOCK
      ?auto_52530 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_52530 ) ( CLEAR ?auto_52529 ) ( ON-TABLE ?auto_52525 ) ( ON ?auto_52526 ?auto_52525 ) ( ON ?auto_52527 ?auto_52526 ) ( ON ?auto_52528 ?auto_52527 ) ( ON ?auto_52529 ?auto_52528 ) ( not ( = ?auto_52525 ?auto_52526 ) ) ( not ( = ?auto_52525 ?auto_52527 ) ) ( not ( = ?auto_52525 ?auto_52528 ) ) ( not ( = ?auto_52525 ?auto_52529 ) ) ( not ( = ?auto_52525 ?auto_52530 ) ) ( not ( = ?auto_52526 ?auto_52527 ) ) ( not ( = ?auto_52526 ?auto_52528 ) ) ( not ( = ?auto_52526 ?auto_52529 ) ) ( not ( = ?auto_52526 ?auto_52530 ) ) ( not ( = ?auto_52527 ?auto_52528 ) ) ( not ( = ?auto_52527 ?auto_52529 ) ) ( not ( = ?auto_52527 ?auto_52530 ) ) ( not ( = ?auto_52528 ?auto_52529 ) ) ( not ( = ?auto_52528 ?auto_52530 ) ) ( not ( = ?auto_52529 ?auto_52530 ) ) )
    :subtasks
    ( ( !STACK ?auto_52530 ?auto_52529 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52531 - BLOCK
      ?auto_52532 - BLOCK
      ?auto_52533 - BLOCK
      ?auto_52534 - BLOCK
      ?auto_52535 - BLOCK
      ?auto_52536 - BLOCK
    )
    :vars
    (
      ?auto_52537 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_52535 ) ( ON-TABLE ?auto_52531 ) ( ON ?auto_52532 ?auto_52531 ) ( ON ?auto_52533 ?auto_52532 ) ( ON ?auto_52534 ?auto_52533 ) ( ON ?auto_52535 ?auto_52534 ) ( not ( = ?auto_52531 ?auto_52532 ) ) ( not ( = ?auto_52531 ?auto_52533 ) ) ( not ( = ?auto_52531 ?auto_52534 ) ) ( not ( = ?auto_52531 ?auto_52535 ) ) ( not ( = ?auto_52531 ?auto_52536 ) ) ( not ( = ?auto_52532 ?auto_52533 ) ) ( not ( = ?auto_52532 ?auto_52534 ) ) ( not ( = ?auto_52532 ?auto_52535 ) ) ( not ( = ?auto_52532 ?auto_52536 ) ) ( not ( = ?auto_52533 ?auto_52534 ) ) ( not ( = ?auto_52533 ?auto_52535 ) ) ( not ( = ?auto_52533 ?auto_52536 ) ) ( not ( = ?auto_52534 ?auto_52535 ) ) ( not ( = ?auto_52534 ?auto_52536 ) ) ( not ( = ?auto_52535 ?auto_52536 ) ) ( ON ?auto_52536 ?auto_52537 ) ( CLEAR ?auto_52536 ) ( HAND-EMPTY ) ( not ( = ?auto_52531 ?auto_52537 ) ) ( not ( = ?auto_52532 ?auto_52537 ) ) ( not ( = ?auto_52533 ?auto_52537 ) ) ( not ( = ?auto_52534 ?auto_52537 ) ) ( not ( = ?auto_52535 ?auto_52537 ) ) ( not ( = ?auto_52536 ?auto_52537 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52536 ?auto_52537 )
      ( MAKE-6PILE ?auto_52531 ?auto_52532 ?auto_52533 ?auto_52534 ?auto_52535 ?auto_52536 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52538 - BLOCK
      ?auto_52539 - BLOCK
      ?auto_52540 - BLOCK
      ?auto_52541 - BLOCK
      ?auto_52542 - BLOCK
      ?auto_52543 - BLOCK
    )
    :vars
    (
      ?auto_52544 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52538 ) ( ON ?auto_52539 ?auto_52538 ) ( ON ?auto_52540 ?auto_52539 ) ( ON ?auto_52541 ?auto_52540 ) ( not ( = ?auto_52538 ?auto_52539 ) ) ( not ( = ?auto_52538 ?auto_52540 ) ) ( not ( = ?auto_52538 ?auto_52541 ) ) ( not ( = ?auto_52538 ?auto_52542 ) ) ( not ( = ?auto_52538 ?auto_52543 ) ) ( not ( = ?auto_52539 ?auto_52540 ) ) ( not ( = ?auto_52539 ?auto_52541 ) ) ( not ( = ?auto_52539 ?auto_52542 ) ) ( not ( = ?auto_52539 ?auto_52543 ) ) ( not ( = ?auto_52540 ?auto_52541 ) ) ( not ( = ?auto_52540 ?auto_52542 ) ) ( not ( = ?auto_52540 ?auto_52543 ) ) ( not ( = ?auto_52541 ?auto_52542 ) ) ( not ( = ?auto_52541 ?auto_52543 ) ) ( not ( = ?auto_52542 ?auto_52543 ) ) ( ON ?auto_52543 ?auto_52544 ) ( CLEAR ?auto_52543 ) ( not ( = ?auto_52538 ?auto_52544 ) ) ( not ( = ?auto_52539 ?auto_52544 ) ) ( not ( = ?auto_52540 ?auto_52544 ) ) ( not ( = ?auto_52541 ?auto_52544 ) ) ( not ( = ?auto_52542 ?auto_52544 ) ) ( not ( = ?auto_52543 ?auto_52544 ) ) ( HOLDING ?auto_52542 ) ( CLEAR ?auto_52541 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52538 ?auto_52539 ?auto_52540 ?auto_52541 ?auto_52542 )
      ( MAKE-6PILE ?auto_52538 ?auto_52539 ?auto_52540 ?auto_52541 ?auto_52542 ?auto_52543 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52545 - BLOCK
      ?auto_52546 - BLOCK
      ?auto_52547 - BLOCK
      ?auto_52548 - BLOCK
      ?auto_52549 - BLOCK
      ?auto_52550 - BLOCK
    )
    :vars
    (
      ?auto_52551 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52545 ) ( ON ?auto_52546 ?auto_52545 ) ( ON ?auto_52547 ?auto_52546 ) ( ON ?auto_52548 ?auto_52547 ) ( not ( = ?auto_52545 ?auto_52546 ) ) ( not ( = ?auto_52545 ?auto_52547 ) ) ( not ( = ?auto_52545 ?auto_52548 ) ) ( not ( = ?auto_52545 ?auto_52549 ) ) ( not ( = ?auto_52545 ?auto_52550 ) ) ( not ( = ?auto_52546 ?auto_52547 ) ) ( not ( = ?auto_52546 ?auto_52548 ) ) ( not ( = ?auto_52546 ?auto_52549 ) ) ( not ( = ?auto_52546 ?auto_52550 ) ) ( not ( = ?auto_52547 ?auto_52548 ) ) ( not ( = ?auto_52547 ?auto_52549 ) ) ( not ( = ?auto_52547 ?auto_52550 ) ) ( not ( = ?auto_52548 ?auto_52549 ) ) ( not ( = ?auto_52548 ?auto_52550 ) ) ( not ( = ?auto_52549 ?auto_52550 ) ) ( ON ?auto_52550 ?auto_52551 ) ( not ( = ?auto_52545 ?auto_52551 ) ) ( not ( = ?auto_52546 ?auto_52551 ) ) ( not ( = ?auto_52547 ?auto_52551 ) ) ( not ( = ?auto_52548 ?auto_52551 ) ) ( not ( = ?auto_52549 ?auto_52551 ) ) ( not ( = ?auto_52550 ?auto_52551 ) ) ( CLEAR ?auto_52548 ) ( ON ?auto_52549 ?auto_52550 ) ( CLEAR ?auto_52549 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52551 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52551 ?auto_52550 )
      ( MAKE-6PILE ?auto_52545 ?auto_52546 ?auto_52547 ?auto_52548 ?auto_52549 ?auto_52550 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52552 - BLOCK
      ?auto_52553 - BLOCK
      ?auto_52554 - BLOCK
      ?auto_52555 - BLOCK
      ?auto_52556 - BLOCK
      ?auto_52557 - BLOCK
    )
    :vars
    (
      ?auto_52558 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52552 ) ( ON ?auto_52553 ?auto_52552 ) ( ON ?auto_52554 ?auto_52553 ) ( not ( = ?auto_52552 ?auto_52553 ) ) ( not ( = ?auto_52552 ?auto_52554 ) ) ( not ( = ?auto_52552 ?auto_52555 ) ) ( not ( = ?auto_52552 ?auto_52556 ) ) ( not ( = ?auto_52552 ?auto_52557 ) ) ( not ( = ?auto_52553 ?auto_52554 ) ) ( not ( = ?auto_52553 ?auto_52555 ) ) ( not ( = ?auto_52553 ?auto_52556 ) ) ( not ( = ?auto_52553 ?auto_52557 ) ) ( not ( = ?auto_52554 ?auto_52555 ) ) ( not ( = ?auto_52554 ?auto_52556 ) ) ( not ( = ?auto_52554 ?auto_52557 ) ) ( not ( = ?auto_52555 ?auto_52556 ) ) ( not ( = ?auto_52555 ?auto_52557 ) ) ( not ( = ?auto_52556 ?auto_52557 ) ) ( ON ?auto_52557 ?auto_52558 ) ( not ( = ?auto_52552 ?auto_52558 ) ) ( not ( = ?auto_52553 ?auto_52558 ) ) ( not ( = ?auto_52554 ?auto_52558 ) ) ( not ( = ?auto_52555 ?auto_52558 ) ) ( not ( = ?auto_52556 ?auto_52558 ) ) ( not ( = ?auto_52557 ?auto_52558 ) ) ( ON ?auto_52556 ?auto_52557 ) ( CLEAR ?auto_52556 ) ( ON-TABLE ?auto_52558 ) ( HOLDING ?auto_52555 ) ( CLEAR ?auto_52554 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52552 ?auto_52553 ?auto_52554 ?auto_52555 )
      ( MAKE-6PILE ?auto_52552 ?auto_52553 ?auto_52554 ?auto_52555 ?auto_52556 ?auto_52557 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52559 - BLOCK
      ?auto_52560 - BLOCK
      ?auto_52561 - BLOCK
      ?auto_52562 - BLOCK
      ?auto_52563 - BLOCK
      ?auto_52564 - BLOCK
    )
    :vars
    (
      ?auto_52565 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52559 ) ( ON ?auto_52560 ?auto_52559 ) ( ON ?auto_52561 ?auto_52560 ) ( not ( = ?auto_52559 ?auto_52560 ) ) ( not ( = ?auto_52559 ?auto_52561 ) ) ( not ( = ?auto_52559 ?auto_52562 ) ) ( not ( = ?auto_52559 ?auto_52563 ) ) ( not ( = ?auto_52559 ?auto_52564 ) ) ( not ( = ?auto_52560 ?auto_52561 ) ) ( not ( = ?auto_52560 ?auto_52562 ) ) ( not ( = ?auto_52560 ?auto_52563 ) ) ( not ( = ?auto_52560 ?auto_52564 ) ) ( not ( = ?auto_52561 ?auto_52562 ) ) ( not ( = ?auto_52561 ?auto_52563 ) ) ( not ( = ?auto_52561 ?auto_52564 ) ) ( not ( = ?auto_52562 ?auto_52563 ) ) ( not ( = ?auto_52562 ?auto_52564 ) ) ( not ( = ?auto_52563 ?auto_52564 ) ) ( ON ?auto_52564 ?auto_52565 ) ( not ( = ?auto_52559 ?auto_52565 ) ) ( not ( = ?auto_52560 ?auto_52565 ) ) ( not ( = ?auto_52561 ?auto_52565 ) ) ( not ( = ?auto_52562 ?auto_52565 ) ) ( not ( = ?auto_52563 ?auto_52565 ) ) ( not ( = ?auto_52564 ?auto_52565 ) ) ( ON ?auto_52563 ?auto_52564 ) ( ON-TABLE ?auto_52565 ) ( CLEAR ?auto_52561 ) ( ON ?auto_52562 ?auto_52563 ) ( CLEAR ?auto_52562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52565 ?auto_52564 ?auto_52563 )
      ( MAKE-6PILE ?auto_52559 ?auto_52560 ?auto_52561 ?auto_52562 ?auto_52563 ?auto_52564 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52566 - BLOCK
      ?auto_52567 - BLOCK
      ?auto_52568 - BLOCK
      ?auto_52569 - BLOCK
      ?auto_52570 - BLOCK
      ?auto_52571 - BLOCK
    )
    :vars
    (
      ?auto_52572 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52566 ) ( ON ?auto_52567 ?auto_52566 ) ( not ( = ?auto_52566 ?auto_52567 ) ) ( not ( = ?auto_52566 ?auto_52568 ) ) ( not ( = ?auto_52566 ?auto_52569 ) ) ( not ( = ?auto_52566 ?auto_52570 ) ) ( not ( = ?auto_52566 ?auto_52571 ) ) ( not ( = ?auto_52567 ?auto_52568 ) ) ( not ( = ?auto_52567 ?auto_52569 ) ) ( not ( = ?auto_52567 ?auto_52570 ) ) ( not ( = ?auto_52567 ?auto_52571 ) ) ( not ( = ?auto_52568 ?auto_52569 ) ) ( not ( = ?auto_52568 ?auto_52570 ) ) ( not ( = ?auto_52568 ?auto_52571 ) ) ( not ( = ?auto_52569 ?auto_52570 ) ) ( not ( = ?auto_52569 ?auto_52571 ) ) ( not ( = ?auto_52570 ?auto_52571 ) ) ( ON ?auto_52571 ?auto_52572 ) ( not ( = ?auto_52566 ?auto_52572 ) ) ( not ( = ?auto_52567 ?auto_52572 ) ) ( not ( = ?auto_52568 ?auto_52572 ) ) ( not ( = ?auto_52569 ?auto_52572 ) ) ( not ( = ?auto_52570 ?auto_52572 ) ) ( not ( = ?auto_52571 ?auto_52572 ) ) ( ON ?auto_52570 ?auto_52571 ) ( ON-TABLE ?auto_52572 ) ( ON ?auto_52569 ?auto_52570 ) ( CLEAR ?auto_52569 ) ( HOLDING ?auto_52568 ) ( CLEAR ?auto_52567 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52566 ?auto_52567 ?auto_52568 )
      ( MAKE-6PILE ?auto_52566 ?auto_52567 ?auto_52568 ?auto_52569 ?auto_52570 ?auto_52571 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52573 - BLOCK
      ?auto_52574 - BLOCK
      ?auto_52575 - BLOCK
      ?auto_52576 - BLOCK
      ?auto_52577 - BLOCK
      ?auto_52578 - BLOCK
    )
    :vars
    (
      ?auto_52579 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52573 ) ( ON ?auto_52574 ?auto_52573 ) ( not ( = ?auto_52573 ?auto_52574 ) ) ( not ( = ?auto_52573 ?auto_52575 ) ) ( not ( = ?auto_52573 ?auto_52576 ) ) ( not ( = ?auto_52573 ?auto_52577 ) ) ( not ( = ?auto_52573 ?auto_52578 ) ) ( not ( = ?auto_52574 ?auto_52575 ) ) ( not ( = ?auto_52574 ?auto_52576 ) ) ( not ( = ?auto_52574 ?auto_52577 ) ) ( not ( = ?auto_52574 ?auto_52578 ) ) ( not ( = ?auto_52575 ?auto_52576 ) ) ( not ( = ?auto_52575 ?auto_52577 ) ) ( not ( = ?auto_52575 ?auto_52578 ) ) ( not ( = ?auto_52576 ?auto_52577 ) ) ( not ( = ?auto_52576 ?auto_52578 ) ) ( not ( = ?auto_52577 ?auto_52578 ) ) ( ON ?auto_52578 ?auto_52579 ) ( not ( = ?auto_52573 ?auto_52579 ) ) ( not ( = ?auto_52574 ?auto_52579 ) ) ( not ( = ?auto_52575 ?auto_52579 ) ) ( not ( = ?auto_52576 ?auto_52579 ) ) ( not ( = ?auto_52577 ?auto_52579 ) ) ( not ( = ?auto_52578 ?auto_52579 ) ) ( ON ?auto_52577 ?auto_52578 ) ( ON-TABLE ?auto_52579 ) ( ON ?auto_52576 ?auto_52577 ) ( CLEAR ?auto_52574 ) ( ON ?auto_52575 ?auto_52576 ) ( CLEAR ?auto_52575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52579 ?auto_52578 ?auto_52577 ?auto_52576 )
      ( MAKE-6PILE ?auto_52573 ?auto_52574 ?auto_52575 ?auto_52576 ?auto_52577 ?auto_52578 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52580 - BLOCK
      ?auto_52581 - BLOCK
      ?auto_52582 - BLOCK
      ?auto_52583 - BLOCK
      ?auto_52584 - BLOCK
      ?auto_52585 - BLOCK
    )
    :vars
    (
      ?auto_52586 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52580 ) ( not ( = ?auto_52580 ?auto_52581 ) ) ( not ( = ?auto_52580 ?auto_52582 ) ) ( not ( = ?auto_52580 ?auto_52583 ) ) ( not ( = ?auto_52580 ?auto_52584 ) ) ( not ( = ?auto_52580 ?auto_52585 ) ) ( not ( = ?auto_52581 ?auto_52582 ) ) ( not ( = ?auto_52581 ?auto_52583 ) ) ( not ( = ?auto_52581 ?auto_52584 ) ) ( not ( = ?auto_52581 ?auto_52585 ) ) ( not ( = ?auto_52582 ?auto_52583 ) ) ( not ( = ?auto_52582 ?auto_52584 ) ) ( not ( = ?auto_52582 ?auto_52585 ) ) ( not ( = ?auto_52583 ?auto_52584 ) ) ( not ( = ?auto_52583 ?auto_52585 ) ) ( not ( = ?auto_52584 ?auto_52585 ) ) ( ON ?auto_52585 ?auto_52586 ) ( not ( = ?auto_52580 ?auto_52586 ) ) ( not ( = ?auto_52581 ?auto_52586 ) ) ( not ( = ?auto_52582 ?auto_52586 ) ) ( not ( = ?auto_52583 ?auto_52586 ) ) ( not ( = ?auto_52584 ?auto_52586 ) ) ( not ( = ?auto_52585 ?auto_52586 ) ) ( ON ?auto_52584 ?auto_52585 ) ( ON-TABLE ?auto_52586 ) ( ON ?auto_52583 ?auto_52584 ) ( ON ?auto_52582 ?auto_52583 ) ( CLEAR ?auto_52582 ) ( HOLDING ?auto_52581 ) ( CLEAR ?auto_52580 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52580 ?auto_52581 )
      ( MAKE-6PILE ?auto_52580 ?auto_52581 ?auto_52582 ?auto_52583 ?auto_52584 ?auto_52585 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52587 - BLOCK
      ?auto_52588 - BLOCK
      ?auto_52589 - BLOCK
      ?auto_52590 - BLOCK
      ?auto_52591 - BLOCK
      ?auto_52592 - BLOCK
    )
    :vars
    (
      ?auto_52593 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52587 ) ( not ( = ?auto_52587 ?auto_52588 ) ) ( not ( = ?auto_52587 ?auto_52589 ) ) ( not ( = ?auto_52587 ?auto_52590 ) ) ( not ( = ?auto_52587 ?auto_52591 ) ) ( not ( = ?auto_52587 ?auto_52592 ) ) ( not ( = ?auto_52588 ?auto_52589 ) ) ( not ( = ?auto_52588 ?auto_52590 ) ) ( not ( = ?auto_52588 ?auto_52591 ) ) ( not ( = ?auto_52588 ?auto_52592 ) ) ( not ( = ?auto_52589 ?auto_52590 ) ) ( not ( = ?auto_52589 ?auto_52591 ) ) ( not ( = ?auto_52589 ?auto_52592 ) ) ( not ( = ?auto_52590 ?auto_52591 ) ) ( not ( = ?auto_52590 ?auto_52592 ) ) ( not ( = ?auto_52591 ?auto_52592 ) ) ( ON ?auto_52592 ?auto_52593 ) ( not ( = ?auto_52587 ?auto_52593 ) ) ( not ( = ?auto_52588 ?auto_52593 ) ) ( not ( = ?auto_52589 ?auto_52593 ) ) ( not ( = ?auto_52590 ?auto_52593 ) ) ( not ( = ?auto_52591 ?auto_52593 ) ) ( not ( = ?auto_52592 ?auto_52593 ) ) ( ON ?auto_52591 ?auto_52592 ) ( ON-TABLE ?auto_52593 ) ( ON ?auto_52590 ?auto_52591 ) ( ON ?auto_52589 ?auto_52590 ) ( CLEAR ?auto_52587 ) ( ON ?auto_52588 ?auto_52589 ) ( CLEAR ?auto_52588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52593 ?auto_52592 ?auto_52591 ?auto_52590 ?auto_52589 )
      ( MAKE-6PILE ?auto_52587 ?auto_52588 ?auto_52589 ?auto_52590 ?auto_52591 ?auto_52592 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52594 - BLOCK
      ?auto_52595 - BLOCK
      ?auto_52596 - BLOCK
      ?auto_52597 - BLOCK
      ?auto_52598 - BLOCK
      ?auto_52599 - BLOCK
    )
    :vars
    (
      ?auto_52600 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52594 ?auto_52595 ) ) ( not ( = ?auto_52594 ?auto_52596 ) ) ( not ( = ?auto_52594 ?auto_52597 ) ) ( not ( = ?auto_52594 ?auto_52598 ) ) ( not ( = ?auto_52594 ?auto_52599 ) ) ( not ( = ?auto_52595 ?auto_52596 ) ) ( not ( = ?auto_52595 ?auto_52597 ) ) ( not ( = ?auto_52595 ?auto_52598 ) ) ( not ( = ?auto_52595 ?auto_52599 ) ) ( not ( = ?auto_52596 ?auto_52597 ) ) ( not ( = ?auto_52596 ?auto_52598 ) ) ( not ( = ?auto_52596 ?auto_52599 ) ) ( not ( = ?auto_52597 ?auto_52598 ) ) ( not ( = ?auto_52597 ?auto_52599 ) ) ( not ( = ?auto_52598 ?auto_52599 ) ) ( ON ?auto_52599 ?auto_52600 ) ( not ( = ?auto_52594 ?auto_52600 ) ) ( not ( = ?auto_52595 ?auto_52600 ) ) ( not ( = ?auto_52596 ?auto_52600 ) ) ( not ( = ?auto_52597 ?auto_52600 ) ) ( not ( = ?auto_52598 ?auto_52600 ) ) ( not ( = ?auto_52599 ?auto_52600 ) ) ( ON ?auto_52598 ?auto_52599 ) ( ON-TABLE ?auto_52600 ) ( ON ?auto_52597 ?auto_52598 ) ( ON ?auto_52596 ?auto_52597 ) ( ON ?auto_52595 ?auto_52596 ) ( CLEAR ?auto_52595 ) ( HOLDING ?auto_52594 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52594 )
      ( MAKE-6PILE ?auto_52594 ?auto_52595 ?auto_52596 ?auto_52597 ?auto_52598 ?auto_52599 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52601 - BLOCK
      ?auto_52602 - BLOCK
      ?auto_52603 - BLOCK
      ?auto_52604 - BLOCK
      ?auto_52605 - BLOCK
      ?auto_52606 - BLOCK
    )
    :vars
    (
      ?auto_52607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52601 ?auto_52602 ) ) ( not ( = ?auto_52601 ?auto_52603 ) ) ( not ( = ?auto_52601 ?auto_52604 ) ) ( not ( = ?auto_52601 ?auto_52605 ) ) ( not ( = ?auto_52601 ?auto_52606 ) ) ( not ( = ?auto_52602 ?auto_52603 ) ) ( not ( = ?auto_52602 ?auto_52604 ) ) ( not ( = ?auto_52602 ?auto_52605 ) ) ( not ( = ?auto_52602 ?auto_52606 ) ) ( not ( = ?auto_52603 ?auto_52604 ) ) ( not ( = ?auto_52603 ?auto_52605 ) ) ( not ( = ?auto_52603 ?auto_52606 ) ) ( not ( = ?auto_52604 ?auto_52605 ) ) ( not ( = ?auto_52604 ?auto_52606 ) ) ( not ( = ?auto_52605 ?auto_52606 ) ) ( ON ?auto_52606 ?auto_52607 ) ( not ( = ?auto_52601 ?auto_52607 ) ) ( not ( = ?auto_52602 ?auto_52607 ) ) ( not ( = ?auto_52603 ?auto_52607 ) ) ( not ( = ?auto_52604 ?auto_52607 ) ) ( not ( = ?auto_52605 ?auto_52607 ) ) ( not ( = ?auto_52606 ?auto_52607 ) ) ( ON ?auto_52605 ?auto_52606 ) ( ON-TABLE ?auto_52607 ) ( ON ?auto_52604 ?auto_52605 ) ( ON ?auto_52603 ?auto_52604 ) ( ON ?auto_52602 ?auto_52603 ) ( ON ?auto_52601 ?auto_52602 ) ( CLEAR ?auto_52601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52607 ?auto_52606 ?auto_52605 ?auto_52604 ?auto_52603 ?auto_52602 )
      ( MAKE-6PILE ?auto_52601 ?auto_52602 ?auto_52603 ?auto_52604 ?auto_52605 ?auto_52606 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52613 - BLOCK
      ?auto_52614 - BLOCK
      ?auto_52615 - BLOCK
      ?auto_52616 - BLOCK
      ?auto_52617 - BLOCK
    )
    :vars
    (
      ?auto_52618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52618 ?auto_52617 ) ( CLEAR ?auto_52618 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52613 ) ( ON ?auto_52614 ?auto_52613 ) ( ON ?auto_52615 ?auto_52614 ) ( ON ?auto_52616 ?auto_52615 ) ( ON ?auto_52617 ?auto_52616 ) ( not ( = ?auto_52613 ?auto_52614 ) ) ( not ( = ?auto_52613 ?auto_52615 ) ) ( not ( = ?auto_52613 ?auto_52616 ) ) ( not ( = ?auto_52613 ?auto_52617 ) ) ( not ( = ?auto_52613 ?auto_52618 ) ) ( not ( = ?auto_52614 ?auto_52615 ) ) ( not ( = ?auto_52614 ?auto_52616 ) ) ( not ( = ?auto_52614 ?auto_52617 ) ) ( not ( = ?auto_52614 ?auto_52618 ) ) ( not ( = ?auto_52615 ?auto_52616 ) ) ( not ( = ?auto_52615 ?auto_52617 ) ) ( not ( = ?auto_52615 ?auto_52618 ) ) ( not ( = ?auto_52616 ?auto_52617 ) ) ( not ( = ?auto_52616 ?auto_52618 ) ) ( not ( = ?auto_52617 ?auto_52618 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52618 ?auto_52617 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52632 - BLOCK
      ?auto_52633 - BLOCK
      ?auto_52634 - BLOCK
      ?auto_52635 - BLOCK
      ?auto_52636 - BLOCK
    )
    :vars
    (
      ?auto_52637 - BLOCK
      ?auto_52638 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52632 ) ( ON ?auto_52633 ?auto_52632 ) ( ON ?auto_52634 ?auto_52633 ) ( ON ?auto_52635 ?auto_52634 ) ( not ( = ?auto_52632 ?auto_52633 ) ) ( not ( = ?auto_52632 ?auto_52634 ) ) ( not ( = ?auto_52632 ?auto_52635 ) ) ( not ( = ?auto_52632 ?auto_52636 ) ) ( not ( = ?auto_52632 ?auto_52637 ) ) ( not ( = ?auto_52633 ?auto_52634 ) ) ( not ( = ?auto_52633 ?auto_52635 ) ) ( not ( = ?auto_52633 ?auto_52636 ) ) ( not ( = ?auto_52633 ?auto_52637 ) ) ( not ( = ?auto_52634 ?auto_52635 ) ) ( not ( = ?auto_52634 ?auto_52636 ) ) ( not ( = ?auto_52634 ?auto_52637 ) ) ( not ( = ?auto_52635 ?auto_52636 ) ) ( not ( = ?auto_52635 ?auto_52637 ) ) ( not ( = ?auto_52636 ?auto_52637 ) ) ( ON ?auto_52637 ?auto_52638 ) ( CLEAR ?auto_52637 ) ( not ( = ?auto_52632 ?auto_52638 ) ) ( not ( = ?auto_52633 ?auto_52638 ) ) ( not ( = ?auto_52634 ?auto_52638 ) ) ( not ( = ?auto_52635 ?auto_52638 ) ) ( not ( = ?auto_52636 ?auto_52638 ) ) ( not ( = ?auto_52637 ?auto_52638 ) ) ( HOLDING ?auto_52636 ) ( CLEAR ?auto_52635 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52632 ?auto_52633 ?auto_52634 ?auto_52635 ?auto_52636 ?auto_52637 )
      ( MAKE-5PILE ?auto_52632 ?auto_52633 ?auto_52634 ?auto_52635 ?auto_52636 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52639 - BLOCK
      ?auto_52640 - BLOCK
      ?auto_52641 - BLOCK
      ?auto_52642 - BLOCK
      ?auto_52643 - BLOCK
    )
    :vars
    (
      ?auto_52644 - BLOCK
      ?auto_52645 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52639 ) ( ON ?auto_52640 ?auto_52639 ) ( ON ?auto_52641 ?auto_52640 ) ( ON ?auto_52642 ?auto_52641 ) ( not ( = ?auto_52639 ?auto_52640 ) ) ( not ( = ?auto_52639 ?auto_52641 ) ) ( not ( = ?auto_52639 ?auto_52642 ) ) ( not ( = ?auto_52639 ?auto_52643 ) ) ( not ( = ?auto_52639 ?auto_52644 ) ) ( not ( = ?auto_52640 ?auto_52641 ) ) ( not ( = ?auto_52640 ?auto_52642 ) ) ( not ( = ?auto_52640 ?auto_52643 ) ) ( not ( = ?auto_52640 ?auto_52644 ) ) ( not ( = ?auto_52641 ?auto_52642 ) ) ( not ( = ?auto_52641 ?auto_52643 ) ) ( not ( = ?auto_52641 ?auto_52644 ) ) ( not ( = ?auto_52642 ?auto_52643 ) ) ( not ( = ?auto_52642 ?auto_52644 ) ) ( not ( = ?auto_52643 ?auto_52644 ) ) ( ON ?auto_52644 ?auto_52645 ) ( not ( = ?auto_52639 ?auto_52645 ) ) ( not ( = ?auto_52640 ?auto_52645 ) ) ( not ( = ?auto_52641 ?auto_52645 ) ) ( not ( = ?auto_52642 ?auto_52645 ) ) ( not ( = ?auto_52643 ?auto_52645 ) ) ( not ( = ?auto_52644 ?auto_52645 ) ) ( CLEAR ?auto_52642 ) ( ON ?auto_52643 ?auto_52644 ) ( CLEAR ?auto_52643 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52645 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52645 ?auto_52644 )
      ( MAKE-5PILE ?auto_52639 ?auto_52640 ?auto_52641 ?auto_52642 ?auto_52643 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52646 - BLOCK
      ?auto_52647 - BLOCK
      ?auto_52648 - BLOCK
      ?auto_52649 - BLOCK
      ?auto_52650 - BLOCK
    )
    :vars
    (
      ?auto_52651 - BLOCK
      ?auto_52652 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52646 ) ( ON ?auto_52647 ?auto_52646 ) ( ON ?auto_52648 ?auto_52647 ) ( not ( = ?auto_52646 ?auto_52647 ) ) ( not ( = ?auto_52646 ?auto_52648 ) ) ( not ( = ?auto_52646 ?auto_52649 ) ) ( not ( = ?auto_52646 ?auto_52650 ) ) ( not ( = ?auto_52646 ?auto_52651 ) ) ( not ( = ?auto_52647 ?auto_52648 ) ) ( not ( = ?auto_52647 ?auto_52649 ) ) ( not ( = ?auto_52647 ?auto_52650 ) ) ( not ( = ?auto_52647 ?auto_52651 ) ) ( not ( = ?auto_52648 ?auto_52649 ) ) ( not ( = ?auto_52648 ?auto_52650 ) ) ( not ( = ?auto_52648 ?auto_52651 ) ) ( not ( = ?auto_52649 ?auto_52650 ) ) ( not ( = ?auto_52649 ?auto_52651 ) ) ( not ( = ?auto_52650 ?auto_52651 ) ) ( ON ?auto_52651 ?auto_52652 ) ( not ( = ?auto_52646 ?auto_52652 ) ) ( not ( = ?auto_52647 ?auto_52652 ) ) ( not ( = ?auto_52648 ?auto_52652 ) ) ( not ( = ?auto_52649 ?auto_52652 ) ) ( not ( = ?auto_52650 ?auto_52652 ) ) ( not ( = ?auto_52651 ?auto_52652 ) ) ( ON ?auto_52650 ?auto_52651 ) ( CLEAR ?auto_52650 ) ( ON-TABLE ?auto_52652 ) ( HOLDING ?auto_52649 ) ( CLEAR ?auto_52648 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52646 ?auto_52647 ?auto_52648 ?auto_52649 )
      ( MAKE-5PILE ?auto_52646 ?auto_52647 ?auto_52648 ?auto_52649 ?auto_52650 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52653 - BLOCK
      ?auto_52654 - BLOCK
      ?auto_52655 - BLOCK
      ?auto_52656 - BLOCK
      ?auto_52657 - BLOCK
    )
    :vars
    (
      ?auto_52659 - BLOCK
      ?auto_52658 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52653 ) ( ON ?auto_52654 ?auto_52653 ) ( ON ?auto_52655 ?auto_52654 ) ( not ( = ?auto_52653 ?auto_52654 ) ) ( not ( = ?auto_52653 ?auto_52655 ) ) ( not ( = ?auto_52653 ?auto_52656 ) ) ( not ( = ?auto_52653 ?auto_52657 ) ) ( not ( = ?auto_52653 ?auto_52659 ) ) ( not ( = ?auto_52654 ?auto_52655 ) ) ( not ( = ?auto_52654 ?auto_52656 ) ) ( not ( = ?auto_52654 ?auto_52657 ) ) ( not ( = ?auto_52654 ?auto_52659 ) ) ( not ( = ?auto_52655 ?auto_52656 ) ) ( not ( = ?auto_52655 ?auto_52657 ) ) ( not ( = ?auto_52655 ?auto_52659 ) ) ( not ( = ?auto_52656 ?auto_52657 ) ) ( not ( = ?auto_52656 ?auto_52659 ) ) ( not ( = ?auto_52657 ?auto_52659 ) ) ( ON ?auto_52659 ?auto_52658 ) ( not ( = ?auto_52653 ?auto_52658 ) ) ( not ( = ?auto_52654 ?auto_52658 ) ) ( not ( = ?auto_52655 ?auto_52658 ) ) ( not ( = ?auto_52656 ?auto_52658 ) ) ( not ( = ?auto_52657 ?auto_52658 ) ) ( not ( = ?auto_52659 ?auto_52658 ) ) ( ON ?auto_52657 ?auto_52659 ) ( ON-TABLE ?auto_52658 ) ( CLEAR ?auto_52655 ) ( ON ?auto_52656 ?auto_52657 ) ( CLEAR ?auto_52656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52658 ?auto_52659 ?auto_52657 )
      ( MAKE-5PILE ?auto_52653 ?auto_52654 ?auto_52655 ?auto_52656 ?auto_52657 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52660 - BLOCK
      ?auto_52661 - BLOCK
      ?auto_52662 - BLOCK
      ?auto_52663 - BLOCK
      ?auto_52664 - BLOCK
    )
    :vars
    (
      ?auto_52666 - BLOCK
      ?auto_52665 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52660 ) ( ON ?auto_52661 ?auto_52660 ) ( not ( = ?auto_52660 ?auto_52661 ) ) ( not ( = ?auto_52660 ?auto_52662 ) ) ( not ( = ?auto_52660 ?auto_52663 ) ) ( not ( = ?auto_52660 ?auto_52664 ) ) ( not ( = ?auto_52660 ?auto_52666 ) ) ( not ( = ?auto_52661 ?auto_52662 ) ) ( not ( = ?auto_52661 ?auto_52663 ) ) ( not ( = ?auto_52661 ?auto_52664 ) ) ( not ( = ?auto_52661 ?auto_52666 ) ) ( not ( = ?auto_52662 ?auto_52663 ) ) ( not ( = ?auto_52662 ?auto_52664 ) ) ( not ( = ?auto_52662 ?auto_52666 ) ) ( not ( = ?auto_52663 ?auto_52664 ) ) ( not ( = ?auto_52663 ?auto_52666 ) ) ( not ( = ?auto_52664 ?auto_52666 ) ) ( ON ?auto_52666 ?auto_52665 ) ( not ( = ?auto_52660 ?auto_52665 ) ) ( not ( = ?auto_52661 ?auto_52665 ) ) ( not ( = ?auto_52662 ?auto_52665 ) ) ( not ( = ?auto_52663 ?auto_52665 ) ) ( not ( = ?auto_52664 ?auto_52665 ) ) ( not ( = ?auto_52666 ?auto_52665 ) ) ( ON ?auto_52664 ?auto_52666 ) ( ON-TABLE ?auto_52665 ) ( ON ?auto_52663 ?auto_52664 ) ( CLEAR ?auto_52663 ) ( HOLDING ?auto_52662 ) ( CLEAR ?auto_52661 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52660 ?auto_52661 ?auto_52662 )
      ( MAKE-5PILE ?auto_52660 ?auto_52661 ?auto_52662 ?auto_52663 ?auto_52664 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52667 - BLOCK
      ?auto_52668 - BLOCK
      ?auto_52669 - BLOCK
      ?auto_52670 - BLOCK
      ?auto_52671 - BLOCK
    )
    :vars
    (
      ?auto_52673 - BLOCK
      ?auto_52672 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52667 ) ( ON ?auto_52668 ?auto_52667 ) ( not ( = ?auto_52667 ?auto_52668 ) ) ( not ( = ?auto_52667 ?auto_52669 ) ) ( not ( = ?auto_52667 ?auto_52670 ) ) ( not ( = ?auto_52667 ?auto_52671 ) ) ( not ( = ?auto_52667 ?auto_52673 ) ) ( not ( = ?auto_52668 ?auto_52669 ) ) ( not ( = ?auto_52668 ?auto_52670 ) ) ( not ( = ?auto_52668 ?auto_52671 ) ) ( not ( = ?auto_52668 ?auto_52673 ) ) ( not ( = ?auto_52669 ?auto_52670 ) ) ( not ( = ?auto_52669 ?auto_52671 ) ) ( not ( = ?auto_52669 ?auto_52673 ) ) ( not ( = ?auto_52670 ?auto_52671 ) ) ( not ( = ?auto_52670 ?auto_52673 ) ) ( not ( = ?auto_52671 ?auto_52673 ) ) ( ON ?auto_52673 ?auto_52672 ) ( not ( = ?auto_52667 ?auto_52672 ) ) ( not ( = ?auto_52668 ?auto_52672 ) ) ( not ( = ?auto_52669 ?auto_52672 ) ) ( not ( = ?auto_52670 ?auto_52672 ) ) ( not ( = ?auto_52671 ?auto_52672 ) ) ( not ( = ?auto_52673 ?auto_52672 ) ) ( ON ?auto_52671 ?auto_52673 ) ( ON-TABLE ?auto_52672 ) ( ON ?auto_52670 ?auto_52671 ) ( CLEAR ?auto_52668 ) ( ON ?auto_52669 ?auto_52670 ) ( CLEAR ?auto_52669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52672 ?auto_52673 ?auto_52671 ?auto_52670 )
      ( MAKE-5PILE ?auto_52667 ?auto_52668 ?auto_52669 ?auto_52670 ?auto_52671 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52674 - BLOCK
      ?auto_52675 - BLOCK
      ?auto_52676 - BLOCK
      ?auto_52677 - BLOCK
      ?auto_52678 - BLOCK
    )
    :vars
    (
      ?auto_52680 - BLOCK
      ?auto_52679 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52674 ) ( not ( = ?auto_52674 ?auto_52675 ) ) ( not ( = ?auto_52674 ?auto_52676 ) ) ( not ( = ?auto_52674 ?auto_52677 ) ) ( not ( = ?auto_52674 ?auto_52678 ) ) ( not ( = ?auto_52674 ?auto_52680 ) ) ( not ( = ?auto_52675 ?auto_52676 ) ) ( not ( = ?auto_52675 ?auto_52677 ) ) ( not ( = ?auto_52675 ?auto_52678 ) ) ( not ( = ?auto_52675 ?auto_52680 ) ) ( not ( = ?auto_52676 ?auto_52677 ) ) ( not ( = ?auto_52676 ?auto_52678 ) ) ( not ( = ?auto_52676 ?auto_52680 ) ) ( not ( = ?auto_52677 ?auto_52678 ) ) ( not ( = ?auto_52677 ?auto_52680 ) ) ( not ( = ?auto_52678 ?auto_52680 ) ) ( ON ?auto_52680 ?auto_52679 ) ( not ( = ?auto_52674 ?auto_52679 ) ) ( not ( = ?auto_52675 ?auto_52679 ) ) ( not ( = ?auto_52676 ?auto_52679 ) ) ( not ( = ?auto_52677 ?auto_52679 ) ) ( not ( = ?auto_52678 ?auto_52679 ) ) ( not ( = ?auto_52680 ?auto_52679 ) ) ( ON ?auto_52678 ?auto_52680 ) ( ON-TABLE ?auto_52679 ) ( ON ?auto_52677 ?auto_52678 ) ( ON ?auto_52676 ?auto_52677 ) ( CLEAR ?auto_52676 ) ( HOLDING ?auto_52675 ) ( CLEAR ?auto_52674 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52674 ?auto_52675 )
      ( MAKE-5PILE ?auto_52674 ?auto_52675 ?auto_52676 ?auto_52677 ?auto_52678 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52681 - BLOCK
      ?auto_52682 - BLOCK
      ?auto_52683 - BLOCK
      ?auto_52684 - BLOCK
      ?auto_52685 - BLOCK
    )
    :vars
    (
      ?auto_52687 - BLOCK
      ?auto_52686 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52681 ) ( not ( = ?auto_52681 ?auto_52682 ) ) ( not ( = ?auto_52681 ?auto_52683 ) ) ( not ( = ?auto_52681 ?auto_52684 ) ) ( not ( = ?auto_52681 ?auto_52685 ) ) ( not ( = ?auto_52681 ?auto_52687 ) ) ( not ( = ?auto_52682 ?auto_52683 ) ) ( not ( = ?auto_52682 ?auto_52684 ) ) ( not ( = ?auto_52682 ?auto_52685 ) ) ( not ( = ?auto_52682 ?auto_52687 ) ) ( not ( = ?auto_52683 ?auto_52684 ) ) ( not ( = ?auto_52683 ?auto_52685 ) ) ( not ( = ?auto_52683 ?auto_52687 ) ) ( not ( = ?auto_52684 ?auto_52685 ) ) ( not ( = ?auto_52684 ?auto_52687 ) ) ( not ( = ?auto_52685 ?auto_52687 ) ) ( ON ?auto_52687 ?auto_52686 ) ( not ( = ?auto_52681 ?auto_52686 ) ) ( not ( = ?auto_52682 ?auto_52686 ) ) ( not ( = ?auto_52683 ?auto_52686 ) ) ( not ( = ?auto_52684 ?auto_52686 ) ) ( not ( = ?auto_52685 ?auto_52686 ) ) ( not ( = ?auto_52687 ?auto_52686 ) ) ( ON ?auto_52685 ?auto_52687 ) ( ON-TABLE ?auto_52686 ) ( ON ?auto_52684 ?auto_52685 ) ( ON ?auto_52683 ?auto_52684 ) ( CLEAR ?auto_52681 ) ( ON ?auto_52682 ?auto_52683 ) ( CLEAR ?auto_52682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52686 ?auto_52687 ?auto_52685 ?auto_52684 ?auto_52683 )
      ( MAKE-5PILE ?auto_52681 ?auto_52682 ?auto_52683 ?auto_52684 ?auto_52685 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52688 - BLOCK
      ?auto_52689 - BLOCK
      ?auto_52690 - BLOCK
      ?auto_52691 - BLOCK
      ?auto_52692 - BLOCK
    )
    :vars
    (
      ?auto_52693 - BLOCK
      ?auto_52694 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52688 ?auto_52689 ) ) ( not ( = ?auto_52688 ?auto_52690 ) ) ( not ( = ?auto_52688 ?auto_52691 ) ) ( not ( = ?auto_52688 ?auto_52692 ) ) ( not ( = ?auto_52688 ?auto_52693 ) ) ( not ( = ?auto_52689 ?auto_52690 ) ) ( not ( = ?auto_52689 ?auto_52691 ) ) ( not ( = ?auto_52689 ?auto_52692 ) ) ( not ( = ?auto_52689 ?auto_52693 ) ) ( not ( = ?auto_52690 ?auto_52691 ) ) ( not ( = ?auto_52690 ?auto_52692 ) ) ( not ( = ?auto_52690 ?auto_52693 ) ) ( not ( = ?auto_52691 ?auto_52692 ) ) ( not ( = ?auto_52691 ?auto_52693 ) ) ( not ( = ?auto_52692 ?auto_52693 ) ) ( ON ?auto_52693 ?auto_52694 ) ( not ( = ?auto_52688 ?auto_52694 ) ) ( not ( = ?auto_52689 ?auto_52694 ) ) ( not ( = ?auto_52690 ?auto_52694 ) ) ( not ( = ?auto_52691 ?auto_52694 ) ) ( not ( = ?auto_52692 ?auto_52694 ) ) ( not ( = ?auto_52693 ?auto_52694 ) ) ( ON ?auto_52692 ?auto_52693 ) ( ON-TABLE ?auto_52694 ) ( ON ?auto_52691 ?auto_52692 ) ( ON ?auto_52690 ?auto_52691 ) ( ON ?auto_52689 ?auto_52690 ) ( CLEAR ?auto_52689 ) ( HOLDING ?auto_52688 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52688 )
      ( MAKE-5PILE ?auto_52688 ?auto_52689 ?auto_52690 ?auto_52691 ?auto_52692 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52695 - BLOCK
      ?auto_52696 - BLOCK
      ?auto_52697 - BLOCK
      ?auto_52698 - BLOCK
      ?auto_52699 - BLOCK
    )
    :vars
    (
      ?auto_52700 - BLOCK
      ?auto_52701 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52695 ?auto_52696 ) ) ( not ( = ?auto_52695 ?auto_52697 ) ) ( not ( = ?auto_52695 ?auto_52698 ) ) ( not ( = ?auto_52695 ?auto_52699 ) ) ( not ( = ?auto_52695 ?auto_52700 ) ) ( not ( = ?auto_52696 ?auto_52697 ) ) ( not ( = ?auto_52696 ?auto_52698 ) ) ( not ( = ?auto_52696 ?auto_52699 ) ) ( not ( = ?auto_52696 ?auto_52700 ) ) ( not ( = ?auto_52697 ?auto_52698 ) ) ( not ( = ?auto_52697 ?auto_52699 ) ) ( not ( = ?auto_52697 ?auto_52700 ) ) ( not ( = ?auto_52698 ?auto_52699 ) ) ( not ( = ?auto_52698 ?auto_52700 ) ) ( not ( = ?auto_52699 ?auto_52700 ) ) ( ON ?auto_52700 ?auto_52701 ) ( not ( = ?auto_52695 ?auto_52701 ) ) ( not ( = ?auto_52696 ?auto_52701 ) ) ( not ( = ?auto_52697 ?auto_52701 ) ) ( not ( = ?auto_52698 ?auto_52701 ) ) ( not ( = ?auto_52699 ?auto_52701 ) ) ( not ( = ?auto_52700 ?auto_52701 ) ) ( ON ?auto_52699 ?auto_52700 ) ( ON-TABLE ?auto_52701 ) ( ON ?auto_52698 ?auto_52699 ) ( ON ?auto_52697 ?auto_52698 ) ( ON ?auto_52696 ?auto_52697 ) ( ON ?auto_52695 ?auto_52696 ) ( CLEAR ?auto_52695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52701 ?auto_52700 ?auto_52699 ?auto_52698 ?auto_52697 ?auto_52696 )
      ( MAKE-5PILE ?auto_52695 ?auto_52696 ?auto_52697 ?auto_52698 ?auto_52699 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52703 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_52703 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_52703 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52704 - BLOCK
    )
    :vars
    (
      ?auto_52705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52704 ?auto_52705 ) ( CLEAR ?auto_52704 ) ( HAND-EMPTY ) ( not ( = ?auto_52704 ?auto_52705 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52704 ?auto_52705 )
      ( MAKE-1PILE ?auto_52704 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52706 - BLOCK
    )
    :vars
    (
      ?auto_52707 - BLOCK
      ?auto_52709 - BLOCK
      ?auto_52708 - BLOCK
      ?auto_52711 - BLOCK
      ?auto_52710 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52706 ?auto_52707 ) ) ( HOLDING ?auto_52706 ) ( CLEAR ?auto_52707 ) ( ON-TABLE ?auto_52709 ) ( ON ?auto_52708 ?auto_52709 ) ( ON ?auto_52711 ?auto_52708 ) ( ON ?auto_52710 ?auto_52711 ) ( ON ?auto_52707 ?auto_52710 ) ( not ( = ?auto_52709 ?auto_52708 ) ) ( not ( = ?auto_52709 ?auto_52711 ) ) ( not ( = ?auto_52709 ?auto_52710 ) ) ( not ( = ?auto_52709 ?auto_52707 ) ) ( not ( = ?auto_52709 ?auto_52706 ) ) ( not ( = ?auto_52708 ?auto_52711 ) ) ( not ( = ?auto_52708 ?auto_52710 ) ) ( not ( = ?auto_52708 ?auto_52707 ) ) ( not ( = ?auto_52708 ?auto_52706 ) ) ( not ( = ?auto_52711 ?auto_52710 ) ) ( not ( = ?auto_52711 ?auto_52707 ) ) ( not ( = ?auto_52711 ?auto_52706 ) ) ( not ( = ?auto_52710 ?auto_52707 ) ) ( not ( = ?auto_52710 ?auto_52706 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52709 ?auto_52708 ?auto_52711 ?auto_52710 ?auto_52707 ?auto_52706 )
      ( MAKE-1PILE ?auto_52706 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52712 - BLOCK
    )
    :vars
    (
      ?auto_52713 - BLOCK
      ?auto_52715 - BLOCK
      ?auto_52717 - BLOCK
      ?auto_52716 - BLOCK
      ?auto_52714 - BLOCK
      ?auto_52718 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52712 ?auto_52713 ) ) ( CLEAR ?auto_52713 ) ( ON-TABLE ?auto_52715 ) ( ON ?auto_52717 ?auto_52715 ) ( ON ?auto_52716 ?auto_52717 ) ( ON ?auto_52714 ?auto_52716 ) ( ON ?auto_52713 ?auto_52714 ) ( not ( = ?auto_52715 ?auto_52717 ) ) ( not ( = ?auto_52715 ?auto_52716 ) ) ( not ( = ?auto_52715 ?auto_52714 ) ) ( not ( = ?auto_52715 ?auto_52713 ) ) ( not ( = ?auto_52715 ?auto_52712 ) ) ( not ( = ?auto_52717 ?auto_52716 ) ) ( not ( = ?auto_52717 ?auto_52714 ) ) ( not ( = ?auto_52717 ?auto_52713 ) ) ( not ( = ?auto_52717 ?auto_52712 ) ) ( not ( = ?auto_52716 ?auto_52714 ) ) ( not ( = ?auto_52716 ?auto_52713 ) ) ( not ( = ?auto_52716 ?auto_52712 ) ) ( not ( = ?auto_52714 ?auto_52713 ) ) ( not ( = ?auto_52714 ?auto_52712 ) ) ( ON ?auto_52712 ?auto_52718 ) ( CLEAR ?auto_52712 ) ( HAND-EMPTY ) ( not ( = ?auto_52712 ?auto_52718 ) ) ( not ( = ?auto_52713 ?auto_52718 ) ) ( not ( = ?auto_52715 ?auto_52718 ) ) ( not ( = ?auto_52717 ?auto_52718 ) ) ( not ( = ?auto_52716 ?auto_52718 ) ) ( not ( = ?auto_52714 ?auto_52718 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52712 ?auto_52718 )
      ( MAKE-1PILE ?auto_52712 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52719 - BLOCK
    )
    :vars
    (
      ?auto_52722 - BLOCK
      ?auto_52723 - BLOCK
      ?auto_52720 - BLOCK
      ?auto_52724 - BLOCK
      ?auto_52725 - BLOCK
      ?auto_52721 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52719 ?auto_52722 ) ) ( ON-TABLE ?auto_52723 ) ( ON ?auto_52720 ?auto_52723 ) ( ON ?auto_52724 ?auto_52720 ) ( ON ?auto_52725 ?auto_52724 ) ( not ( = ?auto_52723 ?auto_52720 ) ) ( not ( = ?auto_52723 ?auto_52724 ) ) ( not ( = ?auto_52723 ?auto_52725 ) ) ( not ( = ?auto_52723 ?auto_52722 ) ) ( not ( = ?auto_52723 ?auto_52719 ) ) ( not ( = ?auto_52720 ?auto_52724 ) ) ( not ( = ?auto_52720 ?auto_52725 ) ) ( not ( = ?auto_52720 ?auto_52722 ) ) ( not ( = ?auto_52720 ?auto_52719 ) ) ( not ( = ?auto_52724 ?auto_52725 ) ) ( not ( = ?auto_52724 ?auto_52722 ) ) ( not ( = ?auto_52724 ?auto_52719 ) ) ( not ( = ?auto_52725 ?auto_52722 ) ) ( not ( = ?auto_52725 ?auto_52719 ) ) ( ON ?auto_52719 ?auto_52721 ) ( CLEAR ?auto_52719 ) ( not ( = ?auto_52719 ?auto_52721 ) ) ( not ( = ?auto_52722 ?auto_52721 ) ) ( not ( = ?auto_52723 ?auto_52721 ) ) ( not ( = ?auto_52720 ?auto_52721 ) ) ( not ( = ?auto_52724 ?auto_52721 ) ) ( not ( = ?auto_52725 ?auto_52721 ) ) ( HOLDING ?auto_52722 ) ( CLEAR ?auto_52725 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52723 ?auto_52720 ?auto_52724 ?auto_52725 ?auto_52722 )
      ( MAKE-1PILE ?auto_52719 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52726 - BLOCK
    )
    :vars
    (
      ?auto_52732 - BLOCK
      ?auto_52727 - BLOCK
      ?auto_52730 - BLOCK
      ?auto_52729 - BLOCK
      ?auto_52731 - BLOCK
      ?auto_52728 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52726 ?auto_52732 ) ) ( ON-TABLE ?auto_52727 ) ( ON ?auto_52730 ?auto_52727 ) ( ON ?auto_52729 ?auto_52730 ) ( ON ?auto_52731 ?auto_52729 ) ( not ( = ?auto_52727 ?auto_52730 ) ) ( not ( = ?auto_52727 ?auto_52729 ) ) ( not ( = ?auto_52727 ?auto_52731 ) ) ( not ( = ?auto_52727 ?auto_52732 ) ) ( not ( = ?auto_52727 ?auto_52726 ) ) ( not ( = ?auto_52730 ?auto_52729 ) ) ( not ( = ?auto_52730 ?auto_52731 ) ) ( not ( = ?auto_52730 ?auto_52732 ) ) ( not ( = ?auto_52730 ?auto_52726 ) ) ( not ( = ?auto_52729 ?auto_52731 ) ) ( not ( = ?auto_52729 ?auto_52732 ) ) ( not ( = ?auto_52729 ?auto_52726 ) ) ( not ( = ?auto_52731 ?auto_52732 ) ) ( not ( = ?auto_52731 ?auto_52726 ) ) ( ON ?auto_52726 ?auto_52728 ) ( not ( = ?auto_52726 ?auto_52728 ) ) ( not ( = ?auto_52732 ?auto_52728 ) ) ( not ( = ?auto_52727 ?auto_52728 ) ) ( not ( = ?auto_52730 ?auto_52728 ) ) ( not ( = ?auto_52729 ?auto_52728 ) ) ( not ( = ?auto_52731 ?auto_52728 ) ) ( CLEAR ?auto_52731 ) ( ON ?auto_52732 ?auto_52726 ) ( CLEAR ?auto_52732 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52728 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52728 ?auto_52726 )
      ( MAKE-1PILE ?auto_52726 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52733 - BLOCK
    )
    :vars
    (
      ?auto_52737 - BLOCK
      ?auto_52735 - BLOCK
      ?auto_52734 - BLOCK
      ?auto_52739 - BLOCK
      ?auto_52736 - BLOCK
      ?auto_52738 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52733 ?auto_52737 ) ) ( ON-TABLE ?auto_52735 ) ( ON ?auto_52734 ?auto_52735 ) ( ON ?auto_52739 ?auto_52734 ) ( not ( = ?auto_52735 ?auto_52734 ) ) ( not ( = ?auto_52735 ?auto_52739 ) ) ( not ( = ?auto_52735 ?auto_52736 ) ) ( not ( = ?auto_52735 ?auto_52737 ) ) ( not ( = ?auto_52735 ?auto_52733 ) ) ( not ( = ?auto_52734 ?auto_52739 ) ) ( not ( = ?auto_52734 ?auto_52736 ) ) ( not ( = ?auto_52734 ?auto_52737 ) ) ( not ( = ?auto_52734 ?auto_52733 ) ) ( not ( = ?auto_52739 ?auto_52736 ) ) ( not ( = ?auto_52739 ?auto_52737 ) ) ( not ( = ?auto_52739 ?auto_52733 ) ) ( not ( = ?auto_52736 ?auto_52737 ) ) ( not ( = ?auto_52736 ?auto_52733 ) ) ( ON ?auto_52733 ?auto_52738 ) ( not ( = ?auto_52733 ?auto_52738 ) ) ( not ( = ?auto_52737 ?auto_52738 ) ) ( not ( = ?auto_52735 ?auto_52738 ) ) ( not ( = ?auto_52734 ?auto_52738 ) ) ( not ( = ?auto_52739 ?auto_52738 ) ) ( not ( = ?auto_52736 ?auto_52738 ) ) ( ON ?auto_52737 ?auto_52733 ) ( CLEAR ?auto_52737 ) ( ON-TABLE ?auto_52738 ) ( HOLDING ?auto_52736 ) ( CLEAR ?auto_52739 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52735 ?auto_52734 ?auto_52739 ?auto_52736 )
      ( MAKE-1PILE ?auto_52733 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52740 - BLOCK
    )
    :vars
    (
      ?auto_52744 - BLOCK
      ?auto_52745 - BLOCK
      ?auto_52746 - BLOCK
      ?auto_52743 - BLOCK
      ?auto_52741 - BLOCK
      ?auto_52742 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52740 ?auto_52744 ) ) ( ON-TABLE ?auto_52745 ) ( ON ?auto_52746 ?auto_52745 ) ( ON ?auto_52743 ?auto_52746 ) ( not ( = ?auto_52745 ?auto_52746 ) ) ( not ( = ?auto_52745 ?auto_52743 ) ) ( not ( = ?auto_52745 ?auto_52741 ) ) ( not ( = ?auto_52745 ?auto_52744 ) ) ( not ( = ?auto_52745 ?auto_52740 ) ) ( not ( = ?auto_52746 ?auto_52743 ) ) ( not ( = ?auto_52746 ?auto_52741 ) ) ( not ( = ?auto_52746 ?auto_52744 ) ) ( not ( = ?auto_52746 ?auto_52740 ) ) ( not ( = ?auto_52743 ?auto_52741 ) ) ( not ( = ?auto_52743 ?auto_52744 ) ) ( not ( = ?auto_52743 ?auto_52740 ) ) ( not ( = ?auto_52741 ?auto_52744 ) ) ( not ( = ?auto_52741 ?auto_52740 ) ) ( ON ?auto_52740 ?auto_52742 ) ( not ( = ?auto_52740 ?auto_52742 ) ) ( not ( = ?auto_52744 ?auto_52742 ) ) ( not ( = ?auto_52745 ?auto_52742 ) ) ( not ( = ?auto_52746 ?auto_52742 ) ) ( not ( = ?auto_52743 ?auto_52742 ) ) ( not ( = ?auto_52741 ?auto_52742 ) ) ( ON ?auto_52744 ?auto_52740 ) ( ON-TABLE ?auto_52742 ) ( CLEAR ?auto_52743 ) ( ON ?auto_52741 ?auto_52744 ) ( CLEAR ?auto_52741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52742 ?auto_52740 ?auto_52744 )
      ( MAKE-1PILE ?auto_52740 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52747 - BLOCK
    )
    :vars
    (
      ?auto_52748 - BLOCK
      ?auto_52750 - BLOCK
      ?auto_52752 - BLOCK
      ?auto_52749 - BLOCK
      ?auto_52751 - BLOCK
      ?auto_52753 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52747 ?auto_52748 ) ) ( ON-TABLE ?auto_52750 ) ( ON ?auto_52752 ?auto_52750 ) ( not ( = ?auto_52750 ?auto_52752 ) ) ( not ( = ?auto_52750 ?auto_52749 ) ) ( not ( = ?auto_52750 ?auto_52751 ) ) ( not ( = ?auto_52750 ?auto_52748 ) ) ( not ( = ?auto_52750 ?auto_52747 ) ) ( not ( = ?auto_52752 ?auto_52749 ) ) ( not ( = ?auto_52752 ?auto_52751 ) ) ( not ( = ?auto_52752 ?auto_52748 ) ) ( not ( = ?auto_52752 ?auto_52747 ) ) ( not ( = ?auto_52749 ?auto_52751 ) ) ( not ( = ?auto_52749 ?auto_52748 ) ) ( not ( = ?auto_52749 ?auto_52747 ) ) ( not ( = ?auto_52751 ?auto_52748 ) ) ( not ( = ?auto_52751 ?auto_52747 ) ) ( ON ?auto_52747 ?auto_52753 ) ( not ( = ?auto_52747 ?auto_52753 ) ) ( not ( = ?auto_52748 ?auto_52753 ) ) ( not ( = ?auto_52750 ?auto_52753 ) ) ( not ( = ?auto_52752 ?auto_52753 ) ) ( not ( = ?auto_52749 ?auto_52753 ) ) ( not ( = ?auto_52751 ?auto_52753 ) ) ( ON ?auto_52748 ?auto_52747 ) ( ON-TABLE ?auto_52753 ) ( ON ?auto_52751 ?auto_52748 ) ( CLEAR ?auto_52751 ) ( HOLDING ?auto_52749 ) ( CLEAR ?auto_52752 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52750 ?auto_52752 ?auto_52749 )
      ( MAKE-1PILE ?auto_52747 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52754 - BLOCK
    )
    :vars
    (
      ?auto_52755 - BLOCK
      ?auto_52756 - BLOCK
      ?auto_52758 - BLOCK
      ?auto_52759 - BLOCK
      ?auto_52760 - BLOCK
      ?auto_52757 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52754 ?auto_52755 ) ) ( ON-TABLE ?auto_52756 ) ( ON ?auto_52758 ?auto_52756 ) ( not ( = ?auto_52756 ?auto_52758 ) ) ( not ( = ?auto_52756 ?auto_52759 ) ) ( not ( = ?auto_52756 ?auto_52760 ) ) ( not ( = ?auto_52756 ?auto_52755 ) ) ( not ( = ?auto_52756 ?auto_52754 ) ) ( not ( = ?auto_52758 ?auto_52759 ) ) ( not ( = ?auto_52758 ?auto_52760 ) ) ( not ( = ?auto_52758 ?auto_52755 ) ) ( not ( = ?auto_52758 ?auto_52754 ) ) ( not ( = ?auto_52759 ?auto_52760 ) ) ( not ( = ?auto_52759 ?auto_52755 ) ) ( not ( = ?auto_52759 ?auto_52754 ) ) ( not ( = ?auto_52760 ?auto_52755 ) ) ( not ( = ?auto_52760 ?auto_52754 ) ) ( ON ?auto_52754 ?auto_52757 ) ( not ( = ?auto_52754 ?auto_52757 ) ) ( not ( = ?auto_52755 ?auto_52757 ) ) ( not ( = ?auto_52756 ?auto_52757 ) ) ( not ( = ?auto_52758 ?auto_52757 ) ) ( not ( = ?auto_52759 ?auto_52757 ) ) ( not ( = ?auto_52760 ?auto_52757 ) ) ( ON ?auto_52755 ?auto_52754 ) ( ON-TABLE ?auto_52757 ) ( ON ?auto_52760 ?auto_52755 ) ( CLEAR ?auto_52758 ) ( ON ?auto_52759 ?auto_52760 ) ( CLEAR ?auto_52759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52757 ?auto_52754 ?auto_52755 ?auto_52760 )
      ( MAKE-1PILE ?auto_52754 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52761 - BLOCK
    )
    :vars
    (
      ?auto_52764 - BLOCK
      ?auto_52767 - BLOCK
      ?auto_52763 - BLOCK
      ?auto_52766 - BLOCK
      ?auto_52765 - BLOCK
      ?auto_52762 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52761 ?auto_52764 ) ) ( ON-TABLE ?auto_52767 ) ( not ( = ?auto_52767 ?auto_52763 ) ) ( not ( = ?auto_52767 ?auto_52766 ) ) ( not ( = ?auto_52767 ?auto_52765 ) ) ( not ( = ?auto_52767 ?auto_52764 ) ) ( not ( = ?auto_52767 ?auto_52761 ) ) ( not ( = ?auto_52763 ?auto_52766 ) ) ( not ( = ?auto_52763 ?auto_52765 ) ) ( not ( = ?auto_52763 ?auto_52764 ) ) ( not ( = ?auto_52763 ?auto_52761 ) ) ( not ( = ?auto_52766 ?auto_52765 ) ) ( not ( = ?auto_52766 ?auto_52764 ) ) ( not ( = ?auto_52766 ?auto_52761 ) ) ( not ( = ?auto_52765 ?auto_52764 ) ) ( not ( = ?auto_52765 ?auto_52761 ) ) ( ON ?auto_52761 ?auto_52762 ) ( not ( = ?auto_52761 ?auto_52762 ) ) ( not ( = ?auto_52764 ?auto_52762 ) ) ( not ( = ?auto_52767 ?auto_52762 ) ) ( not ( = ?auto_52763 ?auto_52762 ) ) ( not ( = ?auto_52766 ?auto_52762 ) ) ( not ( = ?auto_52765 ?auto_52762 ) ) ( ON ?auto_52764 ?auto_52761 ) ( ON-TABLE ?auto_52762 ) ( ON ?auto_52765 ?auto_52764 ) ( ON ?auto_52766 ?auto_52765 ) ( CLEAR ?auto_52766 ) ( HOLDING ?auto_52763 ) ( CLEAR ?auto_52767 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52767 ?auto_52763 )
      ( MAKE-1PILE ?auto_52761 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52768 - BLOCK
    )
    :vars
    (
      ?auto_52769 - BLOCK
      ?auto_52774 - BLOCK
      ?auto_52773 - BLOCK
      ?auto_52772 - BLOCK
      ?auto_52770 - BLOCK
      ?auto_52771 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52768 ?auto_52769 ) ) ( ON-TABLE ?auto_52774 ) ( not ( = ?auto_52774 ?auto_52773 ) ) ( not ( = ?auto_52774 ?auto_52772 ) ) ( not ( = ?auto_52774 ?auto_52770 ) ) ( not ( = ?auto_52774 ?auto_52769 ) ) ( not ( = ?auto_52774 ?auto_52768 ) ) ( not ( = ?auto_52773 ?auto_52772 ) ) ( not ( = ?auto_52773 ?auto_52770 ) ) ( not ( = ?auto_52773 ?auto_52769 ) ) ( not ( = ?auto_52773 ?auto_52768 ) ) ( not ( = ?auto_52772 ?auto_52770 ) ) ( not ( = ?auto_52772 ?auto_52769 ) ) ( not ( = ?auto_52772 ?auto_52768 ) ) ( not ( = ?auto_52770 ?auto_52769 ) ) ( not ( = ?auto_52770 ?auto_52768 ) ) ( ON ?auto_52768 ?auto_52771 ) ( not ( = ?auto_52768 ?auto_52771 ) ) ( not ( = ?auto_52769 ?auto_52771 ) ) ( not ( = ?auto_52774 ?auto_52771 ) ) ( not ( = ?auto_52773 ?auto_52771 ) ) ( not ( = ?auto_52772 ?auto_52771 ) ) ( not ( = ?auto_52770 ?auto_52771 ) ) ( ON ?auto_52769 ?auto_52768 ) ( ON-TABLE ?auto_52771 ) ( ON ?auto_52770 ?auto_52769 ) ( ON ?auto_52772 ?auto_52770 ) ( CLEAR ?auto_52774 ) ( ON ?auto_52773 ?auto_52772 ) ( CLEAR ?auto_52773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52771 ?auto_52768 ?auto_52769 ?auto_52770 ?auto_52772 )
      ( MAKE-1PILE ?auto_52768 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52775 - BLOCK
    )
    :vars
    (
      ?auto_52779 - BLOCK
      ?auto_52777 - BLOCK
      ?auto_52778 - BLOCK
      ?auto_52776 - BLOCK
      ?auto_52780 - BLOCK
      ?auto_52781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52775 ?auto_52779 ) ) ( not ( = ?auto_52777 ?auto_52778 ) ) ( not ( = ?auto_52777 ?auto_52776 ) ) ( not ( = ?auto_52777 ?auto_52780 ) ) ( not ( = ?auto_52777 ?auto_52779 ) ) ( not ( = ?auto_52777 ?auto_52775 ) ) ( not ( = ?auto_52778 ?auto_52776 ) ) ( not ( = ?auto_52778 ?auto_52780 ) ) ( not ( = ?auto_52778 ?auto_52779 ) ) ( not ( = ?auto_52778 ?auto_52775 ) ) ( not ( = ?auto_52776 ?auto_52780 ) ) ( not ( = ?auto_52776 ?auto_52779 ) ) ( not ( = ?auto_52776 ?auto_52775 ) ) ( not ( = ?auto_52780 ?auto_52779 ) ) ( not ( = ?auto_52780 ?auto_52775 ) ) ( ON ?auto_52775 ?auto_52781 ) ( not ( = ?auto_52775 ?auto_52781 ) ) ( not ( = ?auto_52779 ?auto_52781 ) ) ( not ( = ?auto_52777 ?auto_52781 ) ) ( not ( = ?auto_52778 ?auto_52781 ) ) ( not ( = ?auto_52776 ?auto_52781 ) ) ( not ( = ?auto_52780 ?auto_52781 ) ) ( ON ?auto_52779 ?auto_52775 ) ( ON-TABLE ?auto_52781 ) ( ON ?auto_52780 ?auto_52779 ) ( ON ?auto_52776 ?auto_52780 ) ( ON ?auto_52778 ?auto_52776 ) ( CLEAR ?auto_52778 ) ( HOLDING ?auto_52777 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52777 )
      ( MAKE-1PILE ?auto_52775 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52782 - BLOCK
    )
    :vars
    (
      ?auto_52788 - BLOCK
      ?auto_52785 - BLOCK
      ?auto_52784 - BLOCK
      ?auto_52783 - BLOCK
      ?auto_52786 - BLOCK
      ?auto_52787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52782 ?auto_52788 ) ) ( not ( = ?auto_52785 ?auto_52784 ) ) ( not ( = ?auto_52785 ?auto_52783 ) ) ( not ( = ?auto_52785 ?auto_52786 ) ) ( not ( = ?auto_52785 ?auto_52788 ) ) ( not ( = ?auto_52785 ?auto_52782 ) ) ( not ( = ?auto_52784 ?auto_52783 ) ) ( not ( = ?auto_52784 ?auto_52786 ) ) ( not ( = ?auto_52784 ?auto_52788 ) ) ( not ( = ?auto_52784 ?auto_52782 ) ) ( not ( = ?auto_52783 ?auto_52786 ) ) ( not ( = ?auto_52783 ?auto_52788 ) ) ( not ( = ?auto_52783 ?auto_52782 ) ) ( not ( = ?auto_52786 ?auto_52788 ) ) ( not ( = ?auto_52786 ?auto_52782 ) ) ( ON ?auto_52782 ?auto_52787 ) ( not ( = ?auto_52782 ?auto_52787 ) ) ( not ( = ?auto_52788 ?auto_52787 ) ) ( not ( = ?auto_52785 ?auto_52787 ) ) ( not ( = ?auto_52784 ?auto_52787 ) ) ( not ( = ?auto_52783 ?auto_52787 ) ) ( not ( = ?auto_52786 ?auto_52787 ) ) ( ON ?auto_52788 ?auto_52782 ) ( ON-TABLE ?auto_52787 ) ( ON ?auto_52786 ?auto_52788 ) ( ON ?auto_52783 ?auto_52786 ) ( ON ?auto_52784 ?auto_52783 ) ( ON ?auto_52785 ?auto_52784 ) ( CLEAR ?auto_52785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52787 ?auto_52782 ?auto_52788 ?auto_52786 ?auto_52783 ?auto_52784 )
      ( MAKE-1PILE ?auto_52782 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52793 - BLOCK
      ?auto_52794 - BLOCK
      ?auto_52795 - BLOCK
      ?auto_52796 - BLOCK
    )
    :vars
    (
      ?auto_52797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52797 ?auto_52796 ) ( CLEAR ?auto_52797 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52793 ) ( ON ?auto_52794 ?auto_52793 ) ( ON ?auto_52795 ?auto_52794 ) ( ON ?auto_52796 ?auto_52795 ) ( not ( = ?auto_52793 ?auto_52794 ) ) ( not ( = ?auto_52793 ?auto_52795 ) ) ( not ( = ?auto_52793 ?auto_52796 ) ) ( not ( = ?auto_52793 ?auto_52797 ) ) ( not ( = ?auto_52794 ?auto_52795 ) ) ( not ( = ?auto_52794 ?auto_52796 ) ) ( not ( = ?auto_52794 ?auto_52797 ) ) ( not ( = ?auto_52795 ?auto_52796 ) ) ( not ( = ?auto_52795 ?auto_52797 ) ) ( not ( = ?auto_52796 ?auto_52797 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52797 ?auto_52796 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52798 - BLOCK
      ?auto_52799 - BLOCK
      ?auto_52800 - BLOCK
      ?auto_52801 - BLOCK
    )
    :vars
    (
      ?auto_52802 - BLOCK
      ?auto_52803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52802 ?auto_52801 ) ( CLEAR ?auto_52802 ) ( ON-TABLE ?auto_52798 ) ( ON ?auto_52799 ?auto_52798 ) ( ON ?auto_52800 ?auto_52799 ) ( ON ?auto_52801 ?auto_52800 ) ( not ( = ?auto_52798 ?auto_52799 ) ) ( not ( = ?auto_52798 ?auto_52800 ) ) ( not ( = ?auto_52798 ?auto_52801 ) ) ( not ( = ?auto_52798 ?auto_52802 ) ) ( not ( = ?auto_52799 ?auto_52800 ) ) ( not ( = ?auto_52799 ?auto_52801 ) ) ( not ( = ?auto_52799 ?auto_52802 ) ) ( not ( = ?auto_52800 ?auto_52801 ) ) ( not ( = ?auto_52800 ?auto_52802 ) ) ( not ( = ?auto_52801 ?auto_52802 ) ) ( HOLDING ?auto_52803 ) ( not ( = ?auto_52798 ?auto_52803 ) ) ( not ( = ?auto_52799 ?auto_52803 ) ) ( not ( = ?auto_52800 ?auto_52803 ) ) ( not ( = ?auto_52801 ?auto_52803 ) ) ( not ( = ?auto_52802 ?auto_52803 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_52803 )
      ( MAKE-4PILE ?auto_52798 ?auto_52799 ?auto_52800 ?auto_52801 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52804 - BLOCK
      ?auto_52805 - BLOCK
      ?auto_52806 - BLOCK
      ?auto_52807 - BLOCK
    )
    :vars
    (
      ?auto_52808 - BLOCK
      ?auto_52809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52808 ?auto_52807 ) ( ON-TABLE ?auto_52804 ) ( ON ?auto_52805 ?auto_52804 ) ( ON ?auto_52806 ?auto_52805 ) ( ON ?auto_52807 ?auto_52806 ) ( not ( = ?auto_52804 ?auto_52805 ) ) ( not ( = ?auto_52804 ?auto_52806 ) ) ( not ( = ?auto_52804 ?auto_52807 ) ) ( not ( = ?auto_52804 ?auto_52808 ) ) ( not ( = ?auto_52805 ?auto_52806 ) ) ( not ( = ?auto_52805 ?auto_52807 ) ) ( not ( = ?auto_52805 ?auto_52808 ) ) ( not ( = ?auto_52806 ?auto_52807 ) ) ( not ( = ?auto_52806 ?auto_52808 ) ) ( not ( = ?auto_52807 ?auto_52808 ) ) ( not ( = ?auto_52804 ?auto_52809 ) ) ( not ( = ?auto_52805 ?auto_52809 ) ) ( not ( = ?auto_52806 ?auto_52809 ) ) ( not ( = ?auto_52807 ?auto_52809 ) ) ( not ( = ?auto_52808 ?auto_52809 ) ) ( ON ?auto_52809 ?auto_52808 ) ( CLEAR ?auto_52809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52804 ?auto_52805 ?auto_52806 ?auto_52807 ?auto_52808 )
      ( MAKE-4PILE ?auto_52804 ?auto_52805 ?auto_52806 ?auto_52807 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52810 - BLOCK
      ?auto_52811 - BLOCK
      ?auto_52812 - BLOCK
      ?auto_52813 - BLOCK
    )
    :vars
    (
      ?auto_52814 - BLOCK
      ?auto_52815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52814 ?auto_52813 ) ( ON-TABLE ?auto_52810 ) ( ON ?auto_52811 ?auto_52810 ) ( ON ?auto_52812 ?auto_52811 ) ( ON ?auto_52813 ?auto_52812 ) ( not ( = ?auto_52810 ?auto_52811 ) ) ( not ( = ?auto_52810 ?auto_52812 ) ) ( not ( = ?auto_52810 ?auto_52813 ) ) ( not ( = ?auto_52810 ?auto_52814 ) ) ( not ( = ?auto_52811 ?auto_52812 ) ) ( not ( = ?auto_52811 ?auto_52813 ) ) ( not ( = ?auto_52811 ?auto_52814 ) ) ( not ( = ?auto_52812 ?auto_52813 ) ) ( not ( = ?auto_52812 ?auto_52814 ) ) ( not ( = ?auto_52813 ?auto_52814 ) ) ( not ( = ?auto_52810 ?auto_52815 ) ) ( not ( = ?auto_52811 ?auto_52815 ) ) ( not ( = ?auto_52812 ?auto_52815 ) ) ( not ( = ?auto_52813 ?auto_52815 ) ) ( not ( = ?auto_52814 ?auto_52815 ) ) ( HOLDING ?auto_52815 ) ( CLEAR ?auto_52814 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52810 ?auto_52811 ?auto_52812 ?auto_52813 ?auto_52814 ?auto_52815 )
      ( MAKE-4PILE ?auto_52810 ?auto_52811 ?auto_52812 ?auto_52813 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52816 - BLOCK
      ?auto_52817 - BLOCK
      ?auto_52818 - BLOCK
      ?auto_52819 - BLOCK
    )
    :vars
    (
      ?auto_52820 - BLOCK
      ?auto_52821 - BLOCK
      ?auto_52822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52820 ?auto_52819 ) ( ON-TABLE ?auto_52816 ) ( ON ?auto_52817 ?auto_52816 ) ( ON ?auto_52818 ?auto_52817 ) ( ON ?auto_52819 ?auto_52818 ) ( not ( = ?auto_52816 ?auto_52817 ) ) ( not ( = ?auto_52816 ?auto_52818 ) ) ( not ( = ?auto_52816 ?auto_52819 ) ) ( not ( = ?auto_52816 ?auto_52820 ) ) ( not ( = ?auto_52817 ?auto_52818 ) ) ( not ( = ?auto_52817 ?auto_52819 ) ) ( not ( = ?auto_52817 ?auto_52820 ) ) ( not ( = ?auto_52818 ?auto_52819 ) ) ( not ( = ?auto_52818 ?auto_52820 ) ) ( not ( = ?auto_52819 ?auto_52820 ) ) ( not ( = ?auto_52816 ?auto_52821 ) ) ( not ( = ?auto_52817 ?auto_52821 ) ) ( not ( = ?auto_52818 ?auto_52821 ) ) ( not ( = ?auto_52819 ?auto_52821 ) ) ( not ( = ?auto_52820 ?auto_52821 ) ) ( CLEAR ?auto_52820 ) ( ON ?auto_52821 ?auto_52822 ) ( CLEAR ?auto_52821 ) ( HAND-EMPTY ) ( not ( = ?auto_52816 ?auto_52822 ) ) ( not ( = ?auto_52817 ?auto_52822 ) ) ( not ( = ?auto_52818 ?auto_52822 ) ) ( not ( = ?auto_52819 ?auto_52822 ) ) ( not ( = ?auto_52820 ?auto_52822 ) ) ( not ( = ?auto_52821 ?auto_52822 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52821 ?auto_52822 )
      ( MAKE-4PILE ?auto_52816 ?auto_52817 ?auto_52818 ?auto_52819 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52837 - BLOCK
      ?auto_52838 - BLOCK
      ?auto_52839 - BLOCK
      ?auto_52840 - BLOCK
    )
    :vars
    (
      ?auto_52841 - BLOCK
      ?auto_52843 - BLOCK
      ?auto_52842 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52837 ) ( ON ?auto_52838 ?auto_52837 ) ( ON ?auto_52839 ?auto_52838 ) ( not ( = ?auto_52837 ?auto_52838 ) ) ( not ( = ?auto_52837 ?auto_52839 ) ) ( not ( = ?auto_52837 ?auto_52840 ) ) ( not ( = ?auto_52837 ?auto_52841 ) ) ( not ( = ?auto_52838 ?auto_52839 ) ) ( not ( = ?auto_52838 ?auto_52840 ) ) ( not ( = ?auto_52838 ?auto_52841 ) ) ( not ( = ?auto_52839 ?auto_52840 ) ) ( not ( = ?auto_52839 ?auto_52841 ) ) ( not ( = ?auto_52840 ?auto_52841 ) ) ( not ( = ?auto_52837 ?auto_52843 ) ) ( not ( = ?auto_52838 ?auto_52843 ) ) ( not ( = ?auto_52839 ?auto_52843 ) ) ( not ( = ?auto_52840 ?auto_52843 ) ) ( not ( = ?auto_52841 ?auto_52843 ) ) ( ON ?auto_52843 ?auto_52842 ) ( not ( = ?auto_52837 ?auto_52842 ) ) ( not ( = ?auto_52838 ?auto_52842 ) ) ( not ( = ?auto_52839 ?auto_52842 ) ) ( not ( = ?auto_52840 ?auto_52842 ) ) ( not ( = ?auto_52841 ?auto_52842 ) ) ( not ( = ?auto_52843 ?auto_52842 ) ) ( ON ?auto_52841 ?auto_52843 ) ( CLEAR ?auto_52841 ) ( HOLDING ?auto_52840 ) ( CLEAR ?auto_52839 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52837 ?auto_52838 ?auto_52839 ?auto_52840 ?auto_52841 )
      ( MAKE-4PILE ?auto_52837 ?auto_52838 ?auto_52839 ?auto_52840 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52844 - BLOCK
      ?auto_52845 - BLOCK
      ?auto_52846 - BLOCK
      ?auto_52847 - BLOCK
    )
    :vars
    (
      ?auto_52848 - BLOCK
      ?auto_52849 - BLOCK
      ?auto_52850 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52844 ) ( ON ?auto_52845 ?auto_52844 ) ( ON ?auto_52846 ?auto_52845 ) ( not ( = ?auto_52844 ?auto_52845 ) ) ( not ( = ?auto_52844 ?auto_52846 ) ) ( not ( = ?auto_52844 ?auto_52847 ) ) ( not ( = ?auto_52844 ?auto_52848 ) ) ( not ( = ?auto_52845 ?auto_52846 ) ) ( not ( = ?auto_52845 ?auto_52847 ) ) ( not ( = ?auto_52845 ?auto_52848 ) ) ( not ( = ?auto_52846 ?auto_52847 ) ) ( not ( = ?auto_52846 ?auto_52848 ) ) ( not ( = ?auto_52847 ?auto_52848 ) ) ( not ( = ?auto_52844 ?auto_52849 ) ) ( not ( = ?auto_52845 ?auto_52849 ) ) ( not ( = ?auto_52846 ?auto_52849 ) ) ( not ( = ?auto_52847 ?auto_52849 ) ) ( not ( = ?auto_52848 ?auto_52849 ) ) ( ON ?auto_52849 ?auto_52850 ) ( not ( = ?auto_52844 ?auto_52850 ) ) ( not ( = ?auto_52845 ?auto_52850 ) ) ( not ( = ?auto_52846 ?auto_52850 ) ) ( not ( = ?auto_52847 ?auto_52850 ) ) ( not ( = ?auto_52848 ?auto_52850 ) ) ( not ( = ?auto_52849 ?auto_52850 ) ) ( ON ?auto_52848 ?auto_52849 ) ( CLEAR ?auto_52846 ) ( ON ?auto_52847 ?auto_52848 ) ( CLEAR ?auto_52847 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52850 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52850 ?auto_52849 ?auto_52848 )
      ( MAKE-4PILE ?auto_52844 ?auto_52845 ?auto_52846 ?auto_52847 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52851 - BLOCK
      ?auto_52852 - BLOCK
      ?auto_52853 - BLOCK
      ?auto_52854 - BLOCK
    )
    :vars
    (
      ?auto_52857 - BLOCK
      ?auto_52856 - BLOCK
      ?auto_52855 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52851 ) ( ON ?auto_52852 ?auto_52851 ) ( not ( = ?auto_52851 ?auto_52852 ) ) ( not ( = ?auto_52851 ?auto_52853 ) ) ( not ( = ?auto_52851 ?auto_52854 ) ) ( not ( = ?auto_52851 ?auto_52857 ) ) ( not ( = ?auto_52852 ?auto_52853 ) ) ( not ( = ?auto_52852 ?auto_52854 ) ) ( not ( = ?auto_52852 ?auto_52857 ) ) ( not ( = ?auto_52853 ?auto_52854 ) ) ( not ( = ?auto_52853 ?auto_52857 ) ) ( not ( = ?auto_52854 ?auto_52857 ) ) ( not ( = ?auto_52851 ?auto_52856 ) ) ( not ( = ?auto_52852 ?auto_52856 ) ) ( not ( = ?auto_52853 ?auto_52856 ) ) ( not ( = ?auto_52854 ?auto_52856 ) ) ( not ( = ?auto_52857 ?auto_52856 ) ) ( ON ?auto_52856 ?auto_52855 ) ( not ( = ?auto_52851 ?auto_52855 ) ) ( not ( = ?auto_52852 ?auto_52855 ) ) ( not ( = ?auto_52853 ?auto_52855 ) ) ( not ( = ?auto_52854 ?auto_52855 ) ) ( not ( = ?auto_52857 ?auto_52855 ) ) ( not ( = ?auto_52856 ?auto_52855 ) ) ( ON ?auto_52857 ?auto_52856 ) ( ON ?auto_52854 ?auto_52857 ) ( CLEAR ?auto_52854 ) ( ON-TABLE ?auto_52855 ) ( HOLDING ?auto_52853 ) ( CLEAR ?auto_52852 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52851 ?auto_52852 ?auto_52853 )
      ( MAKE-4PILE ?auto_52851 ?auto_52852 ?auto_52853 ?auto_52854 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52858 - BLOCK
      ?auto_52859 - BLOCK
      ?auto_52860 - BLOCK
      ?auto_52861 - BLOCK
    )
    :vars
    (
      ?auto_52863 - BLOCK
      ?auto_52862 - BLOCK
      ?auto_52864 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52858 ) ( ON ?auto_52859 ?auto_52858 ) ( not ( = ?auto_52858 ?auto_52859 ) ) ( not ( = ?auto_52858 ?auto_52860 ) ) ( not ( = ?auto_52858 ?auto_52861 ) ) ( not ( = ?auto_52858 ?auto_52863 ) ) ( not ( = ?auto_52859 ?auto_52860 ) ) ( not ( = ?auto_52859 ?auto_52861 ) ) ( not ( = ?auto_52859 ?auto_52863 ) ) ( not ( = ?auto_52860 ?auto_52861 ) ) ( not ( = ?auto_52860 ?auto_52863 ) ) ( not ( = ?auto_52861 ?auto_52863 ) ) ( not ( = ?auto_52858 ?auto_52862 ) ) ( not ( = ?auto_52859 ?auto_52862 ) ) ( not ( = ?auto_52860 ?auto_52862 ) ) ( not ( = ?auto_52861 ?auto_52862 ) ) ( not ( = ?auto_52863 ?auto_52862 ) ) ( ON ?auto_52862 ?auto_52864 ) ( not ( = ?auto_52858 ?auto_52864 ) ) ( not ( = ?auto_52859 ?auto_52864 ) ) ( not ( = ?auto_52860 ?auto_52864 ) ) ( not ( = ?auto_52861 ?auto_52864 ) ) ( not ( = ?auto_52863 ?auto_52864 ) ) ( not ( = ?auto_52862 ?auto_52864 ) ) ( ON ?auto_52863 ?auto_52862 ) ( ON ?auto_52861 ?auto_52863 ) ( ON-TABLE ?auto_52864 ) ( CLEAR ?auto_52859 ) ( ON ?auto_52860 ?auto_52861 ) ( CLEAR ?auto_52860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52864 ?auto_52862 ?auto_52863 ?auto_52861 )
      ( MAKE-4PILE ?auto_52858 ?auto_52859 ?auto_52860 ?auto_52861 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52865 - BLOCK
      ?auto_52866 - BLOCK
      ?auto_52867 - BLOCK
      ?auto_52868 - BLOCK
    )
    :vars
    (
      ?auto_52871 - BLOCK
      ?auto_52869 - BLOCK
      ?auto_52870 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52865 ) ( not ( = ?auto_52865 ?auto_52866 ) ) ( not ( = ?auto_52865 ?auto_52867 ) ) ( not ( = ?auto_52865 ?auto_52868 ) ) ( not ( = ?auto_52865 ?auto_52871 ) ) ( not ( = ?auto_52866 ?auto_52867 ) ) ( not ( = ?auto_52866 ?auto_52868 ) ) ( not ( = ?auto_52866 ?auto_52871 ) ) ( not ( = ?auto_52867 ?auto_52868 ) ) ( not ( = ?auto_52867 ?auto_52871 ) ) ( not ( = ?auto_52868 ?auto_52871 ) ) ( not ( = ?auto_52865 ?auto_52869 ) ) ( not ( = ?auto_52866 ?auto_52869 ) ) ( not ( = ?auto_52867 ?auto_52869 ) ) ( not ( = ?auto_52868 ?auto_52869 ) ) ( not ( = ?auto_52871 ?auto_52869 ) ) ( ON ?auto_52869 ?auto_52870 ) ( not ( = ?auto_52865 ?auto_52870 ) ) ( not ( = ?auto_52866 ?auto_52870 ) ) ( not ( = ?auto_52867 ?auto_52870 ) ) ( not ( = ?auto_52868 ?auto_52870 ) ) ( not ( = ?auto_52871 ?auto_52870 ) ) ( not ( = ?auto_52869 ?auto_52870 ) ) ( ON ?auto_52871 ?auto_52869 ) ( ON ?auto_52868 ?auto_52871 ) ( ON-TABLE ?auto_52870 ) ( ON ?auto_52867 ?auto_52868 ) ( CLEAR ?auto_52867 ) ( HOLDING ?auto_52866 ) ( CLEAR ?auto_52865 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52865 ?auto_52866 )
      ( MAKE-4PILE ?auto_52865 ?auto_52866 ?auto_52867 ?auto_52868 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52872 - BLOCK
      ?auto_52873 - BLOCK
      ?auto_52874 - BLOCK
      ?auto_52875 - BLOCK
    )
    :vars
    (
      ?auto_52877 - BLOCK
      ?auto_52876 - BLOCK
      ?auto_52878 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52872 ) ( not ( = ?auto_52872 ?auto_52873 ) ) ( not ( = ?auto_52872 ?auto_52874 ) ) ( not ( = ?auto_52872 ?auto_52875 ) ) ( not ( = ?auto_52872 ?auto_52877 ) ) ( not ( = ?auto_52873 ?auto_52874 ) ) ( not ( = ?auto_52873 ?auto_52875 ) ) ( not ( = ?auto_52873 ?auto_52877 ) ) ( not ( = ?auto_52874 ?auto_52875 ) ) ( not ( = ?auto_52874 ?auto_52877 ) ) ( not ( = ?auto_52875 ?auto_52877 ) ) ( not ( = ?auto_52872 ?auto_52876 ) ) ( not ( = ?auto_52873 ?auto_52876 ) ) ( not ( = ?auto_52874 ?auto_52876 ) ) ( not ( = ?auto_52875 ?auto_52876 ) ) ( not ( = ?auto_52877 ?auto_52876 ) ) ( ON ?auto_52876 ?auto_52878 ) ( not ( = ?auto_52872 ?auto_52878 ) ) ( not ( = ?auto_52873 ?auto_52878 ) ) ( not ( = ?auto_52874 ?auto_52878 ) ) ( not ( = ?auto_52875 ?auto_52878 ) ) ( not ( = ?auto_52877 ?auto_52878 ) ) ( not ( = ?auto_52876 ?auto_52878 ) ) ( ON ?auto_52877 ?auto_52876 ) ( ON ?auto_52875 ?auto_52877 ) ( ON-TABLE ?auto_52878 ) ( ON ?auto_52874 ?auto_52875 ) ( CLEAR ?auto_52872 ) ( ON ?auto_52873 ?auto_52874 ) ( CLEAR ?auto_52873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52878 ?auto_52876 ?auto_52877 ?auto_52875 ?auto_52874 )
      ( MAKE-4PILE ?auto_52872 ?auto_52873 ?auto_52874 ?auto_52875 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52879 - BLOCK
      ?auto_52880 - BLOCK
      ?auto_52881 - BLOCK
      ?auto_52882 - BLOCK
    )
    :vars
    (
      ?auto_52885 - BLOCK
      ?auto_52883 - BLOCK
      ?auto_52884 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52879 ?auto_52880 ) ) ( not ( = ?auto_52879 ?auto_52881 ) ) ( not ( = ?auto_52879 ?auto_52882 ) ) ( not ( = ?auto_52879 ?auto_52885 ) ) ( not ( = ?auto_52880 ?auto_52881 ) ) ( not ( = ?auto_52880 ?auto_52882 ) ) ( not ( = ?auto_52880 ?auto_52885 ) ) ( not ( = ?auto_52881 ?auto_52882 ) ) ( not ( = ?auto_52881 ?auto_52885 ) ) ( not ( = ?auto_52882 ?auto_52885 ) ) ( not ( = ?auto_52879 ?auto_52883 ) ) ( not ( = ?auto_52880 ?auto_52883 ) ) ( not ( = ?auto_52881 ?auto_52883 ) ) ( not ( = ?auto_52882 ?auto_52883 ) ) ( not ( = ?auto_52885 ?auto_52883 ) ) ( ON ?auto_52883 ?auto_52884 ) ( not ( = ?auto_52879 ?auto_52884 ) ) ( not ( = ?auto_52880 ?auto_52884 ) ) ( not ( = ?auto_52881 ?auto_52884 ) ) ( not ( = ?auto_52882 ?auto_52884 ) ) ( not ( = ?auto_52885 ?auto_52884 ) ) ( not ( = ?auto_52883 ?auto_52884 ) ) ( ON ?auto_52885 ?auto_52883 ) ( ON ?auto_52882 ?auto_52885 ) ( ON-TABLE ?auto_52884 ) ( ON ?auto_52881 ?auto_52882 ) ( ON ?auto_52880 ?auto_52881 ) ( CLEAR ?auto_52880 ) ( HOLDING ?auto_52879 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52879 )
      ( MAKE-4PILE ?auto_52879 ?auto_52880 ?auto_52881 ?auto_52882 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52886 - BLOCK
      ?auto_52887 - BLOCK
      ?auto_52888 - BLOCK
      ?auto_52889 - BLOCK
    )
    :vars
    (
      ?auto_52891 - BLOCK
      ?auto_52890 - BLOCK
      ?auto_52892 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52886 ?auto_52887 ) ) ( not ( = ?auto_52886 ?auto_52888 ) ) ( not ( = ?auto_52886 ?auto_52889 ) ) ( not ( = ?auto_52886 ?auto_52891 ) ) ( not ( = ?auto_52887 ?auto_52888 ) ) ( not ( = ?auto_52887 ?auto_52889 ) ) ( not ( = ?auto_52887 ?auto_52891 ) ) ( not ( = ?auto_52888 ?auto_52889 ) ) ( not ( = ?auto_52888 ?auto_52891 ) ) ( not ( = ?auto_52889 ?auto_52891 ) ) ( not ( = ?auto_52886 ?auto_52890 ) ) ( not ( = ?auto_52887 ?auto_52890 ) ) ( not ( = ?auto_52888 ?auto_52890 ) ) ( not ( = ?auto_52889 ?auto_52890 ) ) ( not ( = ?auto_52891 ?auto_52890 ) ) ( ON ?auto_52890 ?auto_52892 ) ( not ( = ?auto_52886 ?auto_52892 ) ) ( not ( = ?auto_52887 ?auto_52892 ) ) ( not ( = ?auto_52888 ?auto_52892 ) ) ( not ( = ?auto_52889 ?auto_52892 ) ) ( not ( = ?auto_52891 ?auto_52892 ) ) ( not ( = ?auto_52890 ?auto_52892 ) ) ( ON ?auto_52891 ?auto_52890 ) ( ON ?auto_52889 ?auto_52891 ) ( ON-TABLE ?auto_52892 ) ( ON ?auto_52888 ?auto_52889 ) ( ON ?auto_52887 ?auto_52888 ) ( ON ?auto_52886 ?auto_52887 ) ( CLEAR ?auto_52886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52892 ?auto_52890 ?auto_52891 ?auto_52889 ?auto_52888 ?auto_52887 )
      ( MAKE-4PILE ?auto_52886 ?auto_52887 ?auto_52888 ?auto_52889 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52895 - BLOCK
      ?auto_52896 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_52896 ) ( CLEAR ?auto_52895 ) ( ON-TABLE ?auto_52895 ) ( not ( = ?auto_52895 ?auto_52896 ) ) )
    :subtasks
    ( ( !STACK ?auto_52896 ?auto_52895 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52897 - BLOCK
      ?auto_52898 - BLOCK
    )
    :vars
    (
      ?auto_52899 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_52897 ) ( ON-TABLE ?auto_52897 ) ( not ( = ?auto_52897 ?auto_52898 ) ) ( ON ?auto_52898 ?auto_52899 ) ( CLEAR ?auto_52898 ) ( HAND-EMPTY ) ( not ( = ?auto_52897 ?auto_52899 ) ) ( not ( = ?auto_52898 ?auto_52899 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52898 ?auto_52899 )
      ( MAKE-2PILE ?auto_52897 ?auto_52898 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52900 - BLOCK
      ?auto_52901 - BLOCK
    )
    :vars
    (
      ?auto_52902 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52900 ?auto_52901 ) ) ( ON ?auto_52901 ?auto_52902 ) ( CLEAR ?auto_52901 ) ( not ( = ?auto_52900 ?auto_52902 ) ) ( not ( = ?auto_52901 ?auto_52902 ) ) ( HOLDING ?auto_52900 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52900 )
      ( MAKE-2PILE ?auto_52900 ?auto_52901 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52903 - BLOCK
      ?auto_52904 - BLOCK
    )
    :vars
    (
      ?auto_52905 - BLOCK
      ?auto_52907 - BLOCK
      ?auto_52906 - BLOCK
      ?auto_52908 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52903 ?auto_52904 ) ) ( ON ?auto_52904 ?auto_52905 ) ( not ( = ?auto_52903 ?auto_52905 ) ) ( not ( = ?auto_52904 ?auto_52905 ) ) ( ON ?auto_52903 ?auto_52904 ) ( CLEAR ?auto_52903 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52907 ) ( ON ?auto_52906 ?auto_52907 ) ( ON ?auto_52908 ?auto_52906 ) ( ON ?auto_52905 ?auto_52908 ) ( not ( = ?auto_52907 ?auto_52906 ) ) ( not ( = ?auto_52907 ?auto_52908 ) ) ( not ( = ?auto_52907 ?auto_52905 ) ) ( not ( = ?auto_52907 ?auto_52904 ) ) ( not ( = ?auto_52907 ?auto_52903 ) ) ( not ( = ?auto_52906 ?auto_52908 ) ) ( not ( = ?auto_52906 ?auto_52905 ) ) ( not ( = ?auto_52906 ?auto_52904 ) ) ( not ( = ?auto_52906 ?auto_52903 ) ) ( not ( = ?auto_52908 ?auto_52905 ) ) ( not ( = ?auto_52908 ?auto_52904 ) ) ( not ( = ?auto_52908 ?auto_52903 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52907 ?auto_52906 ?auto_52908 ?auto_52905 ?auto_52904 )
      ( MAKE-2PILE ?auto_52903 ?auto_52904 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52909 - BLOCK
      ?auto_52910 - BLOCK
    )
    :vars
    (
      ?auto_52911 - BLOCK
      ?auto_52913 - BLOCK
      ?auto_52914 - BLOCK
      ?auto_52912 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52909 ?auto_52910 ) ) ( ON ?auto_52910 ?auto_52911 ) ( not ( = ?auto_52909 ?auto_52911 ) ) ( not ( = ?auto_52910 ?auto_52911 ) ) ( ON-TABLE ?auto_52913 ) ( ON ?auto_52914 ?auto_52913 ) ( ON ?auto_52912 ?auto_52914 ) ( ON ?auto_52911 ?auto_52912 ) ( not ( = ?auto_52913 ?auto_52914 ) ) ( not ( = ?auto_52913 ?auto_52912 ) ) ( not ( = ?auto_52913 ?auto_52911 ) ) ( not ( = ?auto_52913 ?auto_52910 ) ) ( not ( = ?auto_52913 ?auto_52909 ) ) ( not ( = ?auto_52914 ?auto_52912 ) ) ( not ( = ?auto_52914 ?auto_52911 ) ) ( not ( = ?auto_52914 ?auto_52910 ) ) ( not ( = ?auto_52914 ?auto_52909 ) ) ( not ( = ?auto_52912 ?auto_52911 ) ) ( not ( = ?auto_52912 ?auto_52910 ) ) ( not ( = ?auto_52912 ?auto_52909 ) ) ( HOLDING ?auto_52909 ) ( CLEAR ?auto_52910 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52913 ?auto_52914 ?auto_52912 ?auto_52911 ?auto_52910 ?auto_52909 )
      ( MAKE-2PILE ?auto_52909 ?auto_52910 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52915 - BLOCK
      ?auto_52916 - BLOCK
    )
    :vars
    (
      ?auto_52918 - BLOCK
      ?auto_52920 - BLOCK
      ?auto_52919 - BLOCK
      ?auto_52917 - BLOCK
      ?auto_52921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52915 ?auto_52916 ) ) ( ON ?auto_52916 ?auto_52918 ) ( not ( = ?auto_52915 ?auto_52918 ) ) ( not ( = ?auto_52916 ?auto_52918 ) ) ( ON-TABLE ?auto_52920 ) ( ON ?auto_52919 ?auto_52920 ) ( ON ?auto_52917 ?auto_52919 ) ( ON ?auto_52918 ?auto_52917 ) ( not ( = ?auto_52920 ?auto_52919 ) ) ( not ( = ?auto_52920 ?auto_52917 ) ) ( not ( = ?auto_52920 ?auto_52918 ) ) ( not ( = ?auto_52920 ?auto_52916 ) ) ( not ( = ?auto_52920 ?auto_52915 ) ) ( not ( = ?auto_52919 ?auto_52917 ) ) ( not ( = ?auto_52919 ?auto_52918 ) ) ( not ( = ?auto_52919 ?auto_52916 ) ) ( not ( = ?auto_52919 ?auto_52915 ) ) ( not ( = ?auto_52917 ?auto_52918 ) ) ( not ( = ?auto_52917 ?auto_52916 ) ) ( not ( = ?auto_52917 ?auto_52915 ) ) ( CLEAR ?auto_52916 ) ( ON ?auto_52915 ?auto_52921 ) ( CLEAR ?auto_52915 ) ( HAND-EMPTY ) ( not ( = ?auto_52915 ?auto_52921 ) ) ( not ( = ?auto_52916 ?auto_52921 ) ) ( not ( = ?auto_52918 ?auto_52921 ) ) ( not ( = ?auto_52920 ?auto_52921 ) ) ( not ( = ?auto_52919 ?auto_52921 ) ) ( not ( = ?auto_52917 ?auto_52921 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52915 ?auto_52921 )
      ( MAKE-2PILE ?auto_52915 ?auto_52916 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52922 - BLOCK
      ?auto_52923 - BLOCK
    )
    :vars
    (
      ?auto_52928 - BLOCK
      ?auto_52926 - BLOCK
      ?auto_52924 - BLOCK
      ?auto_52925 - BLOCK
      ?auto_52927 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52922 ?auto_52923 ) ) ( not ( = ?auto_52922 ?auto_52928 ) ) ( not ( = ?auto_52923 ?auto_52928 ) ) ( ON-TABLE ?auto_52926 ) ( ON ?auto_52924 ?auto_52926 ) ( ON ?auto_52925 ?auto_52924 ) ( ON ?auto_52928 ?auto_52925 ) ( not ( = ?auto_52926 ?auto_52924 ) ) ( not ( = ?auto_52926 ?auto_52925 ) ) ( not ( = ?auto_52926 ?auto_52928 ) ) ( not ( = ?auto_52926 ?auto_52923 ) ) ( not ( = ?auto_52926 ?auto_52922 ) ) ( not ( = ?auto_52924 ?auto_52925 ) ) ( not ( = ?auto_52924 ?auto_52928 ) ) ( not ( = ?auto_52924 ?auto_52923 ) ) ( not ( = ?auto_52924 ?auto_52922 ) ) ( not ( = ?auto_52925 ?auto_52928 ) ) ( not ( = ?auto_52925 ?auto_52923 ) ) ( not ( = ?auto_52925 ?auto_52922 ) ) ( ON ?auto_52922 ?auto_52927 ) ( CLEAR ?auto_52922 ) ( not ( = ?auto_52922 ?auto_52927 ) ) ( not ( = ?auto_52923 ?auto_52927 ) ) ( not ( = ?auto_52928 ?auto_52927 ) ) ( not ( = ?auto_52926 ?auto_52927 ) ) ( not ( = ?auto_52924 ?auto_52927 ) ) ( not ( = ?auto_52925 ?auto_52927 ) ) ( HOLDING ?auto_52923 ) ( CLEAR ?auto_52928 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52926 ?auto_52924 ?auto_52925 ?auto_52928 ?auto_52923 )
      ( MAKE-2PILE ?auto_52922 ?auto_52923 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52929 - BLOCK
      ?auto_52930 - BLOCK
    )
    :vars
    (
      ?auto_52933 - BLOCK
      ?auto_52934 - BLOCK
      ?auto_52932 - BLOCK
      ?auto_52931 - BLOCK
      ?auto_52935 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52929 ?auto_52930 ) ) ( not ( = ?auto_52929 ?auto_52933 ) ) ( not ( = ?auto_52930 ?auto_52933 ) ) ( ON-TABLE ?auto_52934 ) ( ON ?auto_52932 ?auto_52934 ) ( ON ?auto_52931 ?auto_52932 ) ( ON ?auto_52933 ?auto_52931 ) ( not ( = ?auto_52934 ?auto_52932 ) ) ( not ( = ?auto_52934 ?auto_52931 ) ) ( not ( = ?auto_52934 ?auto_52933 ) ) ( not ( = ?auto_52934 ?auto_52930 ) ) ( not ( = ?auto_52934 ?auto_52929 ) ) ( not ( = ?auto_52932 ?auto_52931 ) ) ( not ( = ?auto_52932 ?auto_52933 ) ) ( not ( = ?auto_52932 ?auto_52930 ) ) ( not ( = ?auto_52932 ?auto_52929 ) ) ( not ( = ?auto_52931 ?auto_52933 ) ) ( not ( = ?auto_52931 ?auto_52930 ) ) ( not ( = ?auto_52931 ?auto_52929 ) ) ( ON ?auto_52929 ?auto_52935 ) ( not ( = ?auto_52929 ?auto_52935 ) ) ( not ( = ?auto_52930 ?auto_52935 ) ) ( not ( = ?auto_52933 ?auto_52935 ) ) ( not ( = ?auto_52934 ?auto_52935 ) ) ( not ( = ?auto_52932 ?auto_52935 ) ) ( not ( = ?auto_52931 ?auto_52935 ) ) ( CLEAR ?auto_52933 ) ( ON ?auto_52930 ?auto_52929 ) ( CLEAR ?auto_52930 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52935 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52935 ?auto_52929 )
      ( MAKE-2PILE ?auto_52929 ?auto_52930 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52936 - BLOCK
      ?auto_52937 - BLOCK
    )
    :vars
    (
      ?auto_52942 - BLOCK
      ?auto_52938 - BLOCK
      ?auto_52939 - BLOCK
      ?auto_52940 - BLOCK
      ?auto_52941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52936 ?auto_52937 ) ) ( not ( = ?auto_52936 ?auto_52942 ) ) ( not ( = ?auto_52937 ?auto_52942 ) ) ( ON-TABLE ?auto_52938 ) ( ON ?auto_52939 ?auto_52938 ) ( ON ?auto_52940 ?auto_52939 ) ( not ( = ?auto_52938 ?auto_52939 ) ) ( not ( = ?auto_52938 ?auto_52940 ) ) ( not ( = ?auto_52938 ?auto_52942 ) ) ( not ( = ?auto_52938 ?auto_52937 ) ) ( not ( = ?auto_52938 ?auto_52936 ) ) ( not ( = ?auto_52939 ?auto_52940 ) ) ( not ( = ?auto_52939 ?auto_52942 ) ) ( not ( = ?auto_52939 ?auto_52937 ) ) ( not ( = ?auto_52939 ?auto_52936 ) ) ( not ( = ?auto_52940 ?auto_52942 ) ) ( not ( = ?auto_52940 ?auto_52937 ) ) ( not ( = ?auto_52940 ?auto_52936 ) ) ( ON ?auto_52936 ?auto_52941 ) ( not ( = ?auto_52936 ?auto_52941 ) ) ( not ( = ?auto_52937 ?auto_52941 ) ) ( not ( = ?auto_52942 ?auto_52941 ) ) ( not ( = ?auto_52938 ?auto_52941 ) ) ( not ( = ?auto_52939 ?auto_52941 ) ) ( not ( = ?auto_52940 ?auto_52941 ) ) ( ON ?auto_52937 ?auto_52936 ) ( CLEAR ?auto_52937 ) ( ON-TABLE ?auto_52941 ) ( HOLDING ?auto_52942 ) ( CLEAR ?auto_52940 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52938 ?auto_52939 ?auto_52940 ?auto_52942 )
      ( MAKE-2PILE ?auto_52936 ?auto_52937 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52943 - BLOCK
      ?auto_52944 - BLOCK
    )
    :vars
    (
      ?auto_52946 - BLOCK
      ?auto_52947 - BLOCK
      ?auto_52949 - BLOCK
      ?auto_52945 - BLOCK
      ?auto_52948 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52943 ?auto_52944 ) ) ( not ( = ?auto_52943 ?auto_52946 ) ) ( not ( = ?auto_52944 ?auto_52946 ) ) ( ON-TABLE ?auto_52947 ) ( ON ?auto_52949 ?auto_52947 ) ( ON ?auto_52945 ?auto_52949 ) ( not ( = ?auto_52947 ?auto_52949 ) ) ( not ( = ?auto_52947 ?auto_52945 ) ) ( not ( = ?auto_52947 ?auto_52946 ) ) ( not ( = ?auto_52947 ?auto_52944 ) ) ( not ( = ?auto_52947 ?auto_52943 ) ) ( not ( = ?auto_52949 ?auto_52945 ) ) ( not ( = ?auto_52949 ?auto_52946 ) ) ( not ( = ?auto_52949 ?auto_52944 ) ) ( not ( = ?auto_52949 ?auto_52943 ) ) ( not ( = ?auto_52945 ?auto_52946 ) ) ( not ( = ?auto_52945 ?auto_52944 ) ) ( not ( = ?auto_52945 ?auto_52943 ) ) ( ON ?auto_52943 ?auto_52948 ) ( not ( = ?auto_52943 ?auto_52948 ) ) ( not ( = ?auto_52944 ?auto_52948 ) ) ( not ( = ?auto_52946 ?auto_52948 ) ) ( not ( = ?auto_52947 ?auto_52948 ) ) ( not ( = ?auto_52949 ?auto_52948 ) ) ( not ( = ?auto_52945 ?auto_52948 ) ) ( ON ?auto_52944 ?auto_52943 ) ( ON-TABLE ?auto_52948 ) ( CLEAR ?auto_52945 ) ( ON ?auto_52946 ?auto_52944 ) ( CLEAR ?auto_52946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52948 ?auto_52943 ?auto_52944 )
      ( MAKE-2PILE ?auto_52943 ?auto_52944 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52950 - BLOCK
      ?auto_52951 - BLOCK
    )
    :vars
    (
      ?auto_52954 - BLOCK
      ?auto_52952 - BLOCK
      ?auto_52956 - BLOCK
      ?auto_52953 - BLOCK
      ?auto_52955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52950 ?auto_52951 ) ) ( not ( = ?auto_52950 ?auto_52954 ) ) ( not ( = ?auto_52951 ?auto_52954 ) ) ( ON-TABLE ?auto_52952 ) ( ON ?auto_52956 ?auto_52952 ) ( not ( = ?auto_52952 ?auto_52956 ) ) ( not ( = ?auto_52952 ?auto_52953 ) ) ( not ( = ?auto_52952 ?auto_52954 ) ) ( not ( = ?auto_52952 ?auto_52951 ) ) ( not ( = ?auto_52952 ?auto_52950 ) ) ( not ( = ?auto_52956 ?auto_52953 ) ) ( not ( = ?auto_52956 ?auto_52954 ) ) ( not ( = ?auto_52956 ?auto_52951 ) ) ( not ( = ?auto_52956 ?auto_52950 ) ) ( not ( = ?auto_52953 ?auto_52954 ) ) ( not ( = ?auto_52953 ?auto_52951 ) ) ( not ( = ?auto_52953 ?auto_52950 ) ) ( ON ?auto_52950 ?auto_52955 ) ( not ( = ?auto_52950 ?auto_52955 ) ) ( not ( = ?auto_52951 ?auto_52955 ) ) ( not ( = ?auto_52954 ?auto_52955 ) ) ( not ( = ?auto_52952 ?auto_52955 ) ) ( not ( = ?auto_52956 ?auto_52955 ) ) ( not ( = ?auto_52953 ?auto_52955 ) ) ( ON ?auto_52951 ?auto_52950 ) ( ON-TABLE ?auto_52955 ) ( ON ?auto_52954 ?auto_52951 ) ( CLEAR ?auto_52954 ) ( HOLDING ?auto_52953 ) ( CLEAR ?auto_52956 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52952 ?auto_52956 ?auto_52953 )
      ( MAKE-2PILE ?auto_52950 ?auto_52951 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52957 - BLOCK
      ?auto_52958 - BLOCK
    )
    :vars
    (
      ?auto_52960 - BLOCK
      ?auto_52961 - BLOCK
      ?auto_52959 - BLOCK
      ?auto_52963 - BLOCK
      ?auto_52962 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52957 ?auto_52958 ) ) ( not ( = ?auto_52957 ?auto_52960 ) ) ( not ( = ?auto_52958 ?auto_52960 ) ) ( ON-TABLE ?auto_52961 ) ( ON ?auto_52959 ?auto_52961 ) ( not ( = ?auto_52961 ?auto_52959 ) ) ( not ( = ?auto_52961 ?auto_52963 ) ) ( not ( = ?auto_52961 ?auto_52960 ) ) ( not ( = ?auto_52961 ?auto_52958 ) ) ( not ( = ?auto_52961 ?auto_52957 ) ) ( not ( = ?auto_52959 ?auto_52963 ) ) ( not ( = ?auto_52959 ?auto_52960 ) ) ( not ( = ?auto_52959 ?auto_52958 ) ) ( not ( = ?auto_52959 ?auto_52957 ) ) ( not ( = ?auto_52963 ?auto_52960 ) ) ( not ( = ?auto_52963 ?auto_52958 ) ) ( not ( = ?auto_52963 ?auto_52957 ) ) ( ON ?auto_52957 ?auto_52962 ) ( not ( = ?auto_52957 ?auto_52962 ) ) ( not ( = ?auto_52958 ?auto_52962 ) ) ( not ( = ?auto_52960 ?auto_52962 ) ) ( not ( = ?auto_52961 ?auto_52962 ) ) ( not ( = ?auto_52959 ?auto_52962 ) ) ( not ( = ?auto_52963 ?auto_52962 ) ) ( ON ?auto_52958 ?auto_52957 ) ( ON-TABLE ?auto_52962 ) ( ON ?auto_52960 ?auto_52958 ) ( CLEAR ?auto_52959 ) ( ON ?auto_52963 ?auto_52960 ) ( CLEAR ?auto_52963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52962 ?auto_52957 ?auto_52958 ?auto_52960 )
      ( MAKE-2PILE ?auto_52957 ?auto_52958 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52964 - BLOCK
      ?auto_52965 - BLOCK
    )
    :vars
    (
      ?auto_52968 - BLOCK
      ?auto_52966 - BLOCK
      ?auto_52970 - BLOCK
      ?auto_52969 - BLOCK
      ?auto_52967 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52964 ?auto_52965 ) ) ( not ( = ?auto_52964 ?auto_52968 ) ) ( not ( = ?auto_52965 ?auto_52968 ) ) ( ON-TABLE ?auto_52966 ) ( not ( = ?auto_52966 ?auto_52970 ) ) ( not ( = ?auto_52966 ?auto_52969 ) ) ( not ( = ?auto_52966 ?auto_52968 ) ) ( not ( = ?auto_52966 ?auto_52965 ) ) ( not ( = ?auto_52966 ?auto_52964 ) ) ( not ( = ?auto_52970 ?auto_52969 ) ) ( not ( = ?auto_52970 ?auto_52968 ) ) ( not ( = ?auto_52970 ?auto_52965 ) ) ( not ( = ?auto_52970 ?auto_52964 ) ) ( not ( = ?auto_52969 ?auto_52968 ) ) ( not ( = ?auto_52969 ?auto_52965 ) ) ( not ( = ?auto_52969 ?auto_52964 ) ) ( ON ?auto_52964 ?auto_52967 ) ( not ( = ?auto_52964 ?auto_52967 ) ) ( not ( = ?auto_52965 ?auto_52967 ) ) ( not ( = ?auto_52968 ?auto_52967 ) ) ( not ( = ?auto_52966 ?auto_52967 ) ) ( not ( = ?auto_52970 ?auto_52967 ) ) ( not ( = ?auto_52969 ?auto_52967 ) ) ( ON ?auto_52965 ?auto_52964 ) ( ON-TABLE ?auto_52967 ) ( ON ?auto_52968 ?auto_52965 ) ( ON ?auto_52969 ?auto_52968 ) ( CLEAR ?auto_52969 ) ( HOLDING ?auto_52970 ) ( CLEAR ?auto_52966 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52966 ?auto_52970 )
      ( MAKE-2PILE ?auto_52964 ?auto_52965 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52971 - BLOCK
      ?auto_52972 - BLOCK
    )
    :vars
    (
      ?auto_52975 - BLOCK
      ?auto_52976 - BLOCK
      ?auto_52974 - BLOCK
      ?auto_52977 - BLOCK
      ?auto_52973 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52971 ?auto_52972 ) ) ( not ( = ?auto_52971 ?auto_52975 ) ) ( not ( = ?auto_52972 ?auto_52975 ) ) ( ON-TABLE ?auto_52976 ) ( not ( = ?auto_52976 ?auto_52974 ) ) ( not ( = ?auto_52976 ?auto_52977 ) ) ( not ( = ?auto_52976 ?auto_52975 ) ) ( not ( = ?auto_52976 ?auto_52972 ) ) ( not ( = ?auto_52976 ?auto_52971 ) ) ( not ( = ?auto_52974 ?auto_52977 ) ) ( not ( = ?auto_52974 ?auto_52975 ) ) ( not ( = ?auto_52974 ?auto_52972 ) ) ( not ( = ?auto_52974 ?auto_52971 ) ) ( not ( = ?auto_52977 ?auto_52975 ) ) ( not ( = ?auto_52977 ?auto_52972 ) ) ( not ( = ?auto_52977 ?auto_52971 ) ) ( ON ?auto_52971 ?auto_52973 ) ( not ( = ?auto_52971 ?auto_52973 ) ) ( not ( = ?auto_52972 ?auto_52973 ) ) ( not ( = ?auto_52975 ?auto_52973 ) ) ( not ( = ?auto_52976 ?auto_52973 ) ) ( not ( = ?auto_52974 ?auto_52973 ) ) ( not ( = ?auto_52977 ?auto_52973 ) ) ( ON ?auto_52972 ?auto_52971 ) ( ON-TABLE ?auto_52973 ) ( ON ?auto_52975 ?auto_52972 ) ( ON ?auto_52977 ?auto_52975 ) ( CLEAR ?auto_52976 ) ( ON ?auto_52974 ?auto_52977 ) ( CLEAR ?auto_52974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52973 ?auto_52971 ?auto_52972 ?auto_52975 ?auto_52977 )
      ( MAKE-2PILE ?auto_52971 ?auto_52972 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52978 - BLOCK
      ?auto_52979 - BLOCK
    )
    :vars
    (
      ?auto_52981 - BLOCK
      ?auto_52983 - BLOCK
      ?auto_52980 - BLOCK
      ?auto_52982 - BLOCK
      ?auto_52984 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52978 ?auto_52979 ) ) ( not ( = ?auto_52978 ?auto_52981 ) ) ( not ( = ?auto_52979 ?auto_52981 ) ) ( not ( = ?auto_52983 ?auto_52980 ) ) ( not ( = ?auto_52983 ?auto_52982 ) ) ( not ( = ?auto_52983 ?auto_52981 ) ) ( not ( = ?auto_52983 ?auto_52979 ) ) ( not ( = ?auto_52983 ?auto_52978 ) ) ( not ( = ?auto_52980 ?auto_52982 ) ) ( not ( = ?auto_52980 ?auto_52981 ) ) ( not ( = ?auto_52980 ?auto_52979 ) ) ( not ( = ?auto_52980 ?auto_52978 ) ) ( not ( = ?auto_52982 ?auto_52981 ) ) ( not ( = ?auto_52982 ?auto_52979 ) ) ( not ( = ?auto_52982 ?auto_52978 ) ) ( ON ?auto_52978 ?auto_52984 ) ( not ( = ?auto_52978 ?auto_52984 ) ) ( not ( = ?auto_52979 ?auto_52984 ) ) ( not ( = ?auto_52981 ?auto_52984 ) ) ( not ( = ?auto_52983 ?auto_52984 ) ) ( not ( = ?auto_52980 ?auto_52984 ) ) ( not ( = ?auto_52982 ?auto_52984 ) ) ( ON ?auto_52979 ?auto_52978 ) ( ON-TABLE ?auto_52984 ) ( ON ?auto_52981 ?auto_52979 ) ( ON ?auto_52982 ?auto_52981 ) ( ON ?auto_52980 ?auto_52982 ) ( CLEAR ?auto_52980 ) ( HOLDING ?auto_52983 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52983 )
      ( MAKE-2PILE ?auto_52978 ?auto_52979 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52985 - BLOCK
      ?auto_52986 - BLOCK
    )
    :vars
    (
      ?auto_52991 - BLOCK
      ?auto_52990 - BLOCK
      ?auto_52989 - BLOCK
      ?auto_52988 - BLOCK
      ?auto_52987 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52985 ?auto_52986 ) ) ( not ( = ?auto_52985 ?auto_52991 ) ) ( not ( = ?auto_52986 ?auto_52991 ) ) ( not ( = ?auto_52990 ?auto_52989 ) ) ( not ( = ?auto_52990 ?auto_52988 ) ) ( not ( = ?auto_52990 ?auto_52991 ) ) ( not ( = ?auto_52990 ?auto_52986 ) ) ( not ( = ?auto_52990 ?auto_52985 ) ) ( not ( = ?auto_52989 ?auto_52988 ) ) ( not ( = ?auto_52989 ?auto_52991 ) ) ( not ( = ?auto_52989 ?auto_52986 ) ) ( not ( = ?auto_52989 ?auto_52985 ) ) ( not ( = ?auto_52988 ?auto_52991 ) ) ( not ( = ?auto_52988 ?auto_52986 ) ) ( not ( = ?auto_52988 ?auto_52985 ) ) ( ON ?auto_52985 ?auto_52987 ) ( not ( = ?auto_52985 ?auto_52987 ) ) ( not ( = ?auto_52986 ?auto_52987 ) ) ( not ( = ?auto_52991 ?auto_52987 ) ) ( not ( = ?auto_52990 ?auto_52987 ) ) ( not ( = ?auto_52989 ?auto_52987 ) ) ( not ( = ?auto_52988 ?auto_52987 ) ) ( ON ?auto_52986 ?auto_52985 ) ( ON-TABLE ?auto_52987 ) ( ON ?auto_52991 ?auto_52986 ) ( ON ?auto_52988 ?auto_52991 ) ( ON ?auto_52989 ?auto_52988 ) ( ON ?auto_52990 ?auto_52989 ) ( CLEAR ?auto_52990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52987 ?auto_52985 ?auto_52986 ?auto_52991 ?auto_52988 ?auto_52989 )
      ( MAKE-2PILE ?auto_52985 ?auto_52986 ) )
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
      ?auto_52998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52998 ?auto_52997 ) ( CLEAR ?auto_52998 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52995 ) ( ON ?auto_52996 ?auto_52995 ) ( ON ?auto_52997 ?auto_52996 ) ( not ( = ?auto_52995 ?auto_52996 ) ) ( not ( = ?auto_52995 ?auto_52997 ) ) ( not ( = ?auto_52995 ?auto_52998 ) ) ( not ( = ?auto_52996 ?auto_52997 ) ) ( not ( = ?auto_52996 ?auto_52998 ) ) ( not ( = ?auto_52997 ?auto_52998 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52998 ?auto_52997 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52999 - BLOCK
      ?auto_53000 - BLOCK
      ?auto_53001 - BLOCK
    )
    :vars
    (
      ?auto_53002 - BLOCK
      ?auto_53003 - BLOCK
      ?auto_53004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53002 ?auto_53001 ) ( CLEAR ?auto_53002 ) ( ON-TABLE ?auto_52999 ) ( ON ?auto_53000 ?auto_52999 ) ( ON ?auto_53001 ?auto_53000 ) ( not ( = ?auto_52999 ?auto_53000 ) ) ( not ( = ?auto_52999 ?auto_53001 ) ) ( not ( = ?auto_52999 ?auto_53002 ) ) ( not ( = ?auto_53000 ?auto_53001 ) ) ( not ( = ?auto_53000 ?auto_53002 ) ) ( not ( = ?auto_53001 ?auto_53002 ) ) ( HOLDING ?auto_53003 ) ( CLEAR ?auto_53004 ) ( not ( = ?auto_52999 ?auto_53003 ) ) ( not ( = ?auto_52999 ?auto_53004 ) ) ( not ( = ?auto_53000 ?auto_53003 ) ) ( not ( = ?auto_53000 ?auto_53004 ) ) ( not ( = ?auto_53001 ?auto_53003 ) ) ( not ( = ?auto_53001 ?auto_53004 ) ) ( not ( = ?auto_53002 ?auto_53003 ) ) ( not ( = ?auto_53002 ?auto_53004 ) ) ( not ( = ?auto_53003 ?auto_53004 ) ) )
    :subtasks
    ( ( !STACK ?auto_53003 ?auto_53004 )
      ( MAKE-3PILE ?auto_52999 ?auto_53000 ?auto_53001 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53005 - BLOCK
      ?auto_53006 - BLOCK
      ?auto_53007 - BLOCK
    )
    :vars
    (
      ?auto_53008 - BLOCK
      ?auto_53010 - BLOCK
      ?auto_53009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53008 ?auto_53007 ) ( ON-TABLE ?auto_53005 ) ( ON ?auto_53006 ?auto_53005 ) ( ON ?auto_53007 ?auto_53006 ) ( not ( = ?auto_53005 ?auto_53006 ) ) ( not ( = ?auto_53005 ?auto_53007 ) ) ( not ( = ?auto_53005 ?auto_53008 ) ) ( not ( = ?auto_53006 ?auto_53007 ) ) ( not ( = ?auto_53006 ?auto_53008 ) ) ( not ( = ?auto_53007 ?auto_53008 ) ) ( CLEAR ?auto_53010 ) ( not ( = ?auto_53005 ?auto_53009 ) ) ( not ( = ?auto_53005 ?auto_53010 ) ) ( not ( = ?auto_53006 ?auto_53009 ) ) ( not ( = ?auto_53006 ?auto_53010 ) ) ( not ( = ?auto_53007 ?auto_53009 ) ) ( not ( = ?auto_53007 ?auto_53010 ) ) ( not ( = ?auto_53008 ?auto_53009 ) ) ( not ( = ?auto_53008 ?auto_53010 ) ) ( not ( = ?auto_53009 ?auto_53010 ) ) ( ON ?auto_53009 ?auto_53008 ) ( CLEAR ?auto_53009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53005 ?auto_53006 ?auto_53007 ?auto_53008 )
      ( MAKE-3PILE ?auto_53005 ?auto_53006 ?auto_53007 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53011 - BLOCK
      ?auto_53012 - BLOCK
      ?auto_53013 - BLOCK
    )
    :vars
    (
      ?auto_53014 - BLOCK
      ?auto_53016 - BLOCK
      ?auto_53015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53014 ?auto_53013 ) ( ON-TABLE ?auto_53011 ) ( ON ?auto_53012 ?auto_53011 ) ( ON ?auto_53013 ?auto_53012 ) ( not ( = ?auto_53011 ?auto_53012 ) ) ( not ( = ?auto_53011 ?auto_53013 ) ) ( not ( = ?auto_53011 ?auto_53014 ) ) ( not ( = ?auto_53012 ?auto_53013 ) ) ( not ( = ?auto_53012 ?auto_53014 ) ) ( not ( = ?auto_53013 ?auto_53014 ) ) ( not ( = ?auto_53011 ?auto_53016 ) ) ( not ( = ?auto_53011 ?auto_53015 ) ) ( not ( = ?auto_53012 ?auto_53016 ) ) ( not ( = ?auto_53012 ?auto_53015 ) ) ( not ( = ?auto_53013 ?auto_53016 ) ) ( not ( = ?auto_53013 ?auto_53015 ) ) ( not ( = ?auto_53014 ?auto_53016 ) ) ( not ( = ?auto_53014 ?auto_53015 ) ) ( not ( = ?auto_53016 ?auto_53015 ) ) ( ON ?auto_53016 ?auto_53014 ) ( CLEAR ?auto_53016 ) ( HOLDING ?auto_53015 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53015 )
      ( MAKE-3PILE ?auto_53011 ?auto_53012 ?auto_53013 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53017 - BLOCK
      ?auto_53018 - BLOCK
      ?auto_53019 - BLOCK
    )
    :vars
    (
      ?auto_53020 - BLOCK
      ?auto_53022 - BLOCK
      ?auto_53021 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53020 ?auto_53019 ) ( ON-TABLE ?auto_53017 ) ( ON ?auto_53018 ?auto_53017 ) ( ON ?auto_53019 ?auto_53018 ) ( not ( = ?auto_53017 ?auto_53018 ) ) ( not ( = ?auto_53017 ?auto_53019 ) ) ( not ( = ?auto_53017 ?auto_53020 ) ) ( not ( = ?auto_53018 ?auto_53019 ) ) ( not ( = ?auto_53018 ?auto_53020 ) ) ( not ( = ?auto_53019 ?auto_53020 ) ) ( not ( = ?auto_53017 ?auto_53022 ) ) ( not ( = ?auto_53017 ?auto_53021 ) ) ( not ( = ?auto_53018 ?auto_53022 ) ) ( not ( = ?auto_53018 ?auto_53021 ) ) ( not ( = ?auto_53019 ?auto_53022 ) ) ( not ( = ?auto_53019 ?auto_53021 ) ) ( not ( = ?auto_53020 ?auto_53022 ) ) ( not ( = ?auto_53020 ?auto_53021 ) ) ( not ( = ?auto_53022 ?auto_53021 ) ) ( ON ?auto_53022 ?auto_53020 ) ( ON ?auto_53021 ?auto_53022 ) ( CLEAR ?auto_53021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53017 ?auto_53018 ?auto_53019 ?auto_53020 ?auto_53022 )
      ( MAKE-3PILE ?auto_53017 ?auto_53018 ?auto_53019 ) )
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
      ?auto_53028 - BLOCK
      ?auto_53026 - BLOCK
      ?auto_53027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53028 ?auto_53025 ) ( ON-TABLE ?auto_53023 ) ( ON ?auto_53024 ?auto_53023 ) ( ON ?auto_53025 ?auto_53024 ) ( not ( = ?auto_53023 ?auto_53024 ) ) ( not ( = ?auto_53023 ?auto_53025 ) ) ( not ( = ?auto_53023 ?auto_53028 ) ) ( not ( = ?auto_53024 ?auto_53025 ) ) ( not ( = ?auto_53024 ?auto_53028 ) ) ( not ( = ?auto_53025 ?auto_53028 ) ) ( not ( = ?auto_53023 ?auto_53026 ) ) ( not ( = ?auto_53023 ?auto_53027 ) ) ( not ( = ?auto_53024 ?auto_53026 ) ) ( not ( = ?auto_53024 ?auto_53027 ) ) ( not ( = ?auto_53025 ?auto_53026 ) ) ( not ( = ?auto_53025 ?auto_53027 ) ) ( not ( = ?auto_53028 ?auto_53026 ) ) ( not ( = ?auto_53028 ?auto_53027 ) ) ( not ( = ?auto_53026 ?auto_53027 ) ) ( ON ?auto_53026 ?auto_53028 ) ( HOLDING ?auto_53027 ) ( CLEAR ?auto_53026 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53023 ?auto_53024 ?auto_53025 ?auto_53028 ?auto_53026 ?auto_53027 )
      ( MAKE-3PILE ?auto_53023 ?auto_53024 ?auto_53025 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53029 - BLOCK
      ?auto_53030 - BLOCK
      ?auto_53031 - BLOCK
    )
    :vars
    (
      ?auto_53032 - BLOCK
      ?auto_53034 - BLOCK
      ?auto_53033 - BLOCK
      ?auto_53035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53032 ?auto_53031 ) ( ON-TABLE ?auto_53029 ) ( ON ?auto_53030 ?auto_53029 ) ( ON ?auto_53031 ?auto_53030 ) ( not ( = ?auto_53029 ?auto_53030 ) ) ( not ( = ?auto_53029 ?auto_53031 ) ) ( not ( = ?auto_53029 ?auto_53032 ) ) ( not ( = ?auto_53030 ?auto_53031 ) ) ( not ( = ?auto_53030 ?auto_53032 ) ) ( not ( = ?auto_53031 ?auto_53032 ) ) ( not ( = ?auto_53029 ?auto_53034 ) ) ( not ( = ?auto_53029 ?auto_53033 ) ) ( not ( = ?auto_53030 ?auto_53034 ) ) ( not ( = ?auto_53030 ?auto_53033 ) ) ( not ( = ?auto_53031 ?auto_53034 ) ) ( not ( = ?auto_53031 ?auto_53033 ) ) ( not ( = ?auto_53032 ?auto_53034 ) ) ( not ( = ?auto_53032 ?auto_53033 ) ) ( not ( = ?auto_53034 ?auto_53033 ) ) ( ON ?auto_53034 ?auto_53032 ) ( CLEAR ?auto_53034 ) ( ON ?auto_53033 ?auto_53035 ) ( CLEAR ?auto_53033 ) ( HAND-EMPTY ) ( not ( = ?auto_53029 ?auto_53035 ) ) ( not ( = ?auto_53030 ?auto_53035 ) ) ( not ( = ?auto_53031 ?auto_53035 ) ) ( not ( = ?auto_53032 ?auto_53035 ) ) ( not ( = ?auto_53034 ?auto_53035 ) ) ( not ( = ?auto_53033 ?auto_53035 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53033 ?auto_53035 )
      ( MAKE-3PILE ?auto_53029 ?auto_53030 ?auto_53031 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53036 - BLOCK
      ?auto_53037 - BLOCK
      ?auto_53038 - BLOCK
    )
    :vars
    (
      ?auto_53042 - BLOCK
      ?auto_53040 - BLOCK
      ?auto_53041 - BLOCK
      ?auto_53039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53042 ?auto_53038 ) ( ON-TABLE ?auto_53036 ) ( ON ?auto_53037 ?auto_53036 ) ( ON ?auto_53038 ?auto_53037 ) ( not ( = ?auto_53036 ?auto_53037 ) ) ( not ( = ?auto_53036 ?auto_53038 ) ) ( not ( = ?auto_53036 ?auto_53042 ) ) ( not ( = ?auto_53037 ?auto_53038 ) ) ( not ( = ?auto_53037 ?auto_53042 ) ) ( not ( = ?auto_53038 ?auto_53042 ) ) ( not ( = ?auto_53036 ?auto_53040 ) ) ( not ( = ?auto_53036 ?auto_53041 ) ) ( not ( = ?auto_53037 ?auto_53040 ) ) ( not ( = ?auto_53037 ?auto_53041 ) ) ( not ( = ?auto_53038 ?auto_53040 ) ) ( not ( = ?auto_53038 ?auto_53041 ) ) ( not ( = ?auto_53042 ?auto_53040 ) ) ( not ( = ?auto_53042 ?auto_53041 ) ) ( not ( = ?auto_53040 ?auto_53041 ) ) ( ON ?auto_53041 ?auto_53039 ) ( CLEAR ?auto_53041 ) ( not ( = ?auto_53036 ?auto_53039 ) ) ( not ( = ?auto_53037 ?auto_53039 ) ) ( not ( = ?auto_53038 ?auto_53039 ) ) ( not ( = ?auto_53042 ?auto_53039 ) ) ( not ( = ?auto_53040 ?auto_53039 ) ) ( not ( = ?auto_53041 ?auto_53039 ) ) ( HOLDING ?auto_53040 ) ( CLEAR ?auto_53042 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53036 ?auto_53037 ?auto_53038 ?auto_53042 ?auto_53040 )
      ( MAKE-3PILE ?auto_53036 ?auto_53037 ?auto_53038 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53043 - BLOCK
      ?auto_53044 - BLOCK
      ?auto_53045 - BLOCK
    )
    :vars
    (
      ?auto_53049 - BLOCK
      ?auto_53047 - BLOCK
      ?auto_53048 - BLOCK
      ?auto_53046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53049 ?auto_53045 ) ( ON-TABLE ?auto_53043 ) ( ON ?auto_53044 ?auto_53043 ) ( ON ?auto_53045 ?auto_53044 ) ( not ( = ?auto_53043 ?auto_53044 ) ) ( not ( = ?auto_53043 ?auto_53045 ) ) ( not ( = ?auto_53043 ?auto_53049 ) ) ( not ( = ?auto_53044 ?auto_53045 ) ) ( not ( = ?auto_53044 ?auto_53049 ) ) ( not ( = ?auto_53045 ?auto_53049 ) ) ( not ( = ?auto_53043 ?auto_53047 ) ) ( not ( = ?auto_53043 ?auto_53048 ) ) ( not ( = ?auto_53044 ?auto_53047 ) ) ( not ( = ?auto_53044 ?auto_53048 ) ) ( not ( = ?auto_53045 ?auto_53047 ) ) ( not ( = ?auto_53045 ?auto_53048 ) ) ( not ( = ?auto_53049 ?auto_53047 ) ) ( not ( = ?auto_53049 ?auto_53048 ) ) ( not ( = ?auto_53047 ?auto_53048 ) ) ( ON ?auto_53048 ?auto_53046 ) ( not ( = ?auto_53043 ?auto_53046 ) ) ( not ( = ?auto_53044 ?auto_53046 ) ) ( not ( = ?auto_53045 ?auto_53046 ) ) ( not ( = ?auto_53049 ?auto_53046 ) ) ( not ( = ?auto_53047 ?auto_53046 ) ) ( not ( = ?auto_53048 ?auto_53046 ) ) ( CLEAR ?auto_53049 ) ( ON ?auto_53047 ?auto_53048 ) ( CLEAR ?auto_53047 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53046 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53046 ?auto_53048 )
      ( MAKE-3PILE ?auto_53043 ?auto_53044 ?auto_53045 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53064 - BLOCK
      ?auto_53065 - BLOCK
      ?auto_53066 - BLOCK
    )
    :vars
    (
      ?auto_53070 - BLOCK
      ?auto_53069 - BLOCK
      ?auto_53067 - BLOCK
      ?auto_53068 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53064 ) ( ON ?auto_53065 ?auto_53064 ) ( not ( = ?auto_53064 ?auto_53065 ) ) ( not ( = ?auto_53064 ?auto_53066 ) ) ( not ( = ?auto_53064 ?auto_53070 ) ) ( not ( = ?auto_53065 ?auto_53066 ) ) ( not ( = ?auto_53065 ?auto_53070 ) ) ( not ( = ?auto_53066 ?auto_53070 ) ) ( not ( = ?auto_53064 ?auto_53069 ) ) ( not ( = ?auto_53064 ?auto_53067 ) ) ( not ( = ?auto_53065 ?auto_53069 ) ) ( not ( = ?auto_53065 ?auto_53067 ) ) ( not ( = ?auto_53066 ?auto_53069 ) ) ( not ( = ?auto_53066 ?auto_53067 ) ) ( not ( = ?auto_53070 ?auto_53069 ) ) ( not ( = ?auto_53070 ?auto_53067 ) ) ( not ( = ?auto_53069 ?auto_53067 ) ) ( ON ?auto_53067 ?auto_53068 ) ( not ( = ?auto_53064 ?auto_53068 ) ) ( not ( = ?auto_53065 ?auto_53068 ) ) ( not ( = ?auto_53066 ?auto_53068 ) ) ( not ( = ?auto_53070 ?auto_53068 ) ) ( not ( = ?auto_53069 ?auto_53068 ) ) ( not ( = ?auto_53067 ?auto_53068 ) ) ( ON ?auto_53069 ?auto_53067 ) ( ON-TABLE ?auto_53068 ) ( ON ?auto_53070 ?auto_53069 ) ( CLEAR ?auto_53070 ) ( HOLDING ?auto_53066 ) ( CLEAR ?auto_53065 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53064 ?auto_53065 ?auto_53066 ?auto_53070 )
      ( MAKE-3PILE ?auto_53064 ?auto_53065 ?auto_53066 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53071 - BLOCK
      ?auto_53072 - BLOCK
      ?auto_53073 - BLOCK
    )
    :vars
    (
      ?auto_53077 - BLOCK
      ?auto_53074 - BLOCK
      ?auto_53076 - BLOCK
      ?auto_53075 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53071 ) ( ON ?auto_53072 ?auto_53071 ) ( not ( = ?auto_53071 ?auto_53072 ) ) ( not ( = ?auto_53071 ?auto_53073 ) ) ( not ( = ?auto_53071 ?auto_53077 ) ) ( not ( = ?auto_53072 ?auto_53073 ) ) ( not ( = ?auto_53072 ?auto_53077 ) ) ( not ( = ?auto_53073 ?auto_53077 ) ) ( not ( = ?auto_53071 ?auto_53074 ) ) ( not ( = ?auto_53071 ?auto_53076 ) ) ( not ( = ?auto_53072 ?auto_53074 ) ) ( not ( = ?auto_53072 ?auto_53076 ) ) ( not ( = ?auto_53073 ?auto_53074 ) ) ( not ( = ?auto_53073 ?auto_53076 ) ) ( not ( = ?auto_53077 ?auto_53074 ) ) ( not ( = ?auto_53077 ?auto_53076 ) ) ( not ( = ?auto_53074 ?auto_53076 ) ) ( ON ?auto_53076 ?auto_53075 ) ( not ( = ?auto_53071 ?auto_53075 ) ) ( not ( = ?auto_53072 ?auto_53075 ) ) ( not ( = ?auto_53073 ?auto_53075 ) ) ( not ( = ?auto_53077 ?auto_53075 ) ) ( not ( = ?auto_53074 ?auto_53075 ) ) ( not ( = ?auto_53076 ?auto_53075 ) ) ( ON ?auto_53074 ?auto_53076 ) ( ON-TABLE ?auto_53075 ) ( ON ?auto_53077 ?auto_53074 ) ( CLEAR ?auto_53072 ) ( ON ?auto_53073 ?auto_53077 ) ( CLEAR ?auto_53073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53075 ?auto_53076 ?auto_53074 ?auto_53077 )
      ( MAKE-3PILE ?auto_53071 ?auto_53072 ?auto_53073 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53078 - BLOCK
      ?auto_53079 - BLOCK
      ?auto_53080 - BLOCK
    )
    :vars
    (
      ?auto_53084 - BLOCK
      ?auto_53081 - BLOCK
      ?auto_53083 - BLOCK
      ?auto_53082 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53078 ) ( not ( = ?auto_53078 ?auto_53079 ) ) ( not ( = ?auto_53078 ?auto_53080 ) ) ( not ( = ?auto_53078 ?auto_53084 ) ) ( not ( = ?auto_53079 ?auto_53080 ) ) ( not ( = ?auto_53079 ?auto_53084 ) ) ( not ( = ?auto_53080 ?auto_53084 ) ) ( not ( = ?auto_53078 ?auto_53081 ) ) ( not ( = ?auto_53078 ?auto_53083 ) ) ( not ( = ?auto_53079 ?auto_53081 ) ) ( not ( = ?auto_53079 ?auto_53083 ) ) ( not ( = ?auto_53080 ?auto_53081 ) ) ( not ( = ?auto_53080 ?auto_53083 ) ) ( not ( = ?auto_53084 ?auto_53081 ) ) ( not ( = ?auto_53084 ?auto_53083 ) ) ( not ( = ?auto_53081 ?auto_53083 ) ) ( ON ?auto_53083 ?auto_53082 ) ( not ( = ?auto_53078 ?auto_53082 ) ) ( not ( = ?auto_53079 ?auto_53082 ) ) ( not ( = ?auto_53080 ?auto_53082 ) ) ( not ( = ?auto_53084 ?auto_53082 ) ) ( not ( = ?auto_53081 ?auto_53082 ) ) ( not ( = ?auto_53083 ?auto_53082 ) ) ( ON ?auto_53081 ?auto_53083 ) ( ON-TABLE ?auto_53082 ) ( ON ?auto_53084 ?auto_53081 ) ( ON ?auto_53080 ?auto_53084 ) ( CLEAR ?auto_53080 ) ( HOLDING ?auto_53079 ) ( CLEAR ?auto_53078 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53078 ?auto_53079 )
      ( MAKE-3PILE ?auto_53078 ?auto_53079 ?auto_53080 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53085 - BLOCK
      ?auto_53086 - BLOCK
      ?auto_53087 - BLOCK
    )
    :vars
    (
      ?auto_53091 - BLOCK
      ?auto_53088 - BLOCK
      ?auto_53090 - BLOCK
      ?auto_53089 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53085 ) ( not ( = ?auto_53085 ?auto_53086 ) ) ( not ( = ?auto_53085 ?auto_53087 ) ) ( not ( = ?auto_53085 ?auto_53091 ) ) ( not ( = ?auto_53086 ?auto_53087 ) ) ( not ( = ?auto_53086 ?auto_53091 ) ) ( not ( = ?auto_53087 ?auto_53091 ) ) ( not ( = ?auto_53085 ?auto_53088 ) ) ( not ( = ?auto_53085 ?auto_53090 ) ) ( not ( = ?auto_53086 ?auto_53088 ) ) ( not ( = ?auto_53086 ?auto_53090 ) ) ( not ( = ?auto_53087 ?auto_53088 ) ) ( not ( = ?auto_53087 ?auto_53090 ) ) ( not ( = ?auto_53091 ?auto_53088 ) ) ( not ( = ?auto_53091 ?auto_53090 ) ) ( not ( = ?auto_53088 ?auto_53090 ) ) ( ON ?auto_53090 ?auto_53089 ) ( not ( = ?auto_53085 ?auto_53089 ) ) ( not ( = ?auto_53086 ?auto_53089 ) ) ( not ( = ?auto_53087 ?auto_53089 ) ) ( not ( = ?auto_53091 ?auto_53089 ) ) ( not ( = ?auto_53088 ?auto_53089 ) ) ( not ( = ?auto_53090 ?auto_53089 ) ) ( ON ?auto_53088 ?auto_53090 ) ( ON-TABLE ?auto_53089 ) ( ON ?auto_53091 ?auto_53088 ) ( ON ?auto_53087 ?auto_53091 ) ( CLEAR ?auto_53085 ) ( ON ?auto_53086 ?auto_53087 ) ( CLEAR ?auto_53086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53089 ?auto_53090 ?auto_53088 ?auto_53091 ?auto_53087 )
      ( MAKE-3PILE ?auto_53085 ?auto_53086 ?auto_53087 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53092 - BLOCK
      ?auto_53093 - BLOCK
      ?auto_53094 - BLOCK
    )
    :vars
    (
      ?auto_53098 - BLOCK
      ?auto_53095 - BLOCK
      ?auto_53096 - BLOCK
      ?auto_53097 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53092 ?auto_53093 ) ) ( not ( = ?auto_53092 ?auto_53094 ) ) ( not ( = ?auto_53092 ?auto_53098 ) ) ( not ( = ?auto_53093 ?auto_53094 ) ) ( not ( = ?auto_53093 ?auto_53098 ) ) ( not ( = ?auto_53094 ?auto_53098 ) ) ( not ( = ?auto_53092 ?auto_53095 ) ) ( not ( = ?auto_53092 ?auto_53096 ) ) ( not ( = ?auto_53093 ?auto_53095 ) ) ( not ( = ?auto_53093 ?auto_53096 ) ) ( not ( = ?auto_53094 ?auto_53095 ) ) ( not ( = ?auto_53094 ?auto_53096 ) ) ( not ( = ?auto_53098 ?auto_53095 ) ) ( not ( = ?auto_53098 ?auto_53096 ) ) ( not ( = ?auto_53095 ?auto_53096 ) ) ( ON ?auto_53096 ?auto_53097 ) ( not ( = ?auto_53092 ?auto_53097 ) ) ( not ( = ?auto_53093 ?auto_53097 ) ) ( not ( = ?auto_53094 ?auto_53097 ) ) ( not ( = ?auto_53098 ?auto_53097 ) ) ( not ( = ?auto_53095 ?auto_53097 ) ) ( not ( = ?auto_53096 ?auto_53097 ) ) ( ON ?auto_53095 ?auto_53096 ) ( ON-TABLE ?auto_53097 ) ( ON ?auto_53098 ?auto_53095 ) ( ON ?auto_53094 ?auto_53098 ) ( ON ?auto_53093 ?auto_53094 ) ( CLEAR ?auto_53093 ) ( HOLDING ?auto_53092 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53092 )
      ( MAKE-3PILE ?auto_53092 ?auto_53093 ?auto_53094 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53099 - BLOCK
      ?auto_53100 - BLOCK
      ?auto_53101 - BLOCK
    )
    :vars
    (
      ?auto_53103 - BLOCK
      ?auto_53104 - BLOCK
      ?auto_53105 - BLOCK
      ?auto_53102 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53099 ?auto_53100 ) ) ( not ( = ?auto_53099 ?auto_53101 ) ) ( not ( = ?auto_53099 ?auto_53103 ) ) ( not ( = ?auto_53100 ?auto_53101 ) ) ( not ( = ?auto_53100 ?auto_53103 ) ) ( not ( = ?auto_53101 ?auto_53103 ) ) ( not ( = ?auto_53099 ?auto_53104 ) ) ( not ( = ?auto_53099 ?auto_53105 ) ) ( not ( = ?auto_53100 ?auto_53104 ) ) ( not ( = ?auto_53100 ?auto_53105 ) ) ( not ( = ?auto_53101 ?auto_53104 ) ) ( not ( = ?auto_53101 ?auto_53105 ) ) ( not ( = ?auto_53103 ?auto_53104 ) ) ( not ( = ?auto_53103 ?auto_53105 ) ) ( not ( = ?auto_53104 ?auto_53105 ) ) ( ON ?auto_53105 ?auto_53102 ) ( not ( = ?auto_53099 ?auto_53102 ) ) ( not ( = ?auto_53100 ?auto_53102 ) ) ( not ( = ?auto_53101 ?auto_53102 ) ) ( not ( = ?auto_53103 ?auto_53102 ) ) ( not ( = ?auto_53104 ?auto_53102 ) ) ( not ( = ?auto_53105 ?auto_53102 ) ) ( ON ?auto_53104 ?auto_53105 ) ( ON-TABLE ?auto_53102 ) ( ON ?auto_53103 ?auto_53104 ) ( ON ?auto_53101 ?auto_53103 ) ( ON ?auto_53100 ?auto_53101 ) ( ON ?auto_53099 ?auto_53100 ) ( CLEAR ?auto_53099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53102 ?auto_53105 ?auto_53104 ?auto_53103 ?auto_53101 ?auto_53100 )
      ( MAKE-3PILE ?auto_53099 ?auto_53100 ?auto_53101 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53109 - BLOCK
      ?auto_53110 - BLOCK
      ?auto_53111 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_53111 ) ( CLEAR ?auto_53110 ) ( ON-TABLE ?auto_53109 ) ( ON ?auto_53110 ?auto_53109 ) ( not ( = ?auto_53109 ?auto_53110 ) ) ( not ( = ?auto_53109 ?auto_53111 ) ) ( not ( = ?auto_53110 ?auto_53111 ) ) )
    :subtasks
    ( ( !STACK ?auto_53111 ?auto_53110 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53112 - BLOCK
      ?auto_53113 - BLOCK
      ?auto_53114 - BLOCK
    )
    :vars
    (
      ?auto_53115 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_53113 ) ( ON-TABLE ?auto_53112 ) ( ON ?auto_53113 ?auto_53112 ) ( not ( = ?auto_53112 ?auto_53113 ) ) ( not ( = ?auto_53112 ?auto_53114 ) ) ( not ( = ?auto_53113 ?auto_53114 ) ) ( ON ?auto_53114 ?auto_53115 ) ( CLEAR ?auto_53114 ) ( HAND-EMPTY ) ( not ( = ?auto_53112 ?auto_53115 ) ) ( not ( = ?auto_53113 ?auto_53115 ) ) ( not ( = ?auto_53114 ?auto_53115 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53114 ?auto_53115 )
      ( MAKE-3PILE ?auto_53112 ?auto_53113 ?auto_53114 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53116 - BLOCK
      ?auto_53117 - BLOCK
      ?auto_53118 - BLOCK
    )
    :vars
    (
      ?auto_53119 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53116 ) ( not ( = ?auto_53116 ?auto_53117 ) ) ( not ( = ?auto_53116 ?auto_53118 ) ) ( not ( = ?auto_53117 ?auto_53118 ) ) ( ON ?auto_53118 ?auto_53119 ) ( CLEAR ?auto_53118 ) ( not ( = ?auto_53116 ?auto_53119 ) ) ( not ( = ?auto_53117 ?auto_53119 ) ) ( not ( = ?auto_53118 ?auto_53119 ) ) ( HOLDING ?auto_53117 ) ( CLEAR ?auto_53116 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53116 ?auto_53117 )
      ( MAKE-3PILE ?auto_53116 ?auto_53117 ?auto_53118 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53120 - BLOCK
      ?auto_53121 - BLOCK
      ?auto_53122 - BLOCK
    )
    :vars
    (
      ?auto_53123 - BLOCK
      ?auto_53125 - BLOCK
      ?auto_53124 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53120 ) ( not ( = ?auto_53120 ?auto_53121 ) ) ( not ( = ?auto_53120 ?auto_53122 ) ) ( not ( = ?auto_53121 ?auto_53122 ) ) ( ON ?auto_53122 ?auto_53123 ) ( not ( = ?auto_53120 ?auto_53123 ) ) ( not ( = ?auto_53121 ?auto_53123 ) ) ( not ( = ?auto_53122 ?auto_53123 ) ) ( CLEAR ?auto_53120 ) ( ON ?auto_53121 ?auto_53122 ) ( CLEAR ?auto_53121 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53125 ) ( ON ?auto_53124 ?auto_53125 ) ( ON ?auto_53123 ?auto_53124 ) ( not ( = ?auto_53125 ?auto_53124 ) ) ( not ( = ?auto_53125 ?auto_53123 ) ) ( not ( = ?auto_53125 ?auto_53122 ) ) ( not ( = ?auto_53125 ?auto_53121 ) ) ( not ( = ?auto_53124 ?auto_53123 ) ) ( not ( = ?auto_53124 ?auto_53122 ) ) ( not ( = ?auto_53124 ?auto_53121 ) ) ( not ( = ?auto_53120 ?auto_53125 ) ) ( not ( = ?auto_53120 ?auto_53124 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53125 ?auto_53124 ?auto_53123 ?auto_53122 )
      ( MAKE-3PILE ?auto_53120 ?auto_53121 ?auto_53122 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53126 - BLOCK
      ?auto_53127 - BLOCK
      ?auto_53128 - BLOCK
    )
    :vars
    (
      ?auto_53129 - BLOCK
      ?auto_53131 - BLOCK
      ?auto_53130 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53126 ?auto_53127 ) ) ( not ( = ?auto_53126 ?auto_53128 ) ) ( not ( = ?auto_53127 ?auto_53128 ) ) ( ON ?auto_53128 ?auto_53129 ) ( not ( = ?auto_53126 ?auto_53129 ) ) ( not ( = ?auto_53127 ?auto_53129 ) ) ( not ( = ?auto_53128 ?auto_53129 ) ) ( ON ?auto_53127 ?auto_53128 ) ( CLEAR ?auto_53127 ) ( ON-TABLE ?auto_53131 ) ( ON ?auto_53130 ?auto_53131 ) ( ON ?auto_53129 ?auto_53130 ) ( not ( = ?auto_53131 ?auto_53130 ) ) ( not ( = ?auto_53131 ?auto_53129 ) ) ( not ( = ?auto_53131 ?auto_53128 ) ) ( not ( = ?auto_53131 ?auto_53127 ) ) ( not ( = ?auto_53130 ?auto_53129 ) ) ( not ( = ?auto_53130 ?auto_53128 ) ) ( not ( = ?auto_53130 ?auto_53127 ) ) ( not ( = ?auto_53126 ?auto_53131 ) ) ( not ( = ?auto_53126 ?auto_53130 ) ) ( HOLDING ?auto_53126 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53126 )
      ( MAKE-3PILE ?auto_53126 ?auto_53127 ?auto_53128 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53132 - BLOCK
      ?auto_53133 - BLOCK
      ?auto_53134 - BLOCK
    )
    :vars
    (
      ?auto_53137 - BLOCK
      ?auto_53135 - BLOCK
      ?auto_53136 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53132 ?auto_53133 ) ) ( not ( = ?auto_53132 ?auto_53134 ) ) ( not ( = ?auto_53133 ?auto_53134 ) ) ( ON ?auto_53134 ?auto_53137 ) ( not ( = ?auto_53132 ?auto_53137 ) ) ( not ( = ?auto_53133 ?auto_53137 ) ) ( not ( = ?auto_53134 ?auto_53137 ) ) ( ON ?auto_53133 ?auto_53134 ) ( ON-TABLE ?auto_53135 ) ( ON ?auto_53136 ?auto_53135 ) ( ON ?auto_53137 ?auto_53136 ) ( not ( = ?auto_53135 ?auto_53136 ) ) ( not ( = ?auto_53135 ?auto_53137 ) ) ( not ( = ?auto_53135 ?auto_53134 ) ) ( not ( = ?auto_53135 ?auto_53133 ) ) ( not ( = ?auto_53136 ?auto_53137 ) ) ( not ( = ?auto_53136 ?auto_53134 ) ) ( not ( = ?auto_53136 ?auto_53133 ) ) ( not ( = ?auto_53132 ?auto_53135 ) ) ( not ( = ?auto_53132 ?auto_53136 ) ) ( ON ?auto_53132 ?auto_53133 ) ( CLEAR ?auto_53132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53135 ?auto_53136 ?auto_53137 ?auto_53134 ?auto_53133 )
      ( MAKE-3PILE ?auto_53132 ?auto_53133 ?auto_53134 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53138 - BLOCK
      ?auto_53139 - BLOCK
      ?auto_53140 - BLOCK
    )
    :vars
    (
      ?auto_53143 - BLOCK
      ?auto_53142 - BLOCK
      ?auto_53141 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53138 ?auto_53139 ) ) ( not ( = ?auto_53138 ?auto_53140 ) ) ( not ( = ?auto_53139 ?auto_53140 ) ) ( ON ?auto_53140 ?auto_53143 ) ( not ( = ?auto_53138 ?auto_53143 ) ) ( not ( = ?auto_53139 ?auto_53143 ) ) ( not ( = ?auto_53140 ?auto_53143 ) ) ( ON ?auto_53139 ?auto_53140 ) ( ON-TABLE ?auto_53142 ) ( ON ?auto_53141 ?auto_53142 ) ( ON ?auto_53143 ?auto_53141 ) ( not ( = ?auto_53142 ?auto_53141 ) ) ( not ( = ?auto_53142 ?auto_53143 ) ) ( not ( = ?auto_53142 ?auto_53140 ) ) ( not ( = ?auto_53142 ?auto_53139 ) ) ( not ( = ?auto_53141 ?auto_53143 ) ) ( not ( = ?auto_53141 ?auto_53140 ) ) ( not ( = ?auto_53141 ?auto_53139 ) ) ( not ( = ?auto_53138 ?auto_53142 ) ) ( not ( = ?auto_53138 ?auto_53141 ) ) ( HOLDING ?auto_53138 ) ( CLEAR ?auto_53139 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53142 ?auto_53141 ?auto_53143 ?auto_53140 ?auto_53139 ?auto_53138 )
      ( MAKE-3PILE ?auto_53138 ?auto_53139 ?auto_53140 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53144 - BLOCK
      ?auto_53145 - BLOCK
      ?auto_53146 - BLOCK
    )
    :vars
    (
      ?auto_53148 - BLOCK
      ?auto_53149 - BLOCK
      ?auto_53147 - BLOCK
      ?auto_53150 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53144 ?auto_53145 ) ) ( not ( = ?auto_53144 ?auto_53146 ) ) ( not ( = ?auto_53145 ?auto_53146 ) ) ( ON ?auto_53146 ?auto_53148 ) ( not ( = ?auto_53144 ?auto_53148 ) ) ( not ( = ?auto_53145 ?auto_53148 ) ) ( not ( = ?auto_53146 ?auto_53148 ) ) ( ON ?auto_53145 ?auto_53146 ) ( ON-TABLE ?auto_53149 ) ( ON ?auto_53147 ?auto_53149 ) ( ON ?auto_53148 ?auto_53147 ) ( not ( = ?auto_53149 ?auto_53147 ) ) ( not ( = ?auto_53149 ?auto_53148 ) ) ( not ( = ?auto_53149 ?auto_53146 ) ) ( not ( = ?auto_53149 ?auto_53145 ) ) ( not ( = ?auto_53147 ?auto_53148 ) ) ( not ( = ?auto_53147 ?auto_53146 ) ) ( not ( = ?auto_53147 ?auto_53145 ) ) ( not ( = ?auto_53144 ?auto_53149 ) ) ( not ( = ?auto_53144 ?auto_53147 ) ) ( CLEAR ?auto_53145 ) ( ON ?auto_53144 ?auto_53150 ) ( CLEAR ?auto_53144 ) ( HAND-EMPTY ) ( not ( = ?auto_53144 ?auto_53150 ) ) ( not ( = ?auto_53145 ?auto_53150 ) ) ( not ( = ?auto_53146 ?auto_53150 ) ) ( not ( = ?auto_53148 ?auto_53150 ) ) ( not ( = ?auto_53149 ?auto_53150 ) ) ( not ( = ?auto_53147 ?auto_53150 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53144 ?auto_53150 )
      ( MAKE-3PILE ?auto_53144 ?auto_53145 ?auto_53146 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53151 - BLOCK
      ?auto_53152 - BLOCK
      ?auto_53153 - BLOCK
    )
    :vars
    (
      ?auto_53154 - BLOCK
      ?auto_53156 - BLOCK
      ?auto_53157 - BLOCK
      ?auto_53155 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53151 ?auto_53152 ) ) ( not ( = ?auto_53151 ?auto_53153 ) ) ( not ( = ?auto_53152 ?auto_53153 ) ) ( ON ?auto_53153 ?auto_53154 ) ( not ( = ?auto_53151 ?auto_53154 ) ) ( not ( = ?auto_53152 ?auto_53154 ) ) ( not ( = ?auto_53153 ?auto_53154 ) ) ( ON-TABLE ?auto_53156 ) ( ON ?auto_53157 ?auto_53156 ) ( ON ?auto_53154 ?auto_53157 ) ( not ( = ?auto_53156 ?auto_53157 ) ) ( not ( = ?auto_53156 ?auto_53154 ) ) ( not ( = ?auto_53156 ?auto_53153 ) ) ( not ( = ?auto_53156 ?auto_53152 ) ) ( not ( = ?auto_53157 ?auto_53154 ) ) ( not ( = ?auto_53157 ?auto_53153 ) ) ( not ( = ?auto_53157 ?auto_53152 ) ) ( not ( = ?auto_53151 ?auto_53156 ) ) ( not ( = ?auto_53151 ?auto_53157 ) ) ( ON ?auto_53151 ?auto_53155 ) ( CLEAR ?auto_53151 ) ( not ( = ?auto_53151 ?auto_53155 ) ) ( not ( = ?auto_53152 ?auto_53155 ) ) ( not ( = ?auto_53153 ?auto_53155 ) ) ( not ( = ?auto_53154 ?auto_53155 ) ) ( not ( = ?auto_53156 ?auto_53155 ) ) ( not ( = ?auto_53157 ?auto_53155 ) ) ( HOLDING ?auto_53152 ) ( CLEAR ?auto_53153 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53156 ?auto_53157 ?auto_53154 ?auto_53153 ?auto_53152 )
      ( MAKE-3PILE ?auto_53151 ?auto_53152 ?auto_53153 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53158 - BLOCK
      ?auto_53159 - BLOCK
      ?auto_53160 - BLOCK
    )
    :vars
    (
      ?auto_53163 - BLOCK
      ?auto_53164 - BLOCK
      ?auto_53162 - BLOCK
      ?auto_53161 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53158 ?auto_53159 ) ) ( not ( = ?auto_53158 ?auto_53160 ) ) ( not ( = ?auto_53159 ?auto_53160 ) ) ( ON ?auto_53160 ?auto_53163 ) ( not ( = ?auto_53158 ?auto_53163 ) ) ( not ( = ?auto_53159 ?auto_53163 ) ) ( not ( = ?auto_53160 ?auto_53163 ) ) ( ON-TABLE ?auto_53164 ) ( ON ?auto_53162 ?auto_53164 ) ( ON ?auto_53163 ?auto_53162 ) ( not ( = ?auto_53164 ?auto_53162 ) ) ( not ( = ?auto_53164 ?auto_53163 ) ) ( not ( = ?auto_53164 ?auto_53160 ) ) ( not ( = ?auto_53164 ?auto_53159 ) ) ( not ( = ?auto_53162 ?auto_53163 ) ) ( not ( = ?auto_53162 ?auto_53160 ) ) ( not ( = ?auto_53162 ?auto_53159 ) ) ( not ( = ?auto_53158 ?auto_53164 ) ) ( not ( = ?auto_53158 ?auto_53162 ) ) ( ON ?auto_53158 ?auto_53161 ) ( not ( = ?auto_53158 ?auto_53161 ) ) ( not ( = ?auto_53159 ?auto_53161 ) ) ( not ( = ?auto_53160 ?auto_53161 ) ) ( not ( = ?auto_53163 ?auto_53161 ) ) ( not ( = ?auto_53164 ?auto_53161 ) ) ( not ( = ?auto_53162 ?auto_53161 ) ) ( CLEAR ?auto_53160 ) ( ON ?auto_53159 ?auto_53158 ) ( CLEAR ?auto_53159 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53161 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53161 ?auto_53158 )
      ( MAKE-3PILE ?auto_53158 ?auto_53159 ?auto_53160 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53165 - BLOCK
      ?auto_53166 - BLOCK
      ?auto_53167 - BLOCK
    )
    :vars
    (
      ?auto_53168 - BLOCK
      ?auto_53169 - BLOCK
      ?auto_53170 - BLOCK
      ?auto_53171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53165 ?auto_53166 ) ) ( not ( = ?auto_53165 ?auto_53167 ) ) ( not ( = ?auto_53166 ?auto_53167 ) ) ( not ( = ?auto_53165 ?auto_53168 ) ) ( not ( = ?auto_53166 ?auto_53168 ) ) ( not ( = ?auto_53167 ?auto_53168 ) ) ( ON-TABLE ?auto_53169 ) ( ON ?auto_53170 ?auto_53169 ) ( ON ?auto_53168 ?auto_53170 ) ( not ( = ?auto_53169 ?auto_53170 ) ) ( not ( = ?auto_53169 ?auto_53168 ) ) ( not ( = ?auto_53169 ?auto_53167 ) ) ( not ( = ?auto_53169 ?auto_53166 ) ) ( not ( = ?auto_53170 ?auto_53168 ) ) ( not ( = ?auto_53170 ?auto_53167 ) ) ( not ( = ?auto_53170 ?auto_53166 ) ) ( not ( = ?auto_53165 ?auto_53169 ) ) ( not ( = ?auto_53165 ?auto_53170 ) ) ( ON ?auto_53165 ?auto_53171 ) ( not ( = ?auto_53165 ?auto_53171 ) ) ( not ( = ?auto_53166 ?auto_53171 ) ) ( not ( = ?auto_53167 ?auto_53171 ) ) ( not ( = ?auto_53168 ?auto_53171 ) ) ( not ( = ?auto_53169 ?auto_53171 ) ) ( not ( = ?auto_53170 ?auto_53171 ) ) ( ON ?auto_53166 ?auto_53165 ) ( CLEAR ?auto_53166 ) ( ON-TABLE ?auto_53171 ) ( HOLDING ?auto_53167 ) ( CLEAR ?auto_53168 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53169 ?auto_53170 ?auto_53168 ?auto_53167 )
      ( MAKE-3PILE ?auto_53165 ?auto_53166 ?auto_53167 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53172 - BLOCK
      ?auto_53173 - BLOCK
      ?auto_53174 - BLOCK
    )
    :vars
    (
      ?auto_53177 - BLOCK
      ?auto_53178 - BLOCK
      ?auto_53175 - BLOCK
      ?auto_53176 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53172 ?auto_53173 ) ) ( not ( = ?auto_53172 ?auto_53174 ) ) ( not ( = ?auto_53173 ?auto_53174 ) ) ( not ( = ?auto_53172 ?auto_53177 ) ) ( not ( = ?auto_53173 ?auto_53177 ) ) ( not ( = ?auto_53174 ?auto_53177 ) ) ( ON-TABLE ?auto_53178 ) ( ON ?auto_53175 ?auto_53178 ) ( ON ?auto_53177 ?auto_53175 ) ( not ( = ?auto_53178 ?auto_53175 ) ) ( not ( = ?auto_53178 ?auto_53177 ) ) ( not ( = ?auto_53178 ?auto_53174 ) ) ( not ( = ?auto_53178 ?auto_53173 ) ) ( not ( = ?auto_53175 ?auto_53177 ) ) ( not ( = ?auto_53175 ?auto_53174 ) ) ( not ( = ?auto_53175 ?auto_53173 ) ) ( not ( = ?auto_53172 ?auto_53178 ) ) ( not ( = ?auto_53172 ?auto_53175 ) ) ( ON ?auto_53172 ?auto_53176 ) ( not ( = ?auto_53172 ?auto_53176 ) ) ( not ( = ?auto_53173 ?auto_53176 ) ) ( not ( = ?auto_53174 ?auto_53176 ) ) ( not ( = ?auto_53177 ?auto_53176 ) ) ( not ( = ?auto_53178 ?auto_53176 ) ) ( not ( = ?auto_53175 ?auto_53176 ) ) ( ON ?auto_53173 ?auto_53172 ) ( ON-TABLE ?auto_53176 ) ( CLEAR ?auto_53177 ) ( ON ?auto_53174 ?auto_53173 ) ( CLEAR ?auto_53174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53176 ?auto_53172 ?auto_53173 )
      ( MAKE-3PILE ?auto_53172 ?auto_53173 ?auto_53174 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53179 - BLOCK
      ?auto_53180 - BLOCK
      ?auto_53181 - BLOCK
    )
    :vars
    (
      ?auto_53184 - BLOCK
      ?auto_53182 - BLOCK
      ?auto_53185 - BLOCK
      ?auto_53183 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53179 ?auto_53180 ) ) ( not ( = ?auto_53179 ?auto_53181 ) ) ( not ( = ?auto_53180 ?auto_53181 ) ) ( not ( = ?auto_53179 ?auto_53184 ) ) ( not ( = ?auto_53180 ?auto_53184 ) ) ( not ( = ?auto_53181 ?auto_53184 ) ) ( ON-TABLE ?auto_53182 ) ( ON ?auto_53185 ?auto_53182 ) ( not ( = ?auto_53182 ?auto_53185 ) ) ( not ( = ?auto_53182 ?auto_53184 ) ) ( not ( = ?auto_53182 ?auto_53181 ) ) ( not ( = ?auto_53182 ?auto_53180 ) ) ( not ( = ?auto_53185 ?auto_53184 ) ) ( not ( = ?auto_53185 ?auto_53181 ) ) ( not ( = ?auto_53185 ?auto_53180 ) ) ( not ( = ?auto_53179 ?auto_53182 ) ) ( not ( = ?auto_53179 ?auto_53185 ) ) ( ON ?auto_53179 ?auto_53183 ) ( not ( = ?auto_53179 ?auto_53183 ) ) ( not ( = ?auto_53180 ?auto_53183 ) ) ( not ( = ?auto_53181 ?auto_53183 ) ) ( not ( = ?auto_53184 ?auto_53183 ) ) ( not ( = ?auto_53182 ?auto_53183 ) ) ( not ( = ?auto_53185 ?auto_53183 ) ) ( ON ?auto_53180 ?auto_53179 ) ( ON-TABLE ?auto_53183 ) ( ON ?auto_53181 ?auto_53180 ) ( CLEAR ?auto_53181 ) ( HOLDING ?auto_53184 ) ( CLEAR ?auto_53185 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53182 ?auto_53185 ?auto_53184 )
      ( MAKE-3PILE ?auto_53179 ?auto_53180 ?auto_53181 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53186 - BLOCK
      ?auto_53187 - BLOCK
      ?auto_53188 - BLOCK
    )
    :vars
    (
      ?auto_53191 - BLOCK
      ?auto_53190 - BLOCK
      ?auto_53189 - BLOCK
      ?auto_53192 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53186 ?auto_53187 ) ) ( not ( = ?auto_53186 ?auto_53188 ) ) ( not ( = ?auto_53187 ?auto_53188 ) ) ( not ( = ?auto_53186 ?auto_53191 ) ) ( not ( = ?auto_53187 ?auto_53191 ) ) ( not ( = ?auto_53188 ?auto_53191 ) ) ( ON-TABLE ?auto_53190 ) ( ON ?auto_53189 ?auto_53190 ) ( not ( = ?auto_53190 ?auto_53189 ) ) ( not ( = ?auto_53190 ?auto_53191 ) ) ( not ( = ?auto_53190 ?auto_53188 ) ) ( not ( = ?auto_53190 ?auto_53187 ) ) ( not ( = ?auto_53189 ?auto_53191 ) ) ( not ( = ?auto_53189 ?auto_53188 ) ) ( not ( = ?auto_53189 ?auto_53187 ) ) ( not ( = ?auto_53186 ?auto_53190 ) ) ( not ( = ?auto_53186 ?auto_53189 ) ) ( ON ?auto_53186 ?auto_53192 ) ( not ( = ?auto_53186 ?auto_53192 ) ) ( not ( = ?auto_53187 ?auto_53192 ) ) ( not ( = ?auto_53188 ?auto_53192 ) ) ( not ( = ?auto_53191 ?auto_53192 ) ) ( not ( = ?auto_53190 ?auto_53192 ) ) ( not ( = ?auto_53189 ?auto_53192 ) ) ( ON ?auto_53187 ?auto_53186 ) ( ON-TABLE ?auto_53192 ) ( ON ?auto_53188 ?auto_53187 ) ( CLEAR ?auto_53189 ) ( ON ?auto_53191 ?auto_53188 ) ( CLEAR ?auto_53191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53192 ?auto_53186 ?auto_53187 ?auto_53188 )
      ( MAKE-3PILE ?auto_53186 ?auto_53187 ?auto_53188 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53193 - BLOCK
      ?auto_53194 - BLOCK
      ?auto_53195 - BLOCK
    )
    :vars
    (
      ?auto_53198 - BLOCK
      ?auto_53196 - BLOCK
      ?auto_53199 - BLOCK
      ?auto_53197 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53193 ?auto_53194 ) ) ( not ( = ?auto_53193 ?auto_53195 ) ) ( not ( = ?auto_53194 ?auto_53195 ) ) ( not ( = ?auto_53193 ?auto_53198 ) ) ( not ( = ?auto_53194 ?auto_53198 ) ) ( not ( = ?auto_53195 ?auto_53198 ) ) ( ON-TABLE ?auto_53196 ) ( not ( = ?auto_53196 ?auto_53199 ) ) ( not ( = ?auto_53196 ?auto_53198 ) ) ( not ( = ?auto_53196 ?auto_53195 ) ) ( not ( = ?auto_53196 ?auto_53194 ) ) ( not ( = ?auto_53199 ?auto_53198 ) ) ( not ( = ?auto_53199 ?auto_53195 ) ) ( not ( = ?auto_53199 ?auto_53194 ) ) ( not ( = ?auto_53193 ?auto_53196 ) ) ( not ( = ?auto_53193 ?auto_53199 ) ) ( ON ?auto_53193 ?auto_53197 ) ( not ( = ?auto_53193 ?auto_53197 ) ) ( not ( = ?auto_53194 ?auto_53197 ) ) ( not ( = ?auto_53195 ?auto_53197 ) ) ( not ( = ?auto_53198 ?auto_53197 ) ) ( not ( = ?auto_53196 ?auto_53197 ) ) ( not ( = ?auto_53199 ?auto_53197 ) ) ( ON ?auto_53194 ?auto_53193 ) ( ON-TABLE ?auto_53197 ) ( ON ?auto_53195 ?auto_53194 ) ( ON ?auto_53198 ?auto_53195 ) ( CLEAR ?auto_53198 ) ( HOLDING ?auto_53199 ) ( CLEAR ?auto_53196 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53196 ?auto_53199 )
      ( MAKE-3PILE ?auto_53193 ?auto_53194 ?auto_53195 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53200 - BLOCK
      ?auto_53201 - BLOCK
      ?auto_53202 - BLOCK
    )
    :vars
    (
      ?auto_53205 - BLOCK
      ?auto_53206 - BLOCK
      ?auto_53204 - BLOCK
      ?auto_53203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53200 ?auto_53201 ) ) ( not ( = ?auto_53200 ?auto_53202 ) ) ( not ( = ?auto_53201 ?auto_53202 ) ) ( not ( = ?auto_53200 ?auto_53205 ) ) ( not ( = ?auto_53201 ?auto_53205 ) ) ( not ( = ?auto_53202 ?auto_53205 ) ) ( ON-TABLE ?auto_53206 ) ( not ( = ?auto_53206 ?auto_53204 ) ) ( not ( = ?auto_53206 ?auto_53205 ) ) ( not ( = ?auto_53206 ?auto_53202 ) ) ( not ( = ?auto_53206 ?auto_53201 ) ) ( not ( = ?auto_53204 ?auto_53205 ) ) ( not ( = ?auto_53204 ?auto_53202 ) ) ( not ( = ?auto_53204 ?auto_53201 ) ) ( not ( = ?auto_53200 ?auto_53206 ) ) ( not ( = ?auto_53200 ?auto_53204 ) ) ( ON ?auto_53200 ?auto_53203 ) ( not ( = ?auto_53200 ?auto_53203 ) ) ( not ( = ?auto_53201 ?auto_53203 ) ) ( not ( = ?auto_53202 ?auto_53203 ) ) ( not ( = ?auto_53205 ?auto_53203 ) ) ( not ( = ?auto_53206 ?auto_53203 ) ) ( not ( = ?auto_53204 ?auto_53203 ) ) ( ON ?auto_53201 ?auto_53200 ) ( ON-TABLE ?auto_53203 ) ( ON ?auto_53202 ?auto_53201 ) ( ON ?auto_53205 ?auto_53202 ) ( CLEAR ?auto_53206 ) ( ON ?auto_53204 ?auto_53205 ) ( CLEAR ?auto_53204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53203 ?auto_53200 ?auto_53201 ?auto_53202 ?auto_53205 )
      ( MAKE-3PILE ?auto_53200 ?auto_53201 ?auto_53202 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53207 - BLOCK
      ?auto_53208 - BLOCK
      ?auto_53209 - BLOCK
    )
    :vars
    (
      ?auto_53210 - BLOCK
      ?auto_53213 - BLOCK
      ?auto_53212 - BLOCK
      ?auto_53211 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53207 ?auto_53208 ) ) ( not ( = ?auto_53207 ?auto_53209 ) ) ( not ( = ?auto_53208 ?auto_53209 ) ) ( not ( = ?auto_53207 ?auto_53210 ) ) ( not ( = ?auto_53208 ?auto_53210 ) ) ( not ( = ?auto_53209 ?auto_53210 ) ) ( not ( = ?auto_53213 ?auto_53212 ) ) ( not ( = ?auto_53213 ?auto_53210 ) ) ( not ( = ?auto_53213 ?auto_53209 ) ) ( not ( = ?auto_53213 ?auto_53208 ) ) ( not ( = ?auto_53212 ?auto_53210 ) ) ( not ( = ?auto_53212 ?auto_53209 ) ) ( not ( = ?auto_53212 ?auto_53208 ) ) ( not ( = ?auto_53207 ?auto_53213 ) ) ( not ( = ?auto_53207 ?auto_53212 ) ) ( ON ?auto_53207 ?auto_53211 ) ( not ( = ?auto_53207 ?auto_53211 ) ) ( not ( = ?auto_53208 ?auto_53211 ) ) ( not ( = ?auto_53209 ?auto_53211 ) ) ( not ( = ?auto_53210 ?auto_53211 ) ) ( not ( = ?auto_53213 ?auto_53211 ) ) ( not ( = ?auto_53212 ?auto_53211 ) ) ( ON ?auto_53208 ?auto_53207 ) ( ON-TABLE ?auto_53211 ) ( ON ?auto_53209 ?auto_53208 ) ( ON ?auto_53210 ?auto_53209 ) ( ON ?auto_53212 ?auto_53210 ) ( CLEAR ?auto_53212 ) ( HOLDING ?auto_53213 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53213 )
      ( MAKE-3PILE ?auto_53207 ?auto_53208 ?auto_53209 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53214 - BLOCK
      ?auto_53215 - BLOCK
      ?auto_53216 - BLOCK
    )
    :vars
    (
      ?auto_53219 - BLOCK
      ?auto_53217 - BLOCK
      ?auto_53218 - BLOCK
      ?auto_53220 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53214 ?auto_53215 ) ) ( not ( = ?auto_53214 ?auto_53216 ) ) ( not ( = ?auto_53215 ?auto_53216 ) ) ( not ( = ?auto_53214 ?auto_53219 ) ) ( not ( = ?auto_53215 ?auto_53219 ) ) ( not ( = ?auto_53216 ?auto_53219 ) ) ( not ( = ?auto_53217 ?auto_53218 ) ) ( not ( = ?auto_53217 ?auto_53219 ) ) ( not ( = ?auto_53217 ?auto_53216 ) ) ( not ( = ?auto_53217 ?auto_53215 ) ) ( not ( = ?auto_53218 ?auto_53219 ) ) ( not ( = ?auto_53218 ?auto_53216 ) ) ( not ( = ?auto_53218 ?auto_53215 ) ) ( not ( = ?auto_53214 ?auto_53217 ) ) ( not ( = ?auto_53214 ?auto_53218 ) ) ( ON ?auto_53214 ?auto_53220 ) ( not ( = ?auto_53214 ?auto_53220 ) ) ( not ( = ?auto_53215 ?auto_53220 ) ) ( not ( = ?auto_53216 ?auto_53220 ) ) ( not ( = ?auto_53219 ?auto_53220 ) ) ( not ( = ?auto_53217 ?auto_53220 ) ) ( not ( = ?auto_53218 ?auto_53220 ) ) ( ON ?auto_53215 ?auto_53214 ) ( ON-TABLE ?auto_53220 ) ( ON ?auto_53216 ?auto_53215 ) ( ON ?auto_53219 ?auto_53216 ) ( ON ?auto_53218 ?auto_53219 ) ( ON ?auto_53217 ?auto_53218 ) ( CLEAR ?auto_53217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53220 ?auto_53214 ?auto_53215 ?auto_53216 ?auto_53219 ?auto_53218 )
      ( MAKE-3PILE ?auto_53214 ?auto_53215 ?auto_53216 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53223 - BLOCK
      ?auto_53224 - BLOCK
    )
    :vars
    (
      ?auto_53225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53225 ?auto_53224 ) ( CLEAR ?auto_53225 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53223 ) ( ON ?auto_53224 ?auto_53223 ) ( not ( = ?auto_53223 ?auto_53224 ) ) ( not ( = ?auto_53223 ?auto_53225 ) ) ( not ( = ?auto_53224 ?auto_53225 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53225 ?auto_53224 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53226 - BLOCK
      ?auto_53227 - BLOCK
    )
    :vars
    (
      ?auto_53228 - BLOCK
      ?auto_53229 - BLOCK
      ?auto_53230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53228 ?auto_53227 ) ( CLEAR ?auto_53228 ) ( ON-TABLE ?auto_53226 ) ( ON ?auto_53227 ?auto_53226 ) ( not ( = ?auto_53226 ?auto_53227 ) ) ( not ( = ?auto_53226 ?auto_53228 ) ) ( not ( = ?auto_53227 ?auto_53228 ) ) ( HOLDING ?auto_53229 ) ( CLEAR ?auto_53230 ) ( not ( = ?auto_53226 ?auto_53229 ) ) ( not ( = ?auto_53226 ?auto_53230 ) ) ( not ( = ?auto_53227 ?auto_53229 ) ) ( not ( = ?auto_53227 ?auto_53230 ) ) ( not ( = ?auto_53228 ?auto_53229 ) ) ( not ( = ?auto_53228 ?auto_53230 ) ) ( not ( = ?auto_53229 ?auto_53230 ) ) )
    :subtasks
    ( ( !STACK ?auto_53229 ?auto_53230 )
      ( MAKE-2PILE ?auto_53226 ?auto_53227 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53231 - BLOCK
      ?auto_53232 - BLOCK
    )
    :vars
    (
      ?auto_53235 - BLOCK
      ?auto_53233 - BLOCK
      ?auto_53234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53235 ?auto_53232 ) ( ON-TABLE ?auto_53231 ) ( ON ?auto_53232 ?auto_53231 ) ( not ( = ?auto_53231 ?auto_53232 ) ) ( not ( = ?auto_53231 ?auto_53235 ) ) ( not ( = ?auto_53232 ?auto_53235 ) ) ( CLEAR ?auto_53233 ) ( not ( = ?auto_53231 ?auto_53234 ) ) ( not ( = ?auto_53231 ?auto_53233 ) ) ( not ( = ?auto_53232 ?auto_53234 ) ) ( not ( = ?auto_53232 ?auto_53233 ) ) ( not ( = ?auto_53235 ?auto_53234 ) ) ( not ( = ?auto_53235 ?auto_53233 ) ) ( not ( = ?auto_53234 ?auto_53233 ) ) ( ON ?auto_53234 ?auto_53235 ) ( CLEAR ?auto_53234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53231 ?auto_53232 ?auto_53235 )
      ( MAKE-2PILE ?auto_53231 ?auto_53232 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53236 - BLOCK
      ?auto_53237 - BLOCK
    )
    :vars
    (
      ?auto_53240 - BLOCK
      ?auto_53239 - BLOCK
      ?auto_53238 - BLOCK
      ?auto_53241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53240 ?auto_53237 ) ( ON-TABLE ?auto_53236 ) ( ON ?auto_53237 ?auto_53236 ) ( not ( = ?auto_53236 ?auto_53237 ) ) ( not ( = ?auto_53236 ?auto_53240 ) ) ( not ( = ?auto_53237 ?auto_53240 ) ) ( not ( = ?auto_53236 ?auto_53239 ) ) ( not ( = ?auto_53236 ?auto_53238 ) ) ( not ( = ?auto_53237 ?auto_53239 ) ) ( not ( = ?auto_53237 ?auto_53238 ) ) ( not ( = ?auto_53240 ?auto_53239 ) ) ( not ( = ?auto_53240 ?auto_53238 ) ) ( not ( = ?auto_53239 ?auto_53238 ) ) ( ON ?auto_53239 ?auto_53240 ) ( CLEAR ?auto_53239 ) ( HOLDING ?auto_53238 ) ( CLEAR ?auto_53241 ) ( ON-TABLE ?auto_53241 ) ( not ( = ?auto_53241 ?auto_53238 ) ) ( not ( = ?auto_53236 ?auto_53241 ) ) ( not ( = ?auto_53237 ?auto_53241 ) ) ( not ( = ?auto_53240 ?auto_53241 ) ) ( not ( = ?auto_53239 ?auto_53241 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53241 ?auto_53238 )
      ( MAKE-2PILE ?auto_53236 ?auto_53237 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53242 - BLOCK
      ?auto_53243 - BLOCK
    )
    :vars
    (
      ?auto_53246 - BLOCK
      ?auto_53247 - BLOCK
      ?auto_53245 - BLOCK
      ?auto_53244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53246 ?auto_53243 ) ( ON-TABLE ?auto_53242 ) ( ON ?auto_53243 ?auto_53242 ) ( not ( = ?auto_53242 ?auto_53243 ) ) ( not ( = ?auto_53242 ?auto_53246 ) ) ( not ( = ?auto_53243 ?auto_53246 ) ) ( not ( = ?auto_53242 ?auto_53247 ) ) ( not ( = ?auto_53242 ?auto_53245 ) ) ( not ( = ?auto_53243 ?auto_53247 ) ) ( not ( = ?auto_53243 ?auto_53245 ) ) ( not ( = ?auto_53246 ?auto_53247 ) ) ( not ( = ?auto_53246 ?auto_53245 ) ) ( not ( = ?auto_53247 ?auto_53245 ) ) ( ON ?auto_53247 ?auto_53246 ) ( CLEAR ?auto_53244 ) ( ON-TABLE ?auto_53244 ) ( not ( = ?auto_53244 ?auto_53245 ) ) ( not ( = ?auto_53242 ?auto_53244 ) ) ( not ( = ?auto_53243 ?auto_53244 ) ) ( not ( = ?auto_53246 ?auto_53244 ) ) ( not ( = ?auto_53247 ?auto_53244 ) ) ( ON ?auto_53245 ?auto_53247 ) ( CLEAR ?auto_53245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53242 ?auto_53243 ?auto_53246 ?auto_53247 )
      ( MAKE-2PILE ?auto_53242 ?auto_53243 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53248 - BLOCK
      ?auto_53249 - BLOCK
    )
    :vars
    (
      ?auto_53250 - BLOCK
      ?auto_53252 - BLOCK
      ?auto_53251 - BLOCK
      ?auto_53253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53250 ?auto_53249 ) ( ON-TABLE ?auto_53248 ) ( ON ?auto_53249 ?auto_53248 ) ( not ( = ?auto_53248 ?auto_53249 ) ) ( not ( = ?auto_53248 ?auto_53250 ) ) ( not ( = ?auto_53249 ?auto_53250 ) ) ( not ( = ?auto_53248 ?auto_53252 ) ) ( not ( = ?auto_53248 ?auto_53251 ) ) ( not ( = ?auto_53249 ?auto_53252 ) ) ( not ( = ?auto_53249 ?auto_53251 ) ) ( not ( = ?auto_53250 ?auto_53252 ) ) ( not ( = ?auto_53250 ?auto_53251 ) ) ( not ( = ?auto_53252 ?auto_53251 ) ) ( ON ?auto_53252 ?auto_53250 ) ( not ( = ?auto_53253 ?auto_53251 ) ) ( not ( = ?auto_53248 ?auto_53253 ) ) ( not ( = ?auto_53249 ?auto_53253 ) ) ( not ( = ?auto_53250 ?auto_53253 ) ) ( not ( = ?auto_53252 ?auto_53253 ) ) ( ON ?auto_53251 ?auto_53252 ) ( CLEAR ?auto_53251 ) ( HOLDING ?auto_53253 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53253 )
      ( MAKE-2PILE ?auto_53248 ?auto_53249 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53254 - BLOCK
      ?auto_53255 - BLOCK
    )
    :vars
    (
      ?auto_53258 - BLOCK
      ?auto_53259 - BLOCK
      ?auto_53257 - BLOCK
      ?auto_53256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53258 ?auto_53255 ) ( ON-TABLE ?auto_53254 ) ( ON ?auto_53255 ?auto_53254 ) ( not ( = ?auto_53254 ?auto_53255 ) ) ( not ( = ?auto_53254 ?auto_53258 ) ) ( not ( = ?auto_53255 ?auto_53258 ) ) ( not ( = ?auto_53254 ?auto_53259 ) ) ( not ( = ?auto_53254 ?auto_53257 ) ) ( not ( = ?auto_53255 ?auto_53259 ) ) ( not ( = ?auto_53255 ?auto_53257 ) ) ( not ( = ?auto_53258 ?auto_53259 ) ) ( not ( = ?auto_53258 ?auto_53257 ) ) ( not ( = ?auto_53259 ?auto_53257 ) ) ( ON ?auto_53259 ?auto_53258 ) ( not ( = ?auto_53256 ?auto_53257 ) ) ( not ( = ?auto_53254 ?auto_53256 ) ) ( not ( = ?auto_53255 ?auto_53256 ) ) ( not ( = ?auto_53258 ?auto_53256 ) ) ( not ( = ?auto_53259 ?auto_53256 ) ) ( ON ?auto_53257 ?auto_53259 ) ( ON ?auto_53256 ?auto_53257 ) ( CLEAR ?auto_53256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53254 ?auto_53255 ?auto_53258 ?auto_53259 ?auto_53257 )
      ( MAKE-2PILE ?auto_53254 ?auto_53255 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53260 - BLOCK
      ?auto_53261 - BLOCK
    )
    :vars
    (
      ?auto_53264 - BLOCK
      ?auto_53265 - BLOCK
      ?auto_53262 - BLOCK
      ?auto_53263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53264 ?auto_53261 ) ( ON-TABLE ?auto_53260 ) ( ON ?auto_53261 ?auto_53260 ) ( not ( = ?auto_53260 ?auto_53261 ) ) ( not ( = ?auto_53260 ?auto_53264 ) ) ( not ( = ?auto_53261 ?auto_53264 ) ) ( not ( = ?auto_53260 ?auto_53265 ) ) ( not ( = ?auto_53260 ?auto_53262 ) ) ( not ( = ?auto_53261 ?auto_53265 ) ) ( not ( = ?auto_53261 ?auto_53262 ) ) ( not ( = ?auto_53264 ?auto_53265 ) ) ( not ( = ?auto_53264 ?auto_53262 ) ) ( not ( = ?auto_53265 ?auto_53262 ) ) ( ON ?auto_53265 ?auto_53264 ) ( not ( = ?auto_53263 ?auto_53262 ) ) ( not ( = ?auto_53260 ?auto_53263 ) ) ( not ( = ?auto_53261 ?auto_53263 ) ) ( not ( = ?auto_53264 ?auto_53263 ) ) ( not ( = ?auto_53265 ?auto_53263 ) ) ( ON ?auto_53262 ?auto_53265 ) ( HOLDING ?auto_53263 ) ( CLEAR ?auto_53262 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53260 ?auto_53261 ?auto_53264 ?auto_53265 ?auto_53262 ?auto_53263 )
      ( MAKE-2PILE ?auto_53260 ?auto_53261 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53266 - BLOCK
      ?auto_53267 - BLOCK
    )
    :vars
    (
      ?auto_53268 - BLOCK
      ?auto_53269 - BLOCK
      ?auto_53270 - BLOCK
      ?auto_53271 - BLOCK
      ?auto_53272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53268 ?auto_53267 ) ( ON-TABLE ?auto_53266 ) ( ON ?auto_53267 ?auto_53266 ) ( not ( = ?auto_53266 ?auto_53267 ) ) ( not ( = ?auto_53266 ?auto_53268 ) ) ( not ( = ?auto_53267 ?auto_53268 ) ) ( not ( = ?auto_53266 ?auto_53269 ) ) ( not ( = ?auto_53266 ?auto_53270 ) ) ( not ( = ?auto_53267 ?auto_53269 ) ) ( not ( = ?auto_53267 ?auto_53270 ) ) ( not ( = ?auto_53268 ?auto_53269 ) ) ( not ( = ?auto_53268 ?auto_53270 ) ) ( not ( = ?auto_53269 ?auto_53270 ) ) ( ON ?auto_53269 ?auto_53268 ) ( not ( = ?auto_53271 ?auto_53270 ) ) ( not ( = ?auto_53266 ?auto_53271 ) ) ( not ( = ?auto_53267 ?auto_53271 ) ) ( not ( = ?auto_53268 ?auto_53271 ) ) ( not ( = ?auto_53269 ?auto_53271 ) ) ( ON ?auto_53270 ?auto_53269 ) ( CLEAR ?auto_53270 ) ( ON ?auto_53271 ?auto_53272 ) ( CLEAR ?auto_53271 ) ( HAND-EMPTY ) ( not ( = ?auto_53266 ?auto_53272 ) ) ( not ( = ?auto_53267 ?auto_53272 ) ) ( not ( = ?auto_53268 ?auto_53272 ) ) ( not ( = ?auto_53269 ?auto_53272 ) ) ( not ( = ?auto_53270 ?auto_53272 ) ) ( not ( = ?auto_53271 ?auto_53272 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53271 ?auto_53272 )
      ( MAKE-2PILE ?auto_53266 ?auto_53267 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53273 - BLOCK
      ?auto_53274 - BLOCK
    )
    :vars
    (
      ?auto_53279 - BLOCK
      ?auto_53276 - BLOCK
      ?auto_53278 - BLOCK
      ?auto_53277 - BLOCK
      ?auto_53275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53279 ?auto_53274 ) ( ON-TABLE ?auto_53273 ) ( ON ?auto_53274 ?auto_53273 ) ( not ( = ?auto_53273 ?auto_53274 ) ) ( not ( = ?auto_53273 ?auto_53279 ) ) ( not ( = ?auto_53274 ?auto_53279 ) ) ( not ( = ?auto_53273 ?auto_53276 ) ) ( not ( = ?auto_53273 ?auto_53278 ) ) ( not ( = ?auto_53274 ?auto_53276 ) ) ( not ( = ?auto_53274 ?auto_53278 ) ) ( not ( = ?auto_53279 ?auto_53276 ) ) ( not ( = ?auto_53279 ?auto_53278 ) ) ( not ( = ?auto_53276 ?auto_53278 ) ) ( ON ?auto_53276 ?auto_53279 ) ( not ( = ?auto_53277 ?auto_53278 ) ) ( not ( = ?auto_53273 ?auto_53277 ) ) ( not ( = ?auto_53274 ?auto_53277 ) ) ( not ( = ?auto_53279 ?auto_53277 ) ) ( not ( = ?auto_53276 ?auto_53277 ) ) ( ON ?auto_53277 ?auto_53275 ) ( CLEAR ?auto_53277 ) ( not ( = ?auto_53273 ?auto_53275 ) ) ( not ( = ?auto_53274 ?auto_53275 ) ) ( not ( = ?auto_53279 ?auto_53275 ) ) ( not ( = ?auto_53276 ?auto_53275 ) ) ( not ( = ?auto_53278 ?auto_53275 ) ) ( not ( = ?auto_53277 ?auto_53275 ) ) ( HOLDING ?auto_53278 ) ( CLEAR ?auto_53276 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53273 ?auto_53274 ?auto_53279 ?auto_53276 ?auto_53278 )
      ( MAKE-2PILE ?auto_53273 ?auto_53274 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53280 - BLOCK
      ?auto_53281 - BLOCK
    )
    :vars
    (
      ?auto_53284 - BLOCK
      ?auto_53283 - BLOCK
      ?auto_53286 - BLOCK
      ?auto_53282 - BLOCK
      ?auto_53285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53284 ?auto_53281 ) ( ON-TABLE ?auto_53280 ) ( ON ?auto_53281 ?auto_53280 ) ( not ( = ?auto_53280 ?auto_53281 ) ) ( not ( = ?auto_53280 ?auto_53284 ) ) ( not ( = ?auto_53281 ?auto_53284 ) ) ( not ( = ?auto_53280 ?auto_53283 ) ) ( not ( = ?auto_53280 ?auto_53286 ) ) ( not ( = ?auto_53281 ?auto_53283 ) ) ( not ( = ?auto_53281 ?auto_53286 ) ) ( not ( = ?auto_53284 ?auto_53283 ) ) ( not ( = ?auto_53284 ?auto_53286 ) ) ( not ( = ?auto_53283 ?auto_53286 ) ) ( ON ?auto_53283 ?auto_53284 ) ( not ( = ?auto_53282 ?auto_53286 ) ) ( not ( = ?auto_53280 ?auto_53282 ) ) ( not ( = ?auto_53281 ?auto_53282 ) ) ( not ( = ?auto_53284 ?auto_53282 ) ) ( not ( = ?auto_53283 ?auto_53282 ) ) ( ON ?auto_53282 ?auto_53285 ) ( not ( = ?auto_53280 ?auto_53285 ) ) ( not ( = ?auto_53281 ?auto_53285 ) ) ( not ( = ?auto_53284 ?auto_53285 ) ) ( not ( = ?auto_53283 ?auto_53285 ) ) ( not ( = ?auto_53286 ?auto_53285 ) ) ( not ( = ?auto_53282 ?auto_53285 ) ) ( CLEAR ?auto_53283 ) ( ON ?auto_53286 ?auto_53282 ) ( CLEAR ?auto_53286 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53285 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53285 ?auto_53282 )
      ( MAKE-2PILE ?auto_53280 ?auto_53281 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53287 - BLOCK
      ?auto_53288 - BLOCK
    )
    :vars
    (
      ?auto_53289 - BLOCK
      ?auto_53293 - BLOCK
      ?auto_53290 - BLOCK
      ?auto_53292 - BLOCK
      ?auto_53291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53289 ?auto_53288 ) ( ON-TABLE ?auto_53287 ) ( ON ?auto_53288 ?auto_53287 ) ( not ( = ?auto_53287 ?auto_53288 ) ) ( not ( = ?auto_53287 ?auto_53289 ) ) ( not ( = ?auto_53288 ?auto_53289 ) ) ( not ( = ?auto_53287 ?auto_53293 ) ) ( not ( = ?auto_53287 ?auto_53290 ) ) ( not ( = ?auto_53288 ?auto_53293 ) ) ( not ( = ?auto_53288 ?auto_53290 ) ) ( not ( = ?auto_53289 ?auto_53293 ) ) ( not ( = ?auto_53289 ?auto_53290 ) ) ( not ( = ?auto_53293 ?auto_53290 ) ) ( not ( = ?auto_53292 ?auto_53290 ) ) ( not ( = ?auto_53287 ?auto_53292 ) ) ( not ( = ?auto_53288 ?auto_53292 ) ) ( not ( = ?auto_53289 ?auto_53292 ) ) ( not ( = ?auto_53293 ?auto_53292 ) ) ( ON ?auto_53292 ?auto_53291 ) ( not ( = ?auto_53287 ?auto_53291 ) ) ( not ( = ?auto_53288 ?auto_53291 ) ) ( not ( = ?auto_53289 ?auto_53291 ) ) ( not ( = ?auto_53293 ?auto_53291 ) ) ( not ( = ?auto_53290 ?auto_53291 ) ) ( not ( = ?auto_53292 ?auto_53291 ) ) ( ON ?auto_53290 ?auto_53292 ) ( CLEAR ?auto_53290 ) ( ON-TABLE ?auto_53291 ) ( HOLDING ?auto_53293 ) ( CLEAR ?auto_53289 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53287 ?auto_53288 ?auto_53289 ?auto_53293 )
      ( MAKE-2PILE ?auto_53287 ?auto_53288 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53294 - BLOCK
      ?auto_53295 - BLOCK
    )
    :vars
    (
      ?auto_53298 - BLOCK
      ?auto_53296 - BLOCK
      ?auto_53299 - BLOCK
      ?auto_53297 - BLOCK
      ?auto_53300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53298 ?auto_53295 ) ( ON-TABLE ?auto_53294 ) ( ON ?auto_53295 ?auto_53294 ) ( not ( = ?auto_53294 ?auto_53295 ) ) ( not ( = ?auto_53294 ?auto_53298 ) ) ( not ( = ?auto_53295 ?auto_53298 ) ) ( not ( = ?auto_53294 ?auto_53296 ) ) ( not ( = ?auto_53294 ?auto_53299 ) ) ( not ( = ?auto_53295 ?auto_53296 ) ) ( not ( = ?auto_53295 ?auto_53299 ) ) ( not ( = ?auto_53298 ?auto_53296 ) ) ( not ( = ?auto_53298 ?auto_53299 ) ) ( not ( = ?auto_53296 ?auto_53299 ) ) ( not ( = ?auto_53297 ?auto_53299 ) ) ( not ( = ?auto_53294 ?auto_53297 ) ) ( not ( = ?auto_53295 ?auto_53297 ) ) ( not ( = ?auto_53298 ?auto_53297 ) ) ( not ( = ?auto_53296 ?auto_53297 ) ) ( ON ?auto_53297 ?auto_53300 ) ( not ( = ?auto_53294 ?auto_53300 ) ) ( not ( = ?auto_53295 ?auto_53300 ) ) ( not ( = ?auto_53298 ?auto_53300 ) ) ( not ( = ?auto_53296 ?auto_53300 ) ) ( not ( = ?auto_53299 ?auto_53300 ) ) ( not ( = ?auto_53297 ?auto_53300 ) ) ( ON ?auto_53299 ?auto_53297 ) ( ON-TABLE ?auto_53300 ) ( CLEAR ?auto_53298 ) ( ON ?auto_53296 ?auto_53299 ) ( CLEAR ?auto_53296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53300 ?auto_53297 ?auto_53299 )
      ( MAKE-2PILE ?auto_53294 ?auto_53295 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53315 - BLOCK
      ?auto_53316 - BLOCK
    )
    :vars
    (
      ?auto_53321 - BLOCK
      ?auto_53317 - BLOCK
      ?auto_53320 - BLOCK
      ?auto_53318 - BLOCK
      ?auto_53319 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53315 ) ( not ( = ?auto_53315 ?auto_53316 ) ) ( not ( = ?auto_53315 ?auto_53321 ) ) ( not ( = ?auto_53316 ?auto_53321 ) ) ( not ( = ?auto_53315 ?auto_53317 ) ) ( not ( = ?auto_53315 ?auto_53320 ) ) ( not ( = ?auto_53316 ?auto_53317 ) ) ( not ( = ?auto_53316 ?auto_53320 ) ) ( not ( = ?auto_53321 ?auto_53317 ) ) ( not ( = ?auto_53321 ?auto_53320 ) ) ( not ( = ?auto_53317 ?auto_53320 ) ) ( not ( = ?auto_53318 ?auto_53320 ) ) ( not ( = ?auto_53315 ?auto_53318 ) ) ( not ( = ?auto_53316 ?auto_53318 ) ) ( not ( = ?auto_53321 ?auto_53318 ) ) ( not ( = ?auto_53317 ?auto_53318 ) ) ( ON ?auto_53318 ?auto_53319 ) ( not ( = ?auto_53315 ?auto_53319 ) ) ( not ( = ?auto_53316 ?auto_53319 ) ) ( not ( = ?auto_53321 ?auto_53319 ) ) ( not ( = ?auto_53317 ?auto_53319 ) ) ( not ( = ?auto_53320 ?auto_53319 ) ) ( not ( = ?auto_53318 ?auto_53319 ) ) ( ON ?auto_53320 ?auto_53318 ) ( ON-TABLE ?auto_53319 ) ( ON ?auto_53317 ?auto_53320 ) ( ON ?auto_53321 ?auto_53317 ) ( CLEAR ?auto_53321 ) ( HOLDING ?auto_53316 ) ( CLEAR ?auto_53315 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53315 ?auto_53316 ?auto_53321 )
      ( MAKE-2PILE ?auto_53315 ?auto_53316 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53322 - BLOCK
      ?auto_53323 - BLOCK
    )
    :vars
    (
      ?auto_53324 - BLOCK
      ?auto_53327 - BLOCK
      ?auto_53328 - BLOCK
      ?auto_53325 - BLOCK
      ?auto_53326 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53322 ) ( not ( = ?auto_53322 ?auto_53323 ) ) ( not ( = ?auto_53322 ?auto_53324 ) ) ( not ( = ?auto_53323 ?auto_53324 ) ) ( not ( = ?auto_53322 ?auto_53327 ) ) ( not ( = ?auto_53322 ?auto_53328 ) ) ( not ( = ?auto_53323 ?auto_53327 ) ) ( not ( = ?auto_53323 ?auto_53328 ) ) ( not ( = ?auto_53324 ?auto_53327 ) ) ( not ( = ?auto_53324 ?auto_53328 ) ) ( not ( = ?auto_53327 ?auto_53328 ) ) ( not ( = ?auto_53325 ?auto_53328 ) ) ( not ( = ?auto_53322 ?auto_53325 ) ) ( not ( = ?auto_53323 ?auto_53325 ) ) ( not ( = ?auto_53324 ?auto_53325 ) ) ( not ( = ?auto_53327 ?auto_53325 ) ) ( ON ?auto_53325 ?auto_53326 ) ( not ( = ?auto_53322 ?auto_53326 ) ) ( not ( = ?auto_53323 ?auto_53326 ) ) ( not ( = ?auto_53324 ?auto_53326 ) ) ( not ( = ?auto_53327 ?auto_53326 ) ) ( not ( = ?auto_53328 ?auto_53326 ) ) ( not ( = ?auto_53325 ?auto_53326 ) ) ( ON ?auto_53328 ?auto_53325 ) ( ON-TABLE ?auto_53326 ) ( ON ?auto_53327 ?auto_53328 ) ( ON ?auto_53324 ?auto_53327 ) ( CLEAR ?auto_53322 ) ( ON ?auto_53323 ?auto_53324 ) ( CLEAR ?auto_53323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53326 ?auto_53325 ?auto_53328 ?auto_53327 ?auto_53324 )
      ( MAKE-2PILE ?auto_53322 ?auto_53323 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53329 - BLOCK
      ?auto_53330 - BLOCK
    )
    :vars
    (
      ?auto_53335 - BLOCK
      ?auto_53334 - BLOCK
      ?auto_53333 - BLOCK
      ?auto_53332 - BLOCK
      ?auto_53331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53329 ?auto_53330 ) ) ( not ( = ?auto_53329 ?auto_53335 ) ) ( not ( = ?auto_53330 ?auto_53335 ) ) ( not ( = ?auto_53329 ?auto_53334 ) ) ( not ( = ?auto_53329 ?auto_53333 ) ) ( not ( = ?auto_53330 ?auto_53334 ) ) ( not ( = ?auto_53330 ?auto_53333 ) ) ( not ( = ?auto_53335 ?auto_53334 ) ) ( not ( = ?auto_53335 ?auto_53333 ) ) ( not ( = ?auto_53334 ?auto_53333 ) ) ( not ( = ?auto_53332 ?auto_53333 ) ) ( not ( = ?auto_53329 ?auto_53332 ) ) ( not ( = ?auto_53330 ?auto_53332 ) ) ( not ( = ?auto_53335 ?auto_53332 ) ) ( not ( = ?auto_53334 ?auto_53332 ) ) ( ON ?auto_53332 ?auto_53331 ) ( not ( = ?auto_53329 ?auto_53331 ) ) ( not ( = ?auto_53330 ?auto_53331 ) ) ( not ( = ?auto_53335 ?auto_53331 ) ) ( not ( = ?auto_53334 ?auto_53331 ) ) ( not ( = ?auto_53333 ?auto_53331 ) ) ( not ( = ?auto_53332 ?auto_53331 ) ) ( ON ?auto_53333 ?auto_53332 ) ( ON-TABLE ?auto_53331 ) ( ON ?auto_53334 ?auto_53333 ) ( ON ?auto_53335 ?auto_53334 ) ( ON ?auto_53330 ?auto_53335 ) ( CLEAR ?auto_53330 ) ( HOLDING ?auto_53329 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53329 )
      ( MAKE-2PILE ?auto_53329 ?auto_53330 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53336 - BLOCK
      ?auto_53337 - BLOCK
    )
    :vars
    (
      ?auto_53338 - BLOCK
      ?auto_53339 - BLOCK
      ?auto_53342 - BLOCK
      ?auto_53341 - BLOCK
      ?auto_53340 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53336 ?auto_53337 ) ) ( not ( = ?auto_53336 ?auto_53338 ) ) ( not ( = ?auto_53337 ?auto_53338 ) ) ( not ( = ?auto_53336 ?auto_53339 ) ) ( not ( = ?auto_53336 ?auto_53342 ) ) ( not ( = ?auto_53337 ?auto_53339 ) ) ( not ( = ?auto_53337 ?auto_53342 ) ) ( not ( = ?auto_53338 ?auto_53339 ) ) ( not ( = ?auto_53338 ?auto_53342 ) ) ( not ( = ?auto_53339 ?auto_53342 ) ) ( not ( = ?auto_53341 ?auto_53342 ) ) ( not ( = ?auto_53336 ?auto_53341 ) ) ( not ( = ?auto_53337 ?auto_53341 ) ) ( not ( = ?auto_53338 ?auto_53341 ) ) ( not ( = ?auto_53339 ?auto_53341 ) ) ( ON ?auto_53341 ?auto_53340 ) ( not ( = ?auto_53336 ?auto_53340 ) ) ( not ( = ?auto_53337 ?auto_53340 ) ) ( not ( = ?auto_53338 ?auto_53340 ) ) ( not ( = ?auto_53339 ?auto_53340 ) ) ( not ( = ?auto_53342 ?auto_53340 ) ) ( not ( = ?auto_53341 ?auto_53340 ) ) ( ON ?auto_53342 ?auto_53341 ) ( ON-TABLE ?auto_53340 ) ( ON ?auto_53339 ?auto_53342 ) ( ON ?auto_53338 ?auto_53339 ) ( ON ?auto_53337 ?auto_53338 ) ( ON ?auto_53336 ?auto_53337 ) ( CLEAR ?auto_53336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53340 ?auto_53341 ?auto_53342 ?auto_53339 ?auto_53338 ?auto_53337 )
      ( MAKE-2PILE ?auto_53336 ?auto_53337 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53347 - BLOCK
      ?auto_53348 - BLOCK
      ?auto_53349 - BLOCK
      ?auto_53350 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_53350 ) ( CLEAR ?auto_53349 ) ( ON-TABLE ?auto_53347 ) ( ON ?auto_53348 ?auto_53347 ) ( ON ?auto_53349 ?auto_53348 ) ( not ( = ?auto_53347 ?auto_53348 ) ) ( not ( = ?auto_53347 ?auto_53349 ) ) ( not ( = ?auto_53347 ?auto_53350 ) ) ( not ( = ?auto_53348 ?auto_53349 ) ) ( not ( = ?auto_53348 ?auto_53350 ) ) ( not ( = ?auto_53349 ?auto_53350 ) ) )
    :subtasks
    ( ( !STACK ?auto_53350 ?auto_53349 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53351 - BLOCK
      ?auto_53352 - BLOCK
      ?auto_53353 - BLOCK
      ?auto_53354 - BLOCK
    )
    :vars
    (
      ?auto_53355 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_53353 ) ( ON-TABLE ?auto_53351 ) ( ON ?auto_53352 ?auto_53351 ) ( ON ?auto_53353 ?auto_53352 ) ( not ( = ?auto_53351 ?auto_53352 ) ) ( not ( = ?auto_53351 ?auto_53353 ) ) ( not ( = ?auto_53351 ?auto_53354 ) ) ( not ( = ?auto_53352 ?auto_53353 ) ) ( not ( = ?auto_53352 ?auto_53354 ) ) ( not ( = ?auto_53353 ?auto_53354 ) ) ( ON ?auto_53354 ?auto_53355 ) ( CLEAR ?auto_53354 ) ( HAND-EMPTY ) ( not ( = ?auto_53351 ?auto_53355 ) ) ( not ( = ?auto_53352 ?auto_53355 ) ) ( not ( = ?auto_53353 ?auto_53355 ) ) ( not ( = ?auto_53354 ?auto_53355 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53354 ?auto_53355 )
      ( MAKE-4PILE ?auto_53351 ?auto_53352 ?auto_53353 ?auto_53354 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53356 - BLOCK
      ?auto_53357 - BLOCK
      ?auto_53358 - BLOCK
      ?auto_53359 - BLOCK
    )
    :vars
    (
      ?auto_53360 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53356 ) ( ON ?auto_53357 ?auto_53356 ) ( not ( = ?auto_53356 ?auto_53357 ) ) ( not ( = ?auto_53356 ?auto_53358 ) ) ( not ( = ?auto_53356 ?auto_53359 ) ) ( not ( = ?auto_53357 ?auto_53358 ) ) ( not ( = ?auto_53357 ?auto_53359 ) ) ( not ( = ?auto_53358 ?auto_53359 ) ) ( ON ?auto_53359 ?auto_53360 ) ( CLEAR ?auto_53359 ) ( not ( = ?auto_53356 ?auto_53360 ) ) ( not ( = ?auto_53357 ?auto_53360 ) ) ( not ( = ?auto_53358 ?auto_53360 ) ) ( not ( = ?auto_53359 ?auto_53360 ) ) ( HOLDING ?auto_53358 ) ( CLEAR ?auto_53357 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53356 ?auto_53357 ?auto_53358 )
      ( MAKE-4PILE ?auto_53356 ?auto_53357 ?auto_53358 ?auto_53359 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53361 - BLOCK
      ?auto_53362 - BLOCK
      ?auto_53363 - BLOCK
      ?auto_53364 - BLOCK
    )
    :vars
    (
      ?auto_53365 - BLOCK
      ?auto_53366 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53361 ) ( ON ?auto_53362 ?auto_53361 ) ( not ( = ?auto_53361 ?auto_53362 ) ) ( not ( = ?auto_53361 ?auto_53363 ) ) ( not ( = ?auto_53361 ?auto_53364 ) ) ( not ( = ?auto_53362 ?auto_53363 ) ) ( not ( = ?auto_53362 ?auto_53364 ) ) ( not ( = ?auto_53363 ?auto_53364 ) ) ( ON ?auto_53364 ?auto_53365 ) ( not ( = ?auto_53361 ?auto_53365 ) ) ( not ( = ?auto_53362 ?auto_53365 ) ) ( not ( = ?auto_53363 ?auto_53365 ) ) ( not ( = ?auto_53364 ?auto_53365 ) ) ( CLEAR ?auto_53362 ) ( ON ?auto_53363 ?auto_53364 ) ( CLEAR ?auto_53363 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53366 ) ( ON ?auto_53365 ?auto_53366 ) ( not ( = ?auto_53366 ?auto_53365 ) ) ( not ( = ?auto_53366 ?auto_53364 ) ) ( not ( = ?auto_53366 ?auto_53363 ) ) ( not ( = ?auto_53361 ?auto_53366 ) ) ( not ( = ?auto_53362 ?auto_53366 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53366 ?auto_53365 ?auto_53364 )
      ( MAKE-4PILE ?auto_53361 ?auto_53362 ?auto_53363 ?auto_53364 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53367 - BLOCK
      ?auto_53368 - BLOCK
      ?auto_53369 - BLOCK
      ?auto_53370 - BLOCK
    )
    :vars
    (
      ?auto_53372 - BLOCK
      ?auto_53371 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53367 ) ( not ( = ?auto_53367 ?auto_53368 ) ) ( not ( = ?auto_53367 ?auto_53369 ) ) ( not ( = ?auto_53367 ?auto_53370 ) ) ( not ( = ?auto_53368 ?auto_53369 ) ) ( not ( = ?auto_53368 ?auto_53370 ) ) ( not ( = ?auto_53369 ?auto_53370 ) ) ( ON ?auto_53370 ?auto_53372 ) ( not ( = ?auto_53367 ?auto_53372 ) ) ( not ( = ?auto_53368 ?auto_53372 ) ) ( not ( = ?auto_53369 ?auto_53372 ) ) ( not ( = ?auto_53370 ?auto_53372 ) ) ( ON ?auto_53369 ?auto_53370 ) ( CLEAR ?auto_53369 ) ( ON-TABLE ?auto_53371 ) ( ON ?auto_53372 ?auto_53371 ) ( not ( = ?auto_53371 ?auto_53372 ) ) ( not ( = ?auto_53371 ?auto_53370 ) ) ( not ( = ?auto_53371 ?auto_53369 ) ) ( not ( = ?auto_53367 ?auto_53371 ) ) ( not ( = ?auto_53368 ?auto_53371 ) ) ( HOLDING ?auto_53368 ) ( CLEAR ?auto_53367 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53367 ?auto_53368 )
      ( MAKE-4PILE ?auto_53367 ?auto_53368 ?auto_53369 ?auto_53370 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53373 - BLOCK
      ?auto_53374 - BLOCK
      ?auto_53375 - BLOCK
      ?auto_53376 - BLOCK
    )
    :vars
    (
      ?auto_53378 - BLOCK
      ?auto_53377 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53373 ) ( not ( = ?auto_53373 ?auto_53374 ) ) ( not ( = ?auto_53373 ?auto_53375 ) ) ( not ( = ?auto_53373 ?auto_53376 ) ) ( not ( = ?auto_53374 ?auto_53375 ) ) ( not ( = ?auto_53374 ?auto_53376 ) ) ( not ( = ?auto_53375 ?auto_53376 ) ) ( ON ?auto_53376 ?auto_53378 ) ( not ( = ?auto_53373 ?auto_53378 ) ) ( not ( = ?auto_53374 ?auto_53378 ) ) ( not ( = ?auto_53375 ?auto_53378 ) ) ( not ( = ?auto_53376 ?auto_53378 ) ) ( ON ?auto_53375 ?auto_53376 ) ( ON-TABLE ?auto_53377 ) ( ON ?auto_53378 ?auto_53377 ) ( not ( = ?auto_53377 ?auto_53378 ) ) ( not ( = ?auto_53377 ?auto_53376 ) ) ( not ( = ?auto_53377 ?auto_53375 ) ) ( not ( = ?auto_53373 ?auto_53377 ) ) ( not ( = ?auto_53374 ?auto_53377 ) ) ( CLEAR ?auto_53373 ) ( ON ?auto_53374 ?auto_53375 ) ( CLEAR ?auto_53374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53377 ?auto_53378 ?auto_53376 ?auto_53375 )
      ( MAKE-4PILE ?auto_53373 ?auto_53374 ?auto_53375 ?auto_53376 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53379 - BLOCK
      ?auto_53380 - BLOCK
      ?auto_53381 - BLOCK
      ?auto_53382 - BLOCK
    )
    :vars
    (
      ?auto_53384 - BLOCK
      ?auto_53383 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53379 ?auto_53380 ) ) ( not ( = ?auto_53379 ?auto_53381 ) ) ( not ( = ?auto_53379 ?auto_53382 ) ) ( not ( = ?auto_53380 ?auto_53381 ) ) ( not ( = ?auto_53380 ?auto_53382 ) ) ( not ( = ?auto_53381 ?auto_53382 ) ) ( ON ?auto_53382 ?auto_53384 ) ( not ( = ?auto_53379 ?auto_53384 ) ) ( not ( = ?auto_53380 ?auto_53384 ) ) ( not ( = ?auto_53381 ?auto_53384 ) ) ( not ( = ?auto_53382 ?auto_53384 ) ) ( ON ?auto_53381 ?auto_53382 ) ( ON-TABLE ?auto_53383 ) ( ON ?auto_53384 ?auto_53383 ) ( not ( = ?auto_53383 ?auto_53384 ) ) ( not ( = ?auto_53383 ?auto_53382 ) ) ( not ( = ?auto_53383 ?auto_53381 ) ) ( not ( = ?auto_53379 ?auto_53383 ) ) ( not ( = ?auto_53380 ?auto_53383 ) ) ( ON ?auto_53380 ?auto_53381 ) ( CLEAR ?auto_53380 ) ( HOLDING ?auto_53379 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53379 )
      ( MAKE-4PILE ?auto_53379 ?auto_53380 ?auto_53381 ?auto_53382 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53385 - BLOCK
      ?auto_53386 - BLOCK
      ?auto_53387 - BLOCK
      ?auto_53388 - BLOCK
    )
    :vars
    (
      ?auto_53390 - BLOCK
      ?auto_53389 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53385 ?auto_53386 ) ) ( not ( = ?auto_53385 ?auto_53387 ) ) ( not ( = ?auto_53385 ?auto_53388 ) ) ( not ( = ?auto_53386 ?auto_53387 ) ) ( not ( = ?auto_53386 ?auto_53388 ) ) ( not ( = ?auto_53387 ?auto_53388 ) ) ( ON ?auto_53388 ?auto_53390 ) ( not ( = ?auto_53385 ?auto_53390 ) ) ( not ( = ?auto_53386 ?auto_53390 ) ) ( not ( = ?auto_53387 ?auto_53390 ) ) ( not ( = ?auto_53388 ?auto_53390 ) ) ( ON ?auto_53387 ?auto_53388 ) ( ON-TABLE ?auto_53389 ) ( ON ?auto_53390 ?auto_53389 ) ( not ( = ?auto_53389 ?auto_53390 ) ) ( not ( = ?auto_53389 ?auto_53388 ) ) ( not ( = ?auto_53389 ?auto_53387 ) ) ( not ( = ?auto_53385 ?auto_53389 ) ) ( not ( = ?auto_53386 ?auto_53389 ) ) ( ON ?auto_53386 ?auto_53387 ) ( ON ?auto_53385 ?auto_53386 ) ( CLEAR ?auto_53385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53389 ?auto_53390 ?auto_53388 ?auto_53387 ?auto_53386 )
      ( MAKE-4PILE ?auto_53385 ?auto_53386 ?auto_53387 ?auto_53388 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53391 - BLOCK
      ?auto_53392 - BLOCK
      ?auto_53393 - BLOCK
      ?auto_53394 - BLOCK
    )
    :vars
    (
      ?auto_53396 - BLOCK
      ?auto_53395 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53391 ?auto_53392 ) ) ( not ( = ?auto_53391 ?auto_53393 ) ) ( not ( = ?auto_53391 ?auto_53394 ) ) ( not ( = ?auto_53392 ?auto_53393 ) ) ( not ( = ?auto_53392 ?auto_53394 ) ) ( not ( = ?auto_53393 ?auto_53394 ) ) ( ON ?auto_53394 ?auto_53396 ) ( not ( = ?auto_53391 ?auto_53396 ) ) ( not ( = ?auto_53392 ?auto_53396 ) ) ( not ( = ?auto_53393 ?auto_53396 ) ) ( not ( = ?auto_53394 ?auto_53396 ) ) ( ON ?auto_53393 ?auto_53394 ) ( ON-TABLE ?auto_53395 ) ( ON ?auto_53396 ?auto_53395 ) ( not ( = ?auto_53395 ?auto_53396 ) ) ( not ( = ?auto_53395 ?auto_53394 ) ) ( not ( = ?auto_53395 ?auto_53393 ) ) ( not ( = ?auto_53391 ?auto_53395 ) ) ( not ( = ?auto_53392 ?auto_53395 ) ) ( ON ?auto_53392 ?auto_53393 ) ( HOLDING ?auto_53391 ) ( CLEAR ?auto_53392 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53395 ?auto_53396 ?auto_53394 ?auto_53393 ?auto_53392 ?auto_53391 )
      ( MAKE-4PILE ?auto_53391 ?auto_53392 ?auto_53393 ?auto_53394 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53397 - BLOCK
      ?auto_53398 - BLOCK
      ?auto_53399 - BLOCK
      ?auto_53400 - BLOCK
    )
    :vars
    (
      ?auto_53402 - BLOCK
      ?auto_53401 - BLOCK
      ?auto_53403 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53397 ?auto_53398 ) ) ( not ( = ?auto_53397 ?auto_53399 ) ) ( not ( = ?auto_53397 ?auto_53400 ) ) ( not ( = ?auto_53398 ?auto_53399 ) ) ( not ( = ?auto_53398 ?auto_53400 ) ) ( not ( = ?auto_53399 ?auto_53400 ) ) ( ON ?auto_53400 ?auto_53402 ) ( not ( = ?auto_53397 ?auto_53402 ) ) ( not ( = ?auto_53398 ?auto_53402 ) ) ( not ( = ?auto_53399 ?auto_53402 ) ) ( not ( = ?auto_53400 ?auto_53402 ) ) ( ON ?auto_53399 ?auto_53400 ) ( ON-TABLE ?auto_53401 ) ( ON ?auto_53402 ?auto_53401 ) ( not ( = ?auto_53401 ?auto_53402 ) ) ( not ( = ?auto_53401 ?auto_53400 ) ) ( not ( = ?auto_53401 ?auto_53399 ) ) ( not ( = ?auto_53397 ?auto_53401 ) ) ( not ( = ?auto_53398 ?auto_53401 ) ) ( ON ?auto_53398 ?auto_53399 ) ( CLEAR ?auto_53398 ) ( ON ?auto_53397 ?auto_53403 ) ( CLEAR ?auto_53397 ) ( HAND-EMPTY ) ( not ( = ?auto_53397 ?auto_53403 ) ) ( not ( = ?auto_53398 ?auto_53403 ) ) ( not ( = ?auto_53399 ?auto_53403 ) ) ( not ( = ?auto_53400 ?auto_53403 ) ) ( not ( = ?auto_53402 ?auto_53403 ) ) ( not ( = ?auto_53401 ?auto_53403 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53397 ?auto_53403 )
      ( MAKE-4PILE ?auto_53397 ?auto_53398 ?auto_53399 ?auto_53400 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53404 - BLOCK
      ?auto_53405 - BLOCK
      ?auto_53406 - BLOCK
      ?auto_53407 - BLOCK
    )
    :vars
    (
      ?auto_53409 - BLOCK
      ?auto_53410 - BLOCK
      ?auto_53408 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53404 ?auto_53405 ) ) ( not ( = ?auto_53404 ?auto_53406 ) ) ( not ( = ?auto_53404 ?auto_53407 ) ) ( not ( = ?auto_53405 ?auto_53406 ) ) ( not ( = ?auto_53405 ?auto_53407 ) ) ( not ( = ?auto_53406 ?auto_53407 ) ) ( ON ?auto_53407 ?auto_53409 ) ( not ( = ?auto_53404 ?auto_53409 ) ) ( not ( = ?auto_53405 ?auto_53409 ) ) ( not ( = ?auto_53406 ?auto_53409 ) ) ( not ( = ?auto_53407 ?auto_53409 ) ) ( ON ?auto_53406 ?auto_53407 ) ( ON-TABLE ?auto_53410 ) ( ON ?auto_53409 ?auto_53410 ) ( not ( = ?auto_53410 ?auto_53409 ) ) ( not ( = ?auto_53410 ?auto_53407 ) ) ( not ( = ?auto_53410 ?auto_53406 ) ) ( not ( = ?auto_53404 ?auto_53410 ) ) ( not ( = ?auto_53405 ?auto_53410 ) ) ( ON ?auto_53404 ?auto_53408 ) ( CLEAR ?auto_53404 ) ( not ( = ?auto_53404 ?auto_53408 ) ) ( not ( = ?auto_53405 ?auto_53408 ) ) ( not ( = ?auto_53406 ?auto_53408 ) ) ( not ( = ?auto_53407 ?auto_53408 ) ) ( not ( = ?auto_53409 ?auto_53408 ) ) ( not ( = ?auto_53410 ?auto_53408 ) ) ( HOLDING ?auto_53405 ) ( CLEAR ?auto_53406 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53410 ?auto_53409 ?auto_53407 ?auto_53406 ?auto_53405 )
      ( MAKE-4PILE ?auto_53404 ?auto_53405 ?auto_53406 ?auto_53407 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53411 - BLOCK
      ?auto_53412 - BLOCK
      ?auto_53413 - BLOCK
      ?auto_53414 - BLOCK
    )
    :vars
    (
      ?auto_53415 - BLOCK
      ?auto_53416 - BLOCK
      ?auto_53417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53411 ?auto_53412 ) ) ( not ( = ?auto_53411 ?auto_53413 ) ) ( not ( = ?auto_53411 ?auto_53414 ) ) ( not ( = ?auto_53412 ?auto_53413 ) ) ( not ( = ?auto_53412 ?auto_53414 ) ) ( not ( = ?auto_53413 ?auto_53414 ) ) ( ON ?auto_53414 ?auto_53415 ) ( not ( = ?auto_53411 ?auto_53415 ) ) ( not ( = ?auto_53412 ?auto_53415 ) ) ( not ( = ?auto_53413 ?auto_53415 ) ) ( not ( = ?auto_53414 ?auto_53415 ) ) ( ON ?auto_53413 ?auto_53414 ) ( ON-TABLE ?auto_53416 ) ( ON ?auto_53415 ?auto_53416 ) ( not ( = ?auto_53416 ?auto_53415 ) ) ( not ( = ?auto_53416 ?auto_53414 ) ) ( not ( = ?auto_53416 ?auto_53413 ) ) ( not ( = ?auto_53411 ?auto_53416 ) ) ( not ( = ?auto_53412 ?auto_53416 ) ) ( ON ?auto_53411 ?auto_53417 ) ( not ( = ?auto_53411 ?auto_53417 ) ) ( not ( = ?auto_53412 ?auto_53417 ) ) ( not ( = ?auto_53413 ?auto_53417 ) ) ( not ( = ?auto_53414 ?auto_53417 ) ) ( not ( = ?auto_53415 ?auto_53417 ) ) ( not ( = ?auto_53416 ?auto_53417 ) ) ( CLEAR ?auto_53413 ) ( ON ?auto_53412 ?auto_53411 ) ( CLEAR ?auto_53412 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53417 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53417 ?auto_53411 )
      ( MAKE-4PILE ?auto_53411 ?auto_53412 ?auto_53413 ?auto_53414 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53418 - BLOCK
      ?auto_53419 - BLOCK
      ?auto_53420 - BLOCK
      ?auto_53421 - BLOCK
    )
    :vars
    (
      ?auto_53424 - BLOCK
      ?auto_53422 - BLOCK
      ?auto_53423 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53418 ?auto_53419 ) ) ( not ( = ?auto_53418 ?auto_53420 ) ) ( not ( = ?auto_53418 ?auto_53421 ) ) ( not ( = ?auto_53419 ?auto_53420 ) ) ( not ( = ?auto_53419 ?auto_53421 ) ) ( not ( = ?auto_53420 ?auto_53421 ) ) ( ON ?auto_53421 ?auto_53424 ) ( not ( = ?auto_53418 ?auto_53424 ) ) ( not ( = ?auto_53419 ?auto_53424 ) ) ( not ( = ?auto_53420 ?auto_53424 ) ) ( not ( = ?auto_53421 ?auto_53424 ) ) ( ON-TABLE ?auto_53422 ) ( ON ?auto_53424 ?auto_53422 ) ( not ( = ?auto_53422 ?auto_53424 ) ) ( not ( = ?auto_53422 ?auto_53421 ) ) ( not ( = ?auto_53422 ?auto_53420 ) ) ( not ( = ?auto_53418 ?auto_53422 ) ) ( not ( = ?auto_53419 ?auto_53422 ) ) ( ON ?auto_53418 ?auto_53423 ) ( not ( = ?auto_53418 ?auto_53423 ) ) ( not ( = ?auto_53419 ?auto_53423 ) ) ( not ( = ?auto_53420 ?auto_53423 ) ) ( not ( = ?auto_53421 ?auto_53423 ) ) ( not ( = ?auto_53424 ?auto_53423 ) ) ( not ( = ?auto_53422 ?auto_53423 ) ) ( ON ?auto_53419 ?auto_53418 ) ( CLEAR ?auto_53419 ) ( ON-TABLE ?auto_53423 ) ( HOLDING ?auto_53420 ) ( CLEAR ?auto_53421 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53422 ?auto_53424 ?auto_53421 ?auto_53420 )
      ( MAKE-4PILE ?auto_53418 ?auto_53419 ?auto_53420 ?auto_53421 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53425 - BLOCK
      ?auto_53426 - BLOCK
      ?auto_53427 - BLOCK
      ?auto_53428 - BLOCK
    )
    :vars
    (
      ?auto_53429 - BLOCK
      ?auto_53431 - BLOCK
      ?auto_53430 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53425 ?auto_53426 ) ) ( not ( = ?auto_53425 ?auto_53427 ) ) ( not ( = ?auto_53425 ?auto_53428 ) ) ( not ( = ?auto_53426 ?auto_53427 ) ) ( not ( = ?auto_53426 ?auto_53428 ) ) ( not ( = ?auto_53427 ?auto_53428 ) ) ( ON ?auto_53428 ?auto_53429 ) ( not ( = ?auto_53425 ?auto_53429 ) ) ( not ( = ?auto_53426 ?auto_53429 ) ) ( not ( = ?auto_53427 ?auto_53429 ) ) ( not ( = ?auto_53428 ?auto_53429 ) ) ( ON-TABLE ?auto_53431 ) ( ON ?auto_53429 ?auto_53431 ) ( not ( = ?auto_53431 ?auto_53429 ) ) ( not ( = ?auto_53431 ?auto_53428 ) ) ( not ( = ?auto_53431 ?auto_53427 ) ) ( not ( = ?auto_53425 ?auto_53431 ) ) ( not ( = ?auto_53426 ?auto_53431 ) ) ( ON ?auto_53425 ?auto_53430 ) ( not ( = ?auto_53425 ?auto_53430 ) ) ( not ( = ?auto_53426 ?auto_53430 ) ) ( not ( = ?auto_53427 ?auto_53430 ) ) ( not ( = ?auto_53428 ?auto_53430 ) ) ( not ( = ?auto_53429 ?auto_53430 ) ) ( not ( = ?auto_53431 ?auto_53430 ) ) ( ON ?auto_53426 ?auto_53425 ) ( ON-TABLE ?auto_53430 ) ( CLEAR ?auto_53428 ) ( ON ?auto_53427 ?auto_53426 ) ( CLEAR ?auto_53427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53430 ?auto_53425 ?auto_53426 )
      ( MAKE-4PILE ?auto_53425 ?auto_53426 ?auto_53427 ?auto_53428 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53432 - BLOCK
      ?auto_53433 - BLOCK
      ?auto_53434 - BLOCK
      ?auto_53435 - BLOCK
    )
    :vars
    (
      ?auto_53437 - BLOCK
      ?auto_53436 - BLOCK
      ?auto_53438 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53432 ?auto_53433 ) ) ( not ( = ?auto_53432 ?auto_53434 ) ) ( not ( = ?auto_53432 ?auto_53435 ) ) ( not ( = ?auto_53433 ?auto_53434 ) ) ( not ( = ?auto_53433 ?auto_53435 ) ) ( not ( = ?auto_53434 ?auto_53435 ) ) ( not ( = ?auto_53432 ?auto_53437 ) ) ( not ( = ?auto_53433 ?auto_53437 ) ) ( not ( = ?auto_53434 ?auto_53437 ) ) ( not ( = ?auto_53435 ?auto_53437 ) ) ( ON-TABLE ?auto_53436 ) ( ON ?auto_53437 ?auto_53436 ) ( not ( = ?auto_53436 ?auto_53437 ) ) ( not ( = ?auto_53436 ?auto_53435 ) ) ( not ( = ?auto_53436 ?auto_53434 ) ) ( not ( = ?auto_53432 ?auto_53436 ) ) ( not ( = ?auto_53433 ?auto_53436 ) ) ( ON ?auto_53432 ?auto_53438 ) ( not ( = ?auto_53432 ?auto_53438 ) ) ( not ( = ?auto_53433 ?auto_53438 ) ) ( not ( = ?auto_53434 ?auto_53438 ) ) ( not ( = ?auto_53435 ?auto_53438 ) ) ( not ( = ?auto_53437 ?auto_53438 ) ) ( not ( = ?auto_53436 ?auto_53438 ) ) ( ON ?auto_53433 ?auto_53432 ) ( ON-TABLE ?auto_53438 ) ( ON ?auto_53434 ?auto_53433 ) ( CLEAR ?auto_53434 ) ( HOLDING ?auto_53435 ) ( CLEAR ?auto_53437 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53436 ?auto_53437 ?auto_53435 )
      ( MAKE-4PILE ?auto_53432 ?auto_53433 ?auto_53434 ?auto_53435 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53439 - BLOCK
      ?auto_53440 - BLOCK
      ?auto_53441 - BLOCK
      ?auto_53442 - BLOCK
    )
    :vars
    (
      ?auto_53445 - BLOCK
      ?auto_53443 - BLOCK
      ?auto_53444 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53439 ?auto_53440 ) ) ( not ( = ?auto_53439 ?auto_53441 ) ) ( not ( = ?auto_53439 ?auto_53442 ) ) ( not ( = ?auto_53440 ?auto_53441 ) ) ( not ( = ?auto_53440 ?auto_53442 ) ) ( not ( = ?auto_53441 ?auto_53442 ) ) ( not ( = ?auto_53439 ?auto_53445 ) ) ( not ( = ?auto_53440 ?auto_53445 ) ) ( not ( = ?auto_53441 ?auto_53445 ) ) ( not ( = ?auto_53442 ?auto_53445 ) ) ( ON-TABLE ?auto_53443 ) ( ON ?auto_53445 ?auto_53443 ) ( not ( = ?auto_53443 ?auto_53445 ) ) ( not ( = ?auto_53443 ?auto_53442 ) ) ( not ( = ?auto_53443 ?auto_53441 ) ) ( not ( = ?auto_53439 ?auto_53443 ) ) ( not ( = ?auto_53440 ?auto_53443 ) ) ( ON ?auto_53439 ?auto_53444 ) ( not ( = ?auto_53439 ?auto_53444 ) ) ( not ( = ?auto_53440 ?auto_53444 ) ) ( not ( = ?auto_53441 ?auto_53444 ) ) ( not ( = ?auto_53442 ?auto_53444 ) ) ( not ( = ?auto_53445 ?auto_53444 ) ) ( not ( = ?auto_53443 ?auto_53444 ) ) ( ON ?auto_53440 ?auto_53439 ) ( ON-TABLE ?auto_53444 ) ( ON ?auto_53441 ?auto_53440 ) ( CLEAR ?auto_53445 ) ( ON ?auto_53442 ?auto_53441 ) ( CLEAR ?auto_53442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53444 ?auto_53439 ?auto_53440 ?auto_53441 )
      ( MAKE-4PILE ?auto_53439 ?auto_53440 ?auto_53441 ?auto_53442 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53446 - BLOCK
      ?auto_53447 - BLOCK
      ?auto_53448 - BLOCK
      ?auto_53449 - BLOCK
    )
    :vars
    (
      ?auto_53450 - BLOCK
      ?auto_53452 - BLOCK
      ?auto_53451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53446 ?auto_53447 ) ) ( not ( = ?auto_53446 ?auto_53448 ) ) ( not ( = ?auto_53446 ?auto_53449 ) ) ( not ( = ?auto_53447 ?auto_53448 ) ) ( not ( = ?auto_53447 ?auto_53449 ) ) ( not ( = ?auto_53448 ?auto_53449 ) ) ( not ( = ?auto_53446 ?auto_53450 ) ) ( not ( = ?auto_53447 ?auto_53450 ) ) ( not ( = ?auto_53448 ?auto_53450 ) ) ( not ( = ?auto_53449 ?auto_53450 ) ) ( ON-TABLE ?auto_53452 ) ( not ( = ?auto_53452 ?auto_53450 ) ) ( not ( = ?auto_53452 ?auto_53449 ) ) ( not ( = ?auto_53452 ?auto_53448 ) ) ( not ( = ?auto_53446 ?auto_53452 ) ) ( not ( = ?auto_53447 ?auto_53452 ) ) ( ON ?auto_53446 ?auto_53451 ) ( not ( = ?auto_53446 ?auto_53451 ) ) ( not ( = ?auto_53447 ?auto_53451 ) ) ( not ( = ?auto_53448 ?auto_53451 ) ) ( not ( = ?auto_53449 ?auto_53451 ) ) ( not ( = ?auto_53450 ?auto_53451 ) ) ( not ( = ?auto_53452 ?auto_53451 ) ) ( ON ?auto_53447 ?auto_53446 ) ( ON-TABLE ?auto_53451 ) ( ON ?auto_53448 ?auto_53447 ) ( ON ?auto_53449 ?auto_53448 ) ( CLEAR ?auto_53449 ) ( HOLDING ?auto_53450 ) ( CLEAR ?auto_53452 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53452 ?auto_53450 )
      ( MAKE-4PILE ?auto_53446 ?auto_53447 ?auto_53448 ?auto_53449 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53453 - BLOCK
      ?auto_53454 - BLOCK
      ?auto_53455 - BLOCK
      ?auto_53456 - BLOCK
    )
    :vars
    (
      ?auto_53457 - BLOCK
      ?auto_53459 - BLOCK
      ?auto_53458 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53453 ?auto_53454 ) ) ( not ( = ?auto_53453 ?auto_53455 ) ) ( not ( = ?auto_53453 ?auto_53456 ) ) ( not ( = ?auto_53454 ?auto_53455 ) ) ( not ( = ?auto_53454 ?auto_53456 ) ) ( not ( = ?auto_53455 ?auto_53456 ) ) ( not ( = ?auto_53453 ?auto_53457 ) ) ( not ( = ?auto_53454 ?auto_53457 ) ) ( not ( = ?auto_53455 ?auto_53457 ) ) ( not ( = ?auto_53456 ?auto_53457 ) ) ( ON-TABLE ?auto_53459 ) ( not ( = ?auto_53459 ?auto_53457 ) ) ( not ( = ?auto_53459 ?auto_53456 ) ) ( not ( = ?auto_53459 ?auto_53455 ) ) ( not ( = ?auto_53453 ?auto_53459 ) ) ( not ( = ?auto_53454 ?auto_53459 ) ) ( ON ?auto_53453 ?auto_53458 ) ( not ( = ?auto_53453 ?auto_53458 ) ) ( not ( = ?auto_53454 ?auto_53458 ) ) ( not ( = ?auto_53455 ?auto_53458 ) ) ( not ( = ?auto_53456 ?auto_53458 ) ) ( not ( = ?auto_53457 ?auto_53458 ) ) ( not ( = ?auto_53459 ?auto_53458 ) ) ( ON ?auto_53454 ?auto_53453 ) ( ON-TABLE ?auto_53458 ) ( ON ?auto_53455 ?auto_53454 ) ( ON ?auto_53456 ?auto_53455 ) ( CLEAR ?auto_53459 ) ( ON ?auto_53457 ?auto_53456 ) ( CLEAR ?auto_53457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53458 ?auto_53453 ?auto_53454 ?auto_53455 ?auto_53456 )
      ( MAKE-4PILE ?auto_53453 ?auto_53454 ?auto_53455 ?auto_53456 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53460 - BLOCK
      ?auto_53461 - BLOCK
      ?auto_53462 - BLOCK
      ?auto_53463 - BLOCK
    )
    :vars
    (
      ?auto_53464 - BLOCK
      ?auto_53465 - BLOCK
      ?auto_53466 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53460 ?auto_53461 ) ) ( not ( = ?auto_53460 ?auto_53462 ) ) ( not ( = ?auto_53460 ?auto_53463 ) ) ( not ( = ?auto_53461 ?auto_53462 ) ) ( not ( = ?auto_53461 ?auto_53463 ) ) ( not ( = ?auto_53462 ?auto_53463 ) ) ( not ( = ?auto_53460 ?auto_53464 ) ) ( not ( = ?auto_53461 ?auto_53464 ) ) ( not ( = ?auto_53462 ?auto_53464 ) ) ( not ( = ?auto_53463 ?auto_53464 ) ) ( not ( = ?auto_53465 ?auto_53464 ) ) ( not ( = ?auto_53465 ?auto_53463 ) ) ( not ( = ?auto_53465 ?auto_53462 ) ) ( not ( = ?auto_53460 ?auto_53465 ) ) ( not ( = ?auto_53461 ?auto_53465 ) ) ( ON ?auto_53460 ?auto_53466 ) ( not ( = ?auto_53460 ?auto_53466 ) ) ( not ( = ?auto_53461 ?auto_53466 ) ) ( not ( = ?auto_53462 ?auto_53466 ) ) ( not ( = ?auto_53463 ?auto_53466 ) ) ( not ( = ?auto_53464 ?auto_53466 ) ) ( not ( = ?auto_53465 ?auto_53466 ) ) ( ON ?auto_53461 ?auto_53460 ) ( ON-TABLE ?auto_53466 ) ( ON ?auto_53462 ?auto_53461 ) ( ON ?auto_53463 ?auto_53462 ) ( ON ?auto_53464 ?auto_53463 ) ( CLEAR ?auto_53464 ) ( HOLDING ?auto_53465 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53465 )
      ( MAKE-4PILE ?auto_53460 ?auto_53461 ?auto_53462 ?auto_53463 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53467 - BLOCK
      ?auto_53468 - BLOCK
      ?auto_53469 - BLOCK
      ?auto_53470 - BLOCK
    )
    :vars
    (
      ?auto_53471 - BLOCK
      ?auto_53472 - BLOCK
      ?auto_53473 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53467 ?auto_53468 ) ) ( not ( = ?auto_53467 ?auto_53469 ) ) ( not ( = ?auto_53467 ?auto_53470 ) ) ( not ( = ?auto_53468 ?auto_53469 ) ) ( not ( = ?auto_53468 ?auto_53470 ) ) ( not ( = ?auto_53469 ?auto_53470 ) ) ( not ( = ?auto_53467 ?auto_53471 ) ) ( not ( = ?auto_53468 ?auto_53471 ) ) ( not ( = ?auto_53469 ?auto_53471 ) ) ( not ( = ?auto_53470 ?auto_53471 ) ) ( not ( = ?auto_53472 ?auto_53471 ) ) ( not ( = ?auto_53472 ?auto_53470 ) ) ( not ( = ?auto_53472 ?auto_53469 ) ) ( not ( = ?auto_53467 ?auto_53472 ) ) ( not ( = ?auto_53468 ?auto_53472 ) ) ( ON ?auto_53467 ?auto_53473 ) ( not ( = ?auto_53467 ?auto_53473 ) ) ( not ( = ?auto_53468 ?auto_53473 ) ) ( not ( = ?auto_53469 ?auto_53473 ) ) ( not ( = ?auto_53470 ?auto_53473 ) ) ( not ( = ?auto_53471 ?auto_53473 ) ) ( not ( = ?auto_53472 ?auto_53473 ) ) ( ON ?auto_53468 ?auto_53467 ) ( ON-TABLE ?auto_53473 ) ( ON ?auto_53469 ?auto_53468 ) ( ON ?auto_53470 ?auto_53469 ) ( ON ?auto_53471 ?auto_53470 ) ( ON ?auto_53472 ?auto_53471 ) ( CLEAR ?auto_53472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53473 ?auto_53467 ?auto_53468 ?auto_53469 ?auto_53470 ?auto_53471 )
      ( MAKE-4PILE ?auto_53467 ?auto_53468 ?auto_53469 ?auto_53470 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53475 - BLOCK
    )
    :vars
    (
      ?auto_53476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53476 ?auto_53475 ) ( CLEAR ?auto_53476 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53475 ) ( not ( = ?auto_53475 ?auto_53476 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53476 ?auto_53475 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53477 - BLOCK
    )
    :vars
    (
      ?auto_53478 - BLOCK
      ?auto_53479 - BLOCK
      ?auto_53480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53478 ?auto_53477 ) ( CLEAR ?auto_53478 ) ( ON-TABLE ?auto_53477 ) ( not ( = ?auto_53477 ?auto_53478 ) ) ( HOLDING ?auto_53479 ) ( CLEAR ?auto_53480 ) ( not ( = ?auto_53477 ?auto_53479 ) ) ( not ( = ?auto_53477 ?auto_53480 ) ) ( not ( = ?auto_53478 ?auto_53479 ) ) ( not ( = ?auto_53478 ?auto_53480 ) ) ( not ( = ?auto_53479 ?auto_53480 ) ) )
    :subtasks
    ( ( !STACK ?auto_53479 ?auto_53480 )
      ( MAKE-1PILE ?auto_53477 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53481 - BLOCK
    )
    :vars
    (
      ?auto_53483 - BLOCK
      ?auto_53482 - BLOCK
      ?auto_53484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53483 ?auto_53481 ) ( ON-TABLE ?auto_53481 ) ( not ( = ?auto_53481 ?auto_53483 ) ) ( CLEAR ?auto_53482 ) ( not ( = ?auto_53481 ?auto_53484 ) ) ( not ( = ?auto_53481 ?auto_53482 ) ) ( not ( = ?auto_53483 ?auto_53484 ) ) ( not ( = ?auto_53483 ?auto_53482 ) ) ( not ( = ?auto_53484 ?auto_53482 ) ) ( ON ?auto_53484 ?auto_53483 ) ( CLEAR ?auto_53484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53481 ?auto_53483 )
      ( MAKE-1PILE ?auto_53481 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53485 - BLOCK
    )
    :vars
    (
      ?auto_53486 - BLOCK
      ?auto_53488 - BLOCK
      ?auto_53487 - BLOCK
      ?auto_53490 - BLOCK
      ?auto_53489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53486 ?auto_53485 ) ( ON-TABLE ?auto_53485 ) ( not ( = ?auto_53485 ?auto_53486 ) ) ( not ( = ?auto_53485 ?auto_53488 ) ) ( not ( = ?auto_53485 ?auto_53487 ) ) ( not ( = ?auto_53486 ?auto_53488 ) ) ( not ( = ?auto_53486 ?auto_53487 ) ) ( not ( = ?auto_53488 ?auto_53487 ) ) ( ON ?auto_53488 ?auto_53486 ) ( CLEAR ?auto_53488 ) ( HOLDING ?auto_53487 ) ( CLEAR ?auto_53490 ) ( ON-TABLE ?auto_53489 ) ( ON ?auto_53490 ?auto_53489 ) ( not ( = ?auto_53489 ?auto_53490 ) ) ( not ( = ?auto_53489 ?auto_53487 ) ) ( not ( = ?auto_53490 ?auto_53487 ) ) ( not ( = ?auto_53485 ?auto_53490 ) ) ( not ( = ?auto_53485 ?auto_53489 ) ) ( not ( = ?auto_53486 ?auto_53490 ) ) ( not ( = ?auto_53486 ?auto_53489 ) ) ( not ( = ?auto_53488 ?auto_53490 ) ) ( not ( = ?auto_53488 ?auto_53489 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53489 ?auto_53490 ?auto_53487 )
      ( MAKE-1PILE ?auto_53485 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53491 - BLOCK
    )
    :vars
    (
      ?auto_53496 - BLOCK
      ?auto_53495 - BLOCK
      ?auto_53494 - BLOCK
      ?auto_53492 - BLOCK
      ?auto_53493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53496 ?auto_53491 ) ( ON-TABLE ?auto_53491 ) ( not ( = ?auto_53491 ?auto_53496 ) ) ( not ( = ?auto_53491 ?auto_53495 ) ) ( not ( = ?auto_53491 ?auto_53494 ) ) ( not ( = ?auto_53496 ?auto_53495 ) ) ( not ( = ?auto_53496 ?auto_53494 ) ) ( not ( = ?auto_53495 ?auto_53494 ) ) ( ON ?auto_53495 ?auto_53496 ) ( CLEAR ?auto_53492 ) ( ON-TABLE ?auto_53493 ) ( ON ?auto_53492 ?auto_53493 ) ( not ( = ?auto_53493 ?auto_53492 ) ) ( not ( = ?auto_53493 ?auto_53494 ) ) ( not ( = ?auto_53492 ?auto_53494 ) ) ( not ( = ?auto_53491 ?auto_53492 ) ) ( not ( = ?auto_53491 ?auto_53493 ) ) ( not ( = ?auto_53496 ?auto_53492 ) ) ( not ( = ?auto_53496 ?auto_53493 ) ) ( not ( = ?auto_53495 ?auto_53492 ) ) ( not ( = ?auto_53495 ?auto_53493 ) ) ( ON ?auto_53494 ?auto_53495 ) ( CLEAR ?auto_53494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53491 ?auto_53496 ?auto_53495 )
      ( MAKE-1PILE ?auto_53491 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53497 - BLOCK
    )
    :vars
    (
      ?auto_53498 - BLOCK
      ?auto_53500 - BLOCK
      ?auto_53501 - BLOCK
      ?auto_53499 - BLOCK
      ?auto_53502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53498 ?auto_53497 ) ( ON-TABLE ?auto_53497 ) ( not ( = ?auto_53497 ?auto_53498 ) ) ( not ( = ?auto_53497 ?auto_53500 ) ) ( not ( = ?auto_53497 ?auto_53501 ) ) ( not ( = ?auto_53498 ?auto_53500 ) ) ( not ( = ?auto_53498 ?auto_53501 ) ) ( not ( = ?auto_53500 ?auto_53501 ) ) ( ON ?auto_53500 ?auto_53498 ) ( ON-TABLE ?auto_53499 ) ( not ( = ?auto_53499 ?auto_53502 ) ) ( not ( = ?auto_53499 ?auto_53501 ) ) ( not ( = ?auto_53502 ?auto_53501 ) ) ( not ( = ?auto_53497 ?auto_53502 ) ) ( not ( = ?auto_53497 ?auto_53499 ) ) ( not ( = ?auto_53498 ?auto_53502 ) ) ( not ( = ?auto_53498 ?auto_53499 ) ) ( not ( = ?auto_53500 ?auto_53502 ) ) ( not ( = ?auto_53500 ?auto_53499 ) ) ( ON ?auto_53501 ?auto_53500 ) ( CLEAR ?auto_53501 ) ( HOLDING ?auto_53502 ) ( CLEAR ?auto_53499 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53499 ?auto_53502 )
      ( MAKE-1PILE ?auto_53497 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53503 - BLOCK
    )
    :vars
    (
      ?auto_53505 - BLOCK
      ?auto_53507 - BLOCK
      ?auto_53508 - BLOCK
      ?auto_53506 - BLOCK
      ?auto_53504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53505 ?auto_53503 ) ( ON-TABLE ?auto_53503 ) ( not ( = ?auto_53503 ?auto_53505 ) ) ( not ( = ?auto_53503 ?auto_53507 ) ) ( not ( = ?auto_53503 ?auto_53508 ) ) ( not ( = ?auto_53505 ?auto_53507 ) ) ( not ( = ?auto_53505 ?auto_53508 ) ) ( not ( = ?auto_53507 ?auto_53508 ) ) ( ON ?auto_53507 ?auto_53505 ) ( ON-TABLE ?auto_53506 ) ( not ( = ?auto_53506 ?auto_53504 ) ) ( not ( = ?auto_53506 ?auto_53508 ) ) ( not ( = ?auto_53504 ?auto_53508 ) ) ( not ( = ?auto_53503 ?auto_53504 ) ) ( not ( = ?auto_53503 ?auto_53506 ) ) ( not ( = ?auto_53505 ?auto_53504 ) ) ( not ( = ?auto_53505 ?auto_53506 ) ) ( not ( = ?auto_53507 ?auto_53504 ) ) ( not ( = ?auto_53507 ?auto_53506 ) ) ( ON ?auto_53508 ?auto_53507 ) ( CLEAR ?auto_53506 ) ( ON ?auto_53504 ?auto_53508 ) ( CLEAR ?auto_53504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53503 ?auto_53505 ?auto_53507 ?auto_53508 )
      ( MAKE-1PILE ?auto_53503 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53509 - BLOCK
    )
    :vars
    (
      ?auto_53514 - BLOCK
      ?auto_53513 - BLOCK
      ?auto_53510 - BLOCK
      ?auto_53512 - BLOCK
      ?auto_53511 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53514 ?auto_53509 ) ( ON-TABLE ?auto_53509 ) ( not ( = ?auto_53509 ?auto_53514 ) ) ( not ( = ?auto_53509 ?auto_53513 ) ) ( not ( = ?auto_53509 ?auto_53510 ) ) ( not ( = ?auto_53514 ?auto_53513 ) ) ( not ( = ?auto_53514 ?auto_53510 ) ) ( not ( = ?auto_53513 ?auto_53510 ) ) ( ON ?auto_53513 ?auto_53514 ) ( not ( = ?auto_53512 ?auto_53511 ) ) ( not ( = ?auto_53512 ?auto_53510 ) ) ( not ( = ?auto_53511 ?auto_53510 ) ) ( not ( = ?auto_53509 ?auto_53511 ) ) ( not ( = ?auto_53509 ?auto_53512 ) ) ( not ( = ?auto_53514 ?auto_53511 ) ) ( not ( = ?auto_53514 ?auto_53512 ) ) ( not ( = ?auto_53513 ?auto_53511 ) ) ( not ( = ?auto_53513 ?auto_53512 ) ) ( ON ?auto_53510 ?auto_53513 ) ( ON ?auto_53511 ?auto_53510 ) ( CLEAR ?auto_53511 ) ( HOLDING ?auto_53512 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53512 )
      ( MAKE-1PILE ?auto_53509 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53515 - BLOCK
    )
    :vars
    (
      ?auto_53520 - BLOCK
      ?auto_53519 - BLOCK
      ?auto_53516 - BLOCK
      ?auto_53517 - BLOCK
      ?auto_53518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53520 ?auto_53515 ) ( ON-TABLE ?auto_53515 ) ( not ( = ?auto_53515 ?auto_53520 ) ) ( not ( = ?auto_53515 ?auto_53519 ) ) ( not ( = ?auto_53515 ?auto_53516 ) ) ( not ( = ?auto_53520 ?auto_53519 ) ) ( not ( = ?auto_53520 ?auto_53516 ) ) ( not ( = ?auto_53519 ?auto_53516 ) ) ( ON ?auto_53519 ?auto_53520 ) ( not ( = ?auto_53517 ?auto_53518 ) ) ( not ( = ?auto_53517 ?auto_53516 ) ) ( not ( = ?auto_53518 ?auto_53516 ) ) ( not ( = ?auto_53515 ?auto_53518 ) ) ( not ( = ?auto_53515 ?auto_53517 ) ) ( not ( = ?auto_53520 ?auto_53518 ) ) ( not ( = ?auto_53520 ?auto_53517 ) ) ( not ( = ?auto_53519 ?auto_53518 ) ) ( not ( = ?auto_53519 ?auto_53517 ) ) ( ON ?auto_53516 ?auto_53519 ) ( ON ?auto_53518 ?auto_53516 ) ( ON ?auto_53517 ?auto_53518 ) ( CLEAR ?auto_53517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53515 ?auto_53520 ?auto_53519 ?auto_53516 ?auto_53518 )
      ( MAKE-1PILE ?auto_53515 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53521 - BLOCK
    )
    :vars
    (
      ?auto_53525 - BLOCK
      ?auto_53526 - BLOCK
      ?auto_53522 - BLOCK
      ?auto_53524 - BLOCK
      ?auto_53523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53525 ?auto_53521 ) ( ON-TABLE ?auto_53521 ) ( not ( = ?auto_53521 ?auto_53525 ) ) ( not ( = ?auto_53521 ?auto_53526 ) ) ( not ( = ?auto_53521 ?auto_53522 ) ) ( not ( = ?auto_53525 ?auto_53526 ) ) ( not ( = ?auto_53525 ?auto_53522 ) ) ( not ( = ?auto_53526 ?auto_53522 ) ) ( ON ?auto_53526 ?auto_53525 ) ( not ( = ?auto_53524 ?auto_53523 ) ) ( not ( = ?auto_53524 ?auto_53522 ) ) ( not ( = ?auto_53523 ?auto_53522 ) ) ( not ( = ?auto_53521 ?auto_53523 ) ) ( not ( = ?auto_53521 ?auto_53524 ) ) ( not ( = ?auto_53525 ?auto_53523 ) ) ( not ( = ?auto_53525 ?auto_53524 ) ) ( not ( = ?auto_53526 ?auto_53523 ) ) ( not ( = ?auto_53526 ?auto_53524 ) ) ( ON ?auto_53522 ?auto_53526 ) ( ON ?auto_53523 ?auto_53522 ) ( HOLDING ?auto_53524 ) ( CLEAR ?auto_53523 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53521 ?auto_53525 ?auto_53526 ?auto_53522 ?auto_53523 ?auto_53524 )
      ( MAKE-1PILE ?auto_53521 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53527 - BLOCK
    )
    :vars
    (
      ?auto_53529 - BLOCK
      ?auto_53530 - BLOCK
      ?auto_53532 - BLOCK
      ?auto_53528 - BLOCK
      ?auto_53531 - BLOCK
      ?auto_53533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53529 ?auto_53527 ) ( ON-TABLE ?auto_53527 ) ( not ( = ?auto_53527 ?auto_53529 ) ) ( not ( = ?auto_53527 ?auto_53530 ) ) ( not ( = ?auto_53527 ?auto_53532 ) ) ( not ( = ?auto_53529 ?auto_53530 ) ) ( not ( = ?auto_53529 ?auto_53532 ) ) ( not ( = ?auto_53530 ?auto_53532 ) ) ( ON ?auto_53530 ?auto_53529 ) ( not ( = ?auto_53528 ?auto_53531 ) ) ( not ( = ?auto_53528 ?auto_53532 ) ) ( not ( = ?auto_53531 ?auto_53532 ) ) ( not ( = ?auto_53527 ?auto_53531 ) ) ( not ( = ?auto_53527 ?auto_53528 ) ) ( not ( = ?auto_53529 ?auto_53531 ) ) ( not ( = ?auto_53529 ?auto_53528 ) ) ( not ( = ?auto_53530 ?auto_53531 ) ) ( not ( = ?auto_53530 ?auto_53528 ) ) ( ON ?auto_53532 ?auto_53530 ) ( ON ?auto_53531 ?auto_53532 ) ( CLEAR ?auto_53531 ) ( ON ?auto_53528 ?auto_53533 ) ( CLEAR ?auto_53528 ) ( HAND-EMPTY ) ( not ( = ?auto_53527 ?auto_53533 ) ) ( not ( = ?auto_53529 ?auto_53533 ) ) ( not ( = ?auto_53530 ?auto_53533 ) ) ( not ( = ?auto_53532 ?auto_53533 ) ) ( not ( = ?auto_53528 ?auto_53533 ) ) ( not ( = ?auto_53531 ?auto_53533 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53528 ?auto_53533 )
      ( MAKE-1PILE ?auto_53527 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53534 - BLOCK
    )
    :vars
    (
      ?auto_53538 - BLOCK
      ?auto_53535 - BLOCK
      ?auto_53540 - BLOCK
      ?auto_53536 - BLOCK
      ?auto_53539 - BLOCK
      ?auto_53537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53538 ?auto_53534 ) ( ON-TABLE ?auto_53534 ) ( not ( = ?auto_53534 ?auto_53538 ) ) ( not ( = ?auto_53534 ?auto_53535 ) ) ( not ( = ?auto_53534 ?auto_53540 ) ) ( not ( = ?auto_53538 ?auto_53535 ) ) ( not ( = ?auto_53538 ?auto_53540 ) ) ( not ( = ?auto_53535 ?auto_53540 ) ) ( ON ?auto_53535 ?auto_53538 ) ( not ( = ?auto_53536 ?auto_53539 ) ) ( not ( = ?auto_53536 ?auto_53540 ) ) ( not ( = ?auto_53539 ?auto_53540 ) ) ( not ( = ?auto_53534 ?auto_53539 ) ) ( not ( = ?auto_53534 ?auto_53536 ) ) ( not ( = ?auto_53538 ?auto_53539 ) ) ( not ( = ?auto_53538 ?auto_53536 ) ) ( not ( = ?auto_53535 ?auto_53539 ) ) ( not ( = ?auto_53535 ?auto_53536 ) ) ( ON ?auto_53540 ?auto_53535 ) ( ON ?auto_53536 ?auto_53537 ) ( CLEAR ?auto_53536 ) ( not ( = ?auto_53534 ?auto_53537 ) ) ( not ( = ?auto_53538 ?auto_53537 ) ) ( not ( = ?auto_53535 ?auto_53537 ) ) ( not ( = ?auto_53540 ?auto_53537 ) ) ( not ( = ?auto_53536 ?auto_53537 ) ) ( not ( = ?auto_53539 ?auto_53537 ) ) ( HOLDING ?auto_53539 ) ( CLEAR ?auto_53540 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53534 ?auto_53538 ?auto_53535 ?auto_53540 ?auto_53539 )
      ( MAKE-1PILE ?auto_53534 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53541 - BLOCK
    )
    :vars
    (
      ?auto_53547 - BLOCK
      ?auto_53543 - BLOCK
      ?auto_53545 - BLOCK
      ?auto_53544 - BLOCK
      ?auto_53542 - BLOCK
      ?auto_53546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53547 ?auto_53541 ) ( ON-TABLE ?auto_53541 ) ( not ( = ?auto_53541 ?auto_53547 ) ) ( not ( = ?auto_53541 ?auto_53543 ) ) ( not ( = ?auto_53541 ?auto_53545 ) ) ( not ( = ?auto_53547 ?auto_53543 ) ) ( not ( = ?auto_53547 ?auto_53545 ) ) ( not ( = ?auto_53543 ?auto_53545 ) ) ( ON ?auto_53543 ?auto_53547 ) ( not ( = ?auto_53544 ?auto_53542 ) ) ( not ( = ?auto_53544 ?auto_53545 ) ) ( not ( = ?auto_53542 ?auto_53545 ) ) ( not ( = ?auto_53541 ?auto_53542 ) ) ( not ( = ?auto_53541 ?auto_53544 ) ) ( not ( = ?auto_53547 ?auto_53542 ) ) ( not ( = ?auto_53547 ?auto_53544 ) ) ( not ( = ?auto_53543 ?auto_53542 ) ) ( not ( = ?auto_53543 ?auto_53544 ) ) ( ON ?auto_53545 ?auto_53543 ) ( ON ?auto_53544 ?auto_53546 ) ( not ( = ?auto_53541 ?auto_53546 ) ) ( not ( = ?auto_53547 ?auto_53546 ) ) ( not ( = ?auto_53543 ?auto_53546 ) ) ( not ( = ?auto_53545 ?auto_53546 ) ) ( not ( = ?auto_53544 ?auto_53546 ) ) ( not ( = ?auto_53542 ?auto_53546 ) ) ( CLEAR ?auto_53545 ) ( ON ?auto_53542 ?auto_53544 ) ( CLEAR ?auto_53542 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53546 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53546 ?auto_53544 )
      ( MAKE-1PILE ?auto_53541 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53548 - BLOCK
    )
    :vars
    (
      ?auto_53549 - BLOCK
      ?auto_53552 - BLOCK
      ?auto_53550 - BLOCK
      ?auto_53551 - BLOCK
      ?auto_53553 - BLOCK
      ?auto_53554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53549 ?auto_53548 ) ( ON-TABLE ?auto_53548 ) ( not ( = ?auto_53548 ?auto_53549 ) ) ( not ( = ?auto_53548 ?auto_53552 ) ) ( not ( = ?auto_53548 ?auto_53550 ) ) ( not ( = ?auto_53549 ?auto_53552 ) ) ( not ( = ?auto_53549 ?auto_53550 ) ) ( not ( = ?auto_53552 ?auto_53550 ) ) ( ON ?auto_53552 ?auto_53549 ) ( not ( = ?auto_53551 ?auto_53553 ) ) ( not ( = ?auto_53551 ?auto_53550 ) ) ( not ( = ?auto_53553 ?auto_53550 ) ) ( not ( = ?auto_53548 ?auto_53553 ) ) ( not ( = ?auto_53548 ?auto_53551 ) ) ( not ( = ?auto_53549 ?auto_53553 ) ) ( not ( = ?auto_53549 ?auto_53551 ) ) ( not ( = ?auto_53552 ?auto_53553 ) ) ( not ( = ?auto_53552 ?auto_53551 ) ) ( ON ?auto_53551 ?auto_53554 ) ( not ( = ?auto_53548 ?auto_53554 ) ) ( not ( = ?auto_53549 ?auto_53554 ) ) ( not ( = ?auto_53552 ?auto_53554 ) ) ( not ( = ?auto_53550 ?auto_53554 ) ) ( not ( = ?auto_53551 ?auto_53554 ) ) ( not ( = ?auto_53553 ?auto_53554 ) ) ( ON ?auto_53553 ?auto_53551 ) ( CLEAR ?auto_53553 ) ( ON-TABLE ?auto_53554 ) ( HOLDING ?auto_53550 ) ( CLEAR ?auto_53552 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53548 ?auto_53549 ?auto_53552 ?auto_53550 )
      ( MAKE-1PILE ?auto_53548 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53555 - BLOCK
    )
    :vars
    (
      ?auto_53558 - BLOCK
      ?auto_53556 - BLOCK
      ?auto_53561 - BLOCK
      ?auto_53557 - BLOCK
      ?auto_53559 - BLOCK
      ?auto_53560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53558 ?auto_53555 ) ( ON-TABLE ?auto_53555 ) ( not ( = ?auto_53555 ?auto_53558 ) ) ( not ( = ?auto_53555 ?auto_53556 ) ) ( not ( = ?auto_53555 ?auto_53561 ) ) ( not ( = ?auto_53558 ?auto_53556 ) ) ( not ( = ?auto_53558 ?auto_53561 ) ) ( not ( = ?auto_53556 ?auto_53561 ) ) ( ON ?auto_53556 ?auto_53558 ) ( not ( = ?auto_53557 ?auto_53559 ) ) ( not ( = ?auto_53557 ?auto_53561 ) ) ( not ( = ?auto_53559 ?auto_53561 ) ) ( not ( = ?auto_53555 ?auto_53559 ) ) ( not ( = ?auto_53555 ?auto_53557 ) ) ( not ( = ?auto_53558 ?auto_53559 ) ) ( not ( = ?auto_53558 ?auto_53557 ) ) ( not ( = ?auto_53556 ?auto_53559 ) ) ( not ( = ?auto_53556 ?auto_53557 ) ) ( ON ?auto_53557 ?auto_53560 ) ( not ( = ?auto_53555 ?auto_53560 ) ) ( not ( = ?auto_53558 ?auto_53560 ) ) ( not ( = ?auto_53556 ?auto_53560 ) ) ( not ( = ?auto_53561 ?auto_53560 ) ) ( not ( = ?auto_53557 ?auto_53560 ) ) ( not ( = ?auto_53559 ?auto_53560 ) ) ( ON ?auto_53559 ?auto_53557 ) ( ON-TABLE ?auto_53560 ) ( CLEAR ?auto_53556 ) ( ON ?auto_53561 ?auto_53559 ) ( CLEAR ?auto_53561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53560 ?auto_53557 ?auto_53559 )
      ( MAKE-1PILE ?auto_53555 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53562 - BLOCK
    )
    :vars
    (
      ?auto_53567 - BLOCK
      ?auto_53565 - BLOCK
      ?auto_53566 - BLOCK
      ?auto_53563 - BLOCK
      ?auto_53564 - BLOCK
      ?auto_53568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53567 ?auto_53562 ) ( ON-TABLE ?auto_53562 ) ( not ( = ?auto_53562 ?auto_53567 ) ) ( not ( = ?auto_53562 ?auto_53565 ) ) ( not ( = ?auto_53562 ?auto_53566 ) ) ( not ( = ?auto_53567 ?auto_53565 ) ) ( not ( = ?auto_53567 ?auto_53566 ) ) ( not ( = ?auto_53565 ?auto_53566 ) ) ( not ( = ?auto_53563 ?auto_53564 ) ) ( not ( = ?auto_53563 ?auto_53566 ) ) ( not ( = ?auto_53564 ?auto_53566 ) ) ( not ( = ?auto_53562 ?auto_53564 ) ) ( not ( = ?auto_53562 ?auto_53563 ) ) ( not ( = ?auto_53567 ?auto_53564 ) ) ( not ( = ?auto_53567 ?auto_53563 ) ) ( not ( = ?auto_53565 ?auto_53564 ) ) ( not ( = ?auto_53565 ?auto_53563 ) ) ( ON ?auto_53563 ?auto_53568 ) ( not ( = ?auto_53562 ?auto_53568 ) ) ( not ( = ?auto_53567 ?auto_53568 ) ) ( not ( = ?auto_53565 ?auto_53568 ) ) ( not ( = ?auto_53566 ?auto_53568 ) ) ( not ( = ?auto_53563 ?auto_53568 ) ) ( not ( = ?auto_53564 ?auto_53568 ) ) ( ON ?auto_53564 ?auto_53563 ) ( ON-TABLE ?auto_53568 ) ( ON ?auto_53566 ?auto_53564 ) ( CLEAR ?auto_53566 ) ( HOLDING ?auto_53565 ) ( CLEAR ?auto_53567 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53562 ?auto_53567 ?auto_53565 )
      ( MAKE-1PILE ?auto_53562 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53569 - BLOCK
    )
    :vars
    (
      ?auto_53573 - BLOCK
      ?auto_53572 - BLOCK
      ?auto_53571 - BLOCK
      ?auto_53574 - BLOCK
      ?auto_53570 - BLOCK
      ?auto_53575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53573 ?auto_53569 ) ( ON-TABLE ?auto_53569 ) ( not ( = ?auto_53569 ?auto_53573 ) ) ( not ( = ?auto_53569 ?auto_53572 ) ) ( not ( = ?auto_53569 ?auto_53571 ) ) ( not ( = ?auto_53573 ?auto_53572 ) ) ( not ( = ?auto_53573 ?auto_53571 ) ) ( not ( = ?auto_53572 ?auto_53571 ) ) ( not ( = ?auto_53574 ?auto_53570 ) ) ( not ( = ?auto_53574 ?auto_53571 ) ) ( not ( = ?auto_53570 ?auto_53571 ) ) ( not ( = ?auto_53569 ?auto_53570 ) ) ( not ( = ?auto_53569 ?auto_53574 ) ) ( not ( = ?auto_53573 ?auto_53570 ) ) ( not ( = ?auto_53573 ?auto_53574 ) ) ( not ( = ?auto_53572 ?auto_53570 ) ) ( not ( = ?auto_53572 ?auto_53574 ) ) ( ON ?auto_53574 ?auto_53575 ) ( not ( = ?auto_53569 ?auto_53575 ) ) ( not ( = ?auto_53573 ?auto_53575 ) ) ( not ( = ?auto_53572 ?auto_53575 ) ) ( not ( = ?auto_53571 ?auto_53575 ) ) ( not ( = ?auto_53574 ?auto_53575 ) ) ( not ( = ?auto_53570 ?auto_53575 ) ) ( ON ?auto_53570 ?auto_53574 ) ( ON-TABLE ?auto_53575 ) ( ON ?auto_53571 ?auto_53570 ) ( CLEAR ?auto_53573 ) ( ON ?auto_53572 ?auto_53571 ) ( CLEAR ?auto_53572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53575 ?auto_53574 ?auto_53570 ?auto_53571 )
      ( MAKE-1PILE ?auto_53569 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53590 - BLOCK
    )
    :vars
    (
      ?auto_53595 - BLOCK
      ?auto_53596 - BLOCK
      ?auto_53593 - BLOCK
      ?auto_53591 - BLOCK
      ?auto_53594 - BLOCK
      ?auto_53592 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53590 ?auto_53595 ) ) ( not ( = ?auto_53590 ?auto_53596 ) ) ( not ( = ?auto_53590 ?auto_53593 ) ) ( not ( = ?auto_53595 ?auto_53596 ) ) ( not ( = ?auto_53595 ?auto_53593 ) ) ( not ( = ?auto_53596 ?auto_53593 ) ) ( not ( = ?auto_53591 ?auto_53594 ) ) ( not ( = ?auto_53591 ?auto_53593 ) ) ( not ( = ?auto_53594 ?auto_53593 ) ) ( not ( = ?auto_53590 ?auto_53594 ) ) ( not ( = ?auto_53590 ?auto_53591 ) ) ( not ( = ?auto_53595 ?auto_53594 ) ) ( not ( = ?auto_53595 ?auto_53591 ) ) ( not ( = ?auto_53596 ?auto_53594 ) ) ( not ( = ?auto_53596 ?auto_53591 ) ) ( ON ?auto_53591 ?auto_53592 ) ( not ( = ?auto_53590 ?auto_53592 ) ) ( not ( = ?auto_53595 ?auto_53592 ) ) ( not ( = ?auto_53596 ?auto_53592 ) ) ( not ( = ?auto_53593 ?auto_53592 ) ) ( not ( = ?auto_53591 ?auto_53592 ) ) ( not ( = ?auto_53594 ?auto_53592 ) ) ( ON ?auto_53594 ?auto_53591 ) ( ON-TABLE ?auto_53592 ) ( ON ?auto_53593 ?auto_53594 ) ( ON ?auto_53596 ?auto_53593 ) ( ON ?auto_53595 ?auto_53596 ) ( CLEAR ?auto_53595 ) ( HOLDING ?auto_53590 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53590 ?auto_53595 )
      ( MAKE-1PILE ?auto_53590 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53597 - BLOCK
    )
    :vars
    (
      ?auto_53602 - BLOCK
      ?auto_53598 - BLOCK
      ?auto_53599 - BLOCK
      ?auto_53600 - BLOCK
      ?auto_53603 - BLOCK
      ?auto_53601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53597 ?auto_53602 ) ) ( not ( = ?auto_53597 ?auto_53598 ) ) ( not ( = ?auto_53597 ?auto_53599 ) ) ( not ( = ?auto_53602 ?auto_53598 ) ) ( not ( = ?auto_53602 ?auto_53599 ) ) ( not ( = ?auto_53598 ?auto_53599 ) ) ( not ( = ?auto_53600 ?auto_53603 ) ) ( not ( = ?auto_53600 ?auto_53599 ) ) ( not ( = ?auto_53603 ?auto_53599 ) ) ( not ( = ?auto_53597 ?auto_53603 ) ) ( not ( = ?auto_53597 ?auto_53600 ) ) ( not ( = ?auto_53602 ?auto_53603 ) ) ( not ( = ?auto_53602 ?auto_53600 ) ) ( not ( = ?auto_53598 ?auto_53603 ) ) ( not ( = ?auto_53598 ?auto_53600 ) ) ( ON ?auto_53600 ?auto_53601 ) ( not ( = ?auto_53597 ?auto_53601 ) ) ( not ( = ?auto_53602 ?auto_53601 ) ) ( not ( = ?auto_53598 ?auto_53601 ) ) ( not ( = ?auto_53599 ?auto_53601 ) ) ( not ( = ?auto_53600 ?auto_53601 ) ) ( not ( = ?auto_53603 ?auto_53601 ) ) ( ON ?auto_53603 ?auto_53600 ) ( ON-TABLE ?auto_53601 ) ( ON ?auto_53599 ?auto_53603 ) ( ON ?auto_53598 ?auto_53599 ) ( ON ?auto_53602 ?auto_53598 ) ( ON ?auto_53597 ?auto_53602 ) ( CLEAR ?auto_53597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53601 ?auto_53600 ?auto_53603 ?auto_53599 ?auto_53598 ?auto_53602 )
      ( MAKE-1PILE ?auto_53597 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53609 - BLOCK
      ?auto_53610 - BLOCK
      ?auto_53611 - BLOCK
      ?auto_53612 - BLOCK
      ?auto_53613 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_53613 ) ( CLEAR ?auto_53612 ) ( ON-TABLE ?auto_53609 ) ( ON ?auto_53610 ?auto_53609 ) ( ON ?auto_53611 ?auto_53610 ) ( ON ?auto_53612 ?auto_53611 ) ( not ( = ?auto_53609 ?auto_53610 ) ) ( not ( = ?auto_53609 ?auto_53611 ) ) ( not ( = ?auto_53609 ?auto_53612 ) ) ( not ( = ?auto_53609 ?auto_53613 ) ) ( not ( = ?auto_53610 ?auto_53611 ) ) ( not ( = ?auto_53610 ?auto_53612 ) ) ( not ( = ?auto_53610 ?auto_53613 ) ) ( not ( = ?auto_53611 ?auto_53612 ) ) ( not ( = ?auto_53611 ?auto_53613 ) ) ( not ( = ?auto_53612 ?auto_53613 ) ) )
    :subtasks
    ( ( !STACK ?auto_53613 ?auto_53612 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53614 - BLOCK
      ?auto_53615 - BLOCK
      ?auto_53616 - BLOCK
      ?auto_53617 - BLOCK
      ?auto_53618 - BLOCK
    )
    :vars
    (
      ?auto_53619 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_53617 ) ( ON-TABLE ?auto_53614 ) ( ON ?auto_53615 ?auto_53614 ) ( ON ?auto_53616 ?auto_53615 ) ( ON ?auto_53617 ?auto_53616 ) ( not ( = ?auto_53614 ?auto_53615 ) ) ( not ( = ?auto_53614 ?auto_53616 ) ) ( not ( = ?auto_53614 ?auto_53617 ) ) ( not ( = ?auto_53614 ?auto_53618 ) ) ( not ( = ?auto_53615 ?auto_53616 ) ) ( not ( = ?auto_53615 ?auto_53617 ) ) ( not ( = ?auto_53615 ?auto_53618 ) ) ( not ( = ?auto_53616 ?auto_53617 ) ) ( not ( = ?auto_53616 ?auto_53618 ) ) ( not ( = ?auto_53617 ?auto_53618 ) ) ( ON ?auto_53618 ?auto_53619 ) ( CLEAR ?auto_53618 ) ( HAND-EMPTY ) ( not ( = ?auto_53614 ?auto_53619 ) ) ( not ( = ?auto_53615 ?auto_53619 ) ) ( not ( = ?auto_53616 ?auto_53619 ) ) ( not ( = ?auto_53617 ?auto_53619 ) ) ( not ( = ?auto_53618 ?auto_53619 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53618 ?auto_53619 )
      ( MAKE-5PILE ?auto_53614 ?auto_53615 ?auto_53616 ?auto_53617 ?auto_53618 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53620 - BLOCK
      ?auto_53621 - BLOCK
      ?auto_53622 - BLOCK
      ?auto_53623 - BLOCK
      ?auto_53624 - BLOCK
    )
    :vars
    (
      ?auto_53625 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53620 ) ( ON ?auto_53621 ?auto_53620 ) ( ON ?auto_53622 ?auto_53621 ) ( not ( = ?auto_53620 ?auto_53621 ) ) ( not ( = ?auto_53620 ?auto_53622 ) ) ( not ( = ?auto_53620 ?auto_53623 ) ) ( not ( = ?auto_53620 ?auto_53624 ) ) ( not ( = ?auto_53621 ?auto_53622 ) ) ( not ( = ?auto_53621 ?auto_53623 ) ) ( not ( = ?auto_53621 ?auto_53624 ) ) ( not ( = ?auto_53622 ?auto_53623 ) ) ( not ( = ?auto_53622 ?auto_53624 ) ) ( not ( = ?auto_53623 ?auto_53624 ) ) ( ON ?auto_53624 ?auto_53625 ) ( CLEAR ?auto_53624 ) ( not ( = ?auto_53620 ?auto_53625 ) ) ( not ( = ?auto_53621 ?auto_53625 ) ) ( not ( = ?auto_53622 ?auto_53625 ) ) ( not ( = ?auto_53623 ?auto_53625 ) ) ( not ( = ?auto_53624 ?auto_53625 ) ) ( HOLDING ?auto_53623 ) ( CLEAR ?auto_53622 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53620 ?auto_53621 ?auto_53622 ?auto_53623 )
      ( MAKE-5PILE ?auto_53620 ?auto_53621 ?auto_53622 ?auto_53623 ?auto_53624 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53626 - BLOCK
      ?auto_53627 - BLOCK
      ?auto_53628 - BLOCK
      ?auto_53629 - BLOCK
      ?auto_53630 - BLOCK
    )
    :vars
    (
      ?auto_53631 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53626 ) ( ON ?auto_53627 ?auto_53626 ) ( ON ?auto_53628 ?auto_53627 ) ( not ( = ?auto_53626 ?auto_53627 ) ) ( not ( = ?auto_53626 ?auto_53628 ) ) ( not ( = ?auto_53626 ?auto_53629 ) ) ( not ( = ?auto_53626 ?auto_53630 ) ) ( not ( = ?auto_53627 ?auto_53628 ) ) ( not ( = ?auto_53627 ?auto_53629 ) ) ( not ( = ?auto_53627 ?auto_53630 ) ) ( not ( = ?auto_53628 ?auto_53629 ) ) ( not ( = ?auto_53628 ?auto_53630 ) ) ( not ( = ?auto_53629 ?auto_53630 ) ) ( ON ?auto_53630 ?auto_53631 ) ( not ( = ?auto_53626 ?auto_53631 ) ) ( not ( = ?auto_53627 ?auto_53631 ) ) ( not ( = ?auto_53628 ?auto_53631 ) ) ( not ( = ?auto_53629 ?auto_53631 ) ) ( not ( = ?auto_53630 ?auto_53631 ) ) ( CLEAR ?auto_53628 ) ( ON ?auto_53629 ?auto_53630 ) ( CLEAR ?auto_53629 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53631 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53631 ?auto_53630 )
      ( MAKE-5PILE ?auto_53626 ?auto_53627 ?auto_53628 ?auto_53629 ?auto_53630 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53632 - BLOCK
      ?auto_53633 - BLOCK
      ?auto_53634 - BLOCK
      ?auto_53635 - BLOCK
      ?auto_53636 - BLOCK
    )
    :vars
    (
      ?auto_53637 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53632 ) ( ON ?auto_53633 ?auto_53632 ) ( not ( = ?auto_53632 ?auto_53633 ) ) ( not ( = ?auto_53632 ?auto_53634 ) ) ( not ( = ?auto_53632 ?auto_53635 ) ) ( not ( = ?auto_53632 ?auto_53636 ) ) ( not ( = ?auto_53633 ?auto_53634 ) ) ( not ( = ?auto_53633 ?auto_53635 ) ) ( not ( = ?auto_53633 ?auto_53636 ) ) ( not ( = ?auto_53634 ?auto_53635 ) ) ( not ( = ?auto_53634 ?auto_53636 ) ) ( not ( = ?auto_53635 ?auto_53636 ) ) ( ON ?auto_53636 ?auto_53637 ) ( not ( = ?auto_53632 ?auto_53637 ) ) ( not ( = ?auto_53633 ?auto_53637 ) ) ( not ( = ?auto_53634 ?auto_53637 ) ) ( not ( = ?auto_53635 ?auto_53637 ) ) ( not ( = ?auto_53636 ?auto_53637 ) ) ( ON ?auto_53635 ?auto_53636 ) ( CLEAR ?auto_53635 ) ( ON-TABLE ?auto_53637 ) ( HOLDING ?auto_53634 ) ( CLEAR ?auto_53633 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53632 ?auto_53633 ?auto_53634 )
      ( MAKE-5PILE ?auto_53632 ?auto_53633 ?auto_53634 ?auto_53635 ?auto_53636 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53638 - BLOCK
      ?auto_53639 - BLOCK
      ?auto_53640 - BLOCK
      ?auto_53641 - BLOCK
      ?auto_53642 - BLOCK
    )
    :vars
    (
      ?auto_53643 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53638 ) ( ON ?auto_53639 ?auto_53638 ) ( not ( = ?auto_53638 ?auto_53639 ) ) ( not ( = ?auto_53638 ?auto_53640 ) ) ( not ( = ?auto_53638 ?auto_53641 ) ) ( not ( = ?auto_53638 ?auto_53642 ) ) ( not ( = ?auto_53639 ?auto_53640 ) ) ( not ( = ?auto_53639 ?auto_53641 ) ) ( not ( = ?auto_53639 ?auto_53642 ) ) ( not ( = ?auto_53640 ?auto_53641 ) ) ( not ( = ?auto_53640 ?auto_53642 ) ) ( not ( = ?auto_53641 ?auto_53642 ) ) ( ON ?auto_53642 ?auto_53643 ) ( not ( = ?auto_53638 ?auto_53643 ) ) ( not ( = ?auto_53639 ?auto_53643 ) ) ( not ( = ?auto_53640 ?auto_53643 ) ) ( not ( = ?auto_53641 ?auto_53643 ) ) ( not ( = ?auto_53642 ?auto_53643 ) ) ( ON ?auto_53641 ?auto_53642 ) ( ON-TABLE ?auto_53643 ) ( CLEAR ?auto_53639 ) ( ON ?auto_53640 ?auto_53641 ) ( CLEAR ?auto_53640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53643 ?auto_53642 ?auto_53641 )
      ( MAKE-5PILE ?auto_53638 ?auto_53639 ?auto_53640 ?auto_53641 ?auto_53642 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
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
    ( and ( ON-TABLE ?auto_53644 ) ( not ( = ?auto_53644 ?auto_53645 ) ) ( not ( = ?auto_53644 ?auto_53646 ) ) ( not ( = ?auto_53644 ?auto_53647 ) ) ( not ( = ?auto_53644 ?auto_53648 ) ) ( not ( = ?auto_53645 ?auto_53646 ) ) ( not ( = ?auto_53645 ?auto_53647 ) ) ( not ( = ?auto_53645 ?auto_53648 ) ) ( not ( = ?auto_53646 ?auto_53647 ) ) ( not ( = ?auto_53646 ?auto_53648 ) ) ( not ( = ?auto_53647 ?auto_53648 ) ) ( ON ?auto_53648 ?auto_53649 ) ( not ( = ?auto_53644 ?auto_53649 ) ) ( not ( = ?auto_53645 ?auto_53649 ) ) ( not ( = ?auto_53646 ?auto_53649 ) ) ( not ( = ?auto_53647 ?auto_53649 ) ) ( not ( = ?auto_53648 ?auto_53649 ) ) ( ON ?auto_53647 ?auto_53648 ) ( ON-TABLE ?auto_53649 ) ( ON ?auto_53646 ?auto_53647 ) ( CLEAR ?auto_53646 ) ( HOLDING ?auto_53645 ) ( CLEAR ?auto_53644 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53644 ?auto_53645 )
      ( MAKE-5PILE ?auto_53644 ?auto_53645 ?auto_53646 ?auto_53647 ?auto_53648 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53650 - BLOCK
      ?auto_53651 - BLOCK
      ?auto_53652 - BLOCK
      ?auto_53653 - BLOCK
      ?auto_53654 - BLOCK
    )
    :vars
    (
      ?auto_53655 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53650 ) ( not ( = ?auto_53650 ?auto_53651 ) ) ( not ( = ?auto_53650 ?auto_53652 ) ) ( not ( = ?auto_53650 ?auto_53653 ) ) ( not ( = ?auto_53650 ?auto_53654 ) ) ( not ( = ?auto_53651 ?auto_53652 ) ) ( not ( = ?auto_53651 ?auto_53653 ) ) ( not ( = ?auto_53651 ?auto_53654 ) ) ( not ( = ?auto_53652 ?auto_53653 ) ) ( not ( = ?auto_53652 ?auto_53654 ) ) ( not ( = ?auto_53653 ?auto_53654 ) ) ( ON ?auto_53654 ?auto_53655 ) ( not ( = ?auto_53650 ?auto_53655 ) ) ( not ( = ?auto_53651 ?auto_53655 ) ) ( not ( = ?auto_53652 ?auto_53655 ) ) ( not ( = ?auto_53653 ?auto_53655 ) ) ( not ( = ?auto_53654 ?auto_53655 ) ) ( ON ?auto_53653 ?auto_53654 ) ( ON-TABLE ?auto_53655 ) ( ON ?auto_53652 ?auto_53653 ) ( CLEAR ?auto_53650 ) ( ON ?auto_53651 ?auto_53652 ) ( CLEAR ?auto_53651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53655 ?auto_53654 ?auto_53653 ?auto_53652 )
      ( MAKE-5PILE ?auto_53650 ?auto_53651 ?auto_53652 ?auto_53653 ?auto_53654 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53656 - BLOCK
      ?auto_53657 - BLOCK
      ?auto_53658 - BLOCK
      ?auto_53659 - BLOCK
      ?auto_53660 - BLOCK
    )
    :vars
    (
      ?auto_53661 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53656 ?auto_53657 ) ) ( not ( = ?auto_53656 ?auto_53658 ) ) ( not ( = ?auto_53656 ?auto_53659 ) ) ( not ( = ?auto_53656 ?auto_53660 ) ) ( not ( = ?auto_53657 ?auto_53658 ) ) ( not ( = ?auto_53657 ?auto_53659 ) ) ( not ( = ?auto_53657 ?auto_53660 ) ) ( not ( = ?auto_53658 ?auto_53659 ) ) ( not ( = ?auto_53658 ?auto_53660 ) ) ( not ( = ?auto_53659 ?auto_53660 ) ) ( ON ?auto_53660 ?auto_53661 ) ( not ( = ?auto_53656 ?auto_53661 ) ) ( not ( = ?auto_53657 ?auto_53661 ) ) ( not ( = ?auto_53658 ?auto_53661 ) ) ( not ( = ?auto_53659 ?auto_53661 ) ) ( not ( = ?auto_53660 ?auto_53661 ) ) ( ON ?auto_53659 ?auto_53660 ) ( ON-TABLE ?auto_53661 ) ( ON ?auto_53658 ?auto_53659 ) ( ON ?auto_53657 ?auto_53658 ) ( CLEAR ?auto_53657 ) ( HOLDING ?auto_53656 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53656 )
      ( MAKE-5PILE ?auto_53656 ?auto_53657 ?auto_53658 ?auto_53659 ?auto_53660 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53662 - BLOCK
      ?auto_53663 - BLOCK
      ?auto_53664 - BLOCK
      ?auto_53665 - BLOCK
      ?auto_53666 - BLOCK
    )
    :vars
    (
      ?auto_53667 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53662 ?auto_53663 ) ) ( not ( = ?auto_53662 ?auto_53664 ) ) ( not ( = ?auto_53662 ?auto_53665 ) ) ( not ( = ?auto_53662 ?auto_53666 ) ) ( not ( = ?auto_53663 ?auto_53664 ) ) ( not ( = ?auto_53663 ?auto_53665 ) ) ( not ( = ?auto_53663 ?auto_53666 ) ) ( not ( = ?auto_53664 ?auto_53665 ) ) ( not ( = ?auto_53664 ?auto_53666 ) ) ( not ( = ?auto_53665 ?auto_53666 ) ) ( ON ?auto_53666 ?auto_53667 ) ( not ( = ?auto_53662 ?auto_53667 ) ) ( not ( = ?auto_53663 ?auto_53667 ) ) ( not ( = ?auto_53664 ?auto_53667 ) ) ( not ( = ?auto_53665 ?auto_53667 ) ) ( not ( = ?auto_53666 ?auto_53667 ) ) ( ON ?auto_53665 ?auto_53666 ) ( ON-TABLE ?auto_53667 ) ( ON ?auto_53664 ?auto_53665 ) ( ON ?auto_53663 ?auto_53664 ) ( ON ?auto_53662 ?auto_53663 ) ( CLEAR ?auto_53662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53667 ?auto_53666 ?auto_53665 ?auto_53664 ?auto_53663 )
      ( MAKE-5PILE ?auto_53662 ?auto_53663 ?auto_53664 ?auto_53665 ?auto_53666 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53668 - BLOCK
      ?auto_53669 - BLOCK
      ?auto_53670 - BLOCK
      ?auto_53671 - BLOCK
      ?auto_53672 - BLOCK
    )
    :vars
    (
      ?auto_53673 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53668 ?auto_53669 ) ) ( not ( = ?auto_53668 ?auto_53670 ) ) ( not ( = ?auto_53668 ?auto_53671 ) ) ( not ( = ?auto_53668 ?auto_53672 ) ) ( not ( = ?auto_53669 ?auto_53670 ) ) ( not ( = ?auto_53669 ?auto_53671 ) ) ( not ( = ?auto_53669 ?auto_53672 ) ) ( not ( = ?auto_53670 ?auto_53671 ) ) ( not ( = ?auto_53670 ?auto_53672 ) ) ( not ( = ?auto_53671 ?auto_53672 ) ) ( ON ?auto_53672 ?auto_53673 ) ( not ( = ?auto_53668 ?auto_53673 ) ) ( not ( = ?auto_53669 ?auto_53673 ) ) ( not ( = ?auto_53670 ?auto_53673 ) ) ( not ( = ?auto_53671 ?auto_53673 ) ) ( not ( = ?auto_53672 ?auto_53673 ) ) ( ON ?auto_53671 ?auto_53672 ) ( ON-TABLE ?auto_53673 ) ( ON ?auto_53670 ?auto_53671 ) ( ON ?auto_53669 ?auto_53670 ) ( HOLDING ?auto_53668 ) ( CLEAR ?auto_53669 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53673 ?auto_53672 ?auto_53671 ?auto_53670 ?auto_53669 ?auto_53668 )
      ( MAKE-5PILE ?auto_53668 ?auto_53669 ?auto_53670 ?auto_53671 ?auto_53672 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53674 - BLOCK
      ?auto_53675 - BLOCK
      ?auto_53676 - BLOCK
      ?auto_53677 - BLOCK
      ?auto_53678 - BLOCK
    )
    :vars
    (
      ?auto_53679 - BLOCK
      ?auto_53680 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53674 ?auto_53675 ) ) ( not ( = ?auto_53674 ?auto_53676 ) ) ( not ( = ?auto_53674 ?auto_53677 ) ) ( not ( = ?auto_53674 ?auto_53678 ) ) ( not ( = ?auto_53675 ?auto_53676 ) ) ( not ( = ?auto_53675 ?auto_53677 ) ) ( not ( = ?auto_53675 ?auto_53678 ) ) ( not ( = ?auto_53676 ?auto_53677 ) ) ( not ( = ?auto_53676 ?auto_53678 ) ) ( not ( = ?auto_53677 ?auto_53678 ) ) ( ON ?auto_53678 ?auto_53679 ) ( not ( = ?auto_53674 ?auto_53679 ) ) ( not ( = ?auto_53675 ?auto_53679 ) ) ( not ( = ?auto_53676 ?auto_53679 ) ) ( not ( = ?auto_53677 ?auto_53679 ) ) ( not ( = ?auto_53678 ?auto_53679 ) ) ( ON ?auto_53677 ?auto_53678 ) ( ON-TABLE ?auto_53679 ) ( ON ?auto_53676 ?auto_53677 ) ( ON ?auto_53675 ?auto_53676 ) ( CLEAR ?auto_53675 ) ( ON ?auto_53674 ?auto_53680 ) ( CLEAR ?auto_53674 ) ( HAND-EMPTY ) ( not ( = ?auto_53674 ?auto_53680 ) ) ( not ( = ?auto_53675 ?auto_53680 ) ) ( not ( = ?auto_53676 ?auto_53680 ) ) ( not ( = ?auto_53677 ?auto_53680 ) ) ( not ( = ?auto_53678 ?auto_53680 ) ) ( not ( = ?auto_53679 ?auto_53680 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53674 ?auto_53680 )
      ( MAKE-5PILE ?auto_53674 ?auto_53675 ?auto_53676 ?auto_53677 ?auto_53678 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53681 - BLOCK
      ?auto_53682 - BLOCK
      ?auto_53683 - BLOCK
      ?auto_53684 - BLOCK
      ?auto_53685 - BLOCK
    )
    :vars
    (
      ?auto_53687 - BLOCK
      ?auto_53686 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53681 ?auto_53682 ) ) ( not ( = ?auto_53681 ?auto_53683 ) ) ( not ( = ?auto_53681 ?auto_53684 ) ) ( not ( = ?auto_53681 ?auto_53685 ) ) ( not ( = ?auto_53682 ?auto_53683 ) ) ( not ( = ?auto_53682 ?auto_53684 ) ) ( not ( = ?auto_53682 ?auto_53685 ) ) ( not ( = ?auto_53683 ?auto_53684 ) ) ( not ( = ?auto_53683 ?auto_53685 ) ) ( not ( = ?auto_53684 ?auto_53685 ) ) ( ON ?auto_53685 ?auto_53687 ) ( not ( = ?auto_53681 ?auto_53687 ) ) ( not ( = ?auto_53682 ?auto_53687 ) ) ( not ( = ?auto_53683 ?auto_53687 ) ) ( not ( = ?auto_53684 ?auto_53687 ) ) ( not ( = ?auto_53685 ?auto_53687 ) ) ( ON ?auto_53684 ?auto_53685 ) ( ON-TABLE ?auto_53687 ) ( ON ?auto_53683 ?auto_53684 ) ( ON ?auto_53681 ?auto_53686 ) ( CLEAR ?auto_53681 ) ( not ( = ?auto_53681 ?auto_53686 ) ) ( not ( = ?auto_53682 ?auto_53686 ) ) ( not ( = ?auto_53683 ?auto_53686 ) ) ( not ( = ?auto_53684 ?auto_53686 ) ) ( not ( = ?auto_53685 ?auto_53686 ) ) ( not ( = ?auto_53687 ?auto_53686 ) ) ( HOLDING ?auto_53682 ) ( CLEAR ?auto_53683 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53687 ?auto_53685 ?auto_53684 ?auto_53683 ?auto_53682 )
      ( MAKE-5PILE ?auto_53681 ?auto_53682 ?auto_53683 ?auto_53684 ?auto_53685 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53688 - BLOCK
      ?auto_53689 - BLOCK
      ?auto_53690 - BLOCK
      ?auto_53691 - BLOCK
      ?auto_53692 - BLOCK
    )
    :vars
    (
      ?auto_53694 - BLOCK
      ?auto_53693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53688 ?auto_53689 ) ) ( not ( = ?auto_53688 ?auto_53690 ) ) ( not ( = ?auto_53688 ?auto_53691 ) ) ( not ( = ?auto_53688 ?auto_53692 ) ) ( not ( = ?auto_53689 ?auto_53690 ) ) ( not ( = ?auto_53689 ?auto_53691 ) ) ( not ( = ?auto_53689 ?auto_53692 ) ) ( not ( = ?auto_53690 ?auto_53691 ) ) ( not ( = ?auto_53690 ?auto_53692 ) ) ( not ( = ?auto_53691 ?auto_53692 ) ) ( ON ?auto_53692 ?auto_53694 ) ( not ( = ?auto_53688 ?auto_53694 ) ) ( not ( = ?auto_53689 ?auto_53694 ) ) ( not ( = ?auto_53690 ?auto_53694 ) ) ( not ( = ?auto_53691 ?auto_53694 ) ) ( not ( = ?auto_53692 ?auto_53694 ) ) ( ON ?auto_53691 ?auto_53692 ) ( ON-TABLE ?auto_53694 ) ( ON ?auto_53690 ?auto_53691 ) ( ON ?auto_53688 ?auto_53693 ) ( not ( = ?auto_53688 ?auto_53693 ) ) ( not ( = ?auto_53689 ?auto_53693 ) ) ( not ( = ?auto_53690 ?auto_53693 ) ) ( not ( = ?auto_53691 ?auto_53693 ) ) ( not ( = ?auto_53692 ?auto_53693 ) ) ( not ( = ?auto_53694 ?auto_53693 ) ) ( CLEAR ?auto_53690 ) ( ON ?auto_53689 ?auto_53688 ) ( CLEAR ?auto_53689 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53693 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53693 ?auto_53688 )
      ( MAKE-5PILE ?auto_53688 ?auto_53689 ?auto_53690 ?auto_53691 ?auto_53692 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53695 - BLOCK
      ?auto_53696 - BLOCK
      ?auto_53697 - BLOCK
      ?auto_53698 - BLOCK
      ?auto_53699 - BLOCK
    )
    :vars
    (
      ?auto_53701 - BLOCK
      ?auto_53700 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53695 ?auto_53696 ) ) ( not ( = ?auto_53695 ?auto_53697 ) ) ( not ( = ?auto_53695 ?auto_53698 ) ) ( not ( = ?auto_53695 ?auto_53699 ) ) ( not ( = ?auto_53696 ?auto_53697 ) ) ( not ( = ?auto_53696 ?auto_53698 ) ) ( not ( = ?auto_53696 ?auto_53699 ) ) ( not ( = ?auto_53697 ?auto_53698 ) ) ( not ( = ?auto_53697 ?auto_53699 ) ) ( not ( = ?auto_53698 ?auto_53699 ) ) ( ON ?auto_53699 ?auto_53701 ) ( not ( = ?auto_53695 ?auto_53701 ) ) ( not ( = ?auto_53696 ?auto_53701 ) ) ( not ( = ?auto_53697 ?auto_53701 ) ) ( not ( = ?auto_53698 ?auto_53701 ) ) ( not ( = ?auto_53699 ?auto_53701 ) ) ( ON ?auto_53698 ?auto_53699 ) ( ON-TABLE ?auto_53701 ) ( ON ?auto_53695 ?auto_53700 ) ( not ( = ?auto_53695 ?auto_53700 ) ) ( not ( = ?auto_53696 ?auto_53700 ) ) ( not ( = ?auto_53697 ?auto_53700 ) ) ( not ( = ?auto_53698 ?auto_53700 ) ) ( not ( = ?auto_53699 ?auto_53700 ) ) ( not ( = ?auto_53701 ?auto_53700 ) ) ( ON ?auto_53696 ?auto_53695 ) ( CLEAR ?auto_53696 ) ( ON-TABLE ?auto_53700 ) ( HOLDING ?auto_53697 ) ( CLEAR ?auto_53698 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53701 ?auto_53699 ?auto_53698 ?auto_53697 )
      ( MAKE-5PILE ?auto_53695 ?auto_53696 ?auto_53697 ?auto_53698 ?auto_53699 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53702 - BLOCK
      ?auto_53703 - BLOCK
      ?auto_53704 - BLOCK
      ?auto_53705 - BLOCK
      ?auto_53706 - BLOCK
    )
    :vars
    (
      ?auto_53708 - BLOCK
      ?auto_53707 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53702 ?auto_53703 ) ) ( not ( = ?auto_53702 ?auto_53704 ) ) ( not ( = ?auto_53702 ?auto_53705 ) ) ( not ( = ?auto_53702 ?auto_53706 ) ) ( not ( = ?auto_53703 ?auto_53704 ) ) ( not ( = ?auto_53703 ?auto_53705 ) ) ( not ( = ?auto_53703 ?auto_53706 ) ) ( not ( = ?auto_53704 ?auto_53705 ) ) ( not ( = ?auto_53704 ?auto_53706 ) ) ( not ( = ?auto_53705 ?auto_53706 ) ) ( ON ?auto_53706 ?auto_53708 ) ( not ( = ?auto_53702 ?auto_53708 ) ) ( not ( = ?auto_53703 ?auto_53708 ) ) ( not ( = ?auto_53704 ?auto_53708 ) ) ( not ( = ?auto_53705 ?auto_53708 ) ) ( not ( = ?auto_53706 ?auto_53708 ) ) ( ON ?auto_53705 ?auto_53706 ) ( ON-TABLE ?auto_53708 ) ( ON ?auto_53702 ?auto_53707 ) ( not ( = ?auto_53702 ?auto_53707 ) ) ( not ( = ?auto_53703 ?auto_53707 ) ) ( not ( = ?auto_53704 ?auto_53707 ) ) ( not ( = ?auto_53705 ?auto_53707 ) ) ( not ( = ?auto_53706 ?auto_53707 ) ) ( not ( = ?auto_53708 ?auto_53707 ) ) ( ON ?auto_53703 ?auto_53702 ) ( ON-TABLE ?auto_53707 ) ( CLEAR ?auto_53705 ) ( ON ?auto_53704 ?auto_53703 ) ( CLEAR ?auto_53704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53707 ?auto_53702 ?auto_53703 )
      ( MAKE-5PILE ?auto_53702 ?auto_53703 ?auto_53704 ?auto_53705 ?auto_53706 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53709 - BLOCK
      ?auto_53710 - BLOCK
      ?auto_53711 - BLOCK
      ?auto_53712 - BLOCK
      ?auto_53713 - BLOCK
    )
    :vars
    (
      ?auto_53714 - BLOCK
      ?auto_53715 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53709 ?auto_53710 ) ) ( not ( = ?auto_53709 ?auto_53711 ) ) ( not ( = ?auto_53709 ?auto_53712 ) ) ( not ( = ?auto_53709 ?auto_53713 ) ) ( not ( = ?auto_53710 ?auto_53711 ) ) ( not ( = ?auto_53710 ?auto_53712 ) ) ( not ( = ?auto_53710 ?auto_53713 ) ) ( not ( = ?auto_53711 ?auto_53712 ) ) ( not ( = ?auto_53711 ?auto_53713 ) ) ( not ( = ?auto_53712 ?auto_53713 ) ) ( ON ?auto_53713 ?auto_53714 ) ( not ( = ?auto_53709 ?auto_53714 ) ) ( not ( = ?auto_53710 ?auto_53714 ) ) ( not ( = ?auto_53711 ?auto_53714 ) ) ( not ( = ?auto_53712 ?auto_53714 ) ) ( not ( = ?auto_53713 ?auto_53714 ) ) ( ON-TABLE ?auto_53714 ) ( ON ?auto_53709 ?auto_53715 ) ( not ( = ?auto_53709 ?auto_53715 ) ) ( not ( = ?auto_53710 ?auto_53715 ) ) ( not ( = ?auto_53711 ?auto_53715 ) ) ( not ( = ?auto_53712 ?auto_53715 ) ) ( not ( = ?auto_53713 ?auto_53715 ) ) ( not ( = ?auto_53714 ?auto_53715 ) ) ( ON ?auto_53710 ?auto_53709 ) ( ON-TABLE ?auto_53715 ) ( ON ?auto_53711 ?auto_53710 ) ( CLEAR ?auto_53711 ) ( HOLDING ?auto_53712 ) ( CLEAR ?auto_53713 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53714 ?auto_53713 ?auto_53712 )
      ( MAKE-5PILE ?auto_53709 ?auto_53710 ?auto_53711 ?auto_53712 ?auto_53713 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53716 - BLOCK
      ?auto_53717 - BLOCK
      ?auto_53718 - BLOCK
      ?auto_53719 - BLOCK
      ?auto_53720 - BLOCK
    )
    :vars
    (
      ?auto_53721 - BLOCK
      ?auto_53722 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53716 ?auto_53717 ) ) ( not ( = ?auto_53716 ?auto_53718 ) ) ( not ( = ?auto_53716 ?auto_53719 ) ) ( not ( = ?auto_53716 ?auto_53720 ) ) ( not ( = ?auto_53717 ?auto_53718 ) ) ( not ( = ?auto_53717 ?auto_53719 ) ) ( not ( = ?auto_53717 ?auto_53720 ) ) ( not ( = ?auto_53718 ?auto_53719 ) ) ( not ( = ?auto_53718 ?auto_53720 ) ) ( not ( = ?auto_53719 ?auto_53720 ) ) ( ON ?auto_53720 ?auto_53721 ) ( not ( = ?auto_53716 ?auto_53721 ) ) ( not ( = ?auto_53717 ?auto_53721 ) ) ( not ( = ?auto_53718 ?auto_53721 ) ) ( not ( = ?auto_53719 ?auto_53721 ) ) ( not ( = ?auto_53720 ?auto_53721 ) ) ( ON-TABLE ?auto_53721 ) ( ON ?auto_53716 ?auto_53722 ) ( not ( = ?auto_53716 ?auto_53722 ) ) ( not ( = ?auto_53717 ?auto_53722 ) ) ( not ( = ?auto_53718 ?auto_53722 ) ) ( not ( = ?auto_53719 ?auto_53722 ) ) ( not ( = ?auto_53720 ?auto_53722 ) ) ( not ( = ?auto_53721 ?auto_53722 ) ) ( ON ?auto_53717 ?auto_53716 ) ( ON-TABLE ?auto_53722 ) ( ON ?auto_53718 ?auto_53717 ) ( CLEAR ?auto_53720 ) ( ON ?auto_53719 ?auto_53718 ) ( CLEAR ?auto_53719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53722 ?auto_53716 ?auto_53717 ?auto_53718 )
      ( MAKE-5PILE ?auto_53716 ?auto_53717 ?auto_53718 ?auto_53719 ?auto_53720 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53723 - BLOCK
      ?auto_53724 - BLOCK
      ?auto_53725 - BLOCK
      ?auto_53726 - BLOCK
      ?auto_53727 - BLOCK
    )
    :vars
    (
      ?auto_53729 - BLOCK
      ?auto_53728 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53723 ?auto_53724 ) ) ( not ( = ?auto_53723 ?auto_53725 ) ) ( not ( = ?auto_53723 ?auto_53726 ) ) ( not ( = ?auto_53723 ?auto_53727 ) ) ( not ( = ?auto_53724 ?auto_53725 ) ) ( not ( = ?auto_53724 ?auto_53726 ) ) ( not ( = ?auto_53724 ?auto_53727 ) ) ( not ( = ?auto_53725 ?auto_53726 ) ) ( not ( = ?auto_53725 ?auto_53727 ) ) ( not ( = ?auto_53726 ?auto_53727 ) ) ( not ( = ?auto_53723 ?auto_53729 ) ) ( not ( = ?auto_53724 ?auto_53729 ) ) ( not ( = ?auto_53725 ?auto_53729 ) ) ( not ( = ?auto_53726 ?auto_53729 ) ) ( not ( = ?auto_53727 ?auto_53729 ) ) ( ON-TABLE ?auto_53729 ) ( ON ?auto_53723 ?auto_53728 ) ( not ( = ?auto_53723 ?auto_53728 ) ) ( not ( = ?auto_53724 ?auto_53728 ) ) ( not ( = ?auto_53725 ?auto_53728 ) ) ( not ( = ?auto_53726 ?auto_53728 ) ) ( not ( = ?auto_53727 ?auto_53728 ) ) ( not ( = ?auto_53729 ?auto_53728 ) ) ( ON ?auto_53724 ?auto_53723 ) ( ON-TABLE ?auto_53728 ) ( ON ?auto_53725 ?auto_53724 ) ( ON ?auto_53726 ?auto_53725 ) ( CLEAR ?auto_53726 ) ( HOLDING ?auto_53727 ) ( CLEAR ?auto_53729 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53729 ?auto_53727 )
      ( MAKE-5PILE ?auto_53723 ?auto_53724 ?auto_53725 ?auto_53726 ?auto_53727 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53730 - BLOCK
      ?auto_53731 - BLOCK
      ?auto_53732 - BLOCK
      ?auto_53733 - BLOCK
      ?auto_53734 - BLOCK
    )
    :vars
    (
      ?auto_53736 - BLOCK
      ?auto_53735 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53730 ?auto_53731 ) ) ( not ( = ?auto_53730 ?auto_53732 ) ) ( not ( = ?auto_53730 ?auto_53733 ) ) ( not ( = ?auto_53730 ?auto_53734 ) ) ( not ( = ?auto_53731 ?auto_53732 ) ) ( not ( = ?auto_53731 ?auto_53733 ) ) ( not ( = ?auto_53731 ?auto_53734 ) ) ( not ( = ?auto_53732 ?auto_53733 ) ) ( not ( = ?auto_53732 ?auto_53734 ) ) ( not ( = ?auto_53733 ?auto_53734 ) ) ( not ( = ?auto_53730 ?auto_53736 ) ) ( not ( = ?auto_53731 ?auto_53736 ) ) ( not ( = ?auto_53732 ?auto_53736 ) ) ( not ( = ?auto_53733 ?auto_53736 ) ) ( not ( = ?auto_53734 ?auto_53736 ) ) ( ON-TABLE ?auto_53736 ) ( ON ?auto_53730 ?auto_53735 ) ( not ( = ?auto_53730 ?auto_53735 ) ) ( not ( = ?auto_53731 ?auto_53735 ) ) ( not ( = ?auto_53732 ?auto_53735 ) ) ( not ( = ?auto_53733 ?auto_53735 ) ) ( not ( = ?auto_53734 ?auto_53735 ) ) ( not ( = ?auto_53736 ?auto_53735 ) ) ( ON ?auto_53731 ?auto_53730 ) ( ON-TABLE ?auto_53735 ) ( ON ?auto_53732 ?auto_53731 ) ( ON ?auto_53733 ?auto_53732 ) ( CLEAR ?auto_53736 ) ( ON ?auto_53734 ?auto_53733 ) ( CLEAR ?auto_53734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53735 ?auto_53730 ?auto_53731 ?auto_53732 ?auto_53733 )
      ( MAKE-5PILE ?auto_53730 ?auto_53731 ?auto_53732 ?auto_53733 ?auto_53734 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53737 - BLOCK
      ?auto_53738 - BLOCK
      ?auto_53739 - BLOCK
      ?auto_53740 - BLOCK
      ?auto_53741 - BLOCK
    )
    :vars
    (
      ?auto_53743 - BLOCK
      ?auto_53742 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53737 ?auto_53738 ) ) ( not ( = ?auto_53737 ?auto_53739 ) ) ( not ( = ?auto_53737 ?auto_53740 ) ) ( not ( = ?auto_53737 ?auto_53741 ) ) ( not ( = ?auto_53738 ?auto_53739 ) ) ( not ( = ?auto_53738 ?auto_53740 ) ) ( not ( = ?auto_53738 ?auto_53741 ) ) ( not ( = ?auto_53739 ?auto_53740 ) ) ( not ( = ?auto_53739 ?auto_53741 ) ) ( not ( = ?auto_53740 ?auto_53741 ) ) ( not ( = ?auto_53737 ?auto_53743 ) ) ( not ( = ?auto_53738 ?auto_53743 ) ) ( not ( = ?auto_53739 ?auto_53743 ) ) ( not ( = ?auto_53740 ?auto_53743 ) ) ( not ( = ?auto_53741 ?auto_53743 ) ) ( ON ?auto_53737 ?auto_53742 ) ( not ( = ?auto_53737 ?auto_53742 ) ) ( not ( = ?auto_53738 ?auto_53742 ) ) ( not ( = ?auto_53739 ?auto_53742 ) ) ( not ( = ?auto_53740 ?auto_53742 ) ) ( not ( = ?auto_53741 ?auto_53742 ) ) ( not ( = ?auto_53743 ?auto_53742 ) ) ( ON ?auto_53738 ?auto_53737 ) ( ON-TABLE ?auto_53742 ) ( ON ?auto_53739 ?auto_53738 ) ( ON ?auto_53740 ?auto_53739 ) ( ON ?auto_53741 ?auto_53740 ) ( CLEAR ?auto_53741 ) ( HOLDING ?auto_53743 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53743 )
      ( MAKE-5PILE ?auto_53737 ?auto_53738 ?auto_53739 ?auto_53740 ?auto_53741 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53744 - BLOCK
      ?auto_53745 - BLOCK
      ?auto_53746 - BLOCK
      ?auto_53747 - BLOCK
      ?auto_53748 - BLOCK
    )
    :vars
    (
      ?auto_53750 - BLOCK
      ?auto_53749 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53744 ?auto_53745 ) ) ( not ( = ?auto_53744 ?auto_53746 ) ) ( not ( = ?auto_53744 ?auto_53747 ) ) ( not ( = ?auto_53744 ?auto_53748 ) ) ( not ( = ?auto_53745 ?auto_53746 ) ) ( not ( = ?auto_53745 ?auto_53747 ) ) ( not ( = ?auto_53745 ?auto_53748 ) ) ( not ( = ?auto_53746 ?auto_53747 ) ) ( not ( = ?auto_53746 ?auto_53748 ) ) ( not ( = ?auto_53747 ?auto_53748 ) ) ( not ( = ?auto_53744 ?auto_53750 ) ) ( not ( = ?auto_53745 ?auto_53750 ) ) ( not ( = ?auto_53746 ?auto_53750 ) ) ( not ( = ?auto_53747 ?auto_53750 ) ) ( not ( = ?auto_53748 ?auto_53750 ) ) ( ON ?auto_53744 ?auto_53749 ) ( not ( = ?auto_53744 ?auto_53749 ) ) ( not ( = ?auto_53745 ?auto_53749 ) ) ( not ( = ?auto_53746 ?auto_53749 ) ) ( not ( = ?auto_53747 ?auto_53749 ) ) ( not ( = ?auto_53748 ?auto_53749 ) ) ( not ( = ?auto_53750 ?auto_53749 ) ) ( ON ?auto_53745 ?auto_53744 ) ( ON-TABLE ?auto_53749 ) ( ON ?auto_53746 ?auto_53745 ) ( ON ?auto_53747 ?auto_53746 ) ( ON ?auto_53748 ?auto_53747 ) ( ON ?auto_53750 ?auto_53748 ) ( CLEAR ?auto_53750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53749 ?auto_53744 ?auto_53745 ?auto_53746 ?auto_53747 ?auto_53748 )
      ( MAKE-5PILE ?auto_53744 ?auto_53745 ?auto_53746 ?auto_53747 ?auto_53748 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53757 - BLOCK
      ?auto_53758 - BLOCK
      ?auto_53759 - BLOCK
      ?auto_53760 - BLOCK
      ?auto_53761 - BLOCK
      ?auto_53762 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_53762 ) ( CLEAR ?auto_53761 ) ( ON-TABLE ?auto_53757 ) ( ON ?auto_53758 ?auto_53757 ) ( ON ?auto_53759 ?auto_53758 ) ( ON ?auto_53760 ?auto_53759 ) ( ON ?auto_53761 ?auto_53760 ) ( not ( = ?auto_53757 ?auto_53758 ) ) ( not ( = ?auto_53757 ?auto_53759 ) ) ( not ( = ?auto_53757 ?auto_53760 ) ) ( not ( = ?auto_53757 ?auto_53761 ) ) ( not ( = ?auto_53757 ?auto_53762 ) ) ( not ( = ?auto_53758 ?auto_53759 ) ) ( not ( = ?auto_53758 ?auto_53760 ) ) ( not ( = ?auto_53758 ?auto_53761 ) ) ( not ( = ?auto_53758 ?auto_53762 ) ) ( not ( = ?auto_53759 ?auto_53760 ) ) ( not ( = ?auto_53759 ?auto_53761 ) ) ( not ( = ?auto_53759 ?auto_53762 ) ) ( not ( = ?auto_53760 ?auto_53761 ) ) ( not ( = ?auto_53760 ?auto_53762 ) ) ( not ( = ?auto_53761 ?auto_53762 ) ) )
    :subtasks
    ( ( !STACK ?auto_53762 ?auto_53761 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53763 - BLOCK
      ?auto_53764 - BLOCK
      ?auto_53765 - BLOCK
      ?auto_53766 - BLOCK
      ?auto_53767 - BLOCK
      ?auto_53768 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_53767 ) ( ON-TABLE ?auto_53763 ) ( ON ?auto_53764 ?auto_53763 ) ( ON ?auto_53765 ?auto_53764 ) ( ON ?auto_53766 ?auto_53765 ) ( ON ?auto_53767 ?auto_53766 ) ( not ( = ?auto_53763 ?auto_53764 ) ) ( not ( = ?auto_53763 ?auto_53765 ) ) ( not ( = ?auto_53763 ?auto_53766 ) ) ( not ( = ?auto_53763 ?auto_53767 ) ) ( not ( = ?auto_53763 ?auto_53768 ) ) ( not ( = ?auto_53764 ?auto_53765 ) ) ( not ( = ?auto_53764 ?auto_53766 ) ) ( not ( = ?auto_53764 ?auto_53767 ) ) ( not ( = ?auto_53764 ?auto_53768 ) ) ( not ( = ?auto_53765 ?auto_53766 ) ) ( not ( = ?auto_53765 ?auto_53767 ) ) ( not ( = ?auto_53765 ?auto_53768 ) ) ( not ( = ?auto_53766 ?auto_53767 ) ) ( not ( = ?auto_53766 ?auto_53768 ) ) ( not ( = ?auto_53767 ?auto_53768 ) ) ( ON-TABLE ?auto_53768 ) ( CLEAR ?auto_53768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_53768 )
      ( MAKE-6PILE ?auto_53763 ?auto_53764 ?auto_53765 ?auto_53766 ?auto_53767 ?auto_53768 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53769 - BLOCK
      ?auto_53770 - BLOCK
      ?auto_53771 - BLOCK
      ?auto_53772 - BLOCK
      ?auto_53773 - BLOCK
      ?auto_53774 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53769 ) ( ON ?auto_53770 ?auto_53769 ) ( ON ?auto_53771 ?auto_53770 ) ( ON ?auto_53772 ?auto_53771 ) ( not ( = ?auto_53769 ?auto_53770 ) ) ( not ( = ?auto_53769 ?auto_53771 ) ) ( not ( = ?auto_53769 ?auto_53772 ) ) ( not ( = ?auto_53769 ?auto_53773 ) ) ( not ( = ?auto_53769 ?auto_53774 ) ) ( not ( = ?auto_53770 ?auto_53771 ) ) ( not ( = ?auto_53770 ?auto_53772 ) ) ( not ( = ?auto_53770 ?auto_53773 ) ) ( not ( = ?auto_53770 ?auto_53774 ) ) ( not ( = ?auto_53771 ?auto_53772 ) ) ( not ( = ?auto_53771 ?auto_53773 ) ) ( not ( = ?auto_53771 ?auto_53774 ) ) ( not ( = ?auto_53772 ?auto_53773 ) ) ( not ( = ?auto_53772 ?auto_53774 ) ) ( not ( = ?auto_53773 ?auto_53774 ) ) ( ON-TABLE ?auto_53774 ) ( CLEAR ?auto_53774 ) ( HOLDING ?auto_53773 ) ( CLEAR ?auto_53772 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53769 ?auto_53770 ?auto_53771 ?auto_53772 ?auto_53773 )
      ( MAKE-6PILE ?auto_53769 ?auto_53770 ?auto_53771 ?auto_53772 ?auto_53773 ?auto_53774 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53775 - BLOCK
      ?auto_53776 - BLOCK
      ?auto_53777 - BLOCK
      ?auto_53778 - BLOCK
      ?auto_53779 - BLOCK
      ?auto_53780 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53775 ) ( ON ?auto_53776 ?auto_53775 ) ( ON ?auto_53777 ?auto_53776 ) ( ON ?auto_53778 ?auto_53777 ) ( not ( = ?auto_53775 ?auto_53776 ) ) ( not ( = ?auto_53775 ?auto_53777 ) ) ( not ( = ?auto_53775 ?auto_53778 ) ) ( not ( = ?auto_53775 ?auto_53779 ) ) ( not ( = ?auto_53775 ?auto_53780 ) ) ( not ( = ?auto_53776 ?auto_53777 ) ) ( not ( = ?auto_53776 ?auto_53778 ) ) ( not ( = ?auto_53776 ?auto_53779 ) ) ( not ( = ?auto_53776 ?auto_53780 ) ) ( not ( = ?auto_53777 ?auto_53778 ) ) ( not ( = ?auto_53777 ?auto_53779 ) ) ( not ( = ?auto_53777 ?auto_53780 ) ) ( not ( = ?auto_53778 ?auto_53779 ) ) ( not ( = ?auto_53778 ?auto_53780 ) ) ( not ( = ?auto_53779 ?auto_53780 ) ) ( ON-TABLE ?auto_53780 ) ( CLEAR ?auto_53778 ) ( ON ?auto_53779 ?auto_53780 ) ( CLEAR ?auto_53779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53780 )
      ( MAKE-6PILE ?auto_53775 ?auto_53776 ?auto_53777 ?auto_53778 ?auto_53779 ?auto_53780 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53781 - BLOCK
      ?auto_53782 - BLOCK
      ?auto_53783 - BLOCK
      ?auto_53784 - BLOCK
      ?auto_53785 - BLOCK
      ?auto_53786 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53781 ) ( ON ?auto_53782 ?auto_53781 ) ( ON ?auto_53783 ?auto_53782 ) ( not ( = ?auto_53781 ?auto_53782 ) ) ( not ( = ?auto_53781 ?auto_53783 ) ) ( not ( = ?auto_53781 ?auto_53784 ) ) ( not ( = ?auto_53781 ?auto_53785 ) ) ( not ( = ?auto_53781 ?auto_53786 ) ) ( not ( = ?auto_53782 ?auto_53783 ) ) ( not ( = ?auto_53782 ?auto_53784 ) ) ( not ( = ?auto_53782 ?auto_53785 ) ) ( not ( = ?auto_53782 ?auto_53786 ) ) ( not ( = ?auto_53783 ?auto_53784 ) ) ( not ( = ?auto_53783 ?auto_53785 ) ) ( not ( = ?auto_53783 ?auto_53786 ) ) ( not ( = ?auto_53784 ?auto_53785 ) ) ( not ( = ?auto_53784 ?auto_53786 ) ) ( not ( = ?auto_53785 ?auto_53786 ) ) ( ON-TABLE ?auto_53786 ) ( ON ?auto_53785 ?auto_53786 ) ( CLEAR ?auto_53785 ) ( HOLDING ?auto_53784 ) ( CLEAR ?auto_53783 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53781 ?auto_53782 ?auto_53783 ?auto_53784 )
      ( MAKE-6PILE ?auto_53781 ?auto_53782 ?auto_53783 ?auto_53784 ?auto_53785 ?auto_53786 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53787 - BLOCK
      ?auto_53788 - BLOCK
      ?auto_53789 - BLOCK
      ?auto_53790 - BLOCK
      ?auto_53791 - BLOCK
      ?auto_53792 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53787 ) ( ON ?auto_53788 ?auto_53787 ) ( ON ?auto_53789 ?auto_53788 ) ( not ( = ?auto_53787 ?auto_53788 ) ) ( not ( = ?auto_53787 ?auto_53789 ) ) ( not ( = ?auto_53787 ?auto_53790 ) ) ( not ( = ?auto_53787 ?auto_53791 ) ) ( not ( = ?auto_53787 ?auto_53792 ) ) ( not ( = ?auto_53788 ?auto_53789 ) ) ( not ( = ?auto_53788 ?auto_53790 ) ) ( not ( = ?auto_53788 ?auto_53791 ) ) ( not ( = ?auto_53788 ?auto_53792 ) ) ( not ( = ?auto_53789 ?auto_53790 ) ) ( not ( = ?auto_53789 ?auto_53791 ) ) ( not ( = ?auto_53789 ?auto_53792 ) ) ( not ( = ?auto_53790 ?auto_53791 ) ) ( not ( = ?auto_53790 ?auto_53792 ) ) ( not ( = ?auto_53791 ?auto_53792 ) ) ( ON-TABLE ?auto_53792 ) ( ON ?auto_53791 ?auto_53792 ) ( CLEAR ?auto_53789 ) ( ON ?auto_53790 ?auto_53791 ) ( CLEAR ?auto_53790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53792 ?auto_53791 )
      ( MAKE-6PILE ?auto_53787 ?auto_53788 ?auto_53789 ?auto_53790 ?auto_53791 ?auto_53792 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53793 - BLOCK
      ?auto_53794 - BLOCK
      ?auto_53795 - BLOCK
      ?auto_53796 - BLOCK
      ?auto_53797 - BLOCK
      ?auto_53798 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53793 ) ( ON ?auto_53794 ?auto_53793 ) ( not ( = ?auto_53793 ?auto_53794 ) ) ( not ( = ?auto_53793 ?auto_53795 ) ) ( not ( = ?auto_53793 ?auto_53796 ) ) ( not ( = ?auto_53793 ?auto_53797 ) ) ( not ( = ?auto_53793 ?auto_53798 ) ) ( not ( = ?auto_53794 ?auto_53795 ) ) ( not ( = ?auto_53794 ?auto_53796 ) ) ( not ( = ?auto_53794 ?auto_53797 ) ) ( not ( = ?auto_53794 ?auto_53798 ) ) ( not ( = ?auto_53795 ?auto_53796 ) ) ( not ( = ?auto_53795 ?auto_53797 ) ) ( not ( = ?auto_53795 ?auto_53798 ) ) ( not ( = ?auto_53796 ?auto_53797 ) ) ( not ( = ?auto_53796 ?auto_53798 ) ) ( not ( = ?auto_53797 ?auto_53798 ) ) ( ON-TABLE ?auto_53798 ) ( ON ?auto_53797 ?auto_53798 ) ( ON ?auto_53796 ?auto_53797 ) ( CLEAR ?auto_53796 ) ( HOLDING ?auto_53795 ) ( CLEAR ?auto_53794 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53793 ?auto_53794 ?auto_53795 )
      ( MAKE-6PILE ?auto_53793 ?auto_53794 ?auto_53795 ?auto_53796 ?auto_53797 ?auto_53798 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53799 - BLOCK
      ?auto_53800 - BLOCK
      ?auto_53801 - BLOCK
      ?auto_53802 - BLOCK
      ?auto_53803 - BLOCK
      ?auto_53804 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53799 ) ( ON ?auto_53800 ?auto_53799 ) ( not ( = ?auto_53799 ?auto_53800 ) ) ( not ( = ?auto_53799 ?auto_53801 ) ) ( not ( = ?auto_53799 ?auto_53802 ) ) ( not ( = ?auto_53799 ?auto_53803 ) ) ( not ( = ?auto_53799 ?auto_53804 ) ) ( not ( = ?auto_53800 ?auto_53801 ) ) ( not ( = ?auto_53800 ?auto_53802 ) ) ( not ( = ?auto_53800 ?auto_53803 ) ) ( not ( = ?auto_53800 ?auto_53804 ) ) ( not ( = ?auto_53801 ?auto_53802 ) ) ( not ( = ?auto_53801 ?auto_53803 ) ) ( not ( = ?auto_53801 ?auto_53804 ) ) ( not ( = ?auto_53802 ?auto_53803 ) ) ( not ( = ?auto_53802 ?auto_53804 ) ) ( not ( = ?auto_53803 ?auto_53804 ) ) ( ON-TABLE ?auto_53804 ) ( ON ?auto_53803 ?auto_53804 ) ( ON ?auto_53802 ?auto_53803 ) ( CLEAR ?auto_53800 ) ( ON ?auto_53801 ?auto_53802 ) ( CLEAR ?auto_53801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53804 ?auto_53803 ?auto_53802 )
      ( MAKE-6PILE ?auto_53799 ?auto_53800 ?auto_53801 ?auto_53802 ?auto_53803 ?auto_53804 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53805 - BLOCK
      ?auto_53806 - BLOCK
      ?auto_53807 - BLOCK
      ?auto_53808 - BLOCK
      ?auto_53809 - BLOCK
      ?auto_53810 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53805 ) ( not ( = ?auto_53805 ?auto_53806 ) ) ( not ( = ?auto_53805 ?auto_53807 ) ) ( not ( = ?auto_53805 ?auto_53808 ) ) ( not ( = ?auto_53805 ?auto_53809 ) ) ( not ( = ?auto_53805 ?auto_53810 ) ) ( not ( = ?auto_53806 ?auto_53807 ) ) ( not ( = ?auto_53806 ?auto_53808 ) ) ( not ( = ?auto_53806 ?auto_53809 ) ) ( not ( = ?auto_53806 ?auto_53810 ) ) ( not ( = ?auto_53807 ?auto_53808 ) ) ( not ( = ?auto_53807 ?auto_53809 ) ) ( not ( = ?auto_53807 ?auto_53810 ) ) ( not ( = ?auto_53808 ?auto_53809 ) ) ( not ( = ?auto_53808 ?auto_53810 ) ) ( not ( = ?auto_53809 ?auto_53810 ) ) ( ON-TABLE ?auto_53810 ) ( ON ?auto_53809 ?auto_53810 ) ( ON ?auto_53808 ?auto_53809 ) ( ON ?auto_53807 ?auto_53808 ) ( CLEAR ?auto_53807 ) ( HOLDING ?auto_53806 ) ( CLEAR ?auto_53805 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53805 ?auto_53806 )
      ( MAKE-6PILE ?auto_53805 ?auto_53806 ?auto_53807 ?auto_53808 ?auto_53809 ?auto_53810 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53811 - BLOCK
      ?auto_53812 - BLOCK
      ?auto_53813 - BLOCK
      ?auto_53814 - BLOCK
      ?auto_53815 - BLOCK
      ?auto_53816 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53811 ) ( not ( = ?auto_53811 ?auto_53812 ) ) ( not ( = ?auto_53811 ?auto_53813 ) ) ( not ( = ?auto_53811 ?auto_53814 ) ) ( not ( = ?auto_53811 ?auto_53815 ) ) ( not ( = ?auto_53811 ?auto_53816 ) ) ( not ( = ?auto_53812 ?auto_53813 ) ) ( not ( = ?auto_53812 ?auto_53814 ) ) ( not ( = ?auto_53812 ?auto_53815 ) ) ( not ( = ?auto_53812 ?auto_53816 ) ) ( not ( = ?auto_53813 ?auto_53814 ) ) ( not ( = ?auto_53813 ?auto_53815 ) ) ( not ( = ?auto_53813 ?auto_53816 ) ) ( not ( = ?auto_53814 ?auto_53815 ) ) ( not ( = ?auto_53814 ?auto_53816 ) ) ( not ( = ?auto_53815 ?auto_53816 ) ) ( ON-TABLE ?auto_53816 ) ( ON ?auto_53815 ?auto_53816 ) ( ON ?auto_53814 ?auto_53815 ) ( ON ?auto_53813 ?auto_53814 ) ( CLEAR ?auto_53811 ) ( ON ?auto_53812 ?auto_53813 ) ( CLEAR ?auto_53812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53816 ?auto_53815 ?auto_53814 ?auto_53813 )
      ( MAKE-6PILE ?auto_53811 ?auto_53812 ?auto_53813 ?auto_53814 ?auto_53815 ?auto_53816 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53817 - BLOCK
      ?auto_53818 - BLOCK
      ?auto_53819 - BLOCK
      ?auto_53820 - BLOCK
      ?auto_53821 - BLOCK
      ?auto_53822 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53817 ?auto_53818 ) ) ( not ( = ?auto_53817 ?auto_53819 ) ) ( not ( = ?auto_53817 ?auto_53820 ) ) ( not ( = ?auto_53817 ?auto_53821 ) ) ( not ( = ?auto_53817 ?auto_53822 ) ) ( not ( = ?auto_53818 ?auto_53819 ) ) ( not ( = ?auto_53818 ?auto_53820 ) ) ( not ( = ?auto_53818 ?auto_53821 ) ) ( not ( = ?auto_53818 ?auto_53822 ) ) ( not ( = ?auto_53819 ?auto_53820 ) ) ( not ( = ?auto_53819 ?auto_53821 ) ) ( not ( = ?auto_53819 ?auto_53822 ) ) ( not ( = ?auto_53820 ?auto_53821 ) ) ( not ( = ?auto_53820 ?auto_53822 ) ) ( not ( = ?auto_53821 ?auto_53822 ) ) ( ON-TABLE ?auto_53822 ) ( ON ?auto_53821 ?auto_53822 ) ( ON ?auto_53820 ?auto_53821 ) ( ON ?auto_53819 ?auto_53820 ) ( ON ?auto_53818 ?auto_53819 ) ( CLEAR ?auto_53818 ) ( HOLDING ?auto_53817 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53817 )
      ( MAKE-6PILE ?auto_53817 ?auto_53818 ?auto_53819 ?auto_53820 ?auto_53821 ?auto_53822 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53823 - BLOCK
      ?auto_53824 - BLOCK
      ?auto_53825 - BLOCK
      ?auto_53826 - BLOCK
      ?auto_53827 - BLOCK
      ?auto_53828 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53823 ?auto_53824 ) ) ( not ( = ?auto_53823 ?auto_53825 ) ) ( not ( = ?auto_53823 ?auto_53826 ) ) ( not ( = ?auto_53823 ?auto_53827 ) ) ( not ( = ?auto_53823 ?auto_53828 ) ) ( not ( = ?auto_53824 ?auto_53825 ) ) ( not ( = ?auto_53824 ?auto_53826 ) ) ( not ( = ?auto_53824 ?auto_53827 ) ) ( not ( = ?auto_53824 ?auto_53828 ) ) ( not ( = ?auto_53825 ?auto_53826 ) ) ( not ( = ?auto_53825 ?auto_53827 ) ) ( not ( = ?auto_53825 ?auto_53828 ) ) ( not ( = ?auto_53826 ?auto_53827 ) ) ( not ( = ?auto_53826 ?auto_53828 ) ) ( not ( = ?auto_53827 ?auto_53828 ) ) ( ON-TABLE ?auto_53828 ) ( ON ?auto_53827 ?auto_53828 ) ( ON ?auto_53826 ?auto_53827 ) ( ON ?auto_53825 ?auto_53826 ) ( ON ?auto_53824 ?auto_53825 ) ( ON ?auto_53823 ?auto_53824 ) ( CLEAR ?auto_53823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53828 ?auto_53827 ?auto_53826 ?auto_53825 ?auto_53824 )
      ( MAKE-6PILE ?auto_53823 ?auto_53824 ?auto_53825 ?auto_53826 ?auto_53827 ?auto_53828 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53829 - BLOCK
      ?auto_53830 - BLOCK
      ?auto_53831 - BLOCK
      ?auto_53832 - BLOCK
      ?auto_53833 - BLOCK
      ?auto_53834 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53829 ?auto_53830 ) ) ( not ( = ?auto_53829 ?auto_53831 ) ) ( not ( = ?auto_53829 ?auto_53832 ) ) ( not ( = ?auto_53829 ?auto_53833 ) ) ( not ( = ?auto_53829 ?auto_53834 ) ) ( not ( = ?auto_53830 ?auto_53831 ) ) ( not ( = ?auto_53830 ?auto_53832 ) ) ( not ( = ?auto_53830 ?auto_53833 ) ) ( not ( = ?auto_53830 ?auto_53834 ) ) ( not ( = ?auto_53831 ?auto_53832 ) ) ( not ( = ?auto_53831 ?auto_53833 ) ) ( not ( = ?auto_53831 ?auto_53834 ) ) ( not ( = ?auto_53832 ?auto_53833 ) ) ( not ( = ?auto_53832 ?auto_53834 ) ) ( not ( = ?auto_53833 ?auto_53834 ) ) ( ON-TABLE ?auto_53834 ) ( ON ?auto_53833 ?auto_53834 ) ( ON ?auto_53832 ?auto_53833 ) ( ON ?auto_53831 ?auto_53832 ) ( ON ?auto_53830 ?auto_53831 ) ( HOLDING ?auto_53829 ) ( CLEAR ?auto_53830 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53834 ?auto_53833 ?auto_53832 ?auto_53831 ?auto_53830 ?auto_53829 )
      ( MAKE-6PILE ?auto_53829 ?auto_53830 ?auto_53831 ?auto_53832 ?auto_53833 ?auto_53834 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53835 - BLOCK
      ?auto_53836 - BLOCK
      ?auto_53837 - BLOCK
      ?auto_53838 - BLOCK
      ?auto_53839 - BLOCK
      ?auto_53840 - BLOCK
    )
    :vars
    (
      ?auto_53841 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53835 ?auto_53836 ) ) ( not ( = ?auto_53835 ?auto_53837 ) ) ( not ( = ?auto_53835 ?auto_53838 ) ) ( not ( = ?auto_53835 ?auto_53839 ) ) ( not ( = ?auto_53835 ?auto_53840 ) ) ( not ( = ?auto_53836 ?auto_53837 ) ) ( not ( = ?auto_53836 ?auto_53838 ) ) ( not ( = ?auto_53836 ?auto_53839 ) ) ( not ( = ?auto_53836 ?auto_53840 ) ) ( not ( = ?auto_53837 ?auto_53838 ) ) ( not ( = ?auto_53837 ?auto_53839 ) ) ( not ( = ?auto_53837 ?auto_53840 ) ) ( not ( = ?auto_53838 ?auto_53839 ) ) ( not ( = ?auto_53838 ?auto_53840 ) ) ( not ( = ?auto_53839 ?auto_53840 ) ) ( ON-TABLE ?auto_53840 ) ( ON ?auto_53839 ?auto_53840 ) ( ON ?auto_53838 ?auto_53839 ) ( ON ?auto_53837 ?auto_53838 ) ( ON ?auto_53836 ?auto_53837 ) ( CLEAR ?auto_53836 ) ( ON ?auto_53835 ?auto_53841 ) ( CLEAR ?auto_53835 ) ( HAND-EMPTY ) ( not ( = ?auto_53835 ?auto_53841 ) ) ( not ( = ?auto_53836 ?auto_53841 ) ) ( not ( = ?auto_53837 ?auto_53841 ) ) ( not ( = ?auto_53838 ?auto_53841 ) ) ( not ( = ?auto_53839 ?auto_53841 ) ) ( not ( = ?auto_53840 ?auto_53841 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53835 ?auto_53841 )
      ( MAKE-6PILE ?auto_53835 ?auto_53836 ?auto_53837 ?auto_53838 ?auto_53839 ?auto_53840 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53842 - BLOCK
      ?auto_53843 - BLOCK
      ?auto_53844 - BLOCK
      ?auto_53845 - BLOCK
      ?auto_53846 - BLOCK
      ?auto_53847 - BLOCK
    )
    :vars
    (
      ?auto_53848 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53842 ?auto_53843 ) ) ( not ( = ?auto_53842 ?auto_53844 ) ) ( not ( = ?auto_53842 ?auto_53845 ) ) ( not ( = ?auto_53842 ?auto_53846 ) ) ( not ( = ?auto_53842 ?auto_53847 ) ) ( not ( = ?auto_53843 ?auto_53844 ) ) ( not ( = ?auto_53843 ?auto_53845 ) ) ( not ( = ?auto_53843 ?auto_53846 ) ) ( not ( = ?auto_53843 ?auto_53847 ) ) ( not ( = ?auto_53844 ?auto_53845 ) ) ( not ( = ?auto_53844 ?auto_53846 ) ) ( not ( = ?auto_53844 ?auto_53847 ) ) ( not ( = ?auto_53845 ?auto_53846 ) ) ( not ( = ?auto_53845 ?auto_53847 ) ) ( not ( = ?auto_53846 ?auto_53847 ) ) ( ON-TABLE ?auto_53847 ) ( ON ?auto_53846 ?auto_53847 ) ( ON ?auto_53845 ?auto_53846 ) ( ON ?auto_53844 ?auto_53845 ) ( ON ?auto_53842 ?auto_53848 ) ( CLEAR ?auto_53842 ) ( not ( = ?auto_53842 ?auto_53848 ) ) ( not ( = ?auto_53843 ?auto_53848 ) ) ( not ( = ?auto_53844 ?auto_53848 ) ) ( not ( = ?auto_53845 ?auto_53848 ) ) ( not ( = ?auto_53846 ?auto_53848 ) ) ( not ( = ?auto_53847 ?auto_53848 ) ) ( HOLDING ?auto_53843 ) ( CLEAR ?auto_53844 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53847 ?auto_53846 ?auto_53845 ?auto_53844 ?auto_53843 )
      ( MAKE-6PILE ?auto_53842 ?auto_53843 ?auto_53844 ?auto_53845 ?auto_53846 ?auto_53847 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53849 - BLOCK
      ?auto_53850 - BLOCK
      ?auto_53851 - BLOCK
      ?auto_53852 - BLOCK
      ?auto_53853 - BLOCK
      ?auto_53854 - BLOCK
    )
    :vars
    (
      ?auto_53855 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53849 ?auto_53850 ) ) ( not ( = ?auto_53849 ?auto_53851 ) ) ( not ( = ?auto_53849 ?auto_53852 ) ) ( not ( = ?auto_53849 ?auto_53853 ) ) ( not ( = ?auto_53849 ?auto_53854 ) ) ( not ( = ?auto_53850 ?auto_53851 ) ) ( not ( = ?auto_53850 ?auto_53852 ) ) ( not ( = ?auto_53850 ?auto_53853 ) ) ( not ( = ?auto_53850 ?auto_53854 ) ) ( not ( = ?auto_53851 ?auto_53852 ) ) ( not ( = ?auto_53851 ?auto_53853 ) ) ( not ( = ?auto_53851 ?auto_53854 ) ) ( not ( = ?auto_53852 ?auto_53853 ) ) ( not ( = ?auto_53852 ?auto_53854 ) ) ( not ( = ?auto_53853 ?auto_53854 ) ) ( ON-TABLE ?auto_53854 ) ( ON ?auto_53853 ?auto_53854 ) ( ON ?auto_53852 ?auto_53853 ) ( ON ?auto_53851 ?auto_53852 ) ( ON ?auto_53849 ?auto_53855 ) ( not ( = ?auto_53849 ?auto_53855 ) ) ( not ( = ?auto_53850 ?auto_53855 ) ) ( not ( = ?auto_53851 ?auto_53855 ) ) ( not ( = ?auto_53852 ?auto_53855 ) ) ( not ( = ?auto_53853 ?auto_53855 ) ) ( not ( = ?auto_53854 ?auto_53855 ) ) ( CLEAR ?auto_53851 ) ( ON ?auto_53850 ?auto_53849 ) ( CLEAR ?auto_53850 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53855 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53855 ?auto_53849 )
      ( MAKE-6PILE ?auto_53849 ?auto_53850 ?auto_53851 ?auto_53852 ?auto_53853 ?auto_53854 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53856 - BLOCK
      ?auto_53857 - BLOCK
      ?auto_53858 - BLOCK
      ?auto_53859 - BLOCK
      ?auto_53860 - BLOCK
      ?auto_53861 - BLOCK
    )
    :vars
    (
      ?auto_53862 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53856 ?auto_53857 ) ) ( not ( = ?auto_53856 ?auto_53858 ) ) ( not ( = ?auto_53856 ?auto_53859 ) ) ( not ( = ?auto_53856 ?auto_53860 ) ) ( not ( = ?auto_53856 ?auto_53861 ) ) ( not ( = ?auto_53857 ?auto_53858 ) ) ( not ( = ?auto_53857 ?auto_53859 ) ) ( not ( = ?auto_53857 ?auto_53860 ) ) ( not ( = ?auto_53857 ?auto_53861 ) ) ( not ( = ?auto_53858 ?auto_53859 ) ) ( not ( = ?auto_53858 ?auto_53860 ) ) ( not ( = ?auto_53858 ?auto_53861 ) ) ( not ( = ?auto_53859 ?auto_53860 ) ) ( not ( = ?auto_53859 ?auto_53861 ) ) ( not ( = ?auto_53860 ?auto_53861 ) ) ( ON-TABLE ?auto_53861 ) ( ON ?auto_53860 ?auto_53861 ) ( ON ?auto_53859 ?auto_53860 ) ( ON ?auto_53856 ?auto_53862 ) ( not ( = ?auto_53856 ?auto_53862 ) ) ( not ( = ?auto_53857 ?auto_53862 ) ) ( not ( = ?auto_53858 ?auto_53862 ) ) ( not ( = ?auto_53859 ?auto_53862 ) ) ( not ( = ?auto_53860 ?auto_53862 ) ) ( not ( = ?auto_53861 ?auto_53862 ) ) ( ON ?auto_53857 ?auto_53856 ) ( CLEAR ?auto_53857 ) ( ON-TABLE ?auto_53862 ) ( HOLDING ?auto_53858 ) ( CLEAR ?auto_53859 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53861 ?auto_53860 ?auto_53859 ?auto_53858 )
      ( MAKE-6PILE ?auto_53856 ?auto_53857 ?auto_53858 ?auto_53859 ?auto_53860 ?auto_53861 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53863 - BLOCK
      ?auto_53864 - BLOCK
      ?auto_53865 - BLOCK
      ?auto_53866 - BLOCK
      ?auto_53867 - BLOCK
      ?auto_53868 - BLOCK
    )
    :vars
    (
      ?auto_53869 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53863 ?auto_53864 ) ) ( not ( = ?auto_53863 ?auto_53865 ) ) ( not ( = ?auto_53863 ?auto_53866 ) ) ( not ( = ?auto_53863 ?auto_53867 ) ) ( not ( = ?auto_53863 ?auto_53868 ) ) ( not ( = ?auto_53864 ?auto_53865 ) ) ( not ( = ?auto_53864 ?auto_53866 ) ) ( not ( = ?auto_53864 ?auto_53867 ) ) ( not ( = ?auto_53864 ?auto_53868 ) ) ( not ( = ?auto_53865 ?auto_53866 ) ) ( not ( = ?auto_53865 ?auto_53867 ) ) ( not ( = ?auto_53865 ?auto_53868 ) ) ( not ( = ?auto_53866 ?auto_53867 ) ) ( not ( = ?auto_53866 ?auto_53868 ) ) ( not ( = ?auto_53867 ?auto_53868 ) ) ( ON-TABLE ?auto_53868 ) ( ON ?auto_53867 ?auto_53868 ) ( ON ?auto_53866 ?auto_53867 ) ( ON ?auto_53863 ?auto_53869 ) ( not ( = ?auto_53863 ?auto_53869 ) ) ( not ( = ?auto_53864 ?auto_53869 ) ) ( not ( = ?auto_53865 ?auto_53869 ) ) ( not ( = ?auto_53866 ?auto_53869 ) ) ( not ( = ?auto_53867 ?auto_53869 ) ) ( not ( = ?auto_53868 ?auto_53869 ) ) ( ON ?auto_53864 ?auto_53863 ) ( ON-TABLE ?auto_53869 ) ( CLEAR ?auto_53866 ) ( ON ?auto_53865 ?auto_53864 ) ( CLEAR ?auto_53865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53869 ?auto_53863 ?auto_53864 )
      ( MAKE-6PILE ?auto_53863 ?auto_53864 ?auto_53865 ?auto_53866 ?auto_53867 ?auto_53868 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53870 - BLOCK
      ?auto_53871 - BLOCK
      ?auto_53872 - BLOCK
      ?auto_53873 - BLOCK
      ?auto_53874 - BLOCK
      ?auto_53875 - BLOCK
    )
    :vars
    (
      ?auto_53876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53870 ?auto_53871 ) ) ( not ( = ?auto_53870 ?auto_53872 ) ) ( not ( = ?auto_53870 ?auto_53873 ) ) ( not ( = ?auto_53870 ?auto_53874 ) ) ( not ( = ?auto_53870 ?auto_53875 ) ) ( not ( = ?auto_53871 ?auto_53872 ) ) ( not ( = ?auto_53871 ?auto_53873 ) ) ( not ( = ?auto_53871 ?auto_53874 ) ) ( not ( = ?auto_53871 ?auto_53875 ) ) ( not ( = ?auto_53872 ?auto_53873 ) ) ( not ( = ?auto_53872 ?auto_53874 ) ) ( not ( = ?auto_53872 ?auto_53875 ) ) ( not ( = ?auto_53873 ?auto_53874 ) ) ( not ( = ?auto_53873 ?auto_53875 ) ) ( not ( = ?auto_53874 ?auto_53875 ) ) ( ON-TABLE ?auto_53875 ) ( ON ?auto_53874 ?auto_53875 ) ( ON ?auto_53870 ?auto_53876 ) ( not ( = ?auto_53870 ?auto_53876 ) ) ( not ( = ?auto_53871 ?auto_53876 ) ) ( not ( = ?auto_53872 ?auto_53876 ) ) ( not ( = ?auto_53873 ?auto_53876 ) ) ( not ( = ?auto_53874 ?auto_53876 ) ) ( not ( = ?auto_53875 ?auto_53876 ) ) ( ON ?auto_53871 ?auto_53870 ) ( ON-TABLE ?auto_53876 ) ( ON ?auto_53872 ?auto_53871 ) ( CLEAR ?auto_53872 ) ( HOLDING ?auto_53873 ) ( CLEAR ?auto_53874 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53875 ?auto_53874 ?auto_53873 )
      ( MAKE-6PILE ?auto_53870 ?auto_53871 ?auto_53872 ?auto_53873 ?auto_53874 ?auto_53875 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53877 - BLOCK
      ?auto_53878 - BLOCK
      ?auto_53879 - BLOCK
      ?auto_53880 - BLOCK
      ?auto_53881 - BLOCK
      ?auto_53882 - BLOCK
    )
    :vars
    (
      ?auto_53883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53877 ?auto_53878 ) ) ( not ( = ?auto_53877 ?auto_53879 ) ) ( not ( = ?auto_53877 ?auto_53880 ) ) ( not ( = ?auto_53877 ?auto_53881 ) ) ( not ( = ?auto_53877 ?auto_53882 ) ) ( not ( = ?auto_53878 ?auto_53879 ) ) ( not ( = ?auto_53878 ?auto_53880 ) ) ( not ( = ?auto_53878 ?auto_53881 ) ) ( not ( = ?auto_53878 ?auto_53882 ) ) ( not ( = ?auto_53879 ?auto_53880 ) ) ( not ( = ?auto_53879 ?auto_53881 ) ) ( not ( = ?auto_53879 ?auto_53882 ) ) ( not ( = ?auto_53880 ?auto_53881 ) ) ( not ( = ?auto_53880 ?auto_53882 ) ) ( not ( = ?auto_53881 ?auto_53882 ) ) ( ON-TABLE ?auto_53882 ) ( ON ?auto_53881 ?auto_53882 ) ( ON ?auto_53877 ?auto_53883 ) ( not ( = ?auto_53877 ?auto_53883 ) ) ( not ( = ?auto_53878 ?auto_53883 ) ) ( not ( = ?auto_53879 ?auto_53883 ) ) ( not ( = ?auto_53880 ?auto_53883 ) ) ( not ( = ?auto_53881 ?auto_53883 ) ) ( not ( = ?auto_53882 ?auto_53883 ) ) ( ON ?auto_53878 ?auto_53877 ) ( ON-TABLE ?auto_53883 ) ( ON ?auto_53879 ?auto_53878 ) ( CLEAR ?auto_53881 ) ( ON ?auto_53880 ?auto_53879 ) ( CLEAR ?auto_53880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53883 ?auto_53877 ?auto_53878 ?auto_53879 )
      ( MAKE-6PILE ?auto_53877 ?auto_53878 ?auto_53879 ?auto_53880 ?auto_53881 ?auto_53882 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53884 - BLOCK
      ?auto_53885 - BLOCK
      ?auto_53886 - BLOCK
      ?auto_53887 - BLOCK
      ?auto_53888 - BLOCK
      ?auto_53889 - BLOCK
    )
    :vars
    (
      ?auto_53890 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53884 ?auto_53885 ) ) ( not ( = ?auto_53884 ?auto_53886 ) ) ( not ( = ?auto_53884 ?auto_53887 ) ) ( not ( = ?auto_53884 ?auto_53888 ) ) ( not ( = ?auto_53884 ?auto_53889 ) ) ( not ( = ?auto_53885 ?auto_53886 ) ) ( not ( = ?auto_53885 ?auto_53887 ) ) ( not ( = ?auto_53885 ?auto_53888 ) ) ( not ( = ?auto_53885 ?auto_53889 ) ) ( not ( = ?auto_53886 ?auto_53887 ) ) ( not ( = ?auto_53886 ?auto_53888 ) ) ( not ( = ?auto_53886 ?auto_53889 ) ) ( not ( = ?auto_53887 ?auto_53888 ) ) ( not ( = ?auto_53887 ?auto_53889 ) ) ( not ( = ?auto_53888 ?auto_53889 ) ) ( ON-TABLE ?auto_53889 ) ( ON ?auto_53884 ?auto_53890 ) ( not ( = ?auto_53884 ?auto_53890 ) ) ( not ( = ?auto_53885 ?auto_53890 ) ) ( not ( = ?auto_53886 ?auto_53890 ) ) ( not ( = ?auto_53887 ?auto_53890 ) ) ( not ( = ?auto_53888 ?auto_53890 ) ) ( not ( = ?auto_53889 ?auto_53890 ) ) ( ON ?auto_53885 ?auto_53884 ) ( ON-TABLE ?auto_53890 ) ( ON ?auto_53886 ?auto_53885 ) ( ON ?auto_53887 ?auto_53886 ) ( CLEAR ?auto_53887 ) ( HOLDING ?auto_53888 ) ( CLEAR ?auto_53889 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53889 ?auto_53888 )
      ( MAKE-6PILE ?auto_53884 ?auto_53885 ?auto_53886 ?auto_53887 ?auto_53888 ?auto_53889 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53891 - BLOCK
      ?auto_53892 - BLOCK
      ?auto_53893 - BLOCK
      ?auto_53894 - BLOCK
      ?auto_53895 - BLOCK
      ?auto_53896 - BLOCK
    )
    :vars
    (
      ?auto_53897 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53891 ?auto_53892 ) ) ( not ( = ?auto_53891 ?auto_53893 ) ) ( not ( = ?auto_53891 ?auto_53894 ) ) ( not ( = ?auto_53891 ?auto_53895 ) ) ( not ( = ?auto_53891 ?auto_53896 ) ) ( not ( = ?auto_53892 ?auto_53893 ) ) ( not ( = ?auto_53892 ?auto_53894 ) ) ( not ( = ?auto_53892 ?auto_53895 ) ) ( not ( = ?auto_53892 ?auto_53896 ) ) ( not ( = ?auto_53893 ?auto_53894 ) ) ( not ( = ?auto_53893 ?auto_53895 ) ) ( not ( = ?auto_53893 ?auto_53896 ) ) ( not ( = ?auto_53894 ?auto_53895 ) ) ( not ( = ?auto_53894 ?auto_53896 ) ) ( not ( = ?auto_53895 ?auto_53896 ) ) ( ON-TABLE ?auto_53896 ) ( ON ?auto_53891 ?auto_53897 ) ( not ( = ?auto_53891 ?auto_53897 ) ) ( not ( = ?auto_53892 ?auto_53897 ) ) ( not ( = ?auto_53893 ?auto_53897 ) ) ( not ( = ?auto_53894 ?auto_53897 ) ) ( not ( = ?auto_53895 ?auto_53897 ) ) ( not ( = ?auto_53896 ?auto_53897 ) ) ( ON ?auto_53892 ?auto_53891 ) ( ON-TABLE ?auto_53897 ) ( ON ?auto_53893 ?auto_53892 ) ( ON ?auto_53894 ?auto_53893 ) ( CLEAR ?auto_53896 ) ( ON ?auto_53895 ?auto_53894 ) ( CLEAR ?auto_53895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53897 ?auto_53891 ?auto_53892 ?auto_53893 ?auto_53894 )
      ( MAKE-6PILE ?auto_53891 ?auto_53892 ?auto_53893 ?auto_53894 ?auto_53895 ?auto_53896 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53898 - BLOCK
      ?auto_53899 - BLOCK
      ?auto_53900 - BLOCK
      ?auto_53901 - BLOCK
      ?auto_53902 - BLOCK
      ?auto_53903 - BLOCK
    )
    :vars
    (
      ?auto_53904 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53898 ?auto_53899 ) ) ( not ( = ?auto_53898 ?auto_53900 ) ) ( not ( = ?auto_53898 ?auto_53901 ) ) ( not ( = ?auto_53898 ?auto_53902 ) ) ( not ( = ?auto_53898 ?auto_53903 ) ) ( not ( = ?auto_53899 ?auto_53900 ) ) ( not ( = ?auto_53899 ?auto_53901 ) ) ( not ( = ?auto_53899 ?auto_53902 ) ) ( not ( = ?auto_53899 ?auto_53903 ) ) ( not ( = ?auto_53900 ?auto_53901 ) ) ( not ( = ?auto_53900 ?auto_53902 ) ) ( not ( = ?auto_53900 ?auto_53903 ) ) ( not ( = ?auto_53901 ?auto_53902 ) ) ( not ( = ?auto_53901 ?auto_53903 ) ) ( not ( = ?auto_53902 ?auto_53903 ) ) ( ON ?auto_53898 ?auto_53904 ) ( not ( = ?auto_53898 ?auto_53904 ) ) ( not ( = ?auto_53899 ?auto_53904 ) ) ( not ( = ?auto_53900 ?auto_53904 ) ) ( not ( = ?auto_53901 ?auto_53904 ) ) ( not ( = ?auto_53902 ?auto_53904 ) ) ( not ( = ?auto_53903 ?auto_53904 ) ) ( ON ?auto_53899 ?auto_53898 ) ( ON-TABLE ?auto_53904 ) ( ON ?auto_53900 ?auto_53899 ) ( ON ?auto_53901 ?auto_53900 ) ( ON ?auto_53902 ?auto_53901 ) ( CLEAR ?auto_53902 ) ( HOLDING ?auto_53903 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53903 )
      ( MAKE-6PILE ?auto_53898 ?auto_53899 ?auto_53900 ?auto_53901 ?auto_53902 ?auto_53903 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53905 - BLOCK
      ?auto_53906 - BLOCK
      ?auto_53907 - BLOCK
      ?auto_53908 - BLOCK
      ?auto_53909 - BLOCK
      ?auto_53910 - BLOCK
    )
    :vars
    (
      ?auto_53911 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53905 ?auto_53906 ) ) ( not ( = ?auto_53905 ?auto_53907 ) ) ( not ( = ?auto_53905 ?auto_53908 ) ) ( not ( = ?auto_53905 ?auto_53909 ) ) ( not ( = ?auto_53905 ?auto_53910 ) ) ( not ( = ?auto_53906 ?auto_53907 ) ) ( not ( = ?auto_53906 ?auto_53908 ) ) ( not ( = ?auto_53906 ?auto_53909 ) ) ( not ( = ?auto_53906 ?auto_53910 ) ) ( not ( = ?auto_53907 ?auto_53908 ) ) ( not ( = ?auto_53907 ?auto_53909 ) ) ( not ( = ?auto_53907 ?auto_53910 ) ) ( not ( = ?auto_53908 ?auto_53909 ) ) ( not ( = ?auto_53908 ?auto_53910 ) ) ( not ( = ?auto_53909 ?auto_53910 ) ) ( ON ?auto_53905 ?auto_53911 ) ( not ( = ?auto_53905 ?auto_53911 ) ) ( not ( = ?auto_53906 ?auto_53911 ) ) ( not ( = ?auto_53907 ?auto_53911 ) ) ( not ( = ?auto_53908 ?auto_53911 ) ) ( not ( = ?auto_53909 ?auto_53911 ) ) ( not ( = ?auto_53910 ?auto_53911 ) ) ( ON ?auto_53906 ?auto_53905 ) ( ON-TABLE ?auto_53911 ) ( ON ?auto_53907 ?auto_53906 ) ( ON ?auto_53908 ?auto_53907 ) ( ON ?auto_53909 ?auto_53908 ) ( ON ?auto_53910 ?auto_53909 ) ( CLEAR ?auto_53910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53911 ?auto_53905 ?auto_53906 ?auto_53907 ?auto_53908 ?auto_53909 )
      ( MAKE-6PILE ?auto_53905 ?auto_53906 ?auto_53907 ?auto_53908 ?auto_53909 ?auto_53910 ) )
  )

)

