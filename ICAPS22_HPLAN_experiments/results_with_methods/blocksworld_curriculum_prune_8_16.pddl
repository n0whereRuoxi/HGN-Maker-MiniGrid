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

