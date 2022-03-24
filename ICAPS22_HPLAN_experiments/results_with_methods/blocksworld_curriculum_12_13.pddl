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

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_186098 - BLOCK
    )
    :vars
    (
      ?auto_186099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186098 ?auto_186099 ) ( CLEAR ?auto_186098 ) ( HAND-EMPTY ) ( not ( = ?auto_186098 ?auto_186099 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186098 ?auto_186099 )
      ( !PUTDOWN ?auto_186098 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_186101 - BLOCK
    )
    :vars
    (
      ?auto_186102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186101 ?auto_186102 ) ( CLEAR ?auto_186101 ) ( HAND-EMPTY ) ( not ( = ?auto_186101 ?auto_186102 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186101 ?auto_186102 )
      ( !PUTDOWN ?auto_186101 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186105 - BLOCK
      ?auto_186106 - BLOCK
    )
    :vars
    (
      ?auto_186107 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_186105 ) ( ON ?auto_186106 ?auto_186107 ) ( CLEAR ?auto_186106 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186105 ) ( not ( = ?auto_186105 ?auto_186106 ) ) ( not ( = ?auto_186105 ?auto_186107 ) ) ( not ( = ?auto_186106 ?auto_186107 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186106 ?auto_186107 )
      ( !STACK ?auto_186106 ?auto_186105 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186110 - BLOCK
      ?auto_186111 - BLOCK
    )
    :vars
    (
      ?auto_186112 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_186110 ) ( ON ?auto_186111 ?auto_186112 ) ( CLEAR ?auto_186111 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186110 ) ( not ( = ?auto_186110 ?auto_186111 ) ) ( not ( = ?auto_186110 ?auto_186112 ) ) ( not ( = ?auto_186111 ?auto_186112 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186111 ?auto_186112 )
      ( !STACK ?auto_186111 ?auto_186110 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186115 - BLOCK
      ?auto_186116 - BLOCK
    )
    :vars
    (
      ?auto_186117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186116 ?auto_186117 ) ( not ( = ?auto_186115 ?auto_186116 ) ) ( not ( = ?auto_186115 ?auto_186117 ) ) ( not ( = ?auto_186116 ?auto_186117 ) ) ( ON ?auto_186115 ?auto_186116 ) ( CLEAR ?auto_186115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186115 )
      ( MAKE-2PILE ?auto_186115 ?auto_186116 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186120 - BLOCK
      ?auto_186121 - BLOCK
    )
    :vars
    (
      ?auto_186122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186121 ?auto_186122 ) ( not ( = ?auto_186120 ?auto_186121 ) ) ( not ( = ?auto_186120 ?auto_186122 ) ) ( not ( = ?auto_186121 ?auto_186122 ) ) ( ON ?auto_186120 ?auto_186121 ) ( CLEAR ?auto_186120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186120 )
      ( MAKE-2PILE ?auto_186120 ?auto_186121 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186126 - BLOCK
      ?auto_186127 - BLOCK
      ?auto_186128 - BLOCK
    )
    :vars
    (
      ?auto_186129 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_186127 ) ( ON ?auto_186128 ?auto_186129 ) ( CLEAR ?auto_186128 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186126 ) ( ON ?auto_186127 ?auto_186126 ) ( not ( = ?auto_186126 ?auto_186127 ) ) ( not ( = ?auto_186126 ?auto_186128 ) ) ( not ( = ?auto_186126 ?auto_186129 ) ) ( not ( = ?auto_186127 ?auto_186128 ) ) ( not ( = ?auto_186127 ?auto_186129 ) ) ( not ( = ?auto_186128 ?auto_186129 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186128 ?auto_186129 )
      ( !STACK ?auto_186128 ?auto_186127 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186133 - BLOCK
      ?auto_186134 - BLOCK
      ?auto_186135 - BLOCK
    )
    :vars
    (
      ?auto_186136 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_186134 ) ( ON ?auto_186135 ?auto_186136 ) ( CLEAR ?auto_186135 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186133 ) ( ON ?auto_186134 ?auto_186133 ) ( not ( = ?auto_186133 ?auto_186134 ) ) ( not ( = ?auto_186133 ?auto_186135 ) ) ( not ( = ?auto_186133 ?auto_186136 ) ) ( not ( = ?auto_186134 ?auto_186135 ) ) ( not ( = ?auto_186134 ?auto_186136 ) ) ( not ( = ?auto_186135 ?auto_186136 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186135 ?auto_186136 )
      ( !STACK ?auto_186135 ?auto_186134 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186140 - BLOCK
      ?auto_186141 - BLOCK
      ?auto_186142 - BLOCK
    )
    :vars
    (
      ?auto_186143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186142 ?auto_186143 ) ( ON-TABLE ?auto_186140 ) ( not ( = ?auto_186140 ?auto_186141 ) ) ( not ( = ?auto_186140 ?auto_186142 ) ) ( not ( = ?auto_186140 ?auto_186143 ) ) ( not ( = ?auto_186141 ?auto_186142 ) ) ( not ( = ?auto_186141 ?auto_186143 ) ) ( not ( = ?auto_186142 ?auto_186143 ) ) ( CLEAR ?auto_186140 ) ( ON ?auto_186141 ?auto_186142 ) ( CLEAR ?auto_186141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186140 ?auto_186141 )
      ( MAKE-3PILE ?auto_186140 ?auto_186141 ?auto_186142 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186147 - BLOCK
      ?auto_186148 - BLOCK
      ?auto_186149 - BLOCK
    )
    :vars
    (
      ?auto_186150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186149 ?auto_186150 ) ( ON-TABLE ?auto_186147 ) ( not ( = ?auto_186147 ?auto_186148 ) ) ( not ( = ?auto_186147 ?auto_186149 ) ) ( not ( = ?auto_186147 ?auto_186150 ) ) ( not ( = ?auto_186148 ?auto_186149 ) ) ( not ( = ?auto_186148 ?auto_186150 ) ) ( not ( = ?auto_186149 ?auto_186150 ) ) ( CLEAR ?auto_186147 ) ( ON ?auto_186148 ?auto_186149 ) ( CLEAR ?auto_186148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186147 ?auto_186148 )
      ( MAKE-3PILE ?auto_186147 ?auto_186148 ?auto_186149 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186154 - BLOCK
      ?auto_186155 - BLOCK
      ?auto_186156 - BLOCK
    )
    :vars
    (
      ?auto_186157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186156 ?auto_186157 ) ( not ( = ?auto_186154 ?auto_186155 ) ) ( not ( = ?auto_186154 ?auto_186156 ) ) ( not ( = ?auto_186154 ?auto_186157 ) ) ( not ( = ?auto_186155 ?auto_186156 ) ) ( not ( = ?auto_186155 ?auto_186157 ) ) ( not ( = ?auto_186156 ?auto_186157 ) ) ( ON ?auto_186155 ?auto_186156 ) ( ON ?auto_186154 ?auto_186155 ) ( CLEAR ?auto_186154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186154 )
      ( MAKE-3PILE ?auto_186154 ?auto_186155 ?auto_186156 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186161 - BLOCK
      ?auto_186162 - BLOCK
      ?auto_186163 - BLOCK
    )
    :vars
    (
      ?auto_186164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186163 ?auto_186164 ) ( not ( = ?auto_186161 ?auto_186162 ) ) ( not ( = ?auto_186161 ?auto_186163 ) ) ( not ( = ?auto_186161 ?auto_186164 ) ) ( not ( = ?auto_186162 ?auto_186163 ) ) ( not ( = ?auto_186162 ?auto_186164 ) ) ( not ( = ?auto_186163 ?auto_186164 ) ) ( ON ?auto_186162 ?auto_186163 ) ( ON ?auto_186161 ?auto_186162 ) ( CLEAR ?auto_186161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186161 )
      ( MAKE-3PILE ?auto_186161 ?auto_186162 ?auto_186163 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186169 - BLOCK
      ?auto_186170 - BLOCK
      ?auto_186171 - BLOCK
      ?auto_186172 - BLOCK
    )
    :vars
    (
      ?auto_186173 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_186171 ) ( ON ?auto_186172 ?auto_186173 ) ( CLEAR ?auto_186172 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186169 ) ( ON ?auto_186170 ?auto_186169 ) ( ON ?auto_186171 ?auto_186170 ) ( not ( = ?auto_186169 ?auto_186170 ) ) ( not ( = ?auto_186169 ?auto_186171 ) ) ( not ( = ?auto_186169 ?auto_186172 ) ) ( not ( = ?auto_186169 ?auto_186173 ) ) ( not ( = ?auto_186170 ?auto_186171 ) ) ( not ( = ?auto_186170 ?auto_186172 ) ) ( not ( = ?auto_186170 ?auto_186173 ) ) ( not ( = ?auto_186171 ?auto_186172 ) ) ( not ( = ?auto_186171 ?auto_186173 ) ) ( not ( = ?auto_186172 ?auto_186173 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186172 ?auto_186173 )
      ( !STACK ?auto_186172 ?auto_186171 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186178 - BLOCK
      ?auto_186179 - BLOCK
      ?auto_186180 - BLOCK
      ?auto_186181 - BLOCK
    )
    :vars
    (
      ?auto_186182 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_186180 ) ( ON ?auto_186181 ?auto_186182 ) ( CLEAR ?auto_186181 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186178 ) ( ON ?auto_186179 ?auto_186178 ) ( ON ?auto_186180 ?auto_186179 ) ( not ( = ?auto_186178 ?auto_186179 ) ) ( not ( = ?auto_186178 ?auto_186180 ) ) ( not ( = ?auto_186178 ?auto_186181 ) ) ( not ( = ?auto_186178 ?auto_186182 ) ) ( not ( = ?auto_186179 ?auto_186180 ) ) ( not ( = ?auto_186179 ?auto_186181 ) ) ( not ( = ?auto_186179 ?auto_186182 ) ) ( not ( = ?auto_186180 ?auto_186181 ) ) ( not ( = ?auto_186180 ?auto_186182 ) ) ( not ( = ?auto_186181 ?auto_186182 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186181 ?auto_186182 )
      ( !STACK ?auto_186181 ?auto_186180 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186187 - BLOCK
      ?auto_186188 - BLOCK
      ?auto_186189 - BLOCK
      ?auto_186190 - BLOCK
    )
    :vars
    (
      ?auto_186191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186190 ?auto_186191 ) ( ON-TABLE ?auto_186187 ) ( ON ?auto_186188 ?auto_186187 ) ( not ( = ?auto_186187 ?auto_186188 ) ) ( not ( = ?auto_186187 ?auto_186189 ) ) ( not ( = ?auto_186187 ?auto_186190 ) ) ( not ( = ?auto_186187 ?auto_186191 ) ) ( not ( = ?auto_186188 ?auto_186189 ) ) ( not ( = ?auto_186188 ?auto_186190 ) ) ( not ( = ?auto_186188 ?auto_186191 ) ) ( not ( = ?auto_186189 ?auto_186190 ) ) ( not ( = ?auto_186189 ?auto_186191 ) ) ( not ( = ?auto_186190 ?auto_186191 ) ) ( CLEAR ?auto_186188 ) ( ON ?auto_186189 ?auto_186190 ) ( CLEAR ?auto_186189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186187 ?auto_186188 ?auto_186189 )
      ( MAKE-4PILE ?auto_186187 ?auto_186188 ?auto_186189 ?auto_186190 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186196 - BLOCK
      ?auto_186197 - BLOCK
      ?auto_186198 - BLOCK
      ?auto_186199 - BLOCK
    )
    :vars
    (
      ?auto_186200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186199 ?auto_186200 ) ( ON-TABLE ?auto_186196 ) ( ON ?auto_186197 ?auto_186196 ) ( not ( = ?auto_186196 ?auto_186197 ) ) ( not ( = ?auto_186196 ?auto_186198 ) ) ( not ( = ?auto_186196 ?auto_186199 ) ) ( not ( = ?auto_186196 ?auto_186200 ) ) ( not ( = ?auto_186197 ?auto_186198 ) ) ( not ( = ?auto_186197 ?auto_186199 ) ) ( not ( = ?auto_186197 ?auto_186200 ) ) ( not ( = ?auto_186198 ?auto_186199 ) ) ( not ( = ?auto_186198 ?auto_186200 ) ) ( not ( = ?auto_186199 ?auto_186200 ) ) ( CLEAR ?auto_186197 ) ( ON ?auto_186198 ?auto_186199 ) ( CLEAR ?auto_186198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186196 ?auto_186197 ?auto_186198 )
      ( MAKE-4PILE ?auto_186196 ?auto_186197 ?auto_186198 ?auto_186199 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186205 - BLOCK
      ?auto_186206 - BLOCK
      ?auto_186207 - BLOCK
      ?auto_186208 - BLOCK
    )
    :vars
    (
      ?auto_186209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186208 ?auto_186209 ) ( ON-TABLE ?auto_186205 ) ( not ( = ?auto_186205 ?auto_186206 ) ) ( not ( = ?auto_186205 ?auto_186207 ) ) ( not ( = ?auto_186205 ?auto_186208 ) ) ( not ( = ?auto_186205 ?auto_186209 ) ) ( not ( = ?auto_186206 ?auto_186207 ) ) ( not ( = ?auto_186206 ?auto_186208 ) ) ( not ( = ?auto_186206 ?auto_186209 ) ) ( not ( = ?auto_186207 ?auto_186208 ) ) ( not ( = ?auto_186207 ?auto_186209 ) ) ( not ( = ?auto_186208 ?auto_186209 ) ) ( ON ?auto_186207 ?auto_186208 ) ( CLEAR ?auto_186205 ) ( ON ?auto_186206 ?auto_186207 ) ( CLEAR ?auto_186206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186205 ?auto_186206 )
      ( MAKE-4PILE ?auto_186205 ?auto_186206 ?auto_186207 ?auto_186208 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186214 - BLOCK
      ?auto_186215 - BLOCK
      ?auto_186216 - BLOCK
      ?auto_186217 - BLOCK
    )
    :vars
    (
      ?auto_186218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186217 ?auto_186218 ) ( ON-TABLE ?auto_186214 ) ( not ( = ?auto_186214 ?auto_186215 ) ) ( not ( = ?auto_186214 ?auto_186216 ) ) ( not ( = ?auto_186214 ?auto_186217 ) ) ( not ( = ?auto_186214 ?auto_186218 ) ) ( not ( = ?auto_186215 ?auto_186216 ) ) ( not ( = ?auto_186215 ?auto_186217 ) ) ( not ( = ?auto_186215 ?auto_186218 ) ) ( not ( = ?auto_186216 ?auto_186217 ) ) ( not ( = ?auto_186216 ?auto_186218 ) ) ( not ( = ?auto_186217 ?auto_186218 ) ) ( ON ?auto_186216 ?auto_186217 ) ( CLEAR ?auto_186214 ) ( ON ?auto_186215 ?auto_186216 ) ( CLEAR ?auto_186215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186214 ?auto_186215 )
      ( MAKE-4PILE ?auto_186214 ?auto_186215 ?auto_186216 ?auto_186217 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186223 - BLOCK
      ?auto_186224 - BLOCK
      ?auto_186225 - BLOCK
      ?auto_186226 - BLOCK
    )
    :vars
    (
      ?auto_186227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186226 ?auto_186227 ) ( not ( = ?auto_186223 ?auto_186224 ) ) ( not ( = ?auto_186223 ?auto_186225 ) ) ( not ( = ?auto_186223 ?auto_186226 ) ) ( not ( = ?auto_186223 ?auto_186227 ) ) ( not ( = ?auto_186224 ?auto_186225 ) ) ( not ( = ?auto_186224 ?auto_186226 ) ) ( not ( = ?auto_186224 ?auto_186227 ) ) ( not ( = ?auto_186225 ?auto_186226 ) ) ( not ( = ?auto_186225 ?auto_186227 ) ) ( not ( = ?auto_186226 ?auto_186227 ) ) ( ON ?auto_186225 ?auto_186226 ) ( ON ?auto_186224 ?auto_186225 ) ( ON ?auto_186223 ?auto_186224 ) ( CLEAR ?auto_186223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186223 )
      ( MAKE-4PILE ?auto_186223 ?auto_186224 ?auto_186225 ?auto_186226 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186232 - BLOCK
      ?auto_186233 - BLOCK
      ?auto_186234 - BLOCK
      ?auto_186235 - BLOCK
    )
    :vars
    (
      ?auto_186236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186235 ?auto_186236 ) ( not ( = ?auto_186232 ?auto_186233 ) ) ( not ( = ?auto_186232 ?auto_186234 ) ) ( not ( = ?auto_186232 ?auto_186235 ) ) ( not ( = ?auto_186232 ?auto_186236 ) ) ( not ( = ?auto_186233 ?auto_186234 ) ) ( not ( = ?auto_186233 ?auto_186235 ) ) ( not ( = ?auto_186233 ?auto_186236 ) ) ( not ( = ?auto_186234 ?auto_186235 ) ) ( not ( = ?auto_186234 ?auto_186236 ) ) ( not ( = ?auto_186235 ?auto_186236 ) ) ( ON ?auto_186234 ?auto_186235 ) ( ON ?auto_186233 ?auto_186234 ) ( ON ?auto_186232 ?auto_186233 ) ( CLEAR ?auto_186232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186232 )
      ( MAKE-4PILE ?auto_186232 ?auto_186233 ?auto_186234 ?auto_186235 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186242 - BLOCK
      ?auto_186243 - BLOCK
      ?auto_186244 - BLOCK
      ?auto_186245 - BLOCK
      ?auto_186246 - BLOCK
    )
    :vars
    (
      ?auto_186247 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_186245 ) ( ON ?auto_186246 ?auto_186247 ) ( CLEAR ?auto_186246 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186242 ) ( ON ?auto_186243 ?auto_186242 ) ( ON ?auto_186244 ?auto_186243 ) ( ON ?auto_186245 ?auto_186244 ) ( not ( = ?auto_186242 ?auto_186243 ) ) ( not ( = ?auto_186242 ?auto_186244 ) ) ( not ( = ?auto_186242 ?auto_186245 ) ) ( not ( = ?auto_186242 ?auto_186246 ) ) ( not ( = ?auto_186242 ?auto_186247 ) ) ( not ( = ?auto_186243 ?auto_186244 ) ) ( not ( = ?auto_186243 ?auto_186245 ) ) ( not ( = ?auto_186243 ?auto_186246 ) ) ( not ( = ?auto_186243 ?auto_186247 ) ) ( not ( = ?auto_186244 ?auto_186245 ) ) ( not ( = ?auto_186244 ?auto_186246 ) ) ( not ( = ?auto_186244 ?auto_186247 ) ) ( not ( = ?auto_186245 ?auto_186246 ) ) ( not ( = ?auto_186245 ?auto_186247 ) ) ( not ( = ?auto_186246 ?auto_186247 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186246 ?auto_186247 )
      ( !STACK ?auto_186246 ?auto_186245 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186253 - BLOCK
      ?auto_186254 - BLOCK
      ?auto_186255 - BLOCK
      ?auto_186256 - BLOCK
      ?auto_186257 - BLOCK
    )
    :vars
    (
      ?auto_186258 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_186256 ) ( ON ?auto_186257 ?auto_186258 ) ( CLEAR ?auto_186257 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186253 ) ( ON ?auto_186254 ?auto_186253 ) ( ON ?auto_186255 ?auto_186254 ) ( ON ?auto_186256 ?auto_186255 ) ( not ( = ?auto_186253 ?auto_186254 ) ) ( not ( = ?auto_186253 ?auto_186255 ) ) ( not ( = ?auto_186253 ?auto_186256 ) ) ( not ( = ?auto_186253 ?auto_186257 ) ) ( not ( = ?auto_186253 ?auto_186258 ) ) ( not ( = ?auto_186254 ?auto_186255 ) ) ( not ( = ?auto_186254 ?auto_186256 ) ) ( not ( = ?auto_186254 ?auto_186257 ) ) ( not ( = ?auto_186254 ?auto_186258 ) ) ( not ( = ?auto_186255 ?auto_186256 ) ) ( not ( = ?auto_186255 ?auto_186257 ) ) ( not ( = ?auto_186255 ?auto_186258 ) ) ( not ( = ?auto_186256 ?auto_186257 ) ) ( not ( = ?auto_186256 ?auto_186258 ) ) ( not ( = ?auto_186257 ?auto_186258 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186257 ?auto_186258 )
      ( !STACK ?auto_186257 ?auto_186256 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186264 - BLOCK
      ?auto_186265 - BLOCK
      ?auto_186266 - BLOCK
      ?auto_186267 - BLOCK
      ?auto_186268 - BLOCK
    )
    :vars
    (
      ?auto_186269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186268 ?auto_186269 ) ( ON-TABLE ?auto_186264 ) ( ON ?auto_186265 ?auto_186264 ) ( ON ?auto_186266 ?auto_186265 ) ( not ( = ?auto_186264 ?auto_186265 ) ) ( not ( = ?auto_186264 ?auto_186266 ) ) ( not ( = ?auto_186264 ?auto_186267 ) ) ( not ( = ?auto_186264 ?auto_186268 ) ) ( not ( = ?auto_186264 ?auto_186269 ) ) ( not ( = ?auto_186265 ?auto_186266 ) ) ( not ( = ?auto_186265 ?auto_186267 ) ) ( not ( = ?auto_186265 ?auto_186268 ) ) ( not ( = ?auto_186265 ?auto_186269 ) ) ( not ( = ?auto_186266 ?auto_186267 ) ) ( not ( = ?auto_186266 ?auto_186268 ) ) ( not ( = ?auto_186266 ?auto_186269 ) ) ( not ( = ?auto_186267 ?auto_186268 ) ) ( not ( = ?auto_186267 ?auto_186269 ) ) ( not ( = ?auto_186268 ?auto_186269 ) ) ( CLEAR ?auto_186266 ) ( ON ?auto_186267 ?auto_186268 ) ( CLEAR ?auto_186267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186264 ?auto_186265 ?auto_186266 ?auto_186267 )
      ( MAKE-5PILE ?auto_186264 ?auto_186265 ?auto_186266 ?auto_186267 ?auto_186268 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186275 - BLOCK
      ?auto_186276 - BLOCK
      ?auto_186277 - BLOCK
      ?auto_186278 - BLOCK
      ?auto_186279 - BLOCK
    )
    :vars
    (
      ?auto_186280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186279 ?auto_186280 ) ( ON-TABLE ?auto_186275 ) ( ON ?auto_186276 ?auto_186275 ) ( ON ?auto_186277 ?auto_186276 ) ( not ( = ?auto_186275 ?auto_186276 ) ) ( not ( = ?auto_186275 ?auto_186277 ) ) ( not ( = ?auto_186275 ?auto_186278 ) ) ( not ( = ?auto_186275 ?auto_186279 ) ) ( not ( = ?auto_186275 ?auto_186280 ) ) ( not ( = ?auto_186276 ?auto_186277 ) ) ( not ( = ?auto_186276 ?auto_186278 ) ) ( not ( = ?auto_186276 ?auto_186279 ) ) ( not ( = ?auto_186276 ?auto_186280 ) ) ( not ( = ?auto_186277 ?auto_186278 ) ) ( not ( = ?auto_186277 ?auto_186279 ) ) ( not ( = ?auto_186277 ?auto_186280 ) ) ( not ( = ?auto_186278 ?auto_186279 ) ) ( not ( = ?auto_186278 ?auto_186280 ) ) ( not ( = ?auto_186279 ?auto_186280 ) ) ( CLEAR ?auto_186277 ) ( ON ?auto_186278 ?auto_186279 ) ( CLEAR ?auto_186278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186275 ?auto_186276 ?auto_186277 ?auto_186278 )
      ( MAKE-5PILE ?auto_186275 ?auto_186276 ?auto_186277 ?auto_186278 ?auto_186279 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186286 - BLOCK
      ?auto_186287 - BLOCK
      ?auto_186288 - BLOCK
      ?auto_186289 - BLOCK
      ?auto_186290 - BLOCK
    )
    :vars
    (
      ?auto_186291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186290 ?auto_186291 ) ( ON-TABLE ?auto_186286 ) ( ON ?auto_186287 ?auto_186286 ) ( not ( = ?auto_186286 ?auto_186287 ) ) ( not ( = ?auto_186286 ?auto_186288 ) ) ( not ( = ?auto_186286 ?auto_186289 ) ) ( not ( = ?auto_186286 ?auto_186290 ) ) ( not ( = ?auto_186286 ?auto_186291 ) ) ( not ( = ?auto_186287 ?auto_186288 ) ) ( not ( = ?auto_186287 ?auto_186289 ) ) ( not ( = ?auto_186287 ?auto_186290 ) ) ( not ( = ?auto_186287 ?auto_186291 ) ) ( not ( = ?auto_186288 ?auto_186289 ) ) ( not ( = ?auto_186288 ?auto_186290 ) ) ( not ( = ?auto_186288 ?auto_186291 ) ) ( not ( = ?auto_186289 ?auto_186290 ) ) ( not ( = ?auto_186289 ?auto_186291 ) ) ( not ( = ?auto_186290 ?auto_186291 ) ) ( ON ?auto_186289 ?auto_186290 ) ( CLEAR ?auto_186287 ) ( ON ?auto_186288 ?auto_186289 ) ( CLEAR ?auto_186288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186286 ?auto_186287 ?auto_186288 )
      ( MAKE-5PILE ?auto_186286 ?auto_186287 ?auto_186288 ?auto_186289 ?auto_186290 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186297 - BLOCK
      ?auto_186298 - BLOCK
      ?auto_186299 - BLOCK
      ?auto_186300 - BLOCK
      ?auto_186301 - BLOCK
    )
    :vars
    (
      ?auto_186302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186301 ?auto_186302 ) ( ON-TABLE ?auto_186297 ) ( ON ?auto_186298 ?auto_186297 ) ( not ( = ?auto_186297 ?auto_186298 ) ) ( not ( = ?auto_186297 ?auto_186299 ) ) ( not ( = ?auto_186297 ?auto_186300 ) ) ( not ( = ?auto_186297 ?auto_186301 ) ) ( not ( = ?auto_186297 ?auto_186302 ) ) ( not ( = ?auto_186298 ?auto_186299 ) ) ( not ( = ?auto_186298 ?auto_186300 ) ) ( not ( = ?auto_186298 ?auto_186301 ) ) ( not ( = ?auto_186298 ?auto_186302 ) ) ( not ( = ?auto_186299 ?auto_186300 ) ) ( not ( = ?auto_186299 ?auto_186301 ) ) ( not ( = ?auto_186299 ?auto_186302 ) ) ( not ( = ?auto_186300 ?auto_186301 ) ) ( not ( = ?auto_186300 ?auto_186302 ) ) ( not ( = ?auto_186301 ?auto_186302 ) ) ( ON ?auto_186300 ?auto_186301 ) ( CLEAR ?auto_186298 ) ( ON ?auto_186299 ?auto_186300 ) ( CLEAR ?auto_186299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186297 ?auto_186298 ?auto_186299 )
      ( MAKE-5PILE ?auto_186297 ?auto_186298 ?auto_186299 ?auto_186300 ?auto_186301 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186308 - BLOCK
      ?auto_186309 - BLOCK
      ?auto_186310 - BLOCK
      ?auto_186311 - BLOCK
      ?auto_186312 - BLOCK
    )
    :vars
    (
      ?auto_186313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186312 ?auto_186313 ) ( ON-TABLE ?auto_186308 ) ( not ( = ?auto_186308 ?auto_186309 ) ) ( not ( = ?auto_186308 ?auto_186310 ) ) ( not ( = ?auto_186308 ?auto_186311 ) ) ( not ( = ?auto_186308 ?auto_186312 ) ) ( not ( = ?auto_186308 ?auto_186313 ) ) ( not ( = ?auto_186309 ?auto_186310 ) ) ( not ( = ?auto_186309 ?auto_186311 ) ) ( not ( = ?auto_186309 ?auto_186312 ) ) ( not ( = ?auto_186309 ?auto_186313 ) ) ( not ( = ?auto_186310 ?auto_186311 ) ) ( not ( = ?auto_186310 ?auto_186312 ) ) ( not ( = ?auto_186310 ?auto_186313 ) ) ( not ( = ?auto_186311 ?auto_186312 ) ) ( not ( = ?auto_186311 ?auto_186313 ) ) ( not ( = ?auto_186312 ?auto_186313 ) ) ( ON ?auto_186311 ?auto_186312 ) ( ON ?auto_186310 ?auto_186311 ) ( CLEAR ?auto_186308 ) ( ON ?auto_186309 ?auto_186310 ) ( CLEAR ?auto_186309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186308 ?auto_186309 )
      ( MAKE-5PILE ?auto_186308 ?auto_186309 ?auto_186310 ?auto_186311 ?auto_186312 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186319 - BLOCK
      ?auto_186320 - BLOCK
      ?auto_186321 - BLOCK
      ?auto_186322 - BLOCK
      ?auto_186323 - BLOCK
    )
    :vars
    (
      ?auto_186324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186323 ?auto_186324 ) ( ON-TABLE ?auto_186319 ) ( not ( = ?auto_186319 ?auto_186320 ) ) ( not ( = ?auto_186319 ?auto_186321 ) ) ( not ( = ?auto_186319 ?auto_186322 ) ) ( not ( = ?auto_186319 ?auto_186323 ) ) ( not ( = ?auto_186319 ?auto_186324 ) ) ( not ( = ?auto_186320 ?auto_186321 ) ) ( not ( = ?auto_186320 ?auto_186322 ) ) ( not ( = ?auto_186320 ?auto_186323 ) ) ( not ( = ?auto_186320 ?auto_186324 ) ) ( not ( = ?auto_186321 ?auto_186322 ) ) ( not ( = ?auto_186321 ?auto_186323 ) ) ( not ( = ?auto_186321 ?auto_186324 ) ) ( not ( = ?auto_186322 ?auto_186323 ) ) ( not ( = ?auto_186322 ?auto_186324 ) ) ( not ( = ?auto_186323 ?auto_186324 ) ) ( ON ?auto_186322 ?auto_186323 ) ( ON ?auto_186321 ?auto_186322 ) ( CLEAR ?auto_186319 ) ( ON ?auto_186320 ?auto_186321 ) ( CLEAR ?auto_186320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186319 ?auto_186320 )
      ( MAKE-5PILE ?auto_186319 ?auto_186320 ?auto_186321 ?auto_186322 ?auto_186323 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186330 - BLOCK
      ?auto_186331 - BLOCK
      ?auto_186332 - BLOCK
      ?auto_186333 - BLOCK
      ?auto_186334 - BLOCK
    )
    :vars
    (
      ?auto_186335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186334 ?auto_186335 ) ( not ( = ?auto_186330 ?auto_186331 ) ) ( not ( = ?auto_186330 ?auto_186332 ) ) ( not ( = ?auto_186330 ?auto_186333 ) ) ( not ( = ?auto_186330 ?auto_186334 ) ) ( not ( = ?auto_186330 ?auto_186335 ) ) ( not ( = ?auto_186331 ?auto_186332 ) ) ( not ( = ?auto_186331 ?auto_186333 ) ) ( not ( = ?auto_186331 ?auto_186334 ) ) ( not ( = ?auto_186331 ?auto_186335 ) ) ( not ( = ?auto_186332 ?auto_186333 ) ) ( not ( = ?auto_186332 ?auto_186334 ) ) ( not ( = ?auto_186332 ?auto_186335 ) ) ( not ( = ?auto_186333 ?auto_186334 ) ) ( not ( = ?auto_186333 ?auto_186335 ) ) ( not ( = ?auto_186334 ?auto_186335 ) ) ( ON ?auto_186333 ?auto_186334 ) ( ON ?auto_186332 ?auto_186333 ) ( ON ?auto_186331 ?auto_186332 ) ( ON ?auto_186330 ?auto_186331 ) ( CLEAR ?auto_186330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186330 )
      ( MAKE-5PILE ?auto_186330 ?auto_186331 ?auto_186332 ?auto_186333 ?auto_186334 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186341 - BLOCK
      ?auto_186342 - BLOCK
      ?auto_186343 - BLOCK
      ?auto_186344 - BLOCK
      ?auto_186345 - BLOCK
    )
    :vars
    (
      ?auto_186346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186345 ?auto_186346 ) ( not ( = ?auto_186341 ?auto_186342 ) ) ( not ( = ?auto_186341 ?auto_186343 ) ) ( not ( = ?auto_186341 ?auto_186344 ) ) ( not ( = ?auto_186341 ?auto_186345 ) ) ( not ( = ?auto_186341 ?auto_186346 ) ) ( not ( = ?auto_186342 ?auto_186343 ) ) ( not ( = ?auto_186342 ?auto_186344 ) ) ( not ( = ?auto_186342 ?auto_186345 ) ) ( not ( = ?auto_186342 ?auto_186346 ) ) ( not ( = ?auto_186343 ?auto_186344 ) ) ( not ( = ?auto_186343 ?auto_186345 ) ) ( not ( = ?auto_186343 ?auto_186346 ) ) ( not ( = ?auto_186344 ?auto_186345 ) ) ( not ( = ?auto_186344 ?auto_186346 ) ) ( not ( = ?auto_186345 ?auto_186346 ) ) ( ON ?auto_186344 ?auto_186345 ) ( ON ?auto_186343 ?auto_186344 ) ( ON ?auto_186342 ?auto_186343 ) ( ON ?auto_186341 ?auto_186342 ) ( CLEAR ?auto_186341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186341 )
      ( MAKE-5PILE ?auto_186341 ?auto_186342 ?auto_186343 ?auto_186344 ?auto_186345 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186353 - BLOCK
      ?auto_186354 - BLOCK
      ?auto_186355 - BLOCK
      ?auto_186356 - BLOCK
      ?auto_186357 - BLOCK
      ?auto_186358 - BLOCK
    )
    :vars
    (
      ?auto_186359 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_186357 ) ( ON ?auto_186358 ?auto_186359 ) ( CLEAR ?auto_186358 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186353 ) ( ON ?auto_186354 ?auto_186353 ) ( ON ?auto_186355 ?auto_186354 ) ( ON ?auto_186356 ?auto_186355 ) ( ON ?auto_186357 ?auto_186356 ) ( not ( = ?auto_186353 ?auto_186354 ) ) ( not ( = ?auto_186353 ?auto_186355 ) ) ( not ( = ?auto_186353 ?auto_186356 ) ) ( not ( = ?auto_186353 ?auto_186357 ) ) ( not ( = ?auto_186353 ?auto_186358 ) ) ( not ( = ?auto_186353 ?auto_186359 ) ) ( not ( = ?auto_186354 ?auto_186355 ) ) ( not ( = ?auto_186354 ?auto_186356 ) ) ( not ( = ?auto_186354 ?auto_186357 ) ) ( not ( = ?auto_186354 ?auto_186358 ) ) ( not ( = ?auto_186354 ?auto_186359 ) ) ( not ( = ?auto_186355 ?auto_186356 ) ) ( not ( = ?auto_186355 ?auto_186357 ) ) ( not ( = ?auto_186355 ?auto_186358 ) ) ( not ( = ?auto_186355 ?auto_186359 ) ) ( not ( = ?auto_186356 ?auto_186357 ) ) ( not ( = ?auto_186356 ?auto_186358 ) ) ( not ( = ?auto_186356 ?auto_186359 ) ) ( not ( = ?auto_186357 ?auto_186358 ) ) ( not ( = ?auto_186357 ?auto_186359 ) ) ( not ( = ?auto_186358 ?auto_186359 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186358 ?auto_186359 )
      ( !STACK ?auto_186358 ?auto_186357 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186366 - BLOCK
      ?auto_186367 - BLOCK
      ?auto_186368 - BLOCK
      ?auto_186369 - BLOCK
      ?auto_186370 - BLOCK
      ?auto_186371 - BLOCK
    )
    :vars
    (
      ?auto_186372 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_186370 ) ( ON ?auto_186371 ?auto_186372 ) ( CLEAR ?auto_186371 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186366 ) ( ON ?auto_186367 ?auto_186366 ) ( ON ?auto_186368 ?auto_186367 ) ( ON ?auto_186369 ?auto_186368 ) ( ON ?auto_186370 ?auto_186369 ) ( not ( = ?auto_186366 ?auto_186367 ) ) ( not ( = ?auto_186366 ?auto_186368 ) ) ( not ( = ?auto_186366 ?auto_186369 ) ) ( not ( = ?auto_186366 ?auto_186370 ) ) ( not ( = ?auto_186366 ?auto_186371 ) ) ( not ( = ?auto_186366 ?auto_186372 ) ) ( not ( = ?auto_186367 ?auto_186368 ) ) ( not ( = ?auto_186367 ?auto_186369 ) ) ( not ( = ?auto_186367 ?auto_186370 ) ) ( not ( = ?auto_186367 ?auto_186371 ) ) ( not ( = ?auto_186367 ?auto_186372 ) ) ( not ( = ?auto_186368 ?auto_186369 ) ) ( not ( = ?auto_186368 ?auto_186370 ) ) ( not ( = ?auto_186368 ?auto_186371 ) ) ( not ( = ?auto_186368 ?auto_186372 ) ) ( not ( = ?auto_186369 ?auto_186370 ) ) ( not ( = ?auto_186369 ?auto_186371 ) ) ( not ( = ?auto_186369 ?auto_186372 ) ) ( not ( = ?auto_186370 ?auto_186371 ) ) ( not ( = ?auto_186370 ?auto_186372 ) ) ( not ( = ?auto_186371 ?auto_186372 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186371 ?auto_186372 )
      ( !STACK ?auto_186371 ?auto_186370 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186379 - BLOCK
      ?auto_186380 - BLOCK
      ?auto_186381 - BLOCK
      ?auto_186382 - BLOCK
      ?auto_186383 - BLOCK
      ?auto_186384 - BLOCK
    )
    :vars
    (
      ?auto_186385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186384 ?auto_186385 ) ( ON-TABLE ?auto_186379 ) ( ON ?auto_186380 ?auto_186379 ) ( ON ?auto_186381 ?auto_186380 ) ( ON ?auto_186382 ?auto_186381 ) ( not ( = ?auto_186379 ?auto_186380 ) ) ( not ( = ?auto_186379 ?auto_186381 ) ) ( not ( = ?auto_186379 ?auto_186382 ) ) ( not ( = ?auto_186379 ?auto_186383 ) ) ( not ( = ?auto_186379 ?auto_186384 ) ) ( not ( = ?auto_186379 ?auto_186385 ) ) ( not ( = ?auto_186380 ?auto_186381 ) ) ( not ( = ?auto_186380 ?auto_186382 ) ) ( not ( = ?auto_186380 ?auto_186383 ) ) ( not ( = ?auto_186380 ?auto_186384 ) ) ( not ( = ?auto_186380 ?auto_186385 ) ) ( not ( = ?auto_186381 ?auto_186382 ) ) ( not ( = ?auto_186381 ?auto_186383 ) ) ( not ( = ?auto_186381 ?auto_186384 ) ) ( not ( = ?auto_186381 ?auto_186385 ) ) ( not ( = ?auto_186382 ?auto_186383 ) ) ( not ( = ?auto_186382 ?auto_186384 ) ) ( not ( = ?auto_186382 ?auto_186385 ) ) ( not ( = ?auto_186383 ?auto_186384 ) ) ( not ( = ?auto_186383 ?auto_186385 ) ) ( not ( = ?auto_186384 ?auto_186385 ) ) ( CLEAR ?auto_186382 ) ( ON ?auto_186383 ?auto_186384 ) ( CLEAR ?auto_186383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186379 ?auto_186380 ?auto_186381 ?auto_186382 ?auto_186383 )
      ( MAKE-6PILE ?auto_186379 ?auto_186380 ?auto_186381 ?auto_186382 ?auto_186383 ?auto_186384 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186392 - BLOCK
      ?auto_186393 - BLOCK
      ?auto_186394 - BLOCK
      ?auto_186395 - BLOCK
      ?auto_186396 - BLOCK
      ?auto_186397 - BLOCK
    )
    :vars
    (
      ?auto_186398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186397 ?auto_186398 ) ( ON-TABLE ?auto_186392 ) ( ON ?auto_186393 ?auto_186392 ) ( ON ?auto_186394 ?auto_186393 ) ( ON ?auto_186395 ?auto_186394 ) ( not ( = ?auto_186392 ?auto_186393 ) ) ( not ( = ?auto_186392 ?auto_186394 ) ) ( not ( = ?auto_186392 ?auto_186395 ) ) ( not ( = ?auto_186392 ?auto_186396 ) ) ( not ( = ?auto_186392 ?auto_186397 ) ) ( not ( = ?auto_186392 ?auto_186398 ) ) ( not ( = ?auto_186393 ?auto_186394 ) ) ( not ( = ?auto_186393 ?auto_186395 ) ) ( not ( = ?auto_186393 ?auto_186396 ) ) ( not ( = ?auto_186393 ?auto_186397 ) ) ( not ( = ?auto_186393 ?auto_186398 ) ) ( not ( = ?auto_186394 ?auto_186395 ) ) ( not ( = ?auto_186394 ?auto_186396 ) ) ( not ( = ?auto_186394 ?auto_186397 ) ) ( not ( = ?auto_186394 ?auto_186398 ) ) ( not ( = ?auto_186395 ?auto_186396 ) ) ( not ( = ?auto_186395 ?auto_186397 ) ) ( not ( = ?auto_186395 ?auto_186398 ) ) ( not ( = ?auto_186396 ?auto_186397 ) ) ( not ( = ?auto_186396 ?auto_186398 ) ) ( not ( = ?auto_186397 ?auto_186398 ) ) ( CLEAR ?auto_186395 ) ( ON ?auto_186396 ?auto_186397 ) ( CLEAR ?auto_186396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186392 ?auto_186393 ?auto_186394 ?auto_186395 ?auto_186396 )
      ( MAKE-6PILE ?auto_186392 ?auto_186393 ?auto_186394 ?auto_186395 ?auto_186396 ?auto_186397 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186405 - BLOCK
      ?auto_186406 - BLOCK
      ?auto_186407 - BLOCK
      ?auto_186408 - BLOCK
      ?auto_186409 - BLOCK
      ?auto_186410 - BLOCK
    )
    :vars
    (
      ?auto_186411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186410 ?auto_186411 ) ( ON-TABLE ?auto_186405 ) ( ON ?auto_186406 ?auto_186405 ) ( ON ?auto_186407 ?auto_186406 ) ( not ( = ?auto_186405 ?auto_186406 ) ) ( not ( = ?auto_186405 ?auto_186407 ) ) ( not ( = ?auto_186405 ?auto_186408 ) ) ( not ( = ?auto_186405 ?auto_186409 ) ) ( not ( = ?auto_186405 ?auto_186410 ) ) ( not ( = ?auto_186405 ?auto_186411 ) ) ( not ( = ?auto_186406 ?auto_186407 ) ) ( not ( = ?auto_186406 ?auto_186408 ) ) ( not ( = ?auto_186406 ?auto_186409 ) ) ( not ( = ?auto_186406 ?auto_186410 ) ) ( not ( = ?auto_186406 ?auto_186411 ) ) ( not ( = ?auto_186407 ?auto_186408 ) ) ( not ( = ?auto_186407 ?auto_186409 ) ) ( not ( = ?auto_186407 ?auto_186410 ) ) ( not ( = ?auto_186407 ?auto_186411 ) ) ( not ( = ?auto_186408 ?auto_186409 ) ) ( not ( = ?auto_186408 ?auto_186410 ) ) ( not ( = ?auto_186408 ?auto_186411 ) ) ( not ( = ?auto_186409 ?auto_186410 ) ) ( not ( = ?auto_186409 ?auto_186411 ) ) ( not ( = ?auto_186410 ?auto_186411 ) ) ( ON ?auto_186409 ?auto_186410 ) ( CLEAR ?auto_186407 ) ( ON ?auto_186408 ?auto_186409 ) ( CLEAR ?auto_186408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186405 ?auto_186406 ?auto_186407 ?auto_186408 )
      ( MAKE-6PILE ?auto_186405 ?auto_186406 ?auto_186407 ?auto_186408 ?auto_186409 ?auto_186410 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186418 - BLOCK
      ?auto_186419 - BLOCK
      ?auto_186420 - BLOCK
      ?auto_186421 - BLOCK
      ?auto_186422 - BLOCK
      ?auto_186423 - BLOCK
    )
    :vars
    (
      ?auto_186424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186423 ?auto_186424 ) ( ON-TABLE ?auto_186418 ) ( ON ?auto_186419 ?auto_186418 ) ( ON ?auto_186420 ?auto_186419 ) ( not ( = ?auto_186418 ?auto_186419 ) ) ( not ( = ?auto_186418 ?auto_186420 ) ) ( not ( = ?auto_186418 ?auto_186421 ) ) ( not ( = ?auto_186418 ?auto_186422 ) ) ( not ( = ?auto_186418 ?auto_186423 ) ) ( not ( = ?auto_186418 ?auto_186424 ) ) ( not ( = ?auto_186419 ?auto_186420 ) ) ( not ( = ?auto_186419 ?auto_186421 ) ) ( not ( = ?auto_186419 ?auto_186422 ) ) ( not ( = ?auto_186419 ?auto_186423 ) ) ( not ( = ?auto_186419 ?auto_186424 ) ) ( not ( = ?auto_186420 ?auto_186421 ) ) ( not ( = ?auto_186420 ?auto_186422 ) ) ( not ( = ?auto_186420 ?auto_186423 ) ) ( not ( = ?auto_186420 ?auto_186424 ) ) ( not ( = ?auto_186421 ?auto_186422 ) ) ( not ( = ?auto_186421 ?auto_186423 ) ) ( not ( = ?auto_186421 ?auto_186424 ) ) ( not ( = ?auto_186422 ?auto_186423 ) ) ( not ( = ?auto_186422 ?auto_186424 ) ) ( not ( = ?auto_186423 ?auto_186424 ) ) ( ON ?auto_186422 ?auto_186423 ) ( CLEAR ?auto_186420 ) ( ON ?auto_186421 ?auto_186422 ) ( CLEAR ?auto_186421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186418 ?auto_186419 ?auto_186420 ?auto_186421 )
      ( MAKE-6PILE ?auto_186418 ?auto_186419 ?auto_186420 ?auto_186421 ?auto_186422 ?auto_186423 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186431 - BLOCK
      ?auto_186432 - BLOCK
      ?auto_186433 - BLOCK
      ?auto_186434 - BLOCK
      ?auto_186435 - BLOCK
      ?auto_186436 - BLOCK
    )
    :vars
    (
      ?auto_186437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186436 ?auto_186437 ) ( ON-TABLE ?auto_186431 ) ( ON ?auto_186432 ?auto_186431 ) ( not ( = ?auto_186431 ?auto_186432 ) ) ( not ( = ?auto_186431 ?auto_186433 ) ) ( not ( = ?auto_186431 ?auto_186434 ) ) ( not ( = ?auto_186431 ?auto_186435 ) ) ( not ( = ?auto_186431 ?auto_186436 ) ) ( not ( = ?auto_186431 ?auto_186437 ) ) ( not ( = ?auto_186432 ?auto_186433 ) ) ( not ( = ?auto_186432 ?auto_186434 ) ) ( not ( = ?auto_186432 ?auto_186435 ) ) ( not ( = ?auto_186432 ?auto_186436 ) ) ( not ( = ?auto_186432 ?auto_186437 ) ) ( not ( = ?auto_186433 ?auto_186434 ) ) ( not ( = ?auto_186433 ?auto_186435 ) ) ( not ( = ?auto_186433 ?auto_186436 ) ) ( not ( = ?auto_186433 ?auto_186437 ) ) ( not ( = ?auto_186434 ?auto_186435 ) ) ( not ( = ?auto_186434 ?auto_186436 ) ) ( not ( = ?auto_186434 ?auto_186437 ) ) ( not ( = ?auto_186435 ?auto_186436 ) ) ( not ( = ?auto_186435 ?auto_186437 ) ) ( not ( = ?auto_186436 ?auto_186437 ) ) ( ON ?auto_186435 ?auto_186436 ) ( ON ?auto_186434 ?auto_186435 ) ( CLEAR ?auto_186432 ) ( ON ?auto_186433 ?auto_186434 ) ( CLEAR ?auto_186433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186431 ?auto_186432 ?auto_186433 )
      ( MAKE-6PILE ?auto_186431 ?auto_186432 ?auto_186433 ?auto_186434 ?auto_186435 ?auto_186436 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186444 - BLOCK
      ?auto_186445 - BLOCK
      ?auto_186446 - BLOCK
      ?auto_186447 - BLOCK
      ?auto_186448 - BLOCK
      ?auto_186449 - BLOCK
    )
    :vars
    (
      ?auto_186450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186449 ?auto_186450 ) ( ON-TABLE ?auto_186444 ) ( ON ?auto_186445 ?auto_186444 ) ( not ( = ?auto_186444 ?auto_186445 ) ) ( not ( = ?auto_186444 ?auto_186446 ) ) ( not ( = ?auto_186444 ?auto_186447 ) ) ( not ( = ?auto_186444 ?auto_186448 ) ) ( not ( = ?auto_186444 ?auto_186449 ) ) ( not ( = ?auto_186444 ?auto_186450 ) ) ( not ( = ?auto_186445 ?auto_186446 ) ) ( not ( = ?auto_186445 ?auto_186447 ) ) ( not ( = ?auto_186445 ?auto_186448 ) ) ( not ( = ?auto_186445 ?auto_186449 ) ) ( not ( = ?auto_186445 ?auto_186450 ) ) ( not ( = ?auto_186446 ?auto_186447 ) ) ( not ( = ?auto_186446 ?auto_186448 ) ) ( not ( = ?auto_186446 ?auto_186449 ) ) ( not ( = ?auto_186446 ?auto_186450 ) ) ( not ( = ?auto_186447 ?auto_186448 ) ) ( not ( = ?auto_186447 ?auto_186449 ) ) ( not ( = ?auto_186447 ?auto_186450 ) ) ( not ( = ?auto_186448 ?auto_186449 ) ) ( not ( = ?auto_186448 ?auto_186450 ) ) ( not ( = ?auto_186449 ?auto_186450 ) ) ( ON ?auto_186448 ?auto_186449 ) ( ON ?auto_186447 ?auto_186448 ) ( CLEAR ?auto_186445 ) ( ON ?auto_186446 ?auto_186447 ) ( CLEAR ?auto_186446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186444 ?auto_186445 ?auto_186446 )
      ( MAKE-6PILE ?auto_186444 ?auto_186445 ?auto_186446 ?auto_186447 ?auto_186448 ?auto_186449 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186457 - BLOCK
      ?auto_186458 - BLOCK
      ?auto_186459 - BLOCK
      ?auto_186460 - BLOCK
      ?auto_186461 - BLOCK
      ?auto_186462 - BLOCK
    )
    :vars
    (
      ?auto_186463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186462 ?auto_186463 ) ( ON-TABLE ?auto_186457 ) ( not ( = ?auto_186457 ?auto_186458 ) ) ( not ( = ?auto_186457 ?auto_186459 ) ) ( not ( = ?auto_186457 ?auto_186460 ) ) ( not ( = ?auto_186457 ?auto_186461 ) ) ( not ( = ?auto_186457 ?auto_186462 ) ) ( not ( = ?auto_186457 ?auto_186463 ) ) ( not ( = ?auto_186458 ?auto_186459 ) ) ( not ( = ?auto_186458 ?auto_186460 ) ) ( not ( = ?auto_186458 ?auto_186461 ) ) ( not ( = ?auto_186458 ?auto_186462 ) ) ( not ( = ?auto_186458 ?auto_186463 ) ) ( not ( = ?auto_186459 ?auto_186460 ) ) ( not ( = ?auto_186459 ?auto_186461 ) ) ( not ( = ?auto_186459 ?auto_186462 ) ) ( not ( = ?auto_186459 ?auto_186463 ) ) ( not ( = ?auto_186460 ?auto_186461 ) ) ( not ( = ?auto_186460 ?auto_186462 ) ) ( not ( = ?auto_186460 ?auto_186463 ) ) ( not ( = ?auto_186461 ?auto_186462 ) ) ( not ( = ?auto_186461 ?auto_186463 ) ) ( not ( = ?auto_186462 ?auto_186463 ) ) ( ON ?auto_186461 ?auto_186462 ) ( ON ?auto_186460 ?auto_186461 ) ( ON ?auto_186459 ?auto_186460 ) ( CLEAR ?auto_186457 ) ( ON ?auto_186458 ?auto_186459 ) ( CLEAR ?auto_186458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186457 ?auto_186458 )
      ( MAKE-6PILE ?auto_186457 ?auto_186458 ?auto_186459 ?auto_186460 ?auto_186461 ?auto_186462 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186470 - BLOCK
      ?auto_186471 - BLOCK
      ?auto_186472 - BLOCK
      ?auto_186473 - BLOCK
      ?auto_186474 - BLOCK
      ?auto_186475 - BLOCK
    )
    :vars
    (
      ?auto_186476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186475 ?auto_186476 ) ( ON-TABLE ?auto_186470 ) ( not ( = ?auto_186470 ?auto_186471 ) ) ( not ( = ?auto_186470 ?auto_186472 ) ) ( not ( = ?auto_186470 ?auto_186473 ) ) ( not ( = ?auto_186470 ?auto_186474 ) ) ( not ( = ?auto_186470 ?auto_186475 ) ) ( not ( = ?auto_186470 ?auto_186476 ) ) ( not ( = ?auto_186471 ?auto_186472 ) ) ( not ( = ?auto_186471 ?auto_186473 ) ) ( not ( = ?auto_186471 ?auto_186474 ) ) ( not ( = ?auto_186471 ?auto_186475 ) ) ( not ( = ?auto_186471 ?auto_186476 ) ) ( not ( = ?auto_186472 ?auto_186473 ) ) ( not ( = ?auto_186472 ?auto_186474 ) ) ( not ( = ?auto_186472 ?auto_186475 ) ) ( not ( = ?auto_186472 ?auto_186476 ) ) ( not ( = ?auto_186473 ?auto_186474 ) ) ( not ( = ?auto_186473 ?auto_186475 ) ) ( not ( = ?auto_186473 ?auto_186476 ) ) ( not ( = ?auto_186474 ?auto_186475 ) ) ( not ( = ?auto_186474 ?auto_186476 ) ) ( not ( = ?auto_186475 ?auto_186476 ) ) ( ON ?auto_186474 ?auto_186475 ) ( ON ?auto_186473 ?auto_186474 ) ( ON ?auto_186472 ?auto_186473 ) ( CLEAR ?auto_186470 ) ( ON ?auto_186471 ?auto_186472 ) ( CLEAR ?auto_186471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186470 ?auto_186471 )
      ( MAKE-6PILE ?auto_186470 ?auto_186471 ?auto_186472 ?auto_186473 ?auto_186474 ?auto_186475 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186483 - BLOCK
      ?auto_186484 - BLOCK
      ?auto_186485 - BLOCK
      ?auto_186486 - BLOCK
      ?auto_186487 - BLOCK
      ?auto_186488 - BLOCK
    )
    :vars
    (
      ?auto_186489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186488 ?auto_186489 ) ( not ( = ?auto_186483 ?auto_186484 ) ) ( not ( = ?auto_186483 ?auto_186485 ) ) ( not ( = ?auto_186483 ?auto_186486 ) ) ( not ( = ?auto_186483 ?auto_186487 ) ) ( not ( = ?auto_186483 ?auto_186488 ) ) ( not ( = ?auto_186483 ?auto_186489 ) ) ( not ( = ?auto_186484 ?auto_186485 ) ) ( not ( = ?auto_186484 ?auto_186486 ) ) ( not ( = ?auto_186484 ?auto_186487 ) ) ( not ( = ?auto_186484 ?auto_186488 ) ) ( not ( = ?auto_186484 ?auto_186489 ) ) ( not ( = ?auto_186485 ?auto_186486 ) ) ( not ( = ?auto_186485 ?auto_186487 ) ) ( not ( = ?auto_186485 ?auto_186488 ) ) ( not ( = ?auto_186485 ?auto_186489 ) ) ( not ( = ?auto_186486 ?auto_186487 ) ) ( not ( = ?auto_186486 ?auto_186488 ) ) ( not ( = ?auto_186486 ?auto_186489 ) ) ( not ( = ?auto_186487 ?auto_186488 ) ) ( not ( = ?auto_186487 ?auto_186489 ) ) ( not ( = ?auto_186488 ?auto_186489 ) ) ( ON ?auto_186487 ?auto_186488 ) ( ON ?auto_186486 ?auto_186487 ) ( ON ?auto_186485 ?auto_186486 ) ( ON ?auto_186484 ?auto_186485 ) ( ON ?auto_186483 ?auto_186484 ) ( CLEAR ?auto_186483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186483 )
      ( MAKE-6PILE ?auto_186483 ?auto_186484 ?auto_186485 ?auto_186486 ?auto_186487 ?auto_186488 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186496 - BLOCK
      ?auto_186497 - BLOCK
      ?auto_186498 - BLOCK
      ?auto_186499 - BLOCK
      ?auto_186500 - BLOCK
      ?auto_186501 - BLOCK
    )
    :vars
    (
      ?auto_186502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186501 ?auto_186502 ) ( not ( = ?auto_186496 ?auto_186497 ) ) ( not ( = ?auto_186496 ?auto_186498 ) ) ( not ( = ?auto_186496 ?auto_186499 ) ) ( not ( = ?auto_186496 ?auto_186500 ) ) ( not ( = ?auto_186496 ?auto_186501 ) ) ( not ( = ?auto_186496 ?auto_186502 ) ) ( not ( = ?auto_186497 ?auto_186498 ) ) ( not ( = ?auto_186497 ?auto_186499 ) ) ( not ( = ?auto_186497 ?auto_186500 ) ) ( not ( = ?auto_186497 ?auto_186501 ) ) ( not ( = ?auto_186497 ?auto_186502 ) ) ( not ( = ?auto_186498 ?auto_186499 ) ) ( not ( = ?auto_186498 ?auto_186500 ) ) ( not ( = ?auto_186498 ?auto_186501 ) ) ( not ( = ?auto_186498 ?auto_186502 ) ) ( not ( = ?auto_186499 ?auto_186500 ) ) ( not ( = ?auto_186499 ?auto_186501 ) ) ( not ( = ?auto_186499 ?auto_186502 ) ) ( not ( = ?auto_186500 ?auto_186501 ) ) ( not ( = ?auto_186500 ?auto_186502 ) ) ( not ( = ?auto_186501 ?auto_186502 ) ) ( ON ?auto_186500 ?auto_186501 ) ( ON ?auto_186499 ?auto_186500 ) ( ON ?auto_186498 ?auto_186499 ) ( ON ?auto_186497 ?auto_186498 ) ( ON ?auto_186496 ?auto_186497 ) ( CLEAR ?auto_186496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186496 )
      ( MAKE-6PILE ?auto_186496 ?auto_186497 ?auto_186498 ?auto_186499 ?auto_186500 ?auto_186501 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_186510 - BLOCK
      ?auto_186511 - BLOCK
      ?auto_186512 - BLOCK
      ?auto_186513 - BLOCK
      ?auto_186514 - BLOCK
      ?auto_186515 - BLOCK
      ?auto_186516 - BLOCK
    )
    :vars
    (
      ?auto_186517 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_186515 ) ( ON ?auto_186516 ?auto_186517 ) ( CLEAR ?auto_186516 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186510 ) ( ON ?auto_186511 ?auto_186510 ) ( ON ?auto_186512 ?auto_186511 ) ( ON ?auto_186513 ?auto_186512 ) ( ON ?auto_186514 ?auto_186513 ) ( ON ?auto_186515 ?auto_186514 ) ( not ( = ?auto_186510 ?auto_186511 ) ) ( not ( = ?auto_186510 ?auto_186512 ) ) ( not ( = ?auto_186510 ?auto_186513 ) ) ( not ( = ?auto_186510 ?auto_186514 ) ) ( not ( = ?auto_186510 ?auto_186515 ) ) ( not ( = ?auto_186510 ?auto_186516 ) ) ( not ( = ?auto_186510 ?auto_186517 ) ) ( not ( = ?auto_186511 ?auto_186512 ) ) ( not ( = ?auto_186511 ?auto_186513 ) ) ( not ( = ?auto_186511 ?auto_186514 ) ) ( not ( = ?auto_186511 ?auto_186515 ) ) ( not ( = ?auto_186511 ?auto_186516 ) ) ( not ( = ?auto_186511 ?auto_186517 ) ) ( not ( = ?auto_186512 ?auto_186513 ) ) ( not ( = ?auto_186512 ?auto_186514 ) ) ( not ( = ?auto_186512 ?auto_186515 ) ) ( not ( = ?auto_186512 ?auto_186516 ) ) ( not ( = ?auto_186512 ?auto_186517 ) ) ( not ( = ?auto_186513 ?auto_186514 ) ) ( not ( = ?auto_186513 ?auto_186515 ) ) ( not ( = ?auto_186513 ?auto_186516 ) ) ( not ( = ?auto_186513 ?auto_186517 ) ) ( not ( = ?auto_186514 ?auto_186515 ) ) ( not ( = ?auto_186514 ?auto_186516 ) ) ( not ( = ?auto_186514 ?auto_186517 ) ) ( not ( = ?auto_186515 ?auto_186516 ) ) ( not ( = ?auto_186515 ?auto_186517 ) ) ( not ( = ?auto_186516 ?auto_186517 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186516 ?auto_186517 )
      ( !STACK ?auto_186516 ?auto_186515 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_186525 - BLOCK
      ?auto_186526 - BLOCK
      ?auto_186527 - BLOCK
      ?auto_186528 - BLOCK
      ?auto_186529 - BLOCK
      ?auto_186530 - BLOCK
      ?auto_186531 - BLOCK
    )
    :vars
    (
      ?auto_186532 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_186530 ) ( ON ?auto_186531 ?auto_186532 ) ( CLEAR ?auto_186531 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186525 ) ( ON ?auto_186526 ?auto_186525 ) ( ON ?auto_186527 ?auto_186526 ) ( ON ?auto_186528 ?auto_186527 ) ( ON ?auto_186529 ?auto_186528 ) ( ON ?auto_186530 ?auto_186529 ) ( not ( = ?auto_186525 ?auto_186526 ) ) ( not ( = ?auto_186525 ?auto_186527 ) ) ( not ( = ?auto_186525 ?auto_186528 ) ) ( not ( = ?auto_186525 ?auto_186529 ) ) ( not ( = ?auto_186525 ?auto_186530 ) ) ( not ( = ?auto_186525 ?auto_186531 ) ) ( not ( = ?auto_186525 ?auto_186532 ) ) ( not ( = ?auto_186526 ?auto_186527 ) ) ( not ( = ?auto_186526 ?auto_186528 ) ) ( not ( = ?auto_186526 ?auto_186529 ) ) ( not ( = ?auto_186526 ?auto_186530 ) ) ( not ( = ?auto_186526 ?auto_186531 ) ) ( not ( = ?auto_186526 ?auto_186532 ) ) ( not ( = ?auto_186527 ?auto_186528 ) ) ( not ( = ?auto_186527 ?auto_186529 ) ) ( not ( = ?auto_186527 ?auto_186530 ) ) ( not ( = ?auto_186527 ?auto_186531 ) ) ( not ( = ?auto_186527 ?auto_186532 ) ) ( not ( = ?auto_186528 ?auto_186529 ) ) ( not ( = ?auto_186528 ?auto_186530 ) ) ( not ( = ?auto_186528 ?auto_186531 ) ) ( not ( = ?auto_186528 ?auto_186532 ) ) ( not ( = ?auto_186529 ?auto_186530 ) ) ( not ( = ?auto_186529 ?auto_186531 ) ) ( not ( = ?auto_186529 ?auto_186532 ) ) ( not ( = ?auto_186530 ?auto_186531 ) ) ( not ( = ?auto_186530 ?auto_186532 ) ) ( not ( = ?auto_186531 ?auto_186532 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186531 ?auto_186532 )
      ( !STACK ?auto_186531 ?auto_186530 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_186540 - BLOCK
      ?auto_186541 - BLOCK
      ?auto_186542 - BLOCK
      ?auto_186543 - BLOCK
      ?auto_186544 - BLOCK
      ?auto_186545 - BLOCK
      ?auto_186546 - BLOCK
    )
    :vars
    (
      ?auto_186547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186546 ?auto_186547 ) ( ON-TABLE ?auto_186540 ) ( ON ?auto_186541 ?auto_186540 ) ( ON ?auto_186542 ?auto_186541 ) ( ON ?auto_186543 ?auto_186542 ) ( ON ?auto_186544 ?auto_186543 ) ( not ( = ?auto_186540 ?auto_186541 ) ) ( not ( = ?auto_186540 ?auto_186542 ) ) ( not ( = ?auto_186540 ?auto_186543 ) ) ( not ( = ?auto_186540 ?auto_186544 ) ) ( not ( = ?auto_186540 ?auto_186545 ) ) ( not ( = ?auto_186540 ?auto_186546 ) ) ( not ( = ?auto_186540 ?auto_186547 ) ) ( not ( = ?auto_186541 ?auto_186542 ) ) ( not ( = ?auto_186541 ?auto_186543 ) ) ( not ( = ?auto_186541 ?auto_186544 ) ) ( not ( = ?auto_186541 ?auto_186545 ) ) ( not ( = ?auto_186541 ?auto_186546 ) ) ( not ( = ?auto_186541 ?auto_186547 ) ) ( not ( = ?auto_186542 ?auto_186543 ) ) ( not ( = ?auto_186542 ?auto_186544 ) ) ( not ( = ?auto_186542 ?auto_186545 ) ) ( not ( = ?auto_186542 ?auto_186546 ) ) ( not ( = ?auto_186542 ?auto_186547 ) ) ( not ( = ?auto_186543 ?auto_186544 ) ) ( not ( = ?auto_186543 ?auto_186545 ) ) ( not ( = ?auto_186543 ?auto_186546 ) ) ( not ( = ?auto_186543 ?auto_186547 ) ) ( not ( = ?auto_186544 ?auto_186545 ) ) ( not ( = ?auto_186544 ?auto_186546 ) ) ( not ( = ?auto_186544 ?auto_186547 ) ) ( not ( = ?auto_186545 ?auto_186546 ) ) ( not ( = ?auto_186545 ?auto_186547 ) ) ( not ( = ?auto_186546 ?auto_186547 ) ) ( CLEAR ?auto_186544 ) ( ON ?auto_186545 ?auto_186546 ) ( CLEAR ?auto_186545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186540 ?auto_186541 ?auto_186542 ?auto_186543 ?auto_186544 ?auto_186545 )
      ( MAKE-7PILE ?auto_186540 ?auto_186541 ?auto_186542 ?auto_186543 ?auto_186544 ?auto_186545 ?auto_186546 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_186555 - BLOCK
      ?auto_186556 - BLOCK
      ?auto_186557 - BLOCK
      ?auto_186558 - BLOCK
      ?auto_186559 - BLOCK
      ?auto_186560 - BLOCK
      ?auto_186561 - BLOCK
    )
    :vars
    (
      ?auto_186562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186561 ?auto_186562 ) ( ON-TABLE ?auto_186555 ) ( ON ?auto_186556 ?auto_186555 ) ( ON ?auto_186557 ?auto_186556 ) ( ON ?auto_186558 ?auto_186557 ) ( ON ?auto_186559 ?auto_186558 ) ( not ( = ?auto_186555 ?auto_186556 ) ) ( not ( = ?auto_186555 ?auto_186557 ) ) ( not ( = ?auto_186555 ?auto_186558 ) ) ( not ( = ?auto_186555 ?auto_186559 ) ) ( not ( = ?auto_186555 ?auto_186560 ) ) ( not ( = ?auto_186555 ?auto_186561 ) ) ( not ( = ?auto_186555 ?auto_186562 ) ) ( not ( = ?auto_186556 ?auto_186557 ) ) ( not ( = ?auto_186556 ?auto_186558 ) ) ( not ( = ?auto_186556 ?auto_186559 ) ) ( not ( = ?auto_186556 ?auto_186560 ) ) ( not ( = ?auto_186556 ?auto_186561 ) ) ( not ( = ?auto_186556 ?auto_186562 ) ) ( not ( = ?auto_186557 ?auto_186558 ) ) ( not ( = ?auto_186557 ?auto_186559 ) ) ( not ( = ?auto_186557 ?auto_186560 ) ) ( not ( = ?auto_186557 ?auto_186561 ) ) ( not ( = ?auto_186557 ?auto_186562 ) ) ( not ( = ?auto_186558 ?auto_186559 ) ) ( not ( = ?auto_186558 ?auto_186560 ) ) ( not ( = ?auto_186558 ?auto_186561 ) ) ( not ( = ?auto_186558 ?auto_186562 ) ) ( not ( = ?auto_186559 ?auto_186560 ) ) ( not ( = ?auto_186559 ?auto_186561 ) ) ( not ( = ?auto_186559 ?auto_186562 ) ) ( not ( = ?auto_186560 ?auto_186561 ) ) ( not ( = ?auto_186560 ?auto_186562 ) ) ( not ( = ?auto_186561 ?auto_186562 ) ) ( CLEAR ?auto_186559 ) ( ON ?auto_186560 ?auto_186561 ) ( CLEAR ?auto_186560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186555 ?auto_186556 ?auto_186557 ?auto_186558 ?auto_186559 ?auto_186560 )
      ( MAKE-7PILE ?auto_186555 ?auto_186556 ?auto_186557 ?auto_186558 ?auto_186559 ?auto_186560 ?auto_186561 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_186570 - BLOCK
      ?auto_186571 - BLOCK
      ?auto_186572 - BLOCK
      ?auto_186573 - BLOCK
      ?auto_186574 - BLOCK
      ?auto_186575 - BLOCK
      ?auto_186576 - BLOCK
    )
    :vars
    (
      ?auto_186577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186576 ?auto_186577 ) ( ON-TABLE ?auto_186570 ) ( ON ?auto_186571 ?auto_186570 ) ( ON ?auto_186572 ?auto_186571 ) ( ON ?auto_186573 ?auto_186572 ) ( not ( = ?auto_186570 ?auto_186571 ) ) ( not ( = ?auto_186570 ?auto_186572 ) ) ( not ( = ?auto_186570 ?auto_186573 ) ) ( not ( = ?auto_186570 ?auto_186574 ) ) ( not ( = ?auto_186570 ?auto_186575 ) ) ( not ( = ?auto_186570 ?auto_186576 ) ) ( not ( = ?auto_186570 ?auto_186577 ) ) ( not ( = ?auto_186571 ?auto_186572 ) ) ( not ( = ?auto_186571 ?auto_186573 ) ) ( not ( = ?auto_186571 ?auto_186574 ) ) ( not ( = ?auto_186571 ?auto_186575 ) ) ( not ( = ?auto_186571 ?auto_186576 ) ) ( not ( = ?auto_186571 ?auto_186577 ) ) ( not ( = ?auto_186572 ?auto_186573 ) ) ( not ( = ?auto_186572 ?auto_186574 ) ) ( not ( = ?auto_186572 ?auto_186575 ) ) ( not ( = ?auto_186572 ?auto_186576 ) ) ( not ( = ?auto_186572 ?auto_186577 ) ) ( not ( = ?auto_186573 ?auto_186574 ) ) ( not ( = ?auto_186573 ?auto_186575 ) ) ( not ( = ?auto_186573 ?auto_186576 ) ) ( not ( = ?auto_186573 ?auto_186577 ) ) ( not ( = ?auto_186574 ?auto_186575 ) ) ( not ( = ?auto_186574 ?auto_186576 ) ) ( not ( = ?auto_186574 ?auto_186577 ) ) ( not ( = ?auto_186575 ?auto_186576 ) ) ( not ( = ?auto_186575 ?auto_186577 ) ) ( not ( = ?auto_186576 ?auto_186577 ) ) ( ON ?auto_186575 ?auto_186576 ) ( CLEAR ?auto_186573 ) ( ON ?auto_186574 ?auto_186575 ) ( CLEAR ?auto_186574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186570 ?auto_186571 ?auto_186572 ?auto_186573 ?auto_186574 )
      ( MAKE-7PILE ?auto_186570 ?auto_186571 ?auto_186572 ?auto_186573 ?auto_186574 ?auto_186575 ?auto_186576 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_186585 - BLOCK
      ?auto_186586 - BLOCK
      ?auto_186587 - BLOCK
      ?auto_186588 - BLOCK
      ?auto_186589 - BLOCK
      ?auto_186590 - BLOCK
      ?auto_186591 - BLOCK
    )
    :vars
    (
      ?auto_186592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186591 ?auto_186592 ) ( ON-TABLE ?auto_186585 ) ( ON ?auto_186586 ?auto_186585 ) ( ON ?auto_186587 ?auto_186586 ) ( ON ?auto_186588 ?auto_186587 ) ( not ( = ?auto_186585 ?auto_186586 ) ) ( not ( = ?auto_186585 ?auto_186587 ) ) ( not ( = ?auto_186585 ?auto_186588 ) ) ( not ( = ?auto_186585 ?auto_186589 ) ) ( not ( = ?auto_186585 ?auto_186590 ) ) ( not ( = ?auto_186585 ?auto_186591 ) ) ( not ( = ?auto_186585 ?auto_186592 ) ) ( not ( = ?auto_186586 ?auto_186587 ) ) ( not ( = ?auto_186586 ?auto_186588 ) ) ( not ( = ?auto_186586 ?auto_186589 ) ) ( not ( = ?auto_186586 ?auto_186590 ) ) ( not ( = ?auto_186586 ?auto_186591 ) ) ( not ( = ?auto_186586 ?auto_186592 ) ) ( not ( = ?auto_186587 ?auto_186588 ) ) ( not ( = ?auto_186587 ?auto_186589 ) ) ( not ( = ?auto_186587 ?auto_186590 ) ) ( not ( = ?auto_186587 ?auto_186591 ) ) ( not ( = ?auto_186587 ?auto_186592 ) ) ( not ( = ?auto_186588 ?auto_186589 ) ) ( not ( = ?auto_186588 ?auto_186590 ) ) ( not ( = ?auto_186588 ?auto_186591 ) ) ( not ( = ?auto_186588 ?auto_186592 ) ) ( not ( = ?auto_186589 ?auto_186590 ) ) ( not ( = ?auto_186589 ?auto_186591 ) ) ( not ( = ?auto_186589 ?auto_186592 ) ) ( not ( = ?auto_186590 ?auto_186591 ) ) ( not ( = ?auto_186590 ?auto_186592 ) ) ( not ( = ?auto_186591 ?auto_186592 ) ) ( ON ?auto_186590 ?auto_186591 ) ( CLEAR ?auto_186588 ) ( ON ?auto_186589 ?auto_186590 ) ( CLEAR ?auto_186589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186585 ?auto_186586 ?auto_186587 ?auto_186588 ?auto_186589 )
      ( MAKE-7PILE ?auto_186585 ?auto_186586 ?auto_186587 ?auto_186588 ?auto_186589 ?auto_186590 ?auto_186591 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_186600 - BLOCK
      ?auto_186601 - BLOCK
      ?auto_186602 - BLOCK
      ?auto_186603 - BLOCK
      ?auto_186604 - BLOCK
      ?auto_186605 - BLOCK
      ?auto_186606 - BLOCK
    )
    :vars
    (
      ?auto_186607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186606 ?auto_186607 ) ( ON-TABLE ?auto_186600 ) ( ON ?auto_186601 ?auto_186600 ) ( ON ?auto_186602 ?auto_186601 ) ( not ( = ?auto_186600 ?auto_186601 ) ) ( not ( = ?auto_186600 ?auto_186602 ) ) ( not ( = ?auto_186600 ?auto_186603 ) ) ( not ( = ?auto_186600 ?auto_186604 ) ) ( not ( = ?auto_186600 ?auto_186605 ) ) ( not ( = ?auto_186600 ?auto_186606 ) ) ( not ( = ?auto_186600 ?auto_186607 ) ) ( not ( = ?auto_186601 ?auto_186602 ) ) ( not ( = ?auto_186601 ?auto_186603 ) ) ( not ( = ?auto_186601 ?auto_186604 ) ) ( not ( = ?auto_186601 ?auto_186605 ) ) ( not ( = ?auto_186601 ?auto_186606 ) ) ( not ( = ?auto_186601 ?auto_186607 ) ) ( not ( = ?auto_186602 ?auto_186603 ) ) ( not ( = ?auto_186602 ?auto_186604 ) ) ( not ( = ?auto_186602 ?auto_186605 ) ) ( not ( = ?auto_186602 ?auto_186606 ) ) ( not ( = ?auto_186602 ?auto_186607 ) ) ( not ( = ?auto_186603 ?auto_186604 ) ) ( not ( = ?auto_186603 ?auto_186605 ) ) ( not ( = ?auto_186603 ?auto_186606 ) ) ( not ( = ?auto_186603 ?auto_186607 ) ) ( not ( = ?auto_186604 ?auto_186605 ) ) ( not ( = ?auto_186604 ?auto_186606 ) ) ( not ( = ?auto_186604 ?auto_186607 ) ) ( not ( = ?auto_186605 ?auto_186606 ) ) ( not ( = ?auto_186605 ?auto_186607 ) ) ( not ( = ?auto_186606 ?auto_186607 ) ) ( ON ?auto_186605 ?auto_186606 ) ( ON ?auto_186604 ?auto_186605 ) ( CLEAR ?auto_186602 ) ( ON ?auto_186603 ?auto_186604 ) ( CLEAR ?auto_186603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186600 ?auto_186601 ?auto_186602 ?auto_186603 )
      ( MAKE-7PILE ?auto_186600 ?auto_186601 ?auto_186602 ?auto_186603 ?auto_186604 ?auto_186605 ?auto_186606 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_186615 - BLOCK
      ?auto_186616 - BLOCK
      ?auto_186617 - BLOCK
      ?auto_186618 - BLOCK
      ?auto_186619 - BLOCK
      ?auto_186620 - BLOCK
      ?auto_186621 - BLOCK
    )
    :vars
    (
      ?auto_186622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186621 ?auto_186622 ) ( ON-TABLE ?auto_186615 ) ( ON ?auto_186616 ?auto_186615 ) ( ON ?auto_186617 ?auto_186616 ) ( not ( = ?auto_186615 ?auto_186616 ) ) ( not ( = ?auto_186615 ?auto_186617 ) ) ( not ( = ?auto_186615 ?auto_186618 ) ) ( not ( = ?auto_186615 ?auto_186619 ) ) ( not ( = ?auto_186615 ?auto_186620 ) ) ( not ( = ?auto_186615 ?auto_186621 ) ) ( not ( = ?auto_186615 ?auto_186622 ) ) ( not ( = ?auto_186616 ?auto_186617 ) ) ( not ( = ?auto_186616 ?auto_186618 ) ) ( not ( = ?auto_186616 ?auto_186619 ) ) ( not ( = ?auto_186616 ?auto_186620 ) ) ( not ( = ?auto_186616 ?auto_186621 ) ) ( not ( = ?auto_186616 ?auto_186622 ) ) ( not ( = ?auto_186617 ?auto_186618 ) ) ( not ( = ?auto_186617 ?auto_186619 ) ) ( not ( = ?auto_186617 ?auto_186620 ) ) ( not ( = ?auto_186617 ?auto_186621 ) ) ( not ( = ?auto_186617 ?auto_186622 ) ) ( not ( = ?auto_186618 ?auto_186619 ) ) ( not ( = ?auto_186618 ?auto_186620 ) ) ( not ( = ?auto_186618 ?auto_186621 ) ) ( not ( = ?auto_186618 ?auto_186622 ) ) ( not ( = ?auto_186619 ?auto_186620 ) ) ( not ( = ?auto_186619 ?auto_186621 ) ) ( not ( = ?auto_186619 ?auto_186622 ) ) ( not ( = ?auto_186620 ?auto_186621 ) ) ( not ( = ?auto_186620 ?auto_186622 ) ) ( not ( = ?auto_186621 ?auto_186622 ) ) ( ON ?auto_186620 ?auto_186621 ) ( ON ?auto_186619 ?auto_186620 ) ( CLEAR ?auto_186617 ) ( ON ?auto_186618 ?auto_186619 ) ( CLEAR ?auto_186618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186615 ?auto_186616 ?auto_186617 ?auto_186618 )
      ( MAKE-7PILE ?auto_186615 ?auto_186616 ?auto_186617 ?auto_186618 ?auto_186619 ?auto_186620 ?auto_186621 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_186630 - BLOCK
      ?auto_186631 - BLOCK
      ?auto_186632 - BLOCK
      ?auto_186633 - BLOCK
      ?auto_186634 - BLOCK
      ?auto_186635 - BLOCK
      ?auto_186636 - BLOCK
    )
    :vars
    (
      ?auto_186637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186636 ?auto_186637 ) ( ON-TABLE ?auto_186630 ) ( ON ?auto_186631 ?auto_186630 ) ( not ( = ?auto_186630 ?auto_186631 ) ) ( not ( = ?auto_186630 ?auto_186632 ) ) ( not ( = ?auto_186630 ?auto_186633 ) ) ( not ( = ?auto_186630 ?auto_186634 ) ) ( not ( = ?auto_186630 ?auto_186635 ) ) ( not ( = ?auto_186630 ?auto_186636 ) ) ( not ( = ?auto_186630 ?auto_186637 ) ) ( not ( = ?auto_186631 ?auto_186632 ) ) ( not ( = ?auto_186631 ?auto_186633 ) ) ( not ( = ?auto_186631 ?auto_186634 ) ) ( not ( = ?auto_186631 ?auto_186635 ) ) ( not ( = ?auto_186631 ?auto_186636 ) ) ( not ( = ?auto_186631 ?auto_186637 ) ) ( not ( = ?auto_186632 ?auto_186633 ) ) ( not ( = ?auto_186632 ?auto_186634 ) ) ( not ( = ?auto_186632 ?auto_186635 ) ) ( not ( = ?auto_186632 ?auto_186636 ) ) ( not ( = ?auto_186632 ?auto_186637 ) ) ( not ( = ?auto_186633 ?auto_186634 ) ) ( not ( = ?auto_186633 ?auto_186635 ) ) ( not ( = ?auto_186633 ?auto_186636 ) ) ( not ( = ?auto_186633 ?auto_186637 ) ) ( not ( = ?auto_186634 ?auto_186635 ) ) ( not ( = ?auto_186634 ?auto_186636 ) ) ( not ( = ?auto_186634 ?auto_186637 ) ) ( not ( = ?auto_186635 ?auto_186636 ) ) ( not ( = ?auto_186635 ?auto_186637 ) ) ( not ( = ?auto_186636 ?auto_186637 ) ) ( ON ?auto_186635 ?auto_186636 ) ( ON ?auto_186634 ?auto_186635 ) ( ON ?auto_186633 ?auto_186634 ) ( CLEAR ?auto_186631 ) ( ON ?auto_186632 ?auto_186633 ) ( CLEAR ?auto_186632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186630 ?auto_186631 ?auto_186632 )
      ( MAKE-7PILE ?auto_186630 ?auto_186631 ?auto_186632 ?auto_186633 ?auto_186634 ?auto_186635 ?auto_186636 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_186645 - BLOCK
      ?auto_186646 - BLOCK
      ?auto_186647 - BLOCK
      ?auto_186648 - BLOCK
      ?auto_186649 - BLOCK
      ?auto_186650 - BLOCK
      ?auto_186651 - BLOCK
    )
    :vars
    (
      ?auto_186652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186651 ?auto_186652 ) ( ON-TABLE ?auto_186645 ) ( ON ?auto_186646 ?auto_186645 ) ( not ( = ?auto_186645 ?auto_186646 ) ) ( not ( = ?auto_186645 ?auto_186647 ) ) ( not ( = ?auto_186645 ?auto_186648 ) ) ( not ( = ?auto_186645 ?auto_186649 ) ) ( not ( = ?auto_186645 ?auto_186650 ) ) ( not ( = ?auto_186645 ?auto_186651 ) ) ( not ( = ?auto_186645 ?auto_186652 ) ) ( not ( = ?auto_186646 ?auto_186647 ) ) ( not ( = ?auto_186646 ?auto_186648 ) ) ( not ( = ?auto_186646 ?auto_186649 ) ) ( not ( = ?auto_186646 ?auto_186650 ) ) ( not ( = ?auto_186646 ?auto_186651 ) ) ( not ( = ?auto_186646 ?auto_186652 ) ) ( not ( = ?auto_186647 ?auto_186648 ) ) ( not ( = ?auto_186647 ?auto_186649 ) ) ( not ( = ?auto_186647 ?auto_186650 ) ) ( not ( = ?auto_186647 ?auto_186651 ) ) ( not ( = ?auto_186647 ?auto_186652 ) ) ( not ( = ?auto_186648 ?auto_186649 ) ) ( not ( = ?auto_186648 ?auto_186650 ) ) ( not ( = ?auto_186648 ?auto_186651 ) ) ( not ( = ?auto_186648 ?auto_186652 ) ) ( not ( = ?auto_186649 ?auto_186650 ) ) ( not ( = ?auto_186649 ?auto_186651 ) ) ( not ( = ?auto_186649 ?auto_186652 ) ) ( not ( = ?auto_186650 ?auto_186651 ) ) ( not ( = ?auto_186650 ?auto_186652 ) ) ( not ( = ?auto_186651 ?auto_186652 ) ) ( ON ?auto_186650 ?auto_186651 ) ( ON ?auto_186649 ?auto_186650 ) ( ON ?auto_186648 ?auto_186649 ) ( CLEAR ?auto_186646 ) ( ON ?auto_186647 ?auto_186648 ) ( CLEAR ?auto_186647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186645 ?auto_186646 ?auto_186647 )
      ( MAKE-7PILE ?auto_186645 ?auto_186646 ?auto_186647 ?auto_186648 ?auto_186649 ?auto_186650 ?auto_186651 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_186660 - BLOCK
      ?auto_186661 - BLOCK
      ?auto_186662 - BLOCK
      ?auto_186663 - BLOCK
      ?auto_186664 - BLOCK
      ?auto_186665 - BLOCK
      ?auto_186666 - BLOCK
    )
    :vars
    (
      ?auto_186667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186666 ?auto_186667 ) ( ON-TABLE ?auto_186660 ) ( not ( = ?auto_186660 ?auto_186661 ) ) ( not ( = ?auto_186660 ?auto_186662 ) ) ( not ( = ?auto_186660 ?auto_186663 ) ) ( not ( = ?auto_186660 ?auto_186664 ) ) ( not ( = ?auto_186660 ?auto_186665 ) ) ( not ( = ?auto_186660 ?auto_186666 ) ) ( not ( = ?auto_186660 ?auto_186667 ) ) ( not ( = ?auto_186661 ?auto_186662 ) ) ( not ( = ?auto_186661 ?auto_186663 ) ) ( not ( = ?auto_186661 ?auto_186664 ) ) ( not ( = ?auto_186661 ?auto_186665 ) ) ( not ( = ?auto_186661 ?auto_186666 ) ) ( not ( = ?auto_186661 ?auto_186667 ) ) ( not ( = ?auto_186662 ?auto_186663 ) ) ( not ( = ?auto_186662 ?auto_186664 ) ) ( not ( = ?auto_186662 ?auto_186665 ) ) ( not ( = ?auto_186662 ?auto_186666 ) ) ( not ( = ?auto_186662 ?auto_186667 ) ) ( not ( = ?auto_186663 ?auto_186664 ) ) ( not ( = ?auto_186663 ?auto_186665 ) ) ( not ( = ?auto_186663 ?auto_186666 ) ) ( not ( = ?auto_186663 ?auto_186667 ) ) ( not ( = ?auto_186664 ?auto_186665 ) ) ( not ( = ?auto_186664 ?auto_186666 ) ) ( not ( = ?auto_186664 ?auto_186667 ) ) ( not ( = ?auto_186665 ?auto_186666 ) ) ( not ( = ?auto_186665 ?auto_186667 ) ) ( not ( = ?auto_186666 ?auto_186667 ) ) ( ON ?auto_186665 ?auto_186666 ) ( ON ?auto_186664 ?auto_186665 ) ( ON ?auto_186663 ?auto_186664 ) ( ON ?auto_186662 ?auto_186663 ) ( CLEAR ?auto_186660 ) ( ON ?auto_186661 ?auto_186662 ) ( CLEAR ?auto_186661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186660 ?auto_186661 )
      ( MAKE-7PILE ?auto_186660 ?auto_186661 ?auto_186662 ?auto_186663 ?auto_186664 ?auto_186665 ?auto_186666 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_186675 - BLOCK
      ?auto_186676 - BLOCK
      ?auto_186677 - BLOCK
      ?auto_186678 - BLOCK
      ?auto_186679 - BLOCK
      ?auto_186680 - BLOCK
      ?auto_186681 - BLOCK
    )
    :vars
    (
      ?auto_186682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186681 ?auto_186682 ) ( ON-TABLE ?auto_186675 ) ( not ( = ?auto_186675 ?auto_186676 ) ) ( not ( = ?auto_186675 ?auto_186677 ) ) ( not ( = ?auto_186675 ?auto_186678 ) ) ( not ( = ?auto_186675 ?auto_186679 ) ) ( not ( = ?auto_186675 ?auto_186680 ) ) ( not ( = ?auto_186675 ?auto_186681 ) ) ( not ( = ?auto_186675 ?auto_186682 ) ) ( not ( = ?auto_186676 ?auto_186677 ) ) ( not ( = ?auto_186676 ?auto_186678 ) ) ( not ( = ?auto_186676 ?auto_186679 ) ) ( not ( = ?auto_186676 ?auto_186680 ) ) ( not ( = ?auto_186676 ?auto_186681 ) ) ( not ( = ?auto_186676 ?auto_186682 ) ) ( not ( = ?auto_186677 ?auto_186678 ) ) ( not ( = ?auto_186677 ?auto_186679 ) ) ( not ( = ?auto_186677 ?auto_186680 ) ) ( not ( = ?auto_186677 ?auto_186681 ) ) ( not ( = ?auto_186677 ?auto_186682 ) ) ( not ( = ?auto_186678 ?auto_186679 ) ) ( not ( = ?auto_186678 ?auto_186680 ) ) ( not ( = ?auto_186678 ?auto_186681 ) ) ( not ( = ?auto_186678 ?auto_186682 ) ) ( not ( = ?auto_186679 ?auto_186680 ) ) ( not ( = ?auto_186679 ?auto_186681 ) ) ( not ( = ?auto_186679 ?auto_186682 ) ) ( not ( = ?auto_186680 ?auto_186681 ) ) ( not ( = ?auto_186680 ?auto_186682 ) ) ( not ( = ?auto_186681 ?auto_186682 ) ) ( ON ?auto_186680 ?auto_186681 ) ( ON ?auto_186679 ?auto_186680 ) ( ON ?auto_186678 ?auto_186679 ) ( ON ?auto_186677 ?auto_186678 ) ( CLEAR ?auto_186675 ) ( ON ?auto_186676 ?auto_186677 ) ( CLEAR ?auto_186676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186675 ?auto_186676 )
      ( MAKE-7PILE ?auto_186675 ?auto_186676 ?auto_186677 ?auto_186678 ?auto_186679 ?auto_186680 ?auto_186681 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_186690 - BLOCK
      ?auto_186691 - BLOCK
      ?auto_186692 - BLOCK
      ?auto_186693 - BLOCK
      ?auto_186694 - BLOCK
      ?auto_186695 - BLOCK
      ?auto_186696 - BLOCK
    )
    :vars
    (
      ?auto_186697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186696 ?auto_186697 ) ( not ( = ?auto_186690 ?auto_186691 ) ) ( not ( = ?auto_186690 ?auto_186692 ) ) ( not ( = ?auto_186690 ?auto_186693 ) ) ( not ( = ?auto_186690 ?auto_186694 ) ) ( not ( = ?auto_186690 ?auto_186695 ) ) ( not ( = ?auto_186690 ?auto_186696 ) ) ( not ( = ?auto_186690 ?auto_186697 ) ) ( not ( = ?auto_186691 ?auto_186692 ) ) ( not ( = ?auto_186691 ?auto_186693 ) ) ( not ( = ?auto_186691 ?auto_186694 ) ) ( not ( = ?auto_186691 ?auto_186695 ) ) ( not ( = ?auto_186691 ?auto_186696 ) ) ( not ( = ?auto_186691 ?auto_186697 ) ) ( not ( = ?auto_186692 ?auto_186693 ) ) ( not ( = ?auto_186692 ?auto_186694 ) ) ( not ( = ?auto_186692 ?auto_186695 ) ) ( not ( = ?auto_186692 ?auto_186696 ) ) ( not ( = ?auto_186692 ?auto_186697 ) ) ( not ( = ?auto_186693 ?auto_186694 ) ) ( not ( = ?auto_186693 ?auto_186695 ) ) ( not ( = ?auto_186693 ?auto_186696 ) ) ( not ( = ?auto_186693 ?auto_186697 ) ) ( not ( = ?auto_186694 ?auto_186695 ) ) ( not ( = ?auto_186694 ?auto_186696 ) ) ( not ( = ?auto_186694 ?auto_186697 ) ) ( not ( = ?auto_186695 ?auto_186696 ) ) ( not ( = ?auto_186695 ?auto_186697 ) ) ( not ( = ?auto_186696 ?auto_186697 ) ) ( ON ?auto_186695 ?auto_186696 ) ( ON ?auto_186694 ?auto_186695 ) ( ON ?auto_186693 ?auto_186694 ) ( ON ?auto_186692 ?auto_186693 ) ( ON ?auto_186691 ?auto_186692 ) ( ON ?auto_186690 ?auto_186691 ) ( CLEAR ?auto_186690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186690 )
      ( MAKE-7PILE ?auto_186690 ?auto_186691 ?auto_186692 ?auto_186693 ?auto_186694 ?auto_186695 ?auto_186696 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_186705 - BLOCK
      ?auto_186706 - BLOCK
      ?auto_186707 - BLOCK
      ?auto_186708 - BLOCK
      ?auto_186709 - BLOCK
      ?auto_186710 - BLOCK
      ?auto_186711 - BLOCK
    )
    :vars
    (
      ?auto_186712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186711 ?auto_186712 ) ( not ( = ?auto_186705 ?auto_186706 ) ) ( not ( = ?auto_186705 ?auto_186707 ) ) ( not ( = ?auto_186705 ?auto_186708 ) ) ( not ( = ?auto_186705 ?auto_186709 ) ) ( not ( = ?auto_186705 ?auto_186710 ) ) ( not ( = ?auto_186705 ?auto_186711 ) ) ( not ( = ?auto_186705 ?auto_186712 ) ) ( not ( = ?auto_186706 ?auto_186707 ) ) ( not ( = ?auto_186706 ?auto_186708 ) ) ( not ( = ?auto_186706 ?auto_186709 ) ) ( not ( = ?auto_186706 ?auto_186710 ) ) ( not ( = ?auto_186706 ?auto_186711 ) ) ( not ( = ?auto_186706 ?auto_186712 ) ) ( not ( = ?auto_186707 ?auto_186708 ) ) ( not ( = ?auto_186707 ?auto_186709 ) ) ( not ( = ?auto_186707 ?auto_186710 ) ) ( not ( = ?auto_186707 ?auto_186711 ) ) ( not ( = ?auto_186707 ?auto_186712 ) ) ( not ( = ?auto_186708 ?auto_186709 ) ) ( not ( = ?auto_186708 ?auto_186710 ) ) ( not ( = ?auto_186708 ?auto_186711 ) ) ( not ( = ?auto_186708 ?auto_186712 ) ) ( not ( = ?auto_186709 ?auto_186710 ) ) ( not ( = ?auto_186709 ?auto_186711 ) ) ( not ( = ?auto_186709 ?auto_186712 ) ) ( not ( = ?auto_186710 ?auto_186711 ) ) ( not ( = ?auto_186710 ?auto_186712 ) ) ( not ( = ?auto_186711 ?auto_186712 ) ) ( ON ?auto_186710 ?auto_186711 ) ( ON ?auto_186709 ?auto_186710 ) ( ON ?auto_186708 ?auto_186709 ) ( ON ?auto_186707 ?auto_186708 ) ( ON ?auto_186706 ?auto_186707 ) ( ON ?auto_186705 ?auto_186706 ) ( CLEAR ?auto_186705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186705 )
      ( MAKE-7PILE ?auto_186705 ?auto_186706 ?auto_186707 ?auto_186708 ?auto_186709 ?auto_186710 ?auto_186711 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_186721 - BLOCK
      ?auto_186722 - BLOCK
      ?auto_186723 - BLOCK
      ?auto_186724 - BLOCK
      ?auto_186725 - BLOCK
      ?auto_186726 - BLOCK
      ?auto_186727 - BLOCK
      ?auto_186728 - BLOCK
    )
    :vars
    (
      ?auto_186729 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_186727 ) ( ON ?auto_186728 ?auto_186729 ) ( CLEAR ?auto_186728 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186721 ) ( ON ?auto_186722 ?auto_186721 ) ( ON ?auto_186723 ?auto_186722 ) ( ON ?auto_186724 ?auto_186723 ) ( ON ?auto_186725 ?auto_186724 ) ( ON ?auto_186726 ?auto_186725 ) ( ON ?auto_186727 ?auto_186726 ) ( not ( = ?auto_186721 ?auto_186722 ) ) ( not ( = ?auto_186721 ?auto_186723 ) ) ( not ( = ?auto_186721 ?auto_186724 ) ) ( not ( = ?auto_186721 ?auto_186725 ) ) ( not ( = ?auto_186721 ?auto_186726 ) ) ( not ( = ?auto_186721 ?auto_186727 ) ) ( not ( = ?auto_186721 ?auto_186728 ) ) ( not ( = ?auto_186721 ?auto_186729 ) ) ( not ( = ?auto_186722 ?auto_186723 ) ) ( not ( = ?auto_186722 ?auto_186724 ) ) ( not ( = ?auto_186722 ?auto_186725 ) ) ( not ( = ?auto_186722 ?auto_186726 ) ) ( not ( = ?auto_186722 ?auto_186727 ) ) ( not ( = ?auto_186722 ?auto_186728 ) ) ( not ( = ?auto_186722 ?auto_186729 ) ) ( not ( = ?auto_186723 ?auto_186724 ) ) ( not ( = ?auto_186723 ?auto_186725 ) ) ( not ( = ?auto_186723 ?auto_186726 ) ) ( not ( = ?auto_186723 ?auto_186727 ) ) ( not ( = ?auto_186723 ?auto_186728 ) ) ( not ( = ?auto_186723 ?auto_186729 ) ) ( not ( = ?auto_186724 ?auto_186725 ) ) ( not ( = ?auto_186724 ?auto_186726 ) ) ( not ( = ?auto_186724 ?auto_186727 ) ) ( not ( = ?auto_186724 ?auto_186728 ) ) ( not ( = ?auto_186724 ?auto_186729 ) ) ( not ( = ?auto_186725 ?auto_186726 ) ) ( not ( = ?auto_186725 ?auto_186727 ) ) ( not ( = ?auto_186725 ?auto_186728 ) ) ( not ( = ?auto_186725 ?auto_186729 ) ) ( not ( = ?auto_186726 ?auto_186727 ) ) ( not ( = ?auto_186726 ?auto_186728 ) ) ( not ( = ?auto_186726 ?auto_186729 ) ) ( not ( = ?auto_186727 ?auto_186728 ) ) ( not ( = ?auto_186727 ?auto_186729 ) ) ( not ( = ?auto_186728 ?auto_186729 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186728 ?auto_186729 )
      ( !STACK ?auto_186728 ?auto_186727 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_186738 - BLOCK
      ?auto_186739 - BLOCK
      ?auto_186740 - BLOCK
      ?auto_186741 - BLOCK
      ?auto_186742 - BLOCK
      ?auto_186743 - BLOCK
      ?auto_186744 - BLOCK
      ?auto_186745 - BLOCK
    )
    :vars
    (
      ?auto_186746 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_186744 ) ( ON ?auto_186745 ?auto_186746 ) ( CLEAR ?auto_186745 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186738 ) ( ON ?auto_186739 ?auto_186738 ) ( ON ?auto_186740 ?auto_186739 ) ( ON ?auto_186741 ?auto_186740 ) ( ON ?auto_186742 ?auto_186741 ) ( ON ?auto_186743 ?auto_186742 ) ( ON ?auto_186744 ?auto_186743 ) ( not ( = ?auto_186738 ?auto_186739 ) ) ( not ( = ?auto_186738 ?auto_186740 ) ) ( not ( = ?auto_186738 ?auto_186741 ) ) ( not ( = ?auto_186738 ?auto_186742 ) ) ( not ( = ?auto_186738 ?auto_186743 ) ) ( not ( = ?auto_186738 ?auto_186744 ) ) ( not ( = ?auto_186738 ?auto_186745 ) ) ( not ( = ?auto_186738 ?auto_186746 ) ) ( not ( = ?auto_186739 ?auto_186740 ) ) ( not ( = ?auto_186739 ?auto_186741 ) ) ( not ( = ?auto_186739 ?auto_186742 ) ) ( not ( = ?auto_186739 ?auto_186743 ) ) ( not ( = ?auto_186739 ?auto_186744 ) ) ( not ( = ?auto_186739 ?auto_186745 ) ) ( not ( = ?auto_186739 ?auto_186746 ) ) ( not ( = ?auto_186740 ?auto_186741 ) ) ( not ( = ?auto_186740 ?auto_186742 ) ) ( not ( = ?auto_186740 ?auto_186743 ) ) ( not ( = ?auto_186740 ?auto_186744 ) ) ( not ( = ?auto_186740 ?auto_186745 ) ) ( not ( = ?auto_186740 ?auto_186746 ) ) ( not ( = ?auto_186741 ?auto_186742 ) ) ( not ( = ?auto_186741 ?auto_186743 ) ) ( not ( = ?auto_186741 ?auto_186744 ) ) ( not ( = ?auto_186741 ?auto_186745 ) ) ( not ( = ?auto_186741 ?auto_186746 ) ) ( not ( = ?auto_186742 ?auto_186743 ) ) ( not ( = ?auto_186742 ?auto_186744 ) ) ( not ( = ?auto_186742 ?auto_186745 ) ) ( not ( = ?auto_186742 ?auto_186746 ) ) ( not ( = ?auto_186743 ?auto_186744 ) ) ( not ( = ?auto_186743 ?auto_186745 ) ) ( not ( = ?auto_186743 ?auto_186746 ) ) ( not ( = ?auto_186744 ?auto_186745 ) ) ( not ( = ?auto_186744 ?auto_186746 ) ) ( not ( = ?auto_186745 ?auto_186746 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186745 ?auto_186746 )
      ( !STACK ?auto_186745 ?auto_186744 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_186755 - BLOCK
      ?auto_186756 - BLOCK
      ?auto_186757 - BLOCK
      ?auto_186758 - BLOCK
      ?auto_186759 - BLOCK
      ?auto_186760 - BLOCK
      ?auto_186761 - BLOCK
      ?auto_186762 - BLOCK
    )
    :vars
    (
      ?auto_186763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186762 ?auto_186763 ) ( ON-TABLE ?auto_186755 ) ( ON ?auto_186756 ?auto_186755 ) ( ON ?auto_186757 ?auto_186756 ) ( ON ?auto_186758 ?auto_186757 ) ( ON ?auto_186759 ?auto_186758 ) ( ON ?auto_186760 ?auto_186759 ) ( not ( = ?auto_186755 ?auto_186756 ) ) ( not ( = ?auto_186755 ?auto_186757 ) ) ( not ( = ?auto_186755 ?auto_186758 ) ) ( not ( = ?auto_186755 ?auto_186759 ) ) ( not ( = ?auto_186755 ?auto_186760 ) ) ( not ( = ?auto_186755 ?auto_186761 ) ) ( not ( = ?auto_186755 ?auto_186762 ) ) ( not ( = ?auto_186755 ?auto_186763 ) ) ( not ( = ?auto_186756 ?auto_186757 ) ) ( not ( = ?auto_186756 ?auto_186758 ) ) ( not ( = ?auto_186756 ?auto_186759 ) ) ( not ( = ?auto_186756 ?auto_186760 ) ) ( not ( = ?auto_186756 ?auto_186761 ) ) ( not ( = ?auto_186756 ?auto_186762 ) ) ( not ( = ?auto_186756 ?auto_186763 ) ) ( not ( = ?auto_186757 ?auto_186758 ) ) ( not ( = ?auto_186757 ?auto_186759 ) ) ( not ( = ?auto_186757 ?auto_186760 ) ) ( not ( = ?auto_186757 ?auto_186761 ) ) ( not ( = ?auto_186757 ?auto_186762 ) ) ( not ( = ?auto_186757 ?auto_186763 ) ) ( not ( = ?auto_186758 ?auto_186759 ) ) ( not ( = ?auto_186758 ?auto_186760 ) ) ( not ( = ?auto_186758 ?auto_186761 ) ) ( not ( = ?auto_186758 ?auto_186762 ) ) ( not ( = ?auto_186758 ?auto_186763 ) ) ( not ( = ?auto_186759 ?auto_186760 ) ) ( not ( = ?auto_186759 ?auto_186761 ) ) ( not ( = ?auto_186759 ?auto_186762 ) ) ( not ( = ?auto_186759 ?auto_186763 ) ) ( not ( = ?auto_186760 ?auto_186761 ) ) ( not ( = ?auto_186760 ?auto_186762 ) ) ( not ( = ?auto_186760 ?auto_186763 ) ) ( not ( = ?auto_186761 ?auto_186762 ) ) ( not ( = ?auto_186761 ?auto_186763 ) ) ( not ( = ?auto_186762 ?auto_186763 ) ) ( CLEAR ?auto_186760 ) ( ON ?auto_186761 ?auto_186762 ) ( CLEAR ?auto_186761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186755 ?auto_186756 ?auto_186757 ?auto_186758 ?auto_186759 ?auto_186760 ?auto_186761 )
      ( MAKE-8PILE ?auto_186755 ?auto_186756 ?auto_186757 ?auto_186758 ?auto_186759 ?auto_186760 ?auto_186761 ?auto_186762 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_186772 - BLOCK
      ?auto_186773 - BLOCK
      ?auto_186774 - BLOCK
      ?auto_186775 - BLOCK
      ?auto_186776 - BLOCK
      ?auto_186777 - BLOCK
      ?auto_186778 - BLOCK
      ?auto_186779 - BLOCK
    )
    :vars
    (
      ?auto_186780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186779 ?auto_186780 ) ( ON-TABLE ?auto_186772 ) ( ON ?auto_186773 ?auto_186772 ) ( ON ?auto_186774 ?auto_186773 ) ( ON ?auto_186775 ?auto_186774 ) ( ON ?auto_186776 ?auto_186775 ) ( ON ?auto_186777 ?auto_186776 ) ( not ( = ?auto_186772 ?auto_186773 ) ) ( not ( = ?auto_186772 ?auto_186774 ) ) ( not ( = ?auto_186772 ?auto_186775 ) ) ( not ( = ?auto_186772 ?auto_186776 ) ) ( not ( = ?auto_186772 ?auto_186777 ) ) ( not ( = ?auto_186772 ?auto_186778 ) ) ( not ( = ?auto_186772 ?auto_186779 ) ) ( not ( = ?auto_186772 ?auto_186780 ) ) ( not ( = ?auto_186773 ?auto_186774 ) ) ( not ( = ?auto_186773 ?auto_186775 ) ) ( not ( = ?auto_186773 ?auto_186776 ) ) ( not ( = ?auto_186773 ?auto_186777 ) ) ( not ( = ?auto_186773 ?auto_186778 ) ) ( not ( = ?auto_186773 ?auto_186779 ) ) ( not ( = ?auto_186773 ?auto_186780 ) ) ( not ( = ?auto_186774 ?auto_186775 ) ) ( not ( = ?auto_186774 ?auto_186776 ) ) ( not ( = ?auto_186774 ?auto_186777 ) ) ( not ( = ?auto_186774 ?auto_186778 ) ) ( not ( = ?auto_186774 ?auto_186779 ) ) ( not ( = ?auto_186774 ?auto_186780 ) ) ( not ( = ?auto_186775 ?auto_186776 ) ) ( not ( = ?auto_186775 ?auto_186777 ) ) ( not ( = ?auto_186775 ?auto_186778 ) ) ( not ( = ?auto_186775 ?auto_186779 ) ) ( not ( = ?auto_186775 ?auto_186780 ) ) ( not ( = ?auto_186776 ?auto_186777 ) ) ( not ( = ?auto_186776 ?auto_186778 ) ) ( not ( = ?auto_186776 ?auto_186779 ) ) ( not ( = ?auto_186776 ?auto_186780 ) ) ( not ( = ?auto_186777 ?auto_186778 ) ) ( not ( = ?auto_186777 ?auto_186779 ) ) ( not ( = ?auto_186777 ?auto_186780 ) ) ( not ( = ?auto_186778 ?auto_186779 ) ) ( not ( = ?auto_186778 ?auto_186780 ) ) ( not ( = ?auto_186779 ?auto_186780 ) ) ( CLEAR ?auto_186777 ) ( ON ?auto_186778 ?auto_186779 ) ( CLEAR ?auto_186778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186772 ?auto_186773 ?auto_186774 ?auto_186775 ?auto_186776 ?auto_186777 ?auto_186778 )
      ( MAKE-8PILE ?auto_186772 ?auto_186773 ?auto_186774 ?auto_186775 ?auto_186776 ?auto_186777 ?auto_186778 ?auto_186779 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_186789 - BLOCK
      ?auto_186790 - BLOCK
      ?auto_186791 - BLOCK
      ?auto_186792 - BLOCK
      ?auto_186793 - BLOCK
      ?auto_186794 - BLOCK
      ?auto_186795 - BLOCK
      ?auto_186796 - BLOCK
    )
    :vars
    (
      ?auto_186797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186796 ?auto_186797 ) ( ON-TABLE ?auto_186789 ) ( ON ?auto_186790 ?auto_186789 ) ( ON ?auto_186791 ?auto_186790 ) ( ON ?auto_186792 ?auto_186791 ) ( ON ?auto_186793 ?auto_186792 ) ( not ( = ?auto_186789 ?auto_186790 ) ) ( not ( = ?auto_186789 ?auto_186791 ) ) ( not ( = ?auto_186789 ?auto_186792 ) ) ( not ( = ?auto_186789 ?auto_186793 ) ) ( not ( = ?auto_186789 ?auto_186794 ) ) ( not ( = ?auto_186789 ?auto_186795 ) ) ( not ( = ?auto_186789 ?auto_186796 ) ) ( not ( = ?auto_186789 ?auto_186797 ) ) ( not ( = ?auto_186790 ?auto_186791 ) ) ( not ( = ?auto_186790 ?auto_186792 ) ) ( not ( = ?auto_186790 ?auto_186793 ) ) ( not ( = ?auto_186790 ?auto_186794 ) ) ( not ( = ?auto_186790 ?auto_186795 ) ) ( not ( = ?auto_186790 ?auto_186796 ) ) ( not ( = ?auto_186790 ?auto_186797 ) ) ( not ( = ?auto_186791 ?auto_186792 ) ) ( not ( = ?auto_186791 ?auto_186793 ) ) ( not ( = ?auto_186791 ?auto_186794 ) ) ( not ( = ?auto_186791 ?auto_186795 ) ) ( not ( = ?auto_186791 ?auto_186796 ) ) ( not ( = ?auto_186791 ?auto_186797 ) ) ( not ( = ?auto_186792 ?auto_186793 ) ) ( not ( = ?auto_186792 ?auto_186794 ) ) ( not ( = ?auto_186792 ?auto_186795 ) ) ( not ( = ?auto_186792 ?auto_186796 ) ) ( not ( = ?auto_186792 ?auto_186797 ) ) ( not ( = ?auto_186793 ?auto_186794 ) ) ( not ( = ?auto_186793 ?auto_186795 ) ) ( not ( = ?auto_186793 ?auto_186796 ) ) ( not ( = ?auto_186793 ?auto_186797 ) ) ( not ( = ?auto_186794 ?auto_186795 ) ) ( not ( = ?auto_186794 ?auto_186796 ) ) ( not ( = ?auto_186794 ?auto_186797 ) ) ( not ( = ?auto_186795 ?auto_186796 ) ) ( not ( = ?auto_186795 ?auto_186797 ) ) ( not ( = ?auto_186796 ?auto_186797 ) ) ( ON ?auto_186795 ?auto_186796 ) ( CLEAR ?auto_186793 ) ( ON ?auto_186794 ?auto_186795 ) ( CLEAR ?auto_186794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186789 ?auto_186790 ?auto_186791 ?auto_186792 ?auto_186793 ?auto_186794 )
      ( MAKE-8PILE ?auto_186789 ?auto_186790 ?auto_186791 ?auto_186792 ?auto_186793 ?auto_186794 ?auto_186795 ?auto_186796 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_186806 - BLOCK
      ?auto_186807 - BLOCK
      ?auto_186808 - BLOCK
      ?auto_186809 - BLOCK
      ?auto_186810 - BLOCK
      ?auto_186811 - BLOCK
      ?auto_186812 - BLOCK
      ?auto_186813 - BLOCK
    )
    :vars
    (
      ?auto_186814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186813 ?auto_186814 ) ( ON-TABLE ?auto_186806 ) ( ON ?auto_186807 ?auto_186806 ) ( ON ?auto_186808 ?auto_186807 ) ( ON ?auto_186809 ?auto_186808 ) ( ON ?auto_186810 ?auto_186809 ) ( not ( = ?auto_186806 ?auto_186807 ) ) ( not ( = ?auto_186806 ?auto_186808 ) ) ( not ( = ?auto_186806 ?auto_186809 ) ) ( not ( = ?auto_186806 ?auto_186810 ) ) ( not ( = ?auto_186806 ?auto_186811 ) ) ( not ( = ?auto_186806 ?auto_186812 ) ) ( not ( = ?auto_186806 ?auto_186813 ) ) ( not ( = ?auto_186806 ?auto_186814 ) ) ( not ( = ?auto_186807 ?auto_186808 ) ) ( not ( = ?auto_186807 ?auto_186809 ) ) ( not ( = ?auto_186807 ?auto_186810 ) ) ( not ( = ?auto_186807 ?auto_186811 ) ) ( not ( = ?auto_186807 ?auto_186812 ) ) ( not ( = ?auto_186807 ?auto_186813 ) ) ( not ( = ?auto_186807 ?auto_186814 ) ) ( not ( = ?auto_186808 ?auto_186809 ) ) ( not ( = ?auto_186808 ?auto_186810 ) ) ( not ( = ?auto_186808 ?auto_186811 ) ) ( not ( = ?auto_186808 ?auto_186812 ) ) ( not ( = ?auto_186808 ?auto_186813 ) ) ( not ( = ?auto_186808 ?auto_186814 ) ) ( not ( = ?auto_186809 ?auto_186810 ) ) ( not ( = ?auto_186809 ?auto_186811 ) ) ( not ( = ?auto_186809 ?auto_186812 ) ) ( not ( = ?auto_186809 ?auto_186813 ) ) ( not ( = ?auto_186809 ?auto_186814 ) ) ( not ( = ?auto_186810 ?auto_186811 ) ) ( not ( = ?auto_186810 ?auto_186812 ) ) ( not ( = ?auto_186810 ?auto_186813 ) ) ( not ( = ?auto_186810 ?auto_186814 ) ) ( not ( = ?auto_186811 ?auto_186812 ) ) ( not ( = ?auto_186811 ?auto_186813 ) ) ( not ( = ?auto_186811 ?auto_186814 ) ) ( not ( = ?auto_186812 ?auto_186813 ) ) ( not ( = ?auto_186812 ?auto_186814 ) ) ( not ( = ?auto_186813 ?auto_186814 ) ) ( ON ?auto_186812 ?auto_186813 ) ( CLEAR ?auto_186810 ) ( ON ?auto_186811 ?auto_186812 ) ( CLEAR ?auto_186811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186806 ?auto_186807 ?auto_186808 ?auto_186809 ?auto_186810 ?auto_186811 )
      ( MAKE-8PILE ?auto_186806 ?auto_186807 ?auto_186808 ?auto_186809 ?auto_186810 ?auto_186811 ?auto_186812 ?auto_186813 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_186823 - BLOCK
      ?auto_186824 - BLOCK
      ?auto_186825 - BLOCK
      ?auto_186826 - BLOCK
      ?auto_186827 - BLOCK
      ?auto_186828 - BLOCK
      ?auto_186829 - BLOCK
      ?auto_186830 - BLOCK
    )
    :vars
    (
      ?auto_186831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186830 ?auto_186831 ) ( ON-TABLE ?auto_186823 ) ( ON ?auto_186824 ?auto_186823 ) ( ON ?auto_186825 ?auto_186824 ) ( ON ?auto_186826 ?auto_186825 ) ( not ( = ?auto_186823 ?auto_186824 ) ) ( not ( = ?auto_186823 ?auto_186825 ) ) ( not ( = ?auto_186823 ?auto_186826 ) ) ( not ( = ?auto_186823 ?auto_186827 ) ) ( not ( = ?auto_186823 ?auto_186828 ) ) ( not ( = ?auto_186823 ?auto_186829 ) ) ( not ( = ?auto_186823 ?auto_186830 ) ) ( not ( = ?auto_186823 ?auto_186831 ) ) ( not ( = ?auto_186824 ?auto_186825 ) ) ( not ( = ?auto_186824 ?auto_186826 ) ) ( not ( = ?auto_186824 ?auto_186827 ) ) ( not ( = ?auto_186824 ?auto_186828 ) ) ( not ( = ?auto_186824 ?auto_186829 ) ) ( not ( = ?auto_186824 ?auto_186830 ) ) ( not ( = ?auto_186824 ?auto_186831 ) ) ( not ( = ?auto_186825 ?auto_186826 ) ) ( not ( = ?auto_186825 ?auto_186827 ) ) ( not ( = ?auto_186825 ?auto_186828 ) ) ( not ( = ?auto_186825 ?auto_186829 ) ) ( not ( = ?auto_186825 ?auto_186830 ) ) ( not ( = ?auto_186825 ?auto_186831 ) ) ( not ( = ?auto_186826 ?auto_186827 ) ) ( not ( = ?auto_186826 ?auto_186828 ) ) ( not ( = ?auto_186826 ?auto_186829 ) ) ( not ( = ?auto_186826 ?auto_186830 ) ) ( not ( = ?auto_186826 ?auto_186831 ) ) ( not ( = ?auto_186827 ?auto_186828 ) ) ( not ( = ?auto_186827 ?auto_186829 ) ) ( not ( = ?auto_186827 ?auto_186830 ) ) ( not ( = ?auto_186827 ?auto_186831 ) ) ( not ( = ?auto_186828 ?auto_186829 ) ) ( not ( = ?auto_186828 ?auto_186830 ) ) ( not ( = ?auto_186828 ?auto_186831 ) ) ( not ( = ?auto_186829 ?auto_186830 ) ) ( not ( = ?auto_186829 ?auto_186831 ) ) ( not ( = ?auto_186830 ?auto_186831 ) ) ( ON ?auto_186829 ?auto_186830 ) ( ON ?auto_186828 ?auto_186829 ) ( CLEAR ?auto_186826 ) ( ON ?auto_186827 ?auto_186828 ) ( CLEAR ?auto_186827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186823 ?auto_186824 ?auto_186825 ?auto_186826 ?auto_186827 )
      ( MAKE-8PILE ?auto_186823 ?auto_186824 ?auto_186825 ?auto_186826 ?auto_186827 ?auto_186828 ?auto_186829 ?auto_186830 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_186840 - BLOCK
      ?auto_186841 - BLOCK
      ?auto_186842 - BLOCK
      ?auto_186843 - BLOCK
      ?auto_186844 - BLOCK
      ?auto_186845 - BLOCK
      ?auto_186846 - BLOCK
      ?auto_186847 - BLOCK
    )
    :vars
    (
      ?auto_186848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186847 ?auto_186848 ) ( ON-TABLE ?auto_186840 ) ( ON ?auto_186841 ?auto_186840 ) ( ON ?auto_186842 ?auto_186841 ) ( ON ?auto_186843 ?auto_186842 ) ( not ( = ?auto_186840 ?auto_186841 ) ) ( not ( = ?auto_186840 ?auto_186842 ) ) ( not ( = ?auto_186840 ?auto_186843 ) ) ( not ( = ?auto_186840 ?auto_186844 ) ) ( not ( = ?auto_186840 ?auto_186845 ) ) ( not ( = ?auto_186840 ?auto_186846 ) ) ( not ( = ?auto_186840 ?auto_186847 ) ) ( not ( = ?auto_186840 ?auto_186848 ) ) ( not ( = ?auto_186841 ?auto_186842 ) ) ( not ( = ?auto_186841 ?auto_186843 ) ) ( not ( = ?auto_186841 ?auto_186844 ) ) ( not ( = ?auto_186841 ?auto_186845 ) ) ( not ( = ?auto_186841 ?auto_186846 ) ) ( not ( = ?auto_186841 ?auto_186847 ) ) ( not ( = ?auto_186841 ?auto_186848 ) ) ( not ( = ?auto_186842 ?auto_186843 ) ) ( not ( = ?auto_186842 ?auto_186844 ) ) ( not ( = ?auto_186842 ?auto_186845 ) ) ( not ( = ?auto_186842 ?auto_186846 ) ) ( not ( = ?auto_186842 ?auto_186847 ) ) ( not ( = ?auto_186842 ?auto_186848 ) ) ( not ( = ?auto_186843 ?auto_186844 ) ) ( not ( = ?auto_186843 ?auto_186845 ) ) ( not ( = ?auto_186843 ?auto_186846 ) ) ( not ( = ?auto_186843 ?auto_186847 ) ) ( not ( = ?auto_186843 ?auto_186848 ) ) ( not ( = ?auto_186844 ?auto_186845 ) ) ( not ( = ?auto_186844 ?auto_186846 ) ) ( not ( = ?auto_186844 ?auto_186847 ) ) ( not ( = ?auto_186844 ?auto_186848 ) ) ( not ( = ?auto_186845 ?auto_186846 ) ) ( not ( = ?auto_186845 ?auto_186847 ) ) ( not ( = ?auto_186845 ?auto_186848 ) ) ( not ( = ?auto_186846 ?auto_186847 ) ) ( not ( = ?auto_186846 ?auto_186848 ) ) ( not ( = ?auto_186847 ?auto_186848 ) ) ( ON ?auto_186846 ?auto_186847 ) ( ON ?auto_186845 ?auto_186846 ) ( CLEAR ?auto_186843 ) ( ON ?auto_186844 ?auto_186845 ) ( CLEAR ?auto_186844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186840 ?auto_186841 ?auto_186842 ?auto_186843 ?auto_186844 )
      ( MAKE-8PILE ?auto_186840 ?auto_186841 ?auto_186842 ?auto_186843 ?auto_186844 ?auto_186845 ?auto_186846 ?auto_186847 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_186857 - BLOCK
      ?auto_186858 - BLOCK
      ?auto_186859 - BLOCK
      ?auto_186860 - BLOCK
      ?auto_186861 - BLOCK
      ?auto_186862 - BLOCK
      ?auto_186863 - BLOCK
      ?auto_186864 - BLOCK
    )
    :vars
    (
      ?auto_186865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186864 ?auto_186865 ) ( ON-TABLE ?auto_186857 ) ( ON ?auto_186858 ?auto_186857 ) ( ON ?auto_186859 ?auto_186858 ) ( not ( = ?auto_186857 ?auto_186858 ) ) ( not ( = ?auto_186857 ?auto_186859 ) ) ( not ( = ?auto_186857 ?auto_186860 ) ) ( not ( = ?auto_186857 ?auto_186861 ) ) ( not ( = ?auto_186857 ?auto_186862 ) ) ( not ( = ?auto_186857 ?auto_186863 ) ) ( not ( = ?auto_186857 ?auto_186864 ) ) ( not ( = ?auto_186857 ?auto_186865 ) ) ( not ( = ?auto_186858 ?auto_186859 ) ) ( not ( = ?auto_186858 ?auto_186860 ) ) ( not ( = ?auto_186858 ?auto_186861 ) ) ( not ( = ?auto_186858 ?auto_186862 ) ) ( not ( = ?auto_186858 ?auto_186863 ) ) ( not ( = ?auto_186858 ?auto_186864 ) ) ( not ( = ?auto_186858 ?auto_186865 ) ) ( not ( = ?auto_186859 ?auto_186860 ) ) ( not ( = ?auto_186859 ?auto_186861 ) ) ( not ( = ?auto_186859 ?auto_186862 ) ) ( not ( = ?auto_186859 ?auto_186863 ) ) ( not ( = ?auto_186859 ?auto_186864 ) ) ( not ( = ?auto_186859 ?auto_186865 ) ) ( not ( = ?auto_186860 ?auto_186861 ) ) ( not ( = ?auto_186860 ?auto_186862 ) ) ( not ( = ?auto_186860 ?auto_186863 ) ) ( not ( = ?auto_186860 ?auto_186864 ) ) ( not ( = ?auto_186860 ?auto_186865 ) ) ( not ( = ?auto_186861 ?auto_186862 ) ) ( not ( = ?auto_186861 ?auto_186863 ) ) ( not ( = ?auto_186861 ?auto_186864 ) ) ( not ( = ?auto_186861 ?auto_186865 ) ) ( not ( = ?auto_186862 ?auto_186863 ) ) ( not ( = ?auto_186862 ?auto_186864 ) ) ( not ( = ?auto_186862 ?auto_186865 ) ) ( not ( = ?auto_186863 ?auto_186864 ) ) ( not ( = ?auto_186863 ?auto_186865 ) ) ( not ( = ?auto_186864 ?auto_186865 ) ) ( ON ?auto_186863 ?auto_186864 ) ( ON ?auto_186862 ?auto_186863 ) ( ON ?auto_186861 ?auto_186862 ) ( CLEAR ?auto_186859 ) ( ON ?auto_186860 ?auto_186861 ) ( CLEAR ?auto_186860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186857 ?auto_186858 ?auto_186859 ?auto_186860 )
      ( MAKE-8PILE ?auto_186857 ?auto_186858 ?auto_186859 ?auto_186860 ?auto_186861 ?auto_186862 ?auto_186863 ?auto_186864 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_186874 - BLOCK
      ?auto_186875 - BLOCK
      ?auto_186876 - BLOCK
      ?auto_186877 - BLOCK
      ?auto_186878 - BLOCK
      ?auto_186879 - BLOCK
      ?auto_186880 - BLOCK
      ?auto_186881 - BLOCK
    )
    :vars
    (
      ?auto_186882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186881 ?auto_186882 ) ( ON-TABLE ?auto_186874 ) ( ON ?auto_186875 ?auto_186874 ) ( ON ?auto_186876 ?auto_186875 ) ( not ( = ?auto_186874 ?auto_186875 ) ) ( not ( = ?auto_186874 ?auto_186876 ) ) ( not ( = ?auto_186874 ?auto_186877 ) ) ( not ( = ?auto_186874 ?auto_186878 ) ) ( not ( = ?auto_186874 ?auto_186879 ) ) ( not ( = ?auto_186874 ?auto_186880 ) ) ( not ( = ?auto_186874 ?auto_186881 ) ) ( not ( = ?auto_186874 ?auto_186882 ) ) ( not ( = ?auto_186875 ?auto_186876 ) ) ( not ( = ?auto_186875 ?auto_186877 ) ) ( not ( = ?auto_186875 ?auto_186878 ) ) ( not ( = ?auto_186875 ?auto_186879 ) ) ( not ( = ?auto_186875 ?auto_186880 ) ) ( not ( = ?auto_186875 ?auto_186881 ) ) ( not ( = ?auto_186875 ?auto_186882 ) ) ( not ( = ?auto_186876 ?auto_186877 ) ) ( not ( = ?auto_186876 ?auto_186878 ) ) ( not ( = ?auto_186876 ?auto_186879 ) ) ( not ( = ?auto_186876 ?auto_186880 ) ) ( not ( = ?auto_186876 ?auto_186881 ) ) ( not ( = ?auto_186876 ?auto_186882 ) ) ( not ( = ?auto_186877 ?auto_186878 ) ) ( not ( = ?auto_186877 ?auto_186879 ) ) ( not ( = ?auto_186877 ?auto_186880 ) ) ( not ( = ?auto_186877 ?auto_186881 ) ) ( not ( = ?auto_186877 ?auto_186882 ) ) ( not ( = ?auto_186878 ?auto_186879 ) ) ( not ( = ?auto_186878 ?auto_186880 ) ) ( not ( = ?auto_186878 ?auto_186881 ) ) ( not ( = ?auto_186878 ?auto_186882 ) ) ( not ( = ?auto_186879 ?auto_186880 ) ) ( not ( = ?auto_186879 ?auto_186881 ) ) ( not ( = ?auto_186879 ?auto_186882 ) ) ( not ( = ?auto_186880 ?auto_186881 ) ) ( not ( = ?auto_186880 ?auto_186882 ) ) ( not ( = ?auto_186881 ?auto_186882 ) ) ( ON ?auto_186880 ?auto_186881 ) ( ON ?auto_186879 ?auto_186880 ) ( ON ?auto_186878 ?auto_186879 ) ( CLEAR ?auto_186876 ) ( ON ?auto_186877 ?auto_186878 ) ( CLEAR ?auto_186877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186874 ?auto_186875 ?auto_186876 ?auto_186877 )
      ( MAKE-8PILE ?auto_186874 ?auto_186875 ?auto_186876 ?auto_186877 ?auto_186878 ?auto_186879 ?auto_186880 ?auto_186881 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_186891 - BLOCK
      ?auto_186892 - BLOCK
      ?auto_186893 - BLOCK
      ?auto_186894 - BLOCK
      ?auto_186895 - BLOCK
      ?auto_186896 - BLOCK
      ?auto_186897 - BLOCK
      ?auto_186898 - BLOCK
    )
    :vars
    (
      ?auto_186899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186898 ?auto_186899 ) ( ON-TABLE ?auto_186891 ) ( ON ?auto_186892 ?auto_186891 ) ( not ( = ?auto_186891 ?auto_186892 ) ) ( not ( = ?auto_186891 ?auto_186893 ) ) ( not ( = ?auto_186891 ?auto_186894 ) ) ( not ( = ?auto_186891 ?auto_186895 ) ) ( not ( = ?auto_186891 ?auto_186896 ) ) ( not ( = ?auto_186891 ?auto_186897 ) ) ( not ( = ?auto_186891 ?auto_186898 ) ) ( not ( = ?auto_186891 ?auto_186899 ) ) ( not ( = ?auto_186892 ?auto_186893 ) ) ( not ( = ?auto_186892 ?auto_186894 ) ) ( not ( = ?auto_186892 ?auto_186895 ) ) ( not ( = ?auto_186892 ?auto_186896 ) ) ( not ( = ?auto_186892 ?auto_186897 ) ) ( not ( = ?auto_186892 ?auto_186898 ) ) ( not ( = ?auto_186892 ?auto_186899 ) ) ( not ( = ?auto_186893 ?auto_186894 ) ) ( not ( = ?auto_186893 ?auto_186895 ) ) ( not ( = ?auto_186893 ?auto_186896 ) ) ( not ( = ?auto_186893 ?auto_186897 ) ) ( not ( = ?auto_186893 ?auto_186898 ) ) ( not ( = ?auto_186893 ?auto_186899 ) ) ( not ( = ?auto_186894 ?auto_186895 ) ) ( not ( = ?auto_186894 ?auto_186896 ) ) ( not ( = ?auto_186894 ?auto_186897 ) ) ( not ( = ?auto_186894 ?auto_186898 ) ) ( not ( = ?auto_186894 ?auto_186899 ) ) ( not ( = ?auto_186895 ?auto_186896 ) ) ( not ( = ?auto_186895 ?auto_186897 ) ) ( not ( = ?auto_186895 ?auto_186898 ) ) ( not ( = ?auto_186895 ?auto_186899 ) ) ( not ( = ?auto_186896 ?auto_186897 ) ) ( not ( = ?auto_186896 ?auto_186898 ) ) ( not ( = ?auto_186896 ?auto_186899 ) ) ( not ( = ?auto_186897 ?auto_186898 ) ) ( not ( = ?auto_186897 ?auto_186899 ) ) ( not ( = ?auto_186898 ?auto_186899 ) ) ( ON ?auto_186897 ?auto_186898 ) ( ON ?auto_186896 ?auto_186897 ) ( ON ?auto_186895 ?auto_186896 ) ( ON ?auto_186894 ?auto_186895 ) ( CLEAR ?auto_186892 ) ( ON ?auto_186893 ?auto_186894 ) ( CLEAR ?auto_186893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186891 ?auto_186892 ?auto_186893 )
      ( MAKE-8PILE ?auto_186891 ?auto_186892 ?auto_186893 ?auto_186894 ?auto_186895 ?auto_186896 ?auto_186897 ?auto_186898 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_186908 - BLOCK
      ?auto_186909 - BLOCK
      ?auto_186910 - BLOCK
      ?auto_186911 - BLOCK
      ?auto_186912 - BLOCK
      ?auto_186913 - BLOCK
      ?auto_186914 - BLOCK
      ?auto_186915 - BLOCK
    )
    :vars
    (
      ?auto_186916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186915 ?auto_186916 ) ( ON-TABLE ?auto_186908 ) ( ON ?auto_186909 ?auto_186908 ) ( not ( = ?auto_186908 ?auto_186909 ) ) ( not ( = ?auto_186908 ?auto_186910 ) ) ( not ( = ?auto_186908 ?auto_186911 ) ) ( not ( = ?auto_186908 ?auto_186912 ) ) ( not ( = ?auto_186908 ?auto_186913 ) ) ( not ( = ?auto_186908 ?auto_186914 ) ) ( not ( = ?auto_186908 ?auto_186915 ) ) ( not ( = ?auto_186908 ?auto_186916 ) ) ( not ( = ?auto_186909 ?auto_186910 ) ) ( not ( = ?auto_186909 ?auto_186911 ) ) ( not ( = ?auto_186909 ?auto_186912 ) ) ( not ( = ?auto_186909 ?auto_186913 ) ) ( not ( = ?auto_186909 ?auto_186914 ) ) ( not ( = ?auto_186909 ?auto_186915 ) ) ( not ( = ?auto_186909 ?auto_186916 ) ) ( not ( = ?auto_186910 ?auto_186911 ) ) ( not ( = ?auto_186910 ?auto_186912 ) ) ( not ( = ?auto_186910 ?auto_186913 ) ) ( not ( = ?auto_186910 ?auto_186914 ) ) ( not ( = ?auto_186910 ?auto_186915 ) ) ( not ( = ?auto_186910 ?auto_186916 ) ) ( not ( = ?auto_186911 ?auto_186912 ) ) ( not ( = ?auto_186911 ?auto_186913 ) ) ( not ( = ?auto_186911 ?auto_186914 ) ) ( not ( = ?auto_186911 ?auto_186915 ) ) ( not ( = ?auto_186911 ?auto_186916 ) ) ( not ( = ?auto_186912 ?auto_186913 ) ) ( not ( = ?auto_186912 ?auto_186914 ) ) ( not ( = ?auto_186912 ?auto_186915 ) ) ( not ( = ?auto_186912 ?auto_186916 ) ) ( not ( = ?auto_186913 ?auto_186914 ) ) ( not ( = ?auto_186913 ?auto_186915 ) ) ( not ( = ?auto_186913 ?auto_186916 ) ) ( not ( = ?auto_186914 ?auto_186915 ) ) ( not ( = ?auto_186914 ?auto_186916 ) ) ( not ( = ?auto_186915 ?auto_186916 ) ) ( ON ?auto_186914 ?auto_186915 ) ( ON ?auto_186913 ?auto_186914 ) ( ON ?auto_186912 ?auto_186913 ) ( ON ?auto_186911 ?auto_186912 ) ( CLEAR ?auto_186909 ) ( ON ?auto_186910 ?auto_186911 ) ( CLEAR ?auto_186910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186908 ?auto_186909 ?auto_186910 )
      ( MAKE-8PILE ?auto_186908 ?auto_186909 ?auto_186910 ?auto_186911 ?auto_186912 ?auto_186913 ?auto_186914 ?auto_186915 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_186925 - BLOCK
      ?auto_186926 - BLOCK
      ?auto_186927 - BLOCK
      ?auto_186928 - BLOCK
      ?auto_186929 - BLOCK
      ?auto_186930 - BLOCK
      ?auto_186931 - BLOCK
      ?auto_186932 - BLOCK
    )
    :vars
    (
      ?auto_186933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186932 ?auto_186933 ) ( ON-TABLE ?auto_186925 ) ( not ( = ?auto_186925 ?auto_186926 ) ) ( not ( = ?auto_186925 ?auto_186927 ) ) ( not ( = ?auto_186925 ?auto_186928 ) ) ( not ( = ?auto_186925 ?auto_186929 ) ) ( not ( = ?auto_186925 ?auto_186930 ) ) ( not ( = ?auto_186925 ?auto_186931 ) ) ( not ( = ?auto_186925 ?auto_186932 ) ) ( not ( = ?auto_186925 ?auto_186933 ) ) ( not ( = ?auto_186926 ?auto_186927 ) ) ( not ( = ?auto_186926 ?auto_186928 ) ) ( not ( = ?auto_186926 ?auto_186929 ) ) ( not ( = ?auto_186926 ?auto_186930 ) ) ( not ( = ?auto_186926 ?auto_186931 ) ) ( not ( = ?auto_186926 ?auto_186932 ) ) ( not ( = ?auto_186926 ?auto_186933 ) ) ( not ( = ?auto_186927 ?auto_186928 ) ) ( not ( = ?auto_186927 ?auto_186929 ) ) ( not ( = ?auto_186927 ?auto_186930 ) ) ( not ( = ?auto_186927 ?auto_186931 ) ) ( not ( = ?auto_186927 ?auto_186932 ) ) ( not ( = ?auto_186927 ?auto_186933 ) ) ( not ( = ?auto_186928 ?auto_186929 ) ) ( not ( = ?auto_186928 ?auto_186930 ) ) ( not ( = ?auto_186928 ?auto_186931 ) ) ( not ( = ?auto_186928 ?auto_186932 ) ) ( not ( = ?auto_186928 ?auto_186933 ) ) ( not ( = ?auto_186929 ?auto_186930 ) ) ( not ( = ?auto_186929 ?auto_186931 ) ) ( not ( = ?auto_186929 ?auto_186932 ) ) ( not ( = ?auto_186929 ?auto_186933 ) ) ( not ( = ?auto_186930 ?auto_186931 ) ) ( not ( = ?auto_186930 ?auto_186932 ) ) ( not ( = ?auto_186930 ?auto_186933 ) ) ( not ( = ?auto_186931 ?auto_186932 ) ) ( not ( = ?auto_186931 ?auto_186933 ) ) ( not ( = ?auto_186932 ?auto_186933 ) ) ( ON ?auto_186931 ?auto_186932 ) ( ON ?auto_186930 ?auto_186931 ) ( ON ?auto_186929 ?auto_186930 ) ( ON ?auto_186928 ?auto_186929 ) ( ON ?auto_186927 ?auto_186928 ) ( CLEAR ?auto_186925 ) ( ON ?auto_186926 ?auto_186927 ) ( CLEAR ?auto_186926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186925 ?auto_186926 )
      ( MAKE-8PILE ?auto_186925 ?auto_186926 ?auto_186927 ?auto_186928 ?auto_186929 ?auto_186930 ?auto_186931 ?auto_186932 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_186942 - BLOCK
      ?auto_186943 - BLOCK
      ?auto_186944 - BLOCK
      ?auto_186945 - BLOCK
      ?auto_186946 - BLOCK
      ?auto_186947 - BLOCK
      ?auto_186948 - BLOCK
      ?auto_186949 - BLOCK
    )
    :vars
    (
      ?auto_186950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186949 ?auto_186950 ) ( ON-TABLE ?auto_186942 ) ( not ( = ?auto_186942 ?auto_186943 ) ) ( not ( = ?auto_186942 ?auto_186944 ) ) ( not ( = ?auto_186942 ?auto_186945 ) ) ( not ( = ?auto_186942 ?auto_186946 ) ) ( not ( = ?auto_186942 ?auto_186947 ) ) ( not ( = ?auto_186942 ?auto_186948 ) ) ( not ( = ?auto_186942 ?auto_186949 ) ) ( not ( = ?auto_186942 ?auto_186950 ) ) ( not ( = ?auto_186943 ?auto_186944 ) ) ( not ( = ?auto_186943 ?auto_186945 ) ) ( not ( = ?auto_186943 ?auto_186946 ) ) ( not ( = ?auto_186943 ?auto_186947 ) ) ( not ( = ?auto_186943 ?auto_186948 ) ) ( not ( = ?auto_186943 ?auto_186949 ) ) ( not ( = ?auto_186943 ?auto_186950 ) ) ( not ( = ?auto_186944 ?auto_186945 ) ) ( not ( = ?auto_186944 ?auto_186946 ) ) ( not ( = ?auto_186944 ?auto_186947 ) ) ( not ( = ?auto_186944 ?auto_186948 ) ) ( not ( = ?auto_186944 ?auto_186949 ) ) ( not ( = ?auto_186944 ?auto_186950 ) ) ( not ( = ?auto_186945 ?auto_186946 ) ) ( not ( = ?auto_186945 ?auto_186947 ) ) ( not ( = ?auto_186945 ?auto_186948 ) ) ( not ( = ?auto_186945 ?auto_186949 ) ) ( not ( = ?auto_186945 ?auto_186950 ) ) ( not ( = ?auto_186946 ?auto_186947 ) ) ( not ( = ?auto_186946 ?auto_186948 ) ) ( not ( = ?auto_186946 ?auto_186949 ) ) ( not ( = ?auto_186946 ?auto_186950 ) ) ( not ( = ?auto_186947 ?auto_186948 ) ) ( not ( = ?auto_186947 ?auto_186949 ) ) ( not ( = ?auto_186947 ?auto_186950 ) ) ( not ( = ?auto_186948 ?auto_186949 ) ) ( not ( = ?auto_186948 ?auto_186950 ) ) ( not ( = ?auto_186949 ?auto_186950 ) ) ( ON ?auto_186948 ?auto_186949 ) ( ON ?auto_186947 ?auto_186948 ) ( ON ?auto_186946 ?auto_186947 ) ( ON ?auto_186945 ?auto_186946 ) ( ON ?auto_186944 ?auto_186945 ) ( CLEAR ?auto_186942 ) ( ON ?auto_186943 ?auto_186944 ) ( CLEAR ?auto_186943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186942 ?auto_186943 )
      ( MAKE-8PILE ?auto_186942 ?auto_186943 ?auto_186944 ?auto_186945 ?auto_186946 ?auto_186947 ?auto_186948 ?auto_186949 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_186959 - BLOCK
      ?auto_186960 - BLOCK
      ?auto_186961 - BLOCK
      ?auto_186962 - BLOCK
      ?auto_186963 - BLOCK
      ?auto_186964 - BLOCK
      ?auto_186965 - BLOCK
      ?auto_186966 - BLOCK
    )
    :vars
    (
      ?auto_186967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186966 ?auto_186967 ) ( not ( = ?auto_186959 ?auto_186960 ) ) ( not ( = ?auto_186959 ?auto_186961 ) ) ( not ( = ?auto_186959 ?auto_186962 ) ) ( not ( = ?auto_186959 ?auto_186963 ) ) ( not ( = ?auto_186959 ?auto_186964 ) ) ( not ( = ?auto_186959 ?auto_186965 ) ) ( not ( = ?auto_186959 ?auto_186966 ) ) ( not ( = ?auto_186959 ?auto_186967 ) ) ( not ( = ?auto_186960 ?auto_186961 ) ) ( not ( = ?auto_186960 ?auto_186962 ) ) ( not ( = ?auto_186960 ?auto_186963 ) ) ( not ( = ?auto_186960 ?auto_186964 ) ) ( not ( = ?auto_186960 ?auto_186965 ) ) ( not ( = ?auto_186960 ?auto_186966 ) ) ( not ( = ?auto_186960 ?auto_186967 ) ) ( not ( = ?auto_186961 ?auto_186962 ) ) ( not ( = ?auto_186961 ?auto_186963 ) ) ( not ( = ?auto_186961 ?auto_186964 ) ) ( not ( = ?auto_186961 ?auto_186965 ) ) ( not ( = ?auto_186961 ?auto_186966 ) ) ( not ( = ?auto_186961 ?auto_186967 ) ) ( not ( = ?auto_186962 ?auto_186963 ) ) ( not ( = ?auto_186962 ?auto_186964 ) ) ( not ( = ?auto_186962 ?auto_186965 ) ) ( not ( = ?auto_186962 ?auto_186966 ) ) ( not ( = ?auto_186962 ?auto_186967 ) ) ( not ( = ?auto_186963 ?auto_186964 ) ) ( not ( = ?auto_186963 ?auto_186965 ) ) ( not ( = ?auto_186963 ?auto_186966 ) ) ( not ( = ?auto_186963 ?auto_186967 ) ) ( not ( = ?auto_186964 ?auto_186965 ) ) ( not ( = ?auto_186964 ?auto_186966 ) ) ( not ( = ?auto_186964 ?auto_186967 ) ) ( not ( = ?auto_186965 ?auto_186966 ) ) ( not ( = ?auto_186965 ?auto_186967 ) ) ( not ( = ?auto_186966 ?auto_186967 ) ) ( ON ?auto_186965 ?auto_186966 ) ( ON ?auto_186964 ?auto_186965 ) ( ON ?auto_186963 ?auto_186964 ) ( ON ?auto_186962 ?auto_186963 ) ( ON ?auto_186961 ?auto_186962 ) ( ON ?auto_186960 ?auto_186961 ) ( ON ?auto_186959 ?auto_186960 ) ( CLEAR ?auto_186959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186959 )
      ( MAKE-8PILE ?auto_186959 ?auto_186960 ?auto_186961 ?auto_186962 ?auto_186963 ?auto_186964 ?auto_186965 ?auto_186966 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_186976 - BLOCK
      ?auto_186977 - BLOCK
      ?auto_186978 - BLOCK
      ?auto_186979 - BLOCK
      ?auto_186980 - BLOCK
      ?auto_186981 - BLOCK
      ?auto_186982 - BLOCK
      ?auto_186983 - BLOCK
    )
    :vars
    (
      ?auto_186984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186983 ?auto_186984 ) ( not ( = ?auto_186976 ?auto_186977 ) ) ( not ( = ?auto_186976 ?auto_186978 ) ) ( not ( = ?auto_186976 ?auto_186979 ) ) ( not ( = ?auto_186976 ?auto_186980 ) ) ( not ( = ?auto_186976 ?auto_186981 ) ) ( not ( = ?auto_186976 ?auto_186982 ) ) ( not ( = ?auto_186976 ?auto_186983 ) ) ( not ( = ?auto_186976 ?auto_186984 ) ) ( not ( = ?auto_186977 ?auto_186978 ) ) ( not ( = ?auto_186977 ?auto_186979 ) ) ( not ( = ?auto_186977 ?auto_186980 ) ) ( not ( = ?auto_186977 ?auto_186981 ) ) ( not ( = ?auto_186977 ?auto_186982 ) ) ( not ( = ?auto_186977 ?auto_186983 ) ) ( not ( = ?auto_186977 ?auto_186984 ) ) ( not ( = ?auto_186978 ?auto_186979 ) ) ( not ( = ?auto_186978 ?auto_186980 ) ) ( not ( = ?auto_186978 ?auto_186981 ) ) ( not ( = ?auto_186978 ?auto_186982 ) ) ( not ( = ?auto_186978 ?auto_186983 ) ) ( not ( = ?auto_186978 ?auto_186984 ) ) ( not ( = ?auto_186979 ?auto_186980 ) ) ( not ( = ?auto_186979 ?auto_186981 ) ) ( not ( = ?auto_186979 ?auto_186982 ) ) ( not ( = ?auto_186979 ?auto_186983 ) ) ( not ( = ?auto_186979 ?auto_186984 ) ) ( not ( = ?auto_186980 ?auto_186981 ) ) ( not ( = ?auto_186980 ?auto_186982 ) ) ( not ( = ?auto_186980 ?auto_186983 ) ) ( not ( = ?auto_186980 ?auto_186984 ) ) ( not ( = ?auto_186981 ?auto_186982 ) ) ( not ( = ?auto_186981 ?auto_186983 ) ) ( not ( = ?auto_186981 ?auto_186984 ) ) ( not ( = ?auto_186982 ?auto_186983 ) ) ( not ( = ?auto_186982 ?auto_186984 ) ) ( not ( = ?auto_186983 ?auto_186984 ) ) ( ON ?auto_186982 ?auto_186983 ) ( ON ?auto_186981 ?auto_186982 ) ( ON ?auto_186980 ?auto_186981 ) ( ON ?auto_186979 ?auto_186980 ) ( ON ?auto_186978 ?auto_186979 ) ( ON ?auto_186977 ?auto_186978 ) ( ON ?auto_186976 ?auto_186977 ) ( CLEAR ?auto_186976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186976 )
      ( MAKE-8PILE ?auto_186976 ?auto_186977 ?auto_186978 ?auto_186979 ?auto_186980 ?auto_186981 ?auto_186982 ?auto_186983 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_186994 - BLOCK
      ?auto_186995 - BLOCK
      ?auto_186996 - BLOCK
      ?auto_186997 - BLOCK
      ?auto_186998 - BLOCK
      ?auto_186999 - BLOCK
      ?auto_187000 - BLOCK
      ?auto_187001 - BLOCK
      ?auto_187002 - BLOCK
    )
    :vars
    (
      ?auto_187003 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_187001 ) ( ON ?auto_187002 ?auto_187003 ) ( CLEAR ?auto_187002 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186994 ) ( ON ?auto_186995 ?auto_186994 ) ( ON ?auto_186996 ?auto_186995 ) ( ON ?auto_186997 ?auto_186996 ) ( ON ?auto_186998 ?auto_186997 ) ( ON ?auto_186999 ?auto_186998 ) ( ON ?auto_187000 ?auto_186999 ) ( ON ?auto_187001 ?auto_187000 ) ( not ( = ?auto_186994 ?auto_186995 ) ) ( not ( = ?auto_186994 ?auto_186996 ) ) ( not ( = ?auto_186994 ?auto_186997 ) ) ( not ( = ?auto_186994 ?auto_186998 ) ) ( not ( = ?auto_186994 ?auto_186999 ) ) ( not ( = ?auto_186994 ?auto_187000 ) ) ( not ( = ?auto_186994 ?auto_187001 ) ) ( not ( = ?auto_186994 ?auto_187002 ) ) ( not ( = ?auto_186994 ?auto_187003 ) ) ( not ( = ?auto_186995 ?auto_186996 ) ) ( not ( = ?auto_186995 ?auto_186997 ) ) ( not ( = ?auto_186995 ?auto_186998 ) ) ( not ( = ?auto_186995 ?auto_186999 ) ) ( not ( = ?auto_186995 ?auto_187000 ) ) ( not ( = ?auto_186995 ?auto_187001 ) ) ( not ( = ?auto_186995 ?auto_187002 ) ) ( not ( = ?auto_186995 ?auto_187003 ) ) ( not ( = ?auto_186996 ?auto_186997 ) ) ( not ( = ?auto_186996 ?auto_186998 ) ) ( not ( = ?auto_186996 ?auto_186999 ) ) ( not ( = ?auto_186996 ?auto_187000 ) ) ( not ( = ?auto_186996 ?auto_187001 ) ) ( not ( = ?auto_186996 ?auto_187002 ) ) ( not ( = ?auto_186996 ?auto_187003 ) ) ( not ( = ?auto_186997 ?auto_186998 ) ) ( not ( = ?auto_186997 ?auto_186999 ) ) ( not ( = ?auto_186997 ?auto_187000 ) ) ( not ( = ?auto_186997 ?auto_187001 ) ) ( not ( = ?auto_186997 ?auto_187002 ) ) ( not ( = ?auto_186997 ?auto_187003 ) ) ( not ( = ?auto_186998 ?auto_186999 ) ) ( not ( = ?auto_186998 ?auto_187000 ) ) ( not ( = ?auto_186998 ?auto_187001 ) ) ( not ( = ?auto_186998 ?auto_187002 ) ) ( not ( = ?auto_186998 ?auto_187003 ) ) ( not ( = ?auto_186999 ?auto_187000 ) ) ( not ( = ?auto_186999 ?auto_187001 ) ) ( not ( = ?auto_186999 ?auto_187002 ) ) ( not ( = ?auto_186999 ?auto_187003 ) ) ( not ( = ?auto_187000 ?auto_187001 ) ) ( not ( = ?auto_187000 ?auto_187002 ) ) ( not ( = ?auto_187000 ?auto_187003 ) ) ( not ( = ?auto_187001 ?auto_187002 ) ) ( not ( = ?auto_187001 ?auto_187003 ) ) ( not ( = ?auto_187002 ?auto_187003 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_187002 ?auto_187003 )
      ( !STACK ?auto_187002 ?auto_187001 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_187013 - BLOCK
      ?auto_187014 - BLOCK
      ?auto_187015 - BLOCK
      ?auto_187016 - BLOCK
      ?auto_187017 - BLOCK
      ?auto_187018 - BLOCK
      ?auto_187019 - BLOCK
      ?auto_187020 - BLOCK
      ?auto_187021 - BLOCK
    )
    :vars
    (
      ?auto_187022 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_187020 ) ( ON ?auto_187021 ?auto_187022 ) ( CLEAR ?auto_187021 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_187013 ) ( ON ?auto_187014 ?auto_187013 ) ( ON ?auto_187015 ?auto_187014 ) ( ON ?auto_187016 ?auto_187015 ) ( ON ?auto_187017 ?auto_187016 ) ( ON ?auto_187018 ?auto_187017 ) ( ON ?auto_187019 ?auto_187018 ) ( ON ?auto_187020 ?auto_187019 ) ( not ( = ?auto_187013 ?auto_187014 ) ) ( not ( = ?auto_187013 ?auto_187015 ) ) ( not ( = ?auto_187013 ?auto_187016 ) ) ( not ( = ?auto_187013 ?auto_187017 ) ) ( not ( = ?auto_187013 ?auto_187018 ) ) ( not ( = ?auto_187013 ?auto_187019 ) ) ( not ( = ?auto_187013 ?auto_187020 ) ) ( not ( = ?auto_187013 ?auto_187021 ) ) ( not ( = ?auto_187013 ?auto_187022 ) ) ( not ( = ?auto_187014 ?auto_187015 ) ) ( not ( = ?auto_187014 ?auto_187016 ) ) ( not ( = ?auto_187014 ?auto_187017 ) ) ( not ( = ?auto_187014 ?auto_187018 ) ) ( not ( = ?auto_187014 ?auto_187019 ) ) ( not ( = ?auto_187014 ?auto_187020 ) ) ( not ( = ?auto_187014 ?auto_187021 ) ) ( not ( = ?auto_187014 ?auto_187022 ) ) ( not ( = ?auto_187015 ?auto_187016 ) ) ( not ( = ?auto_187015 ?auto_187017 ) ) ( not ( = ?auto_187015 ?auto_187018 ) ) ( not ( = ?auto_187015 ?auto_187019 ) ) ( not ( = ?auto_187015 ?auto_187020 ) ) ( not ( = ?auto_187015 ?auto_187021 ) ) ( not ( = ?auto_187015 ?auto_187022 ) ) ( not ( = ?auto_187016 ?auto_187017 ) ) ( not ( = ?auto_187016 ?auto_187018 ) ) ( not ( = ?auto_187016 ?auto_187019 ) ) ( not ( = ?auto_187016 ?auto_187020 ) ) ( not ( = ?auto_187016 ?auto_187021 ) ) ( not ( = ?auto_187016 ?auto_187022 ) ) ( not ( = ?auto_187017 ?auto_187018 ) ) ( not ( = ?auto_187017 ?auto_187019 ) ) ( not ( = ?auto_187017 ?auto_187020 ) ) ( not ( = ?auto_187017 ?auto_187021 ) ) ( not ( = ?auto_187017 ?auto_187022 ) ) ( not ( = ?auto_187018 ?auto_187019 ) ) ( not ( = ?auto_187018 ?auto_187020 ) ) ( not ( = ?auto_187018 ?auto_187021 ) ) ( not ( = ?auto_187018 ?auto_187022 ) ) ( not ( = ?auto_187019 ?auto_187020 ) ) ( not ( = ?auto_187019 ?auto_187021 ) ) ( not ( = ?auto_187019 ?auto_187022 ) ) ( not ( = ?auto_187020 ?auto_187021 ) ) ( not ( = ?auto_187020 ?auto_187022 ) ) ( not ( = ?auto_187021 ?auto_187022 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_187021 ?auto_187022 )
      ( !STACK ?auto_187021 ?auto_187020 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_187032 - BLOCK
      ?auto_187033 - BLOCK
      ?auto_187034 - BLOCK
      ?auto_187035 - BLOCK
      ?auto_187036 - BLOCK
      ?auto_187037 - BLOCK
      ?auto_187038 - BLOCK
      ?auto_187039 - BLOCK
      ?auto_187040 - BLOCK
    )
    :vars
    (
      ?auto_187041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187040 ?auto_187041 ) ( ON-TABLE ?auto_187032 ) ( ON ?auto_187033 ?auto_187032 ) ( ON ?auto_187034 ?auto_187033 ) ( ON ?auto_187035 ?auto_187034 ) ( ON ?auto_187036 ?auto_187035 ) ( ON ?auto_187037 ?auto_187036 ) ( ON ?auto_187038 ?auto_187037 ) ( not ( = ?auto_187032 ?auto_187033 ) ) ( not ( = ?auto_187032 ?auto_187034 ) ) ( not ( = ?auto_187032 ?auto_187035 ) ) ( not ( = ?auto_187032 ?auto_187036 ) ) ( not ( = ?auto_187032 ?auto_187037 ) ) ( not ( = ?auto_187032 ?auto_187038 ) ) ( not ( = ?auto_187032 ?auto_187039 ) ) ( not ( = ?auto_187032 ?auto_187040 ) ) ( not ( = ?auto_187032 ?auto_187041 ) ) ( not ( = ?auto_187033 ?auto_187034 ) ) ( not ( = ?auto_187033 ?auto_187035 ) ) ( not ( = ?auto_187033 ?auto_187036 ) ) ( not ( = ?auto_187033 ?auto_187037 ) ) ( not ( = ?auto_187033 ?auto_187038 ) ) ( not ( = ?auto_187033 ?auto_187039 ) ) ( not ( = ?auto_187033 ?auto_187040 ) ) ( not ( = ?auto_187033 ?auto_187041 ) ) ( not ( = ?auto_187034 ?auto_187035 ) ) ( not ( = ?auto_187034 ?auto_187036 ) ) ( not ( = ?auto_187034 ?auto_187037 ) ) ( not ( = ?auto_187034 ?auto_187038 ) ) ( not ( = ?auto_187034 ?auto_187039 ) ) ( not ( = ?auto_187034 ?auto_187040 ) ) ( not ( = ?auto_187034 ?auto_187041 ) ) ( not ( = ?auto_187035 ?auto_187036 ) ) ( not ( = ?auto_187035 ?auto_187037 ) ) ( not ( = ?auto_187035 ?auto_187038 ) ) ( not ( = ?auto_187035 ?auto_187039 ) ) ( not ( = ?auto_187035 ?auto_187040 ) ) ( not ( = ?auto_187035 ?auto_187041 ) ) ( not ( = ?auto_187036 ?auto_187037 ) ) ( not ( = ?auto_187036 ?auto_187038 ) ) ( not ( = ?auto_187036 ?auto_187039 ) ) ( not ( = ?auto_187036 ?auto_187040 ) ) ( not ( = ?auto_187036 ?auto_187041 ) ) ( not ( = ?auto_187037 ?auto_187038 ) ) ( not ( = ?auto_187037 ?auto_187039 ) ) ( not ( = ?auto_187037 ?auto_187040 ) ) ( not ( = ?auto_187037 ?auto_187041 ) ) ( not ( = ?auto_187038 ?auto_187039 ) ) ( not ( = ?auto_187038 ?auto_187040 ) ) ( not ( = ?auto_187038 ?auto_187041 ) ) ( not ( = ?auto_187039 ?auto_187040 ) ) ( not ( = ?auto_187039 ?auto_187041 ) ) ( not ( = ?auto_187040 ?auto_187041 ) ) ( CLEAR ?auto_187038 ) ( ON ?auto_187039 ?auto_187040 ) ( CLEAR ?auto_187039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_187032 ?auto_187033 ?auto_187034 ?auto_187035 ?auto_187036 ?auto_187037 ?auto_187038 ?auto_187039 )
      ( MAKE-9PILE ?auto_187032 ?auto_187033 ?auto_187034 ?auto_187035 ?auto_187036 ?auto_187037 ?auto_187038 ?auto_187039 ?auto_187040 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_187051 - BLOCK
      ?auto_187052 - BLOCK
      ?auto_187053 - BLOCK
      ?auto_187054 - BLOCK
      ?auto_187055 - BLOCK
      ?auto_187056 - BLOCK
      ?auto_187057 - BLOCK
      ?auto_187058 - BLOCK
      ?auto_187059 - BLOCK
    )
    :vars
    (
      ?auto_187060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187059 ?auto_187060 ) ( ON-TABLE ?auto_187051 ) ( ON ?auto_187052 ?auto_187051 ) ( ON ?auto_187053 ?auto_187052 ) ( ON ?auto_187054 ?auto_187053 ) ( ON ?auto_187055 ?auto_187054 ) ( ON ?auto_187056 ?auto_187055 ) ( ON ?auto_187057 ?auto_187056 ) ( not ( = ?auto_187051 ?auto_187052 ) ) ( not ( = ?auto_187051 ?auto_187053 ) ) ( not ( = ?auto_187051 ?auto_187054 ) ) ( not ( = ?auto_187051 ?auto_187055 ) ) ( not ( = ?auto_187051 ?auto_187056 ) ) ( not ( = ?auto_187051 ?auto_187057 ) ) ( not ( = ?auto_187051 ?auto_187058 ) ) ( not ( = ?auto_187051 ?auto_187059 ) ) ( not ( = ?auto_187051 ?auto_187060 ) ) ( not ( = ?auto_187052 ?auto_187053 ) ) ( not ( = ?auto_187052 ?auto_187054 ) ) ( not ( = ?auto_187052 ?auto_187055 ) ) ( not ( = ?auto_187052 ?auto_187056 ) ) ( not ( = ?auto_187052 ?auto_187057 ) ) ( not ( = ?auto_187052 ?auto_187058 ) ) ( not ( = ?auto_187052 ?auto_187059 ) ) ( not ( = ?auto_187052 ?auto_187060 ) ) ( not ( = ?auto_187053 ?auto_187054 ) ) ( not ( = ?auto_187053 ?auto_187055 ) ) ( not ( = ?auto_187053 ?auto_187056 ) ) ( not ( = ?auto_187053 ?auto_187057 ) ) ( not ( = ?auto_187053 ?auto_187058 ) ) ( not ( = ?auto_187053 ?auto_187059 ) ) ( not ( = ?auto_187053 ?auto_187060 ) ) ( not ( = ?auto_187054 ?auto_187055 ) ) ( not ( = ?auto_187054 ?auto_187056 ) ) ( not ( = ?auto_187054 ?auto_187057 ) ) ( not ( = ?auto_187054 ?auto_187058 ) ) ( not ( = ?auto_187054 ?auto_187059 ) ) ( not ( = ?auto_187054 ?auto_187060 ) ) ( not ( = ?auto_187055 ?auto_187056 ) ) ( not ( = ?auto_187055 ?auto_187057 ) ) ( not ( = ?auto_187055 ?auto_187058 ) ) ( not ( = ?auto_187055 ?auto_187059 ) ) ( not ( = ?auto_187055 ?auto_187060 ) ) ( not ( = ?auto_187056 ?auto_187057 ) ) ( not ( = ?auto_187056 ?auto_187058 ) ) ( not ( = ?auto_187056 ?auto_187059 ) ) ( not ( = ?auto_187056 ?auto_187060 ) ) ( not ( = ?auto_187057 ?auto_187058 ) ) ( not ( = ?auto_187057 ?auto_187059 ) ) ( not ( = ?auto_187057 ?auto_187060 ) ) ( not ( = ?auto_187058 ?auto_187059 ) ) ( not ( = ?auto_187058 ?auto_187060 ) ) ( not ( = ?auto_187059 ?auto_187060 ) ) ( CLEAR ?auto_187057 ) ( ON ?auto_187058 ?auto_187059 ) ( CLEAR ?auto_187058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_187051 ?auto_187052 ?auto_187053 ?auto_187054 ?auto_187055 ?auto_187056 ?auto_187057 ?auto_187058 )
      ( MAKE-9PILE ?auto_187051 ?auto_187052 ?auto_187053 ?auto_187054 ?auto_187055 ?auto_187056 ?auto_187057 ?auto_187058 ?auto_187059 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_187070 - BLOCK
      ?auto_187071 - BLOCK
      ?auto_187072 - BLOCK
      ?auto_187073 - BLOCK
      ?auto_187074 - BLOCK
      ?auto_187075 - BLOCK
      ?auto_187076 - BLOCK
      ?auto_187077 - BLOCK
      ?auto_187078 - BLOCK
    )
    :vars
    (
      ?auto_187079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187078 ?auto_187079 ) ( ON-TABLE ?auto_187070 ) ( ON ?auto_187071 ?auto_187070 ) ( ON ?auto_187072 ?auto_187071 ) ( ON ?auto_187073 ?auto_187072 ) ( ON ?auto_187074 ?auto_187073 ) ( ON ?auto_187075 ?auto_187074 ) ( not ( = ?auto_187070 ?auto_187071 ) ) ( not ( = ?auto_187070 ?auto_187072 ) ) ( not ( = ?auto_187070 ?auto_187073 ) ) ( not ( = ?auto_187070 ?auto_187074 ) ) ( not ( = ?auto_187070 ?auto_187075 ) ) ( not ( = ?auto_187070 ?auto_187076 ) ) ( not ( = ?auto_187070 ?auto_187077 ) ) ( not ( = ?auto_187070 ?auto_187078 ) ) ( not ( = ?auto_187070 ?auto_187079 ) ) ( not ( = ?auto_187071 ?auto_187072 ) ) ( not ( = ?auto_187071 ?auto_187073 ) ) ( not ( = ?auto_187071 ?auto_187074 ) ) ( not ( = ?auto_187071 ?auto_187075 ) ) ( not ( = ?auto_187071 ?auto_187076 ) ) ( not ( = ?auto_187071 ?auto_187077 ) ) ( not ( = ?auto_187071 ?auto_187078 ) ) ( not ( = ?auto_187071 ?auto_187079 ) ) ( not ( = ?auto_187072 ?auto_187073 ) ) ( not ( = ?auto_187072 ?auto_187074 ) ) ( not ( = ?auto_187072 ?auto_187075 ) ) ( not ( = ?auto_187072 ?auto_187076 ) ) ( not ( = ?auto_187072 ?auto_187077 ) ) ( not ( = ?auto_187072 ?auto_187078 ) ) ( not ( = ?auto_187072 ?auto_187079 ) ) ( not ( = ?auto_187073 ?auto_187074 ) ) ( not ( = ?auto_187073 ?auto_187075 ) ) ( not ( = ?auto_187073 ?auto_187076 ) ) ( not ( = ?auto_187073 ?auto_187077 ) ) ( not ( = ?auto_187073 ?auto_187078 ) ) ( not ( = ?auto_187073 ?auto_187079 ) ) ( not ( = ?auto_187074 ?auto_187075 ) ) ( not ( = ?auto_187074 ?auto_187076 ) ) ( not ( = ?auto_187074 ?auto_187077 ) ) ( not ( = ?auto_187074 ?auto_187078 ) ) ( not ( = ?auto_187074 ?auto_187079 ) ) ( not ( = ?auto_187075 ?auto_187076 ) ) ( not ( = ?auto_187075 ?auto_187077 ) ) ( not ( = ?auto_187075 ?auto_187078 ) ) ( not ( = ?auto_187075 ?auto_187079 ) ) ( not ( = ?auto_187076 ?auto_187077 ) ) ( not ( = ?auto_187076 ?auto_187078 ) ) ( not ( = ?auto_187076 ?auto_187079 ) ) ( not ( = ?auto_187077 ?auto_187078 ) ) ( not ( = ?auto_187077 ?auto_187079 ) ) ( not ( = ?auto_187078 ?auto_187079 ) ) ( ON ?auto_187077 ?auto_187078 ) ( CLEAR ?auto_187075 ) ( ON ?auto_187076 ?auto_187077 ) ( CLEAR ?auto_187076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187070 ?auto_187071 ?auto_187072 ?auto_187073 ?auto_187074 ?auto_187075 ?auto_187076 )
      ( MAKE-9PILE ?auto_187070 ?auto_187071 ?auto_187072 ?auto_187073 ?auto_187074 ?auto_187075 ?auto_187076 ?auto_187077 ?auto_187078 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_187089 - BLOCK
      ?auto_187090 - BLOCK
      ?auto_187091 - BLOCK
      ?auto_187092 - BLOCK
      ?auto_187093 - BLOCK
      ?auto_187094 - BLOCK
      ?auto_187095 - BLOCK
      ?auto_187096 - BLOCK
      ?auto_187097 - BLOCK
    )
    :vars
    (
      ?auto_187098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187097 ?auto_187098 ) ( ON-TABLE ?auto_187089 ) ( ON ?auto_187090 ?auto_187089 ) ( ON ?auto_187091 ?auto_187090 ) ( ON ?auto_187092 ?auto_187091 ) ( ON ?auto_187093 ?auto_187092 ) ( ON ?auto_187094 ?auto_187093 ) ( not ( = ?auto_187089 ?auto_187090 ) ) ( not ( = ?auto_187089 ?auto_187091 ) ) ( not ( = ?auto_187089 ?auto_187092 ) ) ( not ( = ?auto_187089 ?auto_187093 ) ) ( not ( = ?auto_187089 ?auto_187094 ) ) ( not ( = ?auto_187089 ?auto_187095 ) ) ( not ( = ?auto_187089 ?auto_187096 ) ) ( not ( = ?auto_187089 ?auto_187097 ) ) ( not ( = ?auto_187089 ?auto_187098 ) ) ( not ( = ?auto_187090 ?auto_187091 ) ) ( not ( = ?auto_187090 ?auto_187092 ) ) ( not ( = ?auto_187090 ?auto_187093 ) ) ( not ( = ?auto_187090 ?auto_187094 ) ) ( not ( = ?auto_187090 ?auto_187095 ) ) ( not ( = ?auto_187090 ?auto_187096 ) ) ( not ( = ?auto_187090 ?auto_187097 ) ) ( not ( = ?auto_187090 ?auto_187098 ) ) ( not ( = ?auto_187091 ?auto_187092 ) ) ( not ( = ?auto_187091 ?auto_187093 ) ) ( not ( = ?auto_187091 ?auto_187094 ) ) ( not ( = ?auto_187091 ?auto_187095 ) ) ( not ( = ?auto_187091 ?auto_187096 ) ) ( not ( = ?auto_187091 ?auto_187097 ) ) ( not ( = ?auto_187091 ?auto_187098 ) ) ( not ( = ?auto_187092 ?auto_187093 ) ) ( not ( = ?auto_187092 ?auto_187094 ) ) ( not ( = ?auto_187092 ?auto_187095 ) ) ( not ( = ?auto_187092 ?auto_187096 ) ) ( not ( = ?auto_187092 ?auto_187097 ) ) ( not ( = ?auto_187092 ?auto_187098 ) ) ( not ( = ?auto_187093 ?auto_187094 ) ) ( not ( = ?auto_187093 ?auto_187095 ) ) ( not ( = ?auto_187093 ?auto_187096 ) ) ( not ( = ?auto_187093 ?auto_187097 ) ) ( not ( = ?auto_187093 ?auto_187098 ) ) ( not ( = ?auto_187094 ?auto_187095 ) ) ( not ( = ?auto_187094 ?auto_187096 ) ) ( not ( = ?auto_187094 ?auto_187097 ) ) ( not ( = ?auto_187094 ?auto_187098 ) ) ( not ( = ?auto_187095 ?auto_187096 ) ) ( not ( = ?auto_187095 ?auto_187097 ) ) ( not ( = ?auto_187095 ?auto_187098 ) ) ( not ( = ?auto_187096 ?auto_187097 ) ) ( not ( = ?auto_187096 ?auto_187098 ) ) ( not ( = ?auto_187097 ?auto_187098 ) ) ( ON ?auto_187096 ?auto_187097 ) ( CLEAR ?auto_187094 ) ( ON ?auto_187095 ?auto_187096 ) ( CLEAR ?auto_187095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187089 ?auto_187090 ?auto_187091 ?auto_187092 ?auto_187093 ?auto_187094 ?auto_187095 )
      ( MAKE-9PILE ?auto_187089 ?auto_187090 ?auto_187091 ?auto_187092 ?auto_187093 ?auto_187094 ?auto_187095 ?auto_187096 ?auto_187097 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_187108 - BLOCK
      ?auto_187109 - BLOCK
      ?auto_187110 - BLOCK
      ?auto_187111 - BLOCK
      ?auto_187112 - BLOCK
      ?auto_187113 - BLOCK
      ?auto_187114 - BLOCK
      ?auto_187115 - BLOCK
      ?auto_187116 - BLOCK
    )
    :vars
    (
      ?auto_187117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187116 ?auto_187117 ) ( ON-TABLE ?auto_187108 ) ( ON ?auto_187109 ?auto_187108 ) ( ON ?auto_187110 ?auto_187109 ) ( ON ?auto_187111 ?auto_187110 ) ( ON ?auto_187112 ?auto_187111 ) ( not ( = ?auto_187108 ?auto_187109 ) ) ( not ( = ?auto_187108 ?auto_187110 ) ) ( not ( = ?auto_187108 ?auto_187111 ) ) ( not ( = ?auto_187108 ?auto_187112 ) ) ( not ( = ?auto_187108 ?auto_187113 ) ) ( not ( = ?auto_187108 ?auto_187114 ) ) ( not ( = ?auto_187108 ?auto_187115 ) ) ( not ( = ?auto_187108 ?auto_187116 ) ) ( not ( = ?auto_187108 ?auto_187117 ) ) ( not ( = ?auto_187109 ?auto_187110 ) ) ( not ( = ?auto_187109 ?auto_187111 ) ) ( not ( = ?auto_187109 ?auto_187112 ) ) ( not ( = ?auto_187109 ?auto_187113 ) ) ( not ( = ?auto_187109 ?auto_187114 ) ) ( not ( = ?auto_187109 ?auto_187115 ) ) ( not ( = ?auto_187109 ?auto_187116 ) ) ( not ( = ?auto_187109 ?auto_187117 ) ) ( not ( = ?auto_187110 ?auto_187111 ) ) ( not ( = ?auto_187110 ?auto_187112 ) ) ( not ( = ?auto_187110 ?auto_187113 ) ) ( not ( = ?auto_187110 ?auto_187114 ) ) ( not ( = ?auto_187110 ?auto_187115 ) ) ( not ( = ?auto_187110 ?auto_187116 ) ) ( not ( = ?auto_187110 ?auto_187117 ) ) ( not ( = ?auto_187111 ?auto_187112 ) ) ( not ( = ?auto_187111 ?auto_187113 ) ) ( not ( = ?auto_187111 ?auto_187114 ) ) ( not ( = ?auto_187111 ?auto_187115 ) ) ( not ( = ?auto_187111 ?auto_187116 ) ) ( not ( = ?auto_187111 ?auto_187117 ) ) ( not ( = ?auto_187112 ?auto_187113 ) ) ( not ( = ?auto_187112 ?auto_187114 ) ) ( not ( = ?auto_187112 ?auto_187115 ) ) ( not ( = ?auto_187112 ?auto_187116 ) ) ( not ( = ?auto_187112 ?auto_187117 ) ) ( not ( = ?auto_187113 ?auto_187114 ) ) ( not ( = ?auto_187113 ?auto_187115 ) ) ( not ( = ?auto_187113 ?auto_187116 ) ) ( not ( = ?auto_187113 ?auto_187117 ) ) ( not ( = ?auto_187114 ?auto_187115 ) ) ( not ( = ?auto_187114 ?auto_187116 ) ) ( not ( = ?auto_187114 ?auto_187117 ) ) ( not ( = ?auto_187115 ?auto_187116 ) ) ( not ( = ?auto_187115 ?auto_187117 ) ) ( not ( = ?auto_187116 ?auto_187117 ) ) ( ON ?auto_187115 ?auto_187116 ) ( ON ?auto_187114 ?auto_187115 ) ( CLEAR ?auto_187112 ) ( ON ?auto_187113 ?auto_187114 ) ( CLEAR ?auto_187113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187108 ?auto_187109 ?auto_187110 ?auto_187111 ?auto_187112 ?auto_187113 )
      ( MAKE-9PILE ?auto_187108 ?auto_187109 ?auto_187110 ?auto_187111 ?auto_187112 ?auto_187113 ?auto_187114 ?auto_187115 ?auto_187116 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_187127 - BLOCK
      ?auto_187128 - BLOCK
      ?auto_187129 - BLOCK
      ?auto_187130 - BLOCK
      ?auto_187131 - BLOCK
      ?auto_187132 - BLOCK
      ?auto_187133 - BLOCK
      ?auto_187134 - BLOCK
      ?auto_187135 - BLOCK
    )
    :vars
    (
      ?auto_187136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187135 ?auto_187136 ) ( ON-TABLE ?auto_187127 ) ( ON ?auto_187128 ?auto_187127 ) ( ON ?auto_187129 ?auto_187128 ) ( ON ?auto_187130 ?auto_187129 ) ( ON ?auto_187131 ?auto_187130 ) ( not ( = ?auto_187127 ?auto_187128 ) ) ( not ( = ?auto_187127 ?auto_187129 ) ) ( not ( = ?auto_187127 ?auto_187130 ) ) ( not ( = ?auto_187127 ?auto_187131 ) ) ( not ( = ?auto_187127 ?auto_187132 ) ) ( not ( = ?auto_187127 ?auto_187133 ) ) ( not ( = ?auto_187127 ?auto_187134 ) ) ( not ( = ?auto_187127 ?auto_187135 ) ) ( not ( = ?auto_187127 ?auto_187136 ) ) ( not ( = ?auto_187128 ?auto_187129 ) ) ( not ( = ?auto_187128 ?auto_187130 ) ) ( not ( = ?auto_187128 ?auto_187131 ) ) ( not ( = ?auto_187128 ?auto_187132 ) ) ( not ( = ?auto_187128 ?auto_187133 ) ) ( not ( = ?auto_187128 ?auto_187134 ) ) ( not ( = ?auto_187128 ?auto_187135 ) ) ( not ( = ?auto_187128 ?auto_187136 ) ) ( not ( = ?auto_187129 ?auto_187130 ) ) ( not ( = ?auto_187129 ?auto_187131 ) ) ( not ( = ?auto_187129 ?auto_187132 ) ) ( not ( = ?auto_187129 ?auto_187133 ) ) ( not ( = ?auto_187129 ?auto_187134 ) ) ( not ( = ?auto_187129 ?auto_187135 ) ) ( not ( = ?auto_187129 ?auto_187136 ) ) ( not ( = ?auto_187130 ?auto_187131 ) ) ( not ( = ?auto_187130 ?auto_187132 ) ) ( not ( = ?auto_187130 ?auto_187133 ) ) ( not ( = ?auto_187130 ?auto_187134 ) ) ( not ( = ?auto_187130 ?auto_187135 ) ) ( not ( = ?auto_187130 ?auto_187136 ) ) ( not ( = ?auto_187131 ?auto_187132 ) ) ( not ( = ?auto_187131 ?auto_187133 ) ) ( not ( = ?auto_187131 ?auto_187134 ) ) ( not ( = ?auto_187131 ?auto_187135 ) ) ( not ( = ?auto_187131 ?auto_187136 ) ) ( not ( = ?auto_187132 ?auto_187133 ) ) ( not ( = ?auto_187132 ?auto_187134 ) ) ( not ( = ?auto_187132 ?auto_187135 ) ) ( not ( = ?auto_187132 ?auto_187136 ) ) ( not ( = ?auto_187133 ?auto_187134 ) ) ( not ( = ?auto_187133 ?auto_187135 ) ) ( not ( = ?auto_187133 ?auto_187136 ) ) ( not ( = ?auto_187134 ?auto_187135 ) ) ( not ( = ?auto_187134 ?auto_187136 ) ) ( not ( = ?auto_187135 ?auto_187136 ) ) ( ON ?auto_187134 ?auto_187135 ) ( ON ?auto_187133 ?auto_187134 ) ( CLEAR ?auto_187131 ) ( ON ?auto_187132 ?auto_187133 ) ( CLEAR ?auto_187132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187127 ?auto_187128 ?auto_187129 ?auto_187130 ?auto_187131 ?auto_187132 )
      ( MAKE-9PILE ?auto_187127 ?auto_187128 ?auto_187129 ?auto_187130 ?auto_187131 ?auto_187132 ?auto_187133 ?auto_187134 ?auto_187135 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_187146 - BLOCK
      ?auto_187147 - BLOCK
      ?auto_187148 - BLOCK
      ?auto_187149 - BLOCK
      ?auto_187150 - BLOCK
      ?auto_187151 - BLOCK
      ?auto_187152 - BLOCK
      ?auto_187153 - BLOCK
      ?auto_187154 - BLOCK
    )
    :vars
    (
      ?auto_187155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187154 ?auto_187155 ) ( ON-TABLE ?auto_187146 ) ( ON ?auto_187147 ?auto_187146 ) ( ON ?auto_187148 ?auto_187147 ) ( ON ?auto_187149 ?auto_187148 ) ( not ( = ?auto_187146 ?auto_187147 ) ) ( not ( = ?auto_187146 ?auto_187148 ) ) ( not ( = ?auto_187146 ?auto_187149 ) ) ( not ( = ?auto_187146 ?auto_187150 ) ) ( not ( = ?auto_187146 ?auto_187151 ) ) ( not ( = ?auto_187146 ?auto_187152 ) ) ( not ( = ?auto_187146 ?auto_187153 ) ) ( not ( = ?auto_187146 ?auto_187154 ) ) ( not ( = ?auto_187146 ?auto_187155 ) ) ( not ( = ?auto_187147 ?auto_187148 ) ) ( not ( = ?auto_187147 ?auto_187149 ) ) ( not ( = ?auto_187147 ?auto_187150 ) ) ( not ( = ?auto_187147 ?auto_187151 ) ) ( not ( = ?auto_187147 ?auto_187152 ) ) ( not ( = ?auto_187147 ?auto_187153 ) ) ( not ( = ?auto_187147 ?auto_187154 ) ) ( not ( = ?auto_187147 ?auto_187155 ) ) ( not ( = ?auto_187148 ?auto_187149 ) ) ( not ( = ?auto_187148 ?auto_187150 ) ) ( not ( = ?auto_187148 ?auto_187151 ) ) ( not ( = ?auto_187148 ?auto_187152 ) ) ( not ( = ?auto_187148 ?auto_187153 ) ) ( not ( = ?auto_187148 ?auto_187154 ) ) ( not ( = ?auto_187148 ?auto_187155 ) ) ( not ( = ?auto_187149 ?auto_187150 ) ) ( not ( = ?auto_187149 ?auto_187151 ) ) ( not ( = ?auto_187149 ?auto_187152 ) ) ( not ( = ?auto_187149 ?auto_187153 ) ) ( not ( = ?auto_187149 ?auto_187154 ) ) ( not ( = ?auto_187149 ?auto_187155 ) ) ( not ( = ?auto_187150 ?auto_187151 ) ) ( not ( = ?auto_187150 ?auto_187152 ) ) ( not ( = ?auto_187150 ?auto_187153 ) ) ( not ( = ?auto_187150 ?auto_187154 ) ) ( not ( = ?auto_187150 ?auto_187155 ) ) ( not ( = ?auto_187151 ?auto_187152 ) ) ( not ( = ?auto_187151 ?auto_187153 ) ) ( not ( = ?auto_187151 ?auto_187154 ) ) ( not ( = ?auto_187151 ?auto_187155 ) ) ( not ( = ?auto_187152 ?auto_187153 ) ) ( not ( = ?auto_187152 ?auto_187154 ) ) ( not ( = ?auto_187152 ?auto_187155 ) ) ( not ( = ?auto_187153 ?auto_187154 ) ) ( not ( = ?auto_187153 ?auto_187155 ) ) ( not ( = ?auto_187154 ?auto_187155 ) ) ( ON ?auto_187153 ?auto_187154 ) ( ON ?auto_187152 ?auto_187153 ) ( ON ?auto_187151 ?auto_187152 ) ( CLEAR ?auto_187149 ) ( ON ?auto_187150 ?auto_187151 ) ( CLEAR ?auto_187150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187146 ?auto_187147 ?auto_187148 ?auto_187149 ?auto_187150 )
      ( MAKE-9PILE ?auto_187146 ?auto_187147 ?auto_187148 ?auto_187149 ?auto_187150 ?auto_187151 ?auto_187152 ?auto_187153 ?auto_187154 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_187165 - BLOCK
      ?auto_187166 - BLOCK
      ?auto_187167 - BLOCK
      ?auto_187168 - BLOCK
      ?auto_187169 - BLOCK
      ?auto_187170 - BLOCK
      ?auto_187171 - BLOCK
      ?auto_187172 - BLOCK
      ?auto_187173 - BLOCK
    )
    :vars
    (
      ?auto_187174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187173 ?auto_187174 ) ( ON-TABLE ?auto_187165 ) ( ON ?auto_187166 ?auto_187165 ) ( ON ?auto_187167 ?auto_187166 ) ( ON ?auto_187168 ?auto_187167 ) ( not ( = ?auto_187165 ?auto_187166 ) ) ( not ( = ?auto_187165 ?auto_187167 ) ) ( not ( = ?auto_187165 ?auto_187168 ) ) ( not ( = ?auto_187165 ?auto_187169 ) ) ( not ( = ?auto_187165 ?auto_187170 ) ) ( not ( = ?auto_187165 ?auto_187171 ) ) ( not ( = ?auto_187165 ?auto_187172 ) ) ( not ( = ?auto_187165 ?auto_187173 ) ) ( not ( = ?auto_187165 ?auto_187174 ) ) ( not ( = ?auto_187166 ?auto_187167 ) ) ( not ( = ?auto_187166 ?auto_187168 ) ) ( not ( = ?auto_187166 ?auto_187169 ) ) ( not ( = ?auto_187166 ?auto_187170 ) ) ( not ( = ?auto_187166 ?auto_187171 ) ) ( not ( = ?auto_187166 ?auto_187172 ) ) ( not ( = ?auto_187166 ?auto_187173 ) ) ( not ( = ?auto_187166 ?auto_187174 ) ) ( not ( = ?auto_187167 ?auto_187168 ) ) ( not ( = ?auto_187167 ?auto_187169 ) ) ( not ( = ?auto_187167 ?auto_187170 ) ) ( not ( = ?auto_187167 ?auto_187171 ) ) ( not ( = ?auto_187167 ?auto_187172 ) ) ( not ( = ?auto_187167 ?auto_187173 ) ) ( not ( = ?auto_187167 ?auto_187174 ) ) ( not ( = ?auto_187168 ?auto_187169 ) ) ( not ( = ?auto_187168 ?auto_187170 ) ) ( not ( = ?auto_187168 ?auto_187171 ) ) ( not ( = ?auto_187168 ?auto_187172 ) ) ( not ( = ?auto_187168 ?auto_187173 ) ) ( not ( = ?auto_187168 ?auto_187174 ) ) ( not ( = ?auto_187169 ?auto_187170 ) ) ( not ( = ?auto_187169 ?auto_187171 ) ) ( not ( = ?auto_187169 ?auto_187172 ) ) ( not ( = ?auto_187169 ?auto_187173 ) ) ( not ( = ?auto_187169 ?auto_187174 ) ) ( not ( = ?auto_187170 ?auto_187171 ) ) ( not ( = ?auto_187170 ?auto_187172 ) ) ( not ( = ?auto_187170 ?auto_187173 ) ) ( not ( = ?auto_187170 ?auto_187174 ) ) ( not ( = ?auto_187171 ?auto_187172 ) ) ( not ( = ?auto_187171 ?auto_187173 ) ) ( not ( = ?auto_187171 ?auto_187174 ) ) ( not ( = ?auto_187172 ?auto_187173 ) ) ( not ( = ?auto_187172 ?auto_187174 ) ) ( not ( = ?auto_187173 ?auto_187174 ) ) ( ON ?auto_187172 ?auto_187173 ) ( ON ?auto_187171 ?auto_187172 ) ( ON ?auto_187170 ?auto_187171 ) ( CLEAR ?auto_187168 ) ( ON ?auto_187169 ?auto_187170 ) ( CLEAR ?auto_187169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187165 ?auto_187166 ?auto_187167 ?auto_187168 ?auto_187169 )
      ( MAKE-9PILE ?auto_187165 ?auto_187166 ?auto_187167 ?auto_187168 ?auto_187169 ?auto_187170 ?auto_187171 ?auto_187172 ?auto_187173 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_187184 - BLOCK
      ?auto_187185 - BLOCK
      ?auto_187186 - BLOCK
      ?auto_187187 - BLOCK
      ?auto_187188 - BLOCK
      ?auto_187189 - BLOCK
      ?auto_187190 - BLOCK
      ?auto_187191 - BLOCK
      ?auto_187192 - BLOCK
    )
    :vars
    (
      ?auto_187193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187192 ?auto_187193 ) ( ON-TABLE ?auto_187184 ) ( ON ?auto_187185 ?auto_187184 ) ( ON ?auto_187186 ?auto_187185 ) ( not ( = ?auto_187184 ?auto_187185 ) ) ( not ( = ?auto_187184 ?auto_187186 ) ) ( not ( = ?auto_187184 ?auto_187187 ) ) ( not ( = ?auto_187184 ?auto_187188 ) ) ( not ( = ?auto_187184 ?auto_187189 ) ) ( not ( = ?auto_187184 ?auto_187190 ) ) ( not ( = ?auto_187184 ?auto_187191 ) ) ( not ( = ?auto_187184 ?auto_187192 ) ) ( not ( = ?auto_187184 ?auto_187193 ) ) ( not ( = ?auto_187185 ?auto_187186 ) ) ( not ( = ?auto_187185 ?auto_187187 ) ) ( not ( = ?auto_187185 ?auto_187188 ) ) ( not ( = ?auto_187185 ?auto_187189 ) ) ( not ( = ?auto_187185 ?auto_187190 ) ) ( not ( = ?auto_187185 ?auto_187191 ) ) ( not ( = ?auto_187185 ?auto_187192 ) ) ( not ( = ?auto_187185 ?auto_187193 ) ) ( not ( = ?auto_187186 ?auto_187187 ) ) ( not ( = ?auto_187186 ?auto_187188 ) ) ( not ( = ?auto_187186 ?auto_187189 ) ) ( not ( = ?auto_187186 ?auto_187190 ) ) ( not ( = ?auto_187186 ?auto_187191 ) ) ( not ( = ?auto_187186 ?auto_187192 ) ) ( not ( = ?auto_187186 ?auto_187193 ) ) ( not ( = ?auto_187187 ?auto_187188 ) ) ( not ( = ?auto_187187 ?auto_187189 ) ) ( not ( = ?auto_187187 ?auto_187190 ) ) ( not ( = ?auto_187187 ?auto_187191 ) ) ( not ( = ?auto_187187 ?auto_187192 ) ) ( not ( = ?auto_187187 ?auto_187193 ) ) ( not ( = ?auto_187188 ?auto_187189 ) ) ( not ( = ?auto_187188 ?auto_187190 ) ) ( not ( = ?auto_187188 ?auto_187191 ) ) ( not ( = ?auto_187188 ?auto_187192 ) ) ( not ( = ?auto_187188 ?auto_187193 ) ) ( not ( = ?auto_187189 ?auto_187190 ) ) ( not ( = ?auto_187189 ?auto_187191 ) ) ( not ( = ?auto_187189 ?auto_187192 ) ) ( not ( = ?auto_187189 ?auto_187193 ) ) ( not ( = ?auto_187190 ?auto_187191 ) ) ( not ( = ?auto_187190 ?auto_187192 ) ) ( not ( = ?auto_187190 ?auto_187193 ) ) ( not ( = ?auto_187191 ?auto_187192 ) ) ( not ( = ?auto_187191 ?auto_187193 ) ) ( not ( = ?auto_187192 ?auto_187193 ) ) ( ON ?auto_187191 ?auto_187192 ) ( ON ?auto_187190 ?auto_187191 ) ( ON ?auto_187189 ?auto_187190 ) ( ON ?auto_187188 ?auto_187189 ) ( CLEAR ?auto_187186 ) ( ON ?auto_187187 ?auto_187188 ) ( CLEAR ?auto_187187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187184 ?auto_187185 ?auto_187186 ?auto_187187 )
      ( MAKE-9PILE ?auto_187184 ?auto_187185 ?auto_187186 ?auto_187187 ?auto_187188 ?auto_187189 ?auto_187190 ?auto_187191 ?auto_187192 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_187203 - BLOCK
      ?auto_187204 - BLOCK
      ?auto_187205 - BLOCK
      ?auto_187206 - BLOCK
      ?auto_187207 - BLOCK
      ?auto_187208 - BLOCK
      ?auto_187209 - BLOCK
      ?auto_187210 - BLOCK
      ?auto_187211 - BLOCK
    )
    :vars
    (
      ?auto_187212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187211 ?auto_187212 ) ( ON-TABLE ?auto_187203 ) ( ON ?auto_187204 ?auto_187203 ) ( ON ?auto_187205 ?auto_187204 ) ( not ( = ?auto_187203 ?auto_187204 ) ) ( not ( = ?auto_187203 ?auto_187205 ) ) ( not ( = ?auto_187203 ?auto_187206 ) ) ( not ( = ?auto_187203 ?auto_187207 ) ) ( not ( = ?auto_187203 ?auto_187208 ) ) ( not ( = ?auto_187203 ?auto_187209 ) ) ( not ( = ?auto_187203 ?auto_187210 ) ) ( not ( = ?auto_187203 ?auto_187211 ) ) ( not ( = ?auto_187203 ?auto_187212 ) ) ( not ( = ?auto_187204 ?auto_187205 ) ) ( not ( = ?auto_187204 ?auto_187206 ) ) ( not ( = ?auto_187204 ?auto_187207 ) ) ( not ( = ?auto_187204 ?auto_187208 ) ) ( not ( = ?auto_187204 ?auto_187209 ) ) ( not ( = ?auto_187204 ?auto_187210 ) ) ( not ( = ?auto_187204 ?auto_187211 ) ) ( not ( = ?auto_187204 ?auto_187212 ) ) ( not ( = ?auto_187205 ?auto_187206 ) ) ( not ( = ?auto_187205 ?auto_187207 ) ) ( not ( = ?auto_187205 ?auto_187208 ) ) ( not ( = ?auto_187205 ?auto_187209 ) ) ( not ( = ?auto_187205 ?auto_187210 ) ) ( not ( = ?auto_187205 ?auto_187211 ) ) ( not ( = ?auto_187205 ?auto_187212 ) ) ( not ( = ?auto_187206 ?auto_187207 ) ) ( not ( = ?auto_187206 ?auto_187208 ) ) ( not ( = ?auto_187206 ?auto_187209 ) ) ( not ( = ?auto_187206 ?auto_187210 ) ) ( not ( = ?auto_187206 ?auto_187211 ) ) ( not ( = ?auto_187206 ?auto_187212 ) ) ( not ( = ?auto_187207 ?auto_187208 ) ) ( not ( = ?auto_187207 ?auto_187209 ) ) ( not ( = ?auto_187207 ?auto_187210 ) ) ( not ( = ?auto_187207 ?auto_187211 ) ) ( not ( = ?auto_187207 ?auto_187212 ) ) ( not ( = ?auto_187208 ?auto_187209 ) ) ( not ( = ?auto_187208 ?auto_187210 ) ) ( not ( = ?auto_187208 ?auto_187211 ) ) ( not ( = ?auto_187208 ?auto_187212 ) ) ( not ( = ?auto_187209 ?auto_187210 ) ) ( not ( = ?auto_187209 ?auto_187211 ) ) ( not ( = ?auto_187209 ?auto_187212 ) ) ( not ( = ?auto_187210 ?auto_187211 ) ) ( not ( = ?auto_187210 ?auto_187212 ) ) ( not ( = ?auto_187211 ?auto_187212 ) ) ( ON ?auto_187210 ?auto_187211 ) ( ON ?auto_187209 ?auto_187210 ) ( ON ?auto_187208 ?auto_187209 ) ( ON ?auto_187207 ?auto_187208 ) ( CLEAR ?auto_187205 ) ( ON ?auto_187206 ?auto_187207 ) ( CLEAR ?auto_187206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187203 ?auto_187204 ?auto_187205 ?auto_187206 )
      ( MAKE-9PILE ?auto_187203 ?auto_187204 ?auto_187205 ?auto_187206 ?auto_187207 ?auto_187208 ?auto_187209 ?auto_187210 ?auto_187211 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_187222 - BLOCK
      ?auto_187223 - BLOCK
      ?auto_187224 - BLOCK
      ?auto_187225 - BLOCK
      ?auto_187226 - BLOCK
      ?auto_187227 - BLOCK
      ?auto_187228 - BLOCK
      ?auto_187229 - BLOCK
      ?auto_187230 - BLOCK
    )
    :vars
    (
      ?auto_187231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187230 ?auto_187231 ) ( ON-TABLE ?auto_187222 ) ( ON ?auto_187223 ?auto_187222 ) ( not ( = ?auto_187222 ?auto_187223 ) ) ( not ( = ?auto_187222 ?auto_187224 ) ) ( not ( = ?auto_187222 ?auto_187225 ) ) ( not ( = ?auto_187222 ?auto_187226 ) ) ( not ( = ?auto_187222 ?auto_187227 ) ) ( not ( = ?auto_187222 ?auto_187228 ) ) ( not ( = ?auto_187222 ?auto_187229 ) ) ( not ( = ?auto_187222 ?auto_187230 ) ) ( not ( = ?auto_187222 ?auto_187231 ) ) ( not ( = ?auto_187223 ?auto_187224 ) ) ( not ( = ?auto_187223 ?auto_187225 ) ) ( not ( = ?auto_187223 ?auto_187226 ) ) ( not ( = ?auto_187223 ?auto_187227 ) ) ( not ( = ?auto_187223 ?auto_187228 ) ) ( not ( = ?auto_187223 ?auto_187229 ) ) ( not ( = ?auto_187223 ?auto_187230 ) ) ( not ( = ?auto_187223 ?auto_187231 ) ) ( not ( = ?auto_187224 ?auto_187225 ) ) ( not ( = ?auto_187224 ?auto_187226 ) ) ( not ( = ?auto_187224 ?auto_187227 ) ) ( not ( = ?auto_187224 ?auto_187228 ) ) ( not ( = ?auto_187224 ?auto_187229 ) ) ( not ( = ?auto_187224 ?auto_187230 ) ) ( not ( = ?auto_187224 ?auto_187231 ) ) ( not ( = ?auto_187225 ?auto_187226 ) ) ( not ( = ?auto_187225 ?auto_187227 ) ) ( not ( = ?auto_187225 ?auto_187228 ) ) ( not ( = ?auto_187225 ?auto_187229 ) ) ( not ( = ?auto_187225 ?auto_187230 ) ) ( not ( = ?auto_187225 ?auto_187231 ) ) ( not ( = ?auto_187226 ?auto_187227 ) ) ( not ( = ?auto_187226 ?auto_187228 ) ) ( not ( = ?auto_187226 ?auto_187229 ) ) ( not ( = ?auto_187226 ?auto_187230 ) ) ( not ( = ?auto_187226 ?auto_187231 ) ) ( not ( = ?auto_187227 ?auto_187228 ) ) ( not ( = ?auto_187227 ?auto_187229 ) ) ( not ( = ?auto_187227 ?auto_187230 ) ) ( not ( = ?auto_187227 ?auto_187231 ) ) ( not ( = ?auto_187228 ?auto_187229 ) ) ( not ( = ?auto_187228 ?auto_187230 ) ) ( not ( = ?auto_187228 ?auto_187231 ) ) ( not ( = ?auto_187229 ?auto_187230 ) ) ( not ( = ?auto_187229 ?auto_187231 ) ) ( not ( = ?auto_187230 ?auto_187231 ) ) ( ON ?auto_187229 ?auto_187230 ) ( ON ?auto_187228 ?auto_187229 ) ( ON ?auto_187227 ?auto_187228 ) ( ON ?auto_187226 ?auto_187227 ) ( ON ?auto_187225 ?auto_187226 ) ( CLEAR ?auto_187223 ) ( ON ?auto_187224 ?auto_187225 ) ( CLEAR ?auto_187224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187222 ?auto_187223 ?auto_187224 )
      ( MAKE-9PILE ?auto_187222 ?auto_187223 ?auto_187224 ?auto_187225 ?auto_187226 ?auto_187227 ?auto_187228 ?auto_187229 ?auto_187230 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_187241 - BLOCK
      ?auto_187242 - BLOCK
      ?auto_187243 - BLOCK
      ?auto_187244 - BLOCK
      ?auto_187245 - BLOCK
      ?auto_187246 - BLOCK
      ?auto_187247 - BLOCK
      ?auto_187248 - BLOCK
      ?auto_187249 - BLOCK
    )
    :vars
    (
      ?auto_187250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187249 ?auto_187250 ) ( ON-TABLE ?auto_187241 ) ( ON ?auto_187242 ?auto_187241 ) ( not ( = ?auto_187241 ?auto_187242 ) ) ( not ( = ?auto_187241 ?auto_187243 ) ) ( not ( = ?auto_187241 ?auto_187244 ) ) ( not ( = ?auto_187241 ?auto_187245 ) ) ( not ( = ?auto_187241 ?auto_187246 ) ) ( not ( = ?auto_187241 ?auto_187247 ) ) ( not ( = ?auto_187241 ?auto_187248 ) ) ( not ( = ?auto_187241 ?auto_187249 ) ) ( not ( = ?auto_187241 ?auto_187250 ) ) ( not ( = ?auto_187242 ?auto_187243 ) ) ( not ( = ?auto_187242 ?auto_187244 ) ) ( not ( = ?auto_187242 ?auto_187245 ) ) ( not ( = ?auto_187242 ?auto_187246 ) ) ( not ( = ?auto_187242 ?auto_187247 ) ) ( not ( = ?auto_187242 ?auto_187248 ) ) ( not ( = ?auto_187242 ?auto_187249 ) ) ( not ( = ?auto_187242 ?auto_187250 ) ) ( not ( = ?auto_187243 ?auto_187244 ) ) ( not ( = ?auto_187243 ?auto_187245 ) ) ( not ( = ?auto_187243 ?auto_187246 ) ) ( not ( = ?auto_187243 ?auto_187247 ) ) ( not ( = ?auto_187243 ?auto_187248 ) ) ( not ( = ?auto_187243 ?auto_187249 ) ) ( not ( = ?auto_187243 ?auto_187250 ) ) ( not ( = ?auto_187244 ?auto_187245 ) ) ( not ( = ?auto_187244 ?auto_187246 ) ) ( not ( = ?auto_187244 ?auto_187247 ) ) ( not ( = ?auto_187244 ?auto_187248 ) ) ( not ( = ?auto_187244 ?auto_187249 ) ) ( not ( = ?auto_187244 ?auto_187250 ) ) ( not ( = ?auto_187245 ?auto_187246 ) ) ( not ( = ?auto_187245 ?auto_187247 ) ) ( not ( = ?auto_187245 ?auto_187248 ) ) ( not ( = ?auto_187245 ?auto_187249 ) ) ( not ( = ?auto_187245 ?auto_187250 ) ) ( not ( = ?auto_187246 ?auto_187247 ) ) ( not ( = ?auto_187246 ?auto_187248 ) ) ( not ( = ?auto_187246 ?auto_187249 ) ) ( not ( = ?auto_187246 ?auto_187250 ) ) ( not ( = ?auto_187247 ?auto_187248 ) ) ( not ( = ?auto_187247 ?auto_187249 ) ) ( not ( = ?auto_187247 ?auto_187250 ) ) ( not ( = ?auto_187248 ?auto_187249 ) ) ( not ( = ?auto_187248 ?auto_187250 ) ) ( not ( = ?auto_187249 ?auto_187250 ) ) ( ON ?auto_187248 ?auto_187249 ) ( ON ?auto_187247 ?auto_187248 ) ( ON ?auto_187246 ?auto_187247 ) ( ON ?auto_187245 ?auto_187246 ) ( ON ?auto_187244 ?auto_187245 ) ( CLEAR ?auto_187242 ) ( ON ?auto_187243 ?auto_187244 ) ( CLEAR ?auto_187243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187241 ?auto_187242 ?auto_187243 )
      ( MAKE-9PILE ?auto_187241 ?auto_187242 ?auto_187243 ?auto_187244 ?auto_187245 ?auto_187246 ?auto_187247 ?auto_187248 ?auto_187249 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_187260 - BLOCK
      ?auto_187261 - BLOCK
      ?auto_187262 - BLOCK
      ?auto_187263 - BLOCK
      ?auto_187264 - BLOCK
      ?auto_187265 - BLOCK
      ?auto_187266 - BLOCK
      ?auto_187267 - BLOCK
      ?auto_187268 - BLOCK
    )
    :vars
    (
      ?auto_187269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187268 ?auto_187269 ) ( ON-TABLE ?auto_187260 ) ( not ( = ?auto_187260 ?auto_187261 ) ) ( not ( = ?auto_187260 ?auto_187262 ) ) ( not ( = ?auto_187260 ?auto_187263 ) ) ( not ( = ?auto_187260 ?auto_187264 ) ) ( not ( = ?auto_187260 ?auto_187265 ) ) ( not ( = ?auto_187260 ?auto_187266 ) ) ( not ( = ?auto_187260 ?auto_187267 ) ) ( not ( = ?auto_187260 ?auto_187268 ) ) ( not ( = ?auto_187260 ?auto_187269 ) ) ( not ( = ?auto_187261 ?auto_187262 ) ) ( not ( = ?auto_187261 ?auto_187263 ) ) ( not ( = ?auto_187261 ?auto_187264 ) ) ( not ( = ?auto_187261 ?auto_187265 ) ) ( not ( = ?auto_187261 ?auto_187266 ) ) ( not ( = ?auto_187261 ?auto_187267 ) ) ( not ( = ?auto_187261 ?auto_187268 ) ) ( not ( = ?auto_187261 ?auto_187269 ) ) ( not ( = ?auto_187262 ?auto_187263 ) ) ( not ( = ?auto_187262 ?auto_187264 ) ) ( not ( = ?auto_187262 ?auto_187265 ) ) ( not ( = ?auto_187262 ?auto_187266 ) ) ( not ( = ?auto_187262 ?auto_187267 ) ) ( not ( = ?auto_187262 ?auto_187268 ) ) ( not ( = ?auto_187262 ?auto_187269 ) ) ( not ( = ?auto_187263 ?auto_187264 ) ) ( not ( = ?auto_187263 ?auto_187265 ) ) ( not ( = ?auto_187263 ?auto_187266 ) ) ( not ( = ?auto_187263 ?auto_187267 ) ) ( not ( = ?auto_187263 ?auto_187268 ) ) ( not ( = ?auto_187263 ?auto_187269 ) ) ( not ( = ?auto_187264 ?auto_187265 ) ) ( not ( = ?auto_187264 ?auto_187266 ) ) ( not ( = ?auto_187264 ?auto_187267 ) ) ( not ( = ?auto_187264 ?auto_187268 ) ) ( not ( = ?auto_187264 ?auto_187269 ) ) ( not ( = ?auto_187265 ?auto_187266 ) ) ( not ( = ?auto_187265 ?auto_187267 ) ) ( not ( = ?auto_187265 ?auto_187268 ) ) ( not ( = ?auto_187265 ?auto_187269 ) ) ( not ( = ?auto_187266 ?auto_187267 ) ) ( not ( = ?auto_187266 ?auto_187268 ) ) ( not ( = ?auto_187266 ?auto_187269 ) ) ( not ( = ?auto_187267 ?auto_187268 ) ) ( not ( = ?auto_187267 ?auto_187269 ) ) ( not ( = ?auto_187268 ?auto_187269 ) ) ( ON ?auto_187267 ?auto_187268 ) ( ON ?auto_187266 ?auto_187267 ) ( ON ?auto_187265 ?auto_187266 ) ( ON ?auto_187264 ?auto_187265 ) ( ON ?auto_187263 ?auto_187264 ) ( ON ?auto_187262 ?auto_187263 ) ( CLEAR ?auto_187260 ) ( ON ?auto_187261 ?auto_187262 ) ( CLEAR ?auto_187261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187260 ?auto_187261 )
      ( MAKE-9PILE ?auto_187260 ?auto_187261 ?auto_187262 ?auto_187263 ?auto_187264 ?auto_187265 ?auto_187266 ?auto_187267 ?auto_187268 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_187279 - BLOCK
      ?auto_187280 - BLOCK
      ?auto_187281 - BLOCK
      ?auto_187282 - BLOCK
      ?auto_187283 - BLOCK
      ?auto_187284 - BLOCK
      ?auto_187285 - BLOCK
      ?auto_187286 - BLOCK
      ?auto_187287 - BLOCK
    )
    :vars
    (
      ?auto_187288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187287 ?auto_187288 ) ( ON-TABLE ?auto_187279 ) ( not ( = ?auto_187279 ?auto_187280 ) ) ( not ( = ?auto_187279 ?auto_187281 ) ) ( not ( = ?auto_187279 ?auto_187282 ) ) ( not ( = ?auto_187279 ?auto_187283 ) ) ( not ( = ?auto_187279 ?auto_187284 ) ) ( not ( = ?auto_187279 ?auto_187285 ) ) ( not ( = ?auto_187279 ?auto_187286 ) ) ( not ( = ?auto_187279 ?auto_187287 ) ) ( not ( = ?auto_187279 ?auto_187288 ) ) ( not ( = ?auto_187280 ?auto_187281 ) ) ( not ( = ?auto_187280 ?auto_187282 ) ) ( not ( = ?auto_187280 ?auto_187283 ) ) ( not ( = ?auto_187280 ?auto_187284 ) ) ( not ( = ?auto_187280 ?auto_187285 ) ) ( not ( = ?auto_187280 ?auto_187286 ) ) ( not ( = ?auto_187280 ?auto_187287 ) ) ( not ( = ?auto_187280 ?auto_187288 ) ) ( not ( = ?auto_187281 ?auto_187282 ) ) ( not ( = ?auto_187281 ?auto_187283 ) ) ( not ( = ?auto_187281 ?auto_187284 ) ) ( not ( = ?auto_187281 ?auto_187285 ) ) ( not ( = ?auto_187281 ?auto_187286 ) ) ( not ( = ?auto_187281 ?auto_187287 ) ) ( not ( = ?auto_187281 ?auto_187288 ) ) ( not ( = ?auto_187282 ?auto_187283 ) ) ( not ( = ?auto_187282 ?auto_187284 ) ) ( not ( = ?auto_187282 ?auto_187285 ) ) ( not ( = ?auto_187282 ?auto_187286 ) ) ( not ( = ?auto_187282 ?auto_187287 ) ) ( not ( = ?auto_187282 ?auto_187288 ) ) ( not ( = ?auto_187283 ?auto_187284 ) ) ( not ( = ?auto_187283 ?auto_187285 ) ) ( not ( = ?auto_187283 ?auto_187286 ) ) ( not ( = ?auto_187283 ?auto_187287 ) ) ( not ( = ?auto_187283 ?auto_187288 ) ) ( not ( = ?auto_187284 ?auto_187285 ) ) ( not ( = ?auto_187284 ?auto_187286 ) ) ( not ( = ?auto_187284 ?auto_187287 ) ) ( not ( = ?auto_187284 ?auto_187288 ) ) ( not ( = ?auto_187285 ?auto_187286 ) ) ( not ( = ?auto_187285 ?auto_187287 ) ) ( not ( = ?auto_187285 ?auto_187288 ) ) ( not ( = ?auto_187286 ?auto_187287 ) ) ( not ( = ?auto_187286 ?auto_187288 ) ) ( not ( = ?auto_187287 ?auto_187288 ) ) ( ON ?auto_187286 ?auto_187287 ) ( ON ?auto_187285 ?auto_187286 ) ( ON ?auto_187284 ?auto_187285 ) ( ON ?auto_187283 ?auto_187284 ) ( ON ?auto_187282 ?auto_187283 ) ( ON ?auto_187281 ?auto_187282 ) ( CLEAR ?auto_187279 ) ( ON ?auto_187280 ?auto_187281 ) ( CLEAR ?auto_187280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187279 ?auto_187280 )
      ( MAKE-9PILE ?auto_187279 ?auto_187280 ?auto_187281 ?auto_187282 ?auto_187283 ?auto_187284 ?auto_187285 ?auto_187286 ?auto_187287 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_187298 - BLOCK
      ?auto_187299 - BLOCK
      ?auto_187300 - BLOCK
      ?auto_187301 - BLOCK
      ?auto_187302 - BLOCK
      ?auto_187303 - BLOCK
      ?auto_187304 - BLOCK
      ?auto_187305 - BLOCK
      ?auto_187306 - BLOCK
    )
    :vars
    (
      ?auto_187307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187306 ?auto_187307 ) ( not ( = ?auto_187298 ?auto_187299 ) ) ( not ( = ?auto_187298 ?auto_187300 ) ) ( not ( = ?auto_187298 ?auto_187301 ) ) ( not ( = ?auto_187298 ?auto_187302 ) ) ( not ( = ?auto_187298 ?auto_187303 ) ) ( not ( = ?auto_187298 ?auto_187304 ) ) ( not ( = ?auto_187298 ?auto_187305 ) ) ( not ( = ?auto_187298 ?auto_187306 ) ) ( not ( = ?auto_187298 ?auto_187307 ) ) ( not ( = ?auto_187299 ?auto_187300 ) ) ( not ( = ?auto_187299 ?auto_187301 ) ) ( not ( = ?auto_187299 ?auto_187302 ) ) ( not ( = ?auto_187299 ?auto_187303 ) ) ( not ( = ?auto_187299 ?auto_187304 ) ) ( not ( = ?auto_187299 ?auto_187305 ) ) ( not ( = ?auto_187299 ?auto_187306 ) ) ( not ( = ?auto_187299 ?auto_187307 ) ) ( not ( = ?auto_187300 ?auto_187301 ) ) ( not ( = ?auto_187300 ?auto_187302 ) ) ( not ( = ?auto_187300 ?auto_187303 ) ) ( not ( = ?auto_187300 ?auto_187304 ) ) ( not ( = ?auto_187300 ?auto_187305 ) ) ( not ( = ?auto_187300 ?auto_187306 ) ) ( not ( = ?auto_187300 ?auto_187307 ) ) ( not ( = ?auto_187301 ?auto_187302 ) ) ( not ( = ?auto_187301 ?auto_187303 ) ) ( not ( = ?auto_187301 ?auto_187304 ) ) ( not ( = ?auto_187301 ?auto_187305 ) ) ( not ( = ?auto_187301 ?auto_187306 ) ) ( not ( = ?auto_187301 ?auto_187307 ) ) ( not ( = ?auto_187302 ?auto_187303 ) ) ( not ( = ?auto_187302 ?auto_187304 ) ) ( not ( = ?auto_187302 ?auto_187305 ) ) ( not ( = ?auto_187302 ?auto_187306 ) ) ( not ( = ?auto_187302 ?auto_187307 ) ) ( not ( = ?auto_187303 ?auto_187304 ) ) ( not ( = ?auto_187303 ?auto_187305 ) ) ( not ( = ?auto_187303 ?auto_187306 ) ) ( not ( = ?auto_187303 ?auto_187307 ) ) ( not ( = ?auto_187304 ?auto_187305 ) ) ( not ( = ?auto_187304 ?auto_187306 ) ) ( not ( = ?auto_187304 ?auto_187307 ) ) ( not ( = ?auto_187305 ?auto_187306 ) ) ( not ( = ?auto_187305 ?auto_187307 ) ) ( not ( = ?auto_187306 ?auto_187307 ) ) ( ON ?auto_187305 ?auto_187306 ) ( ON ?auto_187304 ?auto_187305 ) ( ON ?auto_187303 ?auto_187304 ) ( ON ?auto_187302 ?auto_187303 ) ( ON ?auto_187301 ?auto_187302 ) ( ON ?auto_187300 ?auto_187301 ) ( ON ?auto_187299 ?auto_187300 ) ( ON ?auto_187298 ?auto_187299 ) ( CLEAR ?auto_187298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_187298 )
      ( MAKE-9PILE ?auto_187298 ?auto_187299 ?auto_187300 ?auto_187301 ?auto_187302 ?auto_187303 ?auto_187304 ?auto_187305 ?auto_187306 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_187317 - BLOCK
      ?auto_187318 - BLOCK
      ?auto_187319 - BLOCK
      ?auto_187320 - BLOCK
      ?auto_187321 - BLOCK
      ?auto_187322 - BLOCK
      ?auto_187323 - BLOCK
      ?auto_187324 - BLOCK
      ?auto_187325 - BLOCK
    )
    :vars
    (
      ?auto_187326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187325 ?auto_187326 ) ( not ( = ?auto_187317 ?auto_187318 ) ) ( not ( = ?auto_187317 ?auto_187319 ) ) ( not ( = ?auto_187317 ?auto_187320 ) ) ( not ( = ?auto_187317 ?auto_187321 ) ) ( not ( = ?auto_187317 ?auto_187322 ) ) ( not ( = ?auto_187317 ?auto_187323 ) ) ( not ( = ?auto_187317 ?auto_187324 ) ) ( not ( = ?auto_187317 ?auto_187325 ) ) ( not ( = ?auto_187317 ?auto_187326 ) ) ( not ( = ?auto_187318 ?auto_187319 ) ) ( not ( = ?auto_187318 ?auto_187320 ) ) ( not ( = ?auto_187318 ?auto_187321 ) ) ( not ( = ?auto_187318 ?auto_187322 ) ) ( not ( = ?auto_187318 ?auto_187323 ) ) ( not ( = ?auto_187318 ?auto_187324 ) ) ( not ( = ?auto_187318 ?auto_187325 ) ) ( not ( = ?auto_187318 ?auto_187326 ) ) ( not ( = ?auto_187319 ?auto_187320 ) ) ( not ( = ?auto_187319 ?auto_187321 ) ) ( not ( = ?auto_187319 ?auto_187322 ) ) ( not ( = ?auto_187319 ?auto_187323 ) ) ( not ( = ?auto_187319 ?auto_187324 ) ) ( not ( = ?auto_187319 ?auto_187325 ) ) ( not ( = ?auto_187319 ?auto_187326 ) ) ( not ( = ?auto_187320 ?auto_187321 ) ) ( not ( = ?auto_187320 ?auto_187322 ) ) ( not ( = ?auto_187320 ?auto_187323 ) ) ( not ( = ?auto_187320 ?auto_187324 ) ) ( not ( = ?auto_187320 ?auto_187325 ) ) ( not ( = ?auto_187320 ?auto_187326 ) ) ( not ( = ?auto_187321 ?auto_187322 ) ) ( not ( = ?auto_187321 ?auto_187323 ) ) ( not ( = ?auto_187321 ?auto_187324 ) ) ( not ( = ?auto_187321 ?auto_187325 ) ) ( not ( = ?auto_187321 ?auto_187326 ) ) ( not ( = ?auto_187322 ?auto_187323 ) ) ( not ( = ?auto_187322 ?auto_187324 ) ) ( not ( = ?auto_187322 ?auto_187325 ) ) ( not ( = ?auto_187322 ?auto_187326 ) ) ( not ( = ?auto_187323 ?auto_187324 ) ) ( not ( = ?auto_187323 ?auto_187325 ) ) ( not ( = ?auto_187323 ?auto_187326 ) ) ( not ( = ?auto_187324 ?auto_187325 ) ) ( not ( = ?auto_187324 ?auto_187326 ) ) ( not ( = ?auto_187325 ?auto_187326 ) ) ( ON ?auto_187324 ?auto_187325 ) ( ON ?auto_187323 ?auto_187324 ) ( ON ?auto_187322 ?auto_187323 ) ( ON ?auto_187321 ?auto_187322 ) ( ON ?auto_187320 ?auto_187321 ) ( ON ?auto_187319 ?auto_187320 ) ( ON ?auto_187318 ?auto_187319 ) ( ON ?auto_187317 ?auto_187318 ) ( CLEAR ?auto_187317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_187317 )
      ( MAKE-9PILE ?auto_187317 ?auto_187318 ?auto_187319 ?auto_187320 ?auto_187321 ?auto_187322 ?auto_187323 ?auto_187324 ?auto_187325 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187337 - BLOCK
      ?auto_187338 - BLOCK
      ?auto_187339 - BLOCK
      ?auto_187340 - BLOCK
      ?auto_187341 - BLOCK
      ?auto_187342 - BLOCK
      ?auto_187343 - BLOCK
      ?auto_187344 - BLOCK
      ?auto_187345 - BLOCK
      ?auto_187346 - BLOCK
    )
    :vars
    (
      ?auto_187347 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_187345 ) ( ON ?auto_187346 ?auto_187347 ) ( CLEAR ?auto_187346 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_187337 ) ( ON ?auto_187338 ?auto_187337 ) ( ON ?auto_187339 ?auto_187338 ) ( ON ?auto_187340 ?auto_187339 ) ( ON ?auto_187341 ?auto_187340 ) ( ON ?auto_187342 ?auto_187341 ) ( ON ?auto_187343 ?auto_187342 ) ( ON ?auto_187344 ?auto_187343 ) ( ON ?auto_187345 ?auto_187344 ) ( not ( = ?auto_187337 ?auto_187338 ) ) ( not ( = ?auto_187337 ?auto_187339 ) ) ( not ( = ?auto_187337 ?auto_187340 ) ) ( not ( = ?auto_187337 ?auto_187341 ) ) ( not ( = ?auto_187337 ?auto_187342 ) ) ( not ( = ?auto_187337 ?auto_187343 ) ) ( not ( = ?auto_187337 ?auto_187344 ) ) ( not ( = ?auto_187337 ?auto_187345 ) ) ( not ( = ?auto_187337 ?auto_187346 ) ) ( not ( = ?auto_187337 ?auto_187347 ) ) ( not ( = ?auto_187338 ?auto_187339 ) ) ( not ( = ?auto_187338 ?auto_187340 ) ) ( not ( = ?auto_187338 ?auto_187341 ) ) ( not ( = ?auto_187338 ?auto_187342 ) ) ( not ( = ?auto_187338 ?auto_187343 ) ) ( not ( = ?auto_187338 ?auto_187344 ) ) ( not ( = ?auto_187338 ?auto_187345 ) ) ( not ( = ?auto_187338 ?auto_187346 ) ) ( not ( = ?auto_187338 ?auto_187347 ) ) ( not ( = ?auto_187339 ?auto_187340 ) ) ( not ( = ?auto_187339 ?auto_187341 ) ) ( not ( = ?auto_187339 ?auto_187342 ) ) ( not ( = ?auto_187339 ?auto_187343 ) ) ( not ( = ?auto_187339 ?auto_187344 ) ) ( not ( = ?auto_187339 ?auto_187345 ) ) ( not ( = ?auto_187339 ?auto_187346 ) ) ( not ( = ?auto_187339 ?auto_187347 ) ) ( not ( = ?auto_187340 ?auto_187341 ) ) ( not ( = ?auto_187340 ?auto_187342 ) ) ( not ( = ?auto_187340 ?auto_187343 ) ) ( not ( = ?auto_187340 ?auto_187344 ) ) ( not ( = ?auto_187340 ?auto_187345 ) ) ( not ( = ?auto_187340 ?auto_187346 ) ) ( not ( = ?auto_187340 ?auto_187347 ) ) ( not ( = ?auto_187341 ?auto_187342 ) ) ( not ( = ?auto_187341 ?auto_187343 ) ) ( not ( = ?auto_187341 ?auto_187344 ) ) ( not ( = ?auto_187341 ?auto_187345 ) ) ( not ( = ?auto_187341 ?auto_187346 ) ) ( not ( = ?auto_187341 ?auto_187347 ) ) ( not ( = ?auto_187342 ?auto_187343 ) ) ( not ( = ?auto_187342 ?auto_187344 ) ) ( not ( = ?auto_187342 ?auto_187345 ) ) ( not ( = ?auto_187342 ?auto_187346 ) ) ( not ( = ?auto_187342 ?auto_187347 ) ) ( not ( = ?auto_187343 ?auto_187344 ) ) ( not ( = ?auto_187343 ?auto_187345 ) ) ( not ( = ?auto_187343 ?auto_187346 ) ) ( not ( = ?auto_187343 ?auto_187347 ) ) ( not ( = ?auto_187344 ?auto_187345 ) ) ( not ( = ?auto_187344 ?auto_187346 ) ) ( not ( = ?auto_187344 ?auto_187347 ) ) ( not ( = ?auto_187345 ?auto_187346 ) ) ( not ( = ?auto_187345 ?auto_187347 ) ) ( not ( = ?auto_187346 ?auto_187347 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_187346 ?auto_187347 )
      ( !STACK ?auto_187346 ?auto_187345 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187358 - BLOCK
      ?auto_187359 - BLOCK
      ?auto_187360 - BLOCK
      ?auto_187361 - BLOCK
      ?auto_187362 - BLOCK
      ?auto_187363 - BLOCK
      ?auto_187364 - BLOCK
      ?auto_187365 - BLOCK
      ?auto_187366 - BLOCK
      ?auto_187367 - BLOCK
    )
    :vars
    (
      ?auto_187368 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_187366 ) ( ON ?auto_187367 ?auto_187368 ) ( CLEAR ?auto_187367 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_187358 ) ( ON ?auto_187359 ?auto_187358 ) ( ON ?auto_187360 ?auto_187359 ) ( ON ?auto_187361 ?auto_187360 ) ( ON ?auto_187362 ?auto_187361 ) ( ON ?auto_187363 ?auto_187362 ) ( ON ?auto_187364 ?auto_187363 ) ( ON ?auto_187365 ?auto_187364 ) ( ON ?auto_187366 ?auto_187365 ) ( not ( = ?auto_187358 ?auto_187359 ) ) ( not ( = ?auto_187358 ?auto_187360 ) ) ( not ( = ?auto_187358 ?auto_187361 ) ) ( not ( = ?auto_187358 ?auto_187362 ) ) ( not ( = ?auto_187358 ?auto_187363 ) ) ( not ( = ?auto_187358 ?auto_187364 ) ) ( not ( = ?auto_187358 ?auto_187365 ) ) ( not ( = ?auto_187358 ?auto_187366 ) ) ( not ( = ?auto_187358 ?auto_187367 ) ) ( not ( = ?auto_187358 ?auto_187368 ) ) ( not ( = ?auto_187359 ?auto_187360 ) ) ( not ( = ?auto_187359 ?auto_187361 ) ) ( not ( = ?auto_187359 ?auto_187362 ) ) ( not ( = ?auto_187359 ?auto_187363 ) ) ( not ( = ?auto_187359 ?auto_187364 ) ) ( not ( = ?auto_187359 ?auto_187365 ) ) ( not ( = ?auto_187359 ?auto_187366 ) ) ( not ( = ?auto_187359 ?auto_187367 ) ) ( not ( = ?auto_187359 ?auto_187368 ) ) ( not ( = ?auto_187360 ?auto_187361 ) ) ( not ( = ?auto_187360 ?auto_187362 ) ) ( not ( = ?auto_187360 ?auto_187363 ) ) ( not ( = ?auto_187360 ?auto_187364 ) ) ( not ( = ?auto_187360 ?auto_187365 ) ) ( not ( = ?auto_187360 ?auto_187366 ) ) ( not ( = ?auto_187360 ?auto_187367 ) ) ( not ( = ?auto_187360 ?auto_187368 ) ) ( not ( = ?auto_187361 ?auto_187362 ) ) ( not ( = ?auto_187361 ?auto_187363 ) ) ( not ( = ?auto_187361 ?auto_187364 ) ) ( not ( = ?auto_187361 ?auto_187365 ) ) ( not ( = ?auto_187361 ?auto_187366 ) ) ( not ( = ?auto_187361 ?auto_187367 ) ) ( not ( = ?auto_187361 ?auto_187368 ) ) ( not ( = ?auto_187362 ?auto_187363 ) ) ( not ( = ?auto_187362 ?auto_187364 ) ) ( not ( = ?auto_187362 ?auto_187365 ) ) ( not ( = ?auto_187362 ?auto_187366 ) ) ( not ( = ?auto_187362 ?auto_187367 ) ) ( not ( = ?auto_187362 ?auto_187368 ) ) ( not ( = ?auto_187363 ?auto_187364 ) ) ( not ( = ?auto_187363 ?auto_187365 ) ) ( not ( = ?auto_187363 ?auto_187366 ) ) ( not ( = ?auto_187363 ?auto_187367 ) ) ( not ( = ?auto_187363 ?auto_187368 ) ) ( not ( = ?auto_187364 ?auto_187365 ) ) ( not ( = ?auto_187364 ?auto_187366 ) ) ( not ( = ?auto_187364 ?auto_187367 ) ) ( not ( = ?auto_187364 ?auto_187368 ) ) ( not ( = ?auto_187365 ?auto_187366 ) ) ( not ( = ?auto_187365 ?auto_187367 ) ) ( not ( = ?auto_187365 ?auto_187368 ) ) ( not ( = ?auto_187366 ?auto_187367 ) ) ( not ( = ?auto_187366 ?auto_187368 ) ) ( not ( = ?auto_187367 ?auto_187368 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_187367 ?auto_187368 )
      ( !STACK ?auto_187367 ?auto_187366 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187379 - BLOCK
      ?auto_187380 - BLOCK
      ?auto_187381 - BLOCK
      ?auto_187382 - BLOCK
      ?auto_187383 - BLOCK
      ?auto_187384 - BLOCK
      ?auto_187385 - BLOCK
      ?auto_187386 - BLOCK
      ?auto_187387 - BLOCK
      ?auto_187388 - BLOCK
    )
    :vars
    (
      ?auto_187389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187388 ?auto_187389 ) ( ON-TABLE ?auto_187379 ) ( ON ?auto_187380 ?auto_187379 ) ( ON ?auto_187381 ?auto_187380 ) ( ON ?auto_187382 ?auto_187381 ) ( ON ?auto_187383 ?auto_187382 ) ( ON ?auto_187384 ?auto_187383 ) ( ON ?auto_187385 ?auto_187384 ) ( ON ?auto_187386 ?auto_187385 ) ( not ( = ?auto_187379 ?auto_187380 ) ) ( not ( = ?auto_187379 ?auto_187381 ) ) ( not ( = ?auto_187379 ?auto_187382 ) ) ( not ( = ?auto_187379 ?auto_187383 ) ) ( not ( = ?auto_187379 ?auto_187384 ) ) ( not ( = ?auto_187379 ?auto_187385 ) ) ( not ( = ?auto_187379 ?auto_187386 ) ) ( not ( = ?auto_187379 ?auto_187387 ) ) ( not ( = ?auto_187379 ?auto_187388 ) ) ( not ( = ?auto_187379 ?auto_187389 ) ) ( not ( = ?auto_187380 ?auto_187381 ) ) ( not ( = ?auto_187380 ?auto_187382 ) ) ( not ( = ?auto_187380 ?auto_187383 ) ) ( not ( = ?auto_187380 ?auto_187384 ) ) ( not ( = ?auto_187380 ?auto_187385 ) ) ( not ( = ?auto_187380 ?auto_187386 ) ) ( not ( = ?auto_187380 ?auto_187387 ) ) ( not ( = ?auto_187380 ?auto_187388 ) ) ( not ( = ?auto_187380 ?auto_187389 ) ) ( not ( = ?auto_187381 ?auto_187382 ) ) ( not ( = ?auto_187381 ?auto_187383 ) ) ( not ( = ?auto_187381 ?auto_187384 ) ) ( not ( = ?auto_187381 ?auto_187385 ) ) ( not ( = ?auto_187381 ?auto_187386 ) ) ( not ( = ?auto_187381 ?auto_187387 ) ) ( not ( = ?auto_187381 ?auto_187388 ) ) ( not ( = ?auto_187381 ?auto_187389 ) ) ( not ( = ?auto_187382 ?auto_187383 ) ) ( not ( = ?auto_187382 ?auto_187384 ) ) ( not ( = ?auto_187382 ?auto_187385 ) ) ( not ( = ?auto_187382 ?auto_187386 ) ) ( not ( = ?auto_187382 ?auto_187387 ) ) ( not ( = ?auto_187382 ?auto_187388 ) ) ( not ( = ?auto_187382 ?auto_187389 ) ) ( not ( = ?auto_187383 ?auto_187384 ) ) ( not ( = ?auto_187383 ?auto_187385 ) ) ( not ( = ?auto_187383 ?auto_187386 ) ) ( not ( = ?auto_187383 ?auto_187387 ) ) ( not ( = ?auto_187383 ?auto_187388 ) ) ( not ( = ?auto_187383 ?auto_187389 ) ) ( not ( = ?auto_187384 ?auto_187385 ) ) ( not ( = ?auto_187384 ?auto_187386 ) ) ( not ( = ?auto_187384 ?auto_187387 ) ) ( not ( = ?auto_187384 ?auto_187388 ) ) ( not ( = ?auto_187384 ?auto_187389 ) ) ( not ( = ?auto_187385 ?auto_187386 ) ) ( not ( = ?auto_187385 ?auto_187387 ) ) ( not ( = ?auto_187385 ?auto_187388 ) ) ( not ( = ?auto_187385 ?auto_187389 ) ) ( not ( = ?auto_187386 ?auto_187387 ) ) ( not ( = ?auto_187386 ?auto_187388 ) ) ( not ( = ?auto_187386 ?auto_187389 ) ) ( not ( = ?auto_187387 ?auto_187388 ) ) ( not ( = ?auto_187387 ?auto_187389 ) ) ( not ( = ?auto_187388 ?auto_187389 ) ) ( CLEAR ?auto_187386 ) ( ON ?auto_187387 ?auto_187388 ) ( CLEAR ?auto_187387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_187379 ?auto_187380 ?auto_187381 ?auto_187382 ?auto_187383 ?auto_187384 ?auto_187385 ?auto_187386 ?auto_187387 )
      ( MAKE-10PILE ?auto_187379 ?auto_187380 ?auto_187381 ?auto_187382 ?auto_187383 ?auto_187384 ?auto_187385 ?auto_187386 ?auto_187387 ?auto_187388 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187400 - BLOCK
      ?auto_187401 - BLOCK
      ?auto_187402 - BLOCK
      ?auto_187403 - BLOCK
      ?auto_187404 - BLOCK
      ?auto_187405 - BLOCK
      ?auto_187406 - BLOCK
      ?auto_187407 - BLOCK
      ?auto_187408 - BLOCK
      ?auto_187409 - BLOCK
    )
    :vars
    (
      ?auto_187410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187409 ?auto_187410 ) ( ON-TABLE ?auto_187400 ) ( ON ?auto_187401 ?auto_187400 ) ( ON ?auto_187402 ?auto_187401 ) ( ON ?auto_187403 ?auto_187402 ) ( ON ?auto_187404 ?auto_187403 ) ( ON ?auto_187405 ?auto_187404 ) ( ON ?auto_187406 ?auto_187405 ) ( ON ?auto_187407 ?auto_187406 ) ( not ( = ?auto_187400 ?auto_187401 ) ) ( not ( = ?auto_187400 ?auto_187402 ) ) ( not ( = ?auto_187400 ?auto_187403 ) ) ( not ( = ?auto_187400 ?auto_187404 ) ) ( not ( = ?auto_187400 ?auto_187405 ) ) ( not ( = ?auto_187400 ?auto_187406 ) ) ( not ( = ?auto_187400 ?auto_187407 ) ) ( not ( = ?auto_187400 ?auto_187408 ) ) ( not ( = ?auto_187400 ?auto_187409 ) ) ( not ( = ?auto_187400 ?auto_187410 ) ) ( not ( = ?auto_187401 ?auto_187402 ) ) ( not ( = ?auto_187401 ?auto_187403 ) ) ( not ( = ?auto_187401 ?auto_187404 ) ) ( not ( = ?auto_187401 ?auto_187405 ) ) ( not ( = ?auto_187401 ?auto_187406 ) ) ( not ( = ?auto_187401 ?auto_187407 ) ) ( not ( = ?auto_187401 ?auto_187408 ) ) ( not ( = ?auto_187401 ?auto_187409 ) ) ( not ( = ?auto_187401 ?auto_187410 ) ) ( not ( = ?auto_187402 ?auto_187403 ) ) ( not ( = ?auto_187402 ?auto_187404 ) ) ( not ( = ?auto_187402 ?auto_187405 ) ) ( not ( = ?auto_187402 ?auto_187406 ) ) ( not ( = ?auto_187402 ?auto_187407 ) ) ( not ( = ?auto_187402 ?auto_187408 ) ) ( not ( = ?auto_187402 ?auto_187409 ) ) ( not ( = ?auto_187402 ?auto_187410 ) ) ( not ( = ?auto_187403 ?auto_187404 ) ) ( not ( = ?auto_187403 ?auto_187405 ) ) ( not ( = ?auto_187403 ?auto_187406 ) ) ( not ( = ?auto_187403 ?auto_187407 ) ) ( not ( = ?auto_187403 ?auto_187408 ) ) ( not ( = ?auto_187403 ?auto_187409 ) ) ( not ( = ?auto_187403 ?auto_187410 ) ) ( not ( = ?auto_187404 ?auto_187405 ) ) ( not ( = ?auto_187404 ?auto_187406 ) ) ( not ( = ?auto_187404 ?auto_187407 ) ) ( not ( = ?auto_187404 ?auto_187408 ) ) ( not ( = ?auto_187404 ?auto_187409 ) ) ( not ( = ?auto_187404 ?auto_187410 ) ) ( not ( = ?auto_187405 ?auto_187406 ) ) ( not ( = ?auto_187405 ?auto_187407 ) ) ( not ( = ?auto_187405 ?auto_187408 ) ) ( not ( = ?auto_187405 ?auto_187409 ) ) ( not ( = ?auto_187405 ?auto_187410 ) ) ( not ( = ?auto_187406 ?auto_187407 ) ) ( not ( = ?auto_187406 ?auto_187408 ) ) ( not ( = ?auto_187406 ?auto_187409 ) ) ( not ( = ?auto_187406 ?auto_187410 ) ) ( not ( = ?auto_187407 ?auto_187408 ) ) ( not ( = ?auto_187407 ?auto_187409 ) ) ( not ( = ?auto_187407 ?auto_187410 ) ) ( not ( = ?auto_187408 ?auto_187409 ) ) ( not ( = ?auto_187408 ?auto_187410 ) ) ( not ( = ?auto_187409 ?auto_187410 ) ) ( CLEAR ?auto_187407 ) ( ON ?auto_187408 ?auto_187409 ) ( CLEAR ?auto_187408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_187400 ?auto_187401 ?auto_187402 ?auto_187403 ?auto_187404 ?auto_187405 ?auto_187406 ?auto_187407 ?auto_187408 )
      ( MAKE-10PILE ?auto_187400 ?auto_187401 ?auto_187402 ?auto_187403 ?auto_187404 ?auto_187405 ?auto_187406 ?auto_187407 ?auto_187408 ?auto_187409 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187421 - BLOCK
      ?auto_187422 - BLOCK
      ?auto_187423 - BLOCK
      ?auto_187424 - BLOCK
      ?auto_187425 - BLOCK
      ?auto_187426 - BLOCK
      ?auto_187427 - BLOCK
      ?auto_187428 - BLOCK
      ?auto_187429 - BLOCK
      ?auto_187430 - BLOCK
    )
    :vars
    (
      ?auto_187431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187430 ?auto_187431 ) ( ON-TABLE ?auto_187421 ) ( ON ?auto_187422 ?auto_187421 ) ( ON ?auto_187423 ?auto_187422 ) ( ON ?auto_187424 ?auto_187423 ) ( ON ?auto_187425 ?auto_187424 ) ( ON ?auto_187426 ?auto_187425 ) ( ON ?auto_187427 ?auto_187426 ) ( not ( = ?auto_187421 ?auto_187422 ) ) ( not ( = ?auto_187421 ?auto_187423 ) ) ( not ( = ?auto_187421 ?auto_187424 ) ) ( not ( = ?auto_187421 ?auto_187425 ) ) ( not ( = ?auto_187421 ?auto_187426 ) ) ( not ( = ?auto_187421 ?auto_187427 ) ) ( not ( = ?auto_187421 ?auto_187428 ) ) ( not ( = ?auto_187421 ?auto_187429 ) ) ( not ( = ?auto_187421 ?auto_187430 ) ) ( not ( = ?auto_187421 ?auto_187431 ) ) ( not ( = ?auto_187422 ?auto_187423 ) ) ( not ( = ?auto_187422 ?auto_187424 ) ) ( not ( = ?auto_187422 ?auto_187425 ) ) ( not ( = ?auto_187422 ?auto_187426 ) ) ( not ( = ?auto_187422 ?auto_187427 ) ) ( not ( = ?auto_187422 ?auto_187428 ) ) ( not ( = ?auto_187422 ?auto_187429 ) ) ( not ( = ?auto_187422 ?auto_187430 ) ) ( not ( = ?auto_187422 ?auto_187431 ) ) ( not ( = ?auto_187423 ?auto_187424 ) ) ( not ( = ?auto_187423 ?auto_187425 ) ) ( not ( = ?auto_187423 ?auto_187426 ) ) ( not ( = ?auto_187423 ?auto_187427 ) ) ( not ( = ?auto_187423 ?auto_187428 ) ) ( not ( = ?auto_187423 ?auto_187429 ) ) ( not ( = ?auto_187423 ?auto_187430 ) ) ( not ( = ?auto_187423 ?auto_187431 ) ) ( not ( = ?auto_187424 ?auto_187425 ) ) ( not ( = ?auto_187424 ?auto_187426 ) ) ( not ( = ?auto_187424 ?auto_187427 ) ) ( not ( = ?auto_187424 ?auto_187428 ) ) ( not ( = ?auto_187424 ?auto_187429 ) ) ( not ( = ?auto_187424 ?auto_187430 ) ) ( not ( = ?auto_187424 ?auto_187431 ) ) ( not ( = ?auto_187425 ?auto_187426 ) ) ( not ( = ?auto_187425 ?auto_187427 ) ) ( not ( = ?auto_187425 ?auto_187428 ) ) ( not ( = ?auto_187425 ?auto_187429 ) ) ( not ( = ?auto_187425 ?auto_187430 ) ) ( not ( = ?auto_187425 ?auto_187431 ) ) ( not ( = ?auto_187426 ?auto_187427 ) ) ( not ( = ?auto_187426 ?auto_187428 ) ) ( not ( = ?auto_187426 ?auto_187429 ) ) ( not ( = ?auto_187426 ?auto_187430 ) ) ( not ( = ?auto_187426 ?auto_187431 ) ) ( not ( = ?auto_187427 ?auto_187428 ) ) ( not ( = ?auto_187427 ?auto_187429 ) ) ( not ( = ?auto_187427 ?auto_187430 ) ) ( not ( = ?auto_187427 ?auto_187431 ) ) ( not ( = ?auto_187428 ?auto_187429 ) ) ( not ( = ?auto_187428 ?auto_187430 ) ) ( not ( = ?auto_187428 ?auto_187431 ) ) ( not ( = ?auto_187429 ?auto_187430 ) ) ( not ( = ?auto_187429 ?auto_187431 ) ) ( not ( = ?auto_187430 ?auto_187431 ) ) ( ON ?auto_187429 ?auto_187430 ) ( CLEAR ?auto_187427 ) ( ON ?auto_187428 ?auto_187429 ) ( CLEAR ?auto_187428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_187421 ?auto_187422 ?auto_187423 ?auto_187424 ?auto_187425 ?auto_187426 ?auto_187427 ?auto_187428 )
      ( MAKE-10PILE ?auto_187421 ?auto_187422 ?auto_187423 ?auto_187424 ?auto_187425 ?auto_187426 ?auto_187427 ?auto_187428 ?auto_187429 ?auto_187430 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187442 - BLOCK
      ?auto_187443 - BLOCK
      ?auto_187444 - BLOCK
      ?auto_187445 - BLOCK
      ?auto_187446 - BLOCK
      ?auto_187447 - BLOCK
      ?auto_187448 - BLOCK
      ?auto_187449 - BLOCK
      ?auto_187450 - BLOCK
      ?auto_187451 - BLOCK
    )
    :vars
    (
      ?auto_187452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187451 ?auto_187452 ) ( ON-TABLE ?auto_187442 ) ( ON ?auto_187443 ?auto_187442 ) ( ON ?auto_187444 ?auto_187443 ) ( ON ?auto_187445 ?auto_187444 ) ( ON ?auto_187446 ?auto_187445 ) ( ON ?auto_187447 ?auto_187446 ) ( ON ?auto_187448 ?auto_187447 ) ( not ( = ?auto_187442 ?auto_187443 ) ) ( not ( = ?auto_187442 ?auto_187444 ) ) ( not ( = ?auto_187442 ?auto_187445 ) ) ( not ( = ?auto_187442 ?auto_187446 ) ) ( not ( = ?auto_187442 ?auto_187447 ) ) ( not ( = ?auto_187442 ?auto_187448 ) ) ( not ( = ?auto_187442 ?auto_187449 ) ) ( not ( = ?auto_187442 ?auto_187450 ) ) ( not ( = ?auto_187442 ?auto_187451 ) ) ( not ( = ?auto_187442 ?auto_187452 ) ) ( not ( = ?auto_187443 ?auto_187444 ) ) ( not ( = ?auto_187443 ?auto_187445 ) ) ( not ( = ?auto_187443 ?auto_187446 ) ) ( not ( = ?auto_187443 ?auto_187447 ) ) ( not ( = ?auto_187443 ?auto_187448 ) ) ( not ( = ?auto_187443 ?auto_187449 ) ) ( not ( = ?auto_187443 ?auto_187450 ) ) ( not ( = ?auto_187443 ?auto_187451 ) ) ( not ( = ?auto_187443 ?auto_187452 ) ) ( not ( = ?auto_187444 ?auto_187445 ) ) ( not ( = ?auto_187444 ?auto_187446 ) ) ( not ( = ?auto_187444 ?auto_187447 ) ) ( not ( = ?auto_187444 ?auto_187448 ) ) ( not ( = ?auto_187444 ?auto_187449 ) ) ( not ( = ?auto_187444 ?auto_187450 ) ) ( not ( = ?auto_187444 ?auto_187451 ) ) ( not ( = ?auto_187444 ?auto_187452 ) ) ( not ( = ?auto_187445 ?auto_187446 ) ) ( not ( = ?auto_187445 ?auto_187447 ) ) ( not ( = ?auto_187445 ?auto_187448 ) ) ( not ( = ?auto_187445 ?auto_187449 ) ) ( not ( = ?auto_187445 ?auto_187450 ) ) ( not ( = ?auto_187445 ?auto_187451 ) ) ( not ( = ?auto_187445 ?auto_187452 ) ) ( not ( = ?auto_187446 ?auto_187447 ) ) ( not ( = ?auto_187446 ?auto_187448 ) ) ( not ( = ?auto_187446 ?auto_187449 ) ) ( not ( = ?auto_187446 ?auto_187450 ) ) ( not ( = ?auto_187446 ?auto_187451 ) ) ( not ( = ?auto_187446 ?auto_187452 ) ) ( not ( = ?auto_187447 ?auto_187448 ) ) ( not ( = ?auto_187447 ?auto_187449 ) ) ( not ( = ?auto_187447 ?auto_187450 ) ) ( not ( = ?auto_187447 ?auto_187451 ) ) ( not ( = ?auto_187447 ?auto_187452 ) ) ( not ( = ?auto_187448 ?auto_187449 ) ) ( not ( = ?auto_187448 ?auto_187450 ) ) ( not ( = ?auto_187448 ?auto_187451 ) ) ( not ( = ?auto_187448 ?auto_187452 ) ) ( not ( = ?auto_187449 ?auto_187450 ) ) ( not ( = ?auto_187449 ?auto_187451 ) ) ( not ( = ?auto_187449 ?auto_187452 ) ) ( not ( = ?auto_187450 ?auto_187451 ) ) ( not ( = ?auto_187450 ?auto_187452 ) ) ( not ( = ?auto_187451 ?auto_187452 ) ) ( ON ?auto_187450 ?auto_187451 ) ( CLEAR ?auto_187448 ) ( ON ?auto_187449 ?auto_187450 ) ( CLEAR ?auto_187449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_187442 ?auto_187443 ?auto_187444 ?auto_187445 ?auto_187446 ?auto_187447 ?auto_187448 ?auto_187449 )
      ( MAKE-10PILE ?auto_187442 ?auto_187443 ?auto_187444 ?auto_187445 ?auto_187446 ?auto_187447 ?auto_187448 ?auto_187449 ?auto_187450 ?auto_187451 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187463 - BLOCK
      ?auto_187464 - BLOCK
      ?auto_187465 - BLOCK
      ?auto_187466 - BLOCK
      ?auto_187467 - BLOCK
      ?auto_187468 - BLOCK
      ?auto_187469 - BLOCK
      ?auto_187470 - BLOCK
      ?auto_187471 - BLOCK
      ?auto_187472 - BLOCK
    )
    :vars
    (
      ?auto_187473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187472 ?auto_187473 ) ( ON-TABLE ?auto_187463 ) ( ON ?auto_187464 ?auto_187463 ) ( ON ?auto_187465 ?auto_187464 ) ( ON ?auto_187466 ?auto_187465 ) ( ON ?auto_187467 ?auto_187466 ) ( ON ?auto_187468 ?auto_187467 ) ( not ( = ?auto_187463 ?auto_187464 ) ) ( not ( = ?auto_187463 ?auto_187465 ) ) ( not ( = ?auto_187463 ?auto_187466 ) ) ( not ( = ?auto_187463 ?auto_187467 ) ) ( not ( = ?auto_187463 ?auto_187468 ) ) ( not ( = ?auto_187463 ?auto_187469 ) ) ( not ( = ?auto_187463 ?auto_187470 ) ) ( not ( = ?auto_187463 ?auto_187471 ) ) ( not ( = ?auto_187463 ?auto_187472 ) ) ( not ( = ?auto_187463 ?auto_187473 ) ) ( not ( = ?auto_187464 ?auto_187465 ) ) ( not ( = ?auto_187464 ?auto_187466 ) ) ( not ( = ?auto_187464 ?auto_187467 ) ) ( not ( = ?auto_187464 ?auto_187468 ) ) ( not ( = ?auto_187464 ?auto_187469 ) ) ( not ( = ?auto_187464 ?auto_187470 ) ) ( not ( = ?auto_187464 ?auto_187471 ) ) ( not ( = ?auto_187464 ?auto_187472 ) ) ( not ( = ?auto_187464 ?auto_187473 ) ) ( not ( = ?auto_187465 ?auto_187466 ) ) ( not ( = ?auto_187465 ?auto_187467 ) ) ( not ( = ?auto_187465 ?auto_187468 ) ) ( not ( = ?auto_187465 ?auto_187469 ) ) ( not ( = ?auto_187465 ?auto_187470 ) ) ( not ( = ?auto_187465 ?auto_187471 ) ) ( not ( = ?auto_187465 ?auto_187472 ) ) ( not ( = ?auto_187465 ?auto_187473 ) ) ( not ( = ?auto_187466 ?auto_187467 ) ) ( not ( = ?auto_187466 ?auto_187468 ) ) ( not ( = ?auto_187466 ?auto_187469 ) ) ( not ( = ?auto_187466 ?auto_187470 ) ) ( not ( = ?auto_187466 ?auto_187471 ) ) ( not ( = ?auto_187466 ?auto_187472 ) ) ( not ( = ?auto_187466 ?auto_187473 ) ) ( not ( = ?auto_187467 ?auto_187468 ) ) ( not ( = ?auto_187467 ?auto_187469 ) ) ( not ( = ?auto_187467 ?auto_187470 ) ) ( not ( = ?auto_187467 ?auto_187471 ) ) ( not ( = ?auto_187467 ?auto_187472 ) ) ( not ( = ?auto_187467 ?auto_187473 ) ) ( not ( = ?auto_187468 ?auto_187469 ) ) ( not ( = ?auto_187468 ?auto_187470 ) ) ( not ( = ?auto_187468 ?auto_187471 ) ) ( not ( = ?auto_187468 ?auto_187472 ) ) ( not ( = ?auto_187468 ?auto_187473 ) ) ( not ( = ?auto_187469 ?auto_187470 ) ) ( not ( = ?auto_187469 ?auto_187471 ) ) ( not ( = ?auto_187469 ?auto_187472 ) ) ( not ( = ?auto_187469 ?auto_187473 ) ) ( not ( = ?auto_187470 ?auto_187471 ) ) ( not ( = ?auto_187470 ?auto_187472 ) ) ( not ( = ?auto_187470 ?auto_187473 ) ) ( not ( = ?auto_187471 ?auto_187472 ) ) ( not ( = ?auto_187471 ?auto_187473 ) ) ( not ( = ?auto_187472 ?auto_187473 ) ) ( ON ?auto_187471 ?auto_187472 ) ( ON ?auto_187470 ?auto_187471 ) ( CLEAR ?auto_187468 ) ( ON ?auto_187469 ?auto_187470 ) ( CLEAR ?auto_187469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187463 ?auto_187464 ?auto_187465 ?auto_187466 ?auto_187467 ?auto_187468 ?auto_187469 )
      ( MAKE-10PILE ?auto_187463 ?auto_187464 ?auto_187465 ?auto_187466 ?auto_187467 ?auto_187468 ?auto_187469 ?auto_187470 ?auto_187471 ?auto_187472 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187484 - BLOCK
      ?auto_187485 - BLOCK
      ?auto_187486 - BLOCK
      ?auto_187487 - BLOCK
      ?auto_187488 - BLOCK
      ?auto_187489 - BLOCK
      ?auto_187490 - BLOCK
      ?auto_187491 - BLOCK
      ?auto_187492 - BLOCK
      ?auto_187493 - BLOCK
    )
    :vars
    (
      ?auto_187494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187493 ?auto_187494 ) ( ON-TABLE ?auto_187484 ) ( ON ?auto_187485 ?auto_187484 ) ( ON ?auto_187486 ?auto_187485 ) ( ON ?auto_187487 ?auto_187486 ) ( ON ?auto_187488 ?auto_187487 ) ( ON ?auto_187489 ?auto_187488 ) ( not ( = ?auto_187484 ?auto_187485 ) ) ( not ( = ?auto_187484 ?auto_187486 ) ) ( not ( = ?auto_187484 ?auto_187487 ) ) ( not ( = ?auto_187484 ?auto_187488 ) ) ( not ( = ?auto_187484 ?auto_187489 ) ) ( not ( = ?auto_187484 ?auto_187490 ) ) ( not ( = ?auto_187484 ?auto_187491 ) ) ( not ( = ?auto_187484 ?auto_187492 ) ) ( not ( = ?auto_187484 ?auto_187493 ) ) ( not ( = ?auto_187484 ?auto_187494 ) ) ( not ( = ?auto_187485 ?auto_187486 ) ) ( not ( = ?auto_187485 ?auto_187487 ) ) ( not ( = ?auto_187485 ?auto_187488 ) ) ( not ( = ?auto_187485 ?auto_187489 ) ) ( not ( = ?auto_187485 ?auto_187490 ) ) ( not ( = ?auto_187485 ?auto_187491 ) ) ( not ( = ?auto_187485 ?auto_187492 ) ) ( not ( = ?auto_187485 ?auto_187493 ) ) ( not ( = ?auto_187485 ?auto_187494 ) ) ( not ( = ?auto_187486 ?auto_187487 ) ) ( not ( = ?auto_187486 ?auto_187488 ) ) ( not ( = ?auto_187486 ?auto_187489 ) ) ( not ( = ?auto_187486 ?auto_187490 ) ) ( not ( = ?auto_187486 ?auto_187491 ) ) ( not ( = ?auto_187486 ?auto_187492 ) ) ( not ( = ?auto_187486 ?auto_187493 ) ) ( not ( = ?auto_187486 ?auto_187494 ) ) ( not ( = ?auto_187487 ?auto_187488 ) ) ( not ( = ?auto_187487 ?auto_187489 ) ) ( not ( = ?auto_187487 ?auto_187490 ) ) ( not ( = ?auto_187487 ?auto_187491 ) ) ( not ( = ?auto_187487 ?auto_187492 ) ) ( not ( = ?auto_187487 ?auto_187493 ) ) ( not ( = ?auto_187487 ?auto_187494 ) ) ( not ( = ?auto_187488 ?auto_187489 ) ) ( not ( = ?auto_187488 ?auto_187490 ) ) ( not ( = ?auto_187488 ?auto_187491 ) ) ( not ( = ?auto_187488 ?auto_187492 ) ) ( not ( = ?auto_187488 ?auto_187493 ) ) ( not ( = ?auto_187488 ?auto_187494 ) ) ( not ( = ?auto_187489 ?auto_187490 ) ) ( not ( = ?auto_187489 ?auto_187491 ) ) ( not ( = ?auto_187489 ?auto_187492 ) ) ( not ( = ?auto_187489 ?auto_187493 ) ) ( not ( = ?auto_187489 ?auto_187494 ) ) ( not ( = ?auto_187490 ?auto_187491 ) ) ( not ( = ?auto_187490 ?auto_187492 ) ) ( not ( = ?auto_187490 ?auto_187493 ) ) ( not ( = ?auto_187490 ?auto_187494 ) ) ( not ( = ?auto_187491 ?auto_187492 ) ) ( not ( = ?auto_187491 ?auto_187493 ) ) ( not ( = ?auto_187491 ?auto_187494 ) ) ( not ( = ?auto_187492 ?auto_187493 ) ) ( not ( = ?auto_187492 ?auto_187494 ) ) ( not ( = ?auto_187493 ?auto_187494 ) ) ( ON ?auto_187492 ?auto_187493 ) ( ON ?auto_187491 ?auto_187492 ) ( CLEAR ?auto_187489 ) ( ON ?auto_187490 ?auto_187491 ) ( CLEAR ?auto_187490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187484 ?auto_187485 ?auto_187486 ?auto_187487 ?auto_187488 ?auto_187489 ?auto_187490 )
      ( MAKE-10PILE ?auto_187484 ?auto_187485 ?auto_187486 ?auto_187487 ?auto_187488 ?auto_187489 ?auto_187490 ?auto_187491 ?auto_187492 ?auto_187493 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187505 - BLOCK
      ?auto_187506 - BLOCK
      ?auto_187507 - BLOCK
      ?auto_187508 - BLOCK
      ?auto_187509 - BLOCK
      ?auto_187510 - BLOCK
      ?auto_187511 - BLOCK
      ?auto_187512 - BLOCK
      ?auto_187513 - BLOCK
      ?auto_187514 - BLOCK
    )
    :vars
    (
      ?auto_187515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187514 ?auto_187515 ) ( ON-TABLE ?auto_187505 ) ( ON ?auto_187506 ?auto_187505 ) ( ON ?auto_187507 ?auto_187506 ) ( ON ?auto_187508 ?auto_187507 ) ( ON ?auto_187509 ?auto_187508 ) ( not ( = ?auto_187505 ?auto_187506 ) ) ( not ( = ?auto_187505 ?auto_187507 ) ) ( not ( = ?auto_187505 ?auto_187508 ) ) ( not ( = ?auto_187505 ?auto_187509 ) ) ( not ( = ?auto_187505 ?auto_187510 ) ) ( not ( = ?auto_187505 ?auto_187511 ) ) ( not ( = ?auto_187505 ?auto_187512 ) ) ( not ( = ?auto_187505 ?auto_187513 ) ) ( not ( = ?auto_187505 ?auto_187514 ) ) ( not ( = ?auto_187505 ?auto_187515 ) ) ( not ( = ?auto_187506 ?auto_187507 ) ) ( not ( = ?auto_187506 ?auto_187508 ) ) ( not ( = ?auto_187506 ?auto_187509 ) ) ( not ( = ?auto_187506 ?auto_187510 ) ) ( not ( = ?auto_187506 ?auto_187511 ) ) ( not ( = ?auto_187506 ?auto_187512 ) ) ( not ( = ?auto_187506 ?auto_187513 ) ) ( not ( = ?auto_187506 ?auto_187514 ) ) ( not ( = ?auto_187506 ?auto_187515 ) ) ( not ( = ?auto_187507 ?auto_187508 ) ) ( not ( = ?auto_187507 ?auto_187509 ) ) ( not ( = ?auto_187507 ?auto_187510 ) ) ( not ( = ?auto_187507 ?auto_187511 ) ) ( not ( = ?auto_187507 ?auto_187512 ) ) ( not ( = ?auto_187507 ?auto_187513 ) ) ( not ( = ?auto_187507 ?auto_187514 ) ) ( not ( = ?auto_187507 ?auto_187515 ) ) ( not ( = ?auto_187508 ?auto_187509 ) ) ( not ( = ?auto_187508 ?auto_187510 ) ) ( not ( = ?auto_187508 ?auto_187511 ) ) ( not ( = ?auto_187508 ?auto_187512 ) ) ( not ( = ?auto_187508 ?auto_187513 ) ) ( not ( = ?auto_187508 ?auto_187514 ) ) ( not ( = ?auto_187508 ?auto_187515 ) ) ( not ( = ?auto_187509 ?auto_187510 ) ) ( not ( = ?auto_187509 ?auto_187511 ) ) ( not ( = ?auto_187509 ?auto_187512 ) ) ( not ( = ?auto_187509 ?auto_187513 ) ) ( not ( = ?auto_187509 ?auto_187514 ) ) ( not ( = ?auto_187509 ?auto_187515 ) ) ( not ( = ?auto_187510 ?auto_187511 ) ) ( not ( = ?auto_187510 ?auto_187512 ) ) ( not ( = ?auto_187510 ?auto_187513 ) ) ( not ( = ?auto_187510 ?auto_187514 ) ) ( not ( = ?auto_187510 ?auto_187515 ) ) ( not ( = ?auto_187511 ?auto_187512 ) ) ( not ( = ?auto_187511 ?auto_187513 ) ) ( not ( = ?auto_187511 ?auto_187514 ) ) ( not ( = ?auto_187511 ?auto_187515 ) ) ( not ( = ?auto_187512 ?auto_187513 ) ) ( not ( = ?auto_187512 ?auto_187514 ) ) ( not ( = ?auto_187512 ?auto_187515 ) ) ( not ( = ?auto_187513 ?auto_187514 ) ) ( not ( = ?auto_187513 ?auto_187515 ) ) ( not ( = ?auto_187514 ?auto_187515 ) ) ( ON ?auto_187513 ?auto_187514 ) ( ON ?auto_187512 ?auto_187513 ) ( ON ?auto_187511 ?auto_187512 ) ( CLEAR ?auto_187509 ) ( ON ?auto_187510 ?auto_187511 ) ( CLEAR ?auto_187510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187505 ?auto_187506 ?auto_187507 ?auto_187508 ?auto_187509 ?auto_187510 )
      ( MAKE-10PILE ?auto_187505 ?auto_187506 ?auto_187507 ?auto_187508 ?auto_187509 ?auto_187510 ?auto_187511 ?auto_187512 ?auto_187513 ?auto_187514 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187526 - BLOCK
      ?auto_187527 - BLOCK
      ?auto_187528 - BLOCK
      ?auto_187529 - BLOCK
      ?auto_187530 - BLOCK
      ?auto_187531 - BLOCK
      ?auto_187532 - BLOCK
      ?auto_187533 - BLOCK
      ?auto_187534 - BLOCK
      ?auto_187535 - BLOCK
    )
    :vars
    (
      ?auto_187536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187535 ?auto_187536 ) ( ON-TABLE ?auto_187526 ) ( ON ?auto_187527 ?auto_187526 ) ( ON ?auto_187528 ?auto_187527 ) ( ON ?auto_187529 ?auto_187528 ) ( ON ?auto_187530 ?auto_187529 ) ( not ( = ?auto_187526 ?auto_187527 ) ) ( not ( = ?auto_187526 ?auto_187528 ) ) ( not ( = ?auto_187526 ?auto_187529 ) ) ( not ( = ?auto_187526 ?auto_187530 ) ) ( not ( = ?auto_187526 ?auto_187531 ) ) ( not ( = ?auto_187526 ?auto_187532 ) ) ( not ( = ?auto_187526 ?auto_187533 ) ) ( not ( = ?auto_187526 ?auto_187534 ) ) ( not ( = ?auto_187526 ?auto_187535 ) ) ( not ( = ?auto_187526 ?auto_187536 ) ) ( not ( = ?auto_187527 ?auto_187528 ) ) ( not ( = ?auto_187527 ?auto_187529 ) ) ( not ( = ?auto_187527 ?auto_187530 ) ) ( not ( = ?auto_187527 ?auto_187531 ) ) ( not ( = ?auto_187527 ?auto_187532 ) ) ( not ( = ?auto_187527 ?auto_187533 ) ) ( not ( = ?auto_187527 ?auto_187534 ) ) ( not ( = ?auto_187527 ?auto_187535 ) ) ( not ( = ?auto_187527 ?auto_187536 ) ) ( not ( = ?auto_187528 ?auto_187529 ) ) ( not ( = ?auto_187528 ?auto_187530 ) ) ( not ( = ?auto_187528 ?auto_187531 ) ) ( not ( = ?auto_187528 ?auto_187532 ) ) ( not ( = ?auto_187528 ?auto_187533 ) ) ( not ( = ?auto_187528 ?auto_187534 ) ) ( not ( = ?auto_187528 ?auto_187535 ) ) ( not ( = ?auto_187528 ?auto_187536 ) ) ( not ( = ?auto_187529 ?auto_187530 ) ) ( not ( = ?auto_187529 ?auto_187531 ) ) ( not ( = ?auto_187529 ?auto_187532 ) ) ( not ( = ?auto_187529 ?auto_187533 ) ) ( not ( = ?auto_187529 ?auto_187534 ) ) ( not ( = ?auto_187529 ?auto_187535 ) ) ( not ( = ?auto_187529 ?auto_187536 ) ) ( not ( = ?auto_187530 ?auto_187531 ) ) ( not ( = ?auto_187530 ?auto_187532 ) ) ( not ( = ?auto_187530 ?auto_187533 ) ) ( not ( = ?auto_187530 ?auto_187534 ) ) ( not ( = ?auto_187530 ?auto_187535 ) ) ( not ( = ?auto_187530 ?auto_187536 ) ) ( not ( = ?auto_187531 ?auto_187532 ) ) ( not ( = ?auto_187531 ?auto_187533 ) ) ( not ( = ?auto_187531 ?auto_187534 ) ) ( not ( = ?auto_187531 ?auto_187535 ) ) ( not ( = ?auto_187531 ?auto_187536 ) ) ( not ( = ?auto_187532 ?auto_187533 ) ) ( not ( = ?auto_187532 ?auto_187534 ) ) ( not ( = ?auto_187532 ?auto_187535 ) ) ( not ( = ?auto_187532 ?auto_187536 ) ) ( not ( = ?auto_187533 ?auto_187534 ) ) ( not ( = ?auto_187533 ?auto_187535 ) ) ( not ( = ?auto_187533 ?auto_187536 ) ) ( not ( = ?auto_187534 ?auto_187535 ) ) ( not ( = ?auto_187534 ?auto_187536 ) ) ( not ( = ?auto_187535 ?auto_187536 ) ) ( ON ?auto_187534 ?auto_187535 ) ( ON ?auto_187533 ?auto_187534 ) ( ON ?auto_187532 ?auto_187533 ) ( CLEAR ?auto_187530 ) ( ON ?auto_187531 ?auto_187532 ) ( CLEAR ?auto_187531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187526 ?auto_187527 ?auto_187528 ?auto_187529 ?auto_187530 ?auto_187531 )
      ( MAKE-10PILE ?auto_187526 ?auto_187527 ?auto_187528 ?auto_187529 ?auto_187530 ?auto_187531 ?auto_187532 ?auto_187533 ?auto_187534 ?auto_187535 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187547 - BLOCK
      ?auto_187548 - BLOCK
      ?auto_187549 - BLOCK
      ?auto_187550 - BLOCK
      ?auto_187551 - BLOCK
      ?auto_187552 - BLOCK
      ?auto_187553 - BLOCK
      ?auto_187554 - BLOCK
      ?auto_187555 - BLOCK
      ?auto_187556 - BLOCK
    )
    :vars
    (
      ?auto_187557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187556 ?auto_187557 ) ( ON-TABLE ?auto_187547 ) ( ON ?auto_187548 ?auto_187547 ) ( ON ?auto_187549 ?auto_187548 ) ( ON ?auto_187550 ?auto_187549 ) ( not ( = ?auto_187547 ?auto_187548 ) ) ( not ( = ?auto_187547 ?auto_187549 ) ) ( not ( = ?auto_187547 ?auto_187550 ) ) ( not ( = ?auto_187547 ?auto_187551 ) ) ( not ( = ?auto_187547 ?auto_187552 ) ) ( not ( = ?auto_187547 ?auto_187553 ) ) ( not ( = ?auto_187547 ?auto_187554 ) ) ( not ( = ?auto_187547 ?auto_187555 ) ) ( not ( = ?auto_187547 ?auto_187556 ) ) ( not ( = ?auto_187547 ?auto_187557 ) ) ( not ( = ?auto_187548 ?auto_187549 ) ) ( not ( = ?auto_187548 ?auto_187550 ) ) ( not ( = ?auto_187548 ?auto_187551 ) ) ( not ( = ?auto_187548 ?auto_187552 ) ) ( not ( = ?auto_187548 ?auto_187553 ) ) ( not ( = ?auto_187548 ?auto_187554 ) ) ( not ( = ?auto_187548 ?auto_187555 ) ) ( not ( = ?auto_187548 ?auto_187556 ) ) ( not ( = ?auto_187548 ?auto_187557 ) ) ( not ( = ?auto_187549 ?auto_187550 ) ) ( not ( = ?auto_187549 ?auto_187551 ) ) ( not ( = ?auto_187549 ?auto_187552 ) ) ( not ( = ?auto_187549 ?auto_187553 ) ) ( not ( = ?auto_187549 ?auto_187554 ) ) ( not ( = ?auto_187549 ?auto_187555 ) ) ( not ( = ?auto_187549 ?auto_187556 ) ) ( not ( = ?auto_187549 ?auto_187557 ) ) ( not ( = ?auto_187550 ?auto_187551 ) ) ( not ( = ?auto_187550 ?auto_187552 ) ) ( not ( = ?auto_187550 ?auto_187553 ) ) ( not ( = ?auto_187550 ?auto_187554 ) ) ( not ( = ?auto_187550 ?auto_187555 ) ) ( not ( = ?auto_187550 ?auto_187556 ) ) ( not ( = ?auto_187550 ?auto_187557 ) ) ( not ( = ?auto_187551 ?auto_187552 ) ) ( not ( = ?auto_187551 ?auto_187553 ) ) ( not ( = ?auto_187551 ?auto_187554 ) ) ( not ( = ?auto_187551 ?auto_187555 ) ) ( not ( = ?auto_187551 ?auto_187556 ) ) ( not ( = ?auto_187551 ?auto_187557 ) ) ( not ( = ?auto_187552 ?auto_187553 ) ) ( not ( = ?auto_187552 ?auto_187554 ) ) ( not ( = ?auto_187552 ?auto_187555 ) ) ( not ( = ?auto_187552 ?auto_187556 ) ) ( not ( = ?auto_187552 ?auto_187557 ) ) ( not ( = ?auto_187553 ?auto_187554 ) ) ( not ( = ?auto_187553 ?auto_187555 ) ) ( not ( = ?auto_187553 ?auto_187556 ) ) ( not ( = ?auto_187553 ?auto_187557 ) ) ( not ( = ?auto_187554 ?auto_187555 ) ) ( not ( = ?auto_187554 ?auto_187556 ) ) ( not ( = ?auto_187554 ?auto_187557 ) ) ( not ( = ?auto_187555 ?auto_187556 ) ) ( not ( = ?auto_187555 ?auto_187557 ) ) ( not ( = ?auto_187556 ?auto_187557 ) ) ( ON ?auto_187555 ?auto_187556 ) ( ON ?auto_187554 ?auto_187555 ) ( ON ?auto_187553 ?auto_187554 ) ( ON ?auto_187552 ?auto_187553 ) ( CLEAR ?auto_187550 ) ( ON ?auto_187551 ?auto_187552 ) ( CLEAR ?auto_187551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187547 ?auto_187548 ?auto_187549 ?auto_187550 ?auto_187551 )
      ( MAKE-10PILE ?auto_187547 ?auto_187548 ?auto_187549 ?auto_187550 ?auto_187551 ?auto_187552 ?auto_187553 ?auto_187554 ?auto_187555 ?auto_187556 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187568 - BLOCK
      ?auto_187569 - BLOCK
      ?auto_187570 - BLOCK
      ?auto_187571 - BLOCK
      ?auto_187572 - BLOCK
      ?auto_187573 - BLOCK
      ?auto_187574 - BLOCK
      ?auto_187575 - BLOCK
      ?auto_187576 - BLOCK
      ?auto_187577 - BLOCK
    )
    :vars
    (
      ?auto_187578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187577 ?auto_187578 ) ( ON-TABLE ?auto_187568 ) ( ON ?auto_187569 ?auto_187568 ) ( ON ?auto_187570 ?auto_187569 ) ( ON ?auto_187571 ?auto_187570 ) ( not ( = ?auto_187568 ?auto_187569 ) ) ( not ( = ?auto_187568 ?auto_187570 ) ) ( not ( = ?auto_187568 ?auto_187571 ) ) ( not ( = ?auto_187568 ?auto_187572 ) ) ( not ( = ?auto_187568 ?auto_187573 ) ) ( not ( = ?auto_187568 ?auto_187574 ) ) ( not ( = ?auto_187568 ?auto_187575 ) ) ( not ( = ?auto_187568 ?auto_187576 ) ) ( not ( = ?auto_187568 ?auto_187577 ) ) ( not ( = ?auto_187568 ?auto_187578 ) ) ( not ( = ?auto_187569 ?auto_187570 ) ) ( not ( = ?auto_187569 ?auto_187571 ) ) ( not ( = ?auto_187569 ?auto_187572 ) ) ( not ( = ?auto_187569 ?auto_187573 ) ) ( not ( = ?auto_187569 ?auto_187574 ) ) ( not ( = ?auto_187569 ?auto_187575 ) ) ( not ( = ?auto_187569 ?auto_187576 ) ) ( not ( = ?auto_187569 ?auto_187577 ) ) ( not ( = ?auto_187569 ?auto_187578 ) ) ( not ( = ?auto_187570 ?auto_187571 ) ) ( not ( = ?auto_187570 ?auto_187572 ) ) ( not ( = ?auto_187570 ?auto_187573 ) ) ( not ( = ?auto_187570 ?auto_187574 ) ) ( not ( = ?auto_187570 ?auto_187575 ) ) ( not ( = ?auto_187570 ?auto_187576 ) ) ( not ( = ?auto_187570 ?auto_187577 ) ) ( not ( = ?auto_187570 ?auto_187578 ) ) ( not ( = ?auto_187571 ?auto_187572 ) ) ( not ( = ?auto_187571 ?auto_187573 ) ) ( not ( = ?auto_187571 ?auto_187574 ) ) ( not ( = ?auto_187571 ?auto_187575 ) ) ( not ( = ?auto_187571 ?auto_187576 ) ) ( not ( = ?auto_187571 ?auto_187577 ) ) ( not ( = ?auto_187571 ?auto_187578 ) ) ( not ( = ?auto_187572 ?auto_187573 ) ) ( not ( = ?auto_187572 ?auto_187574 ) ) ( not ( = ?auto_187572 ?auto_187575 ) ) ( not ( = ?auto_187572 ?auto_187576 ) ) ( not ( = ?auto_187572 ?auto_187577 ) ) ( not ( = ?auto_187572 ?auto_187578 ) ) ( not ( = ?auto_187573 ?auto_187574 ) ) ( not ( = ?auto_187573 ?auto_187575 ) ) ( not ( = ?auto_187573 ?auto_187576 ) ) ( not ( = ?auto_187573 ?auto_187577 ) ) ( not ( = ?auto_187573 ?auto_187578 ) ) ( not ( = ?auto_187574 ?auto_187575 ) ) ( not ( = ?auto_187574 ?auto_187576 ) ) ( not ( = ?auto_187574 ?auto_187577 ) ) ( not ( = ?auto_187574 ?auto_187578 ) ) ( not ( = ?auto_187575 ?auto_187576 ) ) ( not ( = ?auto_187575 ?auto_187577 ) ) ( not ( = ?auto_187575 ?auto_187578 ) ) ( not ( = ?auto_187576 ?auto_187577 ) ) ( not ( = ?auto_187576 ?auto_187578 ) ) ( not ( = ?auto_187577 ?auto_187578 ) ) ( ON ?auto_187576 ?auto_187577 ) ( ON ?auto_187575 ?auto_187576 ) ( ON ?auto_187574 ?auto_187575 ) ( ON ?auto_187573 ?auto_187574 ) ( CLEAR ?auto_187571 ) ( ON ?auto_187572 ?auto_187573 ) ( CLEAR ?auto_187572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187568 ?auto_187569 ?auto_187570 ?auto_187571 ?auto_187572 )
      ( MAKE-10PILE ?auto_187568 ?auto_187569 ?auto_187570 ?auto_187571 ?auto_187572 ?auto_187573 ?auto_187574 ?auto_187575 ?auto_187576 ?auto_187577 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187589 - BLOCK
      ?auto_187590 - BLOCK
      ?auto_187591 - BLOCK
      ?auto_187592 - BLOCK
      ?auto_187593 - BLOCK
      ?auto_187594 - BLOCK
      ?auto_187595 - BLOCK
      ?auto_187596 - BLOCK
      ?auto_187597 - BLOCK
      ?auto_187598 - BLOCK
    )
    :vars
    (
      ?auto_187599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187598 ?auto_187599 ) ( ON-TABLE ?auto_187589 ) ( ON ?auto_187590 ?auto_187589 ) ( ON ?auto_187591 ?auto_187590 ) ( not ( = ?auto_187589 ?auto_187590 ) ) ( not ( = ?auto_187589 ?auto_187591 ) ) ( not ( = ?auto_187589 ?auto_187592 ) ) ( not ( = ?auto_187589 ?auto_187593 ) ) ( not ( = ?auto_187589 ?auto_187594 ) ) ( not ( = ?auto_187589 ?auto_187595 ) ) ( not ( = ?auto_187589 ?auto_187596 ) ) ( not ( = ?auto_187589 ?auto_187597 ) ) ( not ( = ?auto_187589 ?auto_187598 ) ) ( not ( = ?auto_187589 ?auto_187599 ) ) ( not ( = ?auto_187590 ?auto_187591 ) ) ( not ( = ?auto_187590 ?auto_187592 ) ) ( not ( = ?auto_187590 ?auto_187593 ) ) ( not ( = ?auto_187590 ?auto_187594 ) ) ( not ( = ?auto_187590 ?auto_187595 ) ) ( not ( = ?auto_187590 ?auto_187596 ) ) ( not ( = ?auto_187590 ?auto_187597 ) ) ( not ( = ?auto_187590 ?auto_187598 ) ) ( not ( = ?auto_187590 ?auto_187599 ) ) ( not ( = ?auto_187591 ?auto_187592 ) ) ( not ( = ?auto_187591 ?auto_187593 ) ) ( not ( = ?auto_187591 ?auto_187594 ) ) ( not ( = ?auto_187591 ?auto_187595 ) ) ( not ( = ?auto_187591 ?auto_187596 ) ) ( not ( = ?auto_187591 ?auto_187597 ) ) ( not ( = ?auto_187591 ?auto_187598 ) ) ( not ( = ?auto_187591 ?auto_187599 ) ) ( not ( = ?auto_187592 ?auto_187593 ) ) ( not ( = ?auto_187592 ?auto_187594 ) ) ( not ( = ?auto_187592 ?auto_187595 ) ) ( not ( = ?auto_187592 ?auto_187596 ) ) ( not ( = ?auto_187592 ?auto_187597 ) ) ( not ( = ?auto_187592 ?auto_187598 ) ) ( not ( = ?auto_187592 ?auto_187599 ) ) ( not ( = ?auto_187593 ?auto_187594 ) ) ( not ( = ?auto_187593 ?auto_187595 ) ) ( not ( = ?auto_187593 ?auto_187596 ) ) ( not ( = ?auto_187593 ?auto_187597 ) ) ( not ( = ?auto_187593 ?auto_187598 ) ) ( not ( = ?auto_187593 ?auto_187599 ) ) ( not ( = ?auto_187594 ?auto_187595 ) ) ( not ( = ?auto_187594 ?auto_187596 ) ) ( not ( = ?auto_187594 ?auto_187597 ) ) ( not ( = ?auto_187594 ?auto_187598 ) ) ( not ( = ?auto_187594 ?auto_187599 ) ) ( not ( = ?auto_187595 ?auto_187596 ) ) ( not ( = ?auto_187595 ?auto_187597 ) ) ( not ( = ?auto_187595 ?auto_187598 ) ) ( not ( = ?auto_187595 ?auto_187599 ) ) ( not ( = ?auto_187596 ?auto_187597 ) ) ( not ( = ?auto_187596 ?auto_187598 ) ) ( not ( = ?auto_187596 ?auto_187599 ) ) ( not ( = ?auto_187597 ?auto_187598 ) ) ( not ( = ?auto_187597 ?auto_187599 ) ) ( not ( = ?auto_187598 ?auto_187599 ) ) ( ON ?auto_187597 ?auto_187598 ) ( ON ?auto_187596 ?auto_187597 ) ( ON ?auto_187595 ?auto_187596 ) ( ON ?auto_187594 ?auto_187595 ) ( ON ?auto_187593 ?auto_187594 ) ( CLEAR ?auto_187591 ) ( ON ?auto_187592 ?auto_187593 ) ( CLEAR ?auto_187592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187589 ?auto_187590 ?auto_187591 ?auto_187592 )
      ( MAKE-10PILE ?auto_187589 ?auto_187590 ?auto_187591 ?auto_187592 ?auto_187593 ?auto_187594 ?auto_187595 ?auto_187596 ?auto_187597 ?auto_187598 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187610 - BLOCK
      ?auto_187611 - BLOCK
      ?auto_187612 - BLOCK
      ?auto_187613 - BLOCK
      ?auto_187614 - BLOCK
      ?auto_187615 - BLOCK
      ?auto_187616 - BLOCK
      ?auto_187617 - BLOCK
      ?auto_187618 - BLOCK
      ?auto_187619 - BLOCK
    )
    :vars
    (
      ?auto_187620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187619 ?auto_187620 ) ( ON-TABLE ?auto_187610 ) ( ON ?auto_187611 ?auto_187610 ) ( ON ?auto_187612 ?auto_187611 ) ( not ( = ?auto_187610 ?auto_187611 ) ) ( not ( = ?auto_187610 ?auto_187612 ) ) ( not ( = ?auto_187610 ?auto_187613 ) ) ( not ( = ?auto_187610 ?auto_187614 ) ) ( not ( = ?auto_187610 ?auto_187615 ) ) ( not ( = ?auto_187610 ?auto_187616 ) ) ( not ( = ?auto_187610 ?auto_187617 ) ) ( not ( = ?auto_187610 ?auto_187618 ) ) ( not ( = ?auto_187610 ?auto_187619 ) ) ( not ( = ?auto_187610 ?auto_187620 ) ) ( not ( = ?auto_187611 ?auto_187612 ) ) ( not ( = ?auto_187611 ?auto_187613 ) ) ( not ( = ?auto_187611 ?auto_187614 ) ) ( not ( = ?auto_187611 ?auto_187615 ) ) ( not ( = ?auto_187611 ?auto_187616 ) ) ( not ( = ?auto_187611 ?auto_187617 ) ) ( not ( = ?auto_187611 ?auto_187618 ) ) ( not ( = ?auto_187611 ?auto_187619 ) ) ( not ( = ?auto_187611 ?auto_187620 ) ) ( not ( = ?auto_187612 ?auto_187613 ) ) ( not ( = ?auto_187612 ?auto_187614 ) ) ( not ( = ?auto_187612 ?auto_187615 ) ) ( not ( = ?auto_187612 ?auto_187616 ) ) ( not ( = ?auto_187612 ?auto_187617 ) ) ( not ( = ?auto_187612 ?auto_187618 ) ) ( not ( = ?auto_187612 ?auto_187619 ) ) ( not ( = ?auto_187612 ?auto_187620 ) ) ( not ( = ?auto_187613 ?auto_187614 ) ) ( not ( = ?auto_187613 ?auto_187615 ) ) ( not ( = ?auto_187613 ?auto_187616 ) ) ( not ( = ?auto_187613 ?auto_187617 ) ) ( not ( = ?auto_187613 ?auto_187618 ) ) ( not ( = ?auto_187613 ?auto_187619 ) ) ( not ( = ?auto_187613 ?auto_187620 ) ) ( not ( = ?auto_187614 ?auto_187615 ) ) ( not ( = ?auto_187614 ?auto_187616 ) ) ( not ( = ?auto_187614 ?auto_187617 ) ) ( not ( = ?auto_187614 ?auto_187618 ) ) ( not ( = ?auto_187614 ?auto_187619 ) ) ( not ( = ?auto_187614 ?auto_187620 ) ) ( not ( = ?auto_187615 ?auto_187616 ) ) ( not ( = ?auto_187615 ?auto_187617 ) ) ( not ( = ?auto_187615 ?auto_187618 ) ) ( not ( = ?auto_187615 ?auto_187619 ) ) ( not ( = ?auto_187615 ?auto_187620 ) ) ( not ( = ?auto_187616 ?auto_187617 ) ) ( not ( = ?auto_187616 ?auto_187618 ) ) ( not ( = ?auto_187616 ?auto_187619 ) ) ( not ( = ?auto_187616 ?auto_187620 ) ) ( not ( = ?auto_187617 ?auto_187618 ) ) ( not ( = ?auto_187617 ?auto_187619 ) ) ( not ( = ?auto_187617 ?auto_187620 ) ) ( not ( = ?auto_187618 ?auto_187619 ) ) ( not ( = ?auto_187618 ?auto_187620 ) ) ( not ( = ?auto_187619 ?auto_187620 ) ) ( ON ?auto_187618 ?auto_187619 ) ( ON ?auto_187617 ?auto_187618 ) ( ON ?auto_187616 ?auto_187617 ) ( ON ?auto_187615 ?auto_187616 ) ( ON ?auto_187614 ?auto_187615 ) ( CLEAR ?auto_187612 ) ( ON ?auto_187613 ?auto_187614 ) ( CLEAR ?auto_187613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187610 ?auto_187611 ?auto_187612 ?auto_187613 )
      ( MAKE-10PILE ?auto_187610 ?auto_187611 ?auto_187612 ?auto_187613 ?auto_187614 ?auto_187615 ?auto_187616 ?auto_187617 ?auto_187618 ?auto_187619 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187631 - BLOCK
      ?auto_187632 - BLOCK
      ?auto_187633 - BLOCK
      ?auto_187634 - BLOCK
      ?auto_187635 - BLOCK
      ?auto_187636 - BLOCK
      ?auto_187637 - BLOCK
      ?auto_187638 - BLOCK
      ?auto_187639 - BLOCK
      ?auto_187640 - BLOCK
    )
    :vars
    (
      ?auto_187641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187640 ?auto_187641 ) ( ON-TABLE ?auto_187631 ) ( ON ?auto_187632 ?auto_187631 ) ( not ( = ?auto_187631 ?auto_187632 ) ) ( not ( = ?auto_187631 ?auto_187633 ) ) ( not ( = ?auto_187631 ?auto_187634 ) ) ( not ( = ?auto_187631 ?auto_187635 ) ) ( not ( = ?auto_187631 ?auto_187636 ) ) ( not ( = ?auto_187631 ?auto_187637 ) ) ( not ( = ?auto_187631 ?auto_187638 ) ) ( not ( = ?auto_187631 ?auto_187639 ) ) ( not ( = ?auto_187631 ?auto_187640 ) ) ( not ( = ?auto_187631 ?auto_187641 ) ) ( not ( = ?auto_187632 ?auto_187633 ) ) ( not ( = ?auto_187632 ?auto_187634 ) ) ( not ( = ?auto_187632 ?auto_187635 ) ) ( not ( = ?auto_187632 ?auto_187636 ) ) ( not ( = ?auto_187632 ?auto_187637 ) ) ( not ( = ?auto_187632 ?auto_187638 ) ) ( not ( = ?auto_187632 ?auto_187639 ) ) ( not ( = ?auto_187632 ?auto_187640 ) ) ( not ( = ?auto_187632 ?auto_187641 ) ) ( not ( = ?auto_187633 ?auto_187634 ) ) ( not ( = ?auto_187633 ?auto_187635 ) ) ( not ( = ?auto_187633 ?auto_187636 ) ) ( not ( = ?auto_187633 ?auto_187637 ) ) ( not ( = ?auto_187633 ?auto_187638 ) ) ( not ( = ?auto_187633 ?auto_187639 ) ) ( not ( = ?auto_187633 ?auto_187640 ) ) ( not ( = ?auto_187633 ?auto_187641 ) ) ( not ( = ?auto_187634 ?auto_187635 ) ) ( not ( = ?auto_187634 ?auto_187636 ) ) ( not ( = ?auto_187634 ?auto_187637 ) ) ( not ( = ?auto_187634 ?auto_187638 ) ) ( not ( = ?auto_187634 ?auto_187639 ) ) ( not ( = ?auto_187634 ?auto_187640 ) ) ( not ( = ?auto_187634 ?auto_187641 ) ) ( not ( = ?auto_187635 ?auto_187636 ) ) ( not ( = ?auto_187635 ?auto_187637 ) ) ( not ( = ?auto_187635 ?auto_187638 ) ) ( not ( = ?auto_187635 ?auto_187639 ) ) ( not ( = ?auto_187635 ?auto_187640 ) ) ( not ( = ?auto_187635 ?auto_187641 ) ) ( not ( = ?auto_187636 ?auto_187637 ) ) ( not ( = ?auto_187636 ?auto_187638 ) ) ( not ( = ?auto_187636 ?auto_187639 ) ) ( not ( = ?auto_187636 ?auto_187640 ) ) ( not ( = ?auto_187636 ?auto_187641 ) ) ( not ( = ?auto_187637 ?auto_187638 ) ) ( not ( = ?auto_187637 ?auto_187639 ) ) ( not ( = ?auto_187637 ?auto_187640 ) ) ( not ( = ?auto_187637 ?auto_187641 ) ) ( not ( = ?auto_187638 ?auto_187639 ) ) ( not ( = ?auto_187638 ?auto_187640 ) ) ( not ( = ?auto_187638 ?auto_187641 ) ) ( not ( = ?auto_187639 ?auto_187640 ) ) ( not ( = ?auto_187639 ?auto_187641 ) ) ( not ( = ?auto_187640 ?auto_187641 ) ) ( ON ?auto_187639 ?auto_187640 ) ( ON ?auto_187638 ?auto_187639 ) ( ON ?auto_187637 ?auto_187638 ) ( ON ?auto_187636 ?auto_187637 ) ( ON ?auto_187635 ?auto_187636 ) ( ON ?auto_187634 ?auto_187635 ) ( CLEAR ?auto_187632 ) ( ON ?auto_187633 ?auto_187634 ) ( CLEAR ?auto_187633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187631 ?auto_187632 ?auto_187633 )
      ( MAKE-10PILE ?auto_187631 ?auto_187632 ?auto_187633 ?auto_187634 ?auto_187635 ?auto_187636 ?auto_187637 ?auto_187638 ?auto_187639 ?auto_187640 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187652 - BLOCK
      ?auto_187653 - BLOCK
      ?auto_187654 - BLOCK
      ?auto_187655 - BLOCK
      ?auto_187656 - BLOCK
      ?auto_187657 - BLOCK
      ?auto_187658 - BLOCK
      ?auto_187659 - BLOCK
      ?auto_187660 - BLOCK
      ?auto_187661 - BLOCK
    )
    :vars
    (
      ?auto_187662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187661 ?auto_187662 ) ( ON-TABLE ?auto_187652 ) ( ON ?auto_187653 ?auto_187652 ) ( not ( = ?auto_187652 ?auto_187653 ) ) ( not ( = ?auto_187652 ?auto_187654 ) ) ( not ( = ?auto_187652 ?auto_187655 ) ) ( not ( = ?auto_187652 ?auto_187656 ) ) ( not ( = ?auto_187652 ?auto_187657 ) ) ( not ( = ?auto_187652 ?auto_187658 ) ) ( not ( = ?auto_187652 ?auto_187659 ) ) ( not ( = ?auto_187652 ?auto_187660 ) ) ( not ( = ?auto_187652 ?auto_187661 ) ) ( not ( = ?auto_187652 ?auto_187662 ) ) ( not ( = ?auto_187653 ?auto_187654 ) ) ( not ( = ?auto_187653 ?auto_187655 ) ) ( not ( = ?auto_187653 ?auto_187656 ) ) ( not ( = ?auto_187653 ?auto_187657 ) ) ( not ( = ?auto_187653 ?auto_187658 ) ) ( not ( = ?auto_187653 ?auto_187659 ) ) ( not ( = ?auto_187653 ?auto_187660 ) ) ( not ( = ?auto_187653 ?auto_187661 ) ) ( not ( = ?auto_187653 ?auto_187662 ) ) ( not ( = ?auto_187654 ?auto_187655 ) ) ( not ( = ?auto_187654 ?auto_187656 ) ) ( not ( = ?auto_187654 ?auto_187657 ) ) ( not ( = ?auto_187654 ?auto_187658 ) ) ( not ( = ?auto_187654 ?auto_187659 ) ) ( not ( = ?auto_187654 ?auto_187660 ) ) ( not ( = ?auto_187654 ?auto_187661 ) ) ( not ( = ?auto_187654 ?auto_187662 ) ) ( not ( = ?auto_187655 ?auto_187656 ) ) ( not ( = ?auto_187655 ?auto_187657 ) ) ( not ( = ?auto_187655 ?auto_187658 ) ) ( not ( = ?auto_187655 ?auto_187659 ) ) ( not ( = ?auto_187655 ?auto_187660 ) ) ( not ( = ?auto_187655 ?auto_187661 ) ) ( not ( = ?auto_187655 ?auto_187662 ) ) ( not ( = ?auto_187656 ?auto_187657 ) ) ( not ( = ?auto_187656 ?auto_187658 ) ) ( not ( = ?auto_187656 ?auto_187659 ) ) ( not ( = ?auto_187656 ?auto_187660 ) ) ( not ( = ?auto_187656 ?auto_187661 ) ) ( not ( = ?auto_187656 ?auto_187662 ) ) ( not ( = ?auto_187657 ?auto_187658 ) ) ( not ( = ?auto_187657 ?auto_187659 ) ) ( not ( = ?auto_187657 ?auto_187660 ) ) ( not ( = ?auto_187657 ?auto_187661 ) ) ( not ( = ?auto_187657 ?auto_187662 ) ) ( not ( = ?auto_187658 ?auto_187659 ) ) ( not ( = ?auto_187658 ?auto_187660 ) ) ( not ( = ?auto_187658 ?auto_187661 ) ) ( not ( = ?auto_187658 ?auto_187662 ) ) ( not ( = ?auto_187659 ?auto_187660 ) ) ( not ( = ?auto_187659 ?auto_187661 ) ) ( not ( = ?auto_187659 ?auto_187662 ) ) ( not ( = ?auto_187660 ?auto_187661 ) ) ( not ( = ?auto_187660 ?auto_187662 ) ) ( not ( = ?auto_187661 ?auto_187662 ) ) ( ON ?auto_187660 ?auto_187661 ) ( ON ?auto_187659 ?auto_187660 ) ( ON ?auto_187658 ?auto_187659 ) ( ON ?auto_187657 ?auto_187658 ) ( ON ?auto_187656 ?auto_187657 ) ( ON ?auto_187655 ?auto_187656 ) ( CLEAR ?auto_187653 ) ( ON ?auto_187654 ?auto_187655 ) ( CLEAR ?auto_187654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187652 ?auto_187653 ?auto_187654 )
      ( MAKE-10PILE ?auto_187652 ?auto_187653 ?auto_187654 ?auto_187655 ?auto_187656 ?auto_187657 ?auto_187658 ?auto_187659 ?auto_187660 ?auto_187661 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187673 - BLOCK
      ?auto_187674 - BLOCK
      ?auto_187675 - BLOCK
      ?auto_187676 - BLOCK
      ?auto_187677 - BLOCK
      ?auto_187678 - BLOCK
      ?auto_187679 - BLOCK
      ?auto_187680 - BLOCK
      ?auto_187681 - BLOCK
      ?auto_187682 - BLOCK
    )
    :vars
    (
      ?auto_187683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187682 ?auto_187683 ) ( ON-TABLE ?auto_187673 ) ( not ( = ?auto_187673 ?auto_187674 ) ) ( not ( = ?auto_187673 ?auto_187675 ) ) ( not ( = ?auto_187673 ?auto_187676 ) ) ( not ( = ?auto_187673 ?auto_187677 ) ) ( not ( = ?auto_187673 ?auto_187678 ) ) ( not ( = ?auto_187673 ?auto_187679 ) ) ( not ( = ?auto_187673 ?auto_187680 ) ) ( not ( = ?auto_187673 ?auto_187681 ) ) ( not ( = ?auto_187673 ?auto_187682 ) ) ( not ( = ?auto_187673 ?auto_187683 ) ) ( not ( = ?auto_187674 ?auto_187675 ) ) ( not ( = ?auto_187674 ?auto_187676 ) ) ( not ( = ?auto_187674 ?auto_187677 ) ) ( not ( = ?auto_187674 ?auto_187678 ) ) ( not ( = ?auto_187674 ?auto_187679 ) ) ( not ( = ?auto_187674 ?auto_187680 ) ) ( not ( = ?auto_187674 ?auto_187681 ) ) ( not ( = ?auto_187674 ?auto_187682 ) ) ( not ( = ?auto_187674 ?auto_187683 ) ) ( not ( = ?auto_187675 ?auto_187676 ) ) ( not ( = ?auto_187675 ?auto_187677 ) ) ( not ( = ?auto_187675 ?auto_187678 ) ) ( not ( = ?auto_187675 ?auto_187679 ) ) ( not ( = ?auto_187675 ?auto_187680 ) ) ( not ( = ?auto_187675 ?auto_187681 ) ) ( not ( = ?auto_187675 ?auto_187682 ) ) ( not ( = ?auto_187675 ?auto_187683 ) ) ( not ( = ?auto_187676 ?auto_187677 ) ) ( not ( = ?auto_187676 ?auto_187678 ) ) ( not ( = ?auto_187676 ?auto_187679 ) ) ( not ( = ?auto_187676 ?auto_187680 ) ) ( not ( = ?auto_187676 ?auto_187681 ) ) ( not ( = ?auto_187676 ?auto_187682 ) ) ( not ( = ?auto_187676 ?auto_187683 ) ) ( not ( = ?auto_187677 ?auto_187678 ) ) ( not ( = ?auto_187677 ?auto_187679 ) ) ( not ( = ?auto_187677 ?auto_187680 ) ) ( not ( = ?auto_187677 ?auto_187681 ) ) ( not ( = ?auto_187677 ?auto_187682 ) ) ( not ( = ?auto_187677 ?auto_187683 ) ) ( not ( = ?auto_187678 ?auto_187679 ) ) ( not ( = ?auto_187678 ?auto_187680 ) ) ( not ( = ?auto_187678 ?auto_187681 ) ) ( not ( = ?auto_187678 ?auto_187682 ) ) ( not ( = ?auto_187678 ?auto_187683 ) ) ( not ( = ?auto_187679 ?auto_187680 ) ) ( not ( = ?auto_187679 ?auto_187681 ) ) ( not ( = ?auto_187679 ?auto_187682 ) ) ( not ( = ?auto_187679 ?auto_187683 ) ) ( not ( = ?auto_187680 ?auto_187681 ) ) ( not ( = ?auto_187680 ?auto_187682 ) ) ( not ( = ?auto_187680 ?auto_187683 ) ) ( not ( = ?auto_187681 ?auto_187682 ) ) ( not ( = ?auto_187681 ?auto_187683 ) ) ( not ( = ?auto_187682 ?auto_187683 ) ) ( ON ?auto_187681 ?auto_187682 ) ( ON ?auto_187680 ?auto_187681 ) ( ON ?auto_187679 ?auto_187680 ) ( ON ?auto_187678 ?auto_187679 ) ( ON ?auto_187677 ?auto_187678 ) ( ON ?auto_187676 ?auto_187677 ) ( ON ?auto_187675 ?auto_187676 ) ( CLEAR ?auto_187673 ) ( ON ?auto_187674 ?auto_187675 ) ( CLEAR ?auto_187674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187673 ?auto_187674 )
      ( MAKE-10PILE ?auto_187673 ?auto_187674 ?auto_187675 ?auto_187676 ?auto_187677 ?auto_187678 ?auto_187679 ?auto_187680 ?auto_187681 ?auto_187682 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187694 - BLOCK
      ?auto_187695 - BLOCK
      ?auto_187696 - BLOCK
      ?auto_187697 - BLOCK
      ?auto_187698 - BLOCK
      ?auto_187699 - BLOCK
      ?auto_187700 - BLOCK
      ?auto_187701 - BLOCK
      ?auto_187702 - BLOCK
      ?auto_187703 - BLOCK
    )
    :vars
    (
      ?auto_187704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187703 ?auto_187704 ) ( ON-TABLE ?auto_187694 ) ( not ( = ?auto_187694 ?auto_187695 ) ) ( not ( = ?auto_187694 ?auto_187696 ) ) ( not ( = ?auto_187694 ?auto_187697 ) ) ( not ( = ?auto_187694 ?auto_187698 ) ) ( not ( = ?auto_187694 ?auto_187699 ) ) ( not ( = ?auto_187694 ?auto_187700 ) ) ( not ( = ?auto_187694 ?auto_187701 ) ) ( not ( = ?auto_187694 ?auto_187702 ) ) ( not ( = ?auto_187694 ?auto_187703 ) ) ( not ( = ?auto_187694 ?auto_187704 ) ) ( not ( = ?auto_187695 ?auto_187696 ) ) ( not ( = ?auto_187695 ?auto_187697 ) ) ( not ( = ?auto_187695 ?auto_187698 ) ) ( not ( = ?auto_187695 ?auto_187699 ) ) ( not ( = ?auto_187695 ?auto_187700 ) ) ( not ( = ?auto_187695 ?auto_187701 ) ) ( not ( = ?auto_187695 ?auto_187702 ) ) ( not ( = ?auto_187695 ?auto_187703 ) ) ( not ( = ?auto_187695 ?auto_187704 ) ) ( not ( = ?auto_187696 ?auto_187697 ) ) ( not ( = ?auto_187696 ?auto_187698 ) ) ( not ( = ?auto_187696 ?auto_187699 ) ) ( not ( = ?auto_187696 ?auto_187700 ) ) ( not ( = ?auto_187696 ?auto_187701 ) ) ( not ( = ?auto_187696 ?auto_187702 ) ) ( not ( = ?auto_187696 ?auto_187703 ) ) ( not ( = ?auto_187696 ?auto_187704 ) ) ( not ( = ?auto_187697 ?auto_187698 ) ) ( not ( = ?auto_187697 ?auto_187699 ) ) ( not ( = ?auto_187697 ?auto_187700 ) ) ( not ( = ?auto_187697 ?auto_187701 ) ) ( not ( = ?auto_187697 ?auto_187702 ) ) ( not ( = ?auto_187697 ?auto_187703 ) ) ( not ( = ?auto_187697 ?auto_187704 ) ) ( not ( = ?auto_187698 ?auto_187699 ) ) ( not ( = ?auto_187698 ?auto_187700 ) ) ( not ( = ?auto_187698 ?auto_187701 ) ) ( not ( = ?auto_187698 ?auto_187702 ) ) ( not ( = ?auto_187698 ?auto_187703 ) ) ( not ( = ?auto_187698 ?auto_187704 ) ) ( not ( = ?auto_187699 ?auto_187700 ) ) ( not ( = ?auto_187699 ?auto_187701 ) ) ( not ( = ?auto_187699 ?auto_187702 ) ) ( not ( = ?auto_187699 ?auto_187703 ) ) ( not ( = ?auto_187699 ?auto_187704 ) ) ( not ( = ?auto_187700 ?auto_187701 ) ) ( not ( = ?auto_187700 ?auto_187702 ) ) ( not ( = ?auto_187700 ?auto_187703 ) ) ( not ( = ?auto_187700 ?auto_187704 ) ) ( not ( = ?auto_187701 ?auto_187702 ) ) ( not ( = ?auto_187701 ?auto_187703 ) ) ( not ( = ?auto_187701 ?auto_187704 ) ) ( not ( = ?auto_187702 ?auto_187703 ) ) ( not ( = ?auto_187702 ?auto_187704 ) ) ( not ( = ?auto_187703 ?auto_187704 ) ) ( ON ?auto_187702 ?auto_187703 ) ( ON ?auto_187701 ?auto_187702 ) ( ON ?auto_187700 ?auto_187701 ) ( ON ?auto_187699 ?auto_187700 ) ( ON ?auto_187698 ?auto_187699 ) ( ON ?auto_187697 ?auto_187698 ) ( ON ?auto_187696 ?auto_187697 ) ( CLEAR ?auto_187694 ) ( ON ?auto_187695 ?auto_187696 ) ( CLEAR ?auto_187695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187694 ?auto_187695 )
      ( MAKE-10PILE ?auto_187694 ?auto_187695 ?auto_187696 ?auto_187697 ?auto_187698 ?auto_187699 ?auto_187700 ?auto_187701 ?auto_187702 ?auto_187703 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187715 - BLOCK
      ?auto_187716 - BLOCK
      ?auto_187717 - BLOCK
      ?auto_187718 - BLOCK
      ?auto_187719 - BLOCK
      ?auto_187720 - BLOCK
      ?auto_187721 - BLOCK
      ?auto_187722 - BLOCK
      ?auto_187723 - BLOCK
      ?auto_187724 - BLOCK
    )
    :vars
    (
      ?auto_187725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187724 ?auto_187725 ) ( not ( = ?auto_187715 ?auto_187716 ) ) ( not ( = ?auto_187715 ?auto_187717 ) ) ( not ( = ?auto_187715 ?auto_187718 ) ) ( not ( = ?auto_187715 ?auto_187719 ) ) ( not ( = ?auto_187715 ?auto_187720 ) ) ( not ( = ?auto_187715 ?auto_187721 ) ) ( not ( = ?auto_187715 ?auto_187722 ) ) ( not ( = ?auto_187715 ?auto_187723 ) ) ( not ( = ?auto_187715 ?auto_187724 ) ) ( not ( = ?auto_187715 ?auto_187725 ) ) ( not ( = ?auto_187716 ?auto_187717 ) ) ( not ( = ?auto_187716 ?auto_187718 ) ) ( not ( = ?auto_187716 ?auto_187719 ) ) ( not ( = ?auto_187716 ?auto_187720 ) ) ( not ( = ?auto_187716 ?auto_187721 ) ) ( not ( = ?auto_187716 ?auto_187722 ) ) ( not ( = ?auto_187716 ?auto_187723 ) ) ( not ( = ?auto_187716 ?auto_187724 ) ) ( not ( = ?auto_187716 ?auto_187725 ) ) ( not ( = ?auto_187717 ?auto_187718 ) ) ( not ( = ?auto_187717 ?auto_187719 ) ) ( not ( = ?auto_187717 ?auto_187720 ) ) ( not ( = ?auto_187717 ?auto_187721 ) ) ( not ( = ?auto_187717 ?auto_187722 ) ) ( not ( = ?auto_187717 ?auto_187723 ) ) ( not ( = ?auto_187717 ?auto_187724 ) ) ( not ( = ?auto_187717 ?auto_187725 ) ) ( not ( = ?auto_187718 ?auto_187719 ) ) ( not ( = ?auto_187718 ?auto_187720 ) ) ( not ( = ?auto_187718 ?auto_187721 ) ) ( not ( = ?auto_187718 ?auto_187722 ) ) ( not ( = ?auto_187718 ?auto_187723 ) ) ( not ( = ?auto_187718 ?auto_187724 ) ) ( not ( = ?auto_187718 ?auto_187725 ) ) ( not ( = ?auto_187719 ?auto_187720 ) ) ( not ( = ?auto_187719 ?auto_187721 ) ) ( not ( = ?auto_187719 ?auto_187722 ) ) ( not ( = ?auto_187719 ?auto_187723 ) ) ( not ( = ?auto_187719 ?auto_187724 ) ) ( not ( = ?auto_187719 ?auto_187725 ) ) ( not ( = ?auto_187720 ?auto_187721 ) ) ( not ( = ?auto_187720 ?auto_187722 ) ) ( not ( = ?auto_187720 ?auto_187723 ) ) ( not ( = ?auto_187720 ?auto_187724 ) ) ( not ( = ?auto_187720 ?auto_187725 ) ) ( not ( = ?auto_187721 ?auto_187722 ) ) ( not ( = ?auto_187721 ?auto_187723 ) ) ( not ( = ?auto_187721 ?auto_187724 ) ) ( not ( = ?auto_187721 ?auto_187725 ) ) ( not ( = ?auto_187722 ?auto_187723 ) ) ( not ( = ?auto_187722 ?auto_187724 ) ) ( not ( = ?auto_187722 ?auto_187725 ) ) ( not ( = ?auto_187723 ?auto_187724 ) ) ( not ( = ?auto_187723 ?auto_187725 ) ) ( not ( = ?auto_187724 ?auto_187725 ) ) ( ON ?auto_187723 ?auto_187724 ) ( ON ?auto_187722 ?auto_187723 ) ( ON ?auto_187721 ?auto_187722 ) ( ON ?auto_187720 ?auto_187721 ) ( ON ?auto_187719 ?auto_187720 ) ( ON ?auto_187718 ?auto_187719 ) ( ON ?auto_187717 ?auto_187718 ) ( ON ?auto_187716 ?auto_187717 ) ( ON ?auto_187715 ?auto_187716 ) ( CLEAR ?auto_187715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_187715 )
      ( MAKE-10PILE ?auto_187715 ?auto_187716 ?auto_187717 ?auto_187718 ?auto_187719 ?auto_187720 ?auto_187721 ?auto_187722 ?auto_187723 ?auto_187724 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187736 - BLOCK
      ?auto_187737 - BLOCK
      ?auto_187738 - BLOCK
      ?auto_187739 - BLOCK
      ?auto_187740 - BLOCK
      ?auto_187741 - BLOCK
      ?auto_187742 - BLOCK
      ?auto_187743 - BLOCK
      ?auto_187744 - BLOCK
      ?auto_187745 - BLOCK
    )
    :vars
    (
      ?auto_187746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187745 ?auto_187746 ) ( not ( = ?auto_187736 ?auto_187737 ) ) ( not ( = ?auto_187736 ?auto_187738 ) ) ( not ( = ?auto_187736 ?auto_187739 ) ) ( not ( = ?auto_187736 ?auto_187740 ) ) ( not ( = ?auto_187736 ?auto_187741 ) ) ( not ( = ?auto_187736 ?auto_187742 ) ) ( not ( = ?auto_187736 ?auto_187743 ) ) ( not ( = ?auto_187736 ?auto_187744 ) ) ( not ( = ?auto_187736 ?auto_187745 ) ) ( not ( = ?auto_187736 ?auto_187746 ) ) ( not ( = ?auto_187737 ?auto_187738 ) ) ( not ( = ?auto_187737 ?auto_187739 ) ) ( not ( = ?auto_187737 ?auto_187740 ) ) ( not ( = ?auto_187737 ?auto_187741 ) ) ( not ( = ?auto_187737 ?auto_187742 ) ) ( not ( = ?auto_187737 ?auto_187743 ) ) ( not ( = ?auto_187737 ?auto_187744 ) ) ( not ( = ?auto_187737 ?auto_187745 ) ) ( not ( = ?auto_187737 ?auto_187746 ) ) ( not ( = ?auto_187738 ?auto_187739 ) ) ( not ( = ?auto_187738 ?auto_187740 ) ) ( not ( = ?auto_187738 ?auto_187741 ) ) ( not ( = ?auto_187738 ?auto_187742 ) ) ( not ( = ?auto_187738 ?auto_187743 ) ) ( not ( = ?auto_187738 ?auto_187744 ) ) ( not ( = ?auto_187738 ?auto_187745 ) ) ( not ( = ?auto_187738 ?auto_187746 ) ) ( not ( = ?auto_187739 ?auto_187740 ) ) ( not ( = ?auto_187739 ?auto_187741 ) ) ( not ( = ?auto_187739 ?auto_187742 ) ) ( not ( = ?auto_187739 ?auto_187743 ) ) ( not ( = ?auto_187739 ?auto_187744 ) ) ( not ( = ?auto_187739 ?auto_187745 ) ) ( not ( = ?auto_187739 ?auto_187746 ) ) ( not ( = ?auto_187740 ?auto_187741 ) ) ( not ( = ?auto_187740 ?auto_187742 ) ) ( not ( = ?auto_187740 ?auto_187743 ) ) ( not ( = ?auto_187740 ?auto_187744 ) ) ( not ( = ?auto_187740 ?auto_187745 ) ) ( not ( = ?auto_187740 ?auto_187746 ) ) ( not ( = ?auto_187741 ?auto_187742 ) ) ( not ( = ?auto_187741 ?auto_187743 ) ) ( not ( = ?auto_187741 ?auto_187744 ) ) ( not ( = ?auto_187741 ?auto_187745 ) ) ( not ( = ?auto_187741 ?auto_187746 ) ) ( not ( = ?auto_187742 ?auto_187743 ) ) ( not ( = ?auto_187742 ?auto_187744 ) ) ( not ( = ?auto_187742 ?auto_187745 ) ) ( not ( = ?auto_187742 ?auto_187746 ) ) ( not ( = ?auto_187743 ?auto_187744 ) ) ( not ( = ?auto_187743 ?auto_187745 ) ) ( not ( = ?auto_187743 ?auto_187746 ) ) ( not ( = ?auto_187744 ?auto_187745 ) ) ( not ( = ?auto_187744 ?auto_187746 ) ) ( not ( = ?auto_187745 ?auto_187746 ) ) ( ON ?auto_187744 ?auto_187745 ) ( ON ?auto_187743 ?auto_187744 ) ( ON ?auto_187742 ?auto_187743 ) ( ON ?auto_187741 ?auto_187742 ) ( ON ?auto_187740 ?auto_187741 ) ( ON ?auto_187739 ?auto_187740 ) ( ON ?auto_187738 ?auto_187739 ) ( ON ?auto_187737 ?auto_187738 ) ( ON ?auto_187736 ?auto_187737 ) ( CLEAR ?auto_187736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_187736 )
      ( MAKE-10PILE ?auto_187736 ?auto_187737 ?auto_187738 ?auto_187739 ?auto_187740 ?auto_187741 ?auto_187742 ?auto_187743 ?auto_187744 ?auto_187745 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_187758 - BLOCK
      ?auto_187759 - BLOCK
      ?auto_187760 - BLOCK
      ?auto_187761 - BLOCK
      ?auto_187762 - BLOCK
      ?auto_187763 - BLOCK
      ?auto_187764 - BLOCK
      ?auto_187765 - BLOCK
      ?auto_187766 - BLOCK
      ?auto_187767 - BLOCK
      ?auto_187768 - BLOCK
    )
    :vars
    (
      ?auto_187769 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_187767 ) ( ON ?auto_187768 ?auto_187769 ) ( CLEAR ?auto_187768 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_187758 ) ( ON ?auto_187759 ?auto_187758 ) ( ON ?auto_187760 ?auto_187759 ) ( ON ?auto_187761 ?auto_187760 ) ( ON ?auto_187762 ?auto_187761 ) ( ON ?auto_187763 ?auto_187762 ) ( ON ?auto_187764 ?auto_187763 ) ( ON ?auto_187765 ?auto_187764 ) ( ON ?auto_187766 ?auto_187765 ) ( ON ?auto_187767 ?auto_187766 ) ( not ( = ?auto_187758 ?auto_187759 ) ) ( not ( = ?auto_187758 ?auto_187760 ) ) ( not ( = ?auto_187758 ?auto_187761 ) ) ( not ( = ?auto_187758 ?auto_187762 ) ) ( not ( = ?auto_187758 ?auto_187763 ) ) ( not ( = ?auto_187758 ?auto_187764 ) ) ( not ( = ?auto_187758 ?auto_187765 ) ) ( not ( = ?auto_187758 ?auto_187766 ) ) ( not ( = ?auto_187758 ?auto_187767 ) ) ( not ( = ?auto_187758 ?auto_187768 ) ) ( not ( = ?auto_187758 ?auto_187769 ) ) ( not ( = ?auto_187759 ?auto_187760 ) ) ( not ( = ?auto_187759 ?auto_187761 ) ) ( not ( = ?auto_187759 ?auto_187762 ) ) ( not ( = ?auto_187759 ?auto_187763 ) ) ( not ( = ?auto_187759 ?auto_187764 ) ) ( not ( = ?auto_187759 ?auto_187765 ) ) ( not ( = ?auto_187759 ?auto_187766 ) ) ( not ( = ?auto_187759 ?auto_187767 ) ) ( not ( = ?auto_187759 ?auto_187768 ) ) ( not ( = ?auto_187759 ?auto_187769 ) ) ( not ( = ?auto_187760 ?auto_187761 ) ) ( not ( = ?auto_187760 ?auto_187762 ) ) ( not ( = ?auto_187760 ?auto_187763 ) ) ( not ( = ?auto_187760 ?auto_187764 ) ) ( not ( = ?auto_187760 ?auto_187765 ) ) ( not ( = ?auto_187760 ?auto_187766 ) ) ( not ( = ?auto_187760 ?auto_187767 ) ) ( not ( = ?auto_187760 ?auto_187768 ) ) ( not ( = ?auto_187760 ?auto_187769 ) ) ( not ( = ?auto_187761 ?auto_187762 ) ) ( not ( = ?auto_187761 ?auto_187763 ) ) ( not ( = ?auto_187761 ?auto_187764 ) ) ( not ( = ?auto_187761 ?auto_187765 ) ) ( not ( = ?auto_187761 ?auto_187766 ) ) ( not ( = ?auto_187761 ?auto_187767 ) ) ( not ( = ?auto_187761 ?auto_187768 ) ) ( not ( = ?auto_187761 ?auto_187769 ) ) ( not ( = ?auto_187762 ?auto_187763 ) ) ( not ( = ?auto_187762 ?auto_187764 ) ) ( not ( = ?auto_187762 ?auto_187765 ) ) ( not ( = ?auto_187762 ?auto_187766 ) ) ( not ( = ?auto_187762 ?auto_187767 ) ) ( not ( = ?auto_187762 ?auto_187768 ) ) ( not ( = ?auto_187762 ?auto_187769 ) ) ( not ( = ?auto_187763 ?auto_187764 ) ) ( not ( = ?auto_187763 ?auto_187765 ) ) ( not ( = ?auto_187763 ?auto_187766 ) ) ( not ( = ?auto_187763 ?auto_187767 ) ) ( not ( = ?auto_187763 ?auto_187768 ) ) ( not ( = ?auto_187763 ?auto_187769 ) ) ( not ( = ?auto_187764 ?auto_187765 ) ) ( not ( = ?auto_187764 ?auto_187766 ) ) ( not ( = ?auto_187764 ?auto_187767 ) ) ( not ( = ?auto_187764 ?auto_187768 ) ) ( not ( = ?auto_187764 ?auto_187769 ) ) ( not ( = ?auto_187765 ?auto_187766 ) ) ( not ( = ?auto_187765 ?auto_187767 ) ) ( not ( = ?auto_187765 ?auto_187768 ) ) ( not ( = ?auto_187765 ?auto_187769 ) ) ( not ( = ?auto_187766 ?auto_187767 ) ) ( not ( = ?auto_187766 ?auto_187768 ) ) ( not ( = ?auto_187766 ?auto_187769 ) ) ( not ( = ?auto_187767 ?auto_187768 ) ) ( not ( = ?auto_187767 ?auto_187769 ) ) ( not ( = ?auto_187768 ?auto_187769 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_187768 ?auto_187769 )
      ( !STACK ?auto_187768 ?auto_187767 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_187781 - BLOCK
      ?auto_187782 - BLOCK
      ?auto_187783 - BLOCK
      ?auto_187784 - BLOCK
      ?auto_187785 - BLOCK
      ?auto_187786 - BLOCK
      ?auto_187787 - BLOCK
      ?auto_187788 - BLOCK
      ?auto_187789 - BLOCK
      ?auto_187790 - BLOCK
      ?auto_187791 - BLOCK
    )
    :vars
    (
      ?auto_187792 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_187790 ) ( ON ?auto_187791 ?auto_187792 ) ( CLEAR ?auto_187791 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_187781 ) ( ON ?auto_187782 ?auto_187781 ) ( ON ?auto_187783 ?auto_187782 ) ( ON ?auto_187784 ?auto_187783 ) ( ON ?auto_187785 ?auto_187784 ) ( ON ?auto_187786 ?auto_187785 ) ( ON ?auto_187787 ?auto_187786 ) ( ON ?auto_187788 ?auto_187787 ) ( ON ?auto_187789 ?auto_187788 ) ( ON ?auto_187790 ?auto_187789 ) ( not ( = ?auto_187781 ?auto_187782 ) ) ( not ( = ?auto_187781 ?auto_187783 ) ) ( not ( = ?auto_187781 ?auto_187784 ) ) ( not ( = ?auto_187781 ?auto_187785 ) ) ( not ( = ?auto_187781 ?auto_187786 ) ) ( not ( = ?auto_187781 ?auto_187787 ) ) ( not ( = ?auto_187781 ?auto_187788 ) ) ( not ( = ?auto_187781 ?auto_187789 ) ) ( not ( = ?auto_187781 ?auto_187790 ) ) ( not ( = ?auto_187781 ?auto_187791 ) ) ( not ( = ?auto_187781 ?auto_187792 ) ) ( not ( = ?auto_187782 ?auto_187783 ) ) ( not ( = ?auto_187782 ?auto_187784 ) ) ( not ( = ?auto_187782 ?auto_187785 ) ) ( not ( = ?auto_187782 ?auto_187786 ) ) ( not ( = ?auto_187782 ?auto_187787 ) ) ( not ( = ?auto_187782 ?auto_187788 ) ) ( not ( = ?auto_187782 ?auto_187789 ) ) ( not ( = ?auto_187782 ?auto_187790 ) ) ( not ( = ?auto_187782 ?auto_187791 ) ) ( not ( = ?auto_187782 ?auto_187792 ) ) ( not ( = ?auto_187783 ?auto_187784 ) ) ( not ( = ?auto_187783 ?auto_187785 ) ) ( not ( = ?auto_187783 ?auto_187786 ) ) ( not ( = ?auto_187783 ?auto_187787 ) ) ( not ( = ?auto_187783 ?auto_187788 ) ) ( not ( = ?auto_187783 ?auto_187789 ) ) ( not ( = ?auto_187783 ?auto_187790 ) ) ( not ( = ?auto_187783 ?auto_187791 ) ) ( not ( = ?auto_187783 ?auto_187792 ) ) ( not ( = ?auto_187784 ?auto_187785 ) ) ( not ( = ?auto_187784 ?auto_187786 ) ) ( not ( = ?auto_187784 ?auto_187787 ) ) ( not ( = ?auto_187784 ?auto_187788 ) ) ( not ( = ?auto_187784 ?auto_187789 ) ) ( not ( = ?auto_187784 ?auto_187790 ) ) ( not ( = ?auto_187784 ?auto_187791 ) ) ( not ( = ?auto_187784 ?auto_187792 ) ) ( not ( = ?auto_187785 ?auto_187786 ) ) ( not ( = ?auto_187785 ?auto_187787 ) ) ( not ( = ?auto_187785 ?auto_187788 ) ) ( not ( = ?auto_187785 ?auto_187789 ) ) ( not ( = ?auto_187785 ?auto_187790 ) ) ( not ( = ?auto_187785 ?auto_187791 ) ) ( not ( = ?auto_187785 ?auto_187792 ) ) ( not ( = ?auto_187786 ?auto_187787 ) ) ( not ( = ?auto_187786 ?auto_187788 ) ) ( not ( = ?auto_187786 ?auto_187789 ) ) ( not ( = ?auto_187786 ?auto_187790 ) ) ( not ( = ?auto_187786 ?auto_187791 ) ) ( not ( = ?auto_187786 ?auto_187792 ) ) ( not ( = ?auto_187787 ?auto_187788 ) ) ( not ( = ?auto_187787 ?auto_187789 ) ) ( not ( = ?auto_187787 ?auto_187790 ) ) ( not ( = ?auto_187787 ?auto_187791 ) ) ( not ( = ?auto_187787 ?auto_187792 ) ) ( not ( = ?auto_187788 ?auto_187789 ) ) ( not ( = ?auto_187788 ?auto_187790 ) ) ( not ( = ?auto_187788 ?auto_187791 ) ) ( not ( = ?auto_187788 ?auto_187792 ) ) ( not ( = ?auto_187789 ?auto_187790 ) ) ( not ( = ?auto_187789 ?auto_187791 ) ) ( not ( = ?auto_187789 ?auto_187792 ) ) ( not ( = ?auto_187790 ?auto_187791 ) ) ( not ( = ?auto_187790 ?auto_187792 ) ) ( not ( = ?auto_187791 ?auto_187792 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_187791 ?auto_187792 )
      ( !STACK ?auto_187791 ?auto_187790 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_187804 - BLOCK
      ?auto_187805 - BLOCK
      ?auto_187806 - BLOCK
      ?auto_187807 - BLOCK
      ?auto_187808 - BLOCK
      ?auto_187809 - BLOCK
      ?auto_187810 - BLOCK
      ?auto_187811 - BLOCK
      ?auto_187812 - BLOCK
      ?auto_187813 - BLOCK
      ?auto_187814 - BLOCK
    )
    :vars
    (
      ?auto_187815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187814 ?auto_187815 ) ( ON-TABLE ?auto_187804 ) ( ON ?auto_187805 ?auto_187804 ) ( ON ?auto_187806 ?auto_187805 ) ( ON ?auto_187807 ?auto_187806 ) ( ON ?auto_187808 ?auto_187807 ) ( ON ?auto_187809 ?auto_187808 ) ( ON ?auto_187810 ?auto_187809 ) ( ON ?auto_187811 ?auto_187810 ) ( ON ?auto_187812 ?auto_187811 ) ( not ( = ?auto_187804 ?auto_187805 ) ) ( not ( = ?auto_187804 ?auto_187806 ) ) ( not ( = ?auto_187804 ?auto_187807 ) ) ( not ( = ?auto_187804 ?auto_187808 ) ) ( not ( = ?auto_187804 ?auto_187809 ) ) ( not ( = ?auto_187804 ?auto_187810 ) ) ( not ( = ?auto_187804 ?auto_187811 ) ) ( not ( = ?auto_187804 ?auto_187812 ) ) ( not ( = ?auto_187804 ?auto_187813 ) ) ( not ( = ?auto_187804 ?auto_187814 ) ) ( not ( = ?auto_187804 ?auto_187815 ) ) ( not ( = ?auto_187805 ?auto_187806 ) ) ( not ( = ?auto_187805 ?auto_187807 ) ) ( not ( = ?auto_187805 ?auto_187808 ) ) ( not ( = ?auto_187805 ?auto_187809 ) ) ( not ( = ?auto_187805 ?auto_187810 ) ) ( not ( = ?auto_187805 ?auto_187811 ) ) ( not ( = ?auto_187805 ?auto_187812 ) ) ( not ( = ?auto_187805 ?auto_187813 ) ) ( not ( = ?auto_187805 ?auto_187814 ) ) ( not ( = ?auto_187805 ?auto_187815 ) ) ( not ( = ?auto_187806 ?auto_187807 ) ) ( not ( = ?auto_187806 ?auto_187808 ) ) ( not ( = ?auto_187806 ?auto_187809 ) ) ( not ( = ?auto_187806 ?auto_187810 ) ) ( not ( = ?auto_187806 ?auto_187811 ) ) ( not ( = ?auto_187806 ?auto_187812 ) ) ( not ( = ?auto_187806 ?auto_187813 ) ) ( not ( = ?auto_187806 ?auto_187814 ) ) ( not ( = ?auto_187806 ?auto_187815 ) ) ( not ( = ?auto_187807 ?auto_187808 ) ) ( not ( = ?auto_187807 ?auto_187809 ) ) ( not ( = ?auto_187807 ?auto_187810 ) ) ( not ( = ?auto_187807 ?auto_187811 ) ) ( not ( = ?auto_187807 ?auto_187812 ) ) ( not ( = ?auto_187807 ?auto_187813 ) ) ( not ( = ?auto_187807 ?auto_187814 ) ) ( not ( = ?auto_187807 ?auto_187815 ) ) ( not ( = ?auto_187808 ?auto_187809 ) ) ( not ( = ?auto_187808 ?auto_187810 ) ) ( not ( = ?auto_187808 ?auto_187811 ) ) ( not ( = ?auto_187808 ?auto_187812 ) ) ( not ( = ?auto_187808 ?auto_187813 ) ) ( not ( = ?auto_187808 ?auto_187814 ) ) ( not ( = ?auto_187808 ?auto_187815 ) ) ( not ( = ?auto_187809 ?auto_187810 ) ) ( not ( = ?auto_187809 ?auto_187811 ) ) ( not ( = ?auto_187809 ?auto_187812 ) ) ( not ( = ?auto_187809 ?auto_187813 ) ) ( not ( = ?auto_187809 ?auto_187814 ) ) ( not ( = ?auto_187809 ?auto_187815 ) ) ( not ( = ?auto_187810 ?auto_187811 ) ) ( not ( = ?auto_187810 ?auto_187812 ) ) ( not ( = ?auto_187810 ?auto_187813 ) ) ( not ( = ?auto_187810 ?auto_187814 ) ) ( not ( = ?auto_187810 ?auto_187815 ) ) ( not ( = ?auto_187811 ?auto_187812 ) ) ( not ( = ?auto_187811 ?auto_187813 ) ) ( not ( = ?auto_187811 ?auto_187814 ) ) ( not ( = ?auto_187811 ?auto_187815 ) ) ( not ( = ?auto_187812 ?auto_187813 ) ) ( not ( = ?auto_187812 ?auto_187814 ) ) ( not ( = ?auto_187812 ?auto_187815 ) ) ( not ( = ?auto_187813 ?auto_187814 ) ) ( not ( = ?auto_187813 ?auto_187815 ) ) ( not ( = ?auto_187814 ?auto_187815 ) ) ( CLEAR ?auto_187812 ) ( ON ?auto_187813 ?auto_187814 ) ( CLEAR ?auto_187813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_187804 ?auto_187805 ?auto_187806 ?auto_187807 ?auto_187808 ?auto_187809 ?auto_187810 ?auto_187811 ?auto_187812 ?auto_187813 )
      ( MAKE-11PILE ?auto_187804 ?auto_187805 ?auto_187806 ?auto_187807 ?auto_187808 ?auto_187809 ?auto_187810 ?auto_187811 ?auto_187812 ?auto_187813 ?auto_187814 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_187827 - BLOCK
      ?auto_187828 - BLOCK
      ?auto_187829 - BLOCK
      ?auto_187830 - BLOCK
      ?auto_187831 - BLOCK
      ?auto_187832 - BLOCK
      ?auto_187833 - BLOCK
      ?auto_187834 - BLOCK
      ?auto_187835 - BLOCK
      ?auto_187836 - BLOCK
      ?auto_187837 - BLOCK
    )
    :vars
    (
      ?auto_187838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187837 ?auto_187838 ) ( ON-TABLE ?auto_187827 ) ( ON ?auto_187828 ?auto_187827 ) ( ON ?auto_187829 ?auto_187828 ) ( ON ?auto_187830 ?auto_187829 ) ( ON ?auto_187831 ?auto_187830 ) ( ON ?auto_187832 ?auto_187831 ) ( ON ?auto_187833 ?auto_187832 ) ( ON ?auto_187834 ?auto_187833 ) ( ON ?auto_187835 ?auto_187834 ) ( not ( = ?auto_187827 ?auto_187828 ) ) ( not ( = ?auto_187827 ?auto_187829 ) ) ( not ( = ?auto_187827 ?auto_187830 ) ) ( not ( = ?auto_187827 ?auto_187831 ) ) ( not ( = ?auto_187827 ?auto_187832 ) ) ( not ( = ?auto_187827 ?auto_187833 ) ) ( not ( = ?auto_187827 ?auto_187834 ) ) ( not ( = ?auto_187827 ?auto_187835 ) ) ( not ( = ?auto_187827 ?auto_187836 ) ) ( not ( = ?auto_187827 ?auto_187837 ) ) ( not ( = ?auto_187827 ?auto_187838 ) ) ( not ( = ?auto_187828 ?auto_187829 ) ) ( not ( = ?auto_187828 ?auto_187830 ) ) ( not ( = ?auto_187828 ?auto_187831 ) ) ( not ( = ?auto_187828 ?auto_187832 ) ) ( not ( = ?auto_187828 ?auto_187833 ) ) ( not ( = ?auto_187828 ?auto_187834 ) ) ( not ( = ?auto_187828 ?auto_187835 ) ) ( not ( = ?auto_187828 ?auto_187836 ) ) ( not ( = ?auto_187828 ?auto_187837 ) ) ( not ( = ?auto_187828 ?auto_187838 ) ) ( not ( = ?auto_187829 ?auto_187830 ) ) ( not ( = ?auto_187829 ?auto_187831 ) ) ( not ( = ?auto_187829 ?auto_187832 ) ) ( not ( = ?auto_187829 ?auto_187833 ) ) ( not ( = ?auto_187829 ?auto_187834 ) ) ( not ( = ?auto_187829 ?auto_187835 ) ) ( not ( = ?auto_187829 ?auto_187836 ) ) ( not ( = ?auto_187829 ?auto_187837 ) ) ( not ( = ?auto_187829 ?auto_187838 ) ) ( not ( = ?auto_187830 ?auto_187831 ) ) ( not ( = ?auto_187830 ?auto_187832 ) ) ( not ( = ?auto_187830 ?auto_187833 ) ) ( not ( = ?auto_187830 ?auto_187834 ) ) ( not ( = ?auto_187830 ?auto_187835 ) ) ( not ( = ?auto_187830 ?auto_187836 ) ) ( not ( = ?auto_187830 ?auto_187837 ) ) ( not ( = ?auto_187830 ?auto_187838 ) ) ( not ( = ?auto_187831 ?auto_187832 ) ) ( not ( = ?auto_187831 ?auto_187833 ) ) ( not ( = ?auto_187831 ?auto_187834 ) ) ( not ( = ?auto_187831 ?auto_187835 ) ) ( not ( = ?auto_187831 ?auto_187836 ) ) ( not ( = ?auto_187831 ?auto_187837 ) ) ( not ( = ?auto_187831 ?auto_187838 ) ) ( not ( = ?auto_187832 ?auto_187833 ) ) ( not ( = ?auto_187832 ?auto_187834 ) ) ( not ( = ?auto_187832 ?auto_187835 ) ) ( not ( = ?auto_187832 ?auto_187836 ) ) ( not ( = ?auto_187832 ?auto_187837 ) ) ( not ( = ?auto_187832 ?auto_187838 ) ) ( not ( = ?auto_187833 ?auto_187834 ) ) ( not ( = ?auto_187833 ?auto_187835 ) ) ( not ( = ?auto_187833 ?auto_187836 ) ) ( not ( = ?auto_187833 ?auto_187837 ) ) ( not ( = ?auto_187833 ?auto_187838 ) ) ( not ( = ?auto_187834 ?auto_187835 ) ) ( not ( = ?auto_187834 ?auto_187836 ) ) ( not ( = ?auto_187834 ?auto_187837 ) ) ( not ( = ?auto_187834 ?auto_187838 ) ) ( not ( = ?auto_187835 ?auto_187836 ) ) ( not ( = ?auto_187835 ?auto_187837 ) ) ( not ( = ?auto_187835 ?auto_187838 ) ) ( not ( = ?auto_187836 ?auto_187837 ) ) ( not ( = ?auto_187836 ?auto_187838 ) ) ( not ( = ?auto_187837 ?auto_187838 ) ) ( CLEAR ?auto_187835 ) ( ON ?auto_187836 ?auto_187837 ) ( CLEAR ?auto_187836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_187827 ?auto_187828 ?auto_187829 ?auto_187830 ?auto_187831 ?auto_187832 ?auto_187833 ?auto_187834 ?auto_187835 ?auto_187836 )
      ( MAKE-11PILE ?auto_187827 ?auto_187828 ?auto_187829 ?auto_187830 ?auto_187831 ?auto_187832 ?auto_187833 ?auto_187834 ?auto_187835 ?auto_187836 ?auto_187837 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_187850 - BLOCK
      ?auto_187851 - BLOCK
      ?auto_187852 - BLOCK
      ?auto_187853 - BLOCK
      ?auto_187854 - BLOCK
      ?auto_187855 - BLOCK
      ?auto_187856 - BLOCK
      ?auto_187857 - BLOCK
      ?auto_187858 - BLOCK
      ?auto_187859 - BLOCK
      ?auto_187860 - BLOCK
    )
    :vars
    (
      ?auto_187861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187860 ?auto_187861 ) ( ON-TABLE ?auto_187850 ) ( ON ?auto_187851 ?auto_187850 ) ( ON ?auto_187852 ?auto_187851 ) ( ON ?auto_187853 ?auto_187852 ) ( ON ?auto_187854 ?auto_187853 ) ( ON ?auto_187855 ?auto_187854 ) ( ON ?auto_187856 ?auto_187855 ) ( ON ?auto_187857 ?auto_187856 ) ( not ( = ?auto_187850 ?auto_187851 ) ) ( not ( = ?auto_187850 ?auto_187852 ) ) ( not ( = ?auto_187850 ?auto_187853 ) ) ( not ( = ?auto_187850 ?auto_187854 ) ) ( not ( = ?auto_187850 ?auto_187855 ) ) ( not ( = ?auto_187850 ?auto_187856 ) ) ( not ( = ?auto_187850 ?auto_187857 ) ) ( not ( = ?auto_187850 ?auto_187858 ) ) ( not ( = ?auto_187850 ?auto_187859 ) ) ( not ( = ?auto_187850 ?auto_187860 ) ) ( not ( = ?auto_187850 ?auto_187861 ) ) ( not ( = ?auto_187851 ?auto_187852 ) ) ( not ( = ?auto_187851 ?auto_187853 ) ) ( not ( = ?auto_187851 ?auto_187854 ) ) ( not ( = ?auto_187851 ?auto_187855 ) ) ( not ( = ?auto_187851 ?auto_187856 ) ) ( not ( = ?auto_187851 ?auto_187857 ) ) ( not ( = ?auto_187851 ?auto_187858 ) ) ( not ( = ?auto_187851 ?auto_187859 ) ) ( not ( = ?auto_187851 ?auto_187860 ) ) ( not ( = ?auto_187851 ?auto_187861 ) ) ( not ( = ?auto_187852 ?auto_187853 ) ) ( not ( = ?auto_187852 ?auto_187854 ) ) ( not ( = ?auto_187852 ?auto_187855 ) ) ( not ( = ?auto_187852 ?auto_187856 ) ) ( not ( = ?auto_187852 ?auto_187857 ) ) ( not ( = ?auto_187852 ?auto_187858 ) ) ( not ( = ?auto_187852 ?auto_187859 ) ) ( not ( = ?auto_187852 ?auto_187860 ) ) ( not ( = ?auto_187852 ?auto_187861 ) ) ( not ( = ?auto_187853 ?auto_187854 ) ) ( not ( = ?auto_187853 ?auto_187855 ) ) ( not ( = ?auto_187853 ?auto_187856 ) ) ( not ( = ?auto_187853 ?auto_187857 ) ) ( not ( = ?auto_187853 ?auto_187858 ) ) ( not ( = ?auto_187853 ?auto_187859 ) ) ( not ( = ?auto_187853 ?auto_187860 ) ) ( not ( = ?auto_187853 ?auto_187861 ) ) ( not ( = ?auto_187854 ?auto_187855 ) ) ( not ( = ?auto_187854 ?auto_187856 ) ) ( not ( = ?auto_187854 ?auto_187857 ) ) ( not ( = ?auto_187854 ?auto_187858 ) ) ( not ( = ?auto_187854 ?auto_187859 ) ) ( not ( = ?auto_187854 ?auto_187860 ) ) ( not ( = ?auto_187854 ?auto_187861 ) ) ( not ( = ?auto_187855 ?auto_187856 ) ) ( not ( = ?auto_187855 ?auto_187857 ) ) ( not ( = ?auto_187855 ?auto_187858 ) ) ( not ( = ?auto_187855 ?auto_187859 ) ) ( not ( = ?auto_187855 ?auto_187860 ) ) ( not ( = ?auto_187855 ?auto_187861 ) ) ( not ( = ?auto_187856 ?auto_187857 ) ) ( not ( = ?auto_187856 ?auto_187858 ) ) ( not ( = ?auto_187856 ?auto_187859 ) ) ( not ( = ?auto_187856 ?auto_187860 ) ) ( not ( = ?auto_187856 ?auto_187861 ) ) ( not ( = ?auto_187857 ?auto_187858 ) ) ( not ( = ?auto_187857 ?auto_187859 ) ) ( not ( = ?auto_187857 ?auto_187860 ) ) ( not ( = ?auto_187857 ?auto_187861 ) ) ( not ( = ?auto_187858 ?auto_187859 ) ) ( not ( = ?auto_187858 ?auto_187860 ) ) ( not ( = ?auto_187858 ?auto_187861 ) ) ( not ( = ?auto_187859 ?auto_187860 ) ) ( not ( = ?auto_187859 ?auto_187861 ) ) ( not ( = ?auto_187860 ?auto_187861 ) ) ( ON ?auto_187859 ?auto_187860 ) ( CLEAR ?auto_187857 ) ( ON ?auto_187858 ?auto_187859 ) ( CLEAR ?auto_187858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_187850 ?auto_187851 ?auto_187852 ?auto_187853 ?auto_187854 ?auto_187855 ?auto_187856 ?auto_187857 ?auto_187858 )
      ( MAKE-11PILE ?auto_187850 ?auto_187851 ?auto_187852 ?auto_187853 ?auto_187854 ?auto_187855 ?auto_187856 ?auto_187857 ?auto_187858 ?auto_187859 ?auto_187860 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_187873 - BLOCK
      ?auto_187874 - BLOCK
      ?auto_187875 - BLOCK
      ?auto_187876 - BLOCK
      ?auto_187877 - BLOCK
      ?auto_187878 - BLOCK
      ?auto_187879 - BLOCK
      ?auto_187880 - BLOCK
      ?auto_187881 - BLOCK
      ?auto_187882 - BLOCK
      ?auto_187883 - BLOCK
    )
    :vars
    (
      ?auto_187884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187883 ?auto_187884 ) ( ON-TABLE ?auto_187873 ) ( ON ?auto_187874 ?auto_187873 ) ( ON ?auto_187875 ?auto_187874 ) ( ON ?auto_187876 ?auto_187875 ) ( ON ?auto_187877 ?auto_187876 ) ( ON ?auto_187878 ?auto_187877 ) ( ON ?auto_187879 ?auto_187878 ) ( ON ?auto_187880 ?auto_187879 ) ( not ( = ?auto_187873 ?auto_187874 ) ) ( not ( = ?auto_187873 ?auto_187875 ) ) ( not ( = ?auto_187873 ?auto_187876 ) ) ( not ( = ?auto_187873 ?auto_187877 ) ) ( not ( = ?auto_187873 ?auto_187878 ) ) ( not ( = ?auto_187873 ?auto_187879 ) ) ( not ( = ?auto_187873 ?auto_187880 ) ) ( not ( = ?auto_187873 ?auto_187881 ) ) ( not ( = ?auto_187873 ?auto_187882 ) ) ( not ( = ?auto_187873 ?auto_187883 ) ) ( not ( = ?auto_187873 ?auto_187884 ) ) ( not ( = ?auto_187874 ?auto_187875 ) ) ( not ( = ?auto_187874 ?auto_187876 ) ) ( not ( = ?auto_187874 ?auto_187877 ) ) ( not ( = ?auto_187874 ?auto_187878 ) ) ( not ( = ?auto_187874 ?auto_187879 ) ) ( not ( = ?auto_187874 ?auto_187880 ) ) ( not ( = ?auto_187874 ?auto_187881 ) ) ( not ( = ?auto_187874 ?auto_187882 ) ) ( not ( = ?auto_187874 ?auto_187883 ) ) ( not ( = ?auto_187874 ?auto_187884 ) ) ( not ( = ?auto_187875 ?auto_187876 ) ) ( not ( = ?auto_187875 ?auto_187877 ) ) ( not ( = ?auto_187875 ?auto_187878 ) ) ( not ( = ?auto_187875 ?auto_187879 ) ) ( not ( = ?auto_187875 ?auto_187880 ) ) ( not ( = ?auto_187875 ?auto_187881 ) ) ( not ( = ?auto_187875 ?auto_187882 ) ) ( not ( = ?auto_187875 ?auto_187883 ) ) ( not ( = ?auto_187875 ?auto_187884 ) ) ( not ( = ?auto_187876 ?auto_187877 ) ) ( not ( = ?auto_187876 ?auto_187878 ) ) ( not ( = ?auto_187876 ?auto_187879 ) ) ( not ( = ?auto_187876 ?auto_187880 ) ) ( not ( = ?auto_187876 ?auto_187881 ) ) ( not ( = ?auto_187876 ?auto_187882 ) ) ( not ( = ?auto_187876 ?auto_187883 ) ) ( not ( = ?auto_187876 ?auto_187884 ) ) ( not ( = ?auto_187877 ?auto_187878 ) ) ( not ( = ?auto_187877 ?auto_187879 ) ) ( not ( = ?auto_187877 ?auto_187880 ) ) ( not ( = ?auto_187877 ?auto_187881 ) ) ( not ( = ?auto_187877 ?auto_187882 ) ) ( not ( = ?auto_187877 ?auto_187883 ) ) ( not ( = ?auto_187877 ?auto_187884 ) ) ( not ( = ?auto_187878 ?auto_187879 ) ) ( not ( = ?auto_187878 ?auto_187880 ) ) ( not ( = ?auto_187878 ?auto_187881 ) ) ( not ( = ?auto_187878 ?auto_187882 ) ) ( not ( = ?auto_187878 ?auto_187883 ) ) ( not ( = ?auto_187878 ?auto_187884 ) ) ( not ( = ?auto_187879 ?auto_187880 ) ) ( not ( = ?auto_187879 ?auto_187881 ) ) ( not ( = ?auto_187879 ?auto_187882 ) ) ( not ( = ?auto_187879 ?auto_187883 ) ) ( not ( = ?auto_187879 ?auto_187884 ) ) ( not ( = ?auto_187880 ?auto_187881 ) ) ( not ( = ?auto_187880 ?auto_187882 ) ) ( not ( = ?auto_187880 ?auto_187883 ) ) ( not ( = ?auto_187880 ?auto_187884 ) ) ( not ( = ?auto_187881 ?auto_187882 ) ) ( not ( = ?auto_187881 ?auto_187883 ) ) ( not ( = ?auto_187881 ?auto_187884 ) ) ( not ( = ?auto_187882 ?auto_187883 ) ) ( not ( = ?auto_187882 ?auto_187884 ) ) ( not ( = ?auto_187883 ?auto_187884 ) ) ( ON ?auto_187882 ?auto_187883 ) ( CLEAR ?auto_187880 ) ( ON ?auto_187881 ?auto_187882 ) ( CLEAR ?auto_187881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_187873 ?auto_187874 ?auto_187875 ?auto_187876 ?auto_187877 ?auto_187878 ?auto_187879 ?auto_187880 ?auto_187881 )
      ( MAKE-11PILE ?auto_187873 ?auto_187874 ?auto_187875 ?auto_187876 ?auto_187877 ?auto_187878 ?auto_187879 ?auto_187880 ?auto_187881 ?auto_187882 ?auto_187883 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_187896 - BLOCK
      ?auto_187897 - BLOCK
      ?auto_187898 - BLOCK
      ?auto_187899 - BLOCK
      ?auto_187900 - BLOCK
      ?auto_187901 - BLOCK
      ?auto_187902 - BLOCK
      ?auto_187903 - BLOCK
      ?auto_187904 - BLOCK
      ?auto_187905 - BLOCK
      ?auto_187906 - BLOCK
    )
    :vars
    (
      ?auto_187907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187906 ?auto_187907 ) ( ON-TABLE ?auto_187896 ) ( ON ?auto_187897 ?auto_187896 ) ( ON ?auto_187898 ?auto_187897 ) ( ON ?auto_187899 ?auto_187898 ) ( ON ?auto_187900 ?auto_187899 ) ( ON ?auto_187901 ?auto_187900 ) ( ON ?auto_187902 ?auto_187901 ) ( not ( = ?auto_187896 ?auto_187897 ) ) ( not ( = ?auto_187896 ?auto_187898 ) ) ( not ( = ?auto_187896 ?auto_187899 ) ) ( not ( = ?auto_187896 ?auto_187900 ) ) ( not ( = ?auto_187896 ?auto_187901 ) ) ( not ( = ?auto_187896 ?auto_187902 ) ) ( not ( = ?auto_187896 ?auto_187903 ) ) ( not ( = ?auto_187896 ?auto_187904 ) ) ( not ( = ?auto_187896 ?auto_187905 ) ) ( not ( = ?auto_187896 ?auto_187906 ) ) ( not ( = ?auto_187896 ?auto_187907 ) ) ( not ( = ?auto_187897 ?auto_187898 ) ) ( not ( = ?auto_187897 ?auto_187899 ) ) ( not ( = ?auto_187897 ?auto_187900 ) ) ( not ( = ?auto_187897 ?auto_187901 ) ) ( not ( = ?auto_187897 ?auto_187902 ) ) ( not ( = ?auto_187897 ?auto_187903 ) ) ( not ( = ?auto_187897 ?auto_187904 ) ) ( not ( = ?auto_187897 ?auto_187905 ) ) ( not ( = ?auto_187897 ?auto_187906 ) ) ( not ( = ?auto_187897 ?auto_187907 ) ) ( not ( = ?auto_187898 ?auto_187899 ) ) ( not ( = ?auto_187898 ?auto_187900 ) ) ( not ( = ?auto_187898 ?auto_187901 ) ) ( not ( = ?auto_187898 ?auto_187902 ) ) ( not ( = ?auto_187898 ?auto_187903 ) ) ( not ( = ?auto_187898 ?auto_187904 ) ) ( not ( = ?auto_187898 ?auto_187905 ) ) ( not ( = ?auto_187898 ?auto_187906 ) ) ( not ( = ?auto_187898 ?auto_187907 ) ) ( not ( = ?auto_187899 ?auto_187900 ) ) ( not ( = ?auto_187899 ?auto_187901 ) ) ( not ( = ?auto_187899 ?auto_187902 ) ) ( not ( = ?auto_187899 ?auto_187903 ) ) ( not ( = ?auto_187899 ?auto_187904 ) ) ( not ( = ?auto_187899 ?auto_187905 ) ) ( not ( = ?auto_187899 ?auto_187906 ) ) ( not ( = ?auto_187899 ?auto_187907 ) ) ( not ( = ?auto_187900 ?auto_187901 ) ) ( not ( = ?auto_187900 ?auto_187902 ) ) ( not ( = ?auto_187900 ?auto_187903 ) ) ( not ( = ?auto_187900 ?auto_187904 ) ) ( not ( = ?auto_187900 ?auto_187905 ) ) ( not ( = ?auto_187900 ?auto_187906 ) ) ( not ( = ?auto_187900 ?auto_187907 ) ) ( not ( = ?auto_187901 ?auto_187902 ) ) ( not ( = ?auto_187901 ?auto_187903 ) ) ( not ( = ?auto_187901 ?auto_187904 ) ) ( not ( = ?auto_187901 ?auto_187905 ) ) ( not ( = ?auto_187901 ?auto_187906 ) ) ( not ( = ?auto_187901 ?auto_187907 ) ) ( not ( = ?auto_187902 ?auto_187903 ) ) ( not ( = ?auto_187902 ?auto_187904 ) ) ( not ( = ?auto_187902 ?auto_187905 ) ) ( not ( = ?auto_187902 ?auto_187906 ) ) ( not ( = ?auto_187902 ?auto_187907 ) ) ( not ( = ?auto_187903 ?auto_187904 ) ) ( not ( = ?auto_187903 ?auto_187905 ) ) ( not ( = ?auto_187903 ?auto_187906 ) ) ( not ( = ?auto_187903 ?auto_187907 ) ) ( not ( = ?auto_187904 ?auto_187905 ) ) ( not ( = ?auto_187904 ?auto_187906 ) ) ( not ( = ?auto_187904 ?auto_187907 ) ) ( not ( = ?auto_187905 ?auto_187906 ) ) ( not ( = ?auto_187905 ?auto_187907 ) ) ( not ( = ?auto_187906 ?auto_187907 ) ) ( ON ?auto_187905 ?auto_187906 ) ( ON ?auto_187904 ?auto_187905 ) ( CLEAR ?auto_187902 ) ( ON ?auto_187903 ?auto_187904 ) ( CLEAR ?auto_187903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_187896 ?auto_187897 ?auto_187898 ?auto_187899 ?auto_187900 ?auto_187901 ?auto_187902 ?auto_187903 )
      ( MAKE-11PILE ?auto_187896 ?auto_187897 ?auto_187898 ?auto_187899 ?auto_187900 ?auto_187901 ?auto_187902 ?auto_187903 ?auto_187904 ?auto_187905 ?auto_187906 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_187919 - BLOCK
      ?auto_187920 - BLOCK
      ?auto_187921 - BLOCK
      ?auto_187922 - BLOCK
      ?auto_187923 - BLOCK
      ?auto_187924 - BLOCK
      ?auto_187925 - BLOCK
      ?auto_187926 - BLOCK
      ?auto_187927 - BLOCK
      ?auto_187928 - BLOCK
      ?auto_187929 - BLOCK
    )
    :vars
    (
      ?auto_187930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187929 ?auto_187930 ) ( ON-TABLE ?auto_187919 ) ( ON ?auto_187920 ?auto_187919 ) ( ON ?auto_187921 ?auto_187920 ) ( ON ?auto_187922 ?auto_187921 ) ( ON ?auto_187923 ?auto_187922 ) ( ON ?auto_187924 ?auto_187923 ) ( ON ?auto_187925 ?auto_187924 ) ( not ( = ?auto_187919 ?auto_187920 ) ) ( not ( = ?auto_187919 ?auto_187921 ) ) ( not ( = ?auto_187919 ?auto_187922 ) ) ( not ( = ?auto_187919 ?auto_187923 ) ) ( not ( = ?auto_187919 ?auto_187924 ) ) ( not ( = ?auto_187919 ?auto_187925 ) ) ( not ( = ?auto_187919 ?auto_187926 ) ) ( not ( = ?auto_187919 ?auto_187927 ) ) ( not ( = ?auto_187919 ?auto_187928 ) ) ( not ( = ?auto_187919 ?auto_187929 ) ) ( not ( = ?auto_187919 ?auto_187930 ) ) ( not ( = ?auto_187920 ?auto_187921 ) ) ( not ( = ?auto_187920 ?auto_187922 ) ) ( not ( = ?auto_187920 ?auto_187923 ) ) ( not ( = ?auto_187920 ?auto_187924 ) ) ( not ( = ?auto_187920 ?auto_187925 ) ) ( not ( = ?auto_187920 ?auto_187926 ) ) ( not ( = ?auto_187920 ?auto_187927 ) ) ( not ( = ?auto_187920 ?auto_187928 ) ) ( not ( = ?auto_187920 ?auto_187929 ) ) ( not ( = ?auto_187920 ?auto_187930 ) ) ( not ( = ?auto_187921 ?auto_187922 ) ) ( not ( = ?auto_187921 ?auto_187923 ) ) ( not ( = ?auto_187921 ?auto_187924 ) ) ( not ( = ?auto_187921 ?auto_187925 ) ) ( not ( = ?auto_187921 ?auto_187926 ) ) ( not ( = ?auto_187921 ?auto_187927 ) ) ( not ( = ?auto_187921 ?auto_187928 ) ) ( not ( = ?auto_187921 ?auto_187929 ) ) ( not ( = ?auto_187921 ?auto_187930 ) ) ( not ( = ?auto_187922 ?auto_187923 ) ) ( not ( = ?auto_187922 ?auto_187924 ) ) ( not ( = ?auto_187922 ?auto_187925 ) ) ( not ( = ?auto_187922 ?auto_187926 ) ) ( not ( = ?auto_187922 ?auto_187927 ) ) ( not ( = ?auto_187922 ?auto_187928 ) ) ( not ( = ?auto_187922 ?auto_187929 ) ) ( not ( = ?auto_187922 ?auto_187930 ) ) ( not ( = ?auto_187923 ?auto_187924 ) ) ( not ( = ?auto_187923 ?auto_187925 ) ) ( not ( = ?auto_187923 ?auto_187926 ) ) ( not ( = ?auto_187923 ?auto_187927 ) ) ( not ( = ?auto_187923 ?auto_187928 ) ) ( not ( = ?auto_187923 ?auto_187929 ) ) ( not ( = ?auto_187923 ?auto_187930 ) ) ( not ( = ?auto_187924 ?auto_187925 ) ) ( not ( = ?auto_187924 ?auto_187926 ) ) ( not ( = ?auto_187924 ?auto_187927 ) ) ( not ( = ?auto_187924 ?auto_187928 ) ) ( not ( = ?auto_187924 ?auto_187929 ) ) ( not ( = ?auto_187924 ?auto_187930 ) ) ( not ( = ?auto_187925 ?auto_187926 ) ) ( not ( = ?auto_187925 ?auto_187927 ) ) ( not ( = ?auto_187925 ?auto_187928 ) ) ( not ( = ?auto_187925 ?auto_187929 ) ) ( not ( = ?auto_187925 ?auto_187930 ) ) ( not ( = ?auto_187926 ?auto_187927 ) ) ( not ( = ?auto_187926 ?auto_187928 ) ) ( not ( = ?auto_187926 ?auto_187929 ) ) ( not ( = ?auto_187926 ?auto_187930 ) ) ( not ( = ?auto_187927 ?auto_187928 ) ) ( not ( = ?auto_187927 ?auto_187929 ) ) ( not ( = ?auto_187927 ?auto_187930 ) ) ( not ( = ?auto_187928 ?auto_187929 ) ) ( not ( = ?auto_187928 ?auto_187930 ) ) ( not ( = ?auto_187929 ?auto_187930 ) ) ( ON ?auto_187928 ?auto_187929 ) ( ON ?auto_187927 ?auto_187928 ) ( CLEAR ?auto_187925 ) ( ON ?auto_187926 ?auto_187927 ) ( CLEAR ?auto_187926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_187919 ?auto_187920 ?auto_187921 ?auto_187922 ?auto_187923 ?auto_187924 ?auto_187925 ?auto_187926 )
      ( MAKE-11PILE ?auto_187919 ?auto_187920 ?auto_187921 ?auto_187922 ?auto_187923 ?auto_187924 ?auto_187925 ?auto_187926 ?auto_187927 ?auto_187928 ?auto_187929 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_187942 - BLOCK
      ?auto_187943 - BLOCK
      ?auto_187944 - BLOCK
      ?auto_187945 - BLOCK
      ?auto_187946 - BLOCK
      ?auto_187947 - BLOCK
      ?auto_187948 - BLOCK
      ?auto_187949 - BLOCK
      ?auto_187950 - BLOCK
      ?auto_187951 - BLOCK
      ?auto_187952 - BLOCK
    )
    :vars
    (
      ?auto_187953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187952 ?auto_187953 ) ( ON-TABLE ?auto_187942 ) ( ON ?auto_187943 ?auto_187942 ) ( ON ?auto_187944 ?auto_187943 ) ( ON ?auto_187945 ?auto_187944 ) ( ON ?auto_187946 ?auto_187945 ) ( ON ?auto_187947 ?auto_187946 ) ( not ( = ?auto_187942 ?auto_187943 ) ) ( not ( = ?auto_187942 ?auto_187944 ) ) ( not ( = ?auto_187942 ?auto_187945 ) ) ( not ( = ?auto_187942 ?auto_187946 ) ) ( not ( = ?auto_187942 ?auto_187947 ) ) ( not ( = ?auto_187942 ?auto_187948 ) ) ( not ( = ?auto_187942 ?auto_187949 ) ) ( not ( = ?auto_187942 ?auto_187950 ) ) ( not ( = ?auto_187942 ?auto_187951 ) ) ( not ( = ?auto_187942 ?auto_187952 ) ) ( not ( = ?auto_187942 ?auto_187953 ) ) ( not ( = ?auto_187943 ?auto_187944 ) ) ( not ( = ?auto_187943 ?auto_187945 ) ) ( not ( = ?auto_187943 ?auto_187946 ) ) ( not ( = ?auto_187943 ?auto_187947 ) ) ( not ( = ?auto_187943 ?auto_187948 ) ) ( not ( = ?auto_187943 ?auto_187949 ) ) ( not ( = ?auto_187943 ?auto_187950 ) ) ( not ( = ?auto_187943 ?auto_187951 ) ) ( not ( = ?auto_187943 ?auto_187952 ) ) ( not ( = ?auto_187943 ?auto_187953 ) ) ( not ( = ?auto_187944 ?auto_187945 ) ) ( not ( = ?auto_187944 ?auto_187946 ) ) ( not ( = ?auto_187944 ?auto_187947 ) ) ( not ( = ?auto_187944 ?auto_187948 ) ) ( not ( = ?auto_187944 ?auto_187949 ) ) ( not ( = ?auto_187944 ?auto_187950 ) ) ( not ( = ?auto_187944 ?auto_187951 ) ) ( not ( = ?auto_187944 ?auto_187952 ) ) ( not ( = ?auto_187944 ?auto_187953 ) ) ( not ( = ?auto_187945 ?auto_187946 ) ) ( not ( = ?auto_187945 ?auto_187947 ) ) ( not ( = ?auto_187945 ?auto_187948 ) ) ( not ( = ?auto_187945 ?auto_187949 ) ) ( not ( = ?auto_187945 ?auto_187950 ) ) ( not ( = ?auto_187945 ?auto_187951 ) ) ( not ( = ?auto_187945 ?auto_187952 ) ) ( not ( = ?auto_187945 ?auto_187953 ) ) ( not ( = ?auto_187946 ?auto_187947 ) ) ( not ( = ?auto_187946 ?auto_187948 ) ) ( not ( = ?auto_187946 ?auto_187949 ) ) ( not ( = ?auto_187946 ?auto_187950 ) ) ( not ( = ?auto_187946 ?auto_187951 ) ) ( not ( = ?auto_187946 ?auto_187952 ) ) ( not ( = ?auto_187946 ?auto_187953 ) ) ( not ( = ?auto_187947 ?auto_187948 ) ) ( not ( = ?auto_187947 ?auto_187949 ) ) ( not ( = ?auto_187947 ?auto_187950 ) ) ( not ( = ?auto_187947 ?auto_187951 ) ) ( not ( = ?auto_187947 ?auto_187952 ) ) ( not ( = ?auto_187947 ?auto_187953 ) ) ( not ( = ?auto_187948 ?auto_187949 ) ) ( not ( = ?auto_187948 ?auto_187950 ) ) ( not ( = ?auto_187948 ?auto_187951 ) ) ( not ( = ?auto_187948 ?auto_187952 ) ) ( not ( = ?auto_187948 ?auto_187953 ) ) ( not ( = ?auto_187949 ?auto_187950 ) ) ( not ( = ?auto_187949 ?auto_187951 ) ) ( not ( = ?auto_187949 ?auto_187952 ) ) ( not ( = ?auto_187949 ?auto_187953 ) ) ( not ( = ?auto_187950 ?auto_187951 ) ) ( not ( = ?auto_187950 ?auto_187952 ) ) ( not ( = ?auto_187950 ?auto_187953 ) ) ( not ( = ?auto_187951 ?auto_187952 ) ) ( not ( = ?auto_187951 ?auto_187953 ) ) ( not ( = ?auto_187952 ?auto_187953 ) ) ( ON ?auto_187951 ?auto_187952 ) ( ON ?auto_187950 ?auto_187951 ) ( ON ?auto_187949 ?auto_187950 ) ( CLEAR ?auto_187947 ) ( ON ?auto_187948 ?auto_187949 ) ( CLEAR ?auto_187948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187942 ?auto_187943 ?auto_187944 ?auto_187945 ?auto_187946 ?auto_187947 ?auto_187948 )
      ( MAKE-11PILE ?auto_187942 ?auto_187943 ?auto_187944 ?auto_187945 ?auto_187946 ?auto_187947 ?auto_187948 ?auto_187949 ?auto_187950 ?auto_187951 ?auto_187952 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_187965 - BLOCK
      ?auto_187966 - BLOCK
      ?auto_187967 - BLOCK
      ?auto_187968 - BLOCK
      ?auto_187969 - BLOCK
      ?auto_187970 - BLOCK
      ?auto_187971 - BLOCK
      ?auto_187972 - BLOCK
      ?auto_187973 - BLOCK
      ?auto_187974 - BLOCK
      ?auto_187975 - BLOCK
    )
    :vars
    (
      ?auto_187976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187975 ?auto_187976 ) ( ON-TABLE ?auto_187965 ) ( ON ?auto_187966 ?auto_187965 ) ( ON ?auto_187967 ?auto_187966 ) ( ON ?auto_187968 ?auto_187967 ) ( ON ?auto_187969 ?auto_187968 ) ( ON ?auto_187970 ?auto_187969 ) ( not ( = ?auto_187965 ?auto_187966 ) ) ( not ( = ?auto_187965 ?auto_187967 ) ) ( not ( = ?auto_187965 ?auto_187968 ) ) ( not ( = ?auto_187965 ?auto_187969 ) ) ( not ( = ?auto_187965 ?auto_187970 ) ) ( not ( = ?auto_187965 ?auto_187971 ) ) ( not ( = ?auto_187965 ?auto_187972 ) ) ( not ( = ?auto_187965 ?auto_187973 ) ) ( not ( = ?auto_187965 ?auto_187974 ) ) ( not ( = ?auto_187965 ?auto_187975 ) ) ( not ( = ?auto_187965 ?auto_187976 ) ) ( not ( = ?auto_187966 ?auto_187967 ) ) ( not ( = ?auto_187966 ?auto_187968 ) ) ( not ( = ?auto_187966 ?auto_187969 ) ) ( not ( = ?auto_187966 ?auto_187970 ) ) ( not ( = ?auto_187966 ?auto_187971 ) ) ( not ( = ?auto_187966 ?auto_187972 ) ) ( not ( = ?auto_187966 ?auto_187973 ) ) ( not ( = ?auto_187966 ?auto_187974 ) ) ( not ( = ?auto_187966 ?auto_187975 ) ) ( not ( = ?auto_187966 ?auto_187976 ) ) ( not ( = ?auto_187967 ?auto_187968 ) ) ( not ( = ?auto_187967 ?auto_187969 ) ) ( not ( = ?auto_187967 ?auto_187970 ) ) ( not ( = ?auto_187967 ?auto_187971 ) ) ( not ( = ?auto_187967 ?auto_187972 ) ) ( not ( = ?auto_187967 ?auto_187973 ) ) ( not ( = ?auto_187967 ?auto_187974 ) ) ( not ( = ?auto_187967 ?auto_187975 ) ) ( not ( = ?auto_187967 ?auto_187976 ) ) ( not ( = ?auto_187968 ?auto_187969 ) ) ( not ( = ?auto_187968 ?auto_187970 ) ) ( not ( = ?auto_187968 ?auto_187971 ) ) ( not ( = ?auto_187968 ?auto_187972 ) ) ( not ( = ?auto_187968 ?auto_187973 ) ) ( not ( = ?auto_187968 ?auto_187974 ) ) ( not ( = ?auto_187968 ?auto_187975 ) ) ( not ( = ?auto_187968 ?auto_187976 ) ) ( not ( = ?auto_187969 ?auto_187970 ) ) ( not ( = ?auto_187969 ?auto_187971 ) ) ( not ( = ?auto_187969 ?auto_187972 ) ) ( not ( = ?auto_187969 ?auto_187973 ) ) ( not ( = ?auto_187969 ?auto_187974 ) ) ( not ( = ?auto_187969 ?auto_187975 ) ) ( not ( = ?auto_187969 ?auto_187976 ) ) ( not ( = ?auto_187970 ?auto_187971 ) ) ( not ( = ?auto_187970 ?auto_187972 ) ) ( not ( = ?auto_187970 ?auto_187973 ) ) ( not ( = ?auto_187970 ?auto_187974 ) ) ( not ( = ?auto_187970 ?auto_187975 ) ) ( not ( = ?auto_187970 ?auto_187976 ) ) ( not ( = ?auto_187971 ?auto_187972 ) ) ( not ( = ?auto_187971 ?auto_187973 ) ) ( not ( = ?auto_187971 ?auto_187974 ) ) ( not ( = ?auto_187971 ?auto_187975 ) ) ( not ( = ?auto_187971 ?auto_187976 ) ) ( not ( = ?auto_187972 ?auto_187973 ) ) ( not ( = ?auto_187972 ?auto_187974 ) ) ( not ( = ?auto_187972 ?auto_187975 ) ) ( not ( = ?auto_187972 ?auto_187976 ) ) ( not ( = ?auto_187973 ?auto_187974 ) ) ( not ( = ?auto_187973 ?auto_187975 ) ) ( not ( = ?auto_187973 ?auto_187976 ) ) ( not ( = ?auto_187974 ?auto_187975 ) ) ( not ( = ?auto_187974 ?auto_187976 ) ) ( not ( = ?auto_187975 ?auto_187976 ) ) ( ON ?auto_187974 ?auto_187975 ) ( ON ?auto_187973 ?auto_187974 ) ( ON ?auto_187972 ?auto_187973 ) ( CLEAR ?auto_187970 ) ( ON ?auto_187971 ?auto_187972 ) ( CLEAR ?auto_187971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187965 ?auto_187966 ?auto_187967 ?auto_187968 ?auto_187969 ?auto_187970 ?auto_187971 )
      ( MAKE-11PILE ?auto_187965 ?auto_187966 ?auto_187967 ?auto_187968 ?auto_187969 ?auto_187970 ?auto_187971 ?auto_187972 ?auto_187973 ?auto_187974 ?auto_187975 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_187988 - BLOCK
      ?auto_187989 - BLOCK
      ?auto_187990 - BLOCK
      ?auto_187991 - BLOCK
      ?auto_187992 - BLOCK
      ?auto_187993 - BLOCK
      ?auto_187994 - BLOCK
      ?auto_187995 - BLOCK
      ?auto_187996 - BLOCK
      ?auto_187997 - BLOCK
      ?auto_187998 - BLOCK
    )
    :vars
    (
      ?auto_187999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187998 ?auto_187999 ) ( ON-TABLE ?auto_187988 ) ( ON ?auto_187989 ?auto_187988 ) ( ON ?auto_187990 ?auto_187989 ) ( ON ?auto_187991 ?auto_187990 ) ( ON ?auto_187992 ?auto_187991 ) ( not ( = ?auto_187988 ?auto_187989 ) ) ( not ( = ?auto_187988 ?auto_187990 ) ) ( not ( = ?auto_187988 ?auto_187991 ) ) ( not ( = ?auto_187988 ?auto_187992 ) ) ( not ( = ?auto_187988 ?auto_187993 ) ) ( not ( = ?auto_187988 ?auto_187994 ) ) ( not ( = ?auto_187988 ?auto_187995 ) ) ( not ( = ?auto_187988 ?auto_187996 ) ) ( not ( = ?auto_187988 ?auto_187997 ) ) ( not ( = ?auto_187988 ?auto_187998 ) ) ( not ( = ?auto_187988 ?auto_187999 ) ) ( not ( = ?auto_187989 ?auto_187990 ) ) ( not ( = ?auto_187989 ?auto_187991 ) ) ( not ( = ?auto_187989 ?auto_187992 ) ) ( not ( = ?auto_187989 ?auto_187993 ) ) ( not ( = ?auto_187989 ?auto_187994 ) ) ( not ( = ?auto_187989 ?auto_187995 ) ) ( not ( = ?auto_187989 ?auto_187996 ) ) ( not ( = ?auto_187989 ?auto_187997 ) ) ( not ( = ?auto_187989 ?auto_187998 ) ) ( not ( = ?auto_187989 ?auto_187999 ) ) ( not ( = ?auto_187990 ?auto_187991 ) ) ( not ( = ?auto_187990 ?auto_187992 ) ) ( not ( = ?auto_187990 ?auto_187993 ) ) ( not ( = ?auto_187990 ?auto_187994 ) ) ( not ( = ?auto_187990 ?auto_187995 ) ) ( not ( = ?auto_187990 ?auto_187996 ) ) ( not ( = ?auto_187990 ?auto_187997 ) ) ( not ( = ?auto_187990 ?auto_187998 ) ) ( not ( = ?auto_187990 ?auto_187999 ) ) ( not ( = ?auto_187991 ?auto_187992 ) ) ( not ( = ?auto_187991 ?auto_187993 ) ) ( not ( = ?auto_187991 ?auto_187994 ) ) ( not ( = ?auto_187991 ?auto_187995 ) ) ( not ( = ?auto_187991 ?auto_187996 ) ) ( not ( = ?auto_187991 ?auto_187997 ) ) ( not ( = ?auto_187991 ?auto_187998 ) ) ( not ( = ?auto_187991 ?auto_187999 ) ) ( not ( = ?auto_187992 ?auto_187993 ) ) ( not ( = ?auto_187992 ?auto_187994 ) ) ( not ( = ?auto_187992 ?auto_187995 ) ) ( not ( = ?auto_187992 ?auto_187996 ) ) ( not ( = ?auto_187992 ?auto_187997 ) ) ( not ( = ?auto_187992 ?auto_187998 ) ) ( not ( = ?auto_187992 ?auto_187999 ) ) ( not ( = ?auto_187993 ?auto_187994 ) ) ( not ( = ?auto_187993 ?auto_187995 ) ) ( not ( = ?auto_187993 ?auto_187996 ) ) ( not ( = ?auto_187993 ?auto_187997 ) ) ( not ( = ?auto_187993 ?auto_187998 ) ) ( not ( = ?auto_187993 ?auto_187999 ) ) ( not ( = ?auto_187994 ?auto_187995 ) ) ( not ( = ?auto_187994 ?auto_187996 ) ) ( not ( = ?auto_187994 ?auto_187997 ) ) ( not ( = ?auto_187994 ?auto_187998 ) ) ( not ( = ?auto_187994 ?auto_187999 ) ) ( not ( = ?auto_187995 ?auto_187996 ) ) ( not ( = ?auto_187995 ?auto_187997 ) ) ( not ( = ?auto_187995 ?auto_187998 ) ) ( not ( = ?auto_187995 ?auto_187999 ) ) ( not ( = ?auto_187996 ?auto_187997 ) ) ( not ( = ?auto_187996 ?auto_187998 ) ) ( not ( = ?auto_187996 ?auto_187999 ) ) ( not ( = ?auto_187997 ?auto_187998 ) ) ( not ( = ?auto_187997 ?auto_187999 ) ) ( not ( = ?auto_187998 ?auto_187999 ) ) ( ON ?auto_187997 ?auto_187998 ) ( ON ?auto_187996 ?auto_187997 ) ( ON ?auto_187995 ?auto_187996 ) ( ON ?auto_187994 ?auto_187995 ) ( CLEAR ?auto_187992 ) ( ON ?auto_187993 ?auto_187994 ) ( CLEAR ?auto_187993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187988 ?auto_187989 ?auto_187990 ?auto_187991 ?auto_187992 ?auto_187993 )
      ( MAKE-11PILE ?auto_187988 ?auto_187989 ?auto_187990 ?auto_187991 ?auto_187992 ?auto_187993 ?auto_187994 ?auto_187995 ?auto_187996 ?auto_187997 ?auto_187998 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_188011 - BLOCK
      ?auto_188012 - BLOCK
      ?auto_188013 - BLOCK
      ?auto_188014 - BLOCK
      ?auto_188015 - BLOCK
      ?auto_188016 - BLOCK
      ?auto_188017 - BLOCK
      ?auto_188018 - BLOCK
      ?auto_188019 - BLOCK
      ?auto_188020 - BLOCK
      ?auto_188021 - BLOCK
    )
    :vars
    (
      ?auto_188022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188021 ?auto_188022 ) ( ON-TABLE ?auto_188011 ) ( ON ?auto_188012 ?auto_188011 ) ( ON ?auto_188013 ?auto_188012 ) ( ON ?auto_188014 ?auto_188013 ) ( ON ?auto_188015 ?auto_188014 ) ( not ( = ?auto_188011 ?auto_188012 ) ) ( not ( = ?auto_188011 ?auto_188013 ) ) ( not ( = ?auto_188011 ?auto_188014 ) ) ( not ( = ?auto_188011 ?auto_188015 ) ) ( not ( = ?auto_188011 ?auto_188016 ) ) ( not ( = ?auto_188011 ?auto_188017 ) ) ( not ( = ?auto_188011 ?auto_188018 ) ) ( not ( = ?auto_188011 ?auto_188019 ) ) ( not ( = ?auto_188011 ?auto_188020 ) ) ( not ( = ?auto_188011 ?auto_188021 ) ) ( not ( = ?auto_188011 ?auto_188022 ) ) ( not ( = ?auto_188012 ?auto_188013 ) ) ( not ( = ?auto_188012 ?auto_188014 ) ) ( not ( = ?auto_188012 ?auto_188015 ) ) ( not ( = ?auto_188012 ?auto_188016 ) ) ( not ( = ?auto_188012 ?auto_188017 ) ) ( not ( = ?auto_188012 ?auto_188018 ) ) ( not ( = ?auto_188012 ?auto_188019 ) ) ( not ( = ?auto_188012 ?auto_188020 ) ) ( not ( = ?auto_188012 ?auto_188021 ) ) ( not ( = ?auto_188012 ?auto_188022 ) ) ( not ( = ?auto_188013 ?auto_188014 ) ) ( not ( = ?auto_188013 ?auto_188015 ) ) ( not ( = ?auto_188013 ?auto_188016 ) ) ( not ( = ?auto_188013 ?auto_188017 ) ) ( not ( = ?auto_188013 ?auto_188018 ) ) ( not ( = ?auto_188013 ?auto_188019 ) ) ( not ( = ?auto_188013 ?auto_188020 ) ) ( not ( = ?auto_188013 ?auto_188021 ) ) ( not ( = ?auto_188013 ?auto_188022 ) ) ( not ( = ?auto_188014 ?auto_188015 ) ) ( not ( = ?auto_188014 ?auto_188016 ) ) ( not ( = ?auto_188014 ?auto_188017 ) ) ( not ( = ?auto_188014 ?auto_188018 ) ) ( not ( = ?auto_188014 ?auto_188019 ) ) ( not ( = ?auto_188014 ?auto_188020 ) ) ( not ( = ?auto_188014 ?auto_188021 ) ) ( not ( = ?auto_188014 ?auto_188022 ) ) ( not ( = ?auto_188015 ?auto_188016 ) ) ( not ( = ?auto_188015 ?auto_188017 ) ) ( not ( = ?auto_188015 ?auto_188018 ) ) ( not ( = ?auto_188015 ?auto_188019 ) ) ( not ( = ?auto_188015 ?auto_188020 ) ) ( not ( = ?auto_188015 ?auto_188021 ) ) ( not ( = ?auto_188015 ?auto_188022 ) ) ( not ( = ?auto_188016 ?auto_188017 ) ) ( not ( = ?auto_188016 ?auto_188018 ) ) ( not ( = ?auto_188016 ?auto_188019 ) ) ( not ( = ?auto_188016 ?auto_188020 ) ) ( not ( = ?auto_188016 ?auto_188021 ) ) ( not ( = ?auto_188016 ?auto_188022 ) ) ( not ( = ?auto_188017 ?auto_188018 ) ) ( not ( = ?auto_188017 ?auto_188019 ) ) ( not ( = ?auto_188017 ?auto_188020 ) ) ( not ( = ?auto_188017 ?auto_188021 ) ) ( not ( = ?auto_188017 ?auto_188022 ) ) ( not ( = ?auto_188018 ?auto_188019 ) ) ( not ( = ?auto_188018 ?auto_188020 ) ) ( not ( = ?auto_188018 ?auto_188021 ) ) ( not ( = ?auto_188018 ?auto_188022 ) ) ( not ( = ?auto_188019 ?auto_188020 ) ) ( not ( = ?auto_188019 ?auto_188021 ) ) ( not ( = ?auto_188019 ?auto_188022 ) ) ( not ( = ?auto_188020 ?auto_188021 ) ) ( not ( = ?auto_188020 ?auto_188022 ) ) ( not ( = ?auto_188021 ?auto_188022 ) ) ( ON ?auto_188020 ?auto_188021 ) ( ON ?auto_188019 ?auto_188020 ) ( ON ?auto_188018 ?auto_188019 ) ( ON ?auto_188017 ?auto_188018 ) ( CLEAR ?auto_188015 ) ( ON ?auto_188016 ?auto_188017 ) ( CLEAR ?auto_188016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188011 ?auto_188012 ?auto_188013 ?auto_188014 ?auto_188015 ?auto_188016 )
      ( MAKE-11PILE ?auto_188011 ?auto_188012 ?auto_188013 ?auto_188014 ?auto_188015 ?auto_188016 ?auto_188017 ?auto_188018 ?auto_188019 ?auto_188020 ?auto_188021 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_188034 - BLOCK
      ?auto_188035 - BLOCK
      ?auto_188036 - BLOCK
      ?auto_188037 - BLOCK
      ?auto_188038 - BLOCK
      ?auto_188039 - BLOCK
      ?auto_188040 - BLOCK
      ?auto_188041 - BLOCK
      ?auto_188042 - BLOCK
      ?auto_188043 - BLOCK
      ?auto_188044 - BLOCK
    )
    :vars
    (
      ?auto_188045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188044 ?auto_188045 ) ( ON-TABLE ?auto_188034 ) ( ON ?auto_188035 ?auto_188034 ) ( ON ?auto_188036 ?auto_188035 ) ( ON ?auto_188037 ?auto_188036 ) ( not ( = ?auto_188034 ?auto_188035 ) ) ( not ( = ?auto_188034 ?auto_188036 ) ) ( not ( = ?auto_188034 ?auto_188037 ) ) ( not ( = ?auto_188034 ?auto_188038 ) ) ( not ( = ?auto_188034 ?auto_188039 ) ) ( not ( = ?auto_188034 ?auto_188040 ) ) ( not ( = ?auto_188034 ?auto_188041 ) ) ( not ( = ?auto_188034 ?auto_188042 ) ) ( not ( = ?auto_188034 ?auto_188043 ) ) ( not ( = ?auto_188034 ?auto_188044 ) ) ( not ( = ?auto_188034 ?auto_188045 ) ) ( not ( = ?auto_188035 ?auto_188036 ) ) ( not ( = ?auto_188035 ?auto_188037 ) ) ( not ( = ?auto_188035 ?auto_188038 ) ) ( not ( = ?auto_188035 ?auto_188039 ) ) ( not ( = ?auto_188035 ?auto_188040 ) ) ( not ( = ?auto_188035 ?auto_188041 ) ) ( not ( = ?auto_188035 ?auto_188042 ) ) ( not ( = ?auto_188035 ?auto_188043 ) ) ( not ( = ?auto_188035 ?auto_188044 ) ) ( not ( = ?auto_188035 ?auto_188045 ) ) ( not ( = ?auto_188036 ?auto_188037 ) ) ( not ( = ?auto_188036 ?auto_188038 ) ) ( not ( = ?auto_188036 ?auto_188039 ) ) ( not ( = ?auto_188036 ?auto_188040 ) ) ( not ( = ?auto_188036 ?auto_188041 ) ) ( not ( = ?auto_188036 ?auto_188042 ) ) ( not ( = ?auto_188036 ?auto_188043 ) ) ( not ( = ?auto_188036 ?auto_188044 ) ) ( not ( = ?auto_188036 ?auto_188045 ) ) ( not ( = ?auto_188037 ?auto_188038 ) ) ( not ( = ?auto_188037 ?auto_188039 ) ) ( not ( = ?auto_188037 ?auto_188040 ) ) ( not ( = ?auto_188037 ?auto_188041 ) ) ( not ( = ?auto_188037 ?auto_188042 ) ) ( not ( = ?auto_188037 ?auto_188043 ) ) ( not ( = ?auto_188037 ?auto_188044 ) ) ( not ( = ?auto_188037 ?auto_188045 ) ) ( not ( = ?auto_188038 ?auto_188039 ) ) ( not ( = ?auto_188038 ?auto_188040 ) ) ( not ( = ?auto_188038 ?auto_188041 ) ) ( not ( = ?auto_188038 ?auto_188042 ) ) ( not ( = ?auto_188038 ?auto_188043 ) ) ( not ( = ?auto_188038 ?auto_188044 ) ) ( not ( = ?auto_188038 ?auto_188045 ) ) ( not ( = ?auto_188039 ?auto_188040 ) ) ( not ( = ?auto_188039 ?auto_188041 ) ) ( not ( = ?auto_188039 ?auto_188042 ) ) ( not ( = ?auto_188039 ?auto_188043 ) ) ( not ( = ?auto_188039 ?auto_188044 ) ) ( not ( = ?auto_188039 ?auto_188045 ) ) ( not ( = ?auto_188040 ?auto_188041 ) ) ( not ( = ?auto_188040 ?auto_188042 ) ) ( not ( = ?auto_188040 ?auto_188043 ) ) ( not ( = ?auto_188040 ?auto_188044 ) ) ( not ( = ?auto_188040 ?auto_188045 ) ) ( not ( = ?auto_188041 ?auto_188042 ) ) ( not ( = ?auto_188041 ?auto_188043 ) ) ( not ( = ?auto_188041 ?auto_188044 ) ) ( not ( = ?auto_188041 ?auto_188045 ) ) ( not ( = ?auto_188042 ?auto_188043 ) ) ( not ( = ?auto_188042 ?auto_188044 ) ) ( not ( = ?auto_188042 ?auto_188045 ) ) ( not ( = ?auto_188043 ?auto_188044 ) ) ( not ( = ?auto_188043 ?auto_188045 ) ) ( not ( = ?auto_188044 ?auto_188045 ) ) ( ON ?auto_188043 ?auto_188044 ) ( ON ?auto_188042 ?auto_188043 ) ( ON ?auto_188041 ?auto_188042 ) ( ON ?auto_188040 ?auto_188041 ) ( ON ?auto_188039 ?auto_188040 ) ( CLEAR ?auto_188037 ) ( ON ?auto_188038 ?auto_188039 ) ( CLEAR ?auto_188038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188034 ?auto_188035 ?auto_188036 ?auto_188037 ?auto_188038 )
      ( MAKE-11PILE ?auto_188034 ?auto_188035 ?auto_188036 ?auto_188037 ?auto_188038 ?auto_188039 ?auto_188040 ?auto_188041 ?auto_188042 ?auto_188043 ?auto_188044 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_188057 - BLOCK
      ?auto_188058 - BLOCK
      ?auto_188059 - BLOCK
      ?auto_188060 - BLOCK
      ?auto_188061 - BLOCK
      ?auto_188062 - BLOCK
      ?auto_188063 - BLOCK
      ?auto_188064 - BLOCK
      ?auto_188065 - BLOCK
      ?auto_188066 - BLOCK
      ?auto_188067 - BLOCK
    )
    :vars
    (
      ?auto_188068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188067 ?auto_188068 ) ( ON-TABLE ?auto_188057 ) ( ON ?auto_188058 ?auto_188057 ) ( ON ?auto_188059 ?auto_188058 ) ( ON ?auto_188060 ?auto_188059 ) ( not ( = ?auto_188057 ?auto_188058 ) ) ( not ( = ?auto_188057 ?auto_188059 ) ) ( not ( = ?auto_188057 ?auto_188060 ) ) ( not ( = ?auto_188057 ?auto_188061 ) ) ( not ( = ?auto_188057 ?auto_188062 ) ) ( not ( = ?auto_188057 ?auto_188063 ) ) ( not ( = ?auto_188057 ?auto_188064 ) ) ( not ( = ?auto_188057 ?auto_188065 ) ) ( not ( = ?auto_188057 ?auto_188066 ) ) ( not ( = ?auto_188057 ?auto_188067 ) ) ( not ( = ?auto_188057 ?auto_188068 ) ) ( not ( = ?auto_188058 ?auto_188059 ) ) ( not ( = ?auto_188058 ?auto_188060 ) ) ( not ( = ?auto_188058 ?auto_188061 ) ) ( not ( = ?auto_188058 ?auto_188062 ) ) ( not ( = ?auto_188058 ?auto_188063 ) ) ( not ( = ?auto_188058 ?auto_188064 ) ) ( not ( = ?auto_188058 ?auto_188065 ) ) ( not ( = ?auto_188058 ?auto_188066 ) ) ( not ( = ?auto_188058 ?auto_188067 ) ) ( not ( = ?auto_188058 ?auto_188068 ) ) ( not ( = ?auto_188059 ?auto_188060 ) ) ( not ( = ?auto_188059 ?auto_188061 ) ) ( not ( = ?auto_188059 ?auto_188062 ) ) ( not ( = ?auto_188059 ?auto_188063 ) ) ( not ( = ?auto_188059 ?auto_188064 ) ) ( not ( = ?auto_188059 ?auto_188065 ) ) ( not ( = ?auto_188059 ?auto_188066 ) ) ( not ( = ?auto_188059 ?auto_188067 ) ) ( not ( = ?auto_188059 ?auto_188068 ) ) ( not ( = ?auto_188060 ?auto_188061 ) ) ( not ( = ?auto_188060 ?auto_188062 ) ) ( not ( = ?auto_188060 ?auto_188063 ) ) ( not ( = ?auto_188060 ?auto_188064 ) ) ( not ( = ?auto_188060 ?auto_188065 ) ) ( not ( = ?auto_188060 ?auto_188066 ) ) ( not ( = ?auto_188060 ?auto_188067 ) ) ( not ( = ?auto_188060 ?auto_188068 ) ) ( not ( = ?auto_188061 ?auto_188062 ) ) ( not ( = ?auto_188061 ?auto_188063 ) ) ( not ( = ?auto_188061 ?auto_188064 ) ) ( not ( = ?auto_188061 ?auto_188065 ) ) ( not ( = ?auto_188061 ?auto_188066 ) ) ( not ( = ?auto_188061 ?auto_188067 ) ) ( not ( = ?auto_188061 ?auto_188068 ) ) ( not ( = ?auto_188062 ?auto_188063 ) ) ( not ( = ?auto_188062 ?auto_188064 ) ) ( not ( = ?auto_188062 ?auto_188065 ) ) ( not ( = ?auto_188062 ?auto_188066 ) ) ( not ( = ?auto_188062 ?auto_188067 ) ) ( not ( = ?auto_188062 ?auto_188068 ) ) ( not ( = ?auto_188063 ?auto_188064 ) ) ( not ( = ?auto_188063 ?auto_188065 ) ) ( not ( = ?auto_188063 ?auto_188066 ) ) ( not ( = ?auto_188063 ?auto_188067 ) ) ( not ( = ?auto_188063 ?auto_188068 ) ) ( not ( = ?auto_188064 ?auto_188065 ) ) ( not ( = ?auto_188064 ?auto_188066 ) ) ( not ( = ?auto_188064 ?auto_188067 ) ) ( not ( = ?auto_188064 ?auto_188068 ) ) ( not ( = ?auto_188065 ?auto_188066 ) ) ( not ( = ?auto_188065 ?auto_188067 ) ) ( not ( = ?auto_188065 ?auto_188068 ) ) ( not ( = ?auto_188066 ?auto_188067 ) ) ( not ( = ?auto_188066 ?auto_188068 ) ) ( not ( = ?auto_188067 ?auto_188068 ) ) ( ON ?auto_188066 ?auto_188067 ) ( ON ?auto_188065 ?auto_188066 ) ( ON ?auto_188064 ?auto_188065 ) ( ON ?auto_188063 ?auto_188064 ) ( ON ?auto_188062 ?auto_188063 ) ( CLEAR ?auto_188060 ) ( ON ?auto_188061 ?auto_188062 ) ( CLEAR ?auto_188061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188057 ?auto_188058 ?auto_188059 ?auto_188060 ?auto_188061 )
      ( MAKE-11PILE ?auto_188057 ?auto_188058 ?auto_188059 ?auto_188060 ?auto_188061 ?auto_188062 ?auto_188063 ?auto_188064 ?auto_188065 ?auto_188066 ?auto_188067 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_188080 - BLOCK
      ?auto_188081 - BLOCK
      ?auto_188082 - BLOCK
      ?auto_188083 - BLOCK
      ?auto_188084 - BLOCK
      ?auto_188085 - BLOCK
      ?auto_188086 - BLOCK
      ?auto_188087 - BLOCK
      ?auto_188088 - BLOCK
      ?auto_188089 - BLOCK
      ?auto_188090 - BLOCK
    )
    :vars
    (
      ?auto_188091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188090 ?auto_188091 ) ( ON-TABLE ?auto_188080 ) ( ON ?auto_188081 ?auto_188080 ) ( ON ?auto_188082 ?auto_188081 ) ( not ( = ?auto_188080 ?auto_188081 ) ) ( not ( = ?auto_188080 ?auto_188082 ) ) ( not ( = ?auto_188080 ?auto_188083 ) ) ( not ( = ?auto_188080 ?auto_188084 ) ) ( not ( = ?auto_188080 ?auto_188085 ) ) ( not ( = ?auto_188080 ?auto_188086 ) ) ( not ( = ?auto_188080 ?auto_188087 ) ) ( not ( = ?auto_188080 ?auto_188088 ) ) ( not ( = ?auto_188080 ?auto_188089 ) ) ( not ( = ?auto_188080 ?auto_188090 ) ) ( not ( = ?auto_188080 ?auto_188091 ) ) ( not ( = ?auto_188081 ?auto_188082 ) ) ( not ( = ?auto_188081 ?auto_188083 ) ) ( not ( = ?auto_188081 ?auto_188084 ) ) ( not ( = ?auto_188081 ?auto_188085 ) ) ( not ( = ?auto_188081 ?auto_188086 ) ) ( not ( = ?auto_188081 ?auto_188087 ) ) ( not ( = ?auto_188081 ?auto_188088 ) ) ( not ( = ?auto_188081 ?auto_188089 ) ) ( not ( = ?auto_188081 ?auto_188090 ) ) ( not ( = ?auto_188081 ?auto_188091 ) ) ( not ( = ?auto_188082 ?auto_188083 ) ) ( not ( = ?auto_188082 ?auto_188084 ) ) ( not ( = ?auto_188082 ?auto_188085 ) ) ( not ( = ?auto_188082 ?auto_188086 ) ) ( not ( = ?auto_188082 ?auto_188087 ) ) ( not ( = ?auto_188082 ?auto_188088 ) ) ( not ( = ?auto_188082 ?auto_188089 ) ) ( not ( = ?auto_188082 ?auto_188090 ) ) ( not ( = ?auto_188082 ?auto_188091 ) ) ( not ( = ?auto_188083 ?auto_188084 ) ) ( not ( = ?auto_188083 ?auto_188085 ) ) ( not ( = ?auto_188083 ?auto_188086 ) ) ( not ( = ?auto_188083 ?auto_188087 ) ) ( not ( = ?auto_188083 ?auto_188088 ) ) ( not ( = ?auto_188083 ?auto_188089 ) ) ( not ( = ?auto_188083 ?auto_188090 ) ) ( not ( = ?auto_188083 ?auto_188091 ) ) ( not ( = ?auto_188084 ?auto_188085 ) ) ( not ( = ?auto_188084 ?auto_188086 ) ) ( not ( = ?auto_188084 ?auto_188087 ) ) ( not ( = ?auto_188084 ?auto_188088 ) ) ( not ( = ?auto_188084 ?auto_188089 ) ) ( not ( = ?auto_188084 ?auto_188090 ) ) ( not ( = ?auto_188084 ?auto_188091 ) ) ( not ( = ?auto_188085 ?auto_188086 ) ) ( not ( = ?auto_188085 ?auto_188087 ) ) ( not ( = ?auto_188085 ?auto_188088 ) ) ( not ( = ?auto_188085 ?auto_188089 ) ) ( not ( = ?auto_188085 ?auto_188090 ) ) ( not ( = ?auto_188085 ?auto_188091 ) ) ( not ( = ?auto_188086 ?auto_188087 ) ) ( not ( = ?auto_188086 ?auto_188088 ) ) ( not ( = ?auto_188086 ?auto_188089 ) ) ( not ( = ?auto_188086 ?auto_188090 ) ) ( not ( = ?auto_188086 ?auto_188091 ) ) ( not ( = ?auto_188087 ?auto_188088 ) ) ( not ( = ?auto_188087 ?auto_188089 ) ) ( not ( = ?auto_188087 ?auto_188090 ) ) ( not ( = ?auto_188087 ?auto_188091 ) ) ( not ( = ?auto_188088 ?auto_188089 ) ) ( not ( = ?auto_188088 ?auto_188090 ) ) ( not ( = ?auto_188088 ?auto_188091 ) ) ( not ( = ?auto_188089 ?auto_188090 ) ) ( not ( = ?auto_188089 ?auto_188091 ) ) ( not ( = ?auto_188090 ?auto_188091 ) ) ( ON ?auto_188089 ?auto_188090 ) ( ON ?auto_188088 ?auto_188089 ) ( ON ?auto_188087 ?auto_188088 ) ( ON ?auto_188086 ?auto_188087 ) ( ON ?auto_188085 ?auto_188086 ) ( ON ?auto_188084 ?auto_188085 ) ( CLEAR ?auto_188082 ) ( ON ?auto_188083 ?auto_188084 ) ( CLEAR ?auto_188083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188080 ?auto_188081 ?auto_188082 ?auto_188083 )
      ( MAKE-11PILE ?auto_188080 ?auto_188081 ?auto_188082 ?auto_188083 ?auto_188084 ?auto_188085 ?auto_188086 ?auto_188087 ?auto_188088 ?auto_188089 ?auto_188090 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_188103 - BLOCK
      ?auto_188104 - BLOCK
      ?auto_188105 - BLOCK
      ?auto_188106 - BLOCK
      ?auto_188107 - BLOCK
      ?auto_188108 - BLOCK
      ?auto_188109 - BLOCK
      ?auto_188110 - BLOCK
      ?auto_188111 - BLOCK
      ?auto_188112 - BLOCK
      ?auto_188113 - BLOCK
    )
    :vars
    (
      ?auto_188114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188113 ?auto_188114 ) ( ON-TABLE ?auto_188103 ) ( ON ?auto_188104 ?auto_188103 ) ( ON ?auto_188105 ?auto_188104 ) ( not ( = ?auto_188103 ?auto_188104 ) ) ( not ( = ?auto_188103 ?auto_188105 ) ) ( not ( = ?auto_188103 ?auto_188106 ) ) ( not ( = ?auto_188103 ?auto_188107 ) ) ( not ( = ?auto_188103 ?auto_188108 ) ) ( not ( = ?auto_188103 ?auto_188109 ) ) ( not ( = ?auto_188103 ?auto_188110 ) ) ( not ( = ?auto_188103 ?auto_188111 ) ) ( not ( = ?auto_188103 ?auto_188112 ) ) ( not ( = ?auto_188103 ?auto_188113 ) ) ( not ( = ?auto_188103 ?auto_188114 ) ) ( not ( = ?auto_188104 ?auto_188105 ) ) ( not ( = ?auto_188104 ?auto_188106 ) ) ( not ( = ?auto_188104 ?auto_188107 ) ) ( not ( = ?auto_188104 ?auto_188108 ) ) ( not ( = ?auto_188104 ?auto_188109 ) ) ( not ( = ?auto_188104 ?auto_188110 ) ) ( not ( = ?auto_188104 ?auto_188111 ) ) ( not ( = ?auto_188104 ?auto_188112 ) ) ( not ( = ?auto_188104 ?auto_188113 ) ) ( not ( = ?auto_188104 ?auto_188114 ) ) ( not ( = ?auto_188105 ?auto_188106 ) ) ( not ( = ?auto_188105 ?auto_188107 ) ) ( not ( = ?auto_188105 ?auto_188108 ) ) ( not ( = ?auto_188105 ?auto_188109 ) ) ( not ( = ?auto_188105 ?auto_188110 ) ) ( not ( = ?auto_188105 ?auto_188111 ) ) ( not ( = ?auto_188105 ?auto_188112 ) ) ( not ( = ?auto_188105 ?auto_188113 ) ) ( not ( = ?auto_188105 ?auto_188114 ) ) ( not ( = ?auto_188106 ?auto_188107 ) ) ( not ( = ?auto_188106 ?auto_188108 ) ) ( not ( = ?auto_188106 ?auto_188109 ) ) ( not ( = ?auto_188106 ?auto_188110 ) ) ( not ( = ?auto_188106 ?auto_188111 ) ) ( not ( = ?auto_188106 ?auto_188112 ) ) ( not ( = ?auto_188106 ?auto_188113 ) ) ( not ( = ?auto_188106 ?auto_188114 ) ) ( not ( = ?auto_188107 ?auto_188108 ) ) ( not ( = ?auto_188107 ?auto_188109 ) ) ( not ( = ?auto_188107 ?auto_188110 ) ) ( not ( = ?auto_188107 ?auto_188111 ) ) ( not ( = ?auto_188107 ?auto_188112 ) ) ( not ( = ?auto_188107 ?auto_188113 ) ) ( not ( = ?auto_188107 ?auto_188114 ) ) ( not ( = ?auto_188108 ?auto_188109 ) ) ( not ( = ?auto_188108 ?auto_188110 ) ) ( not ( = ?auto_188108 ?auto_188111 ) ) ( not ( = ?auto_188108 ?auto_188112 ) ) ( not ( = ?auto_188108 ?auto_188113 ) ) ( not ( = ?auto_188108 ?auto_188114 ) ) ( not ( = ?auto_188109 ?auto_188110 ) ) ( not ( = ?auto_188109 ?auto_188111 ) ) ( not ( = ?auto_188109 ?auto_188112 ) ) ( not ( = ?auto_188109 ?auto_188113 ) ) ( not ( = ?auto_188109 ?auto_188114 ) ) ( not ( = ?auto_188110 ?auto_188111 ) ) ( not ( = ?auto_188110 ?auto_188112 ) ) ( not ( = ?auto_188110 ?auto_188113 ) ) ( not ( = ?auto_188110 ?auto_188114 ) ) ( not ( = ?auto_188111 ?auto_188112 ) ) ( not ( = ?auto_188111 ?auto_188113 ) ) ( not ( = ?auto_188111 ?auto_188114 ) ) ( not ( = ?auto_188112 ?auto_188113 ) ) ( not ( = ?auto_188112 ?auto_188114 ) ) ( not ( = ?auto_188113 ?auto_188114 ) ) ( ON ?auto_188112 ?auto_188113 ) ( ON ?auto_188111 ?auto_188112 ) ( ON ?auto_188110 ?auto_188111 ) ( ON ?auto_188109 ?auto_188110 ) ( ON ?auto_188108 ?auto_188109 ) ( ON ?auto_188107 ?auto_188108 ) ( CLEAR ?auto_188105 ) ( ON ?auto_188106 ?auto_188107 ) ( CLEAR ?auto_188106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188103 ?auto_188104 ?auto_188105 ?auto_188106 )
      ( MAKE-11PILE ?auto_188103 ?auto_188104 ?auto_188105 ?auto_188106 ?auto_188107 ?auto_188108 ?auto_188109 ?auto_188110 ?auto_188111 ?auto_188112 ?auto_188113 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_188126 - BLOCK
      ?auto_188127 - BLOCK
      ?auto_188128 - BLOCK
      ?auto_188129 - BLOCK
      ?auto_188130 - BLOCK
      ?auto_188131 - BLOCK
      ?auto_188132 - BLOCK
      ?auto_188133 - BLOCK
      ?auto_188134 - BLOCK
      ?auto_188135 - BLOCK
      ?auto_188136 - BLOCK
    )
    :vars
    (
      ?auto_188137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188136 ?auto_188137 ) ( ON-TABLE ?auto_188126 ) ( ON ?auto_188127 ?auto_188126 ) ( not ( = ?auto_188126 ?auto_188127 ) ) ( not ( = ?auto_188126 ?auto_188128 ) ) ( not ( = ?auto_188126 ?auto_188129 ) ) ( not ( = ?auto_188126 ?auto_188130 ) ) ( not ( = ?auto_188126 ?auto_188131 ) ) ( not ( = ?auto_188126 ?auto_188132 ) ) ( not ( = ?auto_188126 ?auto_188133 ) ) ( not ( = ?auto_188126 ?auto_188134 ) ) ( not ( = ?auto_188126 ?auto_188135 ) ) ( not ( = ?auto_188126 ?auto_188136 ) ) ( not ( = ?auto_188126 ?auto_188137 ) ) ( not ( = ?auto_188127 ?auto_188128 ) ) ( not ( = ?auto_188127 ?auto_188129 ) ) ( not ( = ?auto_188127 ?auto_188130 ) ) ( not ( = ?auto_188127 ?auto_188131 ) ) ( not ( = ?auto_188127 ?auto_188132 ) ) ( not ( = ?auto_188127 ?auto_188133 ) ) ( not ( = ?auto_188127 ?auto_188134 ) ) ( not ( = ?auto_188127 ?auto_188135 ) ) ( not ( = ?auto_188127 ?auto_188136 ) ) ( not ( = ?auto_188127 ?auto_188137 ) ) ( not ( = ?auto_188128 ?auto_188129 ) ) ( not ( = ?auto_188128 ?auto_188130 ) ) ( not ( = ?auto_188128 ?auto_188131 ) ) ( not ( = ?auto_188128 ?auto_188132 ) ) ( not ( = ?auto_188128 ?auto_188133 ) ) ( not ( = ?auto_188128 ?auto_188134 ) ) ( not ( = ?auto_188128 ?auto_188135 ) ) ( not ( = ?auto_188128 ?auto_188136 ) ) ( not ( = ?auto_188128 ?auto_188137 ) ) ( not ( = ?auto_188129 ?auto_188130 ) ) ( not ( = ?auto_188129 ?auto_188131 ) ) ( not ( = ?auto_188129 ?auto_188132 ) ) ( not ( = ?auto_188129 ?auto_188133 ) ) ( not ( = ?auto_188129 ?auto_188134 ) ) ( not ( = ?auto_188129 ?auto_188135 ) ) ( not ( = ?auto_188129 ?auto_188136 ) ) ( not ( = ?auto_188129 ?auto_188137 ) ) ( not ( = ?auto_188130 ?auto_188131 ) ) ( not ( = ?auto_188130 ?auto_188132 ) ) ( not ( = ?auto_188130 ?auto_188133 ) ) ( not ( = ?auto_188130 ?auto_188134 ) ) ( not ( = ?auto_188130 ?auto_188135 ) ) ( not ( = ?auto_188130 ?auto_188136 ) ) ( not ( = ?auto_188130 ?auto_188137 ) ) ( not ( = ?auto_188131 ?auto_188132 ) ) ( not ( = ?auto_188131 ?auto_188133 ) ) ( not ( = ?auto_188131 ?auto_188134 ) ) ( not ( = ?auto_188131 ?auto_188135 ) ) ( not ( = ?auto_188131 ?auto_188136 ) ) ( not ( = ?auto_188131 ?auto_188137 ) ) ( not ( = ?auto_188132 ?auto_188133 ) ) ( not ( = ?auto_188132 ?auto_188134 ) ) ( not ( = ?auto_188132 ?auto_188135 ) ) ( not ( = ?auto_188132 ?auto_188136 ) ) ( not ( = ?auto_188132 ?auto_188137 ) ) ( not ( = ?auto_188133 ?auto_188134 ) ) ( not ( = ?auto_188133 ?auto_188135 ) ) ( not ( = ?auto_188133 ?auto_188136 ) ) ( not ( = ?auto_188133 ?auto_188137 ) ) ( not ( = ?auto_188134 ?auto_188135 ) ) ( not ( = ?auto_188134 ?auto_188136 ) ) ( not ( = ?auto_188134 ?auto_188137 ) ) ( not ( = ?auto_188135 ?auto_188136 ) ) ( not ( = ?auto_188135 ?auto_188137 ) ) ( not ( = ?auto_188136 ?auto_188137 ) ) ( ON ?auto_188135 ?auto_188136 ) ( ON ?auto_188134 ?auto_188135 ) ( ON ?auto_188133 ?auto_188134 ) ( ON ?auto_188132 ?auto_188133 ) ( ON ?auto_188131 ?auto_188132 ) ( ON ?auto_188130 ?auto_188131 ) ( ON ?auto_188129 ?auto_188130 ) ( CLEAR ?auto_188127 ) ( ON ?auto_188128 ?auto_188129 ) ( CLEAR ?auto_188128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188126 ?auto_188127 ?auto_188128 )
      ( MAKE-11PILE ?auto_188126 ?auto_188127 ?auto_188128 ?auto_188129 ?auto_188130 ?auto_188131 ?auto_188132 ?auto_188133 ?auto_188134 ?auto_188135 ?auto_188136 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_188149 - BLOCK
      ?auto_188150 - BLOCK
      ?auto_188151 - BLOCK
      ?auto_188152 - BLOCK
      ?auto_188153 - BLOCK
      ?auto_188154 - BLOCK
      ?auto_188155 - BLOCK
      ?auto_188156 - BLOCK
      ?auto_188157 - BLOCK
      ?auto_188158 - BLOCK
      ?auto_188159 - BLOCK
    )
    :vars
    (
      ?auto_188160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188159 ?auto_188160 ) ( ON-TABLE ?auto_188149 ) ( ON ?auto_188150 ?auto_188149 ) ( not ( = ?auto_188149 ?auto_188150 ) ) ( not ( = ?auto_188149 ?auto_188151 ) ) ( not ( = ?auto_188149 ?auto_188152 ) ) ( not ( = ?auto_188149 ?auto_188153 ) ) ( not ( = ?auto_188149 ?auto_188154 ) ) ( not ( = ?auto_188149 ?auto_188155 ) ) ( not ( = ?auto_188149 ?auto_188156 ) ) ( not ( = ?auto_188149 ?auto_188157 ) ) ( not ( = ?auto_188149 ?auto_188158 ) ) ( not ( = ?auto_188149 ?auto_188159 ) ) ( not ( = ?auto_188149 ?auto_188160 ) ) ( not ( = ?auto_188150 ?auto_188151 ) ) ( not ( = ?auto_188150 ?auto_188152 ) ) ( not ( = ?auto_188150 ?auto_188153 ) ) ( not ( = ?auto_188150 ?auto_188154 ) ) ( not ( = ?auto_188150 ?auto_188155 ) ) ( not ( = ?auto_188150 ?auto_188156 ) ) ( not ( = ?auto_188150 ?auto_188157 ) ) ( not ( = ?auto_188150 ?auto_188158 ) ) ( not ( = ?auto_188150 ?auto_188159 ) ) ( not ( = ?auto_188150 ?auto_188160 ) ) ( not ( = ?auto_188151 ?auto_188152 ) ) ( not ( = ?auto_188151 ?auto_188153 ) ) ( not ( = ?auto_188151 ?auto_188154 ) ) ( not ( = ?auto_188151 ?auto_188155 ) ) ( not ( = ?auto_188151 ?auto_188156 ) ) ( not ( = ?auto_188151 ?auto_188157 ) ) ( not ( = ?auto_188151 ?auto_188158 ) ) ( not ( = ?auto_188151 ?auto_188159 ) ) ( not ( = ?auto_188151 ?auto_188160 ) ) ( not ( = ?auto_188152 ?auto_188153 ) ) ( not ( = ?auto_188152 ?auto_188154 ) ) ( not ( = ?auto_188152 ?auto_188155 ) ) ( not ( = ?auto_188152 ?auto_188156 ) ) ( not ( = ?auto_188152 ?auto_188157 ) ) ( not ( = ?auto_188152 ?auto_188158 ) ) ( not ( = ?auto_188152 ?auto_188159 ) ) ( not ( = ?auto_188152 ?auto_188160 ) ) ( not ( = ?auto_188153 ?auto_188154 ) ) ( not ( = ?auto_188153 ?auto_188155 ) ) ( not ( = ?auto_188153 ?auto_188156 ) ) ( not ( = ?auto_188153 ?auto_188157 ) ) ( not ( = ?auto_188153 ?auto_188158 ) ) ( not ( = ?auto_188153 ?auto_188159 ) ) ( not ( = ?auto_188153 ?auto_188160 ) ) ( not ( = ?auto_188154 ?auto_188155 ) ) ( not ( = ?auto_188154 ?auto_188156 ) ) ( not ( = ?auto_188154 ?auto_188157 ) ) ( not ( = ?auto_188154 ?auto_188158 ) ) ( not ( = ?auto_188154 ?auto_188159 ) ) ( not ( = ?auto_188154 ?auto_188160 ) ) ( not ( = ?auto_188155 ?auto_188156 ) ) ( not ( = ?auto_188155 ?auto_188157 ) ) ( not ( = ?auto_188155 ?auto_188158 ) ) ( not ( = ?auto_188155 ?auto_188159 ) ) ( not ( = ?auto_188155 ?auto_188160 ) ) ( not ( = ?auto_188156 ?auto_188157 ) ) ( not ( = ?auto_188156 ?auto_188158 ) ) ( not ( = ?auto_188156 ?auto_188159 ) ) ( not ( = ?auto_188156 ?auto_188160 ) ) ( not ( = ?auto_188157 ?auto_188158 ) ) ( not ( = ?auto_188157 ?auto_188159 ) ) ( not ( = ?auto_188157 ?auto_188160 ) ) ( not ( = ?auto_188158 ?auto_188159 ) ) ( not ( = ?auto_188158 ?auto_188160 ) ) ( not ( = ?auto_188159 ?auto_188160 ) ) ( ON ?auto_188158 ?auto_188159 ) ( ON ?auto_188157 ?auto_188158 ) ( ON ?auto_188156 ?auto_188157 ) ( ON ?auto_188155 ?auto_188156 ) ( ON ?auto_188154 ?auto_188155 ) ( ON ?auto_188153 ?auto_188154 ) ( ON ?auto_188152 ?auto_188153 ) ( CLEAR ?auto_188150 ) ( ON ?auto_188151 ?auto_188152 ) ( CLEAR ?auto_188151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188149 ?auto_188150 ?auto_188151 )
      ( MAKE-11PILE ?auto_188149 ?auto_188150 ?auto_188151 ?auto_188152 ?auto_188153 ?auto_188154 ?auto_188155 ?auto_188156 ?auto_188157 ?auto_188158 ?auto_188159 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_188172 - BLOCK
      ?auto_188173 - BLOCK
      ?auto_188174 - BLOCK
      ?auto_188175 - BLOCK
      ?auto_188176 - BLOCK
      ?auto_188177 - BLOCK
      ?auto_188178 - BLOCK
      ?auto_188179 - BLOCK
      ?auto_188180 - BLOCK
      ?auto_188181 - BLOCK
      ?auto_188182 - BLOCK
    )
    :vars
    (
      ?auto_188183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188182 ?auto_188183 ) ( ON-TABLE ?auto_188172 ) ( not ( = ?auto_188172 ?auto_188173 ) ) ( not ( = ?auto_188172 ?auto_188174 ) ) ( not ( = ?auto_188172 ?auto_188175 ) ) ( not ( = ?auto_188172 ?auto_188176 ) ) ( not ( = ?auto_188172 ?auto_188177 ) ) ( not ( = ?auto_188172 ?auto_188178 ) ) ( not ( = ?auto_188172 ?auto_188179 ) ) ( not ( = ?auto_188172 ?auto_188180 ) ) ( not ( = ?auto_188172 ?auto_188181 ) ) ( not ( = ?auto_188172 ?auto_188182 ) ) ( not ( = ?auto_188172 ?auto_188183 ) ) ( not ( = ?auto_188173 ?auto_188174 ) ) ( not ( = ?auto_188173 ?auto_188175 ) ) ( not ( = ?auto_188173 ?auto_188176 ) ) ( not ( = ?auto_188173 ?auto_188177 ) ) ( not ( = ?auto_188173 ?auto_188178 ) ) ( not ( = ?auto_188173 ?auto_188179 ) ) ( not ( = ?auto_188173 ?auto_188180 ) ) ( not ( = ?auto_188173 ?auto_188181 ) ) ( not ( = ?auto_188173 ?auto_188182 ) ) ( not ( = ?auto_188173 ?auto_188183 ) ) ( not ( = ?auto_188174 ?auto_188175 ) ) ( not ( = ?auto_188174 ?auto_188176 ) ) ( not ( = ?auto_188174 ?auto_188177 ) ) ( not ( = ?auto_188174 ?auto_188178 ) ) ( not ( = ?auto_188174 ?auto_188179 ) ) ( not ( = ?auto_188174 ?auto_188180 ) ) ( not ( = ?auto_188174 ?auto_188181 ) ) ( not ( = ?auto_188174 ?auto_188182 ) ) ( not ( = ?auto_188174 ?auto_188183 ) ) ( not ( = ?auto_188175 ?auto_188176 ) ) ( not ( = ?auto_188175 ?auto_188177 ) ) ( not ( = ?auto_188175 ?auto_188178 ) ) ( not ( = ?auto_188175 ?auto_188179 ) ) ( not ( = ?auto_188175 ?auto_188180 ) ) ( not ( = ?auto_188175 ?auto_188181 ) ) ( not ( = ?auto_188175 ?auto_188182 ) ) ( not ( = ?auto_188175 ?auto_188183 ) ) ( not ( = ?auto_188176 ?auto_188177 ) ) ( not ( = ?auto_188176 ?auto_188178 ) ) ( not ( = ?auto_188176 ?auto_188179 ) ) ( not ( = ?auto_188176 ?auto_188180 ) ) ( not ( = ?auto_188176 ?auto_188181 ) ) ( not ( = ?auto_188176 ?auto_188182 ) ) ( not ( = ?auto_188176 ?auto_188183 ) ) ( not ( = ?auto_188177 ?auto_188178 ) ) ( not ( = ?auto_188177 ?auto_188179 ) ) ( not ( = ?auto_188177 ?auto_188180 ) ) ( not ( = ?auto_188177 ?auto_188181 ) ) ( not ( = ?auto_188177 ?auto_188182 ) ) ( not ( = ?auto_188177 ?auto_188183 ) ) ( not ( = ?auto_188178 ?auto_188179 ) ) ( not ( = ?auto_188178 ?auto_188180 ) ) ( not ( = ?auto_188178 ?auto_188181 ) ) ( not ( = ?auto_188178 ?auto_188182 ) ) ( not ( = ?auto_188178 ?auto_188183 ) ) ( not ( = ?auto_188179 ?auto_188180 ) ) ( not ( = ?auto_188179 ?auto_188181 ) ) ( not ( = ?auto_188179 ?auto_188182 ) ) ( not ( = ?auto_188179 ?auto_188183 ) ) ( not ( = ?auto_188180 ?auto_188181 ) ) ( not ( = ?auto_188180 ?auto_188182 ) ) ( not ( = ?auto_188180 ?auto_188183 ) ) ( not ( = ?auto_188181 ?auto_188182 ) ) ( not ( = ?auto_188181 ?auto_188183 ) ) ( not ( = ?auto_188182 ?auto_188183 ) ) ( ON ?auto_188181 ?auto_188182 ) ( ON ?auto_188180 ?auto_188181 ) ( ON ?auto_188179 ?auto_188180 ) ( ON ?auto_188178 ?auto_188179 ) ( ON ?auto_188177 ?auto_188178 ) ( ON ?auto_188176 ?auto_188177 ) ( ON ?auto_188175 ?auto_188176 ) ( ON ?auto_188174 ?auto_188175 ) ( CLEAR ?auto_188172 ) ( ON ?auto_188173 ?auto_188174 ) ( CLEAR ?auto_188173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188172 ?auto_188173 )
      ( MAKE-11PILE ?auto_188172 ?auto_188173 ?auto_188174 ?auto_188175 ?auto_188176 ?auto_188177 ?auto_188178 ?auto_188179 ?auto_188180 ?auto_188181 ?auto_188182 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_188195 - BLOCK
      ?auto_188196 - BLOCK
      ?auto_188197 - BLOCK
      ?auto_188198 - BLOCK
      ?auto_188199 - BLOCK
      ?auto_188200 - BLOCK
      ?auto_188201 - BLOCK
      ?auto_188202 - BLOCK
      ?auto_188203 - BLOCK
      ?auto_188204 - BLOCK
      ?auto_188205 - BLOCK
    )
    :vars
    (
      ?auto_188206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188205 ?auto_188206 ) ( ON-TABLE ?auto_188195 ) ( not ( = ?auto_188195 ?auto_188196 ) ) ( not ( = ?auto_188195 ?auto_188197 ) ) ( not ( = ?auto_188195 ?auto_188198 ) ) ( not ( = ?auto_188195 ?auto_188199 ) ) ( not ( = ?auto_188195 ?auto_188200 ) ) ( not ( = ?auto_188195 ?auto_188201 ) ) ( not ( = ?auto_188195 ?auto_188202 ) ) ( not ( = ?auto_188195 ?auto_188203 ) ) ( not ( = ?auto_188195 ?auto_188204 ) ) ( not ( = ?auto_188195 ?auto_188205 ) ) ( not ( = ?auto_188195 ?auto_188206 ) ) ( not ( = ?auto_188196 ?auto_188197 ) ) ( not ( = ?auto_188196 ?auto_188198 ) ) ( not ( = ?auto_188196 ?auto_188199 ) ) ( not ( = ?auto_188196 ?auto_188200 ) ) ( not ( = ?auto_188196 ?auto_188201 ) ) ( not ( = ?auto_188196 ?auto_188202 ) ) ( not ( = ?auto_188196 ?auto_188203 ) ) ( not ( = ?auto_188196 ?auto_188204 ) ) ( not ( = ?auto_188196 ?auto_188205 ) ) ( not ( = ?auto_188196 ?auto_188206 ) ) ( not ( = ?auto_188197 ?auto_188198 ) ) ( not ( = ?auto_188197 ?auto_188199 ) ) ( not ( = ?auto_188197 ?auto_188200 ) ) ( not ( = ?auto_188197 ?auto_188201 ) ) ( not ( = ?auto_188197 ?auto_188202 ) ) ( not ( = ?auto_188197 ?auto_188203 ) ) ( not ( = ?auto_188197 ?auto_188204 ) ) ( not ( = ?auto_188197 ?auto_188205 ) ) ( not ( = ?auto_188197 ?auto_188206 ) ) ( not ( = ?auto_188198 ?auto_188199 ) ) ( not ( = ?auto_188198 ?auto_188200 ) ) ( not ( = ?auto_188198 ?auto_188201 ) ) ( not ( = ?auto_188198 ?auto_188202 ) ) ( not ( = ?auto_188198 ?auto_188203 ) ) ( not ( = ?auto_188198 ?auto_188204 ) ) ( not ( = ?auto_188198 ?auto_188205 ) ) ( not ( = ?auto_188198 ?auto_188206 ) ) ( not ( = ?auto_188199 ?auto_188200 ) ) ( not ( = ?auto_188199 ?auto_188201 ) ) ( not ( = ?auto_188199 ?auto_188202 ) ) ( not ( = ?auto_188199 ?auto_188203 ) ) ( not ( = ?auto_188199 ?auto_188204 ) ) ( not ( = ?auto_188199 ?auto_188205 ) ) ( not ( = ?auto_188199 ?auto_188206 ) ) ( not ( = ?auto_188200 ?auto_188201 ) ) ( not ( = ?auto_188200 ?auto_188202 ) ) ( not ( = ?auto_188200 ?auto_188203 ) ) ( not ( = ?auto_188200 ?auto_188204 ) ) ( not ( = ?auto_188200 ?auto_188205 ) ) ( not ( = ?auto_188200 ?auto_188206 ) ) ( not ( = ?auto_188201 ?auto_188202 ) ) ( not ( = ?auto_188201 ?auto_188203 ) ) ( not ( = ?auto_188201 ?auto_188204 ) ) ( not ( = ?auto_188201 ?auto_188205 ) ) ( not ( = ?auto_188201 ?auto_188206 ) ) ( not ( = ?auto_188202 ?auto_188203 ) ) ( not ( = ?auto_188202 ?auto_188204 ) ) ( not ( = ?auto_188202 ?auto_188205 ) ) ( not ( = ?auto_188202 ?auto_188206 ) ) ( not ( = ?auto_188203 ?auto_188204 ) ) ( not ( = ?auto_188203 ?auto_188205 ) ) ( not ( = ?auto_188203 ?auto_188206 ) ) ( not ( = ?auto_188204 ?auto_188205 ) ) ( not ( = ?auto_188204 ?auto_188206 ) ) ( not ( = ?auto_188205 ?auto_188206 ) ) ( ON ?auto_188204 ?auto_188205 ) ( ON ?auto_188203 ?auto_188204 ) ( ON ?auto_188202 ?auto_188203 ) ( ON ?auto_188201 ?auto_188202 ) ( ON ?auto_188200 ?auto_188201 ) ( ON ?auto_188199 ?auto_188200 ) ( ON ?auto_188198 ?auto_188199 ) ( ON ?auto_188197 ?auto_188198 ) ( CLEAR ?auto_188195 ) ( ON ?auto_188196 ?auto_188197 ) ( CLEAR ?auto_188196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188195 ?auto_188196 )
      ( MAKE-11PILE ?auto_188195 ?auto_188196 ?auto_188197 ?auto_188198 ?auto_188199 ?auto_188200 ?auto_188201 ?auto_188202 ?auto_188203 ?auto_188204 ?auto_188205 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_188218 - BLOCK
      ?auto_188219 - BLOCK
      ?auto_188220 - BLOCK
      ?auto_188221 - BLOCK
      ?auto_188222 - BLOCK
      ?auto_188223 - BLOCK
      ?auto_188224 - BLOCK
      ?auto_188225 - BLOCK
      ?auto_188226 - BLOCK
      ?auto_188227 - BLOCK
      ?auto_188228 - BLOCK
    )
    :vars
    (
      ?auto_188229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188228 ?auto_188229 ) ( not ( = ?auto_188218 ?auto_188219 ) ) ( not ( = ?auto_188218 ?auto_188220 ) ) ( not ( = ?auto_188218 ?auto_188221 ) ) ( not ( = ?auto_188218 ?auto_188222 ) ) ( not ( = ?auto_188218 ?auto_188223 ) ) ( not ( = ?auto_188218 ?auto_188224 ) ) ( not ( = ?auto_188218 ?auto_188225 ) ) ( not ( = ?auto_188218 ?auto_188226 ) ) ( not ( = ?auto_188218 ?auto_188227 ) ) ( not ( = ?auto_188218 ?auto_188228 ) ) ( not ( = ?auto_188218 ?auto_188229 ) ) ( not ( = ?auto_188219 ?auto_188220 ) ) ( not ( = ?auto_188219 ?auto_188221 ) ) ( not ( = ?auto_188219 ?auto_188222 ) ) ( not ( = ?auto_188219 ?auto_188223 ) ) ( not ( = ?auto_188219 ?auto_188224 ) ) ( not ( = ?auto_188219 ?auto_188225 ) ) ( not ( = ?auto_188219 ?auto_188226 ) ) ( not ( = ?auto_188219 ?auto_188227 ) ) ( not ( = ?auto_188219 ?auto_188228 ) ) ( not ( = ?auto_188219 ?auto_188229 ) ) ( not ( = ?auto_188220 ?auto_188221 ) ) ( not ( = ?auto_188220 ?auto_188222 ) ) ( not ( = ?auto_188220 ?auto_188223 ) ) ( not ( = ?auto_188220 ?auto_188224 ) ) ( not ( = ?auto_188220 ?auto_188225 ) ) ( not ( = ?auto_188220 ?auto_188226 ) ) ( not ( = ?auto_188220 ?auto_188227 ) ) ( not ( = ?auto_188220 ?auto_188228 ) ) ( not ( = ?auto_188220 ?auto_188229 ) ) ( not ( = ?auto_188221 ?auto_188222 ) ) ( not ( = ?auto_188221 ?auto_188223 ) ) ( not ( = ?auto_188221 ?auto_188224 ) ) ( not ( = ?auto_188221 ?auto_188225 ) ) ( not ( = ?auto_188221 ?auto_188226 ) ) ( not ( = ?auto_188221 ?auto_188227 ) ) ( not ( = ?auto_188221 ?auto_188228 ) ) ( not ( = ?auto_188221 ?auto_188229 ) ) ( not ( = ?auto_188222 ?auto_188223 ) ) ( not ( = ?auto_188222 ?auto_188224 ) ) ( not ( = ?auto_188222 ?auto_188225 ) ) ( not ( = ?auto_188222 ?auto_188226 ) ) ( not ( = ?auto_188222 ?auto_188227 ) ) ( not ( = ?auto_188222 ?auto_188228 ) ) ( not ( = ?auto_188222 ?auto_188229 ) ) ( not ( = ?auto_188223 ?auto_188224 ) ) ( not ( = ?auto_188223 ?auto_188225 ) ) ( not ( = ?auto_188223 ?auto_188226 ) ) ( not ( = ?auto_188223 ?auto_188227 ) ) ( not ( = ?auto_188223 ?auto_188228 ) ) ( not ( = ?auto_188223 ?auto_188229 ) ) ( not ( = ?auto_188224 ?auto_188225 ) ) ( not ( = ?auto_188224 ?auto_188226 ) ) ( not ( = ?auto_188224 ?auto_188227 ) ) ( not ( = ?auto_188224 ?auto_188228 ) ) ( not ( = ?auto_188224 ?auto_188229 ) ) ( not ( = ?auto_188225 ?auto_188226 ) ) ( not ( = ?auto_188225 ?auto_188227 ) ) ( not ( = ?auto_188225 ?auto_188228 ) ) ( not ( = ?auto_188225 ?auto_188229 ) ) ( not ( = ?auto_188226 ?auto_188227 ) ) ( not ( = ?auto_188226 ?auto_188228 ) ) ( not ( = ?auto_188226 ?auto_188229 ) ) ( not ( = ?auto_188227 ?auto_188228 ) ) ( not ( = ?auto_188227 ?auto_188229 ) ) ( not ( = ?auto_188228 ?auto_188229 ) ) ( ON ?auto_188227 ?auto_188228 ) ( ON ?auto_188226 ?auto_188227 ) ( ON ?auto_188225 ?auto_188226 ) ( ON ?auto_188224 ?auto_188225 ) ( ON ?auto_188223 ?auto_188224 ) ( ON ?auto_188222 ?auto_188223 ) ( ON ?auto_188221 ?auto_188222 ) ( ON ?auto_188220 ?auto_188221 ) ( ON ?auto_188219 ?auto_188220 ) ( ON ?auto_188218 ?auto_188219 ) ( CLEAR ?auto_188218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188218 )
      ( MAKE-11PILE ?auto_188218 ?auto_188219 ?auto_188220 ?auto_188221 ?auto_188222 ?auto_188223 ?auto_188224 ?auto_188225 ?auto_188226 ?auto_188227 ?auto_188228 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_188241 - BLOCK
      ?auto_188242 - BLOCK
      ?auto_188243 - BLOCK
      ?auto_188244 - BLOCK
      ?auto_188245 - BLOCK
      ?auto_188246 - BLOCK
      ?auto_188247 - BLOCK
      ?auto_188248 - BLOCK
      ?auto_188249 - BLOCK
      ?auto_188250 - BLOCK
      ?auto_188251 - BLOCK
    )
    :vars
    (
      ?auto_188252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188251 ?auto_188252 ) ( not ( = ?auto_188241 ?auto_188242 ) ) ( not ( = ?auto_188241 ?auto_188243 ) ) ( not ( = ?auto_188241 ?auto_188244 ) ) ( not ( = ?auto_188241 ?auto_188245 ) ) ( not ( = ?auto_188241 ?auto_188246 ) ) ( not ( = ?auto_188241 ?auto_188247 ) ) ( not ( = ?auto_188241 ?auto_188248 ) ) ( not ( = ?auto_188241 ?auto_188249 ) ) ( not ( = ?auto_188241 ?auto_188250 ) ) ( not ( = ?auto_188241 ?auto_188251 ) ) ( not ( = ?auto_188241 ?auto_188252 ) ) ( not ( = ?auto_188242 ?auto_188243 ) ) ( not ( = ?auto_188242 ?auto_188244 ) ) ( not ( = ?auto_188242 ?auto_188245 ) ) ( not ( = ?auto_188242 ?auto_188246 ) ) ( not ( = ?auto_188242 ?auto_188247 ) ) ( not ( = ?auto_188242 ?auto_188248 ) ) ( not ( = ?auto_188242 ?auto_188249 ) ) ( not ( = ?auto_188242 ?auto_188250 ) ) ( not ( = ?auto_188242 ?auto_188251 ) ) ( not ( = ?auto_188242 ?auto_188252 ) ) ( not ( = ?auto_188243 ?auto_188244 ) ) ( not ( = ?auto_188243 ?auto_188245 ) ) ( not ( = ?auto_188243 ?auto_188246 ) ) ( not ( = ?auto_188243 ?auto_188247 ) ) ( not ( = ?auto_188243 ?auto_188248 ) ) ( not ( = ?auto_188243 ?auto_188249 ) ) ( not ( = ?auto_188243 ?auto_188250 ) ) ( not ( = ?auto_188243 ?auto_188251 ) ) ( not ( = ?auto_188243 ?auto_188252 ) ) ( not ( = ?auto_188244 ?auto_188245 ) ) ( not ( = ?auto_188244 ?auto_188246 ) ) ( not ( = ?auto_188244 ?auto_188247 ) ) ( not ( = ?auto_188244 ?auto_188248 ) ) ( not ( = ?auto_188244 ?auto_188249 ) ) ( not ( = ?auto_188244 ?auto_188250 ) ) ( not ( = ?auto_188244 ?auto_188251 ) ) ( not ( = ?auto_188244 ?auto_188252 ) ) ( not ( = ?auto_188245 ?auto_188246 ) ) ( not ( = ?auto_188245 ?auto_188247 ) ) ( not ( = ?auto_188245 ?auto_188248 ) ) ( not ( = ?auto_188245 ?auto_188249 ) ) ( not ( = ?auto_188245 ?auto_188250 ) ) ( not ( = ?auto_188245 ?auto_188251 ) ) ( not ( = ?auto_188245 ?auto_188252 ) ) ( not ( = ?auto_188246 ?auto_188247 ) ) ( not ( = ?auto_188246 ?auto_188248 ) ) ( not ( = ?auto_188246 ?auto_188249 ) ) ( not ( = ?auto_188246 ?auto_188250 ) ) ( not ( = ?auto_188246 ?auto_188251 ) ) ( not ( = ?auto_188246 ?auto_188252 ) ) ( not ( = ?auto_188247 ?auto_188248 ) ) ( not ( = ?auto_188247 ?auto_188249 ) ) ( not ( = ?auto_188247 ?auto_188250 ) ) ( not ( = ?auto_188247 ?auto_188251 ) ) ( not ( = ?auto_188247 ?auto_188252 ) ) ( not ( = ?auto_188248 ?auto_188249 ) ) ( not ( = ?auto_188248 ?auto_188250 ) ) ( not ( = ?auto_188248 ?auto_188251 ) ) ( not ( = ?auto_188248 ?auto_188252 ) ) ( not ( = ?auto_188249 ?auto_188250 ) ) ( not ( = ?auto_188249 ?auto_188251 ) ) ( not ( = ?auto_188249 ?auto_188252 ) ) ( not ( = ?auto_188250 ?auto_188251 ) ) ( not ( = ?auto_188250 ?auto_188252 ) ) ( not ( = ?auto_188251 ?auto_188252 ) ) ( ON ?auto_188250 ?auto_188251 ) ( ON ?auto_188249 ?auto_188250 ) ( ON ?auto_188248 ?auto_188249 ) ( ON ?auto_188247 ?auto_188248 ) ( ON ?auto_188246 ?auto_188247 ) ( ON ?auto_188245 ?auto_188246 ) ( ON ?auto_188244 ?auto_188245 ) ( ON ?auto_188243 ?auto_188244 ) ( ON ?auto_188242 ?auto_188243 ) ( ON ?auto_188241 ?auto_188242 ) ( CLEAR ?auto_188241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188241 )
      ( MAKE-11PILE ?auto_188241 ?auto_188242 ?auto_188243 ?auto_188244 ?auto_188245 ?auto_188246 ?auto_188247 ?auto_188248 ?auto_188249 ?auto_188250 ?auto_188251 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188265 - BLOCK
      ?auto_188266 - BLOCK
      ?auto_188267 - BLOCK
      ?auto_188268 - BLOCK
      ?auto_188269 - BLOCK
      ?auto_188270 - BLOCK
      ?auto_188271 - BLOCK
      ?auto_188272 - BLOCK
      ?auto_188273 - BLOCK
      ?auto_188274 - BLOCK
      ?auto_188275 - BLOCK
      ?auto_188276 - BLOCK
    )
    :vars
    (
      ?auto_188277 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_188275 ) ( ON ?auto_188276 ?auto_188277 ) ( CLEAR ?auto_188276 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188265 ) ( ON ?auto_188266 ?auto_188265 ) ( ON ?auto_188267 ?auto_188266 ) ( ON ?auto_188268 ?auto_188267 ) ( ON ?auto_188269 ?auto_188268 ) ( ON ?auto_188270 ?auto_188269 ) ( ON ?auto_188271 ?auto_188270 ) ( ON ?auto_188272 ?auto_188271 ) ( ON ?auto_188273 ?auto_188272 ) ( ON ?auto_188274 ?auto_188273 ) ( ON ?auto_188275 ?auto_188274 ) ( not ( = ?auto_188265 ?auto_188266 ) ) ( not ( = ?auto_188265 ?auto_188267 ) ) ( not ( = ?auto_188265 ?auto_188268 ) ) ( not ( = ?auto_188265 ?auto_188269 ) ) ( not ( = ?auto_188265 ?auto_188270 ) ) ( not ( = ?auto_188265 ?auto_188271 ) ) ( not ( = ?auto_188265 ?auto_188272 ) ) ( not ( = ?auto_188265 ?auto_188273 ) ) ( not ( = ?auto_188265 ?auto_188274 ) ) ( not ( = ?auto_188265 ?auto_188275 ) ) ( not ( = ?auto_188265 ?auto_188276 ) ) ( not ( = ?auto_188265 ?auto_188277 ) ) ( not ( = ?auto_188266 ?auto_188267 ) ) ( not ( = ?auto_188266 ?auto_188268 ) ) ( not ( = ?auto_188266 ?auto_188269 ) ) ( not ( = ?auto_188266 ?auto_188270 ) ) ( not ( = ?auto_188266 ?auto_188271 ) ) ( not ( = ?auto_188266 ?auto_188272 ) ) ( not ( = ?auto_188266 ?auto_188273 ) ) ( not ( = ?auto_188266 ?auto_188274 ) ) ( not ( = ?auto_188266 ?auto_188275 ) ) ( not ( = ?auto_188266 ?auto_188276 ) ) ( not ( = ?auto_188266 ?auto_188277 ) ) ( not ( = ?auto_188267 ?auto_188268 ) ) ( not ( = ?auto_188267 ?auto_188269 ) ) ( not ( = ?auto_188267 ?auto_188270 ) ) ( not ( = ?auto_188267 ?auto_188271 ) ) ( not ( = ?auto_188267 ?auto_188272 ) ) ( not ( = ?auto_188267 ?auto_188273 ) ) ( not ( = ?auto_188267 ?auto_188274 ) ) ( not ( = ?auto_188267 ?auto_188275 ) ) ( not ( = ?auto_188267 ?auto_188276 ) ) ( not ( = ?auto_188267 ?auto_188277 ) ) ( not ( = ?auto_188268 ?auto_188269 ) ) ( not ( = ?auto_188268 ?auto_188270 ) ) ( not ( = ?auto_188268 ?auto_188271 ) ) ( not ( = ?auto_188268 ?auto_188272 ) ) ( not ( = ?auto_188268 ?auto_188273 ) ) ( not ( = ?auto_188268 ?auto_188274 ) ) ( not ( = ?auto_188268 ?auto_188275 ) ) ( not ( = ?auto_188268 ?auto_188276 ) ) ( not ( = ?auto_188268 ?auto_188277 ) ) ( not ( = ?auto_188269 ?auto_188270 ) ) ( not ( = ?auto_188269 ?auto_188271 ) ) ( not ( = ?auto_188269 ?auto_188272 ) ) ( not ( = ?auto_188269 ?auto_188273 ) ) ( not ( = ?auto_188269 ?auto_188274 ) ) ( not ( = ?auto_188269 ?auto_188275 ) ) ( not ( = ?auto_188269 ?auto_188276 ) ) ( not ( = ?auto_188269 ?auto_188277 ) ) ( not ( = ?auto_188270 ?auto_188271 ) ) ( not ( = ?auto_188270 ?auto_188272 ) ) ( not ( = ?auto_188270 ?auto_188273 ) ) ( not ( = ?auto_188270 ?auto_188274 ) ) ( not ( = ?auto_188270 ?auto_188275 ) ) ( not ( = ?auto_188270 ?auto_188276 ) ) ( not ( = ?auto_188270 ?auto_188277 ) ) ( not ( = ?auto_188271 ?auto_188272 ) ) ( not ( = ?auto_188271 ?auto_188273 ) ) ( not ( = ?auto_188271 ?auto_188274 ) ) ( not ( = ?auto_188271 ?auto_188275 ) ) ( not ( = ?auto_188271 ?auto_188276 ) ) ( not ( = ?auto_188271 ?auto_188277 ) ) ( not ( = ?auto_188272 ?auto_188273 ) ) ( not ( = ?auto_188272 ?auto_188274 ) ) ( not ( = ?auto_188272 ?auto_188275 ) ) ( not ( = ?auto_188272 ?auto_188276 ) ) ( not ( = ?auto_188272 ?auto_188277 ) ) ( not ( = ?auto_188273 ?auto_188274 ) ) ( not ( = ?auto_188273 ?auto_188275 ) ) ( not ( = ?auto_188273 ?auto_188276 ) ) ( not ( = ?auto_188273 ?auto_188277 ) ) ( not ( = ?auto_188274 ?auto_188275 ) ) ( not ( = ?auto_188274 ?auto_188276 ) ) ( not ( = ?auto_188274 ?auto_188277 ) ) ( not ( = ?auto_188275 ?auto_188276 ) ) ( not ( = ?auto_188275 ?auto_188277 ) ) ( not ( = ?auto_188276 ?auto_188277 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188276 ?auto_188277 )
      ( !STACK ?auto_188276 ?auto_188275 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188290 - BLOCK
      ?auto_188291 - BLOCK
      ?auto_188292 - BLOCK
      ?auto_188293 - BLOCK
      ?auto_188294 - BLOCK
      ?auto_188295 - BLOCK
      ?auto_188296 - BLOCK
      ?auto_188297 - BLOCK
      ?auto_188298 - BLOCK
      ?auto_188299 - BLOCK
      ?auto_188300 - BLOCK
      ?auto_188301 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_188300 ) ( ON-TABLE ?auto_188301 ) ( CLEAR ?auto_188301 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188290 ) ( ON ?auto_188291 ?auto_188290 ) ( ON ?auto_188292 ?auto_188291 ) ( ON ?auto_188293 ?auto_188292 ) ( ON ?auto_188294 ?auto_188293 ) ( ON ?auto_188295 ?auto_188294 ) ( ON ?auto_188296 ?auto_188295 ) ( ON ?auto_188297 ?auto_188296 ) ( ON ?auto_188298 ?auto_188297 ) ( ON ?auto_188299 ?auto_188298 ) ( ON ?auto_188300 ?auto_188299 ) ( not ( = ?auto_188290 ?auto_188291 ) ) ( not ( = ?auto_188290 ?auto_188292 ) ) ( not ( = ?auto_188290 ?auto_188293 ) ) ( not ( = ?auto_188290 ?auto_188294 ) ) ( not ( = ?auto_188290 ?auto_188295 ) ) ( not ( = ?auto_188290 ?auto_188296 ) ) ( not ( = ?auto_188290 ?auto_188297 ) ) ( not ( = ?auto_188290 ?auto_188298 ) ) ( not ( = ?auto_188290 ?auto_188299 ) ) ( not ( = ?auto_188290 ?auto_188300 ) ) ( not ( = ?auto_188290 ?auto_188301 ) ) ( not ( = ?auto_188291 ?auto_188292 ) ) ( not ( = ?auto_188291 ?auto_188293 ) ) ( not ( = ?auto_188291 ?auto_188294 ) ) ( not ( = ?auto_188291 ?auto_188295 ) ) ( not ( = ?auto_188291 ?auto_188296 ) ) ( not ( = ?auto_188291 ?auto_188297 ) ) ( not ( = ?auto_188291 ?auto_188298 ) ) ( not ( = ?auto_188291 ?auto_188299 ) ) ( not ( = ?auto_188291 ?auto_188300 ) ) ( not ( = ?auto_188291 ?auto_188301 ) ) ( not ( = ?auto_188292 ?auto_188293 ) ) ( not ( = ?auto_188292 ?auto_188294 ) ) ( not ( = ?auto_188292 ?auto_188295 ) ) ( not ( = ?auto_188292 ?auto_188296 ) ) ( not ( = ?auto_188292 ?auto_188297 ) ) ( not ( = ?auto_188292 ?auto_188298 ) ) ( not ( = ?auto_188292 ?auto_188299 ) ) ( not ( = ?auto_188292 ?auto_188300 ) ) ( not ( = ?auto_188292 ?auto_188301 ) ) ( not ( = ?auto_188293 ?auto_188294 ) ) ( not ( = ?auto_188293 ?auto_188295 ) ) ( not ( = ?auto_188293 ?auto_188296 ) ) ( not ( = ?auto_188293 ?auto_188297 ) ) ( not ( = ?auto_188293 ?auto_188298 ) ) ( not ( = ?auto_188293 ?auto_188299 ) ) ( not ( = ?auto_188293 ?auto_188300 ) ) ( not ( = ?auto_188293 ?auto_188301 ) ) ( not ( = ?auto_188294 ?auto_188295 ) ) ( not ( = ?auto_188294 ?auto_188296 ) ) ( not ( = ?auto_188294 ?auto_188297 ) ) ( not ( = ?auto_188294 ?auto_188298 ) ) ( not ( = ?auto_188294 ?auto_188299 ) ) ( not ( = ?auto_188294 ?auto_188300 ) ) ( not ( = ?auto_188294 ?auto_188301 ) ) ( not ( = ?auto_188295 ?auto_188296 ) ) ( not ( = ?auto_188295 ?auto_188297 ) ) ( not ( = ?auto_188295 ?auto_188298 ) ) ( not ( = ?auto_188295 ?auto_188299 ) ) ( not ( = ?auto_188295 ?auto_188300 ) ) ( not ( = ?auto_188295 ?auto_188301 ) ) ( not ( = ?auto_188296 ?auto_188297 ) ) ( not ( = ?auto_188296 ?auto_188298 ) ) ( not ( = ?auto_188296 ?auto_188299 ) ) ( not ( = ?auto_188296 ?auto_188300 ) ) ( not ( = ?auto_188296 ?auto_188301 ) ) ( not ( = ?auto_188297 ?auto_188298 ) ) ( not ( = ?auto_188297 ?auto_188299 ) ) ( not ( = ?auto_188297 ?auto_188300 ) ) ( not ( = ?auto_188297 ?auto_188301 ) ) ( not ( = ?auto_188298 ?auto_188299 ) ) ( not ( = ?auto_188298 ?auto_188300 ) ) ( not ( = ?auto_188298 ?auto_188301 ) ) ( not ( = ?auto_188299 ?auto_188300 ) ) ( not ( = ?auto_188299 ?auto_188301 ) ) ( not ( = ?auto_188300 ?auto_188301 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_188301 )
      ( !STACK ?auto_188301 ?auto_188300 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188314 - BLOCK
      ?auto_188315 - BLOCK
      ?auto_188316 - BLOCK
      ?auto_188317 - BLOCK
      ?auto_188318 - BLOCK
      ?auto_188319 - BLOCK
      ?auto_188320 - BLOCK
      ?auto_188321 - BLOCK
      ?auto_188322 - BLOCK
      ?auto_188323 - BLOCK
      ?auto_188324 - BLOCK
      ?auto_188325 - BLOCK
    )
    :vars
    (
      ?auto_188326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188325 ?auto_188326 ) ( ON-TABLE ?auto_188314 ) ( ON ?auto_188315 ?auto_188314 ) ( ON ?auto_188316 ?auto_188315 ) ( ON ?auto_188317 ?auto_188316 ) ( ON ?auto_188318 ?auto_188317 ) ( ON ?auto_188319 ?auto_188318 ) ( ON ?auto_188320 ?auto_188319 ) ( ON ?auto_188321 ?auto_188320 ) ( ON ?auto_188322 ?auto_188321 ) ( ON ?auto_188323 ?auto_188322 ) ( not ( = ?auto_188314 ?auto_188315 ) ) ( not ( = ?auto_188314 ?auto_188316 ) ) ( not ( = ?auto_188314 ?auto_188317 ) ) ( not ( = ?auto_188314 ?auto_188318 ) ) ( not ( = ?auto_188314 ?auto_188319 ) ) ( not ( = ?auto_188314 ?auto_188320 ) ) ( not ( = ?auto_188314 ?auto_188321 ) ) ( not ( = ?auto_188314 ?auto_188322 ) ) ( not ( = ?auto_188314 ?auto_188323 ) ) ( not ( = ?auto_188314 ?auto_188324 ) ) ( not ( = ?auto_188314 ?auto_188325 ) ) ( not ( = ?auto_188314 ?auto_188326 ) ) ( not ( = ?auto_188315 ?auto_188316 ) ) ( not ( = ?auto_188315 ?auto_188317 ) ) ( not ( = ?auto_188315 ?auto_188318 ) ) ( not ( = ?auto_188315 ?auto_188319 ) ) ( not ( = ?auto_188315 ?auto_188320 ) ) ( not ( = ?auto_188315 ?auto_188321 ) ) ( not ( = ?auto_188315 ?auto_188322 ) ) ( not ( = ?auto_188315 ?auto_188323 ) ) ( not ( = ?auto_188315 ?auto_188324 ) ) ( not ( = ?auto_188315 ?auto_188325 ) ) ( not ( = ?auto_188315 ?auto_188326 ) ) ( not ( = ?auto_188316 ?auto_188317 ) ) ( not ( = ?auto_188316 ?auto_188318 ) ) ( not ( = ?auto_188316 ?auto_188319 ) ) ( not ( = ?auto_188316 ?auto_188320 ) ) ( not ( = ?auto_188316 ?auto_188321 ) ) ( not ( = ?auto_188316 ?auto_188322 ) ) ( not ( = ?auto_188316 ?auto_188323 ) ) ( not ( = ?auto_188316 ?auto_188324 ) ) ( not ( = ?auto_188316 ?auto_188325 ) ) ( not ( = ?auto_188316 ?auto_188326 ) ) ( not ( = ?auto_188317 ?auto_188318 ) ) ( not ( = ?auto_188317 ?auto_188319 ) ) ( not ( = ?auto_188317 ?auto_188320 ) ) ( not ( = ?auto_188317 ?auto_188321 ) ) ( not ( = ?auto_188317 ?auto_188322 ) ) ( not ( = ?auto_188317 ?auto_188323 ) ) ( not ( = ?auto_188317 ?auto_188324 ) ) ( not ( = ?auto_188317 ?auto_188325 ) ) ( not ( = ?auto_188317 ?auto_188326 ) ) ( not ( = ?auto_188318 ?auto_188319 ) ) ( not ( = ?auto_188318 ?auto_188320 ) ) ( not ( = ?auto_188318 ?auto_188321 ) ) ( not ( = ?auto_188318 ?auto_188322 ) ) ( not ( = ?auto_188318 ?auto_188323 ) ) ( not ( = ?auto_188318 ?auto_188324 ) ) ( not ( = ?auto_188318 ?auto_188325 ) ) ( not ( = ?auto_188318 ?auto_188326 ) ) ( not ( = ?auto_188319 ?auto_188320 ) ) ( not ( = ?auto_188319 ?auto_188321 ) ) ( not ( = ?auto_188319 ?auto_188322 ) ) ( not ( = ?auto_188319 ?auto_188323 ) ) ( not ( = ?auto_188319 ?auto_188324 ) ) ( not ( = ?auto_188319 ?auto_188325 ) ) ( not ( = ?auto_188319 ?auto_188326 ) ) ( not ( = ?auto_188320 ?auto_188321 ) ) ( not ( = ?auto_188320 ?auto_188322 ) ) ( not ( = ?auto_188320 ?auto_188323 ) ) ( not ( = ?auto_188320 ?auto_188324 ) ) ( not ( = ?auto_188320 ?auto_188325 ) ) ( not ( = ?auto_188320 ?auto_188326 ) ) ( not ( = ?auto_188321 ?auto_188322 ) ) ( not ( = ?auto_188321 ?auto_188323 ) ) ( not ( = ?auto_188321 ?auto_188324 ) ) ( not ( = ?auto_188321 ?auto_188325 ) ) ( not ( = ?auto_188321 ?auto_188326 ) ) ( not ( = ?auto_188322 ?auto_188323 ) ) ( not ( = ?auto_188322 ?auto_188324 ) ) ( not ( = ?auto_188322 ?auto_188325 ) ) ( not ( = ?auto_188322 ?auto_188326 ) ) ( not ( = ?auto_188323 ?auto_188324 ) ) ( not ( = ?auto_188323 ?auto_188325 ) ) ( not ( = ?auto_188323 ?auto_188326 ) ) ( not ( = ?auto_188324 ?auto_188325 ) ) ( not ( = ?auto_188324 ?auto_188326 ) ) ( not ( = ?auto_188325 ?auto_188326 ) ) ( CLEAR ?auto_188323 ) ( ON ?auto_188324 ?auto_188325 ) ( CLEAR ?auto_188324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_188314 ?auto_188315 ?auto_188316 ?auto_188317 ?auto_188318 ?auto_188319 ?auto_188320 ?auto_188321 ?auto_188322 ?auto_188323 ?auto_188324 )
      ( MAKE-12PILE ?auto_188314 ?auto_188315 ?auto_188316 ?auto_188317 ?auto_188318 ?auto_188319 ?auto_188320 ?auto_188321 ?auto_188322 ?auto_188323 ?auto_188324 ?auto_188325 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188339 - BLOCK
      ?auto_188340 - BLOCK
      ?auto_188341 - BLOCK
      ?auto_188342 - BLOCK
      ?auto_188343 - BLOCK
      ?auto_188344 - BLOCK
      ?auto_188345 - BLOCK
      ?auto_188346 - BLOCK
      ?auto_188347 - BLOCK
      ?auto_188348 - BLOCK
      ?auto_188349 - BLOCK
      ?auto_188350 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188350 ) ( ON-TABLE ?auto_188339 ) ( ON ?auto_188340 ?auto_188339 ) ( ON ?auto_188341 ?auto_188340 ) ( ON ?auto_188342 ?auto_188341 ) ( ON ?auto_188343 ?auto_188342 ) ( ON ?auto_188344 ?auto_188343 ) ( ON ?auto_188345 ?auto_188344 ) ( ON ?auto_188346 ?auto_188345 ) ( ON ?auto_188347 ?auto_188346 ) ( ON ?auto_188348 ?auto_188347 ) ( not ( = ?auto_188339 ?auto_188340 ) ) ( not ( = ?auto_188339 ?auto_188341 ) ) ( not ( = ?auto_188339 ?auto_188342 ) ) ( not ( = ?auto_188339 ?auto_188343 ) ) ( not ( = ?auto_188339 ?auto_188344 ) ) ( not ( = ?auto_188339 ?auto_188345 ) ) ( not ( = ?auto_188339 ?auto_188346 ) ) ( not ( = ?auto_188339 ?auto_188347 ) ) ( not ( = ?auto_188339 ?auto_188348 ) ) ( not ( = ?auto_188339 ?auto_188349 ) ) ( not ( = ?auto_188339 ?auto_188350 ) ) ( not ( = ?auto_188340 ?auto_188341 ) ) ( not ( = ?auto_188340 ?auto_188342 ) ) ( not ( = ?auto_188340 ?auto_188343 ) ) ( not ( = ?auto_188340 ?auto_188344 ) ) ( not ( = ?auto_188340 ?auto_188345 ) ) ( not ( = ?auto_188340 ?auto_188346 ) ) ( not ( = ?auto_188340 ?auto_188347 ) ) ( not ( = ?auto_188340 ?auto_188348 ) ) ( not ( = ?auto_188340 ?auto_188349 ) ) ( not ( = ?auto_188340 ?auto_188350 ) ) ( not ( = ?auto_188341 ?auto_188342 ) ) ( not ( = ?auto_188341 ?auto_188343 ) ) ( not ( = ?auto_188341 ?auto_188344 ) ) ( not ( = ?auto_188341 ?auto_188345 ) ) ( not ( = ?auto_188341 ?auto_188346 ) ) ( not ( = ?auto_188341 ?auto_188347 ) ) ( not ( = ?auto_188341 ?auto_188348 ) ) ( not ( = ?auto_188341 ?auto_188349 ) ) ( not ( = ?auto_188341 ?auto_188350 ) ) ( not ( = ?auto_188342 ?auto_188343 ) ) ( not ( = ?auto_188342 ?auto_188344 ) ) ( not ( = ?auto_188342 ?auto_188345 ) ) ( not ( = ?auto_188342 ?auto_188346 ) ) ( not ( = ?auto_188342 ?auto_188347 ) ) ( not ( = ?auto_188342 ?auto_188348 ) ) ( not ( = ?auto_188342 ?auto_188349 ) ) ( not ( = ?auto_188342 ?auto_188350 ) ) ( not ( = ?auto_188343 ?auto_188344 ) ) ( not ( = ?auto_188343 ?auto_188345 ) ) ( not ( = ?auto_188343 ?auto_188346 ) ) ( not ( = ?auto_188343 ?auto_188347 ) ) ( not ( = ?auto_188343 ?auto_188348 ) ) ( not ( = ?auto_188343 ?auto_188349 ) ) ( not ( = ?auto_188343 ?auto_188350 ) ) ( not ( = ?auto_188344 ?auto_188345 ) ) ( not ( = ?auto_188344 ?auto_188346 ) ) ( not ( = ?auto_188344 ?auto_188347 ) ) ( not ( = ?auto_188344 ?auto_188348 ) ) ( not ( = ?auto_188344 ?auto_188349 ) ) ( not ( = ?auto_188344 ?auto_188350 ) ) ( not ( = ?auto_188345 ?auto_188346 ) ) ( not ( = ?auto_188345 ?auto_188347 ) ) ( not ( = ?auto_188345 ?auto_188348 ) ) ( not ( = ?auto_188345 ?auto_188349 ) ) ( not ( = ?auto_188345 ?auto_188350 ) ) ( not ( = ?auto_188346 ?auto_188347 ) ) ( not ( = ?auto_188346 ?auto_188348 ) ) ( not ( = ?auto_188346 ?auto_188349 ) ) ( not ( = ?auto_188346 ?auto_188350 ) ) ( not ( = ?auto_188347 ?auto_188348 ) ) ( not ( = ?auto_188347 ?auto_188349 ) ) ( not ( = ?auto_188347 ?auto_188350 ) ) ( not ( = ?auto_188348 ?auto_188349 ) ) ( not ( = ?auto_188348 ?auto_188350 ) ) ( not ( = ?auto_188349 ?auto_188350 ) ) ( CLEAR ?auto_188348 ) ( ON ?auto_188349 ?auto_188350 ) ( CLEAR ?auto_188349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_188339 ?auto_188340 ?auto_188341 ?auto_188342 ?auto_188343 ?auto_188344 ?auto_188345 ?auto_188346 ?auto_188347 ?auto_188348 ?auto_188349 )
      ( MAKE-12PILE ?auto_188339 ?auto_188340 ?auto_188341 ?auto_188342 ?auto_188343 ?auto_188344 ?auto_188345 ?auto_188346 ?auto_188347 ?auto_188348 ?auto_188349 ?auto_188350 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188363 - BLOCK
      ?auto_188364 - BLOCK
      ?auto_188365 - BLOCK
      ?auto_188366 - BLOCK
      ?auto_188367 - BLOCK
      ?auto_188368 - BLOCK
      ?auto_188369 - BLOCK
      ?auto_188370 - BLOCK
      ?auto_188371 - BLOCK
      ?auto_188372 - BLOCK
      ?auto_188373 - BLOCK
      ?auto_188374 - BLOCK
    )
    :vars
    (
      ?auto_188375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188374 ?auto_188375 ) ( ON-TABLE ?auto_188363 ) ( ON ?auto_188364 ?auto_188363 ) ( ON ?auto_188365 ?auto_188364 ) ( ON ?auto_188366 ?auto_188365 ) ( ON ?auto_188367 ?auto_188366 ) ( ON ?auto_188368 ?auto_188367 ) ( ON ?auto_188369 ?auto_188368 ) ( ON ?auto_188370 ?auto_188369 ) ( ON ?auto_188371 ?auto_188370 ) ( not ( = ?auto_188363 ?auto_188364 ) ) ( not ( = ?auto_188363 ?auto_188365 ) ) ( not ( = ?auto_188363 ?auto_188366 ) ) ( not ( = ?auto_188363 ?auto_188367 ) ) ( not ( = ?auto_188363 ?auto_188368 ) ) ( not ( = ?auto_188363 ?auto_188369 ) ) ( not ( = ?auto_188363 ?auto_188370 ) ) ( not ( = ?auto_188363 ?auto_188371 ) ) ( not ( = ?auto_188363 ?auto_188372 ) ) ( not ( = ?auto_188363 ?auto_188373 ) ) ( not ( = ?auto_188363 ?auto_188374 ) ) ( not ( = ?auto_188363 ?auto_188375 ) ) ( not ( = ?auto_188364 ?auto_188365 ) ) ( not ( = ?auto_188364 ?auto_188366 ) ) ( not ( = ?auto_188364 ?auto_188367 ) ) ( not ( = ?auto_188364 ?auto_188368 ) ) ( not ( = ?auto_188364 ?auto_188369 ) ) ( not ( = ?auto_188364 ?auto_188370 ) ) ( not ( = ?auto_188364 ?auto_188371 ) ) ( not ( = ?auto_188364 ?auto_188372 ) ) ( not ( = ?auto_188364 ?auto_188373 ) ) ( not ( = ?auto_188364 ?auto_188374 ) ) ( not ( = ?auto_188364 ?auto_188375 ) ) ( not ( = ?auto_188365 ?auto_188366 ) ) ( not ( = ?auto_188365 ?auto_188367 ) ) ( not ( = ?auto_188365 ?auto_188368 ) ) ( not ( = ?auto_188365 ?auto_188369 ) ) ( not ( = ?auto_188365 ?auto_188370 ) ) ( not ( = ?auto_188365 ?auto_188371 ) ) ( not ( = ?auto_188365 ?auto_188372 ) ) ( not ( = ?auto_188365 ?auto_188373 ) ) ( not ( = ?auto_188365 ?auto_188374 ) ) ( not ( = ?auto_188365 ?auto_188375 ) ) ( not ( = ?auto_188366 ?auto_188367 ) ) ( not ( = ?auto_188366 ?auto_188368 ) ) ( not ( = ?auto_188366 ?auto_188369 ) ) ( not ( = ?auto_188366 ?auto_188370 ) ) ( not ( = ?auto_188366 ?auto_188371 ) ) ( not ( = ?auto_188366 ?auto_188372 ) ) ( not ( = ?auto_188366 ?auto_188373 ) ) ( not ( = ?auto_188366 ?auto_188374 ) ) ( not ( = ?auto_188366 ?auto_188375 ) ) ( not ( = ?auto_188367 ?auto_188368 ) ) ( not ( = ?auto_188367 ?auto_188369 ) ) ( not ( = ?auto_188367 ?auto_188370 ) ) ( not ( = ?auto_188367 ?auto_188371 ) ) ( not ( = ?auto_188367 ?auto_188372 ) ) ( not ( = ?auto_188367 ?auto_188373 ) ) ( not ( = ?auto_188367 ?auto_188374 ) ) ( not ( = ?auto_188367 ?auto_188375 ) ) ( not ( = ?auto_188368 ?auto_188369 ) ) ( not ( = ?auto_188368 ?auto_188370 ) ) ( not ( = ?auto_188368 ?auto_188371 ) ) ( not ( = ?auto_188368 ?auto_188372 ) ) ( not ( = ?auto_188368 ?auto_188373 ) ) ( not ( = ?auto_188368 ?auto_188374 ) ) ( not ( = ?auto_188368 ?auto_188375 ) ) ( not ( = ?auto_188369 ?auto_188370 ) ) ( not ( = ?auto_188369 ?auto_188371 ) ) ( not ( = ?auto_188369 ?auto_188372 ) ) ( not ( = ?auto_188369 ?auto_188373 ) ) ( not ( = ?auto_188369 ?auto_188374 ) ) ( not ( = ?auto_188369 ?auto_188375 ) ) ( not ( = ?auto_188370 ?auto_188371 ) ) ( not ( = ?auto_188370 ?auto_188372 ) ) ( not ( = ?auto_188370 ?auto_188373 ) ) ( not ( = ?auto_188370 ?auto_188374 ) ) ( not ( = ?auto_188370 ?auto_188375 ) ) ( not ( = ?auto_188371 ?auto_188372 ) ) ( not ( = ?auto_188371 ?auto_188373 ) ) ( not ( = ?auto_188371 ?auto_188374 ) ) ( not ( = ?auto_188371 ?auto_188375 ) ) ( not ( = ?auto_188372 ?auto_188373 ) ) ( not ( = ?auto_188372 ?auto_188374 ) ) ( not ( = ?auto_188372 ?auto_188375 ) ) ( not ( = ?auto_188373 ?auto_188374 ) ) ( not ( = ?auto_188373 ?auto_188375 ) ) ( not ( = ?auto_188374 ?auto_188375 ) ) ( ON ?auto_188373 ?auto_188374 ) ( CLEAR ?auto_188371 ) ( ON ?auto_188372 ?auto_188373 ) ( CLEAR ?auto_188372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_188363 ?auto_188364 ?auto_188365 ?auto_188366 ?auto_188367 ?auto_188368 ?auto_188369 ?auto_188370 ?auto_188371 ?auto_188372 )
      ( MAKE-12PILE ?auto_188363 ?auto_188364 ?auto_188365 ?auto_188366 ?auto_188367 ?auto_188368 ?auto_188369 ?auto_188370 ?auto_188371 ?auto_188372 ?auto_188373 ?auto_188374 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188388 - BLOCK
      ?auto_188389 - BLOCK
      ?auto_188390 - BLOCK
      ?auto_188391 - BLOCK
      ?auto_188392 - BLOCK
      ?auto_188393 - BLOCK
      ?auto_188394 - BLOCK
      ?auto_188395 - BLOCK
      ?auto_188396 - BLOCK
      ?auto_188397 - BLOCK
      ?auto_188398 - BLOCK
      ?auto_188399 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188399 ) ( ON-TABLE ?auto_188388 ) ( ON ?auto_188389 ?auto_188388 ) ( ON ?auto_188390 ?auto_188389 ) ( ON ?auto_188391 ?auto_188390 ) ( ON ?auto_188392 ?auto_188391 ) ( ON ?auto_188393 ?auto_188392 ) ( ON ?auto_188394 ?auto_188393 ) ( ON ?auto_188395 ?auto_188394 ) ( ON ?auto_188396 ?auto_188395 ) ( not ( = ?auto_188388 ?auto_188389 ) ) ( not ( = ?auto_188388 ?auto_188390 ) ) ( not ( = ?auto_188388 ?auto_188391 ) ) ( not ( = ?auto_188388 ?auto_188392 ) ) ( not ( = ?auto_188388 ?auto_188393 ) ) ( not ( = ?auto_188388 ?auto_188394 ) ) ( not ( = ?auto_188388 ?auto_188395 ) ) ( not ( = ?auto_188388 ?auto_188396 ) ) ( not ( = ?auto_188388 ?auto_188397 ) ) ( not ( = ?auto_188388 ?auto_188398 ) ) ( not ( = ?auto_188388 ?auto_188399 ) ) ( not ( = ?auto_188389 ?auto_188390 ) ) ( not ( = ?auto_188389 ?auto_188391 ) ) ( not ( = ?auto_188389 ?auto_188392 ) ) ( not ( = ?auto_188389 ?auto_188393 ) ) ( not ( = ?auto_188389 ?auto_188394 ) ) ( not ( = ?auto_188389 ?auto_188395 ) ) ( not ( = ?auto_188389 ?auto_188396 ) ) ( not ( = ?auto_188389 ?auto_188397 ) ) ( not ( = ?auto_188389 ?auto_188398 ) ) ( not ( = ?auto_188389 ?auto_188399 ) ) ( not ( = ?auto_188390 ?auto_188391 ) ) ( not ( = ?auto_188390 ?auto_188392 ) ) ( not ( = ?auto_188390 ?auto_188393 ) ) ( not ( = ?auto_188390 ?auto_188394 ) ) ( not ( = ?auto_188390 ?auto_188395 ) ) ( not ( = ?auto_188390 ?auto_188396 ) ) ( not ( = ?auto_188390 ?auto_188397 ) ) ( not ( = ?auto_188390 ?auto_188398 ) ) ( not ( = ?auto_188390 ?auto_188399 ) ) ( not ( = ?auto_188391 ?auto_188392 ) ) ( not ( = ?auto_188391 ?auto_188393 ) ) ( not ( = ?auto_188391 ?auto_188394 ) ) ( not ( = ?auto_188391 ?auto_188395 ) ) ( not ( = ?auto_188391 ?auto_188396 ) ) ( not ( = ?auto_188391 ?auto_188397 ) ) ( not ( = ?auto_188391 ?auto_188398 ) ) ( not ( = ?auto_188391 ?auto_188399 ) ) ( not ( = ?auto_188392 ?auto_188393 ) ) ( not ( = ?auto_188392 ?auto_188394 ) ) ( not ( = ?auto_188392 ?auto_188395 ) ) ( not ( = ?auto_188392 ?auto_188396 ) ) ( not ( = ?auto_188392 ?auto_188397 ) ) ( not ( = ?auto_188392 ?auto_188398 ) ) ( not ( = ?auto_188392 ?auto_188399 ) ) ( not ( = ?auto_188393 ?auto_188394 ) ) ( not ( = ?auto_188393 ?auto_188395 ) ) ( not ( = ?auto_188393 ?auto_188396 ) ) ( not ( = ?auto_188393 ?auto_188397 ) ) ( not ( = ?auto_188393 ?auto_188398 ) ) ( not ( = ?auto_188393 ?auto_188399 ) ) ( not ( = ?auto_188394 ?auto_188395 ) ) ( not ( = ?auto_188394 ?auto_188396 ) ) ( not ( = ?auto_188394 ?auto_188397 ) ) ( not ( = ?auto_188394 ?auto_188398 ) ) ( not ( = ?auto_188394 ?auto_188399 ) ) ( not ( = ?auto_188395 ?auto_188396 ) ) ( not ( = ?auto_188395 ?auto_188397 ) ) ( not ( = ?auto_188395 ?auto_188398 ) ) ( not ( = ?auto_188395 ?auto_188399 ) ) ( not ( = ?auto_188396 ?auto_188397 ) ) ( not ( = ?auto_188396 ?auto_188398 ) ) ( not ( = ?auto_188396 ?auto_188399 ) ) ( not ( = ?auto_188397 ?auto_188398 ) ) ( not ( = ?auto_188397 ?auto_188399 ) ) ( not ( = ?auto_188398 ?auto_188399 ) ) ( ON ?auto_188398 ?auto_188399 ) ( CLEAR ?auto_188396 ) ( ON ?auto_188397 ?auto_188398 ) ( CLEAR ?auto_188397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_188388 ?auto_188389 ?auto_188390 ?auto_188391 ?auto_188392 ?auto_188393 ?auto_188394 ?auto_188395 ?auto_188396 ?auto_188397 )
      ( MAKE-12PILE ?auto_188388 ?auto_188389 ?auto_188390 ?auto_188391 ?auto_188392 ?auto_188393 ?auto_188394 ?auto_188395 ?auto_188396 ?auto_188397 ?auto_188398 ?auto_188399 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188412 - BLOCK
      ?auto_188413 - BLOCK
      ?auto_188414 - BLOCK
      ?auto_188415 - BLOCK
      ?auto_188416 - BLOCK
      ?auto_188417 - BLOCK
      ?auto_188418 - BLOCK
      ?auto_188419 - BLOCK
      ?auto_188420 - BLOCK
      ?auto_188421 - BLOCK
      ?auto_188422 - BLOCK
      ?auto_188423 - BLOCK
    )
    :vars
    (
      ?auto_188424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188423 ?auto_188424 ) ( ON-TABLE ?auto_188412 ) ( ON ?auto_188413 ?auto_188412 ) ( ON ?auto_188414 ?auto_188413 ) ( ON ?auto_188415 ?auto_188414 ) ( ON ?auto_188416 ?auto_188415 ) ( ON ?auto_188417 ?auto_188416 ) ( ON ?auto_188418 ?auto_188417 ) ( ON ?auto_188419 ?auto_188418 ) ( not ( = ?auto_188412 ?auto_188413 ) ) ( not ( = ?auto_188412 ?auto_188414 ) ) ( not ( = ?auto_188412 ?auto_188415 ) ) ( not ( = ?auto_188412 ?auto_188416 ) ) ( not ( = ?auto_188412 ?auto_188417 ) ) ( not ( = ?auto_188412 ?auto_188418 ) ) ( not ( = ?auto_188412 ?auto_188419 ) ) ( not ( = ?auto_188412 ?auto_188420 ) ) ( not ( = ?auto_188412 ?auto_188421 ) ) ( not ( = ?auto_188412 ?auto_188422 ) ) ( not ( = ?auto_188412 ?auto_188423 ) ) ( not ( = ?auto_188412 ?auto_188424 ) ) ( not ( = ?auto_188413 ?auto_188414 ) ) ( not ( = ?auto_188413 ?auto_188415 ) ) ( not ( = ?auto_188413 ?auto_188416 ) ) ( not ( = ?auto_188413 ?auto_188417 ) ) ( not ( = ?auto_188413 ?auto_188418 ) ) ( not ( = ?auto_188413 ?auto_188419 ) ) ( not ( = ?auto_188413 ?auto_188420 ) ) ( not ( = ?auto_188413 ?auto_188421 ) ) ( not ( = ?auto_188413 ?auto_188422 ) ) ( not ( = ?auto_188413 ?auto_188423 ) ) ( not ( = ?auto_188413 ?auto_188424 ) ) ( not ( = ?auto_188414 ?auto_188415 ) ) ( not ( = ?auto_188414 ?auto_188416 ) ) ( not ( = ?auto_188414 ?auto_188417 ) ) ( not ( = ?auto_188414 ?auto_188418 ) ) ( not ( = ?auto_188414 ?auto_188419 ) ) ( not ( = ?auto_188414 ?auto_188420 ) ) ( not ( = ?auto_188414 ?auto_188421 ) ) ( not ( = ?auto_188414 ?auto_188422 ) ) ( not ( = ?auto_188414 ?auto_188423 ) ) ( not ( = ?auto_188414 ?auto_188424 ) ) ( not ( = ?auto_188415 ?auto_188416 ) ) ( not ( = ?auto_188415 ?auto_188417 ) ) ( not ( = ?auto_188415 ?auto_188418 ) ) ( not ( = ?auto_188415 ?auto_188419 ) ) ( not ( = ?auto_188415 ?auto_188420 ) ) ( not ( = ?auto_188415 ?auto_188421 ) ) ( not ( = ?auto_188415 ?auto_188422 ) ) ( not ( = ?auto_188415 ?auto_188423 ) ) ( not ( = ?auto_188415 ?auto_188424 ) ) ( not ( = ?auto_188416 ?auto_188417 ) ) ( not ( = ?auto_188416 ?auto_188418 ) ) ( not ( = ?auto_188416 ?auto_188419 ) ) ( not ( = ?auto_188416 ?auto_188420 ) ) ( not ( = ?auto_188416 ?auto_188421 ) ) ( not ( = ?auto_188416 ?auto_188422 ) ) ( not ( = ?auto_188416 ?auto_188423 ) ) ( not ( = ?auto_188416 ?auto_188424 ) ) ( not ( = ?auto_188417 ?auto_188418 ) ) ( not ( = ?auto_188417 ?auto_188419 ) ) ( not ( = ?auto_188417 ?auto_188420 ) ) ( not ( = ?auto_188417 ?auto_188421 ) ) ( not ( = ?auto_188417 ?auto_188422 ) ) ( not ( = ?auto_188417 ?auto_188423 ) ) ( not ( = ?auto_188417 ?auto_188424 ) ) ( not ( = ?auto_188418 ?auto_188419 ) ) ( not ( = ?auto_188418 ?auto_188420 ) ) ( not ( = ?auto_188418 ?auto_188421 ) ) ( not ( = ?auto_188418 ?auto_188422 ) ) ( not ( = ?auto_188418 ?auto_188423 ) ) ( not ( = ?auto_188418 ?auto_188424 ) ) ( not ( = ?auto_188419 ?auto_188420 ) ) ( not ( = ?auto_188419 ?auto_188421 ) ) ( not ( = ?auto_188419 ?auto_188422 ) ) ( not ( = ?auto_188419 ?auto_188423 ) ) ( not ( = ?auto_188419 ?auto_188424 ) ) ( not ( = ?auto_188420 ?auto_188421 ) ) ( not ( = ?auto_188420 ?auto_188422 ) ) ( not ( = ?auto_188420 ?auto_188423 ) ) ( not ( = ?auto_188420 ?auto_188424 ) ) ( not ( = ?auto_188421 ?auto_188422 ) ) ( not ( = ?auto_188421 ?auto_188423 ) ) ( not ( = ?auto_188421 ?auto_188424 ) ) ( not ( = ?auto_188422 ?auto_188423 ) ) ( not ( = ?auto_188422 ?auto_188424 ) ) ( not ( = ?auto_188423 ?auto_188424 ) ) ( ON ?auto_188422 ?auto_188423 ) ( ON ?auto_188421 ?auto_188422 ) ( CLEAR ?auto_188419 ) ( ON ?auto_188420 ?auto_188421 ) ( CLEAR ?auto_188420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_188412 ?auto_188413 ?auto_188414 ?auto_188415 ?auto_188416 ?auto_188417 ?auto_188418 ?auto_188419 ?auto_188420 )
      ( MAKE-12PILE ?auto_188412 ?auto_188413 ?auto_188414 ?auto_188415 ?auto_188416 ?auto_188417 ?auto_188418 ?auto_188419 ?auto_188420 ?auto_188421 ?auto_188422 ?auto_188423 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188437 - BLOCK
      ?auto_188438 - BLOCK
      ?auto_188439 - BLOCK
      ?auto_188440 - BLOCK
      ?auto_188441 - BLOCK
      ?auto_188442 - BLOCK
      ?auto_188443 - BLOCK
      ?auto_188444 - BLOCK
      ?auto_188445 - BLOCK
      ?auto_188446 - BLOCK
      ?auto_188447 - BLOCK
      ?auto_188448 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188448 ) ( ON-TABLE ?auto_188437 ) ( ON ?auto_188438 ?auto_188437 ) ( ON ?auto_188439 ?auto_188438 ) ( ON ?auto_188440 ?auto_188439 ) ( ON ?auto_188441 ?auto_188440 ) ( ON ?auto_188442 ?auto_188441 ) ( ON ?auto_188443 ?auto_188442 ) ( ON ?auto_188444 ?auto_188443 ) ( not ( = ?auto_188437 ?auto_188438 ) ) ( not ( = ?auto_188437 ?auto_188439 ) ) ( not ( = ?auto_188437 ?auto_188440 ) ) ( not ( = ?auto_188437 ?auto_188441 ) ) ( not ( = ?auto_188437 ?auto_188442 ) ) ( not ( = ?auto_188437 ?auto_188443 ) ) ( not ( = ?auto_188437 ?auto_188444 ) ) ( not ( = ?auto_188437 ?auto_188445 ) ) ( not ( = ?auto_188437 ?auto_188446 ) ) ( not ( = ?auto_188437 ?auto_188447 ) ) ( not ( = ?auto_188437 ?auto_188448 ) ) ( not ( = ?auto_188438 ?auto_188439 ) ) ( not ( = ?auto_188438 ?auto_188440 ) ) ( not ( = ?auto_188438 ?auto_188441 ) ) ( not ( = ?auto_188438 ?auto_188442 ) ) ( not ( = ?auto_188438 ?auto_188443 ) ) ( not ( = ?auto_188438 ?auto_188444 ) ) ( not ( = ?auto_188438 ?auto_188445 ) ) ( not ( = ?auto_188438 ?auto_188446 ) ) ( not ( = ?auto_188438 ?auto_188447 ) ) ( not ( = ?auto_188438 ?auto_188448 ) ) ( not ( = ?auto_188439 ?auto_188440 ) ) ( not ( = ?auto_188439 ?auto_188441 ) ) ( not ( = ?auto_188439 ?auto_188442 ) ) ( not ( = ?auto_188439 ?auto_188443 ) ) ( not ( = ?auto_188439 ?auto_188444 ) ) ( not ( = ?auto_188439 ?auto_188445 ) ) ( not ( = ?auto_188439 ?auto_188446 ) ) ( not ( = ?auto_188439 ?auto_188447 ) ) ( not ( = ?auto_188439 ?auto_188448 ) ) ( not ( = ?auto_188440 ?auto_188441 ) ) ( not ( = ?auto_188440 ?auto_188442 ) ) ( not ( = ?auto_188440 ?auto_188443 ) ) ( not ( = ?auto_188440 ?auto_188444 ) ) ( not ( = ?auto_188440 ?auto_188445 ) ) ( not ( = ?auto_188440 ?auto_188446 ) ) ( not ( = ?auto_188440 ?auto_188447 ) ) ( not ( = ?auto_188440 ?auto_188448 ) ) ( not ( = ?auto_188441 ?auto_188442 ) ) ( not ( = ?auto_188441 ?auto_188443 ) ) ( not ( = ?auto_188441 ?auto_188444 ) ) ( not ( = ?auto_188441 ?auto_188445 ) ) ( not ( = ?auto_188441 ?auto_188446 ) ) ( not ( = ?auto_188441 ?auto_188447 ) ) ( not ( = ?auto_188441 ?auto_188448 ) ) ( not ( = ?auto_188442 ?auto_188443 ) ) ( not ( = ?auto_188442 ?auto_188444 ) ) ( not ( = ?auto_188442 ?auto_188445 ) ) ( not ( = ?auto_188442 ?auto_188446 ) ) ( not ( = ?auto_188442 ?auto_188447 ) ) ( not ( = ?auto_188442 ?auto_188448 ) ) ( not ( = ?auto_188443 ?auto_188444 ) ) ( not ( = ?auto_188443 ?auto_188445 ) ) ( not ( = ?auto_188443 ?auto_188446 ) ) ( not ( = ?auto_188443 ?auto_188447 ) ) ( not ( = ?auto_188443 ?auto_188448 ) ) ( not ( = ?auto_188444 ?auto_188445 ) ) ( not ( = ?auto_188444 ?auto_188446 ) ) ( not ( = ?auto_188444 ?auto_188447 ) ) ( not ( = ?auto_188444 ?auto_188448 ) ) ( not ( = ?auto_188445 ?auto_188446 ) ) ( not ( = ?auto_188445 ?auto_188447 ) ) ( not ( = ?auto_188445 ?auto_188448 ) ) ( not ( = ?auto_188446 ?auto_188447 ) ) ( not ( = ?auto_188446 ?auto_188448 ) ) ( not ( = ?auto_188447 ?auto_188448 ) ) ( ON ?auto_188447 ?auto_188448 ) ( ON ?auto_188446 ?auto_188447 ) ( CLEAR ?auto_188444 ) ( ON ?auto_188445 ?auto_188446 ) ( CLEAR ?auto_188445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_188437 ?auto_188438 ?auto_188439 ?auto_188440 ?auto_188441 ?auto_188442 ?auto_188443 ?auto_188444 ?auto_188445 )
      ( MAKE-12PILE ?auto_188437 ?auto_188438 ?auto_188439 ?auto_188440 ?auto_188441 ?auto_188442 ?auto_188443 ?auto_188444 ?auto_188445 ?auto_188446 ?auto_188447 ?auto_188448 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188461 - BLOCK
      ?auto_188462 - BLOCK
      ?auto_188463 - BLOCK
      ?auto_188464 - BLOCK
      ?auto_188465 - BLOCK
      ?auto_188466 - BLOCK
      ?auto_188467 - BLOCK
      ?auto_188468 - BLOCK
      ?auto_188469 - BLOCK
      ?auto_188470 - BLOCK
      ?auto_188471 - BLOCK
      ?auto_188472 - BLOCK
    )
    :vars
    (
      ?auto_188473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188472 ?auto_188473 ) ( ON-TABLE ?auto_188461 ) ( ON ?auto_188462 ?auto_188461 ) ( ON ?auto_188463 ?auto_188462 ) ( ON ?auto_188464 ?auto_188463 ) ( ON ?auto_188465 ?auto_188464 ) ( ON ?auto_188466 ?auto_188465 ) ( ON ?auto_188467 ?auto_188466 ) ( not ( = ?auto_188461 ?auto_188462 ) ) ( not ( = ?auto_188461 ?auto_188463 ) ) ( not ( = ?auto_188461 ?auto_188464 ) ) ( not ( = ?auto_188461 ?auto_188465 ) ) ( not ( = ?auto_188461 ?auto_188466 ) ) ( not ( = ?auto_188461 ?auto_188467 ) ) ( not ( = ?auto_188461 ?auto_188468 ) ) ( not ( = ?auto_188461 ?auto_188469 ) ) ( not ( = ?auto_188461 ?auto_188470 ) ) ( not ( = ?auto_188461 ?auto_188471 ) ) ( not ( = ?auto_188461 ?auto_188472 ) ) ( not ( = ?auto_188461 ?auto_188473 ) ) ( not ( = ?auto_188462 ?auto_188463 ) ) ( not ( = ?auto_188462 ?auto_188464 ) ) ( not ( = ?auto_188462 ?auto_188465 ) ) ( not ( = ?auto_188462 ?auto_188466 ) ) ( not ( = ?auto_188462 ?auto_188467 ) ) ( not ( = ?auto_188462 ?auto_188468 ) ) ( not ( = ?auto_188462 ?auto_188469 ) ) ( not ( = ?auto_188462 ?auto_188470 ) ) ( not ( = ?auto_188462 ?auto_188471 ) ) ( not ( = ?auto_188462 ?auto_188472 ) ) ( not ( = ?auto_188462 ?auto_188473 ) ) ( not ( = ?auto_188463 ?auto_188464 ) ) ( not ( = ?auto_188463 ?auto_188465 ) ) ( not ( = ?auto_188463 ?auto_188466 ) ) ( not ( = ?auto_188463 ?auto_188467 ) ) ( not ( = ?auto_188463 ?auto_188468 ) ) ( not ( = ?auto_188463 ?auto_188469 ) ) ( not ( = ?auto_188463 ?auto_188470 ) ) ( not ( = ?auto_188463 ?auto_188471 ) ) ( not ( = ?auto_188463 ?auto_188472 ) ) ( not ( = ?auto_188463 ?auto_188473 ) ) ( not ( = ?auto_188464 ?auto_188465 ) ) ( not ( = ?auto_188464 ?auto_188466 ) ) ( not ( = ?auto_188464 ?auto_188467 ) ) ( not ( = ?auto_188464 ?auto_188468 ) ) ( not ( = ?auto_188464 ?auto_188469 ) ) ( not ( = ?auto_188464 ?auto_188470 ) ) ( not ( = ?auto_188464 ?auto_188471 ) ) ( not ( = ?auto_188464 ?auto_188472 ) ) ( not ( = ?auto_188464 ?auto_188473 ) ) ( not ( = ?auto_188465 ?auto_188466 ) ) ( not ( = ?auto_188465 ?auto_188467 ) ) ( not ( = ?auto_188465 ?auto_188468 ) ) ( not ( = ?auto_188465 ?auto_188469 ) ) ( not ( = ?auto_188465 ?auto_188470 ) ) ( not ( = ?auto_188465 ?auto_188471 ) ) ( not ( = ?auto_188465 ?auto_188472 ) ) ( not ( = ?auto_188465 ?auto_188473 ) ) ( not ( = ?auto_188466 ?auto_188467 ) ) ( not ( = ?auto_188466 ?auto_188468 ) ) ( not ( = ?auto_188466 ?auto_188469 ) ) ( not ( = ?auto_188466 ?auto_188470 ) ) ( not ( = ?auto_188466 ?auto_188471 ) ) ( not ( = ?auto_188466 ?auto_188472 ) ) ( not ( = ?auto_188466 ?auto_188473 ) ) ( not ( = ?auto_188467 ?auto_188468 ) ) ( not ( = ?auto_188467 ?auto_188469 ) ) ( not ( = ?auto_188467 ?auto_188470 ) ) ( not ( = ?auto_188467 ?auto_188471 ) ) ( not ( = ?auto_188467 ?auto_188472 ) ) ( not ( = ?auto_188467 ?auto_188473 ) ) ( not ( = ?auto_188468 ?auto_188469 ) ) ( not ( = ?auto_188468 ?auto_188470 ) ) ( not ( = ?auto_188468 ?auto_188471 ) ) ( not ( = ?auto_188468 ?auto_188472 ) ) ( not ( = ?auto_188468 ?auto_188473 ) ) ( not ( = ?auto_188469 ?auto_188470 ) ) ( not ( = ?auto_188469 ?auto_188471 ) ) ( not ( = ?auto_188469 ?auto_188472 ) ) ( not ( = ?auto_188469 ?auto_188473 ) ) ( not ( = ?auto_188470 ?auto_188471 ) ) ( not ( = ?auto_188470 ?auto_188472 ) ) ( not ( = ?auto_188470 ?auto_188473 ) ) ( not ( = ?auto_188471 ?auto_188472 ) ) ( not ( = ?auto_188471 ?auto_188473 ) ) ( not ( = ?auto_188472 ?auto_188473 ) ) ( ON ?auto_188471 ?auto_188472 ) ( ON ?auto_188470 ?auto_188471 ) ( ON ?auto_188469 ?auto_188470 ) ( CLEAR ?auto_188467 ) ( ON ?auto_188468 ?auto_188469 ) ( CLEAR ?auto_188468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_188461 ?auto_188462 ?auto_188463 ?auto_188464 ?auto_188465 ?auto_188466 ?auto_188467 ?auto_188468 )
      ( MAKE-12PILE ?auto_188461 ?auto_188462 ?auto_188463 ?auto_188464 ?auto_188465 ?auto_188466 ?auto_188467 ?auto_188468 ?auto_188469 ?auto_188470 ?auto_188471 ?auto_188472 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188486 - BLOCK
      ?auto_188487 - BLOCK
      ?auto_188488 - BLOCK
      ?auto_188489 - BLOCK
      ?auto_188490 - BLOCK
      ?auto_188491 - BLOCK
      ?auto_188492 - BLOCK
      ?auto_188493 - BLOCK
      ?auto_188494 - BLOCK
      ?auto_188495 - BLOCK
      ?auto_188496 - BLOCK
      ?auto_188497 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188497 ) ( ON-TABLE ?auto_188486 ) ( ON ?auto_188487 ?auto_188486 ) ( ON ?auto_188488 ?auto_188487 ) ( ON ?auto_188489 ?auto_188488 ) ( ON ?auto_188490 ?auto_188489 ) ( ON ?auto_188491 ?auto_188490 ) ( ON ?auto_188492 ?auto_188491 ) ( not ( = ?auto_188486 ?auto_188487 ) ) ( not ( = ?auto_188486 ?auto_188488 ) ) ( not ( = ?auto_188486 ?auto_188489 ) ) ( not ( = ?auto_188486 ?auto_188490 ) ) ( not ( = ?auto_188486 ?auto_188491 ) ) ( not ( = ?auto_188486 ?auto_188492 ) ) ( not ( = ?auto_188486 ?auto_188493 ) ) ( not ( = ?auto_188486 ?auto_188494 ) ) ( not ( = ?auto_188486 ?auto_188495 ) ) ( not ( = ?auto_188486 ?auto_188496 ) ) ( not ( = ?auto_188486 ?auto_188497 ) ) ( not ( = ?auto_188487 ?auto_188488 ) ) ( not ( = ?auto_188487 ?auto_188489 ) ) ( not ( = ?auto_188487 ?auto_188490 ) ) ( not ( = ?auto_188487 ?auto_188491 ) ) ( not ( = ?auto_188487 ?auto_188492 ) ) ( not ( = ?auto_188487 ?auto_188493 ) ) ( not ( = ?auto_188487 ?auto_188494 ) ) ( not ( = ?auto_188487 ?auto_188495 ) ) ( not ( = ?auto_188487 ?auto_188496 ) ) ( not ( = ?auto_188487 ?auto_188497 ) ) ( not ( = ?auto_188488 ?auto_188489 ) ) ( not ( = ?auto_188488 ?auto_188490 ) ) ( not ( = ?auto_188488 ?auto_188491 ) ) ( not ( = ?auto_188488 ?auto_188492 ) ) ( not ( = ?auto_188488 ?auto_188493 ) ) ( not ( = ?auto_188488 ?auto_188494 ) ) ( not ( = ?auto_188488 ?auto_188495 ) ) ( not ( = ?auto_188488 ?auto_188496 ) ) ( not ( = ?auto_188488 ?auto_188497 ) ) ( not ( = ?auto_188489 ?auto_188490 ) ) ( not ( = ?auto_188489 ?auto_188491 ) ) ( not ( = ?auto_188489 ?auto_188492 ) ) ( not ( = ?auto_188489 ?auto_188493 ) ) ( not ( = ?auto_188489 ?auto_188494 ) ) ( not ( = ?auto_188489 ?auto_188495 ) ) ( not ( = ?auto_188489 ?auto_188496 ) ) ( not ( = ?auto_188489 ?auto_188497 ) ) ( not ( = ?auto_188490 ?auto_188491 ) ) ( not ( = ?auto_188490 ?auto_188492 ) ) ( not ( = ?auto_188490 ?auto_188493 ) ) ( not ( = ?auto_188490 ?auto_188494 ) ) ( not ( = ?auto_188490 ?auto_188495 ) ) ( not ( = ?auto_188490 ?auto_188496 ) ) ( not ( = ?auto_188490 ?auto_188497 ) ) ( not ( = ?auto_188491 ?auto_188492 ) ) ( not ( = ?auto_188491 ?auto_188493 ) ) ( not ( = ?auto_188491 ?auto_188494 ) ) ( not ( = ?auto_188491 ?auto_188495 ) ) ( not ( = ?auto_188491 ?auto_188496 ) ) ( not ( = ?auto_188491 ?auto_188497 ) ) ( not ( = ?auto_188492 ?auto_188493 ) ) ( not ( = ?auto_188492 ?auto_188494 ) ) ( not ( = ?auto_188492 ?auto_188495 ) ) ( not ( = ?auto_188492 ?auto_188496 ) ) ( not ( = ?auto_188492 ?auto_188497 ) ) ( not ( = ?auto_188493 ?auto_188494 ) ) ( not ( = ?auto_188493 ?auto_188495 ) ) ( not ( = ?auto_188493 ?auto_188496 ) ) ( not ( = ?auto_188493 ?auto_188497 ) ) ( not ( = ?auto_188494 ?auto_188495 ) ) ( not ( = ?auto_188494 ?auto_188496 ) ) ( not ( = ?auto_188494 ?auto_188497 ) ) ( not ( = ?auto_188495 ?auto_188496 ) ) ( not ( = ?auto_188495 ?auto_188497 ) ) ( not ( = ?auto_188496 ?auto_188497 ) ) ( ON ?auto_188496 ?auto_188497 ) ( ON ?auto_188495 ?auto_188496 ) ( ON ?auto_188494 ?auto_188495 ) ( CLEAR ?auto_188492 ) ( ON ?auto_188493 ?auto_188494 ) ( CLEAR ?auto_188493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_188486 ?auto_188487 ?auto_188488 ?auto_188489 ?auto_188490 ?auto_188491 ?auto_188492 ?auto_188493 )
      ( MAKE-12PILE ?auto_188486 ?auto_188487 ?auto_188488 ?auto_188489 ?auto_188490 ?auto_188491 ?auto_188492 ?auto_188493 ?auto_188494 ?auto_188495 ?auto_188496 ?auto_188497 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188510 - BLOCK
      ?auto_188511 - BLOCK
      ?auto_188512 - BLOCK
      ?auto_188513 - BLOCK
      ?auto_188514 - BLOCK
      ?auto_188515 - BLOCK
      ?auto_188516 - BLOCK
      ?auto_188517 - BLOCK
      ?auto_188518 - BLOCK
      ?auto_188519 - BLOCK
      ?auto_188520 - BLOCK
      ?auto_188521 - BLOCK
    )
    :vars
    (
      ?auto_188522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188521 ?auto_188522 ) ( ON-TABLE ?auto_188510 ) ( ON ?auto_188511 ?auto_188510 ) ( ON ?auto_188512 ?auto_188511 ) ( ON ?auto_188513 ?auto_188512 ) ( ON ?auto_188514 ?auto_188513 ) ( ON ?auto_188515 ?auto_188514 ) ( not ( = ?auto_188510 ?auto_188511 ) ) ( not ( = ?auto_188510 ?auto_188512 ) ) ( not ( = ?auto_188510 ?auto_188513 ) ) ( not ( = ?auto_188510 ?auto_188514 ) ) ( not ( = ?auto_188510 ?auto_188515 ) ) ( not ( = ?auto_188510 ?auto_188516 ) ) ( not ( = ?auto_188510 ?auto_188517 ) ) ( not ( = ?auto_188510 ?auto_188518 ) ) ( not ( = ?auto_188510 ?auto_188519 ) ) ( not ( = ?auto_188510 ?auto_188520 ) ) ( not ( = ?auto_188510 ?auto_188521 ) ) ( not ( = ?auto_188510 ?auto_188522 ) ) ( not ( = ?auto_188511 ?auto_188512 ) ) ( not ( = ?auto_188511 ?auto_188513 ) ) ( not ( = ?auto_188511 ?auto_188514 ) ) ( not ( = ?auto_188511 ?auto_188515 ) ) ( not ( = ?auto_188511 ?auto_188516 ) ) ( not ( = ?auto_188511 ?auto_188517 ) ) ( not ( = ?auto_188511 ?auto_188518 ) ) ( not ( = ?auto_188511 ?auto_188519 ) ) ( not ( = ?auto_188511 ?auto_188520 ) ) ( not ( = ?auto_188511 ?auto_188521 ) ) ( not ( = ?auto_188511 ?auto_188522 ) ) ( not ( = ?auto_188512 ?auto_188513 ) ) ( not ( = ?auto_188512 ?auto_188514 ) ) ( not ( = ?auto_188512 ?auto_188515 ) ) ( not ( = ?auto_188512 ?auto_188516 ) ) ( not ( = ?auto_188512 ?auto_188517 ) ) ( not ( = ?auto_188512 ?auto_188518 ) ) ( not ( = ?auto_188512 ?auto_188519 ) ) ( not ( = ?auto_188512 ?auto_188520 ) ) ( not ( = ?auto_188512 ?auto_188521 ) ) ( not ( = ?auto_188512 ?auto_188522 ) ) ( not ( = ?auto_188513 ?auto_188514 ) ) ( not ( = ?auto_188513 ?auto_188515 ) ) ( not ( = ?auto_188513 ?auto_188516 ) ) ( not ( = ?auto_188513 ?auto_188517 ) ) ( not ( = ?auto_188513 ?auto_188518 ) ) ( not ( = ?auto_188513 ?auto_188519 ) ) ( not ( = ?auto_188513 ?auto_188520 ) ) ( not ( = ?auto_188513 ?auto_188521 ) ) ( not ( = ?auto_188513 ?auto_188522 ) ) ( not ( = ?auto_188514 ?auto_188515 ) ) ( not ( = ?auto_188514 ?auto_188516 ) ) ( not ( = ?auto_188514 ?auto_188517 ) ) ( not ( = ?auto_188514 ?auto_188518 ) ) ( not ( = ?auto_188514 ?auto_188519 ) ) ( not ( = ?auto_188514 ?auto_188520 ) ) ( not ( = ?auto_188514 ?auto_188521 ) ) ( not ( = ?auto_188514 ?auto_188522 ) ) ( not ( = ?auto_188515 ?auto_188516 ) ) ( not ( = ?auto_188515 ?auto_188517 ) ) ( not ( = ?auto_188515 ?auto_188518 ) ) ( not ( = ?auto_188515 ?auto_188519 ) ) ( not ( = ?auto_188515 ?auto_188520 ) ) ( not ( = ?auto_188515 ?auto_188521 ) ) ( not ( = ?auto_188515 ?auto_188522 ) ) ( not ( = ?auto_188516 ?auto_188517 ) ) ( not ( = ?auto_188516 ?auto_188518 ) ) ( not ( = ?auto_188516 ?auto_188519 ) ) ( not ( = ?auto_188516 ?auto_188520 ) ) ( not ( = ?auto_188516 ?auto_188521 ) ) ( not ( = ?auto_188516 ?auto_188522 ) ) ( not ( = ?auto_188517 ?auto_188518 ) ) ( not ( = ?auto_188517 ?auto_188519 ) ) ( not ( = ?auto_188517 ?auto_188520 ) ) ( not ( = ?auto_188517 ?auto_188521 ) ) ( not ( = ?auto_188517 ?auto_188522 ) ) ( not ( = ?auto_188518 ?auto_188519 ) ) ( not ( = ?auto_188518 ?auto_188520 ) ) ( not ( = ?auto_188518 ?auto_188521 ) ) ( not ( = ?auto_188518 ?auto_188522 ) ) ( not ( = ?auto_188519 ?auto_188520 ) ) ( not ( = ?auto_188519 ?auto_188521 ) ) ( not ( = ?auto_188519 ?auto_188522 ) ) ( not ( = ?auto_188520 ?auto_188521 ) ) ( not ( = ?auto_188520 ?auto_188522 ) ) ( not ( = ?auto_188521 ?auto_188522 ) ) ( ON ?auto_188520 ?auto_188521 ) ( ON ?auto_188519 ?auto_188520 ) ( ON ?auto_188518 ?auto_188519 ) ( ON ?auto_188517 ?auto_188518 ) ( CLEAR ?auto_188515 ) ( ON ?auto_188516 ?auto_188517 ) ( CLEAR ?auto_188516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_188510 ?auto_188511 ?auto_188512 ?auto_188513 ?auto_188514 ?auto_188515 ?auto_188516 )
      ( MAKE-12PILE ?auto_188510 ?auto_188511 ?auto_188512 ?auto_188513 ?auto_188514 ?auto_188515 ?auto_188516 ?auto_188517 ?auto_188518 ?auto_188519 ?auto_188520 ?auto_188521 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188535 - BLOCK
      ?auto_188536 - BLOCK
      ?auto_188537 - BLOCK
      ?auto_188538 - BLOCK
      ?auto_188539 - BLOCK
      ?auto_188540 - BLOCK
      ?auto_188541 - BLOCK
      ?auto_188542 - BLOCK
      ?auto_188543 - BLOCK
      ?auto_188544 - BLOCK
      ?auto_188545 - BLOCK
      ?auto_188546 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188546 ) ( ON-TABLE ?auto_188535 ) ( ON ?auto_188536 ?auto_188535 ) ( ON ?auto_188537 ?auto_188536 ) ( ON ?auto_188538 ?auto_188537 ) ( ON ?auto_188539 ?auto_188538 ) ( ON ?auto_188540 ?auto_188539 ) ( not ( = ?auto_188535 ?auto_188536 ) ) ( not ( = ?auto_188535 ?auto_188537 ) ) ( not ( = ?auto_188535 ?auto_188538 ) ) ( not ( = ?auto_188535 ?auto_188539 ) ) ( not ( = ?auto_188535 ?auto_188540 ) ) ( not ( = ?auto_188535 ?auto_188541 ) ) ( not ( = ?auto_188535 ?auto_188542 ) ) ( not ( = ?auto_188535 ?auto_188543 ) ) ( not ( = ?auto_188535 ?auto_188544 ) ) ( not ( = ?auto_188535 ?auto_188545 ) ) ( not ( = ?auto_188535 ?auto_188546 ) ) ( not ( = ?auto_188536 ?auto_188537 ) ) ( not ( = ?auto_188536 ?auto_188538 ) ) ( not ( = ?auto_188536 ?auto_188539 ) ) ( not ( = ?auto_188536 ?auto_188540 ) ) ( not ( = ?auto_188536 ?auto_188541 ) ) ( not ( = ?auto_188536 ?auto_188542 ) ) ( not ( = ?auto_188536 ?auto_188543 ) ) ( not ( = ?auto_188536 ?auto_188544 ) ) ( not ( = ?auto_188536 ?auto_188545 ) ) ( not ( = ?auto_188536 ?auto_188546 ) ) ( not ( = ?auto_188537 ?auto_188538 ) ) ( not ( = ?auto_188537 ?auto_188539 ) ) ( not ( = ?auto_188537 ?auto_188540 ) ) ( not ( = ?auto_188537 ?auto_188541 ) ) ( not ( = ?auto_188537 ?auto_188542 ) ) ( not ( = ?auto_188537 ?auto_188543 ) ) ( not ( = ?auto_188537 ?auto_188544 ) ) ( not ( = ?auto_188537 ?auto_188545 ) ) ( not ( = ?auto_188537 ?auto_188546 ) ) ( not ( = ?auto_188538 ?auto_188539 ) ) ( not ( = ?auto_188538 ?auto_188540 ) ) ( not ( = ?auto_188538 ?auto_188541 ) ) ( not ( = ?auto_188538 ?auto_188542 ) ) ( not ( = ?auto_188538 ?auto_188543 ) ) ( not ( = ?auto_188538 ?auto_188544 ) ) ( not ( = ?auto_188538 ?auto_188545 ) ) ( not ( = ?auto_188538 ?auto_188546 ) ) ( not ( = ?auto_188539 ?auto_188540 ) ) ( not ( = ?auto_188539 ?auto_188541 ) ) ( not ( = ?auto_188539 ?auto_188542 ) ) ( not ( = ?auto_188539 ?auto_188543 ) ) ( not ( = ?auto_188539 ?auto_188544 ) ) ( not ( = ?auto_188539 ?auto_188545 ) ) ( not ( = ?auto_188539 ?auto_188546 ) ) ( not ( = ?auto_188540 ?auto_188541 ) ) ( not ( = ?auto_188540 ?auto_188542 ) ) ( not ( = ?auto_188540 ?auto_188543 ) ) ( not ( = ?auto_188540 ?auto_188544 ) ) ( not ( = ?auto_188540 ?auto_188545 ) ) ( not ( = ?auto_188540 ?auto_188546 ) ) ( not ( = ?auto_188541 ?auto_188542 ) ) ( not ( = ?auto_188541 ?auto_188543 ) ) ( not ( = ?auto_188541 ?auto_188544 ) ) ( not ( = ?auto_188541 ?auto_188545 ) ) ( not ( = ?auto_188541 ?auto_188546 ) ) ( not ( = ?auto_188542 ?auto_188543 ) ) ( not ( = ?auto_188542 ?auto_188544 ) ) ( not ( = ?auto_188542 ?auto_188545 ) ) ( not ( = ?auto_188542 ?auto_188546 ) ) ( not ( = ?auto_188543 ?auto_188544 ) ) ( not ( = ?auto_188543 ?auto_188545 ) ) ( not ( = ?auto_188543 ?auto_188546 ) ) ( not ( = ?auto_188544 ?auto_188545 ) ) ( not ( = ?auto_188544 ?auto_188546 ) ) ( not ( = ?auto_188545 ?auto_188546 ) ) ( ON ?auto_188545 ?auto_188546 ) ( ON ?auto_188544 ?auto_188545 ) ( ON ?auto_188543 ?auto_188544 ) ( ON ?auto_188542 ?auto_188543 ) ( CLEAR ?auto_188540 ) ( ON ?auto_188541 ?auto_188542 ) ( CLEAR ?auto_188541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_188535 ?auto_188536 ?auto_188537 ?auto_188538 ?auto_188539 ?auto_188540 ?auto_188541 )
      ( MAKE-12PILE ?auto_188535 ?auto_188536 ?auto_188537 ?auto_188538 ?auto_188539 ?auto_188540 ?auto_188541 ?auto_188542 ?auto_188543 ?auto_188544 ?auto_188545 ?auto_188546 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188559 - BLOCK
      ?auto_188560 - BLOCK
      ?auto_188561 - BLOCK
      ?auto_188562 - BLOCK
      ?auto_188563 - BLOCK
      ?auto_188564 - BLOCK
      ?auto_188565 - BLOCK
      ?auto_188566 - BLOCK
      ?auto_188567 - BLOCK
      ?auto_188568 - BLOCK
      ?auto_188569 - BLOCK
      ?auto_188570 - BLOCK
    )
    :vars
    (
      ?auto_188571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188570 ?auto_188571 ) ( ON-TABLE ?auto_188559 ) ( ON ?auto_188560 ?auto_188559 ) ( ON ?auto_188561 ?auto_188560 ) ( ON ?auto_188562 ?auto_188561 ) ( ON ?auto_188563 ?auto_188562 ) ( not ( = ?auto_188559 ?auto_188560 ) ) ( not ( = ?auto_188559 ?auto_188561 ) ) ( not ( = ?auto_188559 ?auto_188562 ) ) ( not ( = ?auto_188559 ?auto_188563 ) ) ( not ( = ?auto_188559 ?auto_188564 ) ) ( not ( = ?auto_188559 ?auto_188565 ) ) ( not ( = ?auto_188559 ?auto_188566 ) ) ( not ( = ?auto_188559 ?auto_188567 ) ) ( not ( = ?auto_188559 ?auto_188568 ) ) ( not ( = ?auto_188559 ?auto_188569 ) ) ( not ( = ?auto_188559 ?auto_188570 ) ) ( not ( = ?auto_188559 ?auto_188571 ) ) ( not ( = ?auto_188560 ?auto_188561 ) ) ( not ( = ?auto_188560 ?auto_188562 ) ) ( not ( = ?auto_188560 ?auto_188563 ) ) ( not ( = ?auto_188560 ?auto_188564 ) ) ( not ( = ?auto_188560 ?auto_188565 ) ) ( not ( = ?auto_188560 ?auto_188566 ) ) ( not ( = ?auto_188560 ?auto_188567 ) ) ( not ( = ?auto_188560 ?auto_188568 ) ) ( not ( = ?auto_188560 ?auto_188569 ) ) ( not ( = ?auto_188560 ?auto_188570 ) ) ( not ( = ?auto_188560 ?auto_188571 ) ) ( not ( = ?auto_188561 ?auto_188562 ) ) ( not ( = ?auto_188561 ?auto_188563 ) ) ( not ( = ?auto_188561 ?auto_188564 ) ) ( not ( = ?auto_188561 ?auto_188565 ) ) ( not ( = ?auto_188561 ?auto_188566 ) ) ( not ( = ?auto_188561 ?auto_188567 ) ) ( not ( = ?auto_188561 ?auto_188568 ) ) ( not ( = ?auto_188561 ?auto_188569 ) ) ( not ( = ?auto_188561 ?auto_188570 ) ) ( not ( = ?auto_188561 ?auto_188571 ) ) ( not ( = ?auto_188562 ?auto_188563 ) ) ( not ( = ?auto_188562 ?auto_188564 ) ) ( not ( = ?auto_188562 ?auto_188565 ) ) ( not ( = ?auto_188562 ?auto_188566 ) ) ( not ( = ?auto_188562 ?auto_188567 ) ) ( not ( = ?auto_188562 ?auto_188568 ) ) ( not ( = ?auto_188562 ?auto_188569 ) ) ( not ( = ?auto_188562 ?auto_188570 ) ) ( not ( = ?auto_188562 ?auto_188571 ) ) ( not ( = ?auto_188563 ?auto_188564 ) ) ( not ( = ?auto_188563 ?auto_188565 ) ) ( not ( = ?auto_188563 ?auto_188566 ) ) ( not ( = ?auto_188563 ?auto_188567 ) ) ( not ( = ?auto_188563 ?auto_188568 ) ) ( not ( = ?auto_188563 ?auto_188569 ) ) ( not ( = ?auto_188563 ?auto_188570 ) ) ( not ( = ?auto_188563 ?auto_188571 ) ) ( not ( = ?auto_188564 ?auto_188565 ) ) ( not ( = ?auto_188564 ?auto_188566 ) ) ( not ( = ?auto_188564 ?auto_188567 ) ) ( not ( = ?auto_188564 ?auto_188568 ) ) ( not ( = ?auto_188564 ?auto_188569 ) ) ( not ( = ?auto_188564 ?auto_188570 ) ) ( not ( = ?auto_188564 ?auto_188571 ) ) ( not ( = ?auto_188565 ?auto_188566 ) ) ( not ( = ?auto_188565 ?auto_188567 ) ) ( not ( = ?auto_188565 ?auto_188568 ) ) ( not ( = ?auto_188565 ?auto_188569 ) ) ( not ( = ?auto_188565 ?auto_188570 ) ) ( not ( = ?auto_188565 ?auto_188571 ) ) ( not ( = ?auto_188566 ?auto_188567 ) ) ( not ( = ?auto_188566 ?auto_188568 ) ) ( not ( = ?auto_188566 ?auto_188569 ) ) ( not ( = ?auto_188566 ?auto_188570 ) ) ( not ( = ?auto_188566 ?auto_188571 ) ) ( not ( = ?auto_188567 ?auto_188568 ) ) ( not ( = ?auto_188567 ?auto_188569 ) ) ( not ( = ?auto_188567 ?auto_188570 ) ) ( not ( = ?auto_188567 ?auto_188571 ) ) ( not ( = ?auto_188568 ?auto_188569 ) ) ( not ( = ?auto_188568 ?auto_188570 ) ) ( not ( = ?auto_188568 ?auto_188571 ) ) ( not ( = ?auto_188569 ?auto_188570 ) ) ( not ( = ?auto_188569 ?auto_188571 ) ) ( not ( = ?auto_188570 ?auto_188571 ) ) ( ON ?auto_188569 ?auto_188570 ) ( ON ?auto_188568 ?auto_188569 ) ( ON ?auto_188567 ?auto_188568 ) ( ON ?auto_188566 ?auto_188567 ) ( ON ?auto_188565 ?auto_188566 ) ( CLEAR ?auto_188563 ) ( ON ?auto_188564 ?auto_188565 ) ( CLEAR ?auto_188564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188559 ?auto_188560 ?auto_188561 ?auto_188562 ?auto_188563 ?auto_188564 )
      ( MAKE-12PILE ?auto_188559 ?auto_188560 ?auto_188561 ?auto_188562 ?auto_188563 ?auto_188564 ?auto_188565 ?auto_188566 ?auto_188567 ?auto_188568 ?auto_188569 ?auto_188570 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188584 - BLOCK
      ?auto_188585 - BLOCK
      ?auto_188586 - BLOCK
      ?auto_188587 - BLOCK
      ?auto_188588 - BLOCK
      ?auto_188589 - BLOCK
      ?auto_188590 - BLOCK
      ?auto_188591 - BLOCK
      ?auto_188592 - BLOCK
      ?auto_188593 - BLOCK
      ?auto_188594 - BLOCK
      ?auto_188595 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188595 ) ( ON-TABLE ?auto_188584 ) ( ON ?auto_188585 ?auto_188584 ) ( ON ?auto_188586 ?auto_188585 ) ( ON ?auto_188587 ?auto_188586 ) ( ON ?auto_188588 ?auto_188587 ) ( not ( = ?auto_188584 ?auto_188585 ) ) ( not ( = ?auto_188584 ?auto_188586 ) ) ( not ( = ?auto_188584 ?auto_188587 ) ) ( not ( = ?auto_188584 ?auto_188588 ) ) ( not ( = ?auto_188584 ?auto_188589 ) ) ( not ( = ?auto_188584 ?auto_188590 ) ) ( not ( = ?auto_188584 ?auto_188591 ) ) ( not ( = ?auto_188584 ?auto_188592 ) ) ( not ( = ?auto_188584 ?auto_188593 ) ) ( not ( = ?auto_188584 ?auto_188594 ) ) ( not ( = ?auto_188584 ?auto_188595 ) ) ( not ( = ?auto_188585 ?auto_188586 ) ) ( not ( = ?auto_188585 ?auto_188587 ) ) ( not ( = ?auto_188585 ?auto_188588 ) ) ( not ( = ?auto_188585 ?auto_188589 ) ) ( not ( = ?auto_188585 ?auto_188590 ) ) ( not ( = ?auto_188585 ?auto_188591 ) ) ( not ( = ?auto_188585 ?auto_188592 ) ) ( not ( = ?auto_188585 ?auto_188593 ) ) ( not ( = ?auto_188585 ?auto_188594 ) ) ( not ( = ?auto_188585 ?auto_188595 ) ) ( not ( = ?auto_188586 ?auto_188587 ) ) ( not ( = ?auto_188586 ?auto_188588 ) ) ( not ( = ?auto_188586 ?auto_188589 ) ) ( not ( = ?auto_188586 ?auto_188590 ) ) ( not ( = ?auto_188586 ?auto_188591 ) ) ( not ( = ?auto_188586 ?auto_188592 ) ) ( not ( = ?auto_188586 ?auto_188593 ) ) ( not ( = ?auto_188586 ?auto_188594 ) ) ( not ( = ?auto_188586 ?auto_188595 ) ) ( not ( = ?auto_188587 ?auto_188588 ) ) ( not ( = ?auto_188587 ?auto_188589 ) ) ( not ( = ?auto_188587 ?auto_188590 ) ) ( not ( = ?auto_188587 ?auto_188591 ) ) ( not ( = ?auto_188587 ?auto_188592 ) ) ( not ( = ?auto_188587 ?auto_188593 ) ) ( not ( = ?auto_188587 ?auto_188594 ) ) ( not ( = ?auto_188587 ?auto_188595 ) ) ( not ( = ?auto_188588 ?auto_188589 ) ) ( not ( = ?auto_188588 ?auto_188590 ) ) ( not ( = ?auto_188588 ?auto_188591 ) ) ( not ( = ?auto_188588 ?auto_188592 ) ) ( not ( = ?auto_188588 ?auto_188593 ) ) ( not ( = ?auto_188588 ?auto_188594 ) ) ( not ( = ?auto_188588 ?auto_188595 ) ) ( not ( = ?auto_188589 ?auto_188590 ) ) ( not ( = ?auto_188589 ?auto_188591 ) ) ( not ( = ?auto_188589 ?auto_188592 ) ) ( not ( = ?auto_188589 ?auto_188593 ) ) ( not ( = ?auto_188589 ?auto_188594 ) ) ( not ( = ?auto_188589 ?auto_188595 ) ) ( not ( = ?auto_188590 ?auto_188591 ) ) ( not ( = ?auto_188590 ?auto_188592 ) ) ( not ( = ?auto_188590 ?auto_188593 ) ) ( not ( = ?auto_188590 ?auto_188594 ) ) ( not ( = ?auto_188590 ?auto_188595 ) ) ( not ( = ?auto_188591 ?auto_188592 ) ) ( not ( = ?auto_188591 ?auto_188593 ) ) ( not ( = ?auto_188591 ?auto_188594 ) ) ( not ( = ?auto_188591 ?auto_188595 ) ) ( not ( = ?auto_188592 ?auto_188593 ) ) ( not ( = ?auto_188592 ?auto_188594 ) ) ( not ( = ?auto_188592 ?auto_188595 ) ) ( not ( = ?auto_188593 ?auto_188594 ) ) ( not ( = ?auto_188593 ?auto_188595 ) ) ( not ( = ?auto_188594 ?auto_188595 ) ) ( ON ?auto_188594 ?auto_188595 ) ( ON ?auto_188593 ?auto_188594 ) ( ON ?auto_188592 ?auto_188593 ) ( ON ?auto_188591 ?auto_188592 ) ( ON ?auto_188590 ?auto_188591 ) ( CLEAR ?auto_188588 ) ( ON ?auto_188589 ?auto_188590 ) ( CLEAR ?auto_188589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188584 ?auto_188585 ?auto_188586 ?auto_188587 ?auto_188588 ?auto_188589 )
      ( MAKE-12PILE ?auto_188584 ?auto_188585 ?auto_188586 ?auto_188587 ?auto_188588 ?auto_188589 ?auto_188590 ?auto_188591 ?auto_188592 ?auto_188593 ?auto_188594 ?auto_188595 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188608 - BLOCK
      ?auto_188609 - BLOCK
      ?auto_188610 - BLOCK
      ?auto_188611 - BLOCK
      ?auto_188612 - BLOCK
      ?auto_188613 - BLOCK
      ?auto_188614 - BLOCK
      ?auto_188615 - BLOCK
      ?auto_188616 - BLOCK
      ?auto_188617 - BLOCK
      ?auto_188618 - BLOCK
      ?auto_188619 - BLOCK
    )
    :vars
    (
      ?auto_188620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188619 ?auto_188620 ) ( ON-TABLE ?auto_188608 ) ( ON ?auto_188609 ?auto_188608 ) ( ON ?auto_188610 ?auto_188609 ) ( ON ?auto_188611 ?auto_188610 ) ( not ( = ?auto_188608 ?auto_188609 ) ) ( not ( = ?auto_188608 ?auto_188610 ) ) ( not ( = ?auto_188608 ?auto_188611 ) ) ( not ( = ?auto_188608 ?auto_188612 ) ) ( not ( = ?auto_188608 ?auto_188613 ) ) ( not ( = ?auto_188608 ?auto_188614 ) ) ( not ( = ?auto_188608 ?auto_188615 ) ) ( not ( = ?auto_188608 ?auto_188616 ) ) ( not ( = ?auto_188608 ?auto_188617 ) ) ( not ( = ?auto_188608 ?auto_188618 ) ) ( not ( = ?auto_188608 ?auto_188619 ) ) ( not ( = ?auto_188608 ?auto_188620 ) ) ( not ( = ?auto_188609 ?auto_188610 ) ) ( not ( = ?auto_188609 ?auto_188611 ) ) ( not ( = ?auto_188609 ?auto_188612 ) ) ( not ( = ?auto_188609 ?auto_188613 ) ) ( not ( = ?auto_188609 ?auto_188614 ) ) ( not ( = ?auto_188609 ?auto_188615 ) ) ( not ( = ?auto_188609 ?auto_188616 ) ) ( not ( = ?auto_188609 ?auto_188617 ) ) ( not ( = ?auto_188609 ?auto_188618 ) ) ( not ( = ?auto_188609 ?auto_188619 ) ) ( not ( = ?auto_188609 ?auto_188620 ) ) ( not ( = ?auto_188610 ?auto_188611 ) ) ( not ( = ?auto_188610 ?auto_188612 ) ) ( not ( = ?auto_188610 ?auto_188613 ) ) ( not ( = ?auto_188610 ?auto_188614 ) ) ( not ( = ?auto_188610 ?auto_188615 ) ) ( not ( = ?auto_188610 ?auto_188616 ) ) ( not ( = ?auto_188610 ?auto_188617 ) ) ( not ( = ?auto_188610 ?auto_188618 ) ) ( not ( = ?auto_188610 ?auto_188619 ) ) ( not ( = ?auto_188610 ?auto_188620 ) ) ( not ( = ?auto_188611 ?auto_188612 ) ) ( not ( = ?auto_188611 ?auto_188613 ) ) ( not ( = ?auto_188611 ?auto_188614 ) ) ( not ( = ?auto_188611 ?auto_188615 ) ) ( not ( = ?auto_188611 ?auto_188616 ) ) ( not ( = ?auto_188611 ?auto_188617 ) ) ( not ( = ?auto_188611 ?auto_188618 ) ) ( not ( = ?auto_188611 ?auto_188619 ) ) ( not ( = ?auto_188611 ?auto_188620 ) ) ( not ( = ?auto_188612 ?auto_188613 ) ) ( not ( = ?auto_188612 ?auto_188614 ) ) ( not ( = ?auto_188612 ?auto_188615 ) ) ( not ( = ?auto_188612 ?auto_188616 ) ) ( not ( = ?auto_188612 ?auto_188617 ) ) ( not ( = ?auto_188612 ?auto_188618 ) ) ( not ( = ?auto_188612 ?auto_188619 ) ) ( not ( = ?auto_188612 ?auto_188620 ) ) ( not ( = ?auto_188613 ?auto_188614 ) ) ( not ( = ?auto_188613 ?auto_188615 ) ) ( not ( = ?auto_188613 ?auto_188616 ) ) ( not ( = ?auto_188613 ?auto_188617 ) ) ( not ( = ?auto_188613 ?auto_188618 ) ) ( not ( = ?auto_188613 ?auto_188619 ) ) ( not ( = ?auto_188613 ?auto_188620 ) ) ( not ( = ?auto_188614 ?auto_188615 ) ) ( not ( = ?auto_188614 ?auto_188616 ) ) ( not ( = ?auto_188614 ?auto_188617 ) ) ( not ( = ?auto_188614 ?auto_188618 ) ) ( not ( = ?auto_188614 ?auto_188619 ) ) ( not ( = ?auto_188614 ?auto_188620 ) ) ( not ( = ?auto_188615 ?auto_188616 ) ) ( not ( = ?auto_188615 ?auto_188617 ) ) ( not ( = ?auto_188615 ?auto_188618 ) ) ( not ( = ?auto_188615 ?auto_188619 ) ) ( not ( = ?auto_188615 ?auto_188620 ) ) ( not ( = ?auto_188616 ?auto_188617 ) ) ( not ( = ?auto_188616 ?auto_188618 ) ) ( not ( = ?auto_188616 ?auto_188619 ) ) ( not ( = ?auto_188616 ?auto_188620 ) ) ( not ( = ?auto_188617 ?auto_188618 ) ) ( not ( = ?auto_188617 ?auto_188619 ) ) ( not ( = ?auto_188617 ?auto_188620 ) ) ( not ( = ?auto_188618 ?auto_188619 ) ) ( not ( = ?auto_188618 ?auto_188620 ) ) ( not ( = ?auto_188619 ?auto_188620 ) ) ( ON ?auto_188618 ?auto_188619 ) ( ON ?auto_188617 ?auto_188618 ) ( ON ?auto_188616 ?auto_188617 ) ( ON ?auto_188615 ?auto_188616 ) ( ON ?auto_188614 ?auto_188615 ) ( ON ?auto_188613 ?auto_188614 ) ( CLEAR ?auto_188611 ) ( ON ?auto_188612 ?auto_188613 ) ( CLEAR ?auto_188612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188608 ?auto_188609 ?auto_188610 ?auto_188611 ?auto_188612 )
      ( MAKE-12PILE ?auto_188608 ?auto_188609 ?auto_188610 ?auto_188611 ?auto_188612 ?auto_188613 ?auto_188614 ?auto_188615 ?auto_188616 ?auto_188617 ?auto_188618 ?auto_188619 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188633 - BLOCK
      ?auto_188634 - BLOCK
      ?auto_188635 - BLOCK
      ?auto_188636 - BLOCK
      ?auto_188637 - BLOCK
      ?auto_188638 - BLOCK
      ?auto_188639 - BLOCK
      ?auto_188640 - BLOCK
      ?auto_188641 - BLOCK
      ?auto_188642 - BLOCK
      ?auto_188643 - BLOCK
      ?auto_188644 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188644 ) ( ON-TABLE ?auto_188633 ) ( ON ?auto_188634 ?auto_188633 ) ( ON ?auto_188635 ?auto_188634 ) ( ON ?auto_188636 ?auto_188635 ) ( not ( = ?auto_188633 ?auto_188634 ) ) ( not ( = ?auto_188633 ?auto_188635 ) ) ( not ( = ?auto_188633 ?auto_188636 ) ) ( not ( = ?auto_188633 ?auto_188637 ) ) ( not ( = ?auto_188633 ?auto_188638 ) ) ( not ( = ?auto_188633 ?auto_188639 ) ) ( not ( = ?auto_188633 ?auto_188640 ) ) ( not ( = ?auto_188633 ?auto_188641 ) ) ( not ( = ?auto_188633 ?auto_188642 ) ) ( not ( = ?auto_188633 ?auto_188643 ) ) ( not ( = ?auto_188633 ?auto_188644 ) ) ( not ( = ?auto_188634 ?auto_188635 ) ) ( not ( = ?auto_188634 ?auto_188636 ) ) ( not ( = ?auto_188634 ?auto_188637 ) ) ( not ( = ?auto_188634 ?auto_188638 ) ) ( not ( = ?auto_188634 ?auto_188639 ) ) ( not ( = ?auto_188634 ?auto_188640 ) ) ( not ( = ?auto_188634 ?auto_188641 ) ) ( not ( = ?auto_188634 ?auto_188642 ) ) ( not ( = ?auto_188634 ?auto_188643 ) ) ( not ( = ?auto_188634 ?auto_188644 ) ) ( not ( = ?auto_188635 ?auto_188636 ) ) ( not ( = ?auto_188635 ?auto_188637 ) ) ( not ( = ?auto_188635 ?auto_188638 ) ) ( not ( = ?auto_188635 ?auto_188639 ) ) ( not ( = ?auto_188635 ?auto_188640 ) ) ( not ( = ?auto_188635 ?auto_188641 ) ) ( not ( = ?auto_188635 ?auto_188642 ) ) ( not ( = ?auto_188635 ?auto_188643 ) ) ( not ( = ?auto_188635 ?auto_188644 ) ) ( not ( = ?auto_188636 ?auto_188637 ) ) ( not ( = ?auto_188636 ?auto_188638 ) ) ( not ( = ?auto_188636 ?auto_188639 ) ) ( not ( = ?auto_188636 ?auto_188640 ) ) ( not ( = ?auto_188636 ?auto_188641 ) ) ( not ( = ?auto_188636 ?auto_188642 ) ) ( not ( = ?auto_188636 ?auto_188643 ) ) ( not ( = ?auto_188636 ?auto_188644 ) ) ( not ( = ?auto_188637 ?auto_188638 ) ) ( not ( = ?auto_188637 ?auto_188639 ) ) ( not ( = ?auto_188637 ?auto_188640 ) ) ( not ( = ?auto_188637 ?auto_188641 ) ) ( not ( = ?auto_188637 ?auto_188642 ) ) ( not ( = ?auto_188637 ?auto_188643 ) ) ( not ( = ?auto_188637 ?auto_188644 ) ) ( not ( = ?auto_188638 ?auto_188639 ) ) ( not ( = ?auto_188638 ?auto_188640 ) ) ( not ( = ?auto_188638 ?auto_188641 ) ) ( not ( = ?auto_188638 ?auto_188642 ) ) ( not ( = ?auto_188638 ?auto_188643 ) ) ( not ( = ?auto_188638 ?auto_188644 ) ) ( not ( = ?auto_188639 ?auto_188640 ) ) ( not ( = ?auto_188639 ?auto_188641 ) ) ( not ( = ?auto_188639 ?auto_188642 ) ) ( not ( = ?auto_188639 ?auto_188643 ) ) ( not ( = ?auto_188639 ?auto_188644 ) ) ( not ( = ?auto_188640 ?auto_188641 ) ) ( not ( = ?auto_188640 ?auto_188642 ) ) ( not ( = ?auto_188640 ?auto_188643 ) ) ( not ( = ?auto_188640 ?auto_188644 ) ) ( not ( = ?auto_188641 ?auto_188642 ) ) ( not ( = ?auto_188641 ?auto_188643 ) ) ( not ( = ?auto_188641 ?auto_188644 ) ) ( not ( = ?auto_188642 ?auto_188643 ) ) ( not ( = ?auto_188642 ?auto_188644 ) ) ( not ( = ?auto_188643 ?auto_188644 ) ) ( ON ?auto_188643 ?auto_188644 ) ( ON ?auto_188642 ?auto_188643 ) ( ON ?auto_188641 ?auto_188642 ) ( ON ?auto_188640 ?auto_188641 ) ( ON ?auto_188639 ?auto_188640 ) ( ON ?auto_188638 ?auto_188639 ) ( CLEAR ?auto_188636 ) ( ON ?auto_188637 ?auto_188638 ) ( CLEAR ?auto_188637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188633 ?auto_188634 ?auto_188635 ?auto_188636 ?auto_188637 )
      ( MAKE-12PILE ?auto_188633 ?auto_188634 ?auto_188635 ?auto_188636 ?auto_188637 ?auto_188638 ?auto_188639 ?auto_188640 ?auto_188641 ?auto_188642 ?auto_188643 ?auto_188644 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188657 - BLOCK
      ?auto_188658 - BLOCK
      ?auto_188659 - BLOCK
      ?auto_188660 - BLOCK
      ?auto_188661 - BLOCK
      ?auto_188662 - BLOCK
      ?auto_188663 - BLOCK
      ?auto_188664 - BLOCK
      ?auto_188665 - BLOCK
      ?auto_188666 - BLOCK
      ?auto_188667 - BLOCK
      ?auto_188668 - BLOCK
    )
    :vars
    (
      ?auto_188669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188668 ?auto_188669 ) ( ON-TABLE ?auto_188657 ) ( ON ?auto_188658 ?auto_188657 ) ( ON ?auto_188659 ?auto_188658 ) ( not ( = ?auto_188657 ?auto_188658 ) ) ( not ( = ?auto_188657 ?auto_188659 ) ) ( not ( = ?auto_188657 ?auto_188660 ) ) ( not ( = ?auto_188657 ?auto_188661 ) ) ( not ( = ?auto_188657 ?auto_188662 ) ) ( not ( = ?auto_188657 ?auto_188663 ) ) ( not ( = ?auto_188657 ?auto_188664 ) ) ( not ( = ?auto_188657 ?auto_188665 ) ) ( not ( = ?auto_188657 ?auto_188666 ) ) ( not ( = ?auto_188657 ?auto_188667 ) ) ( not ( = ?auto_188657 ?auto_188668 ) ) ( not ( = ?auto_188657 ?auto_188669 ) ) ( not ( = ?auto_188658 ?auto_188659 ) ) ( not ( = ?auto_188658 ?auto_188660 ) ) ( not ( = ?auto_188658 ?auto_188661 ) ) ( not ( = ?auto_188658 ?auto_188662 ) ) ( not ( = ?auto_188658 ?auto_188663 ) ) ( not ( = ?auto_188658 ?auto_188664 ) ) ( not ( = ?auto_188658 ?auto_188665 ) ) ( not ( = ?auto_188658 ?auto_188666 ) ) ( not ( = ?auto_188658 ?auto_188667 ) ) ( not ( = ?auto_188658 ?auto_188668 ) ) ( not ( = ?auto_188658 ?auto_188669 ) ) ( not ( = ?auto_188659 ?auto_188660 ) ) ( not ( = ?auto_188659 ?auto_188661 ) ) ( not ( = ?auto_188659 ?auto_188662 ) ) ( not ( = ?auto_188659 ?auto_188663 ) ) ( not ( = ?auto_188659 ?auto_188664 ) ) ( not ( = ?auto_188659 ?auto_188665 ) ) ( not ( = ?auto_188659 ?auto_188666 ) ) ( not ( = ?auto_188659 ?auto_188667 ) ) ( not ( = ?auto_188659 ?auto_188668 ) ) ( not ( = ?auto_188659 ?auto_188669 ) ) ( not ( = ?auto_188660 ?auto_188661 ) ) ( not ( = ?auto_188660 ?auto_188662 ) ) ( not ( = ?auto_188660 ?auto_188663 ) ) ( not ( = ?auto_188660 ?auto_188664 ) ) ( not ( = ?auto_188660 ?auto_188665 ) ) ( not ( = ?auto_188660 ?auto_188666 ) ) ( not ( = ?auto_188660 ?auto_188667 ) ) ( not ( = ?auto_188660 ?auto_188668 ) ) ( not ( = ?auto_188660 ?auto_188669 ) ) ( not ( = ?auto_188661 ?auto_188662 ) ) ( not ( = ?auto_188661 ?auto_188663 ) ) ( not ( = ?auto_188661 ?auto_188664 ) ) ( not ( = ?auto_188661 ?auto_188665 ) ) ( not ( = ?auto_188661 ?auto_188666 ) ) ( not ( = ?auto_188661 ?auto_188667 ) ) ( not ( = ?auto_188661 ?auto_188668 ) ) ( not ( = ?auto_188661 ?auto_188669 ) ) ( not ( = ?auto_188662 ?auto_188663 ) ) ( not ( = ?auto_188662 ?auto_188664 ) ) ( not ( = ?auto_188662 ?auto_188665 ) ) ( not ( = ?auto_188662 ?auto_188666 ) ) ( not ( = ?auto_188662 ?auto_188667 ) ) ( not ( = ?auto_188662 ?auto_188668 ) ) ( not ( = ?auto_188662 ?auto_188669 ) ) ( not ( = ?auto_188663 ?auto_188664 ) ) ( not ( = ?auto_188663 ?auto_188665 ) ) ( not ( = ?auto_188663 ?auto_188666 ) ) ( not ( = ?auto_188663 ?auto_188667 ) ) ( not ( = ?auto_188663 ?auto_188668 ) ) ( not ( = ?auto_188663 ?auto_188669 ) ) ( not ( = ?auto_188664 ?auto_188665 ) ) ( not ( = ?auto_188664 ?auto_188666 ) ) ( not ( = ?auto_188664 ?auto_188667 ) ) ( not ( = ?auto_188664 ?auto_188668 ) ) ( not ( = ?auto_188664 ?auto_188669 ) ) ( not ( = ?auto_188665 ?auto_188666 ) ) ( not ( = ?auto_188665 ?auto_188667 ) ) ( not ( = ?auto_188665 ?auto_188668 ) ) ( not ( = ?auto_188665 ?auto_188669 ) ) ( not ( = ?auto_188666 ?auto_188667 ) ) ( not ( = ?auto_188666 ?auto_188668 ) ) ( not ( = ?auto_188666 ?auto_188669 ) ) ( not ( = ?auto_188667 ?auto_188668 ) ) ( not ( = ?auto_188667 ?auto_188669 ) ) ( not ( = ?auto_188668 ?auto_188669 ) ) ( ON ?auto_188667 ?auto_188668 ) ( ON ?auto_188666 ?auto_188667 ) ( ON ?auto_188665 ?auto_188666 ) ( ON ?auto_188664 ?auto_188665 ) ( ON ?auto_188663 ?auto_188664 ) ( ON ?auto_188662 ?auto_188663 ) ( ON ?auto_188661 ?auto_188662 ) ( CLEAR ?auto_188659 ) ( ON ?auto_188660 ?auto_188661 ) ( CLEAR ?auto_188660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188657 ?auto_188658 ?auto_188659 ?auto_188660 )
      ( MAKE-12PILE ?auto_188657 ?auto_188658 ?auto_188659 ?auto_188660 ?auto_188661 ?auto_188662 ?auto_188663 ?auto_188664 ?auto_188665 ?auto_188666 ?auto_188667 ?auto_188668 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188682 - BLOCK
      ?auto_188683 - BLOCK
      ?auto_188684 - BLOCK
      ?auto_188685 - BLOCK
      ?auto_188686 - BLOCK
      ?auto_188687 - BLOCK
      ?auto_188688 - BLOCK
      ?auto_188689 - BLOCK
      ?auto_188690 - BLOCK
      ?auto_188691 - BLOCK
      ?auto_188692 - BLOCK
      ?auto_188693 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188693 ) ( ON-TABLE ?auto_188682 ) ( ON ?auto_188683 ?auto_188682 ) ( ON ?auto_188684 ?auto_188683 ) ( not ( = ?auto_188682 ?auto_188683 ) ) ( not ( = ?auto_188682 ?auto_188684 ) ) ( not ( = ?auto_188682 ?auto_188685 ) ) ( not ( = ?auto_188682 ?auto_188686 ) ) ( not ( = ?auto_188682 ?auto_188687 ) ) ( not ( = ?auto_188682 ?auto_188688 ) ) ( not ( = ?auto_188682 ?auto_188689 ) ) ( not ( = ?auto_188682 ?auto_188690 ) ) ( not ( = ?auto_188682 ?auto_188691 ) ) ( not ( = ?auto_188682 ?auto_188692 ) ) ( not ( = ?auto_188682 ?auto_188693 ) ) ( not ( = ?auto_188683 ?auto_188684 ) ) ( not ( = ?auto_188683 ?auto_188685 ) ) ( not ( = ?auto_188683 ?auto_188686 ) ) ( not ( = ?auto_188683 ?auto_188687 ) ) ( not ( = ?auto_188683 ?auto_188688 ) ) ( not ( = ?auto_188683 ?auto_188689 ) ) ( not ( = ?auto_188683 ?auto_188690 ) ) ( not ( = ?auto_188683 ?auto_188691 ) ) ( not ( = ?auto_188683 ?auto_188692 ) ) ( not ( = ?auto_188683 ?auto_188693 ) ) ( not ( = ?auto_188684 ?auto_188685 ) ) ( not ( = ?auto_188684 ?auto_188686 ) ) ( not ( = ?auto_188684 ?auto_188687 ) ) ( not ( = ?auto_188684 ?auto_188688 ) ) ( not ( = ?auto_188684 ?auto_188689 ) ) ( not ( = ?auto_188684 ?auto_188690 ) ) ( not ( = ?auto_188684 ?auto_188691 ) ) ( not ( = ?auto_188684 ?auto_188692 ) ) ( not ( = ?auto_188684 ?auto_188693 ) ) ( not ( = ?auto_188685 ?auto_188686 ) ) ( not ( = ?auto_188685 ?auto_188687 ) ) ( not ( = ?auto_188685 ?auto_188688 ) ) ( not ( = ?auto_188685 ?auto_188689 ) ) ( not ( = ?auto_188685 ?auto_188690 ) ) ( not ( = ?auto_188685 ?auto_188691 ) ) ( not ( = ?auto_188685 ?auto_188692 ) ) ( not ( = ?auto_188685 ?auto_188693 ) ) ( not ( = ?auto_188686 ?auto_188687 ) ) ( not ( = ?auto_188686 ?auto_188688 ) ) ( not ( = ?auto_188686 ?auto_188689 ) ) ( not ( = ?auto_188686 ?auto_188690 ) ) ( not ( = ?auto_188686 ?auto_188691 ) ) ( not ( = ?auto_188686 ?auto_188692 ) ) ( not ( = ?auto_188686 ?auto_188693 ) ) ( not ( = ?auto_188687 ?auto_188688 ) ) ( not ( = ?auto_188687 ?auto_188689 ) ) ( not ( = ?auto_188687 ?auto_188690 ) ) ( not ( = ?auto_188687 ?auto_188691 ) ) ( not ( = ?auto_188687 ?auto_188692 ) ) ( not ( = ?auto_188687 ?auto_188693 ) ) ( not ( = ?auto_188688 ?auto_188689 ) ) ( not ( = ?auto_188688 ?auto_188690 ) ) ( not ( = ?auto_188688 ?auto_188691 ) ) ( not ( = ?auto_188688 ?auto_188692 ) ) ( not ( = ?auto_188688 ?auto_188693 ) ) ( not ( = ?auto_188689 ?auto_188690 ) ) ( not ( = ?auto_188689 ?auto_188691 ) ) ( not ( = ?auto_188689 ?auto_188692 ) ) ( not ( = ?auto_188689 ?auto_188693 ) ) ( not ( = ?auto_188690 ?auto_188691 ) ) ( not ( = ?auto_188690 ?auto_188692 ) ) ( not ( = ?auto_188690 ?auto_188693 ) ) ( not ( = ?auto_188691 ?auto_188692 ) ) ( not ( = ?auto_188691 ?auto_188693 ) ) ( not ( = ?auto_188692 ?auto_188693 ) ) ( ON ?auto_188692 ?auto_188693 ) ( ON ?auto_188691 ?auto_188692 ) ( ON ?auto_188690 ?auto_188691 ) ( ON ?auto_188689 ?auto_188690 ) ( ON ?auto_188688 ?auto_188689 ) ( ON ?auto_188687 ?auto_188688 ) ( ON ?auto_188686 ?auto_188687 ) ( CLEAR ?auto_188684 ) ( ON ?auto_188685 ?auto_188686 ) ( CLEAR ?auto_188685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188682 ?auto_188683 ?auto_188684 ?auto_188685 )
      ( MAKE-12PILE ?auto_188682 ?auto_188683 ?auto_188684 ?auto_188685 ?auto_188686 ?auto_188687 ?auto_188688 ?auto_188689 ?auto_188690 ?auto_188691 ?auto_188692 ?auto_188693 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188706 - BLOCK
      ?auto_188707 - BLOCK
      ?auto_188708 - BLOCK
      ?auto_188709 - BLOCK
      ?auto_188710 - BLOCK
      ?auto_188711 - BLOCK
      ?auto_188712 - BLOCK
      ?auto_188713 - BLOCK
      ?auto_188714 - BLOCK
      ?auto_188715 - BLOCK
      ?auto_188716 - BLOCK
      ?auto_188717 - BLOCK
    )
    :vars
    (
      ?auto_188718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188717 ?auto_188718 ) ( ON-TABLE ?auto_188706 ) ( ON ?auto_188707 ?auto_188706 ) ( not ( = ?auto_188706 ?auto_188707 ) ) ( not ( = ?auto_188706 ?auto_188708 ) ) ( not ( = ?auto_188706 ?auto_188709 ) ) ( not ( = ?auto_188706 ?auto_188710 ) ) ( not ( = ?auto_188706 ?auto_188711 ) ) ( not ( = ?auto_188706 ?auto_188712 ) ) ( not ( = ?auto_188706 ?auto_188713 ) ) ( not ( = ?auto_188706 ?auto_188714 ) ) ( not ( = ?auto_188706 ?auto_188715 ) ) ( not ( = ?auto_188706 ?auto_188716 ) ) ( not ( = ?auto_188706 ?auto_188717 ) ) ( not ( = ?auto_188706 ?auto_188718 ) ) ( not ( = ?auto_188707 ?auto_188708 ) ) ( not ( = ?auto_188707 ?auto_188709 ) ) ( not ( = ?auto_188707 ?auto_188710 ) ) ( not ( = ?auto_188707 ?auto_188711 ) ) ( not ( = ?auto_188707 ?auto_188712 ) ) ( not ( = ?auto_188707 ?auto_188713 ) ) ( not ( = ?auto_188707 ?auto_188714 ) ) ( not ( = ?auto_188707 ?auto_188715 ) ) ( not ( = ?auto_188707 ?auto_188716 ) ) ( not ( = ?auto_188707 ?auto_188717 ) ) ( not ( = ?auto_188707 ?auto_188718 ) ) ( not ( = ?auto_188708 ?auto_188709 ) ) ( not ( = ?auto_188708 ?auto_188710 ) ) ( not ( = ?auto_188708 ?auto_188711 ) ) ( not ( = ?auto_188708 ?auto_188712 ) ) ( not ( = ?auto_188708 ?auto_188713 ) ) ( not ( = ?auto_188708 ?auto_188714 ) ) ( not ( = ?auto_188708 ?auto_188715 ) ) ( not ( = ?auto_188708 ?auto_188716 ) ) ( not ( = ?auto_188708 ?auto_188717 ) ) ( not ( = ?auto_188708 ?auto_188718 ) ) ( not ( = ?auto_188709 ?auto_188710 ) ) ( not ( = ?auto_188709 ?auto_188711 ) ) ( not ( = ?auto_188709 ?auto_188712 ) ) ( not ( = ?auto_188709 ?auto_188713 ) ) ( not ( = ?auto_188709 ?auto_188714 ) ) ( not ( = ?auto_188709 ?auto_188715 ) ) ( not ( = ?auto_188709 ?auto_188716 ) ) ( not ( = ?auto_188709 ?auto_188717 ) ) ( not ( = ?auto_188709 ?auto_188718 ) ) ( not ( = ?auto_188710 ?auto_188711 ) ) ( not ( = ?auto_188710 ?auto_188712 ) ) ( not ( = ?auto_188710 ?auto_188713 ) ) ( not ( = ?auto_188710 ?auto_188714 ) ) ( not ( = ?auto_188710 ?auto_188715 ) ) ( not ( = ?auto_188710 ?auto_188716 ) ) ( not ( = ?auto_188710 ?auto_188717 ) ) ( not ( = ?auto_188710 ?auto_188718 ) ) ( not ( = ?auto_188711 ?auto_188712 ) ) ( not ( = ?auto_188711 ?auto_188713 ) ) ( not ( = ?auto_188711 ?auto_188714 ) ) ( not ( = ?auto_188711 ?auto_188715 ) ) ( not ( = ?auto_188711 ?auto_188716 ) ) ( not ( = ?auto_188711 ?auto_188717 ) ) ( not ( = ?auto_188711 ?auto_188718 ) ) ( not ( = ?auto_188712 ?auto_188713 ) ) ( not ( = ?auto_188712 ?auto_188714 ) ) ( not ( = ?auto_188712 ?auto_188715 ) ) ( not ( = ?auto_188712 ?auto_188716 ) ) ( not ( = ?auto_188712 ?auto_188717 ) ) ( not ( = ?auto_188712 ?auto_188718 ) ) ( not ( = ?auto_188713 ?auto_188714 ) ) ( not ( = ?auto_188713 ?auto_188715 ) ) ( not ( = ?auto_188713 ?auto_188716 ) ) ( not ( = ?auto_188713 ?auto_188717 ) ) ( not ( = ?auto_188713 ?auto_188718 ) ) ( not ( = ?auto_188714 ?auto_188715 ) ) ( not ( = ?auto_188714 ?auto_188716 ) ) ( not ( = ?auto_188714 ?auto_188717 ) ) ( not ( = ?auto_188714 ?auto_188718 ) ) ( not ( = ?auto_188715 ?auto_188716 ) ) ( not ( = ?auto_188715 ?auto_188717 ) ) ( not ( = ?auto_188715 ?auto_188718 ) ) ( not ( = ?auto_188716 ?auto_188717 ) ) ( not ( = ?auto_188716 ?auto_188718 ) ) ( not ( = ?auto_188717 ?auto_188718 ) ) ( ON ?auto_188716 ?auto_188717 ) ( ON ?auto_188715 ?auto_188716 ) ( ON ?auto_188714 ?auto_188715 ) ( ON ?auto_188713 ?auto_188714 ) ( ON ?auto_188712 ?auto_188713 ) ( ON ?auto_188711 ?auto_188712 ) ( ON ?auto_188710 ?auto_188711 ) ( ON ?auto_188709 ?auto_188710 ) ( CLEAR ?auto_188707 ) ( ON ?auto_188708 ?auto_188709 ) ( CLEAR ?auto_188708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188706 ?auto_188707 ?auto_188708 )
      ( MAKE-12PILE ?auto_188706 ?auto_188707 ?auto_188708 ?auto_188709 ?auto_188710 ?auto_188711 ?auto_188712 ?auto_188713 ?auto_188714 ?auto_188715 ?auto_188716 ?auto_188717 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188731 - BLOCK
      ?auto_188732 - BLOCK
      ?auto_188733 - BLOCK
      ?auto_188734 - BLOCK
      ?auto_188735 - BLOCK
      ?auto_188736 - BLOCK
      ?auto_188737 - BLOCK
      ?auto_188738 - BLOCK
      ?auto_188739 - BLOCK
      ?auto_188740 - BLOCK
      ?auto_188741 - BLOCK
      ?auto_188742 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188742 ) ( ON-TABLE ?auto_188731 ) ( ON ?auto_188732 ?auto_188731 ) ( not ( = ?auto_188731 ?auto_188732 ) ) ( not ( = ?auto_188731 ?auto_188733 ) ) ( not ( = ?auto_188731 ?auto_188734 ) ) ( not ( = ?auto_188731 ?auto_188735 ) ) ( not ( = ?auto_188731 ?auto_188736 ) ) ( not ( = ?auto_188731 ?auto_188737 ) ) ( not ( = ?auto_188731 ?auto_188738 ) ) ( not ( = ?auto_188731 ?auto_188739 ) ) ( not ( = ?auto_188731 ?auto_188740 ) ) ( not ( = ?auto_188731 ?auto_188741 ) ) ( not ( = ?auto_188731 ?auto_188742 ) ) ( not ( = ?auto_188732 ?auto_188733 ) ) ( not ( = ?auto_188732 ?auto_188734 ) ) ( not ( = ?auto_188732 ?auto_188735 ) ) ( not ( = ?auto_188732 ?auto_188736 ) ) ( not ( = ?auto_188732 ?auto_188737 ) ) ( not ( = ?auto_188732 ?auto_188738 ) ) ( not ( = ?auto_188732 ?auto_188739 ) ) ( not ( = ?auto_188732 ?auto_188740 ) ) ( not ( = ?auto_188732 ?auto_188741 ) ) ( not ( = ?auto_188732 ?auto_188742 ) ) ( not ( = ?auto_188733 ?auto_188734 ) ) ( not ( = ?auto_188733 ?auto_188735 ) ) ( not ( = ?auto_188733 ?auto_188736 ) ) ( not ( = ?auto_188733 ?auto_188737 ) ) ( not ( = ?auto_188733 ?auto_188738 ) ) ( not ( = ?auto_188733 ?auto_188739 ) ) ( not ( = ?auto_188733 ?auto_188740 ) ) ( not ( = ?auto_188733 ?auto_188741 ) ) ( not ( = ?auto_188733 ?auto_188742 ) ) ( not ( = ?auto_188734 ?auto_188735 ) ) ( not ( = ?auto_188734 ?auto_188736 ) ) ( not ( = ?auto_188734 ?auto_188737 ) ) ( not ( = ?auto_188734 ?auto_188738 ) ) ( not ( = ?auto_188734 ?auto_188739 ) ) ( not ( = ?auto_188734 ?auto_188740 ) ) ( not ( = ?auto_188734 ?auto_188741 ) ) ( not ( = ?auto_188734 ?auto_188742 ) ) ( not ( = ?auto_188735 ?auto_188736 ) ) ( not ( = ?auto_188735 ?auto_188737 ) ) ( not ( = ?auto_188735 ?auto_188738 ) ) ( not ( = ?auto_188735 ?auto_188739 ) ) ( not ( = ?auto_188735 ?auto_188740 ) ) ( not ( = ?auto_188735 ?auto_188741 ) ) ( not ( = ?auto_188735 ?auto_188742 ) ) ( not ( = ?auto_188736 ?auto_188737 ) ) ( not ( = ?auto_188736 ?auto_188738 ) ) ( not ( = ?auto_188736 ?auto_188739 ) ) ( not ( = ?auto_188736 ?auto_188740 ) ) ( not ( = ?auto_188736 ?auto_188741 ) ) ( not ( = ?auto_188736 ?auto_188742 ) ) ( not ( = ?auto_188737 ?auto_188738 ) ) ( not ( = ?auto_188737 ?auto_188739 ) ) ( not ( = ?auto_188737 ?auto_188740 ) ) ( not ( = ?auto_188737 ?auto_188741 ) ) ( not ( = ?auto_188737 ?auto_188742 ) ) ( not ( = ?auto_188738 ?auto_188739 ) ) ( not ( = ?auto_188738 ?auto_188740 ) ) ( not ( = ?auto_188738 ?auto_188741 ) ) ( not ( = ?auto_188738 ?auto_188742 ) ) ( not ( = ?auto_188739 ?auto_188740 ) ) ( not ( = ?auto_188739 ?auto_188741 ) ) ( not ( = ?auto_188739 ?auto_188742 ) ) ( not ( = ?auto_188740 ?auto_188741 ) ) ( not ( = ?auto_188740 ?auto_188742 ) ) ( not ( = ?auto_188741 ?auto_188742 ) ) ( ON ?auto_188741 ?auto_188742 ) ( ON ?auto_188740 ?auto_188741 ) ( ON ?auto_188739 ?auto_188740 ) ( ON ?auto_188738 ?auto_188739 ) ( ON ?auto_188737 ?auto_188738 ) ( ON ?auto_188736 ?auto_188737 ) ( ON ?auto_188735 ?auto_188736 ) ( ON ?auto_188734 ?auto_188735 ) ( CLEAR ?auto_188732 ) ( ON ?auto_188733 ?auto_188734 ) ( CLEAR ?auto_188733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188731 ?auto_188732 ?auto_188733 )
      ( MAKE-12PILE ?auto_188731 ?auto_188732 ?auto_188733 ?auto_188734 ?auto_188735 ?auto_188736 ?auto_188737 ?auto_188738 ?auto_188739 ?auto_188740 ?auto_188741 ?auto_188742 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188755 - BLOCK
      ?auto_188756 - BLOCK
      ?auto_188757 - BLOCK
      ?auto_188758 - BLOCK
      ?auto_188759 - BLOCK
      ?auto_188760 - BLOCK
      ?auto_188761 - BLOCK
      ?auto_188762 - BLOCK
      ?auto_188763 - BLOCK
      ?auto_188764 - BLOCK
      ?auto_188765 - BLOCK
      ?auto_188766 - BLOCK
    )
    :vars
    (
      ?auto_188767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188766 ?auto_188767 ) ( ON-TABLE ?auto_188755 ) ( not ( = ?auto_188755 ?auto_188756 ) ) ( not ( = ?auto_188755 ?auto_188757 ) ) ( not ( = ?auto_188755 ?auto_188758 ) ) ( not ( = ?auto_188755 ?auto_188759 ) ) ( not ( = ?auto_188755 ?auto_188760 ) ) ( not ( = ?auto_188755 ?auto_188761 ) ) ( not ( = ?auto_188755 ?auto_188762 ) ) ( not ( = ?auto_188755 ?auto_188763 ) ) ( not ( = ?auto_188755 ?auto_188764 ) ) ( not ( = ?auto_188755 ?auto_188765 ) ) ( not ( = ?auto_188755 ?auto_188766 ) ) ( not ( = ?auto_188755 ?auto_188767 ) ) ( not ( = ?auto_188756 ?auto_188757 ) ) ( not ( = ?auto_188756 ?auto_188758 ) ) ( not ( = ?auto_188756 ?auto_188759 ) ) ( not ( = ?auto_188756 ?auto_188760 ) ) ( not ( = ?auto_188756 ?auto_188761 ) ) ( not ( = ?auto_188756 ?auto_188762 ) ) ( not ( = ?auto_188756 ?auto_188763 ) ) ( not ( = ?auto_188756 ?auto_188764 ) ) ( not ( = ?auto_188756 ?auto_188765 ) ) ( not ( = ?auto_188756 ?auto_188766 ) ) ( not ( = ?auto_188756 ?auto_188767 ) ) ( not ( = ?auto_188757 ?auto_188758 ) ) ( not ( = ?auto_188757 ?auto_188759 ) ) ( not ( = ?auto_188757 ?auto_188760 ) ) ( not ( = ?auto_188757 ?auto_188761 ) ) ( not ( = ?auto_188757 ?auto_188762 ) ) ( not ( = ?auto_188757 ?auto_188763 ) ) ( not ( = ?auto_188757 ?auto_188764 ) ) ( not ( = ?auto_188757 ?auto_188765 ) ) ( not ( = ?auto_188757 ?auto_188766 ) ) ( not ( = ?auto_188757 ?auto_188767 ) ) ( not ( = ?auto_188758 ?auto_188759 ) ) ( not ( = ?auto_188758 ?auto_188760 ) ) ( not ( = ?auto_188758 ?auto_188761 ) ) ( not ( = ?auto_188758 ?auto_188762 ) ) ( not ( = ?auto_188758 ?auto_188763 ) ) ( not ( = ?auto_188758 ?auto_188764 ) ) ( not ( = ?auto_188758 ?auto_188765 ) ) ( not ( = ?auto_188758 ?auto_188766 ) ) ( not ( = ?auto_188758 ?auto_188767 ) ) ( not ( = ?auto_188759 ?auto_188760 ) ) ( not ( = ?auto_188759 ?auto_188761 ) ) ( not ( = ?auto_188759 ?auto_188762 ) ) ( not ( = ?auto_188759 ?auto_188763 ) ) ( not ( = ?auto_188759 ?auto_188764 ) ) ( not ( = ?auto_188759 ?auto_188765 ) ) ( not ( = ?auto_188759 ?auto_188766 ) ) ( not ( = ?auto_188759 ?auto_188767 ) ) ( not ( = ?auto_188760 ?auto_188761 ) ) ( not ( = ?auto_188760 ?auto_188762 ) ) ( not ( = ?auto_188760 ?auto_188763 ) ) ( not ( = ?auto_188760 ?auto_188764 ) ) ( not ( = ?auto_188760 ?auto_188765 ) ) ( not ( = ?auto_188760 ?auto_188766 ) ) ( not ( = ?auto_188760 ?auto_188767 ) ) ( not ( = ?auto_188761 ?auto_188762 ) ) ( not ( = ?auto_188761 ?auto_188763 ) ) ( not ( = ?auto_188761 ?auto_188764 ) ) ( not ( = ?auto_188761 ?auto_188765 ) ) ( not ( = ?auto_188761 ?auto_188766 ) ) ( not ( = ?auto_188761 ?auto_188767 ) ) ( not ( = ?auto_188762 ?auto_188763 ) ) ( not ( = ?auto_188762 ?auto_188764 ) ) ( not ( = ?auto_188762 ?auto_188765 ) ) ( not ( = ?auto_188762 ?auto_188766 ) ) ( not ( = ?auto_188762 ?auto_188767 ) ) ( not ( = ?auto_188763 ?auto_188764 ) ) ( not ( = ?auto_188763 ?auto_188765 ) ) ( not ( = ?auto_188763 ?auto_188766 ) ) ( not ( = ?auto_188763 ?auto_188767 ) ) ( not ( = ?auto_188764 ?auto_188765 ) ) ( not ( = ?auto_188764 ?auto_188766 ) ) ( not ( = ?auto_188764 ?auto_188767 ) ) ( not ( = ?auto_188765 ?auto_188766 ) ) ( not ( = ?auto_188765 ?auto_188767 ) ) ( not ( = ?auto_188766 ?auto_188767 ) ) ( ON ?auto_188765 ?auto_188766 ) ( ON ?auto_188764 ?auto_188765 ) ( ON ?auto_188763 ?auto_188764 ) ( ON ?auto_188762 ?auto_188763 ) ( ON ?auto_188761 ?auto_188762 ) ( ON ?auto_188760 ?auto_188761 ) ( ON ?auto_188759 ?auto_188760 ) ( ON ?auto_188758 ?auto_188759 ) ( ON ?auto_188757 ?auto_188758 ) ( CLEAR ?auto_188755 ) ( ON ?auto_188756 ?auto_188757 ) ( CLEAR ?auto_188756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188755 ?auto_188756 )
      ( MAKE-12PILE ?auto_188755 ?auto_188756 ?auto_188757 ?auto_188758 ?auto_188759 ?auto_188760 ?auto_188761 ?auto_188762 ?auto_188763 ?auto_188764 ?auto_188765 ?auto_188766 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188780 - BLOCK
      ?auto_188781 - BLOCK
      ?auto_188782 - BLOCK
      ?auto_188783 - BLOCK
      ?auto_188784 - BLOCK
      ?auto_188785 - BLOCK
      ?auto_188786 - BLOCK
      ?auto_188787 - BLOCK
      ?auto_188788 - BLOCK
      ?auto_188789 - BLOCK
      ?auto_188790 - BLOCK
      ?auto_188791 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188791 ) ( ON-TABLE ?auto_188780 ) ( not ( = ?auto_188780 ?auto_188781 ) ) ( not ( = ?auto_188780 ?auto_188782 ) ) ( not ( = ?auto_188780 ?auto_188783 ) ) ( not ( = ?auto_188780 ?auto_188784 ) ) ( not ( = ?auto_188780 ?auto_188785 ) ) ( not ( = ?auto_188780 ?auto_188786 ) ) ( not ( = ?auto_188780 ?auto_188787 ) ) ( not ( = ?auto_188780 ?auto_188788 ) ) ( not ( = ?auto_188780 ?auto_188789 ) ) ( not ( = ?auto_188780 ?auto_188790 ) ) ( not ( = ?auto_188780 ?auto_188791 ) ) ( not ( = ?auto_188781 ?auto_188782 ) ) ( not ( = ?auto_188781 ?auto_188783 ) ) ( not ( = ?auto_188781 ?auto_188784 ) ) ( not ( = ?auto_188781 ?auto_188785 ) ) ( not ( = ?auto_188781 ?auto_188786 ) ) ( not ( = ?auto_188781 ?auto_188787 ) ) ( not ( = ?auto_188781 ?auto_188788 ) ) ( not ( = ?auto_188781 ?auto_188789 ) ) ( not ( = ?auto_188781 ?auto_188790 ) ) ( not ( = ?auto_188781 ?auto_188791 ) ) ( not ( = ?auto_188782 ?auto_188783 ) ) ( not ( = ?auto_188782 ?auto_188784 ) ) ( not ( = ?auto_188782 ?auto_188785 ) ) ( not ( = ?auto_188782 ?auto_188786 ) ) ( not ( = ?auto_188782 ?auto_188787 ) ) ( not ( = ?auto_188782 ?auto_188788 ) ) ( not ( = ?auto_188782 ?auto_188789 ) ) ( not ( = ?auto_188782 ?auto_188790 ) ) ( not ( = ?auto_188782 ?auto_188791 ) ) ( not ( = ?auto_188783 ?auto_188784 ) ) ( not ( = ?auto_188783 ?auto_188785 ) ) ( not ( = ?auto_188783 ?auto_188786 ) ) ( not ( = ?auto_188783 ?auto_188787 ) ) ( not ( = ?auto_188783 ?auto_188788 ) ) ( not ( = ?auto_188783 ?auto_188789 ) ) ( not ( = ?auto_188783 ?auto_188790 ) ) ( not ( = ?auto_188783 ?auto_188791 ) ) ( not ( = ?auto_188784 ?auto_188785 ) ) ( not ( = ?auto_188784 ?auto_188786 ) ) ( not ( = ?auto_188784 ?auto_188787 ) ) ( not ( = ?auto_188784 ?auto_188788 ) ) ( not ( = ?auto_188784 ?auto_188789 ) ) ( not ( = ?auto_188784 ?auto_188790 ) ) ( not ( = ?auto_188784 ?auto_188791 ) ) ( not ( = ?auto_188785 ?auto_188786 ) ) ( not ( = ?auto_188785 ?auto_188787 ) ) ( not ( = ?auto_188785 ?auto_188788 ) ) ( not ( = ?auto_188785 ?auto_188789 ) ) ( not ( = ?auto_188785 ?auto_188790 ) ) ( not ( = ?auto_188785 ?auto_188791 ) ) ( not ( = ?auto_188786 ?auto_188787 ) ) ( not ( = ?auto_188786 ?auto_188788 ) ) ( not ( = ?auto_188786 ?auto_188789 ) ) ( not ( = ?auto_188786 ?auto_188790 ) ) ( not ( = ?auto_188786 ?auto_188791 ) ) ( not ( = ?auto_188787 ?auto_188788 ) ) ( not ( = ?auto_188787 ?auto_188789 ) ) ( not ( = ?auto_188787 ?auto_188790 ) ) ( not ( = ?auto_188787 ?auto_188791 ) ) ( not ( = ?auto_188788 ?auto_188789 ) ) ( not ( = ?auto_188788 ?auto_188790 ) ) ( not ( = ?auto_188788 ?auto_188791 ) ) ( not ( = ?auto_188789 ?auto_188790 ) ) ( not ( = ?auto_188789 ?auto_188791 ) ) ( not ( = ?auto_188790 ?auto_188791 ) ) ( ON ?auto_188790 ?auto_188791 ) ( ON ?auto_188789 ?auto_188790 ) ( ON ?auto_188788 ?auto_188789 ) ( ON ?auto_188787 ?auto_188788 ) ( ON ?auto_188786 ?auto_188787 ) ( ON ?auto_188785 ?auto_188786 ) ( ON ?auto_188784 ?auto_188785 ) ( ON ?auto_188783 ?auto_188784 ) ( ON ?auto_188782 ?auto_188783 ) ( CLEAR ?auto_188780 ) ( ON ?auto_188781 ?auto_188782 ) ( CLEAR ?auto_188781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188780 ?auto_188781 )
      ( MAKE-12PILE ?auto_188780 ?auto_188781 ?auto_188782 ?auto_188783 ?auto_188784 ?auto_188785 ?auto_188786 ?auto_188787 ?auto_188788 ?auto_188789 ?auto_188790 ?auto_188791 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188804 - BLOCK
      ?auto_188805 - BLOCK
      ?auto_188806 - BLOCK
      ?auto_188807 - BLOCK
      ?auto_188808 - BLOCK
      ?auto_188809 - BLOCK
      ?auto_188810 - BLOCK
      ?auto_188811 - BLOCK
      ?auto_188812 - BLOCK
      ?auto_188813 - BLOCK
      ?auto_188814 - BLOCK
      ?auto_188815 - BLOCK
    )
    :vars
    (
      ?auto_188816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188815 ?auto_188816 ) ( not ( = ?auto_188804 ?auto_188805 ) ) ( not ( = ?auto_188804 ?auto_188806 ) ) ( not ( = ?auto_188804 ?auto_188807 ) ) ( not ( = ?auto_188804 ?auto_188808 ) ) ( not ( = ?auto_188804 ?auto_188809 ) ) ( not ( = ?auto_188804 ?auto_188810 ) ) ( not ( = ?auto_188804 ?auto_188811 ) ) ( not ( = ?auto_188804 ?auto_188812 ) ) ( not ( = ?auto_188804 ?auto_188813 ) ) ( not ( = ?auto_188804 ?auto_188814 ) ) ( not ( = ?auto_188804 ?auto_188815 ) ) ( not ( = ?auto_188804 ?auto_188816 ) ) ( not ( = ?auto_188805 ?auto_188806 ) ) ( not ( = ?auto_188805 ?auto_188807 ) ) ( not ( = ?auto_188805 ?auto_188808 ) ) ( not ( = ?auto_188805 ?auto_188809 ) ) ( not ( = ?auto_188805 ?auto_188810 ) ) ( not ( = ?auto_188805 ?auto_188811 ) ) ( not ( = ?auto_188805 ?auto_188812 ) ) ( not ( = ?auto_188805 ?auto_188813 ) ) ( not ( = ?auto_188805 ?auto_188814 ) ) ( not ( = ?auto_188805 ?auto_188815 ) ) ( not ( = ?auto_188805 ?auto_188816 ) ) ( not ( = ?auto_188806 ?auto_188807 ) ) ( not ( = ?auto_188806 ?auto_188808 ) ) ( not ( = ?auto_188806 ?auto_188809 ) ) ( not ( = ?auto_188806 ?auto_188810 ) ) ( not ( = ?auto_188806 ?auto_188811 ) ) ( not ( = ?auto_188806 ?auto_188812 ) ) ( not ( = ?auto_188806 ?auto_188813 ) ) ( not ( = ?auto_188806 ?auto_188814 ) ) ( not ( = ?auto_188806 ?auto_188815 ) ) ( not ( = ?auto_188806 ?auto_188816 ) ) ( not ( = ?auto_188807 ?auto_188808 ) ) ( not ( = ?auto_188807 ?auto_188809 ) ) ( not ( = ?auto_188807 ?auto_188810 ) ) ( not ( = ?auto_188807 ?auto_188811 ) ) ( not ( = ?auto_188807 ?auto_188812 ) ) ( not ( = ?auto_188807 ?auto_188813 ) ) ( not ( = ?auto_188807 ?auto_188814 ) ) ( not ( = ?auto_188807 ?auto_188815 ) ) ( not ( = ?auto_188807 ?auto_188816 ) ) ( not ( = ?auto_188808 ?auto_188809 ) ) ( not ( = ?auto_188808 ?auto_188810 ) ) ( not ( = ?auto_188808 ?auto_188811 ) ) ( not ( = ?auto_188808 ?auto_188812 ) ) ( not ( = ?auto_188808 ?auto_188813 ) ) ( not ( = ?auto_188808 ?auto_188814 ) ) ( not ( = ?auto_188808 ?auto_188815 ) ) ( not ( = ?auto_188808 ?auto_188816 ) ) ( not ( = ?auto_188809 ?auto_188810 ) ) ( not ( = ?auto_188809 ?auto_188811 ) ) ( not ( = ?auto_188809 ?auto_188812 ) ) ( not ( = ?auto_188809 ?auto_188813 ) ) ( not ( = ?auto_188809 ?auto_188814 ) ) ( not ( = ?auto_188809 ?auto_188815 ) ) ( not ( = ?auto_188809 ?auto_188816 ) ) ( not ( = ?auto_188810 ?auto_188811 ) ) ( not ( = ?auto_188810 ?auto_188812 ) ) ( not ( = ?auto_188810 ?auto_188813 ) ) ( not ( = ?auto_188810 ?auto_188814 ) ) ( not ( = ?auto_188810 ?auto_188815 ) ) ( not ( = ?auto_188810 ?auto_188816 ) ) ( not ( = ?auto_188811 ?auto_188812 ) ) ( not ( = ?auto_188811 ?auto_188813 ) ) ( not ( = ?auto_188811 ?auto_188814 ) ) ( not ( = ?auto_188811 ?auto_188815 ) ) ( not ( = ?auto_188811 ?auto_188816 ) ) ( not ( = ?auto_188812 ?auto_188813 ) ) ( not ( = ?auto_188812 ?auto_188814 ) ) ( not ( = ?auto_188812 ?auto_188815 ) ) ( not ( = ?auto_188812 ?auto_188816 ) ) ( not ( = ?auto_188813 ?auto_188814 ) ) ( not ( = ?auto_188813 ?auto_188815 ) ) ( not ( = ?auto_188813 ?auto_188816 ) ) ( not ( = ?auto_188814 ?auto_188815 ) ) ( not ( = ?auto_188814 ?auto_188816 ) ) ( not ( = ?auto_188815 ?auto_188816 ) ) ( ON ?auto_188814 ?auto_188815 ) ( ON ?auto_188813 ?auto_188814 ) ( ON ?auto_188812 ?auto_188813 ) ( ON ?auto_188811 ?auto_188812 ) ( ON ?auto_188810 ?auto_188811 ) ( ON ?auto_188809 ?auto_188810 ) ( ON ?auto_188808 ?auto_188809 ) ( ON ?auto_188807 ?auto_188808 ) ( ON ?auto_188806 ?auto_188807 ) ( ON ?auto_188805 ?auto_188806 ) ( ON ?auto_188804 ?auto_188805 ) ( CLEAR ?auto_188804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188804 )
      ( MAKE-12PILE ?auto_188804 ?auto_188805 ?auto_188806 ?auto_188807 ?auto_188808 ?auto_188809 ?auto_188810 ?auto_188811 ?auto_188812 ?auto_188813 ?auto_188814 ?auto_188815 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188829 - BLOCK
      ?auto_188830 - BLOCK
      ?auto_188831 - BLOCK
      ?auto_188832 - BLOCK
      ?auto_188833 - BLOCK
      ?auto_188834 - BLOCK
      ?auto_188835 - BLOCK
      ?auto_188836 - BLOCK
      ?auto_188837 - BLOCK
      ?auto_188838 - BLOCK
      ?auto_188839 - BLOCK
      ?auto_188840 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188840 ) ( not ( = ?auto_188829 ?auto_188830 ) ) ( not ( = ?auto_188829 ?auto_188831 ) ) ( not ( = ?auto_188829 ?auto_188832 ) ) ( not ( = ?auto_188829 ?auto_188833 ) ) ( not ( = ?auto_188829 ?auto_188834 ) ) ( not ( = ?auto_188829 ?auto_188835 ) ) ( not ( = ?auto_188829 ?auto_188836 ) ) ( not ( = ?auto_188829 ?auto_188837 ) ) ( not ( = ?auto_188829 ?auto_188838 ) ) ( not ( = ?auto_188829 ?auto_188839 ) ) ( not ( = ?auto_188829 ?auto_188840 ) ) ( not ( = ?auto_188830 ?auto_188831 ) ) ( not ( = ?auto_188830 ?auto_188832 ) ) ( not ( = ?auto_188830 ?auto_188833 ) ) ( not ( = ?auto_188830 ?auto_188834 ) ) ( not ( = ?auto_188830 ?auto_188835 ) ) ( not ( = ?auto_188830 ?auto_188836 ) ) ( not ( = ?auto_188830 ?auto_188837 ) ) ( not ( = ?auto_188830 ?auto_188838 ) ) ( not ( = ?auto_188830 ?auto_188839 ) ) ( not ( = ?auto_188830 ?auto_188840 ) ) ( not ( = ?auto_188831 ?auto_188832 ) ) ( not ( = ?auto_188831 ?auto_188833 ) ) ( not ( = ?auto_188831 ?auto_188834 ) ) ( not ( = ?auto_188831 ?auto_188835 ) ) ( not ( = ?auto_188831 ?auto_188836 ) ) ( not ( = ?auto_188831 ?auto_188837 ) ) ( not ( = ?auto_188831 ?auto_188838 ) ) ( not ( = ?auto_188831 ?auto_188839 ) ) ( not ( = ?auto_188831 ?auto_188840 ) ) ( not ( = ?auto_188832 ?auto_188833 ) ) ( not ( = ?auto_188832 ?auto_188834 ) ) ( not ( = ?auto_188832 ?auto_188835 ) ) ( not ( = ?auto_188832 ?auto_188836 ) ) ( not ( = ?auto_188832 ?auto_188837 ) ) ( not ( = ?auto_188832 ?auto_188838 ) ) ( not ( = ?auto_188832 ?auto_188839 ) ) ( not ( = ?auto_188832 ?auto_188840 ) ) ( not ( = ?auto_188833 ?auto_188834 ) ) ( not ( = ?auto_188833 ?auto_188835 ) ) ( not ( = ?auto_188833 ?auto_188836 ) ) ( not ( = ?auto_188833 ?auto_188837 ) ) ( not ( = ?auto_188833 ?auto_188838 ) ) ( not ( = ?auto_188833 ?auto_188839 ) ) ( not ( = ?auto_188833 ?auto_188840 ) ) ( not ( = ?auto_188834 ?auto_188835 ) ) ( not ( = ?auto_188834 ?auto_188836 ) ) ( not ( = ?auto_188834 ?auto_188837 ) ) ( not ( = ?auto_188834 ?auto_188838 ) ) ( not ( = ?auto_188834 ?auto_188839 ) ) ( not ( = ?auto_188834 ?auto_188840 ) ) ( not ( = ?auto_188835 ?auto_188836 ) ) ( not ( = ?auto_188835 ?auto_188837 ) ) ( not ( = ?auto_188835 ?auto_188838 ) ) ( not ( = ?auto_188835 ?auto_188839 ) ) ( not ( = ?auto_188835 ?auto_188840 ) ) ( not ( = ?auto_188836 ?auto_188837 ) ) ( not ( = ?auto_188836 ?auto_188838 ) ) ( not ( = ?auto_188836 ?auto_188839 ) ) ( not ( = ?auto_188836 ?auto_188840 ) ) ( not ( = ?auto_188837 ?auto_188838 ) ) ( not ( = ?auto_188837 ?auto_188839 ) ) ( not ( = ?auto_188837 ?auto_188840 ) ) ( not ( = ?auto_188838 ?auto_188839 ) ) ( not ( = ?auto_188838 ?auto_188840 ) ) ( not ( = ?auto_188839 ?auto_188840 ) ) ( ON ?auto_188839 ?auto_188840 ) ( ON ?auto_188838 ?auto_188839 ) ( ON ?auto_188837 ?auto_188838 ) ( ON ?auto_188836 ?auto_188837 ) ( ON ?auto_188835 ?auto_188836 ) ( ON ?auto_188834 ?auto_188835 ) ( ON ?auto_188833 ?auto_188834 ) ( ON ?auto_188832 ?auto_188833 ) ( ON ?auto_188831 ?auto_188832 ) ( ON ?auto_188830 ?auto_188831 ) ( ON ?auto_188829 ?auto_188830 ) ( CLEAR ?auto_188829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188829 )
      ( MAKE-12PILE ?auto_188829 ?auto_188830 ?auto_188831 ?auto_188832 ?auto_188833 ?auto_188834 ?auto_188835 ?auto_188836 ?auto_188837 ?auto_188838 ?auto_188839 ?auto_188840 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188853 - BLOCK
      ?auto_188854 - BLOCK
      ?auto_188855 - BLOCK
      ?auto_188856 - BLOCK
      ?auto_188857 - BLOCK
      ?auto_188858 - BLOCK
      ?auto_188859 - BLOCK
      ?auto_188860 - BLOCK
      ?auto_188861 - BLOCK
      ?auto_188862 - BLOCK
      ?auto_188863 - BLOCK
      ?auto_188864 - BLOCK
    )
    :vars
    (
      ?auto_188865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188853 ?auto_188854 ) ) ( not ( = ?auto_188853 ?auto_188855 ) ) ( not ( = ?auto_188853 ?auto_188856 ) ) ( not ( = ?auto_188853 ?auto_188857 ) ) ( not ( = ?auto_188853 ?auto_188858 ) ) ( not ( = ?auto_188853 ?auto_188859 ) ) ( not ( = ?auto_188853 ?auto_188860 ) ) ( not ( = ?auto_188853 ?auto_188861 ) ) ( not ( = ?auto_188853 ?auto_188862 ) ) ( not ( = ?auto_188853 ?auto_188863 ) ) ( not ( = ?auto_188853 ?auto_188864 ) ) ( not ( = ?auto_188854 ?auto_188855 ) ) ( not ( = ?auto_188854 ?auto_188856 ) ) ( not ( = ?auto_188854 ?auto_188857 ) ) ( not ( = ?auto_188854 ?auto_188858 ) ) ( not ( = ?auto_188854 ?auto_188859 ) ) ( not ( = ?auto_188854 ?auto_188860 ) ) ( not ( = ?auto_188854 ?auto_188861 ) ) ( not ( = ?auto_188854 ?auto_188862 ) ) ( not ( = ?auto_188854 ?auto_188863 ) ) ( not ( = ?auto_188854 ?auto_188864 ) ) ( not ( = ?auto_188855 ?auto_188856 ) ) ( not ( = ?auto_188855 ?auto_188857 ) ) ( not ( = ?auto_188855 ?auto_188858 ) ) ( not ( = ?auto_188855 ?auto_188859 ) ) ( not ( = ?auto_188855 ?auto_188860 ) ) ( not ( = ?auto_188855 ?auto_188861 ) ) ( not ( = ?auto_188855 ?auto_188862 ) ) ( not ( = ?auto_188855 ?auto_188863 ) ) ( not ( = ?auto_188855 ?auto_188864 ) ) ( not ( = ?auto_188856 ?auto_188857 ) ) ( not ( = ?auto_188856 ?auto_188858 ) ) ( not ( = ?auto_188856 ?auto_188859 ) ) ( not ( = ?auto_188856 ?auto_188860 ) ) ( not ( = ?auto_188856 ?auto_188861 ) ) ( not ( = ?auto_188856 ?auto_188862 ) ) ( not ( = ?auto_188856 ?auto_188863 ) ) ( not ( = ?auto_188856 ?auto_188864 ) ) ( not ( = ?auto_188857 ?auto_188858 ) ) ( not ( = ?auto_188857 ?auto_188859 ) ) ( not ( = ?auto_188857 ?auto_188860 ) ) ( not ( = ?auto_188857 ?auto_188861 ) ) ( not ( = ?auto_188857 ?auto_188862 ) ) ( not ( = ?auto_188857 ?auto_188863 ) ) ( not ( = ?auto_188857 ?auto_188864 ) ) ( not ( = ?auto_188858 ?auto_188859 ) ) ( not ( = ?auto_188858 ?auto_188860 ) ) ( not ( = ?auto_188858 ?auto_188861 ) ) ( not ( = ?auto_188858 ?auto_188862 ) ) ( not ( = ?auto_188858 ?auto_188863 ) ) ( not ( = ?auto_188858 ?auto_188864 ) ) ( not ( = ?auto_188859 ?auto_188860 ) ) ( not ( = ?auto_188859 ?auto_188861 ) ) ( not ( = ?auto_188859 ?auto_188862 ) ) ( not ( = ?auto_188859 ?auto_188863 ) ) ( not ( = ?auto_188859 ?auto_188864 ) ) ( not ( = ?auto_188860 ?auto_188861 ) ) ( not ( = ?auto_188860 ?auto_188862 ) ) ( not ( = ?auto_188860 ?auto_188863 ) ) ( not ( = ?auto_188860 ?auto_188864 ) ) ( not ( = ?auto_188861 ?auto_188862 ) ) ( not ( = ?auto_188861 ?auto_188863 ) ) ( not ( = ?auto_188861 ?auto_188864 ) ) ( not ( = ?auto_188862 ?auto_188863 ) ) ( not ( = ?auto_188862 ?auto_188864 ) ) ( not ( = ?auto_188863 ?auto_188864 ) ) ( ON ?auto_188853 ?auto_188865 ) ( not ( = ?auto_188864 ?auto_188865 ) ) ( not ( = ?auto_188863 ?auto_188865 ) ) ( not ( = ?auto_188862 ?auto_188865 ) ) ( not ( = ?auto_188861 ?auto_188865 ) ) ( not ( = ?auto_188860 ?auto_188865 ) ) ( not ( = ?auto_188859 ?auto_188865 ) ) ( not ( = ?auto_188858 ?auto_188865 ) ) ( not ( = ?auto_188857 ?auto_188865 ) ) ( not ( = ?auto_188856 ?auto_188865 ) ) ( not ( = ?auto_188855 ?auto_188865 ) ) ( not ( = ?auto_188854 ?auto_188865 ) ) ( not ( = ?auto_188853 ?auto_188865 ) ) ( ON ?auto_188854 ?auto_188853 ) ( ON ?auto_188855 ?auto_188854 ) ( ON ?auto_188856 ?auto_188855 ) ( ON ?auto_188857 ?auto_188856 ) ( ON ?auto_188858 ?auto_188857 ) ( ON ?auto_188859 ?auto_188858 ) ( ON ?auto_188860 ?auto_188859 ) ( ON ?auto_188861 ?auto_188860 ) ( ON ?auto_188862 ?auto_188861 ) ( ON ?auto_188863 ?auto_188862 ) ( ON ?auto_188864 ?auto_188863 ) ( CLEAR ?auto_188864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_188864 ?auto_188863 ?auto_188862 ?auto_188861 ?auto_188860 ?auto_188859 ?auto_188858 ?auto_188857 ?auto_188856 ?auto_188855 ?auto_188854 ?auto_188853 )
      ( MAKE-12PILE ?auto_188853 ?auto_188854 ?auto_188855 ?auto_188856 ?auto_188857 ?auto_188858 ?auto_188859 ?auto_188860 ?auto_188861 ?auto_188862 ?auto_188863 ?auto_188864 ) )
  )

)

