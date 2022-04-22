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
      ?auto_197174 - BLOCK
    )
    :vars
    (
      ?auto_197175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197174 ?auto_197175 ) ( CLEAR ?auto_197174 ) ( HAND-EMPTY ) ( not ( = ?auto_197174 ?auto_197175 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_197174 ?auto_197175 )
      ( !PUTDOWN ?auto_197174 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197177 - BLOCK
    )
    :vars
    (
      ?auto_197178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197177 ?auto_197178 ) ( CLEAR ?auto_197177 ) ( HAND-EMPTY ) ( not ( = ?auto_197177 ?auto_197178 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_197177 ?auto_197178 )
      ( !PUTDOWN ?auto_197177 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_197181 - BLOCK
      ?auto_197182 - BLOCK
    )
    :vars
    (
      ?auto_197183 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_197181 ) ( ON ?auto_197182 ?auto_197183 ) ( CLEAR ?auto_197182 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_197181 ) ( not ( = ?auto_197181 ?auto_197182 ) ) ( not ( = ?auto_197181 ?auto_197183 ) ) ( not ( = ?auto_197182 ?auto_197183 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_197182 ?auto_197183 )
      ( !STACK ?auto_197182 ?auto_197181 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_197186 - BLOCK
      ?auto_197187 - BLOCK
    )
    :vars
    (
      ?auto_197188 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_197186 ) ( ON ?auto_197187 ?auto_197188 ) ( CLEAR ?auto_197187 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_197186 ) ( not ( = ?auto_197186 ?auto_197187 ) ) ( not ( = ?auto_197186 ?auto_197188 ) ) ( not ( = ?auto_197187 ?auto_197188 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_197187 ?auto_197188 )
      ( !STACK ?auto_197187 ?auto_197186 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_197191 - BLOCK
      ?auto_197192 - BLOCK
    )
    :vars
    (
      ?auto_197193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197192 ?auto_197193 ) ( not ( = ?auto_197191 ?auto_197192 ) ) ( not ( = ?auto_197191 ?auto_197193 ) ) ( not ( = ?auto_197192 ?auto_197193 ) ) ( ON ?auto_197191 ?auto_197192 ) ( CLEAR ?auto_197191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_197191 )
      ( MAKE-2PILE ?auto_197191 ?auto_197192 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_197196 - BLOCK
      ?auto_197197 - BLOCK
    )
    :vars
    (
      ?auto_197198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197197 ?auto_197198 ) ( not ( = ?auto_197196 ?auto_197197 ) ) ( not ( = ?auto_197196 ?auto_197198 ) ) ( not ( = ?auto_197197 ?auto_197198 ) ) ( ON ?auto_197196 ?auto_197197 ) ( CLEAR ?auto_197196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_197196 )
      ( MAKE-2PILE ?auto_197196 ?auto_197197 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_197202 - BLOCK
      ?auto_197203 - BLOCK
      ?auto_197204 - BLOCK
    )
    :vars
    (
      ?auto_197205 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_197203 ) ( ON ?auto_197204 ?auto_197205 ) ( CLEAR ?auto_197204 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_197202 ) ( ON ?auto_197203 ?auto_197202 ) ( not ( = ?auto_197202 ?auto_197203 ) ) ( not ( = ?auto_197202 ?auto_197204 ) ) ( not ( = ?auto_197202 ?auto_197205 ) ) ( not ( = ?auto_197203 ?auto_197204 ) ) ( not ( = ?auto_197203 ?auto_197205 ) ) ( not ( = ?auto_197204 ?auto_197205 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_197204 ?auto_197205 )
      ( !STACK ?auto_197204 ?auto_197203 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_197209 - BLOCK
      ?auto_197210 - BLOCK
      ?auto_197211 - BLOCK
    )
    :vars
    (
      ?auto_197212 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_197210 ) ( ON ?auto_197211 ?auto_197212 ) ( CLEAR ?auto_197211 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_197209 ) ( ON ?auto_197210 ?auto_197209 ) ( not ( = ?auto_197209 ?auto_197210 ) ) ( not ( = ?auto_197209 ?auto_197211 ) ) ( not ( = ?auto_197209 ?auto_197212 ) ) ( not ( = ?auto_197210 ?auto_197211 ) ) ( not ( = ?auto_197210 ?auto_197212 ) ) ( not ( = ?auto_197211 ?auto_197212 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_197211 ?auto_197212 )
      ( !STACK ?auto_197211 ?auto_197210 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_197216 - BLOCK
      ?auto_197217 - BLOCK
      ?auto_197218 - BLOCK
    )
    :vars
    (
      ?auto_197219 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197218 ?auto_197219 ) ( ON-TABLE ?auto_197216 ) ( not ( = ?auto_197216 ?auto_197217 ) ) ( not ( = ?auto_197216 ?auto_197218 ) ) ( not ( = ?auto_197216 ?auto_197219 ) ) ( not ( = ?auto_197217 ?auto_197218 ) ) ( not ( = ?auto_197217 ?auto_197219 ) ) ( not ( = ?auto_197218 ?auto_197219 ) ) ( CLEAR ?auto_197216 ) ( ON ?auto_197217 ?auto_197218 ) ( CLEAR ?auto_197217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_197216 ?auto_197217 )
      ( MAKE-3PILE ?auto_197216 ?auto_197217 ?auto_197218 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_197223 - BLOCK
      ?auto_197224 - BLOCK
      ?auto_197225 - BLOCK
    )
    :vars
    (
      ?auto_197226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197225 ?auto_197226 ) ( ON-TABLE ?auto_197223 ) ( not ( = ?auto_197223 ?auto_197224 ) ) ( not ( = ?auto_197223 ?auto_197225 ) ) ( not ( = ?auto_197223 ?auto_197226 ) ) ( not ( = ?auto_197224 ?auto_197225 ) ) ( not ( = ?auto_197224 ?auto_197226 ) ) ( not ( = ?auto_197225 ?auto_197226 ) ) ( CLEAR ?auto_197223 ) ( ON ?auto_197224 ?auto_197225 ) ( CLEAR ?auto_197224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_197223 ?auto_197224 )
      ( MAKE-3PILE ?auto_197223 ?auto_197224 ?auto_197225 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_197230 - BLOCK
      ?auto_197231 - BLOCK
      ?auto_197232 - BLOCK
    )
    :vars
    (
      ?auto_197233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197232 ?auto_197233 ) ( not ( = ?auto_197230 ?auto_197231 ) ) ( not ( = ?auto_197230 ?auto_197232 ) ) ( not ( = ?auto_197230 ?auto_197233 ) ) ( not ( = ?auto_197231 ?auto_197232 ) ) ( not ( = ?auto_197231 ?auto_197233 ) ) ( not ( = ?auto_197232 ?auto_197233 ) ) ( ON ?auto_197231 ?auto_197232 ) ( ON ?auto_197230 ?auto_197231 ) ( CLEAR ?auto_197230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_197230 )
      ( MAKE-3PILE ?auto_197230 ?auto_197231 ?auto_197232 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_197237 - BLOCK
      ?auto_197238 - BLOCK
      ?auto_197239 - BLOCK
    )
    :vars
    (
      ?auto_197240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197239 ?auto_197240 ) ( not ( = ?auto_197237 ?auto_197238 ) ) ( not ( = ?auto_197237 ?auto_197239 ) ) ( not ( = ?auto_197237 ?auto_197240 ) ) ( not ( = ?auto_197238 ?auto_197239 ) ) ( not ( = ?auto_197238 ?auto_197240 ) ) ( not ( = ?auto_197239 ?auto_197240 ) ) ( ON ?auto_197238 ?auto_197239 ) ( ON ?auto_197237 ?auto_197238 ) ( CLEAR ?auto_197237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_197237 )
      ( MAKE-3PILE ?auto_197237 ?auto_197238 ?auto_197239 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_197245 - BLOCK
      ?auto_197246 - BLOCK
      ?auto_197247 - BLOCK
      ?auto_197248 - BLOCK
    )
    :vars
    (
      ?auto_197249 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_197247 ) ( ON ?auto_197248 ?auto_197249 ) ( CLEAR ?auto_197248 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_197245 ) ( ON ?auto_197246 ?auto_197245 ) ( ON ?auto_197247 ?auto_197246 ) ( not ( = ?auto_197245 ?auto_197246 ) ) ( not ( = ?auto_197245 ?auto_197247 ) ) ( not ( = ?auto_197245 ?auto_197248 ) ) ( not ( = ?auto_197245 ?auto_197249 ) ) ( not ( = ?auto_197246 ?auto_197247 ) ) ( not ( = ?auto_197246 ?auto_197248 ) ) ( not ( = ?auto_197246 ?auto_197249 ) ) ( not ( = ?auto_197247 ?auto_197248 ) ) ( not ( = ?auto_197247 ?auto_197249 ) ) ( not ( = ?auto_197248 ?auto_197249 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_197248 ?auto_197249 )
      ( !STACK ?auto_197248 ?auto_197247 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_197254 - BLOCK
      ?auto_197255 - BLOCK
      ?auto_197256 - BLOCK
      ?auto_197257 - BLOCK
    )
    :vars
    (
      ?auto_197258 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_197256 ) ( ON ?auto_197257 ?auto_197258 ) ( CLEAR ?auto_197257 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_197254 ) ( ON ?auto_197255 ?auto_197254 ) ( ON ?auto_197256 ?auto_197255 ) ( not ( = ?auto_197254 ?auto_197255 ) ) ( not ( = ?auto_197254 ?auto_197256 ) ) ( not ( = ?auto_197254 ?auto_197257 ) ) ( not ( = ?auto_197254 ?auto_197258 ) ) ( not ( = ?auto_197255 ?auto_197256 ) ) ( not ( = ?auto_197255 ?auto_197257 ) ) ( not ( = ?auto_197255 ?auto_197258 ) ) ( not ( = ?auto_197256 ?auto_197257 ) ) ( not ( = ?auto_197256 ?auto_197258 ) ) ( not ( = ?auto_197257 ?auto_197258 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_197257 ?auto_197258 )
      ( !STACK ?auto_197257 ?auto_197256 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_197263 - BLOCK
      ?auto_197264 - BLOCK
      ?auto_197265 - BLOCK
      ?auto_197266 - BLOCK
    )
    :vars
    (
      ?auto_197267 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197266 ?auto_197267 ) ( ON-TABLE ?auto_197263 ) ( ON ?auto_197264 ?auto_197263 ) ( not ( = ?auto_197263 ?auto_197264 ) ) ( not ( = ?auto_197263 ?auto_197265 ) ) ( not ( = ?auto_197263 ?auto_197266 ) ) ( not ( = ?auto_197263 ?auto_197267 ) ) ( not ( = ?auto_197264 ?auto_197265 ) ) ( not ( = ?auto_197264 ?auto_197266 ) ) ( not ( = ?auto_197264 ?auto_197267 ) ) ( not ( = ?auto_197265 ?auto_197266 ) ) ( not ( = ?auto_197265 ?auto_197267 ) ) ( not ( = ?auto_197266 ?auto_197267 ) ) ( CLEAR ?auto_197264 ) ( ON ?auto_197265 ?auto_197266 ) ( CLEAR ?auto_197265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_197263 ?auto_197264 ?auto_197265 )
      ( MAKE-4PILE ?auto_197263 ?auto_197264 ?auto_197265 ?auto_197266 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_197272 - BLOCK
      ?auto_197273 - BLOCK
      ?auto_197274 - BLOCK
      ?auto_197275 - BLOCK
    )
    :vars
    (
      ?auto_197276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197275 ?auto_197276 ) ( ON-TABLE ?auto_197272 ) ( ON ?auto_197273 ?auto_197272 ) ( not ( = ?auto_197272 ?auto_197273 ) ) ( not ( = ?auto_197272 ?auto_197274 ) ) ( not ( = ?auto_197272 ?auto_197275 ) ) ( not ( = ?auto_197272 ?auto_197276 ) ) ( not ( = ?auto_197273 ?auto_197274 ) ) ( not ( = ?auto_197273 ?auto_197275 ) ) ( not ( = ?auto_197273 ?auto_197276 ) ) ( not ( = ?auto_197274 ?auto_197275 ) ) ( not ( = ?auto_197274 ?auto_197276 ) ) ( not ( = ?auto_197275 ?auto_197276 ) ) ( CLEAR ?auto_197273 ) ( ON ?auto_197274 ?auto_197275 ) ( CLEAR ?auto_197274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_197272 ?auto_197273 ?auto_197274 )
      ( MAKE-4PILE ?auto_197272 ?auto_197273 ?auto_197274 ?auto_197275 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_197281 - BLOCK
      ?auto_197282 - BLOCK
      ?auto_197283 - BLOCK
      ?auto_197284 - BLOCK
    )
    :vars
    (
      ?auto_197285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197284 ?auto_197285 ) ( ON-TABLE ?auto_197281 ) ( not ( = ?auto_197281 ?auto_197282 ) ) ( not ( = ?auto_197281 ?auto_197283 ) ) ( not ( = ?auto_197281 ?auto_197284 ) ) ( not ( = ?auto_197281 ?auto_197285 ) ) ( not ( = ?auto_197282 ?auto_197283 ) ) ( not ( = ?auto_197282 ?auto_197284 ) ) ( not ( = ?auto_197282 ?auto_197285 ) ) ( not ( = ?auto_197283 ?auto_197284 ) ) ( not ( = ?auto_197283 ?auto_197285 ) ) ( not ( = ?auto_197284 ?auto_197285 ) ) ( ON ?auto_197283 ?auto_197284 ) ( CLEAR ?auto_197281 ) ( ON ?auto_197282 ?auto_197283 ) ( CLEAR ?auto_197282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_197281 ?auto_197282 )
      ( MAKE-4PILE ?auto_197281 ?auto_197282 ?auto_197283 ?auto_197284 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_197290 - BLOCK
      ?auto_197291 - BLOCK
      ?auto_197292 - BLOCK
      ?auto_197293 - BLOCK
    )
    :vars
    (
      ?auto_197294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197293 ?auto_197294 ) ( ON-TABLE ?auto_197290 ) ( not ( = ?auto_197290 ?auto_197291 ) ) ( not ( = ?auto_197290 ?auto_197292 ) ) ( not ( = ?auto_197290 ?auto_197293 ) ) ( not ( = ?auto_197290 ?auto_197294 ) ) ( not ( = ?auto_197291 ?auto_197292 ) ) ( not ( = ?auto_197291 ?auto_197293 ) ) ( not ( = ?auto_197291 ?auto_197294 ) ) ( not ( = ?auto_197292 ?auto_197293 ) ) ( not ( = ?auto_197292 ?auto_197294 ) ) ( not ( = ?auto_197293 ?auto_197294 ) ) ( ON ?auto_197292 ?auto_197293 ) ( CLEAR ?auto_197290 ) ( ON ?auto_197291 ?auto_197292 ) ( CLEAR ?auto_197291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_197290 ?auto_197291 )
      ( MAKE-4PILE ?auto_197290 ?auto_197291 ?auto_197292 ?auto_197293 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_197299 - BLOCK
      ?auto_197300 - BLOCK
      ?auto_197301 - BLOCK
      ?auto_197302 - BLOCK
    )
    :vars
    (
      ?auto_197303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197302 ?auto_197303 ) ( not ( = ?auto_197299 ?auto_197300 ) ) ( not ( = ?auto_197299 ?auto_197301 ) ) ( not ( = ?auto_197299 ?auto_197302 ) ) ( not ( = ?auto_197299 ?auto_197303 ) ) ( not ( = ?auto_197300 ?auto_197301 ) ) ( not ( = ?auto_197300 ?auto_197302 ) ) ( not ( = ?auto_197300 ?auto_197303 ) ) ( not ( = ?auto_197301 ?auto_197302 ) ) ( not ( = ?auto_197301 ?auto_197303 ) ) ( not ( = ?auto_197302 ?auto_197303 ) ) ( ON ?auto_197301 ?auto_197302 ) ( ON ?auto_197300 ?auto_197301 ) ( ON ?auto_197299 ?auto_197300 ) ( CLEAR ?auto_197299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_197299 )
      ( MAKE-4PILE ?auto_197299 ?auto_197300 ?auto_197301 ?auto_197302 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_197308 - BLOCK
      ?auto_197309 - BLOCK
      ?auto_197310 - BLOCK
      ?auto_197311 - BLOCK
    )
    :vars
    (
      ?auto_197312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197311 ?auto_197312 ) ( not ( = ?auto_197308 ?auto_197309 ) ) ( not ( = ?auto_197308 ?auto_197310 ) ) ( not ( = ?auto_197308 ?auto_197311 ) ) ( not ( = ?auto_197308 ?auto_197312 ) ) ( not ( = ?auto_197309 ?auto_197310 ) ) ( not ( = ?auto_197309 ?auto_197311 ) ) ( not ( = ?auto_197309 ?auto_197312 ) ) ( not ( = ?auto_197310 ?auto_197311 ) ) ( not ( = ?auto_197310 ?auto_197312 ) ) ( not ( = ?auto_197311 ?auto_197312 ) ) ( ON ?auto_197310 ?auto_197311 ) ( ON ?auto_197309 ?auto_197310 ) ( ON ?auto_197308 ?auto_197309 ) ( CLEAR ?auto_197308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_197308 )
      ( MAKE-4PILE ?auto_197308 ?auto_197309 ?auto_197310 ?auto_197311 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_197318 - BLOCK
      ?auto_197319 - BLOCK
      ?auto_197320 - BLOCK
      ?auto_197321 - BLOCK
      ?auto_197322 - BLOCK
    )
    :vars
    (
      ?auto_197323 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_197321 ) ( ON ?auto_197322 ?auto_197323 ) ( CLEAR ?auto_197322 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_197318 ) ( ON ?auto_197319 ?auto_197318 ) ( ON ?auto_197320 ?auto_197319 ) ( ON ?auto_197321 ?auto_197320 ) ( not ( = ?auto_197318 ?auto_197319 ) ) ( not ( = ?auto_197318 ?auto_197320 ) ) ( not ( = ?auto_197318 ?auto_197321 ) ) ( not ( = ?auto_197318 ?auto_197322 ) ) ( not ( = ?auto_197318 ?auto_197323 ) ) ( not ( = ?auto_197319 ?auto_197320 ) ) ( not ( = ?auto_197319 ?auto_197321 ) ) ( not ( = ?auto_197319 ?auto_197322 ) ) ( not ( = ?auto_197319 ?auto_197323 ) ) ( not ( = ?auto_197320 ?auto_197321 ) ) ( not ( = ?auto_197320 ?auto_197322 ) ) ( not ( = ?auto_197320 ?auto_197323 ) ) ( not ( = ?auto_197321 ?auto_197322 ) ) ( not ( = ?auto_197321 ?auto_197323 ) ) ( not ( = ?auto_197322 ?auto_197323 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_197322 ?auto_197323 )
      ( !STACK ?auto_197322 ?auto_197321 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_197329 - BLOCK
      ?auto_197330 - BLOCK
      ?auto_197331 - BLOCK
      ?auto_197332 - BLOCK
      ?auto_197333 - BLOCK
    )
    :vars
    (
      ?auto_197334 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_197332 ) ( ON ?auto_197333 ?auto_197334 ) ( CLEAR ?auto_197333 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_197329 ) ( ON ?auto_197330 ?auto_197329 ) ( ON ?auto_197331 ?auto_197330 ) ( ON ?auto_197332 ?auto_197331 ) ( not ( = ?auto_197329 ?auto_197330 ) ) ( not ( = ?auto_197329 ?auto_197331 ) ) ( not ( = ?auto_197329 ?auto_197332 ) ) ( not ( = ?auto_197329 ?auto_197333 ) ) ( not ( = ?auto_197329 ?auto_197334 ) ) ( not ( = ?auto_197330 ?auto_197331 ) ) ( not ( = ?auto_197330 ?auto_197332 ) ) ( not ( = ?auto_197330 ?auto_197333 ) ) ( not ( = ?auto_197330 ?auto_197334 ) ) ( not ( = ?auto_197331 ?auto_197332 ) ) ( not ( = ?auto_197331 ?auto_197333 ) ) ( not ( = ?auto_197331 ?auto_197334 ) ) ( not ( = ?auto_197332 ?auto_197333 ) ) ( not ( = ?auto_197332 ?auto_197334 ) ) ( not ( = ?auto_197333 ?auto_197334 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_197333 ?auto_197334 )
      ( !STACK ?auto_197333 ?auto_197332 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_197340 - BLOCK
      ?auto_197341 - BLOCK
      ?auto_197342 - BLOCK
      ?auto_197343 - BLOCK
      ?auto_197344 - BLOCK
    )
    :vars
    (
      ?auto_197345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197344 ?auto_197345 ) ( ON-TABLE ?auto_197340 ) ( ON ?auto_197341 ?auto_197340 ) ( ON ?auto_197342 ?auto_197341 ) ( not ( = ?auto_197340 ?auto_197341 ) ) ( not ( = ?auto_197340 ?auto_197342 ) ) ( not ( = ?auto_197340 ?auto_197343 ) ) ( not ( = ?auto_197340 ?auto_197344 ) ) ( not ( = ?auto_197340 ?auto_197345 ) ) ( not ( = ?auto_197341 ?auto_197342 ) ) ( not ( = ?auto_197341 ?auto_197343 ) ) ( not ( = ?auto_197341 ?auto_197344 ) ) ( not ( = ?auto_197341 ?auto_197345 ) ) ( not ( = ?auto_197342 ?auto_197343 ) ) ( not ( = ?auto_197342 ?auto_197344 ) ) ( not ( = ?auto_197342 ?auto_197345 ) ) ( not ( = ?auto_197343 ?auto_197344 ) ) ( not ( = ?auto_197343 ?auto_197345 ) ) ( not ( = ?auto_197344 ?auto_197345 ) ) ( CLEAR ?auto_197342 ) ( ON ?auto_197343 ?auto_197344 ) ( CLEAR ?auto_197343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_197340 ?auto_197341 ?auto_197342 ?auto_197343 )
      ( MAKE-5PILE ?auto_197340 ?auto_197341 ?auto_197342 ?auto_197343 ?auto_197344 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_197351 - BLOCK
      ?auto_197352 - BLOCK
      ?auto_197353 - BLOCK
      ?auto_197354 - BLOCK
      ?auto_197355 - BLOCK
    )
    :vars
    (
      ?auto_197356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197355 ?auto_197356 ) ( ON-TABLE ?auto_197351 ) ( ON ?auto_197352 ?auto_197351 ) ( ON ?auto_197353 ?auto_197352 ) ( not ( = ?auto_197351 ?auto_197352 ) ) ( not ( = ?auto_197351 ?auto_197353 ) ) ( not ( = ?auto_197351 ?auto_197354 ) ) ( not ( = ?auto_197351 ?auto_197355 ) ) ( not ( = ?auto_197351 ?auto_197356 ) ) ( not ( = ?auto_197352 ?auto_197353 ) ) ( not ( = ?auto_197352 ?auto_197354 ) ) ( not ( = ?auto_197352 ?auto_197355 ) ) ( not ( = ?auto_197352 ?auto_197356 ) ) ( not ( = ?auto_197353 ?auto_197354 ) ) ( not ( = ?auto_197353 ?auto_197355 ) ) ( not ( = ?auto_197353 ?auto_197356 ) ) ( not ( = ?auto_197354 ?auto_197355 ) ) ( not ( = ?auto_197354 ?auto_197356 ) ) ( not ( = ?auto_197355 ?auto_197356 ) ) ( CLEAR ?auto_197353 ) ( ON ?auto_197354 ?auto_197355 ) ( CLEAR ?auto_197354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_197351 ?auto_197352 ?auto_197353 ?auto_197354 )
      ( MAKE-5PILE ?auto_197351 ?auto_197352 ?auto_197353 ?auto_197354 ?auto_197355 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_197362 - BLOCK
      ?auto_197363 - BLOCK
      ?auto_197364 - BLOCK
      ?auto_197365 - BLOCK
      ?auto_197366 - BLOCK
    )
    :vars
    (
      ?auto_197367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197366 ?auto_197367 ) ( ON-TABLE ?auto_197362 ) ( ON ?auto_197363 ?auto_197362 ) ( not ( = ?auto_197362 ?auto_197363 ) ) ( not ( = ?auto_197362 ?auto_197364 ) ) ( not ( = ?auto_197362 ?auto_197365 ) ) ( not ( = ?auto_197362 ?auto_197366 ) ) ( not ( = ?auto_197362 ?auto_197367 ) ) ( not ( = ?auto_197363 ?auto_197364 ) ) ( not ( = ?auto_197363 ?auto_197365 ) ) ( not ( = ?auto_197363 ?auto_197366 ) ) ( not ( = ?auto_197363 ?auto_197367 ) ) ( not ( = ?auto_197364 ?auto_197365 ) ) ( not ( = ?auto_197364 ?auto_197366 ) ) ( not ( = ?auto_197364 ?auto_197367 ) ) ( not ( = ?auto_197365 ?auto_197366 ) ) ( not ( = ?auto_197365 ?auto_197367 ) ) ( not ( = ?auto_197366 ?auto_197367 ) ) ( ON ?auto_197365 ?auto_197366 ) ( CLEAR ?auto_197363 ) ( ON ?auto_197364 ?auto_197365 ) ( CLEAR ?auto_197364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_197362 ?auto_197363 ?auto_197364 )
      ( MAKE-5PILE ?auto_197362 ?auto_197363 ?auto_197364 ?auto_197365 ?auto_197366 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_197373 - BLOCK
      ?auto_197374 - BLOCK
      ?auto_197375 - BLOCK
      ?auto_197376 - BLOCK
      ?auto_197377 - BLOCK
    )
    :vars
    (
      ?auto_197378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197377 ?auto_197378 ) ( ON-TABLE ?auto_197373 ) ( ON ?auto_197374 ?auto_197373 ) ( not ( = ?auto_197373 ?auto_197374 ) ) ( not ( = ?auto_197373 ?auto_197375 ) ) ( not ( = ?auto_197373 ?auto_197376 ) ) ( not ( = ?auto_197373 ?auto_197377 ) ) ( not ( = ?auto_197373 ?auto_197378 ) ) ( not ( = ?auto_197374 ?auto_197375 ) ) ( not ( = ?auto_197374 ?auto_197376 ) ) ( not ( = ?auto_197374 ?auto_197377 ) ) ( not ( = ?auto_197374 ?auto_197378 ) ) ( not ( = ?auto_197375 ?auto_197376 ) ) ( not ( = ?auto_197375 ?auto_197377 ) ) ( not ( = ?auto_197375 ?auto_197378 ) ) ( not ( = ?auto_197376 ?auto_197377 ) ) ( not ( = ?auto_197376 ?auto_197378 ) ) ( not ( = ?auto_197377 ?auto_197378 ) ) ( ON ?auto_197376 ?auto_197377 ) ( CLEAR ?auto_197374 ) ( ON ?auto_197375 ?auto_197376 ) ( CLEAR ?auto_197375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_197373 ?auto_197374 ?auto_197375 )
      ( MAKE-5PILE ?auto_197373 ?auto_197374 ?auto_197375 ?auto_197376 ?auto_197377 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_197384 - BLOCK
      ?auto_197385 - BLOCK
      ?auto_197386 - BLOCK
      ?auto_197387 - BLOCK
      ?auto_197388 - BLOCK
    )
    :vars
    (
      ?auto_197389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197388 ?auto_197389 ) ( ON-TABLE ?auto_197384 ) ( not ( = ?auto_197384 ?auto_197385 ) ) ( not ( = ?auto_197384 ?auto_197386 ) ) ( not ( = ?auto_197384 ?auto_197387 ) ) ( not ( = ?auto_197384 ?auto_197388 ) ) ( not ( = ?auto_197384 ?auto_197389 ) ) ( not ( = ?auto_197385 ?auto_197386 ) ) ( not ( = ?auto_197385 ?auto_197387 ) ) ( not ( = ?auto_197385 ?auto_197388 ) ) ( not ( = ?auto_197385 ?auto_197389 ) ) ( not ( = ?auto_197386 ?auto_197387 ) ) ( not ( = ?auto_197386 ?auto_197388 ) ) ( not ( = ?auto_197386 ?auto_197389 ) ) ( not ( = ?auto_197387 ?auto_197388 ) ) ( not ( = ?auto_197387 ?auto_197389 ) ) ( not ( = ?auto_197388 ?auto_197389 ) ) ( ON ?auto_197387 ?auto_197388 ) ( ON ?auto_197386 ?auto_197387 ) ( CLEAR ?auto_197384 ) ( ON ?auto_197385 ?auto_197386 ) ( CLEAR ?auto_197385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_197384 ?auto_197385 )
      ( MAKE-5PILE ?auto_197384 ?auto_197385 ?auto_197386 ?auto_197387 ?auto_197388 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_197395 - BLOCK
      ?auto_197396 - BLOCK
      ?auto_197397 - BLOCK
      ?auto_197398 - BLOCK
      ?auto_197399 - BLOCK
    )
    :vars
    (
      ?auto_197400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197399 ?auto_197400 ) ( ON-TABLE ?auto_197395 ) ( not ( = ?auto_197395 ?auto_197396 ) ) ( not ( = ?auto_197395 ?auto_197397 ) ) ( not ( = ?auto_197395 ?auto_197398 ) ) ( not ( = ?auto_197395 ?auto_197399 ) ) ( not ( = ?auto_197395 ?auto_197400 ) ) ( not ( = ?auto_197396 ?auto_197397 ) ) ( not ( = ?auto_197396 ?auto_197398 ) ) ( not ( = ?auto_197396 ?auto_197399 ) ) ( not ( = ?auto_197396 ?auto_197400 ) ) ( not ( = ?auto_197397 ?auto_197398 ) ) ( not ( = ?auto_197397 ?auto_197399 ) ) ( not ( = ?auto_197397 ?auto_197400 ) ) ( not ( = ?auto_197398 ?auto_197399 ) ) ( not ( = ?auto_197398 ?auto_197400 ) ) ( not ( = ?auto_197399 ?auto_197400 ) ) ( ON ?auto_197398 ?auto_197399 ) ( ON ?auto_197397 ?auto_197398 ) ( CLEAR ?auto_197395 ) ( ON ?auto_197396 ?auto_197397 ) ( CLEAR ?auto_197396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_197395 ?auto_197396 )
      ( MAKE-5PILE ?auto_197395 ?auto_197396 ?auto_197397 ?auto_197398 ?auto_197399 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_197406 - BLOCK
      ?auto_197407 - BLOCK
      ?auto_197408 - BLOCK
      ?auto_197409 - BLOCK
      ?auto_197410 - BLOCK
    )
    :vars
    (
      ?auto_197411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197410 ?auto_197411 ) ( not ( = ?auto_197406 ?auto_197407 ) ) ( not ( = ?auto_197406 ?auto_197408 ) ) ( not ( = ?auto_197406 ?auto_197409 ) ) ( not ( = ?auto_197406 ?auto_197410 ) ) ( not ( = ?auto_197406 ?auto_197411 ) ) ( not ( = ?auto_197407 ?auto_197408 ) ) ( not ( = ?auto_197407 ?auto_197409 ) ) ( not ( = ?auto_197407 ?auto_197410 ) ) ( not ( = ?auto_197407 ?auto_197411 ) ) ( not ( = ?auto_197408 ?auto_197409 ) ) ( not ( = ?auto_197408 ?auto_197410 ) ) ( not ( = ?auto_197408 ?auto_197411 ) ) ( not ( = ?auto_197409 ?auto_197410 ) ) ( not ( = ?auto_197409 ?auto_197411 ) ) ( not ( = ?auto_197410 ?auto_197411 ) ) ( ON ?auto_197409 ?auto_197410 ) ( ON ?auto_197408 ?auto_197409 ) ( ON ?auto_197407 ?auto_197408 ) ( ON ?auto_197406 ?auto_197407 ) ( CLEAR ?auto_197406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_197406 )
      ( MAKE-5PILE ?auto_197406 ?auto_197407 ?auto_197408 ?auto_197409 ?auto_197410 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_197417 - BLOCK
      ?auto_197418 - BLOCK
      ?auto_197419 - BLOCK
      ?auto_197420 - BLOCK
      ?auto_197421 - BLOCK
    )
    :vars
    (
      ?auto_197422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197421 ?auto_197422 ) ( not ( = ?auto_197417 ?auto_197418 ) ) ( not ( = ?auto_197417 ?auto_197419 ) ) ( not ( = ?auto_197417 ?auto_197420 ) ) ( not ( = ?auto_197417 ?auto_197421 ) ) ( not ( = ?auto_197417 ?auto_197422 ) ) ( not ( = ?auto_197418 ?auto_197419 ) ) ( not ( = ?auto_197418 ?auto_197420 ) ) ( not ( = ?auto_197418 ?auto_197421 ) ) ( not ( = ?auto_197418 ?auto_197422 ) ) ( not ( = ?auto_197419 ?auto_197420 ) ) ( not ( = ?auto_197419 ?auto_197421 ) ) ( not ( = ?auto_197419 ?auto_197422 ) ) ( not ( = ?auto_197420 ?auto_197421 ) ) ( not ( = ?auto_197420 ?auto_197422 ) ) ( not ( = ?auto_197421 ?auto_197422 ) ) ( ON ?auto_197420 ?auto_197421 ) ( ON ?auto_197419 ?auto_197420 ) ( ON ?auto_197418 ?auto_197419 ) ( ON ?auto_197417 ?auto_197418 ) ( CLEAR ?auto_197417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_197417 )
      ( MAKE-5PILE ?auto_197417 ?auto_197418 ?auto_197419 ?auto_197420 ?auto_197421 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197429 - BLOCK
      ?auto_197430 - BLOCK
      ?auto_197431 - BLOCK
      ?auto_197432 - BLOCK
      ?auto_197433 - BLOCK
      ?auto_197434 - BLOCK
    )
    :vars
    (
      ?auto_197435 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_197433 ) ( ON ?auto_197434 ?auto_197435 ) ( CLEAR ?auto_197434 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_197429 ) ( ON ?auto_197430 ?auto_197429 ) ( ON ?auto_197431 ?auto_197430 ) ( ON ?auto_197432 ?auto_197431 ) ( ON ?auto_197433 ?auto_197432 ) ( not ( = ?auto_197429 ?auto_197430 ) ) ( not ( = ?auto_197429 ?auto_197431 ) ) ( not ( = ?auto_197429 ?auto_197432 ) ) ( not ( = ?auto_197429 ?auto_197433 ) ) ( not ( = ?auto_197429 ?auto_197434 ) ) ( not ( = ?auto_197429 ?auto_197435 ) ) ( not ( = ?auto_197430 ?auto_197431 ) ) ( not ( = ?auto_197430 ?auto_197432 ) ) ( not ( = ?auto_197430 ?auto_197433 ) ) ( not ( = ?auto_197430 ?auto_197434 ) ) ( not ( = ?auto_197430 ?auto_197435 ) ) ( not ( = ?auto_197431 ?auto_197432 ) ) ( not ( = ?auto_197431 ?auto_197433 ) ) ( not ( = ?auto_197431 ?auto_197434 ) ) ( not ( = ?auto_197431 ?auto_197435 ) ) ( not ( = ?auto_197432 ?auto_197433 ) ) ( not ( = ?auto_197432 ?auto_197434 ) ) ( not ( = ?auto_197432 ?auto_197435 ) ) ( not ( = ?auto_197433 ?auto_197434 ) ) ( not ( = ?auto_197433 ?auto_197435 ) ) ( not ( = ?auto_197434 ?auto_197435 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_197434 ?auto_197435 )
      ( !STACK ?auto_197434 ?auto_197433 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197442 - BLOCK
      ?auto_197443 - BLOCK
      ?auto_197444 - BLOCK
      ?auto_197445 - BLOCK
      ?auto_197446 - BLOCK
      ?auto_197447 - BLOCK
    )
    :vars
    (
      ?auto_197448 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_197446 ) ( ON ?auto_197447 ?auto_197448 ) ( CLEAR ?auto_197447 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_197442 ) ( ON ?auto_197443 ?auto_197442 ) ( ON ?auto_197444 ?auto_197443 ) ( ON ?auto_197445 ?auto_197444 ) ( ON ?auto_197446 ?auto_197445 ) ( not ( = ?auto_197442 ?auto_197443 ) ) ( not ( = ?auto_197442 ?auto_197444 ) ) ( not ( = ?auto_197442 ?auto_197445 ) ) ( not ( = ?auto_197442 ?auto_197446 ) ) ( not ( = ?auto_197442 ?auto_197447 ) ) ( not ( = ?auto_197442 ?auto_197448 ) ) ( not ( = ?auto_197443 ?auto_197444 ) ) ( not ( = ?auto_197443 ?auto_197445 ) ) ( not ( = ?auto_197443 ?auto_197446 ) ) ( not ( = ?auto_197443 ?auto_197447 ) ) ( not ( = ?auto_197443 ?auto_197448 ) ) ( not ( = ?auto_197444 ?auto_197445 ) ) ( not ( = ?auto_197444 ?auto_197446 ) ) ( not ( = ?auto_197444 ?auto_197447 ) ) ( not ( = ?auto_197444 ?auto_197448 ) ) ( not ( = ?auto_197445 ?auto_197446 ) ) ( not ( = ?auto_197445 ?auto_197447 ) ) ( not ( = ?auto_197445 ?auto_197448 ) ) ( not ( = ?auto_197446 ?auto_197447 ) ) ( not ( = ?auto_197446 ?auto_197448 ) ) ( not ( = ?auto_197447 ?auto_197448 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_197447 ?auto_197448 )
      ( !STACK ?auto_197447 ?auto_197446 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197455 - BLOCK
      ?auto_197456 - BLOCK
      ?auto_197457 - BLOCK
      ?auto_197458 - BLOCK
      ?auto_197459 - BLOCK
      ?auto_197460 - BLOCK
    )
    :vars
    (
      ?auto_197461 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197460 ?auto_197461 ) ( ON-TABLE ?auto_197455 ) ( ON ?auto_197456 ?auto_197455 ) ( ON ?auto_197457 ?auto_197456 ) ( ON ?auto_197458 ?auto_197457 ) ( not ( = ?auto_197455 ?auto_197456 ) ) ( not ( = ?auto_197455 ?auto_197457 ) ) ( not ( = ?auto_197455 ?auto_197458 ) ) ( not ( = ?auto_197455 ?auto_197459 ) ) ( not ( = ?auto_197455 ?auto_197460 ) ) ( not ( = ?auto_197455 ?auto_197461 ) ) ( not ( = ?auto_197456 ?auto_197457 ) ) ( not ( = ?auto_197456 ?auto_197458 ) ) ( not ( = ?auto_197456 ?auto_197459 ) ) ( not ( = ?auto_197456 ?auto_197460 ) ) ( not ( = ?auto_197456 ?auto_197461 ) ) ( not ( = ?auto_197457 ?auto_197458 ) ) ( not ( = ?auto_197457 ?auto_197459 ) ) ( not ( = ?auto_197457 ?auto_197460 ) ) ( not ( = ?auto_197457 ?auto_197461 ) ) ( not ( = ?auto_197458 ?auto_197459 ) ) ( not ( = ?auto_197458 ?auto_197460 ) ) ( not ( = ?auto_197458 ?auto_197461 ) ) ( not ( = ?auto_197459 ?auto_197460 ) ) ( not ( = ?auto_197459 ?auto_197461 ) ) ( not ( = ?auto_197460 ?auto_197461 ) ) ( CLEAR ?auto_197458 ) ( ON ?auto_197459 ?auto_197460 ) ( CLEAR ?auto_197459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_197455 ?auto_197456 ?auto_197457 ?auto_197458 ?auto_197459 )
      ( MAKE-6PILE ?auto_197455 ?auto_197456 ?auto_197457 ?auto_197458 ?auto_197459 ?auto_197460 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197468 - BLOCK
      ?auto_197469 - BLOCK
      ?auto_197470 - BLOCK
      ?auto_197471 - BLOCK
      ?auto_197472 - BLOCK
      ?auto_197473 - BLOCK
    )
    :vars
    (
      ?auto_197474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197473 ?auto_197474 ) ( ON-TABLE ?auto_197468 ) ( ON ?auto_197469 ?auto_197468 ) ( ON ?auto_197470 ?auto_197469 ) ( ON ?auto_197471 ?auto_197470 ) ( not ( = ?auto_197468 ?auto_197469 ) ) ( not ( = ?auto_197468 ?auto_197470 ) ) ( not ( = ?auto_197468 ?auto_197471 ) ) ( not ( = ?auto_197468 ?auto_197472 ) ) ( not ( = ?auto_197468 ?auto_197473 ) ) ( not ( = ?auto_197468 ?auto_197474 ) ) ( not ( = ?auto_197469 ?auto_197470 ) ) ( not ( = ?auto_197469 ?auto_197471 ) ) ( not ( = ?auto_197469 ?auto_197472 ) ) ( not ( = ?auto_197469 ?auto_197473 ) ) ( not ( = ?auto_197469 ?auto_197474 ) ) ( not ( = ?auto_197470 ?auto_197471 ) ) ( not ( = ?auto_197470 ?auto_197472 ) ) ( not ( = ?auto_197470 ?auto_197473 ) ) ( not ( = ?auto_197470 ?auto_197474 ) ) ( not ( = ?auto_197471 ?auto_197472 ) ) ( not ( = ?auto_197471 ?auto_197473 ) ) ( not ( = ?auto_197471 ?auto_197474 ) ) ( not ( = ?auto_197472 ?auto_197473 ) ) ( not ( = ?auto_197472 ?auto_197474 ) ) ( not ( = ?auto_197473 ?auto_197474 ) ) ( CLEAR ?auto_197471 ) ( ON ?auto_197472 ?auto_197473 ) ( CLEAR ?auto_197472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_197468 ?auto_197469 ?auto_197470 ?auto_197471 ?auto_197472 )
      ( MAKE-6PILE ?auto_197468 ?auto_197469 ?auto_197470 ?auto_197471 ?auto_197472 ?auto_197473 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197481 - BLOCK
      ?auto_197482 - BLOCK
      ?auto_197483 - BLOCK
      ?auto_197484 - BLOCK
      ?auto_197485 - BLOCK
      ?auto_197486 - BLOCK
    )
    :vars
    (
      ?auto_197487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197486 ?auto_197487 ) ( ON-TABLE ?auto_197481 ) ( ON ?auto_197482 ?auto_197481 ) ( ON ?auto_197483 ?auto_197482 ) ( not ( = ?auto_197481 ?auto_197482 ) ) ( not ( = ?auto_197481 ?auto_197483 ) ) ( not ( = ?auto_197481 ?auto_197484 ) ) ( not ( = ?auto_197481 ?auto_197485 ) ) ( not ( = ?auto_197481 ?auto_197486 ) ) ( not ( = ?auto_197481 ?auto_197487 ) ) ( not ( = ?auto_197482 ?auto_197483 ) ) ( not ( = ?auto_197482 ?auto_197484 ) ) ( not ( = ?auto_197482 ?auto_197485 ) ) ( not ( = ?auto_197482 ?auto_197486 ) ) ( not ( = ?auto_197482 ?auto_197487 ) ) ( not ( = ?auto_197483 ?auto_197484 ) ) ( not ( = ?auto_197483 ?auto_197485 ) ) ( not ( = ?auto_197483 ?auto_197486 ) ) ( not ( = ?auto_197483 ?auto_197487 ) ) ( not ( = ?auto_197484 ?auto_197485 ) ) ( not ( = ?auto_197484 ?auto_197486 ) ) ( not ( = ?auto_197484 ?auto_197487 ) ) ( not ( = ?auto_197485 ?auto_197486 ) ) ( not ( = ?auto_197485 ?auto_197487 ) ) ( not ( = ?auto_197486 ?auto_197487 ) ) ( ON ?auto_197485 ?auto_197486 ) ( CLEAR ?auto_197483 ) ( ON ?auto_197484 ?auto_197485 ) ( CLEAR ?auto_197484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_197481 ?auto_197482 ?auto_197483 ?auto_197484 )
      ( MAKE-6PILE ?auto_197481 ?auto_197482 ?auto_197483 ?auto_197484 ?auto_197485 ?auto_197486 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197494 - BLOCK
      ?auto_197495 - BLOCK
      ?auto_197496 - BLOCK
      ?auto_197497 - BLOCK
      ?auto_197498 - BLOCK
      ?auto_197499 - BLOCK
    )
    :vars
    (
      ?auto_197500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197499 ?auto_197500 ) ( ON-TABLE ?auto_197494 ) ( ON ?auto_197495 ?auto_197494 ) ( ON ?auto_197496 ?auto_197495 ) ( not ( = ?auto_197494 ?auto_197495 ) ) ( not ( = ?auto_197494 ?auto_197496 ) ) ( not ( = ?auto_197494 ?auto_197497 ) ) ( not ( = ?auto_197494 ?auto_197498 ) ) ( not ( = ?auto_197494 ?auto_197499 ) ) ( not ( = ?auto_197494 ?auto_197500 ) ) ( not ( = ?auto_197495 ?auto_197496 ) ) ( not ( = ?auto_197495 ?auto_197497 ) ) ( not ( = ?auto_197495 ?auto_197498 ) ) ( not ( = ?auto_197495 ?auto_197499 ) ) ( not ( = ?auto_197495 ?auto_197500 ) ) ( not ( = ?auto_197496 ?auto_197497 ) ) ( not ( = ?auto_197496 ?auto_197498 ) ) ( not ( = ?auto_197496 ?auto_197499 ) ) ( not ( = ?auto_197496 ?auto_197500 ) ) ( not ( = ?auto_197497 ?auto_197498 ) ) ( not ( = ?auto_197497 ?auto_197499 ) ) ( not ( = ?auto_197497 ?auto_197500 ) ) ( not ( = ?auto_197498 ?auto_197499 ) ) ( not ( = ?auto_197498 ?auto_197500 ) ) ( not ( = ?auto_197499 ?auto_197500 ) ) ( ON ?auto_197498 ?auto_197499 ) ( CLEAR ?auto_197496 ) ( ON ?auto_197497 ?auto_197498 ) ( CLEAR ?auto_197497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_197494 ?auto_197495 ?auto_197496 ?auto_197497 )
      ( MAKE-6PILE ?auto_197494 ?auto_197495 ?auto_197496 ?auto_197497 ?auto_197498 ?auto_197499 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197507 - BLOCK
      ?auto_197508 - BLOCK
      ?auto_197509 - BLOCK
      ?auto_197510 - BLOCK
      ?auto_197511 - BLOCK
      ?auto_197512 - BLOCK
    )
    :vars
    (
      ?auto_197513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197512 ?auto_197513 ) ( ON-TABLE ?auto_197507 ) ( ON ?auto_197508 ?auto_197507 ) ( not ( = ?auto_197507 ?auto_197508 ) ) ( not ( = ?auto_197507 ?auto_197509 ) ) ( not ( = ?auto_197507 ?auto_197510 ) ) ( not ( = ?auto_197507 ?auto_197511 ) ) ( not ( = ?auto_197507 ?auto_197512 ) ) ( not ( = ?auto_197507 ?auto_197513 ) ) ( not ( = ?auto_197508 ?auto_197509 ) ) ( not ( = ?auto_197508 ?auto_197510 ) ) ( not ( = ?auto_197508 ?auto_197511 ) ) ( not ( = ?auto_197508 ?auto_197512 ) ) ( not ( = ?auto_197508 ?auto_197513 ) ) ( not ( = ?auto_197509 ?auto_197510 ) ) ( not ( = ?auto_197509 ?auto_197511 ) ) ( not ( = ?auto_197509 ?auto_197512 ) ) ( not ( = ?auto_197509 ?auto_197513 ) ) ( not ( = ?auto_197510 ?auto_197511 ) ) ( not ( = ?auto_197510 ?auto_197512 ) ) ( not ( = ?auto_197510 ?auto_197513 ) ) ( not ( = ?auto_197511 ?auto_197512 ) ) ( not ( = ?auto_197511 ?auto_197513 ) ) ( not ( = ?auto_197512 ?auto_197513 ) ) ( ON ?auto_197511 ?auto_197512 ) ( ON ?auto_197510 ?auto_197511 ) ( CLEAR ?auto_197508 ) ( ON ?auto_197509 ?auto_197510 ) ( CLEAR ?auto_197509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_197507 ?auto_197508 ?auto_197509 )
      ( MAKE-6PILE ?auto_197507 ?auto_197508 ?auto_197509 ?auto_197510 ?auto_197511 ?auto_197512 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197520 - BLOCK
      ?auto_197521 - BLOCK
      ?auto_197522 - BLOCK
      ?auto_197523 - BLOCK
      ?auto_197524 - BLOCK
      ?auto_197525 - BLOCK
    )
    :vars
    (
      ?auto_197526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197525 ?auto_197526 ) ( ON-TABLE ?auto_197520 ) ( ON ?auto_197521 ?auto_197520 ) ( not ( = ?auto_197520 ?auto_197521 ) ) ( not ( = ?auto_197520 ?auto_197522 ) ) ( not ( = ?auto_197520 ?auto_197523 ) ) ( not ( = ?auto_197520 ?auto_197524 ) ) ( not ( = ?auto_197520 ?auto_197525 ) ) ( not ( = ?auto_197520 ?auto_197526 ) ) ( not ( = ?auto_197521 ?auto_197522 ) ) ( not ( = ?auto_197521 ?auto_197523 ) ) ( not ( = ?auto_197521 ?auto_197524 ) ) ( not ( = ?auto_197521 ?auto_197525 ) ) ( not ( = ?auto_197521 ?auto_197526 ) ) ( not ( = ?auto_197522 ?auto_197523 ) ) ( not ( = ?auto_197522 ?auto_197524 ) ) ( not ( = ?auto_197522 ?auto_197525 ) ) ( not ( = ?auto_197522 ?auto_197526 ) ) ( not ( = ?auto_197523 ?auto_197524 ) ) ( not ( = ?auto_197523 ?auto_197525 ) ) ( not ( = ?auto_197523 ?auto_197526 ) ) ( not ( = ?auto_197524 ?auto_197525 ) ) ( not ( = ?auto_197524 ?auto_197526 ) ) ( not ( = ?auto_197525 ?auto_197526 ) ) ( ON ?auto_197524 ?auto_197525 ) ( ON ?auto_197523 ?auto_197524 ) ( CLEAR ?auto_197521 ) ( ON ?auto_197522 ?auto_197523 ) ( CLEAR ?auto_197522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_197520 ?auto_197521 ?auto_197522 )
      ( MAKE-6PILE ?auto_197520 ?auto_197521 ?auto_197522 ?auto_197523 ?auto_197524 ?auto_197525 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197533 - BLOCK
      ?auto_197534 - BLOCK
      ?auto_197535 - BLOCK
      ?auto_197536 - BLOCK
      ?auto_197537 - BLOCK
      ?auto_197538 - BLOCK
    )
    :vars
    (
      ?auto_197539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197538 ?auto_197539 ) ( ON-TABLE ?auto_197533 ) ( not ( = ?auto_197533 ?auto_197534 ) ) ( not ( = ?auto_197533 ?auto_197535 ) ) ( not ( = ?auto_197533 ?auto_197536 ) ) ( not ( = ?auto_197533 ?auto_197537 ) ) ( not ( = ?auto_197533 ?auto_197538 ) ) ( not ( = ?auto_197533 ?auto_197539 ) ) ( not ( = ?auto_197534 ?auto_197535 ) ) ( not ( = ?auto_197534 ?auto_197536 ) ) ( not ( = ?auto_197534 ?auto_197537 ) ) ( not ( = ?auto_197534 ?auto_197538 ) ) ( not ( = ?auto_197534 ?auto_197539 ) ) ( not ( = ?auto_197535 ?auto_197536 ) ) ( not ( = ?auto_197535 ?auto_197537 ) ) ( not ( = ?auto_197535 ?auto_197538 ) ) ( not ( = ?auto_197535 ?auto_197539 ) ) ( not ( = ?auto_197536 ?auto_197537 ) ) ( not ( = ?auto_197536 ?auto_197538 ) ) ( not ( = ?auto_197536 ?auto_197539 ) ) ( not ( = ?auto_197537 ?auto_197538 ) ) ( not ( = ?auto_197537 ?auto_197539 ) ) ( not ( = ?auto_197538 ?auto_197539 ) ) ( ON ?auto_197537 ?auto_197538 ) ( ON ?auto_197536 ?auto_197537 ) ( ON ?auto_197535 ?auto_197536 ) ( CLEAR ?auto_197533 ) ( ON ?auto_197534 ?auto_197535 ) ( CLEAR ?auto_197534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_197533 ?auto_197534 )
      ( MAKE-6PILE ?auto_197533 ?auto_197534 ?auto_197535 ?auto_197536 ?auto_197537 ?auto_197538 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197546 - BLOCK
      ?auto_197547 - BLOCK
      ?auto_197548 - BLOCK
      ?auto_197549 - BLOCK
      ?auto_197550 - BLOCK
      ?auto_197551 - BLOCK
    )
    :vars
    (
      ?auto_197552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197551 ?auto_197552 ) ( ON-TABLE ?auto_197546 ) ( not ( = ?auto_197546 ?auto_197547 ) ) ( not ( = ?auto_197546 ?auto_197548 ) ) ( not ( = ?auto_197546 ?auto_197549 ) ) ( not ( = ?auto_197546 ?auto_197550 ) ) ( not ( = ?auto_197546 ?auto_197551 ) ) ( not ( = ?auto_197546 ?auto_197552 ) ) ( not ( = ?auto_197547 ?auto_197548 ) ) ( not ( = ?auto_197547 ?auto_197549 ) ) ( not ( = ?auto_197547 ?auto_197550 ) ) ( not ( = ?auto_197547 ?auto_197551 ) ) ( not ( = ?auto_197547 ?auto_197552 ) ) ( not ( = ?auto_197548 ?auto_197549 ) ) ( not ( = ?auto_197548 ?auto_197550 ) ) ( not ( = ?auto_197548 ?auto_197551 ) ) ( not ( = ?auto_197548 ?auto_197552 ) ) ( not ( = ?auto_197549 ?auto_197550 ) ) ( not ( = ?auto_197549 ?auto_197551 ) ) ( not ( = ?auto_197549 ?auto_197552 ) ) ( not ( = ?auto_197550 ?auto_197551 ) ) ( not ( = ?auto_197550 ?auto_197552 ) ) ( not ( = ?auto_197551 ?auto_197552 ) ) ( ON ?auto_197550 ?auto_197551 ) ( ON ?auto_197549 ?auto_197550 ) ( ON ?auto_197548 ?auto_197549 ) ( CLEAR ?auto_197546 ) ( ON ?auto_197547 ?auto_197548 ) ( CLEAR ?auto_197547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_197546 ?auto_197547 )
      ( MAKE-6PILE ?auto_197546 ?auto_197547 ?auto_197548 ?auto_197549 ?auto_197550 ?auto_197551 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197559 - BLOCK
      ?auto_197560 - BLOCK
      ?auto_197561 - BLOCK
      ?auto_197562 - BLOCK
      ?auto_197563 - BLOCK
      ?auto_197564 - BLOCK
    )
    :vars
    (
      ?auto_197565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197564 ?auto_197565 ) ( not ( = ?auto_197559 ?auto_197560 ) ) ( not ( = ?auto_197559 ?auto_197561 ) ) ( not ( = ?auto_197559 ?auto_197562 ) ) ( not ( = ?auto_197559 ?auto_197563 ) ) ( not ( = ?auto_197559 ?auto_197564 ) ) ( not ( = ?auto_197559 ?auto_197565 ) ) ( not ( = ?auto_197560 ?auto_197561 ) ) ( not ( = ?auto_197560 ?auto_197562 ) ) ( not ( = ?auto_197560 ?auto_197563 ) ) ( not ( = ?auto_197560 ?auto_197564 ) ) ( not ( = ?auto_197560 ?auto_197565 ) ) ( not ( = ?auto_197561 ?auto_197562 ) ) ( not ( = ?auto_197561 ?auto_197563 ) ) ( not ( = ?auto_197561 ?auto_197564 ) ) ( not ( = ?auto_197561 ?auto_197565 ) ) ( not ( = ?auto_197562 ?auto_197563 ) ) ( not ( = ?auto_197562 ?auto_197564 ) ) ( not ( = ?auto_197562 ?auto_197565 ) ) ( not ( = ?auto_197563 ?auto_197564 ) ) ( not ( = ?auto_197563 ?auto_197565 ) ) ( not ( = ?auto_197564 ?auto_197565 ) ) ( ON ?auto_197563 ?auto_197564 ) ( ON ?auto_197562 ?auto_197563 ) ( ON ?auto_197561 ?auto_197562 ) ( ON ?auto_197560 ?auto_197561 ) ( ON ?auto_197559 ?auto_197560 ) ( CLEAR ?auto_197559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_197559 )
      ( MAKE-6PILE ?auto_197559 ?auto_197560 ?auto_197561 ?auto_197562 ?auto_197563 ?auto_197564 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197572 - BLOCK
      ?auto_197573 - BLOCK
      ?auto_197574 - BLOCK
      ?auto_197575 - BLOCK
      ?auto_197576 - BLOCK
      ?auto_197577 - BLOCK
    )
    :vars
    (
      ?auto_197578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197577 ?auto_197578 ) ( not ( = ?auto_197572 ?auto_197573 ) ) ( not ( = ?auto_197572 ?auto_197574 ) ) ( not ( = ?auto_197572 ?auto_197575 ) ) ( not ( = ?auto_197572 ?auto_197576 ) ) ( not ( = ?auto_197572 ?auto_197577 ) ) ( not ( = ?auto_197572 ?auto_197578 ) ) ( not ( = ?auto_197573 ?auto_197574 ) ) ( not ( = ?auto_197573 ?auto_197575 ) ) ( not ( = ?auto_197573 ?auto_197576 ) ) ( not ( = ?auto_197573 ?auto_197577 ) ) ( not ( = ?auto_197573 ?auto_197578 ) ) ( not ( = ?auto_197574 ?auto_197575 ) ) ( not ( = ?auto_197574 ?auto_197576 ) ) ( not ( = ?auto_197574 ?auto_197577 ) ) ( not ( = ?auto_197574 ?auto_197578 ) ) ( not ( = ?auto_197575 ?auto_197576 ) ) ( not ( = ?auto_197575 ?auto_197577 ) ) ( not ( = ?auto_197575 ?auto_197578 ) ) ( not ( = ?auto_197576 ?auto_197577 ) ) ( not ( = ?auto_197576 ?auto_197578 ) ) ( not ( = ?auto_197577 ?auto_197578 ) ) ( ON ?auto_197576 ?auto_197577 ) ( ON ?auto_197575 ?auto_197576 ) ( ON ?auto_197574 ?auto_197575 ) ( ON ?auto_197573 ?auto_197574 ) ( ON ?auto_197572 ?auto_197573 ) ( CLEAR ?auto_197572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_197572 )
      ( MAKE-6PILE ?auto_197572 ?auto_197573 ?auto_197574 ?auto_197575 ?auto_197576 ?auto_197577 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197586 - BLOCK
      ?auto_197587 - BLOCK
      ?auto_197588 - BLOCK
      ?auto_197589 - BLOCK
      ?auto_197590 - BLOCK
      ?auto_197591 - BLOCK
      ?auto_197592 - BLOCK
    )
    :vars
    (
      ?auto_197593 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_197591 ) ( ON ?auto_197592 ?auto_197593 ) ( CLEAR ?auto_197592 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_197586 ) ( ON ?auto_197587 ?auto_197586 ) ( ON ?auto_197588 ?auto_197587 ) ( ON ?auto_197589 ?auto_197588 ) ( ON ?auto_197590 ?auto_197589 ) ( ON ?auto_197591 ?auto_197590 ) ( not ( = ?auto_197586 ?auto_197587 ) ) ( not ( = ?auto_197586 ?auto_197588 ) ) ( not ( = ?auto_197586 ?auto_197589 ) ) ( not ( = ?auto_197586 ?auto_197590 ) ) ( not ( = ?auto_197586 ?auto_197591 ) ) ( not ( = ?auto_197586 ?auto_197592 ) ) ( not ( = ?auto_197586 ?auto_197593 ) ) ( not ( = ?auto_197587 ?auto_197588 ) ) ( not ( = ?auto_197587 ?auto_197589 ) ) ( not ( = ?auto_197587 ?auto_197590 ) ) ( not ( = ?auto_197587 ?auto_197591 ) ) ( not ( = ?auto_197587 ?auto_197592 ) ) ( not ( = ?auto_197587 ?auto_197593 ) ) ( not ( = ?auto_197588 ?auto_197589 ) ) ( not ( = ?auto_197588 ?auto_197590 ) ) ( not ( = ?auto_197588 ?auto_197591 ) ) ( not ( = ?auto_197588 ?auto_197592 ) ) ( not ( = ?auto_197588 ?auto_197593 ) ) ( not ( = ?auto_197589 ?auto_197590 ) ) ( not ( = ?auto_197589 ?auto_197591 ) ) ( not ( = ?auto_197589 ?auto_197592 ) ) ( not ( = ?auto_197589 ?auto_197593 ) ) ( not ( = ?auto_197590 ?auto_197591 ) ) ( not ( = ?auto_197590 ?auto_197592 ) ) ( not ( = ?auto_197590 ?auto_197593 ) ) ( not ( = ?auto_197591 ?auto_197592 ) ) ( not ( = ?auto_197591 ?auto_197593 ) ) ( not ( = ?auto_197592 ?auto_197593 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_197592 ?auto_197593 )
      ( !STACK ?auto_197592 ?auto_197591 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197601 - BLOCK
      ?auto_197602 - BLOCK
      ?auto_197603 - BLOCK
      ?auto_197604 - BLOCK
      ?auto_197605 - BLOCK
      ?auto_197606 - BLOCK
      ?auto_197607 - BLOCK
    )
    :vars
    (
      ?auto_197608 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_197606 ) ( ON ?auto_197607 ?auto_197608 ) ( CLEAR ?auto_197607 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_197601 ) ( ON ?auto_197602 ?auto_197601 ) ( ON ?auto_197603 ?auto_197602 ) ( ON ?auto_197604 ?auto_197603 ) ( ON ?auto_197605 ?auto_197604 ) ( ON ?auto_197606 ?auto_197605 ) ( not ( = ?auto_197601 ?auto_197602 ) ) ( not ( = ?auto_197601 ?auto_197603 ) ) ( not ( = ?auto_197601 ?auto_197604 ) ) ( not ( = ?auto_197601 ?auto_197605 ) ) ( not ( = ?auto_197601 ?auto_197606 ) ) ( not ( = ?auto_197601 ?auto_197607 ) ) ( not ( = ?auto_197601 ?auto_197608 ) ) ( not ( = ?auto_197602 ?auto_197603 ) ) ( not ( = ?auto_197602 ?auto_197604 ) ) ( not ( = ?auto_197602 ?auto_197605 ) ) ( not ( = ?auto_197602 ?auto_197606 ) ) ( not ( = ?auto_197602 ?auto_197607 ) ) ( not ( = ?auto_197602 ?auto_197608 ) ) ( not ( = ?auto_197603 ?auto_197604 ) ) ( not ( = ?auto_197603 ?auto_197605 ) ) ( not ( = ?auto_197603 ?auto_197606 ) ) ( not ( = ?auto_197603 ?auto_197607 ) ) ( not ( = ?auto_197603 ?auto_197608 ) ) ( not ( = ?auto_197604 ?auto_197605 ) ) ( not ( = ?auto_197604 ?auto_197606 ) ) ( not ( = ?auto_197604 ?auto_197607 ) ) ( not ( = ?auto_197604 ?auto_197608 ) ) ( not ( = ?auto_197605 ?auto_197606 ) ) ( not ( = ?auto_197605 ?auto_197607 ) ) ( not ( = ?auto_197605 ?auto_197608 ) ) ( not ( = ?auto_197606 ?auto_197607 ) ) ( not ( = ?auto_197606 ?auto_197608 ) ) ( not ( = ?auto_197607 ?auto_197608 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_197607 ?auto_197608 )
      ( !STACK ?auto_197607 ?auto_197606 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197616 - BLOCK
      ?auto_197617 - BLOCK
      ?auto_197618 - BLOCK
      ?auto_197619 - BLOCK
      ?auto_197620 - BLOCK
      ?auto_197621 - BLOCK
      ?auto_197622 - BLOCK
    )
    :vars
    (
      ?auto_197623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197622 ?auto_197623 ) ( ON-TABLE ?auto_197616 ) ( ON ?auto_197617 ?auto_197616 ) ( ON ?auto_197618 ?auto_197617 ) ( ON ?auto_197619 ?auto_197618 ) ( ON ?auto_197620 ?auto_197619 ) ( not ( = ?auto_197616 ?auto_197617 ) ) ( not ( = ?auto_197616 ?auto_197618 ) ) ( not ( = ?auto_197616 ?auto_197619 ) ) ( not ( = ?auto_197616 ?auto_197620 ) ) ( not ( = ?auto_197616 ?auto_197621 ) ) ( not ( = ?auto_197616 ?auto_197622 ) ) ( not ( = ?auto_197616 ?auto_197623 ) ) ( not ( = ?auto_197617 ?auto_197618 ) ) ( not ( = ?auto_197617 ?auto_197619 ) ) ( not ( = ?auto_197617 ?auto_197620 ) ) ( not ( = ?auto_197617 ?auto_197621 ) ) ( not ( = ?auto_197617 ?auto_197622 ) ) ( not ( = ?auto_197617 ?auto_197623 ) ) ( not ( = ?auto_197618 ?auto_197619 ) ) ( not ( = ?auto_197618 ?auto_197620 ) ) ( not ( = ?auto_197618 ?auto_197621 ) ) ( not ( = ?auto_197618 ?auto_197622 ) ) ( not ( = ?auto_197618 ?auto_197623 ) ) ( not ( = ?auto_197619 ?auto_197620 ) ) ( not ( = ?auto_197619 ?auto_197621 ) ) ( not ( = ?auto_197619 ?auto_197622 ) ) ( not ( = ?auto_197619 ?auto_197623 ) ) ( not ( = ?auto_197620 ?auto_197621 ) ) ( not ( = ?auto_197620 ?auto_197622 ) ) ( not ( = ?auto_197620 ?auto_197623 ) ) ( not ( = ?auto_197621 ?auto_197622 ) ) ( not ( = ?auto_197621 ?auto_197623 ) ) ( not ( = ?auto_197622 ?auto_197623 ) ) ( CLEAR ?auto_197620 ) ( ON ?auto_197621 ?auto_197622 ) ( CLEAR ?auto_197621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_197616 ?auto_197617 ?auto_197618 ?auto_197619 ?auto_197620 ?auto_197621 )
      ( MAKE-7PILE ?auto_197616 ?auto_197617 ?auto_197618 ?auto_197619 ?auto_197620 ?auto_197621 ?auto_197622 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197631 - BLOCK
      ?auto_197632 - BLOCK
      ?auto_197633 - BLOCK
      ?auto_197634 - BLOCK
      ?auto_197635 - BLOCK
      ?auto_197636 - BLOCK
      ?auto_197637 - BLOCK
    )
    :vars
    (
      ?auto_197638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197637 ?auto_197638 ) ( ON-TABLE ?auto_197631 ) ( ON ?auto_197632 ?auto_197631 ) ( ON ?auto_197633 ?auto_197632 ) ( ON ?auto_197634 ?auto_197633 ) ( ON ?auto_197635 ?auto_197634 ) ( not ( = ?auto_197631 ?auto_197632 ) ) ( not ( = ?auto_197631 ?auto_197633 ) ) ( not ( = ?auto_197631 ?auto_197634 ) ) ( not ( = ?auto_197631 ?auto_197635 ) ) ( not ( = ?auto_197631 ?auto_197636 ) ) ( not ( = ?auto_197631 ?auto_197637 ) ) ( not ( = ?auto_197631 ?auto_197638 ) ) ( not ( = ?auto_197632 ?auto_197633 ) ) ( not ( = ?auto_197632 ?auto_197634 ) ) ( not ( = ?auto_197632 ?auto_197635 ) ) ( not ( = ?auto_197632 ?auto_197636 ) ) ( not ( = ?auto_197632 ?auto_197637 ) ) ( not ( = ?auto_197632 ?auto_197638 ) ) ( not ( = ?auto_197633 ?auto_197634 ) ) ( not ( = ?auto_197633 ?auto_197635 ) ) ( not ( = ?auto_197633 ?auto_197636 ) ) ( not ( = ?auto_197633 ?auto_197637 ) ) ( not ( = ?auto_197633 ?auto_197638 ) ) ( not ( = ?auto_197634 ?auto_197635 ) ) ( not ( = ?auto_197634 ?auto_197636 ) ) ( not ( = ?auto_197634 ?auto_197637 ) ) ( not ( = ?auto_197634 ?auto_197638 ) ) ( not ( = ?auto_197635 ?auto_197636 ) ) ( not ( = ?auto_197635 ?auto_197637 ) ) ( not ( = ?auto_197635 ?auto_197638 ) ) ( not ( = ?auto_197636 ?auto_197637 ) ) ( not ( = ?auto_197636 ?auto_197638 ) ) ( not ( = ?auto_197637 ?auto_197638 ) ) ( CLEAR ?auto_197635 ) ( ON ?auto_197636 ?auto_197637 ) ( CLEAR ?auto_197636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_197631 ?auto_197632 ?auto_197633 ?auto_197634 ?auto_197635 ?auto_197636 )
      ( MAKE-7PILE ?auto_197631 ?auto_197632 ?auto_197633 ?auto_197634 ?auto_197635 ?auto_197636 ?auto_197637 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197646 - BLOCK
      ?auto_197647 - BLOCK
      ?auto_197648 - BLOCK
      ?auto_197649 - BLOCK
      ?auto_197650 - BLOCK
      ?auto_197651 - BLOCK
      ?auto_197652 - BLOCK
    )
    :vars
    (
      ?auto_197653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197652 ?auto_197653 ) ( ON-TABLE ?auto_197646 ) ( ON ?auto_197647 ?auto_197646 ) ( ON ?auto_197648 ?auto_197647 ) ( ON ?auto_197649 ?auto_197648 ) ( not ( = ?auto_197646 ?auto_197647 ) ) ( not ( = ?auto_197646 ?auto_197648 ) ) ( not ( = ?auto_197646 ?auto_197649 ) ) ( not ( = ?auto_197646 ?auto_197650 ) ) ( not ( = ?auto_197646 ?auto_197651 ) ) ( not ( = ?auto_197646 ?auto_197652 ) ) ( not ( = ?auto_197646 ?auto_197653 ) ) ( not ( = ?auto_197647 ?auto_197648 ) ) ( not ( = ?auto_197647 ?auto_197649 ) ) ( not ( = ?auto_197647 ?auto_197650 ) ) ( not ( = ?auto_197647 ?auto_197651 ) ) ( not ( = ?auto_197647 ?auto_197652 ) ) ( not ( = ?auto_197647 ?auto_197653 ) ) ( not ( = ?auto_197648 ?auto_197649 ) ) ( not ( = ?auto_197648 ?auto_197650 ) ) ( not ( = ?auto_197648 ?auto_197651 ) ) ( not ( = ?auto_197648 ?auto_197652 ) ) ( not ( = ?auto_197648 ?auto_197653 ) ) ( not ( = ?auto_197649 ?auto_197650 ) ) ( not ( = ?auto_197649 ?auto_197651 ) ) ( not ( = ?auto_197649 ?auto_197652 ) ) ( not ( = ?auto_197649 ?auto_197653 ) ) ( not ( = ?auto_197650 ?auto_197651 ) ) ( not ( = ?auto_197650 ?auto_197652 ) ) ( not ( = ?auto_197650 ?auto_197653 ) ) ( not ( = ?auto_197651 ?auto_197652 ) ) ( not ( = ?auto_197651 ?auto_197653 ) ) ( not ( = ?auto_197652 ?auto_197653 ) ) ( ON ?auto_197651 ?auto_197652 ) ( CLEAR ?auto_197649 ) ( ON ?auto_197650 ?auto_197651 ) ( CLEAR ?auto_197650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_197646 ?auto_197647 ?auto_197648 ?auto_197649 ?auto_197650 )
      ( MAKE-7PILE ?auto_197646 ?auto_197647 ?auto_197648 ?auto_197649 ?auto_197650 ?auto_197651 ?auto_197652 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197661 - BLOCK
      ?auto_197662 - BLOCK
      ?auto_197663 - BLOCK
      ?auto_197664 - BLOCK
      ?auto_197665 - BLOCK
      ?auto_197666 - BLOCK
      ?auto_197667 - BLOCK
    )
    :vars
    (
      ?auto_197668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197667 ?auto_197668 ) ( ON-TABLE ?auto_197661 ) ( ON ?auto_197662 ?auto_197661 ) ( ON ?auto_197663 ?auto_197662 ) ( ON ?auto_197664 ?auto_197663 ) ( not ( = ?auto_197661 ?auto_197662 ) ) ( not ( = ?auto_197661 ?auto_197663 ) ) ( not ( = ?auto_197661 ?auto_197664 ) ) ( not ( = ?auto_197661 ?auto_197665 ) ) ( not ( = ?auto_197661 ?auto_197666 ) ) ( not ( = ?auto_197661 ?auto_197667 ) ) ( not ( = ?auto_197661 ?auto_197668 ) ) ( not ( = ?auto_197662 ?auto_197663 ) ) ( not ( = ?auto_197662 ?auto_197664 ) ) ( not ( = ?auto_197662 ?auto_197665 ) ) ( not ( = ?auto_197662 ?auto_197666 ) ) ( not ( = ?auto_197662 ?auto_197667 ) ) ( not ( = ?auto_197662 ?auto_197668 ) ) ( not ( = ?auto_197663 ?auto_197664 ) ) ( not ( = ?auto_197663 ?auto_197665 ) ) ( not ( = ?auto_197663 ?auto_197666 ) ) ( not ( = ?auto_197663 ?auto_197667 ) ) ( not ( = ?auto_197663 ?auto_197668 ) ) ( not ( = ?auto_197664 ?auto_197665 ) ) ( not ( = ?auto_197664 ?auto_197666 ) ) ( not ( = ?auto_197664 ?auto_197667 ) ) ( not ( = ?auto_197664 ?auto_197668 ) ) ( not ( = ?auto_197665 ?auto_197666 ) ) ( not ( = ?auto_197665 ?auto_197667 ) ) ( not ( = ?auto_197665 ?auto_197668 ) ) ( not ( = ?auto_197666 ?auto_197667 ) ) ( not ( = ?auto_197666 ?auto_197668 ) ) ( not ( = ?auto_197667 ?auto_197668 ) ) ( ON ?auto_197666 ?auto_197667 ) ( CLEAR ?auto_197664 ) ( ON ?auto_197665 ?auto_197666 ) ( CLEAR ?auto_197665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_197661 ?auto_197662 ?auto_197663 ?auto_197664 ?auto_197665 )
      ( MAKE-7PILE ?auto_197661 ?auto_197662 ?auto_197663 ?auto_197664 ?auto_197665 ?auto_197666 ?auto_197667 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197676 - BLOCK
      ?auto_197677 - BLOCK
      ?auto_197678 - BLOCK
      ?auto_197679 - BLOCK
      ?auto_197680 - BLOCK
      ?auto_197681 - BLOCK
      ?auto_197682 - BLOCK
    )
    :vars
    (
      ?auto_197683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197682 ?auto_197683 ) ( ON-TABLE ?auto_197676 ) ( ON ?auto_197677 ?auto_197676 ) ( ON ?auto_197678 ?auto_197677 ) ( not ( = ?auto_197676 ?auto_197677 ) ) ( not ( = ?auto_197676 ?auto_197678 ) ) ( not ( = ?auto_197676 ?auto_197679 ) ) ( not ( = ?auto_197676 ?auto_197680 ) ) ( not ( = ?auto_197676 ?auto_197681 ) ) ( not ( = ?auto_197676 ?auto_197682 ) ) ( not ( = ?auto_197676 ?auto_197683 ) ) ( not ( = ?auto_197677 ?auto_197678 ) ) ( not ( = ?auto_197677 ?auto_197679 ) ) ( not ( = ?auto_197677 ?auto_197680 ) ) ( not ( = ?auto_197677 ?auto_197681 ) ) ( not ( = ?auto_197677 ?auto_197682 ) ) ( not ( = ?auto_197677 ?auto_197683 ) ) ( not ( = ?auto_197678 ?auto_197679 ) ) ( not ( = ?auto_197678 ?auto_197680 ) ) ( not ( = ?auto_197678 ?auto_197681 ) ) ( not ( = ?auto_197678 ?auto_197682 ) ) ( not ( = ?auto_197678 ?auto_197683 ) ) ( not ( = ?auto_197679 ?auto_197680 ) ) ( not ( = ?auto_197679 ?auto_197681 ) ) ( not ( = ?auto_197679 ?auto_197682 ) ) ( not ( = ?auto_197679 ?auto_197683 ) ) ( not ( = ?auto_197680 ?auto_197681 ) ) ( not ( = ?auto_197680 ?auto_197682 ) ) ( not ( = ?auto_197680 ?auto_197683 ) ) ( not ( = ?auto_197681 ?auto_197682 ) ) ( not ( = ?auto_197681 ?auto_197683 ) ) ( not ( = ?auto_197682 ?auto_197683 ) ) ( ON ?auto_197681 ?auto_197682 ) ( ON ?auto_197680 ?auto_197681 ) ( CLEAR ?auto_197678 ) ( ON ?auto_197679 ?auto_197680 ) ( CLEAR ?auto_197679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_197676 ?auto_197677 ?auto_197678 ?auto_197679 )
      ( MAKE-7PILE ?auto_197676 ?auto_197677 ?auto_197678 ?auto_197679 ?auto_197680 ?auto_197681 ?auto_197682 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197691 - BLOCK
      ?auto_197692 - BLOCK
      ?auto_197693 - BLOCK
      ?auto_197694 - BLOCK
      ?auto_197695 - BLOCK
      ?auto_197696 - BLOCK
      ?auto_197697 - BLOCK
    )
    :vars
    (
      ?auto_197698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197697 ?auto_197698 ) ( ON-TABLE ?auto_197691 ) ( ON ?auto_197692 ?auto_197691 ) ( ON ?auto_197693 ?auto_197692 ) ( not ( = ?auto_197691 ?auto_197692 ) ) ( not ( = ?auto_197691 ?auto_197693 ) ) ( not ( = ?auto_197691 ?auto_197694 ) ) ( not ( = ?auto_197691 ?auto_197695 ) ) ( not ( = ?auto_197691 ?auto_197696 ) ) ( not ( = ?auto_197691 ?auto_197697 ) ) ( not ( = ?auto_197691 ?auto_197698 ) ) ( not ( = ?auto_197692 ?auto_197693 ) ) ( not ( = ?auto_197692 ?auto_197694 ) ) ( not ( = ?auto_197692 ?auto_197695 ) ) ( not ( = ?auto_197692 ?auto_197696 ) ) ( not ( = ?auto_197692 ?auto_197697 ) ) ( not ( = ?auto_197692 ?auto_197698 ) ) ( not ( = ?auto_197693 ?auto_197694 ) ) ( not ( = ?auto_197693 ?auto_197695 ) ) ( not ( = ?auto_197693 ?auto_197696 ) ) ( not ( = ?auto_197693 ?auto_197697 ) ) ( not ( = ?auto_197693 ?auto_197698 ) ) ( not ( = ?auto_197694 ?auto_197695 ) ) ( not ( = ?auto_197694 ?auto_197696 ) ) ( not ( = ?auto_197694 ?auto_197697 ) ) ( not ( = ?auto_197694 ?auto_197698 ) ) ( not ( = ?auto_197695 ?auto_197696 ) ) ( not ( = ?auto_197695 ?auto_197697 ) ) ( not ( = ?auto_197695 ?auto_197698 ) ) ( not ( = ?auto_197696 ?auto_197697 ) ) ( not ( = ?auto_197696 ?auto_197698 ) ) ( not ( = ?auto_197697 ?auto_197698 ) ) ( ON ?auto_197696 ?auto_197697 ) ( ON ?auto_197695 ?auto_197696 ) ( CLEAR ?auto_197693 ) ( ON ?auto_197694 ?auto_197695 ) ( CLEAR ?auto_197694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_197691 ?auto_197692 ?auto_197693 ?auto_197694 )
      ( MAKE-7PILE ?auto_197691 ?auto_197692 ?auto_197693 ?auto_197694 ?auto_197695 ?auto_197696 ?auto_197697 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197706 - BLOCK
      ?auto_197707 - BLOCK
      ?auto_197708 - BLOCK
      ?auto_197709 - BLOCK
      ?auto_197710 - BLOCK
      ?auto_197711 - BLOCK
      ?auto_197712 - BLOCK
    )
    :vars
    (
      ?auto_197713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197712 ?auto_197713 ) ( ON-TABLE ?auto_197706 ) ( ON ?auto_197707 ?auto_197706 ) ( not ( = ?auto_197706 ?auto_197707 ) ) ( not ( = ?auto_197706 ?auto_197708 ) ) ( not ( = ?auto_197706 ?auto_197709 ) ) ( not ( = ?auto_197706 ?auto_197710 ) ) ( not ( = ?auto_197706 ?auto_197711 ) ) ( not ( = ?auto_197706 ?auto_197712 ) ) ( not ( = ?auto_197706 ?auto_197713 ) ) ( not ( = ?auto_197707 ?auto_197708 ) ) ( not ( = ?auto_197707 ?auto_197709 ) ) ( not ( = ?auto_197707 ?auto_197710 ) ) ( not ( = ?auto_197707 ?auto_197711 ) ) ( not ( = ?auto_197707 ?auto_197712 ) ) ( not ( = ?auto_197707 ?auto_197713 ) ) ( not ( = ?auto_197708 ?auto_197709 ) ) ( not ( = ?auto_197708 ?auto_197710 ) ) ( not ( = ?auto_197708 ?auto_197711 ) ) ( not ( = ?auto_197708 ?auto_197712 ) ) ( not ( = ?auto_197708 ?auto_197713 ) ) ( not ( = ?auto_197709 ?auto_197710 ) ) ( not ( = ?auto_197709 ?auto_197711 ) ) ( not ( = ?auto_197709 ?auto_197712 ) ) ( not ( = ?auto_197709 ?auto_197713 ) ) ( not ( = ?auto_197710 ?auto_197711 ) ) ( not ( = ?auto_197710 ?auto_197712 ) ) ( not ( = ?auto_197710 ?auto_197713 ) ) ( not ( = ?auto_197711 ?auto_197712 ) ) ( not ( = ?auto_197711 ?auto_197713 ) ) ( not ( = ?auto_197712 ?auto_197713 ) ) ( ON ?auto_197711 ?auto_197712 ) ( ON ?auto_197710 ?auto_197711 ) ( ON ?auto_197709 ?auto_197710 ) ( CLEAR ?auto_197707 ) ( ON ?auto_197708 ?auto_197709 ) ( CLEAR ?auto_197708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_197706 ?auto_197707 ?auto_197708 )
      ( MAKE-7PILE ?auto_197706 ?auto_197707 ?auto_197708 ?auto_197709 ?auto_197710 ?auto_197711 ?auto_197712 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197721 - BLOCK
      ?auto_197722 - BLOCK
      ?auto_197723 - BLOCK
      ?auto_197724 - BLOCK
      ?auto_197725 - BLOCK
      ?auto_197726 - BLOCK
      ?auto_197727 - BLOCK
    )
    :vars
    (
      ?auto_197728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197727 ?auto_197728 ) ( ON-TABLE ?auto_197721 ) ( ON ?auto_197722 ?auto_197721 ) ( not ( = ?auto_197721 ?auto_197722 ) ) ( not ( = ?auto_197721 ?auto_197723 ) ) ( not ( = ?auto_197721 ?auto_197724 ) ) ( not ( = ?auto_197721 ?auto_197725 ) ) ( not ( = ?auto_197721 ?auto_197726 ) ) ( not ( = ?auto_197721 ?auto_197727 ) ) ( not ( = ?auto_197721 ?auto_197728 ) ) ( not ( = ?auto_197722 ?auto_197723 ) ) ( not ( = ?auto_197722 ?auto_197724 ) ) ( not ( = ?auto_197722 ?auto_197725 ) ) ( not ( = ?auto_197722 ?auto_197726 ) ) ( not ( = ?auto_197722 ?auto_197727 ) ) ( not ( = ?auto_197722 ?auto_197728 ) ) ( not ( = ?auto_197723 ?auto_197724 ) ) ( not ( = ?auto_197723 ?auto_197725 ) ) ( not ( = ?auto_197723 ?auto_197726 ) ) ( not ( = ?auto_197723 ?auto_197727 ) ) ( not ( = ?auto_197723 ?auto_197728 ) ) ( not ( = ?auto_197724 ?auto_197725 ) ) ( not ( = ?auto_197724 ?auto_197726 ) ) ( not ( = ?auto_197724 ?auto_197727 ) ) ( not ( = ?auto_197724 ?auto_197728 ) ) ( not ( = ?auto_197725 ?auto_197726 ) ) ( not ( = ?auto_197725 ?auto_197727 ) ) ( not ( = ?auto_197725 ?auto_197728 ) ) ( not ( = ?auto_197726 ?auto_197727 ) ) ( not ( = ?auto_197726 ?auto_197728 ) ) ( not ( = ?auto_197727 ?auto_197728 ) ) ( ON ?auto_197726 ?auto_197727 ) ( ON ?auto_197725 ?auto_197726 ) ( ON ?auto_197724 ?auto_197725 ) ( CLEAR ?auto_197722 ) ( ON ?auto_197723 ?auto_197724 ) ( CLEAR ?auto_197723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_197721 ?auto_197722 ?auto_197723 )
      ( MAKE-7PILE ?auto_197721 ?auto_197722 ?auto_197723 ?auto_197724 ?auto_197725 ?auto_197726 ?auto_197727 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197736 - BLOCK
      ?auto_197737 - BLOCK
      ?auto_197738 - BLOCK
      ?auto_197739 - BLOCK
      ?auto_197740 - BLOCK
      ?auto_197741 - BLOCK
      ?auto_197742 - BLOCK
    )
    :vars
    (
      ?auto_197743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197742 ?auto_197743 ) ( ON-TABLE ?auto_197736 ) ( not ( = ?auto_197736 ?auto_197737 ) ) ( not ( = ?auto_197736 ?auto_197738 ) ) ( not ( = ?auto_197736 ?auto_197739 ) ) ( not ( = ?auto_197736 ?auto_197740 ) ) ( not ( = ?auto_197736 ?auto_197741 ) ) ( not ( = ?auto_197736 ?auto_197742 ) ) ( not ( = ?auto_197736 ?auto_197743 ) ) ( not ( = ?auto_197737 ?auto_197738 ) ) ( not ( = ?auto_197737 ?auto_197739 ) ) ( not ( = ?auto_197737 ?auto_197740 ) ) ( not ( = ?auto_197737 ?auto_197741 ) ) ( not ( = ?auto_197737 ?auto_197742 ) ) ( not ( = ?auto_197737 ?auto_197743 ) ) ( not ( = ?auto_197738 ?auto_197739 ) ) ( not ( = ?auto_197738 ?auto_197740 ) ) ( not ( = ?auto_197738 ?auto_197741 ) ) ( not ( = ?auto_197738 ?auto_197742 ) ) ( not ( = ?auto_197738 ?auto_197743 ) ) ( not ( = ?auto_197739 ?auto_197740 ) ) ( not ( = ?auto_197739 ?auto_197741 ) ) ( not ( = ?auto_197739 ?auto_197742 ) ) ( not ( = ?auto_197739 ?auto_197743 ) ) ( not ( = ?auto_197740 ?auto_197741 ) ) ( not ( = ?auto_197740 ?auto_197742 ) ) ( not ( = ?auto_197740 ?auto_197743 ) ) ( not ( = ?auto_197741 ?auto_197742 ) ) ( not ( = ?auto_197741 ?auto_197743 ) ) ( not ( = ?auto_197742 ?auto_197743 ) ) ( ON ?auto_197741 ?auto_197742 ) ( ON ?auto_197740 ?auto_197741 ) ( ON ?auto_197739 ?auto_197740 ) ( ON ?auto_197738 ?auto_197739 ) ( CLEAR ?auto_197736 ) ( ON ?auto_197737 ?auto_197738 ) ( CLEAR ?auto_197737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_197736 ?auto_197737 )
      ( MAKE-7PILE ?auto_197736 ?auto_197737 ?auto_197738 ?auto_197739 ?auto_197740 ?auto_197741 ?auto_197742 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197751 - BLOCK
      ?auto_197752 - BLOCK
      ?auto_197753 - BLOCK
      ?auto_197754 - BLOCK
      ?auto_197755 - BLOCK
      ?auto_197756 - BLOCK
      ?auto_197757 - BLOCK
    )
    :vars
    (
      ?auto_197758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197757 ?auto_197758 ) ( ON-TABLE ?auto_197751 ) ( not ( = ?auto_197751 ?auto_197752 ) ) ( not ( = ?auto_197751 ?auto_197753 ) ) ( not ( = ?auto_197751 ?auto_197754 ) ) ( not ( = ?auto_197751 ?auto_197755 ) ) ( not ( = ?auto_197751 ?auto_197756 ) ) ( not ( = ?auto_197751 ?auto_197757 ) ) ( not ( = ?auto_197751 ?auto_197758 ) ) ( not ( = ?auto_197752 ?auto_197753 ) ) ( not ( = ?auto_197752 ?auto_197754 ) ) ( not ( = ?auto_197752 ?auto_197755 ) ) ( not ( = ?auto_197752 ?auto_197756 ) ) ( not ( = ?auto_197752 ?auto_197757 ) ) ( not ( = ?auto_197752 ?auto_197758 ) ) ( not ( = ?auto_197753 ?auto_197754 ) ) ( not ( = ?auto_197753 ?auto_197755 ) ) ( not ( = ?auto_197753 ?auto_197756 ) ) ( not ( = ?auto_197753 ?auto_197757 ) ) ( not ( = ?auto_197753 ?auto_197758 ) ) ( not ( = ?auto_197754 ?auto_197755 ) ) ( not ( = ?auto_197754 ?auto_197756 ) ) ( not ( = ?auto_197754 ?auto_197757 ) ) ( not ( = ?auto_197754 ?auto_197758 ) ) ( not ( = ?auto_197755 ?auto_197756 ) ) ( not ( = ?auto_197755 ?auto_197757 ) ) ( not ( = ?auto_197755 ?auto_197758 ) ) ( not ( = ?auto_197756 ?auto_197757 ) ) ( not ( = ?auto_197756 ?auto_197758 ) ) ( not ( = ?auto_197757 ?auto_197758 ) ) ( ON ?auto_197756 ?auto_197757 ) ( ON ?auto_197755 ?auto_197756 ) ( ON ?auto_197754 ?auto_197755 ) ( ON ?auto_197753 ?auto_197754 ) ( CLEAR ?auto_197751 ) ( ON ?auto_197752 ?auto_197753 ) ( CLEAR ?auto_197752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_197751 ?auto_197752 )
      ( MAKE-7PILE ?auto_197751 ?auto_197752 ?auto_197753 ?auto_197754 ?auto_197755 ?auto_197756 ?auto_197757 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197766 - BLOCK
      ?auto_197767 - BLOCK
      ?auto_197768 - BLOCK
      ?auto_197769 - BLOCK
      ?auto_197770 - BLOCK
      ?auto_197771 - BLOCK
      ?auto_197772 - BLOCK
    )
    :vars
    (
      ?auto_197773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197772 ?auto_197773 ) ( not ( = ?auto_197766 ?auto_197767 ) ) ( not ( = ?auto_197766 ?auto_197768 ) ) ( not ( = ?auto_197766 ?auto_197769 ) ) ( not ( = ?auto_197766 ?auto_197770 ) ) ( not ( = ?auto_197766 ?auto_197771 ) ) ( not ( = ?auto_197766 ?auto_197772 ) ) ( not ( = ?auto_197766 ?auto_197773 ) ) ( not ( = ?auto_197767 ?auto_197768 ) ) ( not ( = ?auto_197767 ?auto_197769 ) ) ( not ( = ?auto_197767 ?auto_197770 ) ) ( not ( = ?auto_197767 ?auto_197771 ) ) ( not ( = ?auto_197767 ?auto_197772 ) ) ( not ( = ?auto_197767 ?auto_197773 ) ) ( not ( = ?auto_197768 ?auto_197769 ) ) ( not ( = ?auto_197768 ?auto_197770 ) ) ( not ( = ?auto_197768 ?auto_197771 ) ) ( not ( = ?auto_197768 ?auto_197772 ) ) ( not ( = ?auto_197768 ?auto_197773 ) ) ( not ( = ?auto_197769 ?auto_197770 ) ) ( not ( = ?auto_197769 ?auto_197771 ) ) ( not ( = ?auto_197769 ?auto_197772 ) ) ( not ( = ?auto_197769 ?auto_197773 ) ) ( not ( = ?auto_197770 ?auto_197771 ) ) ( not ( = ?auto_197770 ?auto_197772 ) ) ( not ( = ?auto_197770 ?auto_197773 ) ) ( not ( = ?auto_197771 ?auto_197772 ) ) ( not ( = ?auto_197771 ?auto_197773 ) ) ( not ( = ?auto_197772 ?auto_197773 ) ) ( ON ?auto_197771 ?auto_197772 ) ( ON ?auto_197770 ?auto_197771 ) ( ON ?auto_197769 ?auto_197770 ) ( ON ?auto_197768 ?auto_197769 ) ( ON ?auto_197767 ?auto_197768 ) ( ON ?auto_197766 ?auto_197767 ) ( CLEAR ?auto_197766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_197766 )
      ( MAKE-7PILE ?auto_197766 ?auto_197767 ?auto_197768 ?auto_197769 ?auto_197770 ?auto_197771 ?auto_197772 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197781 - BLOCK
      ?auto_197782 - BLOCK
      ?auto_197783 - BLOCK
      ?auto_197784 - BLOCK
      ?auto_197785 - BLOCK
      ?auto_197786 - BLOCK
      ?auto_197787 - BLOCK
    )
    :vars
    (
      ?auto_197788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197787 ?auto_197788 ) ( not ( = ?auto_197781 ?auto_197782 ) ) ( not ( = ?auto_197781 ?auto_197783 ) ) ( not ( = ?auto_197781 ?auto_197784 ) ) ( not ( = ?auto_197781 ?auto_197785 ) ) ( not ( = ?auto_197781 ?auto_197786 ) ) ( not ( = ?auto_197781 ?auto_197787 ) ) ( not ( = ?auto_197781 ?auto_197788 ) ) ( not ( = ?auto_197782 ?auto_197783 ) ) ( not ( = ?auto_197782 ?auto_197784 ) ) ( not ( = ?auto_197782 ?auto_197785 ) ) ( not ( = ?auto_197782 ?auto_197786 ) ) ( not ( = ?auto_197782 ?auto_197787 ) ) ( not ( = ?auto_197782 ?auto_197788 ) ) ( not ( = ?auto_197783 ?auto_197784 ) ) ( not ( = ?auto_197783 ?auto_197785 ) ) ( not ( = ?auto_197783 ?auto_197786 ) ) ( not ( = ?auto_197783 ?auto_197787 ) ) ( not ( = ?auto_197783 ?auto_197788 ) ) ( not ( = ?auto_197784 ?auto_197785 ) ) ( not ( = ?auto_197784 ?auto_197786 ) ) ( not ( = ?auto_197784 ?auto_197787 ) ) ( not ( = ?auto_197784 ?auto_197788 ) ) ( not ( = ?auto_197785 ?auto_197786 ) ) ( not ( = ?auto_197785 ?auto_197787 ) ) ( not ( = ?auto_197785 ?auto_197788 ) ) ( not ( = ?auto_197786 ?auto_197787 ) ) ( not ( = ?auto_197786 ?auto_197788 ) ) ( not ( = ?auto_197787 ?auto_197788 ) ) ( ON ?auto_197786 ?auto_197787 ) ( ON ?auto_197785 ?auto_197786 ) ( ON ?auto_197784 ?auto_197785 ) ( ON ?auto_197783 ?auto_197784 ) ( ON ?auto_197782 ?auto_197783 ) ( ON ?auto_197781 ?auto_197782 ) ( CLEAR ?auto_197781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_197781 )
      ( MAKE-7PILE ?auto_197781 ?auto_197782 ?auto_197783 ?auto_197784 ?auto_197785 ?auto_197786 ?auto_197787 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197797 - BLOCK
      ?auto_197798 - BLOCK
      ?auto_197799 - BLOCK
      ?auto_197800 - BLOCK
      ?auto_197801 - BLOCK
      ?auto_197802 - BLOCK
      ?auto_197803 - BLOCK
      ?auto_197804 - BLOCK
    )
    :vars
    (
      ?auto_197805 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_197803 ) ( ON ?auto_197804 ?auto_197805 ) ( CLEAR ?auto_197804 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_197797 ) ( ON ?auto_197798 ?auto_197797 ) ( ON ?auto_197799 ?auto_197798 ) ( ON ?auto_197800 ?auto_197799 ) ( ON ?auto_197801 ?auto_197800 ) ( ON ?auto_197802 ?auto_197801 ) ( ON ?auto_197803 ?auto_197802 ) ( not ( = ?auto_197797 ?auto_197798 ) ) ( not ( = ?auto_197797 ?auto_197799 ) ) ( not ( = ?auto_197797 ?auto_197800 ) ) ( not ( = ?auto_197797 ?auto_197801 ) ) ( not ( = ?auto_197797 ?auto_197802 ) ) ( not ( = ?auto_197797 ?auto_197803 ) ) ( not ( = ?auto_197797 ?auto_197804 ) ) ( not ( = ?auto_197797 ?auto_197805 ) ) ( not ( = ?auto_197798 ?auto_197799 ) ) ( not ( = ?auto_197798 ?auto_197800 ) ) ( not ( = ?auto_197798 ?auto_197801 ) ) ( not ( = ?auto_197798 ?auto_197802 ) ) ( not ( = ?auto_197798 ?auto_197803 ) ) ( not ( = ?auto_197798 ?auto_197804 ) ) ( not ( = ?auto_197798 ?auto_197805 ) ) ( not ( = ?auto_197799 ?auto_197800 ) ) ( not ( = ?auto_197799 ?auto_197801 ) ) ( not ( = ?auto_197799 ?auto_197802 ) ) ( not ( = ?auto_197799 ?auto_197803 ) ) ( not ( = ?auto_197799 ?auto_197804 ) ) ( not ( = ?auto_197799 ?auto_197805 ) ) ( not ( = ?auto_197800 ?auto_197801 ) ) ( not ( = ?auto_197800 ?auto_197802 ) ) ( not ( = ?auto_197800 ?auto_197803 ) ) ( not ( = ?auto_197800 ?auto_197804 ) ) ( not ( = ?auto_197800 ?auto_197805 ) ) ( not ( = ?auto_197801 ?auto_197802 ) ) ( not ( = ?auto_197801 ?auto_197803 ) ) ( not ( = ?auto_197801 ?auto_197804 ) ) ( not ( = ?auto_197801 ?auto_197805 ) ) ( not ( = ?auto_197802 ?auto_197803 ) ) ( not ( = ?auto_197802 ?auto_197804 ) ) ( not ( = ?auto_197802 ?auto_197805 ) ) ( not ( = ?auto_197803 ?auto_197804 ) ) ( not ( = ?auto_197803 ?auto_197805 ) ) ( not ( = ?auto_197804 ?auto_197805 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_197804 ?auto_197805 )
      ( !STACK ?auto_197804 ?auto_197803 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197814 - BLOCK
      ?auto_197815 - BLOCK
      ?auto_197816 - BLOCK
      ?auto_197817 - BLOCK
      ?auto_197818 - BLOCK
      ?auto_197819 - BLOCK
      ?auto_197820 - BLOCK
      ?auto_197821 - BLOCK
    )
    :vars
    (
      ?auto_197822 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_197820 ) ( ON ?auto_197821 ?auto_197822 ) ( CLEAR ?auto_197821 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_197814 ) ( ON ?auto_197815 ?auto_197814 ) ( ON ?auto_197816 ?auto_197815 ) ( ON ?auto_197817 ?auto_197816 ) ( ON ?auto_197818 ?auto_197817 ) ( ON ?auto_197819 ?auto_197818 ) ( ON ?auto_197820 ?auto_197819 ) ( not ( = ?auto_197814 ?auto_197815 ) ) ( not ( = ?auto_197814 ?auto_197816 ) ) ( not ( = ?auto_197814 ?auto_197817 ) ) ( not ( = ?auto_197814 ?auto_197818 ) ) ( not ( = ?auto_197814 ?auto_197819 ) ) ( not ( = ?auto_197814 ?auto_197820 ) ) ( not ( = ?auto_197814 ?auto_197821 ) ) ( not ( = ?auto_197814 ?auto_197822 ) ) ( not ( = ?auto_197815 ?auto_197816 ) ) ( not ( = ?auto_197815 ?auto_197817 ) ) ( not ( = ?auto_197815 ?auto_197818 ) ) ( not ( = ?auto_197815 ?auto_197819 ) ) ( not ( = ?auto_197815 ?auto_197820 ) ) ( not ( = ?auto_197815 ?auto_197821 ) ) ( not ( = ?auto_197815 ?auto_197822 ) ) ( not ( = ?auto_197816 ?auto_197817 ) ) ( not ( = ?auto_197816 ?auto_197818 ) ) ( not ( = ?auto_197816 ?auto_197819 ) ) ( not ( = ?auto_197816 ?auto_197820 ) ) ( not ( = ?auto_197816 ?auto_197821 ) ) ( not ( = ?auto_197816 ?auto_197822 ) ) ( not ( = ?auto_197817 ?auto_197818 ) ) ( not ( = ?auto_197817 ?auto_197819 ) ) ( not ( = ?auto_197817 ?auto_197820 ) ) ( not ( = ?auto_197817 ?auto_197821 ) ) ( not ( = ?auto_197817 ?auto_197822 ) ) ( not ( = ?auto_197818 ?auto_197819 ) ) ( not ( = ?auto_197818 ?auto_197820 ) ) ( not ( = ?auto_197818 ?auto_197821 ) ) ( not ( = ?auto_197818 ?auto_197822 ) ) ( not ( = ?auto_197819 ?auto_197820 ) ) ( not ( = ?auto_197819 ?auto_197821 ) ) ( not ( = ?auto_197819 ?auto_197822 ) ) ( not ( = ?auto_197820 ?auto_197821 ) ) ( not ( = ?auto_197820 ?auto_197822 ) ) ( not ( = ?auto_197821 ?auto_197822 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_197821 ?auto_197822 )
      ( !STACK ?auto_197821 ?auto_197820 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197831 - BLOCK
      ?auto_197832 - BLOCK
      ?auto_197833 - BLOCK
      ?auto_197834 - BLOCK
      ?auto_197835 - BLOCK
      ?auto_197836 - BLOCK
      ?auto_197837 - BLOCK
      ?auto_197838 - BLOCK
    )
    :vars
    (
      ?auto_197839 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197838 ?auto_197839 ) ( ON-TABLE ?auto_197831 ) ( ON ?auto_197832 ?auto_197831 ) ( ON ?auto_197833 ?auto_197832 ) ( ON ?auto_197834 ?auto_197833 ) ( ON ?auto_197835 ?auto_197834 ) ( ON ?auto_197836 ?auto_197835 ) ( not ( = ?auto_197831 ?auto_197832 ) ) ( not ( = ?auto_197831 ?auto_197833 ) ) ( not ( = ?auto_197831 ?auto_197834 ) ) ( not ( = ?auto_197831 ?auto_197835 ) ) ( not ( = ?auto_197831 ?auto_197836 ) ) ( not ( = ?auto_197831 ?auto_197837 ) ) ( not ( = ?auto_197831 ?auto_197838 ) ) ( not ( = ?auto_197831 ?auto_197839 ) ) ( not ( = ?auto_197832 ?auto_197833 ) ) ( not ( = ?auto_197832 ?auto_197834 ) ) ( not ( = ?auto_197832 ?auto_197835 ) ) ( not ( = ?auto_197832 ?auto_197836 ) ) ( not ( = ?auto_197832 ?auto_197837 ) ) ( not ( = ?auto_197832 ?auto_197838 ) ) ( not ( = ?auto_197832 ?auto_197839 ) ) ( not ( = ?auto_197833 ?auto_197834 ) ) ( not ( = ?auto_197833 ?auto_197835 ) ) ( not ( = ?auto_197833 ?auto_197836 ) ) ( not ( = ?auto_197833 ?auto_197837 ) ) ( not ( = ?auto_197833 ?auto_197838 ) ) ( not ( = ?auto_197833 ?auto_197839 ) ) ( not ( = ?auto_197834 ?auto_197835 ) ) ( not ( = ?auto_197834 ?auto_197836 ) ) ( not ( = ?auto_197834 ?auto_197837 ) ) ( not ( = ?auto_197834 ?auto_197838 ) ) ( not ( = ?auto_197834 ?auto_197839 ) ) ( not ( = ?auto_197835 ?auto_197836 ) ) ( not ( = ?auto_197835 ?auto_197837 ) ) ( not ( = ?auto_197835 ?auto_197838 ) ) ( not ( = ?auto_197835 ?auto_197839 ) ) ( not ( = ?auto_197836 ?auto_197837 ) ) ( not ( = ?auto_197836 ?auto_197838 ) ) ( not ( = ?auto_197836 ?auto_197839 ) ) ( not ( = ?auto_197837 ?auto_197838 ) ) ( not ( = ?auto_197837 ?auto_197839 ) ) ( not ( = ?auto_197838 ?auto_197839 ) ) ( CLEAR ?auto_197836 ) ( ON ?auto_197837 ?auto_197838 ) ( CLEAR ?auto_197837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_197831 ?auto_197832 ?auto_197833 ?auto_197834 ?auto_197835 ?auto_197836 ?auto_197837 )
      ( MAKE-8PILE ?auto_197831 ?auto_197832 ?auto_197833 ?auto_197834 ?auto_197835 ?auto_197836 ?auto_197837 ?auto_197838 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197848 - BLOCK
      ?auto_197849 - BLOCK
      ?auto_197850 - BLOCK
      ?auto_197851 - BLOCK
      ?auto_197852 - BLOCK
      ?auto_197853 - BLOCK
      ?auto_197854 - BLOCK
      ?auto_197855 - BLOCK
    )
    :vars
    (
      ?auto_197856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197855 ?auto_197856 ) ( ON-TABLE ?auto_197848 ) ( ON ?auto_197849 ?auto_197848 ) ( ON ?auto_197850 ?auto_197849 ) ( ON ?auto_197851 ?auto_197850 ) ( ON ?auto_197852 ?auto_197851 ) ( ON ?auto_197853 ?auto_197852 ) ( not ( = ?auto_197848 ?auto_197849 ) ) ( not ( = ?auto_197848 ?auto_197850 ) ) ( not ( = ?auto_197848 ?auto_197851 ) ) ( not ( = ?auto_197848 ?auto_197852 ) ) ( not ( = ?auto_197848 ?auto_197853 ) ) ( not ( = ?auto_197848 ?auto_197854 ) ) ( not ( = ?auto_197848 ?auto_197855 ) ) ( not ( = ?auto_197848 ?auto_197856 ) ) ( not ( = ?auto_197849 ?auto_197850 ) ) ( not ( = ?auto_197849 ?auto_197851 ) ) ( not ( = ?auto_197849 ?auto_197852 ) ) ( not ( = ?auto_197849 ?auto_197853 ) ) ( not ( = ?auto_197849 ?auto_197854 ) ) ( not ( = ?auto_197849 ?auto_197855 ) ) ( not ( = ?auto_197849 ?auto_197856 ) ) ( not ( = ?auto_197850 ?auto_197851 ) ) ( not ( = ?auto_197850 ?auto_197852 ) ) ( not ( = ?auto_197850 ?auto_197853 ) ) ( not ( = ?auto_197850 ?auto_197854 ) ) ( not ( = ?auto_197850 ?auto_197855 ) ) ( not ( = ?auto_197850 ?auto_197856 ) ) ( not ( = ?auto_197851 ?auto_197852 ) ) ( not ( = ?auto_197851 ?auto_197853 ) ) ( not ( = ?auto_197851 ?auto_197854 ) ) ( not ( = ?auto_197851 ?auto_197855 ) ) ( not ( = ?auto_197851 ?auto_197856 ) ) ( not ( = ?auto_197852 ?auto_197853 ) ) ( not ( = ?auto_197852 ?auto_197854 ) ) ( not ( = ?auto_197852 ?auto_197855 ) ) ( not ( = ?auto_197852 ?auto_197856 ) ) ( not ( = ?auto_197853 ?auto_197854 ) ) ( not ( = ?auto_197853 ?auto_197855 ) ) ( not ( = ?auto_197853 ?auto_197856 ) ) ( not ( = ?auto_197854 ?auto_197855 ) ) ( not ( = ?auto_197854 ?auto_197856 ) ) ( not ( = ?auto_197855 ?auto_197856 ) ) ( CLEAR ?auto_197853 ) ( ON ?auto_197854 ?auto_197855 ) ( CLEAR ?auto_197854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_197848 ?auto_197849 ?auto_197850 ?auto_197851 ?auto_197852 ?auto_197853 ?auto_197854 )
      ( MAKE-8PILE ?auto_197848 ?auto_197849 ?auto_197850 ?auto_197851 ?auto_197852 ?auto_197853 ?auto_197854 ?auto_197855 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197865 - BLOCK
      ?auto_197866 - BLOCK
      ?auto_197867 - BLOCK
      ?auto_197868 - BLOCK
      ?auto_197869 - BLOCK
      ?auto_197870 - BLOCK
      ?auto_197871 - BLOCK
      ?auto_197872 - BLOCK
    )
    :vars
    (
      ?auto_197873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197872 ?auto_197873 ) ( ON-TABLE ?auto_197865 ) ( ON ?auto_197866 ?auto_197865 ) ( ON ?auto_197867 ?auto_197866 ) ( ON ?auto_197868 ?auto_197867 ) ( ON ?auto_197869 ?auto_197868 ) ( not ( = ?auto_197865 ?auto_197866 ) ) ( not ( = ?auto_197865 ?auto_197867 ) ) ( not ( = ?auto_197865 ?auto_197868 ) ) ( not ( = ?auto_197865 ?auto_197869 ) ) ( not ( = ?auto_197865 ?auto_197870 ) ) ( not ( = ?auto_197865 ?auto_197871 ) ) ( not ( = ?auto_197865 ?auto_197872 ) ) ( not ( = ?auto_197865 ?auto_197873 ) ) ( not ( = ?auto_197866 ?auto_197867 ) ) ( not ( = ?auto_197866 ?auto_197868 ) ) ( not ( = ?auto_197866 ?auto_197869 ) ) ( not ( = ?auto_197866 ?auto_197870 ) ) ( not ( = ?auto_197866 ?auto_197871 ) ) ( not ( = ?auto_197866 ?auto_197872 ) ) ( not ( = ?auto_197866 ?auto_197873 ) ) ( not ( = ?auto_197867 ?auto_197868 ) ) ( not ( = ?auto_197867 ?auto_197869 ) ) ( not ( = ?auto_197867 ?auto_197870 ) ) ( not ( = ?auto_197867 ?auto_197871 ) ) ( not ( = ?auto_197867 ?auto_197872 ) ) ( not ( = ?auto_197867 ?auto_197873 ) ) ( not ( = ?auto_197868 ?auto_197869 ) ) ( not ( = ?auto_197868 ?auto_197870 ) ) ( not ( = ?auto_197868 ?auto_197871 ) ) ( not ( = ?auto_197868 ?auto_197872 ) ) ( not ( = ?auto_197868 ?auto_197873 ) ) ( not ( = ?auto_197869 ?auto_197870 ) ) ( not ( = ?auto_197869 ?auto_197871 ) ) ( not ( = ?auto_197869 ?auto_197872 ) ) ( not ( = ?auto_197869 ?auto_197873 ) ) ( not ( = ?auto_197870 ?auto_197871 ) ) ( not ( = ?auto_197870 ?auto_197872 ) ) ( not ( = ?auto_197870 ?auto_197873 ) ) ( not ( = ?auto_197871 ?auto_197872 ) ) ( not ( = ?auto_197871 ?auto_197873 ) ) ( not ( = ?auto_197872 ?auto_197873 ) ) ( ON ?auto_197871 ?auto_197872 ) ( CLEAR ?auto_197869 ) ( ON ?auto_197870 ?auto_197871 ) ( CLEAR ?auto_197870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_197865 ?auto_197866 ?auto_197867 ?auto_197868 ?auto_197869 ?auto_197870 )
      ( MAKE-8PILE ?auto_197865 ?auto_197866 ?auto_197867 ?auto_197868 ?auto_197869 ?auto_197870 ?auto_197871 ?auto_197872 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197882 - BLOCK
      ?auto_197883 - BLOCK
      ?auto_197884 - BLOCK
      ?auto_197885 - BLOCK
      ?auto_197886 - BLOCK
      ?auto_197887 - BLOCK
      ?auto_197888 - BLOCK
      ?auto_197889 - BLOCK
    )
    :vars
    (
      ?auto_197890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197889 ?auto_197890 ) ( ON-TABLE ?auto_197882 ) ( ON ?auto_197883 ?auto_197882 ) ( ON ?auto_197884 ?auto_197883 ) ( ON ?auto_197885 ?auto_197884 ) ( ON ?auto_197886 ?auto_197885 ) ( not ( = ?auto_197882 ?auto_197883 ) ) ( not ( = ?auto_197882 ?auto_197884 ) ) ( not ( = ?auto_197882 ?auto_197885 ) ) ( not ( = ?auto_197882 ?auto_197886 ) ) ( not ( = ?auto_197882 ?auto_197887 ) ) ( not ( = ?auto_197882 ?auto_197888 ) ) ( not ( = ?auto_197882 ?auto_197889 ) ) ( not ( = ?auto_197882 ?auto_197890 ) ) ( not ( = ?auto_197883 ?auto_197884 ) ) ( not ( = ?auto_197883 ?auto_197885 ) ) ( not ( = ?auto_197883 ?auto_197886 ) ) ( not ( = ?auto_197883 ?auto_197887 ) ) ( not ( = ?auto_197883 ?auto_197888 ) ) ( not ( = ?auto_197883 ?auto_197889 ) ) ( not ( = ?auto_197883 ?auto_197890 ) ) ( not ( = ?auto_197884 ?auto_197885 ) ) ( not ( = ?auto_197884 ?auto_197886 ) ) ( not ( = ?auto_197884 ?auto_197887 ) ) ( not ( = ?auto_197884 ?auto_197888 ) ) ( not ( = ?auto_197884 ?auto_197889 ) ) ( not ( = ?auto_197884 ?auto_197890 ) ) ( not ( = ?auto_197885 ?auto_197886 ) ) ( not ( = ?auto_197885 ?auto_197887 ) ) ( not ( = ?auto_197885 ?auto_197888 ) ) ( not ( = ?auto_197885 ?auto_197889 ) ) ( not ( = ?auto_197885 ?auto_197890 ) ) ( not ( = ?auto_197886 ?auto_197887 ) ) ( not ( = ?auto_197886 ?auto_197888 ) ) ( not ( = ?auto_197886 ?auto_197889 ) ) ( not ( = ?auto_197886 ?auto_197890 ) ) ( not ( = ?auto_197887 ?auto_197888 ) ) ( not ( = ?auto_197887 ?auto_197889 ) ) ( not ( = ?auto_197887 ?auto_197890 ) ) ( not ( = ?auto_197888 ?auto_197889 ) ) ( not ( = ?auto_197888 ?auto_197890 ) ) ( not ( = ?auto_197889 ?auto_197890 ) ) ( ON ?auto_197888 ?auto_197889 ) ( CLEAR ?auto_197886 ) ( ON ?auto_197887 ?auto_197888 ) ( CLEAR ?auto_197887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_197882 ?auto_197883 ?auto_197884 ?auto_197885 ?auto_197886 ?auto_197887 )
      ( MAKE-8PILE ?auto_197882 ?auto_197883 ?auto_197884 ?auto_197885 ?auto_197886 ?auto_197887 ?auto_197888 ?auto_197889 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197899 - BLOCK
      ?auto_197900 - BLOCK
      ?auto_197901 - BLOCK
      ?auto_197902 - BLOCK
      ?auto_197903 - BLOCK
      ?auto_197904 - BLOCK
      ?auto_197905 - BLOCK
      ?auto_197906 - BLOCK
    )
    :vars
    (
      ?auto_197907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197906 ?auto_197907 ) ( ON-TABLE ?auto_197899 ) ( ON ?auto_197900 ?auto_197899 ) ( ON ?auto_197901 ?auto_197900 ) ( ON ?auto_197902 ?auto_197901 ) ( not ( = ?auto_197899 ?auto_197900 ) ) ( not ( = ?auto_197899 ?auto_197901 ) ) ( not ( = ?auto_197899 ?auto_197902 ) ) ( not ( = ?auto_197899 ?auto_197903 ) ) ( not ( = ?auto_197899 ?auto_197904 ) ) ( not ( = ?auto_197899 ?auto_197905 ) ) ( not ( = ?auto_197899 ?auto_197906 ) ) ( not ( = ?auto_197899 ?auto_197907 ) ) ( not ( = ?auto_197900 ?auto_197901 ) ) ( not ( = ?auto_197900 ?auto_197902 ) ) ( not ( = ?auto_197900 ?auto_197903 ) ) ( not ( = ?auto_197900 ?auto_197904 ) ) ( not ( = ?auto_197900 ?auto_197905 ) ) ( not ( = ?auto_197900 ?auto_197906 ) ) ( not ( = ?auto_197900 ?auto_197907 ) ) ( not ( = ?auto_197901 ?auto_197902 ) ) ( not ( = ?auto_197901 ?auto_197903 ) ) ( not ( = ?auto_197901 ?auto_197904 ) ) ( not ( = ?auto_197901 ?auto_197905 ) ) ( not ( = ?auto_197901 ?auto_197906 ) ) ( not ( = ?auto_197901 ?auto_197907 ) ) ( not ( = ?auto_197902 ?auto_197903 ) ) ( not ( = ?auto_197902 ?auto_197904 ) ) ( not ( = ?auto_197902 ?auto_197905 ) ) ( not ( = ?auto_197902 ?auto_197906 ) ) ( not ( = ?auto_197902 ?auto_197907 ) ) ( not ( = ?auto_197903 ?auto_197904 ) ) ( not ( = ?auto_197903 ?auto_197905 ) ) ( not ( = ?auto_197903 ?auto_197906 ) ) ( not ( = ?auto_197903 ?auto_197907 ) ) ( not ( = ?auto_197904 ?auto_197905 ) ) ( not ( = ?auto_197904 ?auto_197906 ) ) ( not ( = ?auto_197904 ?auto_197907 ) ) ( not ( = ?auto_197905 ?auto_197906 ) ) ( not ( = ?auto_197905 ?auto_197907 ) ) ( not ( = ?auto_197906 ?auto_197907 ) ) ( ON ?auto_197905 ?auto_197906 ) ( ON ?auto_197904 ?auto_197905 ) ( CLEAR ?auto_197902 ) ( ON ?auto_197903 ?auto_197904 ) ( CLEAR ?auto_197903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_197899 ?auto_197900 ?auto_197901 ?auto_197902 ?auto_197903 )
      ( MAKE-8PILE ?auto_197899 ?auto_197900 ?auto_197901 ?auto_197902 ?auto_197903 ?auto_197904 ?auto_197905 ?auto_197906 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197916 - BLOCK
      ?auto_197917 - BLOCK
      ?auto_197918 - BLOCK
      ?auto_197919 - BLOCK
      ?auto_197920 - BLOCK
      ?auto_197921 - BLOCK
      ?auto_197922 - BLOCK
      ?auto_197923 - BLOCK
    )
    :vars
    (
      ?auto_197924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197923 ?auto_197924 ) ( ON-TABLE ?auto_197916 ) ( ON ?auto_197917 ?auto_197916 ) ( ON ?auto_197918 ?auto_197917 ) ( ON ?auto_197919 ?auto_197918 ) ( not ( = ?auto_197916 ?auto_197917 ) ) ( not ( = ?auto_197916 ?auto_197918 ) ) ( not ( = ?auto_197916 ?auto_197919 ) ) ( not ( = ?auto_197916 ?auto_197920 ) ) ( not ( = ?auto_197916 ?auto_197921 ) ) ( not ( = ?auto_197916 ?auto_197922 ) ) ( not ( = ?auto_197916 ?auto_197923 ) ) ( not ( = ?auto_197916 ?auto_197924 ) ) ( not ( = ?auto_197917 ?auto_197918 ) ) ( not ( = ?auto_197917 ?auto_197919 ) ) ( not ( = ?auto_197917 ?auto_197920 ) ) ( not ( = ?auto_197917 ?auto_197921 ) ) ( not ( = ?auto_197917 ?auto_197922 ) ) ( not ( = ?auto_197917 ?auto_197923 ) ) ( not ( = ?auto_197917 ?auto_197924 ) ) ( not ( = ?auto_197918 ?auto_197919 ) ) ( not ( = ?auto_197918 ?auto_197920 ) ) ( not ( = ?auto_197918 ?auto_197921 ) ) ( not ( = ?auto_197918 ?auto_197922 ) ) ( not ( = ?auto_197918 ?auto_197923 ) ) ( not ( = ?auto_197918 ?auto_197924 ) ) ( not ( = ?auto_197919 ?auto_197920 ) ) ( not ( = ?auto_197919 ?auto_197921 ) ) ( not ( = ?auto_197919 ?auto_197922 ) ) ( not ( = ?auto_197919 ?auto_197923 ) ) ( not ( = ?auto_197919 ?auto_197924 ) ) ( not ( = ?auto_197920 ?auto_197921 ) ) ( not ( = ?auto_197920 ?auto_197922 ) ) ( not ( = ?auto_197920 ?auto_197923 ) ) ( not ( = ?auto_197920 ?auto_197924 ) ) ( not ( = ?auto_197921 ?auto_197922 ) ) ( not ( = ?auto_197921 ?auto_197923 ) ) ( not ( = ?auto_197921 ?auto_197924 ) ) ( not ( = ?auto_197922 ?auto_197923 ) ) ( not ( = ?auto_197922 ?auto_197924 ) ) ( not ( = ?auto_197923 ?auto_197924 ) ) ( ON ?auto_197922 ?auto_197923 ) ( ON ?auto_197921 ?auto_197922 ) ( CLEAR ?auto_197919 ) ( ON ?auto_197920 ?auto_197921 ) ( CLEAR ?auto_197920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_197916 ?auto_197917 ?auto_197918 ?auto_197919 ?auto_197920 )
      ( MAKE-8PILE ?auto_197916 ?auto_197917 ?auto_197918 ?auto_197919 ?auto_197920 ?auto_197921 ?auto_197922 ?auto_197923 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197933 - BLOCK
      ?auto_197934 - BLOCK
      ?auto_197935 - BLOCK
      ?auto_197936 - BLOCK
      ?auto_197937 - BLOCK
      ?auto_197938 - BLOCK
      ?auto_197939 - BLOCK
      ?auto_197940 - BLOCK
    )
    :vars
    (
      ?auto_197941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197940 ?auto_197941 ) ( ON-TABLE ?auto_197933 ) ( ON ?auto_197934 ?auto_197933 ) ( ON ?auto_197935 ?auto_197934 ) ( not ( = ?auto_197933 ?auto_197934 ) ) ( not ( = ?auto_197933 ?auto_197935 ) ) ( not ( = ?auto_197933 ?auto_197936 ) ) ( not ( = ?auto_197933 ?auto_197937 ) ) ( not ( = ?auto_197933 ?auto_197938 ) ) ( not ( = ?auto_197933 ?auto_197939 ) ) ( not ( = ?auto_197933 ?auto_197940 ) ) ( not ( = ?auto_197933 ?auto_197941 ) ) ( not ( = ?auto_197934 ?auto_197935 ) ) ( not ( = ?auto_197934 ?auto_197936 ) ) ( not ( = ?auto_197934 ?auto_197937 ) ) ( not ( = ?auto_197934 ?auto_197938 ) ) ( not ( = ?auto_197934 ?auto_197939 ) ) ( not ( = ?auto_197934 ?auto_197940 ) ) ( not ( = ?auto_197934 ?auto_197941 ) ) ( not ( = ?auto_197935 ?auto_197936 ) ) ( not ( = ?auto_197935 ?auto_197937 ) ) ( not ( = ?auto_197935 ?auto_197938 ) ) ( not ( = ?auto_197935 ?auto_197939 ) ) ( not ( = ?auto_197935 ?auto_197940 ) ) ( not ( = ?auto_197935 ?auto_197941 ) ) ( not ( = ?auto_197936 ?auto_197937 ) ) ( not ( = ?auto_197936 ?auto_197938 ) ) ( not ( = ?auto_197936 ?auto_197939 ) ) ( not ( = ?auto_197936 ?auto_197940 ) ) ( not ( = ?auto_197936 ?auto_197941 ) ) ( not ( = ?auto_197937 ?auto_197938 ) ) ( not ( = ?auto_197937 ?auto_197939 ) ) ( not ( = ?auto_197937 ?auto_197940 ) ) ( not ( = ?auto_197937 ?auto_197941 ) ) ( not ( = ?auto_197938 ?auto_197939 ) ) ( not ( = ?auto_197938 ?auto_197940 ) ) ( not ( = ?auto_197938 ?auto_197941 ) ) ( not ( = ?auto_197939 ?auto_197940 ) ) ( not ( = ?auto_197939 ?auto_197941 ) ) ( not ( = ?auto_197940 ?auto_197941 ) ) ( ON ?auto_197939 ?auto_197940 ) ( ON ?auto_197938 ?auto_197939 ) ( ON ?auto_197937 ?auto_197938 ) ( CLEAR ?auto_197935 ) ( ON ?auto_197936 ?auto_197937 ) ( CLEAR ?auto_197936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_197933 ?auto_197934 ?auto_197935 ?auto_197936 )
      ( MAKE-8PILE ?auto_197933 ?auto_197934 ?auto_197935 ?auto_197936 ?auto_197937 ?auto_197938 ?auto_197939 ?auto_197940 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197950 - BLOCK
      ?auto_197951 - BLOCK
      ?auto_197952 - BLOCK
      ?auto_197953 - BLOCK
      ?auto_197954 - BLOCK
      ?auto_197955 - BLOCK
      ?auto_197956 - BLOCK
      ?auto_197957 - BLOCK
    )
    :vars
    (
      ?auto_197958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197957 ?auto_197958 ) ( ON-TABLE ?auto_197950 ) ( ON ?auto_197951 ?auto_197950 ) ( ON ?auto_197952 ?auto_197951 ) ( not ( = ?auto_197950 ?auto_197951 ) ) ( not ( = ?auto_197950 ?auto_197952 ) ) ( not ( = ?auto_197950 ?auto_197953 ) ) ( not ( = ?auto_197950 ?auto_197954 ) ) ( not ( = ?auto_197950 ?auto_197955 ) ) ( not ( = ?auto_197950 ?auto_197956 ) ) ( not ( = ?auto_197950 ?auto_197957 ) ) ( not ( = ?auto_197950 ?auto_197958 ) ) ( not ( = ?auto_197951 ?auto_197952 ) ) ( not ( = ?auto_197951 ?auto_197953 ) ) ( not ( = ?auto_197951 ?auto_197954 ) ) ( not ( = ?auto_197951 ?auto_197955 ) ) ( not ( = ?auto_197951 ?auto_197956 ) ) ( not ( = ?auto_197951 ?auto_197957 ) ) ( not ( = ?auto_197951 ?auto_197958 ) ) ( not ( = ?auto_197952 ?auto_197953 ) ) ( not ( = ?auto_197952 ?auto_197954 ) ) ( not ( = ?auto_197952 ?auto_197955 ) ) ( not ( = ?auto_197952 ?auto_197956 ) ) ( not ( = ?auto_197952 ?auto_197957 ) ) ( not ( = ?auto_197952 ?auto_197958 ) ) ( not ( = ?auto_197953 ?auto_197954 ) ) ( not ( = ?auto_197953 ?auto_197955 ) ) ( not ( = ?auto_197953 ?auto_197956 ) ) ( not ( = ?auto_197953 ?auto_197957 ) ) ( not ( = ?auto_197953 ?auto_197958 ) ) ( not ( = ?auto_197954 ?auto_197955 ) ) ( not ( = ?auto_197954 ?auto_197956 ) ) ( not ( = ?auto_197954 ?auto_197957 ) ) ( not ( = ?auto_197954 ?auto_197958 ) ) ( not ( = ?auto_197955 ?auto_197956 ) ) ( not ( = ?auto_197955 ?auto_197957 ) ) ( not ( = ?auto_197955 ?auto_197958 ) ) ( not ( = ?auto_197956 ?auto_197957 ) ) ( not ( = ?auto_197956 ?auto_197958 ) ) ( not ( = ?auto_197957 ?auto_197958 ) ) ( ON ?auto_197956 ?auto_197957 ) ( ON ?auto_197955 ?auto_197956 ) ( ON ?auto_197954 ?auto_197955 ) ( CLEAR ?auto_197952 ) ( ON ?auto_197953 ?auto_197954 ) ( CLEAR ?auto_197953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_197950 ?auto_197951 ?auto_197952 ?auto_197953 )
      ( MAKE-8PILE ?auto_197950 ?auto_197951 ?auto_197952 ?auto_197953 ?auto_197954 ?auto_197955 ?auto_197956 ?auto_197957 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197967 - BLOCK
      ?auto_197968 - BLOCK
      ?auto_197969 - BLOCK
      ?auto_197970 - BLOCK
      ?auto_197971 - BLOCK
      ?auto_197972 - BLOCK
      ?auto_197973 - BLOCK
      ?auto_197974 - BLOCK
    )
    :vars
    (
      ?auto_197975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197974 ?auto_197975 ) ( ON-TABLE ?auto_197967 ) ( ON ?auto_197968 ?auto_197967 ) ( not ( = ?auto_197967 ?auto_197968 ) ) ( not ( = ?auto_197967 ?auto_197969 ) ) ( not ( = ?auto_197967 ?auto_197970 ) ) ( not ( = ?auto_197967 ?auto_197971 ) ) ( not ( = ?auto_197967 ?auto_197972 ) ) ( not ( = ?auto_197967 ?auto_197973 ) ) ( not ( = ?auto_197967 ?auto_197974 ) ) ( not ( = ?auto_197967 ?auto_197975 ) ) ( not ( = ?auto_197968 ?auto_197969 ) ) ( not ( = ?auto_197968 ?auto_197970 ) ) ( not ( = ?auto_197968 ?auto_197971 ) ) ( not ( = ?auto_197968 ?auto_197972 ) ) ( not ( = ?auto_197968 ?auto_197973 ) ) ( not ( = ?auto_197968 ?auto_197974 ) ) ( not ( = ?auto_197968 ?auto_197975 ) ) ( not ( = ?auto_197969 ?auto_197970 ) ) ( not ( = ?auto_197969 ?auto_197971 ) ) ( not ( = ?auto_197969 ?auto_197972 ) ) ( not ( = ?auto_197969 ?auto_197973 ) ) ( not ( = ?auto_197969 ?auto_197974 ) ) ( not ( = ?auto_197969 ?auto_197975 ) ) ( not ( = ?auto_197970 ?auto_197971 ) ) ( not ( = ?auto_197970 ?auto_197972 ) ) ( not ( = ?auto_197970 ?auto_197973 ) ) ( not ( = ?auto_197970 ?auto_197974 ) ) ( not ( = ?auto_197970 ?auto_197975 ) ) ( not ( = ?auto_197971 ?auto_197972 ) ) ( not ( = ?auto_197971 ?auto_197973 ) ) ( not ( = ?auto_197971 ?auto_197974 ) ) ( not ( = ?auto_197971 ?auto_197975 ) ) ( not ( = ?auto_197972 ?auto_197973 ) ) ( not ( = ?auto_197972 ?auto_197974 ) ) ( not ( = ?auto_197972 ?auto_197975 ) ) ( not ( = ?auto_197973 ?auto_197974 ) ) ( not ( = ?auto_197973 ?auto_197975 ) ) ( not ( = ?auto_197974 ?auto_197975 ) ) ( ON ?auto_197973 ?auto_197974 ) ( ON ?auto_197972 ?auto_197973 ) ( ON ?auto_197971 ?auto_197972 ) ( ON ?auto_197970 ?auto_197971 ) ( CLEAR ?auto_197968 ) ( ON ?auto_197969 ?auto_197970 ) ( CLEAR ?auto_197969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_197967 ?auto_197968 ?auto_197969 )
      ( MAKE-8PILE ?auto_197967 ?auto_197968 ?auto_197969 ?auto_197970 ?auto_197971 ?auto_197972 ?auto_197973 ?auto_197974 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197984 - BLOCK
      ?auto_197985 - BLOCK
      ?auto_197986 - BLOCK
      ?auto_197987 - BLOCK
      ?auto_197988 - BLOCK
      ?auto_197989 - BLOCK
      ?auto_197990 - BLOCK
      ?auto_197991 - BLOCK
    )
    :vars
    (
      ?auto_197992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197991 ?auto_197992 ) ( ON-TABLE ?auto_197984 ) ( ON ?auto_197985 ?auto_197984 ) ( not ( = ?auto_197984 ?auto_197985 ) ) ( not ( = ?auto_197984 ?auto_197986 ) ) ( not ( = ?auto_197984 ?auto_197987 ) ) ( not ( = ?auto_197984 ?auto_197988 ) ) ( not ( = ?auto_197984 ?auto_197989 ) ) ( not ( = ?auto_197984 ?auto_197990 ) ) ( not ( = ?auto_197984 ?auto_197991 ) ) ( not ( = ?auto_197984 ?auto_197992 ) ) ( not ( = ?auto_197985 ?auto_197986 ) ) ( not ( = ?auto_197985 ?auto_197987 ) ) ( not ( = ?auto_197985 ?auto_197988 ) ) ( not ( = ?auto_197985 ?auto_197989 ) ) ( not ( = ?auto_197985 ?auto_197990 ) ) ( not ( = ?auto_197985 ?auto_197991 ) ) ( not ( = ?auto_197985 ?auto_197992 ) ) ( not ( = ?auto_197986 ?auto_197987 ) ) ( not ( = ?auto_197986 ?auto_197988 ) ) ( not ( = ?auto_197986 ?auto_197989 ) ) ( not ( = ?auto_197986 ?auto_197990 ) ) ( not ( = ?auto_197986 ?auto_197991 ) ) ( not ( = ?auto_197986 ?auto_197992 ) ) ( not ( = ?auto_197987 ?auto_197988 ) ) ( not ( = ?auto_197987 ?auto_197989 ) ) ( not ( = ?auto_197987 ?auto_197990 ) ) ( not ( = ?auto_197987 ?auto_197991 ) ) ( not ( = ?auto_197987 ?auto_197992 ) ) ( not ( = ?auto_197988 ?auto_197989 ) ) ( not ( = ?auto_197988 ?auto_197990 ) ) ( not ( = ?auto_197988 ?auto_197991 ) ) ( not ( = ?auto_197988 ?auto_197992 ) ) ( not ( = ?auto_197989 ?auto_197990 ) ) ( not ( = ?auto_197989 ?auto_197991 ) ) ( not ( = ?auto_197989 ?auto_197992 ) ) ( not ( = ?auto_197990 ?auto_197991 ) ) ( not ( = ?auto_197990 ?auto_197992 ) ) ( not ( = ?auto_197991 ?auto_197992 ) ) ( ON ?auto_197990 ?auto_197991 ) ( ON ?auto_197989 ?auto_197990 ) ( ON ?auto_197988 ?auto_197989 ) ( ON ?auto_197987 ?auto_197988 ) ( CLEAR ?auto_197985 ) ( ON ?auto_197986 ?auto_197987 ) ( CLEAR ?auto_197986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_197984 ?auto_197985 ?auto_197986 )
      ( MAKE-8PILE ?auto_197984 ?auto_197985 ?auto_197986 ?auto_197987 ?auto_197988 ?auto_197989 ?auto_197990 ?auto_197991 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_198001 - BLOCK
      ?auto_198002 - BLOCK
      ?auto_198003 - BLOCK
      ?auto_198004 - BLOCK
      ?auto_198005 - BLOCK
      ?auto_198006 - BLOCK
      ?auto_198007 - BLOCK
      ?auto_198008 - BLOCK
    )
    :vars
    (
      ?auto_198009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198008 ?auto_198009 ) ( ON-TABLE ?auto_198001 ) ( not ( = ?auto_198001 ?auto_198002 ) ) ( not ( = ?auto_198001 ?auto_198003 ) ) ( not ( = ?auto_198001 ?auto_198004 ) ) ( not ( = ?auto_198001 ?auto_198005 ) ) ( not ( = ?auto_198001 ?auto_198006 ) ) ( not ( = ?auto_198001 ?auto_198007 ) ) ( not ( = ?auto_198001 ?auto_198008 ) ) ( not ( = ?auto_198001 ?auto_198009 ) ) ( not ( = ?auto_198002 ?auto_198003 ) ) ( not ( = ?auto_198002 ?auto_198004 ) ) ( not ( = ?auto_198002 ?auto_198005 ) ) ( not ( = ?auto_198002 ?auto_198006 ) ) ( not ( = ?auto_198002 ?auto_198007 ) ) ( not ( = ?auto_198002 ?auto_198008 ) ) ( not ( = ?auto_198002 ?auto_198009 ) ) ( not ( = ?auto_198003 ?auto_198004 ) ) ( not ( = ?auto_198003 ?auto_198005 ) ) ( not ( = ?auto_198003 ?auto_198006 ) ) ( not ( = ?auto_198003 ?auto_198007 ) ) ( not ( = ?auto_198003 ?auto_198008 ) ) ( not ( = ?auto_198003 ?auto_198009 ) ) ( not ( = ?auto_198004 ?auto_198005 ) ) ( not ( = ?auto_198004 ?auto_198006 ) ) ( not ( = ?auto_198004 ?auto_198007 ) ) ( not ( = ?auto_198004 ?auto_198008 ) ) ( not ( = ?auto_198004 ?auto_198009 ) ) ( not ( = ?auto_198005 ?auto_198006 ) ) ( not ( = ?auto_198005 ?auto_198007 ) ) ( not ( = ?auto_198005 ?auto_198008 ) ) ( not ( = ?auto_198005 ?auto_198009 ) ) ( not ( = ?auto_198006 ?auto_198007 ) ) ( not ( = ?auto_198006 ?auto_198008 ) ) ( not ( = ?auto_198006 ?auto_198009 ) ) ( not ( = ?auto_198007 ?auto_198008 ) ) ( not ( = ?auto_198007 ?auto_198009 ) ) ( not ( = ?auto_198008 ?auto_198009 ) ) ( ON ?auto_198007 ?auto_198008 ) ( ON ?auto_198006 ?auto_198007 ) ( ON ?auto_198005 ?auto_198006 ) ( ON ?auto_198004 ?auto_198005 ) ( ON ?auto_198003 ?auto_198004 ) ( CLEAR ?auto_198001 ) ( ON ?auto_198002 ?auto_198003 ) ( CLEAR ?auto_198002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_198001 ?auto_198002 )
      ( MAKE-8PILE ?auto_198001 ?auto_198002 ?auto_198003 ?auto_198004 ?auto_198005 ?auto_198006 ?auto_198007 ?auto_198008 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_198018 - BLOCK
      ?auto_198019 - BLOCK
      ?auto_198020 - BLOCK
      ?auto_198021 - BLOCK
      ?auto_198022 - BLOCK
      ?auto_198023 - BLOCK
      ?auto_198024 - BLOCK
      ?auto_198025 - BLOCK
    )
    :vars
    (
      ?auto_198026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198025 ?auto_198026 ) ( ON-TABLE ?auto_198018 ) ( not ( = ?auto_198018 ?auto_198019 ) ) ( not ( = ?auto_198018 ?auto_198020 ) ) ( not ( = ?auto_198018 ?auto_198021 ) ) ( not ( = ?auto_198018 ?auto_198022 ) ) ( not ( = ?auto_198018 ?auto_198023 ) ) ( not ( = ?auto_198018 ?auto_198024 ) ) ( not ( = ?auto_198018 ?auto_198025 ) ) ( not ( = ?auto_198018 ?auto_198026 ) ) ( not ( = ?auto_198019 ?auto_198020 ) ) ( not ( = ?auto_198019 ?auto_198021 ) ) ( not ( = ?auto_198019 ?auto_198022 ) ) ( not ( = ?auto_198019 ?auto_198023 ) ) ( not ( = ?auto_198019 ?auto_198024 ) ) ( not ( = ?auto_198019 ?auto_198025 ) ) ( not ( = ?auto_198019 ?auto_198026 ) ) ( not ( = ?auto_198020 ?auto_198021 ) ) ( not ( = ?auto_198020 ?auto_198022 ) ) ( not ( = ?auto_198020 ?auto_198023 ) ) ( not ( = ?auto_198020 ?auto_198024 ) ) ( not ( = ?auto_198020 ?auto_198025 ) ) ( not ( = ?auto_198020 ?auto_198026 ) ) ( not ( = ?auto_198021 ?auto_198022 ) ) ( not ( = ?auto_198021 ?auto_198023 ) ) ( not ( = ?auto_198021 ?auto_198024 ) ) ( not ( = ?auto_198021 ?auto_198025 ) ) ( not ( = ?auto_198021 ?auto_198026 ) ) ( not ( = ?auto_198022 ?auto_198023 ) ) ( not ( = ?auto_198022 ?auto_198024 ) ) ( not ( = ?auto_198022 ?auto_198025 ) ) ( not ( = ?auto_198022 ?auto_198026 ) ) ( not ( = ?auto_198023 ?auto_198024 ) ) ( not ( = ?auto_198023 ?auto_198025 ) ) ( not ( = ?auto_198023 ?auto_198026 ) ) ( not ( = ?auto_198024 ?auto_198025 ) ) ( not ( = ?auto_198024 ?auto_198026 ) ) ( not ( = ?auto_198025 ?auto_198026 ) ) ( ON ?auto_198024 ?auto_198025 ) ( ON ?auto_198023 ?auto_198024 ) ( ON ?auto_198022 ?auto_198023 ) ( ON ?auto_198021 ?auto_198022 ) ( ON ?auto_198020 ?auto_198021 ) ( CLEAR ?auto_198018 ) ( ON ?auto_198019 ?auto_198020 ) ( CLEAR ?auto_198019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_198018 ?auto_198019 )
      ( MAKE-8PILE ?auto_198018 ?auto_198019 ?auto_198020 ?auto_198021 ?auto_198022 ?auto_198023 ?auto_198024 ?auto_198025 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_198035 - BLOCK
      ?auto_198036 - BLOCK
      ?auto_198037 - BLOCK
      ?auto_198038 - BLOCK
      ?auto_198039 - BLOCK
      ?auto_198040 - BLOCK
      ?auto_198041 - BLOCK
      ?auto_198042 - BLOCK
    )
    :vars
    (
      ?auto_198043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198042 ?auto_198043 ) ( not ( = ?auto_198035 ?auto_198036 ) ) ( not ( = ?auto_198035 ?auto_198037 ) ) ( not ( = ?auto_198035 ?auto_198038 ) ) ( not ( = ?auto_198035 ?auto_198039 ) ) ( not ( = ?auto_198035 ?auto_198040 ) ) ( not ( = ?auto_198035 ?auto_198041 ) ) ( not ( = ?auto_198035 ?auto_198042 ) ) ( not ( = ?auto_198035 ?auto_198043 ) ) ( not ( = ?auto_198036 ?auto_198037 ) ) ( not ( = ?auto_198036 ?auto_198038 ) ) ( not ( = ?auto_198036 ?auto_198039 ) ) ( not ( = ?auto_198036 ?auto_198040 ) ) ( not ( = ?auto_198036 ?auto_198041 ) ) ( not ( = ?auto_198036 ?auto_198042 ) ) ( not ( = ?auto_198036 ?auto_198043 ) ) ( not ( = ?auto_198037 ?auto_198038 ) ) ( not ( = ?auto_198037 ?auto_198039 ) ) ( not ( = ?auto_198037 ?auto_198040 ) ) ( not ( = ?auto_198037 ?auto_198041 ) ) ( not ( = ?auto_198037 ?auto_198042 ) ) ( not ( = ?auto_198037 ?auto_198043 ) ) ( not ( = ?auto_198038 ?auto_198039 ) ) ( not ( = ?auto_198038 ?auto_198040 ) ) ( not ( = ?auto_198038 ?auto_198041 ) ) ( not ( = ?auto_198038 ?auto_198042 ) ) ( not ( = ?auto_198038 ?auto_198043 ) ) ( not ( = ?auto_198039 ?auto_198040 ) ) ( not ( = ?auto_198039 ?auto_198041 ) ) ( not ( = ?auto_198039 ?auto_198042 ) ) ( not ( = ?auto_198039 ?auto_198043 ) ) ( not ( = ?auto_198040 ?auto_198041 ) ) ( not ( = ?auto_198040 ?auto_198042 ) ) ( not ( = ?auto_198040 ?auto_198043 ) ) ( not ( = ?auto_198041 ?auto_198042 ) ) ( not ( = ?auto_198041 ?auto_198043 ) ) ( not ( = ?auto_198042 ?auto_198043 ) ) ( ON ?auto_198041 ?auto_198042 ) ( ON ?auto_198040 ?auto_198041 ) ( ON ?auto_198039 ?auto_198040 ) ( ON ?auto_198038 ?auto_198039 ) ( ON ?auto_198037 ?auto_198038 ) ( ON ?auto_198036 ?auto_198037 ) ( ON ?auto_198035 ?auto_198036 ) ( CLEAR ?auto_198035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_198035 )
      ( MAKE-8PILE ?auto_198035 ?auto_198036 ?auto_198037 ?auto_198038 ?auto_198039 ?auto_198040 ?auto_198041 ?auto_198042 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_198052 - BLOCK
      ?auto_198053 - BLOCK
      ?auto_198054 - BLOCK
      ?auto_198055 - BLOCK
      ?auto_198056 - BLOCK
      ?auto_198057 - BLOCK
      ?auto_198058 - BLOCK
      ?auto_198059 - BLOCK
    )
    :vars
    (
      ?auto_198060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198059 ?auto_198060 ) ( not ( = ?auto_198052 ?auto_198053 ) ) ( not ( = ?auto_198052 ?auto_198054 ) ) ( not ( = ?auto_198052 ?auto_198055 ) ) ( not ( = ?auto_198052 ?auto_198056 ) ) ( not ( = ?auto_198052 ?auto_198057 ) ) ( not ( = ?auto_198052 ?auto_198058 ) ) ( not ( = ?auto_198052 ?auto_198059 ) ) ( not ( = ?auto_198052 ?auto_198060 ) ) ( not ( = ?auto_198053 ?auto_198054 ) ) ( not ( = ?auto_198053 ?auto_198055 ) ) ( not ( = ?auto_198053 ?auto_198056 ) ) ( not ( = ?auto_198053 ?auto_198057 ) ) ( not ( = ?auto_198053 ?auto_198058 ) ) ( not ( = ?auto_198053 ?auto_198059 ) ) ( not ( = ?auto_198053 ?auto_198060 ) ) ( not ( = ?auto_198054 ?auto_198055 ) ) ( not ( = ?auto_198054 ?auto_198056 ) ) ( not ( = ?auto_198054 ?auto_198057 ) ) ( not ( = ?auto_198054 ?auto_198058 ) ) ( not ( = ?auto_198054 ?auto_198059 ) ) ( not ( = ?auto_198054 ?auto_198060 ) ) ( not ( = ?auto_198055 ?auto_198056 ) ) ( not ( = ?auto_198055 ?auto_198057 ) ) ( not ( = ?auto_198055 ?auto_198058 ) ) ( not ( = ?auto_198055 ?auto_198059 ) ) ( not ( = ?auto_198055 ?auto_198060 ) ) ( not ( = ?auto_198056 ?auto_198057 ) ) ( not ( = ?auto_198056 ?auto_198058 ) ) ( not ( = ?auto_198056 ?auto_198059 ) ) ( not ( = ?auto_198056 ?auto_198060 ) ) ( not ( = ?auto_198057 ?auto_198058 ) ) ( not ( = ?auto_198057 ?auto_198059 ) ) ( not ( = ?auto_198057 ?auto_198060 ) ) ( not ( = ?auto_198058 ?auto_198059 ) ) ( not ( = ?auto_198058 ?auto_198060 ) ) ( not ( = ?auto_198059 ?auto_198060 ) ) ( ON ?auto_198058 ?auto_198059 ) ( ON ?auto_198057 ?auto_198058 ) ( ON ?auto_198056 ?auto_198057 ) ( ON ?auto_198055 ?auto_198056 ) ( ON ?auto_198054 ?auto_198055 ) ( ON ?auto_198053 ?auto_198054 ) ( ON ?auto_198052 ?auto_198053 ) ( CLEAR ?auto_198052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_198052 )
      ( MAKE-8PILE ?auto_198052 ?auto_198053 ?auto_198054 ?auto_198055 ?auto_198056 ?auto_198057 ?auto_198058 ?auto_198059 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_198070 - BLOCK
      ?auto_198071 - BLOCK
      ?auto_198072 - BLOCK
      ?auto_198073 - BLOCK
      ?auto_198074 - BLOCK
      ?auto_198075 - BLOCK
      ?auto_198076 - BLOCK
      ?auto_198077 - BLOCK
      ?auto_198078 - BLOCK
    )
    :vars
    (
      ?auto_198079 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_198077 ) ( ON ?auto_198078 ?auto_198079 ) ( CLEAR ?auto_198078 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_198070 ) ( ON ?auto_198071 ?auto_198070 ) ( ON ?auto_198072 ?auto_198071 ) ( ON ?auto_198073 ?auto_198072 ) ( ON ?auto_198074 ?auto_198073 ) ( ON ?auto_198075 ?auto_198074 ) ( ON ?auto_198076 ?auto_198075 ) ( ON ?auto_198077 ?auto_198076 ) ( not ( = ?auto_198070 ?auto_198071 ) ) ( not ( = ?auto_198070 ?auto_198072 ) ) ( not ( = ?auto_198070 ?auto_198073 ) ) ( not ( = ?auto_198070 ?auto_198074 ) ) ( not ( = ?auto_198070 ?auto_198075 ) ) ( not ( = ?auto_198070 ?auto_198076 ) ) ( not ( = ?auto_198070 ?auto_198077 ) ) ( not ( = ?auto_198070 ?auto_198078 ) ) ( not ( = ?auto_198070 ?auto_198079 ) ) ( not ( = ?auto_198071 ?auto_198072 ) ) ( not ( = ?auto_198071 ?auto_198073 ) ) ( not ( = ?auto_198071 ?auto_198074 ) ) ( not ( = ?auto_198071 ?auto_198075 ) ) ( not ( = ?auto_198071 ?auto_198076 ) ) ( not ( = ?auto_198071 ?auto_198077 ) ) ( not ( = ?auto_198071 ?auto_198078 ) ) ( not ( = ?auto_198071 ?auto_198079 ) ) ( not ( = ?auto_198072 ?auto_198073 ) ) ( not ( = ?auto_198072 ?auto_198074 ) ) ( not ( = ?auto_198072 ?auto_198075 ) ) ( not ( = ?auto_198072 ?auto_198076 ) ) ( not ( = ?auto_198072 ?auto_198077 ) ) ( not ( = ?auto_198072 ?auto_198078 ) ) ( not ( = ?auto_198072 ?auto_198079 ) ) ( not ( = ?auto_198073 ?auto_198074 ) ) ( not ( = ?auto_198073 ?auto_198075 ) ) ( not ( = ?auto_198073 ?auto_198076 ) ) ( not ( = ?auto_198073 ?auto_198077 ) ) ( not ( = ?auto_198073 ?auto_198078 ) ) ( not ( = ?auto_198073 ?auto_198079 ) ) ( not ( = ?auto_198074 ?auto_198075 ) ) ( not ( = ?auto_198074 ?auto_198076 ) ) ( not ( = ?auto_198074 ?auto_198077 ) ) ( not ( = ?auto_198074 ?auto_198078 ) ) ( not ( = ?auto_198074 ?auto_198079 ) ) ( not ( = ?auto_198075 ?auto_198076 ) ) ( not ( = ?auto_198075 ?auto_198077 ) ) ( not ( = ?auto_198075 ?auto_198078 ) ) ( not ( = ?auto_198075 ?auto_198079 ) ) ( not ( = ?auto_198076 ?auto_198077 ) ) ( not ( = ?auto_198076 ?auto_198078 ) ) ( not ( = ?auto_198076 ?auto_198079 ) ) ( not ( = ?auto_198077 ?auto_198078 ) ) ( not ( = ?auto_198077 ?auto_198079 ) ) ( not ( = ?auto_198078 ?auto_198079 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_198078 ?auto_198079 )
      ( !STACK ?auto_198078 ?auto_198077 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_198089 - BLOCK
      ?auto_198090 - BLOCK
      ?auto_198091 - BLOCK
      ?auto_198092 - BLOCK
      ?auto_198093 - BLOCK
      ?auto_198094 - BLOCK
      ?auto_198095 - BLOCK
      ?auto_198096 - BLOCK
      ?auto_198097 - BLOCK
    )
    :vars
    (
      ?auto_198098 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_198096 ) ( ON ?auto_198097 ?auto_198098 ) ( CLEAR ?auto_198097 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_198089 ) ( ON ?auto_198090 ?auto_198089 ) ( ON ?auto_198091 ?auto_198090 ) ( ON ?auto_198092 ?auto_198091 ) ( ON ?auto_198093 ?auto_198092 ) ( ON ?auto_198094 ?auto_198093 ) ( ON ?auto_198095 ?auto_198094 ) ( ON ?auto_198096 ?auto_198095 ) ( not ( = ?auto_198089 ?auto_198090 ) ) ( not ( = ?auto_198089 ?auto_198091 ) ) ( not ( = ?auto_198089 ?auto_198092 ) ) ( not ( = ?auto_198089 ?auto_198093 ) ) ( not ( = ?auto_198089 ?auto_198094 ) ) ( not ( = ?auto_198089 ?auto_198095 ) ) ( not ( = ?auto_198089 ?auto_198096 ) ) ( not ( = ?auto_198089 ?auto_198097 ) ) ( not ( = ?auto_198089 ?auto_198098 ) ) ( not ( = ?auto_198090 ?auto_198091 ) ) ( not ( = ?auto_198090 ?auto_198092 ) ) ( not ( = ?auto_198090 ?auto_198093 ) ) ( not ( = ?auto_198090 ?auto_198094 ) ) ( not ( = ?auto_198090 ?auto_198095 ) ) ( not ( = ?auto_198090 ?auto_198096 ) ) ( not ( = ?auto_198090 ?auto_198097 ) ) ( not ( = ?auto_198090 ?auto_198098 ) ) ( not ( = ?auto_198091 ?auto_198092 ) ) ( not ( = ?auto_198091 ?auto_198093 ) ) ( not ( = ?auto_198091 ?auto_198094 ) ) ( not ( = ?auto_198091 ?auto_198095 ) ) ( not ( = ?auto_198091 ?auto_198096 ) ) ( not ( = ?auto_198091 ?auto_198097 ) ) ( not ( = ?auto_198091 ?auto_198098 ) ) ( not ( = ?auto_198092 ?auto_198093 ) ) ( not ( = ?auto_198092 ?auto_198094 ) ) ( not ( = ?auto_198092 ?auto_198095 ) ) ( not ( = ?auto_198092 ?auto_198096 ) ) ( not ( = ?auto_198092 ?auto_198097 ) ) ( not ( = ?auto_198092 ?auto_198098 ) ) ( not ( = ?auto_198093 ?auto_198094 ) ) ( not ( = ?auto_198093 ?auto_198095 ) ) ( not ( = ?auto_198093 ?auto_198096 ) ) ( not ( = ?auto_198093 ?auto_198097 ) ) ( not ( = ?auto_198093 ?auto_198098 ) ) ( not ( = ?auto_198094 ?auto_198095 ) ) ( not ( = ?auto_198094 ?auto_198096 ) ) ( not ( = ?auto_198094 ?auto_198097 ) ) ( not ( = ?auto_198094 ?auto_198098 ) ) ( not ( = ?auto_198095 ?auto_198096 ) ) ( not ( = ?auto_198095 ?auto_198097 ) ) ( not ( = ?auto_198095 ?auto_198098 ) ) ( not ( = ?auto_198096 ?auto_198097 ) ) ( not ( = ?auto_198096 ?auto_198098 ) ) ( not ( = ?auto_198097 ?auto_198098 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_198097 ?auto_198098 )
      ( !STACK ?auto_198097 ?auto_198096 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_198108 - BLOCK
      ?auto_198109 - BLOCK
      ?auto_198110 - BLOCK
      ?auto_198111 - BLOCK
      ?auto_198112 - BLOCK
      ?auto_198113 - BLOCK
      ?auto_198114 - BLOCK
      ?auto_198115 - BLOCK
      ?auto_198116 - BLOCK
    )
    :vars
    (
      ?auto_198117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198116 ?auto_198117 ) ( ON-TABLE ?auto_198108 ) ( ON ?auto_198109 ?auto_198108 ) ( ON ?auto_198110 ?auto_198109 ) ( ON ?auto_198111 ?auto_198110 ) ( ON ?auto_198112 ?auto_198111 ) ( ON ?auto_198113 ?auto_198112 ) ( ON ?auto_198114 ?auto_198113 ) ( not ( = ?auto_198108 ?auto_198109 ) ) ( not ( = ?auto_198108 ?auto_198110 ) ) ( not ( = ?auto_198108 ?auto_198111 ) ) ( not ( = ?auto_198108 ?auto_198112 ) ) ( not ( = ?auto_198108 ?auto_198113 ) ) ( not ( = ?auto_198108 ?auto_198114 ) ) ( not ( = ?auto_198108 ?auto_198115 ) ) ( not ( = ?auto_198108 ?auto_198116 ) ) ( not ( = ?auto_198108 ?auto_198117 ) ) ( not ( = ?auto_198109 ?auto_198110 ) ) ( not ( = ?auto_198109 ?auto_198111 ) ) ( not ( = ?auto_198109 ?auto_198112 ) ) ( not ( = ?auto_198109 ?auto_198113 ) ) ( not ( = ?auto_198109 ?auto_198114 ) ) ( not ( = ?auto_198109 ?auto_198115 ) ) ( not ( = ?auto_198109 ?auto_198116 ) ) ( not ( = ?auto_198109 ?auto_198117 ) ) ( not ( = ?auto_198110 ?auto_198111 ) ) ( not ( = ?auto_198110 ?auto_198112 ) ) ( not ( = ?auto_198110 ?auto_198113 ) ) ( not ( = ?auto_198110 ?auto_198114 ) ) ( not ( = ?auto_198110 ?auto_198115 ) ) ( not ( = ?auto_198110 ?auto_198116 ) ) ( not ( = ?auto_198110 ?auto_198117 ) ) ( not ( = ?auto_198111 ?auto_198112 ) ) ( not ( = ?auto_198111 ?auto_198113 ) ) ( not ( = ?auto_198111 ?auto_198114 ) ) ( not ( = ?auto_198111 ?auto_198115 ) ) ( not ( = ?auto_198111 ?auto_198116 ) ) ( not ( = ?auto_198111 ?auto_198117 ) ) ( not ( = ?auto_198112 ?auto_198113 ) ) ( not ( = ?auto_198112 ?auto_198114 ) ) ( not ( = ?auto_198112 ?auto_198115 ) ) ( not ( = ?auto_198112 ?auto_198116 ) ) ( not ( = ?auto_198112 ?auto_198117 ) ) ( not ( = ?auto_198113 ?auto_198114 ) ) ( not ( = ?auto_198113 ?auto_198115 ) ) ( not ( = ?auto_198113 ?auto_198116 ) ) ( not ( = ?auto_198113 ?auto_198117 ) ) ( not ( = ?auto_198114 ?auto_198115 ) ) ( not ( = ?auto_198114 ?auto_198116 ) ) ( not ( = ?auto_198114 ?auto_198117 ) ) ( not ( = ?auto_198115 ?auto_198116 ) ) ( not ( = ?auto_198115 ?auto_198117 ) ) ( not ( = ?auto_198116 ?auto_198117 ) ) ( CLEAR ?auto_198114 ) ( ON ?auto_198115 ?auto_198116 ) ( CLEAR ?auto_198115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_198108 ?auto_198109 ?auto_198110 ?auto_198111 ?auto_198112 ?auto_198113 ?auto_198114 ?auto_198115 )
      ( MAKE-9PILE ?auto_198108 ?auto_198109 ?auto_198110 ?auto_198111 ?auto_198112 ?auto_198113 ?auto_198114 ?auto_198115 ?auto_198116 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_198127 - BLOCK
      ?auto_198128 - BLOCK
      ?auto_198129 - BLOCK
      ?auto_198130 - BLOCK
      ?auto_198131 - BLOCK
      ?auto_198132 - BLOCK
      ?auto_198133 - BLOCK
      ?auto_198134 - BLOCK
      ?auto_198135 - BLOCK
    )
    :vars
    (
      ?auto_198136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198135 ?auto_198136 ) ( ON-TABLE ?auto_198127 ) ( ON ?auto_198128 ?auto_198127 ) ( ON ?auto_198129 ?auto_198128 ) ( ON ?auto_198130 ?auto_198129 ) ( ON ?auto_198131 ?auto_198130 ) ( ON ?auto_198132 ?auto_198131 ) ( ON ?auto_198133 ?auto_198132 ) ( not ( = ?auto_198127 ?auto_198128 ) ) ( not ( = ?auto_198127 ?auto_198129 ) ) ( not ( = ?auto_198127 ?auto_198130 ) ) ( not ( = ?auto_198127 ?auto_198131 ) ) ( not ( = ?auto_198127 ?auto_198132 ) ) ( not ( = ?auto_198127 ?auto_198133 ) ) ( not ( = ?auto_198127 ?auto_198134 ) ) ( not ( = ?auto_198127 ?auto_198135 ) ) ( not ( = ?auto_198127 ?auto_198136 ) ) ( not ( = ?auto_198128 ?auto_198129 ) ) ( not ( = ?auto_198128 ?auto_198130 ) ) ( not ( = ?auto_198128 ?auto_198131 ) ) ( not ( = ?auto_198128 ?auto_198132 ) ) ( not ( = ?auto_198128 ?auto_198133 ) ) ( not ( = ?auto_198128 ?auto_198134 ) ) ( not ( = ?auto_198128 ?auto_198135 ) ) ( not ( = ?auto_198128 ?auto_198136 ) ) ( not ( = ?auto_198129 ?auto_198130 ) ) ( not ( = ?auto_198129 ?auto_198131 ) ) ( not ( = ?auto_198129 ?auto_198132 ) ) ( not ( = ?auto_198129 ?auto_198133 ) ) ( not ( = ?auto_198129 ?auto_198134 ) ) ( not ( = ?auto_198129 ?auto_198135 ) ) ( not ( = ?auto_198129 ?auto_198136 ) ) ( not ( = ?auto_198130 ?auto_198131 ) ) ( not ( = ?auto_198130 ?auto_198132 ) ) ( not ( = ?auto_198130 ?auto_198133 ) ) ( not ( = ?auto_198130 ?auto_198134 ) ) ( not ( = ?auto_198130 ?auto_198135 ) ) ( not ( = ?auto_198130 ?auto_198136 ) ) ( not ( = ?auto_198131 ?auto_198132 ) ) ( not ( = ?auto_198131 ?auto_198133 ) ) ( not ( = ?auto_198131 ?auto_198134 ) ) ( not ( = ?auto_198131 ?auto_198135 ) ) ( not ( = ?auto_198131 ?auto_198136 ) ) ( not ( = ?auto_198132 ?auto_198133 ) ) ( not ( = ?auto_198132 ?auto_198134 ) ) ( not ( = ?auto_198132 ?auto_198135 ) ) ( not ( = ?auto_198132 ?auto_198136 ) ) ( not ( = ?auto_198133 ?auto_198134 ) ) ( not ( = ?auto_198133 ?auto_198135 ) ) ( not ( = ?auto_198133 ?auto_198136 ) ) ( not ( = ?auto_198134 ?auto_198135 ) ) ( not ( = ?auto_198134 ?auto_198136 ) ) ( not ( = ?auto_198135 ?auto_198136 ) ) ( CLEAR ?auto_198133 ) ( ON ?auto_198134 ?auto_198135 ) ( CLEAR ?auto_198134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_198127 ?auto_198128 ?auto_198129 ?auto_198130 ?auto_198131 ?auto_198132 ?auto_198133 ?auto_198134 )
      ( MAKE-9PILE ?auto_198127 ?auto_198128 ?auto_198129 ?auto_198130 ?auto_198131 ?auto_198132 ?auto_198133 ?auto_198134 ?auto_198135 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_198146 - BLOCK
      ?auto_198147 - BLOCK
      ?auto_198148 - BLOCK
      ?auto_198149 - BLOCK
      ?auto_198150 - BLOCK
      ?auto_198151 - BLOCK
      ?auto_198152 - BLOCK
      ?auto_198153 - BLOCK
      ?auto_198154 - BLOCK
    )
    :vars
    (
      ?auto_198155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198154 ?auto_198155 ) ( ON-TABLE ?auto_198146 ) ( ON ?auto_198147 ?auto_198146 ) ( ON ?auto_198148 ?auto_198147 ) ( ON ?auto_198149 ?auto_198148 ) ( ON ?auto_198150 ?auto_198149 ) ( ON ?auto_198151 ?auto_198150 ) ( not ( = ?auto_198146 ?auto_198147 ) ) ( not ( = ?auto_198146 ?auto_198148 ) ) ( not ( = ?auto_198146 ?auto_198149 ) ) ( not ( = ?auto_198146 ?auto_198150 ) ) ( not ( = ?auto_198146 ?auto_198151 ) ) ( not ( = ?auto_198146 ?auto_198152 ) ) ( not ( = ?auto_198146 ?auto_198153 ) ) ( not ( = ?auto_198146 ?auto_198154 ) ) ( not ( = ?auto_198146 ?auto_198155 ) ) ( not ( = ?auto_198147 ?auto_198148 ) ) ( not ( = ?auto_198147 ?auto_198149 ) ) ( not ( = ?auto_198147 ?auto_198150 ) ) ( not ( = ?auto_198147 ?auto_198151 ) ) ( not ( = ?auto_198147 ?auto_198152 ) ) ( not ( = ?auto_198147 ?auto_198153 ) ) ( not ( = ?auto_198147 ?auto_198154 ) ) ( not ( = ?auto_198147 ?auto_198155 ) ) ( not ( = ?auto_198148 ?auto_198149 ) ) ( not ( = ?auto_198148 ?auto_198150 ) ) ( not ( = ?auto_198148 ?auto_198151 ) ) ( not ( = ?auto_198148 ?auto_198152 ) ) ( not ( = ?auto_198148 ?auto_198153 ) ) ( not ( = ?auto_198148 ?auto_198154 ) ) ( not ( = ?auto_198148 ?auto_198155 ) ) ( not ( = ?auto_198149 ?auto_198150 ) ) ( not ( = ?auto_198149 ?auto_198151 ) ) ( not ( = ?auto_198149 ?auto_198152 ) ) ( not ( = ?auto_198149 ?auto_198153 ) ) ( not ( = ?auto_198149 ?auto_198154 ) ) ( not ( = ?auto_198149 ?auto_198155 ) ) ( not ( = ?auto_198150 ?auto_198151 ) ) ( not ( = ?auto_198150 ?auto_198152 ) ) ( not ( = ?auto_198150 ?auto_198153 ) ) ( not ( = ?auto_198150 ?auto_198154 ) ) ( not ( = ?auto_198150 ?auto_198155 ) ) ( not ( = ?auto_198151 ?auto_198152 ) ) ( not ( = ?auto_198151 ?auto_198153 ) ) ( not ( = ?auto_198151 ?auto_198154 ) ) ( not ( = ?auto_198151 ?auto_198155 ) ) ( not ( = ?auto_198152 ?auto_198153 ) ) ( not ( = ?auto_198152 ?auto_198154 ) ) ( not ( = ?auto_198152 ?auto_198155 ) ) ( not ( = ?auto_198153 ?auto_198154 ) ) ( not ( = ?auto_198153 ?auto_198155 ) ) ( not ( = ?auto_198154 ?auto_198155 ) ) ( ON ?auto_198153 ?auto_198154 ) ( CLEAR ?auto_198151 ) ( ON ?auto_198152 ?auto_198153 ) ( CLEAR ?auto_198152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_198146 ?auto_198147 ?auto_198148 ?auto_198149 ?auto_198150 ?auto_198151 ?auto_198152 )
      ( MAKE-9PILE ?auto_198146 ?auto_198147 ?auto_198148 ?auto_198149 ?auto_198150 ?auto_198151 ?auto_198152 ?auto_198153 ?auto_198154 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_198165 - BLOCK
      ?auto_198166 - BLOCK
      ?auto_198167 - BLOCK
      ?auto_198168 - BLOCK
      ?auto_198169 - BLOCK
      ?auto_198170 - BLOCK
      ?auto_198171 - BLOCK
      ?auto_198172 - BLOCK
      ?auto_198173 - BLOCK
    )
    :vars
    (
      ?auto_198174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198173 ?auto_198174 ) ( ON-TABLE ?auto_198165 ) ( ON ?auto_198166 ?auto_198165 ) ( ON ?auto_198167 ?auto_198166 ) ( ON ?auto_198168 ?auto_198167 ) ( ON ?auto_198169 ?auto_198168 ) ( ON ?auto_198170 ?auto_198169 ) ( not ( = ?auto_198165 ?auto_198166 ) ) ( not ( = ?auto_198165 ?auto_198167 ) ) ( not ( = ?auto_198165 ?auto_198168 ) ) ( not ( = ?auto_198165 ?auto_198169 ) ) ( not ( = ?auto_198165 ?auto_198170 ) ) ( not ( = ?auto_198165 ?auto_198171 ) ) ( not ( = ?auto_198165 ?auto_198172 ) ) ( not ( = ?auto_198165 ?auto_198173 ) ) ( not ( = ?auto_198165 ?auto_198174 ) ) ( not ( = ?auto_198166 ?auto_198167 ) ) ( not ( = ?auto_198166 ?auto_198168 ) ) ( not ( = ?auto_198166 ?auto_198169 ) ) ( not ( = ?auto_198166 ?auto_198170 ) ) ( not ( = ?auto_198166 ?auto_198171 ) ) ( not ( = ?auto_198166 ?auto_198172 ) ) ( not ( = ?auto_198166 ?auto_198173 ) ) ( not ( = ?auto_198166 ?auto_198174 ) ) ( not ( = ?auto_198167 ?auto_198168 ) ) ( not ( = ?auto_198167 ?auto_198169 ) ) ( not ( = ?auto_198167 ?auto_198170 ) ) ( not ( = ?auto_198167 ?auto_198171 ) ) ( not ( = ?auto_198167 ?auto_198172 ) ) ( not ( = ?auto_198167 ?auto_198173 ) ) ( not ( = ?auto_198167 ?auto_198174 ) ) ( not ( = ?auto_198168 ?auto_198169 ) ) ( not ( = ?auto_198168 ?auto_198170 ) ) ( not ( = ?auto_198168 ?auto_198171 ) ) ( not ( = ?auto_198168 ?auto_198172 ) ) ( not ( = ?auto_198168 ?auto_198173 ) ) ( not ( = ?auto_198168 ?auto_198174 ) ) ( not ( = ?auto_198169 ?auto_198170 ) ) ( not ( = ?auto_198169 ?auto_198171 ) ) ( not ( = ?auto_198169 ?auto_198172 ) ) ( not ( = ?auto_198169 ?auto_198173 ) ) ( not ( = ?auto_198169 ?auto_198174 ) ) ( not ( = ?auto_198170 ?auto_198171 ) ) ( not ( = ?auto_198170 ?auto_198172 ) ) ( not ( = ?auto_198170 ?auto_198173 ) ) ( not ( = ?auto_198170 ?auto_198174 ) ) ( not ( = ?auto_198171 ?auto_198172 ) ) ( not ( = ?auto_198171 ?auto_198173 ) ) ( not ( = ?auto_198171 ?auto_198174 ) ) ( not ( = ?auto_198172 ?auto_198173 ) ) ( not ( = ?auto_198172 ?auto_198174 ) ) ( not ( = ?auto_198173 ?auto_198174 ) ) ( ON ?auto_198172 ?auto_198173 ) ( CLEAR ?auto_198170 ) ( ON ?auto_198171 ?auto_198172 ) ( CLEAR ?auto_198171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_198165 ?auto_198166 ?auto_198167 ?auto_198168 ?auto_198169 ?auto_198170 ?auto_198171 )
      ( MAKE-9PILE ?auto_198165 ?auto_198166 ?auto_198167 ?auto_198168 ?auto_198169 ?auto_198170 ?auto_198171 ?auto_198172 ?auto_198173 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_198184 - BLOCK
      ?auto_198185 - BLOCK
      ?auto_198186 - BLOCK
      ?auto_198187 - BLOCK
      ?auto_198188 - BLOCK
      ?auto_198189 - BLOCK
      ?auto_198190 - BLOCK
      ?auto_198191 - BLOCK
      ?auto_198192 - BLOCK
    )
    :vars
    (
      ?auto_198193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198192 ?auto_198193 ) ( ON-TABLE ?auto_198184 ) ( ON ?auto_198185 ?auto_198184 ) ( ON ?auto_198186 ?auto_198185 ) ( ON ?auto_198187 ?auto_198186 ) ( ON ?auto_198188 ?auto_198187 ) ( not ( = ?auto_198184 ?auto_198185 ) ) ( not ( = ?auto_198184 ?auto_198186 ) ) ( not ( = ?auto_198184 ?auto_198187 ) ) ( not ( = ?auto_198184 ?auto_198188 ) ) ( not ( = ?auto_198184 ?auto_198189 ) ) ( not ( = ?auto_198184 ?auto_198190 ) ) ( not ( = ?auto_198184 ?auto_198191 ) ) ( not ( = ?auto_198184 ?auto_198192 ) ) ( not ( = ?auto_198184 ?auto_198193 ) ) ( not ( = ?auto_198185 ?auto_198186 ) ) ( not ( = ?auto_198185 ?auto_198187 ) ) ( not ( = ?auto_198185 ?auto_198188 ) ) ( not ( = ?auto_198185 ?auto_198189 ) ) ( not ( = ?auto_198185 ?auto_198190 ) ) ( not ( = ?auto_198185 ?auto_198191 ) ) ( not ( = ?auto_198185 ?auto_198192 ) ) ( not ( = ?auto_198185 ?auto_198193 ) ) ( not ( = ?auto_198186 ?auto_198187 ) ) ( not ( = ?auto_198186 ?auto_198188 ) ) ( not ( = ?auto_198186 ?auto_198189 ) ) ( not ( = ?auto_198186 ?auto_198190 ) ) ( not ( = ?auto_198186 ?auto_198191 ) ) ( not ( = ?auto_198186 ?auto_198192 ) ) ( not ( = ?auto_198186 ?auto_198193 ) ) ( not ( = ?auto_198187 ?auto_198188 ) ) ( not ( = ?auto_198187 ?auto_198189 ) ) ( not ( = ?auto_198187 ?auto_198190 ) ) ( not ( = ?auto_198187 ?auto_198191 ) ) ( not ( = ?auto_198187 ?auto_198192 ) ) ( not ( = ?auto_198187 ?auto_198193 ) ) ( not ( = ?auto_198188 ?auto_198189 ) ) ( not ( = ?auto_198188 ?auto_198190 ) ) ( not ( = ?auto_198188 ?auto_198191 ) ) ( not ( = ?auto_198188 ?auto_198192 ) ) ( not ( = ?auto_198188 ?auto_198193 ) ) ( not ( = ?auto_198189 ?auto_198190 ) ) ( not ( = ?auto_198189 ?auto_198191 ) ) ( not ( = ?auto_198189 ?auto_198192 ) ) ( not ( = ?auto_198189 ?auto_198193 ) ) ( not ( = ?auto_198190 ?auto_198191 ) ) ( not ( = ?auto_198190 ?auto_198192 ) ) ( not ( = ?auto_198190 ?auto_198193 ) ) ( not ( = ?auto_198191 ?auto_198192 ) ) ( not ( = ?auto_198191 ?auto_198193 ) ) ( not ( = ?auto_198192 ?auto_198193 ) ) ( ON ?auto_198191 ?auto_198192 ) ( ON ?auto_198190 ?auto_198191 ) ( CLEAR ?auto_198188 ) ( ON ?auto_198189 ?auto_198190 ) ( CLEAR ?auto_198189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_198184 ?auto_198185 ?auto_198186 ?auto_198187 ?auto_198188 ?auto_198189 )
      ( MAKE-9PILE ?auto_198184 ?auto_198185 ?auto_198186 ?auto_198187 ?auto_198188 ?auto_198189 ?auto_198190 ?auto_198191 ?auto_198192 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_198203 - BLOCK
      ?auto_198204 - BLOCK
      ?auto_198205 - BLOCK
      ?auto_198206 - BLOCK
      ?auto_198207 - BLOCK
      ?auto_198208 - BLOCK
      ?auto_198209 - BLOCK
      ?auto_198210 - BLOCK
      ?auto_198211 - BLOCK
    )
    :vars
    (
      ?auto_198212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198211 ?auto_198212 ) ( ON-TABLE ?auto_198203 ) ( ON ?auto_198204 ?auto_198203 ) ( ON ?auto_198205 ?auto_198204 ) ( ON ?auto_198206 ?auto_198205 ) ( ON ?auto_198207 ?auto_198206 ) ( not ( = ?auto_198203 ?auto_198204 ) ) ( not ( = ?auto_198203 ?auto_198205 ) ) ( not ( = ?auto_198203 ?auto_198206 ) ) ( not ( = ?auto_198203 ?auto_198207 ) ) ( not ( = ?auto_198203 ?auto_198208 ) ) ( not ( = ?auto_198203 ?auto_198209 ) ) ( not ( = ?auto_198203 ?auto_198210 ) ) ( not ( = ?auto_198203 ?auto_198211 ) ) ( not ( = ?auto_198203 ?auto_198212 ) ) ( not ( = ?auto_198204 ?auto_198205 ) ) ( not ( = ?auto_198204 ?auto_198206 ) ) ( not ( = ?auto_198204 ?auto_198207 ) ) ( not ( = ?auto_198204 ?auto_198208 ) ) ( not ( = ?auto_198204 ?auto_198209 ) ) ( not ( = ?auto_198204 ?auto_198210 ) ) ( not ( = ?auto_198204 ?auto_198211 ) ) ( not ( = ?auto_198204 ?auto_198212 ) ) ( not ( = ?auto_198205 ?auto_198206 ) ) ( not ( = ?auto_198205 ?auto_198207 ) ) ( not ( = ?auto_198205 ?auto_198208 ) ) ( not ( = ?auto_198205 ?auto_198209 ) ) ( not ( = ?auto_198205 ?auto_198210 ) ) ( not ( = ?auto_198205 ?auto_198211 ) ) ( not ( = ?auto_198205 ?auto_198212 ) ) ( not ( = ?auto_198206 ?auto_198207 ) ) ( not ( = ?auto_198206 ?auto_198208 ) ) ( not ( = ?auto_198206 ?auto_198209 ) ) ( not ( = ?auto_198206 ?auto_198210 ) ) ( not ( = ?auto_198206 ?auto_198211 ) ) ( not ( = ?auto_198206 ?auto_198212 ) ) ( not ( = ?auto_198207 ?auto_198208 ) ) ( not ( = ?auto_198207 ?auto_198209 ) ) ( not ( = ?auto_198207 ?auto_198210 ) ) ( not ( = ?auto_198207 ?auto_198211 ) ) ( not ( = ?auto_198207 ?auto_198212 ) ) ( not ( = ?auto_198208 ?auto_198209 ) ) ( not ( = ?auto_198208 ?auto_198210 ) ) ( not ( = ?auto_198208 ?auto_198211 ) ) ( not ( = ?auto_198208 ?auto_198212 ) ) ( not ( = ?auto_198209 ?auto_198210 ) ) ( not ( = ?auto_198209 ?auto_198211 ) ) ( not ( = ?auto_198209 ?auto_198212 ) ) ( not ( = ?auto_198210 ?auto_198211 ) ) ( not ( = ?auto_198210 ?auto_198212 ) ) ( not ( = ?auto_198211 ?auto_198212 ) ) ( ON ?auto_198210 ?auto_198211 ) ( ON ?auto_198209 ?auto_198210 ) ( CLEAR ?auto_198207 ) ( ON ?auto_198208 ?auto_198209 ) ( CLEAR ?auto_198208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_198203 ?auto_198204 ?auto_198205 ?auto_198206 ?auto_198207 ?auto_198208 )
      ( MAKE-9PILE ?auto_198203 ?auto_198204 ?auto_198205 ?auto_198206 ?auto_198207 ?auto_198208 ?auto_198209 ?auto_198210 ?auto_198211 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_198222 - BLOCK
      ?auto_198223 - BLOCK
      ?auto_198224 - BLOCK
      ?auto_198225 - BLOCK
      ?auto_198226 - BLOCK
      ?auto_198227 - BLOCK
      ?auto_198228 - BLOCK
      ?auto_198229 - BLOCK
      ?auto_198230 - BLOCK
    )
    :vars
    (
      ?auto_198231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198230 ?auto_198231 ) ( ON-TABLE ?auto_198222 ) ( ON ?auto_198223 ?auto_198222 ) ( ON ?auto_198224 ?auto_198223 ) ( ON ?auto_198225 ?auto_198224 ) ( not ( = ?auto_198222 ?auto_198223 ) ) ( not ( = ?auto_198222 ?auto_198224 ) ) ( not ( = ?auto_198222 ?auto_198225 ) ) ( not ( = ?auto_198222 ?auto_198226 ) ) ( not ( = ?auto_198222 ?auto_198227 ) ) ( not ( = ?auto_198222 ?auto_198228 ) ) ( not ( = ?auto_198222 ?auto_198229 ) ) ( not ( = ?auto_198222 ?auto_198230 ) ) ( not ( = ?auto_198222 ?auto_198231 ) ) ( not ( = ?auto_198223 ?auto_198224 ) ) ( not ( = ?auto_198223 ?auto_198225 ) ) ( not ( = ?auto_198223 ?auto_198226 ) ) ( not ( = ?auto_198223 ?auto_198227 ) ) ( not ( = ?auto_198223 ?auto_198228 ) ) ( not ( = ?auto_198223 ?auto_198229 ) ) ( not ( = ?auto_198223 ?auto_198230 ) ) ( not ( = ?auto_198223 ?auto_198231 ) ) ( not ( = ?auto_198224 ?auto_198225 ) ) ( not ( = ?auto_198224 ?auto_198226 ) ) ( not ( = ?auto_198224 ?auto_198227 ) ) ( not ( = ?auto_198224 ?auto_198228 ) ) ( not ( = ?auto_198224 ?auto_198229 ) ) ( not ( = ?auto_198224 ?auto_198230 ) ) ( not ( = ?auto_198224 ?auto_198231 ) ) ( not ( = ?auto_198225 ?auto_198226 ) ) ( not ( = ?auto_198225 ?auto_198227 ) ) ( not ( = ?auto_198225 ?auto_198228 ) ) ( not ( = ?auto_198225 ?auto_198229 ) ) ( not ( = ?auto_198225 ?auto_198230 ) ) ( not ( = ?auto_198225 ?auto_198231 ) ) ( not ( = ?auto_198226 ?auto_198227 ) ) ( not ( = ?auto_198226 ?auto_198228 ) ) ( not ( = ?auto_198226 ?auto_198229 ) ) ( not ( = ?auto_198226 ?auto_198230 ) ) ( not ( = ?auto_198226 ?auto_198231 ) ) ( not ( = ?auto_198227 ?auto_198228 ) ) ( not ( = ?auto_198227 ?auto_198229 ) ) ( not ( = ?auto_198227 ?auto_198230 ) ) ( not ( = ?auto_198227 ?auto_198231 ) ) ( not ( = ?auto_198228 ?auto_198229 ) ) ( not ( = ?auto_198228 ?auto_198230 ) ) ( not ( = ?auto_198228 ?auto_198231 ) ) ( not ( = ?auto_198229 ?auto_198230 ) ) ( not ( = ?auto_198229 ?auto_198231 ) ) ( not ( = ?auto_198230 ?auto_198231 ) ) ( ON ?auto_198229 ?auto_198230 ) ( ON ?auto_198228 ?auto_198229 ) ( ON ?auto_198227 ?auto_198228 ) ( CLEAR ?auto_198225 ) ( ON ?auto_198226 ?auto_198227 ) ( CLEAR ?auto_198226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_198222 ?auto_198223 ?auto_198224 ?auto_198225 ?auto_198226 )
      ( MAKE-9PILE ?auto_198222 ?auto_198223 ?auto_198224 ?auto_198225 ?auto_198226 ?auto_198227 ?auto_198228 ?auto_198229 ?auto_198230 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_198241 - BLOCK
      ?auto_198242 - BLOCK
      ?auto_198243 - BLOCK
      ?auto_198244 - BLOCK
      ?auto_198245 - BLOCK
      ?auto_198246 - BLOCK
      ?auto_198247 - BLOCK
      ?auto_198248 - BLOCK
      ?auto_198249 - BLOCK
    )
    :vars
    (
      ?auto_198250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198249 ?auto_198250 ) ( ON-TABLE ?auto_198241 ) ( ON ?auto_198242 ?auto_198241 ) ( ON ?auto_198243 ?auto_198242 ) ( ON ?auto_198244 ?auto_198243 ) ( not ( = ?auto_198241 ?auto_198242 ) ) ( not ( = ?auto_198241 ?auto_198243 ) ) ( not ( = ?auto_198241 ?auto_198244 ) ) ( not ( = ?auto_198241 ?auto_198245 ) ) ( not ( = ?auto_198241 ?auto_198246 ) ) ( not ( = ?auto_198241 ?auto_198247 ) ) ( not ( = ?auto_198241 ?auto_198248 ) ) ( not ( = ?auto_198241 ?auto_198249 ) ) ( not ( = ?auto_198241 ?auto_198250 ) ) ( not ( = ?auto_198242 ?auto_198243 ) ) ( not ( = ?auto_198242 ?auto_198244 ) ) ( not ( = ?auto_198242 ?auto_198245 ) ) ( not ( = ?auto_198242 ?auto_198246 ) ) ( not ( = ?auto_198242 ?auto_198247 ) ) ( not ( = ?auto_198242 ?auto_198248 ) ) ( not ( = ?auto_198242 ?auto_198249 ) ) ( not ( = ?auto_198242 ?auto_198250 ) ) ( not ( = ?auto_198243 ?auto_198244 ) ) ( not ( = ?auto_198243 ?auto_198245 ) ) ( not ( = ?auto_198243 ?auto_198246 ) ) ( not ( = ?auto_198243 ?auto_198247 ) ) ( not ( = ?auto_198243 ?auto_198248 ) ) ( not ( = ?auto_198243 ?auto_198249 ) ) ( not ( = ?auto_198243 ?auto_198250 ) ) ( not ( = ?auto_198244 ?auto_198245 ) ) ( not ( = ?auto_198244 ?auto_198246 ) ) ( not ( = ?auto_198244 ?auto_198247 ) ) ( not ( = ?auto_198244 ?auto_198248 ) ) ( not ( = ?auto_198244 ?auto_198249 ) ) ( not ( = ?auto_198244 ?auto_198250 ) ) ( not ( = ?auto_198245 ?auto_198246 ) ) ( not ( = ?auto_198245 ?auto_198247 ) ) ( not ( = ?auto_198245 ?auto_198248 ) ) ( not ( = ?auto_198245 ?auto_198249 ) ) ( not ( = ?auto_198245 ?auto_198250 ) ) ( not ( = ?auto_198246 ?auto_198247 ) ) ( not ( = ?auto_198246 ?auto_198248 ) ) ( not ( = ?auto_198246 ?auto_198249 ) ) ( not ( = ?auto_198246 ?auto_198250 ) ) ( not ( = ?auto_198247 ?auto_198248 ) ) ( not ( = ?auto_198247 ?auto_198249 ) ) ( not ( = ?auto_198247 ?auto_198250 ) ) ( not ( = ?auto_198248 ?auto_198249 ) ) ( not ( = ?auto_198248 ?auto_198250 ) ) ( not ( = ?auto_198249 ?auto_198250 ) ) ( ON ?auto_198248 ?auto_198249 ) ( ON ?auto_198247 ?auto_198248 ) ( ON ?auto_198246 ?auto_198247 ) ( CLEAR ?auto_198244 ) ( ON ?auto_198245 ?auto_198246 ) ( CLEAR ?auto_198245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_198241 ?auto_198242 ?auto_198243 ?auto_198244 ?auto_198245 )
      ( MAKE-9PILE ?auto_198241 ?auto_198242 ?auto_198243 ?auto_198244 ?auto_198245 ?auto_198246 ?auto_198247 ?auto_198248 ?auto_198249 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_198260 - BLOCK
      ?auto_198261 - BLOCK
      ?auto_198262 - BLOCK
      ?auto_198263 - BLOCK
      ?auto_198264 - BLOCK
      ?auto_198265 - BLOCK
      ?auto_198266 - BLOCK
      ?auto_198267 - BLOCK
      ?auto_198268 - BLOCK
    )
    :vars
    (
      ?auto_198269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198268 ?auto_198269 ) ( ON-TABLE ?auto_198260 ) ( ON ?auto_198261 ?auto_198260 ) ( ON ?auto_198262 ?auto_198261 ) ( not ( = ?auto_198260 ?auto_198261 ) ) ( not ( = ?auto_198260 ?auto_198262 ) ) ( not ( = ?auto_198260 ?auto_198263 ) ) ( not ( = ?auto_198260 ?auto_198264 ) ) ( not ( = ?auto_198260 ?auto_198265 ) ) ( not ( = ?auto_198260 ?auto_198266 ) ) ( not ( = ?auto_198260 ?auto_198267 ) ) ( not ( = ?auto_198260 ?auto_198268 ) ) ( not ( = ?auto_198260 ?auto_198269 ) ) ( not ( = ?auto_198261 ?auto_198262 ) ) ( not ( = ?auto_198261 ?auto_198263 ) ) ( not ( = ?auto_198261 ?auto_198264 ) ) ( not ( = ?auto_198261 ?auto_198265 ) ) ( not ( = ?auto_198261 ?auto_198266 ) ) ( not ( = ?auto_198261 ?auto_198267 ) ) ( not ( = ?auto_198261 ?auto_198268 ) ) ( not ( = ?auto_198261 ?auto_198269 ) ) ( not ( = ?auto_198262 ?auto_198263 ) ) ( not ( = ?auto_198262 ?auto_198264 ) ) ( not ( = ?auto_198262 ?auto_198265 ) ) ( not ( = ?auto_198262 ?auto_198266 ) ) ( not ( = ?auto_198262 ?auto_198267 ) ) ( not ( = ?auto_198262 ?auto_198268 ) ) ( not ( = ?auto_198262 ?auto_198269 ) ) ( not ( = ?auto_198263 ?auto_198264 ) ) ( not ( = ?auto_198263 ?auto_198265 ) ) ( not ( = ?auto_198263 ?auto_198266 ) ) ( not ( = ?auto_198263 ?auto_198267 ) ) ( not ( = ?auto_198263 ?auto_198268 ) ) ( not ( = ?auto_198263 ?auto_198269 ) ) ( not ( = ?auto_198264 ?auto_198265 ) ) ( not ( = ?auto_198264 ?auto_198266 ) ) ( not ( = ?auto_198264 ?auto_198267 ) ) ( not ( = ?auto_198264 ?auto_198268 ) ) ( not ( = ?auto_198264 ?auto_198269 ) ) ( not ( = ?auto_198265 ?auto_198266 ) ) ( not ( = ?auto_198265 ?auto_198267 ) ) ( not ( = ?auto_198265 ?auto_198268 ) ) ( not ( = ?auto_198265 ?auto_198269 ) ) ( not ( = ?auto_198266 ?auto_198267 ) ) ( not ( = ?auto_198266 ?auto_198268 ) ) ( not ( = ?auto_198266 ?auto_198269 ) ) ( not ( = ?auto_198267 ?auto_198268 ) ) ( not ( = ?auto_198267 ?auto_198269 ) ) ( not ( = ?auto_198268 ?auto_198269 ) ) ( ON ?auto_198267 ?auto_198268 ) ( ON ?auto_198266 ?auto_198267 ) ( ON ?auto_198265 ?auto_198266 ) ( ON ?auto_198264 ?auto_198265 ) ( CLEAR ?auto_198262 ) ( ON ?auto_198263 ?auto_198264 ) ( CLEAR ?auto_198263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_198260 ?auto_198261 ?auto_198262 ?auto_198263 )
      ( MAKE-9PILE ?auto_198260 ?auto_198261 ?auto_198262 ?auto_198263 ?auto_198264 ?auto_198265 ?auto_198266 ?auto_198267 ?auto_198268 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_198279 - BLOCK
      ?auto_198280 - BLOCK
      ?auto_198281 - BLOCK
      ?auto_198282 - BLOCK
      ?auto_198283 - BLOCK
      ?auto_198284 - BLOCK
      ?auto_198285 - BLOCK
      ?auto_198286 - BLOCK
      ?auto_198287 - BLOCK
    )
    :vars
    (
      ?auto_198288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198287 ?auto_198288 ) ( ON-TABLE ?auto_198279 ) ( ON ?auto_198280 ?auto_198279 ) ( ON ?auto_198281 ?auto_198280 ) ( not ( = ?auto_198279 ?auto_198280 ) ) ( not ( = ?auto_198279 ?auto_198281 ) ) ( not ( = ?auto_198279 ?auto_198282 ) ) ( not ( = ?auto_198279 ?auto_198283 ) ) ( not ( = ?auto_198279 ?auto_198284 ) ) ( not ( = ?auto_198279 ?auto_198285 ) ) ( not ( = ?auto_198279 ?auto_198286 ) ) ( not ( = ?auto_198279 ?auto_198287 ) ) ( not ( = ?auto_198279 ?auto_198288 ) ) ( not ( = ?auto_198280 ?auto_198281 ) ) ( not ( = ?auto_198280 ?auto_198282 ) ) ( not ( = ?auto_198280 ?auto_198283 ) ) ( not ( = ?auto_198280 ?auto_198284 ) ) ( not ( = ?auto_198280 ?auto_198285 ) ) ( not ( = ?auto_198280 ?auto_198286 ) ) ( not ( = ?auto_198280 ?auto_198287 ) ) ( not ( = ?auto_198280 ?auto_198288 ) ) ( not ( = ?auto_198281 ?auto_198282 ) ) ( not ( = ?auto_198281 ?auto_198283 ) ) ( not ( = ?auto_198281 ?auto_198284 ) ) ( not ( = ?auto_198281 ?auto_198285 ) ) ( not ( = ?auto_198281 ?auto_198286 ) ) ( not ( = ?auto_198281 ?auto_198287 ) ) ( not ( = ?auto_198281 ?auto_198288 ) ) ( not ( = ?auto_198282 ?auto_198283 ) ) ( not ( = ?auto_198282 ?auto_198284 ) ) ( not ( = ?auto_198282 ?auto_198285 ) ) ( not ( = ?auto_198282 ?auto_198286 ) ) ( not ( = ?auto_198282 ?auto_198287 ) ) ( not ( = ?auto_198282 ?auto_198288 ) ) ( not ( = ?auto_198283 ?auto_198284 ) ) ( not ( = ?auto_198283 ?auto_198285 ) ) ( not ( = ?auto_198283 ?auto_198286 ) ) ( not ( = ?auto_198283 ?auto_198287 ) ) ( not ( = ?auto_198283 ?auto_198288 ) ) ( not ( = ?auto_198284 ?auto_198285 ) ) ( not ( = ?auto_198284 ?auto_198286 ) ) ( not ( = ?auto_198284 ?auto_198287 ) ) ( not ( = ?auto_198284 ?auto_198288 ) ) ( not ( = ?auto_198285 ?auto_198286 ) ) ( not ( = ?auto_198285 ?auto_198287 ) ) ( not ( = ?auto_198285 ?auto_198288 ) ) ( not ( = ?auto_198286 ?auto_198287 ) ) ( not ( = ?auto_198286 ?auto_198288 ) ) ( not ( = ?auto_198287 ?auto_198288 ) ) ( ON ?auto_198286 ?auto_198287 ) ( ON ?auto_198285 ?auto_198286 ) ( ON ?auto_198284 ?auto_198285 ) ( ON ?auto_198283 ?auto_198284 ) ( CLEAR ?auto_198281 ) ( ON ?auto_198282 ?auto_198283 ) ( CLEAR ?auto_198282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_198279 ?auto_198280 ?auto_198281 ?auto_198282 )
      ( MAKE-9PILE ?auto_198279 ?auto_198280 ?auto_198281 ?auto_198282 ?auto_198283 ?auto_198284 ?auto_198285 ?auto_198286 ?auto_198287 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_198298 - BLOCK
      ?auto_198299 - BLOCK
      ?auto_198300 - BLOCK
      ?auto_198301 - BLOCK
      ?auto_198302 - BLOCK
      ?auto_198303 - BLOCK
      ?auto_198304 - BLOCK
      ?auto_198305 - BLOCK
      ?auto_198306 - BLOCK
    )
    :vars
    (
      ?auto_198307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198306 ?auto_198307 ) ( ON-TABLE ?auto_198298 ) ( ON ?auto_198299 ?auto_198298 ) ( not ( = ?auto_198298 ?auto_198299 ) ) ( not ( = ?auto_198298 ?auto_198300 ) ) ( not ( = ?auto_198298 ?auto_198301 ) ) ( not ( = ?auto_198298 ?auto_198302 ) ) ( not ( = ?auto_198298 ?auto_198303 ) ) ( not ( = ?auto_198298 ?auto_198304 ) ) ( not ( = ?auto_198298 ?auto_198305 ) ) ( not ( = ?auto_198298 ?auto_198306 ) ) ( not ( = ?auto_198298 ?auto_198307 ) ) ( not ( = ?auto_198299 ?auto_198300 ) ) ( not ( = ?auto_198299 ?auto_198301 ) ) ( not ( = ?auto_198299 ?auto_198302 ) ) ( not ( = ?auto_198299 ?auto_198303 ) ) ( not ( = ?auto_198299 ?auto_198304 ) ) ( not ( = ?auto_198299 ?auto_198305 ) ) ( not ( = ?auto_198299 ?auto_198306 ) ) ( not ( = ?auto_198299 ?auto_198307 ) ) ( not ( = ?auto_198300 ?auto_198301 ) ) ( not ( = ?auto_198300 ?auto_198302 ) ) ( not ( = ?auto_198300 ?auto_198303 ) ) ( not ( = ?auto_198300 ?auto_198304 ) ) ( not ( = ?auto_198300 ?auto_198305 ) ) ( not ( = ?auto_198300 ?auto_198306 ) ) ( not ( = ?auto_198300 ?auto_198307 ) ) ( not ( = ?auto_198301 ?auto_198302 ) ) ( not ( = ?auto_198301 ?auto_198303 ) ) ( not ( = ?auto_198301 ?auto_198304 ) ) ( not ( = ?auto_198301 ?auto_198305 ) ) ( not ( = ?auto_198301 ?auto_198306 ) ) ( not ( = ?auto_198301 ?auto_198307 ) ) ( not ( = ?auto_198302 ?auto_198303 ) ) ( not ( = ?auto_198302 ?auto_198304 ) ) ( not ( = ?auto_198302 ?auto_198305 ) ) ( not ( = ?auto_198302 ?auto_198306 ) ) ( not ( = ?auto_198302 ?auto_198307 ) ) ( not ( = ?auto_198303 ?auto_198304 ) ) ( not ( = ?auto_198303 ?auto_198305 ) ) ( not ( = ?auto_198303 ?auto_198306 ) ) ( not ( = ?auto_198303 ?auto_198307 ) ) ( not ( = ?auto_198304 ?auto_198305 ) ) ( not ( = ?auto_198304 ?auto_198306 ) ) ( not ( = ?auto_198304 ?auto_198307 ) ) ( not ( = ?auto_198305 ?auto_198306 ) ) ( not ( = ?auto_198305 ?auto_198307 ) ) ( not ( = ?auto_198306 ?auto_198307 ) ) ( ON ?auto_198305 ?auto_198306 ) ( ON ?auto_198304 ?auto_198305 ) ( ON ?auto_198303 ?auto_198304 ) ( ON ?auto_198302 ?auto_198303 ) ( ON ?auto_198301 ?auto_198302 ) ( CLEAR ?auto_198299 ) ( ON ?auto_198300 ?auto_198301 ) ( CLEAR ?auto_198300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_198298 ?auto_198299 ?auto_198300 )
      ( MAKE-9PILE ?auto_198298 ?auto_198299 ?auto_198300 ?auto_198301 ?auto_198302 ?auto_198303 ?auto_198304 ?auto_198305 ?auto_198306 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_198317 - BLOCK
      ?auto_198318 - BLOCK
      ?auto_198319 - BLOCK
      ?auto_198320 - BLOCK
      ?auto_198321 - BLOCK
      ?auto_198322 - BLOCK
      ?auto_198323 - BLOCK
      ?auto_198324 - BLOCK
      ?auto_198325 - BLOCK
    )
    :vars
    (
      ?auto_198326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198325 ?auto_198326 ) ( ON-TABLE ?auto_198317 ) ( ON ?auto_198318 ?auto_198317 ) ( not ( = ?auto_198317 ?auto_198318 ) ) ( not ( = ?auto_198317 ?auto_198319 ) ) ( not ( = ?auto_198317 ?auto_198320 ) ) ( not ( = ?auto_198317 ?auto_198321 ) ) ( not ( = ?auto_198317 ?auto_198322 ) ) ( not ( = ?auto_198317 ?auto_198323 ) ) ( not ( = ?auto_198317 ?auto_198324 ) ) ( not ( = ?auto_198317 ?auto_198325 ) ) ( not ( = ?auto_198317 ?auto_198326 ) ) ( not ( = ?auto_198318 ?auto_198319 ) ) ( not ( = ?auto_198318 ?auto_198320 ) ) ( not ( = ?auto_198318 ?auto_198321 ) ) ( not ( = ?auto_198318 ?auto_198322 ) ) ( not ( = ?auto_198318 ?auto_198323 ) ) ( not ( = ?auto_198318 ?auto_198324 ) ) ( not ( = ?auto_198318 ?auto_198325 ) ) ( not ( = ?auto_198318 ?auto_198326 ) ) ( not ( = ?auto_198319 ?auto_198320 ) ) ( not ( = ?auto_198319 ?auto_198321 ) ) ( not ( = ?auto_198319 ?auto_198322 ) ) ( not ( = ?auto_198319 ?auto_198323 ) ) ( not ( = ?auto_198319 ?auto_198324 ) ) ( not ( = ?auto_198319 ?auto_198325 ) ) ( not ( = ?auto_198319 ?auto_198326 ) ) ( not ( = ?auto_198320 ?auto_198321 ) ) ( not ( = ?auto_198320 ?auto_198322 ) ) ( not ( = ?auto_198320 ?auto_198323 ) ) ( not ( = ?auto_198320 ?auto_198324 ) ) ( not ( = ?auto_198320 ?auto_198325 ) ) ( not ( = ?auto_198320 ?auto_198326 ) ) ( not ( = ?auto_198321 ?auto_198322 ) ) ( not ( = ?auto_198321 ?auto_198323 ) ) ( not ( = ?auto_198321 ?auto_198324 ) ) ( not ( = ?auto_198321 ?auto_198325 ) ) ( not ( = ?auto_198321 ?auto_198326 ) ) ( not ( = ?auto_198322 ?auto_198323 ) ) ( not ( = ?auto_198322 ?auto_198324 ) ) ( not ( = ?auto_198322 ?auto_198325 ) ) ( not ( = ?auto_198322 ?auto_198326 ) ) ( not ( = ?auto_198323 ?auto_198324 ) ) ( not ( = ?auto_198323 ?auto_198325 ) ) ( not ( = ?auto_198323 ?auto_198326 ) ) ( not ( = ?auto_198324 ?auto_198325 ) ) ( not ( = ?auto_198324 ?auto_198326 ) ) ( not ( = ?auto_198325 ?auto_198326 ) ) ( ON ?auto_198324 ?auto_198325 ) ( ON ?auto_198323 ?auto_198324 ) ( ON ?auto_198322 ?auto_198323 ) ( ON ?auto_198321 ?auto_198322 ) ( ON ?auto_198320 ?auto_198321 ) ( CLEAR ?auto_198318 ) ( ON ?auto_198319 ?auto_198320 ) ( CLEAR ?auto_198319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_198317 ?auto_198318 ?auto_198319 )
      ( MAKE-9PILE ?auto_198317 ?auto_198318 ?auto_198319 ?auto_198320 ?auto_198321 ?auto_198322 ?auto_198323 ?auto_198324 ?auto_198325 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_198336 - BLOCK
      ?auto_198337 - BLOCK
      ?auto_198338 - BLOCK
      ?auto_198339 - BLOCK
      ?auto_198340 - BLOCK
      ?auto_198341 - BLOCK
      ?auto_198342 - BLOCK
      ?auto_198343 - BLOCK
      ?auto_198344 - BLOCK
    )
    :vars
    (
      ?auto_198345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198344 ?auto_198345 ) ( ON-TABLE ?auto_198336 ) ( not ( = ?auto_198336 ?auto_198337 ) ) ( not ( = ?auto_198336 ?auto_198338 ) ) ( not ( = ?auto_198336 ?auto_198339 ) ) ( not ( = ?auto_198336 ?auto_198340 ) ) ( not ( = ?auto_198336 ?auto_198341 ) ) ( not ( = ?auto_198336 ?auto_198342 ) ) ( not ( = ?auto_198336 ?auto_198343 ) ) ( not ( = ?auto_198336 ?auto_198344 ) ) ( not ( = ?auto_198336 ?auto_198345 ) ) ( not ( = ?auto_198337 ?auto_198338 ) ) ( not ( = ?auto_198337 ?auto_198339 ) ) ( not ( = ?auto_198337 ?auto_198340 ) ) ( not ( = ?auto_198337 ?auto_198341 ) ) ( not ( = ?auto_198337 ?auto_198342 ) ) ( not ( = ?auto_198337 ?auto_198343 ) ) ( not ( = ?auto_198337 ?auto_198344 ) ) ( not ( = ?auto_198337 ?auto_198345 ) ) ( not ( = ?auto_198338 ?auto_198339 ) ) ( not ( = ?auto_198338 ?auto_198340 ) ) ( not ( = ?auto_198338 ?auto_198341 ) ) ( not ( = ?auto_198338 ?auto_198342 ) ) ( not ( = ?auto_198338 ?auto_198343 ) ) ( not ( = ?auto_198338 ?auto_198344 ) ) ( not ( = ?auto_198338 ?auto_198345 ) ) ( not ( = ?auto_198339 ?auto_198340 ) ) ( not ( = ?auto_198339 ?auto_198341 ) ) ( not ( = ?auto_198339 ?auto_198342 ) ) ( not ( = ?auto_198339 ?auto_198343 ) ) ( not ( = ?auto_198339 ?auto_198344 ) ) ( not ( = ?auto_198339 ?auto_198345 ) ) ( not ( = ?auto_198340 ?auto_198341 ) ) ( not ( = ?auto_198340 ?auto_198342 ) ) ( not ( = ?auto_198340 ?auto_198343 ) ) ( not ( = ?auto_198340 ?auto_198344 ) ) ( not ( = ?auto_198340 ?auto_198345 ) ) ( not ( = ?auto_198341 ?auto_198342 ) ) ( not ( = ?auto_198341 ?auto_198343 ) ) ( not ( = ?auto_198341 ?auto_198344 ) ) ( not ( = ?auto_198341 ?auto_198345 ) ) ( not ( = ?auto_198342 ?auto_198343 ) ) ( not ( = ?auto_198342 ?auto_198344 ) ) ( not ( = ?auto_198342 ?auto_198345 ) ) ( not ( = ?auto_198343 ?auto_198344 ) ) ( not ( = ?auto_198343 ?auto_198345 ) ) ( not ( = ?auto_198344 ?auto_198345 ) ) ( ON ?auto_198343 ?auto_198344 ) ( ON ?auto_198342 ?auto_198343 ) ( ON ?auto_198341 ?auto_198342 ) ( ON ?auto_198340 ?auto_198341 ) ( ON ?auto_198339 ?auto_198340 ) ( ON ?auto_198338 ?auto_198339 ) ( CLEAR ?auto_198336 ) ( ON ?auto_198337 ?auto_198338 ) ( CLEAR ?auto_198337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_198336 ?auto_198337 )
      ( MAKE-9PILE ?auto_198336 ?auto_198337 ?auto_198338 ?auto_198339 ?auto_198340 ?auto_198341 ?auto_198342 ?auto_198343 ?auto_198344 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_198355 - BLOCK
      ?auto_198356 - BLOCK
      ?auto_198357 - BLOCK
      ?auto_198358 - BLOCK
      ?auto_198359 - BLOCK
      ?auto_198360 - BLOCK
      ?auto_198361 - BLOCK
      ?auto_198362 - BLOCK
      ?auto_198363 - BLOCK
    )
    :vars
    (
      ?auto_198364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198363 ?auto_198364 ) ( ON-TABLE ?auto_198355 ) ( not ( = ?auto_198355 ?auto_198356 ) ) ( not ( = ?auto_198355 ?auto_198357 ) ) ( not ( = ?auto_198355 ?auto_198358 ) ) ( not ( = ?auto_198355 ?auto_198359 ) ) ( not ( = ?auto_198355 ?auto_198360 ) ) ( not ( = ?auto_198355 ?auto_198361 ) ) ( not ( = ?auto_198355 ?auto_198362 ) ) ( not ( = ?auto_198355 ?auto_198363 ) ) ( not ( = ?auto_198355 ?auto_198364 ) ) ( not ( = ?auto_198356 ?auto_198357 ) ) ( not ( = ?auto_198356 ?auto_198358 ) ) ( not ( = ?auto_198356 ?auto_198359 ) ) ( not ( = ?auto_198356 ?auto_198360 ) ) ( not ( = ?auto_198356 ?auto_198361 ) ) ( not ( = ?auto_198356 ?auto_198362 ) ) ( not ( = ?auto_198356 ?auto_198363 ) ) ( not ( = ?auto_198356 ?auto_198364 ) ) ( not ( = ?auto_198357 ?auto_198358 ) ) ( not ( = ?auto_198357 ?auto_198359 ) ) ( not ( = ?auto_198357 ?auto_198360 ) ) ( not ( = ?auto_198357 ?auto_198361 ) ) ( not ( = ?auto_198357 ?auto_198362 ) ) ( not ( = ?auto_198357 ?auto_198363 ) ) ( not ( = ?auto_198357 ?auto_198364 ) ) ( not ( = ?auto_198358 ?auto_198359 ) ) ( not ( = ?auto_198358 ?auto_198360 ) ) ( not ( = ?auto_198358 ?auto_198361 ) ) ( not ( = ?auto_198358 ?auto_198362 ) ) ( not ( = ?auto_198358 ?auto_198363 ) ) ( not ( = ?auto_198358 ?auto_198364 ) ) ( not ( = ?auto_198359 ?auto_198360 ) ) ( not ( = ?auto_198359 ?auto_198361 ) ) ( not ( = ?auto_198359 ?auto_198362 ) ) ( not ( = ?auto_198359 ?auto_198363 ) ) ( not ( = ?auto_198359 ?auto_198364 ) ) ( not ( = ?auto_198360 ?auto_198361 ) ) ( not ( = ?auto_198360 ?auto_198362 ) ) ( not ( = ?auto_198360 ?auto_198363 ) ) ( not ( = ?auto_198360 ?auto_198364 ) ) ( not ( = ?auto_198361 ?auto_198362 ) ) ( not ( = ?auto_198361 ?auto_198363 ) ) ( not ( = ?auto_198361 ?auto_198364 ) ) ( not ( = ?auto_198362 ?auto_198363 ) ) ( not ( = ?auto_198362 ?auto_198364 ) ) ( not ( = ?auto_198363 ?auto_198364 ) ) ( ON ?auto_198362 ?auto_198363 ) ( ON ?auto_198361 ?auto_198362 ) ( ON ?auto_198360 ?auto_198361 ) ( ON ?auto_198359 ?auto_198360 ) ( ON ?auto_198358 ?auto_198359 ) ( ON ?auto_198357 ?auto_198358 ) ( CLEAR ?auto_198355 ) ( ON ?auto_198356 ?auto_198357 ) ( CLEAR ?auto_198356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_198355 ?auto_198356 )
      ( MAKE-9PILE ?auto_198355 ?auto_198356 ?auto_198357 ?auto_198358 ?auto_198359 ?auto_198360 ?auto_198361 ?auto_198362 ?auto_198363 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_198374 - BLOCK
      ?auto_198375 - BLOCK
      ?auto_198376 - BLOCK
      ?auto_198377 - BLOCK
      ?auto_198378 - BLOCK
      ?auto_198379 - BLOCK
      ?auto_198380 - BLOCK
      ?auto_198381 - BLOCK
      ?auto_198382 - BLOCK
    )
    :vars
    (
      ?auto_198383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198382 ?auto_198383 ) ( not ( = ?auto_198374 ?auto_198375 ) ) ( not ( = ?auto_198374 ?auto_198376 ) ) ( not ( = ?auto_198374 ?auto_198377 ) ) ( not ( = ?auto_198374 ?auto_198378 ) ) ( not ( = ?auto_198374 ?auto_198379 ) ) ( not ( = ?auto_198374 ?auto_198380 ) ) ( not ( = ?auto_198374 ?auto_198381 ) ) ( not ( = ?auto_198374 ?auto_198382 ) ) ( not ( = ?auto_198374 ?auto_198383 ) ) ( not ( = ?auto_198375 ?auto_198376 ) ) ( not ( = ?auto_198375 ?auto_198377 ) ) ( not ( = ?auto_198375 ?auto_198378 ) ) ( not ( = ?auto_198375 ?auto_198379 ) ) ( not ( = ?auto_198375 ?auto_198380 ) ) ( not ( = ?auto_198375 ?auto_198381 ) ) ( not ( = ?auto_198375 ?auto_198382 ) ) ( not ( = ?auto_198375 ?auto_198383 ) ) ( not ( = ?auto_198376 ?auto_198377 ) ) ( not ( = ?auto_198376 ?auto_198378 ) ) ( not ( = ?auto_198376 ?auto_198379 ) ) ( not ( = ?auto_198376 ?auto_198380 ) ) ( not ( = ?auto_198376 ?auto_198381 ) ) ( not ( = ?auto_198376 ?auto_198382 ) ) ( not ( = ?auto_198376 ?auto_198383 ) ) ( not ( = ?auto_198377 ?auto_198378 ) ) ( not ( = ?auto_198377 ?auto_198379 ) ) ( not ( = ?auto_198377 ?auto_198380 ) ) ( not ( = ?auto_198377 ?auto_198381 ) ) ( not ( = ?auto_198377 ?auto_198382 ) ) ( not ( = ?auto_198377 ?auto_198383 ) ) ( not ( = ?auto_198378 ?auto_198379 ) ) ( not ( = ?auto_198378 ?auto_198380 ) ) ( not ( = ?auto_198378 ?auto_198381 ) ) ( not ( = ?auto_198378 ?auto_198382 ) ) ( not ( = ?auto_198378 ?auto_198383 ) ) ( not ( = ?auto_198379 ?auto_198380 ) ) ( not ( = ?auto_198379 ?auto_198381 ) ) ( not ( = ?auto_198379 ?auto_198382 ) ) ( not ( = ?auto_198379 ?auto_198383 ) ) ( not ( = ?auto_198380 ?auto_198381 ) ) ( not ( = ?auto_198380 ?auto_198382 ) ) ( not ( = ?auto_198380 ?auto_198383 ) ) ( not ( = ?auto_198381 ?auto_198382 ) ) ( not ( = ?auto_198381 ?auto_198383 ) ) ( not ( = ?auto_198382 ?auto_198383 ) ) ( ON ?auto_198381 ?auto_198382 ) ( ON ?auto_198380 ?auto_198381 ) ( ON ?auto_198379 ?auto_198380 ) ( ON ?auto_198378 ?auto_198379 ) ( ON ?auto_198377 ?auto_198378 ) ( ON ?auto_198376 ?auto_198377 ) ( ON ?auto_198375 ?auto_198376 ) ( ON ?auto_198374 ?auto_198375 ) ( CLEAR ?auto_198374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_198374 )
      ( MAKE-9PILE ?auto_198374 ?auto_198375 ?auto_198376 ?auto_198377 ?auto_198378 ?auto_198379 ?auto_198380 ?auto_198381 ?auto_198382 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_198393 - BLOCK
      ?auto_198394 - BLOCK
      ?auto_198395 - BLOCK
      ?auto_198396 - BLOCK
      ?auto_198397 - BLOCK
      ?auto_198398 - BLOCK
      ?auto_198399 - BLOCK
      ?auto_198400 - BLOCK
      ?auto_198401 - BLOCK
    )
    :vars
    (
      ?auto_198402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198401 ?auto_198402 ) ( not ( = ?auto_198393 ?auto_198394 ) ) ( not ( = ?auto_198393 ?auto_198395 ) ) ( not ( = ?auto_198393 ?auto_198396 ) ) ( not ( = ?auto_198393 ?auto_198397 ) ) ( not ( = ?auto_198393 ?auto_198398 ) ) ( not ( = ?auto_198393 ?auto_198399 ) ) ( not ( = ?auto_198393 ?auto_198400 ) ) ( not ( = ?auto_198393 ?auto_198401 ) ) ( not ( = ?auto_198393 ?auto_198402 ) ) ( not ( = ?auto_198394 ?auto_198395 ) ) ( not ( = ?auto_198394 ?auto_198396 ) ) ( not ( = ?auto_198394 ?auto_198397 ) ) ( not ( = ?auto_198394 ?auto_198398 ) ) ( not ( = ?auto_198394 ?auto_198399 ) ) ( not ( = ?auto_198394 ?auto_198400 ) ) ( not ( = ?auto_198394 ?auto_198401 ) ) ( not ( = ?auto_198394 ?auto_198402 ) ) ( not ( = ?auto_198395 ?auto_198396 ) ) ( not ( = ?auto_198395 ?auto_198397 ) ) ( not ( = ?auto_198395 ?auto_198398 ) ) ( not ( = ?auto_198395 ?auto_198399 ) ) ( not ( = ?auto_198395 ?auto_198400 ) ) ( not ( = ?auto_198395 ?auto_198401 ) ) ( not ( = ?auto_198395 ?auto_198402 ) ) ( not ( = ?auto_198396 ?auto_198397 ) ) ( not ( = ?auto_198396 ?auto_198398 ) ) ( not ( = ?auto_198396 ?auto_198399 ) ) ( not ( = ?auto_198396 ?auto_198400 ) ) ( not ( = ?auto_198396 ?auto_198401 ) ) ( not ( = ?auto_198396 ?auto_198402 ) ) ( not ( = ?auto_198397 ?auto_198398 ) ) ( not ( = ?auto_198397 ?auto_198399 ) ) ( not ( = ?auto_198397 ?auto_198400 ) ) ( not ( = ?auto_198397 ?auto_198401 ) ) ( not ( = ?auto_198397 ?auto_198402 ) ) ( not ( = ?auto_198398 ?auto_198399 ) ) ( not ( = ?auto_198398 ?auto_198400 ) ) ( not ( = ?auto_198398 ?auto_198401 ) ) ( not ( = ?auto_198398 ?auto_198402 ) ) ( not ( = ?auto_198399 ?auto_198400 ) ) ( not ( = ?auto_198399 ?auto_198401 ) ) ( not ( = ?auto_198399 ?auto_198402 ) ) ( not ( = ?auto_198400 ?auto_198401 ) ) ( not ( = ?auto_198400 ?auto_198402 ) ) ( not ( = ?auto_198401 ?auto_198402 ) ) ( ON ?auto_198400 ?auto_198401 ) ( ON ?auto_198399 ?auto_198400 ) ( ON ?auto_198398 ?auto_198399 ) ( ON ?auto_198397 ?auto_198398 ) ( ON ?auto_198396 ?auto_198397 ) ( ON ?auto_198395 ?auto_198396 ) ( ON ?auto_198394 ?auto_198395 ) ( ON ?auto_198393 ?auto_198394 ) ( CLEAR ?auto_198393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_198393 )
      ( MAKE-9PILE ?auto_198393 ?auto_198394 ?auto_198395 ?auto_198396 ?auto_198397 ?auto_198398 ?auto_198399 ?auto_198400 ?auto_198401 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_198413 - BLOCK
      ?auto_198414 - BLOCK
      ?auto_198415 - BLOCK
      ?auto_198416 - BLOCK
      ?auto_198417 - BLOCK
      ?auto_198418 - BLOCK
      ?auto_198419 - BLOCK
      ?auto_198420 - BLOCK
      ?auto_198421 - BLOCK
      ?auto_198422 - BLOCK
    )
    :vars
    (
      ?auto_198423 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_198421 ) ( ON ?auto_198422 ?auto_198423 ) ( CLEAR ?auto_198422 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_198413 ) ( ON ?auto_198414 ?auto_198413 ) ( ON ?auto_198415 ?auto_198414 ) ( ON ?auto_198416 ?auto_198415 ) ( ON ?auto_198417 ?auto_198416 ) ( ON ?auto_198418 ?auto_198417 ) ( ON ?auto_198419 ?auto_198418 ) ( ON ?auto_198420 ?auto_198419 ) ( ON ?auto_198421 ?auto_198420 ) ( not ( = ?auto_198413 ?auto_198414 ) ) ( not ( = ?auto_198413 ?auto_198415 ) ) ( not ( = ?auto_198413 ?auto_198416 ) ) ( not ( = ?auto_198413 ?auto_198417 ) ) ( not ( = ?auto_198413 ?auto_198418 ) ) ( not ( = ?auto_198413 ?auto_198419 ) ) ( not ( = ?auto_198413 ?auto_198420 ) ) ( not ( = ?auto_198413 ?auto_198421 ) ) ( not ( = ?auto_198413 ?auto_198422 ) ) ( not ( = ?auto_198413 ?auto_198423 ) ) ( not ( = ?auto_198414 ?auto_198415 ) ) ( not ( = ?auto_198414 ?auto_198416 ) ) ( not ( = ?auto_198414 ?auto_198417 ) ) ( not ( = ?auto_198414 ?auto_198418 ) ) ( not ( = ?auto_198414 ?auto_198419 ) ) ( not ( = ?auto_198414 ?auto_198420 ) ) ( not ( = ?auto_198414 ?auto_198421 ) ) ( not ( = ?auto_198414 ?auto_198422 ) ) ( not ( = ?auto_198414 ?auto_198423 ) ) ( not ( = ?auto_198415 ?auto_198416 ) ) ( not ( = ?auto_198415 ?auto_198417 ) ) ( not ( = ?auto_198415 ?auto_198418 ) ) ( not ( = ?auto_198415 ?auto_198419 ) ) ( not ( = ?auto_198415 ?auto_198420 ) ) ( not ( = ?auto_198415 ?auto_198421 ) ) ( not ( = ?auto_198415 ?auto_198422 ) ) ( not ( = ?auto_198415 ?auto_198423 ) ) ( not ( = ?auto_198416 ?auto_198417 ) ) ( not ( = ?auto_198416 ?auto_198418 ) ) ( not ( = ?auto_198416 ?auto_198419 ) ) ( not ( = ?auto_198416 ?auto_198420 ) ) ( not ( = ?auto_198416 ?auto_198421 ) ) ( not ( = ?auto_198416 ?auto_198422 ) ) ( not ( = ?auto_198416 ?auto_198423 ) ) ( not ( = ?auto_198417 ?auto_198418 ) ) ( not ( = ?auto_198417 ?auto_198419 ) ) ( not ( = ?auto_198417 ?auto_198420 ) ) ( not ( = ?auto_198417 ?auto_198421 ) ) ( not ( = ?auto_198417 ?auto_198422 ) ) ( not ( = ?auto_198417 ?auto_198423 ) ) ( not ( = ?auto_198418 ?auto_198419 ) ) ( not ( = ?auto_198418 ?auto_198420 ) ) ( not ( = ?auto_198418 ?auto_198421 ) ) ( not ( = ?auto_198418 ?auto_198422 ) ) ( not ( = ?auto_198418 ?auto_198423 ) ) ( not ( = ?auto_198419 ?auto_198420 ) ) ( not ( = ?auto_198419 ?auto_198421 ) ) ( not ( = ?auto_198419 ?auto_198422 ) ) ( not ( = ?auto_198419 ?auto_198423 ) ) ( not ( = ?auto_198420 ?auto_198421 ) ) ( not ( = ?auto_198420 ?auto_198422 ) ) ( not ( = ?auto_198420 ?auto_198423 ) ) ( not ( = ?auto_198421 ?auto_198422 ) ) ( not ( = ?auto_198421 ?auto_198423 ) ) ( not ( = ?auto_198422 ?auto_198423 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_198422 ?auto_198423 )
      ( !STACK ?auto_198422 ?auto_198421 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_198434 - BLOCK
      ?auto_198435 - BLOCK
      ?auto_198436 - BLOCK
      ?auto_198437 - BLOCK
      ?auto_198438 - BLOCK
      ?auto_198439 - BLOCK
      ?auto_198440 - BLOCK
      ?auto_198441 - BLOCK
      ?auto_198442 - BLOCK
      ?auto_198443 - BLOCK
    )
    :vars
    (
      ?auto_198444 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_198442 ) ( ON ?auto_198443 ?auto_198444 ) ( CLEAR ?auto_198443 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_198434 ) ( ON ?auto_198435 ?auto_198434 ) ( ON ?auto_198436 ?auto_198435 ) ( ON ?auto_198437 ?auto_198436 ) ( ON ?auto_198438 ?auto_198437 ) ( ON ?auto_198439 ?auto_198438 ) ( ON ?auto_198440 ?auto_198439 ) ( ON ?auto_198441 ?auto_198440 ) ( ON ?auto_198442 ?auto_198441 ) ( not ( = ?auto_198434 ?auto_198435 ) ) ( not ( = ?auto_198434 ?auto_198436 ) ) ( not ( = ?auto_198434 ?auto_198437 ) ) ( not ( = ?auto_198434 ?auto_198438 ) ) ( not ( = ?auto_198434 ?auto_198439 ) ) ( not ( = ?auto_198434 ?auto_198440 ) ) ( not ( = ?auto_198434 ?auto_198441 ) ) ( not ( = ?auto_198434 ?auto_198442 ) ) ( not ( = ?auto_198434 ?auto_198443 ) ) ( not ( = ?auto_198434 ?auto_198444 ) ) ( not ( = ?auto_198435 ?auto_198436 ) ) ( not ( = ?auto_198435 ?auto_198437 ) ) ( not ( = ?auto_198435 ?auto_198438 ) ) ( not ( = ?auto_198435 ?auto_198439 ) ) ( not ( = ?auto_198435 ?auto_198440 ) ) ( not ( = ?auto_198435 ?auto_198441 ) ) ( not ( = ?auto_198435 ?auto_198442 ) ) ( not ( = ?auto_198435 ?auto_198443 ) ) ( not ( = ?auto_198435 ?auto_198444 ) ) ( not ( = ?auto_198436 ?auto_198437 ) ) ( not ( = ?auto_198436 ?auto_198438 ) ) ( not ( = ?auto_198436 ?auto_198439 ) ) ( not ( = ?auto_198436 ?auto_198440 ) ) ( not ( = ?auto_198436 ?auto_198441 ) ) ( not ( = ?auto_198436 ?auto_198442 ) ) ( not ( = ?auto_198436 ?auto_198443 ) ) ( not ( = ?auto_198436 ?auto_198444 ) ) ( not ( = ?auto_198437 ?auto_198438 ) ) ( not ( = ?auto_198437 ?auto_198439 ) ) ( not ( = ?auto_198437 ?auto_198440 ) ) ( not ( = ?auto_198437 ?auto_198441 ) ) ( not ( = ?auto_198437 ?auto_198442 ) ) ( not ( = ?auto_198437 ?auto_198443 ) ) ( not ( = ?auto_198437 ?auto_198444 ) ) ( not ( = ?auto_198438 ?auto_198439 ) ) ( not ( = ?auto_198438 ?auto_198440 ) ) ( not ( = ?auto_198438 ?auto_198441 ) ) ( not ( = ?auto_198438 ?auto_198442 ) ) ( not ( = ?auto_198438 ?auto_198443 ) ) ( not ( = ?auto_198438 ?auto_198444 ) ) ( not ( = ?auto_198439 ?auto_198440 ) ) ( not ( = ?auto_198439 ?auto_198441 ) ) ( not ( = ?auto_198439 ?auto_198442 ) ) ( not ( = ?auto_198439 ?auto_198443 ) ) ( not ( = ?auto_198439 ?auto_198444 ) ) ( not ( = ?auto_198440 ?auto_198441 ) ) ( not ( = ?auto_198440 ?auto_198442 ) ) ( not ( = ?auto_198440 ?auto_198443 ) ) ( not ( = ?auto_198440 ?auto_198444 ) ) ( not ( = ?auto_198441 ?auto_198442 ) ) ( not ( = ?auto_198441 ?auto_198443 ) ) ( not ( = ?auto_198441 ?auto_198444 ) ) ( not ( = ?auto_198442 ?auto_198443 ) ) ( not ( = ?auto_198442 ?auto_198444 ) ) ( not ( = ?auto_198443 ?auto_198444 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_198443 ?auto_198444 )
      ( !STACK ?auto_198443 ?auto_198442 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_198455 - BLOCK
      ?auto_198456 - BLOCK
      ?auto_198457 - BLOCK
      ?auto_198458 - BLOCK
      ?auto_198459 - BLOCK
      ?auto_198460 - BLOCK
      ?auto_198461 - BLOCK
      ?auto_198462 - BLOCK
      ?auto_198463 - BLOCK
      ?auto_198464 - BLOCK
    )
    :vars
    (
      ?auto_198465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198464 ?auto_198465 ) ( ON-TABLE ?auto_198455 ) ( ON ?auto_198456 ?auto_198455 ) ( ON ?auto_198457 ?auto_198456 ) ( ON ?auto_198458 ?auto_198457 ) ( ON ?auto_198459 ?auto_198458 ) ( ON ?auto_198460 ?auto_198459 ) ( ON ?auto_198461 ?auto_198460 ) ( ON ?auto_198462 ?auto_198461 ) ( not ( = ?auto_198455 ?auto_198456 ) ) ( not ( = ?auto_198455 ?auto_198457 ) ) ( not ( = ?auto_198455 ?auto_198458 ) ) ( not ( = ?auto_198455 ?auto_198459 ) ) ( not ( = ?auto_198455 ?auto_198460 ) ) ( not ( = ?auto_198455 ?auto_198461 ) ) ( not ( = ?auto_198455 ?auto_198462 ) ) ( not ( = ?auto_198455 ?auto_198463 ) ) ( not ( = ?auto_198455 ?auto_198464 ) ) ( not ( = ?auto_198455 ?auto_198465 ) ) ( not ( = ?auto_198456 ?auto_198457 ) ) ( not ( = ?auto_198456 ?auto_198458 ) ) ( not ( = ?auto_198456 ?auto_198459 ) ) ( not ( = ?auto_198456 ?auto_198460 ) ) ( not ( = ?auto_198456 ?auto_198461 ) ) ( not ( = ?auto_198456 ?auto_198462 ) ) ( not ( = ?auto_198456 ?auto_198463 ) ) ( not ( = ?auto_198456 ?auto_198464 ) ) ( not ( = ?auto_198456 ?auto_198465 ) ) ( not ( = ?auto_198457 ?auto_198458 ) ) ( not ( = ?auto_198457 ?auto_198459 ) ) ( not ( = ?auto_198457 ?auto_198460 ) ) ( not ( = ?auto_198457 ?auto_198461 ) ) ( not ( = ?auto_198457 ?auto_198462 ) ) ( not ( = ?auto_198457 ?auto_198463 ) ) ( not ( = ?auto_198457 ?auto_198464 ) ) ( not ( = ?auto_198457 ?auto_198465 ) ) ( not ( = ?auto_198458 ?auto_198459 ) ) ( not ( = ?auto_198458 ?auto_198460 ) ) ( not ( = ?auto_198458 ?auto_198461 ) ) ( not ( = ?auto_198458 ?auto_198462 ) ) ( not ( = ?auto_198458 ?auto_198463 ) ) ( not ( = ?auto_198458 ?auto_198464 ) ) ( not ( = ?auto_198458 ?auto_198465 ) ) ( not ( = ?auto_198459 ?auto_198460 ) ) ( not ( = ?auto_198459 ?auto_198461 ) ) ( not ( = ?auto_198459 ?auto_198462 ) ) ( not ( = ?auto_198459 ?auto_198463 ) ) ( not ( = ?auto_198459 ?auto_198464 ) ) ( not ( = ?auto_198459 ?auto_198465 ) ) ( not ( = ?auto_198460 ?auto_198461 ) ) ( not ( = ?auto_198460 ?auto_198462 ) ) ( not ( = ?auto_198460 ?auto_198463 ) ) ( not ( = ?auto_198460 ?auto_198464 ) ) ( not ( = ?auto_198460 ?auto_198465 ) ) ( not ( = ?auto_198461 ?auto_198462 ) ) ( not ( = ?auto_198461 ?auto_198463 ) ) ( not ( = ?auto_198461 ?auto_198464 ) ) ( not ( = ?auto_198461 ?auto_198465 ) ) ( not ( = ?auto_198462 ?auto_198463 ) ) ( not ( = ?auto_198462 ?auto_198464 ) ) ( not ( = ?auto_198462 ?auto_198465 ) ) ( not ( = ?auto_198463 ?auto_198464 ) ) ( not ( = ?auto_198463 ?auto_198465 ) ) ( not ( = ?auto_198464 ?auto_198465 ) ) ( CLEAR ?auto_198462 ) ( ON ?auto_198463 ?auto_198464 ) ( CLEAR ?auto_198463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_198455 ?auto_198456 ?auto_198457 ?auto_198458 ?auto_198459 ?auto_198460 ?auto_198461 ?auto_198462 ?auto_198463 )
      ( MAKE-10PILE ?auto_198455 ?auto_198456 ?auto_198457 ?auto_198458 ?auto_198459 ?auto_198460 ?auto_198461 ?auto_198462 ?auto_198463 ?auto_198464 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_198476 - BLOCK
      ?auto_198477 - BLOCK
      ?auto_198478 - BLOCK
      ?auto_198479 - BLOCK
      ?auto_198480 - BLOCK
      ?auto_198481 - BLOCK
      ?auto_198482 - BLOCK
      ?auto_198483 - BLOCK
      ?auto_198484 - BLOCK
      ?auto_198485 - BLOCK
    )
    :vars
    (
      ?auto_198486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198485 ?auto_198486 ) ( ON-TABLE ?auto_198476 ) ( ON ?auto_198477 ?auto_198476 ) ( ON ?auto_198478 ?auto_198477 ) ( ON ?auto_198479 ?auto_198478 ) ( ON ?auto_198480 ?auto_198479 ) ( ON ?auto_198481 ?auto_198480 ) ( ON ?auto_198482 ?auto_198481 ) ( ON ?auto_198483 ?auto_198482 ) ( not ( = ?auto_198476 ?auto_198477 ) ) ( not ( = ?auto_198476 ?auto_198478 ) ) ( not ( = ?auto_198476 ?auto_198479 ) ) ( not ( = ?auto_198476 ?auto_198480 ) ) ( not ( = ?auto_198476 ?auto_198481 ) ) ( not ( = ?auto_198476 ?auto_198482 ) ) ( not ( = ?auto_198476 ?auto_198483 ) ) ( not ( = ?auto_198476 ?auto_198484 ) ) ( not ( = ?auto_198476 ?auto_198485 ) ) ( not ( = ?auto_198476 ?auto_198486 ) ) ( not ( = ?auto_198477 ?auto_198478 ) ) ( not ( = ?auto_198477 ?auto_198479 ) ) ( not ( = ?auto_198477 ?auto_198480 ) ) ( not ( = ?auto_198477 ?auto_198481 ) ) ( not ( = ?auto_198477 ?auto_198482 ) ) ( not ( = ?auto_198477 ?auto_198483 ) ) ( not ( = ?auto_198477 ?auto_198484 ) ) ( not ( = ?auto_198477 ?auto_198485 ) ) ( not ( = ?auto_198477 ?auto_198486 ) ) ( not ( = ?auto_198478 ?auto_198479 ) ) ( not ( = ?auto_198478 ?auto_198480 ) ) ( not ( = ?auto_198478 ?auto_198481 ) ) ( not ( = ?auto_198478 ?auto_198482 ) ) ( not ( = ?auto_198478 ?auto_198483 ) ) ( not ( = ?auto_198478 ?auto_198484 ) ) ( not ( = ?auto_198478 ?auto_198485 ) ) ( not ( = ?auto_198478 ?auto_198486 ) ) ( not ( = ?auto_198479 ?auto_198480 ) ) ( not ( = ?auto_198479 ?auto_198481 ) ) ( not ( = ?auto_198479 ?auto_198482 ) ) ( not ( = ?auto_198479 ?auto_198483 ) ) ( not ( = ?auto_198479 ?auto_198484 ) ) ( not ( = ?auto_198479 ?auto_198485 ) ) ( not ( = ?auto_198479 ?auto_198486 ) ) ( not ( = ?auto_198480 ?auto_198481 ) ) ( not ( = ?auto_198480 ?auto_198482 ) ) ( not ( = ?auto_198480 ?auto_198483 ) ) ( not ( = ?auto_198480 ?auto_198484 ) ) ( not ( = ?auto_198480 ?auto_198485 ) ) ( not ( = ?auto_198480 ?auto_198486 ) ) ( not ( = ?auto_198481 ?auto_198482 ) ) ( not ( = ?auto_198481 ?auto_198483 ) ) ( not ( = ?auto_198481 ?auto_198484 ) ) ( not ( = ?auto_198481 ?auto_198485 ) ) ( not ( = ?auto_198481 ?auto_198486 ) ) ( not ( = ?auto_198482 ?auto_198483 ) ) ( not ( = ?auto_198482 ?auto_198484 ) ) ( not ( = ?auto_198482 ?auto_198485 ) ) ( not ( = ?auto_198482 ?auto_198486 ) ) ( not ( = ?auto_198483 ?auto_198484 ) ) ( not ( = ?auto_198483 ?auto_198485 ) ) ( not ( = ?auto_198483 ?auto_198486 ) ) ( not ( = ?auto_198484 ?auto_198485 ) ) ( not ( = ?auto_198484 ?auto_198486 ) ) ( not ( = ?auto_198485 ?auto_198486 ) ) ( CLEAR ?auto_198483 ) ( ON ?auto_198484 ?auto_198485 ) ( CLEAR ?auto_198484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_198476 ?auto_198477 ?auto_198478 ?auto_198479 ?auto_198480 ?auto_198481 ?auto_198482 ?auto_198483 ?auto_198484 )
      ( MAKE-10PILE ?auto_198476 ?auto_198477 ?auto_198478 ?auto_198479 ?auto_198480 ?auto_198481 ?auto_198482 ?auto_198483 ?auto_198484 ?auto_198485 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_198497 - BLOCK
      ?auto_198498 - BLOCK
      ?auto_198499 - BLOCK
      ?auto_198500 - BLOCK
      ?auto_198501 - BLOCK
      ?auto_198502 - BLOCK
      ?auto_198503 - BLOCK
      ?auto_198504 - BLOCK
      ?auto_198505 - BLOCK
      ?auto_198506 - BLOCK
    )
    :vars
    (
      ?auto_198507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198506 ?auto_198507 ) ( ON-TABLE ?auto_198497 ) ( ON ?auto_198498 ?auto_198497 ) ( ON ?auto_198499 ?auto_198498 ) ( ON ?auto_198500 ?auto_198499 ) ( ON ?auto_198501 ?auto_198500 ) ( ON ?auto_198502 ?auto_198501 ) ( ON ?auto_198503 ?auto_198502 ) ( not ( = ?auto_198497 ?auto_198498 ) ) ( not ( = ?auto_198497 ?auto_198499 ) ) ( not ( = ?auto_198497 ?auto_198500 ) ) ( not ( = ?auto_198497 ?auto_198501 ) ) ( not ( = ?auto_198497 ?auto_198502 ) ) ( not ( = ?auto_198497 ?auto_198503 ) ) ( not ( = ?auto_198497 ?auto_198504 ) ) ( not ( = ?auto_198497 ?auto_198505 ) ) ( not ( = ?auto_198497 ?auto_198506 ) ) ( not ( = ?auto_198497 ?auto_198507 ) ) ( not ( = ?auto_198498 ?auto_198499 ) ) ( not ( = ?auto_198498 ?auto_198500 ) ) ( not ( = ?auto_198498 ?auto_198501 ) ) ( not ( = ?auto_198498 ?auto_198502 ) ) ( not ( = ?auto_198498 ?auto_198503 ) ) ( not ( = ?auto_198498 ?auto_198504 ) ) ( not ( = ?auto_198498 ?auto_198505 ) ) ( not ( = ?auto_198498 ?auto_198506 ) ) ( not ( = ?auto_198498 ?auto_198507 ) ) ( not ( = ?auto_198499 ?auto_198500 ) ) ( not ( = ?auto_198499 ?auto_198501 ) ) ( not ( = ?auto_198499 ?auto_198502 ) ) ( not ( = ?auto_198499 ?auto_198503 ) ) ( not ( = ?auto_198499 ?auto_198504 ) ) ( not ( = ?auto_198499 ?auto_198505 ) ) ( not ( = ?auto_198499 ?auto_198506 ) ) ( not ( = ?auto_198499 ?auto_198507 ) ) ( not ( = ?auto_198500 ?auto_198501 ) ) ( not ( = ?auto_198500 ?auto_198502 ) ) ( not ( = ?auto_198500 ?auto_198503 ) ) ( not ( = ?auto_198500 ?auto_198504 ) ) ( not ( = ?auto_198500 ?auto_198505 ) ) ( not ( = ?auto_198500 ?auto_198506 ) ) ( not ( = ?auto_198500 ?auto_198507 ) ) ( not ( = ?auto_198501 ?auto_198502 ) ) ( not ( = ?auto_198501 ?auto_198503 ) ) ( not ( = ?auto_198501 ?auto_198504 ) ) ( not ( = ?auto_198501 ?auto_198505 ) ) ( not ( = ?auto_198501 ?auto_198506 ) ) ( not ( = ?auto_198501 ?auto_198507 ) ) ( not ( = ?auto_198502 ?auto_198503 ) ) ( not ( = ?auto_198502 ?auto_198504 ) ) ( not ( = ?auto_198502 ?auto_198505 ) ) ( not ( = ?auto_198502 ?auto_198506 ) ) ( not ( = ?auto_198502 ?auto_198507 ) ) ( not ( = ?auto_198503 ?auto_198504 ) ) ( not ( = ?auto_198503 ?auto_198505 ) ) ( not ( = ?auto_198503 ?auto_198506 ) ) ( not ( = ?auto_198503 ?auto_198507 ) ) ( not ( = ?auto_198504 ?auto_198505 ) ) ( not ( = ?auto_198504 ?auto_198506 ) ) ( not ( = ?auto_198504 ?auto_198507 ) ) ( not ( = ?auto_198505 ?auto_198506 ) ) ( not ( = ?auto_198505 ?auto_198507 ) ) ( not ( = ?auto_198506 ?auto_198507 ) ) ( ON ?auto_198505 ?auto_198506 ) ( CLEAR ?auto_198503 ) ( ON ?auto_198504 ?auto_198505 ) ( CLEAR ?auto_198504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_198497 ?auto_198498 ?auto_198499 ?auto_198500 ?auto_198501 ?auto_198502 ?auto_198503 ?auto_198504 )
      ( MAKE-10PILE ?auto_198497 ?auto_198498 ?auto_198499 ?auto_198500 ?auto_198501 ?auto_198502 ?auto_198503 ?auto_198504 ?auto_198505 ?auto_198506 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_198518 - BLOCK
      ?auto_198519 - BLOCK
      ?auto_198520 - BLOCK
      ?auto_198521 - BLOCK
      ?auto_198522 - BLOCK
      ?auto_198523 - BLOCK
      ?auto_198524 - BLOCK
      ?auto_198525 - BLOCK
      ?auto_198526 - BLOCK
      ?auto_198527 - BLOCK
    )
    :vars
    (
      ?auto_198528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198527 ?auto_198528 ) ( ON-TABLE ?auto_198518 ) ( ON ?auto_198519 ?auto_198518 ) ( ON ?auto_198520 ?auto_198519 ) ( ON ?auto_198521 ?auto_198520 ) ( ON ?auto_198522 ?auto_198521 ) ( ON ?auto_198523 ?auto_198522 ) ( ON ?auto_198524 ?auto_198523 ) ( not ( = ?auto_198518 ?auto_198519 ) ) ( not ( = ?auto_198518 ?auto_198520 ) ) ( not ( = ?auto_198518 ?auto_198521 ) ) ( not ( = ?auto_198518 ?auto_198522 ) ) ( not ( = ?auto_198518 ?auto_198523 ) ) ( not ( = ?auto_198518 ?auto_198524 ) ) ( not ( = ?auto_198518 ?auto_198525 ) ) ( not ( = ?auto_198518 ?auto_198526 ) ) ( not ( = ?auto_198518 ?auto_198527 ) ) ( not ( = ?auto_198518 ?auto_198528 ) ) ( not ( = ?auto_198519 ?auto_198520 ) ) ( not ( = ?auto_198519 ?auto_198521 ) ) ( not ( = ?auto_198519 ?auto_198522 ) ) ( not ( = ?auto_198519 ?auto_198523 ) ) ( not ( = ?auto_198519 ?auto_198524 ) ) ( not ( = ?auto_198519 ?auto_198525 ) ) ( not ( = ?auto_198519 ?auto_198526 ) ) ( not ( = ?auto_198519 ?auto_198527 ) ) ( not ( = ?auto_198519 ?auto_198528 ) ) ( not ( = ?auto_198520 ?auto_198521 ) ) ( not ( = ?auto_198520 ?auto_198522 ) ) ( not ( = ?auto_198520 ?auto_198523 ) ) ( not ( = ?auto_198520 ?auto_198524 ) ) ( not ( = ?auto_198520 ?auto_198525 ) ) ( not ( = ?auto_198520 ?auto_198526 ) ) ( not ( = ?auto_198520 ?auto_198527 ) ) ( not ( = ?auto_198520 ?auto_198528 ) ) ( not ( = ?auto_198521 ?auto_198522 ) ) ( not ( = ?auto_198521 ?auto_198523 ) ) ( not ( = ?auto_198521 ?auto_198524 ) ) ( not ( = ?auto_198521 ?auto_198525 ) ) ( not ( = ?auto_198521 ?auto_198526 ) ) ( not ( = ?auto_198521 ?auto_198527 ) ) ( not ( = ?auto_198521 ?auto_198528 ) ) ( not ( = ?auto_198522 ?auto_198523 ) ) ( not ( = ?auto_198522 ?auto_198524 ) ) ( not ( = ?auto_198522 ?auto_198525 ) ) ( not ( = ?auto_198522 ?auto_198526 ) ) ( not ( = ?auto_198522 ?auto_198527 ) ) ( not ( = ?auto_198522 ?auto_198528 ) ) ( not ( = ?auto_198523 ?auto_198524 ) ) ( not ( = ?auto_198523 ?auto_198525 ) ) ( not ( = ?auto_198523 ?auto_198526 ) ) ( not ( = ?auto_198523 ?auto_198527 ) ) ( not ( = ?auto_198523 ?auto_198528 ) ) ( not ( = ?auto_198524 ?auto_198525 ) ) ( not ( = ?auto_198524 ?auto_198526 ) ) ( not ( = ?auto_198524 ?auto_198527 ) ) ( not ( = ?auto_198524 ?auto_198528 ) ) ( not ( = ?auto_198525 ?auto_198526 ) ) ( not ( = ?auto_198525 ?auto_198527 ) ) ( not ( = ?auto_198525 ?auto_198528 ) ) ( not ( = ?auto_198526 ?auto_198527 ) ) ( not ( = ?auto_198526 ?auto_198528 ) ) ( not ( = ?auto_198527 ?auto_198528 ) ) ( ON ?auto_198526 ?auto_198527 ) ( CLEAR ?auto_198524 ) ( ON ?auto_198525 ?auto_198526 ) ( CLEAR ?auto_198525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_198518 ?auto_198519 ?auto_198520 ?auto_198521 ?auto_198522 ?auto_198523 ?auto_198524 ?auto_198525 )
      ( MAKE-10PILE ?auto_198518 ?auto_198519 ?auto_198520 ?auto_198521 ?auto_198522 ?auto_198523 ?auto_198524 ?auto_198525 ?auto_198526 ?auto_198527 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_198539 - BLOCK
      ?auto_198540 - BLOCK
      ?auto_198541 - BLOCK
      ?auto_198542 - BLOCK
      ?auto_198543 - BLOCK
      ?auto_198544 - BLOCK
      ?auto_198545 - BLOCK
      ?auto_198546 - BLOCK
      ?auto_198547 - BLOCK
      ?auto_198548 - BLOCK
    )
    :vars
    (
      ?auto_198549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198548 ?auto_198549 ) ( ON-TABLE ?auto_198539 ) ( ON ?auto_198540 ?auto_198539 ) ( ON ?auto_198541 ?auto_198540 ) ( ON ?auto_198542 ?auto_198541 ) ( ON ?auto_198543 ?auto_198542 ) ( ON ?auto_198544 ?auto_198543 ) ( not ( = ?auto_198539 ?auto_198540 ) ) ( not ( = ?auto_198539 ?auto_198541 ) ) ( not ( = ?auto_198539 ?auto_198542 ) ) ( not ( = ?auto_198539 ?auto_198543 ) ) ( not ( = ?auto_198539 ?auto_198544 ) ) ( not ( = ?auto_198539 ?auto_198545 ) ) ( not ( = ?auto_198539 ?auto_198546 ) ) ( not ( = ?auto_198539 ?auto_198547 ) ) ( not ( = ?auto_198539 ?auto_198548 ) ) ( not ( = ?auto_198539 ?auto_198549 ) ) ( not ( = ?auto_198540 ?auto_198541 ) ) ( not ( = ?auto_198540 ?auto_198542 ) ) ( not ( = ?auto_198540 ?auto_198543 ) ) ( not ( = ?auto_198540 ?auto_198544 ) ) ( not ( = ?auto_198540 ?auto_198545 ) ) ( not ( = ?auto_198540 ?auto_198546 ) ) ( not ( = ?auto_198540 ?auto_198547 ) ) ( not ( = ?auto_198540 ?auto_198548 ) ) ( not ( = ?auto_198540 ?auto_198549 ) ) ( not ( = ?auto_198541 ?auto_198542 ) ) ( not ( = ?auto_198541 ?auto_198543 ) ) ( not ( = ?auto_198541 ?auto_198544 ) ) ( not ( = ?auto_198541 ?auto_198545 ) ) ( not ( = ?auto_198541 ?auto_198546 ) ) ( not ( = ?auto_198541 ?auto_198547 ) ) ( not ( = ?auto_198541 ?auto_198548 ) ) ( not ( = ?auto_198541 ?auto_198549 ) ) ( not ( = ?auto_198542 ?auto_198543 ) ) ( not ( = ?auto_198542 ?auto_198544 ) ) ( not ( = ?auto_198542 ?auto_198545 ) ) ( not ( = ?auto_198542 ?auto_198546 ) ) ( not ( = ?auto_198542 ?auto_198547 ) ) ( not ( = ?auto_198542 ?auto_198548 ) ) ( not ( = ?auto_198542 ?auto_198549 ) ) ( not ( = ?auto_198543 ?auto_198544 ) ) ( not ( = ?auto_198543 ?auto_198545 ) ) ( not ( = ?auto_198543 ?auto_198546 ) ) ( not ( = ?auto_198543 ?auto_198547 ) ) ( not ( = ?auto_198543 ?auto_198548 ) ) ( not ( = ?auto_198543 ?auto_198549 ) ) ( not ( = ?auto_198544 ?auto_198545 ) ) ( not ( = ?auto_198544 ?auto_198546 ) ) ( not ( = ?auto_198544 ?auto_198547 ) ) ( not ( = ?auto_198544 ?auto_198548 ) ) ( not ( = ?auto_198544 ?auto_198549 ) ) ( not ( = ?auto_198545 ?auto_198546 ) ) ( not ( = ?auto_198545 ?auto_198547 ) ) ( not ( = ?auto_198545 ?auto_198548 ) ) ( not ( = ?auto_198545 ?auto_198549 ) ) ( not ( = ?auto_198546 ?auto_198547 ) ) ( not ( = ?auto_198546 ?auto_198548 ) ) ( not ( = ?auto_198546 ?auto_198549 ) ) ( not ( = ?auto_198547 ?auto_198548 ) ) ( not ( = ?auto_198547 ?auto_198549 ) ) ( not ( = ?auto_198548 ?auto_198549 ) ) ( ON ?auto_198547 ?auto_198548 ) ( ON ?auto_198546 ?auto_198547 ) ( CLEAR ?auto_198544 ) ( ON ?auto_198545 ?auto_198546 ) ( CLEAR ?auto_198545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_198539 ?auto_198540 ?auto_198541 ?auto_198542 ?auto_198543 ?auto_198544 ?auto_198545 )
      ( MAKE-10PILE ?auto_198539 ?auto_198540 ?auto_198541 ?auto_198542 ?auto_198543 ?auto_198544 ?auto_198545 ?auto_198546 ?auto_198547 ?auto_198548 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_198560 - BLOCK
      ?auto_198561 - BLOCK
      ?auto_198562 - BLOCK
      ?auto_198563 - BLOCK
      ?auto_198564 - BLOCK
      ?auto_198565 - BLOCK
      ?auto_198566 - BLOCK
      ?auto_198567 - BLOCK
      ?auto_198568 - BLOCK
      ?auto_198569 - BLOCK
    )
    :vars
    (
      ?auto_198570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198569 ?auto_198570 ) ( ON-TABLE ?auto_198560 ) ( ON ?auto_198561 ?auto_198560 ) ( ON ?auto_198562 ?auto_198561 ) ( ON ?auto_198563 ?auto_198562 ) ( ON ?auto_198564 ?auto_198563 ) ( ON ?auto_198565 ?auto_198564 ) ( not ( = ?auto_198560 ?auto_198561 ) ) ( not ( = ?auto_198560 ?auto_198562 ) ) ( not ( = ?auto_198560 ?auto_198563 ) ) ( not ( = ?auto_198560 ?auto_198564 ) ) ( not ( = ?auto_198560 ?auto_198565 ) ) ( not ( = ?auto_198560 ?auto_198566 ) ) ( not ( = ?auto_198560 ?auto_198567 ) ) ( not ( = ?auto_198560 ?auto_198568 ) ) ( not ( = ?auto_198560 ?auto_198569 ) ) ( not ( = ?auto_198560 ?auto_198570 ) ) ( not ( = ?auto_198561 ?auto_198562 ) ) ( not ( = ?auto_198561 ?auto_198563 ) ) ( not ( = ?auto_198561 ?auto_198564 ) ) ( not ( = ?auto_198561 ?auto_198565 ) ) ( not ( = ?auto_198561 ?auto_198566 ) ) ( not ( = ?auto_198561 ?auto_198567 ) ) ( not ( = ?auto_198561 ?auto_198568 ) ) ( not ( = ?auto_198561 ?auto_198569 ) ) ( not ( = ?auto_198561 ?auto_198570 ) ) ( not ( = ?auto_198562 ?auto_198563 ) ) ( not ( = ?auto_198562 ?auto_198564 ) ) ( not ( = ?auto_198562 ?auto_198565 ) ) ( not ( = ?auto_198562 ?auto_198566 ) ) ( not ( = ?auto_198562 ?auto_198567 ) ) ( not ( = ?auto_198562 ?auto_198568 ) ) ( not ( = ?auto_198562 ?auto_198569 ) ) ( not ( = ?auto_198562 ?auto_198570 ) ) ( not ( = ?auto_198563 ?auto_198564 ) ) ( not ( = ?auto_198563 ?auto_198565 ) ) ( not ( = ?auto_198563 ?auto_198566 ) ) ( not ( = ?auto_198563 ?auto_198567 ) ) ( not ( = ?auto_198563 ?auto_198568 ) ) ( not ( = ?auto_198563 ?auto_198569 ) ) ( not ( = ?auto_198563 ?auto_198570 ) ) ( not ( = ?auto_198564 ?auto_198565 ) ) ( not ( = ?auto_198564 ?auto_198566 ) ) ( not ( = ?auto_198564 ?auto_198567 ) ) ( not ( = ?auto_198564 ?auto_198568 ) ) ( not ( = ?auto_198564 ?auto_198569 ) ) ( not ( = ?auto_198564 ?auto_198570 ) ) ( not ( = ?auto_198565 ?auto_198566 ) ) ( not ( = ?auto_198565 ?auto_198567 ) ) ( not ( = ?auto_198565 ?auto_198568 ) ) ( not ( = ?auto_198565 ?auto_198569 ) ) ( not ( = ?auto_198565 ?auto_198570 ) ) ( not ( = ?auto_198566 ?auto_198567 ) ) ( not ( = ?auto_198566 ?auto_198568 ) ) ( not ( = ?auto_198566 ?auto_198569 ) ) ( not ( = ?auto_198566 ?auto_198570 ) ) ( not ( = ?auto_198567 ?auto_198568 ) ) ( not ( = ?auto_198567 ?auto_198569 ) ) ( not ( = ?auto_198567 ?auto_198570 ) ) ( not ( = ?auto_198568 ?auto_198569 ) ) ( not ( = ?auto_198568 ?auto_198570 ) ) ( not ( = ?auto_198569 ?auto_198570 ) ) ( ON ?auto_198568 ?auto_198569 ) ( ON ?auto_198567 ?auto_198568 ) ( CLEAR ?auto_198565 ) ( ON ?auto_198566 ?auto_198567 ) ( CLEAR ?auto_198566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_198560 ?auto_198561 ?auto_198562 ?auto_198563 ?auto_198564 ?auto_198565 ?auto_198566 )
      ( MAKE-10PILE ?auto_198560 ?auto_198561 ?auto_198562 ?auto_198563 ?auto_198564 ?auto_198565 ?auto_198566 ?auto_198567 ?auto_198568 ?auto_198569 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_198581 - BLOCK
      ?auto_198582 - BLOCK
      ?auto_198583 - BLOCK
      ?auto_198584 - BLOCK
      ?auto_198585 - BLOCK
      ?auto_198586 - BLOCK
      ?auto_198587 - BLOCK
      ?auto_198588 - BLOCK
      ?auto_198589 - BLOCK
      ?auto_198590 - BLOCK
    )
    :vars
    (
      ?auto_198591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198590 ?auto_198591 ) ( ON-TABLE ?auto_198581 ) ( ON ?auto_198582 ?auto_198581 ) ( ON ?auto_198583 ?auto_198582 ) ( ON ?auto_198584 ?auto_198583 ) ( ON ?auto_198585 ?auto_198584 ) ( not ( = ?auto_198581 ?auto_198582 ) ) ( not ( = ?auto_198581 ?auto_198583 ) ) ( not ( = ?auto_198581 ?auto_198584 ) ) ( not ( = ?auto_198581 ?auto_198585 ) ) ( not ( = ?auto_198581 ?auto_198586 ) ) ( not ( = ?auto_198581 ?auto_198587 ) ) ( not ( = ?auto_198581 ?auto_198588 ) ) ( not ( = ?auto_198581 ?auto_198589 ) ) ( not ( = ?auto_198581 ?auto_198590 ) ) ( not ( = ?auto_198581 ?auto_198591 ) ) ( not ( = ?auto_198582 ?auto_198583 ) ) ( not ( = ?auto_198582 ?auto_198584 ) ) ( not ( = ?auto_198582 ?auto_198585 ) ) ( not ( = ?auto_198582 ?auto_198586 ) ) ( not ( = ?auto_198582 ?auto_198587 ) ) ( not ( = ?auto_198582 ?auto_198588 ) ) ( not ( = ?auto_198582 ?auto_198589 ) ) ( not ( = ?auto_198582 ?auto_198590 ) ) ( not ( = ?auto_198582 ?auto_198591 ) ) ( not ( = ?auto_198583 ?auto_198584 ) ) ( not ( = ?auto_198583 ?auto_198585 ) ) ( not ( = ?auto_198583 ?auto_198586 ) ) ( not ( = ?auto_198583 ?auto_198587 ) ) ( not ( = ?auto_198583 ?auto_198588 ) ) ( not ( = ?auto_198583 ?auto_198589 ) ) ( not ( = ?auto_198583 ?auto_198590 ) ) ( not ( = ?auto_198583 ?auto_198591 ) ) ( not ( = ?auto_198584 ?auto_198585 ) ) ( not ( = ?auto_198584 ?auto_198586 ) ) ( not ( = ?auto_198584 ?auto_198587 ) ) ( not ( = ?auto_198584 ?auto_198588 ) ) ( not ( = ?auto_198584 ?auto_198589 ) ) ( not ( = ?auto_198584 ?auto_198590 ) ) ( not ( = ?auto_198584 ?auto_198591 ) ) ( not ( = ?auto_198585 ?auto_198586 ) ) ( not ( = ?auto_198585 ?auto_198587 ) ) ( not ( = ?auto_198585 ?auto_198588 ) ) ( not ( = ?auto_198585 ?auto_198589 ) ) ( not ( = ?auto_198585 ?auto_198590 ) ) ( not ( = ?auto_198585 ?auto_198591 ) ) ( not ( = ?auto_198586 ?auto_198587 ) ) ( not ( = ?auto_198586 ?auto_198588 ) ) ( not ( = ?auto_198586 ?auto_198589 ) ) ( not ( = ?auto_198586 ?auto_198590 ) ) ( not ( = ?auto_198586 ?auto_198591 ) ) ( not ( = ?auto_198587 ?auto_198588 ) ) ( not ( = ?auto_198587 ?auto_198589 ) ) ( not ( = ?auto_198587 ?auto_198590 ) ) ( not ( = ?auto_198587 ?auto_198591 ) ) ( not ( = ?auto_198588 ?auto_198589 ) ) ( not ( = ?auto_198588 ?auto_198590 ) ) ( not ( = ?auto_198588 ?auto_198591 ) ) ( not ( = ?auto_198589 ?auto_198590 ) ) ( not ( = ?auto_198589 ?auto_198591 ) ) ( not ( = ?auto_198590 ?auto_198591 ) ) ( ON ?auto_198589 ?auto_198590 ) ( ON ?auto_198588 ?auto_198589 ) ( ON ?auto_198587 ?auto_198588 ) ( CLEAR ?auto_198585 ) ( ON ?auto_198586 ?auto_198587 ) ( CLEAR ?auto_198586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_198581 ?auto_198582 ?auto_198583 ?auto_198584 ?auto_198585 ?auto_198586 )
      ( MAKE-10PILE ?auto_198581 ?auto_198582 ?auto_198583 ?auto_198584 ?auto_198585 ?auto_198586 ?auto_198587 ?auto_198588 ?auto_198589 ?auto_198590 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_198602 - BLOCK
      ?auto_198603 - BLOCK
      ?auto_198604 - BLOCK
      ?auto_198605 - BLOCK
      ?auto_198606 - BLOCK
      ?auto_198607 - BLOCK
      ?auto_198608 - BLOCK
      ?auto_198609 - BLOCK
      ?auto_198610 - BLOCK
      ?auto_198611 - BLOCK
    )
    :vars
    (
      ?auto_198612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198611 ?auto_198612 ) ( ON-TABLE ?auto_198602 ) ( ON ?auto_198603 ?auto_198602 ) ( ON ?auto_198604 ?auto_198603 ) ( ON ?auto_198605 ?auto_198604 ) ( ON ?auto_198606 ?auto_198605 ) ( not ( = ?auto_198602 ?auto_198603 ) ) ( not ( = ?auto_198602 ?auto_198604 ) ) ( not ( = ?auto_198602 ?auto_198605 ) ) ( not ( = ?auto_198602 ?auto_198606 ) ) ( not ( = ?auto_198602 ?auto_198607 ) ) ( not ( = ?auto_198602 ?auto_198608 ) ) ( not ( = ?auto_198602 ?auto_198609 ) ) ( not ( = ?auto_198602 ?auto_198610 ) ) ( not ( = ?auto_198602 ?auto_198611 ) ) ( not ( = ?auto_198602 ?auto_198612 ) ) ( not ( = ?auto_198603 ?auto_198604 ) ) ( not ( = ?auto_198603 ?auto_198605 ) ) ( not ( = ?auto_198603 ?auto_198606 ) ) ( not ( = ?auto_198603 ?auto_198607 ) ) ( not ( = ?auto_198603 ?auto_198608 ) ) ( not ( = ?auto_198603 ?auto_198609 ) ) ( not ( = ?auto_198603 ?auto_198610 ) ) ( not ( = ?auto_198603 ?auto_198611 ) ) ( not ( = ?auto_198603 ?auto_198612 ) ) ( not ( = ?auto_198604 ?auto_198605 ) ) ( not ( = ?auto_198604 ?auto_198606 ) ) ( not ( = ?auto_198604 ?auto_198607 ) ) ( not ( = ?auto_198604 ?auto_198608 ) ) ( not ( = ?auto_198604 ?auto_198609 ) ) ( not ( = ?auto_198604 ?auto_198610 ) ) ( not ( = ?auto_198604 ?auto_198611 ) ) ( not ( = ?auto_198604 ?auto_198612 ) ) ( not ( = ?auto_198605 ?auto_198606 ) ) ( not ( = ?auto_198605 ?auto_198607 ) ) ( not ( = ?auto_198605 ?auto_198608 ) ) ( not ( = ?auto_198605 ?auto_198609 ) ) ( not ( = ?auto_198605 ?auto_198610 ) ) ( not ( = ?auto_198605 ?auto_198611 ) ) ( not ( = ?auto_198605 ?auto_198612 ) ) ( not ( = ?auto_198606 ?auto_198607 ) ) ( not ( = ?auto_198606 ?auto_198608 ) ) ( not ( = ?auto_198606 ?auto_198609 ) ) ( not ( = ?auto_198606 ?auto_198610 ) ) ( not ( = ?auto_198606 ?auto_198611 ) ) ( not ( = ?auto_198606 ?auto_198612 ) ) ( not ( = ?auto_198607 ?auto_198608 ) ) ( not ( = ?auto_198607 ?auto_198609 ) ) ( not ( = ?auto_198607 ?auto_198610 ) ) ( not ( = ?auto_198607 ?auto_198611 ) ) ( not ( = ?auto_198607 ?auto_198612 ) ) ( not ( = ?auto_198608 ?auto_198609 ) ) ( not ( = ?auto_198608 ?auto_198610 ) ) ( not ( = ?auto_198608 ?auto_198611 ) ) ( not ( = ?auto_198608 ?auto_198612 ) ) ( not ( = ?auto_198609 ?auto_198610 ) ) ( not ( = ?auto_198609 ?auto_198611 ) ) ( not ( = ?auto_198609 ?auto_198612 ) ) ( not ( = ?auto_198610 ?auto_198611 ) ) ( not ( = ?auto_198610 ?auto_198612 ) ) ( not ( = ?auto_198611 ?auto_198612 ) ) ( ON ?auto_198610 ?auto_198611 ) ( ON ?auto_198609 ?auto_198610 ) ( ON ?auto_198608 ?auto_198609 ) ( CLEAR ?auto_198606 ) ( ON ?auto_198607 ?auto_198608 ) ( CLEAR ?auto_198607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_198602 ?auto_198603 ?auto_198604 ?auto_198605 ?auto_198606 ?auto_198607 )
      ( MAKE-10PILE ?auto_198602 ?auto_198603 ?auto_198604 ?auto_198605 ?auto_198606 ?auto_198607 ?auto_198608 ?auto_198609 ?auto_198610 ?auto_198611 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_198623 - BLOCK
      ?auto_198624 - BLOCK
      ?auto_198625 - BLOCK
      ?auto_198626 - BLOCK
      ?auto_198627 - BLOCK
      ?auto_198628 - BLOCK
      ?auto_198629 - BLOCK
      ?auto_198630 - BLOCK
      ?auto_198631 - BLOCK
      ?auto_198632 - BLOCK
    )
    :vars
    (
      ?auto_198633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198632 ?auto_198633 ) ( ON-TABLE ?auto_198623 ) ( ON ?auto_198624 ?auto_198623 ) ( ON ?auto_198625 ?auto_198624 ) ( ON ?auto_198626 ?auto_198625 ) ( not ( = ?auto_198623 ?auto_198624 ) ) ( not ( = ?auto_198623 ?auto_198625 ) ) ( not ( = ?auto_198623 ?auto_198626 ) ) ( not ( = ?auto_198623 ?auto_198627 ) ) ( not ( = ?auto_198623 ?auto_198628 ) ) ( not ( = ?auto_198623 ?auto_198629 ) ) ( not ( = ?auto_198623 ?auto_198630 ) ) ( not ( = ?auto_198623 ?auto_198631 ) ) ( not ( = ?auto_198623 ?auto_198632 ) ) ( not ( = ?auto_198623 ?auto_198633 ) ) ( not ( = ?auto_198624 ?auto_198625 ) ) ( not ( = ?auto_198624 ?auto_198626 ) ) ( not ( = ?auto_198624 ?auto_198627 ) ) ( not ( = ?auto_198624 ?auto_198628 ) ) ( not ( = ?auto_198624 ?auto_198629 ) ) ( not ( = ?auto_198624 ?auto_198630 ) ) ( not ( = ?auto_198624 ?auto_198631 ) ) ( not ( = ?auto_198624 ?auto_198632 ) ) ( not ( = ?auto_198624 ?auto_198633 ) ) ( not ( = ?auto_198625 ?auto_198626 ) ) ( not ( = ?auto_198625 ?auto_198627 ) ) ( not ( = ?auto_198625 ?auto_198628 ) ) ( not ( = ?auto_198625 ?auto_198629 ) ) ( not ( = ?auto_198625 ?auto_198630 ) ) ( not ( = ?auto_198625 ?auto_198631 ) ) ( not ( = ?auto_198625 ?auto_198632 ) ) ( not ( = ?auto_198625 ?auto_198633 ) ) ( not ( = ?auto_198626 ?auto_198627 ) ) ( not ( = ?auto_198626 ?auto_198628 ) ) ( not ( = ?auto_198626 ?auto_198629 ) ) ( not ( = ?auto_198626 ?auto_198630 ) ) ( not ( = ?auto_198626 ?auto_198631 ) ) ( not ( = ?auto_198626 ?auto_198632 ) ) ( not ( = ?auto_198626 ?auto_198633 ) ) ( not ( = ?auto_198627 ?auto_198628 ) ) ( not ( = ?auto_198627 ?auto_198629 ) ) ( not ( = ?auto_198627 ?auto_198630 ) ) ( not ( = ?auto_198627 ?auto_198631 ) ) ( not ( = ?auto_198627 ?auto_198632 ) ) ( not ( = ?auto_198627 ?auto_198633 ) ) ( not ( = ?auto_198628 ?auto_198629 ) ) ( not ( = ?auto_198628 ?auto_198630 ) ) ( not ( = ?auto_198628 ?auto_198631 ) ) ( not ( = ?auto_198628 ?auto_198632 ) ) ( not ( = ?auto_198628 ?auto_198633 ) ) ( not ( = ?auto_198629 ?auto_198630 ) ) ( not ( = ?auto_198629 ?auto_198631 ) ) ( not ( = ?auto_198629 ?auto_198632 ) ) ( not ( = ?auto_198629 ?auto_198633 ) ) ( not ( = ?auto_198630 ?auto_198631 ) ) ( not ( = ?auto_198630 ?auto_198632 ) ) ( not ( = ?auto_198630 ?auto_198633 ) ) ( not ( = ?auto_198631 ?auto_198632 ) ) ( not ( = ?auto_198631 ?auto_198633 ) ) ( not ( = ?auto_198632 ?auto_198633 ) ) ( ON ?auto_198631 ?auto_198632 ) ( ON ?auto_198630 ?auto_198631 ) ( ON ?auto_198629 ?auto_198630 ) ( ON ?auto_198628 ?auto_198629 ) ( CLEAR ?auto_198626 ) ( ON ?auto_198627 ?auto_198628 ) ( CLEAR ?auto_198627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_198623 ?auto_198624 ?auto_198625 ?auto_198626 ?auto_198627 )
      ( MAKE-10PILE ?auto_198623 ?auto_198624 ?auto_198625 ?auto_198626 ?auto_198627 ?auto_198628 ?auto_198629 ?auto_198630 ?auto_198631 ?auto_198632 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_198644 - BLOCK
      ?auto_198645 - BLOCK
      ?auto_198646 - BLOCK
      ?auto_198647 - BLOCK
      ?auto_198648 - BLOCK
      ?auto_198649 - BLOCK
      ?auto_198650 - BLOCK
      ?auto_198651 - BLOCK
      ?auto_198652 - BLOCK
      ?auto_198653 - BLOCK
    )
    :vars
    (
      ?auto_198654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198653 ?auto_198654 ) ( ON-TABLE ?auto_198644 ) ( ON ?auto_198645 ?auto_198644 ) ( ON ?auto_198646 ?auto_198645 ) ( ON ?auto_198647 ?auto_198646 ) ( not ( = ?auto_198644 ?auto_198645 ) ) ( not ( = ?auto_198644 ?auto_198646 ) ) ( not ( = ?auto_198644 ?auto_198647 ) ) ( not ( = ?auto_198644 ?auto_198648 ) ) ( not ( = ?auto_198644 ?auto_198649 ) ) ( not ( = ?auto_198644 ?auto_198650 ) ) ( not ( = ?auto_198644 ?auto_198651 ) ) ( not ( = ?auto_198644 ?auto_198652 ) ) ( not ( = ?auto_198644 ?auto_198653 ) ) ( not ( = ?auto_198644 ?auto_198654 ) ) ( not ( = ?auto_198645 ?auto_198646 ) ) ( not ( = ?auto_198645 ?auto_198647 ) ) ( not ( = ?auto_198645 ?auto_198648 ) ) ( not ( = ?auto_198645 ?auto_198649 ) ) ( not ( = ?auto_198645 ?auto_198650 ) ) ( not ( = ?auto_198645 ?auto_198651 ) ) ( not ( = ?auto_198645 ?auto_198652 ) ) ( not ( = ?auto_198645 ?auto_198653 ) ) ( not ( = ?auto_198645 ?auto_198654 ) ) ( not ( = ?auto_198646 ?auto_198647 ) ) ( not ( = ?auto_198646 ?auto_198648 ) ) ( not ( = ?auto_198646 ?auto_198649 ) ) ( not ( = ?auto_198646 ?auto_198650 ) ) ( not ( = ?auto_198646 ?auto_198651 ) ) ( not ( = ?auto_198646 ?auto_198652 ) ) ( not ( = ?auto_198646 ?auto_198653 ) ) ( not ( = ?auto_198646 ?auto_198654 ) ) ( not ( = ?auto_198647 ?auto_198648 ) ) ( not ( = ?auto_198647 ?auto_198649 ) ) ( not ( = ?auto_198647 ?auto_198650 ) ) ( not ( = ?auto_198647 ?auto_198651 ) ) ( not ( = ?auto_198647 ?auto_198652 ) ) ( not ( = ?auto_198647 ?auto_198653 ) ) ( not ( = ?auto_198647 ?auto_198654 ) ) ( not ( = ?auto_198648 ?auto_198649 ) ) ( not ( = ?auto_198648 ?auto_198650 ) ) ( not ( = ?auto_198648 ?auto_198651 ) ) ( not ( = ?auto_198648 ?auto_198652 ) ) ( not ( = ?auto_198648 ?auto_198653 ) ) ( not ( = ?auto_198648 ?auto_198654 ) ) ( not ( = ?auto_198649 ?auto_198650 ) ) ( not ( = ?auto_198649 ?auto_198651 ) ) ( not ( = ?auto_198649 ?auto_198652 ) ) ( not ( = ?auto_198649 ?auto_198653 ) ) ( not ( = ?auto_198649 ?auto_198654 ) ) ( not ( = ?auto_198650 ?auto_198651 ) ) ( not ( = ?auto_198650 ?auto_198652 ) ) ( not ( = ?auto_198650 ?auto_198653 ) ) ( not ( = ?auto_198650 ?auto_198654 ) ) ( not ( = ?auto_198651 ?auto_198652 ) ) ( not ( = ?auto_198651 ?auto_198653 ) ) ( not ( = ?auto_198651 ?auto_198654 ) ) ( not ( = ?auto_198652 ?auto_198653 ) ) ( not ( = ?auto_198652 ?auto_198654 ) ) ( not ( = ?auto_198653 ?auto_198654 ) ) ( ON ?auto_198652 ?auto_198653 ) ( ON ?auto_198651 ?auto_198652 ) ( ON ?auto_198650 ?auto_198651 ) ( ON ?auto_198649 ?auto_198650 ) ( CLEAR ?auto_198647 ) ( ON ?auto_198648 ?auto_198649 ) ( CLEAR ?auto_198648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_198644 ?auto_198645 ?auto_198646 ?auto_198647 ?auto_198648 )
      ( MAKE-10PILE ?auto_198644 ?auto_198645 ?auto_198646 ?auto_198647 ?auto_198648 ?auto_198649 ?auto_198650 ?auto_198651 ?auto_198652 ?auto_198653 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_198665 - BLOCK
      ?auto_198666 - BLOCK
      ?auto_198667 - BLOCK
      ?auto_198668 - BLOCK
      ?auto_198669 - BLOCK
      ?auto_198670 - BLOCK
      ?auto_198671 - BLOCK
      ?auto_198672 - BLOCK
      ?auto_198673 - BLOCK
      ?auto_198674 - BLOCK
    )
    :vars
    (
      ?auto_198675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198674 ?auto_198675 ) ( ON-TABLE ?auto_198665 ) ( ON ?auto_198666 ?auto_198665 ) ( ON ?auto_198667 ?auto_198666 ) ( not ( = ?auto_198665 ?auto_198666 ) ) ( not ( = ?auto_198665 ?auto_198667 ) ) ( not ( = ?auto_198665 ?auto_198668 ) ) ( not ( = ?auto_198665 ?auto_198669 ) ) ( not ( = ?auto_198665 ?auto_198670 ) ) ( not ( = ?auto_198665 ?auto_198671 ) ) ( not ( = ?auto_198665 ?auto_198672 ) ) ( not ( = ?auto_198665 ?auto_198673 ) ) ( not ( = ?auto_198665 ?auto_198674 ) ) ( not ( = ?auto_198665 ?auto_198675 ) ) ( not ( = ?auto_198666 ?auto_198667 ) ) ( not ( = ?auto_198666 ?auto_198668 ) ) ( not ( = ?auto_198666 ?auto_198669 ) ) ( not ( = ?auto_198666 ?auto_198670 ) ) ( not ( = ?auto_198666 ?auto_198671 ) ) ( not ( = ?auto_198666 ?auto_198672 ) ) ( not ( = ?auto_198666 ?auto_198673 ) ) ( not ( = ?auto_198666 ?auto_198674 ) ) ( not ( = ?auto_198666 ?auto_198675 ) ) ( not ( = ?auto_198667 ?auto_198668 ) ) ( not ( = ?auto_198667 ?auto_198669 ) ) ( not ( = ?auto_198667 ?auto_198670 ) ) ( not ( = ?auto_198667 ?auto_198671 ) ) ( not ( = ?auto_198667 ?auto_198672 ) ) ( not ( = ?auto_198667 ?auto_198673 ) ) ( not ( = ?auto_198667 ?auto_198674 ) ) ( not ( = ?auto_198667 ?auto_198675 ) ) ( not ( = ?auto_198668 ?auto_198669 ) ) ( not ( = ?auto_198668 ?auto_198670 ) ) ( not ( = ?auto_198668 ?auto_198671 ) ) ( not ( = ?auto_198668 ?auto_198672 ) ) ( not ( = ?auto_198668 ?auto_198673 ) ) ( not ( = ?auto_198668 ?auto_198674 ) ) ( not ( = ?auto_198668 ?auto_198675 ) ) ( not ( = ?auto_198669 ?auto_198670 ) ) ( not ( = ?auto_198669 ?auto_198671 ) ) ( not ( = ?auto_198669 ?auto_198672 ) ) ( not ( = ?auto_198669 ?auto_198673 ) ) ( not ( = ?auto_198669 ?auto_198674 ) ) ( not ( = ?auto_198669 ?auto_198675 ) ) ( not ( = ?auto_198670 ?auto_198671 ) ) ( not ( = ?auto_198670 ?auto_198672 ) ) ( not ( = ?auto_198670 ?auto_198673 ) ) ( not ( = ?auto_198670 ?auto_198674 ) ) ( not ( = ?auto_198670 ?auto_198675 ) ) ( not ( = ?auto_198671 ?auto_198672 ) ) ( not ( = ?auto_198671 ?auto_198673 ) ) ( not ( = ?auto_198671 ?auto_198674 ) ) ( not ( = ?auto_198671 ?auto_198675 ) ) ( not ( = ?auto_198672 ?auto_198673 ) ) ( not ( = ?auto_198672 ?auto_198674 ) ) ( not ( = ?auto_198672 ?auto_198675 ) ) ( not ( = ?auto_198673 ?auto_198674 ) ) ( not ( = ?auto_198673 ?auto_198675 ) ) ( not ( = ?auto_198674 ?auto_198675 ) ) ( ON ?auto_198673 ?auto_198674 ) ( ON ?auto_198672 ?auto_198673 ) ( ON ?auto_198671 ?auto_198672 ) ( ON ?auto_198670 ?auto_198671 ) ( ON ?auto_198669 ?auto_198670 ) ( CLEAR ?auto_198667 ) ( ON ?auto_198668 ?auto_198669 ) ( CLEAR ?auto_198668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_198665 ?auto_198666 ?auto_198667 ?auto_198668 )
      ( MAKE-10PILE ?auto_198665 ?auto_198666 ?auto_198667 ?auto_198668 ?auto_198669 ?auto_198670 ?auto_198671 ?auto_198672 ?auto_198673 ?auto_198674 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_198686 - BLOCK
      ?auto_198687 - BLOCK
      ?auto_198688 - BLOCK
      ?auto_198689 - BLOCK
      ?auto_198690 - BLOCK
      ?auto_198691 - BLOCK
      ?auto_198692 - BLOCK
      ?auto_198693 - BLOCK
      ?auto_198694 - BLOCK
      ?auto_198695 - BLOCK
    )
    :vars
    (
      ?auto_198696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198695 ?auto_198696 ) ( ON-TABLE ?auto_198686 ) ( ON ?auto_198687 ?auto_198686 ) ( ON ?auto_198688 ?auto_198687 ) ( not ( = ?auto_198686 ?auto_198687 ) ) ( not ( = ?auto_198686 ?auto_198688 ) ) ( not ( = ?auto_198686 ?auto_198689 ) ) ( not ( = ?auto_198686 ?auto_198690 ) ) ( not ( = ?auto_198686 ?auto_198691 ) ) ( not ( = ?auto_198686 ?auto_198692 ) ) ( not ( = ?auto_198686 ?auto_198693 ) ) ( not ( = ?auto_198686 ?auto_198694 ) ) ( not ( = ?auto_198686 ?auto_198695 ) ) ( not ( = ?auto_198686 ?auto_198696 ) ) ( not ( = ?auto_198687 ?auto_198688 ) ) ( not ( = ?auto_198687 ?auto_198689 ) ) ( not ( = ?auto_198687 ?auto_198690 ) ) ( not ( = ?auto_198687 ?auto_198691 ) ) ( not ( = ?auto_198687 ?auto_198692 ) ) ( not ( = ?auto_198687 ?auto_198693 ) ) ( not ( = ?auto_198687 ?auto_198694 ) ) ( not ( = ?auto_198687 ?auto_198695 ) ) ( not ( = ?auto_198687 ?auto_198696 ) ) ( not ( = ?auto_198688 ?auto_198689 ) ) ( not ( = ?auto_198688 ?auto_198690 ) ) ( not ( = ?auto_198688 ?auto_198691 ) ) ( not ( = ?auto_198688 ?auto_198692 ) ) ( not ( = ?auto_198688 ?auto_198693 ) ) ( not ( = ?auto_198688 ?auto_198694 ) ) ( not ( = ?auto_198688 ?auto_198695 ) ) ( not ( = ?auto_198688 ?auto_198696 ) ) ( not ( = ?auto_198689 ?auto_198690 ) ) ( not ( = ?auto_198689 ?auto_198691 ) ) ( not ( = ?auto_198689 ?auto_198692 ) ) ( not ( = ?auto_198689 ?auto_198693 ) ) ( not ( = ?auto_198689 ?auto_198694 ) ) ( not ( = ?auto_198689 ?auto_198695 ) ) ( not ( = ?auto_198689 ?auto_198696 ) ) ( not ( = ?auto_198690 ?auto_198691 ) ) ( not ( = ?auto_198690 ?auto_198692 ) ) ( not ( = ?auto_198690 ?auto_198693 ) ) ( not ( = ?auto_198690 ?auto_198694 ) ) ( not ( = ?auto_198690 ?auto_198695 ) ) ( not ( = ?auto_198690 ?auto_198696 ) ) ( not ( = ?auto_198691 ?auto_198692 ) ) ( not ( = ?auto_198691 ?auto_198693 ) ) ( not ( = ?auto_198691 ?auto_198694 ) ) ( not ( = ?auto_198691 ?auto_198695 ) ) ( not ( = ?auto_198691 ?auto_198696 ) ) ( not ( = ?auto_198692 ?auto_198693 ) ) ( not ( = ?auto_198692 ?auto_198694 ) ) ( not ( = ?auto_198692 ?auto_198695 ) ) ( not ( = ?auto_198692 ?auto_198696 ) ) ( not ( = ?auto_198693 ?auto_198694 ) ) ( not ( = ?auto_198693 ?auto_198695 ) ) ( not ( = ?auto_198693 ?auto_198696 ) ) ( not ( = ?auto_198694 ?auto_198695 ) ) ( not ( = ?auto_198694 ?auto_198696 ) ) ( not ( = ?auto_198695 ?auto_198696 ) ) ( ON ?auto_198694 ?auto_198695 ) ( ON ?auto_198693 ?auto_198694 ) ( ON ?auto_198692 ?auto_198693 ) ( ON ?auto_198691 ?auto_198692 ) ( ON ?auto_198690 ?auto_198691 ) ( CLEAR ?auto_198688 ) ( ON ?auto_198689 ?auto_198690 ) ( CLEAR ?auto_198689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_198686 ?auto_198687 ?auto_198688 ?auto_198689 )
      ( MAKE-10PILE ?auto_198686 ?auto_198687 ?auto_198688 ?auto_198689 ?auto_198690 ?auto_198691 ?auto_198692 ?auto_198693 ?auto_198694 ?auto_198695 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_198707 - BLOCK
      ?auto_198708 - BLOCK
      ?auto_198709 - BLOCK
      ?auto_198710 - BLOCK
      ?auto_198711 - BLOCK
      ?auto_198712 - BLOCK
      ?auto_198713 - BLOCK
      ?auto_198714 - BLOCK
      ?auto_198715 - BLOCK
      ?auto_198716 - BLOCK
    )
    :vars
    (
      ?auto_198717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198716 ?auto_198717 ) ( ON-TABLE ?auto_198707 ) ( ON ?auto_198708 ?auto_198707 ) ( not ( = ?auto_198707 ?auto_198708 ) ) ( not ( = ?auto_198707 ?auto_198709 ) ) ( not ( = ?auto_198707 ?auto_198710 ) ) ( not ( = ?auto_198707 ?auto_198711 ) ) ( not ( = ?auto_198707 ?auto_198712 ) ) ( not ( = ?auto_198707 ?auto_198713 ) ) ( not ( = ?auto_198707 ?auto_198714 ) ) ( not ( = ?auto_198707 ?auto_198715 ) ) ( not ( = ?auto_198707 ?auto_198716 ) ) ( not ( = ?auto_198707 ?auto_198717 ) ) ( not ( = ?auto_198708 ?auto_198709 ) ) ( not ( = ?auto_198708 ?auto_198710 ) ) ( not ( = ?auto_198708 ?auto_198711 ) ) ( not ( = ?auto_198708 ?auto_198712 ) ) ( not ( = ?auto_198708 ?auto_198713 ) ) ( not ( = ?auto_198708 ?auto_198714 ) ) ( not ( = ?auto_198708 ?auto_198715 ) ) ( not ( = ?auto_198708 ?auto_198716 ) ) ( not ( = ?auto_198708 ?auto_198717 ) ) ( not ( = ?auto_198709 ?auto_198710 ) ) ( not ( = ?auto_198709 ?auto_198711 ) ) ( not ( = ?auto_198709 ?auto_198712 ) ) ( not ( = ?auto_198709 ?auto_198713 ) ) ( not ( = ?auto_198709 ?auto_198714 ) ) ( not ( = ?auto_198709 ?auto_198715 ) ) ( not ( = ?auto_198709 ?auto_198716 ) ) ( not ( = ?auto_198709 ?auto_198717 ) ) ( not ( = ?auto_198710 ?auto_198711 ) ) ( not ( = ?auto_198710 ?auto_198712 ) ) ( not ( = ?auto_198710 ?auto_198713 ) ) ( not ( = ?auto_198710 ?auto_198714 ) ) ( not ( = ?auto_198710 ?auto_198715 ) ) ( not ( = ?auto_198710 ?auto_198716 ) ) ( not ( = ?auto_198710 ?auto_198717 ) ) ( not ( = ?auto_198711 ?auto_198712 ) ) ( not ( = ?auto_198711 ?auto_198713 ) ) ( not ( = ?auto_198711 ?auto_198714 ) ) ( not ( = ?auto_198711 ?auto_198715 ) ) ( not ( = ?auto_198711 ?auto_198716 ) ) ( not ( = ?auto_198711 ?auto_198717 ) ) ( not ( = ?auto_198712 ?auto_198713 ) ) ( not ( = ?auto_198712 ?auto_198714 ) ) ( not ( = ?auto_198712 ?auto_198715 ) ) ( not ( = ?auto_198712 ?auto_198716 ) ) ( not ( = ?auto_198712 ?auto_198717 ) ) ( not ( = ?auto_198713 ?auto_198714 ) ) ( not ( = ?auto_198713 ?auto_198715 ) ) ( not ( = ?auto_198713 ?auto_198716 ) ) ( not ( = ?auto_198713 ?auto_198717 ) ) ( not ( = ?auto_198714 ?auto_198715 ) ) ( not ( = ?auto_198714 ?auto_198716 ) ) ( not ( = ?auto_198714 ?auto_198717 ) ) ( not ( = ?auto_198715 ?auto_198716 ) ) ( not ( = ?auto_198715 ?auto_198717 ) ) ( not ( = ?auto_198716 ?auto_198717 ) ) ( ON ?auto_198715 ?auto_198716 ) ( ON ?auto_198714 ?auto_198715 ) ( ON ?auto_198713 ?auto_198714 ) ( ON ?auto_198712 ?auto_198713 ) ( ON ?auto_198711 ?auto_198712 ) ( ON ?auto_198710 ?auto_198711 ) ( CLEAR ?auto_198708 ) ( ON ?auto_198709 ?auto_198710 ) ( CLEAR ?auto_198709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_198707 ?auto_198708 ?auto_198709 )
      ( MAKE-10PILE ?auto_198707 ?auto_198708 ?auto_198709 ?auto_198710 ?auto_198711 ?auto_198712 ?auto_198713 ?auto_198714 ?auto_198715 ?auto_198716 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_198728 - BLOCK
      ?auto_198729 - BLOCK
      ?auto_198730 - BLOCK
      ?auto_198731 - BLOCK
      ?auto_198732 - BLOCK
      ?auto_198733 - BLOCK
      ?auto_198734 - BLOCK
      ?auto_198735 - BLOCK
      ?auto_198736 - BLOCK
      ?auto_198737 - BLOCK
    )
    :vars
    (
      ?auto_198738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198737 ?auto_198738 ) ( ON-TABLE ?auto_198728 ) ( ON ?auto_198729 ?auto_198728 ) ( not ( = ?auto_198728 ?auto_198729 ) ) ( not ( = ?auto_198728 ?auto_198730 ) ) ( not ( = ?auto_198728 ?auto_198731 ) ) ( not ( = ?auto_198728 ?auto_198732 ) ) ( not ( = ?auto_198728 ?auto_198733 ) ) ( not ( = ?auto_198728 ?auto_198734 ) ) ( not ( = ?auto_198728 ?auto_198735 ) ) ( not ( = ?auto_198728 ?auto_198736 ) ) ( not ( = ?auto_198728 ?auto_198737 ) ) ( not ( = ?auto_198728 ?auto_198738 ) ) ( not ( = ?auto_198729 ?auto_198730 ) ) ( not ( = ?auto_198729 ?auto_198731 ) ) ( not ( = ?auto_198729 ?auto_198732 ) ) ( not ( = ?auto_198729 ?auto_198733 ) ) ( not ( = ?auto_198729 ?auto_198734 ) ) ( not ( = ?auto_198729 ?auto_198735 ) ) ( not ( = ?auto_198729 ?auto_198736 ) ) ( not ( = ?auto_198729 ?auto_198737 ) ) ( not ( = ?auto_198729 ?auto_198738 ) ) ( not ( = ?auto_198730 ?auto_198731 ) ) ( not ( = ?auto_198730 ?auto_198732 ) ) ( not ( = ?auto_198730 ?auto_198733 ) ) ( not ( = ?auto_198730 ?auto_198734 ) ) ( not ( = ?auto_198730 ?auto_198735 ) ) ( not ( = ?auto_198730 ?auto_198736 ) ) ( not ( = ?auto_198730 ?auto_198737 ) ) ( not ( = ?auto_198730 ?auto_198738 ) ) ( not ( = ?auto_198731 ?auto_198732 ) ) ( not ( = ?auto_198731 ?auto_198733 ) ) ( not ( = ?auto_198731 ?auto_198734 ) ) ( not ( = ?auto_198731 ?auto_198735 ) ) ( not ( = ?auto_198731 ?auto_198736 ) ) ( not ( = ?auto_198731 ?auto_198737 ) ) ( not ( = ?auto_198731 ?auto_198738 ) ) ( not ( = ?auto_198732 ?auto_198733 ) ) ( not ( = ?auto_198732 ?auto_198734 ) ) ( not ( = ?auto_198732 ?auto_198735 ) ) ( not ( = ?auto_198732 ?auto_198736 ) ) ( not ( = ?auto_198732 ?auto_198737 ) ) ( not ( = ?auto_198732 ?auto_198738 ) ) ( not ( = ?auto_198733 ?auto_198734 ) ) ( not ( = ?auto_198733 ?auto_198735 ) ) ( not ( = ?auto_198733 ?auto_198736 ) ) ( not ( = ?auto_198733 ?auto_198737 ) ) ( not ( = ?auto_198733 ?auto_198738 ) ) ( not ( = ?auto_198734 ?auto_198735 ) ) ( not ( = ?auto_198734 ?auto_198736 ) ) ( not ( = ?auto_198734 ?auto_198737 ) ) ( not ( = ?auto_198734 ?auto_198738 ) ) ( not ( = ?auto_198735 ?auto_198736 ) ) ( not ( = ?auto_198735 ?auto_198737 ) ) ( not ( = ?auto_198735 ?auto_198738 ) ) ( not ( = ?auto_198736 ?auto_198737 ) ) ( not ( = ?auto_198736 ?auto_198738 ) ) ( not ( = ?auto_198737 ?auto_198738 ) ) ( ON ?auto_198736 ?auto_198737 ) ( ON ?auto_198735 ?auto_198736 ) ( ON ?auto_198734 ?auto_198735 ) ( ON ?auto_198733 ?auto_198734 ) ( ON ?auto_198732 ?auto_198733 ) ( ON ?auto_198731 ?auto_198732 ) ( CLEAR ?auto_198729 ) ( ON ?auto_198730 ?auto_198731 ) ( CLEAR ?auto_198730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_198728 ?auto_198729 ?auto_198730 )
      ( MAKE-10PILE ?auto_198728 ?auto_198729 ?auto_198730 ?auto_198731 ?auto_198732 ?auto_198733 ?auto_198734 ?auto_198735 ?auto_198736 ?auto_198737 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_198749 - BLOCK
      ?auto_198750 - BLOCK
      ?auto_198751 - BLOCK
      ?auto_198752 - BLOCK
      ?auto_198753 - BLOCK
      ?auto_198754 - BLOCK
      ?auto_198755 - BLOCK
      ?auto_198756 - BLOCK
      ?auto_198757 - BLOCK
      ?auto_198758 - BLOCK
    )
    :vars
    (
      ?auto_198759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198758 ?auto_198759 ) ( ON-TABLE ?auto_198749 ) ( not ( = ?auto_198749 ?auto_198750 ) ) ( not ( = ?auto_198749 ?auto_198751 ) ) ( not ( = ?auto_198749 ?auto_198752 ) ) ( not ( = ?auto_198749 ?auto_198753 ) ) ( not ( = ?auto_198749 ?auto_198754 ) ) ( not ( = ?auto_198749 ?auto_198755 ) ) ( not ( = ?auto_198749 ?auto_198756 ) ) ( not ( = ?auto_198749 ?auto_198757 ) ) ( not ( = ?auto_198749 ?auto_198758 ) ) ( not ( = ?auto_198749 ?auto_198759 ) ) ( not ( = ?auto_198750 ?auto_198751 ) ) ( not ( = ?auto_198750 ?auto_198752 ) ) ( not ( = ?auto_198750 ?auto_198753 ) ) ( not ( = ?auto_198750 ?auto_198754 ) ) ( not ( = ?auto_198750 ?auto_198755 ) ) ( not ( = ?auto_198750 ?auto_198756 ) ) ( not ( = ?auto_198750 ?auto_198757 ) ) ( not ( = ?auto_198750 ?auto_198758 ) ) ( not ( = ?auto_198750 ?auto_198759 ) ) ( not ( = ?auto_198751 ?auto_198752 ) ) ( not ( = ?auto_198751 ?auto_198753 ) ) ( not ( = ?auto_198751 ?auto_198754 ) ) ( not ( = ?auto_198751 ?auto_198755 ) ) ( not ( = ?auto_198751 ?auto_198756 ) ) ( not ( = ?auto_198751 ?auto_198757 ) ) ( not ( = ?auto_198751 ?auto_198758 ) ) ( not ( = ?auto_198751 ?auto_198759 ) ) ( not ( = ?auto_198752 ?auto_198753 ) ) ( not ( = ?auto_198752 ?auto_198754 ) ) ( not ( = ?auto_198752 ?auto_198755 ) ) ( not ( = ?auto_198752 ?auto_198756 ) ) ( not ( = ?auto_198752 ?auto_198757 ) ) ( not ( = ?auto_198752 ?auto_198758 ) ) ( not ( = ?auto_198752 ?auto_198759 ) ) ( not ( = ?auto_198753 ?auto_198754 ) ) ( not ( = ?auto_198753 ?auto_198755 ) ) ( not ( = ?auto_198753 ?auto_198756 ) ) ( not ( = ?auto_198753 ?auto_198757 ) ) ( not ( = ?auto_198753 ?auto_198758 ) ) ( not ( = ?auto_198753 ?auto_198759 ) ) ( not ( = ?auto_198754 ?auto_198755 ) ) ( not ( = ?auto_198754 ?auto_198756 ) ) ( not ( = ?auto_198754 ?auto_198757 ) ) ( not ( = ?auto_198754 ?auto_198758 ) ) ( not ( = ?auto_198754 ?auto_198759 ) ) ( not ( = ?auto_198755 ?auto_198756 ) ) ( not ( = ?auto_198755 ?auto_198757 ) ) ( not ( = ?auto_198755 ?auto_198758 ) ) ( not ( = ?auto_198755 ?auto_198759 ) ) ( not ( = ?auto_198756 ?auto_198757 ) ) ( not ( = ?auto_198756 ?auto_198758 ) ) ( not ( = ?auto_198756 ?auto_198759 ) ) ( not ( = ?auto_198757 ?auto_198758 ) ) ( not ( = ?auto_198757 ?auto_198759 ) ) ( not ( = ?auto_198758 ?auto_198759 ) ) ( ON ?auto_198757 ?auto_198758 ) ( ON ?auto_198756 ?auto_198757 ) ( ON ?auto_198755 ?auto_198756 ) ( ON ?auto_198754 ?auto_198755 ) ( ON ?auto_198753 ?auto_198754 ) ( ON ?auto_198752 ?auto_198753 ) ( ON ?auto_198751 ?auto_198752 ) ( CLEAR ?auto_198749 ) ( ON ?auto_198750 ?auto_198751 ) ( CLEAR ?auto_198750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_198749 ?auto_198750 )
      ( MAKE-10PILE ?auto_198749 ?auto_198750 ?auto_198751 ?auto_198752 ?auto_198753 ?auto_198754 ?auto_198755 ?auto_198756 ?auto_198757 ?auto_198758 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_198770 - BLOCK
      ?auto_198771 - BLOCK
      ?auto_198772 - BLOCK
      ?auto_198773 - BLOCK
      ?auto_198774 - BLOCK
      ?auto_198775 - BLOCK
      ?auto_198776 - BLOCK
      ?auto_198777 - BLOCK
      ?auto_198778 - BLOCK
      ?auto_198779 - BLOCK
    )
    :vars
    (
      ?auto_198780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198779 ?auto_198780 ) ( ON-TABLE ?auto_198770 ) ( not ( = ?auto_198770 ?auto_198771 ) ) ( not ( = ?auto_198770 ?auto_198772 ) ) ( not ( = ?auto_198770 ?auto_198773 ) ) ( not ( = ?auto_198770 ?auto_198774 ) ) ( not ( = ?auto_198770 ?auto_198775 ) ) ( not ( = ?auto_198770 ?auto_198776 ) ) ( not ( = ?auto_198770 ?auto_198777 ) ) ( not ( = ?auto_198770 ?auto_198778 ) ) ( not ( = ?auto_198770 ?auto_198779 ) ) ( not ( = ?auto_198770 ?auto_198780 ) ) ( not ( = ?auto_198771 ?auto_198772 ) ) ( not ( = ?auto_198771 ?auto_198773 ) ) ( not ( = ?auto_198771 ?auto_198774 ) ) ( not ( = ?auto_198771 ?auto_198775 ) ) ( not ( = ?auto_198771 ?auto_198776 ) ) ( not ( = ?auto_198771 ?auto_198777 ) ) ( not ( = ?auto_198771 ?auto_198778 ) ) ( not ( = ?auto_198771 ?auto_198779 ) ) ( not ( = ?auto_198771 ?auto_198780 ) ) ( not ( = ?auto_198772 ?auto_198773 ) ) ( not ( = ?auto_198772 ?auto_198774 ) ) ( not ( = ?auto_198772 ?auto_198775 ) ) ( not ( = ?auto_198772 ?auto_198776 ) ) ( not ( = ?auto_198772 ?auto_198777 ) ) ( not ( = ?auto_198772 ?auto_198778 ) ) ( not ( = ?auto_198772 ?auto_198779 ) ) ( not ( = ?auto_198772 ?auto_198780 ) ) ( not ( = ?auto_198773 ?auto_198774 ) ) ( not ( = ?auto_198773 ?auto_198775 ) ) ( not ( = ?auto_198773 ?auto_198776 ) ) ( not ( = ?auto_198773 ?auto_198777 ) ) ( not ( = ?auto_198773 ?auto_198778 ) ) ( not ( = ?auto_198773 ?auto_198779 ) ) ( not ( = ?auto_198773 ?auto_198780 ) ) ( not ( = ?auto_198774 ?auto_198775 ) ) ( not ( = ?auto_198774 ?auto_198776 ) ) ( not ( = ?auto_198774 ?auto_198777 ) ) ( not ( = ?auto_198774 ?auto_198778 ) ) ( not ( = ?auto_198774 ?auto_198779 ) ) ( not ( = ?auto_198774 ?auto_198780 ) ) ( not ( = ?auto_198775 ?auto_198776 ) ) ( not ( = ?auto_198775 ?auto_198777 ) ) ( not ( = ?auto_198775 ?auto_198778 ) ) ( not ( = ?auto_198775 ?auto_198779 ) ) ( not ( = ?auto_198775 ?auto_198780 ) ) ( not ( = ?auto_198776 ?auto_198777 ) ) ( not ( = ?auto_198776 ?auto_198778 ) ) ( not ( = ?auto_198776 ?auto_198779 ) ) ( not ( = ?auto_198776 ?auto_198780 ) ) ( not ( = ?auto_198777 ?auto_198778 ) ) ( not ( = ?auto_198777 ?auto_198779 ) ) ( not ( = ?auto_198777 ?auto_198780 ) ) ( not ( = ?auto_198778 ?auto_198779 ) ) ( not ( = ?auto_198778 ?auto_198780 ) ) ( not ( = ?auto_198779 ?auto_198780 ) ) ( ON ?auto_198778 ?auto_198779 ) ( ON ?auto_198777 ?auto_198778 ) ( ON ?auto_198776 ?auto_198777 ) ( ON ?auto_198775 ?auto_198776 ) ( ON ?auto_198774 ?auto_198775 ) ( ON ?auto_198773 ?auto_198774 ) ( ON ?auto_198772 ?auto_198773 ) ( CLEAR ?auto_198770 ) ( ON ?auto_198771 ?auto_198772 ) ( CLEAR ?auto_198771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_198770 ?auto_198771 )
      ( MAKE-10PILE ?auto_198770 ?auto_198771 ?auto_198772 ?auto_198773 ?auto_198774 ?auto_198775 ?auto_198776 ?auto_198777 ?auto_198778 ?auto_198779 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_198791 - BLOCK
      ?auto_198792 - BLOCK
      ?auto_198793 - BLOCK
      ?auto_198794 - BLOCK
      ?auto_198795 - BLOCK
      ?auto_198796 - BLOCK
      ?auto_198797 - BLOCK
      ?auto_198798 - BLOCK
      ?auto_198799 - BLOCK
      ?auto_198800 - BLOCK
    )
    :vars
    (
      ?auto_198801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198800 ?auto_198801 ) ( not ( = ?auto_198791 ?auto_198792 ) ) ( not ( = ?auto_198791 ?auto_198793 ) ) ( not ( = ?auto_198791 ?auto_198794 ) ) ( not ( = ?auto_198791 ?auto_198795 ) ) ( not ( = ?auto_198791 ?auto_198796 ) ) ( not ( = ?auto_198791 ?auto_198797 ) ) ( not ( = ?auto_198791 ?auto_198798 ) ) ( not ( = ?auto_198791 ?auto_198799 ) ) ( not ( = ?auto_198791 ?auto_198800 ) ) ( not ( = ?auto_198791 ?auto_198801 ) ) ( not ( = ?auto_198792 ?auto_198793 ) ) ( not ( = ?auto_198792 ?auto_198794 ) ) ( not ( = ?auto_198792 ?auto_198795 ) ) ( not ( = ?auto_198792 ?auto_198796 ) ) ( not ( = ?auto_198792 ?auto_198797 ) ) ( not ( = ?auto_198792 ?auto_198798 ) ) ( not ( = ?auto_198792 ?auto_198799 ) ) ( not ( = ?auto_198792 ?auto_198800 ) ) ( not ( = ?auto_198792 ?auto_198801 ) ) ( not ( = ?auto_198793 ?auto_198794 ) ) ( not ( = ?auto_198793 ?auto_198795 ) ) ( not ( = ?auto_198793 ?auto_198796 ) ) ( not ( = ?auto_198793 ?auto_198797 ) ) ( not ( = ?auto_198793 ?auto_198798 ) ) ( not ( = ?auto_198793 ?auto_198799 ) ) ( not ( = ?auto_198793 ?auto_198800 ) ) ( not ( = ?auto_198793 ?auto_198801 ) ) ( not ( = ?auto_198794 ?auto_198795 ) ) ( not ( = ?auto_198794 ?auto_198796 ) ) ( not ( = ?auto_198794 ?auto_198797 ) ) ( not ( = ?auto_198794 ?auto_198798 ) ) ( not ( = ?auto_198794 ?auto_198799 ) ) ( not ( = ?auto_198794 ?auto_198800 ) ) ( not ( = ?auto_198794 ?auto_198801 ) ) ( not ( = ?auto_198795 ?auto_198796 ) ) ( not ( = ?auto_198795 ?auto_198797 ) ) ( not ( = ?auto_198795 ?auto_198798 ) ) ( not ( = ?auto_198795 ?auto_198799 ) ) ( not ( = ?auto_198795 ?auto_198800 ) ) ( not ( = ?auto_198795 ?auto_198801 ) ) ( not ( = ?auto_198796 ?auto_198797 ) ) ( not ( = ?auto_198796 ?auto_198798 ) ) ( not ( = ?auto_198796 ?auto_198799 ) ) ( not ( = ?auto_198796 ?auto_198800 ) ) ( not ( = ?auto_198796 ?auto_198801 ) ) ( not ( = ?auto_198797 ?auto_198798 ) ) ( not ( = ?auto_198797 ?auto_198799 ) ) ( not ( = ?auto_198797 ?auto_198800 ) ) ( not ( = ?auto_198797 ?auto_198801 ) ) ( not ( = ?auto_198798 ?auto_198799 ) ) ( not ( = ?auto_198798 ?auto_198800 ) ) ( not ( = ?auto_198798 ?auto_198801 ) ) ( not ( = ?auto_198799 ?auto_198800 ) ) ( not ( = ?auto_198799 ?auto_198801 ) ) ( not ( = ?auto_198800 ?auto_198801 ) ) ( ON ?auto_198799 ?auto_198800 ) ( ON ?auto_198798 ?auto_198799 ) ( ON ?auto_198797 ?auto_198798 ) ( ON ?auto_198796 ?auto_198797 ) ( ON ?auto_198795 ?auto_198796 ) ( ON ?auto_198794 ?auto_198795 ) ( ON ?auto_198793 ?auto_198794 ) ( ON ?auto_198792 ?auto_198793 ) ( ON ?auto_198791 ?auto_198792 ) ( CLEAR ?auto_198791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_198791 )
      ( MAKE-10PILE ?auto_198791 ?auto_198792 ?auto_198793 ?auto_198794 ?auto_198795 ?auto_198796 ?auto_198797 ?auto_198798 ?auto_198799 ?auto_198800 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_198812 - BLOCK
      ?auto_198813 - BLOCK
      ?auto_198814 - BLOCK
      ?auto_198815 - BLOCK
      ?auto_198816 - BLOCK
      ?auto_198817 - BLOCK
      ?auto_198818 - BLOCK
      ?auto_198819 - BLOCK
      ?auto_198820 - BLOCK
      ?auto_198821 - BLOCK
    )
    :vars
    (
      ?auto_198822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198821 ?auto_198822 ) ( not ( = ?auto_198812 ?auto_198813 ) ) ( not ( = ?auto_198812 ?auto_198814 ) ) ( not ( = ?auto_198812 ?auto_198815 ) ) ( not ( = ?auto_198812 ?auto_198816 ) ) ( not ( = ?auto_198812 ?auto_198817 ) ) ( not ( = ?auto_198812 ?auto_198818 ) ) ( not ( = ?auto_198812 ?auto_198819 ) ) ( not ( = ?auto_198812 ?auto_198820 ) ) ( not ( = ?auto_198812 ?auto_198821 ) ) ( not ( = ?auto_198812 ?auto_198822 ) ) ( not ( = ?auto_198813 ?auto_198814 ) ) ( not ( = ?auto_198813 ?auto_198815 ) ) ( not ( = ?auto_198813 ?auto_198816 ) ) ( not ( = ?auto_198813 ?auto_198817 ) ) ( not ( = ?auto_198813 ?auto_198818 ) ) ( not ( = ?auto_198813 ?auto_198819 ) ) ( not ( = ?auto_198813 ?auto_198820 ) ) ( not ( = ?auto_198813 ?auto_198821 ) ) ( not ( = ?auto_198813 ?auto_198822 ) ) ( not ( = ?auto_198814 ?auto_198815 ) ) ( not ( = ?auto_198814 ?auto_198816 ) ) ( not ( = ?auto_198814 ?auto_198817 ) ) ( not ( = ?auto_198814 ?auto_198818 ) ) ( not ( = ?auto_198814 ?auto_198819 ) ) ( not ( = ?auto_198814 ?auto_198820 ) ) ( not ( = ?auto_198814 ?auto_198821 ) ) ( not ( = ?auto_198814 ?auto_198822 ) ) ( not ( = ?auto_198815 ?auto_198816 ) ) ( not ( = ?auto_198815 ?auto_198817 ) ) ( not ( = ?auto_198815 ?auto_198818 ) ) ( not ( = ?auto_198815 ?auto_198819 ) ) ( not ( = ?auto_198815 ?auto_198820 ) ) ( not ( = ?auto_198815 ?auto_198821 ) ) ( not ( = ?auto_198815 ?auto_198822 ) ) ( not ( = ?auto_198816 ?auto_198817 ) ) ( not ( = ?auto_198816 ?auto_198818 ) ) ( not ( = ?auto_198816 ?auto_198819 ) ) ( not ( = ?auto_198816 ?auto_198820 ) ) ( not ( = ?auto_198816 ?auto_198821 ) ) ( not ( = ?auto_198816 ?auto_198822 ) ) ( not ( = ?auto_198817 ?auto_198818 ) ) ( not ( = ?auto_198817 ?auto_198819 ) ) ( not ( = ?auto_198817 ?auto_198820 ) ) ( not ( = ?auto_198817 ?auto_198821 ) ) ( not ( = ?auto_198817 ?auto_198822 ) ) ( not ( = ?auto_198818 ?auto_198819 ) ) ( not ( = ?auto_198818 ?auto_198820 ) ) ( not ( = ?auto_198818 ?auto_198821 ) ) ( not ( = ?auto_198818 ?auto_198822 ) ) ( not ( = ?auto_198819 ?auto_198820 ) ) ( not ( = ?auto_198819 ?auto_198821 ) ) ( not ( = ?auto_198819 ?auto_198822 ) ) ( not ( = ?auto_198820 ?auto_198821 ) ) ( not ( = ?auto_198820 ?auto_198822 ) ) ( not ( = ?auto_198821 ?auto_198822 ) ) ( ON ?auto_198820 ?auto_198821 ) ( ON ?auto_198819 ?auto_198820 ) ( ON ?auto_198818 ?auto_198819 ) ( ON ?auto_198817 ?auto_198818 ) ( ON ?auto_198816 ?auto_198817 ) ( ON ?auto_198815 ?auto_198816 ) ( ON ?auto_198814 ?auto_198815 ) ( ON ?auto_198813 ?auto_198814 ) ( ON ?auto_198812 ?auto_198813 ) ( CLEAR ?auto_198812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_198812 )
      ( MAKE-10PILE ?auto_198812 ?auto_198813 ?auto_198814 ?auto_198815 ?auto_198816 ?auto_198817 ?auto_198818 ?auto_198819 ?auto_198820 ?auto_198821 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_198834 - BLOCK
      ?auto_198835 - BLOCK
      ?auto_198836 - BLOCK
      ?auto_198837 - BLOCK
      ?auto_198838 - BLOCK
      ?auto_198839 - BLOCK
      ?auto_198840 - BLOCK
      ?auto_198841 - BLOCK
      ?auto_198842 - BLOCK
      ?auto_198843 - BLOCK
      ?auto_198844 - BLOCK
    )
    :vars
    (
      ?auto_198845 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_198843 ) ( ON ?auto_198844 ?auto_198845 ) ( CLEAR ?auto_198844 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_198834 ) ( ON ?auto_198835 ?auto_198834 ) ( ON ?auto_198836 ?auto_198835 ) ( ON ?auto_198837 ?auto_198836 ) ( ON ?auto_198838 ?auto_198837 ) ( ON ?auto_198839 ?auto_198838 ) ( ON ?auto_198840 ?auto_198839 ) ( ON ?auto_198841 ?auto_198840 ) ( ON ?auto_198842 ?auto_198841 ) ( ON ?auto_198843 ?auto_198842 ) ( not ( = ?auto_198834 ?auto_198835 ) ) ( not ( = ?auto_198834 ?auto_198836 ) ) ( not ( = ?auto_198834 ?auto_198837 ) ) ( not ( = ?auto_198834 ?auto_198838 ) ) ( not ( = ?auto_198834 ?auto_198839 ) ) ( not ( = ?auto_198834 ?auto_198840 ) ) ( not ( = ?auto_198834 ?auto_198841 ) ) ( not ( = ?auto_198834 ?auto_198842 ) ) ( not ( = ?auto_198834 ?auto_198843 ) ) ( not ( = ?auto_198834 ?auto_198844 ) ) ( not ( = ?auto_198834 ?auto_198845 ) ) ( not ( = ?auto_198835 ?auto_198836 ) ) ( not ( = ?auto_198835 ?auto_198837 ) ) ( not ( = ?auto_198835 ?auto_198838 ) ) ( not ( = ?auto_198835 ?auto_198839 ) ) ( not ( = ?auto_198835 ?auto_198840 ) ) ( not ( = ?auto_198835 ?auto_198841 ) ) ( not ( = ?auto_198835 ?auto_198842 ) ) ( not ( = ?auto_198835 ?auto_198843 ) ) ( not ( = ?auto_198835 ?auto_198844 ) ) ( not ( = ?auto_198835 ?auto_198845 ) ) ( not ( = ?auto_198836 ?auto_198837 ) ) ( not ( = ?auto_198836 ?auto_198838 ) ) ( not ( = ?auto_198836 ?auto_198839 ) ) ( not ( = ?auto_198836 ?auto_198840 ) ) ( not ( = ?auto_198836 ?auto_198841 ) ) ( not ( = ?auto_198836 ?auto_198842 ) ) ( not ( = ?auto_198836 ?auto_198843 ) ) ( not ( = ?auto_198836 ?auto_198844 ) ) ( not ( = ?auto_198836 ?auto_198845 ) ) ( not ( = ?auto_198837 ?auto_198838 ) ) ( not ( = ?auto_198837 ?auto_198839 ) ) ( not ( = ?auto_198837 ?auto_198840 ) ) ( not ( = ?auto_198837 ?auto_198841 ) ) ( not ( = ?auto_198837 ?auto_198842 ) ) ( not ( = ?auto_198837 ?auto_198843 ) ) ( not ( = ?auto_198837 ?auto_198844 ) ) ( not ( = ?auto_198837 ?auto_198845 ) ) ( not ( = ?auto_198838 ?auto_198839 ) ) ( not ( = ?auto_198838 ?auto_198840 ) ) ( not ( = ?auto_198838 ?auto_198841 ) ) ( not ( = ?auto_198838 ?auto_198842 ) ) ( not ( = ?auto_198838 ?auto_198843 ) ) ( not ( = ?auto_198838 ?auto_198844 ) ) ( not ( = ?auto_198838 ?auto_198845 ) ) ( not ( = ?auto_198839 ?auto_198840 ) ) ( not ( = ?auto_198839 ?auto_198841 ) ) ( not ( = ?auto_198839 ?auto_198842 ) ) ( not ( = ?auto_198839 ?auto_198843 ) ) ( not ( = ?auto_198839 ?auto_198844 ) ) ( not ( = ?auto_198839 ?auto_198845 ) ) ( not ( = ?auto_198840 ?auto_198841 ) ) ( not ( = ?auto_198840 ?auto_198842 ) ) ( not ( = ?auto_198840 ?auto_198843 ) ) ( not ( = ?auto_198840 ?auto_198844 ) ) ( not ( = ?auto_198840 ?auto_198845 ) ) ( not ( = ?auto_198841 ?auto_198842 ) ) ( not ( = ?auto_198841 ?auto_198843 ) ) ( not ( = ?auto_198841 ?auto_198844 ) ) ( not ( = ?auto_198841 ?auto_198845 ) ) ( not ( = ?auto_198842 ?auto_198843 ) ) ( not ( = ?auto_198842 ?auto_198844 ) ) ( not ( = ?auto_198842 ?auto_198845 ) ) ( not ( = ?auto_198843 ?auto_198844 ) ) ( not ( = ?auto_198843 ?auto_198845 ) ) ( not ( = ?auto_198844 ?auto_198845 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_198844 ?auto_198845 )
      ( !STACK ?auto_198844 ?auto_198843 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_198857 - BLOCK
      ?auto_198858 - BLOCK
      ?auto_198859 - BLOCK
      ?auto_198860 - BLOCK
      ?auto_198861 - BLOCK
      ?auto_198862 - BLOCK
      ?auto_198863 - BLOCK
      ?auto_198864 - BLOCK
      ?auto_198865 - BLOCK
      ?auto_198866 - BLOCK
      ?auto_198867 - BLOCK
    )
    :vars
    (
      ?auto_198868 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_198866 ) ( ON ?auto_198867 ?auto_198868 ) ( CLEAR ?auto_198867 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_198857 ) ( ON ?auto_198858 ?auto_198857 ) ( ON ?auto_198859 ?auto_198858 ) ( ON ?auto_198860 ?auto_198859 ) ( ON ?auto_198861 ?auto_198860 ) ( ON ?auto_198862 ?auto_198861 ) ( ON ?auto_198863 ?auto_198862 ) ( ON ?auto_198864 ?auto_198863 ) ( ON ?auto_198865 ?auto_198864 ) ( ON ?auto_198866 ?auto_198865 ) ( not ( = ?auto_198857 ?auto_198858 ) ) ( not ( = ?auto_198857 ?auto_198859 ) ) ( not ( = ?auto_198857 ?auto_198860 ) ) ( not ( = ?auto_198857 ?auto_198861 ) ) ( not ( = ?auto_198857 ?auto_198862 ) ) ( not ( = ?auto_198857 ?auto_198863 ) ) ( not ( = ?auto_198857 ?auto_198864 ) ) ( not ( = ?auto_198857 ?auto_198865 ) ) ( not ( = ?auto_198857 ?auto_198866 ) ) ( not ( = ?auto_198857 ?auto_198867 ) ) ( not ( = ?auto_198857 ?auto_198868 ) ) ( not ( = ?auto_198858 ?auto_198859 ) ) ( not ( = ?auto_198858 ?auto_198860 ) ) ( not ( = ?auto_198858 ?auto_198861 ) ) ( not ( = ?auto_198858 ?auto_198862 ) ) ( not ( = ?auto_198858 ?auto_198863 ) ) ( not ( = ?auto_198858 ?auto_198864 ) ) ( not ( = ?auto_198858 ?auto_198865 ) ) ( not ( = ?auto_198858 ?auto_198866 ) ) ( not ( = ?auto_198858 ?auto_198867 ) ) ( not ( = ?auto_198858 ?auto_198868 ) ) ( not ( = ?auto_198859 ?auto_198860 ) ) ( not ( = ?auto_198859 ?auto_198861 ) ) ( not ( = ?auto_198859 ?auto_198862 ) ) ( not ( = ?auto_198859 ?auto_198863 ) ) ( not ( = ?auto_198859 ?auto_198864 ) ) ( not ( = ?auto_198859 ?auto_198865 ) ) ( not ( = ?auto_198859 ?auto_198866 ) ) ( not ( = ?auto_198859 ?auto_198867 ) ) ( not ( = ?auto_198859 ?auto_198868 ) ) ( not ( = ?auto_198860 ?auto_198861 ) ) ( not ( = ?auto_198860 ?auto_198862 ) ) ( not ( = ?auto_198860 ?auto_198863 ) ) ( not ( = ?auto_198860 ?auto_198864 ) ) ( not ( = ?auto_198860 ?auto_198865 ) ) ( not ( = ?auto_198860 ?auto_198866 ) ) ( not ( = ?auto_198860 ?auto_198867 ) ) ( not ( = ?auto_198860 ?auto_198868 ) ) ( not ( = ?auto_198861 ?auto_198862 ) ) ( not ( = ?auto_198861 ?auto_198863 ) ) ( not ( = ?auto_198861 ?auto_198864 ) ) ( not ( = ?auto_198861 ?auto_198865 ) ) ( not ( = ?auto_198861 ?auto_198866 ) ) ( not ( = ?auto_198861 ?auto_198867 ) ) ( not ( = ?auto_198861 ?auto_198868 ) ) ( not ( = ?auto_198862 ?auto_198863 ) ) ( not ( = ?auto_198862 ?auto_198864 ) ) ( not ( = ?auto_198862 ?auto_198865 ) ) ( not ( = ?auto_198862 ?auto_198866 ) ) ( not ( = ?auto_198862 ?auto_198867 ) ) ( not ( = ?auto_198862 ?auto_198868 ) ) ( not ( = ?auto_198863 ?auto_198864 ) ) ( not ( = ?auto_198863 ?auto_198865 ) ) ( not ( = ?auto_198863 ?auto_198866 ) ) ( not ( = ?auto_198863 ?auto_198867 ) ) ( not ( = ?auto_198863 ?auto_198868 ) ) ( not ( = ?auto_198864 ?auto_198865 ) ) ( not ( = ?auto_198864 ?auto_198866 ) ) ( not ( = ?auto_198864 ?auto_198867 ) ) ( not ( = ?auto_198864 ?auto_198868 ) ) ( not ( = ?auto_198865 ?auto_198866 ) ) ( not ( = ?auto_198865 ?auto_198867 ) ) ( not ( = ?auto_198865 ?auto_198868 ) ) ( not ( = ?auto_198866 ?auto_198867 ) ) ( not ( = ?auto_198866 ?auto_198868 ) ) ( not ( = ?auto_198867 ?auto_198868 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_198867 ?auto_198868 )
      ( !STACK ?auto_198867 ?auto_198866 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_198880 - BLOCK
      ?auto_198881 - BLOCK
      ?auto_198882 - BLOCK
      ?auto_198883 - BLOCK
      ?auto_198884 - BLOCK
      ?auto_198885 - BLOCK
      ?auto_198886 - BLOCK
      ?auto_198887 - BLOCK
      ?auto_198888 - BLOCK
      ?auto_198889 - BLOCK
      ?auto_198890 - BLOCK
    )
    :vars
    (
      ?auto_198891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198890 ?auto_198891 ) ( ON-TABLE ?auto_198880 ) ( ON ?auto_198881 ?auto_198880 ) ( ON ?auto_198882 ?auto_198881 ) ( ON ?auto_198883 ?auto_198882 ) ( ON ?auto_198884 ?auto_198883 ) ( ON ?auto_198885 ?auto_198884 ) ( ON ?auto_198886 ?auto_198885 ) ( ON ?auto_198887 ?auto_198886 ) ( ON ?auto_198888 ?auto_198887 ) ( not ( = ?auto_198880 ?auto_198881 ) ) ( not ( = ?auto_198880 ?auto_198882 ) ) ( not ( = ?auto_198880 ?auto_198883 ) ) ( not ( = ?auto_198880 ?auto_198884 ) ) ( not ( = ?auto_198880 ?auto_198885 ) ) ( not ( = ?auto_198880 ?auto_198886 ) ) ( not ( = ?auto_198880 ?auto_198887 ) ) ( not ( = ?auto_198880 ?auto_198888 ) ) ( not ( = ?auto_198880 ?auto_198889 ) ) ( not ( = ?auto_198880 ?auto_198890 ) ) ( not ( = ?auto_198880 ?auto_198891 ) ) ( not ( = ?auto_198881 ?auto_198882 ) ) ( not ( = ?auto_198881 ?auto_198883 ) ) ( not ( = ?auto_198881 ?auto_198884 ) ) ( not ( = ?auto_198881 ?auto_198885 ) ) ( not ( = ?auto_198881 ?auto_198886 ) ) ( not ( = ?auto_198881 ?auto_198887 ) ) ( not ( = ?auto_198881 ?auto_198888 ) ) ( not ( = ?auto_198881 ?auto_198889 ) ) ( not ( = ?auto_198881 ?auto_198890 ) ) ( not ( = ?auto_198881 ?auto_198891 ) ) ( not ( = ?auto_198882 ?auto_198883 ) ) ( not ( = ?auto_198882 ?auto_198884 ) ) ( not ( = ?auto_198882 ?auto_198885 ) ) ( not ( = ?auto_198882 ?auto_198886 ) ) ( not ( = ?auto_198882 ?auto_198887 ) ) ( not ( = ?auto_198882 ?auto_198888 ) ) ( not ( = ?auto_198882 ?auto_198889 ) ) ( not ( = ?auto_198882 ?auto_198890 ) ) ( not ( = ?auto_198882 ?auto_198891 ) ) ( not ( = ?auto_198883 ?auto_198884 ) ) ( not ( = ?auto_198883 ?auto_198885 ) ) ( not ( = ?auto_198883 ?auto_198886 ) ) ( not ( = ?auto_198883 ?auto_198887 ) ) ( not ( = ?auto_198883 ?auto_198888 ) ) ( not ( = ?auto_198883 ?auto_198889 ) ) ( not ( = ?auto_198883 ?auto_198890 ) ) ( not ( = ?auto_198883 ?auto_198891 ) ) ( not ( = ?auto_198884 ?auto_198885 ) ) ( not ( = ?auto_198884 ?auto_198886 ) ) ( not ( = ?auto_198884 ?auto_198887 ) ) ( not ( = ?auto_198884 ?auto_198888 ) ) ( not ( = ?auto_198884 ?auto_198889 ) ) ( not ( = ?auto_198884 ?auto_198890 ) ) ( not ( = ?auto_198884 ?auto_198891 ) ) ( not ( = ?auto_198885 ?auto_198886 ) ) ( not ( = ?auto_198885 ?auto_198887 ) ) ( not ( = ?auto_198885 ?auto_198888 ) ) ( not ( = ?auto_198885 ?auto_198889 ) ) ( not ( = ?auto_198885 ?auto_198890 ) ) ( not ( = ?auto_198885 ?auto_198891 ) ) ( not ( = ?auto_198886 ?auto_198887 ) ) ( not ( = ?auto_198886 ?auto_198888 ) ) ( not ( = ?auto_198886 ?auto_198889 ) ) ( not ( = ?auto_198886 ?auto_198890 ) ) ( not ( = ?auto_198886 ?auto_198891 ) ) ( not ( = ?auto_198887 ?auto_198888 ) ) ( not ( = ?auto_198887 ?auto_198889 ) ) ( not ( = ?auto_198887 ?auto_198890 ) ) ( not ( = ?auto_198887 ?auto_198891 ) ) ( not ( = ?auto_198888 ?auto_198889 ) ) ( not ( = ?auto_198888 ?auto_198890 ) ) ( not ( = ?auto_198888 ?auto_198891 ) ) ( not ( = ?auto_198889 ?auto_198890 ) ) ( not ( = ?auto_198889 ?auto_198891 ) ) ( not ( = ?auto_198890 ?auto_198891 ) ) ( CLEAR ?auto_198888 ) ( ON ?auto_198889 ?auto_198890 ) ( CLEAR ?auto_198889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_198880 ?auto_198881 ?auto_198882 ?auto_198883 ?auto_198884 ?auto_198885 ?auto_198886 ?auto_198887 ?auto_198888 ?auto_198889 )
      ( MAKE-11PILE ?auto_198880 ?auto_198881 ?auto_198882 ?auto_198883 ?auto_198884 ?auto_198885 ?auto_198886 ?auto_198887 ?auto_198888 ?auto_198889 ?auto_198890 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_198903 - BLOCK
      ?auto_198904 - BLOCK
      ?auto_198905 - BLOCK
      ?auto_198906 - BLOCK
      ?auto_198907 - BLOCK
      ?auto_198908 - BLOCK
      ?auto_198909 - BLOCK
      ?auto_198910 - BLOCK
      ?auto_198911 - BLOCK
      ?auto_198912 - BLOCK
      ?auto_198913 - BLOCK
    )
    :vars
    (
      ?auto_198914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198913 ?auto_198914 ) ( ON-TABLE ?auto_198903 ) ( ON ?auto_198904 ?auto_198903 ) ( ON ?auto_198905 ?auto_198904 ) ( ON ?auto_198906 ?auto_198905 ) ( ON ?auto_198907 ?auto_198906 ) ( ON ?auto_198908 ?auto_198907 ) ( ON ?auto_198909 ?auto_198908 ) ( ON ?auto_198910 ?auto_198909 ) ( ON ?auto_198911 ?auto_198910 ) ( not ( = ?auto_198903 ?auto_198904 ) ) ( not ( = ?auto_198903 ?auto_198905 ) ) ( not ( = ?auto_198903 ?auto_198906 ) ) ( not ( = ?auto_198903 ?auto_198907 ) ) ( not ( = ?auto_198903 ?auto_198908 ) ) ( not ( = ?auto_198903 ?auto_198909 ) ) ( not ( = ?auto_198903 ?auto_198910 ) ) ( not ( = ?auto_198903 ?auto_198911 ) ) ( not ( = ?auto_198903 ?auto_198912 ) ) ( not ( = ?auto_198903 ?auto_198913 ) ) ( not ( = ?auto_198903 ?auto_198914 ) ) ( not ( = ?auto_198904 ?auto_198905 ) ) ( not ( = ?auto_198904 ?auto_198906 ) ) ( not ( = ?auto_198904 ?auto_198907 ) ) ( not ( = ?auto_198904 ?auto_198908 ) ) ( not ( = ?auto_198904 ?auto_198909 ) ) ( not ( = ?auto_198904 ?auto_198910 ) ) ( not ( = ?auto_198904 ?auto_198911 ) ) ( not ( = ?auto_198904 ?auto_198912 ) ) ( not ( = ?auto_198904 ?auto_198913 ) ) ( not ( = ?auto_198904 ?auto_198914 ) ) ( not ( = ?auto_198905 ?auto_198906 ) ) ( not ( = ?auto_198905 ?auto_198907 ) ) ( not ( = ?auto_198905 ?auto_198908 ) ) ( not ( = ?auto_198905 ?auto_198909 ) ) ( not ( = ?auto_198905 ?auto_198910 ) ) ( not ( = ?auto_198905 ?auto_198911 ) ) ( not ( = ?auto_198905 ?auto_198912 ) ) ( not ( = ?auto_198905 ?auto_198913 ) ) ( not ( = ?auto_198905 ?auto_198914 ) ) ( not ( = ?auto_198906 ?auto_198907 ) ) ( not ( = ?auto_198906 ?auto_198908 ) ) ( not ( = ?auto_198906 ?auto_198909 ) ) ( not ( = ?auto_198906 ?auto_198910 ) ) ( not ( = ?auto_198906 ?auto_198911 ) ) ( not ( = ?auto_198906 ?auto_198912 ) ) ( not ( = ?auto_198906 ?auto_198913 ) ) ( not ( = ?auto_198906 ?auto_198914 ) ) ( not ( = ?auto_198907 ?auto_198908 ) ) ( not ( = ?auto_198907 ?auto_198909 ) ) ( not ( = ?auto_198907 ?auto_198910 ) ) ( not ( = ?auto_198907 ?auto_198911 ) ) ( not ( = ?auto_198907 ?auto_198912 ) ) ( not ( = ?auto_198907 ?auto_198913 ) ) ( not ( = ?auto_198907 ?auto_198914 ) ) ( not ( = ?auto_198908 ?auto_198909 ) ) ( not ( = ?auto_198908 ?auto_198910 ) ) ( not ( = ?auto_198908 ?auto_198911 ) ) ( not ( = ?auto_198908 ?auto_198912 ) ) ( not ( = ?auto_198908 ?auto_198913 ) ) ( not ( = ?auto_198908 ?auto_198914 ) ) ( not ( = ?auto_198909 ?auto_198910 ) ) ( not ( = ?auto_198909 ?auto_198911 ) ) ( not ( = ?auto_198909 ?auto_198912 ) ) ( not ( = ?auto_198909 ?auto_198913 ) ) ( not ( = ?auto_198909 ?auto_198914 ) ) ( not ( = ?auto_198910 ?auto_198911 ) ) ( not ( = ?auto_198910 ?auto_198912 ) ) ( not ( = ?auto_198910 ?auto_198913 ) ) ( not ( = ?auto_198910 ?auto_198914 ) ) ( not ( = ?auto_198911 ?auto_198912 ) ) ( not ( = ?auto_198911 ?auto_198913 ) ) ( not ( = ?auto_198911 ?auto_198914 ) ) ( not ( = ?auto_198912 ?auto_198913 ) ) ( not ( = ?auto_198912 ?auto_198914 ) ) ( not ( = ?auto_198913 ?auto_198914 ) ) ( CLEAR ?auto_198911 ) ( ON ?auto_198912 ?auto_198913 ) ( CLEAR ?auto_198912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_198903 ?auto_198904 ?auto_198905 ?auto_198906 ?auto_198907 ?auto_198908 ?auto_198909 ?auto_198910 ?auto_198911 ?auto_198912 )
      ( MAKE-11PILE ?auto_198903 ?auto_198904 ?auto_198905 ?auto_198906 ?auto_198907 ?auto_198908 ?auto_198909 ?auto_198910 ?auto_198911 ?auto_198912 ?auto_198913 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_198926 - BLOCK
      ?auto_198927 - BLOCK
      ?auto_198928 - BLOCK
      ?auto_198929 - BLOCK
      ?auto_198930 - BLOCK
      ?auto_198931 - BLOCK
      ?auto_198932 - BLOCK
      ?auto_198933 - BLOCK
      ?auto_198934 - BLOCK
      ?auto_198935 - BLOCK
      ?auto_198936 - BLOCK
    )
    :vars
    (
      ?auto_198937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198936 ?auto_198937 ) ( ON-TABLE ?auto_198926 ) ( ON ?auto_198927 ?auto_198926 ) ( ON ?auto_198928 ?auto_198927 ) ( ON ?auto_198929 ?auto_198928 ) ( ON ?auto_198930 ?auto_198929 ) ( ON ?auto_198931 ?auto_198930 ) ( ON ?auto_198932 ?auto_198931 ) ( ON ?auto_198933 ?auto_198932 ) ( not ( = ?auto_198926 ?auto_198927 ) ) ( not ( = ?auto_198926 ?auto_198928 ) ) ( not ( = ?auto_198926 ?auto_198929 ) ) ( not ( = ?auto_198926 ?auto_198930 ) ) ( not ( = ?auto_198926 ?auto_198931 ) ) ( not ( = ?auto_198926 ?auto_198932 ) ) ( not ( = ?auto_198926 ?auto_198933 ) ) ( not ( = ?auto_198926 ?auto_198934 ) ) ( not ( = ?auto_198926 ?auto_198935 ) ) ( not ( = ?auto_198926 ?auto_198936 ) ) ( not ( = ?auto_198926 ?auto_198937 ) ) ( not ( = ?auto_198927 ?auto_198928 ) ) ( not ( = ?auto_198927 ?auto_198929 ) ) ( not ( = ?auto_198927 ?auto_198930 ) ) ( not ( = ?auto_198927 ?auto_198931 ) ) ( not ( = ?auto_198927 ?auto_198932 ) ) ( not ( = ?auto_198927 ?auto_198933 ) ) ( not ( = ?auto_198927 ?auto_198934 ) ) ( not ( = ?auto_198927 ?auto_198935 ) ) ( not ( = ?auto_198927 ?auto_198936 ) ) ( not ( = ?auto_198927 ?auto_198937 ) ) ( not ( = ?auto_198928 ?auto_198929 ) ) ( not ( = ?auto_198928 ?auto_198930 ) ) ( not ( = ?auto_198928 ?auto_198931 ) ) ( not ( = ?auto_198928 ?auto_198932 ) ) ( not ( = ?auto_198928 ?auto_198933 ) ) ( not ( = ?auto_198928 ?auto_198934 ) ) ( not ( = ?auto_198928 ?auto_198935 ) ) ( not ( = ?auto_198928 ?auto_198936 ) ) ( not ( = ?auto_198928 ?auto_198937 ) ) ( not ( = ?auto_198929 ?auto_198930 ) ) ( not ( = ?auto_198929 ?auto_198931 ) ) ( not ( = ?auto_198929 ?auto_198932 ) ) ( not ( = ?auto_198929 ?auto_198933 ) ) ( not ( = ?auto_198929 ?auto_198934 ) ) ( not ( = ?auto_198929 ?auto_198935 ) ) ( not ( = ?auto_198929 ?auto_198936 ) ) ( not ( = ?auto_198929 ?auto_198937 ) ) ( not ( = ?auto_198930 ?auto_198931 ) ) ( not ( = ?auto_198930 ?auto_198932 ) ) ( not ( = ?auto_198930 ?auto_198933 ) ) ( not ( = ?auto_198930 ?auto_198934 ) ) ( not ( = ?auto_198930 ?auto_198935 ) ) ( not ( = ?auto_198930 ?auto_198936 ) ) ( not ( = ?auto_198930 ?auto_198937 ) ) ( not ( = ?auto_198931 ?auto_198932 ) ) ( not ( = ?auto_198931 ?auto_198933 ) ) ( not ( = ?auto_198931 ?auto_198934 ) ) ( not ( = ?auto_198931 ?auto_198935 ) ) ( not ( = ?auto_198931 ?auto_198936 ) ) ( not ( = ?auto_198931 ?auto_198937 ) ) ( not ( = ?auto_198932 ?auto_198933 ) ) ( not ( = ?auto_198932 ?auto_198934 ) ) ( not ( = ?auto_198932 ?auto_198935 ) ) ( not ( = ?auto_198932 ?auto_198936 ) ) ( not ( = ?auto_198932 ?auto_198937 ) ) ( not ( = ?auto_198933 ?auto_198934 ) ) ( not ( = ?auto_198933 ?auto_198935 ) ) ( not ( = ?auto_198933 ?auto_198936 ) ) ( not ( = ?auto_198933 ?auto_198937 ) ) ( not ( = ?auto_198934 ?auto_198935 ) ) ( not ( = ?auto_198934 ?auto_198936 ) ) ( not ( = ?auto_198934 ?auto_198937 ) ) ( not ( = ?auto_198935 ?auto_198936 ) ) ( not ( = ?auto_198935 ?auto_198937 ) ) ( not ( = ?auto_198936 ?auto_198937 ) ) ( ON ?auto_198935 ?auto_198936 ) ( CLEAR ?auto_198933 ) ( ON ?auto_198934 ?auto_198935 ) ( CLEAR ?auto_198934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_198926 ?auto_198927 ?auto_198928 ?auto_198929 ?auto_198930 ?auto_198931 ?auto_198932 ?auto_198933 ?auto_198934 )
      ( MAKE-11PILE ?auto_198926 ?auto_198927 ?auto_198928 ?auto_198929 ?auto_198930 ?auto_198931 ?auto_198932 ?auto_198933 ?auto_198934 ?auto_198935 ?auto_198936 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_198949 - BLOCK
      ?auto_198950 - BLOCK
      ?auto_198951 - BLOCK
      ?auto_198952 - BLOCK
      ?auto_198953 - BLOCK
      ?auto_198954 - BLOCK
      ?auto_198955 - BLOCK
      ?auto_198956 - BLOCK
      ?auto_198957 - BLOCK
      ?auto_198958 - BLOCK
      ?auto_198959 - BLOCK
    )
    :vars
    (
      ?auto_198960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198959 ?auto_198960 ) ( ON-TABLE ?auto_198949 ) ( ON ?auto_198950 ?auto_198949 ) ( ON ?auto_198951 ?auto_198950 ) ( ON ?auto_198952 ?auto_198951 ) ( ON ?auto_198953 ?auto_198952 ) ( ON ?auto_198954 ?auto_198953 ) ( ON ?auto_198955 ?auto_198954 ) ( ON ?auto_198956 ?auto_198955 ) ( not ( = ?auto_198949 ?auto_198950 ) ) ( not ( = ?auto_198949 ?auto_198951 ) ) ( not ( = ?auto_198949 ?auto_198952 ) ) ( not ( = ?auto_198949 ?auto_198953 ) ) ( not ( = ?auto_198949 ?auto_198954 ) ) ( not ( = ?auto_198949 ?auto_198955 ) ) ( not ( = ?auto_198949 ?auto_198956 ) ) ( not ( = ?auto_198949 ?auto_198957 ) ) ( not ( = ?auto_198949 ?auto_198958 ) ) ( not ( = ?auto_198949 ?auto_198959 ) ) ( not ( = ?auto_198949 ?auto_198960 ) ) ( not ( = ?auto_198950 ?auto_198951 ) ) ( not ( = ?auto_198950 ?auto_198952 ) ) ( not ( = ?auto_198950 ?auto_198953 ) ) ( not ( = ?auto_198950 ?auto_198954 ) ) ( not ( = ?auto_198950 ?auto_198955 ) ) ( not ( = ?auto_198950 ?auto_198956 ) ) ( not ( = ?auto_198950 ?auto_198957 ) ) ( not ( = ?auto_198950 ?auto_198958 ) ) ( not ( = ?auto_198950 ?auto_198959 ) ) ( not ( = ?auto_198950 ?auto_198960 ) ) ( not ( = ?auto_198951 ?auto_198952 ) ) ( not ( = ?auto_198951 ?auto_198953 ) ) ( not ( = ?auto_198951 ?auto_198954 ) ) ( not ( = ?auto_198951 ?auto_198955 ) ) ( not ( = ?auto_198951 ?auto_198956 ) ) ( not ( = ?auto_198951 ?auto_198957 ) ) ( not ( = ?auto_198951 ?auto_198958 ) ) ( not ( = ?auto_198951 ?auto_198959 ) ) ( not ( = ?auto_198951 ?auto_198960 ) ) ( not ( = ?auto_198952 ?auto_198953 ) ) ( not ( = ?auto_198952 ?auto_198954 ) ) ( not ( = ?auto_198952 ?auto_198955 ) ) ( not ( = ?auto_198952 ?auto_198956 ) ) ( not ( = ?auto_198952 ?auto_198957 ) ) ( not ( = ?auto_198952 ?auto_198958 ) ) ( not ( = ?auto_198952 ?auto_198959 ) ) ( not ( = ?auto_198952 ?auto_198960 ) ) ( not ( = ?auto_198953 ?auto_198954 ) ) ( not ( = ?auto_198953 ?auto_198955 ) ) ( not ( = ?auto_198953 ?auto_198956 ) ) ( not ( = ?auto_198953 ?auto_198957 ) ) ( not ( = ?auto_198953 ?auto_198958 ) ) ( not ( = ?auto_198953 ?auto_198959 ) ) ( not ( = ?auto_198953 ?auto_198960 ) ) ( not ( = ?auto_198954 ?auto_198955 ) ) ( not ( = ?auto_198954 ?auto_198956 ) ) ( not ( = ?auto_198954 ?auto_198957 ) ) ( not ( = ?auto_198954 ?auto_198958 ) ) ( not ( = ?auto_198954 ?auto_198959 ) ) ( not ( = ?auto_198954 ?auto_198960 ) ) ( not ( = ?auto_198955 ?auto_198956 ) ) ( not ( = ?auto_198955 ?auto_198957 ) ) ( not ( = ?auto_198955 ?auto_198958 ) ) ( not ( = ?auto_198955 ?auto_198959 ) ) ( not ( = ?auto_198955 ?auto_198960 ) ) ( not ( = ?auto_198956 ?auto_198957 ) ) ( not ( = ?auto_198956 ?auto_198958 ) ) ( not ( = ?auto_198956 ?auto_198959 ) ) ( not ( = ?auto_198956 ?auto_198960 ) ) ( not ( = ?auto_198957 ?auto_198958 ) ) ( not ( = ?auto_198957 ?auto_198959 ) ) ( not ( = ?auto_198957 ?auto_198960 ) ) ( not ( = ?auto_198958 ?auto_198959 ) ) ( not ( = ?auto_198958 ?auto_198960 ) ) ( not ( = ?auto_198959 ?auto_198960 ) ) ( ON ?auto_198958 ?auto_198959 ) ( CLEAR ?auto_198956 ) ( ON ?auto_198957 ?auto_198958 ) ( CLEAR ?auto_198957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_198949 ?auto_198950 ?auto_198951 ?auto_198952 ?auto_198953 ?auto_198954 ?auto_198955 ?auto_198956 ?auto_198957 )
      ( MAKE-11PILE ?auto_198949 ?auto_198950 ?auto_198951 ?auto_198952 ?auto_198953 ?auto_198954 ?auto_198955 ?auto_198956 ?auto_198957 ?auto_198958 ?auto_198959 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_198972 - BLOCK
      ?auto_198973 - BLOCK
      ?auto_198974 - BLOCK
      ?auto_198975 - BLOCK
      ?auto_198976 - BLOCK
      ?auto_198977 - BLOCK
      ?auto_198978 - BLOCK
      ?auto_198979 - BLOCK
      ?auto_198980 - BLOCK
      ?auto_198981 - BLOCK
      ?auto_198982 - BLOCK
    )
    :vars
    (
      ?auto_198983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198982 ?auto_198983 ) ( ON-TABLE ?auto_198972 ) ( ON ?auto_198973 ?auto_198972 ) ( ON ?auto_198974 ?auto_198973 ) ( ON ?auto_198975 ?auto_198974 ) ( ON ?auto_198976 ?auto_198975 ) ( ON ?auto_198977 ?auto_198976 ) ( ON ?auto_198978 ?auto_198977 ) ( not ( = ?auto_198972 ?auto_198973 ) ) ( not ( = ?auto_198972 ?auto_198974 ) ) ( not ( = ?auto_198972 ?auto_198975 ) ) ( not ( = ?auto_198972 ?auto_198976 ) ) ( not ( = ?auto_198972 ?auto_198977 ) ) ( not ( = ?auto_198972 ?auto_198978 ) ) ( not ( = ?auto_198972 ?auto_198979 ) ) ( not ( = ?auto_198972 ?auto_198980 ) ) ( not ( = ?auto_198972 ?auto_198981 ) ) ( not ( = ?auto_198972 ?auto_198982 ) ) ( not ( = ?auto_198972 ?auto_198983 ) ) ( not ( = ?auto_198973 ?auto_198974 ) ) ( not ( = ?auto_198973 ?auto_198975 ) ) ( not ( = ?auto_198973 ?auto_198976 ) ) ( not ( = ?auto_198973 ?auto_198977 ) ) ( not ( = ?auto_198973 ?auto_198978 ) ) ( not ( = ?auto_198973 ?auto_198979 ) ) ( not ( = ?auto_198973 ?auto_198980 ) ) ( not ( = ?auto_198973 ?auto_198981 ) ) ( not ( = ?auto_198973 ?auto_198982 ) ) ( not ( = ?auto_198973 ?auto_198983 ) ) ( not ( = ?auto_198974 ?auto_198975 ) ) ( not ( = ?auto_198974 ?auto_198976 ) ) ( not ( = ?auto_198974 ?auto_198977 ) ) ( not ( = ?auto_198974 ?auto_198978 ) ) ( not ( = ?auto_198974 ?auto_198979 ) ) ( not ( = ?auto_198974 ?auto_198980 ) ) ( not ( = ?auto_198974 ?auto_198981 ) ) ( not ( = ?auto_198974 ?auto_198982 ) ) ( not ( = ?auto_198974 ?auto_198983 ) ) ( not ( = ?auto_198975 ?auto_198976 ) ) ( not ( = ?auto_198975 ?auto_198977 ) ) ( not ( = ?auto_198975 ?auto_198978 ) ) ( not ( = ?auto_198975 ?auto_198979 ) ) ( not ( = ?auto_198975 ?auto_198980 ) ) ( not ( = ?auto_198975 ?auto_198981 ) ) ( not ( = ?auto_198975 ?auto_198982 ) ) ( not ( = ?auto_198975 ?auto_198983 ) ) ( not ( = ?auto_198976 ?auto_198977 ) ) ( not ( = ?auto_198976 ?auto_198978 ) ) ( not ( = ?auto_198976 ?auto_198979 ) ) ( not ( = ?auto_198976 ?auto_198980 ) ) ( not ( = ?auto_198976 ?auto_198981 ) ) ( not ( = ?auto_198976 ?auto_198982 ) ) ( not ( = ?auto_198976 ?auto_198983 ) ) ( not ( = ?auto_198977 ?auto_198978 ) ) ( not ( = ?auto_198977 ?auto_198979 ) ) ( not ( = ?auto_198977 ?auto_198980 ) ) ( not ( = ?auto_198977 ?auto_198981 ) ) ( not ( = ?auto_198977 ?auto_198982 ) ) ( not ( = ?auto_198977 ?auto_198983 ) ) ( not ( = ?auto_198978 ?auto_198979 ) ) ( not ( = ?auto_198978 ?auto_198980 ) ) ( not ( = ?auto_198978 ?auto_198981 ) ) ( not ( = ?auto_198978 ?auto_198982 ) ) ( not ( = ?auto_198978 ?auto_198983 ) ) ( not ( = ?auto_198979 ?auto_198980 ) ) ( not ( = ?auto_198979 ?auto_198981 ) ) ( not ( = ?auto_198979 ?auto_198982 ) ) ( not ( = ?auto_198979 ?auto_198983 ) ) ( not ( = ?auto_198980 ?auto_198981 ) ) ( not ( = ?auto_198980 ?auto_198982 ) ) ( not ( = ?auto_198980 ?auto_198983 ) ) ( not ( = ?auto_198981 ?auto_198982 ) ) ( not ( = ?auto_198981 ?auto_198983 ) ) ( not ( = ?auto_198982 ?auto_198983 ) ) ( ON ?auto_198981 ?auto_198982 ) ( ON ?auto_198980 ?auto_198981 ) ( CLEAR ?auto_198978 ) ( ON ?auto_198979 ?auto_198980 ) ( CLEAR ?auto_198979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_198972 ?auto_198973 ?auto_198974 ?auto_198975 ?auto_198976 ?auto_198977 ?auto_198978 ?auto_198979 )
      ( MAKE-11PILE ?auto_198972 ?auto_198973 ?auto_198974 ?auto_198975 ?auto_198976 ?auto_198977 ?auto_198978 ?auto_198979 ?auto_198980 ?auto_198981 ?auto_198982 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_198995 - BLOCK
      ?auto_198996 - BLOCK
      ?auto_198997 - BLOCK
      ?auto_198998 - BLOCK
      ?auto_198999 - BLOCK
      ?auto_199000 - BLOCK
      ?auto_199001 - BLOCK
      ?auto_199002 - BLOCK
      ?auto_199003 - BLOCK
      ?auto_199004 - BLOCK
      ?auto_199005 - BLOCK
    )
    :vars
    (
      ?auto_199006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199005 ?auto_199006 ) ( ON-TABLE ?auto_198995 ) ( ON ?auto_198996 ?auto_198995 ) ( ON ?auto_198997 ?auto_198996 ) ( ON ?auto_198998 ?auto_198997 ) ( ON ?auto_198999 ?auto_198998 ) ( ON ?auto_199000 ?auto_198999 ) ( ON ?auto_199001 ?auto_199000 ) ( not ( = ?auto_198995 ?auto_198996 ) ) ( not ( = ?auto_198995 ?auto_198997 ) ) ( not ( = ?auto_198995 ?auto_198998 ) ) ( not ( = ?auto_198995 ?auto_198999 ) ) ( not ( = ?auto_198995 ?auto_199000 ) ) ( not ( = ?auto_198995 ?auto_199001 ) ) ( not ( = ?auto_198995 ?auto_199002 ) ) ( not ( = ?auto_198995 ?auto_199003 ) ) ( not ( = ?auto_198995 ?auto_199004 ) ) ( not ( = ?auto_198995 ?auto_199005 ) ) ( not ( = ?auto_198995 ?auto_199006 ) ) ( not ( = ?auto_198996 ?auto_198997 ) ) ( not ( = ?auto_198996 ?auto_198998 ) ) ( not ( = ?auto_198996 ?auto_198999 ) ) ( not ( = ?auto_198996 ?auto_199000 ) ) ( not ( = ?auto_198996 ?auto_199001 ) ) ( not ( = ?auto_198996 ?auto_199002 ) ) ( not ( = ?auto_198996 ?auto_199003 ) ) ( not ( = ?auto_198996 ?auto_199004 ) ) ( not ( = ?auto_198996 ?auto_199005 ) ) ( not ( = ?auto_198996 ?auto_199006 ) ) ( not ( = ?auto_198997 ?auto_198998 ) ) ( not ( = ?auto_198997 ?auto_198999 ) ) ( not ( = ?auto_198997 ?auto_199000 ) ) ( not ( = ?auto_198997 ?auto_199001 ) ) ( not ( = ?auto_198997 ?auto_199002 ) ) ( not ( = ?auto_198997 ?auto_199003 ) ) ( not ( = ?auto_198997 ?auto_199004 ) ) ( not ( = ?auto_198997 ?auto_199005 ) ) ( not ( = ?auto_198997 ?auto_199006 ) ) ( not ( = ?auto_198998 ?auto_198999 ) ) ( not ( = ?auto_198998 ?auto_199000 ) ) ( not ( = ?auto_198998 ?auto_199001 ) ) ( not ( = ?auto_198998 ?auto_199002 ) ) ( not ( = ?auto_198998 ?auto_199003 ) ) ( not ( = ?auto_198998 ?auto_199004 ) ) ( not ( = ?auto_198998 ?auto_199005 ) ) ( not ( = ?auto_198998 ?auto_199006 ) ) ( not ( = ?auto_198999 ?auto_199000 ) ) ( not ( = ?auto_198999 ?auto_199001 ) ) ( not ( = ?auto_198999 ?auto_199002 ) ) ( not ( = ?auto_198999 ?auto_199003 ) ) ( not ( = ?auto_198999 ?auto_199004 ) ) ( not ( = ?auto_198999 ?auto_199005 ) ) ( not ( = ?auto_198999 ?auto_199006 ) ) ( not ( = ?auto_199000 ?auto_199001 ) ) ( not ( = ?auto_199000 ?auto_199002 ) ) ( not ( = ?auto_199000 ?auto_199003 ) ) ( not ( = ?auto_199000 ?auto_199004 ) ) ( not ( = ?auto_199000 ?auto_199005 ) ) ( not ( = ?auto_199000 ?auto_199006 ) ) ( not ( = ?auto_199001 ?auto_199002 ) ) ( not ( = ?auto_199001 ?auto_199003 ) ) ( not ( = ?auto_199001 ?auto_199004 ) ) ( not ( = ?auto_199001 ?auto_199005 ) ) ( not ( = ?auto_199001 ?auto_199006 ) ) ( not ( = ?auto_199002 ?auto_199003 ) ) ( not ( = ?auto_199002 ?auto_199004 ) ) ( not ( = ?auto_199002 ?auto_199005 ) ) ( not ( = ?auto_199002 ?auto_199006 ) ) ( not ( = ?auto_199003 ?auto_199004 ) ) ( not ( = ?auto_199003 ?auto_199005 ) ) ( not ( = ?auto_199003 ?auto_199006 ) ) ( not ( = ?auto_199004 ?auto_199005 ) ) ( not ( = ?auto_199004 ?auto_199006 ) ) ( not ( = ?auto_199005 ?auto_199006 ) ) ( ON ?auto_199004 ?auto_199005 ) ( ON ?auto_199003 ?auto_199004 ) ( CLEAR ?auto_199001 ) ( ON ?auto_199002 ?auto_199003 ) ( CLEAR ?auto_199002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_198995 ?auto_198996 ?auto_198997 ?auto_198998 ?auto_198999 ?auto_199000 ?auto_199001 ?auto_199002 )
      ( MAKE-11PILE ?auto_198995 ?auto_198996 ?auto_198997 ?auto_198998 ?auto_198999 ?auto_199000 ?auto_199001 ?auto_199002 ?auto_199003 ?auto_199004 ?auto_199005 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_199018 - BLOCK
      ?auto_199019 - BLOCK
      ?auto_199020 - BLOCK
      ?auto_199021 - BLOCK
      ?auto_199022 - BLOCK
      ?auto_199023 - BLOCK
      ?auto_199024 - BLOCK
      ?auto_199025 - BLOCK
      ?auto_199026 - BLOCK
      ?auto_199027 - BLOCK
      ?auto_199028 - BLOCK
    )
    :vars
    (
      ?auto_199029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199028 ?auto_199029 ) ( ON-TABLE ?auto_199018 ) ( ON ?auto_199019 ?auto_199018 ) ( ON ?auto_199020 ?auto_199019 ) ( ON ?auto_199021 ?auto_199020 ) ( ON ?auto_199022 ?auto_199021 ) ( ON ?auto_199023 ?auto_199022 ) ( not ( = ?auto_199018 ?auto_199019 ) ) ( not ( = ?auto_199018 ?auto_199020 ) ) ( not ( = ?auto_199018 ?auto_199021 ) ) ( not ( = ?auto_199018 ?auto_199022 ) ) ( not ( = ?auto_199018 ?auto_199023 ) ) ( not ( = ?auto_199018 ?auto_199024 ) ) ( not ( = ?auto_199018 ?auto_199025 ) ) ( not ( = ?auto_199018 ?auto_199026 ) ) ( not ( = ?auto_199018 ?auto_199027 ) ) ( not ( = ?auto_199018 ?auto_199028 ) ) ( not ( = ?auto_199018 ?auto_199029 ) ) ( not ( = ?auto_199019 ?auto_199020 ) ) ( not ( = ?auto_199019 ?auto_199021 ) ) ( not ( = ?auto_199019 ?auto_199022 ) ) ( not ( = ?auto_199019 ?auto_199023 ) ) ( not ( = ?auto_199019 ?auto_199024 ) ) ( not ( = ?auto_199019 ?auto_199025 ) ) ( not ( = ?auto_199019 ?auto_199026 ) ) ( not ( = ?auto_199019 ?auto_199027 ) ) ( not ( = ?auto_199019 ?auto_199028 ) ) ( not ( = ?auto_199019 ?auto_199029 ) ) ( not ( = ?auto_199020 ?auto_199021 ) ) ( not ( = ?auto_199020 ?auto_199022 ) ) ( not ( = ?auto_199020 ?auto_199023 ) ) ( not ( = ?auto_199020 ?auto_199024 ) ) ( not ( = ?auto_199020 ?auto_199025 ) ) ( not ( = ?auto_199020 ?auto_199026 ) ) ( not ( = ?auto_199020 ?auto_199027 ) ) ( not ( = ?auto_199020 ?auto_199028 ) ) ( not ( = ?auto_199020 ?auto_199029 ) ) ( not ( = ?auto_199021 ?auto_199022 ) ) ( not ( = ?auto_199021 ?auto_199023 ) ) ( not ( = ?auto_199021 ?auto_199024 ) ) ( not ( = ?auto_199021 ?auto_199025 ) ) ( not ( = ?auto_199021 ?auto_199026 ) ) ( not ( = ?auto_199021 ?auto_199027 ) ) ( not ( = ?auto_199021 ?auto_199028 ) ) ( not ( = ?auto_199021 ?auto_199029 ) ) ( not ( = ?auto_199022 ?auto_199023 ) ) ( not ( = ?auto_199022 ?auto_199024 ) ) ( not ( = ?auto_199022 ?auto_199025 ) ) ( not ( = ?auto_199022 ?auto_199026 ) ) ( not ( = ?auto_199022 ?auto_199027 ) ) ( not ( = ?auto_199022 ?auto_199028 ) ) ( not ( = ?auto_199022 ?auto_199029 ) ) ( not ( = ?auto_199023 ?auto_199024 ) ) ( not ( = ?auto_199023 ?auto_199025 ) ) ( not ( = ?auto_199023 ?auto_199026 ) ) ( not ( = ?auto_199023 ?auto_199027 ) ) ( not ( = ?auto_199023 ?auto_199028 ) ) ( not ( = ?auto_199023 ?auto_199029 ) ) ( not ( = ?auto_199024 ?auto_199025 ) ) ( not ( = ?auto_199024 ?auto_199026 ) ) ( not ( = ?auto_199024 ?auto_199027 ) ) ( not ( = ?auto_199024 ?auto_199028 ) ) ( not ( = ?auto_199024 ?auto_199029 ) ) ( not ( = ?auto_199025 ?auto_199026 ) ) ( not ( = ?auto_199025 ?auto_199027 ) ) ( not ( = ?auto_199025 ?auto_199028 ) ) ( not ( = ?auto_199025 ?auto_199029 ) ) ( not ( = ?auto_199026 ?auto_199027 ) ) ( not ( = ?auto_199026 ?auto_199028 ) ) ( not ( = ?auto_199026 ?auto_199029 ) ) ( not ( = ?auto_199027 ?auto_199028 ) ) ( not ( = ?auto_199027 ?auto_199029 ) ) ( not ( = ?auto_199028 ?auto_199029 ) ) ( ON ?auto_199027 ?auto_199028 ) ( ON ?auto_199026 ?auto_199027 ) ( ON ?auto_199025 ?auto_199026 ) ( CLEAR ?auto_199023 ) ( ON ?auto_199024 ?auto_199025 ) ( CLEAR ?auto_199024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_199018 ?auto_199019 ?auto_199020 ?auto_199021 ?auto_199022 ?auto_199023 ?auto_199024 )
      ( MAKE-11PILE ?auto_199018 ?auto_199019 ?auto_199020 ?auto_199021 ?auto_199022 ?auto_199023 ?auto_199024 ?auto_199025 ?auto_199026 ?auto_199027 ?auto_199028 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_199041 - BLOCK
      ?auto_199042 - BLOCK
      ?auto_199043 - BLOCK
      ?auto_199044 - BLOCK
      ?auto_199045 - BLOCK
      ?auto_199046 - BLOCK
      ?auto_199047 - BLOCK
      ?auto_199048 - BLOCK
      ?auto_199049 - BLOCK
      ?auto_199050 - BLOCK
      ?auto_199051 - BLOCK
    )
    :vars
    (
      ?auto_199052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199051 ?auto_199052 ) ( ON-TABLE ?auto_199041 ) ( ON ?auto_199042 ?auto_199041 ) ( ON ?auto_199043 ?auto_199042 ) ( ON ?auto_199044 ?auto_199043 ) ( ON ?auto_199045 ?auto_199044 ) ( ON ?auto_199046 ?auto_199045 ) ( not ( = ?auto_199041 ?auto_199042 ) ) ( not ( = ?auto_199041 ?auto_199043 ) ) ( not ( = ?auto_199041 ?auto_199044 ) ) ( not ( = ?auto_199041 ?auto_199045 ) ) ( not ( = ?auto_199041 ?auto_199046 ) ) ( not ( = ?auto_199041 ?auto_199047 ) ) ( not ( = ?auto_199041 ?auto_199048 ) ) ( not ( = ?auto_199041 ?auto_199049 ) ) ( not ( = ?auto_199041 ?auto_199050 ) ) ( not ( = ?auto_199041 ?auto_199051 ) ) ( not ( = ?auto_199041 ?auto_199052 ) ) ( not ( = ?auto_199042 ?auto_199043 ) ) ( not ( = ?auto_199042 ?auto_199044 ) ) ( not ( = ?auto_199042 ?auto_199045 ) ) ( not ( = ?auto_199042 ?auto_199046 ) ) ( not ( = ?auto_199042 ?auto_199047 ) ) ( not ( = ?auto_199042 ?auto_199048 ) ) ( not ( = ?auto_199042 ?auto_199049 ) ) ( not ( = ?auto_199042 ?auto_199050 ) ) ( not ( = ?auto_199042 ?auto_199051 ) ) ( not ( = ?auto_199042 ?auto_199052 ) ) ( not ( = ?auto_199043 ?auto_199044 ) ) ( not ( = ?auto_199043 ?auto_199045 ) ) ( not ( = ?auto_199043 ?auto_199046 ) ) ( not ( = ?auto_199043 ?auto_199047 ) ) ( not ( = ?auto_199043 ?auto_199048 ) ) ( not ( = ?auto_199043 ?auto_199049 ) ) ( not ( = ?auto_199043 ?auto_199050 ) ) ( not ( = ?auto_199043 ?auto_199051 ) ) ( not ( = ?auto_199043 ?auto_199052 ) ) ( not ( = ?auto_199044 ?auto_199045 ) ) ( not ( = ?auto_199044 ?auto_199046 ) ) ( not ( = ?auto_199044 ?auto_199047 ) ) ( not ( = ?auto_199044 ?auto_199048 ) ) ( not ( = ?auto_199044 ?auto_199049 ) ) ( not ( = ?auto_199044 ?auto_199050 ) ) ( not ( = ?auto_199044 ?auto_199051 ) ) ( not ( = ?auto_199044 ?auto_199052 ) ) ( not ( = ?auto_199045 ?auto_199046 ) ) ( not ( = ?auto_199045 ?auto_199047 ) ) ( not ( = ?auto_199045 ?auto_199048 ) ) ( not ( = ?auto_199045 ?auto_199049 ) ) ( not ( = ?auto_199045 ?auto_199050 ) ) ( not ( = ?auto_199045 ?auto_199051 ) ) ( not ( = ?auto_199045 ?auto_199052 ) ) ( not ( = ?auto_199046 ?auto_199047 ) ) ( not ( = ?auto_199046 ?auto_199048 ) ) ( not ( = ?auto_199046 ?auto_199049 ) ) ( not ( = ?auto_199046 ?auto_199050 ) ) ( not ( = ?auto_199046 ?auto_199051 ) ) ( not ( = ?auto_199046 ?auto_199052 ) ) ( not ( = ?auto_199047 ?auto_199048 ) ) ( not ( = ?auto_199047 ?auto_199049 ) ) ( not ( = ?auto_199047 ?auto_199050 ) ) ( not ( = ?auto_199047 ?auto_199051 ) ) ( not ( = ?auto_199047 ?auto_199052 ) ) ( not ( = ?auto_199048 ?auto_199049 ) ) ( not ( = ?auto_199048 ?auto_199050 ) ) ( not ( = ?auto_199048 ?auto_199051 ) ) ( not ( = ?auto_199048 ?auto_199052 ) ) ( not ( = ?auto_199049 ?auto_199050 ) ) ( not ( = ?auto_199049 ?auto_199051 ) ) ( not ( = ?auto_199049 ?auto_199052 ) ) ( not ( = ?auto_199050 ?auto_199051 ) ) ( not ( = ?auto_199050 ?auto_199052 ) ) ( not ( = ?auto_199051 ?auto_199052 ) ) ( ON ?auto_199050 ?auto_199051 ) ( ON ?auto_199049 ?auto_199050 ) ( ON ?auto_199048 ?auto_199049 ) ( CLEAR ?auto_199046 ) ( ON ?auto_199047 ?auto_199048 ) ( CLEAR ?auto_199047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_199041 ?auto_199042 ?auto_199043 ?auto_199044 ?auto_199045 ?auto_199046 ?auto_199047 )
      ( MAKE-11PILE ?auto_199041 ?auto_199042 ?auto_199043 ?auto_199044 ?auto_199045 ?auto_199046 ?auto_199047 ?auto_199048 ?auto_199049 ?auto_199050 ?auto_199051 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_199064 - BLOCK
      ?auto_199065 - BLOCK
      ?auto_199066 - BLOCK
      ?auto_199067 - BLOCK
      ?auto_199068 - BLOCK
      ?auto_199069 - BLOCK
      ?auto_199070 - BLOCK
      ?auto_199071 - BLOCK
      ?auto_199072 - BLOCK
      ?auto_199073 - BLOCK
      ?auto_199074 - BLOCK
    )
    :vars
    (
      ?auto_199075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199074 ?auto_199075 ) ( ON-TABLE ?auto_199064 ) ( ON ?auto_199065 ?auto_199064 ) ( ON ?auto_199066 ?auto_199065 ) ( ON ?auto_199067 ?auto_199066 ) ( ON ?auto_199068 ?auto_199067 ) ( not ( = ?auto_199064 ?auto_199065 ) ) ( not ( = ?auto_199064 ?auto_199066 ) ) ( not ( = ?auto_199064 ?auto_199067 ) ) ( not ( = ?auto_199064 ?auto_199068 ) ) ( not ( = ?auto_199064 ?auto_199069 ) ) ( not ( = ?auto_199064 ?auto_199070 ) ) ( not ( = ?auto_199064 ?auto_199071 ) ) ( not ( = ?auto_199064 ?auto_199072 ) ) ( not ( = ?auto_199064 ?auto_199073 ) ) ( not ( = ?auto_199064 ?auto_199074 ) ) ( not ( = ?auto_199064 ?auto_199075 ) ) ( not ( = ?auto_199065 ?auto_199066 ) ) ( not ( = ?auto_199065 ?auto_199067 ) ) ( not ( = ?auto_199065 ?auto_199068 ) ) ( not ( = ?auto_199065 ?auto_199069 ) ) ( not ( = ?auto_199065 ?auto_199070 ) ) ( not ( = ?auto_199065 ?auto_199071 ) ) ( not ( = ?auto_199065 ?auto_199072 ) ) ( not ( = ?auto_199065 ?auto_199073 ) ) ( not ( = ?auto_199065 ?auto_199074 ) ) ( not ( = ?auto_199065 ?auto_199075 ) ) ( not ( = ?auto_199066 ?auto_199067 ) ) ( not ( = ?auto_199066 ?auto_199068 ) ) ( not ( = ?auto_199066 ?auto_199069 ) ) ( not ( = ?auto_199066 ?auto_199070 ) ) ( not ( = ?auto_199066 ?auto_199071 ) ) ( not ( = ?auto_199066 ?auto_199072 ) ) ( not ( = ?auto_199066 ?auto_199073 ) ) ( not ( = ?auto_199066 ?auto_199074 ) ) ( not ( = ?auto_199066 ?auto_199075 ) ) ( not ( = ?auto_199067 ?auto_199068 ) ) ( not ( = ?auto_199067 ?auto_199069 ) ) ( not ( = ?auto_199067 ?auto_199070 ) ) ( not ( = ?auto_199067 ?auto_199071 ) ) ( not ( = ?auto_199067 ?auto_199072 ) ) ( not ( = ?auto_199067 ?auto_199073 ) ) ( not ( = ?auto_199067 ?auto_199074 ) ) ( not ( = ?auto_199067 ?auto_199075 ) ) ( not ( = ?auto_199068 ?auto_199069 ) ) ( not ( = ?auto_199068 ?auto_199070 ) ) ( not ( = ?auto_199068 ?auto_199071 ) ) ( not ( = ?auto_199068 ?auto_199072 ) ) ( not ( = ?auto_199068 ?auto_199073 ) ) ( not ( = ?auto_199068 ?auto_199074 ) ) ( not ( = ?auto_199068 ?auto_199075 ) ) ( not ( = ?auto_199069 ?auto_199070 ) ) ( not ( = ?auto_199069 ?auto_199071 ) ) ( not ( = ?auto_199069 ?auto_199072 ) ) ( not ( = ?auto_199069 ?auto_199073 ) ) ( not ( = ?auto_199069 ?auto_199074 ) ) ( not ( = ?auto_199069 ?auto_199075 ) ) ( not ( = ?auto_199070 ?auto_199071 ) ) ( not ( = ?auto_199070 ?auto_199072 ) ) ( not ( = ?auto_199070 ?auto_199073 ) ) ( not ( = ?auto_199070 ?auto_199074 ) ) ( not ( = ?auto_199070 ?auto_199075 ) ) ( not ( = ?auto_199071 ?auto_199072 ) ) ( not ( = ?auto_199071 ?auto_199073 ) ) ( not ( = ?auto_199071 ?auto_199074 ) ) ( not ( = ?auto_199071 ?auto_199075 ) ) ( not ( = ?auto_199072 ?auto_199073 ) ) ( not ( = ?auto_199072 ?auto_199074 ) ) ( not ( = ?auto_199072 ?auto_199075 ) ) ( not ( = ?auto_199073 ?auto_199074 ) ) ( not ( = ?auto_199073 ?auto_199075 ) ) ( not ( = ?auto_199074 ?auto_199075 ) ) ( ON ?auto_199073 ?auto_199074 ) ( ON ?auto_199072 ?auto_199073 ) ( ON ?auto_199071 ?auto_199072 ) ( ON ?auto_199070 ?auto_199071 ) ( CLEAR ?auto_199068 ) ( ON ?auto_199069 ?auto_199070 ) ( CLEAR ?auto_199069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_199064 ?auto_199065 ?auto_199066 ?auto_199067 ?auto_199068 ?auto_199069 )
      ( MAKE-11PILE ?auto_199064 ?auto_199065 ?auto_199066 ?auto_199067 ?auto_199068 ?auto_199069 ?auto_199070 ?auto_199071 ?auto_199072 ?auto_199073 ?auto_199074 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_199087 - BLOCK
      ?auto_199088 - BLOCK
      ?auto_199089 - BLOCK
      ?auto_199090 - BLOCK
      ?auto_199091 - BLOCK
      ?auto_199092 - BLOCK
      ?auto_199093 - BLOCK
      ?auto_199094 - BLOCK
      ?auto_199095 - BLOCK
      ?auto_199096 - BLOCK
      ?auto_199097 - BLOCK
    )
    :vars
    (
      ?auto_199098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199097 ?auto_199098 ) ( ON-TABLE ?auto_199087 ) ( ON ?auto_199088 ?auto_199087 ) ( ON ?auto_199089 ?auto_199088 ) ( ON ?auto_199090 ?auto_199089 ) ( ON ?auto_199091 ?auto_199090 ) ( not ( = ?auto_199087 ?auto_199088 ) ) ( not ( = ?auto_199087 ?auto_199089 ) ) ( not ( = ?auto_199087 ?auto_199090 ) ) ( not ( = ?auto_199087 ?auto_199091 ) ) ( not ( = ?auto_199087 ?auto_199092 ) ) ( not ( = ?auto_199087 ?auto_199093 ) ) ( not ( = ?auto_199087 ?auto_199094 ) ) ( not ( = ?auto_199087 ?auto_199095 ) ) ( not ( = ?auto_199087 ?auto_199096 ) ) ( not ( = ?auto_199087 ?auto_199097 ) ) ( not ( = ?auto_199087 ?auto_199098 ) ) ( not ( = ?auto_199088 ?auto_199089 ) ) ( not ( = ?auto_199088 ?auto_199090 ) ) ( not ( = ?auto_199088 ?auto_199091 ) ) ( not ( = ?auto_199088 ?auto_199092 ) ) ( not ( = ?auto_199088 ?auto_199093 ) ) ( not ( = ?auto_199088 ?auto_199094 ) ) ( not ( = ?auto_199088 ?auto_199095 ) ) ( not ( = ?auto_199088 ?auto_199096 ) ) ( not ( = ?auto_199088 ?auto_199097 ) ) ( not ( = ?auto_199088 ?auto_199098 ) ) ( not ( = ?auto_199089 ?auto_199090 ) ) ( not ( = ?auto_199089 ?auto_199091 ) ) ( not ( = ?auto_199089 ?auto_199092 ) ) ( not ( = ?auto_199089 ?auto_199093 ) ) ( not ( = ?auto_199089 ?auto_199094 ) ) ( not ( = ?auto_199089 ?auto_199095 ) ) ( not ( = ?auto_199089 ?auto_199096 ) ) ( not ( = ?auto_199089 ?auto_199097 ) ) ( not ( = ?auto_199089 ?auto_199098 ) ) ( not ( = ?auto_199090 ?auto_199091 ) ) ( not ( = ?auto_199090 ?auto_199092 ) ) ( not ( = ?auto_199090 ?auto_199093 ) ) ( not ( = ?auto_199090 ?auto_199094 ) ) ( not ( = ?auto_199090 ?auto_199095 ) ) ( not ( = ?auto_199090 ?auto_199096 ) ) ( not ( = ?auto_199090 ?auto_199097 ) ) ( not ( = ?auto_199090 ?auto_199098 ) ) ( not ( = ?auto_199091 ?auto_199092 ) ) ( not ( = ?auto_199091 ?auto_199093 ) ) ( not ( = ?auto_199091 ?auto_199094 ) ) ( not ( = ?auto_199091 ?auto_199095 ) ) ( not ( = ?auto_199091 ?auto_199096 ) ) ( not ( = ?auto_199091 ?auto_199097 ) ) ( not ( = ?auto_199091 ?auto_199098 ) ) ( not ( = ?auto_199092 ?auto_199093 ) ) ( not ( = ?auto_199092 ?auto_199094 ) ) ( not ( = ?auto_199092 ?auto_199095 ) ) ( not ( = ?auto_199092 ?auto_199096 ) ) ( not ( = ?auto_199092 ?auto_199097 ) ) ( not ( = ?auto_199092 ?auto_199098 ) ) ( not ( = ?auto_199093 ?auto_199094 ) ) ( not ( = ?auto_199093 ?auto_199095 ) ) ( not ( = ?auto_199093 ?auto_199096 ) ) ( not ( = ?auto_199093 ?auto_199097 ) ) ( not ( = ?auto_199093 ?auto_199098 ) ) ( not ( = ?auto_199094 ?auto_199095 ) ) ( not ( = ?auto_199094 ?auto_199096 ) ) ( not ( = ?auto_199094 ?auto_199097 ) ) ( not ( = ?auto_199094 ?auto_199098 ) ) ( not ( = ?auto_199095 ?auto_199096 ) ) ( not ( = ?auto_199095 ?auto_199097 ) ) ( not ( = ?auto_199095 ?auto_199098 ) ) ( not ( = ?auto_199096 ?auto_199097 ) ) ( not ( = ?auto_199096 ?auto_199098 ) ) ( not ( = ?auto_199097 ?auto_199098 ) ) ( ON ?auto_199096 ?auto_199097 ) ( ON ?auto_199095 ?auto_199096 ) ( ON ?auto_199094 ?auto_199095 ) ( ON ?auto_199093 ?auto_199094 ) ( CLEAR ?auto_199091 ) ( ON ?auto_199092 ?auto_199093 ) ( CLEAR ?auto_199092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_199087 ?auto_199088 ?auto_199089 ?auto_199090 ?auto_199091 ?auto_199092 )
      ( MAKE-11PILE ?auto_199087 ?auto_199088 ?auto_199089 ?auto_199090 ?auto_199091 ?auto_199092 ?auto_199093 ?auto_199094 ?auto_199095 ?auto_199096 ?auto_199097 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_199110 - BLOCK
      ?auto_199111 - BLOCK
      ?auto_199112 - BLOCK
      ?auto_199113 - BLOCK
      ?auto_199114 - BLOCK
      ?auto_199115 - BLOCK
      ?auto_199116 - BLOCK
      ?auto_199117 - BLOCK
      ?auto_199118 - BLOCK
      ?auto_199119 - BLOCK
      ?auto_199120 - BLOCK
    )
    :vars
    (
      ?auto_199121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199120 ?auto_199121 ) ( ON-TABLE ?auto_199110 ) ( ON ?auto_199111 ?auto_199110 ) ( ON ?auto_199112 ?auto_199111 ) ( ON ?auto_199113 ?auto_199112 ) ( not ( = ?auto_199110 ?auto_199111 ) ) ( not ( = ?auto_199110 ?auto_199112 ) ) ( not ( = ?auto_199110 ?auto_199113 ) ) ( not ( = ?auto_199110 ?auto_199114 ) ) ( not ( = ?auto_199110 ?auto_199115 ) ) ( not ( = ?auto_199110 ?auto_199116 ) ) ( not ( = ?auto_199110 ?auto_199117 ) ) ( not ( = ?auto_199110 ?auto_199118 ) ) ( not ( = ?auto_199110 ?auto_199119 ) ) ( not ( = ?auto_199110 ?auto_199120 ) ) ( not ( = ?auto_199110 ?auto_199121 ) ) ( not ( = ?auto_199111 ?auto_199112 ) ) ( not ( = ?auto_199111 ?auto_199113 ) ) ( not ( = ?auto_199111 ?auto_199114 ) ) ( not ( = ?auto_199111 ?auto_199115 ) ) ( not ( = ?auto_199111 ?auto_199116 ) ) ( not ( = ?auto_199111 ?auto_199117 ) ) ( not ( = ?auto_199111 ?auto_199118 ) ) ( not ( = ?auto_199111 ?auto_199119 ) ) ( not ( = ?auto_199111 ?auto_199120 ) ) ( not ( = ?auto_199111 ?auto_199121 ) ) ( not ( = ?auto_199112 ?auto_199113 ) ) ( not ( = ?auto_199112 ?auto_199114 ) ) ( not ( = ?auto_199112 ?auto_199115 ) ) ( not ( = ?auto_199112 ?auto_199116 ) ) ( not ( = ?auto_199112 ?auto_199117 ) ) ( not ( = ?auto_199112 ?auto_199118 ) ) ( not ( = ?auto_199112 ?auto_199119 ) ) ( not ( = ?auto_199112 ?auto_199120 ) ) ( not ( = ?auto_199112 ?auto_199121 ) ) ( not ( = ?auto_199113 ?auto_199114 ) ) ( not ( = ?auto_199113 ?auto_199115 ) ) ( not ( = ?auto_199113 ?auto_199116 ) ) ( not ( = ?auto_199113 ?auto_199117 ) ) ( not ( = ?auto_199113 ?auto_199118 ) ) ( not ( = ?auto_199113 ?auto_199119 ) ) ( not ( = ?auto_199113 ?auto_199120 ) ) ( not ( = ?auto_199113 ?auto_199121 ) ) ( not ( = ?auto_199114 ?auto_199115 ) ) ( not ( = ?auto_199114 ?auto_199116 ) ) ( not ( = ?auto_199114 ?auto_199117 ) ) ( not ( = ?auto_199114 ?auto_199118 ) ) ( not ( = ?auto_199114 ?auto_199119 ) ) ( not ( = ?auto_199114 ?auto_199120 ) ) ( not ( = ?auto_199114 ?auto_199121 ) ) ( not ( = ?auto_199115 ?auto_199116 ) ) ( not ( = ?auto_199115 ?auto_199117 ) ) ( not ( = ?auto_199115 ?auto_199118 ) ) ( not ( = ?auto_199115 ?auto_199119 ) ) ( not ( = ?auto_199115 ?auto_199120 ) ) ( not ( = ?auto_199115 ?auto_199121 ) ) ( not ( = ?auto_199116 ?auto_199117 ) ) ( not ( = ?auto_199116 ?auto_199118 ) ) ( not ( = ?auto_199116 ?auto_199119 ) ) ( not ( = ?auto_199116 ?auto_199120 ) ) ( not ( = ?auto_199116 ?auto_199121 ) ) ( not ( = ?auto_199117 ?auto_199118 ) ) ( not ( = ?auto_199117 ?auto_199119 ) ) ( not ( = ?auto_199117 ?auto_199120 ) ) ( not ( = ?auto_199117 ?auto_199121 ) ) ( not ( = ?auto_199118 ?auto_199119 ) ) ( not ( = ?auto_199118 ?auto_199120 ) ) ( not ( = ?auto_199118 ?auto_199121 ) ) ( not ( = ?auto_199119 ?auto_199120 ) ) ( not ( = ?auto_199119 ?auto_199121 ) ) ( not ( = ?auto_199120 ?auto_199121 ) ) ( ON ?auto_199119 ?auto_199120 ) ( ON ?auto_199118 ?auto_199119 ) ( ON ?auto_199117 ?auto_199118 ) ( ON ?auto_199116 ?auto_199117 ) ( ON ?auto_199115 ?auto_199116 ) ( CLEAR ?auto_199113 ) ( ON ?auto_199114 ?auto_199115 ) ( CLEAR ?auto_199114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_199110 ?auto_199111 ?auto_199112 ?auto_199113 ?auto_199114 )
      ( MAKE-11PILE ?auto_199110 ?auto_199111 ?auto_199112 ?auto_199113 ?auto_199114 ?auto_199115 ?auto_199116 ?auto_199117 ?auto_199118 ?auto_199119 ?auto_199120 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_199133 - BLOCK
      ?auto_199134 - BLOCK
      ?auto_199135 - BLOCK
      ?auto_199136 - BLOCK
      ?auto_199137 - BLOCK
      ?auto_199138 - BLOCK
      ?auto_199139 - BLOCK
      ?auto_199140 - BLOCK
      ?auto_199141 - BLOCK
      ?auto_199142 - BLOCK
      ?auto_199143 - BLOCK
    )
    :vars
    (
      ?auto_199144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199143 ?auto_199144 ) ( ON-TABLE ?auto_199133 ) ( ON ?auto_199134 ?auto_199133 ) ( ON ?auto_199135 ?auto_199134 ) ( ON ?auto_199136 ?auto_199135 ) ( not ( = ?auto_199133 ?auto_199134 ) ) ( not ( = ?auto_199133 ?auto_199135 ) ) ( not ( = ?auto_199133 ?auto_199136 ) ) ( not ( = ?auto_199133 ?auto_199137 ) ) ( not ( = ?auto_199133 ?auto_199138 ) ) ( not ( = ?auto_199133 ?auto_199139 ) ) ( not ( = ?auto_199133 ?auto_199140 ) ) ( not ( = ?auto_199133 ?auto_199141 ) ) ( not ( = ?auto_199133 ?auto_199142 ) ) ( not ( = ?auto_199133 ?auto_199143 ) ) ( not ( = ?auto_199133 ?auto_199144 ) ) ( not ( = ?auto_199134 ?auto_199135 ) ) ( not ( = ?auto_199134 ?auto_199136 ) ) ( not ( = ?auto_199134 ?auto_199137 ) ) ( not ( = ?auto_199134 ?auto_199138 ) ) ( not ( = ?auto_199134 ?auto_199139 ) ) ( not ( = ?auto_199134 ?auto_199140 ) ) ( not ( = ?auto_199134 ?auto_199141 ) ) ( not ( = ?auto_199134 ?auto_199142 ) ) ( not ( = ?auto_199134 ?auto_199143 ) ) ( not ( = ?auto_199134 ?auto_199144 ) ) ( not ( = ?auto_199135 ?auto_199136 ) ) ( not ( = ?auto_199135 ?auto_199137 ) ) ( not ( = ?auto_199135 ?auto_199138 ) ) ( not ( = ?auto_199135 ?auto_199139 ) ) ( not ( = ?auto_199135 ?auto_199140 ) ) ( not ( = ?auto_199135 ?auto_199141 ) ) ( not ( = ?auto_199135 ?auto_199142 ) ) ( not ( = ?auto_199135 ?auto_199143 ) ) ( not ( = ?auto_199135 ?auto_199144 ) ) ( not ( = ?auto_199136 ?auto_199137 ) ) ( not ( = ?auto_199136 ?auto_199138 ) ) ( not ( = ?auto_199136 ?auto_199139 ) ) ( not ( = ?auto_199136 ?auto_199140 ) ) ( not ( = ?auto_199136 ?auto_199141 ) ) ( not ( = ?auto_199136 ?auto_199142 ) ) ( not ( = ?auto_199136 ?auto_199143 ) ) ( not ( = ?auto_199136 ?auto_199144 ) ) ( not ( = ?auto_199137 ?auto_199138 ) ) ( not ( = ?auto_199137 ?auto_199139 ) ) ( not ( = ?auto_199137 ?auto_199140 ) ) ( not ( = ?auto_199137 ?auto_199141 ) ) ( not ( = ?auto_199137 ?auto_199142 ) ) ( not ( = ?auto_199137 ?auto_199143 ) ) ( not ( = ?auto_199137 ?auto_199144 ) ) ( not ( = ?auto_199138 ?auto_199139 ) ) ( not ( = ?auto_199138 ?auto_199140 ) ) ( not ( = ?auto_199138 ?auto_199141 ) ) ( not ( = ?auto_199138 ?auto_199142 ) ) ( not ( = ?auto_199138 ?auto_199143 ) ) ( not ( = ?auto_199138 ?auto_199144 ) ) ( not ( = ?auto_199139 ?auto_199140 ) ) ( not ( = ?auto_199139 ?auto_199141 ) ) ( not ( = ?auto_199139 ?auto_199142 ) ) ( not ( = ?auto_199139 ?auto_199143 ) ) ( not ( = ?auto_199139 ?auto_199144 ) ) ( not ( = ?auto_199140 ?auto_199141 ) ) ( not ( = ?auto_199140 ?auto_199142 ) ) ( not ( = ?auto_199140 ?auto_199143 ) ) ( not ( = ?auto_199140 ?auto_199144 ) ) ( not ( = ?auto_199141 ?auto_199142 ) ) ( not ( = ?auto_199141 ?auto_199143 ) ) ( not ( = ?auto_199141 ?auto_199144 ) ) ( not ( = ?auto_199142 ?auto_199143 ) ) ( not ( = ?auto_199142 ?auto_199144 ) ) ( not ( = ?auto_199143 ?auto_199144 ) ) ( ON ?auto_199142 ?auto_199143 ) ( ON ?auto_199141 ?auto_199142 ) ( ON ?auto_199140 ?auto_199141 ) ( ON ?auto_199139 ?auto_199140 ) ( ON ?auto_199138 ?auto_199139 ) ( CLEAR ?auto_199136 ) ( ON ?auto_199137 ?auto_199138 ) ( CLEAR ?auto_199137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_199133 ?auto_199134 ?auto_199135 ?auto_199136 ?auto_199137 )
      ( MAKE-11PILE ?auto_199133 ?auto_199134 ?auto_199135 ?auto_199136 ?auto_199137 ?auto_199138 ?auto_199139 ?auto_199140 ?auto_199141 ?auto_199142 ?auto_199143 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_199156 - BLOCK
      ?auto_199157 - BLOCK
      ?auto_199158 - BLOCK
      ?auto_199159 - BLOCK
      ?auto_199160 - BLOCK
      ?auto_199161 - BLOCK
      ?auto_199162 - BLOCK
      ?auto_199163 - BLOCK
      ?auto_199164 - BLOCK
      ?auto_199165 - BLOCK
      ?auto_199166 - BLOCK
    )
    :vars
    (
      ?auto_199167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199166 ?auto_199167 ) ( ON-TABLE ?auto_199156 ) ( ON ?auto_199157 ?auto_199156 ) ( ON ?auto_199158 ?auto_199157 ) ( not ( = ?auto_199156 ?auto_199157 ) ) ( not ( = ?auto_199156 ?auto_199158 ) ) ( not ( = ?auto_199156 ?auto_199159 ) ) ( not ( = ?auto_199156 ?auto_199160 ) ) ( not ( = ?auto_199156 ?auto_199161 ) ) ( not ( = ?auto_199156 ?auto_199162 ) ) ( not ( = ?auto_199156 ?auto_199163 ) ) ( not ( = ?auto_199156 ?auto_199164 ) ) ( not ( = ?auto_199156 ?auto_199165 ) ) ( not ( = ?auto_199156 ?auto_199166 ) ) ( not ( = ?auto_199156 ?auto_199167 ) ) ( not ( = ?auto_199157 ?auto_199158 ) ) ( not ( = ?auto_199157 ?auto_199159 ) ) ( not ( = ?auto_199157 ?auto_199160 ) ) ( not ( = ?auto_199157 ?auto_199161 ) ) ( not ( = ?auto_199157 ?auto_199162 ) ) ( not ( = ?auto_199157 ?auto_199163 ) ) ( not ( = ?auto_199157 ?auto_199164 ) ) ( not ( = ?auto_199157 ?auto_199165 ) ) ( not ( = ?auto_199157 ?auto_199166 ) ) ( not ( = ?auto_199157 ?auto_199167 ) ) ( not ( = ?auto_199158 ?auto_199159 ) ) ( not ( = ?auto_199158 ?auto_199160 ) ) ( not ( = ?auto_199158 ?auto_199161 ) ) ( not ( = ?auto_199158 ?auto_199162 ) ) ( not ( = ?auto_199158 ?auto_199163 ) ) ( not ( = ?auto_199158 ?auto_199164 ) ) ( not ( = ?auto_199158 ?auto_199165 ) ) ( not ( = ?auto_199158 ?auto_199166 ) ) ( not ( = ?auto_199158 ?auto_199167 ) ) ( not ( = ?auto_199159 ?auto_199160 ) ) ( not ( = ?auto_199159 ?auto_199161 ) ) ( not ( = ?auto_199159 ?auto_199162 ) ) ( not ( = ?auto_199159 ?auto_199163 ) ) ( not ( = ?auto_199159 ?auto_199164 ) ) ( not ( = ?auto_199159 ?auto_199165 ) ) ( not ( = ?auto_199159 ?auto_199166 ) ) ( not ( = ?auto_199159 ?auto_199167 ) ) ( not ( = ?auto_199160 ?auto_199161 ) ) ( not ( = ?auto_199160 ?auto_199162 ) ) ( not ( = ?auto_199160 ?auto_199163 ) ) ( not ( = ?auto_199160 ?auto_199164 ) ) ( not ( = ?auto_199160 ?auto_199165 ) ) ( not ( = ?auto_199160 ?auto_199166 ) ) ( not ( = ?auto_199160 ?auto_199167 ) ) ( not ( = ?auto_199161 ?auto_199162 ) ) ( not ( = ?auto_199161 ?auto_199163 ) ) ( not ( = ?auto_199161 ?auto_199164 ) ) ( not ( = ?auto_199161 ?auto_199165 ) ) ( not ( = ?auto_199161 ?auto_199166 ) ) ( not ( = ?auto_199161 ?auto_199167 ) ) ( not ( = ?auto_199162 ?auto_199163 ) ) ( not ( = ?auto_199162 ?auto_199164 ) ) ( not ( = ?auto_199162 ?auto_199165 ) ) ( not ( = ?auto_199162 ?auto_199166 ) ) ( not ( = ?auto_199162 ?auto_199167 ) ) ( not ( = ?auto_199163 ?auto_199164 ) ) ( not ( = ?auto_199163 ?auto_199165 ) ) ( not ( = ?auto_199163 ?auto_199166 ) ) ( not ( = ?auto_199163 ?auto_199167 ) ) ( not ( = ?auto_199164 ?auto_199165 ) ) ( not ( = ?auto_199164 ?auto_199166 ) ) ( not ( = ?auto_199164 ?auto_199167 ) ) ( not ( = ?auto_199165 ?auto_199166 ) ) ( not ( = ?auto_199165 ?auto_199167 ) ) ( not ( = ?auto_199166 ?auto_199167 ) ) ( ON ?auto_199165 ?auto_199166 ) ( ON ?auto_199164 ?auto_199165 ) ( ON ?auto_199163 ?auto_199164 ) ( ON ?auto_199162 ?auto_199163 ) ( ON ?auto_199161 ?auto_199162 ) ( ON ?auto_199160 ?auto_199161 ) ( CLEAR ?auto_199158 ) ( ON ?auto_199159 ?auto_199160 ) ( CLEAR ?auto_199159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_199156 ?auto_199157 ?auto_199158 ?auto_199159 )
      ( MAKE-11PILE ?auto_199156 ?auto_199157 ?auto_199158 ?auto_199159 ?auto_199160 ?auto_199161 ?auto_199162 ?auto_199163 ?auto_199164 ?auto_199165 ?auto_199166 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_199179 - BLOCK
      ?auto_199180 - BLOCK
      ?auto_199181 - BLOCK
      ?auto_199182 - BLOCK
      ?auto_199183 - BLOCK
      ?auto_199184 - BLOCK
      ?auto_199185 - BLOCK
      ?auto_199186 - BLOCK
      ?auto_199187 - BLOCK
      ?auto_199188 - BLOCK
      ?auto_199189 - BLOCK
    )
    :vars
    (
      ?auto_199190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199189 ?auto_199190 ) ( ON-TABLE ?auto_199179 ) ( ON ?auto_199180 ?auto_199179 ) ( ON ?auto_199181 ?auto_199180 ) ( not ( = ?auto_199179 ?auto_199180 ) ) ( not ( = ?auto_199179 ?auto_199181 ) ) ( not ( = ?auto_199179 ?auto_199182 ) ) ( not ( = ?auto_199179 ?auto_199183 ) ) ( not ( = ?auto_199179 ?auto_199184 ) ) ( not ( = ?auto_199179 ?auto_199185 ) ) ( not ( = ?auto_199179 ?auto_199186 ) ) ( not ( = ?auto_199179 ?auto_199187 ) ) ( not ( = ?auto_199179 ?auto_199188 ) ) ( not ( = ?auto_199179 ?auto_199189 ) ) ( not ( = ?auto_199179 ?auto_199190 ) ) ( not ( = ?auto_199180 ?auto_199181 ) ) ( not ( = ?auto_199180 ?auto_199182 ) ) ( not ( = ?auto_199180 ?auto_199183 ) ) ( not ( = ?auto_199180 ?auto_199184 ) ) ( not ( = ?auto_199180 ?auto_199185 ) ) ( not ( = ?auto_199180 ?auto_199186 ) ) ( not ( = ?auto_199180 ?auto_199187 ) ) ( not ( = ?auto_199180 ?auto_199188 ) ) ( not ( = ?auto_199180 ?auto_199189 ) ) ( not ( = ?auto_199180 ?auto_199190 ) ) ( not ( = ?auto_199181 ?auto_199182 ) ) ( not ( = ?auto_199181 ?auto_199183 ) ) ( not ( = ?auto_199181 ?auto_199184 ) ) ( not ( = ?auto_199181 ?auto_199185 ) ) ( not ( = ?auto_199181 ?auto_199186 ) ) ( not ( = ?auto_199181 ?auto_199187 ) ) ( not ( = ?auto_199181 ?auto_199188 ) ) ( not ( = ?auto_199181 ?auto_199189 ) ) ( not ( = ?auto_199181 ?auto_199190 ) ) ( not ( = ?auto_199182 ?auto_199183 ) ) ( not ( = ?auto_199182 ?auto_199184 ) ) ( not ( = ?auto_199182 ?auto_199185 ) ) ( not ( = ?auto_199182 ?auto_199186 ) ) ( not ( = ?auto_199182 ?auto_199187 ) ) ( not ( = ?auto_199182 ?auto_199188 ) ) ( not ( = ?auto_199182 ?auto_199189 ) ) ( not ( = ?auto_199182 ?auto_199190 ) ) ( not ( = ?auto_199183 ?auto_199184 ) ) ( not ( = ?auto_199183 ?auto_199185 ) ) ( not ( = ?auto_199183 ?auto_199186 ) ) ( not ( = ?auto_199183 ?auto_199187 ) ) ( not ( = ?auto_199183 ?auto_199188 ) ) ( not ( = ?auto_199183 ?auto_199189 ) ) ( not ( = ?auto_199183 ?auto_199190 ) ) ( not ( = ?auto_199184 ?auto_199185 ) ) ( not ( = ?auto_199184 ?auto_199186 ) ) ( not ( = ?auto_199184 ?auto_199187 ) ) ( not ( = ?auto_199184 ?auto_199188 ) ) ( not ( = ?auto_199184 ?auto_199189 ) ) ( not ( = ?auto_199184 ?auto_199190 ) ) ( not ( = ?auto_199185 ?auto_199186 ) ) ( not ( = ?auto_199185 ?auto_199187 ) ) ( not ( = ?auto_199185 ?auto_199188 ) ) ( not ( = ?auto_199185 ?auto_199189 ) ) ( not ( = ?auto_199185 ?auto_199190 ) ) ( not ( = ?auto_199186 ?auto_199187 ) ) ( not ( = ?auto_199186 ?auto_199188 ) ) ( not ( = ?auto_199186 ?auto_199189 ) ) ( not ( = ?auto_199186 ?auto_199190 ) ) ( not ( = ?auto_199187 ?auto_199188 ) ) ( not ( = ?auto_199187 ?auto_199189 ) ) ( not ( = ?auto_199187 ?auto_199190 ) ) ( not ( = ?auto_199188 ?auto_199189 ) ) ( not ( = ?auto_199188 ?auto_199190 ) ) ( not ( = ?auto_199189 ?auto_199190 ) ) ( ON ?auto_199188 ?auto_199189 ) ( ON ?auto_199187 ?auto_199188 ) ( ON ?auto_199186 ?auto_199187 ) ( ON ?auto_199185 ?auto_199186 ) ( ON ?auto_199184 ?auto_199185 ) ( ON ?auto_199183 ?auto_199184 ) ( CLEAR ?auto_199181 ) ( ON ?auto_199182 ?auto_199183 ) ( CLEAR ?auto_199182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_199179 ?auto_199180 ?auto_199181 ?auto_199182 )
      ( MAKE-11PILE ?auto_199179 ?auto_199180 ?auto_199181 ?auto_199182 ?auto_199183 ?auto_199184 ?auto_199185 ?auto_199186 ?auto_199187 ?auto_199188 ?auto_199189 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_199202 - BLOCK
      ?auto_199203 - BLOCK
      ?auto_199204 - BLOCK
      ?auto_199205 - BLOCK
      ?auto_199206 - BLOCK
      ?auto_199207 - BLOCK
      ?auto_199208 - BLOCK
      ?auto_199209 - BLOCK
      ?auto_199210 - BLOCK
      ?auto_199211 - BLOCK
      ?auto_199212 - BLOCK
    )
    :vars
    (
      ?auto_199213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199212 ?auto_199213 ) ( ON-TABLE ?auto_199202 ) ( ON ?auto_199203 ?auto_199202 ) ( not ( = ?auto_199202 ?auto_199203 ) ) ( not ( = ?auto_199202 ?auto_199204 ) ) ( not ( = ?auto_199202 ?auto_199205 ) ) ( not ( = ?auto_199202 ?auto_199206 ) ) ( not ( = ?auto_199202 ?auto_199207 ) ) ( not ( = ?auto_199202 ?auto_199208 ) ) ( not ( = ?auto_199202 ?auto_199209 ) ) ( not ( = ?auto_199202 ?auto_199210 ) ) ( not ( = ?auto_199202 ?auto_199211 ) ) ( not ( = ?auto_199202 ?auto_199212 ) ) ( not ( = ?auto_199202 ?auto_199213 ) ) ( not ( = ?auto_199203 ?auto_199204 ) ) ( not ( = ?auto_199203 ?auto_199205 ) ) ( not ( = ?auto_199203 ?auto_199206 ) ) ( not ( = ?auto_199203 ?auto_199207 ) ) ( not ( = ?auto_199203 ?auto_199208 ) ) ( not ( = ?auto_199203 ?auto_199209 ) ) ( not ( = ?auto_199203 ?auto_199210 ) ) ( not ( = ?auto_199203 ?auto_199211 ) ) ( not ( = ?auto_199203 ?auto_199212 ) ) ( not ( = ?auto_199203 ?auto_199213 ) ) ( not ( = ?auto_199204 ?auto_199205 ) ) ( not ( = ?auto_199204 ?auto_199206 ) ) ( not ( = ?auto_199204 ?auto_199207 ) ) ( not ( = ?auto_199204 ?auto_199208 ) ) ( not ( = ?auto_199204 ?auto_199209 ) ) ( not ( = ?auto_199204 ?auto_199210 ) ) ( not ( = ?auto_199204 ?auto_199211 ) ) ( not ( = ?auto_199204 ?auto_199212 ) ) ( not ( = ?auto_199204 ?auto_199213 ) ) ( not ( = ?auto_199205 ?auto_199206 ) ) ( not ( = ?auto_199205 ?auto_199207 ) ) ( not ( = ?auto_199205 ?auto_199208 ) ) ( not ( = ?auto_199205 ?auto_199209 ) ) ( not ( = ?auto_199205 ?auto_199210 ) ) ( not ( = ?auto_199205 ?auto_199211 ) ) ( not ( = ?auto_199205 ?auto_199212 ) ) ( not ( = ?auto_199205 ?auto_199213 ) ) ( not ( = ?auto_199206 ?auto_199207 ) ) ( not ( = ?auto_199206 ?auto_199208 ) ) ( not ( = ?auto_199206 ?auto_199209 ) ) ( not ( = ?auto_199206 ?auto_199210 ) ) ( not ( = ?auto_199206 ?auto_199211 ) ) ( not ( = ?auto_199206 ?auto_199212 ) ) ( not ( = ?auto_199206 ?auto_199213 ) ) ( not ( = ?auto_199207 ?auto_199208 ) ) ( not ( = ?auto_199207 ?auto_199209 ) ) ( not ( = ?auto_199207 ?auto_199210 ) ) ( not ( = ?auto_199207 ?auto_199211 ) ) ( not ( = ?auto_199207 ?auto_199212 ) ) ( not ( = ?auto_199207 ?auto_199213 ) ) ( not ( = ?auto_199208 ?auto_199209 ) ) ( not ( = ?auto_199208 ?auto_199210 ) ) ( not ( = ?auto_199208 ?auto_199211 ) ) ( not ( = ?auto_199208 ?auto_199212 ) ) ( not ( = ?auto_199208 ?auto_199213 ) ) ( not ( = ?auto_199209 ?auto_199210 ) ) ( not ( = ?auto_199209 ?auto_199211 ) ) ( not ( = ?auto_199209 ?auto_199212 ) ) ( not ( = ?auto_199209 ?auto_199213 ) ) ( not ( = ?auto_199210 ?auto_199211 ) ) ( not ( = ?auto_199210 ?auto_199212 ) ) ( not ( = ?auto_199210 ?auto_199213 ) ) ( not ( = ?auto_199211 ?auto_199212 ) ) ( not ( = ?auto_199211 ?auto_199213 ) ) ( not ( = ?auto_199212 ?auto_199213 ) ) ( ON ?auto_199211 ?auto_199212 ) ( ON ?auto_199210 ?auto_199211 ) ( ON ?auto_199209 ?auto_199210 ) ( ON ?auto_199208 ?auto_199209 ) ( ON ?auto_199207 ?auto_199208 ) ( ON ?auto_199206 ?auto_199207 ) ( ON ?auto_199205 ?auto_199206 ) ( CLEAR ?auto_199203 ) ( ON ?auto_199204 ?auto_199205 ) ( CLEAR ?auto_199204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_199202 ?auto_199203 ?auto_199204 )
      ( MAKE-11PILE ?auto_199202 ?auto_199203 ?auto_199204 ?auto_199205 ?auto_199206 ?auto_199207 ?auto_199208 ?auto_199209 ?auto_199210 ?auto_199211 ?auto_199212 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_199225 - BLOCK
      ?auto_199226 - BLOCK
      ?auto_199227 - BLOCK
      ?auto_199228 - BLOCK
      ?auto_199229 - BLOCK
      ?auto_199230 - BLOCK
      ?auto_199231 - BLOCK
      ?auto_199232 - BLOCK
      ?auto_199233 - BLOCK
      ?auto_199234 - BLOCK
      ?auto_199235 - BLOCK
    )
    :vars
    (
      ?auto_199236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199235 ?auto_199236 ) ( ON-TABLE ?auto_199225 ) ( ON ?auto_199226 ?auto_199225 ) ( not ( = ?auto_199225 ?auto_199226 ) ) ( not ( = ?auto_199225 ?auto_199227 ) ) ( not ( = ?auto_199225 ?auto_199228 ) ) ( not ( = ?auto_199225 ?auto_199229 ) ) ( not ( = ?auto_199225 ?auto_199230 ) ) ( not ( = ?auto_199225 ?auto_199231 ) ) ( not ( = ?auto_199225 ?auto_199232 ) ) ( not ( = ?auto_199225 ?auto_199233 ) ) ( not ( = ?auto_199225 ?auto_199234 ) ) ( not ( = ?auto_199225 ?auto_199235 ) ) ( not ( = ?auto_199225 ?auto_199236 ) ) ( not ( = ?auto_199226 ?auto_199227 ) ) ( not ( = ?auto_199226 ?auto_199228 ) ) ( not ( = ?auto_199226 ?auto_199229 ) ) ( not ( = ?auto_199226 ?auto_199230 ) ) ( not ( = ?auto_199226 ?auto_199231 ) ) ( not ( = ?auto_199226 ?auto_199232 ) ) ( not ( = ?auto_199226 ?auto_199233 ) ) ( not ( = ?auto_199226 ?auto_199234 ) ) ( not ( = ?auto_199226 ?auto_199235 ) ) ( not ( = ?auto_199226 ?auto_199236 ) ) ( not ( = ?auto_199227 ?auto_199228 ) ) ( not ( = ?auto_199227 ?auto_199229 ) ) ( not ( = ?auto_199227 ?auto_199230 ) ) ( not ( = ?auto_199227 ?auto_199231 ) ) ( not ( = ?auto_199227 ?auto_199232 ) ) ( not ( = ?auto_199227 ?auto_199233 ) ) ( not ( = ?auto_199227 ?auto_199234 ) ) ( not ( = ?auto_199227 ?auto_199235 ) ) ( not ( = ?auto_199227 ?auto_199236 ) ) ( not ( = ?auto_199228 ?auto_199229 ) ) ( not ( = ?auto_199228 ?auto_199230 ) ) ( not ( = ?auto_199228 ?auto_199231 ) ) ( not ( = ?auto_199228 ?auto_199232 ) ) ( not ( = ?auto_199228 ?auto_199233 ) ) ( not ( = ?auto_199228 ?auto_199234 ) ) ( not ( = ?auto_199228 ?auto_199235 ) ) ( not ( = ?auto_199228 ?auto_199236 ) ) ( not ( = ?auto_199229 ?auto_199230 ) ) ( not ( = ?auto_199229 ?auto_199231 ) ) ( not ( = ?auto_199229 ?auto_199232 ) ) ( not ( = ?auto_199229 ?auto_199233 ) ) ( not ( = ?auto_199229 ?auto_199234 ) ) ( not ( = ?auto_199229 ?auto_199235 ) ) ( not ( = ?auto_199229 ?auto_199236 ) ) ( not ( = ?auto_199230 ?auto_199231 ) ) ( not ( = ?auto_199230 ?auto_199232 ) ) ( not ( = ?auto_199230 ?auto_199233 ) ) ( not ( = ?auto_199230 ?auto_199234 ) ) ( not ( = ?auto_199230 ?auto_199235 ) ) ( not ( = ?auto_199230 ?auto_199236 ) ) ( not ( = ?auto_199231 ?auto_199232 ) ) ( not ( = ?auto_199231 ?auto_199233 ) ) ( not ( = ?auto_199231 ?auto_199234 ) ) ( not ( = ?auto_199231 ?auto_199235 ) ) ( not ( = ?auto_199231 ?auto_199236 ) ) ( not ( = ?auto_199232 ?auto_199233 ) ) ( not ( = ?auto_199232 ?auto_199234 ) ) ( not ( = ?auto_199232 ?auto_199235 ) ) ( not ( = ?auto_199232 ?auto_199236 ) ) ( not ( = ?auto_199233 ?auto_199234 ) ) ( not ( = ?auto_199233 ?auto_199235 ) ) ( not ( = ?auto_199233 ?auto_199236 ) ) ( not ( = ?auto_199234 ?auto_199235 ) ) ( not ( = ?auto_199234 ?auto_199236 ) ) ( not ( = ?auto_199235 ?auto_199236 ) ) ( ON ?auto_199234 ?auto_199235 ) ( ON ?auto_199233 ?auto_199234 ) ( ON ?auto_199232 ?auto_199233 ) ( ON ?auto_199231 ?auto_199232 ) ( ON ?auto_199230 ?auto_199231 ) ( ON ?auto_199229 ?auto_199230 ) ( ON ?auto_199228 ?auto_199229 ) ( CLEAR ?auto_199226 ) ( ON ?auto_199227 ?auto_199228 ) ( CLEAR ?auto_199227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_199225 ?auto_199226 ?auto_199227 )
      ( MAKE-11PILE ?auto_199225 ?auto_199226 ?auto_199227 ?auto_199228 ?auto_199229 ?auto_199230 ?auto_199231 ?auto_199232 ?auto_199233 ?auto_199234 ?auto_199235 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_199248 - BLOCK
      ?auto_199249 - BLOCK
      ?auto_199250 - BLOCK
      ?auto_199251 - BLOCK
      ?auto_199252 - BLOCK
      ?auto_199253 - BLOCK
      ?auto_199254 - BLOCK
      ?auto_199255 - BLOCK
      ?auto_199256 - BLOCK
      ?auto_199257 - BLOCK
      ?auto_199258 - BLOCK
    )
    :vars
    (
      ?auto_199259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199258 ?auto_199259 ) ( ON-TABLE ?auto_199248 ) ( not ( = ?auto_199248 ?auto_199249 ) ) ( not ( = ?auto_199248 ?auto_199250 ) ) ( not ( = ?auto_199248 ?auto_199251 ) ) ( not ( = ?auto_199248 ?auto_199252 ) ) ( not ( = ?auto_199248 ?auto_199253 ) ) ( not ( = ?auto_199248 ?auto_199254 ) ) ( not ( = ?auto_199248 ?auto_199255 ) ) ( not ( = ?auto_199248 ?auto_199256 ) ) ( not ( = ?auto_199248 ?auto_199257 ) ) ( not ( = ?auto_199248 ?auto_199258 ) ) ( not ( = ?auto_199248 ?auto_199259 ) ) ( not ( = ?auto_199249 ?auto_199250 ) ) ( not ( = ?auto_199249 ?auto_199251 ) ) ( not ( = ?auto_199249 ?auto_199252 ) ) ( not ( = ?auto_199249 ?auto_199253 ) ) ( not ( = ?auto_199249 ?auto_199254 ) ) ( not ( = ?auto_199249 ?auto_199255 ) ) ( not ( = ?auto_199249 ?auto_199256 ) ) ( not ( = ?auto_199249 ?auto_199257 ) ) ( not ( = ?auto_199249 ?auto_199258 ) ) ( not ( = ?auto_199249 ?auto_199259 ) ) ( not ( = ?auto_199250 ?auto_199251 ) ) ( not ( = ?auto_199250 ?auto_199252 ) ) ( not ( = ?auto_199250 ?auto_199253 ) ) ( not ( = ?auto_199250 ?auto_199254 ) ) ( not ( = ?auto_199250 ?auto_199255 ) ) ( not ( = ?auto_199250 ?auto_199256 ) ) ( not ( = ?auto_199250 ?auto_199257 ) ) ( not ( = ?auto_199250 ?auto_199258 ) ) ( not ( = ?auto_199250 ?auto_199259 ) ) ( not ( = ?auto_199251 ?auto_199252 ) ) ( not ( = ?auto_199251 ?auto_199253 ) ) ( not ( = ?auto_199251 ?auto_199254 ) ) ( not ( = ?auto_199251 ?auto_199255 ) ) ( not ( = ?auto_199251 ?auto_199256 ) ) ( not ( = ?auto_199251 ?auto_199257 ) ) ( not ( = ?auto_199251 ?auto_199258 ) ) ( not ( = ?auto_199251 ?auto_199259 ) ) ( not ( = ?auto_199252 ?auto_199253 ) ) ( not ( = ?auto_199252 ?auto_199254 ) ) ( not ( = ?auto_199252 ?auto_199255 ) ) ( not ( = ?auto_199252 ?auto_199256 ) ) ( not ( = ?auto_199252 ?auto_199257 ) ) ( not ( = ?auto_199252 ?auto_199258 ) ) ( not ( = ?auto_199252 ?auto_199259 ) ) ( not ( = ?auto_199253 ?auto_199254 ) ) ( not ( = ?auto_199253 ?auto_199255 ) ) ( not ( = ?auto_199253 ?auto_199256 ) ) ( not ( = ?auto_199253 ?auto_199257 ) ) ( not ( = ?auto_199253 ?auto_199258 ) ) ( not ( = ?auto_199253 ?auto_199259 ) ) ( not ( = ?auto_199254 ?auto_199255 ) ) ( not ( = ?auto_199254 ?auto_199256 ) ) ( not ( = ?auto_199254 ?auto_199257 ) ) ( not ( = ?auto_199254 ?auto_199258 ) ) ( not ( = ?auto_199254 ?auto_199259 ) ) ( not ( = ?auto_199255 ?auto_199256 ) ) ( not ( = ?auto_199255 ?auto_199257 ) ) ( not ( = ?auto_199255 ?auto_199258 ) ) ( not ( = ?auto_199255 ?auto_199259 ) ) ( not ( = ?auto_199256 ?auto_199257 ) ) ( not ( = ?auto_199256 ?auto_199258 ) ) ( not ( = ?auto_199256 ?auto_199259 ) ) ( not ( = ?auto_199257 ?auto_199258 ) ) ( not ( = ?auto_199257 ?auto_199259 ) ) ( not ( = ?auto_199258 ?auto_199259 ) ) ( ON ?auto_199257 ?auto_199258 ) ( ON ?auto_199256 ?auto_199257 ) ( ON ?auto_199255 ?auto_199256 ) ( ON ?auto_199254 ?auto_199255 ) ( ON ?auto_199253 ?auto_199254 ) ( ON ?auto_199252 ?auto_199253 ) ( ON ?auto_199251 ?auto_199252 ) ( ON ?auto_199250 ?auto_199251 ) ( CLEAR ?auto_199248 ) ( ON ?auto_199249 ?auto_199250 ) ( CLEAR ?auto_199249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_199248 ?auto_199249 )
      ( MAKE-11PILE ?auto_199248 ?auto_199249 ?auto_199250 ?auto_199251 ?auto_199252 ?auto_199253 ?auto_199254 ?auto_199255 ?auto_199256 ?auto_199257 ?auto_199258 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_199271 - BLOCK
      ?auto_199272 - BLOCK
      ?auto_199273 - BLOCK
      ?auto_199274 - BLOCK
      ?auto_199275 - BLOCK
      ?auto_199276 - BLOCK
      ?auto_199277 - BLOCK
      ?auto_199278 - BLOCK
      ?auto_199279 - BLOCK
      ?auto_199280 - BLOCK
      ?auto_199281 - BLOCK
    )
    :vars
    (
      ?auto_199282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199281 ?auto_199282 ) ( ON-TABLE ?auto_199271 ) ( not ( = ?auto_199271 ?auto_199272 ) ) ( not ( = ?auto_199271 ?auto_199273 ) ) ( not ( = ?auto_199271 ?auto_199274 ) ) ( not ( = ?auto_199271 ?auto_199275 ) ) ( not ( = ?auto_199271 ?auto_199276 ) ) ( not ( = ?auto_199271 ?auto_199277 ) ) ( not ( = ?auto_199271 ?auto_199278 ) ) ( not ( = ?auto_199271 ?auto_199279 ) ) ( not ( = ?auto_199271 ?auto_199280 ) ) ( not ( = ?auto_199271 ?auto_199281 ) ) ( not ( = ?auto_199271 ?auto_199282 ) ) ( not ( = ?auto_199272 ?auto_199273 ) ) ( not ( = ?auto_199272 ?auto_199274 ) ) ( not ( = ?auto_199272 ?auto_199275 ) ) ( not ( = ?auto_199272 ?auto_199276 ) ) ( not ( = ?auto_199272 ?auto_199277 ) ) ( not ( = ?auto_199272 ?auto_199278 ) ) ( not ( = ?auto_199272 ?auto_199279 ) ) ( not ( = ?auto_199272 ?auto_199280 ) ) ( not ( = ?auto_199272 ?auto_199281 ) ) ( not ( = ?auto_199272 ?auto_199282 ) ) ( not ( = ?auto_199273 ?auto_199274 ) ) ( not ( = ?auto_199273 ?auto_199275 ) ) ( not ( = ?auto_199273 ?auto_199276 ) ) ( not ( = ?auto_199273 ?auto_199277 ) ) ( not ( = ?auto_199273 ?auto_199278 ) ) ( not ( = ?auto_199273 ?auto_199279 ) ) ( not ( = ?auto_199273 ?auto_199280 ) ) ( not ( = ?auto_199273 ?auto_199281 ) ) ( not ( = ?auto_199273 ?auto_199282 ) ) ( not ( = ?auto_199274 ?auto_199275 ) ) ( not ( = ?auto_199274 ?auto_199276 ) ) ( not ( = ?auto_199274 ?auto_199277 ) ) ( not ( = ?auto_199274 ?auto_199278 ) ) ( not ( = ?auto_199274 ?auto_199279 ) ) ( not ( = ?auto_199274 ?auto_199280 ) ) ( not ( = ?auto_199274 ?auto_199281 ) ) ( not ( = ?auto_199274 ?auto_199282 ) ) ( not ( = ?auto_199275 ?auto_199276 ) ) ( not ( = ?auto_199275 ?auto_199277 ) ) ( not ( = ?auto_199275 ?auto_199278 ) ) ( not ( = ?auto_199275 ?auto_199279 ) ) ( not ( = ?auto_199275 ?auto_199280 ) ) ( not ( = ?auto_199275 ?auto_199281 ) ) ( not ( = ?auto_199275 ?auto_199282 ) ) ( not ( = ?auto_199276 ?auto_199277 ) ) ( not ( = ?auto_199276 ?auto_199278 ) ) ( not ( = ?auto_199276 ?auto_199279 ) ) ( not ( = ?auto_199276 ?auto_199280 ) ) ( not ( = ?auto_199276 ?auto_199281 ) ) ( not ( = ?auto_199276 ?auto_199282 ) ) ( not ( = ?auto_199277 ?auto_199278 ) ) ( not ( = ?auto_199277 ?auto_199279 ) ) ( not ( = ?auto_199277 ?auto_199280 ) ) ( not ( = ?auto_199277 ?auto_199281 ) ) ( not ( = ?auto_199277 ?auto_199282 ) ) ( not ( = ?auto_199278 ?auto_199279 ) ) ( not ( = ?auto_199278 ?auto_199280 ) ) ( not ( = ?auto_199278 ?auto_199281 ) ) ( not ( = ?auto_199278 ?auto_199282 ) ) ( not ( = ?auto_199279 ?auto_199280 ) ) ( not ( = ?auto_199279 ?auto_199281 ) ) ( not ( = ?auto_199279 ?auto_199282 ) ) ( not ( = ?auto_199280 ?auto_199281 ) ) ( not ( = ?auto_199280 ?auto_199282 ) ) ( not ( = ?auto_199281 ?auto_199282 ) ) ( ON ?auto_199280 ?auto_199281 ) ( ON ?auto_199279 ?auto_199280 ) ( ON ?auto_199278 ?auto_199279 ) ( ON ?auto_199277 ?auto_199278 ) ( ON ?auto_199276 ?auto_199277 ) ( ON ?auto_199275 ?auto_199276 ) ( ON ?auto_199274 ?auto_199275 ) ( ON ?auto_199273 ?auto_199274 ) ( CLEAR ?auto_199271 ) ( ON ?auto_199272 ?auto_199273 ) ( CLEAR ?auto_199272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_199271 ?auto_199272 )
      ( MAKE-11PILE ?auto_199271 ?auto_199272 ?auto_199273 ?auto_199274 ?auto_199275 ?auto_199276 ?auto_199277 ?auto_199278 ?auto_199279 ?auto_199280 ?auto_199281 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_199294 - BLOCK
      ?auto_199295 - BLOCK
      ?auto_199296 - BLOCK
      ?auto_199297 - BLOCK
      ?auto_199298 - BLOCK
      ?auto_199299 - BLOCK
      ?auto_199300 - BLOCK
      ?auto_199301 - BLOCK
      ?auto_199302 - BLOCK
      ?auto_199303 - BLOCK
      ?auto_199304 - BLOCK
    )
    :vars
    (
      ?auto_199305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199304 ?auto_199305 ) ( not ( = ?auto_199294 ?auto_199295 ) ) ( not ( = ?auto_199294 ?auto_199296 ) ) ( not ( = ?auto_199294 ?auto_199297 ) ) ( not ( = ?auto_199294 ?auto_199298 ) ) ( not ( = ?auto_199294 ?auto_199299 ) ) ( not ( = ?auto_199294 ?auto_199300 ) ) ( not ( = ?auto_199294 ?auto_199301 ) ) ( not ( = ?auto_199294 ?auto_199302 ) ) ( not ( = ?auto_199294 ?auto_199303 ) ) ( not ( = ?auto_199294 ?auto_199304 ) ) ( not ( = ?auto_199294 ?auto_199305 ) ) ( not ( = ?auto_199295 ?auto_199296 ) ) ( not ( = ?auto_199295 ?auto_199297 ) ) ( not ( = ?auto_199295 ?auto_199298 ) ) ( not ( = ?auto_199295 ?auto_199299 ) ) ( not ( = ?auto_199295 ?auto_199300 ) ) ( not ( = ?auto_199295 ?auto_199301 ) ) ( not ( = ?auto_199295 ?auto_199302 ) ) ( not ( = ?auto_199295 ?auto_199303 ) ) ( not ( = ?auto_199295 ?auto_199304 ) ) ( not ( = ?auto_199295 ?auto_199305 ) ) ( not ( = ?auto_199296 ?auto_199297 ) ) ( not ( = ?auto_199296 ?auto_199298 ) ) ( not ( = ?auto_199296 ?auto_199299 ) ) ( not ( = ?auto_199296 ?auto_199300 ) ) ( not ( = ?auto_199296 ?auto_199301 ) ) ( not ( = ?auto_199296 ?auto_199302 ) ) ( not ( = ?auto_199296 ?auto_199303 ) ) ( not ( = ?auto_199296 ?auto_199304 ) ) ( not ( = ?auto_199296 ?auto_199305 ) ) ( not ( = ?auto_199297 ?auto_199298 ) ) ( not ( = ?auto_199297 ?auto_199299 ) ) ( not ( = ?auto_199297 ?auto_199300 ) ) ( not ( = ?auto_199297 ?auto_199301 ) ) ( not ( = ?auto_199297 ?auto_199302 ) ) ( not ( = ?auto_199297 ?auto_199303 ) ) ( not ( = ?auto_199297 ?auto_199304 ) ) ( not ( = ?auto_199297 ?auto_199305 ) ) ( not ( = ?auto_199298 ?auto_199299 ) ) ( not ( = ?auto_199298 ?auto_199300 ) ) ( not ( = ?auto_199298 ?auto_199301 ) ) ( not ( = ?auto_199298 ?auto_199302 ) ) ( not ( = ?auto_199298 ?auto_199303 ) ) ( not ( = ?auto_199298 ?auto_199304 ) ) ( not ( = ?auto_199298 ?auto_199305 ) ) ( not ( = ?auto_199299 ?auto_199300 ) ) ( not ( = ?auto_199299 ?auto_199301 ) ) ( not ( = ?auto_199299 ?auto_199302 ) ) ( not ( = ?auto_199299 ?auto_199303 ) ) ( not ( = ?auto_199299 ?auto_199304 ) ) ( not ( = ?auto_199299 ?auto_199305 ) ) ( not ( = ?auto_199300 ?auto_199301 ) ) ( not ( = ?auto_199300 ?auto_199302 ) ) ( not ( = ?auto_199300 ?auto_199303 ) ) ( not ( = ?auto_199300 ?auto_199304 ) ) ( not ( = ?auto_199300 ?auto_199305 ) ) ( not ( = ?auto_199301 ?auto_199302 ) ) ( not ( = ?auto_199301 ?auto_199303 ) ) ( not ( = ?auto_199301 ?auto_199304 ) ) ( not ( = ?auto_199301 ?auto_199305 ) ) ( not ( = ?auto_199302 ?auto_199303 ) ) ( not ( = ?auto_199302 ?auto_199304 ) ) ( not ( = ?auto_199302 ?auto_199305 ) ) ( not ( = ?auto_199303 ?auto_199304 ) ) ( not ( = ?auto_199303 ?auto_199305 ) ) ( not ( = ?auto_199304 ?auto_199305 ) ) ( ON ?auto_199303 ?auto_199304 ) ( ON ?auto_199302 ?auto_199303 ) ( ON ?auto_199301 ?auto_199302 ) ( ON ?auto_199300 ?auto_199301 ) ( ON ?auto_199299 ?auto_199300 ) ( ON ?auto_199298 ?auto_199299 ) ( ON ?auto_199297 ?auto_199298 ) ( ON ?auto_199296 ?auto_199297 ) ( ON ?auto_199295 ?auto_199296 ) ( ON ?auto_199294 ?auto_199295 ) ( CLEAR ?auto_199294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_199294 )
      ( MAKE-11PILE ?auto_199294 ?auto_199295 ?auto_199296 ?auto_199297 ?auto_199298 ?auto_199299 ?auto_199300 ?auto_199301 ?auto_199302 ?auto_199303 ?auto_199304 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_199317 - BLOCK
      ?auto_199318 - BLOCK
      ?auto_199319 - BLOCK
      ?auto_199320 - BLOCK
      ?auto_199321 - BLOCK
      ?auto_199322 - BLOCK
      ?auto_199323 - BLOCK
      ?auto_199324 - BLOCK
      ?auto_199325 - BLOCK
      ?auto_199326 - BLOCK
      ?auto_199327 - BLOCK
    )
    :vars
    (
      ?auto_199328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199327 ?auto_199328 ) ( not ( = ?auto_199317 ?auto_199318 ) ) ( not ( = ?auto_199317 ?auto_199319 ) ) ( not ( = ?auto_199317 ?auto_199320 ) ) ( not ( = ?auto_199317 ?auto_199321 ) ) ( not ( = ?auto_199317 ?auto_199322 ) ) ( not ( = ?auto_199317 ?auto_199323 ) ) ( not ( = ?auto_199317 ?auto_199324 ) ) ( not ( = ?auto_199317 ?auto_199325 ) ) ( not ( = ?auto_199317 ?auto_199326 ) ) ( not ( = ?auto_199317 ?auto_199327 ) ) ( not ( = ?auto_199317 ?auto_199328 ) ) ( not ( = ?auto_199318 ?auto_199319 ) ) ( not ( = ?auto_199318 ?auto_199320 ) ) ( not ( = ?auto_199318 ?auto_199321 ) ) ( not ( = ?auto_199318 ?auto_199322 ) ) ( not ( = ?auto_199318 ?auto_199323 ) ) ( not ( = ?auto_199318 ?auto_199324 ) ) ( not ( = ?auto_199318 ?auto_199325 ) ) ( not ( = ?auto_199318 ?auto_199326 ) ) ( not ( = ?auto_199318 ?auto_199327 ) ) ( not ( = ?auto_199318 ?auto_199328 ) ) ( not ( = ?auto_199319 ?auto_199320 ) ) ( not ( = ?auto_199319 ?auto_199321 ) ) ( not ( = ?auto_199319 ?auto_199322 ) ) ( not ( = ?auto_199319 ?auto_199323 ) ) ( not ( = ?auto_199319 ?auto_199324 ) ) ( not ( = ?auto_199319 ?auto_199325 ) ) ( not ( = ?auto_199319 ?auto_199326 ) ) ( not ( = ?auto_199319 ?auto_199327 ) ) ( not ( = ?auto_199319 ?auto_199328 ) ) ( not ( = ?auto_199320 ?auto_199321 ) ) ( not ( = ?auto_199320 ?auto_199322 ) ) ( not ( = ?auto_199320 ?auto_199323 ) ) ( not ( = ?auto_199320 ?auto_199324 ) ) ( not ( = ?auto_199320 ?auto_199325 ) ) ( not ( = ?auto_199320 ?auto_199326 ) ) ( not ( = ?auto_199320 ?auto_199327 ) ) ( not ( = ?auto_199320 ?auto_199328 ) ) ( not ( = ?auto_199321 ?auto_199322 ) ) ( not ( = ?auto_199321 ?auto_199323 ) ) ( not ( = ?auto_199321 ?auto_199324 ) ) ( not ( = ?auto_199321 ?auto_199325 ) ) ( not ( = ?auto_199321 ?auto_199326 ) ) ( not ( = ?auto_199321 ?auto_199327 ) ) ( not ( = ?auto_199321 ?auto_199328 ) ) ( not ( = ?auto_199322 ?auto_199323 ) ) ( not ( = ?auto_199322 ?auto_199324 ) ) ( not ( = ?auto_199322 ?auto_199325 ) ) ( not ( = ?auto_199322 ?auto_199326 ) ) ( not ( = ?auto_199322 ?auto_199327 ) ) ( not ( = ?auto_199322 ?auto_199328 ) ) ( not ( = ?auto_199323 ?auto_199324 ) ) ( not ( = ?auto_199323 ?auto_199325 ) ) ( not ( = ?auto_199323 ?auto_199326 ) ) ( not ( = ?auto_199323 ?auto_199327 ) ) ( not ( = ?auto_199323 ?auto_199328 ) ) ( not ( = ?auto_199324 ?auto_199325 ) ) ( not ( = ?auto_199324 ?auto_199326 ) ) ( not ( = ?auto_199324 ?auto_199327 ) ) ( not ( = ?auto_199324 ?auto_199328 ) ) ( not ( = ?auto_199325 ?auto_199326 ) ) ( not ( = ?auto_199325 ?auto_199327 ) ) ( not ( = ?auto_199325 ?auto_199328 ) ) ( not ( = ?auto_199326 ?auto_199327 ) ) ( not ( = ?auto_199326 ?auto_199328 ) ) ( not ( = ?auto_199327 ?auto_199328 ) ) ( ON ?auto_199326 ?auto_199327 ) ( ON ?auto_199325 ?auto_199326 ) ( ON ?auto_199324 ?auto_199325 ) ( ON ?auto_199323 ?auto_199324 ) ( ON ?auto_199322 ?auto_199323 ) ( ON ?auto_199321 ?auto_199322 ) ( ON ?auto_199320 ?auto_199321 ) ( ON ?auto_199319 ?auto_199320 ) ( ON ?auto_199318 ?auto_199319 ) ( ON ?auto_199317 ?auto_199318 ) ( CLEAR ?auto_199317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_199317 )
      ( MAKE-11PILE ?auto_199317 ?auto_199318 ?auto_199319 ?auto_199320 ?auto_199321 ?auto_199322 ?auto_199323 ?auto_199324 ?auto_199325 ?auto_199326 ?auto_199327 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_199341 - BLOCK
      ?auto_199342 - BLOCK
      ?auto_199343 - BLOCK
      ?auto_199344 - BLOCK
      ?auto_199345 - BLOCK
      ?auto_199346 - BLOCK
      ?auto_199347 - BLOCK
      ?auto_199348 - BLOCK
      ?auto_199349 - BLOCK
      ?auto_199350 - BLOCK
      ?auto_199351 - BLOCK
      ?auto_199352 - BLOCK
    )
    :vars
    (
      ?auto_199353 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_199351 ) ( ON ?auto_199352 ?auto_199353 ) ( CLEAR ?auto_199352 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_199341 ) ( ON ?auto_199342 ?auto_199341 ) ( ON ?auto_199343 ?auto_199342 ) ( ON ?auto_199344 ?auto_199343 ) ( ON ?auto_199345 ?auto_199344 ) ( ON ?auto_199346 ?auto_199345 ) ( ON ?auto_199347 ?auto_199346 ) ( ON ?auto_199348 ?auto_199347 ) ( ON ?auto_199349 ?auto_199348 ) ( ON ?auto_199350 ?auto_199349 ) ( ON ?auto_199351 ?auto_199350 ) ( not ( = ?auto_199341 ?auto_199342 ) ) ( not ( = ?auto_199341 ?auto_199343 ) ) ( not ( = ?auto_199341 ?auto_199344 ) ) ( not ( = ?auto_199341 ?auto_199345 ) ) ( not ( = ?auto_199341 ?auto_199346 ) ) ( not ( = ?auto_199341 ?auto_199347 ) ) ( not ( = ?auto_199341 ?auto_199348 ) ) ( not ( = ?auto_199341 ?auto_199349 ) ) ( not ( = ?auto_199341 ?auto_199350 ) ) ( not ( = ?auto_199341 ?auto_199351 ) ) ( not ( = ?auto_199341 ?auto_199352 ) ) ( not ( = ?auto_199341 ?auto_199353 ) ) ( not ( = ?auto_199342 ?auto_199343 ) ) ( not ( = ?auto_199342 ?auto_199344 ) ) ( not ( = ?auto_199342 ?auto_199345 ) ) ( not ( = ?auto_199342 ?auto_199346 ) ) ( not ( = ?auto_199342 ?auto_199347 ) ) ( not ( = ?auto_199342 ?auto_199348 ) ) ( not ( = ?auto_199342 ?auto_199349 ) ) ( not ( = ?auto_199342 ?auto_199350 ) ) ( not ( = ?auto_199342 ?auto_199351 ) ) ( not ( = ?auto_199342 ?auto_199352 ) ) ( not ( = ?auto_199342 ?auto_199353 ) ) ( not ( = ?auto_199343 ?auto_199344 ) ) ( not ( = ?auto_199343 ?auto_199345 ) ) ( not ( = ?auto_199343 ?auto_199346 ) ) ( not ( = ?auto_199343 ?auto_199347 ) ) ( not ( = ?auto_199343 ?auto_199348 ) ) ( not ( = ?auto_199343 ?auto_199349 ) ) ( not ( = ?auto_199343 ?auto_199350 ) ) ( not ( = ?auto_199343 ?auto_199351 ) ) ( not ( = ?auto_199343 ?auto_199352 ) ) ( not ( = ?auto_199343 ?auto_199353 ) ) ( not ( = ?auto_199344 ?auto_199345 ) ) ( not ( = ?auto_199344 ?auto_199346 ) ) ( not ( = ?auto_199344 ?auto_199347 ) ) ( not ( = ?auto_199344 ?auto_199348 ) ) ( not ( = ?auto_199344 ?auto_199349 ) ) ( not ( = ?auto_199344 ?auto_199350 ) ) ( not ( = ?auto_199344 ?auto_199351 ) ) ( not ( = ?auto_199344 ?auto_199352 ) ) ( not ( = ?auto_199344 ?auto_199353 ) ) ( not ( = ?auto_199345 ?auto_199346 ) ) ( not ( = ?auto_199345 ?auto_199347 ) ) ( not ( = ?auto_199345 ?auto_199348 ) ) ( not ( = ?auto_199345 ?auto_199349 ) ) ( not ( = ?auto_199345 ?auto_199350 ) ) ( not ( = ?auto_199345 ?auto_199351 ) ) ( not ( = ?auto_199345 ?auto_199352 ) ) ( not ( = ?auto_199345 ?auto_199353 ) ) ( not ( = ?auto_199346 ?auto_199347 ) ) ( not ( = ?auto_199346 ?auto_199348 ) ) ( not ( = ?auto_199346 ?auto_199349 ) ) ( not ( = ?auto_199346 ?auto_199350 ) ) ( not ( = ?auto_199346 ?auto_199351 ) ) ( not ( = ?auto_199346 ?auto_199352 ) ) ( not ( = ?auto_199346 ?auto_199353 ) ) ( not ( = ?auto_199347 ?auto_199348 ) ) ( not ( = ?auto_199347 ?auto_199349 ) ) ( not ( = ?auto_199347 ?auto_199350 ) ) ( not ( = ?auto_199347 ?auto_199351 ) ) ( not ( = ?auto_199347 ?auto_199352 ) ) ( not ( = ?auto_199347 ?auto_199353 ) ) ( not ( = ?auto_199348 ?auto_199349 ) ) ( not ( = ?auto_199348 ?auto_199350 ) ) ( not ( = ?auto_199348 ?auto_199351 ) ) ( not ( = ?auto_199348 ?auto_199352 ) ) ( not ( = ?auto_199348 ?auto_199353 ) ) ( not ( = ?auto_199349 ?auto_199350 ) ) ( not ( = ?auto_199349 ?auto_199351 ) ) ( not ( = ?auto_199349 ?auto_199352 ) ) ( not ( = ?auto_199349 ?auto_199353 ) ) ( not ( = ?auto_199350 ?auto_199351 ) ) ( not ( = ?auto_199350 ?auto_199352 ) ) ( not ( = ?auto_199350 ?auto_199353 ) ) ( not ( = ?auto_199351 ?auto_199352 ) ) ( not ( = ?auto_199351 ?auto_199353 ) ) ( not ( = ?auto_199352 ?auto_199353 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_199352 ?auto_199353 )
      ( !STACK ?auto_199352 ?auto_199351 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_199366 - BLOCK
      ?auto_199367 - BLOCK
      ?auto_199368 - BLOCK
      ?auto_199369 - BLOCK
      ?auto_199370 - BLOCK
      ?auto_199371 - BLOCK
      ?auto_199372 - BLOCK
      ?auto_199373 - BLOCK
      ?auto_199374 - BLOCK
      ?auto_199375 - BLOCK
      ?auto_199376 - BLOCK
      ?auto_199377 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_199376 ) ( ON-TABLE ?auto_199377 ) ( CLEAR ?auto_199377 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_199366 ) ( ON ?auto_199367 ?auto_199366 ) ( ON ?auto_199368 ?auto_199367 ) ( ON ?auto_199369 ?auto_199368 ) ( ON ?auto_199370 ?auto_199369 ) ( ON ?auto_199371 ?auto_199370 ) ( ON ?auto_199372 ?auto_199371 ) ( ON ?auto_199373 ?auto_199372 ) ( ON ?auto_199374 ?auto_199373 ) ( ON ?auto_199375 ?auto_199374 ) ( ON ?auto_199376 ?auto_199375 ) ( not ( = ?auto_199366 ?auto_199367 ) ) ( not ( = ?auto_199366 ?auto_199368 ) ) ( not ( = ?auto_199366 ?auto_199369 ) ) ( not ( = ?auto_199366 ?auto_199370 ) ) ( not ( = ?auto_199366 ?auto_199371 ) ) ( not ( = ?auto_199366 ?auto_199372 ) ) ( not ( = ?auto_199366 ?auto_199373 ) ) ( not ( = ?auto_199366 ?auto_199374 ) ) ( not ( = ?auto_199366 ?auto_199375 ) ) ( not ( = ?auto_199366 ?auto_199376 ) ) ( not ( = ?auto_199366 ?auto_199377 ) ) ( not ( = ?auto_199367 ?auto_199368 ) ) ( not ( = ?auto_199367 ?auto_199369 ) ) ( not ( = ?auto_199367 ?auto_199370 ) ) ( not ( = ?auto_199367 ?auto_199371 ) ) ( not ( = ?auto_199367 ?auto_199372 ) ) ( not ( = ?auto_199367 ?auto_199373 ) ) ( not ( = ?auto_199367 ?auto_199374 ) ) ( not ( = ?auto_199367 ?auto_199375 ) ) ( not ( = ?auto_199367 ?auto_199376 ) ) ( not ( = ?auto_199367 ?auto_199377 ) ) ( not ( = ?auto_199368 ?auto_199369 ) ) ( not ( = ?auto_199368 ?auto_199370 ) ) ( not ( = ?auto_199368 ?auto_199371 ) ) ( not ( = ?auto_199368 ?auto_199372 ) ) ( not ( = ?auto_199368 ?auto_199373 ) ) ( not ( = ?auto_199368 ?auto_199374 ) ) ( not ( = ?auto_199368 ?auto_199375 ) ) ( not ( = ?auto_199368 ?auto_199376 ) ) ( not ( = ?auto_199368 ?auto_199377 ) ) ( not ( = ?auto_199369 ?auto_199370 ) ) ( not ( = ?auto_199369 ?auto_199371 ) ) ( not ( = ?auto_199369 ?auto_199372 ) ) ( not ( = ?auto_199369 ?auto_199373 ) ) ( not ( = ?auto_199369 ?auto_199374 ) ) ( not ( = ?auto_199369 ?auto_199375 ) ) ( not ( = ?auto_199369 ?auto_199376 ) ) ( not ( = ?auto_199369 ?auto_199377 ) ) ( not ( = ?auto_199370 ?auto_199371 ) ) ( not ( = ?auto_199370 ?auto_199372 ) ) ( not ( = ?auto_199370 ?auto_199373 ) ) ( not ( = ?auto_199370 ?auto_199374 ) ) ( not ( = ?auto_199370 ?auto_199375 ) ) ( not ( = ?auto_199370 ?auto_199376 ) ) ( not ( = ?auto_199370 ?auto_199377 ) ) ( not ( = ?auto_199371 ?auto_199372 ) ) ( not ( = ?auto_199371 ?auto_199373 ) ) ( not ( = ?auto_199371 ?auto_199374 ) ) ( not ( = ?auto_199371 ?auto_199375 ) ) ( not ( = ?auto_199371 ?auto_199376 ) ) ( not ( = ?auto_199371 ?auto_199377 ) ) ( not ( = ?auto_199372 ?auto_199373 ) ) ( not ( = ?auto_199372 ?auto_199374 ) ) ( not ( = ?auto_199372 ?auto_199375 ) ) ( not ( = ?auto_199372 ?auto_199376 ) ) ( not ( = ?auto_199372 ?auto_199377 ) ) ( not ( = ?auto_199373 ?auto_199374 ) ) ( not ( = ?auto_199373 ?auto_199375 ) ) ( not ( = ?auto_199373 ?auto_199376 ) ) ( not ( = ?auto_199373 ?auto_199377 ) ) ( not ( = ?auto_199374 ?auto_199375 ) ) ( not ( = ?auto_199374 ?auto_199376 ) ) ( not ( = ?auto_199374 ?auto_199377 ) ) ( not ( = ?auto_199375 ?auto_199376 ) ) ( not ( = ?auto_199375 ?auto_199377 ) ) ( not ( = ?auto_199376 ?auto_199377 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_199377 )
      ( !STACK ?auto_199377 ?auto_199376 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_199390 - BLOCK
      ?auto_199391 - BLOCK
      ?auto_199392 - BLOCK
      ?auto_199393 - BLOCK
      ?auto_199394 - BLOCK
      ?auto_199395 - BLOCK
      ?auto_199396 - BLOCK
      ?auto_199397 - BLOCK
      ?auto_199398 - BLOCK
      ?auto_199399 - BLOCK
      ?auto_199400 - BLOCK
      ?auto_199401 - BLOCK
    )
    :vars
    (
      ?auto_199402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199401 ?auto_199402 ) ( ON-TABLE ?auto_199390 ) ( ON ?auto_199391 ?auto_199390 ) ( ON ?auto_199392 ?auto_199391 ) ( ON ?auto_199393 ?auto_199392 ) ( ON ?auto_199394 ?auto_199393 ) ( ON ?auto_199395 ?auto_199394 ) ( ON ?auto_199396 ?auto_199395 ) ( ON ?auto_199397 ?auto_199396 ) ( ON ?auto_199398 ?auto_199397 ) ( ON ?auto_199399 ?auto_199398 ) ( not ( = ?auto_199390 ?auto_199391 ) ) ( not ( = ?auto_199390 ?auto_199392 ) ) ( not ( = ?auto_199390 ?auto_199393 ) ) ( not ( = ?auto_199390 ?auto_199394 ) ) ( not ( = ?auto_199390 ?auto_199395 ) ) ( not ( = ?auto_199390 ?auto_199396 ) ) ( not ( = ?auto_199390 ?auto_199397 ) ) ( not ( = ?auto_199390 ?auto_199398 ) ) ( not ( = ?auto_199390 ?auto_199399 ) ) ( not ( = ?auto_199390 ?auto_199400 ) ) ( not ( = ?auto_199390 ?auto_199401 ) ) ( not ( = ?auto_199390 ?auto_199402 ) ) ( not ( = ?auto_199391 ?auto_199392 ) ) ( not ( = ?auto_199391 ?auto_199393 ) ) ( not ( = ?auto_199391 ?auto_199394 ) ) ( not ( = ?auto_199391 ?auto_199395 ) ) ( not ( = ?auto_199391 ?auto_199396 ) ) ( not ( = ?auto_199391 ?auto_199397 ) ) ( not ( = ?auto_199391 ?auto_199398 ) ) ( not ( = ?auto_199391 ?auto_199399 ) ) ( not ( = ?auto_199391 ?auto_199400 ) ) ( not ( = ?auto_199391 ?auto_199401 ) ) ( not ( = ?auto_199391 ?auto_199402 ) ) ( not ( = ?auto_199392 ?auto_199393 ) ) ( not ( = ?auto_199392 ?auto_199394 ) ) ( not ( = ?auto_199392 ?auto_199395 ) ) ( not ( = ?auto_199392 ?auto_199396 ) ) ( not ( = ?auto_199392 ?auto_199397 ) ) ( not ( = ?auto_199392 ?auto_199398 ) ) ( not ( = ?auto_199392 ?auto_199399 ) ) ( not ( = ?auto_199392 ?auto_199400 ) ) ( not ( = ?auto_199392 ?auto_199401 ) ) ( not ( = ?auto_199392 ?auto_199402 ) ) ( not ( = ?auto_199393 ?auto_199394 ) ) ( not ( = ?auto_199393 ?auto_199395 ) ) ( not ( = ?auto_199393 ?auto_199396 ) ) ( not ( = ?auto_199393 ?auto_199397 ) ) ( not ( = ?auto_199393 ?auto_199398 ) ) ( not ( = ?auto_199393 ?auto_199399 ) ) ( not ( = ?auto_199393 ?auto_199400 ) ) ( not ( = ?auto_199393 ?auto_199401 ) ) ( not ( = ?auto_199393 ?auto_199402 ) ) ( not ( = ?auto_199394 ?auto_199395 ) ) ( not ( = ?auto_199394 ?auto_199396 ) ) ( not ( = ?auto_199394 ?auto_199397 ) ) ( not ( = ?auto_199394 ?auto_199398 ) ) ( not ( = ?auto_199394 ?auto_199399 ) ) ( not ( = ?auto_199394 ?auto_199400 ) ) ( not ( = ?auto_199394 ?auto_199401 ) ) ( not ( = ?auto_199394 ?auto_199402 ) ) ( not ( = ?auto_199395 ?auto_199396 ) ) ( not ( = ?auto_199395 ?auto_199397 ) ) ( not ( = ?auto_199395 ?auto_199398 ) ) ( not ( = ?auto_199395 ?auto_199399 ) ) ( not ( = ?auto_199395 ?auto_199400 ) ) ( not ( = ?auto_199395 ?auto_199401 ) ) ( not ( = ?auto_199395 ?auto_199402 ) ) ( not ( = ?auto_199396 ?auto_199397 ) ) ( not ( = ?auto_199396 ?auto_199398 ) ) ( not ( = ?auto_199396 ?auto_199399 ) ) ( not ( = ?auto_199396 ?auto_199400 ) ) ( not ( = ?auto_199396 ?auto_199401 ) ) ( not ( = ?auto_199396 ?auto_199402 ) ) ( not ( = ?auto_199397 ?auto_199398 ) ) ( not ( = ?auto_199397 ?auto_199399 ) ) ( not ( = ?auto_199397 ?auto_199400 ) ) ( not ( = ?auto_199397 ?auto_199401 ) ) ( not ( = ?auto_199397 ?auto_199402 ) ) ( not ( = ?auto_199398 ?auto_199399 ) ) ( not ( = ?auto_199398 ?auto_199400 ) ) ( not ( = ?auto_199398 ?auto_199401 ) ) ( not ( = ?auto_199398 ?auto_199402 ) ) ( not ( = ?auto_199399 ?auto_199400 ) ) ( not ( = ?auto_199399 ?auto_199401 ) ) ( not ( = ?auto_199399 ?auto_199402 ) ) ( not ( = ?auto_199400 ?auto_199401 ) ) ( not ( = ?auto_199400 ?auto_199402 ) ) ( not ( = ?auto_199401 ?auto_199402 ) ) ( CLEAR ?auto_199399 ) ( ON ?auto_199400 ?auto_199401 ) ( CLEAR ?auto_199400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_199390 ?auto_199391 ?auto_199392 ?auto_199393 ?auto_199394 ?auto_199395 ?auto_199396 ?auto_199397 ?auto_199398 ?auto_199399 ?auto_199400 )
      ( MAKE-12PILE ?auto_199390 ?auto_199391 ?auto_199392 ?auto_199393 ?auto_199394 ?auto_199395 ?auto_199396 ?auto_199397 ?auto_199398 ?auto_199399 ?auto_199400 ?auto_199401 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_199415 - BLOCK
      ?auto_199416 - BLOCK
      ?auto_199417 - BLOCK
      ?auto_199418 - BLOCK
      ?auto_199419 - BLOCK
      ?auto_199420 - BLOCK
      ?auto_199421 - BLOCK
      ?auto_199422 - BLOCK
      ?auto_199423 - BLOCK
      ?auto_199424 - BLOCK
      ?auto_199425 - BLOCK
      ?auto_199426 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199426 ) ( ON-TABLE ?auto_199415 ) ( ON ?auto_199416 ?auto_199415 ) ( ON ?auto_199417 ?auto_199416 ) ( ON ?auto_199418 ?auto_199417 ) ( ON ?auto_199419 ?auto_199418 ) ( ON ?auto_199420 ?auto_199419 ) ( ON ?auto_199421 ?auto_199420 ) ( ON ?auto_199422 ?auto_199421 ) ( ON ?auto_199423 ?auto_199422 ) ( ON ?auto_199424 ?auto_199423 ) ( not ( = ?auto_199415 ?auto_199416 ) ) ( not ( = ?auto_199415 ?auto_199417 ) ) ( not ( = ?auto_199415 ?auto_199418 ) ) ( not ( = ?auto_199415 ?auto_199419 ) ) ( not ( = ?auto_199415 ?auto_199420 ) ) ( not ( = ?auto_199415 ?auto_199421 ) ) ( not ( = ?auto_199415 ?auto_199422 ) ) ( not ( = ?auto_199415 ?auto_199423 ) ) ( not ( = ?auto_199415 ?auto_199424 ) ) ( not ( = ?auto_199415 ?auto_199425 ) ) ( not ( = ?auto_199415 ?auto_199426 ) ) ( not ( = ?auto_199416 ?auto_199417 ) ) ( not ( = ?auto_199416 ?auto_199418 ) ) ( not ( = ?auto_199416 ?auto_199419 ) ) ( not ( = ?auto_199416 ?auto_199420 ) ) ( not ( = ?auto_199416 ?auto_199421 ) ) ( not ( = ?auto_199416 ?auto_199422 ) ) ( not ( = ?auto_199416 ?auto_199423 ) ) ( not ( = ?auto_199416 ?auto_199424 ) ) ( not ( = ?auto_199416 ?auto_199425 ) ) ( not ( = ?auto_199416 ?auto_199426 ) ) ( not ( = ?auto_199417 ?auto_199418 ) ) ( not ( = ?auto_199417 ?auto_199419 ) ) ( not ( = ?auto_199417 ?auto_199420 ) ) ( not ( = ?auto_199417 ?auto_199421 ) ) ( not ( = ?auto_199417 ?auto_199422 ) ) ( not ( = ?auto_199417 ?auto_199423 ) ) ( not ( = ?auto_199417 ?auto_199424 ) ) ( not ( = ?auto_199417 ?auto_199425 ) ) ( not ( = ?auto_199417 ?auto_199426 ) ) ( not ( = ?auto_199418 ?auto_199419 ) ) ( not ( = ?auto_199418 ?auto_199420 ) ) ( not ( = ?auto_199418 ?auto_199421 ) ) ( not ( = ?auto_199418 ?auto_199422 ) ) ( not ( = ?auto_199418 ?auto_199423 ) ) ( not ( = ?auto_199418 ?auto_199424 ) ) ( not ( = ?auto_199418 ?auto_199425 ) ) ( not ( = ?auto_199418 ?auto_199426 ) ) ( not ( = ?auto_199419 ?auto_199420 ) ) ( not ( = ?auto_199419 ?auto_199421 ) ) ( not ( = ?auto_199419 ?auto_199422 ) ) ( not ( = ?auto_199419 ?auto_199423 ) ) ( not ( = ?auto_199419 ?auto_199424 ) ) ( not ( = ?auto_199419 ?auto_199425 ) ) ( not ( = ?auto_199419 ?auto_199426 ) ) ( not ( = ?auto_199420 ?auto_199421 ) ) ( not ( = ?auto_199420 ?auto_199422 ) ) ( not ( = ?auto_199420 ?auto_199423 ) ) ( not ( = ?auto_199420 ?auto_199424 ) ) ( not ( = ?auto_199420 ?auto_199425 ) ) ( not ( = ?auto_199420 ?auto_199426 ) ) ( not ( = ?auto_199421 ?auto_199422 ) ) ( not ( = ?auto_199421 ?auto_199423 ) ) ( not ( = ?auto_199421 ?auto_199424 ) ) ( not ( = ?auto_199421 ?auto_199425 ) ) ( not ( = ?auto_199421 ?auto_199426 ) ) ( not ( = ?auto_199422 ?auto_199423 ) ) ( not ( = ?auto_199422 ?auto_199424 ) ) ( not ( = ?auto_199422 ?auto_199425 ) ) ( not ( = ?auto_199422 ?auto_199426 ) ) ( not ( = ?auto_199423 ?auto_199424 ) ) ( not ( = ?auto_199423 ?auto_199425 ) ) ( not ( = ?auto_199423 ?auto_199426 ) ) ( not ( = ?auto_199424 ?auto_199425 ) ) ( not ( = ?auto_199424 ?auto_199426 ) ) ( not ( = ?auto_199425 ?auto_199426 ) ) ( CLEAR ?auto_199424 ) ( ON ?auto_199425 ?auto_199426 ) ( CLEAR ?auto_199425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_199415 ?auto_199416 ?auto_199417 ?auto_199418 ?auto_199419 ?auto_199420 ?auto_199421 ?auto_199422 ?auto_199423 ?auto_199424 ?auto_199425 )
      ( MAKE-12PILE ?auto_199415 ?auto_199416 ?auto_199417 ?auto_199418 ?auto_199419 ?auto_199420 ?auto_199421 ?auto_199422 ?auto_199423 ?auto_199424 ?auto_199425 ?auto_199426 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_199439 - BLOCK
      ?auto_199440 - BLOCK
      ?auto_199441 - BLOCK
      ?auto_199442 - BLOCK
      ?auto_199443 - BLOCK
      ?auto_199444 - BLOCK
      ?auto_199445 - BLOCK
      ?auto_199446 - BLOCK
      ?auto_199447 - BLOCK
      ?auto_199448 - BLOCK
      ?auto_199449 - BLOCK
      ?auto_199450 - BLOCK
    )
    :vars
    (
      ?auto_199451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199450 ?auto_199451 ) ( ON-TABLE ?auto_199439 ) ( ON ?auto_199440 ?auto_199439 ) ( ON ?auto_199441 ?auto_199440 ) ( ON ?auto_199442 ?auto_199441 ) ( ON ?auto_199443 ?auto_199442 ) ( ON ?auto_199444 ?auto_199443 ) ( ON ?auto_199445 ?auto_199444 ) ( ON ?auto_199446 ?auto_199445 ) ( ON ?auto_199447 ?auto_199446 ) ( not ( = ?auto_199439 ?auto_199440 ) ) ( not ( = ?auto_199439 ?auto_199441 ) ) ( not ( = ?auto_199439 ?auto_199442 ) ) ( not ( = ?auto_199439 ?auto_199443 ) ) ( not ( = ?auto_199439 ?auto_199444 ) ) ( not ( = ?auto_199439 ?auto_199445 ) ) ( not ( = ?auto_199439 ?auto_199446 ) ) ( not ( = ?auto_199439 ?auto_199447 ) ) ( not ( = ?auto_199439 ?auto_199448 ) ) ( not ( = ?auto_199439 ?auto_199449 ) ) ( not ( = ?auto_199439 ?auto_199450 ) ) ( not ( = ?auto_199439 ?auto_199451 ) ) ( not ( = ?auto_199440 ?auto_199441 ) ) ( not ( = ?auto_199440 ?auto_199442 ) ) ( not ( = ?auto_199440 ?auto_199443 ) ) ( not ( = ?auto_199440 ?auto_199444 ) ) ( not ( = ?auto_199440 ?auto_199445 ) ) ( not ( = ?auto_199440 ?auto_199446 ) ) ( not ( = ?auto_199440 ?auto_199447 ) ) ( not ( = ?auto_199440 ?auto_199448 ) ) ( not ( = ?auto_199440 ?auto_199449 ) ) ( not ( = ?auto_199440 ?auto_199450 ) ) ( not ( = ?auto_199440 ?auto_199451 ) ) ( not ( = ?auto_199441 ?auto_199442 ) ) ( not ( = ?auto_199441 ?auto_199443 ) ) ( not ( = ?auto_199441 ?auto_199444 ) ) ( not ( = ?auto_199441 ?auto_199445 ) ) ( not ( = ?auto_199441 ?auto_199446 ) ) ( not ( = ?auto_199441 ?auto_199447 ) ) ( not ( = ?auto_199441 ?auto_199448 ) ) ( not ( = ?auto_199441 ?auto_199449 ) ) ( not ( = ?auto_199441 ?auto_199450 ) ) ( not ( = ?auto_199441 ?auto_199451 ) ) ( not ( = ?auto_199442 ?auto_199443 ) ) ( not ( = ?auto_199442 ?auto_199444 ) ) ( not ( = ?auto_199442 ?auto_199445 ) ) ( not ( = ?auto_199442 ?auto_199446 ) ) ( not ( = ?auto_199442 ?auto_199447 ) ) ( not ( = ?auto_199442 ?auto_199448 ) ) ( not ( = ?auto_199442 ?auto_199449 ) ) ( not ( = ?auto_199442 ?auto_199450 ) ) ( not ( = ?auto_199442 ?auto_199451 ) ) ( not ( = ?auto_199443 ?auto_199444 ) ) ( not ( = ?auto_199443 ?auto_199445 ) ) ( not ( = ?auto_199443 ?auto_199446 ) ) ( not ( = ?auto_199443 ?auto_199447 ) ) ( not ( = ?auto_199443 ?auto_199448 ) ) ( not ( = ?auto_199443 ?auto_199449 ) ) ( not ( = ?auto_199443 ?auto_199450 ) ) ( not ( = ?auto_199443 ?auto_199451 ) ) ( not ( = ?auto_199444 ?auto_199445 ) ) ( not ( = ?auto_199444 ?auto_199446 ) ) ( not ( = ?auto_199444 ?auto_199447 ) ) ( not ( = ?auto_199444 ?auto_199448 ) ) ( not ( = ?auto_199444 ?auto_199449 ) ) ( not ( = ?auto_199444 ?auto_199450 ) ) ( not ( = ?auto_199444 ?auto_199451 ) ) ( not ( = ?auto_199445 ?auto_199446 ) ) ( not ( = ?auto_199445 ?auto_199447 ) ) ( not ( = ?auto_199445 ?auto_199448 ) ) ( not ( = ?auto_199445 ?auto_199449 ) ) ( not ( = ?auto_199445 ?auto_199450 ) ) ( not ( = ?auto_199445 ?auto_199451 ) ) ( not ( = ?auto_199446 ?auto_199447 ) ) ( not ( = ?auto_199446 ?auto_199448 ) ) ( not ( = ?auto_199446 ?auto_199449 ) ) ( not ( = ?auto_199446 ?auto_199450 ) ) ( not ( = ?auto_199446 ?auto_199451 ) ) ( not ( = ?auto_199447 ?auto_199448 ) ) ( not ( = ?auto_199447 ?auto_199449 ) ) ( not ( = ?auto_199447 ?auto_199450 ) ) ( not ( = ?auto_199447 ?auto_199451 ) ) ( not ( = ?auto_199448 ?auto_199449 ) ) ( not ( = ?auto_199448 ?auto_199450 ) ) ( not ( = ?auto_199448 ?auto_199451 ) ) ( not ( = ?auto_199449 ?auto_199450 ) ) ( not ( = ?auto_199449 ?auto_199451 ) ) ( not ( = ?auto_199450 ?auto_199451 ) ) ( ON ?auto_199449 ?auto_199450 ) ( CLEAR ?auto_199447 ) ( ON ?auto_199448 ?auto_199449 ) ( CLEAR ?auto_199448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_199439 ?auto_199440 ?auto_199441 ?auto_199442 ?auto_199443 ?auto_199444 ?auto_199445 ?auto_199446 ?auto_199447 ?auto_199448 )
      ( MAKE-12PILE ?auto_199439 ?auto_199440 ?auto_199441 ?auto_199442 ?auto_199443 ?auto_199444 ?auto_199445 ?auto_199446 ?auto_199447 ?auto_199448 ?auto_199449 ?auto_199450 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_199464 - BLOCK
      ?auto_199465 - BLOCK
      ?auto_199466 - BLOCK
      ?auto_199467 - BLOCK
      ?auto_199468 - BLOCK
      ?auto_199469 - BLOCK
      ?auto_199470 - BLOCK
      ?auto_199471 - BLOCK
      ?auto_199472 - BLOCK
      ?auto_199473 - BLOCK
      ?auto_199474 - BLOCK
      ?auto_199475 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199475 ) ( ON-TABLE ?auto_199464 ) ( ON ?auto_199465 ?auto_199464 ) ( ON ?auto_199466 ?auto_199465 ) ( ON ?auto_199467 ?auto_199466 ) ( ON ?auto_199468 ?auto_199467 ) ( ON ?auto_199469 ?auto_199468 ) ( ON ?auto_199470 ?auto_199469 ) ( ON ?auto_199471 ?auto_199470 ) ( ON ?auto_199472 ?auto_199471 ) ( not ( = ?auto_199464 ?auto_199465 ) ) ( not ( = ?auto_199464 ?auto_199466 ) ) ( not ( = ?auto_199464 ?auto_199467 ) ) ( not ( = ?auto_199464 ?auto_199468 ) ) ( not ( = ?auto_199464 ?auto_199469 ) ) ( not ( = ?auto_199464 ?auto_199470 ) ) ( not ( = ?auto_199464 ?auto_199471 ) ) ( not ( = ?auto_199464 ?auto_199472 ) ) ( not ( = ?auto_199464 ?auto_199473 ) ) ( not ( = ?auto_199464 ?auto_199474 ) ) ( not ( = ?auto_199464 ?auto_199475 ) ) ( not ( = ?auto_199465 ?auto_199466 ) ) ( not ( = ?auto_199465 ?auto_199467 ) ) ( not ( = ?auto_199465 ?auto_199468 ) ) ( not ( = ?auto_199465 ?auto_199469 ) ) ( not ( = ?auto_199465 ?auto_199470 ) ) ( not ( = ?auto_199465 ?auto_199471 ) ) ( not ( = ?auto_199465 ?auto_199472 ) ) ( not ( = ?auto_199465 ?auto_199473 ) ) ( not ( = ?auto_199465 ?auto_199474 ) ) ( not ( = ?auto_199465 ?auto_199475 ) ) ( not ( = ?auto_199466 ?auto_199467 ) ) ( not ( = ?auto_199466 ?auto_199468 ) ) ( not ( = ?auto_199466 ?auto_199469 ) ) ( not ( = ?auto_199466 ?auto_199470 ) ) ( not ( = ?auto_199466 ?auto_199471 ) ) ( not ( = ?auto_199466 ?auto_199472 ) ) ( not ( = ?auto_199466 ?auto_199473 ) ) ( not ( = ?auto_199466 ?auto_199474 ) ) ( not ( = ?auto_199466 ?auto_199475 ) ) ( not ( = ?auto_199467 ?auto_199468 ) ) ( not ( = ?auto_199467 ?auto_199469 ) ) ( not ( = ?auto_199467 ?auto_199470 ) ) ( not ( = ?auto_199467 ?auto_199471 ) ) ( not ( = ?auto_199467 ?auto_199472 ) ) ( not ( = ?auto_199467 ?auto_199473 ) ) ( not ( = ?auto_199467 ?auto_199474 ) ) ( not ( = ?auto_199467 ?auto_199475 ) ) ( not ( = ?auto_199468 ?auto_199469 ) ) ( not ( = ?auto_199468 ?auto_199470 ) ) ( not ( = ?auto_199468 ?auto_199471 ) ) ( not ( = ?auto_199468 ?auto_199472 ) ) ( not ( = ?auto_199468 ?auto_199473 ) ) ( not ( = ?auto_199468 ?auto_199474 ) ) ( not ( = ?auto_199468 ?auto_199475 ) ) ( not ( = ?auto_199469 ?auto_199470 ) ) ( not ( = ?auto_199469 ?auto_199471 ) ) ( not ( = ?auto_199469 ?auto_199472 ) ) ( not ( = ?auto_199469 ?auto_199473 ) ) ( not ( = ?auto_199469 ?auto_199474 ) ) ( not ( = ?auto_199469 ?auto_199475 ) ) ( not ( = ?auto_199470 ?auto_199471 ) ) ( not ( = ?auto_199470 ?auto_199472 ) ) ( not ( = ?auto_199470 ?auto_199473 ) ) ( not ( = ?auto_199470 ?auto_199474 ) ) ( not ( = ?auto_199470 ?auto_199475 ) ) ( not ( = ?auto_199471 ?auto_199472 ) ) ( not ( = ?auto_199471 ?auto_199473 ) ) ( not ( = ?auto_199471 ?auto_199474 ) ) ( not ( = ?auto_199471 ?auto_199475 ) ) ( not ( = ?auto_199472 ?auto_199473 ) ) ( not ( = ?auto_199472 ?auto_199474 ) ) ( not ( = ?auto_199472 ?auto_199475 ) ) ( not ( = ?auto_199473 ?auto_199474 ) ) ( not ( = ?auto_199473 ?auto_199475 ) ) ( not ( = ?auto_199474 ?auto_199475 ) ) ( ON ?auto_199474 ?auto_199475 ) ( CLEAR ?auto_199472 ) ( ON ?auto_199473 ?auto_199474 ) ( CLEAR ?auto_199473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_199464 ?auto_199465 ?auto_199466 ?auto_199467 ?auto_199468 ?auto_199469 ?auto_199470 ?auto_199471 ?auto_199472 ?auto_199473 )
      ( MAKE-12PILE ?auto_199464 ?auto_199465 ?auto_199466 ?auto_199467 ?auto_199468 ?auto_199469 ?auto_199470 ?auto_199471 ?auto_199472 ?auto_199473 ?auto_199474 ?auto_199475 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_199488 - BLOCK
      ?auto_199489 - BLOCK
      ?auto_199490 - BLOCK
      ?auto_199491 - BLOCK
      ?auto_199492 - BLOCK
      ?auto_199493 - BLOCK
      ?auto_199494 - BLOCK
      ?auto_199495 - BLOCK
      ?auto_199496 - BLOCK
      ?auto_199497 - BLOCK
      ?auto_199498 - BLOCK
      ?auto_199499 - BLOCK
    )
    :vars
    (
      ?auto_199500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199499 ?auto_199500 ) ( ON-TABLE ?auto_199488 ) ( ON ?auto_199489 ?auto_199488 ) ( ON ?auto_199490 ?auto_199489 ) ( ON ?auto_199491 ?auto_199490 ) ( ON ?auto_199492 ?auto_199491 ) ( ON ?auto_199493 ?auto_199492 ) ( ON ?auto_199494 ?auto_199493 ) ( ON ?auto_199495 ?auto_199494 ) ( not ( = ?auto_199488 ?auto_199489 ) ) ( not ( = ?auto_199488 ?auto_199490 ) ) ( not ( = ?auto_199488 ?auto_199491 ) ) ( not ( = ?auto_199488 ?auto_199492 ) ) ( not ( = ?auto_199488 ?auto_199493 ) ) ( not ( = ?auto_199488 ?auto_199494 ) ) ( not ( = ?auto_199488 ?auto_199495 ) ) ( not ( = ?auto_199488 ?auto_199496 ) ) ( not ( = ?auto_199488 ?auto_199497 ) ) ( not ( = ?auto_199488 ?auto_199498 ) ) ( not ( = ?auto_199488 ?auto_199499 ) ) ( not ( = ?auto_199488 ?auto_199500 ) ) ( not ( = ?auto_199489 ?auto_199490 ) ) ( not ( = ?auto_199489 ?auto_199491 ) ) ( not ( = ?auto_199489 ?auto_199492 ) ) ( not ( = ?auto_199489 ?auto_199493 ) ) ( not ( = ?auto_199489 ?auto_199494 ) ) ( not ( = ?auto_199489 ?auto_199495 ) ) ( not ( = ?auto_199489 ?auto_199496 ) ) ( not ( = ?auto_199489 ?auto_199497 ) ) ( not ( = ?auto_199489 ?auto_199498 ) ) ( not ( = ?auto_199489 ?auto_199499 ) ) ( not ( = ?auto_199489 ?auto_199500 ) ) ( not ( = ?auto_199490 ?auto_199491 ) ) ( not ( = ?auto_199490 ?auto_199492 ) ) ( not ( = ?auto_199490 ?auto_199493 ) ) ( not ( = ?auto_199490 ?auto_199494 ) ) ( not ( = ?auto_199490 ?auto_199495 ) ) ( not ( = ?auto_199490 ?auto_199496 ) ) ( not ( = ?auto_199490 ?auto_199497 ) ) ( not ( = ?auto_199490 ?auto_199498 ) ) ( not ( = ?auto_199490 ?auto_199499 ) ) ( not ( = ?auto_199490 ?auto_199500 ) ) ( not ( = ?auto_199491 ?auto_199492 ) ) ( not ( = ?auto_199491 ?auto_199493 ) ) ( not ( = ?auto_199491 ?auto_199494 ) ) ( not ( = ?auto_199491 ?auto_199495 ) ) ( not ( = ?auto_199491 ?auto_199496 ) ) ( not ( = ?auto_199491 ?auto_199497 ) ) ( not ( = ?auto_199491 ?auto_199498 ) ) ( not ( = ?auto_199491 ?auto_199499 ) ) ( not ( = ?auto_199491 ?auto_199500 ) ) ( not ( = ?auto_199492 ?auto_199493 ) ) ( not ( = ?auto_199492 ?auto_199494 ) ) ( not ( = ?auto_199492 ?auto_199495 ) ) ( not ( = ?auto_199492 ?auto_199496 ) ) ( not ( = ?auto_199492 ?auto_199497 ) ) ( not ( = ?auto_199492 ?auto_199498 ) ) ( not ( = ?auto_199492 ?auto_199499 ) ) ( not ( = ?auto_199492 ?auto_199500 ) ) ( not ( = ?auto_199493 ?auto_199494 ) ) ( not ( = ?auto_199493 ?auto_199495 ) ) ( not ( = ?auto_199493 ?auto_199496 ) ) ( not ( = ?auto_199493 ?auto_199497 ) ) ( not ( = ?auto_199493 ?auto_199498 ) ) ( not ( = ?auto_199493 ?auto_199499 ) ) ( not ( = ?auto_199493 ?auto_199500 ) ) ( not ( = ?auto_199494 ?auto_199495 ) ) ( not ( = ?auto_199494 ?auto_199496 ) ) ( not ( = ?auto_199494 ?auto_199497 ) ) ( not ( = ?auto_199494 ?auto_199498 ) ) ( not ( = ?auto_199494 ?auto_199499 ) ) ( not ( = ?auto_199494 ?auto_199500 ) ) ( not ( = ?auto_199495 ?auto_199496 ) ) ( not ( = ?auto_199495 ?auto_199497 ) ) ( not ( = ?auto_199495 ?auto_199498 ) ) ( not ( = ?auto_199495 ?auto_199499 ) ) ( not ( = ?auto_199495 ?auto_199500 ) ) ( not ( = ?auto_199496 ?auto_199497 ) ) ( not ( = ?auto_199496 ?auto_199498 ) ) ( not ( = ?auto_199496 ?auto_199499 ) ) ( not ( = ?auto_199496 ?auto_199500 ) ) ( not ( = ?auto_199497 ?auto_199498 ) ) ( not ( = ?auto_199497 ?auto_199499 ) ) ( not ( = ?auto_199497 ?auto_199500 ) ) ( not ( = ?auto_199498 ?auto_199499 ) ) ( not ( = ?auto_199498 ?auto_199500 ) ) ( not ( = ?auto_199499 ?auto_199500 ) ) ( ON ?auto_199498 ?auto_199499 ) ( ON ?auto_199497 ?auto_199498 ) ( CLEAR ?auto_199495 ) ( ON ?auto_199496 ?auto_199497 ) ( CLEAR ?auto_199496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_199488 ?auto_199489 ?auto_199490 ?auto_199491 ?auto_199492 ?auto_199493 ?auto_199494 ?auto_199495 ?auto_199496 )
      ( MAKE-12PILE ?auto_199488 ?auto_199489 ?auto_199490 ?auto_199491 ?auto_199492 ?auto_199493 ?auto_199494 ?auto_199495 ?auto_199496 ?auto_199497 ?auto_199498 ?auto_199499 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_199513 - BLOCK
      ?auto_199514 - BLOCK
      ?auto_199515 - BLOCK
      ?auto_199516 - BLOCK
      ?auto_199517 - BLOCK
      ?auto_199518 - BLOCK
      ?auto_199519 - BLOCK
      ?auto_199520 - BLOCK
      ?auto_199521 - BLOCK
      ?auto_199522 - BLOCK
      ?auto_199523 - BLOCK
      ?auto_199524 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199524 ) ( ON-TABLE ?auto_199513 ) ( ON ?auto_199514 ?auto_199513 ) ( ON ?auto_199515 ?auto_199514 ) ( ON ?auto_199516 ?auto_199515 ) ( ON ?auto_199517 ?auto_199516 ) ( ON ?auto_199518 ?auto_199517 ) ( ON ?auto_199519 ?auto_199518 ) ( ON ?auto_199520 ?auto_199519 ) ( not ( = ?auto_199513 ?auto_199514 ) ) ( not ( = ?auto_199513 ?auto_199515 ) ) ( not ( = ?auto_199513 ?auto_199516 ) ) ( not ( = ?auto_199513 ?auto_199517 ) ) ( not ( = ?auto_199513 ?auto_199518 ) ) ( not ( = ?auto_199513 ?auto_199519 ) ) ( not ( = ?auto_199513 ?auto_199520 ) ) ( not ( = ?auto_199513 ?auto_199521 ) ) ( not ( = ?auto_199513 ?auto_199522 ) ) ( not ( = ?auto_199513 ?auto_199523 ) ) ( not ( = ?auto_199513 ?auto_199524 ) ) ( not ( = ?auto_199514 ?auto_199515 ) ) ( not ( = ?auto_199514 ?auto_199516 ) ) ( not ( = ?auto_199514 ?auto_199517 ) ) ( not ( = ?auto_199514 ?auto_199518 ) ) ( not ( = ?auto_199514 ?auto_199519 ) ) ( not ( = ?auto_199514 ?auto_199520 ) ) ( not ( = ?auto_199514 ?auto_199521 ) ) ( not ( = ?auto_199514 ?auto_199522 ) ) ( not ( = ?auto_199514 ?auto_199523 ) ) ( not ( = ?auto_199514 ?auto_199524 ) ) ( not ( = ?auto_199515 ?auto_199516 ) ) ( not ( = ?auto_199515 ?auto_199517 ) ) ( not ( = ?auto_199515 ?auto_199518 ) ) ( not ( = ?auto_199515 ?auto_199519 ) ) ( not ( = ?auto_199515 ?auto_199520 ) ) ( not ( = ?auto_199515 ?auto_199521 ) ) ( not ( = ?auto_199515 ?auto_199522 ) ) ( not ( = ?auto_199515 ?auto_199523 ) ) ( not ( = ?auto_199515 ?auto_199524 ) ) ( not ( = ?auto_199516 ?auto_199517 ) ) ( not ( = ?auto_199516 ?auto_199518 ) ) ( not ( = ?auto_199516 ?auto_199519 ) ) ( not ( = ?auto_199516 ?auto_199520 ) ) ( not ( = ?auto_199516 ?auto_199521 ) ) ( not ( = ?auto_199516 ?auto_199522 ) ) ( not ( = ?auto_199516 ?auto_199523 ) ) ( not ( = ?auto_199516 ?auto_199524 ) ) ( not ( = ?auto_199517 ?auto_199518 ) ) ( not ( = ?auto_199517 ?auto_199519 ) ) ( not ( = ?auto_199517 ?auto_199520 ) ) ( not ( = ?auto_199517 ?auto_199521 ) ) ( not ( = ?auto_199517 ?auto_199522 ) ) ( not ( = ?auto_199517 ?auto_199523 ) ) ( not ( = ?auto_199517 ?auto_199524 ) ) ( not ( = ?auto_199518 ?auto_199519 ) ) ( not ( = ?auto_199518 ?auto_199520 ) ) ( not ( = ?auto_199518 ?auto_199521 ) ) ( not ( = ?auto_199518 ?auto_199522 ) ) ( not ( = ?auto_199518 ?auto_199523 ) ) ( not ( = ?auto_199518 ?auto_199524 ) ) ( not ( = ?auto_199519 ?auto_199520 ) ) ( not ( = ?auto_199519 ?auto_199521 ) ) ( not ( = ?auto_199519 ?auto_199522 ) ) ( not ( = ?auto_199519 ?auto_199523 ) ) ( not ( = ?auto_199519 ?auto_199524 ) ) ( not ( = ?auto_199520 ?auto_199521 ) ) ( not ( = ?auto_199520 ?auto_199522 ) ) ( not ( = ?auto_199520 ?auto_199523 ) ) ( not ( = ?auto_199520 ?auto_199524 ) ) ( not ( = ?auto_199521 ?auto_199522 ) ) ( not ( = ?auto_199521 ?auto_199523 ) ) ( not ( = ?auto_199521 ?auto_199524 ) ) ( not ( = ?auto_199522 ?auto_199523 ) ) ( not ( = ?auto_199522 ?auto_199524 ) ) ( not ( = ?auto_199523 ?auto_199524 ) ) ( ON ?auto_199523 ?auto_199524 ) ( ON ?auto_199522 ?auto_199523 ) ( CLEAR ?auto_199520 ) ( ON ?auto_199521 ?auto_199522 ) ( CLEAR ?auto_199521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_199513 ?auto_199514 ?auto_199515 ?auto_199516 ?auto_199517 ?auto_199518 ?auto_199519 ?auto_199520 ?auto_199521 )
      ( MAKE-12PILE ?auto_199513 ?auto_199514 ?auto_199515 ?auto_199516 ?auto_199517 ?auto_199518 ?auto_199519 ?auto_199520 ?auto_199521 ?auto_199522 ?auto_199523 ?auto_199524 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_199537 - BLOCK
      ?auto_199538 - BLOCK
      ?auto_199539 - BLOCK
      ?auto_199540 - BLOCK
      ?auto_199541 - BLOCK
      ?auto_199542 - BLOCK
      ?auto_199543 - BLOCK
      ?auto_199544 - BLOCK
      ?auto_199545 - BLOCK
      ?auto_199546 - BLOCK
      ?auto_199547 - BLOCK
      ?auto_199548 - BLOCK
    )
    :vars
    (
      ?auto_199549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199548 ?auto_199549 ) ( ON-TABLE ?auto_199537 ) ( ON ?auto_199538 ?auto_199537 ) ( ON ?auto_199539 ?auto_199538 ) ( ON ?auto_199540 ?auto_199539 ) ( ON ?auto_199541 ?auto_199540 ) ( ON ?auto_199542 ?auto_199541 ) ( ON ?auto_199543 ?auto_199542 ) ( not ( = ?auto_199537 ?auto_199538 ) ) ( not ( = ?auto_199537 ?auto_199539 ) ) ( not ( = ?auto_199537 ?auto_199540 ) ) ( not ( = ?auto_199537 ?auto_199541 ) ) ( not ( = ?auto_199537 ?auto_199542 ) ) ( not ( = ?auto_199537 ?auto_199543 ) ) ( not ( = ?auto_199537 ?auto_199544 ) ) ( not ( = ?auto_199537 ?auto_199545 ) ) ( not ( = ?auto_199537 ?auto_199546 ) ) ( not ( = ?auto_199537 ?auto_199547 ) ) ( not ( = ?auto_199537 ?auto_199548 ) ) ( not ( = ?auto_199537 ?auto_199549 ) ) ( not ( = ?auto_199538 ?auto_199539 ) ) ( not ( = ?auto_199538 ?auto_199540 ) ) ( not ( = ?auto_199538 ?auto_199541 ) ) ( not ( = ?auto_199538 ?auto_199542 ) ) ( not ( = ?auto_199538 ?auto_199543 ) ) ( not ( = ?auto_199538 ?auto_199544 ) ) ( not ( = ?auto_199538 ?auto_199545 ) ) ( not ( = ?auto_199538 ?auto_199546 ) ) ( not ( = ?auto_199538 ?auto_199547 ) ) ( not ( = ?auto_199538 ?auto_199548 ) ) ( not ( = ?auto_199538 ?auto_199549 ) ) ( not ( = ?auto_199539 ?auto_199540 ) ) ( not ( = ?auto_199539 ?auto_199541 ) ) ( not ( = ?auto_199539 ?auto_199542 ) ) ( not ( = ?auto_199539 ?auto_199543 ) ) ( not ( = ?auto_199539 ?auto_199544 ) ) ( not ( = ?auto_199539 ?auto_199545 ) ) ( not ( = ?auto_199539 ?auto_199546 ) ) ( not ( = ?auto_199539 ?auto_199547 ) ) ( not ( = ?auto_199539 ?auto_199548 ) ) ( not ( = ?auto_199539 ?auto_199549 ) ) ( not ( = ?auto_199540 ?auto_199541 ) ) ( not ( = ?auto_199540 ?auto_199542 ) ) ( not ( = ?auto_199540 ?auto_199543 ) ) ( not ( = ?auto_199540 ?auto_199544 ) ) ( not ( = ?auto_199540 ?auto_199545 ) ) ( not ( = ?auto_199540 ?auto_199546 ) ) ( not ( = ?auto_199540 ?auto_199547 ) ) ( not ( = ?auto_199540 ?auto_199548 ) ) ( not ( = ?auto_199540 ?auto_199549 ) ) ( not ( = ?auto_199541 ?auto_199542 ) ) ( not ( = ?auto_199541 ?auto_199543 ) ) ( not ( = ?auto_199541 ?auto_199544 ) ) ( not ( = ?auto_199541 ?auto_199545 ) ) ( not ( = ?auto_199541 ?auto_199546 ) ) ( not ( = ?auto_199541 ?auto_199547 ) ) ( not ( = ?auto_199541 ?auto_199548 ) ) ( not ( = ?auto_199541 ?auto_199549 ) ) ( not ( = ?auto_199542 ?auto_199543 ) ) ( not ( = ?auto_199542 ?auto_199544 ) ) ( not ( = ?auto_199542 ?auto_199545 ) ) ( not ( = ?auto_199542 ?auto_199546 ) ) ( not ( = ?auto_199542 ?auto_199547 ) ) ( not ( = ?auto_199542 ?auto_199548 ) ) ( not ( = ?auto_199542 ?auto_199549 ) ) ( not ( = ?auto_199543 ?auto_199544 ) ) ( not ( = ?auto_199543 ?auto_199545 ) ) ( not ( = ?auto_199543 ?auto_199546 ) ) ( not ( = ?auto_199543 ?auto_199547 ) ) ( not ( = ?auto_199543 ?auto_199548 ) ) ( not ( = ?auto_199543 ?auto_199549 ) ) ( not ( = ?auto_199544 ?auto_199545 ) ) ( not ( = ?auto_199544 ?auto_199546 ) ) ( not ( = ?auto_199544 ?auto_199547 ) ) ( not ( = ?auto_199544 ?auto_199548 ) ) ( not ( = ?auto_199544 ?auto_199549 ) ) ( not ( = ?auto_199545 ?auto_199546 ) ) ( not ( = ?auto_199545 ?auto_199547 ) ) ( not ( = ?auto_199545 ?auto_199548 ) ) ( not ( = ?auto_199545 ?auto_199549 ) ) ( not ( = ?auto_199546 ?auto_199547 ) ) ( not ( = ?auto_199546 ?auto_199548 ) ) ( not ( = ?auto_199546 ?auto_199549 ) ) ( not ( = ?auto_199547 ?auto_199548 ) ) ( not ( = ?auto_199547 ?auto_199549 ) ) ( not ( = ?auto_199548 ?auto_199549 ) ) ( ON ?auto_199547 ?auto_199548 ) ( ON ?auto_199546 ?auto_199547 ) ( ON ?auto_199545 ?auto_199546 ) ( CLEAR ?auto_199543 ) ( ON ?auto_199544 ?auto_199545 ) ( CLEAR ?auto_199544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_199537 ?auto_199538 ?auto_199539 ?auto_199540 ?auto_199541 ?auto_199542 ?auto_199543 ?auto_199544 )
      ( MAKE-12PILE ?auto_199537 ?auto_199538 ?auto_199539 ?auto_199540 ?auto_199541 ?auto_199542 ?auto_199543 ?auto_199544 ?auto_199545 ?auto_199546 ?auto_199547 ?auto_199548 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_199562 - BLOCK
      ?auto_199563 - BLOCK
      ?auto_199564 - BLOCK
      ?auto_199565 - BLOCK
      ?auto_199566 - BLOCK
      ?auto_199567 - BLOCK
      ?auto_199568 - BLOCK
      ?auto_199569 - BLOCK
      ?auto_199570 - BLOCK
      ?auto_199571 - BLOCK
      ?auto_199572 - BLOCK
      ?auto_199573 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199573 ) ( ON-TABLE ?auto_199562 ) ( ON ?auto_199563 ?auto_199562 ) ( ON ?auto_199564 ?auto_199563 ) ( ON ?auto_199565 ?auto_199564 ) ( ON ?auto_199566 ?auto_199565 ) ( ON ?auto_199567 ?auto_199566 ) ( ON ?auto_199568 ?auto_199567 ) ( not ( = ?auto_199562 ?auto_199563 ) ) ( not ( = ?auto_199562 ?auto_199564 ) ) ( not ( = ?auto_199562 ?auto_199565 ) ) ( not ( = ?auto_199562 ?auto_199566 ) ) ( not ( = ?auto_199562 ?auto_199567 ) ) ( not ( = ?auto_199562 ?auto_199568 ) ) ( not ( = ?auto_199562 ?auto_199569 ) ) ( not ( = ?auto_199562 ?auto_199570 ) ) ( not ( = ?auto_199562 ?auto_199571 ) ) ( not ( = ?auto_199562 ?auto_199572 ) ) ( not ( = ?auto_199562 ?auto_199573 ) ) ( not ( = ?auto_199563 ?auto_199564 ) ) ( not ( = ?auto_199563 ?auto_199565 ) ) ( not ( = ?auto_199563 ?auto_199566 ) ) ( not ( = ?auto_199563 ?auto_199567 ) ) ( not ( = ?auto_199563 ?auto_199568 ) ) ( not ( = ?auto_199563 ?auto_199569 ) ) ( not ( = ?auto_199563 ?auto_199570 ) ) ( not ( = ?auto_199563 ?auto_199571 ) ) ( not ( = ?auto_199563 ?auto_199572 ) ) ( not ( = ?auto_199563 ?auto_199573 ) ) ( not ( = ?auto_199564 ?auto_199565 ) ) ( not ( = ?auto_199564 ?auto_199566 ) ) ( not ( = ?auto_199564 ?auto_199567 ) ) ( not ( = ?auto_199564 ?auto_199568 ) ) ( not ( = ?auto_199564 ?auto_199569 ) ) ( not ( = ?auto_199564 ?auto_199570 ) ) ( not ( = ?auto_199564 ?auto_199571 ) ) ( not ( = ?auto_199564 ?auto_199572 ) ) ( not ( = ?auto_199564 ?auto_199573 ) ) ( not ( = ?auto_199565 ?auto_199566 ) ) ( not ( = ?auto_199565 ?auto_199567 ) ) ( not ( = ?auto_199565 ?auto_199568 ) ) ( not ( = ?auto_199565 ?auto_199569 ) ) ( not ( = ?auto_199565 ?auto_199570 ) ) ( not ( = ?auto_199565 ?auto_199571 ) ) ( not ( = ?auto_199565 ?auto_199572 ) ) ( not ( = ?auto_199565 ?auto_199573 ) ) ( not ( = ?auto_199566 ?auto_199567 ) ) ( not ( = ?auto_199566 ?auto_199568 ) ) ( not ( = ?auto_199566 ?auto_199569 ) ) ( not ( = ?auto_199566 ?auto_199570 ) ) ( not ( = ?auto_199566 ?auto_199571 ) ) ( not ( = ?auto_199566 ?auto_199572 ) ) ( not ( = ?auto_199566 ?auto_199573 ) ) ( not ( = ?auto_199567 ?auto_199568 ) ) ( not ( = ?auto_199567 ?auto_199569 ) ) ( not ( = ?auto_199567 ?auto_199570 ) ) ( not ( = ?auto_199567 ?auto_199571 ) ) ( not ( = ?auto_199567 ?auto_199572 ) ) ( not ( = ?auto_199567 ?auto_199573 ) ) ( not ( = ?auto_199568 ?auto_199569 ) ) ( not ( = ?auto_199568 ?auto_199570 ) ) ( not ( = ?auto_199568 ?auto_199571 ) ) ( not ( = ?auto_199568 ?auto_199572 ) ) ( not ( = ?auto_199568 ?auto_199573 ) ) ( not ( = ?auto_199569 ?auto_199570 ) ) ( not ( = ?auto_199569 ?auto_199571 ) ) ( not ( = ?auto_199569 ?auto_199572 ) ) ( not ( = ?auto_199569 ?auto_199573 ) ) ( not ( = ?auto_199570 ?auto_199571 ) ) ( not ( = ?auto_199570 ?auto_199572 ) ) ( not ( = ?auto_199570 ?auto_199573 ) ) ( not ( = ?auto_199571 ?auto_199572 ) ) ( not ( = ?auto_199571 ?auto_199573 ) ) ( not ( = ?auto_199572 ?auto_199573 ) ) ( ON ?auto_199572 ?auto_199573 ) ( ON ?auto_199571 ?auto_199572 ) ( ON ?auto_199570 ?auto_199571 ) ( CLEAR ?auto_199568 ) ( ON ?auto_199569 ?auto_199570 ) ( CLEAR ?auto_199569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_199562 ?auto_199563 ?auto_199564 ?auto_199565 ?auto_199566 ?auto_199567 ?auto_199568 ?auto_199569 )
      ( MAKE-12PILE ?auto_199562 ?auto_199563 ?auto_199564 ?auto_199565 ?auto_199566 ?auto_199567 ?auto_199568 ?auto_199569 ?auto_199570 ?auto_199571 ?auto_199572 ?auto_199573 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_199586 - BLOCK
      ?auto_199587 - BLOCK
      ?auto_199588 - BLOCK
      ?auto_199589 - BLOCK
      ?auto_199590 - BLOCK
      ?auto_199591 - BLOCK
      ?auto_199592 - BLOCK
      ?auto_199593 - BLOCK
      ?auto_199594 - BLOCK
      ?auto_199595 - BLOCK
      ?auto_199596 - BLOCK
      ?auto_199597 - BLOCK
    )
    :vars
    (
      ?auto_199598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199597 ?auto_199598 ) ( ON-TABLE ?auto_199586 ) ( ON ?auto_199587 ?auto_199586 ) ( ON ?auto_199588 ?auto_199587 ) ( ON ?auto_199589 ?auto_199588 ) ( ON ?auto_199590 ?auto_199589 ) ( ON ?auto_199591 ?auto_199590 ) ( not ( = ?auto_199586 ?auto_199587 ) ) ( not ( = ?auto_199586 ?auto_199588 ) ) ( not ( = ?auto_199586 ?auto_199589 ) ) ( not ( = ?auto_199586 ?auto_199590 ) ) ( not ( = ?auto_199586 ?auto_199591 ) ) ( not ( = ?auto_199586 ?auto_199592 ) ) ( not ( = ?auto_199586 ?auto_199593 ) ) ( not ( = ?auto_199586 ?auto_199594 ) ) ( not ( = ?auto_199586 ?auto_199595 ) ) ( not ( = ?auto_199586 ?auto_199596 ) ) ( not ( = ?auto_199586 ?auto_199597 ) ) ( not ( = ?auto_199586 ?auto_199598 ) ) ( not ( = ?auto_199587 ?auto_199588 ) ) ( not ( = ?auto_199587 ?auto_199589 ) ) ( not ( = ?auto_199587 ?auto_199590 ) ) ( not ( = ?auto_199587 ?auto_199591 ) ) ( not ( = ?auto_199587 ?auto_199592 ) ) ( not ( = ?auto_199587 ?auto_199593 ) ) ( not ( = ?auto_199587 ?auto_199594 ) ) ( not ( = ?auto_199587 ?auto_199595 ) ) ( not ( = ?auto_199587 ?auto_199596 ) ) ( not ( = ?auto_199587 ?auto_199597 ) ) ( not ( = ?auto_199587 ?auto_199598 ) ) ( not ( = ?auto_199588 ?auto_199589 ) ) ( not ( = ?auto_199588 ?auto_199590 ) ) ( not ( = ?auto_199588 ?auto_199591 ) ) ( not ( = ?auto_199588 ?auto_199592 ) ) ( not ( = ?auto_199588 ?auto_199593 ) ) ( not ( = ?auto_199588 ?auto_199594 ) ) ( not ( = ?auto_199588 ?auto_199595 ) ) ( not ( = ?auto_199588 ?auto_199596 ) ) ( not ( = ?auto_199588 ?auto_199597 ) ) ( not ( = ?auto_199588 ?auto_199598 ) ) ( not ( = ?auto_199589 ?auto_199590 ) ) ( not ( = ?auto_199589 ?auto_199591 ) ) ( not ( = ?auto_199589 ?auto_199592 ) ) ( not ( = ?auto_199589 ?auto_199593 ) ) ( not ( = ?auto_199589 ?auto_199594 ) ) ( not ( = ?auto_199589 ?auto_199595 ) ) ( not ( = ?auto_199589 ?auto_199596 ) ) ( not ( = ?auto_199589 ?auto_199597 ) ) ( not ( = ?auto_199589 ?auto_199598 ) ) ( not ( = ?auto_199590 ?auto_199591 ) ) ( not ( = ?auto_199590 ?auto_199592 ) ) ( not ( = ?auto_199590 ?auto_199593 ) ) ( not ( = ?auto_199590 ?auto_199594 ) ) ( not ( = ?auto_199590 ?auto_199595 ) ) ( not ( = ?auto_199590 ?auto_199596 ) ) ( not ( = ?auto_199590 ?auto_199597 ) ) ( not ( = ?auto_199590 ?auto_199598 ) ) ( not ( = ?auto_199591 ?auto_199592 ) ) ( not ( = ?auto_199591 ?auto_199593 ) ) ( not ( = ?auto_199591 ?auto_199594 ) ) ( not ( = ?auto_199591 ?auto_199595 ) ) ( not ( = ?auto_199591 ?auto_199596 ) ) ( not ( = ?auto_199591 ?auto_199597 ) ) ( not ( = ?auto_199591 ?auto_199598 ) ) ( not ( = ?auto_199592 ?auto_199593 ) ) ( not ( = ?auto_199592 ?auto_199594 ) ) ( not ( = ?auto_199592 ?auto_199595 ) ) ( not ( = ?auto_199592 ?auto_199596 ) ) ( not ( = ?auto_199592 ?auto_199597 ) ) ( not ( = ?auto_199592 ?auto_199598 ) ) ( not ( = ?auto_199593 ?auto_199594 ) ) ( not ( = ?auto_199593 ?auto_199595 ) ) ( not ( = ?auto_199593 ?auto_199596 ) ) ( not ( = ?auto_199593 ?auto_199597 ) ) ( not ( = ?auto_199593 ?auto_199598 ) ) ( not ( = ?auto_199594 ?auto_199595 ) ) ( not ( = ?auto_199594 ?auto_199596 ) ) ( not ( = ?auto_199594 ?auto_199597 ) ) ( not ( = ?auto_199594 ?auto_199598 ) ) ( not ( = ?auto_199595 ?auto_199596 ) ) ( not ( = ?auto_199595 ?auto_199597 ) ) ( not ( = ?auto_199595 ?auto_199598 ) ) ( not ( = ?auto_199596 ?auto_199597 ) ) ( not ( = ?auto_199596 ?auto_199598 ) ) ( not ( = ?auto_199597 ?auto_199598 ) ) ( ON ?auto_199596 ?auto_199597 ) ( ON ?auto_199595 ?auto_199596 ) ( ON ?auto_199594 ?auto_199595 ) ( ON ?auto_199593 ?auto_199594 ) ( CLEAR ?auto_199591 ) ( ON ?auto_199592 ?auto_199593 ) ( CLEAR ?auto_199592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_199586 ?auto_199587 ?auto_199588 ?auto_199589 ?auto_199590 ?auto_199591 ?auto_199592 )
      ( MAKE-12PILE ?auto_199586 ?auto_199587 ?auto_199588 ?auto_199589 ?auto_199590 ?auto_199591 ?auto_199592 ?auto_199593 ?auto_199594 ?auto_199595 ?auto_199596 ?auto_199597 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_199611 - BLOCK
      ?auto_199612 - BLOCK
      ?auto_199613 - BLOCK
      ?auto_199614 - BLOCK
      ?auto_199615 - BLOCK
      ?auto_199616 - BLOCK
      ?auto_199617 - BLOCK
      ?auto_199618 - BLOCK
      ?auto_199619 - BLOCK
      ?auto_199620 - BLOCK
      ?auto_199621 - BLOCK
      ?auto_199622 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199622 ) ( ON-TABLE ?auto_199611 ) ( ON ?auto_199612 ?auto_199611 ) ( ON ?auto_199613 ?auto_199612 ) ( ON ?auto_199614 ?auto_199613 ) ( ON ?auto_199615 ?auto_199614 ) ( ON ?auto_199616 ?auto_199615 ) ( not ( = ?auto_199611 ?auto_199612 ) ) ( not ( = ?auto_199611 ?auto_199613 ) ) ( not ( = ?auto_199611 ?auto_199614 ) ) ( not ( = ?auto_199611 ?auto_199615 ) ) ( not ( = ?auto_199611 ?auto_199616 ) ) ( not ( = ?auto_199611 ?auto_199617 ) ) ( not ( = ?auto_199611 ?auto_199618 ) ) ( not ( = ?auto_199611 ?auto_199619 ) ) ( not ( = ?auto_199611 ?auto_199620 ) ) ( not ( = ?auto_199611 ?auto_199621 ) ) ( not ( = ?auto_199611 ?auto_199622 ) ) ( not ( = ?auto_199612 ?auto_199613 ) ) ( not ( = ?auto_199612 ?auto_199614 ) ) ( not ( = ?auto_199612 ?auto_199615 ) ) ( not ( = ?auto_199612 ?auto_199616 ) ) ( not ( = ?auto_199612 ?auto_199617 ) ) ( not ( = ?auto_199612 ?auto_199618 ) ) ( not ( = ?auto_199612 ?auto_199619 ) ) ( not ( = ?auto_199612 ?auto_199620 ) ) ( not ( = ?auto_199612 ?auto_199621 ) ) ( not ( = ?auto_199612 ?auto_199622 ) ) ( not ( = ?auto_199613 ?auto_199614 ) ) ( not ( = ?auto_199613 ?auto_199615 ) ) ( not ( = ?auto_199613 ?auto_199616 ) ) ( not ( = ?auto_199613 ?auto_199617 ) ) ( not ( = ?auto_199613 ?auto_199618 ) ) ( not ( = ?auto_199613 ?auto_199619 ) ) ( not ( = ?auto_199613 ?auto_199620 ) ) ( not ( = ?auto_199613 ?auto_199621 ) ) ( not ( = ?auto_199613 ?auto_199622 ) ) ( not ( = ?auto_199614 ?auto_199615 ) ) ( not ( = ?auto_199614 ?auto_199616 ) ) ( not ( = ?auto_199614 ?auto_199617 ) ) ( not ( = ?auto_199614 ?auto_199618 ) ) ( not ( = ?auto_199614 ?auto_199619 ) ) ( not ( = ?auto_199614 ?auto_199620 ) ) ( not ( = ?auto_199614 ?auto_199621 ) ) ( not ( = ?auto_199614 ?auto_199622 ) ) ( not ( = ?auto_199615 ?auto_199616 ) ) ( not ( = ?auto_199615 ?auto_199617 ) ) ( not ( = ?auto_199615 ?auto_199618 ) ) ( not ( = ?auto_199615 ?auto_199619 ) ) ( not ( = ?auto_199615 ?auto_199620 ) ) ( not ( = ?auto_199615 ?auto_199621 ) ) ( not ( = ?auto_199615 ?auto_199622 ) ) ( not ( = ?auto_199616 ?auto_199617 ) ) ( not ( = ?auto_199616 ?auto_199618 ) ) ( not ( = ?auto_199616 ?auto_199619 ) ) ( not ( = ?auto_199616 ?auto_199620 ) ) ( not ( = ?auto_199616 ?auto_199621 ) ) ( not ( = ?auto_199616 ?auto_199622 ) ) ( not ( = ?auto_199617 ?auto_199618 ) ) ( not ( = ?auto_199617 ?auto_199619 ) ) ( not ( = ?auto_199617 ?auto_199620 ) ) ( not ( = ?auto_199617 ?auto_199621 ) ) ( not ( = ?auto_199617 ?auto_199622 ) ) ( not ( = ?auto_199618 ?auto_199619 ) ) ( not ( = ?auto_199618 ?auto_199620 ) ) ( not ( = ?auto_199618 ?auto_199621 ) ) ( not ( = ?auto_199618 ?auto_199622 ) ) ( not ( = ?auto_199619 ?auto_199620 ) ) ( not ( = ?auto_199619 ?auto_199621 ) ) ( not ( = ?auto_199619 ?auto_199622 ) ) ( not ( = ?auto_199620 ?auto_199621 ) ) ( not ( = ?auto_199620 ?auto_199622 ) ) ( not ( = ?auto_199621 ?auto_199622 ) ) ( ON ?auto_199621 ?auto_199622 ) ( ON ?auto_199620 ?auto_199621 ) ( ON ?auto_199619 ?auto_199620 ) ( ON ?auto_199618 ?auto_199619 ) ( CLEAR ?auto_199616 ) ( ON ?auto_199617 ?auto_199618 ) ( CLEAR ?auto_199617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_199611 ?auto_199612 ?auto_199613 ?auto_199614 ?auto_199615 ?auto_199616 ?auto_199617 )
      ( MAKE-12PILE ?auto_199611 ?auto_199612 ?auto_199613 ?auto_199614 ?auto_199615 ?auto_199616 ?auto_199617 ?auto_199618 ?auto_199619 ?auto_199620 ?auto_199621 ?auto_199622 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_199635 - BLOCK
      ?auto_199636 - BLOCK
      ?auto_199637 - BLOCK
      ?auto_199638 - BLOCK
      ?auto_199639 - BLOCK
      ?auto_199640 - BLOCK
      ?auto_199641 - BLOCK
      ?auto_199642 - BLOCK
      ?auto_199643 - BLOCK
      ?auto_199644 - BLOCK
      ?auto_199645 - BLOCK
      ?auto_199646 - BLOCK
    )
    :vars
    (
      ?auto_199647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199646 ?auto_199647 ) ( ON-TABLE ?auto_199635 ) ( ON ?auto_199636 ?auto_199635 ) ( ON ?auto_199637 ?auto_199636 ) ( ON ?auto_199638 ?auto_199637 ) ( ON ?auto_199639 ?auto_199638 ) ( not ( = ?auto_199635 ?auto_199636 ) ) ( not ( = ?auto_199635 ?auto_199637 ) ) ( not ( = ?auto_199635 ?auto_199638 ) ) ( not ( = ?auto_199635 ?auto_199639 ) ) ( not ( = ?auto_199635 ?auto_199640 ) ) ( not ( = ?auto_199635 ?auto_199641 ) ) ( not ( = ?auto_199635 ?auto_199642 ) ) ( not ( = ?auto_199635 ?auto_199643 ) ) ( not ( = ?auto_199635 ?auto_199644 ) ) ( not ( = ?auto_199635 ?auto_199645 ) ) ( not ( = ?auto_199635 ?auto_199646 ) ) ( not ( = ?auto_199635 ?auto_199647 ) ) ( not ( = ?auto_199636 ?auto_199637 ) ) ( not ( = ?auto_199636 ?auto_199638 ) ) ( not ( = ?auto_199636 ?auto_199639 ) ) ( not ( = ?auto_199636 ?auto_199640 ) ) ( not ( = ?auto_199636 ?auto_199641 ) ) ( not ( = ?auto_199636 ?auto_199642 ) ) ( not ( = ?auto_199636 ?auto_199643 ) ) ( not ( = ?auto_199636 ?auto_199644 ) ) ( not ( = ?auto_199636 ?auto_199645 ) ) ( not ( = ?auto_199636 ?auto_199646 ) ) ( not ( = ?auto_199636 ?auto_199647 ) ) ( not ( = ?auto_199637 ?auto_199638 ) ) ( not ( = ?auto_199637 ?auto_199639 ) ) ( not ( = ?auto_199637 ?auto_199640 ) ) ( not ( = ?auto_199637 ?auto_199641 ) ) ( not ( = ?auto_199637 ?auto_199642 ) ) ( not ( = ?auto_199637 ?auto_199643 ) ) ( not ( = ?auto_199637 ?auto_199644 ) ) ( not ( = ?auto_199637 ?auto_199645 ) ) ( not ( = ?auto_199637 ?auto_199646 ) ) ( not ( = ?auto_199637 ?auto_199647 ) ) ( not ( = ?auto_199638 ?auto_199639 ) ) ( not ( = ?auto_199638 ?auto_199640 ) ) ( not ( = ?auto_199638 ?auto_199641 ) ) ( not ( = ?auto_199638 ?auto_199642 ) ) ( not ( = ?auto_199638 ?auto_199643 ) ) ( not ( = ?auto_199638 ?auto_199644 ) ) ( not ( = ?auto_199638 ?auto_199645 ) ) ( not ( = ?auto_199638 ?auto_199646 ) ) ( not ( = ?auto_199638 ?auto_199647 ) ) ( not ( = ?auto_199639 ?auto_199640 ) ) ( not ( = ?auto_199639 ?auto_199641 ) ) ( not ( = ?auto_199639 ?auto_199642 ) ) ( not ( = ?auto_199639 ?auto_199643 ) ) ( not ( = ?auto_199639 ?auto_199644 ) ) ( not ( = ?auto_199639 ?auto_199645 ) ) ( not ( = ?auto_199639 ?auto_199646 ) ) ( not ( = ?auto_199639 ?auto_199647 ) ) ( not ( = ?auto_199640 ?auto_199641 ) ) ( not ( = ?auto_199640 ?auto_199642 ) ) ( not ( = ?auto_199640 ?auto_199643 ) ) ( not ( = ?auto_199640 ?auto_199644 ) ) ( not ( = ?auto_199640 ?auto_199645 ) ) ( not ( = ?auto_199640 ?auto_199646 ) ) ( not ( = ?auto_199640 ?auto_199647 ) ) ( not ( = ?auto_199641 ?auto_199642 ) ) ( not ( = ?auto_199641 ?auto_199643 ) ) ( not ( = ?auto_199641 ?auto_199644 ) ) ( not ( = ?auto_199641 ?auto_199645 ) ) ( not ( = ?auto_199641 ?auto_199646 ) ) ( not ( = ?auto_199641 ?auto_199647 ) ) ( not ( = ?auto_199642 ?auto_199643 ) ) ( not ( = ?auto_199642 ?auto_199644 ) ) ( not ( = ?auto_199642 ?auto_199645 ) ) ( not ( = ?auto_199642 ?auto_199646 ) ) ( not ( = ?auto_199642 ?auto_199647 ) ) ( not ( = ?auto_199643 ?auto_199644 ) ) ( not ( = ?auto_199643 ?auto_199645 ) ) ( not ( = ?auto_199643 ?auto_199646 ) ) ( not ( = ?auto_199643 ?auto_199647 ) ) ( not ( = ?auto_199644 ?auto_199645 ) ) ( not ( = ?auto_199644 ?auto_199646 ) ) ( not ( = ?auto_199644 ?auto_199647 ) ) ( not ( = ?auto_199645 ?auto_199646 ) ) ( not ( = ?auto_199645 ?auto_199647 ) ) ( not ( = ?auto_199646 ?auto_199647 ) ) ( ON ?auto_199645 ?auto_199646 ) ( ON ?auto_199644 ?auto_199645 ) ( ON ?auto_199643 ?auto_199644 ) ( ON ?auto_199642 ?auto_199643 ) ( ON ?auto_199641 ?auto_199642 ) ( CLEAR ?auto_199639 ) ( ON ?auto_199640 ?auto_199641 ) ( CLEAR ?auto_199640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_199635 ?auto_199636 ?auto_199637 ?auto_199638 ?auto_199639 ?auto_199640 )
      ( MAKE-12PILE ?auto_199635 ?auto_199636 ?auto_199637 ?auto_199638 ?auto_199639 ?auto_199640 ?auto_199641 ?auto_199642 ?auto_199643 ?auto_199644 ?auto_199645 ?auto_199646 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_199660 - BLOCK
      ?auto_199661 - BLOCK
      ?auto_199662 - BLOCK
      ?auto_199663 - BLOCK
      ?auto_199664 - BLOCK
      ?auto_199665 - BLOCK
      ?auto_199666 - BLOCK
      ?auto_199667 - BLOCK
      ?auto_199668 - BLOCK
      ?auto_199669 - BLOCK
      ?auto_199670 - BLOCK
      ?auto_199671 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199671 ) ( ON-TABLE ?auto_199660 ) ( ON ?auto_199661 ?auto_199660 ) ( ON ?auto_199662 ?auto_199661 ) ( ON ?auto_199663 ?auto_199662 ) ( ON ?auto_199664 ?auto_199663 ) ( not ( = ?auto_199660 ?auto_199661 ) ) ( not ( = ?auto_199660 ?auto_199662 ) ) ( not ( = ?auto_199660 ?auto_199663 ) ) ( not ( = ?auto_199660 ?auto_199664 ) ) ( not ( = ?auto_199660 ?auto_199665 ) ) ( not ( = ?auto_199660 ?auto_199666 ) ) ( not ( = ?auto_199660 ?auto_199667 ) ) ( not ( = ?auto_199660 ?auto_199668 ) ) ( not ( = ?auto_199660 ?auto_199669 ) ) ( not ( = ?auto_199660 ?auto_199670 ) ) ( not ( = ?auto_199660 ?auto_199671 ) ) ( not ( = ?auto_199661 ?auto_199662 ) ) ( not ( = ?auto_199661 ?auto_199663 ) ) ( not ( = ?auto_199661 ?auto_199664 ) ) ( not ( = ?auto_199661 ?auto_199665 ) ) ( not ( = ?auto_199661 ?auto_199666 ) ) ( not ( = ?auto_199661 ?auto_199667 ) ) ( not ( = ?auto_199661 ?auto_199668 ) ) ( not ( = ?auto_199661 ?auto_199669 ) ) ( not ( = ?auto_199661 ?auto_199670 ) ) ( not ( = ?auto_199661 ?auto_199671 ) ) ( not ( = ?auto_199662 ?auto_199663 ) ) ( not ( = ?auto_199662 ?auto_199664 ) ) ( not ( = ?auto_199662 ?auto_199665 ) ) ( not ( = ?auto_199662 ?auto_199666 ) ) ( not ( = ?auto_199662 ?auto_199667 ) ) ( not ( = ?auto_199662 ?auto_199668 ) ) ( not ( = ?auto_199662 ?auto_199669 ) ) ( not ( = ?auto_199662 ?auto_199670 ) ) ( not ( = ?auto_199662 ?auto_199671 ) ) ( not ( = ?auto_199663 ?auto_199664 ) ) ( not ( = ?auto_199663 ?auto_199665 ) ) ( not ( = ?auto_199663 ?auto_199666 ) ) ( not ( = ?auto_199663 ?auto_199667 ) ) ( not ( = ?auto_199663 ?auto_199668 ) ) ( not ( = ?auto_199663 ?auto_199669 ) ) ( not ( = ?auto_199663 ?auto_199670 ) ) ( not ( = ?auto_199663 ?auto_199671 ) ) ( not ( = ?auto_199664 ?auto_199665 ) ) ( not ( = ?auto_199664 ?auto_199666 ) ) ( not ( = ?auto_199664 ?auto_199667 ) ) ( not ( = ?auto_199664 ?auto_199668 ) ) ( not ( = ?auto_199664 ?auto_199669 ) ) ( not ( = ?auto_199664 ?auto_199670 ) ) ( not ( = ?auto_199664 ?auto_199671 ) ) ( not ( = ?auto_199665 ?auto_199666 ) ) ( not ( = ?auto_199665 ?auto_199667 ) ) ( not ( = ?auto_199665 ?auto_199668 ) ) ( not ( = ?auto_199665 ?auto_199669 ) ) ( not ( = ?auto_199665 ?auto_199670 ) ) ( not ( = ?auto_199665 ?auto_199671 ) ) ( not ( = ?auto_199666 ?auto_199667 ) ) ( not ( = ?auto_199666 ?auto_199668 ) ) ( not ( = ?auto_199666 ?auto_199669 ) ) ( not ( = ?auto_199666 ?auto_199670 ) ) ( not ( = ?auto_199666 ?auto_199671 ) ) ( not ( = ?auto_199667 ?auto_199668 ) ) ( not ( = ?auto_199667 ?auto_199669 ) ) ( not ( = ?auto_199667 ?auto_199670 ) ) ( not ( = ?auto_199667 ?auto_199671 ) ) ( not ( = ?auto_199668 ?auto_199669 ) ) ( not ( = ?auto_199668 ?auto_199670 ) ) ( not ( = ?auto_199668 ?auto_199671 ) ) ( not ( = ?auto_199669 ?auto_199670 ) ) ( not ( = ?auto_199669 ?auto_199671 ) ) ( not ( = ?auto_199670 ?auto_199671 ) ) ( ON ?auto_199670 ?auto_199671 ) ( ON ?auto_199669 ?auto_199670 ) ( ON ?auto_199668 ?auto_199669 ) ( ON ?auto_199667 ?auto_199668 ) ( ON ?auto_199666 ?auto_199667 ) ( CLEAR ?auto_199664 ) ( ON ?auto_199665 ?auto_199666 ) ( CLEAR ?auto_199665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_199660 ?auto_199661 ?auto_199662 ?auto_199663 ?auto_199664 ?auto_199665 )
      ( MAKE-12PILE ?auto_199660 ?auto_199661 ?auto_199662 ?auto_199663 ?auto_199664 ?auto_199665 ?auto_199666 ?auto_199667 ?auto_199668 ?auto_199669 ?auto_199670 ?auto_199671 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_199684 - BLOCK
      ?auto_199685 - BLOCK
      ?auto_199686 - BLOCK
      ?auto_199687 - BLOCK
      ?auto_199688 - BLOCK
      ?auto_199689 - BLOCK
      ?auto_199690 - BLOCK
      ?auto_199691 - BLOCK
      ?auto_199692 - BLOCK
      ?auto_199693 - BLOCK
      ?auto_199694 - BLOCK
      ?auto_199695 - BLOCK
    )
    :vars
    (
      ?auto_199696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199695 ?auto_199696 ) ( ON-TABLE ?auto_199684 ) ( ON ?auto_199685 ?auto_199684 ) ( ON ?auto_199686 ?auto_199685 ) ( ON ?auto_199687 ?auto_199686 ) ( not ( = ?auto_199684 ?auto_199685 ) ) ( not ( = ?auto_199684 ?auto_199686 ) ) ( not ( = ?auto_199684 ?auto_199687 ) ) ( not ( = ?auto_199684 ?auto_199688 ) ) ( not ( = ?auto_199684 ?auto_199689 ) ) ( not ( = ?auto_199684 ?auto_199690 ) ) ( not ( = ?auto_199684 ?auto_199691 ) ) ( not ( = ?auto_199684 ?auto_199692 ) ) ( not ( = ?auto_199684 ?auto_199693 ) ) ( not ( = ?auto_199684 ?auto_199694 ) ) ( not ( = ?auto_199684 ?auto_199695 ) ) ( not ( = ?auto_199684 ?auto_199696 ) ) ( not ( = ?auto_199685 ?auto_199686 ) ) ( not ( = ?auto_199685 ?auto_199687 ) ) ( not ( = ?auto_199685 ?auto_199688 ) ) ( not ( = ?auto_199685 ?auto_199689 ) ) ( not ( = ?auto_199685 ?auto_199690 ) ) ( not ( = ?auto_199685 ?auto_199691 ) ) ( not ( = ?auto_199685 ?auto_199692 ) ) ( not ( = ?auto_199685 ?auto_199693 ) ) ( not ( = ?auto_199685 ?auto_199694 ) ) ( not ( = ?auto_199685 ?auto_199695 ) ) ( not ( = ?auto_199685 ?auto_199696 ) ) ( not ( = ?auto_199686 ?auto_199687 ) ) ( not ( = ?auto_199686 ?auto_199688 ) ) ( not ( = ?auto_199686 ?auto_199689 ) ) ( not ( = ?auto_199686 ?auto_199690 ) ) ( not ( = ?auto_199686 ?auto_199691 ) ) ( not ( = ?auto_199686 ?auto_199692 ) ) ( not ( = ?auto_199686 ?auto_199693 ) ) ( not ( = ?auto_199686 ?auto_199694 ) ) ( not ( = ?auto_199686 ?auto_199695 ) ) ( not ( = ?auto_199686 ?auto_199696 ) ) ( not ( = ?auto_199687 ?auto_199688 ) ) ( not ( = ?auto_199687 ?auto_199689 ) ) ( not ( = ?auto_199687 ?auto_199690 ) ) ( not ( = ?auto_199687 ?auto_199691 ) ) ( not ( = ?auto_199687 ?auto_199692 ) ) ( not ( = ?auto_199687 ?auto_199693 ) ) ( not ( = ?auto_199687 ?auto_199694 ) ) ( not ( = ?auto_199687 ?auto_199695 ) ) ( not ( = ?auto_199687 ?auto_199696 ) ) ( not ( = ?auto_199688 ?auto_199689 ) ) ( not ( = ?auto_199688 ?auto_199690 ) ) ( not ( = ?auto_199688 ?auto_199691 ) ) ( not ( = ?auto_199688 ?auto_199692 ) ) ( not ( = ?auto_199688 ?auto_199693 ) ) ( not ( = ?auto_199688 ?auto_199694 ) ) ( not ( = ?auto_199688 ?auto_199695 ) ) ( not ( = ?auto_199688 ?auto_199696 ) ) ( not ( = ?auto_199689 ?auto_199690 ) ) ( not ( = ?auto_199689 ?auto_199691 ) ) ( not ( = ?auto_199689 ?auto_199692 ) ) ( not ( = ?auto_199689 ?auto_199693 ) ) ( not ( = ?auto_199689 ?auto_199694 ) ) ( not ( = ?auto_199689 ?auto_199695 ) ) ( not ( = ?auto_199689 ?auto_199696 ) ) ( not ( = ?auto_199690 ?auto_199691 ) ) ( not ( = ?auto_199690 ?auto_199692 ) ) ( not ( = ?auto_199690 ?auto_199693 ) ) ( not ( = ?auto_199690 ?auto_199694 ) ) ( not ( = ?auto_199690 ?auto_199695 ) ) ( not ( = ?auto_199690 ?auto_199696 ) ) ( not ( = ?auto_199691 ?auto_199692 ) ) ( not ( = ?auto_199691 ?auto_199693 ) ) ( not ( = ?auto_199691 ?auto_199694 ) ) ( not ( = ?auto_199691 ?auto_199695 ) ) ( not ( = ?auto_199691 ?auto_199696 ) ) ( not ( = ?auto_199692 ?auto_199693 ) ) ( not ( = ?auto_199692 ?auto_199694 ) ) ( not ( = ?auto_199692 ?auto_199695 ) ) ( not ( = ?auto_199692 ?auto_199696 ) ) ( not ( = ?auto_199693 ?auto_199694 ) ) ( not ( = ?auto_199693 ?auto_199695 ) ) ( not ( = ?auto_199693 ?auto_199696 ) ) ( not ( = ?auto_199694 ?auto_199695 ) ) ( not ( = ?auto_199694 ?auto_199696 ) ) ( not ( = ?auto_199695 ?auto_199696 ) ) ( ON ?auto_199694 ?auto_199695 ) ( ON ?auto_199693 ?auto_199694 ) ( ON ?auto_199692 ?auto_199693 ) ( ON ?auto_199691 ?auto_199692 ) ( ON ?auto_199690 ?auto_199691 ) ( ON ?auto_199689 ?auto_199690 ) ( CLEAR ?auto_199687 ) ( ON ?auto_199688 ?auto_199689 ) ( CLEAR ?auto_199688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_199684 ?auto_199685 ?auto_199686 ?auto_199687 ?auto_199688 )
      ( MAKE-12PILE ?auto_199684 ?auto_199685 ?auto_199686 ?auto_199687 ?auto_199688 ?auto_199689 ?auto_199690 ?auto_199691 ?auto_199692 ?auto_199693 ?auto_199694 ?auto_199695 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_199709 - BLOCK
      ?auto_199710 - BLOCK
      ?auto_199711 - BLOCK
      ?auto_199712 - BLOCK
      ?auto_199713 - BLOCK
      ?auto_199714 - BLOCK
      ?auto_199715 - BLOCK
      ?auto_199716 - BLOCK
      ?auto_199717 - BLOCK
      ?auto_199718 - BLOCK
      ?auto_199719 - BLOCK
      ?auto_199720 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199720 ) ( ON-TABLE ?auto_199709 ) ( ON ?auto_199710 ?auto_199709 ) ( ON ?auto_199711 ?auto_199710 ) ( ON ?auto_199712 ?auto_199711 ) ( not ( = ?auto_199709 ?auto_199710 ) ) ( not ( = ?auto_199709 ?auto_199711 ) ) ( not ( = ?auto_199709 ?auto_199712 ) ) ( not ( = ?auto_199709 ?auto_199713 ) ) ( not ( = ?auto_199709 ?auto_199714 ) ) ( not ( = ?auto_199709 ?auto_199715 ) ) ( not ( = ?auto_199709 ?auto_199716 ) ) ( not ( = ?auto_199709 ?auto_199717 ) ) ( not ( = ?auto_199709 ?auto_199718 ) ) ( not ( = ?auto_199709 ?auto_199719 ) ) ( not ( = ?auto_199709 ?auto_199720 ) ) ( not ( = ?auto_199710 ?auto_199711 ) ) ( not ( = ?auto_199710 ?auto_199712 ) ) ( not ( = ?auto_199710 ?auto_199713 ) ) ( not ( = ?auto_199710 ?auto_199714 ) ) ( not ( = ?auto_199710 ?auto_199715 ) ) ( not ( = ?auto_199710 ?auto_199716 ) ) ( not ( = ?auto_199710 ?auto_199717 ) ) ( not ( = ?auto_199710 ?auto_199718 ) ) ( not ( = ?auto_199710 ?auto_199719 ) ) ( not ( = ?auto_199710 ?auto_199720 ) ) ( not ( = ?auto_199711 ?auto_199712 ) ) ( not ( = ?auto_199711 ?auto_199713 ) ) ( not ( = ?auto_199711 ?auto_199714 ) ) ( not ( = ?auto_199711 ?auto_199715 ) ) ( not ( = ?auto_199711 ?auto_199716 ) ) ( not ( = ?auto_199711 ?auto_199717 ) ) ( not ( = ?auto_199711 ?auto_199718 ) ) ( not ( = ?auto_199711 ?auto_199719 ) ) ( not ( = ?auto_199711 ?auto_199720 ) ) ( not ( = ?auto_199712 ?auto_199713 ) ) ( not ( = ?auto_199712 ?auto_199714 ) ) ( not ( = ?auto_199712 ?auto_199715 ) ) ( not ( = ?auto_199712 ?auto_199716 ) ) ( not ( = ?auto_199712 ?auto_199717 ) ) ( not ( = ?auto_199712 ?auto_199718 ) ) ( not ( = ?auto_199712 ?auto_199719 ) ) ( not ( = ?auto_199712 ?auto_199720 ) ) ( not ( = ?auto_199713 ?auto_199714 ) ) ( not ( = ?auto_199713 ?auto_199715 ) ) ( not ( = ?auto_199713 ?auto_199716 ) ) ( not ( = ?auto_199713 ?auto_199717 ) ) ( not ( = ?auto_199713 ?auto_199718 ) ) ( not ( = ?auto_199713 ?auto_199719 ) ) ( not ( = ?auto_199713 ?auto_199720 ) ) ( not ( = ?auto_199714 ?auto_199715 ) ) ( not ( = ?auto_199714 ?auto_199716 ) ) ( not ( = ?auto_199714 ?auto_199717 ) ) ( not ( = ?auto_199714 ?auto_199718 ) ) ( not ( = ?auto_199714 ?auto_199719 ) ) ( not ( = ?auto_199714 ?auto_199720 ) ) ( not ( = ?auto_199715 ?auto_199716 ) ) ( not ( = ?auto_199715 ?auto_199717 ) ) ( not ( = ?auto_199715 ?auto_199718 ) ) ( not ( = ?auto_199715 ?auto_199719 ) ) ( not ( = ?auto_199715 ?auto_199720 ) ) ( not ( = ?auto_199716 ?auto_199717 ) ) ( not ( = ?auto_199716 ?auto_199718 ) ) ( not ( = ?auto_199716 ?auto_199719 ) ) ( not ( = ?auto_199716 ?auto_199720 ) ) ( not ( = ?auto_199717 ?auto_199718 ) ) ( not ( = ?auto_199717 ?auto_199719 ) ) ( not ( = ?auto_199717 ?auto_199720 ) ) ( not ( = ?auto_199718 ?auto_199719 ) ) ( not ( = ?auto_199718 ?auto_199720 ) ) ( not ( = ?auto_199719 ?auto_199720 ) ) ( ON ?auto_199719 ?auto_199720 ) ( ON ?auto_199718 ?auto_199719 ) ( ON ?auto_199717 ?auto_199718 ) ( ON ?auto_199716 ?auto_199717 ) ( ON ?auto_199715 ?auto_199716 ) ( ON ?auto_199714 ?auto_199715 ) ( CLEAR ?auto_199712 ) ( ON ?auto_199713 ?auto_199714 ) ( CLEAR ?auto_199713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_199709 ?auto_199710 ?auto_199711 ?auto_199712 ?auto_199713 )
      ( MAKE-12PILE ?auto_199709 ?auto_199710 ?auto_199711 ?auto_199712 ?auto_199713 ?auto_199714 ?auto_199715 ?auto_199716 ?auto_199717 ?auto_199718 ?auto_199719 ?auto_199720 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_199733 - BLOCK
      ?auto_199734 - BLOCK
      ?auto_199735 - BLOCK
      ?auto_199736 - BLOCK
      ?auto_199737 - BLOCK
      ?auto_199738 - BLOCK
      ?auto_199739 - BLOCK
      ?auto_199740 - BLOCK
      ?auto_199741 - BLOCK
      ?auto_199742 - BLOCK
      ?auto_199743 - BLOCK
      ?auto_199744 - BLOCK
    )
    :vars
    (
      ?auto_199745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199744 ?auto_199745 ) ( ON-TABLE ?auto_199733 ) ( ON ?auto_199734 ?auto_199733 ) ( ON ?auto_199735 ?auto_199734 ) ( not ( = ?auto_199733 ?auto_199734 ) ) ( not ( = ?auto_199733 ?auto_199735 ) ) ( not ( = ?auto_199733 ?auto_199736 ) ) ( not ( = ?auto_199733 ?auto_199737 ) ) ( not ( = ?auto_199733 ?auto_199738 ) ) ( not ( = ?auto_199733 ?auto_199739 ) ) ( not ( = ?auto_199733 ?auto_199740 ) ) ( not ( = ?auto_199733 ?auto_199741 ) ) ( not ( = ?auto_199733 ?auto_199742 ) ) ( not ( = ?auto_199733 ?auto_199743 ) ) ( not ( = ?auto_199733 ?auto_199744 ) ) ( not ( = ?auto_199733 ?auto_199745 ) ) ( not ( = ?auto_199734 ?auto_199735 ) ) ( not ( = ?auto_199734 ?auto_199736 ) ) ( not ( = ?auto_199734 ?auto_199737 ) ) ( not ( = ?auto_199734 ?auto_199738 ) ) ( not ( = ?auto_199734 ?auto_199739 ) ) ( not ( = ?auto_199734 ?auto_199740 ) ) ( not ( = ?auto_199734 ?auto_199741 ) ) ( not ( = ?auto_199734 ?auto_199742 ) ) ( not ( = ?auto_199734 ?auto_199743 ) ) ( not ( = ?auto_199734 ?auto_199744 ) ) ( not ( = ?auto_199734 ?auto_199745 ) ) ( not ( = ?auto_199735 ?auto_199736 ) ) ( not ( = ?auto_199735 ?auto_199737 ) ) ( not ( = ?auto_199735 ?auto_199738 ) ) ( not ( = ?auto_199735 ?auto_199739 ) ) ( not ( = ?auto_199735 ?auto_199740 ) ) ( not ( = ?auto_199735 ?auto_199741 ) ) ( not ( = ?auto_199735 ?auto_199742 ) ) ( not ( = ?auto_199735 ?auto_199743 ) ) ( not ( = ?auto_199735 ?auto_199744 ) ) ( not ( = ?auto_199735 ?auto_199745 ) ) ( not ( = ?auto_199736 ?auto_199737 ) ) ( not ( = ?auto_199736 ?auto_199738 ) ) ( not ( = ?auto_199736 ?auto_199739 ) ) ( not ( = ?auto_199736 ?auto_199740 ) ) ( not ( = ?auto_199736 ?auto_199741 ) ) ( not ( = ?auto_199736 ?auto_199742 ) ) ( not ( = ?auto_199736 ?auto_199743 ) ) ( not ( = ?auto_199736 ?auto_199744 ) ) ( not ( = ?auto_199736 ?auto_199745 ) ) ( not ( = ?auto_199737 ?auto_199738 ) ) ( not ( = ?auto_199737 ?auto_199739 ) ) ( not ( = ?auto_199737 ?auto_199740 ) ) ( not ( = ?auto_199737 ?auto_199741 ) ) ( not ( = ?auto_199737 ?auto_199742 ) ) ( not ( = ?auto_199737 ?auto_199743 ) ) ( not ( = ?auto_199737 ?auto_199744 ) ) ( not ( = ?auto_199737 ?auto_199745 ) ) ( not ( = ?auto_199738 ?auto_199739 ) ) ( not ( = ?auto_199738 ?auto_199740 ) ) ( not ( = ?auto_199738 ?auto_199741 ) ) ( not ( = ?auto_199738 ?auto_199742 ) ) ( not ( = ?auto_199738 ?auto_199743 ) ) ( not ( = ?auto_199738 ?auto_199744 ) ) ( not ( = ?auto_199738 ?auto_199745 ) ) ( not ( = ?auto_199739 ?auto_199740 ) ) ( not ( = ?auto_199739 ?auto_199741 ) ) ( not ( = ?auto_199739 ?auto_199742 ) ) ( not ( = ?auto_199739 ?auto_199743 ) ) ( not ( = ?auto_199739 ?auto_199744 ) ) ( not ( = ?auto_199739 ?auto_199745 ) ) ( not ( = ?auto_199740 ?auto_199741 ) ) ( not ( = ?auto_199740 ?auto_199742 ) ) ( not ( = ?auto_199740 ?auto_199743 ) ) ( not ( = ?auto_199740 ?auto_199744 ) ) ( not ( = ?auto_199740 ?auto_199745 ) ) ( not ( = ?auto_199741 ?auto_199742 ) ) ( not ( = ?auto_199741 ?auto_199743 ) ) ( not ( = ?auto_199741 ?auto_199744 ) ) ( not ( = ?auto_199741 ?auto_199745 ) ) ( not ( = ?auto_199742 ?auto_199743 ) ) ( not ( = ?auto_199742 ?auto_199744 ) ) ( not ( = ?auto_199742 ?auto_199745 ) ) ( not ( = ?auto_199743 ?auto_199744 ) ) ( not ( = ?auto_199743 ?auto_199745 ) ) ( not ( = ?auto_199744 ?auto_199745 ) ) ( ON ?auto_199743 ?auto_199744 ) ( ON ?auto_199742 ?auto_199743 ) ( ON ?auto_199741 ?auto_199742 ) ( ON ?auto_199740 ?auto_199741 ) ( ON ?auto_199739 ?auto_199740 ) ( ON ?auto_199738 ?auto_199739 ) ( ON ?auto_199737 ?auto_199738 ) ( CLEAR ?auto_199735 ) ( ON ?auto_199736 ?auto_199737 ) ( CLEAR ?auto_199736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_199733 ?auto_199734 ?auto_199735 ?auto_199736 )
      ( MAKE-12PILE ?auto_199733 ?auto_199734 ?auto_199735 ?auto_199736 ?auto_199737 ?auto_199738 ?auto_199739 ?auto_199740 ?auto_199741 ?auto_199742 ?auto_199743 ?auto_199744 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_199758 - BLOCK
      ?auto_199759 - BLOCK
      ?auto_199760 - BLOCK
      ?auto_199761 - BLOCK
      ?auto_199762 - BLOCK
      ?auto_199763 - BLOCK
      ?auto_199764 - BLOCK
      ?auto_199765 - BLOCK
      ?auto_199766 - BLOCK
      ?auto_199767 - BLOCK
      ?auto_199768 - BLOCK
      ?auto_199769 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199769 ) ( ON-TABLE ?auto_199758 ) ( ON ?auto_199759 ?auto_199758 ) ( ON ?auto_199760 ?auto_199759 ) ( not ( = ?auto_199758 ?auto_199759 ) ) ( not ( = ?auto_199758 ?auto_199760 ) ) ( not ( = ?auto_199758 ?auto_199761 ) ) ( not ( = ?auto_199758 ?auto_199762 ) ) ( not ( = ?auto_199758 ?auto_199763 ) ) ( not ( = ?auto_199758 ?auto_199764 ) ) ( not ( = ?auto_199758 ?auto_199765 ) ) ( not ( = ?auto_199758 ?auto_199766 ) ) ( not ( = ?auto_199758 ?auto_199767 ) ) ( not ( = ?auto_199758 ?auto_199768 ) ) ( not ( = ?auto_199758 ?auto_199769 ) ) ( not ( = ?auto_199759 ?auto_199760 ) ) ( not ( = ?auto_199759 ?auto_199761 ) ) ( not ( = ?auto_199759 ?auto_199762 ) ) ( not ( = ?auto_199759 ?auto_199763 ) ) ( not ( = ?auto_199759 ?auto_199764 ) ) ( not ( = ?auto_199759 ?auto_199765 ) ) ( not ( = ?auto_199759 ?auto_199766 ) ) ( not ( = ?auto_199759 ?auto_199767 ) ) ( not ( = ?auto_199759 ?auto_199768 ) ) ( not ( = ?auto_199759 ?auto_199769 ) ) ( not ( = ?auto_199760 ?auto_199761 ) ) ( not ( = ?auto_199760 ?auto_199762 ) ) ( not ( = ?auto_199760 ?auto_199763 ) ) ( not ( = ?auto_199760 ?auto_199764 ) ) ( not ( = ?auto_199760 ?auto_199765 ) ) ( not ( = ?auto_199760 ?auto_199766 ) ) ( not ( = ?auto_199760 ?auto_199767 ) ) ( not ( = ?auto_199760 ?auto_199768 ) ) ( not ( = ?auto_199760 ?auto_199769 ) ) ( not ( = ?auto_199761 ?auto_199762 ) ) ( not ( = ?auto_199761 ?auto_199763 ) ) ( not ( = ?auto_199761 ?auto_199764 ) ) ( not ( = ?auto_199761 ?auto_199765 ) ) ( not ( = ?auto_199761 ?auto_199766 ) ) ( not ( = ?auto_199761 ?auto_199767 ) ) ( not ( = ?auto_199761 ?auto_199768 ) ) ( not ( = ?auto_199761 ?auto_199769 ) ) ( not ( = ?auto_199762 ?auto_199763 ) ) ( not ( = ?auto_199762 ?auto_199764 ) ) ( not ( = ?auto_199762 ?auto_199765 ) ) ( not ( = ?auto_199762 ?auto_199766 ) ) ( not ( = ?auto_199762 ?auto_199767 ) ) ( not ( = ?auto_199762 ?auto_199768 ) ) ( not ( = ?auto_199762 ?auto_199769 ) ) ( not ( = ?auto_199763 ?auto_199764 ) ) ( not ( = ?auto_199763 ?auto_199765 ) ) ( not ( = ?auto_199763 ?auto_199766 ) ) ( not ( = ?auto_199763 ?auto_199767 ) ) ( not ( = ?auto_199763 ?auto_199768 ) ) ( not ( = ?auto_199763 ?auto_199769 ) ) ( not ( = ?auto_199764 ?auto_199765 ) ) ( not ( = ?auto_199764 ?auto_199766 ) ) ( not ( = ?auto_199764 ?auto_199767 ) ) ( not ( = ?auto_199764 ?auto_199768 ) ) ( not ( = ?auto_199764 ?auto_199769 ) ) ( not ( = ?auto_199765 ?auto_199766 ) ) ( not ( = ?auto_199765 ?auto_199767 ) ) ( not ( = ?auto_199765 ?auto_199768 ) ) ( not ( = ?auto_199765 ?auto_199769 ) ) ( not ( = ?auto_199766 ?auto_199767 ) ) ( not ( = ?auto_199766 ?auto_199768 ) ) ( not ( = ?auto_199766 ?auto_199769 ) ) ( not ( = ?auto_199767 ?auto_199768 ) ) ( not ( = ?auto_199767 ?auto_199769 ) ) ( not ( = ?auto_199768 ?auto_199769 ) ) ( ON ?auto_199768 ?auto_199769 ) ( ON ?auto_199767 ?auto_199768 ) ( ON ?auto_199766 ?auto_199767 ) ( ON ?auto_199765 ?auto_199766 ) ( ON ?auto_199764 ?auto_199765 ) ( ON ?auto_199763 ?auto_199764 ) ( ON ?auto_199762 ?auto_199763 ) ( CLEAR ?auto_199760 ) ( ON ?auto_199761 ?auto_199762 ) ( CLEAR ?auto_199761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_199758 ?auto_199759 ?auto_199760 ?auto_199761 )
      ( MAKE-12PILE ?auto_199758 ?auto_199759 ?auto_199760 ?auto_199761 ?auto_199762 ?auto_199763 ?auto_199764 ?auto_199765 ?auto_199766 ?auto_199767 ?auto_199768 ?auto_199769 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_199782 - BLOCK
      ?auto_199783 - BLOCK
      ?auto_199784 - BLOCK
      ?auto_199785 - BLOCK
      ?auto_199786 - BLOCK
      ?auto_199787 - BLOCK
      ?auto_199788 - BLOCK
      ?auto_199789 - BLOCK
      ?auto_199790 - BLOCK
      ?auto_199791 - BLOCK
      ?auto_199792 - BLOCK
      ?auto_199793 - BLOCK
    )
    :vars
    (
      ?auto_199794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199793 ?auto_199794 ) ( ON-TABLE ?auto_199782 ) ( ON ?auto_199783 ?auto_199782 ) ( not ( = ?auto_199782 ?auto_199783 ) ) ( not ( = ?auto_199782 ?auto_199784 ) ) ( not ( = ?auto_199782 ?auto_199785 ) ) ( not ( = ?auto_199782 ?auto_199786 ) ) ( not ( = ?auto_199782 ?auto_199787 ) ) ( not ( = ?auto_199782 ?auto_199788 ) ) ( not ( = ?auto_199782 ?auto_199789 ) ) ( not ( = ?auto_199782 ?auto_199790 ) ) ( not ( = ?auto_199782 ?auto_199791 ) ) ( not ( = ?auto_199782 ?auto_199792 ) ) ( not ( = ?auto_199782 ?auto_199793 ) ) ( not ( = ?auto_199782 ?auto_199794 ) ) ( not ( = ?auto_199783 ?auto_199784 ) ) ( not ( = ?auto_199783 ?auto_199785 ) ) ( not ( = ?auto_199783 ?auto_199786 ) ) ( not ( = ?auto_199783 ?auto_199787 ) ) ( not ( = ?auto_199783 ?auto_199788 ) ) ( not ( = ?auto_199783 ?auto_199789 ) ) ( not ( = ?auto_199783 ?auto_199790 ) ) ( not ( = ?auto_199783 ?auto_199791 ) ) ( not ( = ?auto_199783 ?auto_199792 ) ) ( not ( = ?auto_199783 ?auto_199793 ) ) ( not ( = ?auto_199783 ?auto_199794 ) ) ( not ( = ?auto_199784 ?auto_199785 ) ) ( not ( = ?auto_199784 ?auto_199786 ) ) ( not ( = ?auto_199784 ?auto_199787 ) ) ( not ( = ?auto_199784 ?auto_199788 ) ) ( not ( = ?auto_199784 ?auto_199789 ) ) ( not ( = ?auto_199784 ?auto_199790 ) ) ( not ( = ?auto_199784 ?auto_199791 ) ) ( not ( = ?auto_199784 ?auto_199792 ) ) ( not ( = ?auto_199784 ?auto_199793 ) ) ( not ( = ?auto_199784 ?auto_199794 ) ) ( not ( = ?auto_199785 ?auto_199786 ) ) ( not ( = ?auto_199785 ?auto_199787 ) ) ( not ( = ?auto_199785 ?auto_199788 ) ) ( not ( = ?auto_199785 ?auto_199789 ) ) ( not ( = ?auto_199785 ?auto_199790 ) ) ( not ( = ?auto_199785 ?auto_199791 ) ) ( not ( = ?auto_199785 ?auto_199792 ) ) ( not ( = ?auto_199785 ?auto_199793 ) ) ( not ( = ?auto_199785 ?auto_199794 ) ) ( not ( = ?auto_199786 ?auto_199787 ) ) ( not ( = ?auto_199786 ?auto_199788 ) ) ( not ( = ?auto_199786 ?auto_199789 ) ) ( not ( = ?auto_199786 ?auto_199790 ) ) ( not ( = ?auto_199786 ?auto_199791 ) ) ( not ( = ?auto_199786 ?auto_199792 ) ) ( not ( = ?auto_199786 ?auto_199793 ) ) ( not ( = ?auto_199786 ?auto_199794 ) ) ( not ( = ?auto_199787 ?auto_199788 ) ) ( not ( = ?auto_199787 ?auto_199789 ) ) ( not ( = ?auto_199787 ?auto_199790 ) ) ( not ( = ?auto_199787 ?auto_199791 ) ) ( not ( = ?auto_199787 ?auto_199792 ) ) ( not ( = ?auto_199787 ?auto_199793 ) ) ( not ( = ?auto_199787 ?auto_199794 ) ) ( not ( = ?auto_199788 ?auto_199789 ) ) ( not ( = ?auto_199788 ?auto_199790 ) ) ( not ( = ?auto_199788 ?auto_199791 ) ) ( not ( = ?auto_199788 ?auto_199792 ) ) ( not ( = ?auto_199788 ?auto_199793 ) ) ( not ( = ?auto_199788 ?auto_199794 ) ) ( not ( = ?auto_199789 ?auto_199790 ) ) ( not ( = ?auto_199789 ?auto_199791 ) ) ( not ( = ?auto_199789 ?auto_199792 ) ) ( not ( = ?auto_199789 ?auto_199793 ) ) ( not ( = ?auto_199789 ?auto_199794 ) ) ( not ( = ?auto_199790 ?auto_199791 ) ) ( not ( = ?auto_199790 ?auto_199792 ) ) ( not ( = ?auto_199790 ?auto_199793 ) ) ( not ( = ?auto_199790 ?auto_199794 ) ) ( not ( = ?auto_199791 ?auto_199792 ) ) ( not ( = ?auto_199791 ?auto_199793 ) ) ( not ( = ?auto_199791 ?auto_199794 ) ) ( not ( = ?auto_199792 ?auto_199793 ) ) ( not ( = ?auto_199792 ?auto_199794 ) ) ( not ( = ?auto_199793 ?auto_199794 ) ) ( ON ?auto_199792 ?auto_199793 ) ( ON ?auto_199791 ?auto_199792 ) ( ON ?auto_199790 ?auto_199791 ) ( ON ?auto_199789 ?auto_199790 ) ( ON ?auto_199788 ?auto_199789 ) ( ON ?auto_199787 ?auto_199788 ) ( ON ?auto_199786 ?auto_199787 ) ( ON ?auto_199785 ?auto_199786 ) ( CLEAR ?auto_199783 ) ( ON ?auto_199784 ?auto_199785 ) ( CLEAR ?auto_199784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_199782 ?auto_199783 ?auto_199784 )
      ( MAKE-12PILE ?auto_199782 ?auto_199783 ?auto_199784 ?auto_199785 ?auto_199786 ?auto_199787 ?auto_199788 ?auto_199789 ?auto_199790 ?auto_199791 ?auto_199792 ?auto_199793 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_199807 - BLOCK
      ?auto_199808 - BLOCK
      ?auto_199809 - BLOCK
      ?auto_199810 - BLOCK
      ?auto_199811 - BLOCK
      ?auto_199812 - BLOCK
      ?auto_199813 - BLOCK
      ?auto_199814 - BLOCK
      ?auto_199815 - BLOCK
      ?auto_199816 - BLOCK
      ?auto_199817 - BLOCK
      ?auto_199818 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199818 ) ( ON-TABLE ?auto_199807 ) ( ON ?auto_199808 ?auto_199807 ) ( not ( = ?auto_199807 ?auto_199808 ) ) ( not ( = ?auto_199807 ?auto_199809 ) ) ( not ( = ?auto_199807 ?auto_199810 ) ) ( not ( = ?auto_199807 ?auto_199811 ) ) ( not ( = ?auto_199807 ?auto_199812 ) ) ( not ( = ?auto_199807 ?auto_199813 ) ) ( not ( = ?auto_199807 ?auto_199814 ) ) ( not ( = ?auto_199807 ?auto_199815 ) ) ( not ( = ?auto_199807 ?auto_199816 ) ) ( not ( = ?auto_199807 ?auto_199817 ) ) ( not ( = ?auto_199807 ?auto_199818 ) ) ( not ( = ?auto_199808 ?auto_199809 ) ) ( not ( = ?auto_199808 ?auto_199810 ) ) ( not ( = ?auto_199808 ?auto_199811 ) ) ( not ( = ?auto_199808 ?auto_199812 ) ) ( not ( = ?auto_199808 ?auto_199813 ) ) ( not ( = ?auto_199808 ?auto_199814 ) ) ( not ( = ?auto_199808 ?auto_199815 ) ) ( not ( = ?auto_199808 ?auto_199816 ) ) ( not ( = ?auto_199808 ?auto_199817 ) ) ( not ( = ?auto_199808 ?auto_199818 ) ) ( not ( = ?auto_199809 ?auto_199810 ) ) ( not ( = ?auto_199809 ?auto_199811 ) ) ( not ( = ?auto_199809 ?auto_199812 ) ) ( not ( = ?auto_199809 ?auto_199813 ) ) ( not ( = ?auto_199809 ?auto_199814 ) ) ( not ( = ?auto_199809 ?auto_199815 ) ) ( not ( = ?auto_199809 ?auto_199816 ) ) ( not ( = ?auto_199809 ?auto_199817 ) ) ( not ( = ?auto_199809 ?auto_199818 ) ) ( not ( = ?auto_199810 ?auto_199811 ) ) ( not ( = ?auto_199810 ?auto_199812 ) ) ( not ( = ?auto_199810 ?auto_199813 ) ) ( not ( = ?auto_199810 ?auto_199814 ) ) ( not ( = ?auto_199810 ?auto_199815 ) ) ( not ( = ?auto_199810 ?auto_199816 ) ) ( not ( = ?auto_199810 ?auto_199817 ) ) ( not ( = ?auto_199810 ?auto_199818 ) ) ( not ( = ?auto_199811 ?auto_199812 ) ) ( not ( = ?auto_199811 ?auto_199813 ) ) ( not ( = ?auto_199811 ?auto_199814 ) ) ( not ( = ?auto_199811 ?auto_199815 ) ) ( not ( = ?auto_199811 ?auto_199816 ) ) ( not ( = ?auto_199811 ?auto_199817 ) ) ( not ( = ?auto_199811 ?auto_199818 ) ) ( not ( = ?auto_199812 ?auto_199813 ) ) ( not ( = ?auto_199812 ?auto_199814 ) ) ( not ( = ?auto_199812 ?auto_199815 ) ) ( not ( = ?auto_199812 ?auto_199816 ) ) ( not ( = ?auto_199812 ?auto_199817 ) ) ( not ( = ?auto_199812 ?auto_199818 ) ) ( not ( = ?auto_199813 ?auto_199814 ) ) ( not ( = ?auto_199813 ?auto_199815 ) ) ( not ( = ?auto_199813 ?auto_199816 ) ) ( not ( = ?auto_199813 ?auto_199817 ) ) ( not ( = ?auto_199813 ?auto_199818 ) ) ( not ( = ?auto_199814 ?auto_199815 ) ) ( not ( = ?auto_199814 ?auto_199816 ) ) ( not ( = ?auto_199814 ?auto_199817 ) ) ( not ( = ?auto_199814 ?auto_199818 ) ) ( not ( = ?auto_199815 ?auto_199816 ) ) ( not ( = ?auto_199815 ?auto_199817 ) ) ( not ( = ?auto_199815 ?auto_199818 ) ) ( not ( = ?auto_199816 ?auto_199817 ) ) ( not ( = ?auto_199816 ?auto_199818 ) ) ( not ( = ?auto_199817 ?auto_199818 ) ) ( ON ?auto_199817 ?auto_199818 ) ( ON ?auto_199816 ?auto_199817 ) ( ON ?auto_199815 ?auto_199816 ) ( ON ?auto_199814 ?auto_199815 ) ( ON ?auto_199813 ?auto_199814 ) ( ON ?auto_199812 ?auto_199813 ) ( ON ?auto_199811 ?auto_199812 ) ( ON ?auto_199810 ?auto_199811 ) ( CLEAR ?auto_199808 ) ( ON ?auto_199809 ?auto_199810 ) ( CLEAR ?auto_199809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_199807 ?auto_199808 ?auto_199809 )
      ( MAKE-12PILE ?auto_199807 ?auto_199808 ?auto_199809 ?auto_199810 ?auto_199811 ?auto_199812 ?auto_199813 ?auto_199814 ?auto_199815 ?auto_199816 ?auto_199817 ?auto_199818 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_199831 - BLOCK
      ?auto_199832 - BLOCK
      ?auto_199833 - BLOCK
      ?auto_199834 - BLOCK
      ?auto_199835 - BLOCK
      ?auto_199836 - BLOCK
      ?auto_199837 - BLOCK
      ?auto_199838 - BLOCK
      ?auto_199839 - BLOCK
      ?auto_199840 - BLOCK
      ?auto_199841 - BLOCK
      ?auto_199842 - BLOCK
    )
    :vars
    (
      ?auto_199843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199842 ?auto_199843 ) ( ON-TABLE ?auto_199831 ) ( not ( = ?auto_199831 ?auto_199832 ) ) ( not ( = ?auto_199831 ?auto_199833 ) ) ( not ( = ?auto_199831 ?auto_199834 ) ) ( not ( = ?auto_199831 ?auto_199835 ) ) ( not ( = ?auto_199831 ?auto_199836 ) ) ( not ( = ?auto_199831 ?auto_199837 ) ) ( not ( = ?auto_199831 ?auto_199838 ) ) ( not ( = ?auto_199831 ?auto_199839 ) ) ( not ( = ?auto_199831 ?auto_199840 ) ) ( not ( = ?auto_199831 ?auto_199841 ) ) ( not ( = ?auto_199831 ?auto_199842 ) ) ( not ( = ?auto_199831 ?auto_199843 ) ) ( not ( = ?auto_199832 ?auto_199833 ) ) ( not ( = ?auto_199832 ?auto_199834 ) ) ( not ( = ?auto_199832 ?auto_199835 ) ) ( not ( = ?auto_199832 ?auto_199836 ) ) ( not ( = ?auto_199832 ?auto_199837 ) ) ( not ( = ?auto_199832 ?auto_199838 ) ) ( not ( = ?auto_199832 ?auto_199839 ) ) ( not ( = ?auto_199832 ?auto_199840 ) ) ( not ( = ?auto_199832 ?auto_199841 ) ) ( not ( = ?auto_199832 ?auto_199842 ) ) ( not ( = ?auto_199832 ?auto_199843 ) ) ( not ( = ?auto_199833 ?auto_199834 ) ) ( not ( = ?auto_199833 ?auto_199835 ) ) ( not ( = ?auto_199833 ?auto_199836 ) ) ( not ( = ?auto_199833 ?auto_199837 ) ) ( not ( = ?auto_199833 ?auto_199838 ) ) ( not ( = ?auto_199833 ?auto_199839 ) ) ( not ( = ?auto_199833 ?auto_199840 ) ) ( not ( = ?auto_199833 ?auto_199841 ) ) ( not ( = ?auto_199833 ?auto_199842 ) ) ( not ( = ?auto_199833 ?auto_199843 ) ) ( not ( = ?auto_199834 ?auto_199835 ) ) ( not ( = ?auto_199834 ?auto_199836 ) ) ( not ( = ?auto_199834 ?auto_199837 ) ) ( not ( = ?auto_199834 ?auto_199838 ) ) ( not ( = ?auto_199834 ?auto_199839 ) ) ( not ( = ?auto_199834 ?auto_199840 ) ) ( not ( = ?auto_199834 ?auto_199841 ) ) ( not ( = ?auto_199834 ?auto_199842 ) ) ( not ( = ?auto_199834 ?auto_199843 ) ) ( not ( = ?auto_199835 ?auto_199836 ) ) ( not ( = ?auto_199835 ?auto_199837 ) ) ( not ( = ?auto_199835 ?auto_199838 ) ) ( not ( = ?auto_199835 ?auto_199839 ) ) ( not ( = ?auto_199835 ?auto_199840 ) ) ( not ( = ?auto_199835 ?auto_199841 ) ) ( not ( = ?auto_199835 ?auto_199842 ) ) ( not ( = ?auto_199835 ?auto_199843 ) ) ( not ( = ?auto_199836 ?auto_199837 ) ) ( not ( = ?auto_199836 ?auto_199838 ) ) ( not ( = ?auto_199836 ?auto_199839 ) ) ( not ( = ?auto_199836 ?auto_199840 ) ) ( not ( = ?auto_199836 ?auto_199841 ) ) ( not ( = ?auto_199836 ?auto_199842 ) ) ( not ( = ?auto_199836 ?auto_199843 ) ) ( not ( = ?auto_199837 ?auto_199838 ) ) ( not ( = ?auto_199837 ?auto_199839 ) ) ( not ( = ?auto_199837 ?auto_199840 ) ) ( not ( = ?auto_199837 ?auto_199841 ) ) ( not ( = ?auto_199837 ?auto_199842 ) ) ( not ( = ?auto_199837 ?auto_199843 ) ) ( not ( = ?auto_199838 ?auto_199839 ) ) ( not ( = ?auto_199838 ?auto_199840 ) ) ( not ( = ?auto_199838 ?auto_199841 ) ) ( not ( = ?auto_199838 ?auto_199842 ) ) ( not ( = ?auto_199838 ?auto_199843 ) ) ( not ( = ?auto_199839 ?auto_199840 ) ) ( not ( = ?auto_199839 ?auto_199841 ) ) ( not ( = ?auto_199839 ?auto_199842 ) ) ( not ( = ?auto_199839 ?auto_199843 ) ) ( not ( = ?auto_199840 ?auto_199841 ) ) ( not ( = ?auto_199840 ?auto_199842 ) ) ( not ( = ?auto_199840 ?auto_199843 ) ) ( not ( = ?auto_199841 ?auto_199842 ) ) ( not ( = ?auto_199841 ?auto_199843 ) ) ( not ( = ?auto_199842 ?auto_199843 ) ) ( ON ?auto_199841 ?auto_199842 ) ( ON ?auto_199840 ?auto_199841 ) ( ON ?auto_199839 ?auto_199840 ) ( ON ?auto_199838 ?auto_199839 ) ( ON ?auto_199837 ?auto_199838 ) ( ON ?auto_199836 ?auto_199837 ) ( ON ?auto_199835 ?auto_199836 ) ( ON ?auto_199834 ?auto_199835 ) ( ON ?auto_199833 ?auto_199834 ) ( CLEAR ?auto_199831 ) ( ON ?auto_199832 ?auto_199833 ) ( CLEAR ?auto_199832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_199831 ?auto_199832 )
      ( MAKE-12PILE ?auto_199831 ?auto_199832 ?auto_199833 ?auto_199834 ?auto_199835 ?auto_199836 ?auto_199837 ?auto_199838 ?auto_199839 ?auto_199840 ?auto_199841 ?auto_199842 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_199856 - BLOCK
      ?auto_199857 - BLOCK
      ?auto_199858 - BLOCK
      ?auto_199859 - BLOCK
      ?auto_199860 - BLOCK
      ?auto_199861 - BLOCK
      ?auto_199862 - BLOCK
      ?auto_199863 - BLOCK
      ?auto_199864 - BLOCK
      ?auto_199865 - BLOCK
      ?auto_199866 - BLOCK
      ?auto_199867 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199867 ) ( ON-TABLE ?auto_199856 ) ( not ( = ?auto_199856 ?auto_199857 ) ) ( not ( = ?auto_199856 ?auto_199858 ) ) ( not ( = ?auto_199856 ?auto_199859 ) ) ( not ( = ?auto_199856 ?auto_199860 ) ) ( not ( = ?auto_199856 ?auto_199861 ) ) ( not ( = ?auto_199856 ?auto_199862 ) ) ( not ( = ?auto_199856 ?auto_199863 ) ) ( not ( = ?auto_199856 ?auto_199864 ) ) ( not ( = ?auto_199856 ?auto_199865 ) ) ( not ( = ?auto_199856 ?auto_199866 ) ) ( not ( = ?auto_199856 ?auto_199867 ) ) ( not ( = ?auto_199857 ?auto_199858 ) ) ( not ( = ?auto_199857 ?auto_199859 ) ) ( not ( = ?auto_199857 ?auto_199860 ) ) ( not ( = ?auto_199857 ?auto_199861 ) ) ( not ( = ?auto_199857 ?auto_199862 ) ) ( not ( = ?auto_199857 ?auto_199863 ) ) ( not ( = ?auto_199857 ?auto_199864 ) ) ( not ( = ?auto_199857 ?auto_199865 ) ) ( not ( = ?auto_199857 ?auto_199866 ) ) ( not ( = ?auto_199857 ?auto_199867 ) ) ( not ( = ?auto_199858 ?auto_199859 ) ) ( not ( = ?auto_199858 ?auto_199860 ) ) ( not ( = ?auto_199858 ?auto_199861 ) ) ( not ( = ?auto_199858 ?auto_199862 ) ) ( not ( = ?auto_199858 ?auto_199863 ) ) ( not ( = ?auto_199858 ?auto_199864 ) ) ( not ( = ?auto_199858 ?auto_199865 ) ) ( not ( = ?auto_199858 ?auto_199866 ) ) ( not ( = ?auto_199858 ?auto_199867 ) ) ( not ( = ?auto_199859 ?auto_199860 ) ) ( not ( = ?auto_199859 ?auto_199861 ) ) ( not ( = ?auto_199859 ?auto_199862 ) ) ( not ( = ?auto_199859 ?auto_199863 ) ) ( not ( = ?auto_199859 ?auto_199864 ) ) ( not ( = ?auto_199859 ?auto_199865 ) ) ( not ( = ?auto_199859 ?auto_199866 ) ) ( not ( = ?auto_199859 ?auto_199867 ) ) ( not ( = ?auto_199860 ?auto_199861 ) ) ( not ( = ?auto_199860 ?auto_199862 ) ) ( not ( = ?auto_199860 ?auto_199863 ) ) ( not ( = ?auto_199860 ?auto_199864 ) ) ( not ( = ?auto_199860 ?auto_199865 ) ) ( not ( = ?auto_199860 ?auto_199866 ) ) ( not ( = ?auto_199860 ?auto_199867 ) ) ( not ( = ?auto_199861 ?auto_199862 ) ) ( not ( = ?auto_199861 ?auto_199863 ) ) ( not ( = ?auto_199861 ?auto_199864 ) ) ( not ( = ?auto_199861 ?auto_199865 ) ) ( not ( = ?auto_199861 ?auto_199866 ) ) ( not ( = ?auto_199861 ?auto_199867 ) ) ( not ( = ?auto_199862 ?auto_199863 ) ) ( not ( = ?auto_199862 ?auto_199864 ) ) ( not ( = ?auto_199862 ?auto_199865 ) ) ( not ( = ?auto_199862 ?auto_199866 ) ) ( not ( = ?auto_199862 ?auto_199867 ) ) ( not ( = ?auto_199863 ?auto_199864 ) ) ( not ( = ?auto_199863 ?auto_199865 ) ) ( not ( = ?auto_199863 ?auto_199866 ) ) ( not ( = ?auto_199863 ?auto_199867 ) ) ( not ( = ?auto_199864 ?auto_199865 ) ) ( not ( = ?auto_199864 ?auto_199866 ) ) ( not ( = ?auto_199864 ?auto_199867 ) ) ( not ( = ?auto_199865 ?auto_199866 ) ) ( not ( = ?auto_199865 ?auto_199867 ) ) ( not ( = ?auto_199866 ?auto_199867 ) ) ( ON ?auto_199866 ?auto_199867 ) ( ON ?auto_199865 ?auto_199866 ) ( ON ?auto_199864 ?auto_199865 ) ( ON ?auto_199863 ?auto_199864 ) ( ON ?auto_199862 ?auto_199863 ) ( ON ?auto_199861 ?auto_199862 ) ( ON ?auto_199860 ?auto_199861 ) ( ON ?auto_199859 ?auto_199860 ) ( ON ?auto_199858 ?auto_199859 ) ( CLEAR ?auto_199856 ) ( ON ?auto_199857 ?auto_199858 ) ( CLEAR ?auto_199857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_199856 ?auto_199857 )
      ( MAKE-12PILE ?auto_199856 ?auto_199857 ?auto_199858 ?auto_199859 ?auto_199860 ?auto_199861 ?auto_199862 ?auto_199863 ?auto_199864 ?auto_199865 ?auto_199866 ?auto_199867 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_199880 - BLOCK
      ?auto_199881 - BLOCK
      ?auto_199882 - BLOCK
      ?auto_199883 - BLOCK
      ?auto_199884 - BLOCK
      ?auto_199885 - BLOCK
      ?auto_199886 - BLOCK
      ?auto_199887 - BLOCK
      ?auto_199888 - BLOCK
      ?auto_199889 - BLOCK
      ?auto_199890 - BLOCK
      ?auto_199891 - BLOCK
    )
    :vars
    (
      ?auto_199892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199891 ?auto_199892 ) ( not ( = ?auto_199880 ?auto_199881 ) ) ( not ( = ?auto_199880 ?auto_199882 ) ) ( not ( = ?auto_199880 ?auto_199883 ) ) ( not ( = ?auto_199880 ?auto_199884 ) ) ( not ( = ?auto_199880 ?auto_199885 ) ) ( not ( = ?auto_199880 ?auto_199886 ) ) ( not ( = ?auto_199880 ?auto_199887 ) ) ( not ( = ?auto_199880 ?auto_199888 ) ) ( not ( = ?auto_199880 ?auto_199889 ) ) ( not ( = ?auto_199880 ?auto_199890 ) ) ( not ( = ?auto_199880 ?auto_199891 ) ) ( not ( = ?auto_199880 ?auto_199892 ) ) ( not ( = ?auto_199881 ?auto_199882 ) ) ( not ( = ?auto_199881 ?auto_199883 ) ) ( not ( = ?auto_199881 ?auto_199884 ) ) ( not ( = ?auto_199881 ?auto_199885 ) ) ( not ( = ?auto_199881 ?auto_199886 ) ) ( not ( = ?auto_199881 ?auto_199887 ) ) ( not ( = ?auto_199881 ?auto_199888 ) ) ( not ( = ?auto_199881 ?auto_199889 ) ) ( not ( = ?auto_199881 ?auto_199890 ) ) ( not ( = ?auto_199881 ?auto_199891 ) ) ( not ( = ?auto_199881 ?auto_199892 ) ) ( not ( = ?auto_199882 ?auto_199883 ) ) ( not ( = ?auto_199882 ?auto_199884 ) ) ( not ( = ?auto_199882 ?auto_199885 ) ) ( not ( = ?auto_199882 ?auto_199886 ) ) ( not ( = ?auto_199882 ?auto_199887 ) ) ( not ( = ?auto_199882 ?auto_199888 ) ) ( not ( = ?auto_199882 ?auto_199889 ) ) ( not ( = ?auto_199882 ?auto_199890 ) ) ( not ( = ?auto_199882 ?auto_199891 ) ) ( not ( = ?auto_199882 ?auto_199892 ) ) ( not ( = ?auto_199883 ?auto_199884 ) ) ( not ( = ?auto_199883 ?auto_199885 ) ) ( not ( = ?auto_199883 ?auto_199886 ) ) ( not ( = ?auto_199883 ?auto_199887 ) ) ( not ( = ?auto_199883 ?auto_199888 ) ) ( not ( = ?auto_199883 ?auto_199889 ) ) ( not ( = ?auto_199883 ?auto_199890 ) ) ( not ( = ?auto_199883 ?auto_199891 ) ) ( not ( = ?auto_199883 ?auto_199892 ) ) ( not ( = ?auto_199884 ?auto_199885 ) ) ( not ( = ?auto_199884 ?auto_199886 ) ) ( not ( = ?auto_199884 ?auto_199887 ) ) ( not ( = ?auto_199884 ?auto_199888 ) ) ( not ( = ?auto_199884 ?auto_199889 ) ) ( not ( = ?auto_199884 ?auto_199890 ) ) ( not ( = ?auto_199884 ?auto_199891 ) ) ( not ( = ?auto_199884 ?auto_199892 ) ) ( not ( = ?auto_199885 ?auto_199886 ) ) ( not ( = ?auto_199885 ?auto_199887 ) ) ( not ( = ?auto_199885 ?auto_199888 ) ) ( not ( = ?auto_199885 ?auto_199889 ) ) ( not ( = ?auto_199885 ?auto_199890 ) ) ( not ( = ?auto_199885 ?auto_199891 ) ) ( not ( = ?auto_199885 ?auto_199892 ) ) ( not ( = ?auto_199886 ?auto_199887 ) ) ( not ( = ?auto_199886 ?auto_199888 ) ) ( not ( = ?auto_199886 ?auto_199889 ) ) ( not ( = ?auto_199886 ?auto_199890 ) ) ( not ( = ?auto_199886 ?auto_199891 ) ) ( not ( = ?auto_199886 ?auto_199892 ) ) ( not ( = ?auto_199887 ?auto_199888 ) ) ( not ( = ?auto_199887 ?auto_199889 ) ) ( not ( = ?auto_199887 ?auto_199890 ) ) ( not ( = ?auto_199887 ?auto_199891 ) ) ( not ( = ?auto_199887 ?auto_199892 ) ) ( not ( = ?auto_199888 ?auto_199889 ) ) ( not ( = ?auto_199888 ?auto_199890 ) ) ( not ( = ?auto_199888 ?auto_199891 ) ) ( not ( = ?auto_199888 ?auto_199892 ) ) ( not ( = ?auto_199889 ?auto_199890 ) ) ( not ( = ?auto_199889 ?auto_199891 ) ) ( not ( = ?auto_199889 ?auto_199892 ) ) ( not ( = ?auto_199890 ?auto_199891 ) ) ( not ( = ?auto_199890 ?auto_199892 ) ) ( not ( = ?auto_199891 ?auto_199892 ) ) ( ON ?auto_199890 ?auto_199891 ) ( ON ?auto_199889 ?auto_199890 ) ( ON ?auto_199888 ?auto_199889 ) ( ON ?auto_199887 ?auto_199888 ) ( ON ?auto_199886 ?auto_199887 ) ( ON ?auto_199885 ?auto_199886 ) ( ON ?auto_199884 ?auto_199885 ) ( ON ?auto_199883 ?auto_199884 ) ( ON ?auto_199882 ?auto_199883 ) ( ON ?auto_199881 ?auto_199882 ) ( ON ?auto_199880 ?auto_199881 ) ( CLEAR ?auto_199880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_199880 )
      ( MAKE-12PILE ?auto_199880 ?auto_199881 ?auto_199882 ?auto_199883 ?auto_199884 ?auto_199885 ?auto_199886 ?auto_199887 ?auto_199888 ?auto_199889 ?auto_199890 ?auto_199891 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_199905 - BLOCK
      ?auto_199906 - BLOCK
      ?auto_199907 - BLOCK
      ?auto_199908 - BLOCK
      ?auto_199909 - BLOCK
      ?auto_199910 - BLOCK
      ?auto_199911 - BLOCK
      ?auto_199912 - BLOCK
      ?auto_199913 - BLOCK
      ?auto_199914 - BLOCK
      ?auto_199915 - BLOCK
      ?auto_199916 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199916 ) ( not ( = ?auto_199905 ?auto_199906 ) ) ( not ( = ?auto_199905 ?auto_199907 ) ) ( not ( = ?auto_199905 ?auto_199908 ) ) ( not ( = ?auto_199905 ?auto_199909 ) ) ( not ( = ?auto_199905 ?auto_199910 ) ) ( not ( = ?auto_199905 ?auto_199911 ) ) ( not ( = ?auto_199905 ?auto_199912 ) ) ( not ( = ?auto_199905 ?auto_199913 ) ) ( not ( = ?auto_199905 ?auto_199914 ) ) ( not ( = ?auto_199905 ?auto_199915 ) ) ( not ( = ?auto_199905 ?auto_199916 ) ) ( not ( = ?auto_199906 ?auto_199907 ) ) ( not ( = ?auto_199906 ?auto_199908 ) ) ( not ( = ?auto_199906 ?auto_199909 ) ) ( not ( = ?auto_199906 ?auto_199910 ) ) ( not ( = ?auto_199906 ?auto_199911 ) ) ( not ( = ?auto_199906 ?auto_199912 ) ) ( not ( = ?auto_199906 ?auto_199913 ) ) ( not ( = ?auto_199906 ?auto_199914 ) ) ( not ( = ?auto_199906 ?auto_199915 ) ) ( not ( = ?auto_199906 ?auto_199916 ) ) ( not ( = ?auto_199907 ?auto_199908 ) ) ( not ( = ?auto_199907 ?auto_199909 ) ) ( not ( = ?auto_199907 ?auto_199910 ) ) ( not ( = ?auto_199907 ?auto_199911 ) ) ( not ( = ?auto_199907 ?auto_199912 ) ) ( not ( = ?auto_199907 ?auto_199913 ) ) ( not ( = ?auto_199907 ?auto_199914 ) ) ( not ( = ?auto_199907 ?auto_199915 ) ) ( not ( = ?auto_199907 ?auto_199916 ) ) ( not ( = ?auto_199908 ?auto_199909 ) ) ( not ( = ?auto_199908 ?auto_199910 ) ) ( not ( = ?auto_199908 ?auto_199911 ) ) ( not ( = ?auto_199908 ?auto_199912 ) ) ( not ( = ?auto_199908 ?auto_199913 ) ) ( not ( = ?auto_199908 ?auto_199914 ) ) ( not ( = ?auto_199908 ?auto_199915 ) ) ( not ( = ?auto_199908 ?auto_199916 ) ) ( not ( = ?auto_199909 ?auto_199910 ) ) ( not ( = ?auto_199909 ?auto_199911 ) ) ( not ( = ?auto_199909 ?auto_199912 ) ) ( not ( = ?auto_199909 ?auto_199913 ) ) ( not ( = ?auto_199909 ?auto_199914 ) ) ( not ( = ?auto_199909 ?auto_199915 ) ) ( not ( = ?auto_199909 ?auto_199916 ) ) ( not ( = ?auto_199910 ?auto_199911 ) ) ( not ( = ?auto_199910 ?auto_199912 ) ) ( not ( = ?auto_199910 ?auto_199913 ) ) ( not ( = ?auto_199910 ?auto_199914 ) ) ( not ( = ?auto_199910 ?auto_199915 ) ) ( not ( = ?auto_199910 ?auto_199916 ) ) ( not ( = ?auto_199911 ?auto_199912 ) ) ( not ( = ?auto_199911 ?auto_199913 ) ) ( not ( = ?auto_199911 ?auto_199914 ) ) ( not ( = ?auto_199911 ?auto_199915 ) ) ( not ( = ?auto_199911 ?auto_199916 ) ) ( not ( = ?auto_199912 ?auto_199913 ) ) ( not ( = ?auto_199912 ?auto_199914 ) ) ( not ( = ?auto_199912 ?auto_199915 ) ) ( not ( = ?auto_199912 ?auto_199916 ) ) ( not ( = ?auto_199913 ?auto_199914 ) ) ( not ( = ?auto_199913 ?auto_199915 ) ) ( not ( = ?auto_199913 ?auto_199916 ) ) ( not ( = ?auto_199914 ?auto_199915 ) ) ( not ( = ?auto_199914 ?auto_199916 ) ) ( not ( = ?auto_199915 ?auto_199916 ) ) ( ON ?auto_199915 ?auto_199916 ) ( ON ?auto_199914 ?auto_199915 ) ( ON ?auto_199913 ?auto_199914 ) ( ON ?auto_199912 ?auto_199913 ) ( ON ?auto_199911 ?auto_199912 ) ( ON ?auto_199910 ?auto_199911 ) ( ON ?auto_199909 ?auto_199910 ) ( ON ?auto_199908 ?auto_199909 ) ( ON ?auto_199907 ?auto_199908 ) ( ON ?auto_199906 ?auto_199907 ) ( ON ?auto_199905 ?auto_199906 ) ( CLEAR ?auto_199905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_199905 )
      ( MAKE-12PILE ?auto_199905 ?auto_199906 ?auto_199907 ?auto_199908 ?auto_199909 ?auto_199910 ?auto_199911 ?auto_199912 ?auto_199913 ?auto_199914 ?auto_199915 ?auto_199916 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_199929 - BLOCK
      ?auto_199930 - BLOCK
      ?auto_199931 - BLOCK
      ?auto_199932 - BLOCK
      ?auto_199933 - BLOCK
      ?auto_199934 - BLOCK
      ?auto_199935 - BLOCK
      ?auto_199936 - BLOCK
      ?auto_199937 - BLOCK
      ?auto_199938 - BLOCK
      ?auto_199939 - BLOCK
      ?auto_199940 - BLOCK
    )
    :vars
    (
      ?auto_199941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199929 ?auto_199930 ) ) ( not ( = ?auto_199929 ?auto_199931 ) ) ( not ( = ?auto_199929 ?auto_199932 ) ) ( not ( = ?auto_199929 ?auto_199933 ) ) ( not ( = ?auto_199929 ?auto_199934 ) ) ( not ( = ?auto_199929 ?auto_199935 ) ) ( not ( = ?auto_199929 ?auto_199936 ) ) ( not ( = ?auto_199929 ?auto_199937 ) ) ( not ( = ?auto_199929 ?auto_199938 ) ) ( not ( = ?auto_199929 ?auto_199939 ) ) ( not ( = ?auto_199929 ?auto_199940 ) ) ( not ( = ?auto_199930 ?auto_199931 ) ) ( not ( = ?auto_199930 ?auto_199932 ) ) ( not ( = ?auto_199930 ?auto_199933 ) ) ( not ( = ?auto_199930 ?auto_199934 ) ) ( not ( = ?auto_199930 ?auto_199935 ) ) ( not ( = ?auto_199930 ?auto_199936 ) ) ( not ( = ?auto_199930 ?auto_199937 ) ) ( not ( = ?auto_199930 ?auto_199938 ) ) ( not ( = ?auto_199930 ?auto_199939 ) ) ( not ( = ?auto_199930 ?auto_199940 ) ) ( not ( = ?auto_199931 ?auto_199932 ) ) ( not ( = ?auto_199931 ?auto_199933 ) ) ( not ( = ?auto_199931 ?auto_199934 ) ) ( not ( = ?auto_199931 ?auto_199935 ) ) ( not ( = ?auto_199931 ?auto_199936 ) ) ( not ( = ?auto_199931 ?auto_199937 ) ) ( not ( = ?auto_199931 ?auto_199938 ) ) ( not ( = ?auto_199931 ?auto_199939 ) ) ( not ( = ?auto_199931 ?auto_199940 ) ) ( not ( = ?auto_199932 ?auto_199933 ) ) ( not ( = ?auto_199932 ?auto_199934 ) ) ( not ( = ?auto_199932 ?auto_199935 ) ) ( not ( = ?auto_199932 ?auto_199936 ) ) ( not ( = ?auto_199932 ?auto_199937 ) ) ( not ( = ?auto_199932 ?auto_199938 ) ) ( not ( = ?auto_199932 ?auto_199939 ) ) ( not ( = ?auto_199932 ?auto_199940 ) ) ( not ( = ?auto_199933 ?auto_199934 ) ) ( not ( = ?auto_199933 ?auto_199935 ) ) ( not ( = ?auto_199933 ?auto_199936 ) ) ( not ( = ?auto_199933 ?auto_199937 ) ) ( not ( = ?auto_199933 ?auto_199938 ) ) ( not ( = ?auto_199933 ?auto_199939 ) ) ( not ( = ?auto_199933 ?auto_199940 ) ) ( not ( = ?auto_199934 ?auto_199935 ) ) ( not ( = ?auto_199934 ?auto_199936 ) ) ( not ( = ?auto_199934 ?auto_199937 ) ) ( not ( = ?auto_199934 ?auto_199938 ) ) ( not ( = ?auto_199934 ?auto_199939 ) ) ( not ( = ?auto_199934 ?auto_199940 ) ) ( not ( = ?auto_199935 ?auto_199936 ) ) ( not ( = ?auto_199935 ?auto_199937 ) ) ( not ( = ?auto_199935 ?auto_199938 ) ) ( not ( = ?auto_199935 ?auto_199939 ) ) ( not ( = ?auto_199935 ?auto_199940 ) ) ( not ( = ?auto_199936 ?auto_199937 ) ) ( not ( = ?auto_199936 ?auto_199938 ) ) ( not ( = ?auto_199936 ?auto_199939 ) ) ( not ( = ?auto_199936 ?auto_199940 ) ) ( not ( = ?auto_199937 ?auto_199938 ) ) ( not ( = ?auto_199937 ?auto_199939 ) ) ( not ( = ?auto_199937 ?auto_199940 ) ) ( not ( = ?auto_199938 ?auto_199939 ) ) ( not ( = ?auto_199938 ?auto_199940 ) ) ( not ( = ?auto_199939 ?auto_199940 ) ) ( ON ?auto_199929 ?auto_199941 ) ( not ( = ?auto_199940 ?auto_199941 ) ) ( not ( = ?auto_199939 ?auto_199941 ) ) ( not ( = ?auto_199938 ?auto_199941 ) ) ( not ( = ?auto_199937 ?auto_199941 ) ) ( not ( = ?auto_199936 ?auto_199941 ) ) ( not ( = ?auto_199935 ?auto_199941 ) ) ( not ( = ?auto_199934 ?auto_199941 ) ) ( not ( = ?auto_199933 ?auto_199941 ) ) ( not ( = ?auto_199932 ?auto_199941 ) ) ( not ( = ?auto_199931 ?auto_199941 ) ) ( not ( = ?auto_199930 ?auto_199941 ) ) ( not ( = ?auto_199929 ?auto_199941 ) ) ( ON ?auto_199930 ?auto_199929 ) ( ON ?auto_199931 ?auto_199930 ) ( ON ?auto_199932 ?auto_199931 ) ( ON ?auto_199933 ?auto_199932 ) ( ON ?auto_199934 ?auto_199933 ) ( ON ?auto_199935 ?auto_199934 ) ( ON ?auto_199936 ?auto_199935 ) ( ON ?auto_199937 ?auto_199936 ) ( ON ?auto_199938 ?auto_199937 ) ( ON ?auto_199939 ?auto_199938 ) ( ON ?auto_199940 ?auto_199939 ) ( CLEAR ?auto_199940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_199940 ?auto_199939 ?auto_199938 ?auto_199937 ?auto_199936 ?auto_199935 ?auto_199934 ?auto_199933 ?auto_199932 ?auto_199931 ?auto_199930 ?auto_199929 )
      ( MAKE-12PILE ?auto_199929 ?auto_199930 ?auto_199931 ?auto_199932 ?auto_199933 ?auto_199934 ?auto_199935 ?auto_199936 ?auto_199937 ?auto_199938 ?auto_199939 ?auto_199940 ) )
  )

)

