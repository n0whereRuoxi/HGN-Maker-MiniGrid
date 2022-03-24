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
      ?auto_45133 - BLOCK
    )
    :vars
    (
      ?auto_45134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45133 ?auto_45134 ) ( CLEAR ?auto_45133 ) ( HAND-EMPTY ) ( not ( = ?auto_45133 ?auto_45134 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45133 ?auto_45134 )
      ( !PUTDOWN ?auto_45133 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45136 - BLOCK
    )
    :vars
    (
      ?auto_45137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45136 ?auto_45137 ) ( CLEAR ?auto_45136 ) ( HAND-EMPTY ) ( not ( = ?auto_45136 ?auto_45137 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45136 ?auto_45137 )
      ( !PUTDOWN ?auto_45136 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45140 - BLOCK
      ?auto_45141 - BLOCK
    )
    :vars
    (
      ?auto_45142 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_45140 ) ( ON ?auto_45141 ?auto_45142 ) ( CLEAR ?auto_45141 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45140 ) ( not ( = ?auto_45140 ?auto_45141 ) ) ( not ( = ?auto_45140 ?auto_45142 ) ) ( not ( = ?auto_45141 ?auto_45142 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45141 ?auto_45142 )
      ( !STACK ?auto_45141 ?auto_45140 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45145 - BLOCK
      ?auto_45146 - BLOCK
    )
    :vars
    (
      ?auto_45147 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_45145 ) ( ON ?auto_45146 ?auto_45147 ) ( CLEAR ?auto_45146 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45145 ) ( not ( = ?auto_45145 ?auto_45146 ) ) ( not ( = ?auto_45145 ?auto_45147 ) ) ( not ( = ?auto_45146 ?auto_45147 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45146 ?auto_45147 )
      ( !STACK ?auto_45146 ?auto_45145 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45150 - BLOCK
      ?auto_45151 - BLOCK
    )
    :vars
    (
      ?auto_45152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45151 ?auto_45152 ) ( not ( = ?auto_45150 ?auto_45151 ) ) ( not ( = ?auto_45150 ?auto_45152 ) ) ( not ( = ?auto_45151 ?auto_45152 ) ) ( ON ?auto_45150 ?auto_45151 ) ( CLEAR ?auto_45150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45150 )
      ( MAKE-2PILE ?auto_45150 ?auto_45151 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45155 - BLOCK
      ?auto_45156 - BLOCK
    )
    :vars
    (
      ?auto_45157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45156 ?auto_45157 ) ( not ( = ?auto_45155 ?auto_45156 ) ) ( not ( = ?auto_45155 ?auto_45157 ) ) ( not ( = ?auto_45156 ?auto_45157 ) ) ( ON ?auto_45155 ?auto_45156 ) ( CLEAR ?auto_45155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45155 )
      ( MAKE-2PILE ?auto_45155 ?auto_45156 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45161 - BLOCK
      ?auto_45162 - BLOCK
      ?auto_45163 - BLOCK
    )
    :vars
    (
      ?auto_45164 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_45162 ) ( ON ?auto_45163 ?auto_45164 ) ( CLEAR ?auto_45163 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45161 ) ( ON ?auto_45162 ?auto_45161 ) ( not ( = ?auto_45161 ?auto_45162 ) ) ( not ( = ?auto_45161 ?auto_45163 ) ) ( not ( = ?auto_45161 ?auto_45164 ) ) ( not ( = ?auto_45162 ?auto_45163 ) ) ( not ( = ?auto_45162 ?auto_45164 ) ) ( not ( = ?auto_45163 ?auto_45164 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45163 ?auto_45164 )
      ( !STACK ?auto_45163 ?auto_45162 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45168 - BLOCK
      ?auto_45169 - BLOCK
      ?auto_45170 - BLOCK
    )
    :vars
    (
      ?auto_45171 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_45169 ) ( ON ?auto_45170 ?auto_45171 ) ( CLEAR ?auto_45170 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45168 ) ( ON ?auto_45169 ?auto_45168 ) ( not ( = ?auto_45168 ?auto_45169 ) ) ( not ( = ?auto_45168 ?auto_45170 ) ) ( not ( = ?auto_45168 ?auto_45171 ) ) ( not ( = ?auto_45169 ?auto_45170 ) ) ( not ( = ?auto_45169 ?auto_45171 ) ) ( not ( = ?auto_45170 ?auto_45171 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45170 ?auto_45171 )
      ( !STACK ?auto_45170 ?auto_45169 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45175 - BLOCK
      ?auto_45176 - BLOCK
      ?auto_45177 - BLOCK
    )
    :vars
    (
      ?auto_45178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45177 ?auto_45178 ) ( ON-TABLE ?auto_45175 ) ( not ( = ?auto_45175 ?auto_45176 ) ) ( not ( = ?auto_45175 ?auto_45177 ) ) ( not ( = ?auto_45175 ?auto_45178 ) ) ( not ( = ?auto_45176 ?auto_45177 ) ) ( not ( = ?auto_45176 ?auto_45178 ) ) ( not ( = ?auto_45177 ?auto_45178 ) ) ( CLEAR ?auto_45175 ) ( ON ?auto_45176 ?auto_45177 ) ( CLEAR ?auto_45176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45175 ?auto_45176 )
      ( MAKE-3PILE ?auto_45175 ?auto_45176 ?auto_45177 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45182 - BLOCK
      ?auto_45183 - BLOCK
      ?auto_45184 - BLOCK
    )
    :vars
    (
      ?auto_45185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45184 ?auto_45185 ) ( ON-TABLE ?auto_45182 ) ( not ( = ?auto_45182 ?auto_45183 ) ) ( not ( = ?auto_45182 ?auto_45184 ) ) ( not ( = ?auto_45182 ?auto_45185 ) ) ( not ( = ?auto_45183 ?auto_45184 ) ) ( not ( = ?auto_45183 ?auto_45185 ) ) ( not ( = ?auto_45184 ?auto_45185 ) ) ( CLEAR ?auto_45182 ) ( ON ?auto_45183 ?auto_45184 ) ( CLEAR ?auto_45183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45182 ?auto_45183 )
      ( MAKE-3PILE ?auto_45182 ?auto_45183 ?auto_45184 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45189 - BLOCK
      ?auto_45190 - BLOCK
      ?auto_45191 - BLOCK
    )
    :vars
    (
      ?auto_45192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45191 ?auto_45192 ) ( not ( = ?auto_45189 ?auto_45190 ) ) ( not ( = ?auto_45189 ?auto_45191 ) ) ( not ( = ?auto_45189 ?auto_45192 ) ) ( not ( = ?auto_45190 ?auto_45191 ) ) ( not ( = ?auto_45190 ?auto_45192 ) ) ( not ( = ?auto_45191 ?auto_45192 ) ) ( ON ?auto_45190 ?auto_45191 ) ( ON ?auto_45189 ?auto_45190 ) ( CLEAR ?auto_45189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45189 )
      ( MAKE-3PILE ?auto_45189 ?auto_45190 ?auto_45191 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45196 - BLOCK
      ?auto_45197 - BLOCK
      ?auto_45198 - BLOCK
    )
    :vars
    (
      ?auto_45199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45198 ?auto_45199 ) ( not ( = ?auto_45196 ?auto_45197 ) ) ( not ( = ?auto_45196 ?auto_45198 ) ) ( not ( = ?auto_45196 ?auto_45199 ) ) ( not ( = ?auto_45197 ?auto_45198 ) ) ( not ( = ?auto_45197 ?auto_45199 ) ) ( not ( = ?auto_45198 ?auto_45199 ) ) ( ON ?auto_45197 ?auto_45198 ) ( ON ?auto_45196 ?auto_45197 ) ( CLEAR ?auto_45196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45196 )
      ( MAKE-3PILE ?auto_45196 ?auto_45197 ?auto_45198 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45204 - BLOCK
      ?auto_45205 - BLOCK
      ?auto_45206 - BLOCK
      ?auto_45207 - BLOCK
    )
    :vars
    (
      ?auto_45208 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_45206 ) ( ON ?auto_45207 ?auto_45208 ) ( CLEAR ?auto_45207 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45204 ) ( ON ?auto_45205 ?auto_45204 ) ( ON ?auto_45206 ?auto_45205 ) ( not ( = ?auto_45204 ?auto_45205 ) ) ( not ( = ?auto_45204 ?auto_45206 ) ) ( not ( = ?auto_45204 ?auto_45207 ) ) ( not ( = ?auto_45204 ?auto_45208 ) ) ( not ( = ?auto_45205 ?auto_45206 ) ) ( not ( = ?auto_45205 ?auto_45207 ) ) ( not ( = ?auto_45205 ?auto_45208 ) ) ( not ( = ?auto_45206 ?auto_45207 ) ) ( not ( = ?auto_45206 ?auto_45208 ) ) ( not ( = ?auto_45207 ?auto_45208 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45207 ?auto_45208 )
      ( !STACK ?auto_45207 ?auto_45206 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45213 - BLOCK
      ?auto_45214 - BLOCK
      ?auto_45215 - BLOCK
      ?auto_45216 - BLOCK
    )
    :vars
    (
      ?auto_45217 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_45215 ) ( ON ?auto_45216 ?auto_45217 ) ( CLEAR ?auto_45216 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45213 ) ( ON ?auto_45214 ?auto_45213 ) ( ON ?auto_45215 ?auto_45214 ) ( not ( = ?auto_45213 ?auto_45214 ) ) ( not ( = ?auto_45213 ?auto_45215 ) ) ( not ( = ?auto_45213 ?auto_45216 ) ) ( not ( = ?auto_45213 ?auto_45217 ) ) ( not ( = ?auto_45214 ?auto_45215 ) ) ( not ( = ?auto_45214 ?auto_45216 ) ) ( not ( = ?auto_45214 ?auto_45217 ) ) ( not ( = ?auto_45215 ?auto_45216 ) ) ( not ( = ?auto_45215 ?auto_45217 ) ) ( not ( = ?auto_45216 ?auto_45217 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45216 ?auto_45217 )
      ( !STACK ?auto_45216 ?auto_45215 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45222 - BLOCK
      ?auto_45223 - BLOCK
      ?auto_45224 - BLOCK
      ?auto_45225 - BLOCK
    )
    :vars
    (
      ?auto_45226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45225 ?auto_45226 ) ( ON-TABLE ?auto_45222 ) ( ON ?auto_45223 ?auto_45222 ) ( not ( = ?auto_45222 ?auto_45223 ) ) ( not ( = ?auto_45222 ?auto_45224 ) ) ( not ( = ?auto_45222 ?auto_45225 ) ) ( not ( = ?auto_45222 ?auto_45226 ) ) ( not ( = ?auto_45223 ?auto_45224 ) ) ( not ( = ?auto_45223 ?auto_45225 ) ) ( not ( = ?auto_45223 ?auto_45226 ) ) ( not ( = ?auto_45224 ?auto_45225 ) ) ( not ( = ?auto_45224 ?auto_45226 ) ) ( not ( = ?auto_45225 ?auto_45226 ) ) ( CLEAR ?auto_45223 ) ( ON ?auto_45224 ?auto_45225 ) ( CLEAR ?auto_45224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45222 ?auto_45223 ?auto_45224 )
      ( MAKE-4PILE ?auto_45222 ?auto_45223 ?auto_45224 ?auto_45225 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45231 - BLOCK
      ?auto_45232 - BLOCK
      ?auto_45233 - BLOCK
      ?auto_45234 - BLOCK
    )
    :vars
    (
      ?auto_45235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45234 ?auto_45235 ) ( ON-TABLE ?auto_45231 ) ( ON ?auto_45232 ?auto_45231 ) ( not ( = ?auto_45231 ?auto_45232 ) ) ( not ( = ?auto_45231 ?auto_45233 ) ) ( not ( = ?auto_45231 ?auto_45234 ) ) ( not ( = ?auto_45231 ?auto_45235 ) ) ( not ( = ?auto_45232 ?auto_45233 ) ) ( not ( = ?auto_45232 ?auto_45234 ) ) ( not ( = ?auto_45232 ?auto_45235 ) ) ( not ( = ?auto_45233 ?auto_45234 ) ) ( not ( = ?auto_45233 ?auto_45235 ) ) ( not ( = ?auto_45234 ?auto_45235 ) ) ( CLEAR ?auto_45232 ) ( ON ?auto_45233 ?auto_45234 ) ( CLEAR ?auto_45233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45231 ?auto_45232 ?auto_45233 )
      ( MAKE-4PILE ?auto_45231 ?auto_45232 ?auto_45233 ?auto_45234 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45240 - BLOCK
      ?auto_45241 - BLOCK
      ?auto_45242 - BLOCK
      ?auto_45243 - BLOCK
    )
    :vars
    (
      ?auto_45244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45243 ?auto_45244 ) ( ON-TABLE ?auto_45240 ) ( not ( = ?auto_45240 ?auto_45241 ) ) ( not ( = ?auto_45240 ?auto_45242 ) ) ( not ( = ?auto_45240 ?auto_45243 ) ) ( not ( = ?auto_45240 ?auto_45244 ) ) ( not ( = ?auto_45241 ?auto_45242 ) ) ( not ( = ?auto_45241 ?auto_45243 ) ) ( not ( = ?auto_45241 ?auto_45244 ) ) ( not ( = ?auto_45242 ?auto_45243 ) ) ( not ( = ?auto_45242 ?auto_45244 ) ) ( not ( = ?auto_45243 ?auto_45244 ) ) ( ON ?auto_45242 ?auto_45243 ) ( CLEAR ?auto_45240 ) ( ON ?auto_45241 ?auto_45242 ) ( CLEAR ?auto_45241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45240 ?auto_45241 )
      ( MAKE-4PILE ?auto_45240 ?auto_45241 ?auto_45242 ?auto_45243 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45249 - BLOCK
      ?auto_45250 - BLOCK
      ?auto_45251 - BLOCK
      ?auto_45252 - BLOCK
    )
    :vars
    (
      ?auto_45253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45252 ?auto_45253 ) ( ON-TABLE ?auto_45249 ) ( not ( = ?auto_45249 ?auto_45250 ) ) ( not ( = ?auto_45249 ?auto_45251 ) ) ( not ( = ?auto_45249 ?auto_45252 ) ) ( not ( = ?auto_45249 ?auto_45253 ) ) ( not ( = ?auto_45250 ?auto_45251 ) ) ( not ( = ?auto_45250 ?auto_45252 ) ) ( not ( = ?auto_45250 ?auto_45253 ) ) ( not ( = ?auto_45251 ?auto_45252 ) ) ( not ( = ?auto_45251 ?auto_45253 ) ) ( not ( = ?auto_45252 ?auto_45253 ) ) ( ON ?auto_45251 ?auto_45252 ) ( CLEAR ?auto_45249 ) ( ON ?auto_45250 ?auto_45251 ) ( CLEAR ?auto_45250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45249 ?auto_45250 )
      ( MAKE-4PILE ?auto_45249 ?auto_45250 ?auto_45251 ?auto_45252 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45258 - BLOCK
      ?auto_45259 - BLOCK
      ?auto_45260 - BLOCK
      ?auto_45261 - BLOCK
    )
    :vars
    (
      ?auto_45262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45261 ?auto_45262 ) ( not ( = ?auto_45258 ?auto_45259 ) ) ( not ( = ?auto_45258 ?auto_45260 ) ) ( not ( = ?auto_45258 ?auto_45261 ) ) ( not ( = ?auto_45258 ?auto_45262 ) ) ( not ( = ?auto_45259 ?auto_45260 ) ) ( not ( = ?auto_45259 ?auto_45261 ) ) ( not ( = ?auto_45259 ?auto_45262 ) ) ( not ( = ?auto_45260 ?auto_45261 ) ) ( not ( = ?auto_45260 ?auto_45262 ) ) ( not ( = ?auto_45261 ?auto_45262 ) ) ( ON ?auto_45260 ?auto_45261 ) ( ON ?auto_45259 ?auto_45260 ) ( ON ?auto_45258 ?auto_45259 ) ( CLEAR ?auto_45258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45258 )
      ( MAKE-4PILE ?auto_45258 ?auto_45259 ?auto_45260 ?auto_45261 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45267 - BLOCK
      ?auto_45268 - BLOCK
      ?auto_45269 - BLOCK
      ?auto_45270 - BLOCK
    )
    :vars
    (
      ?auto_45271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45270 ?auto_45271 ) ( not ( = ?auto_45267 ?auto_45268 ) ) ( not ( = ?auto_45267 ?auto_45269 ) ) ( not ( = ?auto_45267 ?auto_45270 ) ) ( not ( = ?auto_45267 ?auto_45271 ) ) ( not ( = ?auto_45268 ?auto_45269 ) ) ( not ( = ?auto_45268 ?auto_45270 ) ) ( not ( = ?auto_45268 ?auto_45271 ) ) ( not ( = ?auto_45269 ?auto_45270 ) ) ( not ( = ?auto_45269 ?auto_45271 ) ) ( not ( = ?auto_45270 ?auto_45271 ) ) ( ON ?auto_45269 ?auto_45270 ) ( ON ?auto_45268 ?auto_45269 ) ( ON ?auto_45267 ?auto_45268 ) ( CLEAR ?auto_45267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45267 )
      ( MAKE-4PILE ?auto_45267 ?auto_45268 ?auto_45269 ?auto_45270 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45277 - BLOCK
      ?auto_45278 - BLOCK
      ?auto_45279 - BLOCK
      ?auto_45280 - BLOCK
      ?auto_45281 - BLOCK
    )
    :vars
    (
      ?auto_45282 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_45280 ) ( ON ?auto_45281 ?auto_45282 ) ( CLEAR ?auto_45281 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45277 ) ( ON ?auto_45278 ?auto_45277 ) ( ON ?auto_45279 ?auto_45278 ) ( ON ?auto_45280 ?auto_45279 ) ( not ( = ?auto_45277 ?auto_45278 ) ) ( not ( = ?auto_45277 ?auto_45279 ) ) ( not ( = ?auto_45277 ?auto_45280 ) ) ( not ( = ?auto_45277 ?auto_45281 ) ) ( not ( = ?auto_45277 ?auto_45282 ) ) ( not ( = ?auto_45278 ?auto_45279 ) ) ( not ( = ?auto_45278 ?auto_45280 ) ) ( not ( = ?auto_45278 ?auto_45281 ) ) ( not ( = ?auto_45278 ?auto_45282 ) ) ( not ( = ?auto_45279 ?auto_45280 ) ) ( not ( = ?auto_45279 ?auto_45281 ) ) ( not ( = ?auto_45279 ?auto_45282 ) ) ( not ( = ?auto_45280 ?auto_45281 ) ) ( not ( = ?auto_45280 ?auto_45282 ) ) ( not ( = ?auto_45281 ?auto_45282 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45281 ?auto_45282 )
      ( !STACK ?auto_45281 ?auto_45280 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45288 - BLOCK
      ?auto_45289 - BLOCK
      ?auto_45290 - BLOCK
      ?auto_45291 - BLOCK
      ?auto_45292 - BLOCK
    )
    :vars
    (
      ?auto_45293 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_45291 ) ( ON ?auto_45292 ?auto_45293 ) ( CLEAR ?auto_45292 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45288 ) ( ON ?auto_45289 ?auto_45288 ) ( ON ?auto_45290 ?auto_45289 ) ( ON ?auto_45291 ?auto_45290 ) ( not ( = ?auto_45288 ?auto_45289 ) ) ( not ( = ?auto_45288 ?auto_45290 ) ) ( not ( = ?auto_45288 ?auto_45291 ) ) ( not ( = ?auto_45288 ?auto_45292 ) ) ( not ( = ?auto_45288 ?auto_45293 ) ) ( not ( = ?auto_45289 ?auto_45290 ) ) ( not ( = ?auto_45289 ?auto_45291 ) ) ( not ( = ?auto_45289 ?auto_45292 ) ) ( not ( = ?auto_45289 ?auto_45293 ) ) ( not ( = ?auto_45290 ?auto_45291 ) ) ( not ( = ?auto_45290 ?auto_45292 ) ) ( not ( = ?auto_45290 ?auto_45293 ) ) ( not ( = ?auto_45291 ?auto_45292 ) ) ( not ( = ?auto_45291 ?auto_45293 ) ) ( not ( = ?auto_45292 ?auto_45293 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45292 ?auto_45293 )
      ( !STACK ?auto_45292 ?auto_45291 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45299 - BLOCK
      ?auto_45300 - BLOCK
      ?auto_45301 - BLOCK
      ?auto_45302 - BLOCK
      ?auto_45303 - BLOCK
    )
    :vars
    (
      ?auto_45304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45303 ?auto_45304 ) ( ON-TABLE ?auto_45299 ) ( ON ?auto_45300 ?auto_45299 ) ( ON ?auto_45301 ?auto_45300 ) ( not ( = ?auto_45299 ?auto_45300 ) ) ( not ( = ?auto_45299 ?auto_45301 ) ) ( not ( = ?auto_45299 ?auto_45302 ) ) ( not ( = ?auto_45299 ?auto_45303 ) ) ( not ( = ?auto_45299 ?auto_45304 ) ) ( not ( = ?auto_45300 ?auto_45301 ) ) ( not ( = ?auto_45300 ?auto_45302 ) ) ( not ( = ?auto_45300 ?auto_45303 ) ) ( not ( = ?auto_45300 ?auto_45304 ) ) ( not ( = ?auto_45301 ?auto_45302 ) ) ( not ( = ?auto_45301 ?auto_45303 ) ) ( not ( = ?auto_45301 ?auto_45304 ) ) ( not ( = ?auto_45302 ?auto_45303 ) ) ( not ( = ?auto_45302 ?auto_45304 ) ) ( not ( = ?auto_45303 ?auto_45304 ) ) ( CLEAR ?auto_45301 ) ( ON ?auto_45302 ?auto_45303 ) ( CLEAR ?auto_45302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45299 ?auto_45300 ?auto_45301 ?auto_45302 )
      ( MAKE-5PILE ?auto_45299 ?auto_45300 ?auto_45301 ?auto_45302 ?auto_45303 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45310 - BLOCK
      ?auto_45311 - BLOCK
      ?auto_45312 - BLOCK
      ?auto_45313 - BLOCK
      ?auto_45314 - BLOCK
    )
    :vars
    (
      ?auto_45315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45314 ?auto_45315 ) ( ON-TABLE ?auto_45310 ) ( ON ?auto_45311 ?auto_45310 ) ( ON ?auto_45312 ?auto_45311 ) ( not ( = ?auto_45310 ?auto_45311 ) ) ( not ( = ?auto_45310 ?auto_45312 ) ) ( not ( = ?auto_45310 ?auto_45313 ) ) ( not ( = ?auto_45310 ?auto_45314 ) ) ( not ( = ?auto_45310 ?auto_45315 ) ) ( not ( = ?auto_45311 ?auto_45312 ) ) ( not ( = ?auto_45311 ?auto_45313 ) ) ( not ( = ?auto_45311 ?auto_45314 ) ) ( not ( = ?auto_45311 ?auto_45315 ) ) ( not ( = ?auto_45312 ?auto_45313 ) ) ( not ( = ?auto_45312 ?auto_45314 ) ) ( not ( = ?auto_45312 ?auto_45315 ) ) ( not ( = ?auto_45313 ?auto_45314 ) ) ( not ( = ?auto_45313 ?auto_45315 ) ) ( not ( = ?auto_45314 ?auto_45315 ) ) ( CLEAR ?auto_45312 ) ( ON ?auto_45313 ?auto_45314 ) ( CLEAR ?auto_45313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45310 ?auto_45311 ?auto_45312 ?auto_45313 )
      ( MAKE-5PILE ?auto_45310 ?auto_45311 ?auto_45312 ?auto_45313 ?auto_45314 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45321 - BLOCK
      ?auto_45322 - BLOCK
      ?auto_45323 - BLOCK
      ?auto_45324 - BLOCK
      ?auto_45325 - BLOCK
    )
    :vars
    (
      ?auto_45326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45325 ?auto_45326 ) ( ON-TABLE ?auto_45321 ) ( ON ?auto_45322 ?auto_45321 ) ( not ( = ?auto_45321 ?auto_45322 ) ) ( not ( = ?auto_45321 ?auto_45323 ) ) ( not ( = ?auto_45321 ?auto_45324 ) ) ( not ( = ?auto_45321 ?auto_45325 ) ) ( not ( = ?auto_45321 ?auto_45326 ) ) ( not ( = ?auto_45322 ?auto_45323 ) ) ( not ( = ?auto_45322 ?auto_45324 ) ) ( not ( = ?auto_45322 ?auto_45325 ) ) ( not ( = ?auto_45322 ?auto_45326 ) ) ( not ( = ?auto_45323 ?auto_45324 ) ) ( not ( = ?auto_45323 ?auto_45325 ) ) ( not ( = ?auto_45323 ?auto_45326 ) ) ( not ( = ?auto_45324 ?auto_45325 ) ) ( not ( = ?auto_45324 ?auto_45326 ) ) ( not ( = ?auto_45325 ?auto_45326 ) ) ( ON ?auto_45324 ?auto_45325 ) ( CLEAR ?auto_45322 ) ( ON ?auto_45323 ?auto_45324 ) ( CLEAR ?auto_45323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45321 ?auto_45322 ?auto_45323 )
      ( MAKE-5PILE ?auto_45321 ?auto_45322 ?auto_45323 ?auto_45324 ?auto_45325 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45332 - BLOCK
      ?auto_45333 - BLOCK
      ?auto_45334 - BLOCK
      ?auto_45335 - BLOCK
      ?auto_45336 - BLOCK
    )
    :vars
    (
      ?auto_45337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45336 ?auto_45337 ) ( ON-TABLE ?auto_45332 ) ( ON ?auto_45333 ?auto_45332 ) ( not ( = ?auto_45332 ?auto_45333 ) ) ( not ( = ?auto_45332 ?auto_45334 ) ) ( not ( = ?auto_45332 ?auto_45335 ) ) ( not ( = ?auto_45332 ?auto_45336 ) ) ( not ( = ?auto_45332 ?auto_45337 ) ) ( not ( = ?auto_45333 ?auto_45334 ) ) ( not ( = ?auto_45333 ?auto_45335 ) ) ( not ( = ?auto_45333 ?auto_45336 ) ) ( not ( = ?auto_45333 ?auto_45337 ) ) ( not ( = ?auto_45334 ?auto_45335 ) ) ( not ( = ?auto_45334 ?auto_45336 ) ) ( not ( = ?auto_45334 ?auto_45337 ) ) ( not ( = ?auto_45335 ?auto_45336 ) ) ( not ( = ?auto_45335 ?auto_45337 ) ) ( not ( = ?auto_45336 ?auto_45337 ) ) ( ON ?auto_45335 ?auto_45336 ) ( CLEAR ?auto_45333 ) ( ON ?auto_45334 ?auto_45335 ) ( CLEAR ?auto_45334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45332 ?auto_45333 ?auto_45334 )
      ( MAKE-5PILE ?auto_45332 ?auto_45333 ?auto_45334 ?auto_45335 ?auto_45336 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45343 - BLOCK
      ?auto_45344 - BLOCK
      ?auto_45345 - BLOCK
      ?auto_45346 - BLOCK
      ?auto_45347 - BLOCK
    )
    :vars
    (
      ?auto_45348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45347 ?auto_45348 ) ( ON-TABLE ?auto_45343 ) ( not ( = ?auto_45343 ?auto_45344 ) ) ( not ( = ?auto_45343 ?auto_45345 ) ) ( not ( = ?auto_45343 ?auto_45346 ) ) ( not ( = ?auto_45343 ?auto_45347 ) ) ( not ( = ?auto_45343 ?auto_45348 ) ) ( not ( = ?auto_45344 ?auto_45345 ) ) ( not ( = ?auto_45344 ?auto_45346 ) ) ( not ( = ?auto_45344 ?auto_45347 ) ) ( not ( = ?auto_45344 ?auto_45348 ) ) ( not ( = ?auto_45345 ?auto_45346 ) ) ( not ( = ?auto_45345 ?auto_45347 ) ) ( not ( = ?auto_45345 ?auto_45348 ) ) ( not ( = ?auto_45346 ?auto_45347 ) ) ( not ( = ?auto_45346 ?auto_45348 ) ) ( not ( = ?auto_45347 ?auto_45348 ) ) ( ON ?auto_45346 ?auto_45347 ) ( ON ?auto_45345 ?auto_45346 ) ( CLEAR ?auto_45343 ) ( ON ?auto_45344 ?auto_45345 ) ( CLEAR ?auto_45344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45343 ?auto_45344 )
      ( MAKE-5PILE ?auto_45343 ?auto_45344 ?auto_45345 ?auto_45346 ?auto_45347 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45354 - BLOCK
      ?auto_45355 - BLOCK
      ?auto_45356 - BLOCK
      ?auto_45357 - BLOCK
      ?auto_45358 - BLOCK
    )
    :vars
    (
      ?auto_45359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45358 ?auto_45359 ) ( ON-TABLE ?auto_45354 ) ( not ( = ?auto_45354 ?auto_45355 ) ) ( not ( = ?auto_45354 ?auto_45356 ) ) ( not ( = ?auto_45354 ?auto_45357 ) ) ( not ( = ?auto_45354 ?auto_45358 ) ) ( not ( = ?auto_45354 ?auto_45359 ) ) ( not ( = ?auto_45355 ?auto_45356 ) ) ( not ( = ?auto_45355 ?auto_45357 ) ) ( not ( = ?auto_45355 ?auto_45358 ) ) ( not ( = ?auto_45355 ?auto_45359 ) ) ( not ( = ?auto_45356 ?auto_45357 ) ) ( not ( = ?auto_45356 ?auto_45358 ) ) ( not ( = ?auto_45356 ?auto_45359 ) ) ( not ( = ?auto_45357 ?auto_45358 ) ) ( not ( = ?auto_45357 ?auto_45359 ) ) ( not ( = ?auto_45358 ?auto_45359 ) ) ( ON ?auto_45357 ?auto_45358 ) ( ON ?auto_45356 ?auto_45357 ) ( CLEAR ?auto_45354 ) ( ON ?auto_45355 ?auto_45356 ) ( CLEAR ?auto_45355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45354 ?auto_45355 )
      ( MAKE-5PILE ?auto_45354 ?auto_45355 ?auto_45356 ?auto_45357 ?auto_45358 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45365 - BLOCK
      ?auto_45366 - BLOCK
      ?auto_45367 - BLOCK
      ?auto_45368 - BLOCK
      ?auto_45369 - BLOCK
    )
    :vars
    (
      ?auto_45370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45369 ?auto_45370 ) ( not ( = ?auto_45365 ?auto_45366 ) ) ( not ( = ?auto_45365 ?auto_45367 ) ) ( not ( = ?auto_45365 ?auto_45368 ) ) ( not ( = ?auto_45365 ?auto_45369 ) ) ( not ( = ?auto_45365 ?auto_45370 ) ) ( not ( = ?auto_45366 ?auto_45367 ) ) ( not ( = ?auto_45366 ?auto_45368 ) ) ( not ( = ?auto_45366 ?auto_45369 ) ) ( not ( = ?auto_45366 ?auto_45370 ) ) ( not ( = ?auto_45367 ?auto_45368 ) ) ( not ( = ?auto_45367 ?auto_45369 ) ) ( not ( = ?auto_45367 ?auto_45370 ) ) ( not ( = ?auto_45368 ?auto_45369 ) ) ( not ( = ?auto_45368 ?auto_45370 ) ) ( not ( = ?auto_45369 ?auto_45370 ) ) ( ON ?auto_45368 ?auto_45369 ) ( ON ?auto_45367 ?auto_45368 ) ( ON ?auto_45366 ?auto_45367 ) ( ON ?auto_45365 ?auto_45366 ) ( CLEAR ?auto_45365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45365 )
      ( MAKE-5PILE ?auto_45365 ?auto_45366 ?auto_45367 ?auto_45368 ?auto_45369 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45376 - BLOCK
      ?auto_45377 - BLOCK
      ?auto_45378 - BLOCK
      ?auto_45379 - BLOCK
      ?auto_45380 - BLOCK
    )
    :vars
    (
      ?auto_45381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45380 ?auto_45381 ) ( not ( = ?auto_45376 ?auto_45377 ) ) ( not ( = ?auto_45376 ?auto_45378 ) ) ( not ( = ?auto_45376 ?auto_45379 ) ) ( not ( = ?auto_45376 ?auto_45380 ) ) ( not ( = ?auto_45376 ?auto_45381 ) ) ( not ( = ?auto_45377 ?auto_45378 ) ) ( not ( = ?auto_45377 ?auto_45379 ) ) ( not ( = ?auto_45377 ?auto_45380 ) ) ( not ( = ?auto_45377 ?auto_45381 ) ) ( not ( = ?auto_45378 ?auto_45379 ) ) ( not ( = ?auto_45378 ?auto_45380 ) ) ( not ( = ?auto_45378 ?auto_45381 ) ) ( not ( = ?auto_45379 ?auto_45380 ) ) ( not ( = ?auto_45379 ?auto_45381 ) ) ( not ( = ?auto_45380 ?auto_45381 ) ) ( ON ?auto_45379 ?auto_45380 ) ( ON ?auto_45378 ?auto_45379 ) ( ON ?auto_45377 ?auto_45378 ) ( ON ?auto_45376 ?auto_45377 ) ( CLEAR ?auto_45376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45376 )
      ( MAKE-5PILE ?auto_45376 ?auto_45377 ?auto_45378 ?auto_45379 ?auto_45380 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45388 - BLOCK
      ?auto_45389 - BLOCK
      ?auto_45390 - BLOCK
      ?auto_45391 - BLOCK
      ?auto_45392 - BLOCK
      ?auto_45393 - BLOCK
    )
    :vars
    (
      ?auto_45394 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_45392 ) ( ON ?auto_45393 ?auto_45394 ) ( CLEAR ?auto_45393 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45388 ) ( ON ?auto_45389 ?auto_45388 ) ( ON ?auto_45390 ?auto_45389 ) ( ON ?auto_45391 ?auto_45390 ) ( ON ?auto_45392 ?auto_45391 ) ( not ( = ?auto_45388 ?auto_45389 ) ) ( not ( = ?auto_45388 ?auto_45390 ) ) ( not ( = ?auto_45388 ?auto_45391 ) ) ( not ( = ?auto_45388 ?auto_45392 ) ) ( not ( = ?auto_45388 ?auto_45393 ) ) ( not ( = ?auto_45388 ?auto_45394 ) ) ( not ( = ?auto_45389 ?auto_45390 ) ) ( not ( = ?auto_45389 ?auto_45391 ) ) ( not ( = ?auto_45389 ?auto_45392 ) ) ( not ( = ?auto_45389 ?auto_45393 ) ) ( not ( = ?auto_45389 ?auto_45394 ) ) ( not ( = ?auto_45390 ?auto_45391 ) ) ( not ( = ?auto_45390 ?auto_45392 ) ) ( not ( = ?auto_45390 ?auto_45393 ) ) ( not ( = ?auto_45390 ?auto_45394 ) ) ( not ( = ?auto_45391 ?auto_45392 ) ) ( not ( = ?auto_45391 ?auto_45393 ) ) ( not ( = ?auto_45391 ?auto_45394 ) ) ( not ( = ?auto_45392 ?auto_45393 ) ) ( not ( = ?auto_45392 ?auto_45394 ) ) ( not ( = ?auto_45393 ?auto_45394 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45393 ?auto_45394 )
      ( !STACK ?auto_45393 ?auto_45392 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45401 - BLOCK
      ?auto_45402 - BLOCK
      ?auto_45403 - BLOCK
      ?auto_45404 - BLOCK
      ?auto_45405 - BLOCK
      ?auto_45406 - BLOCK
    )
    :vars
    (
      ?auto_45407 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_45405 ) ( ON ?auto_45406 ?auto_45407 ) ( CLEAR ?auto_45406 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45401 ) ( ON ?auto_45402 ?auto_45401 ) ( ON ?auto_45403 ?auto_45402 ) ( ON ?auto_45404 ?auto_45403 ) ( ON ?auto_45405 ?auto_45404 ) ( not ( = ?auto_45401 ?auto_45402 ) ) ( not ( = ?auto_45401 ?auto_45403 ) ) ( not ( = ?auto_45401 ?auto_45404 ) ) ( not ( = ?auto_45401 ?auto_45405 ) ) ( not ( = ?auto_45401 ?auto_45406 ) ) ( not ( = ?auto_45401 ?auto_45407 ) ) ( not ( = ?auto_45402 ?auto_45403 ) ) ( not ( = ?auto_45402 ?auto_45404 ) ) ( not ( = ?auto_45402 ?auto_45405 ) ) ( not ( = ?auto_45402 ?auto_45406 ) ) ( not ( = ?auto_45402 ?auto_45407 ) ) ( not ( = ?auto_45403 ?auto_45404 ) ) ( not ( = ?auto_45403 ?auto_45405 ) ) ( not ( = ?auto_45403 ?auto_45406 ) ) ( not ( = ?auto_45403 ?auto_45407 ) ) ( not ( = ?auto_45404 ?auto_45405 ) ) ( not ( = ?auto_45404 ?auto_45406 ) ) ( not ( = ?auto_45404 ?auto_45407 ) ) ( not ( = ?auto_45405 ?auto_45406 ) ) ( not ( = ?auto_45405 ?auto_45407 ) ) ( not ( = ?auto_45406 ?auto_45407 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45406 ?auto_45407 )
      ( !STACK ?auto_45406 ?auto_45405 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45414 - BLOCK
      ?auto_45415 - BLOCK
      ?auto_45416 - BLOCK
      ?auto_45417 - BLOCK
      ?auto_45418 - BLOCK
      ?auto_45419 - BLOCK
    )
    :vars
    (
      ?auto_45420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45419 ?auto_45420 ) ( ON-TABLE ?auto_45414 ) ( ON ?auto_45415 ?auto_45414 ) ( ON ?auto_45416 ?auto_45415 ) ( ON ?auto_45417 ?auto_45416 ) ( not ( = ?auto_45414 ?auto_45415 ) ) ( not ( = ?auto_45414 ?auto_45416 ) ) ( not ( = ?auto_45414 ?auto_45417 ) ) ( not ( = ?auto_45414 ?auto_45418 ) ) ( not ( = ?auto_45414 ?auto_45419 ) ) ( not ( = ?auto_45414 ?auto_45420 ) ) ( not ( = ?auto_45415 ?auto_45416 ) ) ( not ( = ?auto_45415 ?auto_45417 ) ) ( not ( = ?auto_45415 ?auto_45418 ) ) ( not ( = ?auto_45415 ?auto_45419 ) ) ( not ( = ?auto_45415 ?auto_45420 ) ) ( not ( = ?auto_45416 ?auto_45417 ) ) ( not ( = ?auto_45416 ?auto_45418 ) ) ( not ( = ?auto_45416 ?auto_45419 ) ) ( not ( = ?auto_45416 ?auto_45420 ) ) ( not ( = ?auto_45417 ?auto_45418 ) ) ( not ( = ?auto_45417 ?auto_45419 ) ) ( not ( = ?auto_45417 ?auto_45420 ) ) ( not ( = ?auto_45418 ?auto_45419 ) ) ( not ( = ?auto_45418 ?auto_45420 ) ) ( not ( = ?auto_45419 ?auto_45420 ) ) ( CLEAR ?auto_45417 ) ( ON ?auto_45418 ?auto_45419 ) ( CLEAR ?auto_45418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45414 ?auto_45415 ?auto_45416 ?auto_45417 ?auto_45418 )
      ( MAKE-6PILE ?auto_45414 ?auto_45415 ?auto_45416 ?auto_45417 ?auto_45418 ?auto_45419 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45427 - BLOCK
      ?auto_45428 - BLOCK
      ?auto_45429 - BLOCK
      ?auto_45430 - BLOCK
      ?auto_45431 - BLOCK
      ?auto_45432 - BLOCK
    )
    :vars
    (
      ?auto_45433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45432 ?auto_45433 ) ( ON-TABLE ?auto_45427 ) ( ON ?auto_45428 ?auto_45427 ) ( ON ?auto_45429 ?auto_45428 ) ( ON ?auto_45430 ?auto_45429 ) ( not ( = ?auto_45427 ?auto_45428 ) ) ( not ( = ?auto_45427 ?auto_45429 ) ) ( not ( = ?auto_45427 ?auto_45430 ) ) ( not ( = ?auto_45427 ?auto_45431 ) ) ( not ( = ?auto_45427 ?auto_45432 ) ) ( not ( = ?auto_45427 ?auto_45433 ) ) ( not ( = ?auto_45428 ?auto_45429 ) ) ( not ( = ?auto_45428 ?auto_45430 ) ) ( not ( = ?auto_45428 ?auto_45431 ) ) ( not ( = ?auto_45428 ?auto_45432 ) ) ( not ( = ?auto_45428 ?auto_45433 ) ) ( not ( = ?auto_45429 ?auto_45430 ) ) ( not ( = ?auto_45429 ?auto_45431 ) ) ( not ( = ?auto_45429 ?auto_45432 ) ) ( not ( = ?auto_45429 ?auto_45433 ) ) ( not ( = ?auto_45430 ?auto_45431 ) ) ( not ( = ?auto_45430 ?auto_45432 ) ) ( not ( = ?auto_45430 ?auto_45433 ) ) ( not ( = ?auto_45431 ?auto_45432 ) ) ( not ( = ?auto_45431 ?auto_45433 ) ) ( not ( = ?auto_45432 ?auto_45433 ) ) ( CLEAR ?auto_45430 ) ( ON ?auto_45431 ?auto_45432 ) ( CLEAR ?auto_45431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45427 ?auto_45428 ?auto_45429 ?auto_45430 ?auto_45431 )
      ( MAKE-6PILE ?auto_45427 ?auto_45428 ?auto_45429 ?auto_45430 ?auto_45431 ?auto_45432 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45440 - BLOCK
      ?auto_45441 - BLOCK
      ?auto_45442 - BLOCK
      ?auto_45443 - BLOCK
      ?auto_45444 - BLOCK
      ?auto_45445 - BLOCK
    )
    :vars
    (
      ?auto_45446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45445 ?auto_45446 ) ( ON-TABLE ?auto_45440 ) ( ON ?auto_45441 ?auto_45440 ) ( ON ?auto_45442 ?auto_45441 ) ( not ( = ?auto_45440 ?auto_45441 ) ) ( not ( = ?auto_45440 ?auto_45442 ) ) ( not ( = ?auto_45440 ?auto_45443 ) ) ( not ( = ?auto_45440 ?auto_45444 ) ) ( not ( = ?auto_45440 ?auto_45445 ) ) ( not ( = ?auto_45440 ?auto_45446 ) ) ( not ( = ?auto_45441 ?auto_45442 ) ) ( not ( = ?auto_45441 ?auto_45443 ) ) ( not ( = ?auto_45441 ?auto_45444 ) ) ( not ( = ?auto_45441 ?auto_45445 ) ) ( not ( = ?auto_45441 ?auto_45446 ) ) ( not ( = ?auto_45442 ?auto_45443 ) ) ( not ( = ?auto_45442 ?auto_45444 ) ) ( not ( = ?auto_45442 ?auto_45445 ) ) ( not ( = ?auto_45442 ?auto_45446 ) ) ( not ( = ?auto_45443 ?auto_45444 ) ) ( not ( = ?auto_45443 ?auto_45445 ) ) ( not ( = ?auto_45443 ?auto_45446 ) ) ( not ( = ?auto_45444 ?auto_45445 ) ) ( not ( = ?auto_45444 ?auto_45446 ) ) ( not ( = ?auto_45445 ?auto_45446 ) ) ( ON ?auto_45444 ?auto_45445 ) ( CLEAR ?auto_45442 ) ( ON ?auto_45443 ?auto_45444 ) ( CLEAR ?auto_45443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45440 ?auto_45441 ?auto_45442 ?auto_45443 )
      ( MAKE-6PILE ?auto_45440 ?auto_45441 ?auto_45442 ?auto_45443 ?auto_45444 ?auto_45445 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45453 - BLOCK
      ?auto_45454 - BLOCK
      ?auto_45455 - BLOCK
      ?auto_45456 - BLOCK
      ?auto_45457 - BLOCK
      ?auto_45458 - BLOCK
    )
    :vars
    (
      ?auto_45459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45458 ?auto_45459 ) ( ON-TABLE ?auto_45453 ) ( ON ?auto_45454 ?auto_45453 ) ( ON ?auto_45455 ?auto_45454 ) ( not ( = ?auto_45453 ?auto_45454 ) ) ( not ( = ?auto_45453 ?auto_45455 ) ) ( not ( = ?auto_45453 ?auto_45456 ) ) ( not ( = ?auto_45453 ?auto_45457 ) ) ( not ( = ?auto_45453 ?auto_45458 ) ) ( not ( = ?auto_45453 ?auto_45459 ) ) ( not ( = ?auto_45454 ?auto_45455 ) ) ( not ( = ?auto_45454 ?auto_45456 ) ) ( not ( = ?auto_45454 ?auto_45457 ) ) ( not ( = ?auto_45454 ?auto_45458 ) ) ( not ( = ?auto_45454 ?auto_45459 ) ) ( not ( = ?auto_45455 ?auto_45456 ) ) ( not ( = ?auto_45455 ?auto_45457 ) ) ( not ( = ?auto_45455 ?auto_45458 ) ) ( not ( = ?auto_45455 ?auto_45459 ) ) ( not ( = ?auto_45456 ?auto_45457 ) ) ( not ( = ?auto_45456 ?auto_45458 ) ) ( not ( = ?auto_45456 ?auto_45459 ) ) ( not ( = ?auto_45457 ?auto_45458 ) ) ( not ( = ?auto_45457 ?auto_45459 ) ) ( not ( = ?auto_45458 ?auto_45459 ) ) ( ON ?auto_45457 ?auto_45458 ) ( CLEAR ?auto_45455 ) ( ON ?auto_45456 ?auto_45457 ) ( CLEAR ?auto_45456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45453 ?auto_45454 ?auto_45455 ?auto_45456 )
      ( MAKE-6PILE ?auto_45453 ?auto_45454 ?auto_45455 ?auto_45456 ?auto_45457 ?auto_45458 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45466 - BLOCK
      ?auto_45467 - BLOCK
      ?auto_45468 - BLOCK
      ?auto_45469 - BLOCK
      ?auto_45470 - BLOCK
      ?auto_45471 - BLOCK
    )
    :vars
    (
      ?auto_45472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45471 ?auto_45472 ) ( ON-TABLE ?auto_45466 ) ( ON ?auto_45467 ?auto_45466 ) ( not ( = ?auto_45466 ?auto_45467 ) ) ( not ( = ?auto_45466 ?auto_45468 ) ) ( not ( = ?auto_45466 ?auto_45469 ) ) ( not ( = ?auto_45466 ?auto_45470 ) ) ( not ( = ?auto_45466 ?auto_45471 ) ) ( not ( = ?auto_45466 ?auto_45472 ) ) ( not ( = ?auto_45467 ?auto_45468 ) ) ( not ( = ?auto_45467 ?auto_45469 ) ) ( not ( = ?auto_45467 ?auto_45470 ) ) ( not ( = ?auto_45467 ?auto_45471 ) ) ( not ( = ?auto_45467 ?auto_45472 ) ) ( not ( = ?auto_45468 ?auto_45469 ) ) ( not ( = ?auto_45468 ?auto_45470 ) ) ( not ( = ?auto_45468 ?auto_45471 ) ) ( not ( = ?auto_45468 ?auto_45472 ) ) ( not ( = ?auto_45469 ?auto_45470 ) ) ( not ( = ?auto_45469 ?auto_45471 ) ) ( not ( = ?auto_45469 ?auto_45472 ) ) ( not ( = ?auto_45470 ?auto_45471 ) ) ( not ( = ?auto_45470 ?auto_45472 ) ) ( not ( = ?auto_45471 ?auto_45472 ) ) ( ON ?auto_45470 ?auto_45471 ) ( ON ?auto_45469 ?auto_45470 ) ( CLEAR ?auto_45467 ) ( ON ?auto_45468 ?auto_45469 ) ( CLEAR ?auto_45468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45466 ?auto_45467 ?auto_45468 )
      ( MAKE-6PILE ?auto_45466 ?auto_45467 ?auto_45468 ?auto_45469 ?auto_45470 ?auto_45471 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45479 - BLOCK
      ?auto_45480 - BLOCK
      ?auto_45481 - BLOCK
      ?auto_45482 - BLOCK
      ?auto_45483 - BLOCK
      ?auto_45484 - BLOCK
    )
    :vars
    (
      ?auto_45485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45484 ?auto_45485 ) ( ON-TABLE ?auto_45479 ) ( ON ?auto_45480 ?auto_45479 ) ( not ( = ?auto_45479 ?auto_45480 ) ) ( not ( = ?auto_45479 ?auto_45481 ) ) ( not ( = ?auto_45479 ?auto_45482 ) ) ( not ( = ?auto_45479 ?auto_45483 ) ) ( not ( = ?auto_45479 ?auto_45484 ) ) ( not ( = ?auto_45479 ?auto_45485 ) ) ( not ( = ?auto_45480 ?auto_45481 ) ) ( not ( = ?auto_45480 ?auto_45482 ) ) ( not ( = ?auto_45480 ?auto_45483 ) ) ( not ( = ?auto_45480 ?auto_45484 ) ) ( not ( = ?auto_45480 ?auto_45485 ) ) ( not ( = ?auto_45481 ?auto_45482 ) ) ( not ( = ?auto_45481 ?auto_45483 ) ) ( not ( = ?auto_45481 ?auto_45484 ) ) ( not ( = ?auto_45481 ?auto_45485 ) ) ( not ( = ?auto_45482 ?auto_45483 ) ) ( not ( = ?auto_45482 ?auto_45484 ) ) ( not ( = ?auto_45482 ?auto_45485 ) ) ( not ( = ?auto_45483 ?auto_45484 ) ) ( not ( = ?auto_45483 ?auto_45485 ) ) ( not ( = ?auto_45484 ?auto_45485 ) ) ( ON ?auto_45483 ?auto_45484 ) ( ON ?auto_45482 ?auto_45483 ) ( CLEAR ?auto_45480 ) ( ON ?auto_45481 ?auto_45482 ) ( CLEAR ?auto_45481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45479 ?auto_45480 ?auto_45481 )
      ( MAKE-6PILE ?auto_45479 ?auto_45480 ?auto_45481 ?auto_45482 ?auto_45483 ?auto_45484 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45492 - BLOCK
      ?auto_45493 - BLOCK
      ?auto_45494 - BLOCK
      ?auto_45495 - BLOCK
      ?auto_45496 - BLOCK
      ?auto_45497 - BLOCK
    )
    :vars
    (
      ?auto_45498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45497 ?auto_45498 ) ( ON-TABLE ?auto_45492 ) ( not ( = ?auto_45492 ?auto_45493 ) ) ( not ( = ?auto_45492 ?auto_45494 ) ) ( not ( = ?auto_45492 ?auto_45495 ) ) ( not ( = ?auto_45492 ?auto_45496 ) ) ( not ( = ?auto_45492 ?auto_45497 ) ) ( not ( = ?auto_45492 ?auto_45498 ) ) ( not ( = ?auto_45493 ?auto_45494 ) ) ( not ( = ?auto_45493 ?auto_45495 ) ) ( not ( = ?auto_45493 ?auto_45496 ) ) ( not ( = ?auto_45493 ?auto_45497 ) ) ( not ( = ?auto_45493 ?auto_45498 ) ) ( not ( = ?auto_45494 ?auto_45495 ) ) ( not ( = ?auto_45494 ?auto_45496 ) ) ( not ( = ?auto_45494 ?auto_45497 ) ) ( not ( = ?auto_45494 ?auto_45498 ) ) ( not ( = ?auto_45495 ?auto_45496 ) ) ( not ( = ?auto_45495 ?auto_45497 ) ) ( not ( = ?auto_45495 ?auto_45498 ) ) ( not ( = ?auto_45496 ?auto_45497 ) ) ( not ( = ?auto_45496 ?auto_45498 ) ) ( not ( = ?auto_45497 ?auto_45498 ) ) ( ON ?auto_45496 ?auto_45497 ) ( ON ?auto_45495 ?auto_45496 ) ( ON ?auto_45494 ?auto_45495 ) ( CLEAR ?auto_45492 ) ( ON ?auto_45493 ?auto_45494 ) ( CLEAR ?auto_45493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45492 ?auto_45493 )
      ( MAKE-6PILE ?auto_45492 ?auto_45493 ?auto_45494 ?auto_45495 ?auto_45496 ?auto_45497 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45505 - BLOCK
      ?auto_45506 - BLOCK
      ?auto_45507 - BLOCK
      ?auto_45508 - BLOCK
      ?auto_45509 - BLOCK
      ?auto_45510 - BLOCK
    )
    :vars
    (
      ?auto_45511 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45510 ?auto_45511 ) ( ON-TABLE ?auto_45505 ) ( not ( = ?auto_45505 ?auto_45506 ) ) ( not ( = ?auto_45505 ?auto_45507 ) ) ( not ( = ?auto_45505 ?auto_45508 ) ) ( not ( = ?auto_45505 ?auto_45509 ) ) ( not ( = ?auto_45505 ?auto_45510 ) ) ( not ( = ?auto_45505 ?auto_45511 ) ) ( not ( = ?auto_45506 ?auto_45507 ) ) ( not ( = ?auto_45506 ?auto_45508 ) ) ( not ( = ?auto_45506 ?auto_45509 ) ) ( not ( = ?auto_45506 ?auto_45510 ) ) ( not ( = ?auto_45506 ?auto_45511 ) ) ( not ( = ?auto_45507 ?auto_45508 ) ) ( not ( = ?auto_45507 ?auto_45509 ) ) ( not ( = ?auto_45507 ?auto_45510 ) ) ( not ( = ?auto_45507 ?auto_45511 ) ) ( not ( = ?auto_45508 ?auto_45509 ) ) ( not ( = ?auto_45508 ?auto_45510 ) ) ( not ( = ?auto_45508 ?auto_45511 ) ) ( not ( = ?auto_45509 ?auto_45510 ) ) ( not ( = ?auto_45509 ?auto_45511 ) ) ( not ( = ?auto_45510 ?auto_45511 ) ) ( ON ?auto_45509 ?auto_45510 ) ( ON ?auto_45508 ?auto_45509 ) ( ON ?auto_45507 ?auto_45508 ) ( CLEAR ?auto_45505 ) ( ON ?auto_45506 ?auto_45507 ) ( CLEAR ?auto_45506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45505 ?auto_45506 )
      ( MAKE-6PILE ?auto_45505 ?auto_45506 ?auto_45507 ?auto_45508 ?auto_45509 ?auto_45510 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45518 - BLOCK
      ?auto_45519 - BLOCK
      ?auto_45520 - BLOCK
      ?auto_45521 - BLOCK
      ?auto_45522 - BLOCK
      ?auto_45523 - BLOCK
    )
    :vars
    (
      ?auto_45524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45523 ?auto_45524 ) ( not ( = ?auto_45518 ?auto_45519 ) ) ( not ( = ?auto_45518 ?auto_45520 ) ) ( not ( = ?auto_45518 ?auto_45521 ) ) ( not ( = ?auto_45518 ?auto_45522 ) ) ( not ( = ?auto_45518 ?auto_45523 ) ) ( not ( = ?auto_45518 ?auto_45524 ) ) ( not ( = ?auto_45519 ?auto_45520 ) ) ( not ( = ?auto_45519 ?auto_45521 ) ) ( not ( = ?auto_45519 ?auto_45522 ) ) ( not ( = ?auto_45519 ?auto_45523 ) ) ( not ( = ?auto_45519 ?auto_45524 ) ) ( not ( = ?auto_45520 ?auto_45521 ) ) ( not ( = ?auto_45520 ?auto_45522 ) ) ( not ( = ?auto_45520 ?auto_45523 ) ) ( not ( = ?auto_45520 ?auto_45524 ) ) ( not ( = ?auto_45521 ?auto_45522 ) ) ( not ( = ?auto_45521 ?auto_45523 ) ) ( not ( = ?auto_45521 ?auto_45524 ) ) ( not ( = ?auto_45522 ?auto_45523 ) ) ( not ( = ?auto_45522 ?auto_45524 ) ) ( not ( = ?auto_45523 ?auto_45524 ) ) ( ON ?auto_45522 ?auto_45523 ) ( ON ?auto_45521 ?auto_45522 ) ( ON ?auto_45520 ?auto_45521 ) ( ON ?auto_45519 ?auto_45520 ) ( ON ?auto_45518 ?auto_45519 ) ( CLEAR ?auto_45518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45518 )
      ( MAKE-6PILE ?auto_45518 ?auto_45519 ?auto_45520 ?auto_45521 ?auto_45522 ?auto_45523 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45531 - BLOCK
      ?auto_45532 - BLOCK
      ?auto_45533 - BLOCK
      ?auto_45534 - BLOCK
      ?auto_45535 - BLOCK
      ?auto_45536 - BLOCK
    )
    :vars
    (
      ?auto_45537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45536 ?auto_45537 ) ( not ( = ?auto_45531 ?auto_45532 ) ) ( not ( = ?auto_45531 ?auto_45533 ) ) ( not ( = ?auto_45531 ?auto_45534 ) ) ( not ( = ?auto_45531 ?auto_45535 ) ) ( not ( = ?auto_45531 ?auto_45536 ) ) ( not ( = ?auto_45531 ?auto_45537 ) ) ( not ( = ?auto_45532 ?auto_45533 ) ) ( not ( = ?auto_45532 ?auto_45534 ) ) ( not ( = ?auto_45532 ?auto_45535 ) ) ( not ( = ?auto_45532 ?auto_45536 ) ) ( not ( = ?auto_45532 ?auto_45537 ) ) ( not ( = ?auto_45533 ?auto_45534 ) ) ( not ( = ?auto_45533 ?auto_45535 ) ) ( not ( = ?auto_45533 ?auto_45536 ) ) ( not ( = ?auto_45533 ?auto_45537 ) ) ( not ( = ?auto_45534 ?auto_45535 ) ) ( not ( = ?auto_45534 ?auto_45536 ) ) ( not ( = ?auto_45534 ?auto_45537 ) ) ( not ( = ?auto_45535 ?auto_45536 ) ) ( not ( = ?auto_45535 ?auto_45537 ) ) ( not ( = ?auto_45536 ?auto_45537 ) ) ( ON ?auto_45535 ?auto_45536 ) ( ON ?auto_45534 ?auto_45535 ) ( ON ?auto_45533 ?auto_45534 ) ( ON ?auto_45532 ?auto_45533 ) ( ON ?auto_45531 ?auto_45532 ) ( CLEAR ?auto_45531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45531 )
      ( MAKE-6PILE ?auto_45531 ?auto_45532 ?auto_45533 ?auto_45534 ?auto_45535 ?auto_45536 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_45545 - BLOCK
      ?auto_45546 - BLOCK
      ?auto_45547 - BLOCK
      ?auto_45548 - BLOCK
      ?auto_45549 - BLOCK
      ?auto_45550 - BLOCK
      ?auto_45551 - BLOCK
    )
    :vars
    (
      ?auto_45552 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_45550 ) ( ON ?auto_45551 ?auto_45552 ) ( CLEAR ?auto_45551 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45545 ) ( ON ?auto_45546 ?auto_45545 ) ( ON ?auto_45547 ?auto_45546 ) ( ON ?auto_45548 ?auto_45547 ) ( ON ?auto_45549 ?auto_45548 ) ( ON ?auto_45550 ?auto_45549 ) ( not ( = ?auto_45545 ?auto_45546 ) ) ( not ( = ?auto_45545 ?auto_45547 ) ) ( not ( = ?auto_45545 ?auto_45548 ) ) ( not ( = ?auto_45545 ?auto_45549 ) ) ( not ( = ?auto_45545 ?auto_45550 ) ) ( not ( = ?auto_45545 ?auto_45551 ) ) ( not ( = ?auto_45545 ?auto_45552 ) ) ( not ( = ?auto_45546 ?auto_45547 ) ) ( not ( = ?auto_45546 ?auto_45548 ) ) ( not ( = ?auto_45546 ?auto_45549 ) ) ( not ( = ?auto_45546 ?auto_45550 ) ) ( not ( = ?auto_45546 ?auto_45551 ) ) ( not ( = ?auto_45546 ?auto_45552 ) ) ( not ( = ?auto_45547 ?auto_45548 ) ) ( not ( = ?auto_45547 ?auto_45549 ) ) ( not ( = ?auto_45547 ?auto_45550 ) ) ( not ( = ?auto_45547 ?auto_45551 ) ) ( not ( = ?auto_45547 ?auto_45552 ) ) ( not ( = ?auto_45548 ?auto_45549 ) ) ( not ( = ?auto_45548 ?auto_45550 ) ) ( not ( = ?auto_45548 ?auto_45551 ) ) ( not ( = ?auto_45548 ?auto_45552 ) ) ( not ( = ?auto_45549 ?auto_45550 ) ) ( not ( = ?auto_45549 ?auto_45551 ) ) ( not ( = ?auto_45549 ?auto_45552 ) ) ( not ( = ?auto_45550 ?auto_45551 ) ) ( not ( = ?auto_45550 ?auto_45552 ) ) ( not ( = ?auto_45551 ?auto_45552 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45551 ?auto_45552 )
      ( !STACK ?auto_45551 ?auto_45550 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_45560 - BLOCK
      ?auto_45561 - BLOCK
      ?auto_45562 - BLOCK
      ?auto_45563 - BLOCK
      ?auto_45564 - BLOCK
      ?auto_45565 - BLOCK
      ?auto_45566 - BLOCK
    )
    :vars
    (
      ?auto_45567 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_45565 ) ( ON ?auto_45566 ?auto_45567 ) ( CLEAR ?auto_45566 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45560 ) ( ON ?auto_45561 ?auto_45560 ) ( ON ?auto_45562 ?auto_45561 ) ( ON ?auto_45563 ?auto_45562 ) ( ON ?auto_45564 ?auto_45563 ) ( ON ?auto_45565 ?auto_45564 ) ( not ( = ?auto_45560 ?auto_45561 ) ) ( not ( = ?auto_45560 ?auto_45562 ) ) ( not ( = ?auto_45560 ?auto_45563 ) ) ( not ( = ?auto_45560 ?auto_45564 ) ) ( not ( = ?auto_45560 ?auto_45565 ) ) ( not ( = ?auto_45560 ?auto_45566 ) ) ( not ( = ?auto_45560 ?auto_45567 ) ) ( not ( = ?auto_45561 ?auto_45562 ) ) ( not ( = ?auto_45561 ?auto_45563 ) ) ( not ( = ?auto_45561 ?auto_45564 ) ) ( not ( = ?auto_45561 ?auto_45565 ) ) ( not ( = ?auto_45561 ?auto_45566 ) ) ( not ( = ?auto_45561 ?auto_45567 ) ) ( not ( = ?auto_45562 ?auto_45563 ) ) ( not ( = ?auto_45562 ?auto_45564 ) ) ( not ( = ?auto_45562 ?auto_45565 ) ) ( not ( = ?auto_45562 ?auto_45566 ) ) ( not ( = ?auto_45562 ?auto_45567 ) ) ( not ( = ?auto_45563 ?auto_45564 ) ) ( not ( = ?auto_45563 ?auto_45565 ) ) ( not ( = ?auto_45563 ?auto_45566 ) ) ( not ( = ?auto_45563 ?auto_45567 ) ) ( not ( = ?auto_45564 ?auto_45565 ) ) ( not ( = ?auto_45564 ?auto_45566 ) ) ( not ( = ?auto_45564 ?auto_45567 ) ) ( not ( = ?auto_45565 ?auto_45566 ) ) ( not ( = ?auto_45565 ?auto_45567 ) ) ( not ( = ?auto_45566 ?auto_45567 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45566 ?auto_45567 )
      ( !STACK ?auto_45566 ?auto_45565 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_45575 - BLOCK
      ?auto_45576 - BLOCK
      ?auto_45577 - BLOCK
      ?auto_45578 - BLOCK
      ?auto_45579 - BLOCK
      ?auto_45580 - BLOCK
      ?auto_45581 - BLOCK
    )
    :vars
    (
      ?auto_45582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45581 ?auto_45582 ) ( ON-TABLE ?auto_45575 ) ( ON ?auto_45576 ?auto_45575 ) ( ON ?auto_45577 ?auto_45576 ) ( ON ?auto_45578 ?auto_45577 ) ( ON ?auto_45579 ?auto_45578 ) ( not ( = ?auto_45575 ?auto_45576 ) ) ( not ( = ?auto_45575 ?auto_45577 ) ) ( not ( = ?auto_45575 ?auto_45578 ) ) ( not ( = ?auto_45575 ?auto_45579 ) ) ( not ( = ?auto_45575 ?auto_45580 ) ) ( not ( = ?auto_45575 ?auto_45581 ) ) ( not ( = ?auto_45575 ?auto_45582 ) ) ( not ( = ?auto_45576 ?auto_45577 ) ) ( not ( = ?auto_45576 ?auto_45578 ) ) ( not ( = ?auto_45576 ?auto_45579 ) ) ( not ( = ?auto_45576 ?auto_45580 ) ) ( not ( = ?auto_45576 ?auto_45581 ) ) ( not ( = ?auto_45576 ?auto_45582 ) ) ( not ( = ?auto_45577 ?auto_45578 ) ) ( not ( = ?auto_45577 ?auto_45579 ) ) ( not ( = ?auto_45577 ?auto_45580 ) ) ( not ( = ?auto_45577 ?auto_45581 ) ) ( not ( = ?auto_45577 ?auto_45582 ) ) ( not ( = ?auto_45578 ?auto_45579 ) ) ( not ( = ?auto_45578 ?auto_45580 ) ) ( not ( = ?auto_45578 ?auto_45581 ) ) ( not ( = ?auto_45578 ?auto_45582 ) ) ( not ( = ?auto_45579 ?auto_45580 ) ) ( not ( = ?auto_45579 ?auto_45581 ) ) ( not ( = ?auto_45579 ?auto_45582 ) ) ( not ( = ?auto_45580 ?auto_45581 ) ) ( not ( = ?auto_45580 ?auto_45582 ) ) ( not ( = ?auto_45581 ?auto_45582 ) ) ( CLEAR ?auto_45579 ) ( ON ?auto_45580 ?auto_45581 ) ( CLEAR ?auto_45580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45575 ?auto_45576 ?auto_45577 ?auto_45578 ?auto_45579 ?auto_45580 )
      ( MAKE-7PILE ?auto_45575 ?auto_45576 ?auto_45577 ?auto_45578 ?auto_45579 ?auto_45580 ?auto_45581 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_45590 - BLOCK
      ?auto_45591 - BLOCK
      ?auto_45592 - BLOCK
      ?auto_45593 - BLOCK
      ?auto_45594 - BLOCK
      ?auto_45595 - BLOCK
      ?auto_45596 - BLOCK
    )
    :vars
    (
      ?auto_45597 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45596 ?auto_45597 ) ( ON-TABLE ?auto_45590 ) ( ON ?auto_45591 ?auto_45590 ) ( ON ?auto_45592 ?auto_45591 ) ( ON ?auto_45593 ?auto_45592 ) ( ON ?auto_45594 ?auto_45593 ) ( not ( = ?auto_45590 ?auto_45591 ) ) ( not ( = ?auto_45590 ?auto_45592 ) ) ( not ( = ?auto_45590 ?auto_45593 ) ) ( not ( = ?auto_45590 ?auto_45594 ) ) ( not ( = ?auto_45590 ?auto_45595 ) ) ( not ( = ?auto_45590 ?auto_45596 ) ) ( not ( = ?auto_45590 ?auto_45597 ) ) ( not ( = ?auto_45591 ?auto_45592 ) ) ( not ( = ?auto_45591 ?auto_45593 ) ) ( not ( = ?auto_45591 ?auto_45594 ) ) ( not ( = ?auto_45591 ?auto_45595 ) ) ( not ( = ?auto_45591 ?auto_45596 ) ) ( not ( = ?auto_45591 ?auto_45597 ) ) ( not ( = ?auto_45592 ?auto_45593 ) ) ( not ( = ?auto_45592 ?auto_45594 ) ) ( not ( = ?auto_45592 ?auto_45595 ) ) ( not ( = ?auto_45592 ?auto_45596 ) ) ( not ( = ?auto_45592 ?auto_45597 ) ) ( not ( = ?auto_45593 ?auto_45594 ) ) ( not ( = ?auto_45593 ?auto_45595 ) ) ( not ( = ?auto_45593 ?auto_45596 ) ) ( not ( = ?auto_45593 ?auto_45597 ) ) ( not ( = ?auto_45594 ?auto_45595 ) ) ( not ( = ?auto_45594 ?auto_45596 ) ) ( not ( = ?auto_45594 ?auto_45597 ) ) ( not ( = ?auto_45595 ?auto_45596 ) ) ( not ( = ?auto_45595 ?auto_45597 ) ) ( not ( = ?auto_45596 ?auto_45597 ) ) ( CLEAR ?auto_45594 ) ( ON ?auto_45595 ?auto_45596 ) ( CLEAR ?auto_45595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45590 ?auto_45591 ?auto_45592 ?auto_45593 ?auto_45594 ?auto_45595 )
      ( MAKE-7PILE ?auto_45590 ?auto_45591 ?auto_45592 ?auto_45593 ?auto_45594 ?auto_45595 ?auto_45596 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_45605 - BLOCK
      ?auto_45606 - BLOCK
      ?auto_45607 - BLOCK
      ?auto_45608 - BLOCK
      ?auto_45609 - BLOCK
      ?auto_45610 - BLOCK
      ?auto_45611 - BLOCK
    )
    :vars
    (
      ?auto_45612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45611 ?auto_45612 ) ( ON-TABLE ?auto_45605 ) ( ON ?auto_45606 ?auto_45605 ) ( ON ?auto_45607 ?auto_45606 ) ( ON ?auto_45608 ?auto_45607 ) ( not ( = ?auto_45605 ?auto_45606 ) ) ( not ( = ?auto_45605 ?auto_45607 ) ) ( not ( = ?auto_45605 ?auto_45608 ) ) ( not ( = ?auto_45605 ?auto_45609 ) ) ( not ( = ?auto_45605 ?auto_45610 ) ) ( not ( = ?auto_45605 ?auto_45611 ) ) ( not ( = ?auto_45605 ?auto_45612 ) ) ( not ( = ?auto_45606 ?auto_45607 ) ) ( not ( = ?auto_45606 ?auto_45608 ) ) ( not ( = ?auto_45606 ?auto_45609 ) ) ( not ( = ?auto_45606 ?auto_45610 ) ) ( not ( = ?auto_45606 ?auto_45611 ) ) ( not ( = ?auto_45606 ?auto_45612 ) ) ( not ( = ?auto_45607 ?auto_45608 ) ) ( not ( = ?auto_45607 ?auto_45609 ) ) ( not ( = ?auto_45607 ?auto_45610 ) ) ( not ( = ?auto_45607 ?auto_45611 ) ) ( not ( = ?auto_45607 ?auto_45612 ) ) ( not ( = ?auto_45608 ?auto_45609 ) ) ( not ( = ?auto_45608 ?auto_45610 ) ) ( not ( = ?auto_45608 ?auto_45611 ) ) ( not ( = ?auto_45608 ?auto_45612 ) ) ( not ( = ?auto_45609 ?auto_45610 ) ) ( not ( = ?auto_45609 ?auto_45611 ) ) ( not ( = ?auto_45609 ?auto_45612 ) ) ( not ( = ?auto_45610 ?auto_45611 ) ) ( not ( = ?auto_45610 ?auto_45612 ) ) ( not ( = ?auto_45611 ?auto_45612 ) ) ( ON ?auto_45610 ?auto_45611 ) ( CLEAR ?auto_45608 ) ( ON ?auto_45609 ?auto_45610 ) ( CLEAR ?auto_45609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45605 ?auto_45606 ?auto_45607 ?auto_45608 ?auto_45609 )
      ( MAKE-7PILE ?auto_45605 ?auto_45606 ?auto_45607 ?auto_45608 ?auto_45609 ?auto_45610 ?auto_45611 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_45620 - BLOCK
      ?auto_45621 - BLOCK
      ?auto_45622 - BLOCK
      ?auto_45623 - BLOCK
      ?auto_45624 - BLOCK
      ?auto_45625 - BLOCK
      ?auto_45626 - BLOCK
    )
    :vars
    (
      ?auto_45627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45626 ?auto_45627 ) ( ON-TABLE ?auto_45620 ) ( ON ?auto_45621 ?auto_45620 ) ( ON ?auto_45622 ?auto_45621 ) ( ON ?auto_45623 ?auto_45622 ) ( not ( = ?auto_45620 ?auto_45621 ) ) ( not ( = ?auto_45620 ?auto_45622 ) ) ( not ( = ?auto_45620 ?auto_45623 ) ) ( not ( = ?auto_45620 ?auto_45624 ) ) ( not ( = ?auto_45620 ?auto_45625 ) ) ( not ( = ?auto_45620 ?auto_45626 ) ) ( not ( = ?auto_45620 ?auto_45627 ) ) ( not ( = ?auto_45621 ?auto_45622 ) ) ( not ( = ?auto_45621 ?auto_45623 ) ) ( not ( = ?auto_45621 ?auto_45624 ) ) ( not ( = ?auto_45621 ?auto_45625 ) ) ( not ( = ?auto_45621 ?auto_45626 ) ) ( not ( = ?auto_45621 ?auto_45627 ) ) ( not ( = ?auto_45622 ?auto_45623 ) ) ( not ( = ?auto_45622 ?auto_45624 ) ) ( not ( = ?auto_45622 ?auto_45625 ) ) ( not ( = ?auto_45622 ?auto_45626 ) ) ( not ( = ?auto_45622 ?auto_45627 ) ) ( not ( = ?auto_45623 ?auto_45624 ) ) ( not ( = ?auto_45623 ?auto_45625 ) ) ( not ( = ?auto_45623 ?auto_45626 ) ) ( not ( = ?auto_45623 ?auto_45627 ) ) ( not ( = ?auto_45624 ?auto_45625 ) ) ( not ( = ?auto_45624 ?auto_45626 ) ) ( not ( = ?auto_45624 ?auto_45627 ) ) ( not ( = ?auto_45625 ?auto_45626 ) ) ( not ( = ?auto_45625 ?auto_45627 ) ) ( not ( = ?auto_45626 ?auto_45627 ) ) ( ON ?auto_45625 ?auto_45626 ) ( CLEAR ?auto_45623 ) ( ON ?auto_45624 ?auto_45625 ) ( CLEAR ?auto_45624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45620 ?auto_45621 ?auto_45622 ?auto_45623 ?auto_45624 )
      ( MAKE-7PILE ?auto_45620 ?auto_45621 ?auto_45622 ?auto_45623 ?auto_45624 ?auto_45625 ?auto_45626 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_45635 - BLOCK
      ?auto_45636 - BLOCK
      ?auto_45637 - BLOCK
      ?auto_45638 - BLOCK
      ?auto_45639 - BLOCK
      ?auto_45640 - BLOCK
      ?auto_45641 - BLOCK
    )
    :vars
    (
      ?auto_45642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45641 ?auto_45642 ) ( ON-TABLE ?auto_45635 ) ( ON ?auto_45636 ?auto_45635 ) ( ON ?auto_45637 ?auto_45636 ) ( not ( = ?auto_45635 ?auto_45636 ) ) ( not ( = ?auto_45635 ?auto_45637 ) ) ( not ( = ?auto_45635 ?auto_45638 ) ) ( not ( = ?auto_45635 ?auto_45639 ) ) ( not ( = ?auto_45635 ?auto_45640 ) ) ( not ( = ?auto_45635 ?auto_45641 ) ) ( not ( = ?auto_45635 ?auto_45642 ) ) ( not ( = ?auto_45636 ?auto_45637 ) ) ( not ( = ?auto_45636 ?auto_45638 ) ) ( not ( = ?auto_45636 ?auto_45639 ) ) ( not ( = ?auto_45636 ?auto_45640 ) ) ( not ( = ?auto_45636 ?auto_45641 ) ) ( not ( = ?auto_45636 ?auto_45642 ) ) ( not ( = ?auto_45637 ?auto_45638 ) ) ( not ( = ?auto_45637 ?auto_45639 ) ) ( not ( = ?auto_45637 ?auto_45640 ) ) ( not ( = ?auto_45637 ?auto_45641 ) ) ( not ( = ?auto_45637 ?auto_45642 ) ) ( not ( = ?auto_45638 ?auto_45639 ) ) ( not ( = ?auto_45638 ?auto_45640 ) ) ( not ( = ?auto_45638 ?auto_45641 ) ) ( not ( = ?auto_45638 ?auto_45642 ) ) ( not ( = ?auto_45639 ?auto_45640 ) ) ( not ( = ?auto_45639 ?auto_45641 ) ) ( not ( = ?auto_45639 ?auto_45642 ) ) ( not ( = ?auto_45640 ?auto_45641 ) ) ( not ( = ?auto_45640 ?auto_45642 ) ) ( not ( = ?auto_45641 ?auto_45642 ) ) ( ON ?auto_45640 ?auto_45641 ) ( ON ?auto_45639 ?auto_45640 ) ( CLEAR ?auto_45637 ) ( ON ?auto_45638 ?auto_45639 ) ( CLEAR ?auto_45638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45635 ?auto_45636 ?auto_45637 ?auto_45638 )
      ( MAKE-7PILE ?auto_45635 ?auto_45636 ?auto_45637 ?auto_45638 ?auto_45639 ?auto_45640 ?auto_45641 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_45650 - BLOCK
      ?auto_45651 - BLOCK
      ?auto_45652 - BLOCK
      ?auto_45653 - BLOCK
      ?auto_45654 - BLOCK
      ?auto_45655 - BLOCK
      ?auto_45656 - BLOCK
    )
    :vars
    (
      ?auto_45657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45656 ?auto_45657 ) ( ON-TABLE ?auto_45650 ) ( ON ?auto_45651 ?auto_45650 ) ( ON ?auto_45652 ?auto_45651 ) ( not ( = ?auto_45650 ?auto_45651 ) ) ( not ( = ?auto_45650 ?auto_45652 ) ) ( not ( = ?auto_45650 ?auto_45653 ) ) ( not ( = ?auto_45650 ?auto_45654 ) ) ( not ( = ?auto_45650 ?auto_45655 ) ) ( not ( = ?auto_45650 ?auto_45656 ) ) ( not ( = ?auto_45650 ?auto_45657 ) ) ( not ( = ?auto_45651 ?auto_45652 ) ) ( not ( = ?auto_45651 ?auto_45653 ) ) ( not ( = ?auto_45651 ?auto_45654 ) ) ( not ( = ?auto_45651 ?auto_45655 ) ) ( not ( = ?auto_45651 ?auto_45656 ) ) ( not ( = ?auto_45651 ?auto_45657 ) ) ( not ( = ?auto_45652 ?auto_45653 ) ) ( not ( = ?auto_45652 ?auto_45654 ) ) ( not ( = ?auto_45652 ?auto_45655 ) ) ( not ( = ?auto_45652 ?auto_45656 ) ) ( not ( = ?auto_45652 ?auto_45657 ) ) ( not ( = ?auto_45653 ?auto_45654 ) ) ( not ( = ?auto_45653 ?auto_45655 ) ) ( not ( = ?auto_45653 ?auto_45656 ) ) ( not ( = ?auto_45653 ?auto_45657 ) ) ( not ( = ?auto_45654 ?auto_45655 ) ) ( not ( = ?auto_45654 ?auto_45656 ) ) ( not ( = ?auto_45654 ?auto_45657 ) ) ( not ( = ?auto_45655 ?auto_45656 ) ) ( not ( = ?auto_45655 ?auto_45657 ) ) ( not ( = ?auto_45656 ?auto_45657 ) ) ( ON ?auto_45655 ?auto_45656 ) ( ON ?auto_45654 ?auto_45655 ) ( CLEAR ?auto_45652 ) ( ON ?auto_45653 ?auto_45654 ) ( CLEAR ?auto_45653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45650 ?auto_45651 ?auto_45652 ?auto_45653 )
      ( MAKE-7PILE ?auto_45650 ?auto_45651 ?auto_45652 ?auto_45653 ?auto_45654 ?auto_45655 ?auto_45656 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_45665 - BLOCK
      ?auto_45666 - BLOCK
      ?auto_45667 - BLOCK
      ?auto_45668 - BLOCK
      ?auto_45669 - BLOCK
      ?auto_45670 - BLOCK
      ?auto_45671 - BLOCK
    )
    :vars
    (
      ?auto_45672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45671 ?auto_45672 ) ( ON-TABLE ?auto_45665 ) ( ON ?auto_45666 ?auto_45665 ) ( not ( = ?auto_45665 ?auto_45666 ) ) ( not ( = ?auto_45665 ?auto_45667 ) ) ( not ( = ?auto_45665 ?auto_45668 ) ) ( not ( = ?auto_45665 ?auto_45669 ) ) ( not ( = ?auto_45665 ?auto_45670 ) ) ( not ( = ?auto_45665 ?auto_45671 ) ) ( not ( = ?auto_45665 ?auto_45672 ) ) ( not ( = ?auto_45666 ?auto_45667 ) ) ( not ( = ?auto_45666 ?auto_45668 ) ) ( not ( = ?auto_45666 ?auto_45669 ) ) ( not ( = ?auto_45666 ?auto_45670 ) ) ( not ( = ?auto_45666 ?auto_45671 ) ) ( not ( = ?auto_45666 ?auto_45672 ) ) ( not ( = ?auto_45667 ?auto_45668 ) ) ( not ( = ?auto_45667 ?auto_45669 ) ) ( not ( = ?auto_45667 ?auto_45670 ) ) ( not ( = ?auto_45667 ?auto_45671 ) ) ( not ( = ?auto_45667 ?auto_45672 ) ) ( not ( = ?auto_45668 ?auto_45669 ) ) ( not ( = ?auto_45668 ?auto_45670 ) ) ( not ( = ?auto_45668 ?auto_45671 ) ) ( not ( = ?auto_45668 ?auto_45672 ) ) ( not ( = ?auto_45669 ?auto_45670 ) ) ( not ( = ?auto_45669 ?auto_45671 ) ) ( not ( = ?auto_45669 ?auto_45672 ) ) ( not ( = ?auto_45670 ?auto_45671 ) ) ( not ( = ?auto_45670 ?auto_45672 ) ) ( not ( = ?auto_45671 ?auto_45672 ) ) ( ON ?auto_45670 ?auto_45671 ) ( ON ?auto_45669 ?auto_45670 ) ( ON ?auto_45668 ?auto_45669 ) ( CLEAR ?auto_45666 ) ( ON ?auto_45667 ?auto_45668 ) ( CLEAR ?auto_45667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45665 ?auto_45666 ?auto_45667 )
      ( MAKE-7PILE ?auto_45665 ?auto_45666 ?auto_45667 ?auto_45668 ?auto_45669 ?auto_45670 ?auto_45671 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_45680 - BLOCK
      ?auto_45681 - BLOCK
      ?auto_45682 - BLOCK
      ?auto_45683 - BLOCK
      ?auto_45684 - BLOCK
      ?auto_45685 - BLOCK
      ?auto_45686 - BLOCK
    )
    :vars
    (
      ?auto_45687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45686 ?auto_45687 ) ( ON-TABLE ?auto_45680 ) ( ON ?auto_45681 ?auto_45680 ) ( not ( = ?auto_45680 ?auto_45681 ) ) ( not ( = ?auto_45680 ?auto_45682 ) ) ( not ( = ?auto_45680 ?auto_45683 ) ) ( not ( = ?auto_45680 ?auto_45684 ) ) ( not ( = ?auto_45680 ?auto_45685 ) ) ( not ( = ?auto_45680 ?auto_45686 ) ) ( not ( = ?auto_45680 ?auto_45687 ) ) ( not ( = ?auto_45681 ?auto_45682 ) ) ( not ( = ?auto_45681 ?auto_45683 ) ) ( not ( = ?auto_45681 ?auto_45684 ) ) ( not ( = ?auto_45681 ?auto_45685 ) ) ( not ( = ?auto_45681 ?auto_45686 ) ) ( not ( = ?auto_45681 ?auto_45687 ) ) ( not ( = ?auto_45682 ?auto_45683 ) ) ( not ( = ?auto_45682 ?auto_45684 ) ) ( not ( = ?auto_45682 ?auto_45685 ) ) ( not ( = ?auto_45682 ?auto_45686 ) ) ( not ( = ?auto_45682 ?auto_45687 ) ) ( not ( = ?auto_45683 ?auto_45684 ) ) ( not ( = ?auto_45683 ?auto_45685 ) ) ( not ( = ?auto_45683 ?auto_45686 ) ) ( not ( = ?auto_45683 ?auto_45687 ) ) ( not ( = ?auto_45684 ?auto_45685 ) ) ( not ( = ?auto_45684 ?auto_45686 ) ) ( not ( = ?auto_45684 ?auto_45687 ) ) ( not ( = ?auto_45685 ?auto_45686 ) ) ( not ( = ?auto_45685 ?auto_45687 ) ) ( not ( = ?auto_45686 ?auto_45687 ) ) ( ON ?auto_45685 ?auto_45686 ) ( ON ?auto_45684 ?auto_45685 ) ( ON ?auto_45683 ?auto_45684 ) ( CLEAR ?auto_45681 ) ( ON ?auto_45682 ?auto_45683 ) ( CLEAR ?auto_45682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45680 ?auto_45681 ?auto_45682 )
      ( MAKE-7PILE ?auto_45680 ?auto_45681 ?auto_45682 ?auto_45683 ?auto_45684 ?auto_45685 ?auto_45686 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_45695 - BLOCK
      ?auto_45696 - BLOCK
      ?auto_45697 - BLOCK
      ?auto_45698 - BLOCK
      ?auto_45699 - BLOCK
      ?auto_45700 - BLOCK
      ?auto_45701 - BLOCK
    )
    :vars
    (
      ?auto_45702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45701 ?auto_45702 ) ( ON-TABLE ?auto_45695 ) ( not ( = ?auto_45695 ?auto_45696 ) ) ( not ( = ?auto_45695 ?auto_45697 ) ) ( not ( = ?auto_45695 ?auto_45698 ) ) ( not ( = ?auto_45695 ?auto_45699 ) ) ( not ( = ?auto_45695 ?auto_45700 ) ) ( not ( = ?auto_45695 ?auto_45701 ) ) ( not ( = ?auto_45695 ?auto_45702 ) ) ( not ( = ?auto_45696 ?auto_45697 ) ) ( not ( = ?auto_45696 ?auto_45698 ) ) ( not ( = ?auto_45696 ?auto_45699 ) ) ( not ( = ?auto_45696 ?auto_45700 ) ) ( not ( = ?auto_45696 ?auto_45701 ) ) ( not ( = ?auto_45696 ?auto_45702 ) ) ( not ( = ?auto_45697 ?auto_45698 ) ) ( not ( = ?auto_45697 ?auto_45699 ) ) ( not ( = ?auto_45697 ?auto_45700 ) ) ( not ( = ?auto_45697 ?auto_45701 ) ) ( not ( = ?auto_45697 ?auto_45702 ) ) ( not ( = ?auto_45698 ?auto_45699 ) ) ( not ( = ?auto_45698 ?auto_45700 ) ) ( not ( = ?auto_45698 ?auto_45701 ) ) ( not ( = ?auto_45698 ?auto_45702 ) ) ( not ( = ?auto_45699 ?auto_45700 ) ) ( not ( = ?auto_45699 ?auto_45701 ) ) ( not ( = ?auto_45699 ?auto_45702 ) ) ( not ( = ?auto_45700 ?auto_45701 ) ) ( not ( = ?auto_45700 ?auto_45702 ) ) ( not ( = ?auto_45701 ?auto_45702 ) ) ( ON ?auto_45700 ?auto_45701 ) ( ON ?auto_45699 ?auto_45700 ) ( ON ?auto_45698 ?auto_45699 ) ( ON ?auto_45697 ?auto_45698 ) ( CLEAR ?auto_45695 ) ( ON ?auto_45696 ?auto_45697 ) ( CLEAR ?auto_45696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45695 ?auto_45696 )
      ( MAKE-7PILE ?auto_45695 ?auto_45696 ?auto_45697 ?auto_45698 ?auto_45699 ?auto_45700 ?auto_45701 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_45710 - BLOCK
      ?auto_45711 - BLOCK
      ?auto_45712 - BLOCK
      ?auto_45713 - BLOCK
      ?auto_45714 - BLOCK
      ?auto_45715 - BLOCK
      ?auto_45716 - BLOCK
    )
    :vars
    (
      ?auto_45717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45716 ?auto_45717 ) ( ON-TABLE ?auto_45710 ) ( not ( = ?auto_45710 ?auto_45711 ) ) ( not ( = ?auto_45710 ?auto_45712 ) ) ( not ( = ?auto_45710 ?auto_45713 ) ) ( not ( = ?auto_45710 ?auto_45714 ) ) ( not ( = ?auto_45710 ?auto_45715 ) ) ( not ( = ?auto_45710 ?auto_45716 ) ) ( not ( = ?auto_45710 ?auto_45717 ) ) ( not ( = ?auto_45711 ?auto_45712 ) ) ( not ( = ?auto_45711 ?auto_45713 ) ) ( not ( = ?auto_45711 ?auto_45714 ) ) ( not ( = ?auto_45711 ?auto_45715 ) ) ( not ( = ?auto_45711 ?auto_45716 ) ) ( not ( = ?auto_45711 ?auto_45717 ) ) ( not ( = ?auto_45712 ?auto_45713 ) ) ( not ( = ?auto_45712 ?auto_45714 ) ) ( not ( = ?auto_45712 ?auto_45715 ) ) ( not ( = ?auto_45712 ?auto_45716 ) ) ( not ( = ?auto_45712 ?auto_45717 ) ) ( not ( = ?auto_45713 ?auto_45714 ) ) ( not ( = ?auto_45713 ?auto_45715 ) ) ( not ( = ?auto_45713 ?auto_45716 ) ) ( not ( = ?auto_45713 ?auto_45717 ) ) ( not ( = ?auto_45714 ?auto_45715 ) ) ( not ( = ?auto_45714 ?auto_45716 ) ) ( not ( = ?auto_45714 ?auto_45717 ) ) ( not ( = ?auto_45715 ?auto_45716 ) ) ( not ( = ?auto_45715 ?auto_45717 ) ) ( not ( = ?auto_45716 ?auto_45717 ) ) ( ON ?auto_45715 ?auto_45716 ) ( ON ?auto_45714 ?auto_45715 ) ( ON ?auto_45713 ?auto_45714 ) ( ON ?auto_45712 ?auto_45713 ) ( CLEAR ?auto_45710 ) ( ON ?auto_45711 ?auto_45712 ) ( CLEAR ?auto_45711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45710 ?auto_45711 )
      ( MAKE-7PILE ?auto_45710 ?auto_45711 ?auto_45712 ?auto_45713 ?auto_45714 ?auto_45715 ?auto_45716 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_45725 - BLOCK
      ?auto_45726 - BLOCK
      ?auto_45727 - BLOCK
      ?auto_45728 - BLOCK
      ?auto_45729 - BLOCK
      ?auto_45730 - BLOCK
      ?auto_45731 - BLOCK
    )
    :vars
    (
      ?auto_45732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45731 ?auto_45732 ) ( not ( = ?auto_45725 ?auto_45726 ) ) ( not ( = ?auto_45725 ?auto_45727 ) ) ( not ( = ?auto_45725 ?auto_45728 ) ) ( not ( = ?auto_45725 ?auto_45729 ) ) ( not ( = ?auto_45725 ?auto_45730 ) ) ( not ( = ?auto_45725 ?auto_45731 ) ) ( not ( = ?auto_45725 ?auto_45732 ) ) ( not ( = ?auto_45726 ?auto_45727 ) ) ( not ( = ?auto_45726 ?auto_45728 ) ) ( not ( = ?auto_45726 ?auto_45729 ) ) ( not ( = ?auto_45726 ?auto_45730 ) ) ( not ( = ?auto_45726 ?auto_45731 ) ) ( not ( = ?auto_45726 ?auto_45732 ) ) ( not ( = ?auto_45727 ?auto_45728 ) ) ( not ( = ?auto_45727 ?auto_45729 ) ) ( not ( = ?auto_45727 ?auto_45730 ) ) ( not ( = ?auto_45727 ?auto_45731 ) ) ( not ( = ?auto_45727 ?auto_45732 ) ) ( not ( = ?auto_45728 ?auto_45729 ) ) ( not ( = ?auto_45728 ?auto_45730 ) ) ( not ( = ?auto_45728 ?auto_45731 ) ) ( not ( = ?auto_45728 ?auto_45732 ) ) ( not ( = ?auto_45729 ?auto_45730 ) ) ( not ( = ?auto_45729 ?auto_45731 ) ) ( not ( = ?auto_45729 ?auto_45732 ) ) ( not ( = ?auto_45730 ?auto_45731 ) ) ( not ( = ?auto_45730 ?auto_45732 ) ) ( not ( = ?auto_45731 ?auto_45732 ) ) ( ON ?auto_45730 ?auto_45731 ) ( ON ?auto_45729 ?auto_45730 ) ( ON ?auto_45728 ?auto_45729 ) ( ON ?auto_45727 ?auto_45728 ) ( ON ?auto_45726 ?auto_45727 ) ( ON ?auto_45725 ?auto_45726 ) ( CLEAR ?auto_45725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45725 )
      ( MAKE-7PILE ?auto_45725 ?auto_45726 ?auto_45727 ?auto_45728 ?auto_45729 ?auto_45730 ?auto_45731 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_45740 - BLOCK
      ?auto_45741 - BLOCK
      ?auto_45742 - BLOCK
      ?auto_45743 - BLOCK
      ?auto_45744 - BLOCK
      ?auto_45745 - BLOCK
      ?auto_45746 - BLOCK
    )
    :vars
    (
      ?auto_45747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45746 ?auto_45747 ) ( not ( = ?auto_45740 ?auto_45741 ) ) ( not ( = ?auto_45740 ?auto_45742 ) ) ( not ( = ?auto_45740 ?auto_45743 ) ) ( not ( = ?auto_45740 ?auto_45744 ) ) ( not ( = ?auto_45740 ?auto_45745 ) ) ( not ( = ?auto_45740 ?auto_45746 ) ) ( not ( = ?auto_45740 ?auto_45747 ) ) ( not ( = ?auto_45741 ?auto_45742 ) ) ( not ( = ?auto_45741 ?auto_45743 ) ) ( not ( = ?auto_45741 ?auto_45744 ) ) ( not ( = ?auto_45741 ?auto_45745 ) ) ( not ( = ?auto_45741 ?auto_45746 ) ) ( not ( = ?auto_45741 ?auto_45747 ) ) ( not ( = ?auto_45742 ?auto_45743 ) ) ( not ( = ?auto_45742 ?auto_45744 ) ) ( not ( = ?auto_45742 ?auto_45745 ) ) ( not ( = ?auto_45742 ?auto_45746 ) ) ( not ( = ?auto_45742 ?auto_45747 ) ) ( not ( = ?auto_45743 ?auto_45744 ) ) ( not ( = ?auto_45743 ?auto_45745 ) ) ( not ( = ?auto_45743 ?auto_45746 ) ) ( not ( = ?auto_45743 ?auto_45747 ) ) ( not ( = ?auto_45744 ?auto_45745 ) ) ( not ( = ?auto_45744 ?auto_45746 ) ) ( not ( = ?auto_45744 ?auto_45747 ) ) ( not ( = ?auto_45745 ?auto_45746 ) ) ( not ( = ?auto_45745 ?auto_45747 ) ) ( not ( = ?auto_45746 ?auto_45747 ) ) ( ON ?auto_45745 ?auto_45746 ) ( ON ?auto_45744 ?auto_45745 ) ( ON ?auto_45743 ?auto_45744 ) ( ON ?auto_45742 ?auto_45743 ) ( ON ?auto_45741 ?auto_45742 ) ( ON ?auto_45740 ?auto_45741 ) ( CLEAR ?auto_45740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45740 )
      ( MAKE-7PILE ?auto_45740 ?auto_45741 ?auto_45742 ?auto_45743 ?auto_45744 ?auto_45745 ?auto_45746 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_45756 - BLOCK
      ?auto_45757 - BLOCK
      ?auto_45758 - BLOCK
      ?auto_45759 - BLOCK
      ?auto_45760 - BLOCK
      ?auto_45761 - BLOCK
      ?auto_45762 - BLOCK
      ?auto_45763 - BLOCK
    )
    :vars
    (
      ?auto_45764 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_45762 ) ( ON ?auto_45763 ?auto_45764 ) ( CLEAR ?auto_45763 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45756 ) ( ON ?auto_45757 ?auto_45756 ) ( ON ?auto_45758 ?auto_45757 ) ( ON ?auto_45759 ?auto_45758 ) ( ON ?auto_45760 ?auto_45759 ) ( ON ?auto_45761 ?auto_45760 ) ( ON ?auto_45762 ?auto_45761 ) ( not ( = ?auto_45756 ?auto_45757 ) ) ( not ( = ?auto_45756 ?auto_45758 ) ) ( not ( = ?auto_45756 ?auto_45759 ) ) ( not ( = ?auto_45756 ?auto_45760 ) ) ( not ( = ?auto_45756 ?auto_45761 ) ) ( not ( = ?auto_45756 ?auto_45762 ) ) ( not ( = ?auto_45756 ?auto_45763 ) ) ( not ( = ?auto_45756 ?auto_45764 ) ) ( not ( = ?auto_45757 ?auto_45758 ) ) ( not ( = ?auto_45757 ?auto_45759 ) ) ( not ( = ?auto_45757 ?auto_45760 ) ) ( not ( = ?auto_45757 ?auto_45761 ) ) ( not ( = ?auto_45757 ?auto_45762 ) ) ( not ( = ?auto_45757 ?auto_45763 ) ) ( not ( = ?auto_45757 ?auto_45764 ) ) ( not ( = ?auto_45758 ?auto_45759 ) ) ( not ( = ?auto_45758 ?auto_45760 ) ) ( not ( = ?auto_45758 ?auto_45761 ) ) ( not ( = ?auto_45758 ?auto_45762 ) ) ( not ( = ?auto_45758 ?auto_45763 ) ) ( not ( = ?auto_45758 ?auto_45764 ) ) ( not ( = ?auto_45759 ?auto_45760 ) ) ( not ( = ?auto_45759 ?auto_45761 ) ) ( not ( = ?auto_45759 ?auto_45762 ) ) ( not ( = ?auto_45759 ?auto_45763 ) ) ( not ( = ?auto_45759 ?auto_45764 ) ) ( not ( = ?auto_45760 ?auto_45761 ) ) ( not ( = ?auto_45760 ?auto_45762 ) ) ( not ( = ?auto_45760 ?auto_45763 ) ) ( not ( = ?auto_45760 ?auto_45764 ) ) ( not ( = ?auto_45761 ?auto_45762 ) ) ( not ( = ?auto_45761 ?auto_45763 ) ) ( not ( = ?auto_45761 ?auto_45764 ) ) ( not ( = ?auto_45762 ?auto_45763 ) ) ( not ( = ?auto_45762 ?auto_45764 ) ) ( not ( = ?auto_45763 ?auto_45764 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45763 ?auto_45764 )
      ( !STACK ?auto_45763 ?auto_45762 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_45773 - BLOCK
      ?auto_45774 - BLOCK
      ?auto_45775 - BLOCK
      ?auto_45776 - BLOCK
      ?auto_45777 - BLOCK
      ?auto_45778 - BLOCK
      ?auto_45779 - BLOCK
      ?auto_45780 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_45779 ) ( ON-TABLE ?auto_45780 ) ( CLEAR ?auto_45780 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45773 ) ( ON ?auto_45774 ?auto_45773 ) ( ON ?auto_45775 ?auto_45774 ) ( ON ?auto_45776 ?auto_45775 ) ( ON ?auto_45777 ?auto_45776 ) ( ON ?auto_45778 ?auto_45777 ) ( ON ?auto_45779 ?auto_45778 ) ( not ( = ?auto_45773 ?auto_45774 ) ) ( not ( = ?auto_45773 ?auto_45775 ) ) ( not ( = ?auto_45773 ?auto_45776 ) ) ( not ( = ?auto_45773 ?auto_45777 ) ) ( not ( = ?auto_45773 ?auto_45778 ) ) ( not ( = ?auto_45773 ?auto_45779 ) ) ( not ( = ?auto_45773 ?auto_45780 ) ) ( not ( = ?auto_45774 ?auto_45775 ) ) ( not ( = ?auto_45774 ?auto_45776 ) ) ( not ( = ?auto_45774 ?auto_45777 ) ) ( not ( = ?auto_45774 ?auto_45778 ) ) ( not ( = ?auto_45774 ?auto_45779 ) ) ( not ( = ?auto_45774 ?auto_45780 ) ) ( not ( = ?auto_45775 ?auto_45776 ) ) ( not ( = ?auto_45775 ?auto_45777 ) ) ( not ( = ?auto_45775 ?auto_45778 ) ) ( not ( = ?auto_45775 ?auto_45779 ) ) ( not ( = ?auto_45775 ?auto_45780 ) ) ( not ( = ?auto_45776 ?auto_45777 ) ) ( not ( = ?auto_45776 ?auto_45778 ) ) ( not ( = ?auto_45776 ?auto_45779 ) ) ( not ( = ?auto_45776 ?auto_45780 ) ) ( not ( = ?auto_45777 ?auto_45778 ) ) ( not ( = ?auto_45777 ?auto_45779 ) ) ( not ( = ?auto_45777 ?auto_45780 ) ) ( not ( = ?auto_45778 ?auto_45779 ) ) ( not ( = ?auto_45778 ?auto_45780 ) ) ( not ( = ?auto_45779 ?auto_45780 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_45780 )
      ( !STACK ?auto_45780 ?auto_45779 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_45789 - BLOCK
      ?auto_45790 - BLOCK
      ?auto_45791 - BLOCK
      ?auto_45792 - BLOCK
      ?auto_45793 - BLOCK
      ?auto_45794 - BLOCK
      ?auto_45795 - BLOCK
      ?auto_45796 - BLOCK
    )
    :vars
    (
      ?auto_45797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45796 ?auto_45797 ) ( ON-TABLE ?auto_45789 ) ( ON ?auto_45790 ?auto_45789 ) ( ON ?auto_45791 ?auto_45790 ) ( ON ?auto_45792 ?auto_45791 ) ( ON ?auto_45793 ?auto_45792 ) ( ON ?auto_45794 ?auto_45793 ) ( not ( = ?auto_45789 ?auto_45790 ) ) ( not ( = ?auto_45789 ?auto_45791 ) ) ( not ( = ?auto_45789 ?auto_45792 ) ) ( not ( = ?auto_45789 ?auto_45793 ) ) ( not ( = ?auto_45789 ?auto_45794 ) ) ( not ( = ?auto_45789 ?auto_45795 ) ) ( not ( = ?auto_45789 ?auto_45796 ) ) ( not ( = ?auto_45789 ?auto_45797 ) ) ( not ( = ?auto_45790 ?auto_45791 ) ) ( not ( = ?auto_45790 ?auto_45792 ) ) ( not ( = ?auto_45790 ?auto_45793 ) ) ( not ( = ?auto_45790 ?auto_45794 ) ) ( not ( = ?auto_45790 ?auto_45795 ) ) ( not ( = ?auto_45790 ?auto_45796 ) ) ( not ( = ?auto_45790 ?auto_45797 ) ) ( not ( = ?auto_45791 ?auto_45792 ) ) ( not ( = ?auto_45791 ?auto_45793 ) ) ( not ( = ?auto_45791 ?auto_45794 ) ) ( not ( = ?auto_45791 ?auto_45795 ) ) ( not ( = ?auto_45791 ?auto_45796 ) ) ( not ( = ?auto_45791 ?auto_45797 ) ) ( not ( = ?auto_45792 ?auto_45793 ) ) ( not ( = ?auto_45792 ?auto_45794 ) ) ( not ( = ?auto_45792 ?auto_45795 ) ) ( not ( = ?auto_45792 ?auto_45796 ) ) ( not ( = ?auto_45792 ?auto_45797 ) ) ( not ( = ?auto_45793 ?auto_45794 ) ) ( not ( = ?auto_45793 ?auto_45795 ) ) ( not ( = ?auto_45793 ?auto_45796 ) ) ( not ( = ?auto_45793 ?auto_45797 ) ) ( not ( = ?auto_45794 ?auto_45795 ) ) ( not ( = ?auto_45794 ?auto_45796 ) ) ( not ( = ?auto_45794 ?auto_45797 ) ) ( not ( = ?auto_45795 ?auto_45796 ) ) ( not ( = ?auto_45795 ?auto_45797 ) ) ( not ( = ?auto_45796 ?auto_45797 ) ) ( CLEAR ?auto_45794 ) ( ON ?auto_45795 ?auto_45796 ) ( CLEAR ?auto_45795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_45789 ?auto_45790 ?auto_45791 ?auto_45792 ?auto_45793 ?auto_45794 ?auto_45795 )
      ( MAKE-8PILE ?auto_45789 ?auto_45790 ?auto_45791 ?auto_45792 ?auto_45793 ?auto_45794 ?auto_45795 ?auto_45796 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_45806 - BLOCK
      ?auto_45807 - BLOCK
      ?auto_45808 - BLOCK
      ?auto_45809 - BLOCK
      ?auto_45810 - BLOCK
      ?auto_45811 - BLOCK
      ?auto_45812 - BLOCK
      ?auto_45813 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45813 ) ( ON-TABLE ?auto_45806 ) ( ON ?auto_45807 ?auto_45806 ) ( ON ?auto_45808 ?auto_45807 ) ( ON ?auto_45809 ?auto_45808 ) ( ON ?auto_45810 ?auto_45809 ) ( ON ?auto_45811 ?auto_45810 ) ( not ( = ?auto_45806 ?auto_45807 ) ) ( not ( = ?auto_45806 ?auto_45808 ) ) ( not ( = ?auto_45806 ?auto_45809 ) ) ( not ( = ?auto_45806 ?auto_45810 ) ) ( not ( = ?auto_45806 ?auto_45811 ) ) ( not ( = ?auto_45806 ?auto_45812 ) ) ( not ( = ?auto_45806 ?auto_45813 ) ) ( not ( = ?auto_45807 ?auto_45808 ) ) ( not ( = ?auto_45807 ?auto_45809 ) ) ( not ( = ?auto_45807 ?auto_45810 ) ) ( not ( = ?auto_45807 ?auto_45811 ) ) ( not ( = ?auto_45807 ?auto_45812 ) ) ( not ( = ?auto_45807 ?auto_45813 ) ) ( not ( = ?auto_45808 ?auto_45809 ) ) ( not ( = ?auto_45808 ?auto_45810 ) ) ( not ( = ?auto_45808 ?auto_45811 ) ) ( not ( = ?auto_45808 ?auto_45812 ) ) ( not ( = ?auto_45808 ?auto_45813 ) ) ( not ( = ?auto_45809 ?auto_45810 ) ) ( not ( = ?auto_45809 ?auto_45811 ) ) ( not ( = ?auto_45809 ?auto_45812 ) ) ( not ( = ?auto_45809 ?auto_45813 ) ) ( not ( = ?auto_45810 ?auto_45811 ) ) ( not ( = ?auto_45810 ?auto_45812 ) ) ( not ( = ?auto_45810 ?auto_45813 ) ) ( not ( = ?auto_45811 ?auto_45812 ) ) ( not ( = ?auto_45811 ?auto_45813 ) ) ( not ( = ?auto_45812 ?auto_45813 ) ) ( CLEAR ?auto_45811 ) ( ON ?auto_45812 ?auto_45813 ) ( CLEAR ?auto_45812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_45806 ?auto_45807 ?auto_45808 ?auto_45809 ?auto_45810 ?auto_45811 ?auto_45812 )
      ( MAKE-8PILE ?auto_45806 ?auto_45807 ?auto_45808 ?auto_45809 ?auto_45810 ?auto_45811 ?auto_45812 ?auto_45813 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_45822 - BLOCK
      ?auto_45823 - BLOCK
      ?auto_45824 - BLOCK
      ?auto_45825 - BLOCK
      ?auto_45826 - BLOCK
      ?auto_45827 - BLOCK
      ?auto_45828 - BLOCK
      ?auto_45829 - BLOCK
    )
    :vars
    (
      ?auto_45830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45829 ?auto_45830 ) ( ON-TABLE ?auto_45822 ) ( ON ?auto_45823 ?auto_45822 ) ( ON ?auto_45824 ?auto_45823 ) ( ON ?auto_45825 ?auto_45824 ) ( ON ?auto_45826 ?auto_45825 ) ( not ( = ?auto_45822 ?auto_45823 ) ) ( not ( = ?auto_45822 ?auto_45824 ) ) ( not ( = ?auto_45822 ?auto_45825 ) ) ( not ( = ?auto_45822 ?auto_45826 ) ) ( not ( = ?auto_45822 ?auto_45827 ) ) ( not ( = ?auto_45822 ?auto_45828 ) ) ( not ( = ?auto_45822 ?auto_45829 ) ) ( not ( = ?auto_45822 ?auto_45830 ) ) ( not ( = ?auto_45823 ?auto_45824 ) ) ( not ( = ?auto_45823 ?auto_45825 ) ) ( not ( = ?auto_45823 ?auto_45826 ) ) ( not ( = ?auto_45823 ?auto_45827 ) ) ( not ( = ?auto_45823 ?auto_45828 ) ) ( not ( = ?auto_45823 ?auto_45829 ) ) ( not ( = ?auto_45823 ?auto_45830 ) ) ( not ( = ?auto_45824 ?auto_45825 ) ) ( not ( = ?auto_45824 ?auto_45826 ) ) ( not ( = ?auto_45824 ?auto_45827 ) ) ( not ( = ?auto_45824 ?auto_45828 ) ) ( not ( = ?auto_45824 ?auto_45829 ) ) ( not ( = ?auto_45824 ?auto_45830 ) ) ( not ( = ?auto_45825 ?auto_45826 ) ) ( not ( = ?auto_45825 ?auto_45827 ) ) ( not ( = ?auto_45825 ?auto_45828 ) ) ( not ( = ?auto_45825 ?auto_45829 ) ) ( not ( = ?auto_45825 ?auto_45830 ) ) ( not ( = ?auto_45826 ?auto_45827 ) ) ( not ( = ?auto_45826 ?auto_45828 ) ) ( not ( = ?auto_45826 ?auto_45829 ) ) ( not ( = ?auto_45826 ?auto_45830 ) ) ( not ( = ?auto_45827 ?auto_45828 ) ) ( not ( = ?auto_45827 ?auto_45829 ) ) ( not ( = ?auto_45827 ?auto_45830 ) ) ( not ( = ?auto_45828 ?auto_45829 ) ) ( not ( = ?auto_45828 ?auto_45830 ) ) ( not ( = ?auto_45829 ?auto_45830 ) ) ( ON ?auto_45828 ?auto_45829 ) ( CLEAR ?auto_45826 ) ( ON ?auto_45827 ?auto_45828 ) ( CLEAR ?auto_45827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45822 ?auto_45823 ?auto_45824 ?auto_45825 ?auto_45826 ?auto_45827 )
      ( MAKE-8PILE ?auto_45822 ?auto_45823 ?auto_45824 ?auto_45825 ?auto_45826 ?auto_45827 ?auto_45828 ?auto_45829 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_45839 - BLOCK
      ?auto_45840 - BLOCK
      ?auto_45841 - BLOCK
      ?auto_45842 - BLOCK
      ?auto_45843 - BLOCK
      ?auto_45844 - BLOCK
      ?auto_45845 - BLOCK
      ?auto_45846 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45846 ) ( ON-TABLE ?auto_45839 ) ( ON ?auto_45840 ?auto_45839 ) ( ON ?auto_45841 ?auto_45840 ) ( ON ?auto_45842 ?auto_45841 ) ( ON ?auto_45843 ?auto_45842 ) ( not ( = ?auto_45839 ?auto_45840 ) ) ( not ( = ?auto_45839 ?auto_45841 ) ) ( not ( = ?auto_45839 ?auto_45842 ) ) ( not ( = ?auto_45839 ?auto_45843 ) ) ( not ( = ?auto_45839 ?auto_45844 ) ) ( not ( = ?auto_45839 ?auto_45845 ) ) ( not ( = ?auto_45839 ?auto_45846 ) ) ( not ( = ?auto_45840 ?auto_45841 ) ) ( not ( = ?auto_45840 ?auto_45842 ) ) ( not ( = ?auto_45840 ?auto_45843 ) ) ( not ( = ?auto_45840 ?auto_45844 ) ) ( not ( = ?auto_45840 ?auto_45845 ) ) ( not ( = ?auto_45840 ?auto_45846 ) ) ( not ( = ?auto_45841 ?auto_45842 ) ) ( not ( = ?auto_45841 ?auto_45843 ) ) ( not ( = ?auto_45841 ?auto_45844 ) ) ( not ( = ?auto_45841 ?auto_45845 ) ) ( not ( = ?auto_45841 ?auto_45846 ) ) ( not ( = ?auto_45842 ?auto_45843 ) ) ( not ( = ?auto_45842 ?auto_45844 ) ) ( not ( = ?auto_45842 ?auto_45845 ) ) ( not ( = ?auto_45842 ?auto_45846 ) ) ( not ( = ?auto_45843 ?auto_45844 ) ) ( not ( = ?auto_45843 ?auto_45845 ) ) ( not ( = ?auto_45843 ?auto_45846 ) ) ( not ( = ?auto_45844 ?auto_45845 ) ) ( not ( = ?auto_45844 ?auto_45846 ) ) ( not ( = ?auto_45845 ?auto_45846 ) ) ( ON ?auto_45845 ?auto_45846 ) ( CLEAR ?auto_45843 ) ( ON ?auto_45844 ?auto_45845 ) ( CLEAR ?auto_45844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45839 ?auto_45840 ?auto_45841 ?auto_45842 ?auto_45843 ?auto_45844 )
      ( MAKE-8PILE ?auto_45839 ?auto_45840 ?auto_45841 ?auto_45842 ?auto_45843 ?auto_45844 ?auto_45845 ?auto_45846 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_45855 - BLOCK
      ?auto_45856 - BLOCK
      ?auto_45857 - BLOCK
      ?auto_45858 - BLOCK
      ?auto_45859 - BLOCK
      ?auto_45860 - BLOCK
      ?auto_45861 - BLOCK
      ?auto_45862 - BLOCK
    )
    :vars
    (
      ?auto_45863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45862 ?auto_45863 ) ( ON-TABLE ?auto_45855 ) ( ON ?auto_45856 ?auto_45855 ) ( ON ?auto_45857 ?auto_45856 ) ( ON ?auto_45858 ?auto_45857 ) ( not ( = ?auto_45855 ?auto_45856 ) ) ( not ( = ?auto_45855 ?auto_45857 ) ) ( not ( = ?auto_45855 ?auto_45858 ) ) ( not ( = ?auto_45855 ?auto_45859 ) ) ( not ( = ?auto_45855 ?auto_45860 ) ) ( not ( = ?auto_45855 ?auto_45861 ) ) ( not ( = ?auto_45855 ?auto_45862 ) ) ( not ( = ?auto_45855 ?auto_45863 ) ) ( not ( = ?auto_45856 ?auto_45857 ) ) ( not ( = ?auto_45856 ?auto_45858 ) ) ( not ( = ?auto_45856 ?auto_45859 ) ) ( not ( = ?auto_45856 ?auto_45860 ) ) ( not ( = ?auto_45856 ?auto_45861 ) ) ( not ( = ?auto_45856 ?auto_45862 ) ) ( not ( = ?auto_45856 ?auto_45863 ) ) ( not ( = ?auto_45857 ?auto_45858 ) ) ( not ( = ?auto_45857 ?auto_45859 ) ) ( not ( = ?auto_45857 ?auto_45860 ) ) ( not ( = ?auto_45857 ?auto_45861 ) ) ( not ( = ?auto_45857 ?auto_45862 ) ) ( not ( = ?auto_45857 ?auto_45863 ) ) ( not ( = ?auto_45858 ?auto_45859 ) ) ( not ( = ?auto_45858 ?auto_45860 ) ) ( not ( = ?auto_45858 ?auto_45861 ) ) ( not ( = ?auto_45858 ?auto_45862 ) ) ( not ( = ?auto_45858 ?auto_45863 ) ) ( not ( = ?auto_45859 ?auto_45860 ) ) ( not ( = ?auto_45859 ?auto_45861 ) ) ( not ( = ?auto_45859 ?auto_45862 ) ) ( not ( = ?auto_45859 ?auto_45863 ) ) ( not ( = ?auto_45860 ?auto_45861 ) ) ( not ( = ?auto_45860 ?auto_45862 ) ) ( not ( = ?auto_45860 ?auto_45863 ) ) ( not ( = ?auto_45861 ?auto_45862 ) ) ( not ( = ?auto_45861 ?auto_45863 ) ) ( not ( = ?auto_45862 ?auto_45863 ) ) ( ON ?auto_45861 ?auto_45862 ) ( ON ?auto_45860 ?auto_45861 ) ( CLEAR ?auto_45858 ) ( ON ?auto_45859 ?auto_45860 ) ( CLEAR ?auto_45859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45855 ?auto_45856 ?auto_45857 ?auto_45858 ?auto_45859 )
      ( MAKE-8PILE ?auto_45855 ?auto_45856 ?auto_45857 ?auto_45858 ?auto_45859 ?auto_45860 ?auto_45861 ?auto_45862 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_45872 - BLOCK
      ?auto_45873 - BLOCK
      ?auto_45874 - BLOCK
      ?auto_45875 - BLOCK
      ?auto_45876 - BLOCK
      ?auto_45877 - BLOCK
      ?auto_45878 - BLOCK
      ?auto_45879 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45879 ) ( ON-TABLE ?auto_45872 ) ( ON ?auto_45873 ?auto_45872 ) ( ON ?auto_45874 ?auto_45873 ) ( ON ?auto_45875 ?auto_45874 ) ( not ( = ?auto_45872 ?auto_45873 ) ) ( not ( = ?auto_45872 ?auto_45874 ) ) ( not ( = ?auto_45872 ?auto_45875 ) ) ( not ( = ?auto_45872 ?auto_45876 ) ) ( not ( = ?auto_45872 ?auto_45877 ) ) ( not ( = ?auto_45872 ?auto_45878 ) ) ( not ( = ?auto_45872 ?auto_45879 ) ) ( not ( = ?auto_45873 ?auto_45874 ) ) ( not ( = ?auto_45873 ?auto_45875 ) ) ( not ( = ?auto_45873 ?auto_45876 ) ) ( not ( = ?auto_45873 ?auto_45877 ) ) ( not ( = ?auto_45873 ?auto_45878 ) ) ( not ( = ?auto_45873 ?auto_45879 ) ) ( not ( = ?auto_45874 ?auto_45875 ) ) ( not ( = ?auto_45874 ?auto_45876 ) ) ( not ( = ?auto_45874 ?auto_45877 ) ) ( not ( = ?auto_45874 ?auto_45878 ) ) ( not ( = ?auto_45874 ?auto_45879 ) ) ( not ( = ?auto_45875 ?auto_45876 ) ) ( not ( = ?auto_45875 ?auto_45877 ) ) ( not ( = ?auto_45875 ?auto_45878 ) ) ( not ( = ?auto_45875 ?auto_45879 ) ) ( not ( = ?auto_45876 ?auto_45877 ) ) ( not ( = ?auto_45876 ?auto_45878 ) ) ( not ( = ?auto_45876 ?auto_45879 ) ) ( not ( = ?auto_45877 ?auto_45878 ) ) ( not ( = ?auto_45877 ?auto_45879 ) ) ( not ( = ?auto_45878 ?auto_45879 ) ) ( ON ?auto_45878 ?auto_45879 ) ( ON ?auto_45877 ?auto_45878 ) ( CLEAR ?auto_45875 ) ( ON ?auto_45876 ?auto_45877 ) ( CLEAR ?auto_45876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45872 ?auto_45873 ?auto_45874 ?auto_45875 ?auto_45876 )
      ( MAKE-8PILE ?auto_45872 ?auto_45873 ?auto_45874 ?auto_45875 ?auto_45876 ?auto_45877 ?auto_45878 ?auto_45879 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_45888 - BLOCK
      ?auto_45889 - BLOCK
      ?auto_45890 - BLOCK
      ?auto_45891 - BLOCK
      ?auto_45892 - BLOCK
      ?auto_45893 - BLOCK
      ?auto_45894 - BLOCK
      ?auto_45895 - BLOCK
    )
    :vars
    (
      ?auto_45896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45895 ?auto_45896 ) ( ON-TABLE ?auto_45888 ) ( ON ?auto_45889 ?auto_45888 ) ( ON ?auto_45890 ?auto_45889 ) ( not ( = ?auto_45888 ?auto_45889 ) ) ( not ( = ?auto_45888 ?auto_45890 ) ) ( not ( = ?auto_45888 ?auto_45891 ) ) ( not ( = ?auto_45888 ?auto_45892 ) ) ( not ( = ?auto_45888 ?auto_45893 ) ) ( not ( = ?auto_45888 ?auto_45894 ) ) ( not ( = ?auto_45888 ?auto_45895 ) ) ( not ( = ?auto_45888 ?auto_45896 ) ) ( not ( = ?auto_45889 ?auto_45890 ) ) ( not ( = ?auto_45889 ?auto_45891 ) ) ( not ( = ?auto_45889 ?auto_45892 ) ) ( not ( = ?auto_45889 ?auto_45893 ) ) ( not ( = ?auto_45889 ?auto_45894 ) ) ( not ( = ?auto_45889 ?auto_45895 ) ) ( not ( = ?auto_45889 ?auto_45896 ) ) ( not ( = ?auto_45890 ?auto_45891 ) ) ( not ( = ?auto_45890 ?auto_45892 ) ) ( not ( = ?auto_45890 ?auto_45893 ) ) ( not ( = ?auto_45890 ?auto_45894 ) ) ( not ( = ?auto_45890 ?auto_45895 ) ) ( not ( = ?auto_45890 ?auto_45896 ) ) ( not ( = ?auto_45891 ?auto_45892 ) ) ( not ( = ?auto_45891 ?auto_45893 ) ) ( not ( = ?auto_45891 ?auto_45894 ) ) ( not ( = ?auto_45891 ?auto_45895 ) ) ( not ( = ?auto_45891 ?auto_45896 ) ) ( not ( = ?auto_45892 ?auto_45893 ) ) ( not ( = ?auto_45892 ?auto_45894 ) ) ( not ( = ?auto_45892 ?auto_45895 ) ) ( not ( = ?auto_45892 ?auto_45896 ) ) ( not ( = ?auto_45893 ?auto_45894 ) ) ( not ( = ?auto_45893 ?auto_45895 ) ) ( not ( = ?auto_45893 ?auto_45896 ) ) ( not ( = ?auto_45894 ?auto_45895 ) ) ( not ( = ?auto_45894 ?auto_45896 ) ) ( not ( = ?auto_45895 ?auto_45896 ) ) ( ON ?auto_45894 ?auto_45895 ) ( ON ?auto_45893 ?auto_45894 ) ( ON ?auto_45892 ?auto_45893 ) ( CLEAR ?auto_45890 ) ( ON ?auto_45891 ?auto_45892 ) ( CLEAR ?auto_45891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45888 ?auto_45889 ?auto_45890 ?auto_45891 )
      ( MAKE-8PILE ?auto_45888 ?auto_45889 ?auto_45890 ?auto_45891 ?auto_45892 ?auto_45893 ?auto_45894 ?auto_45895 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_45905 - BLOCK
      ?auto_45906 - BLOCK
      ?auto_45907 - BLOCK
      ?auto_45908 - BLOCK
      ?auto_45909 - BLOCK
      ?auto_45910 - BLOCK
      ?auto_45911 - BLOCK
      ?auto_45912 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45912 ) ( ON-TABLE ?auto_45905 ) ( ON ?auto_45906 ?auto_45905 ) ( ON ?auto_45907 ?auto_45906 ) ( not ( = ?auto_45905 ?auto_45906 ) ) ( not ( = ?auto_45905 ?auto_45907 ) ) ( not ( = ?auto_45905 ?auto_45908 ) ) ( not ( = ?auto_45905 ?auto_45909 ) ) ( not ( = ?auto_45905 ?auto_45910 ) ) ( not ( = ?auto_45905 ?auto_45911 ) ) ( not ( = ?auto_45905 ?auto_45912 ) ) ( not ( = ?auto_45906 ?auto_45907 ) ) ( not ( = ?auto_45906 ?auto_45908 ) ) ( not ( = ?auto_45906 ?auto_45909 ) ) ( not ( = ?auto_45906 ?auto_45910 ) ) ( not ( = ?auto_45906 ?auto_45911 ) ) ( not ( = ?auto_45906 ?auto_45912 ) ) ( not ( = ?auto_45907 ?auto_45908 ) ) ( not ( = ?auto_45907 ?auto_45909 ) ) ( not ( = ?auto_45907 ?auto_45910 ) ) ( not ( = ?auto_45907 ?auto_45911 ) ) ( not ( = ?auto_45907 ?auto_45912 ) ) ( not ( = ?auto_45908 ?auto_45909 ) ) ( not ( = ?auto_45908 ?auto_45910 ) ) ( not ( = ?auto_45908 ?auto_45911 ) ) ( not ( = ?auto_45908 ?auto_45912 ) ) ( not ( = ?auto_45909 ?auto_45910 ) ) ( not ( = ?auto_45909 ?auto_45911 ) ) ( not ( = ?auto_45909 ?auto_45912 ) ) ( not ( = ?auto_45910 ?auto_45911 ) ) ( not ( = ?auto_45910 ?auto_45912 ) ) ( not ( = ?auto_45911 ?auto_45912 ) ) ( ON ?auto_45911 ?auto_45912 ) ( ON ?auto_45910 ?auto_45911 ) ( ON ?auto_45909 ?auto_45910 ) ( CLEAR ?auto_45907 ) ( ON ?auto_45908 ?auto_45909 ) ( CLEAR ?auto_45908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45905 ?auto_45906 ?auto_45907 ?auto_45908 )
      ( MAKE-8PILE ?auto_45905 ?auto_45906 ?auto_45907 ?auto_45908 ?auto_45909 ?auto_45910 ?auto_45911 ?auto_45912 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_45921 - BLOCK
      ?auto_45922 - BLOCK
      ?auto_45923 - BLOCK
      ?auto_45924 - BLOCK
      ?auto_45925 - BLOCK
      ?auto_45926 - BLOCK
      ?auto_45927 - BLOCK
      ?auto_45928 - BLOCK
    )
    :vars
    (
      ?auto_45929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45928 ?auto_45929 ) ( ON-TABLE ?auto_45921 ) ( ON ?auto_45922 ?auto_45921 ) ( not ( = ?auto_45921 ?auto_45922 ) ) ( not ( = ?auto_45921 ?auto_45923 ) ) ( not ( = ?auto_45921 ?auto_45924 ) ) ( not ( = ?auto_45921 ?auto_45925 ) ) ( not ( = ?auto_45921 ?auto_45926 ) ) ( not ( = ?auto_45921 ?auto_45927 ) ) ( not ( = ?auto_45921 ?auto_45928 ) ) ( not ( = ?auto_45921 ?auto_45929 ) ) ( not ( = ?auto_45922 ?auto_45923 ) ) ( not ( = ?auto_45922 ?auto_45924 ) ) ( not ( = ?auto_45922 ?auto_45925 ) ) ( not ( = ?auto_45922 ?auto_45926 ) ) ( not ( = ?auto_45922 ?auto_45927 ) ) ( not ( = ?auto_45922 ?auto_45928 ) ) ( not ( = ?auto_45922 ?auto_45929 ) ) ( not ( = ?auto_45923 ?auto_45924 ) ) ( not ( = ?auto_45923 ?auto_45925 ) ) ( not ( = ?auto_45923 ?auto_45926 ) ) ( not ( = ?auto_45923 ?auto_45927 ) ) ( not ( = ?auto_45923 ?auto_45928 ) ) ( not ( = ?auto_45923 ?auto_45929 ) ) ( not ( = ?auto_45924 ?auto_45925 ) ) ( not ( = ?auto_45924 ?auto_45926 ) ) ( not ( = ?auto_45924 ?auto_45927 ) ) ( not ( = ?auto_45924 ?auto_45928 ) ) ( not ( = ?auto_45924 ?auto_45929 ) ) ( not ( = ?auto_45925 ?auto_45926 ) ) ( not ( = ?auto_45925 ?auto_45927 ) ) ( not ( = ?auto_45925 ?auto_45928 ) ) ( not ( = ?auto_45925 ?auto_45929 ) ) ( not ( = ?auto_45926 ?auto_45927 ) ) ( not ( = ?auto_45926 ?auto_45928 ) ) ( not ( = ?auto_45926 ?auto_45929 ) ) ( not ( = ?auto_45927 ?auto_45928 ) ) ( not ( = ?auto_45927 ?auto_45929 ) ) ( not ( = ?auto_45928 ?auto_45929 ) ) ( ON ?auto_45927 ?auto_45928 ) ( ON ?auto_45926 ?auto_45927 ) ( ON ?auto_45925 ?auto_45926 ) ( ON ?auto_45924 ?auto_45925 ) ( CLEAR ?auto_45922 ) ( ON ?auto_45923 ?auto_45924 ) ( CLEAR ?auto_45923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45921 ?auto_45922 ?auto_45923 )
      ( MAKE-8PILE ?auto_45921 ?auto_45922 ?auto_45923 ?auto_45924 ?auto_45925 ?auto_45926 ?auto_45927 ?auto_45928 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_45938 - BLOCK
      ?auto_45939 - BLOCK
      ?auto_45940 - BLOCK
      ?auto_45941 - BLOCK
      ?auto_45942 - BLOCK
      ?auto_45943 - BLOCK
      ?auto_45944 - BLOCK
      ?auto_45945 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45945 ) ( ON-TABLE ?auto_45938 ) ( ON ?auto_45939 ?auto_45938 ) ( not ( = ?auto_45938 ?auto_45939 ) ) ( not ( = ?auto_45938 ?auto_45940 ) ) ( not ( = ?auto_45938 ?auto_45941 ) ) ( not ( = ?auto_45938 ?auto_45942 ) ) ( not ( = ?auto_45938 ?auto_45943 ) ) ( not ( = ?auto_45938 ?auto_45944 ) ) ( not ( = ?auto_45938 ?auto_45945 ) ) ( not ( = ?auto_45939 ?auto_45940 ) ) ( not ( = ?auto_45939 ?auto_45941 ) ) ( not ( = ?auto_45939 ?auto_45942 ) ) ( not ( = ?auto_45939 ?auto_45943 ) ) ( not ( = ?auto_45939 ?auto_45944 ) ) ( not ( = ?auto_45939 ?auto_45945 ) ) ( not ( = ?auto_45940 ?auto_45941 ) ) ( not ( = ?auto_45940 ?auto_45942 ) ) ( not ( = ?auto_45940 ?auto_45943 ) ) ( not ( = ?auto_45940 ?auto_45944 ) ) ( not ( = ?auto_45940 ?auto_45945 ) ) ( not ( = ?auto_45941 ?auto_45942 ) ) ( not ( = ?auto_45941 ?auto_45943 ) ) ( not ( = ?auto_45941 ?auto_45944 ) ) ( not ( = ?auto_45941 ?auto_45945 ) ) ( not ( = ?auto_45942 ?auto_45943 ) ) ( not ( = ?auto_45942 ?auto_45944 ) ) ( not ( = ?auto_45942 ?auto_45945 ) ) ( not ( = ?auto_45943 ?auto_45944 ) ) ( not ( = ?auto_45943 ?auto_45945 ) ) ( not ( = ?auto_45944 ?auto_45945 ) ) ( ON ?auto_45944 ?auto_45945 ) ( ON ?auto_45943 ?auto_45944 ) ( ON ?auto_45942 ?auto_45943 ) ( ON ?auto_45941 ?auto_45942 ) ( CLEAR ?auto_45939 ) ( ON ?auto_45940 ?auto_45941 ) ( CLEAR ?auto_45940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45938 ?auto_45939 ?auto_45940 )
      ( MAKE-8PILE ?auto_45938 ?auto_45939 ?auto_45940 ?auto_45941 ?auto_45942 ?auto_45943 ?auto_45944 ?auto_45945 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_45954 - BLOCK
      ?auto_45955 - BLOCK
      ?auto_45956 - BLOCK
      ?auto_45957 - BLOCK
      ?auto_45958 - BLOCK
      ?auto_45959 - BLOCK
      ?auto_45960 - BLOCK
      ?auto_45961 - BLOCK
    )
    :vars
    (
      ?auto_45962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45961 ?auto_45962 ) ( ON-TABLE ?auto_45954 ) ( not ( = ?auto_45954 ?auto_45955 ) ) ( not ( = ?auto_45954 ?auto_45956 ) ) ( not ( = ?auto_45954 ?auto_45957 ) ) ( not ( = ?auto_45954 ?auto_45958 ) ) ( not ( = ?auto_45954 ?auto_45959 ) ) ( not ( = ?auto_45954 ?auto_45960 ) ) ( not ( = ?auto_45954 ?auto_45961 ) ) ( not ( = ?auto_45954 ?auto_45962 ) ) ( not ( = ?auto_45955 ?auto_45956 ) ) ( not ( = ?auto_45955 ?auto_45957 ) ) ( not ( = ?auto_45955 ?auto_45958 ) ) ( not ( = ?auto_45955 ?auto_45959 ) ) ( not ( = ?auto_45955 ?auto_45960 ) ) ( not ( = ?auto_45955 ?auto_45961 ) ) ( not ( = ?auto_45955 ?auto_45962 ) ) ( not ( = ?auto_45956 ?auto_45957 ) ) ( not ( = ?auto_45956 ?auto_45958 ) ) ( not ( = ?auto_45956 ?auto_45959 ) ) ( not ( = ?auto_45956 ?auto_45960 ) ) ( not ( = ?auto_45956 ?auto_45961 ) ) ( not ( = ?auto_45956 ?auto_45962 ) ) ( not ( = ?auto_45957 ?auto_45958 ) ) ( not ( = ?auto_45957 ?auto_45959 ) ) ( not ( = ?auto_45957 ?auto_45960 ) ) ( not ( = ?auto_45957 ?auto_45961 ) ) ( not ( = ?auto_45957 ?auto_45962 ) ) ( not ( = ?auto_45958 ?auto_45959 ) ) ( not ( = ?auto_45958 ?auto_45960 ) ) ( not ( = ?auto_45958 ?auto_45961 ) ) ( not ( = ?auto_45958 ?auto_45962 ) ) ( not ( = ?auto_45959 ?auto_45960 ) ) ( not ( = ?auto_45959 ?auto_45961 ) ) ( not ( = ?auto_45959 ?auto_45962 ) ) ( not ( = ?auto_45960 ?auto_45961 ) ) ( not ( = ?auto_45960 ?auto_45962 ) ) ( not ( = ?auto_45961 ?auto_45962 ) ) ( ON ?auto_45960 ?auto_45961 ) ( ON ?auto_45959 ?auto_45960 ) ( ON ?auto_45958 ?auto_45959 ) ( ON ?auto_45957 ?auto_45958 ) ( ON ?auto_45956 ?auto_45957 ) ( CLEAR ?auto_45954 ) ( ON ?auto_45955 ?auto_45956 ) ( CLEAR ?auto_45955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45954 ?auto_45955 )
      ( MAKE-8PILE ?auto_45954 ?auto_45955 ?auto_45956 ?auto_45957 ?auto_45958 ?auto_45959 ?auto_45960 ?auto_45961 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_45971 - BLOCK
      ?auto_45972 - BLOCK
      ?auto_45973 - BLOCK
      ?auto_45974 - BLOCK
      ?auto_45975 - BLOCK
      ?auto_45976 - BLOCK
      ?auto_45977 - BLOCK
      ?auto_45978 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45978 ) ( ON-TABLE ?auto_45971 ) ( not ( = ?auto_45971 ?auto_45972 ) ) ( not ( = ?auto_45971 ?auto_45973 ) ) ( not ( = ?auto_45971 ?auto_45974 ) ) ( not ( = ?auto_45971 ?auto_45975 ) ) ( not ( = ?auto_45971 ?auto_45976 ) ) ( not ( = ?auto_45971 ?auto_45977 ) ) ( not ( = ?auto_45971 ?auto_45978 ) ) ( not ( = ?auto_45972 ?auto_45973 ) ) ( not ( = ?auto_45972 ?auto_45974 ) ) ( not ( = ?auto_45972 ?auto_45975 ) ) ( not ( = ?auto_45972 ?auto_45976 ) ) ( not ( = ?auto_45972 ?auto_45977 ) ) ( not ( = ?auto_45972 ?auto_45978 ) ) ( not ( = ?auto_45973 ?auto_45974 ) ) ( not ( = ?auto_45973 ?auto_45975 ) ) ( not ( = ?auto_45973 ?auto_45976 ) ) ( not ( = ?auto_45973 ?auto_45977 ) ) ( not ( = ?auto_45973 ?auto_45978 ) ) ( not ( = ?auto_45974 ?auto_45975 ) ) ( not ( = ?auto_45974 ?auto_45976 ) ) ( not ( = ?auto_45974 ?auto_45977 ) ) ( not ( = ?auto_45974 ?auto_45978 ) ) ( not ( = ?auto_45975 ?auto_45976 ) ) ( not ( = ?auto_45975 ?auto_45977 ) ) ( not ( = ?auto_45975 ?auto_45978 ) ) ( not ( = ?auto_45976 ?auto_45977 ) ) ( not ( = ?auto_45976 ?auto_45978 ) ) ( not ( = ?auto_45977 ?auto_45978 ) ) ( ON ?auto_45977 ?auto_45978 ) ( ON ?auto_45976 ?auto_45977 ) ( ON ?auto_45975 ?auto_45976 ) ( ON ?auto_45974 ?auto_45975 ) ( ON ?auto_45973 ?auto_45974 ) ( CLEAR ?auto_45971 ) ( ON ?auto_45972 ?auto_45973 ) ( CLEAR ?auto_45972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45971 ?auto_45972 )
      ( MAKE-8PILE ?auto_45971 ?auto_45972 ?auto_45973 ?auto_45974 ?auto_45975 ?auto_45976 ?auto_45977 ?auto_45978 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_45987 - BLOCK
      ?auto_45988 - BLOCK
      ?auto_45989 - BLOCK
      ?auto_45990 - BLOCK
      ?auto_45991 - BLOCK
      ?auto_45992 - BLOCK
      ?auto_45993 - BLOCK
      ?auto_45994 - BLOCK
    )
    :vars
    (
      ?auto_45995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45994 ?auto_45995 ) ( not ( = ?auto_45987 ?auto_45988 ) ) ( not ( = ?auto_45987 ?auto_45989 ) ) ( not ( = ?auto_45987 ?auto_45990 ) ) ( not ( = ?auto_45987 ?auto_45991 ) ) ( not ( = ?auto_45987 ?auto_45992 ) ) ( not ( = ?auto_45987 ?auto_45993 ) ) ( not ( = ?auto_45987 ?auto_45994 ) ) ( not ( = ?auto_45987 ?auto_45995 ) ) ( not ( = ?auto_45988 ?auto_45989 ) ) ( not ( = ?auto_45988 ?auto_45990 ) ) ( not ( = ?auto_45988 ?auto_45991 ) ) ( not ( = ?auto_45988 ?auto_45992 ) ) ( not ( = ?auto_45988 ?auto_45993 ) ) ( not ( = ?auto_45988 ?auto_45994 ) ) ( not ( = ?auto_45988 ?auto_45995 ) ) ( not ( = ?auto_45989 ?auto_45990 ) ) ( not ( = ?auto_45989 ?auto_45991 ) ) ( not ( = ?auto_45989 ?auto_45992 ) ) ( not ( = ?auto_45989 ?auto_45993 ) ) ( not ( = ?auto_45989 ?auto_45994 ) ) ( not ( = ?auto_45989 ?auto_45995 ) ) ( not ( = ?auto_45990 ?auto_45991 ) ) ( not ( = ?auto_45990 ?auto_45992 ) ) ( not ( = ?auto_45990 ?auto_45993 ) ) ( not ( = ?auto_45990 ?auto_45994 ) ) ( not ( = ?auto_45990 ?auto_45995 ) ) ( not ( = ?auto_45991 ?auto_45992 ) ) ( not ( = ?auto_45991 ?auto_45993 ) ) ( not ( = ?auto_45991 ?auto_45994 ) ) ( not ( = ?auto_45991 ?auto_45995 ) ) ( not ( = ?auto_45992 ?auto_45993 ) ) ( not ( = ?auto_45992 ?auto_45994 ) ) ( not ( = ?auto_45992 ?auto_45995 ) ) ( not ( = ?auto_45993 ?auto_45994 ) ) ( not ( = ?auto_45993 ?auto_45995 ) ) ( not ( = ?auto_45994 ?auto_45995 ) ) ( ON ?auto_45993 ?auto_45994 ) ( ON ?auto_45992 ?auto_45993 ) ( ON ?auto_45991 ?auto_45992 ) ( ON ?auto_45990 ?auto_45991 ) ( ON ?auto_45989 ?auto_45990 ) ( ON ?auto_45988 ?auto_45989 ) ( ON ?auto_45987 ?auto_45988 ) ( CLEAR ?auto_45987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45987 )
      ( MAKE-8PILE ?auto_45987 ?auto_45988 ?auto_45989 ?auto_45990 ?auto_45991 ?auto_45992 ?auto_45993 ?auto_45994 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_46004 - BLOCK
      ?auto_46005 - BLOCK
      ?auto_46006 - BLOCK
      ?auto_46007 - BLOCK
      ?auto_46008 - BLOCK
      ?auto_46009 - BLOCK
      ?auto_46010 - BLOCK
      ?auto_46011 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46011 ) ( not ( = ?auto_46004 ?auto_46005 ) ) ( not ( = ?auto_46004 ?auto_46006 ) ) ( not ( = ?auto_46004 ?auto_46007 ) ) ( not ( = ?auto_46004 ?auto_46008 ) ) ( not ( = ?auto_46004 ?auto_46009 ) ) ( not ( = ?auto_46004 ?auto_46010 ) ) ( not ( = ?auto_46004 ?auto_46011 ) ) ( not ( = ?auto_46005 ?auto_46006 ) ) ( not ( = ?auto_46005 ?auto_46007 ) ) ( not ( = ?auto_46005 ?auto_46008 ) ) ( not ( = ?auto_46005 ?auto_46009 ) ) ( not ( = ?auto_46005 ?auto_46010 ) ) ( not ( = ?auto_46005 ?auto_46011 ) ) ( not ( = ?auto_46006 ?auto_46007 ) ) ( not ( = ?auto_46006 ?auto_46008 ) ) ( not ( = ?auto_46006 ?auto_46009 ) ) ( not ( = ?auto_46006 ?auto_46010 ) ) ( not ( = ?auto_46006 ?auto_46011 ) ) ( not ( = ?auto_46007 ?auto_46008 ) ) ( not ( = ?auto_46007 ?auto_46009 ) ) ( not ( = ?auto_46007 ?auto_46010 ) ) ( not ( = ?auto_46007 ?auto_46011 ) ) ( not ( = ?auto_46008 ?auto_46009 ) ) ( not ( = ?auto_46008 ?auto_46010 ) ) ( not ( = ?auto_46008 ?auto_46011 ) ) ( not ( = ?auto_46009 ?auto_46010 ) ) ( not ( = ?auto_46009 ?auto_46011 ) ) ( not ( = ?auto_46010 ?auto_46011 ) ) ( ON ?auto_46010 ?auto_46011 ) ( ON ?auto_46009 ?auto_46010 ) ( ON ?auto_46008 ?auto_46009 ) ( ON ?auto_46007 ?auto_46008 ) ( ON ?auto_46006 ?auto_46007 ) ( ON ?auto_46005 ?auto_46006 ) ( ON ?auto_46004 ?auto_46005 ) ( CLEAR ?auto_46004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46004 )
      ( MAKE-8PILE ?auto_46004 ?auto_46005 ?auto_46006 ?auto_46007 ?auto_46008 ?auto_46009 ?auto_46010 ?auto_46011 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_46020 - BLOCK
      ?auto_46021 - BLOCK
      ?auto_46022 - BLOCK
      ?auto_46023 - BLOCK
      ?auto_46024 - BLOCK
      ?auto_46025 - BLOCK
      ?auto_46026 - BLOCK
      ?auto_46027 - BLOCK
    )
    :vars
    (
      ?auto_46028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46020 ?auto_46021 ) ) ( not ( = ?auto_46020 ?auto_46022 ) ) ( not ( = ?auto_46020 ?auto_46023 ) ) ( not ( = ?auto_46020 ?auto_46024 ) ) ( not ( = ?auto_46020 ?auto_46025 ) ) ( not ( = ?auto_46020 ?auto_46026 ) ) ( not ( = ?auto_46020 ?auto_46027 ) ) ( not ( = ?auto_46021 ?auto_46022 ) ) ( not ( = ?auto_46021 ?auto_46023 ) ) ( not ( = ?auto_46021 ?auto_46024 ) ) ( not ( = ?auto_46021 ?auto_46025 ) ) ( not ( = ?auto_46021 ?auto_46026 ) ) ( not ( = ?auto_46021 ?auto_46027 ) ) ( not ( = ?auto_46022 ?auto_46023 ) ) ( not ( = ?auto_46022 ?auto_46024 ) ) ( not ( = ?auto_46022 ?auto_46025 ) ) ( not ( = ?auto_46022 ?auto_46026 ) ) ( not ( = ?auto_46022 ?auto_46027 ) ) ( not ( = ?auto_46023 ?auto_46024 ) ) ( not ( = ?auto_46023 ?auto_46025 ) ) ( not ( = ?auto_46023 ?auto_46026 ) ) ( not ( = ?auto_46023 ?auto_46027 ) ) ( not ( = ?auto_46024 ?auto_46025 ) ) ( not ( = ?auto_46024 ?auto_46026 ) ) ( not ( = ?auto_46024 ?auto_46027 ) ) ( not ( = ?auto_46025 ?auto_46026 ) ) ( not ( = ?auto_46025 ?auto_46027 ) ) ( not ( = ?auto_46026 ?auto_46027 ) ) ( ON ?auto_46020 ?auto_46028 ) ( not ( = ?auto_46027 ?auto_46028 ) ) ( not ( = ?auto_46026 ?auto_46028 ) ) ( not ( = ?auto_46025 ?auto_46028 ) ) ( not ( = ?auto_46024 ?auto_46028 ) ) ( not ( = ?auto_46023 ?auto_46028 ) ) ( not ( = ?auto_46022 ?auto_46028 ) ) ( not ( = ?auto_46021 ?auto_46028 ) ) ( not ( = ?auto_46020 ?auto_46028 ) ) ( ON ?auto_46021 ?auto_46020 ) ( ON ?auto_46022 ?auto_46021 ) ( ON ?auto_46023 ?auto_46022 ) ( ON ?auto_46024 ?auto_46023 ) ( ON ?auto_46025 ?auto_46024 ) ( ON ?auto_46026 ?auto_46025 ) ( ON ?auto_46027 ?auto_46026 ) ( CLEAR ?auto_46027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_46027 ?auto_46026 ?auto_46025 ?auto_46024 ?auto_46023 ?auto_46022 ?auto_46021 ?auto_46020 )
      ( MAKE-8PILE ?auto_46020 ?auto_46021 ?auto_46022 ?auto_46023 ?auto_46024 ?auto_46025 ?auto_46026 ?auto_46027 ) )
  )

)

