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
      ?auto_650113 - BLOCK
    )
    :vars
    (
      ?auto_650114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650113 ?auto_650114 ) ( CLEAR ?auto_650113 ) ( HAND-EMPTY ) ( not ( = ?auto_650113 ?auto_650114 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_650113 ?auto_650114 )
      ( !PUTDOWN ?auto_650113 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_650120 - BLOCK
      ?auto_650121 - BLOCK
    )
    :vars
    (
      ?auto_650122 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_650120 ) ( ON ?auto_650121 ?auto_650122 ) ( CLEAR ?auto_650121 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_650120 ) ( not ( = ?auto_650120 ?auto_650121 ) ) ( not ( = ?auto_650120 ?auto_650122 ) ) ( not ( = ?auto_650121 ?auto_650122 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_650121 ?auto_650122 )
      ( !STACK ?auto_650121 ?auto_650120 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_650130 - BLOCK
      ?auto_650131 - BLOCK
    )
    :vars
    (
      ?auto_650132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650131 ?auto_650132 ) ( not ( = ?auto_650130 ?auto_650131 ) ) ( not ( = ?auto_650130 ?auto_650132 ) ) ( not ( = ?auto_650131 ?auto_650132 ) ) ( ON ?auto_650130 ?auto_650131 ) ( CLEAR ?auto_650130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_650130 )
      ( MAKE-2PILE ?auto_650130 ?auto_650131 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_650141 - BLOCK
      ?auto_650142 - BLOCK
      ?auto_650143 - BLOCK
    )
    :vars
    (
      ?auto_650144 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_650142 ) ( ON ?auto_650143 ?auto_650144 ) ( CLEAR ?auto_650143 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_650141 ) ( ON ?auto_650142 ?auto_650141 ) ( not ( = ?auto_650141 ?auto_650142 ) ) ( not ( = ?auto_650141 ?auto_650143 ) ) ( not ( = ?auto_650141 ?auto_650144 ) ) ( not ( = ?auto_650142 ?auto_650143 ) ) ( not ( = ?auto_650142 ?auto_650144 ) ) ( not ( = ?auto_650143 ?auto_650144 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_650143 ?auto_650144 )
      ( !STACK ?auto_650143 ?auto_650142 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_650155 - BLOCK
      ?auto_650156 - BLOCK
      ?auto_650157 - BLOCK
    )
    :vars
    (
      ?auto_650158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650157 ?auto_650158 ) ( ON-TABLE ?auto_650155 ) ( not ( = ?auto_650155 ?auto_650156 ) ) ( not ( = ?auto_650155 ?auto_650157 ) ) ( not ( = ?auto_650155 ?auto_650158 ) ) ( not ( = ?auto_650156 ?auto_650157 ) ) ( not ( = ?auto_650156 ?auto_650158 ) ) ( not ( = ?auto_650157 ?auto_650158 ) ) ( CLEAR ?auto_650155 ) ( ON ?auto_650156 ?auto_650157 ) ( CLEAR ?auto_650156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_650155 ?auto_650156 )
      ( MAKE-3PILE ?auto_650155 ?auto_650156 ?auto_650157 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_650169 - BLOCK
      ?auto_650170 - BLOCK
      ?auto_650171 - BLOCK
    )
    :vars
    (
      ?auto_650172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650171 ?auto_650172 ) ( not ( = ?auto_650169 ?auto_650170 ) ) ( not ( = ?auto_650169 ?auto_650171 ) ) ( not ( = ?auto_650169 ?auto_650172 ) ) ( not ( = ?auto_650170 ?auto_650171 ) ) ( not ( = ?auto_650170 ?auto_650172 ) ) ( not ( = ?auto_650171 ?auto_650172 ) ) ( ON ?auto_650170 ?auto_650171 ) ( ON ?auto_650169 ?auto_650170 ) ( CLEAR ?auto_650169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_650169 )
      ( MAKE-3PILE ?auto_650169 ?auto_650170 ?auto_650171 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_650184 - BLOCK
      ?auto_650185 - BLOCK
      ?auto_650186 - BLOCK
      ?auto_650187 - BLOCK
    )
    :vars
    (
      ?auto_650188 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_650186 ) ( ON ?auto_650187 ?auto_650188 ) ( CLEAR ?auto_650187 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_650184 ) ( ON ?auto_650185 ?auto_650184 ) ( ON ?auto_650186 ?auto_650185 ) ( not ( = ?auto_650184 ?auto_650185 ) ) ( not ( = ?auto_650184 ?auto_650186 ) ) ( not ( = ?auto_650184 ?auto_650187 ) ) ( not ( = ?auto_650184 ?auto_650188 ) ) ( not ( = ?auto_650185 ?auto_650186 ) ) ( not ( = ?auto_650185 ?auto_650187 ) ) ( not ( = ?auto_650185 ?auto_650188 ) ) ( not ( = ?auto_650186 ?auto_650187 ) ) ( not ( = ?auto_650186 ?auto_650188 ) ) ( not ( = ?auto_650187 ?auto_650188 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_650187 ?auto_650188 )
      ( !STACK ?auto_650187 ?auto_650186 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_650202 - BLOCK
      ?auto_650203 - BLOCK
      ?auto_650204 - BLOCK
      ?auto_650205 - BLOCK
    )
    :vars
    (
      ?auto_650206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650205 ?auto_650206 ) ( ON-TABLE ?auto_650202 ) ( ON ?auto_650203 ?auto_650202 ) ( not ( = ?auto_650202 ?auto_650203 ) ) ( not ( = ?auto_650202 ?auto_650204 ) ) ( not ( = ?auto_650202 ?auto_650205 ) ) ( not ( = ?auto_650202 ?auto_650206 ) ) ( not ( = ?auto_650203 ?auto_650204 ) ) ( not ( = ?auto_650203 ?auto_650205 ) ) ( not ( = ?auto_650203 ?auto_650206 ) ) ( not ( = ?auto_650204 ?auto_650205 ) ) ( not ( = ?auto_650204 ?auto_650206 ) ) ( not ( = ?auto_650205 ?auto_650206 ) ) ( CLEAR ?auto_650203 ) ( ON ?auto_650204 ?auto_650205 ) ( CLEAR ?auto_650204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_650202 ?auto_650203 ?auto_650204 )
      ( MAKE-4PILE ?auto_650202 ?auto_650203 ?auto_650204 ?auto_650205 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_650220 - BLOCK
      ?auto_650221 - BLOCK
      ?auto_650222 - BLOCK
      ?auto_650223 - BLOCK
    )
    :vars
    (
      ?auto_650224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650223 ?auto_650224 ) ( ON-TABLE ?auto_650220 ) ( not ( = ?auto_650220 ?auto_650221 ) ) ( not ( = ?auto_650220 ?auto_650222 ) ) ( not ( = ?auto_650220 ?auto_650223 ) ) ( not ( = ?auto_650220 ?auto_650224 ) ) ( not ( = ?auto_650221 ?auto_650222 ) ) ( not ( = ?auto_650221 ?auto_650223 ) ) ( not ( = ?auto_650221 ?auto_650224 ) ) ( not ( = ?auto_650222 ?auto_650223 ) ) ( not ( = ?auto_650222 ?auto_650224 ) ) ( not ( = ?auto_650223 ?auto_650224 ) ) ( ON ?auto_650222 ?auto_650223 ) ( CLEAR ?auto_650220 ) ( ON ?auto_650221 ?auto_650222 ) ( CLEAR ?auto_650221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_650220 ?auto_650221 )
      ( MAKE-4PILE ?auto_650220 ?auto_650221 ?auto_650222 ?auto_650223 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_650238 - BLOCK
      ?auto_650239 - BLOCK
      ?auto_650240 - BLOCK
      ?auto_650241 - BLOCK
    )
    :vars
    (
      ?auto_650242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650241 ?auto_650242 ) ( not ( = ?auto_650238 ?auto_650239 ) ) ( not ( = ?auto_650238 ?auto_650240 ) ) ( not ( = ?auto_650238 ?auto_650241 ) ) ( not ( = ?auto_650238 ?auto_650242 ) ) ( not ( = ?auto_650239 ?auto_650240 ) ) ( not ( = ?auto_650239 ?auto_650241 ) ) ( not ( = ?auto_650239 ?auto_650242 ) ) ( not ( = ?auto_650240 ?auto_650241 ) ) ( not ( = ?auto_650240 ?auto_650242 ) ) ( not ( = ?auto_650241 ?auto_650242 ) ) ( ON ?auto_650240 ?auto_650241 ) ( ON ?auto_650239 ?auto_650240 ) ( ON ?auto_650238 ?auto_650239 ) ( CLEAR ?auto_650238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_650238 )
      ( MAKE-4PILE ?auto_650238 ?auto_650239 ?auto_650240 ?auto_650241 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_650257 - BLOCK
      ?auto_650258 - BLOCK
      ?auto_650259 - BLOCK
      ?auto_650260 - BLOCK
      ?auto_650261 - BLOCK
    )
    :vars
    (
      ?auto_650262 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_650260 ) ( ON ?auto_650261 ?auto_650262 ) ( CLEAR ?auto_650261 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_650257 ) ( ON ?auto_650258 ?auto_650257 ) ( ON ?auto_650259 ?auto_650258 ) ( ON ?auto_650260 ?auto_650259 ) ( not ( = ?auto_650257 ?auto_650258 ) ) ( not ( = ?auto_650257 ?auto_650259 ) ) ( not ( = ?auto_650257 ?auto_650260 ) ) ( not ( = ?auto_650257 ?auto_650261 ) ) ( not ( = ?auto_650257 ?auto_650262 ) ) ( not ( = ?auto_650258 ?auto_650259 ) ) ( not ( = ?auto_650258 ?auto_650260 ) ) ( not ( = ?auto_650258 ?auto_650261 ) ) ( not ( = ?auto_650258 ?auto_650262 ) ) ( not ( = ?auto_650259 ?auto_650260 ) ) ( not ( = ?auto_650259 ?auto_650261 ) ) ( not ( = ?auto_650259 ?auto_650262 ) ) ( not ( = ?auto_650260 ?auto_650261 ) ) ( not ( = ?auto_650260 ?auto_650262 ) ) ( not ( = ?auto_650261 ?auto_650262 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_650261 ?auto_650262 )
      ( !STACK ?auto_650261 ?auto_650260 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_650279 - BLOCK
      ?auto_650280 - BLOCK
      ?auto_650281 - BLOCK
      ?auto_650282 - BLOCK
      ?auto_650283 - BLOCK
    )
    :vars
    (
      ?auto_650284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650283 ?auto_650284 ) ( ON-TABLE ?auto_650279 ) ( ON ?auto_650280 ?auto_650279 ) ( ON ?auto_650281 ?auto_650280 ) ( not ( = ?auto_650279 ?auto_650280 ) ) ( not ( = ?auto_650279 ?auto_650281 ) ) ( not ( = ?auto_650279 ?auto_650282 ) ) ( not ( = ?auto_650279 ?auto_650283 ) ) ( not ( = ?auto_650279 ?auto_650284 ) ) ( not ( = ?auto_650280 ?auto_650281 ) ) ( not ( = ?auto_650280 ?auto_650282 ) ) ( not ( = ?auto_650280 ?auto_650283 ) ) ( not ( = ?auto_650280 ?auto_650284 ) ) ( not ( = ?auto_650281 ?auto_650282 ) ) ( not ( = ?auto_650281 ?auto_650283 ) ) ( not ( = ?auto_650281 ?auto_650284 ) ) ( not ( = ?auto_650282 ?auto_650283 ) ) ( not ( = ?auto_650282 ?auto_650284 ) ) ( not ( = ?auto_650283 ?auto_650284 ) ) ( CLEAR ?auto_650281 ) ( ON ?auto_650282 ?auto_650283 ) ( CLEAR ?auto_650282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_650279 ?auto_650280 ?auto_650281 ?auto_650282 )
      ( MAKE-5PILE ?auto_650279 ?auto_650280 ?auto_650281 ?auto_650282 ?auto_650283 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_650301 - BLOCK
      ?auto_650302 - BLOCK
      ?auto_650303 - BLOCK
      ?auto_650304 - BLOCK
      ?auto_650305 - BLOCK
    )
    :vars
    (
      ?auto_650306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650305 ?auto_650306 ) ( ON-TABLE ?auto_650301 ) ( ON ?auto_650302 ?auto_650301 ) ( not ( = ?auto_650301 ?auto_650302 ) ) ( not ( = ?auto_650301 ?auto_650303 ) ) ( not ( = ?auto_650301 ?auto_650304 ) ) ( not ( = ?auto_650301 ?auto_650305 ) ) ( not ( = ?auto_650301 ?auto_650306 ) ) ( not ( = ?auto_650302 ?auto_650303 ) ) ( not ( = ?auto_650302 ?auto_650304 ) ) ( not ( = ?auto_650302 ?auto_650305 ) ) ( not ( = ?auto_650302 ?auto_650306 ) ) ( not ( = ?auto_650303 ?auto_650304 ) ) ( not ( = ?auto_650303 ?auto_650305 ) ) ( not ( = ?auto_650303 ?auto_650306 ) ) ( not ( = ?auto_650304 ?auto_650305 ) ) ( not ( = ?auto_650304 ?auto_650306 ) ) ( not ( = ?auto_650305 ?auto_650306 ) ) ( ON ?auto_650304 ?auto_650305 ) ( CLEAR ?auto_650302 ) ( ON ?auto_650303 ?auto_650304 ) ( CLEAR ?auto_650303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_650301 ?auto_650302 ?auto_650303 )
      ( MAKE-5PILE ?auto_650301 ?auto_650302 ?auto_650303 ?auto_650304 ?auto_650305 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_650323 - BLOCK
      ?auto_650324 - BLOCK
      ?auto_650325 - BLOCK
      ?auto_650326 - BLOCK
      ?auto_650327 - BLOCK
    )
    :vars
    (
      ?auto_650328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650327 ?auto_650328 ) ( ON-TABLE ?auto_650323 ) ( not ( = ?auto_650323 ?auto_650324 ) ) ( not ( = ?auto_650323 ?auto_650325 ) ) ( not ( = ?auto_650323 ?auto_650326 ) ) ( not ( = ?auto_650323 ?auto_650327 ) ) ( not ( = ?auto_650323 ?auto_650328 ) ) ( not ( = ?auto_650324 ?auto_650325 ) ) ( not ( = ?auto_650324 ?auto_650326 ) ) ( not ( = ?auto_650324 ?auto_650327 ) ) ( not ( = ?auto_650324 ?auto_650328 ) ) ( not ( = ?auto_650325 ?auto_650326 ) ) ( not ( = ?auto_650325 ?auto_650327 ) ) ( not ( = ?auto_650325 ?auto_650328 ) ) ( not ( = ?auto_650326 ?auto_650327 ) ) ( not ( = ?auto_650326 ?auto_650328 ) ) ( not ( = ?auto_650327 ?auto_650328 ) ) ( ON ?auto_650326 ?auto_650327 ) ( ON ?auto_650325 ?auto_650326 ) ( CLEAR ?auto_650323 ) ( ON ?auto_650324 ?auto_650325 ) ( CLEAR ?auto_650324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_650323 ?auto_650324 )
      ( MAKE-5PILE ?auto_650323 ?auto_650324 ?auto_650325 ?auto_650326 ?auto_650327 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_650345 - BLOCK
      ?auto_650346 - BLOCK
      ?auto_650347 - BLOCK
      ?auto_650348 - BLOCK
      ?auto_650349 - BLOCK
    )
    :vars
    (
      ?auto_650350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650349 ?auto_650350 ) ( not ( = ?auto_650345 ?auto_650346 ) ) ( not ( = ?auto_650345 ?auto_650347 ) ) ( not ( = ?auto_650345 ?auto_650348 ) ) ( not ( = ?auto_650345 ?auto_650349 ) ) ( not ( = ?auto_650345 ?auto_650350 ) ) ( not ( = ?auto_650346 ?auto_650347 ) ) ( not ( = ?auto_650346 ?auto_650348 ) ) ( not ( = ?auto_650346 ?auto_650349 ) ) ( not ( = ?auto_650346 ?auto_650350 ) ) ( not ( = ?auto_650347 ?auto_650348 ) ) ( not ( = ?auto_650347 ?auto_650349 ) ) ( not ( = ?auto_650347 ?auto_650350 ) ) ( not ( = ?auto_650348 ?auto_650349 ) ) ( not ( = ?auto_650348 ?auto_650350 ) ) ( not ( = ?auto_650349 ?auto_650350 ) ) ( ON ?auto_650348 ?auto_650349 ) ( ON ?auto_650347 ?auto_650348 ) ( ON ?auto_650346 ?auto_650347 ) ( ON ?auto_650345 ?auto_650346 ) ( CLEAR ?auto_650345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_650345 )
      ( MAKE-5PILE ?auto_650345 ?auto_650346 ?auto_650347 ?auto_650348 ?auto_650349 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_650368 - BLOCK
      ?auto_650369 - BLOCK
      ?auto_650370 - BLOCK
      ?auto_650371 - BLOCK
      ?auto_650372 - BLOCK
      ?auto_650373 - BLOCK
    )
    :vars
    (
      ?auto_650374 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_650372 ) ( ON ?auto_650373 ?auto_650374 ) ( CLEAR ?auto_650373 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_650368 ) ( ON ?auto_650369 ?auto_650368 ) ( ON ?auto_650370 ?auto_650369 ) ( ON ?auto_650371 ?auto_650370 ) ( ON ?auto_650372 ?auto_650371 ) ( not ( = ?auto_650368 ?auto_650369 ) ) ( not ( = ?auto_650368 ?auto_650370 ) ) ( not ( = ?auto_650368 ?auto_650371 ) ) ( not ( = ?auto_650368 ?auto_650372 ) ) ( not ( = ?auto_650368 ?auto_650373 ) ) ( not ( = ?auto_650368 ?auto_650374 ) ) ( not ( = ?auto_650369 ?auto_650370 ) ) ( not ( = ?auto_650369 ?auto_650371 ) ) ( not ( = ?auto_650369 ?auto_650372 ) ) ( not ( = ?auto_650369 ?auto_650373 ) ) ( not ( = ?auto_650369 ?auto_650374 ) ) ( not ( = ?auto_650370 ?auto_650371 ) ) ( not ( = ?auto_650370 ?auto_650372 ) ) ( not ( = ?auto_650370 ?auto_650373 ) ) ( not ( = ?auto_650370 ?auto_650374 ) ) ( not ( = ?auto_650371 ?auto_650372 ) ) ( not ( = ?auto_650371 ?auto_650373 ) ) ( not ( = ?auto_650371 ?auto_650374 ) ) ( not ( = ?auto_650372 ?auto_650373 ) ) ( not ( = ?auto_650372 ?auto_650374 ) ) ( not ( = ?auto_650373 ?auto_650374 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_650373 ?auto_650374 )
      ( !STACK ?auto_650373 ?auto_650372 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_650394 - BLOCK
      ?auto_650395 - BLOCK
      ?auto_650396 - BLOCK
      ?auto_650397 - BLOCK
      ?auto_650398 - BLOCK
      ?auto_650399 - BLOCK
    )
    :vars
    (
      ?auto_650400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650399 ?auto_650400 ) ( ON-TABLE ?auto_650394 ) ( ON ?auto_650395 ?auto_650394 ) ( ON ?auto_650396 ?auto_650395 ) ( ON ?auto_650397 ?auto_650396 ) ( not ( = ?auto_650394 ?auto_650395 ) ) ( not ( = ?auto_650394 ?auto_650396 ) ) ( not ( = ?auto_650394 ?auto_650397 ) ) ( not ( = ?auto_650394 ?auto_650398 ) ) ( not ( = ?auto_650394 ?auto_650399 ) ) ( not ( = ?auto_650394 ?auto_650400 ) ) ( not ( = ?auto_650395 ?auto_650396 ) ) ( not ( = ?auto_650395 ?auto_650397 ) ) ( not ( = ?auto_650395 ?auto_650398 ) ) ( not ( = ?auto_650395 ?auto_650399 ) ) ( not ( = ?auto_650395 ?auto_650400 ) ) ( not ( = ?auto_650396 ?auto_650397 ) ) ( not ( = ?auto_650396 ?auto_650398 ) ) ( not ( = ?auto_650396 ?auto_650399 ) ) ( not ( = ?auto_650396 ?auto_650400 ) ) ( not ( = ?auto_650397 ?auto_650398 ) ) ( not ( = ?auto_650397 ?auto_650399 ) ) ( not ( = ?auto_650397 ?auto_650400 ) ) ( not ( = ?auto_650398 ?auto_650399 ) ) ( not ( = ?auto_650398 ?auto_650400 ) ) ( not ( = ?auto_650399 ?auto_650400 ) ) ( CLEAR ?auto_650397 ) ( ON ?auto_650398 ?auto_650399 ) ( CLEAR ?auto_650398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_650394 ?auto_650395 ?auto_650396 ?auto_650397 ?auto_650398 )
      ( MAKE-6PILE ?auto_650394 ?auto_650395 ?auto_650396 ?auto_650397 ?auto_650398 ?auto_650399 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_650420 - BLOCK
      ?auto_650421 - BLOCK
      ?auto_650422 - BLOCK
      ?auto_650423 - BLOCK
      ?auto_650424 - BLOCK
      ?auto_650425 - BLOCK
    )
    :vars
    (
      ?auto_650426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650425 ?auto_650426 ) ( ON-TABLE ?auto_650420 ) ( ON ?auto_650421 ?auto_650420 ) ( ON ?auto_650422 ?auto_650421 ) ( not ( = ?auto_650420 ?auto_650421 ) ) ( not ( = ?auto_650420 ?auto_650422 ) ) ( not ( = ?auto_650420 ?auto_650423 ) ) ( not ( = ?auto_650420 ?auto_650424 ) ) ( not ( = ?auto_650420 ?auto_650425 ) ) ( not ( = ?auto_650420 ?auto_650426 ) ) ( not ( = ?auto_650421 ?auto_650422 ) ) ( not ( = ?auto_650421 ?auto_650423 ) ) ( not ( = ?auto_650421 ?auto_650424 ) ) ( not ( = ?auto_650421 ?auto_650425 ) ) ( not ( = ?auto_650421 ?auto_650426 ) ) ( not ( = ?auto_650422 ?auto_650423 ) ) ( not ( = ?auto_650422 ?auto_650424 ) ) ( not ( = ?auto_650422 ?auto_650425 ) ) ( not ( = ?auto_650422 ?auto_650426 ) ) ( not ( = ?auto_650423 ?auto_650424 ) ) ( not ( = ?auto_650423 ?auto_650425 ) ) ( not ( = ?auto_650423 ?auto_650426 ) ) ( not ( = ?auto_650424 ?auto_650425 ) ) ( not ( = ?auto_650424 ?auto_650426 ) ) ( not ( = ?auto_650425 ?auto_650426 ) ) ( ON ?auto_650424 ?auto_650425 ) ( CLEAR ?auto_650422 ) ( ON ?auto_650423 ?auto_650424 ) ( CLEAR ?auto_650423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_650420 ?auto_650421 ?auto_650422 ?auto_650423 )
      ( MAKE-6PILE ?auto_650420 ?auto_650421 ?auto_650422 ?auto_650423 ?auto_650424 ?auto_650425 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_650446 - BLOCK
      ?auto_650447 - BLOCK
      ?auto_650448 - BLOCK
      ?auto_650449 - BLOCK
      ?auto_650450 - BLOCK
      ?auto_650451 - BLOCK
    )
    :vars
    (
      ?auto_650452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650451 ?auto_650452 ) ( ON-TABLE ?auto_650446 ) ( ON ?auto_650447 ?auto_650446 ) ( not ( = ?auto_650446 ?auto_650447 ) ) ( not ( = ?auto_650446 ?auto_650448 ) ) ( not ( = ?auto_650446 ?auto_650449 ) ) ( not ( = ?auto_650446 ?auto_650450 ) ) ( not ( = ?auto_650446 ?auto_650451 ) ) ( not ( = ?auto_650446 ?auto_650452 ) ) ( not ( = ?auto_650447 ?auto_650448 ) ) ( not ( = ?auto_650447 ?auto_650449 ) ) ( not ( = ?auto_650447 ?auto_650450 ) ) ( not ( = ?auto_650447 ?auto_650451 ) ) ( not ( = ?auto_650447 ?auto_650452 ) ) ( not ( = ?auto_650448 ?auto_650449 ) ) ( not ( = ?auto_650448 ?auto_650450 ) ) ( not ( = ?auto_650448 ?auto_650451 ) ) ( not ( = ?auto_650448 ?auto_650452 ) ) ( not ( = ?auto_650449 ?auto_650450 ) ) ( not ( = ?auto_650449 ?auto_650451 ) ) ( not ( = ?auto_650449 ?auto_650452 ) ) ( not ( = ?auto_650450 ?auto_650451 ) ) ( not ( = ?auto_650450 ?auto_650452 ) ) ( not ( = ?auto_650451 ?auto_650452 ) ) ( ON ?auto_650450 ?auto_650451 ) ( ON ?auto_650449 ?auto_650450 ) ( CLEAR ?auto_650447 ) ( ON ?auto_650448 ?auto_650449 ) ( CLEAR ?auto_650448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_650446 ?auto_650447 ?auto_650448 )
      ( MAKE-6PILE ?auto_650446 ?auto_650447 ?auto_650448 ?auto_650449 ?auto_650450 ?auto_650451 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_650472 - BLOCK
      ?auto_650473 - BLOCK
      ?auto_650474 - BLOCK
      ?auto_650475 - BLOCK
      ?auto_650476 - BLOCK
      ?auto_650477 - BLOCK
    )
    :vars
    (
      ?auto_650478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650477 ?auto_650478 ) ( ON-TABLE ?auto_650472 ) ( not ( = ?auto_650472 ?auto_650473 ) ) ( not ( = ?auto_650472 ?auto_650474 ) ) ( not ( = ?auto_650472 ?auto_650475 ) ) ( not ( = ?auto_650472 ?auto_650476 ) ) ( not ( = ?auto_650472 ?auto_650477 ) ) ( not ( = ?auto_650472 ?auto_650478 ) ) ( not ( = ?auto_650473 ?auto_650474 ) ) ( not ( = ?auto_650473 ?auto_650475 ) ) ( not ( = ?auto_650473 ?auto_650476 ) ) ( not ( = ?auto_650473 ?auto_650477 ) ) ( not ( = ?auto_650473 ?auto_650478 ) ) ( not ( = ?auto_650474 ?auto_650475 ) ) ( not ( = ?auto_650474 ?auto_650476 ) ) ( not ( = ?auto_650474 ?auto_650477 ) ) ( not ( = ?auto_650474 ?auto_650478 ) ) ( not ( = ?auto_650475 ?auto_650476 ) ) ( not ( = ?auto_650475 ?auto_650477 ) ) ( not ( = ?auto_650475 ?auto_650478 ) ) ( not ( = ?auto_650476 ?auto_650477 ) ) ( not ( = ?auto_650476 ?auto_650478 ) ) ( not ( = ?auto_650477 ?auto_650478 ) ) ( ON ?auto_650476 ?auto_650477 ) ( ON ?auto_650475 ?auto_650476 ) ( ON ?auto_650474 ?auto_650475 ) ( CLEAR ?auto_650472 ) ( ON ?auto_650473 ?auto_650474 ) ( CLEAR ?auto_650473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_650472 ?auto_650473 )
      ( MAKE-6PILE ?auto_650472 ?auto_650473 ?auto_650474 ?auto_650475 ?auto_650476 ?auto_650477 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_650498 - BLOCK
      ?auto_650499 - BLOCK
      ?auto_650500 - BLOCK
      ?auto_650501 - BLOCK
      ?auto_650502 - BLOCK
      ?auto_650503 - BLOCK
    )
    :vars
    (
      ?auto_650504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650503 ?auto_650504 ) ( not ( = ?auto_650498 ?auto_650499 ) ) ( not ( = ?auto_650498 ?auto_650500 ) ) ( not ( = ?auto_650498 ?auto_650501 ) ) ( not ( = ?auto_650498 ?auto_650502 ) ) ( not ( = ?auto_650498 ?auto_650503 ) ) ( not ( = ?auto_650498 ?auto_650504 ) ) ( not ( = ?auto_650499 ?auto_650500 ) ) ( not ( = ?auto_650499 ?auto_650501 ) ) ( not ( = ?auto_650499 ?auto_650502 ) ) ( not ( = ?auto_650499 ?auto_650503 ) ) ( not ( = ?auto_650499 ?auto_650504 ) ) ( not ( = ?auto_650500 ?auto_650501 ) ) ( not ( = ?auto_650500 ?auto_650502 ) ) ( not ( = ?auto_650500 ?auto_650503 ) ) ( not ( = ?auto_650500 ?auto_650504 ) ) ( not ( = ?auto_650501 ?auto_650502 ) ) ( not ( = ?auto_650501 ?auto_650503 ) ) ( not ( = ?auto_650501 ?auto_650504 ) ) ( not ( = ?auto_650502 ?auto_650503 ) ) ( not ( = ?auto_650502 ?auto_650504 ) ) ( not ( = ?auto_650503 ?auto_650504 ) ) ( ON ?auto_650502 ?auto_650503 ) ( ON ?auto_650501 ?auto_650502 ) ( ON ?auto_650500 ?auto_650501 ) ( ON ?auto_650499 ?auto_650500 ) ( ON ?auto_650498 ?auto_650499 ) ( CLEAR ?auto_650498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_650498 )
      ( MAKE-6PILE ?auto_650498 ?auto_650499 ?auto_650500 ?auto_650501 ?auto_650502 ?auto_650503 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_650525 - BLOCK
      ?auto_650526 - BLOCK
      ?auto_650527 - BLOCK
      ?auto_650528 - BLOCK
      ?auto_650529 - BLOCK
      ?auto_650530 - BLOCK
      ?auto_650531 - BLOCK
    )
    :vars
    (
      ?auto_650532 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_650530 ) ( ON ?auto_650531 ?auto_650532 ) ( CLEAR ?auto_650531 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_650525 ) ( ON ?auto_650526 ?auto_650525 ) ( ON ?auto_650527 ?auto_650526 ) ( ON ?auto_650528 ?auto_650527 ) ( ON ?auto_650529 ?auto_650528 ) ( ON ?auto_650530 ?auto_650529 ) ( not ( = ?auto_650525 ?auto_650526 ) ) ( not ( = ?auto_650525 ?auto_650527 ) ) ( not ( = ?auto_650525 ?auto_650528 ) ) ( not ( = ?auto_650525 ?auto_650529 ) ) ( not ( = ?auto_650525 ?auto_650530 ) ) ( not ( = ?auto_650525 ?auto_650531 ) ) ( not ( = ?auto_650525 ?auto_650532 ) ) ( not ( = ?auto_650526 ?auto_650527 ) ) ( not ( = ?auto_650526 ?auto_650528 ) ) ( not ( = ?auto_650526 ?auto_650529 ) ) ( not ( = ?auto_650526 ?auto_650530 ) ) ( not ( = ?auto_650526 ?auto_650531 ) ) ( not ( = ?auto_650526 ?auto_650532 ) ) ( not ( = ?auto_650527 ?auto_650528 ) ) ( not ( = ?auto_650527 ?auto_650529 ) ) ( not ( = ?auto_650527 ?auto_650530 ) ) ( not ( = ?auto_650527 ?auto_650531 ) ) ( not ( = ?auto_650527 ?auto_650532 ) ) ( not ( = ?auto_650528 ?auto_650529 ) ) ( not ( = ?auto_650528 ?auto_650530 ) ) ( not ( = ?auto_650528 ?auto_650531 ) ) ( not ( = ?auto_650528 ?auto_650532 ) ) ( not ( = ?auto_650529 ?auto_650530 ) ) ( not ( = ?auto_650529 ?auto_650531 ) ) ( not ( = ?auto_650529 ?auto_650532 ) ) ( not ( = ?auto_650530 ?auto_650531 ) ) ( not ( = ?auto_650530 ?auto_650532 ) ) ( not ( = ?auto_650531 ?auto_650532 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_650531 ?auto_650532 )
      ( !STACK ?auto_650531 ?auto_650530 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_650555 - BLOCK
      ?auto_650556 - BLOCK
      ?auto_650557 - BLOCK
      ?auto_650558 - BLOCK
      ?auto_650559 - BLOCK
      ?auto_650560 - BLOCK
      ?auto_650561 - BLOCK
    )
    :vars
    (
      ?auto_650562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650561 ?auto_650562 ) ( ON-TABLE ?auto_650555 ) ( ON ?auto_650556 ?auto_650555 ) ( ON ?auto_650557 ?auto_650556 ) ( ON ?auto_650558 ?auto_650557 ) ( ON ?auto_650559 ?auto_650558 ) ( not ( = ?auto_650555 ?auto_650556 ) ) ( not ( = ?auto_650555 ?auto_650557 ) ) ( not ( = ?auto_650555 ?auto_650558 ) ) ( not ( = ?auto_650555 ?auto_650559 ) ) ( not ( = ?auto_650555 ?auto_650560 ) ) ( not ( = ?auto_650555 ?auto_650561 ) ) ( not ( = ?auto_650555 ?auto_650562 ) ) ( not ( = ?auto_650556 ?auto_650557 ) ) ( not ( = ?auto_650556 ?auto_650558 ) ) ( not ( = ?auto_650556 ?auto_650559 ) ) ( not ( = ?auto_650556 ?auto_650560 ) ) ( not ( = ?auto_650556 ?auto_650561 ) ) ( not ( = ?auto_650556 ?auto_650562 ) ) ( not ( = ?auto_650557 ?auto_650558 ) ) ( not ( = ?auto_650557 ?auto_650559 ) ) ( not ( = ?auto_650557 ?auto_650560 ) ) ( not ( = ?auto_650557 ?auto_650561 ) ) ( not ( = ?auto_650557 ?auto_650562 ) ) ( not ( = ?auto_650558 ?auto_650559 ) ) ( not ( = ?auto_650558 ?auto_650560 ) ) ( not ( = ?auto_650558 ?auto_650561 ) ) ( not ( = ?auto_650558 ?auto_650562 ) ) ( not ( = ?auto_650559 ?auto_650560 ) ) ( not ( = ?auto_650559 ?auto_650561 ) ) ( not ( = ?auto_650559 ?auto_650562 ) ) ( not ( = ?auto_650560 ?auto_650561 ) ) ( not ( = ?auto_650560 ?auto_650562 ) ) ( not ( = ?auto_650561 ?auto_650562 ) ) ( CLEAR ?auto_650559 ) ( ON ?auto_650560 ?auto_650561 ) ( CLEAR ?auto_650560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_650555 ?auto_650556 ?auto_650557 ?auto_650558 ?auto_650559 ?auto_650560 )
      ( MAKE-7PILE ?auto_650555 ?auto_650556 ?auto_650557 ?auto_650558 ?auto_650559 ?auto_650560 ?auto_650561 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_650585 - BLOCK
      ?auto_650586 - BLOCK
      ?auto_650587 - BLOCK
      ?auto_650588 - BLOCK
      ?auto_650589 - BLOCK
      ?auto_650590 - BLOCK
      ?auto_650591 - BLOCK
    )
    :vars
    (
      ?auto_650592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650591 ?auto_650592 ) ( ON-TABLE ?auto_650585 ) ( ON ?auto_650586 ?auto_650585 ) ( ON ?auto_650587 ?auto_650586 ) ( ON ?auto_650588 ?auto_650587 ) ( not ( = ?auto_650585 ?auto_650586 ) ) ( not ( = ?auto_650585 ?auto_650587 ) ) ( not ( = ?auto_650585 ?auto_650588 ) ) ( not ( = ?auto_650585 ?auto_650589 ) ) ( not ( = ?auto_650585 ?auto_650590 ) ) ( not ( = ?auto_650585 ?auto_650591 ) ) ( not ( = ?auto_650585 ?auto_650592 ) ) ( not ( = ?auto_650586 ?auto_650587 ) ) ( not ( = ?auto_650586 ?auto_650588 ) ) ( not ( = ?auto_650586 ?auto_650589 ) ) ( not ( = ?auto_650586 ?auto_650590 ) ) ( not ( = ?auto_650586 ?auto_650591 ) ) ( not ( = ?auto_650586 ?auto_650592 ) ) ( not ( = ?auto_650587 ?auto_650588 ) ) ( not ( = ?auto_650587 ?auto_650589 ) ) ( not ( = ?auto_650587 ?auto_650590 ) ) ( not ( = ?auto_650587 ?auto_650591 ) ) ( not ( = ?auto_650587 ?auto_650592 ) ) ( not ( = ?auto_650588 ?auto_650589 ) ) ( not ( = ?auto_650588 ?auto_650590 ) ) ( not ( = ?auto_650588 ?auto_650591 ) ) ( not ( = ?auto_650588 ?auto_650592 ) ) ( not ( = ?auto_650589 ?auto_650590 ) ) ( not ( = ?auto_650589 ?auto_650591 ) ) ( not ( = ?auto_650589 ?auto_650592 ) ) ( not ( = ?auto_650590 ?auto_650591 ) ) ( not ( = ?auto_650590 ?auto_650592 ) ) ( not ( = ?auto_650591 ?auto_650592 ) ) ( ON ?auto_650590 ?auto_650591 ) ( CLEAR ?auto_650588 ) ( ON ?auto_650589 ?auto_650590 ) ( CLEAR ?auto_650589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_650585 ?auto_650586 ?auto_650587 ?auto_650588 ?auto_650589 )
      ( MAKE-7PILE ?auto_650585 ?auto_650586 ?auto_650587 ?auto_650588 ?auto_650589 ?auto_650590 ?auto_650591 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_650615 - BLOCK
      ?auto_650616 - BLOCK
      ?auto_650617 - BLOCK
      ?auto_650618 - BLOCK
      ?auto_650619 - BLOCK
      ?auto_650620 - BLOCK
      ?auto_650621 - BLOCK
    )
    :vars
    (
      ?auto_650622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650621 ?auto_650622 ) ( ON-TABLE ?auto_650615 ) ( ON ?auto_650616 ?auto_650615 ) ( ON ?auto_650617 ?auto_650616 ) ( not ( = ?auto_650615 ?auto_650616 ) ) ( not ( = ?auto_650615 ?auto_650617 ) ) ( not ( = ?auto_650615 ?auto_650618 ) ) ( not ( = ?auto_650615 ?auto_650619 ) ) ( not ( = ?auto_650615 ?auto_650620 ) ) ( not ( = ?auto_650615 ?auto_650621 ) ) ( not ( = ?auto_650615 ?auto_650622 ) ) ( not ( = ?auto_650616 ?auto_650617 ) ) ( not ( = ?auto_650616 ?auto_650618 ) ) ( not ( = ?auto_650616 ?auto_650619 ) ) ( not ( = ?auto_650616 ?auto_650620 ) ) ( not ( = ?auto_650616 ?auto_650621 ) ) ( not ( = ?auto_650616 ?auto_650622 ) ) ( not ( = ?auto_650617 ?auto_650618 ) ) ( not ( = ?auto_650617 ?auto_650619 ) ) ( not ( = ?auto_650617 ?auto_650620 ) ) ( not ( = ?auto_650617 ?auto_650621 ) ) ( not ( = ?auto_650617 ?auto_650622 ) ) ( not ( = ?auto_650618 ?auto_650619 ) ) ( not ( = ?auto_650618 ?auto_650620 ) ) ( not ( = ?auto_650618 ?auto_650621 ) ) ( not ( = ?auto_650618 ?auto_650622 ) ) ( not ( = ?auto_650619 ?auto_650620 ) ) ( not ( = ?auto_650619 ?auto_650621 ) ) ( not ( = ?auto_650619 ?auto_650622 ) ) ( not ( = ?auto_650620 ?auto_650621 ) ) ( not ( = ?auto_650620 ?auto_650622 ) ) ( not ( = ?auto_650621 ?auto_650622 ) ) ( ON ?auto_650620 ?auto_650621 ) ( ON ?auto_650619 ?auto_650620 ) ( CLEAR ?auto_650617 ) ( ON ?auto_650618 ?auto_650619 ) ( CLEAR ?auto_650618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_650615 ?auto_650616 ?auto_650617 ?auto_650618 )
      ( MAKE-7PILE ?auto_650615 ?auto_650616 ?auto_650617 ?auto_650618 ?auto_650619 ?auto_650620 ?auto_650621 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_650645 - BLOCK
      ?auto_650646 - BLOCK
      ?auto_650647 - BLOCK
      ?auto_650648 - BLOCK
      ?auto_650649 - BLOCK
      ?auto_650650 - BLOCK
      ?auto_650651 - BLOCK
    )
    :vars
    (
      ?auto_650652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650651 ?auto_650652 ) ( ON-TABLE ?auto_650645 ) ( ON ?auto_650646 ?auto_650645 ) ( not ( = ?auto_650645 ?auto_650646 ) ) ( not ( = ?auto_650645 ?auto_650647 ) ) ( not ( = ?auto_650645 ?auto_650648 ) ) ( not ( = ?auto_650645 ?auto_650649 ) ) ( not ( = ?auto_650645 ?auto_650650 ) ) ( not ( = ?auto_650645 ?auto_650651 ) ) ( not ( = ?auto_650645 ?auto_650652 ) ) ( not ( = ?auto_650646 ?auto_650647 ) ) ( not ( = ?auto_650646 ?auto_650648 ) ) ( not ( = ?auto_650646 ?auto_650649 ) ) ( not ( = ?auto_650646 ?auto_650650 ) ) ( not ( = ?auto_650646 ?auto_650651 ) ) ( not ( = ?auto_650646 ?auto_650652 ) ) ( not ( = ?auto_650647 ?auto_650648 ) ) ( not ( = ?auto_650647 ?auto_650649 ) ) ( not ( = ?auto_650647 ?auto_650650 ) ) ( not ( = ?auto_650647 ?auto_650651 ) ) ( not ( = ?auto_650647 ?auto_650652 ) ) ( not ( = ?auto_650648 ?auto_650649 ) ) ( not ( = ?auto_650648 ?auto_650650 ) ) ( not ( = ?auto_650648 ?auto_650651 ) ) ( not ( = ?auto_650648 ?auto_650652 ) ) ( not ( = ?auto_650649 ?auto_650650 ) ) ( not ( = ?auto_650649 ?auto_650651 ) ) ( not ( = ?auto_650649 ?auto_650652 ) ) ( not ( = ?auto_650650 ?auto_650651 ) ) ( not ( = ?auto_650650 ?auto_650652 ) ) ( not ( = ?auto_650651 ?auto_650652 ) ) ( ON ?auto_650650 ?auto_650651 ) ( ON ?auto_650649 ?auto_650650 ) ( ON ?auto_650648 ?auto_650649 ) ( CLEAR ?auto_650646 ) ( ON ?auto_650647 ?auto_650648 ) ( CLEAR ?auto_650647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_650645 ?auto_650646 ?auto_650647 )
      ( MAKE-7PILE ?auto_650645 ?auto_650646 ?auto_650647 ?auto_650648 ?auto_650649 ?auto_650650 ?auto_650651 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_650675 - BLOCK
      ?auto_650676 - BLOCK
      ?auto_650677 - BLOCK
      ?auto_650678 - BLOCK
      ?auto_650679 - BLOCK
      ?auto_650680 - BLOCK
      ?auto_650681 - BLOCK
    )
    :vars
    (
      ?auto_650682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650681 ?auto_650682 ) ( ON-TABLE ?auto_650675 ) ( not ( = ?auto_650675 ?auto_650676 ) ) ( not ( = ?auto_650675 ?auto_650677 ) ) ( not ( = ?auto_650675 ?auto_650678 ) ) ( not ( = ?auto_650675 ?auto_650679 ) ) ( not ( = ?auto_650675 ?auto_650680 ) ) ( not ( = ?auto_650675 ?auto_650681 ) ) ( not ( = ?auto_650675 ?auto_650682 ) ) ( not ( = ?auto_650676 ?auto_650677 ) ) ( not ( = ?auto_650676 ?auto_650678 ) ) ( not ( = ?auto_650676 ?auto_650679 ) ) ( not ( = ?auto_650676 ?auto_650680 ) ) ( not ( = ?auto_650676 ?auto_650681 ) ) ( not ( = ?auto_650676 ?auto_650682 ) ) ( not ( = ?auto_650677 ?auto_650678 ) ) ( not ( = ?auto_650677 ?auto_650679 ) ) ( not ( = ?auto_650677 ?auto_650680 ) ) ( not ( = ?auto_650677 ?auto_650681 ) ) ( not ( = ?auto_650677 ?auto_650682 ) ) ( not ( = ?auto_650678 ?auto_650679 ) ) ( not ( = ?auto_650678 ?auto_650680 ) ) ( not ( = ?auto_650678 ?auto_650681 ) ) ( not ( = ?auto_650678 ?auto_650682 ) ) ( not ( = ?auto_650679 ?auto_650680 ) ) ( not ( = ?auto_650679 ?auto_650681 ) ) ( not ( = ?auto_650679 ?auto_650682 ) ) ( not ( = ?auto_650680 ?auto_650681 ) ) ( not ( = ?auto_650680 ?auto_650682 ) ) ( not ( = ?auto_650681 ?auto_650682 ) ) ( ON ?auto_650680 ?auto_650681 ) ( ON ?auto_650679 ?auto_650680 ) ( ON ?auto_650678 ?auto_650679 ) ( ON ?auto_650677 ?auto_650678 ) ( CLEAR ?auto_650675 ) ( ON ?auto_650676 ?auto_650677 ) ( CLEAR ?auto_650676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_650675 ?auto_650676 )
      ( MAKE-7PILE ?auto_650675 ?auto_650676 ?auto_650677 ?auto_650678 ?auto_650679 ?auto_650680 ?auto_650681 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_650705 - BLOCK
      ?auto_650706 - BLOCK
      ?auto_650707 - BLOCK
      ?auto_650708 - BLOCK
      ?auto_650709 - BLOCK
      ?auto_650710 - BLOCK
      ?auto_650711 - BLOCK
    )
    :vars
    (
      ?auto_650712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650711 ?auto_650712 ) ( not ( = ?auto_650705 ?auto_650706 ) ) ( not ( = ?auto_650705 ?auto_650707 ) ) ( not ( = ?auto_650705 ?auto_650708 ) ) ( not ( = ?auto_650705 ?auto_650709 ) ) ( not ( = ?auto_650705 ?auto_650710 ) ) ( not ( = ?auto_650705 ?auto_650711 ) ) ( not ( = ?auto_650705 ?auto_650712 ) ) ( not ( = ?auto_650706 ?auto_650707 ) ) ( not ( = ?auto_650706 ?auto_650708 ) ) ( not ( = ?auto_650706 ?auto_650709 ) ) ( not ( = ?auto_650706 ?auto_650710 ) ) ( not ( = ?auto_650706 ?auto_650711 ) ) ( not ( = ?auto_650706 ?auto_650712 ) ) ( not ( = ?auto_650707 ?auto_650708 ) ) ( not ( = ?auto_650707 ?auto_650709 ) ) ( not ( = ?auto_650707 ?auto_650710 ) ) ( not ( = ?auto_650707 ?auto_650711 ) ) ( not ( = ?auto_650707 ?auto_650712 ) ) ( not ( = ?auto_650708 ?auto_650709 ) ) ( not ( = ?auto_650708 ?auto_650710 ) ) ( not ( = ?auto_650708 ?auto_650711 ) ) ( not ( = ?auto_650708 ?auto_650712 ) ) ( not ( = ?auto_650709 ?auto_650710 ) ) ( not ( = ?auto_650709 ?auto_650711 ) ) ( not ( = ?auto_650709 ?auto_650712 ) ) ( not ( = ?auto_650710 ?auto_650711 ) ) ( not ( = ?auto_650710 ?auto_650712 ) ) ( not ( = ?auto_650711 ?auto_650712 ) ) ( ON ?auto_650710 ?auto_650711 ) ( ON ?auto_650709 ?auto_650710 ) ( ON ?auto_650708 ?auto_650709 ) ( ON ?auto_650707 ?auto_650708 ) ( ON ?auto_650706 ?auto_650707 ) ( ON ?auto_650705 ?auto_650706 ) ( CLEAR ?auto_650705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_650705 )
      ( MAKE-7PILE ?auto_650705 ?auto_650706 ?auto_650707 ?auto_650708 ?auto_650709 ?auto_650710 ?auto_650711 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_650736 - BLOCK
      ?auto_650737 - BLOCK
      ?auto_650738 - BLOCK
      ?auto_650739 - BLOCK
      ?auto_650740 - BLOCK
      ?auto_650741 - BLOCK
      ?auto_650742 - BLOCK
      ?auto_650743 - BLOCK
    )
    :vars
    (
      ?auto_650744 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_650742 ) ( ON ?auto_650743 ?auto_650744 ) ( CLEAR ?auto_650743 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_650736 ) ( ON ?auto_650737 ?auto_650736 ) ( ON ?auto_650738 ?auto_650737 ) ( ON ?auto_650739 ?auto_650738 ) ( ON ?auto_650740 ?auto_650739 ) ( ON ?auto_650741 ?auto_650740 ) ( ON ?auto_650742 ?auto_650741 ) ( not ( = ?auto_650736 ?auto_650737 ) ) ( not ( = ?auto_650736 ?auto_650738 ) ) ( not ( = ?auto_650736 ?auto_650739 ) ) ( not ( = ?auto_650736 ?auto_650740 ) ) ( not ( = ?auto_650736 ?auto_650741 ) ) ( not ( = ?auto_650736 ?auto_650742 ) ) ( not ( = ?auto_650736 ?auto_650743 ) ) ( not ( = ?auto_650736 ?auto_650744 ) ) ( not ( = ?auto_650737 ?auto_650738 ) ) ( not ( = ?auto_650737 ?auto_650739 ) ) ( not ( = ?auto_650737 ?auto_650740 ) ) ( not ( = ?auto_650737 ?auto_650741 ) ) ( not ( = ?auto_650737 ?auto_650742 ) ) ( not ( = ?auto_650737 ?auto_650743 ) ) ( not ( = ?auto_650737 ?auto_650744 ) ) ( not ( = ?auto_650738 ?auto_650739 ) ) ( not ( = ?auto_650738 ?auto_650740 ) ) ( not ( = ?auto_650738 ?auto_650741 ) ) ( not ( = ?auto_650738 ?auto_650742 ) ) ( not ( = ?auto_650738 ?auto_650743 ) ) ( not ( = ?auto_650738 ?auto_650744 ) ) ( not ( = ?auto_650739 ?auto_650740 ) ) ( not ( = ?auto_650739 ?auto_650741 ) ) ( not ( = ?auto_650739 ?auto_650742 ) ) ( not ( = ?auto_650739 ?auto_650743 ) ) ( not ( = ?auto_650739 ?auto_650744 ) ) ( not ( = ?auto_650740 ?auto_650741 ) ) ( not ( = ?auto_650740 ?auto_650742 ) ) ( not ( = ?auto_650740 ?auto_650743 ) ) ( not ( = ?auto_650740 ?auto_650744 ) ) ( not ( = ?auto_650741 ?auto_650742 ) ) ( not ( = ?auto_650741 ?auto_650743 ) ) ( not ( = ?auto_650741 ?auto_650744 ) ) ( not ( = ?auto_650742 ?auto_650743 ) ) ( not ( = ?auto_650742 ?auto_650744 ) ) ( not ( = ?auto_650743 ?auto_650744 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_650743 ?auto_650744 )
      ( !STACK ?auto_650743 ?auto_650742 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_650770 - BLOCK
      ?auto_650771 - BLOCK
      ?auto_650772 - BLOCK
      ?auto_650773 - BLOCK
      ?auto_650774 - BLOCK
      ?auto_650775 - BLOCK
      ?auto_650776 - BLOCK
      ?auto_650777 - BLOCK
    )
    :vars
    (
      ?auto_650778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650777 ?auto_650778 ) ( ON-TABLE ?auto_650770 ) ( ON ?auto_650771 ?auto_650770 ) ( ON ?auto_650772 ?auto_650771 ) ( ON ?auto_650773 ?auto_650772 ) ( ON ?auto_650774 ?auto_650773 ) ( ON ?auto_650775 ?auto_650774 ) ( not ( = ?auto_650770 ?auto_650771 ) ) ( not ( = ?auto_650770 ?auto_650772 ) ) ( not ( = ?auto_650770 ?auto_650773 ) ) ( not ( = ?auto_650770 ?auto_650774 ) ) ( not ( = ?auto_650770 ?auto_650775 ) ) ( not ( = ?auto_650770 ?auto_650776 ) ) ( not ( = ?auto_650770 ?auto_650777 ) ) ( not ( = ?auto_650770 ?auto_650778 ) ) ( not ( = ?auto_650771 ?auto_650772 ) ) ( not ( = ?auto_650771 ?auto_650773 ) ) ( not ( = ?auto_650771 ?auto_650774 ) ) ( not ( = ?auto_650771 ?auto_650775 ) ) ( not ( = ?auto_650771 ?auto_650776 ) ) ( not ( = ?auto_650771 ?auto_650777 ) ) ( not ( = ?auto_650771 ?auto_650778 ) ) ( not ( = ?auto_650772 ?auto_650773 ) ) ( not ( = ?auto_650772 ?auto_650774 ) ) ( not ( = ?auto_650772 ?auto_650775 ) ) ( not ( = ?auto_650772 ?auto_650776 ) ) ( not ( = ?auto_650772 ?auto_650777 ) ) ( not ( = ?auto_650772 ?auto_650778 ) ) ( not ( = ?auto_650773 ?auto_650774 ) ) ( not ( = ?auto_650773 ?auto_650775 ) ) ( not ( = ?auto_650773 ?auto_650776 ) ) ( not ( = ?auto_650773 ?auto_650777 ) ) ( not ( = ?auto_650773 ?auto_650778 ) ) ( not ( = ?auto_650774 ?auto_650775 ) ) ( not ( = ?auto_650774 ?auto_650776 ) ) ( not ( = ?auto_650774 ?auto_650777 ) ) ( not ( = ?auto_650774 ?auto_650778 ) ) ( not ( = ?auto_650775 ?auto_650776 ) ) ( not ( = ?auto_650775 ?auto_650777 ) ) ( not ( = ?auto_650775 ?auto_650778 ) ) ( not ( = ?auto_650776 ?auto_650777 ) ) ( not ( = ?auto_650776 ?auto_650778 ) ) ( not ( = ?auto_650777 ?auto_650778 ) ) ( CLEAR ?auto_650775 ) ( ON ?auto_650776 ?auto_650777 ) ( CLEAR ?auto_650776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_650770 ?auto_650771 ?auto_650772 ?auto_650773 ?auto_650774 ?auto_650775 ?auto_650776 )
      ( MAKE-8PILE ?auto_650770 ?auto_650771 ?auto_650772 ?auto_650773 ?auto_650774 ?auto_650775 ?auto_650776 ?auto_650777 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_650804 - BLOCK
      ?auto_650805 - BLOCK
      ?auto_650806 - BLOCK
      ?auto_650807 - BLOCK
      ?auto_650808 - BLOCK
      ?auto_650809 - BLOCK
      ?auto_650810 - BLOCK
      ?auto_650811 - BLOCK
    )
    :vars
    (
      ?auto_650812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650811 ?auto_650812 ) ( ON-TABLE ?auto_650804 ) ( ON ?auto_650805 ?auto_650804 ) ( ON ?auto_650806 ?auto_650805 ) ( ON ?auto_650807 ?auto_650806 ) ( ON ?auto_650808 ?auto_650807 ) ( not ( = ?auto_650804 ?auto_650805 ) ) ( not ( = ?auto_650804 ?auto_650806 ) ) ( not ( = ?auto_650804 ?auto_650807 ) ) ( not ( = ?auto_650804 ?auto_650808 ) ) ( not ( = ?auto_650804 ?auto_650809 ) ) ( not ( = ?auto_650804 ?auto_650810 ) ) ( not ( = ?auto_650804 ?auto_650811 ) ) ( not ( = ?auto_650804 ?auto_650812 ) ) ( not ( = ?auto_650805 ?auto_650806 ) ) ( not ( = ?auto_650805 ?auto_650807 ) ) ( not ( = ?auto_650805 ?auto_650808 ) ) ( not ( = ?auto_650805 ?auto_650809 ) ) ( not ( = ?auto_650805 ?auto_650810 ) ) ( not ( = ?auto_650805 ?auto_650811 ) ) ( not ( = ?auto_650805 ?auto_650812 ) ) ( not ( = ?auto_650806 ?auto_650807 ) ) ( not ( = ?auto_650806 ?auto_650808 ) ) ( not ( = ?auto_650806 ?auto_650809 ) ) ( not ( = ?auto_650806 ?auto_650810 ) ) ( not ( = ?auto_650806 ?auto_650811 ) ) ( not ( = ?auto_650806 ?auto_650812 ) ) ( not ( = ?auto_650807 ?auto_650808 ) ) ( not ( = ?auto_650807 ?auto_650809 ) ) ( not ( = ?auto_650807 ?auto_650810 ) ) ( not ( = ?auto_650807 ?auto_650811 ) ) ( not ( = ?auto_650807 ?auto_650812 ) ) ( not ( = ?auto_650808 ?auto_650809 ) ) ( not ( = ?auto_650808 ?auto_650810 ) ) ( not ( = ?auto_650808 ?auto_650811 ) ) ( not ( = ?auto_650808 ?auto_650812 ) ) ( not ( = ?auto_650809 ?auto_650810 ) ) ( not ( = ?auto_650809 ?auto_650811 ) ) ( not ( = ?auto_650809 ?auto_650812 ) ) ( not ( = ?auto_650810 ?auto_650811 ) ) ( not ( = ?auto_650810 ?auto_650812 ) ) ( not ( = ?auto_650811 ?auto_650812 ) ) ( ON ?auto_650810 ?auto_650811 ) ( CLEAR ?auto_650808 ) ( ON ?auto_650809 ?auto_650810 ) ( CLEAR ?auto_650809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_650804 ?auto_650805 ?auto_650806 ?auto_650807 ?auto_650808 ?auto_650809 )
      ( MAKE-8PILE ?auto_650804 ?auto_650805 ?auto_650806 ?auto_650807 ?auto_650808 ?auto_650809 ?auto_650810 ?auto_650811 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_650838 - BLOCK
      ?auto_650839 - BLOCK
      ?auto_650840 - BLOCK
      ?auto_650841 - BLOCK
      ?auto_650842 - BLOCK
      ?auto_650843 - BLOCK
      ?auto_650844 - BLOCK
      ?auto_650845 - BLOCK
    )
    :vars
    (
      ?auto_650846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650845 ?auto_650846 ) ( ON-TABLE ?auto_650838 ) ( ON ?auto_650839 ?auto_650838 ) ( ON ?auto_650840 ?auto_650839 ) ( ON ?auto_650841 ?auto_650840 ) ( not ( = ?auto_650838 ?auto_650839 ) ) ( not ( = ?auto_650838 ?auto_650840 ) ) ( not ( = ?auto_650838 ?auto_650841 ) ) ( not ( = ?auto_650838 ?auto_650842 ) ) ( not ( = ?auto_650838 ?auto_650843 ) ) ( not ( = ?auto_650838 ?auto_650844 ) ) ( not ( = ?auto_650838 ?auto_650845 ) ) ( not ( = ?auto_650838 ?auto_650846 ) ) ( not ( = ?auto_650839 ?auto_650840 ) ) ( not ( = ?auto_650839 ?auto_650841 ) ) ( not ( = ?auto_650839 ?auto_650842 ) ) ( not ( = ?auto_650839 ?auto_650843 ) ) ( not ( = ?auto_650839 ?auto_650844 ) ) ( not ( = ?auto_650839 ?auto_650845 ) ) ( not ( = ?auto_650839 ?auto_650846 ) ) ( not ( = ?auto_650840 ?auto_650841 ) ) ( not ( = ?auto_650840 ?auto_650842 ) ) ( not ( = ?auto_650840 ?auto_650843 ) ) ( not ( = ?auto_650840 ?auto_650844 ) ) ( not ( = ?auto_650840 ?auto_650845 ) ) ( not ( = ?auto_650840 ?auto_650846 ) ) ( not ( = ?auto_650841 ?auto_650842 ) ) ( not ( = ?auto_650841 ?auto_650843 ) ) ( not ( = ?auto_650841 ?auto_650844 ) ) ( not ( = ?auto_650841 ?auto_650845 ) ) ( not ( = ?auto_650841 ?auto_650846 ) ) ( not ( = ?auto_650842 ?auto_650843 ) ) ( not ( = ?auto_650842 ?auto_650844 ) ) ( not ( = ?auto_650842 ?auto_650845 ) ) ( not ( = ?auto_650842 ?auto_650846 ) ) ( not ( = ?auto_650843 ?auto_650844 ) ) ( not ( = ?auto_650843 ?auto_650845 ) ) ( not ( = ?auto_650843 ?auto_650846 ) ) ( not ( = ?auto_650844 ?auto_650845 ) ) ( not ( = ?auto_650844 ?auto_650846 ) ) ( not ( = ?auto_650845 ?auto_650846 ) ) ( ON ?auto_650844 ?auto_650845 ) ( ON ?auto_650843 ?auto_650844 ) ( CLEAR ?auto_650841 ) ( ON ?auto_650842 ?auto_650843 ) ( CLEAR ?auto_650842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_650838 ?auto_650839 ?auto_650840 ?auto_650841 ?auto_650842 )
      ( MAKE-8PILE ?auto_650838 ?auto_650839 ?auto_650840 ?auto_650841 ?auto_650842 ?auto_650843 ?auto_650844 ?auto_650845 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_650872 - BLOCK
      ?auto_650873 - BLOCK
      ?auto_650874 - BLOCK
      ?auto_650875 - BLOCK
      ?auto_650876 - BLOCK
      ?auto_650877 - BLOCK
      ?auto_650878 - BLOCK
      ?auto_650879 - BLOCK
    )
    :vars
    (
      ?auto_650880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650879 ?auto_650880 ) ( ON-TABLE ?auto_650872 ) ( ON ?auto_650873 ?auto_650872 ) ( ON ?auto_650874 ?auto_650873 ) ( not ( = ?auto_650872 ?auto_650873 ) ) ( not ( = ?auto_650872 ?auto_650874 ) ) ( not ( = ?auto_650872 ?auto_650875 ) ) ( not ( = ?auto_650872 ?auto_650876 ) ) ( not ( = ?auto_650872 ?auto_650877 ) ) ( not ( = ?auto_650872 ?auto_650878 ) ) ( not ( = ?auto_650872 ?auto_650879 ) ) ( not ( = ?auto_650872 ?auto_650880 ) ) ( not ( = ?auto_650873 ?auto_650874 ) ) ( not ( = ?auto_650873 ?auto_650875 ) ) ( not ( = ?auto_650873 ?auto_650876 ) ) ( not ( = ?auto_650873 ?auto_650877 ) ) ( not ( = ?auto_650873 ?auto_650878 ) ) ( not ( = ?auto_650873 ?auto_650879 ) ) ( not ( = ?auto_650873 ?auto_650880 ) ) ( not ( = ?auto_650874 ?auto_650875 ) ) ( not ( = ?auto_650874 ?auto_650876 ) ) ( not ( = ?auto_650874 ?auto_650877 ) ) ( not ( = ?auto_650874 ?auto_650878 ) ) ( not ( = ?auto_650874 ?auto_650879 ) ) ( not ( = ?auto_650874 ?auto_650880 ) ) ( not ( = ?auto_650875 ?auto_650876 ) ) ( not ( = ?auto_650875 ?auto_650877 ) ) ( not ( = ?auto_650875 ?auto_650878 ) ) ( not ( = ?auto_650875 ?auto_650879 ) ) ( not ( = ?auto_650875 ?auto_650880 ) ) ( not ( = ?auto_650876 ?auto_650877 ) ) ( not ( = ?auto_650876 ?auto_650878 ) ) ( not ( = ?auto_650876 ?auto_650879 ) ) ( not ( = ?auto_650876 ?auto_650880 ) ) ( not ( = ?auto_650877 ?auto_650878 ) ) ( not ( = ?auto_650877 ?auto_650879 ) ) ( not ( = ?auto_650877 ?auto_650880 ) ) ( not ( = ?auto_650878 ?auto_650879 ) ) ( not ( = ?auto_650878 ?auto_650880 ) ) ( not ( = ?auto_650879 ?auto_650880 ) ) ( ON ?auto_650878 ?auto_650879 ) ( ON ?auto_650877 ?auto_650878 ) ( ON ?auto_650876 ?auto_650877 ) ( CLEAR ?auto_650874 ) ( ON ?auto_650875 ?auto_650876 ) ( CLEAR ?auto_650875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_650872 ?auto_650873 ?auto_650874 ?auto_650875 )
      ( MAKE-8PILE ?auto_650872 ?auto_650873 ?auto_650874 ?auto_650875 ?auto_650876 ?auto_650877 ?auto_650878 ?auto_650879 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_650906 - BLOCK
      ?auto_650907 - BLOCK
      ?auto_650908 - BLOCK
      ?auto_650909 - BLOCK
      ?auto_650910 - BLOCK
      ?auto_650911 - BLOCK
      ?auto_650912 - BLOCK
      ?auto_650913 - BLOCK
    )
    :vars
    (
      ?auto_650914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650913 ?auto_650914 ) ( ON-TABLE ?auto_650906 ) ( ON ?auto_650907 ?auto_650906 ) ( not ( = ?auto_650906 ?auto_650907 ) ) ( not ( = ?auto_650906 ?auto_650908 ) ) ( not ( = ?auto_650906 ?auto_650909 ) ) ( not ( = ?auto_650906 ?auto_650910 ) ) ( not ( = ?auto_650906 ?auto_650911 ) ) ( not ( = ?auto_650906 ?auto_650912 ) ) ( not ( = ?auto_650906 ?auto_650913 ) ) ( not ( = ?auto_650906 ?auto_650914 ) ) ( not ( = ?auto_650907 ?auto_650908 ) ) ( not ( = ?auto_650907 ?auto_650909 ) ) ( not ( = ?auto_650907 ?auto_650910 ) ) ( not ( = ?auto_650907 ?auto_650911 ) ) ( not ( = ?auto_650907 ?auto_650912 ) ) ( not ( = ?auto_650907 ?auto_650913 ) ) ( not ( = ?auto_650907 ?auto_650914 ) ) ( not ( = ?auto_650908 ?auto_650909 ) ) ( not ( = ?auto_650908 ?auto_650910 ) ) ( not ( = ?auto_650908 ?auto_650911 ) ) ( not ( = ?auto_650908 ?auto_650912 ) ) ( not ( = ?auto_650908 ?auto_650913 ) ) ( not ( = ?auto_650908 ?auto_650914 ) ) ( not ( = ?auto_650909 ?auto_650910 ) ) ( not ( = ?auto_650909 ?auto_650911 ) ) ( not ( = ?auto_650909 ?auto_650912 ) ) ( not ( = ?auto_650909 ?auto_650913 ) ) ( not ( = ?auto_650909 ?auto_650914 ) ) ( not ( = ?auto_650910 ?auto_650911 ) ) ( not ( = ?auto_650910 ?auto_650912 ) ) ( not ( = ?auto_650910 ?auto_650913 ) ) ( not ( = ?auto_650910 ?auto_650914 ) ) ( not ( = ?auto_650911 ?auto_650912 ) ) ( not ( = ?auto_650911 ?auto_650913 ) ) ( not ( = ?auto_650911 ?auto_650914 ) ) ( not ( = ?auto_650912 ?auto_650913 ) ) ( not ( = ?auto_650912 ?auto_650914 ) ) ( not ( = ?auto_650913 ?auto_650914 ) ) ( ON ?auto_650912 ?auto_650913 ) ( ON ?auto_650911 ?auto_650912 ) ( ON ?auto_650910 ?auto_650911 ) ( ON ?auto_650909 ?auto_650910 ) ( CLEAR ?auto_650907 ) ( ON ?auto_650908 ?auto_650909 ) ( CLEAR ?auto_650908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_650906 ?auto_650907 ?auto_650908 )
      ( MAKE-8PILE ?auto_650906 ?auto_650907 ?auto_650908 ?auto_650909 ?auto_650910 ?auto_650911 ?auto_650912 ?auto_650913 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_650940 - BLOCK
      ?auto_650941 - BLOCK
      ?auto_650942 - BLOCK
      ?auto_650943 - BLOCK
      ?auto_650944 - BLOCK
      ?auto_650945 - BLOCK
      ?auto_650946 - BLOCK
      ?auto_650947 - BLOCK
    )
    :vars
    (
      ?auto_650948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650947 ?auto_650948 ) ( ON-TABLE ?auto_650940 ) ( not ( = ?auto_650940 ?auto_650941 ) ) ( not ( = ?auto_650940 ?auto_650942 ) ) ( not ( = ?auto_650940 ?auto_650943 ) ) ( not ( = ?auto_650940 ?auto_650944 ) ) ( not ( = ?auto_650940 ?auto_650945 ) ) ( not ( = ?auto_650940 ?auto_650946 ) ) ( not ( = ?auto_650940 ?auto_650947 ) ) ( not ( = ?auto_650940 ?auto_650948 ) ) ( not ( = ?auto_650941 ?auto_650942 ) ) ( not ( = ?auto_650941 ?auto_650943 ) ) ( not ( = ?auto_650941 ?auto_650944 ) ) ( not ( = ?auto_650941 ?auto_650945 ) ) ( not ( = ?auto_650941 ?auto_650946 ) ) ( not ( = ?auto_650941 ?auto_650947 ) ) ( not ( = ?auto_650941 ?auto_650948 ) ) ( not ( = ?auto_650942 ?auto_650943 ) ) ( not ( = ?auto_650942 ?auto_650944 ) ) ( not ( = ?auto_650942 ?auto_650945 ) ) ( not ( = ?auto_650942 ?auto_650946 ) ) ( not ( = ?auto_650942 ?auto_650947 ) ) ( not ( = ?auto_650942 ?auto_650948 ) ) ( not ( = ?auto_650943 ?auto_650944 ) ) ( not ( = ?auto_650943 ?auto_650945 ) ) ( not ( = ?auto_650943 ?auto_650946 ) ) ( not ( = ?auto_650943 ?auto_650947 ) ) ( not ( = ?auto_650943 ?auto_650948 ) ) ( not ( = ?auto_650944 ?auto_650945 ) ) ( not ( = ?auto_650944 ?auto_650946 ) ) ( not ( = ?auto_650944 ?auto_650947 ) ) ( not ( = ?auto_650944 ?auto_650948 ) ) ( not ( = ?auto_650945 ?auto_650946 ) ) ( not ( = ?auto_650945 ?auto_650947 ) ) ( not ( = ?auto_650945 ?auto_650948 ) ) ( not ( = ?auto_650946 ?auto_650947 ) ) ( not ( = ?auto_650946 ?auto_650948 ) ) ( not ( = ?auto_650947 ?auto_650948 ) ) ( ON ?auto_650946 ?auto_650947 ) ( ON ?auto_650945 ?auto_650946 ) ( ON ?auto_650944 ?auto_650945 ) ( ON ?auto_650943 ?auto_650944 ) ( ON ?auto_650942 ?auto_650943 ) ( CLEAR ?auto_650940 ) ( ON ?auto_650941 ?auto_650942 ) ( CLEAR ?auto_650941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_650940 ?auto_650941 )
      ( MAKE-8PILE ?auto_650940 ?auto_650941 ?auto_650942 ?auto_650943 ?auto_650944 ?auto_650945 ?auto_650946 ?auto_650947 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_650974 - BLOCK
      ?auto_650975 - BLOCK
      ?auto_650976 - BLOCK
      ?auto_650977 - BLOCK
      ?auto_650978 - BLOCK
      ?auto_650979 - BLOCK
      ?auto_650980 - BLOCK
      ?auto_650981 - BLOCK
    )
    :vars
    (
      ?auto_650982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650981 ?auto_650982 ) ( not ( = ?auto_650974 ?auto_650975 ) ) ( not ( = ?auto_650974 ?auto_650976 ) ) ( not ( = ?auto_650974 ?auto_650977 ) ) ( not ( = ?auto_650974 ?auto_650978 ) ) ( not ( = ?auto_650974 ?auto_650979 ) ) ( not ( = ?auto_650974 ?auto_650980 ) ) ( not ( = ?auto_650974 ?auto_650981 ) ) ( not ( = ?auto_650974 ?auto_650982 ) ) ( not ( = ?auto_650975 ?auto_650976 ) ) ( not ( = ?auto_650975 ?auto_650977 ) ) ( not ( = ?auto_650975 ?auto_650978 ) ) ( not ( = ?auto_650975 ?auto_650979 ) ) ( not ( = ?auto_650975 ?auto_650980 ) ) ( not ( = ?auto_650975 ?auto_650981 ) ) ( not ( = ?auto_650975 ?auto_650982 ) ) ( not ( = ?auto_650976 ?auto_650977 ) ) ( not ( = ?auto_650976 ?auto_650978 ) ) ( not ( = ?auto_650976 ?auto_650979 ) ) ( not ( = ?auto_650976 ?auto_650980 ) ) ( not ( = ?auto_650976 ?auto_650981 ) ) ( not ( = ?auto_650976 ?auto_650982 ) ) ( not ( = ?auto_650977 ?auto_650978 ) ) ( not ( = ?auto_650977 ?auto_650979 ) ) ( not ( = ?auto_650977 ?auto_650980 ) ) ( not ( = ?auto_650977 ?auto_650981 ) ) ( not ( = ?auto_650977 ?auto_650982 ) ) ( not ( = ?auto_650978 ?auto_650979 ) ) ( not ( = ?auto_650978 ?auto_650980 ) ) ( not ( = ?auto_650978 ?auto_650981 ) ) ( not ( = ?auto_650978 ?auto_650982 ) ) ( not ( = ?auto_650979 ?auto_650980 ) ) ( not ( = ?auto_650979 ?auto_650981 ) ) ( not ( = ?auto_650979 ?auto_650982 ) ) ( not ( = ?auto_650980 ?auto_650981 ) ) ( not ( = ?auto_650980 ?auto_650982 ) ) ( not ( = ?auto_650981 ?auto_650982 ) ) ( ON ?auto_650980 ?auto_650981 ) ( ON ?auto_650979 ?auto_650980 ) ( ON ?auto_650978 ?auto_650979 ) ( ON ?auto_650977 ?auto_650978 ) ( ON ?auto_650976 ?auto_650977 ) ( ON ?auto_650975 ?auto_650976 ) ( ON ?auto_650974 ?auto_650975 ) ( CLEAR ?auto_650974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_650974 )
      ( MAKE-8PILE ?auto_650974 ?auto_650975 ?auto_650976 ?auto_650977 ?auto_650978 ?auto_650979 ?auto_650980 ?auto_650981 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_651009 - BLOCK
      ?auto_651010 - BLOCK
      ?auto_651011 - BLOCK
      ?auto_651012 - BLOCK
      ?auto_651013 - BLOCK
      ?auto_651014 - BLOCK
      ?auto_651015 - BLOCK
      ?auto_651016 - BLOCK
      ?auto_651017 - BLOCK
    )
    :vars
    (
      ?auto_651018 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_651016 ) ( ON ?auto_651017 ?auto_651018 ) ( CLEAR ?auto_651017 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_651009 ) ( ON ?auto_651010 ?auto_651009 ) ( ON ?auto_651011 ?auto_651010 ) ( ON ?auto_651012 ?auto_651011 ) ( ON ?auto_651013 ?auto_651012 ) ( ON ?auto_651014 ?auto_651013 ) ( ON ?auto_651015 ?auto_651014 ) ( ON ?auto_651016 ?auto_651015 ) ( not ( = ?auto_651009 ?auto_651010 ) ) ( not ( = ?auto_651009 ?auto_651011 ) ) ( not ( = ?auto_651009 ?auto_651012 ) ) ( not ( = ?auto_651009 ?auto_651013 ) ) ( not ( = ?auto_651009 ?auto_651014 ) ) ( not ( = ?auto_651009 ?auto_651015 ) ) ( not ( = ?auto_651009 ?auto_651016 ) ) ( not ( = ?auto_651009 ?auto_651017 ) ) ( not ( = ?auto_651009 ?auto_651018 ) ) ( not ( = ?auto_651010 ?auto_651011 ) ) ( not ( = ?auto_651010 ?auto_651012 ) ) ( not ( = ?auto_651010 ?auto_651013 ) ) ( not ( = ?auto_651010 ?auto_651014 ) ) ( not ( = ?auto_651010 ?auto_651015 ) ) ( not ( = ?auto_651010 ?auto_651016 ) ) ( not ( = ?auto_651010 ?auto_651017 ) ) ( not ( = ?auto_651010 ?auto_651018 ) ) ( not ( = ?auto_651011 ?auto_651012 ) ) ( not ( = ?auto_651011 ?auto_651013 ) ) ( not ( = ?auto_651011 ?auto_651014 ) ) ( not ( = ?auto_651011 ?auto_651015 ) ) ( not ( = ?auto_651011 ?auto_651016 ) ) ( not ( = ?auto_651011 ?auto_651017 ) ) ( not ( = ?auto_651011 ?auto_651018 ) ) ( not ( = ?auto_651012 ?auto_651013 ) ) ( not ( = ?auto_651012 ?auto_651014 ) ) ( not ( = ?auto_651012 ?auto_651015 ) ) ( not ( = ?auto_651012 ?auto_651016 ) ) ( not ( = ?auto_651012 ?auto_651017 ) ) ( not ( = ?auto_651012 ?auto_651018 ) ) ( not ( = ?auto_651013 ?auto_651014 ) ) ( not ( = ?auto_651013 ?auto_651015 ) ) ( not ( = ?auto_651013 ?auto_651016 ) ) ( not ( = ?auto_651013 ?auto_651017 ) ) ( not ( = ?auto_651013 ?auto_651018 ) ) ( not ( = ?auto_651014 ?auto_651015 ) ) ( not ( = ?auto_651014 ?auto_651016 ) ) ( not ( = ?auto_651014 ?auto_651017 ) ) ( not ( = ?auto_651014 ?auto_651018 ) ) ( not ( = ?auto_651015 ?auto_651016 ) ) ( not ( = ?auto_651015 ?auto_651017 ) ) ( not ( = ?auto_651015 ?auto_651018 ) ) ( not ( = ?auto_651016 ?auto_651017 ) ) ( not ( = ?auto_651016 ?auto_651018 ) ) ( not ( = ?auto_651017 ?auto_651018 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_651017 ?auto_651018 )
      ( !STACK ?auto_651017 ?auto_651016 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_651047 - BLOCK
      ?auto_651048 - BLOCK
      ?auto_651049 - BLOCK
      ?auto_651050 - BLOCK
      ?auto_651051 - BLOCK
      ?auto_651052 - BLOCK
      ?auto_651053 - BLOCK
      ?auto_651054 - BLOCK
      ?auto_651055 - BLOCK
    )
    :vars
    (
      ?auto_651056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_651055 ?auto_651056 ) ( ON-TABLE ?auto_651047 ) ( ON ?auto_651048 ?auto_651047 ) ( ON ?auto_651049 ?auto_651048 ) ( ON ?auto_651050 ?auto_651049 ) ( ON ?auto_651051 ?auto_651050 ) ( ON ?auto_651052 ?auto_651051 ) ( ON ?auto_651053 ?auto_651052 ) ( not ( = ?auto_651047 ?auto_651048 ) ) ( not ( = ?auto_651047 ?auto_651049 ) ) ( not ( = ?auto_651047 ?auto_651050 ) ) ( not ( = ?auto_651047 ?auto_651051 ) ) ( not ( = ?auto_651047 ?auto_651052 ) ) ( not ( = ?auto_651047 ?auto_651053 ) ) ( not ( = ?auto_651047 ?auto_651054 ) ) ( not ( = ?auto_651047 ?auto_651055 ) ) ( not ( = ?auto_651047 ?auto_651056 ) ) ( not ( = ?auto_651048 ?auto_651049 ) ) ( not ( = ?auto_651048 ?auto_651050 ) ) ( not ( = ?auto_651048 ?auto_651051 ) ) ( not ( = ?auto_651048 ?auto_651052 ) ) ( not ( = ?auto_651048 ?auto_651053 ) ) ( not ( = ?auto_651048 ?auto_651054 ) ) ( not ( = ?auto_651048 ?auto_651055 ) ) ( not ( = ?auto_651048 ?auto_651056 ) ) ( not ( = ?auto_651049 ?auto_651050 ) ) ( not ( = ?auto_651049 ?auto_651051 ) ) ( not ( = ?auto_651049 ?auto_651052 ) ) ( not ( = ?auto_651049 ?auto_651053 ) ) ( not ( = ?auto_651049 ?auto_651054 ) ) ( not ( = ?auto_651049 ?auto_651055 ) ) ( not ( = ?auto_651049 ?auto_651056 ) ) ( not ( = ?auto_651050 ?auto_651051 ) ) ( not ( = ?auto_651050 ?auto_651052 ) ) ( not ( = ?auto_651050 ?auto_651053 ) ) ( not ( = ?auto_651050 ?auto_651054 ) ) ( not ( = ?auto_651050 ?auto_651055 ) ) ( not ( = ?auto_651050 ?auto_651056 ) ) ( not ( = ?auto_651051 ?auto_651052 ) ) ( not ( = ?auto_651051 ?auto_651053 ) ) ( not ( = ?auto_651051 ?auto_651054 ) ) ( not ( = ?auto_651051 ?auto_651055 ) ) ( not ( = ?auto_651051 ?auto_651056 ) ) ( not ( = ?auto_651052 ?auto_651053 ) ) ( not ( = ?auto_651052 ?auto_651054 ) ) ( not ( = ?auto_651052 ?auto_651055 ) ) ( not ( = ?auto_651052 ?auto_651056 ) ) ( not ( = ?auto_651053 ?auto_651054 ) ) ( not ( = ?auto_651053 ?auto_651055 ) ) ( not ( = ?auto_651053 ?auto_651056 ) ) ( not ( = ?auto_651054 ?auto_651055 ) ) ( not ( = ?auto_651054 ?auto_651056 ) ) ( not ( = ?auto_651055 ?auto_651056 ) ) ( CLEAR ?auto_651053 ) ( ON ?auto_651054 ?auto_651055 ) ( CLEAR ?auto_651054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_651047 ?auto_651048 ?auto_651049 ?auto_651050 ?auto_651051 ?auto_651052 ?auto_651053 ?auto_651054 )
      ( MAKE-9PILE ?auto_651047 ?auto_651048 ?auto_651049 ?auto_651050 ?auto_651051 ?auto_651052 ?auto_651053 ?auto_651054 ?auto_651055 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_651085 - BLOCK
      ?auto_651086 - BLOCK
      ?auto_651087 - BLOCK
      ?auto_651088 - BLOCK
      ?auto_651089 - BLOCK
      ?auto_651090 - BLOCK
      ?auto_651091 - BLOCK
      ?auto_651092 - BLOCK
      ?auto_651093 - BLOCK
    )
    :vars
    (
      ?auto_651094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_651093 ?auto_651094 ) ( ON-TABLE ?auto_651085 ) ( ON ?auto_651086 ?auto_651085 ) ( ON ?auto_651087 ?auto_651086 ) ( ON ?auto_651088 ?auto_651087 ) ( ON ?auto_651089 ?auto_651088 ) ( ON ?auto_651090 ?auto_651089 ) ( not ( = ?auto_651085 ?auto_651086 ) ) ( not ( = ?auto_651085 ?auto_651087 ) ) ( not ( = ?auto_651085 ?auto_651088 ) ) ( not ( = ?auto_651085 ?auto_651089 ) ) ( not ( = ?auto_651085 ?auto_651090 ) ) ( not ( = ?auto_651085 ?auto_651091 ) ) ( not ( = ?auto_651085 ?auto_651092 ) ) ( not ( = ?auto_651085 ?auto_651093 ) ) ( not ( = ?auto_651085 ?auto_651094 ) ) ( not ( = ?auto_651086 ?auto_651087 ) ) ( not ( = ?auto_651086 ?auto_651088 ) ) ( not ( = ?auto_651086 ?auto_651089 ) ) ( not ( = ?auto_651086 ?auto_651090 ) ) ( not ( = ?auto_651086 ?auto_651091 ) ) ( not ( = ?auto_651086 ?auto_651092 ) ) ( not ( = ?auto_651086 ?auto_651093 ) ) ( not ( = ?auto_651086 ?auto_651094 ) ) ( not ( = ?auto_651087 ?auto_651088 ) ) ( not ( = ?auto_651087 ?auto_651089 ) ) ( not ( = ?auto_651087 ?auto_651090 ) ) ( not ( = ?auto_651087 ?auto_651091 ) ) ( not ( = ?auto_651087 ?auto_651092 ) ) ( not ( = ?auto_651087 ?auto_651093 ) ) ( not ( = ?auto_651087 ?auto_651094 ) ) ( not ( = ?auto_651088 ?auto_651089 ) ) ( not ( = ?auto_651088 ?auto_651090 ) ) ( not ( = ?auto_651088 ?auto_651091 ) ) ( not ( = ?auto_651088 ?auto_651092 ) ) ( not ( = ?auto_651088 ?auto_651093 ) ) ( not ( = ?auto_651088 ?auto_651094 ) ) ( not ( = ?auto_651089 ?auto_651090 ) ) ( not ( = ?auto_651089 ?auto_651091 ) ) ( not ( = ?auto_651089 ?auto_651092 ) ) ( not ( = ?auto_651089 ?auto_651093 ) ) ( not ( = ?auto_651089 ?auto_651094 ) ) ( not ( = ?auto_651090 ?auto_651091 ) ) ( not ( = ?auto_651090 ?auto_651092 ) ) ( not ( = ?auto_651090 ?auto_651093 ) ) ( not ( = ?auto_651090 ?auto_651094 ) ) ( not ( = ?auto_651091 ?auto_651092 ) ) ( not ( = ?auto_651091 ?auto_651093 ) ) ( not ( = ?auto_651091 ?auto_651094 ) ) ( not ( = ?auto_651092 ?auto_651093 ) ) ( not ( = ?auto_651092 ?auto_651094 ) ) ( not ( = ?auto_651093 ?auto_651094 ) ) ( ON ?auto_651092 ?auto_651093 ) ( CLEAR ?auto_651090 ) ( ON ?auto_651091 ?auto_651092 ) ( CLEAR ?auto_651091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_651085 ?auto_651086 ?auto_651087 ?auto_651088 ?auto_651089 ?auto_651090 ?auto_651091 )
      ( MAKE-9PILE ?auto_651085 ?auto_651086 ?auto_651087 ?auto_651088 ?auto_651089 ?auto_651090 ?auto_651091 ?auto_651092 ?auto_651093 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_651123 - BLOCK
      ?auto_651124 - BLOCK
      ?auto_651125 - BLOCK
      ?auto_651126 - BLOCK
      ?auto_651127 - BLOCK
      ?auto_651128 - BLOCK
      ?auto_651129 - BLOCK
      ?auto_651130 - BLOCK
      ?auto_651131 - BLOCK
    )
    :vars
    (
      ?auto_651132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_651131 ?auto_651132 ) ( ON-TABLE ?auto_651123 ) ( ON ?auto_651124 ?auto_651123 ) ( ON ?auto_651125 ?auto_651124 ) ( ON ?auto_651126 ?auto_651125 ) ( ON ?auto_651127 ?auto_651126 ) ( not ( = ?auto_651123 ?auto_651124 ) ) ( not ( = ?auto_651123 ?auto_651125 ) ) ( not ( = ?auto_651123 ?auto_651126 ) ) ( not ( = ?auto_651123 ?auto_651127 ) ) ( not ( = ?auto_651123 ?auto_651128 ) ) ( not ( = ?auto_651123 ?auto_651129 ) ) ( not ( = ?auto_651123 ?auto_651130 ) ) ( not ( = ?auto_651123 ?auto_651131 ) ) ( not ( = ?auto_651123 ?auto_651132 ) ) ( not ( = ?auto_651124 ?auto_651125 ) ) ( not ( = ?auto_651124 ?auto_651126 ) ) ( not ( = ?auto_651124 ?auto_651127 ) ) ( not ( = ?auto_651124 ?auto_651128 ) ) ( not ( = ?auto_651124 ?auto_651129 ) ) ( not ( = ?auto_651124 ?auto_651130 ) ) ( not ( = ?auto_651124 ?auto_651131 ) ) ( not ( = ?auto_651124 ?auto_651132 ) ) ( not ( = ?auto_651125 ?auto_651126 ) ) ( not ( = ?auto_651125 ?auto_651127 ) ) ( not ( = ?auto_651125 ?auto_651128 ) ) ( not ( = ?auto_651125 ?auto_651129 ) ) ( not ( = ?auto_651125 ?auto_651130 ) ) ( not ( = ?auto_651125 ?auto_651131 ) ) ( not ( = ?auto_651125 ?auto_651132 ) ) ( not ( = ?auto_651126 ?auto_651127 ) ) ( not ( = ?auto_651126 ?auto_651128 ) ) ( not ( = ?auto_651126 ?auto_651129 ) ) ( not ( = ?auto_651126 ?auto_651130 ) ) ( not ( = ?auto_651126 ?auto_651131 ) ) ( not ( = ?auto_651126 ?auto_651132 ) ) ( not ( = ?auto_651127 ?auto_651128 ) ) ( not ( = ?auto_651127 ?auto_651129 ) ) ( not ( = ?auto_651127 ?auto_651130 ) ) ( not ( = ?auto_651127 ?auto_651131 ) ) ( not ( = ?auto_651127 ?auto_651132 ) ) ( not ( = ?auto_651128 ?auto_651129 ) ) ( not ( = ?auto_651128 ?auto_651130 ) ) ( not ( = ?auto_651128 ?auto_651131 ) ) ( not ( = ?auto_651128 ?auto_651132 ) ) ( not ( = ?auto_651129 ?auto_651130 ) ) ( not ( = ?auto_651129 ?auto_651131 ) ) ( not ( = ?auto_651129 ?auto_651132 ) ) ( not ( = ?auto_651130 ?auto_651131 ) ) ( not ( = ?auto_651130 ?auto_651132 ) ) ( not ( = ?auto_651131 ?auto_651132 ) ) ( ON ?auto_651130 ?auto_651131 ) ( ON ?auto_651129 ?auto_651130 ) ( CLEAR ?auto_651127 ) ( ON ?auto_651128 ?auto_651129 ) ( CLEAR ?auto_651128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_651123 ?auto_651124 ?auto_651125 ?auto_651126 ?auto_651127 ?auto_651128 )
      ( MAKE-9PILE ?auto_651123 ?auto_651124 ?auto_651125 ?auto_651126 ?auto_651127 ?auto_651128 ?auto_651129 ?auto_651130 ?auto_651131 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_651161 - BLOCK
      ?auto_651162 - BLOCK
      ?auto_651163 - BLOCK
      ?auto_651164 - BLOCK
      ?auto_651165 - BLOCK
      ?auto_651166 - BLOCK
      ?auto_651167 - BLOCK
      ?auto_651168 - BLOCK
      ?auto_651169 - BLOCK
    )
    :vars
    (
      ?auto_651170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_651169 ?auto_651170 ) ( ON-TABLE ?auto_651161 ) ( ON ?auto_651162 ?auto_651161 ) ( ON ?auto_651163 ?auto_651162 ) ( ON ?auto_651164 ?auto_651163 ) ( not ( = ?auto_651161 ?auto_651162 ) ) ( not ( = ?auto_651161 ?auto_651163 ) ) ( not ( = ?auto_651161 ?auto_651164 ) ) ( not ( = ?auto_651161 ?auto_651165 ) ) ( not ( = ?auto_651161 ?auto_651166 ) ) ( not ( = ?auto_651161 ?auto_651167 ) ) ( not ( = ?auto_651161 ?auto_651168 ) ) ( not ( = ?auto_651161 ?auto_651169 ) ) ( not ( = ?auto_651161 ?auto_651170 ) ) ( not ( = ?auto_651162 ?auto_651163 ) ) ( not ( = ?auto_651162 ?auto_651164 ) ) ( not ( = ?auto_651162 ?auto_651165 ) ) ( not ( = ?auto_651162 ?auto_651166 ) ) ( not ( = ?auto_651162 ?auto_651167 ) ) ( not ( = ?auto_651162 ?auto_651168 ) ) ( not ( = ?auto_651162 ?auto_651169 ) ) ( not ( = ?auto_651162 ?auto_651170 ) ) ( not ( = ?auto_651163 ?auto_651164 ) ) ( not ( = ?auto_651163 ?auto_651165 ) ) ( not ( = ?auto_651163 ?auto_651166 ) ) ( not ( = ?auto_651163 ?auto_651167 ) ) ( not ( = ?auto_651163 ?auto_651168 ) ) ( not ( = ?auto_651163 ?auto_651169 ) ) ( not ( = ?auto_651163 ?auto_651170 ) ) ( not ( = ?auto_651164 ?auto_651165 ) ) ( not ( = ?auto_651164 ?auto_651166 ) ) ( not ( = ?auto_651164 ?auto_651167 ) ) ( not ( = ?auto_651164 ?auto_651168 ) ) ( not ( = ?auto_651164 ?auto_651169 ) ) ( not ( = ?auto_651164 ?auto_651170 ) ) ( not ( = ?auto_651165 ?auto_651166 ) ) ( not ( = ?auto_651165 ?auto_651167 ) ) ( not ( = ?auto_651165 ?auto_651168 ) ) ( not ( = ?auto_651165 ?auto_651169 ) ) ( not ( = ?auto_651165 ?auto_651170 ) ) ( not ( = ?auto_651166 ?auto_651167 ) ) ( not ( = ?auto_651166 ?auto_651168 ) ) ( not ( = ?auto_651166 ?auto_651169 ) ) ( not ( = ?auto_651166 ?auto_651170 ) ) ( not ( = ?auto_651167 ?auto_651168 ) ) ( not ( = ?auto_651167 ?auto_651169 ) ) ( not ( = ?auto_651167 ?auto_651170 ) ) ( not ( = ?auto_651168 ?auto_651169 ) ) ( not ( = ?auto_651168 ?auto_651170 ) ) ( not ( = ?auto_651169 ?auto_651170 ) ) ( ON ?auto_651168 ?auto_651169 ) ( ON ?auto_651167 ?auto_651168 ) ( ON ?auto_651166 ?auto_651167 ) ( CLEAR ?auto_651164 ) ( ON ?auto_651165 ?auto_651166 ) ( CLEAR ?auto_651165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_651161 ?auto_651162 ?auto_651163 ?auto_651164 ?auto_651165 )
      ( MAKE-9PILE ?auto_651161 ?auto_651162 ?auto_651163 ?auto_651164 ?auto_651165 ?auto_651166 ?auto_651167 ?auto_651168 ?auto_651169 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_651199 - BLOCK
      ?auto_651200 - BLOCK
      ?auto_651201 - BLOCK
      ?auto_651202 - BLOCK
      ?auto_651203 - BLOCK
      ?auto_651204 - BLOCK
      ?auto_651205 - BLOCK
      ?auto_651206 - BLOCK
      ?auto_651207 - BLOCK
    )
    :vars
    (
      ?auto_651208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_651207 ?auto_651208 ) ( ON-TABLE ?auto_651199 ) ( ON ?auto_651200 ?auto_651199 ) ( ON ?auto_651201 ?auto_651200 ) ( not ( = ?auto_651199 ?auto_651200 ) ) ( not ( = ?auto_651199 ?auto_651201 ) ) ( not ( = ?auto_651199 ?auto_651202 ) ) ( not ( = ?auto_651199 ?auto_651203 ) ) ( not ( = ?auto_651199 ?auto_651204 ) ) ( not ( = ?auto_651199 ?auto_651205 ) ) ( not ( = ?auto_651199 ?auto_651206 ) ) ( not ( = ?auto_651199 ?auto_651207 ) ) ( not ( = ?auto_651199 ?auto_651208 ) ) ( not ( = ?auto_651200 ?auto_651201 ) ) ( not ( = ?auto_651200 ?auto_651202 ) ) ( not ( = ?auto_651200 ?auto_651203 ) ) ( not ( = ?auto_651200 ?auto_651204 ) ) ( not ( = ?auto_651200 ?auto_651205 ) ) ( not ( = ?auto_651200 ?auto_651206 ) ) ( not ( = ?auto_651200 ?auto_651207 ) ) ( not ( = ?auto_651200 ?auto_651208 ) ) ( not ( = ?auto_651201 ?auto_651202 ) ) ( not ( = ?auto_651201 ?auto_651203 ) ) ( not ( = ?auto_651201 ?auto_651204 ) ) ( not ( = ?auto_651201 ?auto_651205 ) ) ( not ( = ?auto_651201 ?auto_651206 ) ) ( not ( = ?auto_651201 ?auto_651207 ) ) ( not ( = ?auto_651201 ?auto_651208 ) ) ( not ( = ?auto_651202 ?auto_651203 ) ) ( not ( = ?auto_651202 ?auto_651204 ) ) ( not ( = ?auto_651202 ?auto_651205 ) ) ( not ( = ?auto_651202 ?auto_651206 ) ) ( not ( = ?auto_651202 ?auto_651207 ) ) ( not ( = ?auto_651202 ?auto_651208 ) ) ( not ( = ?auto_651203 ?auto_651204 ) ) ( not ( = ?auto_651203 ?auto_651205 ) ) ( not ( = ?auto_651203 ?auto_651206 ) ) ( not ( = ?auto_651203 ?auto_651207 ) ) ( not ( = ?auto_651203 ?auto_651208 ) ) ( not ( = ?auto_651204 ?auto_651205 ) ) ( not ( = ?auto_651204 ?auto_651206 ) ) ( not ( = ?auto_651204 ?auto_651207 ) ) ( not ( = ?auto_651204 ?auto_651208 ) ) ( not ( = ?auto_651205 ?auto_651206 ) ) ( not ( = ?auto_651205 ?auto_651207 ) ) ( not ( = ?auto_651205 ?auto_651208 ) ) ( not ( = ?auto_651206 ?auto_651207 ) ) ( not ( = ?auto_651206 ?auto_651208 ) ) ( not ( = ?auto_651207 ?auto_651208 ) ) ( ON ?auto_651206 ?auto_651207 ) ( ON ?auto_651205 ?auto_651206 ) ( ON ?auto_651204 ?auto_651205 ) ( ON ?auto_651203 ?auto_651204 ) ( CLEAR ?auto_651201 ) ( ON ?auto_651202 ?auto_651203 ) ( CLEAR ?auto_651202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_651199 ?auto_651200 ?auto_651201 ?auto_651202 )
      ( MAKE-9PILE ?auto_651199 ?auto_651200 ?auto_651201 ?auto_651202 ?auto_651203 ?auto_651204 ?auto_651205 ?auto_651206 ?auto_651207 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_651237 - BLOCK
      ?auto_651238 - BLOCK
      ?auto_651239 - BLOCK
      ?auto_651240 - BLOCK
      ?auto_651241 - BLOCK
      ?auto_651242 - BLOCK
      ?auto_651243 - BLOCK
      ?auto_651244 - BLOCK
      ?auto_651245 - BLOCK
    )
    :vars
    (
      ?auto_651246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_651245 ?auto_651246 ) ( ON-TABLE ?auto_651237 ) ( ON ?auto_651238 ?auto_651237 ) ( not ( = ?auto_651237 ?auto_651238 ) ) ( not ( = ?auto_651237 ?auto_651239 ) ) ( not ( = ?auto_651237 ?auto_651240 ) ) ( not ( = ?auto_651237 ?auto_651241 ) ) ( not ( = ?auto_651237 ?auto_651242 ) ) ( not ( = ?auto_651237 ?auto_651243 ) ) ( not ( = ?auto_651237 ?auto_651244 ) ) ( not ( = ?auto_651237 ?auto_651245 ) ) ( not ( = ?auto_651237 ?auto_651246 ) ) ( not ( = ?auto_651238 ?auto_651239 ) ) ( not ( = ?auto_651238 ?auto_651240 ) ) ( not ( = ?auto_651238 ?auto_651241 ) ) ( not ( = ?auto_651238 ?auto_651242 ) ) ( not ( = ?auto_651238 ?auto_651243 ) ) ( not ( = ?auto_651238 ?auto_651244 ) ) ( not ( = ?auto_651238 ?auto_651245 ) ) ( not ( = ?auto_651238 ?auto_651246 ) ) ( not ( = ?auto_651239 ?auto_651240 ) ) ( not ( = ?auto_651239 ?auto_651241 ) ) ( not ( = ?auto_651239 ?auto_651242 ) ) ( not ( = ?auto_651239 ?auto_651243 ) ) ( not ( = ?auto_651239 ?auto_651244 ) ) ( not ( = ?auto_651239 ?auto_651245 ) ) ( not ( = ?auto_651239 ?auto_651246 ) ) ( not ( = ?auto_651240 ?auto_651241 ) ) ( not ( = ?auto_651240 ?auto_651242 ) ) ( not ( = ?auto_651240 ?auto_651243 ) ) ( not ( = ?auto_651240 ?auto_651244 ) ) ( not ( = ?auto_651240 ?auto_651245 ) ) ( not ( = ?auto_651240 ?auto_651246 ) ) ( not ( = ?auto_651241 ?auto_651242 ) ) ( not ( = ?auto_651241 ?auto_651243 ) ) ( not ( = ?auto_651241 ?auto_651244 ) ) ( not ( = ?auto_651241 ?auto_651245 ) ) ( not ( = ?auto_651241 ?auto_651246 ) ) ( not ( = ?auto_651242 ?auto_651243 ) ) ( not ( = ?auto_651242 ?auto_651244 ) ) ( not ( = ?auto_651242 ?auto_651245 ) ) ( not ( = ?auto_651242 ?auto_651246 ) ) ( not ( = ?auto_651243 ?auto_651244 ) ) ( not ( = ?auto_651243 ?auto_651245 ) ) ( not ( = ?auto_651243 ?auto_651246 ) ) ( not ( = ?auto_651244 ?auto_651245 ) ) ( not ( = ?auto_651244 ?auto_651246 ) ) ( not ( = ?auto_651245 ?auto_651246 ) ) ( ON ?auto_651244 ?auto_651245 ) ( ON ?auto_651243 ?auto_651244 ) ( ON ?auto_651242 ?auto_651243 ) ( ON ?auto_651241 ?auto_651242 ) ( ON ?auto_651240 ?auto_651241 ) ( CLEAR ?auto_651238 ) ( ON ?auto_651239 ?auto_651240 ) ( CLEAR ?auto_651239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_651237 ?auto_651238 ?auto_651239 )
      ( MAKE-9PILE ?auto_651237 ?auto_651238 ?auto_651239 ?auto_651240 ?auto_651241 ?auto_651242 ?auto_651243 ?auto_651244 ?auto_651245 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_651275 - BLOCK
      ?auto_651276 - BLOCK
      ?auto_651277 - BLOCK
      ?auto_651278 - BLOCK
      ?auto_651279 - BLOCK
      ?auto_651280 - BLOCK
      ?auto_651281 - BLOCK
      ?auto_651282 - BLOCK
      ?auto_651283 - BLOCK
    )
    :vars
    (
      ?auto_651284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_651283 ?auto_651284 ) ( ON-TABLE ?auto_651275 ) ( not ( = ?auto_651275 ?auto_651276 ) ) ( not ( = ?auto_651275 ?auto_651277 ) ) ( not ( = ?auto_651275 ?auto_651278 ) ) ( not ( = ?auto_651275 ?auto_651279 ) ) ( not ( = ?auto_651275 ?auto_651280 ) ) ( not ( = ?auto_651275 ?auto_651281 ) ) ( not ( = ?auto_651275 ?auto_651282 ) ) ( not ( = ?auto_651275 ?auto_651283 ) ) ( not ( = ?auto_651275 ?auto_651284 ) ) ( not ( = ?auto_651276 ?auto_651277 ) ) ( not ( = ?auto_651276 ?auto_651278 ) ) ( not ( = ?auto_651276 ?auto_651279 ) ) ( not ( = ?auto_651276 ?auto_651280 ) ) ( not ( = ?auto_651276 ?auto_651281 ) ) ( not ( = ?auto_651276 ?auto_651282 ) ) ( not ( = ?auto_651276 ?auto_651283 ) ) ( not ( = ?auto_651276 ?auto_651284 ) ) ( not ( = ?auto_651277 ?auto_651278 ) ) ( not ( = ?auto_651277 ?auto_651279 ) ) ( not ( = ?auto_651277 ?auto_651280 ) ) ( not ( = ?auto_651277 ?auto_651281 ) ) ( not ( = ?auto_651277 ?auto_651282 ) ) ( not ( = ?auto_651277 ?auto_651283 ) ) ( not ( = ?auto_651277 ?auto_651284 ) ) ( not ( = ?auto_651278 ?auto_651279 ) ) ( not ( = ?auto_651278 ?auto_651280 ) ) ( not ( = ?auto_651278 ?auto_651281 ) ) ( not ( = ?auto_651278 ?auto_651282 ) ) ( not ( = ?auto_651278 ?auto_651283 ) ) ( not ( = ?auto_651278 ?auto_651284 ) ) ( not ( = ?auto_651279 ?auto_651280 ) ) ( not ( = ?auto_651279 ?auto_651281 ) ) ( not ( = ?auto_651279 ?auto_651282 ) ) ( not ( = ?auto_651279 ?auto_651283 ) ) ( not ( = ?auto_651279 ?auto_651284 ) ) ( not ( = ?auto_651280 ?auto_651281 ) ) ( not ( = ?auto_651280 ?auto_651282 ) ) ( not ( = ?auto_651280 ?auto_651283 ) ) ( not ( = ?auto_651280 ?auto_651284 ) ) ( not ( = ?auto_651281 ?auto_651282 ) ) ( not ( = ?auto_651281 ?auto_651283 ) ) ( not ( = ?auto_651281 ?auto_651284 ) ) ( not ( = ?auto_651282 ?auto_651283 ) ) ( not ( = ?auto_651282 ?auto_651284 ) ) ( not ( = ?auto_651283 ?auto_651284 ) ) ( ON ?auto_651282 ?auto_651283 ) ( ON ?auto_651281 ?auto_651282 ) ( ON ?auto_651280 ?auto_651281 ) ( ON ?auto_651279 ?auto_651280 ) ( ON ?auto_651278 ?auto_651279 ) ( ON ?auto_651277 ?auto_651278 ) ( CLEAR ?auto_651275 ) ( ON ?auto_651276 ?auto_651277 ) ( CLEAR ?auto_651276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_651275 ?auto_651276 )
      ( MAKE-9PILE ?auto_651275 ?auto_651276 ?auto_651277 ?auto_651278 ?auto_651279 ?auto_651280 ?auto_651281 ?auto_651282 ?auto_651283 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_651313 - BLOCK
      ?auto_651314 - BLOCK
      ?auto_651315 - BLOCK
      ?auto_651316 - BLOCK
      ?auto_651317 - BLOCK
      ?auto_651318 - BLOCK
      ?auto_651319 - BLOCK
      ?auto_651320 - BLOCK
      ?auto_651321 - BLOCK
    )
    :vars
    (
      ?auto_651322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_651321 ?auto_651322 ) ( not ( = ?auto_651313 ?auto_651314 ) ) ( not ( = ?auto_651313 ?auto_651315 ) ) ( not ( = ?auto_651313 ?auto_651316 ) ) ( not ( = ?auto_651313 ?auto_651317 ) ) ( not ( = ?auto_651313 ?auto_651318 ) ) ( not ( = ?auto_651313 ?auto_651319 ) ) ( not ( = ?auto_651313 ?auto_651320 ) ) ( not ( = ?auto_651313 ?auto_651321 ) ) ( not ( = ?auto_651313 ?auto_651322 ) ) ( not ( = ?auto_651314 ?auto_651315 ) ) ( not ( = ?auto_651314 ?auto_651316 ) ) ( not ( = ?auto_651314 ?auto_651317 ) ) ( not ( = ?auto_651314 ?auto_651318 ) ) ( not ( = ?auto_651314 ?auto_651319 ) ) ( not ( = ?auto_651314 ?auto_651320 ) ) ( not ( = ?auto_651314 ?auto_651321 ) ) ( not ( = ?auto_651314 ?auto_651322 ) ) ( not ( = ?auto_651315 ?auto_651316 ) ) ( not ( = ?auto_651315 ?auto_651317 ) ) ( not ( = ?auto_651315 ?auto_651318 ) ) ( not ( = ?auto_651315 ?auto_651319 ) ) ( not ( = ?auto_651315 ?auto_651320 ) ) ( not ( = ?auto_651315 ?auto_651321 ) ) ( not ( = ?auto_651315 ?auto_651322 ) ) ( not ( = ?auto_651316 ?auto_651317 ) ) ( not ( = ?auto_651316 ?auto_651318 ) ) ( not ( = ?auto_651316 ?auto_651319 ) ) ( not ( = ?auto_651316 ?auto_651320 ) ) ( not ( = ?auto_651316 ?auto_651321 ) ) ( not ( = ?auto_651316 ?auto_651322 ) ) ( not ( = ?auto_651317 ?auto_651318 ) ) ( not ( = ?auto_651317 ?auto_651319 ) ) ( not ( = ?auto_651317 ?auto_651320 ) ) ( not ( = ?auto_651317 ?auto_651321 ) ) ( not ( = ?auto_651317 ?auto_651322 ) ) ( not ( = ?auto_651318 ?auto_651319 ) ) ( not ( = ?auto_651318 ?auto_651320 ) ) ( not ( = ?auto_651318 ?auto_651321 ) ) ( not ( = ?auto_651318 ?auto_651322 ) ) ( not ( = ?auto_651319 ?auto_651320 ) ) ( not ( = ?auto_651319 ?auto_651321 ) ) ( not ( = ?auto_651319 ?auto_651322 ) ) ( not ( = ?auto_651320 ?auto_651321 ) ) ( not ( = ?auto_651320 ?auto_651322 ) ) ( not ( = ?auto_651321 ?auto_651322 ) ) ( ON ?auto_651320 ?auto_651321 ) ( ON ?auto_651319 ?auto_651320 ) ( ON ?auto_651318 ?auto_651319 ) ( ON ?auto_651317 ?auto_651318 ) ( ON ?auto_651316 ?auto_651317 ) ( ON ?auto_651315 ?auto_651316 ) ( ON ?auto_651314 ?auto_651315 ) ( ON ?auto_651313 ?auto_651314 ) ( CLEAR ?auto_651313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_651313 )
      ( MAKE-9PILE ?auto_651313 ?auto_651314 ?auto_651315 ?auto_651316 ?auto_651317 ?auto_651318 ?auto_651319 ?auto_651320 ?auto_651321 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_651352 - BLOCK
      ?auto_651353 - BLOCK
      ?auto_651354 - BLOCK
      ?auto_651355 - BLOCK
      ?auto_651356 - BLOCK
      ?auto_651357 - BLOCK
      ?auto_651358 - BLOCK
      ?auto_651359 - BLOCK
      ?auto_651360 - BLOCK
      ?auto_651361 - BLOCK
    )
    :vars
    (
      ?auto_651362 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_651360 ) ( ON ?auto_651361 ?auto_651362 ) ( CLEAR ?auto_651361 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_651352 ) ( ON ?auto_651353 ?auto_651352 ) ( ON ?auto_651354 ?auto_651353 ) ( ON ?auto_651355 ?auto_651354 ) ( ON ?auto_651356 ?auto_651355 ) ( ON ?auto_651357 ?auto_651356 ) ( ON ?auto_651358 ?auto_651357 ) ( ON ?auto_651359 ?auto_651358 ) ( ON ?auto_651360 ?auto_651359 ) ( not ( = ?auto_651352 ?auto_651353 ) ) ( not ( = ?auto_651352 ?auto_651354 ) ) ( not ( = ?auto_651352 ?auto_651355 ) ) ( not ( = ?auto_651352 ?auto_651356 ) ) ( not ( = ?auto_651352 ?auto_651357 ) ) ( not ( = ?auto_651352 ?auto_651358 ) ) ( not ( = ?auto_651352 ?auto_651359 ) ) ( not ( = ?auto_651352 ?auto_651360 ) ) ( not ( = ?auto_651352 ?auto_651361 ) ) ( not ( = ?auto_651352 ?auto_651362 ) ) ( not ( = ?auto_651353 ?auto_651354 ) ) ( not ( = ?auto_651353 ?auto_651355 ) ) ( not ( = ?auto_651353 ?auto_651356 ) ) ( not ( = ?auto_651353 ?auto_651357 ) ) ( not ( = ?auto_651353 ?auto_651358 ) ) ( not ( = ?auto_651353 ?auto_651359 ) ) ( not ( = ?auto_651353 ?auto_651360 ) ) ( not ( = ?auto_651353 ?auto_651361 ) ) ( not ( = ?auto_651353 ?auto_651362 ) ) ( not ( = ?auto_651354 ?auto_651355 ) ) ( not ( = ?auto_651354 ?auto_651356 ) ) ( not ( = ?auto_651354 ?auto_651357 ) ) ( not ( = ?auto_651354 ?auto_651358 ) ) ( not ( = ?auto_651354 ?auto_651359 ) ) ( not ( = ?auto_651354 ?auto_651360 ) ) ( not ( = ?auto_651354 ?auto_651361 ) ) ( not ( = ?auto_651354 ?auto_651362 ) ) ( not ( = ?auto_651355 ?auto_651356 ) ) ( not ( = ?auto_651355 ?auto_651357 ) ) ( not ( = ?auto_651355 ?auto_651358 ) ) ( not ( = ?auto_651355 ?auto_651359 ) ) ( not ( = ?auto_651355 ?auto_651360 ) ) ( not ( = ?auto_651355 ?auto_651361 ) ) ( not ( = ?auto_651355 ?auto_651362 ) ) ( not ( = ?auto_651356 ?auto_651357 ) ) ( not ( = ?auto_651356 ?auto_651358 ) ) ( not ( = ?auto_651356 ?auto_651359 ) ) ( not ( = ?auto_651356 ?auto_651360 ) ) ( not ( = ?auto_651356 ?auto_651361 ) ) ( not ( = ?auto_651356 ?auto_651362 ) ) ( not ( = ?auto_651357 ?auto_651358 ) ) ( not ( = ?auto_651357 ?auto_651359 ) ) ( not ( = ?auto_651357 ?auto_651360 ) ) ( not ( = ?auto_651357 ?auto_651361 ) ) ( not ( = ?auto_651357 ?auto_651362 ) ) ( not ( = ?auto_651358 ?auto_651359 ) ) ( not ( = ?auto_651358 ?auto_651360 ) ) ( not ( = ?auto_651358 ?auto_651361 ) ) ( not ( = ?auto_651358 ?auto_651362 ) ) ( not ( = ?auto_651359 ?auto_651360 ) ) ( not ( = ?auto_651359 ?auto_651361 ) ) ( not ( = ?auto_651359 ?auto_651362 ) ) ( not ( = ?auto_651360 ?auto_651361 ) ) ( not ( = ?auto_651360 ?auto_651362 ) ) ( not ( = ?auto_651361 ?auto_651362 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_651361 ?auto_651362 )
      ( !STACK ?auto_651361 ?auto_651360 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_651394 - BLOCK
      ?auto_651395 - BLOCK
      ?auto_651396 - BLOCK
      ?auto_651397 - BLOCK
      ?auto_651398 - BLOCK
      ?auto_651399 - BLOCK
      ?auto_651400 - BLOCK
      ?auto_651401 - BLOCK
      ?auto_651402 - BLOCK
      ?auto_651403 - BLOCK
    )
    :vars
    (
      ?auto_651404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_651403 ?auto_651404 ) ( ON-TABLE ?auto_651394 ) ( ON ?auto_651395 ?auto_651394 ) ( ON ?auto_651396 ?auto_651395 ) ( ON ?auto_651397 ?auto_651396 ) ( ON ?auto_651398 ?auto_651397 ) ( ON ?auto_651399 ?auto_651398 ) ( ON ?auto_651400 ?auto_651399 ) ( ON ?auto_651401 ?auto_651400 ) ( not ( = ?auto_651394 ?auto_651395 ) ) ( not ( = ?auto_651394 ?auto_651396 ) ) ( not ( = ?auto_651394 ?auto_651397 ) ) ( not ( = ?auto_651394 ?auto_651398 ) ) ( not ( = ?auto_651394 ?auto_651399 ) ) ( not ( = ?auto_651394 ?auto_651400 ) ) ( not ( = ?auto_651394 ?auto_651401 ) ) ( not ( = ?auto_651394 ?auto_651402 ) ) ( not ( = ?auto_651394 ?auto_651403 ) ) ( not ( = ?auto_651394 ?auto_651404 ) ) ( not ( = ?auto_651395 ?auto_651396 ) ) ( not ( = ?auto_651395 ?auto_651397 ) ) ( not ( = ?auto_651395 ?auto_651398 ) ) ( not ( = ?auto_651395 ?auto_651399 ) ) ( not ( = ?auto_651395 ?auto_651400 ) ) ( not ( = ?auto_651395 ?auto_651401 ) ) ( not ( = ?auto_651395 ?auto_651402 ) ) ( not ( = ?auto_651395 ?auto_651403 ) ) ( not ( = ?auto_651395 ?auto_651404 ) ) ( not ( = ?auto_651396 ?auto_651397 ) ) ( not ( = ?auto_651396 ?auto_651398 ) ) ( not ( = ?auto_651396 ?auto_651399 ) ) ( not ( = ?auto_651396 ?auto_651400 ) ) ( not ( = ?auto_651396 ?auto_651401 ) ) ( not ( = ?auto_651396 ?auto_651402 ) ) ( not ( = ?auto_651396 ?auto_651403 ) ) ( not ( = ?auto_651396 ?auto_651404 ) ) ( not ( = ?auto_651397 ?auto_651398 ) ) ( not ( = ?auto_651397 ?auto_651399 ) ) ( not ( = ?auto_651397 ?auto_651400 ) ) ( not ( = ?auto_651397 ?auto_651401 ) ) ( not ( = ?auto_651397 ?auto_651402 ) ) ( not ( = ?auto_651397 ?auto_651403 ) ) ( not ( = ?auto_651397 ?auto_651404 ) ) ( not ( = ?auto_651398 ?auto_651399 ) ) ( not ( = ?auto_651398 ?auto_651400 ) ) ( not ( = ?auto_651398 ?auto_651401 ) ) ( not ( = ?auto_651398 ?auto_651402 ) ) ( not ( = ?auto_651398 ?auto_651403 ) ) ( not ( = ?auto_651398 ?auto_651404 ) ) ( not ( = ?auto_651399 ?auto_651400 ) ) ( not ( = ?auto_651399 ?auto_651401 ) ) ( not ( = ?auto_651399 ?auto_651402 ) ) ( not ( = ?auto_651399 ?auto_651403 ) ) ( not ( = ?auto_651399 ?auto_651404 ) ) ( not ( = ?auto_651400 ?auto_651401 ) ) ( not ( = ?auto_651400 ?auto_651402 ) ) ( not ( = ?auto_651400 ?auto_651403 ) ) ( not ( = ?auto_651400 ?auto_651404 ) ) ( not ( = ?auto_651401 ?auto_651402 ) ) ( not ( = ?auto_651401 ?auto_651403 ) ) ( not ( = ?auto_651401 ?auto_651404 ) ) ( not ( = ?auto_651402 ?auto_651403 ) ) ( not ( = ?auto_651402 ?auto_651404 ) ) ( not ( = ?auto_651403 ?auto_651404 ) ) ( CLEAR ?auto_651401 ) ( ON ?auto_651402 ?auto_651403 ) ( CLEAR ?auto_651402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_651394 ?auto_651395 ?auto_651396 ?auto_651397 ?auto_651398 ?auto_651399 ?auto_651400 ?auto_651401 ?auto_651402 )
      ( MAKE-10PILE ?auto_651394 ?auto_651395 ?auto_651396 ?auto_651397 ?auto_651398 ?auto_651399 ?auto_651400 ?auto_651401 ?auto_651402 ?auto_651403 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_651436 - BLOCK
      ?auto_651437 - BLOCK
      ?auto_651438 - BLOCK
      ?auto_651439 - BLOCK
      ?auto_651440 - BLOCK
      ?auto_651441 - BLOCK
      ?auto_651442 - BLOCK
      ?auto_651443 - BLOCK
      ?auto_651444 - BLOCK
      ?auto_651445 - BLOCK
    )
    :vars
    (
      ?auto_651446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_651445 ?auto_651446 ) ( ON-TABLE ?auto_651436 ) ( ON ?auto_651437 ?auto_651436 ) ( ON ?auto_651438 ?auto_651437 ) ( ON ?auto_651439 ?auto_651438 ) ( ON ?auto_651440 ?auto_651439 ) ( ON ?auto_651441 ?auto_651440 ) ( ON ?auto_651442 ?auto_651441 ) ( not ( = ?auto_651436 ?auto_651437 ) ) ( not ( = ?auto_651436 ?auto_651438 ) ) ( not ( = ?auto_651436 ?auto_651439 ) ) ( not ( = ?auto_651436 ?auto_651440 ) ) ( not ( = ?auto_651436 ?auto_651441 ) ) ( not ( = ?auto_651436 ?auto_651442 ) ) ( not ( = ?auto_651436 ?auto_651443 ) ) ( not ( = ?auto_651436 ?auto_651444 ) ) ( not ( = ?auto_651436 ?auto_651445 ) ) ( not ( = ?auto_651436 ?auto_651446 ) ) ( not ( = ?auto_651437 ?auto_651438 ) ) ( not ( = ?auto_651437 ?auto_651439 ) ) ( not ( = ?auto_651437 ?auto_651440 ) ) ( not ( = ?auto_651437 ?auto_651441 ) ) ( not ( = ?auto_651437 ?auto_651442 ) ) ( not ( = ?auto_651437 ?auto_651443 ) ) ( not ( = ?auto_651437 ?auto_651444 ) ) ( not ( = ?auto_651437 ?auto_651445 ) ) ( not ( = ?auto_651437 ?auto_651446 ) ) ( not ( = ?auto_651438 ?auto_651439 ) ) ( not ( = ?auto_651438 ?auto_651440 ) ) ( not ( = ?auto_651438 ?auto_651441 ) ) ( not ( = ?auto_651438 ?auto_651442 ) ) ( not ( = ?auto_651438 ?auto_651443 ) ) ( not ( = ?auto_651438 ?auto_651444 ) ) ( not ( = ?auto_651438 ?auto_651445 ) ) ( not ( = ?auto_651438 ?auto_651446 ) ) ( not ( = ?auto_651439 ?auto_651440 ) ) ( not ( = ?auto_651439 ?auto_651441 ) ) ( not ( = ?auto_651439 ?auto_651442 ) ) ( not ( = ?auto_651439 ?auto_651443 ) ) ( not ( = ?auto_651439 ?auto_651444 ) ) ( not ( = ?auto_651439 ?auto_651445 ) ) ( not ( = ?auto_651439 ?auto_651446 ) ) ( not ( = ?auto_651440 ?auto_651441 ) ) ( not ( = ?auto_651440 ?auto_651442 ) ) ( not ( = ?auto_651440 ?auto_651443 ) ) ( not ( = ?auto_651440 ?auto_651444 ) ) ( not ( = ?auto_651440 ?auto_651445 ) ) ( not ( = ?auto_651440 ?auto_651446 ) ) ( not ( = ?auto_651441 ?auto_651442 ) ) ( not ( = ?auto_651441 ?auto_651443 ) ) ( not ( = ?auto_651441 ?auto_651444 ) ) ( not ( = ?auto_651441 ?auto_651445 ) ) ( not ( = ?auto_651441 ?auto_651446 ) ) ( not ( = ?auto_651442 ?auto_651443 ) ) ( not ( = ?auto_651442 ?auto_651444 ) ) ( not ( = ?auto_651442 ?auto_651445 ) ) ( not ( = ?auto_651442 ?auto_651446 ) ) ( not ( = ?auto_651443 ?auto_651444 ) ) ( not ( = ?auto_651443 ?auto_651445 ) ) ( not ( = ?auto_651443 ?auto_651446 ) ) ( not ( = ?auto_651444 ?auto_651445 ) ) ( not ( = ?auto_651444 ?auto_651446 ) ) ( not ( = ?auto_651445 ?auto_651446 ) ) ( ON ?auto_651444 ?auto_651445 ) ( CLEAR ?auto_651442 ) ( ON ?auto_651443 ?auto_651444 ) ( CLEAR ?auto_651443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_651436 ?auto_651437 ?auto_651438 ?auto_651439 ?auto_651440 ?auto_651441 ?auto_651442 ?auto_651443 )
      ( MAKE-10PILE ?auto_651436 ?auto_651437 ?auto_651438 ?auto_651439 ?auto_651440 ?auto_651441 ?auto_651442 ?auto_651443 ?auto_651444 ?auto_651445 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_651478 - BLOCK
      ?auto_651479 - BLOCK
      ?auto_651480 - BLOCK
      ?auto_651481 - BLOCK
      ?auto_651482 - BLOCK
      ?auto_651483 - BLOCK
      ?auto_651484 - BLOCK
      ?auto_651485 - BLOCK
      ?auto_651486 - BLOCK
      ?auto_651487 - BLOCK
    )
    :vars
    (
      ?auto_651488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_651487 ?auto_651488 ) ( ON-TABLE ?auto_651478 ) ( ON ?auto_651479 ?auto_651478 ) ( ON ?auto_651480 ?auto_651479 ) ( ON ?auto_651481 ?auto_651480 ) ( ON ?auto_651482 ?auto_651481 ) ( ON ?auto_651483 ?auto_651482 ) ( not ( = ?auto_651478 ?auto_651479 ) ) ( not ( = ?auto_651478 ?auto_651480 ) ) ( not ( = ?auto_651478 ?auto_651481 ) ) ( not ( = ?auto_651478 ?auto_651482 ) ) ( not ( = ?auto_651478 ?auto_651483 ) ) ( not ( = ?auto_651478 ?auto_651484 ) ) ( not ( = ?auto_651478 ?auto_651485 ) ) ( not ( = ?auto_651478 ?auto_651486 ) ) ( not ( = ?auto_651478 ?auto_651487 ) ) ( not ( = ?auto_651478 ?auto_651488 ) ) ( not ( = ?auto_651479 ?auto_651480 ) ) ( not ( = ?auto_651479 ?auto_651481 ) ) ( not ( = ?auto_651479 ?auto_651482 ) ) ( not ( = ?auto_651479 ?auto_651483 ) ) ( not ( = ?auto_651479 ?auto_651484 ) ) ( not ( = ?auto_651479 ?auto_651485 ) ) ( not ( = ?auto_651479 ?auto_651486 ) ) ( not ( = ?auto_651479 ?auto_651487 ) ) ( not ( = ?auto_651479 ?auto_651488 ) ) ( not ( = ?auto_651480 ?auto_651481 ) ) ( not ( = ?auto_651480 ?auto_651482 ) ) ( not ( = ?auto_651480 ?auto_651483 ) ) ( not ( = ?auto_651480 ?auto_651484 ) ) ( not ( = ?auto_651480 ?auto_651485 ) ) ( not ( = ?auto_651480 ?auto_651486 ) ) ( not ( = ?auto_651480 ?auto_651487 ) ) ( not ( = ?auto_651480 ?auto_651488 ) ) ( not ( = ?auto_651481 ?auto_651482 ) ) ( not ( = ?auto_651481 ?auto_651483 ) ) ( not ( = ?auto_651481 ?auto_651484 ) ) ( not ( = ?auto_651481 ?auto_651485 ) ) ( not ( = ?auto_651481 ?auto_651486 ) ) ( not ( = ?auto_651481 ?auto_651487 ) ) ( not ( = ?auto_651481 ?auto_651488 ) ) ( not ( = ?auto_651482 ?auto_651483 ) ) ( not ( = ?auto_651482 ?auto_651484 ) ) ( not ( = ?auto_651482 ?auto_651485 ) ) ( not ( = ?auto_651482 ?auto_651486 ) ) ( not ( = ?auto_651482 ?auto_651487 ) ) ( not ( = ?auto_651482 ?auto_651488 ) ) ( not ( = ?auto_651483 ?auto_651484 ) ) ( not ( = ?auto_651483 ?auto_651485 ) ) ( not ( = ?auto_651483 ?auto_651486 ) ) ( not ( = ?auto_651483 ?auto_651487 ) ) ( not ( = ?auto_651483 ?auto_651488 ) ) ( not ( = ?auto_651484 ?auto_651485 ) ) ( not ( = ?auto_651484 ?auto_651486 ) ) ( not ( = ?auto_651484 ?auto_651487 ) ) ( not ( = ?auto_651484 ?auto_651488 ) ) ( not ( = ?auto_651485 ?auto_651486 ) ) ( not ( = ?auto_651485 ?auto_651487 ) ) ( not ( = ?auto_651485 ?auto_651488 ) ) ( not ( = ?auto_651486 ?auto_651487 ) ) ( not ( = ?auto_651486 ?auto_651488 ) ) ( not ( = ?auto_651487 ?auto_651488 ) ) ( ON ?auto_651486 ?auto_651487 ) ( ON ?auto_651485 ?auto_651486 ) ( CLEAR ?auto_651483 ) ( ON ?auto_651484 ?auto_651485 ) ( CLEAR ?auto_651484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_651478 ?auto_651479 ?auto_651480 ?auto_651481 ?auto_651482 ?auto_651483 ?auto_651484 )
      ( MAKE-10PILE ?auto_651478 ?auto_651479 ?auto_651480 ?auto_651481 ?auto_651482 ?auto_651483 ?auto_651484 ?auto_651485 ?auto_651486 ?auto_651487 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_651520 - BLOCK
      ?auto_651521 - BLOCK
      ?auto_651522 - BLOCK
      ?auto_651523 - BLOCK
      ?auto_651524 - BLOCK
      ?auto_651525 - BLOCK
      ?auto_651526 - BLOCK
      ?auto_651527 - BLOCK
      ?auto_651528 - BLOCK
      ?auto_651529 - BLOCK
    )
    :vars
    (
      ?auto_651530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_651529 ?auto_651530 ) ( ON-TABLE ?auto_651520 ) ( ON ?auto_651521 ?auto_651520 ) ( ON ?auto_651522 ?auto_651521 ) ( ON ?auto_651523 ?auto_651522 ) ( ON ?auto_651524 ?auto_651523 ) ( not ( = ?auto_651520 ?auto_651521 ) ) ( not ( = ?auto_651520 ?auto_651522 ) ) ( not ( = ?auto_651520 ?auto_651523 ) ) ( not ( = ?auto_651520 ?auto_651524 ) ) ( not ( = ?auto_651520 ?auto_651525 ) ) ( not ( = ?auto_651520 ?auto_651526 ) ) ( not ( = ?auto_651520 ?auto_651527 ) ) ( not ( = ?auto_651520 ?auto_651528 ) ) ( not ( = ?auto_651520 ?auto_651529 ) ) ( not ( = ?auto_651520 ?auto_651530 ) ) ( not ( = ?auto_651521 ?auto_651522 ) ) ( not ( = ?auto_651521 ?auto_651523 ) ) ( not ( = ?auto_651521 ?auto_651524 ) ) ( not ( = ?auto_651521 ?auto_651525 ) ) ( not ( = ?auto_651521 ?auto_651526 ) ) ( not ( = ?auto_651521 ?auto_651527 ) ) ( not ( = ?auto_651521 ?auto_651528 ) ) ( not ( = ?auto_651521 ?auto_651529 ) ) ( not ( = ?auto_651521 ?auto_651530 ) ) ( not ( = ?auto_651522 ?auto_651523 ) ) ( not ( = ?auto_651522 ?auto_651524 ) ) ( not ( = ?auto_651522 ?auto_651525 ) ) ( not ( = ?auto_651522 ?auto_651526 ) ) ( not ( = ?auto_651522 ?auto_651527 ) ) ( not ( = ?auto_651522 ?auto_651528 ) ) ( not ( = ?auto_651522 ?auto_651529 ) ) ( not ( = ?auto_651522 ?auto_651530 ) ) ( not ( = ?auto_651523 ?auto_651524 ) ) ( not ( = ?auto_651523 ?auto_651525 ) ) ( not ( = ?auto_651523 ?auto_651526 ) ) ( not ( = ?auto_651523 ?auto_651527 ) ) ( not ( = ?auto_651523 ?auto_651528 ) ) ( not ( = ?auto_651523 ?auto_651529 ) ) ( not ( = ?auto_651523 ?auto_651530 ) ) ( not ( = ?auto_651524 ?auto_651525 ) ) ( not ( = ?auto_651524 ?auto_651526 ) ) ( not ( = ?auto_651524 ?auto_651527 ) ) ( not ( = ?auto_651524 ?auto_651528 ) ) ( not ( = ?auto_651524 ?auto_651529 ) ) ( not ( = ?auto_651524 ?auto_651530 ) ) ( not ( = ?auto_651525 ?auto_651526 ) ) ( not ( = ?auto_651525 ?auto_651527 ) ) ( not ( = ?auto_651525 ?auto_651528 ) ) ( not ( = ?auto_651525 ?auto_651529 ) ) ( not ( = ?auto_651525 ?auto_651530 ) ) ( not ( = ?auto_651526 ?auto_651527 ) ) ( not ( = ?auto_651526 ?auto_651528 ) ) ( not ( = ?auto_651526 ?auto_651529 ) ) ( not ( = ?auto_651526 ?auto_651530 ) ) ( not ( = ?auto_651527 ?auto_651528 ) ) ( not ( = ?auto_651527 ?auto_651529 ) ) ( not ( = ?auto_651527 ?auto_651530 ) ) ( not ( = ?auto_651528 ?auto_651529 ) ) ( not ( = ?auto_651528 ?auto_651530 ) ) ( not ( = ?auto_651529 ?auto_651530 ) ) ( ON ?auto_651528 ?auto_651529 ) ( ON ?auto_651527 ?auto_651528 ) ( ON ?auto_651526 ?auto_651527 ) ( CLEAR ?auto_651524 ) ( ON ?auto_651525 ?auto_651526 ) ( CLEAR ?auto_651525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_651520 ?auto_651521 ?auto_651522 ?auto_651523 ?auto_651524 ?auto_651525 )
      ( MAKE-10PILE ?auto_651520 ?auto_651521 ?auto_651522 ?auto_651523 ?auto_651524 ?auto_651525 ?auto_651526 ?auto_651527 ?auto_651528 ?auto_651529 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_651562 - BLOCK
      ?auto_651563 - BLOCK
      ?auto_651564 - BLOCK
      ?auto_651565 - BLOCK
      ?auto_651566 - BLOCK
      ?auto_651567 - BLOCK
      ?auto_651568 - BLOCK
      ?auto_651569 - BLOCK
      ?auto_651570 - BLOCK
      ?auto_651571 - BLOCK
    )
    :vars
    (
      ?auto_651572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_651571 ?auto_651572 ) ( ON-TABLE ?auto_651562 ) ( ON ?auto_651563 ?auto_651562 ) ( ON ?auto_651564 ?auto_651563 ) ( ON ?auto_651565 ?auto_651564 ) ( not ( = ?auto_651562 ?auto_651563 ) ) ( not ( = ?auto_651562 ?auto_651564 ) ) ( not ( = ?auto_651562 ?auto_651565 ) ) ( not ( = ?auto_651562 ?auto_651566 ) ) ( not ( = ?auto_651562 ?auto_651567 ) ) ( not ( = ?auto_651562 ?auto_651568 ) ) ( not ( = ?auto_651562 ?auto_651569 ) ) ( not ( = ?auto_651562 ?auto_651570 ) ) ( not ( = ?auto_651562 ?auto_651571 ) ) ( not ( = ?auto_651562 ?auto_651572 ) ) ( not ( = ?auto_651563 ?auto_651564 ) ) ( not ( = ?auto_651563 ?auto_651565 ) ) ( not ( = ?auto_651563 ?auto_651566 ) ) ( not ( = ?auto_651563 ?auto_651567 ) ) ( not ( = ?auto_651563 ?auto_651568 ) ) ( not ( = ?auto_651563 ?auto_651569 ) ) ( not ( = ?auto_651563 ?auto_651570 ) ) ( not ( = ?auto_651563 ?auto_651571 ) ) ( not ( = ?auto_651563 ?auto_651572 ) ) ( not ( = ?auto_651564 ?auto_651565 ) ) ( not ( = ?auto_651564 ?auto_651566 ) ) ( not ( = ?auto_651564 ?auto_651567 ) ) ( not ( = ?auto_651564 ?auto_651568 ) ) ( not ( = ?auto_651564 ?auto_651569 ) ) ( not ( = ?auto_651564 ?auto_651570 ) ) ( not ( = ?auto_651564 ?auto_651571 ) ) ( not ( = ?auto_651564 ?auto_651572 ) ) ( not ( = ?auto_651565 ?auto_651566 ) ) ( not ( = ?auto_651565 ?auto_651567 ) ) ( not ( = ?auto_651565 ?auto_651568 ) ) ( not ( = ?auto_651565 ?auto_651569 ) ) ( not ( = ?auto_651565 ?auto_651570 ) ) ( not ( = ?auto_651565 ?auto_651571 ) ) ( not ( = ?auto_651565 ?auto_651572 ) ) ( not ( = ?auto_651566 ?auto_651567 ) ) ( not ( = ?auto_651566 ?auto_651568 ) ) ( not ( = ?auto_651566 ?auto_651569 ) ) ( not ( = ?auto_651566 ?auto_651570 ) ) ( not ( = ?auto_651566 ?auto_651571 ) ) ( not ( = ?auto_651566 ?auto_651572 ) ) ( not ( = ?auto_651567 ?auto_651568 ) ) ( not ( = ?auto_651567 ?auto_651569 ) ) ( not ( = ?auto_651567 ?auto_651570 ) ) ( not ( = ?auto_651567 ?auto_651571 ) ) ( not ( = ?auto_651567 ?auto_651572 ) ) ( not ( = ?auto_651568 ?auto_651569 ) ) ( not ( = ?auto_651568 ?auto_651570 ) ) ( not ( = ?auto_651568 ?auto_651571 ) ) ( not ( = ?auto_651568 ?auto_651572 ) ) ( not ( = ?auto_651569 ?auto_651570 ) ) ( not ( = ?auto_651569 ?auto_651571 ) ) ( not ( = ?auto_651569 ?auto_651572 ) ) ( not ( = ?auto_651570 ?auto_651571 ) ) ( not ( = ?auto_651570 ?auto_651572 ) ) ( not ( = ?auto_651571 ?auto_651572 ) ) ( ON ?auto_651570 ?auto_651571 ) ( ON ?auto_651569 ?auto_651570 ) ( ON ?auto_651568 ?auto_651569 ) ( ON ?auto_651567 ?auto_651568 ) ( CLEAR ?auto_651565 ) ( ON ?auto_651566 ?auto_651567 ) ( CLEAR ?auto_651566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_651562 ?auto_651563 ?auto_651564 ?auto_651565 ?auto_651566 )
      ( MAKE-10PILE ?auto_651562 ?auto_651563 ?auto_651564 ?auto_651565 ?auto_651566 ?auto_651567 ?auto_651568 ?auto_651569 ?auto_651570 ?auto_651571 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_651604 - BLOCK
      ?auto_651605 - BLOCK
      ?auto_651606 - BLOCK
      ?auto_651607 - BLOCK
      ?auto_651608 - BLOCK
      ?auto_651609 - BLOCK
      ?auto_651610 - BLOCK
      ?auto_651611 - BLOCK
      ?auto_651612 - BLOCK
      ?auto_651613 - BLOCK
    )
    :vars
    (
      ?auto_651614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_651613 ?auto_651614 ) ( ON-TABLE ?auto_651604 ) ( ON ?auto_651605 ?auto_651604 ) ( ON ?auto_651606 ?auto_651605 ) ( not ( = ?auto_651604 ?auto_651605 ) ) ( not ( = ?auto_651604 ?auto_651606 ) ) ( not ( = ?auto_651604 ?auto_651607 ) ) ( not ( = ?auto_651604 ?auto_651608 ) ) ( not ( = ?auto_651604 ?auto_651609 ) ) ( not ( = ?auto_651604 ?auto_651610 ) ) ( not ( = ?auto_651604 ?auto_651611 ) ) ( not ( = ?auto_651604 ?auto_651612 ) ) ( not ( = ?auto_651604 ?auto_651613 ) ) ( not ( = ?auto_651604 ?auto_651614 ) ) ( not ( = ?auto_651605 ?auto_651606 ) ) ( not ( = ?auto_651605 ?auto_651607 ) ) ( not ( = ?auto_651605 ?auto_651608 ) ) ( not ( = ?auto_651605 ?auto_651609 ) ) ( not ( = ?auto_651605 ?auto_651610 ) ) ( not ( = ?auto_651605 ?auto_651611 ) ) ( not ( = ?auto_651605 ?auto_651612 ) ) ( not ( = ?auto_651605 ?auto_651613 ) ) ( not ( = ?auto_651605 ?auto_651614 ) ) ( not ( = ?auto_651606 ?auto_651607 ) ) ( not ( = ?auto_651606 ?auto_651608 ) ) ( not ( = ?auto_651606 ?auto_651609 ) ) ( not ( = ?auto_651606 ?auto_651610 ) ) ( not ( = ?auto_651606 ?auto_651611 ) ) ( not ( = ?auto_651606 ?auto_651612 ) ) ( not ( = ?auto_651606 ?auto_651613 ) ) ( not ( = ?auto_651606 ?auto_651614 ) ) ( not ( = ?auto_651607 ?auto_651608 ) ) ( not ( = ?auto_651607 ?auto_651609 ) ) ( not ( = ?auto_651607 ?auto_651610 ) ) ( not ( = ?auto_651607 ?auto_651611 ) ) ( not ( = ?auto_651607 ?auto_651612 ) ) ( not ( = ?auto_651607 ?auto_651613 ) ) ( not ( = ?auto_651607 ?auto_651614 ) ) ( not ( = ?auto_651608 ?auto_651609 ) ) ( not ( = ?auto_651608 ?auto_651610 ) ) ( not ( = ?auto_651608 ?auto_651611 ) ) ( not ( = ?auto_651608 ?auto_651612 ) ) ( not ( = ?auto_651608 ?auto_651613 ) ) ( not ( = ?auto_651608 ?auto_651614 ) ) ( not ( = ?auto_651609 ?auto_651610 ) ) ( not ( = ?auto_651609 ?auto_651611 ) ) ( not ( = ?auto_651609 ?auto_651612 ) ) ( not ( = ?auto_651609 ?auto_651613 ) ) ( not ( = ?auto_651609 ?auto_651614 ) ) ( not ( = ?auto_651610 ?auto_651611 ) ) ( not ( = ?auto_651610 ?auto_651612 ) ) ( not ( = ?auto_651610 ?auto_651613 ) ) ( not ( = ?auto_651610 ?auto_651614 ) ) ( not ( = ?auto_651611 ?auto_651612 ) ) ( not ( = ?auto_651611 ?auto_651613 ) ) ( not ( = ?auto_651611 ?auto_651614 ) ) ( not ( = ?auto_651612 ?auto_651613 ) ) ( not ( = ?auto_651612 ?auto_651614 ) ) ( not ( = ?auto_651613 ?auto_651614 ) ) ( ON ?auto_651612 ?auto_651613 ) ( ON ?auto_651611 ?auto_651612 ) ( ON ?auto_651610 ?auto_651611 ) ( ON ?auto_651609 ?auto_651610 ) ( ON ?auto_651608 ?auto_651609 ) ( CLEAR ?auto_651606 ) ( ON ?auto_651607 ?auto_651608 ) ( CLEAR ?auto_651607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_651604 ?auto_651605 ?auto_651606 ?auto_651607 )
      ( MAKE-10PILE ?auto_651604 ?auto_651605 ?auto_651606 ?auto_651607 ?auto_651608 ?auto_651609 ?auto_651610 ?auto_651611 ?auto_651612 ?auto_651613 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_651646 - BLOCK
      ?auto_651647 - BLOCK
      ?auto_651648 - BLOCK
      ?auto_651649 - BLOCK
      ?auto_651650 - BLOCK
      ?auto_651651 - BLOCK
      ?auto_651652 - BLOCK
      ?auto_651653 - BLOCK
      ?auto_651654 - BLOCK
      ?auto_651655 - BLOCK
    )
    :vars
    (
      ?auto_651656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_651655 ?auto_651656 ) ( ON-TABLE ?auto_651646 ) ( ON ?auto_651647 ?auto_651646 ) ( not ( = ?auto_651646 ?auto_651647 ) ) ( not ( = ?auto_651646 ?auto_651648 ) ) ( not ( = ?auto_651646 ?auto_651649 ) ) ( not ( = ?auto_651646 ?auto_651650 ) ) ( not ( = ?auto_651646 ?auto_651651 ) ) ( not ( = ?auto_651646 ?auto_651652 ) ) ( not ( = ?auto_651646 ?auto_651653 ) ) ( not ( = ?auto_651646 ?auto_651654 ) ) ( not ( = ?auto_651646 ?auto_651655 ) ) ( not ( = ?auto_651646 ?auto_651656 ) ) ( not ( = ?auto_651647 ?auto_651648 ) ) ( not ( = ?auto_651647 ?auto_651649 ) ) ( not ( = ?auto_651647 ?auto_651650 ) ) ( not ( = ?auto_651647 ?auto_651651 ) ) ( not ( = ?auto_651647 ?auto_651652 ) ) ( not ( = ?auto_651647 ?auto_651653 ) ) ( not ( = ?auto_651647 ?auto_651654 ) ) ( not ( = ?auto_651647 ?auto_651655 ) ) ( not ( = ?auto_651647 ?auto_651656 ) ) ( not ( = ?auto_651648 ?auto_651649 ) ) ( not ( = ?auto_651648 ?auto_651650 ) ) ( not ( = ?auto_651648 ?auto_651651 ) ) ( not ( = ?auto_651648 ?auto_651652 ) ) ( not ( = ?auto_651648 ?auto_651653 ) ) ( not ( = ?auto_651648 ?auto_651654 ) ) ( not ( = ?auto_651648 ?auto_651655 ) ) ( not ( = ?auto_651648 ?auto_651656 ) ) ( not ( = ?auto_651649 ?auto_651650 ) ) ( not ( = ?auto_651649 ?auto_651651 ) ) ( not ( = ?auto_651649 ?auto_651652 ) ) ( not ( = ?auto_651649 ?auto_651653 ) ) ( not ( = ?auto_651649 ?auto_651654 ) ) ( not ( = ?auto_651649 ?auto_651655 ) ) ( not ( = ?auto_651649 ?auto_651656 ) ) ( not ( = ?auto_651650 ?auto_651651 ) ) ( not ( = ?auto_651650 ?auto_651652 ) ) ( not ( = ?auto_651650 ?auto_651653 ) ) ( not ( = ?auto_651650 ?auto_651654 ) ) ( not ( = ?auto_651650 ?auto_651655 ) ) ( not ( = ?auto_651650 ?auto_651656 ) ) ( not ( = ?auto_651651 ?auto_651652 ) ) ( not ( = ?auto_651651 ?auto_651653 ) ) ( not ( = ?auto_651651 ?auto_651654 ) ) ( not ( = ?auto_651651 ?auto_651655 ) ) ( not ( = ?auto_651651 ?auto_651656 ) ) ( not ( = ?auto_651652 ?auto_651653 ) ) ( not ( = ?auto_651652 ?auto_651654 ) ) ( not ( = ?auto_651652 ?auto_651655 ) ) ( not ( = ?auto_651652 ?auto_651656 ) ) ( not ( = ?auto_651653 ?auto_651654 ) ) ( not ( = ?auto_651653 ?auto_651655 ) ) ( not ( = ?auto_651653 ?auto_651656 ) ) ( not ( = ?auto_651654 ?auto_651655 ) ) ( not ( = ?auto_651654 ?auto_651656 ) ) ( not ( = ?auto_651655 ?auto_651656 ) ) ( ON ?auto_651654 ?auto_651655 ) ( ON ?auto_651653 ?auto_651654 ) ( ON ?auto_651652 ?auto_651653 ) ( ON ?auto_651651 ?auto_651652 ) ( ON ?auto_651650 ?auto_651651 ) ( ON ?auto_651649 ?auto_651650 ) ( CLEAR ?auto_651647 ) ( ON ?auto_651648 ?auto_651649 ) ( CLEAR ?auto_651648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_651646 ?auto_651647 ?auto_651648 )
      ( MAKE-10PILE ?auto_651646 ?auto_651647 ?auto_651648 ?auto_651649 ?auto_651650 ?auto_651651 ?auto_651652 ?auto_651653 ?auto_651654 ?auto_651655 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_651688 - BLOCK
      ?auto_651689 - BLOCK
      ?auto_651690 - BLOCK
      ?auto_651691 - BLOCK
      ?auto_651692 - BLOCK
      ?auto_651693 - BLOCK
      ?auto_651694 - BLOCK
      ?auto_651695 - BLOCK
      ?auto_651696 - BLOCK
      ?auto_651697 - BLOCK
    )
    :vars
    (
      ?auto_651698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_651697 ?auto_651698 ) ( ON-TABLE ?auto_651688 ) ( not ( = ?auto_651688 ?auto_651689 ) ) ( not ( = ?auto_651688 ?auto_651690 ) ) ( not ( = ?auto_651688 ?auto_651691 ) ) ( not ( = ?auto_651688 ?auto_651692 ) ) ( not ( = ?auto_651688 ?auto_651693 ) ) ( not ( = ?auto_651688 ?auto_651694 ) ) ( not ( = ?auto_651688 ?auto_651695 ) ) ( not ( = ?auto_651688 ?auto_651696 ) ) ( not ( = ?auto_651688 ?auto_651697 ) ) ( not ( = ?auto_651688 ?auto_651698 ) ) ( not ( = ?auto_651689 ?auto_651690 ) ) ( not ( = ?auto_651689 ?auto_651691 ) ) ( not ( = ?auto_651689 ?auto_651692 ) ) ( not ( = ?auto_651689 ?auto_651693 ) ) ( not ( = ?auto_651689 ?auto_651694 ) ) ( not ( = ?auto_651689 ?auto_651695 ) ) ( not ( = ?auto_651689 ?auto_651696 ) ) ( not ( = ?auto_651689 ?auto_651697 ) ) ( not ( = ?auto_651689 ?auto_651698 ) ) ( not ( = ?auto_651690 ?auto_651691 ) ) ( not ( = ?auto_651690 ?auto_651692 ) ) ( not ( = ?auto_651690 ?auto_651693 ) ) ( not ( = ?auto_651690 ?auto_651694 ) ) ( not ( = ?auto_651690 ?auto_651695 ) ) ( not ( = ?auto_651690 ?auto_651696 ) ) ( not ( = ?auto_651690 ?auto_651697 ) ) ( not ( = ?auto_651690 ?auto_651698 ) ) ( not ( = ?auto_651691 ?auto_651692 ) ) ( not ( = ?auto_651691 ?auto_651693 ) ) ( not ( = ?auto_651691 ?auto_651694 ) ) ( not ( = ?auto_651691 ?auto_651695 ) ) ( not ( = ?auto_651691 ?auto_651696 ) ) ( not ( = ?auto_651691 ?auto_651697 ) ) ( not ( = ?auto_651691 ?auto_651698 ) ) ( not ( = ?auto_651692 ?auto_651693 ) ) ( not ( = ?auto_651692 ?auto_651694 ) ) ( not ( = ?auto_651692 ?auto_651695 ) ) ( not ( = ?auto_651692 ?auto_651696 ) ) ( not ( = ?auto_651692 ?auto_651697 ) ) ( not ( = ?auto_651692 ?auto_651698 ) ) ( not ( = ?auto_651693 ?auto_651694 ) ) ( not ( = ?auto_651693 ?auto_651695 ) ) ( not ( = ?auto_651693 ?auto_651696 ) ) ( not ( = ?auto_651693 ?auto_651697 ) ) ( not ( = ?auto_651693 ?auto_651698 ) ) ( not ( = ?auto_651694 ?auto_651695 ) ) ( not ( = ?auto_651694 ?auto_651696 ) ) ( not ( = ?auto_651694 ?auto_651697 ) ) ( not ( = ?auto_651694 ?auto_651698 ) ) ( not ( = ?auto_651695 ?auto_651696 ) ) ( not ( = ?auto_651695 ?auto_651697 ) ) ( not ( = ?auto_651695 ?auto_651698 ) ) ( not ( = ?auto_651696 ?auto_651697 ) ) ( not ( = ?auto_651696 ?auto_651698 ) ) ( not ( = ?auto_651697 ?auto_651698 ) ) ( ON ?auto_651696 ?auto_651697 ) ( ON ?auto_651695 ?auto_651696 ) ( ON ?auto_651694 ?auto_651695 ) ( ON ?auto_651693 ?auto_651694 ) ( ON ?auto_651692 ?auto_651693 ) ( ON ?auto_651691 ?auto_651692 ) ( ON ?auto_651690 ?auto_651691 ) ( CLEAR ?auto_651688 ) ( ON ?auto_651689 ?auto_651690 ) ( CLEAR ?auto_651689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_651688 ?auto_651689 )
      ( MAKE-10PILE ?auto_651688 ?auto_651689 ?auto_651690 ?auto_651691 ?auto_651692 ?auto_651693 ?auto_651694 ?auto_651695 ?auto_651696 ?auto_651697 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_651730 - BLOCK
      ?auto_651731 - BLOCK
      ?auto_651732 - BLOCK
      ?auto_651733 - BLOCK
      ?auto_651734 - BLOCK
      ?auto_651735 - BLOCK
      ?auto_651736 - BLOCK
      ?auto_651737 - BLOCK
      ?auto_651738 - BLOCK
      ?auto_651739 - BLOCK
    )
    :vars
    (
      ?auto_651740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_651739 ?auto_651740 ) ( not ( = ?auto_651730 ?auto_651731 ) ) ( not ( = ?auto_651730 ?auto_651732 ) ) ( not ( = ?auto_651730 ?auto_651733 ) ) ( not ( = ?auto_651730 ?auto_651734 ) ) ( not ( = ?auto_651730 ?auto_651735 ) ) ( not ( = ?auto_651730 ?auto_651736 ) ) ( not ( = ?auto_651730 ?auto_651737 ) ) ( not ( = ?auto_651730 ?auto_651738 ) ) ( not ( = ?auto_651730 ?auto_651739 ) ) ( not ( = ?auto_651730 ?auto_651740 ) ) ( not ( = ?auto_651731 ?auto_651732 ) ) ( not ( = ?auto_651731 ?auto_651733 ) ) ( not ( = ?auto_651731 ?auto_651734 ) ) ( not ( = ?auto_651731 ?auto_651735 ) ) ( not ( = ?auto_651731 ?auto_651736 ) ) ( not ( = ?auto_651731 ?auto_651737 ) ) ( not ( = ?auto_651731 ?auto_651738 ) ) ( not ( = ?auto_651731 ?auto_651739 ) ) ( not ( = ?auto_651731 ?auto_651740 ) ) ( not ( = ?auto_651732 ?auto_651733 ) ) ( not ( = ?auto_651732 ?auto_651734 ) ) ( not ( = ?auto_651732 ?auto_651735 ) ) ( not ( = ?auto_651732 ?auto_651736 ) ) ( not ( = ?auto_651732 ?auto_651737 ) ) ( not ( = ?auto_651732 ?auto_651738 ) ) ( not ( = ?auto_651732 ?auto_651739 ) ) ( not ( = ?auto_651732 ?auto_651740 ) ) ( not ( = ?auto_651733 ?auto_651734 ) ) ( not ( = ?auto_651733 ?auto_651735 ) ) ( not ( = ?auto_651733 ?auto_651736 ) ) ( not ( = ?auto_651733 ?auto_651737 ) ) ( not ( = ?auto_651733 ?auto_651738 ) ) ( not ( = ?auto_651733 ?auto_651739 ) ) ( not ( = ?auto_651733 ?auto_651740 ) ) ( not ( = ?auto_651734 ?auto_651735 ) ) ( not ( = ?auto_651734 ?auto_651736 ) ) ( not ( = ?auto_651734 ?auto_651737 ) ) ( not ( = ?auto_651734 ?auto_651738 ) ) ( not ( = ?auto_651734 ?auto_651739 ) ) ( not ( = ?auto_651734 ?auto_651740 ) ) ( not ( = ?auto_651735 ?auto_651736 ) ) ( not ( = ?auto_651735 ?auto_651737 ) ) ( not ( = ?auto_651735 ?auto_651738 ) ) ( not ( = ?auto_651735 ?auto_651739 ) ) ( not ( = ?auto_651735 ?auto_651740 ) ) ( not ( = ?auto_651736 ?auto_651737 ) ) ( not ( = ?auto_651736 ?auto_651738 ) ) ( not ( = ?auto_651736 ?auto_651739 ) ) ( not ( = ?auto_651736 ?auto_651740 ) ) ( not ( = ?auto_651737 ?auto_651738 ) ) ( not ( = ?auto_651737 ?auto_651739 ) ) ( not ( = ?auto_651737 ?auto_651740 ) ) ( not ( = ?auto_651738 ?auto_651739 ) ) ( not ( = ?auto_651738 ?auto_651740 ) ) ( not ( = ?auto_651739 ?auto_651740 ) ) ( ON ?auto_651738 ?auto_651739 ) ( ON ?auto_651737 ?auto_651738 ) ( ON ?auto_651736 ?auto_651737 ) ( ON ?auto_651735 ?auto_651736 ) ( ON ?auto_651734 ?auto_651735 ) ( ON ?auto_651733 ?auto_651734 ) ( ON ?auto_651732 ?auto_651733 ) ( ON ?auto_651731 ?auto_651732 ) ( ON ?auto_651730 ?auto_651731 ) ( CLEAR ?auto_651730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_651730 )
      ( MAKE-10PILE ?auto_651730 ?auto_651731 ?auto_651732 ?auto_651733 ?auto_651734 ?auto_651735 ?auto_651736 ?auto_651737 ?auto_651738 ?auto_651739 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_651773 - BLOCK
      ?auto_651774 - BLOCK
      ?auto_651775 - BLOCK
      ?auto_651776 - BLOCK
      ?auto_651777 - BLOCK
      ?auto_651778 - BLOCK
      ?auto_651779 - BLOCK
      ?auto_651780 - BLOCK
      ?auto_651781 - BLOCK
      ?auto_651782 - BLOCK
      ?auto_651783 - BLOCK
    )
    :vars
    (
      ?auto_651784 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_651782 ) ( ON ?auto_651783 ?auto_651784 ) ( CLEAR ?auto_651783 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_651773 ) ( ON ?auto_651774 ?auto_651773 ) ( ON ?auto_651775 ?auto_651774 ) ( ON ?auto_651776 ?auto_651775 ) ( ON ?auto_651777 ?auto_651776 ) ( ON ?auto_651778 ?auto_651777 ) ( ON ?auto_651779 ?auto_651778 ) ( ON ?auto_651780 ?auto_651779 ) ( ON ?auto_651781 ?auto_651780 ) ( ON ?auto_651782 ?auto_651781 ) ( not ( = ?auto_651773 ?auto_651774 ) ) ( not ( = ?auto_651773 ?auto_651775 ) ) ( not ( = ?auto_651773 ?auto_651776 ) ) ( not ( = ?auto_651773 ?auto_651777 ) ) ( not ( = ?auto_651773 ?auto_651778 ) ) ( not ( = ?auto_651773 ?auto_651779 ) ) ( not ( = ?auto_651773 ?auto_651780 ) ) ( not ( = ?auto_651773 ?auto_651781 ) ) ( not ( = ?auto_651773 ?auto_651782 ) ) ( not ( = ?auto_651773 ?auto_651783 ) ) ( not ( = ?auto_651773 ?auto_651784 ) ) ( not ( = ?auto_651774 ?auto_651775 ) ) ( not ( = ?auto_651774 ?auto_651776 ) ) ( not ( = ?auto_651774 ?auto_651777 ) ) ( not ( = ?auto_651774 ?auto_651778 ) ) ( not ( = ?auto_651774 ?auto_651779 ) ) ( not ( = ?auto_651774 ?auto_651780 ) ) ( not ( = ?auto_651774 ?auto_651781 ) ) ( not ( = ?auto_651774 ?auto_651782 ) ) ( not ( = ?auto_651774 ?auto_651783 ) ) ( not ( = ?auto_651774 ?auto_651784 ) ) ( not ( = ?auto_651775 ?auto_651776 ) ) ( not ( = ?auto_651775 ?auto_651777 ) ) ( not ( = ?auto_651775 ?auto_651778 ) ) ( not ( = ?auto_651775 ?auto_651779 ) ) ( not ( = ?auto_651775 ?auto_651780 ) ) ( not ( = ?auto_651775 ?auto_651781 ) ) ( not ( = ?auto_651775 ?auto_651782 ) ) ( not ( = ?auto_651775 ?auto_651783 ) ) ( not ( = ?auto_651775 ?auto_651784 ) ) ( not ( = ?auto_651776 ?auto_651777 ) ) ( not ( = ?auto_651776 ?auto_651778 ) ) ( not ( = ?auto_651776 ?auto_651779 ) ) ( not ( = ?auto_651776 ?auto_651780 ) ) ( not ( = ?auto_651776 ?auto_651781 ) ) ( not ( = ?auto_651776 ?auto_651782 ) ) ( not ( = ?auto_651776 ?auto_651783 ) ) ( not ( = ?auto_651776 ?auto_651784 ) ) ( not ( = ?auto_651777 ?auto_651778 ) ) ( not ( = ?auto_651777 ?auto_651779 ) ) ( not ( = ?auto_651777 ?auto_651780 ) ) ( not ( = ?auto_651777 ?auto_651781 ) ) ( not ( = ?auto_651777 ?auto_651782 ) ) ( not ( = ?auto_651777 ?auto_651783 ) ) ( not ( = ?auto_651777 ?auto_651784 ) ) ( not ( = ?auto_651778 ?auto_651779 ) ) ( not ( = ?auto_651778 ?auto_651780 ) ) ( not ( = ?auto_651778 ?auto_651781 ) ) ( not ( = ?auto_651778 ?auto_651782 ) ) ( not ( = ?auto_651778 ?auto_651783 ) ) ( not ( = ?auto_651778 ?auto_651784 ) ) ( not ( = ?auto_651779 ?auto_651780 ) ) ( not ( = ?auto_651779 ?auto_651781 ) ) ( not ( = ?auto_651779 ?auto_651782 ) ) ( not ( = ?auto_651779 ?auto_651783 ) ) ( not ( = ?auto_651779 ?auto_651784 ) ) ( not ( = ?auto_651780 ?auto_651781 ) ) ( not ( = ?auto_651780 ?auto_651782 ) ) ( not ( = ?auto_651780 ?auto_651783 ) ) ( not ( = ?auto_651780 ?auto_651784 ) ) ( not ( = ?auto_651781 ?auto_651782 ) ) ( not ( = ?auto_651781 ?auto_651783 ) ) ( not ( = ?auto_651781 ?auto_651784 ) ) ( not ( = ?auto_651782 ?auto_651783 ) ) ( not ( = ?auto_651782 ?auto_651784 ) ) ( not ( = ?auto_651783 ?auto_651784 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_651783 ?auto_651784 )
      ( !STACK ?auto_651783 ?auto_651782 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_651819 - BLOCK
      ?auto_651820 - BLOCK
      ?auto_651821 - BLOCK
      ?auto_651822 - BLOCK
      ?auto_651823 - BLOCK
      ?auto_651824 - BLOCK
      ?auto_651825 - BLOCK
      ?auto_651826 - BLOCK
      ?auto_651827 - BLOCK
      ?auto_651828 - BLOCK
      ?auto_651829 - BLOCK
    )
    :vars
    (
      ?auto_651830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_651829 ?auto_651830 ) ( ON-TABLE ?auto_651819 ) ( ON ?auto_651820 ?auto_651819 ) ( ON ?auto_651821 ?auto_651820 ) ( ON ?auto_651822 ?auto_651821 ) ( ON ?auto_651823 ?auto_651822 ) ( ON ?auto_651824 ?auto_651823 ) ( ON ?auto_651825 ?auto_651824 ) ( ON ?auto_651826 ?auto_651825 ) ( ON ?auto_651827 ?auto_651826 ) ( not ( = ?auto_651819 ?auto_651820 ) ) ( not ( = ?auto_651819 ?auto_651821 ) ) ( not ( = ?auto_651819 ?auto_651822 ) ) ( not ( = ?auto_651819 ?auto_651823 ) ) ( not ( = ?auto_651819 ?auto_651824 ) ) ( not ( = ?auto_651819 ?auto_651825 ) ) ( not ( = ?auto_651819 ?auto_651826 ) ) ( not ( = ?auto_651819 ?auto_651827 ) ) ( not ( = ?auto_651819 ?auto_651828 ) ) ( not ( = ?auto_651819 ?auto_651829 ) ) ( not ( = ?auto_651819 ?auto_651830 ) ) ( not ( = ?auto_651820 ?auto_651821 ) ) ( not ( = ?auto_651820 ?auto_651822 ) ) ( not ( = ?auto_651820 ?auto_651823 ) ) ( not ( = ?auto_651820 ?auto_651824 ) ) ( not ( = ?auto_651820 ?auto_651825 ) ) ( not ( = ?auto_651820 ?auto_651826 ) ) ( not ( = ?auto_651820 ?auto_651827 ) ) ( not ( = ?auto_651820 ?auto_651828 ) ) ( not ( = ?auto_651820 ?auto_651829 ) ) ( not ( = ?auto_651820 ?auto_651830 ) ) ( not ( = ?auto_651821 ?auto_651822 ) ) ( not ( = ?auto_651821 ?auto_651823 ) ) ( not ( = ?auto_651821 ?auto_651824 ) ) ( not ( = ?auto_651821 ?auto_651825 ) ) ( not ( = ?auto_651821 ?auto_651826 ) ) ( not ( = ?auto_651821 ?auto_651827 ) ) ( not ( = ?auto_651821 ?auto_651828 ) ) ( not ( = ?auto_651821 ?auto_651829 ) ) ( not ( = ?auto_651821 ?auto_651830 ) ) ( not ( = ?auto_651822 ?auto_651823 ) ) ( not ( = ?auto_651822 ?auto_651824 ) ) ( not ( = ?auto_651822 ?auto_651825 ) ) ( not ( = ?auto_651822 ?auto_651826 ) ) ( not ( = ?auto_651822 ?auto_651827 ) ) ( not ( = ?auto_651822 ?auto_651828 ) ) ( not ( = ?auto_651822 ?auto_651829 ) ) ( not ( = ?auto_651822 ?auto_651830 ) ) ( not ( = ?auto_651823 ?auto_651824 ) ) ( not ( = ?auto_651823 ?auto_651825 ) ) ( not ( = ?auto_651823 ?auto_651826 ) ) ( not ( = ?auto_651823 ?auto_651827 ) ) ( not ( = ?auto_651823 ?auto_651828 ) ) ( not ( = ?auto_651823 ?auto_651829 ) ) ( not ( = ?auto_651823 ?auto_651830 ) ) ( not ( = ?auto_651824 ?auto_651825 ) ) ( not ( = ?auto_651824 ?auto_651826 ) ) ( not ( = ?auto_651824 ?auto_651827 ) ) ( not ( = ?auto_651824 ?auto_651828 ) ) ( not ( = ?auto_651824 ?auto_651829 ) ) ( not ( = ?auto_651824 ?auto_651830 ) ) ( not ( = ?auto_651825 ?auto_651826 ) ) ( not ( = ?auto_651825 ?auto_651827 ) ) ( not ( = ?auto_651825 ?auto_651828 ) ) ( not ( = ?auto_651825 ?auto_651829 ) ) ( not ( = ?auto_651825 ?auto_651830 ) ) ( not ( = ?auto_651826 ?auto_651827 ) ) ( not ( = ?auto_651826 ?auto_651828 ) ) ( not ( = ?auto_651826 ?auto_651829 ) ) ( not ( = ?auto_651826 ?auto_651830 ) ) ( not ( = ?auto_651827 ?auto_651828 ) ) ( not ( = ?auto_651827 ?auto_651829 ) ) ( not ( = ?auto_651827 ?auto_651830 ) ) ( not ( = ?auto_651828 ?auto_651829 ) ) ( not ( = ?auto_651828 ?auto_651830 ) ) ( not ( = ?auto_651829 ?auto_651830 ) ) ( CLEAR ?auto_651827 ) ( ON ?auto_651828 ?auto_651829 ) ( CLEAR ?auto_651828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_651819 ?auto_651820 ?auto_651821 ?auto_651822 ?auto_651823 ?auto_651824 ?auto_651825 ?auto_651826 ?auto_651827 ?auto_651828 )
      ( MAKE-11PILE ?auto_651819 ?auto_651820 ?auto_651821 ?auto_651822 ?auto_651823 ?auto_651824 ?auto_651825 ?auto_651826 ?auto_651827 ?auto_651828 ?auto_651829 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_651865 - BLOCK
      ?auto_651866 - BLOCK
      ?auto_651867 - BLOCK
      ?auto_651868 - BLOCK
      ?auto_651869 - BLOCK
      ?auto_651870 - BLOCK
      ?auto_651871 - BLOCK
      ?auto_651872 - BLOCK
      ?auto_651873 - BLOCK
      ?auto_651874 - BLOCK
      ?auto_651875 - BLOCK
    )
    :vars
    (
      ?auto_651876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_651875 ?auto_651876 ) ( ON-TABLE ?auto_651865 ) ( ON ?auto_651866 ?auto_651865 ) ( ON ?auto_651867 ?auto_651866 ) ( ON ?auto_651868 ?auto_651867 ) ( ON ?auto_651869 ?auto_651868 ) ( ON ?auto_651870 ?auto_651869 ) ( ON ?auto_651871 ?auto_651870 ) ( ON ?auto_651872 ?auto_651871 ) ( not ( = ?auto_651865 ?auto_651866 ) ) ( not ( = ?auto_651865 ?auto_651867 ) ) ( not ( = ?auto_651865 ?auto_651868 ) ) ( not ( = ?auto_651865 ?auto_651869 ) ) ( not ( = ?auto_651865 ?auto_651870 ) ) ( not ( = ?auto_651865 ?auto_651871 ) ) ( not ( = ?auto_651865 ?auto_651872 ) ) ( not ( = ?auto_651865 ?auto_651873 ) ) ( not ( = ?auto_651865 ?auto_651874 ) ) ( not ( = ?auto_651865 ?auto_651875 ) ) ( not ( = ?auto_651865 ?auto_651876 ) ) ( not ( = ?auto_651866 ?auto_651867 ) ) ( not ( = ?auto_651866 ?auto_651868 ) ) ( not ( = ?auto_651866 ?auto_651869 ) ) ( not ( = ?auto_651866 ?auto_651870 ) ) ( not ( = ?auto_651866 ?auto_651871 ) ) ( not ( = ?auto_651866 ?auto_651872 ) ) ( not ( = ?auto_651866 ?auto_651873 ) ) ( not ( = ?auto_651866 ?auto_651874 ) ) ( not ( = ?auto_651866 ?auto_651875 ) ) ( not ( = ?auto_651866 ?auto_651876 ) ) ( not ( = ?auto_651867 ?auto_651868 ) ) ( not ( = ?auto_651867 ?auto_651869 ) ) ( not ( = ?auto_651867 ?auto_651870 ) ) ( not ( = ?auto_651867 ?auto_651871 ) ) ( not ( = ?auto_651867 ?auto_651872 ) ) ( not ( = ?auto_651867 ?auto_651873 ) ) ( not ( = ?auto_651867 ?auto_651874 ) ) ( not ( = ?auto_651867 ?auto_651875 ) ) ( not ( = ?auto_651867 ?auto_651876 ) ) ( not ( = ?auto_651868 ?auto_651869 ) ) ( not ( = ?auto_651868 ?auto_651870 ) ) ( not ( = ?auto_651868 ?auto_651871 ) ) ( not ( = ?auto_651868 ?auto_651872 ) ) ( not ( = ?auto_651868 ?auto_651873 ) ) ( not ( = ?auto_651868 ?auto_651874 ) ) ( not ( = ?auto_651868 ?auto_651875 ) ) ( not ( = ?auto_651868 ?auto_651876 ) ) ( not ( = ?auto_651869 ?auto_651870 ) ) ( not ( = ?auto_651869 ?auto_651871 ) ) ( not ( = ?auto_651869 ?auto_651872 ) ) ( not ( = ?auto_651869 ?auto_651873 ) ) ( not ( = ?auto_651869 ?auto_651874 ) ) ( not ( = ?auto_651869 ?auto_651875 ) ) ( not ( = ?auto_651869 ?auto_651876 ) ) ( not ( = ?auto_651870 ?auto_651871 ) ) ( not ( = ?auto_651870 ?auto_651872 ) ) ( not ( = ?auto_651870 ?auto_651873 ) ) ( not ( = ?auto_651870 ?auto_651874 ) ) ( not ( = ?auto_651870 ?auto_651875 ) ) ( not ( = ?auto_651870 ?auto_651876 ) ) ( not ( = ?auto_651871 ?auto_651872 ) ) ( not ( = ?auto_651871 ?auto_651873 ) ) ( not ( = ?auto_651871 ?auto_651874 ) ) ( not ( = ?auto_651871 ?auto_651875 ) ) ( not ( = ?auto_651871 ?auto_651876 ) ) ( not ( = ?auto_651872 ?auto_651873 ) ) ( not ( = ?auto_651872 ?auto_651874 ) ) ( not ( = ?auto_651872 ?auto_651875 ) ) ( not ( = ?auto_651872 ?auto_651876 ) ) ( not ( = ?auto_651873 ?auto_651874 ) ) ( not ( = ?auto_651873 ?auto_651875 ) ) ( not ( = ?auto_651873 ?auto_651876 ) ) ( not ( = ?auto_651874 ?auto_651875 ) ) ( not ( = ?auto_651874 ?auto_651876 ) ) ( not ( = ?auto_651875 ?auto_651876 ) ) ( ON ?auto_651874 ?auto_651875 ) ( CLEAR ?auto_651872 ) ( ON ?auto_651873 ?auto_651874 ) ( CLEAR ?auto_651873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_651865 ?auto_651866 ?auto_651867 ?auto_651868 ?auto_651869 ?auto_651870 ?auto_651871 ?auto_651872 ?auto_651873 )
      ( MAKE-11PILE ?auto_651865 ?auto_651866 ?auto_651867 ?auto_651868 ?auto_651869 ?auto_651870 ?auto_651871 ?auto_651872 ?auto_651873 ?auto_651874 ?auto_651875 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_651911 - BLOCK
      ?auto_651912 - BLOCK
      ?auto_651913 - BLOCK
      ?auto_651914 - BLOCK
      ?auto_651915 - BLOCK
      ?auto_651916 - BLOCK
      ?auto_651917 - BLOCK
      ?auto_651918 - BLOCK
      ?auto_651919 - BLOCK
      ?auto_651920 - BLOCK
      ?auto_651921 - BLOCK
    )
    :vars
    (
      ?auto_651922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_651921 ?auto_651922 ) ( ON-TABLE ?auto_651911 ) ( ON ?auto_651912 ?auto_651911 ) ( ON ?auto_651913 ?auto_651912 ) ( ON ?auto_651914 ?auto_651913 ) ( ON ?auto_651915 ?auto_651914 ) ( ON ?auto_651916 ?auto_651915 ) ( ON ?auto_651917 ?auto_651916 ) ( not ( = ?auto_651911 ?auto_651912 ) ) ( not ( = ?auto_651911 ?auto_651913 ) ) ( not ( = ?auto_651911 ?auto_651914 ) ) ( not ( = ?auto_651911 ?auto_651915 ) ) ( not ( = ?auto_651911 ?auto_651916 ) ) ( not ( = ?auto_651911 ?auto_651917 ) ) ( not ( = ?auto_651911 ?auto_651918 ) ) ( not ( = ?auto_651911 ?auto_651919 ) ) ( not ( = ?auto_651911 ?auto_651920 ) ) ( not ( = ?auto_651911 ?auto_651921 ) ) ( not ( = ?auto_651911 ?auto_651922 ) ) ( not ( = ?auto_651912 ?auto_651913 ) ) ( not ( = ?auto_651912 ?auto_651914 ) ) ( not ( = ?auto_651912 ?auto_651915 ) ) ( not ( = ?auto_651912 ?auto_651916 ) ) ( not ( = ?auto_651912 ?auto_651917 ) ) ( not ( = ?auto_651912 ?auto_651918 ) ) ( not ( = ?auto_651912 ?auto_651919 ) ) ( not ( = ?auto_651912 ?auto_651920 ) ) ( not ( = ?auto_651912 ?auto_651921 ) ) ( not ( = ?auto_651912 ?auto_651922 ) ) ( not ( = ?auto_651913 ?auto_651914 ) ) ( not ( = ?auto_651913 ?auto_651915 ) ) ( not ( = ?auto_651913 ?auto_651916 ) ) ( not ( = ?auto_651913 ?auto_651917 ) ) ( not ( = ?auto_651913 ?auto_651918 ) ) ( not ( = ?auto_651913 ?auto_651919 ) ) ( not ( = ?auto_651913 ?auto_651920 ) ) ( not ( = ?auto_651913 ?auto_651921 ) ) ( not ( = ?auto_651913 ?auto_651922 ) ) ( not ( = ?auto_651914 ?auto_651915 ) ) ( not ( = ?auto_651914 ?auto_651916 ) ) ( not ( = ?auto_651914 ?auto_651917 ) ) ( not ( = ?auto_651914 ?auto_651918 ) ) ( not ( = ?auto_651914 ?auto_651919 ) ) ( not ( = ?auto_651914 ?auto_651920 ) ) ( not ( = ?auto_651914 ?auto_651921 ) ) ( not ( = ?auto_651914 ?auto_651922 ) ) ( not ( = ?auto_651915 ?auto_651916 ) ) ( not ( = ?auto_651915 ?auto_651917 ) ) ( not ( = ?auto_651915 ?auto_651918 ) ) ( not ( = ?auto_651915 ?auto_651919 ) ) ( not ( = ?auto_651915 ?auto_651920 ) ) ( not ( = ?auto_651915 ?auto_651921 ) ) ( not ( = ?auto_651915 ?auto_651922 ) ) ( not ( = ?auto_651916 ?auto_651917 ) ) ( not ( = ?auto_651916 ?auto_651918 ) ) ( not ( = ?auto_651916 ?auto_651919 ) ) ( not ( = ?auto_651916 ?auto_651920 ) ) ( not ( = ?auto_651916 ?auto_651921 ) ) ( not ( = ?auto_651916 ?auto_651922 ) ) ( not ( = ?auto_651917 ?auto_651918 ) ) ( not ( = ?auto_651917 ?auto_651919 ) ) ( not ( = ?auto_651917 ?auto_651920 ) ) ( not ( = ?auto_651917 ?auto_651921 ) ) ( not ( = ?auto_651917 ?auto_651922 ) ) ( not ( = ?auto_651918 ?auto_651919 ) ) ( not ( = ?auto_651918 ?auto_651920 ) ) ( not ( = ?auto_651918 ?auto_651921 ) ) ( not ( = ?auto_651918 ?auto_651922 ) ) ( not ( = ?auto_651919 ?auto_651920 ) ) ( not ( = ?auto_651919 ?auto_651921 ) ) ( not ( = ?auto_651919 ?auto_651922 ) ) ( not ( = ?auto_651920 ?auto_651921 ) ) ( not ( = ?auto_651920 ?auto_651922 ) ) ( not ( = ?auto_651921 ?auto_651922 ) ) ( ON ?auto_651920 ?auto_651921 ) ( ON ?auto_651919 ?auto_651920 ) ( CLEAR ?auto_651917 ) ( ON ?auto_651918 ?auto_651919 ) ( CLEAR ?auto_651918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_651911 ?auto_651912 ?auto_651913 ?auto_651914 ?auto_651915 ?auto_651916 ?auto_651917 ?auto_651918 )
      ( MAKE-11PILE ?auto_651911 ?auto_651912 ?auto_651913 ?auto_651914 ?auto_651915 ?auto_651916 ?auto_651917 ?auto_651918 ?auto_651919 ?auto_651920 ?auto_651921 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_651957 - BLOCK
      ?auto_651958 - BLOCK
      ?auto_651959 - BLOCK
      ?auto_651960 - BLOCK
      ?auto_651961 - BLOCK
      ?auto_651962 - BLOCK
      ?auto_651963 - BLOCK
      ?auto_651964 - BLOCK
      ?auto_651965 - BLOCK
      ?auto_651966 - BLOCK
      ?auto_651967 - BLOCK
    )
    :vars
    (
      ?auto_651968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_651967 ?auto_651968 ) ( ON-TABLE ?auto_651957 ) ( ON ?auto_651958 ?auto_651957 ) ( ON ?auto_651959 ?auto_651958 ) ( ON ?auto_651960 ?auto_651959 ) ( ON ?auto_651961 ?auto_651960 ) ( ON ?auto_651962 ?auto_651961 ) ( not ( = ?auto_651957 ?auto_651958 ) ) ( not ( = ?auto_651957 ?auto_651959 ) ) ( not ( = ?auto_651957 ?auto_651960 ) ) ( not ( = ?auto_651957 ?auto_651961 ) ) ( not ( = ?auto_651957 ?auto_651962 ) ) ( not ( = ?auto_651957 ?auto_651963 ) ) ( not ( = ?auto_651957 ?auto_651964 ) ) ( not ( = ?auto_651957 ?auto_651965 ) ) ( not ( = ?auto_651957 ?auto_651966 ) ) ( not ( = ?auto_651957 ?auto_651967 ) ) ( not ( = ?auto_651957 ?auto_651968 ) ) ( not ( = ?auto_651958 ?auto_651959 ) ) ( not ( = ?auto_651958 ?auto_651960 ) ) ( not ( = ?auto_651958 ?auto_651961 ) ) ( not ( = ?auto_651958 ?auto_651962 ) ) ( not ( = ?auto_651958 ?auto_651963 ) ) ( not ( = ?auto_651958 ?auto_651964 ) ) ( not ( = ?auto_651958 ?auto_651965 ) ) ( not ( = ?auto_651958 ?auto_651966 ) ) ( not ( = ?auto_651958 ?auto_651967 ) ) ( not ( = ?auto_651958 ?auto_651968 ) ) ( not ( = ?auto_651959 ?auto_651960 ) ) ( not ( = ?auto_651959 ?auto_651961 ) ) ( not ( = ?auto_651959 ?auto_651962 ) ) ( not ( = ?auto_651959 ?auto_651963 ) ) ( not ( = ?auto_651959 ?auto_651964 ) ) ( not ( = ?auto_651959 ?auto_651965 ) ) ( not ( = ?auto_651959 ?auto_651966 ) ) ( not ( = ?auto_651959 ?auto_651967 ) ) ( not ( = ?auto_651959 ?auto_651968 ) ) ( not ( = ?auto_651960 ?auto_651961 ) ) ( not ( = ?auto_651960 ?auto_651962 ) ) ( not ( = ?auto_651960 ?auto_651963 ) ) ( not ( = ?auto_651960 ?auto_651964 ) ) ( not ( = ?auto_651960 ?auto_651965 ) ) ( not ( = ?auto_651960 ?auto_651966 ) ) ( not ( = ?auto_651960 ?auto_651967 ) ) ( not ( = ?auto_651960 ?auto_651968 ) ) ( not ( = ?auto_651961 ?auto_651962 ) ) ( not ( = ?auto_651961 ?auto_651963 ) ) ( not ( = ?auto_651961 ?auto_651964 ) ) ( not ( = ?auto_651961 ?auto_651965 ) ) ( not ( = ?auto_651961 ?auto_651966 ) ) ( not ( = ?auto_651961 ?auto_651967 ) ) ( not ( = ?auto_651961 ?auto_651968 ) ) ( not ( = ?auto_651962 ?auto_651963 ) ) ( not ( = ?auto_651962 ?auto_651964 ) ) ( not ( = ?auto_651962 ?auto_651965 ) ) ( not ( = ?auto_651962 ?auto_651966 ) ) ( not ( = ?auto_651962 ?auto_651967 ) ) ( not ( = ?auto_651962 ?auto_651968 ) ) ( not ( = ?auto_651963 ?auto_651964 ) ) ( not ( = ?auto_651963 ?auto_651965 ) ) ( not ( = ?auto_651963 ?auto_651966 ) ) ( not ( = ?auto_651963 ?auto_651967 ) ) ( not ( = ?auto_651963 ?auto_651968 ) ) ( not ( = ?auto_651964 ?auto_651965 ) ) ( not ( = ?auto_651964 ?auto_651966 ) ) ( not ( = ?auto_651964 ?auto_651967 ) ) ( not ( = ?auto_651964 ?auto_651968 ) ) ( not ( = ?auto_651965 ?auto_651966 ) ) ( not ( = ?auto_651965 ?auto_651967 ) ) ( not ( = ?auto_651965 ?auto_651968 ) ) ( not ( = ?auto_651966 ?auto_651967 ) ) ( not ( = ?auto_651966 ?auto_651968 ) ) ( not ( = ?auto_651967 ?auto_651968 ) ) ( ON ?auto_651966 ?auto_651967 ) ( ON ?auto_651965 ?auto_651966 ) ( ON ?auto_651964 ?auto_651965 ) ( CLEAR ?auto_651962 ) ( ON ?auto_651963 ?auto_651964 ) ( CLEAR ?auto_651963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_651957 ?auto_651958 ?auto_651959 ?auto_651960 ?auto_651961 ?auto_651962 ?auto_651963 )
      ( MAKE-11PILE ?auto_651957 ?auto_651958 ?auto_651959 ?auto_651960 ?auto_651961 ?auto_651962 ?auto_651963 ?auto_651964 ?auto_651965 ?auto_651966 ?auto_651967 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_652003 - BLOCK
      ?auto_652004 - BLOCK
      ?auto_652005 - BLOCK
      ?auto_652006 - BLOCK
      ?auto_652007 - BLOCK
      ?auto_652008 - BLOCK
      ?auto_652009 - BLOCK
      ?auto_652010 - BLOCK
      ?auto_652011 - BLOCK
      ?auto_652012 - BLOCK
      ?auto_652013 - BLOCK
    )
    :vars
    (
      ?auto_652014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_652013 ?auto_652014 ) ( ON-TABLE ?auto_652003 ) ( ON ?auto_652004 ?auto_652003 ) ( ON ?auto_652005 ?auto_652004 ) ( ON ?auto_652006 ?auto_652005 ) ( ON ?auto_652007 ?auto_652006 ) ( not ( = ?auto_652003 ?auto_652004 ) ) ( not ( = ?auto_652003 ?auto_652005 ) ) ( not ( = ?auto_652003 ?auto_652006 ) ) ( not ( = ?auto_652003 ?auto_652007 ) ) ( not ( = ?auto_652003 ?auto_652008 ) ) ( not ( = ?auto_652003 ?auto_652009 ) ) ( not ( = ?auto_652003 ?auto_652010 ) ) ( not ( = ?auto_652003 ?auto_652011 ) ) ( not ( = ?auto_652003 ?auto_652012 ) ) ( not ( = ?auto_652003 ?auto_652013 ) ) ( not ( = ?auto_652003 ?auto_652014 ) ) ( not ( = ?auto_652004 ?auto_652005 ) ) ( not ( = ?auto_652004 ?auto_652006 ) ) ( not ( = ?auto_652004 ?auto_652007 ) ) ( not ( = ?auto_652004 ?auto_652008 ) ) ( not ( = ?auto_652004 ?auto_652009 ) ) ( not ( = ?auto_652004 ?auto_652010 ) ) ( not ( = ?auto_652004 ?auto_652011 ) ) ( not ( = ?auto_652004 ?auto_652012 ) ) ( not ( = ?auto_652004 ?auto_652013 ) ) ( not ( = ?auto_652004 ?auto_652014 ) ) ( not ( = ?auto_652005 ?auto_652006 ) ) ( not ( = ?auto_652005 ?auto_652007 ) ) ( not ( = ?auto_652005 ?auto_652008 ) ) ( not ( = ?auto_652005 ?auto_652009 ) ) ( not ( = ?auto_652005 ?auto_652010 ) ) ( not ( = ?auto_652005 ?auto_652011 ) ) ( not ( = ?auto_652005 ?auto_652012 ) ) ( not ( = ?auto_652005 ?auto_652013 ) ) ( not ( = ?auto_652005 ?auto_652014 ) ) ( not ( = ?auto_652006 ?auto_652007 ) ) ( not ( = ?auto_652006 ?auto_652008 ) ) ( not ( = ?auto_652006 ?auto_652009 ) ) ( not ( = ?auto_652006 ?auto_652010 ) ) ( not ( = ?auto_652006 ?auto_652011 ) ) ( not ( = ?auto_652006 ?auto_652012 ) ) ( not ( = ?auto_652006 ?auto_652013 ) ) ( not ( = ?auto_652006 ?auto_652014 ) ) ( not ( = ?auto_652007 ?auto_652008 ) ) ( not ( = ?auto_652007 ?auto_652009 ) ) ( not ( = ?auto_652007 ?auto_652010 ) ) ( not ( = ?auto_652007 ?auto_652011 ) ) ( not ( = ?auto_652007 ?auto_652012 ) ) ( not ( = ?auto_652007 ?auto_652013 ) ) ( not ( = ?auto_652007 ?auto_652014 ) ) ( not ( = ?auto_652008 ?auto_652009 ) ) ( not ( = ?auto_652008 ?auto_652010 ) ) ( not ( = ?auto_652008 ?auto_652011 ) ) ( not ( = ?auto_652008 ?auto_652012 ) ) ( not ( = ?auto_652008 ?auto_652013 ) ) ( not ( = ?auto_652008 ?auto_652014 ) ) ( not ( = ?auto_652009 ?auto_652010 ) ) ( not ( = ?auto_652009 ?auto_652011 ) ) ( not ( = ?auto_652009 ?auto_652012 ) ) ( not ( = ?auto_652009 ?auto_652013 ) ) ( not ( = ?auto_652009 ?auto_652014 ) ) ( not ( = ?auto_652010 ?auto_652011 ) ) ( not ( = ?auto_652010 ?auto_652012 ) ) ( not ( = ?auto_652010 ?auto_652013 ) ) ( not ( = ?auto_652010 ?auto_652014 ) ) ( not ( = ?auto_652011 ?auto_652012 ) ) ( not ( = ?auto_652011 ?auto_652013 ) ) ( not ( = ?auto_652011 ?auto_652014 ) ) ( not ( = ?auto_652012 ?auto_652013 ) ) ( not ( = ?auto_652012 ?auto_652014 ) ) ( not ( = ?auto_652013 ?auto_652014 ) ) ( ON ?auto_652012 ?auto_652013 ) ( ON ?auto_652011 ?auto_652012 ) ( ON ?auto_652010 ?auto_652011 ) ( ON ?auto_652009 ?auto_652010 ) ( CLEAR ?auto_652007 ) ( ON ?auto_652008 ?auto_652009 ) ( CLEAR ?auto_652008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_652003 ?auto_652004 ?auto_652005 ?auto_652006 ?auto_652007 ?auto_652008 )
      ( MAKE-11PILE ?auto_652003 ?auto_652004 ?auto_652005 ?auto_652006 ?auto_652007 ?auto_652008 ?auto_652009 ?auto_652010 ?auto_652011 ?auto_652012 ?auto_652013 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_652049 - BLOCK
      ?auto_652050 - BLOCK
      ?auto_652051 - BLOCK
      ?auto_652052 - BLOCK
      ?auto_652053 - BLOCK
      ?auto_652054 - BLOCK
      ?auto_652055 - BLOCK
      ?auto_652056 - BLOCK
      ?auto_652057 - BLOCK
      ?auto_652058 - BLOCK
      ?auto_652059 - BLOCK
    )
    :vars
    (
      ?auto_652060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_652059 ?auto_652060 ) ( ON-TABLE ?auto_652049 ) ( ON ?auto_652050 ?auto_652049 ) ( ON ?auto_652051 ?auto_652050 ) ( ON ?auto_652052 ?auto_652051 ) ( not ( = ?auto_652049 ?auto_652050 ) ) ( not ( = ?auto_652049 ?auto_652051 ) ) ( not ( = ?auto_652049 ?auto_652052 ) ) ( not ( = ?auto_652049 ?auto_652053 ) ) ( not ( = ?auto_652049 ?auto_652054 ) ) ( not ( = ?auto_652049 ?auto_652055 ) ) ( not ( = ?auto_652049 ?auto_652056 ) ) ( not ( = ?auto_652049 ?auto_652057 ) ) ( not ( = ?auto_652049 ?auto_652058 ) ) ( not ( = ?auto_652049 ?auto_652059 ) ) ( not ( = ?auto_652049 ?auto_652060 ) ) ( not ( = ?auto_652050 ?auto_652051 ) ) ( not ( = ?auto_652050 ?auto_652052 ) ) ( not ( = ?auto_652050 ?auto_652053 ) ) ( not ( = ?auto_652050 ?auto_652054 ) ) ( not ( = ?auto_652050 ?auto_652055 ) ) ( not ( = ?auto_652050 ?auto_652056 ) ) ( not ( = ?auto_652050 ?auto_652057 ) ) ( not ( = ?auto_652050 ?auto_652058 ) ) ( not ( = ?auto_652050 ?auto_652059 ) ) ( not ( = ?auto_652050 ?auto_652060 ) ) ( not ( = ?auto_652051 ?auto_652052 ) ) ( not ( = ?auto_652051 ?auto_652053 ) ) ( not ( = ?auto_652051 ?auto_652054 ) ) ( not ( = ?auto_652051 ?auto_652055 ) ) ( not ( = ?auto_652051 ?auto_652056 ) ) ( not ( = ?auto_652051 ?auto_652057 ) ) ( not ( = ?auto_652051 ?auto_652058 ) ) ( not ( = ?auto_652051 ?auto_652059 ) ) ( not ( = ?auto_652051 ?auto_652060 ) ) ( not ( = ?auto_652052 ?auto_652053 ) ) ( not ( = ?auto_652052 ?auto_652054 ) ) ( not ( = ?auto_652052 ?auto_652055 ) ) ( not ( = ?auto_652052 ?auto_652056 ) ) ( not ( = ?auto_652052 ?auto_652057 ) ) ( not ( = ?auto_652052 ?auto_652058 ) ) ( not ( = ?auto_652052 ?auto_652059 ) ) ( not ( = ?auto_652052 ?auto_652060 ) ) ( not ( = ?auto_652053 ?auto_652054 ) ) ( not ( = ?auto_652053 ?auto_652055 ) ) ( not ( = ?auto_652053 ?auto_652056 ) ) ( not ( = ?auto_652053 ?auto_652057 ) ) ( not ( = ?auto_652053 ?auto_652058 ) ) ( not ( = ?auto_652053 ?auto_652059 ) ) ( not ( = ?auto_652053 ?auto_652060 ) ) ( not ( = ?auto_652054 ?auto_652055 ) ) ( not ( = ?auto_652054 ?auto_652056 ) ) ( not ( = ?auto_652054 ?auto_652057 ) ) ( not ( = ?auto_652054 ?auto_652058 ) ) ( not ( = ?auto_652054 ?auto_652059 ) ) ( not ( = ?auto_652054 ?auto_652060 ) ) ( not ( = ?auto_652055 ?auto_652056 ) ) ( not ( = ?auto_652055 ?auto_652057 ) ) ( not ( = ?auto_652055 ?auto_652058 ) ) ( not ( = ?auto_652055 ?auto_652059 ) ) ( not ( = ?auto_652055 ?auto_652060 ) ) ( not ( = ?auto_652056 ?auto_652057 ) ) ( not ( = ?auto_652056 ?auto_652058 ) ) ( not ( = ?auto_652056 ?auto_652059 ) ) ( not ( = ?auto_652056 ?auto_652060 ) ) ( not ( = ?auto_652057 ?auto_652058 ) ) ( not ( = ?auto_652057 ?auto_652059 ) ) ( not ( = ?auto_652057 ?auto_652060 ) ) ( not ( = ?auto_652058 ?auto_652059 ) ) ( not ( = ?auto_652058 ?auto_652060 ) ) ( not ( = ?auto_652059 ?auto_652060 ) ) ( ON ?auto_652058 ?auto_652059 ) ( ON ?auto_652057 ?auto_652058 ) ( ON ?auto_652056 ?auto_652057 ) ( ON ?auto_652055 ?auto_652056 ) ( ON ?auto_652054 ?auto_652055 ) ( CLEAR ?auto_652052 ) ( ON ?auto_652053 ?auto_652054 ) ( CLEAR ?auto_652053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_652049 ?auto_652050 ?auto_652051 ?auto_652052 ?auto_652053 )
      ( MAKE-11PILE ?auto_652049 ?auto_652050 ?auto_652051 ?auto_652052 ?auto_652053 ?auto_652054 ?auto_652055 ?auto_652056 ?auto_652057 ?auto_652058 ?auto_652059 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_652095 - BLOCK
      ?auto_652096 - BLOCK
      ?auto_652097 - BLOCK
      ?auto_652098 - BLOCK
      ?auto_652099 - BLOCK
      ?auto_652100 - BLOCK
      ?auto_652101 - BLOCK
      ?auto_652102 - BLOCK
      ?auto_652103 - BLOCK
      ?auto_652104 - BLOCK
      ?auto_652105 - BLOCK
    )
    :vars
    (
      ?auto_652106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_652105 ?auto_652106 ) ( ON-TABLE ?auto_652095 ) ( ON ?auto_652096 ?auto_652095 ) ( ON ?auto_652097 ?auto_652096 ) ( not ( = ?auto_652095 ?auto_652096 ) ) ( not ( = ?auto_652095 ?auto_652097 ) ) ( not ( = ?auto_652095 ?auto_652098 ) ) ( not ( = ?auto_652095 ?auto_652099 ) ) ( not ( = ?auto_652095 ?auto_652100 ) ) ( not ( = ?auto_652095 ?auto_652101 ) ) ( not ( = ?auto_652095 ?auto_652102 ) ) ( not ( = ?auto_652095 ?auto_652103 ) ) ( not ( = ?auto_652095 ?auto_652104 ) ) ( not ( = ?auto_652095 ?auto_652105 ) ) ( not ( = ?auto_652095 ?auto_652106 ) ) ( not ( = ?auto_652096 ?auto_652097 ) ) ( not ( = ?auto_652096 ?auto_652098 ) ) ( not ( = ?auto_652096 ?auto_652099 ) ) ( not ( = ?auto_652096 ?auto_652100 ) ) ( not ( = ?auto_652096 ?auto_652101 ) ) ( not ( = ?auto_652096 ?auto_652102 ) ) ( not ( = ?auto_652096 ?auto_652103 ) ) ( not ( = ?auto_652096 ?auto_652104 ) ) ( not ( = ?auto_652096 ?auto_652105 ) ) ( not ( = ?auto_652096 ?auto_652106 ) ) ( not ( = ?auto_652097 ?auto_652098 ) ) ( not ( = ?auto_652097 ?auto_652099 ) ) ( not ( = ?auto_652097 ?auto_652100 ) ) ( not ( = ?auto_652097 ?auto_652101 ) ) ( not ( = ?auto_652097 ?auto_652102 ) ) ( not ( = ?auto_652097 ?auto_652103 ) ) ( not ( = ?auto_652097 ?auto_652104 ) ) ( not ( = ?auto_652097 ?auto_652105 ) ) ( not ( = ?auto_652097 ?auto_652106 ) ) ( not ( = ?auto_652098 ?auto_652099 ) ) ( not ( = ?auto_652098 ?auto_652100 ) ) ( not ( = ?auto_652098 ?auto_652101 ) ) ( not ( = ?auto_652098 ?auto_652102 ) ) ( not ( = ?auto_652098 ?auto_652103 ) ) ( not ( = ?auto_652098 ?auto_652104 ) ) ( not ( = ?auto_652098 ?auto_652105 ) ) ( not ( = ?auto_652098 ?auto_652106 ) ) ( not ( = ?auto_652099 ?auto_652100 ) ) ( not ( = ?auto_652099 ?auto_652101 ) ) ( not ( = ?auto_652099 ?auto_652102 ) ) ( not ( = ?auto_652099 ?auto_652103 ) ) ( not ( = ?auto_652099 ?auto_652104 ) ) ( not ( = ?auto_652099 ?auto_652105 ) ) ( not ( = ?auto_652099 ?auto_652106 ) ) ( not ( = ?auto_652100 ?auto_652101 ) ) ( not ( = ?auto_652100 ?auto_652102 ) ) ( not ( = ?auto_652100 ?auto_652103 ) ) ( not ( = ?auto_652100 ?auto_652104 ) ) ( not ( = ?auto_652100 ?auto_652105 ) ) ( not ( = ?auto_652100 ?auto_652106 ) ) ( not ( = ?auto_652101 ?auto_652102 ) ) ( not ( = ?auto_652101 ?auto_652103 ) ) ( not ( = ?auto_652101 ?auto_652104 ) ) ( not ( = ?auto_652101 ?auto_652105 ) ) ( not ( = ?auto_652101 ?auto_652106 ) ) ( not ( = ?auto_652102 ?auto_652103 ) ) ( not ( = ?auto_652102 ?auto_652104 ) ) ( not ( = ?auto_652102 ?auto_652105 ) ) ( not ( = ?auto_652102 ?auto_652106 ) ) ( not ( = ?auto_652103 ?auto_652104 ) ) ( not ( = ?auto_652103 ?auto_652105 ) ) ( not ( = ?auto_652103 ?auto_652106 ) ) ( not ( = ?auto_652104 ?auto_652105 ) ) ( not ( = ?auto_652104 ?auto_652106 ) ) ( not ( = ?auto_652105 ?auto_652106 ) ) ( ON ?auto_652104 ?auto_652105 ) ( ON ?auto_652103 ?auto_652104 ) ( ON ?auto_652102 ?auto_652103 ) ( ON ?auto_652101 ?auto_652102 ) ( ON ?auto_652100 ?auto_652101 ) ( ON ?auto_652099 ?auto_652100 ) ( CLEAR ?auto_652097 ) ( ON ?auto_652098 ?auto_652099 ) ( CLEAR ?auto_652098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_652095 ?auto_652096 ?auto_652097 ?auto_652098 )
      ( MAKE-11PILE ?auto_652095 ?auto_652096 ?auto_652097 ?auto_652098 ?auto_652099 ?auto_652100 ?auto_652101 ?auto_652102 ?auto_652103 ?auto_652104 ?auto_652105 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_652141 - BLOCK
      ?auto_652142 - BLOCK
      ?auto_652143 - BLOCK
      ?auto_652144 - BLOCK
      ?auto_652145 - BLOCK
      ?auto_652146 - BLOCK
      ?auto_652147 - BLOCK
      ?auto_652148 - BLOCK
      ?auto_652149 - BLOCK
      ?auto_652150 - BLOCK
      ?auto_652151 - BLOCK
    )
    :vars
    (
      ?auto_652152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_652151 ?auto_652152 ) ( ON-TABLE ?auto_652141 ) ( ON ?auto_652142 ?auto_652141 ) ( not ( = ?auto_652141 ?auto_652142 ) ) ( not ( = ?auto_652141 ?auto_652143 ) ) ( not ( = ?auto_652141 ?auto_652144 ) ) ( not ( = ?auto_652141 ?auto_652145 ) ) ( not ( = ?auto_652141 ?auto_652146 ) ) ( not ( = ?auto_652141 ?auto_652147 ) ) ( not ( = ?auto_652141 ?auto_652148 ) ) ( not ( = ?auto_652141 ?auto_652149 ) ) ( not ( = ?auto_652141 ?auto_652150 ) ) ( not ( = ?auto_652141 ?auto_652151 ) ) ( not ( = ?auto_652141 ?auto_652152 ) ) ( not ( = ?auto_652142 ?auto_652143 ) ) ( not ( = ?auto_652142 ?auto_652144 ) ) ( not ( = ?auto_652142 ?auto_652145 ) ) ( not ( = ?auto_652142 ?auto_652146 ) ) ( not ( = ?auto_652142 ?auto_652147 ) ) ( not ( = ?auto_652142 ?auto_652148 ) ) ( not ( = ?auto_652142 ?auto_652149 ) ) ( not ( = ?auto_652142 ?auto_652150 ) ) ( not ( = ?auto_652142 ?auto_652151 ) ) ( not ( = ?auto_652142 ?auto_652152 ) ) ( not ( = ?auto_652143 ?auto_652144 ) ) ( not ( = ?auto_652143 ?auto_652145 ) ) ( not ( = ?auto_652143 ?auto_652146 ) ) ( not ( = ?auto_652143 ?auto_652147 ) ) ( not ( = ?auto_652143 ?auto_652148 ) ) ( not ( = ?auto_652143 ?auto_652149 ) ) ( not ( = ?auto_652143 ?auto_652150 ) ) ( not ( = ?auto_652143 ?auto_652151 ) ) ( not ( = ?auto_652143 ?auto_652152 ) ) ( not ( = ?auto_652144 ?auto_652145 ) ) ( not ( = ?auto_652144 ?auto_652146 ) ) ( not ( = ?auto_652144 ?auto_652147 ) ) ( not ( = ?auto_652144 ?auto_652148 ) ) ( not ( = ?auto_652144 ?auto_652149 ) ) ( not ( = ?auto_652144 ?auto_652150 ) ) ( not ( = ?auto_652144 ?auto_652151 ) ) ( not ( = ?auto_652144 ?auto_652152 ) ) ( not ( = ?auto_652145 ?auto_652146 ) ) ( not ( = ?auto_652145 ?auto_652147 ) ) ( not ( = ?auto_652145 ?auto_652148 ) ) ( not ( = ?auto_652145 ?auto_652149 ) ) ( not ( = ?auto_652145 ?auto_652150 ) ) ( not ( = ?auto_652145 ?auto_652151 ) ) ( not ( = ?auto_652145 ?auto_652152 ) ) ( not ( = ?auto_652146 ?auto_652147 ) ) ( not ( = ?auto_652146 ?auto_652148 ) ) ( not ( = ?auto_652146 ?auto_652149 ) ) ( not ( = ?auto_652146 ?auto_652150 ) ) ( not ( = ?auto_652146 ?auto_652151 ) ) ( not ( = ?auto_652146 ?auto_652152 ) ) ( not ( = ?auto_652147 ?auto_652148 ) ) ( not ( = ?auto_652147 ?auto_652149 ) ) ( not ( = ?auto_652147 ?auto_652150 ) ) ( not ( = ?auto_652147 ?auto_652151 ) ) ( not ( = ?auto_652147 ?auto_652152 ) ) ( not ( = ?auto_652148 ?auto_652149 ) ) ( not ( = ?auto_652148 ?auto_652150 ) ) ( not ( = ?auto_652148 ?auto_652151 ) ) ( not ( = ?auto_652148 ?auto_652152 ) ) ( not ( = ?auto_652149 ?auto_652150 ) ) ( not ( = ?auto_652149 ?auto_652151 ) ) ( not ( = ?auto_652149 ?auto_652152 ) ) ( not ( = ?auto_652150 ?auto_652151 ) ) ( not ( = ?auto_652150 ?auto_652152 ) ) ( not ( = ?auto_652151 ?auto_652152 ) ) ( ON ?auto_652150 ?auto_652151 ) ( ON ?auto_652149 ?auto_652150 ) ( ON ?auto_652148 ?auto_652149 ) ( ON ?auto_652147 ?auto_652148 ) ( ON ?auto_652146 ?auto_652147 ) ( ON ?auto_652145 ?auto_652146 ) ( ON ?auto_652144 ?auto_652145 ) ( CLEAR ?auto_652142 ) ( ON ?auto_652143 ?auto_652144 ) ( CLEAR ?auto_652143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_652141 ?auto_652142 ?auto_652143 )
      ( MAKE-11PILE ?auto_652141 ?auto_652142 ?auto_652143 ?auto_652144 ?auto_652145 ?auto_652146 ?auto_652147 ?auto_652148 ?auto_652149 ?auto_652150 ?auto_652151 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_652187 - BLOCK
      ?auto_652188 - BLOCK
      ?auto_652189 - BLOCK
      ?auto_652190 - BLOCK
      ?auto_652191 - BLOCK
      ?auto_652192 - BLOCK
      ?auto_652193 - BLOCK
      ?auto_652194 - BLOCK
      ?auto_652195 - BLOCK
      ?auto_652196 - BLOCK
      ?auto_652197 - BLOCK
    )
    :vars
    (
      ?auto_652198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_652197 ?auto_652198 ) ( ON-TABLE ?auto_652187 ) ( not ( = ?auto_652187 ?auto_652188 ) ) ( not ( = ?auto_652187 ?auto_652189 ) ) ( not ( = ?auto_652187 ?auto_652190 ) ) ( not ( = ?auto_652187 ?auto_652191 ) ) ( not ( = ?auto_652187 ?auto_652192 ) ) ( not ( = ?auto_652187 ?auto_652193 ) ) ( not ( = ?auto_652187 ?auto_652194 ) ) ( not ( = ?auto_652187 ?auto_652195 ) ) ( not ( = ?auto_652187 ?auto_652196 ) ) ( not ( = ?auto_652187 ?auto_652197 ) ) ( not ( = ?auto_652187 ?auto_652198 ) ) ( not ( = ?auto_652188 ?auto_652189 ) ) ( not ( = ?auto_652188 ?auto_652190 ) ) ( not ( = ?auto_652188 ?auto_652191 ) ) ( not ( = ?auto_652188 ?auto_652192 ) ) ( not ( = ?auto_652188 ?auto_652193 ) ) ( not ( = ?auto_652188 ?auto_652194 ) ) ( not ( = ?auto_652188 ?auto_652195 ) ) ( not ( = ?auto_652188 ?auto_652196 ) ) ( not ( = ?auto_652188 ?auto_652197 ) ) ( not ( = ?auto_652188 ?auto_652198 ) ) ( not ( = ?auto_652189 ?auto_652190 ) ) ( not ( = ?auto_652189 ?auto_652191 ) ) ( not ( = ?auto_652189 ?auto_652192 ) ) ( not ( = ?auto_652189 ?auto_652193 ) ) ( not ( = ?auto_652189 ?auto_652194 ) ) ( not ( = ?auto_652189 ?auto_652195 ) ) ( not ( = ?auto_652189 ?auto_652196 ) ) ( not ( = ?auto_652189 ?auto_652197 ) ) ( not ( = ?auto_652189 ?auto_652198 ) ) ( not ( = ?auto_652190 ?auto_652191 ) ) ( not ( = ?auto_652190 ?auto_652192 ) ) ( not ( = ?auto_652190 ?auto_652193 ) ) ( not ( = ?auto_652190 ?auto_652194 ) ) ( not ( = ?auto_652190 ?auto_652195 ) ) ( not ( = ?auto_652190 ?auto_652196 ) ) ( not ( = ?auto_652190 ?auto_652197 ) ) ( not ( = ?auto_652190 ?auto_652198 ) ) ( not ( = ?auto_652191 ?auto_652192 ) ) ( not ( = ?auto_652191 ?auto_652193 ) ) ( not ( = ?auto_652191 ?auto_652194 ) ) ( not ( = ?auto_652191 ?auto_652195 ) ) ( not ( = ?auto_652191 ?auto_652196 ) ) ( not ( = ?auto_652191 ?auto_652197 ) ) ( not ( = ?auto_652191 ?auto_652198 ) ) ( not ( = ?auto_652192 ?auto_652193 ) ) ( not ( = ?auto_652192 ?auto_652194 ) ) ( not ( = ?auto_652192 ?auto_652195 ) ) ( not ( = ?auto_652192 ?auto_652196 ) ) ( not ( = ?auto_652192 ?auto_652197 ) ) ( not ( = ?auto_652192 ?auto_652198 ) ) ( not ( = ?auto_652193 ?auto_652194 ) ) ( not ( = ?auto_652193 ?auto_652195 ) ) ( not ( = ?auto_652193 ?auto_652196 ) ) ( not ( = ?auto_652193 ?auto_652197 ) ) ( not ( = ?auto_652193 ?auto_652198 ) ) ( not ( = ?auto_652194 ?auto_652195 ) ) ( not ( = ?auto_652194 ?auto_652196 ) ) ( not ( = ?auto_652194 ?auto_652197 ) ) ( not ( = ?auto_652194 ?auto_652198 ) ) ( not ( = ?auto_652195 ?auto_652196 ) ) ( not ( = ?auto_652195 ?auto_652197 ) ) ( not ( = ?auto_652195 ?auto_652198 ) ) ( not ( = ?auto_652196 ?auto_652197 ) ) ( not ( = ?auto_652196 ?auto_652198 ) ) ( not ( = ?auto_652197 ?auto_652198 ) ) ( ON ?auto_652196 ?auto_652197 ) ( ON ?auto_652195 ?auto_652196 ) ( ON ?auto_652194 ?auto_652195 ) ( ON ?auto_652193 ?auto_652194 ) ( ON ?auto_652192 ?auto_652193 ) ( ON ?auto_652191 ?auto_652192 ) ( ON ?auto_652190 ?auto_652191 ) ( ON ?auto_652189 ?auto_652190 ) ( CLEAR ?auto_652187 ) ( ON ?auto_652188 ?auto_652189 ) ( CLEAR ?auto_652188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_652187 ?auto_652188 )
      ( MAKE-11PILE ?auto_652187 ?auto_652188 ?auto_652189 ?auto_652190 ?auto_652191 ?auto_652192 ?auto_652193 ?auto_652194 ?auto_652195 ?auto_652196 ?auto_652197 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_652233 - BLOCK
      ?auto_652234 - BLOCK
      ?auto_652235 - BLOCK
      ?auto_652236 - BLOCK
      ?auto_652237 - BLOCK
      ?auto_652238 - BLOCK
      ?auto_652239 - BLOCK
      ?auto_652240 - BLOCK
      ?auto_652241 - BLOCK
      ?auto_652242 - BLOCK
      ?auto_652243 - BLOCK
    )
    :vars
    (
      ?auto_652244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_652243 ?auto_652244 ) ( not ( = ?auto_652233 ?auto_652234 ) ) ( not ( = ?auto_652233 ?auto_652235 ) ) ( not ( = ?auto_652233 ?auto_652236 ) ) ( not ( = ?auto_652233 ?auto_652237 ) ) ( not ( = ?auto_652233 ?auto_652238 ) ) ( not ( = ?auto_652233 ?auto_652239 ) ) ( not ( = ?auto_652233 ?auto_652240 ) ) ( not ( = ?auto_652233 ?auto_652241 ) ) ( not ( = ?auto_652233 ?auto_652242 ) ) ( not ( = ?auto_652233 ?auto_652243 ) ) ( not ( = ?auto_652233 ?auto_652244 ) ) ( not ( = ?auto_652234 ?auto_652235 ) ) ( not ( = ?auto_652234 ?auto_652236 ) ) ( not ( = ?auto_652234 ?auto_652237 ) ) ( not ( = ?auto_652234 ?auto_652238 ) ) ( not ( = ?auto_652234 ?auto_652239 ) ) ( not ( = ?auto_652234 ?auto_652240 ) ) ( not ( = ?auto_652234 ?auto_652241 ) ) ( not ( = ?auto_652234 ?auto_652242 ) ) ( not ( = ?auto_652234 ?auto_652243 ) ) ( not ( = ?auto_652234 ?auto_652244 ) ) ( not ( = ?auto_652235 ?auto_652236 ) ) ( not ( = ?auto_652235 ?auto_652237 ) ) ( not ( = ?auto_652235 ?auto_652238 ) ) ( not ( = ?auto_652235 ?auto_652239 ) ) ( not ( = ?auto_652235 ?auto_652240 ) ) ( not ( = ?auto_652235 ?auto_652241 ) ) ( not ( = ?auto_652235 ?auto_652242 ) ) ( not ( = ?auto_652235 ?auto_652243 ) ) ( not ( = ?auto_652235 ?auto_652244 ) ) ( not ( = ?auto_652236 ?auto_652237 ) ) ( not ( = ?auto_652236 ?auto_652238 ) ) ( not ( = ?auto_652236 ?auto_652239 ) ) ( not ( = ?auto_652236 ?auto_652240 ) ) ( not ( = ?auto_652236 ?auto_652241 ) ) ( not ( = ?auto_652236 ?auto_652242 ) ) ( not ( = ?auto_652236 ?auto_652243 ) ) ( not ( = ?auto_652236 ?auto_652244 ) ) ( not ( = ?auto_652237 ?auto_652238 ) ) ( not ( = ?auto_652237 ?auto_652239 ) ) ( not ( = ?auto_652237 ?auto_652240 ) ) ( not ( = ?auto_652237 ?auto_652241 ) ) ( not ( = ?auto_652237 ?auto_652242 ) ) ( not ( = ?auto_652237 ?auto_652243 ) ) ( not ( = ?auto_652237 ?auto_652244 ) ) ( not ( = ?auto_652238 ?auto_652239 ) ) ( not ( = ?auto_652238 ?auto_652240 ) ) ( not ( = ?auto_652238 ?auto_652241 ) ) ( not ( = ?auto_652238 ?auto_652242 ) ) ( not ( = ?auto_652238 ?auto_652243 ) ) ( not ( = ?auto_652238 ?auto_652244 ) ) ( not ( = ?auto_652239 ?auto_652240 ) ) ( not ( = ?auto_652239 ?auto_652241 ) ) ( not ( = ?auto_652239 ?auto_652242 ) ) ( not ( = ?auto_652239 ?auto_652243 ) ) ( not ( = ?auto_652239 ?auto_652244 ) ) ( not ( = ?auto_652240 ?auto_652241 ) ) ( not ( = ?auto_652240 ?auto_652242 ) ) ( not ( = ?auto_652240 ?auto_652243 ) ) ( not ( = ?auto_652240 ?auto_652244 ) ) ( not ( = ?auto_652241 ?auto_652242 ) ) ( not ( = ?auto_652241 ?auto_652243 ) ) ( not ( = ?auto_652241 ?auto_652244 ) ) ( not ( = ?auto_652242 ?auto_652243 ) ) ( not ( = ?auto_652242 ?auto_652244 ) ) ( not ( = ?auto_652243 ?auto_652244 ) ) ( ON ?auto_652242 ?auto_652243 ) ( ON ?auto_652241 ?auto_652242 ) ( ON ?auto_652240 ?auto_652241 ) ( ON ?auto_652239 ?auto_652240 ) ( ON ?auto_652238 ?auto_652239 ) ( ON ?auto_652237 ?auto_652238 ) ( ON ?auto_652236 ?auto_652237 ) ( ON ?auto_652235 ?auto_652236 ) ( ON ?auto_652234 ?auto_652235 ) ( ON ?auto_652233 ?auto_652234 ) ( CLEAR ?auto_652233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_652233 )
      ( MAKE-11PILE ?auto_652233 ?auto_652234 ?auto_652235 ?auto_652236 ?auto_652237 ?auto_652238 ?auto_652239 ?auto_652240 ?auto_652241 ?auto_652242 ?auto_652243 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_652280 - BLOCK
      ?auto_652281 - BLOCK
      ?auto_652282 - BLOCK
      ?auto_652283 - BLOCK
      ?auto_652284 - BLOCK
      ?auto_652285 - BLOCK
      ?auto_652286 - BLOCK
      ?auto_652287 - BLOCK
      ?auto_652288 - BLOCK
      ?auto_652289 - BLOCK
      ?auto_652290 - BLOCK
      ?auto_652291 - BLOCK
    )
    :vars
    (
      ?auto_652292 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_652290 ) ( ON ?auto_652291 ?auto_652292 ) ( CLEAR ?auto_652291 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_652280 ) ( ON ?auto_652281 ?auto_652280 ) ( ON ?auto_652282 ?auto_652281 ) ( ON ?auto_652283 ?auto_652282 ) ( ON ?auto_652284 ?auto_652283 ) ( ON ?auto_652285 ?auto_652284 ) ( ON ?auto_652286 ?auto_652285 ) ( ON ?auto_652287 ?auto_652286 ) ( ON ?auto_652288 ?auto_652287 ) ( ON ?auto_652289 ?auto_652288 ) ( ON ?auto_652290 ?auto_652289 ) ( not ( = ?auto_652280 ?auto_652281 ) ) ( not ( = ?auto_652280 ?auto_652282 ) ) ( not ( = ?auto_652280 ?auto_652283 ) ) ( not ( = ?auto_652280 ?auto_652284 ) ) ( not ( = ?auto_652280 ?auto_652285 ) ) ( not ( = ?auto_652280 ?auto_652286 ) ) ( not ( = ?auto_652280 ?auto_652287 ) ) ( not ( = ?auto_652280 ?auto_652288 ) ) ( not ( = ?auto_652280 ?auto_652289 ) ) ( not ( = ?auto_652280 ?auto_652290 ) ) ( not ( = ?auto_652280 ?auto_652291 ) ) ( not ( = ?auto_652280 ?auto_652292 ) ) ( not ( = ?auto_652281 ?auto_652282 ) ) ( not ( = ?auto_652281 ?auto_652283 ) ) ( not ( = ?auto_652281 ?auto_652284 ) ) ( not ( = ?auto_652281 ?auto_652285 ) ) ( not ( = ?auto_652281 ?auto_652286 ) ) ( not ( = ?auto_652281 ?auto_652287 ) ) ( not ( = ?auto_652281 ?auto_652288 ) ) ( not ( = ?auto_652281 ?auto_652289 ) ) ( not ( = ?auto_652281 ?auto_652290 ) ) ( not ( = ?auto_652281 ?auto_652291 ) ) ( not ( = ?auto_652281 ?auto_652292 ) ) ( not ( = ?auto_652282 ?auto_652283 ) ) ( not ( = ?auto_652282 ?auto_652284 ) ) ( not ( = ?auto_652282 ?auto_652285 ) ) ( not ( = ?auto_652282 ?auto_652286 ) ) ( not ( = ?auto_652282 ?auto_652287 ) ) ( not ( = ?auto_652282 ?auto_652288 ) ) ( not ( = ?auto_652282 ?auto_652289 ) ) ( not ( = ?auto_652282 ?auto_652290 ) ) ( not ( = ?auto_652282 ?auto_652291 ) ) ( not ( = ?auto_652282 ?auto_652292 ) ) ( not ( = ?auto_652283 ?auto_652284 ) ) ( not ( = ?auto_652283 ?auto_652285 ) ) ( not ( = ?auto_652283 ?auto_652286 ) ) ( not ( = ?auto_652283 ?auto_652287 ) ) ( not ( = ?auto_652283 ?auto_652288 ) ) ( not ( = ?auto_652283 ?auto_652289 ) ) ( not ( = ?auto_652283 ?auto_652290 ) ) ( not ( = ?auto_652283 ?auto_652291 ) ) ( not ( = ?auto_652283 ?auto_652292 ) ) ( not ( = ?auto_652284 ?auto_652285 ) ) ( not ( = ?auto_652284 ?auto_652286 ) ) ( not ( = ?auto_652284 ?auto_652287 ) ) ( not ( = ?auto_652284 ?auto_652288 ) ) ( not ( = ?auto_652284 ?auto_652289 ) ) ( not ( = ?auto_652284 ?auto_652290 ) ) ( not ( = ?auto_652284 ?auto_652291 ) ) ( not ( = ?auto_652284 ?auto_652292 ) ) ( not ( = ?auto_652285 ?auto_652286 ) ) ( not ( = ?auto_652285 ?auto_652287 ) ) ( not ( = ?auto_652285 ?auto_652288 ) ) ( not ( = ?auto_652285 ?auto_652289 ) ) ( not ( = ?auto_652285 ?auto_652290 ) ) ( not ( = ?auto_652285 ?auto_652291 ) ) ( not ( = ?auto_652285 ?auto_652292 ) ) ( not ( = ?auto_652286 ?auto_652287 ) ) ( not ( = ?auto_652286 ?auto_652288 ) ) ( not ( = ?auto_652286 ?auto_652289 ) ) ( not ( = ?auto_652286 ?auto_652290 ) ) ( not ( = ?auto_652286 ?auto_652291 ) ) ( not ( = ?auto_652286 ?auto_652292 ) ) ( not ( = ?auto_652287 ?auto_652288 ) ) ( not ( = ?auto_652287 ?auto_652289 ) ) ( not ( = ?auto_652287 ?auto_652290 ) ) ( not ( = ?auto_652287 ?auto_652291 ) ) ( not ( = ?auto_652287 ?auto_652292 ) ) ( not ( = ?auto_652288 ?auto_652289 ) ) ( not ( = ?auto_652288 ?auto_652290 ) ) ( not ( = ?auto_652288 ?auto_652291 ) ) ( not ( = ?auto_652288 ?auto_652292 ) ) ( not ( = ?auto_652289 ?auto_652290 ) ) ( not ( = ?auto_652289 ?auto_652291 ) ) ( not ( = ?auto_652289 ?auto_652292 ) ) ( not ( = ?auto_652290 ?auto_652291 ) ) ( not ( = ?auto_652290 ?auto_652292 ) ) ( not ( = ?auto_652291 ?auto_652292 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_652291 ?auto_652292 )
      ( !STACK ?auto_652291 ?auto_652290 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_652330 - BLOCK
      ?auto_652331 - BLOCK
      ?auto_652332 - BLOCK
      ?auto_652333 - BLOCK
      ?auto_652334 - BLOCK
      ?auto_652335 - BLOCK
      ?auto_652336 - BLOCK
      ?auto_652337 - BLOCK
      ?auto_652338 - BLOCK
      ?auto_652339 - BLOCK
      ?auto_652340 - BLOCK
      ?auto_652341 - BLOCK
    )
    :vars
    (
      ?auto_652342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_652341 ?auto_652342 ) ( ON-TABLE ?auto_652330 ) ( ON ?auto_652331 ?auto_652330 ) ( ON ?auto_652332 ?auto_652331 ) ( ON ?auto_652333 ?auto_652332 ) ( ON ?auto_652334 ?auto_652333 ) ( ON ?auto_652335 ?auto_652334 ) ( ON ?auto_652336 ?auto_652335 ) ( ON ?auto_652337 ?auto_652336 ) ( ON ?auto_652338 ?auto_652337 ) ( ON ?auto_652339 ?auto_652338 ) ( not ( = ?auto_652330 ?auto_652331 ) ) ( not ( = ?auto_652330 ?auto_652332 ) ) ( not ( = ?auto_652330 ?auto_652333 ) ) ( not ( = ?auto_652330 ?auto_652334 ) ) ( not ( = ?auto_652330 ?auto_652335 ) ) ( not ( = ?auto_652330 ?auto_652336 ) ) ( not ( = ?auto_652330 ?auto_652337 ) ) ( not ( = ?auto_652330 ?auto_652338 ) ) ( not ( = ?auto_652330 ?auto_652339 ) ) ( not ( = ?auto_652330 ?auto_652340 ) ) ( not ( = ?auto_652330 ?auto_652341 ) ) ( not ( = ?auto_652330 ?auto_652342 ) ) ( not ( = ?auto_652331 ?auto_652332 ) ) ( not ( = ?auto_652331 ?auto_652333 ) ) ( not ( = ?auto_652331 ?auto_652334 ) ) ( not ( = ?auto_652331 ?auto_652335 ) ) ( not ( = ?auto_652331 ?auto_652336 ) ) ( not ( = ?auto_652331 ?auto_652337 ) ) ( not ( = ?auto_652331 ?auto_652338 ) ) ( not ( = ?auto_652331 ?auto_652339 ) ) ( not ( = ?auto_652331 ?auto_652340 ) ) ( not ( = ?auto_652331 ?auto_652341 ) ) ( not ( = ?auto_652331 ?auto_652342 ) ) ( not ( = ?auto_652332 ?auto_652333 ) ) ( not ( = ?auto_652332 ?auto_652334 ) ) ( not ( = ?auto_652332 ?auto_652335 ) ) ( not ( = ?auto_652332 ?auto_652336 ) ) ( not ( = ?auto_652332 ?auto_652337 ) ) ( not ( = ?auto_652332 ?auto_652338 ) ) ( not ( = ?auto_652332 ?auto_652339 ) ) ( not ( = ?auto_652332 ?auto_652340 ) ) ( not ( = ?auto_652332 ?auto_652341 ) ) ( not ( = ?auto_652332 ?auto_652342 ) ) ( not ( = ?auto_652333 ?auto_652334 ) ) ( not ( = ?auto_652333 ?auto_652335 ) ) ( not ( = ?auto_652333 ?auto_652336 ) ) ( not ( = ?auto_652333 ?auto_652337 ) ) ( not ( = ?auto_652333 ?auto_652338 ) ) ( not ( = ?auto_652333 ?auto_652339 ) ) ( not ( = ?auto_652333 ?auto_652340 ) ) ( not ( = ?auto_652333 ?auto_652341 ) ) ( not ( = ?auto_652333 ?auto_652342 ) ) ( not ( = ?auto_652334 ?auto_652335 ) ) ( not ( = ?auto_652334 ?auto_652336 ) ) ( not ( = ?auto_652334 ?auto_652337 ) ) ( not ( = ?auto_652334 ?auto_652338 ) ) ( not ( = ?auto_652334 ?auto_652339 ) ) ( not ( = ?auto_652334 ?auto_652340 ) ) ( not ( = ?auto_652334 ?auto_652341 ) ) ( not ( = ?auto_652334 ?auto_652342 ) ) ( not ( = ?auto_652335 ?auto_652336 ) ) ( not ( = ?auto_652335 ?auto_652337 ) ) ( not ( = ?auto_652335 ?auto_652338 ) ) ( not ( = ?auto_652335 ?auto_652339 ) ) ( not ( = ?auto_652335 ?auto_652340 ) ) ( not ( = ?auto_652335 ?auto_652341 ) ) ( not ( = ?auto_652335 ?auto_652342 ) ) ( not ( = ?auto_652336 ?auto_652337 ) ) ( not ( = ?auto_652336 ?auto_652338 ) ) ( not ( = ?auto_652336 ?auto_652339 ) ) ( not ( = ?auto_652336 ?auto_652340 ) ) ( not ( = ?auto_652336 ?auto_652341 ) ) ( not ( = ?auto_652336 ?auto_652342 ) ) ( not ( = ?auto_652337 ?auto_652338 ) ) ( not ( = ?auto_652337 ?auto_652339 ) ) ( not ( = ?auto_652337 ?auto_652340 ) ) ( not ( = ?auto_652337 ?auto_652341 ) ) ( not ( = ?auto_652337 ?auto_652342 ) ) ( not ( = ?auto_652338 ?auto_652339 ) ) ( not ( = ?auto_652338 ?auto_652340 ) ) ( not ( = ?auto_652338 ?auto_652341 ) ) ( not ( = ?auto_652338 ?auto_652342 ) ) ( not ( = ?auto_652339 ?auto_652340 ) ) ( not ( = ?auto_652339 ?auto_652341 ) ) ( not ( = ?auto_652339 ?auto_652342 ) ) ( not ( = ?auto_652340 ?auto_652341 ) ) ( not ( = ?auto_652340 ?auto_652342 ) ) ( not ( = ?auto_652341 ?auto_652342 ) ) ( CLEAR ?auto_652339 ) ( ON ?auto_652340 ?auto_652341 ) ( CLEAR ?auto_652340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_652330 ?auto_652331 ?auto_652332 ?auto_652333 ?auto_652334 ?auto_652335 ?auto_652336 ?auto_652337 ?auto_652338 ?auto_652339 ?auto_652340 )
      ( MAKE-12PILE ?auto_652330 ?auto_652331 ?auto_652332 ?auto_652333 ?auto_652334 ?auto_652335 ?auto_652336 ?auto_652337 ?auto_652338 ?auto_652339 ?auto_652340 ?auto_652341 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_652380 - BLOCK
      ?auto_652381 - BLOCK
      ?auto_652382 - BLOCK
      ?auto_652383 - BLOCK
      ?auto_652384 - BLOCK
      ?auto_652385 - BLOCK
      ?auto_652386 - BLOCK
      ?auto_652387 - BLOCK
      ?auto_652388 - BLOCK
      ?auto_652389 - BLOCK
      ?auto_652390 - BLOCK
      ?auto_652391 - BLOCK
    )
    :vars
    (
      ?auto_652392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_652391 ?auto_652392 ) ( ON-TABLE ?auto_652380 ) ( ON ?auto_652381 ?auto_652380 ) ( ON ?auto_652382 ?auto_652381 ) ( ON ?auto_652383 ?auto_652382 ) ( ON ?auto_652384 ?auto_652383 ) ( ON ?auto_652385 ?auto_652384 ) ( ON ?auto_652386 ?auto_652385 ) ( ON ?auto_652387 ?auto_652386 ) ( ON ?auto_652388 ?auto_652387 ) ( not ( = ?auto_652380 ?auto_652381 ) ) ( not ( = ?auto_652380 ?auto_652382 ) ) ( not ( = ?auto_652380 ?auto_652383 ) ) ( not ( = ?auto_652380 ?auto_652384 ) ) ( not ( = ?auto_652380 ?auto_652385 ) ) ( not ( = ?auto_652380 ?auto_652386 ) ) ( not ( = ?auto_652380 ?auto_652387 ) ) ( not ( = ?auto_652380 ?auto_652388 ) ) ( not ( = ?auto_652380 ?auto_652389 ) ) ( not ( = ?auto_652380 ?auto_652390 ) ) ( not ( = ?auto_652380 ?auto_652391 ) ) ( not ( = ?auto_652380 ?auto_652392 ) ) ( not ( = ?auto_652381 ?auto_652382 ) ) ( not ( = ?auto_652381 ?auto_652383 ) ) ( not ( = ?auto_652381 ?auto_652384 ) ) ( not ( = ?auto_652381 ?auto_652385 ) ) ( not ( = ?auto_652381 ?auto_652386 ) ) ( not ( = ?auto_652381 ?auto_652387 ) ) ( not ( = ?auto_652381 ?auto_652388 ) ) ( not ( = ?auto_652381 ?auto_652389 ) ) ( not ( = ?auto_652381 ?auto_652390 ) ) ( not ( = ?auto_652381 ?auto_652391 ) ) ( not ( = ?auto_652381 ?auto_652392 ) ) ( not ( = ?auto_652382 ?auto_652383 ) ) ( not ( = ?auto_652382 ?auto_652384 ) ) ( not ( = ?auto_652382 ?auto_652385 ) ) ( not ( = ?auto_652382 ?auto_652386 ) ) ( not ( = ?auto_652382 ?auto_652387 ) ) ( not ( = ?auto_652382 ?auto_652388 ) ) ( not ( = ?auto_652382 ?auto_652389 ) ) ( not ( = ?auto_652382 ?auto_652390 ) ) ( not ( = ?auto_652382 ?auto_652391 ) ) ( not ( = ?auto_652382 ?auto_652392 ) ) ( not ( = ?auto_652383 ?auto_652384 ) ) ( not ( = ?auto_652383 ?auto_652385 ) ) ( not ( = ?auto_652383 ?auto_652386 ) ) ( not ( = ?auto_652383 ?auto_652387 ) ) ( not ( = ?auto_652383 ?auto_652388 ) ) ( not ( = ?auto_652383 ?auto_652389 ) ) ( not ( = ?auto_652383 ?auto_652390 ) ) ( not ( = ?auto_652383 ?auto_652391 ) ) ( not ( = ?auto_652383 ?auto_652392 ) ) ( not ( = ?auto_652384 ?auto_652385 ) ) ( not ( = ?auto_652384 ?auto_652386 ) ) ( not ( = ?auto_652384 ?auto_652387 ) ) ( not ( = ?auto_652384 ?auto_652388 ) ) ( not ( = ?auto_652384 ?auto_652389 ) ) ( not ( = ?auto_652384 ?auto_652390 ) ) ( not ( = ?auto_652384 ?auto_652391 ) ) ( not ( = ?auto_652384 ?auto_652392 ) ) ( not ( = ?auto_652385 ?auto_652386 ) ) ( not ( = ?auto_652385 ?auto_652387 ) ) ( not ( = ?auto_652385 ?auto_652388 ) ) ( not ( = ?auto_652385 ?auto_652389 ) ) ( not ( = ?auto_652385 ?auto_652390 ) ) ( not ( = ?auto_652385 ?auto_652391 ) ) ( not ( = ?auto_652385 ?auto_652392 ) ) ( not ( = ?auto_652386 ?auto_652387 ) ) ( not ( = ?auto_652386 ?auto_652388 ) ) ( not ( = ?auto_652386 ?auto_652389 ) ) ( not ( = ?auto_652386 ?auto_652390 ) ) ( not ( = ?auto_652386 ?auto_652391 ) ) ( not ( = ?auto_652386 ?auto_652392 ) ) ( not ( = ?auto_652387 ?auto_652388 ) ) ( not ( = ?auto_652387 ?auto_652389 ) ) ( not ( = ?auto_652387 ?auto_652390 ) ) ( not ( = ?auto_652387 ?auto_652391 ) ) ( not ( = ?auto_652387 ?auto_652392 ) ) ( not ( = ?auto_652388 ?auto_652389 ) ) ( not ( = ?auto_652388 ?auto_652390 ) ) ( not ( = ?auto_652388 ?auto_652391 ) ) ( not ( = ?auto_652388 ?auto_652392 ) ) ( not ( = ?auto_652389 ?auto_652390 ) ) ( not ( = ?auto_652389 ?auto_652391 ) ) ( not ( = ?auto_652389 ?auto_652392 ) ) ( not ( = ?auto_652390 ?auto_652391 ) ) ( not ( = ?auto_652390 ?auto_652392 ) ) ( not ( = ?auto_652391 ?auto_652392 ) ) ( ON ?auto_652390 ?auto_652391 ) ( CLEAR ?auto_652388 ) ( ON ?auto_652389 ?auto_652390 ) ( CLEAR ?auto_652389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_652380 ?auto_652381 ?auto_652382 ?auto_652383 ?auto_652384 ?auto_652385 ?auto_652386 ?auto_652387 ?auto_652388 ?auto_652389 )
      ( MAKE-12PILE ?auto_652380 ?auto_652381 ?auto_652382 ?auto_652383 ?auto_652384 ?auto_652385 ?auto_652386 ?auto_652387 ?auto_652388 ?auto_652389 ?auto_652390 ?auto_652391 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_652430 - BLOCK
      ?auto_652431 - BLOCK
      ?auto_652432 - BLOCK
      ?auto_652433 - BLOCK
      ?auto_652434 - BLOCK
      ?auto_652435 - BLOCK
      ?auto_652436 - BLOCK
      ?auto_652437 - BLOCK
      ?auto_652438 - BLOCK
      ?auto_652439 - BLOCK
      ?auto_652440 - BLOCK
      ?auto_652441 - BLOCK
    )
    :vars
    (
      ?auto_652442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_652441 ?auto_652442 ) ( ON-TABLE ?auto_652430 ) ( ON ?auto_652431 ?auto_652430 ) ( ON ?auto_652432 ?auto_652431 ) ( ON ?auto_652433 ?auto_652432 ) ( ON ?auto_652434 ?auto_652433 ) ( ON ?auto_652435 ?auto_652434 ) ( ON ?auto_652436 ?auto_652435 ) ( ON ?auto_652437 ?auto_652436 ) ( not ( = ?auto_652430 ?auto_652431 ) ) ( not ( = ?auto_652430 ?auto_652432 ) ) ( not ( = ?auto_652430 ?auto_652433 ) ) ( not ( = ?auto_652430 ?auto_652434 ) ) ( not ( = ?auto_652430 ?auto_652435 ) ) ( not ( = ?auto_652430 ?auto_652436 ) ) ( not ( = ?auto_652430 ?auto_652437 ) ) ( not ( = ?auto_652430 ?auto_652438 ) ) ( not ( = ?auto_652430 ?auto_652439 ) ) ( not ( = ?auto_652430 ?auto_652440 ) ) ( not ( = ?auto_652430 ?auto_652441 ) ) ( not ( = ?auto_652430 ?auto_652442 ) ) ( not ( = ?auto_652431 ?auto_652432 ) ) ( not ( = ?auto_652431 ?auto_652433 ) ) ( not ( = ?auto_652431 ?auto_652434 ) ) ( not ( = ?auto_652431 ?auto_652435 ) ) ( not ( = ?auto_652431 ?auto_652436 ) ) ( not ( = ?auto_652431 ?auto_652437 ) ) ( not ( = ?auto_652431 ?auto_652438 ) ) ( not ( = ?auto_652431 ?auto_652439 ) ) ( not ( = ?auto_652431 ?auto_652440 ) ) ( not ( = ?auto_652431 ?auto_652441 ) ) ( not ( = ?auto_652431 ?auto_652442 ) ) ( not ( = ?auto_652432 ?auto_652433 ) ) ( not ( = ?auto_652432 ?auto_652434 ) ) ( not ( = ?auto_652432 ?auto_652435 ) ) ( not ( = ?auto_652432 ?auto_652436 ) ) ( not ( = ?auto_652432 ?auto_652437 ) ) ( not ( = ?auto_652432 ?auto_652438 ) ) ( not ( = ?auto_652432 ?auto_652439 ) ) ( not ( = ?auto_652432 ?auto_652440 ) ) ( not ( = ?auto_652432 ?auto_652441 ) ) ( not ( = ?auto_652432 ?auto_652442 ) ) ( not ( = ?auto_652433 ?auto_652434 ) ) ( not ( = ?auto_652433 ?auto_652435 ) ) ( not ( = ?auto_652433 ?auto_652436 ) ) ( not ( = ?auto_652433 ?auto_652437 ) ) ( not ( = ?auto_652433 ?auto_652438 ) ) ( not ( = ?auto_652433 ?auto_652439 ) ) ( not ( = ?auto_652433 ?auto_652440 ) ) ( not ( = ?auto_652433 ?auto_652441 ) ) ( not ( = ?auto_652433 ?auto_652442 ) ) ( not ( = ?auto_652434 ?auto_652435 ) ) ( not ( = ?auto_652434 ?auto_652436 ) ) ( not ( = ?auto_652434 ?auto_652437 ) ) ( not ( = ?auto_652434 ?auto_652438 ) ) ( not ( = ?auto_652434 ?auto_652439 ) ) ( not ( = ?auto_652434 ?auto_652440 ) ) ( not ( = ?auto_652434 ?auto_652441 ) ) ( not ( = ?auto_652434 ?auto_652442 ) ) ( not ( = ?auto_652435 ?auto_652436 ) ) ( not ( = ?auto_652435 ?auto_652437 ) ) ( not ( = ?auto_652435 ?auto_652438 ) ) ( not ( = ?auto_652435 ?auto_652439 ) ) ( not ( = ?auto_652435 ?auto_652440 ) ) ( not ( = ?auto_652435 ?auto_652441 ) ) ( not ( = ?auto_652435 ?auto_652442 ) ) ( not ( = ?auto_652436 ?auto_652437 ) ) ( not ( = ?auto_652436 ?auto_652438 ) ) ( not ( = ?auto_652436 ?auto_652439 ) ) ( not ( = ?auto_652436 ?auto_652440 ) ) ( not ( = ?auto_652436 ?auto_652441 ) ) ( not ( = ?auto_652436 ?auto_652442 ) ) ( not ( = ?auto_652437 ?auto_652438 ) ) ( not ( = ?auto_652437 ?auto_652439 ) ) ( not ( = ?auto_652437 ?auto_652440 ) ) ( not ( = ?auto_652437 ?auto_652441 ) ) ( not ( = ?auto_652437 ?auto_652442 ) ) ( not ( = ?auto_652438 ?auto_652439 ) ) ( not ( = ?auto_652438 ?auto_652440 ) ) ( not ( = ?auto_652438 ?auto_652441 ) ) ( not ( = ?auto_652438 ?auto_652442 ) ) ( not ( = ?auto_652439 ?auto_652440 ) ) ( not ( = ?auto_652439 ?auto_652441 ) ) ( not ( = ?auto_652439 ?auto_652442 ) ) ( not ( = ?auto_652440 ?auto_652441 ) ) ( not ( = ?auto_652440 ?auto_652442 ) ) ( not ( = ?auto_652441 ?auto_652442 ) ) ( ON ?auto_652440 ?auto_652441 ) ( ON ?auto_652439 ?auto_652440 ) ( CLEAR ?auto_652437 ) ( ON ?auto_652438 ?auto_652439 ) ( CLEAR ?auto_652438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_652430 ?auto_652431 ?auto_652432 ?auto_652433 ?auto_652434 ?auto_652435 ?auto_652436 ?auto_652437 ?auto_652438 )
      ( MAKE-12PILE ?auto_652430 ?auto_652431 ?auto_652432 ?auto_652433 ?auto_652434 ?auto_652435 ?auto_652436 ?auto_652437 ?auto_652438 ?auto_652439 ?auto_652440 ?auto_652441 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_652480 - BLOCK
      ?auto_652481 - BLOCK
      ?auto_652482 - BLOCK
      ?auto_652483 - BLOCK
      ?auto_652484 - BLOCK
      ?auto_652485 - BLOCK
      ?auto_652486 - BLOCK
      ?auto_652487 - BLOCK
      ?auto_652488 - BLOCK
      ?auto_652489 - BLOCK
      ?auto_652490 - BLOCK
      ?auto_652491 - BLOCK
    )
    :vars
    (
      ?auto_652492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_652491 ?auto_652492 ) ( ON-TABLE ?auto_652480 ) ( ON ?auto_652481 ?auto_652480 ) ( ON ?auto_652482 ?auto_652481 ) ( ON ?auto_652483 ?auto_652482 ) ( ON ?auto_652484 ?auto_652483 ) ( ON ?auto_652485 ?auto_652484 ) ( ON ?auto_652486 ?auto_652485 ) ( not ( = ?auto_652480 ?auto_652481 ) ) ( not ( = ?auto_652480 ?auto_652482 ) ) ( not ( = ?auto_652480 ?auto_652483 ) ) ( not ( = ?auto_652480 ?auto_652484 ) ) ( not ( = ?auto_652480 ?auto_652485 ) ) ( not ( = ?auto_652480 ?auto_652486 ) ) ( not ( = ?auto_652480 ?auto_652487 ) ) ( not ( = ?auto_652480 ?auto_652488 ) ) ( not ( = ?auto_652480 ?auto_652489 ) ) ( not ( = ?auto_652480 ?auto_652490 ) ) ( not ( = ?auto_652480 ?auto_652491 ) ) ( not ( = ?auto_652480 ?auto_652492 ) ) ( not ( = ?auto_652481 ?auto_652482 ) ) ( not ( = ?auto_652481 ?auto_652483 ) ) ( not ( = ?auto_652481 ?auto_652484 ) ) ( not ( = ?auto_652481 ?auto_652485 ) ) ( not ( = ?auto_652481 ?auto_652486 ) ) ( not ( = ?auto_652481 ?auto_652487 ) ) ( not ( = ?auto_652481 ?auto_652488 ) ) ( not ( = ?auto_652481 ?auto_652489 ) ) ( not ( = ?auto_652481 ?auto_652490 ) ) ( not ( = ?auto_652481 ?auto_652491 ) ) ( not ( = ?auto_652481 ?auto_652492 ) ) ( not ( = ?auto_652482 ?auto_652483 ) ) ( not ( = ?auto_652482 ?auto_652484 ) ) ( not ( = ?auto_652482 ?auto_652485 ) ) ( not ( = ?auto_652482 ?auto_652486 ) ) ( not ( = ?auto_652482 ?auto_652487 ) ) ( not ( = ?auto_652482 ?auto_652488 ) ) ( not ( = ?auto_652482 ?auto_652489 ) ) ( not ( = ?auto_652482 ?auto_652490 ) ) ( not ( = ?auto_652482 ?auto_652491 ) ) ( not ( = ?auto_652482 ?auto_652492 ) ) ( not ( = ?auto_652483 ?auto_652484 ) ) ( not ( = ?auto_652483 ?auto_652485 ) ) ( not ( = ?auto_652483 ?auto_652486 ) ) ( not ( = ?auto_652483 ?auto_652487 ) ) ( not ( = ?auto_652483 ?auto_652488 ) ) ( not ( = ?auto_652483 ?auto_652489 ) ) ( not ( = ?auto_652483 ?auto_652490 ) ) ( not ( = ?auto_652483 ?auto_652491 ) ) ( not ( = ?auto_652483 ?auto_652492 ) ) ( not ( = ?auto_652484 ?auto_652485 ) ) ( not ( = ?auto_652484 ?auto_652486 ) ) ( not ( = ?auto_652484 ?auto_652487 ) ) ( not ( = ?auto_652484 ?auto_652488 ) ) ( not ( = ?auto_652484 ?auto_652489 ) ) ( not ( = ?auto_652484 ?auto_652490 ) ) ( not ( = ?auto_652484 ?auto_652491 ) ) ( not ( = ?auto_652484 ?auto_652492 ) ) ( not ( = ?auto_652485 ?auto_652486 ) ) ( not ( = ?auto_652485 ?auto_652487 ) ) ( not ( = ?auto_652485 ?auto_652488 ) ) ( not ( = ?auto_652485 ?auto_652489 ) ) ( not ( = ?auto_652485 ?auto_652490 ) ) ( not ( = ?auto_652485 ?auto_652491 ) ) ( not ( = ?auto_652485 ?auto_652492 ) ) ( not ( = ?auto_652486 ?auto_652487 ) ) ( not ( = ?auto_652486 ?auto_652488 ) ) ( not ( = ?auto_652486 ?auto_652489 ) ) ( not ( = ?auto_652486 ?auto_652490 ) ) ( not ( = ?auto_652486 ?auto_652491 ) ) ( not ( = ?auto_652486 ?auto_652492 ) ) ( not ( = ?auto_652487 ?auto_652488 ) ) ( not ( = ?auto_652487 ?auto_652489 ) ) ( not ( = ?auto_652487 ?auto_652490 ) ) ( not ( = ?auto_652487 ?auto_652491 ) ) ( not ( = ?auto_652487 ?auto_652492 ) ) ( not ( = ?auto_652488 ?auto_652489 ) ) ( not ( = ?auto_652488 ?auto_652490 ) ) ( not ( = ?auto_652488 ?auto_652491 ) ) ( not ( = ?auto_652488 ?auto_652492 ) ) ( not ( = ?auto_652489 ?auto_652490 ) ) ( not ( = ?auto_652489 ?auto_652491 ) ) ( not ( = ?auto_652489 ?auto_652492 ) ) ( not ( = ?auto_652490 ?auto_652491 ) ) ( not ( = ?auto_652490 ?auto_652492 ) ) ( not ( = ?auto_652491 ?auto_652492 ) ) ( ON ?auto_652490 ?auto_652491 ) ( ON ?auto_652489 ?auto_652490 ) ( ON ?auto_652488 ?auto_652489 ) ( CLEAR ?auto_652486 ) ( ON ?auto_652487 ?auto_652488 ) ( CLEAR ?auto_652487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_652480 ?auto_652481 ?auto_652482 ?auto_652483 ?auto_652484 ?auto_652485 ?auto_652486 ?auto_652487 )
      ( MAKE-12PILE ?auto_652480 ?auto_652481 ?auto_652482 ?auto_652483 ?auto_652484 ?auto_652485 ?auto_652486 ?auto_652487 ?auto_652488 ?auto_652489 ?auto_652490 ?auto_652491 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_652530 - BLOCK
      ?auto_652531 - BLOCK
      ?auto_652532 - BLOCK
      ?auto_652533 - BLOCK
      ?auto_652534 - BLOCK
      ?auto_652535 - BLOCK
      ?auto_652536 - BLOCK
      ?auto_652537 - BLOCK
      ?auto_652538 - BLOCK
      ?auto_652539 - BLOCK
      ?auto_652540 - BLOCK
      ?auto_652541 - BLOCK
    )
    :vars
    (
      ?auto_652542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_652541 ?auto_652542 ) ( ON-TABLE ?auto_652530 ) ( ON ?auto_652531 ?auto_652530 ) ( ON ?auto_652532 ?auto_652531 ) ( ON ?auto_652533 ?auto_652532 ) ( ON ?auto_652534 ?auto_652533 ) ( ON ?auto_652535 ?auto_652534 ) ( not ( = ?auto_652530 ?auto_652531 ) ) ( not ( = ?auto_652530 ?auto_652532 ) ) ( not ( = ?auto_652530 ?auto_652533 ) ) ( not ( = ?auto_652530 ?auto_652534 ) ) ( not ( = ?auto_652530 ?auto_652535 ) ) ( not ( = ?auto_652530 ?auto_652536 ) ) ( not ( = ?auto_652530 ?auto_652537 ) ) ( not ( = ?auto_652530 ?auto_652538 ) ) ( not ( = ?auto_652530 ?auto_652539 ) ) ( not ( = ?auto_652530 ?auto_652540 ) ) ( not ( = ?auto_652530 ?auto_652541 ) ) ( not ( = ?auto_652530 ?auto_652542 ) ) ( not ( = ?auto_652531 ?auto_652532 ) ) ( not ( = ?auto_652531 ?auto_652533 ) ) ( not ( = ?auto_652531 ?auto_652534 ) ) ( not ( = ?auto_652531 ?auto_652535 ) ) ( not ( = ?auto_652531 ?auto_652536 ) ) ( not ( = ?auto_652531 ?auto_652537 ) ) ( not ( = ?auto_652531 ?auto_652538 ) ) ( not ( = ?auto_652531 ?auto_652539 ) ) ( not ( = ?auto_652531 ?auto_652540 ) ) ( not ( = ?auto_652531 ?auto_652541 ) ) ( not ( = ?auto_652531 ?auto_652542 ) ) ( not ( = ?auto_652532 ?auto_652533 ) ) ( not ( = ?auto_652532 ?auto_652534 ) ) ( not ( = ?auto_652532 ?auto_652535 ) ) ( not ( = ?auto_652532 ?auto_652536 ) ) ( not ( = ?auto_652532 ?auto_652537 ) ) ( not ( = ?auto_652532 ?auto_652538 ) ) ( not ( = ?auto_652532 ?auto_652539 ) ) ( not ( = ?auto_652532 ?auto_652540 ) ) ( not ( = ?auto_652532 ?auto_652541 ) ) ( not ( = ?auto_652532 ?auto_652542 ) ) ( not ( = ?auto_652533 ?auto_652534 ) ) ( not ( = ?auto_652533 ?auto_652535 ) ) ( not ( = ?auto_652533 ?auto_652536 ) ) ( not ( = ?auto_652533 ?auto_652537 ) ) ( not ( = ?auto_652533 ?auto_652538 ) ) ( not ( = ?auto_652533 ?auto_652539 ) ) ( not ( = ?auto_652533 ?auto_652540 ) ) ( not ( = ?auto_652533 ?auto_652541 ) ) ( not ( = ?auto_652533 ?auto_652542 ) ) ( not ( = ?auto_652534 ?auto_652535 ) ) ( not ( = ?auto_652534 ?auto_652536 ) ) ( not ( = ?auto_652534 ?auto_652537 ) ) ( not ( = ?auto_652534 ?auto_652538 ) ) ( not ( = ?auto_652534 ?auto_652539 ) ) ( not ( = ?auto_652534 ?auto_652540 ) ) ( not ( = ?auto_652534 ?auto_652541 ) ) ( not ( = ?auto_652534 ?auto_652542 ) ) ( not ( = ?auto_652535 ?auto_652536 ) ) ( not ( = ?auto_652535 ?auto_652537 ) ) ( not ( = ?auto_652535 ?auto_652538 ) ) ( not ( = ?auto_652535 ?auto_652539 ) ) ( not ( = ?auto_652535 ?auto_652540 ) ) ( not ( = ?auto_652535 ?auto_652541 ) ) ( not ( = ?auto_652535 ?auto_652542 ) ) ( not ( = ?auto_652536 ?auto_652537 ) ) ( not ( = ?auto_652536 ?auto_652538 ) ) ( not ( = ?auto_652536 ?auto_652539 ) ) ( not ( = ?auto_652536 ?auto_652540 ) ) ( not ( = ?auto_652536 ?auto_652541 ) ) ( not ( = ?auto_652536 ?auto_652542 ) ) ( not ( = ?auto_652537 ?auto_652538 ) ) ( not ( = ?auto_652537 ?auto_652539 ) ) ( not ( = ?auto_652537 ?auto_652540 ) ) ( not ( = ?auto_652537 ?auto_652541 ) ) ( not ( = ?auto_652537 ?auto_652542 ) ) ( not ( = ?auto_652538 ?auto_652539 ) ) ( not ( = ?auto_652538 ?auto_652540 ) ) ( not ( = ?auto_652538 ?auto_652541 ) ) ( not ( = ?auto_652538 ?auto_652542 ) ) ( not ( = ?auto_652539 ?auto_652540 ) ) ( not ( = ?auto_652539 ?auto_652541 ) ) ( not ( = ?auto_652539 ?auto_652542 ) ) ( not ( = ?auto_652540 ?auto_652541 ) ) ( not ( = ?auto_652540 ?auto_652542 ) ) ( not ( = ?auto_652541 ?auto_652542 ) ) ( ON ?auto_652540 ?auto_652541 ) ( ON ?auto_652539 ?auto_652540 ) ( ON ?auto_652538 ?auto_652539 ) ( ON ?auto_652537 ?auto_652538 ) ( CLEAR ?auto_652535 ) ( ON ?auto_652536 ?auto_652537 ) ( CLEAR ?auto_652536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_652530 ?auto_652531 ?auto_652532 ?auto_652533 ?auto_652534 ?auto_652535 ?auto_652536 )
      ( MAKE-12PILE ?auto_652530 ?auto_652531 ?auto_652532 ?auto_652533 ?auto_652534 ?auto_652535 ?auto_652536 ?auto_652537 ?auto_652538 ?auto_652539 ?auto_652540 ?auto_652541 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_652580 - BLOCK
      ?auto_652581 - BLOCK
      ?auto_652582 - BLOCK
      ?auto_652583 - BLOCK
      ?auto_652584 - BLOCK
      ?auto_652585 - BLOCK
      ?auto_652586 - BLOCK
      ?auto_652587 - BLOCK
      ?auto_652588 - BLOCK
      ?auto_652589 - BLOCK
      ?auto_652590 - BLOCK
      ?auto_652591 - BLOCK
    )
    :vars
    (
      ?auto_652592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_652591 ?auto_652592 ) ( ON-TABLE ?auto_652580 ) ( ON ?auto_652581 ?auto_652580 ) ( ON ?auto_652582 ?auto_652581 ) ( ON ?auto_652583 ?auto_652582 ) ( ON ?auto_652584 ?auto_652583 ) ( not ( = ?auto_652580 ?auto_652581 ) ) ( not ( = ?auto_652580 ?auto_652582 ) ) ( not ( = ?auto_652580 ?auto_652583 ) ) ( not ( = ?auto_652580 ?auto_652584 ) ) ( not ( = ?auto_652580 ?auto_652585 ) ) ( not ( = ?auto_652580 ?auto_652586 ) ) ( not ( = ?auto_652580 ?auto_652587 ) ) ( not ( = ?auto_652580 ?auto_652588 ) ) ( not ( = ?auto_652580 ?auto_652589 ) ) ( not ( = ?auto_652580 ?auto_652590 ) ) ( not ( = ?auto_652580 ?auto_652591 ) ) ( not ( = ?auto_652580 ?auto_652592 ) ) ( not ( = ?auto_652581 ?auto_652582 ) ) ( not ( = ?auto_652581 ?auto_652583 ) ) ( not ( = ?auto_652581 ?auto_652584 ) ) ( not ( = ?auto_652581 ?auto_652585 ) ) ( not ( = ?auto_652581 ?auto_652586 ) ) ( not ( = ?auto_652581 ?auto_652587 ) ) ( not ( = ?auto_652581 ?auto_652588 ) ) ( not ( = ?auto_652581 ?auto_652589 ) ) ( not ( = ?auto_652581 ?auto_652590 ) ) ( not ( = ?auto_652581 ?auto_652591 ) ) ( not ( = ?auto_652581 ?auto_652592 ) ) ( not ( = ?auto_652582 ?auto_652583 ) ) ( not ( = ?auto_652582 ?auto_652584 ) ) ( not ( = ?auto_652582 ?auto_652585 ) ) ( not ( = ?auto_652582 ?auto_652586 ) ) ( not ( = ?auto_652582 ?auto_652587 ) ) ( not ( = ?auto_652582 ?auto_652588 ) ) ( not ( = ?auto_652582 ?auto_652589 ) ) ( not ( = ?auto_652582 ?auto_652590 ) ) ( not ( = ?auto_652582 ?auto_652591 ) ) ( not ( = ?auto_652582 ?auto_652592 ) ) ( not ( = ?auto_652583 ?auto_652584 ) ) ( not ( = ?auto_652583 ?auto_652585 ) ) ( not ( = ?auto_652583 ?auto_652586 ) ) ( not ( = ?auto_652583 ?auto_652587 ) ) ( not ( = ?auto_652583 ?auto_652588 ) ) ( not ( = ?auto_652583 ?auto_652589 ) ) ( not ( = ?auto_652583 ?auto_652590 ) ) ( not ( = ?auto_652583 ?auto_652591 ) ) ( not ( = ?auto_652583 ?auto_652592 ) ) ( not ( = ?auto_652584 ?auto_652585 ) ) ( not ( = ?auto_652584 ?auto_652586 ) ) ( not ( = ?auto_652584 ?auto_652587 ) ) ( not ( = ?auto_652584 ?auto_652588 ) ) ( not ( = ?auto_652584 ?auto_652589 ) ) ( not ( = ?auto_652584 ?auto_652590 ) ) ( not ( = ?auto_652584 ?auto_652591 ) ) ( not ( = ?auto_652584 ?auto_652592 ) ) ( not ( = ?auto_652585 ?auto_652586 ) ) ( not ( = ?auto_652585 ?auto_652587 ) ) ( not ( = ?auto_652585 ?auto_652588 ) ) ( not ( = ?auto_652585 ?auto_652589 ) ) ( not ( = ?auto_652585 ?auto_652590 ) ) ( not ( = ?auto_652585 ?auto_652591 ) ) ( not ( = ?auto_652585 ?auto_652592 ) ) ( not ( = ?auto_652586 ?auto_652587 ) ) ( not ( = ?auto_652586 ?auto_652588 ) ) ( not ( = ?auto_652586 ?auto_652589 ) ) ( not ( = ?auto_652586 ?auto_652590 ) ) ( not ( = ?auto_652586 ?auto_652591 ) ) ( not ( = ?auto_652586 ?auto_652592 ) ) ( not ( = ?auto_652587 ?auto_652588 ) ) ( not ( = ?auto_652587 ?auto_652589 ) ) ( not ( = ?auto_652587 ?auto_652590 ) ) ( not ( = ?auto_652587 ?auto_652591 ) ) ( not ( = ?auto_652587 ?auto_652592 ) ) ( not ( = ?auto_652588 ?auto_652589 ) ) ( not ( = ?auto_652588 ?auto_652590 ) ) ( not ( = ?auto_652588 ?auto_652591 ) ) ( not ( = ?auto_652588 ?auto_652592 ) ) ( not ( = ?auto_652589 ?auto_652590 ) ) ( not ( = ?auto_652589 ?auto_652591 ) ) ( not ( = ?auto_652589 ?auto_652592 ) ) ( not ( = ?auto_652590 ?auto_652591 ) ) ( not ( = ?auto_652590 ?auto_652592 ) ) ( not ( = ?auto_652591 ?auto_652592 ) ) ( ON ?auto_652590 ?auto_652591 ) ( ON ?auto_652589 ?auto_652590 ) ( ON ?auto_652588 ?auto_652589 ) ( ON ?auto_652587 ?auto_652588 ) ( ON ?auto_652586 ?auto_652587 ) ( CLEAR ?auto_652584 ) ( ON ?auto_652585 ?auto_652586 ) ( CLEAR ?auto_652585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_652580 ?auto_652581 ?auto_652582 ?auto_652583 ?auto_652584 ?auto_652585 )
      ( MAKE-12PILE ?auto_652580 ?auto_652581 ?auto_652582 ?auto_652583 ?auto_652584 ?auto_652585 ?auto_652586 ?auto_652587 ?auto_652588 ?auto_652589 ?auto_652590 ?auto_652591 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_652630 - BLOCK
      ?auto_652631 - BLOCK
      ?auto_652632 - BLOCK
      ?auto_652633 - BLOCK
      ?auto_652634 - BLOCK
      ?auto_652635 - BLOCK
      ?auto_652636 - BLOCK
      ?auto_652637 - BLOCK
      ?auto_652638 - BLOCK
      ?auto_652639 - BLOCK
      ?auto_652640 - BLOCK
      ?auto_652641 - BLOCK
    )
    :vars
    (
      ?auto_652642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_652641 ?auto_652642 ) ( ON-TABLE ?auto_652630 ) ( ON ?auto_652631 ?auto_652630 ) ( ON ?auto_652632 ?auto_652631 ) ( ON ?auto_652633 ?auto_652632 ) ( not ( = ?auto_652630 ?auto_652631 ) ) ( not ( = ?auto_652630 ?auto_652632 ) ) ( not ( = ?auto_652630 ?auto_652633 ) ) ( not ( = ?auto_652630 ?auto_652634 ) ) ( not ( = ?auto_652630 ?auto_652635 ) ) ( not ( = ?auto_652630 ?auto_652636 ) ) ( not ( = ?auto_652630 ?auto_652637 ) ) ( not ( = ?auto_652630 ?auto_652638 ) ) ( not ( = ?auto_652630 ?auto_652639 ) ) ( not ( = ?auto_652630 ?auto_652640 ) ) ( not ( = ?auto_652630 ?auto_652641 ) ) ( not ( = ?auto_652630 ?auto_652642 ) ) ( not ( = ?auto_652631 ?auto_652632 ) ) ( not ( = ?auto_652631 ?auto_652633 ) ) ( not ( = ?auto_652631 ?auto_652634 ) ) ( not ( = ?auto_652631 ?auto_652635 ) ) ( not ( = ?auto_652631 ?auto_652636 ) ) ( not ( = ?auto_652631 ?auto_652637 ) ) ( not ( = ?auto_652631 ?auto_652638 ) ) ( not ( = ?auto_652631 ?auto_652639 ) ) ( not ( = ?auto_652631 ?auto_652640 ) ) ( not ( = ?auto_652631 ?auto_652641 ) ) ( not ( = ?auto_652631 ?auto_652642 ) ) ( not ( = ?auto_652632 ?auto_652633 ) ) ( not ( = ?auto_652632 ?auto_652634 ) ) ( not ( = ?auto_652632 ?auto_652635 ) ) ( not ( = ?auto_652632 ?auto_652636 ) ) ( not ( = ?auto_652632 ?auto_652637 ) ) ( not ( = ?auto_652632 ?auto_652638 ) ) ( not ( = ?auto_652632 ?auto_652639 ) ) ( not ( = ?auto_652632 ?auto_652640 ) ) ( not ( = ?auto_652632 ?auto_652641 ) ) ( not ( = ?auto_652632 ?auto_652642 ) ) ( not ( = ?auto_652633 ?auto_652634 ) ) ( not ( = ?auto_652633 ?auto_652635 ) ) ( not ( = ?auto_652633 ?auto_652636 ) ) ( not ( = ?auto_652633 ?auto_652637 ) ) ( not ( = ?auto_652633 ?auto_652638 ) ) ( not ( = ?auto_652633 ?auto_652639 ) ) ( not ( = ?auto_652633 ?auto_652640 ) ) ( not ( = ?auto_652633 ?auto_652641 ) ) ( not ( = ?auto_652633 ?auto_652642 ) ) ( not ( = ?auto_652634 ?auto_652635 ) ) ( not ( = ?auto_652634 ?auto_652636 ) ) ( not ( = ?auto_652634 ?auto_652637 ) ) ( not ( = ?auto_652634 ?auto_652638 ) ) ( not ( = ?auto_652634 ?auto_652639 ) ) ( not ( = ?auto_652634 ?auto_652640 ) ) ( not ( = ?auto_652634 ?auto_652641 ) ) ( not ( = ?auto_652634 ?auto_652642 ) ) ( not ( = ?auto_652635 ?auto_652636 ) ) ( not ( = ?auto_652635 ?auto_652637 ) ) ( not ( = ?auto_652635 ?auto_652638 ) ) ( not ( = ?auto_652635 ?auto_652639 ) ) ( not ( = ?auto_652635 ?auto_652640 ) ) ( not ( = ?auto_652635 ?auto_652641 ) ) ( not ( = ?auto_652635 ?auto_652642 ) ) ( not ( = ?auto_652636 ?auto_652637 ) ) ( not ( = ?auto_652636 ?auto_652638 ) ) ( not ( = ?auto_652636 ?auto_652639 ) ) ( not ( = ?auto_652636 ?auto_652640 ) ) ( not ( = ?auto_652636 ?auto_652641 ) ) ( not ( = ?auto_652636 ?auto_652642 ) ) ( not ( = ?auto_652637 ?auto_652638 ) ) ( not ( = ?auto_652637 ?auto_652639 ) ) ( not ( = ?auto_652637 ?auto_652640 ) ) ( not ( = ?auto_652637 ?auto_652641 ) ) ( not ( = ?auto_652637 ?auto_652642 ) ) ( not ( = ?auto_652638 ?auto_652639 ) ) ( not ( = ?auto_652638 ?auto_652640 ) ) ( not ( = ?auto_652638 ?auto_652641 ) ) ( not ( = ?auto_652638 ?auto_652642 ) ) ( not ( = ?auto_652639 ?auto_652640 ) ) ( not ( = ?auto_652639 ?auto_652641 ) ) ( not ( = ?auto_652639 ?auto_652642 ) ) ( not ( = ?auto_652640 ?auto_652641 ) ) ( not ( = ?auto_652640 ?auto_652642 ) ) ( not ( = ?auto_652641 ?auto_652642 ) ) ( ON ?auto_652640 ?auto_652641 ) ( ON ?auto_652639 ?auto_652640 ) ( ON ?auto_652638 ?auto_652639 ) ( ON ?auto_652637 ?auto_652638 ) ( ON ?auto_652636 ?auto_652637 ) ( ON ?auto_652635 ?auto_652636 ) ( CLEAR ?auto_652633 ) ( ON ?auto_652634 ?auto_652635 ) ( CLEAR ?auto_652634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_652630 ?auto_652631 ?auto_652632 ?auto_652633 ?auto_652634 )
      ( MAKE-12PILE ?auto_652630 ?auto_652631 ?auto_652632 ?auto_652633 ?auto_652634 ?auto_652635 ?auto_652636 ?auto_652637 ?auto_652638 ?auto_652639 ?auto_652640 ?auto_652641 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_652680 - BLOCK
      ?auto_652681 - BLOCK
      ?auto_652682 - BLOCK
      ?auto_652683 - BLOCK
      ?auto_652684 - BLOCK
      ?auto_652685 - BLOCK
      ?auto_652686 - BLOCK
      ?auto_652687 - BLOCK
      ?auto_652688 - BLOCK
      ?auto_652689 - BLOCK
      ?auto_652690 - BLOCK
      ?auto_652691 - BLOCK
    )
    :vars
    (
      ?auto_652692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_652691 ?auto_652692 ) ( ON-TABLE ?auto_652680 ) ( ON ?auto_652681 ?auto_652680 ) ( ON ?auto_652682 ?auto_652681 ) ( not ( = ?auto_652680 ?auto_652681 ) ) ( not ( = ?auto_652680 ?auto_652682 ) ) ( not ( = ?auto_652680 ?auto_652683 ) ) ( not ( = ?auto_652680 ?auto_652684 ) ) ( not ( = ?auto_652680 ?auto_652685 ) ) ( not ( = ?auto_652680 ?auto_652686 ) ) ( not ( = ?auto_652680 ?auto_652687 ) ) ( not ( = ?auto_652680 ?auto_652688 ) ) ( not ( = ?auto_652680 ?auto_652689 ) ) ( not ( = ?auto_652680 ?auto_652690 ) ) ( not ( = ?auto_652680 ?auto_652691 ) ) ( not ( = ?auto_652680 ?auto_652692 ) ) ( not ( = ?auto_652681 ?auto_652682 ) ) ( not ( = ?auto_652681 ?auto_652683 ) ) ( not ( = ?auto_652681 ?auto_652684 ) ) ( not ( = ?auto_652681 ?auto_652685 ) ) ( not ( = ?auto_652681 ?auto_652686 ) ) ( not ( = ?auto_652681 ?auto_652687 ) ) ( not ( = ?auto_652681 ?auto_652688 ) ) ( not ( = ?auto_652681 ?auto_652689 ) ) ( not ( = ?auto_652681 ?auto_652690 ) ) ( not ( = ?auto_652681 ?auto_652691 ) ) ( not ( = ?auto_652681 ?auto_652692 ) ) ( not ( = ?auto_652682 ?auto_652683 ) ) ( not ( = ?auto_652682 ?auto_652684 ) ) ( not ( = ?auto_652682 ?auto_652685 ) ) ( not ( = ?auto_652682 ?auto_652686 ) ) ( not ( = ?auto_652682 ?auto_652687 ) ) ( not ( = ?auto_652682 ?auto_652688 ) ) ( not ( = ?auto_652682 ?auto_652689 ) ) ( not ( = ?auto_652682 ?auto_652690 ) ) ( not ( = ?auto_652682 ?auto_652691 ) ) ( not ( = ?auto_652682 ?auto_652692 ) ) ( not ( = ?auto_652683 ?auto_652684 ) ) ( not ( = ?auto_652683 ?auto_652685 ) ) ( not ( = ?auto_652683 ?auto_652686 ) ) ( not ( = ?auto_652683 ?auto_652687 ) ) ( not ( = ?auto_652683 ?auto_652688 ) ) ( not ( = ?auto_652683 ?auto_652689 ) ) ( not ( = ?auto_652683 ?auto_652690 ) ) ( not ( = ?auto_652683 ?auto_652691 ) ) ( not ( = ?auto_652683 ?auto_652692 ) ) ( not ( = ?auto_652684 ?auto_652685 ) ) ( not ( = ?auto_652684 ?auto_652686 ) ) ( not ( = ?auto_652684 ?auto_652687 ) ) ( not ( = ?auto_652684 ?auto_652688 ) ) ( not ( = ?auto_652684 ?auto_652689 ) ) ( not ( = ?auto_652684 ?auto_652690 ) ) ( not ( = ?auto_652684 ?auto_652691 ) ) ( not ( = ?auto_652684 ?auto_652692 ) ) ( not ( = ?auto_652685 ?auto_652686 ) ) ( not ( = ?auto_652685 ?auto_652687 ) ) ( not ( = ?auto_652685 ?auto_652688 ) ) ( not ( = ?auto_652685 ?auto_652689 ) ) ( not ( = ?auto_652685 ?auto_652690 ) ) ( not ( = ?auto_652685 ?auto_652691 ) ) ( not ( = ?auto_652685 ?auto_652692 ) ) ( not ( = ?auto_652686 ?auto_652687 ) ) ( not ( = ?auto_652686 ?auto_652688 ) ) ( not ( = ?auto_652686 ?auto_652689 ) ) ( not ( = ?auto_652686 ?auto_652690 ) ) ( not ( = ?auto_652686 ?auto_652691 ) ) ( not ( = ?auto_652686 ?auto_652692 ) ) ( not ( = ?auto_652687 ?auto_652688 ) ) ( not ( = ?auto_652687 ?auto_652689 ) ) ( not ( = ?auto_652687 ?auto_652690 ) ) ( not ( = ?auto_652687 ?auto_652691 ) ) ( not ( = ?auto_652687 ?auto_652692 ) ) ( not ( = ?auto_652688 ?auto_652689 ) ) ( not ( = ?auto_652688 ?auto_652690 ) ) ( not ( = ?auto_652688 ?auto_652691 ) ) ( not ( = ?auto_652688 ?auto_652692 ) ) ( not ( = ?auto_652689 ?auto_652690 ) ) ( not ( = ?auto_652689 ?auto_652691 ) ) ( not ( = ?auto_652689 ?auto_652692 ) ) ( not ( = ?auto_652690 ?auto_652691 ) ) ( not ( = ?auto_652690 ?auto_652692 ) ) ( not ( = ?auto_652691 ?auto_652692 ) ) ( ON ?auto_652690 ?auto_652691 ) ( ON ?auto_652689 ?auto_652690 ) ( ON ?auto_652688 ?auto_652689 ) ( ON ?auto_652687 ?auto_652688 ) ( ON ?auto_652686 ?auto_652687 ) ( ON ?auto_652685 ?auto_652686 ) ( ON ?auto_652684 ?auto_652685 ) ( CLEAR ?auto_652682 ) ( ON ?auto_652683 ?auto_652684 ) ( CLEAR ?auto_652683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_652680 ?auto_652681 ?auto_652682 ?auto_652683 )
      ( MAKE-12PILE ?auto_652680 ?auto_652681 ?auto_652682 ?auto_652683 ?auto_652684 ?auto_652685 ?auto_652686 ?auto_652687 ?auto_652688 ?auto_652689 ?auto_652690 ?auto_652691 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_652730 - BLOCK
      ?auto_652731 - BLOCK
      ?auto_652732 - BLOCK
      ?auto_652733 - BLOCK
      ?auto_652734 - BLOCK
      ?auto_652735 - BLOCK
      ?auto_652736 - BLOCK
      ?auto_652737 - BLOCK
      ?auto_652738 - BLOCK
      ?auto_652739 - BLOCK
      ?auto_652740 - BLOCK
      ?auto_652741 - BLOCK
    )
    :vars
    (
      ?auto_652742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_652741 ?auto_652742 ) ( ON-TABLE ?auto_652730 ) ( ON ?auto_652731 ?auto_652730 ) ( not ( = ?auto_652730 ?auto_652731 ) ) ( not ( = ?auto_652730 ?auto_652732 ) ) ( not ( = ?auto_652730 ?auto_652733 ) ) ( not ( = ?auto_652730 ?auto_652734 ) ) ( not ( = ?auto_652730 ?auto_652735 ) ) ( not ( = ?auto_652730 ?auto_652736 ) ) ( not ( = ?auto_652730 ?auto_652737 ) ) ( not ( = ?auto_652730 ?auto_652738 ) ) ( not ( = ?auto_652730 ?auto_652739 ) ) ( not ( = ?auto_652730 ?auto_652740 ) ) ( not ( = ?auto_652730 ?auto_652741 ) ) ( not ( = ?auto_652730 ?auto_652742 ) ) ( not ( = ?auto_652731 ?auto_652732 ) ) ( not ( = ?auto_652731 ?auto_652733 ) ) ( not ( = ?auto_652731 ?auto_652734 ) ) ( not ( = ?auto_652731 ?auto_652735 ) ) ( not ( = ?auto_652731 ?auto_652736 ) ) ( not ( = ?auto_652731 ?auto_652737 ) ) ( not ( = ?auto_652731 ?auto_652738 ) ) ( not ( = ?auto_652731 ?auto_652739 ) ) ( not ( = ?auto_652731 ?auto_652740 ) ) ( not ( = ?auto_652731 ?auto_652741 ) ) ( not ( = ?auto_652731 ?auto_652742 ) ) ( not ( = ?auto_652732 ?auto_652733 ) ) ( not ( = ?auto_652732 ?auto_652734 ) ) ( not ( = ?auto_652732 ?auto_652735 ) ) ( not ( = ?auto_652732 ?auto_652736 ) ) ( not ( = ?auto_652732 ?auto_652737 ) ) ( not ( = ?auto_652732 ?auto_652738 ) ) ( not ( = ?auto_652732 ?auto_652739 ) ) ( not ( = ?auto_652732 ?auto_652740 ) ) ( not ( = ?auto_652732 ?auto_652741 ) ) ( not ( = ?auto_652732 ?auto_652742 ) ) ( not ( = ?auto_652733 ?auto_652734 ) ) ( not ( = ?auto_652733 ?auto_652735 ) ) ( not ( = ?auto_652733 ?auto_652736 ) ) ( not ( = ?auto_652733 ?auto_652737 ) ) ( not ( = ?auto_652733 ?auto_652738 ) ) ( not ( = ?auto_652733 ?auto_652739 ) ) ( not ( = ?auto_652733 ?auto_652740 ) ) ( not ( = ?auto_652733 ?auto_652741 ) ) ( not ( = ?auto_652733 ?auto_652742 ) ) ( not ( = ?auto_652734 ?auto_652735 ) ) ( not ( = ?auto_652734 ?auto_652736 ) ) ( not ( = ?auto_652734 ?auto_652737 ) ) ( not ( = ?auto_652734 ?auto_652738 ) ) ( not ( = ?auto_652734 ?auto_652739 ) ) ( not ( = ?auto_652734 ?auto_652740 ) ) ( not ( = ?auto_652734 ?auto_652741 ) ) ( not ( = ?auto_652734 ?auto_652742 ) ) ( not ( = ?auto_652735 ?auto_652736 ) ) ( not ( = ?auto_652735 ?auto_652737 ) ) ( not ( = ?auto_652735 ?auto_652738 ) ) ( not ( = ?auto_652735 ?auto_652739 ) ) ( not ( = ?auto_652735 ?auto_652740 ) ) ( not ( = ?auto_652735 ?auto_652741 ) ) ( not ( = ?auto_652735 ?auto_652742 ) ) ( not ( = ?auto_652736 ?auto_652737 ) ) ( not ( = ?auto_652736 ?auto_652738 ) ) ( not ( = ?auto_652736 ?auto_652739 ) ) ( not ( = ?auto_652736 ?auto_652740 ) ) ( not ( = ?auto_652736 ?auto_652741 ) ) ( not ( = ?auto_652736 ?auto_652742 ) ) ( not ( = ?auto_652737 ?auto_652738 ) ) ( not ( = ?auto_652737 ?auto_652739 ) ) ( not ( = ?auto_652737 ?auto_652740 ) ) ( not ( = ?auto_652737 ?auto_652741 ) ) ( not ( = ?auto_652737 ?auto_652742 ) ) ( not ( = ?auto_652738 ?auto_652739 ) ) ( not ( = ?auto_652738 ?auto_652740 ) ) ( not ( = ?auto_652738 ?auto_652741 ) ) ( not ( = ?auto_652738 ?auto_652742 ) ) ( not ( = ?auto_652739 ?auto_652740 ) ) ( not ( = ?auto_652739 ?auto_652741 ) ) ( not ( = ?auto_652739 ?auto_652742 ) ) ( not ( = ?auto_652740 ?auto_652741 ) ) ( not ( = ?auto_652740 ?auto_652742 ) ) ( not ( = ?auto_652741 ?auto_652742 ) ) ( ON ?auto_652740 ?auto_652741 ) ( ON ?auto_652739 ?auto_652740 ) ( ON ?auto_652738 ?auto_652739 ) ( ON ?auto_652737 ?auto_652738 ) ( ON ?auto_652736 ?auto_652737 ) ( ON ?auto_652735 ?auto_652736 ) ( ON ?auto_652734 ?auto_652735 ) ( ON ?auto_652733 ?auto_652734 ) ( CLEAR ?auto_652731 ) ( ON ?auto_652732 ?auto_652733 ) ( CLEAR ?auto_652732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_652730 ?auto_652731 ?auto_652732 )
      ( MAKE-12PILE ?auto_652730 ?auto_652731 ?auto_652732 ?auto_652733 ?auto_652734 ?auto_652735 ?auto_652736 ?auto_652737 ?auto_652738 ?auto_652739 ?auto_652740 ?auto_652741 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_652780 - BLOCK
      ?auto_652781 - BLOCK
      ?auto_652782 - BLOCK
      ?auto_652783 - BLOCK
      ?auto_652784 - BLOCK
      ?auto_652785 - BLOCK
      ?auto_652786 - BLOCK
      ?auto_652787 - BLOCK
      ?auto_652788 - BLOCK
      ?auto_652789 - BLOCK
      ?auto_652790 - BLOCK
      ?auto_652791 - BLOCK
    )
    :vars
    (
      ?auto_652792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_652791 ?auto_652792 ) ( ON-TABLE ?auto_652780 ) ( not ( = ?auto_652780 ?auto_652781 ) ) ( not ( = ?auto_652780 ?auto_652782 ) ) ( not ( = ?auto_652780 ?auto_652783 ) ) ( not ( = ?auto_652780 ?auto_652784 ) ) ( not ( = ?auto_652780 ?auto_652785 ) ) ( not ( = ?auto_652780 ?auto_652786 ) ) ( not ( = ?auto_652780 ?auto_652787 ) ) ( not ( = ?auto_652780 ?auto_652788 ) ) ( not ( = ?auto_652780 ?auto_652789 ) ) ( not ( = ?auto_652780 ?auto_652790 ) ) ( not ( = ?auto_652780 ?auto_652791 ) ) ( not ( = ?auto_652780 ?auto_652792 ) ) ( not ( = ?auto_652781 ?auto_652782 ) ) ( not ( = ?auto_652781 ?auto_652783 ) ) ( not ( = ?auto_652781 ?auto_652784 ) ) ( not ( = ?auto_652781 ?auto_652785 ) ) ( not ( = ?auto_652781 ?auto_652786 ) ) ( not ( = ?auto_652781 ?auto_652787 ) ) ( not ( = ?auto_652781 ?auto_652788 ) ) ( not ( = ?auto_652781 ?auto_652789 ) ) ( not ( = ?auto_652781 ?auto_652790 ) ) ( not ( = ?auto_652781 ?auto_652791 ) ) ( not ( = ?auto_652781 ?auto_652792 ) ) ( not ( = ?auto_652782 ?auto_652783 ) ) ( not ( = ?auto_652782 ?auto_652784 ) ) ( not ( = ?auto_652782 ?auto_652785 ) ) ( not ( = ?auto_652782 ?auto_652786 ) ) ( not ( = ?auto_652782 ?auto_652787 ) ) ( not ( = ?auto_652782 ?auto_652788 ) ) ( not ( = ?auto_652782 ?auto_652789 ) ) ( not ( = ?auto_652782 ?auto_652790 ) ) ( not ( = ?auto_652782 ?auto_652791 ) ) ( not ( = ?auto_652782 ?auto_652792 ) ) ( not ( = ?auto_652783 ?auto_652784 ) ) ( not ( = ?auto_652783 ?auto_652785 ) ) ( not ( = ?auto_652783 ?auto_652786 ) ) ( not ( = ?auto_652783 ?auto_652787 ) ) ( not ( = ?auto_652783 ?auto_652788 ) ) ( not ( = ?auto_652783 ?auto_652789 ) ) ( not ( = ?auto_652783 ?auto_652790 ) ) ( not ( = ?auto_652783 ?auto_652791 ) ) ( not ( = ?auto_652783 ?auto_652792 ) ) ( not ( = ?auto_652784 ?auto_652785 ) ) ( not ( = ?auto_652784 ?auto_652786 ) ) ( not ( = ?auto_652784 ?auto_652787 ) ) ( not ( = ?auto_652784 ?auto_652788 ) ) ( not ( = ?auto_652784 ?auto_652789 ) ) ( not ( = ?auto_652784 ?auto_652790 ) ) ( not ( = ?auto_652784 ?auto_652791 ) ) ( not ( = ?auto_652784 ?auto_652792 ) ) ( not ( = ?auto_652785 ?auto_652786 ) ) ( not ( = ?auto_652785 ?auto_652787 ) ) ( not ( = ?auto_652785 ?auto_652788 ) ) ( not ( = ?auto_652785 ?auto_652789 ) ) ( not ( = ?auto_652785 ?auto_652790 ) ) ( not ( = ?auto_652785 ?auto_652791 ) ) ( not ( = ?auto_652785 ?auto_652792 ) ) ( not ( = ?auto_652786 ?auto_652787 ) ) ( not ( = ?auto_652786 ?auto_652788 ) ) ( not ( = ?auto_652786 ?auto_652789 ) ) ( not ( = ?auto_652786 ?auto_652790 ) ) ( not ( = ?auto_652786 ?auto_652791 ) ) ( not ( = ?auto_652786 ?auto_652792 ) ) ( not ( = ?auto_652787 ?auto_652788 ) ) ( not ( = ?auto_652787 ?auto_652789 ) ) ( not ( = ?auto_652787 ?auto_652790 ) ) ( not ( = ?auto_652787 ?auto_652791 ) ) ( not ( = ?auto_652787 ?auto_652792 ) ) ( not ( = ?auto_652788 ?auto_652789 ) ) ( not ( = ?auto_652788 ?auto_652790 ) ) ( not ( = ?auto_652788 ?auto_652791 ) ) ( not ( = ?auto_652788 ?auto_652792 ) ) ( not ( = ?auto_652789 ?auto_652790 ) ) ( not ( = ?auto_652789 ?auto_652791 ) ) ( not ( = ?auto_652789 ?auto_652792 ) ) ( not ( = ?auto_652790 ?auto_652791 ) ) ( not ( = ?auto_652790 ?auto_652792 ) ) ( not ( = ?auto_652791 ?auto_652792 ) ) ( ON ?auto_652790 ?auto_652791 ) ( ON ?auto_652789 ?auto_652790 ) ( ON ?auto_652788 ?auto_652789 ) ( ON ?auto_652787 ?auto_652788 ) ( ON ?auto_652786 ?auto_652787 ) ( ON ?auto_652785 ?auto_652786 ) ( ON ?auto_652784 ?auto_652785 ) ( ON ?auto_652783 ?auto_652784 ) ( ON ?auto_652782 ?auto_652783 ) ( CLEAR ?auto_652780 ) ( ON ?auto_652781 ?auto_652782 ) ( CLEAR ?auto_652781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_652780 ?auto_652781 )
      ( MAKE-12PILE ?auto_652780 ?auto_652781 ?auto_652782 ?auto_652783 ?auto_652784 ?auto_652785 ?auto_652786 ?auto_652787 ?auto_652788 ?auto_652789 ?auto_652790 ?auto_652791 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_652830 - BLOCK
      ?auto_652831 - BLOCK
      ?auto_652832 - BLOCK
      ?auto_652833 - BLOCK
      ?auto_652834 - BLOCK
      ?auto_652835 - BLOCK
      ?auto_652836 - BLOCK
      ?auto_652837 - BLOCK
      ?auto_652838 - BLOCK
      ?auto_652839 - BLOCK
      ?auto_652840 - BLOCK
      ?auto_652841 - BLOCK
    )
    :vars
    (
      ?auto_652842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_652841 ?auto_652842 ) ( not ( = ?auto_652830 ?auto_652831 ) ) ( not ( = ?auto_652830 ?auto_652832 ) ) ( not ( = ?auto_652830 ?auto_652833 ) ) ( not ( = ?auto_652830 ?auto_652834 ) ) ( not ( = ?auto_652830 ?auto_652835 ) ) ( not ( = ?auto_652830 ?auto_652836 ) ) ( not ( = ?auto_652830 ?auto_652837 ) ) ( not ( = ?auto_652830 ?auto_652838 ) ) ( not ( = ?auto_652830 ?auto_652839 ) ) ( not ( = ?auto_652830 ?auto_652840 ) ) ( not ( = ?auto_652830 ?auto_652841 ) ) ( not ( = ?auto_652830 ?auto_652842 ) ) ( not ( = ?auto_652831 ?auto_652832 ) ) ( not ( = ?auto_652831 ?auto_652833 ) ) ( not ( = ?auto_652831 ?auto_652834 ) ) ( not ( = ?auto_652831 ?auto_652835 ) ) ( not ( = ?auto_652831 ?auto_652836 ) ) ( not ( = ?auto_652831 ?auto_652837 ) ) ( not ( = ?auto_652831 ?auto_652838 ) ) ( not ( = ?auto_652831 ?auto_652839 ) ) ( not ( = ?auto_652831 ?auto_652840 ) ) ( not ( = ?auto_652831 ?auto_652841 ) ) ( not ( = ?auto_652831 ?auto_652842 ) ) ( not ( = ?auto_652832 ?auto_652833 ) ) ( not ( = ?auto_652832 ?auto_652834 ) ) ( not ( = ?auto_652832 ?auto_652835 ) ) ( not ( = ?auto_652832 ?auto_652836 ) ) ( not ( = ?auto_652832 ?auto_652837 ) ) ( not ( = ?auto_652832 ?auto_652838 ) ) ( not ( = ?auto_652832 ?auto_652839 ) ) ( not ( = ?auto_652832 ?auto_652840 ) ) ( not ( = ?auto_652832 ?auto_652841 ) ) ( not ( = ?auto_652832 ?auto_652842 ) ) ( not ( = ?auto_652833 ?auto_652834 ) ) ( not ( = ?auto_652833 ?auto_652835 ) ) ( not ( = ?auto_652833 ?auto_652836 ) ) ( not ( = ?auto_652833 ?auto_652837 ) ) ( not ( = ?auto_652833 ?auto_652838 ) ) ( not ( = ?auto_652833 ?auto_652839 ) ) ( not ( = ?auto_652833 ?auto_652840 ) ) ( not ( = ?auto_652833 ?auto_652841 ) ) ( not ( = ?auto_652833 ?auto_652842 ) ) ( not ( = ?auto_652834 ?auto_652835 ) ) ( not ( = ?auto_652834 ?auto_652836 ) ) ( not ( = ?auto_652834 ?auto_652837 ) ) ( not ( = ?auto_652834 ?auto_652838 ) ) ( not ( = ?auto_652834 ?auto_652839 ) ) ( not ( = ?auto_652834 ?auto_652840 ) ) ( not ( = ?auto_652834 ?auto_652841 ) ) ( not ( = ?auto_652834 ?auto_652842 ) ) ( not ( = ?auto_652835 ?auto_652836 ) ) ( not ( = ?auto_652835 ?auto_652837 ) ) ( not ( = ?auto_652835 ?auto_652838 ) ) ( not ( = ?auto_652835 ?auto_652839 ) ) ( not ( = ?auto_652835 ?auto_652840 ) ) ( not ( = ?auto_652835 ?auto_652841 ) ) ( not ( = ?auto_652835 ?auto_652842 ) ) ( not ( = ?auto_652836 ?auto_652837 ) ) ( not ( = ?auto_652836 ?auto_652838 ) ) ( not ( = ?auto_652836 ?auto_652839 ) ) ( not ( = ?auto_652836 ?auto_652840 ) ) ( not ( = ?auto_652836 ?auto_652841 ) ) ( not ( = ?auto_652836 ?auto_652842 ) ) ( not ( = ?auto_652837 ?auto_652838 ) ) ( not ( = ?auto_652837 ?auto_652839 ) ) ( not ( = ?auto_652837 ?auto_652840 ) ) ( not ( = ?auto_652837 ?auto_652841 ) ) ( not ( = ?auto_652837 ?auto_652842 ) ) ( not ( = ?auto_652838 ?auto_652839 ) ) ( not ( = ?auto_652838 ?auto_652840 ) ) ( not ( = ?auto_652838 ?auto_652841 ) ) ( not ( = ?auto_652838 ?auto_652842 ) ) ( not ( = ?auto_652839 ?auto_652840 ) ) ( not ( = ?auto_652839 ?auto_652841 ) ) ( not ( = ?auto_652839 ?auto_652842 ) ) ( not ( = ?auto_652840 ?auto_652841 ) ) ( not ( = ?auto_652840 ?auto_652842 ) ) ( not ( = ?auto_652841 ?auto_652842 ) ) ( ON ?auto_652840 ?auto_652841 ) ( ON ?auto_652839 ?auto_652840 ) ( ON ?auto_652838 ?auto_652839 ) ( ON ?auto_652837 ?auto_652838 ) ( ON ?auto_652836 ?auto_652837 ) ( ON ?auto_652835 ?auto_652836 ) ( ON ?auto_652834 ?auto_652835 ) ( ON ?auto_652833 ?auto_652834 ) ( ON ?auto_652832 ?auto_652833 ) ( ON ?auto_652831 ?auto_652832 ) ( ON ?auto_652830 ?auto_652831 ) ( CLEAR ?auto_652830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_652830 )
      ( MAKE-12PILE ?auto_652830 ?auto_652831 ?auto_652832 ?auto_652833 ?auto_652834 ?auto_652835 ?auto_652836 ?auto_652837 ?auto_652838 ?auto_652839 ?auto_652840 ?auto_652841 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_652881 - BLOCK
      ?auto_652882 - BLOCK
      ?auto_652883 - BLOCK
      ?auto_652884 - BLOCK
      ?auto_652885 - BLOCK
      ?auto_652886 - BLOCK
      ?auto_652887 - BLOCK
      ?auto_652888 - BLOCK
      ?auto_652889 - BLOCK
      ?auto_652890 - BLOCK
      ?auto_652891 - BLOCK
      ?auto_652892 - BLOCK
      ?auto_652893 - BLOCK
    )
    :vars
    (
      ?auto_652894 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_652892 ) ( ON ?auto_652893 ?auto_652894 ) ( CLEAR ?auto_652893 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_652881 ) ( ON ?auto_652882 ?auto_652881 ) ( ON ?auto_652883 ?auto_652882 ) ( ON ?auto_652884 ?auto_652883 ) ( ON ?auto_652885 ?auto_652884 ) ( ON ?auto_652886 ?auto_652885 ) ( ON ?auto_652887 ?auto_652886 ) ( ON ?auto_652888 ?auto_652887 ) ( ON ?auto_652889 ?auto_652888 ) ( ON ?auto_652890 ?auto_652889 ) ( ON ?auto_652891 ?auto_652890 ) ( ON ?auto_652892 ?auto_652891 ) ( not ( = ?auto_652881 ?auto_652882 ) ) ( not ( = ?auto_652881 ?auto_652883 ) ) ( not ( = ?auto_652881 ?auto_652884 ) ) ( not ( = ?auto_652881 ?auto_652885 ) ) ( not ( = ?auto_652881 ?auto_652886 ) ) ( not ( = ?auto_652881 ?auto_652887 ) ) ( not ( = ?auto_652881 ?auto_652888 ) ) ( not ( = ?auto_652881 ?auto_652889 ) ) ( not ( = ?auto_652881 ?auto_652890 ) ) ( not ( = ?auto_652881 ?auto_652891 ) ) ( not ( = ?auto_652881 ?auto_652892 ) ) ( not ( = ?auto_652881 ?auto_652893 ) ) ( not ( = ?auto_652881 ?auto_652894 ) ) ( not ( = ?auto_652882 ?auto_652883 ) ) ( not ( = ?auto_652882 ?auto_652884 ) ) ( not ( = ?auto_652882 ?auto_652885 ) ) ( not ( = ?auto_652882 ?auto_652886 ) ) ( not ( = ?auto_652882 ?auto_652887 ) ) ( not ( = ?auto_652882 ?auto_652888 ) ) ( not ( = ?auto_652882 ?auto_652889 ) ) ( not ( = ?auto_652882 ?auto_652890 ) ) ( not ( = ?auto_652882 ?auto_652891 ) ) ( not ( = ?auto_652882 ?auto_652892 ) ) ( not ( = ?auto_652882 ?auto_652893 ) ) ( not ( = ?auto_652882 ?auto_652894 ) ) ( not ( = ?auto_652883 ?auto_652884 ) ) ( not ( = ?auto_652883 ?auto_652885 ) ) ( not ( = ?auto_652883 ?auto_652886 ) ) ( not ( = ?auto_652883 ?auto_652887 ) ) ( not ( = ?auto_652883 ?auto_652888 ) ) ( not ( = ?auto_652883 ?auto_652889 ) ) ( not ( = ?auto_652883 ?auto_652890 ) ) ( not ( = ?auto_652883 ?auto_652891 ) ) ( not ( = ?auto_652883 ?auto_652892 ) ) ( not ( = ?auto_652883 ?auto_652893 ) ) ( not ( = ?auto_652883 ?auto_652894 ) ) ( not ( = ?auto_652884 ?auto_652885 ) ) ( not ( = ?auto_652884 ?auto_652886 ) ) ( not ( = ?auto_652884 ?auto_652887 ) ) ( not ( = ?auto_652884 ?auto_652888 ) ) ( not ( = ?auto_652884 ?auto_652889 ) ) ( not ( = ?auto_652884 ?auto_652890 ) ) ( not ( = ?auto_652884 ?auto_652891 ) ) ( not ( = ?auto_652884 ?auto_652892 ) ) ( not ( = ?auto_652884 ?auto_652893 ) ) ( not ( = ?auto_652884 ?auto_652894 ) ) ( not ( = ?auto_652885 ?auto_652886 ) ) ( not ( = ?auto_652885 ?auto_652887 ) ) ( not ( = ?auto_652885 ?auto_652888 ) ) ( not ( = ?auto_652885 ?auto_652889 ) ) ( not ( = ?auto_652885 ?auto_652890 ) ) ( not ( = ?auto_652885 ?auto_652891 ) ) ( not ( = ?auto_652885 ?auto_652892 ) ) ( not ( = ?auto_652885 ?auto_652893 ) ) ( not ( = ?auto_652885 ?auto_652894 ) ) ( not ( = ?auto_652886 ?auto_652887 ) ) ( not ( = ?auto_652886 ?auto_652888 ) ) ( not ( = ?auto_652886 ?auto_652889 ) ) ( not ( = ?auto_652886 ?auto_652890 ) ) ( not ( = ?auto_652886 ?auto_652891 ) ) ( not ( = ?auto_652886 ?auto_652892 ) ) ( not ( = ?auto_652886 ?auto_652893 ) ) ( not ( = ?auto_652886 ?auto_652894 ) ) ( not ( = ?auto_652887 ?auto_652888 ) ) ( not ( = ?auto_652887 ?auto_652889 ) ) ( not ( = ?auto_652887 ?auto_652890 ) ) ( not ( = ?auto_652887 ?auto_652891 ) ) ( not ( = ?auto_652887 ?auto_652892 ) ) ( not ( = ?auto_652887 ?auto_652893 ) ) ( not ( = ?auto_652887 ?auto_652894 ) ) ( not ( = ?auto_652888 ?auto_652889 ) ) ( not ( = ?auto_652888 ?auto_652890 ) ) ( not ( = ?auto_652888 ?auto_652891 ) ) ( not ( = ?auto_652888 ?auto_652892 ) ) ( not ( = ?auto_652888 ?auto_652893 ) ) ( not ( = ?auto_652888 ?auto_652894 ) ) ( not ( = ?auto_652889 ?auto_652890 ) ) ( not ( = ?auto_652889 ?auto_652891 ) ) ( not ( = ?auto_652889 ?auto_652892 ) ) ( not ( = ?auto_652889 ?auto_652893 ) ) ( not ( = ?auto_652889 ?auto_652894 ) ) ( not ( = ?auto_652890 ?auto_652891 ) ) ( not ( = ?auto_652890 ?auto_652892 ) ) ( not ( = ?auto_652890 ?auto_652893 ) ) ( not ( = ?auto_652890 ?auto_652894 ) ) ( not ( = ?auto_652891 ?auto_652892 ) ) ( not ( = ?auto_652891 ?auto_652893 ) ) ( not ( = ?auto_652891 ?auto_652894 ) ) ( not ( = ?auto_652892 ?auto_652893 ) ) ( not ( = ?auto_652892 ?auto_652894 ) ) ( not ( = ?auto_652893 ?auto_652894 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_652893 ?auto_652894 )
      ( !STACK ?auto_652893 ?auto_652892 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_652935 - BLOCK
      ?auto_652936 - BLOCK
      ?auto_652937 - BLOCK
      ?auto_652938 - BLOCK
      ?auto_652939 - BLOCK
      ?auto_652940 - BLOCK
      ?auto_652941 - BLOCK
      ?auto_652942 - BLOCK
      ?auto_652943 - BLOCK
      ?auto_652944 - BLOCK
      ?auto_652945 - BLOCK
      ?auto_652946 - BLOCK
      ?auto_652947 - BLOCK
    )
    :vars
    (
      ?auto_652948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_652947 ?auto_652948 ) ( ON-TABLE ?auto_652935 ) ( ON ?auto_652936 ?auto_652935 ) ( ON ?auto_652937 ?auto_652936 ) ( ON ?auto_652938 ?auto_652937 ) ( ON ?auto_652939 ?auto_652938 ) ( ON ?auto_652940 ?auto_652939 ) ( ON ?auto_652941 ?auto_652940 ) ( ON ?auto_652942 ?auto_652941 ) ( ON ?auto_652943 ?auto_652942 ) ( ON ?auto_652944 ?auto_652943 ) ( ON ?auto_652945 ?auto_652944 ) ( not ( = ?auto_652935 ?auto_652936 ) ) ( not ( = ?auto_652935 ?auto_652937 ) ) ( not ( = ?auto_652935 ?auto_652938 ) ) ( not ( = ?auto_652935 ?auto_652939 ) ) ( not ( = ?auto_652935 ?auto_652940 ) ) ( not ( = ?auto_652935 ?auto_652941 ) ) ( not ( = ?auto_652935 ?auto_652942 ) ) ( not ( = ?auto_652935 ?auto_652943 ) ) ( not ( = ?auto_652935 ?auto_652944 ) ) ( not ( = ?auto_652935 ?auto_652945 ) ) ( not ( = ?auto_652935 ?auto_652946 ) ) ( not ( = ?auto_652935 ?auto_652947 ) ) ( not ( = ?auto_652935 ?auto_652948 ) ) ( not ( = ?auto_652936 ?auto_652937 ) ) ( not ( = ?auto_652936 ?auto_652938 ) ) ( not ( = ?auto_652936 ?auto_652939 ) ) ( not ( = ?auto_652936 ?auto_652940 ) ) ( not ( = ?auto_652936 ?auto_652941 ) ) ( not ( = ?auto_652936 ?auto_652942 ) ) ( not ( = ?auto_652936 ?auto_652943 ) ) ( not ( = ?auto_652936 ?auto_652944 ) ) ( not ( = ?auto_652936 ?auto_652945 ) ) ( not ( = ?auto_652936 ?auto_652946 ) ) ( not ( = ?auto_652936 ?auto_652947 ) ) ( not ( = ?auto_652936 ?auto_652948 ) ) ( not ( = ?auto_652937 ?auto_652938 ) ) ( not ( = ?auto_652937 ?auto_652939 ) ) ( not ( = ?auto_652937 ?auto_652940 ) ) ( not ( = ?auto_652937 ?auto_652941 ) ) ( not ( = ?auto_652937 ?auto_652942 ) ) ( not ( = ?auto_652937 ?auto_652943 ) ) ( not ( = ?auto_652937 ?auto_652944 ) ) ( not ( = ?auto_652937 ?auto_652945 ) ) ( not ( = ?auto_652937 ?auto_652946 ) ) ( not ( = ?auto_652937 ?auto_652947 ) ) ( not ( = ?auto_652937 ?auto_652948 ) ) ( not ( = ?auto_652938 ?auto_652939 ) ) ( not ( = ?auto_652938 ?auto_652940 ) ) ( not ( = ?auto_652938 ?auto_652941 ) ) ( not ( = ?auto_652938 ?auto_652942 ) ) ( not ( = ?auto_652938 ?auto_652943 ) ) ( not ( = ?auto_652938 ?auto_652944 ) ) ( not ( = ?auto_652938 ?auto_652945 ) ) ( not ( = ?auto_652938 ?auto_652946 ) ) ( not ( = ?auto_652938 ?auto_652947 ) ) ( not ( = ?auto_652938 ?auto_652948 ) ) ( not ( = ?auto_652939 ?auto_652940 ) ) ( not ( = ?auto_652939 ?auto_652941 ) ) ( not ( = ?auto_652939 ?auto_652942 ) ) ( not ( = ?auto_652939 ?auto_652943 ) ) ( not ( = ?auto_652939 ?auto_652944 ) ) ( not ( = ?auto_652939 ?auto_652945 ) ) ( not ( = ?auto_652939 ?auto_652946 ) ) ( not ( = ?auto_652939 ?auto_652947 ) ) ( not ( = ?auto_652939 ?auto_652948 ) ) ( not ( = ?auto_652940 ?auto_652941 ) ) ( not ( = ?auto_652940 ?auto_652942 ) ) ( not ( = ?auto_652940 ?auto_652943 ) ) ( not ( = ?auto_652940 ?auto_652944 ) ) ( not ( = ?auto_652940 ?auto_652945 ) ) ( not ( = ?auto_652940 ?auto_652946 ) ) ( not ( = ?auto_652940 ?auto_652947 ) ) ( not ( = ?auto_652940 ?auto_652948 ) ) ( not ( = ?auto_652941 ?auto_652942 ) ) ( not ( = ?auto_652941 ?auto_652943 ) ) ( not ( = ?auto_652941 ?auto_652944 ) ) ( not ( = ?auto_652941 ?auto_652945 ) ) ( not ( = ?auto_652941 ?auto_652946 ) ) ( not ( = ?auto_652941 ?auto_652947 ) ) ( not ( = ?auto_652941 ?auto_652948 ) ) ( not ( = ?auto_652942 ?auto_652943 ) ) ( not ( = ?auto_652942 ?auto_652944 ) ) ( not ( = ?auto_652942 ?auto_652945 ) ) ( not ( = ?auto_652942 ?auto_652946 ) ) ( not ( = ?auto_652942 ?auto_652947 ) ) ( not ( = ?auto_652942 ?auto_652948 ) ) ( not ( = ?auto_652943 ?auto_652944 ) ) ( not ( = ?auto_652943 ?auto_652945 ) ) ( not ( = ?auto_652943 ?auto_652946 ) ) ( not ( = ?auto_652943 ?auto_652947 ) ) ( not ( = ?auto_652943 ?auto_652948 ) ) ( not ( = ?auto_652944 ?auto_652945 ) ) ( not ( = ?auto_652944 ?auto_652946 ) ) ( not ( = ?auto_652944 ?auto_652947 ) ) ( not ( = ?auto_652944 ?auto_652948 ) ) ( not ( = ?auto_652945 ?auto_652946 ) ) ( not ( = ?auto_652945 ?auto_652947 ) ) ( not ( = ?auto_652945 ?auto_652948 ) ) ( not ( = ?auto_652946 ?auto_652947 ) ) ( not ( = ?auto_652946 ?auto_652948 ) ) ( not ( = ?auto_652947 ?auto_652948 ) ) ( CLEAR ?auto_652945 ) ( ON ?auto_652946 ?auto_652947 ) ( CLEAR ?auto_652946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_652935 ?auto_652936 ?auto_652937 ?auto_652938 ?auto_652939 ?auto_652940 ?auto_652941 ?auto_652942 ?auto_652943 ?auto_652944 ?auto_652945 ?auto_652946 )
      ( MAKE-13PILE ?auto_652935 ?auto_652936 ?auto_652937 ?auto_652938 ?auto_652939 ?auto_652940 ?auto_652941 ?auto_652942 ?auto_652943 ?auto_652944 ?auto_652945 ?auto_652946 ?auto_652947 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_652989 - BLOCK
      ?auto_652990 - BLOCK
      ?auto_652991 - BLOCK
      ?auto_652992 - BLOCK
      ?auto_652993 - BLOCK
      ?auto_652994 - BLOCK
      ?auto_652995 - BLOCK
      ?auto_652996 - BLOCK
      ?auto_652997 - BLOCK
      ?auto_652998 - BLOCK
      ?auto_652999 - BLOCK
      ?auto_653000 - BLOCK
      ?auto_653001 - BLOCK
    )
    :vars
    (
      ?auto_653002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_653001 ?auto_653002 ) ( ON-TABLE ?auto_652989 ) ( ON ?auto_652990 ?auto_652989 ) ( ON ?auto_652991 ?auto_652990 ) ( ON ?auto_652992 ?auto_652991 ) ( ON ?auto_652993 ?auto_652992 ) ( ON ?auto_652994 ?auto_652993 ) ( ON ?auto_652995 ?auto_652994 ) ( ON ?auto_652996 ?auto_652995 ) ( ON ?auto_652997 ?auto_652996 ) ( ON ?auto_652998 ?auto_652997 ) ( not ( = ?auto_652989 ?auto_652990 ) ) ( not ( = ?auto_652989 ?auto_652991 ) ) ( not ( = ?auto_652989 ?auto_652992 ) ) ( not ( = ?auto_652989 ?auto_652993 ) ) ( not ( = ?auto_652989 ?auto_652994 ) ) ( not ( = ?auto_652989 ?auto_652995 ) ) ( not ( = ?auto_652989 ?auto_652996 ) ) ( not ( = ?auto_652989 ?auto_652997 ) ) ( not ( = ?auto_652989 ?auto_652998 ) ) ( not ( = ?auto_652989 ?auto_652999 ) ) ( not ( = ?auto_652989 ?auto_653000 ) ) ( not ( = ?auto_652989 ?auto_653001 ) ) ( not ( = ?auto_652989 ?auto_653002 ) ) ( not ( = ?auto_652990 ?auto_652991 ) ) ( not ( = ?auto_652990 ?auto_652992 ) ) ( not ( = ?auto_652990 ?auto_652993 ) ) ( not ( = ?auto_652990 ?auto_652994 ) ) ( not ( = ?auto_652990 ?auto_652995 ) ) ( not ( = ?auto_652990 ?auto_652996 ) ) ( not ( = ?auto_652990 ?auto_652997 ) ) ( not ( = ?auto_652990 ?auto_652998 ) ) ( not ( = ?auto_652990 ?auto_652999 ) ) ( not ( = ?auto_652990 ?auto_653000 ) ) ( not ( = ?auto_652990 ?auto_653001 ) ) ( not ( = ?auto_652990 ?auto_653002 ) ) ( not ( = ?auto_652991 ?auto_652992 ) ) ( not ( = ?auto_652991 ?auto_652993 ) ) ( not ( = ?auto_652991 ?auto_652994 ) ) ( not ( = ?auto_652991 ?auto_652995 ) ) ( not ( = ?auto_652991 ?auto_652996 ) ) ( not ( = ?auto_652991 ?auto_652997 ) ) ( not ( = ?auto_652991 ?auto_652998 ) ) ( not ( = ?auto_652991 ?auto_652999 ) ) ( not ( = ?auto_652991 ?auto_653000 ) ) ( not ( = ?auto_652991 ?auto_653001 ) ) ( not ( = ?auto_652991 ?auto_653002 ) ) ( not ( = ?auto_652992 ?auto_652993 ) ) ( not ( = ?auto_652992 ?auto_652994 ) ) ( not ( = ?auto_652992 ?auto_652995 ) ) ( not ( = ?auto_652992 ?auto_652996 ) ) ( not ( = ?auto_652992 ?auto_652997 ) ) ( not ( = ?auto_652992 ?auto_652998 ) ) ( not ( = ?auto_652992 ?auto_652999 ) ) ( not ( = ?auto_652992 ?auto_653000 ) ) ( not ( = ?auto_652992 ?auto_653001 ) ) ( not ( = ?auto_652992 ?auto_653002 ) ) ( not ( = ?auto_652993 ?auto_652994 ) ) ( not ( = ?auto_652993 ?auto_652995 ) ) ( not ( = ?auto_652993 ?auto_652996 ) ) ( not ( = ?auto_652993 ?auto_652997 ) ) ( not ( = ?auto_652993 ?auto_652998 ) ) ( not ( = ?auto_652993 ?auto_652999 ) ) ( not ( = ?auto_652993 ?auto_653000 ) ) ( not ( = ?auto_652993 ?auto_653001 ) ) ( not ( = ?auto_652993 ?auto_653002 ) ) ( not ( = ?auto_652994 ?auto_652995 ) ) ( not ( = ?auto_652994 ?auto_652996 ) ) ( not ( = ?auto_652994 ?auto_652997 ) ) ( not ( = ?auto_652994 ?auto_652998 ) ) ( not ( = ?auto_652994 ?auto_652999 ) ) ( not ( = ?auto_652994 ?auto_653000 ) ) ( not ( = ?auto_652994 ?auto_653001 ) ) ( not ( = ?auto_652994 ?auto_653002 ) ) ( not ( = ?auto_652995 ?auto_652996 ) ) ( not ( = ?auto_652995 ?auto_652997 ) ) ( not ( = ?auto_652995 ?auto_652998 ) ) ( not ( = ?auto_652995 ?auto_652999 ) ) ( not ( = ?auto_652995 ?auto_653000 ) ) ( not ( = ?auto_652995 ?auto_653001 ) ) ( not ( = ?auto_652995 ?auto_653002 ) ) ( not ( = ?auto_652996 ?auto_652997 ) ) ( not ( = ?auto_652996 ?auto_652998 ) ) ( not ( = ?auto_652996 ?auto_652999 ) ) ( not ( = ?auto_652996 ?auto_653000 ) ) ( not ( = ?auto_652996 ?auto_653001 ) ) ( not ( = ?auto_652996 ?auto_653002 ) ) ( not ( = ?auto_652997 ?auto_652998 ) ) ( not ( = ?auto_652997 ?auto_652999 ) ) ( not ( = ?auto_652997 ?auto_653000 ) ) ( not ( = ?auto_652997 ?auto_653001 ) ) ( not ( = ?auto_652997 ?auto_653002 ) ) ( not ( = ?auto_652998 ?auto_652999 ) ) ( not ( = ?auto_652998 ?auto_653000 ) ) ( not ( = ?auto_652998 ?auto_653001 ) ) ( not ( = ?auto_652998 ?auto_653002 ) ) ( not ( = ?auto_652999 ?auto_653000 ) ) ( not ( = ?auto_652999 ?auto_653001 ) ) ( not ( = ?auto_652999 ?auto_653002 ) ) ( not ( = ?auto_653000 ?auto_653001 ) ) ( not ( = ?auto_653000 ?auto_653002 ) ) ( not ( = ?auto_653001 ?auto_653002 ) ) ( ON ?auto_653000 ?auto_653001 ) ( CLEAR ?auto_652998 ) ( ON ?auto_652999 ?auto_653000 ) ( CLEAR ?auto_652999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_652989 ?auto_652990 ?auto_652991 ?auto_652992 ?auto_652993 ?auto_652994 ?auto_652995 ?auto_652996 ?auto_652997 ?auto_652998 ?auto_652999 )
      ( MAKE-13PILE ?auto_652989 ?auto_652990 ?auto_652991 ?auto_652992 ?auto_652993 ?auto_652994 ?auto_652995 ?auto_652996 ?auto_652997 ?auto_652998 ?auto_652999 ?auto_653000 ?auto_653001 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_653043 - BLOCK
      ?auto_653044 - BLOCK
      ?auto_653045 - BLOCK
      ?auto_653046 - BLOCK
      ?auto_653047 - BLOCK
      ?auto_653048 - BLOCK
      ?auto_653049 - BLOCK
      ?auto_653050 - BLOCK
      ?auto_653051 - BLOCK
      ?auto_653052 - BLOCK
      ?auto_653053 - BLOCK
      ?auto_653054 - BLOCK
      ?auto_653055 - BLOCK
    )
    :vars
    (
      ?auto_653056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_653055 ?auto_653056 ) ( ON-TABLE ?auto_653043 ) ( ON ?auto_653044 ?auto_653043 ) ( ON ?auto_653045 ?auto_653044 ) ( ON ?auto_653046 ?auto_653045 ) ( ON ?auto_653047 ?auto_653046 ) ( ON ?auto_653048 ?auto_653047 ) ( ON ?auto_653049 ?auto_653048 ) ( ON ?auto_653050 ?auto_653049 ) ( ON ?auto_653051 ?auto_653050 ) ( not ( = ?auto_653043 ?auto_653044 ) ) ( not ( = ?auto_653043 ?auto_653045 ) ) ( not ( = ?auto_653043 ?auto_653046 ) ) ( not ( = ?auto_653043 ?auto_653047 ) ) ( not ( = ?auto_653043 ?auto_653048 ) ) ( not ( = ?auto_653043 ?auto_653049 ) ) ( not ( = ?auto_653043 ?auto_653050 ) ) ( not ( = ?auto_653043 ?auto_653051 ) ) ( not ( = ?auto_653043 ?auto_653052 ) ) ( not ( = ?auto_653043 ?auto_653053 ) ) ( not ( = ?auto_653043 ?auto_653054 ) ) ( not ( = ?auto_653043 ?auto_653055 ) ) ( not ( = ?auto_653043 ?auto_653056 ) ) ( not ( = ?auto_653044 ?auto_653045 ) ) ( not ( = ?auto_653044 ?auto_653046 ) ) ( not ( = ?auto_653044 ?auto_653047 ) ) ( not ( = ?auto_653044 ?auto_653048 ) ) ( not ( = ?auto_653044 ?auto_653049 ) ) ( not ( = ?auto_653044 ?auto_653050 ) ) ( not ( = ?auto_653044 ?auto_653051 ) ) ( not ( = ?auto_653044 ?auto_653052 ) ) ( not ( = ?auto_653044 ?auto_653053 ) ) ( not ( = ?auto_653044 ?auto_653054 ) ) ( not ( = ?auto_653044 ?auto_653055 ) ) ( not ( = ?auto_653044 ?auto_653056 ) ) ( not ( = ?auto_653045 ?auto_653046 ) ) ( not ( = ?auto_653045 ?auto_653047 ) ) ( not ( = ?auto_653045 ?auto_653048 ) ) ( not ( = ?auto_653045 ?auto_653049 ) ) ( not ( = ?auto_653045 ?auto_653050 ) ) ( not ( = ?auto_653045 ?auto_653051 ) ) ( not ( = ?auto_653045 ?auto_653052 ) ) ( not ( = ?auto_653045 ?auto_653053 ) ) ( not ( = ?auto_653045 ?auto_653054 ) ) ( not ( = ?auto_653045 ?auto_653055 ) ) ( not ( = ?auto_653045 ?auto_653056 ) ) ( not ( = ?auto_653046 ?auto_653047 ) ) ( not ( = ?auto_653046 ?auto_653048 ) ) ( not ( = ?auto_653046 ?auto_653049 ) ) ( not ( = ?auto_653046 ?auto_653050 ) ) ( not ( = ?auto_653046 ?auto_653051 ) ) ( not ( = ?auto_653046 ?auto_653052 ) ) ( not ( = ?auto_653046 ?auto_653053 ) ) ( not ( = ?auto_653046 ?auto_653054 ) ) ( not ( = ?auto_653046 ?auto_653055 ) ) ( not ( = ?auto_653046 ?auto_653056 ) ) ( not ( = ?auto_653047 ?auto_653048 ) ) ( not ( = ?auto_653047 ?auto_653049 ) ) ( not ( = ?auto_653047 ?auto_653050 ) ) ( not ( = ?auto_653047 ?auto_653051 ) ) ( not ( = ?auto_653047 ?auto_653052 ) ) ( not ( = ?auto_653047 ?auto_653053 ) ) ( not ( = ?auto_653047 ?auto_653054 ) ) ( not ( = ?auto_653047 ?auto_653055 ) ) ( not ( = ?auto_653047 ?auto_653056 ) ) ( not ( = ?auto_653048 ?auto_653049 ) ) ( not ( = ?auto_653048 ?auto_653050 ) ) ( not ( = ?auto_653048 ?auto_653051 ) ) ( not ( = ?auto_653048 ?auto_653052 ) ) ( not ( = ?auto_653048 ?auto_653053 ) ) ( not ( = ?auto_653048 ?auto_653054 ) ) ( not ( = ?auto_653048 ?auto_653055 ) ) ( not ( = ?auto_653048 ?auto_653056 ) ) ( not ( = ?auto_653049 ?auto_653050 ) ) ( not ( = ?auto_653049 ?auto_653051 ) ) ( not ( = ?auto_653049 ?auto_653052 ) ) ( not ( = ?auto_653049 ?auto_653053 ) ) ( not ( = ?auto_653049 ?auto_653054 ) ) ( not ( = ?auto_653049 ?auto_653055 ) ) ( not ( = ?auto_653049 ?auto_653056 ) ) ( not ( = ?auto_653050 ?auto_653051 ) ) ( not ( = ?auto_653050 ?auto_653052 ) ) ( not ( = ?auto_653050 ?auto_653053 ) ) ( not ( = ?auto_653050 ?auto_653054 ) ) ( not ( = ?auto_653050 ?auto_653055 ) ) ( not ( = ?auto_653050 ?auto_653056 ) ) ( not ( = ?auto_653051 ?auto_653052 ) ) ( not ( = ?auto_653051 ?auto_653053 ) ) ( not ( = ?auto_653051 ?auto_653054 ) ) ( not ( = ?auto_653051 ?auto_653055 ) ) ( not ( = ?auto_653051 ?auto_653056 ) ) ( not ( = ?auto_653052 ?auto_653053 ) ) ( not ( = ?auto_653052 ?auto_653054 ) ) ( not ( = ?auto_653052 ?auto_653055 ) ) ( not ( = ?auto_653052 ?auto_653056 ) ) ( not ( = ?auto_653053 ?auto_653054 ) ) ( not ( = ?auto_653053 ?auto_653055 ) ) ( not ( = ?auto_653053 ?auto_653056 ) ) ( not ( = ?auto_653054 ?auto_653055 ) ) ( not ( = ?auto_653054 ?auto_653056 ) ) ( not ( = ?auto_653055 ?auto_653056 ) ) ( ON ?auto_653054 ?auto_653055 ) ( ON ?auto_653053 ?auto_653054 ) ( CLEAR ?auto_653051 ) ( ON ?auto_653052 ?auto_653053 ) ( CLEAR ?auto_653052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_653043 ?auto_653044 ?auto_653045 ?auto_653046 ?auto_653047 ?auto_653048 ?auto_653049 ?auto_653050 ?auto_653051 ?auto_653052 )
      ( MAKE-13PILE ?auto_653043 ?auto_653044 ?auto_653045 ?auto_653046 ?auto_653047 ?auto_653048 ?auto_653049 ?auto_653050 ?auto_653051 ?auto_653052 ?auto_653053 ?auto_653054 ?auto_653055 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_653097 - BLOCK
      ?auto_653098 - BLOCK
      ?auto_653099 - BLOCK
      ?auto_653100 - BLOCK
      ?auto_653101 - BLOCK
      ?auto_653102 - BLOCK
      ?auto_653103 - BLOCK
      ?auto_653104 - BLOCK
      ?auto_653105 - BLOCK
      ?auto_653106 - BLOCK
      ?auto_653107 - BLOCK
      ?auto_653108 - BLOCK
      ?auto_653109 - BLOCK
    )
    :vars
    (
      ?auto_653110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_653109 ?auto_653110 ) ( ON-TABLE ?auto_653097 ) ( ON ?auto_653098 ?auto_653097 ) ( ON ?auto_653099 ?auto_653098 ) ( ON ?auto_653100 ?auto_653099 ) ( ON ?auto_653101 ?auto_653100 ) ( ON ?auto_653102 ?auto_653101 ) ( ON ?auto_653103 ?auto_653102 ) ( ON ?auto_653104 ?auto_653103 ) ( not ( = ?auto_653097 ?auto_653098 ) ) ( not ( = ?auto_653097 ?auto_653099 ) ) ( not ( = ?auto_653097 ?auto_653100 ) ) ( not ( = ?auto_653097 ?auto_653101 ) ) ( not ( = ?auto_653097 ?auto_653102 ) ) ( not ( = ?auto_653097 ?auto_653103 ) ) ( not ( = ?auto_653097 ?auto_653104 ) ) ( not ( = ?auto_653097 ?auto_653105 ) ) ( not ( = ?auto_653097 ?auto_653106 ) ) ( not ( = ?auto_653097 ?auto_653107 ) ) ( not ( = ?auto_653097 ?auto_653108 ) ) ( not ( = ?auto_653097 ?auto_653109 ) ) ( not ( = ?auto_653097 ?auto_653110 ) ) ( not ( = ?auto_653098 ?auto_653099 ) ) ( not ( = ?auto_653098 ?auto_653100 ) ) ( not ( = ?auto_653098 ?auto_653101 ) ) ( not ( = ?auto_653098 ?auto_653102 ) ) ( not ( = ?auto_653098 ?auto_653103 ) ) ( not ( = ?auto_653098 ?auto_653104 ) ) ( not ( = ?auto_653098 ?auto_653105 ) ) ( not ( = ?auto_653098 ?auto_653106 ) ) ( not ( = ?auto_653098 ?auto_653107 ) ) ( not ( = ?auto_653098 ?auto_653108 ) ) ( not ( = ?auto_653098 ?auto_653109 ) ) ( not ( = ?auto_653098 ?auto_653110 ) ) ( not ( = ?auto_653099 ?auto_653100 ) ) ( not ( = ?auto_653099 ?auto_653101 ) ) ( not ( = ?auto_653099 ?auto_653102 ) ) ( not ( = ?auto_653099 ?auto_653103 ) ) ( not ( = ?auto_653099 ?auto_653104 ) ) ( not ( = ?auto_653099 ?auto_653105 ) ) ( not ( = ?auto_653099 ?auto_653106 ) ) ( not ( = ?auto_653099 ?auto_653107 ) ) ( not ( = ?auto_653099 ?auto_653108 ) ) ( not ( = ?auto_653099 ?auto_653109 ) ) ( not ( = ?auto_653099 ?auto_653110 ) ) ( not ( = ?auto_653100 ?auto_653101 ) ) ( not ( = ?auto_653100 ?auto_653102 ) ) ( not ( = ?auto_653100 ?auto_653103 ) ) ( not ( = ?auto_653100 ?auto_653104 ) ) ( not ( = ?auto_653100 ?auto_653105 ) ) ( not ( = ?auto_653100 ?auto_653106 ) ) ( not ( = ?auto_653100 ?auto_653107 ) ) ( not ( = ?auto_653100 ?auto_653108 ) ) ( not ( = ?auto_653100 ?auto_653109 ) ) ( not ( = ?auto_653100 ?auto_653110 ) ) ( not ( = ?auto_653101 ?auto_653102 ) ) ( not ( = ?auto_653101 ?auto_653103 ) ) ( not ( = ?auto_653101 ?auto_653104 ) ) ( not ( = ?auto_653101 ?auto_653105 ) ) ( not ( = ?auto_653101 ?auto_653106 ) ) ( not ( = ?auto_653101 ?auto_653107 ) ) ( not ( = ?auto_653101 ?auto_653108 ) ) ( not ( = ?auto_653101 ?auto_653109 ) ) ( not ( = ?auto_653101 ?auto_653110 ) ) ( not ( = ?auto_653102 ?auto_653103 ) ) ( not ( = ?auto_653102 ?auto_653104 ) ) ( not ( = ?auto_653102 ?auto_653105 ) ) ( not ( = ?auto_653102 ?auto_653106 ) ) ( not ( = ?auto_653102 ?auto_653107 ) ) ( not ( = ?auto_653102 ?auto_653108 ) ) ( not ( = ?auto_653102 ?auto_653109 ) ) ( not ( = ?auto_653102 ?auto_653110 ) ) ( not ( = ?auto_653103 ?auto_653104 ) ) ( not ( = ?auto_653103 ?auto_653105 ) ) ( not ( = ?auto_653103 ?auto_653106 ) ) ( not ( = ?auto_653103 ?auto_653107 ) ) ( not ( = ?auto_653103 ?auto_653108 ) ) ( not ( = ?auto_653103 ?auto_653109 ) ) ( not ( = ?auto_653103 ?auto_653110 ) ) ( not ( = ?auto_653104 ?auto_653105 ) ) ( not ( = ?auto_653104 ?auto_653106 ) ) ( not ( = ?auto_653104 ?auto_653107 ) ) ( not ( = ?auto_653104 ?auto_653108 ) ) ( not ( = ?auto_653104 ?auto_653109 ) ) ( not ( = ?auto_653104 ?auto_653110 ) ) ( not ( = ?auto_653105 ?auto_653106 ) ) ( not ( = ?auto_653105 ?auto_653107 ) ) ( not ( = ?auto_653105 ?auto_653108 ) ) ( not ( = ?auto_653105 ?auto_653109 ) ) ( not ( = ?auto_653105 ?auto_653110 ) ) ( not ( = ?auto_653106 ?auto_653107 ) ) ( not ( = ?auto_653106 ?auto_653108 ) ) ( not ( = ?auto_653106 ?auto_653109 ) ) ( not ( = ?auto_653106 ?auto_653110 ) ) ( not ( = ?auto_653107 ?auto_653108 ) ) ( not ( = ?auto_653107 ?auto_653109 ) ) ( not ( = ?auto_653107 ?auto_653110 ) ) ( not ( = ?auto_653108 ?auto_653109 ) ) ( not ( = ?auto_653108 ?auto_653110 ) ) ( not ( = ?auto_653109 ?auto_653110 ) ) ( ON ?auto_653108 ?auto_653109 ) ( ON ?auto_653107 ?auto_653108 ) ( ON ?auto_653106 ?auto_653107 ) ( CLEAR ?auto_653104 ) ( ON ?auto_653105 ?auto_653106 ) ( CLEAR ?auto_653105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_653097 ?auto_653098 ?auto_653099 ?auto_653100 ?auto_653101 ?auto_653102 ?auto_653103 ?auto_653104 ?auto_653105 )
      ( MAKE-13PILE ?auto_653097 ?auto_653098 ?auto_653099 ?auto_653100 ?auto_653101 ?auto_653102 ?auto_653103 ?auto_653104 ?auto_653105 ?auto_653106 ?auto_653107 ?auto_653108 ?auto_653109 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_653151 - BLOCK
      ?auto_653152 - BLOCK
      ?auto_653153 - BLOCK
      ?auto_653154 - BLOCK
      ?auto_653155 - BLOCK
      ?auto_653156 - BLOCK
      ?auto_653157 - BLOCK
      ?auto_653158 - BLOCK
      ?auto_653159 - BLOCK
      ?auto_653160 - BLOCK
      ?auto_653161 - BLOCK
      ?auto_653162 - BLOCK
      ?auto_653163 - BLOCK
    )
    :vars
    (
      ?auto_653164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_653163 ?auto_653164 ) ( ON-TABLE ?auto_653151 ) ( ON ?auto_653152 ?auto_653151 ) ( ON ?auto_653153 ?auto_653152 ) ( ON ?auto_653154 ?auto_653153 ) ( ON ?auto_653155 ?auto_653154 ) ( ON ?auto_653156 ?auto_653155 ) ( ON ?auto_653157 ?auto_653156 ) ( not ( = ?auto_653151 ?auto_653152 ) ) ( not ( = ?auto_653151 ?auto_653153 ) ) ( not ( = ?auto_653151 ?auto_653154 ) ) ( not ( = ?auto_653151 ?auto_653155 ) ) ( not ( = ?auto_653151 ?auto_653156 ) ) ( not ( = ?auto_653151 ?auto_653157 ) ) ( not ( = ?auto_653151 ?auto_653158 ) ) ( not ( = ?auto_653151 ?auto_653159 ) ) ( not ( = ?auto_653151 ?auto_653160 ) ) ( not ( = ?auto_653151 ?auto_653161 ) ) ( not ( = ?auto_653151 ?auto_653162 ) ) ( not ( = ?auto_653151 ?auto_653163 ) ) ( not ( = ?auto_653151 ?auto_653164 ) ) ( not ( = ?auto_653152 ?auto_653153 ) ) ( not ( = ?auto_653152 ?auto_653154 ) ) ( not ( = ?auto_653152 ?auto_653155 ) ) ( not ( = ?auto_653152 ?auto_653156 ) ) ( not ( = ?auto_653152 ?auto_653157 ) ) ( not ( = ?auto_653152 ?auto_653158 ) ) ( not ( = ?auto_653152 ?auto_653159 ) ) ( not ( = ?auto_653152 ?auto_653160 ) ) ( not ( = ?auto_653152 ?auto_653161 ) ) ( not ( = ?auto_653152 ?auto_653162 ) ) ( not ( = ?auto_653152 ?auto_653163 ) ) ( not ( = ?auto_653152 ?auto_653164 ) ) ( not ( = ?auto_653153 ?auto_653154 ) ) ( not ( = ?auto_653153 ?auto_653155 ) ) ( not ( = ?auto_653153 ?auto_653156 ) ) ( not ( = ?auto_653153 ?auto_653157 ) ) ( not ( = ?auto_653153 ?auto_653158 ) ) ( not ( = ?auto_653153 ?auto_653159 ) ) ( not ( = ?auto_653153 ?auto_653160 ) ) ( not ( = ?auto_653153 ?auto_653161 ) ) ( not ( = ?auto_653153 ?auto_653162 ) ) ( not ( = ?auto_653153 ?auto_653163 ) ) ( not ( = ?auto_653153 ?auto_653164 ) ) ( not ( = ?auto_653154 ?auto_653155 ) ) ( not ( = ?auto_653154 ?auto_653156 ) ) ( not ( = ?auto_653154 ?auto_653157 ) ) ( not ( = ?auto_653154 ?auto_653158 ) ) ( not ( = ?auto_653154 ?auto_653159 ) ) ( not ( = ?auto_653154 ?auto_653160 ) ) ( not ( = ?auto_653154 ?auto_653161 ) ) ( not ( = ?auto_653154 ?auto_653162 ) ) ( not ( = ?auto_653154 ?auto_653163 ) ) ( not ( = ?auto_653154 ?auto_653164 ) ) ( not ( = ?auto_653155 ?auto_653156 ) ) ( not ( = ?auto_653155 ?auto_653157 ) ) ( not ( = ?auto_653155 ?auto_653158 ) ) ( not ( = ?auto_653155 ?auto_653159 ) ) ( not ( = ?auto_653155 ?auto_653160 ) ) ( not ( = ?auto_653155 ?auto_653161 ) ) ( not ( = ?auto_653155 ?auto_653162 ) ) ( not ( = ?auto_653155 ?auto_653163 ) ) ( not ( = ?auto_653155 ?auto_653164 ) ) ( not ( = ?auto_653156 ?auto_653157 ) ) ( not ( = ?auto_653156 ?auto_653158 ) ) ( not ( = ?auto_653156 ?auto_653159 ) ) ( not ( = ?auto_653156 ?auto_653160 ) ) ( not ( = ?auto_653156 ?auto_653161 ) ) ( not ( = ?auto_653156 ?auto_653162 ) ) ( not ( = ?auto_653156 ?auto_653163 ) ) ( not ( = ?auto_653156 ?auto_653164 ) ) ( not ( = ?auto_653157 ?auto_653158 ) ) ( not ( = ?auto_653157 ?auto_653159 ) ) ( not ( = ?auto_653157 ?auto_653160 ) ) ( not ( = ?auto_653157 ?auto_653161 ) ) ( not ( = ?auto_653157 ?auto_653162 ) ) ( not ( = ?auto_653157 ?auto_653163 ) ) ( not ( = ?auto_653157 ?auto_653164 ) ) ( not ( = ?auto_653158 ?auto_653159 ) ) ( not ( = ?auto_653158 ?auto_653160 ) ) ( not ( = ?auto_653158 ?auto_653161 ) ) ( not ( = ?auto_653158 ?auto_653162 ) ) ( not ( = ?auto_653158 ?auto_653163 ) ) ( not ( = ?auto_653158 ?auto_653164 ) ) ( not ( = ?auto_653159 ?auto_653160 ) ) ( not ( = ?auto_653159 ?auto_653161 ) ) ( not ( = ?auto_653159 ?auto_653162 ) ) ( not ( = ?auto_653159 ?auto_653163 ) ) ( not ( = ?auto_653159 ?auto_653164 ) ) ( not ( = ?auto_653160 ?auto_653161 ) ) ( not ( = ?auto_653160 ?auto_653162 ) ) ( not ( = ?auto_653160 ?auto_653163 ) ) ( not ( = ?auto_653160 ?auto_653164 ) ) ( not ( = ?auto_653161 ?auto_653162 ) ) ( not ( = ?auto_653161 ?auto_653163 ) ) ( not ( = ?auto_653161 ?auto_653164 ) ) ( not ( = ?auto_653162 ?auto_653163 ) ) ( not ( = ?auto_653162 ?auto_653164 ) ) ( not ( = ?auto_653163 ?auto_653164 ) ) ( ON ?auto_653162 ?auto_653163 ) ( ON ?auto_653161 ?auto_653162 ) ( ON ?auto_653160 ?auto_653161 ) ( ON ?auto_653159 ?auto_653160 ) ( CLEAR ?auto_653157 ) ( ON ?auto_653158 ?auto_653159 ) ( CLEAR ?auto_653158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_653151 ?auto_653152 ?auto_653153 ?auto_653154 ?auto_653155 ?auto_653156 ?auto_653157 ?auto_653158 )
      ( MAKE-13PILE ?auto_653151 ?auto_653152 ?auto_653153 ?auto_653154 ?auto_653155 ?auto_653156 ?auto_653157 ?auto_653158 ?auto_653159 ?auto_653160 ?auto_653161 ?auto_653162 ?auto_653163 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_653205 - BLOCK
      ?auto_653206 - BLOCK
      ?auto_653207 - BLOCK
      ?auto_653208 - BLOCK
      ?auto_653209 - BLOCK
      ?auto_653210 - BLOCK
      ?auto_653211 - BLOCK
      ?auto_653212 - BLOCK
      ?auto_653213 - BLOCK
      ?auto_653214 - BLOCK
      ?auto_653215 - BLOCK
      ?auto_653216 - BLOCK
      ?auto_653217 - BLOCK
    )
    :vars
    (
      ?auto_653218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_653217 ?auto_653218 ) ( ON-TABLE ?auto_653205 ) ( ON ?auto_653206 ?auto_653205 ) ( ON ?auto_653207 ?auto_653206 ) ( ON ?auto_653208 ?auto_653207 ) ( ON ?auto_653209 ?auto_653208 ) ( ON ?auto_653210 ?auto_653209 ) ( not ( = ?auto_653205 ?auto_653206 ) ) ( not ( = ?auto_653205 ?auto_653207 ) ) ( not ( = ?auto_653205 ?auto_653208 ) ) ( not ( = ?auto_653205 ?auto_653209 ) ) ( not ( = ?auto_653205 ?auto_653210 ) ) ( not ( = ?auto_653205 ?auto_653211 ) ) ( not ( = ?auto_653205 ?auto_653212 ) ) ( not ( = ?auto_653205 ?auto_653213 ) ) ( not ( = ?auto_653205 ?auto_653214 ) ) ( not ( = ?auto_653205 ?auto_653215 ) ) ( not ( = ?auto_653205 ?auto_653216 ) ) ( not ( = ?auto_653205 ?auto_653217 ) ) ( not ( = ?auto_653205 ?auto_653218 ) ) ( not ( = ?auto_653206 ?auto_653207 ) ) ( not ( = ?auto_653206 ?auto_653208 ) ) ( not ( = ?auto_653206 ?auto_653209 ) ) ( not ( = ?auto_653206 ?auto_653210 ) ) ( not ( = ?auto_653206 ?auto_653211 ) ) ( not ( = ?auto_653206 ?auto_653212 ) ) ( not ( = ?auto_653206 ?auto_653213 ) ) ( not ( = ?auto_653206 ?auto_653214 ) ) ( not ( = ?auto_653206 ?auto_653215 ) ) ( not ( = ?auto_653206 ?auto_653216 ) ) ( not ( = ?auto_653206 ?auto_653217 ) ) ( not ( = ?auto_653206 ?auto_653218 ) ) ( not ( = ?auto_653207 ?auto_653208 ) ) ( not ( = ?auto_653207 ?auto_653209 ) ) ( not ( = ?auto_653207 ?auto_653210 ) ) ( not ( = ?auto_653207 ?auto_653211 ) ) ( not ( = ?auto_653207 ?auto_653212 ) ) ( not ( = ?auto_653207 ?auto_653213 ) ) ( not ( = ?auto_653207 ?auto_653214 ) ) ( not ( = ?auto_653207 ?auto_653215 ) ) ( not ( = ?auto_653207 ?auto_653216 ) ) ( not ( = ?auto_653207 ?auto_653217 ) ) ( not ( = ?auto_653207 ?auto_653218 ) ) ( not ( = ?auto_653208 ?auto_653209 ) ) ( not ( = ?auto_653208 ?auto_653210 ) ) ( not ( = ?auto_653208 ?auto_653211 ) ) ( not ( = ?auto_653208 ?auto_653212 ) ) ( not ( = ?auto_653208 ?auto_653213 ) ) ( not ( = ?auto_653208 ?auto_653214 ) ) ( not ( = ?auto_653208 ?auto_653215 ) ) ( not ( = ?auto_653208 ?auto_653216 ) ) ( not ( = ?auto_653208 ?auto_653217 ) ) ( not ( = ?auto_653208 ?auto_653218 ) ) ( not ( = ?auto_653209 ?auto_653210 ) ) ( not ( = ?auto_653209 ?auto_653211 ) ) ( not ( = ?auto_653209 ?auto_653212 ) ) ( not ( = ?auto_653209 ?auto_653213 ) ) ( not ( = ?auto_653209 ?auto_653214 ) ) ( not ( = ?auto_653209 ?auto_653215 ) ) ( not ( = ?auto_653209 ?auto_653216 ) ) ( not ( = ?auto_653209 ?auto_653217 ) ) ( not ( = ?auto_653209 ?auto_653218 ) ) ( not ( = ?auto_653210 ?auto_653211 ) ) ( not ( = ?auto_653210 ?auto_653212 ) ) ( not ( = ?auto_653210 ?auto_653213 ) ) ( not ( = ?auto_653210 ?auto_653214 ) ) ( not ( = ?auto_653210 ?auto_653215 ) ) ( not ( = ?auto_653210 ?auto_653216 ) ) ( not ( = ?auto_653210 ?auto_653217 ) ) ( not ( = ?auto_653210 ?auto_653218 ) ) ( not ( = ?auto_653211 ?auto_653212 ) ) ( not ( = ?auto_653211 ?auto_653213 ) ) ( not ( = ?auto_653211 ?auto_653214 ) ) ( not ( = ?auto_653211 ?auto_653215 ) ) ( not ( = ?auto_653211 ?auto_653216 ) ) ( not ( = ?auto_653211 ?auto_653217 ) ) ( not ( = ?auto_653211 ?auto_653218 ) ) ( not ( = ?auto_653212 ?auto_653213 ) ) ( not ( = ?auto_653212 ?auto_653214 ) ) ( not ( = ?auto_653212 ?auto_653215 ) ) ( not ( = ?auto_653212 ?auto_653216 ) ) ( not ( = ?auto_653212 ?auto_653217 ) ) ( not ( = ?auto_653212 ?auto_653218 ) ) ( not ( = ?auto_653213 ?auto_653214 ) ) ( not ( = ?auto_653213 ?auto_653215 ) ) ( not ( = ?auto_653213 ?auto_653216 ) ) ( not ( = ?auto_653213 ?auto_653217 ) ) ( not ( = ?auto_653213 ?auto_653218 ) ) ( not ( = ?auto_653214 ?auto_653215 ) ) ( not ( = ?auto_653214 ?auto_653216 ) ) ( not ( = ?auto_653214 ?auto_653217 ) ) ( not ( = ?auto_653214 ?auto_653218 ) ) ( not ( = ?auto_653215 ?auto_653216 ) ) ( not ( = ?auto_653215 ?auto_653217 ) ) ( not ( = ?auto_653215 ?auto_653218 ) ) ( not ( = ?auto_653216 ?auto_653217 ) ) ( not ( = ?auto_653216 ?auto_653218 ) ) ( not ( = ?auto_653217 ?auto_653218 ) ) ( ON ?auto_653216 ?auto_653217 ) ( ON ?auto_653215 ?auto_653216 ) ( ON ?auto_653214 ?auto_653215 ) ( ON ?auto_653213 ?auto_653214 ) ( ON ?auto_653212 ?auto_653213 ) ( CLEAR ?auto_653210 ) ( ON ?auto_653211 ?auto_653212 ) ( CLEAR ?auto_653211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_653205 ?auto_653206 ?auto_653207 ?auto_653208 ?auto_653209 ?auto_653210 ?auto_653211 )
      ( MAKE-13PILE ?auto_653205 ?auto_653206 ?auto_653207 ?auto_653208 ?auto_653209 ?auto_653210 ?auto_653211 ?auto_653212 ?auto_653213 ?auto_653214 ?auto_653215 ?auto_653216 ?auto_653217 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_653259 - BLOCK
      ?auto_653260 - BLOCK
      ?auto_653261 - BLOCK
      ?auto_653262 - BLOCK
      ?auto_653263 - BLOCK
      ?auto_653264 - BLOCK
      ?auto_653265 - BLOCK
      ?auto_653266 - BLOCK
      ?auto_653267 - BLOCK
      ?auto_653268 - BLOCK
      ?auto_653269 - BLOCK
      ?auto_653270 - BLOCK
      ?auto_653271 - BLOCK
    )
    :vars
    (
      ?auto_653272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_653271 ?auto_653272 ) ( ON-TABLE ?auto_653259 ) ( ON ?auto_653260 ?auto_653259 ) ( ON ?auto_653261 ?auto_653260 ) ( ON ?auto_653262 ?auto_653261 ) ( ON ?auto_653263 ?auto_653262 ) ( not ( = ?auto_653259 ?auto_653260 ) ) ( not ( = ?auto_653259 ?auto_653261 ) ) ( not ( = ?auto_653259 ?auto_653262 ) ) ( not ( = ?auto_653259 ?auto_653263 ) ) ( not ( = ?auto_653259 ?auto_653264 ) ) ( not ( = ?auto_653259 ?auto_653265 ) ) ( not ( = ?auto_653259 ?auto_653266 ) ) ( not ( = ?auto_653259 ?auto_653267 ) ) ( not ( = ?auto_653259 ?auto_653268 ) ) ( not ( = ?auto_653259 ?auto_653269 ) ) ( not ( = ?auto_653259 ?auto_653270 ) ) ( not ( = ?auto_653259 ?auto_653271 ) ) ( not ( = ?auto_653259 ?auto_653272 ) ) ( not ( = ?auto_653260 ?auto_653261 ) ) ( not ( = ?auto_653260 ?auto_653262 ) ) ( not ( = ?auto_653260 ?auto_653263 ) ) ( not ( = ?auto_653260 ?auto_653264 ) ) ( not ( = ?auto_653260 ?auto_653265 ) ) ( not ( = ?auto_653260 ?auto_653266 ) ) ( not ( = ?auto_653260 ?auto_653267 ) ) ( not ( = ?auto_653260 ?auto_653268 ) ) ( not ( = ?auto_653260 ?auto_653269 ) ) ( not ( = ?auto_653260 ?auto_653270 ) ) ( not ( = ?auto_653260 ?auto_653271 ) ) ( not ( = ?auto_653260 ?auto_653272 ) ) ( not ( = ?auto_653261 ?auto_653262 ) ) ( not ( = ?auto_653261 ?auto_653263 ) ) ( not ( = ?auto_653261 ?auto_653264 ) ) ( not ( = ?auto_653261 ?auto_653265 ) ) ( not ( = ?auto_653261 ?auto_653266 ) ) ( not ( = ?auto_653261 ?auto_653267 ) ) ( not ( = ?auto_653261 ?auto_653268 ) ) ( not ( = ?auto_653261 ?auto_653269 ) ) ( not ( = ?auto_653261 ?auto_653270 ) ) ( not ( = ?auto_653261 ?auto_653271 ) ) ( not ( = ?auto_653261 ?auto_653272 ) ) ( not ( = ?auto_653262 ?auto_653263 ) ) ( not ( = ?auto_653262 ?auto_653264 ) ) ( not ( = ?auto_653262 ?auto_653265 ) ) ( not ( = ?auto_653262 ?auto_653266 ) ) ( not ( = ?auto_653262 ?auto_653267 ) ) ( not ( = ?auto_653262 ?auto_653268 ) ) ( not ( = ?auto_653262 ?auto_653269 ) ) ( not ( = ?auto_653262 ?auto_653270 ) ) ( not ( = ?auto_653262 ?auto_653271 ) ) ( not ( = ?auto_653262 ?auto_653272 ) ) ( not ( = ?auto_653263 ?auto_653264 ) ) ( not ( = ?auto_653263 ?auto_653265 ) ) ( not ( = ?auto_653263 ?auto_653266 ) ) ( not ( = ?auto_653263 ?auto_653267 ) ) ( not ( = ?auto_653263 ?auto_653268 ) ) ( not ( = ?auto_653263 ?auto_653269 ) ) ( not ( = ?auto_653263 ?auto_653270 ) ) ( not ( = ?auto_653263 ?auto_653271 ) ) ( not ( = ?auto_653263 ?auto_653272 ) ) ( not ( = ?auto_653264 ?auto_653265 ) ) ( not ( = ?auto_653264 ?auto_653266 ) ) ( not ( = ?auto_653264 ?auto_653267 ) ) ( not ( = ?auto_653264 ?auto_653268 ) ) ( not ( = ?auto_653264 ?auto_653269 ) ) ( not ( = ?auto_653264 ?auto_653270 ) ) ( not ( = ?auto_653264 ?auto_653271 ) ) ( not ( = ?auto_653264 ?auto_653272 ) ) ( not ( = ?auto_653265 ?auto_653266 ) ) ( not ( = ?auto_653265 ?auto_653267 ) ) ( not ( = ?auto_653265 ?auto_653268 ) ) ( not ( = ?auto_653265 ?auto_653269 ) ) ( not ( = ?auto_653265 ?auto_653270 ) ) ( not ( = ?auto_653265 ?auto_653271 ) ) ( not ( = ?auto_653265 ?auto_653272 ) ) ( not ( = ?auto_653266 ?auto_653267 ) ) ( not ( = ?auto_653266 ?auto_653268 ) ) ( not ( = ?auto_653266 ?auto_653269 ) ) ( not ( = ?auto_653266 ?auto_653270 ) ) ( not ( = ?auto_653266 ?auto_653271 ) ) ( not ( = ?auto_653266 ?auto_653272 ) ) ( not ( = ?auto_653267 ?auto_653268 ) ) ( not ( = ?auto_653267 ?auto_653269 ) ) ( not ( = ?auto_653267 ?auto_653270 ) ) ( not ( = ?auto_653267 ?auto_653271 ) ) ( not ( = ?auto_653267 ?auto_653272 ) ) ( not ( = ?auto_653268 ?auto_653269 ) ) ( not ( = ?auto_653268 ?auto_653270 ) ) ( not ( = ?auto_653268 ?auto_653271 ) ) ( not ( = ?auto_653268 ?auto_653272 ) ) ( not ( = ?auto_653269 ?auto_653270 ) ) ( not ( = ?auto_653269 ?auto_653271 ) ) ( not ( = ?auto_653269 ?auto_653272 ) ) ( not ( = ?auto_653270 ?auto_653271 ) ) ( not ( = ?auto_653270 ?auto_653272 ) ) ( not ( = ?auto_653271 ?auto_653272 ) ) ( ON ?auto_653270 ?auto_653271 ) ( ON ?auto_653269 ?auto_653270 ) ( ON ?auto_653268 ?auto_653269 ) ( ON ?auto_653267 ?auto_653268 ) ( ON ?auto_653266 ?auto_653267 ) ( ON ?auto_653265 ?auto_653266 ) ( CLEAR ?auto_653263 ) ( ON ?auto_653264 ?auto_653265 ) ( CLEAR ?auto_653264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_653259 ?auto_653260 ?auto_653261 ?auto_653262 ?auto_653263 ?auto_653264 )
      ( MAKE-13PILE ?auto_653259 ?auto_653260 ?auto_653261 ?auto_653262 ?auto_653263 ?auto_653264 ?auto_653265 ?auto_653266 ?auto_653267 ?auto_653268 ?auto_653269 ?auto_653270 ?auto_653271 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_653313 - BLOCK
      ?auto_653314 - BLOCK
      ?auto_653315 - BLOCK
      ?auto_653316 - BLOCK
      ?auto_653317 - BLOCK
      ?auto_653318 - BLOCK
      ?auto_653319 - BLOCK
      ?auto_653320 - BLOCK
      ?auto_653321 - BLOCK
      ?auto_653322 - BLOCK
      ?auto_653323 - BLOCK
      ?auto_653324 - BLOCK
      ?auto_653325 - BLOCK
    )
    :vars
    (
      ?auto_653326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_653325 ?auto_653326 ) ( ON-TABLE ?auto_653313 ) ( ON ?auto_653314 ?auto_653313 ) ( ON ?auto_653315 ?auto_653314 ) ( ON ?auto_653316 ?auto_653315 ) ( not ( = ?auto_653313 ?auto_653314 ) ) ( not ( = ?auto_653313 ?auto_653315 ) ) ( not ( = ?auto_653313 ?auto_653316 ) ) ( not ( = ?auto_653313 ?auto_653317 ) ) ( not ( = ?auto_653313 ?auto_653318 ) ) ( not ( = ?auto_653313 ?auto_653319 ) ) ( not ( = ?auto_653313 ?auto_653320 ) ) ( not ( = ?auto_653313 ?auto_653321 ) ) ( not ( = ?auto_653313 ?auto_653322 ) ) ( not ( = ?auto_653313 ?auto_653323 ) ) ( not ( = ?auto_653313 ?auto_653324 ) ) ( not ( = ?auto_653313 ?auto_653325 ) ) ( not ( = ?auto_653313 ?auto_653326 ) ) ( not ( = ?auto_653314 ?auto_653315 ) ) ( not ( = ?auto_653314 ?auto_653316 ) ) ( not ( = ?auto_653314 ?auto_653317 ) ) ( not ( = ?auto_653314 ?auto_653318 ) ) ( not ( = ?auto_653314 ?auto_653319 ) ) ( not ( = ?auto_653314 ?auto_653320 ) ) ( not ( = ?auto_653314 ?auto_653321 ) ) ( not ( = ?auto_653314 ?auto_653322 ) ) ( not ( = ?auto_653314 ?auto_653323 ) ) ( not ( = ?auto_653314 ?auto_653324 ) ) ( not ( = ?auto_653314 ?auto_653325 ) ) ( not ( = ?auto_653314 ?auto_653326 ) ) ( not ( = ?auto_653315 ?auto_653316 ) ) ( not ( = ?auto_653315 ?auto_653317 ) ) ( not ( = ?auto_653315 ?auto_653318 ) ) ( not ( = ?auto_653315 ?auto_653319 ) ) ( not ( = ?auto_653315 ?auto_653320 ) ) ( not ( = ?auto_653315 ?auto_653321 ) ) ( not ( = ?auto_653315 ?auto_653322 ) ) ( not ( = ?auto_653315 ?auto_653323 ) ) ( not ( = ?auto_653315 ?auto_653324 ) ) ( not ( = ?auto_653315 ?auto_653325 ) ) ( not ( = ?auto_653315 ?auto_653326 ) ) ( not ( = ?auto_653316 ?auto_653317 ) ) ( not ( = ?auto_653316 ?auto_653318 ) ) ( not ( = ?auto_653316 ?auto_653319 ) ) ( not ( = ?auto_653316 ?auto_653320 ) ) ( not ( = ?auto_653316 ?auto_653321 ) ) ( not ( = ?auto_653316 ?auto_653322 ) ) ( not ( = ?auto_653316 ?auto_653323 ) ) ( not ( = ?auto_653316 ?auto_653324 ) ) ( not ( = ?auto_653316 ?auto_653325 ) ) ( not ( = ?auto_653316 ?auto_653326 ) ) ( not ( = ?auto_653317 ?auto_653318 ) ) ( not ( = ?auto_653317 ?auto_653319 ) ) ( not ( = ?auto_653317 ?auto_653320 ) ) ( not ( = ?auto_653317 ?auto_653321 ) ) ( not ( = ?auto_653317 ?auto_653322 ) ) ( not ( = ?auto_653317 ?auto_653323 ) ) ( not ( = ?auto_653317 ?auto_653324 ) ) ( not ( = ?auto_653317 ?auto_653325 ) ) ( not ( = ?auto_653317 ?auto_653326 ) ) ( not ( = ?auto_653318 ?auto_653319 ) ) ( not ( = ?auto_653318 ?auto_653320 ) ) ( not ( = ?auto_653318 ?auto_653321 ) ) ( not ( = ?auto_653318 ?auto_653322 ) ) ( not ( = ?auto_653318 ?auto_653323 ) ) ( not ( = ?auto_653318 ?auto_653324 ) ) ( not ( = ?auto_653318 ?auto_653325 ) ) ( not ( = ?auto_653318 ?auto_653326 ) ) ( not ( = ?auto_653319 ?auto_653320 ) ) ( not ( = ?auto_653319 ?auto_653321 ) ) ( not ( = ?auto_653319 ?auto_653322 ) ) ( not ( = ?auto_653319 ?auto_653323 ) ) ( not ( = ?auto_653319 ?auto_653324 ) ) ( not ( = ?auto_653319 ?auto_653325 ) ) ( not ( = ?auto_653319 ?auto_653326 ) ) ( not ( = ?auto_653320 ?auto_653321 ) ) ( not ( = ?auto_653320 ?auto_653322 ) ) ( not ( = ?auto_653320 ?auto_653323 ) ) ( not ( = ?auto_653320 ?auto_653324 ) ) ( not ( = ?auto_653320 ?auto_653325 ) ) ( not ( = ?auto_653320 ?auto_653326 ) ) ( not ( = ?auto_653321 ?auto_653322 ) ) ( not ( = ?auto_653321 ?auto_653323 ) ) ( not ( = ?auto_653321 ?auto_653324 ) ) ( not ( = ?auto_653321 ?auto_653325 ) ) ( not ( = ?auto_653321 ?auto_653326 ) ) ( not ( = ?auto_653322 ?auto_653323 ) ) ( not ( = ?auto_653322 ?auto_653324 ) ) ( not ( = ?auto_653322 ?auto_653325 ) ) ( not ( = ?auto_653322 ?auto_653326 ) ) ( not ( = ?auto_653323 ?auto_653324 ) ) ( not ( = ?auto_653323 ?auto_653325 ) ) ( not ( = ?auto_653323 ?auto_653326 ) ) ( not ( = ?auto_653324 ?auto_653325 ) ) ( not ( = ?auto_653324 ?auto_653326 ) ) ( not ( = ?auto_653325 ?auto_653326 ) ) ( ON ?auto_653324 ?auto_653325 ) ( ON ?auto_653323 ?auto_653324 ) ( ON ?auto_653322 ?auto_653323 ) ( ON ?auto_653321 ?auto_653322 ) ( ON ?auto_653320 ?auto_653321 ) ( ON ?auto_653319 ?auto_653320 ) ( ON ?auto_653318 ?auto_653319 ) ( CLEAR ?auto_653316 ) ( ON ?auto_653317 ?auto_653318 ) ( CLEAR ?auto_653317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_653313 ?auto_653314 ?auto_653315 ?auto_653316 ?auto_653317 )
      ( MAKE-13PILE ?auto_653313 ?auto_653314 ?auto_653315 ?auto_653316 ?auto_653317 ?auto_653318 ?auto_653319 ?auto_653320 ?auto_653321 ?auto_653322 ?auto_653323 ?auto_653324 ?auto_653325 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_653367 - BLOCK
      ?auto_653368 - BLOCK
      ?auto_653369 - BLOCK
      ?auto_653370 - BLOCK
      ?auto_653371 - BLOCK
      ?auto_653372 - BLOCK
      ?auto_653373 - BLOCK
      ?auto_653374 - BLOCK
      ?auto_653375 - BLOCK
      ?auto_653376 - BLOCK
      ?auto_653377 - BLOCK
      ?auto_653378 - BLOCK
      ?auto_653379 - BLOCK
    )
    :vars
    (
      ?auto_653380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_653379 ?auto_653380 ) ( ON-TABLE ?auto_653367 ) ( ON ?auto_653368 ?auto_653367 ) ( ON ?auto_653369 ?auto_653368 ) ( not ( = ?auto_653367 ?auto_653368 ) ) ( not ( = ?auto_653367 ?auto_653369 ) ) ( not ( = ?auto_653367 ?auto_653370 ) ) ( not ( = ?auto_653367 ?auto_653371 ) ) ( not ( = ?auto_653367 ?auto_653372 ) ) ( not ( = ?auto_653367 ?auto_653373 ) ) ( not ( = ?auto_653367 ?auto_653374 ) ) ( not ( = ?auto_653367 ?auto_653375 ) ) ( not ( = ?auto_653367 ?auto_653376 ) ) ( not ( = ?auto_653367 ?auto_653377 ) ) ( not ( = ?auto_653367 ?auto_653378 ) ) ( not ( = ?auto_653367 ?auto_653379 ) ) ( not ( = ?auto_653367 ?auto_653380 ) ) ( not ( = ?auto_653368 ?auto_653369 ) ) ( not ( = ?auto_653368 ?auto_653370 ) ) ( not ( = ?auto_653368 ?auto_653371 ) ) ( not ( = ?auto_653368 ?auto_653372 ) ) ( not ( = ?auto_653368 ?auto_653373 ) ) ( not ( = ?auto_653368 ?auto_653374 ) ) ( not ( = ?auto_653368 ?auto_653375 ) ) ( not ( = ?auto_653368 ?auto_653376 ) ) ( not ( = ?auto_653368 ?auto_653377 ) ) ( not ( = ?auto_653368 ?auto_653378 ) ) ( not ( = ?auto_653368 ?auto_653379 ) ) ( not ( = ?auto_653368 ?auto_653380 ) ) ( not ( = ?auto_653369 ?auto_653370 ) ) ( not ( = ?auto_653369 ?auto_653371 ) ) ( not ( = ?auto_653369 ?auto_653372 ) ) ( not ( = ?auto_653369 ?auto_653373 ) ) ( not ( = ?auto_653369 ?auto_653374 ) ) ( not ( = ?auto_653369 ?auto_653375 ) ) ( not ( = ?auto_653369 ?auto_653376 ) ) ( not ( = ?auto_653369 ?auto_653377 ) ) ( not ( = ?auto_653369 ?auto_653378 ) ) ( not ( = ?auto_653369 ?auto_653379 ) ) ( not ( = ?auto_653369 ?auto_653380 ) ) ( not ( = ?auto_653370 ?auto_653371 ) ) ( not ( = ?auto_653370 ?auto_653372 ) ) ( not ( = ?auto_653370 ?auto_653373 ) ) ( not ( = ?auto_653370 ?auto_653374 ) ) ( not ( = ?auto_653370 ?auto_653375 ) ) ( not ( = ?auto_653370 ?auto_653376 ) ) ( not ( = ?auto_653370 ?auto_653377 ) ) ( not ( = ?auto_653370 ?auto_653378 ) ) ( not ( = ?auto_653370 ?auto_653379 ) ) ( not ( = ?auto_653370 ?auto_653380 ) ) ( not ( = ?auto_653371 ?auto_653372 ) ) ( not ( = ?auto_653371 ?auto_653373 ) ) ( not ( = ?auto_653371 ?auto_653374 ) ) ( not ( = ?auto_653371 ?auto_653375 ) ) ( not ( = ?auto_653371 ?auto_653376 ) ) ( not ( = ?auto_653371 ?auto_653377 ) ) ( not ( = ?auto_653371 ?auto_653378 ) ) ( not ( = ?auto_653371 ?auto_653379 ) ) ( not ( = ?auto_653371 ?auto_653380 ) ) ( not ( = ?auto_653372 ?auto_653373 ) ) ( not ( = ?auto_653372 ?auto_653374 ) ) ( not ( = ?auto_653372 ?auto_653375 ) ) ( not ( = ?auto_653372 ?auto_653376 ) ) ( not ( = ?auto_653372 ?auto_653377 ) ) ( not ( = ?auto_653372 ?auto_653378 ) ) ( not ( = ?auto_653372 ?auto_653379 ) ) ( not ( = ?auto_653372 ?auto_653380 ) ) ( not ( = ?auto_653373 ?auto_653374 ) ) ( not ( = ?auto_653373 ?auto_653375 ) ) ( not ( = ?auto_653373 ?auto_653376 ) ) ( not ( = ?auto_653373 ?auto_653377 ) ) ( not ( = ?auto_653373 ?auto_653378 ) ) ( not ( = ?auto_653373 ?auto_653379 ) ) ( not ( = ?auto_653373 ?auto_653380 ) ) ( not ( = ?auto_653374 ?auto_653375 ) ) ( not ( = ?auto_653374 ?auto_653376 ) ) ( not ( = ?auto_653374 ?auto_653377 ) ) ( not ( = ?auto_653374 ?auto_653378 ) ) ( not ( = ?auto_653374 ?auto_653379 ) ) ( not ( = ?auto_653374 ?auto_653380 ) ) ( not ( = ?auto_653375 ?auto_653376 ) ) ( not ( = ?auto_653375 ?auto_653377 ) ) ( not ( = ?auto_653375 ?auto_653378 ) ) ( not ( = ?auto_653375 ?auto_653379 ) ) ( not ( = ?auto_653375 ?auto_653380 ) ) ( not ( = ?auto_653376 ?auto_653377 ) ) ( not ( = ?auto_653376 ?auto_653378 ) ) ( not ( = ?auto_653376 ?auto_653379 ) ) ( not ( = ?auto_653376 ?auto_653380 ) ) ( not ( = ?auto_653377 ?auto_653378 ) ) ( not ( = ?auto_653377 ?auto_653379 ) ) ( not ( = ?auto_653377 ?auto_653380 ) ) ( not ( = ?auto_653378 ?auto_653379 ) ) ( not ( = ?auto_653378 ?auto_653380 ) ) ( not ( = ?auto_653379 ?auto_653380 ) ) ( ON ?auto_653378 ?auto_653379 ) ( ON ?auto_653377 ?auto_653378 ) ( ON ?auto_653376 ?auto_653377 ) ( ON ?auto_653375 ?auto_653376 ) ( ON ?auto_653374 ?auto_653375 ) ( ON ?auto_653373 ?auto_653374 ) ( ON ?auto_653372 ?auto_653373 ) ( ON ?auto_653371 ?auto_653372 ) ( CLEAR ?auto_653369 ) ( ON ?auto_653370 ?auto_653371 ) ( CLEAR ?auto_653370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_653367 ?auto_653368 ?auto_653369 ?auto_653370 )
      ( MAKE-13PILE ?auto_653367 ?auto_653368 ?auto_653369 ?auto_653370 ?auto_653371 ?auto_653372 ?auto_653373 ?auto_653374 ?auto_653375 ?auto_653376 ?auto_653377 ?auto_653378 ?auto_653379 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_653421 - BLOCK
      ?auto_653422 - BLOCK
      ?auto_653423 - BLOCK
      ?auto_653424 - BLOCK
      ?auto_653425 - BLOCK
      ?auto_653426 - BLOCK
      ?auto_653427 - BLOCK
      ?auto_653428 - BLOCK
      ?auto_653429 - BLOCK
      ?auto_653430 - BLOCK
      ?auto_653431 - BLOCK
      ?auto_653432 - BLOCK
      ?auto_653433 - BLOCK
    )
    :vars
    (
      ?auto_653434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_653433 ?auto_653434 ) ( ON-TABLE ?auto_653421 ) ( ON ?auto_653422 ?auto_653421 ) ( not ( = ?auto_653421 ?auto_653422 ) ) ( not ( = ?auto_653421 ?auto_653423 ) ) ( not ( = ?auto_653421 ?auto_653424 ) ) ( not ( = ?auto_653421 ?auto_653425 ) ) ( not ( = ?auto_653421 ?auto_653426 ) ) ( not ( = ?auto_653421 ?auto_653427 ) ) ( not ( = ?auto_653421 ?auto_653428 ) ) ( not ( = ?auto_653421 ?auto_653429 ) ) ( not ( = ?auto_653421 ?auto_653430 ) ) ( not ( = ?auto_653421 ?auto_653431 ) ) ( not ( = ?auto_653421 ?auto_653432 ) ) ( not ( = ?auto_653421 ?auto_653433 ) ) ( not ( = ?auto_653421 ?auto_653434 ) ) ( not ( = ?auto_653422 ?auto_653423 ) ) ( not ( = ?auto_653422 ?auto_653424 ) ) ( not ( = ?auto_653422 ?auto_653425 ) ) ( not ( = ?auto_653422 ?auto_653426 ) ) ( not ( = ?auto_653422 ?auto_653427 ) ) ( not ( = ?auto_653422 ?auto_653428 ) ) ( not ( = ?auto_653422 ?auto_653429 ) ) ( not ( = ?auto_653422 ?auto_653430 ) ) ( not ( = ?auto_653422 ?auto_653431 ) ) ( not ( = ?auto_653422 ?auto_653432 ) ) ( not ( = ?auto_653422 ?auto_653433 ) ) ( not ( = ?auto_653422 ?auto_653434 ) ) ( not ( = ?auto_653423 ?auto_653424 ) ) ( not ( = ?auto_653423 ?auto_653425 ) ) ( not ( = ?auto_653423 ?auto_653426 ) ) ( not ( = ?auto_653423 ?auto_653427 ) ) ( not ( = ?auto_653423 ?auto_653428 ) ) ( not ( = ?auto_653423 ?auto_653429 ) ) ( not ( = ?auto_653423 ?auto_653430 ) ) ( not ( = ?auto_653423 ?auto_653431 ) ) ( not ( = ?auto_653423 ?auto_653432 ) ) ( not ( = ?auto_653423 ?auto_653433 ) ) ( not ( = ?auto_653423 ?auto_653434 ) ) ( not ( = ?auto_653424 ?auto_653425 ) ) ( not ( = ?auto_653424 ?auto_653426 ) ) ( not ( = ?auto_653424 ?auto_653427 ) ) ( not ( = ?auto_653424 ?auto_653428 ) ) ( not ( = ?auto_653424 ?auto_653429 ) ) ( not ( = ?auto_653424 ?auto_653430 ) ) ( not ( = ?auto_653424 ?auto_653431 ) ) ( not ( = ?auto_653424 ?auto_653432 ) ) ( not ( = ?auto_653424 ?auto_653433 ) ) ( not ( = ?auto_653424 ?auto_653434 ) ) ( not ( = ?auto_653425 ?auto_653426 ) ) ( not ( = ?auto_653425 ?auto_653427 ) ) ( not ( = ?auto_653425 ?auto_653428 ) ) ( not ( = ?auto_653425 ?auto_653429 ) ) ( not ( = ?auto_653425 ?auto_653430 ) ) ( not ( = ?auto_653425 ?auto_653431 ) ) ( not ( = ?auto_653425 ?auto_653432 ) ) ( not ( = ?auto_653425 ?auto_653433 ) ) ( not ( = ?auto_653425 ?auto_653434 ) ) ( not ( = ?auto_653426 ?auto_653427 ) ) ( not ( = ?auto_653426 ?auto_653428 ) ) ( not ( = ?auto_653426 ?auto_653429 ) ) ( not ( = ?auto_653426 ?auto_653430 ) ) ( not ( = ?auto_653426 ?auto_653431 ) ) ( not ( = ?auto_653426 ?auto_653432 ) ) ( not ( = ?auto_653426 ?auto_653433 ) ) ( not ( = ?auto_653426 ?auto_653434 ) ) ( not ( = ?auto_653427 ?auto_653428 ) ) ( not ( = ?auto_653427 ?auto_653429 ) ) ( not ( = ?auto_653427 ?auto_653430 ) ) ( not ( = ?auto_653427 ?auto_653431 ) ) ( not ( = ?auto_653427 ?auto_653432 ) ) ( not ( = ?auto_653427 ?auto_653433 ) ) ( not ( = ?auto_653427 ?auto_653434 ) ) ( not ( = ?auto_653428 ?auto_653429 ) ) ( not ( = ?auto_653428 ?auto_653430 ) ) ( not ( = ?auto_653428 ?auto_653431 ) ) ( not ( = ?auto_653428 ?auto_653432 ) ) ( not ( = ?auto_653428 ?auto_653433 ) ) ( not ( = ?auto_653428 ?auto_653434 ) ) ( not ( = ?auto_653429 ?auto_653430 ) ) ( not ( = ?auto_653429 ?auto_653431 ) ) ( not ( = ?auto_653429 ?auto_653432 ) ) ( not ( = ?auto_653429 ?auto_653433 ) ) ( not ( = ?auto_653429 ?auto_653434 ) ) ( not ( = ?auto_653430 ?auto_653431 ) ) ( not ( = ?auto_653430 ?auto_653432 ) ) ( not ( = ?auto_653430 ?auto_653433 ) ) ( not ( = ?auto_653430 ?auto_653434 ) ) ( not ( = ?auto_653431 ?auto_653432 ) ) ( not ( = ?auto_653431 ?auto_653433 ) ) ( not ( = ?auto_653431 ?auto_653434 ) ) ( not ( = ?auto_653432 ?auto_653433 ) ) ( not ( = ?auto_653432 ?auto_653434 ) ) ( not ( = ?auto_653433 ?auto_653434 ) ) ( ON ?auto_653432 ?auto_653433 ) ( ON ?auto_653431 ?auto_653432 ) ( ON ?auto_653430 ?auto_653431 ) ( ON ?auto_653429 ?auto_653430 ) ( ON ?auto_653428 ?auto_653429 ) ( ON ?auto_653427 ?auto_653428 ) ( ON ?auto_653426 ?auto_653427 ) ( ON ?auto_653425 ?auto_653426 ) ( ON ?auto_653424 ?auto_653425 ) ( CLEAR ?auto_653422 ) ( ON ?auto_653423 ?auto_653424 ) ( CLEAR ?auto_653423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_653421 ?auto_653422 ?auto_653423 )
      ( MAKE-13PILE ?auto_653421 ?auto_653422 ?auto_653423 ?auto_653424 ?auto_653425 ?auto_653426 ?auto_653427 ?auto_653428 ?auto_653429 ?auto_653430 ?auto_653431 ?auto_653432 ?auto_653433 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_653475 - BLOCK
      ?auto_653476 - BLOCK
      ?auto_653477 - BLOCK
      ?auto_653478 - BLOCK
      ?auto_653479 - BLOCK
      ?auto_653480 - BLOCK
      ?auto_653481 - BLOCK
      ?auto_653482 - BLOCK
      ?auto_653483 - BLOCK
      ?auto_653484 - BLOCK
      ?auto_653485 - BLOCK
      ?auto_653486 - BLOCK
      ?auto_653487 - BLOCK
    )
    :vars
    (
      ?auto_653488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_653487 ?auto_653488 ) ( ON-TABLE ?auto_653475 ) ( not ( = ?auto_653475 ?auto_653476 ) ) ( not ( = ?auto_653475 ?auto_653477 ) ) ( not ( = ?auto_653475 ?auto_653478 ) ) ( not ( = ?auto_653475 ?auto_653479 ) ) ( not ( = ?auto_653475 ?auto_653480 ) ) ( not ( = ?auto_653475 ?auto_653481 ) ) ( not ( = ?auto_653475 ?auto_653482 ) ) ( not ( = ?auto_653475 ?auto_653483 ) ) ( not ( = ?auto_653475 ?auto_653484 ) ) ( not ( = ?auto_653475 ?auto_653485 ) ) ( not ( = ?auto_653475 ?auto_653486 ) ) ( not ( = ?auto_653475 ?auto_653487 ) ) ( not ( = ?auto_653475 ?auto_653488 ) ) ( not ( = ?auto_653476 ?auto_653477 ) ) ( not ( = ?auto_653476 ?auto_653478 ) ) ( not ( = ?auto_653476 ?auto_653479 ) ) ( not ( = ?auto_653476 ?auto_653480 ) ) ( not ( = ?auto_653476 ?auto_653481 ) ) ( not ( = ?auto_653476 ?auto_653482 ) ) ( not ( = ?auto_653476 ?auto_653483 ) ) ( not ( = ?auto_653476 ?auto_653484 ) ) ( not ( = ?auto_653476 ?auto_653485 ) ) ( not ( = ?auto_653476 ?auto_653486 ) ) ( not ( = ?auto_653476 ?auto_653487 ) ) ( not ( = ?auto_653476 ?auto_653488 ) ) ( not ( = ?auto_653477 ?auto_653478 ) ) ( not ( = ?auto_653477 ?auto_653479 ) ) ( not ( = ?auto_653477 ?auto_653480 ) ) ( not ( = ?auto_653477 ?auto_653481 ) ) ( not ( = ?auto_653477 ?auto_653482 ) ) ( not ( = ?auto_653477 ?auto_653483 ) ) ( not ( = ?auto_653477 ?auto_653484 ) ) ( not ( = ?auto_653477 ?auto_653485 ) ) ( not ( = ?auto_653477 ?auto_653486 ) ) ( not ( = ?auto_653477 ?auto_653487 ) ) ( not ( = ?auto_653477 ?auto_653488 ) ) ( not ( = ?auto_653478 ?auto_653479 ) ) ( not ( = ?auto_653478 ?auto_653480 ) ) ( not ( = ?auto_653478 ?auto_653481 ) ) ( not ( = ?auto_653478 ?auto_653482 ) ) ( not ( = ?auto_653478 ?auto_653483 ) ) ( not ( = ?auto_653478 ?auto_653484 ) ) ( not ( = ?auto_653478 ?auto_653485 ) ) ( not ( = ?auto_653478 ?auto_653486 ) ) ( not ( = ?auto_653478 ?auto_653487 ) ) ( not ( = ?auto_653478 ?auto_653488 ) ) ( not ( = ?auto_653479 ?auto_653480 ) ) ( not ( = ?auto_653479 ?auto_653481 ) ) ( not ( = ?auto_653479 ?auto_653482 ) ) ( not ( = ?auto_653479 ?auto_653483 ) ) ( not ( = ?auto_653479 ?auto_653484 ) ) ( not ( = ?auto_653479 ?auto_653485 ) ) ( not ( = ?auto_653479 ?auto_653486 ) ) ( not ( = ?auto_653479 ?auto_653487 ) ) ( not ( = ?auto_653479 ?auto_653488 ) ) ( not ( = ?auto_653480 ?auto_653481 ) ) ( not ( = ?auto_653480 ?auto_653482 ) ) ( not ( = ?auto_653480 ?auto_653483 ) ) ( not ( = ?auto_653480 ?auto_653484 ) ) ( not ( = ?auto_653480 ?auto_653485 ) ) ( not ( = ?auto_653480 ?auto_653486 ) ) ( not ( = ?auto_653480 ?auto_653487 ) ) ( not ( = ?auto_653480 ?auto_653488 ) ) ( not ( = ?auto_653481 ?auto_653482 ) ) ( not ( = ?auto_653481 ?auto_653483 ) ) ( not ( = ?auto_653481 ?auto_653484 ) ) ( not ( = ?auto_653481 ?auto_653485 ) ) ( not ( = ?auto_653481 ?auto_653486 ) ) ( not ( = ?auto_653481 ?auto_653487 ) ) ( not ( = ?auto_653481 ?auto_653488 ) ) ( not ( = ?auto_653482 ?auto_653483 ) ) ( not ( = ?auto_653482 ?auto_653484 ) ) ( not ( = ?auto_653482 ?auto_653485 ) ) ( not ( = ?auto_653482 ?auto_653486 ) ) ( not ( = ?auto_653482 ?auto_653487 ) ) ( not ( = ?auto_653482 ?auto_653488 ) ) ( not ( = ?auto_653483 ?auto_653484 ) ) ( not ( = ?auto_653483 ?auto_653485 ) ) ( not ( = ?auto_653483 ?auto_653486 ) ) ( not ( = ?auto_653483 ?auto_653487 ) ) ( not ( = ?auto_653483 ?auto_653488 ) ) ( not ( = ?auto_653484 ?auto_653485 ) ) ( not ( = ?auto_653484 ?auto_653486 ) ) ( not ( = ?auto_653484 ?auto_653487 ) ) ( not ( = ?auto_653484 ?auto_653488 ) ) ( not ( = ?auto_653485 ?auto_653486 ) ) ( not ( = ?auto_653485 ?auto_653487 ) ) ( not ( = ?auto_653485 ?auto_653488 ) ) ( not ( = ?auto_653486 ?auto_653487 ) ) ( not ( = ?auto_653486 ?auto_653488 ) ) ( not ( = ?auto_653487 ?auto_653488 ) ) ( ON ?auto_653486 ?auto_653487 ) ( ON ?auto_653485 ?auto_653486 ) ( ON ?auto_653484 ?auto_653485 ) ( ON ?auto_653483 ?auto_653484 ) ( ON ?auto_653482 ?auto_653483 ) ( ON ?auto_653481 ?auto_653482 ) ( ON ?auto_653480 ?auto_653481 ) ( ON ?auto_653479 ?auto_653480 ) ( ON ?auto_653478 ?auto_653479 ) ( ON ?auto_653477 ?auto_653478 ) ( CLEAR ?auto_653475 ) ( ON ?auto_653476 ?auto_653477 ) ( CLEAR ?auto_653476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_653475 ?auto_653476 )
      ( MAKE-13PILE ?auto_653475 ?auto_653476 ?auto_653477 ?auto_653478 ?auto_653479 ?auto_653480 ?auto_653481 ?auto_653482 ?auto_653483 ?auto_653484 ?auto_653485 ?auto_653486 ?auto_653487 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_653529 - BLOCK
      ?auto_653530 - BLOCK
      ?auto_653531 - BLOCK
      ?auto_653532 - BLOCK
      ?auto_653533 - BLOCK
      ?auto_653534 - BLOCK
      ?auto_653535 - BLOCK
      ?auto_653536 - BLOCK
      ?auto_653537 - BLOCK
      ?auto_653538 - BLOCK
      ?auto_653539 - BLOCK
      ?auto_653540 - BLOCK
      ?auto_653541 - BLOCK
    )
    :vars
    (
      ?auto_653542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_653541 ?auto_653542 ) ( not ( = ?auto_653529 ?auto_653530 ) ) ( not ( = ?auto_653529 ?auto_653531 ) ) ( not ( = ?auto_653529 ?auto_653532 ) ) ( not ( = ?auto_653529 ?auto_653533 ) ) ( not ( = ?auto_653529 ?auto_653534 ) ) ( not ( = ?auto_653529 ?auto_653535 ) ) ( not ( = ?auto_653529 ?auto_653536 ) ) ( not ( = ?auto_653529 ?auto_653537 ) ) ( not ( = ?auto_653529 ?auto_653538 ) ) ( not ( = ?auto_653529 ?auto_653539 ) ) ( not ( = ?auto_653529 ?auto_653540 ) ) ( not ( = ?auto_653529 ?auto_653541 ) ) ( not ( = ?auto_653529 ?auto_653542 ) ) ( not ( = ?auto_653530 ?auto_653531 ) ) ( not ( = ?auto_653530 ?auto_653532 ) ) ( not ( = ?auto_653530 ?auto_653533 ) ) ( not ( = ?auto_653530 ?auto_653534 ) ) ( not ( = ?auto_653530 ?auto_653535 ) ) ( not ( = ?auto_653530 ?auto_653536 ) ) ( not ( = ?auto_653530 ?auto_653537 ) ) ( not ( = ?auto_653530 ?auto_653538 ) ) ( not ( = ?auto_653530 ?auto_653539 ) ) ( not ( = ?auto_653530 ?auto_653540 ) ) ( not ( = ?auto_653530 ?auto_653541 ) ) ( not ( = ?auto_653530 ?auto_653542 ) ) ( not ( = ?auto_653531 ?auto_653532 ) ) ( not ( = ?auto_653531 ?auto_653533 ) ) ( not ( = ?auto_653531 ?auto_653534 ) ) ( not ( = ?auto_653531 ?auto_653535 ) ) ( not ( = ?auto_653531 ?auto_653536 ) ) ( not ( = ?auto_653531 ?auto_653537 ) ) ( not ( = ?auto_653531 ?auto_653538 ) ) ( not ( = ?auto_653531 ?auto_653539 ) ) ( not ( = ?auto_653531 ?auto_653540 ) ) ( not ( = ?auto_653531 ?auto_653541 ) ) ( not ( = ?auto_653531 ?auto_653542 ) ) ( not ( = ?auto_653532 ?auto_653533 ) ) ( not ( = ?auto_653532 ?auto_653534 ) ) ( not ( = ?auto_653532 ?auto_653535 ) ) ( not ( = ?auto_653532 ?auto_653536 ) ) ( not ( = ?auto_653532 ?auto_653537 ) ) ( not ( = ?auto_653532 ?auto_653538 ) ) ( not ( = ?auto_653532 ?auto_653539 ) ) ( not ( = ?auto_653532 ?auto_653540 ) ) ( not ( = ?auto_653532 ?auto_653541 ) ) ( not ( = ?auto_653532 ?auto_653542 ) ) ( not ( = ?auto_653533 ?auto_653534 ) ) ( not ( = ?auto_653533 ?auto_653535 ) ) ( not ( = ?auto_653533 ?auto_653536 ) ) ( not ( = ?auto_653533 ?auto_653537 ) ) ( not ( = ?auto_653533 ?auto_653538 ) ) ( not ( = ?auto_653533 ?auto_653539 ) ) ( not ( = ?auto_653533 ?auto_653540 ) ) ( not ( = ?auto_653533 ?auto_653541 ) ) ( not ( = ?auto_653533 ?auto_653542 ) ) ( not ( = ?auto_653534 ?auto_653535 ) ) ( not ( = ?auto_653534 ?auto_653536 ) ) ( not ( = ?auto_653534 ?auto_653537 ) ) ( not ( = ?auto_653534 ?auto_653538 ) ) ( not ( = ?auto_653534 ?auto_653539 ) ) ( not ( = ?auto_653534 ?auto_653540 ) ) ( not ( = ?auto_653534 ?auto_653541 ) ) ( not ( = ?auto_653534 ?auto_653542 ) ) ( not ( = ?auto_653535 ?auto_653536 ) ) ( not ( = ?auto_653535 ?auto_653537 ) ) ( not ( = ?auto_653535 ?auto_653538 ) ) ( not ( = ?auto_653535 ?auto_653539 ) ) ( not ( = ?auto_653535 ?auto_653540 ) ) ( not ( = ?auto_653535 ?auto_653541 ) ) ( not ( = ?auto_653535 ?auto_653542 ) ) ( not ( = ?auto_653536 ?auto_653537 ) ) ( not ( = ?auto_653536 ?auto_653538 ) ) ( not ( = ?auto_653536 ?auto_653539 ) ) ( not ( = ?auto_653536 ?auto_653540 ) ) ( not ( = ?auto_653536 ?auto_653541 ) ) ( not ( = ?auto_653536 ?auto_653542 ) ) ( not ( = ?auto_653537 ?auto_653538 ) ) ( not ( = ?auto_653537 ?auto_653539 ) ) ( not ( = ?auto_653537 ?auto_653540 ) ) ( not ( = ?auto_653537 ?auto_653541 ) ) ( not ( = ?auto_653537 ?auto_653542 ) ) ( not ( = ?auto_653538 ?auto_653539 ) ) ( not ( = ?auto_653538 ?auto_653540 ) ) ( not ( = ?auto_653538 ?auto_653541 ) ) ( not ( = ?auto_653538 ?auto_653542 ) ) ( not ( = ?auto_653539 ?auto_653540 ) ) ( not ( = ?auto_653539 ?auto_653541 ) ) ( not ( = ?auto_653539 ?auto_653542 ) ) ( not ( = ?auto_653540 ?auto_653541 ) ) ( not ( = ?auto_653540 ?auto_653542 ) ) ( not ( = ?auto_653541 ?auto_653542 ) ) ( ON ?auto_653540 ?auto_653541 ) ( ON ?auto_653539 ?auto_653540 ) ( ON ?auto_653538 ?auto_653539 ) ( ON ?auto_653537 ?auto_653538 ) ( ON ?auto_653536 ?auto_653537 ) ( ON ?auto_653535 ?auto_653536 ) ( ON ?auto_653534 ?auto_653535 ) ( ON ?auto_653533 ?auto_653534 ) ( ON ?auto_653532 ?auto_653533 ) ( ON ?auto_653531 ?auto_653532 ) ( ON ?auto_653530 ?auto_653531 ) ( ON ?auto_653529 ?auto_653530 ) ( CLEAR ?auto_653529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_653529 )
      ( MAKE-13PILE ?auto_653529 ?auto_653530 ?auto_653531 ?auto_653532 ?auto_653533 ?auto_653534 ?auto_653535 ?auto_653536 ?auto_653537 ?auto_653538 ?auto_653539 ?auto_653540 ?auto_653541 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_653584 - BLOCK
      ?auto_653585 - BLOCK
      ?auto_653586 - BLOCK
      ?auto_653587 - BLOCK
      ?auto_653588 - BLOCK
      ?auto_653589 - BLOCK
      ?auto_653590 - BLOCK
      ?auto_653591 - BLOCK
      ?auto_653592 - BLOCK
      ?auto_653593 - BLOCK
      ?auto_653594 - BLOCK
      ?auto_653595 - BLOCK
      ?auto_653596 - BLOCK
      ?auto_653597 - BLOCK
    )
    :vars
    (
      ?auto_653598 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_653596 ) ( ON ?auto_653597 ?auto_653598 ) ( CLEAR ?auto_653597 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_653584 ) ( ON ?auto_653585 ?auto_653584 ) ( ON ?auto_653586 ?auto_653585 ) ( ON ?auto_653587 ?auto_653586 ) ( ON ?auto_653588 ?auto_653587 ) ( ON ?auto_653589 ?auto_653588 ) ( ON ?auto_653590 ?auto_653589 ) ( ON ?auto_653591 ?auto_653590 ) ( ON ?auto_653592 ?auto_653591 ) ( ON ?auto_653593 ?auto_653592 ) ( ON ?auto_653594 ?auto_653593 ) ( ON ?auto_653595 ?auto_653594 ) ( ON ?auto_653596 ?auto_653595 ) ( not ( = ?auto_653584 ?auto_653585 ) ) ( not ( = ?auto_653584 ?auto_653586 ) ) ( not ( = ?auto_653584 ?auto_653587 ) ) ( not ( = ?auto_653584 ?auto_653588 ) ) ( not ( = ?auto_653584 ?auto_653589 ) ) ( not ( = ?auto_653584 ?auto_653590 ) ) ( not ( = ?auto_653584 ?auto_653591 ) ) ( not ( = ?auto_653584 ?auto_653592 ) ) ( not ( = ?auto_653584 ?auto_653593 ) ) ( not ( = ?auto_653584 ?auto_653594 ) ) ( not ( = ?auto_653584 ?auto_653595 ) ) ( not ( = ?auto_653584 ?auto_653596 ) ) ( not ( = ?auto_653584 ?auto_653597 ) ) ( not ( = ?auto_653584 ?auto_653598 ) ) ( not ( = ?auto_653585 ?auto_653586 ) ) ( not ( = ?auto_653585 ?auto_653587 ) ) ( not ( = ?auto_653585 ?auto_653588 ) ) ( not ( = ?auto_653585 ?auto_653589 ) ) ( not ( = ?auto_653585 ?auto_653590 ) ) ( not ( = ?auto_653585 ?auto_653591 ) ) ( not ( = ?auto_653585 ?auto_653592 ) ) ( not ( = ?auto_653585 ?auto_653593 ) ) ( not ( = ?auto_653585 ?auto_653594 ) ) ( not ( = ?auto_653585 ?auto_653595 ) ) ( not ( = ?auto_653585 ?auto_653596 ) ) ( not ( = ?auto_653585 ?auto_653597 ) ) ( not ( = ?auto_653585 ?auto_653598 ) ) ( not ( = ?auto_653586 ?auto_653587 ) ) ( not ( = ?auto_653586 ?auto_653588 ) ) ( not ( = ?auto_653586 ?auto_653589 ) ) ( not ( = ?auto_653586 ?auto_653590 ) ) ( not ( = ?auto_653586 ?auto_653591 ) ) ( not ( = ?auto_653586 ?auto_653592 ) ) ( not ( = ?auto_653586 ?auto_653593 ) ) ( not ( = ?auto_653586 ?auto_653594 ) ) ( not ( = ?auto_653586 ?auto_653595 ) ) ( not ( = ?auto_653586 ?auto_653596 ) ) ( not ( = ?auto_653586 ?auto_653597 ) ) ( not ( = ?auto_653586 ?auto_653598 ) ) ( not ( = ?auto_653587 ?auto_653588 ) ) ( not ( = ?auto_653587 ?auto_653589 ) ) ( not ( = ?auto_653587 ?auto_653590 ) ) ( not ( = ?auto_653587 ?auto_653591 ) ) ( not ( = ?auto_653587 ?auto_653592 ) ) ( not ( = ?auto_653587 ?auto_653593 ) ) ( not ( = ?auto_653587 ?auto_653594 ) ) ( not ( = ?auto_653587 ?auto_653595 ) ) ( not ( = ?auto_653587 ?auto_653596 ) ) ( not ( = ?auto_653587 ?auto_653597 ) ) ( not ( = ?auto_653587 ?auto_653598 ) ) ( not ( = ?auto_653588 ?auto_653589 ) ) ( not ( = ?auto_653588 ?auto_653590 ) ) ( not ( = ?auto_653588 ?auto_653591 ) ) ( not ( = ?auto_653588 ?auto_653592 ) ) ( not ( = ?auto_653588 ?auto_653593 ) ) ( not ( = ?auto_653588 ?auto_653594 ) ) ( not ( = ?auto_653588 ?auto_653595 ) ) ( not ( = ?auto_653588 ?auto_653596 ) ) ( not ( = ?auto_653588 ?auto_653597 ) ) ( not ( = ?auto_653588 ?auto_653598 ) ) ( not ( = ?auto_653589 ?auto_653590 ) ) ( not ( = ?auto_653589 ?auto_653591 ) ) ( not ( = ?auto_653589 ?auto_653592 ) ) ( not ( = ?auto_653589 ?auto_653593 ) ) ( not ( = ?auto_653589 ?auto_653594 ) ) ( not ( = ?auto_653589 ?auto_653595 ) ) ( not ( = ?auto_653589 ?auto_653596 ) ) ( not ( = ?auto_653589 ?auto_653597 ) ) ( not ( = ?auto_653589 ?auto_653598 ) ) ( not ( = ?auto_653590 ?auto_653591 ) ) ( not ( = ?auto_653590 ?auto_653592 ) ) ( not ( = ?auto_653590 ?auto_653593 ) ) ( not ( = ?auto_653590 ?auto_653594 ) ) ( not ( = ?auto_653590 ?auto_653595 ) ) ( not ( = ?auto_653590 ?auto_653596 ) ) ( not ( = ?auto_653590 ?auto_653597 ) ) ( not ( = ?auto_653590 ?auto_653598 ) ) ( not ( = ?auto_653591 ?auto_653592 ) ) ( not ( = ?auto_653591 ?auto_653593 ) ) ( not ( = ?auto_653591 ?auto_653594 ) ) ( not ( = ?auto_653591 ?auto_653595 ) ) ( not ( = ?auto_653591 ?auto_653596 ) ) ( not ( = ?auto_653591 ?auto_653597 ) ) ( not ( = ?auto_653591 ?auto_653598 ) ) ( not ( = ?auto_653592 ?auto_653593 ) ) ( not ( = ?auto_653592 ?auto_653594 ) ) ( not ( = ?auto_653592 ?auto_653595 ) ) ( not ( = ?auto_653592 ?auto_653596 ) ) ( not ( = ?auto_653592 ?auto_653597 ) ) ( not ( = ?auto_653592 ?auto_653598 ) ) ( not ( = ?auto_653593 ?auto_653594 ) ) ( not ( = ?auto_653593 ?auto_653595 ) ) ( not ( = ?auto_653593 ?auto_653596 ) ) ( not ( = ?auto_653593 ?auto_653597 ) ) ( not ( = ?auto_653593 ?auto_653598 ) ) ( not ( = ?auto_653594 ?auto_653595 ) ) ( not ( = ?auto_653594 ?auto_653596 ) ) ( not ( = ?auto_653594 ?auto_653597 ) ) ( not ( = ?auto_653594 ?auto_653598 ) ) ( not ( = ?auto_653595 ?auto_653596 ) ) ( not ( = ?auto_653595 ?auto_653597 ) ) ( not ( = ?auto_653595 ?auto_653598 ) ) ( not ( = ?auto_653596 ?auto_653597 ) ) ( not ( = ?auto_653596 ?auto_653598 ) ) ( not ( = ?auto_653597 ?auto_653598 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_653597 ?auto_653598 )
      ( !STACK ?auto_653597 ?auto_653596 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_653642 - BLOCK
      ?auto_653643 - BLOCK
      ?auto_653644 - BLOCK
      ?auto_653645 - BLOCK
      ?auto_653646 - BLOCK
      ?auto_653647 - BLOCK
      ?auto_653648 - BLOCK
      ?auto_653649 - BLOCK
      ?auto_653650 - BLOCK
      ?auto_653651 - BLOCK
      ?auto_653652 - BLOCK
      ?auto_653653 - BLOCK
      ?auto_653654 - BLOCK
      ?auto_653655 - BLOCK
    )
    :vars
    (
      ?auto_653656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_653655 ?auto_653656 ) ( ON-TABLE ?auto_653642 ) ( ON ?auto_653643 ?auto_653642 ) ( ON ?auto_653644 ?auto_653643 ) ( ON ?auto_653645 ?auto_653644 ) ( ON ?auto_653646 ?auto_653645 ) ( ON ?auto_653647 ?auto_653646 ) ( ON ?auto_653648 ?auto_653647 ) ( ON ?auto_653649 ?auto_653648 ) ( ON ?auto_653650 ?auto_653649 ) ( ON ?auto_653651 ?auto_653650 ) ( ON ?auto_653652 ?auto_653651 ) ( ON ?auto_653653 ?auto_653652 ) ( not ( = ?auto_653642 ?auto_653643 ) ) ( not ( = ?auto_653642 ?auto_653644 ) ) ( not ( = ?auto_653642 ?auto_653645 ) ) ( not ( = ?auto_653642 ?auto_653646 ) ) ( not ( = ?auto_653642 ?auto_653647 ) ) ( not ( = ?auto_653642 ?auto_653648 ) ) ( not ( = ?auto_653642 ?auto_653649 ) ) ( not ( = ?auto_653642 ?auto_653650 ) ) ( not ( = ?auto_653642 ?auto_653651 ) ) ( not ( = ?auto_653642 ?auto_653652 ) ) ( not ( = ?auto_653642 ?auto_653653 ) ) ( not ( = ?auto_653642 ?auto_653654 ) ) ( not ( = ?auto_653642 ?auto_653655 ) ) ( not ( = ?auto_653642 ?auto_653656 ) ) ( not ( = ?auto_653643 ?auto_653644 ) ) ( not ( = ?auto_653643 ?auto_653645 ) ) ( not ( = ?auto_653643 ?auto_653646 ) ) ( not ( = ?auto_653643 ?auto_653647 ) ) ( not ( = ?auto_653643 ?auto_653648 ) ) ( not ( = ?auto_653643 ?auto_653649 ) ) ( not ( = ?auto_653643 ?auto_653650 ) ) ( not ( = ?auto_653643 ?auto_653651 ) ) ( not ( = ?auto_653643 ?auto_653652 ) ) ( not ( = ?auto_653643 ?auto_653653 ) ) ( not ( = ?auto_653643 ?auto_653654 ) ) ( not ( = ?auto_653643 ?auto_653655 ) ) ( not ( = ?auto_653643 ?auto_653656 ) ) ( not ( = ?auto_653644 ?auto_653645 ) ) ( not ( = ?auto_653644 ?auto_653646 ) ) ( not ( = ?auto_653644 ?auto_653647 ) ) ( not ( = ?auto_653644 ?auto_653648 ) ) ( not ( = ?auto_653644 ?auto_653649 ) ) ( not ( = ?auto_653644 ?auto_653650 ) ) ( not ( = ?auto_653644 ?auto_653651 ) ) ( not ( = ?auto_653644 ?auto_653652 ) ) ( not ( = ?auto_653644 ?auto_653653 ) ) ( not ( = ?auto_653644 ?auto_653654 ) ) ( not ( = ?auto_653644 ?auto_653655 ) ) ( not ( = ?auto_653644 ?auto_653656 ) ) ( not ( = ?auto_653645 ?auto_653646 ) ) ( not ( = ?auto_653645 ?auto_653647 ) ) ( not ( = ?auto_653645 ?auto_653648 ) ) ( not ( = ?auto_653645 ?auto_653649 ) ) ( not ( = ?auto_653645 ?auto_653650 ) ) ( not ( = ?auto_653645 ?auto_653651 ) ) ( not ( = ?auto_653645 ?auto_653652 ) ) ( not ( = ?auto_653645 ?auto_653653 ) ) ( not ( = ?auto_653645 ?auto_653654 ) ) ( not ( = ?auto_653645 ?auto_653655 ) ) ( not ( = ?auto_653645 ?auto_653656 ) ) ( not ( = ?auto_653646 ?auto_653647 ) ) ( not ( = ?auto_653646 ?auto_653648 ) ) ( not ( = ?auto_653646 ?auto_653649 ) ) ( not ( = ?auto_653646 ?auto_653650 ) ) ( not ( = ?auto_653646 ?auto_653651 ) ) ( not ( = ?auto_653646 ?auto_653652 ) ) ( not ( = ?auto_653646 ?auto_653653 ) ) ( not ( = ?auto_653646 ?auto_653654 ) ) ( not ( = ?auto_653646 ?auto_653655 ) ) ( not ( = ?auto_653646 ?auto_653656 ) ) ( not ( = ?auto_653647 ?auto_653648 ) ) ( not ( = ?auto_653647 ?auto_653649 ) ) ( not ( = ?auto_653647 ?auto_653650 ) ) ( not ( = ?auto_653647 ?auto_653651 ) ) ( not ( = ?auto_653647 ?auto_653652 ) ) ( not ( = ?auto_653647 ?auto_653653 ) ) ( not ( = ?auto_653647 ?auto_653654 ) ) ( not ( = ?auto_653647 ?auto_653655 ) ) ( not ( = ?auto_653647 ?auto_653656 ) ) ( not ( = ?auto_653648 ?auto_653649 ) ) ( not ( = ?auto_653648 ?auto_653650 ) ) ( not ( = ?auto_653648 ?auto_653651 ) ) ( not ( = ?auto_653648 ?auto_653652 ) ) ( not ( = ?auto_653648 ?auto_653653 ) ) ( not ( = ?auto_653648 ?auto_653654 ) ) ( not ( = ?auto_653648 ?auto_653655 ) ) ( not ( = ?auto_653648 ?auto_653656 ) ) ( not ( = ?auto_653649 ?auto_653650 ) ) ( not ( = ?auto_653649 ?auto_653651 ) ) ( not ( = ?auto_653649 ?auto_653652 ) ) ( not ( = ?auto_653649 ?auto_653653 ) ) ( not ( = ?auto_653649 ?auto_653654 ) ) ( not ( = ?auto_653649 ?auto_653655 ) ) ( not ( = ?auto_653649 ?auto_653656 ) ) ( not ( = ?auto_653650 ?auto_653651 ) ) ( not ( = ?auto_653650 ?auto_653652 ) ) ( not ( = ?auto_653650 ?auto_653653 ) ) ( not ( = ?auto_653650 ?auto_653654 ) ) ( not ( = ?auto_653650 ?auto_653655 ) ) ( not ( = ?auto_653650 ?auto_653656 ) ) ( not ( = ?auto_653651 ?auto_653652 ) ) ( not ( = ?auto_653651 ?auto_653653 ) ) ( not ( = ?auto_653651 ?auto_653654 ) ) ( not ( = ?auto_653651 ?auto_653655 ) ) ( not ( = ?auto_653651 ?auto_653656 ) ) ( not ( = ?auto_653652 ?auto_653653 ) ) ( not ( = ?auto_653652 ?auto_653654 ) ) ( not ( = ?auto_653652 ?auto_653655 ) ) ( not ( = ?auto_653652 ?auto_653656 ) ) ( not ( = ?auto_653653 ?auto_653654 ) ) ( not ( = ?auto_653653 ?auto_653655 ) ) ( not ( = ?auto_653653 ?auto_653656 ) ) ( not ( = ?auto_653654 ?auto_653655 ) ) ( not ( = ?auto_653654 ?auto_653656 ) ) ( not ( = ?auto_653655 ?auto_653656 ) ) ( CLEAR ?auto_653653 ) ( ON ?auto_653654 ?auto_653655 ) ( CLEAR ?auto_653654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_653642 ?auto_653643 ?auto_653644 ?auto_653645 ?auto_653646 ?auto_653647 ?auto_653648 ?auto_653649 ?auto_653650 ?auto_653651 ?auto_653652 ?auto_653653 ?auto_653654 )
      ( MAKE-14PILE ?auto_653642 ?auto_653643 ?auto_653644 ?auto_653645 ?auto_653646 ?auto_653647 ?auto_653648 ?auto_653649 ?auto_653650 ?auto_653651 ?auto_653652 ?auto_653653 ?auto_653654 ?auto_653655 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_653700 - BLOCK
      ?auto_653701 - BLOCK
      ?auto_653702 - BLOCK
      ?auto_653703 - BLOCK
      ?auto_653704 - BLOCK
      ?auto_653705 - BLOCK
      ?auto_653706 - BLOCK
      ?auto_653707 - BLOCK
      ?auto_653708 - BLOCK
      ?auto_653709 - BLOCK
      ?auto_653710 - BLOCK
      ?auto_653711 - BLOCK
      ?auto_653712 - BLOCK
      ?auto_653713 - BLOCK
    )
    :vars
    (
      ?auto_653714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_653713 ?auto_653714 ) ( ON-TABLE ?auto_653700 ) ( ON ?auto_653701 ?auto_653700 ) ( ON ?auto_653702 ?auto_653701 ) ( ON ?auto_653703 ?auto_653702 ) ( ON ?auto_653704 ?auto_653703 ) ( ON ?auto_653705 ?auto_653704 ) ( ON ?auto_653706 ?auto_653705 ) ( ON ?auto_653707 ?auto_653706 ) ( ON ?auto_653708 ?auto_653707 ) ( ON ?auto_653709 ?auto_653708 ) ( ON ?auto_653710 ?auto_653709 ) ( not ( = ?auto_653700 ?auto_653701 ) ) ( not ( = ?auto_653700 ?auto_653702 ) ) ( not ( = ?auto_653700 ?auto_653703 ) ) ( not ( = ?auto_653700 ?auto_653704 ) ) ( not ( = ?auto_653700 ?auto_653705 ) ) ( not ( = ?auto_653700 ?auto_653706 ) ) ( not ( = ?auto_653700 ?auto_653707 ) ) ( not ( = ?auto_653700 ?auto_653708 ) ) ( not ( = ?auto_653700 ?auto_653709 ) ) ( not ( = ?auto_653700 ?auto_653710 ) ) ( not ( = ?auto_653700 ?auto_653711 ) ) ( not ( = ?auto_653700 ?auto_653712 ) ) ( not ( = ?auto_653700 ?auto_653713 ) ) ( not ( = ?auto_653700 ?auto_653714 ) ) ( not ( = ?auto_653701 ?auto_653702 ) ) ( not ( = ?auto_653701 ?auto_653703 ) ) ( not ( = ?auto_653701 ?auto_653704 ) ) ( not ( = ?auto_653701 ?auto_653705 ) ) ( not ( = ?auto_653701 ?auto_653706 ) ) ( not ( = ?auto_653701 ?auto_653707 ) ) ( not ( = ?auto_653701 ?auto_653708 ) ) ( not ( = ?auto_653701 ?auto_653709 ) ) ( not ( = ?auto_653701 ?auto_653710 ) ) ( not ( = ?auto_653701 ?auto_653711 ) ) ( not ( = ?auto_653701 ?auto_653712 ) ) ( not ( = ?auto_653701 ?auto_653713 ) ) ( not ( = ?auto_653701 ?auto_653714 ) ) ( not ( = ?auto_653702 ?auto_653703 ) ) ( not ( = ?auto_653702 ?auto_653704 ) ) ( not ( = ?auto_653702 ?auto_653705 ) ) ( not ( = ?auto_653702 ?auto_653706 ) ) ( not ( = ?auto_653702 ?auto_653707 ) ) ( not ( = ?auto_653702 ?auto_653708 ) ) ( not ( = ?auto_653702 ?auto_653709 ) ) ( not ( = ?auto_653702 ?auto_653710 ) ) ( not ( = ?auto_653702 ?auto_653711 ) ) ( not ( = ?auto_653702 ?auto_653712 ) ) ( not ( = ?auto_653702 ?auto_653713 ) ) ( not ( = ?auto_653702 ?auto_653714 ) ) ( not ( = ?auto_653703 ?auto_653704 ) ) ( not ( = ?auto_653703 ?auto_653705 ) ) ( not ( = ?auto_653703 ?auto_653706 ) ) ( not ( = ?auto_653703 ?auto_653707 ) ) ( not ( = ?auto_653703 ?auto_653708 ) ) ( not ( = ?auto_653703 ?auto_653709 ) ) ( not ( = ?auto_653703 ?auto_653710 ) ) ( not ( = ?auto_653703 ?auto_653711 ) ) ( not ( = ?auto_653703 ?auto_653712 ) ) ( not ( = ?auto_653703 ?auto_653713 ) ) ( not ( = ?auto_653703 ?auto_653714 ) ) ( not ( = ?auto_653704 ?auto_653705 ) ) ( not ( = ?auto_653704 ?auto_653706 ) ) ( not ( = ?auto_653704 ?auto_653707 ) ) ( not ( = ?auto_653704 ?auto_653708 ) ) ( not ( = ?auto_653704 ?auto_653709 ) ) ( not ( = ?auto_653704 ?auto_653710 ) ) ( not ( = ?auto_653704 ?auto_653711 ) ) ( not ( = ?auto_653704 ?auto_653712 ) ) ( not ( = ?auto_653704 ?auto_653713 ) ) ( not ( = ?auto_653704 ?auto_653714 ) ) ( not ( = ?auto_653705 ?auto_653706 ) ) ( not ( = ?auto_653705 ?auto_653707 ) ) ( not ( = ?auto_653705 ?auto_653708 ) ) ( not ( = ?auto_653705 ?auto_653709 ) ) ( not ( = ?auto_653705 ?auto_653710 ) ) ( not ( = ?auto_653705 ?auto_653711 ) ) ( not ( = ?auto_653705 ?auto_653712 ) ) ( not ( = ?auto_653705 ?auto_653713 ) ) ( not ( = ?auto_653705 ?auto_653714 ) ) ( not ( = ?auto_653706 ?auto_653707 ) ) ( not ( = ?auto_653706 ?auto_653708 ) ) ( not ( = ?auto_653706 ?auto_653709 ) ) ( not ( = ?auto_653706 ?auto_653710 ) ) ( not ( = ?auto_653706 ?auto_653711 ) ) ( not ( = ?auto_653706 ?auto_653712 ) ) ( not ( = ?auto_653706 ?auto_653713 ) ) ( not ( = ?auto_653706 ?auto_653714 ) ) ( not ( = ?auto_653707 ?auto_653708 ) ) ( not ( = ?auto_653707 ?auto_653709 ) ) ( not ( = ?auto_653707 ?auto_653710 ) ) ( not ( = ?auto_653707 ?auto_653711 ) ) ( not ( = ?auto_653707 ?auto_653712 ) ) ( not ( = ?auto_653707 ?auto_653713 ) ) ( not ( = ?auto_653707 ?auto_653714 ) ) ( not ( = ?auto_653708 ?auto_653709 ) ) ( not ( = ?auto_653708 ?auto_653710 ) ) ( not ( = ?auto_653708 ?auto_653711 ) ) ( not ( = ?auto_653708 ?auto_653712 ) ) ( not ( = ?auto_653708 ?auto_653713 ) ) ( not ( = ?auto_653708 ?auto_653714 ) ) ( not ( = ?auto_653709 ?auto_653710 ) ) ( not ( = ?auto_653709 ?auto_653711 ) ) ( not ( = ?auto_653709 ?auto_653712 ) ) ( not ( = ?auto_653709 ?auto_653713 ) ) ( not ( = ?auto_653709 ?auto_653714 ) ) ( not ( = ?auto_653710 ?auto_653711 ) ) ( not ( = ?auto_653710 ?auto_653712 ) ) ( not ( = ?auto_653710 ?auto_653713 ) ) ( not ( = ?auto_653710 ?auto_653714 ) ) ( not ( = ?auto_653711 ?auto_653712 ) ) ( not ( = ?auto_653711 ?auto_653713 ) ) ( not ( = ?auto_653711 ?auto_653714 ) ) ( not ( = ?auto_653712 ?auto_653713 ) ) ( not ( = ?auto_653712 ?auto_653714 ) ) ( not ( = ?auto_653713 ?auto_653714 ) ) ( ON ?auto_653712 ?auto_653713 ) ( CLEAR ?auto_653710 ) ( ON ?auto_653711 ?auto_653712 ) ( CLEAR ?auto_653711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_653700 ?auto_653701 ?auto_653702 ?auto_653703 ?auto_653704 ?auto_653705 ?auto_653706 ?auto_653707 ?auto_653708 ?auto_653709 ?auto_653710 ?auto_653711 )
      ( MAKE-14PILE ?auto_653700 ?auto_653701 ?auto_653702 ?auto_653703 ?auto_653704 ?auto_653705 ?auto_653706 ?auto_653707 ?auto_653708 ?auto_653709 ?auto_653710 ?auto_653711 ?auto_653712 ?auto_653713 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_653758 - BLOCK
      ?auto_653759 - BLOCK
      ?auto_653760 - BLOCK
      ?auto_653761 - BLOCK
      ?auto_653762 - BLOCK
      ?auto_653763 - BLOCK
      ?auto_653764 - BLOCK
      ?auto_653765 - BLOCK
      ?auto_653766 - BLOCK
      ?auto_653767 - BLOCK
      ?auto_653768 - BLOCK
      ?auto_653769 - BLOCK
      ?auto_653770 - BLOCK
      ?auto_653771 - BLOCK
    )
    :vars
    (
      ?auto_653772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_653771 ?auto_653772 ) ( ON-TABLE ?auto_653758 ) ( ON ?auto_653759 ?auto_653758 ) ( ON ?auto_653760 ?auto_653759 ) ( ON ?auto_653761 ?auto_653760 ) ( ON ?auto_653762 ?auto_653761 ) ( ON ?auto_653763 ?auto_653762 ) ( ON ?auto_653764 ?auto_653763 ) ( ON ?auto_653765 ?auto_653764 ) ( ON ?auto_653766 ?auto_653765 ) ( ON ?auto_653767 ?auto_653766 ) ( not ( = ?auto_653758 ?auto_653759 ) ) ( not ( = ?auto_653758 ?auto_653760 ) ) ( not ( = ?auto_653758 ?auto_653761 ) ) ( not ( = ?auto_653758 ?auto_653762 ) ) ( not ( = ?auto_653758 ?auto_653763 ) ) ( not ( = ?auto_653758 ?auto_653764 ) ) ( not ( = ?auto_653758 ?auto_653765 ) ) ( not ( = ?auto_653758 ?auto_653766 ) ) ( not ( = ?auto_653758 ?auto_653767 ) ) ( not ( = ?auto_653758 ?auto_653768 ) ) ( not ( = ?auto_653758 ?auto_653769 ) ) ( not ( = ?auto_653758 ?auto_653770 ) ) ( not ( = ?auto_653758 ?auto_653771 ) ) ( not ( = ?auto_653758 ?auto_653772 ) ) ( not ( = ?auto_653759 ?auto_653760 ) ) ( not ( = ?auto_653759 ?auto_653761 ) ) ( not ( = ?auto_653759 ?auto_653762 ) ) ( not ( = ?auto_653759 ?auto_653763 ) ) ( not ( = ?auto_653759 ?auto_653764 ) ) ( not ( = ?auto_653759 ?auto_653765 ) ) ( not ( = ?auto_653759 ?auto_653766 ) ) ( not ( = ?auto_653759 ?auto_653767 ) ) ( not ( = ?auto_653759 ?auto_653768 ) ) ( not ( = ?auto_653759 ?auto_653769 ) ) ( not ( = ?auto_653759 ?auto_653770 ) ) ( not ( = ?auto_653759 ?auto_653771 ) ) ( not ( = ?auto_653759 ?auto_653772 ) ) ( not ( = ?auto_653760 ?auto_653761 ) ) ( not ( = ?auto_653760 ?auto_653762 ) ) ( not ( = ?auto_653760 ?auto_653763 ) ) ( not ( = ?auto_653760 ?auto_653764 ) ) ( not ( = ?auto_653760 ?auto_653765 ) ) ( not ( = ?auto_653760 ?auto_653766 ) ) ( not ( = ?auto_653760 ?auto_653767 ) ) ( not ( = ?auto_653760 ?auto_653768 ) ) ( not ( = ?auto_653760 ?auto_653769 ) ) ( not ( = ?auto_653760 ?auto_653770 ) ) ( not ( = ?auto_653760 ?auto_653771 ) ) ( not ( = ?auto_653760 ?auto_653772 ) ) ( not ( = ?auto_653761 ?auto_653762 ) ) ( not ( = ?auto_653761 ?auto_653763 ) ) ( not ( = ?auto_653761 ?auto_653764 ) ) ( not ( = ?auto_653761 ?auto_653765 ) ) ( not ( = ?auto_653761 ?auto_653766 ) ) ( not ( = ?auto_653761 ?auto_653767 ) ) ( not ( = ?auto_653761 ?auto_653768 ) ) ( not ( = ?auto_653761 ?auto_653769 ) ) ( not ( = ?auto_653761 ?auto_653770 ) ) ( not ( = ?auto_653761 ?auto_653771 ) ) ( not ( = ?auto_653761 ?auto_653772 ) ) ( not ( = ?auto_653762 ?auto_653763 ) ) ( not ( = ?auto_653762 ?auto_653764 ) ) ( not ( = ?auto_653762 ?auto_653765 ) ) ( not ( = ?auto_653762 ?auto_653766 ) ) ( not ( = ?auto_653762 ?auto_653767 ) ) ( not ( = ?auto_653762 ?auto_653768 ) ) ( not ( = ?auto_653762 ?auto_653769 ) ) ( not ( = ?auto_653762 ?auto_653770 ) ) ( not ( = ?auto_653762 ?auto_653771 ) ) ( not ( = ?auto_653762 ?auto_653772 ) ) ( not ( = ?auto_653763 ?auto_653764 ) ) ( not ( = ?auto_653763 ?auto_653765 ) ) ( not ( = ?auto_653763 ?auto_653766 ) ) ( not ( = ?auto_653763 ?auto_653767 ) ) ( not ( = ?auto_653763 ?auto_653768 ) ) ( not ( = ?auto_653763 ?auto_653769 ) ) ( not ( = ?auto_653763 ?auto_653770 ) ) ( not ( = ?auto_653763 ?auto_653771 ) ) ( not ( = ?auto_653763 ?auto_653772 ) ) ( not ( = ?auto_653764 ?auto_653765 ) ) ( not ( = ?auto_653764 ?auto_653766 ) ) ( not ( = ?auto_653764 ?auto_653767 ) ) ( not ( = ?auto_653764 ?auto_653768 ) ) ( not ( = ?auto_653764 ?auto_653769 ) ) ( not ( = ?auto_653764 ?auto_653770 ) ) ( not ( = ?auto_653764 ?auto_653771 ) ) ( not ( = ?auto_653764 ?auto_653772 ) ) ( not ( = ?auto_653765 ?auto_653766 ) ) ( not ( = ?auto_653765 ?auto_653767 ) ) ( not ( = ?auto_653765 ?auto_653768 ) ) ( not ( = ?auto_653765 ?auto_653769 ) ) ( not ( = ?auto_653765 ?auto_653770 ) ) ( not ( = ?auto_653765 ?auto_653771 ) ) ( not ( = ?auto_653765 ?auto_653772 ) ) ( not ( = ?auto_653766 ?auto_653767 ) ) ( not ( = ?auto_653766 ?auto_653768 ) ) ( not ( = ?auto_653766 ?auto_653769 ) ) ( not ( = ?auto_653766 ?auto_653770 ) ) ( not ( = ?auto_653766 ?auto_653771 ) ) ( not ( = ?auto_653766 ?auto_653772 ) ) ( not ( = ?auto_653767 ?auto_653768 ) ) ( not ( = ?auto_653767 ?auto_653769 ) ) ( not ( = ?auto_653767 ?auto_653770 ) ) ( not ( = ?auto_653767 ?auto_653771 ) ) ( not ( = ?auto_653767 ?auto_653772 ) ) ( not ( = ?auto_653768 ?auto_653769 ) ) ( not ( = ?auto_653768 ?auto_653770 ) ) ( not ( = ?auto_653768 ?auto_653771 ) ) ( not ( = ?auto_653768 ?auto_653772 ) ) ( not ( = ?auto_653769 ?auto_653770 ) ) ( not ( = ?auto_653769 ?auto_653771 ) ) ( not ( = ?auto_653769 ?auto_653772 ) ) ( not ( = ?auto_653770 ?auto_653771 ) ) ( not ( = ?auto_653770 ?auto_653772 ) ) ( not ( = ?auto_653771 ?auto_653772 ) ) ( ON ?auto_653770 ?auto_653771 ) ( ON ?auto_653769 ?auto_653770 ) ( CLEAR ?auto_653767 ) ( ON ?auto_653768 ?auto_653769 ) ( CLEAR ?auto_653768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_653758 ?auto_653759 ?auto_653760 ?auto_653761 ?auto_653762 ?auto_653763 ?auto_653764 ?auto_653765 ?auto_653766 ?auto_653767 ?auto_653768 )
      ( MAKE-14PILE ?auto_653758 ?auto_653759 ?auto_653760 ?auto_653761 ?auto_653762 ?auto_653763 ?auto_653764 ?auto_653765 ?auto_653766 ?auto_653767 ?auto_653768 ?auto_653769 ?auto_653770 ?auto_653771 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_653816 - BLOCK
      ?auto_653817 - BLOCK
      ?auto_653818 - BLOCK
      ?auto_653819 - BLOCK
      ?auto_653820 - BLOCK
      ?auto_653821 - BLOCK
      ?auto_653822 - BLOCK
      ?auto_653823 - BLOCK
      ?auto_653824 - BLOCK
      ?auto_653825 - BLOCK
      ?auto_653826 - BLOCK
      ?auto_653827 - BLOCK
      ?auto_653828 - BLOCK
      ?auto_653829 - BLOCK
    )
    :vars
    (
      ?auto_653830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_653829 ?auto_653830 ) ( ON-TABLE ?auto_653816 ) ( ON ?auto_653817 ?auto_653816 ) ( ON ?auto_653818 ?auto_653817 ) ( ON ?auto_653819 ?auto_653818 ) ( ON ?auto_653820 ?auto_653819 ) ( ON ?auto_653821 ?auto_653820 ) ( ON ?auto_653822 ?auto_653821 ) ( ON ?auto_653823 ?auto_653822 ) ( ON ?auto_653824 ?auto_653823 ) ( not ( = ?auto_653816 ?auto_653817 ) ) ( not ( = ?auto_653816 ?auto_653818 ) ) ( not ( = ?auto_653816 ?auto_653819 ) ) ( not ( = ?auto_653816 ?auto_653820 ) ) ( not ( = ?auto_653816 ?auto_653821 ) ) ( not ( = ?auto_653816 ?auto_653822 ) ) ( not ( = ?auto_653816 ?auto_653823 ) ) ( not ( = ?auto_653816 ?auto_653824 ) ) ( not ( = ?auto_653816 ?auto_653825 ) ) ( not ( = ?auto_653816 ?auto_653826 ) ) ( not ( = ?auto_653816 ?auto_653827 ) ) ( not ( = ?auto_653816 ?auto_653828 ) ) ( not ( = ?auto_653816 ?auto_653829 ) ) ( not ( = ?auto_653816 ?auto_653830 ) ) ( not ( = ?auto_653817 ?auto_653818 ) ) ( not ( = ?auto_653817 ?auto_653819 ) ) ( not ( = ?auto_653817 ?auto_653820 ) ) ( not ( = ?auto_653817 ?auto_653821 ) ) ( not ( = ?auto_653817 ?auto_653822 ) ) ( not ( = ?auto_653817 ?auto_653823 ) ) ( not ( = ?auto_653817 ?auto_653824 ) ) ( not ( = ?auto_653817 ?auto_653825 ) ) ( not ( = ?auto_653817 ?auto_653826 ) ) ( not ( = ?auto_653817 ?auto_653827 ) ) ( not ( = ?auto_653817 ?auto_653828 ) ) ( not ( = ?auto_653817 ?auto_653829 ) ) ( not ( = ?auto_653817 ?auto_653830 ) ) ( not ( = ?auto_653818 ?auto_653819 ) ) ( not ( = ?auto_653818 ?auto_653820 ) ) ( not ( = ?auto_653818 ?auto_653821 ) ) ( not ( = ?auto_653818 ?auto_653822 ) ) ( not ( = ?auto_653818 ?auto_653823 ) ) ( not ( = ?auto_653818 ?auto_653824 ) ) ( not ( = ?auto_653818 ?auto_653825 ) ) ( not ( = ?auto_653818 ?auto_653826 ) ) ( not ( = ?auto_653818 ?auto_653827 ) ) ( not ( = ?auto_653818 ?auto_653828 ) ) ( not ( = ?auto_653818 ?auto_653829 ) ) ( not ( = ?auto_653818 ?auto_653830 ) ) ( not ( = ?auto_653819 ?auto_653820 ) ) ( not ( = ?auto_653819 ?auto_653821 ) ) ( not ( = ?auto_653819 ?auto_653822 ) ) ( not ( = ?auto_653819 ?auto_653823 ) ) ( not ( = ?auto_653819 ?auto_653824 ) ) ( not ( = ?auto_653819 ?auto_653825 ) ) ( not ( = ?auto_653819 ?auto_653826 ) ) ( not ( = ?auto_653819 ?auto_653827 ) ) ( not ( = ?auto_653819 ?auto_653828 ) ) ( not ( = ?auto_653819 ?auto_653829 ) ) ( not ( = ?auto_653819 ?auto_653830 ) ) ( not ( = ?auto_653820 ?auto_653821 ) ) ( not ( = ?auto_653820 ?auto_653822 ) ) ( not ( = ?auto_653820 ?auto_653823 ) ) ( not ( = ?auto_653820 ?auto_653824 ) ) ( not ( = ?auto_653820 ?auto_653825 ) ) ( not ( = ?auto_653820 ?auto_653826 ) ) ( not ( = ?auto_653820 ?auto_653827 ) ) ( not ( = ?auto_653820 ?auto_653828 ) ) ( not ( = ?auto_653820 ?auto_653829 ) ) ( not ( = ?auto_653820 ?auto_653830 ) ) ( not ( = ?auto_653821 ?auto_653822 ) ) ( not ( = ?auto_653821 ?auto_653823 ) ) ( not ( = ?auto_653821 ?auto_653824 ) ) ( not ( = ?auto_653821 ?auto_653825 ) ) ( not ( = ?auto_653821 ?auto_653826 ) ) ( not ( = ?auto_653821 ?auto_653827 ) ) ( not ( = ?auto_653821 ?auto_653828 ) ) ( not ( = ?auto_653821 ?auto_653829 ) ) ( not ( = ?auto_653821 ?auto_653830 ) ) ( not ( = ?auto_653822 ?auto_653823 ) ) ( not ( = ?auto_653822 ?auto_653824 ) ) ( not ( = ?auto_653822 ?auto_653825 ) ) ( not ( = ?auto_653822 ?auto_653826 ) ) ( not ( = ?auto_653822 ?auto_653827 ) ) ( not ( = ?auto_653822 ?auto_653828 ) ) ( not ( = ?auto_653822 ?auto_653829 ) ) ( not ( = ?auto_653822 ?auto_653830 ) ) ( not ( = ?auto_653823 ?auto_653824 ) ) ( not ( = ?auto_653823 ?auto_653825 ) ) ( not ( = ?auto_653823 ?auto_653826 ) ) ( not ( = ?auto_653823 ?auto_653827 ) ) ( not ( = ?auto_653823 ?auto_653828 ) ) ( not ( = ?auto_653823 ?auto_653829 ) ) ( not ( = ?auto_653823 ?auto_653830 ) ) ( not ( = ?auto_653824 ?auto_653825 ) ) ( not ( = ?auto_653824 ?auto_653826 ) ) ( not ( = ?auto_653824 ?auto_653827 ) ) ( not ( = ?auto_653824 ?auto_653828 ) ) ( not ( = ?auto_653824 ?auto_653829 ) ) ( not ( = ?auto_653824 ?auto_653830 ) ) ( not ( = ?auto_653825 ?auto_653826 ) ) ( not ( = ?auto_653825 ?auto_653827 ) ) ( not ( = ?auto_653825 ?auto_653828 ) ) ( not ( = ?auto_653825 ?auto_653829 ) ) ( not ( = ?auto_653825 ?auto_653830 ) ) ( not ( = ?auto_653826 ?auto_653827 ) ) ( not ( = ?auto_653826 ?auto_653828 ) ) ( not ( = ?auto_653826 ?auto_653829 ) ) ( not ( = ?auto_653826 ?auto_653830 ) ) ( not ( = ?auto_653827 ?auto_653828 ) ) ( not ( = ?auto_653827 ?auto_653829 ) ) ( not ( = ?auto_653827 ?auto_653830 ) ) ( not ( = ?auto_653828 ?auto_653829 ) ) ( not ( = ?auto_653828 ?auto_653830 ) ) ( not ( = ?auto_653829 ?auto_653830 ) ) ( ON ?auto_653828 ?auto_653829 ) ( ON ?auto_653827 ?auto_653828 ) ( ON ?auto_653826 ?auto_653827 ) ( CLEAR ?auto_653824 ) ( ON ?auto_653825 ?auto_653826 ) ( CLEAR ?auto_653825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_653816 ?auto_653817 ?auto_653818 ?auto_653819 ?auto_653820 ?auto_653821 ?auto_653822 ?auto_653823 ?auto_653824 ?auto_653825 )
      ( MAKE-14PILE ?auto_653816 ?auto_653817 ?auto_653818 ?auto_653819 ?auto_653820 ?auto_653821 ?auto_653822 ?auto_653823 ?auto_653824 ?auto_653825 ?auto_653826 ?auto_653827 ?auto_653828 ?auto_653829 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_653874 - BLOCK
      ?auto_653875 - BLOCK
      ?auto_653876 - BLOCK
      ?auto_653877 - BLOCK
      ?auto_653878 - BLOCK
      ?auto_653879 - BLOCK
      ?auto_653880 - BLOCK
      ?auto_653881 - BLOCK
      ?auto_653882 - BLOCK
      ?auto_653883 - BLOCK
      ?auto_653884 - BLOCK
      ?auto_653885 - BLOCK
      ?auto_653886 - BLOCK
      ?auto_653887 - BLOCK
    )
    :vars
    (
      ?auto_653888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_653887 ?auto_653888 ) ( ON-TABLE ?auto_653874 ) ( ON ?auto_653875 ?auto_653874 ) ( ON ?auto_653876 ?auto_653875 ) ( ON ?auto_653877 ?auto_653876 ) ( ON ?auto_653878 ?auto_653877 ) ( ON ?auto_653879 ?auto_653878 ) ( ON ?auto_653880 ?auto_653879 ) ( ON ?auto_653881 ?auto_653880 ) ( not ( = ?auto_653874 ?auto_653875 ) ) ( not ( = ?auto_653874 ?auto_653876 ) ) ( not ( = ?auto_653874 ?auto_653877 ) ) ( not ( = ?auto_653874 ?auto_653878 ) ) ( not ( = ?auto_653874 ?auto_653879 ) ) ( not ( = ?auto_653874 ?auto_653880 ) ) ( not ( = ?auto_653874 ?auto_653881 ) ) ( not ( = ?auto_653874 ?auto_653882 ) ) ( not ( = ?auto_653874 ?auto_653883 ) ) ( not ( = ?auto_653874 ?auto_653884 ) ) ( not ( = ?auto_653874 ?auto_653885 ) ) ( not ( = ?auto_653874 ?auto_653886 ) ) ( not ( = ?auto_653874 ?auto_653887 ) ) ( not ( = ?auto_653874 ?auto_653888 ) ) ( not ( = ?auto_653875 ?auto_653876 ) ) ( not ( = ?auto_653875 ?auto_653877 ) ) ( not ( = ?auto_653875 ?auto_653878 ) ) ( not ( = ?auto_653875 ?auto_653879 ) ) ( not ( = ?auto_653875 ?auto_653880 ) ) ( not ( = ?auto_653875 ?auto_653881 ) ) ( not ( = ?auto_653875 ?auto_653882 ) ) ( not ( = ?auto_653875 ?auto_653883 ) ) ( not ( = ?auto_653875 ?auto_653884 ) ) ( not ( = ?auto_653875 ?auto_653885 ) ) ( not ( = ?auto_653875 ?auto_653886 ) ) ( not ( = ?auto_653875 ?auto_653887 ) ) ( not ( = ?auto_653875 ?auto_653888 ) ) ( not ( = ?auto_653876 ?auto_653877 ) ) ( not ( = ?auto_653876 ?auto_653878 ) ) ( not ( = ?auto_653876 ?auto_653879 ) ) ( not ( = ?auto_653876 ?auto_653880 ) ) ( not ( = ?auto_653876 ?auto_653881 ) ) ( not ( = ?auto_653876 ?auto_653882 ) ) ( not ( = ?auto_653876 ?auto_653883 ) ) ( not ( = ?auto_653876 ?auto_653884 ) ) ( not ( = ?auto_653876 ?auto_653885 ) ) ( not ( = ?auto_653876 ?auto_653886 ) ) ( not ( = ?auto_653876 ?auto_653887 ) ) ( not ( = ?auto_653876 ?auto_653888 ) ) ( not ( = ?auto_653877 ?auto_653878 ) ) ( not ( = ?auto_653877 ?auto_653879 ) ) ( not ( = ?auto_653877 ?auto_653880 ) ) ( not ( = ?auto_653877 ?auto_653881 ) ) ( not ( = ?auto_653877 ?auto_653882 ) ) ( not ( = ?auto_653877 ?auto_653883 ) ) ( not ( = ?auto_653877 ?auto_653884 ) ) ( not ( = ?auto_653877 ?auto_653885 ) ) ( not ( = ?auto_653877 ?auto_653886 ) ) ( not ( = ?auto_653877 ?auto_653887 ) ) ( not ( = ?auto_653877 ?auto_653888 ) ) ( not ( = ?auto_653878 ?auto_653879 ) ) ( not ( = ?auto_653878 ?auto_653880 ) ) ( not ( = ?auto_653878 ?auto_653881 ) ) ( not ( = ?auto_653878 ?auto_653882 ) ) ( not ( = ?auto_653878 ?auto_653883 ) ) ( not ( = ?auto_653878 ?auto_653884 ) ) ( not ( = ?auto_653878 ?auto_653885 ) ) ( not ( = ?auto_653878 ?auto_653886 ) ) ( not ( = ?auto_653878 ?auto_653887 ) ) ( not ( = ?auto_653878 ?auto_653888 ) ) ( not ( = ?auto_653879 ?auto_653880 ) ) ( not ( = ?auto_653879 ?auto_653881 ) ) ( not ( = ?auto_653879 ?auto_653882 ) ) ( not ( = ?auto_653879 ?auto_653883 ) ) ( not ( = ?auto_653879 ?auto_653884 ) ) ( not ( = ?auto_653879 ?auto_653885 ) ) ( not ( = ?auto_653879 ?auto_653886 ) ) ( not ( = ?auto_653879 ?auto_653887 ) ) ( not ( = ?auto_653879 ?auto_653888 ) ) ( not ( = ?auto_653880 ?auto_653881 ) ) ( not ( = ?auto_653880 ?auto_653882 ) ) ( not ( = ?auto_653880 ?auto_653883 ) ) ( not ( = ?auto_653880 ?auto_653884 ) ) ( not ( = ?auto_653880 ?auto_653885 ) ) ( not ( = ?auto_653880 ?auto_653886 ) ) ( not ( = ?auto_653880 ?auto_653887 ) ) ( not ( = ?auto_653880 ?auto_653888 ) ) ( not ( = ?auto_653881 ?auto_653882 ) ) ( not ( = ?auto_653881 ?auto_653883 ) ) ( not ( = ?auto_653881 ?auto_653884 ) ) ( not ( = ?auto_653881 ?auto_653885 ) ) ( not ( = ?auto_653881 ?auto_653886 ) ) ( not ( = ?auto_653881 ?auto_653887 ) ) ( not ( = ?auto_653881 ?auto_653888 ) ) ( not ( = ?auto_653882 ?auto_653883 ) ) ( not ( = ?auto_653882 ?auto_653884 ) ) ( not ( = ?auto_653882 ?auto_653885 ) ) ( not ( = ?auto_653882 ?auto_653886 ) ) ( not ( = ?auto_653882 ?auto_653887 ) ) ( not ( = ?auto_653882 ?auto_653888 ) ) ( not ( = ?auto_653883 ?auto_653884 ) ) ( not ( = ?auto_653883 ?auto_653885 ) ) ( not ( = ?auto_653883 ?auto_653886 ) ) ( not ( = ?auto_653883 ?auto_653887 ) ) ( not ( = ?auto_653883 ?auto_653888 ) ) ( not ( = ?auto_653884 ?auto_653885 ) ) ( not ( = ?auto_653884 ?auto_653886 ) ) ( not ( = ?auto_653884 ?auto_653887 ) ) ( not ( = ?auto_653884 ?auto_653888 ) ) ( not ( = ?auto_653885 ?auto_653886 ) ) ( not ( = ?auto_653885 ?auto_653887 ) ) ( not ( = ?auto_653885 ?auto_653888 ) ) ( not ( = ?auto_653886 ?auto_653887 ) ) ( not ( = ?auto_653886 ?auto_653888 ) ) ( not ( = ?auto_653887 ?auto_653888 ) ) ( ON ?auto_653886 ?auto_653887 ) ( ON ?auto_653885 ?auto_653886 ) ( ON ?auto_653884 ?auto_653885 ) ( ON ?auto_653883 ?auto_653884 ) ( CLEAR ?auto_653881 ) ( ON ?auto_653882 ?auto_653883 ) ( CLEAR ?auto_653882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_653874 ?auto_653875 ?auto_653876 ?auto_653877 ?auto_653878 ?auto_653879 ?auto_653880 ?auto_653881 ?auto_653882 )
      ( MAKE-14PILE ?auto_653874 ?auto_653875 ?auto_653876 ?auto_653877 ?auto_653878 ?auto_653879 ?auto_653880 ?auto_653881 ?auto_653882 ?auto_653883 ?auto_653884 ?auto_653885 ?auto_653886 ?auto_653887 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_653932 - BLOCK
      ?auto_653933 - BLOCK
      ?auto_653934 - BLOCK
      ?auto_653935 - BLOCK
      ?auto_653936 - BLOCK
      ?auto_653937 - BLOCK
      ?auto_653938 - BLOCK
      ?auto_653939 - BLOCK
      ?auto_653940 - BLOCK
      ?auto_653941 - BLOCK
      ?auto_653942 - BLOCK
      ?auto_653943 - BLOCK
      ?auto_653944 - BLOCK
      ?auto_653945 - BLOCK
    )
    :vars
    (
      ?auto_653946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_653945 ?auto_653946 ) ( ON-TABLE ?auto_653932 ) ( ON ?auto_653933 ?auto_653932 ) ( ON ?auto_653934 ?auto_653933 ) ( ON ?auto_653935 ?auto_653934 ) ( ON ?auto_653936 ?auto_653935 ) ( ON ?auto_653937 ?auto_653936 ) ( ON ?auto_653938 ?auto_653937 ) ( not ( = ?auto_653932 ?auto_653933 ) ) ( not ( = ?auto_653932 ?auto_653934 ) ) ( not ( = ?auto_653932 ?auto_653935 ) ) ( not ( = ?auto_653932 ?auto_653936 ) ) ( not ( = ?auto_653932 ?auto_653937 ) ) ( not ( = ?auto_653932 ?auto_653938 ) ) ( not ( = ?auto_653932 ?auto_653939 ) ) ( not ( = ?auto_653932 ?auto_653940 ) ) ( not ( = ?auto_653932 ?auto_653941 ) ) ( not ( = ?auto_653932 ?auto_653942 ) ) ( not ( = ?auto_653932 ?auto_653943 ) ) ( not ( = ?auto_653932 ?auto_653944 ) ) ( not ( = ?auto_653932 ?auto_653945 ) ) ( not ( = ?auto_653932 ?auto_653946 ) ) ( not ( = ?auto_653933 ?auto_653934 ) ) ( not ( = ?auto_653933 ?auto_653935 ) ) ( not ( = ?auto_653933 ?auto_653936 ) ) ( not ( = ?auto_653933 ?auto_653937 ) ) ( not ( = ?auto_653933 ?auto_653938 ) ) ( not ( = ?auto_653933 ?auto_653939 ) ) ( not ( = ?auto_653933 ?auto_653940 ) ) ( not ( = ?auto_653933 ?auto_653941 ) ) ( not ( = ?auto_653933 ?auto_653942 ) ) ( not ( = ?auto_653933 ?auto_653943 ) ) ( not ( = ?auto_653933 ?auto_653944 ) ) ( not ( = ?auto_653933 ?auto_653945 ) ) ( not ( = ?auto_653933 ?auto_653946 ) ) ( not ( = ?auto_653934 ?auto_653935 ) ) ( not ( = ?auto_653934 ?auto_653936 ) ) ( not ( = ?auto_653934 ?auto_653937 ) ) ( not ( = ?auto_653934 ?auto_653938 ) ) ( not ( = ?auto_653934 ?auto_653939 ) ) ( not ( = ?auto_653934 ?auto_653940 ) ) ( not ( = ?auto_653934 ?auto_653941 ) ) ( not ( = ?auto_653934 ?auto_653942 ) ) ( not ( = ?auto_653934 ?auto_653943 ) ) ( not ( = ?auto_653934 ?auto_653944 ) ) ( not ( = ?auto_653934 ?auto_653945 ) ) ( not ( = ?auto_653934 ?auto_653946 ) ) ( not ( = ?auto_653935 ?auto_653936 ) ) ( not ( = ?auto_653935 ?auto_653937 ) ) ( not ( = ?auto_653935 ?auto_653938 ) ) ( not ( = ?auto_653935 ?auto_653939 ) ) ( not ( = ?auto_653935 ?auto_653940 ) ) ( not ( = ?auto_653935 ?auto_653941 ) ) ( not ( = ?auto_653935 ?auto_653942 ) ) ( not ( = ?auto_653935 ?auto_653943 ) ) ( not ( = ?auto_653935 ?auto_653944 ) ) ( not ( = ?auto_653935 ?auto_653945 ) ) ( not ( = ?auto_653935 ?auto_653946 ) ) ( not ( = ?auto_653936 ?auto_653937 ) ) ( not ( = ?auto_653936 ?auto_653938 ) ) ( not ( = ?auto_653936 ?auto_653939 ) ) ( not ( = ?auto_653936 ?auto_653940 ) ) ( not ( = ?auto_653936 ?auto_653941 ) ) ( not ( = ?auto_653936 ?auto_653942 ) ) ( not ( = ?auto_653936 ?auto_653943 ) ) ( not ( = ?auto_653936 ?auto_653944 ) ) ( not ( = ?auto_653936 ?auto_653945 ) ) ( not ( = ?auto_653936 ?auto_653946 ) ) ( not ( = ?auto_653937 ?auto_653938 ) ) ( not ( = ?auto_653937 ?auto_653939 ) ) ( not ( = ?auto_653937 ?auto_653940 ) ) ( not ( = ?auto_653937 ?auto_653941 ) ) ( not ( = ?auto_653937 ?auto_653942 ) ) ( not ( = ?auto_653937 ?auto_653943 ) ) ( not ( = ?auto_653937 ?auto_653944 ) ) ( not ( = ?auto_653937 ?auto_653945 ) ) ( not ( = ?auto_653937 ?auto_653946 ) ) ( not ( = ?auto_653938 ?auto_653939 ) ) ( not ( = ?auto_653938 ?auto_653940 ) ) ( not ( = ?auto_653938 ?auto_653941 ) ) ( not ( = ?auto_653938 ?auto_653942 ) ) ( not ( = ?auto_653938 ?auto_653943 ) ) ( not ( = ?auto_653938 ?auto_653944 ) ) ( not ( = ?auto_653938 ?auto_653945 ) ) ( not ( = ?auto_653938 ?auto_653946 ) ) ( not ( = ?auto_653939 ?auto_653940 ) ) ( not ( = ?auto_653939 ?auto_653941 ) ) ( not ( = ?auto_653939 ?auto_653942 ) ) ( not ( = ?auto_653939 ?auto_653943 ) ) ( not ( = ?auto_653939 ?auto_653944 ) ) ( not ( = ?auto_653939 ?auto_653945 ) ) ( not ( = ?auto_653939 ?auto_653946 ) ) ( not ( = ?auto_653940 ?auto_653941 ) ) ( not ( = ?auto_653940 ?auto_653942 ) ) ( not ( = ?auto_653940 ?auto_653943 ) ) ( not ( = ?auto_653940 ?auto_653944 ) ) ( not ( = ?auto_653940 ?auto_653945 ) ) ( not ( = ?auto_653940 ?auto_653946 ) ) ( not ( = ?auto_653941 ?auto_653942 ) ) ( not ( = ?auto_653941 ?auto_653943 ) ) ( not ( = ?auto_653941 ?auto_653944 ) ) ( not ( = ?auto_653941 ?auto_653945 ) ) ( not ( = ?auto_653941 ?auto_653946 ) ) ( not ( = ?auto_653942 ?auto_653943 ) ) ( not ( = ?auto_653942 ?auto_653944 ) ) ( not ( = ?auto_653942 ?auto_653945 ) ) ( not ( = ?auto_653942 ?auto_653946 ) ) ( not ( = ?auto_653943 ?auto_653944 ) ) ( not ( = ?auto_653943 ?auto_653945 ) ) ( not ( = ?auto_653943 ?auto_653946 ) ) ( not ( = ?auto_653944 ?auto_653945 ) ) ( not ( = ?auto_653944 ?auto_653946 ) ) ( not ( = ?auto_653945 ?auto_653946 ) ) ( ON ?auto_653944 ?auto_653945 ) ( ON ?auto_653943 ?auto_653944 ) ( ON ?auto_653942 ?auto_653943 ) ( ON ?auto_653941 ?auto_653942 ) ( ON ?auto_653940 ?auto_653941 ) ( CLEAR ?auto_653938 ) ( ON ?auto_653939 ?auto_653940 ) ( CLEAR ?auto_653939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_653932 ?auto_653933 ?auto_653934 ?auto_653935 ?auto_653936 ?auto_653937 ?auto_653938 ?auto_653939 )
      ( MAKE-14PILE ?auto_653932 ?auto_653933 ?auto_653934 ?auto_653935 ?auto_653936 ?auto_653937 ?auto_653938 ?auto_653939 ?auto_653940 ?auto_653941 ?auto_653942 ?auto_653943 ?auto_653944 ?auto_653945 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_653990 - BLOCK
      ?auto_653991 - BLOCK
      ?auto_653992 - BLOCK
      ?auto_653993 - BLOCK
      ?auto_653994 - BLOCK
      ?auto_653995 - BLOCK
      ?auto_653996 - BLOCK
      ?auto_653997 - BLOCK
      ?auto_653998 - BLOCK
      ?auto_653999 - BLOCK
      ?auto_654000 - BLOCK
      ?auto_654001 - BLOCK
      ?auto_654002 - BLOCK
      ?auto_654003 - BLOCK
    )
    :vars
    (
      ?auto_654004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_654003 ?auto_654004 ) ( ON-TABLE ?auto_653990 ) ( ON ?auto_653991 ?auto_653990 ) ( ON ?auto_653992 ?auto_653991 ) ( ON ?auto_653993 ?auto_653992 ) ( ON ?auto_653994 ?auto_653993 ) ( ON ?auto_653995 ?auto_653994 ) ( not ( = ?auto_653990 ?auto_653991 ) ) ( not ( = ?auto_653990 ?auto_653992 ) ) ( not ( = ?auto_653990 ?auto_653993 ) ) ( not ( = ?auto_653990 ?auto_653994 ) ) ( not ( = ?auto_653990 ?auto_653995 ) ) ( not ( = ?auto_653990 ?auto_653996 ) ) ( not ( = ?auto_653990 ?auto_653997 ) ) ( not ( = ?auto_653990 ?auto_653998 ) ) ( not ( = ?auto_653990 ?auto_653999 ) ) ( not ( = ?auto_653990 ?auto_654000 ) ) ( not ( = ?auto_653990 ?auto_654001 ) ) ( not ( = ?auto_653990 ?auto_654002 ) ) ( not ( = ?auto_653990 ?auto_654003 ) ) ( not ( = ?auto_653990 ?auto_654004 ) ) ( not ( = ?auto_653991 ?auto_653992 ) ) ( not ( = ?auto_653991 ?auto_653993 ) ) ( not ( = ?auto_653991 ?auto_653994 ) ) ( not ( = ?auto_653991 ?auto_653995 ) ) ( not ( = ?auto_653991 ?auto_653996 ) ) ( not ( = ?auto_653991 ?auto_653997 ) ) ( not ( = ?auto_653991 ?auto_653998 ) ) ( not ( = ?auto_653991 ?auto_653999 ) ) ( not ( = ?auto_653991 ?auto_654000 ) ) ( not ( = ?auto_653991 ?auto_654001 ) ) ( not ( = ?auto_653991 ?auto_654002 ) ) ( not ( = ?auto_653991 ?auto_654003 ) ) ( not ( = ?auto_653991 ?auto_654004 ) ) ( not ( = ?auto_653992 ?auto_653993 ) ) ( not ( = ?auto_653992 ?auto_653994 ) ) ( not ( = ?auto_653992 ?auto_653995 ) ) ( not ( = ?auto_653992 ?auto_653996 ) ) ( not ( = ?auto_653992 ?auto_653997 ) ) ( not ( = ?auto_653992 ?auto_653998 ) ) ( not ( = ?auto_653992 ?auto_653999 ) ) ( not ( = ?auto_653992 ?auto_654000 ) ) ( not ( = ?auto_653992 ?auto_654001 ) ) ( not ( = ?auto_653992 ?auto_654002 ) ) ( not ( = ?auto_653992 ?auto_654003 ) ) ( not ( = ?auto_653992 ?auto_654004 ) ) ( not ( = ?auto_653993 ?auto_653994 ) ) ( not ( = ?auto_653993 ?auto_653995 ) ) ( not ( = ?auto_653993 ?auto_653996 ) ) ( not ( = ?auto_653993 ?auto_653997 ) ) ( not ( = ?auto_653993 ?auto_653998 ) ) ( not ( = ?auto_653993 ?auto_653999 ) ) ( not ( = ?auto_653993 ?auto_654000 ) ) ( not ( = ?auto_653993 ?auto_654001 ) ) ( not ( = ?auto_653993 ?auto_654002 ) ) ( not ( = ?auto_653993 ?auto_654003 ) ) ( not ( = ?auto_653993 ?auto_654004 ) ) ( not ( = ?auto_653994 ?auto_653995 ) ) ( not ( = ?auto_653994 ?auto_653996 ) ) ( not ( = ?auto_653994 ?auto_653997 ) ) ( not ( = ?auto_653994 ?auto_653998 ) ) ( not ( = ?auto_653994 ?auto_653999 ) ) ( not ( = ?auto_653994 ?auto_654000 ) ) ( not ( = ?auto_653994 ?auto_654001 ) ) ( not ( = ?auto_653994 ?auto_654002 ) ) ( not ( = ?auto_653994 ?auto_654003 ) ) ( not ( = ?auto_653994 ?auto_654004 ) ) ( not ( = ?auto_653995 ?auto_653996 ) ) ( not ( = ?auto_653995 ?auto_653997 ) ) ( not ( = ?auto_653995 ?auto_653998 ) ) ( not ( = ?auto_653995 ?auto_653999 ) ) ( not ( = ?auto_653995 ?auto_654000 ) ) ( not ( = ?auto_653995 ?auto_654001 ) ) ( not ( = ?auto_653995 ?auto_654002 ) ) ( not ( = ?auto_653995 ?auto_654003 ) ) ( not ( = ?auto_653995 ?auto_654004 ) ) ( not ( = ?auto_653996 ?auto_653997 ) ) ( not ( = ?auto_653996 ?auto_653998 ) ) ( not ( = ?auto_653996 ?auto_653999 ) ) ( not ( = ?auto_653996 ?auto_654000 ) ) ( not ( = ?auto_653996 ?auto_654001 ) ) ( not ( = ?auto_653996 ?auto_654002 ) ) ( not ( = ?auto_653996 ?auto_654003 ) ) ( not ( = ?auto_653996 ?auto_654004 ) ) ( not ( = ?auto_653997 ?auto_653998 ) ) ( not ( = ?auto_653997 ?auto_653999 ) ) ( not ( = ?auto_653997 ?auto_654000 ) ) ( not ( = ?auto_653997 ?auto_654001 ) ) ( not ( = ?auto_653997 ?auto_654002 ) ) ( not ( = ?auto_653997 ?auto_654003 ) ) ( not ( = ?auto_653997 ?auto_654004 ) ) ( not ( = ?auto_653998 ?auto_653999 ) ) ( not ( = ?auto_653998 ?auto_654000 ) ) ( not ( = ?auto_653998 ?auto_654001 ) ) ( not ( = ?auto_653998 ?auto_654002 ) ) ( not ( = ?auto_653998 ?auto_654003 ) ) ( not ( = ?auto_653998 ?auto_654004 ) ) ( not ( = ?auto_653999 ?auto_654000 ) ) ( not ( = ?auto_653999 ?auto_654001 ) ) ( not ( = ?auto_653999 ?auto_654002 ) ) ( not ( = ?auto_653999 ?auto_654003 ) ) ( not ( = ?auto_653999 ?auto_654004 ) ) ( not ( = ?auto_654000 ?auto_654001 ) ) ( not ( = ?auto_654000 ?auto_654002 ) ) ( not ( = ?auto_654000 ?auto_654003 ) ) ( not ( = ?auto_654000 ?auto_654004 ) ) ( not ( = ?auto_654001 ?auto_654002 ) ) ( not ( = ?auto_654001 ?auto_654003 ) ) ( not ( = ?auto_654001 ?auto_654004 ) ) ( not ( = ?auto_654002 ?auto_654003 ) ) ( not ( = ?auto_654002 ?auto_654004 ) ) ( not ( = ?auto_654003 ?auto_654004 ) ) ( ON ?auto_654002 ?auto_654003 ) ( ON ?auto_654001 ?auto_654002 ) ( ON ?auto_654000 ?auto_654001 ) ( ON ?auto_653999 ?auto_654000 ) ( ON ?auto_653998 ?auto_653999 ) ( ON ?auto_653997 ?auto_653998 ) ( CLEAR ?auto_653995 ) ( ON ?auto_653996 ?auto_653997 ) ( CLEAR ?auto_653996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_653990 ?auto_653991 ?auto_653992 ?auto_653993 ?auto_653994 ?auto_653995 ?auto_653996 )
      ( MAKE-14PILE ?auto_653990 ?auto_653991 ?auto_653992 ?auto_653993 ?auto_653994 ?auto_653995 ?auto_653996 ?auto_653997 ?auto_653998 ?auto_653999 ?auto_654000 ?auto_654001 ?auto_654002 ?auto_654003 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_654048 - BLOCK
      ?auto_654049 - BLOCK
      ?auto_654050 - BLOCK
      ?auto_654051 - BLOCK
      ?auto_654052 - BLOCK
      ?auto_654053 - BLOCK
      ?auto_654054 - BLOCK
      ?auto_654055 - BLOCK
      ?auto_654056 - BLOCK
      ?auto_654057 - BLOCK
      ?auto_654058 - BLOCK
      ?auto_654059 - BLOCK
      ?auto_654060 - BLOCK
      ?auto_654061 - BLOCK
    )
    :vars
    (
      ?auto_654062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_654061 ?auto_654062 ) ( ON-TABLE ?auto_654048 ) ( ON ?auto_654049 ?auto_654048 ) ( ON ?auto_654050 ?auto_654049 ) ( ON ?auto_654051 ?auto_654050 ) ( ON ?auto_654052 ?auto_654051 ) ( not ( = ?auto_654048 ?auto_654049 ) ) ( not ( = ?auto_654048 ?auto_654050 ) ) ( not ( = ?auto_654048 ?auto_654051 ) ) ( not ( = ?auto_654048 ?auto_654052 ) ) ( not ( = ?auto_654048 ?auto_654053 ) ) ( not ( = ?auto_654048 ?auto_654054 ) ) ( not ( = ?auto_654048 ?auto_654055 ) ) ( not ( = ?auto_654048 ?auto_654056 ) ) ( not ( = ?auto_654048 ?auto_654057 ) ) ( not ( = ?auto_654048 ?auto_654058 ) ) ( not ( = ?auto_654048 ?auto_654059 ) ) ( not ( = ?auto_654048 ?auto_654060 ) ) ( not ( = ?auto_654048 ?auto_654061 ) ) ( not ( = ?auto_654048 ?auto_654062 ) ) ( not ( = ?auto_654049 ?auto_654050 ) ) ( not ( = ?auto_654049 ?auto_654051 ) ) ( not ( = ?auto_654049 ?auto_654052 ) ) ( not ( = ?auto_654049 ?auto_654053 ) ) ( not ( = ?auto_654049 ?auto_654054 ) ) ( not ( = ?auto_654049 ?auto_654055 ) ) ( not ( = ?auto_654049 ?auto_654056 ) ) ( not ( = ?auto_654049 ?auto_654057 ) ) ( not ( = ?auto_654049 ?auto_654058 ) ) ( not ( = ?auto_654049 ?auto_654059 ) ) ( not ( = ?auto_654049 ?auto_654060 ) ) ( not ( = ?auto_654049 ?auto_654061 ) ) ( not ( = ?auto_654049 ?auto_654062 ) ) ( not ( = ?auto_654050 ?auto_654051 ) ) ( not ( = ?auto_654050 ?auto_654052 ) ) ( not ( = ?auto_654050 ?auto_654053 ) ) ( not ( = ?auto_654050 ?auto_654054 ) ) ( not ( = ?auto_654050 ?auto_654055 ) ) ( not ( = ?auto_654050 ?auto_654056 ) ) ( not ( = ?auto_654050 ?auto_654057 ) ) ( not ( = ?auto_654050 ?auto_654058 ) ) ( not ( = ?auto_654050 ?auto_654059 ) ) ( not ( = ?auto_654050 ?auto_654060 ) ) ( not ( = ?auto_654050 ?auto_654061 ) ) ( not ( = ?auto_654050 ?auto_654062 ) ) ( not ( = ?auto_654051 ?auto_654052 ) ) ( not ( = ?auto_654051 ?auto_654053 ) ) ( not ( = ?auto_654051 ?auto_654054 ) ) ( not ( = ?auto_654051 ?auto_654055 ) ) ( not ( = ?auto_654051 ?auto_654056 ) ) ( not ( = ?auto_654051 ?auto_654057 ) ) ( not ( = ?auto_654051 ?auto_654058 ) ) ( not ( = ?auto_654051 ?auto_654059 ) ) ( not ( = ?auto_654051 ?auto_654060 ) ) ( not ( = ?auto_654051 ?auto_654061 ) ) ( not ( = ?auto_654051 ?auto_654062 ) ) ( not ( = ?auto_654052 ?auto_654053 ) ) ( not ( = ?auto_654052 ?auto_654054 ) ) ( not ( = ?auto_654052 ?auto_654055 ) ) ( not ( = ?auto_654052 ?auto_654056 ) ) ( not ( = ?auto_654052 ?auto_654057 ) ) ( not ( = ?auto_654052 ?auto_654058 ) ) ( not ( = ?auto_654052 ?auto_654059 ) ) ( not ( = ?auto_654052 ?auto_654060 ) ) ( not ( = ?auto_654052 ?auto_654061 ) ) ( not ( = ?auto_654052 ?auto_654062 ) ) ( not ( = ?auto_654053 ?auto_654054 ) ) ( not ( = ?auto_654053 ?auto_654055 ) ) ( not ( = ?auto_654053 ?auto_654056 ) ) ( not ( = ?auto_654053 ?auto_654057 ) ) ( not ( = ?auto_654053 ?auto_654058 ) ) ( not ( = ?auto_654053 ?auto_654059 ) ) ( not ( = ?auto_654053 ?auto_654060 ) ) ( not ( = ?auto_654053 ?auto_654061 ) ) ( not ( = ?auto_654053 ?auto_654062 ) ) ( not ( = ?auto_654054 ?auto_654055 ) ) ( not ( = ?auto_654054 ?auto_654056 ) ) ( not ( = ?auto_654054 ?auto_654057 ) ) ( not ( = ?auto_654054 ?auto_654058 ) ) ( not ( = ?auto_654054 ?auto_654059 ) ) ( not ( = ?auto_654054 ?auto_654060 ) ) ( not ( = ?auto_654054 ?auto_654061 ) ) ( not ( = ?auto_654054 ?auto_654062 ) ) ( not ( = ?auto_654055 ?auto_654056 ) ) ( not ( = ?auto_654055 ?auto_654057 ) ) ( not ( = ?auto_654055 ?auto_654058 ) ) ( not ( = ?auto_654055 ?auto_654059 ) ) ( not ( = ?auto_654055 ?auto_654060 ) ) ( not ( = ?auto_654055 ?auto_654061 ) ) ( not ( = ?auto_654055 ?auto_654062 ) ) ( not ( = ?auto_654056 ?auto_654057 ) ) ( not ( = ?auto_654056 ?auto_654058 ) ) ( not ( = ?auto_654056 ?auto_654059 ) ) ( not ( = ?auto_654056 ?auto_654060 ) ) ( not ( = ?auto_654056 ?auto_654061 ) ) ( not ( = ?auto_654056 ?auto_654062 ) ) ( not ( = ?auto_654057 ?auto_654058 ) ) ( not ( = ?auto_654057 ?auto_654059 ) ) ( not ( = ?auto_654057 ?auto_654060 ) ) ( not ( = ?auto_654057 ?auto_654061 ) ) ( not ( = ?auto_654057 ?auto_654062 ) ) ( not ( = ?auto_654058 ?auto_654059 ) ) ( not ( = ?auto_654058 ?auto_654060 ) ) ( not ( = ?auto_654058 ?auto_654061 ) ) ( not ( = ?auto_654058 ?auto_654062 ) ) ( not ( = ?auto_654059 ?auto_654060 ) ) ( not ( = ?auto_654059 ?auto_654061 ) ) ( not ( = ?auto_654059 ?auto_654062 ) ) ( not ( = ?auto_654060 ?auto_654061 ) ) ( not ( = ?auto_654060 ?auto_654062 ) ) ( not ( = ?auto_654061 ?auto_654062 ) ) ( ON ?auto_654060 ?auto_654061 ) ( ON ?auto_654059 ?auto_654060 ) ( ON ?auto_654058 ?auto_654059 ) ( ON ?auto_654057 ?auto_654058 ) ( ON ?auto_654056 ?auto_654057 ) ( ON ?auto_654055 ?auto_654056 ) ( ON ?auto_654054 ?auto_654055 ) ( CLEAR ?auto_654052 ) ( ON ?auto_654053 ?auto_654054 ) ( CLEAR ?auto_654053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_654048 ?auto_654049 ?auto_654050 ?auto_654051 ?auto_654052 ?auto_654053 )
      ( MAKE-14PILE ?auto_654048 ?auto_654049 ?auto_654050 ?auto_654051 ?auto_654052 ?auto_654053 ?auto_654054 ?auto_654055 ?auto_654056 ?auto_654057 ?auto_654058 ?auto_654059 ?auto_654060 ?auto_654061 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_654106 - BLOCK
      ?auto_654107 - BLOCK
      ?auto_654108 - BLOCK
      ?auto_654109 - BLOCK
      ?auto_654110 - BLOCK
      ?auto_654111 - BLOCK
      ?auto_654112 - BLOCK
      ?auto_654113 - BLOCK
      ?auto_654114 - BLOCK
      ?auto_654115 - BLOCK
      ?auto_654116 - BLOCK
      ?auto_654117 - BLOCK
      ?auto_654118 - BLOCK
      ?auto_654119 - BLOCK
    )
    :vars
    (
      ?auto_654120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_654119 ?auto_654120 ) ( ON-TABLE ?auto_654106 ) ( ON ?auto_654107 ?auto_654106 ) ( ON ?auto_654108 ?auto_654107 ) ( ON ?auto_654109 ?auto_654108 ) ( not ( = ?auto_654106 ?auto_654107 ) ) ( not ( = ?auto_654106 ?auto_654108 ) ) ( not ( = ?auto_654106 ?auto_654109 ) ) ( not ( = ?auto_654106 ?auto_654110 ) ) ( not ( = ?auto_654106 ?auto_654111 ) ) ( not ( = ?auto_654106 ?auto_654112 ) ) ( not ( = ?auto_654106 ?auto_654113 ) ) ( not ( = ?auto_654106 ?auto_654114 ) ) ( not ( = ?auto_654106 ?auto_654115 ) ) ( not ( = ?auto_654106 ?auto_654116 ) ) ( not ( = ?auto_654106 ?auto_654117 ) ) ( not ( = ?auto_654106 ?auto_654118 ) ) ( not ( = ?auto_654106 ?auto_654119 ) ) ( not ( = ?auto_654106 ?auto_654120 ) ) ( not ( = ?auto_654107 ?auto_654108 ) ) ( not ( = ?auto_654107 ?auto_654109 ) ) ( not ( = ?auto_654107 ?auto_654110 ) ) ( not ( = ?auto_654107 ?auto_654111 ) ) ( not ( = ?auto_654107 ?auto_654112 ) ) ( not ( = ?auto_654107 ?auto_654113 ) ) ( not ( = ?auto_654107 ?auto_654114 ) ) ( not ( = ?auto_654107 ?auto_654115 ) ) ( not ( = ?auto_654107 ?auto_654116 ) ) ( not ( = ?auto_654107 ?auto_654117 ) ) ( not ( = ?auto_654107 ?auto_654118 ) ) ( not ( = ?auto_654107 ?auto_654119 ) ) ( not ( = ?auto_654107 ?auto_654120 ) ) ( not ( = ?auto_654108 ?auto_654109 ) ) ( not ( = ?auto_654108 ?auto_654110 ) ) ( not ( = ?auto_654108 ?auto_654111 ) ) ( not ( = ?auto_654108 ?auto_654112 ) ) ( not ( = ?auto_654108 ?auto_654113 ) ) ( not ( = ?auto_654108 ?auto_654114 ) ) ( not ( = ?auto_654108 ?auto_654115 ) ) ( not ( = ?auto_654108 ?auto_654116 ) ) ( not ( = ?auto_654108 ?auto_654117 ) ) ( not ( = ?auto_654108 ?auto_654118 ) ) ( not ( = ?auto_654108 ?auto_654119 ) ) ( not ( = ?auto_654108 ?auto_654120 ) ) ( not ( = ?auto_654109 ?auto_654110 ) ) ( not ( = ?auto_654109 ?auto_654111 ) ) ( not ( = ?auto_654109 ?auto_654112 ) ) ( not ( = ?auto_654109 ?auto_654113 ) ) ( not ( = ?auto_654109 ?auto_654114 ) ) ( not ( = ?auto_654109 ?auto_654115 ) ) ( not ( = ?auto_654109 ?auto_654116 ) ) ( not ( = ?auto_654109 ?auto_654117 ) ) ( not ( = ?auto_654109 ?auto_654118 ) ) ( not ( = ?auto_654109 ?auto_654119 ) ) ( not ( = ?auto_654109 ?auto_654120 ) ) ( not ( = ?auto_654110 ?auto_654111 ) ) ( not ( = ?auto_654110 ?auto_654112 ) ) ( not ( = ?auto_654110 ?auto_654113 ) ) ( not ( = ?auto_654110 ?auto_654114 ) ) ( not ( = ?auto_654110 ?auto_654115 ) ) ( not ( = ?auto_654110 ?auto_654116 ) ) ( not ( = ?auto_654110 ?auto_654117 ) ) ( not ( = ?auto_654110 ?auto_654118 ) ) ( not ( = ?auto_654110 ?auto_654119 ) ) ( not ( = ?auto_654110 ?auto_654120 ) ) ( not ( = ?auto_654111 ?auto_654112 ) ) ( not ( = ?auto_654111 ?auto_654113 ) ) ( not ( = ?auto_654111 ?auto_654114 ) ) ( not ( = ?auto_654111 ?auto_654115 ) ) ( not ( = ?auto_654111 ?auto_654116 ) ) ( not ( = ?auto_654111 ?auto_654117 ) ) ( not ( = ?auto_654111 ?auto_654118 ) ) ( not ( = ?auto_654111 ?auto_654119 ) ) ( not ( = ?auto_654111 ?auto_654120 ) ) ( not ( = ?auto_654112 ?auto_654113 ) ) ( not ( = ?auto_654112 ?auto_654114 ) ) ( not ( = ?auto_654112 ?auto_654115 ) ) ( not ( = ?auto_654112 ?auto_654116 ) ) ( not ( = ?auto_654112 ?auto_654117 ) ) ( not ( = ?auto_654112 ?auto_654118 ) ) ( not ( = ?auto_654112 ?auto_654119 ) ) ( not ( = ?auto_654112 ?auto_654120 ) ) ( not ( = ?auto_654113 ?auto_654114 ) ) ( not ( = ?auto_654113 ?auto_654115 ) ) ( not ( = ?auto_654113 ?auto_654116 ) ) ( not ( = ?auto_654113 ?auto_654117 ) ) ( not ( = ?auto_654113 ?auto_654118 ) ) ( not ( = ?auto_654113 ?auto_654119 ) ) ( not ( = ?auto_654113 ?auto_654120 ) ) ( not ( = ?auto_654114 ?auto_654115 ) ) ( not ( = ?auto_654114 ?auto_654116 ) ) ( not ( = ?auto_654114 ?auto_654117 ) ) ( not ( = ?auto_654114 ?auto_654118 ) ) ( not ( = ?auto_654114 ?auto_654119 ) ) ( not ( = ?auto_654114 ?auto_654120 ) ) ( not ( = ?auto_654115 ?auto_654116 ) ) ( not ( = ?auto_654115 ?auto_654117 ) ) ( not ( = ?auto_654115 ?auto_654118 ) ) ( not ( = ?auto_654115 ?auto_654119 ) ) ( not ( = ?auto_654115 ?auto_654120 ) ) ( not ( = ?auto_654116 ?auto_654117 ) ) ( not ( = ?auto_654116 ?auto_654118 ) ) ( not ( = ?auto_654116 ?auto_654119 ) ) ( not ( = ?auto_654116 ?auto_654120 ) ) ( not ( = ?auto_654117 ?auto_654118 ) ) ( not ( = ?auto_654117 ?auto_654119 ) ) ( not ( = ?auto_654117 ?auto_654120 ) ) ( not ( = ?auto_654118 ?auto_654119 ) ) ( not ( = ?auto_654118 ?auto_654120 ) ) ( not ( = ?auto_654119 ?auto_654120 ) ) ( ON ?auto_654118 ?auto_654119 ) ( ON ?auto_654117 ?auto_654118 ) ( ON ?auto_654116 ?auto_654117 ) ( ON ?auto_654115 ?auto_654116 ) ( ON ?auto_654114 ?auto_654115 ) ( ON ?auto_654113 ?auto_654114 ) ( ON ?auto_654112 ?auto_654113 ) ( ON ?auto_654111 ?auto_654112 ) ( CLEAR ?auto_654109 ) ( ON ?auto_654110 ?auto_654111 ) ( CLEAR ?auto_654110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_654106 ?auto_654107 ?auto_654108 ?auto_654109 ?auto_654110 )
      ( MAKE-14PILE ?auto_654106 ?auto_654107 ?auto_654108 ?auto_654109 ?auto_654110 ?auto_654111 ?auto_654112 ?auto_654113 ?auto_654114 ?auto_654115 ?auto_654116 ?auto_654117 ?auto_654118 ?auto_654119 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_654164 - BLOCK
      ?auto_654165 - BLOCK
      ?auto_654166 - BLOCK
      ?auto_654167 - BLOCK
      ?auto_654168 - BLOCK
      ?auto_654169 - BLOCK
      ?auto_654170 - BLOCK
      ?auto_654171 - BLOCK
      ?auto_654172 - BLOCK
      ?auto_654173 - BLOCK
      ?auto_654174 - BLOCK
      ?auto_654175 - BLOCK
      ?auto_654176 - BLOCK
      ?auto_654177 - BLOCK
    )
    :vars
    (
      ?auto_654178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_654177 ?auto_654178 ) ( ON-TABLE ?auto_654164 ) ( ON ?auto_654165 ?auto_654164 ) ( ON ?auto_654166 ?auto_654165 ) ( not ( = ?auto_654164 ?auto_654165 ) ) ( not ( = ?auto_654164 ?auto_654166 ) ) ( not ( = ?auto_654164 ?auto_654167 ) ) ( not ( = ?auto_654164 ?auto_654168 ) ) ( not ( = ?auto_654164 ?auto_654169 ) ) ( not ( = ?auto_654164 ?auto_654170 ) ) ( not ( = ?auto_654164 ?auto_654171 ) ) ( not ( = ?auto_654164 ?auto_654172 ) ) ( not ( = ?auto_654164 ?auto_654173 ) ) ( not ( = ?auto_654164 ?auto_654174 ) ) ( not ( = ?auto_654164 ?auto_654175 ) ) ( not ( = ?auto_654164 ?auto_654176 ) ) ( not ( = ?auto_654164 ?auto_654177 ) ) ( not ( = ?auto_654164 ?auto_654178 ) ) ( not ( = ?auto_654165 ?auto_654166 ) ) ( not ( = ?auto_654165 ?auto_654167 ) ) ( not ( = ?auto_654165 ?auto_654168 ) ) ( not ( = ?auto_654165 ?auto_654169 ) ) ( not ( = ?auto_654165 ?auto_654170 ) ) ( not ( = ?auto_654165 ?auto_654171 ) ) ( not ( = ?auto_654165 ?auto_654172 ) ) ( not ( = ?auto_654165 ?auto_654173 ) ) ( not ( = ?auto_654165 ?auto_654174 ) ) ( not ( = ?auto_654165 ?auto_654175 ) ) ( not ( = ?auto_654165 ?auto_654176 ) ) ( not ( = ?auto_654165 ?auto_654177 ) ) ( not ( = ?auto_654165 ?auto_654178 ) ) ( not ( = ?auto_654166 ?auto_654167 ) ) ( not ( = ?auto_654166 ?auto_654168 ) ) ( not ( = ?auto_654166 ?auto_654169 ) ) ( not ( = ?auto_654166 ?auto_654170 ) ) ( not ( = ?auto_654166 ?auto_654171 ) ) ( not ( = ?auto_654166 ?auto_654172 ) ) ( not ( = ?auto_654166 ?auto_654173 ) ) ( not ( = ?auto_654166 ?auto_654174 ) ) ( not ( = ?auto_654166 ?auto_654175 ) ) ( not ( = ?auto_654166 ?auto_654176 ) ) ( not ( = ?auto_654166 ?auto_654177 ) ) ( not ( = ?auto_654166 ?auto_654178 ) ) ( not ( = ?auto_654167 ?auto_654168 ) ) ( not ( = ?auto_654167 ?auto_654169 ) ) ( not ( = ?auto_654167 ?auto_654170 ) ) ( not ( = ?auto_654167 ?auto_654171 ) ) ( not ( = ?auto_654167 ?auto_654172 ) ) ( not ( = ?auto_654167 ?auto_654173 ) ) ( not ( = ?auto_654167 ?auto_654174 ) ) ( not ( = ?auto_654167 ?auto_654175 ) ) ( not ( = ?auto_654167 ?auto_654176 ) ) ( not ( = ?auto_654167 ?auto_654177 ) ) ( not ( = ?auto_654167 ?auto_654178 ) ) ( not ( = ?auto_654168 ?auto_654169 ) ) ( not ( = ?auto_654168 ?auto_654170 ) ) ( not ( = ?auto_654168 ?auto_654171 ) ) ( not ( = ?auto_654168 ?auto_654172 ) ) ( not ( = ?auto_654168 ?auto_654173 ) ) ( not ( = ?auto_654168 ?auto_654174 ) ) ( not ( = ?auto_654168 ?auto_654175 ) ) ( not ( = ?auto_654168 ?auto_654176 ) ) ( not ( = ?auto_654168 ?auto_654177 ) ) ( not ( = ?auto_654168 ?auto_654178 ) ) ( not ( = ?auto_654169 ?auto_654170 ) ) ( not ( = ?auto_654169 ?auto_654171 ) ) ( not ( = ?auto_654169 ?auto_654172 ) ) ( not ( = ?auto_654169 ?auto_654173 ) ) ( not ( = ?auto_654169 ?auto_654174 ) ) ( not ( = ?auto_654169 ?auto_654175 ) ) ( not ( = ?auto_654169 ?auto_654176 ) ) ( not ( = ?auto_654169 ?auto_654177 ) ) ( not ( = ?auto_654169 ?auto_654178 ) ) ( not ( = ?auto_654170 ?auto_654171 ) ) ( not ( = ?auto_654170 ?auto_654172 ) ) ( not ( = ?auto_654170 ?auto_654173 ) ) ( not ( = ?auto_654170 ?auto_654174 ) ) ( not ( = ?auto_654170 ?auto_654175 ) ) ( not ( = ?auto_654170 ?auto_654176 ) ) ( not ( = ?auto_654170 ?auto_654177 ) ) ( not ( = ?auto_654170 ?auto_654178 ) ) ( not ( = ?auto_654171 ?auto_654172 ) ) ( not ( = ?auto_654171 ?auto_654173 ) ) ( not ( = ?auto_654171 ?auto_654174 ) ) ( not ( = ?auto_654171 ?auto_654175 ) ) ( not ( = ?auto_654171 ?auto_654176 ) ) ( not ( = ?auto_654171 ?auto_654177 ) ) ( not ( = ?auto_654171 ?auto_654178 ) ) ( not ( = ?auto_654172 ?auto_654173 ) ) ( not ( = ?auto_654172 ?auto_654174 ) ) ( not ( = ?auto_654172 ?auto_654175 ) ) ( not ( = ?auto_654172 ?auto_654176 ) ) ( not ( = ?auto_654172 ?auto_654177 ) ) ( not ( = ?auto_654172 ?auto_654178 ) ) ( not ( = ?auto_654173 ?auto_654174 ) ) ( not ( = ?auto_654173 ?auto_654175 ) ) ( not ( = ?auto_654173 ?auto_654176 ) ) ( not ( = ?auto_654173 ?auto_654177 ) ) ( not ( = ?auto_654173 ?auto_654178 ) ) ( not ( = ?auto_654174 ?auto_654175 ) ) ( not ( = ?auto_654174 ?auto_654176 ) ) ( not ( = ?auto_654174 ?auto_654177 ) ) ( not ( = ?auto_654174 ?auto_654178 ) ) ( not ( = ?auto_654175 ?auto_654176 ) ) ( not ( = ?auto_654175 ?auto_654177 ) ) ( not ( = ?auto_654175 ?auto_654178 ) ) ( not ( = ?auto_654176 ?auto_654177 ) ) ( not ( = ?auto_654176 ?auto_654178 ) ) ( not ( = ?auto_654177 ?auto_654178 ) ) ( ON ?auto_654176 ?auto_654177 ) ( ON ?auto_654175 ?auto_654176 ) ( ON ?auto_654174 ?auto_654175 ) ( ON ?auto_654173 ?auto_654174 ) ( ON ?auto_654172 ?auto_654173 ) ( ON ?auto_654171 ?auto_654172 ) ( ON ?auto_654170 ?auto_654171 ) ( ON ?auto_654169 ?auto_654170 ) ( ON ?auto_654168 ?auto_654169 ) ( CLEAR ?auto_654166 ) ( ON ?auto_654167 ?auto_654168 ) ( CLEAR ?auto_654167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_654164 ?auto_654165 ?auto_654166 ?auto_654167 )
      ( MAKE-14PILE ?auto_654164 ?auto_654165 ?auto_654166 ?auto_654167 ?auto_654168 ?auto_654169 ?auto_654170 ?auto_654171 ?auto_654172 ?auto_654173 ?auto_654174 ?auto_654175 ?auto_654176 ?auto_654177 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_654222 - BLOCK
      ?auto_654223 - BLOCK
      ?auto_654224 - BLOCK
      ?auto_654225 - BLOCK
      ?auto_654226 - BLOCK
      ?auto_654227 - BLOCK
      ?auto_654228 - BLOCK
      ?auto_654229 - BLOCK
      ?auto_654230 - BLOCK
      ?auto_654231 - BLOCK
      ?auto_654232 - BLOCK
      ?auto_654233 - BLOCK
      ?auto_654234 - BLOCK
      ?auto_654235 - BLOCK
    )
    :vars
    (
      ?auto_654236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_654235 ?auto_654236 ) ( ON-TABLE ?auto_654222 ) ( ON ?auto_654223 ?auto_654222 ) ( not ( = ?auto_654222 ?auto_654223 ) ) ( not ( = ?auto_654222 ?auto_654224 ) ) ( not ( = ?auto_654222 ?auto_654225 ) ) ( not ( = ?auto_654222 ?auto_654226 ) ) ( not ( = ?auto_654222 ?auto_654227 ) ) ( not ( = ?auto_654222 ?auto_654228 ) ) ( not ( = ?auto_654222 ?auto_654229 ) ) ( not ( = ?auto_654222 ?auto_654230 ) ) ( not ( = ?auto_654222 ?auto_654231 ) ) ( not ( = ?auto_654222 ?auto_654232 ) ) ( not ( = ?auto_654222 ?auto_654233 ) ) ( not ( = ?auto_654222 ?auto_654234 ) ) ( not ( = ?auto_654222 ?auto_654235 ) ) ( not ( = ?auto_654222 ?auto_654236 ) ) ( not ( = ?auto_654223 ?auto_654224 ) ) ( not ( = ?auto_654223 ?auto_654225 ) ) ( not ( = ?auto_654223 ?auto_654226 ) ) ( not ( = ?auto_654223 ?auto_654227 ) ) ( not ( = ?auto_654223 ?auto_654228 ) ) ( not ( = ?auto_654223 ?auto_654229 ) ) ( not ( = ?auto_654223 ?auto_654230 ) ) ( not ( = ?auto_654223 ?auto_654231 ) ) ( not ( = ?auto_654223 ?auto_654232 ) ) ( not ( = ?auto_654223 ?auto_654233 ) ) ( not ( = ?auto_654223 ?auto_654234 ) ) ( not ( = ?auto_654223 ?auto_654235 ) ) ( not ( = ?auto_654223 ?auto_654236 ) ) ( not ( = ?auto_654224 ?auto_654225 ) ) ( not ( = ?auto_654224 ?auto_654226 ) ) ( not ( = ?auto_654224 ?auto_654227 ) ) ( not ( = ?auto_654224 ?auto_654228 ) ) ( not ( = ?auto_654224 ?auto_654229 ) ) ( not ( = ?auto_654224 ?auto_654230 ) ) ( not ( = ?auto_654224 ?auto_654231 ) ) ( not ( = ?auto_654224 ?auto_654232 ) ) ( not ( = ?auto_654224 ?auto_654233 ) ) ( not ( = ?auto_654224 ?auto_654234 ) ) ( not ( = ?auto_654224 ?auto_654235 ) ) ( not ( = ?auto_654224 ?auto_654236 ) ) ( not ( = ?auto_654225 ?auto_654226 ) ) ( not ( = ?auto_654225 ?auto_654227 ) ) ( not ( = ?auto_654225 ?auto_654228 ) ) ( not ( = ?auto_654225 ?auto_654229 ) ) ( not ( = ?auto_654225 ?auto_654230 ) ) ( not ( = ?auto_654225 ?auto_654231 ) ) ( not ( = ?auto_654225 ?auto_654232 ) ) ( not ( = ?auto_654225 ?auto_654233 ) ) ( not ( = ?auto_654225 ?auto_654234 ) ) ( not ( = ?auto_654225 ?auto_654235 ) ) ( not ( = ?auto_654225 ?auto_654236 ) ) ( not ( = ?auto_654226 ?auto_654227 ) ) ( not ( = ?auto_654226 ?auto_654228 ) ) ( not ( = ?auto_654226 ?auto_654229 ) ) ( not ( = ?auto_654226 ?auto_654230 ) ) ( not ( = ?auto_654226 ?auto_654231 ) ) ( not ( = ?auto_654226 ?auto_654232 ) ) ( not ( = ?auto_654226 ?auto_654233 ) ) ( not ( = ?auto_654226 ?auto_654234 ) ) ( not ( = ?auto_654226 ?auto_654235 ) ) ( not ( = ?auto_654226 ?auto_654236 ) ) ( not ( = ?auto_654227 ?auto_654228 ) ) ( not ( = ?auto_654227 ?auto_654229 ) ) ( not ( = ?auto_654227 ?auto_654230 ) ) ( not ( = ?auto_654227 ?auto_654231 ) ) ( not ( = ?auto_654227 ?auto_654232 ) ) ( not ( = ?auto_654227 ?auto_654233 ) ) ( not ( = ?auto_654227 ?auto_654234 ) ) ( not ( = ?auto_654227 ?auto_654235 ) ) ( not ( = ?auto_654227 ?auto_654236 ) ) ( not ( = ?auto_654228 ?auto_654229 ) ) ( not ( = ?auto_654228 ?auto_654230 ) ) ( not ( = ?auto_654228 ?auto_654231 ) ) ( not ( = ?auto_654228 ?auto_654232 ) ) ( not ( = ?auto_654228 ?auto_654233 ) ) ( not ( = ?auto_654228 ?auto_654234 ) ) ( not ( = ?auto_654228 ?auto_654235 ) ) ( not ( = ?auto_654228 ?auto_654236 ) ) ( not ( = ?auto_654229 ?auto_654230 ) ) ( not ( = ?auto_654229 ?auto_654231 ) ) ( not ( = ?auto_654229 ?auto_654232 ) ) ( not ( = ?auto_654229 ?auto_654233 ) ) ( not ( = ?auto_654229 ?auto_654234 ) ) ( not ( = ?auto_654229 ?auto_654235 ) ) ( not ( = ?auto_654229 ?auto_654236 ) ) ( not ( = ?auto_654230 ?auto_654231 ) ) ( not ( = ?auto_654230 ?auto_654232 ) ) ( not ( = ?auto_654230 ?auto_654233 ) ) ( not ( = ?auto_654230 ?auto_654234 ) ) ( not ( = ?auto_654230 ?auto_654235 ) ) ( not ( = ?auto_654230 ?auto_654236 ) ) ( not ( = ?auto_654231 ?auto_654232 ) ) ( not ( = ?auto_654231 ?auto_654233 ) ) ( not ( = ?auto_654231 ?auto_654234 ) ) ( not ( = ?auto_654231 ?auto_654235 ) ) ( not ( = ?auto_654231 ?auto_654236 ) ) ( not ( = ?auto_654232 ?auto_654233 ) ) ( not ( = ?auto_654232 ?auto_654234 ) ) ( not ( = ?auto_654232 ?auto_654235 ) ) ( not ( = ?auto_654232 ?auto_654236 ) ) ( not ( = ?auto_654233 ?auto_654234 ) ) ( not ( = ?auto_654233 ?auto_654235 ) ) ( not ( = ?auto_654233 ?auto_654236 ) ) ( not ( = ?auto_654234 ?auto_654235 ) ) ( not ( = ?auto_654234 ?auto_654236 ) ) ( not ( = ?auto_654235 ?auto_654236 ) ) ( ON ?auto_654234 ?auto_654235 ) ( ON ?auto_654233 ?auto_654234 ) ( ON ?auto_654232 ?auto_654233 ) ( ON ?auto_654231 ?auto_654232 ) ( ON ?auto_654230 ?auto_654231 ) ( ON ?auto_654229 ?auto_654230 ) ( ON ?auto_654228 ?auto_654229 ) ( ON ?auto_654227 ?auto_654228 ) ( ON ?auto_654226 ?auto_654227 ) ( ON ?auto_654225 ?auto_654226 ) ( CLEAR ?auto_654223 ) ( ON ?auto_654224 ?auto_654225 ) ( CLEAR ?auto_654224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_654222 ?auto_654223 ?auto_654224 )
      ( MAKE-14PILE ?auto_654222 ?auto_654223 ?auto_654224 ?auto_654225 ?auto_654226 ?auto_654227 ?auto_654228 ?auto_654229 ?auto_654230 ?auto_654231 ?auto_654232 ?auto_654233 ?auto_654234 ?auto_654235 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_654280 - BLOCK
      ?auto_654281 - BLOCK
      ?auto_654282 - BLOCK
      ?auto_654283 - BLOCK
      ?auto_654284 - BLOCK
      ?auto_654285 - BLOCK
      ?auto_654286 - BLOCK
      ?auto_654287 - BLOCK
      ?auto_654288 - BLOCK
      ?auto_654289 - BLOCK
      ?auto_654290 - BLOCK
      ?auto_654291 - BLOCK
      ?auto_654292 - BLOCK
      ?auto_654293 - BLOCK
    )
    :vars
    (
      ?auto_654294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_654293 ?auto_654294 ) ( ON-TABLE ?auto_654280 ) ( not ( = ?auto_654280 ?auto_654281 ) ) ( not ( = ?auto_654280 ?auto_654282 ) ) ( not ( = ?auto_654280 ?auto_654283 ) ) ( not ( = ?auto_654280 ?auto_654284 ) ) ( not ( = ?auto_654280 ?auto_654285 ) ) ( not ( = ?auto_654280 ?auto_654286 ) ) ( not ( = ?auto_654280 ?auto_654287 ) ) ( not ( = ?auto_654280 ?auto_654288 ) ) ( not ( = ?auto_654280 ?auto_654289 ) ) ( not ( = ?auto_654280 ?auto_654290 ) ) ( not ( = ?auto_654280 ?auto_654291 ) ) ( not ( = ?auto_654280 ?auto_654292 ) ) ( not ( = ?auto_654280 ?auto_654293 ) ) ( not ( = ?auto_654280 ?auto_654294 ) ) ( not ( = ?auto_654281 ?auto_654282 ) ) ( not ( = ?auto_654281 ?auto_654283 ) ) ( not ( = ?auto_654281 ?auto_654284 ) ) ( not ( = ?auto_654281 ?auto_654285 ) ) ( not ( = ?auto_654281 ?auto_654286 ) ) ( not ( = ?auto_654281 ?auto_654287 ) ) ( not ( = ?auto_654281 ?auto_654288 ) ) ( not ( = ?auto_654281 ?auto_654289 ) ) ( not ( = ?auto_654281 ?auto_654290 ) ) ( not ( = ?auto_654281 ?auto_654291 ) ) ( not ( = ?auto_654281 ?auto_654292 ) ) ( not ( = ?auto_654281 ?auto_654293 ) ) ( not ( = ?auto_654281 ?auto_654294 ) ) ( not ( = ?auto_654282 ?auto_654283 ) ) ( not ( = ?auto_654282 ?auto_654284 ) ) ( not ( = ?auto_654282 ?auto_654285 ) ) ( not ( = ?auto_654282 ?auto_654286 ) ) ( not ( = ?auto_654282 ?auto_654287 ) ) ( not ( = ?auto_654282 ?auto_654288 ) ) ( not ( = ?auto_654282 ?auto_654289 ) ) ( not ( = ?auto_654282 ?auto_654290 ) ) ( not ( = ?auto_654282 ?auto_654291 ) ) ( not ( = ?auto_654282 ?auto_654292 ) ) ( not ( = ?auto_654282 ?auto_654293 ) ) ( not ( = ?auto_654282 ?auto_654294 ) ) ( not ( = ?auto_654283 ?auto_654284 ) ) ( not ( = ?auto_654283 ?auto_654285 ) ) ( not ( = ?auto_654283 ?auto_654286 ) ) ( not ( = ?auto_654283 ?auto_654287 ) ) ( not ( = ?auto_654283 ?auto_654288 ) ) ( not ( = ?auto_654283 ?auto_654289 ) ) ( not ( = ?auto_654283 ?auto_654290 ) ) ( not ( = ?auto_654283 ?auto_654291 ) ) ( not ( = ?auto_654283 ?auto_654292 ) ) ( not ( = ?auto_654283 ?auto_654293 ) ) ( not ( = ?auto_654283 ?auto_654294 ) ) ( not ( = ?auto_654284 ?auto_654285 ) ) ( not ( = ?auto_654284 ?auto_654286 ) ) ( not ( = ?auto_654284 ?auto_654287 ) ) ( not ( = ?auto_654284 ?auto_654288 ) ) ( not ( = ?auto_654284 ?auto_654289 ) ) ( not ( = ?auto_654284 ?auto_654290 ) ) ( not ( = ?auto_654284 ?auto_654291 ) ) ( not ( = ?auto_654284 ?auto_654292 ) ) ( not ( = ?auto_654284 ?auto_654293 ) ) ( not ( = ?auto_654284 ?auto_654294 ) ) ( not ( = ?auto_654285 ?auto_654286 ) ) ( not ( = ?auto_654285 ?auto_654287 ) ) ( not ( = ?auto_654285 ?auto_654288 ) ) ( not ( = ?auto_654285 ?auto_654289 ) ) ( not ( = ?auto_654285 ?auto_654290 ) ) ( not ( = ?auto_654285 ?auto_654291 ) ) ( not ( = ?auto_654285 ?auto_654292 ) ) ( not ( = ?auto_654285 ?auto_654293 ) ) ( not ( = ?auto_654285 ?auto_654294 ) ) ( not ( = ?auto_654286 ?auto_654287 ) ) ( not ( = ?auto_654286 ?auto_654288 ) ) ( not ( = ?auto_654286 ?auto_654289 ) ) ( not ( = ?auto_654286 ?auto_654290 ) ) ( not ( = ?auto_654286 ?auto_654291 ) ) ( not ( = ?auto_654286 ?auto_654292 ) ) ( not ( = ?auto_654286 ?auto_654293 ) ) ( not ( = ?auto_654286 ?auto_654294 ) ) ( not ( = ?auto_654287 ?auto_654288 ) ) ( not ( = ?auto_654287 ?auto_654289 ) ) ( not ( = ?auto_654287 ?auto_654290 ) ) ( not ( = ?auto_654287 ?auto_654291 ) ) ( not ( = ?auto_654287 ?auto_654292 ) ) ( not ( = ?auto_654287 ?auto_654293 ) ) ( not ( = ?auto_654287 ?auto_654294 ) ) ( not ( = ?auto_654288 ?auto_654289 ) ) ( not ( = ?auto_654288 ?auto_654290 ) ) ( not ( = ?auto_654288 ?auto_654291 ) ) ( not ( = ?auto_654288 ?auto_654292 ) ) ( not ( = ?auto_654288 ?auto_654293 ) ) ( not ( = ?auto_654288 ?auto_654294 ) ) ( not ( = ?auto_654289 ?auto_654290 ) ) ( not ( = ?auto_654289 ?auto_654291 ) ) ( not ( = ?auto_654289 ?auto_654292 ) ) ( not ( = ?auto_654289 ?auto_654293 ) ) ( not ( = ?auto_654289 ?auto_654294 ) ) ( not ( = ?auto_654290 ?auto_654291 ) ) ( not ( = ?auto_654290 ?auto_654292 ) ) ( not ( = ?auto_654290 ?auto_654293 ) ) ( not ( = ?auto_654290 ?auto_654294 ) ) ( not ( = ?auto_654291 ?auto_654292 ) ) ( not ( = ?auto_654291 ?auto_654293 ) ) ( not ( = ?auto_654291 ?auto_654294 ) ) ( not ( = ?auto_654292 ?auto_654293 ) ) ( not ( = ?auto_654292 ?auto_654294 ) ) ( not ( = ?auto_654293 ?auto_654294 ) ) ( ON ?auto_654292 ?auto_654293 ) ( ON ?auto_654291 ?auto_654292 ) ( ON ?auto_654290 ?auto_654291 ) ( ON ?auto_654289 ?auto_654290 ) ( ON ?auto_654288 ?auto_654289 ) ( ON ?auto_654287 ?auto_654288 ) ( ON ?auto_654286 ?auto_654287 ) ( ON ?auto_654285 ?auto_654286 ) ( ON ?auto_654284 ?auto_654285 ) ( ON ?auto_654283 ?auto_654284 ) ( ON ?auto_654282 ?auto_654283 ) ( CLEAR ?auto_654280 ) ( ON ?auto_654281 ?auto_654282 ) ( CLEAR ?auto_654281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_654280 ?auto_654281 )
      ( MAKE-14PILE ?auto_654280 ?auto_654281 ?auto_654282 ?auto_654283 ?auto_654284 ?auto_654285 ?auto_654286 ?auto_654287 ?auto_654288 ?auto_654289 ?auto_654290 ?auto_654291 ?auto_654292 ?auto_654293 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_654338 - BLOCK
      ?auto_654339 - BLOCK
      ?auto_654340 - BLOCK
      ?auto_654341 - BLOCK
      ?auto_654342 - BLOCK
      ?auto_654343 - BLOCK
      ?auto_654344 - BLOCK
      ?auto_654345 - BLOCK
      ?auto_654346 - BLOCK
      ?auto_654347 - BLOCK
      ?auto_654348 - BLOCK
      ?auto_654349 - BLOCK
      ?auto_654350 - BLOCK
      ?auto_654351 - BLOCK
    )
    :vars
    (
      ?auto_654352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_654351 ?auto_654352 ) ( not ( = ?auto_654338 ?auto_654339 ) ) ( not ( = ?auto_654338 ?auto_654340 ) ) ( not ( = ?auto_654338 ?auto_654341 ) ) ( not ( = ?auto_654338 ?auto_654342 ) ) ( not ( = ?auto_654338 ?auto_654343 ) ) ( not ( = ?auto_654338 ?auto_654344 ) ) ( not ( = ?auto_654338 ?auto_654345 ) ) ( not ( = ?auto_654338 ?auto_654346 ) ) ( not ( = ?auto_654338 ?auto_654347 ) ) ( not ( = ?auto_654338 ?auto_654348 ) ) ( not ( = ?auto_654338 ?auto_654349 ) ) ( not ( = ?auto_654338 ?auto_654350 ) ) ( not ( = ?auto_654338 ?auto_654351 ) ) ( not ( = ?auto_654338 ?auto_654352 ) ) ( not ( = ?auto_654339 ?auto_654340 ) ) ( not ( = ?auto_654339 ?auto_654341 ) ) ( not ( = ?auto_654339 ?auto_654342 ) ) ( not ( = ?auto_654339 ?auto_654343 ) ) ( not ( = ?auto_654339 ?auto_654344 ) ) ( not ( = ?auto_654339 ?auto_654345 ) ) ( not ( = ?auto_654339 ?auto_654346 ) ) ( not ( = ?auto_654339 ?auto_654347 ) ) ( not ( = ?auto_654339 ?auto_654348 ) ) ( not ( = ?auto_654339 ?auto_654349 ) ) ( not ( = ?auto_654339 ?auto_654350 ) ) ( not ( = ?auto_654339 ?auto_654351 ) ) ( not ( = ?auto_654339 ?auto_654352 ) ) ( not ( = ?auto_654340 ?auto_654341 ) ) ( not ( = ?auto_654340 ?auto_654342 ) ) ( not ( = ?auto_654340 ?auto_654343 ) ) ( not ( = ?auto_654340 ?auto_654344 ) ) ( not ( = ?auto_654340 ?auto_654345 ) ) ( not ( = ?auto_654340 ?auto_654346 ) ) ( not ( = ?auto_654340 ?auto_654347 ) ) ( not ( = ?auto_654340 ?auto_654348 ) ) ( not ( = ?auto_654340 ?auto_654349 ) ) ( not ( = ?auto_654340 ?auto_654350 ) ) ( not ( = ?auto_654340 ?auto_654351 ) ) ( not ( = ?auto_654340 ?auto_654352 ) ) ( not ( = ?auto_654341 ?auto_654342 ) ) ( not ( = ?auto_654341 ?auto_654343 ) ) ( not ( = ?auto_654341 ?auto_654344 ) ) ( not ( = ?auto_654341 ?auto_654345 ) ) ( not ( = ?auto_654341 ?auto_654346 ) ) ( not ( = ?auto_654341 ?auto_654347 ) ) ( not ( = ?auto_654341 ?auto_654348 ) ) ( not ( = ?auto_654341 ?auto_654349 ) ) ( not ( = ?auto_654341 ?auto_654350 ) ) ( not ( = ?auto_654341 ?auto_654351 ) ) ( not ( = ?auto_654341 ?auto_654352 ) ) ( not ( = ?auto_654342 ?auto_654343 ) ) ( not ( = ?auto_654342 ?auto_654344 ) ) ( not ( = ?auto_654342 ?auto_654345 ) ) ( not ( = ?auto_654342 ?auto_654346 ) ) ( not ( = ?auto_654342 ?auto_654347 ) ) ( not ( = ?auto_654342 ?auto_654348 ) ) ( not ( = ?auto_654342 ?auto_654349 ) ) ( not ( = ?auto_654342 ?auto_654350 ) ) ( not ( = ?auto_654342 ?auto_654351 ) ) ( not ( = ?auto_654342 ?auto_654352 ) ) ( not ( = ?auto_654343 ?auto_654344 ) ) ( not ( = ?auto_654343 ?auto_654345 ) ) ( not ( = ?auto_654343 ?auto_654346 ) ) ( not ( = ?auto_654343 ?auto_654347 ) ) ( not ( = ?auto_654343 ?auto_654348 ) ) ( not ( = ?auto_654343 ?auto_654349 ) ) ( not ( = ?auto_654343 ?auto_654350 ) ) ( not ( = ?auto_654343 ?auto_654351 ) ) ( not ( = ?auto_654343 ?auto_654352 ) ) ( not ( = ?auto_654344 ?auto_654345 ) ) ( not ( = ?auto_654344 ?auto_654346 ) ) ( not ( = ?auto_654344 ?auto_654347 ) ) ( not ( = ?auto_654344 ?auto_654348 ) ) ( not ( = ?auto_654344 ?auto_654349 ) ) ( not ( = ?auto_654344 ?auto_654350 ) ) ( not ( = ?auto_654344 ?auto_654351 ) ) ( not ( = ?auto_654344 ?auto_654352 ) ) ( not ( = ?auto_654345 ?auto_654346 ) ) ( not ( = ?auto_654345 ?auto_654347 ) ) ( not ( = ?auto_654345 ?auto_654348 ) ) ( not ( = ?auto_654345 ?auto_654349 ) ) ( not ( = ?auto_654345 ?auto_654350 ) ) ( not ( = ?auto_654345 ?auto_654351 ) ) ( not ( = ?auto_654345 ?auto_654352 ) ) ( not ( = ?auto_654346 ?auto_654347 ) ) ( not ( = ?auto_654346 ?auto_654348 ) ) ( not ( = ?auto_654346 ?auto_654349 ) ) ( not ( = ?auto_654346 ?auto_654350 ) ) ( not ( = ?auto_654346 ?auto_654351 ) ) ( not ( = ?auto_654346 ?auto_654352 ) ) ( not ( = ?auto_654347 ?auto_654348 ) ) ( not ( = ?auto_654347 ?auto_654349 ) ) ( not ( = ?auto_654347 ?auto_654350 ) ) ( not ( = ?auto_654347 ?auto_654351 ) ) ( not ( = ?auto_654347 ?auto_654352 ) ) ( not ( = ?auto_654348 ?auto_654349 ) ) ( not ( = ?auto_654348 ?auto_654350 ) ) ( not ( = ?auto_654348 ?auto_654351 ) ) ( not ( = ?auto_654348 ?auto_654352 ) ) ( not ( = ?auto_654349 ?auto_654350 ) ) ( not ( = ?auto_654349 ?auto_654351 ) ) ( not ( = ?auto_654349 ?auto_654352 ) ) ( not ( = ?auto_654350 ?auto_654351 ) ) ( not ( = ?auto_654350 ?auto_654352 ) ) ( not ( = ?auto_654351 ?auto_654352 ) ) ( ON ?auto_654350 ?auto_654351 ) ( ON ?auto_654349 ?auto_654350 ) ( ON ?auto_654348 ?auto_654349 ) ( ON ?auto_654347 ?auto_654348 ) ( ON ?auto_654346 ?auto_654347 ) ( ON ?auto_654345 ?auto_654346 ) ( ON ?auto_654344 ?auto_654345 ) ( ON ?auto_654343 ?auto_654344 ) ( ON ?auto_654342 ?auto_654343 ) ( ON ?auto_654341 ?auto_654342 ) ( ON ?auto_654340 ?auto_654341 ) ( ON ?auto_654339 ?auto_654340 ) ( ON ?auto_654338 ?auto_654339 ) ( CLEAR ?auto_654338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_654338 )
      ( MAKE-14PILE ?auto_654338 ?auto_654339 ?auto_654340 ?auto_654341 ?auto_654342 ?auto_654343 ?auto_654344 ?auto_654345 ?auto_654346 ?auto_654347 ?auto_654348 ?auto_654349 ?auto_654350 ?auto_654351 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_654397 - BLOCK
      ?auto_654398 - BLOCK
      ?auto_654399 - BLOCK
      ?auto_654400 - BLOCK
      ?auto_654401 - BLOCK
      ?auto_654402 - BLOCK
      ?auto_654403 - BLOCK
      ?auto_654404 - BLOCK
      ?auto_654405 - BLOCK
      ?auto_654406 - BLOCK
      ?auto_654407 - BLOCK
      ?auto_654408 - BLOCK
      ?auto_654409 - BLOCK
      ?auto_654410 - BLOCK
      ?auto_654411 - BLOCK
    )
    :vars
    (
      ?auto_654412 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_654410 ) ( ON ?auto_654411 ?auto_654412 ) ( CLEAR ?auto_654411 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_654397 ) ( ON ?auto_654398 ?auto_654397 ) ( ON ?auto_654399 ?auto_654398 ) ( ON ?auto_654400 ?auto_654399 ) ( ON ?auto_654401 ?auto_654400 ) ( ON ?auto_654402 ?auto_654401 ) ( ON ?auto_654403 ?auto_654402 ) ( ON ?auto_654404 ?auto_654403 ) ( ON ?auto_654405 ?auto_654404 ) ( ON ?auto_654406 ?auto_654405 ) ( ON ?auto_654407 ?auto_654406 ) ( ON ?auto_654408 ?auto_654407 ) ( ON ?auto_654409 ?auto_654408 ) ( ON ?auto_654410 ?auto_654409 ) ( not ( = ?auto_654397 ?auto_654398 ) ) ( not ( = ?auto_654397 ?auto_654399 ) ) ( not ( = ?auto_654397 ?auto_654400 ) ) ( not ( = ?auto_654397 ?auto_654401 ) ) ( not ( = ?auto_654397 ?auto_654402 ) ) ( not ( = ?auto_654397 ?auto_654403 ) ) ( not ( = ?auto_654397 ?auto_654404 ) ) ( not ( = ?auto_654397 ?auto_654405 ) ) ( not ( = ?auto_654397 ?auto_654406 ) ) ( not ( = ?auto_654397 ?auto_654407 ) ) ( not ( = ?auto_654397 ?auto_654408 ) ) ( not ( = ?auto_654397 ?auto_654409 ) ) ( not ( = ?auto_654397 ?auto_654410 ) ) ( not ( = ?auto_654397 ?auto_654411 ) ) ( not ( = ?auto_654397 ?auto_654412 ) ) ( not ( = ?auto_654398 ?auto_654399 ) ) ( not ( = ?auto_654398 ?auto_654400 ) ) ( not ( = ?auto_654398 ?auto_654401 ) ) ( not ( = ?auto_654398 ?auto_654402 ) ) ( not ( = ?auto_654398 ?auto_654403 ) ) ( not ( = ?auto_654398 ?auto_654404 ) ) ( not ( = ?auto_654398 ?auto_654405 ) ) ( not ( = ?auto_654398 ?auto_654406 ) ) ( not ( = ?auto_654398 ?auto_654407 ) ) ( not ( = ?auto_654398 ?auto_654408 ) ) ( not ( = ?auto_654398 ?auto_654409 ) ) ( not ( = ?auto_654398 ?auto_654410 ) ) ( not ( = ?auto_654398 ?auto_654411 ) ) ( not ( = ?auto_654398 ?auto_654412 ) ) ( not ( = ?auto_654399 ?auto_654400 ) ) ( not ( = ?auto_654399 ?auto_654401 ) ) ( not ( = ?auto_654399 ?auto_654402 ) ) ( not ( = ?auto_654399 ?auto_654403 ) ) ( not ( = ?auto_654399 ?auto_654404 ) ) ( not ( = ?auto_654399 ?auto_654405 ) ) ( not ( = ?auto_654399 ?auto_654406 ) ) ( not ( = ?auto_654399 ?auto_654407 ) ) ( not ( = ?auto_654399 ?auto_654408 ) ) ( not ( = ?auto_654399 ?auto_654409 ) ) ( not ( = ?auto_654399 ?auto_654410 ) ) ( not ( = ?auto_654399 ?auto_654411 ) ) ( not ( = ?auto_654399 ?auto_654412 ) ) ( not ( = ?auto_654400 ?auto_654401 ) ) ( not ( = ?auto_654400 ?auto_654402 ) ) ( not ( = ?auto_654400 ?auto_654403 ) ) ( not ( = ?auto_654400 ?auto_654404 ) ) ( not ( = ?auto_654400 ?auto_654405 ) ) ( not ( = ?auto_654400 ?auto_654406 ) ) ( not ( = ?auto_654400 ?auto_654407 ) ) ( not ( = ?auto_654400 ?auto_654408 ) ) ( not ( = ?auto_654400 ?auto_654409 ) ) ( not ( = ?auto_654400 ?auto_654410 ) ) ( not ( = ?auto_654400 ?auto_654411 ) ) ( not ( = ?auto_654400 ?auto_654412 ) ) ( not ( = ?auto_654401 ?auto_654402 ) ) ( not ( = ?auto_654401 ?auto_654403 ) ) ( not ( = ?auto_654401 ?auto_654404 ) ) ( not ( = ?auto_654401 ?auto_654405 ) ) ( not ( = ?auto_654401 ?auto_654406 ) ) ( not ( = ?auto_654401 ?auto_654407 ) ) ( not ( = ?auto_654401 ?auto_654408 ) ) ( not ( = ?auto_654401 ?auto_654409 ) ) ( not ( = ?auto_654401 ?auto_654410 ) ) ( not ( = ?auto_654401 ?auto_654411 ) ) ( not ( = ?auto_654401 ?auto_654412 ) ) ( not ( = ?auto_654402 ?auto_654403 ) ) ( not ( = ?auto_654402 ?auto_654404 ) ) ( not ( = ?auto_654402 ?auto_654405 ) ) ( not ( = ?auto_654402 ?auto_654406 ) ) ( not ( = ?auto_654402 ?auto_654407 ) ) ( not ( = ?auto_654402 ?auto_654408 ) ) ( not ( = ?auto_654402 ?auto_654409 ) ) ( not ( = ?auto_654402 ?auto_654410 ) ) ( not ( = ?auto_654402 ?auto_654411 ) ) ( not ( = ?auto_654402 ?auto_654412 ) ) ( not ( = ?auto_654403 ?auto_654404 ) ) ( not ( = ?auto_654403 ?auto_654405 ) ) ( not ( = ?auto_654403 ?auto_654406 ) ) ( not ( = ?auto_654403 ?auto_654407 ) ) ( not ( = ?auto_654403 ?auto_654408 ) ) ( not ( = ?auto_654403 ?auto_654409 ) ) ( not ( = ?auto_654403 ?auto_654410 ) ) ( not ( = ?auto_654403 ?auto_654411 ) ) ( not ( = ?auto_654403 ?auto_654412 ) ) ( not ( = ?auto_654404 ?auto_654405 ) ) ( not ( = ?auto_654404 ?auto_654406 ) ) ( not ( = ?auto_654404 ?auto_654407 ) ) ( not ( = ?auto_654404 ?auto_654408 ) ) ( not ( = ?auto_654404 ?auto_654409 ) ) ( not ( = ?auto_654404 ?auto_654410 ) ) ( not ( = ?auto_654404 ?auto_654411 ) ) ( not ( = ?auto_654404 ?auto_654412 ) ) ( not ( = ?auto_654405 ?auto_654406 ) ) ( not ( = ?auto_654405 ?auto_654407 ) ) ( not ( = ?auto_654405 ?auto_654408 ) ) ( not ( = ?auto_654405 ?auto_654409 ) ) ( not ( = ?auto_654405 ?auto_654410 ) ) ( not ( = ?auto_654405 ?auto_654411 ) ) ( not ( = ?auto_654405 ?auto_654412 ) ) ( not ( = ?auto_654406 ?auto_654407 ) ) ( not ( = ?auto_654406 ?auto_654408 ) ) ( not ( = ?auto_654406 ?auto_654409 ) ) ( not ( = ?auto_654406 ?auto_654410 ) ) ( not ( = ?auto_654406 ?auto_654411 ) ) ( not ( = ?auto_654406 ?auto_654412 ) ) ( not ( = ?auto_654407 ?auto_654408 ) ) ( not ( = ?auto_654407 ?auto_654409 ) ) ( not ( = ?auto_654407 ?auto_654410 ) ) ( not ( = ?auto_654407 ?auto_654411 ) ) ( not ( = ?auto_654407 ?auto_654412 ) ) ( not ( = ?auto_654408 ?auto_654409 ) ) ( not ( = ?auto_654408 ?auto_654410 ) ) ( not ( = ?auto_654408 ?auto_654411 ) ) ( not ( = ?auto_654408 ?auto_654412 ) ) ( not ( = ?auto_654409 ?auto_654410 ) ) ( not ( = ?auto_654409 ?auto_654411 ) ) ( not ( = ?auto_654409 ?auto_654412 ) ) ( not ( = ?auto_654410 ?auto_654411 ) ) ( not ( = ?auto_654410 ?auto_654412 ) ) ( not ( = ?auto_654411 ?auto_654412 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_654411 ?auto_654412 )
      ( !STACK ?auto_654411 ?auto_654410 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_654459 - BLOCK
      ?auto_654460 - BLOCK
      ?auto_654461 - BLOCK
      ?auto_654462 - BLOCK
      ?auto_654463 - BLOCK
      ?auto_654464 - BLOCK
      ?auto_654465 - BLOCK
      ?auto_654466 - BLOCK
      ?auto_654467 - BLOCK
      ?auto_654468 - BLOCK
      ?auto_654469 - BLOCK
      ?auto_654470 - BLOCK
      ?auto_654471 - BLOCK
      ?auto_654472 - BLOCK
      ?auto_654473 - BLOCK
    )
    :vars
    (
      ?auto_654474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_654473 ?auto_654474 ) ( ON-TABLE ?auto_654459 ) ( ON ?auto_654460 ?auto_654459 ) ( ON ?auto_654461 ?auto_654460 ) ( ON ?auto_654462 ?auto_654461 ) ( ON ?auto_654463 ?auto_654462 ) ( ON ?auto_654464 ?auto_654463 ) ( ON ?auto_654465 ?auto_654464 ) ( ON ?auto_654466 ?auto_654465 ) ( ON ?auto_654467 ?auto_654466 ) ( ON ?auto_654468 ?auto_654467 ) ( ON ?auto_654469 ?auto_654468 ) ( ON ?auto_654470 ?auto_654469 ) ( ON ?auto_654471 ?auto_654470 ) ( not ( = ?auto_654459 ?auto_654460 ) ) ( not ( = ?auto_654459 ?auto_654461 ) ) ( not ( = ?auto_654459 ?auto_654462 ) ) ( not ( = ?auto_654459 ?auto_654463 ) ) ( not ( = ?auto_654459 ?auto_654464 ) ) ( not ( = ?auto_654459 ?auto_654465 ) ) ( not ( = ?auto_654459 ?auto_654466 ) ) ( not ( = ?auto_654459 ?auto_654467 ) ) ( not ( = ?auto_654459 ?auto_654468 ) ) ( not ( = ?auto_654459 ?auto_654469 ) ) ( not ( = ?auto_654459 ?auto_654470 ) ) ( not ( = ?auto_654459 ?auto_654471 ) ) ( not ( = ?auto_654459 ?auto_654472 ) ) ( not ( = ?auto_654459 ?auto_654473 ) ) ( not ( = ?auto_654459 ?auto_654474 ) ) ( not ( = ?auto_654460 ?auto_654461 ) ) ( not ( = ?auto_654460 ?auto_654462 ) ) ( not ( = ?auto_654460 ?auto_654463 ) ) ( not ( = ?auto_654460 ?auto_654464 ) ) ( not ( = ?auto_654460 ?auto_654465 ) ) ( not ( = ?auto_654460 ?auto_654466 ) ) ( not ( = ?auto_654460 ?auto_654467 ) ) ( not ( = ?auto_654460 ?auto_654468 ) ) ( not ( = ?auto_654460 ?auto_654469 ) ) ( not ( = ?auto_654460 ?auto_654470 ) ) ( not ( = ?auto_654460 ?auto_654471 ) ) ( not ( = ?auto_654460 ?auto_654472 ) ) ( not ( = ?auto_654460 ?auto_654473 ) ) ( not ( = ?auto_654460 ?auto_654474 ) ) ( not ( = ?auto_654461 ?auto_654462 ) ) ( not ( = ?auto_654461 ?auto_654463 ) ) ( not ( = ?auto_654461 ?auto_654464 ) ) ( not ( = ?auto_654461 ?auto_654465 ) ) ( not ( = ?auto_654461 ?auto_654466 ) ) ( not ( = ?auto_654461 ?auto_654467 ) ) ( not ( = ?auto_654461 ?auto_654468 ) ) ( not ( = ?auto_654461 ?auto_654469 ) ) ( not ( = ?auto_654461 ?auto_654470 ) ) ( not ( = ?auto_654461 ?auto_654471 ) ) ( not ( = ?auto_654461 ?auto_654472 ) ) ( not ( = ?auto_654461 ?auto_654473 ) ) ( not ( = ?auto_654461 ?auto_654474 ) ) ( not ( = ?auto_654462 ?auto_654463 ) ) ( not ( = ?auto_654462 ?auto_654464 ) ) ( not ( = ?auto_654462 ?auto_654465 ) ) ( not ( = ?auto_654462 ?auto_654466 ) ) ( not ( = ?auto_654462 ?auto_654467 ) ) ( not ( = ?auto_654462 ?auto_654468 ) ) ( not ( = ?auto_654462 ?auto_654469 ) ) ( not ( = ?auto_654462 ?auto_654470 ) ) ( not ( = ?auto_654462 ?auto_654471 ) ) ( not ( = ?auto_654462 ?auto_654472 ) ) ( not ( = ?auto_654462 ?auto_654473 ) ) ( not ( = ?auto_654462 ?auto_654474 ) ) ( not ( = ?auto_654463 ?auto_654464 ) ) ( not ( = ?auto_654463 ?auto_654465 ) ) ( not ( = ?auto_654463 ?auto_654466 ) ) ( not ( = ?auto_654463 ?auto_654467 ) ) ( not ( = ?auto_654463 ?auto_654468 ) ) ( not ( = ?auto_654463 ?auto_654469 ) ) ( not ( = ?auto_654463 ?auto_654470 ) ) ( not ( = ?auto_654463 ?auto_654471 ) ) ( not ( = ?auto_654463 ?auto_654472 ) ) ( not ( = ?auto_654463 ?auto_654473 ) ) ( not ( = ?auto_654463 ?auto_654474 ) ) ( not ( = ?auto_654464 ?auto_654465 ) ) ( not ( = ?auto_654464 ?auto_654466 ) ) ( not ( = ?auto_654464 ?auto_654467 ) ) ( not ( = ?auto_654464 ?auto_654468 ) ) ( not ( = ?auto_654464 ?auto_654469 ) ) ( not ( = ?auto_654464 ?auto_654470 ) ) ( not ( = ?auto_654464 ?auto_654471 ) ) ( not ( = ?auto_654464 ?auto_654472 ) ) ( not ( = ?auto_654464 ?auto_654473 ) ) ( not ( = ?auto_654464 ?auto_654474 ) ) ( not ( = ?auto_654465 ?auto_654466 ) ) ( not ( = ?auto_654465 ?auto_654467 ) ) ( not ( = ?auto_654465 ?auto_654468 ) ) ( not ( = ?auto_654465 ?auto_654469 ) ) ( not ( = ?auto_654465 ?auto_654470 ) ) ( not ( = ?auto_654465 ?auto_654471 ) ) ( not ( = ?auto_654465 ?auto_654472 ) ) ( not ( = ?auto_654465 ?auto_654473 ) ) ( not ( = ?auto_654465 ?auto_654474 ) ) ( not ( = ?auto_654466 ?auto_654467 ) ) ( not ( = ?auto_654466 ?auto_654468 ) ) ( not ( = ?auto_654466 ?auto_654469 ) ) ( not ( = ?auto_654466 ?auto_654470 ) ) ( not ( = ?auto_654466 ?auto_654471 ) ) ( not ( = ?auto_654466 ?auto_654472 ) ) ( not ( = ?auto_654466 ?auto_654473 ) ) ( not ( = ?auto_654466 ?auto_654474 ) ) ( not ( = ?auto_654467 ?auto_654468 ) ) ( not ( = ?auto_654467 ?auto_654469 ) ) ( not ( = ?auto_654467 ?auto_654470 ) ) ( not ( = ?auto_654467 ?auto_654471 ) ) ( not ( = ?auto_654467 ?auto_654472 ) ) ( not ( = ?auto_654467 ?auto_654473 ) ) ( not ( = ?auto_654467 ?auto_654474 ) ) ( not ( = ?auto_654468 ?auto_654469 ) ) ( not ( = ?auto_654468 ?auto_654470 ) ) ( not ( = ?auto_654468 ?auto_654471 ) ) ( not ( = ?auto_654468 ?auto_654472 ) ) ( not ( = ?auto_654468 ?auto_654473 ) ) ( not ( = ?auto_654468 ?auto_654474 ) ) ( not ( = ?auto_654469 ?auto_654470 ) ) ( not ( = ?auto_654469 ?auto_654471 ) ) ( not ( = ?auto_654469 ?auto_654472 ) ) ( not ( = ?auto_654469 ?auto_654473 ) ) ( not ( = ?auto_654469 ?auto_654474 ) ) ( not ( = ?auto_654470 ?auto_654471 ) ) ( not ( = ?auto_654470 ?auto_654472 ) ) ( not ( = ?auto_654470 ?auto_654473 ) ) ( not ( = ?auto_654470 ?auto_654474 ) ) ( not ( = ?auto_654471 ?auto_654472 ) ) ( not ( = ?auto_654471 ?auto_654473 ) ) ( not ( = ?auto_654471 ?auto_654474 ) ) ( not ( = ?auto_654472 ?auto_654473 ) ) ( not ( = ?auto_654472 ?auto_654474 ) ) ( not ( = ?auto_654473 ?auto_654474 ) ) ( CLEAR ?auto_654471 ) ( ON ?auto_654472 ?auto_654473 ) ( CLEAR ?auto_654472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_654459 ?auto_654460 ?auto_654461 ?auto_654462 ?auto_654463 ?auto_654464 ?auto_654465 ?auto_654466 ?auto_654467 ?auto_654468 ?auto_654469 ?auto_654470 ?auto_654471 ?auto_654472 )
      ( MAKE-15PILE ?auto_654459 ?auto_654460 ?auto_654461 ?auto_654462 ?auto_654463 ?auto_654464 ?auto_654465 ?auto_654466 ?auto_654467 ?auto_654468 ?auto_654469 ?auto_654470 ?auto_654471 ?auto_654472 ?auto_654473 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_654521 - BLOCK
      ?auto_654522 - BLOCK
      ?auto_654523 - BLOCK
      ?auto_654524 - BLOCK
      ?auto_654525 - BLOCK
      ?auto_654526 - BLOCK
      ?auto_654527 - BLOCK
      ?auto_654528 - BLOCK
      ?auto_654529 - BLOCK
      ?auto_654530 - BLOCK
      ?auto_654531 - BLOCK
      ?auto_654532 - BLOCK
      ?auto_654533 - BLOCK
      ?auto_654534 - BLOCK
      ?auto_654535 - BLOCK
    )
    :vars
    (
      ?auto_654536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_654535 ?auto_654536 ) ( ON-TABLE ?auto_654521 ) ( ON ?auto_654522 ?auto_654521 ) ( ON ?auto_654523 ?auto_654522 ) ( ON ?auto_654524 ?auto_654523 ) ( ON ?auto_654525 ?auto_654524 ) ( ON ?auto_654526 ?auto_654525 ) ( ON ?auto_654527 ?auto_654526 ) ( ON ?auto_654528 ?auto_654527 ) ( ON ?auto_654529 ?auto_654528 ) ( ON ?auto_654530 ?auto_654529 ) ( ON ?auto_654531 ?auto_654530 ) ( ON ?auto_654532 ?auto_654531 ) ( not ( = ?auto_654521 ?auto_654522 ) ) ( not ( = ?auto_654521 ?auto_654523 ) ) ( not ( = ?auto_654521 ?auto_654524 ) ) ( not ( = ?auto_654521 ?auto_654525 ) ) ( not ( = ?auto_654521 ?auto_654526 ) ) ( not ( = ?auto_654521 ?auto_654527 ) ) ( not ( = ?auto_654521 ?auto_654528 ) ) ( not ( = ?auto_654521 ?auto_654529 ) ) ( not ( = ?auto_654521 ?auto_654530 ) ) ( not ( = ?auto_654521 ?auto_654531 ) ) ( not ( = ?auto_654521 ?auto_654532 ) ) ( not ( = ?auto_654521 ?auto_654533 ) ) ( not ( = ?auto_654521 ?auto_654534 ) ) ( not ( = ?auto_654521 ?auto_654535 ) ) ( not ( = ?auto_654521 ?auto_654536 ) ) ( not ( = ?auto_654522 ?auto_654523 ) ) ( not ( = ?auto_654522 ?auto_654524 ) ) ( not ( = ?auto_654522 ?auto_654525 ) ) ( not ( = ?auto_654522 ?auto_654526 ) ) ( not ( = ?auto_654522 ?auto_654527 ) ) ( not ( = ?auto_654522 ?auto_654528 ) ) ( not ( = ?auto_654522 ?auto_654529 ) ) ( not ( = ?auto_654522 ?auto_654530 ) ) ( not ( = ?auto_654522 ?auto_654531 ) ) ( not ( = ?auto_654522 ?auto_654532 ) ) ( not ( = ?auto_654522 ?auto_654533 ) ) ( not ( = ?auto_654522 ?auto_654534 ) ) ( not ( = ?auto_654522 ?auto_654535 ) ) ( not ( = ?auto_654522 ?auto_654536 ) ) ( not ( = ?auto_654523 ?auto_654524 ) ) ( not ( = ?auto_654523 ?auto_654525 ) ) ( not ( = ?auto_654523 ?auto_654526 ) ) ( not ( = ?auto_654523 ?auto_654527 ) ) ( not ( = ?auto_654523 ?auto_654528 ) ) ( not ( = ?auto_654523 ?auto_654529 ) ) ( not ( = ?auto_654523 ?auto_654530 ) ) ( not ( = ?auto_654523 ?auto_654531 ) ) ( not ( = ?auto_654523 ?auto_654532 ) ) ( not ( = ?auto_654523 ?auto_654533 ) ) ( not ( = ?auto_654523 ?auto_654534 ) ) ( not ( = ?auto_654523 ?auto_654535 ) ) ( not ( = ?auto_654523 ?auto_654536 ) ) ( not ( = ?auto_654524 ?auto_654525 ) ) ( not ( = ?auto_654524 ?auto_654526 ) ) ( not ( = ?auto_654524 ?auto_654527 ) ) ( not ( = ?auto_654524 ?auto_654528 ) ) ( not ( = ?auto_654524 ?auto_654529 ) ) ( not ( = ?auto_654524 ?auto_654530 ) ) ( not ( = ?auto_654524 ?auto_654531 ) ) ( not ( = ?auto_654524 ?auto_654532 ) ) ( not ( = ?auto_654524 ?auto_654533 ) ) ( not ( = ?auto_654524 ?auto_654534 ) ) ( not ( = ?auto_654524 ?auto_654535 ) ) ( not ( = ?auto_654524 ?auto_654536 ) ) ( not ( = ?auto_654525 ?auto_654526 ) ) ( not ( = ?auto_654525 ?auto_654527 ) ) ( not ( = ?auto_654525 ?auto_654528 ) ) ( not ( = ?auto_654525 ?auto_654529 ) ) ( not ( = ?auto_654525 ?auto_654530 ) ) ( not ( = ?auto_654525 ?auto_654531 ) ) ( not ( = ?auto_654525 ?auto_654532 ) ) ( not ( = ?auto_654525 ?auto_654533 ) ) ( not ( = ?auto_654525 ?auto_654534 ) ) ( not ( = ?auto_654525 ?auto_654535 ) ) ( not ( = ?auto_654525 ?auto_654536 ) ) ( not ( = ?auto_654526 ?auto_654527 ) ) ( not ( = ?auto_654526 ?auto_654528 ) ) ( not ( = ?auto_654526 ?auto_654529 ) ) ( not ( = ?auto_654526 ?auto_654530 ) ) ( not ( = ?auto_654526 ?auto_654531 ) ) ( not ( = ?auto_654526 ?auto_654532 ) ) ( not ( = ?auto_654526 ?auto_654533 ) ) ( not ( = ?auto_654526 ?auto_654534 ) ) ( not ( = ?auto_654526 ?auto_654535 ) ) ( not ( = ?auto_654526 ?auto_654536 ) ) ( not ( = ?auto_654527 ?auto_654528 ) ) ( not ( = ?auto_654527 ?auto_654529 ) ) ( not ( = ?auto_654527 ?auto_654530 ) ) ( not ( = ?auto_654527 ?auto_654531 ) ) ( not ( = ?auto_654527 ?auto_654532 ) ) ( not ( = ?auto_654527 ?auto_654533 ) ) ( not ( = ?auto_654527 ?auto_654534 ) ) ( not ( = ?auto_654527 ?auto_654535 ) ) ( not ( = ?auto_654527 ?auto_654536 ) ) ( not ( = ?auto_654528 ?auto_654529 ) ) ( not ( = ?auto_654528 ?auto_654530 ) ) ( not ( = ?auto_654528 ?auto_654531 ) ) ( not ( = ?auto_654528 ?auto_654532 ) ) ( not ( = ?auto_654528 ?auto_654533 ) ) ( not ( = ?auto_654528 ?auto_654534 ) ) ( not ( = ?auto_654528 ?auto_654535 ) ) ( not ( = ?auto_654528 ?auto_654536 ) ) ( not ( = ?auto_654529 ?auto_654530 ) ) ( not ( = ?auto_654529 ?auto_654531 ) ) ( not ( = ?auto_654529 ?auto_654532 ) ) ( not ( = ?auto_654529 ?auto_654533 ) ) ( not ( = ?auto_654529 ?auto_654534 ) ) ( not ( = ?auto_654529 ?auto_654535 ) ) ( not ( = ?auto_654529 ?auto_654536 ) ) ( not ( = ?auto_654530 ?auto_654531 ) ) ( not ( = ?auto_654530 ?auto_654532 ) ) ( not ( = ?auto_654530 ?auto_654533 ) ) ( not ( = ?auto_654530 ?auto_654534 ) ) ( not ( = ?auto_654530 ?auto_654535 ) ) ( not ( = ?auto_654530 ?auto_654536 ) ) ( not ( = ?auto_654531 ?auto_654532 ) ) ( not ( = ?auto_654531 ?auto_654533 ) ) ( not ( = ?auto_654531 ?auto_654534 ) ) ( not ( = ?auto_654531 ?auto_654535 ) ) ( not ( = ?auto_654531 ?auto_654536 ) ) ( not ( = ?auto_654532 ?auto_654533 ) ) ( not ( = ?auto_654532 ?auto_654534 ) ) ( not ( = ?auto_654532 ?auto_654535 ) ) ( not ( = ?auto_654532 ?auto_654536 ) ) ( not ( = ?auto_654533 ?auto_654534 ) ) ( not ( = ?auto_654533 ?auto_654535 ) ) ( not ( = ?auto_654533 ?auto_654536 ) ) ( not ( = ?auto_654534 ?auto_654535 ) ) ( not ( = ?auto_654534 ?auto_654536 ) ) ( not ( = ?auto_654535 ?auto_654536 ) ) ( ON ?auto_654534 ?auto_654535 ) ( CLEAR ?auto_654532 ) ( ON ?auto_654533 ?auto_654534 ) ( CLEAR ?auto_654533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_654521 ?auto_654522 ?auto_654523 ?auto_654524 ?auto_654525 ?auto_654526 ?auto_654527 ?auto_654528 ?auto_654529 ?auto_654530 ?auto_654531 ?auto_654532 ?auto_654533 )
      ( MAKE-15PILE ?auto_654521 ?auto_654522 ?auto_654523 ?auto_654524 ?auto_654525 ?auto_654526 ?auto_654527 ?auto_654528 ?auto_654529 ?auto_654530 ?auto_654531 ?auto_654532 ?auto_654533 ?auto_654534 ?auto_654535 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_654583 - BLOCK
      ?auto_654584 - BLOCK
      ?auto_654585 - BLOCK
      ?auto_654586 - BLOCK
      ?auto_654587 - BLOCK
      ?auto_654588 - BLOCK
      ?auto_654589 - BLOCK
      ?auto_654590 - BLOCK
      ?auto_654591 - BLOCK
      ?auto_654592 - BLOCK
      ?auto_654593 - BLOCK
      ?auto_654594 - BLOCK
      ?auto_654595 - BLOCK
      ?auto_654596 - BLOCK
      ?auto_654597 - BLOCK
    )
    :vars
    (
      ?auto_654598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_654597 ?auto_654598 ) ( ON-TABLE ?auto_654583 ) ( ON ?auto_654584 ?auto_654583 ) ( ON ?auto_654585 ?auto_654584 ) ( ON ?auto_654586 ?auto_654585 ) ( ON ?auto_654587 ?auto_654586 ) ( ON ?auto_654588 ?auto_654587 ) ( ON ?auto_654589 ?auto_654588 ) ( ON ?auto_654590 ?auto_654589 ) ( ON ?auto_654591 ?auto_654590 ) ( ON ?auto_654592 ?auto_654591 ) ( ON ?auto_654593 ?auto_654592 ) ( not ( = ?auto_654583 ?auto_654584 ) ) ( not ( = ?auto_654583 ?auto_654585 ) ) ( not ( = ?auto_654583 ?auto_654586 ) ) ( not ( = ?auto_654583 ?auto_654587 ) ) ( not ( = ?auto_654583 ?auto_654588 ) ) ( not ( = ?auto_654583 ?auto_654589 ) ) ( not ( = ?auto_654583 ?auto_654590 ) ) ( not ( = ?auto_654583 ?auto_654591 ) ) ( not ( = ?auto_654583 ?auto_654592 ) ) ( not ( = ?auto_654583 ?auto_654593 ) ) ( not ( = ?auto_654583 ?auto_654594 ) ) ( not ( = ?auto_654583 ?auto_654595 ) ) ( not ( = ?auto_654583 ?auto_654596 ) ) ( not ( = ?auto_654583 ?auto_654597 ) ) ( not ( = ?auto_654583 ?auto_654598 ) ) ( not ( = ?auto_654584 ?auto_654585 ) ) ( not ( = ?auto_654584 ?auto_654586 ) ) ( not ( = ?auto_654584 ?auto_654587 ) ) ( not ( = ?auto_654584 ?auto_654588 ) ) ( not ( = ?auto_654584 ?auto_654589 ) ) ( not ( = ?auto_654584 ?auto_654590 ) ) ( not ( = ?auto_654584 ?auto_654591 ) ) ( not ( = ?auto_654584 ?auto_654592 ) ) ( not ( = ?auto_654584 ?auto_654593 ) ) ( not ( = ?auto_654584 ?auto_654594 ) ) ( not ( = ?auto_654584 ?auto_654595 ) ) ( not ( = ?auto_654584 ?auto_654596 ) ) ( not ( = ?auto_654584 ?auto_654597 ) ) ( not ( = ?auto_654584 ?auto_654598 ) ) ( not ( = ?auto_654585 ?auto_654586 ) ) ( not ( = ?auto_654585 ?auto_654587 ) ) ( not ( = ?auto_654585 ?auto_654588 ) ) ( not ( = ?auto_654585 ?auto_654589 ) ) ( not ( = ?auto_654585 ?auto_654590 ) ) ( not ( = ?auto_654585 ?auto_654591 ) ) ( not ( = ?auto_654585 ?auto_654592 ) ) ( not ( = ?auto_654585 ?auto_654593 ) ) ( not ( = ?auto_654585 ?auto_654594 ) ) ( not ( = ?auto_654585 ?auto_654595 ) ) ( not ( = ?auto_654585 ?auto_654596 ) ) ( not ( = ?auto_654585 ?auto_654597 ) ) ( not ( = ?auto_654585 ?auto_654598 ) ) ( not ( = ?auto_654586 ?auto_654587 ) ) ( not ( = ?auto_654586 ?auto_654588 ) ) ( not ( = ?auto_654586 ?auto_654589 ) ) ( not ( = ?auto_654586 ?auto_654590 ) ) ( not ( = ?auto_654586 ?auto_654591 ) ) ( not ( = ?auto_654586 ?auto_654592 ) ) ( not ( = ?auto_654586 ?auto_654593 ) ) ( not ( = ?auto_654586 ?auto_654594 ) ) ( not ( = ?auto_654586 ?auto_654595 ) ) ( not ( = ?auto_654586 ?auto_654596 ) ) ( not ( = ?auto_654586 ?auto_654597 ) ) ( not ( = ?auto_654586 ?auto_654598 ) ) ( not ( = ?auto_654587 ?auto_654588 ) ) ( not ( = ?auto_654587 ?auto_654589 ) ) ( not ( = ?auto_654587 ?auto_654590 ) ) ( not ( = ?auto_654587 ?auto_654591 ) ) ( not ( = ?auto_654587 ?auto_654592 ) ) ( not ( = ?auto_654587 ?auto_654593 ) ) ( not ( = ?auto_654587 ?auto_654594 ) ) ( not ( = ?auto_654587 ?auto_654595 ) ) ( not ( = ?auto_654587 ?auto_654596 ) ) ( not ( = ?auto_654587 ?auto_654597 ) ) ( not ( = ?auto_654587 ?auto_654598 ) ) ( not ( = ?auto_654588 ?auto_654589 ) ) ( not ( = ?auto_654588 ?auto_654590 ) ) ( not ( = ?auto_654588 ?auto_654591 ) ) ( not ( = ?auto_654588 ?auto_654592 ) ) ( not ( = ?auto_654588 ?auto_654593 ) ) ( not ( = ?auto_654588 ?auto_654594 ) ) ( not ( = ?auto_654588 ?auto_654595 ) ) ( not ( = ?auto_654588 ?auto_654596 ) ) ( not ( = ?auto_654588 ?auto_654597 ) ) ( not ( = ?auto_654588 ?auto_654598 ) ) ( not ( = ?auto_654589 ?auto_654590 ) ) ( not ( = ?auto_654589 ?auto_654591 ) ) ( not ( = ?auto_654589 ?auto_654592 ) ) ( not ( = ?auto_654589 ?auto_654593 ) ) ( not ( = ?auto_654589 ?auto_654594 ) ) ( not ( = ?auto_654589 ?auto_654595 ) ) ( not ( = ?auto_654589 ?auto_654596 ) ) ( not ( = ?auto_654589 ?auto_654597 ) ) ( not ( = ?auto_654589 ?auto_654598 ) ) ( not ( = ?auto_654590 ?auto_654591 ) ) ( not ( = ?auto_654590 ?auto_654592 ) ) ( not ( = ?auto_654590 ?auto_654593 ) ) ( not ( = ?auto_654590 ?auto_654594 ) ) ( not ( = ?auto_654590 ?auto_654595 ) ) ( not ( = ?auto_654590 ?auto_654596 ) ) ( not ( = ?auto_654590 ?auto_654597 ) ) ( not ( = ?auto_654590 ?auto_654598 ) ) ( not ( = ?auto_654591 ?auto_654592 ) ) ( not ( = ?auto_654591 ?auto_654593 ) ) ( not ( = ?auto_654591 ?auto_654594 ) ) ( not ( = ?auto_654591 ?auto_654595 ) ) ( not ( = ?auto_654591 ?auto_654596 ) ) ( not ( = ?auto_654591 ?auto_654597 ) ) ( not ( = ?auto_654591 ?auto_654598 ) ) ( not ( = ?auto_654592 ?auto_654593 ) ) ( not ( = ?auto_654592 ?auto_654594 ) ) ( not ( = ?auto_654592 ?auto_654595 ) ) ( not ( = ?auto_654592 ?auto_654596 ) ) ( not ( = ?auto_654592 ?auto_654597 ) ) ( not ( = ?auto_654592 ?auto_654598 ) ) ( not ( = ?auto_654593 ?auto_654594 ) ) ( not ( = ?auto_654593 ?auto_654595 ) ) ( not ( = ?auto_654593 ?auto_654596 ) ) ( not ( = ?auto_654593 ?auto_654597 ) ) ( not ( = ?auto_654593 ?auto_654598 ) ) ( not ( = ?auto_654594 ?auto_654595 ) ) ( not ( = ?auto_654594 ?auto_654596 ) ) ( not ( = ?auto_654594 ?auto_654597 ) ) ( not ( = ?auto_654594 ?auto_654598 ) ) ( not ( = ?auto_654595 ?auto_654596 ) ) ( not ( = ?auto_654595 ?auto_654597 ) ) ( not ( = ?auto_654595 ?auto_654598 ) ) ( not ( = ?auto_654596 ?auto_654597 ) ) ( not ( = ?auto_654596 ?auto_654598 ) ) ( not ( = ?auto_654597 ?auto_654598 ) ) ( ON ?auto_654596 ?auto_654597 ) ( ON ?auto_654595 ?auto_654596 ) ( CLEAR ?auto_654593 ) ( ON ?auto_654594 ?auto_654595 ) ( CLEAR ?auto_654594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_654583 ?auto_654584 ?auto_654585 ?auto_654586 ?auto_654587 ?auto_654588 ?auto_654589 ?auto_654590 ?auto_654591 ?auto_654592 ?auto_654593 ?auto_654594 )
      ( MAKE-15PILE ?auto_654583 ?auto_654584 ?auto_654585 ?auto_654586 ?auto_654587 ?auto_654588 ?auto_654589 ?auto_654590 ?auto_654591 ?auto_654592 ?auto_654593 ?auto_654594 ?auto_654595 ?auto_654596 ?auto_654597 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_654645 - BLOCK
      ?auto_654646 - BLOCK
      ?auto_654647 - BLOCK
      ?auto_654648 - BLOCK
      ?auto_654649 - BLOCK
      ?auto_654650 - BLOCK
      ?auto_654651 - BLOCK
      ?auto_654652 - BLOCK
      ?auto_654653 - BLOCK
      ?auto_654654 - BLOCK
      ?auto_654655 - BLOCK
      ?auto_654656 - BLOCK
      ?auto_654657 - BLOCK
      ?auto_654658 - BLOCK
      ?auto_654659 - BLOCK
    )
    :vars
    (
      ?auto_654660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_654659 ?auto_654660 ) ( ON-TABLE ?auto_654645 ) ( ON ?auto_654646 ?auto_654645 ) ( ON ?auto_654647 ?auto_654646 ) ( ON ?auto_654648 ?auto_654647 ) ( ON ?auto_654649 ?auto_654648 ) ( ON ?auto_654650 ?auto_654649 ) ( ON ?auto_654651 ?auto_654650 ) ( ON ?auto_654652 ?auto_654651 ) ( ON ?auto_654653 ?auto_654652 ) ( ON ?auto_654654 ?auto_654653 ) ( not ( = ?auto_654645 ?auto_654646 ) ) ( not ( = ?auto_654645 ?auto_654647 ) ) ( not ( = ?auto_654645 ?auto_654648 ) ) ( not ( = ?auto_654645 ?auto_654649 ) ) ( not ( = ?auto_654645 ?auto_654650 ) ) ( not ( = ?auto_654645 ?auto_654651 ) ) ( not ( = ?auto_654645 ?auto_654652 ) ) ( not ( = ?auto_654645 ?auto_654653 ) ) ( not ( = ?auto_654645 ?auto_654654 ) ) ( not ( = ?auto_654645 ?auto_654655 ) ) ( not ( = ?auto_654645 ?auto_654656 ) ) ( not ( = ?auto_654645 ?auto_654657 ) ) ( not ( = ?auto_654645 ?auto_654658 ) ) ( not ( = ?auto_654645 ?auto_654659 ) ) ( not ( = ?auto_654645 ?auto_654660 ) ) ( not ( = ?auto_654646 ?auto_654647 ) ) ( not ( = ?auto_654646 ?auto_654648 ) ) ( not ( = ?auto_654646 ?auto_654649 ) ) ( not ( = ?auto_654646 ?auto_654650 ) ) ( not ( = ?auto_654646 ?auto_654651 ) ) ( not ( = ?auto_654646 ?auto_654652 ) ) ( not ( = ?auto_654646 ?auto_654653 ) ) ( not ( = ?auto_654646 ?auto_654654 ) ) ( not ( = ?auto_654646 ?auto_654655 ) ) ( not ( = ?auto_654646 ?auto_654656 ) ) ( not ( = ?auto_654646 ?auto_654657 ) ) ( not ( = ?auto_654646 ?auto_654658 ) ) ( not ( = ?auto_654646 ?auto_654659 ) ) ( not ( = ?auto_654646 ?auto_654660 ) ) ( not ( = ?auto_654647 ?auto_654648 ) ) ( not ( = ?auto_654647 ?auto_654649 ) ) ( not ( = ?auto_654647 ?auto_654650 ) ) ( not ( = ?auto_654647 ?auto_654651 ) ) ( not ( = ?auto_654647 ?auto_654652 ) ) ( not ( = ?auto_654647 ?auto_654653 ) ) ( not ( = ?auto_654647 ?auto_654654 ) ) ( not ( = ?auto_654647 ?auto_654655 ) ) ( not ( = ?auto_654647 ?auto_654656 ) ) ( not ( = ?auto_654647 ?auto_654657 ) ) ( not ( = ?auto_654647 ?auto_654658 ) ) ( not ( = ?auto_654647 ?auto_654659 ) ) ( not ( = ?auto_654647 ?auto_654660 ) ) ( not ( = ?auto_654648 ?auto_654649 ) ) ( not ( = ?auto_654648 ?auto_654650 ) ) ( not ( = ?auto_654648 ?auto_654651 ) ) ( not ( = ?auto_654648 ?auto_654652 ) ) ( not ( = ?auto_654648 ?auto_654653 ) ) ( not ( = ?auto_654648 ?auto_654654 ) ) ( not ( = ?auto_654648 ?auto_654655 ) ) ( not ( = ?auto_654648 ?auto_654656 ) ) ( not ( = ?auto_654648 ?auto_654657 ) ) ( not ( = ?auto_654648 ?auto_654658 ) ) ( not ( = ?auto_654648 ?auto_654659 ) ) ( not ( = ?auto_654648 ?auto_654660 ) ) ( not ( = ?auto_654649 ?auto_654650 ) ) ( not ( = ?auto_654649 ?auto_654651 ) ) ( not ( = ?auto_654649 ?auto_654652 ) ) ( not ( = ?auto_654649 ?auto_654653 ) ) ( not ( = ?auto_654649 ?auto_654654 ) ) ( not ( = ?auto_654649 ?auto_654655 ) ) ( not ( = ?auto_654649 ?auto_654656 ) ) ( not ( = ?auto_654649 ?auto_654657 ) ) ( not ( = ?auto_654649 ?auto_654658 ) ) ( not ( = ?auto_654649 ?auto_654659 ) ) ( not ( = ?auto_654649 ?auto_654660 ) ) ( not ( = ?auto_654650 ?auto_654651 ) ) ( not ( = ?auto_654650 ?auto_654652 ) ) ( not ( = ?auto_654650 ?auto_654653 ) ) ( not ( = ?auto_654650 ?auto_654654 ) ) ( not ( = ?auto_654650 ?auto_654655 ) ) ( not ( = ?auto_654650 ?auto_654656 ) ) ( not ( = ?auto_654650 ?auto_654657 ) ) ( not ( = ?auto_654650 ?auto_654658 ) ) ( not ( = ?auto_654650 ?auto_654659 ) ) ( not ( = ?auto_654650 ?auto_654660 ) ) ( not ( = ?auto_654651 ?auto_654652 ) ) ( not ( = ?auto_654651 ?auto_654653 ) ) ( not ( = ?auto_654651 ?auto_654654 ) ) ( not ( = ?auto_654651 ?auto_654655 ) ) ( not ( = ?auto_654651 ?auto_654656 ) ) ( not ( = ?auto_654651 ?auto_654657 ) ) ( not ( = ?auto_654651 ?auto_654658 ) ) ( not ( = ?auto_654651 ?auto_654659 ) ) ( not ( = ?auto_654651 ?auto_654660 ) ) ( not ( = ?auto_654652 ?auto_654653 ) ) ( not ( = ?auto_654652 ?auto_654654 ) ) ( not ( = ?auto_654652 ?auto_654655 ) ) ( not ( = ?auto_654652 ?auto_654656 ) ) ( not ( = ?auto_654652 ?auto_654657 ) ) ( not ( = ?auto_654652 ?auto_654658 ) ) ( not ( = ?auto_654652 ?auto_654659 ) ) ( not ( = ?auto_654652 ?auto_654660 ) ) ( not ( = ?auto_654653 ?auto_654654 ) ) ( not ( = ?auto_654653 ?auto_654655 ) ) ( not ( = ?auto_654653 ?auto_654656 ) ) ( not ( = ?auto_654653 ?auto_654657 ) ) ( not ( = ?auto_654653 ?auto_654658 ) ) ( not ( = ?auto_654653 ?auto_654659 ) ) ( not ( = ?auto_654653 ?auto_654660 ) ) ( not ( = ?auto_654654 ?auto_654655 ) ) ( not ( = ?auto_654654 ?auto_654656 ) ) ( not ( = ?auto_654654 ?auto_654657 ) ) ( not ( = ?auto_654654 ?auto_654658 ) ) ( not ( = ?auto_654654 ?auto_654659 ) ) ( not ( = ?auto_654654 ?auto_654660 ) ) ( not ( = ?auto_654655 ?auto_654656 ) ) ( not ( = ?auto_654655 ?auto_654657 ) ) ( not ( = ?auto_654655 ?auto_654658 ) ) ( not ( = ?auto_654655 ?auto_654659 ) ) ( not ( = ?auto_654655 ?auto_654660 ) ) ( not ( = ?auto_654656 ?auto_654657 ) ) ( not ( = ?auto_654656 ?auto_654658 ) ) ( not ( = ?auto_654656 ?auto_654659 ) ) ( not ( = ?auto_654656 ?auto_654660 ) ) ( not ( = ?auto_654657 ?auto_654658 ) ) ( not ( = ?auto_654657 ?auto_654659 ) ) ( not ( = ?auto_654657 ?auto_654660 ) ) ( not ( = ?auto_654658 ?auto_654659 ) ) ( not ( = ?auto_654658 ?auto_654660 ) ) ( not ( = ?auto_654659 ?auto_654660 ) ) ( ON ?auto_654658 ?auto_654659 ) ( ON ?auto_654657 ?auto_654658 ) ( ON ?auto_654656 ?auto_654657 ) ( CLEAR ?auto_654654 ) ( ON ?auto_654655 ?auto_654656 ) ( CLEAR ?auto_654655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_654645 ?auto_654646 ?auto_654647 ?auto_654648 ?auto_654649 ?auto_654650 ?auto_654651 ?auto_654652 ?auto_654653 ?auto_654654 ?auto_654655 )
      ( MAKE-15PILE ?auto_654645 ?auto_654646 ?auto_654647 ?auto_654648 ?auto_654649 ?auto_654650 ?auto_654651 ?auto_654652 ?auto_654653 ?auto_654654 ?auto_654655 ?auto_654656 ?auto_654657 ?auto_654658 ?auto_654659 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_654707 - BLOCK
      ?auto_654708 - BLOCK
      ?auto_654709 - BLOCK
      ?auto_654710 - BLOCK
      ?auto_654711 - BLOCK
      ?auto_654712 - BLOCK
      ?auto_654713 - BLOCK
      ?auto_654714 - BLOCK
      ?auto_654715 - BLOCK
      ?auto_654716 - BLOCK
      ?auto_654717 - BLOCK
      ?auto_654718 - BLOCK
      ?auto_654719 - BLOCK
      ?auto_654720 - BLOCK
      ?auto_654721 - BLOCK
    )
    :vars
    (
      ?auto_654722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_654721 ?auto_654722 ) ( ON-TABLE ?auto_654707 ) ( ON ?auto_654708 ?auto_654707 ) ( ON ?auto_654709 ?auto_654708 ) ( ON ?auto_654710 ?auto_654709 ) ( ON ?auto_654711 ?auto_654710 ) ( ON ?auto_654712 ?auto_654711 ) ( ON ?auto_654713 ?auto_654712 ) ( ON ?auto_654714 ?auto_654713 ) ( ON ?auto_654715 ?auto_654714 ) ( not ( = ?auto_654707 ?auto_654708 ) ) ( not ( = ?auto_654707 ?auto_654709 ) ) ( not ( = ?auto_654707 ?auto_654710 ) ) ( not ( = ?auto_654707 ?auto_654711 ) ) ( not ( = ?auto_654707 ?auto_654712 ) ) ( not ( = ?auto_654707 ?auto_654713 ) ) ( not ( = ?auto_654707 ?auto_654714 ) ) ( not ( = ?auto_654707 ?auto_654715 ) ) ( not ( = ?auto_654707 ?auto_654716 ) ) ( not ( = ?auto_654707 ?auto_654717 ) ) ( not ( = ?auto_654707 ?auto_654718 ) ) ( not ( = ?auto_654707 ?auto_654719 ) ) ( not ( = ?auto_654707 ?auto_654720 ) ) ( not ( = ?auto_654707 ?auto_654721 ) ) ( not ( = ?auto_654707 ?auto_654722 ) ) ( not ( = ?auto_654708 ?auto_654709 ) ) ( not ( = ?auto_654708 ?auto_654710 ) ) ( not ( = ?auto_654708 ?auto_654711 ) ) ( not ( = ?auto_654708 ?auto_654712 ) ) ( not ( = ?auto_654708 ?auto_654713 ) ) ( not ( = ?auto_654708 ?auto_654714 ) ) ( not ( = ?auto_654708 ?auto_654715 ) ) ( not ( = ?auto_654708 ?auto_654716 ) ) ( not ( = ?auto_654708 ?auto_654717 ) ) ( not ( = ?auto_654708 ?auto_654718 ) ) ( not ( = ?auto_654708 ?auto_654719 ) ) ( not ( = ?auto_654708 ?auto_654720 ) ) ( not ( = ?auto_654708 ?auto_654721 ) ) ( not ( = ?auto_654708 ?auto_654722 ) ) ( not ( = ?auto_654709 ?auto_654710 ) ) ( not ( = ?auto_654709 ?auto_654711 ) ) ( not ( = ?auto_654709 ?auto_654712 ) ) ( not ( = ?auto_654709 ?auto_654713 ) ) ( not ( = ?auto_654709 ?auto_654714 ) ) ( not ( = ?auto_654709 ?auto_654715 ) ) ( not ( = ?auto_654709 ?auto_654716 ) ) ( not ( = ?auto_654709 ?auto_654717 ) ) ( not ( = ?auto_654709 ?auto_654718 ) ) ( not ( = ?auto_654709 ?auto_654719 ) ) ( not ( = ?auto_654709 ?auto_654720 ) ) ( not ( = ?auto_654709 ?auto_654721 ) ) ( not ( = ?auto_654709 ?auto_654722 ) ) ( not ( = ?auto_654710 ?auto_654711 ) ) ( not ( = ?auto_654710 ?auto_654712 ) ) ( not ( = ?auto_654710 ?auto_654713 ) ) ( not ( = ?auto_654710 ?auto_654714 ) ) ( not ( = ?auto_654710 ?auto_654715 ) ) ( not ( = ?auto_654710 ?auto_654716 ) ) ( not ( = ?auto_654710 ?auto_654717 ) ) ( not ( = ?auto_654710 ?auto_654718 ) ) ( not ( = ?auto_654710 ?auto_654719 ) ) ( not ( = ?auto_654710 ?auto_654720 ) ) ( not ( = ?auto_654710 ?auto_654721 ) ) ( not ( = ?auto_654710 ?auto_654722 ) ) ( not ( = ?auto_654711 ?auto_654712 ) ) ( not ( = ?auto_654711 ?auto_654713 ) ) ( not ( = ?auto_654711 ?auto_654714 ) ) ( not ( = ?auto_654711 ?auto_654715 ) ) ( not ( = ?auto_654711 ?auto_654716 ) ) ( not ( = ?auto_654711 ?auto_654717 ) ) ( not ( = ?auto_654711 ?auto_654718 ) ) ( not ( = ?auto_654711 ?auto_654719 ) ) ( not ( = ?auto_654711 ?auto_654720 ) ) ( not ( = ?auto_654711 ?auto_654721 ) ) ( not ( = ?auto_654711 ?auto_654722 ) ) ( not ( = ?auto_654712 ?auto_654713 ) ) ( not ( = ?auto_654712 ?auto_654714 ) ) ( not ( = ?auto_654712 ?auto_654715 ) ) ( not ( = ?auto_654712 ?auto_654716 ) ) ( not ( = ?auto_654712 ?auto_654717 ) ) ( not ( = ?auto_654712 ?auto_654718 ) ) ( not ( = ?auto_654712 ?auto_654719 ) ) ( not ( = ?auto_654712 ?auto_654720 ) ) ( not ( = ?auto_654712 ?auto_654721 ) ) ( not ( = ?auto_654712 ?auto_654722 ) ) ( not ( = ?auto_654713 ?auto_654714 ) ) ( not ( = ?auto_654713 ?auto_654715 ) ) ( not ( = ?auto_654713 ?auto_654716 ) ) ( not ( = ?auto_654713 ?auto_654717 ) ) ( not ( = ?auto_654713 ?auto_654718 ) ) ( not ( = ?auto_654713 ?auto_654719 ) ) ( not ( = ?auto_654713 ?auto_654720 ) ) ( not ( = ?auto_654713 ?auto_654721 ) ) ( not ( = ?auto_654713 ?auto_654722 ) ) ( not ( = ?auto_654714 ?auto_654715 ) ) ( not ( = ?auto_654714 ?auto_654716 ) ) ( not ( = ?auto_654714 ?auto_654717 ) ) ( not ( = ?auto_654714 ?auto_654718 ) ) ( not ( = ?auto_654714 ?auto_654719 ) ) ( not ( = ?auto_654714 ?auto_654720 ) ) ( not ( = ?auto_654714 ?auto_654721 ) ) ( not ( = ?auto_654714 ?auto_654722 ) ) ( not ( = ?auto_654715 ?auto_654716 ) ) ( not ( = ?auto_654715 ?auto_654717 ) ) ( not ( = ?auto_654715 ?auto_654718 ) ) ( not ( = ?auto_654715 ?auto_654719 ) ) ( not ( = ?auto_654715 ?auto_654720 ) ) ( not ( = ?auto_654715 ?auto_654721 ) ) ( not ( = ?auto_654715 ?auto_654722 ) ) ( not ( = ?auto_654716 ?auto_654717 ) ) ( not ( = ?auto_654716 ?auto_654718 ) ) ( not ( = ?auto_654716 ?auto_654719 ) ) ( not ( = ?auto_654716 ?auto_654720 ) ) ( not ( = ?auto_654716 ?auto_654721 ) ) ( not ( = ?auto_654716 ?auto_654722 ) ) ( not ( = ?auto_654717 ?auto_654718 ) ) ( not ( = ?auto_654717 ?auto_654719 ) ) ( not ( = ?auto_654717 ?auto_654720 ) ) ( not ( = ?auto_654717 ?auto_654721 ) ) ( not ( = ?auto_654717 ?auto_654722 ) ) ( not ( = ?auto_654718 ?auto_654719 ) ) ( not ( = ?auto_654718 ?auto_654720 ) ) ( not ( = ?auto_654718 ?auto_654721 ) ) ( not ( = ?auto_654718 ?auto_654722 ) ) ( not ( = ?auto_654719 ?auto_654720 ) ) ( not ( = ?auto_654719 ?auto_654721 ) ) ( not ( = ?auto_654719 ?auto_654722 ) ) ( not ( = ?auto_654720 ?auto_654721 ) ) ( not ( = ?auto_654720 ?auto_654722 ) ) ( not ( = ?auto_654721 ?auto_654722 ) ) ( ON ?auto_654720 ?auto_654721 ) ( ON ?auto_654719 ?auto_654720 ) ( ON ?auto_654718 ?auto_654719 ) ( ON ?auto_654717 ?auto_654718 ) ( CLEAR ?auto_654715 ) ( ON ?auto_654716 ?auto_654717 ) ( CLEAR ?auto_654716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_654707 ?auto_654708 ?auto_654709 ?auto_654710 ?auto_654711 ?auto_654712 ?auto_654713 ?auto_654714 ?auto_654715 ?auto_654716 )
      ( MAKE-15PILE ?auto_654707 ?auto_654708 ?auto_654709 ?auto_654710 ?auto_654711 ?auto_654712 ?auto_654713 ?auto_654714 ?auto_654715 ?auto_654716 ?auto_654717 ?auto_654718 ?auto_654719 ?auto_654720 ?auto_654721 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_654769 - BLOCK
      ?auto_654770 - BLOCK
      ?auto_654771 - BLOCK
      ?auto_654772 - BLOCK
      ?auto_654773 - BLOCK
      ?auto_654774 - BLOCK
      ?auto_654775 - BLOCK
      ?auto_654776 - BLOCK
      ?auto_654777 - BLOCK
      ?auto_654778 - BLOCK
      ?auto_654779 - BLOCK
      ?auto_654780 - BLOCK
      ?auto_654781 - BLOCK
      ?auto_654782 - BLOCK
      ?auto_654783 - BLOCK
    )
    :vars
    (
      ?auto_654784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_654783 ?auto_654784 ) ( ON-TABLE ?auto_654769 ) ( ON ?auto_654770 ?auto_654769 ) ( ON ?auto_654771 ?auto_654770 ) ( ON ?auto_654772 ?auto_654771 ) ( ON ?auto_654773 ?auto_654772 ) ( ON ?auto_654774 ?auto_654773 ) ( ON ?auto_654775 ?auto_654774 ) ( ON ?auto_654776 ?auto_654775 ) ( not ( = ?auto_654769 ?auto_654770 ) ) ( not ( = ?auto_654769 ?auto_654771 ) ) ( not ( = ?auto_654769 ?auto_654772 ) ) ( not ( = ?auto_654769 ?auto_654773 ) ) ( not ( = ?auto_654769 ?auto_654774 ) ) ( not ( = ?auto_654769 ?auto_654775 ) ) ( not ( = ?auto_654769 ?auto_654776 ) ) ( not ( = ?auto_654769 ?auto_654777 ) ) ( not ( = ?auto_654769 ?auto_654778 ) ) ( not ( = ?auto_654769 ?auto_654779 ) ) ( not ( = ?auto_654769 ?auto_654780 ) ) ( not ( = ?auto_654769 ?auto_654781 ) ) ( not ( = ?auto_654769 ?auto_654782 ) ) ( not ( = ?auto_654769 ?auto_654783 ) ) ( not ( = ?auto_654769 ?auto_654784 ) ) ( not ( = ?auto_654770 ?auto_654771 ) ) ( not ( = ?auto_654770 ?auto_654772 ) ) ( not ( = ?auto_654770 ?auto_654773 ) ) ( not ( = ?auto_654770 ?auto_654774 ) ) ( not ( = ?auto_654770 ?auto_654775 ) ) ( not ( = ?auto_654770 ?auto_654776 ) ) ( not ( = ?auto_654770 ?auto_654777 ) ) ( not ( = ?auto_654770 ?auto_654778 ) ) ( not ( = ?auto_654770 ?auto_654779 ) ) ( not ( = ?auto_654770 ?auto_654780 ) ) ( not ( = ?auto_654770 ?auto_654781 ) ) ( not ( = ?auto_654770 ?auto_654782 ) ) ( not ( = ?auto_654770 ?auto_654783 ) ) ( not ( = ?auto_654770 ?auto_654784 ) ) ( not ( = ?auto_654771 ?auto_654772 ) ) ( not ( = ?auto_654771 ?auto_654773 ) ) ( not ( = ?auto_654771 ?auto_654774 ) ) ( not ( = ?auto_654771 ?auto_654775 ) ) ( not ( = ?auto_654771 ?auto_654776 ) ) ( not ( = ?auto_654771 ?auto_654777 ) ) ( not ( = ?auto_654771 ?auto_654778 ) ) ( not ( = ?auto_654771 ?auto_654779 ) ) ( not ( = ?auto_654771 ?auto_654780 ) ) ( not ( = ?auto_654771 ?auto_654781 ) ) ( not ( = ?auto_654771 ?auto_654782 ) ) ( not ( = ?auto_654771 ?auto_654783 ) ) ( not ( = ?auto_654771 ?auto_654784 ) ) ( not ( = ?auto_654772 ?auto_654773 ) ) ( not ( = ?auto_654772 ?auto_654774 ) ) ( not ( = ?auto_654772 ?auto_654775 ) ) ( not ( = ?auto_654772 ?auto_654776 ) ) ( not ( = ?auto_654772 ?auto_654777 ) ) ( not ( = ?auto_654772 ?auto_654778 ) ) ( not ( = ?auto_654772 ?auto_654779 ) ) ( not ( = ?auto_654772 ?auto_654780 ) ) ( not ( = ?auto_654772 ?auto_654781 ) ) ( not ( = ?auto_654772 ?auto_654782 ) ) ( not ( = ?auto_654772 ?auto_654783 ) ) ( not ( = ?auto_654772 ?auto_654784 ) ) ( not ( = ?auto_654773 ?auto_654774 ) ) ( not ( = ?auto_654773 ?auto_654775 ) ) ( not ( = ?auto_654773 ?auto_654776 ) ) ( not ( = ?auto_654773 ?auto_654777 ) ) ( not ( = ?auto_654773 ?auto_654778 ) ) ( not ( = ?auto_654773 ?auto_654779 ) ) ( not ( = ?auto_654773 ?auto_654780 ) ) ( not ( = ?auto_654773 ?auto_654781 ) ) ( not ( = ?auto_654773 ?auto_654782 ) ) ( not ( = ?auto_654773 ?auto_654783 ) ) ( not ( = ?auto_654773 ?auto_654784 ) ) ( not ( = ?auto_654774 ?auto_654775 ) ) ( not ( = ?auto_654774 ?auto_654776 ) ) ( not ( = ?auto_654774 ?auto_654777 ) ) ( not ( = ?auto_654774 ?auto_654778 ) ) ( not ( = ?auto_654774 ?auto_654779 ) ) ( not ( = ?auto_654774 ?auto_654780 ) ) ( not ( = ?auto_654774 ?auto_654781 ) ) ( not ( = ?auto_654774 ?auto_654782 ) ) ( not ( = ?auto_654774 ?auto_654783 ) ) ( not ( = ?auto_654774 ?auto_654784 ) ) ( not ( = ?auto_654775 ?auto_654776 ) ) ( not ( = ?auto_654775 ?auto_654777 ) ) ( not ( = ?auto_654775 ?auto_654778 ) ) ( not ( = ?auto_654775 ?auto_654779 ) ) ( not ( = ?auto_654775 ?auto_654780 ) ) ( not ( = ?auto_654775 ?auto_654781 ) ) ( not ( = ?auto_654775 ?auto_654782 ) ) ( not ( = ?auto_654775 ?auto_654783 ) ) ( not ( = ?auto_654775 ?auto_654784 ) ) ( not ( = ?auto_654776 ?auto_654777 ) ) ( not ( = ?auto_654776 ?auto_654778 ) ) ( not ( = ?auto_654776 ?auto_654779 ) ) ( not ( = ?auto_654776 ?auto_654780 ) ) ( not ( = ?auto_654776 ?auto_654781 ) ) ( not ( = ?auto_654776 ?auto_654782 ) ) ( not ( = ?auto_654776 ?auto_654783 ) ) ( not ( = ?auto_654776 ?auto_654784 ) ) ( not ( = ?auto_654777 ?auto_654778 ) ) ( not ( = ?auto_654777 ?auto_654779 ) ) ( not ( = ?auto_654777 ?auto_654780 ) ) ( not ( = ?auto_654777 ?auto_654781 ) ) ( not ( = ?auto_654777 ?auto_654782 ) ) ( not ( = ?auto_654777 ?auto_654783 ) ) ( not ( = ?auto_654777 ?auto_654784 ) ) ( not ( = ?auto_654778 ?auto_654779 ) ) ( not ( = ?auto_654778 ?auto_654780 ) ) ( not ( = ?auto_654778 ?auto_654781 ) ) ( not ( = ?auto_654778 ?auto_654782 ) ) ( not ( = ?auto_654778 ?auto_654783 ) ) ( not ( = ?auto_654778 ?auto_654784 ) ) ( not ( = ?auto_654779 ?auto_654780 ) ) ( not ( = ?auto_654779 ?auto_654781 ) ) ( not ( = ?auto_654779 ?auto_654782 ) ) ( not ( = ?auto_654779 ?auto_654783 ) ) ( not ( = ?auto_654779 ?auto_654784 ) ) ( not ( = ?auto_654780 ?auto_654781 ) ) ( not ( = ?auto_654780 ?auto_654782 ) ) ( not ( = ?auto_654780 ?auto_654783 ) ) ( not ( = ?auto_654780 ?auto_654784 ) ) ( not ( = ?auto_654781 ?auto_654782 ) ) ( not ( = ?auto_654781 ?auto_654783 ) ) ( not ( = ?auto_654781 ?auto_654784 ) ) ( not ( = ?auto_654782 ?auto_654783 ) ) ( not ( = ?auto_654782 ?auto_654784 ) ) ( not ( = ?auto_654783 ?auto_654784 ) ) ( ON ?auto_654782 ?auto_654783 ) ( ON ?auto_654781 ?auto_654782 ) ( ON ?auto_654780 ?auto_654781 ) ( ON ?auto_654779 ?auto_654780 ) ( ON ?auto_654778 ?auto_654779 ) ( CLEAR ?auto_654776 ) ( ON ?auto_654777 ?auto_654778 ) ( CLEAR ?auto_654777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_654769 ?auto_654770 ?auto_654771 ?auto_654772 ?auto_654773 ?auto_654774 ?auto_654775 ?auto_654776 ?auto_654777 )
      ( MAKE-15PILE ?auto_654769 ?auto_654770 ?auto_654771 ?auto_654772 ?auto_654773 ?auto_654774 ?auto_654775 ?auto_654776 ?auto_654777 ?auto_654778 ?auto_654779 ?auto_654780 ?auto_654781 ?auto_654782 ?auto_654783 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_654831 - BLOCK
      ?auto_654832 - BLOCK
      ?auto_654833 - BLOCK
      ?auto_654834 - BLOCK
      ?auto_654835 - BLOCK
      ?auto_654836 - BLOCK
      ?auto_654837 - BLOCK
      ?auto_654838 - BLOCK
      ?auto_654839 - BLOCK
      ?auto_654840 - BLOCK
      ?auto_654841 - BLOCK
      ?auto_654842 - BLOCK
      ?auto_654843 - BLOCK
      ?auto_654844 - BLOCK
      ?auto_654845 - BLOCK
    )
    :vars
    (
      ?auto_654846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_654845 ?auto_654846 ) ( ON-TABLE ?auto_654831 ) ( ON ?auto_654832 ?auto_654831 ) ( ON ?auto_654833 ?auto_654832 ) ( ON ?auto_654834 ?auto_654833 ) ( ON ?auto_654835 ?auto_654834 ) ( ON ?auto_654836 ?auto_654835 ) ( ON ?auto_654837 ?auto_654836 ) ( not ( = ?auto_654831 ?auto_654832 ) ) ( not ( = ?auto_654831 ?auto_654833 ) ) ( not ( = ?auto_654831 ?auto_654834 ) ) ( not ( = ?auto_654831 ?auto_654835 ) ) ( not ( = ?auto_654831 ?auto_654836 ) ) ( not ( = ?auto_654831 ?auto_654837 ) ) ( not ( = ?auto_654831 ?auto_654838 ) ) ( not ( = ?auto_654831 ?auto_654839 ) ) ( not ( = ?auto_654831 ?auto_654840 ) ) ( not ( = ?auto_654831 ?auto_654841 ) ) ( not ( = ?auto_654831 ?auto_654842 ) ) ( not ( = ?auto_654831 ?auto_654843 ) ) ( not ( = ?auto_654831 ?auto_654844 ) ) ( not ( = ?auto_654831 ?auto_654845 ) ) ( not ( = ?auto_654831 ?auto_654846 ) ) ( not ( = ?auto_654832 ?auto_654833 ) ) ( not ( = ?auto_654832 ?auto_654834 ) ) ( not ( = ?auto_654832 ?auto_654835 ) ) ( not ( = ?auto_654832 ?auto_654836 ) ) ( not ( = ?auto_654832 ?auto_654837 ) ) ( not ( = ?auto_654832 ?auto_654838 ) ) ( not ( = ?auto_654832 ?auto_654839 ) ) ( not ( = ?auto_654832 ?auto_654840 ) ) ( not ( = ?auto_654832 ?auto_654841 ) ) ( not ( = ?auto_654832 ?auto_654842 ) ) ( not ( = ?auto_654832 ?auto_654843 ) ) ( not ( = ?auto_654832 ?auto_654844 ) ) ( not ( = ?auto_654832 ?auto_654845 ) ) ( not ( = ?auto_654832 ?auto_654846 ) ) ( not ( = ?auto_654833 ?auto_654834 ) ) ( not ( = ?auto_654833 ?auto_654835 ) ) ( not ( = ?auto_654833 ?auto_654836 ) ) ( not ( = ?auto_654833 ?auto_654837 ) ) ( not ( = ?auto_654833 ?auto_654838 ) ) ( not ( = ?auto_654833 ?auto_654839 ) ) ( not ( = ?auto_654833 ?auto_654840 ) ) ( not ( = ?auto_654833 ?auto_654841 ) ) ( not ( = ?auto_654833 ?auto_654842 ) ) ( not ( = ?auto_654833 ?auto_654843 ) ) ( not ( = ?auto_654833 ?auto_654844 ) ) ( not ( = ?auto_654833 ?auto_654845 ) ) ( not ( = ?auto_654833 ?auto_654846 ) ) ( not ( = ?auto_654834 ?auto_654835 ) ) ( not ( = ?auto_654834 ?auto_654836 ) ) ( not ( = ?auto_654834 ?auto_654837 ) ) ( not ( = ?auto_654834 ?auto_654838 ) ) ( not ( = ?auto_654834 ?auto_654839 ) ) ( not ( = ?auto_654834 ?auto_654840 ) ) ( not ( = ?auto_654834 ?auto_654841 ) ) ( not ( = ?auto_654834 ?auto_654842 ) ) ( not ( = ?auto_654834 ?auto_654843 ) ) ( not ( = ?auto_654834 ?auto_654844 ) ) ( not ( = ?auto_654834 ?auto_654845 ) ) ( not ( = ?auto_654834 ?auto_654846 ) ) ( not ( = ?auto_654835 ?auto_654836 ) ) ( not ( = ?auto_654835 ?auto_654837 ) ) ( not ( = ?auto_654835 ?auto_654838 ) ) ( not ( = ?auto_654835 ?auto_654839 ) ) ( not ( = ?auto_654835 ?auto_654840 ) ) ( not ( = ?auto_654835 ?auto_654841 ) ) ( not ( = ?auto_654835 ?auto_654842 ) ) ( not ( = ?auto_654835 ?auto_654843 ) ) ( not ( = ?auto_654835 ?auto_654844 ) ) ( not ( = ?auto_654835 ?auto_654845 ) ) ( not ( = ?auto_654835 ?auto_654846 ) ) ( not ( = ?auto_654836 ?auto_654837 ) ) ( not ( = ?auto_654836 ?auto_654838 ) ) ( not ( = ?auto_654836 ?auto_654839 ) ) ( not ( = ?auto_654836 ?auto_654840 ) ) ( not ( = ?auto_654836 ?auto_654841 ) ) ( not ( = ?auto_654836 ?auto_654842 ) ) ( not ( = ?auto_654836 ?auto_654843 ) ) ( not ( = ?auto_654836 ?auto_654844 ) ) ( not ( = ?auto_654836 ?auto_654845 ) ) ( not ( = ?auto_654836 ?auto_654846 ) ) ( not ( = ?auto_654837 ?auto_654838 ) ) ( not ( = ?auto_654837 ?auto_654839 ) ) ( not ( = ?auto_654837 ?auto_654840 ) ) ( not ( = ?auto_654837 ?auto_654841 ) ) ( not ( = ?auto_654837 ?auto_654842 ) ) ( not ( = ?auto_654837 ?auto_654843 ) ) ( not ( = ?auto_654837 ?auto_654844 ) ) ( not ( = ?auto_654837 ?auto_654845 ) ) ( not ( = ?auto_654837 ?auto_654846 ) ) ( not ( = ?auto_654838 ?auto_654839 ) ) ( not ( = ?auto_654838 ?auto_654840 ) ) ( not ( = ?auto_654838 ?auto_654841 ) ) ( not ( = ?auto_654838 ?auto_654842 ) ) ( not ( = ?auto_654838 ?auto_654843 ) ) ( not ( = ?auto_654838 ?auto_654844 ) ) ( not ( = ?auto_654838 ?auto_654845 ) ) ( not ( = ?auto_654838 ?auto_654846 ) ) ( not ( = ?auto_654839 ?auto_654840 ) ) ( not ( = ?auto_654839 ?auto_654841 ) ) ( not ( = ?auto_654839 ?auto_654842 ) ) ( not ( = ?auto_654839 ?auto_654843 ) ) ( not ( = ?auto_654839 ?auto_654844 ) ) ( not ( = ?auto_654839 ?auto_654845 ) ) ( not ( = ?auto_654839 ?auto_654846 ) ) ( not ( = ?auto_654840 ?auto_654841 ) ) ( not ( = ?auto_654840 ?auto_654842 ) ) ( not ( = ?auto_654840 ?auto_654843 ) ) ( not ( = ?auto_654840 ?auto_654844 ) ) ( not ( = ?auto_654840 ?auto_654845 ) ) ( not ( = ?auto_654840 ?auto_654846 ) ) ( not ( = ?auto_654841 ?auto_654842 ) ) ( not ( = ?auto_654841 ?auto_654843 ) ) ( not ( = ?auto_654841 ?auto_654844 ) ) ( not ( = ?auto_654841 ?auto_654845 ) ) ( not ( = ?auto_654841 ?auto_654846 ) ) ( not ( = ?auto_654842 ?auto_654843 ) ) ( not ( = ?auto_654842 ?auto_654844 ) ) ( not ( = ?auto_654842 ?auto_654845 ) ) ( not ( = ?auto_654842 ?auto_654846 ) ) ( not ( = ?auto_654843 ?auto_654844 ) ) ( not ( = ?auto_654843 ?auto_654845 ) ) ( not ( = ?auto_654843 ?auto_654846 ) ) ( not ( = ?auto_654844 ?auto_654845 ) ) ( not ( = ?auto_654844 ?auto_654846 ) ) ( not ( = ?auto_654845 ?auto_654846 ) ) ( ON ?auto_654844 ?auto_654845 ) ( ON ?auto_654843 ?auto_654844 ) ( ON ?auto_654842 ?auto_654843 ) ( ON ?auto_654841 ?auto_654842 ) ( ON ?auto_654840 ?auto_654841 ) ( ON ?auto_654839 ?auto_654840 ) ( CLEAR ?auto_654837 ) ( ON ?auto_654838 ?auto_654839 ) ( CLEAR ?auto_654838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_654831 ?auto_654832 ?auto_654833 ?auto_654834 ?auto_654835 ?auto_654836 ?auto_654837 ?auto_654838 )
      ( MAKE-15PILE ?auto_654831 ?auto_654832 ?auto_654833 ?auto_654834 ?auto_654835 ?auto_654836 ?auto_654837 ?auto_654838 ?auto_654839 ?auto_654840 ?auto_654841 ?auto_654842 ?auto_654843 ?auto_654844 ?auto_654845 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_654893 - BLOCK
      ?auto_654894 - BLOCK
      ?auto_654895 - BLOCK
      ?auto_654896 - BLOCK
      ?auto_654897 - BLOCK
      ?auto_654898 - BLOCK
      ?auto_654899 - BLOCK
      ?auto_654900 - BLOCK
      ?auto_654901 - BLOCK
      ?auto_654902 - BLOCK
      ?auto_654903 - BLOCK
      ?auto_654904 - BLOCK
      ?auto_654905 - BLOCK
      ?auto_654906 - BLOCK
      ?auto_654907 - BLOCK
    )
    :vars
    (
      ?auto_654908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_654907 ?auto_654908 ) ( ON-TABLE ?auto_654893 ) ( ON ?auto_654894 ?auto_654893 ) ( ON ?auto_654895 ?auto_654894 ) ( ON ?auto_654896 ?auto_654895 ) ( ON ?auto_654897 ?auto_654896 ) ( ON ?auto_654898 ?auto_654897 ) ( not ( = ?auto_654893 ?auto_654894 ) ) ( not ( = ?auto_654893 ?auto_654895 ) ) ( not ( = ?auto_654893 ?auto_654896 ) ) ( not ( = ?auto_654893 ?auto_654897 ) ) ( not ( = ?auto_654893 ?auto_654898 ) ) ( not ( = ?auto_654893 ?auto_654899 ) ) ( not ( = ?auto_654893 ?auto_654900 ) ) ( not ( = ?auto_654893 ?auto_654901 ) ) ( not ( = ?auto_654893 ?auto_654902 ) ) ( not ( = ?auto_654893 ?auto_654903 ) ) ( not ( = ?auto_654893 ?auto_654904 ) ) ( not ( = ?auto_654893 ?auto_654905 ) ) ( not ( = ?auto_654893 ?auto_654906 ) ) ( not ( = ?auto_654893 ?auto_654907 ) ) ( not ( = ?auto_654893 ?auto_654908 ) ) ( not ( = ?auto_654894 ?auto_654895 ) ) ( not ( = ?auto_654894 ?auto_654896 ) ) ( not ( = ?auto_654894 ?auto_654897 ) ) ( not ( = ?auto_654894 ?auto_654898 ) ) ( not ( = ?auto_654894 ?auto_654899 ) ) ( not ( = ?auto_654894 ?auto_654900 ) ) ( not ( = ?auto_654894 ?auto_654901 ) ) ( not ( = ?auto_654894 ?auto_654902 ) ) ( not ( = ?auto_654894 ?auto_654903 ) ) ( not ( = ?auto_654894 ?auto_654904 ) ) ( not ( = ?auto_654894 ?auto_654905 ) ) ( not ( = ?auto_654894 ?auto_654906 ) ) ( not ( = ?auto_654894 ?auto_654907 ) ) ( not ( = ?auto_654894 ?auto_654908 ) ) ( not ( = ?auto_654895 ?auto_654896 ) ) ( not ( = ?auto_654895 ?auto_654897 ) ) ( not ( = ?auto_654895 ?auto_654898 ) ) ( not ( = ?auto_654895 ?auto_654899 ) ) ( not ( = ?auto_654895 ?auto_654900 ) ) ( not ( = ?auto_654895 ?auto_654901 ) ) ( not ( = ?auto_654895 ?auto_654902 ) ) ( not ( = ?auto_654895 ?auto_654903 ) ) ( not ( = ?auto_654895 ?auto_654904 ) ) ( not ( = ?auto_654895 ?auto_654905 ) ) ( not ( = ?auto_654895 ?auto_654906 ) ) ( not ( = ?auto_654895 ?auto_654907 ) ) ( not ( = ?auto_654895 ?auto_654908 ) ) ( not ( = ?auto_654896 ?auto_654897 ) ) ( not ( = ?auto_654896 ?auto_654898 ) ) ( not ( = ?auto_654896 ?auto_654899 ) ) ( not ( = ?auto_654896 ?auto_654900 ) ) ( not ( = ?auto_654896 ?auto_654901 ) ) ( not ( = ?auto_654896 ?auto_654902 ) ) ( not ( = ?auto_654896 ?auto_654903 ) ) ( not ( = ?auto_654896 ?auto_654904 ) ) ( not ( = ?auto_654896 ?auto_654905 ) ) ( not ( = ?auto_654896 ?auto_654906 ) ) ( not ( = ?auto_654896 ?auto_654907 ) ) ( not ( = ?auto_654896 ?auto_654908 ) ) ( not ( = ?auto_654897 ?auto_654898 ) ) ( not ( = ?auto_654897 ?auto_654899 ) ) ( not ( = ?auto_654897 ?auto_654900 ) ) ( not ( = ?auto_654897 ?auto_654901 ) ) ( not ( = ?auto_654897 ?auto_654902 ) ) ( not ( = ?auto_654897 ?auto_654903 ) ) ( not ( = ?auto_654897 ?auto_654904 ) ) ( not ( = ?auto_654897 ?auto_654905 ) ) ( not ( = ?auto_654897 ?auto_654906 ) ) ( not ( = ?auto_654897 ?auto_654907 ) ) ( not ( = ?auto_654897 ?auto_654908 ) ) ( not ( = ?auto_654898 ?auto_654899 ) ) ( not ( = ?auto_654898 ?auto_654900 ) ) ( not ( = ?auto_654898 ?auto_654901 ) ) ( not ( = ?auto_654898 ?auto_654902 ) ) ( not ( = ?auto_654898 ?auto_654903 ) ) ( not ( = ?auto_654898 ?auto_654904 ) ) ( not ( = ?auto_654898 ?auto_654905 ) ) ( not ( = ?auto_654898 ?auto_654906 ) ) ( not ( = ?auto_654898 ?auto_654907 ) ) ( not ( = ?auto_654898 ?auto_654908 ) ) ( not ( = ?auto_654899 ?auto_654900 ) ) ( not ( = ?auto_654899 ?auto_654901 ) ) ( not ( = ?auto_654899 ?auto_654902 ) ) ( not ( = ?auto_654899 ?auto_654903 ) ) ( not ( = ?auto_654899 ?auto_654904 ) ) ( not ( = ?auto_654899 ?auto_654905 ) ) ( not ( = ?auto_654899 ?auto_654906 ) ) ( not ( = ?auto_654899 ?auto_654907 ) ) ( not ( = ?auto_654899 ?auto_654908 ) ) ( not ( = ?auto_654900 ?auto_654901 ) ) ( not ( = ?auto_654900 ?auto_654902 ) ) ( not ( = ?auto_654900 ?auto_654903 ) ) ( not ( = ?auto_654900 ?auto_654904 ) ) ( not ( = ?auto_654900 ?auto_654905 ) ) ( not ( = ?auto_654900 ?auto_654906 ) ) ( not ( = ?auto_654900 ?auto_654907 ) ) ( not ( = ?auto_654900 ?auto_654908 ) ) ( not ( = ?auto_654901 ?auto_654902 ) ) ( not ( = ?auto_654901 ?auto_654903 ) ) ( not ( = ?auto_654901 ?auto_654904 ) ) ( not ( = ?auto_654901 ?auto_654905 ) ) ( not ( = ?auto_654901 ?auto_654906 ) ) ( not ( = ?auto_654901 ?auto_654907 ) ) ( not ( = ?auto_654901 ?auto_654908 ) ) ( not ( = ?auto_654902 ?auto_654903 ) ) ( not ( = ?auto_654902 ?auto_654904 ) ) ( not ( = ?auto_654902 ?auto_654905 ) ) ( not ( = ?auto_654902 ?auto_654906 ) ) ( not ( = ?auto_654902 ?auto_654907 ) ) ( not ( = ?auto_654902 ?auto_654908 ) ) ( not ( = ?auto_654903 ?auto_654904 ) ) ( not ( = ?auto_654903 ?auto_654905 ) ) ( not ( = ?auto_654903 ?auto_654906 ) ) ( not ( = ?auto_654903 ?auto_654907 ) ) ( not ( = ?auto_654903 ?auto_654908 ) ) ( not ( = ?auto_654904 ?auto_654905 ) ) ( not ( = ?auto_654904 ?auto_654906 ) ) ( not ( = ?auto_654904 ?auto_654907 ) ) ( not ( = ?auto_654904 ?auto_654908 ) ) ( not ( = ?auto_654905 ?auto_654906 ) ) ( not ( = ?auto_654905 ?auto_654907 ) ) ( not ( = ?auto_654905 ?auto_654908 ) ) ( not ( = ?auto_654906 ?auto_654907 ) ) ( not ( = ?auto_654906 ?auto_654908 ) ) ( not ( = ?auto_654907 ?auto_654908 ) ) ( ON ?auto_654906 ?auto_654907 ) ( ON ?auto_654905 ?auto_654906 ) ( ON ?auto_654904 ?auto_654905 ) ( ON ?auto_654903 ?auto_654904 ) ( ON ?auto_654902 ?auto_654903 ) ( ON ?auto_654901 ?auto_654902 ) ( ON ?auto_654900 ?auto_654901 ) ( CLEAR ?auto_654898 ) ( ON ?auto_654899 ?auto_654900 ) ( CLEAR ?auto_654899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_654893 ?auto_654894 ?auto_654895 ?auto_654896 ?auto_654897 ?auto_654898 ?auto_654899 )
      ( MAKE-15PILE ?auto_654893 ?auto_654894 ?auto_654895 ?auto_654896 ?auto_654897 ?auto_654898 ?auto_654899 ?auto_654900 ?auto_654901 ?auto_654902 ?auto_654903 ?auto_654904 ?auto_654905 ?auto_654906 ?auto_654907 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_654955 - BLOCK
      ?auto_654956 - BLOCK
      ?auto_654957 - BLOCK
      ?auto_654958 - BLOCK
      ?auto_654959 - BLOCK
      ?auto_654960 - BLOCK
      ?auto_654961 - BLOCK
      ?auto_654962 - BLOCK
      ?auto_654963 - BLOCK
      ?auto_654964 - BLOCK
      ?auto_654965 - BLOCK
      ?auto_654966 - BLOCK
      ?auto_654967 - BLOCK
      ?auto_654968 - BLOCK
      ?auto_654969 - BLOCK
    )
    :vars
    (
      ?auto_654970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_654969 ?auto_654970 ) ( ON-TABLE ?auto_654955 ) ( ON ?auto_654956 ?auto_654955 ) ( ON ?auto_654957 ?auto_654956 ) ( ON ?auto_654958 ?auto_654957 ) ( ON ?auto_654959 ?auto_654958 ) ( not ( = ?auto_654955 ?auto_654956 ) ) ( not ( = ?auto_654955 ?auto_654957 ) ) ( not ( = ?auto_654955 ?auto_654958 ) ) ( not ( = ?auto_654955 ?auto_654959 ) ) ( not ( = ?auto_654955 ?auto_654960 ) ) ( not ( = ?auto_654955 ?auto_654961 ) ) ( not ( = ?auto_654955 ?auto_654962 ) ) ( not ( = ?auto_654955 ?auto_654963 ) ) ( not ( = ?auto_654955 ?auto_654964 ) ) ( not ( = ?auto_654955 ?auto_654965 ) ) ( not ( = ?auto_654955 ?auto_654966 ) ) ( not ( = ?auto_654955 ?auto_654967 ) ) ( not ( = ?auto_654955 ?auto_654968 ) ) ( not ( = ?auto_654955 ?auto_654969 ) ) ( not ( = ?auto_654955 ?auto_654970 ) ) ( not ( = ?auto_654956 ?auto_654957 ) ) ( not ( = ?auto_654956 ?auto_654958 ) ) ( not ( = ?auto_654956 ?auto_654959 ) ) ( not ( = ?auto_654956 ?auto_654960 ) ) ( not ( = ?auto_654956 ?auto_654961 ) ) ( not ( = ?auto_654956 ?auto_654962 ) ) ( not ( = ?auto_654956 ?auto_654963 ) ) ( not ( = ?auto_654956 ?auto_654964 ) ) ( not ( = ?auto_654956 ?auto_654965 ) ) ( not ( = ?auto_654956 ?auto_654966 ) ) ( not ( = ?auto_654956 ?auto_654967 ) ) ( not ( = ?auto_654956 ?auto_654968 ) ) ( not ( = ?auto_654956 ?auto_654969 ) ) ( not ( = ?auto_654956 ?auto_654970 ) ) ( not ( = ?auto_654957 ?auto_654958 ) ) ( not ( = ?auto_654957 ?auto_654959 ) ) ( not ( = ?auto_654957 ?auto_654960 ) ) ( not ( = ?auto_654957 ?auto_654961 ) ) ( not ( = ?auto_654957 ?auto_654962 ) ) ( not ( = ?auto_654957 ?auto_654963 ) ) ( not ( = ?auto_654957 ?auto_654964 ) ) ( not ( = ?auto_654957 ?auto_654965 ) ) ( not ( = ?auto_654957 ?auto_654966 ) ) ( not ( = ?auto_654957 ?auto_654967 ) ) ( not ( = ?auto_654957 ?auto_654968 ) ) ( not ( = ?auto_654957 ?auto_654969 ) ) ( not ( = ?auto_654957 ?auto_654970 ) ) ( not ( = ?auto_654958 ?auto_654959 ) ) ( not ( = ?auto_654958 ?auto_654960 ) ) ( not ( = ?auto_654958 ?auto_654961 ) ) ( not ( = ?auto_654958 ?auto_654962 ) ) ( not ( = ?auto_654958 ?auto_654963 ) ) ( not ( = ?auto_654958 ?auto_654964 ) ) ( not ( = ?auto_654958 ?auto_654965 ) ) ( not ( = ?auto_654958 ?auto_654966 ) ) ( not ( = ?auto_654958 ?auto_654967 ) ) ( not ( = ?auto_654958 ?auto_654968 ) ) ( not ( = ?auto_654958 ?auto_654969 ) ) ( not ( = ?auto_654958 ?auto_654970 ) ) ( not ( = ?auto_654959 ?auto_654960 ) ) ( not ( = ?auto_654959 ?auto_654961 ) ) ( not ( = ?auto_654959 ?auto_654962 ) ) ( not ( = ?auto_654959 ?auto_654963 ) ) ( not ( = ?auto_654959 ?auto_654964 ) ) ( not ( = ?auto_654959 ?auto_654965 ) ) ( not ( = ?auto_654959 ?auto_654966 ) ) ( not ( = ?auto_654959 ?auto_654967 ) ) ( not ( = ?auto_654959 ?auto_654968 ) ) ( not ( = ?auto_654959 ?auto_654969 ) ) ( not ( = ?auto_654959 ?auto_654970 ) ) ( not ( = ?auto_654960 ?auto_654961 ) ) ( not ( = ?auto_654960 ?auto_654962 ) ) ( not ( = ?auto_654960 ?auto_654963 ) ) ( not ( = ?auto_654960 ?auto_654964 ) ) ( not ( = ?auto_654960 ?auto_654965 ) ) ( not ( = ?auto_654960 ?auto_654966 ) ) ( not ( = ?auto_654960 ?auto_654967 ) ) ( not ( = ?auto_654960 ?auto_654968 ) ) ( not ( = ?auto_654960 ?auto_654969 ) ) ( not ( = ?auto_654960 ?auto_654970 ) ) ( not ( = ?auto_654961 ?auto_654962 ) ) ( not ( = ?auto_654961 ?auto_654963 ) ) ( not ( = ?auto_654961 ?auto_654964 ) ) ( not ( = ?auto_654961 ?auto_654965 ) ) ( not ( = ?auto_654961 ?auto_654966 ) ) ( not ( = ?auto_654961 ?auto_654967 ) ) ( not ( = ?auto_654961 ?auto_654968 ) ) ( not ( = ?auto_654961 ?auto_654969 ) ) ( not ( = ?auto_654961 ?auto_654970 ) ) ( not ( = ?auto_654962 ?auto_654963 ) ) ( not ( = ?auto_654962 ?auto_654964 ) ) ( not ( = ?auto_654962 ?auto_654965 ) ) ( not ( = ?auto_654962 ?auto_654966 ) ) ( not ( = ?auto_654962 ?auto_654967 ) ) ( not ( = ?auto_654962 ?auto_654968 ) ) ( not ( = ?auto_654962 ?auto_654969 ) ) ( not ( = ?auto_654962 ?auto_654970 ) ) ( not ( = ?auto_654963 ?auto_654964 ) ) ( not ( = ?auto_654963 ?auto_654965 ) ) ( not ( = ?auto_654963 ?auto_654966 ) ) ( not ( = ?auto_654963 ?auto_654967 ) ) ( not ( = ?auto_654963 ?auto_654968 ) ) ( not ( = ?auto_654963 ?auto_654969 ) ) ( not ( = ?auto_654963 ?auto_654970 ) ) ( not ( = ?auto_654964 ?auto_654965 ) ) ( not ( = ?auto_654964 ?auto_654966 ) ) ( not ( = ?auto_654964 ?auto_654967 ) ) ( not ( = ?auto_654964 ?auto_654968 ) ) ( not ( = ?auto_654964 ?auto_654969 ) ) ( not ( = ?auto_654964 ?auto_654970 ) ) ( not ( = ?auto_654965 ?auto_654966 ) ) ( not ( = ?auto_654965 ?auto_654967 ) ) ( not ( = ?auto_654965 ?auto_654968 ) ) ( not ( = ?auto_654965 ?auto_654969 ) ) ( not ( = ?auto_654965 ?auto_654970 ) ) ( not ( = ?auto_654966 ?auto_654967 ) ) ( not ( = ?auto_654966 ?auto_654968 ) ) ( not ( = ?auto_654966 ?auto_654969 ) ) ( not ( = ?auto_654966 ?auto_654970 ) ) ( not ( = ?auto_654967 ?auto_654968 ) ) ( not ( = ?auto_654967 ?auto_654969 ) ) ( not ( = ?auto_654967 ?auto_654970 ) ) ( not ( = ?auto_654968 ?auto_654969 ) ) ( not ( = ?auto_654968 ?auto_654970 ) ) ( not ( = ?auto_654969 ?auto_654970 ) ) ( ON ?auto_654968 ?auto_654969 ) ( ON ?auto_654967 ?auto_654968 ) ( ON ?auto_654966 ?auto_654967 ) ( ON ?auto_654965 ?auto_654966 ) ( ON ?auto_654964 ?auto_654965 ) ( ON ?auto_654963 ?auto_654964 ) ( ON ?auto_654962 ?auto_654963 ) ( ON ?auto_654961 ?auto_654962 ) ( CLEAR ?auto_654959 ) ( ON ?auto_654960 ?auto_654961 ) ( CLEAR ?auto_654960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_654955 ?auto_654956 ?auto_654957 ?auto_654958 ?auto_654959 ?auto_654960 )
      ( MAKE-15PILE ?auto_654955 ?auto_654956 ?auto_654957 ?auto_654958 ?auto_654959 ?auto_654960 ?auto_654961 ?auto_654962 ?auto_654963 ?auto_654964 ?auto_654965 ?auto_654966 ?auto_654967 ?auto_654968 ?auto_654969 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_655017 - BLOCK
      ?auto_655018 - BLOCK
      ?auto_655019 - BLOCK
      ?auto_655020 - BLOCK
      ?auto_655021 - BLOCK
      ?auto_655022 - BLOCK
      ?auto_655023 - BLOCK
      ?auto_655024 - BLOCK
      ?auto_655025 - BLOCK
      ?auto_655026 - BLOCK
      ?auto_655027 - BLOCK
      ?auto_655028 - BLOCK
      ?auto_655029 - BLOCK
      ?auto_655030 - BLOCK
      ?auto_655031 - BLOCK
    )
    :vars
    (
      ?auto_655032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_655031 ?auto_655032 ) ( ON-TABLE ?auto_655017 ) ( ON ?auto_655018 ?auto_655017 ) ( ON ?auto_655019 ?auto_655018 ) ( ON ?auto_655020 ?auto_655019 ) ( not ( = ?auto_655017 ?auto_655018 ) ) ( not ( = ?auto_655017 ?auto_655019 ) ) ( not ( = ?auto_655017 ?auto_655020 ) ) ( not ( = ?auto_655017 ?auto_655021 ) ) ( not ( = ?auto_655017 ?auto_655022 ) ) ( not ( = ?auto_655017 ?auto_655023 ) ) ( not ( = ?auto_655017 ?auto_655024 ) ) ( not ( = ?auto_655017 ?auto_655025 ) ) ( not ( = ?auto_655017 ?auto_655026 ) ) ( not ( = ?auto_655017 ?auto_655027 ) ) ( not ( = ?auto_655017 ?auto_655028 ) ) ( not ( = ?auto_655017 ?auto_655029 ) ) ( not ( = ?auto_655017 ?auto_655030 ) ) ( not ( = ?auto_655017 ?auto_655031 ) ) ( not ( = ?auto_655017 ?auto_655032 ) ) ( not ( = ?auto_655018 ?auto_655019 ) ) ( not ( = ?auto_655018 ?auto_655020 ) ) ( not ( = ?auto_655018 ?auto_655021 ) ) ( not ( = ?auto_655018 ?auto_655022 ) ) ( not ( = ?auto_655018 ?auto_655023 ) ) ( not ( = ?auto_655018 ?auto_655024 ) ) ( not ( = ?auto_655018 ?auto_655025 ) ) ( not ( = ?auto_655018 ?auto_655026 ) ) ( not ( = ?auto_655018 ?auto_655027 ) ) ( not ( = ?auto_655018 ?auto_655028 ) ) ( not ( = ?auto_655018 ?auto_655029 ) ) ( not ( = ?auto_655018 ?auto_655030 ) ) ( not ( = ?auto_655018 ?auto_655031 ) ) ( not ( = ?auto_655018 ?auto_655032 ) ) ( not ( = ?auto_655019 ?auto_655020 ) ) ( not ( = ?auto_655019 ?auto_655021 ) ) ( not ( = ?auto_655019 ?auto_655022 ) ) ( not ( = ?auto_655019 ?auto_655023 ) ) ( not ( = ?auto_655019 ?auto_655024 ) ) ( not ( = ?auto_655019 ?auto_655025 ) ) ( not ( = ?auto_655019 ?auto_655026 ) ) ( not ( = ?auto_655019 ?auto_655027 ) ) ( not ( = ?auto_655019 ?auto_655028 ) ) ( not ( = ?auto_655019 ?auto_655029 ) ) ( not ( = ?auto_655019 ?auto_655030 ) ) ( not ( = ?auto_655019 ?auto_655031 ) ) ( not ( = ?auto_655019 ?auto_655032 ) ) ( not ( = ?auto_655020 ?auto_655021 ) ) ( not ( = ?auto_655020 ?auto_655022 ) ) ( not ( = ?auto_655020 ?auto_655023 ) ) ( not ( = ?auto_655020 ?auto_655024 ) ) ( not ( = ?auto_655020 ?auto_655025 ) ) ( not ( = ?auto_655020 ?auto_655026 ) ) ( not ( = ?auto_655020 ?auto_655027 ) ) ( not ( = ?auto_655020 ?auto_655028 ) ) ( not ( = ?auto_655020 ?auto_655029 ) ) ( not ( = ?auto_655020 ?auto_655030 ) ) ( not ( = ?auto_655020 ?auto_655031 ) ) ( not ( = ?auto_655020 ?auto_655032 ) ) ( not ( = ?auto_655021 ?auto_655022 ) ) ( not ( = ?auto_655021 ?auto_655023 ) ) ( not ( = ?auto_655021 ?auto_655024 ) ) ( not ( = ?auto_655021 ?auto_655025 ) ) ( not ( = ?auto_655021 ?auto_655026 ) ) ( not ( = ?auto_655021 ?auto_655027 ) ) ( not ( = ?auto_655021 ?auto_655028 ) ) ( not ( = ?auto_655021 ?auto_655029 ) ) ( not ( = ?auto_655021 ?auto_655030 ) ) ( not ( = ?auto_655021 ?auto_655031 ) ) ( not ( = ?auto_655021 ?auto_655032 ) ) ( not ( = ?auto_655022 ?auto_655023 ) ) ( not ( = ?auto_655022 ?auto_655024 ) ) ( not ( = ?auto_655022 ?auto_655025 ) ) ( not ( = ?auto_655022 ?auto_655026 ) ) ( not ( = ?auto_655022 ?auto_655027 ) ) ( not ( = ?auto_655022 ?auto_655028 ) ) ( not ( = ?auto_655022 ?auto_655029 ) ) ( not ( = ?auto_655022 ?auto_655030 ) ) ( not ( = ?auto_655022 ?auto_655031 ) ) ( not ( = ?auto_655022 ?auto_655032 ) ) ( not ( = ?auto_655023 ?auto_655024 ) ) ( not ( = ?auto_655023 ?auto_655025 ) ) ( not ( = ?auto_655023 ?auto_655026 ) ) ( not ( = ?auto_655023 ?auto_655027 ) ) ( not ( = ?auto_655023 ?auto_655028 ) ) ( not ( = ?auto_655023 ?auto_655029 ) ) ( not ( = ?auto_655023 ?auto_655030 ) ) ( not ( = ?auto_655023 ?auto_655031 ) ) ( not ( = ?auto_655023 ?auto_655032 ) ) ( not ( = ?auto_655024 ?auto_655025 ) ) ( not ( = ?auto_655024 ?auto_655026 ) ) ( not ( = ?auto_655024 ?auto_655027 ) ) ( not ( = ?auto_655024 ?auto_655028 ) ) ( not ( = ?auto_655024 ?auto_655029 ) ) ( not ( = ?auto_655024 ?auto_655030 ) ) ( not ( = ?auto_655024 ?auto_655031 ) ) ( not ( = ?auto_655024 ?auto_655032 ) ) ( not ( = ?auto_655025 ?auto_655026 ) ) ( not ( = ?auto_655025 ?auto_655027 ) ) ( not ( = ?auto_655025 ?auto_655028 ) ) ( not ( = ?auto_655025 ?auto_655029 ) ) ( not ( = ?auto_655025 ?auto_655030 ) ) ( not ( = ?auto_655025 ?auto_655031 ) ) ( not ( = ?auto_655025 ?auto_655032 ) ) ( not ( = ?auto_655026 ?auto_655027 ) ) ( not ( = ?auto_655026 ?auto_655028 ) ) ( not ( = ?auto_655026 ?auto_655029 ) ) ( not ( = ?auto_655026 ?auto_655030 ) ) ( not ( = ?auto_655026 ?auto_655031 ) ) ( not ( = ?auto_655026 ?auto_655032 ) ) ( not ( = ?auto_655027 ?auto_655028 ) ) ( not ( = ?auto_655027 ?auto_655029 ) ) ( not ( = ?auto_655027 ?auto_655030 ) ) ( not ( = ?auto_655027 ?auto_655031 ) ) ( not ( = ?auto_655027 ?auto_655032 ) ) ( not ( = ?auto_655028 ?auto_655029 ) ) ( not ( = ?auto_655028 ?auto_655030 ) ) ( not ( = ?auto_655028 ?auto_655031 ) ) ( not ( = ?auto_655028 ?auto_655032 ) ) ( not ( = ?auto_655029 ?auto_655030 ) ) ( not ( = ?auto_655029 ?auto_655031 ) ) ( not ( = ?auto_655029 ?auto_655032 ) ) ( not ( = ?auto_655030 ?auto_655031 ) ) ( not ( = ?auto_655030 ?auto_655032 ) ) ( not ( = ?auto_655031 ?auto_655032 ) ) ( ON ?auto_655030 ?auto_655031 ) ( ON ?auto_655029 ?auto_655030 ) ( ON ?auto_655028 ?auto_655029 ) ( ON ?auto_655027 ?auto_655028 ) ( ON ?auto_655026 ?auto_655027 ) ( ON ?auto_655025 ?auto_655026 ) ( ON ?auto_655024 ?auto_655025 ) ( ON ?auto_655023 ?auto_655024 ) ( ON ?auto_655022 ?auto_655023 ) ( CLEAR ?auto_655020 ) ( ON ?auto_655021 ?auto_655022 ) ( CLEAR ?auto_655021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_655017 ?auto_655018 ?auto_655019 ?auto_655020 ?auto_655021 )
      ( MAKE-15PILE ?auto_655017 ?auto_655018 ?auto_655019 ?auto_655020 ?auto_655021 ?auto_655022 ?auto_655023 ?auto_655024 ?auto_655025 ?auto_655026 ?auto_655027 ?auto_655028 ?auto_655029 ?auto_655030 ?auto_655031 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_655079 - BLOCK
      ?auto_655080 - BLOCK
      ?auto_655081 - BLOCK
      ?auto_655082 - BLOCK
      ?auto_655083 - BLOCK
      ?auto_655084 - BLOCK
      ?auto_655085 - BLOCK
      ?auto_655086 - BLOCK
      ?auto_655087 - BLOCK
      ?auto_655088 - BLOCK
      ?auto_655089 - BLOCK
      ?auto_655090 - BLOCK
      ?auto_655091 - BLOCK
      ?auto_655092 - BLOCK
      ?auto_655093 - BLOCK
    )
    :vars
    (
      ?auto_655094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_655093 ?auto_655094 ) ( ON-TABLE ?auto_655079 ) ( ON ?auto_655080 ?auto_655079 ) ( ON ?auto_655081 ?auto_655080 ) ( not ( = ?auto_655079 ?auto_655080 ) ) ( not ( = ?auto_655079 ?auto_655081 ) ) ( not ( = ?auto_655079 ?auto_655082 ) ) ( not ( = ?auto_655079 ?auto_655083 ) ) ( not ( = ?auto_655079 ?auto_655084 ) ) ( not ( = ?auto_655079 ?auto_655085 ) ) ( not ( = ?auto_655079 ?auto_655086 ) ) ( not ( = ?auto_655079 ?auto_655087 ) ) ( not ( = ?auto_655079 ?auto_655088 ) ) ( not ( = ?auto_655079 ?auto_655089 ) ) ( not ( = ?auto_655079 ?auto_655090 ) ) ( not ( = ?auto_655079 ?auto_655091 ) ) ( not ( = ?auto_655079 ?auto_655092 ) ) ( not ( = ?auto_655079 ?auto_655093 ) ) ( not ( = ?auto_655079 ?auto_655094 ) ) ( not ( = ?auto_655080 ?auto_655081 ) ) ( not ( = ?auto_655080 ?auto_655082 ) ) ( not ( = ?auto_655080 ?auto_655083 ) ) ( not ( = ?auto_655080 ?auto_655084 ) ) ( not ( = ?auto_655080 ?auto_655085 ) ) ( not ( = ?auto_655080 ?auto_655086 ) ) ( not ( = ?auto_655080 ?auto_655087 ) ) ( not ( = ?auto_655080 ?auto_655088 ) ) ( not ( = ?auto_655080 ?auto_655089 ) ) ( not ( = ?auto_655080 ?auto_655090 ) ) ( not ( = ?auto_655080 ?auto_655091 ) ) ( not ( = ?auto_655080 ?auto_655092 ) ) ( not ( = ?auto_655080 ?auto_655093 ) ) ( not ( = ?auto_655080 ?auto_655094 ) ) ( not ( = ?auto_655081 ?auto_655082 ) ) ( not ( = ?auto_655081 ?auto_655083 ) ) ( not ( = ?auto_655081 ?auto_655084 ) ) ( not ( = ?auto_655081 ?auto_655085 ) ) ( not ( = ?auto_655081 ?auto_655086 ) ) ( not ( = ?auto_655081 ?auto_655087 ) ) ( not ( = ?auto_655081 ?auto_655088 ) ) ( not ( = ?auto_655081 ?auto_655089 ) ) ( not ( = ?auto_655081 ?auto_655090 ) ) ( not ( = ?auto_655081 ?auto_655091 ) ) ( not ( = ?auto_655081 ?auto_655092 ) ) ( not ( = ?auto_655081 ?auto_655093 ) ) ( not ( = ?auto_655081 ?auto_655094 ) ) ( not ( = ?auto_655082 ?auto_655083 ) ) ( not ( = ?auto_655082 ?auto_655084 ) ) ( not ( = ?auto_655082 ?auto_655085 ) ) ( not ( = ?auto_655082 ?auto_655086 ) ) ( not ( = ?auto_655082 ?auto_655087 ) ) ( not ( = ?auto_655082 ?auto_655088 ) ) ( not ( = ?auto_655082 ?auto_655089 ) ) ( not ( = ?auto_655082 ?auto_655090 ) ) ( not ( = ?auto_655082 ?auto_655091 ) ) ( not ( = ?auto_655082 ?auto_655092 ) ) ( not ( = ?auto_655082 ?auto_655093 ) ) ( not ( = ?auto_655082 ?auto_655094 ) ) ( not ( = ?auto_655083 ?auto_655084 ) ) ( not ( = ?auto_655083 ?auto_655085 ) ) ( not ( = ?auto_655083 ?auto_655086 ) ) ( not ( = ?auto_655083 ?auto_655087 ) ) ( not ( = ?auto_655083 ?auto_655088 ) ) ( not ( = ?auto_655083 ?auto_655089 ) ) ( not ( = ?auto_655083 ?auto_655090 ) ) ( not ( = ?auto_655083 ?auto_655091 ) ) ( not ( = ?auto_655083 ?auto_655092 ) ) ( not ( = ?auto_655083 ?auto_655093 ) ) ( not ( = ?auto_655083 ?auto_655094 ) ) ( not ( = ?auto_655084 ?auto_655085 ) ) ( not ( = ?auto_655084 ?auto_655086 ) ) ( not ( = ?auto_655084 ?auto_655087 ) ) ( not ( = ?auto_655084 ?auto_655088 ) ) ( not ( = ?auto_655084 ?auto_655089 ) ) ( not ( = ?auto_655084 ?auto_655090 ) ) ( not ( = ?auto_655084 ?auto_655091 ) ) ( not ( = ?auto_655084 ?auto_655092 ) ) ( not ( = ?auto_655084 ?auto_655093 ) ) ( not ( = ?auto_655084 ?auto_655094 ) ) ( not ( = ?auto_655085 ?auto_655086 ) ) ( not ( = ?auto_655085 ?auto_655087 ) ) ( not ( = ?auto_655085 ?auto_655088 ) ) ( not ( = ?auto_655085 ?auto_655089 ) ) ( not ( = ?auto_655085 ?auto_655090 ) ) ( not ( = ?auto_655085 ?auto_655091 ) ) ( not ( = ?auto_655085 ?auto_655092 ) ) ( not ( = ?auto_655085 ?auto_655093 ) ) ( not ( = ?auto_655085 ?auto_655094 ) ) ( not ( = ?auto_655086 ?auto_655087 ) ) ( not ( = ?auto_655086 ?auto_655088 ) ) ( not ( = ?auto_655086 ?auto_655089 ) ) ( not ( = ?auto_655086 ?auto_655090 ) ) ( not ( = ?auto_655086 ?auto_655091 ) ) ( not ( = ?auto_655086 ?auto_655092 ) ) ( not ( = ?auto_655086 ?auto_655093 ) ) ( not ( = ?auto_655086 ?auto_655094 ) ) ( not ( = ?auto_655087 ?auto_655088 ) ) ( not ( = ?auto_655087 ?auto_655089 ) ) ( not ( = ?auto_655087 ?auto_655090 ) ) ( not ( = ?auto_655087 ?auto_655091 ) ) ( not ( = ?auto_655087 ?auto_655092 ) ) ( not ( = ?auto_655087 ?auto_655093 ) ) ( not ( = ?auto_655087 ?auto_655094 ) ) ( not ( = ?auto_655088 ?auto_655089 ) ) ( not ( = ?auto_655088 ?auto_655090 ) ) ( not ( = ?auto_655088 ?auto_655091 ) ) ( not ( = ?auto_655088 ?auto_655092 ) ) ( not ( = ?auto_655088 ?auto_655093 ) ) ( not ( = ?auto_655088 ?auto_655094 ) ) ( not ( = ?auto_655089 ?auto_655090 ) ) ( not ( = ?auto_655089 ?auto_655091 ) ) ( not ( = ?auto_655089 ?auto_655092 ) ) ( not ( = ?auto_655089 ?auto_655093 ) ) ( not ( = ?auto_655089 ?auto_655094 ) ) ( not ( = ?auto_655090 ?auto_655091 ) ) ( not ( = ?auto_655090 ?auto_655092 ) ) ( not ( = ?auto_655090 ?auto_655093 ) ) ( not ( = ?auto_655090 ?auto_655094 ) ) ( not ( = ?auto_655091 ?auto_655092 ) ) ( not ( = ?auto_655091 ?auto_655093 ) ) ( not ( = ?auto_655091 ?auto_655094 ) ) ( not ( = ?auto_655092 ?auto_655093 ) ) ( not ( = ?auto_655092 ?auto_655094 ) ) ( not ( = ?auto_655093 ?auto_655094 ) ) ( ON ?auto_655092 ?auto_655093 ) ( ON ?auto_655091 ?auto_655092 ) ( ON ?auto_655090 ?auto_655091 ) ( ON ?auto_655089 ?auto_655090 ) ( ON ?auto_655088 ?auto_655089 ) ( ON ?auto_655087 ?auto_655088 ) ( ON ?auto_655086 ?auto_655087 ) ( ON ?auto_655085 ?auto_655086 ) ( ON ?auto_655084 ?auto_655085 ) ( ON ?auto_655083 ?auto_655084 ) ( CLEAR ?auto_655081 ) ( ON ?auto_655082 ?auto_655083 ) ( CLEAR ?auto_655082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_655079 ?auto_655080 ?auto_655081 ?auto_655082 )
      ( MAKE-15PILE ?auto_655079 ?auto_655080 ?auto_655081 ?auto_655082 ?auto_655083 ?auto_655084 ?auto_655085 ?auto_655086 ?auto_655087 ?auto_655088 ?auto_655089 ?auto_655090 ?auto_655091 ?auto_655092 ?auto_655093 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_655141 - BLOCK
      ?auto_655142 - BLOCK
      ?auto_655143 - BLOCK
      ?auto_655144 - BLOCK
      ?auto_655145 - BLOCK
      ?auto_655146 - BLOCK
      ?auto_655147 - BLOCK
      ?auto_655148 - BLOCK
      ?auto_655149 - BLOCK
      ?auto_655150 - BLOCK
      ?auto_655151 - BLOCK
      ?auto_655152 - BLOCK
      ?auto_655153 - BLOCK
      ?auto_655154 - BLOCK
      ?auto_655155 - BLOCK
    )
    :vars
    (
      ?auto_655156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_655155 ?auto_655156 ) ( ON-TABLE ?auto_655141 ) ( ON ?auto_655142 ?auto_655141 ) ( not ( = ?auto_655141 ?auto_655142 ) ) ( not ( = ?auto_655141 ?auto_655143 ) ) ( not ( = ?auto_655141 ?auto_655144 ) ) ( not ( = ?auto_655141 ?auto_655145 ) ) ( not ( = ?auto_655141 ?auto_655146 ) ) ( not ( = ?auto_655141 ?auto_655147 ) ) ( not ( = ?auto_655141 ?auto_655148 ) ) ( not ( = ?auto_655141 ?auto_655149 ) ) ( not ( = ?auto_655141 ?auto_655150 ) ) ( not ( = ?auto_655141 ?auto_655151 ) ) ( not ( = ?auto_655141 ?auto_655152 ) ) ( not ( = ?auto_655141 ?auto_655153 ) ) ( not ( = ?auto_655141 ?auto_655154 ) ) ( not ( = ?auto_655141 ?auto_655155 ) ) ( not ( = ?auto_655141 ?auto_655156 ) ) ( not ( = ?auto_655142 ?auto_655143 ) ) ( not ( = ?auto_655142 ?auto_655144 ) ) ( not ( = ?auto_655142 ?auto_655145 ) ) ( not ( = ?auto_655142 ?auto_655146 ) ) ( not ( = ?auto_655142 ?auto_655147 ) ) ( not ( = ?auto_655142 ?auto_655148 ) ) ( not ( = ?auto_655142 ?auto_655149 ) ) ( not ( = ?auto_655142 ?auto_655150 ) ) ( not ( = ?auto_655142 ?auto_655151 ) ) ( not ( = ?auto_655142 ?auto_655152 ) ) ( not ( = ?auto_655142 ?auto_655153 ) ) ( not ( = ?auto_655142 ?auto_655154 ) ) ( not ( = ?auto_655142 ?auto_655155 ) ) ( not ( = ?auto_655142 ?auto_655156 ) ) ( not ( = ?auto_655143 ?auto_655144 ) ) ( not ( = ?auto_655143 ?auto_655145 ) ) ( not ( = ?auto_655143 ?auto_655146 ) ) ( not ( = ?auto_655143 ?auto_655147 ) ) ( not ( = ?auto_655143 ?auto_655148 ) ) ( not ( = ?auto_655143 ?auto_655149 ) ) ( not ( = ?auto_655143 ?auto_655150 ) ) ( not ( = ?auto_655143 ?auto_655151 ) ) ( not ( = ?auto_655143 ?auto_655152 ) ) ( not ( = ?auto_655143 ?auto_655153 ) ) ( not ( = ?auto_655143 ?auto_655154 ) ) ( not ( = ?auto_655143 ?auto_655155 ) ) ( not ( = ?auto_655143 ?auto_655156 ) ) ( not ( = ?auto_655144 ?auto_655145 ) ) ( not ( = ?auto_655144 ?auto_655146 ) ) ( not ( = ?auto_655144 ?auto_655147 ) ) ( not ( = ?auto_655144 ?auto_655148 ) ) ( not ( = ?auto_655144 ?auto_655149 ) ) ( not ( = ?auto_655144 ?auto_655150 ) ) ( not ( = ?auto_655144 ?auto_655151 ) ) ( not ( = ?auto_655144 ?auto_655152 ) ) ( not ( = ?auto_655144 ?auto_655153 ) ) ( not ( = ?auto_655144 ?auto_655154 ) ) ( not ( = ?auto_655144 ?auto_655155 ) ) ( not ( = ?auto_655144 ?auto_655156 ) ) ( not ( = ?auto_655145 ?auto_655146 ) ) ( not ( = ?auto_655145 ?auto_655147 ) ) ( not ( = ?auto_655145 ?auto_655148 ) ) ( not ( = ?auto_655145 ?auto_655149 ) ) ( not ( = ?auto_655145 ?auto_655150 ) ) ( not ( = ?auto_655145 ?auto_655151 ) ) ( not ( = ?auto_655145 ?auto_655152 ) ) ( not ( = ?auto_655145 ?auto_655153 ) ) ( not ( = ?auto_655145 ?auto_655154 ) ) ( not ( = ?auto_655145 ?auto_655155 ) ) ( not ( = ?auto_655145 ?auto_655156 ) ) ( not ( = ?auto_655146 ?auto_655147 ) ) ( not ( = ?auto_655146 ?auto_655148 ) ) ( not ( = ?auto_655146 ?auto_655149 ) ) ( not ( = ?auto_655146 ?auto_655150 ) ) ( not ( = ?auto_655146 ?auto_655151 ) ) ( not ( = ?auto_655146 ?auto_655152 ) ) ( not ( = ?auto_655146 ?auto_655153 ) ) ( not ( = ?auto_655146 ?auto_655154 ) ) ( not ( = ?auto_655146 ?auto_655155 ) ) ( not ( = ?auto_655146 ?auto_655156 ) ) ( not ( = ?auto_655147 ?auto_655148 ) ) ( not ( = ?auto_655147 ?auto_655149 ) ) ( not ( = ?auto_655147 ?auto_655150 ) ) ( not ( = ?auto_655147 ?auto_655151 ) ) ( not ( = ?auto_655147 ?auto_655152 ) ) ( not ( = ?auto_655147 ?auto_655153 ) ) ( not ( = ?auto_655147 ?auto_655154 ) ) ( not ( = ?auto_655147 ?auto_655155 ) ) ( not ( = ?auto_655147 ?auto_655156 ) ) ( not ( = ?auto_655148 ?auto_655149 ) ) ( not ( = ?auto_655148 ?auto_655150 ) ) ( not ( = ?auto_655148 ?auto_655151 ) ) ( not ( = ?auto_655148 ?auto_655152 ) ) ( not ( = ?auto_655148 ?auto_655153 ) ) ( not ( = ?auto_655148 ?auto_655154 ) ) ( not ( = ?auto_655148 ?auto_655155 ) ) ( not ( = ?auto_655148 ?auto_655156 ) ) ( not ( = ?auto_655149 ?auto_655150 ) ) ( not ( = ?auto_655149 ?auto_655151 ) ) ( not ( = ?auto_655149 ?auto_655152 ) ) ( not ( = ?auto_655149 ?auto_655153 ) ) ( not ( = ?auto_655149 ?auto_655154 ) ) ( not ( = ?auto_655149 ?auto_655155 ) ) ( not ( = ?auto_655149 ?auto_655156 ) ) ( not ( = ?auto_655150 ?auto_655151 ) ) ( not ( = ?auto_655150 ?auto_655152 ) ) ( not ( = ?auto_655150 ?auto_655153 ) ) ( not ( = ?auto_655150 ?auto_655154 ) ) ( not ( = ?auto_655150 ?auto_655155 ) ) ( not ( = ?auto_655150 ?auto_655156 ) ) ( not ( = ?auto_655151 ?auto_655152 ) ) ( not ( = ?auto_655151 ?auto_655153 ) ) ( not ( = ?auto_655151 ?auto_655154 ) ) ( not ( = ?auto_655151 ?auto_655155 ) ) ( not ( = ?auto_655151 ?auto_655156 ) ) ( not ( = ?auto_655152 ?auto_655153 ) ) ( not ( = ?auto_655152 ?auto_655154 ) ) ( not ( = ?auto_655152 ?auto_655155 ) ) ( not ( = ?auto_655152 ?auto_655156 ) ) ( not ( = ?auto_655153 ?auto_655154 ) ) ( not ( = ?auto_655153 ?auto_655155 ) ) ( not ( = ?auto_655153 ?auto_655156 ) ) ( not ( = ?auto_655154 ?auto_655155 ) ) ( not ( = ?auto_655154 ?auto_655156 ) ) ( not ( = ?auto_655155 ?auto_655156 ) ) ( ON ?auto_655154 ?auto_655155 ) ( ON ?auto_655153 ?auto_655154 ) ( ON ?auto_655152 ?auto_655153 ) ( ON ?auto_655151 ?auto_655152 ) ( ON ?auto_655150 ?auto_655151 ) ( ON ?auto_655149 ?auto_655150 ) ( ON ?auto_655148 ?auto_655149 ) ( ON ?auto_655147 ?auto_655148 ) ( ON ?auto_655146 ?auto_655147 ) ( ON ?auto_655145 ?auto_655146 ) ( ON ?auto_655144 ?auto_655145 ) ( CLEAR ?auto_655142 ) ( ON ?auto_655143 ?auto_655144 ) ( CLEAR ?auto_655143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_655141 ?auto_655142 ?auto_655143 )
      ( MAKE-15PILE ?auto_655141 ?auto_655142 ?auto_655143 ?auto_655144 ?auto_655145 ?auto_655146 ?auto_655147 ?auto_655148 ?auto_655149 ?auto_655150 ?auto_655151 ?auto_655152 ?auto_655153 ?auto_655154 ?auto_655155 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_655203 - BLOCK
      ?auto_655204 - BLOCK
      ?auto_655205 - BLOCK
      ?auto_655206 - BLOCK
      ?auto_655207 - BLOCK
      ?auto_655208 - BLOCK
      ?auto_655209 - BLOCK
      ?auto_655210 - BLOCK
      ?auto_655211 - BLOCK
      ?auto_655212 - BLOCK
      ?auto_655213 - BLOCK
      ?auto_655214 - BLOCK
      ?auto_655215 - BLOCK
      ?auto_655216 - BLOCK
      ?auto_655217 - BLOCK
    )
    :vars
    (
      ?auto_655218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_655217 ?auto_655218 ) ( ON-TABLE ?auto_655203 ) ( not ( = ?auto_655203 ?auto_655204 ) ) ( not ( = ?auto_655203 ?auto_655205 ) ) ( not ( = ?auto_655203 ?auto_655206 ) ) ( not ( = ?auto_655203 ?auto_655207 ) ) ( not ( = ?auto_655203 ?auto_655208 ) ) ( not ( = ?auto_655203 ?auto_655209 ) ) ( not ( = ?auto_655203 ?auto_655210 ) ) ( not ( = ?auto_655203 ?auto_655211 ) ) ( not ( = ?auto_655203 ?auto_655212 ) ) ( not ( = ?auto_655203 ?auto_655213 ) ) ( not ( = ?auto_655203 ?auto_655214 ) ) ( not ( = ?auto_655203 ?auto_655215 ) ) ( not ( = ?auto_655203 ?auto_655216 ) ) ( not ( = ?auto_655203 ?auto_655217 ) ) ( not ( = ?auto_655203 ?auto_655218 ) ) ( not ( = ?auto_655204 ?auto_655205 ) ) ( not ( = ?auto_655204 ?auto_655206 ) ) ( not ( = ?auto_655204 ?auto_655207 ) ) ( not ( = ?auto_655204 ?auto_655208 ) ) ( not ( = ?auto_655204 ?auto_655209 ) ) ( not ( = ?auto_655204 ?auto_655210 ) ) ( not ( = ?auto_655204 ?auto_655211 ) ) ( not ( = ?auto_655204 ?auto_655212 ) ) ( not ( = ?auto_655204 ?auto_655213 ) ) ( not ( = ?auto_655204 ?auto_655214 ) ) ( not ( = ?auto_655204 ?auto_655215 ) ) ( not ( = ?auto_655204 ?auto_655216 ) ) ( not ( = ?auto_655204 ?auto_655217 ) ) ( not ( = ?auto_655204 ?auto_655218 ) ) ( not ( = ?auto_655205 ?auto_655206 ) ) ( not ( = ?auto_655205 ?auto_655207 ) ) ( not ( = ?auto_655205 ?auto_655208 ) ) ( not ( = ?auto_655205 ?auto_655209 ) ) ( not ( = ?auto_655205 ?auto_655210 ) ) ( not ( = ?auto_655205 ?auto_655211 ) ) ( not ( = ?auto_655205 ?auto_655212 ) ) ( not ( = ?auto_655205 ?auto_655213 ) ) ( not ( = ?auto_655205 ?auto_655214 ) ) ( not ( = ?auto_655205 ?auto_655215 ) ) ( not ( = ?auto_655205 ?auto_655216 ) ) ( not ( = ?auto_655205 ?auto_655217 ) ) ( not ( = ?auto_655205 ?auto_655218 ) ) ( not ( = ?auto_655206 ?auto_655207 ) ) ( not ( = ?auto_655206 ?auto_655208 ) ) ( not ( = ?auto_655206 ?auto_655209 ) ) ( not ( = ?auto_655206 ?auto_655210 ) ) ( not ( = ?auto_655206 ?auto_655211 ) ) ( not ( = ?auto_655206 ?auto_655212 ) ) ( not ( = ?auto_655206 ?auto_655213 ) ) ( not ( = ?auto_655206 ?auto_655214 ) ) ( not ( = ?auto_655206 ?auto_655215 ) ) ( not ( = ?auto_655206 ?auto_655216 ) ) ( not ( = ?auto_655206 ?auto_655217 ) ) ( not ( = ?auto_655206 ?auto_655218 ) ) ( not ( = ?auto_655207 ?auto_655208 ) ) ( not ( = ?auto_655207 ?auto_655209 ) ) ( not ( = ?auto_655207 ?auto_655210 ) ) ( not ( = ?auto_655207 ?auto_655211 ) ) ( not ( = ?auto_655207 ?auto_655212 ) ) ( not ( = ?auto_655207 ?auto_655213 ) ) ( not ( = ?auto_655207 ?auto_655214 ) ) ( not ( = ?auto_655207 ?auto_655215 ) ) ( not ( = ?auto_655207 ?auto_655216 ) ) ( not ( = ?auto_655207 ?auto_655217 ) ) ( not ( = ?auto_655207 ?auto_655218 ) ) ( not ( = ?auto_655208 ?auto_655209 ) ) ( not ( = ?auto_655208 ?auto_655210 ) ) ( not ( = ?auto_655208 ?auto_655211 ) ) ( not ( = ?auto_655208 ?auto_655212 ) ) ( not ( = ?auto_655208 ?auto_655213 ) ) ( not ( = ?auto_655208 ?auto_655214 ) ) ( not ( = ?auto_655208 ?auto_655215 ) ) ( not ( = ?auto_655208 ?auto_655216 ) ) ( not ( = ?auto_655208 ?auto_655217 ) ) ( not ( = ?auto_655208 ?auto_655218 ) ) ( not ( = ?auto_655209 ?auto_655210 ) ) ( not ( = ?auto_655209 ?auto_655211 ) ) ( not ( = ?auto_655209 ?auto_655212 ) ) ( not ( = ?auto_655209 ?auto_655213 ) ) ( not ( = ?auto_655209 ?auto_655214 ) ) ( not ( = ?auto_655209 ?auto_655215 ) ) ( not ( = ?auto_655209 ?auto_655216 ) ) ( not ( = ?auto_655209 ?auto_655217 ) ) ( not ( = ?auto_655209 ?auto_655218 ) ) ( not ( = ?auto_655210 ?auto_655211 ) ) ( not ( = ?auto_655210 ?auto_655212 ) ) ( not ( = ?auto_655210 ?auto_655213 ) ) ( not ( = ?auto_655210 ?auto_655214 ) ) ( not ( = ?auto_655210 ?auto_655215 ) ) ( not ( = ?auto_655210 ?auto_655216 ) ) ( not ( = ?auto_655210 ?auto_655217 ) ) ( not ( = ?auto_655210 ?auto_655218 ) ) ( not ( = ?auto_655211 ?auto_655212 ) ) ( not ( = ?auto_655211 ?auto_655213 ) ) ( not ( = ?auto_655211 ?auto_655214 ) ) ( not ( = ?auto_655211 ?auto_655215 ) ) ( not ( = ?auto_655211 ?auto_655216 ) ) ( not ( = ?auto_655211 ?auto_655217 ) ) ( not ( = ?auto_655211 ?auto_655218 ) ) ( not ( = ?auto_655212 ?auto_655213 ) ) ( not ( = ?auto_655212 ?auto_655214 ) ) ( not ( = ?auto_655212 ?auto_655215 ) ) ( not ( = ?auto_655212 ?auto_655216 ) ) ( not ( = ?auto_655212 ?auto_655217 ) ) ( not ( = ?auto_655212 ?auto_655218 ) ) ( not ( = ?auto_655213 ?auto_655214 ) ) ( not ( = ?auto_655213 ?auto_655215 ) ) ( not ( = ?auto_655213 ?auto_655216 ) ) ( not ( = ?auto_655213 ?auto_655217 ) ) ( not ( = ?auto_655213 ?auto_655218 ) ) ( not ( = ?auto_655214 ?auto_655215 ) ) ( not ( = ?auto_655214 ?auto_655216 ) ) ( not ( = ?auto_655214 ?auto_655217 ) ) ( not ( = ?auto_655214 ?auto_655218 ) ) ( not ( = ?auto_655215 ?auto_655216 ) ) ( not ( = ?auto_655215 ?auto_655217 ) ) ( not ( = ?auto_655215 ?auto_655218 ) ) ( not ( = ?auto_655216 ?auto_655217 ) ) ( not ( = ?auto_655216 ?auto_655218 ) ) ( not ( = ?auto_655217 ?auto_655218 ) ) ( ON ?auto_655216 ?auto_655217 ) ( ON ?auto_655215 ?auto_655216 ) ( ON ?auto_655214 ?auto_655215 ) ( ON ?auto_655213 ?auto_655214 ) ( ON ?auto_655212 ?auto_655213 ) ( ON ?auto_655211 ?auto_655212 ) ( ON ?auto_655210 ?auto_655211 ) ( ON ?auto_655209 ?auto_655210 ) ( ON ?auto_655208 ?auto_655209 ) ( ON ?auto_655207 ?auto_655208 ) ( ON ?auto_655206 ?auto_655207 ) ( ON ?auto_655205 ?auto_655206 ) ( CLEAR ?auto_655203 ) ( ON ?auto_655204 ?auto_655205 ) ( CLEAR ?auto_655204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_655203 ?auto_655204 )
      ( MAKE-15PILE ?auto_655203 ?auto_655204 ?auto_655205 ?auto_655206 ?auto_655207 ?auto_655208 ?auto_655209 ?auto_655210 ?auto_655211 ?auto_655212 ?auto_655213 ?auto_655214 ?auto_655215 ?auto_655216 ?auto_655217 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_655265 - BLOCK
      ?auto_655266 - BLOCK
      ?auto_655267 - BLOCK
      ?auto_655268 - BLOCK
      ?auto_655269 - BLOCK
      ?auto_655270 - BLOCK
      ?auto_655271 - BLOCK
      ?auto_655272 - BLOCK
      ?auto_655273 - BLOCK
      ?auto_655274 - BLOCK
      ?auto_655275 - BLOCK
      ?auto_655276 - BLOCK
      ?auto_655277 - BLOCK
      ?auto_655278 - BLOCK
      ?auto_655279 - BLOCK
    )
    :vars
    (
      ?auto_655280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_655279 ?auto_655280 ) ( not ( = ?auto_655265 ?auto_655266 ) ) ( not ( = ?auto_655265 ?auto_655267 ) ) ( not ( = ?auto_655265 ?auto_655268 ) ) ( not ( = ?auto_655265 ?auto_655269 ) ) ( not ( = ?auto_655265 ?auto_655270 ) ) ( not ( = ?auto_655265 ?auto_655271 ) ) ( not ( = ?auto_655265 ?auto_655272 ) ) ( not ( = ?auto_655265 ?auto_655273 ) ) ( not ( = ?auto_655265 ?auto_655274 ) ) ( not ( = ?auto_655265 ?auto_655275 ) ) ( not ( = ?auto_655265 ?auto_655276 ) ) ( not ( = ?auto_655265 ?auto_655277 ) ) ( not ( = ?auto_655265 ?auto_655278 ) ) ( not ( = ?auto_655265 ?auto_655279 ) ) ( not ( = ?auto_655265 ?auto_655280 ) ) ( not ( = ?auto_655266 ?auto_655267 ) ) ( not ( = ?auto_655266 ?auto_655268 ) ) ( not ( = ?auto_655266 ?auto_655269 ) ) ( not ( = ?auto_655266 ?auto_655270 ) ) ( not ( = ?auto_655266 ?auto_655271 ) ) ( not ( = ?auto_655266 ?auto_655272 ) ) ( not ( = ?auto_655266 ?auto_655273 ) ) ( not ( = ?auto_655266 ?auto_655274 ) ) ( not ( = ?auto_655266 ?auto_655275 ) ) ( not ( = ?auto_655266 ?auto_655276 ) ) ( not ( = ?auto_655266 ?auto_655277 ) ) ( not ( = ?auto_655266 ?auto_655278 ) ) ( not ( = ?auto_655266 ?auto_655279 ) ) ( not ( = ?auto_655266 ?auto_655280 ) ) ( not ( = ?auto_655267 ?auto_655268 ) ) ( not ( = ?auto_655267 ?auto_655269 ) ) ( not ( = ?auto_655267 ?auto_655270 ) ) ( not ( = ?auto_655267 ?auto_655271 ) ) ( not ( = ?auto_655267 ?auto_655272 ) ) ( not ( = ?auto_655267 ?auto_655273 ) ) ( not ( = ?auto_655267 ?auto_655274 ) ) ( not ( = ?auto_655267 ?auto_655275 ) ) ( not ( = ?auto_655267 ?auto_655276 ) ) ( not ( = ?auto_655267 ?auto_655277 ) ) ( not ( = ?auto_655267 ?auto_655278 ) ) ( not ( = ?auto_655267 ?auto_655279 ) ) ( not ( = ?auto_655267 ?auto_655280 ) ) ( not ( = ?auto_655268 ?auto_655269 ) ) ( not ( = ?auto_655268 ?auto_655270 ) ) ( not ( = ?auto_655268 ?auto_655271 ) ) ( not ( = ?auto_655268 ?auto_655272 ) ) ( not ( = ?auto_655268 ?auto_655273 ) ) ( not ( = ?auto_655268 ?auto_655274 ) ) ( not ( = ?auto_655268 ?auto_655275 ) ) ( not ( = ?auto_655268 ?auto_655276 ) ) ( not ( = ?auto_655268 ?auto_655277 ) ) ( not ( = ?auto_655268 ?auto_655278 ) ) ( not ( = ?auto_655268 ?auto_655279 ) ) ( not ( = ?auto_655268 ?auto_655280 ) ) ( not ( = ?auto_655269 ?auto_655270 ) ) ( not ( = ?auto_655269 ?auto_655271 ) ) ( not ( = ?auto_655269 ?auto_655272 ) ) ( not ( = ?auto_655269 ?auto_655273 ) ) ( not ( = ?auto_655269 ?auto_655274 ) ) ( not ( = ?auto_655269 ?auto_655275 ) ) ( not ( = ?auto_655269 ?auto_655276 ) ) ( not ( = ?auto_655269 ?auto_655277 ) ) ( not ( = ?auto_655269 ?auto_655278 ) ) ( not ( = ?auto_655269 ?auto_655279 ) ) ( not ( = ?auto_655269 ?auto_655280 ) ) ( not ( = ?auto_655270 ?auto_655271 ) ) ( not ( = ?auto_655270 ?auto_655272 ) ) ( not ( = ?auto_655270 ?auto_655273 ) ) ( not ( = ?auto_655270 ?auto_655274 ) ) ( not ( = ?auto_655270 ?auto_655275 ) ) ( not ( = ?auto_655270 ?auto_655276 ) ) ( not ( = ?auto_655270 ?auto_655277 ) ) ( not ( = ?auto_655270 ?auto_655278 ) ) ( not ( = ?auto_655270 ?auto_655279 ) ) ( not ( = ?auto_655270 ?auto_655280 ) ) ( not ( = ?auto_655271 ?auto_655272 ) ) ( not ( = ?auto_655271 ?auto_655273 ) ) ( not ( = ?auto_655271 ?auto_655274 ) ) ( not ( = ?auto_655271 ?auto_655275 ) ) ( not ( = ?auto_655271 ?auto_655276 ) ) ( not ( = ?auto_655271 ?auto_655277 ) ) ( not ( = ?auto_655271 ?auto_655278 ) ) ( not ( = ?auto_655271 ?auto_655279 ) ) ( not ( = ?auto_655271 ?auto_655280 ) ) ( not ( = ?auto_655272 ?auto_655273 ) ) ( not ( = ?auto_655272 ?auto_655274 ) ) ( not ( = ?auto_655272 ?auto_655275 ) ) ( not ( = ?auto_655272 ?auto_655276 ) ) ( not ( = ?auto_655272 ?auto_655277 ) ) ( not ( = ?auto_655272 ?auto_655278 ) ) ( not ( = ?auto_655272 ?auto_655279 ) ) ( not ( = ?auto_655272 ?auto_655280 ) ) ( not ( = ?auto_655273 ?auto_655274 ) ) ( not ( = ?auto_655273 ?auto_655275 ) ) ( not ( = ?auto_655273 ?auto_655276 ) ) ( not ( = ?auto_655273 ?auto_655277 ) ) ( not ( = ?auto_655273 ?auto_655278 ) ) ( not ( = ?auto_655273 ?auto_655279 ) ) ( not ( = ?auto_655273 ?auto_655280 ) ) ( not ( = ?auto_655274 ?auto_655275 ) ) ( not ( = ?auto_655274 ?auto_655276 ) ) ( not ( = ?auto_655274 ?auto_655277 ) ) ( not ( = ?auto_655274 ?auto_655278 ) ) ( not ( = ?auto_655274 ?auto_655279 ) ) ( not ( = ?auto_655274 ?auto_655280 ) ) ( not ( = ?auto_655275 ?auto_655276 ) ) ( not ( = ?auto_655275 ?auto_655277 ) ) ( not ( = ?auto_655275 ?auto_655278 ) ) ( not ( = ?auto_655275 ?auto_655279 ) ) ( not ( = ?auto_655275 ?auto_655280 ) ) ( not ( = ?auto_655276 ?auto_655277 ) ) ( not ( = ?auto_655276 ?auto_655278 ) ) ( not ( = ?auto_655276 ?auto_655279 ) ) ( not ( = ?auto_655276 ?auto_655280 ) ) ( not ( = ?auto_655277 ?auto_655278 ) ) ( not ( = ?auto_655277 ?auto_655279 ) ) ( not ( = ?auto_655277 ?auto_655280 ) ) ( not ( = ?auto_655278 ?auto_655279 ) ) ( not ( = ?auto_655278 ?auto_655280 ) ) ( not ( = ?auto_655279 ?auto_655280 ) ) ( ON ?auto_655278 ?auto_655279 ) ( ON ?auto_655277 ?auto_655278 ) ( ON ?auto_655276 ?auto_655277 ) ( ON ?auto_655275 ?auto_655276 ) ( ON ?auto_655274 ?auto_655275 ) ( ON ?auto_655273 ?auto_655274 ) ( ON ?auto_655272 ?auto_655273 ) ( ON ?auto_655271 ?auto_655272 ) ( ON ?auto_655270 ?auto_655271 ) ( ON ?auto_655269 ?auto_655270 ) ( ON ?auto_655268 ?auto_655269 ) ( ON ?auto_655267 ?auto_655268 ) ( ON ?auto_655266 ?auto_655267 ) ( ON ?auto_655265 ?auto_655266 ) ( CLEAR ?auto_655265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_655265 )
      ( MAKE-15PILE ?auto_655265 ?auto_655266 ?auto_655267 ?auto_655268 ?auto_655269 ?auto_655270 ?auto_655271 ?auto_655272 ?auto_655273 ?auto_655274 ?auto_655275 ?auto_655276 ?auto_655277 ?auto_655278 ?auto_655279 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_655328 - BLOCK
      ?auto_655329 - BLOCK
      ?auto_655330 - BLOCK
      ?auto_655331 - BLOCK
      ?auto_655332 - BLOCK
      ?auto_655333 - BLOCK
      ?auto_655334 - BLOCK
      ?auto_655335 - BLOCK
      ?auto_655336 - BLOCK
      ?auto_655337 - BLOCK
      ?auto_655338 - BLOCK
      ?auto_655339 - BLOCK
      ?auto_655340 - BLOCK
      ?auto_655341 - BLOCK
      ?auto_655342 - BLOCK
      ?auto_655343 - BLOCK
    )
    :vars
    (
      ?auto_655344 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_655342 ) ( ON ?auto_655343 ?auto_655344 ) ( CLEAR ?auto_655343 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_655328 ) ( ON ?auto_655329 ?auto_655328 ) ( ON ?auto_655330 ?auto_655329 ) ( ON ?auto_655331 ?auto_655330 ) ( ON ?auto_655332 ?auto_655331 ) ( ON ?auto_655333 ?auto_655332 ) ( ON ?auto_655334 ?auto_655333 ) ( ON ?auto_655335 ?auto_655334 ) ( ON ?auto_655336 ?auto_655335 ) ( ON ?auto_655337 ?auto_655336 ) ( ON ?auto_655338 ?auto_655337 ) ( ON ?auto_655339 ?auto_655338 ) ( ON ?auto_655340 ?auto_655339 ) ( ON ?auto_655341 ?auto_655340 ) ( ON ?auto_655342 ?auto_655341 ) ( not ( = ?auto_655328 ?auto_655329 ) ) ( not ( = ?auto_655328 ?auto_655330 ) ) ( not ( = ?auto_655328 ?auto_655331 ) ) ( not ( = ?auto_655328 ?auto_655332 ) ) ( not ( = ?auto_655328 ?auto_655333 ) ) ( not ( = ?auto_655328 ?auto_655334 ) ) ( not ( = ?auto_655328 ?auto_655335 ) ) ( not ( = ?auto_655328 ?auto_655336 ) ) ( not ( = ?auto_655328 ?auto_655337 ) ) ( not ( = ?auto_655328 ?auto_655338 ) ) ( not ( = ?auto_655328 ?auto_655339 ) ) ( not ( = ?auto_655328 ?auto_655340 ) ) ( not ( = ?auto_655328 ?auto_655341 ) ) ( not ( = ?auto_655328 ?auto_655342 ) ) ( not ( = ?auto_655328 ?auto_655343 ) ) ( not ( = ?auto_655328 ?auto_655344 ) ) ( not ( = ?auto_655329 ?auto_655330 ) ) ( not ( = ?auto_655329 ?auto_655331 ) ) ( not ( = ?auto_655329 ?auto_655332 ) ) ( not ( = ?auto_655329 ?auto_655333 ) ) ( not ( = ?auto_655329 ?auto_655334 ) ) ( not ( = ?auto_655329 ?auto_655335 ) ) ( not ( = ?auto_655329 ?auto_655336 ) ) ( not ( = ?auto_655329 ?auto_655337 ) ) ( not ( = ?auto_655329 ?auto_655338 ) ) ( not ( = ?auto_655329 ?auto_655339 ) ) ( not ( = ?auto_655329 ?auto_655340 ) ) ( not ( = ?auto_655329 ?auto_655341 ) ) ( not ( = ?auto_655329 ?auto_655342 ) ) ( not ( = ?auto_655329 ?auto_655343 ) ) ( not ( = ?auto_655329 ?auto_655344 ) ) ( not ( = ?auto_655330 ?auto_655331 ) ) ( not ( = ?auto_655330 ?auto_655332 ) ) ( not ( = ?auto_655330 ?auto_655333 ) ) ( not ( = ?auto_655330 ?auto_655334 ) ) ( not ( = ?auto_655330 ?auto_655335 ) ) ( not ( = ?auto_655330 ?auto_655336 ) ) ( not ( = ?auto_655330 ?auto_655337 ) ) ( not ( = ?auto_655330 ?auto_655338 ) ) ( not ( = ?auto_655330 ?auto_655339 ) ) ( not ( = ?auto_655330 ?auto_655340 ) ) ( not ( = ?auto_655330 ?auto_655341 ) ) ( not ( = ?auto_655330 ?auto_655342 ) ) ( not ( = ?auto_655330 ?auto_655343 ) ) ( not ( = ?auto_655330 ?auto_655344 ) ) ( not ( = ?auto_655331 ?auto_655332 ) ) ( not ( = ?auto_655331 ?auto_655333 ) ) ( not ( = ?auto_655331 ?auto_655334 ) ) ( not ( = ?auto_655331 ?auto_655335 ) ) ( not ( = ?auto_655331 ?auto_655336 ) ) ( not ( = ?auto_655331 ?auto_655337 ) ) ( not ( = ?auto_655331 ?auto_655338 ) ) ( not ( = ?auto_655331 ?auto_655339 ) ) ( not ( = ?auto_655331 ?auto_655340 ) ) ( not ( = ?auto_655331 ?auto_655341 ) ) ( not ( = ?auto_655331 ?auto_655342 ) ) ( not ( = ?auto_655331 ?auto_655343 ) ) ( not ( = ?auto_655331 ?auto_655344 ) ) ( not ( = ?auto_655332 ?auto_655333 ) ) ( not ( = ?auto_655332 ?auto_655334 ) ) ( not ( = ?auto_655332 ?auto_655335 ) ) ( not ( = ?auto_655332 ?auto_655336 ) ) ( not ( = ?auto_655332 ?auto_655337 ) ) ( not ( = ?auto_655332 ?auto_655338 ) ) ( not ( = ?auto_655332 ?auto_655339 ) ) ( not ( = ?auto_655332 ?auto_655340 ) ) ( not ( = ?auto_655332 ?auto_655341 ) ) ( not ( = ?auto_655332 ?auto_655342 ) ) ( not ( = ?auto_655332 ?auto_655343 ) ) ( not ( = ?auto_655332 ?auto_655344 ) ) ( not ( = ?auto_655333 ?auto_655334 ) ) ( not ( = ?auto_655333 ?auto_655335 ) ) ( not ( = ?auto_655333 ?auto_655336 ) ) ( not ( = ?auto_655333 ?auto_655337 ) ) ( not ( = ?auto_655333 ?auto_655338 ) ) ( not ( = ?auto_655333 ?auto_655339 ) ) ( not ( = ?auto_655333 ?auto_655340 ) ) ( not ( = ?auto_655333 ?auto_655341 ) ) ( not ( = ?auto_655333 ?auto_655342 ) ) ( not ( = ?auto_655333 ?auto_655343 ) ) ( not ( = ?auto_655333 ?auto_655344 ) ) ( not ( = ?auto_655334 ?auto_655335 ) ) ( not ( = ?auto_655334 ?auto_655336 ) ) ( not ( = ?auto_655334 ?auto_655337 ) ) ( not ( = ?auto_655334 ?auto_655338 ) ) ( not ( = ?auto_655334 ?auto_655339 ) ) ( not ( = ?auto_655334 ?auto_655340 ) ) ( not ( = ?auto_655334 ?auto_655341 ) ) ( not ( = ?auto_655334 ?auto_655342 ) ) ( not ( = ?auto_655334 ?auto_655343 ) ) ( not ( = ?auto_655334 ?auto_655344 ) ) ( not ( = ?auto_655335 ?auto_655336 ) ) ( not ( = ?auto_655335 ?auto_655337 ) ) ( not ( = ?auto_655335 ?auto_655338 ) ) ( not ( = ?auto_655335 ?auto_655339 ) ) ( not ( = ?auto_655335 ?auto_655340 ) ) ( not ( = ?auto_655335 ?auto_655341 ) ) ( not ( = ?auto_655335 ?auto_655342 ) ) ( not ( = ?auto_655335 ?auto_655343 ) ) ( not ( = ?auto_655335 ?auto_655344 ) ) ( not ( = ?auto_655336 ?auto_655337 ) ) ( not ( = ?auto_655336 ?auto_655338 ) ) ( not ( = ?auto_655336 ?auto_655339 ) ) ( not ( = ?auto_655336 ?auto_655340 ) ) ( not ( = ?auto_655336 ?auto_655341 ) ) ( not ( = ?auto_655336 ?auto_655342 ) ) ( not ( = ?auto_655336 ?auto_655343 ) ) ( not ( = ?auto_655336 ?auto_655344 ) ) ( not ( = ?auto_655337 ?auto_655338 ) ) ( not ( = ?auto_655337 ?auto_655339 ) ) ( not ( = ?auto_655337 ?auto_655340 ) ) ( not ( = ?auto_655337 ?auto_655341 ) ) ( not ( = ?auto_655337 ?auto_655342 ) ) ( not ( = ?auto_655337 ?auto_655343 ) ) ( not ( = ?auto_655337 ?auto_655344 ) ) ( not ( = ?auto_655338 ?auto_655339 ) ) ( not ( = ?auto_655338 ?auto_655340 ) ) ( not ( = ?auto_655338 ?auto_655341 ) ) ( not ( = ?auto_655338 ?auto_655342 ) ) ( not ( = ?auto_655338 ?auto_655343 ) ) ( not ( = ?auto_655338 ?auto_655344 ) ) ( not ( = ?auto_655339 ?auto_655340 ) ) ( not ( = ?auto_655339 ?auto_655341 ) ) ( not ( = ?auto_655339 ?auto_655342 ) ) ( not ( = ?auto_655339 ?auto_655343 ) ) ( not ( = ?auto_655339 ?auto_655344 ) ) ( not ( = ?auto_655340 ?auto_655341 ) ) ( not ( = ?auto_655340 ?auto_655342 ) ) ( not ( = ?auto_655340 ?auto_655343 ) ) ( not ( = ?auto_655340 ?auto_655344 ) ) ( not ( = ?auto_655341 ?auto_655342 ) ) ( not ( = ?auto_655341 ?auto_655343 ) ) ( not ( = ?auto_655341 ?auto_655344 ) ) ( not ( = ?auto_655342 ?auto_655343 ) ) ( not ( = ?auto_655342 ?auto_655344 ) ) ( not ( = ?auto_655343 ?auto_655344 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_655343 ?auto_655344 )
      ( !STACK ?auto_655343 ?auto_655342 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_655394 - BLOCK
      ?auto_655395 - BLOCK
      ?auto_655396 - BLOCK
      ?auto_655397 - BLOCK
      ?auto_655398 - BLOCK
      ?auto_655399 - BLOCK
      ?auto_655400 - BLOCK
      ?auto_655401 - BLOCK
      ?auto_655402 - BLOCK
      ?auto_655403 - BLOCK
      ?auto_655404 - BLOCK
      ?auto_655405 - BLOCK
      ?auto_655406 - BLOCK
      ?auto_655407 - BLOCK
      ?auto_655408 - BLOCK
      ?auto_655409 - BLOCK
    )
    :vars
    (
      ?auto_655410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_655409 ?auto_655410 ) ( ON-TABLE ?auto_655394 ) ( ON ?auto_655395 ?auto_655394 ) ( ON ?auto_655396 ?auto_655395 ) ( ON ?auto_655397 ?auto_655396 ) ( ON ?auto_655398 ?auto_655397 ) ( ON ?auto_655399 ?auto_655398 ) ( ON ?auto_655400 ?auto_655399 ) ( ON ?auto_655401 ?auto_655400 ) ( ON ?auto_655402 ?auto_655401 ) ( ON ?auto_655403 ?auto_655402 ) ( ON ?auto_655404 ?auto_655403 ) ( ON ?auto_655405 ?auto_655404 ) ( ON ?auto_655406 ?auto_655405 ) ( ON ?auto_655407 ?auto_655406 ) ( not ( = ?auto_655394 ?auto_655395 ) ) ( not ( = ?auto_655394 ?auto_655396 ) ) ( not ( = ?auto_655394 ?auto_655397 ) ) ( not ( = ?auto_655394 ?auto_655398 ) ) ( not ( = ?auto_655394 ?auto_655399 ) ) ( not ( = ?auto_655394 ?auto_655400 ) ) ( not ( = ?auto_655394 ?auto_655401 ) ) ( not ( = ?auto_655394 ?auto_655402 ) ) ( not ( = ?auto_655394 ?auto_655403 ) ) ( not ( = ?auto_655394 ?auto_655404 ) ) ( not ( = ?auto_655394 ?auto_655405 ) ) ( not ( = ?auto_655394 ?auto_655406 ) ) ( not ( = ?auto_655394 ?auto_655407 ) ) ( not ( = ?auto_655394 ?auto_655408 ) ) ( not ( = ?auto_655394 ?auto_655409 ) ) ( not ( = ?auto_655394 ?auto_655410 ) ) ( not ( = ?auto_655395 ?auto_655396 ) ) ( not ( = ?auto_655395 ?auto_655397 ) ) ( not ( = ?auto_655395 ?auto_655398 ) ) ( not ( = ?auto_655395 ?auto_655399 ) ) ( not ( = ?auto_655395 ?auto_655400 ) ) ( not ( = ?auto_655395 ?auto_655401 ) ) ( not ( = ?auto_655395 ?auto_655402 ) ) ( not ( = ?auto_655395 ?auto_655403 ) ) ( not ( = ?auto_655395 ?auto_655404 ) ) ( not ( = ?auto_655395 ?auto_655405 ) ) ( not ( = ?auto_655395 ?auto_655406 ) ) ( not ( = ?auto_655395 ?auto_655407 ) ) ( not ( = ?auto_655395 ?auto_655408 ) ) ( not ( = ?auto_655395 ?auto_655409 ) ) ( not ( = ?auto_655395 ?auto_655410 ) ) ( not ( = ?auto_655396 ?auto_655397 ) ) ( not ( = ?auto_655396 ?auto_655398 ) ) ( not ( = ?auto_655396 ?auto_655399 ) ) ( not ( = ?auto_655396 ?auto_655400 ) ) ( not ( = ?auto_655396 ?auto_655401 ) ) ( not ( = ?auto_655396 ?auto_655402 ) ) ( not ( = ?auto_655396 ?auto_655403 ) ) ( not ( = ?auto_655396 ?auto_655404 ) ) ( not ( = ?auto_655396 ?auto_655405 ) ) ( not ( = ?auto_655396 ?auto_655406 ) ) ( not ( = ?auto_655396 ?auto_655407 ) ) ( not ( = ?auto_655396 ?auto_655408 ) ) ( not ( = ?auto_655396 ?auto_655409 ) ) ( not ( = ?auto_655396 ?auto_655410 ) ) ( not ( = ?auto_655397 ?auto_655398 ) ) ( not ( = ?auto_655397 ?auto_655399 ) ) ( not ( = ?auto_655397 ?auto_655400 ) ) ( not ( = ?auto_655397 ?auto_655401 ) ) ( not ( = ?auto_655397 ?auto_655402 ) ) ( not ( = ?auto_655397 ?auto_655403 ) ) ( not ( = ?auto_655397 ?auto_655404 ) ) ( not ( = ?auto_655397 ?auto_655405 ) ) ( not ( = ?auto_655397 ?auto_655406 ) ) ( not ( = ?auto_655397 ?auto_655407 ) ) ( not ( = ?auto_655397 ?auto_655408 ) ) ( not ( = ?auto_655397 ?auto_655409 ) ) ( not ( = ?auto_655397 ?auto_655410 ) ) ( not ( = ?auto_655398 ?auto_655399 ) ) ( not ( = ?auto_655398 ?auto_655400 ) ) ( not ( = ?auto_655398 ?auto_655401 ) ) ( not ( = ?auto_655398 ?auto_655402 ) ) ( not ( = ?auto_655398 ?auto_655403 ) ) ( not ( = ?auto_655398 ?auto_655404 ) ) ( not ( = ?auto_655398 ?auto_655405 ) ) ( not ( = ?auto_655398 ?auto_655406 ) ) ( not ( = ?auto_655398 ?auto_655407 ) ) ( not ( = ?auto_655398 ?auto_655408 ) ) ( not ( = ?auto_655398 ?auto_655409 ) ) ( not ( = ?auto_655398 ?auto_655410 ) ) ( not ( = ?auto_655399 ?auto_655400 ) ) ( not ( = ?auto_655399 ?auto_655401 ) ) ( not ( = ?auto_655399 ?auto_655402 ) ) ( not ( = ?auto_655399 ?auto_655403 ) ) ( not ( = ?auto_655399 ?auto_655404 ) ) ( not ( = ?auto_655399 ?auto_655405 ) ) ( not ( = ?auto_655399 ?auto_655406 ) ) ( not ( = ?auto_655399 ?auto_655407 ) ) ( not ( = ?auto_655399 ?auto_655408 ) ) ( not ( = ?auto_655399 ?auto_655409 ) ) ( not ( = ?auto_655399 ?auto_655410 ) ) ( not ( = ?auto_655400 ?auto_655401 ) ) ( not ( = ?auto_655400 ?auto_655402 ) ) ( not ( = ?auto_655400 ?auto_655403 ) ) ( not ( = ?auto_655400 ?auto_655404 ) ) ( not ( = ?auto_655400 ?auto_655405 ) ) ( not ( = ?auto_655400 ?auto_655406 ) ) ( not ( = ?auto_655400 ?auto_655407 ) ) ( not ( = ?auto_655400 ?auto_655408 ) ) ( not ( = ?auto_655400 ?auto_655409 ) ) ( not ( = ?auto_655400 ?auto_655410 ) ) ( not ( = ?auto_655401 ?auto_655402 ) ) ( not ( = ?auto_655401 ?auto_655403 ) ) ( not ( = ?auto_655401 ?auto_655404 ) ) ( not ( = ?auto_655401 ?auto_655405 ) ) ( not ( = ?auto_655401 ?auto_655406 ) ) ( not ( = ?auto_655401 ?auto_655407 ) ) ( not ( = ?auto_655401 ?auto_655408 ) ) ( not ( = ?auto_655401 ?auto_655409 ) ) ( not ( = ?auto_655401 ?auto_655410 ) ) ( not ( = ?auto_655402 ?auto_655403 ) ) ( not ( = ?auto_655402 ?auto_655404 ) ) ( not ( = ?auto_655402 ?auto_655405 ) ) ( not ( = ?auto_655402 ?auto_655406 ) ) ( not ( = ?auto_655402 ?auto_655407 ) ) ( not ( = ?auto_655402 ?auto_655408 ) ) ( not ( = ?auto_655402 ?auto_655409 ) ) ( not ( = ?auto_655402 ?auto_655410 ) ) ( not ( = ?auto_655403 ?auto_655404 ) ) ( not ( = ?auto_655403 ?auto_655405 ) ) ( not ( = ?auto_655403 ?auto_655406 ) ) ( not ( = ?auto_655403 ?auto_655407 ) ) ( not ( = ?auto_655403 ?auto_655408 ) ) ( not ( = ?auto_655403 ?auto_655409 ) ) ( not ( = ?auto_655403 ?auto_655410 ) ) ( not ( = ?auto_655404 ?auto_655405 ) ) ( not ( = ?auto_655404 ?auto_655406 ) ) ( not ( = ?auto_655404 ?auto_655407 ) ) ( not ( = ?auto_655404 ?auto_655408 ) ) ( not ( = ?auto_655404 ?auto_655409 ) ) ( not ( = ?auto_655404 ?auto_655410 ) ) ( not ( = ?auto_655405 ?auto_655406 ) ) ( not ( = ?auto_655405 ?auto_655407 ) ) ( not ( = ?auto_655405 ?auto_655408 ) ) ( not ( = ?auto_655405 ?auto_655409 ) ) ( not ( = ?auto_655405 ?auto_655410 ) ) ( not ( = ?auto_655406 ?auto_655407 ) ) ( not ( = ?auto_655406 ?auto_655408 ) ) ( not ( = ?auto_655406 ?auto_655409 ) ) ( not ( = ?auto_655406 ?auto_655410 ) ) ( not ( = ?auto_655407 ?auto_655408 ) ) ( not ( = ?auto_655407 ?auto_655409 ) ) ( not ( = ?auto_655407 ?auto_655410 ) ) ( not ( = ?auto_655408 ?auto_655409 ) ) ( not ( = ?auto_655408 ?auto_655410 ) ) ( not ( = ?auto_655409 ?auto_655410 ) ) ( CLEAR ?auto_655407 ) ( ON ?auto_655408 ?auto_655409 ) ( CLEAR ?auto_655408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_655394 ?auto_655395 ?auto_655396 ?auto_655397 ?auto_655398 ?auto_655399 ?auto_655400 ?auto_655401 ?auto_655402 ?auto_655403 ?auto_655404 ?auto_655405 ?auto_655406 ?auto_655407 ?auto_655408 )
      ( MAKE-16PILE ?auto_655394 ?auto_655395 ?auto_655396 ?auto_655397 ?auto_655398 ?auto_655399 ?auto_655400 ?auto_655401 ?auto_655402 ?auto_655403 ?auto_655404 ?auto_655405 ?auto_655406 ?auto_655407 ?auto_655408 ?auto_655409 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_655460 - BLOCK
      ?auto_655461 - BLOCK
      ?auto_655462 - BLOCK
      ?auto_655463 - BLOCK
      ?auto_655464 - BLOCK
      ?auto_655465 - BLOCK
      ?auto_655466 - BLOCK
      ?auto_655467 - BLOCK
      ?auto_655468 - BLOCK
      ?auto_655469 - BLOCK
      ?auto_655470 - BLOCK
      ?auto_655471 - BLOCK
      ?auto_655472 - BLOCK
      ?auto_655473 - BLOCK
      ?auto_655474 - BLOCK
      ?auto_655475 - BLOCK
    )
    :vars
    (
      ?auto_655476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_655475 ?auto_655476 ) ( ON-TABLE ?auto_655460 ) ( ON ?auto_655461 ?auto_655460 ) ( ON ?auto_655462 ?auto_655461 ) ( ON ?auto_655463 ?auto_655462 ) ( ON ?auto_655464 ?auto_655463 ) ( ON ?auto_655465 ?auto_655464 ) ( ON ?auto_655466 ?auto_655465 ) ( ON ?auto_655467 ?auto_655466 ) ( ON ?auto_655468 ?auto_655467 ) ( ON ?auto_655469 ?auto_655468 ) ( ON ?auto_655470 ?auto_655469 ) ( ON ?auto_655471 ?auto_655470 ) ( ON ?auto_655472 ?auto_655471 ) ( not ( = ?auto_655460 ?auto_655461 ) ) ( not ( = ?auto_655460 ?auto_655462 ) ) ( not ( = ?auto_655460 ?auto_655463 ) ) ( not ( = ?auto_655460 ?auto_655464 ) ) ( not ( = ?auto_655460 ?auto_655465 ) ) ( not ( = ?auto_655460 ?auto_655466 ) ) ( not ( = ?auto_655460 ?auto_655467 ) ) ( not ( = ?auto_655460 ?auto_655468 ) ) ( not ( = ?auto_655460 ?auto_655469 ) ) ( not ( = ?auto_655460 ?auto_655470 ) ) ( not ( = ?auto_655460 ?auto_655471 ) ) ( not ( = ?auto_655460 ?auto_655472 ) ) ( not ( = ?auto_655460 ?auto_655473 ) ) ( not ( = ?auto_655460 ?auto_655474 ) ) ( not ( = ?auto_655460 ?auto_655475 ) ) ( not ( = ?auto_655460 ?auto_655476 ) ) ( not ( = ?auto_655461 ?auto_655462 ) ) ( not ( = ?auto_655461 ?auto_655463 ) ) ( not ( = ?auto_655461 ?auto_655464 ) ) ( not ( = ?auto_655461 ?auto_655465 ) ) ( not ( = ?auto_655461 ?auto_655466 ) ) ( not ( = ?auto_655461 ?auto_655467 ) ) ( not ( = ?auto_655461 ?auto_655468 ) ) ( not ( = ?auto_655461 ?auto_655469 ) ) ( not ( = ?auto_655461 ?auto_655470 ) ) ( not ( = ?auto_655461 ?auto_655471 ) ) ( not ( = ?auto_655461 ?auto_655472 ) ) ( not ( = ?auto_655461 ?auto_655473 ) ) ( not ( = ?auto_655461 ?auto_655474 ) ) ( not ( = ?auto_655461 ?auto_655475 ) ) ( not ( = ?auto_655461 ?auto_655476 ) ) ( not ( = ?auto_655462 ?auto_655463 ) ) ( not ( = ?auto_655462 ?auto_655464 ) ) ( not ( = ?auto_655462 ?auto_655465 ) ) ( not ( = ?auto_655462 ?auto_655466 ) ) ( not ( = ?auto_655462 ?auto_655467 ) ) ( not ( = ?auto_655462 ?auto_655468 ) ) ( not ( = ?auto_655462 ?auto_655469 ) ) ( not ( = ?auto_655462 ?auto_655470 ) ) ( not ( = ?auto_655462 ?auto_655471 ) ) ( not ( = ?auto_655462 ?auto_655472 ) ) ( not ( = ?auto_655462 ?auto_655473 ) ) ( not ( = ?auto_655462 ?auto_655474 ) ) ( not ( = ?auto_655462 ?auto_655475 ) ) ( not ( = ?auto_655462 ?auto_655476 ) ) ( not ( = ?auto_655463 ?auto_655464 ) ) ( not ( = ?auto_655463 ?auto_655465 ) ) ( not ( = ?auto_655463 ?auto_655466 ) ) ( not ( = ?auto_655463 ?auto_655467 ) ) ( not ( = ?auto_655463 ?auto_655468 ) ) ( not ( = ?auto_655463 ?auto_655469 ) ) ( not ( = ?auto_655463 ?auto_655470 ) ) ( not ( = ?auto_655463 ?auto_655471 ) ) ( not ( = ?auto_655463 ?auto_655472 ) ) ( not ( = ?auto_655463 ?auto_655473 ) ) ( not ( = ?auto_655463 ?auto_655474 ) ) ( not ( = ?auto_655463 ?auto_655475 ) ) ( not ( = ?auto_655463 ?auto_655476 ) ) ( not ( = ?auto_655464 ?auto_655465 ) ) ( not ( = ?auto_655464 ?auto_655466 ) ) ( not ( = ?auto_655464 ?auto_655467 ) ) ( not ( = ?auto_655464 ?auto_655468 ) ) ( not ( = ?auto_655464 ?auto_655469 ) ) ( not ( = ?auto_655464 ?auto_655470 ) ) ( not ( = ?auto_655464 ?auto_655471 ) ) ( not ( = ?auto_655464 ?auto_655472 ) ) ( not ( = ?auto_655464 ?auto_655473 ) ) ( not ( = ?auto_655464 ?auto_655474 ) ) ( not ( = ?auto_655464 ?auto_655475 ) ) ( not ( = ?auto_655464 ?auto_655476 ) ) ( not ( = ?auto_655465 ?auto_655466 ) ) ( not ( = ?auto_655465 ?auto_655467 ) ) ( not ( = ?auto_655465 ?auto_655468 ) ) ( not ( = ?auto_655465 ?auto_655469 ) ) ( not ( = ?auto_655465 ?auto_655470 ) ) ( not ( = ?auto_655465 ?auto_655471 ) ) ( not ( = ?auto_655465 ?auto_655472 ) ) ( not ( = ?auto_655465 ?auto_655473 ) ) ( not ( = ?auto_655465 ?auto_655474 ) ) ( not ( = ?auto_655465 ?auto_655475 ) ) ( not ( = ?auto_655465 ?auto_655476 ) ) ( not ( = ?auto_655466 ?auto_655467 ) ) ( not ( = ?auto_655466 ?auto_655468 ) ) ( not ( = ?auto_655466 ?auto_655469 ) ) ( not ( = ?auto_655466 ?auto_655470 ) ) ( not ( = ?auto_655466 ?auto_655471 ) ) ( not ( = ?auto_655466 ?auto_655472 ) ) ( not ( = ?auto_655466 ?auto_655473 ) ) ( not ( = ?auto_655466 ?auto_655474 ) ) ( not ( = ?auto_655466 ?auto_655475 ) ) ( not ( = ?auto_655466 ?auto_655476 ) ) ( not ( = ?auto_655467 ?auto_655468 ) ) ( not ( = ?auto_655467 ?auto_655469 ) ) ( not ( = ?auto_655467 ?auto_655470 ) ) ( not ( = ?auto_655467 ?auto_655471 ) ) ( not ( = ?auto_655467 ?auto_655472 ) ) ( not ( = ?auto_655467 ?auto_655473 ) ) ( not ( = ?auto_655467 ?auto_655474 ) ) ( not ( = ?auto_655467 ?auto_655475 ) ) ( not ( = ?auto_655467 ?auto_655476 ) ) ( not ( = ?auto_655468 ?auto_655469 ) ) ( not ( = ?auto_655468 ?auto_655470 ) ) ( not ( = ?auto_655468 ?auto_655471 ) ) ( not ( = ?auto_655468 ?auto_655472 ) ) ( not ( = ?auto_655468 ?auto_655473 ) ) ( not ( = ?auto_655468 ?auto_655474 ) ) ( not ( = ?auto_655468 ?auto_655475 ) ) ( not ( = ?auto_655468 ?auto_655476 ) ) ( not ( = ?auto_655469 ?auto_655470 ) ) ( not ( = ?auto_655469 ?auto_655471 ) ) ( not ( = ?auto_655469 ?auto_655472 ) ) ( not ( = ?auto_655469 ?auto_655473 ) ) ( not ( = ?auto_655469 ?auto_655474 ) ) ( not ( = ?auto_655469 ?auto_655475 ) ) ( not ( = ?auto_655469 ?auto_655476 ) ) ( not ( = ?auto_655470 ?auto_655471 ) ) ( not ( = ?auto_655470 ?auto_655472 ) ) ( not ( = ?auto_655470 ?auto_655473 ) ) ( not ( = ?auto_655470 ?auto_655474 ) ) ( not ( = ?auto_655470 ?auto_655475 ) ) ( not ( = ?auto_655470 ?auto_655476 ) ) ( not ( = ?auto_655471 ?auto_655472 ) ) ( not ( = ?auto_655471 ?auto_655473 ) ) ( not ( = ?auto_655471 ?auto_655474 ) ) ( not ( = ?auto_655471 ?auto_655475 ) ) ( not ( = ?auto_655471 ?auto_655476 ) ) ( not ( = ?auto_655472 ?auto_655473 ) ) ( not ( = ?auto_655472 ?auto_655474 ) ) ( not ( = ?auto_655472 ?auto_655475 ) ) ( not ( = ?auto_655472 ?auto_655476 ) ) ( not ( = ?auto_655473 ?auto_655474 ) ) ( not ( = ?auto_655473 ?auto_655475 ) ) ( not ( = ?auto_655473 ?auto_655476 ) ) ( not ( = ?auto_655474 ?auto_655475 ) ) ( not ( = ?auto_655474 ?auto_655476 ) ) ( not ( = ?auto_655475 ?auto_655476 ) ) ( ON ?auto_655474 ?auto_655475 ) ( CLEAR ?auto_655472 ) ( ON ?auto_655473 ?auto_655474 ) ( CLEAR ?auto_655473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_655460 ?auto_655461 ?auto_655462 ?auto_655463 ?auto_655464 ?auto_655465 ?auto_655466 ?auto_655467 ?auto_655468 ?auto_655469 ?auto_655470 ?auto_655471 ?auto_655472 ?auto_655473 )
      ( MAKE-16PILE ?auto_655460 ?auto_655461 ?auto_655462 ?auto_655463 ?auto_655464 ?auto_655465 ?auto_655466 ?auto_655467 ?auto_655468 ?auto_655469 ?auto_655470 ?auto_655471 ?auto_655472 ?auto_655473 ?auto_655474 ?auto_655475 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_655526 - BLOCK
      ?auto_655527 - BLOCK
      ?auto_655528 - BLOCK
      ?auto_655529 - BLOCK
      ?auto_655530 - BLOCK
      ?auto_655531 - BLOCK
      ?auto_655532 - BLOCK
      ?auto_655533 - BLOCK
      ?auto_655534 - BLOCK
      ?auto_655535 - BLOCK
      ?auto_655536 - BLOCK
      ?auto_655537 - BLOCK
      ?auto_655538 - BLOCK
      ?auto_655539 - BLOCK
      ?auto_655540 - BLOCK
      ?auto_655541 - BLOCK
    )
    :vars
    (
      ?auto_655542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_655541 ?auto_655542 ) ( ON-TABLE ?auto_655526 ) ( ON ?auto_655527 ?auto_655526 ) ( ON ?auto_655528 ?auto_655527 ) ( ON ?auto_655529 ?auto_655528 ) ( ON ?auto_655530 ?auto_655529 ) ( ON ?auto_655531 ?auto_655530 ) ( ON ?auto_655532 ?auto_655531 ) ( ON ?auto_655533 ?auto_655532 ) ( ON ?auto_655534 ?auto_655533 ) ( ON ?auto_655535 ?auto_655534 ) ( ON ?auto_655536 ?auto_655535 ) ( ON ?auto_655537 ?auto_655536 ) ( not ( = ?auto_655526 ?auto_655527 ) ) ( not ( = ?auto_655526 ?auto_655528 ) ) ( not ( = ?auto_655526 ?auto_655529 ) ) ( not ( = ?auto_655526 ?auto_655530 ) ) ( not ( = ?auto_655526 ?auto_655531 ) ) ( not ( = ?auto_655526 ?auto_655532 ) ) ( not ( = ?auto_655526 ?auto_655533 ) ) ( not ( = ?auto_655526 ?auto_655534 ) ) ( not ( = ?auto_655526 ?auto_655535 ) ) ( not ( = ?auto_655526 ?auto_655536 ) ) ( not ( = ?auto_655526 ?auto_655537 ) ) ( not ( = ?auto_655526 ?auto_655538 ) ) ( not ( = ?auto_655526 ?auto_655539 ) ) ( not ( = ?auto_655526 ?auto_655540 ) ) ( not ( = ?auto_655526 ?auto_655541 ) ) ( not ( = ?auto_655526 ?auto_655542 ) ) ( not ( = ?auto_655527 ?auto_655528 ) ) ( not ( = ?auto_655527 ?auto_655529 ) ) ( not ( = ?auto_655527 ?auto_655530 ) ) ( not ( = ?auto_655527 ?auto_655531 ) ) ( not ( = ?auto_655527 ?auto_655532 ) ) ( not ( = ?auto_655527 ?auto_655533 ) ) ( not ( = ?auto_655527 ?auto_655534 ) ) ( not ( = ?auto_655527 ?auto_655535 ) ) ( not ( = ?auto_655527 ?auto_655536 ) ) ( not ( = ?auto_655527 ?auto_655537 ) ) ( not ( = ?auto_655527 ?auto_655538 ) ) ( not ( = ?auto_655527 ?auto_655539 ) ) ( not ( = ?auto_655527 ?auto_655540 ) ) ( not ( = ?auto_655527 ?auto_655541 ) ) ( not ( = ?auto_655527 ?auto_655542 ) ) ( not ( = ?auto_655528 ?auto_655529 ) ) ( not ( = ?auto_655528 ?auto_655530 ) ) ( not ( = ?auto_655528 ?auto_655531 ) ) ( not ( = ?auto_655528 ?auto_655532 ) ) ( not ( = ?auto_655528 ?auto_655533 ) ) ( not ( = ?auto_655528 ?auto_655534 ) ) ( not ( = ?auto_655528 ?auto_655535 ) ) ( not ( = ?auto_655528 ?auto_655536 ) ) ( not ( = ?auto_655528 ?auto_655537 ) ) ( not ( = ?auto_655528 ?auto_655538 ) ) ( not ( = ?auto_655528 ?auto_655539 ) ) ( not ( = ?auto_655528 ?auto_655540 ) ) ( not ( = ?auto_655528 ?auto_655541 ) ) ( not ( = ?auto_655528 ?auto_655542 ) ) ( not ( = ?auto_655529 ?auto_655530 ) ) ( not ( = ?auto_655529 ?auto_655531 ) ) ( not ( = ?auto_655529 ?auto_655532 ) ) ( not ( = ?auto_655529 ?auto_655533 ) ) ( not ( = ?auto_655529 ?auto_655534 ) ) ( not ( = ?auto_655529 ?auto_655535 ) ) ( not ( = ?auto_655529 ?auto_655536 ) ) ( not ( = ?auto_655529 ?auto_655537 ) ) ( not ( = ?auto_655529 ?auto_655538 ) ) ( not ( = ?auto_655529 ?auto_655539 ) ) ( not ( = ?auto_655529 ?auto_655540 ) ) ( not ( = ?auto_655529 ?auto_655541 ) ) ( not ( = ?auto_655529 ?auto_655542 ) ) ( not ( = ?auto_655530 ?auto_655531 ) ) ( not ( = ?auto_655530 ?auto_655532 ) ) ( not ( = ?auto_655530 ?auto_655533 ) ) ( not ( = ?auto_655530 ?auto_655534 ) ) ( not ( = ?auto_655530 ?auto_655535 ) ) ( not ( = ?auto_655530 ?auto_655536 ) ) ( not ( = ?auto_655530 ?auto_655537 ) ) ( not ( = ?auto_655530 ?auto_655538 ) ) ( not ( = ?auto_655530 ?auto_655539 ) ) ( not ( = ?auto_655530 ?auto_655540 ) ) ( not ( = ?auto_655530 ?auto_655541 ) ) ( not ( = ?auto_655530 ?auto_655542 ) ) ( not ( = ?auto_655531 ?auto_655532 ) ) ( not ( = ?auto_655531 ?auto_655533 ) ) ( not ( = ?auto_655531 ?auto_655534 ) ) ( not ( = ?auto_655531 ?auto_655535 ) ) ( not ( = ?auto_655531 ?auto_655536 ) ) ( not ( = ?auto_655531 ?auto_655537 ) ) ( not ( = ?auto_655531 ?auto_655538 ) ) ( not ( = ?auto_655531 ?auto_655539 ) ) ( not ( = ?auto_655531 ?auto_655540 ) ) ( not ( = ?auto_655531 ?auto_655541 ) ) ( not ( = ?auto_655531 ?auto_655542 ) ) ( not ( = ?auto_655532 ?auto_655533 ) ) ( not ( = ?auto_655532 ?auto_655534 ) ) ( not ( = ?auto_655532 ?auto_655535 ) ) ( not ( = ?auto_655532 ?auto_655536 ) ) ( not ( = ?auto_655532 ?auto_655537 ) ) ( not ( = ?auto_655532 ?auto_655538 ) ) ( not ( = ?auto_655532 ?auto_655539 ) ) ( not ( = ?auto_655532 ?auto_655540 ) ) ( not ( = ?auto_655532 ?auto_655541 ) ) ( not ( = ?auto_655532 ?auto_655542 ) ) ( not ( = ?auto_655533 ?auto_655534 ) ) ( not ( = ?auto_655533 ?auto_655535 ) ) ( not ( = ?auto_655533 ?auto_655536 ) ) ( not ( = ?auto_655533 ?auto_655537 ) ) ( not ( = ?auto_655533 ?auto_655538 ) ) ( not ( = ?auto_655533 ?auto_655539 ) ) ( not ( = ?auto_655533 ?auto_655540 ) ) ( not ( = ?auto_655533 ?auto_655541 ) ) ( not ( = ?auto_655533 ?auto_655542 ) ) ( not ( = ?auto_655534 ?auto_655535 ) ) ( not ( = ?auto_655534 ?auto_655536 ) ) ( not ( = ?auto_655534 ?auto_655537 ) ) ( not ( = ?auto_655534 ?auto_655538 ) ) ( not ( = ?auto_655534 ?auto_655539 ) ) ( not ( = ?auto_655534 ?auto_655540 ) ) ( not ( = ?auto_655534 ?auto_655541 ) ) ( not ( = ?auto_655534 ?auto_655542 ) ) ( not ( = ?auto_655535 ?auto_655536 ) ) ( not ( = ?auto_655535 ?auto_655537 ) ) ( not ( = ?auto_655535 ?auto_655538 ) ) ( not ( = ?auto_655535 ?auto_655539 ) ) ( not ( = ?auto_655535 ?auto_655540 ) ) ( not ( = ?auto_655535 ?auto_655541 ) ) ( not ( = ?auto_655535 ?auto_655542 ) ) ( not ( = ?auto_655536 ?auto_655537 ) ) ( not ( = ?auto_655536 ?auto_655538 ) ) ( not ( = ?auto_655536 ?auto_655539 ) ) ( not ( = ?auto_655536 ?auto_655540 ) ) ( not ( = ?auto_655536 ?auto_655541 ) ) ( not ( = ?auto_655536 ?auto_655542 ) ) ( not ( = ?auto_655537 ?auto_655538 ) ) ( not ( = ?auto_655537 ?auto_655539 ) ) ( not ( = ?auto_655537 ?auto_655540 ) ) ( not ( = ?auto_655537 ?auto_655541 ) ) ( not ( = ?auto_655537 ?auto_655542 ) ) ( not ( = ?auto_655538 ?auto_655539 ) ) ( not ( = ?auto_655538 ?auto_655540 ) ) ( not ( = ?auto_655538 ?auto_655541 ) ) ( not ( = ?auto_655538 ?auto_655542 ) ) ( not ( = ?auto_655539 ?auto_655540 ) ) ( not ( = ?auto_655539 ?auto_655541 ) ) ( not ( = ?auto_655539 ?auto_655542 ) ) ( not ( = ?auto_655540 ?auto_655541 ) ) ( not ( = ?auto_655540 ?auto_655542 ) ) ( not ( = ?auto_655541 ?auto_655542 ) ) ( ON ?auto_655540 ?auto_655541 ) ( ON ?auto_655539 ?auto_655540 ) ( CLEAR ?auto_655537 ) ( ON ?auto_655538 ?auto_655539 ) ( CLEAR ?auto_655538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_655526 ?auto_655527 ?auto_655528 ?auto_655529 ?auto_655530 ?auto_655531 ?auto_655532 ?auto_655533 ?auto_655534 ?auto_655535 ?auto_655536 ?auto_655537 ?auto_655538 )
      ( MAKE-16PILE ?auto_655526 ?auto_655527 ?auto_655528 ?auto_655529 ?auto_655530 ?auto_655531 ?auto_655532 ?auto_655533 ?auto_655534 ?auto_655535 ?auto_655536 ?auto_655537 ?auto_655538 ?auto_655539 ?auto_655540 ?auto_655541 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_655592 - BLOCK
      ?auto_655593 - BLOCK
      ?auto_655594 - BLOCK
      ?auto_655595 - BLOCK
      ?auto_655596 - BLOCK
      ?auto_655597 - BLOCK
      ?auto_655598 - BLOCK
      ?auto_655599 - BLOCK
      ?auto_655600 - BLOCK
      ?auto_655601 - BLOCK
      ?auto_655602 - BLOCK
      ?auto_655603 - BLOCK
      ?auto_655604 - BLOCK
      ?auto_655605 - BLOCK
      ?auto_655606 - BLOCK
      ?auto_655607 - BLOCK
    )
    :vars
    (
      ?auto_655608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_655607 ?auto_655608 ) ( ON-TABLE ?auto_655592 ) ( ON ?auto_655593 ?auto_655592 ) ( ON ?auto_655594 ?auto_655593 ) ( ON ?auto_655595 ?auto_655594 ) ( ON ?auto_655596 ?auto_655595 ) ( ON ?auto_655597 ?auto_655596 ) ( ON ?auto_655598 ?auto_655597 ) ( ON ?auto_655599 ?auto_655598 ) ( ON ?auto_655600 ?auto_655599 ) ( ON ?auto_655601 ?auto_655600 ) ( ON ?auto_655602 ?auto_655601 ) ( not ( = ?auto_655592 ?auto_655593 ) ) ( not ( = ?auto_655592 ?auto_655594 ) ) ( not ( = ?auto_655592 ?auto_655595 ) ) ( not ( = ?auto_655592 ?auto_655596 ) ) ( not ( = ?auto_655592 ?auto_655597 ) ) ( not ( = ?auto_655592 ?auto_655598 ) ) ( not ( = ?auto_655592 ?auto_655599 ) ) ( not ( = ?auto_655592 ?auto_655600 ) ) ( not ( = ?auto_655592 ?auto_655601 ) ) ( not ( = ?auto_655592 ?auto_655602 ) ) ( not ( = ?auto_655592 ?auto_655603 ) ) ( not ( = ?auto_655592 ?auto_655604 ) ) ( not ( = ?auto_655592 ?auto_655605 ) ) ( not ( = ?auto_655592 ?auto_655606 ) ) ( not ( = ?auto_655592 ?auto_655607 ) ) ( not ( = ?auto_655592 ?auto_655608 ) ) ( not ( = ?auto_655593 ?auto_655594 ) ) ( not ( = ?auto_655593 ?auto_655595 ) ) ( not ( = ?auto_655593 ?auto_655596 ) ) ( not ( = ?auto_655593 ?auto_655597 ) ) ( not ( = ?auto_655593 ?auto_655598 ) ) ( not ( = ?auto_655593 ?auto_655599 ) ) ( not ( = ?auto_655593 ?auto_655600 ) ) ( not ( = ?auto_655593 ?auto_655601 ) ) ( not ( = ?auto_655593 ?auto_655602 ) ) ( not ( = ?auto_655593 ?auto_655603 ) ) ( not ( = ?auto_655593 ?auto_655604 ) ) ( not ( = ?auto_655593 ?auto_655605 ) ) ( not ( = ?auto_655593 ?auto_655606 ) ) ( not ( = ?auto_655593 ?auto_655607 ) ) ( not ( = ?auto_655593 ?auto_655608 ) ) ( not ( = ?auto_655594 ?auto_655595 ) ) ( not ( = ?auto_655594 ?auto_655596 ) ) ( not ( = ?auto_655594 ?auto_655597 ) ) ( not ( = ?auto_655594 ?auto_655598 ) ) ( not ( = ?auto_655594 ?auto_655599 ) ) ( not ( = ?auto_655594 ?auto_655600 ) ) ( not ( = ?auto_655594 ?auto_655601 ) ) ( not ( = ?auto_655594 ?auto_655602 ) ) ( not ( = ?auto_655594 ?auto_655603 ) ) ( not ( = ?auto_655594 ?auto_655604 ) ) ( not ( = ?auto_655594 ?auto_655605 ) ) ( not ( = ?auto_655594 ?auto_655606 ) ) ( not ( = ?auto_655594 ?auto_655607 ) ) ( not ( = ?auto_655594 ?auto_655608 ) ) ( not ( = ?auto_655595 ?auto_655596 ) ) ( not ( = ?auto_655595 ?auto_655597 ) ) ( not ( = ?auto_655595 ?auto_655598 ) ) ( not ( = ?auto_655595 ?auto_655599 ) ) ( not ( = ?auto_655595 ?auto_655600 ) ) ( not ( = ?auto_655595 ?auto_655601 ) ) ( not ( = ?auto_655595 ?auto_655602 ) ) ( not ( = ?auto_655595 ?auto_655603 ) ) ( not ( = ?auto_655595 ?auto_655604 ) ) ( not ( = ?auto_655595 ?auto_655605 ) ) ( not ( = ?auto_655595 ?auto_655606 ) ) ( not ( = ?auto_655595 ?auto_655607 ) ) ( not ( = ?auto_655595 ?auto_655608 ) ) ( not ( = ?auto_655596 ?auto_655597 ) ) ( not ( = ?auto_655596 ?auto_655598 ) ) ( not ( = ?auto_655596 ?auto_655599 ) ) ( not ( = ?auto_655596 ?auto_655600 ) ) ( not ( = ?auto_655596 ?auto_655601 ) ) ( not ( = ?auto_655596 ?auto_655602 ) ) ( not ( = ?auto_655596 ?auto_655603 ) ) ( not ( = ?auto_655596 ?auto_655604 ) ) ( not ( = ?auto_655596 ?auto_655605 ) ) ( not ( = ?auto_655596 ?auto_655606 ) ) ( not ( = ?auto_655596 ?auto_655607 ) ) ( not ( = ?auto_655596 ?auto_655608 ) ) ( not ( = ?auto_655597 ?auto_655598 ) ) ( not ( = ?auto_655597 ?auto_655599 ) ) ( not ( = ?auto_655597 ?auto_655600 ) ) ( not ( = ?auto_655597 ?auto_655601 ) ) ( not ( = ?auto_655597 ?auto_655602 ) ) ( not ( = ?auto_655597 ?auto_655603 ) ) ( not ( = ?auto_655597 ?auto_655604 ) ) ( not ( = ?auto_655597 ?auto_655605 ) ) ( not ( = ?auto_655597 ?auto_655606 ) ) ( not ( = ?auto_655597 ?auto_655607 ) ) ( not ( = ?auto_655597 ?auto_655608 ) ) ( not ( = ?auto_655598 ?auto_655599 ) ) ( not ( = ?auto_655598 ?auto_655600 ) ) ( not ( = ?auto_655598 ?auto_655601 ) ) ( not ( = ?auto_655598 ?auto_655602 ) ) ( not ( = ?auto_655598 ?auto_655603 ) ) ( not ( = ?auto_655598 ?auto_655604 ) ) ( not ( = ?auto_655598 ?auto_655605 ) ) ( not ( = ?auto_655598 ?auto_655606 ) ) ( not ( = ?auto_655598 ?auto_655607 ) ) ( not ( = ?auto_655598 ?auto_655608 ) ) ( not ( = ?auto_655599 ?auto_655600 ) ) ( not ( = ?auto_655599 ?auto_655601 ) ) ( not ( = ?auto_655599 ?auto_655602 ) ) ( not ( = ?auto_655599 ?auto_655603 ) ) ( not ( = ?auto_655599 ?auto_655604 ) ) ( not ( = ?auto_655599 ?auto_655605 ) ) ( not ( = ?auto_655599 ?auto_655606 ) ) ( not ( = ?auto_655599 ?auto_655607 ) ) ( not ( = ?auto_655599 ?auto_655608 ) ) ( not ( = ?auto_655600 ?auto_655601 ) ) ( not ( = ?auto_655600 ?auto_655602 ) ) ( not ( = ?auto_655600 ?auto_655603 ) ) ( not ( = ?auto_655600 ?auto_655604 ) ) ( not ( = ?auto_655600 ?auto_655605 ) ) ( not ( = ?auto_655600 ?auto_655606 ) ) ( not ( = ?auto_655600 ?auto_655607 ) ) ( not ( = ?auto_655600 ?auto_655608 ) ) ( not ( = ?auto_655601 ?auto_655602 ) ) ( not ( = ?auto_655601 ?auto_655603 ) ) ( not ( = ?auto_655601 ?auto_655604 ) ) ( not ( = ?auto_655601 ?auto_655605 ) ) ( not ( = ?auto_655601 ?auto_655606 ) ) ( not ( = ?auto_655601 ?auto_655607 ) ) ( not ( = ?auto_655601 ?auto_655608 ) ) ( not ( = ?auto_655602 ?auto_655603 ) ) ( not ( = ?auto_655602 ?auto_655604 ) ) ( not ( = ?auto_655602 ?auto_655605 ) ) ( not ( = ?auto_655602 ?auto_655606 ) ) ( not ( = ?auto_655602 ?auto_655607 ) ) ( not ( = ?auto_655602 ?auto_655608 ) ) ( not ( = ?auto_655603 ?auto_655604 ) ) ( not ( = ?auto_655603 ?auto_655605 ) ) ( not ( = ?auto_655603 ?auto_655606 ) ) ( not ( = ?auto_655603 ?auto_655607 ) ) ( not ( = ?auto_655603 ?auto_655608 ) ) ( not ( = ?auto_655604 ?auto_655605 ) ) ( not ( = ?auto_655604 ?auto_655606 ) ) ( not ( = ?auto_655604 ?auto_655607 ) ) ( not ( = ?auto_655604 ?auto_655608 ) ) ( not ( = ?auto_655605 ?auto_655606 ) ) ( not ( = ?auto_655605 ?auto_655607 ) ) ( not ( = ?auto_655605 ?auto_655608 ) ) ( not ( = ?auto_655606 ?auto_655607 ) ) ( not ( = ?auto_655606 ?auto_655608 ) ) ( not ( = ?auto_655607 ?auto_655608 ) ) ( ON ?auto_655606 ?auto_655607 ) ( ON ?auto_655605 ?auto_655606 ) ( ON ?auto_655604 ?auto_655605 ) ( CLEAR ?auto_655602 ) ( ON ?auto_655603 ?auto_655604 ) ( CLEAR ?auto_655603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_655592 ?auto_655593 ?auto_655594 ?auto_655595 ?auto_655596 ?auto_655597 ?auto_655598 ?auto_655599 ?auto_655600 ?auto_655601 ?auto_655602 ?auto_655603 )
      ( MAKE-16PILE ?auto_655592 ?auto_655593 ?auto_655594 ?auto_655595 ?auto_655596 ?auto_655597 ?auto_655598 ?auto_655599 ?auto_655600 ?auto_655601 ?auto_655602 ?auto_655603 ?auto_655604 ?auto_655605 ?auto_655606 ?auto_655607 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_655658 - BLOCK
      ?auto_655659 - BLOCK
      ?auto_655660 - BLOCK
      ?auto_655661 - BLOCK
      ?auto_655662 - BLOCK
      ?auto_655663 - BLOCK
      ?auto_655664 - BLOCK
      ?auto_655665 - BLOCK
      ?auto_655666 - BLOCK
      ?auto_655667 - BLOCK
      ?auto_655668 - BLOCK
      ?auto_655669 - BLOCK
      ?auto_655670 - BLOCK
      ?auto_655671 - BLOCK
      ?auto_655672 - BLOCK
      ?auto_655673 - BLOCK
    )
    :vars
    (
      ?auto_655674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_655673 ?auto_655674 ) ( ON-TABLE ?auto_655658 ) ( ON ?auto_655659 ?auto_655658 ) ( ON ?auto_655660 ?auto_655659 ) ( ON ?auto_655661 ?auto_655660 ) ( ON ?auto_655662 ?auto_655661 ) ( ON ?auto_655663 ?auto_655662 ) ( ON ?auto_655664 ?auto_655663 ) ( ON ?auto_655665 ?auto_655664 ) ( ON ?auto_655666 ?auto_655665 ) ( ON ?auto_655667 ?auto_655666 ) ( not ( = ?auto_655658 ?auto_655659 ) ) ( not ( = ?auto_655658 ?auto_655660 ) ) ( not ( = ?auto_655658 ?auto_655661 ) ) ( not ( = ?auto_655658 ?auto_655662 ) ) ( not ( = ?auto_655658 ?auto_655663 ) ) ( not ( = ?auto_655658 ?auto_655664 ) ) ( not ( = ?auto_655658 ?auto_655665 ) ) ( not ( = ?auto_655658 ?auto_655666 ) ) ( not ( = ?auto_655658 ?auto_655667 ) ) ( not ( = ?auto_655658 ?auto_655668 ) ) ( not ( = ?auto_655658 ?auto_655669 ) ) ( not ( = ?auto_655658 ?auto_655670 ) ) ( not ( = ?auto_655658 ?auto_655671 ) ) ( not ( = ?auto_655658 ?auto_655672 ) ) ( not ( = ?auto_655658 ?auto_655673 ) ) ( not ( = ?auto_655658 ?auto_655674 ) ) ( not ( = ?auto_655659 ?auto_655660 ) ) ( not ( = ?auto_655659 ?auto_655661 ) ) ( not ( = ?auto_655659 ?auto_655662 ) ) ( not ( = ?auto_655659 ?auto_655663 ) ) ( not ( = ?auto_655659 ?auto_655664 ) ) ( not ( = ?auto_655659 ?auto_655665 ) ) ( not ( = ?auto_655659 ?auto_655666 ) ) ( not ( = ?auto_655659 ?auto_655667 ) ) ( not ( = ?auto_655659 ?auto_655668 ) ) ( not ( = ?auto_655659 ?auto_655669 ) ) ( not ( = ?auto_655659 ?auto_655670 ) ) ( not ( = ?auto_655659 ?auto_655671 ) ) ( not ( = ?auto_655659 ?auto_655672 ) ) ( not ( = ?auto_655659 ?auto_655673 ) ) ( not ( = ?auto_655659 ?auto_655674 ) ) ( not ( = ?auto_655660 ?auto_655661 ) ) ( not ( = ?auto_655660 ?auto_655662 ) ) ( not ( = ?auto_655660 ?auto_655663 ) ) ( not ( = ?auto_655660 ?auto_655664 ) ) ( not ( = ?auto_655660 ?auto_655665 ) ) ( not ( = ?auto_655660 ?auto_655666 ) ) ( not ( = ?auto_655660 ?auto_655667 ) ) ( not ( = ?auto_655660 ?auto_655668 ) ) ( not ( = ?auto_655660 ?auto_655669 ) ) ( not ( = ?auto_655660 ?auto_655670 ) ) ( not ( = ?auto_655660 ?auto_655671 ) ) ( not ( = ?auto_655660 ?auto_655672 ) ) ( not ( = ?auto_655660 ?auto_655673 ) ) ( not ( = ?auto_655660 ?auto_655674 ) ) ( not ( = ?auto_655661 ?auto_655662 ) ) ( not ( = ?auto_655661 ?auto_655663 ) ) ( not ( = ?auto_655661 ?auto_655664 ) ) ( not ( = ?auto_655661 ?auto_655665 ) ) ( not ( = ?auto_655661 ?auto_655666 ) ) ( not ( = ?auto_655661 ?auto_655667 ) ) ( not ( = ?auto_655661 ?auto_655668 ) ) ( not ( = ?auto_655661 ?auto_655669 ) ) ( not ( = ?auto_655661 ?auto_655670 ) ) ( not ( = ?auto_655661 ?auto_655671 ) ) ( not ( = ?auto_655661 ?auto_655672 ) ) ( not ( = ?auto_655661 ?auto_655673 ) ) ( not ( = ?auto_655661 ?auto_655674 ) ) ( not ( = ?auto_655662 ?auto_655663 ) ) ( not ( = ?auto_655662 ?auto_655664 ) ) ( not ( = ?auto_655662 ?auto_655665 ) ) ( not ( = ?auto_655662 ?auto_655666 ) ) ( not ( = ?auto_655662 ?auto_655667 ) ) ( not ( = ?auto_655662 ?auto_655668 ) ) ( not ( = ?auto_655662 ?auto_655669 ) ) ( not ( = ?auto_655662 ?auto_655670 ) ) ( not ( = ?auto_655662 ?auto_655671 ) ) ( not ( = ?auto_655662 ?auto_655672 ) ) ( not ( = ?auto_655662 ?auto_655673 ) ) ( not ( = ?auto_655662 ?auto_655674 ) ) ( not ( = ?auto_655663 ?auto_655664 ) ) ( not ( = ?auto_655663 ?auto_655665 ) ) ( not ( = ?auto_655663 ?auto_655666 ) ) ( not ( = ?auto_655663 ?auto_655667 ) ) ( not ( = ?auto_655663 ?auto_655668 ) ) ( not ( = ?auto_655663 ?auto_655669 ) ) ( not ( = ?auto_655663 ?auto_655670 ) ) ( not ( = ?auto_655663 ?auto_655671 ) ) ( not ( = ?auto_655663 ?auto_655672 ) ) ( not ( = ?auto_655663 ?auto_655673 ) ) ( not ( = ?auto_655663 ?auto_655674 ) ) ( not ( = ?auto_655664 ?auto_655665 ) ) ( not ( = ?auto_655664 ?auto_655666 ) ) ( not ( = ?auto_655664 ?auto_655667 ) ) ( not ( = ?auto_655664 ?auto_655668 ) ) ( not ( = ?auto_655664 ?auto_655669 ) ) ( not ( = ?auto_655664 ?auto_655670 ) ) ( not ( = ?auto_655664 ?auto_655671 ) ) ( not ( = ?auto_655664 ?auto_655672 ) ) ( not ( = ?auto_655664 ?auto_655673 ) ) ( not ( = ?auto_655664 ?auto_655674 ) ) ( not ( = ?auto_655665 ?auto_655666 ) ) ( not ( = ?auto_655665 ?auto_655667 ) ) ( not ( = ?auto_655665 ?auto_655668 ) ) ( not ( = ?auto_655665 ?auto_655669 ) ) ( not ( = ?auto_655665 ?auto_655670 ) ) ( not ( = ?auto_655665 ?auto_655671 ) ) ( not ( = ?auto_655665 ?auto_655672 ) ) ( not ( = ?auto_655665 ?auto_655673 ) ) ( not ( = ?auto_655665 ?auto_655674 ) ) ( not ( = ?auto_655666 ?auto_655667 ) ) ( not ( = ?auto_655666 ?auto_655668 ) ) ( not ( = ?auto_655666 ?auto_655669 ) ) ( not ( = ?auto_655666 ?auto_655670 ) ) ( not ( = ?auto_655666 ?auto_655671 ) ) ( not ( = ?auto_655666 ?auto_655672 ) ) ( not ( = ?auto_655666 ?auto_655673 ) ) ( not ( = ?auto_655666 ?auto_655674 ) ) ( not ( = ?auto_655667 ?auto_655668 ) ) ( not ( = ?auto_655667 ?auto_655669 ) ) ( not ( = ?auto_655667 ?auto_655670 ) ) ( not ( = ?auto_655667 ?auto_655671 ) ) ( not ( = ?auto_655667 ?auto_655672 ) ) ( not ( = ?auto_655667 ?auto_655673 ) ) ( not ( = ?auto_655667 ?auto_655674 ) ) ( not ( = ?auto_655668 ?auto_655669 ) ) ( not ( = ?auto_655668 ?auto_655670 ) ) ( not ( = ?auto_655668 ?auto_655671 ) ) ( not ( = ?auto_655668 ?auto_655672 ) ) ( not ( = ?auto_655668 ?auto_655673 ) ) ( not ( = ?auto_655668 ?auto_655674 ) ) ( not ( = ?auto_655669 ?auto_655670 ) ) ( not ( = ?auto_655669 ?auto_655671 ) ) ( not ( = ?auto_655669 ?auto_655672 ) ) ( not ( = ?auto_655669 ?auto_655673 ) ) ( not ( = ?auto_655669 ?auto_655674 ) ) ( not ( = ?auto_655670 ?auto_655671 ) ) ( not ( = ?auto_655670 ?auto_655672 ) ) ( not ( = ?auto_655670 ?auto_655673 ) ) ( not ( = ?auto_655670 ?auto_655674 ) ) ( not ( = ?auto_655671 ?auto_655672 ) ) ( not ( = ?auto_655671 ?auto_655673 ) ) ( not ( = ?auto_655671 ?auto_655674 ) ) ( not ( = ?auto_655672 ?auto_655673 ) ) ( not ( = ?auto_655672 ?auto_655674 ) ) ( not ( = ?auto_655673 ?auto_655674 ) ) ( ON ?auto_655672 ?auto_655673 ) ( ON ?auto_655671 ?auto_655672 ) ( ON ?auto_655670 ?auto_655671 ) ( ON ?auto_655669 ?auto_655670 ) ( CLEAR ?auto_655667 ) ( ON ?auto_655668 ?auto_655669 ) ( CLEAR ?auto_655668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_655658 ?auto_655659 ?auto_655660 ?auto_655661 ?auto_655662 ?auto_655663 ?auto_655664 ?auto_655665 ?auto_655666 ?auto_655667 ?auto_655668 )
      ( MAKE-16PILE ?auto_655658 ?auto_655659 ?auto_655660 ?auto_655661 ?auto_655662 ?auto_655663 ?auto_655664 ?auto_655665 ?auto_655666 ?auto_655667 ?auto_655668 ?auto_655669 ?auto_655670 ?auto_655671 ?auto_655672 ?auto_655673 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_655724 - BLOCK
      ?auto_655725 - BLOCK
      ?auto_655726 - BLOCK
      ?auto_655727 - BLOCK
      ?auto_655728 - BLOCK
      ?auto_655729 - BLOCK
      ?auto_655730 - BLOCK
      ?auto_655731 - BLOCK
      ?auto_655732 - BLOCK
      ?auto_655733 - BLOCK
      ?auto_655734 - BLOCK
      ?auto_655735 - BLOCK
      ?auto_655736 - BLOCK
      ?auto_655737 - BLOCK
      ?auto_655738 - BLOCK
      ?auto_655739 - BLOCK
    )
    :vars
    (
      ?auto_655740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_655739 ?auto_655740 ) ( ON-TABLE ?auto_655724 ) ( ON ?auto_655725 ?auto_655724 ) ( ON ?auto_655726 ?auto_655725 ) ( ON ?auto_655727 ?auto_655726 ) ( ON ?auto_655728 ?auto_655727 ) ( ON ?auto_655729 ?auto_655728 ) ( ON ?auto_655730 ?auto_655729 ) ( ON ?auto_655731 ?auto_655730 ) ( ON ?auto_655732 ?auto_655731 ) ( not ( = ?auto_655724 ?auto_655725 ) ) ( not ( = ?auto_655724 ?auto_655726 ) ) ( not ( = ?auto_655724 ?auto_655727 ) ) ( not ( = ?auto_655724 ?auto_655728 ) ) ( not ( = ?auto_655724 ?auto_655729 ) ) ( not ( = ?auto_655724 ?auto_655730 ) ) ( not ( = ?auto_655724 ?auto_655731 ) ) ( not ( = ?auto_655724 ?auto_655732 ) ) ( not ( = ?auto_655724 ?auto_655733 ) ) ( not ( = ?auto_655724 ?auto_655734 ) ) ( not ( = ?auto_655724 ?auto_655735 ) ) ( not ( = ?auto_655724 ?auto_655736 ) ) ( not ( = ?auto_655724 ?auto_655737 ) ) ( not ( = ?auto_655724 ?auto_655738 ) ) ( not ( = ?auto_655724 ?auto_655739 ) ) ( not ( = ?auto_655724 ?auto_655740 ) ) ( not ( = ?auto_655725 ?auto_655726 ) ) ( not ( = ?auto_655725 ?auto_655727 ) ) ( not ( = ?auto_655725 ?auto_655728 ) ) ( not ( = ?auto_655725 ?auto_655729 ) ) ( not ( = ?auto_655725 ?auto_655730 ) ) ( not ( = ?auto_655725 ?auto_655731 ) ) ( not ( = ?auto_655725 ?auto_655732 ) ) ( not ( = ?auto_655725 ?auto_655733 ) ) ( not ( = ?auto_655725 ?auto_655734 ) ) ( not ( = ?auto_655725 ?auto_655735 ) ) ( not ( = ?auto_655725 ?auto_655736 ) ) ( not ( = ?auto_655725 ?auto_655737 ) ) ( not ( = ?auto_655725 ?auto_655738 ) ) ( not ( = ?auto_655725 ?auto_655739 ) ) ( not ( = ?auto_655725 ?auto_655740 ) ) ( not ( = ?auto_655726 ?auto_655727 ) ) ( not ( = ?auto_655726 ?auto_655728 ) ) ( not ( = ?auto_655726 ?auto_655729 ) ) ( not ( = ?auto_655726 ?auto_655730 ) ) ( not ( = ?auto_655726 ?auto_655731 ) ) ( not ( = ?auto_655726 ?auto_655732 ) ) ( not ( = ?auto_655726 ?auto_655733 ) ) ( not ( = ?auto_655726 ?auto_655734 ) ) ( not ( = ?auto_655726 ?auto_655735 ) ) ( not ( = ?auto_655726 ?auto_655736 ) ) ( not ( = ?auto_655726 ?auto_655737 ) ) ( not ( = ?auto_655726 ?auto_655738 ) ) ( not ( = ?auto_655726 ?auto_655739 ) ) ( not ( = ?auto_655726 ?auto_655740 ) ) ( not ( = ?auto_655727 ?auto_655728 ) ) ( not ( = ?auto_655727 ?auto_655729 ) ) ( not ( = ?auto_655727 ?auto_655730 ) ) ( not ( = ?auto_655727 ?auto_655731 ) ) ( not ( = ?auto_655727 ?auto_655732 ) ) ( not ( = ?auto_655727 ?auto_655733 ) ) ( not ( = ?auto_655727 ?auto_655734 ) ) ( not ( = ?auto_655727 ?auto_655735 ) ) ( not ( = ?auto_655727 ?auto_655736 ) ) ( not ( = ?auto_655727 ?auto_655737 ) ) ( not ( = ?auto_655727 ?auto_655738 ) ) ( not ( = ?auto_655727 ?auto_655739 ) ) ( not ( = ?auto_655727 ?auto_655740 ) ) ( not ( = ?auto_655728 ?auto_655729 ) ) ( not ( = ?auto_655728 ?auto_655730 ) ) ( not ( = ?auto_655728 ?auto_655731 ) ) ( not ( = ?auto_655728 ?auto_655732 ) ) ( not ( = ?auto_655728 ?auto_655733 ) ) ( not ( = ?auto_655728 ?auto_655734 ) ) ( not ( = ?auto_655728 ?auto_655735 ) ) ( not ( = ?auto_655728 ?auto_655736 ) ) ( not ( = ?auto_655728 ?auto_655737 ) ) ( not ( = ?auto_655728 ?auto_655738 ) ) ( not ( = ?auto_655728 ?auto_655739 ) ) ( not ( = ?auto_655728 ?auto_655740 ) ) ( not ( = ?auto_655729 ?auto_655730 ) ) ( not ( = ?auto_655729 ?auto_655731 ) ) ( not ( = ?auto_655729 ?auto_655732 ) ) ( not ( = ?auto_655729 ?auto_655733 ) ) ( not ( = ?auto_655729 ?auto_655734 ) ) ( not ( = ?auto_655729 ?auto_655735 ) ) ( not ( = ?auto_655729 ?auto_655736 ) ) ( not ( = ?auto_655729 ?auto_655737 ) ) ( not ( = ?auto_655729 ?auto_655738 ) ) ( not ( = ?auto_655729 ?auto_655739 ) ) ( not ( = ?auto_655729 ?auto_655740 ) ) ( not ( = ?auto_655730 ?auto_655731 ) ) ( not ( = ?auto_655730 ?auto_655732 ) ) ( not ( = ?auto_655730 ?auto_655733 ) ) ( not ( = ?auto_655730 ?auto_655734 ) ) ( not ( = ?auto_655730 ?auto_655735 ) ) ( not ( = ?auto_655730 ?auto_655736 ) ) ( not ( = ?auto_655730 ?auto_655737 ) ) ( not ( = ?auto_655730 ?auto_655738 ) ) ( not ( = ?auto_655730 ?auto_655739 ) ) ( not ( = ?auto_655730 ?auto_655740 ) ) ( not ( = ?auto_655731 ?auto_655732 ) ) ( not ( = ?auto_655731 ?auto_655733 ) ) ( not ( = ?auto_655731 ?auto_655734 ) ) ( not ( = ?auto_655731 ?auto_655735 ) ) ( not ( = ?auto_655731 ?auto_655736 ) ) ( not ( = ?auto_655731 ?auto_655737 ) ) ( not ( = ?auto_655731 ?auto_655738 ) ) ( not ( = ?auto_655731 ?auto_655739 ) ) ( not ( = ?auto_655731 ?auto_655740 ) ) ( not ( = ?auto_655732 ?auto_655733 ) ) ( not ( = ?auto_655732 ?auto_655734 ) ) ( not ( = ?auto_655732 ?auto_655735 ) ) ( not ( = ?auto_655732 ?auto_655736 ) ) ( not ( = ?auto_655732 ?auto_655737 ) ) ( not ( = ?auto_655732 ?auto_655738 ) ) ( not ( = ?auto_655732 ?auto_655739 ) ) ( not ( = ?auto_655732 ?auto_655740 ) ) ( not ( = ?auto_655733 ?auto_655734 ) ) ( not ( = ?auto_655733 ?auto_655735 ) ) ( not ( = ?auto_655733 ?auto_655736 ) ) ( not ( = ?auto_655733 ?auto_655737 ) ) ( not ( = ?auto_655733 ?auto_655738 ) ) ( not ( = ?auto_655733 ?auto_655739 ) ) ( not ( = ?auto_655733 ?auto_655740 ) ) ( not ( = ?auto_655734 ?auto_655735 ) ) ( not ( = ?auto_655734 ?auto_655736 ) ) ( not ( = ?auto_655734 ?auto_655737 ) ) ( not ( = ?auto_655734 ?auto_655738 ) ) ( not ( = ?auto_655734 ?auto_655739 ) ) ( not ( = ?auto_655734 ?auto_655740 ) ) ( not ( = ?auto_655735 ?auto_655736 ) ) ( not ( = ?auto_655735 ?auto_655737 ) ) ( not ( = ?auto_655735 ?auto_655738 ) ) ( not ( = ?auto_655735 ?auto_655739 ) ) ( not ( = ?auto_655735 ?auto_655740 ) ) ( not ( = ?auto_655736 ?auto_655737 ) ) ( not ( = ?auto_655736 ?auto_655738 ) ) ( not ( = ?auto_655736 ?auto_655739 ) ) ( not ( = ?auto_655736 ?auto_655740 ) ) ( not ( = ?auto_655737 ?auto_655738 ) ) ( not ( = ?auto_655737 ?auto_655739 ) ) ( not ( = ?auto_655737 ?auto_655740 ) ) ( not ( = ?auto_655738 ?auto_655739 ) ) ( not ( = ?auto_655738 ?auto_655740 ) ) ( not ( = ?auto_655739 ?auto_655740 ) ) ( ON ?auto_655738 ?auto_655739 ) ( ON ?auto_655737 ?auto_655738 ) ( ON ?auto_655736 ?auto_655737 ) ( ON ?auto_655735 ?auto_655736 ) ( ON ?auto_655734 ?auto_655735 ) ( CLEAR ?auto_655732 ) ( ON ?auto_655733 ?auto_655734 ) ( CLEAR ?auto_655733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_655724 ?auto_655725 ?auto_655726 ?auto_655727 ?auto_655728 ?auto_655729 ?auto_655730 ?auto_655731 ?auto_655732 ?auto_655733 )
      ( MAKE-16PILE ?auto_655724 ?auto_655725 ?auto_655726 ?auto_655727 ?auto_655728 ?auto_655729 ?auto_655730 ?auto_655731 ?auto_655732 ?auto_655733 ?auto_655734 ?auto_655735 ?auto_655736 ?auto_655737 ?auto_655738 ?auto_655739 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_655790 - BLOCK
      ?auto_655791 - BLOCK
      ?auto_655792 - BLOCK
      ?auto_655793 - BLOCK
      ?auto_655794 - BLOCK
      ?auto_655795 - BLOCK
      ?auto_655796 - BLOCK
      ?auto_655797 - BLOCK
      ?auto_655798 - BLOCK
      ?auto_655799 - BLOCK
      ?auto_655800 - BLOCK
      ?auto_655801 - BLOCK
      ?auto_655802 - BLOCK
      ?auto_655803 - BLOCK
      ?auto_655804 - BLOCK
      ?auto_655805 - BLOCK
    )
    :vars
    (
      ?auto_655806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_655805 ?auto_655806 ) ( ON-TABLE ?auto_655790 ) ( ON ?auto_655791 ?auto_655790 ) ( ON ?auto_655792 ?auto_655791 ) ( ON ?auto_655793 ?auto_655792 ) ( ON ?auto_655794 ?auto_655793 ) ( ON ?auto_655795 ?auto_655794 ) ( ON ?auto_655796 ?auto_655795 ) ( ON ?auto_655797 ?auto_655796 ) ( not ( = ?auto_655790 ?auto_655791 ) ) ( not ( = ?auto_655790 ?auto_655792 ) ) ( not ( = ?auto_655790 ?auto_655793 ) ) ( not ( = ?auto_655790 ?auto_655794 ) ) ( not ( = ?auto_655790 ?auto_655795 ) ) ( not ( = ?auto_655790 ?auto_655796 ) ) ( not ( = ?auto_655790 ?auto_655797 ) ) ( not ( = ?auto_655790 ?auto_655798 ) ) ( not ( = ?auto_655790 ?auto_655799 ) ) ( not ( = ?auto_655790 ?auto_655800 ) ) ( not ( = ?auto_655790 ?auto_655801 ) ) ( not ( = ?auto_655790 ?auto_655802 ) ) ( not ( = ?auto_655790 ?auto_655803 ) ) ( not ( = ?auto_655790 ?auto_655804 ) ) ( not ( = ?auto_655790 ?auto_655805 ) ) ( not ( = ?auto_655790 ?auto_655806 ) ) ( not ( = ?auto_655791 ?auto_655792 ) ) ( not ( = ?auto_655791 ?auto_655793 ) ) ( not ( = ?auto_655791 ?auto_655794 ) ) ( not ( = ?auto_655791 ?auto_655795 ) ) ( not ( = ?auto_655791 ?auto_655796 ) ) ( not ( = ?auto_655791 ?auto_655797 ) ) ( not ( = ?auto_655791 ?auto_655798 ) ) ( not ( = ?auto_655791 ?auto_655799 ) ) ( not ( = ?auto_655791 ?auto_655800 ) ) ( not ( = ?auto_655791 ?auto_655801 ) ) ( not ( = ?auto_655791 ?auto_655802 ) ) ( not ( = ?auto_655791 ?auto_655803 ) ) ( not ( = ?auto_655791 ?auto_655804 ) ) ( not ( = ?auto_655791 ?auto_655805 ) ) ( not ( = ?auto_655791 ?auto_655806 ) ) ( not ( = ?auto_655792 ?auto_655793 ) ) ( not ( = ?auto_655792 ?auto_655794 ) ) ( not ( = ?auto_655792 ?auto_655795 ) ) ( not ( = ?auto_655792 ?auto_655796 ) ) ( not ( = ?auto_655792 ?auto_655797 ) ) ( not ( = ?auto_655792 ?auto_655798 ) ) ( not ( = ?auto_655792 ?auto_655799 ) ) ( not ( = ?auto_655792 ?auto_655800 ) ) ( not ( = ?auto_655792 ?auto_655801 ) ) ( not ( = ?auto_655792 ?auto_655802 ) ) ( not ( = ?auto_655792 ?auto_655803 ) ) ( not ( = ?auto_655792 ?auto_655804 ) ) ( not ( = ?auto_655792 ?auto_655805 ) ) ( not ( = ?auto_655792 ?auto_655806 ) ) ( not ( = ?auto_655793 ?auto_655794 ) ) ( not ( = ?auto_655793 ?auto_655795 ) ) ( not ( = ?auto_655793 ?auto_655796 ) ) ( not ( = ?auto_655793 ?auto_655797 ) ) ( not ( = ?auto_655793 ?auto_655798 ) ) ( not ( = ?auto_655793 ?auto_655799 ) ) ( not ( = ?auto_655793 ?auto_655800 ) ) ( not ( = ?auto_655793 ?auto_655801 ) ) ( not ( = ?auto_655793 ?auto_655802 ) ) ( not ( = ?auto_655793 ?auto_655803 ) ) ( not ( = ?auto_655793 ?auto_655804 ) ) ( not ( = ?auto_655793 ?auto_655805 ) ) ( not ( = ?auto_655793 ?auto_655806 ) ) ( not ( = ?auto_655794 ?auto_655795 ) ) ( not ( = ?auto_655794 ?auto_655796 ) ) ( not ( = ?auto_655794 ?auto_655797 ) ) ( not ( = ?auto_655794 ?auto_655798 ) ) ( not ( = ?auto_655794 ?auto_655799 ) ) ( not ( = ?auto_655794 ?auto_655800 ) ) ( not ( = ?auto_655794 ?auto_655801 ) ) ( not ( = ?auto_655794 ?auto_655802 ) ) ( not ( = ?auto_655794 ?auto_655803 ) ) ( not ( = ?auto_655794 ?auto_655804 ) ) ( not ( = ?auto_655794 ?auto_655805 ) ) ( not ( = ?auto_655794 ?auto_655806 ) ) ( not ( = ?auto_655795 ?auto_655796 ) ) ( not ( = ?auto_655795 ?auto_655797 ) ) ( not ( = ?auto_655795 ?auto_655798 ) ) ( not ( = ?auto_655795 ?auto_655799 ) ) ( not ( = ?auto_655795 ?auto_655800 ) ) ( not ( = ?auto_655795 ?auto_655801 ) ) ( not ( = ?auto_655795 ?auto_655802 ) ) ( not ( = ?auto_655795 ?auto_655803 ) ) ( not ( = ?auto_655795 ?auto_655804 ) ) ( not ( = ?auto_655795 ?auto_655805 ) ) ( not ( = ?auto_655795 ?auto_655806 ) ) ( not ( = ?auto_655796 ?auto_655797 ) ) ( not ( = ?auto_655796 ?auto_655798 ) ) ( not ( = ?auto_655796 ?auto_655799 ) ) ( not ( = ?auto_655796 ?auto_655800 ) ) ( not ( = ?auto_655796 ?auto_655801 ) ) ( not ( = ?auto_655796 ?auto_655802 ) ) ( not ( = ?auto_655796 ?auto_655803 ) ) ( not ( = ?auto_655796 ?auto_655804 ) ) ( not ( = ?auto_655796 ?auto_655805 ) ) ( not ( = ?auto_655796 ?auto_655806 ) ) ( not ( = ?auto_655797 ?auto_655798 ) ) ( not ( = ?auto_655797 ?auto_655799 ) ) ( not ( = ?auto_655797 ?auto_655800 ) ) ( not ( = ?auto_655797 ?auto_655801 ) ) ( not ( = ?auto_655797 ?auto_655802 ) ) ( not ( = ?auto_655797 ?auto_655803 ) ) ( not ( = ?auto_655797 ?auto_655804 ) ) ( not ( = ?auto_655797 ?auto_655805 ) ) ( not ( = ?auto_655797 ?auto_655806 ) ) ( not ( = ?auto_655798 ?auto_655799 ) ) ( not ( = ?auto_655798 ?auto_655800 ) ) ( not ( = ?auto_655798 ?auto_655801 ) ) ( not ( = ?auto_655798 ?auto_655802 ) ) ( not ( = ?auto_655798 ?auto_655803 ) ) ( not ( = ?auto_655798 ?auto_655804 ) ) ( not ( = ?auto_655798 ?auto_655805 ) ) ( not ( = ?auto_655798 ?auto_655806 ) ) ( not ( = ?auto_655799 ?auto_655800 ) ) ( not ( = ?auto_655799 ?auto_655801 ) ) ( not ( = ?auto_655799 ?auto_655802 ) ) ( not ( = ?auto_655799 ?auto_655803 ) ) ( not ( = ?auto_655799 ?auto_655804 ) ) ( not ( = ?auto_655799 ?auto_655805 ) ) ( not ( = ?auto_655799 ?auto_655806 ) ) ( not ( = ?auto_655800 ?auto_655801 ) ) ( not ( = ?auto_655800 ?auto_655802 ) ) ( not ( = ?auto_655800 ?auto_655803 ) ) ( not ( = ?auto_655800 ?auto_655804 ) ) ( not ( = ?auto_655800 ?auto_655805 ) ) ( not ( = ?auto_655800 ?auto_655806 ) ) ( not ( = ?auto_655801 ?auto_655802 ) ) ( not ( = ?auto_655801 ?auto_655803 ) ) ( not ( = ?auto_655801 ?auto_655804 ) ) ( not ( = ?auto_655801 ?auto_655805 ) ) ( not ( = ?auto_655801 ?auto_655806 ) ) ( not ( = ?auto_655802 ?auto_655803 ) ) ( not ( = ?auto_655802 ?auto_655804 ) ) ( not ( = ?auto_655802 ?auto_655805 ) ) ( not ( = ?auto_655802 ?auto_655806 ) ) ( not ( = ?auto_655803 ?auto_655804 ) ) ( not ( = ?auto_655803 ?auto_655805 ) ) ( not ( = ?auto_655803 ?auto_655806 ) ) ( not ( = ?auto_655804 ?auto_655805 ) ) ( not ( = ?auto_655804 ?auto_655806 ) ) ( not ( = ?auto_655805 ?auto_655806 ) ) ( ON ?auto_655804 ?auto_655805 ) ( ON ?auto_655803 ?auto_655804 ) ( ON ?auto_655802 ?auto_655803 ) ( ON ?auto_655801 ?auto_655802 ) ( ON ?auto_655800 ?auto_655801 ) ( ON ?auto_655799 ?auto_655800 ) ( CLEAR ?auto_655797 ) ( ON ?auto_655798 ?auto_655799 ) ( CLEAR ?auto_655798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_655790 ?auto_655791 ?auto_655792 ?auto_655793 ?auto_655794 ?auto_655795 ?auto_655796 ?auto_655797 ?auto_655798 )
      ( MAKE-16PILE ?auto_655790 ?auto_655791 ?auto_655792 ?auto_655793 ?auto_655794 ?auto_655795 ?auto_655796 ?auto_655797 ?auto_655798 ?auto_655799 ?auto_655800 ?auto_655801 ?auto_655802 ?auto_655803 ?auto_655804 ?auto_655805 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_655856 - BLOCK
      ?auto_655857 - BLOCK
      ?auto_655858 - BLOCK
      ?auto_655859 - BLOCK
      ?auto_655860 - BLOCK
      ?auto_655861 - BLOCK
      ?auto_655862 - BLOCK
      ?auto_655863 - BLOCK
      ?auto_655864 - BLOCK
      ?auto_655865 - BLOCK
      ?auto_655866 - BLOCK
      ?auto_655867 - BLOCK
      ?auto_655868 - BLOCK
      ?auto_655869 - BLOCK
      ?auto_655870 - BLOCK
      ?auto_655871 - BLOCK
    )
    :vars
    (
      ?auto_655872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_655871 ?auto_655872 ) ( ON-TABLE ?auto_655856 ) ( ON ?auto_655857 ?auto_655856 ) ( ON ?auto_655858 ?auto_655857 ) ( ON ?auto_655859 ?auto_655858 ) ( ON ?auto_655860 ?auto_655859 ) ( ON ?auto_655861 ?auto_655860 ) ( ON ?auto_655862 ?auto_655861 ) ( not ( = ?auto_655856 ?auto_655857 ) ) ( not ( = ?auto_655856 ?auto_655858 ) ) ( not ( = ?auto_655856 ?auto_655859 ) ) ( not ( = ?auto_655856 ?auto_655860 ) ) ( not ( = ?auto_655856 ?auto_655861 ) ) ( not ( = ?auto_655856 ?auto_655862 ) ) ( not ( = ?auto_655856 ?auto_655863 ) ) ( not ( = ?auto_655856 ?auto_655864 ) ) ( not ( = ?auto_655856 ?auto_655865 ) ) ( not ( = ?auto_655856 ?auto_655866 ) ) ( not ( = ?auto_655856 ?auto_655867 ) ) ( not ( = ?auto_655856 ?auto_655868 ) ) ( not ( = ?auto_655856 ?auto_655869 ) ) ( not ( = ?auto_655856 ?auto_655870 ) ) ( not ( = ?auto_655856 ?auto_655871 ) ) ( not ( = ?auto_655856 ?auto_655872 ) ) ( not ( = ?auto_655857 ?auto_655858 ) ) ( not ( = ?auto_655857 ?auto_655859 ) ) ( not ( = ?auto_655857 ?auto_655860 ) ) ( not ( = ?auto_655857 ?auto_655861 ) ) ( not ( = ?auto_655857 ?auto_655862 ) ) ( not ( = ?auto_655857 ?auto_655863 ) ) ( not ( = ?auto_655857 ?auto_655864 ) ) ( not ( = ?auto_655857 ?auto_655865 ) ) ( not ( = ?auto_655857 ?auto_655866 ) ) ( not ( = ?auto_655857 ?auto_655867 ) ) ( not ( = ?auto_655857 ?auto_655868 ) ) ( not ( = ?auto_655857 ?auto_655869 ) ) ( not ( = ?auto_655857 ?auto_655870 ) ) ( not ( = ?auto_655857 ?auto_655871 ) ) ( not ( = ?auto_655857 ?auto_655872 ) ) ( not ( = ?auto_655858 ?auto_655859 ) ) ( not ( = ?auto_655858 ?auto_655860 ) ) ( not ( = ?auto_655858 ?auto_655861 ) ) ( not ( = ?auto_655858 ?auto_655862 ) ) ( not ( = ?auto_655858 ?auto_655863 ) ) ( not ( = ?auto_655858 ?auto_655864 ) ) ( not ( = ?auto_655858 ?auto_655865 ) ) ( not ( = ?auto_655858 ?auto_655866 ) ) ( not ( = ?auto_655858 ?auto_655867 ) ) ( not ( = ?auto_655858 ?auto_655868 ) ) ( not ( = ?auto_655858 ?auto_655869 ) ) ( not ( = ?auto_655858 ?auto_655870 ) ) ( not ( = ?auto_655858 ?auto_655871 ) ) ( not ( = ?auto_655858 ?auto_655872 ) ) ( not ( = ?auto_655859 ?auto_655860 ) ) ( not ( = ?auto_655859 ?auto_655861 ) ) ( not ( = ?auto_655859 ?auto_655862 ) ) ( not ( = ?auto_655859 ?auto_655863 ) ) ( not ( = ?auto_655859 ?auto_655864 ) ) ( not ( = ?auto_655859 ?auto_655865 ) ) ( not ( = ?auto_655859 ?auto_655866 ) ) ( not ( = ?auto_655859 ?auto_655867 ) ) ( not ( = ?auto_655859 ?auto_655868 ) ) ( not ( = ?auto_655859 ?auto_655869 ) ) ( not ( = ?auto_655859 ?auto_655870 ) ) ( not ( = ?auto_655859 ?auto_655871 ) ) ( not ( = ?auto_655859 ?auto_655872 ) ) ( not ( = ?auto_655860 ?auto_655861 ) ) ( not ( = ?auto_655860 ?auto_655862 ) ) ( not ( = ?auto_655860 ?auto_655863 ) ) ( not ( = ?auto_655860 ?auto_655864 ) ) ( not ( = ?auto_655860 ?auto_655865 ) ) ( not ( = ?auto_655860 ?auto_655866 ) ) ( not ( = ?auto_655860 ?auto_655867 ) ) ( not ( = ?auto_655860 ?auto_655868 ) ) ( not ( = ?auto_655860 ?auto_655869 ) ) ( not ( = ?auto_655860 ?auto_655870 ) ) ( not ( = ?auto_655860 ?auto_655871 ) ) ( not ( = ?auto_655860 ?auto_655872 ) ) ( not ( = ?auto_655861 ?auto_655862 ) ) ( not ( = ?auto_655861 ?auto_655863 ) ) ( not ( = ?auto_655861 ?auto_655864 ) ) ( not ( = ?auto_655861 ?auto_655865 ) ) ( not ( = ?auto_655861 ?auto_655866 ) ) ( not ( = ?auto_655861 ?auto_655867 ) ) ( not ( = ?auto_655861 ?auto_655868 ) ) ( not ( = ?auto_655861 ?auto_655869 ) ) ( not ( = ?auto_655861 ?auto_655870 ) ) ( not ( = ?auto_655861 ?auto_655871 ) ) ( not ( = ?auto_655861 ?auto_655872 ) ) ( not ( = ?auto_655862 ?auto_655863 ) ) ( not ( = ?auto_655862 ?auto_655864 ) ) ( not ( = ?auto_655862 ?auto_655865 ) ) ( not ( = ?auto_655862 ?auto_655866 ) ) ( not ( = ?auto_655862 ?auto_655867 ) ) ( not ( = ?auto_655862 ?auto_655868 ) ) ( not ( = ?auto_655862 ?auto_655869 ) ) ( not ( = ?auto_655862 ?auto_655870 ) ) ( not ( = ?auto_655862 ?auto_655871 ) ) ( not ( = ?auto_655862 ?auto_655872 ) ) ( not ( = ?auto_655863 ?auto_655864 ) ) ( not ( = ?auto_655863 ?auto_655865 ) ) ( not ( = ?auto_655863 ?auto_655866 ) ) ( not ( = ?auto_655863 ?auto_655867 ) ) ( not ( = ?auto_655863 ?auto_655868 ) ) ( not ( = ?auto_655863 ?auto_655869 ) ) ( not ( = ?auto_655863 ?auto_655870 ) ) ( not ( = ?auto_655863 ?auto_655871 ) ) ( not ( = ?auto_655863 ?auto_655872 ) ) ( not ( = ?auto_655864 ?auto_655865 ) ) ( not ( = ?auto_655864 ?auto_655866 ) ) ( not ( = ?auto_655864 ?auto_655867 ) ) ( not ( = ?auto_655864 ?auto_655868 ) ) ( not ( = ?auto_655864 ?auto_655869 ) ) ( not ( = ?auto_655864 ?auto_655870 ) ) ( not ( = ?auto_655864 ?auto_655871 ) ) ( not ( = ?auto_655864 ?auto_655872 ) ) ( not ( = ?auto_655865 ?auto_655866 ) ) ( not ( = ?auto_655865 ?auto_655867 ) ) ( not ( = ?auto_655865 ?auto_655868 ) ) ( not ( = ?auto_655865 ?auto_655869 ) ) ( not ( = ?auto_655865 ?auto_655870 ) ) ( not ( = ?auto_655865 ?auto_655871 ) ) ( not ( = ?auto_655865 ?auto_655872 ) ) ( not ( = ?auto_655866 ?auto_655867 ) ) ( not ( = ?auto_655866 ?auto_655868 ) ) ( not ( = ?auto_655866 ?auto_655869 ) ) ( not ( = ?auto_655866 ?auto_655870 ) ) ( not ( = ?auto_655866 ?auto_655871 ) ) ( not ( = ?auto_655866 ?auto_655872 ) ) ( not ( = ?auto_655867 ?auto_655868 ) ) ( not ( = ?auto_655867 ?auto_655869 ) ) ( not ( = ?auto_655867 ?auto_655870 ) ) ( not ( = ?auto_655867 ?auto_655871 ) ) ( not ( = ?auto_655867 ?auto_655872 ) ) ( not ( = ?auto_655868 ?auto_655869 ) ) ( not ( = ?auto_655868 ?auto_655870 ) ) ( not ( = ?auto_655868 ?auto_655871 ) ) ( not ( = ?auto_655868 ?auto_655872 ) ) ( not ( = ?auto_655869 ?auto_655870 ) ) ( not ( = ?auto_655869 ?auto_655871 ) ) ( not ( = ?auto_655869 ?auto_655872 ) ) ( not ( = ?auto_655870 ?auto_655871 ) ) ( not ( = ?auto_655870 ?auto_655872 ) ) ( not ( = ?auto_655871 ?auto_655872 ) ) ( ON ?auto_655870 ?auto_655871 ) ( ON ?auto_655869 ?auto_655870 ) ( ON ?auto_655868 ?auto_655869 ) ( ON ?auto_655867 ?auto_655868 ) ( ON ?auto_655866 ?auto_655867 ) ( ON ?auto_655865 ?auto_655866 ) ( ON ?auto_655864 ?auto_655865 ) ( CLEAR ?auto_655862 ) ( ON ?auto_655863 ?auto_655864 ) ( CLEAR ?auto_655863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_655856 ?auto_655857 ?auto_655858 ?auto_655859 ?auto_655860 ?auto_655861 ?auto_655862 ?auto_655863 )
      ( MAKE-16PILE ?auto_655856 ?auto_655857 ?auto_655858 ?auto_655859 ?auto_655860 ?auto_655861 ?auto_655862 ?auto_655863 ?auto_655864 ?auto_655865 ?auto_655866 ?auto_655867 ?auto_655868 ?auto_655869 ?auto_655870 ?auto_655871 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_655922 - BLOCK
      ?auto_655923 - BLOCK
      ?auto_655924 - BLOCK
      ?auto_655925 - BLOCK
      ?auto_655926 - BLOCK
      ?auto_655927 - BLOCK
      ?auto_655928 - BLOCK
      ?auto_655929 - BLOCK
      ?auto_655930 - BLOCK
      ?auto_655931 - BLOCK
      ?auto_655932 - BLOCK
      ?auto_655933 - BLOCK
      ?auto_655934 - BLOCK
      ?auto_655935 - BLOCK
      ?auto_655936 - BLOCK
      ?auto_655937 - BLOCK
    )
    :vars
    (
      ?auto_655938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_655937 ?auto_655938 ) ( ON-TABLE ?auto_655922 ) ( ON ?auto_655923 ?auto_655922 ) ( ON ?auto_655924 ?auto_655923 ) ( ON ?auto_655925 ?auto_655924 ) ( ON ?auto_655926 ?auto_655925 ) ( ON ?auto_655927 ?auto_655926 ) ( not ( = ?auto_655922 ?auto_655923 ) ) ( not ( = ?auto_655922 ?auto_655924 ) ) ( not ( = ?auto_655922 ?auto_655925 ) ) ( not ( = ?auto_655922 ?auto_655926 ) ) ( not ( = ?auto_655922 ?auto_655927 ) ) ( not ( = ?auto_655922 ?auto_655928 ) ) ( not ( = ?auto_655922 ?auto_655929 ) ) ( not ( = ?auto_655922 ?auto_655930 ) ) ( not ( = ?auto_655922 ?auto_655931 ) ) ( not ( = ?auto_655922 ?auto_655932 ) ) ( not ( = ?auto_655922 ?auto_655933 ) ) ( not ( = ?auto_655922 ?auto_655934 ) ) ( not ( = ?auto_655922 ?auto_655935 ) ) ( not ( = ?auto_655922 ?auto_655936 ) ) ( not ( = ?auto_655922 ?auto_655937 ) ) ( not ( = ?auto_655922 ?auto_655938 ) ) ( not ( = ?auto_655923 ?auto_655924 ) ) ( not ( = ?auto_655923 ?auto_655925 ) ) ( not ( = ?auto_655923 ?auto_655926 ) ) ( not ( = ?auto_655923 ?auto_655927 ) ) ( not ( = ?auto_655923 ?auto_655928 ) ) ( not ( = ?auto_655923 ?auto_655929 ) ) ( not ( = ?auto_655923 ?auto_655930 ) ) ( not ( = ?auto_655923 ?auto_655931 ) ) ( not ( = ?auto_655923 ?auto_655932 ) ) ( not ( = ?auto_655923 ?auto_655933 ) ) ( not ( = ?auto_655923 ?auto_655934 ) ) ( not ( = ?auto_655923 ?auto_655935 ) ) ( not ( = ?auto_655923 ?auto_655936 ) ) ( not ( = ?auto_655923 ?auto_655937 ) ) ( not ( = ?auto_655923 ?auto_655938 ) ) ( not ( = ?auto_655924 ?auto_655925 ) ) ( not ( = ?auto_655924 ?auto_655926 ) ) ( not ( = ?auto_655924 ?auto_655927 ) ) ( not ( = ?auto_655924 ?auto_655928 ) ) ( not ( = ?auto_655924 ?auto_655929 ) ) ( not ( = ?auto_655924 ?auto_655930 ) ) ( not ( = ?auto_655924 ?auto_655931 ) ) ( not ( = ?auto_655924 ?auto_655932 ) ) ( not ( = ?auto_655924 ?auto_655933 ) ) ( not ( = ?auto_655924 ?auto_655934 ) ) ( not ( = ?auto_655924 ?auto_655935 ) ) ( not ( = ?auto_655924 ?auto_655936 ) ) ( not ( = ?auto_655924 ?auto_655937 ) ) ( not ( = ?auto_655924 ?auto_655938 ) ) ( not ( = ?auto_655925 ?auto_655926 ) ) ( not ( = ?auto_655925 ?auto_655927 ) ) ( not ( = ?auto_655925 ?auto_655928 ) ) ( not ( = ?auto_655925 ?auto_655929 ) ) ( not ( = ?auto_655925 ?auto_655930 ) ) ( not ( = ?auto_655925 ?auto_655931 ) ) ( not ( = ?auto_655925 ?auto_655932 ) ) ( not ( = ?auto_655925 ?auto_655933 ) ) ( not ( = ?auto_655925 ?auto_655934 ) ) ( not ( = ?auto_655925 ?auto_655935 ) ) ( not ( = ?auto_655925 ?auto_655936 ) ) ( not ( = ?auto_655925 ?auto_655937 ) ) ( not ( = ?auto_655925 ?auto_655938 ) ) ( not ( = ?auto_655926 ?auto_655927 ) ) ( not ( = ?auto_655926 ?auto_655928 ) ) ( not ( = ?auto_655926 ?auto_655929 ) ) ( not ( = ?auto_655926 ?auto_655930 ) ) ( not ( = ?auto_655926 ?auto_655931 ) ) ( not ( = ?auto_655926 ?auto_655932 ) ) ( not ( = ?auto_655926 ?auto_655933 ) ) ( not ( = ?auto_655926 ?auto_655934 ) ) ( not ( = ?auto_655926 ?auto_655935 ) ) ( not ( = ?auto_655926 ?auto_655936 ) ) ( not ( = ?auto_655926 ?auto_655937 ) ) ( not ( = ?auto_655926 ?auto_655938 ) ) ( not ( = ?auto_655927 ?auto_655928 ) ) ( not ( = ?auto_655927 ?auto_655929 ) ) ( not ( = ?auto_655927 ?auto_655930 ) ) ( not ( = ?auto_655927 ?auto_655931 ) ) ( not ( = ?auto_655927 ?auto_655932 ) ) ( not ( = ?auto_655927 ?auto_655933 ) ) ( not ( = ?auto_655927 ?auto_655934 ) ) ( not ( = ?auto_655927 ?auto_655935 ) ) ( not ( = ?auto_655927 ?auto_655936 ) ) ( not ( = ?auto_655927 ?auto_655937 ) ) ( not ( = ?auto_655927 ?auto_655938 ) ) ( not ( = ?auto_655928 ?auto_655929 ) ) ( not ( = ?auto_655928 ?auto_655930 ) ) ( not ( = ?auto_655928 ?auto_655931 ) ) ( not ( = ?auto_655928 ?auto_655932 ) ) ( not ( = ?auto_655928 ?auto_655933 ) ) ( not ( = ?auto_655928 ?auto_655934 ) ) ( not ( = ?auto_655928 ?auto_655935 ) ) ( not ( = ?auto_655928 ?auto_655936 ) ) ( not ( = ?auto_655928 ?auto_655937 ) ) ( not ( = ?auto_655928 ?auto_655938 ) ) ( not ( = ?auto_655929 ?auto_655930 ) ) ( not ( = ?auto_655929 ?auto_655931 ) ) ( not ( = ?auto_655929 ?auto_655932 ) ) ( not ( = ?auto_655929 ?auto_655933 ) ) ( not ( = ?auto_655929 ?auto_655934 ) ) ( not ( = ?auto_655929 ?auto_655935 ) ) ( not ( = ?auto_655929 ?auto_655936 ) ) ( not ( = ?auto_655929 ?auto_655937 ) ) ( not ( = ?auto_655929 ?auto_655938 ) ) ( not ( = ?auto_655930 ?auto_655931 ) ) ( not ( = ?auto_655930 ?auto_655932 ) ) ( not ( = ?auto_655930 ?auto_655933 ) ) ( not ( = ?auto_655930 ?auto_655934 ) ) ( not ( = ?auto_655930 ?auto_655935 ) ) ( not ( = ?auto_655930 ?auto_655936 ) ) ( not ( = ?auto_655930 ?auto_655937 ) ) ( not ( = ?auto_655930 ?auto_655938 ) ) ( not ( = ?auto_655931 ?auto_655932 ) ) ( not ( = ?auto_655931 ?auto_655933 ) ) ( not ( = ?auto_655931 ?auto_655934 ) ) ( not ( = ?auto_655931 ?auto_655935 ) ) ( not ( = ?auto_655931 ?auto_655936 ) ) ( not ( = ?auto_655931 ?auto_655937 ) ) ( not ( = ?auto_655931 ?auto_655938 ) ) ( not ( = ?auto_655932 ?auto_655933 ) ) ( not ( = ?auto_655932 ?auto_655934 ) ) ( not ( = ?auto_655932 ?auto_655935 ) ) ( not ( = ?auto_655932 ?auto_655936 ) ) ( not ( = ?auto_655932 ?auto_655937 ) ) ( not ( = ?auto_655932 ?auto_655938 ) ) ( not ( = ?auto_655933 ?auto_655934 ) ) ( not ( = ?auto_655933 ?auto_655935 ) ) ( not ( = ?auto_655933 ?auto_655936 ) ) ( not ( = ?auto_655933 ?auto_655937 ) ) ( not ( = ?auto_655933 ?auto_655938 ) ) ( not ( = ?auto_655934 ?auto_655935 ) ) ( not ( = ?auto_655934 ?auto_655936 ) ) ( not ( = ?auto_655934 ?auto_655937 ) ) ( not ( = ?auto_655934 ?auto_655938 ) ) ( not ( = ?auto_655935 ?auto_655936 ) ) ( not ( = ?auto_655935 ?auto_655937 ) ) ( not ( = ?auto_655935 ?auto_655938 ) ) ( not ( = ?auto_655936 ?auto_655937 ) ) ( not ( = ?auto_655936 ?auto_655938 ) ) ( not ( = ?auto_655937 ?auto_655938 ) ) ( ON ?auto_655936 ?auto_655937 ) ( ON ?auto_655935 ?auto_655936 ) ( ON ?auto_655934 ?auto_655935 ) ( ON ?auto_655933 ?auto_655934 ) ( ON ?auto_655932 ?auto_655933 ) ( ON ?auto_655931 ?auto_655932 ) ( ON ?auto_655930 ?auto_655931 ) ( ON ?auto_655929 ?auto_655930 ) ( CLEAR ?auto_655927 ) ( ON ?auto_655928 ?auto_655929 ) ( CLEAR ?auto_655928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_655922 ?auto_655923 ?auto_655924 ?auto_655925 ?auto_655926 ?auto_655927 ?auto_655928 )
      ( MAKE-16PILE ?auto_655922 ?auto_655923 ?auto_655924 ?auto_655925 ?auto_655926 ?auto_655927 ?auto_655928 ?auto_655929 ?auto_655930 ?auto_655931 ?auto_655932 ?auto_655933 ?auto_655934 ?auto_655935 ?auto_655936 ?auto_655937 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_655988 - BLOCK
      ?auto_655989 - BLOCK
      ?auto_655990 - BLOCK
      ?auto_655991 - BLOCK
      ?auto_655992 - BLOCK
      ?auto_655993 - BLOCK
      ?auto_655994 - BLOCK
      ?auto_655995 - BLOCK
      ?auto_655996 - BLOCK
      ?auto_655997 - BLOCK
      ?auto_655998 - BLOCK
      ?auto_655999 - BLOCK
      ?auto_656000 - BLOCK
      ?auto_656001 - BLOCK
      ?auto_656002 - BLOCK
      ?auto_656003 - BLOCK
    )
    :vars
    (
      ?auto_656004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_656003 ?auto_656004 ) ( ON-TABLE ?auto_655988 ) ( ON ?auto_655989 ?auto_655988 ) ( ON ?auto_655990 ?auto_655989 ) ( ON ?auto_655991 ?auto_655990 ) ( ON ?auto_655992 ?auto_655991 ) ( not ( = ?auto_655988 ?auto_655989 ) ) ( not ( = ?auto_655988 ?auto_655990 ) ) ( not ( = ?auto_655988 ?auto_655991 ) ) ( not ( = ?auto_655988 ?auto_655992 ) ) ( not ( = ?auto_655988 ?auto_655993 ) ) ( not ( = ?auto_655988 ?auto_655994 ) ) ( not ( = ?auto_655988 ?auto_655995 ) ) ( not ( = ?auto_655988 ?auto_655996 ) ) ( not ( = ?auto_655988 ?auto_655997 ) ) ( not ( = ?auto_655988 ?auto_655998 ) ) ( not ( = ?auto_655988 ?auto_655999 ) ) ( not ( = ?auto_655988 ?auto_656000 ) ) ( not ( = ?auto_655988 ?auto_656001 ) ) ( not ( = ?auto_655988 ?auto_656002 ) ) ( not ( = ?auto_655988 ?auto_656003 ) ) ( not ( = ?auto_655988 ?auto_656004 ) ) ( not ( = ?auto_655989 ?auto_655990 ) ) ( not ( = ?auto_655989 ?auto_655991 ) ) ( not ( = ?auto_655989 ?auto_655992 ) ) ( not ( = ?auto_655989 ?auto_655993 ) ) ( not ( = ?auto_655989 ?auto_655994 ) ) ( not ( = ?auto_655989 ?auto_655995 ) ) ( not ( = ?auto_655989 ?auto_655996 ) ) ( not ( = ?auto_655989 ?auto_655997 ) ) ( not ( = ?auto_655989 ?auto_655998 ) ) ( not ( = ?auto_655989 ?auto_655999 ) ) ( not ( = ?auto_655989 ?auto_656000 ) ) ( not ( = ?auto_655989 ?auto_656001 ) ) ( not ( = ?auto_655989 ?auto_656002 ) ) ( not ( = ?auto_655989 ?auto_656003 ) ) ( not ( = ?auto_655989 ?auto_656004 ) ) ( not ( = ?auto_655990 ?auto_655991 ) ) ( not ( = ?auto_655990 ?auto_655992 ) ) ( not ( = ?auto_655990 ?auto_655993 ) ) ( not ( = ?auto_655990 ?auto_655994 ) ) ( not ( = ?auto_655990 ?auto_655995 ) ) ( not ( = ?auto_655990 ?auto_655996 ) ) ( not ( = ?auto_655990 ?auto_655997 ) ) ( not ( = ?auto_655990 ?auto_655998 ) ) ( not ( = ?auto_655990 ?auto_655999 ) ) ( not ( = ?auto_655990 ?auto_656000 ) ) ( not ( = ?auto_655990 ?auto_656001 ) ) ( not ( = ?auto_655990 ?auto_656002 ) ) ( not ( = ?auto_655990 ?auto_656003 ) ) ( not ( = ?auto_655990 ?auto_656004 ) ) ( not ( = ?auto_655991 ?auto_655992 ) ) ( not ( = ?auto_655991 ?auto_655993 ) ) ( not ( = ?auto_655991 ?auto_655994 ) ) ( not ( = ?auto_655991 ?auto_655995 ) ) ( not ( = ?auto_655991 ?auto_655996 ) ) ( not ( = ?auto_655991 ?auto_655997 ) ) ( not ( = ?auto_655991 ?auto_655998 ) ) ( not ( = ?auto_655991 ?auto_655999 ) ) ( not ( = ?auto_655991 ?auto_656000 ) ) ( not ( = ?auto_655991 ?auto_656001 ) ) ( not ( = ?auto_655991 ?auto_656002 ) ) ( not ( = ?auto_655991 ?auto_656003 ) ) ( not ( = ?auto_655991 ?auto_656004 ) ) ( not ( = ?auto_655992 ?auto_655993 ) ) ( not ( = ?auto_655992 ?auto_655994 ) ) ( not ( = ?auto_655992 ?auto_655995 ) ) ( not ( = ?auto_655992 ?auto_655996 ) ) ( not ( = ?auto_655992 ?auto_655997 ) ) ( not ( = ?auto_655992 ?auto_655998 ) ) ( not ( = ?auto_655992 ?auto_655999 ) ) ( not ( = ?auto_655992 ?auto_656000 ) ) ( not ( = ?auto_655992 ?auto_656001 ) ) ( not ( = ?auto_655992 ?auto_656002 ) ) ( not ( = ?auto_655992 ?auto_656003 ) ) ( not ( = ?auto_655992 ?auto_656004 ) ) ( not ( = ?auto_655993 ?auto_655994 ) ) ( not ( = ?auto_655993 ?auto_655995 ) ) ( not ( = ?auto_655993 ?auto_655996 ) ) ( not ( = ?auto_655993 ?auto_655997 ) ) ( not ( = ?auto_655993 ?auto_655998 ) ) ( not ( = ?auto_655993 ?auto_655999 ) ) ( not ( = ?auto_655993 ?auto_656000 ) ) ( not ( = ?auto_655993 ?auto_656001 ) ) ( not ( = ?auto_655993 ?auto_656002 ) ) ( not ( = ?auto_655993 ?auto_656003 ) ) ( not ( = ?auto_655993 ?auto_656004 ) ) ( not ( = ?auto_655994 ?auto_655995 ) ) ( not ( = ?auto_655994 ?auto_655996 ) ) ( not ( = ?auto_655994 ?auto_655997 ) ) ( not ( = ?auto_655994 ?auto_655998 ) ) ( not ( = ?auto_655994 ?auto_655999 ) ) ( not ( = ?auto_655994 ?auto_656000 ) ) ( not ( = ?auto_655994 ?auto_656001 ) ) ( not ( = ?auto_655994 ?auto_656002 ) ) ( not ( = ?auto_655994 ?auto_656003 ) ) ( not ( = ?auto_655994 ?auto_656004 ) ) ( not ( = ?auto_655995 ?auto_655996 ) ) ( not ( = ?auto_655995 ?auto_655997 ) ) ( not ( = ?auto_655995 ?auto_655998 ) ) ( not ( = ?auto_655995 ?auto_655999 ) ) ( not ( = ?auto_655995 ?auto_656000 ) ) ( not ( = ?auto_655995 ?auto_656001 ) ) ( not ( = ?auto_655995 ?auto_656002 ) ) ( not ( = ?auto_655995 ?auto_656003 ) ) ( not ( = ?auto_655995 ?auto_656004 ) ) ( not ( = ?auto_655996 ?auto_655997 ) ) ( not ( = ?auto_655996 ?auto_655998 ) ) ( not ( = ?auto_655996 ?auto_655999 ) ) ( not ( = ?auto_655996 ?auto_656000 ) ) ( not ( = ?auto_655996 ?auto_656001 ) ) ( not ( = ?auto_655996 ?auto_656002 ) ) ( not ( = ?auto_655996 ?auto_656003 ) ) ( not ( = ?auto_655996 ?auto_656004 ) ) ( not ( = ?auto_655997 ?auto_655998 ) ) ( not ( = ?auto_655997 ?auto_655999 ) ) ( not ( = ?auto_655997 ?auto_656000 ) ) ( not ( = ?auto_655997 ?auto_656001 ) ) ( not ( = ?auto_655997 ?auto_656002 ) ) ( not ( = ?auto_655997 ?auto_656003 ) ) ( not ( = ?auto_655997 ?auto_656004 ) ) ( not ( = ?auto_655998 ?auto_655999 ) ) ( not ( = ?auto_655998 ?auto_656000 ) ) ( not ( = ?auto_655998 ?auto_656001 ) ) ( not ( = ?auto_655998 ?auto_656002 ) ) ( not ( = ?auto_655998 ?auto_656003 ) ) ( not ( = ?auto_655998 ?auto_656004 ) ) ( not ( = ?auto_655999 ?auto_656000 ) ) ( not ( = ?auto_655999 ?auto_656001 ) ) ( not ( = ?auto_655999 ?auto_656002 ) ) ( not ( = ?auto_655999 ?auto_656003 ) ) ( not ( = ?auto_655999 ?auto_656004 ) ) ( not ( = ?auto_656000 ?auto_656001 ) ) ( not ( = ?auto_656000 ?auto_656002 ) ) ( not ( = ?auto_656000 ?auto_656003 ) ) ( not ( = ?auto_656000 ?auto_656004 ) ) ( not ( = ?auto_656001 ?auto_656002 ) ) ( not ( = ?auto_656001 ?auto_656003 ) ) ( not ( = ?auto_656001 ?auto_656004 ) ) ( not ( = ?auto_656002 ?auto_656003 ) ) ( not ( = ?auto_656002 ?auto_656004 ) ) ( not ( = ?auto_656003 ?auto_656004 ) ) ( ON ?auto_656002 ?auto_656003 ) ( ON ?auto_656001 ?auto_656002 ) ( ON ?auto_656000 ?auto_656001 ) ( ON ?auto_655999 ?auto_656000 ) ( ON ?auto_655998 ?auto_655999 ) ( ON ?auto_655997 ?auto_655998 ) ( ON ?auto_655996 ?auto_655997 ) ( ON ?auto_655995 ?auto_655996 ) ( ON ?auto_655994 ?auto_655995 ) ( CLEAR ?auto_655992 ) ( ON ?auto_655993 ?auto_655994 ) ( CLEAR ?auto_655993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_655988 ?auto_655989 ?auto_655990 ?auto_655991 ?auto_655992 ?auto_655993 )
      ( MAKE-16PILE ?auto_655988 ?auto_655989 ?auto_655990 ?auto_655991 ?auto_655992 ?auto_655993 ?auto_655994 ?auto_655995 ?auto_655996 ?auto_655997 ?auto_655998 ?auto_655999 ?auto_656000 ?auto_656001 ?auto_656002 ?auto_656003 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_656054 - BLOCK
      ?auto_656055 - BLOCK
      ?auto_656056 - BLOCK
      ?auto_656057 - BLOCK
      ?auto_656058 - BLOCK
      ?auto_656059 - BLOCK
      ?auto_656060 - BLOCK
      ?auto_656061 - BLOCK
      ?auto_656062 - BLOCK
      ?auto_656063 - BLOCK
      ?auto_656064 - BLOCK
      ?auto_656065 - BLOCK
      ?auto_656066 - BLOCK
      ?auto_656067 - BLOCK
      ?auto_656068 - BLOCK
      ?auto_656069 - BLOCK
    )
    :vars
    (
      ?auto_656070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_656069 ?auto_656070 ) ( ON-TABLE ?auto_656054 ) ( ON ?auto_656055 ?auto_656054 ) ( ON ?auto_656056 ?auto_656055 ) ( ON ?auto_656057 ?auto_656056 ) ( not ( = ?auto_656054 ?auto_656055 ) ) ( not ( = ?auto_656054 ?auto_656056 ) ) ( not ( = ?auto_656054 ?auto_656057 ) ) ( not ( = ?auto_656054 ?auto_656058 ) ) ( not ( = ?auto_656054 ?auto_656059 ) ) ( not ( = ?auto_656054 ?auto_656060 ) ) ( not ( = ?auto_656054 ?auto_656061 ) ) ( not ( = ?auto_656054 ?auto_656062 ) ) ( not ( = ?auto_656054 ?auto_656063 ) ) ( not ( = ?auto_656054 ?auto_656064 ) ) ( not ( = ?auto_656054 ?auto_656065 ) ) ( not ( = ?auto_656054 ?auto_656066 ) ) ( not ( = ?auto_656054 ?auto_656067 ) ) ( not ( = ?auto_656054 ?auto_656068 ) ) ( not ( = ?auto_656054 ?auto_656069 ) ) ( not ( = ?auto_656054 ?auto_656070 ) ) ( not ( = ?auto_656055 ?auto_656056 ) ) ( not ( = ?auto_656055 ?auto_656057 ) ) ( not ( = ?auto_656055 ?auto_656058 ) ) ( not ( = ?auto_656055 ?auto_656059 ) ) ( not ( = ?auto_656055 ?auto_656060 ) ) ( not ( = ?auto_656055 ?auto_656061 ) ) ( not ( = ?auto_656055 ?auto_656062 ) ) ( not ( = ?auto_656055 ?auto_656063 ) ) ( not ( = ?auto_656055 ?auto_656064 ) ) ( not ( = ?auto_656055 ?auto_656065 ) ) ( not ( = ?auto_656055 ?auto_656066 ) ) ( not ( = ?auto_656055 ?auto_656067 ) ) ( not ( = ?auto_656055 ?auto_656068 ) ) ( not ( = ?auto_656055 ?auto_656069 ) ) ( not ( = ?auto_656055 ?auto_656070 ) ) ( not ( = ?auto_656056 ?auto_656057 ) ) ( not ( = ?auto_656056 ?auto_656058 ) ) ( not ( = ?auto_656056 ?auto_656059 ) ) ( not ( = ?auto_656056 ?auto_656060 ) ) ( not ( = ?auto_656056 ?auto_656061 ) ) ( not ( = ?auto_656056 ?auto_656062 ) ) ( not ( = ?auto_656056 ?auto_656063 ) ) ( not ( = ?auto_656056 ?auto_656064 ) ) ( not ( = ?auto_656056 ?auto_656065 ) ) ( not ( = ?auto_656056 ?auto_656066 ) ) ( not ( = ?auto_656056 ?auto_656067 ) ) ( not ( = ?auto_656056 ?auto_656068 ) ) ( not ( = ?auto_656056 ?auto_656069 ) ) ( not ( = ?auto_656056 ?auto_656070 ) ) ( not ( = ?auto_656057 ?auto_656058 ) ) ( not ( = ?auto_656057 ?auto_656059 ) ) ( not ( = ?auto_656057 ?auto_656060 ) ) ( not ( = ?auto_656057 ?auto_656061 ) ) ( not ( = ?auto_656057 ?auto_656062 ) ) ( not ( = ?auto_656057 ?auto_656063 ) ) ( not ( = ?auto_656057 ?auto_656064 ) ) ( not ( = ?auto_656057 ?auto_656065 ) ) ( not ( = ?auto_656057 ?auto_656066 ) ) ( not ( = ?auto_656057 ?auto_656067 ) ) ( not ( = ?auto_656057 ?auto_656068 ) ) ( not ( = ?auto_656057 ?auto_656069 ) ) ( not ( = ?auto_656057 ?auto_656070 ) ) ( not ( = ?auto_656058 ?auto_656059 ) ) ( not ( = ?auto_656058 ?auto_656060 ) ) ( not ( = ?auto_656058 ?auto_656061 ) ) ( not ( = ?auto_656058 ?auto_656062 ) ) ( not ( = ?auto_656058 ?auto_656063 ) ) ( not ( = ?auto_656058 ?auto_656064 ) ) ( not ( = ?auto_656058 ?auto_656065 ) ) ( not ( = ?auto_656058 ?auto_656066 ) ) ( not ( = ?auto_656058 ?auto_656067 ) ) ( not ( = ?auto_656058 ?auto_656068 ) ) ( not ( = ?auto_656058 ?auto_656069 ) ) ( not ( = ?auto_656058 ?auto_656070 ) ) ( not ( = ?auto_656059 ?auto_656060 ) ) ( not ( = ?auto_656059 ?auto_656061 ) ) ( not ( = ?auto_656059 ?auto_656062 ) ) ( not ( = ?auto_656059 ?auto_656063 ) ) ( not ( = ?auto_656059 ?auto_656064 ) ) ( not ( = ?auto_656059 ?auto_656065 ) ) ( not ( = ?auto_656059 ?auto_656066 ) ) ( not ( = ?auto_656059 ?auto_656067 ) ) ( not ( = ?auto_656059 ?auto_656068 ) ) ( not ( = ?auto_656059 ?auto_656069 ) ) ( not ( = ?auto_656059 ?auto_656070 ) ) ( not ( = ?auto_656060 ?auto_656061 ) ) ( not ( = ?auto_656060 ?auto_656062 ) ) ( not ( = ?auto_656060 ?auto_656063 ) ) ( not ( = ?auto_656060 ?auto_656064 ) ) ( not ( = ?auto_656060 ?auto_656065 ) ) ( not ( = ?auto_656060 ?auto_656066 ) ) ( not ( = ?auto_656060 ?auto_656067 ) ) ( not ( = ?auto_656060 ?auto_656068 ) ) ( not ( = ?auto_656060 ?auto_656069 ) ) ( not ( = ?auto_656060 ?auto_656070 ) ) ( not ( = ?auto_656061 ?auto_656062 ) ) ( not ( = ?auto_656061 ?auto_656063 ) ) ( not ( = ?auto_656061 ?auto_656064 ) ) ( not ( = ?auto_656061 ?auto_656065 ) ) ( not ( = ?auto_656061 ?auto_656066 ) ) ( not ( = ?auto_656061 ?auto_656067 ) ) ( not ( = ?auto_656061 ?auto_656068 ) ) ( not ( = ?auto_656061 ?auto_656069 ) ) ( not ( = ?auto_656061 ?auto_656070 ) ) ( not ( = ?auto_656062 ?auto_656063 ) ) ( not ( = ?auto_656062 ?auto_656064 ) ) ( not ( = ?auto_656062 ?auto_656065 ) ) ( not ( = ?auto_656062 ?auto_656066 ) ) ( not ( = ?auto_656062 ?auto_656067 ) ) ( not ( = ?auto_656062 ?auto_656068 ) ) ( not ( = ?auto_656062 ?auto_656069 ) ) ( not ( = ?auto_656062 ?auto_656070 ) ) ( not ( = ?auto_656063 ?auto_656064 ) ) ( not ( = ?auto_656063 ?auto_656065 ) ) ( not ( = ?auto_656063 ?auto_656066 ) ) ( not ( = ?auto_656063 ?auto_656067 ) ) ( not ( = ?auto_656063 ?auto_656068 ) ) ( not ( = ?auto_656063 ?auto_656069 ) ) ( not ( = ?auto_656063 ?auto_656070 ) ) ( not ( = ?auto_656064 ?auto_656065 ) ) ( not ( = ?auto_656064 ?auto_656066 ) ) ( not ( = ?auto_656064 ?auto_656067 ) ) ( not ( = ?auto_656064 ?auto_656068 ) ) ( not ( = ?auto_656064 ?auto_656069 ) ) ( not ( = ?auto_656064 ?auto_656070 ) ) ( not ( = ?auto_656065 ?auto_656066 ) ) ( not ( = ?auto_656065 ?auto_656067 ) ) ( not ( = ?auto_656065 ?auto_656068 ) ) ( not ( = ?auto_656065 ?auto_656069 ) ) ( not ( = ?auto_656065 ?auto_656070 ) ) ( not ( = ?auto_656066 ?auto_656067 ) ) ( not ( = ?auto_656066 ?auto_656068 ) ) ( not ( = ?auto_656066 ?auto_656069 ) ) ( not ( = ?auto_656066 ?auto_656070 ) ) ( not ( = ?auto_656067 ?auto_656068 ) ) ( not ( = ?auto_656067 ?auto_656069 ) ) ( not ( = ?auto_656067 ?auto_656070 ) ) ( not ( = ?auto_656068 ?auto_656069 ) ) ( not ( = ?auto_656068 ?auto_656070 ) ) ( not ( = ?auto_656069 ?auto_656070 ) ) ( ON ?auto_656068 ?auto_656069 ) ( ON ?auto_656067 ?auto_656068 ) ( ON ?auto_656066 ?auto_656067 ) ( ON ?auto_656065 ?auto_656066 ) ( ON ?auto_656064 ?auto_656065 ) ( ON ?auto_656063 ?auto_656064 ) ( ON ?auto_656062 ?auto_656063 ) ( ON ?auto_656061 ?auto_656062 ) ( ON ?auto_656060 ?auto_656061 ) ( ON ?auto_656059 ?auto_656060 ) ( CLEAR ?auto_656057 ) ( ON ?auto_656058 ?auto_656059 ) ( CLEAR ?auto_656058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_656054 ?auto_656055 ?auto_656056 ?auto_656057 ?auto_656058 )
      ( MAKE-16PILE ?auto_656054 ?auto_656055 ?auto_656056 ?auto_656057 ?auto_656058 ?auto_656059 ?auto_656060 ?auto_656061 ?auto_656062 ?auto_656063 ?auto_656064 ?auto_656065 ?auto_656066 ?auto_656067 ?auto_656068 ?auto_656069 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_656120 - BLOCK
      ?auto_656121 - BLOCK
      ?auto_656122 - BLOCK
      ?auto_656123 - BLOCK
      ?auto_656124 - BLOCK
      ?auto_656125 - BLOCK
      ?auto_656126 - BLOCK
      ?auto_656127 - BLOCK
      ?auto_656128 - BLOCK
      ?auto_656129 - BLOCK
      ?auto_656130 - BLOCK
      ?auto_656131 - BLOCK
      ?auto_656132 - BLOCK
      ?auto_656133 - BLOCK
      ?auto_656134 - BLOCK
      ?auto_656135 - BLOCK
    )
    :vars
    (
      ?auto_656136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_656135 ?auto_656136 ) ( ON-TABLE ?auto_656120 ) ( ON ?auto_656121 ?auto_656120 ) ( ON ?auto_656122 ?auto_656121 ) ( not ( = ?auto_656120 ?auto_656121 ) ) ( not ( = ?auto_656120 ?auto_656122 ) ) ( not ( = ?auto_656120 ?auto_656123 ) ) ( not ( = ?auto_656120 ?auto_656124 ) ) ( not ( = ?auto_656120 ?auto_656125 ) ) ( not ( = ?auto_656120 ?auto_656126 ) ) ( not ( = ?auto_656120 ?auto_656127 ) ) ( not ( = ?auto_656120 ?auto_656128 ) ) ( not ( = ?auto_656120 ?auto_656129 ) ) ( not ( = ?auto_656120 ?auto_656130 ) ) ( not ( = ?auto_656120 ?auto_656131 ) ) ( not ( = ?auto_656120 ?auto_656132 ) ) ( not ( = ?auto_656120 ?auto_656133 ) ) ( not ( = ?auto_656120 ?auto_656134 ) ) ( not ( = ?auto_656120 ?auto_656135 ) ) ( not ( = ?auto_656120 ?auto_656136 ) ) ( not ( = ?auto_656121 ?auto_656122 ) ) ( not ( = ?auto_656121 ?auto_656123 ) ) ( not ( = ?auto_656121 ?auto_656124 ) ) ( not ( = ?auto_656121 ?auto_656125 ) ) ( not ( = ?auto_656121 ?auto_656126 ) ) ( not ( = ?auto_656121 ?auto_656127 ) ) ( not ( = ?auto_656121 ?auto_656128 ) ) ( not ( = ?auto_656121 ?auto_656129 ) ) ( not ( = ?auto_656121 ?auto_656130 ) ) ( not ( = ?auto_656121 ?auto_656131 ) ) ( not ( = ?auto_656121 ?auto_656132 ) ) ( not ( = ?auto_656121 ?auto_656133 ) ) ( not ( = ?auto_656121 ?auto_656134 ) ) ( not ( = ?auto_656121 ?auto_656135 ) ) ( not ( = ?auto_656121 ?auto_656136 ) ) ( not ( = ?auto_656122 ?auto_656123 ) ) ( not ( = ?auto_656122 ?auto_656124 ) ) ( not ( = ?auto_656122 ?auto_656125 ) ) ( not ( = ?auto_656122 ?auto_656126 ) ) ( not ( = ?auto_656122 ?auto_656127 ) ) ( not ( = ?auto_656122 ?auto_656128 ) ) ( not ( = ?auto_656122 ?auto_656129 ) ) ( not ( = ?auto_656122 ?auto_656130 ) ) ( not ( = ?auto_656122 ?auto_656131 ) ) ( not ( = ?auto_656122 ?auto_656132 ) ) ( not ( = ?auto_656122 ?auto_656133 ) ) ( not ( = ?auto_656122 ?auto_656134 ) ) ( not ( = ?auto_656122 ?auto_656135 ) ) ( not ( = ?auto_656122 ?auto_656136 ) ) ( not ( = ?auto_656123 ?auto_656124 ) ) ( not ( = ?auto_656123 ?auto_656125 ) ) ( not ( = ?auto_656123 ?auto_656126 ) ) ( not ( = ?auto_656123 ?auto_656127 ) ) ( not ( = ?auto_656123 ?auto_656128 ) ) ( not ( = ?auto_656123 ?auto_656129 ) ) ( not ( = ?auto_656123 ?auto_656130 ) ) ( not ( = ?auto_656123 ?auto_656131 ) ) ( not ( = ?auto_656123 ?auto_656132 ) ) ( not ( = ?auto_656123 ?auto_656133 ) ) ( not ( = ?auto_656123 ?auto_656134 ) ) ( not ( = ?auto_656123 ?auto_656135 ) ) ( not ( = ?auto_656123 ?auto_656136 ) ) ( not ( = ?auto_656124 ?auto_656125 ) ) ( not ( = ?auto_656124 ?auto_656126 ) ) ( not ( = ?auto_656124 ?auto_656127 ) ) ( not ( = ?auto_656124 ?auto_656128 ) ) ( not ( = ?auto_656124 ?auto_656129 ) ) ( not ( = ?auto_656124 ?auto_656130 ) ) ( not ( = ?auto_656124 ?auto_656131 ) ) ( not ( = ?auto_656124 ?auto_656132 ) ) ( not ( = ?auto_656124 ?auto_656133 ) ) ( not ( = ?auto_656124 ?auto_656134 ) ) ( not ( = ?auto_656124 ?auto_656135 ) ) ( not ( = ?auto_656124 ?auto_656136 ) ) ( not ( = ?auto_656125 ?auto_656126 ) ) ( not ( = ?auto_656125 ?auto_656127 ) ) ( not ( = ?auto_656125 ?auto_656128 ) ) ( not ( = ?auto_656125 ?auto_656129 ) ) ( not ( = ?auto_656125 ?auto_656130 ) ) ( not ( = ?auto_656125 ?auto_656131 ) ) ( not ( = ?auto_656125 ?auto_656132 ) ) ( not ( = ?auto_656125 ?auto_656133 ) ) ( not ( = ?auto_656125 ?auto_656134 ) ) ( not ( = ?auto_656125 ?auto_656135 ) ) ( not ( = ?auto_656125 ?auto_656136 ) ) ( not ( = ?auto_656126 ?auto_656127 ) ) ( not ( = ?auto_656126 ?auto_656128 ) ) ( not ( = ?auto_656126 ?auto_656129 ) ) ( not ( = ?auto_656126 ?auto_656130 ) ) ( not ( = ?auto_656126 ?auto_656131 ) ) ( not ( = ?auto_656126 ?auto_656132 ) ) ( not ( = ?auto_656126 ?auto_656133 ) ) ( not ( = ?auto_656126 ?auto_656134 ) ) ( not ( = ?auto_656126 ?auto_656135 ) ) ( not ( = ?auto_656126 ?auto_656136 ) ) ( not ( = ?auto_656127 ?auto_656128 ) ) ( not ( = ?auto_656127 ?auto_656129 ) ) ( not ( = ?auto_656127 ?auto_656130 ) ) ( not ( = ?auto_656127 ?auto_656131 ) ) ( not ( = ?auto_656127 ?auto_656132 ) ) ( not ( = ?auto_656127 ?auto_656133 ) ) ( not ( = ?auto_656127 ?auto_656134 ) ) ( not ( = ?auto_656127 ?auto_656135 ) ) ( not ( = ?auto_656127 ?auto_656136 ) ) ( not ( = ?auto_656128 ?auto_656129 ) ) ( not ( = ?auto_656128 ?auto_656130 ) ) ( not ( = ?auto_656128 ?auto_656131 ) ) ( not ( = ?auto_656128 ?auto_656132 ) ) ( not ( = ?auto_656128 ?auto_656133 ) ) ( not ( = ?auto_656128 ?auto_656134 ) ) ( not ( = ?auto_656128 ?auto_656135 ) ) ( not ( = ?auto_656128 ?auto_656136 ) ) ( not ( = ?auto_656129 ?auto_656130 ) ) ( not ( = ?auto_656129 ?auto_656131 ) ) ( not ( = ?auto_656129 ?auto_656132 ) ) ( not ( = ?auto_656129 ?auto_656133 ) ) ( not ( = ?auto_656129 ?auto_656134 ) ) ( not ( = ?auto_656129 ?auto_656135 ) ) ( not ( = ?auto_656129 ?auto_656136 ) ) ( not ( = ?auto_656130 ?auto_656131 ) ) ( not ( = ?auto_656130 ?auto_656132 ) ) ( not ( = ?auto_656130 ?auto_656133 ) ) ( not ( = ?auto_656130 ?auto_656134 ) ) ( not ( = ?auto_656130 ?auto_656135 ) ) ( not ( = ?auto_656130 ?auto_656136 ) ) ( not ( = ?auto_656131 ?auto_656132 ) ) ( not ( = ?auto_656131 ?auto_656133 ) ) ( not ( = ?auto_656131 ?auto_656134 ) ) ( not ( = ?auto_656131 ?auto_656135 ) ) ( not ( = ?auto_656131 ?auto_656136 ) ) ( not ( = ?auto_656132 ?auto_656133 ) ) ( not ( = ?auto_656132 ?auto_656134 ) ) ( not ( = ?auto_656132 ?auto_656135 ) ) ( not ( = ?auto_656132 ?auto_656136 ) ) ( not ( = ?auto_656133 ?auto_656134 ) ) ( not ( = ?auto_656133 ?auto_656135 ) ) ( not ( = ?auto_656133 ?auto_656136 ) ) ( not ( = ?auto_656134 ?auto_656135 ) ) ( not ( = ?auto_656134 ?auto_656136 ) ) ( not ( = ?auto_656135 ?auto_656136 ) ) ( ON ?auto_656134 ?auto_656135 ) ( ON ?auto_656133 ?auto_656134 ) ( ON ?auto_656132 ?auto_656133 ) ( ON ?auto_656131 ?auto_656132 ) ( ON ?auto_656130 ?auto_656131 ) ( ON ?auto_656129 ?auto_656130 ) ( ON ?auto_656128 ?auto_656129 ) ( ON ?auto_656127 ?auto_656128 ) ( ON ?auto_656126 ?auto_656127 ) ( ON ?auto_656125 ?auto_656126 ) ( ON ?auto_656124 ?auto_656125 ) ( CLEAR ?auto_656122 ) ( ON ?auto_656123 ?auto_656124 ) ( CLEAR ?auto_656123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_656120 ?auto_656121 ?auto_656122 ?auto_656123 )
      ( MAKE-16PILE ?auto_656120 ?auto_656121 ?auto_656122 ?auto_656123 ?auto_656124 ?auto_656125 ?auto_656126 ?auto_656127 ?auto_656128 ?auto_656129 ?auto_656130 ?auto_656131 ?auto_656132 ?auto_656133 ?auto_656134 ?auto_656135 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_656186 - BLOCK
      ?auto_656187 - BLOCK
      ?auto_656188 - BLOCK
      ?auto_656189 - BLOCK
      ?auto_656190 - BLOCK
      ?auto_656191 - BLOCK
      ?auto_656192 - BLOCK
      ?auto_656193 - BLOCK
      ?auto_656194 - BLOCK
      ?auto_656195 - BLOCK
      ?auto_656196 - BLOCK
      ?auto_656197 - BLOCK
      ?auto_656198 - BLOCK
      ?auto_656199 - BLOCK
      ?auto_656200 - BLOCK
      ?auto_656201 - BLOCK
    )
    :vars
    (
      ?auto_656202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_656201 ?auto_656202 ) ( ON-TABLE ?auto_656186 ) ( ON ?auto_656187 ?auto_656186 ) ( not ( = ?auto_656186 ?auto_656187 ) ) ( not ( = ?auto_656186 ?auto_656188 ) ) ( not ( = ?auto_656186 ?auto_656189 ) ) ( not ( = ?auto_656186 ?auto_656190 ) ) ( not ( = ?auto_656186 ?auto_656191 ) ) ( not ( = ?auto_656186 ?auto_656192 ) ) ( not ( = ?auto_656186 ?auto_656193 ) ) ( not ( = ?auto_656186 ?auto_656194 ) ) ( not ( = ?auto_656186 ?auto_656195 ) ) ( not ( = ?auto_656186 ?auto_656196 ) ) ( not ( = ?auto_656186 ?auto_656197 ) ) ( not ( = ?auto_656186 ?auto_656198 ) ) ( not ( = ?auto_656186 ?auto_656199 ) ) ( not ( = ?auto_656186 ?auto_656200 ) ) ( not ( = ?auto_656186 ?auto_656201 ) ) ( not ( = ?auto_656186 ?auto_656202 ) ) ( not ( = ?auto_656187 ?auto_656188 ) ) ( not ( = ?auto_656187 ?auto_656189 ) ) ( not ( = ?auto_656187 ?auto_656190 ) ) ( not ( = ?auto_656187 ?auto_656191 ) ) ( not ( = ?auto_656187 ?auto_656192 ) ) ( not ( = ?auto_656187 ?auto_656193 ) ) ( not ( = ?auto_656187 ?auto_656194 ) ) ( not ( = ?auto_656187 ?auto_656195 ) ) ( not ( = ?auto_656187 ?auto_656196 ) ) ( not ( = ?auto_656187 ?auto_656197 ) ) ( not ( = ?auto_656187 ?auto_656198 ) ) ( not ( = ?auto_656187 ?auto_656199 ) ) ( not ( = ?auto_656187 ?auto_656200 ) ) ( not ( = ?auto_656187 ?auto_656201 ) ) ( not ( = ?auto_656187 ?auto_656202 ) ) ( not ( = ?auto_656188 ?auto_656189 ) ) ( not ( = ?auto_656188 ?auto_656190 ) ) ( not ( = ?auto_656188 ?auto_656191 ) ) ( not ( = ?auto_656188 ?auto_656192 ) ) ( not ( = ?auto_656188 ?auto_656193 ) ) ( not ( = ?auto_656188 ?auto_656194 ) ) ( not ( = ?auto_656188 ?auto_656195 ) ) ( not ( = ?auto_656188 ?auto_656196 ) ) ( not ( = ?auto_656188 ?auto_656197 ) ) ( not ( = ?auto_656188 ?auto_656198 ) ) ( not ( = ?auto_656188 ?auto_656199 ) ) ( not ( = ?auto_656188 ?auto_656200 ) ) ( not ( = ?auto_656188 ?auto_656201 ) ) ( not ( = ?auto_656188 ?auto_656202 ) ) ( not ( = ?auto_656189 ?auto_656190 ) ) ( not ( = ?auto_656189 ?auto_656191 ) ) ( not ( = ?auto_656189 ?auto_656192 ) ) ( not ( = ?auto_656189 ?auto_656193 ) ) ( not ( = ?auto_656189 ?auto_656194 ) ) ( not ( = ?auto_656189 ?auto_656195 ) ) ( not ( = ?auto_656189 ?auto_656196 ) ) ( not ( = ?auto_656189 ?auto_656197 ) ) ( not ( = ?auto_656189 ?auto_656198 ) ) ( not ( = ?auto_656189 ?auto_656199 ) ) ( not ( = ?auto_656189 ?auto_656200 ) ) ( not ( = ?auto_656189 ?auto_656201 ) ) ( not ( = ?auto_656189 ?auto_656202 ) ) ( not ( = ?auto_656190 ?auto_656191 ) ) ( not ( = ?auto_656190 ?auto_656192 ) ) ( not ( = ?auto_656190 ?auto_656193 ) ) ( not ( = ?auto_656190 ?auto_656194 ) ) ( not ( = ?auto_656190 ?auto_656195 ) ) ( not ( = ?auto_656190 ?auto_656196 ) ) ( not ( = ?auto_656190 ?auto_656197 ) ) ( not ( = ?auto_656190 ?auto_656198 ) ) ( not ( = ?auto_656190 ?auto_656199 ) ) ( not ( = ?auto_656190 ?auto_656200 ) ) ( not ( = ?auto_656190 ?auto_656201 ) ) ( not ( = ?auto_656190 ?auto_656202 ) ) ( not ( = ?auto_656191 ?auto_656192 ) ) ( not ( = ?auto_656191 ?auto_656193 ) ) ( not ( = ?auto_656191 ?auto_656194 ) ) ( not ( = ?auto_656191 ?auto_656195 ) ) ( not ( = ?auto_656191 ?auto_656196 ) ) ( not ( = ?auto_656191 ?auto_656197 ) ) ( not ( = ?auto_656191 ?auto_656198 ) ) ( not ( = ?auto_656191 ?auto_656199 ) ) ( not ( = ?auto_656191 ?auto_656200 ) ) ( not ( = ?auto_656191 ?auto_656201 ) ) ( not ( = ?auto_656191 ?auto_656202 ) ) ( not ( = ?auto_656192 ?auto_656193 ) ) ( not ( = ?auto_656192 ?auto_656194 ) ) ( not ( = ?auto_656192 ?auto_656195 ) ) ( not ( = ?auto_656192 ?auto_656196 ) ) ( not ( = ?auto_656192 ?auto_656197 ) ) ( not ( = ?auto_656192 ?auto_656198 ) ) ( not ( = ?auto_656192 ?auto_656199 ) ) ( not ( = ?auto_656192 ?auto_656200 ) ) ( not ( = ?auto_656192 ?auto_656201 ) ) ( not ( = ?auto_656192 ?auto_656202 ) ) ( not ( = ?auto_656193 ?auto_656194 ) ) ( not ( = ?auto_656193 ?auto_656195 ) ) ( not ( = ?auto_656193 ?auto_656196 ) ) ( not ( = ?auto_656193 ?auto_656197 ) ) ( not ( = ?auto_656193 ?auto_656198 ) ) ( not ( = ?auto_656193 ?auto_656199 ) ) ( not ( = ?auto_656193 ?auto_656200 ) ) ( not ( = ?auto_656193 ?auto_656201 ) ) ( not ( = ?auto_656193 ?auto_656202 ) ) ( not ( = ?auto_656194 ?auto_656195 ) ) ( not ( = ?auto_656194 ?auto_656196 ) ) ( not ( = ?auto_656194 ?auto_656197 ) ) ( not ( = ?auto_656194 ?auto_656198 ) ) ( not ( = ?auto_656194 ?auto_656199 ) ) ( not ( = ?auto_656194 ?auto_656200 ) ) ( not ( = ?auto_656194 ?auto_656201 ) ) ( not ( = ?auto_656194 ?auto_656202 ) ) ( not ( = ?auto_656195 ?auto_656196 ) ) ( not ( = ?auto_656195 ?auto_656197 ) ) ( not ( = ?auto_656195 ?auto_656198 ) ) ( not ( = ?auto_656195 ?auto_656199 ) ) ( not ( = ?auto_656195 ?auto_656200 ) ) ( not ( = ?auto_656195 ?auto_656201 ) ) ( not ( = ?auto_656195 ?auto_656202 ) ) ( not ( = ?auto_656196 ?auto_656197 ) ) ( not ( = ?auto_656196 ?auto_656198 ) ) ( not ( = ?auto_656196 ?auto_656199 ) ) ( not ( = ?auto_656196 ?auto_656200 ) ) ( not ( = ?auto_656196 ?auto_656201 ) ) ( not ( = ?auto_656196 ?auto_656202 ) ) ( not ( = ?auto_656197 ?auto_656198 ) ) ( not ( = ?auto_656197 ?auto_656199 ) ) ( not ( = ?auto_656197 ?auto_656200 ) ) ( not ( = ?auto_656197 ?auto_656201 ) ) ( not ( = ?auto_656197 ?auto_656202 ) ) ( not ( = ?auto_656198 ?auto_656199 ) ) ( not ( = ?auto_656198 ?auto_656200 ) ) ( not ( = ?auto_656198 ?auto_656201 ) ) ( not ( = ?auto_656198 ?auto_656202 ) ) ( not ( = ?auto_656199 ?auto_656200 ) ) ( not ( = ?auto_656199 ?auto_656201 ) ) ( not ( = ?auto_656199 ?auto_656202 ) ) ( not ( = ?auto_656200 ?auto_656201 ) ) ( not ( = ?auto_656200 ?auto_656202 ) ) ( not ( = ?auto_656201 ?auto_656202 ) ) ( ON ?auto_656200 ?auto_656201 ) ( ON ?auto_656199 ?auto_656200 ) ( ON ?auto_656198 ?auto_656199 ) ( ON ?auto_656197 ?auto_656198 ) ( ON ?auto_656196 ?auto_656197 ) ( ON ?auto_656195 ?auto_656196 ) ( ON ?auto_656194 ?auto_656195 ) ( ON ?auto_656193 ?auto_656194 ) ( ON ?auto_656192 ?auto_656193 ) ( ON ?auto_656191 ?auto_656192 ) ( ON ?auto_656190 ?auto_656191 ) ( ON ?auto_656189 ?auto_656190 ) ( CLEAR ?auto_656187 ) ( ON ?auto_656188 ?auto_656189 ) ( CLEAR ?auto_656188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_656186 ?auto_656187 ?auto_656188 )
      ( MAKE-16PILE ?auto_656186 ?auto_656187 ?auto_656188 ?auto_656189 ?auto_656190 ?auto_656191 ?auto_656192 ?auto_656193 ?auto_656194 ?auto_656195 ?auto_656196 ?auto_656197 ?auto_656198 ?auto_656199 ?auto_656200 ?auto_656201 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_656252 - BLOCK
      ?auto_656253 - BLOCK
      ?auto_656254 - BLOCK
      ?auto_656255 - BLOCK
      ?auto_656256 - BLOCK
      ?auto_656257 - BLOCK
      ?auto_656258 - BLOCK
      ?auto_656259 - BLOCK
      ?auto_656260 - BLOCK
      ?auto_656261 - BLOCK
      ?auto_656262 - BLOCK
      ?auto_656263 - BLOCK
      ?auto_656264 - BLOCK
      ?auto_656265 - BLOCK
      ?auto_656266 - BLOCK
      ?auto_656267 - BLOCK
    )
    :vars
    (
      ?auto_656268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_656267 ?auto_656268 ) ( ON-TABLE ?auto_656252 ) ( not ( = ?auto_656252 ?auto_656253 ) ) ( not ( = ?auto_656252 ?auto_656254 ) ) ( not ( = ?auto_656252 ?auto_656255 ) ) ( not ( = ?auto_656252 ?auto_656256 ) ) ( not ( = ?auto_656252 ?auto_656257 ) ) ( not ( = ?auto_656252 ?auto_656258 ) ) ( not ( = ?auto_656252 ?auto_656259 ) ) ( not ( = ?auto_656252 ?auto_656260 ) ) ( not ( = ?auto_656252 ?auto_656261 ) ) ( not ( = ?auto_656252 ?auto_656262 ) ) ( not ( = ?auto_656252 ?auto_656263 ) ) ( not ( = ?auto_656252 ?auto_656264 ) ) ( not ( = ?auto_656252 ?auto_656265 ) ) ( not ( = ?auto_656252 ?auto_656266 ) ) ( not ( = ?auto_656252 ?auto_656267 ) ) ( not ( = ?auto_656252 ?auto_656268 ) ) ( not ( = ?auto_656253 ?auto_656254 ) ) ( not ( = ?auto_656253 ?auto_656255 ) ) ( not ( = ?auto_656253 ?auto_656256 ) ) ( not ( = ?auto_656253 ?auto_656257 ) ) ( not ( = ?auto_656253 ?auto_656258 ) ) ( not ( = ?auto_656253 ?auto_656259 ) ) ( not ( = ?auto_656253 ?auto_656260 ) ) ( not ( = ?auto_656253 ?auto_656261 ) ) ( not ( = ?auto_656253 ?auto_656262 ) ) ( not ( = ?auto_656253 ?auto_656263 ) ) ( not ( = ?auto_656253 ?auto_656264 ) ) ( not ( = ?auto_656253 ?auto_656265 ) ) ( not ( = ?auto_656253 ?auto_656266 ) ) ( not ( = ?auto_656253 ?auto_656267 ) ) ( not ( = ?auto_656253 ?auto_656268 ) ) ( not ( = ?auto_656254 ?auto_656255 ) ) ( not ( = ?auto_656254 ?auto_656256 ) ) ( not ( = ?auto_656254 ?auto_656257 ) ) ( not ( = ?auto_656254 ?auto_656258 ) ) ( not ( = ?auto_656254 ?auto_656259 ) ) ( not ( = ?auto_656254 ?auto_656260 ) ) ( not ( = ?auto_656254 ?auto_656261 ) ) ( not ( = ?auto_656254 ?auto_656262 ) ) ( not ( = ?auto_656254 ?auto_656263 ) ) ( not ( = ?auto_656254 ?auto_656264 ) ) ( not ( = ?auto_656254 ?auto_656265 ) ) ( not ( = ?auto_656254 ?auto_656266 ) ) ( not ( = ?auto_656254 ?auto_656267 ) ) ( not ( = ?auto_656254 ?auto_656268 ) ) ( not ( = ?auto_656255 ?auto_656256 ) ) ( not ( = ?auto_656255 ?auto_656257 ) ) ( not ( = ?auto_656255 ?auto_656258 ) ) ( not ( = ?auto_656255 ?auto_656259 ) ) ( not ( = ?auto_656255 ?auto_656260 ) ) ( not ( = ?auto_656255 ?auto_656261 ) ) ( not ( = ?auto_656255 ?auto_656262 ) ) ( not ( = ?auto_656255 ?auto_656263 ) ) ( not ( = ?auto_656255 ?auto_656264 ) ) ( not ( = ?auto_656255 ?auto_656265 ) ) ( not ( = ?auto_656255 ?auto_656266 ) ) ( not ( = ?auto_656255 ?auto_656267 ) ) ( not ( = ?auto_656255 ?auto_656268 ) ) ( not ( = ?auto_656256 ?auto_656257 ) ) ( not ( = ?auto_656256 ?auto_656258 ) ) ( not ( = ?auto_656256 ?auto_656259 ) ) ( not ( = ?auto_656256 ?auto_656260 ) ) ( not ( = ?auto_656256 ?auto_656261 ) ) ( not ( = ?auto_656256 ?auto_656262 ) ) ( not ( = ?auto_656256 ?auto_656263 ) ) ( not ( = ?auto_656256 ?auto_656264 ) ) ( not ( = ?auto_656256 ?auto_656265 ) ) ( not ( = ?auto_656256 ?auto_656266 ) ) ( not ( = ?auto_656256 ?auto_656267 ) ) ( not ( = ?auto_656256 ?auto_656268 ) ) ( not ( = ?auto_656257 ?auto_656258 ) ) ( not ( = ?auto_656257 ?auto_656259 ) ) ( not ( = ?auto_656257 ?auto_656260 ) ) ( not ( = ?auto_656257 ?auto_656261 ) ) ( not ( = ?auto_656257 ?auto_656262 ) ) ( not ( = ?auto_656257 ?auto_656263 ) ) ( not ( = ?auto_656257 ?auto_656264 ) ) ( not ( = ?auto_656257 ?auto_656265 ) ) ( not ( = ?auto_656257 ?auto_656266 ) ) ( not ( = ?auto_656257 ?auto_656267 ) ) ( not ( = ?auto_656257 ?auto_656268 ) ) ( not ( = ?auto_656258 ?auto_656259 ) ) ( not ( = ?auto_656258 ?auto_656260 ) ) ( not ( = ?auto_656258 ?auto_656261 ) ) ( not ( = ?auto_656258 ?auto_656262 ) ) ( not ( = ?auto_656258 ?auto_656263 ) ) ( not ( = ?auto_656258 ?auto_656264 ) ) ( not ( = ?auto_656258 ?auto_656265 ) ) ( not ( = ?auto_656258 ?auto_656266 ) ) ( not ( = ?auto_656258 ?auto_656267 ) ) ( not ( = ?auto_656258 ?auto_656268 ) ) ( not ( = ?auto_656259 ?auto_656260 ) ) ( not ( = ?auto_656259 ?auto_656261 ) ) ( not ( = ?auto_656259 ?auto_656262 ) ) ( not ( = ?auto_656259 ?auto_656263 ) ) ( not ( = ?auto_656259 ?auto_656264 ) ) ( not ( = ?auto_656259 ?auto_656265 ) ) ( not ( = ?auto_656259 ?auto_656266 ) ) ( not ( = ?auto_656259 ?auto_656267 ) ) ( not ( = ?auto_656259 ?auto_656268 ) ) ( not ( = ?auto_656260 ?auto_656261 ) ) ( not ( = ?auto_656260 ?auto_656262 ) ) ( not ( = ?auto_656260 ?auto_656263 ) ) ( not ( = ?auto_656260 ?auto_656264 ) ) ( not ( = ?auto_656260 ?auto_656265 ) ) ( not ( = ?auto_656260 ?auto_656266 ) ) ( not ( = ?auto_656260 ?auto_656267 ) ) ( not ( = ?auto_656260 ?auto_656268 ) ) ( not ( = ?auto_656261 ?auto_656262 ) ) ( not ( = ?auto_656261 ?auto_656263 ) ) ( not ( = ?auto_656261 ?auto_656264 ) ) ( not ( = ?auto_656261 ?auto_656265 ) ) ( not ( = ?auto_656261 ?auto_656266 ) ) ( not ( = ?auto_656261 ?auto_656267 ) ) ( not ( = ?auto_656261 ?auto_656268 ) ) ( not ( = ?auto_656262 ?auto_656263 ) ) ( not ( = ?auto_656262 ?auto_656264 ) ) ( not ( = ?auto_656262 ?auto_656265 ) ) ( not ( = ?auto_656262 ?auto_656266 ) ) ( not ( = ?auto_656262 ?auto_656267 ) ) ( not ( = ?auto_656262 ?auto_656268 ) ) ( not ( = ?auto_656263 ?auto_656264 ) ) ( not ( = ?auto_656263 ?auto_656265 ) ) ( not ( = ?auto_656263 ?auto_656266 ) ) ( not ( = ?auto_656263 ?auto_656267 ) ) ( not ( = ?auto_656263 ?auto_656268 ) ) ( not ( = ?auto_656264 ?auto_656265 ) ) ( not ( = ?auto_656264 ?auto_656266 ) ) ( not ( = ?auto_656264 ?auto_656267 ) ) ( not ( = ?auto_656264 ?auto_656268 ) ) ( not ( = ?auto_656265 ?auto_656266 ) ) ( not ( = ?auto_656265 ?auto_656267 ) ) ( not ( = ?auto_656265 ?auto_656268 ) ) ( not ( = ?auto_656266 ?auto_656267 ) ) ( not ( = ?auto_656266 ?auto_656268 ) ) ( not ( = ?auto_656267 ?auto_656268 ) ) ( ON ?auto_656266 ?auto_656267 ) ( ON ?auto_656265 ?auto_656266 ) ( ON ?auto_656264 ?auto_656265 ) ( ON ?auto_656263 ?auto_656264 ) ( ON ?auto_656262 ?auto_656263 ) ( ON ?auto_656261 ?auto_656262 ) ( ON ?auto_656260 ?auto_656261 ) ( ON ?auto_656259 ?auto_656260 ) ( ON ?auto_656258 ?auto_656259 ) ( ON ?auto_656257 ?auto_656258 ) ( ON ?auto_656256 ?auto_656257 ) ( ON ?auto_656255 ?auto_656256 ) ( ON ?auto_656254 ?auto_656255 ) ( CLEAR ?auto_656252 ) ( ON ?auto_656253 ?auto_656254 ) ( CLEAR ?auto_656253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_656252 ?auto_656253 )
      ( MAKE-16PILE ?auto_656252 ?auto_656253 ?auto_656254 ?auto_656255 ?auto_656256 ?auto_656257 ?auto_656258 ?auto_656259 ?auto_656260 ?auto_656261 ?auto_656262 ?auto_656263 ?auto_656264 ?auto_656265 ?auto_656266 ?auto_656267 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_656318 - BLOCK
      ?auto_656319 - BLOCK
      ?auto_656320 - BLOCK
      ?auto_656321 - BLOCK
      ?auto_656322 - BLOCK
      ?auto_656323 - BLOCK
      ?auto_656324 - BLOCK
      ?auto_656325 - BLOCK
      ?auto_656326 - BLOCK
      ?auto_656327 - BLOCK
      ?auto_656328 - BLOCK
      ?auto_656329 - BLOCK
      ?auto_656330 - BLOCK
      ?auto_656331 - BLOCK
      ?auto_656332 - BLOCK
      ?auto_656333 - BLOCK
    )
    :vars
    (
      ?auto_656334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_656333 ?auto_656334 ) ( not ( = ?auto_656318 ?auto_656319 ) ) ( not ( = ?auto_656318 ?auto_656320 ) ) ( not ( = ?auto_656318 ?auto_656321 ) ) ( not ( = ?auto_656318 ?auto_656322 ) ) ( not ( = ?auto_656318 ?auto_656323 ) ) ( not ( = ?auto_656318 ?auto_656324 ) ) ( not ( = ?auto_656318 ?auto_656325 ) ) ( not ( = ?auto_656318 ?auto_656326 ) ) ( not ( = ?auto_656318 ?auto_656327 ) ) ( not ( = ?auto_656318 ?auto_656328 ) ) ( not ( = ?auto_656318 ?auto_656329 ) ) ( not ( = ?auto_656318 ?auto_656330 ) ) ( not ( = ?auto_656318 ?auto_656331 ) ) ( not ( = ?auto_656318 ?auto_656332 ) ) ( not ( = ?auto_656318 ?auto_656333 ) ) ( not ( = ?auto_656318 ?auto_656334 ) ) ( not ( = ?auto_656319 ?auto_656320 ) ) ( not ( = ?auto_656319 ?auto_656321 ) ) ( not ( = ?auto_656319 ?auto_656322 ) ) ( not ( = ?auto_656319 ?auto_656323 ) ) ( not ( = ?auto_656319 ?auto_656324 ) ) ( not ( = ?auto_656319 ?auto_656325 ) ) ( not ( = ?auto_656319 ?auto_656326 ) ) ( not ( = ?auto_656319 ?auto_656327 ) ) ( not ( = ?auto_656319 ?auto_656328 ) ) ( not ( = ?auto_656319 ?auto_656329 ) ) ( not ( = ?auto_656319 ?auto_656330 ) ) ( not ( = ?auto_656319 ?auto_656331 ) ) ( not ( = ?auto_656319 ?auto_656332 ) ) ( not ( = ?auto_656319 ?auto_656333 ) ) ( not ( = ?auto_656319 ?auto_656334 ) ) ( not ( = ?auto_656320 ?auto_656321 ) ) ( not ( = ?auto_656320 ?auto_656322 ) ) ( not ( = ?auto_656320 ?auto_656323 ) ) ( not ( = ?auto_656320 ?auto_656324 ) ) ( not ( = ?auto_656320 ?auto_656325 ) ) ( not ( = ?auto_656320 ?auto_656326 ) ) ( not ( = ?auto_656320 ?auto_656327 ) ) ( not ( = ?auto_656320 ?auto_656328 ) ) ( not ( = ?auto_656320 ?auto_656329 ) ) ( not ( = ?auto_656320 ?auto_656330 ) ) ( not ( = ?auto_656320 ?auto_656331 ) ) ( not ( = ?auto_656320 ?auto_656332 ) ) ( not ( = ?auto_656320 ?auto_656333 ) ) ( not ( = ?auto_656320 ?auto_656334 ) ) ( not ( = ?auto_656321 ?auto_656322 ) ) ( not ( = ?auto_656321 ?auto_656323 ) ) ( not ( = ?auto_656321 ?auto_656324 ) ) ( not ( = ?auto_656321 ?auto_656325 ) ) ( not ( = ?auto_656321 ?auto_656326 ) ) ( not ( = ?auto_656321 ?auto_656327 ) ) ( not ( = ?auto_656321 ?auto_656328 ) ) ( not ( = ?auto_656321 ?auto_656329 ) ) ( not ( = ?auto_656321 ?auto_656330 ) ) ( not ( = ?auto_656321 ?auto_656331 ) ) ( not ( = ?auto_656321 ?auto_656332 ) ) ( not ( = ?auto_656321 ?auto_656333 ) ) ( not ( = ?auto_656321 ?auto_656334 ) ) ( not ( = ?auto_656322 ?auto_656323 ) ) ( not ( = ?auto_656322 ?auto_656324 ) ) ( not ( = ?auto_656322 ?auto_656325 ) ) ( not ( = ?auto_656322 ?auto_656326 ) ) ( not ( = ?auto_656322 ?auto_656327 ) ) ( not ( = ?auto_656322 ?auto_656328 ) ) ( not ( = ?auto_656322 ?auto_656329 ) ) ( not ( = ?auto_656322 ?auto_656330 ) ) ( not ( = ?auto_656322 ?auto_656331 ) ) ( not ( = ?auto_656322 ?auto_656332 ) ) ( not ( = ?auto_656322 ?auto_656333 ) ) ( not ( = ?auto_656322 ?auto_656334 ) ) ( not ( = ?auto_656323 ?auto_656324 ) ) ( not ( = ?auto_656323 ?auto_656325 ) ) ( not ( = ?auto_656323 ?auto_656326 ) ) ( not ( = ?auto_656323 ?auto_656327 ) ) ( not ( = ?auto_656323 ?auto_656328 ) ) ( not ( = ?auto_656323 ?auto_656329 ) ) ( not ( = ?auto_656323 ?auto_656330 ) ) ( not ( = ?auto_656323 ?auto_656331 ) ) ( not ( = ?auto_656323 ?auto_656332 ) ) ( not ( = ?auto_656323 ?auto_656333 ) ) ( not ( = ?auto_656323 ?auto_656334 ) ) ( not ( = ?auto_656324 ?auto_656325 ) ) ( not ( = ?auto_656324 ?auto_656326 ) ) ( not ( = ?auto_656324 ?auto_656327 ) ) ( not ( = ?auto_656324 ?auto_656328 ) ) ( not ( = ?auto_656324 ?auto_656329 ) ) ( not ( = ?auto_656324 ?auto_656330 ) ) ( not ( = ?auto_656324 ?auto_656331 ) ) ( not ( = ?auto_656324 ?auto_656332 ) ) ( not ( = ?auto_656324 ?auto_656333 ) ) ( not ( = ?auto_656324 ?auto_656334 ) ) ( not ( = ?auto_656325 ?auto_656326 ) ) ( not ( = ?auto_656325 ?auto_656327 ) ) ( not ( = ?auto_656325 ?auto_656328 ) ) ( not ( = ?auto_656325 ?auto_656329 ) ) ( not ( = ?auto_656325 ?auto_656330 ) ) ( not ( = ?auto_656325 ?auto_656331 ) ) ( not ( = ?auto_656325 ?auto_656332 ) ) ( not ( = ?auto_656325 ?auto_656333 ) ) ( not ( = ?auto_656325 ?auto_656334 ) ) ( not ( = ?auto_656326 ?auto_656327 ) ) ( not ( = ?auto_656326 ?auto_656328 ) ) ( not ( = ?auto_656326 ?auto_656329 ) ) ( not ( = ?auto_656326 ?auto_656330 ) ) ( not ( = ?auto_656326 ?auto_656331 ) ) ( not ( = ?auto_656326 ?auto_656332 ) ) ( not ( = ?auto_656326 ?auto_656333 ) ) ( not ( = ?auto_656326 ?auto_656334 ) ) ( not ( = ?auto_656327 ?auto_656328 ) ) ( not ( = ?auto_656327 ?auto_656329 ) ) ( not ( = ?auto_656327 ?auto_656330 ) ) ( not ( = ?auto_656327 ?auto_656331 ) ) ( not ( = ?auto_656327 ?auto_656332 ) ) ( not ( = ?auto_656327 ?auto_656333 ) ) ( not ( = ?auto_656327 ?auto_656334 ) ) ( not ( = ?auto_656328 ?auto_656329 ) ) ( not ( = ?auto_656328 ?auto_656330 ) ) ( not ( = ?auto_656328 ?auto_656331 ) ) ( not ( = ?auto_656328 ?auto_656332 ) ) ( not ( = ?auto_656328 ?auto_656333 ) ) ( not ( = ?auto_656328 ?auto_656334 ) ) ( not ( = ?auto_656329 ?auto_656330 ) ) ( not ( = ?auto_656329 ?auto_656331 ) ) ( not ( = ?auto_656329 ?auto_656332 ) ) ( not ( = ?auto_656329 ?auto_656333 ) ) ( not ( = ?auto_656329 ?auto_656334 ) ) ( not ( = ?auto_656330 ?auto_656331 ) ) ( not ( = ?auto_656330 ?auto_656332 ) ) ( not ( = ?auto_656330 ?auto_656333 ) ) ( not ( = ?auto_656330 ?auto_656334 ) ) ( not ( = ?auto_656331 ?auto_656332 ) ) ( not ( = ?auto_656331 ?auto_656333 ) ) ( not ( = ?auto_656331 ?auto_656334 ) ) ( not ( = ?auto_656332 ?auto_656333 ) ) ( not ( = ?auto_656332 ?auto_656334 ) ) ( not ( = ?auto_656333 ?auto_656334 ) ) ( ON ?auto_656332 ?auto_656333 ) ( ON ?auto_656331 ?auto_656332 ) ( ON ?auto_656330 ?auto_656331 ) ( ON ?auto_656329 ?auto_656330 ) ( ON ?auto_656328 ?auto_656329 ) ( ON ?auto_656327 ?auto_656328 ) ( ON ?auto_656326 ?auto_656327 ) ( ON ?auto_656325 ?auto_656326 ) ( ON ?auto_656324 ?auto_656325 ) ( ON ?auto_656323 ?auto_656324 ) ( ON ?auto_656322 ?auto_656323 ) ( ON ?auto_656321 ?auto_656322 ) ( ON ?auto_656320 ?auto_656321 ) ( ON ?auto_656319 ?auto_656320 ) ( ON ?auto_656318 ?auto_656319 ) ( CLEAR ?auto_656318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_656318 )
      ( MAKE-16PILE ?auto_656318 ?auto_656319 ?auto_656320 ?auto_656321 ?auto_656322 ?auto_656323 ?auto_656324 ?auto_656325 ?auto_656326 ?auto_656327 ?auto_656328 ?auto_656329 ?auto_656330 ?auto_656331 ?auto_656332 ?auto_656333 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_656385 - BLOCK
      ?auto_656386 - BLOCK
      ?auto_656387 - BLOCK
      ?auto_656388 - BLOCK
      ?auto_656389 - BLOCK
      ?auto_656390 - BLOCK
      ?auto_656391 - BLOCK
      ?auto_656392 - BLOCK
      ?auto_656393 - BLOCK
      ?auto_656394 - BLOCK
      ?auto_656395 - BLOCK
      ?auto_656396 - BLOCK
      ?auto_656397 - BLOCK
      ?auto_656398 - BLOCK
      ?auto_656399 - BLOCK
      ?auto_656400 - BLOCK
      ?auto_656401 - BLOCK
    )
    :vars
    (
      ?auto_656402 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_656400 ) ( ON ?auto_656401 ?auto_656402 ) ( CLEAR ?auto_656401 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_656385 ) ( ON ?auto_656386 ?auto_656385 ) ( ON ?auto_656387 ?auto_656386 ) ( ON ?auto_656388 ?auto_656387 ) ( ON ?auto_656389 ?auto_656388 ) ( ON ?auto_656390 ?auto_656389 ) ( ON ?auto_656391 ?auto_656390 ) ( ON ?auto_656392 ?auto_656391 ) ( ON ?auto_656393 ?auto_656392 ) ( ON ?auto_656394 ?auto_656393 ) ( ON ?auto_656395 ?auto_656394 ) ( ON ?auto_656396 ?auto_656395 ) ( ON ?auto_656397 ?auto_656396 ) ( ON ?auto_656398 ?auto_656397 ) ( ON ?auto_656399 ?auto_656398 ) ( ON ?auto_656400 ?auto_656399 ) ( not ( = ?auto_656385 ?auto_656386 ) ) ( not ( = ?auto_656385 ?auto_656387 ) ) ( not ( = ?auto_656385 ?auto_656388 ) ) ( not ( = ?auto_656385 ?auto_656389 ) ) ( not ( = ?auto_656385 ?auto_656390 ) ) ( not ( = ?auto_656385 ?auto_656391 ) ) ( not ( = ?auto_656385 ?auto_656392 ) ) ( not ( = ?auto_656385 ?auto_656393 ) ) ( not ( = ?auto_656385 ?auto_656394 ) ) ( not ( = ?auto_656385 ?auto_656395 ) ) ( not ( = ?auto_656385 ?auto_656396 ) ) ( not ( = ?auto_656385 ?auto_656397 ) ) ( not ( = ?auto_656385 ?auto_656398 ) ) ( not ( = ?auto_656385 ?auto_656399 ) ) ( not ( = ?auto_656385 ?auto_656400 ) ) ( not ( = ?auto_656385 ?auto_656401 ) ) ( not ( = ?auto_656385 ?auto_656402 ) ) ( not ( = ?auto_656386 ?auto_656387 ) ) ( not ( = ?auto_656386 ?auto_656388 ) ) ( not ( = ?auto_656386 ?auto_656389 ) ) ( not ( = ?auto_656386 ?auto_656390 ) ) ( not ( = ?auto_656386 ?auto_656391 ) ) ( not ( = ?auto_656386 ?auto_656392 ) ) ( not ( = ?auto_656386 ?auto_656393 ) ) ( not ( = ?auto_656386 ?auto_656394 ) ) ( not ( = ?auto_656386 ?auto_656395 ) ) ( not ( = ?auto_656386 ?auto_656396 ) ) ( not ( = ?auto_656386 ?auto_656397 ) ) ( not ( = ?auto_656386 ?auto_656398 ) ) ( not ( = ?auto_656386 ?auto_656399 ) ) ( not ( = ?auto_656386 ?auto_656400 ) ) ( not ( = ?auto_656386 ?auto_656401 ) ) ( not ( = ?auto_656386 ?auto_656402 ) ) ( not ( = ?auto_656387 ?auto_656388 ) ) ( not ( = ?auto_656387 ?auto_656389 ) ) ( not ( = ?auto_656387 ?auto_656390 ) ) ( not ( = ?auto_656387 ?auto_656391 ) ) ( not ( = ?auto_656387 ?auto_656392 ) ) ( not ( = ?auto_656387 ?auto_656393 ) ) ( not ( = ?auto_656387 ?auto_656394 ) ) ( not ( = ?auto_656387 ?auto_656395 ) ) ( not ( = ?auto_656387 ?auto_656396 ) ) ( not ( = ?auto_656387 ?auto_656397 ) ) ( not ( = ?auto_656387 ?auto_656398 ) ) ( not ( = ?auto_656387 ?auto_656399 ) ) ( not ( = ?auto_656387 ?auto_656400 ) ) ( not ( = ?auto_656387 ?auto_656401 ) ) ( not ( = ?auto_656387 ?auto_656402 ) ) ( not ( = ?auto_656388 ?auto_656389 ) ) ( not ( = ?auto_656388 ?auto_656390 ) ) ( not ( = ?auto_656388 ?auto_656391 ) ) ( not ( = ?auto_656388 ?auto_656392 ) ) ( not ( = ?auto_656388 ?auto_656393 ) ) ( not ( = ?auto_656388 ?auto_656394 ) ) ( not ( = ?auto_656388 ?auto_656395 ) ) ( not ( = ?auto_656388 ?auto_656396 ) ) ( not ( = ?auto_656388 ?auto_656397 ) ) ( not ( = ?auto_656388 ?auto_656398 ) ) ( not ( = ?auto_656388 ?auto_656399 ) ) ( not ( = ?auto_656388 ?auto_656400 ) ) ( not ( = ?auto_656388 ?auto_656401 ) ) ( not ( = ?auto_656388 ?auto_656402 ) ) ( not ( = ?auto_656389 ?auto_656390 ) ) ( not ( = ?auto_656389 ?auto_656391 ) ) ( not ( = ?auto_656389 ?auto_656392 ) ) ( not ( = ?auto_656389 ?auto_656393 ) ) ( not ( = ?auto_656389 ?auto_656394 ) ) ( not ( = ?auto_656389 ?auto_656395 ) ) ( not ( = ?auto_656389 ?auto_656396 ) ) ( not ( = ?auto_656389 ?auto_656397 ) ) ( not ( = ?auto_656389 ?auto_656398 ) ) ( not ( = ?auto_656389 ?auto_656399 ) ) ( not ( = ?auto_656389 ?auto_656400 ) ) ( not ( = ?auto_656389 ?auto_656401 ) ) ( not ( = ?auto_656389 ?auto_656402 ) ) ( not ( = ?auto_656390 ?auto_656391 ) ) ( not ( = ?auto_656390 ?auto_656392 ) ) ( not ( = ?auto_656390 ?auto_656393 ) ) ( not ( = ?auto_656390 ?auto_656394 ) ) ( not ( = ?auto_656390 ?auto_656395 ) ) ( not ( = ?auto_656390 ?auto_656396 ) ) ( not ( = ?auto_656390 ?auto_656397 ) ) ( not ( = ?auto_656390 ?auto_656398 ) ) ( not ( = ?auto_656390 ?auto_656399 ) ) ( not ( = ?auto_656390 ?auto_656400 ) ) ( not ( = ?auto_656390 ?auto_656401 ) ) ( not ( = ?auto_656390 ?auto_656402 ) ) ( not ( = ?auto_656391 ?auto_656392 ) ) ( not ( = ?auto_656391 ?auto_656393 ) ) ( not ( = ?auto_656391 ?auto_656394 ) ) ( not ( = ?auto_656391 ?auto_656395 ) ) ( not ( = ?auto_656391 ?auto_656396 ) ) ( not ( = ?auto_656391 ?auto_656397 ) ) ( not ( = ?auto_656391 ?auto_656398 ) ) ( not ( = ?auto_656391 ?auto_656399 ) ) ( not ( = ?auto_656391 ?auto_656400 ) ) ( not ( = ?auto_656391 ?auto_656401 ) ) ( not ( = ?auto_656391 ?auto_656402 ) ) ( not ( = ?auto_656392 ?auto_656393 ) ) ( not ( = ?auto_656392 ?auto_656394 ) ) ( not ( = ?auto_656392 ?auto_656395 ) ) ( not ( = ?auto_656392 ?auto_656396 ) ) ( not ( = ?auto_656392 ?auto_656397 ) ) ( not ( = ?auto_656392 ?auto_656398 ) ) ( not ( = ?auto_656392 ?auto_656399 ) ) ( not ( = ?auto_656392 ?auto_656400 ) ) ( not ( = ?auto_656392 ?auto_656401 ) ) ( not ( = ?auto_656392 ?auto_656402 ) ) ( not ( = ?auto_656393 ?auto_656394 ) ) ( not ( = ?auto_656393 ?auto_656395 ) ) ( not ( = ?auto_656393 ?auto_656396 ) ) ( not ( = ?auto_656393 ?auto_656397 ) ) ( not ( = ?auto_656393 ?auto_656398 ) ) ( not ( = ?auto_656393 ?auto_656399 ) ) ( not ( = ?auto_656393 ?auto_656400 ) ) ( not ( = ?auto_656393 ?auto_656401 ) ) ( not ( = ?auto_656393 ?auto_656402 ) ) ( not ( = ?auto_656394 ?auto_656395 ) ) ( not ( = ?auto_656394 ?auto_656396 ) ) ( not ( = ?auto_656394 ?auto_656397 ) ) ( not ( = ?auto_656394 ?auto_656398 ) ) ( not ( = ?auto_656394 ?auto_656399 ) ) ( not ( = ?auto_656394 ?auto_656400 ) ) ( not ( = ?auto_656394 ?auto_656401 ) ) ( not ( = ?auto_656394 ?auto_656402 ) ) ( not ( = ?auto_656395 ?auto_656396 ) ) ( not ( = ?auto_656395 ?auto_656397 ) ) ( not ( = ?auto_656395 ?auto_656398 ) ) ( not ( = ?auto_656395 ?auto_656399 ) ) ( not ( = ?auto_656395 ?auto_656400 ) ) ( not ( = ?auto_656395 ?auto_656401 ) ) ( not ( = ?auto_656395 ?auto_656402 ) ) ( not ( = ?auto_656396 ?auto_656397 ) ) ( not ( = ?auto_656396 ?auto_656398 ) ) ( not ( = ?auto_656396 ?auto_656399 ) ) ( not ( = ?auto_656396 ?auto_656400 ) ) ( not ( = ?auto_656396 ?auto_656401 ) ) ( not ( = ?auto_656396 ?auto_656402 ) ) ( not ( = ?auto_656397 ?auto_656398 ) ) ( not ( = ?auto_656397 ?auto_656399 ) ) ( not ( = ?auto_656397 ?auto_656400 ) ) ( not ( = ?auto_656397 ?auto_656401 ) ) ( not ( = ?auto_656397 ?auto_656402 ) ) ( not ( = ?auto_656398 ?auto_656399 ) ) ( not ( = ?auto_656398 ?auto_656400 ) ) ( not ( = ?auto_656398 ?auto_656401 ) ) ( not ( = ?auto_656398 ?auto_656402 ) ) ( not ( = ?auto_656399 ?auto_656400 ) ) ( not ( = ?auto_656399 ?auto_656401 ) ) ( not ( = ?auto_656399 ?auto_656402 ) ) ( not ( = ?auto_656400 ?auto_656401 ) ) ( not ( = ?auto_656400 ?auto_656402 ) ) ( not ( = ?auto_656401 ?auto_656402 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_656401 ?auto_656402 )
      ( !STACK ?auto_656401 ?auto_656400 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_656420 - BLOCK
      ?auto_656421 - BLOCK
      ?auto_656422 - BLOCK
      ?auto_656423 - BLOCK
      ?auto_656424 - BLOCK
      ?auto_656425 - BLOCK
      ?auto_656426 - BLOCK
      ?auto_656427 - BLOCK
      ?auto_656428 - BLOCK
      ?auto_656429 - BLOCK
      ?auto_656430 - BLOCK
      ?auto_656431 - BLOCK
      ?auto_656432 - BLOCK
      ?auto_656433 - BLOCK
      ?auto_656434 - BLOCK
      ?auto_656435 - BLOCK
      ?auto_656436 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_656435 ) ( ON-TABLE ?auto_656436 ) ( CLEAR ?auto_656436 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_656420 ) ( ON ?auto_656421 ?auto_656420 ) ( ON ?auto_656422 ?auto_656421 ) ( ON ?auto_656423 ?auto_656422 ) ( ON ?auto_656424 ?auto_656423 ) ( ON ?auto_656425 ?auto_656424 ) ( ON ?auto_656426 ?auto_656425 ) ( ON ?auto_656427 ?auto_656426 ) ( ON ?auto_656428 ?auto_656427 ) ( ON ?auto_656429 ?auto_656428 ) ( ON ?auto_656430 ?auto_656429 ) ( ON ?auto_656431 ?auto_656430 ) ( ON ?auto_656432 ?auto_656431 ) ( ON ?auto_656433 ?auto_656432 ) ( ON ?auto_656434 ?auto_656433 ) ( ON ?auto_656435 ?auto_656434 ) ( not ( = ?auto_656420 ?auto_656421 ) ) ( not ( = ?auto_656420 ?auto_656422 ) ) ( not ( = ?auto_656420 ?auto_656423 ) ) ( not ( = ?auto_656420 ?auto_656424 ) ) ( not ( = ?auto_656420 ?auto_656425 ) ) ( not ( = ?auto_656420 ?auto_656426 ) ) ( not ( = ?auto_656420 ?auto_656427 ) ) ( not ( = ?auto_656420 ?auto_656428 ) ) ( not ( = ?auto_656420 ?auto_656429 ) ) ( not ( = ?auto_656420 ?auto_656430 ) ) ( not ( = ?auto_656420 ?auto_656431 ) ) ( not ( = ?auto_656420 ?auto_656432 ) ) ( not ( = ?auto_656420 ?auto_656433 ) ) ( not ( = ?auto_656420 ?auto_656434 ) ) ( not ( = ?auto_656420 ?auto_656435 ) ) ( not ( = ?auto_656420 ?auto_656436 ) ) ( not ( = ?auto_656421 ?auto_656422 ) ) ( not ( = ?auto_656421 ?auto_656423 ) ) ( not ( = ?auto_656421 ?auto_656424 ) ) ( not ( = ?auto_656421 ?auto_656425 ) ) ( not ( = ?auto_656421 ?auto_656426 ) ) ( not ( = ?auto_656421 ?auto_656427 ) ) ( not ( = ?auto_656421 ?auto_656428 ) ) ( not ( = ?auto_656421 ?auto_656429 ) ) ( not ( = ?auto_656421 ?auto_656430 ) ) ( not ( = ?auto_656421 ?auto_656431 ) ) ( not ( = ?auto_656421 ?auto_656432 ) ) ( not ( = ?auto_656421 ?auto_656433 ) ) ( not ( = ?auto_656421 ?auto_656434 ) ) ( not ( = ?auto_656421 ?auto_656435 ) ) ( not ( = ?auto_656421 ?auto_656436 ) ) ( not ( = ?auto_656422 ?auto_656423 ) ) ( not ( = ?auto_656422 ?auto_656424 ) ) ( not ( = ?auto_656422 ?auto_656425 ) ) ( not ( = ?auto_656422 ?auto_656426 ) ) ( not ( = ?auto_656422 ?auto_656427 ) ) ( not ( = ?auto_656422 ?auto_656428 ) ) ( not ( = ?auto_656422 ?auto_656429 ) ) ( not ( = ?auto_656422 ?auto_656430 ) ) ( not ( = ?auto_656422 ?auto_656431 ) ) ( not ( = ?auto_656422 ?auto_656432 ) ) ( not ( = ?auto_656422 ?auto_656433 ) ) ( not ( = ?auto_656422 ?auto_656434 ) ) ( not ( = ?auto_656422 ?auto_656435 ) ) ( not ( = ?auto_656422 ?auto_656436 ) ) ( not ( = ?auto_656423 ?auto_656424 ) ) ( not ( = ?auto_656423 ?auto_656425 ) ) ( not ( = ?auto_656423 ?auto_656426 ) ) ( not ( = ?auto_656423 ?auto_656427 ) ) ( not ( = ?auto_656423 ?auto_656428 ) ) ( not ( = ?auto_656423 ?auto_656429 ) ) ( not ( = ?auto_656423 ?auto_656430 ) ) ( not ( = ?auto_656423 ?auto_656431 ) ) ( not ( = ?auto_656423 ?auto_656432 ) ) ( not ( = ?auto_656423 ?auto_656433 ) ) ( not ( = ?auto_656423 ?auto_656434 ) ) ( not ( = ?auto_656423 ?auto_656435 ) ) ( not ( = ?auto_656423 ?auto_656436 ) ) ( not ( = ?auto_656424 ?auto_656425 ) ) ( not ( = ?auto_656424 ?auto_656426 ) ) ( not ( = ?auto_656424 ?auto_656427 ) ) ( not ( = ?auto_656424 ?auto_656428 ) ) ( not ( = ?auto_656424 ?auto_656429 ) ) ( not ( = ?auto_656424 ?auto_656430 ) ) ( not ( = ?auto_656424 ?auto_656431 ) ) ( not ( = ?auto_656424 ?auto_656432 ) ) ( not ( = ?auto_656424 ?auto_656433 ) ) ( not ( = ?auto_656424 ?auto_656434 ) ) ( not ( = ?auto_656424 ?auto_656435 ) ) ( not ( = ?auto_656424 ?auto_656436 ) ) ( not ( = ?auto_656425 ?auto_656426 ) ) ( not ( = ?auto_656425 ?auto_656427 ) ) ( not ( = ?auto_656425 ?auto_656428 ) ) ( not ( = ?auto_656425 ?auto_656429 ) ) ( not ( = ?auto_656425 ?auto_656430 ) ) ( not ( = ?auto_656425 ?auto_656431 ) ) ( not ( = ?auto_656425 ?auto_656432 ) ) ( not ( = ?auto_656425 ?auto_656433 ) ) ( not ( = ?auto_656425 ?auto_656434 ) ) ( not ( = ?auto_656425 ?auto_656435 ) ) ( not ( = ?auto_656425 ?auto_656436 ) ) ( not ( = ?auto_656426 ?auto_656427 ) ) ( not ( = ?auto_656426 ?auto_656428 ) ) ( not ( = ?auto_656426 ?auto_656429 ) ) ( not ( = ?auto_656426 ?auto_656430 ) ) ( not ( = ?auto_656426 ?auto_656431 ) ) ( not ( = ?auto_656426 ?auto_656432 ) ) ( not ( = ?auto_656426 ?auto_656433 ) ) ( not ( = ?auto_656426 ?auto_656434 ) ) ( not ( = ?auto_656426 ?auto_656435 ) ) ( not ( = ?auto_656426 ?auto_656436 ) ) ( not ( = ?auto_656427 ?auto_656428 ) ) ( not ( = ?auto_656427 ?auto_656429 ) ) ( not ( = ?auto_656427 ?auto_656430 ) ) ( not ( = ?auto_656427 ?auto_656431 ) ) ( not ( = ?auto_656427 ?auto_656432 ) ) ( not ( = ?auto_656427 ?auto_656433 ) ) ( not ( = ?auto_656427 ?auto_656434 ) ) ( not ( = ?auto_656427 ?auto_656435 ) ) ( not ( = ?auto_656427 ?auto_656436 ) ) ( not ( = ?auto_656428 ?auto_656429 ) ) ( not ( = ?auto_656428 ?auto_656430 ) ) ( not ( = ?auto_656428 ?auto_656431 ) ) ( not ( = ?auto_656428 ?auto_656432 ) ) ( not ( = ?auto_656428 ?auto_656433 ) ) ( not ( = ?auto_656428 ?auto_656434 ) ) ( not ( = ?auto_656428 ?auto_656435 ) ) ( not ( = ?auto_656428 ?auto_656436 ) ) ( not ( = ?auto_656429 ?auto_656430 ) ) ( not ( = ?auto_656429 ?auto_656431 ) ) ( not ( = ?auto_656429 ?auto_656432 ) ) ( not ( = ?auto_656429 ?auto_656433 ) ) ( not ( = ?auto_656429 ?auto_656434 ) ) ( not ( = ?auto_656429 ?auto_656435 ) ) ( not ( = ?auto_656429 ?auto_656436 ) ) ( not ( = ?auto_656430 ?auto_656431 ) ) ( not ( = ?auto_656430 ?auto_656432 ) ) ( not ( = ?auto_656430 ?auto_656433 ) ) ( not ( = ?auto_656430 ?auto_656434 ) ) ( not ( = ?auto_656430 ?auto_656435 ) ) ( not ( = ?auto_656430 ?auto_656436 ) ) ( not ( = ?auto_656431 ?auto_656432 ) ) ( not ( = ?auto_656431 ?auto_656433 ) ) ( not ( = ?auto_656431 ?auto_656434 ) ) ( not ( = ?auto_656431 ?auto_656435 ) ) ( not ( = ?auto_656431 ?auto_656436 ) ) ( not ( = ?auto_656432 ?auto_656433 ) ) ( not ( = ?auto_656432 ?auto_656434 ) ) ( not ( = ?auto_656432 ?auto_656435 ) ) ( not ( = ?auto_656432 ?auto_656436 ) ) ( not ( = ?auto_656433 ?auto_656434 ) ) ( not ( = ?auto_656433 ?auto_656435 ) ) ( not ( = ?auto_656433 ?auto_656436 ) ) ( not ( = ?auto_656434 ?auto_656435 ) ) ( not ( = ?auto_656434 ?auto_656436 ) ) ( not ( = ?auto_656435 ?auto_656436 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_656436 )
      ( !STACK ?auto_656436 ?auto_656435 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_656454 - BLOCK
      ?auto_656455 - BLOCK
      ?auto_656456 - BLOCK
      ?auto_656457 - BLOCK
      ?auto_656458 - BLOCK
      ?auto_656459 - BLOCK
      ?auto_656460 - BLOCK
      ?auto_656461 - BLOCK
      ?auto_656462 - BLOCK
      ?auto_656463 - BLOCK
      ?auto_656464 - BLOCK
      ?auto_656465 - BLOCK
      ?auto_656466 - BLOCK
      ?auto_656467 - BLOCK
      ?auto_656468 - BLOCK
      ?auto_656469 - BLOCK
      ?auto_656470 - BLOCK
    )
    :vars
    (
      ?auto_656471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_656470 ?auto_656471 ) ( ON-TABLE ?auto_656454 ) ( ON ?auto_656455 ?auto_656454 ) ( ON ?auto_656456 ?auto_656455 ) ( ON ?auto_656457 ?auto_656456 ) ( ON ?auto_656458 ?auto_656457 ) ( ON ?auto_656459 ?auto_656458 ) ( ON ?auto_656460 ?auto_656459 ) ( ON ?auto_656461 ?auto_656460 ) ( ON ?auto_656462 ?auto_656461 ) ( ON ?auto_656463 ?auto_656462 ) ( ON ?auto_656464 ?auto_656463 ) ( ON ?auto_656465 ?auto_656464 ) ( ON ?auto_656466 ?auto_656465 ) ( ON ?auto_656467 ?auto_656466 ) ( ON ?auto_656468 ?auto_656467 ) ( not ( = ?auto_656454 ?auto_656455 ) ) ( not ( = ?auto_656454 ?auto_656456 ) ) ( not ( = ?auto_656454 ?auto_656457 ) ) ( not ( = ?auto_656454 ?auto_656458 ) ) ( not ( = ?auto_656454 ?auto_656459 ) ) ( not ( = ?auto_656454 ?auto_656460 ) ) ( not ( = ?auto_656454 ?auto_656461 ) ) ( not ( = ?auto_656454 ?auto_656462 ) ) ( not ( = ?auto_656454 ?auto_656463 ) ) ( not ( = ?auto_656454 ?auto_656464 ) ) ( not ( = ?auto_656454 ?auto_656465 ) ) ( not ( = ?auto_656454 ?auto_656466 ) ) ( not ( = ?auto_656454 ?auto_656467 ) ) ( not ( = ?auto_656454 ?auto_656468 ) ) ( not ( = ?auto_656454 ?auto_656469 ) ) ( not ( = ?auto_656454 ?auto_656470 ) ) ( not ( = ?auto_656454 ?auto_656471 ) ) ( not ( = ?auto_656455 ?auto_656456 ) ) ( not ( = ?auto_656455 ?auto_656457 ) ) ( not ( = ?auto_656455 ?auto_656458 ) ) ( not ( = ?auto_656455 ?auto_656459 ) ) ( not ( = ?auto_656455 ?auto_656460 ) ) ( not ( = ?auto_656455 ?auto_656461 ) ) ( not ( = ?auto_656455 ?auto_656462 ) ) ( not ( = ?auto_656455 ?auto_656463 ) ) ( not ( = ?auto_656455 ?auto_656464 ) ) ( not ( = ?auto_656455 ?auto_656465 ) ) ( not ( = ?auto_656455 ?auto_656466 ) ) ( not ( = ?auto_656455 ?auto_656467 ) ) ( not ( = ?auto_656455 ?auto_656468 ) ) ( not ( = ?auto_656455 ?auto_656469 ) ) ( not ( = ?auto_656455 ?auto_656470 ) ) ( not ( = ?auto_656455 ?auto_656471 ) ) ( not ( = ?auto_656456 ?auto_656457 ) ) ( not ( = ?auto_656456 ?auto_656458 ) ) ( not ( = ?auto_656456 ?auto_656459 ) ) ( not ( = ?auto_656456 ?auto_656460 ) ) ( not ( = ?auto_656456 ?auto_656461 ) ) ( not ( = ?auto_656456 ?auto_656462 ) ) ( not ( = ?auto_656456 ?auto_656463 ) ) ( not ( = ?auto_656456 ?auto_656464 ) ) ( not ( = ?auto_656456 ?auto_656465 ) ) ( not ( = ?auto_656456 ?auto_656466 ) ) ( not ( = ?auto_656456 ?auto_656467 ) ) ( not ( = ?auto_656456 ?auto_656468 ) ) ( not ( = ?auto_656456 ?auto_656469 ) ) ( not ( = ?auto_656456 ?auto_656470 ) ) ( not ( = ?auto_656456 ?auto_656471 ) ) ( not ( = ?auto_656457 ?auto_656458 ) ) ( not ( = ?auto_656457 ?auto_656459 ) ) ( not ( = ?auto_656457 ?auto_656460 ) ) ( not ( = ?auto_656457 ?auto_656461 ) ) ( not ( = ?auto_656457 ?auto_656462 ) ) ( not ( = ?auto_656457 ?auto_656463 ) ) ( not ( = ?auto_656457 ?auto_656464 ) ) ( not ( = ?auto_656457 ?auto_656465 ) ) ( not ( = ?auto_656457 ?auto_656466 ) ) ( not ( = ?auto_656457 ?auto_656467 ) ) ( not ( = ?auto_656457 ?auto_656468 ) ) ( not ( = ?auto_656457 ?auto_656469 ) ) ( not ( = ?auto_656457 ?auto_656470 ) ) ( not ( = ?auto_656457 ?auto_656471 ) ) ( not ( = ?auto_656458 ?auto_656459 ) ) ( not ( = ?auto_656458 ?auto_656460 ) ) ( not ( = ?auto_656458 ?auto_656461 ) ) ( not ( = ?auto_656458 ?auto_656462 ) ) ( not ( = ?auto_656458 ?auto_656463 ) ) ( not ( = ?auto_656458 ?auto_656464 ) ) ( not ( = ?auto_656458 ?auto_656465 ) ) ( not ( = ?auto_656458 ?auto_656466 ) ) ( not ( = ?auto_656458 ?auto_656467 ) ) ( not ( = ?auto_656458 ?auto_656468 ) ) ( not ( = ?auto_656458 ?auto_656469 ) ) ( not ( = ?auto_656458 ?auto_656470 ) ) ( not ( = ?auto_656458 ?auto_656471 ) ) ( not ( = ?auto_656459 ?auto_656460 ) ) ( not ( = ?auto_656459 ?auto_656461 ) ) ( not ( = ?auto_656459 ?auto_656462 ) ) ( not ( = ?auto_656459 ?auto_656463 ) ) ( not ( = ?auto_656459 ?auto_656464 ) ) ( not ( = ?auto_656459 ?auto_656465 ) ) ( not ( = ?auto_656459 ?auto_656466 ) ) ( not ( = ?auto_656459 ?auto_656467 ) ) ( not ( = ?auto_656459 ?auto_656468 ) ) ( not ( = ?auto_656459 ?auto_656469 ) ) ( not ( = ?auto_656459 ?auto_656470 ) ) ( not ( = ?auto_656459 ?auto_656471 ) ) ( not ( = ?auto_656460 ?auto_656461 ) ) ( not ( = ?auto_656460 ?auto_656462 ) ) ( not ( = ?auto_656460 ?auto_656463 ) ) ( not ( = ?auto_656460 ?auto_656464 ) ) ( not ( = ?auto_656460 ?auto_656465 ) ) ( not ( = ?auto_656460 ?auto_656466 ) ) ( not ( = ?auto_656460 ?auto_656467 ) ) ( not ( = ?auto_656460 ?auto_656468 ) ) ( not ( = ?auto_656460 ?auto_656469 ) ) ( not ( = ?auto_656460 ?auto_656470 ) ) ( not ( = ?auto_656460 ?auto_656471 ) ) ( not ( = ?auto_656461 ?auto_656462 ) ) ( not ( = ?auto_656461 ?auto_656463 ) ) ( not ( = ?auto_656461 ?auto_656464 ) ) ( not ( = ?auto_656461 ?auto_656465 ) ) ( not ( = ?auto_656461 ?auto_656466 ) ) ( not ( = ?auto_656461 ?auto_656467 ) ) ( not ( = ?auto_656461 ?auto_656468 ) ) ( not ( = ?auto_656461 ?auto_656469 ) ) ( not ( = ?auto_656461 ?auto_656470 ) ) ( not ( = ?auto_656461 ?auto_656471 ) ) ( not ( = ?auto_656462 ?auto_656463 ) ) ( not ( = ?auto_656462 ?auto_656464 ) ) ( not ( = ?auto_656462 ?auto_656465 ) ) ( not ( = ?auto_656462 ?auto_656466 ) ) ( not ( = ?auto_656462 ?auto_656467 ) ) ( not ( = ?auto_656462 ?auto_656468 ) ) ( not ( = ?auto_656462 ?auto_656469 ) ) ( not ( = ?auto_656462 ?auto_656470 ) ) ( not ( = ?auto_656462 ?auto_656471 ) ) ( not ( = ?auto_656463 ?auto_656464 ) ) ( not ( = ?auto_656463 ?auto_656465 ) ) ( not ( = ?auto_656463 ?auto_656466 ) ) ( not ( = ?auto_656463 ?auto_656467 ) ) ( not ( = ?auto_656463 ?auto_656468 ) ) ( not ( = ?auto_656463 ?auto_656469 ) ) ( not ( = ?auto_656463 ?auto_656470 ) ) ( not ( = ?auto_656463 ?auto_656471 ) ) ( not ( = ?auto_656464 ?auto_656465 ) ) ( not ( = ?auto_656464 ?auto_656466 ) ) ( not ( = ?auto_656464 ?auto_656467 ) ) ( not ( = ?auto_656464 ?auto_656468 ) ) ( not ( = ?auto_656464 ?auto_656469 ) ) ( not ( = ?auto_656464 ?auto_656470 ) ) ( not ( = ?auto_656464 ?auto_656471 ) ) ( not ( = ?auto_656465 ?auto_656466 ) ) ( not ( = ?auto_656465 ?auto_656467 ) ) ( not ( = ?auto_656465 ?auto_656468 ) ) ( not ( = ?auto_656465 ?auto_656469 ) ) ( not ( = ?auto_656465 ?auto_656470 ) ) ( not ( = ?auto_656465 ?auto_656471 ) ) ( not ( = ?auto_656466 ?auto_656467 ) ) ( not ( = ?auto_656466 ?auto_656468 ) ) ( not ( = ?auto_656466 ?auto_656469 ) ) ( not ( = ?auto_656466 ?auto_656470 ) ) ( not ( = ?auto_656466 ?auto_656471 ) ) ( not ( = ?auto_656467 ?auto_656468 ) ) ( not ( = ?auto_656467 ?auto_656469 ) ) ( not ( = ?auto_656467 ?auto_656470 ) ) ( not ( = ?auto_656467 ?auto_656471 ) ) ( not ( = ?auto_656468 ?auto_656469 ) ) ( not ( = ?auto_656468 ?auto_656470 ) ) ( not ( = ?auto_656468 ?auto_656471 ) ) ( not ( = ?auto_656469 ?auto_656470 ) ) ( not ( = ?auto_656469 ?auto_656471 ) ) ( not ( = ?auto_656470 ?auto_656471 ) ) ( CLEAR ?auto_656468 ) ( ON ?auto_656469 ?auto_656470 ) ( CLEAR ?auto_656469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_656454 ?auto_656455 ?auto_656456 ?auto_656457 ?auto_656458 ?auto_656459 ?auto_656460 ?auto_656461 ?auto_656462 ?auto_656463 ?auto_656464 ?auto_656465 ?auto_656466 ?auto_656467 ?auto_656468 ?auto_656469 )
      ( MAKE-17PILE ?auto_656454 ?auto_656455 ?auto_656456 ?auto_656457 ?auto_656458 ?auto_656459 ?auto_656460 ?auto_656461 ?auto_656462 ?auto_656463 ?auto_656464 ?auto_656465 ?auto_656466 ?auto_656467 ?auto_656468 ?auto_656469 ?auto_656470 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_656489 - BLOCK
      ?auto_656490 - BLOCK
      ?auto_656491 - BLOCK
      ?auto_656492 - BLOCK
      ?auto_656493 - BLOCK
      ?auto_656494 - BLOCK
      ?auto_656495 - BLOCK
      ?auto_656496 - BLOCK
      ?auto_656497 - BLOCK
      ?auto_656498 - BLOCK
      ?auto_656499 - BLOCK
      ?auto_656500 - BLOCK
      ?auto_656501 - BLOCK
      ?auto_656502 - BLOCK
      ?auto_656503 - BLOCK
      ?auto_656504 - BLOCK
      ?auto_656505 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_656505 ) ( ON-TABLE ?auto_656489 ) ( ON ?auto_656490 ?auto_656489 ) ( ON ?auto_656491 ?auto_656490 ) ( ON ?auto_656492 ?auto_656491 ) ( ON ?auto_656493 ?auto_656492 ) ( ON ?auto_656494 ?auto_656493 ) ( ON ?auto_656495 ?auto_656494 ) ( ON ?auto_656496 ?auto_656495 ) ( ON ?auto_656497 ?auto_656496 ) ( ON ?auto_656498 ?auto_656497 ) ( ON ?auto_656499 ?auto_656498 ) ( ON ?auto_656500 ?auto_656499 ) ( ON ?auto_656501 ?auto_656500 ) ( ON ?auto_656502 ?auto_656501 ) ( ON ?auto_656503 ?auto_656502 ) ( not ( = ?auto_656489 ?auto_656490 ) ) ( not ( = ?auto_656489 ?auto_656491 ) ) ( not ( = ?auto_656489 ?auto_656492 ) ) ( not ( = ?auto_656489 ?auto_656493 ) ) ( not ( = ?auto_656489 ?auto_656494 ) ) ( not ( = ?auto_656489 ?auto_656495 ) ) ( not ( = ?auto_656489 ?auto_656496 ) ) ( not ( = ?auto_656489 ?auto_656497 ) ) ( not ( = ?auto_656489 ?auto_656498 ) ) ( not ( = ?auto_656489 ?auto_656499 ) ) ( not ( = ?auto_656489 ?auto_656500 ) ) ( not ( = ?auto_656489 ?auto_656501 ) ) ( not ( = ?auto_656489 ?auto_656502 ) ) ( not ( = ?auto_656489 ?auto_656503 ) ) ( not ( = ?auto_656489 ?auto_656504 ) ) ( not ( = ?auto_656489 ?auto_656505 ) ) ( not ( = ?auto_656490 ?auto_656491 ) ) ( not ( = ?auto_656490 ?auto_656492 ) ) ( not ( = ?auto_656490 ?auto_656493 ) ) ( not ( = ?auto_656490 ?auto_656494 ) ) ( not ( = ?auto_656490 ?auto_656495 ) ) ( not ( = ?auto_656490 ?auto_656496 ) ) ( not ( = ?auto_656490 ?auto_656497 ) ) ( not ( = ?auto_656490 ?auto_656498 ) ) ( not ( = ?auto_656490 ?auto_656499 ) ) ( not ( = ?auto_656490 ?auto_656500 ) ) ( not ( = ?auto_656490 ?auto_656501 ) ) ( not ( = ?auto_656490 ?auto_656502 ) ) ( not ( = ?auto_656490 ?auto_656503 ) ) ( not ( = ?auto_656490 ?auto_656504 ) ) ( not ( = ?auto_656490 ?auto_656505 ) ) ( not ( = ?auto_656491 ?auto_656492 ) ) ( not ( = ?auto_656491 ?auto_656493 ) ) ( not ( = ?auto_656491 ?auto_656494 ) ) ( not ( = ?auto_656491 ?auto_656495 ) ) ( not ( = ?auto_656491 ?auto_656496 ) ) ( not ( = ?auto_656491 ?auto_656497 ) ) ( not ( = ?auto_656491 ?auto_656498 ) ) ( not ( = ?auto_656491 ?auto_656499 ) ) ( not ( = ?auto_656491 ?auto_656500 ) ) ( not ( = ?auto_656491 ?auto_656501 ) ) ( not ( = ?auto_656491 ?auto_656502 ) ) ( not ( = ?auto_656491 ?auto_656503 ) ) ( not ( = ?auto_656491 ?auto_656504 ) ) ( not ( = ?auto_656491 ?auto_656505 ) ) ( not ( = ?auto_656492 ?auto_656493 ) ) ( not ( = ?auto_656492 ?auto_656494 ) ) ( not ( = ?auto_656492 ?auto_656495 ) ) ( not ( = ?auto_656492 ?auto_656496 ) ) ( not ( = ?auto_656492 ?auto_656497 ) ) ( not ( = ?auto_656492 ?auto_656498 ) ) ( not ( = ?auto_656492 ?auto_656499 ) ) ( not ( = ?auto_656492 ?auto_656500 ) ) ( not ( = ?auto_656492 ?auto_656501 ) ) ( not ( = ?auto_656492 ?auto_656502 ) ) ( not ( = ?auto_656492 ?auto_656503 ) ) ( not ( = ?auto_656492 ?auto_656504 ) ) ( not ( = ?auto_656492 ?auto_656505 ) ) ( not ( = ?auto_656493 ?auto_656494 ) ) ( not ( = ?auto_656493 ?auto_656495 ) ) ( not ( = ?auto_656493 ?auto_656496 ) ) ( not ( = ?auto_656493 ?auto_656497 ) ) ( not ( = ?auto_656493 ?auto_656498 ) ) ( not ( = ?auto_656493 ?auto_656499 ) ) ( not ( = ?auto_656493 ?auto_656500 ) ) ( not ( = ?auto_656493 ?auto_656501 ) ) ( not ( = ?auto_656493 ?auto_656502 ) ) ( not ( = ?auto_656493 ?auto_656503 ) ) ( not ( = ?auto_656493 ?auto_656504 ) ) ( not ( = ?auto_656493 ?auto_656505 ) ) ( not ( = ?auto_656494 ?auto_656495 ) ) ( not ( = ?auto_656494 ?auto_656496 ) ) ( not ( = ?auto_656494 ?auto_656497 ) ) ( not ( = ?auto_656494 ?auto_656498 ) ) ( not ( = ?auto_656494 ?auto_656499 ) ) ( not ( = ?auto_656494 ?auto_656500 ) ) ( not ( = ?auto_656494 ?auto_656501 ) ) ( not ( = ?auto_656494 ?auto_656502 ) ) ( not ( = ?auto_656494 ?auto_656503 ) ) ( not ( = ?auto_656494 ?auto_656504 ) ) ( not ( = ?auto_656494 ?auto_656505 ) ) ( not ( = ?auto_656495 ?auto_656496 ) ) ( not ( = ?auto_656495 ?auto_656497 ) ) ( not ( = ?auto_656495 ?auto_656498 ) ) ( not ( = ?auto_656495 ?auto_656499 ) ) ( not ( = ?auto_656495 ?auto_656500 ) ) ( not ( = ?auto_656495 ?auto_656501 ) ) ( not ( = ?auto_656495 ?auto_656502 ) ) ( not ( = ?auto_656495 ?auto_656503 ) ) ( not ( = ?auto_656495 ?auto_656504 ) ) ( not ( = ?auto_656495 ?auto_656505 ) ) ( not ( = ?auto_656496 ?auto_656497 ) ) ( not ( = ?auto_656496 ?auto_656498 ) ) ( not ( = ?auto_656496 ?auto_656499 ) ) ( not ( = ?auto_656496 ?auto_656500 ) ) ( not ( = ?auto_656496 ?auto_656501 ) ) ( not ( = ?auto_656496 ?auto_656502 ) ) ( not ( = ?auto_656496 ?auto_656503 ) ) ( not ( = ?auto_656496 ?auto_656504 ) ) ( not ( = ?auto_656496 ?auto_656505 ) ) ( not ( = ?auto_656497 ?auto_656498 ) ) ( not ( = ?auto_656497 ?auto_656499 ) ) ( not ( = ?auto_656497 ?auto_656500 ) ) ( not ( = ?auto_656497 ?auto_656501 ) ) ( not ( = ?auto_656497 ?auto_656502 ) ) ( not ( = ?auto_656497 ?auto_656503 ) ) ( not ( = ?auto_656497 ?auto_656504 ) ) ( not ( = ?auto_656497 ?auto_656505 ) ) ( not ( = ?auto_656498 ?auto_656499 ) ) ( not ( = ?auto_656498 ?auto_656500 ) ) ( not ( = ?auto_656498 ?auto_656501 ) ) ( not ( = ?auto_656498 ?auto_656502 ) ) ( not ( = ?auto_656498 ?auto_656503 ) ) ( not ( = ?auto_656498 ?auto_656504 ) ) ( not ( = ?auto_656498 ?auto_656505 ) ) ( not ( = ?auto_656499 ?auto_656500 ) ) ( not ( = ?auto_656499 ?auto_656501 ) ) ( not ( = ?auto_656499 ?auto_656502 ) ) ( not ( = ?auto_656499 ?auto_656503 ) ) ( not ( = ?auto_656499 ?auto_656504 ) ) ( not ( = ?auto_656499 ?auto_656505 ) ) ( not ( = ?auto_656500 ?auto_656501 ) ) ( not ( = ?auto_656500 ?auto_656502 ) ) ( not ( = ?auto_656500 ?auto_656503 ) ) ( not ( = ?auto_656500 ?auto_656504 ) ) ( not ( = ?auto_656500 ?auto_656505 ) ) ( not ( = ?auto_656501 ?auto_656502 ) ) ( not ( = ?auto_656501 ?auto_656503 ) ) ( not ( = ?auto_656501 ?auto_656504 ) ) ( not ( = ?auto_656501 ?auto_656505 ) ) ( not ( = ?auto_656502 ?auto_656503 ) ) ( not ( = ?auto_656502 ?auto_656504 ) ) ( not ( = ?auto_656502 ?auto_656505 ) ) ( not ( = ?auto_656503 ?auto_656504 ) ) ( not ( = ?auto_656503 ?auto_656505 ) ) ( not ( = ?auto_656504 ?auto_656505 ) ) ( CLEAR ?auto_656503 ) ( ON ?auto_656504 ?auto_656505 ) ( CLEAR ?auto_656504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_656489 ?auto_656490 ?auto_656491 ?auto_656492 ?auto_656493 ?auto_656494 ?auto_656495 ?auto_656496 ?auto_656497 ?auto_656498 ?auto_656499 ?auto_656500 ?auto_656501 ?auto_656502 ?auto_656503 ?auto_656504 )
      ( MAKE-17PILE ?auto_656489 ?auto_656490 ?auto_656491 ?auto_656492 ?auto_656493 ?auto_656494 ?auto_656495 ?auto_656496 ?auto_656497 ?auto_656498 ?auto_656499 ?auto_656500 ?auto_656501 ?auto_656502 ?auto_656503 ?auto_656504 ?auto_656505 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_656523 - BLOCK
      ?auto_656524 - BLOCK
      ?auto_656525 - BLOCK
      ?auto_656526 - BLOCK
      ?auto_656527 - BLOCK
      ?auto_656528 - BLOCK
      ?auto_656529 - BLOCK
      ?auto_656530 - BLOCK
      ?auto_656531 - BLOCK
      ?auto_656532 - BLOCK
      ?auto_656533 - BLOCK
      ?auto_656534 - BLOCK
      ?auto_656535 - BLOCK
      ?auto_656536 - BLOCK
      ?auto_656537 - BLOCK
      ?auto_656538 - BLOCK
      ?auto_656539 - BLOCK
    )
    :vars
    (
      ?auto_656540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_656539 ?auto_656540 ) ( ON-TABLE ?auto_656523 ) ( ON ?auto_656524 ?auto_656523 ) ( ON ?auto_656525 ?auto_656524 ) ( ON ?auto_656526 ?auto_656525 ) ( ON ?auto_656527 ?auto_656526 ) ( ON ?auto_656528 ?auto_656527 ) ( ON ?auto_656529 ?auto_656528 ) ( ON ?auto_656530 ?auto_656529 ) ( ON ?auto_656531 ?auto_656530 ) ( ON ?auto_656532 ?auto_656531 ) ( ON ?auto_656533 ?auto_656532 ) ( ON ?auto_656534 ?auto_656533 ) ( ON ?auto_656535 ?auto_656534 ) ( ON ?auto_656536 ?auto_656535 ) ( not ( = ?auto_656523 ?auto_656524 ) ) ( not ( = ?auto_656523 ?auto_656525 ) ) ( not ( = ?auto_656523 ?auto_656526 ) ) ( not ( = ?auto_656523 ?auto_656527 ) ) ( not ( = ?auto_656523 ?auto_656528 ) ) ( not ( = ?auto_656523 ?auto_656529 ) ) ( not ( = ?auto_656523 ?auto_656530 ) ) ( not ( = ?auto_656523 ?auto_656531 ) ) ( not ( = ?auto_656523 ?auto_656532 ) ) ( not ( = ?auto_656523 ?auto_656533 ) ) ( not ( = ?auto_656523 ?auto_656534 ) ) ( not ( = ?auto_656523 ?auto_656535 ) ) ( not ( = ?auto_656523 ?auto_656536 ) ) ( not ( = ?auto_656523 ?auto_656537 ) ) ( not ( = ?auto_656523 ?auto_656538 ) ) ( not ( = ?auto_656523 ?auto_656539 ) ) ( not ( = ?auto_656523 ?auto_656540 ) ) ( not ( = ?auto_656524 ?auto_656525 ) ) ( not ( = ?auto_656524 ?auto_656526 ) ) ( not ( = ?auto_656524 ?auto_656527 ) ) ( not ( = ?auto_656524 ?auto_656528 ) ) ( not ( = ?auto_656524 ?auto_656529 ) ) ( not ( = ?auto_656524 ?auto_656530 ) ) ( not ( = ?auto_656524 ?auto_656531 ) ) ( not ( = ?auto_656524 ?auto_656532 ) ) ( not ( = ?auto_656524 ?auto_656533 ) ) ( not ( = ?auto_656524 ?auto_656534 ) ) ( not ( = ?auto_656524 ?auto_656535 ) ) ( not ( = ?auto_656524 ?auto_656536 ) ) ( not ( = ?auto_656524 ?auto_656537 ) ) ( not ( = ?auto_656524 ?auto_656538 ) ) ( not ( = ?auto_656524 ?auto_656539 ) ) ( not ( = ?auto_656524 ?auto_656540 ) ) ( not ( = ?auto_656525 ?auto_656526 ) ) ( not ( = ?auto_656525 ?auto_656527 ) ) ( not ( = ?auto_656525 ?auto_656528 ) ) ( not ( = ?auto_656525 ?auto_656529 ) ) ( not ( = ?auto_656525 ?auto_656530 ) ) ( not ( = ?auto_656525 ?auto_656531 ) ) ( not ( = ?auto_656525 ?auto_656532 ) ) ( not ( = ?auto_656525 ?auto_656533 ) ) ( not ( = ?auto_656525 ?auto_656534 ) ) ( not ( = ?auto_656525 ?auto_656535 ) ) ( not ( = ?auto_656525 ?auto_656536 ) ) ( not ( = ?auto_656525 ?auto_656537 ) ) ( not ( = ?auto_656525 ?auto_656538 ) ) ( not ( = ?auto_656525 ?auto_656539 ) ) ( not ( = ?auto_656525 ?auto_656540 ) ) ( not ( = ?auto_656526 ?auto_656527 ) ) ( not ( = ?auto_656526 ?auto_656528 ) ) ( not ( = ?auto_656526 ?auto_656529 ) ) ( not ( = ?auto_656526 ?auto_656530 ) ) ( not ( = ?auto_656526 ?auto_656531 ) ) ( not ( = ?auto_656526 ?auto_656532 ) ) ( not ( = ?auto_656526 ?auto_656533 ) ) ( not ( = ?auto_656526 ?auto_656534 ) ) ( not ( = ?auto_656526 ?auto_656535 ) ) ( not ( = ?auto_656526 ?auto_656536 ) ) ( not ( = ?auto_656526 ?auto_656537 ) ) ( not ( = ?auto_656526 ?auto_656538 ) ) ( not ( = ?auto_656526 ?auto_656539 ) ) ( not ( = ?auto_656526 ?auto_656540 ) ) ( not ( = ?auto_656527 ?auto_656528 ) ) ( not ( = ?auto_656527 ?auto_656529 ) ) ( not ( = ?auto_656527 ?auto_656530 ) ) ( not ( = ?auto_656527 ?auto_656531 ) ) ( not ( = ?auto_656527 ?auto_656532 ) ) ( not ( = ?auto_656527 ?auto_656533 ) ) ( not ( = ?auto_656527 ?auto_656534 ) ) ( not ( = ?auto_656527 ?auto_656535 ) ) ( not ( = ?auto_656527 ?auto_656536 ) ) ( not ( = ?auto_656527 ?auto_656537 ) ) ( not ( = ?auto_656527 ?auto_656538 ) ) ( not ( = ?auto_656527 ?auto_656539 ) ) ( not ( = ?auto_656527 ?auto_656540 ) ) ( not ( = ?auto_656528 ?auto_656529 ) ) ( not ( = ?auto_656528 ?auto_656530 ) ) ( not ( = ?auto_656528 ?auto_656531 ) ) ( not ( = ?auto_656528 ?auto_656532 ) ) ( not ( = ?auto_656528 ?auto_656533 ) ) ( not ( = ?auto_656528 ?auto_656534 ) ) ( not ( = ?auto_656528 ?auto_656535 ) ) ( not ( = ?auto_656528 ?auto_656536 ) ) ( not ( = ?auto_656528 ?auto_656537 ) ) ( not ( = ?auto_656528 ?auto_656538 ) ) ( not ( = ?auto_656528 ?auto_656539 ) ) ( not ( = ?auto_656528 ?auto_656540 ) ) ( not ( = ?auto_656529 ?auto_656530 ) ) ( not ( = ?auto_656529 ?auto_656531 ) ) ( not ( = ?auto_656529 ?auto_656532 ) ) ( not ( = ?auto_656529 ?auto_656533 ) ) ( not ( = ?auto_656529 ?auto_656534 ) ) ( not ( = ?auto_656529 ?auto_656535 ) ) ( not ( = ?auto_656529 ?auto_656536 ) ) ( not ( = ?auto_656529 ?auto_656537 ) ) ( not ( = ?auto_656529 ?auto_656538 ) ) ( not ( = ?auto_656529 ?auto_656539 ) ) ( not ( = ?auto_656529 ?auto_656540 ) ) ( not ( = ?auto_656530 ?auto_656531 ) ) ( not ( = ?auto_656530 ?auto_656532 ) ) ( not ( = ?auto_656530 ?auto_656533 ) ) ( not ( = ?auto_656530 ?auto_656534 ) ) ( not ( = ?auto_656530 ?auto_656535 ) ) ( not ( = ?auto_656530 ?auto_656536 ) ) ( not ( = ?auto_656530 ?auto_656537 ) ) ( not ( = ?auto_656530 ?auto_656538 ) ) ( not ( = ?auto_656530 ?auto_656539 ) ) ( not ( = ?auto_656530 ?auto_656540 ) ) ( not ( = ?auto_656531 ?auto_656532 ) ) ( not ( = ?auto_656531 ?auto_656533 ) ) ( not ( = ?auto_656531 ?auto_656534 ) ) ( not ( = ?auto_656531 ?auto_656535 ) ) ( not ( = ?auto_656531 ?auto_656536 ) ) ( not ( = ?auto_656531 ?auto_656537 ) ) ( not ( = ?auto_656531 ?auto_656538 ) ) ( not ( = ?auto_656531 ?auto_656539 ) ) ( not ( = ?auto_656531 ?auto_656540 ) ) ( not ( = ?auto_656532 ?auto_656533 ) ) ( not ( = ?auto_656532 ?auto_656534 ) ) ( not ( = ?auto_656532 ?auto_656535 ) ) ( not ( = ?auto_656532 ?auto_656536 ) ) ( not ( = ?auto_656532 ?auto_656537 ) ) ( not ( = ?auto_656532 ?auto_656538 ) ) ( not ( = ?auto_656532 ?auto_656539 ) ) ( not ( = ?auto_656532 ?auto_656540 ) ) ( not ( = ?auto_656533 ?auto_656534 ) ) ( not ( = ?auto_656533 ?auto_656535 ) ) ( not ( = ?auto_656533 ?auto_656536 ) ) ( not ( = ?auto_656533 ?auto_656537 ) ) ( not ( = ?auto_656533 ?auto_656538 ) ) ( not ( = ?auto_656533 ?auto_656539 ) ) ( not ( = ?auto_656533 ?auto_656540 ) ) ( not ( = ?auto_656534 ?auto_656535 ) ) ( not ( = ?auto_656534 ?auto_656536 ) ) ( not ( = ?auto_656534 ?auto_656537 ) ) ( not ( = ?auto_656534 ?auto_656538 ) ) ( not ( = ?auto_656534 ?auto_656539 ) ) ( not ( = ?auto_656534 ?auto_656540 ) ) ( not ( = ?auto_656535 ?auto_656536 ) ) ( not ( = ?auto_656535 ?auto_656537 ) ) ( not ( = ?auto_656535 ?auto_656538 ) ) ( not ( = ?auto_656535 ?auto_656539 ) ) ( not ( = ?auto_656535 ?auto_656540 ) ) ( not ( = ?auto_656536 ?auto_656537 ) ) ( not ( = ?auto_656536 ?auto_656538 ) ) ( not ( = ?auto_656536 ?auto_656539 ) ) ( not ( = ?auto_656536 ?auto_656540 ) ) ( not ( = ?auto_656537 ?auto_656538 ) ) ( not ( = ?auto_656537 ?auto_656539 ) ) ( not ( = ?auto_656537 ?auto_656540 ) ) ( not ( = ?auto_656538 ?auto_656539 ) ) ( not ( = ?auto_656538 ?auto_656540 ) ) ( not ( = ?auto_656539 ?auto_656540 ) ) ( ON ?auto_656538 ?auto_656539 ) ( CLEAR ?auto_656536 ) ( ON ?auto_656537 ?auto_656538 ) ( CLEAR ?auto_656537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_656523 ?auto_656524 ?auto_656525 ?auto_656526 ?auto_656527 ?auto_656528 ?auto_656529 ?auto_656530 ?auto_656531 ?auto_656532 ?auto_656533 ?auto_656534 ?auto_656535 ?auto_656536 ?auto_656537 )
      ( MAKE-17PILE ?auto_656523 ?auto_656524 ?auto_656525 ?auto_656526 ?auto_656527 ?auto_656528 ?auto_656529 ?auto_656530 ?auto_656531 ?auto_656532 ?auto_656533 ?auto_656534 ?auto_656535 ?auto_656536 ?auto_656537 ?auto_656538 ?auto_656539 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_656558 - BLOCK
      ?auto_656559 - BLOCK
      ?auto_656560 - BLOCK
      ?auto_656561 - BLOCK
      ?auto_656562 - BLOCK
      ?auto_656563 - BLOCK
      ?auto_656564 - BLOCK
      ?auto_656565 - BLOCK
      ?auto_656566 - BLOCK
      ?auto_656567 - BLOCK
      ?auto_656568 - BLOCK
      ?auto_656569 - BLOCK
      ?auto_656570 - BLOCK
      ?auto_656571 - BLOCK
      ?auto_656572 - BLOCK
      ?auto_656573 - BLOCK
      ?auto_656574 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_656574 ) ( ON-TABLE ?auto_656558 ) ( ON ?auto_656559 ?auto_656558 ) ( ON ?auto_656560 ?auto_656559 ) ( ON ?auto_656561 ?auto_656560 ) ( ON ?auto_656562 ?auto_656561 ) ( ON ?auto_656563 ?auto_656562 ) ( ON ?auto_656564 ?auto_656563 ) ( ON ?auto_656565 ?auto_656564 ) ( ON ?auto_656566 ?auto_656565 ) ( ON ?auto_656567 ?auto_656566 ) ( ON ?auto_656568 ?auto_656567 ) ( ON ?auto_656569 ?auto_656568 ) ( ON ?auto_656570 ?auto_656569 ) ( ON ?auto_656571 ?auto_656570 ) ( not ( = ?auto_656558 ?auto_656559 ) ) ( not ( = ?auto_656558 ?auto_656560 ) ) ( not ( = ?auto_656558 ?auto_656561 ) ) ( not ( = ?auto_656558 ?auto_656562 ) ) ( not ( = ?auto_656558 ?auto_656563 ) ) ( not ( = ?auto_656558 ?auto_656564 ) ) ( not ( = ?auto_656558 ?auto_656565 ) ) ( not ( = ?auto_656558 ?auto_656566 ) ) ( not ( = ?auto_656558 ?auto_656567 ) ) ( not ( = ?auto_656558 ?auto_656568 ) ) ( not ( = ?auto_656558 ?auto_656569 ) ) ( not ( = ?auto_656558 ?auto_656570 ) ) ( not ( = ?auto_656558 ?auto_656571 ) ) ( not ( = ?auto_656558 ?auto_656572 ) ) ( not ( = ?auto_656558 ?auto_656573 ) ) ( not ( = ?auto_656558 ?auto_656574 ) ) ( not ( = ?auto_656559 ?auto_656560 ) ) ( not ( = ?auto_656559 ?auto_656561 ) ) ( not ( = ?auto_656559 ?auto_656562 ) ) ( not ( = ?auto_656559 ?auto_656563 ) ) ( not ( = ?auto_656559 ?auto_656564 ) ) ( not ( = ?auto_656559 ?auto_656565 ) ) ( not ( = ?auto_656559 ?auto_656566 ) ) ( not ( = ?auto_656559 ?auto_656567 ) ) ( not ( = ?auto_656559 ?auto_656568 ) ) ( not ( = ?auto_656559 ?auto_656569 ) ) ( not ( = ?auto_656559 ?auto_656570 ) ) ( not ( = ?auto_656559 ?auto_656571 ) ) ( not ( = ?auto_656559 ?auto_656572 ) ) ( not ( = ?auto_656559 ?auto_656573 ) ) ( not ( = ?auto_656559 ?auto_656574 ) ) ( not ( = ?auto_656560 ?auto_656561 ) ) ( not ( = ?auto_656560 ?auto_656562 ) ) ( not ( = ?auto_656560 ?auto_656563 ) ) ( not ( = ?auto_656560 ?auto_656564 ) ) ( not ( = ?auto_656560 ?auto_656565 ) ) ( not ( = ?auto_656560 ?auto_656566 ) ) ( not ( = ?auto_656560 ?auto_656567 ) ) ( not ( = ?auto_656560 ?auto_656568 ) ) ( not ( = ?auto_656560 ?auto_656569 ) ) ( not ( = ?auto_656560 ?auto_656570 ) ) ( not ( = ?auto_656560 ?auto_656571 ) ) ( not ( = ?auto_656560 ?auto_656572 ) ) ( not ( = ?auto_656560 ?auto_656573 ) ) ( not ( = ?auto_656560 ?auto_656574 ) ) ( not ( = ?auto_656561 ?auto_656562 ) ) ( not ( = ?auto_656561 ?auto_656563 ) ) ( not ( = ?auto_656561 ?auto_656564 ) ) ( not ( = ?auto_656561 ?auto_656565 ) ) ( not ( = ?auto_656561 ?auto_656566 ) ) ( not ( = ?auto_656561 ?auto_656567 ) ) ( not ( = ?auto_656561 ?auto_656568 ) ) ( not ( = ?auto_656561 ?auto_656569 ) ) ( not ( = ?auto_656561 ?auto_656570 ) ) ( not ( = ?auto_656561 ?auto_656571 ) ) ( not ( = ?auto_656561 ?auto_656572 ) ) ( not ( = ?auto_656561 ?auto_656573 ) ) ( not ( = ?auto_656561 ?auto_656574 ) ) ( not ( = ?auto_656562 ?auto_656563 ) ) ( not ( = ?auto_656562 ?auto_656564 ) ) ( not ( = ?auto_656562 ?auto_656565 ) ) ( not ( = ?auto_656562 ?auto_656566 ) ) ( not ( = ?auto_656562 ?auto_656567 ) ) ( not ( = ?auto_656562 ?auto_656568 ) ) ( not ( = ?auto_656562 ?auto_656569 ) ) ( not ( = ?auto_656562 ?auto_656570 ) ) ( not ( = ?auto_656562 ?auto_656571 ) ) ( not ( = ?auto_656562 ?auto_656572 ) ) ( not ( = ?auto_656562 ?auto_656573 ) ) ( not ( = ?auto_656562 ?auto_656574 ) ) ( not ( = ?auto_656563 ?auto_656564 ) ) ( not ( = ?auto_656563 ?auto_656565 ) ) ( not ( = ?auto_656563 ?auto_656566 ) ) ( not ( = ?auto_656563 ?auto_656567 ) ) ( not ( = ?auto_656563 ?auto_656568 ) ) ( not ( = ?auto_656563 ?auto_656569 ) ) ( not ( = ?auto_656563 ?auto_656570 ) ) ( not ( = ?auto_656563 ?auto_656571 ) ) ( not ( = ?auto_656563 ?auto_656572 ) ) ( not ( = ?auto_656563 ?auto_656573 ) ) ( not ( = ?auto_656563 ?auto_656574 ) ) ( not ( = ?auto_656564 ?auto_656565 ) ) ( not ( = ?auto_656564 ?auto_656566 ) ) ( not ( = ?auto_656564 ?auto_656567 ) ) ( not ( = ?auto_656564 ?auto_656568 ) ) ( not ( = ?auto_656564 ?auto_656569 ) ) ( not ( = ?auto_656564 ?auto_656570 ) ) ( not ( = ?auto_656564 ?auto_656571 ) ) ( not ( = ?auto_656564 ?auto_656572 ) ) ( not ( = ?auto_656564 ?auto_656573 ) ) ( not ( = ?auto_656564 ?auto_656574 ) ) ( not ( = ?auto_656565 ?auto_656566 ) ) ( not ( = ?auto_656565 ?auto_656567 ) ) ( not ( = ?auto_656565 ?auto_656568 ) ) ( not ( = ?auto_656565 ?auto_656569 ) ) ( not ( = ?auto_656565 ?auto_656570 ) ) ( not ( = ?auto_656565 ?auto_656571 ) ) ( not ( = ?auto_656565 ?auto_656572 ) ) ( not ( = ?auto_656565 ?auto_656573 ) ) ( not ( = ?auto_656565 ?auto_656574 ) ) ( not ( = ?auto_656566 ?auto_656567 ) ) ( not ( = ?auto_656566 ?auto_656568 ) ) ( not ( = ?auto_656566 ?auto_656569 ) ) ( not ( = ?auto_656566 ?auto_656570 ) ) ( not ( = ?auto_656566 ?auto_656571 ) ) ( not ( = ?auto_656566 ?auto_656572 ) ) ( not ( = ?auto_656566 ?auto_656573 ) ) ( not ( = ?auto_656566 ?auto_656574 ) ) ( not ( = ?auto_656567 ?auto_656568 ) ) ( not ( = ?auto_656567 ?auto_656569 ) ) ( not ( = ?auto_656567 ?auto_656570 ) ) ( not ( = ?auto_656567 ?auto_656571 ) ) ( not ( = ?auto_656567 ?auto_656572 ) ) ( not ( = ?auto_656567 ?auto_656573 ) ) ( not ( = ?auto_656567 ?auto_656574 ) ) ( not ( = ?auto_656568 ?auto_656569 ) ) ( not ( = ?auto_656568 ?auto_656570 ) ) ( not ( = ?auto_656568 ?auto_656571 ) ) ( not ( = ?auto_656568 ?auto_656572 ) ) ( not ( = ?auto_656568 ?auto_656573 ) ) ( not ( = ?auto_656568 ?auto_656574 ) ) ( not ( = ?auto_656569 ?auto_656570 ) ) ( not ( = ?auto_656569 ?auto_656571 ) ) ( not ( = ?auto_656569 ?auto_656572 ) ) ( not ( = ?auto_656569 ?auto_656573 ) ) ( not ( = ?auto_656569 ?auto_656574 ) ) ( not ( = ?auto_656570 ?auto_656571 ) ) ( not ( = ?auto_656570 ?auto_656572 ) ) ( not ( = ?auto_656570 ?auto_656573 ) ) ( not ( = ?auto_656570 ?auto_656574 ) ) ( not ( = ?auto_656571 ?auto_656572 ) ) ( not ( = ?auto_656571 ?auto_656573 ) ) ( not ( = ?auto_656571 ?auto_656574 ) ) ( not ( = ?auto_656572 ?auto_656573 ) ) ( not ( = ?auto_656572 ?auto_656574 ) ) ( not ( = ?auto_656573 ?auto_656574 ) ) ( ON ?auto_656573 ?auto_656574 ) ( CLEAR ?auto_656571 ) ( ON ?auto_656572 ?auto_656573 ) ( CLEAR ?auto_656572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_656558 ?auto_656559 ?auto_656560 ?auto_656561 ?auto_656562 ?auto_656563 ?auto_656564 ?auto_656565 ?auto_656566 ?auto_656567 ?auto_656568 ?auto_656569 ?auto_656570 ?auto_656571 ?auto_656572 )
      ( MAKE-17PILE ?auto_656558 ?auto_656559 ?auto_656560 ?auto_656561 ?auto_656562 ?auto_656563 ?auto_656564 ?auto_656565 ?auto_656566 ?auto_656567 ?auto_656568 ?auto_656569 ?auto_656570 ?auto_656571 ?auto_656572 ?auto_656573 ?auto_656574 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_656592 - BLOCK
      ?auto_656593 - BLOCK
      ?auto_656594 - BLOCK
      ?auto_656595 - BLOCK
      ?auto_656596 - BLOCK
      ?auto_656597 - BLOCK
      ?auto_656598 - BLOCK
      ?auto_656599 - BLOCK
      ?auto_656600 - BLOCK
      ?auto_656601 - BLOCK
      ?auto_656602 - BLOCK
      ?auto_656603 - BLOCK
      ?auto_656604 - BLOCK
      ?auto_656605 - BLOCK
      ?auto_656606 - BLOCK
      ?auto_656607 - BLOCK
      ?auto_656608 - BLOCK
    )
    :vars
    (
      ?auto_656609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_656608 ?auto_656609 ) ( ON-TABLE ?auto_656592 ) ( ON ?auto_656593 ?auto_656592 ) ( ON ?auto_656594 ?auto_656593 ) ( ON ?auto_656595 ?auto_656594 ) ( ON ?auto_656596 ?auto_656595 ) ( ON ?auto_656597 ?auto_656596 ) ( ON ?auto_656598 ?auto_656597 ) ( ON ?auto_656599 ?auto_656598 ) ( ON ?auto_656600 ?auto_656599 ) ( ON ?auto_656601 ?auto_656600 ) ( ON ?auto_656602 ?auto_656601 ) ( ON ?auto_656603 ?auto_656602 ) ( ON ?auto_656604 ?auto_656603 ) ( not ( = ?auto_656592 ?auto_656593 ) ) ( not ( = ?auto_656592 ?auto_656594 ) ) ( not ( = ?auto_656592 ?auto_656595 ) ) ( not ( = ?auto_656592 ?auto_656596 ) ) ( not ( = ?auto_656592 ?auto_656597 ) ) ( not ( = ?auto_656592 ?auto_656598 ) ) ( not ( = ?auto_656592 ?auto_656599 ) ) ( not ( = ?auto_656592 ?auto_656600 ) ) ( not ( = ?auto_656592 ?auto_656601 ) ) ( not ( = ?auto_656592 ?auto_656602 ) ) ( not ( = ?auto_656592 ?auto_656603 ) ) ( not ( = ?auto_656592 ?auto_656604 ) ) ( not ( = ?auto_656592 ?auto_656605 ) ) ( not ( = ?auto_656592 ?auto_656606 ) ) ( not ( = ?auto_656592 ?auto_656607 ) ) ( not ( = ?auto_656592 ?auto_656608 ) ) ( not ( = ?auto_656592 ?auto_656609 ) ) ( not ( = ?auto_656593 ?auto_656594 ) ) ( not ( = ?auto_656593 ?auto_656595 ) ) ( not ( = ?auto_656593 ?auto_656596 ) ) ( not ( = ?auto_656593 ?auto_656597 ) ) ( not ( = ?auto_656593 ?auto_656598 ) ) ( not ( = ?auto_656593 ?auto_656599 ) ) ( not ( = ?auto_656593 ?auto_656600 ) ) ( not ( = ?auto_656593 ?auto_656601 ) ) ( not ( = ?auto_656593 ?auto_656602 ) ) ( not ( = ?auto_656593 ?auto_656603 ) ) ( not ( = ?auto_656593 ?auto_656604 ) ) ( not ( = ?auto_656593 ?auto_656605 ) ) ( not ( = ?auto_656593 ?auto_656606 ) ) ( not ( = ?auto_656593 ?auto_656607 ) ) ( not ( = ?auto_656593 ?auto_656608 ) ) ( not ( = ?auto_656593 ?auto_656609 ) ) ( not ( = ?auto_656594 ?auto_656595 ) ) ( not ( = ?auto_656594 ?auto_656596 ) ) ( not ( = ?auto_656594 ?auto_656597 ) ) ( not ( = ?auto_656594 ?auto_656598 ) ) ( not ( = ?auto_656594 ?auto_656599 ) ) ( not ( = ?auto_656594 ?auto_656600 ) ) ( not ( = ?auto_656594 ?auto_656601 ) ) ( not ( = ?auto_656594 ?auto_656602 ) ) ( not ( = ?auto_656594 ?auto_656603 ) ) ( not ( = ?auto_656594 ?auto_656604 ) ) ( not ( = ?auto_656594 ?auto_656605 ) ) ( not ( = ?auto_656594 ?auto_656606 ) ) ( not ( = ?auto_656594 ?auto_656607 ) ) ( not ( = ?auto_656594 ?auto_656608 ) ) ( not ( = ?auto_656594 ?auto_656609 ) ) ( not ( = ?auto_656595 ?auto_656596 ) ) ( not ( = ?auto_656595 ?auto_656597 ) ) ( not ( = ?auto_656595 ?auto_656598 ) ) ( not ( = ?auto_656595 ?auto_656599 ) ) ( not ( = ?auto_656595 ?auto_656600 ) ) ( not ( = ?auto_656595 ?auto_656601 ) ) ( not ( = ?auto_656595 ?auto_656602 ) ) ( not ( = ?auto_656595 ?auto_656603 ) ) ( not ( = ?auto_656595 ?auto_656604 ) ) ( not ( = ?auto_656595 ?auto_656605 ) ) ( not ( = ?auto_656595 ?auto_656606 ) ) ( not ( = ?auto_656595 ?auto_656607 ) ) ( not ( = ?auto_656595 ?auto_656608 ) ) ( not ( = ?auto_656595 ?auto_656609 ) ) ( not ( = ?auto_656596 ?auto_656597 ) ) ( not ( = ?auto_656596 ?auto_656598 ) ) ( not ( = ?auto_656596 ?auto_656599 ) ) ( not ( = ?auto_656596 ?auto_656600 ) ) ( not ( = ?auto_656596 ?auto_656601 ) ) ( not ( = ?auto_656596 ?auto_656602 ) ) ( not ( = ?auto_656596 ?auto_656603 ) ) ( not ( = ?auto_656596 ?auto_656604 ) ) ( not ( = ?auto_656596 ?auto_656605 ) ) ( not ( = ?auto_656596 ?auto_656606 ) ) ( not ( = ?auto_656596 ?auto_656607 ) ) ( not ( = ?auto_656596 ?auto_656608 ) ) ( not ( = ?auto_656596 ?auto_656609 ) ) ( not ( = ?auto_656597 ?auto_656598 ) ) ( not ( = ?auto_656597 ?auto_656599 ) ) ( not ( = ?auto_656597 ?auto_656600 ) ) ( not ( = ?auto_656597 ?auto_656601 ) ) ( not ( = ?auto_656597 ?auto_656602 ) ) ( not ( = ?auto_656597 ?auto_656603 ) ) ( not ( = ?auto_656597 ?auto_656604 ) ) ( not ( = ?auto_656597 ?auto_656605 ) ) ( not ( = ?auto_656597 ?auto_656606 ) ) ( not ( = ?auto_656597 ?auto_656607 ) ) ( not ( = ?auto_656597 ?auto_656608 ) ) ( not ( = ?auto_656597 ?auto_656609 ) ) ( not ( = ?auto_656598 ?auto_656599 ) ) ( not ( = ?auto_656598 ?auto_656600 ) ) ( not ( = ?auto_656598 ?auto_656601 ) ) ( not ( = ?auto_656598 ?auto_656602 ) ) ( not ( = ?auto_656598 ?auto_656603 ) ) ( not ( = ?auto_656598 ?auto_656604 ) ) ( not ( = ?auto_656598 ?auto_656605 ) ) ( not ( = ?auto_656598 ?auto_656606 ) ) ( not ( = ?auto_656598 ?auto_656607 ) ) ( not ( = ?auto_656598 ?auto_656608 ) ) ( not ( = ?auto_656598 ?auto_656609 ) ) ( not ( = ?auto_656599 ?auto_656600 ) ) ( not ( = ?auto_656599 ?auto_656601 ) ) ( not ( = ?auto_656599 ?auto_656602 ) ) ( not ( = ?auto_656599 ?auto_656603 ) ) ( not ( = ?auto_656599 ?auto_656604 ) ) ( not ( = ?auto_656599 ?auto_656605 ) ) ( not ( = ?auto_656599 ?auto_656606 ) ) ( not ( = ?auto_656599 ?auto_656607 ) ) ( not ( = ?auto_656599 ?auto_656608 ) ) ( not ( = ?auto_656599 ?auto_656609 ) ) ( not ( = ?auto_656600 ?auto_656601 ) ) ( not ( = ?auto_656600 ?auto_656602 ) ) ( not ( = ?auto_656600 ?auto_656603 ) ) ( not ( = ?auto_656600 ?auto_656604 ) ) ( not ( = ?auto_656600 ?auto_656605 ) ) ( not ( = ?auto_656600 ?auto_656606 ) ) ( not ( = ?auto_656600 ?auto_656607 ) ) ( not ( = ?auto_656600 ?auto_656608 ) ) ( not ( = ?auto_656600 ?auto_656609 ) ) ( not ( = ?auto_656601 ?auto_656602 ) ) ( not ( = ?auto_656601 ?auto_656603 ) ) ( not ( = ?auto_656601 ?auto_656604 ) ) ( not ( = ?auto_656601 ?auto_656605 ) ) ( not ( = ?auto_656601 ?auto_656606 ) ) ( not ( = ?auto_656601 ?auto_656607 ) ) ( not ( = ?auto_656601 ?auto_656608 ) ) ( not ( = ?auto_656601 ?auto_656609 ) ) ( not ( = ?auto_656602 ?auto_656603 ) ) ( not ( = ?auto_656602 ?auto_656604 ) ) ( not ( = ?auto_656602 ?auto_656605 ) ) ( not ( = ?auto_656602 ?auto_656606 ) ) ( not ( = ?auto_656602 ?auto_656607 ) ) ( not ( = ?auto_656602 ?auto_656608 ) ) ( not ( = ?auto_656602 ?auto_656609 ) ) ( not ( = ?auto_656603 ?auto_656604 ) ) ( not ( = ?auto_656603 ?auto_656605 ) ) ( not ( = ?auto_656603 ?auto_656606 ) ) ( not ( = ?auto_656603 ?auto_656607 ) ) ( not ( = ?auto_656603 ?auto_656608 ) ) ( not ( = ?auto_656603 ?auto_656609 ) ) ( not ( = ?auto_656604 ?auto_656605 ) ) ( not ( = ?auto_656604 ?auto_656606 ) ) ( not ( = ?auto_656604 ?auto_656607 ) ) ( not ( = ?auto_656604 ?auto_656608 ) ) ( not ( = ?auto_656604 ?auto_656609 ) ) ( not ( = ?auto_656605 ?auto_656606 ) ) ( not ( = ?auto_656605 ?auto_656607 ) ) ( not ( = ?auto_656605 ?auto_656608 ) ) ( not ( = ?auto_656605 ?auto_656609 ) ) ( not ( = ?auto_656606 ?auto_656607 ) ) ( not ( = ?auto_656606 ?auto_656608 ) ) ( not ( = ?auto_656606 ?auto_656609 ) ) ( not ( = ?auto_656607 ?auto_656608 ) ) ( not ( = ?auto_656607 ?auto_656609 ) ) ( not ( = ?auto_656608 ?auto_656609 ) ) ( ON ?auto_656607 ?auto_656608 ) ( ON ?auto_656606 ?auto_656607 ) ( CLEAR ?auto_656604 ) ( ON ?auto_656605 ?auto_656606 ) ( CLEAR ?auto_656605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_656592 ?auto_656593 ?auto_656594 ?auto_656595 ?auto_656596 ?auto_656597 ?auto_656598 ?auto_656599 ?auto_656600 ?auto_656601 ?auto_656602 ?auto_656603 ?auto_656604 ?auto_656605 )
      ( MAKE-17PILE ?auto_656592 ?auto_656593 ?auto_656594 ?auto_656595 ?auto_656596 ?auto_656597 ?auto_656598 ?auto_656599 ?auto_656600 ?auto_656601 ?auto_656602 ?auto_656603 ?auto_656604 ?auto_656605 ?auto_656606 ?auto_656607 ?auto_656608 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_656627 - BLOCK
      ?auto_656628 - BLOCK
      ?auto_656629 - BLOCK
      ?auto_656630 - BLOCK
      ?auto_656631 - BLOCK
      ?auto_656632 - BLOCK
      ?auto_656633 - BLOCK
      ?auto_656634 - BLOCK
      ?auto_656635 - BLOCK
      ?auto_656636 - BLOCK
      ?auto_656637 - BLOCK
      ?auto_656638 - BLOCK
      ?auto_656639 - BLOCK
      ?auto_656640 - BLOCK
      ?auto_656641 - BLOCK
      ?auto_656642 - BLOCK
      ?auto_656643 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_656643 ) ( ON-TABLE ?auto_656627 ) ( ON ?auto_656628 ?auto_656627 ) ( ON ?auto_656629 ?auto_656628 ) ( ON ?auto_656630 ?auto_656629 ) ( ON ?auto_656631 ?auto_656630 ) ( ON ?auto_656632 ?auto_656631 ) ( ON ?auto_656633 ?auto_656632 ) ( ON ?auto_656634 ?auto_656633 ) ( ON ?auto_656635 ?auto_656634 ) ( ON ?auto_656636 ?auto_656635 ) ( ON ?auto_656637 ?auto_656636 ) ( ON ?auto_656638 ?auto_656637 ) ( ON ?auto_656639 ?auto_656638 ) ( not ( = ?auto_656627 ?auto_656628 ) ) ( not ( = ?auto_656627 ?auto_656629 ) ) ( not ( = ?auto_656627 ?auto_656630 ) ) ( not ( = ?auto_656627 ?auto_656631 ) ) ( not ( = ?auto_656627 ?auto_656632 ) ) ( not ( = ?auto_656627 ?auto_656633 ) ) ( not ( = ?auto_656627 ?auto_656634 ) ) ( not ( = ?auto_656627 ?auto_656635 ) ) ( not ( = ?auto_656627 ?auto_656636 ) ) ( not ( = ?auto_656627 ?auto_656637 ) ) ( not ( = ?auto_656627 ?auto_656638 ) ) ( not ( = ?auto_656627 ?auto_656639 ) ) ( not ( = ?auto_656627 ?auto_656640 ) ) ( not ( = ?auto_656627 ?auto_656641 ) ) ( not ( = ?auto_656627 ?auto_656642 ) ) ( not ( = ?auto_656627 ?auto_656643 ) ) ( not ( = ?auto_656628 ?auto_656629 ) ) ( not ( = ?auto_656628 ?auto_656630 ) ) ( not ( = ?auto_656628 ?auto_656631 ) ) ( not ( = ?auto_656628 ?auto_656632 ) ) ( not ( = ?auto_656628 ?auto_656633 ) ) ( not ( = ?auto_656628 ?auto_656634 ) ) ( not ( = ?auto_656628 ?auto_656635 ) ) ( not ( = ?auto_656628 ?auto_656636 ) ) ( not ( = ?auto_656628 ?auto_656637 ) ) ( not ( = ?auto_656628 ?auto_656638 ) ) ( not ( = ?auto_656628 ?auto_656639 ) ) ( not ( = ?auto_656628 ?auto_656640 ) ) ( not ( = ?auto_656628 ?auto_656641 ) ) ( not ( = ?auto_656628 ?auto_656642 ) ) ( not ( = ?auto_656628 ?auto_656643 ) ) ( not ( = ?auto_656629 ?auto_656630 ) ) ( not ( = ?auto_656629 ?auto_656631 ) ) ( not ( = ?auto_656629 ?auto_656632 ) ) ( not ( = ?auto_656629 ?auto_656633 ) ) ( not ( = ?auto_656629 ?auto_656634 ) ) ( not ( = ?auto_656629 ?auto_656635 ) ) ( not ( = ?auto_656629 ?auto_656636 ) ) ( not ( = ?auto_656629 ?auto_656637 ) ) ( not ( = ?auto_656629 ?auto_656638 ) ) ( not ( = ?auto_656629 ?auto_656639 ) ) ( not ( = ?auto_656629 ?auto_656640 ) ) ( not ( = ?auto_656629 ?auto_656641 ) ) ( not ( = ?auto_656629 ?auto_656642 ) ) ( not ( = ?auto_656629 ?auto_656643 ) ) ( not ( = ?auto_656630 ?auto_656631 ) ) ( not ( = ?auto_656630 ?auto_656632 ) ) ( not ( = ?auto_656630 ?auto_656633 ) ) ( not ( = ?auto_656630 ?auto_656634 ) ) ( not ( = ?auto_656630 ?auto_656635 ) ) ( not ( = ?auto_656630 ?auto_656636 ) ) ( not ( = ?auto_656630 ?auto_656637 ) ) ( not ( = ?auto_656630 ?auto_656638 ) ) ( not ( = ?auto_656630 ?auto_656639 ) ) ( not ( = ?auto_656630 ?auto_656640 ) ) ( not ( = ?auto_656630 ?auto_656641 ) ) ( not ( = ?auto_656630 ?auto_656642 ) ) ( not ( = ?auto_656630 ?auto_656643 ) ) ( not ( = ?auto_656631 ?auto_656632 ) ) ( not ( = ?auto_656631 ?auto_656633 ) ) ( not ( = ?auto_656631 ?auto_656634 ) ) ( not ( = ?auto_656631 ?auto_656635 ) ) ( not ( = ?auto_656631 ?auto_656636 ) ) ( not ( = ?auto_656631 ?auto_656637 ) ) ( not ( = ?auto_656631 ?auto_656638 ) ) ( not ( = ?auto_656631 ?auto_656639 ) ) ( not ( = ?auto_656631 ?auto_656640 ) ) ( not ( = ?auto_656631 ?auto_656641 ) ) ( not ( = ?auto_656631 ?auto_656642 ) ) ( not ( = ?auto_656631 ?auto_656643 ) ) ( not ( = ?auto_656632 ?auto_656633 ) ) ( not ( = ?auto_656632 ?auto_656634 ) ) ( not ( = ?auto_656632 ?auto_656635 ) ) ( not ( = ?auto_656632 ?auto_656636 ) ) ( not ( = ?auto_656632 ?auto_656637 ) ) ( not ( = ?auto_656632 ?auto_656638 ) ) ( not ( = ?auto_656632 ?auto_656639 ) ) ( not ( = ?auto_656632 ?auto_656640 ) ) ( not ( = ?auto_656632 ?auto_656641 ) ) ( not ( = ?auto_656632 ?auto_656642 ) ) ( not ( = ?auto_656632 ?auto_656643 ) ) ( not ( = ?auto_656633 ?auto_656634 ) ) ( not ( = ?auto_656633 ?auto_656635 ) ) ( not ( = ?auto_656633 ?auto_656636 ) ) ( not ( = ?auto_656633 ?auto_656637 ) ) ( not ( = ?auto_656633 ?auto_656638 ) ) ( not ( = ?auto_656633 ?auto_656639 ) ) ( not ( = ?auto_656633 ?auto_656640 ) ) ( not ( = ?auto_656633 ?auto_656641 ) ) ( not ( = ?auto_656633 ?auto_656642 ) ) ( not ( = ?auto_656633 ?auto_656643 ) ) ( not ( = ?auto_656634 ?auto_656635 ) ) ( not ( = ?auto_656634 ?auto_656636 ) ) ( not ( = ?auto_656634 ?auto_656637 ) ) ( not ( = ?auto_656634 ?auto_656638 ) ) ( not ( = ?auto_656634 ?auto_656639 ) ) ( not ( = ?auto_656634 ?auto_656640 ) ) ( not ( = ?auto_656634 ?auto_656641 ) ) ( not ( = ?auto_656634 ?auto_656642 ) ) ( not ( = ?auto_656634 ?auto_656643 ) ) ( not ( = ?auto_656635 ?auto_656636 ) ) ( not ( = ?auto_656635 ?auto_656637 ) ) ( not ( = ?auto_656635 ?auto_656638 ) ) ( not ( = ?auto_656635 ?auto_656639 ) ) ( not ( = ?auto_656635 ?auto_656640 ) ) ( not ( = ?auto_656635 ?auto_656641 ) ) ( not ( = ?auto_656635 ?auto_656642 ) ) ( not ( = ?auto_656635 ?auto_656643 ) ) ( not ( = ?auto_656636 ?auto_656637 ) ) ( not ( = ?auto_656636 ?auto_656638 ) ) ( not ( = ?auto_656636 ?auto_656639 ) ) ( not ( = ?auto_656636 ?auto_656640 ) ) ( not ( = ?auto_656636 ?auto_656641 ) ) ( not ( = ?auto_656636 ?auto_656642 ) ) ( not ( = ?auto_656636 ?auto_656643 ) ) ( not ( = ?auto_656637 ?auto_656638 ) ) ( not ( = ?auto_656637 ?auto_656639 ) ) ( not ( = ?auto_656637 ?auto_656640 ) ) ( not ( = ?auto_656637 ?auto_656641 ) ) ( not ( = ?auto_656637 ?auto_656642 ) ) ( not ( = ?auto_656637 ?auto_656643 ) ) ( not ( = ?auto_656638 ?auto_656639 ) ) ( not ( = ?auto_656638 ?auto_656640 ) ) ( not ( = ?auto_656638 ?auto_656641 ) ) ( not ( = ?auto_656638 ?auto_656642 ) ) ( not ( = ?auto_656638 ?auto_656643 ) ) ( not ( = ?auto_656639 ?auto_656640 ) ) ( not ( = ?auto_656639 ?auto_656641 ) ) ( not ( = ?auto_656639 ?auto_656642 ) ) ( not ( = ?auto_656639 ?auto_656643 ) ) ( not ( = ?auto_656640 ?auto_656641 ) ) ( not ( = ?auto_656640 ?auto_656642 ) ) ( not ( = ?auto_656640 ?auto_656643 ) ) ( not ( = ?auto_656641 ?auto_656642 ) ) ( not ( = ?auto_656641 ?auto_656643 ) ) ( not ( = ?auto_656642 ?auto_656643 ) ) ( ON ?auto_656642 ?auto_656643 ) ( ON ?auto_656641 ?auto_656642 ) ( CLEAR ?auto_656639 ) ( ON ?auto_656640 ?auto_656641 ) ( CLEAR ?auto_656640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_656627 ?auto_656628 ?auto_656629 ?auto_656630 ?auto_656631 ?auto_656632 ?auto_656633 ?auto_656634 ?auto_656635 ?auto_656636 ?auto_656637 ?auto_656638 ?auto_656639 ?auto_656640 )
      ( MAKE-17PILE ?auto_656627 ?auto_656628 ?auto_656629 ?auto_656630 ?auto_656631 ?auto_656632 ?auto_656633 ?auto_656634 ?auto_656635 ?auto_656636 ?auto_656637 ?auto_656638 ?auto_656639 ?auto_656640 ?auto_656641 ?auto_656642 ?auto_656643 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_656661 - BLOCK
      ?auto_656662 - BLOCK
      ?auto_656663 - BLOCK
      ?auto_656664 - BLOCK
      ?auto_656665 - BLOCK
      ?auto_656666 - BLOCK
      ?auto_656667 - BLOCK
      ?auto_656668 - BLOCK
      ?auto_656669 - BLOCK
      ?auto_656670 - BLOCK
      ?auto_656671 - BLOCK
      ?auto_656672 - BLOCK
      ?auto_656673 - BLOCK
      ?auto_656674 - BLOCK
      ?auto_656675 - BLOCK
      ?auto_656676 - BLOCK
      ?auto_656677 - BLOCK
    )
    :vars
    (
      ?auto_656678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_656677 ?auto_656678 ) ( ON-TABLE ?auto_656661 ) ( ON ?auto_656662 ?auto_656661 ) ( ON ?auto_656663 ?auto_656662 ) ( ON ?auto_656664 ?auto_656663 ) ( ON ?auto_656665 ?auto_656664 ) ( ON ?auto_656666 ?auto_656665 ) ( ON ?auto_656667 ?auto_656666 ) ( ON ?auto_656668 ?auto_656667 ) ( ON ?auto_656669 ?auto_656668 ) ( ON ?auto_656670 ?auto_656669 ) ( ON ?auto_656671 ?auto_656670 ) ( ON ?auto_656672 ?auto_656671 ) ( not ( = ?auto_656661 ?auto_656662 ) ) ( not ( = ?auto_656661 ?auto_656663 ) ) ( not ( = ?auto_656661 ?auto_656664 ) ) ( not ( = ?auto_656661 ?auto_656665 ) ) ( not ( = ?auto_656661 ?auto_656666 ) ) ( not ( = ?auto_656661 ?auto_656667 ) ) ( not ( = ?auto_656661 ?auto_656668 ) ) ( not ( = ?auto_656661 ?auto_656669 ) ) ( not ( = ?auto_656661 ?auto_656670 ) ) ( not ( = ?auto_656661 ?auto_656671 ) ) ( not ( = ?auto_656661 ?auto_656672 ) ) ( not ( = ?auto_656661 ?auto_656673 ) ) ( not ( = ?auto_656661 ?auto_656674 ) ) ( not ( = ?auto_656661 ?auto_656675 ) ) ( not ( = ?auto_656661 ?auto_656676 ) ) ( not ( = ?auto_656661 ?auto_656677 ) ) ( not ( = ?auto_656661 ?auto_656678 ) ) ( not ( = ?auto_656662 ?auto_656663 ) ) ( not ( = ?auto_656662 ?auto_656664 ) ) ( not ( = ?auto_656662 ?auto_656665 ) ) ( not ( = ?auto_656662 ?auto_656666 ) ) ( not ( = ?auto_656662 ?auto_656667 ) ) ( not ( = ?auto_656662 ?auto_656668 ) ) ( not ( = ?auto_656662 ?auto_656669 ) ) ( not ( = ?auto_656662 ?auto_656670 ) ) ( not ( = ?auto_656662 ?auto_656671 ) ) ( not ( = ?auto_656662 ?auto_656672 ) ) ( not ( = ?auto_656662 ?auto_656673 ) ) ( not ( = ?auto_656662 ?auto_656674 ) ) ( not ( = ?auto_656662 ?auto_656675 ) ) ( not ( = ?auto_656662 ?auto_656676 ) ) ( not ( = ?auto_656662 ?auto_656677 ) ) ( not ( = ?auto_656662 ?auto_656678 ) ) ( not ( = ?auto_656663 ?auto_656664 ) ) ( not ( = ?auto_656663 ?auto_656665 ) ) ( not ( = ?auto_656663 ?auto_656666 ) ) ( not ( = ?auto_656663 ?auto_656667 ) ) ( not ( = ?auto_656663 ?auto_656668 ) ) ( not ( = ?auto_656663 ?auto_656669 ) ) ( not ( = ?auto_656663 ?auto_656670 ) ) ( not ( = ?auto_656663 ?auto_656671 ) ) ( not ( = ?auto_656663 ?auto_656672 ) ) ( not ( = ?auto_656663 ?auto_656673 ) ) ( not ( = ?auto_656663 ?auto_656674 ) ) ( not ( = ?auto_656663 ?auto_656675 ) ) ( not ( = ?auto_656663 ?auto_656676 ) ) ( not ( = ?auto_656663 ?auto_656677 ) ) ( not ( = ?auto_656663 ?auto_656678 ) ) ( not ( = ?auto_656664 ?auto_656665 ) ) ( not ( = ?auto_656664 ?auto_656666 ) ) ( not ( = ?auto_656664 ?auto_656667 ) ) ( not ( = ?auto_656664 ?auto_656668 ) ) ( not ( = ?auto_656664 ?auto_656669 ) ) ( not ( = ?auto_656664 ?auto_656670 ) ) ( not ( = ?auto_656664 ?auto_656671 ) ) ( not ( = ?auto_656664 ?auto_656672 ) ) ( not ( = ?auto_656664 ?auto_656673 ) ) ( not ( = ?auto_656664 ?auto_656674 ) ) ( not ( = ?auto_656664 ?auto_656675 ) ) ( not ( = ?auto_656664 ?auto_656676 ) ) ( not ( = ?auto_656664 ?auto_656677 ) ) ( not ( = ?auto_656664 ?auto_656678 ) ) ( not ( = ?auto_656665 ?auto_656666 ) ) ( not ( = ?auto_656665 ?auto_656667 ) ) ( not ( = ?auto_656665 ?auto_656668 ) ) ( not ( = ?auto_656665 ?auto_656669 ) ) ( not ( = ?auto_656665 ?auto_656670 ) ) ( not ( = ?auto_656665 ?auto_656671 ) ) ( not ( = ?auto_656665 ?auto_656672 ) ) ( not ( = ?auto_656665 ?auto_656673 ) ) ( not ( = ?auto_656665 ?auto_656674 ) ) ( not ( = ?auto_656665 ?auto_656675 ) ) ( not ( = ?auto_656665 ?auto_656676 ) ) ( not ( = ?auto_656665 ?auto_656677 ) ) ( not ( = ?auto_656665 ?auto_656678 ) ) ( not ( = ?auto_656666 ?auto_656667 ) ) ( not ( = ?auto_656666 ?auto_656668 ) ) ( not ( = ?auto_656666 ?auto_656669 ) ) ( not ( = ?auto_656666 ?auto_656670 ) ) ( not ( = ?auto_656666 ?auto_656671 ) ) ( not ( = ?auto_656666 ?auto_656672 ) ) ( not ( = ?auto_656666 ?auto_656673 ) ) ( not ( = ?auto_656666 ?auto_656674 ) ) ( not ( = ?auto_656666 ?auto_656675 ) ) ( not ( = ?auto_656666 ?auto_656676 ) ) ( not ( = ?auto_656666 ?auto_656677 ) ) ( not ( = ?auto_656666 ?auto_656678 ) ) ( not ( = ?auto_656667 ?auto_656668 ) ) ( not ( = ?auto_656667 ?auto_656669 ) ) ( not ( = ?auto_656667 ?auto_656670 ) ) ( not ( = ?auto_656667 ?auto_656671 ) ) ( not ( = ?auto_656667 ?auto_656672 ) ) ( not ( = ?auto_656667 ?auto_656673 ) ) ( not ( = ?auto_656667 ?auto_656674 ) ) ( not ( = ?auto_656667 ?auto_656675 ) ) ( not ( = ?auto_656667 ?auto_656676 ) ) ( not ( = ?auto_656667 ?auto_656677 ) ) ( not ( = ?auto_656667 ?auto_656678 ) ) ( not ( = ?auto_656668 ?auto_656669 ) ) ( not ( = ?auto_656668 ?auto_656670 ) ) ( not ( = ?auto_656668 ?auto_656671 ) ) ( not ( = ?auto_656668 ?auto_656672 ) ) ( not ( = ?auto_656668 ?auto_656673 ) ) ( not ( = ?auto_656668 ?auto_656674 ) ) ( not ( = ?auto_656668 ?auto_656675 ) ) ( not ( = ?auto_656668 ?auto_656676 ) ) ( not ( = ?auto_656668 ?auto_656677 ) ) ( not ( = ?auto_656668 ?auto_656678 ) ) ( not ( = ?auto_656669 ?auto_656670 ) ) ( not ( = ?auto_656669 ?auto_656671 ) ) ( not ( = ?auto_656669 ?auto_656672 ) ) ( not ( = ?auto_656669 ?auto_656673 ) ) ( not ( = ?auto_656669 ?auto_656674 ) ) ( not ( = ?auto_656669 ?auto_656675 ) ) ( not ( = ?auto_656669 ?auto_656676 ) ) ( not ( = ?auto_656669 ?auto_656677 ) ) ( not ( = ?auto_656669 ?auto_656678 ) ) ( not ( = ?auto_656670 ?auto_656671 ) ) ( not ( = ?auto_656670 ?auto_656672 ) ) ( not ( = ?auto_656670 ?auto_656673 ) ) ( not ( = ?auto_656670 ?auto_656674 ) ) ( not ( = ?auto_656670 ?auto_656675 ) ) ( not ( = ?auto_656670 ?auto_656676 ) ) ( not ( = ?auto_656670 ?auto_656677 ) ) ( not ( = ?auto_656670 ?auto_656678 ) ) ( not ( = ?auto_656671 ?auto_656672 ) ) ( not ( = ?auto_656671 ?auto_656673 ) ) ( not ( = ?auto_656671 ?auto_656674 ) ) ( not ( = ?auto_656671 ?auto_656675 ) ) ( not ( = ?auto_656671 ?auto_656676 ) ) ( not ( = ?auto_656671 ?auto_656677 ) ) ( not ( = ?auto_656671 ?auto_656678 ) ) ( not ( = ?auto_656672 ?auto_656673 ) ) ( not ( = ?auto_656672 ?auto_656674 ) ) ( not ( = ?auto_656672 ?auto_656675 ) ) ( not ( = ?auto_656672 ?auto_656676 ) ) ( not ( = ?auto_656672 ?auto_656677 ) ) ( not ( = ?auto_656672 ?auto_656678 ) ) ( not ( = ?auto_656673 ?auto_656674 ) ) ( not ( = ?auto_656673 ?auto_656675 ) ) ( not ( = ?auto_656673 ?auto_656676 ) ) ( not ( = ?auto_656673 ?auto_656677 ) ) ( not ( = ?auto_656673 ?auto_656678 ) ) ( not ( = ?auto_656674 ?auto_656675 ) ) ( not ( = ?auto_656674 ?auto_656676 ) ) ( not ( = ?auto_656674 ?auto_656677 ) ) ( not ( = ?auto_656674 ?auto_656678 ) ) ( not ( = ?auto_656675 ?auto_656676 ) ) ( not ( = ?auto_656675 ?auto_656677 ) ) ( not ( = ?auto_656675 ?auto_656678 ) ) ( not ( = ?auto_656676 ?auto_656677 ) ) ( not ( = ?auto_656676 ?auto_656678 ) ) ( not ( = ?auto_656677 ?auto_656678 ) ) ( ON ?auto_656676 ?auto_656677 ) ( ON ?auto_656675 ?auto_656676 ) ( ON ?auto_656674 ?auto_656675 ) ( CLEAR ?auto_656672 ) ( ON ?auto_656673 ?auto_656674 ) ( CLEAR ?auto_656673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_656661 ?auto_656662 ?auto_656663 ?auto_656664 ?auto_656665 ?auto_656666 ?auto_656667 ?auto_656668 ?auto_656669 ?auto_656670 ?auto_656671 ?auto_656672 ?auto_656673 )
      ( MAKE-17PILE ?auto_656661 ?auto_656662 ?auto_656663 ?auto_656664 ?auto_656665 ?auto_656666 ?auto_656667 ?auto_656668 ?auto_656669 ?auto_656670 ?auto_656671 ?auto_656672 ?auto_656673 ?auto_656674 ?auto_656675 ?auto_656676 ?auto_656677 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_656696 - BLOCK
      ?auto_656697 - BLOCK
      ?auto_656698 - BLOCK
      ?auto_656699 - BLOCK
      ?auto_656700 - BLOCK
      ?auto_656701 - BLOCK
      ?auto_656702 - BLOCK
      ?auto_656703 - BLOCK
      ?auto_656704 - BLOCK
      ?auto_656705 - BLOCK
      ?auto_656706 - BLOCK
      ?auto_656707 - BLOCK
      ?auto_656708 - BLOCK
      ?auto_656709 - BLOCK
      ?auto_656710 - BLOCK
      ?auto_656711 - BLOCK
      ?auto_656712 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_656712 ) ( ON-TABLE ?auto_656696 ) ( ON ?auto_656697 ?auto_656696 ) ( ON ?auto_656698 ?auto_656697 ) ( ON ?auto_656699 ?auto_656698 ) ( ON ?auto_656700 ?auto_656699 ) ( ON ?auto_656701 ?auto_656700 ) ( ON ?auto_656702 ?auto_656701 ) ( ON ?auto_656703 ?auto_656702 ) ( ON ?auto_656704 ?auto_656703 ) ( ON ?auto_656705 ?auto_656704 ) ( ON ?auto_656706 ?auto_656705 ) ( ON ?auto_656707 ?auto_656706 ) ( not ( = ?auto_656696 ?auto_656697 ) ) ( not ( = ?auto_656696 ?auto_656698 ) ) ( not ( = ?auto_656696 ?auto_656699 ) ) ( not ( = ?auto_656696 ?auto_656700 ) ) ( not ( = ?auto_656696 ?auto_656701 ) ) ( not ( = ?auto_656696 ?auto_656702 ) ) ( not ( = ?auto_656696 ?auto_656703 ) ) ( not ( = ?auto_656696 ?auto_656704 ) ) ( not ( = ?auto_656696 ?auto_656705 ) ) ( not ( = ?auto_656696 ?auto_656706 ) ) ( not ( = ?auto_656696 ?auto_656707 ) ) ( not ( = ?auto_656696 ?auto_656708 ) ) ( not ( = ?auto_656696 ?auto_656709 ) ) ( not ( = ?auto_656696 ?auto_656710 ) ) ( not ( = ?auto_656696 ?auto_656711 ) ) ( not ( = ?auto_656696 ?auto_656712 ) ) ( not ( = ?auto_656697 ?auto_656698 ) ) ( not ( = ?auto_656697 ?auto_656699 ) ) ( not ( = ?auto_656697 ?auto_656700 ) ) ( not ( = ?auto_656697 ?auto_656701 ) ) ( not ( = ?auto_656697 ?auto_656702 ) ) ( not ( = ?auto_656697 ?auto_656703 ) ) ( not ( = ?auto_656697 ?auto_656704 ) ) ( not ( = ?auto_656697 ?auto_656705 ) ) ( not ( = ?auto_656697 ?auto_656706 ) ) ( not ( = ?auto_656697 ?auto_656707 ) ) ( not ( = ?auto_656697 ?auto_656708 ) ) ( not ( = ?auto_656697 ?auto_656709 ) ) ( not ( = ?auto_656697 ?auto_656710 ) ) ( not ( = ?auto_656697 ?auto_656711 ) ) ( not ( = ?auto_656697 ?auto_656712 ) ) ( not ( = ?auto_656698 ?auto_656699 ) ) ( not ( = ?auto_656698 ?auto_656700 ) ) ( not ( = ?auto_656698 ?auto_656701 ) ) ( not ( = ?auto_656698 ?auto_656702 ) ) ( not ( = ?auto_656698 ?auto_656703 ) ) ( not ( = ?auto_656698 ?auto_656704 ) ) ( not ( = ?auto_656698 ?auto_656705 ) ) ( not ( = ?auto_656698 ?auto_656706 ) ) ( not ( = ?auto_656698 ?auto_656707 ) ) ( not ( = ?auto_656698 ?auto_656708 ) ) ( not ( = ?auto_656698 ?auto_656709 ) ) ( not ( = ?auto_656698 ?auto_656710 ) ) ( not ( = ?auto_656698 ?auto_656711 ) ) ( not ( = ?auto_656698 ?auto_656712 ) ) ( not ( = ?auto_656699 ?auto_656700 ) ) ( not ( = ?auto_656699 ?auto_656701 ) ) ( not ( = ?auto_656699 ?auto_656702 ) ) ( not ( = ?auto_656699 ?auto_656703 ) ) ( not ( = ?auto_656699 ?auto_656704 ) ) ( not ( = ?auto_656699 ?auto_656705 ) ) ( not ( = ?auto_656699 ?auto_656706 ) ) ( not ( = ?auto_656699 ?auto_656707 ) ) ( not ( = ?auto_656699 ?auto_656708 ) ) ( not ( = ?auto_656699 ?auto_656709 ) ) ( not ( = ?auto_656699 ?auto_656710 ) ) ( not ( = ?auto_656699 ?auto_656711 ) ) ( not ( = ?auto_656699 ?auto_656712 ) ) ( not ( = ?auto_656700 ?auto_656701 ) ) ( not ( = ?auto_656700 ?auto_656702 ) ) ( not ( = ?auto_656700 ?auto_656703 ) ) ( not ( = ?auto_656700 ?auto_656704 ) ) ( not ( = ?auto_656700 ?auto_656705 ) ) ( not ( = ?auto_656700 ?auto_656706 ) ) ( not ( = ?auto_656700 ?auto_656707 ) ) ( not ( = ?auto_656700 ?auto_656708 ) ) ( not ( = ?auto_656700 ?auto_656709 ) ) ( not ( = ?auto_656700 ?auto_656710 ) ) ( not ( = ?auto_656700 ?auto_656711 ) ) ( not ( = ?auto_656700 ?auto_656712 ) ) ( not ( = ?auto_656701 ?auto_656702 ) ) ( not ( = ?auto_656701 ?auto_656703 ) ) ( not ( = ?auto_656701 ?auto_656704 ) ) ( not ( = ?auto_656701 ?auto_656705 ) ) ( not ( = ?auto_656701 ?auto_656706 ) ) ( not ( = ?auto_656701 ?auto_656707 ) ) ( not ( = ?auto_656701 ?auto_656708 ) ) ( not ( = ?auto_656701 ?auto_656709 ) ) ( not ( = ?auto_656701 ?auto_656710 ) ) ( not ( = ?auto_656701 ?auto_656711 ) ) ( not ( = ?auto_656701 ?auto_656712 ) ) ( not ( = ?auto_656702 ?auto_656703 ) ) ( not ( = ?auto_656702 ?auto_656704 ) ) ( not ( = ?auto_656702 ?auto_656705 ) ) ( not ( = ?auto_656702 ?auto_656706 ) ) ( not ( = ?auto_656702 ?auto_656707 ) ) ( not ( = ?auto_656702 ?auto_656708 ) ) ( not ( = ?auto_656702 ?auto_656709 ) ) ( not ( = ?auto_656702 ?auto_656710 ) ) ( not ( = ?auto_656702 ?auto_656711 ) ) ( not ( = ?auto_656702 ?auto_656712 ) ) ( not ( = ?auto_656703 ?auto_656704 ) ) ( not ( = ?auto_656703 ?auto_656705 ) ) ( not ( = ?auto_656703 ?auto_656706 ) ) ( not ( = ?auto_656703 ?auto_656707 ) ) ( not ( = ?auto_656703 ?auto_656708 ) ) ( not ( = ?auto_656703 ?auto_656709 ) ) ( not ( = ?auto_656703 ?auto_656710 ) ) ( not ( = ?auto_656703 ?auto_656711 ) ) ( not ( = ?auto_656703 ?auto_656712 ) ) ( not ( = ?auto_656704 ?auto_656705 ) ) ( not ( = ?auto_656704 ?auto_656706 ) ) ( not ( = ?auto_656704 ?auto_656707 ) ) ( not ( = ?auto_656704 ?auto_656708 ) ) ( not ( = ?auto_656704 ?auto_656709 ) ) ( not ( = ?auto_656704 ?auto_656710 ) ) ( not ( = ?auto_656704 ?auto_656711 ) ) ( not ( = ?auto_656704 ?auto_656712 ) ) ( not ( = ?auto_656705 ?auto_656706 ) ) ( not ( = ?auto_656705 ?auto_656707 ) ) ( not ( = ?auto_656705 ?auto_656708 ) ) ( not ( = ?auto_656705 ?auto_656709 ) ) ( not ( = ?auto_656705 ?auto_656710 ) ) ( not ( = ?auto_656705 ?auto_656711 ) ) ( not ( = ?auto_656705 ?auto_656712 ) ) ( not ( = ?auto_656706 ?auto_656707 ) ) ( not ( = ?auto_656706 ?auto_656708 ) ) ( not ( = ?auto_656706 ?auto_656709 ) ) ( not ( = ?auto_656706 ?auto_656710 ) ) ( not ( = ?auto_656706 ?auto_656711 ) ) ( not ( = ?auto_656706 ?auto_656712 ) ) ( not ( = ?auto_656707 ?auto_656708 ) ) ( not ( = ?auto_656707 ?auto_656709 ) ) ( not ( = ?auto_656707 ?auto_656710 ) ) ( not ( = ?auto_656707 ?auto_656711 ) ) ( not ( = ?auto_656707 ?auto_656712 ) ) ( not ( = ?auto_656708 ?auto_656709 ) ) ( not ( = ?auto_656708 ?auto_656710 ) ) ( not ( = ?auto_656708 ?auto_656711 ) ) ( not ( = ?auto_656708 ?auto_656712 ) ) ( not ( = ?auto_656709 ?auto_656710 ) ) ( not ( = ?auto_656709 ?auto_656711 ) ) ( not ( = ?auto_656709 ?auto_656712 ) ) ( not ( = ?auto_656710 ?auto_656711 ) ) ( not ( = ?auto_656710 ?auto_656712 ) ) ( not ( = ?auto_656711 ?auto_656712 ) ) ( ON ?auto_656711 ?auto_656712 ) ( ON ?auto_656710 ?auto_656711 ) ( ON ?auto_656709 ?auto_656710 ) ( CLEAR ?auto_656707 ) ( ON ?auto_656708 ?auto_656709 ) ( CLEAR ?auto_656708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_656696 ?auto_656697 ?auto_656698 ?auto_656699 ?auto_656700 ?auto_656701 ?auto_656702 ?auto_656703 ?auto_656704 ?auto_656705 ?auto_656706 ?auto_656707 ?auto_656708 )
      ( MAKE-17PILE ?auto_656696 ?auto_656697 ?auto_656698 ?auto_656699 ?auto_656700 ?auto_656701 ?auto_656702 ?auto_656703 ?auto_656704 ?auto_656705 ?auto_656706 ?auto_656707 ?auto_656708 ?auto_656709 ?auto_656710 ?auto_656711 ?auto_656712 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_656730 - BLOCK
      ?auto_656731 - BLOCK
      ?auto_656732 - BLOCK
      ?auto_656733 - BLOCK
      ?auto_656734 - BLOCK
      ?auto_656735 - BLOCK
      ?auto_656736 - BLOCK
      ?auto_656737 - BLOCK
      ?auto_656738 - BLOCK
      ?auto_656739 - BLOCK
      ?auto_656740 - BLOCK
      ?auto_656741 - BLOCK
      ?auto_656742 - BLOCK
      ?auto_656743 - BLOCK
      ?auto_656744 - BLOCK
      ?auto_656745 - BLOCK
      ?auto_656746 - BLOCK
    )
    :vars
    (
      ?auto_656747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_656746 ?auto_656747 ) ( ON-TABLE ?auto_656730 ) ( ON ?auto_656731 ?auto_656730 ) ( ON ?auto_656732 ?auto_656731 ) ( ON ?auto_656733 ?auto_656732 ) ( ON ?auto_656734 ?auto_656733 ) ( ON ?auto_656735 ?auto_656734 ) ( ON ?auto_656736 ?auto_656735 ) ( ON ?auto_656737 ?auto_656736 ) ( ON ?auto_656738 ?auto_656737 ) ( ON ?auto_656739 ?auto_656738 ) ( ON ?auto_656740 ?auto_656739 ) ( not ( = ?auto_656730 ?auto_656731 ) ) ( not ( = ?auto_656730 ?auto_656732 ) ) ( not ( = ?auto_656730 ?auto_656733 ) ) ( not ( = ?auto_656730 ?auto_656734 ) ) ( not ( = ?auto_656730 ?auto_656735 ) ) ( not ( = ?auto_656730 ?auto_656736 ) ) ( not ( = ?auto_656730 ?auto_656737 ) ) ( not ( = ?auto_656730 ?auto_656738 ) ) ( not ( = ?auto_656730 ?auto_656739 ) ) ( not ( = ?auto_656730 ?auto_656740 ) ) ( not ( = ?auto_656730 ?auto_656741 ) ) ( not ( = ?auto_656730 ?auto_656742 ) ) ( not ( = ?auto_656730 ?auto_656743 ) ) ( not ( = ?auto_656730 ?auto_656744 ) ) ( not ( = ?auto_656730 ?auto_656745 ) ) ( not ( = ?auto_656730 ?auto_656746 ) ) ( not ( = ?auto_656730 ?auto_656747 ) ) ( not ( = ?auto_656731 ?auto_656732 ) ) ( not ( = ?auto_656731 ?auto_656733 ) ) ( not ( = ?auto_656731 ?auto_656734 ) ) ( not ( = ?auto_656731 ?auto_656735 ) ) ( not ( = ?auto_656731 ?auto_656736 ) ) ( not ( = ?auto_656731 ?auto_656737 ) ) ( not ( = ?auto_656731 ?auto_656738 ) ) ( not ( = ?auto_656731 ?auto_656739 ) ) ( not ( = ?auto_656731 ?auto_656740 ) ) ( not ( = ?auto_656731 ?auto_656741 ) ) ( not ( = ?auto_656731 ?auto_656742 ) ) ( not ( = ?auto_656731 ?auto_656743 ) ) ( not ( = ?auto_656731 ?auto_656744 ) ) ( not ( = ?auto_656731 ?auto_656745 ) ) ( not ( = ?auto_656731 ?auto_656746 ) ) ( not ( = ?auto_656731 ?auto_656747 ) ) ( not ( = ?auto_656732 ?auto_656733 ) ) ( not ( = ?auto_656732 ?auto_656734 ) ) ( not ( = ?auto_656732 ?auto_656735 ) ) ( not ( = ?auto_656732 ?auto_656736 ) ) ( not ( = ?auto_656732 ?auto_656737 ) ) ( not ( = ?auto_656732 ?auto_656738 ) ) ( not ( = ?auto_656732 ?auto_656739 ) ) ( not ( = ?auto_656732 ?auto_656740 ) ) ( not ( = ?auto_656732 ?auto_656741 ) ) ( not ( = ?auto_656732 ?auto_656742 ) ) ( not ( = ?auto_656732 ?auto_656743 ) ) ( not ( = ?auto_656732 ?auto_656744 ) ) ( not ( = ?auto_656732 ?auto_656745 ) ) ( not ( = ?auto_656732 ?auto_656746 ) ) ( not ( = ?auto_656732 ?auto_656747 ) ) ( not ( = ?auto_656733 ?auto_656734 ) ) ( not ( = ?auto_656733 ?auto_656735 ) ) ( not ( = ?auto_656733 ?auto_656736 ) ) ( not ( = ?auto_656733 ?auto_656737 ) ) ( not ( = ?auto_656733 ?auto_656738 ) ) ( not ( = ?auto_656733 ?auto_656739 ) ) ( not ( = ?auto_656733 ?auto_656740 ) ) ( not ( = ?auto_656733 ?auto_656741 ) ) ( not ( = ?auto_656733 ?auto_656742 ) ) ( not ( = ?auto_656733 ?auto_656743 ) ) ( not ( = ?auto_656733 ?auto_656744 ) ) ( not ( = ?auto_656733 ?auto_656745 ) ) ( not ( = ?auto_656733 ?auto_656746 ) ) ( not ( = ?auto_656733 ?auto_656747 ) ) ( not ( = ?auto_656734 ?auto_656735 ) ) ( not ( = ?auto_656734 ?auto_656736 ) ) ( not ( = ?auto_656734 ?auto_656737 ) ) ( not ( = ?auto_656734 ?auto_656738 ) ) ( not ( = ?auto_656734 ?auto_656739 ) ) ( not ( = ?auto_656734 ?auto_656740 ) ) ( not ( = ?auto_656734 ?auto_656741 ) ) ( not ( = ?auto_656734 ?auto_656742 ) ) ( not ( = ?auto_656734 ?auto_656743 ) ) ( not ( = ?auto_656734 ?auto_656744 ) ) ( not ( = ?auto_656734 ?auto_656745 ) ) ( not ( = ?auto_656734 ?auto_656746 ) ) ( not ( = ?auto_656734 ?auto_656747 ) ) ( not ( = ?auto_656735 ?auto_656736 ) ) ( not ( = ?auto_656735 ?auto_656737 ) ) ( not ( = ?auto_656735 ?auto_656738 ) ) ( not ( = ?auto_656735 ?auto_656739 ) ) ( not ( = ?auto_656735 ?auto_656740 ) ) ( not ( = ?auto_656735 ?auto_656741 ) ) ( not ( = ?auto_656735 ?auto_656742 ) ) ( not ( = ?auto_656735 ?auto_656743 ) ) ( not ( = ?auto_656735 ?auto_656744 ) ) ( not ( = ?auto_656735 ?auto_656745 ) ) ( not ( = ?auto_656735 ?auto_656746 ) ) ( not ( = ?auto_656735 ?auto_656747 ) ) ( not ( = ?auto_656736 ?auto_656737 ) ) ( not ( = ?auto_656736 ?auto_656738 ) ) ( not ( = ?auto_656736 ?auto_656739 ) ) ( not ( = ?auto_656736 ?auto_656740 ) ) ( not ( = ?auto_656736 ?auto_656741 ) ) ( not ( = ?auto_656736 ?auto_656742 ) ) ( not ( = ?auto_656736 ?auto_656743 ) ) ( not ( = ?auto_656736 ?auto_656744 ) ) ( not ( = ?auto_656736 ?auto_656745 ) ) ( not ( = ?auto_656736 ?auto_656746 ) ) ( not ( = ?auto_656736 ?auto_656747 ) ) ( not ( = ?auto_656737 ?auto_656738 ) ) ( not ( = ?auto_656737 ?auto_656739 ) ) ( not ( = ?auto_656737 ?auto_656740 ) ) ( not ( = ?auto_656737 ?auto_656741 ) ) ( not ( = ?auto_656737 ?auto_656742 ) ) ( not ( = ?auto_656737 ?auto_656743 ) ) ( not ( = ?auto_656737 ?auto_656744 ) ) ( not ( = ?auto_656737 ?auto_656745 ) ) ( not ( = ?auto_656737 ?auto_656746 ) ) ( not ( = ?auto_656737 ?auto_656747 ) ) ( not ( = ?auto_656738 ?auto_656739 ) ) ( not ( = ?auto_656738 ?auto_656740 ) ) ( not ( = ?auto_656738 ?auto_656741 ) ) ( not ( = ?auto_656738 ?auto_656742 ) ) ( not ( = ?auto_656738 ?auto_656743 ) ) ( not ( = ?auto_656738 ?auto_656744 ) ) ( not ( = ?auto_656738 ?auto_656745 ) ) ( not ( = ?auto_656738 ?auto_656746 ) ) ( not ( = ?auto_656738 ?auto_656747 ) ) ( not ( = ?auto_656739 ?auto_656740 ) ) ( not ( = ?auto_656739 ?auto_656741 ) ) ( not ( = ?auto_656739 ?auto_656742 ) ) ( not ( = ?auto_656739 ?auto_656743 ) ) ( not ( = ?auto_656739 ?auto_656744 ) ) ( not ( = ?auto_656739 ?auto_656745 ) ) ( not ( = ?auto_656739 ?auto_656746 ) ) ( not ( = ?auto_656739 ?auto_656747 ) ) ( not ( = ?auto_656740 ?auto_656741 ) ) ( not ( = ?auto_656740 ?auto_656742 ) ) ( not ( = ?auto_656740 ?auto_656743 ) ) ( not ( = ?auto_656740 ?auto_656744 ) ) ( not ( = ?auto_656740 ?auto_656745 ) ) ( not ( = ?auto_656740 ?auto_656746 ) ) ( not ( = ?auto_656740 ?auto_656747 ) ) ( not ( = ?auto_656741 ?auto_656742 ) ) ( not ( = ?auto_656741 ?auto_656743 ) ) ( not ( = ?auto_656741 ?auto_656744 ) ) ( not ( = ?auto_656741 ?auto_656745 ) ) ( not ( = ?auto_656741 ?auto_656746 ) ) ( not ( = ?auto_656741 ?auto_656747 ) ) ( not ( = ?auto_656742 ?auto_656743 ) ) ( not ( = ?auto_656742 ?auto_656744 ) ) ( not ( = ?auto_656742 ?auto_656745 ) ) ( not ( = ?auto_656742 ?auto_656746 ) ) ( not ( = ?auto_656742 ?auto_656747 ) ) ( not ( = ?auto_656743 ?auto_656744 ) ) ( not ( = ?auto_656743 ?auto_656745 ) ) ( not ( = ?auto_656743 ?auto_656746 ) ) ( not ( = ?auto_656743 ?auto_656747 ) ) ( not ( = ?auto_656744 ?auto_656745 ) ) ( not ( = ?auto_656744 ?auto_656746 ) ) ( not ( = ?auto_656744 ?auto_656747 ) ) ( not ( = ?auto_656745 ?auto_656746 ) ) ( not ( = ?auto_656745 ?auto_656747 ) ) ( not ( = ?auto_656746 ?auto_656747 ) ) ( ON ?auto_656745 ?auto_656746 ) ( ON ?auto_656744 ?auto_656745 ) ( ON ?auto_656743 ?auto_656744 ) ( ON ?auto_656742 ?auto_656743 ) ( CLEAR ?auto_656740 ) ( ON ?auto_656741 ?auto_656742 ) ( CLEAR ?auto_656741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_656730 ?auto_656731 ?auto_656732 ?auto_656733 ?auto_656734 ?auto_656735 ?auto_656736 ?auto_656737 ?auto_656738 ?auto_656739 ?auto_656740 ?auto_656741 )
      ( MAKE-17PILE ?auto_656730 ?auto_656731 ?auto_656732 ?auto_656733 ?auto_656734 ?auto_656735 ?auto_656736 ?auto_656737 ?auto_656738 ?auto_656739 ?auto_656740 ?auto_656741 ?auto_656742 ?auto_656743 ?auto_656744 ?auto_656745 ?auto_656746 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_656765 - BLOCK
      ?auto_656766 - BLOCK
      ?auto_656767 - BLOCK
      ?auto_656768 - BLOCK
      ?auto_656769 - BLOCK
      ?auto_656770 - BLOCK
      ?auto_656771 - BLOCK
      ?auto_656772 - BLOCK
      ?auto_656773 - BLOCK
      ?auto_656774 - BLOCK
      ?auto_656775 - BLOCK
      ?auto_656776 - BLOCK
      ?auto_656777 - BLOCK
      ?auto_656778 - BLOCK
      ?auto_656779 - BLOCK
      ?auto_656780 - BLOCK
      ?auto_656781 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_656781 ) ( ON-TABLE ?auto_656765 ) ( ON ?auto_656766 ?auto_656765 ) ( ON ?auto_656767 ?auto_656766 ) ( ON ?auto_656768 ?auto_656767 ) ( ON ?auto_656769 ?auto_656768 ) ( ON ?auto_656770 ?auto_656769 ) ( ON ?auto_656771 ?auto_656770 ) ( ON ?auto_656772 ?auto_656771 ) ( ON ?auto_656773 ?auto_656772 ) ( ON ?auto_656774 ?auto_656773 ) ( ON ?auto_656775 ?auto_656774 ) ( not ( = ?auto_656765 ?auto_656766 ) ) ( not ( = ?auto_656765 ?auto_656767 ) ) ( not ( = ?auto_656765 ?auto_656768 ) ) ( not ( = ?auto_656765 ?auto_656769 ) ) ( not ( = ?auto_656765 ?auto_656770 ) ) ( not ( = ?auto_656765 ?auto_656771 ) ) ( not ( = ?auto_656765 ?auto_656772 ) ) ( not ( = ?auto_656765 ?auto_656773 ) ) ( not ( = ?auto_656765 ?auto_656774 ) ) ( not ( = ?auto_656765 ?auto_656775 ) ) ( not ( = ?auto_656765 ?auto_656776 ) ) ( not ( = ?auto_656765 ?auto_656777 ) ) ( not ( = ?auto_656765 ?auto_656778 ) ) ( not ( = ?auto_656765 ?auto_656779 ) ) ( not ( = ?auto_656765 ?auto_656780 ) ) ( not ( = ?auto_656765 ?auto_656781 ) ) ( not ( = ?auto_656766 ?auto_656767 ) ) ( not ( = ?auto_656766 ?auto_656768 ) ) ( not ( = ?auto_656766 ?auto_656769 ) ) ( not ( = ?auto_656766 ?auto_656770 ) ) ( not ( = ?auto_656766 ?auto_656771 ) ) ( not ( = ?auto_656766 ?auto_656772 ) ) ( not ( = ?auto_656766 ?auto_656773 ) ) ( not ( = ?auto_656766 ?auto_656774 ) ) ( not ( = ?auto_656766 ?auto_656775 ) ) ( not ( = ?auto_656766 ?auto_656776 ) ) ( not ( = ?auto_656766 ?auto_656777 ) ) ( not ( = ?auto_656766 ?auto_656778 ) ) ( not ( = ?auto_656766 ?auto_656779 ) ) ( not ( = ?auto_656766 ?auto_656780 ) ) ( not ( = ?auto_656766 ?auto_656781 ) ) ( not ( = ?auto_656767 ?auto_656768 ) ) ( not ( = ?auto_656767 ?auto_656769 ) ) ( not ( = ?auto_656767 ?auto_656770 ) ) ( not ( = ?auto_656767 ?auto_656771 ) ) ( not ( = ?auto_656767 ?auto_656772 ) ) ( not ( = ?auto_656767 ?auto_656773 ) ) ( not ( = ?auto_656767 ?auto_656774 ) ) ( not ( = ?auto_656767 ?auto_656775 ) ) ( not ( = ?auto_656767 ?auto_656776 ) ) ( not ( = ?auto_656767 ?auto_656777 ) ) ( not ( = ?auto_656767 ?auto_656778 ) ) ( not ( = ?auto_656767 ?auto_656779 ) ) ( not ( = ?auto_656767 ?auto_656780 ) ) ( not ( = ?auto_656767 ?auto_656781 ) ) ( not ( = ?auto_656768 ?auto_656769 ) ) ( not ( = ?auto_656768 ?auto_656770 ) ) ( not ( = ?auto_656768 ?auto_656771 ) ) ( not ( = ?auto_656768 ?auto_656772 ) ) ( not ( = ?auto_656768 ?auto_656773 ) ) ( not ( = ?auto_656768 ?auto_656774 ) ) ( not ( = ?auto_656768 ?auto_656775 ) ) ( not ( = ?auto_656768 ?auto_656776 ) ) ( not ( = ?auto_656768 ?auto_656777 ) ) ( not ( = ?auto_656768 ?auto_656778 ) ) ( not ( = ?auto_656768 ?auto_656779 ) ) ( not ( = ?auto_656768 ?auto_656780 ) ) ( not ( = ?auto_656768 ?auto_656781 ) ) ( not ( = ?auto_656769 ?auto_656770 ) ) ( not ( = ?auto_656769 ?auto_656771 ) ) ( not ( = ?auto_656769 ?auto_656772 ) ) ( not ( = ?auto_656769 ?auto_656773 ) ) ( not ( = ?auto_656769 ?auto_656774 ) ) ( not ( = ?auto_656769 ?auto_656775 ) ) ( not ( = ?auto_656769 ?auto_656776 ) ) ( not ( = ?auto_656769 ?auto_656777 ) ) ( not ( = ?auto_656769 ?auto_656778 ) ) ( not ( = ?auto_656769 ?auto_656779 ) ) ( not ( = ?auto_656769 ?auto_656780 ) ) ( not ( = ?auto_656769 ?auto_656781 ) ) ( not ( = ?auto_656770 ?auto_656771 ) ) ( not ( = ?auto_656770 ?auto_656772 ) ) ( not ( = ?auto_656770 ?auto_656773 ) ) ( not ( = ?auto_656770 ?auto_656774 ) ) ( not ( = ?auto_656770 ?auto_656775 ) ) ( not ( = ?auto_656770 ?auto_656776 ) ) ( not ( = ?auto_656770 ?auto_656777 ) ) ( not ( = ?auto_656770 ?auto_656778 ) ) ( not ( = ?auto_656770 ?auto_656779 ) ) ( not ( = ?auto_656770 ?auto_656780 ) ) ( not ( = ?auto_656770 ?auto_656781 ) ) ( not ( = ?auto_656771 ?auto_656772 ) ) ( not ( = ?auto_656771 ?auto_656773 ) ) ( not ( = ?auto_656771 ?auto_656774 ) ) ( not ( = ?auto_656771 ?auto_656775 ) ) ( not ( = ?auto_656771 ?auto_656776 ) ) ( not ( = ?auto_656771 ?auto_656777 ) ) ( not ( = ?auto_656771 ?auto_656778 ) ) ( not ( = ?auto_656771 ?auto_656779 ) ) ( not ( = ?auto_656771 ?auto_656780 ) ) ( not ( = ?auto_656771 ?auto_656781 ) ) ( not ( = ?auto_656772 ?auto_656773 ) ) ( not ( = ?auto_656772 ?auto_656774 ) ) ( not ( = ?auto_656772 ?auto_656775 ) ) ( not ( = ?auto_656772 ?auto_656776 ) ) ( not ( = ?auto_656772 ?auto_656777 ) ) ( not ( = ?auto_656772 ?auto_656778 ) ) ( not ( = ?auto_656772 ?auto_656779 ) ) ( not ( = ?auto_656772 ?auto_656780 ) ) ( not ( = ?auto_656772 ?auto_656781 ) ) ( not ( = ?auto_656773 ?auto_656774 ) ) ( not ( = ?auto_656773 ?auto_656775 ) ) ( not ( = ?auto_656773 ?auto_656776 ) ) ( not ( = ?auto_656773 ?auto_656777 ) ) ( not ( = ?auto_656773 ?auto_656778 ) ) ( not ( = ?auto_656773 ?auto_656779 ) ) ( not ( = ?auto_656773 ?auto_656780 ) ) ( not ( = ?auto_656773 ?auto_656781 ) ) ( not ( = ?auto_656774 ?auto_656775 ) ) ( not ( = ?auto_656774 ?auto_656776 ) ) ( not ( = ?auto_656774 ?auto_656777 ) ) ( not ( = ?auto_656774 ?auto_656778 ) ) ( not ( = ?auto_656774 ?auto_656779 ) ) ( not ( = ?auto_656774 ?auto_656780 ) ) ( not ( = ?auto_656774 ?auto_656781 ) ) ( not ( = ?auto_656775 ?auto_656776 ) ) ( not ( = ?auto_656775 ?auto_656777 ) ) ( not ( = ?auto_656775 ?auto_656778 ) ) ( not ( = ?auto_656775 ?auto_656779 ) ) ( not ( = ?auto_656775 ?auto_656780 ) ) ( not ( = ?auto_656775 ?auto_656781 ) ) ( not ( = ?auto_656776 ?auto_656777 ) ) ( not ( = ?auto_656776 ?auto_656778 ) ) ( not ( = ?auto_656776 ?auto_656779 ) ) ( not ( = ?auto_656776 ?auto_656780 ) ) ( not ( = ?auto_656776 ?auto_656781 ) ) ( not ( = ?auto_656777 ?auto_656778 ) ) ( not ( = ?auto_656777 ?auto_656779 ) ) ( not ( = ?auto_656777 ?auto_656780 ) ) ( not ( = ?auto_656777 ?auto_656781 ) ) ( not ( = ?auto_656778 ?auto_656779 ) ) ( not ( = ?auto_656778 ?auto_656780 ) ) ( not ( = ?auto_656778 ?auto_656781 ) ) ( not ( = ?auto_656779 ?auto_656780 ) ) ( not ( = ?auto_656779 ?auto_656781 ) ) ( not ( = ?auto_656780 ?auto_656781 ) ) ( ON ?auto_656780 ?auto_656781 ) ( ON ?auto_656779 ?auto_656780 ) ( ON ?auto_656778 ?auto_656779 ) ( ON ?auto_656777 ?auto_656778 ) ( CLEAR ?auto_656775 ) ( ON ?auto_656776 ?auto_656777 ) ( CLEAR ?auto_656776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_656765 ?auto_656766 ?auto_656767 ?auto_656768 ?auto_656769 ?auto_656770 ?auto_656771 ?auto_656772 ?auto_656773 ?auto_656774 ?auto_656775 ?auto_656776 )
      ( MAKE-17PILE ?auto_656765 ?auto_656766 ?auto_656767 ?auto_656768 ?auto_656769 ?auto_656770 ?auto_656771 ?auto_656772 ?auto_656773 ?auto_656774 ?auto_656775 ?auto_656776 ?auto_656777 ?auto_656778 ?auto_656779 ?auto_656780 ?auto_656781 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_656799 - BLOCK
      ?auto_656800 - BLOCK
      ?auto_656801 - BLOCK
      ?auto_656802 - BLOCK
      ?auto_656803 - BLOCK
      ?auto_656804 - BLOCK
      ?auto_656805 - BLOCK
      ?auto_656806 - BLOCK
      ?auto_656807 - BLOCK
      ?auto_656808 - BLOCK
      ?auto_656809 - BLOCK
      ?auto_656810 - BLOCK
      ?auto_656811 - BLOCK
      ?auto_656812 - BLOCK
      ?auto_656813 - BLOCK
      ?auto_656814 - BLOCK
      ?auto_656815 - BLOCK
    )
    :vars
    (
      ?auto_656816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_656815 ?auto_656816 ) ( ON-TABLE ?auto_656799 ) ( ON ?auto_656800 ?auto_656799 ) ( ON ?auto_656801 ?auto_656800 ) ( ON ?auto_656802 ?auto_656801 ) ( ON ?auto_656803 ?auto_656802 ) ( ON ?auto_656804 ?auto_656803 ) ( ON ?auto_656805 ?auto_656804 ) ( ON ?auto_656806 ?auto_656805 ) ( ON ?auto_656807 ?auto_656806 ) ( ON ?auto_656808 ?auto_656807 ) ( not ( = ?auto_656799 ?auto_656800 ) ) ( not ( = ?auto_656799 ?auto_656801 ) ) ( not ( = ?auto_656799 ?auto_656802 ) ) ( not ( = ?auto_656799 ?auto_656803 ) ) ( not ( = ?auto_656799 ?auto_656804 ) ) ( not ( = ?auto_656799 ?auto_656805 ) ) ( not ( = ?auto_656799 ?auto_656806 ) ) ( not ( = ?auto_656799 ?auto_656807 ) ) ( not ( = ?auto_656799 ?auto_656808 ) ) ( not ( = ?auto_656799 ?auto_656809 ) ) ( not ( = ?auto_656799 ?auto_656810 ) ) ( not ( = ?auto_656799 ?auto_656811 ) ) ( not ( = ?auto_656799 ?auto_656812 ) ) ( not ( = ?auto_656799 ?auto_656813 ) ) ( not ( = ?auto_656799 ?auto_656814 ) ) ( not ( = ?auto_656799 ?auto_656815 ) ) ( not ( = ?auto_656799 ?auto_656816 ) ) ( not ( = ?auto_656800 ?auto_656801 ) ) ( not ( = ?auto_656800 ?auto_656802 ) ) ( not ( = ?auto_656800 ?auto_656803 ) ) ( not ( = ?auto_656800 ?auto_656804 ) ) ( not ( = ?auto_656800 ?auto_656805 ) ) ( not ( = ?auto_656800 ?auto_656806 ) ) ( not ( = ?auto_656800 ?auto_656807 ) ) ( not ( = ?auto_656800 ?auto_656808 ) ) ( not ( = ?auto_656800 ?auto_656809 ) ) ( not ( = ?auto_656800 ?auto_656810 ) ) ( not ( = ?auto_656800 ?auto_656811 ) ) ( not ( = ?auto_656800 ?auto_656812 ) ) ( not ( = ?auto_656800 ?auto_656813 ) ) ( not ( = ?auto_656800 ?auto_656814 ) ) ( not ( = ?auto_656800 ?auto_656815 ) ) ( not ( = ?auto_656800 ?auto_656816 ) ) ( not ( = ?auto_656801 ?auto_656802 ) ) ( not ( = ?auto_656801 ?auto_656803 ) ) ( not ( = ?auto_656801 ?auto_656804 ) ) ( not ( = ?auto_656801 ?auto_656805 ) ) ( not ( = ?auto_656801 ?auto_656806 ) ) ( not ( = ?auto_656801 ?auto_656807 ) ) ( not ( = ?auto_656801 ?auto_656808 ) ) ( not ( = ?auto_656801 ?auto_656809 ) ) ( not ( = ?auto_656801 ?auto_656810 ) ) ( not ( = ?auto_656801 ?auto_656811 ) ) ( not ( = ?auto_656801 ?auto_656812 ) ) ( not ( = ?auto_656801 ?auto_656813 ) ) ( not ( = ?auto_656801 ?auto_656814 ) ) ( not ( = ?auto_656801 ?auto_656815 ) ) ( not ( = ?auto_656801 ?auto_656816 ) ) ( not ( = ?auto_656802 ?auto_656803 ) ) ( not ( = ?auto_656802 ?auto_656804 ) ) ( not ( = ?auto_656802 ?auto_656805 ) ) ( not ( = ?auto_656802 ?auto_656806 ) ) ( not ( = ?auto_656802 ?auto_656807 ) ) ( not ( = ?auto_656802 ?auto_656808 ) ) ( not ( = ?auto_656802 ?auto_656809 ) ) ( not ( = ?auto_656802 ?auto_656810 ) ) ( not ( = ?auto_656802 ?auto_656811 ) ) ( not ( = ?auto_656802 ?auto_656812 ) ) ( not ( = ?auto_656802 ?auto_656813 ) ) ( not ( = ?auto_656802 ?auto_656814 ) ) ( not ( = ?auto_656802 ?auto_656815 ) ) ( not ( = ?auto_656802 ?auto_656816 ) ) ( not ( = ?auto_656803 ?auto_656804 ) ) ( not ( = ?auto_656803 ?auto_656805 ) ) ( not ( = ?auto_656803 ?auto_656806 ) ) ( not ( = ?auto_656803 ?auto_656807 ) ) ( not ( = ?auto_656803 ?auto_656808 ) ) ( not ( = ?auto_656803 ?auto_656809 ) ) ( not ( = ?auto_656803 ?auto_656810 ) ) ( not ( = ?auto_656803 ?auto_656811 ) ) ( not ( = ?auto_656803 ?auto_656812 ) ) ( not ( = ?auto_656803 ?auto_656813 ) ) ( not ( = ?auto_656803 ?auto_656814 ) ) ( not ( = ?auto_656803 ?auto_656815 ) ) ( not ( = ?auto_656803 ?auto_656816 ) ) ( not ( = ?auto_656804 ?auto_656805 ) ) ( not ( = ?auto_656804 ?auto_656806 ) ) ( not ( = ?auto_656804 ?auto_656807 ) ) ( not ( = ?auto_656804 ?auto_656808 ) ) ( not ( = ?auto_656804 ?auto_656809 ) ) ( not ( = ?auto_656804 ?auto_656810 ) ) ( not ( = ?auto_656804 ?auto_656811 ) ) ( not ( = ?auto_656804 ?auto_656812 ) ) ( not ( = ?auto_656804 ?auto_656813 ) ) ( not ( = ?auto_656804 ?auto_656814 ) ) ( not ( = ?auto_656804 ?auto_656815 ) ) ( not ( = ?auto_656804 ?auto_656816 ) ) ( not ( = ?auto_656805 ?auto_656806 ) ) ( not ( = ?auto_656805 ?auto_656807 ) ) ( not ( = ?auto_656805 ?auto_656808 ) ) ( not ( = ?auto_656805 ?auto_656809 ) ) ( not ( = ?auto_656805 ?auto_656810 ) ) ( not ( = ?auto_656805 ?auto_656811 ) ) ( not ( = ?auto_656805 ?auto_656812 ) ) ( not ( = ?auto_656805 ?auto_656813 ) ) ( not ( = ?auto_656805 ?auto_656814 ) ) ( not ( = ?auto_656805 ?auto_656815 ) ) ( not ( = ?auto_656805 ?auto_656816 ) ) ( not ( = ?auto_656806 ?auto_656807 ) ) ( not ( = ?auto_656806 ?auto_656808 ) ) ( not ( = ?auto_656806 ?auto_656809 ) ) ( not ( = ?auto_656806 ?auto_656810 ) ) ( not ( = ?auto_656806 ?auto_656811 ) ) ( not ( = ?auto_656806 ?auto_656812 ) ) ( not ( = ?auto_656806 ?auto_656813 ) ) ( not ( = ?auto_656806 ?auto_656814 ) ) ( not ( = ?auto_656806 ?auto_656815 ) ) ( not ( = ?auto_656806 ?auto_656816 ) ) ( not ( = ?auto_656807 ?auto_656808 ) ) ( not ( = ?auto_656807 ?auto_656809 ) ) ( not ( = ?auto_656807 ?auto_656810 ) ) ( not ( = ?auto_656807 ?auto_656811 ) ) ( not ( = ?auto_656807 ?auto_656812 ) ) ( not ( = ?auto_656807 ?auto_656813 ) ) ( not ( = ?auto_656807 ?auto_656814 ) ) ( not ( = ?auto_656807 ?auto_656815 ) ) ( not ( = ?auto_656807 ?auto_656816 ) ) ( not ( = ?auto_656808 ?auto_656809 ) ) ( not ( = ?auto_656808 ?auto_656810 ) ) ( not ( = ?auto_656808 ?auto_656811 ) ) ( not ( = ?auto_656808 ?auto_656812 ) ) ( not ( = ?auto_656808 ?auto_656813 ) ) ( not ( = ?auto_656808 ?auto_656814 ) ) ( not ( = ?auto_656808 ?auto_656815 ) ) ( not ( = ?auto_656808 ?auto_656816 ) ) ( not ( = ?auto_656809 ?auto_656810 ) ) ( not ( = ?auto_656809 ?auto_656811 ) ) ( not ( = ?auto_656809 ?auto_656812 ) ) ( not ( = ?auto_656809 ?auto_656813 ) ) ( not ( = ?auto_656809 ?auto_656814 ) ) ( not ( = ?auto_656809 ?auto_656815 ) ) ( not ( = ?auto_656809 ?auto_656816 ) ) ( not ( = ?auto_656810 ?auto_656811 ) ) ( not ( = ?auto_656810 ?auto_656812 ) ) ( not ( = ?auto_656810 ?auto_656813 ) ) ( not ( = ?auto_656810 ?auto_656814 ) ) ( not ( = ?auto_656810 ?auto_656815 ) ) ( not ( = ?auto_656810 ?auto_656816 ) ) ( not ( = ?auto_656811 ?auto_656812 ) ) ( not ( = ?auto_656811 ?auto_656813 ) ) ( not ( = ?auto_656811 ?auto_656814 ) ) ( not ( = ?auto_656811 ?auto_656815 ) ) ( not ( = ?auto_656811 ?auto_656816 ) ) ( not ( = ?auto_656812 ?auto_656813 ) ) ( not ( = ?auto_656812 ?auto_656814 ) ) ( not ( = ?auto_656812 ?auto_656815 ) ) ( not ( = ?auto_656812 ?auto_656816 ) ) ( not ( = ?auto_656813 ?auto_656814 ) ) ( not ( = ?auto_656813 ?auto_656815 ) ) ( not ( = ?auto_656813 ?auto_656816 ) ) ( not ( = ?auto_656814 ?auto_656815 ) ) ( not ( = ?auto_656814 ?auto_656816 ) ) ( not ( = ?auto_656815 ?auto_656816 ) ) ( ON ?auto_656814 ?auto_656815 ) ( ON ?auto_656813 ?auto_656814 ) ( ON ?auto_656812 ?auto_656813 ) ( ON ?auto_656811 ?auto_656812 ) ( ON ?auto_656810 ?auto_656811 ) ( CLEAR ?auto_656808 ) ( ON ?auto_656809 ?auto_656810 ) ( CLEAR ?auto_656809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_656799 ?auto_656800 ?auto_656801 ?auto_656802 ?auto_656803 ?auto_656804 ?auto_656805 ?auto_656806 ?auto_656807 ?auto_656808 ?auto_656809 )
      ( MAKE-17PILE ?auto_656799 ?auto_656800 ?auto_656801 ?auto_656802 ?auto_656803 ?auto_656804 ?auto_656805 ?auto_656806 ?auto_656807 ?auto_656808 ?auto_656809 ?auto_656810 ?auto_656811 ?auto_656812 ?auto_656813 ?auto_656814 ?auto_656815 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_656834 - BLOCK
      ?auto_656835 - BLOCK
      ?auto_656836 - BLOCK
      ?auto_656837 - BLOCK
      ?auto_656838 - BLOCK
      ?auto_656839 - BLOCK
      ?auto_656840 - BLOCK
      ?auto_656841 - BLOCK
      ?auto_656842 - BLOCK
      ?auto_656843 - BLOCK
      ?auto_656844 - BLOCK
      ?auto_656845 - BLOCK
      ?auto_656846 - BLOCK
      ?auto_656847 - BLOCK
      ?auto_656848 - BLOCK
      ?auto_656849 - BLOCK
      ?auto_656850 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_656850 ) ( ON-TABLE ?auto_656834 ) ( ON ?auto_656835 ?auto_656834 ) ( ON ?auto_656836 ?auto_656835 ) ( ON ?auto_656837 ?auto_656836 ) ( ON ?auto_656838 ?auto_656837 ) ( ON ?auto_656839 ?auto_656838 ) ( ON ?auto_656840 ?auto_656839 ) ( ON ?auto_656841 ?auto_656840 ) ( ON ?auto_656842 ?auto_656841 ) ( ON ?auto_656843 ?auto_656842 ) ( not ( = ?auto_656834 ?auto_656835 ) ) ( not ( = ?auto_656834 ?auto_656836 ) ) ( not ( = ?auto_656834 ?auto_656837 ) ) ( not ( = ?auto_656834 ?auto_656838 ) ) ( not ( = ?auto_656834 ?auto_656839 ) ) ( not ( = ?auto_656834 ?auto_656840 ) ) ( not ( = ?auto_656834 ?auto_656841 ) ) ( not ( = ?auto_656834 ?auto_656842 ) ) ( not ( = ?auto_656834 ?auto_656843 ) ) ( not ( = ?auto_656834 ?auto_656844 ) ) ( not ( = ?auto_656834 ?auto_656845 ) ) ( not ( = ?auto_656834 ?auto_656846 ) ) ( not ( = ?auto_656834 ?auto_656847 ) ) ( not ( = ?auto_656834 ?auto_656848 ) ) ( not ( = ?auto_656834 ?auto_656849 ) ) ( not ( = ?auto_656834 ?auto_656850 ) ) ( not ( = ?auto_656835 ?auto_656836 ) ) ( not ( = ?auto_656835 ?auto_656837 ) ) ( not ( = ?auto_656835 ?auto_656838 ) ) ( not ( = ?auto_656835 ?auto_656839 ) ) ( not ( = ?auto_656835 ?auto_656840 ) ) ( not ( = ?auto_656835 ?auto_656841 ) ) ( not ( = ?auto_656835 ?auto_656842 ) ) ( not ( = ?auto_656835 ?auto_656843 ) ) ( not ( = ?auto_656835 ?auto_656844 ) ) ( not ( = ?auto_656835 ?auto_656845 ) ) ( not ( = ?auto_656835 ?auto_656846 ) ) ( not ( = ?auto_656835 ?auto_656847 ) ) ( not ( = ?auto_656835 ?auto_656848 ) ) ( not ( = ?auto_656835 ?auto_656849 ) ) ( not ( = ?auto_656835 ?auto_656850 ) ) ( not ( = ?auto_656836 ?auto_656837 ) ) ( not ( = ?auto_656836 ?auto_656838 ) ) ( not ( = ?auto_656836 ?auto_656839 ) ) ( not ( = ?auto_656836 ?auto_656840 ) ) ( not ( = ?auto_656836 ?auto_656841 ) ) ( not ( = ?auto_656836 ?auto_656842 ) ) ( not ( = ?auto_656836 ?auto_656843 ) ) ( not ( = ?auto_656836 ?auto_656844 ) ) ( not ( = ?auto_656836 ?auto_656845 ) ) ( not ( = ?auto_656836 ?auto_656846 ) ) ( not ( = ?auto_656836 ?auto_656847 ) ) ( not ( = ?auto_656836 ?auto_656848 ) ) ( not ( = ?auto_656836 ?auto_656849 ) ) ( not ( = ?auto_656836 ?auto_656850 ) ) ( not ( = ?auto_656837 ?auto_656838 ) ) ( not ( = ?auto_656837 ?auto_656839 ) ) ( not ( = ?auto_656837 ?auto_656840 ) ) ( not ( = ?auto_656837 ?auto_656841 ) ) ( not ( = ?auto_656837 ?auto_656842 ) ) ( not ( = ?auto_656837 ?auto_656843 ) ) ( not ( = ?auto_656837 ?auto_656844 ) ) ( not ( = ?auto_656837 ?auto_656845 ) ) ( not ( = ?auto_656837 ?auto_656846 ) ) ( not ( = ?auto_656837 ?auto_656847 ) ) ( not ( = ?auto_656837 ?auto_656848 ) ) ( not ( = ?auto_656837 ?auto_656849 ) ) ( not ( = ?auto_656837 ?auto_656850 ) ) ( not ( = ?auto_656838 ?auto_656839 ) ) ( not ( = ?auto_656838 ?auto_656840 ) ) ( not ( = ?auto_656838 ?auto_656841 ) ) ( not ( = ?auto_656838 ?auto_656842 ) ) ( not ( = ?auto_656838 ?auto_656843 ) ) ( not ( = ?auto_656838 ?auto_656844 ) ) ( not ( = ?auto_656838 ?auto_656845 ) ) ( not ( = ?auto_656838 ?auto_656846 ) ) ( not ( = ?auto_656838 ?auto_656847 ) ) ( not ( = ?auto_656838 ?auto_656848 ) ) ( not ( = ?auto_656838 ?auto_656849 ) ) ( not ( = ?auto_656838 ?auto_656850 ) ) ( not ( = ?auto_656839 ?auto_656840 ) ) ( not ( = ?auto_656839 ?auto_656841 ) ) ( not ( = ?auto_656839 ?auto_656842 ) ) ( not ( = ?auto_656839 ?auto_656843 ) ) ( not ( = ?auto_656839 ?auto_656844 ) ) ( not ( = ?auto_656839 ?auto_656845 ) ) ( not ( = ?auto_656839 ?auto_656846 ) ) ( not ( = ?auto_656839 ?auto_656847 ) ) ( not ( = ?auto_656839 ?auto_656848 ) ) ( not ( = ?auto_656839 ?auto_656849 ) ) ( not ( = ?auto_656839 ?auto_656850 ) ) ( not ( = ?auto_656840 ?auto_656841 ) ) ( not ( = ?auto_656840 ?auto_656842 ) ) ( not ( = ?auto_656840 ?auto_656843 ) ) ( not ( = ?auto_656840 ?auto_656844 ) ) ( not ( = ?auto_656840 ?auto_656845 ) ) ( not ( = ?auto_656840 ?auto_656846 ) ) ( not ( = ?auto_656840 ?auto_656847 ) ) ( not ( = ?auto_656840 ?auto_656848 ) ) ( not ( = ?auto_656840 ?auto_656849 ) ) ( not ( = ?auto_656840 ?auto_656850 ) ) ( not ( = ?auto_656841 ?auto_656842 ) ) ( not ( = ?auto_656841 ?auto_656843 ) ) ( not ( = ?auto_656841 ?auto_656844 ) ) ( not ( = ?auto_656841 ?auto_656845 ) ) ( not ( = ?auto_656841 ?auto_656846 ) ) ( not ( = ?auto_656841 ?auto_656847 ) ) ( not ( = ?auto_656841 ?auto_656848 ) ) ( not ( = ?auto_656841 ?auto_656849 ) ) ( not ( = ?auto_656841 ?auto_656850 ) ) ( not ( = ?auto_656842 ?auto_656843 ) ) ( not ( = ?auto_656842 ?auto_656844 ) ) ( not ( = ?auto_656842 ?auto_656845 ) ) ( not ( = ?auto_656842 ?auto_656846 ) ) ( not ( = ?auto_656842 ?auto_656847 ) ) ( not ( = ?auto_656842 ?auto_656848 ) ) ( not ( = ?auto_656842 ?auto_656849 ) ) ( not ( = ?auto_656842 ?auto_656850 ) ) ( not ( = ?auto_656843 ?auto_656844 ) ) ( not ( = ?auto_656843 ?auto_656845 ) ) ( not ( = ?auto_656843 ?auto_656846 ) ) ( not ( = ?auto_656843 ?auto_656847 ) ) ( not ( = ?auto_656843 ?auto_656848 ) ) ( not ( = ?auto_656843 ?auto_656849 ) ) ( not ( = ?auto_656843 ?auto_656850 ) ) ( not ( = ?auto_656844 ?auto_656845 ) ) ( not ( = ?auto_656844 ?auto_656846 ) ) ( not ( = ?auto_656844 ?auto_656847 ) ) ( not ( = ?auto_656844 ?auto_656848 ) ) ( not ( = ?auto_656844 ?auto_656849 ) ) ( not ( = ?auto_656844 ?auto_656850 ) ) ( not ( = ?auto_656845 ?auto_656846 ) ) ( not ( = ?auto_656845 ?auto_656847 ) ) ( not ( = ?auto_656845 ?auto_656848 ) ) ( not ( = ?auto_656845 ?auto_656849 ) ) ( not ( = ?auto_656845 ?auto_656850 ) ) ( not ( = ?auto_656846 ?auto_656847 ) ) ( not ( = ?auto_656846 ?auto_656848 ) ) ( not ( = ?auto_656846 ?auto_656849 ) ) ( not ( = ?auto_656846 ?auto_656850 ) ) ( not ( = ?auto_656847 ?auto_656848 ) ) ( not ( = ?auto_656847 ?auto_656849 ) ) ( not ( = ?auto_656847 ?auto_656850 ) ) ( not ( = ?auto_656848 ?auto_656849 ) ) ( not ( = ?auto_656848 ?auto_656850 ) ) ( not ( = ?auto_656849 ?auto_656850 ) ) ( ON ?auto_656849 ?auto_656850 ) ( ON ?auto_656848 ?auto_656849 ) ( ON ?auto_656847 ?auto_656848 ) ( ON ?auto_656846 ?auto_656847 ) ( ON ?auto_656845 ?auto_656846 ) ( CLEAR ?auto_656843 ) ( ON ?auto_656844 ?auto_656845 ) ( CLEAR ?auto_656844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_656834 ?auto_656835 ?auto_656836 ?auto_656837 ?auto_656838 ?auto_656839 ?auto_656840 ?auto_656841 ?auto_656842 ?auto_656843 ?auto_656844 )
      ( MAKE-17PILE ?auto_656834 ?auto_656835 ?auto_656836 ?auto_656837 ?auto_656838 ?auto_656839 ?auto_656840 ?auto_656841 ?auto_656842 ?auto_656843 ?auto_656844 ?auto_656845 ?auto_656846 ?auto_656847 ?auto_656848 ?auto_656849 ?auto_656850 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_656868 - BLOCK
      ?auto_656869 - BLOCK
      ?auto_656870 - BLOCK
      ?auto_656871 - BLOCK
      ?auto_656872 - BLOCK
      ?auto_656873 - BLOCK
      ?auto_656874 - BLOCK
      ?auto_656875 - BLOCK
      ?auto_656876 - BLOCK
      ?auto_656877 - BLOCK
      ?auto_656878 - BLOCK
      ?auto_656879 - BLOCK
      ?auto_656880 - BLOCK
      ?auto_656881 - BLOCK
      ?auto_656882 - BLOCK
      ?auto_656883 - BLOCK
      ?auto_656884 - BLOCK
    )
    :vars
    (
      ?auto_656885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_656884 ?auto_656885 ) ( ON-TABLE ?auto_656868 ) ( ON ?auto_656869 ?auto_656868 ) ( ON ?auto_656870 ?auto_656869 ) ( ON ?auto_656871 ?auto_656870 ) ( ON ?auto_656872 ?auto_656871 ) ( ON ?auto_656873 ?auto_656872 ) ( ON ?auto_656874 ?auto_656873 ) ( ON ?auto_656875 ?auto_656874 ) ( ON ?auto_656876 ?auto_656875 ) ( not ( = ?auto_656868 ?auto_656869 ) ) ( not ( = ?auto_656868 ?auto_656870 ) ) ( not ( = ?auto_656868 ?auto_656871 ) ) ( not ( = ?auto_656868 ?auto_656872 ) ) ( not ( = ?auto_656868 ?auto_656873 ) ) ( not ( = ?auto_656868 ?auto_656874 ) ) ( not ( = ?auto_656868 ?auto_656875 ) ) ( not ( = ?auto_656868 ?auto_656876 ) ) ( not ( = ?auto_656868 ?auto_656877 ) ) ( not ( = ?auto_656868 ?auto_656878 ) ) ( not ( = ?auto_656868 ?auto_656879 ) ) ( not ( = ?auto_656868 ?auto_656880 ) ) ( not ( = ?auto_656868 ?auto_656881 ) ) ( not ( = ?auto_656868 ?auto_656882 ) ) ( not ( = ?auto_656868 ?auto_656883 ) ) ( not ( = ?auto_656868 ?auto_656884 ) ) ( not ( = ?auto_656868 ?auto_656885 ) ) ( not ( = ?auto_656869 ?auto_656870 ) ) ( not ( = ?auto_656869 ?auto_656871 ) ) ( not ( = ?auto_656869 ?auto_656872 ) ) ( not ( = ?auto_656869 ?auto_656873 ) ) ( not ( = ?auto_656869 ?auto_656874 ) ) ( not ( = ?auto_656869 ?auto_656875 ) ) ( not ( = ?auto_656869 ?auto_656876 ) ) ( not ( = ?auto_656869 ?auto_656877 ) ) ( not ( = ?auto_656869 ?auto_656878 ) ) ( not ( = ?auto_656869 ?auto_656879 ) ) ( not ( = ?auto_656869 ?auto_656880 ) ) ( not ( = ?auto_656869 ?auto_656881 ) ) ( not ( = ?auto_656869 ?auto_656882 ) ) ( not ( = ?auto_656869 ?auto_656883 ) ) ( not ( = ?auto_656869 ?auto_656884 ) ) ( not ( = ?auto_656869 ?auto_656885 ) ) ( not ( = ?auto_656870 ?auto_656871 ) ) ( not ( = ?auto_656870 ?auto_656872 ) ) ( not ( = ?auto_656870 ?auto_656873 ) ) ( not ( = ?auto_656870 ?auto_656874 ) ) ( not ( = ?auto_656870 ?auto_656875 ) ) ( not ( = ?auto_656870 ?auto_656876 ) ) ( not ( = ?auto_656870 ?auto_656877 ) ) ( not ( = ?auto_656870 ?auto_656878 ) ) ( not ( = ?auto_656870 ?auto_656879 ) ) ( not ( = ?auto_656870 ?auto_656880 ) ) ( not ( = ?auto_656870 ?auto_656881 ) ) ( not ( = ?auto_656870 ?auto_656882 ) ) ( not ( = ?auto_656870 ?auto_656883 ) ) ( not ( = ?auto_656870 ?auto_656884 ) ) ( not ( = ?auto_656870 ?auto_656885 ) ) ( not ( = ?auto_656871 ?auto_656872 ) ) ( not ( = ?auto_656871 ?auto_656873 ) ) ( not ( = ?auto_656871 ?auto_656874 ) ) ( not ( = ?auto_656871 ?auto_656875 ) ) ( not ( = ?auto_656871 ?auto_656876 ) ) ( not ( = ?auto_656871 ?auto_656877 ) ) ( not ( = ?auto_656871 ?auto_656878 ) ) ( not ( = ?auto_656871 ?auto_656879 ) ) ( not ( = ?auto_656871 ?auto_656880 ) ) ( not ( = ?auto_656871 ?auto_656881 ) ) ( not ( = ?auto_656871 ?auto_656882 ) ) ( not ( = ?auto_656871 ?auto_656883 ) ) ( not ( = ?auto_656871 ?auto_656884 ) ) ( not ( = ?auto_656871 ?auto_656885 ) ) ( not ( = ?auto_656872 ?auto_656873 ) ) ( not ( = ?auto_656872 ?auto_656874 ) ) ( not ( = ?auto_656872 ?auto_656875 ) ) ( not ( = ?auto_656872 ?auto_656876 ) ) ( not ( = ?auto_656872 ?auto_656877 ) ) ( not ( = ?auto_656872 ?auto_656878 ) ) ( not ( = ?auto_656872 ?auto_656879 ) ) ( not ( = ?auto_656872 ?auto_656880 ) ) ( not ( = ?auto_656872 ?auto_656881 ) ) ( not ( = ?auto_656872 ?auto_656882 ) ) ( not ( = ?auto_656872 ?auto_656883 ) ) ( not ( = ?auto_656872 ?auto_656884 ) ) ( not ( = ?auto_656872 ?auto_656885 ) ) ( not ( = ?auto_656873 ?auto_656874 ) ) ( not ( = ?auto_656873 ?auto_656875 ) ) ( not ( = ?auto_656873 ?auto_656876 ) ) ( not ( = ?auto_656873 ?auto_656877 ) ) ( not ( = ?auto_656873 ?auto_656878 ) ) ( not ( = ?auto_656873 ?auto_656879 ) ) ( not ( = ?auto_656873 ?auto_656880 ) ) ( not ( = ?auto_656873 ?auto_656881 ) ) ( not ( = ?auto_656873 ?auto_656882 ) ) ( not ( = ?auto_656873 ?auto_656883 ) ) ( not ( = ?auto_656873 ?auto_656884 ) ) ( not ( = ?auto_656873 ?auto_656885 ) ) ( not ( = ?auto_656874 ?auto_656875 ) ) ( not ( = ?auto_656874 ?auto_656876 ) ) ( not ( = ?auto_656874 ?auto_656877 ) ) ( not ( = ?auto_656874 ?auto_656878 ) ) ( not ( = ?auto_656874 ?auto_656879 ) ) ( not ( = ?auto_656874 ?auto_656880 ) ) ( not ( = ?auto_656874 ?auto_656881 ) ) ( not ( = ?auto_656874 ?auto_656882 ) ) ( not ( = ?auto_656874 ?auto_656883 ) ) ( not ( = ?auto_656874 ?auto_656884 ) ) ( not ( = ?auto_656874 ?auto_656885 ) ) ( not ( = ?auto_656875 ?auto_656876 ) ) ( not ( = ?auto_656875 ?auto_656877 ) ) ( not ( = ?auto_656875 ?auto_656878 ) ) ( not ( = ?auto_656875 ?auto_656879 ) ) ( not ( = ?auto_656875 ?auto_656880 ) ) ( not ( = ?auto_656875 ?auto_656881 ) ) ( not ( = ?auto_656875 ?auto_656882 ) ) ( not ( = ?auto_656875 ?auto_656883 ) ) ( not ( = ?auto_656875 ?auto_656884 ) ) ( not ( = ?auto_656875 ?auto_656885 ) ) ( not ( = ?auto_656876 ?auto_656877 ) ) ( not ( = ?auto_656876 ?auto_656878 ) ) ( not ( = ?auto_656876 ?auto_656879 ) ) ( not ( = ?auto_656876 ?auto_656880 ) ) ( not ( = ?auto_656876 ?auto_656881 ) ) ( not ( = ?auto_656876 ?auto_656882 ) ) ( not ( = ?auto_656876 ?auto_656883 ) ) ( not ( = ?auto_656876 ?auto_656884 ) ) ( not ( = ?auto_656876 ?auto_656885 ) ) ( not ( = ?auto_656877 ?auto_656878 ) ) ( not ( = ?auto_656877 ?auto_656879 ) ) ( not ( = ?auto_656877 ?auto_656880 ) ) ( not ( = ?auto_656877 ?auto_656881 ) ) ( not ( = ?auto_656877 ?auto_656882 ) ) ( not ( = ?auto_656877 ?auto_656883 ) ) ( not ( = ?auto_656877 ?auto_656884 ) ) ( not ( = ?auto_656877 ?auto_656885 ) ) ( not ( = ?auto_656878 ?auto_656879 ) ) ( not ( = ?auto_656878 ?auto_656880 ) ) ( not ( = ?auto_656878 ?auto_656881 ) ) ( not ( = ?auto_656878 ?auto_656882 ) ) ( not ( = ?auto_656878 ?auto_656883 ) ) ( not ( = ?auto_656878 ?auto_656884 ) ) ( not ( = ?auto_656878 ?auto_656885 ) ) ( not ( = ?auto_656879 ?auto_656880 ) ) ( not ( = ?auto_656879 ?auto_656881 ) ) ( not ( = ?auto_656879 ?auto_656882 ) ) ( not ( = ?auto_656879 ?auto_656883 ) ) ( not ( = ?auto_656879 ?auto_656884 ) ) ( not ( = ?auto_656879 ?auto_656885 ) ) ( not ( = ?auto_656880 ?auto_656881 ) ) ( not ( = ?auto_656880 ?auto_656882 ) ) ( not ( = ?auto_656880 ?auto_656883 ) ) ( not ( = ?auto_656880 ?auto_656884 ) ) ( not ( = ?auto_656880 ?auto_656885 ) ) ( not ( = ?auto_656881 ?auto_656882 ) ) ( not ( = ?auto_656881 ?auto_656883 ) ) ( not ( = ?auto_656881 ?auto_656884 ) ) ( not ( = ?auto_656881 ?auto_656885 ) ) ( not ( = ?auto_656882 ?auto_656883 ) ) ( not ( = ?auto_656882 ?auto_656884 ) ) ( not ( = ?auto_656882 ?auto_656885 ) ) ( not ( = ?auto_656883 ?auto_656884 ) ) ( not ( = ?auto_656883 ?auto_656885 ) ) ( not ( = ?auto_656884 ?auto_656885 ) ) ( ON ?auto_656883 ?auto_656884 ) ( ON ?auto_656882 ?auto_656883 ) ( ON ?auto_656881 ?auto_656882 ) ( ON ?auto_656880 ?auto_656881 ) ( ON ?auto_656879 ?auto_656880 ) ( ON ?auto_656878 ?auto_656879 ) ( CLEAR ?auto_656876 ) ( ON ?auto_656877 ?auto_656878 ) ( CLEAR ?auto_656877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_656868 ?auto_656869 ?auto_656870 ?auto_656871 ?auto_656872 ?auto_656873 ?auto_656874 ?auto_656875 ?auto_656876 ?auto_656877 )
      ( MAKE-17PILE ?auto_656868 ?auto_656869 ?auto_656870 ?auto_656871 ?auto_656872 ?auto_656873 ?auto_656874 ?auto_656875 ?auto_656876 ?auto_656877 ?auto_656878 ?auto_656879 ?auto_656880 ?auto_656881 ?auto_656882 ?auto_656883 ?auto_656884 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_656903 - BLOCK
      ?auto_656904 - BLOCK
      ?auto_656905 - BLOCK
      ?auto_656906 - BLOCK
      ?auto_656907 - BLOCK
      ?auto_656908 - BLOCK
      ?auto_656909 - BLOCK
      ?auto_656910 - BLOCK
      ?auto_656911 - BLOCK
      ?auto_656912 - BLOCK
      ?auto_656913 - BLOCK
      ?auto_656914 - BLOCK
      ?auto_656915 - BLOCK
      ?auto_656916 - BLOCK
      ?auto_656917 - BLOCK
      ?auto_656918 - BLOCK
      ?auto_656919 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_656919 ) ( ON-TABLE ?auto_656903 ) ( ON ?auto_656904 ?auto_656903 ) ( ON ?auto_656905 ?auto_656904 ) ( ON ?auto_656906 ?auto_656905 ) ( ON ?auto_656907 ?auto_656906 ) ( ON ?auto_656908 ?auto_656907 ) ( ON ?auto_656909 ?auto_656908 ) ( ON ?auto_656910 ?auto_656909 ) ( ON ?auto_656911 ?auto_656910 ) ( not ( = ?auto_656903 ?auto_656904 ) ) ( not ( = ?auto_656903 ?auto_656905 ) ) ( not ( = ?auto_656903 ?auto_656906 ) ) ( not ( = ?auto_656903 ?auto_656907 ) ) ( not ( = ?auto_656903 ?auto_656908 ) ) ( not ( = ?auto_656903 ?auto_656909 ) ) ( not ( = ?auto_656903 ?auto_656910 ) ) ( not ( = ?auto_656903 ?auto_656911 ) ) ( not ( = ?auto_656903 ?auto_656912 ) ) ( not ( = ?auto_656903 ?auto_656913 ) ) ( not ( = ?auto_656903 ?auto_656914 ) ) ( not ( = ?auto_656903 ?auto_656915 ) ) ( not ( = ?auto_656903 ?auto_656916 ) ) ( not ( = ?auto_656903 ?auto_656917 ) ) ( not ( = ?auto_656903 ?auto_656918 ) ) ( not ( = ?auto_656903 ?auto_656919 ) ) ( not ( = ?auto_656904 ?auto_656905 ) ) ( not ( = ?auto_656904 ?auto_656906 ) ) ( not ( = ?auto_656904 ?auto_656907 ) ) ( not ( = ?auto_656904 ?auto_656908 ) ) ( not ( = ?auto_656904 ?auto_656909 ) ) ( not ( = ?auto_656904 ?auto_656910 ) ) ( not ( = ?auto_656904 ?auto_656911 ) ) ( not ( = ?auto_656904 ?auto_656912 ) ) ( not ( = ?auto_656904 ?auto_656913 ) ) ( not ( = ?auto_656904 ?auto_656914 ) ) ( not ( = ?auto_656904 ?auto_656915 ) ) ( not ( = ?auto_656904 ?auto_656916 ) ) ( not ( = ?auto_656904 ?auto_656917 ) ) ( not ( = ?auto_656904 ?auto_656918 ) ) ( not ( = ?auto_656904 ?auto_656919 ) ) ( not ( = ?auto_656905 ?auto_656906 ) ) ( not ( = ?auto_656905 ?auto_656907 ) ) ( not ( = ?auto_656905 ?auto_656908 ) ) ( not ( = ?auto_656905 ?auto_656909 ) ) ( not ( = ?auto_656905 ?auto_656910 ) ) ( not ( = ?auto_656905 ?auto_656911 ) ) ( not ( = ?auto_656905 ?auto_656912 ) ) ( not ( = ?auto_656905 ?auto_656913 ) ) ( not ( = ?auto_656905 ?auto_656914 ) ) ( not ( = ?auto_656905 ?auto_656915 ) ) ( not ( = ?auto_656905 ?auto_656916 ) ) ( not ( = ?auto_656905 ?auto_656917 ) ) ( not ( = ?auto_656905 ?auto_656918 ) ) ( not ( = ?auto_656905 ?auto_656919 ) ) ( not ( = ?auto_656906 ?auto_656907 ) ) ( not ( = ?auto_656906 ?auto_656908 ) ) ( not ( = ?auto_656906 ?auto_656909 ) ) ( not ( = ?auto_656906 ?auto_656910 ) ) ( not ( = ?auto_656906 ?auto_656911 ) ) ( not ( = ?auto_656906 ?auto_656912 ) ) ( not ( = ?auto_656906 ?auto_656913 ) ) ( not ( = ?auto_656906 ?auto_656914 ) ) ( not ( = ?auto_656906 ?auto_656915 ) ) ( not ( = ?auto_656906 ?auto_656916 ) ) ( not ( = ?auto_656906 ?auto_656917 ) ) ( not ( = ?auto_656906 ?auto_656918 ) ) ( not ( = ?auto_656906 ?auto_656919 ) ) ( not ( = ?auto_656907 ?auto_656908 ) ) ( not ( = ?auto_656907 ?auto_656909 ) ) ( not ( = ?auto_656907 ?auto_656910 ) ) ( not ( = ?auto_656907 ?auto_656911 ) ) ( not ( = ?auto_656907 ?auto_656912 ) ) ( not ( = ?auto_656907 ?auto_656913 ) ) ( not ( = ?auto_656907 ?auto_656914 ) ) ( not ( = ?auto_656907 ?auto_656915 ) ) ( not ( = ?auto_656907 ?auto_656916 ) ) ( not ( = ?auto_656907 ?auto_656917 ) ) ( not ( = ?auto_656907 ?auto_656918 ) ) ( not ( = ?auto_656907 ?auto_656919 ) ) ( not ( = ?auto_656908 ?auto_656909 ) ) ( not ( = ?auto_656908 ?auto_656910 ) ) ( not ( = ?auto_656908 ?auto_656911 ) ) ( not ( = ?auto_656908 ?auto_656912 ) ) ( not ( = ?auto_656908 ?auto_656913 ) ) ( not ( = ?auto_656908 ?auto_656914 ) ) ( not ( = ?auto_656908 ?auto_656915 ) ) ( not ( = ?auto_656908 ?auto_656916 ) ) ( not ( = ?auto_656908 ?auto_656917 ) ) ( not ( = ?auto_656908 ?auto_656918 ) ) ( not ( = ?auto_656908 ?auto_656919 ) ) ( not ( = ?auto_656909 ?auto_656910 ) ) ( not ( = ?auto_656909 ?auto_656911 ) ) ( not ( = ?auto_656909 ?auto_656912 ) ) ( not ( = ?auto_656909 ?auto_656913 ) ) ( not ( = ?auto_656909 ?auto_656914 ) ) ( not ( = ?auto_656909 ?auto_656915 ) ) ( not ( = ?auto_656909 ?auto_656916 ) ) ( not ( = ?auto_656909 ?auto_656917 ) ) ( not ( = ?auto_656909 ?auto_656918 ) ) ( not ( = ?auto_656909 ?auto_656919 ) ) ( not ( = ?auto_656910 ?auto_656911 ) ) ( not ( = ?auto_656910 ?auto_656912 ) ) ( not ( = ?auto_656910 ?auto_656913 ) ) ( not ( = ?auto_656910 ?auto_656914 ) ) ( not ( = ?auto_656910 ?auto_656915 ) ) ( not ( = ?auto_656910 ?auto_656916 ) ) ( not ( = ?auto_656910 ?auto_656917 ) ) ( not ( = ?auto_656910 ?auto_656918 ) ) ( not ( = ?auto_656910 ?auto_656919 ) ) ( not ( = ?auto_656911 ?auto_656912 ) ) ( not ( = ?auto_656911 ?auto_656913 ) ) ( not ( = ?auto_656911 ?auto_656914 ) ) ( not ( = ?auto_656911 ?auto_656915 ) ) ( not ( = ?auto_656911 ?auto_656916 ) ) ( not ( = ?auto_656911 ?auto_656917 ) ) ( not ( = ?auto_656911 ?auto_656918 ) ) ( not ( = ?auto_656911 ?auto_656919 ) ) ( not ( = ?auto_656912 ?auto_656913 ) ) ( not ( = ?auto_656912 ?auto_656914 ) ) ( not ( = ?auto_656912 ?auto_656915 ) ) ( not ( = ?auto_656912 ?auto_656916 ) ) ( not ( = ?auto_656912 ?auto_656917 ) ) ( not ( = ?auto_656912 ?auto_656918 ) ) ( not ( = ?auto_656912 ?auto_656919 ) ) ( not ( = ?auto_656913 ?auto_656914 ) ) ( not ( = ?auto_656913 ?auto_656915 ) ) ( not ( = ?auto_656913 ?auto_656916 ) ) ( not ( = ?auto_656913 ?auto_656917 ) ) ( not ( = ?auto_656913 ?auto_656918 ) ) ( not ( = ?auto_656913 ?auto_656919 ) ) ( not ( = ?auto_656914 ?auto_656915 ) ) ( not ( = ?auto_656914 ?auto_656916 ) ) ( not ( = ?auto_656914 ?auto_656917 ) ) ( not ( = ?auto_656914 ?auto_656918 ) ) ( not ( = ?auto_656914 ?auto_656919 ) ) ( not ( = ?auto_656915 ?auto_656916 ) ) ( not ( = ?auto_656915 ?auto_656917 ) ) ( not ( = ?auto_656915 ?auto_656918 ) ) ( not ( = ?auto_656915 ?auto_656919 ) ) ( not ( = ?auto_656916 ?auto_656917 ) ) ( not ( = ?auto_656916 ?auto_656918 ) ) ( not ( = ?auto_656916 ?auto_656919 ) ) ( not ( = ?auto_656917 ?auto_656918 ) ) ( not ( = ?auto_656917 ?auto_656919 ) ) ( not ( = ?auto_656918 ?auto_656919 ) ) ( ON ?auto_656918 ?auto_656919 ) ( ON ?auto_656917 ?auto_656918 ) ( ON ?auto_656916 ?auto_656917 ) ( ON ?auto_656915 ?auto_656916 ) ( ON ?auto_656914 ?auto_656915 ) ( ON ?auto_656913 ?auto_656914 ) ( CLEAR ?auto_656911 ) ( ON ?auto_656912 ?auto_656913 ) ( CLEAR ?auto_656912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_656903 ?auto_656904 ?auto_656905 ?auto_656906 ?auto_656907 ?auto_656908 ?auto_656909 ?auto_656910 ?auto_656911 ?auto_656912 )
      ( MAKE-17PILE ?auto_656903 ?auto_656904 ?auto_656905 ?auto_656906 ?auto_656907 ?auto_656908 ?auto_656909 ?auto_656910 ?auto_656911 ?auto_656912 ?auto_656913 ?auto_656914 ?auto_656915 ?auto_656916 ?auto_656917 ?auto_656918 ?auto_656919 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_656937 - BLOCK
      ?auto_656938 - BLOCK
      ?auto_656939 - BLOCK
      ?auto_656940 - BLOCK
      ?auto_656941 - BLOCK
      ?auto_656942 - BLOCK
      ?auto_656943 - BLOCK
      ?auto_656944 - BLOCK
      ?auto_656945 - BLOCK
      ?auto_656946 - BLOCK
      ?auto_656947 - BLOCK
      ?auto_656948 - BLOCK
      ?auto_656949 - BLOCK
      ?auto_656950 - BLOCK
      ?auto_656951 - BLOCK
      ?auto_656952 - BLOCK
      ?auto_656953 - BLOCK
    )
    :vars
    (
      ?auto_656954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_656953 ?auto_656954 ) ( ON-TABLE ?auto_656937 ) ( ON ?auto_656938 ?auto_656937 ) ( ON ?auto_656939 ?auto_656938 ) ( ON ?auto_656940 ?auto_656939 ) ( ON ?auto_656941 ?auto_656940 ) ( ON ?auto_656942 ?auto_656941 ) ( ON ?auto_656943 ?auto_656942 ) ( ON ?auto_656944 ?auto_656943 ) ( not ( = ?auto_656937 ?auto_656938 ) ) ( not ( = ?auto_656937 ?auto_656939 ) ) ( not ( = ?auto_656937 ?auto_656940 ) ) ( not ( = ?auto_656937 ?auto_656941 ) ) ( not ( = ?auto_656937 ?auto_656942 ) ) ( not ( = ?auto_656937 ?auto_656943 ) ) ( not ( = ?auto_656937 ?auto_656944 ) ) ( not ( = ?auto_656937 ?auto_656945 ) ) ( not ( = ?auto_656937 ?auto_656946 ) ) ( not ( = ?auto_656937 ?auto_656947 ) ) ( not ( = ?auto_656937 ?auto_656948 ) ) ( not ( = ?auto_656937 ?auto_656949 ) ) ( not ( = ?auto_656937 ?auto_656950 ) ) ( not ( = ?auto_656937 ?auto_656951 ) ) ( not ( = ?auto_656937 ?auto_656952 ) ) ( not ( = ?auto_656937 ?auto_656953 ) ) ( not ( = ?auto_656937 ?auto_656954 ) ) ( not ( = ?auto_656938 ?auto_656939 ) ) ( not ( = ?auto_656938 ?auto_656940 ) ) ( not ( = ?auto_656938 ?auto_656941 ) ) ( not ( = ?auto_656938 ?auto_656942 ) ) ( not ( = ?auto_656938 ?auto_656943 ) ) ( not ( = ?auto_656938 ?auto_656944 ) ) ( not ( = ?auto_656938 ?auto_656945 ) ) ( not ( = ?auto_656938 ?auto_656946 ) ) ( not ( = ?auto_656938 ?auto_656947 ) ) ( not ( = ?auto_656938 ?auto_656948 ) ) ( not ( = ?auto_656938 ?auto_656949 ) ) ( not ( = ?auto_656938 ?auto_656950 ) ) ( not ( = ?auto_656938 ?auto_656951 ) ) ( not ( = ?auto_656938 ?auto_656952 ) ) ( not ( = ?auto_656938 ?auto_656953 ) ) ( not ( = ?auto_656938 ?auto_656954 ) ) ( not ( = ?auto_656939 ?auto_656940 ) ) ( not ( = ?auto_656939 ?auto_656941 ) ) ( not ( = ?auto_656939 ?auto_656942 ) ) ( not ( = ?auto_656939 ?auto_656943 ) ) ( not ( = ?auto_656939 ?auto_656944 ) ) ( not ( = ?auto_656939 ?auto_656945 ) ) ( not ( = ?auto_656939 ?auto_656946 ) ) ( not ( = ?auto_656939 ?auto_656947 ) ) ( not ( = ?auto_656939 ?auto_656948 ) ) ( not ( = ?auto_656939 ?auto_656949 ) ) ( not ( = ?auto_656939 ?auto_656950 ) ) ( not ( = ?auto_656939 ?auto_656951 ) ) ( not ( = ?auto_656939 ?auto_656952 ) ) ( not ( = ?auto_656939 ?auto_656953 ) ) ( not ( = ?auto_656939 ?auto_656954 ) ) ( not ( = ?auto_656940 ?auto_656941 ) ) ( not ( = ?auto_656940 ?auto_656942 ) ) ( not ( = ?auto_656940 ?auto_656943 ) ) ( not ( = ?auto_656940 ?auto_656944 ) ) ( not ( = ?auto_656940 ?auto_656945 ) ) ( not ( = ?auto_656940 ?auto_656946 ) ) ( not ( = ?auto_656940 ?auto_656947 ) ) ( not ( = ?auto_656940 ?auto_656948 ) ) ( not ( = ?auto_656940 ?auto_656949 ) ) ( not ( = ?auto_656940 ?auto_656950 ) ) ( not ( = ?auto_656940 ?auto_656951 ) ) ( not ( = ?auto_656940 ?auto_656952 ) ) ( not ( = ?auto_656940 ?auto_656953 ) ) ( not ( = ?auto_656940 ?auto_656954 ) ) ( not ( = ?auto_656941 ?auto_656942 ) ) ( not ( = ?auto_656941 ?auto_656943 ) ) ( not ( = ?auto_656941 ?auto_656944 ) ) ( not ( = ?auto_656941 ?auto_656945 ) ) ( not ( = ?auto_656941 ?auto_656946 ) ) ( not ( = ?auto_656941 ?auto_656947 ) ) ( not ( = ?auto_656941 ?auto_656948 ) ) ( not ( = ?auto_656941 ?auto_656949 ) ) ( not ( = ?auto_656941 ?auto_656950 ) ) ( not ( = ?auto_656941 ?auto_656951 ) ) ( not ( = ?auto_656941 ?auto_656952 ) ) ( not ( = ?auto_656941 ?auto_656953 ) ) ( not ( = ?auto_656941 ?auto_656954 ) ) ( not ( = ?auto_656942 ?auto_656943 ) ) ( not ( = ?auto_656942 ?auto_656944 ) ) ( not ( = ?auto_656942 ?auto_656945 ) ) ( not ( = ?auto_656942 ?auto_656946 ) ) ( not ( = ?auto_656942 ?auto_656947 ) ) ( not ( = ?auto_656942 ?auto_656948 ) ) ( not ( = ?auto_656942 ?auto_656949 ) ) ( not ( = ?auto_656942 ?auto_656950 ) ) ( not ( = ?auto_656942 ?auto_656951 ) ) ( not ( = ?auto_656942 ?auto_656952 ) ) ( not ( = ?auto_656942 ?auto_656953 ) ) ( not ( = ?auto_656942 ?auto_656954 ) ) ( not ( = ?auto_656943 ?auto_656944 ) ) ( not ( = ?auto_656943 ?auto_656945 ) ) ( not ( = ?auto_656943 ?auto_656946 ) ) ( not ( = ?auto_656943 ?auto_656947 ) ) ( not ( = ?auto_656943 ?auto_656948 ) ) ( not ( = ?auto_656943 ?auto_656949 ) ) ( not ( = ?auto_656943 ?auto_656950 ) ) ( not ( = ?auto_656943 ?auto_656951 ) ) ( not ( = ?auto_656943 ?auto_656952 ) ) ( not ( = ?auto_656943 ?auto_656953 ) ) ( not ( = ?auto_656943 ?auto_656954 ) ) ( not ( = ?auto_656944 ?auto_656945 ) ) ( not ( = ?auto_656944 ?auto_656946 ) ) ( not ( = ?auto_656944 ?auto_656947 ) ) ( not ( = ?auto_656944 ?auto_656948 ) ) ( not ( = ?auto_656944 ?auto_656949 ) ) ( not ( = ?auto_656944 ?auto_656950 ) ) ( not ( = ?auto_656944 ?auto_656951 ) ) ( not ( = ?auto_656944 ?auto_656952 ) ) ( not ( = ?auto_656944 ?auto_656953 ) ) ( not ( = ?auto_656944 ?auto_656954 ) ) ( not ( = ?auto_656945 ?auto_656946 ) ) ( not ( = ?auto_656945 ?auto_656947 ) ) ( not ( = ?auto_656945 ?auto_656948 ) ) ( not ( = ?auto_656945 ?auto_656949 ) ) ( not ( = ?auto_656945 ?auto_656950 ) ) ( not ( = ?auto_656945 ?auto_656951 ) ) ( not ( = ?auto_656945 ?auto_656952 ) ) ( not ( = ?auto_656945 ?auto_656953 ) ) ( not ( = ?auto_656945 ?auto_656954 ) ) ( not ( = ?auto_656946 ?auto_656947 ) ) ( not ( = ?auto_656946 ?auto_656948 ) ) ( not ( = ?auto_656946 ?auto_656949 ) ) ( not ( = ?auto_656946 ?auto_656950 ) ) ( not ( = ?auto_656946 ?auto_656951 ) ) ( not ( = ?auto_656946 ?auto_656952 ) ) ( not ( = ?auto_656946 ?auto_656953 ) ) ( not ( = ?auto_656946 ?auto_656954 ) ) ( not ( = ?auto_656947 ?auto_656948 ) ) ( not ( = ?auto_656947 ?auto_656949 ) ) ( not ( = ?auto_656947 ?auto_656950 ) ) ( not ( = ?auto_656947 ?auto_656951 ) ) ( not ( = ?auto_656947 ?auto_656952 ) ) ( not ( = ?auto_656947 ?auto_656953 ) ) ( not ( = ?auto_656947 ?auto_656954 ) ) ( not ( = ?auto_656948 ?auto_656949 ) ) ( not ( = ?auto_656948 ?auto_656950 ) ) ( not ( = ?auto_656948 ?auto_656951 ) ) ( not ( = ?auto_656948 ?auto_656952 ) ) ( not ( = ?auto_656948 ?auto_656953 ) ) ( not ( = ?auto_656948 ?auto_656954 ) ) ( not ( = ?auto_656949 ?auto_656950 ) ) ( not ( = ?auto_656949 ?auto_656951 ) ) ( not ( = ?auto_656949 ?auto_656952 ) ) ( not ( = ?auto_656949 ?auto_656953 ) ) ( not ( = ?auto_656949 ?auto_656954 ) ) ( not ( = ?auto_656950 ?auto_656951 ) ) ( not ( = ?auto_656950 ?auto_656952 ) ) ( not ( = ?auto_656950 ?auto_656953 ) ) ( not ( = ?auto_656950 ?auto_656954 ) ) ( not ( = ?auto_656951 ?auto_656952 ) ) ( not ( = ?auto_656951 ?auto_656953 ) ) ( not ( = ?auto_656951 ?auto_656954 ) ) ( not ( = ?auto_656952 ?auto_656953 ) ) ( not ( = ?auto_656952 ?auto_656954 ) ) ( not ( = ?auto_656953 ?auto_656954 ) ) ( ON ?auto_656952 ?auto_656953 ) ( ON ?auto_656951 ?auto_656952 ) ( ON ?auto_656950 ?auto_656951 ) ( ON ?auto_656949 ?auto_656950 ) ( ON ?auto_656948 ?auto_656949 ) ( ON ?auto_656947 ?auto_656948 ) ( ON ?auto_656946 ?auto_656947 ) ( CLEAR ?auto_656944 ) ( ON ?auto_656945 ?auto_656946 ) ( CLEAR ?auto_656945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_656937 ?auto_656938 ?auto_656939 ?auto_656940 ?auto_656941 ?auto_656942 ?auto_656943 ?auto_656944 ?auto_656945 )
      ( MAKE-17PILE ?auto_656937 ?auto_656938 ?auto_656939 ?auto_656940 ?auto_656941 ?auto_656942 ?auto_656943 ?auto_656944 ?auto_656945 ?auto_656946 ?auto_656947 ?auto_656948 ?auto_656949 ?auto_656950 ?auto_656951 ?auto_656952 ?auto_656953 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_656972 - BLOCK
      ?auto_656973 - BLOCK
      ?auto_656974 - BLOCK
      ?auto_656975 - BLOCK
      ?auto_656976 - BLOCK
      ?auto_656977 - BLOCK
      ?auto_656978 - BLOCK
      ?auto_656979 - BLOCK
      ?auto_656980 - BLOCK
      ?auto_656981 - BLOCK
      ?auto_656982 - BLOCK
      ?auto_656983 - BLOCK
      ?auto_656984 - BLOCK
      ?auto_656985 - BLOCK
      ?auto_656986 - BLOCK
      ?auto_656987 - BLOCK
      ?auto_656988 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_656988 ) ( ON-TABLE ?auto_656972 ) ( ON ?auto_656973 ?auto_656972 ) ( ON ?auto_656974 ?auto_656973 ) ( ON ?auto_656975 ?auto_656974 ) ( ON ?auto_656976 ?auto_656975 ) ( ON ?auto_656977 ?auto_656976 ) ( ON ?auto_656978 ?auto_656977 ) ( ON ?auto_656979 ?auto_656978 ) ( not ( = ?auto_656972 ?auto_656973 ) ) ( not ( = ?auto_656972 ?auto_656974 ) ) ( not ( = ?auto_656972 ?auto_656975 ) ) ( not ( = ?auto_656972 ?auto_656976 ) ) ( not ( = ?auto_656972 ?auto_656977 ) ) ( not ( = ?auto_656972 ?auto_656978 ) ) ( not ( = ?auto_656972 ?auto_656979 ) ) ( not ( = ?auto_656972 ?auto_656980 ) ) ( not ( = ?auto_656972 ?auto_656981 ) ) ( not ( = ?auto_656972 ?auto_656982 ) ) ( not ( = ?auto_656972 ?auto_656983 ) ) ( not ( = ?auto_656972 ?auto_656984 ) ) ( not ( = ?auto_656972 ?auto_656985 ) ) ( not ( = ?auto_656972 ?auto_656986 ) ) ( not ( = ?auto_656972 ?auto_656987 ) ) ( not ( = ?auto_656972 ?auto_656988 ) ) ( not ( = ?auto_656973 ?auto_656974 ) ) ( not ( = ?auto_656973 ?auto_656975 ) ) ( not ( = ?auto_656973 ?auto_656976 ) ) ( not ( = ?auto_656973 ?auto_656977 ) ) ( not ( = ?auto_656973 ?auto_656978 ) ) ( not ( = ?auto_656973 ?auto_656979 ) ) ( not ( = ?auto_656973 ?auto_656980 ) ) ( not ( = ?auto_656973 ?auto_656981 ) ) ( not ( = ?auto_656973 ?auto_656982 ) ) ( not ( = ?auto_656973 ?auto_656983 ) ) ( not ( = ?auto_656973 ?auto_656984 ) ) ( not ( = ?auto_656973 ?auto_656985 ) ) ( not ( = ?auto_656973 ?auto_656986 ) ) ( not ( = ?auto_656973 ?auto_656987 ) ) ( not ( = ?auto_656973 ?auto_656988 ) ) ( not ( = ?auto_656974 ?auto_656975 ) ) ( not ( = ?auto_656974 ?auto_656976 ) ) ( not ( = ?auto_656974 ?auto_656977 ) ) ( not ( = ?auto_656974 ?auto_656978 ) ) ( not ( = ?auto_656974 ?auto_656979 ) ) ( not ( = ?auto_656974 ?auto_656980 ) ) ( not ( = ?auto_656974 ?auto_656981 ) ) ( not ( = ?auto_656974 ?auto_656982 ) ) ( not ( = ?auto_656974 ?auto_656983 ) ) ( not ( = ?auto_656974 ?auto_656984 ) ) ( not ( = ?auto_656974 ?auto_656985 ) ) ( not ( = ?auto_656974 ?auto_656986 ) ) ( not ( = ?auto_656974 ?auto_656987 ) ) ( not ( = ?auto_656974 ?auto_656988 ) ) ( not ( = ?auto_656975 ?auto_656976 ) ) ( not ( = ?auto_656975 ?auto_656977 ) ) ( not ( = ?auto_656975 ?auto_656978 ) ) ( not ( = ?auto_656975 ?auto_656979 ) ) ( not ( = ?auto_656975 ?auto_656980 ) ) ( not ( = ?auto_656975 ?auto_656981 ) ) ( not ( = ?auto_656975 ?auto_656982 ) ) ( not ( = ?auto_656975 ?auto_656983 ) ) ( not ( = ?auto_656975 ?auto_656984 ) ) ( not ( = ?auto_656975 ?auto_656985 ) ) ( not ( = ?auto_656975 ?auto_656986 ) ) ( not ( = ?auto_656975 ?auto_656987 ) ) ( not ( = ?auto_656975 ?auto_656988 ) ) ( not ( = ?auto_656976 ?auto_656977 ) ) ( not ( = ?auto_656976 ?auto_656978 ) ) ( not ( = ?auto_656976 ?auto_656979 ) ) ( not ( = ?auto_656976 ?auto_656980 ) ) ( not ( = ?auto_656976 ?auto_656981 ) ) ( not ( = ?auto_656976 ?auto_656982 ) ) ( not ( = ?auto_656976 ?auto_656983 ) ) ( not ( = ?auto_656976 ?auto_656984 ) ) ( not ( = ?auto_656976 ?auto_656985 ) ) ( not ( = ?auto_656976 ?auto_656986 ) ) ( not ( = ?auto_656976 ?auto_656987 ) ) ( not ( = ?auto_656976 ?auto_656988 ) ) ( not ( = ?auto_656977 ?auto_656978 ) ) ( not ( = ?auto_656977 ?auto_656979 ) ) ( not ( = ?auto_656977 ?auto_656980 ) ) ( not ( = ?auto_656977 ?auto_656981 ) ) ( not ( = ?auto_656977 ?auto_656982 ) ) ( not ( = ?auto_656977 ?auto_656983 ) ) ( not ( = ?auto_656977 ?auto_656984 ) ) ( not ( = ?auto_656977 ?auto_656985 ) ) ( not ( = ?auto_656977 ?auto_656986 ) ) ( not ( = ?auto_656977 ?auto_656987 ) ) ( not ( = ?auto_656977 ?auto_656988 ) ) ( not ( = ?auto_656978 ?auto_656979 ) ) ( not ( = ?auto_656978 ?auto_656980 ) ) ( not ( = ?auto_656978 ?auto_656981 ) ) ( not ( = ?auto_656978 ?auto_656982 ) ) ( not ( = ?auto_656978 ?auto_656983 ) ) ( not ( = ?auto_656978 ?auto_656984 ) ) ( not ( = ?auto_656978 ?auto_656985 ) ) ( not ( = ?auto_656978 ?auto_656986 ) ) ( not ( = ?auto_656978 ?auto_656987 ) ) ( not ( = ?auto_656978 ?auto_656988 ) ) ( not ( = ?auto_656979 ?auto_656980 ) ) ( not ( = ?auto_656979 ?auto_656981 ) ) ( not ( = ?auto_656979 ?auto_656982 ) ) ( not ( = ?auto_656979 ?auto_656983 ) ) ( not ( = ?auto_656979 ?auto_656984 ) ) ( not ( = ?auto_656979 ?auto_656985 ) ) ( not ( = ?auto_656979 ?auto_656986 ) ) ( not ( = ?auto_656979 ?auto_656987 ) ) ( not ( = ?auto_656979 ?auto_656988 ) ) ( not ( = ?auto_656980 ?auto_656981 ) ) ( not ( = ?auto_656980 ?auto_656982 ) ) ( not ( = ?auto_656980 ?auto_656983 ) ) ( not ( = ?auto_656980 ?auto_656984 ) ) ( not ( = ?auto_656980 ?auto_656985 ) ) ( not ( = ?auto_656980 ?auto_656986 ) ) ( not ( = ?auto_656980 ?auto_656987 ) ) ( not ( = ?auto_656980 ?auto_656988 ) ) ( not ( = ?auto_656981 ?auto_656982 ) ) ( not ( = ?auto_656981 ?auto_656983 ) ) ( not ( = ?auto_656981 ?auto_656984 ) ) ( not ( = ?auto_656981 ?auto_656985 ) ) ( not ( = ?auto_656981 ?auto_656986 ) ) ( not ( = ?auto_656981 ?auto_656987 ) ) ( not ( = ?auto_656981 ?auto_656988 ) ) ( not ( = ?auto_656982 ?auto_656983 ) ) ( not ( = ?auto_656982 ?auto_656984 ) ) ( not ( = ?auto_656982 ?auto_656985 ) ) ( not ( = ?auto_656982 ?auto_656986 ) ) ( not ( = ?auto_656982 ?auto_656987 ) ) ( not ( = ?auto_656982 ?auto_656988 ) ) ( not ( = ?auto_656983 ?auto_656984 ) ) ( not ( = ?auto_656983 ?auto_656985 ) ) ( not ( = ?auto_656983 ?auto_656986 ) ) ( not ( = ?auto_656983 ?auto_656987 ) ) ( not ( = ?auto_656983 ?auto_656988 ) ) ( not ( = ?auto_656984 ?auto_656985 ) ) ( not ( = ?auto_656984 ?auto_656986 ) ) ( not ( = ?auto_656984 ?auto_656987 ) ) ( not ( = ?auto_656984 ?auto_656988 ) ) ( not ( = ?auto_656985 ?auto_656986 ) ) ( not ( = ?auto_656985 ?auto_656987 ) ) ( not ( = ?auto_656985 ?auto_656988 ) ) ( not ( = ?auto_656986 ?auto_656987 ) ) ( not ( = ?auto_656986 ?auto_656988 ) ) ( not ( = ?auto_656987 ?auto_656988 ) ) ( ON ?auto_656987 ?auto_656988 ) ( ON ?auto_656986 ?auto_656987 ) ( ON ?auto_656985 ?auto_656986 ) ( ON ?auto_656984 ?auto_656985 ) ( ON ?auto_656983 ?auto_656984 ) ( ON ?auto_656982 ?auto_656983 ) ( ON ?auto_656981 ?auto_656982 ) ( CLEAR ?auto_656979 ) ( ON ?auto_656980 ?auto_656981 ) ( CLEAR ?auto_656980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_656972 ?auto_656973 ?auto_656974 ?auto_656975 ?auto_656976 ?auto_656977 ?auto_656978 ?auto_656979 ?auto_656980 )
      ( MAKE-17PILE ?auto_656972 ?auto_656973 ?auto_656974 ?auto_656975 ?auto_656976 ?auto_656977 ?auto_656978 ?auto_656979 ?auto_656980 ?auto_656981 ?auto_656982 ?auto_656983 ?auto_656984 ?auto_656985 ?auto_656986 ?auto_656987 ?auto_656988 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_657006 - BLOCK
      ?auto_657007 - BLOCK
      ?auto_657008 - BLOCK
      ?auto_657009 - BLOCK
      ?auto_657010 - BLOCK
      ?auto_657011 - BLOCK
      ?auto_657012 - BLOCK
      ?auto_657013 - BLOCK
      ?auto_657014 - BLOCK
      ?auto_657015 - BLOCK
      ?auto_657016 - BLOCK
      ?auto_657017 - BLOCK
      ?auto_657018 - BLOCK
      ?auto_657019 - BLOCK
      ?auto_657020 - BLOCK
      ?auto_657021 - BLOCK
      ?auto_657022 - BLOCK
    )
    :vars
    (
      ?auto_657023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_657022 ?auto_657023 ) ( ON-TABLE ?auto_657006 ) ( ON ?auto_657007 ?auto_657006 ) ( ON ?auto_657008 ?auto_657007 ) ( ON ?auto_657009 ?auto_657008 ) ( ON ?auto_657010 ?auto_657009 ) ( ON ?auto_657011 ?auto_657010 ) ( ON ?auto_657012 ?auto_657011 ) ( not ( = ?auto_657006 ?auto_657007 ) ) ( not ( = ?auto_657006 ?auto_657008 ) ) ( not ( = ?auto_657006 ?auto_657009 ) ) ( not ( = ?auto_657006 ?auto_657010 ) ) ( not ( = ?auto_657006 ?auto_657011 ) ) ( not ( = ?auto_657006 ?auto_657012 ) ) ( not ( = ?auto_657006 ?auto_657013 ) ) ( not ( = ?auto_657006 ?auto_657014 ) ) ( not ( = ?auto_657006 ?auto_657015 ) ) ( not ( = ?auto_657006 ?auto_657016 ) ) ( not ( = ?auto_657006 ?auto_657017 ) ) ( not ( = ?auto_657006 ?auto_657018 ) ) ( not ( = ?auto_657006 ?auto_657019 ) ) ( not ( = ?auto_657006 ?auto_657020 ) ) ( not ( = ?auto_657006 ?auto_657021 ) ) ( not ( = ?auto_657006 ?auto_657022 ) ) ( not ( = ?auto_657006 ?auto_657023 ) ) ( not ( = ?auto_657007 ?auto_657008 ) ) ( not ( = ?auto_657007 ?auto_657009 ) ) ( not ( = ?auto_657007 ?auto_657010 ) ) ( not ( = ?auto_657007 ?auto_657011 ) ) ( not ( = ?auto_657007 ?auto_657012 ) ) ( not ( = ?auto_657007 ?auto_657013 ) ) ( not ( = ?auto_657007 ?auto_657014 ) ) ( not ( = ?auto_657007 ?auto_657015 ) ) ( not ( = ?auto_657007 ?auto_657016 ) ) ( not ( = ?auto_657007 ?auto_657017 ) ) ( not ( = ?auto_657007 ?auto_657018 ) ) ( not ( = ?auto_657007 ?auto_657019 ) ) ( not ( = ?auto_657007 ?auto_657020 ) ) ( not ( = ?auto_657007 ?auto_657021 ) ) ( not ( = ?auto_657007 ?auto_657022 ) ) ( not ( = ?auto_657007 ?auto_657023 ) ) ( not ( = ?auto_657008 ?auto_657009 ) ) ( not ( = ?auto_657008 ?auto_657010 ) ) ( not ( = ?auto_657008 ?auto_657011 ) ) ( not ( = ?auto_657008 ?auto_657012 ) ) ( not ( = ?auto_657008 ?auto_657013 ) ) ( not ( = ?auto_657008 ?auto_657014 ) ) ( not ( = ?auto_657008 ?auto_657015 ) ) ( not ( = ?auto_657008 ?auto_657016 ) ) ( not ( = ?auto_657008 ?auto_657017 ) ) ( not ( = ?auto_657008 ?auto_657018 ) ) ( not ( = ?auto_657008 ?auto_657019 ) ) ( not ( = ?auto_657008 ?auto_657020 ) ) ( not ( = ?auto_657008 ?auto_657021 ) ) ( not ( = ?auto_657008 ?auto_657022 ) ) ( not ( = ?auto_657008 ?auto_657023 ) ) ( not ( = ?auto_657009 ?auto_657010 ) ) ( not ( = ?auto_657009 ?auto_657011 ) ) ( not ( = ?auto_657009 ?auto_657012 ) ) ( not ( = ?auto_657009 ?auto_657013 ) ) ( not ( = ?auto_657009 ?auto_657014 ) ) ( not ( = ?auto_657009 ?auto_657015 ) ) ( not ( = ?auto_657009 ?auto_657016 ) ) ( not ( = ?auto_657009 ?auto_657017 ) ) ( not ( = ?auto_657009 ?auto_657018 ) ) ( not ( = ?auto_657009 ?auto_657019 ) ) ( not ( = ?auto_657009 ?auto_657020 ) ) ( not ( = ?auto_657009 ?auto_657021 ) ) ( not ( = ?auto_657009 ?auto_657022 ) ) ( not ( = ?auto_657009 ?auto_657023 ) ) ( not ( = ?auto_657010 ?auto_657011 ) ) ( not ( = ?auto_657010 ?auto_657012 ) ) ( not ( = ?auto_657010 ?auto_657013 ) ) ( not ( = ?auto_657010 ?auto_657014 ) ) ( not ( = ?auto_657010 ?auto_657015 ) ) ( not ( = ?auto_657010 ?auto_657016 ) ) ( not ( = ?auto_657010 ?auto_657017 ) ) ( not ( = ?auto_657010 ?auto_657018 ) ) ( not ( = ?auto_657010 ?auto_657019 ) ) ( not ( = ?auto_657010 ?auto_657020 ) ) ( not ( = ?auto_657010 ?auto_657021 ) ) ( not ( = ?auto_657010 ?auto_657022 ) ) ( not ( = ?auto_657010 ?auto_657023 ) ) ( not ( = ?auto_657011 ?auto_657012 ) ) ( not ( = ?auto_657011 ?auto_657013 ) ) ( not ( = ?auto_657011 ?auto_657014 ) ) ( not ( = ?auto_657011 ?auto_657015 ) ) ( not ( = ?auto_657011 ?auto_657016 ) ) ( not ( = ?auto_657011 ?auto_657017 ) ) ( not ( = ?auto_657011 ?auto_657018 ) ) ( not ( = ?auto_657011 ?auto_657019 ) ) ( not ( = ?auto_657011 ?auto_657020 ) ) ( not ( = ?auto_657011 ?auto_657021 ) ) ( not ( = ?auto_657011 ?auto_657022 ) ) ( not ( = ?auto_657011 ?auto_657023 ) ) ( not ( = ?auto_657012 ?auto_657013 ) ) ( not ( = ?auto_657012 ?auto_657014 ) ) ( not ( = ?auto_657012 ?auto_657015 ) ) ( not ( = ?auto_657012 ?auto_657016 ) ) ( not ( = ?auto_657012 ?auto_657017 ) ) ( not ( = ?auto_657012 ?auto_657018 ) ) ( not ( = ?auto_657012 ?auto_657019 ) ) ( not ( = ?auto_657012 ?auto_657020 ) ) ( not ( = ?auto_657012 ?auto_657021 ) ) ( not ( = ?auto_657012 ?auto_657022 ) ) ( not ( = ?auto_657012 ?auto_657023 ) ) ( not ( = ?auto_657013 ?auto_657014 ) ) ( not ( = ?auto_657013 ?auto_657015 ) ) ( not ( = ?auto_657013 ?auto_657016 ) ) ( not ( = ?auto_657013 ?auto_657017 ) ) ( not ( = ?auto_657013 ?auto_657018 ) ) ( not ( = ?auto_657013 ?auto_657019 ) ) ( not ( = ?auto_657013 ?auto_657020 ) ) ( not ( = ?auto_657013 ?auto_657021 ) ) ( not ( = ?auto_657013 ?auto_657022 ) ) ( not ( = ?auto_657013 ?auto_657023 ) ) ( not ( = ?auto_657014 ?auto_657015 ) ) ( not ( = ?auto_657014 ?auto_657016 ) ) ( not ( = ?auto_657014 ?auto_657017 ) ) ( not ( = ?auto_657014 ?auto_657018 ) ) ( not ( = ?auto_657014 ?auto_657019 ) ) ( not ( = ?auto_657014 ?auto_657020 ) ) ( not ( = ?auto_657014 ?auto_657021 ) ) ( not ( = ?auto_657014 ?auto_657022 ) ) ( not ( = ?auto_657014 ?auto_657023 ) ) ( not ( = ?auto_657015 ?auto_657016 ) ) ( not ( = ?auto_657015 ?auto_657017 ) ) ( not ( = ?auto_657015 ?auto_657018 ) ) ( not ( = ?auto_657015 ?auto_657019 ) ) ( not ( = ?auto_657015 ?auto_657020 ) ) ( not ( = ?auto_657015 ?auto_657021 ) ) ( not ( = ?auto_657015 ?auto_657022 ) ) ( not ( = ?auto_657015 ?auto_657023 ) ) ( not ( = ?auto_657016 ?auto_657017 ) ) ( not ( = ?auto_657016 ?auto_657018 ) ) ( not ( = ?auto_657016 ?auto_657019 ) ) ( not ( = ?auto_657016 ?auto_657020 ) ) ( not ( = ?auto_657016 ?auto_657021 ) ) ( not ( = ?auto_657016 ?auto_657022 ) ) ( not ( = ?auto_657016 ?auto_657023 ) ) ( not ( = ?auto_657017 ?auto_657018 ) ) ( not ( = ?auto_657017 ?auto_657019 ) ) ( not ( = ?auto_657017 ?auto_657020 ) ) ( not ( = ?auto_657017 ?auto_657021 ) ) ( not ( = ?auto_657017 ?auto_657022 ) ) ( not ( = ?auto_657017 ?auto_657023 ) ) ( not ( = ?auto_657018 ?auto_657019 ) ) ( not ( = ?auto_657018 ?auto_657020 ) ) ( not ( = ?auto_657018 ?auto_657021 ) ) ( not ( = ?auto_657018 ?auto_657022 ) ) ( not ( = ?auto_657018 ?auto_657023 ) ) ( not ( = ?auto_657019 ?auto_657020 ) ) ( not ( = ?auto_657019 ?auto_657021 ) ) ( not ( = ?auto_657019 ?auto_657022 ) ) ( not ( = ?auto_657019 ?auto_657023 ) ) ( not ( = ?auto_657020 ?auto_657021 ) ) ( not ( = ?auto_657020 ?auto_657022 ) ) ( not ( = ?auto_657020 ?auto_657023 ) ) ( not ( = ?auto_657021 ?auto_657022 ) ) ( not ( = ?auto_657021 ?auto_657023 ) ) ( not ( = ?auto_657022 ?auto_657023 ) ) ( ON ?auto_657021 ?auto_657022 ) ( ON ?auto_657020 ?auto_657021 ) ( ON ?auto_657019 ?auto_657020 ) ( ON ?auto_657018 ?auto_657019 ) ( ON ?auto_657017 ?auto_657018 ) ( ON ?auto_657016 ?auto_657017 ) ( ON ?auto_657015 ?auto_657016 ) ( ON ?auto_657014 ?auto_657015 ) ( CLEAR ?auto_657012 ) ( ON ?auto_657013 ?auto_657014 ) ( CLEAR ?auto_657013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_657006 ?auto_657007 ?auto_657008 ?auto_657009 ?auto_657010 ?auto_657011 ?auto_657012 ?auto_657013 )
      ( MAKE-17PILE ?auto_657006 ?auto_657007 ?auto_657008 ?auto_657009 ?auto_657010 ?auto_657011 ?auto_657012 ?auto_657013 ?auto_657014 ?auto_657015 ?auto_657016 ?auto_657017 ?auto_657018 ?auto_657019 ?auto_657020 ?auto_657021 ?auto_657022 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_657041 - BLOCK
      ?auto_657042 - BLOCK
      ?auto_657043 - BLOCK
      ?auto_657044 - BLOCK
      ?auto_657045 - BLOCK
      ?auto_657046 - BLOCK
      ?auto_657047 - BLOCK
      ?auto_657048 - BLOCK
      ?auto_657049 - BLOCK
      ?auto_657050 - BLOCK
      ?auto_657051 - BLOCK
      ?auto_657052 - BLOCK
      ?auto_657053 - BLOCK
      ?auto_657054 - BLOCK
      ?auto_657055 - BLOCK
      ?auto_657056 - BLOCK
      ?auto_657057 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_657057 ) ( ON-TABLE ?auto_657041 ) ( ON ?auto_657042 ?auto_657041 ) ( ON ?auto_657043 ?auto_657042 ) ( ON ?auto_657044 ?auto_657043 ) ( ON ?auto_657045 ?auto_657044 ) ( ON ?auto_657046 ?auto_657045 ) ( ON ?auto_657047 ?auto_657046 ) ( not ( = ?auto_657041 ?auto_657042 ) ) ( not ( = ?auto_657041 ?auto_657043 ) ) ( not ( = ?auto_657041 ?auto_657044 ) ) ( not ( = ?auto_657041 ?auto_657045 ) ) ( not ( = ?auto_657041 ?auto_657046 ) ) ( not ( = ?auto_657041 ?auto_657047 ) ) ( not ( = ?auto_657041 ?auto_657048 ) ) ( not ( = ?auto_657041 ?auto_657049 ) ) ( not ( = ?auto_657041 ?auto_657050 ) ) ( not ( = ?auto_657041 ?auto_657051 ) ) ( not ( = ?auto_657041 ?auto_657052 ) ) ( not ( = ?auto_657041 ?auto_657053 ) ) ( not ( = ?auto_657041 ?auto_657054 ) ) ( not ( = ?auto_657041 ?auto_657055 ) ) ( not ( = ?auto_657041 ?auto_657056 ) ) ( not ( = ?auto_657041 ?auto_657057 ) ) ( not ( = ?auto_657042 ?auto_657043 ) ) ( not ( = ?auto_657042 ?auto_657044 ) ) ( not ( = ?auto_657042 ?auto_657045 ) ) ( not ( = ?auto_657042 ?auto_657046 ) ) ( not ( = ?auto_657042 ?auto_657047 ) ) ( not ( = ?auto_657042 ?auto_657048 ) ) ( not ( = ?auto_657042 ?auto_657049 ) ) ( not ( = ?auto_657042 ?auto_657050 ) ) ( not ( = ?auto_657042 ?auto_657051 ) ) ( not ( = ?auto_657042 ?auto_657052 ) ) ( not ( = ?auto_657042 ?auto_657053 ) ) ( not ( = ?auto_657042 ?auto_657054 ) ) ( not ( = ?auto_657042 ?auto_657055 ) ) ( not ( = ?auto_657042 ?auto_657056 ) ) ( not ( = ?auto_657042 ?auto_657057 ) ) ( not ( = ?auto_657043 ?auto_657044 ) ) ( not ( = ?auto_657043 ?auto_657045 ) ) ( not ( = ?auto_657043 ?auto_657046 ) ) ( not ( = ?auto_657043 ?auto_657047 ) ) ( not ( = ?auto_657043 ?auto_657048 ) ) ( not ( = ?auto_657043 ?auto_657049 ) ) ( not ( = ?auto_657043 ?auto_657050 ) ) ( not ( = ?auto_657043 ?auto_657051 ) ) ( not ( = ?auto_657043 ?auto_657052 ) ) ( not ( = ?auto_657043 ?auto_657053 ) ) ( not ( = ?auto_657043 ?auto_657054 ) ) ( not ( = ?auto_657043 ?auto_657055 ) ) ( not ( = ?auto_657043 ?auto_657056 ) ) ( not ( = ?auto_657043 ?auto_657057 ) ) ( not ( = ?auto_657044 ?auto_657045 ) ) ( not ( = ?auto_657044 ?auto_657046 ) ) ( not ( = ?auto_657044 ?auto_657047 ) ) ( not ( = ?auto_657044 ?auto_657048 ) ) ( not ( = ?auto_657044 ?auto_657049 ) ) ( not ( = ?auto_657044 ?auto_657050 ) ) ( not ( = ?auto_657044 ?auto_657051 ) ) ( not ( = ?auto_657044 ?auto_657052 ) ) ( not ( = ?auto_657044 ?auto_657053 ) ) ( not ( = ?auto_657044 ?auto_657054 ) ) ( not ( = ?auto_657044 ?auto_657055 ) ) ( not ( = ?auto_657044 ?auto_657056 ) ) ( not ( = ?auto_657044 ?auto_657057 ) ) ( not ( = ?auto_657045 ?auto_657046 ) ) ( not ( = ?auto_657045 ?auto_657047 ) ) ( not ( = ?auto_657045 ?auto_657048 ) ) ( not ( = ?auto_657045 ?auto_657049 ) ) ( not ( = ?auto_657045 ?auto_657050 ) ) ( not ( = ?auto_657045 ?auto_657051 ) ) ( not ( = ?auto_657045 ?auto_657052 ) ) ( not ( = ?auto_657045 ?auto_657053 ) ) ( not ( = ?auto_657045 ?auto_657054 ) ) ( not ( = ?auto_657045 ?auto_657055 ) ) ( not ( = ?auto_657045 ?auto_657056 ) ) ( not ( = ?auto_657045 ?auto_657057 ) ) ( not ( = ?auto_657046 ?auto_657047 ) ) ( not ( = ?auto_657046 ?auto_657048 ) ) ( not ( = ?auto_657046 ?auto_657049 ) ) ( not ( = ?auto_657046 ?auto_657050 ) ) ( not ( = ?auto_657046 ?auto_657051 ) ) ( not ( = ?auto_657046 ?auto_657052 ) ) ( not ( = ?auto_657046 ?auto_657053 ) ) ( not ( = ?auto_657046 ?auto_657054 ) ) ( not ( = ?auto_657046 ?auto_657055 ) ) ( not ( = ?auto_657046 ?auto_657056 ) ) ( not ( = ?auto_657046 ?auto_657057 ) ) ( not ( = ?auto_657047 ?auto_657048 ) ) ( not ( = ?auto_657047 ?auto_657049 ) ) ( not ( = ?auto_657047 ?auto_657050 ) ) ( not ( = ?auto_657047 ?auto_657051 ) ) ( not ( = ?auto_657047 ?auto_657052 ) ) ( not ( = ?auto_657047 ?auto_657053 ) ) ( not ( = ?auto_657047 ?auto_657054 ) ) ( not ( = ?auto_657047 ?auto_657055 ) ) ( not ( = ?auto_657047 ?auto_657056 ) ) ( not ( = ?auto_657047 ?auto_657057 ) ) ( not ( = ?auto_657048 ?auto_657049 ) ) ( not ( = ?auto_657048 ?auto_657050 ) ) ( not ( = ?auto_657048 ?auto_657051 ) ) ( not ( = ?auto_657048 ?auto_657052 ) ) ( not ( = ?auto_657048 ?auto_657053 ) ) ( not ( = ?auto_657048 ?auto_657054 ) ) ( not ( = ?auto_657048 ?auto_657055 ) ) ( not ( = ?auto_657048 ?auto_657056 ) ) ( not ( = ?auto_657048 ?auto_657057 ) ) ( not ( = ?auto_657049 ?auto_657050 ) ) ( not ( = ?auto_657049 ?auto_657051 ) ) ( not ( = ?auto_657049 ?auto_657052 ) ) ( not ( = ?auto_657049 ?auto_657053 ) ) ( not ( = ?auto_657049 ?auto_657054 ) ) ( not ( = ?auto_657049 ?auto_657055 ) ) ( not ( = ?auto_657049 ?auto_657056 ) ) ( not ( = ?auto_657049 ?auto_657057 ) ) ( not ( = ?auto_657050 ?auto_657051 ) ) ( not ( = ?auto_657050 ?auto_657052 ) ) ( not ( = ?auto_657050 ?auto_657053 ) ) ( not ( = ?auto_657050 ?auto_657054 ) ) ( not ( = ?auto_657050 ?auto_657055 ) ) ( not ( = ?auto_657050 ?auto_657056 ) ) ( not ( = ?auto_657050 ?auto_657057 ) ) ( not ( = ?auto_657051 ?auto_657052 ) ) ( not ( = ?auto_657051 ?auto_657053 ) ) ( not ( = ?auto_657051 ?auto_657054 ) ) ( not ( = ?auto_657051 ?auto_657055 ) ) ( not ( = ?auto_657051 ?auto_657056 ) ) ( not ( = ?auto_657051 ?auto_657057 ) ) ( not ( = ?auto_657052 ?auto_657053 ) ) ( not ( = ?auto_657052 ?auto_657054 ) ) ( not ( = ?auto_657052 ?auto_657055 ) ) ( not ( = ?auto_657052 ?auto_657056 ) ) ( not ( = ?auto_657052 ?auto_657057 ) ) ( not ( = ?auto_657053 ?auto_657054 ) ) ( not ( = ?auto_657053 ?auto_657055 ) ) ( not ( = ?auto_657053 ?auto_657056 ) ) ( not ( = ?auto_657053 ?auto_657057 ) ) ( not ( = ?auto_657054 ?auto_657055 ) ) ( not ( = ?auto_657054 ?auto_657056 ) ) ( not ( = ?auto_657054 ?auto_657057 ) ) ( not ( = ?auto_657055 ?auto_657056 ) ) ( not ( = ?auto_657055 ?auto_657057 ) ) ( not ( = ?auto_657056 ?auto_657057 ) ) ( ON ?auto_657056 ?auto_657057 ) ( ON ?auto_657055 ?auto_657056 ) ( ON ?auto_657054 ?auto_657055 ) ( ON ?auto_657053 ?auto_657054 ) ( ON ?auto_657052 ?auto_657053 ) ( ON ?auto_657051 ?auto_657052 ) ( ON ?auto_657050 ?auto_657051 ) ( ON ?auto_657049 ?auto_657050 ) ( CLEAR ?auto_657047 ) ( ON ?auto_657048 ?auto_657049 ) ( CLEAR ?auto_657048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_657041 ?auto_657042 ?auto_657043 ?auto_657044 ?auto_657045 ?auto_657046 ?auto_657047 ?auto_657048 )
      ( MAKE-17PILE ?auto_657041 ?auto_657042 ?auto_657043 ?auto_657044 ?auto_657045 ?auto_657046 ?auto_657047 ?auto_657048 ?auto_657049 ?auto_657050 ?auto_657051 ?auto_657052 ?auto_657053 ?auto_657054 ?auto_657055 ?auto_657056 ?auto_657057 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_657075 - BLOCK
      ?auto_657076 - BLOCK
      ?auto_657077 - BLOCK
      ?auto_657078 - BLOCK
      ?auto_657079 - BLOCK
      ?auto_657080 - BLOCK
      ?auto_657081 - BLOCK
      ?auto_657082 - BLOCK
      ?auto_657083 - BLOCK
      ?auto_657084 - BLOCK
      ?auto_657085 - BLOCK
      ?auto_657086 - BLOCK
      ?auto_657087 - BLOCK
      ?auto_657088 - BLOCK
      ?auto_657089 - BLOCK
      ?auto_657090 - BLOCK
      ?auto_657091 - BLOCK
    )
    :vars
    (
      ?auto_657092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_657091 ?auto_657092 ) ( ON-TABLE ?auto_657075 ) ( ON ?auto_657076 ?auto_657075 ) ( ON ?auto_657077 ?auto_657076 ) ( ON ?auto_657078 ?auto_657077 ) ( ON ?auto_657079 ?auto_657078 ) ( ON ?auto_657080 ?auto_657079 ) ( not ( = ?auto_657075 ?auto_657076 ) ) ( not ( = ?auto_657075 ?auto_657077 ) ) ( not ( = ?auto_657075 ?auto_657078 ) ) ( not ( = ?auto_657075 ?auto_657079 ) ) ( not ( = ?auto_657075 ?auto_657080 ) ) ( not ( = ?auto_657075 ?auto_657081 ) ) ( not ( = ?auto_657075 ?auto_657082 ) ) ( not ( = ?auto_657075 ?auto_657083 ) ) ( not ( = ?auto_657075 ?auto_657084 ) ) ( not ( = ?auto_657075 ?auto_657085 ) ) ( not ( = ?auto_657075 ?auto_657086 ) ) ( not ( = ?auto_657075 ?auto_657087 ) ) ( not ( = ?auto_657075 ?auto_657088 ) ) ( not ( = ?auto_657075 ?auto_657089 ) ) ( not ( = ?auto_657075 ?auto_657090 ) ) ( not ( = ?auto_657075 ?auto_657091 ) ) ( not ( = ?auto_657075 ?auto_657092 ) ) ( not ( = ?auto_657076 ?auto_657077 ) ) ( not ( = ?auto_657076 ?auto_657078 ) ) ( not ( = ?auto_657076 ?auto_657079 ) ) ( not ( = ?auto_657076 ?auto_657080 ) ) ( not ( = ?auto_657076 ?auto_657081 ) ) ( not ( = ?auto_657076 ?auto_657082 ) ) ( not ( = ?auto_657076 ?auto_657083 ) ) ( not ( = ?auto_657076 ?auto_657084 ) ) ( not ( = ?auto_657076 ?auto_657085 ) ) ( not ( = ?auto_657076 ?auto_657086 ) ) ( not ( = ?auto_657076 ?auto_657087 ) ) ( not ( = ?auto_657076 ?auto_657088 ) ) ( not ( = ?auto_657076 ?auto_657089 ) ) ( not ( = ?auto_657076 ?auto_657090 ) ) ( not ( = ?auto_657076 ?auto_657091 ) ) ( not ( = ?auto_657076 ?auto_657092 ) ) ( not ( = ?auto_657077 ?auto_657078 ) ) ( not ( = ?auto_657077 ?auto_657079 ) ) ( not ( = ?auto_657077 ?auto_657080 ) ) ( not ( = ?auto_657077 ?auto_657081 ) ) ( not ( = ?auto_657077 ?auto_657082 ) ) ( not ( = ?auto_657077 ?auto_657083 ) ) ( not ( = ?auto_657077 ?auto_657084 ) ) ( not ( = ?auto_657077 ?auto_657085 ) ) ( not ( = ?auto_657077 ?auto_657086 ) ) ( not ( = ?auto_657077 ?auto_657087 ) ) ( not ( = ?auto_657077 ?auto_657088 ) ) ( not ( = ?auto_657077 ?auto_657089 ) ) ( not ( = ?auto_657077 ?auto_657090 ) ) ( not ( = ?auto_657077 ?auto_657091 ) ) ( not ( = ?auto_657077 ?auto_657092 ) ) ( not ( = ?auto_657078 ?auto_657079 ) ) ( not ( = ?auto_657078 ?auto_657080 ) ) ( not ( = ?auto_657078 ?auto_657081 ) ) ( not ( = ?auto_657078 ?auto_657082 ) ) ( not ( = ?auto_657078 ?auto_657083 ) ) ( not ( = ?auto_657078 ?auto_657084 ) ) ( not ( = ?auto_657078 ?auto_657085 ) ) ( not ( = ?auto_657078 ?auto_657086 ) ) ( not ( = ?auto_657078 ?auto_657087 ) ) ( not ( = ?auto_657078 ?auto_657088 ) ) ( not ( = ?auto_657078 ?auto_657089 ) ) ( not ( = ?auto_657078 ?auto_657090 ) ) ( not ( = ?auto_657078 ?auto_657091 ) ) ( not ( = ?auto_657078 ?auto_657092 ) ) ( not ( = ?auto_657079 ?auto_657080 ) ) ( not ( = ?auto_657079 ?auto_657081 ) ) ( not ( = ?auto_657079 ?auto_657082 ) ) ( not ( = ?auto_657079 ?auto_657083 ) ) ( not ( = ?auto_657079 ?auto_657084 ) ) ( not ( = ?auto_657079 ?auto_657085 ) ) ( not ( = ?auto_657079 ?auto_657086 ) ) ( not ( = ?auto_657079 ?auto_657087 ) ) ( not ( = ?auto_657079 ?auto_657088 ) ) ( not ( = ?auto_657079 ?auto_657089 ) ) ( not ( = ?auto_657079 ?auto_657090 ) ) ( not ( = ?auto_657079 ?auto_657091 ) ) ( not ( = ?auto_657079 ?auto_657092 ) ) ( not ( = ?auto_657080 ?auto_657081 ) ) ( not ( = ?auto_657080 ?auto_657082 ) ) ( not ( = ?auto_657080 ?auto_657083 ) ) ( not ( = ?auto_657080 ?auto_657084 ) ) ( not ( = ?auto_657080 ?auto_657085 ) ) ( not ( = ?auto_657080 ?auto_657086 ) ) ( not ( = ?auto_657080 ?auto_657087 ) ) ( not ( = ?auto_657080 ?auto_657088 ) ) ( not ( = ?auto_657080 ?auto_657089 ) ) ( not ( = ?auto_657080 ?auto_657090 ) ) ( not ( = ?auto_657080 ?auto_657091 ) ) ( not ( = ?auto_657080 ?auto_657092 ) ) ( not ( = ?auto_657081 ?auto_657082 ) ) ( not ( = ?auto_657081 ?auto_657083 ) ) ( not ( = ?auto_657081 ?auto_657084 ) ) ( not ( = ?auto_657081 ?auto_657085 ) ) ( not ( = ?auto_657081 ?auto_657086 ) ) ( not ( = ?auto_657081 ?auto_657087 ) ) ( not ( = ?auto_657081 ?auto_657088 ) ) ( not ( = ?auto_657081 ?auto_657089 ) ) ( not ( = ?auto_657081 ?auto_657090 ) ) ( not ( = ?auto_657081 ?auto_657091 ) ) ( not ( = ?auto_657081 ?auto_657092 ) ) ( not ( = ?auto_657082 ?auto_657083 ) ) ( not ( = ?auto_657082 ?auto_657084 ) ) ( not ( = ?auto_657082 ?auto_657085 ) ) ( not ( = ?auto_657082 ?auto_657086 ) ) ( not ( = ?auto_657082 ?auto_657087 ) ) ( not ( = ?auto_657082 ?auto_657088 ) ) ( not ( = ?auto_657082 ?auto_657089 ) ) ( not ( = ?auto_657082 ?auto_657090 ) ) ( not ( = ?auto_657082 ?auto_657091 ) ) ( not ( = ?auto_657082 ?auto_657092 ) ) ( not ( = ?auto_657083 ?auto_657084 ) ) ( not ( = ?auto_657083 ?auto_657085 ) ) ( not ( = ?auto_657083 ?auto_657086 ) ) ( not ( = ?auto_657083 ?auto_657087 ) ) ( not ( = ?auto_657083 ?auto_657088 ) ) ( not ( = ?auto_657083 ?auto_657089 ) ) ( not ( = ?auto_657083 ?auto_657090 ) ) ( not ( = ?auto_657083 ?auto_657091 ) ) ( not ( = ?auto_657083 ?auto_657092 ) ) ( not ( = ?auto_657084 ?auto_657085 ) ) ( not ( = ?auto_657084 ?auto_657086 ) ) ( not ( = ?auto_657084 ?auto_657087 ) ) ( not ( = ?auto_657084 ?auto_657088 ) ) ( not ( = ?auto_657084 ?auto_657089 ) ) ( not ( = ?auto_657084 ?auto_657090 ) ) ( not ( = ?auto_657084 ?auto_657091 ) ) ( not ( = ?auto_657084 ?auto_657092 ) ) ( not ( = ?auto_657085 ?auto_657086 ) ) ( not ( = ?auto_657085 ?auto_657087 ) ) ( not ( = ?auto_657085 ?auto_657088 ) ) ( not ( = ?auto_657085 ?auto_657089 ) ) ( not ( = ?auto_657085 ?auto_657090 ) ) ( not ( = ?auto_657085 ?auto_657091 ) ) ( not ( = ?auto_657085 ?auto_657092 ) ) ( not ( = ?auto_657086 ?auto_657087 ) ) ( not ( = ?auto_657086 ?auto_657088 ) ) ( not ( = ?auto_657086 ?auto_657089 ) ) ( not ( = ?auto_657086 ?auto_657090 ) ) ( not ( = ?auto_657086 ?auto_657091 ) ) ( not ( = ?auto_657086 ?auto_657092 ) ) ( not ( = ?auto_657087 ?auto_657088 ) ) ( not ( = ?auto_657087 ?auto_657089 ) ) ( not ( = ?auto_657087 ?auto_657090 ) ) ( not ( = ?auto_657087 ?auto_657091 ) ) ( not ( = ?auto_657087 ?auto_657092 ) ) ( not ( = ?auto_657088 ?auto_657089 ) ) ( not ( = ?auto_657088 ?auto_657090 ) ) ( not ( = ?auto_657088 ?auto_657091 ) ) ( not ( = ?auto_657088 ?auto_657092 ) ) ( not ( = ?auto_657089 ?auto_657090 ) ) ( not ( = ?auto_657089 ?auto_657091 ) ) ( not ( = ?auto_657089 ?auto_657092 ) ) ( not ( = ?auto_657090 ?auto_657091 ) ) ( not ( = ?auto_657090 ?auto_657092 ) ) ( not ( = ?auto_657091 ?auto_657092 ) ) ( ON ?auto_657090 ?auto_657091 ) ( ON ?auto_657089 ?auto_657090 ) ( ON ?auto_657088 ?auto_657089 ) ( ON ?auto_657087 ?auto_657088 ) ( ON ?auto_657086 ?auto_657087 ) ( ON ?auto_657085 ?auto_657086 ) ( ON ?auto_657084 ?auto_657085 ) ( ON ?auto_657083 ?auto_657084 ) ( ON ?auto_657082 ?auto_657083 ) ( CLEAR ?auto_657080 ) ( ON ?auto_657081 ?auto_657082 ) ( CLEAR ?auto_657081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_657075 ?auto_657076 ?auto_657077 ?auto_657078 ?auto_657079 ?auto_657080 ?auto_657081 )
      ( MAKE-17PILE ?auto_657075 ?auto_657076 ?auto_657077 ?auto_657078 ?auto_657079 ?auto_657080 ?auto_657081 ?auto_657082 ?auto_657083 ?auto_657084 ?auto_657085 ?auto_657086 ?auto_657087 ?auto_657088 ?auto_657089 ?auto_657090 ?auto_657091 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_657110 - BLOCK
      ?auto_657111 - BLOCK
      ?auto_657112 - BLOCK
      ?auto_657113 - BLOCK
      ?auto_657114 - BLOCK
      ?auto_657115 - BLOCK
      ?auto_657116 - BLOCK
      ?auto_657117 - BLOCK
      ?auto_657118 - BLOCK
      ?auto_657119 - BLOCK
      ?auto_657120 - BLOCK
      ?auto_657121 - BLOCK
      ?auto_657122 - BLOCK
      ?auto_657123 - BLOCK
      ?auto_657124 - BLOCK
      ?auto_657125 - BLOCK
      ?auto_657126 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_657126 ) ( ON-TABLE ?auto_657110 ) ( ON ?auto_657111 ?auto_657110 ) ( ON ?auto_657112 ?auto_657111 ) ( ON ?auto_657113 ?auto_657112 ) ( ON ?auto_657114 ?auto_657113 ) ( ON ?auto_657115 ?auto_657114 ) ( not ( = ?auto_657110 ?auto_657111 ) ) ( not ( = ?auto_657110 ?auto_657112 ) ) ( not ( = ?auto_657110 ?auto_657113 ) ) ( not ( = ?auto_657110 ?auto_657114 ) ) ( not ( = ?auto_657110 ?auto_657115 ) ) ( not ( = ?auto_657110 ?auto_657116 ) ) ( not ( = ?auto_657110 ?auto_657117 ) ) ( not ( = ?auto_657110 ?auto_657118 ) ) ( not ( = ?auto_657110 ?auto_657119 ) ) ( not ( = ?auto_657110 ?auto_657120 ) ) ( not ( = ?auto_657110 ?auto_657121 ) ) ( not ( = ?auto_657110 ?auto_657122 ) ) ( not ( = ?auto_657110 ?auto_657123 ) ) ( not ( = ?auto_657110 ?auto_657124 ) ) ( not ( = ?auto_657110 ?auto_657125 ) ) ( not ( = ?auto_657110 ?auto_657126 ) ) ( not ( = ?auto_657111 ?auto_657112 ) ) ( not ( = ?auto_657111 ?auto_657113 ) ) ( not ( = ?auto_657111 ?auto_657114 ) ) ( not ( = ?auto_657111 ?auto_657115 ) ) ( not ( = ?auto_657111 ?auto_657116 ) ) ( not ( = ?auto_657111 ?auto_657117 ) ) ( not ( = ?auto_657111 ?auto_657118 ) ) ( not ( = ?auto_657111 ?auto_657119 ) ) ( not ( = ?auto_657111 ?auto_657120 ) ) ( not ( = ?auto_657111 ?auto_657121 ) ) ( not ( = ?auto_657111 ?auto_657122 ) ) ( not ( = ?auto_657111 ?auto_657123 ) ) ( not ( = ?auto_657111 ?auto_657124 ) ) ( not ( = ?auto_657111 ?auto_657125 ) ) ( not ( = ?auto_657111 ?auto_657126 ) ) ( not ( = ?auto_657112 ?auto_657113 ) ) ( not ( = ?auto_657112 ?auto_657114 ) ) ( not ( = ?auto_657112 ?auto_657115 ) ) ( not ( = ?auto_657112 ?auto_657116 ) ) ( not ( = ?auto_657112 ?auto_657117 ) ) ( not ( = ?auto_657112 ?auto_657118 ) ) ( not ( = ?auto_657112 ?auto_657119 ) ) ( not ( = ?auto_657112 ?auto_657120 ) ) ( not ( = ?auto_657112 ?auto_657121 ) ) ( not ( = ?auto_657112 ?auto_657122 ) ) ( not ( = ?auto_657112 ?auto_657123 ) ) ( not ( = ?auto_657112 ?auto_657124 ) ) ( not ( = ?auto_657112 ?auto_657125 ) ) ( not ( = ?auto_657112 ?auto_657126 ) ) ( not ( = ?auto_657113 ?auto_657114 ) ) ( not ( = ?auto_657113 ?auto_657115 ) ) ( not ( = ?auto_657113 ?auto_657116 ) ) ( not ( = ?auto_657113 ?auto_657117 ) ) ( not ( = ?auto_657113 ?auto_657118 ) ) ( not ( = ?auto_657113 ?auto_657119 ) ) ( not ( = ?auto_657113 ?auto_657120 ) ) ( not ( = ?auto_657113 ?auto_657121 ) ) ( not ( = ?auto_657113 ?auto_657122 ) ) ( not ( = ?auto_657113 ?auto_657123 ) ) ( not ( = ?auto_657113 ?auto_657124 ) ) ( not ( = ?auto_657113 ?auto_657125 ) ) ( not ( = ?auto_657113 ?auto_657126 ) ) ( not ( = ?auto_657114 ?auto_657115 ) ) ( not ( = ?auto_657114 ?auto_657116 ) ) ( not ( = ?auto_657114 ?auto_657117 ) ) ( not ( = ?auto_657114 ?auto_657118 ) ) ( not ( = ?auto_657114 ?auto_657119 ) ) ( not ( = ?auto_657114 ?auto_657120 ) ) ( not ( = ?auto_657114 ?auto_657121 ) ) ( not ( = ?auto_657114 ?auto_657122 ) ) ( not ( = ?auto_657114 ?auto_657123 ) ) ( not ( = ?auto_657114 ?auto_657124 ) ) ( not ( = ?auto_657114 ?auto_657125 ) ) ( not ( = ?auto_657114 ?auto_657126 ) ) ( not ( = ?auto_657115 ?auto_657116 ) ) ( not ( = ?auto_657115 ?auto_657117 ) ) ( not ( = ?auto_657115 ?auto_657118 ) ) ( not ( = ?auto_657115 ?auto_657119 ) ) ( not ( = ?auto_657115 ?auto_657120 ) ) ( not ( = ?auto_657115 ?auto_657121 ) ) ( not ( = ?auto_657115 ?auto_657122 ) ) ( not ( = ?auto_657115 ?auto_657123 ) ) ( not ( = ?auto_657115 ?auto_657124 ) ) ( not ( = ?auto_657115 ?auto_657125 ) ) ( not ( = ?auto_657115 ?auto_657126 ) ) ( not ( = ?auto_657116 ?auto_657117 ) ) ( not ( = ?auto_657116 ?auto_657118 ) ) ( not ( = ?auto_657116 ?auto_657119 ) ) ( not ( = ?auto_657116 ?auto_657120 ) ) ( not ( = ?auto_657116 ?auto_657121 ) ) ( not ( = ?auto_657116 ?auto_657122 ) ) ( not ( = ?auto_657116 ?auto_657123 ) ) ( not ( = ?auto_657116 ?auto_657124 ) ) ( not ( = ?auto_657116 ?auto_657125 ) ) ( not ( = ?auto_657116 ?auto_657126 ) ) ( not ( = ?auto_657117 ?auto_657118 ) ) ( not ( = ?auto_657117 ?auto_657119 ) ) ( not ( = ?auto_657117 ?auto_657120 ) ) ( not ( = ?auto_657117 ?auto_657121 ) ) ( not ( = ?auto_657117 ?auto_657122 ) ) ( not ( = ?auto_657117 ?auto_657123 ) ) ( not ( = ?auto_657117 ?auto_657124 ) ) ( not ( = ?auto_657117 ?auto_657125 ) ) ( not ( = ?auto_657117 ?auto_657126 ) ) ( not ( = ?auto_657118 ?auto_657119 ) ) ( not ( = ?auto_657118 ?auto_657120 ) ) ( not ( = ?auto_657118 ?auto_657121 ) ) ( not ( = ?auto_657118 ?auto_657122 ) ) ( not ( = ?auto_657118 ?auto_657123 ) ) ( not ( = ?auto_657118 ?auto_657124 ) ) ( not ( = ?auto_657118 ?auto_657125 ) ) ( not ( = ?auto_657118 ?auto_657126 ) ) ( not ( = ?auto_657119 ?auto_657120 ) ) ( not ( = ?auto_657119 ?auto_657121 ) ) ( not ( = ?auto_657119 ?auto_657122 ) ) ( not ( = ?auto_657119 ?auto_657123 ) ) ( not ( = ?auto_657119 ?auto_657124 ) ) ( not ( = ?auto_657119 ?auto_657125 ) ) ( not ( = ?auto_657119 ?auto_657126 ) ) ( not ( = ?auto_657120 ?auto_657121 ) ) ( not ( = ?auto_657120 ?auto_657122 ) ) ( not ( = ?auto_657120 ?auto_657123 ) ) ( not ( = ?auto_657120 ?auto_657124 ) ) ( not ( = ?auto_657120 ?auto_657125 ) ) ( not ( = ?auto_657120 ?auto_657126 ) ) ( not ( = ?auto_657121 ?auto_657122 ) ) ( not ( = ?auto_657121 ?auto_657123 ) ) ( not ( = ?auto_657121 ?auto_657124 ) ) ( not ( = ?auto_657121 ?auto_657125 ) ) ( not ( = ?auto_657121 ?auto_657126 ) ) ( not ( = ?auto_657122 ?auto_657123 ) ) ( not ( = ?auto_657122 ?auto_657124 ) ) ( not ( = ?auto_657122 ?auto_657125 ) ) ( not ( = ?auto_657122 ?auto_657126 ) ) ( not ( = ?auto_657123 ?auto_657124 ) ) ( not ( = ?auto_657123 ?auto_657125 ) ) ( not ( = ?auto_657123 ?auto_657126 ) ) ( not ( = ?auto_657124 ?auto_657125 ) ) ( not ( = ?auto_657124 ?auto_657126 ) ) ( not ( = ?auto_657125 ?auto_657126 ) ) ( ON ?auto_657125 ?auto_657126 ) ( ON ?auto_657124 ?auto_657125 ) ( ON ?auto_657123 ?auto_657124 ) ( ON ?auto_657122 ?auto_657123 ) ( ON ?auto_657121 ?auto_657122 ) ( ON ?auto_657120 ?auto_657121 ) ( ON ?auto_657119 ?auto_657120 ) ( ON ?auto_657118 ?auto_657119 ) ( ON ?auto_657117 ?auto_657118 ) ( CLEAR ?auto_657115 ) ( ON ?auto_657116 ?auto_657117 ) ( CLEAR ?auto_657116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_657110 ?auto_657111 ?auto_657112 ?auto_657113 ?auto_657114 ?auto_657115 ?auto_657116 )
      ( MAKE-17PILE ?auto_657110 ?auto_657111 ?auto_657112 ?auto_657113 ?auto_657114 ?auto_657115 ?auto_657116 ?auto_657117 ?auto_657118 ?auto_657119 ?auto_657120 ?auto_657121 ?auto_657122 ?auto_657123 ?auto_657124 ?auto_657125 ?auto_657126 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_657144 - BLOCK
      ?auto_657145 - BLOCK
      ?auto_657146 - BLOCK
      ?auto_657147 - BLOCK
      ?auto_657148 - BLOCK
      ?auto_657149 - BLOCK
      ?auto_657150 - BLOCK
      ?auto_657151 - BLOCK
      ?auto_657152 - BLOCK
      ?auto_657153 - BLOCK
      ?auto_657154 - BLOCK
      ?auto_657155 - BLOCK
      ?auto_657156 - BLOCK
      ?auto_657157 - BLOCK
      ?auto_657158 - BLOCK
      ?auto_657159 - BLOCK
      ?auto_657160 - BLOCK
    )
    :vars
    (
      ?auto_657161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_657160 ?auto_657161 ) ( ON-TABLE ?auto_657144 ) ( ON ?auto_657145 ?auto_657144 ) ( ON ?auto_657146 ?auto_657145 ) ( ON ?auto_657147 ?auto_657146 ) ( ON ?auto_657148 ?auto_657147 ) ( not ( = ?auto_657144 ?auto_657145 ) ) ( not ( = ?auto_657144 ?auto_657146 ) ) ( not ( = ?auto_657144 ?auto_657147 ) ) ( not ( = ?auto_657144 ?auto_657148 ) ) ( not ( = ?auto_657144 ?auto_657149 ) ) ( not ( = ?auto_657144 ?auto_657150 ) ) ( not ( = ?auto_657144 ?auto_657151 ) ) ( not ( = ?auto_657144 ?auto_657152 ) ) ( not ( = ?auto_657144 ?auto_657153 ) ) ( not ( = ?auto_657144 ?auto_657154 ) ) ( not ( = ?auto_657144 ?auto_657155 ) ) ( not ( = ?auto_657144 ?auto_657156 ) ) ( not ( = ?auto_657144 ?auto_657157 ) ) ( not ( = ?auto_657144 ?auto_657158 ) ) ( not ( = ?auto_657144 ?auto_657159 ) ) ( not ( = ?auto_657144 ?auto_657160 ) ) ( not ( = ?auto_657144 ?auto_657161 ) ) ( not ( = ?auto_657145 ?auto_657146 ) ) ( not ( = ?auto_657145 ?auto_657147 ) ) ( not ( = ?auto_657145 ?auto_657148 ) ) ( not ( = ?auto_657145 ?auto_657149 ) ) ( not ( = ?auto_657145 ?auto_657150 ) ) ( not ( = ?auto_657145 ?auto_657151 ) ) ( not ( = ?auto_657145 ?auto_657152 ) ) ( not ( = ?auto_657145 ?auto_657153 ) ) ( not ( = ?auto_657145 ?auto_657154 ) ) ( not ( = ?auto_657145 ?auto_657155 ) ) ( not ( = ?auto_657145 ?auto_657156 ) ) ( not ( = ?auto_657145 ?auto_657157 ) ) ( not ( = ?auto_657145 ?auto_657158 ) ) ( not ( = ?auto_657145 ?auto_657159 ) ) ( not ( = ?auto_657145 ?auto_657160 ) ) ( not ( = ?auto_657145 ?auto_657161 ) ) ( not ( = ?auto_657146 ?auto_657147 ) ) ( not ( = ?auto_657146 ?auto_657148 ) ) ( not ( = ?auto_657146 ?auto_657149 ) ) ( not ( = ?auto_657146 ?auto_657150 ) ) ( not ( = ?auto_657146 ?auto_657151 ) ) ( not ( = ?auto_657146 ?auto_657152 ) ) ( not ( = ?auto_657146 ?auto_657153 ) ) ( not ( = ?auto_657146 ?auto_657154 ) ) ( not ( = ?auto_657146 ?auto_657155 ) ) ( not ( = ?auto_657146 ?auto_657156 ) ) ( not ( = ?auto_657146 ?auto_657157 ) ) ( not ( = ?auto_657146 ?auto_657158 ) ) ( not ( = ?auto_657146 ?auto_657159 ) ) ( not ( = ?auto_657146 ?auto_657160 ) ) ( not ( = ?auto_657146 ?auto_657161 ) ) ( not ( = ?auto_657147 ?auto_657148 ) ) ( not ( = ?auto_657147 ?auto_657149 ) ) ( not ( = ?auto_657147 ?auto_657150 ) ) ( not ( = ?auto_657147 ?auto_657151 ) ) ( not ( = ?auto_657147 ?auto_657152 ) ) ( not ( = ?auto_657147 ?auto_657153 ) ) ( not ( = ?auto_657147 ?auto_657154 ) ) ( not ( = ?auto_657147 ?auto_657155 ) ) ( not ( = ?auto_657147 ?auto_657156 ) ) ( not ( = ?auto_657147 ?auto_657157 ) ) ( not ( = ?auto_657147 ?auto_657158 ) ) ( not ( = ?auto_657147 ?auto_657159 ) ) ( not ( = ?auto_657147 ?auto_657160 ) ) ( not ( = ?auto_657147 ?auto_657161 ) ) ( not ( = ?auto_657148 ?auto_657149 ) ) ( not ( = ?auto_657148 ?auto_657150 ) ) ( not ( = ?auto_657148 ?auto_657151 ) ) ( not ( = ?auto_657148 ?auto_657152 ) ) ( not ( = ?auto_657148 ?auto_657153 ) ) ( not ( = ?auto_657148 ?auto_657154 ) ) ( not ( = ?auto_657148 ?auto_657155 ) ) ( not ( = ?auto_657148 ?auto_657156 ) ) ( not ( = ?auto_657148 ?auto_657157 ) ) ( not ( = ?auto_657148 ?auto_657158 ) ) ( not ( = ?auto_657148 ?auto_657159 ) ) ( not ( = ?auto_657148 ?auto_657160 ) ) ( not ( = ?auto_657148 ?auto_657161 ) ) ( not ( = ?auto_657149 ?auto_657150 ) ) ( not ( = ?auto_657149 ?auto_657151 ) ) ( not ( = ?auto_657149 ?auto_657152 ) ) ( not ( = ?auto_657149 ?auto_657153 ) ) ( not ( = ?auto_657149 ?auto_657154 ) ) ( not ( = ?auto_657149 ?auto_657155 ) ) ( not ( = ?auto_657149 ?auto_657156 ) ) ( not ( = ?auto_657149 ?auto_657157 ) ) ( not ( = ?auto_657149 ?auto_657158 ) ) ( not ( = ?auto_657149 ?auto_657159 ) ) ( not ( = ?auto_657149 ?auto_657160 ) ) ( not ( = ?auto_657149 ?auto_657161 ) ) ( not ( = ?auto_657150 ?auto_657151 ) ) ( not ( = ?auto_657150 ?auto_657152 ) ) ( not ( = ?auto_657150 ?auto_657153 ) ) ( not ( = ?auto_657150 ?auto_657154 ) ) ( not ( = ?auto_657150 ?auto_657155 ) ) ( not ( = ?auto_657150 ?auto_657156 ) ) ( not ( = ?auto_657150 ?auto_657157 ) ) ( not ( = ?auto_657150 ?auto_657158 ) ) ( not ( = ?auto_657150 ?auto_657159 ) ) ( not ( = ?auto_657150 ?auto_657160 ) ) ( not ( = ?auto_657150 ?auto_657161 ) ) ( not ( = ?auto_657151 ?auto_657152 ) ) ( not ( = ?auto_657151 ?auto_657153 ) ) ( not ( = ?auto_657151 ?auto_657154 ) ) ( not ( = ?auto_657151 ?auto_657155 ) ) ( not ( = ?auto_657151 ?auto_657156 ) ) ( not ( = ?auto_657151 ?auto_657157 ) ) ( not ( = ?auto_657151 ?auto_657158 ) ) ( not ( = ?auto_657151 ?auto_657159 ) ) ( not ( = ?auto_657151 ?auto_657160 ) ) ( not ( = ?auto_657151 ?auto_657161 ) ) ( not ( = ?auto_657152 ?auto_657153 ) ) ( not ( = ?auto_657152 ?auto_657154 ) ) ( not ( = ?auto_657152 ?auto_657155 ) ) ( not ( = ?auto_657152 ?auto_657156 ) ) ( not ( = ?auto_657152 ?auto_657157 ) ) ( not ( = ?auto_657152 ?auto_657158 ) ) ( not ( = ?auto_657152 ?auto_657159 ) ) ( not ( = ?auto_657152 ?auto_657160 ) ) ( not ( = ?auto_657152 ?auto_657161 ) ) ( not ( = ?auto_657153 ?auto_657154 ) ) ( not ( = ?auto_657153 ?auto_657155 ) ) ( not ( = ?auto_657153 ?auto_657156 ) ) ( not ( = ?auto_657153 ?auto_657157 ) ) ( not ( = ?auto_657153 ?auto_657158 ) ) ( not ( = ?auto_657153 ?auto_657159 ) ) ( not ( = ?auto_657153 ?auto_657160 ) ) ( not ( = ?auto_657153 ?auto_657161 ) ) ( not ( = ?auto_657154 ?auto_657155 ) ) ( not ( = ?auto_657154 ?auto_657156 ) ) ( not ( = ?auto_657154 ?auto_657157 ) ) ( not ( = ?auto_657154 ?auto_657158 ) ) ( not ( = ?auto_657154 ?auto_657159 ) ) ( not ( = ?auto_657154 ?auto_657160 ) ) ( not ( = ?auto_657154 ?auto_657161 ) ) ( not ( = ?auto_657155 ?auto_657156 ) ) ( not ( = ?auto_657155 ?auto_657157 ) ) ( not ( = ?auto_657155 ?auto_657158 ) ) ( not ( = ?auto_657155 ?auto_657159 ) ) ( not ( = ?auto_657155 ?auto_657160 ) ) ( not ( = ?auto_657155 ?auto_657161 ) ) ( not ( = ?auto_657156 ?auto_657157 ) ) ( not ( = ?auto_657156 ?auto_657158 ) ) ( not ( = ?auto_657156 ?auto_657159 ) ) ( not ( = ?auto_657156 ?auto_657160 ) ) ( not ( = ?auto_657156 ?auto_657161 ) ) ( not ( = ?auto_657157 ?auto_657158 ) ) ( not ( = ?auto_657157 ?auto_657159 ) ) ( not ( = ?auto_657157 ?auto_657160 ) ) ( not ( = ?auto_657157 ?auto_657161 ) ) ( not ( = ?auto_657158 ?auto_657159 ) ) ( not ( = ?auto_657158 ?auto_657160 ) ) ( not ( = ?auto_657158 ?auto_657161 ) ) ( not ( = ?auto_657159 ?auto_657160 ) ) ( not ( = ?auto_657159 ?auto_657161 ) ) ( not ( = ?auto_657160 ?auto_657161 ) ) ( ON ?auto_657159 ?auto_657160 ) ( ON ?auto_657158 ?auto_657159 ) ( ON ?auto_657157 ?auto_657158 ) ( ON ?auto_657156 ?auto_657157 ) ( ON ?auto_657155 ?auto_657156 ) ( ON ?auto_657154 ?auto_657155 ) ( ON ?auto_657153 ?auto_657154 ) ( ON ?auto_657152 ?auto_657153 ) ( ON ?auto_657151 ?auto_657152 ) ( ON ?auto_657150 ?auto_657151 ) ( CLEAR ?auto_657148 ) ( ON ?auto_657149 ?auto_657150 ) ( CLEAR ?auto_657149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_657144 ?auto_657145 ?auto_657146 ?auto_657147 ?auto_657148 ?auto_657149 )
      ( MAKE-17PILE ?auto_657144 ?auto_657145 ?auto_657146 ?auto_657147 ?auto_657148 ?auto_657149 ?auto_657150 ?auto_657151 ?auto_657152 ?auto_657153 ?auto_657154 ?auto_657155 ?auto_657156 ?auto_657157 ?auto_657158 ?auto_657159 ?auto_657160 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_657179 - BLOCK
      ?auto_657180 - BLOCK
      ?auto_657181 - BLOCK
      ?auto_657182 - BLOCK
      ?auto_657183 - BLOCK
      ?auto_657184 - BLOCK
      ?auto_657185 - BLOCK
      ?auto_657186 - BLOCK
      ?auto_657187 - BLOCK
      ?auto_657188 - BLOCK
      ?auto_657189 - BLOCK
      ?auto_657190 - BLOCK
      ?auto_657191 - BLOCK
      ?auto_657192 - BLOCK
      ?auto_657193 - BLOCK
      ?auto_657194 - BLOCK
      ?auto_657195 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_657195 ) ( ON-TABLE ?auto_657179 ) ( ON ?auto_657180 ?auto_657179 ) ( ON ?auto_657181 ?auto_657180 ) ( ON ?auto_657182 ?auto_657181 ) ( ON ?auto_657183 ?auto_657182 ) ( not ( = ?auto_657179 ?auto_657180 ) ) ( not ( = ?auto_657179 ?auto_657181 ) ) ( not ( = ?auto_657179 ?auto_657182 ) ) ( not ( = ?auto_657179 ?auto_657183 ) ) ( not ( = ?auto_657179 ?auto_657184 ) ) ( not ( = ?auto_657179 ?auto_657185 ) ) ( not ( = ?auto_657179 ?auto_657186 ) ) ( not ( = ?auto_657179 ?auto_657187 ) ) ( not ( = ?auto_657179 ?auto_657188 ) ) ( not ( = ?auto_657179 ?auto_657189 ) ) ( not ( = ?auto_657179 ?auto_657190 ) ) ( not ( = ?auto_657179 ?auto_657191 ) ) ( not ( = ?auto_657179 ?auto_657192 ) ) ( not ( = ?auto_657179 ?auto_657193 ) ) ( not ( = ?auto_657179 ?auto_657194 ) ) ( not ( = ?auto_657179 ?auto_657195 ) ) ( not ( = ?auto_657180 ?auto_657181 ) ) ( not ( = ?auto_657180 ?auto_657182 ) ) ( not ( = ?auto_657180 ?auto_657183 ) ) ( not ( = ?auto_657180 ?auto_657184 ) ) ( not ( = ?auto_657180 ?auto_657185 ) ) ( not ( = ?auto_657180 ?auto_657186 ) ) ( not ( = ?auto_657180 ?auto_657187 ) ) ( not ( = ?auto_657180 ?auto_657188 ) ) ( not ( = ?auto_657180 ?auto_657189 ) ) ( not ( = ?auto_657180 ?auto_657190 ) ) ( not ( = ?auto_657180 ?auto_657191 ) ) ( not ( = ?auto_657180 ?auto_657192 ) ) ( not ( = ?auto_657180 ?auto_657193 ) ) ( not ( = ?auto_657180 ?auto_657194 ) ) ( not ( = ?auto_657180 ?auto_657195 ) ) ( not ( = ?auto_657181 ?auto_657182 ) ) ( not ( = ?auto_657181 ?auto_657183 ) ) ( not ( = ?auto_657181 ?auto_657184 ) ) ( not ( = ?auto_657181 ?auto_657185 ) ) ( not ( = ?auto_657181 ?auto_657186 ) ) ( not ( = ?auto_657181 ?auto_657187 ) ) ( not ( = ?auto_657181 ?auto_657188 ) ) ( not ( = ?auto_657181 ?auto_657189 ) ) ( not ( = ?auto_657181 ?auto_657190 ) ) ( not ( = ?auto_657181 ?auto_657191 ) ) ( not ( = ?auto_657181 ?auto_657192 ) ) ( not ( = ?auto_657181 ?auto_657193 ) ) ( not ( = ?auto_657181 ?auto_657194 ) ) ( not ( = ?auto_657181 ?auto_657195 ) ) ( not ( = ?auto_657182 ?auto_657183 ) ) ( not ( = ?auto_657182 ?auto_657184 ) ) ( not ( = ?auto_657182 ?auto_657185 ) ) ( not ( = ?auto_657182 ?auto_657186 ) ) ( not ( = ?auto_657182 ?auto_657187 ) ) ( not ( = ?auto_657182 ?auto_657188 ) ) ( not ( = ?auto_657182 ?auto_657189 ) ) ( not ( = ?auto_657182 ?auto_657190 ) ) ( not ( = ?auto_657182 ?auto_657191 ) ) ( not ( = ?auto_657182 ?auto_657192 ) ) ( not ( = ?auto_657182 ?auto_657193 ) ) ( not ( = ?auto_657182 ?auto_657194 ) ) ( not ( = ?auto_657182 ?auto_657195 ) ) ( not ( = ?auto_657183 ?auto_657184 ) ) ( not ( = ?auto_657183 ?auto_657185 ) ) ( not ( = ?auto_657183 ?auto_657186 ) ) ( not ( = ?auto_657183 ?auto_657187 ) ) ( not ( = ?auto_657183 ?auto_657188 ) ) ( not ( = ?auto_657183 ?auto_657189 ) ) ( not ( = ?auto_657183 ?auto_657190 ) ) ( not ( = ?auto_657183 ?auto_657191 ) ) ( not ( = ?auto_657183 ?auto_657192 ) ) ( not ( = ?auto_657183 ?auto_657193 ) ) ( not ( = ?auto_657183 ?auto_657194 ) ) ( not ( = ?auto_657183 ?auto_657195 ) ) ( not ( = ?auto_657184 ?auto_657185 ) ) ( not ( = ?auto_657184 ?auto_657186 ) ) ( not ( = ?auto_657184 ?auto_657187 ) ) ( not ( = ?auto_657184 ?auto_657188 ) ) ( not ( = ?auto_657184 ?auto_657189 ) ) ( not ( = ?auto_657184 ?auto_657190 ) ) ( not ( = ?auto_657184 ?auto_657191 ) ) ( not ( = ?auto_657184 ?auto_657192 ) ) ( not ( = ?auto_657184 ?auto_657193 ) ) ( not ( = ?auto_657184 ?auto_657194 ) ) ( not ( = ?auto_657184 ?auto_657195 ) ) ( not ( = ?auto_657185 ?auto_657186 ) ) ( not ( = ?auto_657185 ?auto_657187 ) ) ( not ( = ?auto_657185 ?auto_657188 ) ) ( not ( = ?auto_657185 ?auto_657189 ) ) ( not ( = ?auto_657185 ?auto_657190 ) ) ( not ( = ?auto_657185 ?auto_657191 ) ) ( not ( = ?auto_657185 ?auto_657192 ) ) ( not ( = ?auto_657185 ?auto_657193 ) ) ( not ( = ?auto_657185 ?auto_657194 ) ) ( not ( = ?auto_657185 ?auto_657195 ) ) ( not ( = ?auto_657186 ?auto_657187 ) ) ( not ( = ?auto_657186 ?auto_657188 ) ) ( not ( = ?auto_657186 ?auto_657189 ) ) ( not ( = ?auto_657186 ?auto_657190 ) ) ( not ( = ?auto_657186 ?auto_657191 ) ) ( not ( = ?auto_657186 ?auto_657192 ) ) ( not ( = ?auto_657186 ?auto_657193 ) ) ( not ( = ?auto_657186 ?auto_657194 ) ) ( not ( = ?auto_657186 ?auto_657195 ) ) ( not ( = ?auto_657187 ?auto_657188 ) ) ( not ( = ?auto_657187 ?auto_657189 ) ) ( not ( = ?auto_657187 ?auto_657190 ) ) ( not ( = ?auto_657187 ?auto_657191 ) ) ( not ( = ?auto_657187 ?auto_657192 ) ) ( not ( = ?auto_657187 ?auto_657193 ) ) ( not ( = ?auto_657187 ?auto_657194 ) ) ( not ( = ?auto_657187 ?auto_657195 ) ) ( not ( = ?auto_657188 ?auto_657189 ) ) ( not ( = ?auto_657188 ?auto_657190 ) ) ( not ( = ?auto_657188 ?auto_657191 ) ) ( not ( = ?auto_657188 ?auto_657192 ) ) ( not ( = ?auto_657188 ?auto_657193 ) ) ( not ( = ?auto_657188 ?auto_657194 ) ) ( not ( = ?auto_657188 ?auto_657195 ) ) ( not ( = ?auto_657189 ?auto_657190 ) ) ( not ( = ?auto_657189 ?auto_657191 ) ) ( not ( = ?auto_657189 ?auto_657192 ) ) ( not ( = ?auto_657189 ?auto_657193 ) ) ( not ( = ?auto_657189 ?auto_657194 ) ) ( not ( = ?auto_657189 ?auto_657195 ) ) ( not ( = ?auto_657190 ?auto_657191 ) ) ( not ( = ?auto_657190 ?auto_657192 ) ) ( not ( = ?auto_657190 ?auto_657193 ) ) ( not ( = ?auto_657190 ?auto_657194 ) ) ( not ( = ?auto_657190 ?auto_657195 ) ) ( not ( = ?auto_657191 ?auto_657192 ) ) ( not ( = ?auto_657191 ?auto_657193 ) ) ( not ( = ?auto_657191 ?auto_657194 ) ) ( not ( = ?auto_657191 ?auto_657195 ) ) ( not ( = ?auto_657192 ?auto_657193 ) ) ( not ( = ?auto_657192 ?auto_657194 ) ) ( not ( = ?auto_657192 ?auto_657195 ) ) ( not ( = ?auto_657193 ?auto_657194 ) ) ( not ( = ?auto_657193 ?auto_657195 ) ) ( not ( = ?auto_657194 ?auto_657195 ) ) ( ON ?auto_657194 ?auto_657195 ) ( ON ?auto_657193 ?auto_657194 ) ( ON ?auto_657192 ?auto_657193 ) ( ON ?auto_657191 ?auto_657192 ) ( ON ?auto_657190 ?auto_657191 ) ( ON ?auto_657189 ?auto_657190 ) ( ON ?auto_657188 ?auto_657189 ) ( ON ?auto_657187 ?auto_657188 ) ( ON ?auto_657186 ?auto_657187 ) ( ON ?auto_657185 ?auto_657186 ) ( CLEAR ?auto_657183 ) ( ON ?auto_657184 ?auto_657185 ) ( CLEAR ?auto_657184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_657179 ?auto_657180 ?auto_657181 ?auto_657182 ?auto_657183 ?auto_657184 )
      ( MAKE-17PILE ?auto_657179 ?auto_657180 ?auto_657181 ?auto_657182 ?auto_657183 ?auto_657184 ?auto_657185 ?auto_657186 ?auto_657187 ?auto_657188 ?auto_657189 ?auto_657190 ?auto_657191 ?auto_657192 ?auto_657193 ?auto_657194 ?auto_657195 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_657213 - BLOCK
      ?auto_657214 - BLOCK
      ?auto_657215 - BLOCK
      ?auto_657216 - BLOCK
      ?auto_657217 - BLOCK
      ?auto_657218 - BLOCK
      ?auto_657219 - BLOCK
      ?auto_657220 - BLOCK
      ?auto_657221 - BLOCK
      ?auto_657222 - BLOCK
      ?auto_657223 - BLOCK
      ?auto_657224 - BLOCK
      ?auto_657225 - BLOCK
      ?auto_657226 - BLOCK
      ?auto_657227 - BLOCK
      ?auto_657228 - BLOCK
      ?auto_657229 - BLOCK
    )
    :vars
    (
      ?auto_657230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_657229 ?auto_657230 ) ( ON-TABLE ?auto_657213 ) ( ON ?auto_657214 ?auto_657213 ) ( ON ?auto_657215 ?auto_657214 ) ( ON ?auto_657216 ?auto_657215 ) ( not ( = ?auto_657213 ?auto_657214 ) ) ( not ( = ?auto_657213 ?auto_657215 ) ) ( not ( = ?auto_657213 ?auto_657216 ) ) ( not ( = ?auto_657213 ?auto_657217 ) ) ( not ( = ?auto_657213 ?auto_657218 ) ) ( not ( = ?auto_657213 ?auto_657219 ) ) ( not ( = ?auto_657213 ?auto_657220 ) ) ( not ( = ?auto_657213 ?auto_657221 ) ) ( not ( = ?auto_657213 ?auto_657222 ) ) ( not ( = ?auto_657213 ?auto_657223 ) ) ( not ( = ?auto_657213 ?auto_657224 ) ) ( not ( = ?auto_657213 ?auto_657225 ) ) ( not ( = ?auto_657213 ?auto_657226 ) ) ( not ( = ?auto_657213 ?auto_657227 ) ) ( not ( = ?auto_657213 ?auto_657228 ) ) ( not ( = ?auto_657213 ?auto_657229 ) ) ( not ( = ?auto_657213 ?auto_657230 ) ) ( not ( = ?auto_657214 ?auto_657215 ) ) ( not ( = ?auto_657214 ?auto_657216 ) ) ( not ( = ?auto_657214 ?auto_657217 ) ) ( not ( = ?auto_657214 ?auto_657218 ) ) ( not ( = ?auto_657214 ?auto_657219 ) ) ( not ( = ?auto_657214 ?auto_657220 ) ) ( not ( = ?auto_657214 ?auto_657221 ) ) ( not ( = ?auto_657214 ?auto_657222 ) ) ( not ( = ?auto_657214 ?auto_657223 ) ) ( not ( = ?auto_657214 ?auto_657224 ) ) ( not ( = ?auto_657214 ?auto_657225 ) ) ( not ( = ?auto_657214 ?auto_657226 ) ) ( not ( = ?auto_657214 ?auto_657227 ) ) ( not ( = ?auto_657214 ?auto_657228 ) ) ( not ( = ?auto_657214 ?auto_657229 ) ) ( not ( = ?auto_657214 ?auto_657230 ) ) ( not ( = ?auto_657215 ?auto_657216 ) ) ( not ( = ?auto_657215 ?auto_657217 ) ) ( not ( = ?auto_657215 ?auto_657218 ) ) ( not ( = ?auto_657215 ?auto_657219 ) ) ( not ( = ?auto_657215 ?auto_657220 ) ) ( not ( = ?auto_657215 ?auto_657221 ) ) ( not ( = ?auto_657215 ?auto_657222 ) ) ( not ( = ?auto_657215 ?auto_657223 ) ) ( not ( = ?auto_657215 ?auto_657224 ) ) ( not ( = ?auto_657215 ?auto_657225 ) ) ( not ( = ?auto_657215 ?auto_657226 ) ) ( not ( = ?auto_657215 ?auto_657227 ) ) ( not ( = ?auto_657215 ?auto_657228 ) ) ( not ( = ?auto_657215 ?auto_657229 ) ) ( not ( = ?auto_657215 ?auto_657230 ) ) ( not ( = ?auto_657216 ?auto_657217 ) ) ( not ( = ?auto_657216 ?auto_657218 ) ) ( not ( = ?auto_657216 ?auto_657219 ) ) ( not ( = ?auto_657216 ?auto_657220 ) ) ( not ( = ?auto_657216 ?auto_657221 ) ) ( not ( = ?auto_657216 ?auto_657222 ) ) ( not ( = ?auto_657216 ?auto_657223 ) ) ( not ( = ?auto_657216 ?auto_657224 ) ) ( not ( = ?auto_657216 ?auto_657225 ) ) ( not ( = ?auto_657216 ?auto_657226 ) ) ( not ( = ?auto_657216 ?auto_657227 ) ) ( not ( = ?auto_657216 ?auto_657228 ) ) ( not ( = ?auto_657216 ?auto_657229 ) ) ( not ( = ?auto_657216 ?auto_657230 ) ) ( not ( = ?auto_657217 ?auto_657218 ) ) ( not ( = ?auto_657217 ?auto_657219 ) ) ( not ( = ?auto_657217 ?auto_657220 ) ) ( not ( = ?auto_657217 ?auto_657221 ) ) ( not ( = ?auto_657217 ?auto_657222 ) ) ( not ( = ?auto_657217 ?auto_657223 ) ) ( not ( = ?auto_657217 ?auto_657224 ) ) ( not ( = ?auto_657217 ?auto_657225 ) ) ( not ( = ?auto_657217 ?auto_657226 ) ) ( not ( = ?auto_657217 ?auto_657227 ) ) ( not ( = ?auto_657217 ?auto_657228 ) ) ( not ( = ?auto_657217 ?auto_657229 ) ) ( not ( = ?auto_657217 ?auto_657230 ) ) ( not ( = ?auto_657218 ?auto_657219 ) ) ( not ( = ?auto_657218 ?auto_657220 ) ) ( not ( = ?auto_657218 ?auto_657221 ) ) ( not ( = ?auto_657218 ?auto_657222 ) ) ( not ( = ?auto_657218 ?auto_657223 ) ) ( not ( = ?auto_657218 ?auto_657224 ) ) ( not ( = ?auto_657218 ?auto_657225 ) ) ( not ( = ?auto_657218 ?auto_657226 ) ) ( not ( = ?auto_657218 ?auto_657227 ) ) ( not ( = ?auto_657218 ?auto_657228 ) ) ( not ( = ?auto_657218 ?auto_657229 ) ) ( not ( = ?auto_657218 ?auto_657230 ) ) ( not ( = ?auto_657219 ?auto_657220 ) ) ( not ( = ?auto_657219 ?auto_657221 ) ) ( not ( = ?auto_657219 ?auto_657222 ) ) ( not ( = ?auto_657219 ?auto_657223 ) ) ( not ( = ?auto_657219 ?auto_657224 ) ) ( not ( = ?auto_657219 ?auto_657225 ) ) ( not ( = ?auto_657219 ?auto_657226 ) ) ( not ( = ?auto_657219 ?auto_657227 ) ) ( not ( = ?auto_657219 ?auto_657228 ) ) ( not ( = ?auto_657219 ?auto_657229 ) ) ( not ( = ?auto_657219 ?auto_657230 ) ) ( not ( = ?auto_657220 ?auto_657221 ) ) ( not ( = ?auto_657220 ?auto_657222 ) ) ( not ( = ?auto_657220 ?auto_657223 ) ) ( not ( = ?auto_657220 ?auto_657224 ) ) ( not ( = ?auto_657220 ?auto_657225 ) ) ( not ( = ?auto_657220 ?auto_657226 ) ) ( not ( = ?auto_657220 ?auto_657227 ) ) ( not ( = ?auto_657220 ?auto_657228 ) ) ( not ( = ?auto_657220 ?auto_657229 ) ) ( not ( = ?auto_657220 ?auto_657230 ) ) ( not ( = ?auto_657221 ?auto_657222 ) ) ( not ( = ?auto_657221 ?auto_657223 ) ) ( not ( = ?auto_657221 ?auto_657224 ) ) ( not ( = ?auto_657221 ?auto_657225 ) ) ( not ( = ?auto_657221 ?auto_657226 ) ) ( not ( = ?auto_657221 ?auto_657227 ) ) ( not ( = ?auto_657221 ?auto_657228 ) ) ( not ( = ?auto_657221 ?auto_657229 ) ) ( not ( = ?auto_657221 ?auto_657230 ) ) ( not ( = ?auto_657222 ?auto_657223 ) ) ( not ( = ?auto_657222 ?auto_657224 ) ) ( not ( = ?auto_657222 ?auto_657225 ) ) ( not ( = ?auto_657222 ?auto_657226 ) ) ( not ( = ?auto_657222 ?auto_657227 ) ) ( not ( = ?auto_657222 ?auto_657228 ) ) ( not ( = ?auto_657222 ?auto_657229 ) ) ( not ( = ?auto_657222 ?auto_657230 ) ) ( not ( = ?auto_657223 ?auto_657224 ) ) ( not ( = ?auto_657223 ?auto_657225 ) ) ( not ( = ?auto_657223 ?auto_657226 ) ) ( not ( = ?auto_657223 ?auto_657227 ) ) ( not ( = ?auto_657223 ?auto_657228 ) ) ( not ( = ?auto_657223 ?auto_657229 ) ) ( not ( = ?auto_657223 ?auto_657230 ) ) ( not ( = ?auto_657224 ?auto_657225 ) ) ( not ( = ?auto_657224 ?auto_657226 ) ) ( not ( = ?auto_657224 ?auto_657227 ) ) ( not ( = ?auto_657224 ?auto_657228 ) ) ( not ( = ?auto_657224 ?auto_657229 ) ) ( not ( = ?auto_657224 ?auto_657230 ) ) ( not ( = ?auto_657225 ?auto_657226 ) ) ( not ( = ?auto_657225 ?auto_657227 ) ) ( not ( = ?auto_657225 ?auto_657228 ) ) ( not ( = ?auto_657225 ?auto_657229 ) ) ( not ( = ?auto_657225 ?auto_657230 ) ) ( not ( = ?auto_657226 ?auto_657227 ) ) ( not ( = ?auto_657226 ?auto_657228 ) ) ( not ( = ?auto_657226 ?auto_657229 ) ) ( not ( = ?auto_657226 ?auto_657230 ) ) ( not ( = ?auto_657227 ?auto_657228 ) ) ( not ( = ?auto_657227 ?auto_657229 ) ) ( not ( = ?auto_657227 ?auto_657230 ) ) ( not ( = ?auto_657228 ?auto_657229 ) ) ( not ( = ?auto_657228 ?auto_657230 ) ) ( not ( = ?auto_657229 ?auto_657230 ) ) ( ON ?auto_657228 ?auto_657229 ) ( ON ?auto_657227 ?auto_657228 ) ( ON ?auto_657226 ?auto_657227 ) ( ON ?auto_657225 ?auto_657226 ) ( ON ?auto_657224 ?auto_657225 ) ( ON ?auto_657223 ?auto_657224 ) ( ON ?auto_657222 ?auto_657223 ) ( ON ?auto_657221 ?auto_657222 ) ( ON ?auto_657220 ?auto_657221 ) ( ON ?auto_657219 ?auto_657220 ) ( ON ?auto_657218 ?auto_657219 ) ( CLEAR ?auto_657216 ) ( ON ?auto_657217 ?auto_657218 ) ( CLEAR ?auto_657217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_657213 ?auto_657214 ?auto_657215 ?auto_657216 ?auto_657217 )
      ( MAKE-17PILE ?auto_657213 ?auto_657214 ?auto_657215 ?auto_657216 ?auto_657217 ?auto_657218 ?auto_657219 ?auto_657220 ?auto_657221 ?auto_657222 ?auto_657223 ?auto_657224 ?auto_657225 ?auto_657226 ?auto_657227 ?auto_657228 ?auto_657229 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_657248 - BLOCK
      ?auto_657249 - BLOCK
      ?auto_657250 - BLOCK
      ?auto_657251 - BLOCK
      ?auto_657252 - BLOCK
      ?auto_657253 - BLOCK
      ?auto_657254 - BLOCK
      ?auto_657255 - BLOCK
      ?auto_657256 - BLOCK
      ?auto_657257 - BLOCK
      ?auto_657258 - BLOCK
      ?auto_657259 - BLOCK
      ?auto_657260 - BLOCK
      ?auto_657261 - BLOCK
      ?auto_657262 - BLOCK
      ?auto_657263 - BLOCK
      ?auto_657264 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_657264 ) ( ON-TABLE ?auto_657248 ) ( ON ?auto_657249 ?auto_657248 ) ( ON ?auto_657250 ?auto_657249 ) ( ON ?auto_657251 ?auto_657250 ) ( not ( = ?auto_657248 ?auto_657249 ) ) ( not ( = ?auto_657248 ?auto_657250 ) ) ( not ( = ?auto_657248 ?auto_657251 ) ) ( not ( = ?auto_657248 ?auto_657252 ) ) ( not ( = ?auto_657248 ?auto_657253 ) ) ( not ( = ?auto_657248 ?auto_657254 ) ) ( not ( = ?auto_657248 ?auto_657255 ) ) ( not ( = ?auto_657248 ?auto_657256 ) ) ( not ( = ?auto_657248 ?auto_657257 ) ) ( not ( = ?auto_657248 ?auto_657258 ) ) ( not ( = ?auto_657248 ?auto_657259 ) ) ( not ( = ?auto_657248 ?auto_657260 ) ) ( not ( = ?auto_657248 ?auto_657261 ) ) ( not ( = ?auto_657248 ?auto_657262 ) ) ( not ( = ?auto_657248 ?auto_657263 ) ) ( not ( = ?auto_657248 ?auto_657264 ) ) ( not ( = ?auto_657249 ?auto_657250 ) ) ( not ( = ?auto_657249 ?auto_657251 ) ) ( not ( = ?auto_657249 ?auto_657252 ) ) ( not ( = ?auto_657249 ?auto_657253 ) ) ( not ( = ?auto_657249 ?auto_657254 ) ) ( not ( = ?auto_657249 ?auto_657255 ) ) ( not ( = ?auto_657249 ?auto_657256 ) ) ( not ( = ?auto_657249 ?auto_657257 ) ) ( not ( = ?auto_657249 ?auto_657258 ) ) ( not ( = ?auto_657249 ?auto_657259 ) ) ( not ( = ?auto_657249 ?auto_657260 ) ) ( not ( = ?auto_657249 ?auto_657261 ) ) ( not ( = ?auto_657249 ?auto_657262 ) ) ( not ( = ?auto_657249 ?auto_657263 ) ) ( not ( = ?auto_657249 ?auto_657264 ) ) ( not ( = ?auto_657250 ?auto_657251 ) ) ( not ( = ?auto_657250 ?auto_657252 ) ) ( not ( = ?auto_657250 ?auto_657253 ) ) ( not ( = ?auto_657250 ?auto_657254 ) ) ( not ( = ?auto_657250 ?auto_657255 ) ) ( not ( = ?auto_657250 ?auto_657256 ) ) ( not ( = ?auto_657250 ?auto_657257 ) ) ( not ( = ?auto_657250 ?auto_657258 ) ) ( not ( = ?auto_657250 ?auto_657259 ) ) ( not ( = ?auto_657250 ?auto_657260 ) ) ( not ( = ?auto_657250 ?auto_657261 ) ) ( not ( = ?auto_657250 ?auto_657262 ) ) ( not ( = ?auto_657250 ?auto_657263 ) ) ( not ( = ?auto_657250 ?auto_657264 ) ) ( not ( = ?auto_657251 ?auto_657252 ) ) ( not ( = ?auto_657251 ?auto_657253 ) ) ( not ( = ?auto_657251 ?auto_657254 ) ) ( not ( = ?auto_657251 ?auto_657255 ) ) ( not ( = ?auto_657251 ?auto_657256 ) ) ( not ( = ?auto_657251 ?auto_657257 ) ) ( not ( = ?auto_657251 ?auto_657258 ) ) ( not ( = ?auto_657251 ?auto_657259 ) ) ( not ( = ?auto_657251 ?auto_657260 ) ) ( not ( = ?auto_657251 ?auto_657261 ) ) ( not ( = ?auto_657251 ?auto_657262 ) ) ( not ( = ?auto_657251 ?auto_657263 ) ) ( not ( = ?auto_657251 ?auto_657264 ) ) ( not ( = ?auto_657252 ?auto_657253 ) ) ( not ( = ?auto_657252 ?auto_657254 ) ) ( not ( = ?auto_657252 ?auto_657255 ) ) ( not ( = ?auto_657252 ?auto_657256 ) ) ( not ( = ?auto_657252 ?auto_657257 ) ) ( not ( = ?auto_657252 ?auto_657258 ) ) ( not ( = ?auto_657252 ?auto_657259 ) ) ( not ( = ?auto_657252 ?auto_657260 ) ) ( not ( = ?auto_657252 ?auto_657261 ) ) ( not ( = ?auto_657252 ?auto_657262 ) ) ( not ( = ?auto_657252 ?auto_657263 ) ) ( not ( = ?auto_657252 ?auto_657264 ) ) ( not ( = ?auto_657253 ?auto_657254 ) ) ( not ( = ?auto_657253 ?auto_657255 ) ) ( not ( = ?auto_657253 ?auto_657256 ) ) ( not ( = ?auto_657253 ?auto_657257 ) ) ( not ( = ?auto_657253 ?auto_657258 ) ) ( not ( = ?auto_657253 ?auto_657259 ) ) ( not ( = ?auto_657253 ?auto_657260 ) ) ( not ( = ?auto_657253 ?auto_657261 ) ) ( not ( = ?auto_657253 ?auto_657262 ) ) ( not ( = ?auto_657253 ?auto_657263 ) ) ( not ( = ?auto_657253 ?auto_657264 ) ) ( not ( = ?auto_657254 ?auto_657255 ) ) ( not ( = ?auto_657254 ?auto_657256 ) ) ( not ( = ?auto_657254 ?auto_657257 ) ) ( not ( = ?auto_657254 ?auto_657258 ) ) ( not ( = ?auto_657254 ?auto_657259 ) ) ( not ( = ?auto_657254 ?auto_657260 ) ) ( not ( = ?auto_657254 ?auto_657261 ) ) ( not ( = ?auto_657254 ?auto_657262 ) ) ( not ( = ?auto_657254 ?auto_657263 ) ) ( not ( = ?auto_657254 ?auto_657264 ) ) ( not ( = ?auto_657255 ?auto_657256 ) ) ( not ( = ?auto_657255 ?auto_657257 ) ) ( not ( = ?auto_657255 ?auto_657258 ) ) ( not ( = ?auto_657255 ?auto_657259 ) ) ( not ( = ?auto_657255 ?auto_657260 ) ) ( not ( = ?auto_657255 ?auto_657261 ) ) ( not ( = ?auto_657255 ?auto_657262 ) ) ( not ( = ?auto_657255 ?auto_657263 ) ) ( not ( = ?auto_657255 ?auto_657264 ) ) ( not ( = ?auto_657256 ?auto_657257 ) ) ( not ( = ?auto_657256 ?auto_657258 ) ) ( not ( = ?auto_657256 ?auto_657259 ) ) ( not ( = ?auto_657256 ?auto_657260 ) ) ( not ( = ?auto_657256 ?auto_657261 ) ) ( not ( = ?auto_657256 ?auto_657262 ) ) ( not ( = ?auto_657256 ?auto_657263 ) ) ( not ( = ?auto_657256 ?auto_657264 ) ) ( not ( = ?auto_657257 ?auto_657258 ) ) ( not ( = ?auto_657257 ?auto_657259 ) ) ( not ( = ?auto_657257 ?auto_657260 ) ) ( not ( = ?auto_657257 ?auto_657261 ) ) ( not ( = ?auto_657257 ?auto_657262 ) ) ( not ( = ?auto_657257 ?auto_657263 ) ) ( not ( = ?auto_657257 ?auto_657264 ) ) ( not ( = ?auto_657258 ?auto_657259 ) ) ( not ( = ?auto_657258 ?auto_657260 ) ) ( not ( = ?auto_657258 ?auto_657261 ) ) ( not ( = ?auto_657258 ?auto_657262 ) ) ( not ( = ?auto_657258 ?auto_657263 ) ) ( not ( = ?auto_657258 ?auto_657264 ) ) ( not ( = ?auto_657259 ?auto_657260 ) ) ( not ( = ?auto_657259 ?auto_657261 ) ) ( not ( = ?auto_657259 ?auto_657262 ) ) ( not ( = ?auto_657259 ?auto_657263 ) ) ( not ( = ?auto_657259 ?auto_657264 ) ) ( not ( = ?auto_657260 ?auto_657261 ) ) ( not ( = ?auto_657260 ?auto_657262 ) ) ( not ( = ?auto_657260 ?auto_657263 ) ) ( not ( = ?auto_657260 ?auto_657264 ) ) ( not ( = ?auto_657261 ?auto_657262 ) ) ( not ( = ?auto_657261 ?auto_657263 ) ) ( not ( = ?auto_657261 ?auto_657264 ) ) ( not ( = ?auto_657262 ?auto_657263 ) ) ( not ( = ?auto_657262 ?auto_657264 ) ) ( not ( = ?auto_657263 ?auto_657264 ) ) ( ON ?auto_657263 ?auto_657264 ) ( ON ?auto_657262 ?auto_657263 ) ( ON ?auto_657261 ?auto_657262 ) ( ON ?auto_657260 ?auto_657261 ) ( ON ?auto_657259 ?auto_657260 ) ( ON ?auto_657258 ?auto_657259 ) ( ON ?auto_657257 ?auto_657258 ) ( ON ?auto_657256 ?auto_657257 ) ( ON ?auto_657255 ?auto_657256 ) ( ON ?auto_657254 ?auto_657255 ) ( ON ?auto_657253 ?auto_657254 ) ( CLEAR ?auto_657251 ) ( ON ?auto_657252 ?auto_657253 ) ( CLEAR ?auto_657252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_657248 ?auto_657249 ?auto_657250 ?auto_657251 ?auto_657252 )
      ( MAKE-17PILE ?auto_657248 ?auto_657249 ?auto_657250 ?auto_657251 ?auto_657252 ?auto_657253 ?auto_657254 ?auto_657255 ?auto_657256 ?auto_657257 ?auto_657258 ?auto_657259 ?auto_657260 ?auto_657261 ?auto_657262 ?auto_657263 ?auto_657264 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_657282 - BLOCK
      ?auto_657283 - BLOCK
      ?auto_657284 - BLOCK
      ?auto_657285 - BLOCK
      ?auto_657286 - BLOCK
      ?auto_657287 - BLOCK
      ?auto_657288 - BLOCK
      ?auto_657289 - BLOCK
      ?auto_657290 - BLOCK
      ?auto_657291 - BLOCK
      ?auto_657292 - BLOCK
      ?auto_657293 - BLOCK
      ?auto_657294 - BLOCK
      ?auto_657295 - BLOCK
      ?auto_657296 - BLOCK
      ?auto_657297 - BLOCK
      ?auto_657298 - BLOCK
    )
    :vars
    (
      ?auto_657299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_657298 ?auto_657299 ) ( ON-TABLE ?auto_657282 ) ( ON ?auto_657283 ?auto_657282 ) ( ON ?auto_657284 ?auto_657283 ) ( not ( = ?auto_657282 ?auto_657283 ) ) ( not ( = ?auto_657282 ?auto_657284 ) ) ( not ( = ?auto_657282 ?auto_657285 ) ) ( not ( = ?auto_657282 ?auto_657286 ) ) ( not ( = ?auto_657282 ?auto_657287 ) ) ( not ( = ?auto_657282 ?auto_657288 ) ) ( not ( = ?auto_657282 ?auto_657289 ) ) ( not ( = ?auto_657282 ?auto_657290 ) ) ( not ( = ?auto_657282 ?auto_657291 ) ) ( not ( = ?auto_657282 ?auto_657292 ) ) ( not ( = ?auto_657282 ?auto_657293 ) ) ( not ( = ?auto_657282 ?auto_657294 ) ) ( not ( = ?auto_657282 ?auto_657295 ) ) ( not ( = ?auto_657282 ?auto_657296 ) ) ( not ( = ?auto_657282 ?auto_657297 ) ) ( not ( = ?auto_657282 ?auto_657298 ) ) ( not ( = ?auto_657282 ?auto_657299 ) ) ( not ( = ?auto_657283 ?auto_657284 ) ) ( not ( = ?auto_657283 ?auto_657285 ) ) ( not ( = ?auto_657283 ?auto_657286 ) ) ( not ( = ?auto_657283 ?auto_657287 ) ) ( not ( = ?auto_657283 ?auto_657288 ) ) ( not ( = ?auto_657283 ?auto_657289 ) ) ( not ( = ?auto_657283 ?auto_657290 ) ) ( not ( = ?auto_657283 ?auto_657291 ) ) ( not ( = ?auto_657283 ?auto_657292 ) ) ( not ( = ?auto_657283 ?auto_657293 ) ) ( not ( = ?auto_657283 ?auto_657294 ) ) ( not ( = ?auto_657283 ?auto_657295 ) ) ( not ( = ?auto_657283 ?auto_657296 ) ) ( not ( = ?auto_657283 ?auto_657297 ) ) ( not ( = ?auto_657283 ?auto_657298 ) ) ( not ( = ?auto_657283 ?auto_657299 ) ) ( not ( = ?auto_657284 ?auto_657285 ) ) ( not ( = ?auto_657284 ?auto_657286 ) ) ( not ( = ?auto_657284 ?auto_657287 ) ) ( not ( = ?auto_657284 ?auto_657288 ) ) ( not ( = ?auto_657284 ?auto_657289 ) ) ( not ( = ?auto_657284 ?auto_657290 ) ) ( not ( = ?auto_657284 ?auto_657291 ) ) ( not ( = ?auto_657284 ?auto_657292 ) ) ( not ( = ?auto_657284 ?auto_657293 ) ) ( not ( = ?auto_657284 ?auto_657294 ) ) ( not ( = ?auto_657284 ?auto_657295 ) ) ( not ( = ?auto_657284 ?auto_657296 ) ) ( not ( = ?auto_657284 ?auto_657297 ) ) ( not ( = ?auto_657284 ?auto_657298 ) ) ( not ( = ?auto_657284 ?auto_657299 ) ) ( not ( = ?auto_657285 ?auto_657286 ) ) ( not ( = ?auto_657285 ?auto_657287 ) ) ( not ( = ?auto_657285 ?auto_657288 ) ) ( not ( = ?auto_657285 ?auto_657289 ) ) ( not ( = ?auto_657285 ?auto_657290 ) ) ( not ( = ?auto_657285 ?auto_657291 ) ) ( not ( = ?auto_657285 ?auto_657292 ) ) ( not ( = ?auto_657285 ?auto_657293 ) ) ( not ( = ?auto_657285 ?auto_657294 ) ) ( not ( = ?auto_657285 ?auto_657295 ) ) ( not ( = ?auto_657285 ?auto_657296 ) ) ( not ( = ?auto_657285 ?auto_657297 ) ) ( not ( = ?auto_657285 ?auto_657298 ) ) ( not ( = ?auto_657285 ?auto_657299 ) ) ( not ( = ?auto_657286 ?auto_657287 ) ) ( not ( = ?auto_657286 ?auto_657288 ) ) ( not ( = ?auto_657286 ?auto_657289 ) ) ( not ( = ?auto_657286 ?auto_657290 ) ) ( not ( = ?auto_657286 ?auto_657291 ) ) ( not ( = ?auto_657286 ?auto_657292 ) ) ( not ( = ?auto_657286 ?auto_657293 ) ) ( not ( = ?auto_657286 ?auto_657294 ) ) ( not ( = ?auto_657286 ?auto_657295 ) ) ( not ( = ?auto_657286 ?auto_657296 ) ) ( not ( = ?auto_657286 ?auto_657297 ) ) ( not ( = ?auto_657286 ?auto_657298 ) ) ( not ( = ?auto_657286 ?auto_657299 ) ) ( not ( = ?auto_657287 ?auto_657288 ) ) ( not ( = ?auto_657287 ?auto_657289 ) ) ( not ( = ?auto_657287 ?auto_657290 ) ) ( not ( = ?auto_657287 ?auto_657291 ) ) ( not ( = ?auto_657287 ?auto_657292 ) ) ( not ( = ?auto_657287 ?auto_657293 ) ) ( not ( = ?auto_657287 ?auto_657294 ) ) ( not ( = ?auto_657287 ?auto_657295 ) ) ( not ( = ?auto_657287 ?auto_657296 ) ) ( not ( = ?auto_657287 ?auto_657297 ) ) ( not ( = ?auto_657287 ?auto_657298 ) ) ( not ( = ?auto_657287 ?auto_657299 ) ) ( not ( = ?auto_657288 ?auto_657289 ) ) ( not ( = ?auto_657288 ?auto_657290 ) ) ( not ( = ?auto_657288 ?auto_657291 ) ) ( not ( = ?auto_657288 ?auto_657292 ) ) ( not ( = ?auto_657288 ?auto_657293 ) ) ( not ( = ?auto_657288 ?auto_657294 ) ) ( not ( = ?auto_657288 ?auto_657295 ) ) ( not ( = ?auto_657288 ?auto_657296 ) ) ( not ( = ?auto_657288 ?auto_657297 ) ) ( not ( = ?auto_657288 ?auto_657298 ) ) ( not ( = ?auto_657288 ?auto_657299 ) ) ( not ( = ?auto_657289 ?auto_657290 ) ) ( not ( = ?auto_657289 ?auto_657291 ) ) ( not ( = ?auto_657289 ?auto_657292 ) ) ( not ( = ?auto_657289 ?auto_657293 ) ) ( not ( = ?auto_657289 ?auto_657294 ) ) ( not ( = ?auto_657289 ?auto_657295 ) ) ( not ( = ?auto_657289 ?auto_657296 ) ) ( not ( = ?auto_657289 ?auto_657297 ) ) ( not ( = ?auto_657289 ?auto_657298 ) ) ( not ( = ?auto_657289 ?auto_657299 ) ) ( not ( = ?auto_657290 ?auto_657291 ) ) ( not ( = ?auto_657290 ?auto_657292 ) ) ( not ( = ?auto_657290 ?auto_657293 ) ) ( not ( = ?auto_657290 ?auto_657294 ) ) ( not ( = ?auto_657290 ?auto_657295 ) ) ( not ( = ?auto_657290 ?auto_657296 ) ) ( not ( = ?auto_657290 ?auto_657297 ) ) ( not ( = ?auto_657290 ?auto_657298 ) ) ( not ( = ?auto_657290 ?auto_657299 ) ) ( not ( = ?auto_657291 ?auto_657292 ) ) ( not ( = ?auto_657291 ?auto_657293 ) ) ( not ( = ?auto_657291 ?auto_657294 ) ) ( not ( = ?auto_657291 ?auto_657295 ) ) ( not ( = ?auto_657291 ?auto_657296 ) ) ( not ( = ?auto_657291 ?auto_657297 ) ) ( not ( = ?auto_657291 ?auto_657298 ) ) ( not ( = ?auto_657291 ?auto_657299 ) ) ( not ( = ?auto_657292 ?auto_657293 ) ) ( not ( = ?auto_657292 ?auto_657294 ) ) ( not ( = ?auto_657292 ?auto_657295 ) ) ( not ( = ?auto_657292 ?auto_657296 ) ) ( not ( = ?auto_657292 ?auto_657297 ) ) ( not ( = ?auto_657292 ?auto_657298 ) ) ( not ( = ?auto_657292 ?auto_657299 ) ) ( not ( = ?auto_657293 ?auto_657294 ) ) ( not ( = ?auto_657293 ?auto_657295 ) ) ( not ( = ?auto_657293 ?auto_657296 ) ) ( not ( = ?auto_657293 ?auto_657297 ) ) ( not ( = ?auto_657293 ?auto_657298 ) ) ( not ( = ?auto_657293 ?auto_657299 ) ) ( not ( = ?auto_657294 ?auto_657295 ) ) ( not ( = ?auto_657294 ?auto_657296 ) ) ( not ( = ?auto_657294 ?auto_657297 ) ) ( not ( = ?auto_657294 ?auto_657298 ) ) ( not ( = ?auto_657294 ?auto_657299 ) ) ( not ( = ?auto_657295 ?auto_657296 ) ) ( not ( = ?auto_657295 ?auto_657297 ) ) ( not ( = ?auto_657295 ?auto_657298 ) ) ( not ( = ?auto_657295 ?auto_657299 ) ) ( not ( = ?auto_657296 ?auto_657297 ) ) ( not ( = ?auto_657296 ?auto_657298 ) ) ( not ( = ?auto_657296 ?auto_657299 ) ) ( not ( = ?auto_657297 ?auto_657298 ) ) ( not ( = ?auto_657297 ?auto_657299 ) ) ( not ( = ?auto_657298 ?auto_657299 ) ) ( ON ?auto_657297 ?auto_657298 ) ( ON ?auto_657296 ?auto_657297 ) ( ON ?auto_657295 ?auto_657296 ) ( ON ?auto_657294 ?auto_657295 ) ( ON ?auto_657293 ?auto_657294 ) ( ON ?auto_657292 ?auto_657293 ) ( ON ?auto_657291 ?auto_657292 ) ( ON ?auto_657290 ?auto_657291 ) ( ON ?auto_657289 ?auto_657290 ) ( ON ?auto_657288 ?auto_657289 ) ( ON ?auto_657287 ?auto_657288 ) ( ON ?auto_657286 ?auto_657287 ) ( CLEAR ?auto_657284 ) ( ON ?auto_657285 ?auto_657286 ) ( CLEAR ?auto_657285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_657282 ?auto_657283 ?auto_657284 ?auto_657285 )
      ( MAKE-17PILE ?auto_657282 ?auto_657283 ?auto_657284 ?auto_657285 ?auto_657286 ?auto_657287 ?auto_657288 ?auto_657289 ?auto_657290 ?auto_657291 ?auto_657292 ?auto_657293 ?auto_657294 ?auto_657295 ?auto_657296 ?auto_657297 ?auto_657298 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_657317 - BLOCK
      ?auto_657318 - BLOCK
      ?auto_657319 - BLOCK
      ?auto_657320 - BLOCK
      ?auto_657321 - BLOCK
      ?auto_657322 - BLOCK
      ?auto_657323 - BLOCK
      ?auto_657324 - BLOCK
      ?auto_657325 - BLOCK
      ?auto_657326 - BLOCK
      ?auto_657327 - BLOCK
      ?auto_657328 - BLOCK
      ?auto_657329 - BLOCK
      ?auto_657330 - BLOCK
      ?auto_657331 - BLOCK
      ?auto_657332 - BLOCK
      ?auto_657333 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_657333 ) ( ON-TABLE ?auto_657317 ) ( ON ?auto_657318 ?auto_657317 ) ( ON ?auto_657319 ?auto_657318 ) ( not ( = ?auto_657317 ?auto_657318 ) ) ( not ( = ?auto_657317 ?auto_657319 ) ) ( not ( = ?auto_657317 ?auto_657320 ) ) ( not ( = ?auto_657317 ?auto_657321 ) ) ( not ( = ?auto_657317 ?auto_657322 ) ) ( not ( = ?auto_657317 ?auto_657323 ) ) ( not ( = ?auto_657317 ?auto_657324 ) ) ( not ( = ?auto_657317 ?auto_657325 ) ) ( not ( = ?auto_657317 ?auto_657326 ) ) ( not ( = ?auto_657317 ?auto_657327 ) ) ( not ( = ?auto_657317 ?auto_657328 ) ) ( not ( = ?auto_657317 ?auto_657329 ) ) ( not ( = ?auto_657317 ?auto_657330 ) ) ( not ( = ?auto_657317 ?auto_657331 ) ) ( not ( = ?auto_657317 ?auto_657332 ) ) ( not ( = ?auto_657317 ?auto_657333 ) ) ( not ( = ?auto_657318 ?auto_657319 ) ) ( not ( = ?auto_657318 ?auto_657320 ) ) ( not ( = ?auto_657318 ?auto_657321 ) ) ( not ( = ?auto_657318 ?auto_657322 ) ) ( not ( = ?auto_657318 ?auto_657323 ) ) ( not ( = ?auto_657318 ?auto_657324 ) ) ( not ( = ?auto_657318 ?auto_657325 ) ) ( not ( = ?auto_657318 ?auto_657326 ) ) ( not ( = ?auto_657318 ?auto_657327 ) ) ( not ( = ?auto_657318 ?auto_657328 ) ) ( not ( = ?auto_657318 ?auto_657329 ) ) ( not ( = ?auto_657318 ?auto_657330 ) ) ( not ( = ?auto_657318 ?auto_657331 ) ) ( not ( = ?auto_657318 ?auto_657332 ) ) ( not ( = ?auto_657318 ?auto_657333 ) ) ( not ( = ?auto_657319 ?auto_657320 ) ) ( not ( = ?auto_657319 ?auto_657321 ) ) ( not ( = ?auto_657319 ?auto_657322 ) ) ( not ( = ?auto_657319 ?auto_657323 ) ) ( not ( = ?auto_657319 ?auto_657324 ) ) ( not ( = ?auto_657319 ?auto_657325 ) ) ( not ( = ?auto_657319 ?auto_657326 ) ) ( not ( = ?auto_657319 ?auto_657327 ) ) ( not ( = ?auto_657319 ?auto_657328 ) ) ( not ( = ?auto_657319 ?auto_657329 ) ) ( not ( = ?auto_657319 ?auto_657330 ) ) ( not ( = ?auto_657319 ?auto_657331 ) ) ( not ( = ?auto_657319 ?auto_657332 ) ) ( not ( = ?auto_657319 ?auto_657333 ) ) ( not ( = ?auto_657320 ?auto_657321 ) ) ( not ( = ?auto_657320 ?auto_657322 ) ) ( not ( = ?auto_657320 ?auto_657323 ) ) ( not ( = ?auto_657320 ?auto_657324 ) ) ( not ( = ?auto_657320 ?auto_657325 ) ) ( not ( = ?auto_657320 ?auto_657326 ) ) ( not ( = ?auto_657320 ?auto_657327 ) ) ( not ( = ?auto_657320 ?auto_657328 ) ) ( not ( = ?auto_657320 ?auto_657329 ) ) ( not ( = ?auto_657320 ?auto_657330 ) ) ( not ( = ?auto_657320 ?auto_657331 ) ) ( not ( = ?auto_657320 ?auto_657332 ) ) ( not ( = ?auto_657320 ?auto_657333 ) ) ( not ( = ?auto_657321 ?auto_657322 ) ) ( not ( = ?auto_657321 ?auto_657323 ) ) ( not ( = ?auto_657321 ?auto_657324 ) ) ( not ( = ?auto_657321 ?auto_657325 ) ) ( not ( = ?auto_657321 ?auto_657326 ) ) ( not ( = ?auto_657321 ?auto_657327 ) ) ( not ( = ?auto_657321 ?auto_657328 ) ) ( not ( = ?auto_657321 ?auto_657329 ) ) ( not ( = ?auto_657321 ?auto_657330 ) ) ( not ( = ?auto_657321 ?auto_657331 ) ) ( not ( = ?auto_657321 ?auto_657332 ) ) ( not ( = ?auto_657321 ?auto_657333 ) ) ( not ( = ?auto_657322 ?auto_657323 ) ) ( not ( = ?auto_657322 ?auto_657324 ) ) ( not ( = ?auto_657322 ?auto_657325 ) ) ( not ( = ?auto_657322 ?auto_657326 ) ) ( not ( = ?auto_657322 ?auto_657327 ) ) ( not ( = ?auto_657322 ?auto_657328 ) ) ( not ( = ?auto_657322 ?auto_657329 ) ) ( not ( = ?auto_657322 ?auto_657330 ) ) ( not ( = ?auto_657322 ?auto_657331 ) ) ( not ( = ?auto_657322 ?auto_657332 ) ) ( not ( = ?auto_657322 ?auto_657333 ) ) ( not ( = ?auto_657323 ?auto_657324 ) ) ( not ( = ?auto_657323 ?auto_657325 ) ) ( not ( = ?auto_657323 ?auto_657326 ) ) ( not ( = ?auto_657323 ?auto_657327 ) ) ( not ( = ?auto_657323 ?auto_657328 ) ) ( not ( = ?auto_657323 ?auto_657329 ) ) ( not ( = ?auto_657323 ?auto_657330 ) ) ( not ( = ?auto_657323 ?auto_657331 ) ) ( not ( = ?auto_657323 ?auto_657332 ) ) ( not ( = ?auto_657323 ?auto_657333 ) ) ( not ( = ?auto_657324 ?auto_657325 ) ) ( not ( = ?auto_657324 ?auto_657326 ) ) ( not ( = ?auto_657324 ?auto_657327 ) ) ( not ( = ?auto_657324 ?auto_657328 ) ) ( not ( = ?auto_657324 ?auto_657329 ) ) ( not ( = ?auto_657324 ?auto_657330 ) ) ( not ( = ?auto_657324 ?auto_657331 ) ) ( not ( = ?auto_657324 ?auto_657332 ) ) ( not ( = ?auto_657324 ?auto_657333 ) ) ( not ( = ?auto_657325 ?auto_657326 ) ) ( not ( = ?auto_657325 ?auto_657327 ) ) ( not ( = ?auto_657325 ?auto_657328 ) ) ( not ( = ?auto_657325 ?auto_657329 ) ) ( not ( = ?auto_657325 ?auto_657330 ) ) ( not ( = ?auto_657325 ?auto_657331 ) ) ( not ( = ?auto_657325 ?auto_657332 ) ) ( not ( = ?auto_657325 ?auto_657333 ) ) ( not ( = ?auto_657326 ?auto_657327 ) ) ( not ( = ?auto_657326 ?auto_657328 ) ) ( not ( = ?auto_657326 ?auto_657329 ) ) ( not ( = ?auto_657326 ?auto_657330 ) ) ( not ( = ?auto_657326 ?auto_657331 ) ) ( not ( = ?auto_657326 ?auto_657332 ) ) ( not ( = ?auto_657326 ?auto_657333 ) ) ( not ( = ?auto_657327 ?auto_657328 ) ) ( not ( = ?auto_657327 ?auto_657329 ) ) ( not ( = ?auto_657327 ?auto_657330 ) ) ( not ( = ?auto_657327 ?auto_657331 ) ) ( not ( = ?auto_657327 ?auto_657332 ) ) ( not ( = ?auto_657327 ?auto_657333 ) ) ( not ( = ?auto_657328 ?auto_657329 ) ) ( not ( = ?auto_657328 ?auto_657330 ) ) ( not ( = ?auto_657328 ?auto_657331 ) ) ( not ( = ?auto_657328 ?auto_657332 ) ) ( not ( = ?auto_657328 ?auto_657333 ) ) ( not ( = ?auto_657329 ?auto_657330 ) ) ( not ( = ?auto_657329 ?auto_657331 ) ) ( not ( = ?auto_657329 ?auto_657332 ) ) ( not ( = ?auto_657329 ?auto_657333 ) ) ( not ( = ?auto_657330 ?auto_657331 ) ) ( not ( = ?auto_657330 ?auto_657332 ) ) ( not ( = ?auto_657330 ?auto_657333 ) ) ( not ( = ?auto_657331 ?auto_657332 ) ) ( not ( = ?auto_657331 ?auto_657333 ) ) ( not ( = ?auto_657332 ?auto_657333 ) ) ( ON ?auto_657332 ?auto_657333 ) ( ON ?auto_657331 ?auto_657332 ) ( ON ?auto_657330 ?auto_657331 ) ( ON ?auto_657329 ?auto_657330 ) ( ON ?auto_657328 ?auto_657329 ) ( ON ?auto_657327 ?auto_657328 ) ( ON ?auto_657326 ?auto_657327 ) ( ON ?auto_657325 ?auto_657326 ) ( ON ?auto_657324 ?auto_657325 ) ( ON ?auto_657323 ?auto_657324 ) ( ON ?auto_657322 ?auto_657323 ) ( ON ?auto_657321 ?auto_657322 ) ( CLEAR ?auto_657319 ) ( ON ?auto_657320 ?auto_657321 ) ( CLEAR ?auto_657320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_657317 ?auto_657318 ?auto_657319 ?auto_657320 )
      ( MAKE-17PILE ?auto_657317 ?auto_657318 ?auto_657319 ?auto_657320 ?auto_657321 ?auto_657322 ?auto_657323 ?auto_657324 ?auto_657325 ?auto_657326 ?auto_657327 ?auto_657328 ?auto_657329 ?auto_657330 ?auto_657331 ?auto_657332 ?auto_657333 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_657351 - BLOCK
      ?auto_657352 - BLOCK
      ?auto_657353 - BLOCK
      ?auto_657354 - BLOCK
      ?auto_657355 - BLOCK
      ?auto_657356 - BLOCK
      ?auto_657357 - BLOCK
      ?auto_657358 - BLOCK
      ?auto_657359 - BLOCK
      ?auto_657360 - BLOCK
      ?auto_657361 - BLOCK
      ?auto_657362 - BLOCK
      ?auto_657363 - BLOCK
      ?auto_657364 - BLOCK
      ?auto_657365 - BLOCK
      ?auto_657366 - BLOCK
      ?auto_657367 - BLOCK
    )
    :vars
    (
      ?auto_657368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_657367 ?auto_657368 ) ( ON-TABLE ?auto_657351 ) ( ON ?auto_657352 ?auto_657351 ) ( not ( = ?auto_657351 ?auto_657352 ) ) ( not ( = ?auto_657351 ?auto_657353 ) ) ( not ( = ?auto_657351 ?auto_657354 ) ) ( not ( = ?auto_657351 ?auto_657355 ) ) ( not ( = ?auto_657351 ?auto_657356 ) ) ( not ( = ?auto_657351 ?auto_657357 ) ) ( not ( = ?auto_657351 ?auto_657358 ) ) ( not ( = ?auto_657351 ?auto_657359 ) ) ( not ( = ?auto_657351 ?auto_657360 ) ) ( not ( = ?auto_657351 ?auto_657361 ) ) ( not ( = ?auto_657351 ?auto_657362 ) ) ( not ( = ?auto_657351 ?auto_657363 ) ) ( not ( = ?auto_657351 ?auto_657364 ) ) ( not ( = ?auto_657351 ?auto_657365 ) ) ( not ( = ?auto_657351 ?auto_657366 ) ) ( not ( = ?auto_657351 ?auto_657367 ) ) ( not ( = ?auto_657351 ?auto_657368 ) ) ( not ( = ?auto_657352 ?auto_657353 ) ) ( not ( = ?auto_657352 ?auto_657354 ) ) ( not ( = ?auto_657352 ?auto_657355 ) ) ( not ( = ?auto_657352 ?auto_657356 ) ) ( not ( = ?auto_657352 ?auto_657357 ) ) ( not ( = ?auto_657352 ?auto_657358 ) ) ( not ( = ?auto_657352 ?auto_657359 ) ) ( not ( = ?auto_657352 ?auto_657360 ) ) ( not ( = ?auto_657352 ?auto_657361 ) ) ( not ( = ?auto_657352 ?auto_657362 ) ) ( not ( = ?auto_657352 ?auto_657363 ) ) ( not ( = ?auto_657352 ?auto_657364 ) ) ( not ( = ?auto_657352 ?auto_657365 ) ) ( not ( = ?auto_657352 ?auto_657366 ) ) ( not ( = ?auto_657352 ?auto_657367 ) ) ( not ( = ?auto_657352 ?auto_657368 ) ) ( not ( = ?auto_657353 ?auto_657354 ) ) ( not ( = ?auto_657353 ?auto_657355 ) ) ( not ( = ?auto_657353 ?auto_657356 ) ) ( not ( = ?auto_657353 ?auto_657357 ) ) ( not ( = ?auto_657353 ?auto_657358 ) ) ( not ( = ?auto_657353 ?auto_657359 ) ) ( not ( = ?auto_657353 ?auto_657360 ) ) ( not ( = ?auto_657353 ?auto_657361 ) ) ( not ( = ?auto_657353 ?auto_657362 ) ) ( not ( = ?auto_657353 ?auto_657363 ) ) ( not ( = ?auto_657353 ?auto_657364 ) ) ( not ( = ?auto_657353 ?auto_657365 ) ) ( not ( = ?auto_657353 ?auto_657366 ) ) ( not ( = ?auto_657353 ?auto_657367 ) ) ( not ( = ?auto_657353 ?auto_657368 ) ) ( not ( = ?auto_657354 ?auto_657355 ) ) ( not ( = ?auto_657354 ?auto_657356 ) ) ( not ( = ?auto_657354 ?auto_657357 ) ) ( not ( = ?auto_657354 ?auto_657358 ) ) ( not ( = ?auto_657354 ?auto_657359 ) ) ( not ( = ?auto_657354 ?auto_657360 ) ) ( not ( = ?auto_657354 ?auto_657361 ) ) ( not ( = ?auto_657354 ?auto_657362 ) ) ( not ( = ?auto_657354 ?auto_657363 ) ) ( not ( = ?auto_657354 ?auto_657364 ) ) ( not ( = ?auto_657354 ?auto_657365 ) ) ( not ( = ?auto_657354 ?auto_657366 ) ) ( not ( = ?auto_657354 ?auto_657367 ) ) ( not ( = ?auto_657354 ?auto_657368 ) ) ( not ( = ?auto_657355 ?auto_657356 ) ) ( not ( = ?auto_657355 ?auto_657357 ) ) ( not ( = ?auto_657355 ?auto_657358 ) ) ( not ( = ?auto_657355 ?auto_657359 ) ) ( not ( = ?auto_657355 ?auto_657360 ) ) ( not ( = ?auto_657355 ?auto_657361 ) ) ( not ( = ?auto_657355 ?auto_657362 ) ) ( not ( = ?auto_657355 ?auto_657363 ) ) ( not ( = ?auto_657355 ?auto_657364 ) ) ( not ( = ?auto_657355 ?auto_657365 ) ) ( not ( = ?auto_657355 ?auto_657366 ) ) ( not ( = ?auto_657355 ?auto_657367 ) ) ( not ( = ?auto_657355 ?auto_657368 ) ) ( not ( = ?auto_657356 ?auto_657357 ) ) ( not ( = ?auto_657356 ?auto_657358 ) ) ( not ( = ?auto_657356 ?auto_657359 ) ) ( not ( = ?auto_657356 ?auto_657360 ) ) ( not ( = ?auto_657356 ?auto_657361 ) ) ( not ( = ?auto_657356 ?auto_657362 ) ) ( not ( = ?auto_657356 ?auto_657363 ) ) ( not ( = ?auto_657356 ?auto_657364 ) ) ( not ( = ?auto_657356 ?auto_657365 ) ) ( not ( = ?auto_657356 ?auto_657366 ) ) ( not ( = ?auto_657356 ?auto_657367 ) ) ( not ( = ?auto_657356 ?auto_657368 ) ) ( not ( = ?auto_657357 ?auto_657358 ) ) ( not ( = ?auto_657357 ?auto_657359 ) ) ( not ( = ?auto_657357 ?auto_657360 ) ) ( not ( = ?auto_657357 ?auto_657361 ) ) ( not ( = ?auto_657357 ?auto_657362 ) ) ( not ( = ?auto_657357 ?auto_657363 ) ) ( not ( = ?auto_657357 ?auto_657364 ) ) ( not ( = ?auto_657357 ?auto_657365 ) ) ( not ( = ?auto_657357 ?auto_657366 ) ) ( not ( = ?auto_657357 ?auto_657367 ) ) ( not ( = ?auto_657357 ?auto_657368 ) ) ( not ( = ?auto_657358 ?auto_657359 ) ) ( not ( = ?auto_657358 ?auto_657360 ) ) ( not ( = ?auto_657358 ?auto_657361 ) ) ( not ( = ?auto_657358 ?auto_657362 ) ) ( not ( = ?auto_657358 ?auto_657363 ) ) ( not ( = ?auto_657358 ?auto_657364 ) ) ( not ( = ?auto_657358 ?auto_657365 ) ) ( not ( = ?auto_657358 ?auto_657366 ) ) ( not ( = ?auto_657358 ?auto_657367 ) ) ( not ( = ?auto_657358 ?auto_657368 ) ) ( not ( = ?auto_657359 ?auto_657360 ) ) ( not ( = ?auto_657359 ?auto_657361 ) ) ( not ( = ?auto_657359 ?auto_657362 ) ) ( not ( = ?auto_657359 ?auto_657363 ) ) ( not ( = ?auto_657359 ?auto_657364 ) ) ( not ( = ?auto_657359 ?auto_657365 ) ) ( not ( = ?auto_657359 ?auto_657366 ) ) ( not ( = ?auto_657359 ?auto_657367 ) ) ( not ( = ?auto_657359 ?auto_657368 ) ) ( not ( = ?auto_657360 ?auto_657361 ) ) ( not ( = ?auto_657360 ?auto_657362 ) ) ( not ( = ?auto_657360 ?auto_657363 ) ) ( not ( = ?auto_657360 ?auto_657364 ) ) ( not ( = ?auto_657360 ?auto_657365 ) ) ( not ( = ?auto_657360 ?auto_657366 ) ) ( not ( = ?auto_657360 ?auto_657367 ) ) ( not ( = ?auto_657360 ?auto_657368 ) ) ( not ( = ?auto_657361 ?auto_657362 ) ) ( not ( = ?auto_657361 ?auto_657363 ) ) ( not ( = ?auto_657361 ?auto_657364 ) ) ( not ( = ?auto_657361 ?auto_657365 ) ) ( not ( = ?auto_657361 ?auto_657366 ) ) ( not ( = ?auto_657361 ?auto_657367 ) ) ( not ( = ?auto_657361 ?auto_657368 ) ) ( not ( = ?auto_657362 ?auto_657363 ) ) ( not ( = ?auto_657362 ?auto_657364 ) ) ( not ( = ?auto_657362 ?auto_657365 ) ) ( not ( = ?auto_657362 ?auto_657366 ) ) ( not ( = ?auto_657362 ?auto_657367 ) ) ( not ( = ?auto_657362 ?auto_657368 ) ) ( not ( = ?auto_657363 ?auto_657364 ) ) ( not ( = ?auto_657363 ?auto_657365 ) ) ( not ( = ?auto_657363 ?auto_657366 ) ) ( not ( = ?auto_657363 ?auto_657367 ) ) ( not ( = ?auto_657363 ?auto_657368 ) ) ( not ( = ?auto_657364 ?auto_657365 ) ) ( not ( = ?auto_657364 ?auto_657366 ) ) ( not ( = ?auto_657364 ?auto_657367 ) ) ( not ( = ?auto_657364 ?auto_657368 ) ) ( not ( = ?auto_657365 ?auto_657366 ) ) ( not ( = ?auto_657365 ?auto_657367 ) ) ( not ( = ?auto_657365 ?auto_657368 ) ) ( not ( = ?auto_657366 ?auto_657367 ) ) ( not ( = ?auto_657366 ?auto_657368 ) ) ( not ( = ?auto_657367 ?auto_657368 ) ) ( ON ?auto_657366 ?auto_657367 ) ( ON ?auto_657365 ?auto_657366 ) ( ON ?auto_657364 ?auto_657365 ) ( ON ?auto_657363 ?auto_657364 ) ( ON ?auto_657362 ?auto_657363 ) ( ON ?auto_657361 ?auto_657362 ) ( ON ?auto_657360 ?auto_657361 ) ( ON ?auto_657359 ?auto_657360 ) ( ON ?auto_657358 ?auto_657359 ) ( ON ?auto_657357 ?auto_657358 ) ( ON ?auto_657356 ?auto_657357 ) ( ON ?auto_657355 ?auto_657356 ) ( ON ?auto_657354 ?auto_657355 ) ( CLEAR ?auto_657352 ) ( ON ?auto_657353 ?auto_657354 ) ( CLEAR ?auto_657353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_657351 ?auto_657352 ?auto_657353 )
      ( MAKE-17PILE ?auto_657351 ?auto_657352 ?auto_657353 ?auto_657354 ?auto_657355 ?auto_657356 ?auto_657357 ?auto_657358 ?auto_657359 ?auto_657360 ?auto_657361 ?auto_657362 ?auto_657363 ?auto_657364 ?auto_657365 ?auto_657366 ?auto_657367 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_657386 - BLOCK
      ?auto_657387 - BLOCK
      ?auto_657388 - BLOCK
      ?auto_657389 - BLOCK
      ?auto_657390 - BLOCK
      ?auto_657391 - BLOCK
      ?auto_657392 - BLOCK
      ?auto_657393 - BLOCK
      ?auto_657394 - BLOCK
      ?auto_657395 - BLOCK
      ?auto_657396 - BLOCK
      ?auto_657397 - BLOCK
      ?auto_657398 - BLOCK
      ?auto_657399 - BLOCK
      ?auto_657400 - BLOCK
      ?auto_657401 - BLOCK
      ?auto_657402 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_657402 ) ( ON-TABLE ?auto_657386 ) ( ON ?auto_657387 ?auto_657386 ) ( not ( = ?auto_657386 ?auto_657387 ) ) ( not ( = ?auto_657386 ?auto_657388 ) ) ( not ( = ?auto_657386 ?auto_657389 ) ) ( not ( = ?auto_657386 ?auto_657390 ) ) ( not ( = ?auto_657386 ?auto_657391 ) ) ( not ( = ?auto_657386 ?auto_657392 ) ) ( not ( = ?auto_657386 ?auto_657393 ) ) ( not ( = ?auto_657386 ?auto_657394 ) ) ( not ( = ?auto_657386 ?auto_657395 ) ) ( not ( = ?auto_657386 ?auto_657396 ) ) ( not ( = ?auto_657386 ?auto_657397 ) ) ( not ( = ?auto_657386 ?auto_657398 ) ) ( not ( = ?auto_657386 ?auto_657399 ) ) ( not ( = ?auto_657386 ?auto_657400 ) ) ( not ( = ?auto_657386 ?auto_657401 ) ) ( not ( = ?auto_657386 ?auto_657402 ) ) ( not ( = ?auto_657387 ?auto_657388 ) ) ( not ( = ?auto_657387 ?auto_657389 ) ) ( not ( = ?auto_657387 ?auto_657390 ) ) ( not ( = ?auto_657387 ?auto_657391 ) ) ( not ( = ?auto_657387 ?auto_657392 ) ) ( not ( = ?auto_657387 ?auto_657393 ) ) ( not ( = ?auto_657387 ?auto_657394 ) ) ( not ( = ?auto_657387 ?auto_657395 ) ) ( not ( = ?auto_657387 ?auto_657396 ) ) ( not ( = ?auto_657387 ?auto_657397 ) ) ( not ( = ?auto_657387 ?auto_657398 ) ) ( not ( = ?auto_657387 ?auto_657399 ) ) ( not ( = ?auto_657387 ?auto_657400 ) ) ( not ( = ?auto_657387 ?auto_657401 ) ) ( not ( = ?auto_657387 ?auto_657402 ) ) ( not ( = ?auto_657388 ?auto_657389 ) ) ( not ( = ?auto_657388 ?auto_657390 ) ) ( not ( = ?auto_657388 ?auto_657391 ) ) ( not ( = ?auto_657388 ?auto_657392 ) ) ( not ( = ?auto_657388 ?auto_657393 ) ) ( not ( = ?auto_657388 ?auto_657394 ) ) ( not ( = ?auto_657388 ?auto_657395 ) ) ( not ( = ?auto_657388 ?auto_657396 ) ) ( not ( = ?auto_657388 ?auto_657397 ) ) ( not ( = ?auto_657388 ?auto_657398 ) ) ( not ( = ?auto_657388 ?auto_657399 ) ) ( not ( = ?auto_657388 ?auto_657400 ) ) ( not ( = ?auto_657388 ?auto_657401 ) ) ( not ( = ?auto_657388 ?auto_657402 ) ) ( not ( = ?auto_657389 ?auto_657390 ) ) ( not ( = ?auto_657389 ?auto_657391 ) ) ( not ( = ?auto_657389 ?auto_657392 ) ) ( not ( = ?auto_657389 ?auto_657393 ) ) ( not ( = ?auto_657389 ?auto_657394 ) ) ( not ( = ?auto_657389 ?auto_657395 ) ) ( not ( = ?auto_657389 ?auto_657396 ) ) ( not ( = ?auto_657389 ?auto_657397 ) ) ( not ( = ?auto_657389 ?auto_657398 ) ) ( not ( = ?auto_657389 ?auto_657399 ) ) ( not ( = ?auto_657389 ?auto_657400 ) ) ( not ( = ?auto_657389 ?auto_657401 ) ) ( not ( = ?auto_657389 ?auto_657402 ) ) ( not ( = ?auto_657390 ?auto_657391 ) ) ( not ( = ?auto_657390 ?auto_657392 ) ) ( not ( = ?auto_657390 ?auto_657393 ) ) ( not ( = ?auto_657390 ?auto_657394 ) ) ( not ( = ?auto_657390 ?auto_657395 ) ) ( not ( = ?auto_657390 ?auto_657396 ) ) ( not ( = ?auto_657390 ?auto_657397 ) ) ( not ( = ?auto_657390 ?auto_657398 ) ) ( not ( = ?auto_657390 ?auto_657399 ) ) ( not ( = ?auto_657390 ?auto_657400 ) ) ( not ( = ?auto_657390 ?auto_657401 ) ) ( not ( = ?auto_657390 ?auto_657402 ) ) ( not ( = ?auto_657391 ?auto_657392 ) ) ( not ( = ?auto_657391 ?auto_657393 ) ) ( not ( = ?auto_657391 ?auto_657394 ) ) ( not ( = ?auto_657391 ?auto_657395 ) ) ( not ( = ?auto_657391 ?auto_657396 ) ) ( not ( = ?auto_657391 ?auto_657397 ) ) ( not ( = ?auto_657391 ?auto_657398 ) ) ( not ( = ?auto_657391 ?auto_657399 ) ) ( not ( = ?auto_657391 ?auto_657400 ) ) ( not ( = ?auto_657391 ?auto_657401 ) ) ( not ( = ?auto_657391 ?auto_657402 ) ) ( not ( = ?auto_657392 ?auto_657393 ) ) ( not ( = ?auto_657392 ?auto_657394 ) ) ( not ( = ?auto_657392 ?auto_657395 ) ) ( not ( = ?auto_657392 ?auto_657396 ) ) ( not ( = ?auto_657392 ?auto_657397 ) ) ( not ( = ?auto_657392 ?auto_657398 ) ) ( not ( = ?auto_657392 ?auto_657399 ) ) ( not ( = ?auto_657392 ?auto_657400 ) ) ( not ( = ?auto_657392 ?auto_657401 ) ) ( not ( = ?auto_657392 ?auto_657402 ) ) ( not ( = ?auto_657393 ?auto_657394 ) ) ( not ( = ?auto_657393 ?auto_657395 ) ) ( not ( = ?auto_657393 ?auto_657396 ) ) ( not ( = ?auto_657393 ?auto_657397 ) ) ( not ( = ?auto_657393 ?auto_657398 ) ) ( not ( = ?auto_657393 ?auto_657399 ) ) ( not ( = ?auto_657393 ?auto_657400 ) ) ( not ( = ?auto_657393 ?auto_657401 ) ) ( not ( = ?auto_657393 ?auto_657402 ) ) ( not ( = ?auto_657394 ?auto_657395 ) ) ( not ( = ?auto_657394 ?auto_657396 ) ) ( not ( = ?auto_657394 ?auto_657397 ) ) ( not ( = ?auto_657394 ?auto_657398 ) ) ( not ( = ?auto_657394 ?auto_657399 ) ) ( not ( = ?auto_657394 ?auto_657400 ) ) ( not ( = ?auto_657394 ?auto_657401 ) ) ( not ( = ?auto_657394 ?auto_657402 ) ) ( not ( = ?auto_657395 ?auto_657396 ) ) ( not ( = ?auto_657395 ?auto_657397 ) ) ( not ( = ?auto_657395 ?auto_657398 ) ) ( not ( = ?auto_657395 ?auto_657399 ) ) ( not ( = ?auto_657395 ?auto_657400 ) ) ( not ( = ?auto_657395 ?auto_657401 ) ) ( not ( = ?auto_657395 ?auto_657402 ) ) ( not ( = ?auto_657396 ?auto_657397 ) ) ( not ( = ?auto_657396 ?auto_657398 ) ) ( not ( = ?auto_657396 ?auto_657399 ) ) ( not ( = ?auto_657396 ?auto_657400 ) ) ( not ( = ?auto_657396 ?auto_657401 ) ) ( not ( = ?auto_657396 ?auto_657402 ) ) ( not ( = ?auto_657397 ?auto_657398 ) ) ( not ( = ?auto_657397 ?auto_657399 ) ) ( not ( = ?auto_657397 ?auto_657400 ) ) ( not ( = ?auto_657397 ?auto_657401 ) ) ( not ( = ?auto_657397 ?auto_657402 ) ) ( not ( = ?auto_657398 ?auto_657399 ) ) ( not ( = ?auto_657398 ?auto_657400 ) ) ( not ( = ?auto_657398 ?auto_657401 ) ) ( not ( = ?auto_657398 ?auto_657402 ) ) ( not ( = ?auto_657399 ?auto_657400 ) ) ( not ( = ?auto_657399 ?auto_657401 ) ) ( not ( = ?auto_657399 ?auto_657402 ) ) ( not ( = ?auto_657400 ?auto_657401 ) ) ( not ( = ?auto_657400 ?auto_657402 ) ) ( not ( = ?auto_657401 ?auto_657402 ) ) ( ON ?auto_657401 ?auto_657402 ) ( ON ?auto_657400 ?auto_657401 ) ( ON ?auto_657399 ?auto_657400 ) ( ON ?auto_657398 ?auto_657399 ) ( ON ?auto_657397 ?auto_657398 ) ( ON ?auto_657396 ?auto_657397 ) ( ON ?auto_657395 ?auto_657396 ) ( ON ?auto_657394 ?auto_657395 ) ( ON ?auto_657393 ?auto_657394 ) ( ON ?auto_657392 ?auto_657393 ) ( ON ?auto_657391 ?auto_657392 ) ( ON ?auto_657390 ?auto_657391 ) ( ON ?auto_657389 ?auto_657390 ) ( CLEAR ?auto_657387 ) ( ON ?auto_657388 ?auto_657389 ) ( CLEAR ?auto_657388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_657386 ?auto_657387 ?auto_657388 )
      ( MAKE-17PILE ?auto_657386 ?auto_657387 ?auto_657388 ?auto_657389 ?auto_657390 ?auto_657391 ?auto_657392 ?auto_657393 ?auto_657394 ?auto_657395 ?auto_657396 ?auto_657397 ?auto_657398 ?auto_657399 ?auto_657400 ?auto_657401 ?auto_657402 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_657420 - BLOCK
      ?auto_657421 - BLOCK
      ?auto_657422 - BLOCK
      ?auto_657423 - BLOCK
      ?auto_657424 - BLOCK
      ?auto_657425 - BLOCK
      ?auto_657426 - BLOCK
      ?auto_657427 - BLOCK
      ?auto_657428 - BLOCK
      ?auto_657429 - BLOCK
      ?auto_657430 - BLOCK
      ?auto_657431 - BLOCK
      ?auto_657432 - BLOCK
      ?auto_657433 - BLOCK
      ?auto_657434 - BLOCK
      ?auto_657435 - BLOCK
      ?auto_657436 - BLOCK
    )
    :vars
    (
      ?auto_657437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_657436 ?auto_657437 ) ( ON-TABLE ?auto_657420 ) ( not ( = ?auto_657420 ?auto_657421 ) ) ( not ( = ?auto_657420 ?auto_657422 ) ) ( not ( = ?auto_657420 ?auto_657423 ) ) ( not ( = ?auto_657420 ?auto_657424 ) ) ( not ( = ?auto_657420 ?auto_657425 ) ) ( not ( = ?auto_657420 ?auto_657426 ) ) ( not ( = ?auto_657420 ?auto_657427 ) ) ( not ( = ?auto_657420 ?auto_657428 ) ) ( not ( = ?auto_657420 ?auto_657429 ) ) ( not ( = ?auto_657420 ?auto_657430 ) ) ( not ( = ?auto_657420 ?auto_657431 ) ) ( not ( = ?auto_657420 ?auto_657432 ) ) ( not ( = ?auto_657420 ?auto_657433 ) ) ( not ( = ?auto_657420 ?auto_657434 ) ) ( not ( = ?auto_657420 ?auto_657435 ) ) ( not ( = ?auto_657420 ?auto_657436 ) ) ( not ( = ?auto_657420 ?auto_657437 ) ) ( not ( = ?auto_657421 ?auto_657422 ) ) ( not ( = ?auto_657421 ?auto_657423 ) ) ( not ( = ?auto_657421 ?auto_657424 ) ) ( not ( = ?auto_657421 ?auto_657425 ) ) ( not ( = ?auto_657421 ?auto_657426 ) ) ( not ( = ?auto_657421 ?auto_657427 ) ) ( not ( = ?auto_657421 ?auto_657428 ) ) ( not ( = ?auto_657421 ?auto_657429 ) ) ( not ( = ?auto_657421 ?auto_657430 ) ) ( not ( = ?auto_657421 ?auto_657431 ) ) ( not ( = ?auto_657421 ?auto_657432 ) ) ( not ( = ?auto_657421 ?auto_657433 ) ) ( not ( = ?auto_657421 ?auto_657434 ) ) ( not ( = ?auto_657421 ?auto_657435 ) ) ( not ( = ?auto_657421 ?auto_657436 ) ) ( not ( = ?auto_657421 ?auto_657437 ) ) ( not ( = ?auto_657422 ?auto_657423 ) ) ( not ( = ?auto_657422 ?auto_657424 ) ) ( not ( = ?auto_657422 ?auto_657425 ) ) ( not ( = ?auto_657422 ?auto_657426 ) ) ( not ( = ?auto_657422 ?auto_657427 ) ) ( not ( = ?auto_657422 ?auto_657428 ) ) ( not ( = ?auto_657422 ?auto_657429 ) ) ( not ( = ?auto_657422 ?auto_657430 ) ) ( not ( = ?auto_657422 ?auto_657431 ) ) ( not ( = ?auto_657422 ?auto_657432 ) ) ( not ( = ?auto_657422 ?auto_657433 ) ) ( not ( = ?auto_657422 ?auto_657434 ) ) ( not ( = ?auto_657422 ?auto_657435 ) ) ( not ( = ?auto_657422 ?auto_657436 ) ) ( not ( = ?auto_657422 ?auto_657437 ) ) ( not ( = ?auto_657423 ?auto_657424 ) ) ( not ( = ?auto_657423 ?auto_657425 ) ) ( not ( = ?auto_657423 ?auto_657426 ) ) ( not ( = ?auto_657423 ?auto_657427 ) ) ( not ( = ?auto_657423 ?auto_657428 ) ) ( not ( = ?auto_657423 ?auto_657429 ) ) ( not ( = ?auto_657423 ?auto_657430 ) ) ( not ( = ?auto_657423 ?auto_657431 ) ) ( not ( = ?auto_657423 ?auto_657432 ) ) ( not ( = ?auto_657423 ?auto_657433 ) ) ( not ( = ?auto_657423 ?auto_657434 ) ) ( not ( = ?auto_657423 ?auto_657435 ) ) ( not ( = ?auto_657423 ?auto_657436 ) ) ( not ( = ?auto_657423 ?auto_657437 ) ) ( not ( = ?auto_657424 ?auto_657425 ) ) ( not ( = ?auto_657424 ?auto_657426 ) ) ( not ( = ?auto_657424 ?auto_657427 ) ) ( not ( = ?auto_657424 ?auto_657428 ) ) ( not ( = ?auto_657424 ?auto_657429 ) ) ( not ( = ?auto_657424 ?auto_657430 ) ) ( not ( = ?auto_657424 ?auto_657431 ) ) ( not ( = ?auto_657424 ?auto_657432 ) ) ( not ( = ?auto_657424 ?auto_657433 ) ) ( not ( = ?auto_657424 ?auto_657434 ) ) ( not ( = ?auto_657424 ?auto_657435 ) ) ( not ( = ?auto_657424 ?auto_657436 ) ) ( not ( = ?auto_657424 ?auto_657437 ) ) ( not ( = ?auto_657425 ?auto_657426 ) ) ( not ( = ?auto_657425 ?auto_657427 ) ) ( not ( = ?auto_657425 ?auto_657428 ) ) ( not ( = ?auto_657425 ?auto_657429 ) ) ( not ( = ?auto_657425 ?auto_657430 ) ) ( not ( = ?auto_657425 ?auto_657431 ) ) ( not ( = ?auto_657425 ?auto_657432 ) ) ( not ( = ?auto_657425 ?auto_657433 ) ) ( not ( = ?auto_657425 ?auto_657434 ) ) ( not ( = ?auto_657425 ?auto_657435 ) ) ( not ( = ?auto_657425 ?auto_657436 ) ) ( not ( = ?auto_657425 ?auto_657437 ) ) ( not ( = ?auto_657426 ?auto_657427 ) ) ( not ( = ?auto_657426 ?auto_657428 ) ) ( not ( = ?auto_657426 ?auto_657429 ) ) ( not ( = ?auto_657426 ?auto_657430 ) ) ( not ( = ?auto_657426 ?auto_657431 ) ) ( not ( = ?auto_657426 ?auto_657432 ) ) ( not ( = ?auto_657426 ?auto_657433 ) ) ( not ( = ?auto_657426 ?auto_657434 ) ) ( not ( = ?auto_657426 ?auto_657435 ) ) ( not ( = ?auto_657426 ?auto_657436 ) ) ( not ( = ?auto_657426 ?auto_657437 ) ) ( not ( = ?auto_657427 ?auto_657428 ) ) ( not ( = ?auto_657427 ?auto_657429 ) ) ( not ( = ?auto_657427 ?auto_657430 ) ) ( not ( = ?auto_657427 ?auto_657431 ) ) ( not ( = ?auto_657427 ?auto_657432 ) ) ( not ( = ?auto_657427 ?auto_657433 ) ) ( not ( = ?auto_657427 ?auto_657434 ) ) ( not ( = ?auto_657427 ?auto_657435 ) ) ( not ( = ?auto_657427 ?auto_657436 ) ) ( not ( = ?auto_657427 ?auto_657437 ) ) ( not ( = ?auto_657428 ?auto_657429 ) ) ( not ( = ?auto_657428 ?auto_657430 ) ) ( not ( = ?auto_657428 ?auto_657431 ) ) ( not ( = ?auto_657428 ?auto_657432 ) ) ( not ( = ?auto_657428 ?auto_657433 ) ) ( not ( = ?auto_657428 ?auto_657434 ) ) ( not ( = ?auto_657428 ?auto_657435 ) ) ( not ( = ?auto_657428 ?auto_657436 ) ) ( not ( = ?auto_657428 ?auto_657437 ) ) ( not ( = ?auto_657429 ?auto_657430 ) ) ( not ( = ?auto_657429 ?auto_657431 ) ) ( not ( = ?auto_657429 ?auto_657432 ) ) ( not ( = ?auto_657429 ?auto_657433 ) ) ( not ( = ?auto_657429 ?auto_657434 ) ) ( not ( = ?auto_657429 ?auto_657435 ) ) ( not ( = ?auto_657429 ?auto_657436 ) ) ( not ( = ?auto_657429 ?auto_657437 ) ) ( not ( = ?auto_657430 ?auto_657431 ) ) ( not ( = ?auto_657430 ?auto_657432 ) ) ( not ( = ?auto_657430 ?auto_657433 ) ) ( not ( = ?auto_657430 ?auto_657434 ) ) ( not ( = ?auto_657430 ?auto_657435 ) ) ( not ( = ?auto_657430 ?auto_657436 ) ) ( not ( = ?auto_657430 ?auto_657437 ) ) ( not ( = ?auto_657431 ?auto_657432 ) ) ( not ( = ?auto_657431 ?auto_657433 ) ) ( not ( = ?auto_657431 ?auto_657434 ) ) ( not ( = ?auto_657431 ?auto_657435 ) ) ( not ( = ?auto_657431 ?auto_657436 ) ) ( not ( = ?auto_657431 ?auto_657437 ) ) ( not ( = ?auto_657432 ?auto_657433 ) ) ( not ( = ?auto_657432 ?auto_657434 ) ) ( not ( = ?auto_657432 ?auto_657435 ) ) ( not ( = ?auto_657432 ?auto_657436 ) ) ( not ( = ?auto_657432 ?auto_657437 ) ) ( not ( = ?auto_657433 ?auto_657434 ) ) ( not ( = ?auto_657433 ?auto_657435 ) ) ( not ( = ?auto_657433 ?auto_657436 ) ) ( not ( = ?auto_657433 ?auto_657437 ) ) ( not ( = ?auto_657434 ?auto_657435 ) ) ( not ( = ?auto_657434 ?auto_657436 ) ) ( not ( = ?auto_657434 ?auto_657437 ) ) ( not ( = ?auto_657435 ?auto_657436 ) ) ( not ( = ?auto_657435 ?auto_657437 ) ) ( not ( = ?auto_657436 ?auto_657437 ) ) ( ON ?auto_657435 ?auto_657436 ) ( ON ?auto_657434 ?auto_657435 ) ( ON ?auto_657433 ?auto_657434 ) ( ON ?auto_657432 ?auto_657433 ) ( ON ?auto_657431 ?auto_657432 ) ( ON ?auto_657430 ?auto_657431 ) ( ON ?auto_657429 ?auto_657430 ) ( ON ?auto_657428 ?auto_657429 ) ( ON ?auto_657427 ?auto_657428 ) ( ON ?auto_657426 ?auto_657427 ) ( ON ?auto_657425 ?auto_657426 ) ( ON ?auto_657424 ?auto_657425 ) ( ON ?auto_657423 ?auto_657424 ) ( ON ?auto_657422 ?auto_657423 ) ( CLEAR ?auto_657420 ) ( ON ?auto_657421 ?auto_657422 ) ( CLEAR ?auto_657421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_657420 ?auto_657421 )
      ( MAKE-17PILE ?auto_657420 ?auto_657421 ?auto_657422 ?auto_657423 ?auto_657424 ?auto_657425 ?auto_657426 ?auto_657427 ?auto_657428 ?auto_657429 ?auto_657430 ?auto_657431 ?auto_657432 ?auto_657433 ?auto_657434 ?auto_657435 ?auto_657436 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_657455 - BLOCK
      ?auto_657456 - BLOCK
      ?auto_657457 - BLOCK
      ?auto_657458 - BLOCK
      ?auto_657459 - BLOCK
      ?auto_657460 - BLOCK
      ?auto_657461 - BLOCK
      ?auto_657462 - BLOCK
      ?auto_657463 - BLOCK
      ?auto_657464 - BLOCK
      ?auto_657465 - BLOCK
      ?auto_657466 - BLOCK
      ?auto_657467 - BLOCK
      ?auto_657468 - BLOCK
      ?auto_657469 - BLOCK
      ?auto_657470 - BLOCK
      ?auto_657471 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_657471 ) ( ON-TABLE ?auto_657455 ) ( not ( = ?auto_657455 ?auto_657456 ) ) ( not ( = ?auto_657455 ?auto_657457 ) ) ( not ( = ?auto_657455 ?auto_657458 ) ) ( not ( = ?auto_657455 ?auto_657459 ) ) ( not ( = ?auto_657455 ?auto_657460 ) ) ( not ( = ?auto_657455 ?auto_657461 ) ) ( not ( = ?auto_657455 ?auto_657462 ) ) ( not ( = ?auto_657455 ?auto_657463 ) ) ( not ( = ?auto_657455 ?auto_657464 ) ) ( not ( = ?auto_657455 ?auto_657465 ) ) ( not ( = ?auto_657455 ?auto_657466 ) ) ( not ( = ?auto_657455 ?auto_657467 ) ) ( not ( = ?auto_657455 ?auto_657468 ) ) ( not ( = ?auto_657455 ?auto_657469 ) ) ( not ( = ?auto_657455 ?auto_657470 ) ) ( not ( = ?auto_657455 ?auto_657471 ) ) ( not ( = ?auto_657456 ?auto_657457 ) ) ( not ( = ?auto_657456 ?auto_657458 ) ) ( not ( = ?auto_657456 ?auto_657459 ) ) ( not ( = ?auto_657456 ?auto_657460 ) ) ( not ( = ?auto_657456 ?auto_657461 ) ) ( not ( = ?auto_657456 ?auto_657462 ) ) ( not ( = ?auto_657456 ?auto_657463 ) ) ( not ( = ?auto_657456 ?auto_657464 ) ) ( not ( = ?auto_657456 ?auto_657465 ) ) ( not ( = ?auto_657456 ?auto_657466 ) ) ( not ( = ?auto_657456 ?auto_657467 ) ) ( not ( = ?auto_657456 ?auto_657468 ) ) ( not ( = ?auto_657456 ?auto_657469 ) ) ( not ( = ?auto_657456 ?auto_657470 ) ) ( not ( = ?auto_657456 ?auto_657471 ) ) ( not ( = ?auto_657457 ?auto_657458 ) ) ( not ( = ?auto_657457 ?auto_657459 ) ) ( not ( = ?auto_657457 ?auto_657460 ) ) ( not ( = ?auto_657457 ?auto_657461 ) ) ( not ( = ?auto_657457 ?auto_657462 ) ) ( not ( = ?auto_657457 ?auto_657463 ) ) ( not ( = ?auto_657457 ?auto_657464 ) ) ( not ( = ?auto_657457 ?auto_657465 ) ) ( not ( = ?auto_657457 ?auto_657466 ) ) ( not ( = ?auto_657457 ?auto_657467 ) ) ( not ( = ?auto_657457 ?auto_657468 ) ) ( not ( = ?auto_657457 ?auto_657469 ) ) ( not ( = ?auto_657457 ?auto_657470 ) ) ( not ( = ?auto_657457 ?auto_657471 ) ) ( not ( = ?auto_657458 ?auto_657459 ) ) ( not ( = ?auto_657458 ?auto_657460 ) ) ( not ( = ?auto_657458 ?auto_657461 ) ) ( not ( = ?auto_657458 ?auto_657462 ) ) ( not ( = ?auto_657458 ?auto_657463 ) ) ( not ( = ?auto_657458 ?auto_657464 ) ) ( not ( = ?auto_657458 ?auto_657465 ) ) ( not ( = ?auto_657458 ?auto_657466 ) ) ( not ( = ?auto_657458 ?auto_657467 ) ) ( not ( = ?auto_657458 ?auto_657468 ) ) ( not ( = ?auto_657458 ?auto_657469 ) ) ( not ( = ?auto_657458 ?auto_657470 ) ) ( not ( = ?auto_657458 ?auto_657471 ) ) ( not ( = ?auto_657459 ?auto_657460 ) ) ( not ( = ?auto_657459 ?auto_657461 ) ) ( not ( = ?auto_657459 ?auto_657462 ) ) ( not ( = ?auto_657459 ?auto_657463 ) ) ( not ( = ?auto_657459 ?auto_657464 ) ) ( not ( = ?auto_657459 ?auto_657465 ) ) ( not ( = ?auto_657459 ?auto_657466 ) ) ( not ( = ?auto_657459 ?auto_657467 ) ) ( not ( = ?auto_657459 ?auto_657468 ) ) ( not ( = ?auto_657459 ?auto_657469 ) ) ( not ( = ?auto_657459 ?auto_657470 ) ) ( not ( = ?auto_657459 ?auto_657471 ) ) ( not ( = ?auto_657460 ?auto_657461 ) ) ( not ( = ?auto_657460 ?auto_657462 ) ) ( not ( = ?auto_657460 ?auto_657463 ) ) ( not ( = ?auto_657460 ?auto_657464 ) ) ( not ( = ?auto_657460 ?auto_657465 ) ) ( not ( = ?auto_657460 ?auto_657466 ) ) ( not ( = ?auto_657460 ?auto_657467 ) ) ( not ( = ?auto_657460 ?auto_657468 ) ) ( not ( = ?auto_657460 ?auto_657469 ) ) ( not ( = ?auto_657460 ?auto_657470 ) ) ( not ( = ?auto_657460 ?auto_657471 ) ) ( not ( = ?auto_657461 ?auto_657462 ) ) ( not ( = ?auto_657461 ?auto_657463 ) ) ( not ( = ?auto_657461 ?auto_657464 ) ) ( not ( = ?auto_657461 ?auto_657465 ) ) ( not ( = ?auto_657461 ?auto_657466 ) ) ( not ( = ?auto_657461 ?auto_657467 ) ) ( not ( = ?auto_657461 ?auto_657468 ) ) ( not ( = ?auto_657461 ?auto_657469 ) ) ( not ( = ?auto_657461 ?auto_657470 ) ) ( not ( = ?auto_657461 ?auto_657471 ) ) ( not ( = ?auto_657462 ?auto_657463 ) ) ( not ( = ?auto_657462 ?auto_657464 ) ) ( not ( = ?auto_657462 ?auto_657465 ) ) ( not ( = ?auto_657462 ?auto_657466 ) ) ( not ( = ?auto_657462 ?auto_657467 ) ) ( not ( = ?auto_657462 ?auto_657468 ) ) ( not ( = ?auto_657462 ?auto_657469 ) ) ( not ( = ?auto_657462 ?auto_657470 ) ) ( not ( = ?auto_657462 ?auto_657471 ) ) ( not ( = ?auto_657463 ?auto_657464 ) ) ( not ( = ?auto_657463 ?auto_657465 ) ) ( not ( = ?auto_657463 ?auto_657466 ) ) ( not ( = ?auto_657463 ?auto_657467 ) ) ( not ( = ?auto_657463 ?auto_657468 ) ) ( not ( = ?auto_657463 ?auto_657469 ) ) ( not ( = ?auto_657463 ?auto_657470 ) ) ( not ( = ?auto_657463 ?auto_657471 ) ) ( not ( = ?auto_657464 ?auto_657465 ) ) ( not ( = ?auto_657464 ?auto_657466 ) ) ( not ( = ?auto_657464 ?auto_657467 ) ) ( not ( = ?auto_657464 ?auto_657468 ) ) ( not ( = ?auto_657464 ?auto_657469 ) ) ( not ( = ?auto_657464 ?auto_657470 ) ) ( not ( = ?auto_657464 ?auto_657471 ) ) ( not ( = ?auto_657465 ?auto_657466 ) ) ( not ( = ?auto_657465 ?auto_657467 ) ) ( not ( = ?auto_657465 ?auto_657468 ) ) ( not ( = ?auto_657465 ?auto_657469 ) ) ( not ( = ?auto_657465 ?auto_657470 ) ) ( not ( = ?auto_657465 ?auto_657471 ) ) ( not ( = ?auto_657466 ?auto_657467 ) ) ( not ( = ?auto_657466 ?auto_657468 ) ) ( not ( = ?auto_657466 ?auto_657469 ) ) ( not ( = ?auto_657466 ?auto_657470 ) ) ( not ( = ?auto_657466 ?auto_657471 ) ) ( not ( = ?auto_657467 ?auto_657468 ) ) ( not ( = ?auto_657467 ?auto_657469 ) ) ( not ( = ?auto_657467 ?auto_657470 ) ) ( not ( = ?auto_657467 ?auto_657471 ) ) ( not ( = ?auto_657468 ?auto_657469 ) ) ( not ( = ?auto_657468 ?auto_657470 ) ) ( not ( = ?auto_657468 ?auto_657471 ) ) ( not ( = ?auto_657469 ?auto_657470 ) ) ( not ( = ?auto_657469 ?auto_657471 ) ) ( not ( = ?auto_657470 ?auto_657471 ) ) ( ON ?auto_657470 ?auto_657471 ) ( ON ?auto_657469 ?auto_657470 ) ( ON ?auto_657468 ?auto_657469 ) ( ON ?auto_657467 ?auto_657468 ) ( ON ?auto_657466 ?auto_657467 ) ( ON ?auto_657465 ?auto_657466 ) ( ON ?auto_657464 ?auto_657465 ) ( ON ?auto_657463 ?auto_657464 ) ( ON ?auto_657462 ?auto_657463 ) ( ON ?auto_657461 ?auto_657462 ) ( ON ?auto_657460 ?auto_657461 ) ( ON ?auto_657459 ?auto_657460 ) ( ON ?auto_657458 ?auto_657459 ) ( ON ?auto_657457 ?auto_657458 ) ( CLEAR ?auto_657455 ) ( ON ?auto_657456 ?auto_657457 ) ( CLEAR ?auto_657456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_657455 ?auto_657456 )
      ( MAKE-17PILE ?auto_657455 ?auto_657456 ?auto_657457 ?auto_657458 ?auto_657459 ?auto_657460 ?auto_657461 ?auto_657462 ?auto_657463 ?auto_657464 ?auto_657465 ?auto_657466 ?auto_657467 ?auto_657468 ?auto_657469 ?auto_657470 ?auto_657471 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_657489 - BLOCK
      ?auto_657490 - BLOCK
      ?auto_657491 - BLOCK
      ?auto_657492 - BLOCK
      ?auto_657493 - BLOCK
      ?auto_657494 - BLOCK
      ?auto_657495 - BLOCK
      ?auto_657496 - BLOCK
      ?auto_657497 - BLOCK
      ?auto_657498 - BLOCK
      ?auto_657499 - BLOCK
      ?auto_657500 - BLOCK
      ?auto_657501 - BLOCK
      ?auto_657502 - BLOCK
      ?auto_657503 - BLOCK
      ?auto_657504 - BLOCK
      ?auto_657505 - BLOCK
    )
    :vars
    (
      ?auto_657506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_657505 ?auto_657506 ) ( not ( = ?auto_657489 ?auto_657490 ) ) ( not ( = ?auto_657489 ?auto_657491 ) ) ( not ( = ?auto_657489 ?auto_657492 ) ) ( not ( = ?auto_657489 ?auto_657493 ) ) ( not ( = ?auto_657489 ?auto_657494 ) ) ( not ( = ?auto_657489 ?auto_657495 ) ) ( not ( = ?auto_657489 ?auto_657496 ) ) ( not ( = ?auto_657489 ?auto_657497 ) ) ( not ( = ?auto_657489 ?auto_657498 ) ) ( not ( = ?auto_657489 ?auto_657499 ) ) ( not ( = ?auto_657489 ?auto_657500 ) ) ( not ( = ?auto_657489 ?auto_657501 ) ) ( not ( = ?auto_657489 ?auto_657502 ) ) ( not ( = ?auto_657489 ?auto_657503 ) ) ( not ( = ?auto_657489 ?auto_657504 ) ) ( not ( = ?auto_657489 ?auto_657505 ) ) ( not ( = ?auto_657489 ?auto_657506 ) ) ( not ( = ?auto_657490 ?auto_657491 ) ) ( not ( = ?auto_657490 ?auto_657492 ) ) ( not ( = ?auto_657490 ?auto_657493 ) ) ( not ( = ?auto_657490 ?auto_657494 ) ) ( not ( = ?auto_657490 ?auto_657495 ) ) ( not ( = ?auto_657490 ?auto_657496 ) ) ( not ( = ?auto_657490 ?auto_657497 ) ) ( not ( = ?auto_657490 ?auto_657498 ) ) ( not ( = ?auto_657490 ?auto_657499 ) ) ( not ( = ?auto_657490 ?auto_657500 ) ) ( not ( = ?auto_657490 ?auto_657501 ) ) ( not ( = ?auto_657490 ?auto_657502 ) ) ( not ( = ?auto_657490 ?auto_657503 ) ) ( not ( = ?auto_657490 ?auto_657504 ) ) ( not ( = ?auto_657490 ?auto_657505 ) ) ( not ( = ?auto_657490 ?auto_657506 ) ) ( not ( = ?auto_657491 ?auto_657492 ) ) ( not ( = ?auto_657491 ?auto_657493 ) ) ( not ( = ?auto_657491 ?auto_657494 ) ) ( not ( = ?auto_657491 ?auto_657495 ) ) ( not ( = ?auto_657491 ?auto_657496 ) ) ( not ( = ?auto_657491 ?auto_657497 ) ) ( not ( = ?auto_657491 ?auto_657498 ) ) ( not ( = ?auto_657491 ?auto_657499 ) ) ( not ( = ?auto_657491 ?auto_657500 ) ) ( not ( = ?auto_657491 ?auto_657501 ) ) ( not ( = ?auto_657491 ?auto_657502 ) ) ( not ( = ?auto_657491 ?auto_657503 ) ) ( not ( = ?auto_657491 ?auto_657504 ) ) ( not ( = ?auto_657491 ?auto_657505 ) ) ( not ( = ?auto_657491 ?auto_657506 ) ) ( not ( = ?auto_657492 ?auto_657493 ) ) ( not ( = ?auto_657492 ?auto_657494 ) ) ( not ( = ?auto_657492 ?auto_657495 ) ) ( not ( = ?auto_657492 ?auto_657496 ) ) ( not ( = ?auto_657492 ?auto_657497 ) ) ( not ( = ?auto_657492 ?auto_657498 ) ) ( not ( = ?auto_657492 ?auto_657499 ) ) ( not ( = ?auto_657492 ?auto_657500 ) ) ( not ( = ?auto_657492 ?auto_657501 ) ) ( not ( = ?auto_657492 ?auto_657502 ) ) ( not ( = ?auto_657492 ?auto_657503 ) ) ( not ( = ?auto_657492 ?auto_657504 ) ) ( not ( = ?auto_657492 ?auto_657505 ) ) ( not ( = ?auto_657492 ?auto_657506 ) ) ( not ( = ?auto_657493 ?auto_657494 ) ) ( not ( = ?auto_657493 ?auto_657495 ) ) ( not ( = ?auto_657493 ?auto_657496 ) ) ( not ( = ?auto_657493 ?auto_657497 ) ) ( not ( = ?auto_657493 ?auto_657498 ) ) ( not ( = ?auto_657493 ?auto_657499 ) ) ( not ( = ?auto_657493 ?auto_657500 ) ) ( not ( = ?auto_657493 ?auto_657501 ) ) ( not ( = ?auto_657493 ?auto_657502 ) ) ( not ( = ?auto_657493 ?auto_657503 ) ) ( not ( = ?auto_657493 ?auto_657504 ) ) ( not ( = ?auto_657493 ?auto_657505 ) ) ( not ( = ?auto_657493 ?auto_657506 ) ) ( not ( = ?auto_657494 ?auto_657495 ) ) ( not ( = ?auto_657494 ?auto_657496 ) ) ( not ( = ?auto_657494 ?auto_657497 ) ) ( not ( = ?auto_657494 ?auto_657498 ) ) ( not ( = ?auto_657494 ?auto_657499 ) ) ( not ( = ?auto_657494 ?auto_657500 ) ) ( not ( = ?auto_657494 ?auto_657501 ) ) ( not ( = ?auto_657494 ?auto_657502 ) ) ( not ( = ?auto_657494 ?auto_657503 ) ) ( not ( = ?auto_657494 ?auto_657504 ) ) ( not ( = ?auto_657494 ?auto_657505 ) ) ( not ( = ?auto_657494 ?auto_657506 ) ) ( not ( = ?auto_657495 ?auto_657496 ) ) ( not ( = ?auto_657495 ?auto_657497 ) ) ( not ( = ?auto_657495 ?auto_657498 ) ) ( not ( = ?auto_657495 ?auto_657499 ) ) ( not ( = ?auto_657495 ?auto_657500 ) ) ( not ( = ?auto_657495 ?auto_657501 ) ) ( not ( = ?auto_657495 ?auto_657502 ) ) ( not ( = ?auto_657495 ?auto_657503 ) ) ( not ( = ?auto_657495 ?auto_657504 ) ) ( not ( = ?auto_657495 ?auto_657505 ) ) ( not ( = ?auto_657495 ?auto_657506 ) ) ( not ( = ?auto_657496 ?auto_657497 ) ) ( not ( = ?auto_657496 ?auto_657498 ) ) ( not ( = ?auto_657496 ?auto_657499 ) ) ( not ( = ?auto_657496 ?auto_657500 ) ) ( not ( = ?auto_657496 ?auto_657501 ) ) ( not ( = ?auto_657496 ?auto_657502 ) ) ( not ( = ?auto_657496 ?auto_657503 ) ) ( not ( = ?auto_657496 ?auto_657504 ) ) ( not ( = ?auto_657496 ?auto_657505 ) ) ( not ( = ?auto_657496 ?auto_657506 ) ) ( not ( = ?auto_657497 ?auto_657498 ) ) ( not ( = ?auto_657497 ?auto_657499 ) ) ( not ( = ?auto_657497 ?auto_657500 ) ) ( not ( = ?auto_657497 ?auto_657501 ) ) ( not ( = ?auto_657497 ?auto_657502 ) ) ( not ( = ?auto_657497 ?auto_657503 ) ) ( not ( = ?auto_657497 ?auto_657504 ) ) ( not ( = ?auto_657497 ?auto_657505 ) ) ( not ( = ?auto_657497 ?auto_657506 ) ) ( not ( = ?auto_657498 ?auto_657499 ) ) ( not ( = ?auto_657498 ?auto_657500 ) ) ( not ( = ?auto_657498 ?auto_657501 ) ) ( not ( = ?auto_657498 ?auto_657502 ) ) ( not ( = ?auto_657498 ?auto_657503 ) ) ( not ( = ?auto_657498 ?auto_657504 ) ) ( not ( = ?auto_657498 ?auto_657505 ) ) ( not ( = ?auto_657498 ?auto_657506 ) ) ( not ( = ?auto_657499 ?auto_657500 ) ) ( not ( = ?auto_657499 ?auto_657501 ) ) ( not ( = ?auto_657499 ?auto_657502 ) ) ( not ( = ?auto_657499 ?auto_657503 ) ) ( not ( = ?auto_657499 ?auto_657504 ) ) ( not ( = ?auto_657499 ?auto_657505 ) ) ( not ( = ?auto_657499 ?auto_657506 ) ) ( not ( = ?auto_657500 ?auto_657501 ) ) ( not ( = ?auto_657500 ?auto_657502 ) ) ( not ( = ?auto_657500 ?auto_657503 ) ) ( not ( = ?auto_657500 ?auto_657504 ) ) ( not ( = ?auto_657500 ?auto_657505 ) ) ( not ( = ?auto_657500 ?auto_657506 ) ) ( not ( = ?auto_657501 ?auto_657502 ) ) ( not ( = ?auto_657501 ?auto_657503 ) ) ( not ( = ?auto_657501 ?auto_657504 ) ) ( not ( = ?auto_657501 ?auto_657505 ) ) ( not ( = ?auto_657501 ?auto_657506 ) ) ( not ( = ?auto_657502 ?auto_657503 ) ) ( not ( = ?auto_657502 ?auto_657504 ) ) ( not ( = ?auto_657502 ?auto_657505 ) ) ( not ( = ?auto_657502 ?auto_657506 ) ) ( not ( = ?auto_657503 ?auto_657504 ) ) ( not ( = ?auto_657503 ?auto_657505 ) ) ( not ( = ?auto_657503 ?auto_657506 ) ) ( not ( = ?auto_657504 ?auto_657505 ) ) ( not ( = ?auto_657504 ?auto_657506 ) ) ( not ( = ?auto_657505 ?auto_657506 ) ) ( ON ?auto_657504 ?auto_657505 ) ( ON ?auto_657503 ?auto_657504 ) ( ON ?auto_657502 ?auto_657503 ) ( ON ?auto_657501 ?auto_657502 ) ( ON ?auto_657500 ?auto_657501 ) ( ON ?auto_657499 ?auto_657500 ) ( ON ?auto_657498 ?auto_657499 ) ( ON ?auto_657497 ?auto_657498 ) ( ON ?auto_657496 ?auto_657497 ) ( ON ?auto_657495 ?auto_657496 ) ( ON ?auto_657494 ?auto_657495 ) ( ON ?auto_657493 ?auto_657494 ) ( ON ?auto_657492 ?auto_657493 ) ( ON ?auto_657491 ?auto_657492 ) ( ON ?auto_657490 ?auto_657491 ) ( ON ?auto_657489 ?auto_657490 ) ( CLEAR ?auto_657489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_657489 )
      ( MAKE-17PILE ?auto_657489 ?auto_657490 ?auto_657491 ?auto_657492 ?auto_657493 ?auto_657494 ?auto_657495 ?auto_657496 ?auto_657497 ?auto_657498 ?auto_657499 ?auto_657500 ?auto_657501 ?auto_657502 ?auto_657503 ?auto_657504 ?auto_657505 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_657524 - BLOCK
      ?auto_657525 - BLOCK
      ?auto_657526 - BLOCK
      ?auto_657527 - BLOCK
      ?auto_657528 - BLOCK
      ?auto_657529 - BLOCK
      ?auto_657530 - BLOCK
      ?auto_657531 - BLOCK
      ?auto_657532 - BLOCK
      ?auto_657533 - BLOCK
      ?auto_657534 - BLOCK
      ?auto_657535 - BLOCK
      ?auto_657536 - BLOCK
      ?auto_657537 - BLOCK
      ?auto_657538 - BLOCK
      ?auto_657539 - BLOCK
      ?auto_657540 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_657540 ) ( not ( = ?auto_657524 ?auto_657525 ) ) ( not ( = ?auto_657524 ?auto_657526 ) ) ( not ( = ?auto_657524 ?auto_657527 ) ) ( not ( = ?auto_657524 ?auto_657528 ) ) ( not ( = ?auto_657524 ?auto_657529 ) ) ( not ( = ?auto_657524 ?auto_657530 ) ) ( not ( = ?auto_657524 ?auto_657531 ) ) ( not ( = ?auto_657524 ?auto_657532 ) ) ( not ( = ?auto_657524 ?auto_657533 ) ) ( not ( = ?auto_657524 ?auto_657534 ) ) ( not ( = ?auto_657524 ?auto_657535 ) ) ( not ( = ?auto_657524 ?auto_657536 ) ) ( not ( = ?auto_657524 ?auto_657537 ) ) ( not ( = ?auto_657524 ?auto_657538 ) ) ( not ( = ?auto_657524 ?auto_657539 ) ) ( not ( = ?auto_657524 ?auto_657540 ) ) ( not ( = ?auto_657525 ?auto_657526 ) ) ( not ( = ?auto_657525 ?auto_657527 ) ) ( not ( = ?auto_657525 ?auto_657528 ) ) ( not ( = ?auto_657525 ?auto_657529 ) ) ( not ( = ?auto_657525 ?auto_657530 ) ) ( not ( = ?auto_657525 ?auto_657531 ) ) ( not ( = ?auto_657525 ?auto_657532 ) ) ( not ( = ?auto_657525 ?auto_657533 ) ) ( not ( = ?auto_657525 ?auto_657534 ) ) ( not ( = ?auto_657525 ?auto_657535 ) ) ( not ( = ?auto_657525 ?auto_657536 ) ) ( not ( = ?auto_657525 ?auto_657537 ) ) ( not ( = ?auto_657525 ?auto_657538 ) ) ( not ( = ?auto_657525 ?auto_657539 ) ) ( not ( = ?auto_657525 ?auto_657540 ) ) ( not ( = ?auto_657526 ?auto_657527 ) ) ( not ( = ?auto_657526 ?auto_657528 ) ) ( not ( = ?auto_657526 ?auto_657529 ) ) ( not ( = ?auto_657526 ?auto_657530 ) ) ( not ( = ?auto_657526 ?auto_657531 ) ) ( not ( = ?auto_657526 ?auto_657532 ) ) ( not ( = ?auto_657526 ?auto_657533 ) ) ( not ( = ?auto_657526 ?auto_657534 ) ) ( not ( = ?auto_657526 ?auto_657535 ) ) ( not ( = ?auto_657526 ?auto_657536 ) ) ( not ( = ?auto_657526 ?auto_657537 ) ) ( not ( = ?auto_657526 ?auto_657538 ) ) ( not ( = ?auto_657526 ?auto_657539 ) ) ( not ( = ?auto_657526 ?auto_657540 ) ) ( not ( = ?auto_657527 ?auto_657528 ) ) ( not ( = ?auto_657527 ?auto_657529 ) ) ( not ( = ?auto_657527 ?auto_657530 ) ) ( not ( = ?auto_657527 ?auto_657531 ) ) ( not ( = ?auto_657527 ?auto_657532 ) ) ( not ( = ?auto_657527 ?auto_657533 ) ) ( not ( = ?auto_657527 ?auto_657534 ) ) ( not ( = ?auto_657527 ?auto_657535 ) ) ( not ( = ?auto_657527 ?auto_657536 ) ) ( not ( = ?auto_657527 ?auto_657537 ) ) ( not ( = ?auto_657527 ?auto_657538 ) ) ( not ( = ?auto_657527 ?auto_657539 ) ) ( not ( = ?auto_657527 ?auto_657540 ) ) ( not ( = ?auto_657528 ?auto_657529 ) ) ( not ( = ?auto_657528 ?auto_657530 ) ) ( not ( = ?auto_657528 ?auto_657531 ) ) ( not ( = ?auto_657528 ?auto_657532 ) ) ( not ( = ?auto_657528 ?auto_657533 ) ) ( not ( = ?auto_657528 ?auto_657534 ) ) ( not ( = ?auto_657528 ?auto_657535 ) ) ( not ( = ?auto_657528 ?auto_657536 ) ) ( not ( = ?auto_657528 ?auto_657537 ) ) ( not ( = ?auto_657528 ?auto_657538 ) ) ( not ( = ?auto_657528 ?auto_657539 ) ) ( not ( = ?auto_657528 ?auto_657540 ) ) ( not ( = ?auto_657529 ?auto_657530 ) ) ( not ( = ?auto_657529 ?auto_657531 ) ) ( not ( = ?auto_657529 ?auto_657532 ) ) ( not ( = ?auto_657529 ?auto_657533 ) ) ( not ( = ?auto_657529 ?auto_657534 ) ) ( not ( = ?auto_657529 ?auto_657535 ) ) ( not ( = ?auto_657529 ?auto_657536 ) ) ( not ( = ?auto_657529 ?auto_657537 ) ) ( not ( = ?auto_657529 ?auto_657538 ) ) ( not ( = ?auto_657529 ?auto_657539 ) ) ( not ( = ?auto_657529 ?auto_657540 ) ) ( not ( = ?auto_657530 ?auto_657531 ) ) ( not ( = ?auto_657530 ?auto_657532 ) ) ( not ( = ?auto_657530 ?auto_657533 ) ) ( not ( = ?auto_657530 ?auto_657534 ) ) ( not ( = ?auto_657530 ?auto_657535 ) ) ( not ( = ?auto_657530 ?auto_657536 ) ) ( not ( = ?auto_657530 ?auto_657537 ) ) ( not ( = ?auto_657530 ?auto_657538 ) ) ( not ( = ?auto_657530 ?auto_657539 ) ) ( not ( = ?auto_657530 ?auto_657540 ) ) ( not ( = ?auto_657531 ?auto_657532 ) ) ( not ( = ?auto_657531 ?auto_657533 ) ) ( not ( = ?auto_657531 ?auto_657534 ) ) ( not ( = ?auto_657531 ?auto_657535 ) ) ( not ( = ?auto_657531 ?auto_657536 ) ) ( not ( = ?auto_657531 ?auto_657537 ) ) ( not ( = ?auto_657531 ?auto_657538 ) ) ( not ( = ?auto_657531 ?auto_657539 ) ) ( not ( = ?auto_657531 ?auto_657540 ) ) ( not ( = ?auto_657532 ?auto_657533 ) ) ( not ( = ?auto_657532 ?auto_657534 ) ) ( not ( = ?auto_657532 ?auto_657535 ) ) ( not ( = ?auto_657532 ?auto_657536 ) ) ( not ( = ?auto_657532 ?auto_657537 ) ) ( not ( = ?auto_657532 ?auto_657538 ) ) ( not ( = ?auto_657532 ?auto_657539 ) ) ( not ( = ?auto_657532 ?auto_657540 ) ) ( not ( = ?auto_657533 ?auto_657534 ) ) ( not ( = ?auto_657533 ?auto_657535 ) ) ( not ( = ?auto_657533 ?auto_657536 ) ) ( not ( = ?auto_657533 ?auto_657537 ) ) ( not ( = ?auto_657533 ?auto_657538 ) ) ( not ( = ?auto_657533 ?auto_657539 ) ) ( not ( = ?auto_657533 ?auto_657540 ) ) ( not ( = ?auto_657534 ?auto_657535 ) ) ( not ( = ?auto_657534 ?auto_657536 ) ) ( not ( = ?auto_657534 ?auto_657537 ) ) ( not ( = ?auto_657534 ?auto_657538 ) ) ( not ( = ?auto_657534 ?auto_657539 ) ) ( not ( = ?auto_657534 ?auto_657540 ) ) ( not ( = ?auto_657535 ?auto_657536 ) ) ( not ( = ?auto_657535 ?auto_657537 ) ) ( not ( = ?auto_657535 ?auto_657538 ) ) ( not ( = ?auto_657535 ?auto_657539 ) ) ( not ( = ?auto_657535 ?auto_657540 ) ) ( not ( = ?auto_657536 ?auto_657537 ) ) ( not ( = ?auto_657536 ?auto_657538 ) ) ( not ( = ?auto_657536 ?auto_657539 ) ) ( not ( = ?auto_657536 ?auto_657540 ) ) ( not ( = ?auto_657537 ?auto_657538 ) ) ( not ( = ?auto_657537 ?auto_657539 ) ) ( not ( = ?auto_657537 ?auto_657540 ) ) ( not ( = ?auto_657538 ?auto_657539 ) ) ( not ( = ?auto_657538 ?auto_657540 ) ) ( not ( = ?auto_657539 ?auto_657540 ) ) ( ON ?auto_657539 ?auto_657540 ) ( ON ?auto_657538 ?auto_657539 ) ( ON ?auto_657537 ?auto_657538 ) ( ON ?auto_657536 ?auto_657537 ) ( ON ?auto_657535 ?auto_657536 ) ( ON ?auto_657534 ?auto_657535 ) ( ON ?auto_657533 ?auto_657534 ) ( ON ?auto_657532 ?auto_657533 ) ( ON ?auto_657531 ?auto_657532 ) ( ON ?auto_657530 ?auto_657531 ) ( ON ?auto_657529 ?auto_657530 ) ( ON ?auto_657528 ?auto_657529 ) ( ON ?auto_657527 ?auto_657528 ) ( ON ?auto_657526 ?auto_657527 ) ( ON ?auto_657525 ?auto_657526 ) ( ON ?auto_657524 ?auto_657525 ) ( CLEAR ?auto_657524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_657524 )
      ( MAKE-17PILE ?auto_657524 ?auto_657525 ?auto_657526 ?auto_657527 ?auto_657528 ?auto_657529 ?auto_657530 ?auto_657531 ?auto_657532 ?auto_657533 ?auto_657534 ?auto_657535 ?auto_657536 ?auto_657537 ?auto_657538 ?auto_657539 ?auto_657540 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_657558 - BLOCK
      ?auto_657559 - BLOCK
      ?auto_657560 - BLOCK
      ?auto_657561 - BLOCK
      ?auto_657562 - BLOCK
      ?auto_657563 - BLOCK
      ?auto_657564 - BLOCK
      ?auto_657565 - BLOCK
      ?auto_657566 - BLOCK
      ?auto_657567 - BLOCK
      ?auto_657568 - BLOCK
      ?auto_657569 - BLOCK
      ?auto_657570 - BLOCK
      ?auto_657571 - BLOCK
      ?auto_657572 - BLOCK
      ?auto_657573 - BLOCK
      ?auto_657574 - BLOCK
    )
    :vars
    (
      ?auto_657575 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_657558 ?auto_657559 ) ) ( not ( = ?auto_657558 ?auto_657560 ) ) ( not ( = ?auto_657558 ?auto_657561 ) ) ( not ( = ?auto_657558 ?auto_657562 ) ) ( not ( = ?auto_657558 ?auto_657563 ) ) ( not ( = ?auto_657558 ?auto_657564 ) ) ( not ( = ?auto_657558 ?auto_657565 ) ) ( not ( = ?auto_657558 ?auto_657566 ) ) ( not ( = ?auto_657558 ?auto_657567 ) ) ( not ( = ?auto_657558 ?auto_657568 ) ) ( not ( = ?auto_657558 ?auto_657569 ) ) ( not ( = ?auto_657558 ?auto_657570 ) ) ( not ( = ?auto_657558 ?auto_657571 ) ) ( not ( = ?auto_657558 ?auto_657572 ) ) ( not ( = ?auto_657558 ?auto_657573 ) ) ( not ( = ?auto_657558 ?auto_657574 ) ) ( not ( = ?auto_657559 ?auto_657560 ) ) ( not ( = ?auto_657559 ?auto_657561 ) ) ( not ( = ?auto_657559 ?auto_657562 ) ) ( not ( = ?auto_657559 ?auto_657563 ) ) ( not ( = ?auto_657559 ?auto_657564 ) ) ( not ( = ?auto_657559 ?auto_657565 ) ) ( not ( = ?auto_657559 ?auto_657566 ) ) ( not ( = ?auto_657559 ?auto_657567 ) ) ( not ( = ?auto_657559 ?auto_657568 ) ) ( not ( = ?auto_657559 ?auto_657569 ) ) ( not ( = ?auto_657559 ?auto_657570 ) ) ( not ( = ?auto_657559 ?auto_657571 ) ) ( not ( = ?auto_657559 ?auto_657572 ) ) ( not ( = ?auto_657559 ?auto_657573 ) ) ( not ( = ?auto_657559 ?auto_657574 ) ) ( not ( = ?auto_657560 ?auto_657561 ) ) ( not ( = ?auto_657560 ?auto_657562 ) ) ( not ( = ?auto_657560 ?auto_657563 ) ) ( not ( = ?auto_657560 ?auto_657564 ) ) ( not ( = ?auto_657560 ?auto_657565 ) ) ( not ( = ?auto_657560 ?auto_657566 ) ) ( not ( = ?auto_657560 ?auto_657567 ) ) ( not ( = ?auto_657560 ?auto_657568 ) ) ( not ( = ?auto_657560 ?auto_657569 ) ) ( not ( = ?auto_657560 ?auto_657570 ) ) ( not ( = ?auto_657560 ?auto_657571 ) ) ( not ( = ?auto_657560 ?auto_657572 ) ) ( not ( = ?auto_657560 ?auto_657573 ) ) ( not ( = ?auto_657560 ?auto_657574 ) ) ( not ( = ?auto_657561 ?auto_657562 ) ) ( not ( = ?auto_657561 ?auto_657563 ) ) ( not ( = ?auto_657561 ?auto_657564 ) ) ( not ( = ?auto_657561 ?auto_657565 ) ) ( not ( = ?auto_657561 ?auto_657566 ) ) ( not ( = ?auto_657561 ?auto_657567 ) ) ( not ( = ?auto_657561 ?auto_657568 ) ) ( not ( = ?auto_657561 ?auto_657569 ) ) ( not ( = ?auto_657561 ?auto_657570 ) ) ( not ( = ?auto_657561 ?auto_657571 ) ) ( not ( = ?auto_657561 ?auto_657572 ) ) ( not ( = ?auto_657561 ?auto_657573 ) ) ( not ( = ?auto_657561 ?auto_657574 ) ) ( not ( = ?auto_657562 ?auto_657563 ) ) ( not ( = ?auto_657562 ?auto_657564 ) ) ( not ( = ?auto_657562 ?auto_657565 ) ) ( not ( = ?auto_657562 ?auto_657566 ) ) ( not ( = ?auto_657562 ?auto_657567 ) ) ( not ( = ?auto_657562 ?auto_657568 ) ) ( not ( = ?auto_657562 ?auto_657569 ) ) ( not ( = ?auto_657562 ?auto_657570 ) ) ( not ( = ?auto_657562 ?auto_657571 ) ) ( not ( = ?auto_657562 ?auto_657572 ) ) ( not ( = ?auto_657562 ?auto_657573 ) ) ( not ( = ?auto_657562 ?auto_657574 ) ) ( not ( = ?auto_657563 ?auto_657564 ) ) ( not ( = ?auto_657563 ?auto_657565 ) ) ( not ( = ?auto_657563 ?auto_657566 ) ) ( not ( = ?auto_657563 ?auto_657567 ) ) ( not ( = ?auto_657563 ?auto_657568 ) ) ( not ( = ?auto_657563 ?auto_657569 ) ) ( not ( = ?auto_657563 ?auto_657570 ) ) ( not ( = ?auto_657563 ?auto_657571 ) ) ( not ( = ?auto_657563 ?auto_657572 ) ) ( not ( = ?auto_657563 ?auto_657573 ) ) ( not ( = ?auto_657563 ?auto_657574 ) ) ( not ( = ?auto_657564 ?auto_657565 ) ) ( not ( = ?auto_657564 ?auto_657566 ) ) ( not ( = ?auto_657564 ?auto_657567 ) ) ( not ( = ?auto_657564 ?auto_657568 ) ) ( not ( = ?auto_657564 ?auto_657569 ) ) ( not ( = ?auto_657564 ?auto_657570 ) ) ( not ( = ?auto_657564 ?auto_657571 ) ) ( not ( = ?auto_657564 ?auto_657572 ) ) ( not ( = ?auto_657564 ?auto_657573 ) ) ( not ( = ?auto_657564 ?auto_657574 ) ) ( not ( = ?auto_657565 ?auto_657566 ) ) ( not ( = ?auto_657565 ?auto_657567 ) ) ( not ( = ?auto_657565 ?auto_657568 ) ) ( not ( = ?auto_657565 ?auto_657569 ) ) ( not ( = ?auto_657565 ?auto_657570 ) ) ( not ( = ?auto_657565 ?auto_657571 ) ) ( not ( = ?auto_657565 ?auto_657572 ) ) ( not ( = ?auto_657565 ?auto_657573 ) ) ( not ( = ?auto_657565 ?auto_657574 ) ) ( not ( = ?auto_657566 ?auto_657567 ) ) ( not ( = ?auto_657566 ?auto_657568 ) ) ( not ( = ?auto_657566 ?auto_657569 ) ) ( not ( = ?auto_657566 ?auto_657570 ) ) ( not ( = ?auto_657566 ?auto_657571 ) ) ( not ( = ?auto_657566 ?auto_657572 ) ) ( not ( = ?auto_657566 ?auto_657573 ) ) ( not ( = ?auto_657566 ?auto_657574 ) ) ( not ( = ?auto_657567 ?auto_657568 ) ) ( not ( = ?auto_657567 ?auto_657569 ) ) ( not ( = ?auto_657567 ?auto_657570 ) ) ( not ( = ?auto_657567 ?auto_657571 ) ) ( not ( = ?auto_657567 ?auto_657572 ) ) ( not ( = ?auto_657567 ?auto_657573 ) ) ( not ( = ?auto_657567 ?auto_657574 ) ) ( not ( = ?auto_657568 ?auto_657569 ) ) ( not ( = ?auto_657568 ?auto_657570 ) ) ( not ( = ?auto_657568 ?auto_657571 ) ) ( not ( = ?auto_657568 ?auto_657572 ) ) ( not ( = ?auto_657568 ?auto_657573 ) ) ( not ( = ?auto_657568 ?auto_657574 ) ) ( not ( = ?auto_657569 ?auto_657570 ) ) ( not ( = ?auto_657569 ?auto_657571 ) ) ( not ( = ?auto_657569 ?auto_657572 ) ) ( not ( = ?auto_657569 ?auto_657573 ) ) ( not ( = ?auto_657569 ?auto_657574 ) ) ( not ( = ?auto_657570 ?auto_657571 ) ) ( not ( = ?auto_657570 ?auto_657572 ) ) ( not ( = ?auto_657570 ?auto_657573 ) ) ( not ( = ?auto_657570 ?auto_657574 ) ) ( not ( = ?auto_657571 ?auto_657572 ) ) ( not ( = ?auto_657571 ?auto_657573 ) ) ( not ( = ?auto_657571 ?auto_657574 ) ) ( not ( = ?auto_657572 ?auto_657573 ) ) ( not ( = ?auto_657572 ?auto_657574 ) ) ( not ( = ?auto_657573 ?auto_657574 ) ) ( ON ?auto_657558 ?auto_657575 ) ( not ( = ?auto_657574 ?auto_657575 ) ) ( not ( = ?auto_657573 ?auto_657575 ) ) ( not ( = ?auto_657572 ?auto_657575 ) ) ( not ( = ?auto_657571 ?auto_657575 ) ) ( not ( = ?auto_657570 ?auto_657575 ) ) ( not ( = ?auto_657569 ?auto_657575 ) ) ( not ( = ?auto_657568 ?auto_657575 ) ) ( not ( = ?auto_657567 ?auto_657575 ) ) ( not ( = ?auto_657566 ?auto_657575 ) ) ( not ( = ?auto_657565 ?auto_657575 ) ) ( not ( = ?auto_657564 ?auto_657575 ) ) ( not ( = ?auto_657563 ?auto_657575 ) ) ( not ( = ?auto_657562 ?auto_657575 ) ) ( not ( = ?auto_657561 ?auto_657575 ) ) ( not ( = ?auto_657560 ?auto_657575 ) ) ( not ( = ?auto_657559 ?auto_657575 ) ) ( not ( = ?auto_657558 ?auto_657575 ) ) ( ON ?auto_657559 ?auto_657558 ) ( ON ?auto_657560 ?auto_657559 ) ( ON ?auto_657561 ?auto_657560 ) ( ON ?auto_657562 ?auto_657561 ) ( ON ?auto_657563 ?auto_657562 ) ( ON ?auto_657564 ?auto_657563 ) ( ON ?auto_657565 ?auto_657564 ) ( ON ?auto_657566 ?auto_657565 ) ( ON ?auto_657567 ?auto_657566 ) ( ON ?auto_657568 ?auto_657567 ) ( ON ?auto_657569 ?auto_657568 ) ( ON ?auto_657570 ?auto_657569 ) ( ON ?auto_657571 ?auto_657570 ) ( ON ?auto_657572 ?auto_657571 ) ( ON ?auto_657573 ?auto_657572 ) ( ON ?auto_657574 ?auto_657573 ) ( CLEAR ?auto_657574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_657574 ?auto_657573 ?auto_657572 ?auto_657571 ?auto_657570 ?auto_657569 ?auto_657568 ?auto_657567 ?auto_657566 ?auto_657565 ?auto_657564 ?auto_657563 ?auto_657562 ?auto_657561 ?auto_657560 ?auto_657559 ?auto_657558 )
      ( MAKE-17PILE ?auto_657558 ?auto_657559 ?auto_657560 ?auto_657561 ?auto_657562 ?auto_657563 ?auto_657564 ?auto_657565 ?auto_657566 ?auto_657567 ?auto_657568 ?auto_657569 ?auto_657570 ?auto_657571 ?auto_657572 ?auto_657573 ?auto_657574 ) )
  )

)

