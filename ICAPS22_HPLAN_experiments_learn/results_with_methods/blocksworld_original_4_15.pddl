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

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15099 - BLOCK
      ?auto_15100 - BLOCK
      ?auto_15101 - BLOCK
      ?auto_15102 - BLOCK
    )
    :vars
    (
      ?auto_15103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15103 ?auto_15102 ) ( CLEAR ?auto_15103 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15099 ) ( ON ?auto_15100 ?auto_15099 ) ( ON ?auto_15101 ?auto_15100 ) ( ON ?auto_15102 ?auto_15101 ) ( not ( = ?auto_15099 ?auto_15100 ) ) ( not ( = ?auto_15099 ?auto_15101 ) ) ( not ( = ?auto_15099 ?auto_15102 ) ) ( not ( = ?auto_15099 ?auto_15103 ) ) ( not ( = ?auto_15100 ?auto_15101 ) ) ( not ( = ?auto_15100 ?auto_15102 ) ) ( not ( = ?auto_15100 ?auto_15103 ) ) ( not ( = ?auto_15101 ?auto_15102 ) ) ( not ( = ?auto_15101 ?auto_15103 ) ) ( not ( = ?auto_15102 ?auto_15103 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15103 ?auto_15102 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15105 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_15105 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_15105 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15106 - BLOCK
    )
    :vars
    (
      ?auto_15107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15106 ?auto_15107 ) ( CLEAR ?auto_15106 ) ( HAND-EMPTY ) ( not ( = ?auto_15106 ?auto_15107 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15106 ?auto_15107 )
      ( MAKE-1PILE ?auto_15106 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15111 - BLOCK
      ?auto_15112 - BLOCK
      ?auto_15113 - BLOCK
    )
    :vars
    (
      ?auto_15114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15114 ?auto_15113 ) ( CLEAR ?auto_15114 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15111 ) ( ON ?auto_15112 ?auto_15111 ) ( ON ?auto_15113 ?auto_15112 ) ( not ( = ?auto_15111 ?auto_15112 ) ) ( not ( = ?auto_15111 ?auto_15113 ) ) ( not ( = ?auto_15111 ?auto_15114 ) ) ( not ( = ?auto_15112 ?auto_15113 ) ) ( not ( = ?auto_15112 ?auto_15114 ) ) ( not ( = ?auto_15113 ?auto_15114 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15114 ?auto_15113 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15115 - BLOCK
      ?auto_15116 - BLOCK
      ?auto_15117 - BLOCK
    )
    :vars
    (
      ?auto_15118 - BLOCK
      ?auto_15119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15118 ?auto_15117 ) ( CLEAR ?auto_15118 ) ( ON-TABLE ?auto_15115 ) ( ON ?auto_15116 ?auto_15115 ) ( ON ?auto_15117 ?auto_15116 ) ( not ( = ?auto_15115 ?auto_15116 ) ) ( not ( = ?auto_15115 ?auto_15117 ) ) ( not ( = ?auto_15115 ?auto_15118 ) ) ( not ( = ?auto_15116 ?auto_15117 ) ) ( not ( = ?auto_15116 ?auto_15118 ) ) ( not ( = ?auto_15117 ?auto_15118 ) ) ( HOLDING ?auto_15119 ) ( not ( = ?auto_15115 ?auto_15119 ) ) ( not ( = ?auto_15116 ?auto_15119 ) ) ( not ( = ?auto_15117 ?auto_15119 ) ) ( not ( = ?auto_15118 ?auto_15119 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_15119 )
      ( MAKE-3PILE ?auto_15115 ?auto_15116 ?auto_15117 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15120 - BLOCK
      ?auto_15121 - BLOCK
      ?auto_15122 - BLOCK
    )
    :vars
    (
      ?auto_15123 - BLOCK
      ?auto_15124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15123 ?auto_15122 ) ( ON-TABLE ?auto_15120 ) ( ON ?auto_15121 ?auto_15120 ) ( ON ?auto_15122 ?auto_15121 ) ( not ( = ?auto_15120 ?auto_15121 ) ) ( not ( = ?auto_15120 ?auto_15122 ) ) ( not ( = ?auto_15120 ?auto_15123 ) ) ( not ( = ?auto_15121 ?auto_15122 ) ) ( not ( = ?auto_15121 ?auto_15123 ) ) ( not ( = ?auto_15122 ?auto_15123 ) ) ( not ( = ?auto_15120 ?auto_15124 ) ) ( not ( = ?auto_15121 ?auto_15124 ) ) ( not ( = ?auto_15122 ?auto_15124 ) ) ( not ( = ?auto_15123 ?auto_15124 ) ) ( ON ?auto_15124 ?auto_15123 ) ( CLEAR ?auto_15124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15120 ?auto_15121 ?auto_15122 ?auto_15123 )
      ( MAKE-3PILE ?auto_15120 ?auto_15121 ?auto_15122 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15127 - BLOCK
      ?auto_15128 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_15128 ) ( CLEAR ?auto_15127 ) ( ON-TABLE ?auto_15127 ) ( not ( = ?auto_15127 ?auto_15128 ) ) )
    :subtasks
    ( ( !STACK ?auto_15128 ?auto_15127 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15129 - BLOCK
      ?auto_15130 - BLOCK
    )
    :vars
    (
      ?auto_15131 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15129 ) ( ON-TABLE ?auto_15129 ) ( not ( = ?auto_15129 ?auto_15130 ) ) ( ON ?auto_15130 ?auto_15131 ) ( CLEAR ?auto_15130 ) ( HAND-EMPTY ) ( not ( = ?auto_15129 ?auto_15131 ) ) ( not ( = ?auto_15130 ?auto_15131 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15130 ?auto_15131 )
      ( MAKE-2PILE ?auto_15129 ?auto_15130 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15132 - BLOCK
      ?auto_15133 - BLOCK
    )
    :vars
    (
      ?auto_15134 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15132 ?auto_15133 ) ) ( ON ?auto_15133 ?auto_15134 ) ( CLEAR ?auto_15133 ) ( not ( = ?auto_15132 ?auto_15134 ) ) ( not ( = ?auto_15133 ?auto_15134 ) ) ( HOLDING ?auto_15132 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15132 )
      ( MAKE-2PILE ?auto_15132 ?auto_15133 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15135 - BLOCK
      ?auto_15136 - BLOCK
    )
    :vars
    (
      ?auto_15137 - BLOCK
      ?auto_15138 - BLOCK
      ?auto_15139 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15135 ?auto_15136 ) ) ( ON ?auto_15136 ?auto_15137 ) ( not ( = ?auto_15135 ?auto_15137 ) ) ( not ( = ?auto_15136 ?auto_15137 ) ) ( ON ?auto_15135 ?auto_15136 ) ( CLEAR ?auto_15135 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15138 ) ( ON ?auto_15139 ?auto_15138 ) ( ON ?auto_15137 ?auto_15139 ) ( not ( = ?auto_15138 ?auto_15139 ) ) ( not ( = ?auto_15138 ?auto_15137 ) ) ( not ( = ?auto_15138 ?auto_15136 ) ) ( not ( = ?auto_15138 ?auto_15135 ) ) ( not ( = ?auto_15139 ?auto_15137 ) ) ( not ( = ?auto_15139 ?auto_15136 ) ) ( not ( = ?auto_15139 ?auto_15135 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15138 ?auto_15139 ?auto_15137 ?auto_15136 )
      ( MAKE-2PILE ?auto_15135 ?auto_15136 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15142 - BLOCK
      ?auto_15143 - BLOCK
    )
    :vars
    (
      ?auto_15144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15144 ?auto_15143 ) ( CLEAR ?auto_15144 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15142 ) ( ON ?auto_15143 ?auto_15142 ) ( not ( = ?auto_15142 ?auto_15143 ) ) ( not ( = ?auto_15142 ?auto_15144 ) ) ( not ( = ?auto_15143 ?auto_15144 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15144 ?auto_15143 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15145 - BLOCK
      ?auto_15146 - BLOCK
    )
    :vars
    (
      ?auto_15147 - BLOCK
      ?auto_15148 - BLOCK
      ?auto_15149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15147 ?auto_15146 ) ( CLEAR ?auto_15147 ) ( ON-TABLE ?auto_15145 ) ( ON ?auto_15146 ?auto_15145 ) ( not ( = ?auto_15145 ?auto_15146 ) ) ( not ( = ?auto_15145 ?auto_15147 ) ) ( not ( = ?auto_15146 ?auto_15147 ) ) ( HOLDING ?auto_15148 ) ( CLEAR ?auto_15149 ) ( not ( = ?auto_15145 ?auto_15148 ) ) ( not ( = ?auto_15145 ?auto_15149 ) ) ( not ( = ?auto_15146 ?auto_15148 ) ) ( not ( = ?auto_15146 ?auto_15149 ) ) ( not ( = ?auto_15147 ?auto_15148 ) ) ( not ( = ?auto_15147 ?auto_15149 ) ) ( not ( = ?auto_15148 ?auto_15149 ) ) )
    :subtasks
    ( ( !STACK ?auto_15148 ?auto_15149 )
      ( MAKE-2PILE ?auto_15145 ?auto_15146 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15150 - BLOCK
      ?auto_15151 - BLOCK
    )
    :vars
    (
      ?auto_15154 - BLOCK
      ?auto_15153 - BLOCK
      ?auto_15152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15154 ?auto_15151 ) ( ON-TABLE ?auto_15150 ) ( ON ?auto_15151 ?auto_15150 ) ( not ( = ?auto_15150 ?auto_15151 ) ) ( not ( = ?auto_15150 ?auto_15154 ) ) ( not ( = ?auto_15151 ?auto_15154 ) ) ( CLEAR ?auto_15153 ) ( not ( = ?auto_15150 ?auto_15152 ) ) ( not ( = ?auto_15150 ?auto_15153 ) ) ( not ( = ?auto_15151 ?auto_15152 ) ) ( not ( = ?auto_15151 ?auto_15153 ) ) ( not ( = ?auto_15154 ?auto_15152 ) ) ( not ( = ?auto_15154 ?auto_15153 ) ) ( not ( = ?auto_15152 ?auto_15153 ) ) ( ON ?auto_15152 ?auto_15154 ) ( CLEAR ?auto_15152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15150 ?auto_15151 ?auto_15154 )
      ( MAKE-2PILE ?auto_15150 ?auto_15151 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15155 - BLOCK
      ?auto_15156 - BLOCK
    )
    :vars
    (
      ?auto_15159 - BLOCK
      ?auto_15157 - BLOCK
      ?auto_15158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15159 ?auto_15156 ) ( ON-TABLE ?auto_15155 ) ( ON ?auto_15156 ?auto_15155 ) ( not ( = ?auto_15155 ?auto_15156 ) ) ( not ( = ?auto_15155 ?auto_15159 ) ) ( not ( = ?auto_15156 ?auto_15159 ) ) ( not ( = ?auto_15155 ?auto_15157 ) ) ( not ( = ?auto_15155 ?auto_15158 ) ) ( not ( = ?auto_15156 ?auto_15157 ) ) ( not ( = ?auto_15156 ?auto_15158 ) ) ( not ( = ?auto_15159 ?auto_15157 ) ) ( not ( = ?auto_15159 ?auto_15158 ) ) ( not ( = ?auto_15157 ?auto_15158 ) ) ( ON ?auto_15157 ?auto_15159 ) ( CLEAR ?auto_15157 ) ( HOLDING ?auto_15158 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15158 )
      ( MAKE-2PILE ?auto_15155 ?auto_15156 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15160 - BLOCK
      ?auto_15161 - BLOCK
    )
    :vars
    (
      ?auto_15163 - BLOCK
      ?auto_15164 - BLOCK
      ?auto_15162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15163 ?auto_15161 ) ( ON-TABLE ?auto_15160 ) ( ON ?auto_15161 ?auto_15160 ) ( not ( = ?auto_15160 ?auto_15161 ) ) ( not ( = ?auto_15160 ?auto_15163 ) ) ( not ( = ?auto_15161 ?auto_15163 ) ) ( not ( = ?auto_15160 ?auto_15164 ) ) ( not ( = ?auto_15160 ?auto_15162 ) ) ( not ( = ?auto_15161 ?auto_15164 ) ) ( not ( = ?auto_15161 ?auto_15162 ) ) ( not ( = ?auto_15163 ?auto_15164 ) ) ( not ( = ?auto_15163 ?auto_15162 ) ) ( not ( = ?auto_15164 ?auto_15162 ) ) ( ON ?auto_15164 ?auto_15163 ) ( ON ?auto_15162 ?auto_15164 ) ( CLEAR ?auto_15162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15160 ?auto_15161 ?auto_15163 ?auto_15164 )
      ( MAKE-2PILE ?auto_15160 ?auto_15161 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15168 - BLOCK
      ?auto_15169 - BLOCK
      ?auto_15170 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_15170 ) ( CLEAR ?auto_15169 ) ( ON-TABLE ?auto_15168 ) ( ON ?auto_15169 ?auto_15168 ) ( not ( = ?auto_15168 ?auto_15169 ) ) ( not ( = ?auto_15168 ?auto_15170 ) ) ( not ( = ?auto_15169 ?auto_15170 ) ) )
    :subtasks
    ( ( !STACK ?auto_15170 ?auto_15169 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15171 - BLOCK
      ?auto_15172 - BLOCK
      ?auto_15173 - BLOCK
    )
    :vars
    (
      ?auto_15174 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15172 ) ( ON-TABLE ?auto_15171 ) ( ON ?auto_15172 ?auto_15171 ) ( not ( = ?auto_15171 ?auto_15172 ) ) ( not ( = ?auto_15171 ?auto_15173 ) ) ( not ( = ?auto_15172 ?auto_15173 ) ) ( ON ?auto_15173 ?auto_15174 ) ( CLEAR ?auto_15173 ) ( HAND-EMPTY ) ( not ( = ?auto_15171 ?auto_15174 ) ) ( not ( = ?auto_15172 ?auto_15174 ) ) ( not ( = ?auto_15173 ?auto_15174 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15173 ?auto_15174 )
      ( MAKE-3PILE ?auto_15171 ?auto_15172 ?auto_15173 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15175 - BLOCK
      ?auto_15176 - BLOCK
      ?auto_15177 - BLOCK
    )
    :vars
    (
      ?auto_15178 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15175 ) ( not ( = ?auto_15175 ?auto_15176 ) ) ( not ( = ?auto_15175 ?auto_15177 ) ) ( not ( = ?auto_15176 ?auto_15177 ) ) ( ON ?auto_15177 ?auto_15178 ) ( CLEAR ?auto_15177 ) ( not ( = ?auto_15175 ?auto_15178 ) ) ( not ( = ?auto_15176 ?auto_15178 ) ) ( not ( = ?auto_15177 ?auto_15178 ) ) ( HOLDING ?auto_15176 ) ( CLEAR ?auto_15175 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15175 ?auto_15176 )
      ( MAKE-3PILE ?auto_15175 ?auto_15176 ?auto_15177 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15179 - BLOCK
      ?auto_15180 - BLOCK
      ?auto_15181 - BLOCK
    )
    :vars
    (
      ?auto_15182 - BLOCK
      ?auto_15183 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15179 ) ( not ( = ?auto_15179 ?auto_15180 ) ) ( not ( = ?auto_15179 ?auto_15181 ) ) ( not ( = ?auto_15180 ?auto_15181 ) ) ( ON ?auto_15181 ?auto_15182 ) ( not ( = ?auto_15179 ?auto_15182 ) ) ( not ( = ?auto_15180 ?auto_15182 ) ) ( not ( = ?auto_15181 ?auto_15182 ) ) ( CLEAR ?auto_15179 ) ( ON ?auto_15180 ?auto_15181 ) ( CLEAR ?auto_15180 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15183 ) ( ON ?auto_15182 ?auto_15183 ) ( not ( = ?auto_15183 ?auto_15182 ) ) ( not ( = ?auto_15183 ?auto_15181 ) ) ( not ( = ?auto_15183 ?auto_15180 ) ) ( not ( = ?auto_15179 ?auto_15183 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15183 ?auto_15182 ?auto_15181 )
      ( MAKE-3PILE ?auto_15179 ?auto_15180 ?auto_15181 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15184 - BLOCK
      ?auto_15185 - BLOCK
      ?auto_15186 - BLOCK
    )
    :vars
    (
      ?auto_15188 - BLOCK
      ?auto_15187 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15184 ?auto_15185 ) ) ( not ( = ?auto_15184 ?auto_15186 ) ) ( not ( = ?auto_15185 ?auto_15186 ) ) ( ON ?auto_15186 ?auto_15188 ) ( not ( = ?auto_15184 ?auto_15188 ) ) ( not ( = ?auto_15185 ?auto_15188 ) ) ( not ( = ?auto_15186 ?auto_15188 ) ) ( ON ?auto_15185 ?auto_15186 ) ( CLEAR ?auto_15185 ) ( ON-TABLE ?auto_15187 ) ( ON ?auto_15188 ?auto_15187 ) ( not ( = ?auto_15187 ?auto_15188 ) ) ( not ( = ?auto_15187 ?auto_15186 ) ) ( not ( = ?auto_15187 ?auto_15185 ) ) ( not ( = ?auto_15184 ?auto_15187 ) ) ( HOLDING ?auto_15184 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15184 )
      ( MAKE-3PILE ?auto_15184 ?auto_15185 ?auto_15186 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15189 - BLOCK
      ?auto_15190 - BLOCK
      ?auto_15191 - BLOCK
    )
    :vars
    (
      ?auto_15193 - BLOCK
      ?auto_15192 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15189 ?auto_15190 ) ) ( not ( = ?auto_15189 ?auto_15191 ) ) ( not ( = ?auto_15190 ?auto_15191 ) ) ( ON ?auto_15191 ?auto_15193 ) ( not ( = ?auto_15189 ?auto_15193 ) ) ( not ( = ?auto_15190 ?auto_15193 ) ) ( not ( = ?auto_15191 ?auto_15193 ) ) ( ON ?auto_15190 ?auto_15191 ) ( ON-TABLE ?auto_15192 ) ( ON ?auto_15193 ?auto_15192 ) ( not ( = ?auto_15192 ?auto_15193 ) ) ( not ( = ?auto_15192 ?auto_15191 ) ) ( not ( = ?auto_15192 ?auto_15190 ) ) ( not ( = ?auto_15189 ?auto_15192 ) ) ( ON ?auto_15189 ?auto_15190 ) ( CLEAR ?auto_15189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15192 ?auto_15193 ?auto_15191 ?auto_15190 )
      ( MAKE-3PILE ?auto_15189 ?auto_15190 ?auto_15191 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15195 - BLOCK
    )
    :vars
    (
      ?auto_15196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15196 ?auto_15195 ) ( CLEAR ?auto_15196 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15195 ) ( not ( = ?auto_15195 ?auto_15196 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15196 ?auto_15195 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15197 - BLOCK
    )
    :vars
    (
      ?auto_15198 - BLOCK
      ?auto_15199 - BLOCK
      ?auto_15200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15198 ?auto_15197 ) ( CLEAR ?auto_15198 ) ( ON-TABLE ?auto_15197 ) ( not ( = ?auto_15197 ?auto_15198 ) ) ( HOLDING ?auto_15199 ) ( CLEAR ?auto_15200 ) ( not ( = ?auto_15197 ?auto_15199 ) ) ( not ( = ?auto_15197 ?auto_15200 ) ) ( not ( = ?auto_15198 ?auto_15199 ) ) ( not ( = ?auto_15198 ?auto_15200 ) ) ( not ( = ?auto_15199 ?auto_15200 ) ) )
    :subtasks
    ( ( !STACK ?auto_15199 ?auto_15200 )
      ( MAKE-1PILE ?auto_15197 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15201 - BLOCK
    )
    :vars
    (
      ?auto_15203 - BLOCK
      ?auto_15204 - BLOCK
      ?auto_15202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15203 ?auto_15201 ) ( ON-TABLE ?auto_15201 ) ( not ( = ?auto_15201 ?auto_15203 ) ) ( CLEAR ?auto_15204 ) ( not ( = ?auto_15201 ?auto_15202 ) ) ( not ( = ?auto_15201 ?auto_15204 ) ) ( not ( = ?auto_15203 ?auto_15202 ) ) ( not ( = ?auto_15203 ?auto_15204 ) ) ( not ( = ?auto_15202 ?auto_15204 ) ) ( ON ?auto_15202 ?auto_15203 ) ( CLEAR ?auto_15202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15201 ?auto_15203 )
      ( MAKE-1PILE ?auto_15201 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15205 - BLOCK
    )
    :vars
    (
      ?auto_15207 - BLOCK
      ?auto_15208 - BLOCK
      ?auto_15206 - BLOCK
      ?auto_15209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15207 ?auto_15205 ) ( ON-TABLE ?auto_15205 ) ( not ( = ?auto_15205 ?auto_15207 ) ) ( not ( = ?auto_15205 ?auto_15208 ) ) ( not ( = ?auto_15205 ?auto_15206 ) ) ( not ( = ?auto_15207 ?auto_15208 ) ) ( not ( = ?auto_15207 ?auto_15206 ) ) ( not ( = ?auto_15208 ?auto_15206 ) ) ( ON ?auto_15208 ?auto_15207 ) ( CLEAR ?auto_15208 ) ( HOLDING ?auto_15206 ) ( CLEAR ?auto_15209 ) ( ON-TABLE ?auto_15209 ) ( not ( = ?auto_15209 ?auto_15206 ) ) ( not ( = ?auto_15205 ?auto_15209 ) ) ( not ( = ?auto_15207 ?auto_15209 ) ) ( not ( = ?auto_15208 ?auto_15209 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15209 ?auto_15206 )
      ( MAKE-1PILE ?auto_15205 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15210 - BLOCK
    )
    :vars
    (
      ?auto_15214 - BLOCK
      ?auto_15213 - BLOCK
      ?auto_15211 - BLOCK
      ?auto_15212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15214 ?auto_15210 ) ( ON-TABLE ?auto_15210 ) ( not ( = ?auto_15210 ?auto_15214 ) ) ( not ( = ?auto_15210 ?auto_15213 ) ) ( not ( = ?auto_15210 ?auto_15211 ) ) ( not ( = ?auto_15214 ?auto_15213 ) ) ( not ( = ?auto_15214 ?auto_15211 ) ) ( not ( = ?auto_15213 ?auto_15211 ) ) ( ON ?auto_15213 ?auto_15214 ) ( CLEAR ?auto_15212 ) ( ON-TABLE ?auto_15212 ) ( not ( = ?auto_15212 ?auto_15211 ) ) ( not ( = ?auto_15210 ?auto_15212 ) ) ( not ( = ?auto_15214 ?auto_15212 ) ) ( not ( = ?auto_15213 ?auto_15212 ) ) ( ON ?auto_15211 ?auto_15213 ) ( CLEAR ?auto_15211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15210 ?auto_15214 ?auto_15213 )
      ( MAKE-1PILE ?auto_15210 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15215 - BLOCK
    )
    :vars
    (
      ?auto_15216 - BLOCK
      ?auto_15217 - BLOCK
      ?auto_15219 - BLOCK
      ?auto_15218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15216 ?auto_15215 ) ( ON-TABLE ?auto_15215 ) ( not ( = ?auto_15215 ?auto_15216 ) ) ( not ( = ?auto_15215 ?auto_15217 ) ) ( not ( = ?auto_15215 ?auto_15219 ) ) ( not ( = ?auto_15216 ?auto_15217 ) ) ( not ( = ?auto_15216 ?auto_15219 ) ) ( not ( = ?auto_15217 ?auto_15219 ) ) ( ON ?auto_15217 ?auto_15216 ) ( not ( = ?auto_15218 ?auto_15219 ) ) ( not ( = ?auto_15215 ?auto_15218 ) ) ( not ( = ?auto_15216 ?auto_15218 ) ) ( not ( = ?auto_15217 ?auto_15218 ) ) ( ON ?auto_15219 ?auto_15217 ) ( CLEAR ?auto_15219 ) ( HOLDING ?auto_15218 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15218 )
      ( MAKE-1PILE ?auto_15215 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15220 - BLOCK
    )
    :vars
    (
      ?auto_15221 - BLOCK
      ?auto_15222 - BLOCK
      ?auto_15224 - BLOCK
      ?auto_15223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15221 ?auto_15220 ) ( ON-TABLE ?auto_15220 ) ( not ( = ?auto_15220 ?auto_15221 ) ) ( not ( = ?auto_15220 ?auto_15222 ) ) ( not ( = ?auto_15220 ?auto_15224 ) ) ( not ( = ?auto_15221 ?auto_15222 ) ) ( not ( = ?auto_15221 ?auto_15224 ) ) ( not ( = ?auto_15222 ?auto_15224 ) ) ( ON ?auto_15222 ?auto_15221 ) ( not ( = ?auto_15223 ?auto_15224 ) ) ( not ( = ?auto_15220 ?auto_15223 ) ) ( not ( = ?auto_15221 ?auto_15223 ) ) ( not ( = ?auto_15222 ?auto_15223 ) ) ( ON ?auto_15224 ?auto_15222 ) ( ON ?auto_15223 ?auto_15224 ) ( CLEAR ?auto_15223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15220 ?auto_15221 ?auto_15222 ?auto_15224 )
      ( MAKE-1PILE ?auto_15220 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15229 - BLOCK
      ?auto_15230 - BLOCK
      ?auto_15231 - BLOCK
      ?auto_15232 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_15232 ) ( CLEAR ?auto_15231 ) ( ON-TABLE ?auto_15229 ) ( ON ?auto_15230 ?auto_15229 ) ( ON ?auto_15231 ?auto_15230 ) ( not ( = ?auto_15229 ?auto_15230 ) ) ( not ( = ?auto_15229 ?auto_15231 ) ) ( not ( = ?auto_15229 ?auto_15232 ) ) ( not ( = ?auto_15230 ?auto_15231 ) ) ( not ( = ?auto_15230 ?auto_15232 ) ) ( not ( = ?auto_15231 ?auto_15232 ) ) )
    :subtasks
    ( ( !STACK ?auto_15232 ?auto_15231 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15233 - BLOCK
      ?auto_15234 - BLOCK
      ?auto_15235 - BLOCK
      ?auto_15236 - BLOCK
    )
    :vars
    (
      ?auto_15237 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15235 ) ( ON-TABLE ?auto_15233 ) ( ON ?auto_15234 ?auto_15233 ) ( ON ?auto_15235 ?auto_15234 ) ( not ( = ?auto_15233 ?auto_15234 ) ) ( not ( = ?auto_15233 ?auto_15235 ) ) ( not ( = ?auto_15233 ?auto_15236 ) ) ( not ( = ?auto_15234 ?auto_15235 ) ) ( not ( = ?auto_15234 ?auto_15236 ) ) ( not ( = ?auto_15235 ?auto_15236 ) ) ( ON ?auto_15236 ?auto_15237 ) ( CLEAR ?auto_15236 ) ( HAND-EMPTY ) ( not ( = ?auto_15233 ?auto_15237 ) ) ( not ( = ?auto_15234 ?auto_15237 ) ) ( not ( = ?auto_15235 ?auto_15237 ) ) ( not ( = ?auto_15236 ?auto_15237 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15236 ?auto_15237 )
      ( MAKE-4PILE ?auto_15233 ?auto_15234 ?auto_15235 ?auto_15236 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15238 - BLOCK
      ?auto_15239 - BLOCK
      ?auto_15240 - BLOCK
      ?auto_15241 - BLOCK
    )
    :vars
    (
      ?auto_15242 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15238 ) ( ON ?auto_15239 ?auto_15238 ) ( not ( = ?auto_15238 ?auto_15239 ) ) ( not ( = ?auto_15238 ?auto_15240 ) ) ( not ( = ?auto_15238 ?auto_15241 ) ) ( not ( = ?auto_15239 ?auto_15240 ) ) ( not ( = ?auto_15239 ?auto_15241 ) ) ( not ( = ?auto_15240 ?auto_15241 ) ) ( ON ?auto_15241 ?auto_15242 ) ( CLEAR ?auto_15241 ) ( not ( = ?auto_15238 ?auto_15242 ) ) ( not ( = ?auto_15239 ?auto_15242 ) ) ( not ( = ?auto_15240 ?auto_15242 ) ) ( not ( = ?auto_15241 ?auto_15242 ) ) ( HOLDING ?auto_15240 ) ( CLEAR ?auto_15239 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15238 ?auto_15239 ?auto_15240 )
      ( MAKE-4PILE ?auto_15238 ?auto_15239 ?auto_15240 ?auto_15241 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15243 - BLOCK
      ?auto_15244 - BLOCK
      ?auto_15245 - BLOCK
      ?auto_15246 - BLOCK
    )
    :vars
    (
      ?auto_15247 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15243 ) ( ON ?auto_15244 ?auto_15243 ) ( not ( = ?auto_15243 ?auto_15244 ) ) ( not ( = ?auto_15243 ?auto_15245 ) ) ( not ( = ?auto_15243 ?auto_15246 ) ) ( not ( = ?auto_15244 ?auto_15245 ) ) ( not ( = ?auto_15244 ?auto_15246 ) ) ( not ( = ?auto_15245 ?auto_15246 ) ) ( ON ?auto_15246 ?auto_15247 ) ( not ( = ?auto_15243 ?auto_15247 ) ) ( not ( = ?auto_15244 ?auto_15247 ) ) ( not ( = ?auto_15245 ?auto_15247 ) ) ( not ( = ?auto_15246 ?auto_15247 ) ) ( CLEAR ?auto_15244 ) ( ON ?auto_15245 ?auto_15246 ) ( CLEAR ?auto_15245 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15247 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15247 ?auto_15246 )
      ( MAKE-4PILE ?auto_15243 ?auto_15244 ?auto_15245 ?auto_15246 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15248 - BLOCK
      ?auto_15249 - BLOCK
      ?auto_15250 - BLOCK
      ?auto_15251 - BLOCK
    )
    :vars
    (
      ?auto_15252 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15248 ) ( not ( = ?auto_15248 ?auto_15249 ) ) ( not ( = ?auto_15248 ?auto_15250 ) ) ( not ( = ?auto_15248 ?auto_15251 ) ) ( not ( = ?auto_15249 ?auto_15250 ) ) ( not ( = ?auto_15249 ?auto_15251 ) ) ( not ( = ?auto_15250 ?auto_15251 ) ) ( ON ?auto_15251 ?auto_15252 ) ( not ( = ?auto_15248 ?auto_15252 ) ) ( not ( = ?auto_15249 ?auto_15252 ) ) ( not ( = ?auto_15250 ?auto_15252 ) ) ( not ( = ?auto_15251 ?auto_15252 ) ) ( ON ?auto_15250 ?auto_15251 ) ( CLEAR ?auto_15250 ) ( ON-TABLE ?auto_15252 ) ( HOLDING ?auto_15249 ) ( CLEAR ?auto_15248 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15248 ?auto_15249 )
      ( MAKE-4PILE ?auto_15248 ?auto_15249 ?auto_15250 ?auto_15251 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15253 - BLOCK
      ?auto_15254 - BLOCK
      ?auto_15255 - BLOCK
      ?auto_15256 - BLOCK
    )
    :vars
    (
      ?auto_15257 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15253 ) ( not ( = ?auto_15253 ?auto_15254 ) ) ( not ( = ?auto_15253 ?auto_15255 ) ) ( not ( = ?auto_15253 ?auto_15256 ) ) ( not ( = ?auto_15254 ?auto_15255 ) ) ( not ( = ?auto_15254 ?auto_15256 ) ) ( not ( = ?auto_15255 ?auto_15256 ) ) ( ON ?auto_15256 ?auto_15257 ) ( not ( = ?auto_15253 ?auto_15257 ) ) ( not ( = ?auto_15254 ?auto_15257 ) ) ( not ( = ?auto_15255 ?auto_15257 ) ) ( not ( = ?auto_15256 ?auto_15257 ) ) ( ON ?auto_15255 ?auto_15256 ) ( ON-TABLE ?auto_15257 ) ( CLEAR ?auto_15253 ) ( ON ?auto_15254 ?auto_15255 ) ( CLEAR ?auto_15254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15257 ?auto_15256 ?auto_15255 )
      ( MAKE-4PILE ?auto_15253 ?auto_15254 ?auto_15255 ?auto_15256 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15258 - BLOCK
      ?auto_15259 - BLOCK
      ?auto_15260 - BLOCK
      ?auto_15261 - BLOCK
    )
    :vars
    (
      ?auto_15262 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15258 ?auto_15259 ) ) ( not ( = ?auto_15258 ?auto_15260 ) ) ( not ( = ?auto_15258 ?auto_15261 ) ) ( not ( = ?auto_15259 ?auto_15260 ) ) ( not ( = ?auto_15259 ?auto_15261 ) ) ( not ( = ?auto_15260 ?auto_15261 ) ) ( ON ?auto_15261 ?auto_15262 ) ( not ( = ?auto_15258 ?auto_15262 ) ) ( not ( = ?auto_15259 ?auto_15262 ) ) ( not ( = ?auto_15260 ?auto_15262 ) ) ( not ( = ?auto_15261 ?auto_15262 ) ) ( ON ?auto_15260 ?auto_15261 ) ( ON-TABLE ?auto_15262 ) ( ON ?auto_15259 ?auto_15260 ) ( CLEAR ?auto_15259 ) ( HOLDING ?auto_15258 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15258 )
      ( MAKE-4PILE ?auto_15258 ?auto_15259 ?auto_15260 ?auto_15261 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15263 - BLOCK
      ?auto_15264 - BLOCK
      ?auto_15265 - BLOCK
      ?auto_15266 - BLOCK
    )
    :vars
    (
      ?auto_15267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15263 ?auto_15264 ) ) ( not ( = ?auto_15263 ?auto_15265 ) ) ( not ( = ?auto_15263 ?auto_15266 ) ) ( not ( = ?auto_15264 ?auto_15265 ) ) ( not ( = ?auto_15264 ?auto_15266 ) ) ( not ( = ?auto_15265 ?auto_15266 ) ) ( ON ?auto_15266 ?auto_15267 ) ( not ( = ?auto_15263 ?auto_15267 ) ) ( not ( = ?auto_15264 ?auto_15267 ) ) ( not ( = ?auto_15265 ?auto_15267 ) ) ( not ( = ?auto_15266 ?auto_15267 ) ) ( ON ?auto_15265 ?auto_15266 ) ( ON-TABLE ?auto_15267 ) ( ON ?auto_15264 ?auto_15265 ) ( ON ?auto_15263 ?auto_15264 ) ( CLEAR ?auto_15263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15267 ?auto_15266 ?auto_15265 ?auto_15264 )
      ( MAKE-4PILE ?auto_15263 ?auto_15264 ?auto_15265 ?auto_15266 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15271 - BLOCK
      ?auto_15272 - BLOCK
      ?auto_15273 - BLOCK
    )
    :vars
    (
      ?auto_15274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15274 ?auto_15273 ) ( CLEAR ?auto_15274 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15271 ) ( ON ?auto_15272 ?auto_15271 ) ( ON ?auto_15273 ?auto_15272 ) ( not ( = ?auto_15271 ?auto_15272 ) ) ( not ( = ?auto_15271 ?auto_15273 ) ) ( not ( = ?auto_15271 ?auto_15274 ) ) ( not ( = ?auto_15272 ?auto_15273 ) ) ( not ( = ?auto_15272 ?auto_15274 ) ) ( not ( = ?auto_15273 ?auto_15274 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15274 ?auto_15273 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15284 - BLOCK
      ?auto_15285 - BLOCK
      ?auto_15286 - BLOCK
    )
    :vars
    (
      ?auto_15287 - BLOCK
      ?auto_15288 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15284 ) ( ON ?auto_15285 ?auto_15284 ) ( not ( = ?auto_15284 ?auto_15285 ) ) ( not ( = ?auto_15284 ?auto_15286 ) ) ( not ( = ?auto_15284 ?auto_15287 ) ) ( not ( = ?auto_15285 ?auto_15286 ) ) ( not ( = ?auto_15285 ?auto_15287 ) ) ( not ( = ?auto_15286 ?auto_15287 ) ) ( ON ?auto_15287 ?auto_15288 ) ( CLEAR ?auto_15287 ) ( not ( = ?auto_15284 ?auto_15288 ) ) ( not ( = ?auto_15285 ?auto_15288 ) ) ( not ( = ?auto_15286 ?auto_15288 ) ) ( not ( = ?auto_15287 ?auto_15288 ) ) ( HOLDING ?auto_15286 ) ( CLEAR ?auto_15285 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15284 ?auto_15285 ?auto_15286 ?auto_15287 )
      ( MAKE-3PILE ?auto_15284 ?auto_15285 ?auto_15286 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15289 - BLOCK
      ?auto_15290 - BLOCK
      ?auto_15291 - BLOCK
    )
    :vars
    (
      ?auto_15293 - BLOCK
      ?auto_15292 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15289 ) ( ON ?auto_15290 ?auto_15289 ) ( not ( = ?auto_15289 ?auto_15290 ) ) ( not ( = ?auto_15289 ?auto_15291 ) ) ( not ( = ?auto_15289 ?auto_15293 ) ) ( not ( = ?auto_15290 ?auto_15291 ) ) ( not ( = ?auto_15290 ?auto_15293 ) ) ( not ( = ?auto_15291 ?auto_15293 ) ) ( ON ?auto_15293 ?auto_15292 ) ( not ( = ?auto_15289 ?auto_15292 ) ) ( not ( = ?auto_15290 ?auto_15292 ) ) ( not ( = ?auto_15291 ?auto_15292 ) ) ( not ( = ?auto_15293 ?auto_15292 ) ) ( CLEAR ?auto_15290 ) ( ON ?auto_15291 ?auto_15293 ) ( CLEAR ?auto_15291 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15292 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15292 ?auto_15293 )
      ( MAKE-3PILE ?auto_15289 ?auto_15290 ?auto_15291 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15294 - BLOCK
      ?auto_15295 - BLOCK
      ?auto_15296 - BLOCK
    )
    :vars
    (
      ?auto_15298 - BLOCK
      ?auto_15297 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15294 ) ( not ( = ?auto_15294 ?auto_15295 ) ) ( not ( = ?auto_15294 ?auto_15296 ) ) ( not ( = ?auto_15294 ?auto_15298 ) ) ( not ( = ?auto_15295 ?auto_15296 ) ) ( not ( = ?auto_15295 ?auto_15298 ) ) ( not ( = ?auto_15296 ?auto_15298 ) ) ( ON ?auto_15298 ?auto_15297 ) ( not ( = ?auto_15294 ?auto_15297 ) ) ( not ( = ?auto_15295 ?auto_15297 ) ) ( not ( = ?auto_15296 ?auto_15297 ) ) ( not ( = ?auto_15298 ?auto_15297 ) ) ( ON ?auto_15296 ?auto_15298 ) ( CLEAR ?auto_15296 ) ( ON-TABLE ?auto_15297 ) ( HOLDING ?auto_15295 ) ( CLEAR ?auto_15294 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15294 ?auto_15295 )
      ( MAKE-3PILE ?auto_15294 ?auto_15295 ?auto_15296 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15299 - BLOCK
      ?auto_15300 - BLOCK
      ?auto_15301 - BLOCK
    )
    :vars
    (
      ?auto_15303 - BLOCK
      ?auto_15302 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15299 ) ( not ( = ?auto_15299 ?auto_15300 ) ) ( not ( = ?auto_15299 ?auto_15301 ) ) ( not ( = ?auto_15299 ?auto_15303 ) ) ( not ( = ?auto_15300 ?auto_15301 ) ) ( not ( = ?auto_15300 ?auto_15303 ) ) ( not ( = ?auto_15301 ?auto_15303 ) ) ( ON ?auto_15303 ?auto_15302 ) ( not ( = ?auto_15299 ?auto_15302 ) ) ( not ( = ?auto_15300 ?auto_15302 ) ) ( not ( = ?auto_15301 ?auto_15302 ) ) ( not ( = ?auto_15303 ?auto_15302 ) ) ( ON ?auto_15301 ?auto_15303 ) ( ON-TABLE ?auto_15302 ) ( CLEAR ?auto_15299 ) ( ON ?auto_15300 ?auto_15301 ) ( CLEAR ?auto_15300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15302 ?auto_15303 ?auto_15301 )
      ( MAKE-3PILE ?auto_15299 ?auto_15300 ?auto_15301 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15304 - BLOCK
      ?auto_15305 - BLOCK
      ?auto_15306 - BLOCK
    )
    :vars
    (
      ?auto_15307 - BLOCK
      ?auto_15308 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15304 ?auto_15305 ) ) ( not ( = ?auto_15304 ?auto_15306 ) ) ( not ( = ?auto_15304 ?auto_15307 ) ) ( not ( = ?auto_15305 ?auto_15306 ) ) ( not ( = ?auto_15305 ?auto_15307 ) ) ( not ( = ?auto_15306 ?auto_15307 ) ) ( ON ?auto_15307 ?auto_15308 ) ( not ( = ?auto_15304 ?auto_15308 ) ) ( not ( = ?auto_15305 ?auto_15308 ) ) ( not ( = ?auto_15306 ?auto_15308 ) ) ( not ( = ?auto_15307 ?auto_15308 ) ) ( ON ?auto_15306 ?auto_15307 ) ( ON-TABLE ?auto_15308 ) ( ON ?auto_15305 ?auto_15306 ) ( CLEAR ?auto_15305 ) ( HOLDING ?auto_15304 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15304 )
      ( MAKE-3PILE ?auto_15304 ?auto_15305 ?auto_15306 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15309 - BLOCK
      ?auto_15310 - BLOCK
      ?auto_15311 - BLOCK
    )
    :vars
    (
      ?auto_15312 - BLOCK
      ?auto_15313 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15309 ?auto_15310 ) ) ( not ( = ?auto_15309 ?auto_15311 ) ) ( not ( = ?auto_15309 ?auto_15312 ) ) ( not ( = ?auto_15310 ?auto_15311 ) ) ( not ( = ?auto_15310 ?auto_15312 ) ) ( not ( = ?auto_15311 ?auto_15312 ) ) ( ON ?auto_15312 ?auto_15313 ) ( not ( = ?auto_15309 ?auto_15313 ) ) ( not ( = ?auto_15310 ?auto_15313 ) ) ( not ( = ?auto_15311 ?auto_15313 ) ) ( not ( = ?auto_15312 ?auto_15313 ) ) ( ON ?auto_15311 ?auto_15312 ) ( ON-TABLE ?auto_15313 ) ( ON ?auto_15310 ?auto_15311 ) ( ON ?auto_15309 ?auto_15310 ) ( CLEAR ?auto_15309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15313 ?auto_15312 ?auto_15311 ?auto_15310 )
      ( MAKE-3PILE ?auto_15309 ?auto_15310 ?auto_15311 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15315 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_15315 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_15315 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15316 - BLOCK
    )
    :vars
    (
      ?auto_15317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15316 ?auto_15317 ) ( CLEAR ?auto_15316 ) ( HAND-EMPTY ) ( not ( = ?auto_15316 ?auto_15317 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15316 ?auto_15317 )
      ( MAKE-1PILE ?auto_15316 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15318 - BLOCK
    )
    :vars
    (
      ?auto_15319 - BLOCK
      ?auto_15320 - BLOCK
      ?auto_15321 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15318 ?auto_15319 ) ) ( HOLDING ?auto_15318 ) ( CLEAR ?auto_15319 ) ( ON-TABLE ?auto_15320 ) ( ON ?auto_15321 ?auto_15320 ) ( ON ?auto_15319 ?auto_15321 ) ( not ( = ?auto_15320 ?auto_15321 ) ) ( not ( = ?auto_15320 ?auto_15319 ) ) ( not ( = ?auto_15320 ?auto_15318 ) ) ( not ( = ?auto_15321 ?auto_15319 ) ) ( not ( = ?auto_15321 ?auto_15318 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15320 ?auto_15321 ?auto_15319 ?auto_15318 )
      ( MAKE-1PILE ?auto_15318 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15322 - BLOCK
    )
    :vars
    (
      ?auto_15323 - BLOCK
      ?auto_15324 - BLOCK
      ?auto_15325 - BLOCK
      ?auto_15326 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15322 ?auto_15323 ) ) ( CLEAR ?auto_15323 ) ( ON-TABLE ?auto_15324 ) ( ON ?auto_15325 ?auto_15324 ) ( ON ?auto_15323 ?auto_15325 ) ( not ( = ?auto_15324 ?auto_15325 ) ) ( not ( = ?auto_15324 ?auto_15323 ) ) ( not ( = ?auto_15324 ?auto_15322 ) ) ( not ( = ?auto_15325 ?auto_15323 ) ) ( not ( = ?auto_15325 ?auto_15322 ) ) ( ON ?auto_15322 ?auto_15326 ) ( CLEAR ?auto_15322 ) ( HAND-EMPTY ) ( not ( = ?auto_15322 ?auto_15326 ) ) ( not ( = ?auto_15323 ?auto_15326 ) ) ( not ( = ?auto_15324 ?auto_15326 ) ) ( not ( = ?auto_15325 ?auto_15326 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15322 ?auto_15326 )
      ( MAKE-1PILE ?auto_15322 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15327 - BLOCK
    )
    :vars
    (
      ?auto_15330 - BLOCK
      ?auto_15329 - BLOCK
      ?auto_15328 - BLOCK
      ?auto_15331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15327 ?auto_15330 ) ) ( ON-TABLE ?auto_15329 ) ( ON ?auto_15328 ?auto_15329 ) ( not ( = ?auto_15329 ?auto_15328 ) ) ( not ( = ?auto_15329 ?auto_15330 ) ) ( not ( = ?auto_15329 ?auto_15327 ) ) ( not ( = ?auto_15328 ?auto_15330 ) ) ( not ( = ?auto_15328 ?auto_15327 ) ) ( ON ?auto_15327 ?auto_15331 ) ( CLEAR ?auto_15327 ) ( not ( = ?auto_15327 ?auto_15331 ) ) ( not ( = ?auto_15330 ?auto_15331 ) ) ( not ( = ?auto_15329 ?auto_15331 ) ) ( not ( = ?auto_15328 ?auto_15331 ) ) ( HOLDING ?auto_15330 ) ( CLEAR ?auto_15328 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15329 ?auto_15328 ?auto_15330 )
      ( MAKE-1PILE ?auto_15327 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15332 - BLOCK
    )
    :vars
    (
      ?auto_15334 - BLOCK
      ?auto_15336 - BLOCK
      ?auto_15335 - BLOCK
      ?auto_15333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15332 ?auto_15334 ) ) ( ON-TABLE ?auto_15336 ) ( ON ?auto_15335 ?auto_15336 ) ( not ( = ?auto_15336 ?auto_15335 ) ) ( not ( = ?auto_15336 ?auto_15334 ) ) ( not ( = ?auto_15336 ?auto_15332 ) ) ( not ( = ?auto_15335 ?auto_15334 ) ) ( not ( = ?auto_15335 ?auto_15332 ) ) ( ON ?auto_15332 ?auto_15333 ) ( not ( = ?auto_15332 ?auto_15333 ) ) ( not ( = ?auto_15334 ?auto_15333 ) ) ( not ( = ?auto_15336 ?auto_15333 ) ) ( not ( = ?auto_15335 ?auto_15333 ) ) ( CLEAR ?auto_15335 ) ( ON ?auto_15334 ?auto_15332 ) ( CLEAR ?auto_15334 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15333 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15333 ?auto_15332 )
      ( MAKE-1PILE ?auto_15332 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15337 - BLOCK
    )
    :vars
    (
      ?auto_15338 - BLOCK
      ?auto_15340 - BLOCK
      ?auto_15339 - BLOCK
      ?auto_15341 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15337 ?auto_15338 ) ) ( ON-TABLE ?auto_15340 ) ( not ( = ?auto_15340 ?auto_15339 ) ) ( not ( = ?auto_15340 ?auto_15338 ) ) ( not ( = ?auto_15340 ?auto_15337 ) ) ( not ( = ?auto_15339 ?auto_15338 ) ) ( not ( = ?auto_15339 ?auto_15337 ) ) ( ON ?auto_15337 ?auto_15341 ) ( not ( = ?auto_15337 ?auto_15341 ) ) ( not ( = ?auto_15338 ?auto_15341 ) ) ( not ( = ?auto_15340 ?auto_15341 ) ) ( not ( = ?auto_15339 ?auto_15341 ) ) ( ON ?auto_15338 ?auto_15337 ) ( CLEAR ?auto_15338 ) ( ON-TABLE ?auto_15341 ) ( HOLDING ?auto_15339 ) ( CLEAR ?auto_15340 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15340 ?auto_15339 )
      ( MAKE-1PILE ?auto_15337 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15342 - BLOCK
    )
    :vars
    (
      ?auto_15345 - BLOCK
      ?auto_15346 - BLOCK
      ?auto_15343 - BLOCK
      ?auto_15344 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15342 ?auto_15345 ) ) ( ON-TABLE ?auto_15346 ) ( not ( = ?auto_15346 ?auto_15343 ) ) ( not ( = ?auto_15346 ?auto_15345 ) ) ( not ( = ?auto_15346 ?auto_15342 ) ) ( not ( = ?auto_15343 ?auto_15345 ) ) ( not ( = ?auto_15343 ?auto_15342 ) ) ( ON ?auto_15342 ?auto_15344 ) ( not ( = ?auto_15342 ?auto_15344 ) ) ( not ( = ?auto_15345 ?auto_15344 ) ) ( not ( = ?auto_15346 ?auto_15344 ) ) ( not ( = ?auto_15343 ?auto_15344 ) ) ( ON ?auto_15345 ?auto_15342 ) ( ON-TABLE ?auto_15344 ) ( CLEAR ?auto_15346 ) ( ON ?auto_15343 ?auto_15345 ) ( CLEAR ?auto_15343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15344 ?auto_15342 ?auto_15345 )
      ( MAKE-1PILE ?auto_15342 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15347 - BLOCK
    )
    :vars
    (
      ?auto_15349 - BLOCK
      ?auto_15348 - BLOCK
      ?auto_15351 - BLOCK
      ?auto_15350 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15347 ?auto_15349 ) ) ( not ( = ?auto_15348 ?auto_15351 ) ) ( not ( = ?auto_15348 ?auto_15349 ) ) ( not ( = ?auto_15348 ?auto_15347 ) ) ( not ( = ?auto_15351 ?auto_15349 ) ) ( not ( = ?auto_15351 ?auto_15347 ) ) ( ON ?auto_15347 ?auto_15350 ) ( not ( = ?auto_15347 ?auto_15350 ) ) ( not ( = ?auto_15349 ?auto_15350 ) ) ( not ( = ?auto_15348 ?auto_15350 ) ) ( not ( = ?auto_15351 ?auto_15350 ) ) ( ON ?auto_15349 ?auto_15347 ) ( ON-TABLE ?auto_15350 ) ( ON ?auto_15351 ?auto_15349 ) ( CLEAR ?auto_15351 ) ( HOLDING ?auto_15348 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15348 )
      ( MAKE-1PILE ?auto_15347 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15352 - BLOCK
    )
    :vars
    (
      ?auto_15353 - BLOCK
      ?auto_15356 - BLOCK
      ?auto_15355 - BLOCK
      ?auto_15354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15352 ?auto_15353 ) ) ( not ( = ?auto_15356 ?auto_15355 ) ) ( not ( = ?auto_15356 ?auto_15353 ) ) ( not ( = ?auto_15356 ?auto_15352 ) ) ( not ( = ?auto_15355 ?auto_15353 ) ) ( not ( = ?auto_15355 ?auto_15352 ) ) ( ON ?auto_15352 ?auto_15354 ) ( not ( = ?auto_15352 ?auto_15354 ) ) ( not ( = ?auto_15353 ?auto_15354 ) ) ( not ( = ?auto_15356 ?auto_15354 ) ) ( not ( = ?auto_15355 ?auto_15354 ) ) ( ON ?auto_15353 ?auto_15352 ) ( ON-TABLE ?auto_15354 ) ( ON ?auto_15355 ?auto_15353 ) ( ON ?auto_15356 ?auto_15355 ) ( CLEAR ?auto_15356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15354 ?auto_15352 ?auto_15353 ?auto_15355 )
      ( MAKE-1PILE ?auto_15352 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15359 - BLOCK
      ?auto_15360 - BLOCK
    )
    :vars
    (
      ?auto_15361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15361 ?auto_15360 ) ( CLEAR ?auto_15361 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15359 ) ( ON ?auto_15360 ?auto_15359 ) ( not ( = ?auto_15359 ?auto_15360 ) ) ( not ( = ?auto_15359 ?auto_15361 ) ) ( not ( = ?auto_15360 ?auto_15361 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15361 ?auto_15360 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15362 - BLOCK
      ?auto_15363 - BLOCK
    )
    :vars
    (
      ?auto_15364 - BLOCK
      ?auto_15365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15364 ?auto_15363 ) ( CLEAR ?auto_15364 ) ( ON-TABLE ?auto_15362 ) ( ON ?auto_15363 ?auto_15362 ) ( not ( = ?auto_15362 ?auto_15363 ) ) ( not ( = ?auto_15362 ?auto_15364 ) ) ( not ( = ?auto_15363 ?auto_15364 ) ) ( HOLDING ?auto_15365 ) ( not ( = ?auto_15362 ?auto_15365 ) ) ( not ( = ?auto_15363 ?auto_15365 ) ) ( not ( = ?auto_15364 ?auto_15365 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_15365 )
      ( MAKE-2PILE ?auto_15362 ?auto_15363 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15366 - BLOCK
      ?auto_15367 - BLOCK
    )
    :vars
    (
      ?auto_15369 - BLOCK
      ?auto_15368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15369 ?auto_15367 ) ( ON-TABLE ?auto_15366 ) ( ON ?auto_15367 ?auto_15366 ) ( not ( = ?auto_15366 ?auto_15367 ) ) ( not ( = ?auto_15366 ?auto_15369 ) ) ( not ( = ?auto_15367 ?auto_15369 ) ) ( not ( = ?auto_15366 ?auto_15368 ) ) ( not ( = ?auto_15367 ?auto_15368 ) ) ( not ( = ?auto_15369 ?auto_15368 ) ) ( ON ?auto_15368 ?auto_15369 ) ( CLEAR ?auto_15368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15366 ?auto_15367 ?auto_15369 )
      ( MAKE-2PILE ?auto_15366 ?auto_15367 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15370 - BLOCK
      ?auto_15371 - BLOCK
    )
    :vars
    (
      ?auto_15372 - BLOCK
      ?auto_15373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15372 ?auto_15371 ) ( ON-TABLE ?auto_15370 ) ( ON ?auto_15371 ?auto_15370 ) ( not ( = ?auto_15370 ?auto_15371 ) ) ( not ( = ?auto_15370 ?auto_15372 ) ) ( not ( = ?auto_15371 ?auto_15372 ) ) ( not ( = ?auto_15370 ?auto_15373 ) ) ( not ( = ?auto_15371 ?auto_15373 ) ) ( not ( = ?auto_15372 ?auto_15373 ) ) ( HOLDING ?auto_15373 ) ( CLEAR ?auto_15372 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15370 ?auto_15371 ?auto_15372 ?auto_15373 )
      ( MAKE-2PILE ?auto_15370 ?auto_15371 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15374 - BLOCK
      ?auto_15375 - BLOCK
    )
    :vars
    (
      ?auto_15376 - BLOCK
      ?auto_15377 - BLOCK
      ?auto_15378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15376 ?auto_15375 ) ( ON-TABLE ?auto_15374 ) ( ON ?auto_15375 ?auto_15374 ) ( not ( = ?auto_15374 ?auto_15375 ) ) ( not ( = ?auto_15374 ?auto_15376 ) ) ( not ( = ?auto_15375 ?auto_15376 ) ) ( not ( = ?auto_15374 ?auto_15377 ) ) ( not ( = ?auto_15375 ?auto_15377 ) ) ( not ( = ?auto_15376 ?auto_15377 ) ) ( CLEAR ?auto_15376 ) ( ON ?auto_15377 ?auto_15378 ) ( CLEAR ?auto_15377 ) ( HAND-EMPTY ) ( not ( = ?auto_15374 ?auto_15378 ) ) ( not ( = ?auto_15375 ?auto_15378 ) ) ( not ( = ?auto_15376 ?auto_15378 ) ) ( not ( = ?auto_15377 ?auto_15378 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15377 ?auto_15378 )
      ( MAKE-2PILE ?auto_15374 ?auto_15375 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15389 - BLOCK
      ?auto_15390 - BLOCK
    )
    :vars
    (
      ?auto_15393 - BLOCK
      ?auto_15391 - BLOCK
      ?auto_15392 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15389 ) ( not ( = ?auto_15389 ?auto_15390 ) ) ( not ( = ?auto_15389 ?auto_15393 ) ) ( not ( = ?auto_15390 ?auto_15393 ) ) ( not ( = ?auto_15389 ?auto_15391 ) ) ( not ( = ?auto_15390 ?auto_15391 ) ) ( not ( = ?auto_15393 ?auto_15391 ) ) ( ON ?auto_15391 ?auto_15392 ) ( not ( = ?auto_15389 ?auto_15392 ) ) ( not ( = ?auto_15390 ?auto_15392 ) ) ( not ( = ?auto_15393 ?auto_15392 ) ) ( not ( = ?auto_15391 ?auto_15392 ) ) ( ON ?auto_15393 ?auto_15391 ) ( CLEAR ?auto_15393 ) ( HOLDING ?auto_15390 ) ( CLEAR ?auto_15389 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15389 ?auto_15390 ?auto_15393 )
      ( MAKE-2PILE ?auto_15389 ?auto_15390 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15394 - BLOCK
      ?auto_15395 - BLOCK
    )
    :vars
    (
      ?auto_15396 - BLOCK
      ?auto_15397 - BLOCK
      ?auto_15398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15394 ) ( not ( = ?auto_15394 ?auto_15395 ) ) ( not ( = ?auto_15394 ?auto_15396 ) ) ( not ( = ?auto_15395 ?auto_15396 ) ) ( not ( = ?auto_15394 ?auto_15397 ) ) ( not ( = ?auto_15395 ?auto_15397 ) ) ( not ( = ?auto_15396 ?auto_15397 ) ) ( ON ?auto_15397 ?auto_15398 ) ( not ( = ?auto_15394 ?auto_15398 ) ) ( not ( = ?auto_15395 ?auto_15398 ) ) ( not ( = ?auto_15396 ?auto_15398 ) ) ( not ( = ?auto_15397 ?auto_15398 ) ) ( ON ?auto_15396 ?auto_15397 ) ( CLEAR ?auto_15394 ) ( ON ?auto_15395 ?auto_15396 ) ( CLEAR ?auto_15395 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15398 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15398 ?auto_15397 ?auto_15396 )
      ( MAKE-2PILE ?auto_15394 ?auto_15395 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15399 - BLOCK
      ?auto_15400 - BLOCK
    )
    :vars
    (
      ?auto_15403 - BLOCK
      ?auto_15402 - BLOCK
      ?auto_15401 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15399 ?auto_15400 ) ) ( not ( = ?auto_15399 ?auto_15403 ) ) ( not ( = ?auto_15400 ?auto_15403 ) ) ( not ( = ?auto_15399 ?auto_15402 ) ) ( not ( = ?auto_15400 ?auto_15402 ) ) ( not ( = ?auto_15403 ?auto_15402 ) ) ( ON ?auto_15402 ?auto_15401 ) ( not ( = ?auto_15399 ?auto_15401 ) ) ( not ( = ?auto_15400 ?auto_15401 ) ) ( not ( = ?auto_15403 ?auto_15401 ) ) ( not ( = ?auto_15402 ?auto_15401 ) ) ( ON ?auto_15403 ?auto_15402 ) ( ON ?auto_15400 ?auto_15403 ) ( CLEAR ?auto_15400 ) ( ON-TABLE ?auto_15401 ) ( HOLDING ?auto_15399 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15399 )
      ( MAKE-2PILE ?auto_15399 ?auto_15400 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15404 - BLOCK
      ?auto_15405 - BLOCK
    )
    :vars
    (
      ?auto_15408 - BLOCK
      ?auto_15406 - BLOCK
      ?auto_15407 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15404 ?auto_15405 ) ) ( not ( = ?auto_15404 ?auto_15408 ) ) ( not ( = ?auto_15405 ?auto_15408 ) ) ( not ( = ?auto_15404 ?auto_15406 ) ) ( not ( = ?auto_15405 ?auto_15406 ) ) ( not ( = ?auto_15408 ?auto_15406 ) ) ( ON ?auto_15406 ?auto_15407 ) ( not ( = ?auto_15404 ?auto_15407 ) ) ( not ( = ?auto_15405 ?auto_15407 ) ) ( not ( = ?auto_15408 ?auto_15407 ) ) ( not ( = ?auto_15406 ?auto_15407 ) ) ( ON ?auto_15408 ?auto_15406 ) ( ON ?auto_15405 ?auto_15408 ) ( ON-TABLE ?auto_15407 ) ( ON ?auto_15404 ?auto_15405 ) ( CLEAR ?auto_15404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15407 ?auto_15406 ?auto_15408 ?auto_15405 )
      ( MAKE-2PILE ?auto_15404 ?auto_15405 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15411 - BLOCK
      ?auto_15412 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_15412 ) ( CLEAR ?auto_15411 ) ( ON-TABLE ?auto_15411 ) ( not ( = ?auto_15411 ?auto_15412 ) ) )
    :subtasks
    ( ( !STACK ?auto_15412 ?auto_15411 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15413 - BLOCK
      ?auto_15414 - BLOCK
    )
    :vars
    (
      ?auto_15415 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15413 ) ( ON-TABLE ?auto_15413 ) ( not ( = ?auto_15413 ?auto_15414 ) ) ( ON ?auto_15414 ?auto_15415 ) ( CLEAR ?auto_15414 ) ( HAND-EMPTY ) ( not ( = ?auto_15413 ?auto_15415 ) ) ( not ( = ?auto_15414 ?auto_15415 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15414 ?auto_15415 )
      ( MAKE-2PILE ?auto_15413 ?auto_15414 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15416 - BLOCK
      ?auto_15417 - BLOCK
    )
    :vars
    (
      ?auto_15418 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15416 ?auto_15417 ) ) ( ON ?auto_15417 ?auto_15418 ) ( CLEAR ?auto_15417 ) ( not ( = ?auto_15416 ?auto_15418 ) ) ( not ( = ?auto_15417 ?auto_15418 ) ) ( HOLDING ?auto_15416 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15416 )
      ( MAKE-2PILE ?auto_15416 ?auto_15417 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15419 - BLOCK
      ?auto_15420 - BLOCK
    )
    :vars
    (
      ?auto_15421 - BLOCK
      ?auto_15422 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15419 ?auto_15420 ) ) ( ON ?auto_15420 ?auto_15421 ) ( not ( = ?auto_15419 ?auto_15421 ) ) ( not ( = ?auto_15420 ?auto_15421 ) ) ( ON ?auto_15419 ?auto_15420 ) ( CLEAR ?auto_15419 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15422 ) ( ON ?auto_15421 ?auto_15422 ) ( not ( = ?auto_15422 ?auto_15421 ) ) ( not ( = ?auto_15422 ?auto_15420 ) ) ( not ( = ?auto_15422 ?auto_15419 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15422 ?auto_15421 ?auto_15420 )
      ( MAKE-2PILE ?auto_15419 ?auto_15420 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15423 - BLOCK
      ?auto_15424 - BLOCK
    )
    :vars
    (
      ?auto_15426 - BLOCK
      ?auto_15425 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15423 ?auto_15424 ) ) ( ON ?auto_15424 ?auto_15426 ) ( not ( = ?auto_15423 ?auto_15426 ) ) ( not ( = ?auto_15424 ?auto_15426 ) ) ( ON-TABLE ?auto_15425 ) ( ON ?auto_15426 ?auto_15425 ) ( not ( = ?auto_15425 ?auto_15426 ) ) ( not ( = ?auto_15425 ?auto_15424 ) ) ( not ( = ?auto_15425 ?auto_15423 ) ) ( HOLDING ?auto_15423 ) ( CLEAR ?auto_15424 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15425 ?auto_15426 ?auto_15424 ?auto_15423 )
      ( MAKE-2PILE ?auto_15423 ?auto_15424 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15427 - BLOCK
      ?auto_15428 - BLOCK
    )
    :vars
    (
      ?auto_15429 - BLOCK
      ?auto_15430 - BLOCK
      ?auto_15431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15427 ?auto_15428 ) ) ( ON ?auto_15428 ?auto_15429 ) ( not ( = ?auto_15427 ?auto_15429 ) ) ( not ( = ?auto_15428 ?auto_15429 ) ) ( ON-TABLE ?auto_15430 ) ( ON ?auto_15429 ?auto_15430 ) ( not ( = ?auto_15430 ?auto_15429 ) ) ( not ( = ?auto_15430 ?auto_15428 ) ) ( not ( = ?auto_15430 ?auto_15427 ) ) ( CLEAR ?auto_15428 ) ( ON ?auto_15427 ?auto_15431 ) ( CLEAR ?auto_15427 ) ( HAND-EMPTY ) ( not ( = ?auto_15427 ?auto_15431 ) ) ( not ( = ?auto_15428 ?auto_15431 ) ) ( not ( = ?auto_15429 ?auto_15431 ) ) ( not ( = ?auto_15430 ?auto_15431 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15427 ?auto_15431 )
      ( MAKE-2PILE ?auto_15427 ?auto_15428 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15432 - BLOCK
      ?auto_15433 - BLOCK
    )
    :vars
    (
      ?auto_15434 - BLOCK
      ?auto_15435 - BLOCK
      ?auto_15436 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15432 ?auto_15433 ) ) ( not ( = ?auto_15432 ?auto_15434 ) ) ( not ( = ?auto_15433 ?auto_15434 ) ) ( ON-TABLE ?auto_15435 ) ( ON ?auto_15434 ?auto_15435 ) ( not ( = ?auto_15435 ?auto_15434 ) ) ( not ( = ?auto_15435 ?auto_15433 ) ) ( not ( = ?auto_15435 ?auto_15432 ) ) ( ON ?auto_15432 ?auto_15436 ) ( CLEAR ?auto_15432 ) ( not ( = ?auto_15432 ?auto_15436 ) ) ( not ( = ?auto_15433 ?auto_15436 ) ) ( not ( = ?auto_15434 ?auto_15436 ) ) ( not ( = ?auto_15435 ?auto_15436 ) ) ( HOLDING ?auto_15433 ) ( CLEAR ?auto_15434 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15435 ?auto_15434 ?auto_15433 )
      ( MAKE-2PILE ?auto_15432 ?auto_15433 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15437 - BLOCK
      ?auto_15438 - BLOCK
    )
    :vars
    (
      ?auto_15440 - BLOCK
      ?auto_15439 - BLOCK
      ?auto_15441 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15437 ?auto_15438 ) ) ( not ( = ?auto_15437 ?auto_15440 ) ) ( not ( = ?auto_15438 ?auto_15440 ) ) ( ON-TABLE ?auto_15439 ) ( ON ?auto_15440 ?auto_15439 ) ( not ( = ?auto_15439 ?auto_15440 ) ) ( not ( = ?auto_15439 ?auto_15438 ) ) ( not ( = ?auto_15439 ?auto_15437 ) ) ( ON ?auto_15437 ?auto_15441 ) ( not ( = ?auto_15437 ?auto_15441 ) ) ( not ( = ?auto_15438 ?auto_15441 ) ) ( not ( = ?auto_15440 ?auto_15441 ) ) ( not ( = ?auto_15439 ?auto_15441 ) ) ( CLEAR ?auto_15440 ) ( ON ?auto_15438 ?auto_15437 ) ( CLEAR ?auto_15438 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15441 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15441 ?auto_15437 )
      ( MAKE-2PILE ?auto_15437 ?auto_15438 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15442 - BLOCK
      ?auto_15443 - BLOCK
    )
    :vars
    (
      ?auto_15445 - BLOCK
      ?auto_15444 - BLOCK
      ?auto_15446 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15442 ?auto_15443 ) ) ( not ( = ?auto_15442 ?auto_15445 ) ) ( not ( = ?auto_15443 ?auto_15445 ) ) ( ON-TABLE ?auto_15444 ) ( not ( = ?auto_15444 ?auto_15445 ) ) ( not ( = ?auto_15444 ?auto_15443 ) ) ( not ( = ?auto_15444 ?auto_15442 ) ) ( ON ?auto_15442 ?auto_15446 ) ( not ( = ?auto_15442 ?auto_15446 ) ) ( not ( = ?auto_15443 ?auto_15446 ) ) ( not ( = ?auto_15445 ?auto_15446 ) ) ( not ( = ?auto_15444 ?auto_15446 ) ) ( ON ?auto_15443 ?auto_15442 ) ( CLEAR ?auto_15443 ) ( ON-TABLE ?auto_15446 ) ( HOLDING ?auto_15445 ) ( CLEAR ?auto_15444 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15444 ?auto_15445 )
      ( MAKE-2PILE ?auto_15442 ?auto_15443 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15447 - BLOCK
      ?auto_15448 - BLOCK
    )
    :vars
    (
      ?auto_15449 - BLOCK
      ?auto_15451 - BLOCK
      ?auto_15450 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15447 ?auto_15448 ) ) ( not ( = ?auto_15447 ?auto_15449 ) ) ( not ( = ?auto_15448 ?auto_15449 ) ) ( ON-TABLE ?auto_15451 ) ( not ( = ?auto_15451 ?auto_15449 ) ) ( not ( = ?auto_15451 ?auto_15448 ) ) ( not ( = ?auto_15451 ?auto_15447 ) ) ( ON ?auto_15447 ?auto_15450 ) ( not ( = ?auto_15447 ?auto_15450 ) ) ( not ( = ?auto_15448 ?auto_15450 ) ) ( not ( = ?auto_15449 ?auto_15450 ) ) ( not ( = ?auto_15451 ?auto_15450 ) ) ( ON ?auto_15448 ?auto_15447 ) ( ON-TABLE ?auto_15450 ) ( CLEAR ?auto_15451 ) ( ON ?auto_15449 ?auto_15448 ) ( CLEAR ?auto_15449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15450 ?auto_15447 ?auto_15448 )
      ( MAKE-2PILE ?auto_15447 ?auto_15448 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15452 - BLOCK
      ?auto_15453 - BLOCK
    )
    :vars
    (
      ?auto_15455 - BLOCK
      ?auto_15454 - BLOCK
      ?auto_15456 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15452 ?auto_15453 ) ) ( not ( = ?auto_15452 ?auto_15455 ) ) ( not ( = ?auto_15453 ?auto_15455 ) ) ( not ( = ?auto_15454 ?auto_15455 ) ) ( not ( = ?auto_15454 ?auto_15453 ) ) ( not ( = ?auto_15454 ?auto_15452 ) ) ( ON ?auto_15452 ?auto_15456 ) ( not ( = ?auto_15452 ?auto_15456 ) ) ( not ( = ?auto_15453 ?auto_15456 ) ) ( not ( = ?auto_15455 ?auto_15456 ) ) ( not ( = ?auto_15454 ?auto_15456 ) ) ( ON ?auto_15453 ?auto_15452 ) ( ON-TABLE ?auto_15456 ) ( ON ?auto_15455 ?auto_15453 ) ( CLEAR ?auto_15455 ) ( HOLDING ?auto_15454 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15454 )
      ( MAKE-2PILE ?auto_15452 ?auto_15453 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15457 - BLOCK
      ?auto_15458 - BLOCK
    )
    :vars
    (
      ?auto_15459 - BLOCK
      ?auto_15460 - BLOCK
      ?auto_15461 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15457 ?auto_15458 ) ) ( not ( = ?auto_15457 ?auto_15459 ) ) ( not ( = ?auto_15458 ?auto_15459 ) ) ( not ( = ?auto_15460 ?auto_15459 ) ) ( not ( = ?auto_15460 ?auto_15458 ) ) ( not ( = ?auto_15460 ?auto_15457 ) ) ( ON ?auto_15457 ?auto_15461 ) ( not ( = ?auto_15457 ?auto_15461 ) ) ( not ( = ?auto_15458 ?auto_15461 ) ) ( not ( = ?auto_15459 ?auto_15461 ) ) ( not ( = ?auto_15460 ?auto_15461 ) ) ( ON ?auto_15458 ?auto_15457 ) ( ON-TABLE ?auto_15461 ) ( ON ?auto_15459 ?auto_15458 ) ( ON ?auto_15460 ?auto_15459 ) ( CLEAR ?auto_15460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15461 ?auto_15457 ?auto_15458 ?auto_15459 )
      ( MAKE-2PILE ?auto_15457 ?auto_15458 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15463 - BLOCK
    )
    :vars
    (
      ?auto_15464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15464 ?auto_15463 ) ( CLEAR ?auto_15464 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15463 ) ( not ( = ?auto_15463 ?auto_15464 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15464 ?auto_15463 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15465 - BLOCK
    )
    :vars
    (
      ?auto_15466 - BLOCK
      ?auto_15467 - BLOCK
      ?auto_15468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15466 ?auto_15465 ) ( CLEAR ?auto_15466 ) ( ON-TABLE ?auto_15465 ) ( not ( = ?auto_15465 ?auto_15466 ) ) ( HOLDING ?auto_15467 ) ( CLEAR ?auto_15468 ) ( not ( = ?auto_15465 ?auto_15467 ) ) ( not ( = ?auto_15465 ?auto_15468 ) ) ( not ( = ?auto_15466 ?auto_15467 ) ) ( not ( = ?auto_15466 ?auto_15468 ) ) ( not ( = ?auto_15467 ?auto_15468 ) ) )
    :subtasks
    ( ( !STACK ?auto_15467 ?auto_15468 )
      ( MAKE-1PILE ?auto_15465 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15469 - BLOCK
    )
    :vars
    (
      ?auto_15471 - BLOCK
      ?auto_15472 - BLOCK
      ?auto_15470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15471 ?auto_15469 ) ( ON-TABLE ?auto_15469 ) ( not ( = ?auto_15469 ?auto_15471 ) ) ( CLEAR ?auto_15472 ) ( not ( = ?auto_15469 ?auto_15470 ) ) ( not ( = ?auto_15469 ?auto_15472 ) ) ( not ( = ?auto_15471 ?auto_15470 ) ) ( not ( = ?auto_15471 ?auto_15472 ) ) ( not ( = ?auto_15470 ?auto_15472 ) ) ( ON ?auto_15470 ?auto_15471 ) ( CLEAR ?auto_15470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15469 ?auto_15471 )
      ( MAKE-1PILE ?auto_15469 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15473 - BLOCK
    )
    :vars
    (
      ?auto_15476 - BLOCK
      ?auto_15475 - BLOCK
      ?auto_15474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15476 ?auto_15473 ) ( ON-TABLE ?auto_15473 ) ( not ( = ?auto_15473 ?auto_15476 ) ) ( not ( = ?auto_15473 ?auto_15475 ) ) ( not ( = ?auto_15473 ?auto_15474 ) ) ( not ( = ?auto_15476 ?auto_15475 ) ) ( not ( = ?auto_15476 ?auto_15474 ) ) ( not ( = ?auto_15475 ?auto_15474 ) ) ( ON ?auto_15475 ?auto_15476 ) ( CLEAR ?auto_15475 ) ( HOLDING ?auto_15474 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15474 )
      ( MAKE-1PILE ?auto_15473 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15477 - BLOCK
    )
    :vars
    (
      ?auto_15479 - BLOCK
      ?auto_15478 - BLOCK
      ?auto_15480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15479 ?auto_15477 ) ( ON-TABLE ?auto_15477 ) ( not ( = ?auto_15477 ?auto_15479 ) ) ( not ( = ?auto_15477 ?auto_15478 ) ) ( not ( = ?auto_15477 ?auto_15480 ) ) ( not ( = ?auto_15479 ?auto_15478 ) ) ( not ( = ?auto_15479 ?auto_15480 ) ) ( not ( = ?auto_15478 ?auto_15480 ) ) ( ON ?auto_15478 ?auto_15479 ) ( ON ?auto_15480 ?auto_15478 ) ( CLEAR ?auto_15480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15477 ?auto_15479 ?auto_15478 )
      ( MAKE-1PILE ?auto_15477 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15481 - BLOCK
    )
    :vars
    (
      ?auto_15483 - BLOCK
      ?auto_15484 - BLOCK
      ?auto_15482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15483 ?auto_15481 ) ( ON-TABLE ?auto_15481 ) ( not ( = ?auto_15481 ?auto_15483 ) ) ( not ( = ?auto_15481 ?auto_15484 ) ) ( not ( = ?auto_15481 ?auto_15482 ) ) ( not ( = ?auto_15483 ?auto_15484 ) ) ( not ( = ?auto_15483 ?auto_15482 ) ) ( not ( = ?auto_15484 ?auto_15482 ) ) ( ON ?auto_15484 ?auto_15483 ) ( HOLDING ?auto_15482 ) ( CLEAR ?auto_15484 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15481 ?auto_15483 ?auto_15484 ?auto_15482 )
      ( MAKE-1PILE ?auto_15481 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15485 - BLOCK
    )
    :vars
    (
      ?auto_15488 - BLOCK
      ?auto_15486 - BLOCK
      ?auto_15487 - BLOCK
      ?auto_15489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15488 ?auto_15485 ) ( ON-TABLE ?auto_15485 ) ( not ( = ?auto_15485 ?auto_15488 ) ) ( not ( = ?auto_15485 ?auto_15486 ) ) ( not ( = ?auto_15485 ?auto_15487 ) ) ( not ( = ?auto_15488 ?auto_15486 ) ) ( not ( = ?auto_15488 ?auto_15487 ) ) ( not ( = ?auto_15486 ?auto_15487 ) ) ( ON ?auto_15486 ?auto_15488 ) ( CLEAR ?auto_15486 ) ( ON ?auto_15487 ?auto_15489 ) ( CLEAR ?auto_15487 ) ( HAND-EMPTY ) ( not ( = ?auto_15485 ?auto_15489 ) ) ( not ( = ?auto_15488 ?auto_15489 ) ) ( not ( = ?auto_15486 ?auto_15489 ) ) ( not ( = ?auto_15487 ?auto_15489 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15487 ?auto_15489 )
      ( MAKE-1PILE ?auto_15485 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15490 - BLOCK
    )
    :vars
    (
      ?auto_15493 - BLOCK
      ?auto_15494 - BLOCK
      ?auto_15492 - BLOCK
      ?auto_15491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15493 ?auto_15490 ) ( ON-TABLE ?auto_15490 ) ( not ( = ?auto_15490 ?auto_15493 ) ) ( not ( = ?auto_15490 ?auto_15494 ) ) ( not ( = ?auto_15490 ?auto_15492 ) ) ( not ( = ?auto_15493 ?auto_15494 ) ) ( not ( = ?auto_15493 ?auto_15492 ) ) ( not ( = ?auto_15494 ?auto_15492 ) ) ( ON ?auto_15492 ?auto_15491 ) ( CLEAR ?auto_15492 ) ( not ( = ?auto_15490 ?auto_15491 ) ) ( not ( = ?auto_15493 ?auto_15491 ) ) ( not ( = ?auto_15494 ?auto_15491 ) ) ( not ( = ?auto_15492 ?auto_15491 ) ) ( HOLDING ?auto_15494 ) ( CLEAR ?auto_15493 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15490 ?auto_15493 ?auto_15494 )
      ( MAKE-1PILE ?auto_15490 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15495 - BLOCK
    )
    :vars
    (
      ?auto_15499 - BLOCK
      ?auto_15496 - BLOCK
      ?auto_15497 - BLOCK
      ?auto_15498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15499 ?auto_15495 ) ( ON-TABLE ?auto_15495 ) ( not ( = ?auto_15495 ?auto_15499 ) ) ( not ( = ?auto_15495 ?auto_15496 ) ) ( not ( = ?auto_15495 ?auto_15497 ) ) ( not ( = ?auto_15499 ?auto_15496 ) ) ( not ( = ?auto_15499 ?auto_15497 ) ) ( not ( = ?auto_15496 ?auto_15497 ) ) ( ON ?auto_15497 ?auto_15498 ) ( not ( = ?auto_15495 ?auto_15498 ) ) ( not ( = ?auto_15499 ?auto_15498 ) ) ( not ( = ?auto_15496 ?auto_15498 ) ) ( not ( = ?auto_15497 ?auto_15498 ) ) ( CLEAR ?auto_15499 ) ( ON ?auto_15496 ?auto_15497 ) ( CLEAR ?auto_15496 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15498 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15498 ?auto_15497 )
      ( MAKE-1PILE ?auto_15495 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15510 - BLOCK
    )
    :vars
    (
      ?auto_15514 - BLOCK
      ?auto_15511 - BLOCK
      ?auto_15512 - BLOCK
      ?auto_15513 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15510 ?auto_15514 ) ) ( not ( = ?auto_15510 ?auto_15511 ) ) ( not ( = ?auto_15510 ?auto_15512 ) ) ( not ( = ?auto_15514 ?auto_15511 ) ) ( not ( = ?auto_15514 ?auto_15512 ) ) ( not ( = ?auto_15511 ?auto_15512 ) ) ( ON ?auto_15512 ?auto_15513 ) ( not ( = ?auto_15510 ?auto_15513 ) ) ( not ( = ?auto_15514 ?auto_15513 ) ) ( not ( = ?auto_15511 ?auto_15513 ) ) ( not ( = ?auto_15512 ?auto_15513 ) ) ( ON ?auto_15511 ?auto_15512 ) ( ON-TABLE ?auto_15513 ) ( ON ?auto_15514 ?auto_15511 ) ( CLEAR ?auto_15514 ) ( HOLDING ?auto_15510 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15510 ?auto_15514 )
      ( MAKE-1PILE ?auto_15510 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15515 - BLOCK
    )
    :vars
    (
      ?auto_15517 - BLOCK
      ?auto_15519 - BLOCK
      ?auto_15516 - BLOCK
      ?auto_15518 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15515 ?auto_15517 ) ) ( not ( = ?auto_15515 ?auto_15519 ) ) ( not ( = ?auto_15515 ?auto_15516 ) ) ( not ( = ?auto_15517 ?auto_15519 ) ) ( not ( = ?auto_15517 ?auto_15516 ) ) ( not ( = ?auto_15519 ?auto_15516 ) ) ( ON ?auto_15516 ?auto_15518 ) ( not ( = ?auto_15515 ?auto_15518 ) ) ( not ( = ?auto_15517 ?auto_15518 ) ) ( not ( = ?auto_15519 ?auto_15518 ) ) ( not ( = ?auto_15516 ?auto_15518 ) ) ( ON ?auto_15519 ?auto_15516 ) ( ON-TABLE ?auto_15518 ) ( ON ?auto_15517 ?auto_15519 ) ( ON ?auto_15515 ?auto_15517 ) ( CLEAR ?auto_15515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15518 ?auto_15516 ?auto_15519 ?auto_15517 )
      ( MAKE-1PILE ?auto_15515 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15523 - BLOCK
      ?auto_15524 - BLOCK
      ?auto_15525 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_15525 ) ( CLEAR ?auto_15524 ) ( ON-TABLE ?auto_15523 ) ( ON ?auto_15524 ?auto_15523 ) ( not ( = ?auto_15523 ?auto_15524 ) ) ( not ( = ?auto_15523 ?auto_15525 ) ) ( not ( = ?auto_15524 ?auto_15525 ) ) )
    :subtasks
    ( ( !STACK ?auto_15525 ?auto_15524 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15526 - BLOCK
      ?auto_15527 - BLOCK
      ?auto_15528 - BLOCK
    )
    :vars
    (
      ?auto_15529 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15527 ) ( ON-TABLE ?auto_15526 ) ( ON ?auto_15527 ?auto_15526 ) ( not ( = ?auto_15526 ?auto_15527 ) ) ( not ( = ?auto_15526 ?auto_15528 ) ) ( not ( = ?auto_15527 ?auto_15528 ) ) ( ON ?auto_15528 ?auto_15529 ) ( CLEAR ?auto_15528 ) ( HAND-EMPTY ) ( not ( = ?auto_15526 ?auto_15529 ) ) ( not ( = ?auto_15527 ?auto_15529 ) ) ( not ( = ?auto_15528 ?auto_15529 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15528 ?auto_15529 )
      ( MAKE-3PILE ?auto_15526 ?auto_15527 ?auto_15528 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15530 - BLOCK
      ?auto_15531 - BLOCK
      ?auto_15532 - BLOCK
    )
    :vars
    (
      ?auto_15533 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15530 ) ( not ( = ?auto_15530 ?auto_15531 ) ) ( not ( = ?auto_15530 ?auto_15532 ) ) ( not ( = ?auto_15531 ?auto_15532 ) ) ( ON ?auto_15532 ?auto_15533 ) ( CLEAR ?auto_15532 ) ( not ( = ?auto_15530 ?auto_15533 ) ) ( not ( = ?auto_15531 ?auto_15533 ) ) ( not ( = ?auto_15532 ?auto_15533 ) ) ( HOLDING ?auto_15531 ) ( CLEAR ?auto_15530 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15530 ?auto_15531 )
      ( MAKE-3PILE ?auto_15530 ?auto_15531 ?auto_15532 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15534 - BLOCK
      ?auto_15535 - BLOCK
      ?auto_15536 - BLOCK
    )
    :vars
    (
      ?auto_15537 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15534 ) ( not ( = ?auto_15534 ?auto_15535 ) ) ( not ( = ?auto_15534 ?auto_15536 ) ) ( not ( = ?auto_15535 ?auto_15536 ) ) ( ON ?auto_15536 ?auto_15537 ) ( not ( = ?auto_15534 ?auto_15537 ) ) ( not ( = ?auto_15535 ?auto_15537 ) ) ( not ( = ?auto_15536 ?auto_15537 ) ) ( CLEAR ?auto_15534 ) ( ON ?auto_15535 ?auto_15536 ) ( CLEAR ?auto_15535 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15537 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15537 ?auto_15536 )
      ( MAKE-3PILE ?auto_15534 ?auto_15535 ?auto_15536 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15538 - BLOCK
      ?auto_15539 - BLOCK
      ?auto_15540 - BLOCK
    )
    :vars
    (
      ?auto_15541 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15538 ?auto_15539 ) ) ( not ( = ?auto_15538 ?auto_15540 ) ) ( not ( = ?auto_15539 ?auto_15540 ) ) ( ON ?auto_15540 ?auto_15541 ) ( not ( = ?auto_15538 ?auto_15541 ) ) ( not ( = ?auto_15539 ?auto_15541 ) ) ( not ( = ?auto_15540 ?auto_15541 ) ) ( ON ?auto_15539 ?auto_15540 ) ( CLEAR ?auto_15539 ) ( ON-TABLE ?auto_15541 ) ( HOLDING ?auto_15538 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15538 )
      ( MAKE-3PILE ?auto_15538 ?auto_15539 ?auto_15540 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15542 - BLOCK
      ?auto_15543 - BLOCK
      ?auto_15544 - BLOCK
    )
    :vars
    (
      ?auto_15545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15542 ?auto_15543 ) ) ( not ( = ?auto_15542 ?auto_15544 ) ) ( not ( = ?auto_15543 ?auto_15544 ) ) ( ON ?auto_15544 ?auto_15545 ) ( not ( = ?auto_15542 ?auto_15545 ) ) ( not ( = ?auto_15543 ?auto_15545 ) ) ( not ( = ?auto_15544 ?auto_15545 ) ) ( ON ?auto_15543 ?auto_15544 ) ( ON-TABLE ?auto_15545 ) ( ON ?auto_15542 ?auto_15543 ) ( CLEAR ?auto_15542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15545 ?auto_15544 ?auto_15543 )
      ( MAKE-3PILE ?auto_15542 ?auto_15543 ?auto_15544 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15546 - BLOCK
      ?auto_15547 - BLOCK
      ?auto_15548 - BLOCK
    )
    :vars
    (
      ?auto_15549 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15546 ?auto_15547 ) ) ( not ( = ?auto_15546 ?auto_15548 ) ) ( not ( = ?auto_15547 ?auto_15548 ) ) ( ON ?auto_15548 ?auto_15549 ) ( not ( = ?auto_15546 ?auto_15549 ) ) ( not ( = ?auto_15547 ?auto_15549 ) ) ( not ( = ?auto_15548 ?auto_15549 ) ) ( ON ?auto_15547 ?auto_15548 ) ( ON-TABLE ?auto_15549 ) ( HOLDING ?auto_15546 ) ( CLEAR ?auto_15547 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15549 ?auto_15548 ?auto_15547 ?auto_15546 )
      ( MAKE-3PILE ?auto_15546 ?auto_15547 ?auto_15548 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15550 - BLOCK
      ?auto_15551 - BLOCK
      ?auto_15552 - BLOCK
    )
    :vars
    (
      ?auto_15553 - BLOCK
      ?auto_15554 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15550 ?auto_15551 ) ) ( not ( = ?auto_15550 ?auto_15552 ) ) ( not ( = ?auto_15551 ?auto_15552 ) ) ( ON ?auto_15552 ?auto_15553 ) ( not ( = ?auto_15550 ?auto_15553 ) ) ( not ( = ?auto_15551 ?auto_15553 ) ) ( not ( = ?auto_15552 ?auto_15553 ) ) ( ON ?auto_15551 ?auto_15552 ) ( ON-TABLE ?auto_15553 ) ( CLEAR ?auto_15551 ) ( ON ?auto_15550 ?auto_15554 ) ( CLEAR ?auto_15550 ) ( HAND-EMPTY ) ( not ( = ?auto_15550 ?auto_15554 ) ) ( not ( = ?auto_15551 ?auto_15554 ) ) ( not ( = ?auto_15552 ?auto_15554 ) ) ( not ( = ?auto_15553 ?auto_15554 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15550 ?auto_15554 )
      ( MAKE-3PILE ?auto_15550 ?auto_15551 ?auto_15552 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15555 - BLOCK
      ?auto_15556 - BLOCK
      ?auto_15557 - BLOCK
    )
    :vars
    (
      ?auto_15559 - BLOCK
      ?auto_15558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15555 ?auto_15556 ) ) ( not ( = ?auto_15555 ?auto_15557 ) ) ( not ( = ?auto_15556 ?auto_15557 ) ) ( ON ?auto_15557 ?auto_15559 ) ( not ( = ?auto_15555 ?auto_15559 ) ) ( not ( = ?auto_15556 ?auto_15559 ) ) ( not ( = ?auto_15557 ?auto_15559 ) ) ( ON-TABLE ?auto_15559 ) ( ON ?auto_15555 ?auto_15558 ) ( CLEAR ?auto_15555 ) ( not ( = ?auto_15555 ?auto_15558 ) ) ( not ( = ?auto_15556 ?auto_15558 ) ) ( not ( = ?auto_15557 ?auto_15558 ) ) ( not ( = ?auto_15559 ?auto_15558 ) ) ( HOLDING ?auto_15556 ) ( CLEAR ?auto_15557 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15559 ?auto_15557 ?auto_15556 )
      ( MAKE-3PILE ?auto_15555 ?auto_15556 ?auto_15557 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15560 - BLOCK
      ?auto_15561 - BLOCK
      ?auto_15562 - BLOCK
    )
    :vars
    (
      ?auto_15564 - BLOCK
      ?auto_15563 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15560 ?auto_15561 ) ) ( not ( = ?auto_15560 ?auto_15562 ) ) ( not ( = ?auto_15561 ?auto_15562 ) ) ( ON ?auto_15562 ?auto_15564 ) ( not ( = ?auto_15560 ?auto_15564 ) ) ( not ( = ?auto_15561 ?auto_15564 ) ) ( not ( = ?auto_15562 ?auto_15564 ) ) ( ON-TABLE ?auto_15564 ) ( ON ?auto_15560 ?auto_15563 ) ( not ( = ?auto_15560 ?auto_15563 ) ) ( not ( = ?auto_15561 ?auto_15563 ) ) ( not ( = ?auto_15562 ?auto_15563 ) ) ( not ( = ?auto_15564 ?auto_15563 ) ) ( CLEAR ?auto_15562 ) ( ON ?auto_15561 ?auto_15560 ) ( CLEAR ?auto_15561 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15563 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15563 ?auto_15560 )
      ( MAKE-3PILE ?auto_15560 ?auto_15561 ?auto_15562 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15565 - BLOCK
      ?auto_15566 - BLOCK
      ?auto_15567 - BLOCK
    )
    :vars
    (
      ?auto_15569 - BLOCK
      ?auto_15568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15565 ?auto_15566 ) ) ( not ( = ?auto_15565 ?auto_15567 ) ) ( not ( = ?auto_15566 ?auto_15567 ) ) ( not ( = ?auto_15565 ?auto_15569 ) ) ( not ( = ?auto_15566 ?auto_15569 ) ) ( not ( = ?auto_15567 ?auto_15569 ) ) ( ON-TABLE ?auto_15569 ) ( ON ?auto_15565 ?auto_15568 ) ( not ( = ?auto_15565 ?auto_15568 ) ) ( not ( = ?auto_15566 ?auto_15568 ) ) ( not ( = ?auto_15567 ?auto_15568 ) ) ( not ( = ?auto_15569 ?auto_15568 ) ) ( ON ?auto_15566 ?auto_15565 ) ( CLEAR ?auto_15566 ) ( ON-TABLE ?auto_15568 ) ( HOLDING ?auto_15567 ) ( CLEAR ?auto_15569 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15569 ?auto_15567 )
      ( MAKE-3PILE ?auto_15565 ?auto_15566 ?auto_15567 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15570 - BLOCK
      ?auto_15571 - BLOCK
      ?auto_15572 - BLOCK
    )
    :vars
    (
      ?auto_15573 - BLOCK
      ?auto_15574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15570 ?auto_15571 ) ) ( not ( = ?auto_15570 ?auto_15572 ) ) ( not ( = ?auto_15571 ?auto_15572 ) ) ( not ( = ?auto_15570 ?auto_15573 ) ) ( not ( = ?auto_15571 ?auto_15573 ) ) ( not ( = ?auto_15572 ?auto_15573 ) ) ( ON-TABLE ?auto_15573 ) ( ON ?auto_15570 ?auto_15574 ) ( not ( = ?auto_15570 ?auto_15574 ) ) ( not ( = ?auto_15571 ?auto_15574 ) ) ( not ( = ?auto_15572 ?auto_15574 ) ) ( not ( = ?auto_15573 ?auto_15574 ) ) ( ON ?auto_15571 ?auto_15570 ) ( ON-TABLE ?auto_15574 ) ( CLEAR ?auto_15573 ) ( ON ?auto_15572 ?auto_15571 ) ( CLEAR ?auto_15572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15574 ?auto_15570 ?auto_15571 )
      ( MAKE-3PILE ?auto_15570 ?auto_15571 ?auto_15572 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15575 - BLOCK
      ?auto_15576 - BLOCK
      ?auto_15577 - BLOCK
    )
    :vars
    (
      ?auto_15578 - BLOCK
      ?auto_15579 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15575 ?auto_15576 ) ) ( not ( = ?auto_15575 ?auto_15577 ) ) ( not ( = ?auto_15576 ?auto_15577 ) ) ( not ( = ?auto_15575 ?auto_15578 ) ) ( not ( = ?auto_15576 ?auto_15578 ) ) ( not ( = ?auto_15577 ?auto_15578 ) ) ( ON ?auto_15575 ?auto_15579 ) ( not ( = ?auto_15575 ?auto_15579 ) ) ( not ( = ?auto_15576 ?auto_15579 ) ) ( not ( = ?auto_15577 ?auto_15579 ) ) ( not ( = ?auto_15578 ?auto_15579 ) ) ( ON ?auto_15576 ?auto_15575 ) ( ON-TABLE ?auto_15579 ) ( ON ?auto_15577 ?auto_15576 ) ( CLEAR ?auto_15577 ) ( HOLDING ?auto_15578 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15578 )
      ( MAKE-3PILE ?auto_15575 ?auto_15576 ?auto_15577 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15580 - BLOCK
      ?auto_15581 - BLOCK
      ?auto_15582 - BLOCK
    )
    :vars
    (
      ?auto_15584 - BLOCK
      ?auto_15583 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15580 ?auto_15581 ) ) ( not ( = ?auto_15580 ?auto_15582 ) ) ( not ( = ?auto_15581 ?auto_15582 ) ) ( not ( = ?auto_15580 ?auto_15584 ) ) ( not ( = ?auto_15581 ?auto_15584 ) ) ( not ( = ?auto_15582 ?auto_15584 ) ) ( ON ?auto_15580 ?auto_15583 ) ( not ( = ?auto_15580 ?auto_15583 ) ) ( not ( = ?auto_15581 ?auto_15583 ) ) ( not ( = ?auto_15582 ?auto_15583 ) ) ( not ( = ?auto_15584 ?auto_15583 ) ) ( ON ?auto_15581 ?auto_15580 ) ( ON-TABLE ?auto_15583 ) ( ON ?auto_15582 ?auto_15581 ) ( ON ?auto_15584 ?auto_15582 ) ( CLEAR ?auto_15584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15583 ?auto_15580 ?auto_15581 ?auto_15582 )
      ( MAKE-3PILE ?auto_15580 ?auto_15581 ?auto_15582 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15589 - BLOCK
      ?auto_15590 - BLOCK
      ?auto_15591 - BLOCK
      ?auto_15592 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_15592 ) ( CLEAR ?auto_15591 ) ( ON-TABLE ?auto_15589 ) ( ON ?auto_15590 ?auto_15589 ) ( ON ?auto_15591 ?auto_15590 ) ( not ( = ?auto_15589 ?auto_15590 ) ) ( not ( = ?auto_15589 ?auto_15591 ) ) ( not ( = ?auto_15589 ?auto_15592 ) ) ( not ( = ?auto_15590 ?auto_15591 ) ) ( not ( = ?auto_15590 ?auto_15592 ) ) ( not ( = ?auto_15591 ?auto_15592 ) ) )
    :subtasks
    ( ( !STACK ?auto_15592 ?auto_15591 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15593 - BLOCK
      ?auto_15594 - BLOCK
      ?auto_15595 - BLOCK
      ?auto_15596 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15595 ) ( ON-TABLE ?auto_15593 ) ( ON ?auto_15594 ?auto_15593 ) ( ON ?auto_15595 ?auto_15594 ) ( not ( = ?auto_15593 ?auto_15594 ) ) ( not ( = ?auto_15593 ?auto_15595 ) ) ( not ( = ?auto_15593 ?auto_15596 ) ) ( not ( = ?auto_15594 ?auto_15595 ) ) ( not ( = ?auto_15594 ?auto_15596 ) ) ( not ( = ?auto_15595 ?auto_15596 ) ) ( ON-TABLE ?auto_15596 ) ( CLEAR ?auto_15596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_15596 )
      ( MAKE-4PILE ?auto_15593 ?auto_15594 ?auto_15595 ?auto_15596 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15597 - BLOCK
      ?auto_15598 - BLOCK
      ?auto_15599 - BLOCK
      ?auto_15600 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15597 ) ( ON ?auto_15598 ?auto_15597 ) ( not ( = ?auto_15597 ?auto_15598 ) ) ( not ( = ?auto_15597 ?auto_15599 ) ) ( not ( = ?auto_15597 ?auto_15600 ) ) ( not ( = ?auto_15598 ?auto_15599 ) ) ( not ( = ?auto_15598 ?auto_15600 ) ) ( not ( = ?auto_15599 ?auto_15600 ) ) ( ON-TABLE ?auto_15600 ) ( CLEAR ?auto_15600 ) ( HOLDING ?auto_15599 ) ( CLEAR ?auto_15598 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15597 ?auto_15598 ?auto_15599 )
      ( MAKE-4PILE ?auto_15597 ?auto_15598 ?auto_15599 ?auto_15600 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15601 - BLOCK
      ?auto_15602 - BLOCK
      ?auto_15603 - BLOCK
      ?auto_15604 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15601 ) ( ON ?auto_15602 ?auto_15601 ) ( not ( = ?auto_15601 ?auto_15602 ) ) ( not ( = ?auto_15601 ?auto_15603 ) ) ( not ( = ?auto_15601 ?auto_15604 ) ) ( not ( = ?auto_15602 ?auto_15603 ) ) ( not ( = ?auto_15602 ?auto_15604 ) ) ( not ( = ?auto_15603 ?auto_15604 ) ) ( ON-TABLE ?auto_15604 ) ( CLEAR ?auto_15602 ) ( ON ?auto_15603 ?auto_15604 ) ( CLEAR ?auto_15603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15604 )
      ( MAKE-4PILE ?auto_15601 ?auto_15602 ?auto_15603 ?auto_15604 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15605 - BLOCK
      ?auto_15606 - BLOCK
      ?auto_15607 - BLOCK
      ?auto_15608 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15605 ) ( not ( = ?auto_15605 ?auto_15606 ) ) ( not ( = ?auto_15605 ?auto_15607 ) ) ( not ( = ?auto_15605 ?auto_15608 ) ) ( not ( = ?auto_15606 ?auto_15607 ) ) ( not ( = ?auto_15606 ?auto_15608 ) ) ( not ( = ?auto_15607 ?auto_15608 ) ) ( ON-TABLE ?auto_15608 ) ( ON ?auto_15607 ?auto_15608 ) ( CLEAR ?auto_15607 ) ( HOLDING ?auto_15606 ) ( CLEAR ?auto_15605 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15605 ?auto_15606 )
      ( MAKE-4PILE ?auto_15605 ?auto_15606 ?auto_15607 ?auto_15608 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15609 - BLOCK
      ?auto_15610 - BLOCK
      ?auto_15611 - BLOCK
      ?auto_15612 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15609 ) ( not ( = ?auto_15609 ?auto_15610 ) ) ( not ( = ?auto_15609 ?auto_15611 ) ) ( not ( = ?auto_15609 ?auto_15612 ) ) ( not ( = ?auto_15610 ?auto_15611 ) ) ( not ( = ?auto_15610 ?auto_15612 ) ) ( not ( = ?auto_15611 ?auto_15612 ) ) ( ON-TABLE ?auto_15612 ) ( ON ?auto_15611 ?auto_15612 ) ( CLEAR ?auto_15609 ) ( ON ?auto_15610 ?auto_15611 ) ( CLEAR ?auto_15610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15612 ?auto_15611 )
      ( MAKE-4PILE ?auto_15609 ?auto_15610 ?auto_15611 ?auto_15612 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15613 - BLOCK
      ?auto_15614 - BLOCK
      ?auto_15615 - BLOCK
      ?auto_15616 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15613 ?auto_15614 ) ) ( not ( = ?auto_15613 ?auto_15615 ) ) ( not ( = ?auto_15613 ?auto_15616 ) ) ( not ( = ?auto_15614 ?auto_15615 ) ) ( not ( = ?auto_15614 ?auto_15616 ) ) ( not ( = ?auto_15615 ?auto_15616 ) ) ( ON-TABLE ?auto_15616 ) ( ON ?auto_15615 ?auto_15616 ) ( ON ?auto_15614 ?auto_15615 ) ( CLEAR ?auto_15614 ) ( HOLDING ?auto_15613 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15613 )
      ( MAKE-4PILE ?auto_15613 ?auto_15614 ?auto_15615 ?auto_15616 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15617 - BLOCK
      ?auto_15618 - BLOCK
      ?auto_15619 - BLOCK
      ?auto_15620 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15617 ?auto_15618 ) ) ( not ( = ?auto_15617 ?auto_15619 ) ) ( not ( = ?auto_15617 ?auto_15620 ) ) ( not ( = ?auto_15618 ?auto_15619 ) ) ( not ( = ?auto_15618 ?auto_15620 ) ) ( not ( = ?auto_15619 ?auto_15620 ) ) ( ON-TABLE ?auto_15620 ) ( ON ?auto_15619 ?auto_15620 ) ( ON ?auto_15618 ?auto_15619 ) ( ON ?auto_15617 ?auto_15618 ) ( CLEAR ?auto_15617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15620 ?auto_15619 ?auto_15618 )
      ( MAKE-4PILE ?auto_15617 ?auto_15618 ?auto_15619 ?auto_15620 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15621 - BLOCK
      ?auto_15622 - BLOCK
      ?auto_15623 - BLOCK
      ?auto_15624 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15621 ?auto_15622 ) ) ( not ( = ?auto_15621 ?auto_15623 ) ) ( not ( = ?auto_15621 ?auto_15624 ) ) ( not ( = ?auto_15622 ?auto_15623 ) ) ( not ( = ?auto_15622 ?auto_15624 ) ) ( not ( = ?auto_15623 ?auto_15624 ) ) ( ON-TABLE ?auto_15624 ) ( ON ?auto_15623 ?auto_15624 ) ( ON ?auto_15622 ?auto_15623 ) ( HOLDING ?auto_15621 ) ( CLEAR ?auto_15622 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15624 ?auto_15623 ?auto_15622 ?auto_15621 )
      ( MAKE-4PILE ?auto_15621 ?auto_15622 ?auto_15623 ?auto_15624 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15625 - BLOCK
      ?auto_15626 - BLOCK
      ?auto_15627 - BLOCK
      ?auto_15628 - BLOCK
    )
    :vars
    (
      ?auto_15629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15625 ?auto_15626 ) ) ( not ( = ?auto_15625 ?auto_15627 ) ) ( not ( = ?auto_15625 ?auto_15628 ) ) ( not ( = ?auto_15626 ?auto_15627 ) ) ( not ( = ?auto_15626 ?auto_15628 ) ) ( not ( = ?auto_15627 ?auto_15628 ) ) ( ON-TABLE ?auto_15628 ) ( ON ?auto_15627 ?auto_15628 ) ( ON ?auto_15626 ?auto_15627 ) ( CLEAR ?auto_15626 ) ( ON ?auto_15625 ?auto_15629 ) ( CLEAR ?auto_15625 ) ( HAND-EMPTY ) ( not ( = ?auto_15625 ?auto_15629 ) ) ( not ( = ?auto_15626 ?auto_15629 ) ) ( not ( = ?auto_15627 ?auto_15629 ) ) ( not ( = ?auto_15628 ?auto_15629 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15625 ?auto_15629 )
      ( MAKE-4PILE ?auto_15625 ?auto_15626 ?auto_15627 ?auto_15628 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15630 - BLOCK
      ?auto_15631 - BLOCK
      ?auto_15632 - BLOCK
      ?auto_15633 - BLOCK
    )
    :vars
    (
      ?auto_15634 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15630 ?auto_15631 ) ) ( not ( = ?auto_15630 ?auto_15632 ) ) ( not ( = ?auto_15630 ?auto_15633 ) ) ( not ( = ?auto_15631 ?auto_15632 ) ) ( not ( = ?auto_15631 ?auto_15633 ) ) ( not ( = ?auto_15632 ?auto_15633 ) ) ( ON-TABLE ?auto_15633 ) ( ON ?auto_15632 ?auto_15633 ) ( ON ?auto_15630 ?auto_15634 ) ( CLEAR ?auto_15630 ) ( not ( = ?auto_15630 ?auto_15634 ) ) ( not ( = ?auto_15631 ?auto_15634 ) ) ( not ( = ?auto_15632 ?auto_15634 ) ) ( not ( = ?auto_15633 ?auto_15634 ) ) ( HOLDING ?auto_15631 ) ( CLEAR ?auto_15632 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15633 ?auto_15632 ?auto_15631 )
      ( MAKE-4PILE ?auto_15630 ?auto_15631 ?auto_15632 ?auto_15633 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15635 - BLOCK
      ?auto_15636 - BLOCK
      ?auto_15637 - BLOCK
      ?auto_15638 - BLOCK
    )
    :vars
    (
      ?auto_15639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15635 ?auto_15636 ) ) ( not ( = ?auto_15635 ?auto_15637 ) ) ( not ( = ?auto_15635 ?auto_15638 ) ) ( not ( = ?auto_15636 ?auto_15637 ) ) ( not ( = ?auto_15636 ?auto_15638 ) ) ( not ( = ?auto_15637 ?auto_15638 ) ) ( ON-TABLE ?auto_15638 ) ( ON ?auto_15637 ?auto_15638 ) ( ON ?auto_15635 ?auto_15639 ) ( not ( = ?auto_15635 ?auto_15639 ) ) ( not ( = ?auto_15636 ?auto_15639 ) ) ( not ( = ?auto_15637 ?auto_15639 ) ) ( not ( = ?auto_15638 ?auto_15639 ) ) ( CLEAR ?auto_15637 ) ( ON ?auto_15636 ?auto_15635 ) ( CLEAR ?auto_15636 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15639 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15639 ?auto_15635 )
      ( MAKE-4PILE ?auto_15635 ?auto_15636 ?auto_15637 ?auto_15638 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15640 - BLOCK
      ?auto_15641 - BLOCK
      ?auto_15642 - BLOCK
      ?auto_15643 - BLOCK
    )
    :vars
    (
      ?auto_15644 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15640 ?auto_15641 ) ) ( not ( = ?auto_15640 ?auto_15642 ) ) ( not ( = ?auto_15640 ?auto_15643 ) ) ( not ( = ?auto_15641 ?auto_15642 ) ) ( not ( = ?auto_15641 ?auto_15643 ) ) ( not ( = ?auto_15642 ?auto_15643 ) ) ( ON-TABLE ?auto_15643 ) ( ON ?auto_15640 ?auto_15644 ) ( not ( = ?auto_15640 ?auto_15644 ) ) ( not ( = ?auto_15641 ?auto_15644 ) ) ( not ( = ?auto_15642 ?auto_15644 ) ) ( not ( = ?auto_15643 ?auto_15644 ) ) ( ON ?auto_15641 ?auto_15640 ) ( CLEAR ?auto_15641 ) ( ON-TABLE ?auto_15644 ) ( HOLDING ?auto_15642 ) ( CLEAR ?auto_15643 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15643 ?auto_15642 )
      ( MAKE-4PILE ?auto_15640 ?auto_15641 ?auto_15642 ?auto_15643 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15645 - BLOCK
      ?auto_15646 - BLOCK
      ?auto_15647 - BLOCK
      ?auto_15648 - BLOCK
    )
    :vars
    (
      ?auto_15649 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15645 ?auto_15646 ) ) ( not ( = ?auto_15645 ?auto_15647 ) ) ( not ( = ?auto_15645 ?auto_15648 ) ) ( not ( = ?auto_15646 ?auto_15647 ) ) ( not ( = ?auto_15646 ?auto_15648 ) ) ( not ( = ?auto_15647 ?auto_15648 ) ) ( ON-TABLE ?auto_15648 ) ( ON ?auto_15645 ?auto_15649 ) ( not ( = ?auto_15645 ?auto_15649 ) ) ( not ( = ?auto_15646 ?auto_15649 ) ) ( not ( = ?auto_15647 ?auto_15649 ) ) ( not ( = ?auto_15648 ?auto_15649 ) ) ( ON ?auto_15646 ?auto_15645 ) ( ON-TABLE ?auto_15649 ) ( CLEAR ?auto_15648 ) ( ON ?auto_15647 ?auto_15646 ) ( CLEAR ?auto_15647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15649 ?auto_15645 ?auto_15646 )
      ( MAKE-4PILE ?auto_15645 ?auto_15646 ?auto_15647 ?auto_15648 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15650 - BLOCK
      ?auto_15651 - BLOCK
      ?auto_15652 - BLOCK
      ?auto_15653 - BLOCK
    )
    :vars
    (
      ?auto_15654 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15650 ?auto_15651 ) ) ( not ( = ?auto_15650 ?auto_15652 ) ) ( not ( = ?auto_15650 ?auto_15653 ) ) ( not ( = ?auto_15651 ?auto_15652 ) ) ( not ( = ?auto_15651 ?auto_15653 ) ) ( not ( = ?auto_15652 ?auto_15653 ) ) ( ON ?auto_15650 ?auto_15654 ) ( not ( = ?auto_15650 ?auto_15654 ) ) ( not ( = ?auto_15651 ?auto_15654 ) ) ( not ( = ?auto_15652 ?auto_15654 ) ) ( not ( = ?auto_15653 ?auto_15654 ) ) ( ON ?auto_15651 ?auto_15650 ) ( ON-TABLE ?auto_15654 ) ( ON ?auto_15652 ?auto_15651 ) ( CLEAR ?auto_15652 ) ( HOLDING ?auto_15653 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15653 )
      ( MAKE-4PILE ?auto_15650 ?auto_15651 ?auto_15652 ?auto_15653 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15655 - BLOCK
      ?auto_15656 - BLOCK
      ?auto_15657 - BLOCK
      ?auto_15658 - BLOCK
    )
    :vars
    (
      ?auto_15659 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15655 ?auto_15656 ) ) ( not ( = ?auto_15655 ?auto_15657 ) ) ( not ( = ?auto_15655 ?auto_15658 ) ) ( not ( = ?auto_15656 ?auto_15657 ) ) ( not ( = ?auto_15656 ?auto_15658 ) ) ( not ( = ?auto_15657 ?auto_15658 ) ) ( ON ?auto_15655 ?auto_15659 ) ( not ( = ?auto_15655 ?auto_15659 ) ) ( not ( = ?auto_15656 ?auto_15659 ) ) ( not ( = ?auto_15657 ?auto_15659 ) ) ( not ( = ?auto_15658 ?auto_15659 ) ) ( ON ?auto_15656 ?auto_15655 ) ( ON-TABLE ?auto_15659 ) ( ON ?auto_15657 ?auto_15656 ) ( ON ?auto_15658 ?auto_15657 ) ( CLEAR ?auto_15658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15659 ?auto_15655 ?auto_15656 ?auto_15657 )
      ( MAKE-4PILE ?auto_15655 ?auto_15656 ?auto_15657 ?auto_15658 ) )
  )

)

