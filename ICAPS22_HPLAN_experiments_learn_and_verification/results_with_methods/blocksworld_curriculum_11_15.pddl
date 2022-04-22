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
      ?auto_139261 - BLOCK
    )
    :vars
    (
      ?auto_139262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139261 ?auto_139262 ) ( CLEAR ?auto_139261 ) ( HAND-EMPTY ) ( not ( = ?auto_139261 ?auto_139262 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139261 ?auto_139262 )
      ( !PUTDOWN ?auto_139261 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_139264 - BLOCK
    )
    :vars
    (
      ?auto_139265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139264 ?auto_139265 ) ( CLEAR ?auto_139264 ) ( HAND-EMPTY ) ( not ( = ?auto_139264 ?auto_139265 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139264 ?auto_139265 )
      ( !PUTDOWN ?auto_139264 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_139268 - BLOCK
      ?auto_139269 - BLOCK
    )
    :vars
    (
      ?auto_139270 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_139268 ) ( ON ?auto_139269 ?auto_139270 ) ( CLEAR ?auto_139269 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139268 ) ( not ( = ?auto_139268 ?auto_139269 ) ) ( not ( = ?auto_139268 ?auto_139270 ) ) ( not ( = ?auto_139269 ?auto_139270 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139269 ?auto_139270 )
      ( !STACK ?auto_139269 ?auto_139268 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_139273 - BLOCK
      ?auto_139274 - BLOCK
    )
    :vars
    (
      ?auto_139275 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_139273 ) ( ON ?auto_139274 ?auto_139275 ) ( CLEAR ?auto_139274 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139273 ) ( not ( = ?auto_139273 ?auto_139274 ) ) ( not ( = ?auto_139273 ?auto_139275 ) ) ( not ( = ?auto_139274 ?auto_139275 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139274 ?auto_139275 )
      ( !STACK ?auto_139274 ?auto_139273 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_139278 - BLOCK
      ?auto_139279 - BLOCK
    )
    :vars
    (
      ?auto_139280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139279 ?auto_139280 ) ( not ( = ?auto_139278 ?auto_139279 ) ) ( not ( = ?auto_139278 ?auto_139280 ) ) ( not ( = ?auto_139279 ?auto_139280 ) ) ( ON ?auto_139278 ?auto_139279 ) ( CLEAR ?auto_139278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139278 )
      ( MAKE-2PILE ?auto_139278 ?auto_139279 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_139283 - BLOCK
      ?auto_139284 - BLOCK
    )
    :vars
    (
      ?auto_139285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139284 ?auto_139285 ) ( not ( = ?auto_139283 ?auto_139284 ) ) ( not ( = ?auto_139283 ?auto_139285 ) ) ( not ( = ?auto_139284 ?auto_139285 ) ) ( ON ?auto_139283 ?auto_139284 ) ( CLEAR ?auto_139283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139283 )
      ( MAKE-2PILE ?auto_139283 ?auto_139284 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139289 - BLOCK
      ?auto_139290 - BLOCK
      ?auto_139291 - BLOCK
    )
    :vars
    (
      ?auto_139292 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_139290 ) ( ON ?auto_139291 ?auto_139292 ) ( CLEAR ?auto_139291 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139289 ) ( ON ?auto_139290 ?auto_139289 ) ( not ( = ?auto_139289 ?auto_139290 ) ) ( not ( = ?auto_139289 ?auto_139291 ) ) ( not ( = ?auto_139289 ?auto_139292 ) ) ( not ( = ?auto_139290 ?auto_139291 ) ) ( not ( = ?auto_139290 ?auto_139292 ) ) ( not ( = ?auto_139291 ?auto_139292 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139291 ?auto_139292 )
      ( !STACK ?auto_139291 ?auto_139290 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139296 - BLOCK
      ?auto_139297 - BLOCK
      ?auto_139298 - BLOCK
    )
    :vars
    (
      ?auto_139299 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_139297 ) ( ON ?auto_139298 ?auto_139299 ) ( CLEAR ?auto_139298 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139296 ) ( ON ?auto_139297 ?auto_139296 ) ( not ( = ?auto_139296 ?auto_139297 ) ) ( not ( = ?auto_139296 ?auto_139298 ) ) ( not ( = ?auto_139296 ?auto_139299 ) ) ( not ( = ?auto_139297 ?auto_139298 ) ) ( not ( = ?auto_139297 ?auto_139299 ) ) ( not ( = ?auto_139298 ?auto_139299 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139298 ?auto_139299 )
      ( !STACK ?auto_139298 ?auto_139297 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139303 - BLOCK
      ?auto_139304 - BLOCK
      ?auto_139305 - BLOCK
    )
    :vars
    (
      ?auto_139306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139305 ?auto_139306 ) ( ON-TABLE ?auto_139303 ) ( not ( = ?auto_139303 ?auto_139304 ) ) ( not ( = ?auto_139303 ?auto_139305 ) ) ( not ( = ?auto_139303 ?auto_139306 ) ) ( not ( = ?auto_139304 ?auto_139305 ) ) ( not ( = ?auto_139304 ?auto_139306 ) ) ( not ( = ?auto_139305 ?auto_139306 ) ) ( CLEAR ?auto_139303 ) ( ON ?auto_139304 ?auto_139305 ) ( CLEAR ?auto_139304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139303 ?auto_139304 )
      ( MAKE-3PILE ?auto_139303 ?auto_139304 ?auto_139305 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139310 - BLOCK
      ?auto_139311 - BLOCK
      ?auto_139312 - BLOCK
    )
    :vars
    (
      ?auto_139313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139312 ?auto_139313 ) ( ON-TABLE ?auto_139310 ) ( not ( = ?auto_139310 ?auto_139311 ) ) ( not ( = ?auto_139310 ?auto_139312 ) ) ( not ( = ?auto_139310 ?auto_139313 ) ) ( not ( = ?auto_139311 ?auto_139312 ) ) ( not ( = ?auto_139311 ?auto_139313 ) ) ( not ( = ?auto_139312 ?auto_139313 ) ) ( CLEAR ?auto_139310 ) ( ON ?auto_139311 ?auto_139312 ) ( CLEAR ?auto_139311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139310 ?auto_139311 )
      ( MAKE-3PILE ?auto_139310 ?auto_139311 ?auto_139312 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139317 - BLOCK
      ?auto_139318 - BLOCK
      ?auto_139319 - BLOCK
    )
    :vars
    (
      ?auto_139320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139319 ?auto_139320 ) ( not ( = ?auto_139317 ?auto_139318 ) ) ( not ( = ?auto_139317 ?auto_139319 ) ) ( not ( = ?auto_139317 ?auto_139320 ) ) ( not ( = ?auto_139318 ?auto_139319 ) ) ( not ( = ?auto_139318 ?auto_139320 ) ) ( not ( = ?auto_139319 ?auto_139320 ) ) ( ON ?auto_139318 ?auto_139319 ) ( ON ?auto_139317 ?auto_139318 ) ( CLEAR ?auto_139317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139317 )
      ( MAKE-3PILE ?auto_139317 ?auto_139318 ?auto_139319 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139324 - BLOCK
      ?auto_139325 - BLOCK
      ?auto_139326 - BLOCK
    )
    :vars
    (
      ?auto_139327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139326 ?auto_139327 ) ( not ( = ?auto_139324 ?auto_139325 ) ) ( not ( = ?auto_139324 ?auto_139326 ) ) ( not ( = ?auto_139324 ?auto_139327 ) ) ( not ( = ?auto_139325 ?auto_139326 ) ) ( not ( = ?auto_139325 ?auto_139327 ) ) ( not ( = ?auto_139326 ?auto_139327 ) ) ( ON ?auto_139325 ?auto_139326 ) ( ON ?auto_139324 ?auto_139325 ) ( CLEAR ?auto_139324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139324 )
      ( MAKE-3PILE ?auto_139324 ?auto_139325 ?auto_139326 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139332 - BLOCK
      ?auto_139333 - BLOCK
      ?auto_139334 - BLOCK
      ?auto_139335 - BLOCK
    )
    :vars
    (
      ?auto_139336 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_139334 ) ( ON ?auto_139335 ?auto_139336 ) ( CLEAR ?auto_139335 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139332 ) ( ON ?auto_139333 ?auto_139332 ) ( ON ?auto_139334 ?auto_139333 ) ( not ( = ?auto_139332 ?auto_139333 ) ) ( not ( = ?auto_139332 ?auto_139334 ) ) ( not ( = ?auto_139332 ?auto_139335 ) ) ( not ( = ?auto_139332 ?auto_139336 ) ) ( not ( = ?auto_139333 ?auto_139334 ) ) ( not ( = ?auto_139333 ?auto_139335 ) ) ( not ( = ?auto_139333 ?auto_139336 ) ) ( not ( = ?auto_139334 ?auto_139335 ) ) ( not ( = ?auto_139334 ?auto_139336 ) ) ( not ( = ?auto_139335 ?auto_139336 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139335 ?auto_139336 )
      ( !STACK ?auto_139335 ?auto_139334 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139341 - BLOCK
      ?auto_139342 - BLOCK
      ?auto_139343 - BLOCK
      ?auto_139344 - BLOCK
    )
    :vars
    (
      ?auto_139345 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_139343 ) ( ON ?auto_139344 ?auto_139345 ) ( CLEAR ?auto_139344 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139341 ) ( ON ?auto_139342 ?auto_139341 ) ( ON ?auto_139343 ?auto_139342 ) ( not ( = ?auto_139341 ?auto_139342 ) ) ( not ( = ?auto_139341 ?auto_139343 ) ) ( not ( = ?auto_139341 ?auto_139344 ) ) ( not ( = ?auto_139341 ?auto_139345 ) ) ( not ( = ?auto_139342 ?auto_139343 ) ) ( not ( = ?auto_139342 ?auto_139344 ) ) ( not ( = ?auto_139342 ?auto_139345 ) ) ( not ( = ?auto_139343 ?auto_139344 ) ) ( not ( = ?auto_139343 ?auto_139345 ) ) ( not ( = ?auto_139344 ?auto_139345 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139344 ?auto_139345 )
      ( !STACK ?auto_139344 ?auto_139343 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139350 - BLOCK
      ?auto_139351 - BLOCK
      ?auto_139352 - BLOCK
      ?auto_139353 - BLOCK
    )
    :vars
    (
      ?auto_139354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139353 ?auto_139354 ) ( ON-TABLE ?auto_139350 ) ( ON ?auto_139351 ?auto_139350 ) ( not ( = ?auto_139350 ?auto_139351 ) ) ( not ( = ?auto_139350 ?auto_139352 ) ) ( not ( = ?auto_139350 ?auto_139353 ) ) ( not ( = ?auto_139350 ?auto_139354 ) ) ( not ( = ?auto_139351 ?auto_139352 ) ) ( not ( = ?auto_139351 ?auto_139353 ) ) ( not ( = ?auto_139351 ?auto_139354 ) ) ( not ( = ?auto_139352 ?auto_139353 ) ) ( not ( = ?auto_139352 ?auto_139354 ) ) ( not ( = ?auto_139353 ?auto_139354 ) ) ( CLEAR ?auto_139351 ) ( ON ?auto_139352 ?auto_139353 ) ( CLEAR ?auto_139352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139350 ?auto_139351 ?auto_139352 )
      ( MAKE-4PILE ?auto_139350 ?auto_139351 ?auto_139352 ?auto_139353 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139359 - BLOCK
      ?auto_139360 - BLOCK
      ?auto_139361 - BLOCK
      ?auto_139362 - BLOCK
    )
    :vars
    (
      ?auto_139363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139362 ?auto_139363 ) ( ON-TABLE ?auto_139359 ) ( ON ?auto_139360 ?auto_139359 ) ( not ( = ?auto_139359 ?auto_139360 ) ) ( not ( = ?auto_139359 ?auto_139361 ) ) ( not ( = ?auto_139359 ?auto_139362 ) ) ( not ( = ?auto_139359 ?auto_139363 ) ) ( not ( = ?auto_139360 ?auto_139361 ) ) ( not ( = ?auto_139360 ?auto_139362 ) ) ( not ( = ?auto_139360 ?auto_139363 ) ) ( not ( = ?auto_139361 ?auto_139362 ) ) ( not ( = ?auto_139361 ?auto_139363 ) ) ( not ( = ?auto_139362 ?auto_139363 ) ) ( CLEAR ?auto_139360 ) ( ON ?auto_139361 ?auto_139362 ) ( CLEAR ?auto_139361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139359 ?auto_139360 ?auto_139361 )
      ( MAKE-4PILE ?auto_139359 ?auto_139360 ?auto_139361 ?auto_139362 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139368 - BLOCK
      ?auto_139369 - BLOCK
      ?auto_139370 - BLOCK
      ?auto_139371 - BLOCK
    )
    :vars
    (
      ?auto_139372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139371 ?auto_139372 ) ( ON-TABLE ?auto_139368 ) ( not ( = ?auto_139368 ?auto_139369 ) ) ( not ( = ?auto_139368 ?auto_139370 ) ) ( not ( = ?auto_139368 ?auto_139371 ) ) ( not ( = ?auto_139368 ?auto_139372 ) ) ( not ( = ?auto_139369 ?auto_139370 ) ) ( not ( = ?auto_139369 ?auto_139371 ) ) ( not ( = ?auto_139369 ?auto_139372 ) ) ( not ( = ?auto_139370 ?auto_139371 ) ) ( not ( = ?auto_139370 ?auto_139372 ) ) ( not ( = ?auto_139371 ?auto_139372 ) ) ( ON ?auto_139370 ?auto_139371 ) ( CLEAR ?auto_139368 ) ( ON ?auto_139369 ?auto_139370 ) ( CLEAR ?auto_139369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139368 ?auto_139369 )
      ( MAKE-4PILE ?auto_139368 ?auto_139369 ?auto_139370 ?auto_139371 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139377 - BLOCK
      ?auto_139378 - BLOCK
      ?auto_139379 - BLOCK
      ?auto_139380 - BLOCK
    )
    :vars
    (
      ?auto_139381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139380 ?auto_139381 ) ( ON-TABLE ?auto_139377 ) ( not ( = ?auto_139377 ?auto_139378 ) ) ( not ( = ?auto_139377 ?auto_139379 ) ) ( not ( = ?auto_139377 ?auto_139380 ) ) ( not ( = ?auto_139377 ?auto_139381 ) ) ( not ( = ?auto_139378 ?auto_139379 ) ) ( not ( = ?auto_139378 ?auto_139380 ) ) ( not ( = ?auto_139378 ?auto_139381 ) ) ( not ( = ?auto_139379 ?auto_139380 ) ) ( not ( = ?auto_139379 ?auto_139381 ) ) ( not ( = ?auto_139380 ?auto_139381 ) ) ( ON ?auto_139379 ?auto_139380 ) ( CLEAR ?auto_139377 ) ( ON ?auto_139378 ?auto_139379 ) ( CLEAR ?auto_139378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139377 ?auto_139378 )
      ( MAKE-4PILE ?auto_139377 ?auto_139378 ?auto_139379 ?auto_139380 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139386 - BLOCK
      ?auto_139387 - BLOCK
      ?auto_139388 - BLOCK
      ?auto_139389 - BLOCK
    )
    :vars
    (
      ?auto_139390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139389 ?auto_139390 ) ( not ( = ?auto_139386 ?auto_139387 ) ) ( not ( = ?auto_139386 ?auto_139388 ) ) ( not ( = ?auto_139386 ?auto_139389 ) ) ( not ( = ?auto_139386 ?auto_139390 ) ) ( not ( = ?auto_139387 ?auto_139388 ) ) ( not ( = ?auto_139387 ?auto_139389 ) ) ( not ( = ?auto_139387 ?auto_139390 ) ) ( not ( = ?auto_139388 ?auto_139389 ) ) ( not ( = ?auto_139388 ?auto_139390 ) ) ( not ( = ?auto_139389 ?auto_139390 ) ) ( ON ?auto_139388 ?auto_139389 ) ( ON ?auto_139387 ?auto_139388 ) ( ON ?auto_139386 ?auto_139387 ) ( CLEAR ?auto_139386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139386 )
      ( MAKE-4PILE ?auto_139386 ?auto_139387 ?auto_139388 ?auto_139389 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139395 - BLOCK
      ?auto_139396 - BLOCK
      ?auto_139397 - BLOCK
      ?auto_139398 - BLOCK
    )
    :vars
    (
      ?auto_139399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139398 ?auto_139399 ) ( not ( = ?auto_139395 ?auto_139396 ) ) ( not ( = ?auto_139395 ?auto_139397 ) ) ( not ( = ?auto_139395 ?auto_139398 ) ) ( not ( = ?auto_139395 ?auto_139399 ) ) ( not ( = ?auto_139396 ?auto_139397 ) ) ( not ( = ?auto_139396 ?auto_139398 ) ) ( not ( = ?auto_139396 ?auto_139399 ) ) ( not ( = ?auto_139397 ?auto_139398 ) ) ( not ( = ?auto_139397 ?auto_139399 ) ) ( not ( = ?auto_139398 ?auto_139399 ) ) ( ON ?auto_139397 ?auto_139398 ) ( ON ?auto_139396 ?auto_139397 ) ( ON ?auto_139395 ?auto_139396 ) ( CLEAR ?auto_139395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139395 )
      ( MAKE-4PILE ?auto_139395 ?auto_139396 ?auto_139397 ?auto_139398 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139405 - BLOCK
      ?auto_139406 - BLOCK
      ?auto_139407 - BLOCK
      ?auto_139408 - BLOCK
      ?auto_139409 - BLOCK
    )
    :vars
    (
      ?auto_139410 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_139408 ) ( ON ?auto_139409 ?auto_139410 ) ( CLEAR ?auto_139409 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139405 ) ( ON ?auto_139406 ?auto_139405 ) ( ON ?auto_139407 ?auto_139406 ) ( ON ?auto_139408 ?auto_139407 ) ( not ( = ?auto_139405 ?auto_139406 ) ) ( not ( = ?auto_139405 ?auto_139407 ) ) ( not ( = ?auto_139405 ?auto_139408 ) ) ( not ( = ?auto_139405 ?auto_139409 ) ) ( not ( = ?auto_139405 ?auto_139410 ) ) ( not ( = ?auto_139406 ?auto_139407 ) ) ( not ( = ?auto_139406 ?auto_139408 ) ) ( not ( = ?auto_139406 ?auto_139409 ) ) ( not ( = ?auto_139406 ?auto_139410 ) ) ( not ( = ?auto_139407 ?auto_139408 ) ) ( not ( = ?auto_139407 ?auto_139409 ) ) ( not ( = ?auto_139407 ?auto_139410 ) ) ( not ( = ?auto_139408 ?auto_139409 ) ) ( not ( = ?auto_139408 ?auto_139410 ) ) ( not ( = ?auto_139409 ?auto_139410 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139409 ?auto_139410 )
      ( !STACK ?auto_139409 ?auto_139408 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139416 - BLOCK
      ?auto_139417 - BLOCK
      ?auto_139418 - BLOCK
      ?auto_139419 - BLOCK
      ?auto_139420 - BLOCK
    )
    :vars
    (
      ?auto_139421 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_139419 ) ( ON ?auto_139420 ?auto_139421 ) ( CLEAR ?auto_139420 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139416 ) ( ON ?auto_139417 ?auto_139416 ) ( ON ?auto_139418 ?auto_139417 ) ( ON ?auto_139419 ?auto_139418 ) ( not ( = ?auto_139416 ?auto_139417 ) ) ( not ( = ?auto_139416 ?auto_139418 ) ) ( not ( = ?auto_139416 ?auto_139419 ) ) ( not ( = ?auto_139416 ?auto_139420 ) ) ( not ( = ?auto_139416 ?auto_139421 ) ) ( not ( = ?auto_139417 ?auto_139418 ) ) ( not ( = ?auto_139417 ?auto_139419 ) ) ( not ( = ?auto_139417 ?auto_139420 ) ) ( not ( = ?auto_139417 ?auto_139421 ) ) ( not ( = ?auto_139418 ?auto_139419 ) ) ( not ( = ?auto_139418 ?auto_139420 ) ) ( not ( = ?auto_139418 ?auto_139421 ) ) ( not ( = ?auto_139419 ?auto_139420 ) ) ( not ( = ?auto_139419 ?auto_139421 ) ) ( not ( = ?auto_139420 ?auto_139421 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139420 ?auto_139421 )
      ( !STACK ?auto_139420 ?auto_139419 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139427 - BLOCK
      ?auto_139428 - BLOCK
      ?auto_139429 - BLOCK
      ?auto_139430 - BLOCK
      ?auto_139431 - BLOCK
    )
    :vars
    (
      ?auto_139432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139431 ?auto_139432 ) ( ON-TABLE ?auto_139427 ) ( ON ?auto_139428 ?auto_139427 ) ( ON ?auto_139429 ?auto_139428 ) ( not ( = ?auto_139427 ?auto_139428 ) ) ( not ( = ?auto_139427 ?auto_139429 ) ) ( not ( = ?auto_139427 ?auto_139430 ) ) ( not ( = ?auto_139427 ?auto_139431 ) ) ( not ( = ?auto_139427 ?auto_139432 ) ) ( not ( = ?auto_139428 ?auto_139429 ) ) ( not ( = ?auto_139428 ?auto_139430 ) ) ( not ( = ?auto_139428 ?auto_139431 ) ) ( not ( = ?auto_139428 ?auto_139432 ) ) ( not ( = ?auto_139429 ?auto_139430 ) ) ( not ( = ?auto_139429 ?auto_139431 ) ) ( not ( = ?auto_139429 ?auto_139432 ) ) ( not ( = ?auto_139430 ?auto_139431 ) ) ( not ( = ?auto_139430 ?auto_139432 ) ) ( not ( = ?auto_139431 ?auto_139432 ) ) ( CLEAR ?auto_139429 ) ( ON ?auto_139430 ?auto_139431 ) ( CLEAR ?auto_139430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139427 ?auto_139428 ?auto_139429 ?auto_139430 )
      ( MAKE-5PILE ?auto_139427 ?auto_139428 ?auto_139429 ?auto_139430 ?auto_139431 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139438 - BLOCK
      ?auto_139439 - BLOCK
      ?auto_139440 - BLOCK
      ?auto_139441 - BLOCK
      ?auto_139442 - BLOCK
    )
    :vars
    (
      ?auto_139443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139442 ?auto_139443 ) ( ON-TABLE ?auto_139438 ) ( ON ?auto_139439 ?auto_139438 ) ( ON ?auto_139440 ?auto_139439 ) ( not ( = ?auto_139438 ?auto_139439 ) ) ( not ( = ?auto_139438 ?auto_139440 ) ) ( not ( = ?auto_139438 ?auto_139441 ) ) ( not ( = ?auto_139438 ?auto_139442 ) ) ( not ( = ?auto_139438 ?auto_139443 ) ) ( not ( = ?auto_139439 ?auto_139440 ) ) ( not ( = ?auto_139439 ?auto_139441 ) ) ( not ( = ?auto_139439 ?auto_139442 ) ) ( not ( = ?auto_139439 ?auto_139443 ) ) ( not ( = ?auto_139440 ?auto_139441 ) ) ( not ( = ?auto_139440 ?auto_139442 ) ) ( not ( = ?auto_139440 ?auto_139443 ) ) ( not ( = ?auto_139441 ?auto_139442 ) ) ( not ( = ?auto_139441 ?auto_139443 ) ) ( not ( = ?auto_139442 ?auto_139443 ) ) ( CLEAR ?auto_139440 ) ( ON ?auto_139441 ?auto_139442 ) ( CLEAR ?auto_139441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139438 ?auto_139439 ?auto_139440 ?auto_139441 )
      ( MAKE-5PILE ?auto_139438 ?auto_139439 ?auto_139440 ?auto_139441 ?auto_139442 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139449 - BLOCK
      ?auto_139450 - BLOCK
      ?auto_139451 - BLOCK
      ?auto_139452 - BLOCK
      ?auto_139453 - BLOCK
    )
    :vars
    (
      ?auto_139454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139453 ?auto_139454 ) ( ON-TABLE ?auto_139449 ) ( ON ?auto_139450 ?auto_139449 ) ( not ( = ?auto_139449 ?auto_139450 ) ) ( not ( = ?auto_139449 ?auto_139451 ) ) ( not ( = ?auto_139449 ?auto_139452 ) ) ( not ( = ?auto_139449 ?auto_139453 ) ) ( not ( = ?auto_139449 ?auto_139454 ) ) ( not ( = ?auto_139450 ?auto_139451 ) ) ( not ( = ?auto_139450 ?auto_139452 ) ) ( not ( = ?auto_139450 ?auto_139453 ) ) ( not ( = ?auto_139450 ?auto_139454 ) ) ( not ( = ?auto_139451 ?auto_139452 ) ) ( not ( = ?auto_139451 ?auto_139453 ) ) ( not ( = ?auto_139451 ?auto_139454 ) ) ( not ( = ?auto_139452 ?auto_139453 ) ) ( not ( = ?auto_139452 ?auto_139454 ) ) ( not ( = ?auto_139453 ?auto_139454 ) ) ( ON ?auto_139452 ?auto_139453 ) ( CLEAR ?auto_139450 ) ( ON ?auto_139451 ?auto_139452 ) ( CLEAR ?auto_139451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139449 ?auto_139450 ?auto_139451 )
      ( MAKE-5PILE ?auto_139449 ?auto_139450 ?auto_139451 ?auto_139452 ?auto_139453 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139460 - BLOCK
      ?auto_139461 - BLOCK
      ?auto_139462 - BLOCK
      ?auto_139463 - BLOCK
      ?auto_139464 - BLOCK
    )
    :vars
    (
      ?auto_139465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139464 ?auto_139465 ) ( ON-TABLE ?auto_139460 ) ( ON ?auto_139461 ?auto_139460 ) ( not ( = ?auto_139460 ?auto_139461 ) ) ( not ( = ?auto_139460 ?auto_139462 ) ) ( not ( = ?auto_139460 ?auto_139463 ) ) ( not ( = ?auto_139460 ?auto_139464 ) ) ( not ( = ?auto_139460 ?auto_139465 ) ) ( not ( = ?auto_139461 ?auto_139462 ) ) ( not ( = ?auto_139461 ?auto_139463 ) ) ( not ( = ?auto_139461 ?auto_139464 ) ) ( not ( = ?auto_139461 ?auto_139465 ) ) ( not ( = ?auto_139462 ?auto_139463 ) ) ( not ( = ?auto_139462 ?auto_139464 ) ) ( not ( = ?auto_139462 ?auto_139465 ) ) ( not ( = ?auto_139463 ?auto_139464 ) ) ( not ( = ?auto_139463 ?auto_139465 ) ) ( not ( = ?auto_139464 ?auto_139465 ) ) ( ON ?auto_139463 ?auto_139464 ) ( CLEAR ?auto_139461 ) ( ON ?auto_139462 ?auto_139463 ) ( CLEAR ?auto_139462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139460 ?auto_139461 ?auto_139462 )
      ( MAKE-5PILE ?auto_139460 ?auto_139461 ?auto_139462 ?auto_139463 ?auto_139464 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139471 - BLOCK
      ?auto_139472 - BLOCK
      ?auto_139473 - BLOCK
      ?auto_139474 - BLOCK
      ?auto_139475 - BLOCK
    )
    :vars
    (
      ?auto_139476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139475 ?auto_139476 ) ( ON-TABLE ?auto_139471 ) ( not ( = ?auto_139471 ?auto_139472 ) ) ( not ( = ?auto_139471 ?auto_139473 ) ) ( not ( = ?auto_139471 ?auto_139474 ) ) ( not ( = ?auto_139471 ?auto_139475 ) ) ( not ( = ?auto_139471 ?auto_139476 ) ) ( not ( = ?auto_139472 ?auto_139473 ) ) ( not ( = ?auto_139472 ?auto_139474 ) ) ( not ( = ?auto_139472 ?auto_139475 ) ) ( not ( = ?auto_139472 ?auto_139476 ) ) ( not ( = ?auto_139473 ?auto_139474 ) ) ( not ( = ?auto_139473 ?auto_139475 ) ) ( not ( = ?auto_139473 ?auto_139476 ) ) ( not ( = ?auto_139474 ?auto_139475 ) ) ( not ( = ?auto_139474 ?auto_139476 ) ) ( not ( = ?auto_139475 ?auto_139476 ) ) ( ON ?auto_139474 ?auto_139475 ) ( ON ?auto_139473 ?auto_139474 ) ( CLEAR ?auto_139471 ) ( ON ?auto_139472 ?auto_139473 ) ( CLEAR ?auto_139472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139471 ?auto_139472 )
      ( MAKE-5PILE ?auto_139471 ?auto_139472 ?auto_139473 ?auto_139474 ?auto_139475 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139482 - BLOCK
      ?auto_139483 - BLOCK
      ?auto_139484 - BLOCK
      ?auto_139485 - BLOCK
      ?auto_139486 - BLOCK
    )
    :vars
    (
      ?auto_139487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139486 ?auto_139487 ) ( ON-TABLE ?auto_139482 ) ( not ( = ?auto_139482 ?auto_139483 ) ) ( not ( = ?auto_139482 ?auto_139484 ) ) ( not ( = ?auto_139482 ?auto_139485 ) ) ( not ( = ?auto_139482 ?auto_139486 ) ) ( not ( = ?auto_139482 ?auto_139487 ) ) ( not ( = ?auto_139483 ?auto_139484 ) ) ( not ( = ?auto_139483 ?auto_139485 ) ) ( not ( = ?auto_139483 ?auto_139486 ) ) ( not ( = ?auto_139483 ?auto_139487 ) ) ( not ( = ?auto_139484 ?auto_139485 ) ) ( not ( = ?auto_139484 ?auto_139486 ) ) ( not ( = ?auto_139484 ?auto_139487 ) ) ( not ( = ?auto_139485 ?auto_139486 ) ) ( not ( = ?auto_139485 ?auto_139487 ) ) ( not ( = ?auto_139486 ?auto_139487 ) ) ( ON ?auto_139485 ?auto_139486 ) ( ON ?auto_139484 ?auto_139485 ) ( CLEAR ?auto_139482 ) ( ON ?auto_139483 ?auto_139484 ) ( CLEAR ?auto_139483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139482 ?auto_139483 )
      ( MAKE-5PILE ?auto_139482 ?auto_139483 ?auto_139484 ?auto_139485 ?auto_139486 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139493 - BLOCK
      ?auto_139494 - BLOCK
      ?auto_139495 - BLOCK
      ?auto_139496 - BLOCK
      ?auto_139497 - BLOCK
    )
    :vars
    (
      ?auto_139498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139497 ?auto_139498 ) ( not ( = ?auto_139493 ?auto_139494 ) ) ( not ( = ?auto_139493 ?auto_139495 ) ) ( not ( = ?auto_139493 ?auto_139496 ) ) ( not ( = ?auto_139493 ?auto_139497 ) ) ( not ( = ?auto_139493 ?auto_139498 ) ) ( not ( = ?auto_139494 ?auto_139495 ) ) ( not ( = ?auto_139494 ?auto_139496 ) ) ( not ( = ?auto_139494 ?auto_139497 ) ) ( not ( = ?auto_139494 ?auto_139498 ) ) ( not ( = ?auto_139495 ?auto_139496 ) ) ( not ( = ?auto_139495 ?auto_139497 ) ) ( not ( = ?auto_139495 ?auto_139498 ) ) ( not ( = ?auto_139496 ?auto_139497 ) ) ( not ( = ?auto_139496 ?auto_139498 ) ) ( not ( = ?auto_139497 ?auto_139498 ) ) ( ON ?auto_139496 ?auto_139497 ) ( ON ?auto_139495 ?auto_139496 ) ( ON ?auto_139494 ?auto_139495 ) ( ON ?auto_139493 ?auto_139494 ) ( CLEAR ?auto_139493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139493 )
      ( MAKE-5PILE ?auto_139493 ?auto_139494 ?auto_139495 ?auto_139496 ?auto_139497 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139504 - BLOCK
      ?auto_139505 - BLOCK
      ?auto_139506 - BLOCK
      ?auto_139507 - BLOCK
      ?auto_139508 - BLOCK
    )
    :vars
    (
      ?auto_139509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139508 ?auto_139509 ) ( not ( = ?auto_139504 ?auto_139505 ) ) ( not ( = ?auto_139504 ?auto_139506 ) ) ( not ( = ?auto_139504 ?auto_139507 ) ) ( not ( = ?auto_139504 ?auto_139508 ) ) ( not ( = ?auto_139504 ?auto_139509 ) ) ( not ( = ?auto_139505 ?auto_139506 ) ) ( not ( = ?auto_139505 ?auto_139507 ) ) ( not ( = ?auto_139505 ?auto_139508 ) ) ( not ( = ?auto_139505 ?auto_139509 ) ) ( not ( = ?auto_139506 ?auto_139507 ) ) ( not ( = ?auto_139506 ?auto_139508 ) ) ( not ( = ?auto_139506 ?auto_139509 ) ) ( not ( = ?auto_139507 ?auto_139508 ) ) ( not ( = ?auto_139507 ?auto_139509 ) ) ( not ( = ?auto_139508 ?auto_139509 ) ) ( ON ?auto_139507 ?auto_139508 ) ( ON ?auto_139506 ?auto_139507 ) ( ON ?auto_139505 ?auto_139506 ) ( ON ?auto_139504 ?auto_139505 ) ( CLEAR ?auto_139504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139504 )
      ( MAKE-5PILE ?auto_139504 ?auto_139505 ?auto_139506 ?auto_139507 ?auto_139508 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_139516 - BLOCK
      ?auto_139517 - BLOCK
      ?auto_139518 - BLOCK
      ?auto_139519 - BLOCK
      ?auto_139520 - BLOCK
      ?auto_139521 - BLOCK
    )
    :vars
    (
      ?auto_139522 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_139520 ) ( ON ?auto_139521 ?auto_139522 ) ( CLEAR ?auto_139521 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139516 ) ( ON ?auto_139517 ?auto_139516 ) ( ON ?auto_139518 ?auto_139517 ) ( ON ?auto_139519 ?auto_139518 ) ( ON ?auto_139520 ?auto_139519 ) ( not ( = ?auto_139516 ?auto_139517 ) ) ( not ( = ?auto_139516 ?auto_139518 ) ) ( not ( = ?auto_139516 ?auto_139519 ) ) ( not ( = ?auto_139516 ?auto_139520 ) ) ( not ( = ?auto_139516 ?auto_139521 ) ) ( not ( = ?auto_139516 ?auto_139522 ) ) ( not ( = ?auto_139517 ?auto_139518 ) ) ( not ( = ?auto_139517 ?auto_139519 ) ) ( not ( = ?auto_139517 ?auto_139520 ) ) ( not ( = ?auto_139517 ?auto_139521 ) ) ( not ( = ?auto_139517 ?auto_139522 ) ) ( not ( = ?auto_139518 ?auto_139519 ) ) ( not ( = ?auto_139518 ?auto_139520 ) ) ( not ( = ?auto_139518 ?auto_139521 ) ) ( not ( = ?auto_139518 ?auto_139522 ) ) ( not ( = ?auto_139519 ?auto_139520 ) ) ( not ( = ?auto_139519 ?auto_139521 ) ) ( not ( = ?auto_139519 ?auto_139522 ) ) ( not ( = ?auto_139520 ?auto_139521 ) ) ( not ( = ?auto_139520 ?auto_139522 ) ) ( not ( = ?auto_139521 ?auto_139522 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139521 ?auto_139522 )
      ( !STACK ?auto_139521 ?auto_139520 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_139529 - BLOCK
      ?auto_139530 - BLOCK
      ?auto_139531 - BLOCK
      ?auto_139532 - BLOCK
      ?auto_139533 - BLOCK
      ?auto_139534 - BLOCK
    )
    :vars
    (
      ?auto_139535 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_139533 ) ( ON ?auto_139534 ?auto_139535 ) ( CLEAR ?auto_139534 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139529 ) ( ON ?auto_139530 ?auto_139529 ) ( ON ?auto_139531 ?auto_139530 ) ( ON ?auto_139532 ?auto_139531 ) ( ON ?auto_139533 ?auto_139532 ) ( not ( = ?auto_139529 ?auto_139530 ) ) ( not ( = ?auto_139529 ?auto_139531 ) ) ( not ( = ?auto_139529 ?auto_139532 ) ) ( not ( = ?auto_139529 ?auto_139533 ) ) ( not ( = ?auto_139529 ?auto_139534 ) ) ( not ( = ?auto_139529 ?auto_139535 ) ) ( not ( = ?auto_139530 ?auto_139531 ) ) ( not ( = ?auto_139530 ?auto_139532 ) ) ( not ( = ?auto_139530 ?auto_139533 ) ) ( not ( = ?auto_139530 ?auto_139534 ) ) ( not ( = ?auto_139530 ?auto_139535 ) ) ( not ( = ?auto_139531 ?auto_139532 ) ) ( not ( = ?auto_139531 ?auto_139533 ) ) ( not ( = ?auto_139531 ?auto_139534 ) ) ( not ( = ?auto_139531 ?auto_139535 ) ) ( not ( = ?auto_139532 ?auto_139533 ) ) ( not ( = ?auto_139532 ?auto_139534 ) ) ( not ( = ?auto_139532 ?auto_139535 ) ) ( not ( = ?auto_139533 ?auto_139534 ) ) ( not ( = ?auto_139533 ?auto_139535 ) ) ( not ( = ?auto_139534 ?auto_139535 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139534 ?auto_139535 )
      ( !STACK ?auto_139534 ?auto_139533 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_139542 - BLOCK
      ?auto_139543 - BLOCK
      ?auto_139544 - BLOCK
      ?auto_139545 - BLOCK
      ?auto_139546 - BLOCK
      ?auto_139547 - BLOCK
    )
    :vars
    (
      ?auto_139548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139547 ?auto_139548 ) ( ON-TABLE ?auto_139542 ) ( ON ?auto_139543 ?auto_139542 ) ( ON ?auto_139544 ?auto_139543 ) ( ON ?auto_139545 ?auto_139544 ) ( not ( = ?auto_139542 ?auto_139543 ) ) ( not ( = ?auto_139542 ?auto_139544 ) ) ( not ( = ?auto_139542 ?auto_139545 ) ) ( not ( = ?auto_139542 ?auto_139546 ) ) ( not ( = ?auto_139542 ?auto_139547 ) ) ( not ( = ?auto_139542 ?auto_139548 ) ) ( not ( = ?auto_139543 ?auto_139544 ) ) ( not ( = ?auto_139543 ?auto_139545 ) ) ( not ( = ?auto_139543 ?auto_139546 ) ) ( not ( = ?auto_139543 ?auto_139547 ) ) ( not ( = ?auto_139543 ?auto_139548 ) ) ( not ( = ?auto_139544 ?auto_139545 ) ) ( not ( = ?auto_139544 ?auto_139546 ) ) ( not ( = ?auto_139544 ?auto_139547 ) ) ( not ( = ?auto_139544 ?auto_139548 ) ) ( not ( = ?auto_139545 ?auto_139546 ) ) ( not ( = ?auto_139545 ?auto_139547 ) ) ( not ( = ?auto_139545 ?auto_139548 ) ) ( not ( = ?auto_139546 ?auto_139547 ) ) ( not ( = ?auto_139546 ?auto_139548 ) ) ( not ( = ?auto_139547 ?auto_139548 ) ) ( CLEAR ?auto_139545 ) ( ON ?auto_139546 ?auto_139547 ) ( CLEAR ?auto_139546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139542 ?auto_139543 ?auto_139544 ?auto_139545 ?auto_139546 )
      ( MAKE-6PILE ?auto_139542 ?auto_139543 ?auto_139544 ?auto_139545 ?auto_139546 ?auto_139547 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_139555 - BLOCK
      ?auto_139556 - BLOCK
      ?auto_139557 - BLOCK
      ?auto_139558 - BLOCK
      ?auto_139559 - BLOCK
      ?auto_139560 - BLOCK
    )
    :vars
    (
      ?auto_139561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139560 ?auto_139561 ) ( ON-TABLE ?auto_139555 ) ( ON ?auto_139556 ?auto_139555 ) ( ON ?auto_139557 ?auto_139556 ) ( ON ?auto_139558 ?auto_139557 ) ( not ( = ?auto_139555 ?auto_139556 ) ) ( not ( = ?auto_139555 ?auto_139557 ) ) ( not ( = ?auto_139555 ?auto_139558 ) ) ( not ( = ?auto_139555 ?auto_139559 ) ) ( not ( = ?auto_139555 ?auto_139560 ) ) ( not ( = ?auto_139555 ?auto_139561 ) ) ( not ( = ?auto_139556 ?auto_139557 ) ) ( not ( = ?auto_139556 ?auto_139558 ) ) ( not ( = ?auto_139556 ?auto_139559 ) ) ( not ( = ?auto_139556 ?auto_139560 ) ) ( not ( = ?auto_139556 ?auto_139561 ) ) ( not ( = ?auto_139557 ?auto_139558 ) ) ( not ( = ?auto_139557 ?auto_139559 ) ) ( not ( = ?auto_139557 ?auto_139560 ) ) ( not ( = ?auto_139557 ?auto_139561 ) ) ( not ( = ?auto_139558 ?auto_139559 ) ) ( not ( = ?auto_139558 ?auto_139560 ) ) ( not ( = ?auto_139558 ?auto_139561 ) ) ( not ( = ?auto_139559 ?auto_139560 ) ) ( not ( = ?auto_139559 ?auto_139561 ) ) ( not ( = ?auto_139560 ?auto_139561 ) ) ( CLEAR ?auto_139558 ) ( ON ?auto_139559 ?auto_139560 ) ( CLEAR ?auto_139559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139555 ?auto_139556 ?auto_139557 ?auto_139558 ?auto_139559 )
      ( MAKE-6PILE ?auto_139555 ?auto_139556 ?auto_139557 ?auto_139558 ?auto_139559 ?auto_139560 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_139568 - BLOCK
      ?auto_139569 - BLOCK
      ?auto_139570 - BLOCK
      ?auto_139571 - BLOCK
      ?auto_139572 - BLOCK
      ?auto_139573 - BLOCK
    )
    :vars
    (
      ?auto_139574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139573 ?auto_139574 ) ( ON-TABLE ?auto_139568 ) ( ON ?auto_139569 ?auto_139568 ) ( ON ?auto_139570 ?auto_139569 ) ( not ( = ?auto_139568 ?auto_139569 ) ) ( not ( = ?auto_139568 ?auto_139570 ) ) ( not ( = ?auto_139568 ?auto_139571 ) ) ( not ( = ?auto_139568 ?auto_139572 ) ) ( not ( = ?auto_139568 ?auto_139573 ) ) ( not ( = ?auto_139568 ?auto_139574 ) ) ( not ( = ?auto_139569 ?auto_139570 ) ) ( not ( = ?auto_139569 ?auto_139571 ) ) ( not ( = ?auto_139569 ?auto_139572 ) ) ( not ( = ?auto_139569 ?auto_139573 ) ) ( not ( = ?auto_139569 ?auto_139574 ) ) ( not ( = ?auto_139570 ?auto_139571 ) ) ( not ( = ?auto_139570 ?auto_139572 ) ) ( not ( = ?auto_139570 ?auto_139573 ) ) ( not ( = ?auto_139570 ?auto_139574 ) ) ( not ( = ?auto_139571 ?auto_139572 ) ) ( not ( = ?auto_139571 ?auto_139573 ) ) ( not ( = ?auto_139571 ?auto_139574 ) ) ( not ( = ?auto_139572 ?auto_139573 ) ) ( not ( = ?auto_139572 ?auto_139574 ) ) ( not ( = ?auto_139573 ?auto_139574 ) ) ( ON ?auto_139572 ?auto_139573 ) ( CLEAR ?auto_139570 ) ( ON ?auto_139571 ?auto_139572 ) ( CLEAR ?auto_139571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139568 ?auto_139569 ?auto_139570 ?auto_139571 )
      ( MAKE-6PILE ?auto_139568 ?auto_139569 ?auto_139570 ?auto_139571 ?auto_139572 ?auto_139573 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_139581 - BLOCK
      ?auto_139582 - BLOCK
      ?auto_139583 - BLOCK
      ?auto_139584 - BLOCK
      ?auto_139585 - BLOCK
      ?auto_139586 - BLOCK
    )
    :vars
    (
      ?auto_139587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139586 ?auto_139587 ) ( ON-TABLE ?auto_139581 ) ( ON ?auto_139582 ?auto_139581 ) ( ON ?auto_139583 ?auto_139582 ) ( not ( = ?auto_139581 ?auto_139582 ) ) ( not ( = ?auto_139581 ?auto_139583 ) ) ( not ( = ?auto_139581 ?auto_139584 ) ) ( not ( = ?auto_139581 ?auto_139585 ) ) ( not ( = ?auto_139581 ?auto_139586 ) ) ( not ( = ?auto_139581 ?auto_139587 ) ) ( not ( = ?auto_139582 ?auto_139583 ) ) ( not ( = ?auto_139582 ?auto_139584 ) ) ( not ( = ?auto_139582 ?auto_139585 ) ) ( not ( = ?auto_139582 ?auto_139586 ) ) ( not ( = ?auto_139582 ?auto_139587 ) ) ( not ( = ?auto_139583 ?auto_139584 ) ) ( not ( = ?auto_139583 ?auto_139585 ) ) ( not ( = ?auto_139583 ?auto_139586 ) ) ( not ( = ?auto_139583 ?auto_139587 ) ) ( not ( = ?auto_139584 ?auto_139585 ) ) ( not ( = ?auto_139584 ?auto_139586 ) ) ( not ( = ?auto_139584 ?auto_139587 ) ) ( not ( = ?auto_139585 ?auto_139586 ) ) ( not ( = ?auto_139585 ?auto_139587 ) ) ( not ( = ?auto_139586 ?auto_139587 ) ) ( ON ?auto_139585 ?auto_139586 ) ( CLEAR ?auto_139583 ) ( ON ?auto_139584 ?auto_139585 ) ( CLEAR ?auto_139584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139581 ?auto_139582 ?auto_139583 ?auto_139584 )
      ( MAKE-6PILE ?auto_139581 ?auto_139582 ?auto_139583 ?auto_139584 ?auto_139585 ?auto_139586 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_139594 - BLOCK
      ?auto_139595 - BLOCK
      ?auto_139596 - BLOCK
      ?auto_139597 - BLOCK
      ?auto_139598 - BLOCK
      ?auto_139599 - BLOCK
    )
    :vars
    (
      ?auto_139600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139599 ?auto_139600 ) ( ON-TABLE ?auto_139594 ) ( ON ?auto_139595 ?auto_139594 ) ( not ( = ?auto_139594 ?auto_139595 ) ) ( not ( = ?auto_139594 ?auto_139596 ) ) ( not ( = ?auto_139594 ?auto_139597 ) ) ( not ( = ?auto_139594 ?auto_139598 ) ) ( not ( = ?auto_139594 ?auto_139599 ) ) ( not ( = ?auto_139594 ?auto_139600 ) ) ( not ( = ?auto_139595 ?auto_139596 ) ) ( not ( = ?auto_139595 ?auto_139597 ) ) ( not ( = ?auto_139595 ?auto_139598 ) ) ( not ( = ?auto_139595 ?auto_139599 ) ) ( not ( = ?auto_139595 ?auto_139600 ) ) ( not ( = ?auto_139596 ?auto_139597 ) ) ( not ( = ?auto_139596 ?auto_139598 ) ) ( not ( = ?auto_139596 ?auto_139599 ) ) ( not ( = ?auto_139596 ?auto_139600 ) ) ( not ( = ?auto_139597 ?auto_139598 ) ) ( not ( = ?auto_139597 ?auto_139599 ) ) ( not ( = ?auto_139597 ?auto_139600 ) ) ( not ( = ?auto_139598 ?auto_139599 ) ) ( not ( = ?auto_139598 ?auto_139600 ) ) ( not ( = ?auto_139599 ?auto_139600 ) ) ( ON ?auto_139598 ?auto_139599 ) ( ON ?auto_139597 ?auto_139598 ) ( CLEAR ?auto_139595 ) ( ON ?auto_139596 ?auto_139597 ) ( CLEAR ?auto_139596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139594 ?auto_139595 ?auto_139596 )
      ( MAKE-6PILE ?auto_139594 ?auto_139595 ?auto_139596 ?auto_139597 ?auto_139598 ?auto_139599 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_139607 - BLOCK
      ?auto_139608 - BLOCK
      ?auto_139609 - BLOCK
      ?auto_139610 - BLOCK
      ?auto_139611 - BLOCK
      ?auto_139612 - BLOCK
    )
    :vars
    (
      ?auto_139613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139612 ?auto_139613 ) ( ON-TABLE ?auto_139607 ) ( ON ?auto_139608 ?auto_139607 ) ( not ( = ?auto_139607 ?auto_139608 ) ) ( not ( = ?auto_139607 ?auto_139609 ) ) ( not ( = ?auto_139607 ?auto_139610 ) ) ( not ( = ?auto_139607 ?auto_139611 ) ) ( not ( = ?auto_139607 ?auto_139612 ) ) ( not ( = ?auto_139607 ?auto_139613 ) ) ( not ( = ?auto_139608 ?auto_139609 ) ) ( not ( = ?auto_139608 ?auto_139610 ) ) ( not ( = ?auto_139608 ?auto_139611 ) ) ( not ( = ?auto_139608 ?auto_139612 ) ) ( not ( = ?auto_139608 ?auto_139613 ) ) ( not ( = ?auto_139609 ?auto_139610 ) ) ( not ( = ?auto_139609 ?auto_139611 ) ) ( not ( = ?auto_139609 ?auto_139612 ) ) ( not ( = ?auto_139609 ?auto_139613 ) ) ( not ( = ?auto_139610 ?auto_139611 ) ) ( not ( = ?auto_139610 ?auto_139612 ) ) ( not ( = ?auto_139610 ?auto_139613 ) ) ( not ( = ?auto_139611 ?auto_139612 ) ) ( not ( = ?auto_139611 ?auto_139613 ) ) ( not ( = ?auto_139612 ?auto_139613 ) ) ( ON ?auto_139611 ?auto_139612 ) ( ON ?auto_139610 ?auto_139611 ) ( CLEAR ?auto_139608 ) ( ON ?auto_139609 ?auto_139610 ) ( CLEAR ?auto_139609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139607 ?auto_139608 ?auto_139609 )
      ( MAKE-6PILE ?auto_139607 ?auto_139608 ?auto_139609 ?auto_139610 ?auto_139611 ?auto_139612 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_139620 - BLOCK
      ?auto_139621 - BLOCK
      ?auto_139622 - BLOCK
      ?auto_139623 - BLOCK
      ?auto_139624 - BLOCK
      ?auto_139625 - BLOCK
    )
    :vars
    (
      ?auto_139626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139625 ?auto_139626 ) ( ON-TABLE ?auto_139620 ) ( not ( = ?auto_139620 ?auto_139621 ) ) ( not ( = ?auto_139620 ?auto_139622 ) ) ( not ( = ?auto_139620 ?auto_139623 ) ) ( not ( = ?auto_139620 ?auto_139624 ) ) ( not ( = ?auto_139620 ?auto_139625 ) ) ( not ( = ?auto_139620 ?auto_139626 ) ) ( not ( = ?auto_139621 ?auto_139622 ) ) ( not ( = ?auto_139621 ?auto_139623 ) ) ( not ( = ?auto_139621 ?auto_139624 ) ) ( not ( = ?auto_139621 ?auto_139625 ) ) ( not ( = ?auto_139621 ?auto_139626 ) ) ( not ( = ?auto_139622 ?auto_139623 ) ) ( not ( = ?auto_139622 ?auto_139624 ) ) ( not ( = ?auto_139622 ?auto_139625 ) ) ( not ( = ?auto_139622 ?auto_139626 ) ) ( not ( = ?auto_139623 ?auto_139624 ) ) ( not ( = ?auto_139623 ?auto_139625 ) ) ( not ( = ?auto_139623 ?auto_139626 ) ) ( not ( = ?auto_139624 ?auto_139625 ) ) ( not ( = ?auto_139624 ?auto_139626 ) ) ( not ( = ?auto_139625 ?auto_139626 ) ) ( ON ?auto_139624 ?auto_139625 ) ( ON ?auto_139623 ?auto_139624 ) ( ON ?auto_139622 ?auto_139623 ) ( CLEAR ?auto_139620 ) ( ON ?auto_139621 ?auto_139622 ) ( CLEAR ?auto_139621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139620 ?auto_139621 )
      ( MAKE-6PILE ?auto_139620 ?auto_139621 ?auto_139622 ?auto_139623 ?auto_139624 ?auto_139625 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_139633 - BLOCK
      ?auto_139634 - BLOCK
      ?auto_139635 - BLOCK
      ?auto_139636 - BLOCK
      ?auto_139637 - BLOCK
      ?auto_139638 - BLOCK
    )
    :vars
    (
      ?auto_139639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139638 ?auto_139639 ) ( ON-TABLE ?auto_139633 ) ( not ( = ?auto_139633 ?auto_139634 ) ) ( not ( = ?auto_139633 ?auto_139635 ) ) ( not ( = ?auto_139633 ?auto_139636 ) ) ( not ( = ?auto_139633 ?auto_139637 ) ) ( not ( = ?auto_139633 ?auto_139638 ) ) ( not ( = ?auto_139633 ?auto_139639 ) ) ( not ( = ?auto_139634 ?auto_139635 ) ) ( not ( = ?auto_139634 ?auto_139636 ) ) ( not ( = ?auto_139634 ?auto_139637 ) ) ( not ( = ?auto_139634 ?auto_139638 ) ) ( not ( = ?auto_139634 ?auto_139639 ) ) ( not ( = ?auto_139635 ?auto_139636 ) ) ( not ( = ?auto_139635 ?auto_139637 ) ) ( not ( = ?auto_139635 ?auto_139638 ) ) ( not ( = ?auto_139635 ?auto_139639 ) ) ( not ( = ?auto_139636 ?auto_139637 ) ) ( not ( = ?auto_139636 ?auto_139638 ) ) ( not ( = ?auto_139636 ?auto_139639 ) ) ( not ( = ?auto_139637 ?auto_139638 ) ) ( not ( = ?auto_139637 ?auto_139639 ) ) ( not ( = ?auto_139638 ?auto_139639 ) ) ( ON ?auto_139637 ?auto_139638 ) ( ON ?auto_139636 ?auto_139637 ) ( ON ?auto_139635 ?auto_139636 ) ( CLEAR ?auto_139633 ) ( ON ?auto_139634 ?auto_139635 ) ( CLEAR ?auto_139634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139633 ?auto_139634 )
      ( MAKE-6PILE ?auto_139633 ?auto_139634 ?auto_139635 ?auto_139636 ?auto_139637 ?auto_139638 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_139646 - BLOCK
      ?auto_139647 - BLOCK
      ?auto_139648 - BLOCK
      ?auto_139649 - BLOCK
      ?auto_139650 - BLOCK
      ?auto_139651 - BLOCK
    )
    :vars
    (
      ?auto_139652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139651 ?auto_139652 ) ( not ( = ?auto_139646 ?auto_139647 ) ) ( not ( = ?auto_139646 ?auto_139648 ) ) ( not ( = ?auto_139646 ?auto_139649 ) ) ( not ( = ?auto_139646 ?auto_139650 ) ) ( not ( = ?auto_139646 ?auto_139651 ) ) ( not ( = ?auto_139646 ?auto_139652 ) ) ( not ( = ?auto_139647 ?auto_139648 ) ) ( not ( = ?auto_139647 ?auto_139649 ) ) ( not ( = ?auto_139647 ?auto_139650 ) ) ( not ( = ?auto_139647 ?auto_139651 ) ) ( not ( = ?auto_139647 ?auto_139652 ) ) ( not ( = ?auto_139648 ?auto_139649 ) ) ( not ( = ?auto_139648 ?auto_139650 ) ) ( not ( = ?auto_139648 ?auto_139651 ) ) ( not ( = ?auto_139648 ?auto_139652 ) ) ( not ( = ?auto_139649 ?auto_139650 ) ) ( not ( = ?auto_139649 ?auto_139651 ) ) ( not ( = ?auto_139649 ?auto_139652 ) ) ( not ( = ?auto_139650 ?auto_139651 ) ) ( not ( = ?auto_139650 ?auto_139652 ) ) ( not ( = ?auto_139651 ?auto_139652 ) ) ( ON ?auto_139650 ?auto_139651 ) ( ON ?auto_139649 ?auto_139650 ) ( ON ?auto_139648 ?auto_139649 ) ( ON ?auto_139647 ?auto_139648 ) ( ON ?auto_139646 ?auto_139647 ) ( CLEAR ?auto_139646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139646 )
      ( MAKE-6PILE ?auto_139646 ?auto_139647 ?auto_139648 ?auto_139649 ?auto_139650 ?auto_139651 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_139659 - BLOCK
      ?auto_139660 - BLOCK
      ?auto_139661 - BLOCK
      ?auto_139662 - BLOCK
      ?auto_139663 - BLOCK
      ?auto_139664 - BLOCK
    )
    :vars
    (
      ?auto_139665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139664 ?auto_139665 ) ( not ( = ?auto_139659 ?auto_139660 ) ) ( not ( = ?auto_139659 ?auto_139661 ) ) ( not ( = ?auto_139659 ?auto_139662 ) ) ( not ( = ?auto_139659 ?auto_139663 ) ) ( not ( = ?auto_139659 ?auto_139664 ) ) ( not ( = ?auto_139659 ?auto_139665 ) ) ( not ( = ?auto_139660 ?auto_139661 ) ) ( not ( = ?auto_139660 ?auto_139662 ) ) ( not ( = ?auto_139660 ?auto_139663 ) ) ( not ( = ?auto_139660 ?auto_139664 ) ) ( not ( = ?auto_139660 ?auto_139665 ) ) ( not ( = ?auto_139661 ?auto_139662 ) ) ( not ( = ?auto_139661 ?auto_139663 ) ) ( not ( = ?auto_139661 ?auto_139664 ) ) ( not ( = ?auto_139661 ?auto_139665 ) ) ( not ( = ?auto_139662 ?auto_139663 ) ) ( not ( = ?auto_139662 ?auto_139664 ) ) ( not ( = ?auto_139662 ?auto_139665 ) ) ( not ( = ?auto_139663 ?auto_139664 ) ) ( not ( = ?auto_139663 ?auto_139665 ) ) ( not ( = ?auto_139664 ?auto_139665 ) ) ( ON ?auto_139663 ?auto_139664 ) ( ON ?auto_139662 ?auto_139663 ) ( ON ?auto_139661 ?auto_139662 ) ( ON ?auto_139660 ?auto_139661 ) ( ON ?auto_139659 ?auto_139660 ) ( CLEAR ?auto_139659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139659 )
      ( MAKE-6PILE ?auto_139659 ?auto_139660 ?auto_139661 ?auto_139662 ?auto_139663 ?auto_139664 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139673 - BLOCK
      ?auto_139674 - BLOCK
      ?auto_139675 - BLOCK
      ?auto_139676 - BLOCK
      ?auto_139677 - BLOCK
      ?auto_139678 - BLOCK
      ?auto_139679 - BLOCK
    )
    :vars
    (
      ?auto_139680 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_139678 ) ( ON ?auto_139679 ?auto_139680 ) ( CLEAR ?auto_139679 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139673 ) ( ON ?auto_139674 ?auto_139673 ) ( ON ?auto_139675 ?auto_139674 ) ( ON ?auto_139676 ?auto_139675 ) ( ON ?auto_139677 ?auto_139676 ) ( ON ?auto_139678 ?auto_139677 ) ( not ( = ?auto_139673 ?auto_139674 ) ) ( not ( = ?auto_139673 ?auto_139675 ) ) ( not ( = ?auto_139673 ?auto_139676 ) ) ( not ( = ?auto_139673 ?auto_139677 ) ) ( not ( = ?auto_139673 ?auto_139678 ) ) ( not ( = ?auto_139673 ?auto_139679 ) ) ( not ( = ?auto_139673 ?auto_139680 ) ) ( not ( = ?auto_139674 ?auto_139675 ) ) ( not ( = ?auto_139674 ?auto_139676 ) ) ( not ( = ?auto_139674 ?auto_139677 ) ) ( not ( = ?auto_139674 ?auto_139678 ) ) ( not ( = ?auto_139674 ?auto_139679 ) ) ( not ( = ?auto_139674 ?auto_139680 ) ) ( not ( = ?auto_139675 ?auto_139676 ) ) ( not ( = ?auto_139675 ?auto_139677 ) ) ( not ( = ?auto_139675 ?auto_139678 ) ) ( not ( = ?auto_139675 ?auto_139679 ) ) ( not ( = ?auto_139675 ?auto_139680 ) ) ( not ( = ?auto_139676 ?auto_139677 ) ) ( not ( = ?auto_139676 ?auto_139678 ) ) ( not ( = ?auto_139676 ?auto_139679 ) ) ( not ( = ?auto_139676 ?auto_139680 ) ) ( not ( = ?auto_139677 ?auto_139678 ) ) ( not ( = ?auto_139677 ?auto_139679 ) ) ( not ( = ?auto_139677 ?auto_139680 ) ) ( not ( = ?auto_139678 ?auto_139679 ) ) ( not ( = ?auto_139678 ?auto_139680 ) ) ( not ( = ?auto_139679 ?auto_139680 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139679 ?auto_139680 )
      ( !STACK ?auto_139679 ?auto_139678 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139688 - BLOCK
      ?auto_139689 - BLOCK
      ?auto_139690 - BLOCK
      ?auto_139691 - BLOCK
      ?auto_139692 - BLOCK
      ?auto_139693 - BLOCK
      ?auto_139694 - BLOCK
    )
    :vars
    (
      ?auto_139695 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_139693 ) ( ON ?auto_139694 ?auto_139695 ) ( CLEAR ?auto_139694 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139688 ) ( ON ?auto_139689 ?auto_139688 ) ( ON ?auto_139690 ?auto_139689 ) ( ON ?auto_139691 ?auto_139690 ) ( ON ?auto_139692 ?auto_139691 ) ( ON ?auto_139693 ?auto_139692 ) ( not ( = ?auto_139688 ?auto_139689 ) ) ( not ( = ?auto_139688 ?auto_139690 ) ) ( not ( = ?auto_139688 ?auto_139691 ) ) ( not ( = ?auto_139688 ?auto_139692 ) ) ( not ( = ?auto_139688 ?auto_139693 ) ) ( not ( = ?auto_139688 ?auto_139694 ) ) ( not ( = ?auto_139688 ?auto_139695 ) ) ( not ( = ?auto_139689 ?auto_139690 ) ) ( not ( = ?auto_139689 ?auto_139691 ) ) ( not ( = ?auto_139689 ?auto_139692 ) ) ( not ( = ?auto_139689 ?auto_139693 ) ) ( not ( = ?auto_139689 ?auto_139694 ) ) ( not ( = ?auto_139689 ?auto_139695 ) ) ( not ( = ?auto_139690 ?auto_139691 ) ) ( not ( = ?auto_139690 ?auto_139692 ) ) ( not ( = ?auto_139690 ?auto_139693 ) ) ( not ( = ?auto_139690 ?auto_139694 ) ) ( not ( = ?auto_139690 ?auto_139695 ) ) ( not ( = ?auto_139691 ?auto_139692 ) ) ( not ( = ?auto_139691 ?auto_139693 ) ) ( not ( = ?auto_139691 ?auto_139694 ) ) ( not ( = ?auto_139691 ?auto_139695 ) ) ( not ( = ?auto_139692 ?auto_139693 ) ) ( not ( = ?auto_139692 ?auto_139694 ) ) ( not ( = ?auto_139692 ?auto_139695 ) ) ( not ( = ?auto_139693 ?auto_139694 ) ) ( not ( = ?auto_139693 ?auto_139695 ) ) ( not ( = ?auto_139694 ?auto_139695 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139694 ?auto_139695 )
      ( !STACK ?auto_139694 ?auto_139693 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139703 - BLOCK
      ?auto_139704 - BLOCK
      ?auto_139705 - BLOCK
      ?auto_139706 - BLOCK
      ?auto_139707 - BLOCK
      ?auto_139708 - BLOCK
      ?auto_139709 - BLOCK
    )
    :vars
    (
      ?auto_139710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139709 ?auto_139710 ) ( ON-TABLE ?auto_139703 ) ( ON ?auto_139704 ?auto_139703 ) ( ON ?auto_139705 ?auto_139704 ) ( ON ?auto_139706 ?auto_139705 ) ( ON ?auto_139707 ?auto_139706 ) ( not ( = ?auto_139703 ?auto_139704 ) ) ( not ( = ?auto_139703 ?auto_139705 ) ) ( not ( = ?auto_139703 ?auto_139706 ) ) ( not ( = ?auto_139703 ?auto_139707 ) ) ( not ( = ?auto_139703 ?auto_139708 ) ) ( not ( = ?auto_139703 ?auto_139709 ) ) ( not ( = ?auto_139703 ?auto_139710 ) ) ( not ( = ?auto_139704 ?auto_139705 ) ) ( not ( = ?auto_139704 ?auto_139706 ) ) ( not ( = ?auto_139704 ?auto_139707 ) ) ( not ( = ?auto_139704 ?auto_139708 ) ) ( not ( = ?auto_139704 ?auto_139709 ) ) ( not ( = ?auto_139704 ?auto_139710 ) ) ( not ( = ?auto_139705 ?auto_139706 ) ) ( not ( = ?auto_139705 ?auto_139707 ) ) ( not ( = ?auto_139705 ?auto_139708 ) ) ( not ( = ?auto_139705 ?auto_139709 ) ) ( not ( = ?auto_139705 ?auto_139710 ) ) ( not ( = ?auto_139706 ?auto_139707 ) ) ( not ( = ?auto_139706 ?auto_139708 ) ) ( not ( = ?auto_139706 ?auto_139709 ) ) ( not ( = ?auto_139706 ?auto_139710 ) ) ( not ( = ?auto_139707 ?auto_139708 ) ) ( not ( = ?auto_139707 ?auto_139709 ) ) ( not ( = ?auto_139707 ?auto_139710 ) ) ( not ( = ?auto_139708 ?auto_139709 ) ) ( not ( = ?auto_139708 ?auto_139710 ) ) ( not ( = ?auto_139709 ?auto_139710 ) ) ( CLEAR ?auto_139707 ) ( ON ?auto_139708 ?auto_139709 ) ( CLEAR ?auto_139708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139703 ?auto_139704 ?auto_139705 ?auto_139706 ?auto_139707 ?auto_139708 )
      ( MAKE-7PILE ?auto_139703 ?auto_139704 ?auto_139705 ?auto_139706 ?auto_139707 ?auto_139708 ?auto_139709 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139718 - BLOCK
      ?auto_139719 - BLOCK
      ?auto_139720 - BLOCK
      ?auto_139721 - BLOCK
      ?auto_139722 - BLOCK
      ?auto_139723 - BLOCK
      ?auto_139724 - BLOCK
    )
    :vars
    (
      ?auto_139725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139724 ?auto_139725 ) ( ON-TABLE ?auto_139718 ) ( ON ?auto_139719 ?auto_139718 ) ( ON ?auto_139720 ?auto_139719 ) ( ON ?auto_139721 ?auto_139720 ) ( ON ?auto_139722 ?auto_139721 ) ( not ( = ?auto_139718 ?auto_139719 ) ) ( not ( = ?auto_139718 ?auto_139720 ) ) ( not ( = ?auto_139718 ?auto_139721 ) ) ( not ( = ?auto_139718 ?auto_139722 ) ) ( not ( = ?auto_139718 ?auto_139723 ) ) ( not ( = ?auto_139718 ?auto_139724 ) ) ( not ( = ?auto_139718 ?auto_139725 ) ) ( not ( = ?auto_139719 ?auto_139720 ) ) ( not ( = ?auto_139719 ?auto_139721 ) ) ( not ( = ?auto_139719 ?auto_139722 ) ) ( not ( = ?auto_139719 ?auto_139723 ) ) ( not ( = ?auto_139719 ?auto_139724 ) ) ( not ( = ?auto_139719 ?auto_139725 ) ) ( not ( = ?auto_139720 ?auto_139721 ) ) ( not ( = ?auto_139720 ?auto_139722 ) ) ( not ( = ?auto_139720 ?auto_139723 ) ) ( not ( = ?auto_139720 ?auto_139724 ) ) ( not ( = ?auto_139720 ?auto_139725 ) ) ( not ( = ?auto_139721 ?auto_139722 ) ) ( not ( = ?auto_139721 ?auto_139723 ) ) ( not ( = ?auto_139721 ?auto_139724 ) ) ( not ( = ?auto_139721 ?auto_139725 ) ) ( not ( = ?auto_139722 ?auto_139723 ) ) ( not ( = ?auto_139722 ?auto_139724 ) ) ( not ( = ?auto_139722 ?auto_139725 ) ) ( not ( = ?auto_139723 ?auto_139724 ) ) ( not ( = ?auto_139723 ?auto_139725 ) ) ( not ( = ?auto_139724 ?auto_139725 ) ) ( CLEAR ?auto_139722 ) ( ON ?auto_139723 ?auto_139724 ) ( CLEAR ?auto_139723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139718 ?auto_139719 ?auto_139720 ?auto_139721 ?auto_139722 ?auto_139723 )
      ( MAKE-7PILE ?auto_139718 ?auto_139719 ?auto_139720 ?auto_139721 ?auto_139722 ?auto_139723 ?auto_139724 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139733 - BLOCK
      ?auto_139734 - BLOCK
      ?auto_139735 - BLOCK
      ?auto_139736 - BLOCK
      ?auto_139737 - BLOCK
      ?auto_139738 - BLOCK
      ?auto_139739 - BLOCK
    )
    :vars
    (
      ?auto_139740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139739 ?auto_139740 ) ( ON-TABLE ?auto_139733 ) ( ON ?auto_139734 ?auto_139733 ) ( ON ?auto_139735 ?auto_139734 ) ( ON ?auto_139736 ?auto_139735 ) ( not ( = ?auto_139733 ?auto_139734 ) ) ( not ( = ?auto_139733 ?auto_139735 ) ) ( not ( = ?auto_139733 ?auto_139736 ) ) ( not ( = ?auto_139733 ?auto_139737 ) ) ( not ( = ?auto_139733 ?auto_139738 ) ) ( not ( = ?auto_139733 ?auto_139739 ) ) ( not ( = ?auto_139733 ?auto_139740 ) ) ( not ( = ?auto_139734 ?auto_139735 ) ) ( not ( = ?auto_139734 ?auto_139736 ) ) ( not ( = ?auto_139734 ?auto_139737 ) ) ( not ( = ?auto_139734 ?auto_139738 ) ) ( not ( = ?auto_139734 ?auto_139739 ) ) ( not ( = ?auto_139734 ?auto_139740 ) ) ( not ( = ?auto_139735 ?auto_139736 ) ) ( not ( = ?auto_139735 ?auto_139737 ) ) ( not ( = ?auto_139735 ?auto_139738 ) ) ( not ( = ?auto_139735 ?auto_139739 ) ) ( not ( = ?auto_139735 ?auto_139740 ) ) ( not ( = ?auto_139736 ?auto_139737 ) ) ( not ( = ?auto_139736 ?auto_139738 ) ) ( not ( = ?auto_139736 ?auto_139739 ) ) ( not ( = ?auto_139736 ?auto_139740 ) ) ( not ( = ?auto_139737 ?auto_139738 ) ) ( not ( = ?auto_139737 ?auto_139739 ) ) ( not ( = ?auto_139737 ?auto_139740 ) ) ( not ( = ?auto_139738 ?auto_139739 ) ) ( not ( = ?auto_139738 ?auto_139740 ) ) ( not ( = ?auto_139739 ?auto_139740 ) ) ( ON ?auto_139738 ?auto_139739 ) ( CLEAR ?auto_139736 ) ( ON ?auto_139737 ?auto_139738 ) ( CLEAR ?auto_139737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139733 ?auto_139734 ?auto_139735 ?auto_139736 ?auto_139737 )
      ( MAKE-7PILE ?auto_139733 ?auto_139734 ?auto_139735 ?auto_139736 ?auto_139737 ?auto_139738 ?auto_139739 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139748 - BLOCK
      ?auto_139749 - BLOCK
      ?auto_139750 - BLOCK
      ?auto_139751 - BLOCK
      ?auto_139752 - BLOCK
      ?auto_139753 - BLOCK
      ?auto_139754 - BLOCK
    )
    :vars
    (
      ?auto_139755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139754 ?auto_139755 ) ( ON-TABLE ?auto_139748 ) ( ON ?auto_139749 ?auto_139748 ) ( ON ?auto_139750 ?auto_139749 ) ( ON ?auto_139751 ?auto_139750 ) ( not ( = ?auto_139748 ?auto_139749 ) ) ( not ( = ?auto_139748 ?auto_139750 ) ) ( not ( = ?auto_139748 ?auto_139751 ) ) ( not ( = ?auto_139748 ?auto_139752 ) ) ( not ( = ?auto_139748 ?auto_139753 ) ) ( not ( = ?auto_139748 ?auto_139754 ) ) ( not ( = ?auto_139748 ?auto_139755 ) ) ( not ( = ?auto_139749 ?auto_139750 ) ) ( not ( = ?auto_139749 ?auto_139751 ) ) ( not ( = ?auto_139749 ?auto_139752 ) ) ( not ( = ?auto_139749 ?auto_139753 ) ) ( not ( = ?auto_139749 ?auto_139754 ) ) ( not ( = ?auto_139749 ?auto_139755 ) ) ( not ( = ?auto_139750 ?auto_139751 ) ) ( not ( = ?auto_139750 ?auto_139752 ) ) ( not ( = ?auto_139750 ?auto_139753 ) ) ( not ( = ?auto_139750 ?auto_139754 ) ) ( not ( = ?auto_139750 ?auto_139755 ) ) ( not ( = ?auto_139751 ?auto_139752 ) ) ( not ( = ?auto_139751 ?auto_139753 ) ) ( not ( = ?auto_139751 ?auto_139754 ) ) ( not ( = ?auto_139751 ?auto_139755 ) ) ( not ( = ?auto_139752 ?auto_139753 ) ) ( not ( = ?auto_139752 ?auto_139754 ) ) ( not ( = ?auto_139752 ?auto_139755 ) ) ( not ( = ?auto_139753 ?auto_139754 ) ) ( not ( = ?auto_139753 ?auto_139755 ) ) ( not ( = ?auto_139754 ?auto_139755 ) ) ( ON ?auto_139753 ?auto_139754 ) ( CLEAR ?auto_139751 ) ( ON ?auto_139752 ?auto_139753 ) ( CLEAR ?auto_139752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139748 ?auto_139749 ?auto_139750 ?auto_139751 ?auto_139752 )
      ( MAKE-7PILE ?auto_139748 ?auto_139749 ?auto_139750 ?auto_139751 ?auto_139752 ?auto_139753 ?auto_139754 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139763 - BLOCK
      ?auto_139764 - BLOCK
      ?auto_139765 - BLOCK
      ?auto_139766 - BLOCK
      ?auto_139767 - BLOCK
      ?auto_139768 - BLOCK
      ?auto_139769 - BLOCK
    )
    :vars
    (
      ?auto_139770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139769 ?auto_139770 ) ( ON-TABLE ?auto_139763 ) ( ON ?auto_139764 ?auto_139763 ) ( ON ?auto_139765 ?auto_139764 ) ( not ( = ?auto_139763 ?auto_139764 ) ) ( not ( = ?auto_139763 ?auto_139765 ) ) ( not ( = ?auto_139763 ?auto_139766 ) ) ( not ( = ?auto_139763 ?auto_139767 ) ) ( not ( = ?auto_139763 ?auto_139768 ) ) ( not ( = ?auto_139763 ?auto_139769 ) ) ( not ( = ?auto_139763 ?auto_139770 ) ) ( not ( = ?auto_139764 ?auto_139765 ) ) ( not ( = ?auto_139764 ?auto_139766 ) ) ( not ( = ?auto_139764 ?auto_139767 ) ) ( not ( = ?auto_139764 ?auto_139768 ) ) ( not ( = ?auto_139764 ?auto_139769 ) ) ( not ( = ?auto_139764 ?auto_139770 ) ) ( not ( = ?auto_139765 ?auto_139766 ) ) ( not ( = ?auto_139765 ?auto_139767 ) ) ( not ( = ?auto_139765 ?auto_139768 ) ) ( not ( = ?auto_139765 ?auto_139769 ) ) ( not ( = ?auto_139765 ?auto_139770 ) ) ( not ( = ?auto_139766 ?auto_139767 ) ) ( not ( = ?auto_139766 ?auto_139768 ) ) ( not ( = ?auto_139766 ?auto_139769 ) ) ( not ( = ?auto_139766 ?auto_139770 ) ) ( not ( = ?auto_139767 ?auto_139768 ) ) ( not ( = ?auto_139767 ?auto_139769 ) ) ( not ( = ?auto_139767 ?auto_139770 ) ) ( not ( = ?auto_139768 ?auto_139769 ) ) ( not ( = ?auto_139768 ?auto_139770 ) ) ( not ( = ?auto_139769 ?auto_139770 ) ) ( ON ?auto_139768 ?auto_139769 ) ( ON ?auto_139767 ?auto_139768 ) ( CLEAR ?auto_139765 ) ( ON ?auto_139766 ?auto_139767 ) ( CLEAR ?auto_139766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139763 ?auto_139764 ?auto_139765 ?auto_139766 )
      ( MAKE-7PILE ?auto_139763 ?auto_139764 ?auto_139765 ?auto_139766 ?auto_139767 ?auto_139768 ?auto_139769 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139778 - BLOCK
      ?auto_139779 - BLOCK
      ?auto_139780 - BLOCK
      ?auto_139781 - BLOCK
      ?auto_139782 - BLOCK
      ?auto_139783 - BLOCK
      ?auto_139784 - BLOCK
    )
    :vars
    (
      ?auto_139785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139784 ?auto_139785 ) ( ON-TABLE ?auto_139778 ) ( ON ?auto_139779 ?auto_139778 ) ( ON ?auto_139780 ?auto_139779 ) ( not ( = ?auto_139778 ?auto_139779 ) ) ( not ( = ?auto_139778 ?auto_139780 ) ) ( not ( = ?auto_139778 ?auto_139781 ) ) ( not ( = ?auto_139778 ?auto_139782 ) ) ( not ( = ?auto_139778 ?auto_139783 ) ) ( not ( = ?auto_139778 ?auto_139784 ) ) ( not ( = ?auto_139778 ?auto_139785 ) ) ( not ( = ?auto_139779 ?auto_139780 ) ) ( not ( = ?auto_139779 ?auto_139781 ) ) ( not ( = ?auto_139779 ?auto_139782 ) ) ( not ( = ?auto_139779 ?auto_139783 ) ) ( not ( = ?auto_139779 ?auto_139784 ) ) ( not ( = ?auto_139779 ?auto_139785 ) ) ( not ( = ?auto_139780 ?auto_139781 ) ) ( not ( = ?auto_139780 ?auto_139782 ) ) ( not ( = ?auto_139780 ?auto_139783 ) ) ( not ( = ?auto_139780 ?auto_139784 ) ) ( not ( = ?auto_139780 ?auto_139785 ) ) ( not ( = ?auto_139781 ?auto_139782 ) ) ( not ( = ?auto_139781 ?auto_139783 ) ) ( not ( = ?auto_139781 ?auto_139784 ) ) ( not ( = ?auto_139781 ?auto_139785 ) ) ( not ( = ?auto_139782 ?auto_139783 ) ) ( not ( = ?auto_139782 ?auto_139784 ) ) ( not ( = ?auto_139782 ?auto_139785 ) ) ( not ( = ?auto_139783 ?auto_139784 ) ) ( not ( = ?auto_139783 ?auto_139785 ) ) ( not ( = ?auto_139784 ?auto_139785 ) ) ( ON ?auto_139783 ?auto_139784 ) ( ON ?auto_139782 ?auto_139783 ) ( CLEAR ?auto_139780 ) ( ON ?auto_139781 ?auto_139782 ) ( CLEAR ?auto_139781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139778 ?auto_139779 ?auto_139780 ?auto_139781 )
      ( MAKE-7PILE ?auto_139778 ?auto_139779 ?auto_139780 ?auto_139781 ?auto_139782 ?auto_139783 ?auto_139784 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139793 - BLOCK
      ?auto_139794 - BLOCK
      ?auto_139795 - BLOCK
      ?auto_139796 - BLOCK
      ?auto_139797 - BLOCK
      ?auto_139798 - BLOCK
      ?auto_139799 - BLOCK
    )
    :vars
    (
      ?auto_139800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139799 ?auto_139800 ) ( ON-TABLE ?auto_139793 ) ( ON ?auto_139794 ?auto_139793 ) ( not ( = ?auto_139793 ?auto_139794 ) ) ( not ( = ?auto_139793 ?auto_139795 ) ) ( not ( = ?auto_139793 ?auto_139796 ) ) ( not ( = ?auto_139793 ?auto_139797 ) ) ( not ( = ?auto_139793 ?auto_139798 ) ) ( not ( = ?auto_139793 ?auto_139799 ) ) ( not ( = ?auto_139793 ?auto_139800 ) ) ( not ( = ?auto_139794 ?auto_139795 ) ) ( not ( = ?auto_139794 ?auto_139796 ) ) ( not ( = ?auto_139794 ?auto_139797 ) ) ( not ( = ?auto_139794 ?auto_139798 ) ) ( not ( = ?auto_139794 ?auto_139799 ) ) ( not ( = ?auto_139794 ?auto_139800 ) ) ( not ( = ?auto_139795 ?auto_139796 ) ) ( not ( = ?auto_139795 ?auto_139797 ) ) ( not ( = ?auto_139795 ?auto_139798 ) ) ( not ( = ?auto_139795 ?auto_139799 ) ) ( not ( = ?auto_139795 ?auto_139800 ) ) ( not ( = ?auto_139796 ?auto_139797 ) ) ( not ( = ?auto_139796 ?auto_139798 ) ) ( not ( = ?auto_139796 ?auto_139799 ) ) ( not ( = ?auto_139796 ?auto_139800 ) ) ( not ( = ?auto_139797 ?auto_139798 ) ) ( not ( = ?auto_139797 ?auto_139799 ) ) ( not ( = ?auto_139797 ?auto_139800 ) ) ( not ( = ?auto_139798 ?auto_139799 ) ) ( not ( = ?auto_139798 ?auto_139800 ) ) ( not ( = ?auto_139799 ?auto_139800 ) ) ( ON ?auto_139798 ?auto_139799 ) ( ON ?auto_139797 ?auto_139798 ) ( ON ?auto_139796 ?auto_139797 ) ( CLEAR ?auto_139794 ) ( ON ?auto_139795 ?auto_139796 ) ( CLEAR ?auto_139795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139793 ?auto_139794 ?auto_139795 )
      ( MAKE-7PILE ?auto_139793 ?auto_139794 ?auto_139795 ?auto_139796 ?auto_139797 ?auto_139798 ?auto_139799 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139808 - BLOCK
      ?auto_139809 - BLOCK
      ?auto_139810 - BLOCK
      ?auto_139811 - BLOCK
      ?auto_139812 - BLOCK
      ?auto_139813 - BLOCK
      ?auto_139814 - BLOCK
    )
    :vars
    (
      ?auto_139815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139814 ?auto_139815 ) ( ON-TABLE ?auto_139808 ) ( ON ?auto_139809 ?auto_139808 ) ( not ( = ?auto_139808 ?auto_139809 ) ) ( not ( = ?auto_139808 ?auto_139810 ) ) ( not ( = ?auto_139808 ?auto_139811 ) ) ( not ( = ?auto_139808 ?auto_139812 ) ) ( not ( = ?auto_139808 ?auto_139813 ) ) ( not ( = ?auto_139808 ?auto_139814 ) ) ( not ( = ?auto_139808 ?auto_139815 ) ) ( not ( = ?auto_139809 ?auto_139810 ) ) ( not ( = ?auto_139809 ?auto_139811 ) ) ( not ( = ?auto_139809 ?auto_139812 ) ) ( not ( = ?auto_139809 ?auto_139813 ) ) ( not ( = ?auto_139809 ?auto_139814 ) ) ( not ( = ?auto_139809 ?auto_139815 ) ) ( not ( = ?auto_139810 ?auto_139811 ) ) ( not ( = ?auto_139810 ?auto_139812 ) ) ( not ( = ?auto_139810 ?auto_139813 ) ) ( not ( = ?auto_139810 ?auto_139814 ) ) ( not ( = ?auto_139810 ?auto_139815 ) ) ( not ( = ?auto_139811 ?auto_139812 ) ) ( not ( = ?auto_139811 ?auto_139813 ) ) ( not ( = ?auto_139811 ?auto_139814 ) ) ( not ( = ?auto_139811 ?auto_139815 ) ) ( not ( = ?auto_139812 ?auto_139813 ) ) ( not ( = ?auto_139812 ?auto_139814 ) ) ( not ( = ?auto_139812 ?auto_139815 ) ) ( not ( = ?auto_139813 ?auto_139814 ) ) ( not ( = ?auto_139813 ?auto_139815 ) ) ( not ( = ?auto_139814 ?auto_139815 ) ) ( ON ?auto_139813 ?auto_139814 ) ( ON ?auto_139812 ?auto_139813 ) ( ON ?auto_139811 ?auto_139812 ) ( CLEAR ?auto_139809 ) ( ON ?auto_139810 ?auto_139811 ) ( CLEAR ?auto_139810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139808 ?auto_139809 ?auto_139810 )
      ( MAKE-7PILE ?auto_139808 ?auto_139809 ?auto_139810 ?auto_139811 ?auto_139812 ?auto_139813 ?auto_139814 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139823 - BLOCK
      ?auto_139824 - BLOCK
      ?auto_139825 - BLOCK
      ?auto_139826 - BLOCK
      ?auto_139827 - BLOCK
      ?auto_139828 - BLOCK
      ?auto_139829 - BLOCK
    )
    :vars
    (
      ?auto_139830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139829 ?auto_139830 ) ( ON-TABLE ?auto_139823 ) ( not ( = ?auto_139823 ?auto_139824 ) ) ( not ( = ?auto_139823 ?auto_139825 ) ) ( not ( = ?auto_139823 ?auto_139826 ) ) ( not ( = ?auto_139823 ?auto_139827 ) ) ( not ( = ?auto_139823 ?auto_139828 ) ) ( not ( = ?auto_139823 ?auto_139829 ) ) ( not ( = ?auto_139823 ?auto_139830 ) ) ( not ( = ?auto_139824 ?auto_139825 ) ) ( not ( = ?auto_139824 ?auto_139826 ) ) ( not ( = ?auto_139824 ?auto_139827 ) ) ( not ( = ?auto_139824 ?auto_139828 ) ) ( not ( = ?auto_139824 ?auto_139829 ) ) ( not ( = ?auto_139824 ?auto_139830 ) ) ( not ( = ?auto_139825 ?auto_139826 ) ) ( not ( = ?auto_139825 ?auto_139827 ) ) ( not ( = ?auto_139825 ?auto_139828 ) ) ( not ( = ?auto_139825 ?auto_139829 ) ) ( not ( = ?auto_139825 ?auto_139830 ) ) ( not ( = ?auto_139826 ?auto_139827 ) ) ( not ( = ?auto_139826 ?auto_139828 ) ) ( not ( = ?auto_139826 ?auto_139829 ) ) ( not ( = ?auto_139826 ?auto_139830 ) ) ( not ( = ?auto_139827 ?auto_139828 ) ) ( not ( = ?auto_139827 ?auto_139829 ) ) ( not ( = ?auto_139827 ?auto_139830 ) ) ( not ( = ?auto_139828 ?auto_139829 ) ) ( not ( = ?auto_139828 ?auto_139830 ) ) ( not ( = ?auto_139829 ?auto_139830 ) ) ( ON ?auto_139828 ?auto_139829 ) ( ON ?auto_139827 ?auto_139828 ) ( ON ?auto_139826 ?auto_139827 ) ( ON ?auto_139825 ?auto_139826 ) ( CLEAR ?auto_139823 ) ( ON ?auto_139824 ?auto_139825 ) ( CLEAR ?auto_139824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139823 ?auto_139824 )
      ( MAKE-7PILE ?auto_139823 ?auto_139824 ?auto_139825 ?auto_139826 ?auto_139827 ?auto_139828 ?auto_139829 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139838 - BLOCK
      ?auto_139839 - BLOCK
      ?auto_139840 - BLOCK
      ?auto_139841 - BLOCK
      ?auto_139842 - BLOCK
      ?auto_139843 - BLOCK
      ?auto_139844 - BLOCK
    )
    :vars
    (
      ?auto_139845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139844 ?auto_139845 ) ( ON-TABLE ?auto_139838 ) ( not ( = ?auto_139838 ?auto_139839 ) ) ( not ( = ?auto_139838 ?auto_139840 ) ) ( not ( = ?auto_139838 ?auto_139841 ) ) ( not ( = ?auto_139838 ?auto_139842 ) ) ( not ( = ?auto_139838 ?auto_139843 ) ) ( not ( = ?auto_139838 ?auto_139844 ) ) ( not ( = ?auto_139838 ?auto_139845 ) ) ( not ( = ?auto_139839 ?auto_139840 ) ) ( not ( = ?auto_139839 ?auto_139841 ) ) ( not ( = ?auto_139839 ?auto_139842 ) ) ( not ( = ?auto_139839 ?auto_139843 ) ) ( not ( = ?auto_139839 ?auto_139844 ) ) ( not ( = ?auto_139839 ?auto_139845 ) ) ( not ( = ?auto_139840 ?auto_139841 ) ) ( not ( = ?auto_139840 ?auto_139842 ) ) ( not ( = ?auto_139840 ?auto_139843 ) ) ( not ( = ?auto_139840 ?auto_139844 ) ) ( not ( = ?auto_139840 ?auto_139845 ) ) ( not ( = ?auto_139841 ?auto_139842 ) ) ( not ( = ?auto_139841 ?auto_139843 ) ) ( not ( = ?auto_139841 ?auto_139844 ) ) ( not ( = ?auto_139841 ?auto_139845 ) ) ( not ( = ?auto_139842 ?auto_139843 ) ) ( not ( = ?auto_139842 ?auto_139844 ) ) ( not ( = ?auto_139842 ?auto_139845 ) ) ( not ( = ?auto_139843 ?auto_139844 ) ) ( not ( = ?auto_139843 ?auto_139845 ) ) ( not ( = ?auto_139844 ?auto_139845 ) ) ( ON ?auto_139843 ?auto_139844 ) ( ON ?auto_139842 ?auto_139843 ) ( ON ?auto_139841 ?auto_139842 ) ( ON ?auto_139840 ?auto_139841 ) ( CLEAR ?auto_139838 ) ( ON ?auto_139839 ?auto_139840 ) ( CLEAR ?auto_139839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139838 ?auto_139839 )
      ( MAKE-7PILE ?auto_139838 ?auto_139839 ?auto_139840 ?auto_139841 ?auto_139842 ?auto_139843 ?auto_139844 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139853 - BLOCK
      ?auto_139854 - BLOCK
      ?auto_139855 - BLOCK
      ?auto_139856 - BLOCK
      ?auto_139857 - BLOCK
      ?auto_139858 - BLOCK
      ?auto_139859 - BLOCK
    )
    :vars
    (
      ?auto_139860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139859 ?auto_139860 ) ( not ( = ?auto_139853 ?auto_139854 ) ) ( not ( = ?auto_139853 ?auto_139855 ) ) ( not ( = ?auto_139853 ?auto_139856 ) ) ( not ( = ?auto_139853 ?auto_139857 ) ) ( not ( = ?auto_139853 ?auto_139858 ) ) ( not ( = ?auto_139853 ?auto_139859 ) ) ( not ( = ?auto_139853 ?auto_139860 ) ) ( not ( = ?auto_139854 ?auto_139855 ) ) ( not ( = ?auto_139854 ?auto_139856 ) ) ( not ( = ?auto_139854 ?auto_139857 ) ) ( not ( = ?auto_139854 ?auto_139858 ) ) ( not ( = ?auto_139854 ?auto_139859 ) ) ( not ( = ?auto_139854 ?auto_139860 ) ) ( not ( = ?auto_139855 ?auto_139856 ) ) ( not ( = ?auto_139855 ?auto_139857 ) ) ( not ( = ?auto_139855 ?auto_139858 ) ) ( not ( = ?auto_139855 ?auto_139859 ) ) ( not ( = ?auto_139855 ?auto_139860 ) ) ( not ( = ?auto_139856 ?auto_139857 ) ) ( not ( = ?auto_139856 ?auto_139858 ) ) ( not ( = ?auto_139856 ?auto_139859 ) ) ( not ( = ?auto_139856 ?auto_139860 ) ) ( not ( = ?auto_139857 ?auto_139858 ) ) ( not ( = ?auto_139857 ?auto_139859 ) ) ( not ( = ?auto_139857 ?auto_139860 ) ) ( not ( = ?auto_139858 ?auto_139859 ) ) ( not ( = ?auto_139858 ?auto_139860 ) ) ( not ( = ?auto_139859 ?auto_139860 ) ) ( ON ?auto_139858 ?auto_139859 ) ( ON ?auto_139857 ?auto_139858 ) ( ON ?auto_139856 ?auto_139857 ) ( ON ?auto_139855 ?auto_139856 ) ( ON ?auto_139854 ?auto_139855 ) ( ON ?auto_139853 ?auto_139854 ) ( CLEAR ?auto_139853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139853 )
      ( MAKE-7PILE ?auto_139853 ?auto_139854 ?auto_139855 ?auto_139856 ?auto_139857 ?auto_139858 ?auto_139859 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139868 - BLOCK
      ?auto_139869 - BLOCK
      ?auto_139870 - BLOCK
      ?auto_139871 - BLOCK
      ?auto_139872 - BLOCK
      ?auto_139873 - BLOCK
      ?auto_139874 - BLOCK
    )
    :vars
    (
      ?auto_139875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139874 ?auto_139875 ) ( not ( = ?auto_139868 ?auto_139869 ) ) ( not ( = ?auto_139868 ?auto_139870 ) ) ( not ( = ?auto_139868 ?auto_139871 ) ) ( not ( = ?auto_139868 ?auto_139872 ) ) ( not ( = ?auto_139868 ?auto_139873 ) ) ( not ( = ?auto_139868 ?auto_139874 ) ) ( not ( = ?auto_139868 ?auto_139875 ) ) ( not ( = ?auto_139869 ?auto_139870 ) ) ( not ( = ?auto_139869 ?auto_139871 ) ) ( not ( = ?auto_139869 ?auto_139872 ) ) ( not ( = ?auto_139869 ?auto_139873 ) ) ( not ( = ?auto_139869 ?auto_139874 ) ) ( not ( = ?auto_139869 ?auto_139875 ) ) ( not ( = ?auto_139870 ?auto_139871 ) ) ( not ( = ?auto_139870 ?auto_139872 ) ) ( not ( = ?auto_139870 ?auto_139873 ) ) ( not ( = ?auto_139870 ?auto_139874 ) ) ( not ( = ?auto_139870 ?auto_139875 ) ) ( not ( = ?auto_139871 ?auto_139872 ) ) ( not ( = ?auto_139871 ?auto_139873 ) ) ( not ( = ?auto_139871 ?auto_139874 ) ) ( not ( = ?auto_139871 ?auto_139875 ) ) ( not ( = ?auto_139872 ?auto_139873 ) ) ( not ( = ?auto_139872 ?auto_139874 ) ) ( not ( = ?auto_139872 ?auto_139875 ) ) ( not ( = ?auto_139873 ?auto_139874 ) ) ( not ( = ?auto_139873 ?auto_139875 ) ) ( not ( = ?auto_139874 ?auto_139875 ) ) ( ON ?auto_139873 ?auto_139874 ) ( ON ?auto_139872 ?auto_139873 ) ( ON ?auto_139871 ?auto_139872 ) ( ON ?auto_139870 ?auto_139871 ) ( ON ?auto_139869 ?auto_139870 ) ( ON ?auto_139868 ?auto_139869 ) ( CLEAR ?auto_139868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139868 )
      ( MAKE-7PILE ?auto_139868 ?auto_139869 ?auto_139870 ?auto_139871 ?auto_139872 ?auto_139873 ?auto_139874 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139884 - BLOCK
      ?auto_139885 - BLOCK
      ?auto_139886 - BLOCK
      ?auto_139887 - BLOCK
      ?auto_139888 - BLOCK
      ?auto_139889 - BLOCK
      ?auto_139890 - BLOCK
      ?auto_139891 - BLOCK
    )
    :vars
    (
      ?auto_139892 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_139890 ) ( ON ?auto_139891 ?auto_139892 ) ( CLEAR ?auto_139891 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139884 ) ( ON ?auto_139885 ?auto_139884 ) ( ON ?auto_139886 ?auto_139885 ) ( ON ?auto_139887 ?auto_139886 ) ( ON ?auto_139888 ?auto_139887 ) ( ON ?auto_139889 ?auto_139888 ) ( ON ?auto_139890 ?auto_139889 ) ( not ( = ?auto_139884 ?auto_139885 ) ) ( not ( = ?auto_139884 ?auto_139886 ) ) ( not ( = ?auto_139884 ?auto_139887 ) ) ( not ( = ?auto_139884 ?auto_139888 ) ) ( not ( = ?auto_139884 ?auto_139889 ) ) ( not ( = ?auto_139884 ?auto_139890 ) ) ( not ( = ?auto_139884 ?auto_139891 ) ) ( not ( = ?auto_139884 ?auto_139892 ) ) ( not ( = ?auto_139885 ?auto_139886 ) ) ( not ( = ?auto_139885 ?auto_139887 ) ) ( not ( = ?auto_139885 ?auto_139888 ) ) ( not ( = ?auto_139885 ?auto_139889 ) ) ( not ( = ?auto_139885 ?auto_139890 ) ) ( not ( = ?auto_139885 ?auto_139891 ) ) ( not ( = ?auto_139885 ?auto_139892 ) ) ( not ( = ?auto_139886 ?auto_139887 ) ) ( not ( = ?auto_139886 ?auto_139888 ) ) ( not ( = ?auto_139886 ?auto_139889 ) ) ( not ( = ?auto_139886 ?auto_139890 ) ) ( not ( = ?auto_139886 ?auto_139891 ) ) ( not ( = ?auto_139886 ?auto_139892 ) ) ( not ( = ?auto_139887 ?auto_139888 ) ) ( not ( = ?auto_139887 ?auto_139889 ) ) ( not ( = ?auto_139887 ?auto_139890 ) ) ( not ( = ?auto_139887 ?auto_139891 ) ) ( not ( = ?auto_139887 ?auto_139892 ) ) ( not ( = ?auto_139888 ?auto_139889 ) ) ( not ( = ?auto_139888 ?auto_139890 ) ) ( not ( = ?auto_139888 ?auto_139891 ) ) ( not ( = ?auto_139888 ?auto_139892 ) ) ( not ( = ?auto_139889 ?auto_139890 ) ) ( not ( = ?auto_139889 ?auto_139891 ) ) ( not ( = ?auto_139889 ?auto_139892 ) ) ( not ( = ?auto_139890 ?auto_139891 ) ) ( not ( = ?auto_139890 ?auto_139892 ) ) ( not ( = ?auto_139891 ?auto_139892 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139891 ?auto_139892 )
      ( !STACK ?auto_139891 ?auto_139890 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139901 - BLOCK
      ?auto_139902 - BLOCK
      ?auto_139903 - BLOCK
      ?auto_139904 - BLOCK
      ?auto_139905 - BLOCK
      ?auto_139906 - BLOCK
      ?auto_139907 - BLOCK
      ?auto_139908 - BLOCK
    )
    :vars
    (
      ?auto_139909 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_139907 ) ( ON ?auto_139908 ?auto_139909 ) ( CLEAR ?auto_139908 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139901 ) ( ON ?auto_139902 ?auto_139901 ) ( ON ?auto_139903 ?auto_139902 ) ( ON ?auto_139904 ?auto_139903 ) ( ON ?auto_139905 ?auto_139904 ) ( ON ?auto_139906 ?auto_139905 ) ( ON ?auto_139907 ?auto_139906 ) ( not ( = ?auto_139901 ?auto_139902 ) ) ( not ( = ?auto_139901 ?auto_139903 ) ) ( not ( = ?auto_139901 ?auto_139904 ) ) ( not ( = ?auto_139901 ?auto_139905 ) ) ( not ( = ?auto_139901 ?auto_139906 ) ) ( not ( = ?auto_139901 ?auto_139907 ) ) ( not ( = ?auto_139901 ?auto_139908 ) ) ( not ( = ?auto_139901 ?auto_139909 ) ) ( not ( = ?auto_139902 ?auto_139903 ) ) ( not ( = ?auto_139902 ?auto_139904 ) ) ( not ( = ?auto_139902 ?auto_139905 ) ) ( not ( = ?auto_139902 ?auto_139906 ) ) ( not ( = ?auto_139902 ?auto_139907 ) ) ( not ( = ?auto_139902 ?auto_139908 ) ) ( not ( = ?auto_139902 ?auto_139909 ) ) ( not ( = ?auto_139903 ?auto_139904 ) ) ( not ( = ?auto_139903 ?auto_139905 ) ) ( not ( = ?auto_139903 ?auto_139906 ) ) ( not ( = ?auto_139903 ?auto_139907 ) ) ( not ( = ?auto_139903 ?auto_139908 ) ) ( not ( = ?auto_139903 ?auto_139909 ) ) ( not ( = ?auto_139904 ?auto_139905 ) ) ( not ( = ?auto_139904 ?auto_139906 ) ) ( not ( = ?auto_139904 ?auto_139907 ) ) ( not ( = ?auto_139904 ?auto_139908 ) ) ( not ( = ?auto_139904 ?auto_139909 ) ) ( not ( = ?auto_139905 ?auto_139906 ) ) ( not ( = ?auto_139905 ?auto_139907 ) ) ( not ( = ?auto_139905 ?auto_139908 ) ) ( not ( = ?auto_139905 ?auto_139909 ) ) ( not ( = ?auto_139906 ?auto_139907 ) ) ( not ( = ?auto_139906 ?auto_139908 ) ) ( not ( = ?auto_139906 ?auto_139909 ) ) ( not ( = ?auto_139907 ?auto_139908 ) ) ( not ( = ?auto_139907 ?auto_139909 ) ) ( not ( = ?auto_139908 ?auto_139909 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139908 ?auto_139909 )
      ( !STACK ?auto_139908 ?auto_139907 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139918 - BLOCK
      ?auto_139919 - BLOCK
      ?auto_139920 - BLOCK
      ?auto_139921 - BLOCK
      ?auto_139922 - BLOCK
      ?auto_139923 - BLOCK
      ?auto_139924 - BLOCK
      ?auto_139925 - BLOCK
    )
    :vars
    (
      ?auto_139926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139925 ?auto_139926 ) ( ON-TABLE ?auto_139918 ) ( ON ?auto_139919 ?auto_139918 ) ( ON ?auto_139920 ?auto_139919 ) ( ON ?auto_139921 ?auto_139920 ) ( ON ?auto_139922 ?auto_139921 ) ( ON ?auto_139923 ?auto_139922 ) ( not ( = ?auto_139918 ?auto_139919 ) ) ( not ( = ?auto_139918 ?auto_139920 ) ) ( not ( = ?auto_139918 ?auto_139921 ) ) ( not ( = ?auto_139918 ?auto_139922 ) ) ( not ( = ?auto_139918 ?auto_139923 ) ) ( not ( = ?auto_139918 ?auto_139924 ) ) ( not ( = ?auto_139918 ?auto_139925 ) ) ( not ( = ?auto_139918 ?auto_139926 ) ) ( not ( = ?auto_139919 ?auto_139920 ) ) ( not ( = ?auto_139919 ?auto_139921 ) ) ( not ( = ?auto_139919 ?auto_139922 ) ) ( not ( = ?auto_139919 ?auto_139923 ) ) ( not ( = ?auto_139919 ?auto_139924 ) ) ( not ( = ?auto_139919 ?auto_139925 ) ) ( not ( = ?auto_139919 ?auto_139926 ) ) ( not ( = ?auto_139920 ?auto_139921 ) ) ( not ( = ?auto_139920 ?auto_139922 ) ) ( not ( = ?auto_139920 ?auto_139923 ) ) ( not ( = ?auto_139920 ?auto_139924 ) ) ( not ( = ?auto_139920 ?auto_139925 ) ) ( not ( = ?auto_139920 ?auto_139926 ) ) ( not ( = ?auto_139921 ?auto_139922 ) ) ( not ( = ?auto_139921 ?auto_139923 ) ) ( not ( = ?auto_139921 ?auto_139924 ) ) ( not ( = ?auto_139921 ?auto_139925 ) ) ( not ( = ?auto_139921 ?auto_139926 ) ) ( not ( = ?auto_139922 ?auto_139923 ) ) ( not ( = ?auto_139922 ?auto_139924 ) ) ( not ( = ?auto_139922 ?auto_139925 ) ) ( not ( = ?auto_139922 ?auto_139926 ) ) ( not ( = ?auto_139923 ?auto_139924 ) ) ( not ( = ?auto_139923 ?auto_139925 ) ) ( not ( = ?auto_139923 ?auto_139926 ) ) ( not ( = ?auto_139924 ?auto_139925 ) ) ( not ( = ?auto_139924 ?auto_139926 ) ) ( not ( = ?auto_139925 ?auto_139926 ) ) ( CLEAR ?auto_139923 ) ( ON ?auto_139924 ?auto_139925 ) ( CLEAR ?auto_139924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_139918 ?auto_139919 ?auto_139920 ?auto_139921 ?auto_139922 ?auto_139923 ?auto_139924 )
      ( MAKE-8PILE ?auto_139918 ?auto_139919 ?auto_139920 ?auto_139921 ?auto_139922 ?auto_139923 ?auto_139924 ?auto_139925 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139935 - BLOCK
      ?auto_139936 - BLOCK
      ?auto_139937 - BLOCK
      ?auto_139938 - BLOCK
      ?auto_139939 - BLOCK
      ?auto_139940 - BLOCK
      ?auto_139941 - BLOCK
      ?auto_139942 - BLOCK
    )
    :vars
    (
      ?auto_139943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139942 ?auto_139943 ) ( ON-TABLE ?auto_139935 ) ( ON ?auto_139936 ?auto_139935 ) ( ON ?auto_139937 ?auto_139936 ) ( ON ?auto_139938 ?auto_139937 ) ( ON ?auto_139939 ?auto_139938 ) ( ON ?auto_139940 ?auto_139939 ) ( not ( = ?auto_139935 ?auto_139936 ) ) ( not ( = ?auto_139935 ?auto_139937 ) ) ( not ( = ?auto_139935 ?auto_139938 ) ) ( not ( = ?auto_139935 ?auto_139939 ) ) ( not ( = ?auto_139935 ?auto_139940 ) ) ( not ( = ?auto_139935 ?auto_139941 ) ) ( not ( = ?auto_139935 ?auto_139942 ) ) ( not ( = ?auto_139935 ?auto_139943 ) ) ( not ( = ?auto_139936 ?auto_139937 ) ) ( not ( = ?auto_139936 ?auto_139938 ) ) ( not ( = ?auto_139936 ?auto_139939 ) ) ( not ( = ?auto_139936 ?auto_139940 ) ) ( not ( = ?auto_139936 ?auto_139941 ) ) ( not ( = ?auto_139936 ?auto_139942 ) ) ( not ( = ?auto_139936 ?auto_139943 ) ) ( not ( = ?auto_139937 ?auto_139938 ) ) ( not ( = ?auto_139937 ?auto_139939 ) ) ( not ( = ?auto_139937 ?auto_139940 ) ) ( not ( = ?auto_139937 ?auto_139941 ) ) ( not ( = ?auto_139937 ?auto_139942 ) ) ( not ( = ?auto_139937 ?auto_139943 ) ) ( not ( = ?auto_139938 ?auto_139939 ) ) ( not ( = ?auto_139938 ?auto_139940 ) ) ( not ( = ?auto_139938 ?auto_139941 ) ) ( not ( = ?auto_139938 ?auto_139942 ) ) ( not ( = ?auto_139938 ?auto_139943 ) ) ( not ( = ?auto_139939 ?auto_139940 ) ) ( not ( = ?auto_139939 ?auto_139941 ) ) ( not ( = ?auto_139939 ?auto_139942 ) ) ( not ( = ?auto_139939 ?auto_139943 ) ) ( not ( = ?auto_139940 ?auto_139941 ) ) ( not ( = ?auto_139940 ?auto_139942 ) ) ( not ( = ?auto_139940 ?auto_139943 ) ) ( not ( = ?auto_139941 ?auto_139942 ) ) ( not ( = ?auto_139941 ?auto_139943 ) ) ( not ( = ?auto_139942 ?auto_139943 ) ) ( CLEAR ?auto_139940 ) ( ON ?auto_139941 ?auto_139942 ) ( CLEAR ?auto_139941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_139935 ?auto_139936 ?auto_139937 ?auto_139938 ?auto_139939 ?auto_139940 ?auto_139941 )
      ( MAKE-8PILE ?auto_139935 ?auto_139936 ?auto_139937 ?auto_139938 ?auto_139939 ?auto_139940 ?auto_139941 ?auto_139942 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139952 - BLOCK
      ?auto_139953 - BLOCK
      ?auto_139954 - BLOCK
      ?auto_139955 - BLOCK
      ?auto_139956 - BLOCK
      ?auto_139957 - BLOCK
      ?auto_139958 - BLOCK
      ?auto_139959 - BLOCK
    )
    :vars
    (
      ?auto_139960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139959 ?auto_139960 ) ( ON-TABLE ?auto_139952 ) ( ON ?auto_139953 ?auto_139952 ) ( ON ?auto_139954 ?auto_139953 ) ( ON ?auto_139955 ?auto_139954 ) ( ON ?auto_139956 ?auto_139955 ) ( not ( = ?auto_139952 ?auto_139953 ) ) ( not ( = ?auto_139952 ?auto_139954 ) ) ( not ( = ?auto_139952 ?auto_139955 ) ) ( not ( = ?auto_139952 ?auto_139956 ) ) ( not ( = ?auto_139952 ?auto_139957 ) ) ( not ( = ?auto_139952 ?auto_139958 ) ) ( not ( = ?auto_139952 ?auto_139959 ) ) ( not ( = ?auto_139952 ?auto_139960 ) ) ( not ( = ?auto_139953 ?auto_139954 ) ) ( not ( = ?auto_139953 ?auto_139955 ) ) ( not ( = ?auto_139953 ?auto_139956 ) ) ( not ( = ?auto_139953 ?auto_139957 ) ) ( not ( = ?auto_139953 ?auto_139958 ) ) ( not ( = ?auto_139953 ?auto_139959 ) ) ( not ( = ?auto_139953 ?auto_139960 ) ) ( not ( = ?auto_139954 ?auto_139955 ) ) ( not ( = ?auto_139954 ?auto_139956 ) ) ( not ( = ?auto_139954 ?auto_139957 ) ) ( not ( = ?auto_139954 ?auto_139958 ) ) ( not ( = ?auto_139954 ?auto_139959 ) ) ( not ( = ?auto_139954 ?auto_139960 ) ) ( not ( = ?auto_139955 ?auto_139956 ) ) ( not ( = ?auto_139955 ?auto_139957 ) ) ( not ( = ?auto_139955 ?auto_139958 ) ) ( not ( = ?auto_139955 ?auto_139959 ) ) ( not ( = ?auto_139955 ?auto_139960 ) ) ( not ( = ?auto_139956 ?auto_139957 ) ) ( not ( = ?auto_139956 ?auto_139958 ) ) ( not ( = ?auto_139956 ?auto_139959 ) ) ( not ( = ?auto_139956 ?auto_139960 ) ) ( not ( = ?auto_139957 ?auto_139958 ) ) ( not ( = ?auto_139957 ?auto_139959 ) ) ( not ( = ?auto_139957 ?auto_139960 ) ) ( not ( = ?auto_139958 ?auto_139959 ) ) ( not ( = ?auto_139958 ?auto_139960 ) ) ( not ( = ?auto_139959 ?auto_139960 ) ) ( ON ?auto_139958 ?auto_139959 ) ( CLEAR ?auto_139956 ) ( ON ?auto_139957 ?auto_139958 ) ( CLEAR ?auto_139957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139952 ?auto_139953 ?auto_139954 ?auto_139955 ?auto_139956 ?auto_139957 )
      ( MAKE-8PILE ?auto_139952 ?auto_139953 ?auto_139954 ?auto_139955 ?auto_139956 ?auto_139957 ?auto_139958 ?auto_139959 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139969 - BLOCK
      ?auto_139970 - BLOCK
      ?auto_139971 - BLOCK
      ?auto_139972 - BLOCK
      ?auto_139973 - BLOCK
      ?auto_139974 - BLOCK
      ?auto_139975 - BLOCK
      ?auto_139976 - BLOCK
    )
    :vars
    (
      ?auto_139977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139976 ?auto_139977 ) ( ON-TABLE ?auto_139969 ) ( ON ?auto_139970 ?auto_139969 ) ( ON ?auto_139971 ?auto_139970 ) ( ON ?auto_139972 ?auto_139971 ) ( ON ?auto_139973 ?auto_139972 ) ( not ( = ?auto_139969 ?auto_139970 ) ) ( not ( = ?auto_139969 ?auto_139971 ) ) ( not ( = ?auto_139969 ?auto_139972 ) ) ( not ( = ?auto_139969 ?auto_139973 ) ) ( not ( = ?auto_139969 ?auto_139974 ) ) ( not ( = ?auto_139969 ?auto_139975 ) ) ( not ( = ?auto_139969 ?auto_139976 ) ) ( not ( = ?auto_139969 ?auto_139977 ) ) ( not ( = ?auto_139970 ?auto_139971 ) ) ( not ( = ?auto_139970 ?auto_139972 ) ) ( not ( = ?auto_139970 ?auto_139973 ) ) ( not ( = ?auto_139970 ?auto_139974 ) ) ( not ( = ?auto_139970 ?auto_139975 ) ) ( not ( = ?auto_139970 ?auto_139976 ) ) ( not ( = ?auto_139970 ?auto_139977 ) ) ( not ( = ?auto_139971 ?auto_139972 ) ) ( not ( = ?auto_139971 ?auto_139973 ) ) ( not ( = ?auto_139971 ?auto_139974 ) ) ( not ( = ?auto_139971 ?auto_139975 ) ) ( not ( = ?auto_139971 ?auto_139976 ) ) ( not ( = ?auto_139971 ?auto_139977 ) ) ( not ( = ?auto_139972 ?auto_139973 ) ) ( not ( = ?auto_139972 ?auto_139974 ) ) ( not ( = ?auto_139972 ?auto_139975 ) ) ( not ( = ?auto_139972 ?auto_139976 ) ) ( not ( = ?auto_139972 ?auto_139977 ) ) ( not ( = ?auto_139973 ?auto_139974 ) ) ( not ( = ?auto_139973 ?auto_139975 ) ) ( not ( = ?auto_139973 ?auto_139976 ) ) ( not ( = ?auto_139973 ?auto_139977 ) ) ( not ( = ?auto_139974 ?auto_139975 ) ) ( not ( = ?auto_139974 ?auto_139976 ) ) ( not ( = ?auto_139974 ?auto_139977 ) ) ( not ( = ?auto_139975 ?auto_139976 ) ) ( not ( = ?auto_139975 ?auto_139977 ) ) ( not ( = ?auto_139976 ?auto_139977 ) ) ( ON ?auto_139975 ?auto_139976 ) ( CLEAR ?auto_139973 ) ( ON ?auto_139974 ?auto_139975 ) ( CLEAR ?auto_139974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139969 ?auto_139970 ?auto_139971 ?auto_139972 ?auto_139973 ?auto_139974 )
      ( MAKE-8PILE ?auto_139969 ?auto_139970 ?auto_139971 ?auto_139972 ?auto_139973 ?auto_139974 ?auto_139975 ?auto_139976 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139986 - BLOCK
      ?auto_139987 - BLOCK
      ?auto_139988 - BLOCK
      ?auto_139989 - BLOCK
      ?auto_139990 - BLOCK
      ?auto_139991 - BLOCK
      ?auto_139992 - BLOCK
      ?auto_139993 - BLOCK
    )
    :vars
    (
      ?auto_139994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139993 ?auto_139994 ) ( ON-TABLE ?auto_139986 ) ( ON ?auto_139987 ?auto_139986 ) ( ON ?auto_139988 ?auto_139987 ) ( ON ?auto_139989 ?auto_139988 ) ( not ( = ?auto_139986 ?auto_139987 ) ) ( not ( = ?auto_139986 ?auto_139988 ) ) ( not ( = ?auto_139986 ?auto_139989 ) ) ( not ( = ?auto_139986 ?auto_139990 ) ) ( not ( = ?auto_139986 ?auto_139991 ) ) ( not ( = ?auto_139986 ?auto_139992 ) ) ( not ( = ?auto_139986 ?auto_139993 ) ) ( not ( = ?auto_139986 ?auto_139994 ) ) ( not ( = ?auto_139987 ?auto_139988 ) ) ( not ( = ?auto_139987 ?auto_139989 ) ) ( not ( = ?auto_139987 ?auto_139990 ) ) ( not ( = ?auto_139987 ?auto_139991 ) ) ( not ( = ?auto_139987 ?auto_139992 ) ) ( not ( = ?auto_139987 ?auto_139993 ) ) ( not ( = ?auto_139987 ?auto_139994 ) ) ( not ( = ?auto_139988 ?auto_139989 ) ) ( not ( = ?auto_139988 ?auto_139990 ) ) ( not ( = ?auto_139988 ?auto_139991 ) ) ( not ( = ?auto_139988 ?auto_139992 ) ) ( not ( = ?auto_139988 ?auto_139993 ) ) ( not ( = ?auto_139988 ?auto_139994 ) ) ( not ( = ?auto_139989 ?auto_139990 ) ) ( not ( = ?auto_139989 ?auto_139991 ) ) ( not ( = ?auto_139989 ?auto_139992 ) ) ( not ( = ?auto_139989 ?auto_139993 ) ) ( not ( = ?auto_139989 ?auto_139994 ) ) ( not ( = ?auto_139990 ?auto_139991 ) ) ( not ( = ?auto_139990 ?auto_139992 ) ) ( not ( = ?auto_139990 ?auto_139993 ) ) ( not ( = ?auto_139990 ?auto_139994 ) ) ( not ( = ?auto_139991 ?auto_139992 ) ) ( not ( = ?auto_139991 ?auto_139993 ) ) ( not ( = ?auto_139991 ?auto_139994 ) ) ( not ( = ?auto_139992 ?auto_139993 ) ) ( not ( = ?auto_139992 ?auto_139994 ) ) ( not ( = ?auto_139993 ?auto_139994 ) ) ( ON ?auto_139992 ?auto_139993 ) ( ON ?auto_139991 ?auto_139992 ) ( CLEAR ?auto_139989 ) ( ON ?auto_139990 ?auto_139991 ) ( CLEAR ?auto_139990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139986 ?auto_139987 ?auto_139988 ?auto_139989 ?auto_139990 )
      ( MAKE-8PILE ?auto_139986 ?auto_139987 ?auto_139988 ?auto_139989 ?auto_139990 ?auto_139991 ?auto_139992 ?auto_139993 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_140003 - BLOCK
      ?auto_140004 - BLOCK
      ?auto_140005 - BLOCK
      ?auto_140006 - BLOCK
      ?auto_140007 - BLOCK
      ?auto_140008 - BLOCK
      ?auto_140009 - BLOCK
      ?auto_140010 - BLOCK
    )
    :vars
    (
      ?auto_140011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140010 ?auto_140011 ) ( ON-TABLE ?auto_140003 ) ( ON ?auto_140004 ?auto_140003 ) ( ON ?auto_140005 ?auto_140004 ) ( ON ?auto_140006 ?auto_140005 ) ( not ( = ?auto_140003 ?auto_140004 ) ) ( not ( = ?auto_140003 ?auto_140005 ) ) ( not ( = ?auto_140003 ?auto_140006 ) ) ( not ( = ?auto_140003 ?auto_140007 ) ) ( not ( = ?auto_140003 ?auto_140008 ) ) ( not ( = ?auto_140003 ?auto_140009 ) ) ( not ( = ?auto_140003 ?auto_140010 ) ) ( not ( = ?auto_140003 ?auto_140011 ) ) ( not ( = ?auto_140004 ?auto_140005 ) ) ( not ( = ?auto_140004 ?auto_140006 ) ) ( not ( = ?auto_140004 ?auto_140007 ) ) ( not ( = ?auto_140004 ?auto_140008 ) ) ( not ( = ?auto_140004 ?auto_140009 ) ) ( not ( = ?auto_140004 ?auto_140010 ) ) ( not ( = ?auto_140004 ?auto_140011 ) ) ( not ( = ?auto_140005 ?auto_140006 ) ) ( not ( = ?auto_140005 ?auto_140007 ) ) ( not ( = ?auto_140005 ?auto_140008 ) ) ( not ( = ?auto_140005 ?auto_140009 ) ) ( not ( = ?auto_140005 ?auto_140010 ) ) ( not ( = ?auto_140005 ?auto_140011 ) ) ( not ( = ?auto_140006 ?auto_140007 ) ) ( not ( = ?auto_140006 ?auto_140008 ) ) ( not ( = ?auto_140006 ?auto_140009 ) ) ( not ( = ?auto_140006 ?auto_140010 ) ) ( not ( = ?auto_140006 ?auto_140011 ) ) ( not ( = ?auto_140007 ?auto_140008 ) ) ( not ( = ?auto_140007 ?auto_140009 ) ) ( not ( = ?auto_140007 ?auto_140010 ) ) ( not ( = ?auto_140007 ?auto_140011 ) ) ( not ( = ?auto_140008 ?auto_140009 ) ) ( not ( = ?auto_140008 ?auto_140010 ) ) ( not ( = ?auto_140008 ?auto_140011 ) ) ( not ( = ?auto_140009 ?auto_140010 ) ) ( not ( = ?auto_140009 ?auto_140011 ) ) ( not ( = ?auto_140010 ?auto_140011 ) ) ( ON ?auto_140009 ?auto_140010 ) ( ON ?auto_140008 ?auto_140009 ) ( CLEAR ?auto_140006 ) ( ON ?auto_140007 ?auto_140008 ) ( CLEAR ?auto_140007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140003 ?auto_140004 ?auto_140005 ?auto_140006 ?auto_140007 )
      ( MAKE-8PILE ?auto_140003 ?auto_140004 ?auto_140005 ?auto_140006 ?auto_140007 ?auto_140008 ?auto_140009 ?auto_140010 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_140020 - BLOCK
      ?auto_140021 - BLOCK
      ?auto_140022 - BLOCK
      ?auto_140023 - BLOCK
      ?auto_140024 - BLOCK
      ?auto_140025 - BLOCK
      ?auto_140026 - BLOCK
      ?auto_140027 - BLOCK
    )
    :vars
    (
      ?auto_140028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140027 ?auto_140028 ) ( ON-TABLE ?auto_140020 ) ( ON ?auto_140021 ?auto_140020 ) ( ON ?auto_140022 ?auto_140021 ) ( not ( = ?auto_140020 ?auto_140021 ) ) ( not ( = ?auto_140020 ?auto_140022 ) ) ( not ( = ?auto_140020 ?auto_140023 ) ) ( not ( = ?auto_140020 ?auto_140024 ) ) ( not ( = ?auto_140020 ?auto_140025 ) ) ( not ( = ?auto_140020 ?auto_140026 ) ) ( not ( = ?auto_140020 ?auto_140027 ) ) ( not ( = ?auto_140020 ?auto_140028 ) ) ( not ( = ?auto_140021 ?auto_140022 ) ) ( not ( = ?auto_140021 ?auto_140023 ) ) ( not ( = ?auto_140021 ?auto_140024 ) ) ( not ( = ?auto_140021 ?auto_140025 ) ) ( not ( = ?auto_140021 ?auto_140026 ) ) ( not ( = ?auto_140021 ?auto_140027 ) ) ( not ( = ?auto_140021 ?auto_140028 ) ) ( not ( = ?auto_140022 ?auto_140023 ) ) ( not ( = ?auto_140022 ?auto_140024 ) ) ( not ( = ?auto_140022 ?auto_140025 ) ) ( not ( = ?auto_140022 ?auto_140026 ) ) ( not ( = ?auto_140022 ?auto_140027 ) ) ( not ( = ?auto_140022 ?auto_140028 ) ) ( not ( = ?auto_140023 ?auto_140024 ) ) ( not ( = ?auto_140023 ?auto_140025 ) ) ( not ( = ?auto_140023 ?auto_140026 ) ) ( not ( = ?auto_140023 ?auto_140027 ) ) ( not ( = ?auto_140023 ?auto_140028 ) ) ( not ( = ?auto_140024 ?auto_140025 ) ) ( not ( = ?auto_140024 ?auto_140026 ) ) ( not ( = ?auto_140024 ?auto_140027 ) ) ( not ( = ?auto_140024 ?auto_140028 ) ) ( not ( = ?auto_140025 ?auto_140026 ) ) ( not ( = ?auto_140025 ?auto_140027 ) ) ( not ( = ?auto_140025 ?auto_140028 ) ) ( not ( = ?auto_140026 ?auto_140027 ) ) ( not ( = ?auto_140026 ?auto_140028 ) ) ( not ( = ?auto_140027 ?auto_140028 ) ) ( ON ?auto_140026 ?auto_140027 ) ( ON ?auto_140025 ?auto_140026 ) ( ON ?auto_140024 ?auto_140025 ) ( CLEAR ?auto_140022 ) ( ON ?auto_140023 ?auto_140024 ) ( CLEAR ?auto_140023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140020 ?auto_140021 ?auto_140022 ?auto_140023 )
      ( MAKE-8PILE ?auto_140020 ?auto_140021 ?auto_140022 ?auto_140023 ?auto_140024 ?auto_140025 ?auto_140026 ?auto_140027 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_140037 - BLOCK
      ?auto_140038 - BLOCK
      ?auto_140039 - BLOCK
      ?auto_140040 - BLOCK
      ?auto_140041 - BLOCK
      ?auto_140042 - BLOCK
      ?auto_140043 - BLOCK
      ?auto_140044 - BLOCK
    )
    :vars
    (
      ?auto_140045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140044 ?auto_140045 ) ( ON-TABLE ?auto_140037 ) ( ON ?auto_140038 ?auto_140037 ) ( ON ?auto_140039 ?auto_140038 ) ( not ( = ?auto_140037 ?auto_140038 ) ) ( not ( = ?auto_140037 ?auto_140039 ) ) ( not ( = ?auto_140037 ?auto_140040 ) ) ( not ( = ?auto_140037 ?auto_140041 ) ) ( not ( = ?auto_140037 ?auto_140042 ) ) ( not ( = ?auto_140037 ?auto_140043 ) ) ( not ( = ?auto_140037 ?auto_140044 ) ) ( not ( = ?auto_140037 ?auto_140045 ) ) ( not ( = ?auto_140038 ?auto_140039 ) ) ( not ( = ?auto_140038 ?auto_140040 ) ) ( not ( = ?auto_140038 ?auto_140041 ) ) ( not ( = ?auto_140038 ?auto_140042 ) ) ( not ( = ?auto_140038 ?auto_140043 ) ) ( not ( = ?auto_140038 ?auto_140044 ) ) ( not ( = ?auto_140038 ?auto_140045 ) ) ( not ( = ?auto_140039 ?auto_140040 ) ) ( not ( = ?auto_140039 ?auto_140041 ) ) ( not ( = ?auto_140039 ?auto_140042 ) ) ( not ( = ?auto_140039 ?auto_140043 ) ) ( not ( = ?auto_140039 ?auto_140044 ) ) ( not ( = ?auto_140039 ?auto_140045 ) ) ( not ( = ?auto_140040 ?auto_140041 ) ) ( not ( = ?auto_140040 ?auto_140042 ) ) ( not ( = ?auto_140040 ?auto_140043 ) ) ( not ( = ?auto_140040 ?auto_140044 ) ) ( not ( = ?auto_140040 ?auto_140045 ) ) ( not ( = ?auto_140041 ?auto_140042 ) ) ( not ( = ?auto_140041 ?auto_140043 ) ) ( not ( = ?auto_140041 ?auto_140044 ) ) ( not ( = ?auto_140041 ?auto_140045 ) ) ( not ( = ?auto_140042 ?auto_140043 ) ) ( not ( = ?auto_140042 ?auto_140044 ) ) ( not ( = ?auto_140042 ?auto_140045 ) ) ( not ( = ?auto_140043 ?auto_140044 ) ) ( not ( = ?auto_140043 ?auto_140045 ) ) ( not ( = ?auto_140044 ?auto_140045 ) ) ( ON ?auto_140043 ?auto_140044 ) ( ON ?auto_140042 ?auto_140043 ) ( ON ?auto_140041 ?auto_140042 ) ( CLEAR ?auto_140039 ) ( ON ?auto_140040 ?auto_140041 ) ( CLEAR ?auto_140040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140037 ?auto_140038 ?auto_140039 ?auto_140040 )
      ( MAKE-8PILE ?auto_140037 ?auto_140038 ?auto_140039 ?auto_140040 ?auto_140041 ?auto_140042 ?auto_140043 ?auto_140044 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_140054 - BLOCK
      ?auto_140055 - BLOCK
      ?auto_140056 - BLOCK
      ?auto_140057 - BLOCK
      ?auto_140058 - BLOCK
      ?auto_140059 - BLOCK
      ?auto_140060 - BLOCK
      ?auto_140061 - BLOCK
    )
    :vars
    (
      ?auto_140062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140061 ?auto_140062 ) ( ON-TABLE ?auto_140054 ) ( ON ?auto_140055 ?auto_140054 ) ( not ( = ?auto_140054 ?auto_140055 ) ) ( not ( = ?auto_140054 ?auto_140056 ) ) ( not ( = ?auto_140054 ?auto_140057 ) ) ( not ( = ?auto_140054 ?auto_140058 ) ) ( not ( = ?auto_140054 ?auto_140059 ) ) ( not ( = ?auto_140054 ?auto_140060 ) ) ( not ( = ?auto_140054 ?auto_140061 ) ) ( not ( = ?auto_140054 ?auto_140062 ) ) ( not ( = ?auto_140055 ?auto_140056 ) ) ( not ( = ?auto_140055 ?auto_140057 ) ) ( not ( = ?auto_140055 ?auto_140058 ) ) ( not ( = ?auto_140055 ?auto_140059 ) ) ( not ( = ?auto_140055 ?auto_140060 ) ) ( not ( = ?auto_140055 ?auto_140061 ) ) ( not ( = ?auto_140055 ?auto_140062 ) ) ( not ( = ?auto_140056 ?auto_140057 ) ) ( not ( = ?auto_140056 ?auto_140058 ) ) ( not ( = ?auto_140056 ?auto_140059 ) ) ( not ( = ?auto_140056 ?auto_140060 ) ) ( not ( = ?auto_140056 ?auto_140061 ) ) ( not ( = ?auto_140056 ?auto_140062 ) ) ( not ( = ?auto_140057 ?auto_140058 ) ) ( not ( = ?auto_140057 ?auto_140059 ) ) ( not ( = ?auto_140057 ?auto_140060 ) ) ( not ( = ?auto_140057 ?auto_140061 ) ) ( not ( = ?auto_140057 ?auto_140062 ) ) ( not ( = ?auto_140058 ?auto_140059 ) ) ( not ( = ?auto_140058 ?auto_140060 ) ) ( not ( = ?auto_140058 ?auto_140061 ) ) ( not ( = ?auto_140058 ?auto_140062 ) ) ( not ( = ?auto_140059 ?auto_140060 ) ) ( not ( = ?auto_140059 ?auto_140061 ) ) ( not ( = ?auto_140059 ?auto_140062 ) ) ( not ( = ?auto_140060 ?auto_140061 ) ) ( not ( = ?auto_140060 ?auto_140062 ) ) ( not ( = ?auto_140061 ?auto_140062 ) ) ( ON ?auto_140060 ?auto_140061 ) ( ON ?auto_140059 ?auto_140060 ) ( ON ?auto_140058 ?auto_140059 ) ( ON ?auto_140057 ?auto_140058 ) ( CLEAR ?auto_140055 ) ( ON ?auto_140056 ?auto_140057 ) ( CLEAR ?auto_140056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140054 ?auto_140055 ?auto_140056 )
      ( MAKE-8PILE ?auto_140054 ?auto_140055 ?auto_140056 ?auto_140057 ?auto_140058 ?auto_140059 ?auto_140060 ?auto_140061 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_140071 - BLOCK
      ?auto_140072 - BLOCK
      ?auto_140073 - BLOCK
      ?auto_140074 - BLOCK
      ?auto_140075 - BLOCK
      ?auto_140076 - BLOCK
      ?auto_140077 - BLOCK
      ?auto_140078 - BLOCK
    )
    :vars
    (
      ?auto_140079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140078 ?auto_140079 ) ( ON-TABLE ?auto_140071 ) ( ON ?auto_140072 ?auto_140071 ) ( not ( = ?auto_140071 ?auto_140072 ) ) ( not ( = ?auto_140071 ?auto_140073 ) ) ( not ( = ?auto_140071 ?auto_140074 ) ) ( not ( = ?auto_140071 ?auto_140075 ) ) ( not ( = ?auto_140071 ?auto_140076 ) ) ( not ( = ?auto_140071 ?auto_140077 ) ) ( not ( = ?auto_140071 ?auto_140078 ) ) ( not ( = ?auto_140071 ?auto_140079 ) ) ( not ( = ?auto_140072 ?auto_140073 ) ) ( not ( = ?auto_140072 ?auto_140074 ) ) ( not ( = ?auto_140072 ?auto_140075 ) ) ( not ( = ?auto_140072 ?auto_140076 ) ) ( not ( = ?auto_140072 ?auto_140077 ) ) ( not ( = ?auto_140072 ?auto_140078 ) ) ( not ( = ?auto_140072 ?auto_140079 ) ) ( not ( = ?auto_140073 ?auto_140074 ) ) ( not ( = ?auto_140073 ?auto_140075 ) ) ( not ( = ?auto_140073 ?auto_140076 ) ) ( not ( = ?auto_140073 ?auto_140077 ) ) ( not ( = ?auto_140073 ?auto_140078 ) ) ( not ( = ?auto_140073 ?auto_140079 ) ) ( not ( = ?auto_140074 ?auto_140075 ) ) ( not ( = ?auto_140074 ?auto_140076 ) ) ( not ( = ?auto_140074 ?auto_140077 ) ) ( not ( = ?auto_140074 ?auto_140078 ) ) ( not ( = ?auto_140074 ?auto_140079 ) ) ( not ( = ?auto_140075 ?auto_140076 ) ) ( not ( = ?auto_140075 ?auto_140077 ) ) ( not ( = ?auto_140075 ?auto_140078 ) ) ( not ( = ?auto_140075 ?auto_140079 ) ) ( not ( = ?auto_140076 ?auto_140077 ) ) ( not ( = ?auto_140076 ?auto_140078 ) ) ( not ( = ?auto_140076 ?auto_140079 ) ) ( not ( = ?auto_140077 ?auto_140078 ) ) ( not ( = ?auto_140077 ?auto_140079 ) ) ( not ( = ?auto_140078 ?auto_140079 ) ) ( ON ?auto_140077 ?auto_140078 ) ( ON ?auto_140076 ?auto_140077 ) ( ON ?auto_140075 ?auto_140076 ) ( ON ?auto_140074 ?auto_140075 ) ( CLEAR ?auto_140072 ) ( ON ?auto_140073 ?auto_140074 ) ( CLEAR ?auto_140073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140071 ?auto_140072 ?auto_140073 )
      ( MAKE-8PILE ?auto_140071 ?auto_140072 ?auto_140073 ?auto_140074 ?auto_140075 ?auto_140076 ?auto_140077 ?auto_140078 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_140088 - BLOCK
      ?auto_140089 - BLOCK
      ?auto_140090 - BLOCK
      ?auto_140091 - BLOCK
      ?auto_140092 - BLOCK
      ?auto_140093 - BLOCK
      ?auto_140094 - BLOCK
      ?auto_140095 - BLOCK
    )
    :vars
    (
      ?auto_140096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140095 ?auto_140096 ) ( ON-TABLE ?auto_140088 ) ( not ( = ?auto_140088 ?auto_140089 ) ) ( not ( = ?auto_140088 ?auto_140090 ) ) ( not ( = ?auto_140088 ?auto_140091 ) ) ( not ( = ?auto_140088 ?auto_140092 ) ) ( not ( = ?auto_140088 ?auto_140093 ) ) ( not ( = ?auto_140088 ?auto_140094 ) ) ( not ( = ?auto_140088 ?auto_140095 ) ) ( not ( = ?auto_140088 ?auto_140096 ) ) ( not ( = ?auto_140089 ?auto_140090 ) ) ( not ( = ?auto_140089 ?auto_140091 ) ) ( not ( = ?auto_140089 ?auto_140092 ) ) ( not ( = ?auto_140089 ?auto_140093 ) ) ( not ( = ?auto_140089 ?auto_140094 ) ) ( not ( = ?auto_140089 ?auto_140095 ) ) ( not ( = ?auto_140089 ?auto_140096 ) ) ( not ( = ?auto_140090 ?auto_140091 ) ) ( not ( = ?auto_140090 ?auto_140092 ) ) ( not ( = ?auto_140090 ?auto_140093 ) ) ( not ( = ?auto_140090 ?auto_140094 ) ) ( not ( = ?auto_140090 ?auto_140095 ) ) ( not ( = ?auto_140090 ?auto_140096 ) ) ( not ( = ?auto_140091 ?auto_140092 ) ) ( not ( = ?auto_140091 ?auto_140093 ) ) ( not ( = ?auto_140091 ?auto_140094 ) ) ( not ( = ?auto_140091 ?auto_140095 ) ) ( not ( = ?auto_140091 ?auto_140096 ) ) ( not ( = ?auto_140092 ?auto_140093 ) ) ( not ( = ?auto_140092 ?auto_140094 ) ) ( not ( = ?auto_140092 ?auto_140095 ) ) ( not ( = ?auto_140092 ?auto_140096 ) ) ( not ( = ?auto_140093 ?auto_140094 ) ) ( not ( = ?auto_140093 ?auto_140095 ) ) ( not ( = ?auto_140093 ?auto_140096 ) ) ( not ( = ?auto_140094 ?auto_140095 ) ) ( not ( = ?auto_140094 ?auto_140096 ) ) ( not ( = ?auto_140095 ?auto_140096 ) ) ( ON ?auto_140094 ?auto_140095 ) ( ON ?auto_140093 ?auto_140094 ) ( ON ?auto_140092 ?auto_140093 ) ( ON ?auto_140091 ?auto_140092 ) ( ON ?auto_140090 ?auto_140091 ) ( CLEAR ?auto_140088 ) ( ON ?auto_140089 ?auto_140090 ) ( CLEAR ?auto_140089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140088 ?auto_140089 )
      ( MAKE-8PILE ?auto_140088 ?auto_140089 ?auto_140090 ?auto_140091 ?auto_140092 ?auto_140093 ?auto_140094 ?auto_140095 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_140105 - BLOCK
      ?auto_140106 - BLOCK
      ?auto_140107 - BLOCK
      ?auto_140108 - BLOCK
      ?auto_140109 - BLOCK
      ?auto_140110 - BLOCK
      ?auto_140111 - BLOCK
      ?auto_140112 - BLOCK
    )
    :vars
    (
      ?auto_140113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140112 ?auto_140113 ) ( ON-TABLE ?auto_140105 ) ( not ( = ?auto_140105 ?auto_140106 ) ) ( not ( = ?auto_140105 ?auto_140107 ) ) ( not ( = ?auto_140105 ?auto_140108 ) ) ( not ( = ?auto_140105 ?auto_140109 ) ) ( not ( = ?auto_140105 ?auto_140110 ) ) ( not ( = ?auto_140105 ?auto_140111 ) ) ( not ( = ?auto_140105 ?auto_140112 ) ) ( not ( = ?auto_140105 ?auto_140113 ) ) ( not ( = ?auto_140106 ?auto_140107 ) ) ( not ( = ?auto_140106 ?auto_140108 ) ) ( not ( = ?auto_140106 ?auto_140109 ) ) ( not ( = ?auto_140106 ?auto_140110 ) ) ( not ( = ?auto_140106 ?auto_140111 ) ) ( not ( = ?auto_140106 ?auto_140112 ) ) ( not ( = ?auto_140106 ?auto_140113 ) ) ( not ( = ?auto_140107 ?auto_140108 ) ) ( not ( = ?auto_140107 ?auto_140109 ) ) ( not ( = ?auto_140107 ?auto_140110 ) ) ( not ( = ?auto_140107 ?auto_140111 ) ) ( not ( = ?auto_140107 ?auto_140112 ) ) ( not ( = ?auto_140107 ?auto_140113 ) ) ( not ( = ?auto_140108 ?auto_140109 ) ) ( not ( = ?auto_140108 ?auto_140110 ) ) ( not ( = ?auto_140108 ?auto_140111 ) ) ( not ( = ?auto_140108 ?auto_140112 ) ) ( not ( = ?auto_140108 ?auto_140113 ) ) ( not ( = ?auto_140109 ?auto_140110 ) ) ( not ( = ?auto_140109 ?auto_140111 ) ) ( not ( = ?auto_140109 ?auto_140112 ) ) ( not ( = ?auto_140109 ?auto_140113 ) ) ( not ( = ?auto_140110 ?auto_140111 ) ) ( not ( = ?auto_140110 ?auto_140112 ) ) ( not ( = ?auto_140110 ?auto_140113 ) ) ( not ( = ?auto_140111 ?auto_140112 ) ) ( not ( = ?auto_140111 ?auto_140113 ) ) ( not ( = ?auto_140112 ?auto_140113 ) ) ( ON ?auto_140111 ?auto_140112 ) ( ON ?auto_140110 ?auto_140111 ) ( ON ?auto_140109 ?auto_140110 ) ( ON ?auto_140108 ?auto_140109 ) ( ON ?auto_140107 ?auto_140108 ) ( CLEAR ?auto_140105 ) ( ON ?auto_140106 ?auto_140107 ) ( CLEAR ?auto_140106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140105 ?auto_140106 )
      ( MAKE-8PILE ?auto_140105 ?auto_140106 ?auto_140107 ?auto_140108 ?auto_140109 ?auto_140110 ?auto_140111 ?auto_140112 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_140122 - BLOCK
      ?auto_140123 - BLOCK
      ?auto_140124 - BLOCK
      ?auto_140125 - BLOCK
      ?auto_140126 - BLOCK
      ?auto_140127 - BLOCK
      ?auto_140128 - BLOCK
      ?auto_140129 - BLOCK
    )
    :vars
    (
      ?auto_140130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140129 ?auto_140130 ) ( not ( = ?auto_140122 ?auto_140123 ) ) ( not ( = ?auto_140122 ?auto_140124 ) ) ( not ( = ?auto_140122 ?auto_140125 ) ) ( not ( = ?auto_140122 ?auto_140126 ) ) ( not ( = ?auto_140122 ?auto_140127 ) ) ( not ( = ?auto_140122 ?auto_140128 ) ) ( not ( = ?auto_140122 ?auto_140129 ) ) ( not ( = ?auto_140122 ?auto_140130 ) ) ( not ( = ?auto_140123 ?auto_140124 ) ) ( not ( = ?auto_140123 ?auto_140125 ) ) ( not ( = ?auto_140123 ?auto_140126 ) ) ( not ( = ?auto_140123 ?auto_140127 ) ) ( not ( = ?auto_140123 ?auto_140128 ) ) ( not ( = ?auto_140123 ?auto_140129 ) ) ( not ( = ?auto_140123 ?auto_140130 ) ) ( not ( = ?auto_140124 ?auto_140125 ) ) ( not ( = ?auto_140124 ?auto_140126 ) ) ( not ( = ?auto_140124 ?auto_140127 ) ) ( not ( = ?auto_140124 ?auto_140128 ) ) ( not ( = ?auto_140124 ?auto_140129 ) ) ( not ( = ?auto_140124 ?auto_140130 ) ) ( not ( = ?auto_140125 ?auto_140126 ) ) ( not ( = ?auto_140125 ?auto_140127 ) ) ( not ( = ?auto_140125 ?auto_140128 ) ) ( not ( = ?auto_140125 ?auto_140129 ) ) ( not ( = ?auto_140125 ?auto_140130 ) ) ( not ( = ?auto_140126 ?auto_140127 ) ) ( not ( = ?auto_140126 ?auto_140128 ) ) ( not ( = ?auto_140126 ?auto_140129 ) ) ( not ( = ?auto_140126 ?auto_140130 ) ) ( not ( = ?auto_140127 ?auto_140128 ) ) ( not ( = ?auto_140127 ?auto_140129 ) ) ( not ( = ?auto_140127 ?auto_140130 ) ) ( not ( = ?auto_140128 ?auto_140129 ) ) ( not ( = ?auto_140128 ?auto_140130 ) ) ( not ( = ?auto_140129 ?auto_140130 ) ) ( ON ?auto_140128 ?auto_140129 ) ( ON ?auto_140127 ?auto_140128 ) ( ON ?auto_140126 ?auto_140127 ) ( ON ?auto_140125 ?auto_140126 ) ( ON ?auto_140124 ?auto_140125 ) ( ON ?auto_140123 ?auto_140124 ) ( ON ?auto_140122 ?auto_140123 ) ( CLEAR ?auto_140122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_140122 )
      ( MAKE-8PILE ?auto_140122 ?auto_140123 ?auto_140124 ?auto_140125 ?auto_140126 ?auto_140127 ?auto_140128 ?auto_140129 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_140139 - BLOCK
      ?auto_140140 - BLOCK
      ?auto_140141 - BLOCK
      ?auto_140142 - BLOCK
      ?auto_140143 - BLOCK
      ?auto_140144 - BLOCK
      ?auto_140145 - BLOCK
      ?auto_140146 - BLOCK
    )
    :vars
    (
      ?auto_140147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140146 ?auto_140147 ) ( not ( = ?auto_140139 ?auto_140140 ) ) ( not ( = ?auto_140139 ?auto_140141 ) ) ( not ( = ?auto_140139 ?auto_140142 ) ) ( not ( = ?auto_140139 ?auto_140143 ) ) ( not ( = ?auto_140139 ?auto_140144 ) ) ( not ( = ?auto_140139 ?auto_140145 ) ) ( not ( = ?auto_140139 ?auto_140146 ) ) ( not ( = ?auto_140139 ?auto_140147 ) ) ( not ( = ?auto_140140 ?auto_140141 ) ) ( not ( = ?auto_140140 ?auto_140142 ) ) ( not ( = ?auto_140140 ?auto_140143 ) ) ( not ( = ?auto_140140 ?auto_140144 ) ) ( not ( = ?auto_140140 ?auto_140145 ) ) ( not ( = ?auto_140140 ?auto_140146 ) ) ( not ( = ?auto_140140 ?auto_140147 ) ) ( not ( = ?auto_140141 ?auto_140142 ) ) ( not ( = ?auto_140141 ?auto_140143 ) ) ( not ( = ?auto_140141 ?auto_140144 ) ) ( not ( = ?auto_140141 ?auto_140145 ) ) ( not ( = ?auto_140141 ?auto_140146 ) ) ( not ( = ?auto_140141 ?auto_140147 ) ) ( not ( = ?auto_140142 ?auto_140143 ) ) ( not ( = ?auto_140142 ?auto_140144 ) ) ( not ( = ?auto_140142 ?auto_140145 ) ) ( not ( = ?auto_140142 ?auto_140146 ) ) ( not ( = ?auto_140142 ?auto_140147 ) ) ( not ( = ?auto_140143 ?auto_140144 ) ) ( not ( = ?auto_140143 ?auto_140145 ) ) ( not ( = ?auto_140143 ?auto_140146 ) ) ( not ( = ?auto_140143 ?auto_140147 ) ) ( not ( = ?auto_140144 ?auto_140145 ) ) ( not ( = ?auto_140144 ?auto_140146 ) ) ( not ( = ?auto_140144 ?auto_140147 ) ) ( not ( = ?auto_140145 ?auto_140146 ) ) ( not ( = ?auto_140145 ?auto_140147 ) ) ( not ( = ?auto_140146 ?auto_140147 ) ) ( ON ?auto_140145 ?auto_140146 ) ( ON ?auto_140144 ?auto_140145 ) ( ON ?auto_140143 ?auto_140144 ) ( ON ?auto_140142 ?auto_140143 ) ( ON ?auto_140141 ?auto_140142 ) ( ON ?auto_140140 ?auto_140141 ) ( ON ?auto_140139 ?auto_140140 ) ( CLEAR ?auto_140139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_140139 )
      ( MAKE-8PILE ?auto_140139 ?auto_140140 ?auto_140141 ?auto_140142 ?auto_140143 ?auto_140144 ?auto_140145 ?auto_140146 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_140157 - BLOCK
      ?auto_140158 - BLOCK
      ?auto_140159 - BLOCK
      ?auto_140160 - BLOCK
      ?auto_140161 - BLOCK
      ?auto_140162 - BLOCK
      ?auto_140163 - BLOCK
      ?auto_140164 - BLOCK
      ?auto_140165 - BLOCK
    )
    :vars
    (
      ?auto_140166 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_140164 ) ( ON ?auto_140165 ?auto_140166 ) ( CLEAR ?auto_140165 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_140157 ) ( ON ?auto_140158 ?auto_140157 ) ( ON ?auto_140159 ?auto_140158 ) ( ON ?auto_140160 ?auto_140159 ) ( ON ?auto_140161 ?auto_140160 ) ( ON ?auto_140162 ?auto_140161 ) ( ON ?auto_140163 ?auto_140162 ) ( ON ?auto_140164 ?auto_140163 ) ( not ( = ?auto_140157 ?auto_140158 ) ) ( not ( = ?auto_140157 ?auto_140159 ) ) ( not ( = ?auto_140157 ?auto_140160 ) ) ( not ( = ?auto_140157 ?auto_140161 ) ) ( not ( = ?auto_140157 ?auto_140162 ) ) ( not ( = ?auto_140157 ?auto_140163 ) ) ( not ( = ?auto_140157 ?auto_140164 ) ) ( not ( = ?auto_140157 ?auto_140165 ) ) ( not ( = ?auto_140157 ?auto_140166 ) ) ( not ( = ?auto_140158 ?auto_140159 ) ) ( not ( = ?auto_140158 ?auto_140160 ) ) ( not ( = ?auto_140158 ?auto_140161 ) ) ( not ( = ?auto_140158 ?auto_140162 ) ) ( not ( = ?auto_140158 ?auto_140163 ) ) ( not ( = ?auto_140158 ?auto_140164 ) ) ( not ( = ?auto_140158 ?auto_140165 ) ) ( not ( = ?auto_140158 ?auto_140166 ) ) ( not ( = ?auto_140159 ?auto_140160 ) ) ( not ( = ?auto_140159 ?auto_140161 ) ) ( not ( = ?auto_140159 ?auto_140162 ) ) ( not ( = ?auto_140159 ?auto_140163 ) ) ( not ( = ?auto_140159 ?auto_140164 ) ) ( not ( = ?auto_140159 ?auto_140165 ) ) ( not ( = ?auto_140159 ?auto_140166 ) ) ( not ( = ?auto_140160 ?auto_140161 ) ) ( not ( = ?auto_140160 ?auto_140162 ) ) ( not ( = ?auto_140160 ?auto_140163 ) ) ( not ( = ?auto_140160 ?auto_140164 ) ) ( not ( = ?auto_140160 ?auto_140165 ) ) ( not ( = ?auto_140160 ?auto_140166 ) ) ( not ( = ?auto_140161 ?auto_140162 ) ) ( not ( = ?auto_140161 ?auto_140163 ) ) ( not ( = ?auto_140161 ?auto_140164 ) ) ( not ( = ?auto_140161 ?auto_140165 ) ) ( not ( = ?auto_140161 ?auto_140166 ) ) ( not ( = ?auto_140162 ?auto_140163 ) ) ( not ( = ?auto_140162 ?auto_140164 ) ) ( not ( = ?auto_140162 ?auto_140165 ) ) ( not ( = ?auto_140162 ?auto_140166 ) ) ( not ( = ?auto_140163 ?auto_140164 ) ) ( not ( = ?auto_140163 ?auto_140165 ) ) ( not ( = ?auto_140163 ?auto_140166 ) ) ( not ( = ?auto_140164 ?auto_140165 ) ) ( not ( = ?auto_140164 ?auto_140166 ) ) ( not ( = ?auto_140165 ?auto_140166 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_140165 ?auto_140166 )
      ( !STACK ?auto_140165 ?auto_140164 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_140176 - BLOCK
      ?auto_140177 - BLOCK
      ?auto_140178 - BLOCK
      ?auto_140179 - BLOCK
      ?auto_140180 - BLOCK
      ?auto_140181 - BLOCK
      ?auto_140182 - BLOCK
      ?auto_140183 - BLOCK
      ?auto_140184 - BLOCK
    )
    :vars
    (
      ?auto_140185 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_140183 ) ( ON ?auto_140184 ?auto_140185 ) ( CLEAR ?auto_140184 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_140176 ) ( ON ?auto_140177 ?auto_140176 ) ( ON ?auto_140178 ?auto_140177 ) ( ON ?auto_140179 ?auto_140178 ) ( ON ?auto_140180 ?auto_140179 ) ( ON ?auto_140181 ?auto_140180 ) ( ON ?auto_140182 ?auto_140181 ) ( ON ?auto_140183 ?auto_140182 ) ( not ( = ?auto_140176 ?auto_140177 ) ) ( not ( = ?auto_140176 ?auto_140178 ) ) ( not ( = ?auto_140176 ?auto_140179 ) ) ( not ( = ?auto_140176 ?auto_140180 ) ) ( not ( = ?auto_140176 ?auto_140181 ) ) ( not ( = ?auto_140176 ?auto_140182 ) ) ( not ( = ?auto_140176 ?auto_140183 ) ) ( not ( = ?auto_140176 ?auto_140184 ) ) ( not ( = ?auto_140176 ?auto_140185 ) ) ( not ( = ?auto_140177 ?auto_140178 ) ) ( not ( = ?auto_140177 ?auto_140179 ) ) ( not ( = ?auto_140177 ?auto_140180 ) ) ( not ( = ?auto_140177 ?auto_140181 ) ) ( not ( = ?auto_140177 ?auto_140182 ) ) ( not ( = ?auto_140177 ?auto_140183 ) ) ( not ( = ?auto_140177 ?auto_140184 ) ) ( not ( = ?auto_140177 ?auto_140185 ) ) ( not ( = ?auto_140178 ?auto_140179 ) ) ( not ( = ?auto_140178 ?auto_140180 ) ) ( not ( = ?auto_140178 ?auto_140181 ) ) ( not ( = ?auto_140178 ?auto_140182 ) ) ( not ( = ?auto_140178 ?auto_140183 ) ) ( not ( = ?auto_140178 ?auto_140184 ) ) ( not ( = ?auto_140178 ?auto_140185 ) ) ( not ( = ?auto_140179 ?auto_140180 ) ) ( not ( = ?auto_140179 ?auto_140181 ) ) ( not ( = ?auto_140179 ?auto_140182 ) ) ( not ( = ?auto_140179 ?auto_140183 ) ) ( not ( = ?auto_140179 ?auto_140184 ) ) ( not ( = ?auto_140179 ?auto_140185 ) ) ( not ( = ?auto_140180 ?auto_140181 ) ) ( not ( = ?auto_140180 ?auto_140182 ) ) ( not ( = ?auto_140180 ?auto_140183 ) ) ( not ( = ?auto_140180 ?auto_140184 ) ) ( not ( = ?auto_140180 ?auto_140185 ) ) ( not ( = ?auto_140181 ?auto_140182 ) ) ( not ( = ?auto_140181 ?auto_140183 ) ) ( not ( = ?auto_140181 ?auto_140184 ) ) ( not ( = ?auto_140181 ?auto_140185 ) ) ( not ( = ?auto_140182 ?auto_140183 ) ) ( not ( = ?auto_140182 ?auto_140184 ) ) ( not ( = ?auto_140182 ?auto_140185 ) ) ( not ( = ?auto_140183 ?auto_140184 ) ) ( not ( = ?auto_140183 ?auto_140185 ) ) ( not ( = ?auto_140184 ?auto_140185 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_140184 ?auto_140185 )
      ( !STACK ?auto_140184 ?auto_140183 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_140195 - BLOCK
      ?auto_140196 - BLOCK
      ?auto_140197 - BLOCK
      ?auto_140198 - BLOCK
      ?auto_140199 - BLOCK
      ?auto_140200 - BLOCK
      ?auto_140201 - BLOCK
      ?auto_140202 - BLOCK
      ?auto_140203 - BLOCK
    )
    :vars
    (
      ?auto_140204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140203 ?auto_140204 ) ( ON-TABLE ?auto_140195 ) ( ON ?auto_140196 ?auto_140195 ) ( ON ?auto_140197 ?auto_140196 ) ( ON ?auto_140198 ?auto_140197 ) ( ON ?auto_140199 ?auto_140198 ) ( ON ?auto_140200 ?auto_140199 ) ( ON ?auto_140201 ?auto_140200 ) ( not ( = ?auto_140195 ?auto_140196 ) ) ( not ( = ?auto_140195 ?auto_140197 ) ) ( not ( = ?auto_140195 ?auto_140198 ) ) ( not ( = ?auto_140195 ?auto_140199 ) ) ( not ( = ?auto_140195 ?auto_140200 ) ) ( not ( = ?auto_140195 ?auto_140201 ) ) ( not ( = ?auto_140195 ?auto_140202 ) ) ( not ( = ?auto_140195 ?auto_140203 ) ) ( not ( = ?auto_140195 ?auto_140204 ) ) ( not ( = ?auto_140196 ?auto_140197 ) ) ( not ( = ?auto_140196 ?auto_140198 ) ) ( not ( = ?auto_140196 ?auto_140199 ) ) ( not ( = ?auto_140196 ?auto_140200 ) ) ( not ( = ?auto_140196 ?auto_140201 ) ) ( not ( = ?auto_140196 ?auto_140202 ) ) ( not ( = ?auto_140196 ?auto_140203 ) ) ( not ( = ?auto_140196 ?auto_140204 ) ) ( not ( = ?auto_140197 ?auto_140198 ) ) ( not ( = ?auto_140197 ?auto_140199 ) ) ( not ( = ?auto_140197 ?auto_140200 ) ) ( not ( = ?auto_140197 ?auto_140201 ) ) ( not ( = ?auto_140197 ?auto_140202 ) ) ( not ( = ?auto_140197 ?auto_140203 ) ) ( not ( = ?auto_140197 ?auto_140204 ) ) ( not ( = ?auto_140198 ?auto_140199 ) ) ( not ( = ?auto_140198 ?auto_140200 ) ) ( not ( = ?auto_140198 ?auto_140201 ) ) ( not ( = ?auto_140198 ?auto_140202 ) ) ( not ( = ?auto_140198 ?auto_140203 ) ) ( not ( = ?auto_140198 ?auto_140204 ) ) ( not ( = ?auto_140199 ?auto_140200 ) ) ( not ( = ?auto_140199 ?auto_140201 ) ) ( not ( = ?auto_140199 ?auto_140202 ) ) ( not ( = ?auto_140199 ?auto_140203 ) ) ( not ( = ?auto_140199 ?auto_140204 ) ) ( not ( = ?auto_140200 ?auto_140201 ) ) ( not ( = ?auto_140200 ?auto_140202 ) ) ( not ( = ?auto_140200 ?auto_140203 ) ) ( not ( = ?auto_140200 ?auto_140204 ) ) ( not ( = ?auto_140201 ?auto_140202 ) ) ( not ( = ?auto_140201 ?auto_140203 ) ) ( not ( = ?auto_140201 ?auto_140204 ) ) ( not ( = ?auto_140202 ?auto_140203 ) ) ( not ( = ?auto_140202 ?auto_140204 ) ) ( not ( = ?auto_140203 ?auto_140204 ) ) ( CLEAR ?auto_140201 ) ( ON ?auto_140202 ?auto_140203 ) ( CLEAR ?auto_140202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_140195 ?auto_140196 ?auto_140197 ?auto_140198 ?auto_140199 ?auto_140200 ?auto_140201 ?auto_140202 )
      ( MAKE-9PILE ?auto_140195 ?auto_140196 ?auto_140197 ?auto_140198 ?auto_140199 ?auto_140200 ?auto_140201 ?auto_140202 ?auto_140203 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_140214 - BLOCK
      ?auto_140215 - BLOCK
      ?auto_140216 - BLOCK
      ?auto_140217 - BLOCK
      ?auto_140218 - BLOCK
      ?auto_140219 - BLOCK
      ?auto_140220 - BLOCK
      ?auto_140221 - BLOCK
      ?auto_140222 - BLOCK
    )
    :vars
    (
      ?auto_140223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140222 ?auto_140223 ) ( ON-TABLE ?auto_140214 ) ( ON ?auto_140215 ?auto_140214 ) ( ON ?auto_140216 ?auto_140215 ) ( ON ?auto_140217 ?auto_140216 ) ( ON ?auto_140218 ?auto_140217 ) ( ON ?auto_140219 ?auto_140218 ) ( ON ?auto_140220 ?auto_140219 ) ( not ( = ?auto_140214 ?auto_140215 ) ) ( not ( = ?auto_140214 ?auto_140216 ) ) ( not ( = ?auto_140214 ?auto_140217 ) ) ( not ( = ?auto_140214 ?auto_140218 ) ) ( not ( = ?auto_140214 ?auto_140219 ) ) ( not ( = ?auto_140214 ?auto_140220 ) ) ( not ( = ?auto_140214 ?auto_140221 ) ) ( not ( = ?auto_140214 ?auto_140222 ) ) ( not ( = ?auto_140214 ?auto_140223 ) ) ( not ( = ?auto_140215 ?auto_140216 ) ) ( not ( = ?auto_140215 ?auto_140217 ) ) ( not ( = ?auto_140215 ?auto_140218 ) ) ( not ( = ?auto_140215 ?auto_140219 ) ) ( not ( = ?auto_140215 ?auto_140220 ) ) ( not ( = ?auto_140215 ?auto_140221 ) ) ( not ( = ?auto_140215 ?auto_140222 ) ) ( not ( = ?auto_140215 ?auto_140223 ) ) ( not ( = ?auto_140216 ?auto_140217 ) ) ( not ( = ?auto_140216 ?auto_140218 ) ) ( not ( = ?auto_140216 ?auto_140219 ) ) ( not ( = ?auto_140216 ?auto_140220 ) ) ( not ( = ?auto_140216 ?auto_140221 ) ) ( not ( = ?auto_140216 ?auto_140222 ) ) ( not ( = ?auto_140216 ?auto_140223 ) ) ( not ( = ?auto_140217 ?auto_140218 ) ) ( not ( = ?auto_140217 ?auto_140219 ) ) ( not ( = ?auto_140217 ?auto_140220 ) ) ( not ( = ?auto_140217 ?auto_140221 ) ) ( not ( = ?auto_140217 ?auto_140222 ) ) ( not ( = ?auto_140217 ?auto_140223 ) ) ( not ( = ?auto_140218 ?auto_140219 ) ) ( not ( = ?auto_140218 ?auto_140220 ) ) ( not ( = ?auto_140218 ?auto_140221 ) ) ( not ( = ?auto_140218 ?auto_140222 ) ) ( not ( = ?auto_140218 ?auto_140223 ) ) ( not ( = ?auto_140219 ?auto_140220 ) ) ( not ( = ?auto_140219 ?auto_140221 ) ) ( not ( = ?auto_140219 ?auto_140222 ) ) ( not ( = ?auto_140219 ?auto_140223 ) ) ( not ( = ?auto_140220 ?auto_140221 ) ) ( not ( = ?auto_140220 ?auto_140222 ) ) ( not ( = ?auto_140220 ?auto_140223 ) ) ( not ( = ?auto_140221 ?auto_140222 ) ) ( not ( = ?auto_140221 ?auto_140223 ) ) ( not ( = ?auto_140222 ?auto_140223 ) ) ( CLEAR ?auto_140220 ) ( ON ?auto_140221 ?auto_140222 ) ( CLEAR ?auto_140221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_140214 ?auto_140215 ?auto_140216 ?auto_140217 ?auto_140218 ?auto_140219 ?auto_140220 ?auto_140221 )
      ( MAKE-9PILE ?auto_140214 ?auto_140215 ?auto_140216 ?auto_140217 ?auto_140218 ?auto_140219 ?auto_140220 ?auto_140221 ?auto_140222 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_140233 - BLOCK
      ?auto_140234 - BLOCK
      ?auto_140235 - BLOCK
      ?auto_140236 - BLOCK
      ?auto_140237 - BLOCK
      ?auto_140238 - BLOCK
      ?auto_140239 - BLOCK
      ?auto_140240 - BLOCK
      ?auto_140241 - BLOCK
    )
    :vars
    (
      ?auto_140242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140241 ?auto_140242 ) ( ON-TABLE ?auto_140233 ) ( ON ?auto_140234 ?auto_140233 ) ( ON ?auto_140235 ?auto_140234 ) ( ON ?auto_140236 ?auto_140235 ) ( ON ?auto_140237 ?auto_140236 ) ( ON ?auto_140238 ?auto_140237 ) ( not ( = ?auto_140233 ?auto_140234 ) ) ( not ( = ?auto_140233 ?auto_140235 ) ) ( not ( = ?auto_140233 ?auto_140236 ) ) ( not ( = ?auto_140233 ?auto_140237 ) ) ( not ( = ?auto_140233 ?auto_140238 ) ) ( not ( = ?auto_140233 ?auto_140239 ) ) ( not ( = ?auto_140233 ?auto_140240 ) ) ( not ( = ?auto_140233 ?auto_140241 ) ) ( not ( = ?auto_140233 ?auto_140242 ) ) ( not ( = ?auto_140234 ?auto_140235 ) ) ( not ( = ?auto_140234 ?auto_140236 ) ) ( not ( = ?auto_140234 ?auto_140237 ) ) ( not ( = ?auto_140234 ?auto_140238 ) ) ( not ( = ?auto_140234 ?auto_140239 ) ) ( not ( = ?auto_140234 ?auto_140240 ) ) ( not ( = ?auto_140234 ?auto_140241 ) ) ( not ( = ?auto_140234 ?auto_140242 ) ) ( not ( = ?auto_140235 ?auto_140236 ) ) ( not ( = ?auto_140235 ?auto_140237 ) ) ( not ( = ?auto_140235 ?auto_140238 ) ) ( not ( = ?auto_140235 ?auto_140239 ) ) ( not ( = ?auto_140235 ?auto_140240 ) ) ( not ( = ?auto_140235 ?auto_140241 ) ) ( not ( = ?auto_140235 ?auto_140242 ) ) ( not ( = ?auto_140236 ?auto_140237 ) ) ( not ( = ?auto_140236 ?auto_140238 ) ) ( not ( = ?auto_140236 ?auto_140239 ) ) ( not ( = ?auto_140236 ?auto_140240 ) ) ( not ( = ?auto_140236 ?auto_140241 ) ) ( not ( = ?auto_140236 ?auto_140242 ) ) ( not ( = ?auto_140237 ?auto_140238 ) ) ( not ( = ?auto_140237 ?auto_140239 ) ) ( not ( = ?auto_140237 ?auto_140240 ) ) ( not ( = ?auto_140237 ?auto_140241 ) ) ( not ( = ?auto_140237 ?auto_140242 ) ) ( not ( = ?auto_140238 ?auto_140239 ) ) ( not ( = ?auto_140238 ?auto_140240 ) ) ( not ( = ?auto_140238 ?auto_140241 ) ) ( not ( = ?auto_140238 ?auto_140242 ) ) ( not ( = ?auto_140239 ?auto_140240 ) ) ( not ( = ?auto_140239 ?auto_140241 ) ) ( not ( = ?auto_140239 ?auto_140242 ) ) ( not ( = ?auto_140240 ?auto_140241 ) ) ( not ( = ?auto_140240 ?auto_140242 ) ) ( not ( = ?auto_140241 ?auto_140242 ) ) ( ON ?auto_140240 ?auto_140241 ) ( CLEAR ?auto_140238 ) ( ON ?auto_140239 ?auto_140240 ) ( CLEAR ?auto_140239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_140233 ?auto_140234 ?auto_140235 ?auto_140236 ?auto_140237 ?auto_140238 ?auto_140239 )
      ( MAKE-9PILE ?auto_140233 ?auto_140234 ?auto_140235 ?auto_140236 ?auto_140237 ?auto_140238 ?auto_140239 ?auto_140240 ?auto_140241 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_140252 - BLOCK
      ?auto_140253 - BLOCK
      ?auto_140254 - BLOCK
      ?auto_140255 - BLOCK
      ?auto_140256 - BLOCK
      ?auto_140257 - BLOCK
      ?auto_140258 - BLOCK
      ?auto_140259 - BLOCK
      ?auto_140260 - BLOCK
    )
    :vars
    (
      ?auto_140261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140260 ?auto_140261 ) ( ON-TABLE ?auto_140252 ) ( ON ?auto_140253 ?auto_140252 ) ( ON ?auto_140254 ?auto_140253 ) ( ON ?auto_140255 ?auto_140254 ) ( ON ?auto_140256 ?auto_140255 ) ( ON ?auto_140257 ?auto_140256 ) ( not ( = ?auto_140252 ?auto_140253 ) ) ( not ( = ?auto_140252 ?auto_140254 ) ) ( not ( = ?auto_140252 ?auto_140255 ) ) ( not ( = ?auto_140252 ?auto_140256 ) ) ( not ( = ?auto_140252 ?auto_140257 ) ) ( not ( = ?auto_140252 ?auto_140258 ) ) ( not ( = ?auto_140252 ?auto_140259 ) ) ( not ( = ?auto_140252 ?auto_140260 ) ) ( not ( = ?auto_140252 ?auto_140261 ) ) ( not ( = ?auto_140253 ?auto_140254 ) ) ( not ( = ?auto_140253 ?auto_140255 ) ) ( not ( = ?auto_140253 ?auto_140256 ) ) ( not ( = ?auto_140253 ?auto_140257 ) ) ( not ( = ?auto_140253 ?auto_140258 ) ) ( not ( = ?auto_140253 ?auto_140259 ) ) ( not ( = ?auto_140253 ?auto_140260 ) ) ( not ( = ?auto_140253 ?auto_140261 ) ) ( not ( = ?auto_140254 ?auto_140255 ) ) ( not ( = ?auto_140254 ?auto_140256 ) ) ( not ( = ?auto_140254 ?auto_140257 ) ) ( not ( = ?auto_140254 ?auto_140258 ) ) ( not ( = ?auto_140254 ?auto_140259 ) ) ( not ( = ?auto_140254 ?auto_140260 ) ) ( not ( = ?auto_140254 ?auto_140261 ) ) ( not ( = ?auto_140255 ?auto_140256 ) ) ( not ( = ?auto_140255 ?auto_140257 ) ) ( not ( = ?auto_140255 ?auto_140258 ) ) ( not ( = ?auto_140255 ?auto_140259 ) ) ( not ( = ?auto_140255 ?auto_140260 ) ) ( not ( = ?auto_140255 ?auto_140261 ) ) ( not ( = ?auto_140256 ?auto_140257 ) ) ( not ( = ?auto_140256 ?auto_140258 ) ) ( not ( = ?auto_140256 ?auto_140259 ) ) ( not ( = ?auto_140256 ?auto_140260 ) ) ( not ( = ?auto_140256 ?auto_140261 ) ) ( not ( = ?auto_140257 ?auto_140258 ) ) ( not ( = ?auto_140257 ?auto_140259 ) ) ( not ( = ?auto_140257 ?auto_140260 ) ) ( not ( = ?auto_140257 ?auto_140261 ) ) ( not ( = ?auto_140258 ?auto_140259 ) ) ( not ( = ?auto_140258 ?auto_140260 ) ) ( not ( = ?auto_140258 ?auto_140261 ) ) ( not ( = ?auto_140259 ?auto_140260 ) ) ( not ( = ?auto_140259 ?auto_140261 ) ) ( not ( = ?auto_140260 ?auto_140261 ) ) ( ON ?auto_140259 ?auto_140260 ) ( CLEAR ?auto_140257 ) ( ON ?auto_140258 ?auto_140259 ) ( CLEAR ?auto_140258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_140252 ?auto_140253 ?auto_140254 ?auto_140255 ?auto_140256 ?auto_140257 ?auto_140258 )
      ( MAKE-9PILE ?auto_140252 ?auto_140253 ?auto_140254 ?auto_140255 ?auto_140256 ?auto_140257 ?auto_140258 ?auto_140259 ?auto_140260 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_140271 - BLOCK
      ?auto_140272 - BLOCK
      ?auto_140273 - BLOCK
      ?auto_140274 - BLOCK
      ?auto_140275 - BLOCK
      ?auto_140276 - BLOCK
      ?auto_140277 - BLOCK
      ?auto_140278 - BLOCK
      ?auto_140279 - BLOCK
    )
    :vars
    (
      ?auto_140280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140279 ?auto_140280 ) ( ON-TABLE ?auto_140271 ) ( ON ?auto_140272 ?auto_140271 ) ( ON ?auto_140273 ?auto_140272 ) ( ON ?auto_140274 ?auto_140273 ) ( ON ?auto_140275 ?auto_140274 ) ( not ( = ?auto_140271 ?auto_140272 ) ) ( not ( = ?auto_140271 ?auto_140273 ) ) ( not ( = ?auto_140271 ?auto_140274 ) ) ( not ( = ?auto_140271 ?auto_140275 ) ) ( not ( = ?auto_140271 ?auto_140276 ) ) ( not ( = ?auto_140271 ?auto_140277 ) ) ( not ( = ?auto_140271 ?auto_140278 ) ) ( not ( = ?auto_140271 ?auto_140279 ) ) ( not ( = ?auto_140271 ?auto_140280 ) ) ( not ( = ?auto_140272 ?auto_140273 ) ) ( not ( = ?auto_140272 ?auto_140274 ) ) ( not ( = ?auto_140272 ?auto_140275 ) ) ( not ( = ?auto_140272 ?auto_140276 ) ) ( not ( = ?auto_140272 ?auto_140277 ) ) ( not ( = ?auto_140272 ?auto_140278 ) ) ( not ( = ?auto_140272 ?auto_140279 ) ) ( not ( = ?auto_140272 ?auto_140280 ) ) ( not ( = ?auto_140273 ?auto_140274 ) ) ( not ( = ?auto_140273 ?auto_140275 ) ) ( not ( = ?auto_140273 ?auto_140276 ) ) ( not ( = ?auto_140273 ?auto_140277 ) ) ( not ( = ?auto_140273 ?auto_140278 ) ) ( not ( = ?auto_140273 ?auto_140279 ) ) ( not ( = ?auto_140273 ?auto_140280 ) ) ( not ( = ?auto_140274 ?auto_140275 ) ) ( not ( = ?auto_140274 ?auto_140276 ) ) ( not ( = ?auto_140274 ?auto_140277 ) ) ( not ( = ?auto_140274 ?auto_140278 ) ) ( not ( = ?auto_140274 ?auto_140279 ) ) ( not ( = ?auto_140274 ?auto_140280 ) ) ( not ( = ?auto_140275 ?auto_140276 ) ) ( not ( = ?auto_140275 ?auto_140277 ) ) ( not ( = ?auto_140275 ?auto_140278 ) ) ( not ( = ?auto_140275 ?auto_140279 ) ) ( not ( = ?auto_140275 ?auto_140280 ) ) ( not ( = ?auto_140276 ?auto_140277 ) ) ( not ( = ?auto_140276 ?auto_140278 ) ) ( not ( = ?auto_140276 ?auto_140279 ) ) ( not ( = ?auto_140276 ?auto_140280 ) ) ( not ( = ?auto_140277 ?auto_140278 ) ) ( not ( = ?auto_140277 ?auto_140279 ) ) ( not ( = ?auto_140277 ?auto_140280 ) ) ( not ( = ?auto_140278 ?auto_140279 ) ) ( not ( = ?auto_140278 ?auto_140280 ) ) ( not ( = ?auto_140279 ?auto_140280 ) ) ( ON ?auto_140278 ?auto_140279 ) ( ON ?auto_140277 ?auto_140278 ) ( CLEAR ?auto_140275 ) ( ON ?auto_140276 ?auto_140277 ) ( CLEAR ?auto_140276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_140271 ?auto_140272 ?auto_140273 ?auto_140274 ?auto_140275 ?auto_140276 )
      ( MAKE-9PILE ?auto_140271 ?auto_140272 ?auto_140273 ?auto_140274 ?auto_140275 ?auto_140276 ?auto_140277 ?auto_140278 ?auto_140279 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_140290 - BLOCK
      ?auto_140291 - BLOCK
      ?auto_140292 - BLOCK
      ?auto_140293 - BLOCK
      ?auto_140294 - BLOCK
      ?auto_140295 - BLOCK
      ?auto_140296 - BLOCK
      ?auto_140297 - BLOCK
      ?auto_140298 - BLOCK
    )
    :vars
    (
      ?auto_140299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140298 ?auto_140299 ) ( ON-TABLE ?auto_140290 ) ( ON ?auto_140291 ?auto_140290 ) ( ON ?auto_140292 ?auto_140291 ) ( ON ?auto_140293 ?auto_140292 ) ( ON ?auto_140294 ?auto_140293 ) ( not ( = ?auto_140290 ?auto_140291 ) ) ( not ( = ?auto_140290 ?auto_140292 ) ) ( not ( = ?auto_140290 ?auto_140293 ) ) ( not ( = ?auto_140290 ?auto_140294 ) ) ( not ( = ?auto_140290 ?auto_140295 ) ) ( not ( = ?auto_140290 ?auto_140296 ) ) ( not ( = ?auto_140290 ?auto_140297 ) ) ( not ( = ?auto_140290 ?auto_140298 ) ) ( not ( = ?auto_140290 ?auto_140299 ) ) ( not ( = ?auto_140291 ?auto_140292 ) ) ( not ( = ?auto_140291 ?auto_140293 ) ) ( not ( = ?auto_140291 ?auto_140294 ) ) ( not ( = ?auto_140291 ?auto_140295 ) ) ( not ( = ?auto_140291 ?auto_140296 ) ) ( not ( = ?auto_140291 ?auto_140297 ) ) ( not ( = ?auto_140291 ?auto_140298 ) ) ( not ( = ?auto_140291 ?auto_140299 ) ) ( not ( = ?auto_140292 ?auto_140293 ) ) ( not ( = ?auto_140292 ?auto_140294 ) ) ( not ( = ?auto_140292 ?auto_140295 ) ) ( not ( = ?auto_140292 ?auto_140296 ) ) ( not ( = ?auto_140292 ?auto_140297 ) ) ( not ( = ?auto_140292 ?auto_140298 ) ) ( not ( = ?auto_140292 ?auto_140299 ) ) ( not ( = ?auto_140293 ?auto_140294 ) ) ( not ( = ?auto_140293 ?auto_140295 ) ) ( not ( = ?auto_140293 ?auto_140296 ) ) ( not ( = ?auto_140293 ?auto_140297 ) ) ( not ( = ?auto_140293 ?auto_140298 ) ) ( not ( = ?auto_140293 ?auto_140299 ) ) ( not ( = ?auto_140294 ?auto_140295 ) ) ( not ( = ?auto_140294 ?auto_140296 ) ) ( not ( = ?auto_140294 ?auto_140297 ) ) ( not ( = ?auto_140294 ?auto_140298 ) ) ( not ( = ?auto_140294 ?auto_140299 ) ) ( not ( = ?auto_140295 ?auto_140296 ) ) ( not ( = ?auto_140295 ?auto_140297 ) ) ( not ( = ?auto_140295 ?auto_140298 ) ) ( not ( = ?auto_140295 ?auto_140299 ) ) ( not ( = ?auto_140296 ?auto_140297 ) ) ( not ( = ?auto_140296 ?auto_140298 ) ) ( not ( = ?auto_140296 ?auto_140299 ) ) ( not ( = ?auto_140297 ?auto_140298 ) ) ( not ( = ?auto_140297 ?auto_140299 ) ) ( not ( = ?auto_140298 ?auto_140299 ) ) ( ON ?auto_140297 ?auto_140298 ) ( ON ?auto_140296 ?auto_140297 ) ( CLEAR ?auto_140294 ) ( ON ?auto_140295 ?auto_140296 ) ( CLEAR ?auto_140295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_140290 ?auto_140291 ?auto_140292 ?auto_140293 ?auto_140294 ?auto_140295 )
      ( MAKE-9PILE ?auto_140290 ?auto_140291 ?auto_140292 ?auto_140293 ?auto_140294 ?auto_140295 ?auto_140296 ?auto_140297 ?auto_140298 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_140309 - BLOCK
      ?auto_140310 - BLOCK
      ?auto_140311 - BLOCK
      ?auto_140312 - BLOCK
      ?auto_140313 - BLOCK
      ?auto_140314 - BLOCK
      ?auto_140315 - BLOCK
      ?auto_140316 - BLOCK
      ?auto_140317 - BLOCK
    )
    :vars
    (
      ?auto_140318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140317 ?auto_140318 ) ( ON-TABLE ?auto_140309 ) ( ON ?auto_140310 ?auto_140309 ) ( ON ?auto_140311 ?auto_140310 ) ( ON ?auto_140312 ?auto_140311 ) ( not ( = ?auto_140309 ?auto_140310 ) ) ( not ( = ?auto_140309 ?auto_140311 ) ) ( not ( = ?auto_140309 ?auto_140312 ) ) ( not ( = ?auto_140309 ?auto_140313 ) ) ( not ( = ?auto_140309 ?auto_140314 ) ) ( not ( = ?auto_140309 ?auto_140315 ) ) ( not ( = ?auto_140309 ?auto_140316 ) ) ( not ( = ?auto_140309 ?auto_140317 ) ) ( not ( = ?auto_140309 ?auto_140318 ) ) ( not ( = ?auto_140310 ?auto_140311 ) ) ( not ( = ?auto_140310 ?auto_140312 ) ) ( not ( = ?auto_140310 ?auto_140313 ) ) ( not ( = ?auto_140310 ?auto_140314 ) ) ( not ( = ?auto_140310 ?auto_140315 ) ) ( not ( = ?auto_140310 ?auto_140316 ) ) ( not ( = ?auto_140310 ?auto_140317 ) ) ( not ( = ?auto_140310 ?auto_140318 ) ) ( not ( = ?auto_140311 ?auto_140312 ) ) ( not ( = ?auto_140311 ?auto_140313 ) ) ( not ( = ?auto_140311 ?auto_140314 ) ) ( not ( = ?auto_140311 ?auto_140315 ) ) ( not ( = ?auto_140311 ?auto_140316 ) ) ( not ( = ?auto_140311 ?auto_140317 ) ) ( not ( = ?auto_140311 ?auto_140318 ) ) ( not ( = ?auto_140312 ?auto_140313 ) ) ( not ( = ?auto_140312 ?auto_140314 ) ) ( not ( = ?auto_140312 ?auto_140315 ) ) ( not ( = ?auto_140312 ?auto_140316 ) ) ( not ( = ?auto_140312 ?auto_140317 ) ) ( not ( = ?auto_140312 ?auto_140318 ) ) ( not ( = ?auto_140313 ?auto_140314 ) ) ( not ( = ?auto_140313 ?auto_140315 ) ) ( not ( = ?auto_140313 ?auto_140316 ) ) ( not ( = ?auto_140313 ?auto_140317 ) ) ( not ( = ?auto_140313 ?auto_140318 ) ) ( not ( = ?auto_140314 ?auto_140315 ) ) ( not ( = ?auto_140314 ?auto_140316 ) ) ( not ( = ?auto_140314 ?auto_140317 ) ) ( not ( = ?auto_140314 ?auto_140318 ) ) ( not ( = ?auto_140315 ?auto_140316 ) ) ( not ( = ?auto_140315 ?auto_140317 ) ) ( not ( = ?auto_140315 ?auto_140318 ) ) ( not ( = ?auto_140316 ?auto_140317 ) ) ( not ( = ?auto_140316 ?auto_140318 ) ) ( not ( = ?auto_140317 ?auto_140318 ) ) ( ON ?auto_140316 ?auto_140317 ) ( ON ?auto_140315 ?auto_140316 ) ( ON ?auto_140314 ?auto_140315 ) ( CLEAR ?auto_140312 ) ( ON ?auto_140313 ?auto_140314 ) ( CLEAR ?auto_140313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140309 ?auto_140310 ?auto_140311 ?auto_140312 ?auto_140313 )
      ( MAKE-9PILE ?auto_140309 ?auto_140310 ?auto_140311 ?auto_140312 ?auto_140313 ?auto_140314 ?auto_140315 ?auto_140316 ?auto_140317 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_140328 - BLOCK
      ?auto_140329 - BLOCK
      ?auto_140330 - BLOCK
      ?auto_140331 - BLOCK
      ?auto_140332 - BLOCK
      ?auto_140333 - BLOCK
      ?auto_140334 - BLOCK
      ?auto_140335 - BLOCK
      ?auto_140336 - BLOCK
    )
    :vars
    (
      ?auto_140337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140336 ?auto_140337 ) ( ON-TABLE ?auto_140328 ) ( ON ?auto_140329 ?auto_140328 ) ( ON ?auto_140330 ?auto_140329 ) ( ON ?auto_140331 ?auto_140330 ) ( not ( = ?auto_140328 ?auto_140329 ) ) ( not ( = ?auto_140328 ?auto_140330 ) ) ( not ( = ?auto_140328 ?auto_140331 ) ) ( not ( = ?auto_140328 ?auto_140332 ) ) ( not ( = ?auto_140328 ?auto_140333 ) ) ( not ( = ?auto_140328 ?auto_140334 ) ) ( not ( = ?auto_140328 ?auto_140335 ) ) ( not ( = ?auto_140328 ?auto_140336 ) ) ( not ( = ?auto_140328 ?auto_140337 ) ) ( not ( = ?auto_140329 ?auto_140330 ) ) ( not ( = ?auto_140329 ?auto_140331 ) ) ( not ( = ?auto_140329 ?auto_140332 ) ) ( not ( = ?auto_140329 ?auto_140333 ) ) ( not ( = ?auto_140329 ?auto_140334 ) ) ( not ( = ?auto_140329 ?auto_140335 ) ) ( not ( = ?auto_140329 ?auto_140336 ) ) ( not ( = ?auto_140329 ?auto_140337 ) ) ( not ( = ?auto_140330 ?auto_140331 ) ) ( not ( = ?auto_140330 ?auto_140332 ) ) ( not ( = ?auto_140330 ?auto_140333 ) ) ( not ( = ?auto_140330 ?auto_140334 ) ) ( not ( = ?auto_140330 ?auto_140335 ) ) ( not ( = ?auto_140330 ?auto_140336 ) ) ( not ( = ?auto_140330 ?auto_140337 ) ) ( not ( = ?auto_140331 ?auto_140332 ) ) ( not ( = ?auto_140331 ?auto_140333 ) ) ( not ( = ?auto_140331 ?auto_140334 ) ) ( not ( = ?auto_140331 ?auto_140335 ) ) ( not ( = ?auto_140331 ?auto_140336 ) ) ( not ( = ?auto_140331 ?auto_140337 ) ) ( not ( = ?auto_140332 ?auto_140333 ) ) ( not ( = ?auto_140332 ?auto_140334 ) ) ( not ( = ?auto_140332 ?auto_140335 ) ) ( not ( = ?auto_140332 ?auto_140336 ) ) ( not ( = ?auto_140332 ?auto_140337 ) ) ( not ( = ?auto_140333 ?auto_140334 ) ) ( not ( = ?auto_140333 ?auto_140335 ) ) ( not ( = ?auto_140333 ?auto_140336 ) ) ( not ( = ?auto_140333 ?auto_140337 ) ) ( not ( = ?auto_140334 ?auto_140335 ) ) ( not ( = ?auto_140334 ?auto_140336 ) ) ( not ( = ?auto_140334 ?auto_140337 ) ) ( not ( = ?auto_140335 ?auto_140336 ) ) ( not ( = ?auto_140335 ?auto_140337 ) ) ( not ( = ?auto_140336 ?auto_140337 ) ) ( ON ?auto_140335 ?auto_140336 ) ( ON ?auto_140334 ?auto_140335 ) ( ON ?auto_140333 ?auto_140334 ) ( CLEAR ?auto_140331 ) ( ON ?auto_140332 ?auto_140333 ) ( CLEAR ?auto_140332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140328 ?auto_140329 ?auto_140330 ?auto_140331 ?auto_140332 )
      ( MAKE-9PILE ?auto_140328 ?auto_140329 ?auto_140330 ?auto_140331 ?auto_140332 ?auto_140333 ?auto_140334 ?auto_140335 ?auto_140336 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_140347 - BLOCK
      ?auto_140348 - BLOCK
      ?auto_140349 - BLOCK
      ?auto_140350 - BLOCK
      ?auto_140351 - BLOCK
      ?auto_140352 - BLOCK
      ?auto_140353 - BLOCK
      ?auto_140354 - BLOCK
      ?auto_140355 - BLOCK
    )
    :vars
    (
      ?auto_140356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140355 ?auto_140356 ) ( ON-TABLE ?auto_140347 ) ( ON ?auto_140348 ?auto_140347 ) ( ON ?auto_140349 ?auto_140348 ) ( not ( = ?auto_140347 ?auto_140348 ) ) ( not ( = ?auto_140347 ?auto_140349 ) ) ( not ( = ?auto_140347 ?auto_140350 ) ) ( not ( = ?auto_140347 ?auto_140351 ) ) ( not ( = ?auto_140347 ?auto_140352 ) ) ( not ( = ?auto_140347 ?auto_140353 ) ) ( not ( = ?auto_140347 ?auto_140354 ) ) ( not ( = ?auto_140347 ?auto_140355 ) ) ( not ( = ?auto_140347 ?auto_140356 ) ) ( not ( = ?auto_140348 ?auto_140349 ) ) ( not ( = ?auto_140348 ?auto_140350 ) ) ( not ( = ?auto_140348 ?auto_140351 ) ) ( not ( = ?auto_140348 ?auto_140352 ) ) ( not ( = ?auto_140348 ?auto_140353 ) ) ( not ( = ?auto_140348 ?auto_140354 ) ) ( not ( = ?auto_140348 ?auto_140355 ) ) ( not ( = ?auto_140348 ?auto_140356 ) ) ( not ( = ?auto_140349 ?auto_140350 ) ) ( not ( = ?auto_140349 ?auto_140351 ) ) ( not ( = ?auto_140349 ?auto_140352 ) ) ( not ( = ?auto_140349 ?auto_140353 ) ) ( not ( = ?auto_140349 ?auto_140354 ) ) ( not ( = ?auto_140349 ?auto_140355 ) ) ( not ( = ?auto_140349 ?auto_140356 ) ) ( not ( = ?auto_140350 ?auto_140351 ) ) ( not ( = ?auto_140350 ?auto_140352 ) ) ( not ( = ?auto_140350 ?auto_140353 ) ) ( not ( = ?auto_140350 ?auto_140354 ) ) ( not ( = ?auto_140350 ?auto_140355 ) ) ( not ( = ?auto_140350 ?auto_140356 ) ) ( not ( = ?auto_140351 ?auto_140352 ) ) ( not ( = ?auto_140351 ?auto_140353 ) ) ( not ( = ?auto_140351 ?auto_140354 ) ) ( not ( = ?auto_140351 ?auto_140355 ) ) ( not ( = ?auto_140351 ?auto_140356 ) ) ( not ( = ?auto_140352 ?auto_140353 ) ) ( not ( = ?auto_140352 ?auto_140354 ) ) ( not ( = ?auto_140352 ?auto_140355 ) ) ( not ( = ?auto_140352 ?auto_140356 ) ) ( not ( = ?auto_140353 ?auto_140354 ) ) ( not ( = ?auto_140353 ?auto_140355 ) ) ( not ( = ?auto_140353 ?auto_140356 ) ) ( not ( = ?auto_140354 ?auto_140355 ) ) ( not ( = ?auto_140354 ?auto_140356 ) ) ( not ( = ?auto_140355 ?auto_140356 ) ) ( ON ?auto_140354 ?auto_140355 ) ( ON ?auto_140353 ?auto_140354 ) ( ON ?auto_140352 ?auto_140353 ) ( ON ?auto_140351 ?auto_140352 ) ( CLEAR ?auto_140349 ) ( ON ?auto_140350 ?auto_140351 ) ( CLEAR ?auto_140350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140347 ?auto_140348 ?auto_140349 ?auto_140350 )
      ( MAKE-9PILE ?auto_140347 ?auto_140348 ?auto_140349 ?auto_140350 ?auto_140351 ?auto_140352 ?auto_140353 ?auto_140354 ?auto_140355 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_140366 - BLOCK
      ?auto_140367 - BLOCK
      ?auto_140368 - BLOCK
      ?auto_140369 - BLOCK
      ?auto_140370 - BLOCK
      ?auto_140371 - BLOCK
      ?auto_140372 - BLOCK
      ?auto_140373 - BLOCK
      ?auto_140374 - BLOCK
    )
    :vars
    (
      ?auto_140375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140374 ?auto_140375 ) ( ON-TABLE ?auto_140366 ) ( ON ?auto_140367 ?auto_140366 ) ( ON ?auto_140368 ?auto_140367 ) ( not ( = ?auto_140366 ?auto_140367 ) ) ( not ( = ?auto_140366 ?auto_140368 ) ) ( not ( = ?auto_140366 ?auto_140369 ) ) ( not ( = ?auto_140366 ?auto_140370 ) ) ( not ( = ?auto_140366 ?auto_140371 ) ) ( not ( = ?auto_140366 ?auto_140372 ) ) ( not ( = ?auto_140366 ?auto_140373 ) ) ( not ( = ?auto_140366 ?auto_140374 ) ) ( not ( = ?auto_140366 ?auto_140375 ) ) ( not ( = ?auto_140367 ?auto_140368 ) ) ( not ( = ?auto_140367 ?auto_140369 ) ) ( not ( = ?auto_140367 ?auto_140370 ) ) ( not ( = ?auto_140367 ?auto_140371 ) ) ( not ( = ?auto_140367 ?auto_140372 ) ) ( not ( = ?auto_140367 ?auto_140373 ) ) ( not ( = ?auto_140367 ?auto_140374 ) ) ( not ( = ?auto_140367 ?auto_140375 ) ) ( not ( = ?auto_140368 ?auto_140369 ) ) ( not ( = ?auto_140368 ?auto_140370 ) ) ( not ( = ?auto_140368 ?auto_140371 ) ) ( not ( = ?auto_140368 ?auto_140372 ) ) ( not ( = ?auto_140368 ?auto_140373 ) ) ( not ( = ?auto_140368 ?auto_140374 ) ) ( not ( = ?auto_140368 ?auto_140375 ) ) ( not ( = ?auto_140369 ?auto_140370 ) ) ( not ( = ?auto_140369 ?auto_140371 ) ) ( not ( = ?auto_140369 ?auto_140372 ) ) ( not ( = ?auto_140369 ?auto_140373 ) ) ( not ( = ?auto_140369 ?auto_140374 ) ) ( not ( = ?auto_140369 ?auto_140375 ) ) ( not ( = ?auto_140370 ?auto_140371 ) ) ( not ( = ?auto_140370 ?auto_140372 ) ) ( not ( = ?auto_140370 ?auto_140373 ) ) ( not ( = ?auto_140370 ?auto_140374 ) ) ( not ( = ?auto_140370 ?auto_140375 ) ) ( not ( = ?auto_140371 ?auto_140372 ) ) ( not ( = ?auto_140371 ?auto_140373 ) ) ( not ( = ?auto_140371 ?auto_140374 ) ) ( not ( = ?auto_140371 ?auto_140375 ) ) ( not ( = ?auto_140372 ?auto_140373 ) ) ( not ( = ?auto_140372 ?auto_140374 ) ) ( not ( = ?auto_140372 ?auto_140375 ) ) ( not ( = ?auto_140373 ?auto_140374 ) ) ( not ( = ?auto_140373 ?auto_140375 ) ) ( not ( = ?auto_140374 ?auto_140375 ) ) ( ON ?auto_140373 ?auto_140374 ) ( ON ?auto_140372 ?auto_140373 ) ( ON ?auto_140371 ?auto_140372 ) ( ON ?auto_140370 ?auto_140371 ) ( CLEAR ?auto_140368 ) ( ON ?auto_140369 ?auto_140370 ) ( CLEAR ?auto_140369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140366 ?auto_140367 ?auto_140368 ?auto_140369 )
      ( MAKE-9PILE ?auto_140366 ?auto_140367 ?auto_140368 ?auto_140369 ?auto_140370 ?auto_140371 ?auto_140372 ?auto_140373 ?auto_140374 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_140385 - BLOCK
      ?auto_140386 - BLOCK
      ?auto_140387 - BLOCK
      ?auto_140388 - BLOCK
      ?auto_140389 - BLOCK
      ?auto_140390 - BLOCK
      ?auto_140391 - BLOCK
      ?auto_140392 - BLOCK
      ?auto_140393 - BLOCK
    )
    :vars
    (
      ?auto_140394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140393 ?auto_140394 ) ( ON-TABLE ?auto_140385 ) ( ON ?auto_140386 ?auto_140385 ) ( not ( = ?auto_140385 ?auto_140386 ) ) ( not ( = ?auto_140385 ?auto_140387 ) ) ( not ( = ?auto_140385 ?auto_140388 ) ) ( not ( = ?auto_140385 ?auto_140389 ) ) ( not ( = ?auto_140385 ?auto_140390 ) ) ( not ( = ?auto_140385 ?auto_140391 ) ) ( not ( = ?auto_140385 ?auto_140392 ) ) ( not ( = ?auto_140385 ?auto_140393 ) ) ( not ( = ?auto_140385 ?auto_140394 ) ) ( not ( = ?auto_140386 ?auto_140387 ) ) ( not ( = ?auto_140386 ?auto_140388 ) ) ( not ( = ?auto_140386 ?auto_140389 ) ) ( not ( = ?auto_140386 ?auto_140390 ) ) ( not ( = ?auto_140386 ?auto_140391 ) ) ( not ( = ?auto_140386 ?auto_140392 ) ) ( not ( = ?auto_140386 ?auto_140393 ) ) ( not ( = ?auto_140386 ?auto_140394 ) ) ( not ( = ?auto_140387 ?auto_140388 ) ) ( not ( = ?auto_140387 ?auto_140389 ) ) ( not ( = ?auto_140387 ?auto_140390 ) ) ( not ( = ?auto_140387 ?auto_140391 ) ) ( not ( = ?auto_140387 ?auto_140392 ) ) ( not ( = ?auto_140387 ?auto_140393 ) ) ( not ( = ?auto_140387 ?auto_140394 ) ) ( not ( = ?auto_140388 ?auto_140389 ) ) ( not ( = ?auto_140388 ?auto_140390 ) ) ( not ( = ?auto_140388 ?auto_140391 ) ) ( not ( = ?auto_140388 ?auto_140392 ) ) ( not ( = ?auto_140388 ?auto_140393 ) ) ( not ( = ?auto_140388 ?auto_140394 ) ) ( not ( = ?auto_140389 ?auto_140390 ) ) ( not ( = ?auto_140389 ?auto_140391 ) ) ( not ( = ?auto_140389 ?auto_140392 ) ) ( not ( = ?auto_140389 ?auto_140393 ) ) ( not ( = ?auto_140389 ?auto_140394 ) ) ( not ( = ?auto_140390 ?auto_140391 ) ) ( not ( = ?auto_140390 ?auto_140392 ) ) ( not ( = ?auto_140390 ?auto_140393 ) ) ( not ( = ?auto_140390 ?auto_140394 ) ) ( not ( = ?auto_140391 ?auto_140392 ) ) ( not ( = ?auto_140391 ?auto_140393 ) ) ( not ( = ?auto_140391 ?auto_140394 ) ) ( not ( = ?auto_140392 ?auto_140393 ) ) ( not ( = ?auto_140392 ?auto_140394 ) ) ( not ( = ?auto_140393 ?auto_140394 ) ) ( ON ?auto_140392 ?auto_140393 ) ( ON ?auto_140391 ?auto_140392 ) ( ON ?auto_140390 ?auto_140391 ) ( ON ?auto_140389 ?auto_140390 ) ( ON ?auto_140388 ?auto_140389 ) ( CLEAR ?auto_140386 ) ( ON ?auto_140387 ?auto_140388 ) ( CLEAR ?auto_140387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140385 ?auto_140386 ?auto_140387 )
      ( MAKE-9PILE ?auto_140385 ?auto_140386 ?auto_140387 ?auto_140388 ?auto_140389 ?auto_140390 ?auto_140391 ?auto_140392 ?auto_140393 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_140404 - BLOCK
      ?auto_140405 - BLOCK
      ?auto_140406 - BLOCK
      ?auto_140407 - BLOCK
      ?auto_140408 - BLOCK
      ?auto_140409 - BLOCK
      ?auto_140410 - BLOCK
      ?auto_140411 - BLOCK
      ?auto_140412 - BLOCK
    )
    :vars
    (
      ?auto_140413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140412 ?auto_140413 ) ( ON-TABLE ?auto_140404 ) ( ON ?auto_140405 ?auto_140404 ) ( not ( = ?auto_140404 ?auto_140405 ) ) ( not ( = ?auto_140404 ?auto_140406 ) ) ( not ( = ?auto_140404 ?auto_140407 ) ) ( not ( = ?auto_140404 ?auto_140408 ) ) ( not ( = ?auto_140404 ?auto_140409 ) ) ( not ( = ?auto_140404 ?auto_140410 ) ) ( not ( = ?auto_140404 ?auto_140411 ) ) ( not ( = ?auto_140404 ?auto_140412 ) ) ( not ( = ?auto_140404 ?auto_140413 ) ) ( not ( = ?auto_140405 ?auto_140406 ) ) ( not ( = ?auto_140405 ?auto_140407 ) ) ( not ( = ?auto_140405 ?auto_140408 ) ) ( not ( = ?auto_140405 ?auto_140409 ) ) ( not ( = ?auto_140405 ?auto_140410 ) ) ( not ( = ?auto_140405 ?auto_140411 ) ) ( not ( = ?auto_140405 ?auto_140412 ) ) ( not ( = ?auto_140405 ?auto_140413 ) ) ( not ( = ?auto_140406 ?auto_140407 ) ) ( not ( = ?auto_140406 ?auto_140408 ) ) ( not ( = ?auto_140406 ?auto_140409 ) ) ( not ( = ?auto_140406 ?auto_140410 ) ) ( not ( = ?auto_140406 ?auto_140411 ) ) ( not ( = ?auto_140406 ?auto_140412 ) ) ( not ( = ?auto_140406 ?auto_140413 ) ) ( not ( = ?auto_140407 ?auto_140408 ) ) ( not ( = ?auto_140407 ?auto_140409 ) ) ( not ( = ?auto_140407 ?auto_140410 ) ) ( not ( = ?auto_140407 ?auto_140411 ) ) ( not ( = ?auto_140407 ?auto_140412 ) ) ( not ( = ?auto_140407 ?auto_140413 ) ) ( not ( = ?auto_140408 ?auto_140409 ) ) ( not ( = ?auto_140408 ?auto_140410 ) ) ( not ( = ?auto_140408 ?auto_140411 ) ) ( not ( = ?auto_140408 ?auto_140412 ) ) ( not ( = ?auto_140408 ?auto_140413 ) ) ( not ( = ?auto_140409 ?auto_140410 ) ) ( not ( = ?auto_140409 ?auto_140411 ) ) ( not ( = ?auto_140409 ?auto_140412 ) ) ( not ( = ?auto_140409 ?auto_140413 ) ) ( not ( = ?auto_140410 ?auto_140411 ) ) ( not ( = ?auto_140410 ?auto_140412 ) ) ( not ( = ?auto_140410 ?auto_140413 ) ) ( not ( = ?auto_140411 ?auto_140412 ) ) ( not ( = ?auto_140411 ?auto_140413 ) ) ( not ( = ?auto_140412 ?auto_140413 ) ) ( ON ?auto_140411 ?auto_140412 ) ( ON ?auto_140410 ?auto_140411 ) ( ON ?auto_140409 ?auto_140410 ) ( ON ?auto_140408 ?auto_140409 ) ( ON ?auto_140407 ?auto_140408 ) ( CLEAR ?auto_140405 ) ( ON ?auto_140406 ?auto_140407 ) ( CLEAR ?auto_140406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140404 ?auto_140405 ?auto_140406 )
      ( MAKE-9PILE ?auto_140404 ?auto_140405 ?auto_140406 ?auto_140407 ?auto_140408 ?auto_140409 ?auto_140410 ?auto_140411 ?auto_140412 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_140423 - BLOCK
      ?auto_140424 - BLOCK
      ?auto_140425 - BLOCK
      ?auto_140426 - BLOCK
      ?auto_140427 - BLOCK
      ?auto_140428 - BLOCK
      ?auto_140429 - BLOCK
      ?auto_140430 - BLOCK
      ?auto_140431 - BLOCK
    )
    :vars
    (
      ?auto_140432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140431 ?auto_140432 ) ( ON-TABLE ?auto_140423 ) ( not ( = ?auto_140423 ?auto_140424 ) ) ( not ( = ?auto_140423 ?auto_140425 ) ) ( not ( = ?auto_140423 ?auto_140426 ) ) ( not ( = ?auto_140423 ?auto_140427 ) ) ( not ( = ?auto_140423 ?auto_140428 ) ) ( not ( = ?auto_140423 ?auto_140429 ) ) ( not ( = ?auto_140423 ?auto_140430 ) ) ( not ( = ?auto_140423 ?auto_140431 ) ) ( not ( = ?auto_140423 ?auto_140432 ) ) ( not ( = ?auto_140424 ?auto_140425 ) ) ( not ( = ?auto_140424 ?auto_140426 ) ) ( not ( = ?auto_140424 ?auto_140427 ) ) ( not ( = ?auto_140424 ?auto_140428 ) ) ( not ( = ?auto_140424 ?auto_140429 ) ) ( not ( = ?auto_140424 ?auto_140430 ) ) ( not ( = ?auto_140424 ?auto_140431 ) ) ( not ( = ?auto_140424 ?auto_140432 ) ) ( not ( = ?auto_140425 ?auto_140426 ) ) ( not ( = ?auto_140425 ?auto_140427 ) ) ( not ( = ?auto_140425 ?auto_140428 ) ) ( not ( = ?auto_140425 ?auto_140429 ) ) ( not ( = ?auto_140425 ?auto_140430 ) ) ( not ( = ?auto_140425 ?auto_140431 ) ) ( not ( = ?auto_140425 ?auto_140432 ) ) ( not ( = ?auto_140426 ?auto_140427 ) ) ( not ( = ?auto_140426 ?auto_140428 ) ) ( not ( = ?auto_140426 ?auto_140429 ) ) ( not ( = ?auto_140426 ?auto_140430 ) ) ( not ( = ?auto_140426 ?auto_140431 ) ) ( not ( = ?auto_140426 ?auto_140432 ) ) ( not ( = ?auto_140427 ?auto_140428 ) ) ( not ( = ?auto_140427 ?auto_140429 ) ) ( not ( = ?auto_140427 ?auto_140430 ) ) ( not ( = ?auto_140427 ?auto_140431 ) ) ( not ( = ?auto_140427 ?auto_140432 ) ) ( not ( = ?auto_140428 ?auto_140429 ) ) ( not ( = ?auto_140428 ?auto_140430 ) ) ( not ( = ?auto_140428 ?auto_140431 ) ) ( not ( = ?auto_140428 ?auto_140432 ) ) ( not ( = ?auto_140429 ?auto_140430 ) ) ( not ( = ?auto_140429 ?auto_140431 ) ) ( not ( = ?auto_140429 ?auto_140432 ) ) ( not ( = ?auto_140430 ?auto_140431 ) ) ( not ( = ?auto_140430 ?auto_140432 ) ) ( not ( = ?auto_140431 ?auto_140432 ) ) ( ON ?auto_140430 ?auto_140431 ) ( ON ?auto_140429 ?auto_140430 ) ( ON ?auto_140428 ?auto_140429 ) ( ON ?auto_140427 ?auto_140428 ) ( ON ?auto_140426 ?auto_140427 ) ( ON ?auto_140425 ?auto_140426 ) ( CLEAR ?auto_140423 ) ( ON ?auto_140424 ?auto_140425 ) ( CLEAR ?auto_140424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140423 ?auto_140424 )
      ( MAKE-9PILE ?auto_140423 ?auto_140424 ?auto_140425 ?auto_140426 ?auto_140427 ?auto_140428 ?auto_140429 ?auto_140430 ?auto_140431 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_140442 - BLOCK
      ?auto_140443 - BLOCK
      ?auto_140444 - BLOCK
      ?auto_140445 - BLOCK
      ?auto_140446 - BLOCK
      ?auto_140447 - BLOCK
      ?auto_140448 - BLOCK
      ?auto_140449 - BLOCK
      ?auto_140450 - BLOCK
    )
    :vars
    (
      ?auto_140451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140450 ?auto_140451 ) ( ON-TABLE ?auto_140442 ) ( not ( = ?auto_140442 ?auto_140443 ) ) ( not ( = ?auto_140442 ?auto_140444 ) ) ( not ( = ?auto_140442 ?auto_140445 ) ) ( not ( = ?auto_140442 ?auto_140446 ) ) ( not ( = ?auto_140442 ?auto_140447 ) ) ( not ( = ?auto_140442 ?auto_140448 ) ) ( not ( = ?auto_140442 ?auto_140449 ) ) ( not ( = ?auto_140442 ?auto_140450 ) ) ( not ( = ?auto_140442 ?auto_140451 ) ) ( not ( = ?auto_140443 ?auto_140444 ) ) ( not ( = ?auto_140443 ?auto_140445 ) ) ( not ( = ?auto_140443 ?auto_140446 ) ) ( not ( = ?auto_140443 ?auto_140447 ) ) ( not ( = ?auto_140443 ?auto_140448 ) ) ( not ( = ?auto_140443 ?auto_140449 ) ) ( not ( = ?auto_140443 ?auto_140450 ) ) ( not ( = ?auto_140443 ?auto_140451 ) ) ( not ( = ?auto_140444 ?auto_140445 ) ) ( not ( = ?auto_140444 ?auto_140446 ) ) ( not ( = ?auto_140444 ?auto_140447 ) ) ( not ( = ?auto_140444 ?auto_140448 ) ) ( not ( = ?auto_140444 ?auto_140449 ) ) ( not ( = ?auto_140444 ?auto_140450 ) ) ( not ( = ?auto_140444 ?auto_140451 ) ) ( not ( = ?auto_140445 ?auto_140446 ) ) ( not ( = ?auto_140445 ?auto_140447 ) ) ( not ( = ?auto_140445 ?auto_140448 ) ) ( not ( = ?auto_140445 ?auto_140449 ) ) ( not ( = ?auto_140445 ?auto_140450 ) ) ( not ( = ?auto_140445 ?auto_140451 ) ) ( not ( = ?auto_140446 ?auto_140447 ) ) ( not ( = ?auto_140446 ?auto_140448 ) ) ( not ( = ?auto_140446 ?auto_140449 ) ) ( not ( = ?auto_140446 ?auto_140450 ) ) ( not ( = ?auto_140446 ?auto_140451 ) ) ( not ( = ?auto_140447 ?auto_140448 ) ) ( not ( = ?auto_140447 ?auto_140449 ) ) ( not ( = ?auto_140447 ?auto_140450 ) ) ( not ( = ?auto_140447 ?auto_140451 ) ) ( not ( = ?auto_140448 ?auto_140449 ) ) ( not ( = ?auto_140448 ?auto_140450 ) ) ( not ( = ?auto_140448 ?auto_140451 ) ) ( not ( = ?auto_140449 ?auto_140450 ) ) ( not ( = ?auto_140449 ?auto_140451 ) ) ( not ( = ?auto_140450 ?auto_140451 ) ) ( ON ?auto_140449 ?auto_140450 ) ( ON ?auto_140448 ?auto_140449 ) ( ON ?auto_140447 ?auto_140448 ) ( ON ?auto_140446 ?auto_140447 ) ( ON ?auto_140445 ?auto_140446 ) ( ON ?auto_140444 ?auto_140445 ) ( CLEAR ?auto_140442 ) ( ON ?auto_140443 ?auto_140444 ) ( CLEAR ?auto_140443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140442 ?auto_140443 )
      ( MAKE-9PILE ?auto_140442 ?auto_140443 ?auto_140444 ?auto_140445 ?auto_140446 ?auto_140447 ?auto_140448 ?auto_140449 ?auto_140450 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_140461 - BLOCK
      ?auto_140462 - BLOCK
      ?auto_140463 - BLOCK
      ?auto_140464 - BLOCK
      ?auto_140465 - BLOCK
      ?auto_140466 - BLOCK
      ?auto_140467 - BLOCK
      ?auto_140468 - BLOCK
      ?auto_140469 - BLOCK
    )
    :vars
    (
      ?auto_140470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140469 ?auto_140470 ) ( not ( = ?auto_140461 ?auto_140462 ) ) ( not ( = ?auto_140461 ?auto_140463 ) ) ( not ( = ?auto_140461 ?auto_140464 ) ) ( not ( = ?auto_140461 ?auto_140465 ) ) ( not ( = ?auto_140461 ?auto_140466 ) ) ( not ( = ?auto_140461 ?auto_140467 ) ) ( not ( = ?auto_140461 ?auto_140468 ) ) ( not ( = ?auto_140461 ?auto_140469 ) ) ( not ( = ?auto_140461 ?auto_140470 ) ) ( not ( = ?auto_140462 ?auto_140463 ) ) ( not ( = ?auto_140462 ?auto_140464 ) ) ( not ( = ?auto_140462 ?auto_140465 ) ) ( not ( = ?auto_140462 ?auto_140466 ) ) ( not ( = ?auto_140462 ?auto_140467 ) ) ( not ( = ?auto_140462 ?auto_140468 ) ) ( not ( = ?auto_140462 ?auto_140469 ) ) ( not ( = ?auto_140462 ?auto_140470 ) ) ( not ( = ?auto_140463 ?auto_140464 ) ) ( not ( = ?auto_140463 ?auto_140465 ) ) ( not ( = ?auto_140463 ?auto_140466 ) ) ( not ( = ?auto_140463 ?auto_140467 ) ) ( not ( = ?auto_140463 ?auto_140468 ) ) ( not ( = ?auto_140463 ?auto_140469 ) ) ( not ( = ?auto_140463 ?auto_140470 ) ) ( not ( = ?auto_140464 ?auto_140465 ) ) ( not ( = ?auto_140464 ?auto_140466 ) ) ( not ( = ?auto_140464 ?auto_140467 ) ) ( not ( = ?auto_140464 ?auto_140468 ) ) ( not ( = ?auto_140464 ?auto_140469 ) ) ( not ( = ?auto_140464 ?auto_140470 ) ) ( not ( = ?auto_140465 ?auto_140466 ) ) ( not ( = ?auto_140465 ?auto_140467 ) ) ( not ( = ?auto_140465 ?auto_140468 ) ) ( not ( = ?auto_140465 ?auto_140469 ) ) ( not ( = ?auto_140465 ?auto_140470 ) ) ( not ( = ?auto_140466 ?auto_140467 ) ) ( not ( = ?auto_140466 ?auto_140468 ) ) ( not ( = ?auto_140466 ?auto_140469 ) ) ( not ( = ?auto_140466 ?auto_140470 ) ) ( not ( = ?auto_140467 ?auto_140468 ) ) ( not ( = ?auto_140467 ?auto_140469 ) ) ( not ( = ?auto_140467 ?auto_140470 ) ) ( not ( = ?auto_140468 ?auto_140469 ) ) ( not ( = ?auto_140468 ?auto_140470 ) ) ( not ( = ?auto_140469 ?auto_140470 ) ) ( ON ?auto_140468 ?auto_140469 ) ( ON ?auto_140467 ?auto_140468 ) ( ON ?auto_140466 ?auto_140467 ) ( ON ?auto_140465 ?auto_140466 ) ( ON ?auto_140464 ?auto_140465 ) ( ON ?auto_140463 ?auto_140464 ) ( ON ?auto_140462 ?auto_140463 ) ( ON ?auto_140461 ?auto_140462 ) ( CLEAR ?auto_140461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_140461 )
      ( MAKE-9PILE ?auto_140461 ?auto_140462 ?auto_140463 ?auto_140464 ?auto_140465 ?auto_140466 ?auto_140467 ?auto_140468 ?auto_140469 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_140480 - BLOCK
      ?auto_140481 - BLOCK
      ?auto_140482 - BLOCK
      ?auto_140483 - BLOCK
      ?auto_140484 - BLOCK
      ?auto_140485 - BLOCK
      ?auto_140486 - BLOCK
      ?auto_140487 - BLOCK
      ?auto_140488 - BLOCK
    )
    :vars
    (
      ?auto_140489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140488 ?auto_140489 ) ( not ( = ?auto_140480 ?auto_140481 ) ) ( not ( = ?auto_140480 ?auto_140482 ) ) ( not ( = ?auto_140480 ?auto_140483 ) ) ( not ( = ?auto_140480 ?auto_140484 ) ) ( not ( = ?auto_140480 ?auto_140485 ) ) ( not ( = ?auto_140480 ?auto_140486 ) ) ( not ( = ?auto_140480 ?auto_140487 ) ) ( not ( = ?auto_140480 ?auto_140488 ) ) ( not ( = ?auto_140480 ?auto_140489 ) ) ( not ( = ?auto_140481 ?auto_140482 ) ) ( not ( = ?auto_140481 ?auto_140483 ) ) ( not ( = ?auto_140481 ?auto_140484 ) ) ( not ( = ?auto_140481 ?auto_140485 ) ) ( not ( = ?auto_140481 ?auto_140486 ) ) ( not ( = ?auto_140481 ?auto_140487 ) ) ( not ( = ?auto_140481 ?auto_140488 ) ) ( not ( = ?auto_140481 ?auto_140489 ) ) ( not ( = ?auto_140482 ?auto_140483 ) ) ( not ( = ?auto_140482 ?auto_140484 ) ) ( not ( = ?auto_140482 ?auto_140485 ) ) ( not ( = ?auto_140482 ?auto_140486 ) ) ( not ( = ?auto_140482 ?auto_140487 ) ) ( not ( = ?auto_140482 ?auto_140488 ) ) ( not ( = ?auto_140482 ?auto_140489 ) ) ( not ( = ?auto_140483 ?auto_140484 ) ) ( not ( = ?auto_140483 ?auto_140485 ) ) ( not ( = ?auto_140483 ?auto_140486 ) ) ( not ( = ?auto_140483 ?auto_140487 ) ) ( not ( = ?auto_140483 ?auto_140488 ) ) ( not ( = ?auto_140483 ?auto_140489 ) ) ( not ( = ?auto_140484 ?auto_140485 ) ) ( not ( = ?auto_140484 ?auto_140486 ) ) ( not ( = ?auto_140484 ?auto_140487 ) ) ( not ( = ?auto_140484 ?auto_140488 ) ) ( not ( = ?auto_140484 ?auto_140489 ) ) ( not ( = ?auto_140485 ?auto_140486 ) ) ( not ( = ?auto_140485 ?auto_140487 ) ) ( not ( = ?auto_140485 ?auto_140488 ) ) ( not ( = ?auto_140485 ?auto_140489 ) ) ( not ( = ?auto_140486 ?auto_140487 ) ) ( not ( = ?auto_140486 ?auto_140488 ) ) ( not ( = ?auto_140486 ?auto_140489 ) ) ( not ( = ?auto_140487 ?auto_140488 ) ) ( not ( = ?auto_140487 ?auto_140489 ) ) ( not ( = ?auto_140488 ?auto_140489 ) ) ( ON ?auto_140487 ?auto_140488 ) ( ON ?auto_140486 ?auto_140487 ) ( ON ?auto_140485 ?auto_140486 ) ( ON ?auto_140484 ?auto_140485 ) ( ON ?auto_140483 ?auto_140484 ) ( ON ?auto_140482 ?auto_140483 ) ( ON ?auto_140481 ?auto_140482 ) ( ON ?auto_140480 ?auto_140481 ) ( CLEAR ?auto_140480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_140480 )
      ( MAKE-9PILE ?auto_140480 ?auto_140481 ?auto_140482 ?auto_140483 ?auto_140484 ?auto_140485 ?auto_140486 ?auto_140487 ?auto_140488 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_140500 - BLOCK
      ?auto_140501 - BLOCK
      ?auto_140502 - BLOCK
      ?auto_140503 - BLOCK
      ?auto_140504 - BLOCK
      ?auto_140505 - BLOCK
      ?auto_140506 - BLOCK
      ?auto_140507 - BLOCK
      ?auto_140508 - BLOCK
      ?auto_140509 - BLOCK
    )
    :vars
    (
      ?auto_140510 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_140508 ) ( ON ?auto_140509 ?auto_140510 ) ( CLEAR ?auto_140509 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_140500 ) ( ON ?auto_140501 ?auto_140500 ) ( ON ?auto_140502 ?auto_140501 ) ( ON ?auto_140503 ?auto_140502 ) ( ON ?auto_140504 ?auto_140503 ) ( ON ?auto_140505 ?auto_140504 ) ( ON ?auto_140506 ?auto_140505 ) ( ON ?auto_140507 ?auto_140506 ) ( ON ?auto_140508 ?auto_140507 ) ( not ( = ?auto_140500 ?auto_140501 ) ) ( not ( = ?auto_140500 ?auto_140502 ) ) ( not ( = ?auto_140500 ?auto_140503 ) ) ( not ( = ?auto_140500 ?auto_140504 ) ) ( not ( = ?auto_140500 ?auto_140505 ) ) ( not ( = ?auto_140500 ?auto_140506 ) ) ( not ( = ?auto_140500 ?auto_140507 ) ) ( not ( = ?auto_140500 ?auto_140508 ) ) ( not ( = ?auto_140500 ?auto_140509 ) ) ( not ( = ?auto_140500 ?auto_140510 ) ) ( not ( = ?auto_140501 ?auto_140502 ) ) ( not ( = ?auto_140501 ?auto_140503 ) ) ( not ( = ?auto_140501 ?auto_140504 ) ) ( not ( = ?auto_140501 ?auto_140505 ) ) ( not ( = ?auto_140501 ?auto_140506 ) ) ( not ( = ?auto_140501 ?auto_140507 ) ) ( not ( = ?auto_140501 ?auto_140508 ) ) ( not ( = ?auto_140501 ?auto_140509 ) ) ( not ( = ?auto_140501 ?auto_140510 ) ) ( not ( = ?auto_140502 ?auto_140503 ) ) ( not ( = ?auto_140502 ?auto_140504 ) ) ( not ( = ?auto_140502 ?auto_140505 ) ) ( not ( = ?auto_140502 ?auto_140506 ) ) ( not ( = ?auto_140502 ?auto_140507 ) ) ( not ( = ?auto_140502 ?auto_140508 ) ) ( not ( = ?auto_140502 ?auto_140509 ) ) ( not ( = ?auto_140502 ?auto_140510 ) ) ( not ( = ?auto_140503 ?auto_140504 ) ) ( not ( = ?auto_140503 ?auto_140505 ) ) ( not ( = ?auto_140503 ?auto_140506 ) ) ( not ( = ?auto_140503 ?auto_140507 ) ) ( not ( = ?auto_140503 ?auto_140508 ) ) ( not ( = ?auto_140503 ?auto_140509 ) ) ( not ( = ?auto_140503 ?auto_140510 ) ) ( not ( = ?auto_140504 ?auto_140505 ) ) ( not ( = ?auto_140504 ?auto_140506 ) ) ( not ( = ?auto_140504 ?auto_140507 ) ) ( not ( = ?auto_140504 ?auto_140508 ) ) ( not ( = ?auto_140504 ?auto_140509 ) ) ( not ( = ?auto_140504 ?auto_140510 ) ) ( not ( = ?auto_140505 ?auto_140506 ) ) ( not ( = ?auto_140505 ?auto_140507 ) ) ( not ( = ?auto_140505 ?auto_140508 ) ) ( not ( = ?auto_140505 ?auto_140509 ) ) ( not ( = ?auto_140505 ?auto_140510 ) ) ( not ( = ?auto_140506 ?auto_140507 ) ) ( not ( = ?auto_140506 ?auto_140508 ) ) ( not ( = ?auto_140506 ?auto_140509 ) ) ( not ( = ?auto_140506 ?auto_140510 ) ) ( not ( = ?auto_140507 ?auto_140508 ) ) ( not ( = ?auto_140507 ?auto_140509 ) ) ( not ( = ?auto_140507 ?auto_140510 ) ) ( not ( = ?auto_140508 ?auto_140509 ) ) ( not ( = ?auto_140508 ?auto_140510 ) ) ( not ( = ?auto_140509 ?auto_140510 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_140509 ?auto_140510 )
      ( !STACK ?auto_140509 ?auto_140508 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_140521 - BLOCK
      ?auto_140522 - BLOCK
      ?auto_140523 - BLOCK
      ?auto_140524 - BLOCK
      ?auto_140525 - BLOCK
      ?auto_140526 - BLOCK
      ?auto_140527 - BLOCK
      ?auto_140528 - BLOCK
      ?auto_140529 - BLOCK
      ?auto_140530 - BLOCK
    )
    :vars
    (
      ?auto_140531 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_140529 ) ( ON ?auto_140530 ?auto_140531 ) ( CLEAR ?auto_140530 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_140521 ) ( ON ?auto_140522 ?auto_140521 ) ( ON ?auto_140523 ?auto_140522 ) ( ON ?auto_140524 ?auto_140523 ) ( ON ?auto_140525 ?auto_140524 ) ( ON ?auto_140526 ?auto_140525 ) ( ON ?auto_140527 ?auto_140526 ) ( ON ?auto_140528 ?auto_140527 ) ( ON ?auto_140529 ?auto_140528 ) ( not ( = ?auto_140521 ?auto_140522 ) ) ( not ( = ?auto_140521 ?auto_140523 ) ) ( not ( = ?auto_140521 ?auto_140524 ) ) ( not ( = ?auto_140521 ?auto_140525 ) ) ( not ( = ?auto_140521 ?auto_140526 ) ) ( not ( = ?auto_140521 ?auto_140527 ) ) ( not ( = ?auto_140521 ?auto_140528 ) ) ( not ( = ?auto_140521 ?auto_140529 ) ) ( not ( = ?auto_140521 ?auto_140530 ) ) ( not ( = ?auto_140521 ?auto_140531 ) ) ( not ( = ?auto_140522 ?auto_140523 ) ) ( not ( = ?auto_140522 ?auto_140524 ) ) ( not ( = ?auto_140522 ?auto_140525 ) ) ( not ( = ?auto_140522 ?auto_140526 ) ) ( not ( = ?auto_140522 ?auto_140527 ) ) ( not ( = ?auto_140522 ?auto_140528 ) ) ( not ( = ?auto_140522 ?auto_140529 ) ) ( not ( = ?auto_140522 ?auto_140530 ) ) ( not ( = ?auto_140522 ?auto_140531 ) ) ( not ( = ?auto_140523 ?auto_140524 ) ) ( not ( = ?auto_140523 ?auto_140525 ) ) ( not ( = ?auto_140523 ?auto_140526 ) ) ( not ( = ?auto_140523 ?auto_140527 ) ) ( not ( = ?auto_140523 ?auto_140528 ) ) ( not ( = ?auto_140523 ?auto_140529 ) ) ( not ( = ?auto_140523 ?auto_140530 ) ) ( not ( = ?auto_140523 ?auto_140531 ) ) ( not ( = ?auto_140524 ?auto_140525 ) ) ( not ( = ?auto_140524 ?auto_140526 ) ) ( not ( = ?auto_140524 ?auto_140527 ) ) ( not ( = ?auto_140524 ?auto_140528 ) ) ( not ( = ?auto_140524 ?auto_140529 ) ) ( not ( = ?auto_140524 ?auto_140530 ) ) ( not ( = ?auto_140524 ?auto_140531 ) ) ( not ( = ?auto_140525 ?auto_140526 ) ) ( not ( = ?auto_140525 ?auto_140527 ) ) ( not ( = ?auto_140525 ?auto_140528 ) ) ( not ( = ?auto_140525 ?auto_140529 ) ) ( not ( = ?auto_140525 ?auto_140530 ) ) ( not ( = ?auto_140525 ?auto_140531 ) ) ( not ( = ?auto_140526 ?auto_140527 ) ) ( not ( = ?auto_140526 ?auto_140528 ) ) ( not ( = ?auto_140526 ?auto_140529 ) ) ( not ( = ?auto_140526 ?auto_140530 ) ) ( not ( = ?auto_140526 ?auto_140531 ) ) ( not ( = ?auto_140527 ?auto_140528 ) ) ( not ( = ?auto_140527 ?auto_140529 ) ) ( not ( = ?auto_140527 ?auto_140530 ) ) ( not ( = ?auto_140527 ?auto_140531 ) ) ( not ( = ?auto_140528 ?auto_140529 ) ) ( not ( = ?auto_140528 ?auto_140530 ) ) ( not ( = ?auto_140528 ?auto_140531 ) ) ( not ( = ?auto_140529 ?auto_140530 ) ) ( not ( = ?auto_140529 ?auto_140531 ) ) ( not ( = ?auto_140530 ?auto_140531 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_140530 ?auto_140531 )
      ( !STACK ?auto_140530 ?auto_140529 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_140542 - BLOCK
      ?auto_140543 - BLOCK
      ?auto_140544 - BLOCK
      ?auto_140545 - BLOCK
      ?auto_140546 - BLOCK
      ?auto_140547 - BLOCK
      ?auto_140548 - BLOCK
      ?auto_140549 - BLOCK
      ?auto_140550 - BLOCK
      ?auto_140551 - BLOCK
    )
    :vars
    (
      ?auto_140552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140551 ?auto_140552 ) ( ON-TABLE ?auto_140542 ) ( ON ?auto_140543 ?auto_140542 ) ( ON ?auto_140544 ?auto_140543 ) ( ON ?auto_140545 ?auto_140544 ) ( ON ?auto_140546 ?auto_140545 ) ( ON ?auto_140547 ?auto_140546 ) ( ON ?auto_140548 ?auto_140547 ) ( ON ?auto_140549 ?auto_140548 ) ( not ( = ?auto_140542 ?auto_140543 ) ) ( not ( = ?auto_140542 ?auto_140544 ) ) ( not ( = ?auto_140542 ?auto_140545 ) ) ( not ( = ?auto_140542 ?auto_140546 ) ) ( not ( = ?auto_140542 ?auto_140547 ) ) ( not ( = ?auto_140542 ?auto_140548 ) ) ( not ( = ?auto_140542 ?auto_140549 ) ) ( not ( = ?auto_140542 ?auto_140550 ) ) ( not ( = ?auto_140542 ?auto_140551 ) ) ( not ( = ?auto_140542 ?auto_140552 ) ) ( not ( = ?auto_140543 ?auto_140544 ) ) ( not ( = ?auto_140543 ?auto_140545 ) ) ( not ( = ?auto_140543 ?auto_140546 ) ) ( not ( = ?auto_140543 ?auto_140547 ) ) ( not ( = ?auto_140543 ?auto_140548 ) ) ( not ( = ?auto_140543 ?auto_140549 ) ) ( not ( = ?auto_140543 ?auto_140550 ) ) ( not ( = ?auto_140543 ?auto_140551 ) ) ( not ( = ?auto_140543 ?auto_140552 ) ) ( not ( = ?auto_140544 ?auto_140545 ) ) ( not ( = ?auto_140544 ?auto_140546 ) ) ( not ( = ?auto_140544 ?auto_140547 ) ) ( not ( = ?auto_140544 ?auto_140548 ) ) ( not ( = ?auto_140544 ?auto_140549 ) ) ( not ( = ?auto_140544 ?auto_140550 ) ) ( not ( = ?auto_140544 ?auto_140551 ) ) ( not ( = ?auto_140544 ?auto_140552 ) ) ( not ( = ?auto_140545 ?auto_140546 ) ) ( not ( = ?auto_140545 ?auto_140547 ) ) ( not ( = ?auto_140545 ?auto_140548 ) ) ( not ( = ?auto_140545 ?auto_140549 ) ) ( not ( = ?auto_140545 ?auto_140550 ) ) ( not ( = ?auto_140545 ?auto_140551 ) ) ( not ( = ?auto_140545 ?auto_140552 ) ) ( not ( = ?auto_140546 ?auto_140547 ) ) ( not ( = ?auto_140546 ?auto_140548 ) ) ( not ( = ?auto_140546 ?auto_140549 ) ) ( not ( = ?auto_140546 ?auto_140550 ) ) ( not ( = ?auto_140546 ?auto_140551 ) ) ( not ( = ?auto_140546 ?auto_140552 ) ) ( not ( = ?auto_140547 ?auto_140548 ) ) ( not ( = ?auto_140547 ?auto_140549 ) ) ( not ( = ?auto_140547 ?auto_140550 ) ) ( not ( = ?auto_140547 ?auto_140551 ) ) ( not ( = ?auto_140547 ?auto_140552 ) ) ( not ( = ?auto_140548 ?auto_140549 ) ) ( not ( = ?auto_140548 ?auto_140550 ) ) ( not ( = ?auto_140548 ?auto_140551 ) ) ( not ( = ?auto_140548 ?auto_140552 ) ) ( not ( = ?auto_140549 ?auto_140550 ) ) ( not ( = ?auto_140549 ?auto_140551 ) ) ( not ( = ?auto_140549 ?auto_140552 ) ) ( not ( = ?auto_140550 ?auto_140551 ) ) ( not ( = ?auto_140550 ?auto_140552 ) ) ( not ( = ?auto_140551 ?auto_140552 ) ) ( CLEAR ?auto_140549 ) ( ON ?auto_140550 ?auto_140551 ) ( CLEAR ?auto_140550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_140542 ?auto_140543 ?auto_140544 ?auto_140545 ?auto_140546 ?auto_140547 ?auto_140548 ?auto_140549 ?auto_140550 )
      ( MAKE-10PILE ?auto_140542 ?auto_140543 ?auto_140544 ?auto_140545 ?auto_140546 ?auto_140547 ?auto_140548 ?auto_140549 ?auto_140550 ?auto_140551 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_140563 - BLOCK
      ?auto_140564 - BLOCK
      ?auto_140565 - BLOCK
      ?auto_140566 - BLOCK
      ?auto_140567 - BLOCK
      ?auto_140568 - BLOCK
      ?auto_140569 - BLOCK
      ?auto_140570 - BLOCK
      ?auto_140571 - BLOCK
      ?auto_140572 - BLOCK
    )
    :vars
    (
      ?auto_140573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140572 ?auto_140573 ) ( ON-TABLE ?auto_140563 ) ( ON ?auto_140564 ?auto_140563 ) ( ON ?auto_140565 ?auto_140564 ) ( ON ?auto_140566 ?auto_140565 ) ( ON ?auto_140567 ?auto_140566 ) ( ON ?auto_140568 ?auto_140567 ) ( ON ?auto_140569 ?auto_140568 ) ( ON ?auto_140570 ?auto_140569 ) ( not ( = ?auto_140563 ?auto_140564 ) ) ( not ( = ?auto_140563 ?auto_140565 ) ) ( not ( = ?auto_140563 ?auto_140566 ) ) ( not ( = ?auto_140563 ?auto_140567 ) ) ( not ( = ?auto_140563 ?auto_140568 ) ) ( not ( = ?auto_140563 ?auto_140569 ) ) ( not ( = ?auto_140563 ?auto_140570 ) ) ( not ( = ?auto_140563 ?auto_140571 ) ) ( not ( = ?auto_140563 ?auto_140572 ) ) ( not ( = ?auto_140563 ?auto_140573 ) ) ( not ( = ?auto_140564 ?auto_140565 ) ) ( not ( = ?auto_140564 ?auto_140566 ) ) ( not ( = ?auto_140564 ?auto_140567 ) ) ( not ( = ?auto_140564 ?auto_140568 ) ) ( not ( = ?auto_140564 ?auto_140569 ) ) ( not ( = ?auto_140564 ?auto_140570 ) ) ( not ( = ?auto_140564 ?auto_140571 ) ) ( not ( = ?auto_140564 ?auto_140572 ) ) ( not ( = ?auto_140564 ?auto_140573 ) ) ( not ( = ?auto_140565 ?auto_140566 ) ) ( not ( = ?auto_140565 ?auto_140567 ) ) ( not ( = ?auto_140565 ?auto_140568 ) ) ( not ( = ?auto_140565 ?auto_140569 ) ) ( not ( = ?auto_140565 ?auto_140570 ) ) ( not ( = ?auto_140565 ?auto_140571 ) ) ( not ( = ?auto_140565 ?auto_140572 ) ) ( not ( = ?auto_140565 ?auto_140573 ) ) ( not ( = ?auto_140566 ?auto_140567 ) ) ( not ( = ?auto_140566 ?auto_140568 ) ) ( not ( = ?auto_140566 ?auto_140569 ) ) ( not ( = ?auto_140566 ?auto_140570 ) ) ( not ( = ?auto_140566 ?auto_140571 ) ) ( not ( = ?auto_140566 ?auto_140572 ) ) ( not ( = ?auto_140566 ?auto_140573 ) ) ( not ( = ?auto_140567 ?auto_140568 ) ) ( not ( = ?auto_140567 ?auto_140569 ) ) ( not ( = ?auto_140567 ?auto_140570 ) ) ( not ( = ?auto_140567 ?auto_140571 ) ) ( not ( = ?auto_140567 ?auto_140572 ) ) ( not ( = ?auto_140567 ?auto_140573 ) ) ( not ( = ?auto_140568 ?auto_140569 ) ) ( not ( = ?auto_140568 ?auto_140570 ) ) ( not ( = ?auto_140568 ?auto_140571 ) ) ( not ( = ?auto_140568 ?auto_140572 ) ) ( not ( = ?auto_140568 ?auto_140573 ) ) ( not ( = ?auto_140569 ?auto_140570 ) ) ( not ( = ?auto_140569 ?auto_140571 ) ) ( not ( = ?auto_140569 ?auto_140572 ) ) ( not ( = ?auto_140569 ?auto_140573 ) ) ( not ( = ?auto_140570 ?auto_140571 ) ) ( not ( = ?auto_140570 ?auto_140572 ) ) ( not ( = ?auto_140570 ?auto_140573 ) ) ( not ( = ?auto_140571 ?auto_140572 ) ) ( not ( = ?auto_140571 ?auto_140573 ) ) ( not ( = ?auto_140572 ?auto_140573 ) ) ( CLEAR ?auto_140570 ) ( ON ?auto_140571 ?auto_140572 ) ( CLEAR ?auto_140571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_140563 ?auto_140564 ?auto_140565 ?auto_140566 ?auto_140567 ?auto_140568 ?auto_140569 ?auto_140570 ?auto_140571 )
      ( MAKE-10PILE ?auto_140563 ?auto_140564 ?auto_140565 ?auto_140566 ?auto_140567 ?auto_140568 ?auto_140569 ?auto_140570 ?auto_140571 ?auto_140572 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_140584 - BLOCK
      ?auto_140585 - BLOCK
      ?auto_140586 - BLOCK
      ?auto_140587 - BLOCK
      ?auto_140588 - BLOCK
      ?auto_140589 - BLOCK
      ?auto_140590 - BLOCK
      ?auto_140591 - BLOCK
      ?auto_140592 - BLOCK
      ?auto_140593 - BLOCK
    )
    :vars
    (
      ?auto_140594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140593 ?auto_140594 ) ( ON-TABLE ?auto_140584 ) ( ON ?auto_140585 ?auto_140584 ) ( ON ?auto_140586 ?auto_140585 ) ( ON ?auto_140587 ?auto_140586 ) ( ON ?auto_140588 ?auto_140587 ) ( ON ?auto_140589 ?auto_140588 ) ( ON ?auto_140590 ?auto_140589 ) ( not ( = ?auto_140584 ?auto_140585 ) ) ( not ( = ?auto_140584 ?auto_140586 ) ) ( not ( = ?auto_140584 ?auto_140587 ) ) ( not ( = ?auto_140584 ?auto_140588 ) ) ( not ( = ?auto_140584 ?auto_140589 ) ) ( not ( = ?auto_140584 ?auto_140590 ) ) ( not ( = ?auto_140584 ?auto_140591 ) ) ( not ( = ?auto_140584 ?auto_140592 ) ) ( not ( = ?auto_140584 ?auto_140593 ) ) ( not ( = ?auto_140584 ?auto_140594 ) ) ( not ( = ?auto_140585 ?auto_140586 ) ) ( not ( = ?auto_140585 ?auto_140587 ) ) ( not ( = ?auto_140585 ?auto_140588 ) ) ( not ( = ?auto_140585 ?auto_140589 ) ) ( not ( = ?auto_140585 ?auto_140590 ) ) ( not ( = ?auto_140585 ?auto_140591 ) ) ( not ( = ?auto_140585 ?auto_140592 ) ) ( not ( = ?auto_140585 ?auto_140593 ) ) ( not ( = ?auto_140585 ?auto_140594 ) ) ( not ( = ?auto_140586 ?auto_140587 ) ) ( not ( = ?auto_140586 ?auto_140588 ) ) ( not ( = ?auto_140586 ?auto_140589 ) ) ( not ( = ?auto_140586 ?auto_140590 ) ) ( not ( = ?auto_140586 ?auto_140591 ) ) ( not ( = ?auto_140586 ?auto_140592 ) ) ( not ( = ?auto_140586 ?auto_140593 ) ) ( not ( = ?auto_140586 ?auto_140594 ) ) ( not ( = ?auto_140587 ?auto_140588 ) ) ( not ( = ?auto_140587 ?auto_140589 ) ) ( not ( = ?auto_140587 ?auto_140590 ) ) ( not ( = ?auto_140587 ?auto_140591 ) ) ( not ( = ?auto_140587 ?auto_140592 ) ) ( not ( = ?auto_140587 ?auto_140593 ) ) ( not ( = ?auto_140587 ?auto_140594 ) ) ( not ( = ?auto_140588 ?auto_140589 ) ) ( not ( = ?auto_140588 ?auto_140590 ) ) ( not ( = ?auto_140588 ?auto_140591 ) ) ( not ( = ?auto_140588 ?auto_140592 ) ) ( not ( = ?auto_140588 ?auto_140593 ) ) ( not ( = ?auto_140588 ?auto_140594 ) ) ( not ( = ?auto_140589 ?auto_140590 ) ) ( not ( = ?auto_140589 ?auto_140591 ) ) ( not ( = ?auto_140589 ?auto_140592 ) ) ( not ( = ?auto_140589 ?auto_140593 ) ) ( not ( = ?auto_140589 ?auto_140594 ) ) ( not ( = ?auto_140590 ?auto_140591 ) ) ( not ( = ?auto_140590 ?auto_140592 ) ) ( not ( = ?auto_140590 ?auto_140593 ) ) ( not ( = ?auto_140590 ?auto_140594 ) ) ( not ( = ?auto_140591 ?auto_140592 ) ) ( not ( = ?auto_140591 ?auto_140593 ) ) ( not ( = ?auto_140591 ?auto_140594 ) ) ( not ( = ?auto_140592 ?auto_140593 ) ) ( not ( = ?auto_140592 ?auto_140594 ) ) ( not ( = ?auto_140593 ?auto_140594 ) ) ( ON ?auto_140592 ?auto_140593 ) ( CLEAR ?auto_140590 ) ( ON ?auto_140591 ?auto_140592 ) ( CLEAR ?auto_140591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_140584 ?auto_140585 ?auto_140586 ?auto_140587 ?auto_140588 ?auto_140589 ?auto_140590 ?auto_140591 )
      ( MAKE-10PILE ?auto_140584 ?auto_140585 ?auto_140586 ?auto_140587 ?auto_140588 ?auto_140589 ?auto_140590 ?auto_140591 ?auto_140592 ?auto_140593 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_140605 - BLOCK
      ?auto_140606 - BLOCK
      ?auto_140607 - BLOCK
      ?auto_140608 - BLOCK
      ?auto_140609 - BLOCK
      ?auto_140610 - BLOCK
      ?auto_140611 - BLOCK
      ?auto_140612 - BLOCK
      ?auto_140613 - BLOCK
      ?auto_140614 - BLOCK
    )
    :vars
    (
      ?auto_140615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140614 ?auto_140615 ) ( ON-TABLE ?auto_140605 ) ( ON ?auto_140606 ?auto_140605 ) ( ON ?auto_140607 ?auto_140606 ) ( ON ?auto_140608 ?auto_140607 ) ( ON ?auto_140609 ?auto_140608 ) ( ON ?auto_140610 ?auto_140609 ) ( ON ?auto_140611 ?auto_140610 ) ( not ( = ?auto_140605 ?auto_140606 ) ) ( not ( = ?auto_140605 ?auto_140607 ) ) ( not ( = ?auto_140605 ?auto_140608 ) ) ( not ( = ?auto_140605 ?auto_140609 ) ) ( not ( = ?auto_140605 ?auto_140610 ) ) ( not ( = ?auto_140605 ?auto_140611 ) ) ( not ( = ?auto_140605 ?auto_140612 ) ) ( not ( = ?auto_140605 ?auto_140613 ) ) ( not ( = ?auto_140605 ?auto_140614 ) ) ( not ( = ?auto_140605 ?auto_140615 ) ) ( not ( = ?auto_140606 ?auto_140607 ) ) ( not ( = ?auto_140606 ?auto_140608 ) ) ( not ( = ?auto_140606 ?auto_140609 ) ) ( not ( = ?auto_140606 ?auto_140610 ) ) ( not ( = ?auto_140606 ?auto_140611 ) ) ( not ( = ?auto_140606 ?auto_140612 ) ) ( not ( = ?auto_140606 ?auto_140613 ) ) ( not ( = ?auto_140606 ?auto_140614 ) ) ( not ( = ?auto_140606 ?auto_140615 ) ) ( not ( = ?auto_140607 ?auto_140608 ) ) ( not ( = ?auto_140607 ?auto_140609 ) ) ( not ( = ?auto_140607 ?auto_140610 ) ) ( not ( = ?auto_140607 ?auto_140611 ) ) ( not ( = ?auto_140607 ?auto_140612 ) ) ( not ( = ?auto_140607 ?auto_140613 ) ) ( not ( = ?auto_140607 ?auto_140614 ) ) ( not ( = ?auto_140607 ?auto_140615 ) ) ( not ( = ?auto_140608 ?auto_140609 ) ) ( not ( = ?auto_140608 ?auto_140610 ) ) ( not ( = ?auto_140608 ?auto_140611 ) ) ( not ( = ?auto_140608 ?auto_140612 ) ) ( not ( = ?auto_140608 ?auto_140613 ) ) ( not ( = ?auto_140608 ?auto_140614 ) ) ( not ( = ?auto_140608 ?auto_140615 ) ) ( not ( = ?auto_140609 ?auto_140610 ) ) ( not ( = ?auto_140609 ?auto_140611 ) ) ( not ( = ?auto_140609 ?auto_140612 ) ) ( not ( = ?auto_140609 ?auto_140613 ) ) ( not ( = ?auto_140609 ?auto_140614 ) ) ( not ( = ?auto_140609 ?auto_140615 ) ) ( not ( = ?auto_140610 ?auto_140611 ) ) ( not ( = ?auto_140610 ?auto_140612 ) ) ( not ( = ?auto_140610 ?auto_140613 ) ) ( not ( = ?auto_140610 ?auto_140614 ) ) ( not ( = ?auto_140610 ?auto_140615 ) ) ( not ( = ?auto_140611 ?auto_140612 ) ) ( not ( = ?auto_140611 ?auto_140613 ) ) ( not ( = ?auto_140611 ?auto_140614 ) ) ( not ( = ?auto_140611 ?auto_140615 ) ) ( not ( = ?auto_140612 ?auto_140613 ) ) ( not ( = ?auto_140612 ?auto_140614 ) ) ( not ( = ?auto_140612 ?auto_140615 ) ) ( not ( = ?auto_140613 ?auto_140614 ) ) ( not ( = ?auto_140613 ?auto_140615 ) ) ( not ( = ?auto_140614 ?auto_140615 ) ) ( ON ?auto_140613 ?auto_140614 ) ( CLEAR ?auto_140611 ) ( ON ?auto_140612 ?auto_140613 ) ( CLEAR ?auto_140612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_140605 ?auto_140606 ?auto_140607 ?auto_140608 ?auto_140609 ?auto_140610 ?auto_140611 ?auto_140612 )
      ( MAKE-10PILE ?auto_140605 ?auto_140606 ?auto_140607 ?auto_140608 ?auto_140609 ?auto_140610 ?auto_140611 ?auto_140612 ?auto_140613 ?auto_140614 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_140626 - BLOCK
      ?auto_140627 - BLOCK
      ?auto_140628 - BLOCK
      ?auto_140629 - BLOCK
      ?auto_140630 - BLOCK
      ?auto_140631 - BLOCK
      ?auto_140632 - BLOCK
      ?auto_140633 - BLOCK
      ?auto_140634 - BLOCK
      ?auto_140635 - BLOCK
    )
    :vars
    (
      ?auto_140636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140635 ?auto_140636 ) ( ON-TABLE ?auto_140626 ) ( ON ?auto_140627 ?auto_140626 ) ( ON ?auto_140628 ?auto_140627 ) ( ON ?auto_140629 ?auto_140628 ) ( ON ?auto_140630 ?auto_140629 ) ( ON ?auto_140631 ?auto_140630 ) ( not ( = ?auto_140626 ?auto_140627 ) ) ( not ( = ?auto_140626 ?auto_140628 ) ) ( not ( = ?auto_140626 ?auto_140629 ) ) ( not ( = ?auto_140626 ?auto_140630 ) ) ( not ( = ?auto_140626 ?auto_140631 ) ) ( not ( = ?auto_140626 ?auto_140632 ) ) ( not ( = ?auto_140626 ?auto_140633 ) ) ( not ( = ?auto_140626 ?auto_140634 ) ) ( not ( = ?auto_140626 ?auto_140635 ) ) ( not ( = ?auto_140626 ?auto_140636 ) ) ( not ( = ?auto_140627 ?auto_140628 ) ) ( not ( = ?auto_140627 ?auto_140629 ) ) ( not ( = ?auto_140627 ?auto_140630 ) ) ( not ( = ?auto_140627 ?auto_140631 ) ) ( not ( = ?auto_140627 ?auto_140632 ) ) ( not ( = ?auto_140627 ?auto_140633 ) ) ( not ( = ?auto_140627 ?auto_140634 ) ) ( not ( = ?auto_140627 ?auto_140635 ) ) ( not ( = ?auto_140627 ?auto_140636 ) ) ( not ( = ?auto_140628 ?auto_140629 ) ) ( not ( = ?auto_140628 ?auto_140630 ) ) ( not ( = ?auto_140628 ?auto_140631 ) ) ( not ( = ?auto_140628 ?auto_140632 ) ) ( not ( = ?auto_140628 ?auto_140633 ) ) ( not ( = ?auto_140628 ?auto_140634 ) ) ( not ( = ?auto_140628 ?auto_140635 ) ) ( not ( = ?auto_140628 ?auto_140636 ) ) ( not ( = ?auto_140629 ?auto_140630 ) ) ( not ( = ?auto_140629 ?auto_140631 ) ) ( not ( = ?auto_140629 ?auto_140632 ) ) ( not ( = ?auto_140629 ?auto_140633 ) ) ( not ( = ?auto_140629 ?auto_140634 ) ) ( not ( = ?auto_140629 ?auto_140635 ) ) ( not ( = ?auto_140629 ?auto_140636 ) ) ( not ( = ?auto_140630 ?auto_140631 ) ) ( not ( = ?auto_140630 ?auto_140632 ) ) ( not ( = ?auto_140630 ?auto_140633 ) ) ( not ( = ?auto_140630 ?auto_140634 ) ) ( not ( = ?auto_140630 ?auto_140635 ) ) ( not ( = ?auto_140630 ?auto_140636 ) ) ( not ( = ?auto_140631 ?auto_140632 ) ) ( not ( = ?auto_140631 ?auto_140633 ) ) ( not ( = ?auto_140631 ?auto_140634 ) ) ( not ( = ?auto_140631 ?auto_140635 ) ) ( not ( = ?auto_140631 ?auto_140636 ) ) ( not ( = ?auto_140632 ?auto_140633 ) ) ( not ( = ?auto_140632 ?auto_140634 ) ) ( not ( = ?auto_140632 ?auto_140635 ) ) ( not ( = ?auto_140632 ?auto_140636 ) ) ( not ( = ?auto_140633 ?auto_140634 ) ) ( not ( = ?auto_140633 ?auto_140635 ) ) ( not ( = ?auto_140633 ?auto_140636 ) ) ( not ( = ?auto_140634 ?auto_140635 ) ) ( not ( = ?auto_140634 ?auto_140636 ) ) ( not ( = ?auto_140635 ?auto_140636 ) ) ( ON ?auto_140634 ?auto_140635 ) ( ON ?auto_140633 ?auto_140634 ) ( CLEAR ?auto_140631 ) ( ON ?auto_140632 ?auto_140633 ) ( CLEAR ?auto_140632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_140626 ?auto_140627 ?auto_140628 ?auto_140629 ?auto_140630 ?auto_140631 ?auto_140632 )
      ( MAKE-10PILE ?auto_140626 ?auto_140627 ?auto_140628 ?auto_140629 ?auto_140630 ?auto_140631 ?auto_140632 ?auto_140633 ?auto_140634 ?auto_140635 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_140647 - BLOCK
      ?auto_140648 - BLOCK
      ?auto_140649 - BLOCK
      ?auto_140650 - BLOCK
      ?auto_140651 - BLOCK
      ?auto_140652 - BLOCK
      ?auto_140653 - BLOCK
      ?auto_140654 - BLOCK
      ?auto_140655 - BLOCK
      ?auto_140656 - BLOCK
    )
    :vars
    (
      ?auto_140657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140656 ?auto_140657 ) ( ON-TABLE ?auto_140647 ) ( ON ?auto_140648 ?auto_140647 ) ( ON ?auto_140649 ?auto_140648 ) ( ON ?auto_140650 ?auto_140649 ) ( ON ?auto_140651 ?auto_140650 ) ( ON ?auto_140652 ?auto_140651 ) ( not ( = ?auto_140647 ?auto_140648 ) ) ( not ( = ?auto_140647 ?auto_140649 ) ) ( not ( = ?auto_140647 ?auto_140650 ) ) ( not ( = ?auto_140647 ?auto_140651 ) ) ( not ( = ?auto_140647 ?auto_140652 ) ) ( not ( = ?auto_140647 ?auto_140653 ) ) ( not ( = ?auto_140647 ?auto_140654 ) ) ( not ( = ?auto_140647 ?auto_140655 ) ) ( not ( = ?auto_140647 ?auto_140656 ) ) ( not ( = ?auto_140647 ?auto_140657 ) ) ( not ( = ?auto_140648 ?auto_140649 ) ) ( not ( = ?auto_140648 ?auto_140650 ) ) ( not ( = ?auto_140648 ?auto_140651 ) ) ( not ( = ?auto_140648 ?auto_140652 ) ) ( not ( = ?auto_140648 ?auto_140653 ) ) ( not ( = ?auto_140648 ?auto_140654 ) ) ( not ( = ?auto_140648 ?auto_140655 ) ) ( not ( = ?auto_140648 ?auto_140656 ) ) ( not ( = ?auto_140648 ?auto_140657 ) ) ( not ( = ?auto_140649 ?auto_140650 ) ) ( not ( = ?auto_140649 ?auto_140651 ) ) ( not ( = ?auto_140649 ?auto_140652 ) ) ( not ( = ?auto_140649 ?auto_140653 ) ) ( not ( = ?auto_140649 ?auto_140654 ) ) ( not ( = ?auto_140649 ?auto_140655 ) ) ( not ( = ?auto_140649 ?auto_140656 ) ) ( not ( = ?auto_140649 ?auto_140657 ) ) ( not ( = ?auto_140650 ?auto_140651 ) ) ( not ( = ?auto_140650 ?auto_140652 ) ) ( not ( = ?auto_140650 ?auto_140653 ) ) ( not ( = ?auto_140650 ?auto_140654 ) ) ( not ( = ?auto_140650 ?auto_140655 ) ) ( not ( = ?auto_140650 ?auto_140656 ) ) ( not ( = ?auto_140650 ?auto_140657 ) ) ( not ( = ?auto_140651 ?auto_140652 ) ) ( not ( = ?auto_140651 ?auto_140653 ) ) ( not ( = ?auto_140651 ?auto_140654 ) ) ( not ( = ?auto_140651 ?auto_140655 ) ) ( not ( = ?auto_140651 ?auto_140656 ) ) ( not ( = ?auto_140651 ?auto_140657 ) ) ( not ( = ?auto_140652 ?auto_140653 ) ) ( not ( = ?auto_140652 ?auto_140654 ) ) ( not ( = ?auto_140652 ?auto_140655 ) ) ( not ( = ?auto_140652 ?auto_140656 ) ) ( not ( = ?auto_140652 ?auto_140657 ) ) ( not ( = ?auto_140653 ?auto_140654 ) ) ( not ( = ?auto_140653 ?auto_140655 ) ) ( not ( = ?auto_140653 ?auto_140656 ) ) ( not ( = ?auto_140653 ?auto_140657 ) ) ( not ( = ?auto_140654 ?auto_140655 ) ) ( not ( = ?auto_140654 ?auto_140656 ) ) ( not ( = ?auto_140654 ?auto_140657 ) ) ( not ( = ?auto_140655 ?auto_140656 ) ) ( not ( = ?auto_140655 ?auto_140657 ) ) ( not ( = ?auto_140656 ?auto_140657 ) ) ( ON ?auto_140655 ?auto_140656 ) ( ON ?auto_140654 ?auto_140655 ) ( CLEAR ?auto_140652 ) ( ON ?auto_140653 ?auto_140654 ) ( CLEAR ?auto_140653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_140647 ?auto_140648 ?auto_140649 ?auto_140650 ?auto_140651 ?auto_140652 ?auto_140653 )
      ( MAKE-10PILE ?auto_140647 ?auto_140648 ?auto_140649 ?auto_140650 ?auto_140651 ?auto_140652 ?auto_140653 ?auto_140654 ?auto_140655 ?auto_140656 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_140668 - BLOCK
      ?auto_140669 - BLOCK
      ?auto_140670 - BLOCK
      ?auto_140671 - BLOCK
      ?auto_140672 - BLOCK
      ?auto_140673 - BLOCK
      ?auto_140674 - BLOCK
      ?auto_140675 - BLOCK
      ?auto_140676 - BLOCK
      ?auto_140677 - BLOCK
    )
    :vars
    (
      ?auto_140678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140677 ?auto_140678 ) ( ON-TABLE ?auto_140668 ) ( ON ?auto_140669 ?auto_140668 ) ( ON ?auto_140670 ?auto_140669 ) ( ON ?auto_140671 ?auto_140670 ) ( ON ?auto_140672 ?auto_140671 ) ( not ( = ?auto_140668 ?auto_140669 ) ) ( not ( = ?auto_140668 ?auto_140670 ) ) ( not ( = ?auto_140668 ?auto_140671 ) ) ( not ( = ?auto_140668 ?auto_140672 ) ) ( not ( = ?auto_140668 ?auto_140673 ) ) ( not ( = ?auto_140668 ?auto_140674 ) ) ( not ( = ?auto_140668 ?auto_140675 ) ) ( not ( = ?auto_140668 ?auto_140676 ) ) ( not ( = ?auto_140668 ?auto_140677 ) ) ( not ( = ?auto_140668 ?auto_140678 ) ) ( not ( = ?auto_140669 ?auto_140670 ) ) ( not ( = ?auto_140669 ?auto_140671 ) ) ( not ( = ?auto_140669 ?auto_140672 ) ) ( not ( = ?auto_140669 ?auto_140673 ) ) ( not ( = ?auto_140669 ?auto_140674 ) ) ( not ( = ?auto_140669 ?auto_140675 ) ) ( not ( = ?auto_140669 ?auto_140676 ) ) ( not ( = ?auto_140669 ?auto_140677 ) ) ( not ( = ?auto_140669 ?auto_140678 ) ) ( not ( = ?auto_140670 ?auto_140671 ) ) ( not ( = ?auto_140670 ?auto_140672 ) ) ( not ( = ?auto_140670 ?auto_140673 ) ) ( not ( = ?auto_140670 ?auto_140674 ) ) ( not ( = ?auto_140670 ?auto_140675 ) ) ( not ( = ?auto_140670 ?auto_140676 ) ) ( not ( = ?auto_140670 ?auto_140677 ) ) ( not ( = ?auto_140670 ?auto_140678 ) ) ( not ( = ?auto_140671 ?auto_140672 ) ) ( not ( = ?auto_140671 ?auto_140673 ) ) ( not ( = ?auto_140671 ?auto_140674 ) ) ( not ( = ?auto_140671 ?auto_140675 ) ) ( not ( = ?auto_140671 ?auto_140676 ) ) ( not ( = ?auto_140671 ?auto_140677 ) ) ( not ( = ?auto_140671 ?auto_140678 ) ) ( not ( = ?auto_140672 ?auto_140673 ) ) ( not ( = ?auto_140672 ?auto_140674 ) ) ( not ( = ?auto_140672 ?auto_140675 ) ) ( not ( = ?auto_140672 ?auto_140676 ) ) ( not ( = ?auto_140672 ?auto_140677 ) ) ( not ( = ?auto_140672 ?auto_140678 ) ) ( not ( = ?auto_140673 ?auto_140674 ) ) ( not ( = ?auto_140673 ?auto_140675 ) ) ( not ( = ?auto_140673 ?auto_140676 ) ) ( not ( = ?auto_140673 ?auto_140677 ) ) ( not ( = ?auto_140673 ?auto_140678 ) ) ( not ( = ?auto_140674 ?auto_140675 ) ) ( not ( = ?auto_140674 ?auto_140676 ) ) ( not ( = ?auto_140674 ?auto_140677 ) ) ( not ( = ?auto_140674 ?auto_140678 ) ) ( not ( = ?auto_140675 ?auto_140676 ) ) ( not ( = ?auto_140675 ?auto_140677 ) ) ( not ( = ?auto_140675 ?auto_140678 ) ) ( not ( = ?auto_140676 ?auto_140677 ) ) ( not ( = ?auto_140676 ?auto_140678 ) ) ( not ( = ?auto_140677 ?auto_140678 ) ) ( ON ?auto_140676 ?auto_140677 ) ( ON ?auto_140675 ?auto_140676 ) ( ON ?auto_140674 ?auto_140675 ) ( CLEAR ?auto_140672 ) ( ON ?auto_140673 ?auto_140674 ) ( CLEAR ?auto_140673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_140668 ?auto_140669 ?auto_140670 ?auto_140671 ?auto_140672 ?auto_140673 )
      ( MAKE-10PILE ?auto_140668 ?auto_140669 ?auto_140670 ?auto_140671 ?auto_140672 ?auto_140673 ?auto_140674 ?auto_140675 ?auto_140676 ?auto_140677 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_140689 - BLOCK
      ?auto_140690 - BLOCK
      ?auto_140691 - BLOCK
      ?auto_140692 - BLOCK
      ?auto_140693 - BLOCK
      ?auto_140694 - BLOCK
      ?auto_140695 - BLOCK
      ?auto_140696 - BLOCK
      ?auto_140697 - BLOCK
      ?auto_140698 - BLOCK
    )
    :vars
    (
      ?auto_140699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140698 ?auto_140699 ) ( ON-TABLE ?auto_140689 ) ( ON ?auto_140690 ?auto_140689 ) ( ON ?auto_140691 ?auto_140690 ) ( ON ?auto_140692 ?auto_140691 ) ( ON ?auto_140693 ?auto_140692 ) ( not ( = ?auto_140689 ?auto_140690 ) ) ( not ( = ?auto_140689 ?auto_140691 ) ) ( not ( = ?auto_140689 ?auto_140692 ) ) ( not ( = ?auto_140689 ?auto_140693 ) ) ( not ( = ?auto_140689 ?auto_140694 ) ) ( not ( = ?auto_140689 ?auto_140695 ) ) ( not ( = ?auto_140689 ?auto_140696 ) ) ( not ( = ?auto_140689 ?auto_140697 ) ) ( not ( = ?auto_140689 ?auto_140698 ) ) ( not ( = ?auto_140689 ?auto_140699 ) ) ( not ( = ?auto_140690 ?auto_140691 ) ) ( not ( = ?auto_140690 ?auto_140692 ) ) ( not ( = ?auto_140690 ?auto_140693 ) ) ( not ( = ?auto_140690 ?auto_140694 ) ) ( not ( = ?auto_140690 ?auto_140695 ) ) ( not ( = ?auto_140690 ?auto_140696 ) ) ( not ( = ?auto_140690 ?auto_140697 ) ) ( not ( = ?auto_140690 ?auto_140698 ) ) ( not ( = ?auto_140690 ?auto_140699 ) ) ( not ( = ?auto_140691 ?auto_140692 ) ) ( not ( = ?auto_140691 ?auto_140693 ) ) ( not ( = ?auto_140691 ?auto_140694 ) ) ( not ( = ?auto_140691 ?auto_140695 ) ) ( not ( = ?auto_140691 ?auto_140696 ) ) ( not ( = ?auto_140691 ?auto_140697 ) ) ( not ( = ?auto_140691 ?auto_140698 ) ) ( not ( = ?auto_140691 ?auto_140699 ) ) ( not ( = ?auto_140692 ?auto_140693 ) ) ( not ( = ?auto_140692 ?auto_140694 ) ) ( not ( = ?auto_140692 ?auto_140695 ) ) ( not ( = ?auto_140692 ?auto_140696 ) ) ( not ( = ?auto_140692 ?auto_140697 ) ) ( not ( = ?auto_140692 ?auto_140698 ) ) ( not ( = ?auto_140692 ?auto_140699 ) ) ( not ( = ?auto_140693 ?auto_140694 ) ) ( not ( = ?auto_140693 ?auto_140695 ) ) ( not ( = ?auto_140693 ?auto_140696 ) ) ( not ( = ?auto_140693 ?auto_140697 ) ) ( not ( = ?auto_140693 ?auto_140698 ) ) ( not ( = ?auto_140693 ?auto_140699 ) ) ( not ( = ?auto_140694 ?auto_140695 ) ) ( not ( = ?auto_140694 ?auto_140696 ) ) ( not ( = ?auto_140694 ?auto_140697 ) ) ( not ( = ?auto_140694 ?auto_140698 ) ) ( not ( = ?auto_140694 ?auto_140699 ) ) ( not ( = ?auto_140695 ?auto_140696 ) ) ( not ( = ?auto_140695 ?auto_140697 ) ) ( not ( = ?auto_140695 ?auto_140698 ) ) ( not ( = ?auto_140695 ?auto_140699 ) ) ( not ( = ?auto_140696 ?auto_140697 ) ) ( not ( = ?auto_140696 ?auto_140698 ) ) ( not ( = ?auto_140696 ?auto_140699 ) ) ( not ( = ?auto_140697 ?auto_140698 ) ) ( not ( = ?auto_140697 ?auto_140699 ) ) ( not ( = ?auto_140698 ?auto_140699 ) ) ( ON ?auto_140697 ?auto_140698 ) ( ON ?auto_140696 ?auto_140697 ) ( ON ?auto_140695 ?auto_140696 ) ( CLEAR ?auto_140693 ) ( ON ?auto_140694 ?auto_140695 ) ( CLEAR ?auto_140694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_140689 ?auto_140690 ?auto_140691 ?auto_140692 ?auto_140693 ?auto_140694 )
      ( MAKE-10PILE ?auto_140689 ?auto_140690 ?auto_140691 ?auto_140692 ?auto_140693 ?auto_140694 ?auto_140695 ?auto_140696 ?auto_140697 ?auto_140698 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_140710 - BLOCK
      ?auto_140711 - BLOCK
      ?auto_140712 - BLOCK
      ?auto_140713 - BLOCK
      ?auto_140714 - BLOCK
      ?auto_140715 - BLOCK
      ?auto_140716 - BLOCK
      ?auto_140717 - BLOCK
      ?auto_140718 - BLOCK
      ?auto_140719 - BLOCK
    )
    :vars
    (
      ?auto_140720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140719 ?auto_140720 ) ( ON-TABLE ?auto_140710 ) ( ON ?auto_140711 ?auto_140710 ) ( ON ?auto_140712 ?auto_140711 ) ( ON ?auto_140713 ?auto_140712 ) ( not ( = ?auto_140710 ?auto_140711 ) ) ( not ( = ?auto_140710 ?auto_140712 ) ) ( not ( = ?auto_140710 ?auto_140713 ) ) ( not ( = ?auto_140710 ?auto_140714 ) ) ( not ( = ?auto_140710 ?auto_140715 ) ) ( not ( = ?auto_140710 ?auto_140716 ) ) ( not ( = ?auto_140710 ?auto_140717 ) ) ( not ( = ?auto_140710 ?auto_140718 ) ) ( not ( = ?auto_140710 ?auto_140719 ) ) ( not ( = ?auto_140710 ?auto_140720 ) ) ( not ( = ?auto_140711 ?auto_140712 ) ) ( not ( = ?auto_140711 ?auto_140713 ) ) ( not ( = ?auto_140711 ?auto_140714 ) ) ( not ( = ?auto_140711 ?auto_140715 ) ) ( not ( = ?auto_140711 ?auto_140716 ) ) ( not ( = ?auto_140711 ?auto_140717 ) ) ( not ( = ?auto_140711 ?auto_140718 ) ) ( not ( = ?auto_140711 ?auto_140719 ) ) ( not ( = ?auto_140711 ?auto_140720 ) ) ( not ( = ?auto_140712 ?auto_140713 ) ) ( not ( = ?auto_140712 ?auto_140714 ) ) ( not ( = ?auto_140712 ?auto_140715 ) ) ( not ( = ?auto_140712 ?auto_140716 ) ) ( not ( = ?auto_140712 ?auto_140717 ) ) ( not ( = ?auto_140712 ?auto_140718 ) ) ( not ( = ?auto_140712 ?auto_140719 ) ) ( not ( = ?auto_140712 ?auto_140720 ) ) ( not ( = ?auto_140713 ?auto_140714 ) ) ( not ( = ?auto_140713 ?auto_140715 ) ) ( not ( = ?auto_140713 ?auto_140716 ) ) ( not ( = ?auto_140713 ?auto_140717 ) ) ( not ( = ?auto_140713 ?auto_140718 ) ) ( not ( = ?auto_140713 ?auto_140719 ) ) ( not ( = ?auto_140713 ?auto_140720 ) ) ( not ( = ?auto_140714 ?auto_140715 ) ) ( not ( = ?auto_140714 ?auto_140716 ) ) ( not ( = ?auto_140714 ?auto_140717 ) ) ( not ( = ?auto_140714 ?auto_140718 ) ) ( not ( = ?auto_140714 ?auto_140719 ) ) ( not ( = ?auto_140714 ?auto_140720 ) ) ( not ( = ?auto_140715 ?auto_140716 ) ) ( not ( = ?auto_140715 ?auto_140717 ) ) ( not ( = ?auto_140715 ?auto_140718 ) ) ( not ( = ?auto_140715 ?auto_140719 ) ) ( not ( = ?auto_140715 ?auto_140720 ) ) ( not ( = ?auto_140716 ?auto_140717 ) ) ( not ( = ?auto_140716 ?auto_140718 ) ) ( not ( = ?auto_140716 ?auto_140719 ) ) ( not ( = ?auto_140716 ?auto_140720 ) ) ( not ( = ?auto_140717 ?auto_140718 ) ) ( not ( = ?auto_140717 ?auto_140719 ) ) ( not ( = ?auto_140717 ?auto_140720 ) ) ( not ( = ?auto_140718 ?auto_140719 ) ) ( not ( = ?auto_140718 ?auto_140720 ) ) ( not ( = ?auto_140719 ?auto_140720 ) ) ( ON ?auto_140718 ?auto_140719 ) ( ON ?auto_140717 ?auto_140718 ) ( ON ?auto_140716 ?auto_140717 ) ( ON ?auto_140715 ?auto_140716 ) ( CLEAR ?auto_140713 ) ( ON ?auto_140714 ?auto_140715 ) ( CLEAR ?auto_140714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140710 ?auto_140711 ?auto_140712 ?auto_140713 ?auto_140714 )
      ( MAKE-10PILE ?auto_140710 ?auto_140711 ?auto_140712 ?auto_140713 ?auto_140714 ?auto_140715 ?auto_140716 ?auto_140717 ?auto_140718 ?auto_140719 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_140731 - BLOCK
      ?auto_140732 - BLOCK
      ?auto_140733 - BLOCK
      ?auto_140734 - BLOCK
      ?auto_140735 - BLOCK
      ?auto_140736 - BLOCK
      ?auto_140737 - BLOCK
      ?auto_140738 - BLOCK
      ?auto_140739 - BLOCK
      ?auto_140740 - BLOCK
    )
    :vars
    (
      ?auto_140741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140740 ?auto_140741 ) ( ON-TABLE ?auto_140731 ) ( ON ?auto_140732 ?auto_140731 ) ( ON ?auto_140733 ?auto_140732 ) ( ON ?auto_140734 ?auto_140733 ) ( not ( = ?auto_140731 ?auto_140732 ) ) ( not ( = ?auto_140731 ?auto_140733 ) ) ( not ( = ?auto_140731 ?auto_140734 ) ) ( not ( = ?auto_140731 ?auto_140735 ) ) ( not ( = ?auto_140731 ?auto_140736 ) ) ( not ( = ?auto_140731 ?auto_140737 ) ) ( not ( = ?auto_140731 ?auto_140738 ) ) ( not ( = ?auto_140731 ?auto_140739 ) ) ( not ( = ?auto_140731 ?auto_140740 ) ) ( not ( = ?auto_140731 ?auto_140741 ) ) ( not ( = ?auto_140732 ?auto_140733 ) ) ( not ( = ?auto_140732 ?auto_140734 ) ) ( not ( = ?auto_140732 ?auto_140735 ) ) ( not ( = ?auto_140732 ?auto_140736 ) ) ( not ( = ?auto_140732 ?auto_140737 ) ) ( not ( = ?auto_140732 ?auto_140738 ) ) ( not ( = ?auto_140732 ?auto_140739 ) ) ( not ( = ?auto_140732 ?auto_140740 ) ) ( not ( = ?auto_140732 ?auto_140741 ) ) ( not ( = ?auto_140733 ?auto_140734 ) ) ( not ( = ?auto_140733 ?auto_140735 ) ) ( not ( = ?auto_140733 ?auto_140736 ) ) ( not ( = ?auto_140733 ?auto_140737 ) ) ( not ( = ?auto_140733 ?auto_140738 ) ) ( not ( = ?auto_140733 ?auto_140739 ) ) ( not ( = ?auto_140733 ?auto_140740 ) ) ( not ( = ?auto_140733 ?auto_140741 ) ) ( not ( = ?auto_140734 ?auto_140735 ) ) ( not ( = ?auto_140734 ?auto_140736 ) ) ( not ( = ?auto_140734 ?auto_140737 ) ) ( not ( = ?auto_140734 ?auto_140738 ) ) ( not ( = ?auto_140734 ?auto_140739 ) ) ( not ( = ?auto_140734 ?auto_140740 ) ) ( not ( = ?auto_140734 ?auto_140741 ) ) ( not ( = ?auto_140735 ?auto_140736 ) ) ( not ( = ?auto_140735 ?auto_140737 ) ) ( not ( = ?auto_140735 ?auto_140738 ) ) ( not ( = ?auto_140735 ?auto_140739 ) ) ( not ( = ?auto_140735 ?auto_140740 ) ) ( not ( = ?auto_140735 ?auto_140741 ) ) ( not ( = ?auto_140736 ?auto_140737 ) ) ( not ( = ?auto_140736 ?auto_140738 ) ) ( not ( = ?auto_140736 ?auto_140739 ) ) ( not ( = ?auto_140736 ?auto_140740 ) ) ( not ( = ?auto_140736 ?auto_140741 ) ) ( not ( = ?auto_140737 ?auto_140738 ) ) ( not ( = ?auto_140737 ?auto_140739 ) ) ( not ( = ?auto_140737 ?auto_140740 ) ) ( not ( = ?auto_140737 ?auto_140741 ) ) ( not ( = ?auto_140738 ?auto_140739 ) ) ( not ( = ?auto_140738 ?auto_140740 ) ) ( not ( = ?auto_140738 ?auto_140741 ) ) ( not ( = ?auto_140739 ?auto_140740 ) ) ( not ( = ?auto_140739 ?auto_140741 ) ) ( not ( = ?auto_140740 ?auto_140741 ) ) ( ON ?auto_140739 ?auto_140740 ) ( ON ?auto_140738 ?auto_140739 ) ( ON ?auto_140737 ?auto_140738 ) ( ON ?auto_140736 ?auto_140737 ) ( CLEAR ?auto_140734 ) ( ON ?auto_140735 ?auto_140736 ) ( CLEAR ?auto_140735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140731 ?auto_140732 ?auto_140733 ?auto_140734 ?auto_140735 )
      ( MAKE-10PILE ?auto_140731 ?auto_140732 ?auto_140733 ?auto_140734 ?auto_140735 ?auto_140736 ?auto_140737 ?auto_140738 ?auto_140739 ?auto_140740 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_140752 - BLOCK
      ?auto_140753 - BLOCK
      ?auto_140754 - BLOCK
      ?auto_140755 - BLOCK
      ?auto_140756 - BLOCK
      ?auto_140757 - BLOCK
      ?auto_140758 - BLOCK
      ?auto_140759 - BLOCK
      ?auto_140760 - BLOCK
      ?auto_140761 - BLOCK
    )
    :vars
    (
      ?auto_140762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140761 ?auto_140762 ) ( ON-TABLE ?auto_140752 ) ( ON ?auto_140753 ?auto_140752 ) ( ON ?auto_140754 ?auto_140753 ) ( not ( = ?auto_140752 ?auto_140753 ) ) ( not ( = ?auto_140752 ?auto_140754 ) ) ( not ( = ?auto_140752 ?auto_140755 ) ) ( not ( = ?auto_140752 ?auto_140756 ) ) ( not ( = ?auto_140752 ?auto_140757 ) ) ( not ( = ?auto_140752 ?auto_140758 ) ) ( not ( = ?auto_140752 ?auto_140759 ) ) ( not ( = ?auto_140752 ?auto_140760 ) ) ( not ( = ?auto_140752 ?auto_140761 ) ) ( not ( = ?auto_140752 ?auto_140762 ) ) ( not ( = ?auto_140753 ?auto_140754 ) ) ( not ( = ?auto_140753 ?auto_140755 ) ) ( not ( = ?auto_140753 ?auto_140756 ) ) ( not ( = ?auto_140753 ?auto_140757 ) ) ( not ( = ?auto_140753 ?auto_140758 ) ) ( not ( = ?auto_140753 ?auto_140759 ) ) ( not ( = ?auto_140753 ?auto_140760 ) ) ( not ( = ?auto_140753 ?auto_140761 ) ) ( not ( = ?auto_140753 ?auto_140762 ) ) ( not ( = ?auto_140754 ?auto_140755 ) ) ( not ( = ?auto_140754 ?auto_140756 ) ) ( not ( = ?auto_140754 ?auto_140757 ) ) ( not ( = ?auto_140754 ?auto_140758 ) ) ( not ( = ?auto_140754 ?auto_140759 ) ) ( not ( = ?auto_140754 ?auto_140760 ) ) ( not ( = ?auto_140754 ?auto_140761 ) ) ( not ( = ?auto_140754 ?auto_140762 ) ) ( not ( = ?auto_140755 ?auto_140756 ) ) ( not ( = ?auto_140755 ?auto_140757 ) ) ( not ( = ?auto_140755 ?auto_140758 ) ) ( not ( = ?auto_140755 ?auto_140759 ) ) ( not ( = ?auto_140755 ?auto_140760 ) ) ( not ( = ?auto_140755 ?auto_140761 ) ) ( not ( = ?auto_140755 ?auto_140762 ) ) ( not ( = ?auto_140756 ?auto_140757 ) ) ( not ( = ?auto_140756 ?auto_140758 ) ) ( not ( = ?auto_140756 ?auto_140759 ) ) ( not ( = ?auto_140756 ?auto_140760 ) ) ( not ( = ?auto_140756 ?auto_140761 ) ) ( not ( = ?auto_140756 ?auto_140762 ) ) ( not ( = ?auto_140757 ?auto_140758 ) ) ( not ( = ?auto_140757 ?auto_140759 ) ) ( not ( = ?auto_140757 ?auto_140760 ) ) ( not ( = ?auto_140757 ?auto_140761 ) ) ( not ( = ?auto_140757 ?auto_140762 ) ) ( not ( = ?auto_140758 ?auto_140759 ) ) ( not ( = ?auto_140758 ?auto_140760 ) ) ( not ( = ?auto_140758 ?auto_140761 ) ) ( not ( = ?auto_140758 ?auto_140762 ) ) ( not ( = ?auto_140759 ?auto_140760 ) ) ( not ( = ?auto_140759 ?auto_140761 ) ) ( not ( = ?auto_140759 ?auto_140762 ) ) ( not ( = ?auto_140760 ?auto_140761 ) ) ( not ( = ?auto_140760 ?auto_140762 ) ) ( not ( = ?auto_140761 ?auto_140762 ) ) ( ON ?auto_140760 ?auto_140761 ) ( ON ?auto_140759 ?auto_140760 ) ( ON ?auto_140758 ?auto_140759 ) ( ON ?auto_140757 ?auto_140758 ) ( ON ?auto_140756 ?auto_140757 ) ( CLEAR ?auto_140754 ) ( ON ?auto_140755 ?auto_140756 ) ( CLEAR ?auto_140755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140752 ?auto_140753 ?auto_140754 ?auto_140755 )
      ( MAKE-10PILE ?auto_140752 ?auto_140753 ?auto_140754 ?auto_140755 ?auto_140756 ?auto_140757 ?auto_140758 ?auto_140759 ?auto_140760 ?auto_140761 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_140773 - BLOCK
      ?auto_140774 - BLOCK
      ?auto_140775 - BLOCK
      ?auto_140776 - BLOCK
      ?auto_140777 - BLOCK
      ?auto_140778 - BLOCK
      ?auto_140779 - BLOCK
      ?auto_140780 - BLOCK
      ?auto_140781 - BLOCK
      ?auto_140782 - BLOCK
    )
    :vars
    (
      ?auto_140783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140782 ?auto_140783 ) ( ON-TABLE ?auto_140773 ) ( ON ?auto_140774 ?auto_140773 ) ( ON ?auto_140775 ?auto_140774 ) ( not ( = ?auto_140773 ?auto_140774 ) ) ( not ( = ?auto_140773 ?auto_140775 ) ) ( not ( = ?auto_140773 ?auto_140776 ) ) ( not ( = ?auto_140773 ?auto_140777 ) ) ( not ( = ?auto_140773 ?auto_140778 ) ) ( not ( = ?auto_140773 ?auto_140779 ) ) ( not ( = ?auto_140773 ?auto_140780 ) ) ( not ( = ?auto_140773 ?auto_140781 ) ) ( not ( = ?auto_140773 ?auto_140782 ) ) ( not ( = ?auto_140773 ?auto_140783 ) ) ( not ( = ?auto_140774 ?auto_140775 ) ) ( not ( = ?auto_140774 ?auto_140776 ) ) ( not ( = ?auto_140774 ?auto_140777 ) ) ( not ( = ?auto_140774 ?auto_140778 ) ) ( not ( = ?auto_140774 ?auto_140779 ) ) ( not ( = ?auto_140774 ?auto_140780 ) ) ( not ( = ?auto_140774 ?auto_140781 ) ) ( not ( = ?auto_140774 ?auto_140782 ) ) ( not ( = ?auto_140774 ?auto_140783 ) ) ( not ( = ?auto_140775 ?auto_140776 ) ) ( not ( = ?auto_140775 ?auto_140777 ) ) ( not ( = ?auto_140775 ?auto_140778 ) ) ( not ( = ?auto_140775 ?auto_140779 ) ) ( not ( = ?auto_140775 ?auto_140780 ) ) ( not ( = ?auto_140775 ?auto_140781 ) ) ( not ( = ?auto_140775 ?auto_140782 ) ) ( not ( = ?auto_140775 ?auto_140783 ) ) ( not ( = ?auto_140776 ?auto_140777 ) ) ( not ( = ?auto_140776 ?auto_140778 ) ) ( not ( = ?auto_140776 ?auto_140779 ) ) ( not ( = ?auto_140776 ?auto_140780 ) ) ( not ( = ?auto_140776 ?auto_140781 ) ) ( not ( = ?auto_140776 ?auto_140782 ) ) ( not ( = ?auto_140776 ?auto_140783 ) ) ( not ( = ?auto_140777 ?auto_140778 ) ) ( not ( = ?auto_140777 ?auto_140779 ) ) ( not ( = ?auto_140777 ?auto_140780 ) ) ( not ( = ?auto_140777 ?auto_140781 ) ) ( not ( = ?auto_140777 ?auto_140782 ) ) ( not ( = ?auto_140777 ?auto_140783 ) ) ( not ( = ?auto_140778 ?auto_140779 ) ) ( not ( = ?auto_140778 ?auto_140780 ) ) ( not ( = ?auto_140778 ?auto_140781 ) ) ( not ( = ?auto_140778 ?auto_140782 ) ) ( not ( = ?auto_140778 ?auto_140783 ) ) ( not ( = ?auto_140779 ?auto_140780 ) ) ( not ( = ?auto_140779 ?auto_140781 ) ) ( not ( = ?auto_140779 ?auto_140782 ) ) ( not ( = ?auto_140779 ?auto_140783 ) ) ( not ( = ?auto_140780 ?auto_140781 ) ) ( not ( = ?auto_140780 ?auto_140782 ) ) ( not ( = ?auto_140780 ?auto_140783 ) ) ( not ( = ?auto_140781 ?auto_140782 ) ) ( not ( = ?auto_140781 ?auto_140783 ) ) ( not ( = ?auto_140782 ?auto_140783 ) ) ( ON ?auto_140781 ?auto_140782 ) ( ON ?auto_140780 ?auto_140781 ) ( ON ?auto_140779 ?auto_140780 ) ( ON ?auto_140778 ?auto_140779 ) ( ON ?auto_140777 ?auto_140778 ) ( CLEAR ?auto_140775 ) ( ON ?auto_140776 ?auto_140777 ) ( CLEAR ?auto_140776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140773 ?auto_140774 ?auto_140775 ?auto_140776 )
      ( MAKE-10PILE ?auto_140773 ?auto_140774 ?auto_140775 ?auto_140776 ?auto_140777 ?auto_140778 ?auto_140779 ?auto_140780 ?auto_140781 ?auto_140782 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_140794 - BLOCK
      ?auto_140795 - BLOCK
      ?auto_140796 - BLOCK
      ?auto_140797 - BLOCK
      ?auto_140798 - BLOCK
      ?auto_140799 - BLOCK
      ?auto_140800 - BLOCK
      ?auto_140801 - BLOCK
      ?auto_140802 - BLOCK
      ?auto_140803 - BLOCK
    )
    :vars
    (
      ?auto_140804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140803 ?auto_140804 ) ( ON-TABLE ?auto_140794 ) ( ON ?auto_140795 ?auto_140794 ) ( not ( = ?auto_140794 ?auto_140795 ) ) ( not ( = ?auto_140794 ?auto_140796 ) ) ( not ( = ?auto_140794 ?auto_140797 ) ) ( not ( = ?auto_140794 ?auto_140798 ) ) ( not ( = ?auto_140794 ?auto_140799 ) ) ( not ( = ?auto_140794 ?auto_140800 ) ) ( not ( = ?auto_140794 ?auto_140801 ) ) ( not ( = ?auto_140794 ?auto_140802 ) ) ( not ( = ?auto_140794 ?auto_140803 ) ) ( not ( = ?auto_140794 ?auto_140804 ) ) ( not ( = ?auto_140795 ?auto_140796 ) ) ( not ( = ?auto_140795 ?auto_140797 ) ) ( not ( = ?auto_140795 ?auto_140798 ) ) ( not ( = ?auto_140795 ?auto_140799 ) ) ( not ( = ?auto_140795 ?auto_140800 ) ) ( not ( = ?auto_140795 ?auto_140801 ) ) ( not ( = ?auto_140795 ?auto_140802 ) ) ( not ( = ?auto_140795 ?auto_140803 ) ) ( not ( = ?auto_140795 ?auto_140804 ) ) ( not ( = ?auto_140796 ?auto_140797 ) ) ( not ( = ?auto_140796 ?auto_140798 ) ) ( not ( = ?auto_140796 ?auto_140799 ) ) ( not ( = ?auto_140796 ?auto_140800 ) ) ( not ( = ?auto_140796 ?auto_140801 ) ) ( not ( = ?auto_140796 ?auto_140802 ) ) ( not ( = ?auto_140796 ?auto_140803 ) ) ( not ( = ?auto_140796 ?auto_140804 ) ) ( not ( = ?auto_140797 ?auto_140798 ) ) ( not ( = ?auto_140797 ?auto_140799 ) ) ( not ( = ?auto_140797 ?auto_140800 ) ) ( not ( = ?auto_140797 ?auto_140801 ) ) ( not ( = ?auto_140797 ?auto_140802 ) ) ( not ( = ?auto_140797 ?auto_140803 ) ) ( not ( = ?auto_140797 ?auto_140804 ) ) ( not ( = ?auto_140798 ?auto_140799 ) ) ( not ( = ?auto_140798 ?auto_140800 ) ) ( not ( = ?auto_140798 ?auto_140801 ) ) ( not ( = ?auto_140798 ?auto_140802 ) ) ( not ( = ?auto_140798 ?auto_140803 ) ) ( not ( = ?auto_140798 ?auto_140804 ) ) ( not ( = ?auto_140799 ?auto_140800 ) ) ( not ( = ?auto_140799 ?auto_140801 ) ) ( not ( = ?auto_140799 ?auto_140802 ) ) ( not ( = ?auto_140799 ?auto_140803 ) ) ( not ( = ?auto_140799 ?auto_140804 ) ) ( not ( = ?auto_140800 ?auto_140801 ) ) ( not ( = ?auto_140800 ?auto_140802 ) ) ( not ( = ?auto_140800 ?auto_140803 ) ) ( not ( = ?auto_140800 ?auto_140804 ) ) ( not ( = ?auto_140801 ?auto_140802 ) ) ( not ( = ?auto_140801 ?auto_140803 ) ) ( not ( = ?auto_140801 ?auto_140804 ) ) ( not ( = ?auto_140802 ?auto_140803 ) ) ( not ( = ?auto_140802 ?auto_140804 ) ) ( not ( = ?auto_140803 ?auto_140804 ) ) ( ON ?auto_140802 ?auto_140803 ) ( ON ?auto_140801 ?auto_140802 ) ( ON ?auto_140800 ?auto_140801 ) ( ON ?auto_140799 ?auto_140800 ) ( ON ?auto_140798 ?auto_140799 ) ( ON ?auto_140797 ?auto_140798 ) ( CLEAR ?auto_140795 ) ( ON ?auto_140796 ?auto_140797 ) ( CLEAR ?auto_140796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140794 ?auto_140795 ?auto_140796 )
      ( MAKE-10PILE ?auto_140794 ?auto_140795 ?auto_140796 ?auto_140797 ?auto_140798 ?auto_140799 ?auto_140800 ?auto_140801 ?auto_140802 ?auto_140803 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_140815 - BLOCK
      ?auto_140816 - BLOCK
      ?auto_140817 - BLOCK
      ?auto_140818 - BLOCK
      ?auto_140819 - BLOCK
      ?auto_140820 - BLOCK
      ?auto_140821 - BLOCK
      ?auto_140822 - BLOCK
      ?auto_140823 - BLOCK
      ?auto_140824 - BLOCK
    )
    :vars
    (
      ?auto_140825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140824 ?auto_140825 ) ( ON-TABLE ?auto_140815 ) ( ON ?auto_140816 ?auto_140815 ) ( not ( = ?auto_140815 ?auto_140816 ) ) ( not ( = ?auto_140815 ?auto_140817 ) ) ( not ( = ?auto_140815 ?auto_140818 ) ) ( not ( = ?auto_140815 ?auto_140819 ) ) ( not ( = ?auto_140815 ?auto_140820 ) ) ( not ( = ?auto_140815 ?auto_140821 ) ) ( not ( = ?auto_140815 ?auto_140822 ) ) ( not ( = ?auto_140815 ?auto_140823 ) ) ( not ( = ?auto_140815 ?auto_140824 ) ) ( not ( = ?auto_140815 ?auto_140825 ) ) ( not ( = ?auto_140816 ?auto_140817 ) ) ( not ( = ?auto_140816 ?auto_140818 ) ) ( not ( = ?auto_140816 ?auto_140819 ) ) ( not ( = ?auto_140816 ?auto_140820 ) ) ( not ( = ?auto_140816 ?auto_140821 ) ) ( not ( = ?auto_140816 ?auto_140822 ) ) ( not ( = ?auto_140816 ?auto_140823 ) ) ( not ( = ?auto_140816 ?auto_140824 ) ) ( not ( = ?auto_140816 ?auto_140825 ) ) ( not ( = ?auto_140817 ?auto_140818 ) ) ( not ( = ?auto_140817 ?auto_140819 ) ) ( not ( = ?auto_140817 ?auto_140820 ) ) ( not ( = ?auto_140817 ?auto_140821 ) ) ( not ( = ?auto_140817 ?auto_140822 ) ) ( not ( = ?auto_140817 ?auto_140823 ) ) ( not ( = ?auto_140817 ?auto_140824 ) ) ( not ( = ?auto_140817 ?auto_140825 ) ) ( not ( = ?auto_140818 ?auto_140819 ) ) ( not ( = ?auto_140818 ?auto_140820 ) ) ( not ( = ?auto_140818 ?auto_140821 ) ) ( not ( = ?auto_140818 ?auto_140822 ) ) ( not ( = ?auto_140818 ?auto_140823 ) ) ( not ( = ?auto_140818 ?auto_140824 ) ) ( not ( = ?auto_140818 ?auto_140825 ) ) ( not ( = ?auto_140819 ?auto_140820 ) ) ( not ( = ?auto_140819 ?auto_140821 ) ) ( not ( = ?auto_140819 ?auto_140822 ) ) ( not ( = ?auto_140819 ?auto_140823 ) ) ( not ( = ?auto_140819 ?auto_140824 ) ) ( not ( = ?auto_140819 ?auto_140825 ) ) ( not ( = ?auto_140820 ?auto_140821 ) ) ( not ( = ?auto_140820 ?auto_140822 ) ) ( not ( = ?auto_140820 ?auto_140823 ) ) ( not ( = ?auto_140820 ?auto_140824 ) ) ( not ( = ?auto_140820 ?auto_140825 ) ) ( not ( = ?auto_140821 ?auto_140822 ) ) ( not ( = ?auto_140821 ?auto_140823 ) ) ( not ( = ?auto_140821 ?auto_140824 ) ) ( not ( = ?auto_140821 ?auto_140825 ) ) ( not ( = ?auto_140822 ?auto_140823 ) ) ( not ( = ?auto_140822 ?auto_140824 ) ) ( not ( = ?auto_140822 ?auto_140825 ) ) ( not ( = ?auto_140823 ?auto_140824 ) ) ( not ( = ?auto_140823 ?auto_140825 ) ) ( not ( = ?auto_140824 ?auto_140825 ) ) ( ON ?auto_140823 ?auto_140824 ) ( ON ?auto_140822 ?auto_140823 ) ( ON ?auto_140821 ?auto_140822 ) ( ON ?auto_140820 ?auto_140821 ) ( ON ?auto_140819 ?auto_140820 ) ( ON ?auto_140818 ?auto_140819 ) ( CLEAR ?auto_140816 ) ( ON ?auto_140817 ?auto_140818 ) ( CLEAR ?auto_140817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140815 ?auto_140816 ?auto_140817 )
      ( MAKE-10PILE ?auto_140815 ?auto_140816 ?auto_140817 ?auto_140818 ?auto_140819 ?auto_140820 ?auto_140821 ?auto_140822 ?auto_140823 ?auto_140824 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_140836 - BLOCK
      ?auto_140837 - BLOCK
      ?auto_140838 - BLOCK
      ?auto_140839 - BLOCK
      ?auto_140840 - BLOCK
      ?auto_140841 - BLOCK
      ?auto_140842 - BLOCK
      ?auto_140843 - BLOCK
      ?auto_140844 - BLOCK
      ?auto_140845 - BLOCK
    )
    :vars
    (
      ?auto_140846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140845 ?auto_140846 ) ( ON-TABLE ?auto_140836 ) ( not ( = ?auto_140836 ?auto_140837 ) ) ( not ( = ?auto_140836 ?auto_140838 ) ) ( not ( = ?auto_140836 ?auto_140839 ) ) ( not ( = ?auto_140836 ?auto_140840 ) ) ( not ( = ?auto_140836 ?auto_140841 ) ) ( not ( = ?auto_140836 ?auto_140842 ) ) ( not ( = ?auto_140836 ?auto_140843 ) ) ( not ( = ?auto_140836 ?auto_140844 ) ) ( not ( = ?auto_140836 ?auto_140845 ) ) ( not ( = ?auto_140836 ?auto_140846 ) ) ( not ( = ?auto_140837 ?auto_140838 ) ) ( not ( = ?auto_140837 ?auto_140839 ) ) ( not ( = ?auto_140837 ?auto_140840 ) ) ( not ( = ?auto_140837 ?auto_140841 ) ) ( not ( = ?auto_140837 ?auto_140842 ) ) ( not ( = ?auto_140837 ?auto_140843 ) ) ( not ( = ?auto_140837 ?auto_140844 ) ) ( not ( = ?auto_140837 ?auto_140845 ) ) ( not ( = ?auto_140837 ?auto_140846 ) ) ( not ( = ?auto_140838 ?auto_140839 ) ) ( not ( = ?auto_140838 ?auto_140840 ) ) ( not ( = ?auto_140838 ?auto_140841 ) ) ( not ( = ?auto_140838 ?auto_140842 ) ) ( not ( = ?auto_140838 ?auto_140843 ) ) ( not ( = ?auto_140838 ?auto_140844 ) ) ( not ( = ?auto_140838 ?auto_140845 ) ) ( not ( = ?auto_140838 ?auto_140846 ) ) ( not ( = ?auto_140839 ?auto_140840 ) ) ( not ( = ?auto_140839 ?auto_140841 ) ) ( not ( = ?auto_140839 ?auto_140842 ) ) ( not ( = ?auto_140839 ?auto_140843 ) ) ( not ( = ?auto_140839 ?auto_140844 ) ) ( not ( = ?auto_140839 ?auto_140845 ) ) ( not ( = ?auto_140839 ?auto_140846 ) ) ( not ( = ?auto_140840 ?auto_140841 ) ) ( not ( = ?auto_140840 ?auto_140842 ) ) ( not ( = ?auto_140840 ?auto_140843 ) ) ( not ( = ?auto_140840 ?auto_140844 ) ) ( not ( = ?auto_140840 ?auto_140845 ) ) ( not ( = ?auto_140840 ?auto_140846 ) ) ( not ( = ?auto_140841 ?auto_140842 ) ) ( not ( = ?auto_140841 ?auto_140843 ) ) ( not ( = ?auto_140841 ?auto_140844 ) ) ( not ( = ?auto_140841 ?auto_140845 ) ) ( not ( = ?auto_140841 ?auto_140846 ) ) ( not ( = ?auto_140842 ?auto_140843 ) ) ( not ( = ?auto_140842 ?auto_140844 ) ) ( not ( = ?auto_140842 ?auto_140845 ) ) ( not ( = ?auto_140842 ?auto_140846 ) ) ( not ( = ?auto_140843 ?auto_140844 ) ) ( not ( = ?auto_140843 ?auto_140845 ) ) ( not ( = ?auto_140843 ?auto_140846 ) ) ( not ( = ?auto_140844 ?auto_140845 ) ) ( not ( = ?auto_140844 ?auto_140846 ) ) ( not ( = ?auto_140845 ?auto_140846 ) ) ( ON ?auto_140844 ?auto_140845 ) ( ON ?auto_140843 ?auto_140844 ) ( ON ?auto_140842 ?auto_140843 ) ( ON ?auto_140841 ?auto_140842 ) ( ON ?auto_140840 ?auto_140841 ) ( ON ?auto_140839 ?auto_140840 ) ( ON ?auto_140838 ?auto_140839 ) ( CLEAR ?auto_140836 ) ( ON ?auto_140837 ?auto_140838 ) ( CLEAR ?auto_140837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140836 ?auto_140837 )
      ( MAKE-10PILE ?auto_140836 ?auto_140837 ?auto_140838 ?auto_140839 ?auto_140840 ?auto_140841 ?auto_140842 ?auto_140843 ?auto_140844 ?auto_140845 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_140857 - BLOCK
      ?auto_140858 - BLOCK
      ?auto_140859 - BLOCK
      ?auto_140860 - BLOCK
      ?auto_140861 - BLOCK
      ?auto_140862 - BLOCK
      ?auto_140863 - BLOCK
      ?auto_140864 - BLOCK
      ?auto_140865 - BLOCK
      ?auto_140866 - BLOCK
    )
    :vars
    (
      ?auto_140867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140866 ?auto_140867 ) ( ON-TABLE ?auto_140857 ) ( not ( = ?auto_140857 ?auto_140858 ) ) ( not ( = ?auto_140857 ?auto_140859 ) ) ( not ( = ?auto_140857 ?auto_140860 ) ) ( not ( = ?auto_140857 ?auto_140861 ) ) ( not ( = ?auto_140857 ?auto_140862 ) ) ( not ( = ?auto_140857 ?auto_140863 ) ) ( not ( = ?auto_140857 ?auto_140864 ) ) ( not ( = ?auto_140857 ?auto_140865 ) ) ( not ( = ?auto_140857 ?auto_140866 ) ) ( not ( = ?auto_140857 ?auto_140867 ) ) ( not ( = ?auto_140858 ?auto_140859 ) ) ( not ( = ?auto_140858 ?auto_140860 ) ) ( not ( = ?auto_140858 ?auto_140861 ) ) ( not ( = ?auto_140858 ?auto_140862 ) ) ( not ( = ?auto_140858 ?auto_140863 ) ) ( not ( = ?auto_140858 ?auto_140864 ) ) ( not ( = ?auto_140858 ?auto_140865 ) ) ( not ( = ?auto_140858 ?auto_140866 ) ) ( not ( = ?auto_140858 ?auto_140867 ) ) ( not ( = ?auto_140859 ?auto_140860 ) ) ( not ( = ?auto_140859 ?auto_140861 ) ) ( not ( = ?auto_140859 ?auto_140862 ) ) ( not ( = ?auto_140859 ?auto_140863 ) ) ( not ( = ?auto_140859 ?auto_140864 ) ) ( not ( = ?auto_140859 ?auto_140865 ) ) ( not ( = ?auto_140859 ?auto_140866 ) ) ( not ( = ?auto_140859 ?auto_140867 ) ) ( not ( = ?auto_140860 ?auto_140861 ) ) ( not ( = ?auto_140860 ?auto_140862 ) ) ( not ( = ?auto_140860 ?auto_140863 ) ) ( not ( = ?auto_140860 ?auto_140864 ) ) ( not ( = ?auto_140860 ?auto_140865 ) ) ( not ( = ?auto_140860 ?auto_140866 ) ) ( not ( = ?auto_140860 ?auto_140867 ) ) ( not ( = ?auto_140861 ?auto_140862 ) ) ( not ( = ?auto_140861 ?auto_140863 ) ) ( not ( = ?auto_140861 ?auto_140864 ) ) ( not ( = ?auto_140861 ?auto_140865 ) ) ( not ( = ?auto_140861 ?auto_140866 ) ) ( not ( = ?auto_140861 ?auto_140867 ) ) ( not ( = ?auto_140862 ?auto_140863 ) ) ( not ( = ?auto_140862 ?auto_140864 ) ) ( not ( = ?auto_140862 ?auto_140865 ) ) ( not ( = ?auto_140862 ?auto_140866 ) ) ( not ( = ?auto_140862 ?auto_140867 ) ) ( not ( = ?auto_140863 ?auto_140864 ) ) ( not ( = ?auto_140863 ?auto_140865 ) ) ( not ( = ?auto_140863 ?auto_140866 ) ) ( not ( = ?auto_140863 ?auto_140867 ) ) ( not ( = ?auto_140864 ?auto_140865 ) ) ( not ( = ?auto_140864 ?auto_140866 ) ) ( not ( = ?auto_140864 ?auto_140867 ) ) ( not ( = ?auto_140865 ?auto_140866 ) ) ( not ( = ?auto_140865 ?auto_140867 ) ) ( not ( = ?auto_140866 ?auto_140867 ) ) ( ON ?auto_140865 ?auto_140866 ) ( ON ?auto_140864 ?auto_140865 ) ( ON ?auto_140863 ?auto_140864 ) ( ON ?auto_140862 ?auto_140863 ) ( ON ?auto_140861 ?auto_140862 ) ( ON ?auto_140860 ?auto_140861 ) ( ON ?auto_140859 ?auto_140860 ) ( CLEAR ?auto_140857 ) ( ON ?auto_140858 ?auto_140859 ) ( CLEAR ?auto_140858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140857 ?auto_140858 )
      ( MAKE-10PILE ?auto_140857 ?auto_140858 ?auto_140859 ?auto_140860 ?auto_140861 ?auto_140862 ?auto_140863 ?auto_140864 ?auto_140865 ?auto_140866 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_140878 - BLOCK
      ?auto_140879 - BLOCK
      ?auto_140880 - BLOCK
      ?auto_140881 - BLOCK
      ?auto_140882 - BLOCK
      ?auto_140883 - BLOCK
      ?auto_140884 - BLOCK
      ?auto_140885 - BLOCK
      ?auto_140886 - BLOCK
      ?auto_140887 - BLOCK
    )
    :vars
    (
      ?auto_140888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140887 ?auto_140888 ) ( not ( = ?auto_140878 ?auto_140879 ) ) ( not ( = ?auto_140878 ?auto_140880 ) ) ( not ( = ?auto_140878 ?auto_140881 ) ) ( not ( = ?auto_140878 ?auto_140882 ) ) ( not ( = ?auto_140878 ?auto_140883 ) ) ( not ( = ?auto_140878 ?auto_140884 ) ) ( not ( = ?auto_140878 ?auto_140885 ) ) ( not ( = ?auto_140878 ?auto_140886 ) ) ( not ( = ?auto_140878 ?auto_140887 ) ) ( not ( = ?auto_140878 ?auto_140888 ) ) ( not ( = ?auto_140879 ?auto_140880 ) ) ( not ( = ?auto_140879 ?auto_140881 ) ) ( not ( = ?auto_140879 ?auto_140882 ) ) ( not ( = ?auto_140879 ?auto_140883 ) ) ( not ( = ?auto_140879 ?auto_140884 ) ) ( not ( = ?auto_140879 ?auto_140885 ) ) ( not ( = ?auto_140879 ?auto_140886 ) ) ( not ( = ?auto_140879 ?auto_140887 ) ) ( not ( = ?auto_140879 ?auto_140888 ) ) ( not ( = ?auto_140880 ?auto_140881 ) ) ( not ( = ?auto_140880 ?auto_140882 ) ) ( not ( = ?auto_140880 ?auto_140883 ) ) ( not ( = ?auto_140880 ?auto_140884 ) ) ( not ( = ?auto_140880 ?auto_140885 ) ) ( not ( = ?auto_140880 ?auto_140886 ) ) ( not ( = ?auto_140880 ?auto_140887 ) ) ( not ( = ?auto_140880 ?auto_140888 ) ) ( not ( = ?auto_140881 ?auto_140882 ) ) ( not ( = ?auto_140881 ?auto_140883 ) ) ( not ( = ?auto_140881 ?auto_140884 ) ) ( not ( = ?auto_140881 ?auto_140885 ) ) ( not ( = ?auto_140881 ?auto_140886 ) ) ( not ( = ?auto_140881 ?auto_140887 ) ) ( not ( = ?auto_140881 ?auto_140888 ) ) ( not ( = ?auto_140882 ?auto_140883 ) ) ( not ( = ?auto_140882 ?auto_140884 ) ) ( not ( = ?auto_140882 ?auto_140885 ) ) ( not ( = ?auto_140882 ?auto_140886 ) ) ( not ( = ?auto_140882 ?auto_140887 ) ) ( not ( = ?auto_140882 ?auto_140888 ) ) ( not ( = ?auto_140883 ?auto_140884 ) ) ( not ( = ?auto_140883 ?auto_140885 ) ) ( not ( = ?auto_140883 ?auto_140886 ) ) ( not ( = ?auto_140883 ?auto_140887 ) ) ( not ( = ?auto_140883 ?auto_140888 ) ) ( not ( = ?auto_140884 ?auto_140885 ) ) ( not ( = ?auto_140884 ?auto_140886 ) ) ( not ( = ?auto_140884 ?auto_140887 ) ) ( not ( = ?auto_140884 ?auto_140888 ) ) ( not ( = ?auto_140885 ?auto_140886 ) ) ( not ( = ?auto_140885 ?auto_140887 ) ) ( not ( = ?auto_140885 ?auto_140888 ) ) ( not ( = ?auto_140886 ?auto_140887 ) ) ( not ( = ?auto_140886 ?auto_140888 ) ) ( not ( = ?auto_140887 ?auto_140888 ) ) ( ON ?auto_140886 ?auto_140887 ) ( ON ?auto_140885 ?auto_140886 ) ( ON ?auto_140884 ?auto_140885 ) ( ON ?auto_140883 ?auto_140884 ) ( ON ?auto_140882 ?auto_140883 ) ( ON ?auto_140881 ?auto_140882 ) ( ON ?auto_140880 ?auto_140881 ) ( ON ?auto_140879 ?auto_140880 ) ( ON ?auto_140878 ?auto_140879 ) ( CLEAR ?auto_140878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_140878 )
      ( MAKE-10PILE ?auto_140878 ?auto_140879 ?auto_140880 ?auto_140881 ?auto_140882 ?auto_140883 ?auto_140884 ?auto_140885 ?auto_140886 ?auto_140887 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_140899 - BLOCK
      ?auto_140900 - BLOCK
      ?auto_140901 - BLOCK
      ?auto_140902 - BLOCK
      ?auto_140903 - BLOCK
      ?auto_140904 - BLOCK
      ?auto_140905 - BLOCK
      ?auto_140906 - BLOCK
      ?auto_140907 - BLOCK
      ?auto_140908 - BLOCK
    )
    :vars
    (
      ?auto_140909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140908 ?auto_140909 ) ( not ( = ?auto_140899 ?auto_140900 ) ) ( not ( = ?auto_140899 ?auto_140901 ) ) ( not ( = ?auto_140899 ?auto_140902 ) ) ( not ( = ?auto_140899 ?auto_140903 ) ) ( not ( = ?auto_140899 ?auto_140904 ) ) ( not ( = ?auto_140899 ?auto_140905 ) ) ( not ( = ?auto_140899 ?auto_140906 ) ) ( not ( = ?auto_140899 ?auto_140907 ) ) ( not ( = ?auto_140899 ?auto_140908 ) ) ( not ( = ?auto_140899 ?auto_140909 ) ) ( not ( = ?auto_140900 ?auto_140901 ) ) ( not ( = ?auto_140900 ?auto_140902 ) ) ( not ( = ?auto_140900 ?auto_140903 ) ) ( not ( = ?auto_140900 ?auto_140904 ) ) ( not ( = ?auto_140900 ?auto_140905 ) ) ( not ( = ?auto_140900 ?auto_140906 ) ) ( not ( = ?auto_140900 ?auto_140907 ) ) ( not ( = ?auto_140900 ?auto_140908 ) ) ( not ( = ?auto_140900 ?auto_140909 ) ) ( not ( = ?auto_140901 ?auto_140902 ) ) ( not ( = ?auto_140901 ?auto_140903 ) ) ( not ( = ?auto_140901 ?auto_140904 ) ) ( not ( = ?auto_140901 ?auto_140905 ) ) ( not ( = ?auto_140901 ?auto_140906 ) ) ( not ( = ?auto_140901 ?auto_140907 ) ) ( not ( = ?auto_140901 ?auto_140908 ) ) ( not ( = ?auto_140901 ?auto_140909 ) ) ( not ( = ?auto_140902 ?auto_140903 ) ) ( not ( = ?auto_140902 ?auto_140904 ) ) ( not ( = ?auto_140902 ?auto_140905 ) ) ( not ( = ?auto_140902 ?auto_140906 ) ) ( not ( = ?auto_140902 ?auto_140907 ) ) ( not ( = ?auto_140902 ?auto_140908 ) ) ( not ( = ?auto_140902 ?auto_140909 ) ) ( not ( = ?auto_140903 ?auto_140904 ) ) ( not ( = ?auto_140903 ?auto_140905 ) ) ( not ( = ?auto_140903 ?auto_140906 ) ) ( not ( = ?auto_140903 ?auto_140907 ) ) ( not ( = ?auto_140903 ?auto_140908 ) ) ( not ( = ?auto_140903 ?auto_140909 ) ) ( not ( = ?auto_140904 ?auto_140905 ) ) ( not ( = ?auto_140904 ?auto_140906 ) ) ( not ( = ?auto_140904 ?auto_140907 ) ) ( not ( = ?auto_140904 ?auto_140908 ) ) ( not ( = ?auto_140904 ?auto_140909 ) ) ( not ( = ?auto_140905 ?auto_140906 ) ) ( not ( = ?auto_140905 ?auto_140907 ) ) ( not ( = ?auto_140905 ?auto_140908 ) ) ( not ( = ?auto_140905 ?auto_140909 ) ) ( not ( = ?auto_140906 ?auto_140907 ) ) ( not ( = ?auto_140906 ?auto_140908 ) ) ( not ( = ?auto_140906 ?auto_140909 ) ) ( not ( = ?auto_140907 ?auto_140908 ) ) ( not ( = ?auto_140907 ?auto_140909 ) ) ( not ( = ?auto_140908 ?auto_140909 ) ) ( ON ?auto_140907 ?auto_140908 ) ( ON ?auto_140906 ?auto_140907 ) ( ON ?auto_140905 ?auto_140906 ) ( ON ?auto_140904 ?auto_140905 ) ( ON ?auto_140903 ?auto_140904 ) ( ON ?auto_140902 ?auto_140903 ) ( ON ?auto_140901 ?auto_140902 ) ( ON ?auto_140900 ?auto_140901 ) ( ON ?auto_140899 ?auto_140900 ) ( CLEAR ?auto_140899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_140899 )
      ( MAKE-10PILE ?auto_140899 ?auto_140900 ?auto_140901 ?auto_140902 ?auto_140903 ?auto_140904 ?auto_140905 ?auto_140906 ?auto_140907 ?auto_140908 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_140921 - BLOCK
      ?auto_140922 - BLOCK
      ?auto_140923 - BLOCK
      ?auto_140924 - BLOCK
      ?auto_140925 - BLOCK
      ?auto_140926 - BLOCK
      ?auto_140927 - BLOCK
      ?auto_140928 - BLOCK
      ?auto_140929 - BLOCK
      ?auto_140930 - BLOCK
      ?auto_140931 - BLOCK
    )
    :vars
    (
      ?auto_140932 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_140930 ) ( ON ?auto_140931 ?auto_140932 ) ( CLEAR ?auto_140931 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_140921 ) ( ON ?auto_140922 ?auto_140921 ) ( ON ?auto_140923 ?auto_140922 ) ( ON ?auto_140924 ?auto_140923 ) ( ON ?auto_140925 ?auto_140924 ) ( ON ?auto_140926 ?auto_140925 ) ( ON ?auto_140927 ?auto_140926 ) ( ON ?auto_140928 ?auto_140927 ) ( ON ?auto_140929 ?auto_140928 ) ( ON ?auto_140930 ?auto_140929 ) ( not ( = ?auto_140921 ?auto_140922 ) ) ( not ( = ?auto_140921 ?auto_140923 ) ) ( not ( = ?auto_140921 ?auto_140924 ) ) ( not ( = ?auto_140921 ?auto_140925 ) ) ( not ( = ?auto_140921 ?auto_140926 ) ) ( not ( = ?auto_140921 ?auto_140927 ) ) ( not ( = ?auto_140921 ?auto_140928 ) ) ( not ( = ?auto_140921 ?auto_140929 ) ) ( not ( = ?auto_140921 ?auto_140930 ) ) ( not ( = ?auto_140921 ?auto_140931 ) ) ( not ( = ?auto_140921 ?auto_140932 ) ) ( not ( = ?auto_140922 ?auto_140923 ) ) ( not ( = ?auto_140922 ?auto_140924 ) ) ( not ( = ?auto_140922 ?auto_140925 ) ) ( not ( = ?auto_140922 ?auto_140926 ) ) ( not ( = ?auto_140922 ?auto_140927 ) ) ( not ( = ?auto_140922 ?auto_140928 ) ) ( not ( = ?auto_140922 ?auto_140929 ) ) ( not ( = ?auto_140922 ?auto_140930 ) ) ( not ( = ?auto_140922 ?auto_140931 ) ) ( not ( = ?auto_140922 ?auto_140932 ) ) ( not ( = ?auto_140923 ?auto_140924 ) ) ( not ( = ?auto_140923 ?auto_140925 ) ) ( not ( = ?auto_140923 ?auto_140926 ) ) ( not ( = ?auto_140923 ?auto_140927 ) ) ( not ( = ?auto_140923 ?auto_140928 ) ) ( not ( = ?auto_140923 ?auto_140929 ) ) ( not ( = ?auto_140923 ?auto_140930 ) ) ( not ( = ?auto_140923 ?auto_140931 ) ) ( not ( = ?auto_140923 ?auto_140932 ) ) ( not ( = ?auto_140924 ?auto_140925 ) ) ( not ( = ?auto_140924 ?auto_140926 ) ) ( not ( = ?auto_140924 ?auto_140927 ) ) ( not ( = ?auto_140924 ?auto_140928 ) ) ( not ( = ?auto_140924 ?auto_140929 ) ) ( not ( = ?auto_140924 ?auto_140930 ) ) ( not ( = ?auto_140924 ?auto_140931 ) ) ( not ( = ?auto_140924 ?auto_140932 ) ) ( not ( = ?auto_140925 ?auto_140926 ) ) ( not ( = ?auto_140925 ?auto_140927 ) ) ( not ( = ?auto_140925 ?auto_140928 ) ) ( not ( = ?auto_140925 ?auto_140929 ) ) ( not ( = ?auto_140925 ?auto_140930 ) ) ( not ( = ?auto_140925 ?auto_140931 ) ) ( not ( = ?auto_140925 ?auto_140932 ) ) ( not ( = ?auto_140926 ?auto_140927 ) ) ( not ( = ?auto_140926 ?auto_140928 ) ) ( not ( = ?auto_140926 ?auto_140929 ) ) ( not ( = ?auto_140926 ?auto_140930 ) ) ( not ( = ?auto_140926 ?auto_140931 ) ) ( not ( = ?auto_140926 ?auto_140932 ) ) ( not ( = ?auto_140927 ?auto_140928 ) ) ( not ( = ?auto_140927 ?auto_140929 ) ) ( not ( = ?auto_140927 ?auto_140930 ) ) ( not ( = ?auto_140927 ?auto_140931 ) ) ( not ( = ?auto_140927 ?auto_140932 ) ) ( not ( = ?auto_140928 ?auto_140929 ) ) ( not ( = ?auto_140928 ?auto_140930 ) ) ( not ( = ?auto_140928 ?auto_140931 ) ) ( not ( = ?auto_140928 ?auto_140932 ) ) ( not ( = ?auto_140929 ?auto_140930 ) ) ( not ( = ?auto_140929 ?auto_140931 ) ) ( not ( = ?auto_140929 ?auto_140932 ) ) ( not ( = ?auto_140930 ?auto_140931 ) ) ( not ( = ?auto_140930 ?auto_140932 ) ) ( not ( = ?auto_140931 ?auto_140932 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_140931 ?auto_140932 )
      ( !STACK ?auto_140931 ?auto_140930 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_140944 - BLOCK
      ?auto_140945 - BLOCK
      ?auto_140946 - BLOCK
      ?auto_140947 - BLOCK
      ?auto_140948 - BLOCK
      ?auto_140949 - BLOCK
      ?auto_140950 - BLOCK
      ?auto_140951 - BLOCK
      ?auto_140952 - BLOCK
      ?auto_140953 - BLOCK
      ?auto_140954 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_140953 ) ( ON-TABLE ?auto_140954 ) ( CLEAR ?auto_140954 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_140944 ) ( ON ?auto_140945 ?auto_140944 ) ( ON ?auto_140946 ?auto_140945 ) ( ON ?auto_140947 ?auto_140946 ) ( ON ?auto_140948 ?auto_140947 ) ( ON ?auto_140949 ?auto_140948 ) ( ON ?auto_140950 ?auto_140949 ) ( ON ?auto_140951 ?auto_140950 ) ( ON ?auto_140952 ?auto_140951 ) ( ON ?auto_140953 ?auto_140952 ) ( not ( = ?auto_140944 ?auto_140945 ) ) ( not ( = ?auto_140944 ?auto_140946 ) ) ( not ( = ?auto_140944 ?auto_140947 ) ) ( not ( = ?auto_140944 ?auto_140948 ) ) ( not ( = ?auto_140944 ?auto_140949 ) ) ( not ( = ?auto_140944 ?auto_140950 ) ) ( not ( = ?auto_140944 ?auto_140951 ) ) ( not ( = ?auto_140944 ?auto_140952 ) ) ( not ( = ?auto_140944 ?auto_140953 ) ) ( not ( = ?auto_140944 ?auto_140954 ) ) ( not ( = ?auto_140945 ?auto_140946 ) ) ( not ( = ?auto_140945 ?auto_140947 ) ) ( not ( = ?auto_140945 ?auto_140948 ) ) ( not ( = ?auto_140945 ?auto_140949 ) ) ( not ( = ?auto_140945 ?auto_140950 ) ) ( not ( = ?auto_140945 ?auto_140951 ) ) ( not ( = ?auto_140945 ?auto_140952 ) ) ( not ( = ?auto_140945 ?auto_140953 ) ) ( not ( = ?auto_140945 ?auto_140954 ) ) ( not ( = ?auto_140946 ?auto_140947 ) ) ( not ( = ?auto_140946 ?auto_140948 ) ) ( not ( = ?auto_140946 ?auto_140949 ) ) ( not ( = ?auto_140946 ?auto_140950 ) ) ( not ( = ?auto_140946 ?auto_140951 ) ) ( not ( = ?auto_140946 ?auto_140952 ) ) ( not ( = ?auto_140946 ?auto_140953 ) ) ( not ( = ?auto_140946 ?auto_140954 ) ) ( not ( = ?auto_140947 ?auto_140948 ) ) ( not ( = ?auto_140947 ?auto_140949 ) ) ( not ( = ?auto_140947 ?auto_140950 ) ) ( not ( = ?auto_140947 ?auto_140951 ) ) ( not ( = ?auto_140947 ?auto_140952 ) ) ( not ( = ?auto_140947 ?auto_140953 ) ) ( not ( = ?auto_140947 ?auto_140954 ) ) ( not ( = ?auto_140948 ?auto_140949 ) ) ( not ( = ?auto_140948 ?auto_140950 ) ) ( not ( = ?auto_140948 ?auto_140951 ) ) ( not ( = ?auto_140948 ?auto_140952 ) ) ( not ( = ?auto_140948 ?auto_140953 ) ) ( not ( = ?auto_140948 ?auto_140954 ) ) ( not ( = ?auto_140949 ?auto_140950 ) ) ( not ( = ?auto_140949 ?auto_140951 ) ) ( not ( = ?auto_140949 ?auto_140952 ) ) ( not ( = ?auto_140949 ?auto_140953 ) ) ( not ( = ?auto_140949 ?auto_140954 ) ) ( not ( = ?auto_140950 ?auto_140951 ) ) ( not ( = ?auto_140950 ?auto_140952 ) ) ( not ( = ?auto_140950 ?auto_140953 ) ) ( not ( = ?auto_140950 ?auto_140954 ) ) ( not ( = ?auto_140951 ?auto_140952 ) ) ( not ( = ?auto_140951 ?auto_140953 ) ) ( not ( = ?auto_140951 ?auto_140954 ) ) ( not ( = ?auto_140952 ?auto_140953 ) ) ( not ( = ?auto_140952 ?auto_140954 ) ) ( not ( = ?auto_140953 ?auto_140954 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_140954 )
      ( !STACK ?auto_140954 ?auto_140953 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_140966 - BLOCK
      ?auto_140967 - BLOCK
      ?auto_140968 - BLOCK
      ?auto_140969 - BLOCK
      ?auto_140970 - BLOCK
      ?auto_140971 - BLOCK
      ?auto_140972 - BLOCK
      ?auto_140973 - BLOCK
      ?auto_140974 - BLOCK
      ?auto_140975 - BLOCK
      ?auto_140976 - BLOCK
    )
    :vars
    (
      ?auto_140977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140976 ?auto_140977 ) ( ON-TABLE ?auto_140966 ) ( ON ?auto_140967 ?auto_140966 ) ( ON ?auto_140968 ?auto_140967 ) ( ON ?auto_140969 ?auto_140968 ) ( ON ?auto_140970 ?auto_140969 ) ( ON ?auto_140971 ?auto_140970 ) ( ON ?auto_140972 ?auto_140971 ) ( ON ?auto_140973 ?auto_140972 ) ( ON ?auto_140974 ?auto_140973 ) ( not ( = ?auto_140966 ?auto_140967 ) ) ( not ( = ?auto_140966 ?auto_140968 ) ) ( not ( = ?auto_140966 ?auto_140969 ) ) ( not ( = ?auto_140966 ?auto_140970 ) ) ( not ( = ?auto_140966 ?auto_140971 ) ) ( not ( = ?auto_140966 ?auto_140972 ) ) ( not ( = ?auto_140966 ?auto_140973 ) ) ( not ( = ?auto_140966 ?auto_140974 ) ) ( not ( = ?auto_140966 ?auto_140975 ) ) ( not ( = ?auto_140966 ?auto_140976 ) ) ( not ( = ?auto_140966 ?auto_140977 ) ) ( not ( = ?auto_140967 ?auto_140968 ) ) ( not ( = ?auto_140967 ?auto_140969 ) ) ( not ( = ?auto_140967 ?auto_140970 ) ) ( not ( = ?auto_140967 ?auto_140971 ) ) ( not ( = ?auto_140967 ?auto_140972 ) ) ( not ( = ?auto_140967 ?auto_140973 ) ) ( not ( = ?auto_140967 ?auto_140974 ) ) ( not ( = ?auto_140967 ?auto_140975 ) ) ( not ( = ?auto_140967 ?auto_140976 ) ) ( not ( = ?auto_140967 ?auto_140977 ) ) ( not ( = ?auto_140968 ?auto_140969 ) ) ( not ( = ?auto_140968 ?auto_140970 ) ) ( not ( = ?auto_140968 ?auto_140971 ) ) ( not ( = ?auto_140968 ?auto_140972 ) ) ( not ( = ?auto_140968 ?auto_140973 ) ) ( not ( = ?auto_140968 ?auto_140974 ) ) ( not ( = ?auto_140968 ?auto_140975 ) ) ( not ( = ?auto_140968 ?auto_140976 ) ) ( not ( = ?auto_140968 ?auto_140977 ) ) ( not ( = ?auto_140969 ?auto_140970 ) ) ( not ( = ?auto_140969 ?auto_140971 ) ) ( not ( = ?auto_140969 ?auto_140972 ) ) ( not ( = ?auto_140969 ?auto_140973 ) ) ( not ( = ?auto_140969 ?auto_140974 ) ) ( not ( = ?auto_140969 ?auto_140975 ) ) ( not ( = ?auto_140969 ?auto_140976 ) ) ( not ( = ?auto_140969 ?auto_140977 ) ) ( not ( = ?auto_140970 ?auto_140971 ) ) ( not ( = ?auto_140970 ?auto_140972 ) ) ( not ( = ?auto_140970 ?auto_140973 ) ) ( not ( = ?auto_140970 ?auto_140974 ) ) ( not ( = ?auto_140970 ?auto_140975 ) ) ( not ( = ?auto_140970 ?auto_140976 ) ) ( not ( = ?auto_140970 ?auto_140977 ) ) ( not ( = ?auto_140971 ?auto_140972 ) ) ( not ( = ?auto_140971 ?auto_140973 ) ) ( not ( = ?auto_140971 ?auto_140974 ) ) ( not ( = ?auto_140971 ?auto_140975 ) ) ( not ( = ?auto_140971 ?auto_140976 ) ) ( not ( = ?auto_140971 ?auto_140977 ) ) ( not ( = ?auto_140972 ?auto_140973 ) ) ( not ( = ?auto_140972 ?auto_140974 ) ) ( not ( = ?auto_140972 ?auto_140975 ) ) ( not ( = ?auto_140972 ?auto_140976 ) ) ( not ( = ?auto_140972 ?auto_140977 ) ) ( not ( = ?auto_140973 ?auto_140974 ) ) ( not ( = ?auto_140973 ?auto_140975 ) ) ( not ( = ?auto_140973 ?auto_140976 ) ) ( not ( = ?auto_140973 ?auto_140977 ) ) ( not ( = ?auto_140974 ?auto_140975 ) ) ( not ( = ?auto_140974 ?auto_140976 ) ) ( not ( = ?auto_140974 ?auto_140977 ) ) ( not ( = ?auto_140975 ?auto_140976 ) ) ( not ( = ?auto_140975 ?auto_140977 ) ) ( not ( = ?auto_140976 ?auto_140977 ) ) ( CLEAR ?auto_140974 ) ( ON ?auto_140975 ?auto_140976 ) ( CLEAR ?auto_140975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_140966 ?auto_140967 ?auto_140968 ?auto_140969 ?auto_140970 ?auto_140971 ?auto_140972 ?auto_140973 ?auto_140974 ?auto_140975 )
      ( MAKE-11PILE ?auto_140966 ?auto_140967 ?auto_140968 ?auto_140969 ?auto_140970 ?auto_140971 ?auto_140972 ?auto_140973 ?auto_140974 ?auto_140975 ?auto_140976 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_140989 - BLOCK
      ?auto_140990 - BLOCK
      ?auto_140991 - BLOCK
      ?auto_140992 - BLOCK
      ?auto_140993 - BLOCK
      ?auto_140994 - BLOCK
      ?auto_140995 - BLOCK
      ?auto_140996 - BLOCK
      ?auto_140997 - BLOCK
      ?auto_140998 - BLOCK
      ?auto_140999 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140999 ) ( ON-TABLE ?auto_140989 ) ( ON ?auto_140990 ?auto_140989 ) ( ON ?auto_140991 ?auto_140990 ) ( ON ?auto_140992 ?auto_140991 ) ( ON ?auto_140993 ?auto_140992 ) ( ON ?auto_140994 ?auto_140993 ) ( ON ?auto_140995 ?auto_140994 ) ( ON ?auto_140996 ?auto_140995 ) ( ON ?auto_140997 ?auto_140996 ) ( not ( = ?auto_140989 ?auto_140990 ) ) ( not ( = ?auto_140989 ?auto_140991 ) ) ( not ( = ?auto_140989 ?auto_140992 ) ) ( not ( = ?auto_140989 ?auto_140993 ) ) ( not ( = ?auto_140989 ?auto_140994 ) ) ( not ( = ?auto_140989 ?auto_140995 ) ) ( not ( = ?auto_140989 ?auto_140996 ) ) ( not ( = ?auto_140989 ?auto_140997 ) ) ( not ( = ?auto_140989 ?auto_140998 ) ) ( not ( = ?auto_140989 ?auto_140999 ) ) ( not ( = ?auto_140990 ?auto_140991 ) ) ( not ( = ?auto_140990 ?auto_140992 ) ) ( not ( = ?auto_140990 ?auto_140993 ) ) ( not ( = ?auto_140990 ?auto_140994 ) ) ( not ( = ?auto_140990 ?auto_140995 ) ) ( not ( = ?auto_140990 ?auto_140996 ) ) ( not ( = ?auto_140990 ?auto_140997 ) ) ( not ( = ?auto_140990 ?auto_140998 ) ) ( not ( = ?auto_140990 ?auto_140999 ) ) ( not ( = ?auto_140991 ?auto_140992 ) ) ( not ( = ?auto_140991 ?auto_140993 ) ) ( not ( = ?auto_140991 ?auto_140994 ) ) ( not ( = ?auto_140991 ?auto_140995 ) ) ( not ( = ?auto_140991 ?auto_140996 ) ) ( not ( = ?auto_140991 ?auto_140997 ) ) ( not ( = ?auto_140991 ?auto_140998 ) ) ( not ( = ?auto_140991 ?auto_140999 ) ) ( not ( = ?auto_140992 ?auto_140993 ) ) ( not ( = ?auto_140992 ?auto_140994 ) ) ( not ( = ?auto_140992 ?auto_140995 ) ) ( not ( = ?auto_140992 ?auto_140996 ) ) ( not ( = ?auto_140992 ?auto_140997 ) ) ( not ( = ?auto_140992 ?auto_140998 ) ) ( not ( = ?auto_140992 ?auto_140999 ) ) ( not ( = ?auto_140993 ?auto_140994 ) ) ( not ( = ?auto_140993 ?auto_140995 ) ) ( not ( = ?auto_140993 ?auto_140996 ) ) ( not ( = ?auto_140993 ?auto_140997 ) ) ( not ( = ?auto_140993 ?auto_140998 ) ) ( not ( = ?auto_140993 ?auto_140999 ) ) ( not ( = ?auto_140994 ?auto_140995 ) ) ( not ( = ?auto_140994 ?auto_140996 ) ) ( not ( = ?auto_140994 ?auto_140997 ) ) ( not ( = ?auto_140994 ?auto_140998 ) ) ( not ( = ?auto_140994 ?auto_140999 ) ) ( not ( = ?auto_140995 ?auto_140996 ) ) ( not ( = ?auto_140995 ?auto_140997 ) ) ( not ( = ?auto_140995 ?auto_140998 ) ) ( not ( = ?auto_140995 ?auto_140999 ) ) ( not ( = ?auto_140996 ?auto_140997 ) ) ( not ( = ?auto_140996 ?auto_140998 ) ) ( not ( = ?auto_140996 ?auto_140999 ) ) ( not ( = ?auto_140997 ?auto_140998 ) ) ( not ( = ?auto_140997 ?auto_140999 ) ) ( not ( = ?auto_140998 ?auto_140999 ) ) ( CLEAR ?auto_140997 ) ( ON ?auto_140998 ?auto_140999 ) ( CLEAR ?auto_140998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_140989 ?auto_140990 ?auto_140991 ?auto_140992 ?auto_140993 ?auto_140994 ?auto_140995 ?auto_140996 ?auto_140997 ?auto_140998 )
      ( MAKE-11PILE ?auto_140989 ?auto_140990 ?auto_140991 ?auto_140992 ?auto_140993 ?auto_140994 ?auto_140995 ?auto_140996 ?auto_140997 ?auto_140998 ?auto_140999 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_141011 - BLOCK
      ?auto_141012 - BLOCK
      ?auto_141013 - BLOCK
      ?auto_141014 - BLOCK
      ?auto_141015 - BLOCK
      ?auto_141016 - BLOCK
      ?auto_141017 - BLOCK
      ?auto_141018 - BLOCK
      ?auto_141019 - BLOCK
      ?auto_141020 - BLOCK
      ?auto_141021 - BLOCK
    )
    :vars
    (
      ?auto_141022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141021 ?auto_141022 ) ( ON-TABLE ?auto_141011 ) ( ON ?auto_141012 ?auto_141011 ) ( ON ?auto_141013 ?auto_141012 ) ( ON ?auto_141014 ?auto_141013 ) ( ON ?auto_141015 ?auto_141014 ) ( ON ?auto_141016 ?auto_141015 ) ( ON ?auto_141017 ?auto_141016 ) ( ON ?auto_141018 ?auto_141017 ) ( not ( = ?auto_141011 ?auto_141012 ) ) ( not ( = ?auto_141011 ?auto_141013 ) ) ( not ( = ?auto_141011 ?auto_141014 ) ) ( not ( = ?auto_141011 ?auto_141015 ) ) ( not ( = ?auto_141011 ?auto_141016 ) ) ( not ( = ?auto_141011 ?auto_141017 ) ) ( not ( = ?auto_141011 ?auto_141018 ) ) ( not ( = ?auto_141011 ?auto_141019 ) ) ( not ( = ?auto_141011 ?auto_141020 ) ) ( not ( = ?auto_141011 ?auto_141021 ) ) ( not ( = ?auto_141011 ?auto_141022 ) ) ( not ( = ?auto_141012 ?auto_141013 ) ) ( not ( = ?auto_141012 ?auto_141014 ) ) ( not ( = ?auto_141012 ?auto_141015 ) ) ( not ( = ?auto_141012 ?auto_141016 ) ) ( not ( = ?auto_141012 ?auto_141017 ) ) ( not ( = ?auto_141012 ?auto_141018 ) ) ( not ( = ?auto_141012 ?auto_141019 ) ) ( not ( = ?auto_141012 ?auto_141020 ) ) ( not ( = ?auto_141012 ?auto_141021 ) ) ( not ( = ?auto_141012 ?auto_141022 ) ) ( not ( = ?auto_141013 ?auto_141014 ) ) ( not ( = ?auto_141013 ?auto_141015 ) ) ( not ( = ?auto_141013 ?auto_141016 ) ) ( not ( = ?auto_141013 ?auto_141017 ) ) ( not ( = ?auto_141013 ?auto_141018 ) ) ( not ( = ?auto_141013 ?auto_141019 ) ) ( not ( = ?auto_141013 ?auto_141020 ) ) ( not ( = ?auto_141013 ?auto_141021 ) ) ( not ( = ?auto_141013 ?auto_141022 ) ) ( not ( = ?auto_141014 ?auto_141015 ) ) ( not ( = ?auto_141014 ?auto_141016 ) ) ( not ( = ?auto_141014 ?auto_141017 ) ) ( not ( = ?auto_141014 ?auto_141018 ) ) ( not ( = ?auto_141014 ?auto_141019 ) ) ( not ( = ?auto_141014 ?auto_141020 ) ) ( not ( = ?auto_141014 ?auto_141021 ) ) ( not ( = ?auto_141014 ?auto_141022 ) ) ( not ( = ?auto_141015 ?auto_141016 ) ) ( not ( = ?auto_141015 ?auto_141017 ) ) ( not ( = ?auto_141015 ?auto_141018 ) ) ( not ( = ?auto_141015 ?auto_141019 ) ) ( not ( = ?auto_141015 ?auto_141020 ) ) ( not ( = ?auto_141015 ?auto_141021 ) ) ( not ( = ?auto_141015 ?auto_141022 ) ) ( not ( = ?auto_141016 ?auto_141017 ) ) ( not ( = ?auto_141016 ?auto_141018 ) ) ( not ( = ?auto_141016 ?auto_141019 ) ) ( not ( = ?auto_141016 ?auto_141020 ) ) ( not ( = ?auto_141016 ?auto_141021 ) ) ( not ( = ?auto_141016 ?auto_141022 ) ) ( not ( = ?auto_141017 ?auto_141018 ) ) ( not ( = ?auto_141017 ?auto_141019 ) ) ( not ( = ?auto_141017 ?auto_141020 ) ) ( not ( = ?auto_141017 ?auto_141021 ) ) ( not ( = ?auto_141017 ?auto_141022 ) ) ( not ( = ?auto_141018 ?auto_141019 ) ) ( not ( = ?auto_141018 ?auto_141020 ) ) ( not ( = ?auto_141018 ?auto_141021 ) ) ( not ( = ?auto_141018 ?auto_141022 ) ) ( not ( = ?auto_141019 ?auto_141020 ) ) ( not ( = ?auto_141019 ?auto_141021 ) ) ( not ( = ?auto_141019 ?auto_141022 ) ) ( not ( = ?auto_141020 ?auto_141021 ) ) ( not ( = ?auto_141020 ?auto_141022 ) ) ( not ( = ?auto_141021 ?auto_141022 ) ) ( ON ?auto_141020 ?auto_141021 ) ( CLEAR ?auto_141018 ) ( ON ?auto_141019 ?auto_141020 ) ( CLEAR ?auto_141019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_141011 ?auto_141012 ?auto_141013 ?auto_141014 ?auto_141015 ?auto_141016 ?auto_141017 ?auto_141018 ?auto_141019 )
      ( MAKE-11PILE ?auto_141011 ?auto_141012 ?auto_141013 ?auto_141014 ?auto_141015 ?auto_141016 ?auto_141017 ?auto_141018 ?auto_141019 ?auto_141020 ?auto_141021 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_141034 - BLOCK
      ?auto_141035 - BLOCK
      ?auto_141036 - BLOCK
      ?auto_141037 - BLOCK
      ?auto_141038 - BLOCK
      ?auto_141039 - BLOCK
      ?auto_141040 - BLOCK
      ?auto_141041 - BLOCK
      ?auto_141042 - BLOCK
      ?auto_141043 - BLOCK
      ?auto_141044 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141044 ) ( ON-TABLE ?auto_141034 ) ( ON ?auto_141035 ?auto_141034 ) ( ON ?auto_141036 ?auto_141035 ) ( ON ?auto_141037 ?auto_141036 ) ( ON ?auto_141038 ?auto_141037 ) ( ON ?auto_141039 ?auto_141038 ) ( ON ?auto_141040 ?auto_141039 ) ( ON ?auto_141041 ?auto_141040 ) ( not ( = ?auto_141034 ?auto_141035 ) ) ( not ( = ?auto_141034 ?auto_141036 ) ) ( not ( = ?auto_141034 ?auto_141037 ) ) ( not ( = ?auto_141034 ?auto_141038 ) ) ( not ( = ?auto_141034 ?auto_141039 ) ) ( not ( = ?auto_141034 ?auto_141040 ) ) ( not ( = ?auto_141034 ?auto_141041 ) ) ( not ( = ?auto_141034 ?auto_141042 ) ) ( not ( = ?auto_141034 ?auto_141043 ) ) ( not ( = ?auto_141034 ?auto_141044 ) ) ( not ( = ?auto_141035 ?auto_141036 ) ) ( not ( = ?auto_141035 ?auto_141037 ) ) ( not ( = ?auto_141035 ?auto_141038 ) ) ( not ( = ?auto_141035 ?auto_141039 ) ) ( not ( = ?auto_141035 ?auto_141040 ) ) ( not ( = ?auto_141035 ?auto_141041 ) ) ( not ( = ?auto_141035 ?auto_141042 ) ) ( not ( = ?auto_141035 ?auto_141043 ) ) ( not ( = ?auto_141035 ?auto_141044 ) ) ( not ( = ?auto_141036 ?auto_141037 ) ) ( not ( = ?auto_141036 ?auto_141038 ) ) ( not ( = ?auto_141036 ?auto_141039 ) ) ( not ( = ?auto_141036 ?auto_141040 ) ) ( not ( = ?auto_141036 ?auto_141041 ) ) ( not ( = ?auto_141036 ?auto_141042 ) ) ( not ( = ?auto_141036 ?auto_141043 ) ) ( not ( = ?auto_141036 ?auto_141044 ) ) ( not ( = ?auto_141037 ?auto_141038 ) ) ( not ( = ?auto_141037 ?auto_141039 ) ) ( not ( = ?auto_141037 ?auto_141040 ) ) ( not ( = ?auto_141037 ?auto_141041 ) ) ( not ( = ?auto_141037 ?auto_141042 ) ) ( not ( = ?auto_141037 ?auto_141043 ) ) ( not ( = ?auto_141037 ?auto_141044 ) ) ( not ( = ?auto_141038 ?auto_141039 ) ) ( not ( = ?auto_141038 ?auto_141040 ) ) ( not ( = ?auto_141038 ?auto_141041 ) ) ( not ( = ?auto_141038 ?auto_141042 ) ) ( not ( = ?auto_141038 ?auto_141043 ) ) ( not ( = ?auto_141038 ?auto_141044 ) ) ( not ( = ?auto_141039 ?auto_141040 ) ) ( not ( = ?auto_141039 ?auto_141041 ) ) ( not ( = ?auto_141039 ?auto_141042 ) ) ( not ( = ?auto_141039 ?auto_141043 ) ) ( not ( = ?auto_141039 ?auto_141044 ) ) ( not ( = ?auto_141040 ?auto_141041 ) ) ( not ( = ?auto_141040 ?auto_141042 ) ) ( not ( = ?auto_141040 ?auto_141043 ) ) ( not ( = ?auto_141040 ?auto_141044 ) ) ( not ( = ?auto_141041 ?auto_141042 ) ) ( not ( = ?auto_141041 ?auto_141043 ) ) ( not ( = ?auto_141041 ?auto_141044 ) ) ( not ( = ?auto_141042 ?auto_141043 ) ) ( not ( = ?auto_141042 ?auto_141044 ) ) ( not ( = ?auto_141043 ?auto_141044 ) ) ( ON ?auto_141043 ?auto_141044 ) ( CLEAR ?auto_141041 ) ( ON ?auto_141042 ?auto_141043 ) ( CLEAR ?auto_141042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_141034 ?auto_141035 ?auto_141036 ?auto_141037 ?auto_141038 ?auto_141039 ?auto_141040 ?auto_141041 ?auto_141042 )
      ( MAKE-11PILE ?auto_141034 ?auto_141035 ?auto_141036 ?auto_141037 ?auto_141038 ?auto_141039 ?auto_141040 ?auto_141041 ?auto_141042 ?auto_141043 ?auto_141044 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_141056 - BLOCK
      ?auto_141057 - BLOCK
      ?auto_141058 - BLOCK
      ?auto_141059 - BLOCK
      ?auto_141060 - BLOCK
      ?auto_141061 - BLOCK
      ?auto_141062 - BLOCK
      ?auto_141063 - BLOCK
      ?auto_141064 - BLOCK
      ?auto_141065 - BLOCK
      ?auto_141066 - BLOCK
    )
    :vars
    (
      ?auto_141067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141066 ?auto_141067 ) ( ON-TABLE ?auto_141056 ) ( ON ?auto_141057 ?auto_141056 ) ( ON ?auto_141058 ?auto_141057 ) ( ON ?auto_141059 ?auto_141058 ) ( ON ?auto_141060 ?auto_141059 ) ( ON ?auto_141061 ?auto_141060 ) ( ON ?auto_141062 ?auto_141061 ) ( not ( = ?auto_141056 ?auto_141057 ) ) ( not ( = ?auto_141056 ?auto_141058 ) ) ( not ( = ?auto_141056 ?auto_141059 ) ) ( not ( = ?auto_141056 ?auto_141060 ) ) ( not ( = ?auto_141056 ?auto_141061 ) ) ( not ( = ?auto_141056 ?auto_141062 ) ) ( not ( = ?auto_141056 ?auto_141063 ) ) ( not ( = ?auto_141056 ?auto_141064 ) ) ( not ( = ?auto_141056 ?auto_141065 ) ) ( not ( = ?auto_141056 ?auto_141066 ) ) ( not ( = ?auto_141056 ?auto_141067 ) ) ( not ( = ?auto_141057 ?auto_141058 ) ) ( not ( = ?auto_141057 ?auto_141059 ) ) ( not ( = ?auto_141057 ?auto_141060 ) ) ( not ( = ?auto_141057 ?auto_141061 ) ) ( not ( = ?auto_141057 ?auto_141062 ) ) ( not ( = ?auto_141057 ?auto_141063 ) ) ( not ( = ?auto_141057 ?auto_141064 ) ) ( not ( = ?auto_141057 ?auto_141065 ) ) ( not ( = ?auto_141057 ?auto_141066 ) ) ( not ( = ?auto_141057 ?auto_141067 ) ) ( not ( = ?auto_141058 ?auto_141059 ) ) ( not ( = ?auto_141058 ?auto_141060 ) ) ( not ( = ?auto_141058 ?auto_141061 ) ) ( not ( = ?auto_141058 ?auto_141062 ) ) ( not ( = ?auto_141058 ?auto_141063 ) ) ( not ( = ?auto_141058 ?auto_141064 ) ) ( not ( = ?auto_141058 ?auto_141065 ) ) ( not ( = ?auto_141058 ?auto_141066 ) ) ( not ( = ?auto_141058 ?auto_141067 ) ) ( not ( = ?auto_141059 ?auto_141060 ) ) ( not ( = ?auto_141059 ?auto_141061 ) ) ( not ( = ?auto_141059 ?auto_141062 ) ) ( not ( = ?auto_141059 ?auto_141063 ) ) ( not ( = ?auto_141059 ?auto_141064 ) ) ( not ( = ?auto_141059 ?auto_141065 ) ) ( not ( = ?auto_141059 ?auto_141066 ) ) ( not ( = ?auto_141059 ?auto_141067 ) ) ( not ( = ?auto_141060 ?auto_141061 ) ) ( not ( = ?auto_141060 ?auto_141062 ) ) ( not ( = ?auto_141060 ?auto_141063 ) ) ( not ( = ?auto_141060 ?auto_141064 ) ) ( not ( = ?auto_141060 ?auto_141065 ) ) ( not ( = ?auto_141060 ?auto_141066 ) ) ( not ( = ?auto_141060 ?auto_141067 ) ) ( not ( = ?auto_141061 ?auto_141062 ) ) ( not ( = ?auto_141061 ?auto_141063 ) ) ( not ( = ?auto_141061 ?auto_141064 ) ) ( not ( = ?auto_141061 ?auto_141065 ) ) ( not ( = ?auto_141061 ?auto_141066 ) ) ( not ( = ?auto_141061 ?auto_141067 ) ) ( not ( = ?auto_141062 ?auto_141063 ) ) ( not ( = ?auto_141062 ?auto_141064 ) ) ( not ( = ?auto_141062 ?auto_141065 ) ) ( not ( = ?auto_141062 ?auto_141066 ) ) ( not ( = ?auto_141062 ?auto_141067 ) ) ( not ( = ?auto_141063 ?auto_141064 ) ) ( not ( = ?auto_141063 ?auto_141065 ) ) ( not ( = ?auto_141063 ?auto_141066 ) ) ( not ( = ?auto_141063 ?auto_141067 ) ) ( not ( = ?auto_141064 ?auto_141065 ) ) ( not ( = ?auto_141064 ?auto_141066 ) ) ( not ( = ?auto_141064 ?auto_141067 ) ) ( not ( = ?auto_141065 ?auto_141066 ) ) ( not ( = ?auto_141065 ?auto_141067 ) ) ( not ( = ?auto_141066 ?auto_141067 ) ) ( ON ?auto_141065 ?auto_141066 ) ( ON ?auto_141064 ?auto_141065 ) ( CLEAR ?auto_141062 ) ( ON ?auto_141063 ?auto_141064 ) ( CLEAR ?auto_141063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_141056 ?auto_141057 ?auto_141058 ?auto_141059 ?auto_141060 ?auto_141061 ?auto_141062 ?auto_141063 )
      ( MAKE-11PILE ?auto_141056 ?auto_141057 ?auto_141058 ?auto_141059 ?auto_141060 ?auto_141061 ?auto_141062 ?auto_141063 ?auto_141064 ?auto_141065 ?auto_141066 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_141079 - BLOCK
      ?auto_141080 - BLOCK
      ?auto_141081 - BLOCK
      ?auto_141082 - BLOCK
      ?auto_141083 - BLOCK
      ?auto_141084 - BLOCK
      ?auto_141085 - BLOCK
      ?auto_141086 - BLOCK
      ?auto_141087 - BLOCK
      ?auto_141088 - BLOCK
      ?auto_141089 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141089 ) ( ON-TABLE ?auto_141079 ) ( ON ?auto_141080 ?auto_141079 ) ( ON ?auto_141081 ?auto_141080 ) ( ON ?auto_141082 ?auto_141081 ) ( ON ?auto_141083 ?auto_141082 ) ( ON ?auto_141084 ?auto_141083 ) ( ON ?auto_141085 ?auto_141084 ) ( not ( = ?auto_141079 ?auto_141080 ) ) ( not ( = ?auto_141079 ?auto_141081 ) ) ( not ( = ?auto_141079 ?auto_141082 ) ) ( not ( = ?auto_141079 ?auto_141083 ) ) ( not ( = ?auto_141079 ?auto_141084 ) ) ( not ( = ?auto_141079 ?auto_141085 ) ) ( not ( = ?auto_141079 ?auto_141086 ) ) ( not ( = ?auto_141079 ?auto_141087 ) ) ( not ( = ?auto_141079 ?auto_141088 ) ) ( not ( = ?auto_141079 ?auto_141089 ) ) ( not ( = ?auto_141080 ?auto_141081 ) ) ( not ( = ?auto_141080 ?auto_141082 ) ) ( not ( = ?auto_141080 ?auto_141083 ) ) ( not ( = ?auto_141080 ?auto_141084 ) ) ( not ( = ?auto_141080 ?auto_141085 ) ) ( not ( = ?auto_141080 ?auto_141086 ) ) ( not ( = ?auto_141080 ?auto_141087 ) ) ( not ( = ?auto_141080 ?auto_141088 ) ) ( not ( = ?auto_141080 ?auto_141089 ) ) ( not ( = ?auto_141081 ?auto_141082 ) ) ( not ( = ?auto_141081 ?auto_141083 ) ) ( not ( = ?auto_141081 ?auto_141084 ) ) ( not ( = ?auto_141081 ?auto_141085 ) ) ( not ( = ?auto_141081 ?auto_141086 ) ) ( not ( = ?auto_141081 ?auto_141087 ) ) ( not ( = ?auto_141081 ?auto_141088 ) ) ( not ( = ?auto_141081 ?auto_141089 ) ) ( not ( = ?auto_141082 ?auto_141083 ) ) ( not ( = ?auto_141082 ?auto_141084 ) ) ( not ( = ?auto_141082 ?auto_141085 ) ) ( not ( = ?auto_141082 ?auto_141086 ) ) ( not ( = ?auto_141082 ?auto_141087 ) ) ( not ( = ?auto_141082 ?auto_141088 ) ) ( not ( = ?auto_141082 ?auto_141089 ) ) ( not ( = ?auto_141083 ?auto_141084 ) ) ( not ( = ?auto_141083 ?auto_141085 ) ) ( not ( = ?auto_141083 ?auto_141086 ) ) ( not ( = ?auto_141083 ?auto_141087 ) ) ( not ( = ?auto_141083 ?auto_141088 ) ) ( not ( = ?auto_141083 ?auto_141089 ) ) ( not ( = ?auto_141084 ?auto_141085 ) ) ( not ( = ?auto_141084 ?auto_141086 ) ) ( not ( = ?auto_141084 ?auto_141087 ) ) ( not ( = ?auto_141084 ?auto_141088 ) ) ( not ( = ?auto_141084 ?auto_141089 ) ) ( not ( = ?auto_141085 ?auto_141086 ) ) ( not ( = ?auto_141085 ?auto_141087 ) ) ( not ( = ?auto_141085 ?auto_141088 ) ) ( not ( = ?auto_141085 ?auto_141089 ) ) ( not ( = ?auto_141086 ?auto_141087 ) ) ( not ( = ?auto_141086 ?auto_141088 ) ) ( not ( = ?auto_141086 ?auto_141089 ) ) ( not ( = ?auto_141087 ?auto_141088 ) ) ( not ( = ?auto_141087 ?auto_141089 ) ) ( not ( = ?auto_141088 ?auto_141089 ) ) ( ON ?auto_141088 ?auto_141089 ) ( ON ?auto_141087 ?auto_141088 ) ( CLEAR ?auto_141085 ) ( ON ?auto_141086 ?auto_141087 ) ( CLEAR ?auto_141086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_141079 ?auto_141080 ?auto_141081 ?auto_141082 ?auto_141083 ?auto_141084 ?auto_141085 ?auto_141086 )
      ( MAKE-11PILE ?auto_141079 ?auto_141080 ?auto_141081 ?auto_141082 ?auto_141083 ?auto_141084 ?auto_141085 ?auto_141086 ?auto_141087 ?auto_141088 ?auto_141089 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_141101 - BLOCK
      ?auto_141102 - BLOCK
      ?auto_141103 - BLOCK
      ?auto_141104 - BLOCK
      ?auto_141105 - BLOCK
      ?auto_141106 - BLOCK
      ?auto_141107 - BLOCK
      ?auto_141108 - BLOCK
      ?auto_141109 - BLOCK
      ?auto_141110 - BLOCK
      ?auto_141111 - BLOCK
    )
    :vars
    (
      ?auto_141112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141111 ?auto_141112 ) ( ON-TABLE ?auto_141101 ) ( ON ?auto_141102 ?auto_141101 ) ( ON ?auto_141103 ?auto_141102 ) ( ON ?auto_141104 ?auto_141103 ) ( ON ?auto_141105 ?auto_141104 ) ( ON ?auto_141106 ?auto_141105 ) ( not ( = ?auto_141101 ?auto_141102 ) ) ( not ( = ?auto_141101 ?auto_141103 ) ) ( not ( = ?auto_141101 ?auto_141104 ) ) ( not ( = ?auto_141101 ?auto_141105 ) ) ( not ( = ?auto_141101 ?auto_141106 ) ) ( not ( = ?auto_141101 ?auto_141107 ) ) ( not ( = ?auto_141101 ?auto_141108 ) ) ( not ( = ?auto_141101 ?auto_141109 ) ) ( not ( = ?auto_141101 ?auto_141110 ) ) ( not ( = ?auto_141101 ?auto_141111 ) ) ( not ( = ?auto_141101 ?auto_141112 ) ) ( not ( = ?auto_141102 ?auto_141103 ) ) ( not ( = ?auto_141102 ?auto_141104 ) ) ( not ( = ?auto_141102 ?auto_141105 ) ) ( not ( = ?auto_141102 ?auto_141106 ) ) ( not ( = ?auto_141102 ?auto_141107 ) ) ( not ( = ?auto_141102 ?auto_141108 ) ) ( not ( = ?auto_141102 ?auto_141109 ) ) ( not ( = ?auto_141102 ?auto_141110 ) ) ( not ( = ?auto_141102 ?auto_141111 ) ) ( not ( = ?auto_141102 ?auto_141112 ) ) ( not ( = ?auto_141103 ?auto_141104 ) ) ( not ( = ?auto_141103 ?auto_141105 ) ) ( not ( = ?auto_141103 ?auto_141106 ) ) ( not ( = ?auto_141103 ?auto_141107 ) ) ( not ( = ?auto_141103 ?auto_141108 ) ) ( not ( = ?auto_141103 ?auto_141109 ) ) ( not ( = ?auto_141103 ?auto_141110 ) ) ( not ( = ?auto_141103 ?auto_141111 ) ) ( not ( = ?auto_141103 ?auto_141112 ) ) ( not ( = ?auto_141104 ?auto_141105 ) ) ( not ( = ?auto_141104 ?auto_141106 ) ) ( not ( = ?auto_141104 ?auto_141107 ) ) ( not ( = ?auto_141104 ?auto_141108 ) ) ( not ( = ?auto_141104 ?auto_141109 ) ) ( not ( = ?auto_141104 ?auto_141110 ) ) ( not ( = ?auto_141104 ?auto_141111 ) ) ( not ( = ?auto_141104 ?auto_141112 ) ) ( not ( = ?auto_141105 ?auto_141106 ) ) ( not ( = ?auto_141105 ?auto_141107 ) ) ( not ( = ?auto_141105 ?auto_141108 ) ) ( not ( = ?auto_141105 ?auto_141109 ) ) ( not ( = ?auto_141105 ?auto_141110 ) ) ( not ( = ?auto_141105 ?auto_141111 ) ) ( not ( = ?auto_141105 ?auto_141112 ) ) ( not ( = ?auto_141106 ?auto_141107 ) ) ( not ( = ?auto_141106 ?auto_141108 ) ) ( not ( = ?auto_141106 ?auto_141109 ) ) ( not ( = ?auto_141106 ?auto_141110 ) ) ( not ( = ?auto_141106 ?auto_141111 ) ) ( not ( = ?auto_141106 ?auto_141112 ) ) ( not ( = ?auto_141107 ?auto_141108 ) ) ( not ( = ?auto_141107 ?auto_141109 ) ) ( not ( = ?auto_141107 ?auto_141110 ) ) ( not ( = ?auto_141107 ?auto_141111 ) ) ( not ( = ?auto_141107 ?auto_141112 ) ) ( not ( = ?auto_141108 ?auto_141109 ) ) ( not ( = ?auto_141108 ?auto_141110 ) ) ( not ( = ?auto_141108 ?auto_141111 ) ) ( not ( = ?auto_141108 ?auto_141112 ) ) ( not ( = ?auto_141109 ?auto_141110 ) ) ( not ( = ?auto_141109 ?auto_141111 ) ) ( not ( = ?auto_141109 ?auto_141112 ) ) ( not ( = ?auto_141110 ?auto_141111 ) ) ( not ( = ?auto_141110 ?auto_141112 ) ) ( not ( = ?auto_141111 ?auto_141112 ) ) ( ON ?auto_141110 ?auto_141111 ) ( ON ?auto_141109 ?auto_141110 ) ( ON ?auto_141108 ?auto_141109 ) ( CLEAR ?auto_141106 ) ( ON ?auto_141107 ?auto_141108 ) ( CLEAR ?auto_141107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141101 ?auto_141102 ?auto_141103 ?auto_141104 ?auto_141105 ?auto_141106 ?auto_141107 )
      ( MAKE-11PILE ?auto_141101 ?auto_141102 ?auto_141103 ?auto_141104 ?auto_141105 ?auto_141106 ?auto_141107 ?auto_141108 ?auto_141109 ?auto_141110 ?auto_141111 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_141124 - BLOCK
      ?auto_141125 - BLOCK
      ?auto_141126 - BLOCK
      ?auto_141127 - BLOCK
      ?auto_141128 - BLOCK
      ?auto_141129 - BLOCK
      ?auto_141130 - BLOCK
      ?auto_141131 - BLOCK
      ?auto_141132 - BLOCK
      ?auto_141133 - BLOCK
      ?auto_141134 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141134 ) ( ON-TABLE ?auto_141124 ) ( ON ?auto_141125 ?auto_141124 ) ( ON ?auto_141126 ?auto_141125 ) ( ON ?auto_141127 ?auto_141126 ) ( ON ?auto_141128 ?auto_141127 ) ( ON ?auto_141129 ?auto_141128 ) ( not ( = ?auto_141124 ?auto_141125 ) ) ( not ( = ?auto_141124 ?auto_141126 ) ) ( not ( = ?auto_141124 ?auto_141127 ) ) ( not ( = ?auto_141124 ?auto_141128 ) ) ( not ( = ?auto_141124 ?auto_141129 ) ) ( not ( = ?auto_141124 ?auto_141130 ) ) ( not ( = ?auto_141124 ?auto_141131 ) ) ( not ( = ?auto_141124 ?auto_141132 ) ) ( not ( = ?auto_141124 ?auto_141133 ) ) ( not ( = ?auto_141124 ?auto_141134 ) ) ( not ( = ?auto_141125 ?auto_141126 ) ) ( not ( = ?auto_141125 ?auto_141127 ) ) ( not ( = ?auto_141125 ?auto_141128 ) ) ( not ( = ?auto_141125 ?auto_141129 ) ) ( not ( = ?auto_141125 ?auto_141130 ) ) ( not ( = ?auto_141125 ?auto_141131 ) ) ( not ( = ?auto_141125 ?auto_141132 ) ) ( not ( = ?auto_141125 ?auto_141133 ) ) ( not ( = ?auto_141125 ?auto_141134 ) ) ( not ( = ?auto_141126 ?auto_141127 ) ) ( not ( = ?auto_141126 ?auto_141128 ) ) ( not ( = ?auto_141126 ?auto_141129 ) ) ( not ( = ?auto_141126 ?auto_141130 ) ) ( not ( = ?auto_141126 ?auto_141131 ) ) ( not ( = ?auto_141126 ?auto_141132 ) ) ( not ( = ?auto_141126 ?auto_141133 ) ) ( not ( = ?auto_141126 ?auto_141134 ) ) ( not ( = ?auto_141127 ?auto_141128 ) ) ( not ( = ?auto_141127 ?auto_141129 ) ) ( not ( = ?auto_141127 ?auto_141130 ) ) ( not ( = ?auto_141127 ?auto_141131 ) ) ( not ( = ?auto_141127 ?auto_141132 ) ) ( not ( = ?auto_141127 ?auto_141133 ) ) ( not ( = ?auto_141127 ?auto_141134 ) ) ( not ( = ?auto_141128 ?auto_141129 ) ) ( not ( = ?auto_141128 ?auto_141130 ) ) ( not ( = ?auto_141128 ?auto_141131 ) ) ( not ( = ?auto_141128 ?auto_141132 ) ) ( not ( = ?auto_141128 ?auto_141133 ) ) ( not ( = ?auto_141128 ?auto_141134 ) ) ( not ( = ?auto_141129 ?auto_141130 ) ) ( not ( = ?auto_141129 ?auto_141131 ) ) ( not ( = ?auto_141129 ?auto_141132 ) ) ( not ( = ?auto_141129 ?auto_141133 ) ) ( not ( = ?auto_141129 ?auto_141134 ) ) ( not ( = ?auto_141130 ?auto_141131 ) ) ( not ( = ?auto_141130 ?auto_141132 ) ) ( not ( = ?auto_141130 ?auto_141133 ) ) ( not ( = ?auto_141130 ?auto_141134 ) ) ( not ( = ?auto_141131 ?auto_141132 ) ) ( not ( = ?auto_141131 ?auto_141133 ) ) ( not ( = ?auto_141131 ?auto_141134 ) ) ( not ( = ?auto_141132 ?auto_141133 ) ) ( not ( = ?auto_141132 ?auto_141134 ) ) ( not ( = ?auto_141133 ?auto_141134 ) ) ( ON ?auto_141133 ?auto_141134 ) ( ON ?auto_141132 ?auto_141133 ) ( ON ?auto_141131 ?auto_141132 ) ( CLEAR ?auto_141129 ) ( ON ?auto_141130 ?auto_141131 ) ( CLEAR ?auto_141130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141124 ?auto_141125 ?auto_141126 ?auto_141127 ?auto_141128 ?auto_141129 ?auto_141130 )
      ( MAKE-11PILE ?auto_141124 ?auto_141125 ?auto_141126 ?auto_141127 ?auto_141128 ?auto_141129 ?auto_141130 ?auto_141131 ?auto_141132 ?auto_141133 ?auto_141134 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_141146 - BLOCK
      ?auto_141147 - BLOCK
      ?auto_141148 - BLOCK
      ?auto_141149 - BLOCK
      ?auto_141150 - BLOCK
      ?auto_141151 - BLOCK
      ?auto_141152 - BLOCK
      ?auto_141153 - BLOCK
      ?auto_141154 - BLOCK
      ?auto_141155 - BLOCK
      ?auto_141156 - BLOCK
    )
    :vars
    (
      ?auto_141157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141156 ?auto_141157 ) ( ON-TABLE ?auto_141146 ) ( ON ?auto_141147 ?auto_141146 ) ( ON ?auto_141148 ?auto_141147 ) ( ON ?auto_141149 ?auto_141148 ) ( ON ?auto_141150 ?auto_141149 ) ( not ( = ?auto_141146 ?auto_141147 ) ) ( not ( = ?auto_141146 ?auto_141148 ) ) ( not ( = ?auto_141146 ?auto_141149 ) ) ( not ( = ?auto_141146 ?auto_141150 ) ) ( not ( = ?auto_141146 ?auto_141151 ) ) ( not ( = ?auto_141146 ?auto_141152 ) ) ( not ( = ?auto_141146 ?auto_141153 ) ) ( not ( = ?auto_141146 ?auto_141154 ) ) ( not ( = ?auto_141146 ?auto_141155 ) ) ( not ( = ?auto_141146 ?auto_141156 ) ) ( not ( = ?auto_141146 ?auto_141157 ) ) ( not ( = ?auto_141147 ?auto_141148 ) ) ( not ( = ?auto_141147 ?auto_141149 ) ) ( not ( = ?auto_141147 ?auto_141150 ) ) ( not ( = ?auto_141147 ?auto_141151 ) ) ( not ( = ?auto_141147 ?auto_141152 ) ) ( not ( = ?auto_141147 ?auto_141153 ) ) ( not ( = ?auto_141147 ?auto_141154 ) ) ( not ( = ?auto_141147 ?auto_141155 ) ) ( not ( = ?auto_141147 ?auto_141156 ) ) ( not ( = ?auto_141147 ?auto_141157 ) ) ( not ( = ?auto_141148 ?auto_141149 ) ) ( not ( = ?auto_141148 ?auto_141150 ) ) ( not ( = ?auto_141148 ?auto_141151 ) ) ( not ( = ?auto_141148 ?auto_141152 ) ) ( not ( = ?auto_141148 ?auto_141153 ) ) ( not ( = ?auto_141148 ?auto_141154 ) ) ( not ( = ?auto_141148 ?auto_141155 ) ) ( not ( = ?auto_141148 ?auto_141156 ) ) ( not ( = ?auto_141148 ?auto_141157 ) ) ( not ( = ?auto_141149 ?auto_141150 ) ) ( not ( = ?auto_141149 ?auto_141151 ) ) ( not ( = ?auto_141149 ?auto_141152 ) ) ( not ( = ?auto_141149 ?auto_141153 ) ) ( not ( = ?auto_141149 ?auto_141154 ) ) ( not ( = ?auto_141149 ?auto_141155 ) ) ( not ( = ?auto_141149 ?auto_141156 ) ) ( not ( = ?auto_141149 ?auto_141157 ) ) ( not ( = ?auto_141150 ?auto_141151 ) ) ( not ( = ?auto_141150 ?auto_141152 ) ) ( not ( = ?auto_141150 ?auto_141153 ) ) ( not ( = ?auto_141150 ?auto_141154 ) ) ( not ( = ?auto_141150 ?auto_141155 ) ) ( not ( = ?auto_141150 ?auto_141156 ) ) ( not ( = ?auto_141150 ?auto_141157 ) ) ( not ( = ?auto_141151 ?auto_141152 ) ) ( not ( = ?auto_141151 ?auto_141153 ) ) ( not ( = ?auto_141151 ?auto_141154 ) ) ( not ( = ?auto_141151 ?auto_141155 ) ) ( not ( = ?auto_141151 ?auto_141156 ) ) ( not ( = ?auto_141151 ?auto_141157 ) ) ( not ( = ?auto_141152 ?auto_141153 ) ) ( not ( = ?auto_141152 ?auto_141154 ) ) ( not ( = ?auto_141152 ?auto_141155 ) ) ( not ( = ?auto_141152 ?auto_141156 ) ) ( not ( = ?auto_141152 ?auto_141157 ) ) ( not ( = ?auto_141153 ?auto_141154 ) ) ( not ( = ?auto_141153 ?auto_141155 ) ) ( not ( = ?auto_141153 ?auto_141156 ) ) ( not ( = ?auto_141153 ?auto_141157 ) ) ( not ( = ?auto_141154 ?auto_141155 ) ) ( not ( = ?auto_141154 ?auto_141156 ) ) ( not ( = ?auto_141154 ?auto_141157 ) ) ( not ( = ?auto_141155 ?auto_141156 ) ) ( not ( = ?auto_141155 ?auto_141157 ) ) ( not ( = ?auto_141156 ?auto_141157 ) ) ( ON ?auto_141155 ?auto_141156 ) ( ON ?auto_141154 ?auto_141155 ) ( ON ?auto_141153 ?auto_141154 ) ( ON ?auto_141152 ?auto_141153 ) ( CLEAR ?auto_141150 ) ( ON ?auto_141151 ?auto_141152 ) ( CLEAR ?auto_141151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_141146 ?auto_141147 ?auto_141148 ?auto_141149 ?auto_141150 ?auto_141151 )
      ( MAKE-11PILE ?auto_141146 ?auto_141147 ?auto_141148 ?auto_141149 ?auto_141150 ?auto_141151 ?auto_141152 ?auto_141153 ?auto_141154 ?auto_141155 ?auto_141156 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_141169 - BLOCK
      ?auto_141170 - BLOCK
      ?auto_141171 - BLOCK
      ?auto_141172 - BLOCK
      ?auto_141173 - BLOCK
      ?auto_141174 - BLOCK
      ?auto_141175 - BLOCK
      ?auto_141176 - BLOCK
      ?auto_141177 - BLOCK
      ?auto_141178 - BLOCK
      ?auto_141179 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141179 ) ( ON-TABLE ?auto_141169 ) ( ON ?auto_141170 ?auto_141169 ) ( ON ?auto_141171 ?auto_141170 ) ( ON ?auto_141172 ?auto_141171 ) ( ON ?auto_141173 ?auto_141172 ) ( not ( = ?auto_141169 ?auto_141170 ) ) ( not ( = ?auto_141169 ?auto_141171 ) ) ( not ( = ?auto_141169 ?auto_141172 ) ) ( not ( = ?auto_141169 ?auto_141173 ) ) ( not ( = ?auto_141169 ?auto_141174 ) ) ( not ( = ?auto_141169 ?auto_141175 ) ) ( not ( = ?auto_141169 ?auto_141176 ) ) ( not ( = ?auto_141169 ?auto_141177 ) ) ( not ( = ?auto_141169 ?auto_141178 ) ) ( not ( = ?auto_141169 ?auto_141179 ) ) ( not ( = ?auto_141170 ?auto_141171 ) ) ( not ( = ?auto_141170 ?auto_141172 ) ) ( not ( = ?auto_141170 ?auto_141173 ) ) ( not ( = ?auto_141170 ?auto_141174 ) ) ( not ( = ?auto_141170 ?auto_141175 ) ) ( not ( = ?auto_141170 ?auto_141176 ) ) ( not ( = ?auto_141170 ?auto_141177 ) ) ( not ( = ?auto_141170 ?auto_141178 ) ) ( not ( = ?auto_141170 ?auto_141179 ) ) ( not ( = ?auto_141171 ?auto_141172 ) ) ( not ( = ?auto_141171 ?auto_141173 ) ) ( not ( = ?auto_141171 ?auto_141174 ) ) ( not ( = ?auto_141171 ?auto_141175 ) ) ( not ( = ?auto_141171 ?auto_141176 ) ) ( not ( = ?auto_141171 ?auto_141177 ) ) ( not ( = ?auto_141171 ?auto_141178 ) ) ( not ( = ?auto_141171 ?auto_141179 ) ) ( not ( = ?auto_141172 ?auto_141173 ) ) ( not ( = ?auto_141172 ?auto_141174 ) ) ( not ( = ?auto_141172 ?auto_141175 ) ) ( not ( = ?auto_141172 ?auto_141176 ) ) ( not ( = ?auto_141172 ?auto_141177 ) ) ( not ( = ?auto_141172 ?auto_141178 ) ) ( not ( = ?auto_141172 ?auto_141179 ) ) ( not ( = ?auto_141173 ?auto_141174 ) ) ( not ( = ?auto_141173 ?auto_141175 ) ) ( not ( = ?auto_141173 ?auto_141176 ) ) ( not ( = ?auto_141173 ?auto_141177 ) ) ( not ( = ?auto_141173 ?auto_141178 ) ) ( not ( = ?auto_141173 ?auto_141179 ) ) ( not ( = ?auto_141174 ?auto_141175 ) ) ( not ( = ?auto_141174 ?auto_141176 ) ) ( not ( = ?auto_141174 ?auto_141177 ) ) ( not ( = ?auto_141174 ?auto_141178 ) ) ( not ( = ?auto_141174 ?auto_141179 ) ) ( not ( = ?auto_141175 ?auto_141176 ) ) ( not ( = ?auto_141175 ?auto_141177 ) ) ( not ( = ?auto_141175 ?auto_141178 ) ) ( not ( = ?auto_141175 ?auto_141179 ) ) ( not ( = ?auto_141176 ?auto_141177 ) ) ( not ( = ?auto_141176 ?auto_141178 ) ) ( not ( = ?auto_141176 ?auto_141179 ) ) ( not ( = ?auto_141177 ?auto_141178 ) ) ( not ( = ?auto_141177 ?auto_141179 ) ) ( not ( = ?auto_141178 ?auto_141179 ) ) ( ON ?auto_141178 ?auto_141179 ) ( ON ?auto_141177 ?auto_141178 ) ( ON ?auto_141176 ?auto_141177 ) ( ON ?auto_141175 ?auto_141176 ) ( CLEAR ?auto_141173 ) ( ON ?auto_141174 ?auto_141175 ) ( CLEAR ?auto_141174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_141169 ?auto_141170 ?auto_141171 ?auto_141172 ?auto_141173 ?auto_141174 )
      ( MAKE-11PILE ?auto_141169 ?auto_141170 ?auto_141171 ?auto_141172 ?auto_141173 ?auto_141174 ?auto_141175 ?auto_141176 ?auto_141177 ?auto_141178 ?auto_141179 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_141191 - BLOCK
      ?auto_141192 - BLOCK
      ?auto_141193 - BLOCK
      ?auto_141194 - BLOCK
      ?auto_141195 - BLOCK
      ?auto_141196 - BLOCK
      ?auto_141197 - BLOCK
      ?auto_141198 - BLOCK
      ?auto_141199 - BLOCK
      ?auto_141200 - BLOCK
      ?auto_141201 - BLOCK
    )
    :vars
    (
      ?auto_141202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141201 ?auto_141202 ) ( ON-TABLE ?auto_141191 ) ( ON ?auto_141192 ?auto_141191 ) ( ON ?auto_141193 ?auto_141192 ) ( ON ?auto_141194 ?auto_141193 ) ( not ( = ?auto_141191 ?auto_141192 ) ) ( not ( = ?auto_141191 ?auto_141193 ) ) ( not ( = ?auto_141191 ?auto_141194 ) ) ( not ( = ?auto_141191 ?auto_141195 ) ) ( not ( = ?auto_141191 ?auto_141196 ) ) ( not ( = ?auto_141191 ?auto_141197 ) ) ( not ( = ?auto_141191 ?auto_141198 ) ) ( not ( = ?auto_141191 ?auto_141199 ) ) ( not ( = ?auto_141191 ?auto_141200 ) ) ( not ( = ?auto_141191 ?auto_141201 ) ) ( not ( = ?auto_141191 ?auto_141202 ) ) ( not ( = ?auto_141192 ?auto_141193 ) ) ( not ( = ?auto_141192 ?auto_141194 ) ) ( not ( = ?auto_141192 ?auto_141195 ) ) ( not ( = ?auto_141192 ?auto_141196 ) ) ( not ( = ?auto_141192 ?auto_141197 ) ) ( not ( = ?auto_141192 ?auto_141198 ) ) ( not ( = ?auto_141192 ?auto_141199 ) ) ( not ( = ?auto_141192 ?auto_141200 ) ) ( not ( = ?auto_141192 ?auto_141201 ) ) ( not ( = ?auto_141192 ?auto_141202 ) ) ( not ( = ?auto_141193 ?auto_141194 ) ) ( not ( = ?auto_141193 ?auto_141195 ) ) ( not ( = ?auto_141193 ?auto_141196 ) ) ( not ( = ?auto_141193 ?auto_141197 ) ) ( not ( = ?auto_141193 ?auto_141198 ) ) ( not ( = ?auto_141193 ?auto_141199 ) ) ( not ( = ?auto_141193 ?auto_141200 ) ) ( not ( = ?auto_141193 ?auto_141201 ) ) ( not ( = ?auto_141193 ?auto_141202 ) ) ( not ( = ?auto_141194 ?auto_141195 ) ) ( not ( = ?auto_141194 ?auto_141196 ) ) ( not ( = ?auto_141194 ?auto_141197 ) ) ( not ( = ?auto_141194 ?auto_141198 ) ) ( not ( = ?auto_141194 ?auto_141199 ) ) ( not ( = ?auto_141194 ?auto_141200 ) ) ( not ( = ?auto_141194 ?auto_141201 ) ) ( not ( = ?auto_141194 ?auto_141202 ) ) ( not ( = ?auto_141195 ?auto_141196 ) ) ( not ( = ?auto_141195 ?auto_141197 ) ) ( not ( = ?auto_141195 ?auto_141198 ) ) ( not ( = ?auto_141195 ?auto_141199 ) ) ( not ( = ?auto_141195 ?auto_141200 ) ) ( not ( = ?auto_141195 ?auto_141201 ) ) ( not ( = ?auto_141195 ?auto_141202 ) ) ( not ( = ?auto_141196 ?auto_141197 ) ) ( not ( = ?auto_141196 ?auto_141198 ) ) ( not ( = ?auto_141196 ?auto_141199 ) ) ( not ( = ?auto_141196 ?auto_141200 ) ) ( not ( = ?auto_141196 ?auto_141201 ) ) ( not ( = ?auto_141196 ?auto_141202 ) ) ( not ( = ?auto_141197 ?auto_141198 ) ) ( not ( = ?auto_141197 ?auto_141199 ) ) ( not ( = ?auto_141197 ?auto_141200 ) ) ( not ( = ?auto_141197 ?auto_141201 ) ) ( not ( = ?auto_141197 ?auto_141202 ) ) ( not ( = ?auto_141198 ?auto_141199 ) ) ( not ( = ?auto_141198 ?auto_141200 ) ) ( not ( = ?auto_141198 ?auto_141201 ) ) ( not ( = ?auto_141198 ?auto_141202 ) ) ( not ( = ?auto_141199 ?auto_141200 ) ) ( not ( = ?auto_141199 ?auto_141201 ) ) ( not ( = ?auto_141199 ?auto_141202 ) ) ( not ( = ?auto_141200 ?auto_141201 ) ) ( not ( = ?auto_141200 ?auto_141202 ) ) ( not ( = ?auto_141201 ?auto_141202 ) ) ( ON ?auto_141200 ?auto_141201 ) ( ON ?auto_141199 ?auto_141200 ) ( ON ?auto_141198 ?auto_141199 ) ( ON ?auto_141197 ?auto_141198 ) ( ON ?auto_141196 ?auto_141197 ) ( CLEAR ?auto_141194 ) ( ON ?auto_141195 ?auto_141196 ) ( CLEAR ?auto_141195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_141191 ?auto_141192 ?auto_141193 ?auto_141194 ?auto_141195 )
      ( MAKE-11PILE ?auto_141191 ?auto_141192 ?auto_141193 ?auto_141194 ?auto_141195 ?auto_141196 ?auto_141197 ?auto_141198 ?auto_141199 ?auto_141200 ?auto_141201 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_141214 - BLOCK
      ?auto_141215 - BLOCK
      ?auto_141216 - BLOCK
      ?auto_141217 - BLOCK
      ?auto_141218 - BLOCK
      ?auto_141219 - BLOCK
      ?auto_141220 - BLOCK
      ?auto_141221 - BLOCK
      ?auto_141222 - BLOCK
      ?auto_141223 - BLOCK
      ?auto_141224 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141224 ) ( ON-TABLE ?auto_141214 ) ( ON ?auto_141215 ?auto_141214 ) ( ON ?auto_141216 ?auto_141215 ) ( ON ?auto_141217 ?auto_141216 ) ( not ( = ?auto_141214 ?auto_141215 ) ) ( not ( = ?auto_141214 ?auto_141216 ) ) ( not ( = ?auto_141214 ?auto_141217 ) ) ( not ( = ?auto_141214 ?auto_141218 ) ) ( not ( = ?auto_141214 ?auto_141219 ) ) ( not ( = ?auto_141214 ?auto_141220 ) ) ( not ( = ?auto_141214 ?auto_141221 ) ) ( not ( = ?auto_141214 ?auto_141222 ) ) ( not ( = ?auto_141214 ?auto_141223 ) ) ( not ( = ?auto_141214 ?auto_141224 ) ) ( not ( = ?auto_141215 ?auto_141216 ) ) ( not ( = ?auto_141215 ?auto_141217 ) ) ( not ( = ?auto_141215 ?auto_141218 ) ) ( not ( = ?auto_141215 ?auto_141219 ) ) ( not ( = ?auto_141215 ?auto_141220 ) ) ( not ( = ?auto_141215 ?auto_141221 ) ) ( not ( = ?auto_141215 ?auto_141222 ) ) ( not ( = ?auto_141215 ?auto_141223 ) ) ( not ( = ?auto_141215 ?auto_141224 ) ) ( not ( = ?auto_141216 ?auto_141217 ) ) ( not ( = ?auto_141216 ?auto_141218 ) ) ( not ( = ?auto_141216 ?auto_141219 ) ) ( not ( = ?auto_141216 ?auto_141220 ) ) ( not ( = ?auto_141216 ?auto_141221 ) ) ( not ( = ?auto_141216 ?auto_141222 ) ) ( not ( = ?auto_141216 ?auto_141223 ) ) ( not ( = ?auto_141216 ?auto_141224 ) ) ( not ( = ?auto_141217 ?auto_141218 ) ) ( not ( = ?auto_141217 ?auto_141219 ) ) ( not ( = ?auto_141217 ?auto_141220 ) ) ( not ( = ?auto_141217 ?auto_141221 ) ) ( not ( = ?auto_141217 ?auto_141222 ) ) ( not ( = ?auto_141217 ?auto_141223 ) ) ( not ( = ?auto_141217 ?auto_141224 ) ) ( not ( = ?auto_141218 ?auto_141219 ) ) ( not ( = ?auto_141218 ?auto_141220 ) ) ( not ( = ?auto_141218 ?auto_141221 ) ) ( not ( = ?auto_141218 ?auto_141222 ) ) ( not ( = ?auto_141218 ?auto_141223 ) ) ( not ( = ?auto_141218 ?auto_141224 ) ) ( not ( = ?auto_141219 ?auto_141220 ) ) ( not ( = ?auto_141219 ?auto_141221 ) ) ( not ( = ?auto_141219 ?auto_141222 ) ) ( not ( = ?auto_141219 ?auto_141223 ) ) ( not ( = ?auto_141219 ?auto_141224 ) ) ( not ( = ?auto_141220 ?auto_141221 ) ) ( not ( = ?auto_141220 ?auto_141222 ) ) ( not ( = ?auto_141220 ?auto_141223 ) ) ( not ( = ?auto_141220 ?auto_141224 ) ) ( not ( = ?auto_141221 ?auto_141222 ) ) ( not ( = ?auto_141221 ?auto_141223 ) ) ( not ( = ?auto_141221 ?auto_141224 ) ) ( not ( = ?auto_141222 ?auto_141223 ) ) ( not ( = ?auto_141222 ?auto_141224 ) ) ( not ( = ?auto_141223 ?auto_141224 ) ) ( ON ?auto_141223 ?auto_141224 ) ( ON ?auto_141222 ?auto_141223 ) ( ON ?auto_141221 ?auto_141222 ) ( ON ?auto_141220 ?auto_141221 ) ( ON ?auto_141219 ?auto_141220 ) ( CLEAR ?auto_141217 ) ( ON ?auto_141218 ?auto_141219 ) ( CLEAR ?auto_141218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_141214 ?auto_141215 ?auto_141216 ?auto_141217 ?auto_141218 )
      ( MAKE-11PILE ?auto_141214 ?auto_141215 ?auto_141216 ?auto_141217 ?auto_141218 ?auto_141219 ?auto_141220 ?auto_141221 ?auto_141222 ?auto_141223 ?auto_141224 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_141236 - BLOCK
      ?auto_141237 - BLOCK
      ?auto_141238 - BLOCK
      ?auto_141239 - BLOCK
      ?auto_141240 - BLOCK
      ?auto_141241 - BLOCK
      ?auto_141242 - BLOCK
      ?auto_141243 - BLOCK
      ?auto_141244 - BLOCK
      ?auto_141245 - BLOCK
      ?auto_141246 - BLOCK
    )
    :vars
    (
      ?auto_141247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141246 ?auto_141247 ) ( ON-TABLE ?auto_141236 ) ( ON ?auto_141237 ?auto_141236 ) ( ON ?auto_141238 ?auto_141237 ) ( not ( = ?auto_141236 ?auto_141237 ) ) ( not ( = ?auto_141236 ?auto_141238 ) ) ( not ( = ?auto_141236 ?auto_141239 ) ) ( not ( = ?auto_141236 ?auto_141240 ) ) ( not ( = ?auto_141236 ?auto_141241 ) ) ( not ( = ?auto_141236 ?auto_141242 ) ) ( not ( = ?auto_141236 ?auto_141243 ) ) ( not ( = ?auto_141236 ?auto_141244 ) ) ( not ( = ?auto_141236 ?auto_141245 ) ) ( not ( = ?auto_141236 ?auto_141246 ) ) ( not ( = ?auto_141236 ?auto_141247 ) ) ( not ( = ?auto_141237 ?auto_141238 ) ) ( not ( = ?auto_141237 ?auto_141239 ) ) ( not ( = ?auto_141237 ?auto_141240 ) ) ( not ( = ?auto_141237 ?auto_141241 ) ) ( not ( = ?auto_141237 ?auto_141242 ) ) ( not ( = ?auto_141237 ?auto_141243 ) ) ( not ( = ?auto_141237 ?auto_141244 ) ) ( not ( = ?auto_141237 ?auto_141245 ) ) ( not ( = ?auto_141237 ?auto_141246 ) ) ( not ( = ?auto_141237 ?auto_141247 ) ) ( not ( = ?auto_141238 ?auto_141239 ) ) ( not ( = ?auto_141238 ?auto_141240 ) ) ( not ( = ?auto_141238 ?auto_141241 ) ) ( not ( = ?auto_141238 ?auto_141242 ) ) ( not ( = ?auto_141238 ?auto_141243 ) ) ( not ( = ?auto_141238 ?auto_141244 ) ) ( not ( = ?auto_141238 ?auto_141245 ) ) ( not ( = ?auto_141238 ?auto_141246 ) ) ( not ( = ?auto_141238 ?auto_141247 ) ) ( not ( = ?auto_141239 ?auto_141240 ) ) ( not ( = ?auto_141239 ?auto_141241 ) ) ( not ( = ?auto_141239 ?auto_141242 ) ) ( not ( = ?auto_141239 ?auto_141243 ) ) ( not ( = ?auto_141239 ?auto_141244 ) ) ( not ( = ?auto_141239 ?auto_141245 ) ) ( not ( = ?auto_141239 ?auto_141246 ) ) ( not ( = ?auto_141239 ?auto_141247 ) ) ( not ( = ?auto_141240 ?auto_141241 ) ) ( not ( = ?auto_141240 ?auto_141242 ) ) ( not ( = ?auto_141240 ?auto_141243 ) ) ( not ( = ?auto_141240 ?auto_141244 ) ) ( not ( = ?auto_141240 ?auto_141245 ) ) ( not ( = ?auto_141240 ?auto_141246 ) ) ( not ( = ?auto_141240 ?auto_141247 ) ) ( not ( = ?auto_141241 ?auto_141242 ) ) ( not ( = ?auto_141241 ?auto_141243 ) ) ( not ( = ?auto_141241 ?auto_141244 ) ) ( not ( = ?auto_141241 ?auto_141245 ) ) ( not ( = ?auto_141241 ?auto_141246 ) ) ( not ( = ?auto_141241 ?auto_141247 ) ) ( not ( = ?auto_141242 ?auto_141243 ) ) ( not ( = ?auto_141242 ?auto_141244 ) ) ( not ( = ?auto_141242 ?auto_141245 ) ) ( not ( = ?auto_141242 ?auto_141246 ) ) ( not ( = ?auto_141242 ?auto_141247 ) ) ( not ( = ?auto_141243 ?auto_141244 ) ) ( not ( = ?auto_141243 ?auto_141245 ) ) ( not ( = ?auto_141243 ?auto_141246 ) ) ( not ( = ?auto_141243 ?auto_141247 ) ) ( not ( = ?auto_141244 ?auto_141245 ) ) ( not ( = ?auto_141244 ?auto_141246 ) ) ( not ( = ?auto_141244 ?auto_141247 ) ) ( not ( = ?auto_141245 ?auto_141246 ) ) ( not ( = ?auto_141245 ?auto_141247 ) ) ( not ( = ?auto_141246 ?auto_141247 ) ) ( ON ?auto_141245 ?auto_141246 ) ( ON ?auto_141244 ?auto_141245 ) ( ON ?auto_141243 ?auto_141244 ) ( ON ?auto_141242 ?auto_141243 ) ( ON ?auto_141241 ?auto_141242 ) ( ON ?auto_141240 ?auto_141241 ) ( CLEAR ?auto_141238 ) ( ON ?auto_141239 ?auto_141240 ) ( CLEAR ?auto_141239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_141236 ?auto_141237 ?auto_141238 ?auto_141239 )
      ( MAKE-11PILE ?auto_141236 ?auto_141237 ?auto_141238 ?auto_141239 ?auto_141240 ?auto_141241 ?auto_141242 ?auto_141243 ?auto_141244 ?auto_141245 ?auto_141246 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_141259 - BLOCK
      ?auto_141260 - BLOCK
      ?auto_141261 - BLOCK
      ?auto_141262 - BLOCK
      ?auto_141263 - BLOCK
      ?auto_141264 - BLOCK
      ?auto_141265 - BLOCK
      ?auto_141266 - BLOCK
      ?auto_141267 - BLOCK
      ?auto_141268 - BLOCK
      ?auto_141269 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141269 ) ( ON-TABLE ?auto_141259 ) ( ON ?auto_141260 ?auto_141259 ) ( ON ?auto_141261 ?auto_141260 ) ( not ( = ?auto_141259 ?auto_141260 ) ) ( not ( = ?auto_141259 ?auto_141261 ) ) ( not ( = ?auto_141259 ?auto_141262 ) ) ( not ( = ?auto_141259 ?auto_141263 ) ) ( not ( = ?auto_141259 ?auto_141264 ) ) ( not ( = ?auto_141259 ?auto_141265 ) ) ( not ( = ?auto_141259 ?auto_141266 ) ) ( not ( = ?auto_141259 ?auto_141267 ) ) ( not ( = ?auto_141259 ?auto_141268 ) ) ( not ( = ?auto_141259 ?auto_141269 ) ) ( not ( = ?auto_141260 ?auto_141261 ) ) ( not ( = ?auto_141260 ?auto_141262 ) ) ( not ( = ?auto_141260 ?auto_141263 ) ) ( not ( = ?auto_141260 ?auto_141264 ) ) ( not ( = ?auto_141260 ?auto_141265 ) ) ( not ( = ?auto_141260 ?auto_141266 ) ) ( not ( = ?auto_141260 ?auto_141267 ) ) ( not ( = ?auto_141260 ?auto_141268 ) ) ( not ( = ?auto_141260 ?auto_141269 ) ) ( not ( = ?auto_141261 ?auto_141262 ) ) ( not ( = ?auto_141261 ?auto_141263 ) ) ( not ( = ?auto_141261 ?auto_141264 ) ) ( not ( = ?auto_141261 ?auto_141265 ) ) ( not ( = ?auto_141261 ?auto_141266 ) ) ( not ( = ?auto_141261 ?auto_141267 ) ) ( not ( = ?auto_141261 ?auto_141268 ) ) ( not ( = ?auto_141261 ?auto_141269 ) ) ( not ( = ?auto_141262 ?auto_141263 ) ) ( not ( = ?auto_141262 ?auto_141264 ) ) ( not ( = ?auto_141262 ?auto_141265 ) ) ( not ( = ?auto_141262 ?auto_141266 ) ) ( not ( = ?auto_141262 ?auto_141267 ) ) ( not ( = ?auto_141262 ?auto_141268 ) ) ( not ( = ?auto_141262 ?auto_141269 ) ) ( not ( = ?auto_141263 ?auto_141264 ) ) ( not ( = ?auto_141263 ?auto_141265 ) ) ( not ( = ?auto_141263 ?auto_141266 ) ) ( not ( = ?auto_141263 ?auto_141267 ) ) ( not ( = ?auto_141263 ?auto_141268 ) ) ( not ( = ?auto_141263 ?auto_141269 ) ) ( not ( = ?auto_141264 ?auto_141265 ) ) ( not ( = ?auto_141264 ?auto_141266 ) ) ( not ( = ?auto_141264 ?auto_141267 ) ) ( not ( = ?auto_141264 ?auto_141268 ) ) ( not ( = ?auto_141264 ?auto_141269 ) ) ( not ( = ?auto_141265 ?auto_141266 ) ) ( not ( = ?auto_141265 ?auto_141267 ) ) ( not ( = ?auto_141265 ?auto_141268 ) ) ( not ( = ?auto_141265 ?auto_141269 ) ) ( not ( = ?auto_141266 ?auto_141267 ) ) ( not ( = ?auto_141266 ?auto_141268 ) ) ( not ( = ?auto_141266 ?auto_141269 ) ) ( not ( = ?auto_141267 ?auto_141268 ) ) ( not ( = ?auto_141267 ?auto_141269 ) ) ( not ( = ?auto_141268 ?auto_141269 ) ) ( ON ?auto_141268 ?auto_141269 ) ( ON ?auto_141267 ?auto_141268 ) ( ON ?auto_141266 ?auto_141267 ) ( ON ?auto_141265 ?auto_141266 ) ( ON ?auto_141264 ?auto_141265 ) ( ON ?auto_141263 ?auto_141264 ) ( CLEAR ?auto_141261 ) ( ON ?auto_141262 ?auto_141263 ) ( CLEAR ?auto_141262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_141259 ?auto_141260 ?auto_141261 ?auto_141262 )
      ( MAKE-11PILE ?auto_141259 ?auto_141260 ?auto_141261 ?auto_141262 ?auto_141263 ?auto_141264 ?auto_141265 ?auto_141266 ?auto_141267 ?auto_141268 ?auto_141269 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_141281 - BLOCK
      ?auto_141282 - BLOCK
      ?auto_141283 - BLOCK
      ?auto_141284 - BLOCK
      ?auto_141285 - BLOCK
      ?auto_141286 - BLOCK
      ?auto_141287 - BLOCK
      ?auto_141288 - BLOCK
      ?auto_141289 - BLOCK
      ?auto_141290 - BLOCK
      ?auto_141291 - BLOCK
    )
    :vars
    (
      ?auto_141292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141291 ?auto_141292 ) ( ON-TABLE ?auto_141281 ) ( ON ?auto_141282 ?auto_141281 ) ( not ( = ?auto_141281 ?auto_141282 ) ) ( not ( = ?auto_141281 ?auto_141283 ) ) ( not ( = ?auto_141281 ?auto_141284 ) ) ( not ( = ?auto_141281 ?auto_141285 ) ) ( not ( = ?auto_141281 ?auto_141286 ) ) ( not ( = ?auto_141281 ?auto_141287 ) ) ( not ( = ?auto_141281 ?auto_141288 ) ) ( not ( = ?auto_141281 ?auto_141289 ) ) ( not ( = ?auto_141281 ?auto_141290 ) ) ( not ( = ?auto_141281 ?auto_141291 ) ) ( not ( = ?auto_141281 ?auto_141292 ) ) ( not ( = ?auto_141282 ?auto_141283 ) ) ( not ( = ?auto_141282 ?auto_141284 ) ) ( not ( = ?auto_141282 ?auto_141285 ) ) ( not ( = ?auto_141282 ?auto_141286 ) ) ( not ( = ?auto_141282 ?auto_141287 ) ) ( not ( = ?auto_141282 ?auto_141288 ) ) ( not ( = ?auto_141282 ?auto_141289 ) ) ( not ( = ?auto_141282 ?auto_141290 ) ) ( not ( = ?auto_141282 ?auto_141291 ) ) ( not ( = ?auto_141282 ?auto_141292 ) ) ( not ( = ?auto_141283 ?auto_141284 ) ) ( not ( = ?auto_141283 ?auto_141285 ) ) ( not ( = ?auto_141283 ?auto_141286 ) ) ( not ( = ?auto_141283 ?auto_141287 ) ) ( not ( = ?auto_141283 ?auto_141288 ) ) ( not ( = ?auto_141283 ?auto_141289 ) ) ( not ( = ?auto_141283 ?auto_141290 ) ) ( not ( = ?auto_141283 ?auto_141291 ) ) ( not ( = ?auto_141283 ?auto_141292 ) ) ( not ( = ?auto_141284 ?auto_141285 ) ) ( not ( = ?auto_141284 ?auto_141286 ) ) ( not ( = ?auto_141284 ?auto_141287 ) ) ( not ( = ?auto_141284 ?auto_141288 ) ) ( not ( = ?auto_141284 ?auto_141289 ) ) ( not ( = ?auto_141284 ?auto_141290 ) ) ( not ( = ?auto_141284 ?auto_141291 ) ) ( not ( = ?auto_141284 ?auto_141292 ) ) ( not ( = ?auto_141285 ?auto_141286 ) ) ( not ( = ?auto_141285 ?auto_141287 ) ) ( not ( = ?auto_141285 ?auto_141288 ) ) ( not ( = ?auto_141285 ?auto_141289 ) ) ( not ( = ?auto_141285 ?auto_141290 ) ) ( not ( = ?auto_141285 ?auto_141291 ) ) ( not ( = ?auto_141285 ?auto_141292 ) ) ( not ( = ?auto_141286 ?auto_141287 ) ) ( not ( = ?auto_141286 ?auto_141288 ) ) ( not ( = ?auto_141286 ?auto_141289 ) ) ( not ( = ?auto_141286 ?auto_141290 ) ) ( not ( = ?auto_141286 ?auto_141291 ) ) ( not ( = ?auto_141286 ?auto_141292 ) ) ( not ( = ?auto_141287 ?auto_141288 ) ) ( not ( = ?auto_141287 ?auto_141289 ) ) ( not ( = ?auto_141287 ?auto_141290 ) ) ( not ( = ?auto_141287 ?auto_141291 ) ) ( not ( = ?auto_141287 ?auto_141292 ) ) ( not ( = ?auto_141288 ?auto_141289 ) ) ( not ( = ?auto_141288 ?auto_141290 ) ) ( not ( = ?auto_141288 ?auto_141291 ) ) ( not ( = ?auto_141288 ?auto_141292 ) ) ( not ( = ?auto_141289 ?auto_141290 ) ) ( not ( = ?auto_141289 ?auto_141291 ) ) ( not ( = ?auto_141289 ?auto_141292 ) ) ( not ( = ?auto_141290 ?auto_141291 ) ) ( not ( = ?auto_141290 ?auto_141292 ) ) ( not ( = ?auto_141291 ?auto_141292 ) ) ( ON ?auto_141290 ?auto_141291 ) ( ON ?auto_141289 ?auto_141290 ) ( ON ?auto_141288 ?auto_141289 ) ( ON ?auto_141287 ?auto_141288 ) ( ON ?auto_141286 ?auto_141287 ) ( ON ?auto_141285 ?auto_141286 ) ( ON ?auto_141284 ?auto_141285 ) ( CLEAR ?auto_141282 ) ( ON ?auto_141283 ?auto_141284 ) ( CLEAR ?auto_141283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141281 ?auto_141282 ?auto_141283 )
      ( MAKE-11PILE ?auto_141281 ?auto_141282 ?auto_141283 ?auto_141284 ?auto_141285 ?auto_141286 ?auto_141287 ?auto_141288 ?auto_141289 ?auto_141290 ?auto_141291 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_141304 - BLOCK
      ?auto_141305 - BLOCK
      ?auto_141306 - BLOCK
      ?auto_141307 - BLOCK
      ?auto_141308 - BLOCK
      ?auto_141309 - BLOCK
      ?auto_141310 - BLOCK
      ?auto_141311 - BLOCK
      ?auto_141312 - BLOCK
      ?auto_141313 - BLOCK
      ?auto_141314 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141314 ) ( ON-TABLE ?auto_141304 ) ( ON ?auto_141305 ?auto_141304 ) ( not ( = ?auto_141304 ?auto_141305 ) ) ( not ( = ?auto_141304 ?auto_141306 ) ) ( not ( = ?auto_141304 ?auto_141307 ) ) ( not ( = ?auto_141304 ?auto_141308 ) ) ( not ( = ?auto_141304 ?auto_141309 ) ) ( not ( = ?auto_141304 ?auto_141310 ) ) ( not ( = ?auto_141304 ?auto_141311 ) ) ( not ( = ?auto_141304 ?auto_141312 ) ) ( not ( = ?auto_141304 ?auto_141313 ) ) ( not ( = ?auto_141304 ?auto_141314 ) ) ( not ( = ?auto_141305 ?auto_141306 ) ) ( not ( = ?auto_141305 ?auto_141307 ) ) ( not ( = ?auto_141305 ?auto_141308 ) ) ( not ( = ?auto_141305 ?auto_141309 ) ) ( not ( = ?auto_141305 ?auto_141310 ) ) ( not ( = ?auto_141305 ?auto_141311 ) ) ( not ( = ?auto_141305 ?auto_141312 ) ) ( not ( = ?auto_141305 ?auto_141313 ) ) ( not ( = ?auto_141305 ?auto_141314 ) ) ( not ( = ?auto_141306 ?auto_141307 ) ) ( not ( = ?auto_141306 ?auto_141308 ) ) ( not ( = ?auto_141306 ?auto_141309 ) ) ( not ( = ?auto_141306 ?auto_141310 ) ) ( not ( = ?auto_141306 ?auto_141311 ) ) ( not ( = ?auto_141306 ?auto_141312 ) ) ( not ( = ?auto_141306 ?auto_141313 ) ) ( not ( = ?auto_141306 ?auto_141314 ) ) ( not ( = ?auto_141307 ?auto_141308 ) ) ( not ( = ?auto_141307 ?auto_141309 ) ) ( not ( = ?auto_141307 ?auto_141310 ) ) ( not ( = ?auto_141307 ?auto_141311 ) ) ( not ( = ?auto_141307 ?auto_141312 ) ) ( not ( = ?auto_141307 ?auto_141313 ) ) ( not ( = ?auto_141307 ?auto_141314 ) ) ( not ( = ?auto_141308 ?auto_141309 ) ) ( not ( = ?auto_141308 ?auto_141310 ) ) ( not ( = ?auto_141308 ?auto_141311 ) ) ( not ( = ?auto_141308 ?auto_141312 ) ) ( not ( = ?auto_141308 ?auto_141313 ) ) ( not ( = ?auto_141308 ?auto_141314 ) ) ( not ( = ?auto_141309 ?auto_141310 ) ) ( not ( = ?auto_141309 ?auto_141311 ) ) ( not ( = ?auto_141309 ?auto_141312 ) ) ( not ( = ?auto_141309 ?auto_141313 ) ) ( not ( = ?auto_141309 ?auto_141314 ) ) ( not ( = ?auto_141310 ?auto_141311 ) ) ( not ( = ?auto_141310 ?auto_141312 ) ) ( not ( = ?auto_141310 ?auto_141313 ) ) ( not ( = ?auto_141310 ?auto_141314 ) ) ( not ( = ?auto_141311 ?auto_141312 ) ) ( not ( = ?auto_141311 ?auto_141313 ) ) ( not ( = ?auto_141311 ?auto_141314 ) ) ( not ( = ?auto_141312 ?auto_141313 ) ) ( not ( = ?auto_141312 ?auto_141314 ) ) ( not ( = ?auto_141313 ?auto_141314 ) ) ( ON ?auto_141313 ?auto_141314 ) ( ON ?auto_141312 ?auto_141313 ) ( ON ?auto_141311 ?auto_141312 ) ( ON ?auto_141310 ?auto_141311 ) ( ON ?auto_141309 ?auto_141310 ) ( ON ?auto_141308 ?auto_141309 ) ( ON ?auto_141307 ?auto_141308 ) ( CLEAR ?auto_141305 ) ( ON ?auto_141306 ?auto_141307 ) ( CLEAR ?auto_141306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141304 ?auto_141305 ?auto_141306 )
      ( MAKE-11PILE ?auto_141304 ?auto_141305 ?auto_141306 ?auto_141307 ?auto_141308 ?auto_141309 ?auto_141310 ?auto_141311 ?auto_141312 ?auto_141313 ?auto_141314 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_141326 - BLOCK
      ?auto_141327 - BLOCK
      ?auto_141328 - BLOCK
      ?auto_141329 - BLOCK
      ?auto_141330 - BLOCK
      ?auto_141331 - BLOCK
      ?auto_141332 - BLOCK
      ?auto_141333 - BLOCK
      ?auto_141334 - BLOCK
      ?auto_141335 - BLOCK
      ?auto_141336 - BLOCK
    )
    :vars
    (
      ?auto_141337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141336 ?auto_141337 ) ( ON-TABLE ?auto_141326 ) ( not ( = ?auto_141326 ?auto_141327 ) ) ( not ( = ?auto_141326 ?auto_141328 ) ) ( not ( = ?auto_141326 ?auto_141329 ) ) ( not ( = ?auto_141326 ?auto_141330 ) ) ( not ( = ?auto_141326 ?auto_141331 ) ) ( not ( = ?auto_141326 ?auto_141332 ) ) ( not ( = ?auto_141326 ?auto_141333 ) ) ( not ( = ?auto_141326 ?auto_141334 ) ) ( not ( = ?auto_141326 ?auto_141335 ) ) ( not ( = ?auto_141326 ?auto_141336 ) ) ( not ( = ?auto_141326 ?auto_141337 ) ) ( not ( = ?auto_141327 ?auto_141328 ) ) ( not ( = ?auto_141327 ?auto_141329 ) ) ( not ( = ?auto_141327 ?auto_141330 ) ) ( not ( = ?auto_141327 ?auto_141331 ) ) ( not ( = ?auto_141327 ?auto_141332 ) ) ( not ( = ?auto_141327 ?auto_141333 ) ) ( not ( = ?auto_141327 ?auto_141334 ) ) ( not ( = ?auto_141327 ?auto_141335 ) ) ( not ( = ?auto_141327 ?auto_141336 ) ) ( not ( = ?auto_141327 ?auto_141337 ) ) ( not ( = ?auto_141328 ?auto_141329 ) ) ( not ( = ?auto_141328 ?auto_141330 ) ) ( not ( = ?auto_141328 ?auto_141331 ) ) ( not ( = ?auto_141328 ?auto_141332 ) ) ( not ( = ?auto_141328 ?auto_141333 ) ) ( not ( = ?auto_141328 ?auto_141334 ) ) ( not ( = ?auto_141328 ?auto_141335 ) ) ( not ( = ?auto_141328 ?auto_141336 ) ) ( not ( = ?auto_141328 ?auto_141337 ) ) ( not ( = ?auto_141329 ?auto_141330 ) ) ( not ( = ?auto_141329 ?auto_141331 ) ) ( not ( = ?auto_141329 ?auto_141332 ) ) ( not ( = ?auto_141329 ?auto_141333 ) ) ( not ( = ?auto_141329 ?auto_141334 ) ) ( not ( = ?auto_141329 ?auto_141335 ) ) ( not ( = ?auto_141329 ?auto_141336 ) ) ( not ( = ?auto_141329 ?auto_141337 ) ) ( not ( = ?auto_141330 ?auto_141331 ) ) ( not ( = ?auto_141330 ?auto_141332 ) ) ( not ( = ?auto_141330 ?auto_141333 ) ) ( not ( = ?auto_141330 ?auto_141334 ) ) ( not ( = ?auto_141330 ?auto_141335 ) ) ( not ( = ?auto_141330 ?auto_141336 ) ) ( not ( = ?auto_141330 ?auto_141337 ) ) ( not ( = ?auto_141331 ?auto_141332 ) ) ( not ( = ?auto_141331 ?auto_141333 ) ) ( not ( = ?auto_141331 ?auto_141334 ) ) ( not ( = ?auto_141331 ?auto_141335 ) ) ( not ( = ?auto_141331 ?auto_141336 ) ) ( not ( = ?auto_141331 ?auto_141337 ) ) ( not ( = ?auto_141332 ?auto_141333 ) ) ( not ( = ?auto_141332 ?auto_141334 ) ) ( not ( = ?auto_141332 ?auto_141335 ) ) ( not ( = ?auto_141332 ?auto_141336 ) ) ( not ( = ?auto_141332 ?auto_141337 ) ) ( not ( = ?auto_141333 ?auto_141334 ) ) ( not ( = ?auto_141333 ?auto_141335 ) ) ( not ( = ?auto_141333 ?auto_141336 ) ) ( not ( = ?auto_141333 ?auto_141337 ) ) ( not ( = ?auto_141334 ?auto_141335 ) ) ( not ( = ?auto_141334 ?auto_141336 ) ) ( not ( = ?auto_141334 ?auto_141337 ) ) ( not ( = ?auto_141335 ?auto_141336 ) ) ( not ( = ?auto_141335 ?auto_141337 ) ) ( not ( = ?auto_141336 ?auto_141337 ) ) ( ON ?auto_141335 ?auto_141336 ) ( ON ?auto_141334 ?auto_141335 ) ( ON ?auto_141333 ?auto_141334 ) ( ON ?auto_141332 ?auto_141333 ) ( ON ?auto_141331 ?auto_141332 ) ( ON ?auto_141330 ?auto_141331 ) ( ON ?auto_141329 ?auto_141330 ) ( ON ?auto_141328 ?auto_141329 ) ( CLEAR ?auto_141326 ) ( ON ?auto_141327 ?auto_141328 ) ( CLEAR ?auto_141327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141326 ?auto_141327 )
      ( MAKE-11PILE ?auto_141326 ?auto_141327 ?auto_141328 ?auto_141329 ?auto_141330 ?auto_141331 ?auto_141332 ?auto_141333 ?auto_141334 ?auto_141335 ?auto_141336 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_141349 - BLOCK
      ?auto_141350 - BLOCK
      ?auto_141351 - BLOCK
      ?auto_141352 - BLOCK
      ?auto_141353 - BLOCK
      ?auto_141354 - BLOCK
      ?auto_141355 - BLOCK
      ?auto_141356 - BLOCK
      ?auto_141357 - BLOCK
      ?auto_141358 - BLOCK
      ?auto_141359 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141359 ) ( ON-TABLE ?auto_141349 ) ( not ( = ?auto_141349 ?auto_141350 ) ) ( not ( = ?auto_141349 ?auto_141351 ) ) ( not ( = ?auto_141349 ?auto_141352 ) ) ( not ( = ?auto_141349 ?auto_141353 ) ) ( not ( = ?auto_141349 ?auto_141354 ) ) ( not ( = ?auto_141349 ?auto_141355 ) ) ( not ( = ?auto_141349 ?auto_141356 ) ) ( not ( = ?auto_141349 ?auto_141357 ) ) ( not ( = ?auto_141349 ?auto_141358 ) ) ( not ( = ?auto_141349 ?auto_141359 ) ) ( not ( = ?auto_141350 ?auto_141351 ) ) ( not ( = ?auto_141350 ?auto_141352 ) ) ( not ( = ?auto_141350 ?auto_141353 ) ) ( not ( = ?auto_141350 ?auto_141354 ) ) ( not ( = ?auto_141350 ?auto_141355 ) ) ( not ( = ?auto_141350 ?auto_141356 ) ) ( not ( = ?auto_141350 ?auto_141357 ) ) ( not ( = ?auto_141350 ?auto_141358 ) ) ( not ( = ?auto_141350 ?auto_141359 ) ) ( not ( = ?auto_141351 ?auto_141352 ) ) ( not ( = ?auto_141351 ?auto_141353 ) ) ( not ( = ?auto_141351 ?auto_141354 ) ) ( not ( = ?auto_141351 ?auto_141355 ) ) ( not ( = ?auto_141351 ?auto_141356 ) ) ( not ( = ?auto_141351 ?auto_141357 ) ) ( not ( = ?auto_141351 ?auto_141358 ) ) ( not ( = ?auto_141351 ?auto_141359 ) ) ( not ( = ?auto_141352 ?auto_141353 ) ) ( not ( = ?auto_141352 ?auto_141354 ) ) ( not ( = ?auto_141352 ?auto_141355 ) ) ( not ( = ?auto_141352 ?auto_141356 ) ) ( not ( = ?auto_141352 ?auto_141357 ) ) ( not ( = ?auto_141352 ?auto_141358 ) ) ( not ( = ?auto_141352 ?auto_141359 ) ) ( not ( = ?auto_141353 ?auto_141354 ) ) ( not ( = ?auto_141353 ?auto_141355 ) ) ( not ( = ?auto_141353 ?auto_141356 ) ) ( not ( = ?auto_141353 ?auto_141357 ) ) ( not ( = ?auto_141353 ?auto_141358 ) ) ( not ( = ?auto_141353 ?auto_141359 ) ) ( not ( = ?auto_141354 ?auto_141355 ) ) ( not ( = ?auto_141354 ?auto_141356 ) ) ( not ( = ?auto_141354 ?auto_141357 ) ) ( not ( = ?auto_141354 ?auto_141358 ) ) ( not ( = ?auto_141354 ?auto_141359 ) ) ( not ( = ?auto_141355 ?auto_141356 ) ) ( not ( = ?auto_141355 ?auto_141357 ) ) ( not ( = ?auto_141355 ?auto_141358 ) ) ( not ( = ?auto_141355 ?auto_141359 ) ) ( not ( = ?auto_141356 ?auto_141357 ) ) ( not ( = ?auto_141356 ?auto_141358 ) ) ( not ( = ?auto_141356 ?auto_141359 ) ) ( not ( = ?auto_141357 ?auto_141358 ) ) ( not ( = ?auto_141357 ?auto_141359 ) ) ( not ( = ?auto_141358 ?auto_141359 ) ) ( ON ?auto_141358 ?auto_141359 ) ( ON ?auto_141357 ?auto_141358 ) ( ON ?auto_141356 ?auto_141357 ) ( ON ?auto_141355 ?auto_141356 ) ( ON ?auto_141354 ?auto_141355 ) ( ON ?auto_141353 ?auto_141354 ) ( ON ?auto_141352 ?auto_141353 ) ( ON ?auto_141351 ?auto_141352 ) ( CLEAR ?auto_141349 ) ( ON ?auto_141350 ?auto_141351 ) ( CLEAR ?auto_141350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141349 ?auto_141350 )
      ( MAKE-11PILE ?auto_141349 ?auto_141350 ?auto_141351 ?auto_141352 ?auto_141353 ?auto_141354 ?auto_141355 ?auto_141356 ?auto_141357 ?auto_141358 ?auto_141359 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_141371 - BLOCK
      ?auto_141372 - BLOCK
      ?auto_141373 - BLOCK
      ?auto_141374 - BLOCK
      ?auto_141375 - BLOCK
      ?auto_141376 - BLOCK
      ?auto_141377 - BLOCK
      ?auto_141378 - BLOCK
      ?auto_141379 - BLOCK
      ?auto_141380 - BLOCK
      ?auto_141381 - BLOCK
    )
    :vars
    (
      ?auto_141382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141381 ?auto_141382 ) ( not ( = ?auto_141371 ?auto_141372 ) ) ( not ( = ?auto_141371 ?auto_141373 ) ) ( not ( = ?auto_141371 ?auto_141374 ) ) ( not ( = ?auto_141371 ?auto_141375 ) ) ( not ( = ?auto_141371 ?auto_141376 ) ) ( not ( = ?auto_141371 ?auto_141377 ) ) ( not ( = ?auto_141371 ?auto_141378 ) ) ( not ( = ?auto_141371 ?auto_141379 ) ) ( not ( = ?auto_141371 ?auto_141380 ) ) ( not ( = ?auto_141371 ?auto_141381 ) ) ( not ( = ?auto_141371 ?auto_141382 ) ) ( not ( = ?auto_141372 ?auto_141373 ) ) ( not ( = ?auto_141372 ?auto_141374 ) ) ( not ( = ?auto_141372 ?auto_141375 ) ) ( not ( = ?auto_141372 ?auto_141376 ) ) ( not ( = ?auto_141372 ?auto_141377 ) ) ( not ( = ?auto_141372 ?auto_141378 ) ) ( not ( = ?auto_141372 ?auto_141379 ) ) ( not ( = ?auto_141372 ?auto_141380 ) ) ( not ( = ?auto_141372 ?auto_141381 ) ) ( not ( = ?auto_141372 ?auto_141382 ) ) ( not ( = ?auto_141373 ?auto_141374 ) ) ( not ( = ?auto_141373 ?auto_141375 ) ) ( not ( = ?auto_141373 ?auto_141376 ) ) ( not ( = ?auto_141373 ?auto_141377 ) ) ( not ( = ?auto_141373 ?auto_141378 ) ) ( not ( = ?auto_141373 ?auto_141379 ) ) ( not ( = ?auto_141373 ?auto_141380 ) ) ( not ( = ?auto_141373 ?auto_141381 ) ) ( not ( = ?auto_141373 ?auto_141382 ) ) ( not ( = ?auto_141374 ?auto_141375 ) ) ( not ( = ?auto_141374 ?auto_141376 ) ) ( not ( = ?auto_141374 ?auto_141377 ) ) ( not ( = ?auto_141374 ?auto_141378 ) ) ( not ( = ?auto_141374 ?auto_141379 ) ) ( not ( = ?auto_141374 ?auto_141380 ) ) ( not ( = ?auto_141374 ?auto_141381 ) ) ( not ( = ?auto_141374 ?auto_141382 ) ) ( not ( = ?auto_141375 ?auto_141376 ) ) ( not ( = ?auto_141375 ?auto_141377 ) ) ( not ( = ?auto_141375 ?auto_141378 ) ) ( not ( = ?auto_141375 ?auto_141379 ) ) ( not ( = ?auto_141375 ?auto_141380 ) ) ( not ( = ?auto_141375 ?auto_141381 ) ) ( not ( = ?auto_141375 ?auto_141382 ) ) ( not ( = ?auto_141376 ?auto_141377 ) ) ( not ( = ?auto_141376 ?auto_141378 ) ) ( not ( = ?auto_141376 ?auto_141379 ) ) ( not ( = ?auto_141376 ?auto_141380 ) ) ( not ( = ?auto_141376 ?auto_141381 ) ) ( not ( = ?auto_141376 ?auto_141382 ) ) ( not ( = ?auto_141377 ?auto_141378 ) ) ( not ( = ?auto_141377 ?auto_141379 ) ) ( not ( = ?auto_141377 ?auto_141380 ) ) ( not ( = ?auto_141377 ?auto_141381 ) ) ( not ( = ?auto_141377 ?auto_141382 ) ) ( not ( = ?auto_141378 ?auto_141379 ) ) ( not ( = ?auto_141378 ?auto_141380 ) ) ( not ( = ?auto_141378 ?auto_141381 ) ) ( not ( = ?auto_141378 ?auto_141382 ) ) ( not ( = ?auto_141379 ?auto_141380 ) ) ( not ( = ?auto_141379 ?auto_141381 ) ) ( not ( = ?auto_141379 ?auto_141382 ) ) ( not ( = ?auto_141380 ?auto_141381 ) ) ( not ( = ?auto_141380 ?auto_141382 ) ) ( not ( = ?auto_141381 ?auto_141382 ) ) ( ON ?auto_141380 ?auto_141381 ) ( ON ?auto_141379 ?auto_141380 ) ( ON ?auto_141378 ?auto_141379 ) ( ON ?auto_141377 ?auto_141378 ) ( ON ?auto_141376 ?auto_141377 ) ( ON ?auto_141375 ?auto_141376 ) ( ON ?auto_141374 ?auto_141375 ) ( ON ?auto_141373 ?auto_141374 ) ( ON ?auto_141372 ?auto_141373 ) ( ON ?auto_141371 ?auto_141372 ) ( CLEAR ?auto_141371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141371 )
      ( MAKE-11PILE ?auto_141371 ?auto_141372 ?auto_141373 ?auto_141374 ?auto_141375 ?auto_141376 ?auto_141377 ?auto_141378 ?auto_141379 ?auto_141380 ?auto_141381 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_141394 - BLOCK
      ?auto_141395 - BLOCK
      ?auto_141396 - BLOCK
      ?auto_141397 - BLOCK
      ?auto_141398 - BLOCK
      ?auto_141399 - BLOCK
      ?auto_141400 - BLOCK
      ?auto_141401 - BLOCK
      ?auto_141402 - BLOCK
      ?auto_141403 - BLOCK
      ?auto_141404 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141404 ) ( not ( = ?auto_141394 ?auto_141395 ) ) ( not ( = ?auto_141394 ?auto_141396 ) ) ( not ( = ?auto_141394 ?auto_141397 ) ) ( not ( = ?auto_141394 ?auto_141398 ) ) ( not ( = ?auto_141394 ?auto_141399 ) ) ( not ( = ?auto_141394 ?auto_141400 ) ) ( not ( = ?auto_141394 ?auto_141401 ) ) ( not ( = ?auto_141394 ?auto_141402 ) ) ( not ( = ?auto_141394 ?auto_141403 ) ) ( not ( = ?auto_141394 ?auto_141404 ) ) ( not ( = ?auto_141395 ?auto_141396 ) ) ( not ( = ?auto_141395 ?auto_141397 ) ) ( not ( = ?auto_141395 ?auto_141398 ) ) ( not ( = ?auto_141395 ?auto_141399 ) ) ( not ( = ?auto_141395 ?auto_141400 ) ) ( not ( = ?auto_141395 ?auto_141401 ) ) ( not ( = ?auto_141395 ?auto_141402 ) ) ( not ( = ?auto_141395 ?auto_141403 ) ) ( not ( = ?auto_141395 ?auto_141404 ) ) ( not ( = ?auto_141396 ?auto_141397 ) ) ( not ( = ?auto_141396 ?auto_141398 ) ) ( not ( = ?auto_141396 ?auto_141399 ) ) ( not ( = ?auto_141396 ?auto_141400 ) ) ( not ( = ?auto_141396 ?auto_141401 ) ) ( not ( = ?auto_141396 ?auto_141402 ) ) ( not ( = ?auto_141396 ?auto_141403 ) ) ( not ( = ?auto_141396 ?auto_141404 ) ) ( not ( = ?auto_141397 ?auto_141398 ) ) ( not ( = ?auto_141397 ?auto_141399 ) ) ( not ( = ?auto_141397 ?auto_141400 ) ) ( not ( = ?auto_141397 ?auto_141401 ) ) ( not ( = ?auto_141397 ?auto_141402 ) ) ( not ( = ?auto_141397 ?auto_141403 ) ) ( not ( = ?auto_141397 ?auto_141404 ) ) ( not ( = ?auto_141398 ?auto_141399 ) ) ( not ( = ?auto_141398 ?auto_141400 ) ) ( not ( = ?auto_141398 ?auto_141401 ) ) ( not ( = ?auto_141398 ?auto_141402 ) ) ( not ( = ?auto_141398 ?auto_141403 ) ) ( not ( = ?auto_141398 ?auto_141404 ) ) ( not ( = ?auto_141399 ?auto_141400 ) ) ( not ( = ?auto_141399 ?auto_141401 ) ) ( not ( = ?auto_141399 ?auto_141402 ) ) ( not ( = ?auto_141399 ?auto_141403 ) ) ( not ( = ?auto_141399 ?auto_141404 ) ) ( not ( = ?auto_141400 ?auto_141401 ) ) ( not ( = ?auto_141400 ?auto_141402 ) ) ( not ( = ?auto_141400 ?auto_141403 ) ) ( not ( = ?auto_141400 ?auto_141404 ) ) ( not ( = ?auto_141401 ?auto_141402 ) ) ( not ( = ?auto_141401 ?auto_141403 ) ) ( not ( = ?auto_141401 ?auto_141404 ) ) ( not ( = ?auto_141402 ?auto_141403 ) ) ( not ( = ?auto_141402 ?auto_141404 ) ) ( not ( = ?auto_141403 ?auto_141404 ) ) ( ON ?auto_141403 ?auto_141404 ) ( ON ?auto_141402 ?auto_141403 ) ( ON ?auto_141401 ?auto_141402 ) ( ON ?auto_141400 ?auto_141401 ) ( ON ?auto_141399 ?auto_141400 ) ( ON ?auto_141398 ?auto_141399 ) ( ON ?auto_141397 ?auto_141398 ) ( ON ?auto_141396 ?auto_141397 ) ( ON ?auto_141395 ?auto_141396 ) ( ON ?auto_141394 ?auto_141395 ) ( CLEAR ?auto_141394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141394 )
      ( MAKE-11PILE ?auto_141394 ?auto_141395 ?auto_141396 ?auto_141397 ?auto_141398 ?auto_141399 ?auto_141400 ?auto_141401 ?auto_141402 ?auto_141403 ?auto_141404 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_141416 - BLOCK
      ?auto_141417 - BLOCK
      ?auto_141418 - BLOCK
      ?auto_141419 - BLOCK
      ?auto_141420 - BLOCK
      ?auto_141421 - BLOCK
      ?auto_141422 - BLOCK
      ?auto_141423 - BLOCK
      ?auto_141424 - BLOCK
      ?auto_141425 - BLOCK
      ?auto_141426 - BLOCK
    )
    :vars
    (
      ?auto_141427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141416 ?auto_141417 ) ) ( not ( = ?auto_141416 ?auto_141418 ) ) ( not ( = ?auto_141416 ?auto_141419 ) ) ( not ( = ?auto_141416 ?auto_141420 ) ) ( not ( = ?auto_141416 ?auto_141421 ) ) ( not ( = ?auto_141416 ?auto_141422 ) ) ( not ( = ?auto_141416 ?auto_141423 ) ) ( not ( = ?auto_141416 ?auto_141424 ) ) ( not ( = ?auto_141416 ?auto_141425 ) ) ( not ( = ?auto_141416 ?auto_141426 ) ) ( not ( = ?auto_141417 ?auto_141418 ) ) ( not ( = ?auto_141417 ?auto_141419 ) ) ( not ( = ?auto_141417 ?auto_141420 ) ) ( not ( = ?auto_141417 ?auto_141421 ) ) ( not ( = ?auto_141417 ?auto_141422 ) ) ( not ( = ?auto_141417 ?auto_141423 ) ) ( not ( = ?auto_141417 ?auto_141424 ) ) ( not ( = ?auto_141417 ?auto_141425 ) ) ( not ( = ?auto_141417 ?auto_141426 ) ) ( not ( = ?auto_141418 ?auto_141419 ) ) ( not ( = ?auto_141418 ?auto_141420 ) ) ( not ( = ?auto_141418 ?auto_141421 ) ) ( not ( = ?auto_141418 ?auto_141422 ) ) ( not ( = ?auto_141418 ?auto_141423 ) ) ( not ( = ?auto_141418 ?auto_141424 ) ) ( not ( = ?auto_141418 ?auto_141425 ) ) ( not ( = ?auto_141418 ?auto_141426 ) ) ( not ( = ?auto_141419 ?auto_141420 ) ) ( not ( = ?auto_141419 ?auto_141421 ) ) ( not ( = ?auto_141419 ?auto_141422 ) ) ( not ( = ?auto_141419 ?auto_141423 ) ) ( not ( = ?auto_141419 ?auto_141424 ) ) ( not ( = ?auto_141419 ?auto_141425 ) ) ( not ( = ?auto_141419 ?auto_141426 ) ) ( not ( = ?auto_141420 ?auto_141421 ) ) ( not ( = ?auto_141420 ?auto_141422 ) ) ( not ( = ?auto_141420 ?auto_141423 ) ) ( not ( = ?auto_141420 ?auto_141424 ) ) ( not ( = ?auto_141420 ?auto_141425 ) ) ( not ( = ?auto_141420 ?auto_141426 ) ) ( not ( = ?auto_141421 ?auto_141422 ) ) ( not ( = ?auto_141421 ?auto_141423 ) ) ( not ( = ?auto_141421 ?auto_141424 ) ) ( not ( = ?auto_141421 ?auto_141425 ) ) ( not ( = ?auto_141421 ?auto_141426 ) ) ( not ( = ?auto_141422 ?auto_141423 ) ) ( not ( = ?auto_141422 ?auto_141424 ) ) ( not ( = ?auto_141422 ?auto_141425 ) ) ( not ( = ?auto_141422 ?auto_141426 ) ) ( not ( = ?auto_141423 ?auto_141424 ) ) ( not ( = ?auto_141423 ?auto_141425 ) ) ( not ( = ?auto_141423 ?auto_141426 ) ) ( not ( = ?auto_141424 ?auto_141425 ) ) ( not ( = ?auto_141424 ?auto_141426 ) ) ( not ( = ?auto_141425 ?auto_141426 ) ) ( ON ?auto_141416 ?auto_141427 ) ( not ( = ?auto_141426 ?auto_141427 ) ) ( not ( = ?auto_141425 ?auto_141427 ) ) ( not ( = ?auto_141424 ?auto_141427 ) ) ( not ( = ?auto_141423 ?auto_141427 ) ) ( not ( = ?auto_141422 ?auto_141427 ) ) ( not ( = ?auto_141421 ?auto_141427 ) ) ( not ( = ?auto_141420 ?auto_141427 ) ) ( not ( = ?auto_141419 ?auto_141427 ) ) ( not ( = ?auto_141418 ?auto_141427 ) ) ( not ( = ?auto_141417 ?auto_141427 ) ) ( not ( = ?auto_141416 ?auto_141427 ) ) ( ON ?auto_141417 ?auto_141416 ) ( ON ?auto_141418 ?auto_141417 ) ( ON ?auto_141419 ?auto_141418 ) ( ON ?auto_141420 ?auto_141419 ) ( ON ?auto_141421 ?auto_141420 ) ( ON ?auto_141422 ?auto_141421 ) ( ON ?auto_141423 ?auto_141422 ) ( ON ?auto_141424 ?auto_141423 ) ( ON ?auto_141425 ?auto_141424 ) ( ON ?auto_141426 ?auto_141425 ) ( CLEAR ?auto_141426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_141426 ?auto_141425 ?auto_141424 ?auto_141423 ?auto_141422 ?auto_141421 ?auto_141420 ?auto_141419 ?auto_141418 ?auto_141417 ?auto_141416 )
      ( MAKE-11PILE ?auto_141416 ?auto_141417 ?auto_141418 ?auto_141419 ?auto_141420 ?auto_141421 ?auto_141422 ?auto_141423 ?auto_141424 ?auto_141425 ?auto_141426 ) )
  )

)

