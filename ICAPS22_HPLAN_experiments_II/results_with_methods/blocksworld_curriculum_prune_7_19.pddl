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
      ?auto_30157 - BLOCK
    )
    :vars
    (
      ?auto_30158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30157 ?auto_30158 ) ( CLEAR ?auto_30157 ) ( HAND-EMPTY ) ( not ( = ?auto_30157 ?auto_30158 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30157 ?auto_30158 )
      ( !PUTDOWN ?auto_30157 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30164 - BLOCK
      ?auto_30165 - BLOCK
    )
    :vars
    (
      ?auto_30166 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_30164 ) ( ON ?auto_30165 ?auto_30166 ) ( CLEAR ?auto_30165 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30164 ) ( not ( = ?auto_30164 ?auto_30165 ) ) ( not ( = ?auto_30164 ?auto_30166 ) ) ( not ( = ?auto_30165 ?auto_30166 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30165 ?auto_30166 )
      ( !STACK ?auto_30165 ?auto_30164 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30174 - BLOCK
      ?auto_30175 - BLOCK
    )
    :vars
    (
      ?auto_30176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30175 ?auto_30176 ) ( not ( = ?auto_30174 ?auto_30175 ) ) ( not ( = ?auto_30174 ?auto_30176 ) ) ( not ( = ?auto_30175 ?auto_30176 ) ) ( ON ?auto_30174 ?auto_30175 ) ( CLEAR ?auto_30174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30174 )
      ( MAKE-2PILE ?auto_30174 ?auto_30175 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30185 - BLOCK
      ?auto_30186 - BLOCK
      ?auto_30187 - BLOCK
    )
    :vars
    (
      ?auto_30188 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_30186 ) ( ON ?auto_30187 ?auto_30188 ) ( CLEAR ?auto_30187 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30185 ) ( ON ?auto_30186 ?auto_30185 ) ( not ( = ?auto_30185 ?auto_30186 ) ) ( not ( = ?auto_30185 ?auto_30187 ) ) ( not ( = ?auto_30185 ?auto_30188 ) ) ( not ( = ?auto_30186 ?auto_30187 ) ) ( not ( = ?auto_30186 ?auto_30188 ) ) ( not ( = ?auto_30187 ?auto_30188 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30187 ?auto_30188 )
      ( !STACK ?auto_30187 ?auto_30186 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30199 - BLOCK
      ?auto_30200 - BLOCK
      ?auto_30201 - BLOCK
    )
    :vars
    (
      ?auto_30202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30201 ?auto_30202 ) ( ON-TABLE ?auto_30199 ) ( not ( = ?auto_30199 ?auto_30200 ) ) ( not ( = ?auto_30199 ?auto_30201 ) ) ( not ( = ?auto_30199 ?auto_30202 ) ) ( not ( = ?auto_30200 ?auto_30201 ) ) ( not ( = ?auto_30200 ?auto_30202 ) ) ( not ( = ?auto_30201 ?auto_30202 ) ) ( CLEAR ?auto_30199 ) ( ON ?auto_30200 ?auto_30201 ) ( CLEAR ?auto_30200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30199 ?auto_30200 )
      ( MAKE-3PILE ?auto_30199 ?auto_30200 ?auto_30201 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30213 - BLOCK
      ?auto_30214 - BLOCK
      ?auto_30215 - BLOCK
    )
    :vars
    (
      ?auto_30216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30215 ?auto_30216 ) ( not ( = ?auto_30213 ?auto_30214 ) ) ( not ( = ?auto_30213 ?auto_30215 ) ) ( not ( = ?auto_30213 ?auto_30216 ) ) ( not ( = ?auto_30214 ?auto_30215 ) ) ( not ( = ?auto_30214 ?auto_30216 ) ) ( not ( = ?auto_30215 ?auto_30216 ) ) ( ON ?auto_30214 ?auto_30215 ) ( ON ?auto_30213 ?auto_30214 ) ( CLEAR ?auto_30213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30213 )
      ( MAKE-3PILE ?auto_30213 ?auto_30214 ?auto_30215 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30228 - BLOCK
      ?auto_30229 - BLOCK
      ?auto_30230 - BLOCK
      ?auto_30231 - BLOCK
    )
    :vars
    (
      ?auto_30232 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_30230 ) ( ON ?auto_30231 ?auto_30232 ) ( CLEAR ?auto_30231 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30228 ) ( ON ?auto_30229 ?auto_30228 ) ( ON ?auto_30230 ?auto_30229 ) ( not ( = ?auto_30228 ?auto_30229 ) ) ( not ( = ?auto_30228 ?auto_30230 ) ) ( not ( = ?auto_30228 ?auto_30231 ) ) ( not ( = ?auto_30228 ?auto_30232 ) ) ( not ( = ?auto_30229 ?auto_30230 ) ) ( not ( = ?auto_30229 ?auto_30231 ) ) ( not ( = ?auto_30229 ?auto_30232 ) ) ( not ( = ?auto_30230 ?auto_30231 ) ) ( not ( = ?auto_30230 ?auto_30232 ) ) ( not ( = ?auto_30231 ?auto_30232 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30231 ?auto_30232 )
      ( !STACK ?auto_30231 ?auto_30230 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30246 - BLOCK
      ?auto_30247 - BLOCK
      ?auto_30248 - BLOCK
      ?auto_30249 - BLOCK
    )
    :vars
    (
      ?auto_30250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30249 ?auto_30250 ) ( ON-TABLE ?auto_30246 ) ( ON ?auto_30247 ?auto_30246 ) ( not ( = ?auto_30246 ?auto_30247 ) ) ( not ( = ?auto_30246 ?auto_30248 ) ) ( not ( = ?auto_30246 ?auto_30249 ) ) ( not ( = ?auto_30246 ?auto_30250 ) ) ( not ( = ?auto_30247 ?auto_30248 ) ) ( not ( = ?auto_30247 ?auto_30249 ) ) ( not ( = ?auto_30247 ?auto_30250 ) ) ( not ( = ?auto_30248 ?auto_30249 ) ) ( not ( = ?auto_30248 ?auto_30250 ) ) ( not ( = ?auto_30249 ?auto_30250 ) ) ( CLEAR ?auto_30247 ) ( ON ?auto_30248 ?auto_30249 ) ( CLEAR ?auto_30248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30246 ?auto_30247 ?auto_30248 )
      ( MAKE-4PILE ?auto_30246 ?auto_30247 ?auto_30248 ?auto_30249 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30264 - BLOCK
      ?auto_30265 - BLOCK
      ?auto_30266 - BLOCK
      ?auto_30267 - BLOCK
    )
    :vars
    (
      ?auto_30268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30267 ?auto_30268 ) ( ON-TABLE ?auto_30264 ) ( not ( = ?auto_30264 ?auto_30265 ) ) ( not ( = ?auto_30264 ?auto_30266 ) ) ( not ( = ?auto_30264 ?auto_30267 ) ) ( not ( = ?auto_30264 ?auto_30268 ) ) ( not ( = ?auto_30265 ?auto_30266 ) ) ( not ( = ?auto_30265 ?auto_30267 ) ) ( not ( = ?auto_30265 ?auto_30268 ) ) ( not ( = ?auto_30266 ?auto_30267 ) ) ( not ( = ?auto_30266 ?auto_30268 ) ) ( not ( = ?auto_30267 ?auto_30268 ) ) ( ON ?auto_30266 ?auto_30267 ) ( CLEAR ?auto_30264 ) ( ON ?auto_30265 ?auto_30266 ) ( CLEAR ?auto_30265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30264 ?auto_30265 )
      ( MAKE-4PILE ?auto_30264 ?auto_30265 ?auto_30266 ?auto_30267 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30282 - BLOCK
      ?auto_30283 - BLOCK
      ?auto_30284 - BLOCK
      ?auto_30285 - BLOCK
    )
    :vars
    (
      ?auto_30286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30285 ?auto_30286 ) ( not ( = ?auto_30282 ?auto_30283 ) ) ( not ( = ?auto_30282 ?auto_30284 ) ) ( not ( = ?auto_30282 ?auto_30285 ) ) ( not ( = ?auto_30282 ?auto_30286 ) ) ( not ( = ?auto_30283 ?auto_30284 ) ) ( not ( = ?auto_30283 ?auto_30285 ) ) ( not ( = ?auto_30283 ?auto_30286 ) ) ( not ( = ?auto_30284 ?auto_30285 ) ) ( not ( = ?auto_30284 ?auto_30286 ) ) ( not ( = ?auto_30285 ?auto_30286 ) ) ( ON ?auto_30284 ?auto_30285 ) ( ON ?auto_30283 ?auto_30284 ) ( ON ?auto_30282 ?auto_30283 ) ( CLEAR ?auto_30282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30282 )
      ( MAKE-4PILE ?auto_30282 ?auto_30283 ?auto_30284 ?auto_30285 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30301 - BLOCK
      ?auto_30302 - BLOCK
      ?auto_30303 - BLOCK
      ?auto_30304 - BLOCK
      ?auto_30305 - BLOCK
    )
    :vars
    (
      ?auto_30306 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_30304 ) ( ON ?auto_30305 ?auto_30306 ) ( CLEAR ?auto_30305 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30301 ) ( ON ?auto_30302 ?auto_30301 ) ( ON ?auto_30303 ?auto_30302 ) ( ON ?auto_30304 ?auto_30303 ) ( not ( = ?auto_30301 ?auto_30302 ) ) ( not ( = ?auto_30301 ?auto_30303 ) ) ( not ( = ?auto_30301 ?auto_30304 ) ) ( not ( = ?auto_30301 ?auto_30305 ) ) ( not ( = ?auto_30301 ?auto_30306 ) ) ( not ( = ?auto_30302 ?auto_30303 ) ) ( not ( = ?auto_30302 ?auto_30304 ) ) ( not ( = ?auto_30302 ?auto_30305 ) ) ( not ( = ?auto_30302 ?auto_30306 ) ) ( not ( = ?auto_30303 ?auto_30304 ) ) ( not ( = ?auto_30303 ?auto_30305 ) ) ( not ( = ?auto_30303 ?auto_30306 ) ) ( not ( = ?auto_30304 ?auto_30305 ) ) ( not ( = ?auto_30304 ?auto_30306 ) ) ( not ( = ?auto_30305 ?auto_30306 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30305 ?auto_30306 )
      ( !STACK ?auto_30305 ?auto_30304 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30323 - BLOCK
      ?auto_30324 - BLOCK
      ?auto_30325 - BLOCK
      ?auto_30326 - BLOCK
      ?auto_30327 - BLOCK
    )
    :vars
    (
      ?auto_30328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30327 ?auto_30328 ) ( ON-TABLE ?auto_30323 ) ( ON ?auto_30324 ?auto_30323 ) ( ON ?auto_30325 ?auto_30324 ) ( not ( = ?auto_30323 ?auto_30324 ) ) ( not ( = ?auto_30323 ?auto_30325 ) ) ( not ( = ?auto_30323 ?auto_30326 ) ) ( not ( = ?auto_30323 ?auto_30327 ) ) ( not ( = ?auto_30323 ?auto_30328 ) ) ( not ( = ?auto_30324 ?auto_30325 ) ) ( not ( = ?auto_30324 ?auto_30326 ) ) ( not ( = ?auto_30324 ?auto_30327 ) ) ( not ( = ?auto_30324 ?auto_30328 ) ) ( not ( = ?auto_30325 ?auto_30326 ) ) ( not ( = ?auto_30325 ?auto_30327 ) ) ( not ( = ?auto_30325 ?auto_30328 ) ) ( not ( = ?auto_30326 ?auto_30327 ) ) ( not ( = ?auto_30326 ?auto_30328 ) ) ( not ( = ?auto_30327 ?auto_30328 ) ) ( CLEAR ?auto_30325 ) ( ON ?auto_30326 ?auto_30327 ) ( CLEAR ?auto_30326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30323 ?auto_30324 ?auto_30325 ?auto_30326 )
      ( MAKE-5PILE ?auto_30323 ?auto_30324 ?auto_30325 ?auto_30326 ?auto_30327 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30345 - BLOCK
      ?auto_30346 - BLOCK
      ?auto_30347 - BLOCK
      ?auto_30348 - BLOCK
      ?auto_30349 - BLOCK
    )
    :vars
    (
      ?auto_30350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30349 ?auto_30350 ) ( ON-TABLE ?auto_30345 ) ( ON ?auto_30346 ?auto_30345 ) ( not ( = ?auto_30345 ?auto_30346 ) ) ( not ( = ?auto_30345 ?auto_30347 ) ) ( not ( = ?auto_30345 ?auto_30348 ) ) ( not ( = ?auto_30345 ?auto_30349 ) ) ( not ( = ?auto_30345 ?auto_30350 ) ) ( not ( = ?auto_30346 ?auto_30347 ) ) ( not ( = ?auto_30346 ?auto_30348 ) ) ( not ( = ?auto_30346 ?auto_30349 ) ) ( not ( = ?auto_30346 ?auto_30350 ) ) ( not ( = ?auto_30347 ?auto_30348 ) ) ( not ( = ?auto_30347 ?auto_30349 ) ) ( not ( = ?auto_30347 ?auto_30350 ) ) ( not ( = ?auto_30348 ?auto_30349 ) ) ( not ( = ?auto_30348 ?auto_30350 ) ) ( not ( = ?auto_30349 ?auto_30350 ) ) ( ON ?auto_30348 ?auto_30349 ) ( CLEAR ?auto_30346 ) ( ON ?auto_30347 ?auto_30348 ) ( CLEAR ?auto_30347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30345 ?auto_30346 ?auto_30347 )
      ( MAKE-5PILE ?auto_30345 ?auto_30346 ?auto_30347 ?auto_30348 ?auto_30349 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30367 - BLOCK
      ?auto_30368 - BLOCK
      ?auto_30369 - BLOCK
      ?auto_30370 - BLOCK
      ?auto_30371 - BLOCK
    )
    :vars
    (
      ?auto_30372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30371 ?auto_30372 ) ( ON-TABLE ?auto_30367 ) ( not ( = ?auto_30367 ?auto_30368 ) ) ( not ( = ?auto_30367 ?auto_30369 ) ) ( not ( = ?auto_30367 ?auto_30370 ) ) ( not ( = ?auto_30367 ?auto_30371 ) ) ( not ( = ?auto_30367 ?auto_30372 ) ) ( not ( = ?auto_30368 ?auto_30369 ) ) ( not ( = ?auto_30368 ?auto_30370 ) ) ( not ( = ?auto_30368 ?auto_30371 ) ) ( not ( = ?auto_30368 ?auto_30372 ) ) ( not ( = ?auto_30369 ?auto_30370 ) ) ( not ( = ?auto_30369 ?auto_30371 ) ) ( not ( = ?auto_30369 ?auto_30372 ) ) ( not ( = ?auto_30370 ?auto_30371 ) ) ( not ( = ?auto_30370 ?auto_30372 ) ) ( not ( = ?auto_30371 ?auto_30372 ) ) ( ON ?auto_30370 ?auto_30371 ) ( ON ?auto_30369 ?auto_30370 ) ( CLEAR ?auto_30367 ) ( ON ?auto_30368 ?auto_30369 ) ( CLEAR ?auto_30368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30367 ?auto_30368 )
      ( MAKE-5PILE ?auto_30367 ?auto_30368 ?auto_30369 ?auto_30370 ?auto_30371 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30389 - BLOCK
      ?auto_30390 - BLOCK
      ?auto_30391 - BLOCK
      ?auto_30392 - BLOCK
      ?auto_30393 - BLOCK
    )
    :vars
    (
      ?auto_30394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30393 ?auto_30394 ) ( not ( = ?auto_30389 ?auto_30390 ) ) ( not ( = ?auto_30389 ?auto_30391 ) ) ( not ( = ?auto_30389 ?auto_30392 ) ) ( not ( = ?auto_30389 ?auto_30393 ) ) ( not ( = ?auto_30389 ?auto_30394 ) ) ( not ( = ?auto_30390 ?auto_30391 ) ) ( not ( = ?auto_30390 ?auto_30392 ) ) ( not ( = ?auto_30390 ?auto_30393 ) ) ( not ( = ?auto_30390 ?auto_30394 ) ) ( not ( = ?auto_30391 ?auto_30392 ) ) ( not ( = ?auto_30391 ?auto_30393 ) ) ( not ( = ?auto_30391 ?auto_30394 ) ) ( not ( = ?auto_30392 ?auto_30393 ) ) ( not ( = ?auto_30392 ?auto_30394 ) ) ( not ( = ?auto_30393 ?auto_30394 ) ) ( ON ?auto_30392 ?auto_30393 ) ( ON ?auto_30391 ?auto_30392 ) ( ON ?auto_30390 ?auto_30391 ) ( ON ?auto_30389 ?auto_30390 ) ( CLEAR ?auto_30389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30389 )
      ( MAKE-5PILE ?auto_30389 ?auto_30390 ?auto_30391 ?auto_30392 ?auto_30393 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_30412 - BLOCK
      ?auto_30413 - BLOCK
      ?auto_30414 - BLOCK
      ?auto_30415 - BLOCK
      ?auto_30416 - BLOCK
      ?auto_30417 - BLOCK
    )
    :vars
    (
      ?auto_30418 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_30416 ) ( ON ?auto_30417 ?auto_30418 ) ( CLEAR ?auto_30417 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30412 ) ( ON ?auto_30413 ?auto_30412 ) ( ON ?auto_30414 ?auto_30413 ) ( ON ?auto_30415 ?auto_30414 ) ( ON ?auto_30416 ?auto_30415 ) ( not ( = ?auto_30412 ?auto_30413 ) ) ( not ( = ?auto_30412 ?auto_30414 ) ) ( not ( = ?auto_30412 ?auto_30415 ) ) ( not ( = ?auto_30412 ?auto_30416 ) ) ( not ( = ?auto_30412 ?auto_30417 ) ) ( not ( = ?auto_30412 ?auto_30418 ) ) ( not ( = ?auto_30413 ?auto_30414 ) ) ( not ( = ?auto_30413 ?auto_30415 ) ) ( not ( = ?auto_30413 ?auto_30416 ) ) ( not ( = ?auto_30413 ?auto_30417 ) ) ( not ( = ?auto_30413 ?auto_30418 ) ) ( not ( = ?auto_30414 ?auto_30415 ) ) ( not ( = ?auto_30414 ?auto_30416 ) ) ( not ( = ?auto_30414 ?auto_30417 ) ) ( not ( = ?auto_30414 ?auto_30418 ) ) ( not ( = ?auto_30415 ?auto_30416 ) ) ( not ( = ?auto_30415 ?auto_30417 ) ) ( not ( = ?auto_30415 ?auto_30418 ) ) ( not ( = ?auto_30416 ?auto_30417 ) ) ( not ( = ?auto_30416 ?auto_30418 ) ) ( not ( = ?auto_30417 ?auto_30418 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30417 ?auto_30418 )
      ( !STACK ?auto_30417 ?auto_30416 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_30438 - BLOCK
      ?auto_30439 - BLOCK
      ?auto_30440 - BLOCK
      ?auto_30441 - BLOCK
      ?auto_30442 - BLOCK
      ?auto_30443 - BLOCK
    )
    :vars
    (
      ?auto_30444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30443 ?auto_30444 ) ( ON-TABLE ?auto_30438 ) ( ON ?auto_30439 ?auto_30438 ) ( ON ?auto_30440 ?auto_30439 ) ( ON ?auto_30441 ?auto_30440 ) ( not ( = ?auto_30438 ?auto_30439 ) ) ( not ( = ?auto_30438 ?auto_30440 ) ) ( not ( = ?auto_30438 ?auto_30441 ) ) ( not ( = ?auto_30438 ?auto_30442 ) ) ( not ( = ?auto_30438 ?auto_30443 ) ) ( not ( = ?auto_30438 ?auto_30444 ) ) ( not ( = ?auto_30439 ?auto_30440 ) ) ( not ( = ?auto_30439 ?auto_30441 ) ) ( not ( = ?auto_30439 ?auto_30442 ) ) ( not ( = ?auto_30439 ?auto_30443 ) ) ( not ( = ?auto_30439 ?auto_30444 ) ) ( not ( = ?auto_30440 ?auto_30441 ) ) ( not ( = ?auto_30440 ?auto_30442 ) ) ( not ( = ?auto_30440 ?auto_30443 ) ) ( not ( = ?auto_30440 ?auto_30444 ) ) ( not ( = ?auto_30441 ?auto_30442 ) ) ( not ( = ?auto_30441 ?auto_30443 ) ) ( not ( = ?auto_30441 ?auto_30444 ) ) ( not ( = ?auto_30442 ?auto_30443 ) ) ( not ( = ?auto_30442 ?auto_30444 ) ) ( not ( = ?auto_30443 ?auto_30444 ) ) ( CLEAR ?auto_30441 ) ( ON ?auto_30442 ?auto_30443 ) ( CLEAR ?auto_30442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30438 ?auto_30439 ?auto_30440 ?auto_30441 ?auto_30442 )
      ( MAKE-6PILE ?auto_30438 ?auto_30439 ?auto_30440 ?auto_30441 ?auto_30442 ?auto_30443 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_30464 - BLOCK
      ?auto_30465 - BLOCK
      ?auto_30466 - BLOCK
      ?auto_30467 - BLOCK
      ?auto_30468 - BLOCK
      ?auto_30469 - BLOCK
    )
    :vars
    (
      ?auto_30470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30469 ?auto_30470 ) ( ON-TABLE ?auto_30464 ) ( ON ?auto_30465 ?auto_30464 ) ( ON ?auto_30466 ?auto_30465 ) ( not ( = ?auto_30464 ?auto_30465 ) ) ( not ( = ?auto_30464 ?auto_30466 ) ) ( not ( = ?auto_30464 ?auto_30467 ) ) ( not ( = ?auto_30464 ?auto_30468 ) ) ( not ( = ?auto_30464 ?auto_30469 ) ) ( not ( = ?auto_30464 ?auto_30470 ) ) ( not ( = ?auto_30465 ?auto_30466 ) ) ( not ( = ?auto_30465 ?auto_30467 ) ) ( not ( = ?auto_30465 ?auto_30468 ) ) ( not ( = ?auto_30465 ?auto_30469 ) ) ( not ( = ?auto_30465 ?auto_30470 ) ) ( not ( = ?auto_30466 ?auto_30467 ) ) ( not ( = ?auto_30466 ?auto_30468 ) ) ( not ( = ?auto_30466 ?auto_30469 ) ) ( not ( = ?auto_30466 ?auto_30470 ) ) ( not ( = ?auto_30467 ?auto_30468 ) ) ( not ( = ?auto_30467 ?auto_30469 ) ) ( not ( = ?auto_30467 ?auto_30470 ) ) ( not ( = ?auto_30468 ?auto_30469 ) ) ( not ( = ?auto_30468 ?auto_30470 ) ) ( not ( = ?auto_30469 ?auto_30470 ) ) ( ON ?auto_30468 ?auto_30469 ) ( CLEAR ?auto_30466 ) ( ON ?auto_30467 ?auto_30468 ) ( CLEAR ?auto_30467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30464 ?auto_30465 ?auto_30466 ?auto_30467 )
      ( MAKE-6PILE ?auto_30464 ?auto_30465 ?auto_30466 ?auto_30467 ?auto_30468 ?auto_30469 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_30490 - BLOCK
      ?auto_30491 - BLOCK
      ?auto_30492 - BLOCK
      ?auto_30493 - BLOCK
      ?auto_30494 - BLOCK
      ?auto_30495 - BLOCK
    )
    :vars
    (
      ?auto_30496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30495 ?auto_30496 ) ( ON-TABLE ?auto_30490 ) ( ON ?auto_30491 ?auto_30490 ) ( not ( = ?auto_30490 ?auto_30491 ) ) ( not ( = ?auto_30490 ?auto_30492 ) ) ( not ( = ?auto_30490 ?auto_30493 ) ) ( not ( = ?auto_30490 ?auto_30494 ) ) ( not ( = ?auto_30490 ?auto_30495 ) ) ( not ( = ?auto_30490 ?auto_30496 ) ) ( not ( = ?auto_30491 ?auto_30492 ) ) ( not ( = ?auto_30491 ?auto_30493 ) ) ( not ( = ?auto_30491 ?auto_30494 ) ) ( not ( = ?auto_30491 ?auto_30495 ) ) ( not ( = ?auto_30491 ?auto_30496 ) ) ( not ( = ?auto_30492 ?auto_30493 ) ) ( not ( = ?auto_30492 ?auto_30494 ) ) ( not ( = ?auto_30492 ?auto_30495 ) ) ( not ( = ?auto_30492 ?auto_30496 ) ) ( not ( = ?auto_30493 ?auto_30494 ) ) ( not ( = ?auto_30493 ?auto_30495 ) ) ( not ( = ?auto_30493 ?auto_30496 ) ) ( not ( = ?auto_30494 ?auto_30495 ) ) ( not ( = ?auto_30494 ?auto_30496 ) ) ( not ( = ?auto_30495 ?auto_30496 ) ) ( ON ?auto_30494 ?auto_30495 ) ( ON ?auto_30493 ?auto_30494 ) ( CLEAR ?auto_30491 ) ( ON ?auto_30492 ?auto_30493 ) ( CLEAR ?auto_30492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30490 ?auto_30491 ?auto_30492 )
      ( MAKE-6PILE ?auto_30490 ?auto_30491 ?auto_30492 ?auto_30493 ?auto_30494 ?auto_30495 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_30516 - BLOCK
      ?auto_30517 - BLOCK
      ?auto_30518 - BLOCK
      ?auto_30519 - BLOCK
      ?auto_30520 - BLOCK
      ?auto_30521 - BLOCK
    )
    :vars
    (
      ?auto_30522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30521 ?auto_30522 ) ( ON-TABLE ?auto_30516 ) ( not ( = ?auto_30516 ?auto_30517 ) ) ( not ( = ?auto_30516 ?auto_30518 ) ) ( not ( = ?auto_30516 ?auto_30519 ) ) ( not ( = ?auto_30516 ?auto_30520 ) ) ( not ( = ?auto_30516 ?auto_30521 ) ) ( not ( = ?auto_30516 ?auto_30522 ) ) ( not ( = ?auto_30517 ?auto_30518 ) ) ( not ( = ?auto_30517 ?auto_30519 ) ) ( not ( = ?auto_30517 ?auto_30520 ) ) ( not ( = ?auto_30517 ?auto_30521 ) ) ( not ( = ?auto_30517 ?auto_30522 ) ) ( not ( = ?auto_30518 ?auto_30519 ) ) ( not ( = ?auto_30518 ?auto_30520 ) ) ( not ( = ?auto_30518 ?auto_30521 ) ) ( not ( = ?auto_30518 ?auto_30522 ) ) ( not ( = ?auto_30519 ?auto_30520 ) ) ( not ( = ?auto_30519 ?auto_30521 ) ) ( not ( = ?auto_30519 ?auto_30522 ) ) ( not ( = ?auto_30520 ?auto_30521 ) ) ( not ( = ?auto_30520 ?auto_30522 ) ) ( not ( = ?auto_30521 ?auto_30522 ) ) ( ON ?auto_30520 ?auto_30521 ) ( ON ?auto_30519 ?auto_30520 ) ( ON ?auto_30518 ?auto_30519 ) ( CLEAR ?auto_30516 ) ( ON ?auto_30517 ?auto_30518 ) ( CLEAR ?auto_30517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30516 ?auto_30517 )
      ( MAKE-6PILE ?auto_30516 ?auto_30517 ?auto_30518 ?auto_30519 ?auto_30520 ?auto_30521 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_30542 - BLOCK
      ?auto_30543 - BLOCK
      ?auto_30544 - BLOCK
      ?auto_30545 - BLOCK
      ?auto_30546 - BLOCK
      ?auto_30547 - BLOCK
    )
    :vars
    (
      ?auto_30548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30547 ?auto_30548 ) ( not ( = ?auto_30542 ?auto_30543 ) ) ( not ( = ?auto_30542 ?auto_30544 ) ) ( not ( = ?auto_30542 ?auto_30545 ) ) ( not ( = ?auto_30542 ?auto_30546 ) ) ( not ( = ?auto_30542 ?auto_30547 ) ) ( not ( = ?auto_30542 ?auto_30548 ) ) ( not ( = ?auto_30543 ?auto_30544 ) ) ( not ( = ?auto_30543 ?auto_30545 ) ) ( not ( = ?auto_30543 ?auto_30546 ) ) ( not ( = ?auto_30543 ?auto_30547 ) ) ( not ( = ?auto_30543 ?auto_30548 ) ) ( not ( = ?auto_30544 ?auto_30545 ) ) ( not ( = ?auto_30544 ?auto_30546 ) ) ( not ( = ?auto_30544 ?auto_30547 ) ) ( not ( = ?auto_30544 ?auto_30548 ) ) ( not ( = ?auto_30545 ?auto_30546 ) ) ( not ( = ?auto_30545 ?auto_30547 ) ) ( not ( = ?auto_30545 ?auto_30548 ) ) ( not ( = ?auto_30546 ?auto_30547 ) ) ( not ( = ?auto_30546 ?auto_30548 ) ) ( not ( = ?auto_30547 ?auto_30548 ) ) ( ON ?auto_30546 ?auto_30547 ) ( ON ?auto_30545 ?auto_30546 ) ( ON ?auto_30544 ?auto_30545 ) ( ON ?auto_30543 ?auto_30544 ) ( ON ?auto_30542 ?auto_30543 ) ( CLEAR ?auto_30542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30542 )
      ( MAKE-6PILE ?auto_30542 ?auto_30543 ?auto_30544 ?auto_30545 ?auto_30546 ?auto_30547 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_30569 - BLOCK
      ?auto_30570 - BLOCK
      ?auto_30571 - BLOCK
      ?auto_30572 - BLOCK
      ?auto_30573 - BLOCK
      ?auto_30574 - BLOCK
      ?auto_30575 - BLOCK
    )
    :vars
    (
      ?auto_30576 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_30574 ) ( ON ?auto_30575 ?auto_30576 ) ( CLEAR ?auto_30575 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30569 ) ( ON ?auto_30570 ?auto_30569 ) ( ON ?auto_30571 ?auto_30570 ) ( ON ?auto_30572 ?auto_30571 ) ( ON ?auto_30573 ?auto_30572 ) ( ON ?auto_30574 ?auto_30573 ) ( not ( = ?auto_30569 ?auto_30570 ) ) ( not ( = ?auto_30569 ?auto_30571 ) ) ( not ( = ?auto_30569 ?auto_30572 ) ) ( not ( = ?auto_30569 ?auto_30573 ) ) ( not ( = ?auto_30569 ?auto_30574 ) ) ( not ( = ?auto_30569 ?auto_30575 ) ) ( not ( = ?auto_30569 ?auto_30576 ) ) ( not ( = ?auto_30570 ?auto_30571 ) ) ( not ( = ?auto_30570 ?auto_30572 ) ) ( not ( = ?auto_30570 ?auto_30573 ) ) ( not ( = ?auto_30570 ?auto_30574 ) ) ( not ( = ?auto_30570 ?auto_30575 ) ) ( not ( = ?auto_30570 ?auto_30576 ) ) ( not ( = ?auto_30571 ?auto_30572 ) ) ( not ( = ?auto_30571 ?auto_30573 ) ) ( not ( = ?auto_30571 ?auto_30574 ) ) ( not ( = ?auto_30571 ?auto_30575 ) ) ( not ( = ?auto_30571 ?auto_30576 ) ) ( not ( = ?auto_30572 ?auto_30573 ) ) ( not ( = ?auto_30572 ?auto_30574 ) ) ( not ( = ?auto_30572 ?auto_30575 ) ) ( not ( = ?auto_30572 ?auto_30576 ) ) ( not ( = ?auto_30573 ?auto_30574 ) ) ( not ( = ?auto_30573 ?auto_30575 ) ) ( not ( = ?auto_30573 ?auto_30576 ) ) ( not ( = ?auto_30574 ?auto_30575 ) ) ( not ( = ?auto_30574 ?auto_30576 ) ) ( not ( = ?auto_30575 ?auto_30576 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30575 ?auto_30576 )
      ( !STACK ?auto_30575 ?auto_30574 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_30584 - BLOCK
      ?auto_30585 - BLOCK
      ?auto_30586 - BLOCK
      ?auto_30587 - BLOCK
      ?auto_30588 - BLOCK
      ?auto_30589 - BLOCK
      ?auto_30590 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_30589 ) ( ON-TABLE ?auto_30590 ) ( CLEAR ?auto_30590 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30584 ) ( ON ?auto_30585 ?auto_30584 ) ( ON ?auto_30586 ?auto_30585 ) ( ON ?auto_30587 ?auto_30586 ) ( ON ?auto_30588 ?auto_30587 ) ( ON ?auto_30589 ?auto_30588 ) ( not ( = ?auto_30584 ?auto_30585 ) ) ( not ( = ?auto_30584 ?auto_30586 ) ) ( not ( = ?auto_30584 ?auto_30587 ) ) ( not ( = ?auto_30584 ?auto_30588 ) ) ( not ( = ?auto_30584 ?auto_30589 ) ) ( not ( = ?auto_30584 ?auto_30590 ) ) ( not ( = ?auto_30585 ?auto_30586 ) ) ( not ( = ?auto_30585 ?auto_30587 ) ) ( not ( = ?auto_30585 ?auto_30588 ) ) ( not ( = ?auto_30585 ?auto_30589 ) ) ( not ( = ?auto_30585 ?auto_30590 ) ) ( not ( = ?auto_30586 ?auto_30587 ) ) ( not ( = ?auto_30586 ?auto_30588 ) ) ( not ( = ?auto_30586 ?auto_30589 ) ) ( not ( = ?auto_30586 ?auto_30590 ) ) ( not ( = ?auto_30587 ?auto_30588 ) ) ( not ( = ?auto_30587 ?auto_30589 ) ) ( not ( = ?auto_30587 ?auto_30590 ) ) ( not ( = ?auto_30588 ?auto_30589 ) ) ( not ( = ?auto_30588 ?auto_30590 ) ) ( not ( = ?auto_30589 ?auto_30590 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_30590 )
      ( !STACK ?auto_30590 ?auto_30589 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_30598 - BLOCK
      ?auto_30599 - BLOCK
      ?auto_30600 - BLOCK
      ?auto_30601 - BLOCK
      ?auto_30602 - BLOCK
      ?auto_30603 - BLOCK
      ?auto_30604 - BLOCK
    )
    :vars
    (
      ?auto_30605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30604 ?auto_30605 ) ( ON-TABLE ?auto_30598 ) ( ON ?auto_30599 ?auto_30598 ) ( ON ?auto_30600 ?auto_30599 ) ( ON ?auto_30601 ?auto_30600 ) ( ON ?auto_30602 ?auto_30601 ) ( not ( = ?auto_30598 ?auto_30599 ) ) ( not ( = ?auto_30598 ?auto_30600 ) ) ( not ( = ?auto_30598 ?auto_30601 ) ) ( not ( = ?auto_30598 ?auto_30602 ) ) ( not ( = ?auto_30598 ?auto_30603 ) ) ( not ( = ?auto_30598 ?auto_30604 ) ) ( not ( = ?auto_30598 ?auto_30605 ) ) ( not ( = ?auto_30599 ?auto_30600 ) ) ( not ( = ?auto_30599 ?auto_30601 ) ) ( not ( = ?auto_30599 ?auto_30602 ) ) ( not ( = ?auto_30599 ?auto_30603 ) ) ( not ( = ?auto_30599 ?auto_30604 ) ) ( not ( = ?auto_30599 ?auto_30605 ) ) ( not ( = ?auto_30600 ?auto_30601 ) ) ( not ( = ?auto_30600 ?auto_30602 ) ) ( not ( = ?auto_30600 ?auto_30603 ) ) ( not ( = ?auto_30600 ?auto_30604 ) ) ( not ( = ?auto_30600 ?auto_30605 ) ) ( not ( = ?auto_30601 ?auto_30602 ) ) ( not ( = ?auto_30601 ?auto_30603 ) ) ( not ( = ?auto_30601 ?auto_30604 ) ) ( not ( = ?auto_30601 ?auto_30605 ) ) ( not ( = ?auto_30602 ?auto_30603 ) ) ( not ( = ?auto_30602 ?auto_30604 ) ) ( not ( = ?auto_30602 ?auto_30605 ) ) ( not ( = ?auto_30603 ?auto_30604 ) ) ( not ( = ?auto_30603 ?auto_30605 ) ) ( not ( = ?auto_30604 ?auto_30605 ) ) ( CLEAR ?auto_30602 ) ( ON ?auto_30603 ?auto_30604 ) ( CLEAR ?auto_30603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_30598 ?auto_30599 ?auto_30600 ?auto_30601 ?auto_30602 ?auto_30603 )
      ( MAKE-7PILE ?auto_30598 ?auto_30599 ?auto_30600 ?auto_30601 ?auto_30602 ?auto_30603 ?auto_30604 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_30613 - BLOCK
      ?auto_30614 - BLOCK
      ?auto_30615 - BLOCK
      ?auto_30616 - BLOCK
      ?auto_30617 - BLOCK
      ?auto_30618 - BLOCK
      ?auto_30619 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30619 ) ( ON-TABLE ?auto_30613 ) ( ON ?auto_30614 ?auto_30613 ) ( ON ?auto_30615 ?auto_30614 ) ( ON ?auto_30616 ?auto_30615 ) ( ON ?auto_30617 ?auto_30616 ) ( not ( = ?auto_30613 ?auto_30614 ) ) ( not ( = ?auto_30613 ?auto_30615 ) ) ( not ( = ?auto_30613 ?auto_30616 ) ) ( not ( = ?auto_30613 ?auto_30617 ) ) ( not ( = ?auto_30613 ?auto_30618 ) ) ( not ( = ?auto_30613 ?auto_30619 ) ) ( not ( = ?auto_30614 ?auto_30615 ) ) ( not ( = ?auto_30614 ?auto_30616 ) ) ( not ( = ?auto_30614 ?auto_30617 ) ) ( not ( = ?auto_30614 ?auto_30618 ) ) ( not ( = ?auto_30614 ?auto_30619 ) ) ( not ( = ?auto_30615 ?auto_30616 ) ) ( not ( = ?auto_30615 ?auto_30617 ) ) ( not ( = ?auto_30615 ?auto_30618 ) ) ( not ( = ?auto_30615 ?auto_30619 ) ) ( not ( = ?auto_30616 ?auto_30617 ) ) ( not ( = ?auto_30616 ?auto_30618 ) ) ( not ( = ?auto_30616 ?auto_30619 ) ) ( not ( = ?auto_30617 ?auto_30618 ) ) ( not ( = ?auto_30617 ?auto_30619 ) ) ( not ( = ?auto_30618 ?auto_30619 ) ) ( CLEAR ?auto_30617 ) ( ON ?auto_30618 ?auto_30619 ) ( CLEAR ?auto_30618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_30613 ?auto_30614 ?auto_30615 ?auto_30616 ?auto_30617 ?auto_30618 )
      ( MAKE-7PILE ?auto_30613 ?auto_30614 ?auto_30615 ?auto_30616 ?auto_30617 ?auto_30618 ?auto_30619 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_30627 - BLOCK
      ?auto_30628 - BLOCK
      ?auto_30629 - BLOCK
      ?auto_30630 - BLOCK
      ?auto_30631 - BLOCK
      ?auto_30632 - BLOCK
      ?auto_30633 - BLOCK
    )
    :vars
    (
      ?auto_30634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30633 ?auto_30634 ) ( ON-TABLE ?auto_30627 ) ( ON ?auto_30628 ?auto_30627 ) ( ON ?auto_30629 ?auto_30628 ) ( ON ?auto_30630 ?auto_30629 ) ( not ( = ?auto_30627 ?auto_30628 ) ) ( not ( = ?auto_30627 ?auto_30629 ) ) ( not ( = ?auto_30627 ?auto_30630 ) ) ( not ( = ?auto_30627 ?auto_30631 ) ) ( not ( = ?auto_30627 ?auto_30632 ) ) ( not ( = ?auto_30627 ?auto_30633 ) ) ( not ( = ?auto_30627 ?auto_30634 ) ) ( not ( = ?auto_30628 ?auto_30629 ) ) ( not ( = ?auto_30628 ?auto_30630 ) ) ( not ( = ?auto_30628 ?auto_30631 ) ) ( not ( = ?auto_30628 ?auto_30632 ) ) ( not ( = ?auto_30628 ?auto_30633 ) ) ( not ( = ?auto_30628 ?auto_30634 ) ) ( not ( = ?auto_30629 ?auto_30630 ) ) ( not ( = ?auto_30629 ?auto_30631 ) ) ( not ( = ?auto_30629 ?auto_30632 ) ) ( not ( = ?auto_30629 ?auto_30633 ) ) ( not ( = ?auto_30629 ?auto_30634 ) ) ( not ( = ?auto_30630 ?auto_30631 ) ) ( not ( = ?auto_30630 ?auto_30632 ) ) ( not ( = ?auto_30630 ?auto_30633 ) ) ( not ( = ?auto_30630 ?auto_30634 ) ) ( not ( = ?auto_30631 ?auto_30632 ) ) ( not ( = ?auto_30631 ?auto_30633 ) ) ( not ( = ?auto_30631 ?auto_30634 ) ) ( not ( = ?auto_30632 ?auto_30633 ) ) ( not ( = ?auto_30632 ?auto_30634 ) ) ( not ( = ?auto_30633 ?auto_30634 ) ) ( ON ?auto_30632 ?auto_30633 ) ( CLEAR ?auto_30630 ) ( ON ?auto_30631 ?auto_30632 ) ( CLEAR ?auto_30631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30627 ?auto_30628 ?auto_30629 ?auto_30630 ?auto_30631 )
      ( MAKE-7PILE ?auto_30627 ?auto_30628 ?auto_30629 ?auto_30630 ?auto_30631 ?auto_30632 ?auto_30633 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_30642 - BLOCK
      ?auto_30643 - BLOCK
      ?auto_30644 - BLOCK
      ?auto_30645 - BLOCK
      ?auto_30646 - BLOCK
      ?auto_30647 - BLOCK
      ?auto_30648 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30648 ) ( ON-TABLE ?auto_30642 ) ( ON ?auto_30643 ?auto_30642 ) ( ON ?auto_30644 ?auto_30643 ) ( ON ?auto_30645 ?auto_30644 ) ( not ( = ?auto_30642 ?auto_30643 ) ) ( not ( = ?auto_30642 ?auto_30644 ) ) ( not ( = ?auto_30642 ?auto_30645 ) ) ( not ( = ?auto_30642 ?auto_30646 ) ) ( not ( = ?auto_30642 ?auto_30647 ) ) ( not ( = ?auto_30642 ?auto_30648 ) ) ( not ( = ?auto_30643 ?auto_30644 ) ) ( not ( = ?auto_30643 ?auto_30645 ) ) ( not ( = ?auto_30643 ?auto_30646 ) ) ( not ( = ?auto_30643 ?auto_30647 ) ) ( not ( = ?auto_30643 ?auto_30648 ) ) ( not ( = ?auto_30644 ?auto_30645 ) ) ( not ( = ?auto_30644 ?auto_30646 ) ) ( not ( = ?auto_30644 ?auto_30647 ) ) ( not ( = ?auto_30644 ?auto_30648 ) ) ( not ( = ?auto_30645 ?auto_30646 ) ) ( not ( = ?auto_30645 ?auto_30647 ) ) ( not ( = ?auto_30645 ?auto_30648 ) ) ( not ( = ?auto_30646 ?auto_30647 ) ) ( not ( = ?auto_30646 ?auto_30648 ) ) ( not ( = ?auto_30647 ?auto_30648 ) ) ( ON ?auto_30647 ?auto_30648 ) ( CLEAR ?auto_30645 ) ( ON ?auto_30646 ?auto_30647 ) ( CLEAR ?auto_30646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30642 ?auto_30643 ?auto_30644 ?auto_30645 ?auto_30646 )
      ( MAKE-7PILE ?auto_30642 ?auto_30643 ?auto_30644 ?auto_30645 ?auto_30646 ?auto_30647 ?auto_30648 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_30656 - BLOCK
      ?auto_30657 - BLOCK
      ?auto_30658 - BLOCK
      ?auto_30659 - BLOCK
      ?auto_30660 - BLOCK
      ?auto_30661 - BLOCK
      ?auto_30662 - BLOCK
    )
    :vars
    (
      ?auto_30663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30662 ?auto_30663 ) ( ON-TABLE ?auto_30656 ) ( ON ?auto_30657 ?auto_30656 ) ( ON ?auto_30658 ?auto_30657 ) ( not ( = ?auto_30656 ?auto_30657 ) ) ( not ( = ?auto_30656 ?auto_30658 ) ) ( not ( = ?auto_30656 ?auto_30659 ) ) ( not ( = ?auto_30656 ?auto_30660 ) ) ( not ( = ?auto_30656 ?auto_30661 ) ) ( not ( = ?auto_30656 ?auto_30662 ) ) ( not ( = ?auto_30656 ?auto_30663 ) ) ( not ( = ?auto_30657 ?auto_30658 ) ) ( not ( = ?auto_30657 ?auto_30659 ) ) ( not ( = ?auto_30657 ?auto_30660 ) ) ( not ( = ?auto_30657 ?auto_30661 ) ) ( not ( = ?auto_30657 ?auto_30662 ) ) ( not ( = ?auto_30657 ?auto_30663 ) ) ( not ( = ?auto_30658 ?auto_30659 ) ) ( not ( = ?auto_30658 ?auto_30660 ) ) ( not ( = ?auto_30658 ?auto_30661 ) ) ( not ( = ?auto_30658 ?auto_30662 ) ) ( not ( = ?auto_30658 ?auto_30663 ) ) ( not ( = ?auto_30659 ?auto_30660 ) ) ( not ( = ?auto_30659 ?auto_30661 ) ) ( not ( = ?auto_30659 ?auto_30662 ) ) ( not ( = ?auto_30659 ?auto_30663 ) ) ( not ( = ?auto_30660 ?auto_30661 ) ) ( not ( = ?auto_30660 ?auto_30662 ) ) ( not ( = ?auto_30660 ?auto_30663 ) ) ( not ( = ?auto_30661 ?auto_30662 ) ) ( not ( = ?auto_30661 ?auto_30663 ) ) ( not ( = ?auto_30662 ?auto_30663 ) ) ( ON ?auto_30661 ?auto_30662 ) ( ON ?auto_30660 ?auto_30661 ) ( CLEAR ?auto_30658 ) ( ON ?auto_30659 ?auto_30660 ) ( CLEAR ?auto_30659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30656 ?auto_30657 ?auto_30658 ?auto_30659 )
      ( MAKE-7PILE ?auto_30656 ?auto_30657 ?auto_30658 ?auto_30659 ?auto_30660 ?auto_30661 ?auto_30662 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_30671 - BLOCK
      ?auto_30672 - BLOCK
      ?auto_30673 - BLOCK
      ?auto_30674 - BLOCK
      ?auto_30675 - BLOCK
      ?auto_30676 - BLOCK
      ?auto_30677 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30677 ) ( ON-TABLE ?auto_30671 ) ( ON ?auto_30672 ?auto_30671 ) ( ON ?auto_30673 ?auto_30672 ) ( not ( = ?auto_30671 ?auto_30672 ) ) ( not ( = ?auto_30671 ?auto_30673 ) ) ( not ( = ?auto_30671 ?auto_30674 ) ) ( not ( = ?auto_30671 ?auto_30675 ) ) ( not ( = ?auto_30671 ?auto_30676 ) ) ( not ( = ?auto_30671 ?auto_30677 ) ) ( not ( = ?auto_30672 ?auto_30673 ) ) ( not ( = ?auto_30672 ?auto_30674 ) ) ( not ( = ?auto_30672 ?auto_30675 ) ) ( not ( = ?auto_30672 ?auto_30676 ) ) ( not ( = ?auto_30672 ?auto_30677 ) ) ( not ( = ?auto_30673 ?auto_30674 ) ) ( not ( = ?auto_30673 ?auto_30675 ) ) ( not ( = ?auto_30673 ?auto_30676 ) ) ( not ( = ?auto_30673 ?auto_30677 ) ) ( not ( = ?auto_30674 ?auto_30675 ) ) ( not ( = ?auto_30674 ?auto_30676 ) ) ( not ( = ?auto_30674 ?auto_30677 ) ) ( not ( = ?auto_30675 ?auto_30676 ) ) ( not ( = ?auto_30675 ?auto_30677 ) ) ( not ( = ?auto_30676 ?auto_30677 ) ) ( ON ?auto_30676 ?auto_30677 ) ( ON ?auto_30675 ?auto_30676 ) ( CLEAR ?auto_30673 ) ( ON ?auto_30674 ?auto_30675 ) ( CLEAR ?auto_30674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30671 ?auto_30672 ?auto_30673 ?auto_30674 )
      ( MAKE-7PILE ?auto_30671 ?auto_30672 ?auto_30673 ?auto_30674 ?auto_30675 ?auto_30676 ?auto_30677 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_30685 - BLOCK
      ?auto_30686 - BLOCK
      ?auto_30687 - BLOCK
      ?auto_30688 - BLOCK
      ?auto_30689 - BLOCK
      ?auto_30690 - BLOCK
      ?auto_30691 - BLOCK
    )
    :vars
    (
      ?auto_30692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30691 ?auto_30692 ) ( ON-TABLE ?auto_30685 ) ( ON ?auto_30686 ?auto_30685 ) ( not ( = ?auto_30685 ?auto_30686 ) ) ( not ( = ?auto_30685 ?auto_30687 ) ) ( not ( = ?auto_30685 ?auto_30688 ) ) ( not ( = ?auto_30685 ?auto_30689 ) ) ( not ( = ?auto_30685 ?auto_30690 ) ) ( not ( = ?auto_30685 ?auto_30691 ) ) ( not ( = ?auto_30685 ?auto_30692 ) ) ( not ( = ?auto_30686 ?auto_30687 ) ) ( not ( = ?auto_30686 ?auto_30688 ) ) ( not ( = ?auto_30686 ?auto_30689 ) ) ( not ( = ?auto_30686 ?auto_30690 ) ) ( not ( = ?auto_30686 ?auto_30691 ) ) ( not ( = ?auto_30686 ?auto_30692 ) ) ( not ( = ?auto_30687 ?auto_30688 ) ) ( not ( = ?auto_30687 ?auto_30689 ) ) ( not ( = ?auto_30687 ?auto_30690 ) ) ( not ( = ?auto_30687 ?auto_30691 ) ) ( not ( = ?auto_30687 ?auto_30692 ) ) ( not ( = ?auto_30688 ?auto_30689 ) ) ( not ( = ?auto_30688 ?auto_30690 ) ) ( not ( = ?auto_30688 ?auto_30691 ) ) ( not ( = ?auto_30688 ?auto_30692 ) ) ( not ( = ?auto_30689 ?auto_30690 ) ) ( not ( = ?auto_30689 ?auto_30691 ) ) ( not ( = ?auto_30689 ?auto_30692 ) ) ( not ( = ?auto_30690 ?auto_30691 ) ) ( not ( = ?auto_30690 ?auto_30692 ) ) ( not ( = ?auto_30691 ?auto_30692 ) ) ( ON ?auto_30690 ?auto_30691 ) ( ON ?auto_30689 ?auto_30690 ) ( ON ?auto_30688 ?auto_30689 ) ( CLEAR ?auto_30686 ) ( ON ?auto_30687 ?auto_30688 ) ( CLEAR ?auto_30687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30685 ?auto_30686 ?auto_30687 )
      ( MAKE-7PILE ?auto_30685 ?auto_30686 ?auto_30687 ?auto_30688 ?auto_30689 ?auto_30690 ?auto_30691 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_30700 - BLOCK
      ?auto_30701 - BLOCK
      ?auto_30702 - BLOCK
      ?auto_30703 - BLOCK
      ?auto_30704 - BLOCK
      ?auto_30705 - BLOCK
      ?auto_30706 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30706 ) ( ON-TABLE ?auto_30700 ) ( ON ?auto_30701 ?auto_30700 ) ( not ( = ?auto_30700 ?auto_30701 ) ) ( not ( = ?auto_30700 ?auto_30702 ) ) ( not ( = ?auto_30700 ?auto_30703 ) ) ( not ( = ?auto_30700 ?auto_30704 ) ) ( not ( = ?auto_30700 ?auto_30705 ) ) ( not ( = ?auto_30700 ?auto_30706 ) ) ( not ( = ?auto_30701 ?auto_30702 ) ) ( not ( = ?auto_30701 ?auto_30703 ) ) ( not ( = ?auto_30701 ?auto_30704 ) ) ( not ( = ?auto_30701 ?auto_30705 ) ) ( not ( = ?auto_30701 ?auto_30706 ) ) ( not ( = ?auto_30702 ?auto_30703 ) ) ( not ( = ?auto_30702 ?auto_30704 ) ) ( not ( = ?auto_30702 ?auto_30705 ) ) ( not ( = ?auto_30702 ?auto_30706 ) ) ( not ( = ?auto_30703 ?auto_30704 ) ) ( not ( = ?auto_30703 ?auto_30705 ) ) ( not ( = ?auto_30703 ?auto_30706 ) ) ( not ( = ?auto_30704 ?auto_30705 ) ) ( not ( = ?auto_30704 ?auto_30706 ) ) ( not ( = ?auto_30705 ?auto_30706 ) ) ( ON ?auto_30705 ?auto_30706 ) ( ON ?auto_30704 ?auto_30705 ) ( ON ?auto_30703 ?auto_30704 ) ( CLEAR ?auto_30701 ) ( ON ?auto_30702 ?auto_30703 ) ( CLEAR ?auto_30702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30700 ?auto_30701 ?auto_30702 )
      ( MAKE-7PILE ?auto_30700 ?auto_30701 ?auto_30702 ?auto_30703 ?auto_30704 ?auto_30705 ?auto_30706 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_30714 - BLOCK
      ?auto_30715 - BLOCK
      ?auto_30716 - BLOCK
      ?auto_30717 - BLOCK
      ?auto_30718 - BLOCK
      ?auto_30719 - BLOCK
      ?auto_30720 - BLOCK
    )
    :vars
    (
      ?auto_30721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30720 ?auto_30721 ) ( ON-TABLE ?auto_30714 ) ( not ( = ?auto_30714 ?auto_30715 ) ) ( not ( = ?auto_30714 ?auto_30716 ) ) ( not ( = ?auto_30714 ?auto_30717 ) ) ( not ( = ?auto_30714 ?auto_30718 ) ) ( not ( = ?auto_30714 ?auto_30719 ) ) ( not ( = ?auto_30714 ?auto_30720 ) ) ( not ( = ?auto_30714 ?auto_30721 ) ) ( not ( = ?auto_30715 ?auto_30716 ) ) ( not ( = ?auto_30715 ?auto_30717 ) ) ( not ( = ?auto_30715 ?auto_30718 ) ) ( not ( = ?auto_30715 ?auto_30719 ) ) ( not ( = ?auto_30715 ?auto_30720 ) ) ( not ( = ?auto_30715 ?auto_30721 ) ) ( not ( = ?auto_30716 ?auto_30717 ) ) ( not ( = ?auto_30716 ?auto_30718 ) ) ( not ( = ?auto_30716 ?auto_30719 ) ) ( not ( = ?auto_30716 ?auto_30720 ) ) ( not ( = ?auto_30716 ?auto_30721 ) ) ( not ( = ?auto_30717 ?auto_30718 ) ) ( not ( = ?auto_30717 ?auto_30719 ) ) ( not ( = ?auto_30717 ?auto_30720 ) ) ( not ( = ?auto_30717 ?auto_30721 ) ) ( not ( = ?auto_30718 ?auto_30719 ) ) ( not ( = ?auto_30718 ?auto_30720 ) ) ( not ( = ?auto_30718 ?auto_30721 ) ) ( not ( = ?auto_30719 ?auto_30720 ) ) ( not ( = ?auto_30719 ?auto_30721 ) ) ( not ( = ?auto_30720 ?auto_30721 ) ) ( ON ?auto_30719 ?auto_30720 ) ( ON ?auto_30718 ?auto_30719 ) ( ON ?auto_30717 ?auto_30718 ) ( ON ?auto_30716 ?auto_30717 ) ( CLEAR ?auto_30714 ) ( ON ?auto_30715 ?auto_30716 ) ( CLEAR ?auto_30715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30714 ?auto_30715 )
      ( MAKE-7PILE ?auto_30714 ?auto_30715 ?auto_30716 ?auto_30717 ?auto_30718 ?auto_30719 ?auto_30720 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_30729 - BLOCK
      ?auto_30730 - BLOCK
      ?auto_30731 - BLOCK
      ?auto_30732 - BLOCK
      ?auto_30733 - BLOCK
      ?auto_30734 - BLOCK
      ?auto_30735 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30735 ) ( ON-TABLE ?auto_30729 ) ( not ( = ?auto_30729 ?auto_30730 ) ) ( not ( = ?auto_30729 ?auto_30731 ) ) ( not ( = ?auto_30729 ?auto_30732 ) ) ( not ( = ?auto_30729 ?auto_30733 ) ) ( not ( = ?auto_30729 ?auto_30734 ) ) ( not ( = ?auto_30729 ?auto_30735 ) ) ( not ( = ?auto_30730 ?auto_30731 ) ) ( not ( = ?auto_30730 ?auto_30732 ) ) ( not ( = ?auto_30730 ?auto_30733 ) ) ( not ( = ?auto_30730 ?auto_30734 ) ) ( not ( = ?auto_30730 ?auto_30735 ) ) ( not ( = ?auto_30731 ?auto_30732 ) ) ( not ( = ?auto_30731 ?auto_30733 ) ) ( not ( = ?auto_30731 ?auto_30734 ) ) ( not ( = ?auto_30731 ?auto_30735 ) ) ( not ( = ?auto_30732 ?auto_30733 ) ) ( not ( = ?auto_30732 ?auto_30734 ) ) ( not ( = ?auto_30732 ?auto_30735 ) ) ( not ( = ?auto_30733 ?auto_30734 ) ) ( not ( = ?auto_30733 ?auto_30735 ) ) ( not ( = ?auto_30734 ?auto_30735 ) ) ( ON ?auto_30734 ?auto_30735 ) ( ON ?auto_30733 ?auto_30734 ) ( ON ?auto_30732 ?auto_30733 ) ( ON ?auto_30731 ?auto_30732 ) ( CLEAR ?auto_30729 ) ( ON ?auto_30730 ?auto_30731 ) ( CLEAR ?auto_30730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30729 ?auto_30730 )
      ( MAKE-7PILE ?auto_30729 ?auto_30730 ?auto_30731 ?auto_30732 ?auto_30733 ?auto_30734 ?auto_30735 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_30743 - BLOCK
      ?auto_30744 - BLOCK
      ?auto_30745 - BLOCK
      ?auto_30746 - BLOCK
      ?auto_30747 - BLOCK
      ?auto_30748 - BLOCK
      ?auto_30749 - BLOCK
    )
    :vars
    (
      ?auto_30750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30749 ?auto_30750 ) ( not ( = ?auto_30743 ?auto_30744 ) ) ( not ( = ?auto_30743 ?auto_30745 ) ) ( not ( = ?auto_30743 ?auto_30746 ) ) ( not ( = ?auto_30743 ?auto_30747 ) ) ( not ( = ?auto_30743 ?auto_30748 ) ) ( not ( = ?auto_30743 ?auto_30749 ) ) ( not ( = ?auto_30743 ?auto_30750 ) ) ( not ( = ?auto_30744 ?auto_30745 ) ) ( not ( = ?auto_30744 ?auto_30746 ) ) ( not ( = ?auto_30744 ?auto_30747 ) ) ( not ( = ?auto_30744 ?auto_30748 ) ) ( not ( = ?auto_30744 ?auto_30749 ) ) ( not ( = ?auto_30744 ?auto_30750 ) ) ( not ( = ?auto_30745 ?auto_30746 ) ) ( not ( = ?auto_30745 ?auto_30747 ) ) ( not ( = ?auto_30745 ?auto_30748 ) ) ( not ( = ?auto_30745 ?auto_30749 ) ) ( not ( = ?auto_30745 ?auto_30750 ) ) ( not ( = ?auto_30746 ?auto_30747 ) ) ( not ( = ?auto_30746 ?auto_30748 ) ) ( not ( = ?auto_30746 ?auto_30749 ) ) ( not ( = ?auto_30746 ?auto_30750 ) ) ( not ( = ?auto_30747 ?auto_30748 ) ) ( not ( = ?auto_30747 ?auto_30749 ) ) ( not ( = ?auto_30747 ?auto_30750 ) ) ( not ( = ?auto_30748 ?auto_30749 ) ) ( not ( = ?auto_30748 ?auto_30750 ) ) ( not ( = ?auto_30749 ?auto_30750 ) ) ( ON ?auto_30748 ?auto_30749 ) ( ON ?auto_30747 ?auto_30748 ) ( ON ?auto_30746 ?auto_30747 ) ( ON ?auto_30745 ?auto_30746 ) ( ON ?auto_30744 ?auto_30745 ) ( ON ?auto_30743 ?auto_30744 ) ( CLEAR ?auto_30743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30743 )
      ( MAKE-7PILE ?auto_30743 ?auto_30744 ?auto_30745 ?auto_30746 ?auto_30747 ?auto_30748 ?auto_30749 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_30758 - BLOCK
      ?auto_30759 - BLOCK
      ?auto_30760 - BLOCK
      ?auto_30761 - BLOCK
      ?auto_30762 - BLOCK
      ?auto_30763 - BLOCK
      ?auto_30764 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30764 ) ( not ( = ?auto_30758 ?auto_30759 ) ) ( not ( = ?auto_30758 ?auto_30760 ) ) ( not ( = ?auto_30758 ?auto_30761 ) ) ( not ( = ?auto_30758 ?auto_30762 ) ) ( not ( = ?auto_30758 ?auto_30763 ) ) ( not ( = ?auto_30758 ?auto_30764 ) ) ( not ( = ?auto_30759 ?auto_30760 ) ) ( not ( = ?auto_30759 ?auto_30761 ) ) ( not ( = ?auto_30759 ?auto_30762 ) ) ( not ( = ?auto_30759 ?auto_30763 ) ) ( not ( = ?auto_30759 ?auto_30764 ) ) ( not ( = ?auto_30760 ?auto_30761 ) ) ( not ( = ?auto_30760 ?auto_30762 ) ) ( not ( = ?auto_30760 ?auto_30763 ) ) ( not ( = ?auto_30760 ?auto_30764 ) ) ( not ( = ?auto_30761 ?auto_30762 ) ) ( not ( = ?auto_30761 ?auto_30763 ) ) ( not ( = ?auto_30761 ?auto_30764 ) ) ( not ( = ?auto_30762 ?auto_30763 ) ) ( not ( = ?auto_30762 ?auto_30764 ) ) ( not ( = ?auto_30763 ?auto_30764 ) ) ( ON ?auto_30763 ?auto_30764 ) ( ON ?auto_30762 ?auto_30763 ) ( ON ?auto_30761 ?auto_30762 ) ( ON ?auto_30760 ?auto_30761 ) ( ON ?auto_30759 ?auto_30760 ) ( ON ?auto_30758 ?auto_30759 ) ( CLEAR ?auto_30758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30758 )
      ( MAKE-7PILE ?auto_30758 ?auto_30759 ?auto_30760 ?auto_30761 ?auto_30762 ?auto_30763 ?auto_30764 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_30772 - BLOCK
      ?auto_30773 - BLOCK
      ?auto_30774 - BLOCK
      ?auto_30775 - BLOCK
      ?auto_30776 - BLOCK
      ?auto_30777 - BLOCK
      ?auto_30778 - BLOCK
    )
    :vars
    (
      ?auto_30779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30772 ?auto_30773 ) ) ( not ( = ?auto_30772 ?auto_30774 ) ) ( not ( = ?auto_30772 ?auto_30775 ) ) ( not ( = ?auto_30772 ?auto_30776 ) ) ( not ( = ?auto_30772 ?auto_30777 ) ) ( not ( = ?auto_30772 ?auto_30778 ) ) ( not ( = ?auto_30773 ?auto_30774 ) ) ( not ( = ?auto_30773 ?auto_30775 ) ) ( not ( = ?auto_30773 ?auto_30776 ) ) ( not ( = ?auto_30773 ?auto_30777 ) ) ( not ( = ?auto_30773 ?auto_30778 ) ) ( not ( = ?auto_30774 ?auto_30775 ) ) ( not ( = ?auto_30774 ?auto_30776 ) ) ( not ( = ?auto_30774 ?auto_30777 ) ) ( not ( = ?auto_30774 ?auto_30778 ) ) ( not ( = ?auto_30775 ?auto_30776 ) ) ( not ( = ?auto_30775 ?auto_30777 ) ) ( not ( = ?auto_30775 ?auto_30778 ) ) ( not ( = ?auto_30776 ?auto_30777 ) ) ( not ( = ?auto_30776 ?auto_30778 ) ) ( not ( = ?auto_30777 ?auto_30778 ) ) ( ON ?auto_30772 ?auto_30779 ) ( not ( = ?auto_30778 ?auto_30779 ) ) ( not ( = ?auto_30777 ?auto_30779 ) ) ( not ( = ?auto_30776 ?auto_30779 ) ) ( not ( = ?auto_30775 ?auto_30779 ) ) ( not ( = ?auto_30774 ?auto_30779 ) ) ( not ( = ?auto_30773 ?auto_30779 ) ) ( not ( = ?auto_30772 ?auto_30779 ) ) ( ON ?auto_30773 ?auto_30772 ) ( ON ?auto_30774 ?auto_30773 ) ( ON ?auto_30775 ?auto_30774 ) ( ON ?auto_30776 ?auto_30775 ) ( ON ?auto_30777 ?auto_30776 ) ( ON ?auto_30778 ?auto_30777 ) ( CLEAR ?auto_30778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_30778 ?auto_30777 ?auto_30776 ?auto_30775 ?auto_30774 ?auto_30773 ?auto_30772 )
      ( MAKE-7PILE ?auto_30772 ?auto_30773 ?auto_30774 ?auto_30775 ?auto_30776 ?auto_30777 ?auto_30778 ) )
  )

)

