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
      ?auto_172253 - BLOCK
    )
    :vars
    (
      ?auto_172254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172253 ?auto_172254 ) ( CLEAR ?auto_172253 ) ( HAND-EMPTY ) ( not ( = ?auto_172253 ?auto_172254 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172253 ?auto_172254 )
      ( !PUTDOWN ?auto_172253 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172256 - BLOCK
    )
    :vars
    (
      ?auto_172257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172256 ?auto_172257 ) ( CLEAR ?auto_172256 ) ( HAND-EMPTY ) ( not ( = ?auto_172256 ?auto_172257 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172256 ?auto_172257 )
      ( !PUTDOWN ?auto_172256 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172260 - BLOCK
      ?auto_172261 - BLOCK
    )
    :vars
    (
      ?auto_172262 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_172260 ) ( ON ?auto_172261 ?auto_172262 ) ( CLEAR ?auto_172261 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172260 ) ( not ( = ?auto_172260 ?auto_172261 ) ) ( not ( = ?auto_172260 ?auto_172262 ) ) ( not ( = ?auto_172261 ?auto_172262 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172261 ?auto_172262 )
      ( !STACK ?auto_172261 ?auto_172260 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172265 - BLOCK
      ?auto_172266 - BLOCK
    )
    :vars
    (
      ?auto_172267 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_172265 ) ( ON ?auto_172266 ?auto_172267 ) ( CLEAR ?auto_172266 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172265 ) ( not ( = ?auto_172265 ?auto_172266 ) ) ( not ( = ?auto_172265 ?auto_172267 ) ) ( not ( = ?auto_172266 ?auto_172267 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172266 ?auto_172267 )
      ( !STACK ?auto_172266 ?auto_172265 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172270 - BLOCK
      ?auto_172271 - BLOCK
    )
    :vars
    (
      ?auto_172272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172271 ?auto_172272 ) ( not ( = ?auto_172270 ?auto_172271 ) ) ( not ( = ?auto_172270 ?auto_172272 ) ) ( not ( = ?auto_172271 ?auto_172272 ) ) ( ON ?auto_172270 ?auto_172271 ) ( CLEAR ?auto_172270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172270 )
      ( MAKE-2PILE ?auto_172270 ?auto_172271 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172275 - BLOCK
      ?auto_172276 - BLOCK
    )
    :vars
    (
      ?auto_172277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172276 ?auto_172277 ) ( not ( = ?auto_172275 ?auto_172276 ) ) ( not ( = ?auto_172275 ?auto_172277 ) ) ( not ( = ?auto_172276 ?auto_172277 ) ) ( ON ?auto_172275 ?auto_172276 ) ( CLEAR ?auto_172275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172275 )
      ( MAKE-2PILE ?auto_172275 ?auto_172276 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172281 - BLOCK
      ?auto_172282 - BLOCK
      ?auto_172283 - BLOCK
    )
    :vars
    (
      ?auto_172284 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_172282 ) ( ON ?auto_172283 ?auto_172284 ) ( CLEAR ?auto_172283 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172281 ) ( ON ?auto_172282 ?auto_172281 ) ( not ( = ?auto_172281 ?auto_172282 ) ) ( not ( = ?auto_172281 ?auto_172283 ) ) ( not ( = ?auto_172281 ?auto_172284 ) ) ( not ( = ?auto_172282 ?auto_172283 ) ) ( not ( = ?auto_172282 ?auto_172284 ) ) ( not ( = ?auto_172283 ?auto_172284 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172283 ?auto_172284 )
      ( !STACK ?auto_172283 ?auto_172282 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172288 - BLOCK
      ?auto_172289 - BLOCK
      ?auto_172290 - BLOCK
    )
    :vars
    (
      ?auto_172291 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_172289 ) ( ON ?auto_172290 ?auto_172291 ) ( CLEAR ?auto_172290 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172288 ) ( ON ?auto_172289 ?auto_172288 ) ( not ( = ?auto_172288 ?auto_172289 ) ) ( not ( = ?auto_172288 ?auto_172290 ) ) ( not ( = ?auto_172288 ?auto_172291 ) ) ( not ( = ?auto_172289 ?auto_172290 ) ) ( not ( = ?auto_172289 ?auto_172291 ) ) ( not ( = ?auto_172290 ?auto_172291 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172290 ?auto_172291 )
      ( !STACK ?auto_172290 ?auto_172289 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172295 - BLOCK
      ?auto_172296 - BLOCK
      ?auto_172297 - BLOCK
    )
    :vars
    (
      ?auto_172298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172297 ?auto_172298 ) ( ON-TABLE ?auto_172295 ) ( not ( = ?auto_172295 ?auto_172296 ) ) ( not ( = ?auto_172295 ?auto_172297 ) ) ( not ( = ?auto_172295 ?auto_172298 ) ) ( not ( = ?auto_172296 ?auto_172297 ) ) ( not ( = ?auto_172296 ?auto_172298 ) ) ( not ( = ?auto_172297 ?auto_172298 ) ) ( CLEAR ?auto_172295 ) ( ON ?auto_172296 ?auto_172297 ) ( CLEAR ?auto_172296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172295 ?auto_172296 )
      ( MAKE-3PILE ?auto_172295 ?auto_172296 ?auto_172297 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172302 - BLOCK
      ?auto_172303 - BLOCK
      ?auto_172304 - BLOCK
    )
    :vars
    (
      ?auto_172305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172304 ?auto_172305 ) ( ON-TABLE ?auto_172302 ) ( not ( = ?auto_172302 ?auto_172303 ) ) ( not ( = ?auto_172302 ?auto_172304 ) ) ( not ( = ?auto_172302 ?auto_172305 ) ) ( not ( = ?auto_172303 ?auto_172304 ) ) ( not ( = ?auto_172303 ?auto_172305 ) ) ( not ( = ?auto_172304 ?auto_172305 ) ) ( CLEAR ?auto_172302 ) ( ON ?auto_172303 ?auto_172304 ) ( CLEAR ?auto_172303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172302 ?auto_172303 )
      ( MAKE-3PILE ?auto_172302 ?auto_172303 ?auto_172304 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172309 - BLOCK
      ?auto_172310 - BLOCK
      ?auto_172311 - BLOCK
    )
    :vars
    (
      ?auto_172312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172311 ?auto_172312 ) ( not ( = ?auto_172309 ?auto_172310 ) ) ( not ( = ?auto_172309 ?auto_172311 ) ) ( not ( = ?auto_172309 ?auto_172312 ) ) ( not ( = ?auto_172310 ?auto_172311 ) ) ( not ( = ?auto_172310 ?auto_172312 ) ) ( not ( = ?auto_172311 ?auto_172312 ) ) ( ON ?auto_172310 ?auto_172311 ) ( ON ?auto_172309 ?auto_172310 ) ( CLEAR ?auto_172309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172309 )
      ( MAKE-3PILE ?auto_172309 ?auto_172310 ?auto_172311 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172316 - BLOCK
      ?auto_172317 - BLOCK
      ?auto_172318 - BLOCK
    )
    :vars
    (
      ?auto_172319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172318 ?auto_172319 ) ( not ( = ?auto_172316 ?auto_172317 ) ) ( not ( = ?auto_172316 ?auto_172318 ) ) ( not ( = ?auto_172316 ?auto_172319 ) ) ( not ( = ?auto_172317 ?auto_172318 ) ) ( not ( = ?auto_172317 ?auto_172319 ) ) ( not ( = ?auto_172318 ?auto_172319 ) ) ( ON ?auto_172317 ?auto_172318 ) ( ON ?auto_172316 ?auto_172317 ) ( CLEAR ?auto_172316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172316 )
      ( MAKE-3PILE ?auto_172316 ?auto_172317 ?auto_172318 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_172324 - BLOCK
      ?auto_172325 - BLOCK
      ?auto_172326 - BLOCK
      ?auto_172327 - BLOCK
    )
    :vars
    (
      ?auto_172328 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_172326 ) ( ON ?auto_172327 ?auto_172328 ) ( CLEAR ?auto_172327 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172324 ) ( ON ?auto_172325 ?auto_172324 ) ( ON ?auto_172326 ?auto_172325 ) ( not ( = ?auto_172324 ?auto_172325 ) ) ( not ( = ?auto_172324 ?auto_172326 ) ) ( not ( = ?auto_172324 ?auto_172327 ) ) ( not ( = ?auto_172324 ?auto_172328 ) ) ( not ( = ?auto_172325 ?auto_172326 ) ) ( not ( = ?auto_172325 ?auto_172327 ) ) ( not ( = ?auto_172325 ?auto_172328 ) ) ( not ( = ?auto_172326 ?auto_172327 ) ) ( not ( = ?auto_172326 ?auto_172328 ) ) ( not ( = ?auto_172327 ?auto_172328 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172327 ?auto_172328 )
      ( !STACK ?auto_172327 ?auto_172326 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_172333 - BLOCK
      ?auto_172334 - BLOCK
      ?auto_172335 - BLOCK
      ?auto_172336 - BLOCK
    )
    :vars
    (
      ?auto_172337 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_172335 ) ( ON ?auto_172336 ?auto_172337 ) ( CLEAR ?auto_172336 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172333 ) ( ON ?auto_172334 ?auto_172333 ) ( ON ?auto_172335 ?auto_172334 ) ( not ( = ?auto_172333 ?auto_172334 ) ) ( not ( = ?auto_172333 ?auto_172335 ) ) ( not ( = ?auto_172333 ?auto_172336 ) ) ( not ( = ?auto_172333 ?auto_172337 ) ) ( not ( = ?auto_172334 ?auto_172335 ) ) ( not ( = ?auto_172334 ?auto_172336 ) ) ( not ( = ?auto_172334 ?auto_172337 ) ) ( not ( = ?auto_172335 ?auto_172336 ) ) ( not ( = ?auto_172335 ?auto_172337 ) ) ( not ( = ?auto_172336 ?auto_172337 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172336 ?auto_172337 )
      ( !STACK ?auto_172336 ?auto_172335 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_172342 - BLOCK
      ?auto_172343 - BLOCK
      ?auto_172344 - BLOCK
      ?auto_172345 - BLOCK
    )
    :vars
    (
      ?auto_172346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172345 ?auto_172346 ) ( ON-TABLE ?auto_172342 ) ( ON ?auto_172343 ?auto_172342 ) ( not ( = ?auto_172342 ?auto_172343 ) ) ( not ( = ?auto_172342 ?auto_172344 ) ) ( not ( = ?auto_172342 ?auto_172345 ) ) ( not ( = ?auto_172342 ?auto_172346 ) ) ( not ( = ?auto_172343 ?auto_172344 ) ) ( not ( = ?auto_172343 ?auto_172345 ) ) ( not ( = ?auto_172343 ?auto_172346 ) ) ( not ( = ?auto_172344 ?auto_172345 ) ) ( not ( = ?auto_172344 ?auto_172346 ) ) ( not ( = ?auto_172345 ?auto_172346 ) ) ( CLEAR ?auto_172343 ) ( ON ?auto_172344 ?auto_172345 ) ( CLEAR ?auto_172344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172342 ?auto_172343 ?auto_172344 )
      ( MAKE-4PILE ?auto_172342 ?auto_172343 ?auto_172344 ?auto_172345 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_172351 - BLOCK
      ?auto_172352 - BLOCK
      ?auto_172353 - BLOCK
      ?auto_172354 - BLOCK
    )
    :vars
    (
      ?auto_172355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172354 ?auto_172355 ) ( ON-TABLE ?auto_172351 ) ( ON ?auto_172352 ?auto_172351 ) ( not ( = ?auto_172351 ?auto_172352 ) ) ( not ( = ?auto_172351 ?auto_172353 ) ) ( not ( = ?auto_172351 ?auto_172354 ) ) ( not ( = ?auto_172351 ?auto_172355 ) ) ( not ( = ?auto_172352 ?auto_172353 ) ) ( not ( = ?auto_172352 ?auto_172354 ) ) ( not ( = ?auto_172352 ?auto_172355 ) ) ( not ( = ?auto_172353 ?auto_172354 ) ) ( not ( = ?auto_172353 ?auto_172355 ) ) ( not ( = ?auto_172354 ?auto_172355 ) ) ( CLEAR ?auto_172352 ) ( ON ?auto_172353 ?auto_172354 ) ( CLEAR ?auto_172353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172351 ?auto_172352 ?auto_172353 )
      ( MAKE-4PILE ?auto_172351 ?auto_172352 ?auto_172353 ?auto_172354 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_172360 - BLOCK
      ?auto_172361 - BLOCK
      ?auto_172362 - BLOCK
      ?auto_172363 - BLOCK
    )
    :vars
    (
      ?auto_172364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172363 ?auto_172364 ) ( ON-TABLE ?auto_172360 ) ( not ( = ?auto_172360 ?auto_172361 ) ) ( not ( = ?auto_172360 ?auto_172362 ) ) ( not ( = ?auto_172360 ?auto_172363 ) ) ( not ( = ?auto_172360 ?auto_172364 ) ) ( not ( = ?auto_172361 ?auto_172362 ) ) ( not ( = ?auto_172361 ?auto_172363 ) ) ( not ( = ?auto_172361 ?auto_172364 ) ) ( not ( = ?auto_172362 ?auto_172363 ) ) ( not ( = ?auto_172362 ?auto_172364 ) ) ( not ( = ?auto_172363 ?auto_172364 ) ) ( ON ?auto_172362 ?auto_172363 ) ( CLEAR ?auto_172360 ) ( ON ?auto_172361 ?auto_172362 ) ( CLEAR ?auto_172361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172360 ?auto_172361 )
      ( MAKE-4PILE ?auto_172360 ?auto_172361 ?auto_172362 ?auto_172363 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_172369 - BLOCK
      ?auto_172370 - BLOCK
      ?auto_172371 - BLOCK
      ?auto_172372 - BLOCK
    )
    :vars
    (
      ?auto_172373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172372 ?auto_172373 ) ( ON-TABLE ?auto_172369 ) ( not ( = ?auto_172369 ?auto_172370 ) ) ( not ( = ?auto_172369 ?auto_172371 ) ) ( not ( = ?auto_172369 ?auto_172372 ) ) ( not ( = ?auto_172369 ?auto_172373 ) ) ( not ( = ?auto_172370 ?auto_172371 ) ) ( not ( = ?auto_172370 ?auto_172372 ) ) ( not ( = ?auto_172370 ?auto_172373 ) ) ( not ( = ?auto_172371 ?auto_172372 ) ) ( not ( = ?auto_172371 ?auto_172373 ) ) ( not ( = ?auto_172372 ?auto_172373 ) ) ( ON ?auto_172371 ?auto_172372 ) ( CLEAR ?auto_172369 ) ( ON ?auto_172370 ?auto_172371 ) ( CLEAR ?auto_172370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172369 ?auto_172370 )
      ( MAKE-4PILE ?auto_172369 ?auto_172370 ?auto_172371 ?auto_172372 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_172378 - BLOCK
      ?auto_172379 - BLOCK
      ?auto_172380 - BLOCK
      ?auto_172381 - BLOCK
    )
    :vars
    (
      ?auto_172382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172381 ?auto_172382 ) ( not ( = ?auto_172378 ?auto_172379 ) ) ( not ( = ?auto_172378 ?auto_172380 ) ) ( not ( = ?auto_172378 ?auto_172381 ) ) ( not ( = ?auto_172378 ?auto_172382 ) ) ( not ( = ?auto_172379 ?auto_172380 ) ) ( not ( = ?auto_172379 ?auto_172381 ) ) ( not ( = ?auto_172379 ?auto_172382 ) ) ( not ( = ?auto_172380 ?auto_172381 ) ) ( not ( = ?auto_172380 ?auto_172382 ) ) ( not ( = ?auto_172381 ?auto_172382 ) ) ( ON ?auto_172380 ?auto_172381 ) ( ON ?auto_172379 ?auto_172380 ) ( ON ?auto_172378 ?auto_172379 ) ( CLEAR ?auto_172378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172378 )
      ( MAKE-4PILE ?auto_172378 ?auto_172379 ?auto_172380 ?auto_172381 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_172387 - BLOCK
      ?auto_172388 - BLOCK
      ?auto_172389 - BLOCK
      ?auto_172390 - BLOCK
    )
    :vars
    (
      ?auto_172391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172390 ?auto_172391 ) ( not ( = ?auto_172387 ?auto_172388 ) ) ( not ( = ?auto_172387 ?auto_172389 ) ) ( not ( = ?auto_172387 ?auto_172390 ) ) ( not ( = ?auto_172387 ?auto_172391 ) ) ( not ( = ?auto_172388 ?auto_172389 ) ) ( not ( = ?auto_172388 ?auto_172390 ) ) ( not ( = ?auto_172388 ?auto_172391 ) ) ( not ( = ?auto_172389 ?auto_172390 ) ) ( not ( = ?auto_172389 ?auto_172391 ) ) ( not ( = ?auto_172390 ?auto_172391 ) ) ( ON ?auto_172389 ?auto_172390 ) ( ON ?auto_172388 ?auto_172389 ) ( ON ?auto_172387 ?auto_172388 ) ( CLEAR ?auto_172387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172387 )
      ( MAKE-4PILE ?auto_172387 ?auto_172388 ?auto_172389 ?auto_172390 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172397 - BLOCK
      ?auto_172398 - BLOCK
      ?auto_172399 - BLOCK
      ?auto_172400 - BLOCK
      ?auto_172401 - BLOCK
    )
    :vars
    (
      ?auto_172402 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_172400 ) ( ON ?auto_172401 ?auto_172402 ) ( CLEAR ?auto_172401 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172397 ) ( ON ?auto_172398 ?auto_172397 ) ( ON ?auto_172399 ?auto_172398 ) ( ON ?auto_172400 ?auto_172399 ) ( not ( = ?auto_172397 ?auto_172398 ) ) ( not ( = ?auto_172397 ?auto_172399 ) ) ( not ( = ?auto_172397 ?auto_172400 ) ) ( not ( = ?auto_172397 ?auto_172401 ) ) ( not ( = ?auto_172397 ?auto_172402 ) ) ( not ( = ?auto_172398 ?auto_172399 ) ) ( not ( = ?auto_172398 ?auto_172400 ) ) ( not ( = ?auto_172398 ?auto_172401 ) ) ( not ( = ?auto_172398 ?auto_172402 ) ) ( not ( = ?auto_172399 ?auto_172400 ) ) ( not ( = ?auto_172399 ?auto_172401 ) ) ( not ( = ?auto_172399 ?auto_172402 ) ) ( not ( = ?auto_172400 ?auto_172401 ) ) ( not ( = ?auto_172400 ?auto_172402 ) ) ( not ( = ?auto_172401 ?auto_172402 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172401 ?auto_172402 )
      ( !STACK ?auto_172401 ?auto_172400 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172408 - BLOCK
      ?auto_172409 - BLOCK
      ?auto_172410 - BLOCK
      ?auto_172411 - BLOCK
      ?auto_172412 - BLOCK
    )
    :vars
    (
      ?auto_172413 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_172411 ) ( ON ?auto_172412 ?auto_172413 ) ( CLEAR ?auto_172412 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172408 ) ( ON ?auto_172409 ?auto_172408 ) ( ON ?auto_172410 ?auto_172409 ) ( ON ?auto_172411 ?auto_172410 ) ( not ( = ?auto_172408 ?auto_172409 ) ) ( not ( = ?auto_172408 ?auto_172410 ) ) ( not ( = ?auto_172408 ?auto_172411 ) ) ( not ( = ?auto_172408 ?auto_172412 ) ) ( not ( = ?auto_172408 ?auto_172413 ) ) ( not ( = ?auto_172409 ?auto_172410 ) ) ( not ( = ?auto_172409 ?auto_172411 ) ) ( not ( = ?auto_172409 ?auto_172412 ) ) ( not ( = ?auto_172409 ?auto_172413 ) ) ( not ( = ?auto_172410 ?auto_172411 ) ) ( not ( = ?auto_172410 ?auto_172412 ) ) ( not ( = ?auto_172410 ?auto_172413 ) ) ( not ( = ?auto_172411 ?auto_172412 ) ) ( not ( = ?auto_172411 ?auto_172413 ) ) ( not ( = ?auto_172412 ?auto_172413 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172412 ?auto_172413 )
      ( !STACK ?auto_172412 ?auto_172411 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172419 - BLOCK
      ?auto_172420 - BLOCK
      ?auto_172421 - BLOCK
      ?auto_172422 - BLOCK
      ?auto_172423 - BLOCK
    )
    :vars
    (
      ?auto_172424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172423 ?auto_172424 ) ( ON-TABLE ?auto_172419 ) ( ON ?auto_172420 ?auto_172419 ) ( ON ?auto_172421 ?auto_172420 ) ( not ( = ?auto_172419 ?auto_172420 ) ) ( not ( = ?auto_172419 ?auto_172421 ) ) ( not ( = ?auto_172419 ?auto_172422 ) ) ( not ( = ?auto_172419 ?auto_172423 ) ) ( not ( = ?auto_172419 ?auto_172424 ) ) ( not ( = ?auto_172420 ?auto_172421 ) ) ( not ( = ?auto_172420 ?auto_172422 ) ) ( not ( = ?auto_172420 ?auto_172423 ) ) ( not ( = ?auto_172420 ?auto_172424 ) ) ( not ( = ?auto_172421 ?auto_172422 ) ) ( not ( = ?auto_172421 ?auto_172423 ) ) ( not ( = ?auto_172421 ?auto_172424 ) ) ( not ( = ?auto_172422 ?auto_172423 ) ) ( not ( = ?auto_172422 ?auto_172424 ) ) ( not ( = ?auto_172423 ?auto_172424 ) ) ( CLEAR ?auto_172421 ) ( ON ?auto_172422 ?auto_172423 ) ( CLEAR ?auto_172422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172419 ?auto_172420 ?auto_172421 ?auto_172422 )
      ( MAKE-5PILE ?auto_172419 ?auto_172420 ?auto_172421 ?auto_172422 ?auto_172423 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172430 - BLOCK
      ?auto_172431 - BLOCK
      ?auto_172432 - BLOCK
      ?auto_172433 - BLOCK
      ?auto_172434 - BLOCK
    )
    :vars
    (
      ?auto_172435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172434 ?auto_172435 ) ( ON-TABLE ?auto_172430 ) ( ON ?auto_172431 ?auto_172430 ) ( ON ?auto_172432 ?auto_172431 ) ( not ( = ?auto_172430 ?auto_172431 ) ) ( not ( = ?auto_172430 ?auto_172432 ) ) ( not ( = ?auto_172430 ?auto_172433 ) ) ( not ( = ?auto_172430 ?auto_172434 ) ) ( not ( = ?auto_172430 ?auto_172435 ) ) ( not ( = ?auto_172431 ?auto_172432 ) ) ( not ( = ?auto_172431 ?auto_172433 ) ) ( not ( = ?auto_172431 ?auto_172434 ) ) ( not ( = ?auto_172431 ?auto_172435 ) ) ( not ( = ?auto_172432 ?auto_172433 ) ) ( not ( = ?auto_172432 ?auto_172434 ) ) ( not ( = ?auto_172432 ?auto_172435 ) ) ( not ( = ?auto_172433 ?auto_172434 ) ) ( not ( = ?auto_172433 ?auto_172435 ) ) ( not ( = ?auto_172434 ?auto_172435 ) ) ( CLEAR ?auto_172432 ) ( ON ?auto_172433 ?auto_172434 ) ( CLEAR ?auto_172433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172430 ?auto_172431 ?auto_172432 ?auto_172433 )
      ( MAKE-5PILE ?auto_172430 ?auto_172431 ?auto_172432 ?auto_172433 ?auto_172434 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172441 - BLOCK
      ?auto_172442 - BLOCK
      ?auto_172443 - BLOCK
      ?auto_172444 - BLOCK
      ?auto_172445 - BLOCK
    )
    :vars
    (
      ?auto_172446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172445 ?auto_172446 ) ( ON-TABLE ?auto_172441 ) ( ON ?auto_172442 ?auto_172441 ) ( not ( = ?auto_172441 ?auto_172442 ) ) ( not ( = ?auto_172441 ?auto_172443 ) ) ( not ( = ?auto_172441 ?auto_172444 ) ) ( not ( = ?auto_172441 ?auto_172445 ) ) ( not ( = ?auto_172441 ?auto_172446 ) ) ( not ( = ?auto_172442 ?auto_172443 ) ) ( not ( = ?auto_172442 ?auto_172444 ) ) ( not ( = ?auto_172442 ?auto_172445 ) ) ( not ( = ?auto_172442 ?auto_172446 ) ) ( not ( = ?auto_172443 ?auto_172444 ) ) ( not ( = ?auto_172443 ?auto_172445 ) ) ( not ( = ?auto_172443 ?auto_172446 ) ) ( not ( = ?auto_172444 ?auto_172445 ) ) ( not ( = ?auto_172444 ?auto_172446 ) ) ( not ( = ?auto_172445 ?auto_172446 ) ) ( ON ?auto_172444 ?auto_172445 ) ( CLEAR ?auto_172442 ) ( ON ?auto_172443 ?auto_172444 ) ( CLEAR ?auto_172443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172441 ?auto_172442 ?auto_172443 )
      ( MAKE-5PILE ?auto_172441 ?auto_172442 ?auto_172443 ?auto_172444 ?auto_172445 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172452 - BLOCK
      ?auto_172453 - BLOCK
      ?auto_172454 - BLOCK
      ?auto_172455 - BLOCK
      ?auto_172456 - BLOCK
    )
    :vars
    (
      ?auto_172457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172456 ?auto_172457 ) ( ON-TABLE ?auto_172452 ) ( ON ?auto_172453 ?auto_172452 ) ( not ( = ?auto_172452 ?auto_172453 ) ) ( not ( = ?auto_172452 ?auto_172454 ) ) ( not ( = ?auto_172452 ?auto_172455 ) ) ( not ( = ?auto_172452 ?auto_172456 ) ) ( not ( = ?auto_172452 ?auto_172457 ) ) ( not ( = ?auto_172453 ?auto_172454 ) ) ( not ( = ?auto_172453 ?auto_172455 ) ) ( not ( = ?auto_172453 ?auto_172456 ) ) ( not ( = ?auto_172453 ?auto_172457 ) ) ( not ( = ?auto_172454 ?auto_172455 ) ) ( not ( = ?auto_172454 ?auto_172456 ) ) ( not ( = ?auto_172454 ?auto_172457 ) ) ( not ( = ?auto_172455 ?auto_172456 ) ) ( not ( = ?auto_172455 ?auto_172457 ) ) ( not ( = ?auto_172456 ?auto_172457 ) ) ( ON ?auto_172455 ?auto_172456 ) ( CLEAR ?auto_172453 ) ( ON ?auto_172454 ?auto_172455 ) ( CLEAR ?auto_172454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172452 ?auto_172453 ?auto_172454 )
      ( MAKE-5PILE ?auto_172452 ?auto_172453 ?auto_172454 ?auto_172455 ?auto_172456 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172463 - BLOCK
      ?auto_172464 - BLOCK
      ?auto_172465 - BLOCK
      ?auto_172466 - BLOCK
      ?auto_172467 - BLOCK
    )
    :vars
    (
      ?auto_172468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172467 ?auto_172468 ) ( ON-TABLE ?auto_172463 ) ( not ( = ?auto_172463 ?auto_172464 ) ) ( not ( = ?auto_172463 ?auto_172465 ) ) ( not ( = ?auto_172463 ?auto_172466 ) ) ( not ( = ?auto_172463 ?auto_172467 ) ) ( not ( = ?auto_172463 ?auto_172468 ) ) ( not ( = ?auto_172464 ?auto_172465 ) ) ( not ( = ?auto_172464 ?auto_172466 ) ) ( not ( = ?auto_172464 ?auto_172467 ) ) ( not ( = ?auto_172464 ?auto_172468 ) ) ( not ( = ?auto_172465 ?auto_172466 ) ) ( not ( = ?auto_172465 ?auto_172467 ) ) ( not ( = ?auto_172465 ?auto_172468 ) ) ( not ( = ?auto_172466 ?auto_172467 ) ) ( not ( = ?auto_172466 ?auto_172468 ) ) ( not ( = ?auto_172467 ?auto_172468 ) ) ( ON ?auto_172466 ?auto_172467 ) ( ON ?auto_172465 ?auto_172466 ) ( CLEAR ?auto_172463 ) ( ON ?auto_172464 ?auto_172465 ) ( CLEAR ?auto_172464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172463 ?auto_172464 )
      ( MAKE-5PILE ?auto_172463 ?auto_172464 ?auto_172465 ?auto_172466 ?auto_172467 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172474 - BLOCK
      ?auto_172475 - BLOCK
      ?auto_172476 - BLOCK
      ?auto_172477 - BLOCK
      ?auto_172478 - BLOCK
    )
    :vars
    (
      ?auto_172479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172478 ?auto_172479 ) ( ON-TABLE ?auto_172474 ) ( not ( = ?auto_172474 ?auto_172475 ) ) ( not ( = ?auto_172474 ?auto_172476 ) ) ( not ( = ?auto_172474 ?auto_172477 ) ) ( not ( = ?auto_172474 ?auto_172478 ) ) ( not ( = ?auto_172474 ?auto_172479 ) ) ( not ( = ?auto_172475 ?auto_172476 ) ) ( not ( = ?auto_172475 ?auto_172477 ) ) ( not ( = ?auto_172475 ?auto_172478 ) ) ( not ( = ?auto_172475 ?auto_172479 ) ) ( not ( = ?auto_172476 ?auto_172477 ) ) ( not ( = ?auto_172476 ?auto_172478 ) ) ( not ( = ?auto_172476 ?auto_172479 ) ) ( not ( = ?auto_172477 ?auto_172478 ) ) ( not ( = ?auto_172477 ?auto_172479 ) ) ( not ( = ?auto_172478 ?auto_172479 ) ) ( ON ?auto_172477 ?auto_172478 ) ( ON ?auto_172476 ?auto_172477 ) ( CLEAR ?auto_172474 ) ( ON ?auto_172475 ?auto_172476 ) ( CLEAR ?auto_172475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172474 ?auto_172475 )
      ( MAKE-5PILE ?auto_172474 ?auto_172475 ?auto_172476 ?auto_172477 ?auto_172478 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172485 - BLOCK
      ?auto_172486 - BLOCK
      ?auto_172487 - BLOCK
      ?auto_172488 - BLOCK
      ?auto_172489 - BLOCK
    )
    :vars
    (
      ?auto_172490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172489 ?auto_172490 ) ( not ( = ?auto_172485 ?auto_172486 ) ) ( not ( = ?auto_172485 ?auto_172487 ) ) ( not ( = ?auto_172485 ?auto_172488 ) ) ( not ( = ?auto_172485 ?auto_172489 ) ) ( not ( = ?auto_172485 ?auto_172490 ) ) ( not ( = ?auto_172486 ?auto_172487 ) ) ( not ( = ?auto_172486 ?auto_172488 ) ) ( not ( = ?auto_172486 ?auto_172489 ) ) ( not ( = ?auto_172486 ?auto_172490 ) ) ( not ( = ?auto_172487 ?auto_172488 ) ) ( not ( = ?auto_172487 ?auto_172489 ) ) ( not ( = ?auto_172487 ?auto_172490 ) ) ( not ( = ?auto_172488 ?auto_172489 ) ) ( not ( = ?auto_172488 ?auto_172490 ) ) ( not ( = ?auto_172489 ?auto_172490 ) ) ( ON ?auto_172488 ?auto_172489 ) ( ON ?auto_172487 ?auto_172488 ) ( ON ?auto_172486 ?auto_172487 ) ( ON ?auto_172485 ?auto_172486 ) ( CLEAR ?auto_172485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172485 )
      ( MAKE-5PILE ?auto_172485 ?auto_172486 ?auto_172487 ?auto_172488 ?auto_172489 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172496 - BLOCK
      ?auto_172497 - BLOCK
      ?auto_172498 - BLOCK
      ?auto_172499 - BLOCK
      ?auto_172500 - BLOCK
    )
    :vars
    (
      ?auto_172501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172500 ?auto_172501 ) ( not ( = ?auto_172496 ?auto_172497 ) ) ( not ( = ?auto_172496 ?auto_172498 ) ) ( not ( = ?auto_172496 ?auto_172499 ) ) ( not ( = ?auto_172496 ?auto_172500 ) ) ( not ( = ?auto_172496 ?auto_172501 ) ) ( not ( = ?auto_172497 ?auto_172498 ) ) ( not ( = ?auto_172497 ?auto_172499 ) ) ( not ( = ?auto_172497 ?auto_172500 ) ) ( not ( = ?auto_172497 ?auto_172501 ) ) ( not ( = ?auto_172498 ?auto_172499 ) ) ( not ( = ?auto_172498 ?auto_172500 ) ) ( not ( = ?auto_172498 ?auto_172501 ) ) ( not ( = ?auto_172499 ?auto_172500 ) ) ( not ( = ?auto_172499 ?auto_172501 ) ) ( not ( = ?auto_172500 ?auto_172501 ) ) ( ON ?auto_172499 ?auto_172500 ) ( ON ?auto_172498 ?auto_172499 ) ( ON ?auto_172497 ?auto_172498 ) ( ON ?auto_172496 ?auto_172497 ) ( CLEAR ?auto_172496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172496 )
      ( MAKE-5PILE ?auto_172496 ?auto_172497 ?auto_172498 ?auto_172499 ?auto_172500 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172508 - BLOCK
      ?auto_172509 - BLOCK
      ?auto_172510 - BLOCK
      ?auto_172511 - BLOCK
      ?auto_172512 - BLOCK
      ?auto_172513 - BLOCK
    )
    :vars
    (
      ?auto_172514 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_172512 ) ( ON ?auto_172513 ?auto_172514 ) ( CLEAR ?auto_172513 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172508 ) ( ON ?auto_172509 ?auto_172508 ) ( ON ?auto_172510 ?auto_172509 ) ( ON ?auto_172511 ?auto_172510 ) ( ON ?auto_172512 ?auto_172511 ) ( not ( = ?auto_172508 ?auto_172509 ) ) ( not ( = ?auto_172508 ?auto_172510 ) ) ( not ( = ?auto_172508 ?auto_172511 ) ) ( not ( = ?auto_172508 ?auto_172512 ) ) ( not ( = ?auto_172508 ?auto_172513 ) ) ( not ( = ?auto_172508 ?auto_172514 ) ) ( not ( = ?auto_172509 ?auto_172510 ) ) ( not ( = ?auto_172509 ?auto_172511 ) ) ( not ( = ?auto_172509 ?auto_172512 ) ) ( not ( = ?auto_172509 ?auto_172513 ) ) ( not ( = ?auto_172509 ?auto_172514 ) ) ( not ( = ?auto_172510 ?auto_172511 ) ) ( not ( = ?auto_172510 ?auto_172512 ) ) ( not ( = ?auto_172510 ?auto_172513 ) ) ( not ( = ?auto_172510 ?auto_172514 ) ) ( not ( = ?auto_172511 ?auto_172512 ) ) ( not ( = ?auto_172511 ?auto_172513 ) ) ( not ( = ?auto_172511 ?auto_172514 ) ) ( not ( = ?auto_172512 ?auto_172513 ) ) ( not ( = ?auto_172512 ?auto_172514 ) ) ( not ( = ?auto_172513 ?auto_172514 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172513 ?auto_172514 )
      ( !STACK ?auto_172513 ?auto_172512 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172521 - BLOCK
      ?auto_172522 - BLOCK
      ?auto_172523 - BLOCK
      ?auto_172524 - BLOCK
      ?auto_172525 - BLOCK
      ?auto_172526 - BLOCK
    )
    :vars
    (
      ?auto_172527 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_172525 ) ( ON ?auto_172526 ?auto_172527 ) ( CLEAR ?auto_172526 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172521 ) ( ON ?auto_172522 ?auto_172521 ) ( ON ?auto_172523 ?auto_172522 ) ( ON ?auto_172524 ?auto_172523 ) ( ON ?auto_172525 ?auto_172524 ) ( not ( = ?auto_172521 ?auto_172522 ) ) ( not ( = ?auto_172521 ?auto_172523 ) ) ( not ( = ?auto_172521 ?auto_172524 ) ) ( not ( = ?auto_172521 ?auto_172525 ) ) ( not ( = ?auto_172521 ?auto_172526 ) ) ( not ( = ?auto_172521 ?auto_172527 ) ) ( not ( = ?auto_172522 ?auto_172523 ) ) ( not ( = ?auto_172522 ?auto_172524 ) ) ( not ( = ?auto_172522 ?auto_172525 ) ) ( not ( = ?auto_172522 ?auto_172526 ) ) ( not ( = ?auto_172522 ?auto_172527 ) ) ( not ( = ?auto_172523 ?auto_172524 ) ) ( not ( = ?auto_172523 ?auto_172525 ) ) ( not ( = ?auto_172523 ?auto_172526 ) ) ( not ( = ?auto_172523 ?auto_172527 ) ) ( not ( = ?auto_172524 ?auto_172525 ) ) ( not ( = ?auto_172524 ?auto_172526 ) ) ( not ( = ?auto_172524 ?auto_172527 ) ) ( not ( = ?auto_172525 ?auto_172526 ) ) ( not ( = ?auto_172525 ?auto_172527 ) ) ( not ( = ?auto_172526 ?auto_172527 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172526 ?auto_172527 )
      ( !STACK ?auto_172526 ?auto_172525 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172534 - BLOCK
      ?auto_172535 - BLOCK
      ?auto_172536 - BLOCK
      ?auto_172537 - BLOCK
      ?auto_172538 - BLOCK
      ?auto_172539 - BLOCK
    )
    :vars
    (
      ?auto_172540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172539 ?auto_172540 ) ( ON-TABLE ?auto_172534 ) ( ON ?auto_172535 ?auto_172534 ) ( ON ?auto_172536 ?auto_172535 ) ( ON ?auto_172537 ?auto_172536 ) ( not ( = ?auto_172534 ?auto_172535 ) ) ( not ( = ?auto_172534 ?auto_172536 ) ) ( not ( = ?auto_172534 ?auto_172537 ) ) ( not ( = ?auto_172534 ?auto_172538 ) ) ( not ( = ?auto_172534 ?auto_172539 ) ) ( not ( = ?auto_172534 ?auto_172540 ) ) ( not ( = ?auto_172535 ?auto_172536 ) ) ( not ( = ?auto_172535 ?auto_172537 ) ) ( not ( = ?auto_172535 ?auto_172538 ) ) ( not ( = ?auto_172535 ?auto_172539 ) ) ( not ( = ?auto_172535 ?auto_172540 ) ) ( not ( = ?auto_172536 ?auto_172537 ) ) ( not ( = ?auto_172536 ?auto_172538 ) ) ( not ( = ?auto_172536 ?auto_172539 ) ) ( not ( = ?auto_172536 ?auto_172540 ) ) ( not ( = ?auto_172537 ?auto_172538 ) ) ( not ( = ?auto_172537 ?auto_172539 ) ) ( not ( = ?auto_172537 ?auto_172540 ) ) ( not ( = ?auto_172538 ?auto_172539 ) ) ( not ( = ?auto_172538 ?auto_172540 ) ) ( not ( = ?auto_172539 ?auto_172540 ) ) ( CLEAR ?auto_172537 ) ( ON ?auto_172538 ?auto_172539 ) ( CLEAR ?auto_172538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172534 ?auto_172535 ?auto_172536 ?auto_172537 ?auto_172538 )
      ( MAKE-6PILE ?auto_172534 ?auto_172535 ?auto_172536 ?auto_172537 ?auto_172538 ?auto_172539 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172547 - BLOCK
      ?auto_172548 - BLOCK
      ?auto_172549 - BLOCK
      ?auto_172550 - BLOCK
      ?auto_172551 - BLOCK
      ?auto_172552 - BLOCK
    )
    :vars
    (
      ?auto_172553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172552 ?auto_172553 ) ( ON-TABLE ?auto_172547 ) ( ON ?auto_172548 ?auto_172547 ) ( ON ?auto_172549 ?auto_172548 ) ( ON ?auto_172550 ?auto_172549 ) ( not ( = ?auto_172547 ?auto_172548 ) ) ( not ( = ?auto_172547 ?auto_172549 ) ) ( not ( = ?auto_172547 ?auto_172550 ) ) ( not ( = ?auto_172547 ?auto_172551 ) ) ( not ( = ?auto_172547 ?auto_172552 ) ) ( not ( = ?auto_172547 ?auto_172553 ) ) ( not ( = ?auto_172548 ?auto_172549 ) ) ( not ( = ?auto_172548 ?auto_172550 ) ) ( not ( = ?auto_172548 ?auto_172551 ) ) ( not ( = ?auto_172548 ?auto_172552 ) ) ( not ( = ?auto_172548 ?auto_172553 ) ) ( not ( = ?auto_172549 ?auto_172550 ) ) ( not ( = ?auto_172549 ?auto_172551 ) ) ( not ( = ?auto_172549 ?auto_172552 ) ) ( not ( = ?auto_172549 ?auto_172553 ) ) ( not ( = ?auto_172550 ?auto_172551 ) ) ( not ( = ?auto_172550 ?auto_172552 ) ) ( not ( = ?auto_172550 ?auto_172553 ) ) ( not ( = ?auto_172551 ?auto_172552 ) ) ( not ( = ?auto_172551 ?auto_172553 ) ) ( not ( = ?auto_172552 ?auto_172553 ) ) ( CLEAR ?auto_172550 ) ( ON ?auto_172551 ?auto_172552 ) ( CLEAR ?auto_172551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172547 ?auto_172548 ?auto_172549 ?auto_172550 ?auto_172551 )
      ( MAKE-6PILE ?auto_172547 ?auto_172548 ?auto_172549 ?auto_172550 ?auto_172551 ?auto_172552 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172560 - BLOCK
      ?auto_172561 - BLOCK
      ?auto_172562 - BLOCK
      ?auto_172563 - BLOCK
      ?auto_172564 - BLOCK
      ?auto_172565 - BLOCK
    )
    :vars
    (
      ?auto_172566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172565 ?auto_172566 ) ( ON-TABLE ?auto_172560 ) ( ON ?auto_172561 ?auto_172560 ) ( ON ?auto_172562 ?auto_172561 ) ( not ( = ?auto_172560 ?auto_172561 ) ) ( not ( = ?auto_172560 ?auto_172562 ) ) ( not ( = ?auto_172560 ?auto_172563 ) ) ( not ( = ?auto_172560 ?auto_172564 ) ) ( not ( = ?auto_172560 ?auto_172565 ) ) ( not ( = ?auto_172560 ?auto_172566 ) ) ( not ( = ?auto_172561 ?auto_172562 ) ) ( not ( = ?auto_172561 ?auto_172563 ) ) ( not ( = ?auto_172561 ?auto_172564 ) ) ( not ( = ?auto_172561 ?auto_172565 ) ) ( not ( = ?auto_172561 ?auto_172566 ) ) ( not ( = ?auto_172562 ?auto_172563 ) ) ( not ( = ?auto_172562 ?auto_172564 ) ) ( not ( = ?auto_172562 ?auto_172565 ) ) ( not ( = ?auto_172562 ?auto_172566 ) ) ( not ( = ?auto_172563 ?auto_172564 ) ) ( not ( = ?auto_172563 ?auto_172565 ) ) ( not ( = ?auto_172563 ?auto_172566 ) ) ( not ( = ?auto_172564 ?auto_172565 ) ) ( not ( = ?auto_172564 ?auto_172566 ) ) ( not ( = ?auto_172565 ?auto_172566 ) ) ( ON ?auto_172564 ?auto_172565 ) ( CLEAR ?auto_172562 ) ( ON ?auto_172563 ?auto_172564 ) ( CLEAR ?auto_172563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172560 ?auto_172561 ?auto_172562 ?auto_172563 )
      ( MAKE-6PILE ?auto_172560 ?auto_172561 ?auto_172562 ?auto_172563 ?auto_172564 ?auto_172565 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172573 - BLOCK
      ?auto_172574 - BLOCK
      ?auto_172575 - BLOCK
      ?auto_172576 - BLOCK
      ?auto_172577 - BLOCK
      ?auto_172578 - BLOCK
    )
    :vars
    (
      ?auto_172579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172578 ?auto_172579 ) ( ON-TABLE ?auto_172573 ) ( ON ?auto_172574 ?auto_172573 ) ( ON ?auto_172575 ?auto_172574 ) ( not ( = ?auto_172573 ?auto_172574 ) ) ( not ( = ?auto_172573 ?auto_172575 ) ) ( not ( = ?auto_172573 ?auto_172576 ) ) ( not ( = ?auto_172573 ?auto_172577 ) ) ( not ( = ?auto_172573 ?auto_172578 ) ) ( not ( = ?auto_172573 ?auto_172579 ) ) ( not ( = ?auto_172574 ?auto_172575 ) ) ( not ( = ?auto_172574 ?auto_172576 ) ) ( not ( = ?auto_172574 ?auto_172577 ) ) ( not ( = ?auto_172574 ?auto_172578 ) ) ( not ( = ?auto_172574 ?auto_172579 ) ) ( not ( = ?auto_172575 ?auto_172576 ) ) ( not ( = ?auto_172575 ?auto_172577 ) ) ( not ( = ?auto_172575 ?auto_172578 ) ) ( not ( = ?auto_172575 ?auto_172579 ) ) ( not ( = ?auto_172576 ?auto_172577 ) ) ( not ( = ?auto_172576 ?auto_172578 ) ) ( not ( = ?auto_172576 ?auto_172579 ) ) ( not ( = ?auto_172577 ?auto_172578 ) ) ( not ( = ?auto_172577 ?auto_172579 ) ) ( not ( = ?auto_172578 ?auto_172579 ) ) ( ON ?auto_172577 ?auto_172578 ) ( CLEAR ?auto_172575 ) ( ON ?auto_172576 ?auto_172577 ) ( CLEAR ?auto_172576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172573 ?auto_172574 ?auto_172575 ?auto_172576 )
      ( MAKE-6PILE ?auto_172573 ?auto_172574 ?auto_172575 ?auto_172576 ?auto_172577 ?auto_172578 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172586 - BLOCK
      ?auto_172587 - BLOCK
      ?auto_172588 - BLOCK
      ?auto_172589 - BLOCK
      ?auto_172590 - BLOCK
      ?auto_172591 - BLOCK
    )
    :vars
    (
      ?auto_172592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172591 ?auto_172592 ) ( ON-TABLE ?auto_172586 ) ( ON ?auto_172587 ?auto_172586 ) ( not ( = ?auto_172586 ?auto_172587 ) ) ( not ( = ?auto_172586 ?auto_172588 ) ) ( not ( = ?auto_172586 ?auto_172589 ) ) ( not ( = ?auto_172586 ?auto_172590 ) ) ( not ( = ?auto_172586 ?auto_172591 ) ) ( not ( = ?auto_172586 ?auto_172592 ) ) ( not ( = ?auto_172587 ?auto_172588 ) ) ( not ( = ?auto_172587 ?auto_172589 ) ) ( not ( = ?auto_172587 ?auto_172590 ) ) ( not ( = ?auto_172587 ?auto_172591 ) ) ( not ( = ?auto_172587 ?auto_172592 ) ) ( not ( = ?auto_172588 ?auto_172589 ) ) ( not ( = ?auto_172588 ?auto_172590 ) ) ( not ( = ?auto_172588 ?auto_172591 ) ) ( not ( = ?auto_172588 ?auto_172592 ) ) ( not ( = ?auto_172589 ?auto_172590 ) ) ( not ( = ?auto_172589 ?auto_172591 ) ) ( not ( = ?auto_172589 ?auto_172592 ) ) ( not ( = ?auto_172590 ?auto_172591 ) ) ( not ( = ?auto_172590 ?auto_172592 ) ) ( not ( = ?auto_172591 ?auto_172592 ) ) ( ON ?auto_172590 ?auto_172591 ) ( ON ?auto_172589 ?auto_172590 ) ( CLEAR ?auto_172587 ) ( ON ?auto_172588 ?auto_172589 ) ( CLEAR ?auto_172588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172586 ?auto_172587 ?auto_172588 )
      ( MAKE-6PILE ?auto_172586 ?auto_172587 ?auto_172588 ?auto_172589 ?auto_172590 ?auto_172591 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172599 - BLOCK
      ?auto_172600 - BLOCK
      ?auto_172601 - BLOCK
      ?auto_172602 - BLOCK
      ?auto_172603 - BLOCK
      ?auto_172604 - BLOCK
    )
    :vars
    (
      ?auto_172605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172604 ?auto_172605 ) ( ON-TABLE ?auto_172599 ) ( ON ?auto_172600 ?auto_172599 ) ( not ( = ?auto_172599 ?auto_172600 ) ) ( not ( = ?auto_172599 ?auto_172601 ) ) ( not ( = ?auto_172599 ?auto_172602 ) ) ( not ( = ?auto_172599 ?auto_172603 ) ) ( not ( = ?auto_172599 ?auto_172604 ) ) ( not ( = ?auto_172599 ?auto_172605 ) ) ( not ( = ?auto_172600 ?auto_172601 ) ) ( not ( = ?auto_172600 ?auto_172602 ) ) ( not ( = ?auto_172600 ?auto_172603 ) ) ( not ( = ?auto_172600 ?auto_172604 ) ) ( not ( = ?auto_172600 ?auto_172605 ) ) ( not ( = ?auto_172601 ?auto_172602 ) ) ( not ( = ?auto_172601 ?auto_172603 ) ) ( not ( = ?auto_172601 ?auto_172604 ) ) ( not ( = ?auto_172601 ?auto_172605 ) ) ( not ( = ?auto_172602 ?auto_172603 ) ) ( not ( = ?auto_172602 ?auto_172604 ) ) ( not ( = ?auto_172602 ?auto_172605 ) ) ( not ( = ?auto_172603 ?auto_172604 ) ) ( not ( = ?auto_172603 ?auto_172605 ) ) ( not ( = ?auto_172604 ?auto_172605 ) ) ( ON ?auto_172603 ?auto_172604 ) ( ON ?auto_172602 ?auto_172603 ) ( CLEAR ?auto_172600 ) ( ON ?auto_172601 ?auto_172602 ) ( CLEAR ?auto_172601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172599 ?auto_172600 ?auto_172601 )
      ( MAKE-6PILE ?auto_172599 ?auto_172600 ?auto_172601 ?auto_172602 ?auto_172603 ?auto_172604 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172612 - BLOCK
      ?auto_172613 - BLOCK
      ?auto_172614 - BLOCK
      ?auto_172615 - BLOCK
      ?auto_172616 - BLOCK
      ?auto_172617 - BLOCK
    )
    :vars
    (
      ?auto_172618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172617 ?auto_172618 ) ( ON-TABLE ?auto_172612 ) ( not ( = ?auto_172612 ?auto_172613 ) ) ( not ( = ?auto_172612 ?auto_172614 ) ) ( not ( = ?auto_172612 ?auto_172615 ) ) ( not ( = ?auto_172612 ?auto_172616 ) ) ( not ( = ?auto_172612 ?auto_172617 ) ) ( not ( = ?auto_172612 ?auto_172618 ) ) ( not ( = ?auto_172613 ?auto_172614 ) ) ( not ( = ?auto_172613 ?auto_172615 ) ) ( not ( = ?auto_172613 ?auto_172616 ) ) ( not ( = ?auto_172613 ?auto_172617 ) ) ( not ( = ?auto_172613 ?auto_172618 ) ) ( not ( = ?auto_172614 ?auto_172615 ) ) ( not ( = ?auto_172614 ?auto_172616 ) ) ( not ( = ?auto_172614 ?auto_172617 ) ) ( not ( = ?auto_172614 ?auto_172618 ) ) ( not ( = ?auto_172615 ?auto_172616 ) ) ( not ( = ?auto_172615 ?auto_172617 ) ) ( not ( = ?auto_172615 ?auto_172618 ) ) ( not ( = ?auto_172616 ?auto_172617 ) ) ( not ( = ?auto_172616 ?auto_172618 ) ) ( not ( = ?auto_172617 ?auto_172618 ) ) ( ON ?auto_172616 ?auto_172617 ) ( ON ?auto_172615 ?auto_172616 ) ( ON ?auto_172614 ?auto_172615 ) ( CLEAR ?auto_172612 ) ( ON ?auto_172613 ?auto_172614 ) ( CLEAR ?auto_172613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172612 ?auto_172613 )
      ( MAKE-6PILE ?auto_172612 ?auto_172613 ?auto_172614 ?auto_172615 ?auto_172616 ?auto_172617 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172625 - BLOCK
      ?auto_172626 - BLOCK
      ?auto_172627 - BLOCK
      ?auto_172628 - BLOCK
      ?auto_172629 - BLOCK
      ?auto_172630 - BLOCK
    )
    :vars
    (
      ?auto_172631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172630 ?auto_172631 ) ( ON-TABLE ?auto_172625 ) ( not ( = ?auto_172625 ?auto_172626 ) ) ( not ( = ?auto_172625 ?auto_172627 ) ) ( not ( = ?auto_172625 ?auto_172628 ) ) ( not ( = ?auto_172625 ?auto_172629 ) ) ( not ( = ?auto_172625 ?auto_172630 ) ) ( not ( = ?auto_172625 ?auto_172631 ) ) ( not ( = ?auto_172626 ?auto_172627 ) ) ( not ( = ?auto_172626 ?auto_172628 ) ) ( not ( = ?auto_172626 ?auto_172629 ) ) ( not ( = ?auto_172626 ?auto_172630 ) ) ( not ( = ?auto_172626 ?auto_172631 ) ) ( not ( = ?auto_172627 ?auto_172628 ) ) ( not ( = ?auto_172627 ?auto_172629 ) ) ( not ( = ?auto_172627 ?auto_172630 ) ) ( not ( = ?auto_172627 ?auto_172631 ) ) ( not ( = ?auto_172628 ?auto_172629 ) ) ( not ( = ?auto_172628 ?auto_172630 ) ) ( not ( = ?auto_172628 ?auto_172631 ) ) ( not ( = ?auto_172629 ?auto_172630 ) ) ( not ( = ?auto_172629 ?auto_172631 ) ) ( not ( = ?auto_172630 ?auto_172631 ) ) ( ON ?auto_172629 ?auto_172630 ) ( ON ?auto_172628 ?auto_172629 ) ( ON ?auto_172627 ?auto_172628 ) ( CLEAR ?auto_172625 ) ( ON ?auto_172626 ?auto_172627 ) ( CLEAR ?auto_172626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172625 ?auto_172626 )
      ( MAKE-6PILE ?auto_172625 ?auto_172626 ?auto_172627 ?auto_172628 ?auto_172629 ?auto_172630 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172638 - BLOCK
      ?auto_172639 - BLOCK
      ?auto_172640 - BLOCK
      ?auto_172641 - BLOCK
      ?auto_172642 - BLOCK
      ?auto_172643 - BLOCK
    )
    :vars
    (
      ?auto_172644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172643 ?auto_172644 ) ( not ( = ?auto_172638 ?auto_172639 ) ) ( not ( = ?auto_172638 ?auto_172640 ) ) ( not ( = ?auto_172638 ?auto_172641 ) ) ( not ( = ?auto_172638 ?auto_172642 ) ) ( not ( = ?auto_172638 ?auto_172643 ) ) ( not ( = ?auto_172638 ?auto_172644 ) ) ( not ( = ?auto_172639 ?auto_172640 ) ) ( not ( = ?auto_172639 ?auto_172641 ) ) ( not ( = ?auto_172639 ?auto_172642 ) ) ( not ( = ?auto_172639 ?auto_172643 ) ) ( not ( = ?auto_172639 ?auto_172644 ) ) ( not ( = ?auto_172640 ?auto_172641 ) ) ( not ( = ?auto_172640 ?auto_172642 ) ) ( not ( = ?auto_172640 ?auto_172643 ) ) ( not ( = ?auto_172640 ?auto_172644 ) ) ( not ( = ?auto_172641 ?auto_172642 ) ) ( not ( = ?auto_172641 ?auto_172643 ) ) ( not ( = ?auto_172641 ?auto_172644 ) ) ( not ( = ?auto_172642 ?auto_172643 ) ) ( not ( = ?auto_172642 ?auto_172644 ) ) ( not ( = ?auto_172643 ?auto_172644 ) ) ( ON ?auto_172642 ?auto_172643 ) ( ON ?auto_172641 ?auto_172642 ) ( ON ?auto_172640 ?auto_172641 ) ( ON ?auto_172639 ?auto_172640 ) ( ON ?auto_172638 ?auto_172639 ) ( CLEAR ?auto_172638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172638 )
      ( MAKE-6PILE ?auto_172638 ?auto_172639 ?auto_172640 ?auto_172641 ?auto_172642 ?auto_172643 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172651 - BLOCK
      ?auto_172652 - BLOCK
      ?auto_172653 - BLOCK
      ?auto_172654 - BLOCK
      ?auto_172655 - BLOCK
      ?auto_172656 - BLOCK
    )
    :vars
    (
      ?auto_172657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172656 ?auto_172657 ) ( not ( = ?auto_172651 ?auto_172652 ) ) ( not ( = ?auto_172651 ?auto_172653 ) ) ( not ( = ?auto_172651 ?auto_172654 ) ) ( not ( = ?auto_172651 ?auto_172655 ) ) ( not ( = ?auto_172651 ?auto_172656 ) ) ( not ( = ?auto_172651 ?auto_172657 ) ) ( not ( = ?auto_172652 ?auto_172653 ) ) ( not ( = ?auto_172652 ?auto_172654 ) ) ( not ( = ?auto_172652 ?auto_172655 ) ) ( not ( = ?auto_172652 ?auto_172656 ) ) ( not ( = ?auto_172652 ?auto_172657 ) ) ( not ( = ?auto_172653 ?auto_172654 ) ) ( not ( = ?auto_172653 ?auto_172655 ) ) ( not ( = ?auto_172653 ?auto_172656 ) ) ( not ( = ?auto_172653 ?auto_172657 ) ) ( not ( = ?auto_172654 ?auto_172655 ) ) ( not ( = ?auto_172654 ?auto_172656 ) ) ( not ( = ?auto_172654 ?auto_172657 ) ) ( not ( = ?auto_172655 ?auto_172656 ) ) ( not ( = ?auto_172655 ?auto_172657 ) ) ( not ( = ?auto_172656 ?auto_172657 ) ) ( ON ?auto_172655 ?auto_172656 ) ( ON ?auto_172654 ?auto_172655 ) ( ON ?auto_172653 ?auto_172654 ) ( ON ?auto_172652 ?auto_172653 ) ( ON ?auto_172651 ?auto_172652 ) ( CLEAR ?auto_172651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172651 )
      ( MAKE-6PILE ?auto_172651 ?auto_172652 ?auto_172653 ?auto_172654 ?auto_172655 ?auto_172656 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172665 - BLOCK
      ?auto_172666 - BLOCK
      ?auto_172667 - BLOCK
      ?auto_172668 - BLOCK
      ?auto_172669 - BLOCK
      ?auto_172670 - BLOCK
      ?auto_172671 - BLOCK
    )
    :vars
    (
      ?auto_172672 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_172670 ) ( ON ?auto_172671 ?auto_172672 ) ( CLEAR ?auto_172671 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172665 ) ( ON ?auto_172666 ?auto_172665 ) ( ON ?auto_172667 ?auto_172666 ) ( ON ?auto_172668 ?auto_172667 ) ( ON ?auto_172669 ?auto_172668 ) ( ON ?auto_172670 ?auto_172669 ) ( not ( = ?auto_172665 ?auto_172666 ) ) ( not ( = ?auto_172665 ?auto_172667 ) ) ( not ( = ?auto_172665 ?auto_172668 ) ) ( not ( = ?auto_172665 ?auto_172669 ) ) ( not ( = ?auto_172665 ?auto_172670 ) ) ( not ( = ?auto_172665 ?auto_172671 ) ) ( not ( = ?auto_172665 ?auto_172672 ) ) ( not ( = ?auto_172666 ?auto_172667 ) ) ( not ( = ?auto_172666 ?auto_172668 ) ) ( not ( = ?auto_172666 ?auto_172669 ) ) ( not ( = ?auto_172666 ?auto_172670 ) ) ( not ( = ?auto_172666 ?auto_172671 ) ) ( not ( = ?auto_172666 ?auto_172672 ) ) ( not ( = ?auto_172667 ?auto_172668 ) ) ( not ( = ?auto_172667 ?auto_172669 ) ) ( not ( = ?auto_172667 ?auto_172670 ) ) ( not ( = ?auto_172667 ?auto_172671 ) ) ( not ( = ?auto_172667 ?auto_172672 ) ) ( not ( = ?auto_172668 ?auto_172669 ) ) ( not ( = ?auto_172668 ?auto_172670 ) ) ( not ( = ?auto_172668 ?auto_172671 ) ) ( not ( = ?auto_172668 ?auto_172672 ) ) ( not ( = ?auto_172669 ?auto_172670 ) ) ( not ( = ?auto_172669 ?auto_172671 ) ) ( not ( = ?auto_172669 ?auto_172672 ) ) ( not ( = ?auto_172670 ?auto_172671 ) ) ( not ( = ?auto_172670 ?auto_172672 ) ) ( not ( = ?auto_172671 ?auto_172672 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172671 ?auto_172672 )
      ( !STACK ?auto_172671 ?auto_172670 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172680 - BLOCK
      ?auto_172681 - BLOCK
      ?auto_172682 - BLOCK
      ?auto_172683 - BLOCK
      ?auto_172684 - BLOCK
      ?auto_172685 - BLOCK
      ?auto_172686 - BLOCK
    )
    :vars
    (
      ?auto_172687 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_172685 ) ( ON ?auto_172686 ?auto_172687 ) ( CLEAR ?auto_172686 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172680 ) ( ON ?auto_172681 ?auto_172680 ) ( ON ?auto_172682 ?auto_172681 ) ( ON ?auto_172683 ?auto_172682 ) ( ON ?auto_172684 ?auto_172683 ) ( ON ?auto_172685 ?auto_172684 ) ( not ( = ?auto_172680 ?auto_172681 ) ) ( not ( = ?auto_172680 ?auto_172682 ) ) ( not ( = ?auto_172680 ?auto_172683 ) ) ( not ( = ?auto_172680 ?auto_172684 ) ) ( not ( = ?auto_172680 ?auto_172685 ) ) ( not ( = ?auto_172680 ?auto_172686 ) ) ( not ( = ?auto_172680 ?auto_172687 ) ) ( not ( = ?auto_172681 ?auto_172682 ) ) ( not ( = ?auto_172681 ?auto_172683 ) ) ( not ( = ?auto_172681 ?auto_172684 ) ) ( not ( = ?auto_172681 ?auto_172685 ) ) ( not ( = ?auto_172681 ?auto_172686 ) ) ( not ( = ?auto_172681 ?auto_172687 ) ) ( not ( = ?auto_172682 ?auto_172683 ) ) ( not ( = ?auto_172682 ?auto_172684 ) ) ( not ( = ?auto_172682 ?auto_172685 ) ) ( not ( = ?auto_172682 ?auto_172686 ) ) ( not ( = ?auto_172682 ?auto_172687 ) ) ( not ( = ?auto_172683 ?auto_172684 ) ) ( not ( = ?auto_172683 ?auto_172685 ) ) ( not ( = ?auto_172683 ?auto_172686 ) ) ( not ( = ?auto_172683 ?auto_172687 ) ) ( not ( = ?auto_172684 ?auto_172685 ) ) ( not ( = ?auto_172684 ?auto_172686 ) ) ( not ( = ?auto_172684 ?auto_172687 ) ) ( not ( = ?auto_172685 ?auto_172686 ) ) ( not ( = ?auto_172685 ?auto_172687 ) ) ( not ( = ?auto_172686 ?auto_172687 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172686 ?auto_172687 )
      ( !STACK ?auto_172686 ?auto_172685 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172695 - BLOCK
      ?auto_172696 - BLOCK
      ?auto_172697 - BLOCK
      ?auto_172698 - BLOCK
      ?auto_172699 - BLOCK
      ?auto_172700 - BLOCK
      ?auto_172701 - BLOCK
    )
    :vars
    (
      ?auto_172702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172701 ?auto_172702 ) ( ON-TABLE ?auto_172695 ) ( ON ?auto_172696 ?auto_172695 ) ( ON ?auto_172697 ?auto_172696 ) ( ON ?auto_172698 ?auto_172697 ) ( ON ?auto_172699 ?auto_172698 ) ( not ( = ?auto_172695 ?auto_172696 ) ) ( not ( = ?auto_172695 ?auto_172697 ) ) ( not ( = ?auto_172695 ?auto_172698 ) ) ( not ( = ?auto_172695 ?auto_172699 ) ) ( not ( = ?auto_172695 ?auto_172700 ) ) ( not ( = ?auto_172695 ?auto_172701 ) ) ( not ( = ?auto_172695 ?auto_172702 ) ) ( not ( = ?auto_172696 ?auto_172697 ) ) ( not ( = ?auto_172696 ?auto_172698 ) ) ( not ( = ?auto_172696 ?auto_172699 ) ) ( not ( = ?auto_172696 ?auto_172700 ) ) ( not ( = ?auto_172696 ?auto_172701 ) ) ( not ( = ?auto_172696 ?auto_172702 ) ) ( not ( = ?auto_172697 ?auto_172698 ) ) ( not ( = ?auto_172697 ?auto_172699 ) ) ( not ( = ?auto_172697 ?auto_172700 ) ) ( not ( = ?auto_172697 ?auto_172701 ) ) ( not ( = ?auto_172697 ?auto_172702 ) ) ( not ( = ?auto_172698 ?auto_172699 ) ) ( not ( = ?auto_172698 ?auto_172700 ) ) ( not ( = ?auto_172698 ?auto_172701 ) ) ( not ( = ?auto_172698 ?auto_172702 ) ) ( not ( = ?auto_172699 ?auto_172700 ) ) ( not ( = ?auto_172699 ?auto_172701 ) ) ( not ( = ?auto_172699 ?auto_172702 ) ) ( not ( = ?auto_172700 ?auto_172701 ) ) ( not ( = ?auto_172700 ?auto_172702 ) ) ( not ( = ?auto_172701 ?auto_172702 ) ) ( CLEAR ?auto_172699 ) ( ON ?auto_172700 ?auto_172701 ) ( CLEAR ?auto_172700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172695 ?auto_172696 ?auto_172697 ?auto_172698 ?auto_172699 ?auto_172700 )
      ( MAKE-7PILE ?auto_172695 ?auto_172696 ?auto_172697 ?auto_172698 ?auto_172699 ?auto_172700 ?auto_172701 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172710 - BLOCK
      ?auto_172711 - BLOCK
      ?auto_172712 - BLOCK
      ?auto_172713 - BLOCK
      ?auto_172714 - BLOCK
      ?auto_172715 - BLOCK
      ?auto_172716 - BLOCK
    )
    :vars
    (
      ?auto_172717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172716 ?auto_172717 ) ( ON-TABLE ?auto_172710 ) ( ON ?auto_172711 ?auto_172710 ) ( ON ?auto_172712 ?auto_172711 ) ( ON ?auto_172713 ?auto_172712 ) ( ON ?auto_172714 ?auto_172713 ) ( not ( = ?auto_172710 ?auto_172711 ) ) ( not ( = ?auto_172710 ?auto_172712 ) ) ( not ( = ?auto_172710 ?auto_172713 ) ) ( not ( = ?auto_172710 ?auto_172714 ) ) ( not ( = ?auto_172710 ?auto_172715 ) ) ( not ( = ?auto_172710 ?auto_172716 ) ) ( not ( = ?auto_172710 ?auto_172717 ) ) ( not ( = ?auto_172711 ?auto_172712 ) ) ( not ( = ?auto_172711 ?auto_172713 ) ) ( not ( = ?auto_172711 ?auto_172714 ) ) ( not ( = ?auto_172711 ?auto_172715 ) ) ( not ( = ?auto_172711 ?auto_172716 ) ) ( not ( = ?auto_172711 ?auto_172717 ) ) ( not ( = ?auto_172712 ?auto_172713 ) ) ( not ( = ?auto_172712 ?auto_172714 ) ) ( not ( = ?auto_172712 ?auto_172715 ) ) ( not ( = ?auto_172712 ?auto_172716 ) ) ( not ( = ?auto_172712 ?auto_172717 ) ) ( not ( = ?auto_172713 ?auto_172714 ) ) ( not ( = ?auto_172713 ?auto_172715 ) ) ( not ( = ?auto_172713 ?auto_172716 ) ) ( not ( = ?auto_172713 ?auto_172717 ) ) ( not ( = ?auto_172714 ?auto_172715 ) ) ( not ( = ?auto_172714 ?auto_172716 ) ) ( not ( = ?auto_172714 ?auto_172717 ) ) ( not ( = ?auto_172715 ?auto_172716 ) ) ( not ( = ?auto_172715 ?auto_172717 ) ) ( not ( = ?auto_172716 ?auto_172717 ) ) ( CLEAR ?auto_172714 ) ( ON ?auto_172715 ?auto_172716 ) ( CLEAR ?auto_172715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172710 ?auto_172711 ?auto_172712 ?auto_172713 ?auto_172714 ?auto_172715 )
      ( MAKE-7PILE ?auto_172710 ?auto_172711 ?auto_172712 ?auto_172713 ?auto_172714 ?auto_172715 ?auto_172716 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172725 - BLOCK
      ?auto_172726 - BLOCK
      ?auto_172727 - BLOCK
      ?auto_172728 - BLOCK
      ?auto_172729 - BLOCK
      ?auto_172730 - BLOCK
      ?auto_172731 - BLOCK
    )
    :vars
    (
      ?auto_172732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172731 ?auto_172732 ) ( ON-TABLE ?auto_172725 ) ( ON ?auto_172726 ?auto_172725 ) ( ON ?auto_172727 ?auto_172726 ) ( ON ?auto_172728 ?auto_172727 ) ( not ( = ?auto_172725 ?auto_172726 ) ) ( not ( = ?auto_172725 ?auto_172727 ) ) ( not ( = ?auto_172725 ?auto_172728 ) ) ( not ( = ?auto_172725 ?auto_172729 ) ) ( not ( = ?auto_172725 ?auto_172730 ) ) ( not ( = ?auto_172725 ?auto_172731 ) ) ( not ( = ?auto_172725 ?auto_172732 ) ) ( not ( = ?auto_172726 ?auto_172727 ) ) ( not ( = ?auto_172726 ?auto_172728 ) ) ( not ( = ?auto_172726 ?auto_172729 ) ) ( not ( = ?auto_172726 ?auto_172730 ) ) ( not ( = ?auto_172726 ?auto_172731 ) ) ( not ( = ?auto_172726 ?auto_172732 ) ) ( not ( = ?auto_172727 ?auto_172728 ) ) ( not ( = ?auto_172727 ?auto_172729 ) ) ( not ( = ?auto_172727 ?auto_172730 ) ) ( not ( = ?auto_172727 ?auto_172731 ) ) ( not ( = ?auto_172727 ?auto_172732 ) ) ( not ( = ?auto_172728 ?auto_172729 ) ) ( not ( = ?auto_172728 ?auto_172730 ) ) ( not ( = ?auto_172728 ?auto_172731 ) ) ( not ( = ?auto_172728 ?auto_172732 ) ) ( not ( = ?auto_172729 ?auto_172730 ) ) ( not ( = ?auto_172729 ?auto_172731 ) ) ( not ( = ?auto_172729 ?auto_172732 ) ) ( not ( = ?auto_172730 ?auto_172731 ) ) ( not ( = ?auto_172730 ?auto_172732 ) ) ( not ( = ?auto_172731 ?auto_172732 ) ) ( ON ?auto_172730 ?auto_172731 ) ( CLEAR ?auto_172728 ) ( ON ?auto_172729 ?auto_172730 ) ( CLEAR ?auto_172729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172725 ?auto_172726 ?auto_172727 ?auto_172728 ?auto_172729 )
      ( MAKE-7PILE ?auto_172725 ?auto_172726 ?auto_172727 ?auto_172728 ?auto_172729 ?auto_172730 ?auto_172731 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172740 - BLOCK
      ?auto_172741 - BLOCK
      ?auto_172742 - BLOCK
      ?auto_172743 - BLOCK
      ?auto_172744 - BLOCK
      ?auto_172745 - BLOCK
      ?auto_172746 - BLOCK
    )
    :vars
    (
      ?auto_172747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172746 ?auto_172747 ) ( ON-TABLE ?auto_172740 ) ( ON ?auto_172741 ?auto_172740 ) ( ON ?auto_172742 ?auto_172741 ) ( ON ?auto_172743 ?auto_172742 ) ( not ( = ?auto_172740 ?auto_172741 ) ) ( not ( = ?auto_172740 ?auto_172742 ) ) ( not ( = ?auto_172740 ?auto_172743 ) ) ( not ( = ?auto_172740 ?auto_172744 ) ) ( not ( = ?auto_172740 ?auto_172745 ) ) ( not ( = ?auto_172740 ?auto_172746 ) ) ( not ( = ?auto_172740 ?auto_172747 ) ) ( not ( = ?auto_172741 ?auto_172742 ) ) ( not ( = ?auto_172741 ?auto_172743 ) ) ( not ( = ?auto_172741 ?auto_172744 ) ) ( not ( = ?auto_172741 ?auto_172745 ) ) ( not ( = ?auto_172741 ?auto_172746 ) ) ( not ( = ?auto_172741 ?auto_172747 ) ) ( not ( = ?auto_172742 ?auto_172743 ) ) ( not ( = ?auto_172742 ?auto_172744 ) ) ( not ( = ?auto_172742 ?auto_172745 ) ) ( not ( = ?auto_172742 ?auto_172746 ) ) ( not ( = ?auto_172742 ?auto_172747 ) ) ( not ( = ?auto_172743 ?auto_172744 ) ) ( not ( = ?auto_172743 ?auto_172745 ) ) ( not ( = ?auto_172743 ?auto_172746 ) ) ( not ( = ?auto_172743 ?auto_172747 ) ) ( not ( = ?auto_172744 ?auto_172745 ) ) ( not ( = ?auto_172744 ?auto_172746 ) ) ( not ( = ?auto_172744 ?auto_172747 ) ) ( not ( = ?auto_172745 ?auto_172746 ) ) ( not ( = ?auto_172745 ?auto_172747 ) ) ( not ( = ?auto_172746 ?auto_172747 ) ) ( ON ?auto_172745 ?auto_172746 ) ( CLEAR ?auto_172743 ) ( ON ?auto_172744 ?auto_172745 ) ( CLEAR ?auto_172744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172740 ?auto_172741 ?auto_172742 ?auto_172743 ?auto_172744 )
      ( MAKE-7PILE ?auto_172740 ?auto_172741 ?auto_172742 ?auto_172743 ?auto_172744 ?auto_172745 ?auto_172746 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172755 - BLOCK
      ?auto_172756 - BLOCK
      ?auto_172757 - BLOCK
      ?auto_172758 - BLOCK
      ?auto_172759 - BLOCK
      ?auto_172760 - BLOCK
      ?auto_172761 - BLOCK
    )
    :vars
    (
      ?auto_172762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172761 ?auto_172762 ) ( ON-TABLE ?auto_172755 ) ( ON ?auto_172756 ?auto_172755 ) ( ON ?auto_172757 ?auto_172756 ) ( not ( = ?auto_172755 ?auto_172756 ) ) ( not ( = ?auto_172755 ?auto_172757 ) ) ( not ( = ?auto_172755 ?auto_172758 ) ) ( not ( = ?auto_172755 ?auto_172759 ) ) ( not ( = ?auto_172755 ?auto_172760 ) ) ( not ( = ?auto_172755 ?auto_172761 ) ) ( not ( = ?auto_172755 ?auto_172762 ) ) ( not ( = ?auto_172756 ?auto_172757 ) ) ( not ( = ?auto_172756 ?auto_172758 ) ) ( not ( = ?auto_172756 ?auto_172759 ) ) ( not ( = ?auto_172756 ?auto_172760 ) ) ( not ( = ?auto_172756 ?auto_172761 ) ) ( not ( = ?auto_172756 ?auto_172762 ) ) ( not ( = ?auto_172757 ?auto_172758 ) ) ( not ( = ?auto_172757 ?auto_172759 ) ) ( not ( = ?auto_172757 ?auto_172760 ) ) ( not ( = ?auto_172757 ?auto_172761 ) ) ( not ( = ?auto_172757 ?auto_172762 ) ) ( not ( = ?auto_172758 ?auto_172759 ) ) ( not ( = ?auto_172758 ?auto_172760 ) ) ( not ( = ?auto_172758 ?auto_172761 ) ) ( not ( = ?auto_172758 ?auto_172762 ) ) ( not ( = ?auto_172759 ?auto_172760 ) ) ( not ( = ?auto_172759 ?auto_172761 ) ) ( not ( = ?auto_172759 ?auto_172762 ) ) ( not ( = ?auto_172760 ?auto_172761 ) ) ( not ( = ?auto_172760 ?auto_172762 ) ) ( not ( = ?auto_172761 ?auto_172762 ) ) ( ON ?auto_172760 ?auto_172761 ) ( ON ?auto_172759 ?auto_172760 ) ( CLEAR ?auto_172757 ) ( ON ?auto_172758 ?auto_172759 ) ( CLEAR ?auto_172758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172755 ?auto_172756 ?auto_172757 ?auto_172758 )
      ( MAKE-7PILE ?auto_172755 ?auto_172756 ?auto_172757 ?auto_172758 ?auto_172759 ?auto_172760 ?auto_172761 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172770 - BLOCK
      ?auto_172771 - BLOCK
      ?auto_172772 - BLOCK
      ?auto_172773 - BLOCK
      ?auto_172774 - BLOCK
      ?auto_172775 - BLOCK
      ?auto_172776 - BLOCK
    )
    :vars
    (
      ?auto_172777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172776 ?auto_172777 ) ( ON-TABLE ?auto_172770 ) ( ON ?auto_172771 ?auto_172770 ) ( ON ?auto_172772 ?auto_172771 ) ( not ( = ?auto_172770 ?auto_172771 ) ) ( not ( = ?auto_172770 ?auto_172772 ) ) ( not ( = ?auto_172770 ?auto_172773 ) ) ( not ( = ?auto_172770 ?auto_172774 ) ) ( not ( = ?auto_172770 ?auto_172775 ) ) ( not ( = ?auto_172770 ?auto_172776 ) ) ( not ( = ?auto_172770 ?auto_172777 ) ) ( not ( = ?auto_172771 ?auto_172772 ) ) ( not ( = ?auto_172771 ?auto_172773 ) ) ( not ( = ?auto_172771 ?auto_172774 ) ) ( not ( = ?auto_172771 ?auto_172775 ) ) ( not ( = ?auto_172771 ?auto_172776 ) ) ( not ( = ?auto_172771 ?auto_172777 ) ) ( not ( = ?auto_172772 ?auto_172773 ) ) ( not ( = ?auto_172772 ?auto_172774 ) ) ( not ( = ?auto_172772 ?auto_172775 ) ) ( not ( = ?auto_172772 ?auto_172776 ) ) ( not ( = ?auto_172772 ?auto_172777 ) ) ( not ( = ?auto_172773 ?auto_172774 ) ) ( not ( = ?auto_172773 ?auto_172775 ) ) ( not ( = ?auto_172773 ?auto_172776 ) ) ( not ( = ?auto_172773 ?auto_172777 ) ) ( not ( = ?auto_172774 ?auto_172775 ) ) ( not ( = ?auto_172774 ?auto_172776 ) ) ( not ( = ?auto_172774 ?auto_172777 ) ) ( not ( = ?auto_172775 ?auto_172776 ) ) ( not ( = ?auto_172775 ?auto_172777 ) ) ( not ( = ?auto_172776 ?auto_172777 ) ) ( ON ?auto_172775 ?auto_172776 ) ( ON ?auto_172774 ?auto_172775 ) ( CLEAR ?auto_172772 ) ( ON ?auto_172773 ?auto_172774 ) ( CLEAR ?auto_172773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172770 ?auto_172771 ?auto_172772 ?auto_172773 )
      ( MAKE-7PILE ?auto_172770 ?auto_172771 ?auto_172772 ?auto_172773 ?auto_172774 ?auto_172775 ?auto_172776 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172785 - BLOCK
      ?auto_172786 - BLOCK
      ?auto_172787 - BLOCK
      ?auto_172788 - BLOCK
      ?auto_172789 - BLOCK
      ?auto_172790 - BLOCK
      ?auto_172791 - BLOCK
    )
    :vars
    (
      ?auto_172792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172791 ?auto_172792 ) ( ON-TABLE ?auto_172785 ) ( ON ?auto_172786 ?auto_172785 ) ( not ( = ?auto_172785 ?auto_172786 ) ) ( not ( = ?auto_172785 ?auto_172787 ) ) ( not ( = ?auto_172785 ?auto_172788 ) ) ( not ( = ?auto_172785 ?auto_172789 ) ) ( not ( = ?auto_172785 ?auto_172790 ) ) ( not ( = ?auto_172785 ?auto_172791 ) ) ( not ( = ?auto_172785 ?auto_172792 ) ) ( not ( = ?auto_172786 ?auto_172787 ) ) ( not ( = ?auto_172786 ?auto_172788 ) ) ( not ( = ?auto_172786 ?auto_172789 ) ) ( not ( = ?auto_172786 ?auto_172790 ) ) ( not ( = ?auto_172786 ?auto_172791 ) ) ( not ( = ?auto_172786 ?auto_172792 ) ) ( not ( = ?auto_172787 ?auto_172788 ) ) ( not ( = ?auto_172787 ?auto_172789 ) ) ( not ( = ?auto_172787 ?auto_172790 ) ) ( not ( = ?auto_172787 ?auto_172791 ) ) ( not ( = ?auto_172787 ?auto_172792 ) ) ( not ( = ?auto_172788 ?auto_172789 ) ) ( not ( = ?auto_172788 ?auto_172790 ) ) ( not ( = ?auto_172788 ?auto_172791 ) ) ( not ( = ?auto_172788 ?auto_172792 ) ) ( not ( = ?auto_172789 ?auto_172790 ) ) ( not ( = ?auto_172789 ?auto_172791 ) ) ( not ( = ?auto_172789 ?auto_172792 ) ) ( not ( = ?auto_172790 ?auto_172791 ) ) ( not ( = ?auto_172790 ?auto_172792 ) ) ( not ( = ?auto_172791 ?auto_172792 ) ) ( ON ?auto_172790 ?auto_172791 ) ( ON ?auto_172789 ?auto_172790 ) ( ON ?auto_172788 ?auto_172789 ) ( CLEAR ?auto_172786 ) ( ON ?auto_172787 ?auto_172788 ) ( CLEAR ?auto_172787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172785 ?auto_172786 ?auto_172787 )
      ( MAKE-7PILE ?auto_172785 ?auto_172786 ?auto_172787 ?auto_172788 ?auto_172789 ?auto_172790 ?auto_172791 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172800 - BLOCK
      ?auto_172801 - BLOCK
      ?auto_172802 - BLOCK
      ?auto_172803 - BLOCK
      ?auto_172804 - BLOCK
      ?auto_172805 - BLOCK
      ?auto_172806 - BLOCK
    )
    :vars
    (
      ?auto_172807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172806 ?auto_172807 ) ( ON-TABLE ?auto_172800 ) ( ON ?auto_172801 ?auto_172800 ) ( not ( = ?auto_172800 ?auto_172801 ) ) ( not ( = ?auto_172800 ?auto_172802 ) ) ( not ( = ?auto_172800 ?auto_172803 ) ) ( not ( = ?auto_172800 ?auto_172804 ) ) ( not ( = ?auto_172800 ?auto_172805 ) ) ( not ( = ?auto_172800 ?auto_172806 ) ) ( not ( = ?auto_172800 ?auto_172807 ) ) ( not ( = ?auto_172801 ?auto_172802 ) ) ( not ( = ?auto_172801 ?auto_172803 ) ) ( not ( = ?auto_172801 ?auto_172804 ) ) ( not ( = ?auto_172801 ?auto_172805 ) ) ( not ( = ?auto_172801 ?auto_172806 ) ) ( not ( = ?auto_172801 ?auto_172807 ) ) ( not ( = ?auto_172802 ?auto_172803 ) ) ( not ( = ?auto_172802 ?auto_172804 ) ) ( not ( = ?auto_172802 ?auto_172805 ) ) ( not ( = ?auto_172802 ?auto_172806 ) ) ( not ( = ?auto_172802 ?auto_172807 ) ) ( not ( = ?auto_172803 ?auto_172804 ) ) ( not ( = ?auto_172803 ?auto_172805 ) ) ( not ( = ?auto_172803 ?auto_172806 ) ) ( not ( = ?auto_172803 ?auto_172807 ) ) ( not ( = ?auto_172804 ?auto_172805 ) ) ( not ( = ?auto_172804 ?auto_172806 ) ) ( not ( = ?auto_172804 ?auto_172807 ) ) ( not ( = ?auto_172805 ?auto_172806 ) ) ( not ( = ?auto_172805 ?auto_172807 ) ) ( not ( = ?auto_172806 ?auto_172807 ) ) ( ON ?auto_172805 ?auto_172806 ) ( ON ?auto_172804 ?auto_172805 ) ( ON ?auto_172803 ?auto_172804 ) ( CLEAR ?auto_172801 ) ( ON ?auto_172802 ?auto_172803 ) ( CLEAR ?auto_172802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172800 ?auto_172801 ?auto_172802 )
      ( MAKE-7PILE ?auto_172800 ?auto_172801 ?auto_172802 ?auto_172803 ?auto_172804 ?auto_172805 ?auto_172806 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172815 - BLOCK
      ?auto_172816 - BLOCK
      ?auto_172817 - BLOCK
      ?auto_172818 - BLOCK
      ?auto_172819 - BLOCK
      ?auto_172820 - BLOCK
      ?auto_172821 - BLOCK
    )
    :vars
    (
      ?auto_172822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172821 ?auto_172822 ) ( ON-TABLE ?auto_172815 ) ( not ( = ?auto_172815 ?auto_172816 ) ) ( not ( = ?auto_172815 ?auto_172817 ) ) ( not ( = ?auto_172815 ?auto_172818 ) ) ( not ( = ?auto_172815 ?auto_172819 ) ) ( not ( = ?auto_172815 ?auto_172820 ) ) ( not ( = ?auto_172815 ?auto_172821 ) ) ( not ( = ?auto_172815 ?auto_172822 ) ) ( not ( = ?auto_172816 ?auto_172817 ) ) ( not ( = ?auto_172816 ?auto_172818 ) ) ( not ( = ?auto_172816 ?auto_172819 ) ) ( not ( = ?auto_172816 ?auto_172820 ) ) ( not ( = ?auto_172816 ?auto_172821 ) ) ( not ( = ?auto_172816 ?auto_172822 ) ) ( not ( = ?auto_172817 ?auto_172818 ) ) ( not ( = ?auto_172817 ?auto_172819 ) ) ( not ( = ?auto_172817 ?auto_172820 ) ) ( not ( = ?auto_172817 ?auto_172821 ) ) ( not ( = ?auto_172817 ?auto_172822 ) ) ( not ( = ?auto_172818 ?auto_172819 ) ) ( not ( = ?auto_172818 ?auto_172820 ) ) ( not ( = ?auto_172818 ?auto_172821 ) ) ( not ( = ?auto_172818 ?auto_172822 ) ) ( not ( = ?auto_172819 ?auto_172820 ) ) ( not ( = ?auto_172819 ?auto_172821 ) ) ( not ( = ?auto_172819 ?auto_172822 ) ) ( not ( = ?auto_172820 ?auto_172821 ) ) ( not ( = ?auto_172820 ?auto_172822 ) ) ( not ( = ?auto_172821 ?auto_172822 ) ) ( ON ?auto_172820 ?auto_172821 ) ( ON ?auto_172819 ?auto_172820 ) ( ON ?auto_172818 ?auto_172819 ) ( ON ?auto_172817 ?auto_172818 ) ( CLEAR ?auto_172815 ) ( ON ?auto_172816 ?auto_172817 ) ( CLEAR ?auto_172816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172815 ?auto_172816 )
      ( MAKE-7PILE ?auto_172815 ?auto_172816 ?auto_172817 ?auto_172818 ?auto_172819 ?auto_172820 ?auto_172821 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172830 - BLOCK
      ?auto_172831 - BLOCK
      ?auto_172832 - BLOCK
      ?auto_172833 - BLOCK
      ?auto_172834 - BLOCK
      ?auto_172835 - BLOCK
      ?auto_172836 - BLOCK
    )
    :vars
    (
      ?auto_172837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172836 ?auto_172837 ) ( ON-TABLE ?auto_172830 ) ( not ( = ?auto_172830 ?auto_172831 ) ) ( not ( = ?auto_172830 ?auto_172832 ) ) ( not ( = ?auto_172830 ?auto_172833 ) ) ( not ( = ?auto_172830 ?auto_172834 ) ) ( not ( = ?auto_172830 ?auto_172835 ) ) ( not ( = ?auto_172830 ?auto_172836 ) ) ( not ( = ?auto_172830 ?auto_172837 ) ) ( not ( = ?auto_172831 ?auto_172832 ) ) ( not ( = ?auto_172831 ?auto_172833 ) ) ( not ( = ?auto_172831 ?auto_172834 ) ) ( not ( = ?auto_172831 ?auto_172835 ) ) ( not ( = ?auto_172831 ?auto_172836 ) ) ( not ( = ?auto_172831 ?auto_172837 ) ) ( not ( = ?auto_172832 ?auto_172833 ) ) ( not ( = ?auto_172832 ?auto_172834 ) ) ( not ( = ?auto_172832 ?auto_172835 ) ) ( not ( = ?auto_172832 ?auto_172836 ) ) ( not ( = ?auto_172832 ?auto_172837 ) ) ( not ( = ?auto_172833 ?auto_172834 ) ) ( not ( = ?auto_172833 ?auto_172835 ) ) ( not ( = ?auto_172833 ?auto_172836 ) ) ( not ( = ?auto_172833 ?auto_172837 ) ) ( not ( = ?auto_172834 ?auto_172835 ) ) ( not ( = ?auto_172834 ?auto_172836 ) ) ( not ( = ?auto_172834 ?auto_172837 ) ) ( not ( = ?auto_172835 ?auto_172836 ) ) ( not ( = ?auto_172835 ?auto_172837 ) ) ( not ( = ?auto_172836 ?auto_172837 ) ) ( ON ?auto_172835 ?auto_172836 ) ( ON ?auto_172834 ?auto_172835 ) ( ON ?auto_172833 ?auto_172834 ) ( ON ?auto_172832 ?auto_172833 ) ( CLEAR ?auto_172830 ) ( ON ?auto_172831 ?auto_172832 ) ( CLEAR ?auto_172831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172830 ?auto_172831 )
      ( MAKE-7PILE ?auto_172830 ?auto_172831 ?auto_172832 ?auto_172833 ?auto_172834 ?auto_172835 ?auto_172836 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172845 - BLOCK
      ?auto_172846 - BLOCK
      ?auto_172847 - BLOCK
      ?auto_172848 - BLOCK
      ?auto_172849 - BLOCK
      ?auto_172850 - BLOCK
      ?auto_172851 - BLOCK
    )
    :vars
    (
      ?auto_172852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172851 ?auto_172852 ) ( not ( = ?auto_172845 ?auto_172846 ) ) ( not ( = ?auto_172845 ?auto_172847 ) ) ( not ( = ?auto_172845 ?auto_172848 ) ) ( not ( = ?auto_172845 ?auto_172849 ) ) ( not ( = ?auto_172845 ?auto_172850 ) ) ( not ( = ?auto_172845 ?auto_172851 ) ) ( not ( = ?auto_172845 ?auto_172852 ) ) ( not ( = ?auto_172846 ?auto_172847 ) ) ( not ( = ?auto_172846 ?auto_172848 ) ) ( not ( = ?auto_172846 ?auto_172849 ) ) ( not ( = ?auto_172846 ?auto_172850 ) ) ( not ( = ?auto_172846 ?auto_172851 ) ) ( not ( = ?auto_172846 ?auto_172852 ) ) ( not ( = ?auto_172847 ?auto_172848 ) ) ( not ( = ?auto_172847 ?auto_172849 ) ) ( not ( = ?auto_172847 ?auto_172850 ) ) ( not ( = ?auto_172847 ?auto_172851 ) ) ( not ( = ?auto_172847 ?auto_172852 ) ) ( not ( = ?auto_172848 ?auto_172849 ) ) ( not ( = ?auto_172848 ?auto_172850 ) ) ( not ( = ?auto_172848 ?auto_172851 ) ) ( not ( = ?auto_172848 ?auto_172852 ) ) ( not ( = ?auto_172849 ?auto_172850 ) ) ( not ( = ?auto_172849 ?auto_172851 ) ) ( not ( = ?auto_172849 ?auto_172852 ) ) ( not ( = ?auto_172850 ?auto_172851 ) ) ( not ( = ?auto_172850 ?auto_172852 ) ) ( not ( = ?auto_172851 ?auto_172852 ) ) ( ON ?auto_172850 ?auto_172851 ) ( ON ?auto_172849 ?auto_172850 ) ( ON ?auto_172848 ?auto_172849 ) ( ON ?auto_172847 ?auto_172848 ) ( ON ?auto_172846 ?auto_172847 ) ( ON ?auto_172845 ?auto_172846 ) ( CLEAR ?auto_172845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172845 )
      ( MAKE-7PILE ?auto_172845 ?auto_172846 ?auto_172847 ?auto_172848 ?auto_172849 ?auto_172850 ?auto_172851 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172860 - BLOCK
      ?auto_172861 - BLOCK
      ?auto_172862 - BLOCK
      ?auto_172863 - BLOCK
      ?auto_172864 - BLOCK
      ?auto_172865 - BLOCK
      ?auto_172866 - BLOCK
    )
    :vars
    (
      ?auto_172867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172866 ?auto_172867 ) ( not ( = ?auto_172860 ?auto_172861 ) ) ( not ( = ?auto_172860 ?auto_172862 ) ) ( not ( = ?auto_172860 ?auto_172863 ) ) ( not ( = ?auto_172860 ?auto_172864 ) ) ( not ( = ?auto_172860 ?auto_172865 ) ) ( not ( = ?auto_172860 ?auto_172866 ) ) ( not ( = ?auto_172860 ?auto_172867 ) ) ( not ( = ?auto_172861 ?auto_172862 ) ) ( not ( = ?auto_172861 ?auto_172863 ) ) ( not ( = ?auto_172861 ?auto_172864 ) ) ( not ( = ?auto_172861 ?auto_172865 ) ) ( not ( = ?auto_172861 ?auto_172866 ) ) ( not ( = ?auto_172861 ?auto_172867 ) ) ( not ( = ?auto_172862 ?auto_172863 ) ) ( not ( = ?auto_172862 ?auto_172864 ) ) ( not ( = ?auto_172862 ?auto_172865 ) ) ( not ( = ?auto_172862 ?auto_172866 ) ) ( not ( = ?auto_172862 ?auto_172867 ) ) ( not ( = ?auto_172863 ?auto_172864 ) ) ( not ( = ?auto_172863 ?auto_172865 ) ) ( not ( = ?auto_172863 ?auto_172866 ) ) ( not ( = ?auto_172863 ?auto_172867 ) ) ( not ( = ?auto_172864 ?auto_172865 ) ) ( not ( = ?auto_172864 ?auto_172866 ) ) ( not ( = ?auto_172864 ?auto_172867 ) ) ( not ( = ?auto_172865 ?auto_172866 ) ) ( not ( = ?auto_172865 ?auto_172867 ) ) ( not ( = ?auto_172866 ?auto_172867 ) ) ( ON ?auto_172865 ?auto_172866 ) ( ON ?auto_172864 ?auto_172865 ) ( ON ?auto_172863 ?auto_172864 ) ( ON ?auto_172862 ?auto_172863 ) ( ON ?auto_172861 ?auto_172862 ) ( ON ?auto_172860 ?auto_172861 ) ( CLEAR ?auto_172860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172860 )
      ( MAKE-7PILE ?auto_172860 ?auto_172861 ?auto_172862 ?auto_172863 ?auto_172864 ?auto_172865 ?auto_172866 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_172876 - BLOCK
      ?auto_172877 - BLOCK
      ?auto_172878 - BLOCK
      ?auto_172879 - BLOCK
      ?auto_172880 - BLOCK
      ?auto_172881 - BLOCK
      ?auto_172882 - BLOCK
      ?auto_172883 - BLOCK
    )
    :vars
    (
      ?auto_172884 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_172882 ) ( ON ?auto_172883 ?auto_172884 ) ( CLEAR ?auto_172883 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172876 ) ( ON ?auto_172877 ?auto_172876 ) ( ON ?auto_172878 ?auto_172877 ) ( ON ?auto_172879 ?auto_172878 ) ( ON ?auto_172880 ?auto_172879 ) ( ON ?auto_172881 ?auto_172880 ) ( ON ?auto_172882 ?auto_172881 ) ( not ( = ?auto_172876 ?auto_172877 ) ) ( not ( = ?auto_172876 ?auto_172878 ) ) ( not ( = ?auto_172876 ?auto_172879 ) ) ( not ( = ?auto_172876 ?auto_172880 ) ) ( not ( = ?auto_172876 ?auto_172881 ) ) ( not ( = ?auto_172876 ?auto_172882 ) ) ( not ( = ?auto_172876 ?auto_172883 ) ) ( not ( = ?auto_172876 ?auto_172884 ) ) ( not ( = ?auto_172877 ?auto_172878 ) ) ( not ( = ?auto_172877 ?auto_172879 ) ) ( not ( = ?auto_172877 ?auto_172880 ) ) ( not ( = ?auto_172877 ?auto_172881 ) ) ( not ( = ?auto_172877 ?auto_172882 ) ) ( not ( = ?auto_172877 ?auto_172883 ) ) ( not ( = ?auto_172877 ?auto_172884 ) ) ( not ( = ?auto_172878 ?auto_172879 ) ) ( not ( = ?auto_172878 ?auto_172880 ) ) ( not ( = ?auto_172878 ?auto_172881 ) ) ( not ( = ?auto_172878 ?auto_172882 ) ) ( not ( = ?auto_172878 ?auto_172883 ) ) ( not ( = ?auto_172878 ?auto_172884 ) ) ( not ( = ?auto_172879 ?auto_172880 ) ) ( not ( = ?auto_172879 ?auto_172881 ) ) ( not ( = ?auto_172879 ?auto_172882 ) ) ( not ( = ?auto_172879 ?auto_172883 ) ) ( not ( = ?auto_172879 ?auto_172884 ) ) ( not ( = ?auto_172880 ?auto_172881 ) ) ( not ( = ?auto_172880 ?auto_172882 ) ) ( not ( = ?auto_172880 ?auto_172883 ) ) ( not ( = ?auto_172880 ?auto_172884 ) ) ( not ( = ?auto_172881 ?auto_172882 ) ) ( not ( = ?auto_172881 ?auto_172883 ) ) ( not ( = ?auto_172881 ?auto_172884 ) ) ( not ( = ?auto_172882 ?auto_172883 ) ) ( not ( = ?auto_172882 ?auto_172884 ) ) ( not ( = ?auto_172883 ?auto_172884 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172883 ?auto_172884 )
      ( !STACK ?auto_172883 ?auto_172882 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_172893 - BLOCK
      ?auto_172894 - BLOCK
      ?auto_172895 - BLOCK
      ?auto_172896 - BLOCK
      ?auto_172897 - BLOCK
      ?auto_172898 - BLOCK
      ?auto_172899 - BLOCK
      ?auto_172900 - BLOCK
    )
    :vars
    (
      ?auto_172901 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_172899 ) ( ON ?auto_172900 ?auto_172901 ) ( CLEAR ?auto_172900 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172893 ) ( ON ?auto_172894 ?auto_172893 ) ( ON ?auto_172895 ?auto_172894 ) ( ON ?auto_172896 ?auto_172895 ) ( ON ?auto_172897 ?auto_172896 ) ( ON ?auto_172898 ?auto_172897 ) ( ON ?auto_172899 ?auto_172898 ) ( not ( = ?auto_172893 ?auto_172894 ) ) ( not ( = ?auto_172893 ?auto_172895 ) ) ( not ( = ?auto_172893 ?auto_172896 ) ) ( not ( = ?auto_172893 ?auto_172897 ) ) ( not ( = ?auto_172893 ?auto_172898 ) ) ( not ( = ?auto_172893 ?auto_172899 ) ) ( not ( = ?auto_172893 ?auto_172900 ) ) ( not ( = ?auto_172893 ?auto_172901 ) ) ( not ( = ?auto_172894 ?auto_172895 ) ) ( not ( = ?auto_172894 ?auto_172896 ) ) ( not ( = ?auto_172894 ?auto_172897 ) ) ( not ( = ?auto_172894 ?auto_172898 ) ) ( not ( = ?auto_172894 ?auto_172899 ) ) ( not ( = ?auto_172894 ?auto_172900 ) ) ( not ( = ?auto_172894 ?auto_172901 ) ) ( not ( = ?auto_172895 ?auto_172896 ) ) ( not ( = ?auto_172895 ?auto_172897 ) ) ( not ( = ?auto_172895 ?auto_172898 ) ) ( not ( = ?auto_172895 ?auto_172899 ) ) ( not ( = ?auto_172895 ?auto_172900 ) ) ( not ( = ?auto_172895 ?auto_172901 ) ) ( not ( = ?auto_172896 ?auto_172897 ) ) ( not ( = ?auto_172896 ?auto_172898 ) ) ( not ( = ?auto_172896 ?auto_172899 ) ) ( not ( = ?auto_172896 ?auto_172900 ) ) ( not ( = ?auto_172896 ?auto_172901 ) ) ( not ( = ?auto_172897 ?auto_172898 ) ) ( not ( = ?auto_172897 ?auto_172899 ) ) ( not ( = ?auto_172897 ?auto_172900 ) ) ( not ( = ?auto_172897 ?auto_172901 ) ) ( not ( = ?auto_172898 ?auto_172899 ) ) ( not ( = ?auto_172898 ?auto_172900 ) ) ( not ( = ?auto_172898 ?auto_172901 ) ) ( not ( = ?auto_172899 ?auto_172900 ) ) ( not ( = ?auto_172899 ?auto_172901 ) ) ( not ( = ?auto_172900 ?auto_172901 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172900 ?auto_172901 )
      ( !STACK ?auto_172900 ?auto_172899 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_172910 - BLOCK
      ?auto_172911 - BLOCK
      ?auto_172912 - BLOCK
      ?auto_172913 - BLOCK
      ?auto_172914 - BLOCK
      ?auto_172915 - BLOCK
      ?auto_172916 - BLOCK
      ?auto_172917 - BLOCK
    )
    :vars
    (
      ?auto_172918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172917 ?auto_172918 ) ( ON-TABLE ?auto_172910 ) ( ON ?auto_172911 ?auto_172910 ) ( ON ?auto_172912 ?auto_172911 ) ( ON ?auto_172913 ?auto_172912 ) ( ON ?auto_172914 ?auto_172913 ) ( ON ?auto_172915 ?auto_172914 ) ( not ( = ?auto_172910 ?auto_172911 ) ) ( not ( = ?auto_172910 ?auto_172912 ) ) ( not ( = ?auto_172910 ?auto_172913 ) ) ( not ( = ?auto_172910 ?auto_172914 ) ) ( not ( = ?auto_172910 ?auto_172915 ) ) ( not ( = ?auto_172910 ?auto_172916 ) ) ( not ( = ?auto_172910 ?auto_172917 ) ) ( not ( = ?auto_172910 ?auto_172918 ) ) ( not ( = ?auto_172911 ?auto_172912 ) ) ( not ( = ?auto_172911 ?auto_172913 ) ) ( not ( = ?auto_172911 ?auto_172914 ) ) ( not ( = ?auto_172911 ?auto_172915 ) ) ( not ( = ?auto_172911 ?auto_172916 ) ) ( not ( = ?auto_172911 ?auto_172917 ) ) ( not ( = ?auto_172911 ?auto_172918 ) ) ( not ( = ?auto_172912 ?auto_172913 ) ) ( not ( = ?auto_172912 ?auto_172914 ) ) ( not ( = ?auto_172912 ?auto_172915 ) ) ( not ( = ?auto_172912 ?auto_172916 ) ) ( not ( = ?auto_172912 ?auto_172917 ) ) ( not ( = ?auto_172912 ?auto_172918 ) ) ( not ( = ?auto_172913 ?auto_172914 ) ) ( not ( = ?auto_172913 ?auto_172915 ) ) ( not ( = ?auto_172913 ?auto_172916 ) ) ( not ( = ?auto_172913 ?auto_172917 ) ) ( not ( = ?auto_172913 ?auto_172918 ) ) ( not ( = ?auto_172914 ?auto_172915 ) ) ( not ( = ?auto_172914 ?auto_172916 ) ) ( not ( = ?auto_172914 ?auto_172917 ) ) ( not ( = ?auto_172914 ?auto_172918 ) ) ( not ( = ?auto_172915 ?auto_172916 ) ) ( not ( = ?auto_172915 ?auto_172917 ) ) ( not ( = ?auto_172915 ?auto_172918 ) ) ( not ( = ?auto_172916 ?auto_172917 ) ) ( not ( = ?auto_172916 ?auto_172918 ) ) ( not ( = ?auto_172917 ?auto_172918 ) ) ( CLEAR ?auto_172915 ) ( ON ?auto_172916 ?auto_172917 ) ( CLEAR ?auto_172916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172910 ?auto_172911 ?auto_172912 ?auto_172913 ?auto_172914 ?auto_172915 ?auto_172916 )
      ( MAKE-8PILE ?auto_172910 ?auto_172911 ?auto_172912 ?auto_172913 ?auto_172914 ?auto_172915 ?auto_172916 ?auto_172917 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_172927 - BLOCK
      ?auto_172928 - BLOCK
      ?auto_172929 - BLOCK
      ?auto_172930 - BLOCK
      ?auto_172931 - BLOCK
      ?auto_172932 - BLOCK
      ?auto_172933 - BLOCK
      ?auto_172934 - BLOCK
    )
    :vars
    (
      ?auto_172935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172934 ?auto_172935 ) ( ON-TABLE ?auto_172927 ) ( ON ?auto_172928 ?auto_172927 ) ( ON ?auto_172929 ?auto_172928 ) ( ON ?auto_172930 ?auto_172929 ) ( ON ?auto_172931 ?auto_172930 ) ( ON ?auto_172932 ?auto_172931 ) ( not ( = ?auto_172927 ?auto_172928 ) ) ( not ( = ?auto_172927 ?auto_172929 ) ) ( not ( = ?auto_172927 ?auto_172930 ) ) ( not ( = ?auto_172927 ?auto_172931 ) ) ( not ( = ?auto_172927 ?auto_172932 ) ) ( not ( = ?auto_172927 ?auto_172933 ) ) ( not ( = ?auto_172927 ?auto_172934 ) ) ( not ( = ?auto_172927 ?auto_172935 ) ) ( not ( = ?auto_172928 ?auto_172929 ) ) ( not ( = ?auto_172928 ?auto_172930 ) ) ( not ( = ?auto_172928 ?auto_172931 ) ) ( not ( = ?auto_172928 ?auto_172932 ) ) ( not ( = ?auto_172928 ?auto_172933 ) ) ( not ( = ?auto_172928 ?auto_172934 ) ) ( not ( = ?auto_172928 ?auto_172935 ) ) ( not ( = ?auto_172929 ?auto_172930 ) ) ( not ( = ?auto_172929 ?auto_172931 ) ) ( not ( = ?auto_172929 ?auto_172932 ) ) ( not ( = ?auto_172929 ?auto_172933 ) ) ( not ( = ?auto_172929 ?auto_172934 ) ) ( not ( = ?auto_172929 ?auto_172935 ) ) ( not ( = ?auto_172930 ?auto_172931 ) ) ( not ( = ?auto_172930 ?auto_172932 ) ) ( not ( = ?auto_172930 ?auto_172933 ) ) ( not ( = ?auto_172930 ?auto_172934 ) ) ( not ( = ?auto_172930 ?auto_172935 ) ) ( not ( = ?auto_172931 ?auto_172932 ) ) ( not ( = ?auto_172931 ?auto_172933 ) ) ( not ( = ?auto_172931 ?auto_172934 ) ) ( not ( = ?auto_172931 ?auto_172935 ) ) ( not ( = ?auto_172932 ?auto_172933 ) ) ( not ( = ?auto_172932 ?auto_172934 ) ) ( not ( = ?auto_172932 ?auto_172935 ) ) ( not ( = ?auto_172933 ?auto_172934 ) ) ( not ( = ?auto_172933 ?auto_172935 ) ) ( not ( = ?auto_172934 ?auto_172935 ) ) ( CLEAR ?auto_172932 ) ( ON ?auto_172933 ?auto_172934 ) ( CLEAR ?auto_172933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172927 ?auto_172928 ?auto_172929 ?auto_172930 ?auto_172931 ?auto_172932 ?auto_172933 )
      ( MAKE-8PILE ?auto_172927 ?auto_172928 ?auto_172929 ?auto_172930 ?auto_172931 ?auto_172932 ?auto_172933 ?auto_172934 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_172944 - BLOCK
      ?auto_172945 - BLOCK
      ?auto_172946 - BLOCK
      ?auto_172947 - BLOCK
      ?auto_172948 - BLOCK
      ?auto_172949 - BLOCK
      ?auto_172950 - BLOCK
      ?auto_172951 - BLOCK
    )
    :vars
    (
      ?auto_172952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172951 ?auto_172952 ) ( ON-TABLE ?auto_172944 ) ( ON ?auto_172945 ?auto_172944 ) ( ON ?auto_172946 ?auto_172945 ) ( ON ?auto_172947 ?auto_172946 ) ( ON ?auto_172948 ?auto_172947 ) ( not ( = ?auto_172944 ?auto_172945 ) ) ( not ( = ?auto_172944 ?auto_172946 ) ) ( not ( = ?auto_172944 ?auto_172947 ) ) ( not ( = ?auto_172944 ?auto_172948 ) ) ( not ( = ?auto_172944 ?auto_172949 ) ) ( not ( = ?auto_172944 ?auto_172950 ) ) ( not ( = ?auto_172944 ?auto_172951 ) ) ( not ( = ?auto_172944 ?auto_172952 ) ) ( not ( = ?auto_172945 ?auto_172946 ) ) ( not ( = ?auto_172945 ?auto_172947 ) ) ( not ( = ?auto_172945 ?auto_172948 ) ) ( not ( = ?auto_172945 ?auto_172949 ) ) ( not ( = ?auto_172945 ?auto_172950 ) ) ( not ( = ?auto_172945 ?auto_172951 ) ) ( not ( = ?auto_172945 ?auto_172952 ) ) ( not ( = ?auto_172946 ?auto_172947 ) ) ( not ( = ?auto_172946 ?auto_172948 ) ) ( not ( = ?auto_172946 ?auto_172949 ) ) ( not ( = ?auto_172946 ?auto_172950 ) ) ( not ( = ?auto_172946 ?auto_172951 ) ) ( not ( = ?auto_172946 ?auto_172952 ) ) ( not ( = ?auto_172947 ?auto_172948 ) ) ( not ( = ?auto_172947 ?auto_172949 ) ) ( not ( = ?auto_172947 ?auto_172950 ) ) ( not ( = ?auto_172947 ?auto_172951 ) ) ( not ( = ?auto_172947 ?auto_172952 ) ) ( not ( = ?auto_172948 ?auto_172949 ) ) ( not ( = ?auto_172948 ?auto_172950 ) ) ( not ( = ?auto_172948 ?auto_172951 ) ) ( not ( = ?auto_172948 ?auto_172952 ) ) ( not ( = ?auto_172949 ?auto_172950 ) ) ( not ( = ?auto_172949 ?auto_172951 ) ) ( not ( = ?auto_172949 ?auto_172952 ) ) ( not ( = ?auto_172950 ?auto_172951 ) ) ( not ( = ?auto_172950 ?auto_172952 ) ) ( not ( = ?auto_172951 ?auto_172952 ) ) ( ON ?auto_172950 ?auto_172951 ) ( CLEAR ?auto_172948 ) ( ON ?auto_172949 ?auto_172950 ) ( CLEAR ?auto_172949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172944 ?auto_172945 ?auto_172946 ?auto_172947 ?auto_172948 ?auto_172949 )
      ( MAKE-8PILE ?auto_172944 ?auto_172945 ?auto_172946 ?auto_172947 ?auto_172948 ?auto_172949 ?auto_172950 ?auto_172951 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_172961 - BLOCK
      ?auto_172962 - BLOCK
      ?auto_172963 - BLOCK
      ?auto_172964 - BLOCK
      ?auto_172965 - BLOCK
      ?auto_172966 - BLOCK
      ?auto_172967 - BLOCK
      ?auto_172968 - BLOCK
    )
    :vars
    (
      ?auto_172969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172968 ?auto_172969 ) ( ON-TABLE ?auto_172961 ) ( ON ?auto_172962 ?auto_172961 ) ( ON ?auto_172963 ?auto_172962 ) ( ON ?auto_172964 ?auto_172963 ) ( ON ?auto_172965 ?auto_172964 ) ( not ( = ?auto_172961 ?auto_172962 ) ) ( not ( = ?auto_172961 ?auto_172963 ) ) ( not ( = ?auto_172961 ?auto_172964 ) ) ( not ( = ?auto_172961 ?auto_172965 ) ) ( not ( = ?auto_172961 ?auto_172966 ) ) ( not ( = ?auto_172961 ?auto_172967 ) ) ( not ( = ?auto_172961 ?auto_172968 ) ) ( not ( = ?auto_172961 ?auto_172969 ) ) ( not ( = ?auto_172962 ?auto_172963 ) ) ( not ( = ?auto_172962 ?auto_172964 ) ) ( not ( = ?auto_172962 ?auto_172965 ) ) ( not ( = ?auto_172962 ?auto_172966 ) ) ( not ( = ?auto_172962 ?auto_172967 ) ) ( not ( = ?auto_172962 ?auto_172968 ) ) ( not ( = ?auto_172962 ?auto_172969 ) ) ( not ( = ?auto_172963 ?auto_172964 ) ) ( not ( = ?auto_172963 ?auto_172965 ) ) ( not ( = ?auto_172963 ?auto_172966 ) ) ( not ( = ?auto_172963 ?auto_172967 ) ) ( not ( = ?auto_172963 ?auto_172968 ) ) ( not ( = ?auto_172963 ?auto_172969 ) ) ( not ( = ?auto_172964 ?auto_172965 ) ) ( not ( = ?auto_172964 ?auto_172966 ) ) ( not ( = ?auto_172964 ?auto_172967 ) ) ( not ( = ?auto_172964 ?auto_172968 ) ) ( not ( = ?auto_172964 ?auto_172969 ) ) ( not ( = ?auto_172965 ?auto_172966 ) ) ( not ( = ?auto_172965 ?auto_172967 ) ) ( not ( = ?auto_172965 ?auto_172968 ) ) ( not ( = ?auto_172965 ?auto_172969 ) ) ( not ( = ?auto_172966 ?auto_172967 ) ) ( not ( = ?auto_172966 ?auto_172968 ) ) ( not ( = ?auto_172966 ?auto_172969 ) ) ( not ( = ?auto_172967 ?auto_172968 ) ) ( not ( = ?auto_172967 ?auto_172969 ) ) ( not ( = ?auto_172968 ?auto_172969 ) ) ( ON ?auto_172967 ?auto_172968 ) ( CLEAR ?auto_172965 ) ( ON ?auto_172966 ?auto_172967 ) ( CLEAR ?auto_172966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172961 ?auto_172962 ?auto_172963 ?auto_172964 ?auto_172965 ?auto_172966 )
      ( MAKE-8PILE ?auto_172961 ?auto_172962 ?auto_172963 ?auto_172964 ?auto_172965 ?auto_172966 ?auto_172967 ?auto_172968 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_172978 - BLOCK
      ?auto_172979 - BLOCK
      ?auto_172980 - BLOCK
      ?auto_172981 - BLOCK
      ?auto_172982 - BLOCK
      ?auto_172983 - BLOCK
      ?auto_172984 - BLOCK
      ?auto_172985 - BLOCK
    )
    :vars
    (
      ?auto_172986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172985 ?auto_172986 ) ( ON-TABLE ?auto_172978 ) ( ON ?auto_172979 ?auto_172978 ) ( ON ?auto_172980 ?auto_172979 ) ( ON ?auto_172981 ?auto_172980 ) ( not ( = ?auto_172978 ?auto_172979 ) ) ( not ( = ?auto_172978 ?auto_172980 ) ) ( not ( = ?auto_172978 ?auto_172981 ) ) ( not ( = ?auto_172978 ?auto_172982 ) ) ( not ( = ?auto_172978 ?auto_172983 ) ) ( not ( = ?auto_172978 ?auto_172984 ) ) ( not ( = ?auto_172978 ?auto_172985 ) ) ( not ( = ?auto_172978 ?auto_172986 ) ) ( not ( = ?auto_172979 ?auto_172980 ) ) ( not ( = ?auto_172979 ?auto_172981 ) ) ( not ( = ?auto_172979 ?auto_172982 ) ) ( not ( = ?auto_172979 ?auto_172983 ) ) ( not ( = ?auto_172979 ?auto_172984 ) ) ( not ( = ?auto_172979 ?auto_172985 ) ) ( not ( = ?auto_172979 ?auto_172986 ) ) ( not ( = ?auto_172980 ?auto_172981 ) ) ( not ( = ?auto_172980 ?auto_172982 ) ) ( not ( = ?auto_172980 ?auto_172983 ) ) ( not ( = ?auto_172980 ?auto_172984 ) ) ( not ( = ?auto_172980 ?auto_172985 ) ) ( not ( = ?auto_172980 ?auto_172986 ) ) ( not ( = ?auto_172981 ?auto_172982 ) ) ( not ( = ?auto_172981 ?auto_172983 ) ) ( not ( = ?auto_172981 ?auto_172984 ) ) ( not ( = ?auto_172981 ?auto_172985 ) ) ( not ( = ?auto_172981 ?auto_172986 ) ) ( not ( = ?auto_172982 ?auto_172983 ) ) ( not ( = ?auto_172982 ?auto_172984 ) ) ( not ( = ?auto_172982 ?auto_172985 ) ) ( not ( = ?auto_172982 ?auto_172986 ) ) ( not ( = ?auto_172983 ?auto_172984 ) ) ( not ( = ?auto_172983 ?auto_172985 ) ) ( not ( = ?auto_172983 ?auto_172986 ) ) ( not ( = ?auto_172984 ?auto_172985 ) ) ( not ( = ?auto_172984 ?auto_172986 ) ) ( not ( = ?auto_172985 ?auto_172986 ) ) ( ON ?auto_172984 ?auto_172985 ) ( ON ?auto_172983 ?auto_172984 ) ( CLEAR ?auto_172981 ) ( ON ?auto_172982 ?auto_172983 ) ( CLEAR ?auto_172982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172978 ?auto_172979 ?auto_172980 ?auto_172981 ?auto_172982 )
      ( MAKE-8PILE ?auto_172978 ?auto_172979 ?auto_172980 ?auto_172981 ?auto_172982 ?auto_172983 ?auto_172984 ?auto_172985 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_172995 - BLOCK
      ?auto_172996 - BLOCK
      ?auto_172997 - BLOCK
      ?auto_172998 - BLOCK
      ?auto_172999 - BLOCK
      ?auto_173000 - BLOCK
      ?auto_173001 - BLOCK
      ?auto_173002 - BLOCK
    )
    :vars
    (
      ?auto_173003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173002 ?auto_173003 ) ( ON-TABLE ?auto_172995 ) ( ON ?auto_172996 ?auto_172995 ) ( ON ?auto_172997 ?auto_172996 ) ( ON ?auto_172998 ?auto_172997 ) ( not ( = ?auto_172995 ?auto_172996 ) ) ( not ( = ?auto_172995 ?auto_172997 ) ) ( not ( = ?auto_172995 ?auto_172998 ) ) ( not ( = ?auto_172995 ?auto_172999 ) ) ( not ( = ?auto_172995 ?auto_173000 ) ) ( not ( = ?auto_172995 ?auto_173001 ) ) ( not ( = ?auto_172995 ?auto_173002 ) ) ( not ( = ?auto_172995 ?auto_173003 ) ) ( not ( = ?auto_172996 ?auto_172997 ) ) ( not ( = ?auto_172996 ?auto_172998 ) ) ( not ( = ?auto_172996 ?auto_172999 ) ) ( not ( = ?auto_172996 ?auto_173000 ) ) ( not ( = ?auto_172996 ?auto_173001 ) ) ( not ( = ?auto_172996 ?auto_173002 ) ) ( not ( = ?auto_172996 ?auto_173003 ) ) ( not ( = ?auto_172997 ?auto_172998 ) ) ( not ( = ?auto_172997 ?auto_172999 ) ) ( not ( = ?auto_172997 ?auto_173000 ) ) ( not ( = ?auto_172997 ?auto_173001 ) ) ( not ( = ?auto_172997 ?auto_173002 ) ) ( not ( = ?auto_172997 ?auto_173003 ) ) ( not ( = ?auto_172998 ?auto_172999 ) ) ( not ( = ?auto_172998 ?auto_173000 ) ) ( not ( = ?auto_172998 ?auto_173001 ) ) ( not ( = ?auto_172998 ?auto_173002 ) ) ( not ( = ?auto_172998 ?auto_173003 ) ) ( not ( = ?auto_172999 ?auto_173000 ) ) ( not ( = ?auto_172999 ?auto_173001 ) ) ( not ( = ?auto_172999 ?auto_173002 ) ) ( not ( = ?auto_172999 ?auto_173003 ) ) ( not ( = ?auto_173000 ?auto_173001 ) ) ( not ( = ?auto_173000 ?auto_173002 ) ) ( not ( = ?auto_173000 ?auto_173003 ) ) ( not ( = ?auto_173001 ?auto_173002 ) ) ( not ( = ?auto_173001 ?auto_173003 ) ) ( not ( = ?auto_173002 ?auto_173003 ) ) ( ON ?auto_173001 ?auto_173002 ) ( ON ?auto_173000 ?auto_173001 ) ( CLEAR ?auto_172998 ) ( ON ?auto_172999 ?auto_173000 ) ( CLEAR ?auto_172999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172995 ?auto_172996 ?auto_172997 ?auto_172998 ?auto_172999 )
      ( MAKE-8PILE ?auto_172995 ?auto_172996 ?auto_172997 ?auto_172998 ?auto_172999 ?auto_173000 ?auto_173001 ?auto_173002 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_173012 - BLOCK
      ?auto_173013 - BLOCK
      ?auto_173014 - BLOCK
      ?auto_173015 - BLOCK
      ?auto_173016 - BLOCK
      ?auto_173017 - BLOCK
      ?auto_173018 - BLOCK
      ?auto_173019 - BLOCK
    )
    :vars
    (
      ?auto_173020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173019 ?auto_173020 ) ( ON-TABLE ?auto_173012 ) ( ON ?auto_173013 ?auto_173012 ) ( ON ?auto_173014 ?auto_173013 ) ( not ( = ?auto_173012 ?auto_173013 ) ) ( not ( = ?auto_173012 ?auto_173014 ) ) ( not ( = ?auto_173012 ?auto_173015 ) ) ( not ( = ?auto_173012 ?auto_173016 ) ) ( not ( = ?auto_173012 ?auto_173017 ) ) ( not ( = ?auto_173012 ?auto_173018 ) ) ( not ( = ?auto_173012 ?auto_173019 ) ) ( not ( = ?auto_173012 ?auto_173020 ) ) ( not ( = ?auto_173013 ?auto_173014 ) ) ( not ( = ?auto_173013 ?auto_173015 ) ) ( not ( = ?auto_173013 ?auto_173016 ) ) ( not ( = ?auto_173013 ?auto_173017 ) ) ( not ( = ?auto_173013 ?auto_173018 ) ) ( not ( = ?auto_173013 ?auto_173019 ) ) ( not ( = ?auto_173013 ?auto_173020 ) ) ( not ( = ?auto_173014 ?auto_173015 ) ) ( not ( = ?auto_173014 ?auto_173016 ) ) ( not ( = ?auto_173014 ?auto_173017 ) ) ( not ( = ?auto_173014 ?auto_173018 ) ) ( not ( = ?auto_173014 ?auto_173019 ) ) ( not ( = ?auto_173014 ?auto_173020 ) ) ( not ( = ?auto_173015 ?auto_173016 ) ) ( not ( = ?auto_173015 ?auto_173017 ) ) ( not ( = ?auto_173015 ?auto_173018 ) ) ( not ( = ?auto_173015 ?auto_173019 ) ) ( not ( = ?auto_173015 ?auto_173020 ) ) ( not ( = ?auto_173016 ?auto_173017 ) ) ( not ( = ?auto_173016 ?auto_173018 ) ) ( not ( = ?auto_173016 ?auto_173019 ) ) ( not ( = ?auto_173016 ?auto_173020 ) ) ( not ( = ?auto_173017 ?auto_173018 ) ) ( not ( = ?auto_173017 ?auto_173019 ) ) ( not ( = ?auto_173017 ?auto_173020 ) ) ( not ( = ?auto_173018 ?auto_173019 ) ) ( not ( = ?auto_173018 ?auto_173020 ) ) ( not ( = ?auto_173019 ?auto_173020 ) ) ( ON ?auto_173018 ?auto_173019 ) ( ON ?auto_173017 ?auto_173018 ) ( ON ?auto_173016 ?auto_173017 ) ( CLEAR ?auto_173014 ) ( ON ?auto_173015 ?auto_173016 ) ( CLEAR ?auto_173015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173012 ?auto_173013 ?auto_173014 ?auto_173015 )
      ( MAKE-8PILE ?auto_173012 ?auto_173013 ?auto_173014 ?auto_173015 ?auto_173016 ?auto_173017 ?auto_173018 ?auto_173019 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_173029 - BLOCK
      ?auto_173030 - BLOCK
      ?auto_173031 - BLOCK
      ?auto_173032 - BLOCK
      ?auto_173033 - BLOCK
      ?auto_173034 - BLOCK
      ?auto_173035 - BLOCK
      ?auto_173036 - BLOCK
    )
    :vars
    (
      ?auto_173037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173036 ?auto_173037 ) ( ON-TABLE ?auto_173029 ) ( ON ?auto_173030 ?auto_173029 ) ( ON ?auto_173031 ?auto_173030 ) ( not ( = ?auto_173029 ?auto_173030 ) ) ( not ( = ?auto_173029 ?auto_173031 ) ) ( not ( = ?auto_173029 ?auto_173032 ) ) ( not ( = ?auto_173029 ?auto_173033 ) ) ( not ( = ?auto_173029 ?auto_173034 ) ) ( not ( = ?auto_173029 ?auto_173035 ) ) ( not ( = ?auto_173029 ?auto_173036 ) ) ( not ( = ?auto_173029 ?auto_173037 ) ) ( not ( = ?auto_173030 ?auto_173031 ) ) ( not ( = ?auto_173030 ?auto_173032 ) ) ( not ( = ?auto_173030 ?auto_173033 ) ) ( not ( = ?auto_173030 ?auto_173034 ) ) ( not ( = ?auto_173030 ?auto_173035 ) ) ( not ( = ?auto_173030 ?auto_173036 ) ) ( not ( = ?auto_173030 ?auto_173037 ) ) ( not ( = ?auto_173031 ?auto_173032 ) ) ( not ( = ?auto_173031 ?auto_173033 ) ) ( not ( = ?auto_173031 ?auto_173034 ) ) ( not ( = ?auto_173031 ?auto_173035 ) ) ( not ( = ?auto_173031 ?auto_173036 ) ) ( not ( = ?auto_173031 ?auto_173037 ) ) ( not ( = ?auto_173032 ?auto_173033 ) ) ( not ( = ?auto_173032 ?auto_173034 ) ) ( not ( = ?auto_173032 ?auto_173035 ) ) ( not ( = ?auto_173032 ?auto_173036 ) ) ( not ( = ?auto_173032 ?auto_173037 ) ) ( not ( = ?auto_173033 ?auto_173034 ) ) ( not ( = ?auto_173033 ?auto_173035 ) ) ( not ( = ?auto_173033 ?auto_173036 ) ) ( not ( = ?auto_173033 ?auto_173037 ) ) ( not ( = ?auto_173034 ?auto_173035 ) ) ( not ( = ?auto_173034 ?auto_173036 ) ) ( not ( = ?auto_173034 ?auto_173037 ) ) ( not ( = ?auto_173035 ?auto_173036 ) ) ( not ( = ?auto_173035 ?auto_173037 ) ) ( not ( = ?auto_173036 ?auto_173037 ) ) ( ON ?auto_173035 ?auto_173036 ) ( ON ?auto_173034 ?auto_173035 ) ( ON ?auto_173033 ?auto_173034 ) ( CLEAR ?auto_173031 ) ( ON ?auto_173032 ?auto_173033 ) ( CLEAR ?auto_173032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173029 ?auto_173030 ?auto_173031 ?auto_173032 )
      ( MAKE-8PILE ?auto_173029 ?auto_173030 ?auto_173031 ?auto_173032 ?auto_173033 ?auto_173034 ?auto_173035 ?auto_173036 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_173046 - BLOCK
      ?auto_173047 - BLOCK
      ?auto_173048 - BLOCK
      ?auto_173049 - BLOCK
      ?auto_173050 - BLOCK
      ?auto_173051 - BLOCK
      ?auto_173052 - BLOCK
      ?auto_173053 - BLOCK
    )
    :vars
    (
      ?auto_173054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173053 ?auto_173054 ) ( ON-TABLE ?auto_173046 ) ( ON ?auto_173047 ?auto_173046 ) ( not ( = ?auto_173046 ?auto_173047 ) ) ( not ( = ?auto_173046 ?auto_173048 ) ) ( not ( = ?auto_173046 ?auto_173049 ) ) ( not ( = ?auto_173046 ?auto_173050 ) ) ( not ( = ?auto_173046 ?auto_173051 ) ) ( not ( = ?auto_173046 ?auto_173052 ) ) ( not ( = ?auto_173046 ?auto_173053 ) ) ( not ( = ?auto_173046 ?auto_173054 ) ) ( not ( = ?auto_173047 ?auto_173048 ) ) ( not ( = ?auto_173047 ?auto_173049 ) ) ( not ( = ?auto_173047 ?auto_173050 ) ) ( not ( = ?auto_173047 ?auto_173051 ) ) ( not ( = ?auto_173047 ?auto_173052 ) ) ( not ( = ?auto_173047 ?auto_173053 ) ) ( not ( = ?auto_173047 ?auto_173054 ) ) ( not ( = ?auto_173048 ?auto_173049 ) ) ( not ( = ?auto_173048 ?auto_173050 ) ) ( not ( = ?auto_173048 ?auto_173051 ) ) ( not ( = ?auto_173048 ?auto_173052 ) ) ( not ( = ?auto_173048 ?auto_173053 ) ) ( not ( = ?auto_173048 ?auto_173054 ) ) ( not ( = ?auto_173049 ?auto_173050 ) ) ( not ( = ?auto_173049 ?auto_173051 ) ) ( not ( = ?auto_173049 ?auto_173052 ) ) ( not ( = ?auto_173049 ?auto_173053 ) ) ( not ( = ?auto_173049 ?auto_173054 ) ) ( not ( = ?auto_173050 ?auto_173051 ) ) ( not ( = ?auto_173050 ?auto_173052 ) ) ( not ( = ?auto_173050 ?auto_173053 ) ) ( not ( = ?auto_173050 ?auto_173054 ) ) ( not ( = ?auto_173051 ?auto_173052 ) ) ( not ( = ?auto_173051 ?auto_173053 ) ) ( not ( = ?auto_173051 ?auto_173054 ) ) ( not ( = ?auto_173052 ?auto_173053 ) ) ( not ( = ?auto_173052 ?auto_173054 ) ) ( not ( = ?auto_173053 ?auto_173054 ) ) ( ON ?auto_173052 ?auto_173053 ) ( ON ?auto_173051 ?auto_173052 ) ( ON ?auto_173050 ?auto_173051 ) ( ON ?auto_173049 ?auto_173050 ) ( CLEAR ?auto_173047 ) ( ON ?auto_173048 ?auto_173049 ) ( CLEAR ?auto_173048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173046 ?auto_173047 ?auto_173048 )
      ( MAKE-8PILE ?auto_173046 ?auto_173047 ?auto_173048 ?auto_173049 ?auto_173050 ?auto_173051 ?auto_173052 ?auto_173053 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_173063 - BLOCK
      ?auto_173064 - BLOCK
      ?auto_173065 - BLOCK
      ?auto_173066 - BLOCK
      ?auto_173067 - BLOCK
      ?auto_173068 - BLOCK
      ?auto_173069 - BLOCK
      ?auto_173070 - BLOCK
    )
    :vars
    (
      ?auto_173071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173070 ?auto_173071 ) ( ON-TABLE ?auto_173063 ) ( ON ?auto_173064 ?auto_173063 ) ( not ( = ?auto_173063 ?auto_173064 ) ) ( not ( = ?auto_173063 ?auto_173065 ) ) ( not ( = ?auto_173063 ?auto_173066 ) ) ( not ( = ?auto_173063 ?auto_173067 ) ) ( not ( = ?auto_173063 ?auto_173068 ) ) ( not ( = ?auto_173063 ?auto_173069 ) ) ( not ( = ?auto_173063 ?auto_173070 ) ) ( not ( = ?auto_173063 ?auto_173071 ) ) ( not ( = ?auto_173064 ?auto_173065 ) ) ( not ( = ?auto_173064 ?auto_173066 ) ) ( not ( = ?auto_173064 ?auto_173067 ) ) ( not ( = ?auto_173064 ?auto_173068 ) ) ( not ( = ?auto_173064 ?auto_173069 ) ) ( not ( = ?auto_173064 ?auto_173070 ) ) ( not ( = ?auto_173064 ?auto_173071 ) ) ( not ( = ?auto_173065 ?auto_173066 ) ) ( not ( = ?auto_173065 ?auto_173067 ) ) ( not ( = ?auto_173065 ?auto_173068 ) ) ( not ( = ?auto_173065 ?auto_173069 ) ) ( not ( = ?auto_173065 ?auto_173070 ) ) ( not ( = ?auto_173065 ?auto_173071 ) ) ( not ( = ?auto_173066 ?auto_173067 ) ) ( not ( = ?auto_173066 ?auto_173068 ) ) ( not ( = ?auto_173066 ?auto_173069 ) ) ( not ( = ?auto_173066 ?auto_173070 ) ) ( not ( = ?auto_173066 ?auto_173071 ) ) ( not ( = ?auto_173067 ?auto_173068 ) ) ( not ( = ?auto_173067 ?auto_173069 ) ) ( not ( = ?auto_173067 ?auto_173070 ) ) ( not ( = ?auto_173067 ?auto_173071 ) ) ( not ( = ?auto_173068 ?auto_173069 ) ) ( not ( = ?auto_173068 ?auto_173070 ) ) ( not ( = ?auto_173068 ?auto_173071 ) ) ( not ( = ?auto_173069 ?auto_173070 ) ) ( not ( = ?auto_173069 ?auto_173071 ) ) ( not ( = ?auto_173070 ?auto_173071 ) ) ( ON ?auto_173069 ?auto_173070 ) ( ON ?auto_173068 ?auto_173069 ) ( ON ?auto_173067 ?auto_173068 ) ( ON ?auto_173066 ?auto_173067 ) ( CLEAR ?auto_173064 ) ( ON ?auto_173065 ?auto_173066 ) ( CLEAR ?auto_173065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173063 ?auto_173064 ?auto_173065 )
      ( MAKE-8PILE ?auto_173063 ?auto_173064 ?auto_173065 ?auto_173066 ?auto_173067 ?auto_173068 ?auto_173069 ?auto_173070 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_173080 - BLOCK
      ?auto_173081 - BLOCK
      ?auto_173082 - BLOCK
      ?auto_173083 - BLOCK
      ?auto_173084 - BLOCK
      ?auto_173085 - BLOCK
      ?auto_173086 - BLOCK
      ?auto_173087 - BLOCK
    )
    :vars
    (
      ?auto_173088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173087 ?auto_173088 ) ( ON-TABLE ?auto_173080 ) ( not ( = ?auto_173080 ?auto_173081 ) ) ( not ( = ?auto_173080 ?auto_173082 ) ) ( not ( = ?auto_173080 ?auto_173083 ) ) ( not ( = ?auto_173080 ?auto_173084 ) ) ( not ( = ?auto_173080 ?auto_173085 ) ) ( not ( = ?auto_173080 ?auto_173086 ) ) ( not ( = ?auto_173080 ?auto_173087 ) ) ( not ( = ?auto_173080 ?auto_173088 ) ) ( not ( = ?auto_173081 ?auto_173082 ) ) ( not ( = ?auto_173081 ?auto_173083 ) ) ( not ( = ?auto_173081 ?auto_173084 ) ) ( not ( = ?auto_173081 ?auto_173085 ) ) ( not ( = ?auto_173081 ?auto_173086 ) ) ( not ( = ?auto_173081 ?auto_173087 ) ) ( not ( = ?auto_173081 ?auto_173088 ) ) ( not ( = ?auto_173082 ?auto_173083 ) ) ( not ( = ?auto_173082 ?auto_173084 ) ) ( not ( = ?auto_173082 ?auto_173085 ) ) ( not ( = ?auto_173082 ?auto_173086 ) ) ( not ( = ?auto_173082 ?auto_173087 ) ) ( not ( = ?auto_173082 ?auto_173088 ) ) ( not ( = ?auto_173083 ?auto_173084 ) ) ( not ( = ?auto_173083 ?auto_173085 ) ) ( not ( = ?auto_173083 ?auto_173086 ) ) ( not ( = ?auto_173083 ?auto_173087 ) ) ( not ( = ?auto_173083 ?auto_173088 ) ) ( not ( = ?auto_173084 ?auto_173085 ) ) ( not ( = ?auto_173084 ?auto_173086 ) ) ( not ( = ?auto_173084 ?auto_173087 ) ) ( not ( = ?auto_173084 ?auto_173088 ) ) ( not ( = ?auto_173085 ?auto_173086 ) ) ( not ( = ?auto_173085 ?auto_173087 ) ) ( not ( = ?auto_173085 ?auto_173088 ) ) ( not ( = ?auto_173086 ?auto_173087 ) ) ( not ( = ?auto_173086 ?auto_173088 ) ) ( not ( = ?auto_173087 ?auto_173088 ) ) ( ON ?auto_173086 ?auto_173087 ) ( ON ?auto_173085 ?auto_173086 ) ( ON ?auto_173084 ?auto_173085 ) ( ON ?auto_173083 ?auto_173084 ) ( ON ?auto_173082 ?auto_173083 ) ( CLEAR ?auto_173080 ) ( ON ?auto_173081 ?auto_173082 ) ( CLEAR ?auto_173081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173080 ?auto_173081 )
      ( MAKE-8PILE ?auto_173080 ?auto_173081 ?auto_173082 ?auto_173083 ?auto_173084 ?auto_173085 ?auto_173086 ?auto_173087 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_173097 - BLOCK
      ?auto_173098 - BLOCK
      ?auto_173099 - BLOCK
      ?auto_173100 - BLOCK
      ?auto_173101 - BLOCK
      ?auto_173102 - BLOCK
      ?auto_173103 - BLOCK
      ?auto_173104 - BLOCK
    )
    :vars
    (
      ?auto_173105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173104 ?auto_173105 ) ( ON-TABLE ?auto_173097 ) ( not ( = ?auto_173097 ?auto_173098 ) ) ( not ( = ?auto_173097 ?auto_173099 ) ) ( not ( = ?auto_173097 ?auto_173100 ) ) ( not ( = ?auto_173097 ?auto_173101 ) ) ( not ( = ?auto_173097 ?auto_173102 ) ) ( not ( = ?auto_173097 ?auto_173103 ) ) ( not ( = ?auto_173097 ?auto_173104 ) ) ( not ( = ?auto_173097 ?auto_173105 ) ) ( not ( = ?auto_173098 ?auto_173099 ) ) ( not ( = ?auto_173098 ?auto_173100 ) ) ( not ( = ?auto_173098 ?auto_173101 ) ) ( not ( = ?auto_173098 ?auto_173102 ) ) ( not ( = ?auto_173098 ?auto_173103 ) ) ( not ( = ?auto_173098 ?auto_173104 ) ) ( not ( = ?auto_173098 ?auto_173105 ) ) ( not ( = ?auto_173099 ?auto_173100 ) ) ( not ( = ?auto_173099 ?auto_173101 ) ) ( not ( = ?auto_173099 ?auto_173102 ) ) ( not ( = ?auto_173099 ?auto_173103 ) ) ( not ( = ?auto_173099 ?auto_173104 ) ) ( not ( = ?auto_173099 ?auto_173105 ) ) ( not ( = ?auto_173100 ?auto_173101 ) ) ( not ( = ?auto_173100 ?auto_173102 ) ) ( not ( = ?auto_173100 ?auto_173103 ) ) ( not ( = ?auto_173100 ?auto_173104 ) ) ( not ( = ?auto_173100 ?auto_173105 ) ) ( not ( = ?auto_173101 ?auto_173102 ) ) ( not ( = ?auto_173101 ?auto_173103 ) ) ( not ( = ?auto_173101 ?auto_173104 ) ) ( not ( = ?auto_173101 ?auto_173105 ) ) ( not ( = ?auto_173102 ?auto_173103 ) ) ( not ( = ?auto_173102 ?auto_173104 ) ) ( not ( = ?auto_173102 ?auto_173105 ) ) ( not ( = ?auto_173103 ?auto_173104 ) ) ( not ( = ?auto_173103 ?auto_173105 ) ) ( not ( = ?auto_173104 ?auto_173105 ) ) ( ON ?auto_173103 ?auto_173104 ) ( ON ?auto_173102 ?auto_173103 ) ( ON ?auto_173101 ?auto_173102 ) ( ON ?auto_173100 ?auto_173101 ) ( ON ?auto_173099 ?auto_173100 ) ( CLEAR ?auto_173097 ) ( ON ?auto_173098 ?auto_173099 ) ( CLEAR ?auto_173098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173097 ?auto_173098 )
      ( MAKE-8PILE ?auto_173097 ?auto_173098 ?auto_173099 ?auto_173100 ?auto_173101 ?auto_173102 ?auto_173103 ?auto_173104 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_173114 - BLOCK
      ?auto_173115 - BLOCK
      ?auto_173116 - BLOCK
      ?auto_173117 - BLOCK
      ?auto_173118 - BLOCK
      ?auto_173119 - BLOCK
      ?auto_173120 - BLOCK
      ?auto_173121 - BLOCK
    )
    :vars
    (
      ?auto_173122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173121 ?auto_173122 ) ( not ( = ?auto_173114 ?auto_173115 ) ) ( not ( = ?auto_173114 ?auto_173116 ) ) ( not ( = ?auto_173114 ?auto_173117 ) ) ( not ( = ?auto_173114 ?auto_173118 ) ) ( not ( = ?auto_173114 ?auto_173119 ) ) ( not ( = ?auto_173114 ?auto_173120 ) ) ( not ( = ?auto_173114 ?auto_173121 ) ) ( not ( = ?auto_173114 ?auto_173122 ) ) ( not ( = ?auto_173115 ?auto_173116 ) ) ( not ( = ?auto_173115 ?auto_173117 ) ) ( not ( = ?auto_173115 ?auto_173118 ) ) ( not ( = ?auto_173115 ?auto_173119 ) ) ( not ( = ?auto_173115 ?auto_173120 ) ) ( not ( = ?auto_173115 ?auto_173121 ) ) ( not ( = ?auto_173115 ?auto_173122 ) ) ( not ( = ?auto_173116 ?auto_173117 ) ) ( not ( = ?auto_173116 ?auto_173118 ) ) ( not ( = ?auto_173116 ?auto_173119 ) ) ( not ( = ?auto_173116 ?auto_173120 ) ) ( not ( = ?auto_173116 ?auto_173121 ) ) ( not ( = ?auto_173116 ?auto_173122 ) ) ( not ( = ?auto_173117 ?auto_173118 ) ) ( not ( = ?auto_173117 ?auto_173119 ) ) ( not ( = ?auto_173117 ?auto_173120 ) ) ( not ( = ?auto_173117 ?auto_173121 ) ) ( not ( = ?auto_173117 ?auto_173122 ) ) ( not ( = ?auto_173118 ?auto_173119 ) ) ( not ( = ?auto_173118 ?auto_173120 ) ) ( not ( = ?auto_173118 ?auto_173121 ) ) ( not ( = ?auto_173118 ?auto_173122 ) ) ( not ( = ?auto_173119 ?auto_173120 ) ) ( not ( = ?auto_173119 ?auto_173121 ) ) ( not ( = ?auto_173119 ?auto_173122 ) ) ( not ( = ?auto_173120 ?auto_173121 ) ) ( not ( = ?auto_173120 ?auto_173122 ) ) ( not ( = ?auto_173121 ?auto_173122 ) ) ( ON ?auto_173120 ?auto_173121 ) ( ON ?auto_173119 ?auto_173120 ) ( ON ?auto_173118 ?auto_173119 ) ( ON ?auto_173117 ?auto_173118 ) ( ON ?auto_173116 ?auto_173117 ) ( ON ?auto_173115 ?auto_173116 ) ( ON ?auto_173114 ?auto_173115 ) ( CLEAR ?auto_173114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_173114 )
      ( MAKE-8PILE ?auto_173114 ?auto_173115 ?auto_173116 ?auto_173117 ?auto_173118 ?auto_173119 ?auto_173120 ?auto_173121 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_173131 - BLOCK
      ?auto_173132 - BLOCK
      ?auto_173133 - BLOCK
      ?auto_173134 - BLOCK
      ?auto_173135 - BLOCK
      ?auto_173136 - BLOCK
      ?auto_173137 - BLOCK
      ?auto_173138 - BLOCK
    )
    :vars
    (
      ?auto_173139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173138 ?auto_173139 ) ( not ( = ?auto_173131 ?auto_173132 ) ) ( not ( = ?auto_173131 ?auto_173133 ) ) ( not ( = ?auto_173131 ?auto_173134 ) ) ( not ( = ?auto_173131 ?auto_173135 ) ) ( not ( = ?auto_173131 ?auto_173136 ) ) ( not ( = ?auto_173131 ?auto_173137 ) ) ( not ( = ?auto_173131 ?auto_173138 ) ) ( not ( = ?auto_173131 ?auto_173139 ) ) ( not ( = ?auto_173132 ?auto_173133 ) ) ( not ( = ?auto_173132 ?auto_173134 ) ) ( not ( = ?auto_173132 ?auto_173135 ) ) ( not ( = ?auto_173132 ?auto_173136 ) ) ( not ( = ?auto_173132 ?auto_173137 ) ) ( not ( = ?auto_173132 ?auto_173138 ) ) ( not ( = ?auto_173132 ?auto_173139 ) ) ( not ( = ?auto_173133 ?auto_173134 ) ) ( not ( = ?auto_173133 ?auto_173135 ) ) ( not ( = ?auto_173133 ?auto_173136 ) ) ( not ( = ?auto_173133 ?auto_173137 ) ) ( not ( = ?auto_173133 ?auto_173138 ) ) ( not ( = ?auto_173133 ?auto_173139 ) ) ( not ( = ?auto_173134 ?auto_173135 ) ) ( not ( = ?auto_173134 ?auto_173136 ) ) ( not ( = ?auto_173134 ?auto_173137 ) ) ( not ( = ?auto_173134 ?auto_173138 ) ) ( not ( = ?auto_173134 ?auto_173139 ) ) ( not ( = ?auto_173135 ?auto_173136 ) ) ( not ( = ?auto_173135 ?auto_173137 ) ) ( not ( = ?auto_173135 ?auto_173138 ) ) ( not ( = ?auto_173135 ?auto_173139 ) ) ( not ( = ?auto_173136 ?auto_173137 ) ) ( not ( = ?auto_173136 ?auto_173138 ) ) ( not ( = ?auto_173136 ?auto_173139 ) ) ( not ( = ?auto_173137 ?auto_173138 ) ) ( not ( = ?auto_173137 ?auto_173139 ) ) ( not ( = ?auto_173138 ?auto_173139 ) ) ( ON ?auto_173137 ?auto_173138 ) ( ON ?auto_173136 ?auto_173137 ) ( ON ?auto_173135 ?auto_173136 ) ( ON ?auto_173134 ?auto_173135 ) ( ON ?auto_173133 ?auto_173134 ) ( ON ?auto_173132 ?auto_173133 ) ( ON ?auto_173131 ?auto_173132 ) ( CLEAR ?auto_173131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_173131 )
      ( MAKE-8PILE ?auto_173131 ?auto_173132 ?auto_173133 ?auto_173134 ?auto_173135 ?auto_173136 ?auto_173137 ?auto_173138 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_173149 - BLOCK
      ?auto_173150 - BLOCK
      ?auto_173151 - BLOCK
      ?auto_173152 - BLOCK
      ?auto_173153 - BLOCK
      ?auto_173154 - BLOCK
      ?auto_173155 - BLOCK
      ?auto_173156 - BLOCK
      ?auto_173157 - BLOCK
    )
    :vars
    (
      ?auto_173158 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_173156 ) ( ON ?auto_173157 ?auto_173158 ) ( CLEAR ?auto_173157 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173149 ) ( ON ?auto_173150 ?auto_173149 ) ( ON ?auto_173151 ?auto_173150 ) ( ON ?auto_173152 ?auto_173151 ) ( ON ?auto_173153 ?auto_173152 ) ( ON ?auto_173154 ?auto_173153 ) ( ON ?auto_173155 ?auto_173154 ) ( ON ?auto_173156 ?auto_173155 ) ( not ( = ?auto_173149 ?auto_173150 ) ) ( not ( = ?auto_173149 ?auto_173151 ) ) ( not ( = ?auto_173149 ?auto_173152 ) ) ( not ( = ?auto_173149 ?auto_173153 ) ) ( not ( = ?auto_173149 ?auto_173154 ) ) ( not ( = ?auto_173149 ?auto_173155 ) ) ( not ( = ?auto_173149 ?auto_173156 ) ) ( not ( = ?auto_173149 ?auto_173157 ) ) ( not ( = ?auto_173149 ?auto_173158 ) ) ( not ( = ?auto_173150 ?auto_173151 ) ) ( not ( = ?auto_173150 ?auto_173152 ) ) ( not ( = ?auto_173150 ?auto_173153 ) ) ( not ( = ?auto_173150 ?auto_173154 ) ) ( not ( = ?auto_173150 ?auto_173155 ) ) ( not ( = ?auto_173150 ?auto_173156 ) ) ( not ( = ?auto_173150 ?auto_173157 ) ) ( not ( = ?auto_173150 ?auto_173158 ) ) ( not ( = ?auto_173151 ?auto_173152 ) ) ( not ( = ?auto_173151 ?auto_173153 ) ) ( not ( = ?auto_173151 ?auto_173154 ) ) ( not ( = ?auto_173151 ?auto_173155 ) ) ( not ( = ?auto_173151 ?auto_173156 ) ) ( not ( = ?auto_173151 ?auto_173157 ) ) ( not ( = ?auto_173151 ?auto_173158 ) ) ( not ( = ?auto_173152 ?auto_173153 ) ) ( not ( = ?auto_173152 ?auto_173154 ) ) ( not ( = ?auto_173152 ?auto_173155 ) ) ( not ( = ?auto_173152 ?auto_173156 ) ) ( not ( = ?auto_173152 ?auto_173157 ) ) ( not ( = ?auto_173152 ?auto_173158 ) ) ( not ( = ?auto_173153 ?auto_173154 ) ) ( not ( = ?auto_173153 ?auto_173155 ) ) ( not ( = ?auto_173153 ?auto_173156 ) ) ( not ( = ?auto_173153 ?auto_173157 ) ) ( not ( = ?auto_173153 ?auto_173158 ) ) ( not ( = ?auto_173154 ?auto_173155 ) ) ( not ( = ?auto_173154 ?auto_173156 ) ) ( not ( = ?auto_173154 ?auto_173157 ) ) ( not ( = ?auto_173154 ?auto_173158 ) ) ( not ( = ?auto_173155 ?auto_173156 ) ) ( not ( = ?auto_173155 ?auto_173157 ) ) ( not ( = ?auto_173155 ?auto_173158 ) ) ( not ( = ?auto_173156 ?auto_173157 ) ) ( not ( = ?auto_173156 ?auto_173158 ) ) ( not ( = ?auto_173157 ?auto_173158 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173157 ?auto_173158 )
      ( !STACK ?auto_173157 ?auto_173156 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_173168 - BLOCK
      ?auto_173169 - BLOCK
      ?auto_173170 - BLOCK
      ?auto_173171 - BLOCK
      ?auto_173172 - BLOCK
      ?auto_173173 - BLOCK
      ?auto_173174 - BLOCK
      ?auto_173175 - BLOCK
      ?auto_173176 - BLOCK
    )
    :vars
    (
      ?auto_173177 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_173175 ) ( ON ?auto_173176 ?auto_173177 ) ( CLEAR ?auto_173176 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173168 ) ( ON ?auto_173169 ?auto_173168 ) ( ON ?auto_173170 ?auto_173169 ) ( ON ?auto_173171 ?auto_173170 ) ( ON ?auto_173172 ?auto_173171 ) ( ON ?auto_173173 ?auto_173172 ) ( ON ?auto_173174 ?auto_173173 ) ( ON ?auto_173175 ?auto_173174 ) ( not ( = ?auto_173168 ?auto_173169 ) ) ( not ( = ?auto_173168 ?auto_173170 ) ) ( not ( = ?auto_173168 ?auto_173171 ) ) ( not ( = ?auto_173168 ?auto_173172 ) ) ( not ( = ?auto_173168 ?auto_173173 ) ) ( not ( = ?auto_173168 ?auto_173174 ) ) ( not ( = ?auto_173168 ?auto_173175 ) ) ( not ( = ?auto_173168 ?auto_173176 ) ) ( not ( = ?auto_173168 ?auto_173177 ) ) ( not ( = ?auto_173169 ?auto_173170 ) ) ( not ( = ?auto_173169 ?auto_173171 ) ) ( not ( = ?auto_173169 ?auto_173172 ) ) ( not ( = ?auto_173169 ?auto_173173 ) ) ( not ( = ?auto_173169 ?auto_173174 ) ) ( not ( = ?auto_173169 ?auto_173175 ) ) ( not ( = ?auto_173169 ?auto_173176 ) ) ( not ( = ?auto_173169 ?auto_173177 ) ) ( not ( = ?auto_173170 ?auto_173171 ) ) ( not ( = ?auto_173170 ?auto_173172 ) ) ( not ( = ?auto_173170 ?auto_173173 ) ) ( not ( = ?auto_173170 ?auto_173174 ) ) ( not ( = ?auto_173170 ?auto_173175 ) ) ( not ( = ?auto_173170 ?auto_173176 ) ) ( not ( = ?auto_173170 ?auto_173177 ) ) ( not ( = ?auto_173171 ?auto_173172 ) ) ( not ( = ?auto_173171 ?auto_173173 ) ) ( not ( = ?auto_173171 ?auto_173174 ) ) ( not ( = ?auto_173171 ?auto_173175 ) ) ( not ( = ?auto_173171 ?auto_173176 ) ) ( not ( = ?auto_173171 ?auto_173177 ) ) ( not ( = ?auto_173172 ?auto_173173 ) ) ( not ( = ?auto_173172 ?auto_173174 ) ) ( not ( = ?auto_173172 ?auto_173175 ) ) ( not ( = ?auto_173172 ?auto_173176 ) ) ( not ( = ?auto_173172 ?auto_173177 ) ) ( not ( = ?auto_173173 ?auto_173174 ) ) ( not ( = ?auto_173173 ?auto_173175 ) ) ( not ( = ?auto_173173 ?auto_173176 ) ) ( not ( = ?auto_173173 ?auto_173177 ) ) ( not ( = ?auto_173174 ?auto_173175 ) ) ( not ( = ?auto_173174 ?auto_173176 ) ) ( not ( = ?auto_173174 ?auto_173177 ) ) ( not ( = ?auto_173175 ?auto_173176 ) ) ( not ( = ?auto_173175 ?auto_173177 ) ) ( not ( = ?auto_173176 ?auto_173177 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173176 ?auto_173177 )
      ( !STACK ?auto_173176 ?auto_173175 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_173187 - BLOCK
      ?auto_173188 - BLOCK
      ?auto_173189 - BLOCK
      ?auto_173190 - BLOCK
      ?auto_173191 - BLOCK
      ?auto_173192 - BLOCK
      ?auto_173193 - BLOCK
      ?auto_173194 - BLOCK
      ?auto_173195 - BLOCK
    )
    :vars
    (
      ?auto_173196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173195 ?auto_173196 ) ( ON-TABLE ?auto_173187 ) ( ON ?auto_173188 ?auto_173187 ) ( ON ?auto_173189 ?auto_173188 ) ( ON ?auto_173190 ?auto_173189 ) ( ON ?auto_173191 ?auto_173190 ) ( ON ?auto_173192 ?auto_173191 ) ( ON ?auto_173193 ?auto_173192 ) ( not ( = ?auto_173187 ?auto_173188 ) ) ( not ( = ?auto_173187 ?auto_173189 ) ) ( not ( = ?auto_173187 ?auto_173190 ) ) ( not ( = ?auto_173187 ?auto_173191 ) ) ( not ( = ?auto_173187 ?auto_173192 ) ) ( not ( = ?auto_173187 ?auto_173193 ) ) ( not ( = ?auto_173187 ?auto_173194 ) ) ( not ( = ?auto_173187 ?auto_173195 ) ) ( not ( = ?auto_173187 ?auto_173196 ) ) ( not ( = ?auto_173188 ?auto_173189 ) ) ( not ( = ?auto_173188 ?auto_173190 ) ) ( not ( = ?auto_173188 ?auto_173191 ) ) ( not ( = ?auto_173188 ?auto_173192 ) ) ( not ( = ?auto_173188 ?auto_173193 ) ) ( not ( = ?auto_173188 ?auto_173194 ) ) ( not ( = ?auto_173188 ?auto_173195 ) ) ( not ( = ?auto_173188 ?auto_173196 ) ) ( not ( = ?auto_173189 ?auto_173190 ) ) ( not ( = ?auto_173189 ?auto_173191 ) ) ( not ( = ?auto_173189 ?auto_173192 ) ) ( not ( = ?auto_173189 ?auto_173193 ) ) ( not ( = ?auto_173189 ?auto_173194 ) ) ( not ( = ?auto_173189 ?auto_173195 ) ) ( not ( = ?auto_173189 ?auto_173196 ) ) ( not ( = ?auto_173190 ?auto_173191 ) ) ( not ( = ?auto_173190 ?auto_173192 ) ) ( not ( = ?auto_173190 ?auto_173193 ) ) ( not ( = ?auto_173190 ?auto_173194 ) ) ( not ( = ?auto_173190 ?auto_173195 ) ) ( not ( = ?auto_173190 ?auto_173196 ) ) ( not ( = ?auto_173191 ?auto_173192 ) ) ( not ( = ?auto_173191 ?auto_173193 ) ) ( not ( = ?auto_173191 ?auto_173194 ) ) ( not ( = ?auto_173191 ?auto_173195 ) ) ( not ( = ?auto_173191 ?auto_173196 ) ) ( not ( = ?auto_173192 ?auto_173193 ) ) ( not ( = ?auto_173192 ?auto_173194 ) ) ( not ( = ?auto_173192 ?auto_173195 ) ) ( not ( = ?auto_173192 ?auto_173196 ) ) ( not ( = ?auto_173193 ?auto_173194 ) ) ( not ( = ?auto_173193 ?auto_173195 ) ) ( not ( = ?auto_173193 ?auto_173196 ) ) ( not ( = ?auto_173194 ?auto_173195 ) ) ( not ( = ?auto_173194 ?auto_173196 ) ) ( not ( = ?auto_173195 ?auto_173196 ) ) ( CLEAR ?auto_173193 ) ( ON ?auto_173194 ?auto_173195 ) ( CLEAR ?auto_173194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_173187 ?auto_173188 ?auto_173189 ?auto_173190 ?auto_173191 ?auto_173192 ?auto_173193 ?auto_173194 )
      ( MAKE-9PILE ?auto_173187 ?auto_173188 ?auto_173189 ?auto_173190 ?auto_173191 ?auto_173192 ?auto_173193 ?auto_173194 ?auto_173195 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_173206 - BLOCK
      ?auto_173207 - BLOCK
      ?auto_173208 - BLOCK
      ?auto_173209 - BLOCK
      ?auto_173210 - BLOCK
      ?auto_173211 - BLOCK
      ?auto_173212 - BLOCK
      ?auto_173213 - BLOCK
      ?auto_173214 - BLOCK
    )
    :vars
    (
      ?auto_173215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173214 ?auto_173215 ) ( ON-TABLE ?auto_173206 ) ( ON ?auto_173207 ?auto_173206 ) ( ON ?auto_173208 ?auto_173207 ) ( ON ?auto_173209 ?auto_173208 ) ( ON ?auto_173210 ?auto_173209 ) ( ON ?auto_173211 ?auto_173210 ) ( ON ?auto_173212 ?auto_173211 ) ( not ( = ?auto_173206 ?auto_173207 ) ) ( not ( = ?auto_173206 ?auto_173208 ) ) ( not ( = ?auto_173206 ?auto_173209 ) ) ( not ( = ?auto_173206 ?auto_173210 ) ) ( not ( = ?auto_173206 ?auto_173211 ) ) ( not ( = ?auto_173206 ?auto_173212 ) ) ( not ( = ?auto_173206 ?auto_173213 ) ) ( not ( = ?auto_173206 ?auto_173214 ) ) ( not ( = ?auto_173206 ?auto_173215 ) ) ( not ( = ?auto_173207 ?auto_173208 ) ) ( not ( = ?auto_173207 ?auto_173209 ) ) ( not ( = ?auto_173207 ?auto_173210 ) ) ( not ( = ?auto_173207 ?auto_173211 ) ) ( not ( = ?auto_173207 ?auto_173212 ) ) ( not ( = ?auto_173207 ?auto_173213 ) ) ( not ( = ?auto_173207 ?auto_173214 ) ) ( not ( = ?auto_173207 ?auto_173215 ) ) ( not ( = ?auto_173208 ?auto_173209 ) ) ( not ( = ?auto_173208 ?auto_173210 ) ) ( not ( = ?auto_173208 ?auto_173211 ) ) ( not ( = ?auto_173208 ?auto_173212 ) ) ( not ( = ?auto_173208 ?auto_173213 ) ) ( not ( = ?auto_173208 ?auto_173214 ) ) ( not ( = ?auto_173208 ?auto_173215 ) ) ( not ( = ?auto_173209 ?auto_173210 ) ) ( not ( = ?auto_173209 ?auto_173211 ) ) ( not ( = ?auto_173209 ?auto_173212 ) ) ( not ( = ?auto_173209 ?auto_173213 ) ) ( not ( = ?auto_173209 ?auto_173214 ) ) ( not ( = ?auto_173209 ?auto_173215 ) ) ( not ( = ?auto_173210 ?auto_173211 ) ) ( not ( = ?auto_173210 ?auto_173212 ) ) ( not ( = ?auto_173210 ?auto_173213 ) ) ( not ( = ?auto_173210 ?auto_173214 ) ) ( not ( = ?auto_173210 ?auto_173215 ) ) ( not ( = ?auto_173211 ?auto_173212 ) ) ( not ( = ?auto_173211 ?auto_173213 ) ) ( not ( = ?auto_173211 ?auto_173214 ) ) ( not ( = ?auto_173211 ?auto_173215 ) ) ( not ( = ?auto_173212 ?auto_173213 ) ) ( not ( = ?auto_173212 ?auto_173214 ) ) ( not ( = ?auto_173212 ?auto_173215 ) ) ( not ( = ?auto_173213 ?auto_173214 ) ) ( not ( = ?auto_173213 ?auto_173215 ) ) ( not ( = ?auto_173214 ?auto_173215 ) ) ( CLEAR ?auto_173212 ) ( ON ?auto_173213 ?auto_173214 ) ( CLEAR ?auto_173213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_173206 ?auto_173207 ?auto_173208 ?auto_173209 ?auto_173210 ?auto_173211 ?auto_173212 ?auto_173213 )
      ( MAKE-9PILE ?auto_173206 ?auto_173207 ?auto_173208 ?auto_173209 ?auto_173210 ?auto_173211 ?auto_173212 ?auto_173213 ?auto_173214 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_173225 - BLOCK
      ?auto_173226 - BLOCK
      ?auto_173227 - BLOCK
      ?auto_173228 - BLOCK
      ?auto_173229 - BLOCK
      ?auto_173230 - BLOCK
      ?auto_173231 - BLOCK
      ?auto_173232 - BLOCK
      ?auto_173233 - BLOCK
    )
    :vars
    (
      ?auto_173234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173233 ?auto_173234 ) ( ON-TABLE ?auto_173225 ) ( ON ?auto_173226 ?auto_173225 ) ( ON ?auto_173227 ?auto_173226 ) ( ON ?auto_173228 ?auto_173227 ) ( ON ?auto_173229 ?auto_173228 ) ( ON ?auto_173230 ?auto_173229 ) ( not ( = ?auto_173225 ?auto_173226 ) ) ( not ( = ?auto_173225 ?auto_173227 ) ) ( not ( = ?auto_173225 ?auto_173228 ) ) ( not ( = ?auto_173225 ?auto_173229 ) ) ( not ( = ?auto_173225 ?auto_173230 ) ) ( not ( = ?auto_173225 ?auto_173231 ) ) ( not ( = ?auto_173225 ?auto_173232 ) ) ( not ( = ?auto_173225 ?auto_173233 ) ) ( not ( = ?auto_173225 ?auto_173234 ) ) ( not ( = ?auto_173226 ?auto_173227 ) ) ( not ( = ?auto_173226 ?auto_173228 ) ) ( not ( = ?auto_173226 ?auto_173229 ) ) ( not ( = ?auto_173226 ?auto_173230 ) ) ( not ( = ?auto_173226 ?auto_173231 ) ) ( not ( = ?auto_173226 ?auto_173232 ) ) ( not ( = ?auto_173226 ?auto_173233 ) ) ( not ( = ?auto_173226 ?auto_173234 ) ) ( not ( = ?auto_173227 ?auto_173228 ) ) ( not ( = ?auto_173227 ?auto_173229 ) ) ( not ( = ?auto_173227 ?auto_173230 ) ) ( not ( = ?auto_173227 ?auto_173231 ) ) ( not ( = ?auto_173227 ?auto_173232 ) ) ( not ( = ?auto_173227 ?auto_173233 ) ) ( not ( = ?auto_173227 ?auto_173234 ) ) ( not ( = ?auto_173228 ?auto_173229 ) ) ( not ( = ?auto_173228 ?auto_173230 ) ) ( not ( = ?auto_173228 ?auto_173231 ) ) ( not ( = ?auto_173228 ?auto_173232 ) ) ( not ( = ?auto_173228 ?auto_173233 ) ) ( not ( = ?auto_173228 ?auto_173234 ) ) ( not ( = ?auto_173229 ?auto_173230 ) ) ( not ( = ?auto_173229 ?auto_173231 ) ) ( not ( = ?auto_173229 ?auto_173232 ) ) ( not ( = ?auto_173229 ?auto_173233 ) ) ( not ( = ?auto_173229 ?auto_173234 ) ) ( not ( = ?auto_173230 ?auto_173231 ) ) ( not ( = ?auto_173230 ?auto_173232 ) ) ( not ( = ?auto_173230 ?auto_173233 ) ) ( not ( = ?auto_173230 ?auto_173234 ) ) ( not ( = ?auto_173231 ?auto_173232 ) ) ( not ( = ?auto_173231 ?auto_173233 ) ) ( not ( = ?auto_173231 ?auto_173234 ) ) ( not ( = ?auto_173232 ?auto_173233 ) ) ( not ( = ?auto_173232 ?auto_173234 ) ) ( not ( = ?auto_173233 ?auto_173234 ) ) ( ON ?auto_173232 ?auto_173233 ) ( CLEAR ?auto_173230 ) ( ON ?auto_173231 ?auto_173232 ) ( CLEAR ?auto_173231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_173225 ?auto_173226 ?auto_173227 ?auto_173228 ?auto_173229 ?auto_173230 ?auto_173231 )
      ( MAKE-9PILE ?auto_173225 ?auto_173226 ?auto_173227 ?auto_173228 ?auto_173229 ?auto_173230 ?auto_173231 ?auto_173232 ?auto_173233 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_173244 - BLOCK
      ?auto_173245 - BLOCK
      ?auto_173246 - BLOCK
      ?auto_173247 - BLOCK
      ?auto_173248 - BLOCK
      ?auto_173249 - BLOCK
      ?auto_173250 - BLOCK
      ?auto_173251 - BLOCK
      ?auto_173252 - BLOCK
    )
    :vars
    (
      ?auto_173253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173252 ?auto_173253 ) ( ON-TABLE ?auto_173244 ) ( ON ?auto_173245 ?auto_173244 ) ( ON ?auto_173246 ?auto_173245 ) ( ON ?auto_173247 ?auto_173246 ) ( ON ?auto_173248 ?auto_173247 ) ( ON ?auto_173249 ?auto_173248 ) ( not ( = ?auto_173244 ?auto_173245 ) ) ( not ( = ?auto_173244 ?auto_173246 ) ) ( not ( = ?auto_173244 ?auto_173247 ) ) ( not ( = ?auto_173244 ?auto_173248 ) ) ( not ( = ?auto_173244 ?auto_173249 ) ) ( not ( = ?auto_173244 ?auto_173250 ) ) ( not ( = ?auto_173244 ?auto_173251 ) ) ( not ( = ?auto_173244 ?auto_173252 ) ) ( not ( = ?auto_173244 ?auto_173253 ) ) ( not ( = ?auto_173245 ?auto_173246 ) ) ( not ( = ?auto_173245 ?auto_173247 ) ) ( not ( = ?auto_173245 ?auto_173248 ) ) ( not ( = ?auto_173245 ?auto_173249 ) ) ( not ( = ?auto_173245 ?auto_173250 ) ) ( not ( = ?auto_173245 ?auto_173251 ) ) ( not ( = ?auto_173245 ?auto_173252 ) ) ( not ( = ?auto_173245 ?auto_173253 ) ) ( not ( = ?auto_173246 ?auto_173247 ) ) ( not ( = ?auto_173246 ?auto_173248 ) ) ( not ( = ?auto_173246 ?auto_173249 ) ) ( not ( = ?auto_173246 ?auto_173250 ) ) ( not ( = ?auto_173246 ?auto_173251 ) ) ( not ( = ?auto_173246 ?auto_173252 ) ) ( not ( = ?auto_173246 ?auto_173253 ) ) ( not ( = ?auto_173247 ?auto_173248 ) ) ( not ( = ?auto_173247 ?auto_173249 ) ) ( not ( = ?auto_173247 ?auto_173250 ) ) ( not ( = ?auto_173247 ?auto_173251 ) ) ( not ( = ?auto_173247 ?auto_173252 ) ) ( not ( = ?auto_173247 ?auto_173253 ) ) ( not ( = ?auto_173248 ?auto_173249 ) ) ( not ( = ?auto_173248 ?auto_173250 ) ) ( not ( = ?auto_173248 ?auto_173251 ) ) ( not ( = ?auto_173248 ?auto_173252 ) ) ( not ( = ?auto_173248 ?auto_173253 ) ) ( not ( = ?auto_173249 ?auto_173250 ) ) ( not ( = ?auto_173249 ?auto_173251 ) ) ( not ( = ?auto_173249 ?auto_173252 ) ) ( not ( = ?auto_173249 ?auto_173253 ) ) ( not ( = ?auto_173250 ?auto_173251 ) ) ( not ( = ?auto_173250 ?auto_173252 ) ) ( not ( = ?auto_173250 ?auto_173253 ) ) ( not ( = ?auto_173251 ?auto_173252 ) ) ( not ( = ?auto_173251 ?auto_173253 ) ) ( not ( = ?auto_173252 ?auto_173253 ) ) ( ON ?auto_173251 ?auto_173252 ) ( CLEAR ?auto_173249 ) ( ON ?auto_173250 ?auto_173251 ) ( CLEAR ?auto_173250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_173244 ?auto_173245 ?auto_173246 ?auto_173247 ?auto_173248 ?auto_173249 ?auto_173250 )
      ( MAKE-9PILE ?auto_173244 ?auto_173245 ?auto_173246 ?auto_173247 ?auto_173248 ?auto_173249 ?auto_173250 ?auto_173251 ?auto_173252 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_173263 - BLOCK
      ?auto_173264 - BLOCK
      ?auto_173265 - BLOCK
      ?auto_173266 - BLOCK
      ?auto_173267 - BLOCK
      ?auto_173268 - BLOCK
      ?auto_173269 - BLOCK
      ?auto_173270 - BLOCK
      ?auto_173271 - BLOCK
    )
    :vars
    (
      ?auto_173272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173271 ?auto_173272 ) ( ON-TABLE ?auto_173263 ) ( ON ?auto_173264 ?auto_173263 ) ( ON ?auto_173265 ?auto_173264 ) ( ON ?auto_173266 ?auto_173265 ) ( ON ?auto_173267 ?auto_173266 ) ( not ( = ?auto_173263 ?auto_173264 ) ) ( not ( = ?auto_173263 ?auto_173265 ) ) ( not ( = ?auto_173263 ?auto_173266 ) ) ( not ( = ?auto_173263 ?auto_173267 ) ) ( not ( = ?auto_173263 ?auto_173268 ) ) ( not ( = ?auto_173263 ?auto_173269 ) ) ( not ( = ?auto_173263 ?auto_173270 ) ) ( not ( = ?auto_173263 ?auto_173271 ) ) ( not ( = ?auto_173263 ?auto_173272 ) ) ( not ( = ?auto_173264 ?auto_173265 ) ) ( not ( = ?auto_173264 ?auto_173266 ) ) ( not ( = ?auto_173264 ?auto_173267 ) ) ( not ( = ?auto_173264 ?auto_173268 ) ) ( not ( = ?auto_173264 ?auto_173269 ) ) ( not ( = ?auto_173264 ?auto_173270 ) ) ( not ( = ?auto_173264 ?auto_173271 ) ) ( not ( = ?auto_173264 ?auto_173272 ) ) ( not ( = ?auto_173265 ?auto_173266 ) ) ( not ( = ?auto_173265 ?auto_173267 ) ) ( not ( = ?auto_173265 ?auto_173268 ) ) ( not ( = ?auto_173265 ?auto_173269 ) ) ( not ( = ?auto_173265 ?auto_173270 ) ) ( not ( = ?auto_173265 ?auto_173271 ) ) ( not ( = ?auto_173265 ?auto_173272 ) ) ( not ( = ?auto_173266 ?auto_173267 ) ) ( not ( = ?auto_173266 ?auto_173268 ) ) ( not ( = ?auto_173266 ?auto_173269 ) ) ( not ( = ?auto_173266 ?auto_173270 ) ) ( not ( = ?auto_173266 ?auto_173271 ) ) ( not ( = ?auto_173266 ?auto_173272 ) ) ( not ( = ?auto_173267 ?auto_173268 ) ) ( not ( = ?auto_173267 ?auto_173269 ) ) ( not ( = ?auto_173267 ?auto_173270 ) ) ( not ( = ?auto_173267 ?auto_173271 ) ) ( not ( = ?auto_173267 ?auto_173272 ) ) ( not ( = ?auto_173268 ?auto_173269 ) ) ( not ( = ?auto_173268 ?auto_173270 ) ) ( not ( = ?auto_173268 ?auto_173271 ) ) ( not ( = ?auto_173268 ?auto_173272 ) ) ( not ( = ?auto_173269 ?auto_173270 ) ) ( not ( = ?auto_173269 ?auto_173271 ) ) ( not ( = ?auto_173269 ?auto_173272 ) ) ( not ( = ?auto_173270 ?auto_173271 ) ) ( not ( = ?auto_173270 ?auto_173272 ) ) ( not ( = ?auto_173271 ?auto_173272 ) ) ( ON ?auto_173270 ?auto_173271 ) ( ON ?auto_173269 ?auto_173270 ) ( CLEAR ?auto_173267 ) ( ON ?auto_173268 ?auto_173269 ) ( CLEAR ?auto_173268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173263 ?auto_173264 ?auto_173265 ?auto_173266 ?auto_173267 ?auto_173268 )
      ( MAKE-9PILE ?auto_173263 ?auto_173264 ?auto_173265 ?auto_173266 ?auto_173267 ?auto_173268 ?auto_173269 ?auto_173270 ?auto_173271 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_173282 - BLOCK
      ?auto_173283 - BLOCK
      ?auto_173284 - BLOCK
      ?auto_173285 - BLOCK
      ?auto_173286 - BLOCK
      ?auto_173287 - BLOCK
      ?auto_173288 - BLOCK
      ?auto_173289 - BLOCK
      ?auto_173290 - BLOCK
    )
    :vars
    (
      ?auto_173291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173290 ?auto_173291 ) ( ON-TABLE ?auto_173282 ) ( ON ?auto_173283 ?auto_173282 ) ( ON ?auto_173284 ?auto_173283 ) ( ON ?auto_173285 ?auto_173284 ) ( ON ?auto_173286 ?auto_173285 ) ( not ( = ?auto_173282 ?auto_173283 ) ) ( not ( = ?auto_173282 ?auto_173284 ) ) ( not ( = ?auto_173282 ?auto_173285 ) ) ( not ( = ?auto_173282 ?auto_173286 ) ) ( not ( = ?auto_173282 ?auto_173287 ) ) ( not ( = ?auto_173282 ?auto_173288 ) ) ( not ( = ?auto_173282 ?auto_173289 ) ) ( not ( = ?auto_173282 ?auto_173290 ) ) ( not ( = ?auto_173282 ?auto_173291 ) ) ( not ( = ?auto_173283 ?auto_173284 ) ) ( not ( = ?auto_173283 ?auto_173285 ) ) ( not ( = ?auto_173283 ?auto_173286 ) ) ( not ( = ?auto_173283 ?auto_173287 ) ) ( not ( = ?auto_173283 ?auto_173288 ) ) ( not ( = ?auto_173283 ?auto_173289 ) ) ( not ( = ?auto_173283 ?auto_173290 ) ) ( not ( = ?auto_173283 ?auto_173291 ) ) ( not ( = ?auto_173284 ?auto_173285 ) ) ( not ( = ?auto_173284 ?auto_173286 ) ) ( not ( = ?auto_173284 ?auto_173287 ) ) ( not ( = ?auto_173284 ?auto_173288 ) ) ( not ( = ?auto_173284 ?auto_173289 ) ) ( not ( = ?auto_173284 ?auto_173290 ) ) ( not ( = ?auto_173284 ?auto_173291 ) ) ( not ( = ?auto_173285 ?auto_173286 ) ) ( not ( = ?auto_173285 ?auto_173287 ) ) ( not ( = ?auto_173285 ?auto_173288 ) ) ( not ( = ?auto_173285 ?auto_173289 ) ) ( not ( = ?auto_173285 ?auto_173290 ) ) ( not ( = ?auto_173285 ?auto_173291 ) ) ( not ( = ?auto_173286 ?auto_173287 ) ) ( not ( = ?auto_173286 ?auto_173288 ) ) ( not ( = ?auto_173286 ?auto_173289 ) ) ( not ( = ?auto_173286 ?auto_173290 ) ) ( not ( = ?auto_173286 ?auto_173291 ) ) ( not ( = ?auto_173287 ?auto_173288 ) ) ( not ( = ?auto_173287 ?auto_173289 ) ) ( not ( = ?auto_173287 ?auto_173290 ) ) ( not ( = ?auto_173287 ?auto_173291 ) ) ( not ( = ?auto_173288 ?auto_173289 ) ) ( not ( = ?auto_173288 ?auto_173290 ) ) ( not ( = ?auto_173288 ?auto_173291 ) ) ( not ( = ?auto_173289 ?auto_173290 ) ) ( not ( = ?auto_173289 ?auto_173291 ) ) ( not ( = ?auto_173290 ?auto_173291 ) ) ( ON ?auto_173289 ?auto_173290 ) ( ON ?auto_173288 ?auto_173289 ) ( CLEAR ?auto_173286 ) ( ON ?auto_173287 ?auto_173288 ) ( CLEAR ?auto_173287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173282 ?auto_173283 ?auto_173284 ?auto_173285 ?auto_173286 ?auto_173287 )
      ( MAKE-9PILE ?auto_173282 ?auto_173283 ?auto_173284 ?auto_173285 ?auto_173286 ?auto_173287 ?auto_173288 ?auto_173289 ?auto_173290 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_173301 - BLOCK
      ?auto_173302 - BLOCK
      ?auto_173303 - BLOCK
      ?auto_173304 - BLOCK
      ?auto_173305 - BLOCK
      ?auto_173306 - BLOCK
      ?auto_173307 - BLOCK
      ?auto_173308 - BLOCK
      ?auto_173309 - BLOCK
    )
    :vars
    (
      ?auto_173310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173309 ?auto_173310 ) ( ON-TABLE ?auto_173301 ) ( ON ?auto_173302 ?auto_173301 ) ( ON ?auto_173303 ?auto_173302 ) ( ON ?auto_173304 ?auto_173303 ) ( not ( = ?auto_173301 ?auto_173302 ) ) ( not ( = ?auto_173301 ?auto_173303 ) ) ( not ( = ?auto_173301 ?auto_173304 ) ) ( not ( = ?auto_173301 ?auto_173305 ) ) ( not ( = ?auto_173301 ?auto_173306 ) ) ( not ( = ?auto_173301 ?auto_173307 ) ) ( not ( = ?auto_173301 ?auto_173308 ) ) ( not ( = ?auto_173301 ?auto_173309 ) ) ( not ( = ?auto_173301 ?auto_173310 ) ) ( not ( = ?auto_173302 ?auto_173303 ) ) ( not ( = ?auto_173302 ?auto_173304 ) ) ( not ( = ?auto_173302 ?auto_173305 ) ) ( not ( = ?auto_173302 ?auto_173306 ) ) ( not ( = ?auto_173302 ?auto_173307 ) ) ( not ( = ?auto_173302 ?auto_173308 ) ) ( not ( = ?auto_173302 ?auto_173309 ) ) ( not ( = ?auto_173302 ?auto_173310 ) ) ( not ( = ?auto_173303 ?auto_173304 ) ) ( not ( = ?auto_173303 ?auto_173305 ) ) ( not ( = ?auto_173303 ?auto_173306 ) ) ( not ( = ?auto_173303 ?auto_173307 ) ) ( not ( = ?auto_173303 ?auto_173308 ) ) ( not ( = ?auto_173303 ?auto_173309 ) ) ( not ( = ?auto_173303 ?auto_173310 ) ) ( not ( = ?auto_173304 ?auto_173305 ) ) ( not ( = ?auto_173304 ?auto_173306 ) ) ( not ( = ?auto_173304 ?auto_173307 ) ) ( not ( = ?auto_173304 ?auto_173308 ) ) ( not ( = ?auto_173304 ?auto_173309 ) ) ( not ( = ?auto_173304 ?auto_173310 ) ) ( not ( = ?auto_173305 ?auto_173306 ) ) ( not ( = ?auto_173305 ?auto_173307 ) ) ( not ( = ?auto_173305 ?auto_173308 ) ) ( not ( = ?auto_173305 ?auto_173309 ) ) ( not ( = ?auto_173305 ?auto_173310 ) ) ( not ( = ?auto_173306 ?auto_173307 ) ) ( not ( = ?auto_173306 ?auto_173308 ) ) ( not ( = ?auto_173306 ?auto_173309 ) ) ( not ( = ?auto_173306 ?auto_173310 ) ) ( not ( = ?auto_173307 ?auto_173308 ) ) ( not ( = ?auto_173307 ?auto_173309 ) ) ( not ( = ?auto_173307 ?auto_173310 ) ) ( not ( = ?auto_173308 ?auto_173309 ) ) ( not ( = ?auto_173308 ?auto_173310 ) ) ( not ( = ?auto_173309 ?auto_173310 ) ) ( ON ?auto_173308 ?auto_173309 ) ( ON ?auto_173307 ?auto_173308 ) ( ON ?auto_173306 ?auto_173307 ) ( CLEAR ?auto_173304 ) ( ON ?auto_173305 ?auto_173306 ) ( CLEAR ?auto_173305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173301 ?auto_173302 ?auto_173303 ?auto_173304 ?auto_173305 )
      ( MAKE-9PILE ?auto_173301 ?auto_173302 ?auto_173303 ?auto_173304 ?auto_173305 ?auto_173306 ?auto_173307 ?auto_173308 ?auto_173309 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_173320 - BLOCK
      ?auto_173321 - BLOCK
      ?auto_173322 - BLOCK
      ?auto_173323 - BLOCK
      ?auto_173324 - BLOCK
      ?auto_173325 - BLOCK
      ?auto_173326 - BLOCK
      ?auto_173327 - BLOCK
      ?auto_173328 - BLOCK
    )
    :vars
    (
      ?auto_173329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173328 ?auto_173329 ) ( ON-TABLE ?auto_173320 ) ( ON ?auto_173321 ?auto_173320 ) ( ON ?auto_173322 ?auto_173321 ) ( ON ?auto_173323 ?auto_173322 ) ( not ( = ?auto_173320 ?auto_173321 ) ) ( not ( = ?auto_173320 ?auto_173322 ) ) ( not ( = ?auto_173320 ?auto_173323 ) ) ( not ( = ?auto_173320 ?auto_173324 ) ) ( not ( = ?auto_173320 ?auto_173325 ) ) ( not ( = ?auto_173320 ?auto_173326 ) ) ( not ( = ?auto_173320 ?auto_173327 ) ) ( not ( = ?auto_173320 ?auto_173328 ) ) ( not ( = ?auto_173320 ?auto_173329 ) ) ( not ( = ?auto_173321 ?auto_173322 ) ) ( not ( = ?auto_173321 ?auto_173323 ) ) ( not ( = ?auto_173321 ?auto_173324 ) ) ( not ( = ?auto_173321 ?auto_173325 ) ) ( not ( = ?auto_173321 ?auto_173326 ) ) ( not ( = ?auto_173321 ?auto_173327 ) ) ( not ( = ?auto_173321 ?auto_173328 ) ) ( not ( = ?auto_173321 ?auto_173329 ) ) ( not ( = ?auto_173322 ?auto_173323 ) ) ( not ( = ?auto_173322 ?auto_173324 ) ) ( not ( = ?auto_173322 ?auto_173325 ) ) ( not ( = ?auto_173322 ?auto_173326 ) ) ( not ( = ?auto_173322 ?auto_173327 ) ) ( not ( = ?auto_173322 ?auto_173328 ) ) ( not ( = ?auto_173322 ?auto_173329 ) ) ( not ( = ?auto_173323 ?auto_173324 ) ) ( not ( = ?auto_173323 ?auto_173325 ) ) ( not ( = ?auto_173323 ?auto_173326 ) ) ( not ( = ?auto_173323 ?auto_173327 ) ) ( not ( = ?auto_173323 ?auto_173328 ) ) ( not ( = ?auto_173323 ?auto_173329 ) ) ( not ( = ?auto_173324 ?auto_173325 ) ) ( not ( = ?auto_173324 ?auto_173326 ) ) ( not ( = ?auto_173324 ?auto_173327 ) ) ( not ( = ?auto_173324 ?auto_173328 ) ) ( not ( = ?auto_173324 ?auto_173329 ) ) ( not ( = ?auto_173325 ?auto_173326 ) ) ( not ( = ?auto_173325 ?auto_173327 ) ) ( not ( = ?auto_173325 ?auto_173328 ) ) ( not ( = ?auto_173325 ?auto_173329 ) ) ( not ( = ?auto_173326 ?auto_173327 ) ) ( not ( = ?auto_173326 ?auto_173328 ) ) ( not ( = ?auto_173326 ?auto_173329 ) ) ( not ( = ?auto_173327 ?auto_173328 ) ) ( not ( = ?auto_173327 ?auto_173329 ) ) ( not ( = ?auto_173328 ?auto_173329 ) ) ( ON ?auto_173327 ?auto_173328 ) ( ON ?auto_173326 ?auto_173327 ) ( ON ?auto_173325 ?auto_173326 ) ( CLEAR ?auto_173323 ) ( ON ?auto_173324 ?auto_173325 ) ( CLEAR ?auto_173324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173320 ?auto_173321 ?auto_173322 ?auto_173323 ?auto_173324 )
      ( MAKE-9PILE ?auto_173320 ?auto_173321 ?auto_173322 ?auto_173323 ?auto_173324 ?auto_173325 ?auto_173326 ?auto_173327 ?auto_173328 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_173339 - BLOCK
      ?auto_173340 - BLOCK
      ?auto_173341 - BLOCK
      ?auto_173342 - BLOCK
      ?auto_173343 - BLOCK
      ?auto_173344 - BLOCK
      ?auto_173345 - BLOCK
      ?auto_173346 - BLOCK
      ?auto_173347 - BLOCK
    )
    :vars
    (
      ?auto_173348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173347 ?auto_173348 ) ( ON-TABLE ?auto_173339 ) ( ON ?auto_173340 ?auto_173339 ) ( ON ?auto_173341 ?auto_173340 ) ( not ( = ?auto_173339 ?auto_173340 ) ) ( not ( = ?auto_173339 ?auto_173341 ) ) ( not ( = ?auto_173339 ?auto_173342 ) ) ( not ( = ?auto_173339 ?auto_173343 ) ) ( not ( = ?auto_173339 ?auto_173344 ) ) ( not ( = ?auto_173339 ?auto_173345 ) ) ( not ( = ?auto_173339 ?auto_173346 ) ) ( not ( = ?auto_173339 ?auto_173347 ) ) ( not ( = ?auto_173339 ?auto_173348 ) ) ( not ( = ?auto_173340 ?auto_173341 ) ) ( not ( = ?auto_173340 ?auto_173342 ) ) ( not ( = ?auto_173340 ?auto_173343 ) ) ( not ( = ?auto_173340 ?auto_173344 ) ) ( not ( = ?auto_173340 ?auto_173345 ) ) ( not ( = ?auto_173340 ?auto_173346 ) ) ( not ( = ?auto_173340 ?auto_173347 ) ) ( not ( = ?auto_173340 ?auto_173348 ) ) ( not ( = ?auto_173341 ?auto_173342 ) ) ( not ( = ?auto_173341 ?auto_173343 ) ) ( not ( = ?auto_173341 ?auto_173344 ) ) ( not ( = ?auto_173341 ?auto_173345 ) ) ( not ( = ?auto_173341 ?auto_173346 ) ) ( not ( = ?auto_173341 ?auto_173347 ) ) ( not ( = ?auto_173341 ?auto_173348 ) ) ( not ( = ?auto_173342 ?auto_173343 ) ) ( not ( = ?auto_173342 ?auto_173344 ) ) ( not ( = ?auto_173342 ?auto_173345 ) ) ( not ( = ?auto_173342 ?auto_173346 ) ) ( not ( = ?auto_173342 ?auto_173347 ) ) ( not ( = ?auto_173342 ?auto_173348 ) ) ( not ( = ?auto_173343 ?auto_173344 ) ) ( not ( = ?auto_173343 ?auto_173345 ) ) ( not ( = ?auto_173343 ?auto_173346 ) ) ( not ( = ?auto_173343 ?auto_173347 ) ) ( not ( = ?auto_173343 ?auto_173348 ) ) ( not ( = ?auto_173344 ?auto_173345 ) ) ( not ( = ?auto_173344 ?auto_173346 ) ) ( not ( = ?auto_173344 ?auto_173347 ) ) ( not ( = ?auto_173344 ?auto_173348 ) ) ( not ( = ?auto_173345 ?auto_173346 ) ) ( not ( = ?auto_173345 ?auto_173347 ) ) ( not ( = ?auto_173345 ?auto_173348 ) ) ( not ( = ?auto_173346 ?auto_173347 ) ) ( not ( = ?auto_173346 ?auto_173348 ) ) ( not ( = ?auto_173347 ?auto_173348 ) ) ( ON ?auto_173346 ?auto_173347 ) ( ON ?auto_173345 ?auto_173346 ) ( ON ?auto_173344 ?auto_173345 ) ( ON ?auto_173343 ?auto_173344 ) ( CLEAR ?auto_173341 ) ( ON ?auto_173342 ?auto_173343 ) ( CLEAR ?auto_173342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173339 ?auto_173340 ?auto_173341 ?auto_173342 )
      ( MAKE-9PILE ?auto_173339 ?auto_173340 ?auto_173341 ?auto_173342 ?auto_173343 ?auto_173344 ?auto_173345 ?auto_173346 ?auto_173347 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_173358 - BLOCK
      ?auto_173359 - BLOCK
      ?auto_173360 - BLOCK
      ?auto_173361 - BLOCK
      ?auto_173362 - BLOCK
      ?auto_173363 - BLOCK
      ?auto_173364 - BLOCK
      ?auto_173365 - BLOCK
      ?auto_173366 - BLOCK
    )
    :vars
    (
      ?auto_173367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173366 ?auto_173367 ) ( ON-TABLE ?auto_173358 ) ( ON ?auto_173359 ?auto_173358 ) ( ON ?auto_173360 ?auto_173359 ) ( not ( = ?auto_173358 ?auto_173359 ) ) ( not ( = ?auto_173358 ?auto_173360 ) ) ( not ( = ?auto_173358 ?auto_173361 ) ) ( not ( = ?auto_173358 ?auto_173362 ) ) ( not ( = ?auto_173358 ?auto_173363 ) ) ( not ( = ?auto_173358 ?auto_173364 ) ) ( not ( = ?auto_173358 ?auto_173365 ) ) ( not ( = ?auto_173358 ?auto_173366 ) ) ( not ( = ?auto_173358 ?auto_173367 ) ) ( not ( = ?auto_173359 ?auto_173360 ) ) ( not ( = ?auto_173359 ?auto_173361 ) ) ( not ( = ?auto_173359 ?auto_173362 ) ) ( not ( = ?auto_173359 ?auto_173363 ) ) ( not ( = ?auto_173359 ?auto_173364 ) ) ( not ( = ?auto_173359 ?auto_173365 ) ) ( not ( = ?auto_173359 ?auto_173366 ) ) ( not ( = ?auto_173359 ?auto_173367 ) ) ( not ( = ?auto_173360 ?auto_173361 ) ) ( not ( = ?auto_173360 ?auto_173362 ) ) ( not ( = ?auto_173360 ?auto_173363 ) ) ( not ( = ?auto_173360 ?auto_173364 ) ) ( not ( = ?auto_173360 ?auto_173365 ) ) ( not ( = ?auto_173360 ?auto_173366 ) ) ( not ( = ?auto_173360 ?auto_173367 ) ) ( not ( = ?auto_173361 ?auto_173362 ) ) ( not ( = ?auto_173361 ?auto_173363 ) ) ( not ( = ?auto_173361 ?auto_173364 ) ) ( not ( = ?auto_173361 ?auto_173365 ) ) ( not ( = ?auto_173361 ?auto_173366 ) ) ( not ( = ?auto_173361 ?auto_173367 ) ) ( not ( = ?auto_173362 ?auto_173363 ) ) ( not ( = ?auto_173362 ?auto_173364 ) ) ( not ( = ?auto_173362 ?auto_173365 ) ) ( not ( = ?auto_173362 ?auto_173366 ) ) ( not ( = ?auto_173362 ?auto_173367 ) ) ( not ( = ?auto_173363 ?auto_173364 ) ) ( not ( = ?auto_173363 ?auto_173365 ) ) ( not ( = ?auto_173363 ?auto_173366 ) ) ( not ( = ?auto_173363 ?auto_173367 ) ) ( not ( = ?auto_173364 ?auto_173365 ) ) ( not ( = ?auto_173364 ?auto_173366 ) ) ( not ( = ?auto_173364 ?auto_173367 ) ) ( not ( = ?auto_173365 ?auto_173366 ) ) ( not ( = ?auto_173365 ?auto_173367 ) ) ( not ( = ?auto_173366 ?auto_173367 ) ) ( ON ?auto_173365 ?auto_173366 ) ( ON ?auto_173364 ?auto_173365 ) ( ON ?auto_173363 ?auto_173364 ) ( ON ?auto_173362 ?auto_173363 ) ( CLEAR ?auto_173360 ) ( ON ?auto_173361 ?auto_173362 ) ( CLEAR ?auto_173361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173358 ?auto_173359 ?auto_173360 ?auto_173361 )
      ( MAKE-9PILE ?auto_173358 ?auto_173359 ?auto_173360 ?auto_173361 ?auto_173362 ?auto_173363 ?auto_173364 ?auto_173365 ?auto_173366 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_173377 - BLOCK
      ?auto_173378 - BLOCK
      ?auto_173379 - BLOCK
      ?auto_173380 - BLOCK
      ?auto_173381 - BLOCK
      ?auto_173382 - BLOCK
      ?auto_173383 - BLOCK
      ?auto_173384 - BLOCK
      ?auto_173385 - BLOCK
    )
    :vars
    (
      ?auto_173386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173385 ?auto_173386 ) ( ON-TABLE ?auto_173377 ) ( ON ?auto_173378 ?auto_173377 ) ( not ( = ?auto_173377 ?auto_173378 ) ) ( not ( = ?auto_173377 ?auto_173379 ) ) ( not ( = ?auto_173377 ?auto_173380 ) ) ( not ( = ?auto_173377 ?auto_173381 ) ) ( not ( = ?auto_173377 ?auto_173382 ) ) ( not ( = ?auto_173377 ?auto_173383 ) ) ( not ( = ?auto_173377 ?auto_173384 ) ) ( not ( = ?auto_173377 ?auto_173385 ) ) ( not ( = ?auto_173377 ?auto_173386 ) ) ( not ( = ?auto_173378 ?auto_173379 ) ) ( not ( = ?auto_173378 ?auto_173380 ) ) ( not ( = ?auto_173378 ?auto_173381 ) ) ( not ( = ?auto_173378 ?auto_173382 ) ) ( not ( = ?auto_173378 ?auto_173383 ) ) ( not ( = ?auto_173378 ?auto_173384 ) ) ( not ( = ?auto_173378 ?auto_173385 ) ) ( not ( = ?auto_173378 ?auto_173386 ) ) ( not ( = ?auto_173379 ?auto_173380 ) ) ( not ( = ?auto_173379 ?auto_173381 ) ) ( not ( = ?auto_173379 ?auto_173382 ) ) ( not ( = ?auto_173379 ?auto_173383 ) ) ( not ( = ?auto_173379 ?auto_173384 ) ) ( not ( = ?auto_173379 ?auto_173385 ) ) ( not ( = ?auto_173379 ?auto_173386 ) ) ( not ( = ?auto_173380 ?auto_173381 ) ) ( not ( = ?auto_173380 ?auto_173382 ) ) ( not ( = ?auto_173380 ?auto_173383 ) ) ( not ( = ?auto_173380 ?auto_173384 ) ) ( not ( = ?auto_173380 ?auto_173385 ) ) ( not ( = ?auto_173380 ?auto_173386 ) ) ( not ( = ?auto_173381 ?auto_173382 ) ) ( not ( = ?auto_173381 ?auto_173383 ) ) ( not ( = ?auto_173381 ?auto_173384 ) ) ( not ( = ?auto_173381 ?auto_173385 ) ) ( not ( = ?auto_173381 ?auto_173386 ) ) ( not ( = ?auto_173382 ?auto_173383 ) ) ( not ( = ?auto_173382 ?auto_173384 ) ) ( not ( = ?auto_173382 ?auto_173385 ) ) ( not ( = ?auto_173382 ?auto_173386 ) ) ( not ( = ?auto_173383 ?auto_173384 ) ) ( not ( = ?auto_173383 ?auto_173385 ) ) ( not ( = ?auto_173383 ?auto_173386 ) ) ( not ( = ?auto_173384 ?auto_173385 ) ) ( not ( = ?auto_173384 ?auto_173386 ) ) ( not ( = ?auto_173385 ?auto_173386 ) ) ( ON ?auto_173384 ?auto_173385 ) ( ON ?auto_173383 ?auto_173384 ) ( ON ?auto_173382 ?auto_173383 ) ( ON ?auto_173381 ?auto_173382 ) ( ON ?auto_173380 ?auto_173381 ) ( CLEAR ?auto_173378 ) ( ON ?auto_173379 ?auto_173380 ) ( CLEAR ?auto_173379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173377 ?auto_173378 ?auto_173379 )
      ( MAKE-9PILE ?auto_173377 ?auto_173378 ?auto_173379 ?auto_173380 ?auto_173381 ?auto_173382 ?auto_173383 ?auto_173384 ?auto_173385 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_173396 - BLOCK
      ?auto_173397 - BLOCK
      ?auto_173398 - BLOCK
      ?auto_173399 - BLOCK
      ?auto_173400 - BLOCK
      ?auto_173401 - BLOCK
      ?auto_173402 - BLOCK
      ?auto_173403 - BLOCK
      ?auto_173404 - BLOCK
    )
    :vars
    (
      ?auto_173405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173404 ?auto_173405 ) ( ON-TABLE ?auto_173396 ) ( ON ?auto_173397 ?auto_173396 ) ( not ( = ?auto_173396 ?auto_173397 ) ) ( not ( = ?auto_173396 ?auto_173398 ) ) ( not ( = ?auto_173396 ?auto_173399 ) ) ( not ( = ?auto_173396 ?auto_173400 ) ) ( not ( = ?auto_173396 ?auto_173401 ) ) ( not ( = ?auto_173396 ?auto_173402 ) ) ( not ( = ?auto_173396 ?auto_173403 ) ) ( not ( = ?auto_173396 ?auto_173404 ) ) ( not ( = ?auto_173396 ?auto_173405 ) ) ( not ( = ?auto_173397 ?auto_173398 ) ) ( not ( = ?auto_173397 ?auto_173399 ) ) ( not ( = ?auto_173397 ?auto_173400 ) ) ( not ( = ?auto_173397 ?auto_173401 ) ) ( not ( = ?auto_173397 ?auto_173402 ) ) ( not ( = ?auto_173397 ?auto_173403 ) ) ( not ( = ?auto_173397 ?auto_173404 ) ) ( not ( = ?auto_173397 ?auto_173405 ) ) ( not ( = ?auto_173398 ?auto_173399 ) ) ( not ( = ?auto_173398 ?auto_173400 ) ) ( not ( = ?auto_173398 ?auto_173401 ) ) ( not ( = ?auto_173398 ?auto_173402 ) ) ( not ( = ?auto_173398 ?auto_173403 ) ) ( not ( = ?auto_173398 ?auto_173404 ) ) ( not ( = ?auto_173398 ?auto_173405 ) ) ( not ( = ?auto_173399 ?auto_173400 ) ) ( not ( = ?auto_173399 ?auto_173401 ) ) ( not ( = ?auto_173399 ?auto_173402 ) ) ( not ( = ?auto_173399 ?auto_173403 ) ) ( not ( = ?auto_173399 ?auto_173404 ) ) ( not ( = ?auto_173399 ?auto_173405 ) ) ( not ( = ?auto_173400 ?auto_173401 ) ) ( not ( = ?auto_173400 ?auto_173402 ) ) ( not ( = ?auto_173400 ?auto_173403 ) ) ( not ( = ?auto_173400 ?auto_173404 ) ) ( not ( = ?auto_173400 ?auto_173405 ) ) ( not ( = ?auto_173401 ?auto_173402 ) ) ( not ( = ?auto_173401 ?auto_173403 ) ) ( not ( = ?auto_173401 ?auto_173404 ) ) ( not ( = ?auto_173401 ?auto_173405 ) ) ( not ( = ?auto_173402 ?auto_173403 ) ) ( not ( = ?auto_173402 ?auto_173404 ) ) ( not ( = ?auto_173402 ?auto_173405 ) ) ( not ( = ?auto_173403 ?auto_173404 ) ) ( not ( = ?auto_173403 ?auto_173405 ) ) ( not ( = ?auto_173404 ?auto_173405 ) ) ( ON ?auto_173403 ?auto_173404 ) ( ON ?auto_173402 ?auto_173403 ) ( ON ?auto_173401 ?auto_173402 ) ( ON ?auto_173400 ?auto_173401 ) ( ON ?auto_173399 ?auto_173400 ) ( CLEAR ?auto_173397 ) ( ON ?auto_173398 ?auto_173399 ) ( CLEAR ?auto_173398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173396 ?auto_173397 ?auto_173398 )
      ( MAKE-9PILE ?auto_173396 ?auto_173397 ?auto_173398 ?auto_173399 ?auto_173400 ?auto_173401 ?auto_173402 ?auto_173403 ?auto_173404 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_173415 - BLOCK
      ?auto_173416 - BLOCK
      ?auto_173417 - BLOCK
      ?auto_173418 - BLOCK
      ?auto_173419 - BLOCK
      ?auto_173420 - BLOCK
      ?auto_173421 - BLOCK
      ?auto_173422 - BLOCK
      ?auto_173423 - BLOCK
    )
    :vars
    (
      ?auto_173424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173423 ?auto_173424 ) ( ON-TABLE ?auto_173415 ) ( not ( = ?auto_173415 ?auto_173416 ) ) ( not ( = ?auto_173415 ?auto_173417 ) ) ( not ( = ?auto_173415 ?auto_173418 ) ) ( not ( = ?auto_173415 ?auto_173419 ) ) ( not ( = ?auto_173415 ?auto_173420 ) ) ( not ( = ?auto_173415 ?auto_173421 ) ) ( not ( = ?auto_173415 ?auto_173422 ) ) ( not ( = ?auto_173415 ?auto_173423 ) ) ( not ( = ?auto_173415 ?auto_173424 ) ) ( not ( = ?auto_173416 ?auto_173417 ) ) ( not ( = ?auto_173416 ?auto_173418 ) ) ( not ( = ?auto_173416 ?auto_173419 ) ) ( not ( = ?auto_173416 ?auto_173420 ) ) ( not ( = ?auto_173416 ?auto_173421 ) ) ( not ( = ?auto_173416 ?auto_173422 ) ) ( not ( = ?auto_173416 ?auto_173423 ) ) ( not ( = ?auto_173416 ?auto_173424 ) ) ( not ( = ?auto_173417 ?auto_173418 ) ) ( not ( = ?auto_173417 ?auto_173419 ) ) ( not ( = ?auto_173417 ?auto_173420 ) ) ( not ( = ?auto_173417 ?auto_173421 ) ) ( not ( = ?auto_173417 ?auto_173422 ) ) ( not ( = ?auto_173417 ?auto_173423 ) ) ( not ( = ?auto_173417 ?auto_173424 ) ) ( not ( = ?auto_173418 ?auto_173419 ) ) ( not ( = ?auto_173418 ?auto_173420 ) ) ( not ( = ?auto_173418 ?auto_173421 ) ) ( not ( = ?auto_173418 ?auto_173422 ) ) ( not ( = ?auto_173418 ?auto_173423 ) ) ( not ( = ?auto_173418 ?auto_173424 ) ) ( not ( = ?auto_173419 ?auto_173420 ) ) ( not ( = ?auto_173419 ?auto_173421 ) ) ( not ( = ?auto_173419 ?auto_173422 ) ) ( not ( = ?auto_173419 ?auto_173423 ) ) ( not ( = ?auto_173419 ?auto_173424 ) ) ( not ( = ?auto_173420 ?auto_173421 ) ) ( not ( = ?auto_173420 ?auto_173422 ) ) ( not ( = ?auto_173420 ?auto_173423 ) ) ( not ( = ?auto_173420 ?auto_173424 ) ) ( not ( = ?auto_173421 ?auto_173422 ) ) ( not ( = ?auto_173421 ?auto_173423 ) ) ( not ( = ?auto_173421 ?auto_173424 ) ) ( not ( = ?auto_173422 ?auto_173423 ) ) ( not ( = ?auto_173422 ?auto_173424 ) ) ( not ( = ?auto_173423 ?auto_173424 ) ) ( ON ?auto_173422 ?auto_173423 ) ( ON ?auto_173421 ?auto_173422 ) ( ON ?auto_173420 ?auto_173421 ) ( ON ?auto_173419 ?auto_173420 ) ( ON ?auto_173418 ?auto_173419 ) ( ON ?auto_173417 ?auto_173418 ) ( CLEAR ?auto_173415 ) ( ON ?auto_173416 ?auto_173417 ) ( CLEAR ?auto_173416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173415 ?auto_173416 )
      ( MAKE-9PILE ?auto_173415 ?auto_173416 ?auto_173417 ?auto_173418 ?auto_173419 ?auto_173420 ?auto_173421 ?auto_173422 ?auto_173423 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_173434 - BLOCK
      ?auto_173435 - BLOCK
      ?auto_173436 - BLOCK
      ?auto_173437 - BLOCK
      ?auto_173438 - BLOCK
      ?auto_173439 - BLOCK
      ?auto_173440 - BLOCK
      ?auto_173441 - BLOCK
      ?auto_173442 - BLOCK
    )
    :vars
    (
      ?auto_173443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173442 ?auto_173443 ) ( ON-TABLE ?auto_173434 ) ( not ( = ?auto_173434 ?auto_173435 ) ) ( not ( = ?auto_173434 ?auto_173436 ) ) ( not ( = ?auto_173434 ?auto_173437 ) ) ( not ( = ?auto_173434 ?auto_173438 ) ) ( not ( = ?auto_173434 ?auto_173439 ) ) ( not ( = ?auto_173434 ?auto_173440 ) ) ( not ( = ?auto_173434 ?auto_173441 ) ) ( not ( = ?auto_173434 ?auto_173442 ) ) ( not ( = ?auto_173434 ?auto_173443 ) ) ( not ( = ?auto_173435 ?auto_173436 ) ) ( not ( = ?auto_173435 ?auto_173437 ) ) ( not ( = ?auto_173435 ?auto_173438 ) ) ( not ( = ?auto_173435 ?auto_173439 ) ) ( not ( = ?auto_173435 ?auto_173440 ) ) ( not ( = ?auto_173435 ?auto_173441 ) ) ( not ( = ?auto_173435 ?auto_173442 ) ) ( not ( = ?auto_173435 ?auto_173443 ) ) ( not ( = ?auto_173436 ?auto_173437 ) ) ( not ( = ?auto_173436 ?auto_173438 ) ) ( not ( = ?auto_173436 ?auto_173439 ) ) ( not ( = ?auto_173436 ?auto_173440 ) ) ( not ( = ?auto_173436 ?auto_173441 ) ) ( not ( = ?auto_173436 ?auto_173442 ) ) ( not ( = ?auto_173436 ?auto_173443 ) ) ( not ( = ?auto_173437 ?auto_173438 ) ) ( not ( = ?auto_173437 ?auto_173439 ) ) ( not ( = ?auto_173437 ?auto_173440 ) ) ( not ( = ?auto_173437 ?auto_173441 ) ) ( not ( = ?auto_173437 ?auto_173442 ) ) ( not ( = ?auto_173437 ?auto_173443 ) ) ( not ( = ?auto_173438 ?auto_173439 ) ) ( not ( = ?auto_173438 ?auto_173440 ) ) ( not ( = ?auto_173438 ?auto_173441 ) ) ( not ( = ?auto_173438 ?auto_173442 ) ) ( not ( = ?auto_173438 ?auto_173443 ) ) ( not ( = ?auto_173439 ?auto_173440 ) ) ( not ( = ?auto_173439 ?auto_173441 ) ) ( not ( = ?auto_173439 ?auto_173442 ) ) ( not ( = ?auto_173439 ?auto_173443 ) ) ( not ( = ?auto_173440 ?auto_173441 ) ) ( not ( = ?auto_173440 ?auto_173442 ) ) ( not ( = ?auto_173440 ?auto_173443 ) ) ( not ( = ?auto_173441 ?auto_173442 ) ) ( not ( = ?auto_173441 ?auto_173443 ) ) ( not ( = ?auto_173442 ?auto_173443 ) ) ( ON ?auto_173441 ?auto_173442 ) ( ON ?auto_173440 ?auto_173441 ) ( ON ?auto_173439 ?auto_173440 ) ( ON ?auto_173438 ?auto_173439 ) ( ON ?auto_173437 ?auto_173438 ) ( ON ?auto_173436 ?auto_173437 ) ( CLEAR ?auto_173434 ) ( ON ?auto_173435 ?auto_173436 ) ( CLEAR ?auto_173435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173434 ?auto_173435 )
      ( MAKE-9PILE ?auto_173434 ?auto_173435 ?auto_173436 ?auto_173437 ?auto_173438 ?auto_173439 ?auto_173440 ?auto_173441 ?auto_173442 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_173453 - BLOCK
      ?auto_173454 - BLOCK
      ?auto_173455 - BLOCK
      ?auto_173456 - BLOCK
      ?auto_173457 - BLOCK
      ?auto_173458 - BLOCK
      ?auto_173459 - BLOCK
      ?auto_173460 - BLOCK
      ?auto_173461 - BLOCK
    )
    :vars
    (
      ?auto_173462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173461 ?auto_173462 ) ( not ( = ?auto_173453 ?auto_173454 ) ) ( not ( = ?auto_173453 ?auto_173455 ) ) ( not ( = ?auto_173453 ?auto_173456 ) ) ( not ( = ?auto_173453 ?auto_173457 ) ) ( not ( = ?auto_173453 ?auto_173458 ) ) ( not ( = ?auto_173453 ?auto_173459 ) ) ( not ( = ?auto_173453 ?auto_173460 ) ) ( not ( = ?auto_173453 ?auto_173461 ) ) ( not ( = ?auto_173453 ?auto_173462 ) ) ( not ( = ?auto_173454 ?auto_173455 ) ) ( not ( = ?auto_173454 ?auto_173456 ) ) ( not ( = ?auto_173454 ?auto_173457 ) ) ( not ( = ?auto_173454 ?auto_173458 ) ) ( not ( = ?auto_173454 ?auto_173459 ) ) ( not ( = ?auto_173454 ?auto_173460 ) ) ( not ( = ?auto_173454 ?auto_173461 ) ) ( not ( = ?auto_173454 ?auto_173462 ) ) ( not ( = ?auto_173455 ?auto_173456 ) ) ( not ( = ?auto_173455 ?auto_173457 ) ) ( not ( = ?auto_173455 ?auto_173458 ) ) ( not ( = ?auto_173455 ?auto_173459 ) ) ( not ( = ?auto_173455 ?auto_173460 ) ) ( not ( = ?auto_173455 ?auto_173461 ) ) ( not ( = ?auto_173455 ?auto_173462 ) ) ( not ( = ?auto_173456 ?auto_173457 ) ) ( not ( = ?auto_173456 ?auto_173458 ) ) ( not ( = ?auto_173456 ?auto_173459 ) ) ( not ( = ?auto_173456 ?auto_173460 ) ) ( not ( = ?auto_173456 ?auto_173461 ) ) ( not ( = ?auto_173456 ?auto_173462 ) ) ( not ( = ?auto_173457 ?auto_173458 ) ) ( not ( = ?auto_173457 ?auto_173459 ) ) ( not ( = ?auto_173457 ?auto_173460 ) ) ( not ( = ?auto_173457 ?auto_173461 ) ) ( not ( = ?auto_173457 ?auto_173462 ) ) ( not ( = ?auto_173458 ?auto_173459 ) ) ( not ( = ?auto_173458 ?auto_173460 ) ) ( not ( = ?auto_173458 ?auto_173461 ) ) ( not ( = ?auto_173458 ?auto_173462 ) ) ( not ( = ?auto_173459 ?auto_173460 ) ) ( not ( = ?auto_173459 ?auto_173461 ) ) ( not ( = ?auto_173459 ?auto_173462 ) ) ( not ( = ?auto_173460 ?auto_173461 ) ) ( not ( = ?auto_173460 ?auto_173462 ) ) ( not ( = ?auto_173461 ?auto_173462 ) ) ( ON ?auto_173460 ?auto_173461 ) ( ON ?auto_173459 ?auto_173460 ) ( ON ?auto_173458 ?auto_173459 ) ( ON ?auto_173457 ?auto_173458 ) ( ON ?auto_173456 ?auto_173457 ) ( ON ?auto_173455 ?auto_173456 ) ( ON ?auto_173454 ?auto_173455 ) ( ON ?auto_173453 ?auto_173454 ) ( CLEAR ?auto_173453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_173453 )
      ( MAKE-9PILE ?auto_173453 ?auto_173454 ?auto_173455 ?auto_173456 ?auto_173457 ?auto_173458 ?auto_173459 ?auto_173460 ?auto_173461 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_173472 - BLOCK
      ?auto_173473 - BLOCK
      ?auto_173474 - BLOCK
      ?auto_173475 - BLOCK
      ?auto_173476 - BLOCK
      ?auto_173477 - BLOCK
      ?auto_173478 - BLOCK
      ?auto_173479 - BLOCK
      ?auto_173480 - BLOCK
    )
    :vars
    (
      ?auto_173481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173480 ?auto_173481 ) ( not ( = ?auto_173472 ?auto_173473 ) ) ( not ( = ?auto_173472 ?auto_173474 ) ) ( not ( = ?auto_173472 ?auto_173475 ) ) ( not ( = ?auto_173472 ?auto_173476 ) ) ( not ( = ?auto_173472 ?auto_173477 ) ) ( not ( = ?auto_173472 ?auto_173478 ) ) ( not ( = ?auto_173472 ?auto_173479 ) ) ( not ( = ?auto_173472 ?auto_173480 ) ) ( not ( = ?auto_173472 ?auto_173481 ) ) ( not ( = ?auto_173473 ?auto_173474 ) ) ( not ( = ?auto_173473 ?auto_173475 ) ) ( not ( = ?auto_173473 ?auto_173476 ) ) ( not ( = ?auto_173473 ?auto_173477 ) ) ( not ( = ?auto_173473 ?auto_173478 ) ) ( not ( = ?auto_173473 ?auto_173479 ) ) ( not ( = ?auto_173473 ?auto_173480 ) ) ( not ( = ?auto_173473 ?auto_173481 ) ) ( not ( = ?auto_173474 ?auto_173475 ) ) ( not ( = ?auto_173474 ?auto_173476 ) ) ( not ( = ?auto_173474 ?auto_173477 ) ) ( not ( = ?auto_173474 ?auto_173478 ) ) ( not ( = ?auto_173474 ?auto_173479 ) ) ( not ( = ?auto_173474 ?auto_173480 ) ) ( not ( = ?auto_173474 ?auto_173481 ) ) ( not ( = ?auto_173475 ?auto_173476 ) ) ( not ( = ?auto_173475 ?auto_173477 ) ) ( not ( = ?auto_173475 ?auto_173478 ) ) ( not ( = ?auto_173475 ?auto_173479 ) ) ( not ( = ?auto_173475 ?auto_173480 ) ) ( not ( = ?auto_173475 ?auto_173481 ) ) ( not ( = ?auto_173476 ?auto_173477 ) ) ( not ( = ?auto_173476 ?auto_173478 ) ) ( not ( = ?auto_173476 ?auto_173479 ) ) ( not ( = ?auto_173476 ?auto_173480 ) ) ( not ( = ?auto_173476 ?auto_173481 ) ) ( not ( = ?auto_173477 ?auto_173478 ) ) ( not ( = ?auto_173477 ?auto_173479 ) ) ( not ( = ?auto_173477 ?auto_173480 ) ) ( not ( = ?auto_173477 ?auto_173481 ) ) ( not ( = ?auto_173478 ?auto_173479 ) ) ( not ( = ?auto_173478 ?auto_173480 ) ) ( not ( = ?auto_173478 ?auto_173481 ) ) ( not ( = ?auto_173479 ?auto_173480 ) ) ( not ( = ?auto_173479 ?auto_173481 ) ) ( not ( = ?auto_173480 ?auto_173481 ) ) ( ON ?auto_173479 ?auto_173480 ) ( ON ?auto_173478 ?auto_173479 ) ( ON ?auto_173477 ?auto_173478 ) ( ON ?auto_173476 ?auto_173477 ) ( ON ?auto_173475 ?auto_173476 ) ( ON ?auto_173474 ?auto_173475 ) ( ON ?auto_173473 ?auto_173474 ) ( ON ?auto_173472 ?auto_173473 ) ( CLEAR ?auto_173472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_173472 )
      ( MAKE-9PILE ?auto_173472 ?auto_173473 ?auto_173474 ?auto_173475 ?auto_173476 ?auto_173477 ?auto_173478 ?auto_173479 ?auto_173480 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_173492 - BLOCK
      ?auto_173493 - BLOCK
      ?auto_173494 - BLOCK
      ?auto_173495 - BLOCK
      ?auto_173496 - BLOCK
      ?auto_173497 - BLOCK
      ?auto_173498 - BLOCK
      ?auto_173499 - BLOCK
      ?auto_173500 - BLOCK
      ?auto_173501 - BLOCK
    )
    :vars
    (
      ?auto_173502 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_173500 ) ( ON ?auto_173501 ?auto_173502 ) ( CLEAR ?auto_173501 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173492 ) ( ON ?auto_173493 ?auto_173492 ) ( ON ?auto_173494 ?auto_173493 ) ( ON ?auto_173495 ?auto_173494 ) ( ON ?auto_173496 ?auto_173495 ) ( ON ?auto_173497 ?auto_173496 ) ( ON ?auto_173498 ?auto_173497 ) ( ON ?auto_173499 ?auto_173498 ) ( ON ?auto_173500 ?auto_173499 ) ( not ( = ?auto_173492 ?auto_173493 ) ) ( not ( = ?auto_173492 ?auto_173494 ) ) ( not ( = ?auto_173492 ?auto_173495 ) ) ( not ( = ?auto_173492 ?auto_173496 ) ) ( not ( = ?auto_173492 ?auto_173497 ) ) ( not ( = ?auto_173492 ?auto_173498 ) ) ( not ( = ?auto_173492 ?auto_173499 ) ) ( not ( = ?auto_173492 ?auto_173500 ) ) ( not ( = ?auto_173492 ?auto_173501 ) ) ( not ( = ?auto_173492 ?auto_173502 ) ) ( not ( = ?auto_173493 ?auto_173494 ) ) ( not ( = ?auto_173493 ?auto_173495 ) ) ( not ( = ?auto_173493 ?auto_173496 ) ) ( not ( = ?auto_173493 ?auto_173497 ) ) ( not ( = ?auto_173493 ?auto_173498 ) ) ( not ( = ?auto_173493 ?auto_173499 ) ) ( not ( = ?auto_173493 ?auto_173500 ) ) ( not ( = ?auto_173493 ?auto_173501 ) ) ( not ( = ?auto_173493 ?auto_173502 ) ) ( not ( = ?auto_173494 ?auto_173495 ) ) ( not ( = ?auto_173494 ?auto_173496 ) ) ( not ( = ?auto_173494 ?auto_173497 ) ) ( not ( = ?auto_173494 ?auto_173498 ) ) ( not ( = ?auto_173494 ?auto_173499 ) ) ( not ( = ?auto_173494 ?auto_173500 ) ) ( not ( = ?auto_173494 ?auto_173501 ) ) ( not ( = ?auto_173494 ?auto_173502 ) ) ( not ( = ?auto_173495 ?auto_173496 ) ) ( not ( = ?auto_173495 ?auto_173497 ) ) ( not ( = ?auto_173495 ?auto_173498 ) ) ( not ( = ?auto_173495 ?auto_173499 ) ) ( not ( = ?auto_173495 ?auto_173500 ) ) ( not ( = ?auto_173495 ?auto_173501 ) ) ( not ( = ?auto_173495 ?auto_173502 ) ) ( not ( = ?auto_173496 ?auto_173497 ) ) ( not ( = ?auto_173496 ?auto_173498 ) ) ( not ( = ?auto_173496 ?auto_173499 ) ) ( not ( = ?auto_173496 ?auto_173500 ) ) ( not ( = ?auto_173496 ?auto_173501 ) ) ( not ( = ?auto_173496 ?auto_173502 ) ) ( not ( = ?auto_173497 ?auto_173498 ) ) ( not ( = ?auto_173497 ?auto_173499 ) ) ( not ( = ?auto_173497 ?auto_173500 ) ) ( not ( = ?auto_173497 ?auto_173501 ) ) ( not ( = ?auto_173497 ?auto_173502 ) ) ( not ( = ?auto_173498 ?auto_173499 ) ) ( not ( = ?auto_173498 ?auto_173500 ) ) ( not ( = ?auto_173498 ?auto_173501 ) ) ( not ( = ?auto_173498 ?auto_173502 ) ) ( not ( = ?auto_173499 ?auto_173500 ) ) ( not ( = ?auto_173499 ?auto_173501 ) ) ( not ( = ?auto_173499 ?auto_173502 ) ) ( not ( = ?auto_173500 ?auto_173501 ) ) ( not ( = ?auto_173500 ?auto_173502 ) ) ( not ( = ?auto_173501 ?auto_173502 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173501 ?auto_173502 )
      ( !STACK ?auto_173501 ?auto_173500 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_173513 - BLOCK
      ?auto_173514 - BLOCK
      ?auto_173515 - BLOCK
      ?auto_173516 - BLOCK
      ?auto_173517 - BLOCK
      ?auto_173518 - BLOCK
      ?auto_173519 - BLOCK
      ?auto_173520 - BLOCK
      ?auto_173521 - BLOCK
      ?auto_173522 - BLOCK
    )
    :vars
    (
      ?auto_173523 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_173521 ) ( ON ?auto_173522 ?auto_173523 ) ( CLEAR ?auto_173522 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173513 ) ( ON ?auto_173514 ?auto_173513 ) ( ON ?auto_173515 ?auto_173514 ) ( ON ?auto_173516 ?auto_173515 ) ( ON ?auto_173517 ?auto_173516 ) ( ON ?auto_173518 ?auto_173517 ) ( ON ?auto_173519 ?auto_173518 ) ( ON ?auto_173520 ?auto_173519 ) ( ON ?auto_173521 ?auto_173520 ) ( not ( = ?auto_173513 ?auto_173514 ) ) ( not ( = ?auto_173513 ?auto_173515 ) ) ( not ( = ?auto_173513 ?auto_173516 ) ) ( not ( = ?auto_173513 ?auto_173517 ) ) ( not ( = ?auto_173513 ?auto_173518 ) ) ( not ( = ?auto_173513 ?auto_173519 ) ) ( not ( = ?auto_173513 ?auto_173520 ) ) ( not ( = ?auto_173513 ?auto_173521 ) ) ( not ( = ?auto_173513 ?auto_173522 ) ) ( not ( = ?auto_173513 ?auto_173523 ) ) ( not ( = ?auto_173514 ?auto_173515 ) ) ( not ( = ?auto_173514 ?auto_173516 ) ) ( not ( = ?auto_173514 ?auto_173517 ) ) ( not ( = ?auto_173514 ?auto_173518 ) ) ( not ( = ?auto_173514 ?auto_173519 ) ) ( not ( = ?auto_173514 ?auto_173520 ) ) ( not ( = ?auto_173514 ?auto_173521 ) ) ( not ( = ?auto_173514 ?auto_173522 ) ) ( not ( = ?auto_173514 ?auto_173523 ) ) ( not ( = ?auto_173515 ?auto_173516 ) ) ( not ( = ?auto_173515 ?auto_173517 ) ) ( not ( = ?auto_173515 ?auto_173518 ) ) ( not ( = ?auto_173515 ?auto_173519 ) ) ( not ( = ?auto_173515 ?auto_173520 ) ) ( not ( = ?auto_173515 ?auto_173521 ) ) ( not ( = ?auto_173515 ?auto_173522 ) ) ( not ( = ?auto_173515 ?auto_173523 ) ) ( not ( = ?auto_173516 ?auto_173517 ) ) ( not ( = ?auto_173516 ?auto_173518 ) ) ( not ( = ?auto_173516 ?auto_173519 ) ) ( not ( = ?auto_173516 ?auto_173520 ) ) ( not ( = ?auto_173516 ?auto_173521 ) ) ( not ( = ?auto_173516 ?auto_173522 ) ) ( not ( = ?auto_173516 ?auto_173523 ) ) ( not ( = ?auto_173517 ?auto_173518 ) ) ( not ( = ?auto_173517 ?auto_173519 ) ) ( not ( = ?auto_173517 ?auto_173520 ) ) ( not ( = ?auto_173517 ?auto_173521 ) ) ( not ( = ?auto_173517 ?auto_173522 ) ) ( not ( = ?auto_173517 ?auto_173523 ) ) ( not ( = ?auto_173518 ?auto_173519 ) ) ( not ( = ?auto_173518 ?auto_173520 ) ) ( not ( = ?auto_173518 ?auto_173521 ) ) ( not ( = ?auto_173518 ?auto_173522 ) ) ( not ( = ?auto_173518 ?auto_173523 ) ) ( not ( = ?auto_173519 ?auto_173520 ) ) ( not ( = ?auto_173519 ?auto_173521 ) ) ( not ( = ?auto_173519 ?auto_173522 ) ) ( not ( = ?auto_173519 ?auto_173523 ) ) ( not ( = ?auto_173520 ?auto_173521 ) ) ( not ( = ?auto_173520 ?auto_173522 ) ) ( not ( = ?auto_173520 ?auto_173523 ) ) ( not ( = ?auto_173521 ?auto_173522 ) ) ( not ( = ?auto_173521 ?auto_173523 ) ) ( not ( = ?auto_173522 ?auto_173523 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173522 ?auto_173523 )
      ( !STACK ?auto_173522 ?auto_173521 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_173534 - BLOCK
      ?auto_173535 - BLOCK
      ?auto_173536 - BLOCK
      ?auto_173537 - BLOCK
      ?auto_173538 - BLOCK
      ?auto_173539 - BLOCK
      ?auto_173540 - BLOCK
      ?auto_173541 - BLOCK
      ?auto_173542 - BLOCK
      ?auto_173543 - BLOCK
    )
    :vars
    (
      ?auto_173544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173543 ?auto_173544 ) ( ON-TABLE ?auto_173534 ) ( ON ?auto_173535 ?auto_173534 ) ( ON ?auto_173536 ?auto_173535 ) ( ON ?auto_173537 ?auto_173536 ) ( ON ?auto_173538 ?auto_173537 ) ( ON ?auto_173539 ?auto_173538 ) ( ON ?auto_173540 ?auto_173539 ) ( ON ?auto_173541 ?auto_173540 ) ( not ( = ?auto_173534 ?auto_173535 ) ) ( not ( = ?auto_173534 ?auto_173536 ) ) ( not ( = ?auto_173534 ?auto_173537 ) ) ( not ( = ?auto_173534 ?auto_173538 ) ) ( not ( = ?auto_173534 ?auto_173539 ) ) ( not ( = ?auto_173534 ?auto_173540 ) ) ( not ( = ?auto_173534 ?auto_173541 ) ) ( not ( = ?auto_173534 ?auto_173542 ) ) ( not ( = ?auto_173534 ?auto_173543 ) ) ( not ( = ?auto_173534 ?auto_173544 ) ) ( not ( = ?auto_173535 ?auto_173536 ) ) ( not ( = ?auto_173535 ?auto_173537 ) ) ( not ( = ?auto_173535 ?auto_173538 ) ) ( not ( = ?auto_173535 ?auto_173539 ) ) ( not ( = ?auto_173535 ?auto_173540 ) ) ( not ( = ?auto_173535 ?auto_173541 ) ) ( not ( = ?auto_173535 ?auto_173542 ) ) ( not ( = ?auto_173535 ?auto_173543 ) ) ( not ( = ?auto_173535 ?auto_173544 ) ) ( not ( = ?auto_173536 ?auto_173537 ) ) ( not ( = ?auto_173536 ?auto_173538 ) ) ( not ( = ?auto_173536 ?auto_173539 ) ) ( not ( = ?auto_173536 ?auto_173540 ) ) ( not ( = ?auto_173536 ?auto_173541 ) ) ( not ( = ?auto_173536 ?auto_173542 ) ) ( not ( = ?auto_173536 ?auto_173543 ) ) ( not ( = ?auto_173536 ?auto_173544 ) ) ( not ( = ?auto_173537 ?auto_173538 ) ) ( not ( = ?auto_173537 ?auto_173539 ) ) ( not ( = ?auto_173537 ?auto_173540 ) ) ( not ( = ?auto_173537 ?auto_173541 ) ) ( not ( = ?auto_173537 ?auto_173542 ) ) ( not ( = ?auto_173537 ?auto_173543 ) ) ( not ( = ?auto_173537 ?auto_173544 ) ) ( not ( = ?auto_173538 ?auto_173539 ) ) ( not ( = ?auto_173538 ?auto_173540 ) ) ( not ( = ?auto_173538 ?auto_173541 ) ) ( not ( = ?auto_173538 ?auto_173542 ) ) ( not ( = ?auto_173538 ?auto_173543 ) ) ( not ( = ?auto_173538 ?auto_173544 ) ) ( not ( = ?auto_173539 ?auto_173540 ) ) ( not ( = ?auto_173539 ?auto_173541 ) ) ( not ( = ?auto_173539 ?auto_173542 ) ) ( not ( = ?auto_173539 ?auto_173543 ) ) ( not ( = ?auto_173539 ?auto_173544 ) ) ( not ( = ?auto_173540 ?auto_173541 ) ) ( not ( = ?auto_173540 ?auto_173542 ) ) ( not ( = ?auto_173540 ?auto_173543 ) ) ( not ( = ?auto_173540 ?auto_173544 ) ) ( not ( = ?auto_173541 ?auto_173542 ) ) ( not ( = ?auto_173541 ?auto_173543 ) ) ( not ( = ?auto_173541 ?auto_173544 ) ) ( not ( = ?auto_173542 ?auto_173543 ) ) ( not ( = ?auto_173542 ?auto_173544 ) ) ( not ( = ?auto_173543 ?auto_173544 ) ) ( CLEAR ?auto_173541 ) ( ON ?auto_173542 ?auto_173543 ) ( CLEAR ?auto_173542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_173534 ?auto_173535 ?auto_173536 ?auto_173537 ?auto_173538 ?auto_173539 ?auto_173540 ?auto_173541 ?auto_173542 )
      ( MAKE-10PILE ?auto_173534 ?auto_173535 ?auto_173536 ?auto_173537 ?auto_173538 ?auto_173539 ?auto_173540 ?auto_173541 ?auto_173542 ?auto_173543 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_173555 - BLOCK
      ?auto_173556 - BLOCK
      ?auto_173557 - BLOCK
      ?auto_173558 - BLOCK
      ?auto_173559 - BLOCK
      ?auto_173560 - BLOCK
      ?auto_173561 - BLOCK
      ?auto_173562 - BLOCK
      ?auto_173563 - BLOCK
      ?auto_173564 - BLOCK
    )
    :vars
    (
      ?auto_173565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173564 ?auto_173565 ) ( ON-TABLE ?auto_173555 ) ( ON ?auto_173556 ?auto_173555 ) ( ON ?auto_173557 ?auto_173556 ) ( ON ?auto_173558 ?auto_173557 ) ( ON ?auto_173559 ?auto_173558 ) ( ON ?auto_173560 ?auto_173559 ) ( ON ?auto_173561 ?auto_173560 ) ( ON ?auto_173562 ?auto_173561 ) ( not ( = ?auto_173555 ?auto_173556 ) ) ( not ( = ?auto_173555 ?auto_173557 ) ) ( not ( = ?auto_173555 ?auto_173558 ) ) ( not ( = ?auto_173555 ?auto_173559 ) ) ( not ( = ?auto_173555 ?auto_173560 ) ) ( not ( = ?auto_173555 ?auto_173561 ) ) ( not ( = ?auto_173555 ?auto_173562 ) ) ( not ( = ?auto_173555 ?auto_173563 ) ) ( not ( = ?auto_173555 ?auto_173564 ) ) ( not ( = ?auto_173555 ?auto_173565 ) ) ( not ( = ?auto_173556 ?auto_173557 ) ) ( not ( = ?auto_173556 ?auto_173558 ) ) ( not ( = ?auto_173556 ?auto_173559 ) ) ( not ( = ?auto_173556 ?auto_173560 ) ) ( not ( = ?auto_173556 ?auto_173561 ) ) ( not ( = ?auto_173556 ?auto_173562 ) ) ( not ( = ?auto_173556 ?auto_173563 ) ) ( not ( = ?auto_173556 ?auto_173564 ) ) ( not ( = ?auto_173556 ?auto_173565 ) ) ( not ( = ?auto_173557 ?auto_173558 ) ) ( not ( = ?auto_173557 ?auto_173559 ) ) ( not ( = ?auto_173557 ?auto_173560 ) ) ( not ( = ?auto_173557 ?auto_173561 ) ) ( not ( = ?auto_173557 ?auto_173562 ) ) ( not ( = ?auto_173557 ?auto_173563 ) ) ( not ( = ?auto_173557 ?auto_173564 ) ) ( not ( = ?auto_173557 ?auto_173565 ) ) ( not ( = ?auto_173558 ?auto_173559 ) ) ( not ( = ?auto_173558 ?auto_173560 ) ) ( not ( = ?auto_173558 ?auto_173561 ) ) ( not ( = ?auto_173558 ?auto_173562 ) ) ( not ( = ?auto_173558 ?auto_173563 ) ) ( not ( = ?auto_173558 ?auto_173564 ) ) ( not ( = ?auto_173558 ?auto_173565 ) ) ( not ( = ?auto_173559 ?auto_173560 ) ) ( not ( = ?auto_173559 ?auto_173561 ) ) ( not ( = ?auto_173559 ?auto_173562 ) ) ( not ( = ?auto_173559 ?auto_173563 ) ) ( not ( = ?auto_173559 ?auto_173564 ) ) ( not ( = ?auto_173559 ?auto_173565 ) ) ( not ( = ?auto_173560 ?auto_173561 ) ) ( not ( = ?auto_173560 ?auto_173562 ) ) ( not ( = ?auto_173560 ?auto_173563 ) ) ( not ( = ?auto_173560 ?auto_173564 ) ) ( not ( = ?auto_173560 ?auto_173565 ) ) ( not ( = ?auto_173561 ?auto_173562 ) ) ( not ( = ?auto_173561 ?auto_173563 ) ) ( not ( = ?auto_173561 ?auto_173564 ) ) ( not ( = ?auto_173561 ?auto_173565 ) ) ( not ( = ?auto_173562 ?auto_173563 ) ) ( not ( = ?auto_173562 ?auto_173564 ) ) ( not ( = ?auto_173562 ?auto_173565 ) ) ( not ( = ?auto_173563 ?auto_173564 ) ) ( not ( = ?auto_173563 ?auto_173565 ) ) ( not ( = ?auto_173564 ?auto_173565 ) ) ( CLEAR ?auto_173562 ) ( ON ?auto_173563 ?auto_173564 ) ( CLEAR ?auto_173563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_173555 ?auto_173556 ?auto_173557 ?auto_173558 ?auto_173559 ?auto_173560 ?auto_173561 ?auto_173562 ?auto_173563 )
      ( MAKE-10PILE ?auto_173555 ?auto_173556 ?auto_173557 ?auto_173558 ?auto_173559 ?auto_173560 ?auto_173561 ?auto_173562 ?auto_173563 ?auto_173564 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_173576 - BLOCK
      ?auto_173577 - BLOCK
      ?auto_173578 - BLOCK
      ?auto_173579 - BLOCK
      ?auto_173580 - BLOCK
      ?auto_173581 - BLOCK
      ?auto_173582 - BLOCK
      ?auto_173583 - BLOCK
      ?auto_173584 - BLOCK
      ?auto_173585 - BLOCK
    )
    :vars
    (
      ?auto_173586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173585 ?auto_173586 ) ( ON-TABLE ?auto_173576 ) ( ON ?auto_173577 ?auto_173576 ) ( ON ?auto_173578 ?auto_173577 ) ( ON ?auto_173579 ?auto_173578 ) ( ON ?auto_173580 ?auto_173579 ) ( ON ?auto_173581 ?auto_173580 ) ( ON ?auto_173582 ?auto_173581 ) ( not ( = ?auto_173576 ?auto_173577 ) ) ( not ( = ?auto_173576 ?auto_173578 ) ) ( not ( = ?auto_173576 ?auto_173579 ) ) ( not ( = ?auto_173576 ?auto_173580 ) ) ( not ( = ?auto_173576 ?auto_173581 ) ) ( not ( = ?auto_173576 ?auto_173582 ) ) ( not ( = ?auto_173576 ?auto_173583 ) ) ( not ( = ?auto_173576 ?auto_173584 ) ) ( not ( = ?auto_173576 ?auto_173585 ) ) ( not ( = ?auto_173576 ?auto_173586 ) ) ( not ( = ?auto_173577 ?auto_173578 ) ) ( not ( = ?auto_173577 ?auto_173579 ) ) ( not ( = ?auto_173577 ?auto_173580 ) ) ( not ( = ?auto_173577 ?auto_173581 ) ) ( not ( = ?auto_173577 ?auto_173582 ) ) ( not ( = ?auto_173577 ?auto_173583 ) ) ( not ( = ?auto_173577 ?auto_173584 ) ) ( not ( = ?auto_173577 ?auto_173585 ) ) ( not ( = ?auto_173577 ?auto_173586 ) ) ( not ( = ?auto_173578 ?auto_173579 ) ) ( not ( = ?auto_173578 ?auto_173580 ) ) ( not ( = ?auto_173578 ?auto_173581 ) ) ( not ( = ?auto_173578 ?auto_173582 ) ) ( not ( = ?auto_173578 ?auto_173583 ) ) ( not ( = ?auto_173578 ?auto_173584 ) ) ( not ( = ?auto_173578 ?auto_173585 ) ) ( not ( = ?auto_173578 ?auto_173586 ) ) ( not ( = ?auto_173579 ?auto_173580 ) ) ( not ( = ?auto_173579 ?auto_173581 ) ) ( not ( = ?auto_173579 ?auto_173582 ) ) ( not ( = ?auto_173579 ?auto_173583 ) ) ( not ( = ?auto_173579 ?auto_173584 ) ) ( not ( = ?auto_173579 ?auto_173585 ) ) ( not ( = ?auto_173579 ?auto_173586 ) ) ( not ( = ?auto_173580 ?auto_173581 ) ) ( not ( = ?auto_173580 ?auto_173582 ) ) ( not ( = ?auto_173580 ?auto_173583 ) ) ( not ( = ?auto_173580 ?auto_173584 ) ) ( not ( = ?auto_173580 ?auto_173585 ) ) ( not ( = ?auto_173580 ?auto_173586 ) ) ( not ( = ?auto_173581 ?auto_173582 ) ) ( not ( = ?auto_173581 ?auto_173583 ) ) ( not ( = ?auto_173581 ?auto_173584 ) ) ( not ( = ?auto_173581 ?auto_173585 ) ) ( not ( = ?auto_173581 ?auto_173586 ) ) ( not ( = ?auto_173582 ?auto_173583 ) ) ( not ( = ?auto_173582 ?auto_173584 ) ) ( not ( = ?auto_173582 ?auto_173585 ) ) ( not ( = ?auto_173582 ?auto_173586 ) ) ( not ( = ?auto_173583 ?auto_173584 ) ) ( not ( = ?auto_173583 ?auto_173585 ) ) ( not ( = ?auto_173583 ?auto_173586 ) ) ( not ( = ?auto_173584 ?auto_173585 ) ) ( not ( = ?auto_173584 ?auto_173586 ) ) ( not ( = ?auto_173585 ?auto_173586 ) ) ( ON ?auto_173584 ?auto_173585 ) ( CLEAR ?auto_173582 ) ( ON ?auto_173583 ?auto_173584 ) ( CLEAR ?auto_173583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_173576 ?auto_173577 ?auto_173578 ?auto_173579 ?auto_173580 ?auto_173581 ?auto_173582 ?auto_173583 )
      ( MAKE-10PILE ?auto_173576 ?auto_173577 ?auto_173578 ?auto_173579 ?auto_173580 ?auto_173581 ?auto_173582 ?auto_173583 ?auto_173584 ?auto_173585 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_173597 - BLOCK
      ?auto_173598 - BLOCK
      ?auto_173599 - BLOCK
      ?auto_173600 - BLOCK
      ?auto_173601 - BLOCK
      ?auto_173602 - BLOCK
      ?auto_173603 - BLOCK
      ?auto_173604 - BLOCK
      ?auto_173605 - BLOCK
      ?auto_173606 - BLOCK
    )
    :vars
    (
      ?auto_173607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173606 ?auto_173607 ) ( ON-TABLE ?auto_173597 ) ( ON ?auto_173598 ?auto_173597 ) ( ON ?auto_173599 ?auto_173598 ) ( ON ?auto_173600 ?auto_173599 ) ( ON ?auto_173601 ?auto_173600 ) ( ON ?auto_173602 ?auto_173601 ) ( ON ?auto_173603 ?auto_173602 ) ( not ( = ?auto_173597 ?auto_173598 ) ) ( not ( = ?auto_173597 ?auto_173599 ) ) ( not ( = ?auto_173597 ?auto_173600 ) ) ( not ( = ?auto_173597 ?auto_173601 ) ) ( not ( = ?auto_173597 ?auto_173602 ) ) ( not ( = ?auto_173597 ?auto_173603 ) ) ( not ( = ?auto_173597 ?auto_173604 ) ) ( not ( = ?auto_173597 ?auto_173605 ) ) ( not ( = ?auto_173597 ?auto_173606 ) ) ( not ( = ?auto_173597 ?auto_173607 ) ) ( not ( = ?auto_173598 ?auto_173599 ) ) ( not ( = ?auto_173598 ?auto_173600 ) ) ( not ( = ?auto_173598 ?auto_173601 ) ) ( not ( = ?auto_173598 ?auto_173602 ) ) ( not ( = ?auto_173598 ?auto_173603 ) ) ( not ( = ?auto_173598 ?auto_173604 ) ) ( not ( = ?auto_173598 ?auto_173605 ) ) ( not ( = ?auto_173598 ?auto_173606 ) ) ( not ( = ?auto_173598 ?auto_173607 ) ) ( not ( = ?auto_173599 ?auto_173600 ) ) ( not ( = ?auto_173599 ?auto_173601 ) ) ( not ( = ?auto_173599 ?auto_173602 ) ) ( not ( = ?auto_173599 ?auto_173603 ) ) ( not ( = ?auto_173599 ?auto_173604 ) ) ( not ( = ?auto_173599 ?auto_173605 ) ) ( not ( = ?auto_173599 ?auto_173606 ) ) ( not ( = ?auto_173599 ?auto_173607 ) ) ( not ( = ?auto_173600 ?auto_173601 ) ) ( not ( = ?auto_173600 ?auto_173602 ) ) ( not ( = ?auto_173600 ?auto_173603 ) ) ( not ( = ?auto_173600 ?auto_173604 ) ) ( not ( = ?auto_173600 ?auto_173605 ) ) ( not ( = ?auto_173600 ?auto_173606 ) ) ( not ( = ?auto_173600 ?auto_173607 ) ) ( not ( = ?auto_173601 ?auto_173602 ) ) ( not ( = ?auto_173601 ?auto_173603 ) ) ( not ( = ?auto_173601 ?auto_173604 ) ) ( not ( = ?auto_173601 ?auto_173605 ) ) ( not ( = ?auto_173601 ?auto_173606 ) ) ( not ( = ?auto_173601 ?auto_173607 ) ) ( not ( = ?auto_173602 ?auto_173603 ) ) ( not ( = ?auto_173602 ?auto_173604 ) ) ( not ( = ?auto_173602 ?auto_173605 ) ) ( not ( = ?auto_173602 ?auto_173606 ) ) ( not ( = ?auto_173602 ?auto_173607 ) ) ( not ( = ?auto_173603 ?auto_173604 ) ) ( not ( = ?auto_173603 ?auto_173605 ) ) ( not ( = ?auto_173603 ?auto_173606 ) ) ( not ( = ?auto_173603 ?auto_173607 ) ) ( not ( = ?auto_173604 ?auto_173605 ) ) ( not ( = ?auto_173604 ?auto_173606 ) ) ( not ( = ?auto_173604 ?auto_173607 ) ) ( not ( = ?auto_173605 ?auto_173606 ) ) ( not ( = ?auto_173605 ?auto_173607 ) ) ( not ( = ?auto_173606 ?auto_173607 ) ) ( ON ?auto_173605 ?auto_173606 ) ( CLEAR ?auto_173603 ) ( ON ?auto_173604 ?auto_173605 ) ( CLEAR ?auto_173604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_173597 ?auto_173598 ?auto_173599 ?auto_173600 ?auto_173601 ?auto_173602 ?auto_173603 ?auto_173604 )
      ( MAKE-10PILE ?auto_173597 ?auto_173598 ?auto_173599 ?auto_173600 ?auto_173601 ?auto_173602 ?auto_173603 ?auto_173604 ?auto_173605 ?auto_173606 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_173618 - BLOCK
      ?auto_173619 - BLOCK
      ?auto_173620 - BLOCK
      ?auto_173621 - BLOCK
      ?auto_173622 - BLOCK
      ?auto_173623 - BLOCK
      ?auto_173624 - BLOCK
      ?auto_173625 - BLOCK
      ?auto_173626 - BLOCK
      ?auto_173627 - BLOCK
    )
    :vars
    (
      ?auto_173628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173627 ?auto_173628 ) ( ON-TABLE ?auto_173618 ) ( ON ?auto_173619 ?auto_173618 ) ( ON ?auto_173620 ?auto_173619 ) ( ON ?auto_173621 ?auto_173620 ) ( ON ?auto_173622 ?auto_173621 ) ( ON ?auto_173623 ?auto_173622 ) ( not ( = ?auto_173618 ?auto_173619 ) ) ( not ( = ?auto_173618 ?auto_173620 ) ) ( not ( = ?auto_173618 ?auto_173621 ) ) ( not ( = ?auto_173618 ?auto_173622 ) ) ( not ( = ?auto_173618 ?auto_173623 ) ) ( not ( = ?auto_173618 ?auto_173624 ) ) ( not ( = ?auto_173618 ?auto_173625 ) ) ( not ( = ?auto_173618 ?auto_173626 ) ) ( not ( = ?auto_173618 ?auto_173627 ) ) ( not ( = ?auto_173618 ?auto_173628 ) ) ( not ( = ?auto_173619 ?auto_173620 ) ) ( not ( = ?auto_173619 ?auto_173621 ) ) ( not ( = ?auto_173619 ?auto_173622 ) ) ( not ( = ?auto_173619 ?auto_173623 ) ) ( not ( = ?auto_173619 ?auto_173624 ) ) ( not ( = ?auto_173619 ?auto_173625 ) ) ( not ( = ?auto_173619 ?auto_173626 ) ) ( not ( = ?auto_173619 ?auto_173627 ) ) ( not ( = ?auto_173619 ?auto_173628 ) ) ( not ( = ?auto_173620 ?auto_173621 ) ) ( not ( = ?auto_173620 ?auto_173622 ) ) ( not ( = ?auto_173620 ?auto_173623 ) ) ( not ( = ?auto_173620 ?auto_173624 ) ) ( not ( = ?auto_173620 ?auto_173625 ) ) ( not ( = ?auto_173620 ?auto_173626 ) ) ( not ( = ?auto_173620 ?auto_173627 ) ) ( not ( = ?auto_173620 ?auto_173628 ) ) ( not ( = ?auto_173621 ?auto_173622 ) ) ( not ( = ?auto_173621 ?auto_173623 ) ) ( not ( = ?auto_173621 ?auto_173624 ) ) ( not ( = ?auto_173621 ?auto_173625 ) ) ( not ( = ?auto_173621 ?auto_173626 ) ) ( not ( = ?auto_173621 ?auto_173627 ) ) ( not ( = ?auto_173621 ?auto_173628 ) ) ( not ( = ?auto_173622 ?auto_173623 ) ) ( not ( = ?auto_173622 ?auto_173624 ) ) ( not ( = ?auto_173622 ?auto_173625 ) ) ( not ( = ?auto_173622 ?auto_173626 ) ) ( not ( = ?auto_173622 ?auto_173627 ) ) ( not ( = ?auto_173622 ?auto_173628 ) ) ( not ( = ?auto_173623 ?auto_173624 ) ) ( not ( = ?auto_173623 ?auto_173625 ) ) ( not ( = ?auto_173623 ?auto_173626 ) ) ( not ( = ?auto_173623 ?auto_173627 ) ) ( not ( = ?auto_173623 ?auto_173628 ) ) ( not ( = ?auto_173624 ?auto_173625 ) ) ( not ( = ?auto_173624 ?auto_173626 ) ) ( not ( = ?auto_173624 ?auto_173627 ) ) ( not ( = ?auto_173624 ?auto_173628 ) ) ( not ( = ?auto_173625 ?auto_173626 ) ) ( not ( = ?auto_173625 ?auto_173627 ) ) ( not ( = ?auto_173625 ?auto_173628 ) ) ( not ( = ?auto_173626 ?auto_173627 ) ) ( not ( = ?auto_173626 ?auto_173628 ) ) ( not ( = ?auto_173627 ?auto_173628 ) ) ( ON ?auto_173626 ?auto_173627 ) ( ON ?auto_173625 ?auto_173626 ) ( CLEAR ?auto_173623 ) ( ON ?auto_173624 ?auto_173625 ) ( CLEAR ?auto_173624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_173618 ?auto_173619 ?auto_173620 ?auto_173621 ?auto_173622 ?auto_173623 ?auto_173624 )
      ( MAKE-10PILE ?auto_173618 ?auto_173619 ?auto_173620 ?auto_173621 ?auto_173622 ?auto_173623 ?auto_173624 ?auto_173625 ?auto_173626 ?auto_173627 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_173639 - BLOCK
      ?auto_173640 - BLOCK
      ?auto_173641 - BLOCK
      ?auto_173642 - BLOCK
      ?auto_173643 - BLOCK
      ?auto_173644 - BLOCK
      ?auto_173645 - BLOCK
      ?auto_173646 - BLOCK
      ?auto_173647 - BLOCK
      ?auto_173648 - BLOCK
    )
    :vars
    (
      ?auto_173649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173648 ?auto_173649 ) ( ON-TABLE ?auto_173639 ) ( ON ?auto_173640 ?auto_173639 ) ( ON ?auto_173641 ?auto_173640 ) ( ON ?auto_173642 ?auto_173641 ) ( ON ?auto_173643 ?auto_173642 ) ( ON ?auto_173644 ?auto_173643 ) ( not ( = ?auto_173639 ?auto_173640 ) ) ( not ( = ?auto_173639 ?auto_173641 ) ) ( not ( = ?auto_173639 ?auto_173642 ) ) ( not ( = ?auto_173639 ?auto_173643 ) ) ( not ( = ?auto_173639 ?auto_173644 ) ) ( not ( = ?auto_173639 ?auto_173645 ) ) ( not ( = ?auto_173639 ?auto_173646 ) ) ( not ( = ?auto_173639 ?auto_173647 ) ) ( not ( = ?auto_173639 ?auto_173648 ) ) ( not ( = ?auto_173639 ?auto_173649 ) ) ( not ( = ?auto_173640 ?auto_173641 ) ) ( not ( = ?auto_173640 ?auto_173642 ) ) ( not ( = ?auto_173640 ?auto_173643 ) ) ( not ( = ?auto_173640 ?auto_173644 ) ) ( not ( = ?auto_173640 ?auto_173645 ) ) ( not ( = ?auto_173640 ?auto_173646 ) ) ( not ( = ?auto_173640 ?auto_173647 ) ) ( not ( = ?auto_173640 ?auto_173648 ) ) ( not ( = ?auto_173640 ?auto_173649 ) ) ( not ( = ?auto_173641 ?auto_173642 ) ) ( not ( = ?auto_173641 ?auto_173643 ) ) ( not ( = ?auto_173641 ?auto_173644 ) ) ( not ( = ?auto_173641 ?auto_173645 ) ) ( not ( = ?auto_173641 ?auto_173646 ) ) ( not ( = ?auto_173641 ?auto_173647 ) ) ( not ( = ?auto_173641 ?auto_173648 ) ) ( not ( = ?auto_173641 ?auto_173649 ) ) ( not ( = ?auto_173642 ?auto_173643 ) ) ( not ( = ?auto_173642 ?auto_173644 ) ) ( not ( = ?auto_173642 ?auto_173645 ) ) ( not ( = ?auto_173642 ?auto_173646 ) ) ( not ( = ?auto_173642 ?auto_173647 ) ) ( not ( = ?auto_173642 ?auto_173648 ) ) ( not ( = ?auto_173642 ?auto_173649 ) ) ( not ( = ?auto_173643 ?auto_173644 ) ) ( not ( = ?auto_173643 ?auto_173645 ) ) ( not ( = ?auto_173643 ?auto_173646 ) ) ( not ( = ?auto_173643 ?auto_173647 ) ) ( not ( = ?auto_173643 ?auto_173648 ) ) ( not ( = ?auto_173643 ?auto_173649 ) ) ( not ( = ?auto_173644 ?auto_173645 ) ) ( not ( = ?auto_173644 ?auto_173646 ) ) ( not ( = ?auto_173644 ?auto_173647 ) ) ( not ( = ?auto_173644 ?auto_173648 ) ) ( not ( = ?auto_173644 ?auto_173649 ) ) ( not ( = ?auto_173645 ?auto_173646 ) ) ( not ( = ?auto_173645 ?auto_173647 ) ) ( not ( = ?auto_173645 ?auto_173648 ) ) ( not ( = ?auto_173645 ?auto_173649 ) ) ( not ( = ?auto_173646 ?auto_173647 ) ) ( not ( = ?auto_173646 ?auto_173648 ) ) ( not ( = ?auto_173646 ?auto_173649 ) ) ( not ( = ?auto_173647 ?auto_173648 ) ) ( not ( = ?auto_173647 ?auto_173649 ) ) ( not ( = ?auto_173648 ?auto_173649 ) ) ( ON ?auto_173647 ?auto_173648 ) ( ON ?auto_173646 ?auto_173647 ) ( CLEAR ?auto_173644 ) ( ON ?auto_173645 ?auto_173646 ) ( CLEAR ?auto_173645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_173639 ?auto_173640 ?auto_173641 ?auto_173642 ?auto_173643 ?auto_173644 ?auto_173645 )
      ( MAKE-10PILE ?auto_173639 ?auto_173640 ?auto_173641 ?auto_173642 ?auto_173643 ?auto_173644 ?auto_173645 ?auto_173646 ?auto_173647 ?auto_173648 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_173660 - BLOCK
      ?auto_173661 - BLOCK
      ?auto_173662 - BLOCK
      ?auto_173663 - BLOCK
      ?auto_173664 - BLOCK
      ?auto_173665 - BLOCK
      ?auto_173666 - BLOCK
      ?auto_173667 - BLOCK
      ?auto_173668 - BLOCK
      ?auto_173669 - BLOCK
    )
    :vars
    (
      ?auto_173670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173669 ?auto_173670 ) ( ON-TABLE ?auto_173660 ) ( ON ?auto_173661 ?auto_173660 ) ( ON ?auto_173662 ?auto_173661 ) ( ON ?auto_173663 ?auto_173662 ) ( ON ?auto_173664 ?auto_173663 ) ( not ( = ?auto_173660 ?auto_173661 ) ) ( not ( = ?auto_173660 ?auto_173662 ) ) ( not ( = ?auto_173660 ?auto_173663 ) ) ( not ( = ?auto_173660 ?auto_173664 ) ) ( not ( = ?auto_173660 ?auto_173665 ) ) ( not ( = ?auto_173660 ?auto_173666 ) ) ( not ( = ?auto_173660 ?auto_173667 ) ) ( not ( = ?auto_173660 ?auto_173668 ) ) ( not ( = ?auto_173660 ?auto_173669 ) ) ( not ( = ?auto_173660 ?auto_173670 ) ) ( not ( = ?auto_173661 ?auto_173662 ) ) ( not ( = ?auto_173661 ?auto_173663 ) ) ( not ( = ?auto_173661 ?auto_173664 ) ) ( not ( = ?auto_173661 ?auto_173665 ) ) ( not ( = ?auto_173661 ?auto_173666 ) ) ( not ( = ?auto_173661 ?auto_173667 ) ) ( not ( = ?auto_173661 ?auto_173668 ) ) ( not ( = ?auto_173661 ?auto_173669 ) ) ( not ( = ?auto_173661 ?auto_173670 ) ) ( not ( = ?auto_173662 ?auto_173663 ) ) ( not ( = ?auto_173662 ?auto_173664 ) ) ( not ( = ?auto_173662 ?auto_173665 ) ) ( not ( = ?auto_173662 ?auto_173666 ) ) ( not ( = ?auto_173662 ?auto_173667 ) ) ( not ( = ?auto_173662 ?auto_173668 ) ) ( not ( = ?auto_173662 ?auto_173669 ) ) ( not ( = ?auto_173662 ?auto_173670 ) ) ( not ( = ?auto_173663 ?auto_173664 ) ) ( not ( = ?auto_173663 ?auto_173665 ) ) ( not ( = ?auto_173663 ?auto_173666 ) ) ( not ( = ?auto_173663 ?auto_173667 ) ) ( not ( = ?auto_173663 ?auto_173668 ) ) ( not ( = ?auto_173663 ?auto_173669 ) ) ( not ( = ?auto_173663 ?auto_173670 ) ) ( not ( = ?auto_173664 ?auto_173665 ) ) ( not ( = ?auto_173664 ?auto_173666 ) ) ( not ( = ?auto_173664 ?auto_173667 ) ) ( not ( = ?auto_173664 ?auto_173668 ) ) ( not ( = ?auto_173664 ?auto_173669 ) ) ( not ( = ?auto_173664 ?auto_173670 ) ) ( not ( = ?auto_173665 ?auto_173666 ) ) ( not ( = ?auto_173665 ?auto_173667 ) ) ( not ( = ?auto_173665 ?auto_173668 ) ) ( not ( = ?auto_173665 ?auto_173669 ) ) ( not ( = ?auto_173665 ?auto_173670 ) ) ( not ( = ?auto_173666 ?auto_173667 ) ) ( not ( = ?auto_173666 ?auto_173668 ) ) ( not ( = ?auto_173666 ?auto_173669 ) ) ( not ( = ?auto_173666 ?auto_173670 ) ) ( not ( = ?auto_173667 ?auto_173668 ) ) ( not ( = ?auto_173667 ?auto_173669 ) ) ( not ( = ?auto_173667 ?auto_173670 ) ) ( not ( = ?auto_173668 ?auto_173669 ) ) ( not ( = ?auto_173668 ?auto_173670 ) ) ( not ( = ?auto_173669 ?auto_173670 ) ) ( ON ?auto_173668 ?auto_173669 ) ( ON ?auto_173667 ?auto_173668 ) ( ON ?auto_173666 ?auto_173667 ) ( CLEAR ?auto_173664 ) ( ON ?auto_173665 ?auto_173666 ) ( CLEAR ?auto_173665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173660 ?auto_173661 ?auto_173662 ?auto_173663 ?auto_173664 ?auto_173665 )
      ( MAKE-10PILE ?auto_173660 ?auto_173661 ?auto_173662 ?auto_173663 ?auto_173664 ?auto_173665 ?auto_173666 ?auto_173667 ?auto_173668 ?auto_173669 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_173681 - BLOCK
      ?auto_173682 - BLOCK
      ?auto_173683 - BLOCK
      ?auto_173684 - BLOCK
      ?auto_173685 - BLOCK
      ?auto_173686 - BLOCK
      ?auto_173687 - BLOCK
      ?auto_173688 - BLOCK
      ?auto_173689 - BLOCK
      ?auto_173690 - BLOCK
    )
    :vars
    (
      ?auto_173691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173690 ?auto_173691 ) ( ON-TABLE ?auto_173681 ) ( ON ?auto_173682 ?auto_173681 ) ( ON ?auto_173683 ?auto_173682 ) ( ON ?auto_173684 ?auto_173683 ) ( ON ?auto_173685 ?auto_173684 ) ( not ( = ?auto_173681 ?auto_173682 ) ) ( not ( = ?auto_173681 ?auto_173683 ) ) ( not ( = ?auto_173681 ?auto_173684 ) ) ( not ( = ?auto_173681 ?auto_173685 ) ) ( not ( = ?auto_173681 ?auto_173686 ) ) ( not ( = ?auto_173681 ?auto_173687 ) ) ( not ( = ?auto_173681 ?auto_173688 ) ) ( not ( = ?auto_173681 ?auto_173689 ) ) ( not ( = ?auto_173681 ?auto_173690 ) ) ( not ( = ?auto_173681 ?auto_173691 ) ) ( not ( = ?auto_173682 ?auto_173683 ) ) ( not ( = ?auto_173682 ?auto_173684 ) ) ( not ( = ?auto_173682 ?auto_173685 ) ) ( not ( = ?auto_173682 ?auto_173686 ) ) ( not ( = ?auto_173682 ?auto_173687 ) ) ( not ( = ?auto_173682 ?auto_173688 ) ) ( not ( = ?auto_173682 ?auto_173689 ) ) ( not ( = ?auto_173682 ?auto_173690 ) ) ( not ( = ?auto_173682 ?auto_173691 ) ) ( not ( = ?auto_173683 ?auto_173684 ) ) ( not ( = ?auto_173683 ?auto_173685 ) ) ( not ( = ?auto_173683 ?auto_173686 ) ) ( not ( = ?auto_173683 ?auto_173687 ) ) ( not ( = ?auto_173683 ?auto_173688 ) ) ( not ( = ?auto_173683 ?auto_173689 ) ) ( not ( = ?auto_173683 ?auto_173690 ) ) ( not ( = ?auto_173683 ?auto_173691 ) ) ( not ( = ?auto_173684 ?auto_173685 ) ) ( not ( = ?auto_173684 ?auto_173686 ) ) ( not ( = ?auto_173684 ?auto_173687 ) ) ( not ( = ?auto_173684 ?auto_173688 ) ) ( not ( = ?auto_173684 ?auto_173689 ) ) ( not ( = ?auto_173684 ?auto_173690 ) ) ( not ( = ?auto_173684 ?auto_173691 ) ) ( not ( = ?auto_173685 ?auto_173686 ) ) ( not ( = ?auto_173685 ?auto_173687 ) ) ( not ( = ?auto_173685 ?auto_173688 ) ) ( not ( = ?auto_173685 ?auto_173689 ) ) ( not ( = ?auto_173685 ?auto_173690 ) ) ( not ( = ?auto_173685 ?auto_173691 ) ) ( not ( = ?auto_173686 ?auto_173687 ) ) ( not ( = ?auto_173686 ?auto_173688 ) ) ( not ( = ?auto_173686 ?auto_173689 ) ) ( not ( = ?auto_173686 ?auto_173690 ) ) ( not ( = ?auto_173686 ?auto_173691 ) ) ( not ( = ?auto_173687 ?auto_173688 ) ) ( not ( = ?auto_173687 ?auto_173689 ) ) ( not ( = ?auto_173687 ?auto_173690 ) ) ( not ( = ?auto_173687 ?auto_173691 ) ) ( not ( = ?auto_173688 ?auto_173689 ) ) ( not ( = ?auto_173688 ?auto_173690 ) ) ( not ( = ?auto_173688 ?auto_173691 ) ) ( not ( = ?auto_173689 ?auto_173690 ) ) ( not ( = ?auto_173689 ?auto_173691 ) ) ( not ( = ?auto_173690 ?auto_173691 ) ) ( ON ?auto_173689 ?auto_173690 ) ( ON ?auto_173688 ?auto_173689 ) ( ON ?auto_173687 ?auto_173688 ) ( CLEAR ?auto_173685 ) ( ON ?auto_173686 ?auto_173687 ) ( CLEAR ?auto_173686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173681 ?auto_173682 ?auto_173683 ?auto_173684 ?auto_173685 ?auto_173686 )
      ( MAKE-10PILE ?auto_173681 ?auto_173682 ?auto_173683 ?auto_173684 ?auto_173685 ?auto_173686 ?auto_173687 ?auto_173688 ?auto_173689 ?auto_173690 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_173702 - BLOCK
      ?auto_173703 - BLOCK
      ?auto_173704 - BLOCK
      ?auto_173705 - BLOCK
      ?auto_173706 - BLOCK
      ?auto_173707 - BLOCK
      ?auto_173708 - BLOCK
      ?auto_173709 - BLOCK
      ?auto_173710 - BLOCK
      ?auto_173711 - BLOCK
    )
    :vars
    (
      ?auto_173712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173711 ?auto_173712 ) ( ON-TABLE ?auto_173702 ) ( ON ?auto_173703 ?auto_173702 ) ( ON ?auto_173704 ?auto_173703 ) ( ON ?auto_173705 ?auto_173704 ) ( not ( = ?auto_173702 ?auto_173703 ) ) ( not ( = ?auto_173702 ?auto_173704 ) ) ( not ( = ?auto_173702 ?auto_173705 ) ) ( not ( = ?auto_173702 ?auto_173706 ) ) ( not ( = ?auto_173702 ?auto_173707 ) ) ( not ( = ?auto_173702 ?auto_173708 ) ) ( not ( = ?auto_173702 ?auto_173709 ) ) ( not ( = ?auto_173702 ?auto_173710 ) ) ( not ( = ?auto_173702 ?auto_173711 ) ) ( not ( = ?auto_173702 ?auto_173712 ) ) ( not ( = ?auto_173703 ?auto_173704 ) ) ( not ( = ?auto_173703 ?auto_173705 ) ) ( not ( = ?auto_173703 ?auto_173706 ) ) ( not ( = ?auto_173703 ?auto_173707 ) ) ( not ( = ?auto_173703 ?auto_173708 ) ) ( not ( = ?auto_173703 ?auto_173709 ) ) ( not ( = ?auto_173703 ?auto_173710 ) ) ( not ( = ?auto_173703 ?auto_173711 ) ) ( not ( = ?auto_173703 ?auto_173712 ) ) ( not ( = ?auto_173704 ?auto_173705 ) ) ( not ( = ?auto_173704 ?auto_173706 ) ) ( not ( = ?auto_173704 ?auto_173707 ) ) ( not ( = ?auto_173704 ?auto_173708 ) ) ( not ( = ?auto_173704 ?auto_173709 ) ) ( not ( = ?auto_173704 ?auto_173710 ) ) ( not ( = ?auto_173704 ?auto_173711 ) ) ( not ( = ?auto_173704 ?auto_173712 ) ) ( not ( = ?auto_173705 ?auto_173706 ) ) ( not ( = ?auto_173705 ?auto_173707 ) ) ( not ( = ?auto_173705 ?auto_173708 ) ) ( not ( = ?auto_173705 ?auto_173709 ) ) ( not ( = ?auto_173705 ?auto_173710 ) ) ( not ( = ?auto_173705 ?auto_173711 ) ) ( not ( = ?auto_173705 ?auto_173712 ) ) ( not ( = ?auto_173706 ?auto_173707 ) ) ( not ( = ?auto_173706 ?auto_173708 ) ) ( not ( = ?auto_173706 ?auto_173709 ) ) ( not ( = ?auto_173706 ?auto_173710 ) ) ( not ( = ?auto_173706 ?auto_173711 ) ) ( not ( = ?auto_173706 ?auto_173712 ) ) ( not ( = ?auto_173707 ?auto_173708 ) ) ( not ( = ?auto_173707 ?auto_173709 ) ) ( not ( = ?auto_173707 ?auto_173710 ) ) ( not ( = ?auto_173707 ?auto_173711 ) ) ( not ( = ?auto_173707 ?auto_173712 ) ) ( not ( = ?auto_173708 ?auto_173709 ) ) ( not ( = ?auto_173708 ?auto_173710 ) ) ( not ( = ?auto_173708 ?auto_173711 ) ) ( not ( = ?auto_173708 ?auto_173712 ) ) ( not ( = ?auto_173709 ?auto_173710 ) ) ( not ( = ?auto_173709 ?auto_173711 ) ) ( not ( = ?auto_173709 ?auto_173712 ) ) ( not ( = ?auto_173710 ?auto_173711 ) ) ( not ( = ?auto_173710 ?auto_173712 ) ) ( not ( = ?auto_173711 ?auto_173712 ) ) ( ON ?auto_173710 ?auto_173711 ) ( ON ?auto_173709 ?auto_173710 ) ( ON ?auto_173708 ?auto_173709 ) ( ON ?auto_173707 ?auto_173708 ) ( CLEAR ?auto_173705 ) ( ON ?auto_173706 ?auto_173707 ) ( CLEAR ?auto_173706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173702 ?auto_173703 ?auto_173704 ?auto_173705 ?auto_173706 )
      ( MAKE-10PILE ?auto_173702 ?auto_173703 ?auto_173704 ?auto_173705 ?auto_173706 ?auto_173707 ?auto_173708 ?auto_173709 ?auto_173710 ?auto_173711 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_173723 - BLOCK
      ?auto_173724 - BLOCK
      ?auto_173725 - BLOCK
      ?auto_173726 - BLOCK
      ?auto_173727 - BLOCK
      ?auto_173728 - BLOCK
      ?auto_173729 - BLOCK
      ?auto_173730 - BLOCK
      ?auto_173731 - BLOCK
      ?auto_173732 - BLOCK
    )
    :vars
    (
      ?auto_173733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173732 ?auto_173733 ) ( ON-TABLE ?auto_173723 ) ( ON ?auto_173724 ?auto_173723 ) ( ON ?auto_173725 ?auto_173724 ) ( ON ?auto_173726 ?auto_173725 ) ( not ( = ?auto_173723 ?auto_173724 ) ) ( not ( = ?auto_173723 ?auto_173725 ) ) ( not ( = ?auto_173723 ?auto_173726 ) ) ( not ( = ?auto_173723 ?auto_173727 ) ) ( not ( = ?auto_173723 ?auto_173728 ) ) ( not ( = ?auto_173723 ?auto_173729 ) ) ( not ( = ?auto_173723 ?auto_173730 ) ) ( not ( = ?auto_173723 ?auto_173731 ) ) ( not ( = ?auto_173723 ?auto_173732 ) ) ( not ( = ?auto_173723 ?auto_173733 ) ) ( not ( = ?auto_173724 ?auto_173725 ) ) ( not ( = ?auto_173724 ?auto_173726 ) ) ( not ( = ?auto_173724 ?auto_173727 ) ) ( not ( = ?auto_173724 ?auto_173728 ) ) ( not ( = ?auto_173724 ?auto_173729 ) ) ( not ( = ?auto_173724 ?auto_173730 ) ) ( not ( = ?auto_173724 ?auto_173731 ) ) ( not ( = ?auto_173724 ?auto_173732 ) ) ( not ( = ?auto_173724 ?auto_173733 ) ) ( not ( = ?auto_173725 ?auto_173726 ) ) ( not ( = ?auto_173725 ?auto_173727 ) ) ( not ( = ?auto_173725 ?auto_173728 ) ) ( not ( = ?auto_173725 ?auto_173729 ) ) ( not ( = ?auto_173725 ?auto_173730 ) ) ( not ( = ?auto_173725 ?auto_173731 ) ) ( not ( = ?auto_173725 ?auto_173732 ) ) ( not ( = ?auto_173725 ?auto_173733 ) ) ( not ( = ?auto_173726 ?auto_173727 ) ) ( not ( = ?auto_173726 ?auto_173728 ) ) ( not ( = ?auto_173726 ?auto_173729 ) ) ( not ( = ?auto_173726 ?auto_173730 ) ) ( not ( = ?auto_173726 ?auto_173731 ) ) ( not ( = ?auto_173726 ?auto_173732 ) ) ( not ( = ?auto_173726 ?auto_173733 ) ) ( not ( = ?auto_173727 ?auto_173728 ) ) ( not ( = ?auto_173727 ?auto_173729 ) ) ( not ( = ?auto_173727 ?auto_173730 ) ) ( not ( = ?auto_173727 ?auto_173731 ) ) ( not ( = ?auto_173727 ?auto_173732 ) ) ( not ( = ?auto_173727 ?auto_173733 ) ) ( not ( = ?auto_173728 ?auto_173729 ) ) ( not ( = ?auto_173728 ?auto_173730 ) ) ( not ( = ?auto_173728 ?auto_173731 ) ) ( not ( = ?auto_173728 ?auto_173732 ) ) ( not ( = ?auto_173728 ?auto_173733 ) ) ( not ( = ?auto_173729 ?auto_173730 ) ) ( not ( = ?auto_173729 ?auto_173731 ) ) ( not ( = ?auto_173729 ?auto_173732 ) ) ( not ( = ?auto_173729 ?auto_173733 ) ) ( not ( = ?auto_173730 ?auto_173731 ) ) ( not ( = ?auto_173730 ?auto_173732 ) ) ( not ( = ?auto_173730 ?auto_173733 ) ) ( not ( = ?auto_173731 ?auto_173732 ) ) ( not ( = ?auto_173731 ?auto_173733 ) ) ( not ( = ?auto_173732 ?auto_173733 ) ) ( ON ?auto_173731 ?auto_173732 ) ( ON ?auto_173730 ?auto_173731 ) ( ON ?auto_173729 ?auto_173730 ) ( ON ?auto_173728 ?auto_173729 ) ( CLEAR ?auto_173726 ) ( ON ?auto_173727 ?auto_173728 ) ( CLEAR ?auto_173727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173723 ?auto_173724 ?auto_173725 ?auto_173726 ?auto_173727 )
      ( MAKE-10PILE ?auto_173723 ?auto_173724 ?auto_173725 ?auto_173726 ?auto_173727 ?auto_173728 ?auto_173729 ?auto_173730 ?auto_173731 ?auto_173732 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_173744 - BLOCK
      ?auto_173745 - BLOCK
      ?auto_173746 - BLOCK
      ?auto_173747 - BLOCK
      ?auto_173748 - BLOCK
      ?auto_173749 - BLOCK
      ?auto_173750 - BLOCK
      ?auto_173751 - BLOCK
      ?auto_173752 - BLOCK
      ?auto_173753 - BLOCK
    )
    :vars
    (
      ?auto_173754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173753 ?auto_173754 ) ( ON-TABLE ?auto_173744 ) ( ON ?auto_173745 ?auto_173744 ) ( ON ?auto_173746 ?auto_173745 ) ( not ( = ?auto_173744 ?auto_173745 ) ) ( not ( = ?auto_173744 ?auto_173746 ) ) ( not ( = ?auto_173744 ?auto_173747 ) ) ( not ( = ?auto_173744 ?auto_173748 ) ) ( not ( = ?auto_173744 ?auto_173749 ) ) ( not ( = ?auto_173744 ?auto_173750 ) ) ( not ( = ?auto_173744 ?auto_173751 ) ) ( not ( = ?auto_173744 ?auto_173752 ) ) ( not ( = ?auto_173744 ?auto_173753 ) ) ( not ( = ?auto_173744 ?auto_173754 ) ) ( not ( = ?auto_173745 ?auto_173746 ) ) ( not ( = ?auto_173745 ?auto_173747 ) ) ( not ( = ?auto_173745 ?auto_173748 ) ) ( not ( = ?auto_173745 ?auto_173749 ) ) ( not ( = ?auto_173745 ?auto_173750 ) ) ( not ( = ?auto_173745 ?auto_173751 ) ) ( not ( = ?auto_173745 ?auto_173752 ) ) ( not ( = ?auto_173745 ?auto_173753 ) ) ( not ( = ?auto_173745 ?auto_173754 ) ) ( not ( = ?auto_173746 ?auto_173747 ) ) ( not ( = ?auto_173746 ?auto_173748 ) ) ( not ( = ?auto_173746 ?auto_173749 ) ) ( not ( = ?auto_173746 ?auto_173750 ) ) ( not ( = ?auto_173746 ?auto_173751 ) ) ( not ( = ?auto_173746 ?auto_173752 ) ) ( not ( = ?auto_173746 ?auto_173753 ) ) ( not ( = ?auto_173746 ?auto_173754 ) ) ( not ( = ?auto_173747 ?auto_173748 ) ) ( not ( = ?auto_173747 ?auto_173749 ) ) ( not ( = ?auto_173747 ?auto_173750 ) ) ( not ( = ?auto_173747 ?auto_173751 ) ) ( not ( = ?auto_173747 ?auto_173752 ) ) ( not ( = ?auto_173747 ?auto_173753 ) ) ( not ( = ?auto_173747 ?auto_173754 ) ) ( not ( = ?auto_173748 ?auto_173749 ) ) ( not ( = ?auto_173748 ?auto_173750 ) ) ( not ( = ?auto_173748 ?auto_173751 ) ) ( not ( = ?auto_173748 ?auto_173752 ) ) ( not ( = ?auto_173748 ?auto_173753 ) ) ( not ( = ?auto_173748 ?auto_173754 ) ) ( not ( = ?auto_173749 ?auto_173750 ) ) ( not ( = ?auto_173749 ?auto_173751 ) ) ( not ( = ?auto_173749 ?auto_173752 ) ) ( not ( = ?auto_173749 ?auto_173753 ) ) ( not ( = ?auto_173749 ?auto_173754 ) ) ( not ( = ?auto_173750 ?auto_173751 ) ) ( not ( = ?auto_173750 ?auto_173752 ) ) ( not ( = ?auto_173750 ?auto_173753 ) ) ( not ( = ?auto_173750 ?auto_173754 ) ) ( not ( = ?auto_173751 ?auto_173752 ) ) ( not ( = ?auto_173751 ?auto_173753 ) ) ( not ( = ?auto_173751 ?auto_173754 ) ) ( not ( = ?auto_173752 ?auto_173753 ) ) ( not ( = ?auto_173752 ?auto_173754 ) ) ( not ( = ?auto_173753 ?auto_173754 ) ) ( ON ?auto_173752 ?auto_173753 ) ( ON ?auto_173751 ?auto_173752 ) ( ON ?auto_173750 ?auto_173751 ) ( ON ?auto_173749 ?auto_173750 ) ( ON ?auto_173748 ?auto_173749 ) ( CLEAR ?auto_173746 ) ( ON ?auto_173747 ?auto_173748 ) ( CLEAR ?auto_173747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173744 ?auto_173745 ?auto_173746 ?auto_173747 )
      ( MAKE-10PILE ?auto_173744 ?auto_173745 ?auto_173746 ?auto_173747 ?auto_173748 ?auto_173749 ?auto_173750 ?auto_173751 ?auto_173752 ?auto_173753 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_173765 - BLOCK
      ?auto_173766 - BLOCK
      ?auto_173767 - BLOCK
      ?auto_173768 - BLOCK
      ?auto_173769 - BLOCK
      ?auto_173770 - BLOCK
      ?auto_173771 - BLOCK
      ?auto_173772 - BLOCK
      ?auto_173773 - BLOCK
      ?auto_173774 - BLOCK
    )
    :vars
    (
      ?auto_173775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173774 ?auto_173775 ) ( ON-TABLE ?auto_173765 ) ( ON ?auto_173766 ?auto_173765 ) ( ON ?auto_173767 ?auto_173766 ) ( not ( = ?auto_173765 ?auto_173766 ) ) ( not ( = ?auto_173765 ?auto_173767 ) ) ( not ( = ?auto_173765 ?auto_173768 ) ) ( not ( = ?auto_173765 ?auto_173769 ) ) ( not ( = ?auto_173765 ?auto_173770 ) ) ( not ( = ?auto_173765 ?auto_173771 ) ) ( not ( = ?auto_173765 ?auto_173772 ) ) ( not ( = ?auto_173765 ?auto_173773 ) ) ( not ( = ?auto_173765 ?auto_173774 ) ) ( not ( = ?auto_173765 ?auto_173775 ) ) ( not ( = ?auto_173766 ?auto_173767 ) ) ( not ( = ?auto_173766 ?auto_173768 ) ) ( not ( = ?auto_173766 ?auto_173769 ) ) ( not ( = ?auto_173766 ?auto_173770 ) ) ( not ( = ?auto_173766 ?auto_173771 ) ) ( not ( = ?auto_173766 ?auto_173772 ) ) ( not ( = ?auto_173766 ?auto_173773 ) ) ( not ( = ?auto_173766 ?auto_173774 ) ) ( not ( = ?auto_173766 ?auto_173775 ) ) ( not ( = ?auto_173767 ?auto_173768 ) ) ( not ( = ?auto_173767 ?auto_173769 ) ) ( not ( = ?auto_173767 ?auto_173770 ) ) ( not ( = ?auto_173767 ?auto_173771 ) ) ( not ( = ?auto_173767 ?auto_173772 ) ) ( not ( = ?auto_173767 ?auto_173773 ) ) ( not ( = ?auto_173767 ?auto_173774 ) ) ( not ( = ?auto_173767 ?auto_173775 ) ) ( not ( = ?auto_173768 ?auto_173769 ) ) ( not ( = ?auto_173768 ?auto_173770 ) ) ( not ( = ?auto_173768 ?auto_173771 ) ) ( not ( = ?auto_173768 ?auto_173772 ) ) ( not ( = ?auto_173768 ?auto_173773 ) ) ( not ( = ?auto_173768 ?auto_173774 ) ) ( not ( = ?auto_173768 ?auto_173775 ) ) ( not ( = ?auto_173769 ?auto_173770 ) ) ( not ( = ?auto_173769 ?auto_173771 ) ) ( not ( = ?auto_173769 ?auto_173772 ) ) ( not ( = ?auto_173769 ?auto_173773 ) ) ( not ( = ?auto_173769 ?auto_173774 ) ) ( not ( = ?auto_173769 ?auto_173775 ) ) ( not ( = ?auto_173770 ?auto_173771 ) ) ( not ( = ?auto_173770 ?auto_173772 ) ) ( not ( = ?auto_173770 ?auto_173773 ) ) ( not ( = ?auto_173770 ?auto_173774 ) ) ( not ( = ?auto_173770 ?auto_173775 ) ) ( not ( = ?auto_173771 ?auto_173772 ) ) ( not ( = ?auto_173771 ?auto_173773 ) ) ( not ( = ?auto_173771 ?auto_173774 ) ) ( not ( = ?auto_173771 ?auto_173775 ) ) ( not ( = ?auto_173772 ?auto_173773 ) ) ( not ( = ?auto_173772 ?auto_173774 ) ) ( not ( = ?auto_173772 ?auto_173775 ) ) ( not ( = ?auto_173773 ?auto_173774 ) ) ( not ( = ?auto_173773 ?auto_173775 ) ) ( not ( = ?auto_173774 ?auto_173775 ) ) ( ON ?auto_173773 ?auto_173774 ) ( ON ?auto_173772 ?auto_173773 ) ( ON ?auto_173771 ?auto_173772 ) ( ON ?auto_173770 ?auto_173771 ) ( ON ?auto_173769 ?auto_173770 ) ( CLEAR ?auto_173767 ) ( ON ?auto_173768 ?auto_173769 ) ( CLEAR ?auto_173768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173765 ?auto_173766 ?auto_173767 ?auto_173768 )
      ( MAKE-10PILE ?auto_173765 ?auto_173766 ?auto_173767 ?auto_173768 ?auto_173769 ?auto_173770 ?auto_173771 ?auto_173772 ?auto_173773 ?auto_173774 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_173786 - BLOCK
      ?auto_173787 - BLOCK
      ?auto_173788 - BLOCK
      ?auto_173789 - BLOCK
      ?auto_173790 - BLOCK
      ?auto_173791 - BLOCK
      ?auto_173792 - BLOCK
      ?auto_173793 - BLOCK
      ?auto_173794 - BLOCK
      ?auto_173795 - BLOCK
    )
    :vars
    (
      ?auto_173796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173795 ?auto_173796 ) ( ON-TABLE ?auto_173786 ) ( ON ?auto_173787 ?auto_173786 ) ( not ( = ?auto_173786 ?auto_173787 ) ) ( not ( = ?auto_173786 ?auto_173788 ) ) ( not ( = ?auto_173786 ?auto_173789 ) ) ( not ( = ?auto_173786 ?auto_173790 ) ) ( not ( = ?auto_173786 ?auto_173791 ) ) ( not ( = ?auto_173786 ?auto_173792 ) ) ( not ( = ?auto_173786 ?auto_173793 ) ) ( not ( = ?auto_173786 ?auto_173794 ) ) ( not ( = ?auto_173786 ?auto_173795 ) ) ( not ( = ?auto_173786 ?auto_173796 ) ) ( not ( = ?auto_173787 ?auto_173788 ) ) ( not ( = ?auto_173787 ?auto_173789 ) ) ( not ( = ?auto_173787 ?auto_173790 ) ) ( not ( = ?auto_173787 ?auto_173791 ) ) ( not ( = ?auto_173787 ?auto_173792 ) ) ( not ( = ?auto_173787 ?auto_173793 ) ) ( not ( = ?auto_173787 ?auto_173794 ) ) ( not ( = ?auto_173787 ?auto_173795 ) ) ( not ( = ?auto_173787 ?auto_173796 ) ) ( not ( = ?auto_173788 ?auto_173789 ) ) ( not ( = ?auto_173788 ?auto_173790 ) ) ( not ( = ?auto_173788 ?auto_173791 ) ) ( not ( = ?auto_173788 ?auto_173792 ) ) ( not ( = ?auto_173788 ?auto_173793 ) ) ( not ( = ?auto_173788 ?auto_173794 ) ) ( not ( = ?auto_173788 ?auto_173795 ) ) ( not ( = ?auto_173788 ?auto_173796 ) ) ( not ( = ?auto_173789 ?auto_173790 ) ) ( not ( = ?auto_173789 ?auto_173791 ) ) ( not ( = ?auto_173789 ?auto_173792 ) ) ( not ( = ?auto_173789 ?auto_173793 ) ) ( not ( = ?auto_173789 ?auto_173794 ) ) ( not ( = ?auto_173789 ?auto_173795 ) ) ( not ( = ?auto_173789 ?auto_173796 ) ) ( not ( = ?auto_173790 ?auto_173791 ) ) ( not ( = ?auto_173790 ?auto_173792 ) ) ( not ( = ?auto_173790 ?auto_173793 ) ) ( not ( = ?auto_173790 ?auto_173794 ) ) ( not ( = ?auto_173790 ?auto_173795 ) ) ( not ( = ?auto_173790 ?auto_173796 ) ) ( not ( = ?auto_173791 ?auto_173792 ) ) ( not ( = ?auto_173791 ?auto_173793 ) ) ( not ( = ?auto_173791 ?auto_173794 ) ) ( not ( = ?auto_173791 ?auto_173795 ) ) ( not ( = ?auto_173791 ?auto_173796 ) ) ( not ( = ?auto_173792 ?auto_173793 ) ) ( not ( = ?auto_173792 ?auto_173794 ) ) ( not ( = ?auto_173792 ?auto_173795 ) ) ( not ( = ?auto_173792 ?auto_173796 ) ) ( not ( = ?auto_173793 ?auto_173794 ) ) ( not ( = ?auto_173793 ?auto_173795 ) ) ( not ( = ?auto_173793 ?auto_173796 ) ) ( not ( = ?auto_173794 ?auto_173795 ) ) ( not ( = ?auto_173794 ?auto_173796 ) ) ( not ( = ?auto_173795 ?auto_173796 ) ) ( ON ?auto_173794 ?auto_173795 ) ( ON ?auto_173793 ?auto_173794 ) ( ON ?auto_173792 ?auto_173793 ) ( ON ?auto_173791 ?auto_173792 ) ( ON ?auto_173790 ?auto_173791 ) ( ON ?auto_173789 ?auto_173790 ) ( CLEAR ?auto_173787 ) ( ON ?auto_173788 ?auto_173789 ) ( CLEAR ?auto_173788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173786 ?auto_173787 ?auto_173788 )
      ( MAKE-10PILE ?auto_173786 ?auto_173787 ?auto_173788 ?auto_173789 ?auto_173790 ?auto_173791 ?auto_173792 ?auto_173793 ?auto_173794 ?auto_173795 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_173807 - BLOCK
      ?auto_173808 - BLOCK
      ?auto_173809 - BLOCK
      ?auto_173810 - BLOCK
      ?auto_173811 - BLOCK
      ?auto_173812 - BLOCK
      ?auto_173813 - BLOCK
      ?auto_173814 - BLOCK
      ?auto_173815 - BLOCK
      ?auto_173816 - BLOCK
    )
    :vars
    (
      ?auto_173817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173816 ?auto_173817 ) ( ON-TABLE ?auto_173807 ) ( ON ?auto_173808 ?auto_173807 ) ( not ( = ?auto_173807 ?auto_173808 ) ) ( not ( = ?auto_173807 ?auto_173809 ) ) ( not ( = ?auto_173807 ?auto_173810 ) ) ( not ( = ?auto_173807 ?auto_173811 ) ) ( not ( = ?auto_173807 ?auto_173812 ) ) ( not ( = ?auto_173807 ?auto_173813 ) ) ( not ( = ?auto_173807 ?auto_173814 ) ) ( not ( = ?auto_173807 ?auto_173815 ) ) ( not ( = ?auto_173807 ?auto_173816 ) ) ( not ( = ?auto_173807 ?auto_173817 ) ) ( not ( = ?auto_173808 ?auto_173809 ) ) ( not ( = ?auto_173808 ?auto_173810 ) ) ( not ( = ?auto_173808 ?auto_173811 ) ) ( not ( = ?auto_173808 ?auto_173812 ) ) ( not ( = ?auto_173808 ?auto_173813 ) ) ( not ( = ?auto_173808 ?auto_173814 ) ) ( not ( = ?auto_173808 ?auto_173815 ) ) ( not ( = ?auto_173808 ?auto_173816 ) ) ( not ( = ?auto_173808 ?auto_173817 ) ) ( not ( = ?auto_173809 ?auto_173810 ) ) ( not ( = ?auto_173809 ?auto_173811 ) ) ( not ( = ?auto_173809 ?auto_173812 ) ) ( not ( = ?auto_173809 ?auto_173813 ) ) ( not ( = ?auto_173809 ?auto_173814 ) ) ( not ( = ?auto_173809 ?auto_173815 ) ) ( not ( = ?auto_173809 ?auto_173816 ) ) ( not ( = ?auto_173809 ?auto_173817 ) ) ( not ( = ?auto_173810 ?auto_173811 ) ) ( not ( = ?auto_173810 ?auto_173812 ) ) ( not ( = ?auto_173810 ?auto_173813 ) ) ( not ( = ?auto_173810 ?auto_173814 ) ) ( not ( = ?auto_173810 ?auto_173815 ) ) ( not ( = ?auto_173810 ?auto_173816 ) ) ( not ( = ?auto_173810 ?auto_173817 ) ) ( not ( = ?auto_173811 ?auto_173812 ) ) ( not ( = ?auto_173811 ?auto_173813 ) ) ( not ( = ?auto_173811 ?auto_173814 ) ) ( not ( = ?auto_173811 ?auto_173815 ) ) ( not ( = ?auto_173811 ?auto_173816 ) ) ( not ( = ?auto_173811 ?auto_173817 ) ) ( not ( = ?auto_173812 ?auto_173813 ) ) ( not ( = ?auto_173812 ?auto_173814 ) ) ( not ( = ?auto_173812 ?auto_173815 ) ) ( not ( = ?auto_173812 ?auto_173816 ) ) ( not ( = ?auto_173812 ?auto_173817 ) ) ( not ( = ?auto_173813 ?auto_173814 ) ) ( not ( = ?auto_173813 ?auto_173815 ) ) ( not ( = ?auto_173813 ?auto_173816 ) ) ( not ( = ?auto_173813 ?auto_173817 ) ) ( not ( = ?auto_173814 ?auto_173815 ) ) ( not ( = ?auto_173814 ?auto_173816 ) ) ( not ( = ?auto_173814 ?auto_173817 ) ) ( not ( = ?auto_173815 ?auto_173816 ) ) ( not ( = ?auto_173815 ?auto_173817 ) ) ( not ( = ?auto_173816 ?auto_173817 ) ) ( ON ?auto_173815 ?auto_173816 ) ( ON ?auto_173814 ?auto_173815 ) ( ON ?auto_173813 ?auto_173814 ) ( ON ?auto_173812 ?auto_173813 ) ( ON ?auto_173811 ?auto_173812 ) ( ON ?auto_173810 ?auto_173811 ) ( CLEAR ?auto_173808 ) ( ON ?auto_173809 ?auto_173810 ) ( CLEAR ?auto_173809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173807 ?auto_173808 ?auto_173809 )
      ( MAKE-10PILE ?auto_173807 ?auto_173808 ?auto_173809 ?auto_173810 ?auto_173811 ?auto_173812 ?auto_173813 ?auto_173814 ?auto_173815 ?auto_173816 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_173828 - BLOCK
      ?auto_173829 - BLOCK
      ?auto_173830 - BLOCK
      ?auto_173831 - BLOCK
      ?auto_173832 - BLOCK
      ?auto_173833 - BLOCK
      ?auto_173834 - BLOCK
      ?auto_173835 - BLOCK
      ?auto_173836 - BLOCK
      ?auto_173837 - BLOCK
    )
    :vars
    (
      ?auto_173838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173837 ?auto_173838 ) ( ON-TABLE ?auto_173828 ) ( not ( = ?auto_173828 ?auto_173829 ) ) ( not ( = ?auto_173828 ?auto_173830 ) ) ( not ( = ?auto_173828 ?auto_173831 ) ) ( not ( = ?auto_173828 ?auto_173832 ) ) ( not ( = ?auto_173828 ?auto_173833 ) ) ( not ( = ?auto_173828 ?auto_173834 ) ) ( not ( = ?auto_173828 ?auto_173835 ) ) ( not ( = ?auto_173828 ?auto_173836 ) ) ( not ( = ?auto_173828 ?auto_173837 ) ) ( not ( = ?auto_173828 ?auto_173838 ) ) ( not ( = ?auto_173829 ?auto_173830 ) ) ( not ( = ?auto_173829 ?auto_173831 ) ) ( not ( = ?auto_173829 ?auto_173832 ) ) ( not ( = ?auto_173829 ?auto_173833 ) ) ( not ( = ?auto_173829 ?auto_173834 ) ) ( not ( = ?auto_173829 ?auto_173835 ) ) ( not ( = ?auto_173829 ?auto_173836 ) ) ( not ( = ?auto_173829 ?auto_173837 ) ) ( not ( = ?auto_173829 ?auto_173838 ) ) ( not ( = ?auto_173830 ?auto_173831 ) ) ( not ( = ?auto_173830 ?auto_173832 ) ) ( not ( = ?auto_173830 ?auto_173833 ) ) ( not ( = ?auto_173830 ?auto_173834 ) ) ( not ( = ?auto_173830 ?auto_173835 ) ) ( not ( = ?auto_173830 ?auto_173836 ) ) ( not ( = ?auto_173830 ?auto_173837 ) ) ( not ( = ?auto_173830 ?auto_173838 ) ) ( not ( = ?auto_173831 ?auto_173832 ) ) ( not ( = ?auto_173831 ?auto_173833 ) ) ( not ( = ?auto_173831 ?auto_173834 ) ) ( not ( = ?auto_173831 ?auto_173835 ) ) ( not ( = ?auto_173831 ?auto_173836 ) ) ( not ( = ?auto_173831 ?auto_173837 ) ) ( not ( = ?auto_173831 ?auto_173838 ) ) ( not ( = ?auto_173832 ?auto_173833 ) ) ( not ( = ?auto_173832 ?auto_173834 ) ) ( not ( = ?auto_173832 ?auto_173835 ) ) ( not ( = ?auto_173832 ?auto_173836 ) ) ( not ( = ?auto_173832 ?auto_173837 ) ) ( not ( = ?auto_173832 ?auto_173838 ) ) ( not ( = ?auto_173833 ?auto_173834 ) ) ( not ( = ?auto_173833 ?auto_173835 ) ) ( not ( = ?auto_173833 ?auto_173836 ) ) ( not ( = ?auto_173833 ?auto_173837 ) ) ( not ( = ?auto_173833 ?auto_173838 ) ) ( not ( = ?auto_173834 ?auto_173835 ) ) ( not ( = ?auto_173834 ?auto_173836 ) ) ( not ( = ?auto_173834 ?auto_173837 ) ) ( not ( = ?auto_173834 ?auto_173838 ) ) ( not ( = ?auto_173835 ?auto_173836 ) ) ( not ( = ?auto_173835 ?auto_173837 ) ) ( not ( = ?auto_173835 ?auto_173838 ) ) ( not ( = ?auto_173836 ?auto_173837 ) ) ( not ( = ?auto_173836 ?auto_173838 ) ) ( not ( = ?auto_173837 ?auto_173838 ) ) ( ON ?auto_173836 ?auto_173837 ) ( ON ?auto_173835 ?auto_173836 ) ( ON ?auto_173834 ?auto_173835 ) ( ON ?auto_173833 ?auto_173834 ) ( ON ?auto_173832 ?auto_173833 ) ( ON ?auto_173831 ?auto_173832 ) ( ON ?auto_173830 ?auto_173831 ) ( CLEAR ?auto_173828 ) ( ON ?auto_173829 ?auto_173830 ) ( CLEAR ?auto_173829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173828 ?auto_173829 )
      ( MAKE-10PILE ?auto_173828 ?auto_173829 ?auto_173830 ?auto_173831 ?auto_173832 ?auto_173833 ?auto_173834 ?auto_173835 ?auto_173836 ?auto_173837 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_173849 - BLOCK
      ?auto_173850 - BLOCK
      ?auto_173851 - BLOCK
      ?auto_173852 - BLOCK
      ?auto_173853 - BLOCK
      ?auto_173854 - BLOCK
      ?auto_173855 - BLOCK
      ?auto_173856 - BLOCK
      ?auto_173857 - BLOCK
      ?auto_173858 - BLOCK
    )
    :vars
    (
      ?auto_173859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173858 ?auto_173859 ) ( ON-TABLE ?auto_173849 ) ( not ( = ?auto_173849 ?auto_173850 ) ) ( not ( = ?auto_173849 ?auto_173851 ) ) ( not ( = ?auto_173849 ?auto_173852 ) ) ( not ( = ?auto_173849 ?auto_173853 ) ) ( not ( = ?auto_173849 ?auto_173854 ) ) ( not ( = ?auto_173849 ?auto_173855 ) ) ( not ( = ?auto_173849 ?auto_173856 ) ) ( not ( = ?auto_173849 ?auto_173857 ) ) ( not ( = ?auto_173849 ?auto_173858 ) ) ( not ( = ?auto_173849 ?auto_173859 ) ) ( not ( = ?auto_173850 ?auto_173851 ) ) ( not ( = ?auto_173850 ?auto_173852 ) ) ( not ( = ?auto_173850 ?auto_173853 ) ) ( not ( = ?auto_173850 ?auto_173854 ) ) ( not ( = ?auto_173850 ?auto_173855 ) ) ( not ( = ?auto_173850 ?auto_173856 ) ) ( not ( = ?auto_173850 ?auto_173857 ) ) ( not ( = ?auto_173850 ?auto_173858 ) ) ( not ( = ?auto_173850 ?auto_173859 ) ) ( not ( = ?auto_173851 ?auto_173852 ) ) ( not ( = ?auto_173851 ?auto_173853 ) ) ( not ( = ?auto_173851 ?auto_173854 ) ) ( not ( = ?auto_173851 ?auto_173855 ) ) ( not ( = ?auto_173851 ?auto_173856 ) ) ( not ( = ?auto_173851 ?auto_173857 ) ) ( not ( = ?auto_173851 ?auto_173858 ) ) ( not ( = ?auto_173851 ?auto_173859 ) ) ( not ( = ?auto_173852 ?auto_173853 ) ) ( not ( = ?auto_173852 ?auto_173854 ) ) ( not ( = ?auto_173852 ?auto_173855 ) ) ( not ( = ?auto_173852 ?auto_173856 ) ) ( not ( = ?auto_173852 ?auto_173857 ) ) ( not ( = ?auto_173852 ?auto_173858 ) ) ( not ( = ?auto_173852 ?auto_173859 ) ) ( not ( = ?auto_173853 ?auto_173854 ) ) ( not ( = ?auto_173853 ?auto_173855 ) ) ( not ( = ?auto_173853 ?auto_173856 ) ) ( not ( = ?auto_173853 ?auto_173857 ) ) ( not ( = ?auto_173853 ?auto_173858 ) ) ( not ( = ?auto_173853 ?auto_173859 ) ) ( not ( = ?auto_173854 ?auto_173855 ) ) ( not ( = ?auto_173854 ?auto_173856 ) ) ( not ( = ?auto_173854 ?auto_173857 ) ) ( not ( = ?auto_173854 ?auto_173858 ) ) ( not ( = ?auto_173854 ?auto_173859 ) ) ( not ( = ?auto_173855 ?auto_173856 ) ) ( not ( = ?auto_173855 ?auto_173857 ) ) ( not ( = ?auto_173855 ?auto_173858 ) ) ( not ( = ?auto_173855 ?auto_173859 ) ) ( not ( = ?auto_173856 ?auto_173857 ) ) ( not ( = ?auto_173856 ?auto_173858 ) ) ( not ( = ?auto_173856 ?auto_173859 ) ) ( not ( = ?auto_173857 ?auto_173858 ) ) ( not ( = ?auto_173857 ?auto_173859 ) ) ( not ( = ?auto_173858 ?auto_173859 ) ) ( ON ?auto_173857 ?auto_173858 ) ( ON ?auto_173856 ?auto_173857 ) ( ON ?auto_173855 ?auto_173856 ) ( ON ?auto_173854 ?auto_173855 ) ( ON ?auto_173853 ?auto_173854 ) ( ON ?auto_173852 ?auto_173853 ) ( ON ?auto_173851 ?auto_173852 ) ( CLEAR ?auto_173849 ) ( ON ?auto_173850 ?auto_173851 ) ( CLEAR ?auto_173850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173849 ?auto_173850 )
      ( MAKE-10PILE ?auto_173849 ?auto_173850 ?auto_173851 ?auto_173852 ?auto_173853 ?auto_173854 ?auto_173855 ?auto_173856 ?auto_173857 ?auto_173858 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_173870 - BLOCK
      ?auto_173871 - BLOCK
      ?auto_173872 - BLOCK
      ?auto_173873 - BLOCK
      ?auto_173874 - BLOCK
      ?auto_173875 - BLOCK
      ?auto_173876 - BLOCK
      ?auto_173877 - BLOCK
      ?auto_173878 - BLOCK
      ?auto_173879 - BLOCK
    )
    :vars
    (
      ?auto_173880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173879 ?auto_173880 ) ( not ( = ?auto_173870 ?auto_173871 ) ) ( not ( = ?auto_173870 ?auto_173872 ) ) ( not ( = ?auto_173870 ?auto_173873 ) ) ( not ( = ?auto_173870 ?auto_173874 ) ) ( not ( = ?auto_173870 ?auto_173875 ) ) ( not ( = ?auto_173870 ?auto_173876 ) ) ( not ( = ?auto_173870 ?auto_173877 ) ) ( not ( = ?auto_173870 ?auto_173878 ) ) ( not ( = ?auto_173870 ?auto_173879 ) ) ( not ( = ?auto_173870 ?auto_173880 ) ) ( not ( = ?auto_173871 ?auto_173872 ) ) ( not ( = ?auto_173871 ?auto_173873 ) ) ( not ( = ?auto_173871 ?auto_173874 ) ) ( not ( = ?auto_173871 ?auto_173875 ) ) ( not ( = ?auto_173871 ?auto_173876 ) ) ( not ( = ?auto_173871 ?auto_173877 ) ) ( not ( = ?auto_173871 ?auto_173878 ) ) ( not ( = ?auto_173871 ?auto_173879 ) ) ( not ( = ?auto_173871 ?auto_173880 ) ) ( not ( = ?auto_173872 ?auto_173873 ) ) ( not ( = ?auto_173872 ?auto_173874 ) ) ( not ( = ?auto_173872 ?auto_173875 ) ) ( not ( = ?auto_173872 ?auto_173876 ) ) ( not ( = ?auto_173872 ?auto_173877 ) ) ( not ( = ?auto_173872 ?auto_173878 ) ) ( not ( = ?auto_173872 ?auto_173879 ) ) ( not ( = ?auto_173872 ?auto_173880 ) ) ( not ( = ?auto_173873 ?auto_173874 ) ) ( not ( = ?auto_173873 ?auto_173875 ) ) ( not ( = ?auto_173873 ?auto_173876 ) ) ( not ( = ?auto_173873 ?auto_173877 ) ) ( not ( = ?auto_173873 ?auto_173878 ) ) ( not ( = ?auto_173873 ?auto_173879 ) ) ( not ( = ?auto_173873 ?auto_173880 ) ) ( not ( = ?auto_173874 ?auto_173875 ) ) ( not ( = ?auto_173874 ?auto_173876 ) ) ( not ( = ?auto_173874 ?auto_173877 ) ) ( not ( = ?auto_173874 ?auto_173878 ) ) ( not ( = ?auto_173874 ?auto_173879 ) ) ( not ( = ?auto_173874 ?auto_173880 ) ) ( not ( = ?auto_173875 ?auto_173876 ) ) ( not ( = ?auto_173875 ?auto_173877 ) ) ( not ( = ?auto_173875 ?auto_173878 ) ) ( not ( = ?auto_173875 ?auto_173879 ) ) ( not ( = ?auto_173875 ?auto_173880 ) ) ( not ( = ?auto_173876 ?auto_173877 ) ) ( not ( = ?auto_173876 ?auto_173878 ) ) ( not ( = ?auto_173876 ?auto_173879 ) ) ( not ( = ?auto_173876 ?auto_173880 ) ) ( not ( = ?auto_173877 ?auto_173878 ) ) ( not ( = ?auto_173877 ?auto_173879 ) ) ( not ( = ?auto_173877 ?auto_173880 ) ) ( not ( = ?auto_173878 ?auto_173879 ) ) ( not ( = ?auto_173878 ?auto_173880 ) ) ( not ( = ?auto_173879 ?auto_173880 ) ) ( ON ?auto_173878 ?auto_173879 ) ( ON ?auto_173877 ?auto_173878 ) ( ON ?auto_173876 ?auto_173877 ) ( ON ?auto_173875 ?auto_173876 ) ( ON ?auto_173874 ?auto_173875 ) ( ON ?auto_173873 ?auto_173874 ) ( ON ?auto_173872 ?auto_173873 ) ( ON ?auto_173871 ?auto_173872 ) ( ON ?auto_173870 ?auto_173871 ) ( CLEAR ?auto_173870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_173870 )
      ( MAKE-10PILE ?auto_173870 ?auto_173871 ?auto_173872 ?auto_173873 ?auto_173874 ?auto_173875 ?auto_173876 ?auto_173877 ?auto_173878 ?auto_173879 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_173891 - BLOCK
      ?auto_173892 - BLOCK
      ?auto_173893 - BLOCK
      ?auto_173894 - BLOCK
      ?auto_173895 - BLOCK
      ?auto_173896 - BLOCK
      ?auto_173897 - BLOCK
      ?auto_173898 - BLOCK
      ?auto_173899 - BLOCK
      ?auto_173900 - BLOCK
    )
    :vars
    (
      ?auto_173901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173900 ?auto_173901 ) ( not ( = ?auto_173891 ?auto_173892 ) ) ( not ( = ?auto_173891 ?auto_173893 ) ) ( not ( = ?auto_173891 ?auto_173894 ) ) ( not ( = ?auto_173891 ?auto_173895 ) ) ( not ( = ?auto_173891 ?auto_173896 ) ) ( not ( = ?auto_173891 ?auto_173897 ) ) ( not ( = ?auto_173891 ?auto_173898 ) ) ( not ( = ?auto_173891 ?auto_173899 ) ) ( not ( = ?auto_173891 ?auto_173900 ) ) ( not ( = ?auto_173891 ?auto_173901 ) ) ( not ( = ?auto_173892 ?auto_173893 ) ) ( not ( = ?auto_173892 ?auto_173894 ) ) ( not ( = ?auto_173892 ?auto_173895 ) ) ( not ( = ?auto_173892 ?auto_173896 ) ) ( not ( = ?auto_173892 ?auto_173897 ) ) ( not ( = ?auto_173892 ?auto_173898 ) ) ( not ( = ?auto_173892 ?auto_173899 ) ) ( not ( = ?auto_173892 ?auto_173900 ) ) ( not ( = ?auto_173892 ?auto_173901 ) ) ( not ( = ?auto_173893 ?auto_173894 ) ) ( not ( = ?auto_173893 ?auto_173895 ) ) ( not ( = ?auto_173893 ?auto_173896 ) ) ( not ( = ?auto_173893 ?auto_173897 ) ) ( not ( = ?auto_173893 ?auto_173898 ) ) ( not ( = ?auto_173893 ?auto_173899 ) ) ( not ( = ?auto_173893 ?auto_173900 ) ) ( not ( = ?auto_173893 ?auto_173901 ) ) ( not ( = ?auto_173894 ?auto_173895 ) ) ( not ( = ?auto_173894 ?auto_173896 ) ) ( not ( = ?auto_173894 ?auto_173897 ) ) ( not ( = ?auto_173894 ?auto_173898 ) ) ( not ( = ?auto_173894 ?auto_173899 ) ) ( not ( = ?auto_173894 ?auto_173900 ) ) ( not ( = ?auto_173894 ?auto_173901 ) ) ( not ( = ?auto_173895 ?auto_173896 ) ) ( not ( = ?auto_173895 ?auto_173897 ) ) ( not ( = ?auto_173895 ?auto_173898 ) ) ( not ( = ?auto_173895 ?auto_173899 ) ) ( not ( = ?auto_173895 ?auto_173900 ) ) ( not ( = ?auto_173895 ?auto_173901 ) ) ( not ( = ?auto_173896 ?auto_173897 ) ) ( not ( = ?auto_173896 ?auto_173898 ) ) ( not ( = ?auto_173896 ?auto_173899 ) ) ( not ( = ?auto_173896 ?auto_173900 ) ) ( not ( = ?auto_173896 ?auto_173901 ) ) ( not ( = ?auto_173897 ?auto_173898 ) ) ( not ( = ?auto_173897 ?auto_173899 ) ) ( not ( = ?auto_173897 ?auto_173900 ) ) ( not ( = ?auto_173897 ?auto_173901 ) ) ( not ( = ?auto_173898 ?auto_173899 ) ) ( not ( = ?auto_173898 ?auto_173900 ) ) ( not ( = ?auto_173898 ?auto_173901 ) ) ( not ( = ?auto_173899 ?auto_173900 ) ) ( not ( = ?auto_173899 ?auto_173901 ) ) ( not ( = ?auto_173900 ?auto_173901 ) ) ( ON ?auto_173899 ?auto_173900 ) ( ON ?auto_173898 ?auto_173899 ) ( ON ?auto_173897 ?auto_173898 ) ( ON ?auto_173896 ?auto_173897 ) ( ON ?auto_173895 ?auto_173896 ) ( ON ?auto_173894 ?auto_173895 ) ( ON ?auto_173893 ?auto_173894 ) ( ON ?auto_173892 ?auto_173893 ) ( ON ?auto_173891 ?auto_173892 ) ( CLEAR ?auto_173891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_173891 )
      ( MAKE-10PILE ?auto_173891 ?auto_173892 ?auto_173893 ?auto_173894 ?auto_173895 ?auto_173896 ?auto_173897 ?auto_173898 ?auto_173899 ?auto_173900 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_173913 - BLOCK
      ?auto_173914 - BLOCK
      ?auto_173915 - BLOCK
      ?auto_173916 - BLOCK
      ?auto_173917 - BLOCK
      ?auto_173918 - BLOCK
      ?auto_173919 - BLOCK
      ?auto_173920 - BLOCK
      ?auto_173921 - BLOCK
      ?auto_173922 - BLOCK
      ?auto_173923 - BLOCK
    )
    :vars
    (
      ?auto_173924 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_173922 ) ( ON ?auto_173923 ?auto_173924 ) ( CLEAR ?auto_173923 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173913 ) ( ON ?auto_173914 ?auto_173913 ) ( ON ?auto_173915 ?auto_173914 ) ( ON ?auto_173916 ?auto_173915 ) ( ON ?auto_173917 ?auto_173916 ) ( ON ?auto_173918 ?auto_173917 ) ( ON ?auto_173919 ?auto_173918 ) ( ON ?auto_173920 ?auto_173919 ) ( ON ?auto_173921 ?auto_173920 ) ( ON ?auto_173922 ?auto_173921 ) ( not ( = ?auto_173913 ?auto_173914 ) ) ( not ( = ?auto_173913 ?auto_173915 ) ) ( not ( = ?auto_173913 ?auto_173916 ) ) ( not ( = ?auto_173913 ?auto_173917 ) ) ( not ( = ?auto_173913 ?auto_173918 ) ) ( not ( = ?auto_173913 ?auto_173919 ) ) ( not ( = ?auto_173913 ?auto_173920 ) ) ( not ( = ?auto_173913 ?auto_173921 ) ) ( not ( = ?auto_173913 ?auto_173922 ) ) ( not ( = ?auto_173913 ?auto_173923 ) ) ( not ( = ?auto_173913 ?auto_173924 ) ) ( not ( = ?auto_173914 ?auto_173915 ) ) ( not ( = ?auto_173914 ?auto_173916 ) ) ( not ( = ?auto_173914 ?auto_173917 ) ) ( not ( = ?auto_173914 ?auto_173918 ) ) ( not ( = ?auto_173914 ?auto_173919 ) ) ( not ( = ?auto_173914 ?auto_173920 ) ) ( not ( = ?auto_173914 ?auto_173921 ) ) ( not ( = ?auto_173914 ?auto_173922 ) ) ( not ( = ?auto_173914 ?auto_173923 ) ) ( not ( = ?auto_173914 ?auto_173924 ) ) ( not ( = ?auto_173915 ?auto_173916 ) ) ( not ( = ?auto_173915 ?auto_173917 ) ) ( not ( = ?auto_173915 ?auto_173918 ) ) ( not ( = ?auto_173915 ?auto_173919 ) ) ( not ( = ?auto_173915 ?auto_173920 ) ) ( not ( = ?auto_173915 ?auto_173921 ) ) ( not ( = ?auto_173915 ?auto_173922 ) ) ( not ( = ?auto_173915 ?auto_173923 ) ) ( not ( = ?auto_173915 ?auto_173924 ) ) ( not ( = ?auto_173916 ?auto_173917 ) ) ( not ( = ?auto_173916 ?auto_173918 ) ) ( not ( = ?auto_173916 ?auto_173919 ) ) ( not ( = ?auto_173916 ?auto_173920 ) ) ( not ( = ?auto_173916 ?auto_173921 ) ) ( not ( = ?auto_173916 ?auto_173922 ) ) ( not ( = ?auto_173916 ?auto_173923 ) ) ( not ( = ?auto_173916 ?auto_173924 ) ) ( not ( = ?auto_173917 ?auto_173918 ) ) ( not ( = ?auto_173917 ?auto_173919 ) ) ( not ( = ?auto_173917 ?auto_173920 ) ) ( not ( = ?auto_173917 ?auto_173921 ) ) ( not ( = ?auto_173917 ?auto_173922 ) ) ( not ( = ?auto_173917 ?auto_173923 ) ) ( not ( = ?auto_173917 ?auto_173924 ) ) ( not ( = ?auto_173918 ?auto_173919 ) ) ( not ( = ?auto_173918 ?auto_173920 ) ) ( not ( = ?auto_173918 ?auto_173921 ) ) ( not ( = ?auto_173918 ?auto_173922 ) ) ( not ( = ?auto_173918 ?auto_173923 ) ) ( not ( = ?auto_173918 ?auto_173924 ) ) ( not ( = ?auto_173919 ?auto_173920 ) ) ( not ( = ?auto_173919 ?auto_173921 ) ) ( not ( = ?auto_173919 ?auto_173922 ) ) ( not ( = ?auto_173919 ?auto_173923 ) ) ( not ( = ?auto_173919 ?auto_173924 ) ) ( not ( = ?auto_173920 ?auto_173921 ) ) ( not ( = ?auto_173920 ?auto_173922 ) ) ( not ( = ?auto_173920 ?auto_173923 ) ) ( not ( = ?auto_173920 ?auto_173924 ) ) ( not ( = ?auto_173921 ?auto_173922 ) ) ( not ( = ?auto_173921 ?auto_173923 ) ) ( not ( = ?auto_173921 ?auto_173924 ) ) ( not ( = ?auto_173922 ?auto_173923 ) ) ( not ( = ?auto_173922 ?auto_173924 ) ) ( not ( = ?auto_173923 ?auto_173924 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173923 ?auto_173924 )
      ( !STACK ?auto_173923 ?auto_173922 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_173936 - BLOCK
      ?auto_173937 - BLOCK
      ?auto_173938 - BLOCK
      ?auto_173939 - BLOCK
      ?auto_173940 - BLOCK
      ?auto_173941 - BLOCK
      ?auto_173942 - BLOCK
      ?auto_173943 - BLOCK
      ?auto_173944 - BLOCK
      ?auto_173945 - BLOCK
      ?auto_173946 - BLOCK
    )
    :vars
    (
      ?auto_173947 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_173945 ) ( ON ?auto_173946 ?auto_173947 ) ( CLEAR ?auto_173946 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173936 ) ( ON ?auto_173937 ?auto_173936 ) ( ON ?auto_173938 ?auto_173937 ) ( ON ?auto_173939 ?auto_173938 ) ( ON ?auto_173940 ?auto_173939 ) ( ON ?auto_173941 ?auto_173940 ) ( ON ?auto_173942 ?auto_173941 ) ( ON ?auto_173943 ?auto_173942 ) ( ON ?auto_173944 ?auto_173943 ) ( ON ?auto_173945 ?auto_173944 ) ( not ( = ?auto_173936 ?auto_173937 ) ) ( not ( = ?auto_173936 ?auto_173938 ) ) ( not ( = ?auto_173936 ?auto_173939 ) ) ( not ( = ?auto_173936 ?auto_173940 ) ) ( not ( = ?auto_173936 ?auto_173941 ) ) ( not ( = ?auto_173936 ?auto_173942 ) ) ( not ( = ?auto_173936 ?auto_173943 ) ) ( not ( = ?auto_173936 ?auto_173944 ) ) ( not ( = ?auto_173936 ?auto_173945 ) ) ( not ( = ?auto_173936 ?auto_173946 ) ) ( not ( = ?auto_173936 ?auto_173947 ) ) ( not ( = ?auto_173937 ?auto_173938 ) ) ( not ( = ?auto_173937 ?auto_173939 ) ) ( not ( = ?auto_173937 ?auto_173940 ) ) ( not ( = ?auto_173937 ?auto_173941 ) ) ( not ( = ?auto_173937 ?auto_173942 ) ) ( not ( = ?auto_173937 ?auto_173943 ) ) ( not ( = ?auto_173937 ?auto_173944 ) ) ( not ( = ?auto_173937 ?auto_173945 ) ) ( not ( = ?auto_173937 ?auto_173946 ) ) ( not ( = ?auto_173937 ?auto_173947 ) ) ( not ( = ?auto_173938 ?auto_173939 ) ) ( not ( = ?auto_173938 ?auto_173940 ) ) ( not ( = ?auto_173938 ?auto_173941 ) ) ( not ( = ?auto_173938 ?auto_173942 ) ) ( not ( = ?auto_173938 ?auto_173943 ) ) ( not ( = ?auto_173938 ?auto_173944 ) ) ( not ( = ?auto_173938 ?auto_173945 ) ) ( not ( = ?auto_173938 ?auto_173946 ) ) ( not ( = ?auto_173938 ?auto_173947 ) ) ( not ( = ?auto_173939 ?auto_173940 ) ) ( not ( = ?auto_173939 ?auto_173941 ) ) ( not ( = ?auto_173939 ?auto_173942 ) ) ( not ( = ?auto_173939 ?auto_173943 ) ) ( not ( = ?auto_173939 ?auto_173944 ) ) ( not ( = ?auto_173939 ?auto_173945 ) ) ( not ( = ?auto_173939 ?auto_173946 ) ) ( not ( = ?auto_173939 ?auto_173947 ) ) ( not ( = ?auto_173940 ?auto_173941 ) ) ( not ( = ?auto_173940 ?auto_173942 ) ) ( not ( = ?auto_173940 ?auto_173943 ) ) ( not ( = ?auto_173940 ?auto_173944 ) ) ( not ( = ?auto_173940 ?auto_173945 ) ) ( not ( = ?auto_173940 ?auto_173946 ) ) ( not ( = ?auto_173940 ?auto_173947 ) ) ( not ( = ?auto_173941 ?auto_173942 ) ) ( not ( = ?auto_173941 ?auto_173943 ) ) ( not ( = ?auto_173941 ?auto_173944 ) ) ( not ( = ?auto_173941 ?auto_173945 ) ) ( not ( = ?auto_173941 ?auto_173946 ) ) ( not ( = ?auto_173941 ?auto_173947 ) ) ( not ( = ?auto_173942 ?auto_173943 ) ) ( not ( = ?auto_173942 ?auto_173944 ) ) ( not ( = ?auto_173942 ?auto_173945 ) ) ( not ( = ?auto_173942 ?auto_173946 ) ) ( not ( = ?auto_173942 ?auto_173947 ) ) ( not ( = ?auto_173943 ?auto_173944 ) ) ( not ( = ?auto_173943 ?auto_173945 ) ) ( not ( = ?auto_173943 ?auto_173946 ) ) ( not ( = ?auto_173943 ?auto_173947 ) ) ( not ( = ?auto_173944 ?auto_173945 ) ) ( not ( = ?auto_173944 ?auto_173946 ) ) ( not ( = ?auto_173944 ?auto_173947 ) ) ( not ( = ?auto_173945 ?auto_173946 ) ) ( not ( = ?auto_173945 ?auto_173947 ) ) ( not ( = ?auto_173946 ?auto_173947 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173946 ?auto_173947 )
      ( !STACK ?auto_173946 ?auto_173945 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_173959 - BLOCK
      ?auto_173960 - BLOCK
      ?auto_173961 - BLOCK
      ?auto_173962 - BLOCK
      ?auto_173963 - BLOCK
      ?auto_173964 - BLOCK
      ?auto_173965 - BLOCK
      ?auto_173966 - BLOCK
      ?auto_173967 - BLOCK
      ?auto_173968 - BLOCK
      ?auto_173969 - BLOCK
    )
    :vars
    (
      ?auto_173970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173969 ?auto_173970 ) ( ON-TABLE ?auto_173959 ) ( ON ?auto_173960 ?auto_173959 ) ( ON ?auto_173961 ?auto_173960 ) ( ON ?auto_173962 ?auto_173961 ) ( ON ?auto_173963 ?auto_173962 ) ( ON ?auto_173964 ?auto_173963 ) ( ON ?auto_173965 ?auto_173964 ) ( ON ?auto_173966 ?auto_173965 ) ( ON ?auto_173967 ?auto_173966 ) ( not ( = ?auto_173959 ?auto_173960 ) ) ( not ( = ?auto_173959 ?auto_173961 ) ) ( not ( = ?auto_173959 ?auto_173962 ) ) ( not ( = ?auto_173959 ?auto_173963 ) ) ( not ( = ?auto_173959 ?auto_173964 ) ) ( not ( = ?auto_173959 ?auto_173965 ) ) ( not ( = ?auto_173959 ?auto_173966 ) ) ( not ( = ?auto_173959 ?auto_173967 ) ) ( not ( = ?auto_173959 ?auto_173968 ) ) ( not ( = ?auto_173959 ?auto_173969 ) ) ( not ( = ?auto_173959 ?auto_173970 ) ) ( not ( = ?auto_173960 ?auto_173961 ) ) ( not ( = ?auto_173960 ?auto_173962 ) ) ( not ( = ?auto_173960 ?auto_173963 ) ) ( not ( = ?auto_173960 ?auto_173964 ) ) ( not ( = ?auto_173960 ?auto_173965 ) ) ( not ( = ?auto_173960 ?auto_173966 ) ) ( not ( = ?auto_173960 ?auto_173967 ) ) ( not ( = ?auto_173960 ?auto_173968 ) ) ( not ( = ?auto_173960 ?auto_173969 ) ) ( not ( = ?auto_173960 ?auto_173970 ) ) ( not ( = ?auto_173961 ?auto_173962 ) ) ( not ( = ?auto_173961 ?auto_173963 ) ) ( not ( = ?auto_173961 ?auto_173964 ) ) ( not ( = ?auto_173961 ?auto_173965 ) ) ( not ( = ?auto_173961 ?auto_173966 ) ) ( not ( = ?auto_173961 ?auto_173967 ) ) ( not ( = ?auto_173961 ?auto_173968 ) ) ( not ( = ?auto_173961 ?auto_173969 ) ) ( not ( = ?auto_173961 ?auto_173970 ) ) ( not ( = ?auto_173962 ?auto_173963 ) ) ( not ( = ?auto_173962 ?auto_173964 ) ) ( not ( = ?auto_173962 ?auto_173965 ) ) ( not ( = ?auto_173962 ?auto_173966 ) ) ( not ( = ?auto_173962 ?auto_173967 ) ) ( not ( = ?auto_173962 ?auto_173968 ) ) ( not ( = ?auto_173962 ?auto_173969 ) ) ( not ( = ?auto_173962 ?auto_173970 ) ) ( not ( = ?auto_173963 ?auto_173964 ) ) ( not ( = ?auto_173963 ?auto_173965 ) ) ( not ( = ?auto_173963 ?auto_173966 ) ) ( not ( = ?auto_173963 ?auto_173967 ) ) ( not ( = ?auto_173963 ?auto_173968 ) ) ( not ( = ?auto_173963 ?auto_173969 ) ) ( not ( = ?auto_173963 ?auto_173970 ) ) ( not ( = ?auto_173964 ?auto_173965 ) ) ( not ( = ?auto_173964 ?auto_173966 ) ) ( not ( = ?auto_173964 ?auto_173967 ) ) ( not ( = ?auto_173964 ?auto_173968 ) ) ( not ( = ?auto_173964 ?auto_173969 ) ) ( not ( = ?auto_173964 ?auto_173970 ) ) ( not ( = ?auto_173965 ?auto_173966 ) ) ( not ( = ?auto_173965 ?auto_173967 ) ) ( not ( = ?auto_173965 ?auto_173968 ) ) ( not ( = ?auto_173965 ?auto_173969 ) ) ( not ( = ?auto_173965 ?auto_173970 ) ) ( not ( = ?auto_173966 ?auto_173967 ) ) ( not ( = ?auto_173966 ?auto_173968 ) ) ( not ( = ?auto_173966 ?auto_173969 ) ) ( not ( = ?auto_173966 ?auto_173970 ) ) ( not ( = ?auto_173967 ?auto_173968 ) ) ( not ( = ?auto_173967 ?auto_173969 ) ) ( not ( = ?auto_173967 ?auto_173970 ) ) ( not ( = ?auto_173968 ?auto_173969 ) ) ( not ( = ?auto_173968 ?auto_173970 ) ) ( not ( = ?auto_173969 ?auto_173970 ) ) ( CLEAR ?auto_173967 ) ( ON ?auto_173968 ?auto_173969 ) ( CLEAR ?auto_173968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_173959 ?auto_173960 ?auto_173961 ?auto_173962 ?auto_173963 ?auto_173964 ?auto_173965 ?auto_173966 ?auto_173967 ?auto_173968 )
      ( MAKE-11PILE ?auto_173959 ?auto_173960 ?auto_173961 ?auto_173962 ?auto_173963 ?auto_173964 ?auto_173965 ?auto_173966 ?auto_173967 ?auto_173968 ?auto_173969 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_173982 - BLOCK
      ?auto_173983 - BLOCK
      ?auto_173984 - BLOCK
      ?auto_173985 - BLOCK
      ?auto_173986 - BLOCK
      ?auto_173987 - BLOCK
      ?auto_173988 - BLOCK
      ?auto_173989 - BLOCK
      ?auto_173990 - BLOCK
      ?auto_173991 - BLOCK
      ?auto_173992 - BLOCK
    )
    :vars
    (
      ?auto_173993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173992 ?auto_173993 ) ( ON-TABLE ?auto_173982 ) ( ON ?auto_173983 ?auto_173982 ) ( ON ?auto_173984 ?auto_173983 ) ( ON ?auto_173985 ?auto_173984 ) ( ON ?auto_173986 ?auto_173985 ) ( ON ?auto_173987 ?auto_173986 ) ( ON ?auto_173988 ?auto_173987 ) ( ON ?auto_173989 ?auto_173988 ) ( ON ?auto_173990 ?auto_173989 ) ( not ( = ?auto_173982 ?auto_173983 ) ) ( not ( = ?auto_173982 ?auto_173984 ) ) ( not ( = ?auto_173982 ?auto_173985 ) ) ( not ( = ?auto_173982 ?auto_173986 ) ) ( not ( = ?auto_173982 ?auto_173987 ) ) ( not ( = ?auto_173982 ?auto_173988 ) ) ( not ( = ?auto_173982 ?auto_173989 ) ) ( not ( = ?auto_173982 ?auto_173990 ) ) ( not ( = ?auto_173982 ?auto_173991 ) ) ( not ( = ?auto_173982 ?auto_173992 ) ) ( not ( = ?auto_173982 ?auto_173993 ) ) ( not ( = ?auto_173983 ?auto_173984 ) ) ( not ( = ?auto_173983 ?auto_173985 ) ) ( not ( = ?auto_173983 ?auto_173986 ) ) ( not ( = ?auto_173983 ?auto_173987 ) ) ( not ( = ?auto_173983 ?auto_173988 ) ) ( not ( = ?auto_173983 ?auto_173989 ) ) ( not ( = ?auto_173983 ?auto_173990 ) ) ( not ( = ?auto_173983 ?auto_173991 ) ) ( not ( = ?auto_173983 ?auto_173992 ) ) ( not ( = ?auto_173983 ?auto_173993 ) ) ( not ( = ?auto_173984 ?auto_173985 ) ) ( not ( = ?auto_173984 ?auto_173986 ) ) ( not ( = ?auto_173984 ?auto_173987 ) ) ( not ( = ?auto_173984 ?auto_173988 ) ) ( not ( = ?auto_173984 ?auto_173989 ) ) ( not ( = ?auto_173984 ?auto_173990 ) ) ( not ( = ?auto_173984 ?auto_173991 ) ) ( not ( = ?auto_173984 ?auto_173992 ) ) ( not ( = ?auto_173984 ?auto_173993 ) ) ( not ( = ?auto_173985 ?auto_173986 ) ) ( not ( = ?auto_173985 ?auto_173987 ) ) ( not ( = ?auto_173985 ?auto_173988 ) ) ( not ( = ?auto_173985 ?auto_173989 ) ) ( not ( = ?auto_173985 ?auto_173990 ) ) ( not ( = ?auto_173985 ?auto_173991 ) ) ( not ( = ?auto_173985 ?auto_173992 ) ) ( not ( = ?auto_173985 ?auto_173993 ) ) ( not ( = ?auto_173986 ?auto_173987 ) ) ( not ( = ?auto_173986 ?auto_173988 ) ) ( not ( = ?auto_173986 ?auto_173989 ) ) ( not ( = ?auto_173986 ?auto_173990 ) ) ( not ( = ?auto_173986 ?auto_173991 ) ) ( not ( = ?auto_173986 ?auto_173992 ) ) ( not ( = ?auto_173986 ?auto_173993 ) ) ( not ( = ?auto_173987 ?auto_173988 ) ) ( not ( = ?auto_173987 ?auto_173989 ) ) ( not ( = ?auto_173987 ?auto_173990 ) ) ( not ( = ?auto_173987 ?auto_173991 ) ) ( not ( = ?auto_173987 ?auto_173992 ) ) ( not ( = ?auto_173987 ?auto_173993 ) ) ( not ( = ?auto_173988 ?auto_173989 ) ) ( not ( = ?auto_173988 ?auto_173990 ) ) ( not ( = ?auto_173988 ?auto_173991 ) ) ( not ( = ?auto_173988 ?auto_173992 ) ) ( not ( = ?auto_173988 ?auto_173993 ) ) ( not ( = ?auto_173989 ?auto_173990 ) ) ( not ( = ?auto_173989 ?auto_173991 ) ) ( not ( = ?auto_173989 ?auto_173992 ) ) ( not ( = ?auto_173989 ?auto_173993 ) ) ( not ( = ?auto_173990 ?auto_173991 ) ) ( not ( = ?auto_173990 ?auto_173992 ) ) ( not ( = ?auto_173990 ?auto_173993 ) ) ( not ( = ?auto_173991 ?auto_173992 ) ) ( not ( = ?auto_173991 ?auto_173993 ) ) ( not ( = ?auto_173992 ?auto_173993 ) ) ( CLEAR ?auto_173990 ) ( ON ?auto_173991 ?auto_173992 ) ( CLEAR ?auto_173991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_173982 ?auto_173983 ?auto_173984 ?auto_173985 ?auto_173986 ?auto_173987 ?auto_173988 ?auto_173989 ?auto_173990 ?auto_173991 )
      ( MAKE-11PILE ?auto_173982 ?auto_173983 ?auto_173984 ?auto_173985 ?auto_173986 ?auto_173987 ?auto_173988 ?auto_173989 ?auto_173990 ?auto_173991 ?auto_173992 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_174005 - BLOCK
      ?auto_174006 - BLOCK
      ?auto_174007 - BLOCK
      ?auto_174008 - BLOCK
      ?auto_174009 - BLOCK
      ?auto_174010 - BLOCK
      ?auto_174011 - BLOCK
      ?auto_174012 - BLOCK
      ?auto_174013 - BLOCK
      ?auto_174014 - BLOCK
      ?auto_174015 - BLOCK
    )
    :vars
    (
      ?auto_174016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174015 ?auto_174016 ) ( ON-TABLE ?auto_174005 ) ( ON ?auto_174006 ?auto_174005 ) ( ON ?auto_174007 ?auto_174006 ) ( ON ?auto_174008 ?auto_174007 ) ( ON ?auto_174009 ?auto_174008 ) ( ON ?auto_174010 ?auto_174009 ) ( ON ?auto_174011 ?auto_174010 ) ( ON ?auto_174012 ?auto_174011 ) ( not ( = ?auto_174005 ?auto_174006 ) ) ( not ( = ?auto_174005 ?auto_174007 ) ) ( not ( = ?auto_174005 ?auto_174008 ) ) ( not ( = ?auto_174005 ?auto_174009 ) ) ( not ( = ?auto_174005 ?auto_174010 ) ) ( not ( = ?auto_174005 ?auto_174011 ) ) ( not ( = ?auto_174005 ?auto_174012 ) ) ( not ( = ?auto_174005 ?auto_174013 ) ) ( not ( = ?auto_174005 ?auto_174014 ) ) ( not ( = ?auto_174005 ?auto_174015 ) ) ( not ( = ?auto_174005 ?auto_174016 ) ) ( not ( = ?auto_174006 ?auto_174007 ) ) ( not ( = ?auto_174006 ?auto_174008 ) ) ( not ( = ?auto_174006 ?auto_174009 ) ) ( not ( = ?auto_174006 ?auto_174010 ) ) ( not ( = ?auto_174006 ?auto_174011 ) ) ( not ( = ?auto_174006 ?auto_174012 ) ) ( not ( = ?auto_174006 ?auto_174013 ) ) ( not ( = ?auto_174006 ?auto_174014 ) ) ( not ( = ?auto_174006 ?auto_174015 ) ) ( not ( = ?auto_174006 ?auto_174016 ) ) ( not ( = ?auto_174007 ?auto_174008 ) ) ( not ( = ?auto_174007 ?auto_174009 ) ) ( not ( = ?auto_174007 ?auto_174010 ) ) ( not ( = ?auto_174007 ?auto_174011 ) ) ( not ( = ?auto_174007 ?auto_174012 ) ) ( not ( = ?auto_174007 ?auto_174013 ) ) ( not ( = ?auto_174007 ?auto_174014 ) ) ( not ( = ?auto_174007 ?auto_174015 ) ) ( not ( = ?auto_174007 ?auto_174016 ) ) ( not ( = ?auto_174008 ?auto_174009 ) ) ( not ( = ?auto_174008 ?auto_174010 ) ) ( not ( = ?auto_174008 ?auto_174011 ) ) ( not ( = ?auto_174008 ?auto_174012 ) ) ( not ( = ?auto_174008 ?auto_174013 ) ) ( not ( = ?auto_174008 ?auto_174014 ) ) ( not ( = ?auto_174008 ?auto_174015 ) ) ( not ( = ?auto_174008 ?auto_174016 ) ) ( not ( = ?auto_174009 ?auto_174010 ) ) ( not ( = ?auto_174009 ?auto_174011 ) ) ( not ( = ?auto_174009 ?auto_174012 ) ) ( not ( = ?auto_174009 ?auto_174013 ) ) ( not ( = ?auto_174009 ?auto_174014 ) ) ( not ( = ?auto_174009 ?auto_174015 ) ) ( not ( = ?auto_174009 ?auto_174016 ) ) ( not ( = ?auto_174010 ?auto_174011 ) ) ( not ( = ?auto_174010 ?auto_174012 ) ) ( not ( = ?auto_174010 ?auto_174013 ) ) ( not ( = ?auto_174010 ?auto_174014 ) ) ( not ( = ?auto_174010 ?auto_174015 ) ) ( not ( = ?auto_174010 ?auto_174016 ) ) ( not ( = ?auto_174011 ?auto_174012 ) ) ( not ( = ?auto_174011 ?auto_174013 ) ) ( not ( = ?auto_174011 ?auto_174014 ) ) ( not ( = ?auto_174011 ?auto_174015 ) ) ( not ( = ?auto_174011 ?auto_174016 ) ) ( not ( = ?auto_174012 ?auto_174013 ) ) ( not ( = ?auto_174012 ?auto_174014 ) ) ( not ( = ?auto_174012 ?auto_174015 ) ) ( not ( = ?auto_174012 ?auto_174016 ) ) ( not ( = ?auto_174013 ?auto_174014 ) ) ( not ( = ?auto_174013 ?auto_174015 ) ) ( not ( = ?auto_174013 ?auto_174016 ) ) ( not ( = ?auto_174014 ?auto_174015 ) ) ( not ( = ?auto_174014 ?auto_174016 ) ) ( not ( = ?auto_174015 ?auto_174016 ) ) ( ON ?auto_174014 ?auto_174015 ) ( CLEAR ?auto_174012 ) ( ON ?auto_174013 ?auto_174014 ) ( CLEAR ?auto_174013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_174005 ?auto_174006 ?auto_174007 ?auto_174008 ?auto_174009 ?auto_174010 ?auto_174011 ?auto_174012 ?auto_174013 )
      ( MAKE-11PILE ?auto_174005 ?auto_174006 ?auto_174007 ?auto_174008 ?auto_174009 ?auto_174010 ?auto_174011 ?auto_174012 ?auto_174013 ?auto_174014 ?auto_174015 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_174028 - BLOCK
      ?auto_174029 - BLOCK
      ?auto_174030 - BLOCK
      ?auto_174031 - BLOCK
      ?auto_174032 - BLOCK
      ?auto_174033 - BLOCK
      ?auto_174034 - BLOCK
      ?auto_174035 - BLOCK
      ?auto_174036 - BLOCK
      ?auto_174037 - BLOCK
      ?auto_174038 - BLOCK
    )
    :vars
    (
      ?auto_174039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174038 ?auto_174039 ) ( ON-TABLE ?auto_174028 ) ( ON ?auto_174029 ?auto_174028 ) ( ON ?auto_174030 ?auto_174029 ) ( ON ?auto_174031 ?auto_174030 ) ( ON ?auto_174032 ?auto_174031 ) ( ON ?auto_174033 ?auto_174032 ) ( ON ?auto_174034 ?auto_174033 ) ( ON ?auto_174035 ?auto_174034 ) ( not ( = ?auto_174028 ?auto_174029 ) ) ( not ( = ?auto_174028 ?auto_174030 ) ) ( not ( = ?auto_174028 ?auto_174031 ) ) ( not ( = ?auto_174028 ?auto_174032 ) ) ( not ( = ?auto_174028 ?auto_174033 ) ) ( not ( = ?auto_174028 ?auto_174034 ) ) ( not ( = ?auto_174028 ?auto_174035 ) ) ( not ( = ?auto_174028 ?auto_174036 ) ) ( not ( = ?auto_174028 ?auto_174037 ) ) ( not ( = ?auto_174028 ?auto_174038 ) ) ( not ( = ?auto_174028 ?auto_174039 ) ) ( not ( = ?auto_174029 ?auto_174030 ) ) ( not ( = ?auto_174029 ?auto_174031 ) ) ( not ( = ?auto_174029 ?auto_174032 ) ) ( not ( = ?auto_174029 ?auto_174033 ) ) ( not ( = ?auto_174029 ?auto_174034 ) ) ( not ( = ?auto_174029 ?auto_174035 ) ) ( not ( = ?auto_174029 ?auto_174036 ) ) ( not ( = ?auto_174029 ?auto_174037 ) ) ( not ( = ?auto_174029 ?auto_174038 ) ) ( not ( = ?auto_174029 ?auto_174039 ) ) ( not ( = ?auto_174030 ?auto_174031 ) ) ( not ( = ?auto_174030 ?auto_174032 ) ) ( not ( = ?auto_174030 ?auto_174033 ) ) ( not ( = ?auto_174030 ?auto_174034 ) ) ( not ( = ?auto_174030 ?auto_174035 ) ) ( not ( = ?auto_174030 ?auto_174036 ) ) ( not ( = ?auto_174030 ?auto_174037 ) ) ( not ( = ?auto_174030 ?auto_174038 ) ) ( not ( = ?auto_174030 ?auto_174039 ) ) ( not ( = ?auto_174031 ?auto_174032 ) ) ( not ( = ?auto_174031 ?auto_174033 ) ) ( not ( = ?auto_174031 ?auto_174034 ) ) ( not ( = ?auto_174031 ?auto_174035 ) ) ( not ( = ?auto_174031 ?auto_174036 ) ) ( not ( = ?auto_174031 ?auto_174037 ) ) ( not ( = ?auto_174031 ?auto_174038 ) ) ( not ( = ?auto_174031 ?auto_174039 ) ) ( not ( = ?auto_174032 ?auto_174033 ) ) ( not ( = ?auto_174032 ?auto_174034 ) ) ( not ( = ?auto_174032 ?auto_174035 ) ) ( not ( = ?auto_174032 ?auto_174036 ) ) ( not ( = ?auto_174032 ?auto_174037 ) ) ( not ( = ?auto_174032 ?auto_174038 ) ) ( not ( = ?auto_174032 ?auto_174039 ) ) ( not ( = ?auto_174033 ?auto_174034 ) ) ( not ( = ?auto_174033 ?auto_174035 ) ) ( not ( = ?auto_174033 ?auto_174036 ) ) ( not ( = ?auto_174033 ?auto_174037 ) ) ( not ( = ?auto_174033 ?auto_174038 ) ) ( not ( = ?auto_174033 ?auto_174039 ) ) ( not ( = ?auto_174034 ?auto_174035 ) ) ( not ( = ?auto_174034 ?auto_174036 ) ) ( not ( = ?auto_174034 ?auto_174037 ) ) ( not ( = ?auto_174034 ?auto_174038 ) ) ( not ( = ?auto_174034 ?auto_174039 ) ) ( not ( = ?auto_174035 ?auto_174036 ) ) ( not ( = ?auto_174035 ?auto_174037 ) ) ( not ( = ?auto_174035 ?auto_174038 ) ) ( not ( = ?auto_174035 ?auto_174039 ) ) ( not ( = ?auto_174036 ?auto_174037 ) ) ( not ( = ?auto_174036 ?auto_174038 ) ) ( not ( = ?auto_174036 ?auto_174039 ) ) ( not ( = ?auto_174037 ?auto_174038 ) ) ( not ( = ?auto_174037 ?auto_174039 ) ) ( not ( = ?auto_174038 ?auto_174039 ) ) ( ON ?auto_174037 ?auto_174038 ) ( CLEAR ?auto_174035 ) ( ON ?auto_174036 ?auto_174037 ) ( CLEAR ?auto_174036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_174028 ?auto_174029 ?auto_174030 ?auto_174031 ?auto_174032 ?auto_174033 ?auto_174034 ?auto_174035 ?auto_174036 )
      ( MAKE-11PILE ?auto_174028 ?auto_174029 ?auto_174030 ?auto_174031 ?auto_174032 ?auto_174033 ?auto_174034 ?auto_174035 ?auto_174036 ?auto_174037 ?auto_174038 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_174051 - BLOCK
      ?auto_174052 - BLOCK
      ?auto_174053 - BLOCK
      ?auto_174054 - BLOCK
      ?auto_174055 - BLOCK
      ?auto_174056 - BLOCK
      ?auto_174057 - BLOCK
      ?auto_174058 - BLOCK
      ?auto_174059 - BLOCK
      ?auto_174060 - BLOCK
      ?auto_174061 - BLOCK
    )
    :vars
    (
      ?auto_174062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174061 ?auto_174062 ) ( ON-TABLE ?auto_174051 ) ( ON ?auto_174052 ?auto_174051 ) ( ON ?auto_174053 ?auto_174052 ) ( ON ?auto_174054 ?auto_174053 ) ( ON ?auto_174055 ?auto_174054 ) ( ON ?auto_174056 ?auto_174055 ) ( ON ?auto_174057 ?auto_174056 ) ( not ( = ?auto_174051 ?auto_174052 ) ) ( not ( = ?auto_174051 ?auto_174053 ) ) ( not ( = ?auto_174051 ?auto_174054 ) ) ( not ( = ?auto_174051 ?auto_174055 ) ) ( not ( = ?auto_174051 ?auto_174056 ) ) ( not ( = ?auto_174051 ?auto_174057 ) ) ( not ( = ?auto_174051 ?auto_174058 ) ) ( not ( = ?auto_174051 ?auto_174059 ) ) ( not ( = ?auto_174051 ?auto_174060 ) ) ( not ( = ?auto_174051 ?auto_174061 ) ) ( not ( = ?auto_174051 ?auto_174062 ) ) ( not ( = ?auto_174052 ?auto_174053 ) ) ( not ( = ?auto_174052 ?auto_174054 ) ) ( not ( = ?auto_174052 ?auto_174055 ) ) ( not ( = ?auto_174052 ?auto_174056 ) ) ( not ( = ?auto_174052 ?auto_174057 ) ) ( not ( = ?auto_174052 ?auto_174058 ) ) ( not ( = ?auto_174052 ?auto_174059 ) ) ( not ( = ?auto_174052 ?auto_174060 ) ) ( not ( = ?auto_174052 ?auto_174061 ) ) ( not ( = ?auto_174052 ?auto_174062 ) ) ( not ( = ?auto_174053 ?auto_174054 ) ) ( not ( = ?auto_174053 ?auto_174055 ) ) ( not ( = ?auto_174053 ?auto_174056 ) ) ( not ( = ?auto_174053 ?auto_174057 ) ) ( not ( = ?auto_174053 ?auto_174058 ) ) ( not ( = ?auto_174053 ?auto_174059 ) ) ( not ( = ?auto_174053 ?auto_174060 ) ) ( not ( = ?auto_174053 ?auto_174061 ) ) ( not ( = ?auto_174053 ?auto_174062 ) ) ( not ( = ?auto_174054 ?auto_174055 ) ) ( not ( = ?auto_174054 ?auto_174056 ) ) ( not ( = ?auto_174054 ?auto_174057 ) ) ( not ( = ?auto_174054 ?auto_174058 ) ) ( not ( = ?auto_174054 ?auto_174059 ) ) ( not ( = ?auto_174054 ?auto_174060 ) ) ( not ( = ?auto_174054 ?auto_174061 ) ) ( not ( = ?auto_174054 ?auto_174062 ) ) ( not ( = ?auto_174055 ?auto_174056 ) ) ( not ( = ?auto_174055 ?auto_174057 ) ) ( not ( = ?auto_174055 ?auto_174058 ) ) ( not ( = ?auto_174055 ?auto_174059 ) ) ( not ( = ?auto_174055 ?auto_174060 ) ) ( not ( = ?auto_174055 ?auto_174061 ) ) ( not ( = ?auto_174055 ?auto_174062 ) ) ( not ( = ?auto_174056 ?auto_174057 ) ) ( not ( = ?auto_174056 ?auto_174058 ) ) ( not ( = ?auto_174056 ?auto_174059 ) ) ( not ( = ?auto_174056 ?auto_174060 ) ) ( not ( = ?auto_174056 ?auto_174061 ) ) ( not ( = ?auto_174056 ?auto_174062 ) ) ( not ( = ?auto_174057 ?auto_174058 ) ) ( not ( = ?auto_174057 ?auto_174059 ) ) ( not ( = ?auto_174057 ?auto_174060 ) ) ( not ( = ?auto_174057 ?auto_174061 ) ) ( not ( = ?auto_174057 ?auto_174062 ) ) ( not ( = ?auto_174058 ?auto_174059 ) ) ( not ( = ?auto_174058 ?auto_174060 ) ) ( not ( = ?auto_174058 ?auto_174061 ) ) ( not ( = ?auto_174058 ?auto_174062 ) ) ( not ( = ?auto_174059 ?auto_174060 ) ) ( not ( = ?auto_174059 ?auto_174061 ) ) ( not ( = ?auto_174059 ?auto_174062 ) ) ( not ( = ?auto_174060 ?auto_174061 ) ) ( not ( = ?auto_174060 ?auto_174062 ) ) ( not ( = ?auto_174061 ?auto_174062 ) ) ( ON ?auto_174060 ?auto_174061 ) ( ON ?auto_174059 ?auto_174060 ) ( CLEAR ?auto_174057 ) ( ON ?auto_174058 ?auto_174059 ) ( CLEAR ?auto_174058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_174051 ?auto_174052 ?auto_174053 ?auto_174054 ?auto_174055 ?auto_174056 ?auto_174057 ?auto_174058 )
      ( MAKE-11PILE ?auto_174051 ?auto_174052 ?auto_174053 ?auto_174054 ?auto_174055 ?auto_174056 ?auto_174057 ?auto_174058 ?auto_174059 ?auto_174060 ?auto_174061 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_174074 - BLOCK
      ?auto_174075 - BLOCK
      ?auto_174076 - BLOCK
      ?auto_174077 - BLOCK
      ?auto_174078 - BLOCK
      ?auto_174079 - BLOCK
      ?auto_174080 - BLOCK
      ?auto_174081 - BLOCK
      ?auto_174082 - BLOCK
      ?auto_174083 - BLOCK
      ?auto_174084 - BLOCK
    )
    :vars
    (
      ?auto_174085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174084 ?auto_174085 ) ( ON-TABLE ?auto_174074 ) ( ON ?auto_174075 ?auto_174074 ) ( ON ?auto_174076 ?auto_174075 ) ( ON ?auto_174077 ?auto_174076 ) ( ON ?auto_174078 ?auto_174077 ) ( ON ?auto_174079 ?auto_174078 ) ( ON ?auto_174080 ?auto_174079 ) ( not ( = ?auto_174074 ?auto_174075 ) ) ( not ( = ?auto_174074 ?auto_174076 ) ) ( not ( = ?auto_174074 ?auto_174077 ) ) ( not ( = ?auto_174074 ?auto_174078 ) ) ( not ( = ?auto_174074 ?auto_174079 ) ) ( not ( = ?auto_174074 ?auto_174080 ) ) ( not ( = ?auto_174074 ?auto_174081 ) ) ( not ( = ?auto_174074 ?auto_174082 ) ) ( not ( = ?auto_174074 ?auto_174083 ) ) ( not ( = ?auto_174074 ?auto_174084 ) ) ( not ( = ?auto_174074 ?auto_174085 ) ) ( not ( = ?auto_174075 ?auto_174076 ) ) ( not ( = ?auto_174075 ?auto_174077 ) ) ( not ( = ?auto_174075 ?auto_174078 ) ) ( not ( = ?auto_174075 ?auto_174079 ) ) ( not ( = ?auto_174075 ?auto_174080 ) ) ( not ( = ?auto_174075 ?auto_174081 ) ) ( not ( = ?auto_174075 ?auto_174082 ) ) ( not ( = ?auto_174075 ?auto_174083 ) ) ( not ( = ?auto_174075 ?auto_174084 ) ) ( not ( = ?auto_174075 ?auto_174085 ) ) ( not ( = ?auto_174076 ?auto_174077 ) ) ( not ( = ?auto_174076 ?auto_174078 ) ) ( not ( = ?auto_174076 ?auto_174079 ) ) ( not ( = ?auto_174076 ?auto_174080 ) ) ( not ( = ?auto_174076 ?auto_174081 ) ) ( not ( = ?auto_174076 ?auto_174082 ) ) ( not ( = ?auto_174076 ?auto_174083 ) ) ( not ( = ?auto_174076 ?auto_174084 ) ) ( not ( = ?auto_174076 ?auto_174085 ) ) ( not ( = ?auto_174077 ?auto_174078 ) ) ( not ( = ?auto_174077 ?auto_174079 ) ) ( not ( = ?auto_174077 ?auto_174080 ) ) ( not ( = ?auto_174077 ?auto_174081 ) ) ( not ( = ?auto_174077 ?auto_174082 ) ) ( not ( = ?auto_174077 ?auto_174083 ) ) ( not ( = ?auto_174077 ?auto_174084 ) ) ( not ( = ?auto_174077 ?auto_174085 ) ) ( not ( = ?auto_174078 ?auto_174079 ) ) ( not ( = ?auto_174078 ?auto_174080 ) ) ( not ( = ?auto_174078 ?auto_174081 ) ) ( not ( = ?auto_174078 ?auto_174082 ) ) ( not ( = ?auto_174078 ?auto_174083 ) ) ( not ( = ?auto_174078 ?auto_174084 ) ) ( not ( = ?auto_174078 ?auto_174085 ) ) ( not ( = ?auto_174079 ?auto_174080 ) ) ( not ( = ?auto_174079 ?auto_174081 ) ) ( not ( = ?auto_174079 ?auto_174082 ) ) ( not ( = ?auto_174079 ?auto_174083 ) ) ( not ( = ?auto_174079 ?auto_174084 ) ) ( not ( = ?auto_174079 ?auto_174085 ) ) ( not ( = ?auto_174080 ?auto_174081 ) ) ( not ( = ?auto_174080 ?auto_174082 ) ) ( not ( = ?auto_174080 ?auto_174083 ) ) ( not ( = ?auto_174080 ?auto_174084 ) ) ( not ( = ?auto_174080 ?auto_174085 ) ) ( not ( = ?auto_174081 ?auto_174082 ) ) ( not ( = ?auto_174081 ?auto_174083 ) ) ( not ( = ?auto_174081 ?auto_174084 ) ) ( not ( = ?auto_174081 ?auto_174085 ) ) ( not ( = ?auto_174082 ?auto_174083 ) ) ( not ( = ?auto_174082 ?auto_174084 ) ) ( not ( = ?auto_174082 ?auto_174085 ) ) ( not ( = ?auto_174083 ?auto_174084 ) ) ( not ( = ?auto_174083 ?auto_174085 ) ) ( not ( = ?auto_174084 ?auto_174085 ) ) ( ON ?auto_174083 ?auto_174084 ) ( ON ?auto_174082 ?auto_174083 ) ( CLEAR ?auto_174080 ) ( ON ?auto_174081 ?auto_174082 ) ( CLEAR ?auto_174081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_174074 ?auto_174075 ?auto_174076 ?auto_174077 ?auto_174078 ?auto_174079 ?auto_174080 ?auto_174081 )
      ( MAKE-11PILE ?auto_174074 ?auto_174075 ?auto_174076 ?auto_174077 ?auto_174078 ?auto_174079 ?auto_174080 ?auto_174081 ?auto_174082 ?auto_174083 ?auto_174084 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_174097 - BLOCK
      ?auto_174098 - BLOCK
      ?auto_174099 - BLOCK
      ?auto_174100 - BLOCK
      ?auto_174101 - BLOCK
      ?auto_174102 - BLOCK
      ?auto_174103 - BLOCK
      ?auto_174104 - BLOCK
      ?auto_174105 - BLOCK
      ?auto_174106 - BLOCK
      ?auto_174107 - BLOCK
    )
    :vars
    (
      ?auto_174108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174107 ?auto_174108 ) ( ON-TABLE ?auto_174097 ) ( ON ?auto_174098 ?auto_174097 ) ( ON ?auto_174099 ?auto_174098 ) ( ON ?auto_174100 ?auto_174099 ) ( ON ?auto_174101 ?auto_174100 ) ( ON ?auto_174102 ?auto_174101 ) ( not ( = ?auto_174097 ?auto_174098 ) ) ( not ( = ?auto_174097 ?auto_174099 ) ) ( not ( = ?auto_174097 ?auto_174100 ) ) ( not ( = ?auto_174097 ?auto_174101 ) ) ( not ( = ?auto_174097 ?auto_174102 ) ) ( not ( = ?auto_174097 ?auto_174103 ) ) ( not ( = ?auto_174097 ?auto_174104 ) ) ( not ( = ?auto_174097 ?auto_174105 ) ) ( not ( = ?auto_174097 ?auto_174106 ) ) ( not ( = ?auto_174097 ?auto_174107 ) ) ( not ( = ?auto_174097 ?auto_174108 ) ) ( not ( = ?auto_174098 ?auto_174099 ) ) ( not ( = ?auto_174098 ?auto_174100 ) ) ( not ( = ?auto_174098 ?auto_174101 ) ) ( not ( = ?auto_174098 ?auto_174102 ) ) ( not ( = ?auto_174098 ?auto_174103 ) ) ( not ( = ?auto_174098 ?auto_174104 ) ) ( not ( = ?auto_174098 ?auto_174105 ) ) ( not ( = ?auto_174098 ?auto_174106 ) ) ( not ( = ?auto_174098 ?auto_174107 ) ) ( not ( = ?auto_174098 ?auto_174108 ) ) ( not ( = ?auto_174099 ?auto_174100 ) ) ( not ( = ?auto_174099 ?auto_174101 ) ) ( not ( = ?auto_174099 ?auto_174102 ) ) ( not ( = ?auto_174099 ?auto_174103 ) ) ( not ( = ?auto_174099 ?auto_174104 ) ) ( not ( = ?auto_174099 ?auto_174105 ) ) ( not ( = ?auto_174099 ?auto_174106 ) ) ( not ( = ?auto_174099 ?auto_174107 ) ) ( not ( = ?auto_174099 ?auto_174108 ) ) ( not ( = ?auto_174100 ?auto_174101 ) ) ( not ( = ?auto_174100 ?auto_174102 ) ) ( not ( = ?auto_174100 ?auto_174103 ) ) ( not ( = ?auto_174100 ?auto_174104 ) ) ( not ( = ?auto_174100 ?auto_174105 ) ) ( not ( = ?auto_174100 ?auto_174106 ) ) ( not ( = ?auto_174100 ?auto_174107 ) ) ( not ( = ?auto_174100 ?auto_174108 ) ) ( not ( = ?auto_174101 ?auto_174102 ) ) ( not ( = ?auto_174101 ?auto_174103 ) ) ( not ( = ?auto_174101 ?auto_174104 ) ) ( not ( = ?auto_174101 ?auto_174105 ) ) ( not ( = ?auto_174101 ?auto_174106 ) ) ( not ( = ?auto_174101 ?auto_174107 ) ) ( not ( = ?auto_174101 ?auto_174108 ) ) ( not ( = ?auto_174102 ?auto_174103 ) ) ( not ( = ?auto_174102 ?auto_174104 ) ) ( not ( = ?auto_174102 ?auto_174105 ) ) ( not ( = ?auto_174102 ?auto_174106 ) ) ( not ( = ?auto_174102 ?auto_174107 ) ) ( not ( = ?auto_174102 ?auto_174108 ) ) ( not ( = ?auto_174103 ?auto_174104 ) ) ( not ( = ?auto_174103 ?auto_174105 ) ) ( not ( = ?auto_174103 ?auto_174106 ) ) ( not ( = ?auto_174103 ?auto_174107 ) ) ( not ( = ?auto_174103 ?auto_174108 ) ) ( not ( = ?auto_174104 ?auto_174105 ) ) ( not ( = ?auto_174104 ?auto_174106 ) ) ( not ( = ?auto_174104 ?auto_174107 ) ) ( not ( = ?auto_174104 ?auto_174108 ) ) ( not ( = ?auto_174105 ?auto_174106 ) ) ( not ( = ?auto_174105 ?auto_174107 ) ) ( not ( = ?auto_174105 ?auto_174108 ) ) ( not ( = ?auto_174106 ?auto_174107 ) ) ( not ( = ?auto_174106 ?auto_174108 ) ) ( not ( = ?auto_174107 ?auto_174108 ) ) ( ON ?auto_174106 ?auto_174107 ) ( ON ?auto_174105 ?auto_174106 ) ( ON ?auto_174104 ?auto_174105 ) ( CLEAR ?auto_174102 ) ( ON ?auto_174103 ?auto_174104 ) ( CLEAR ?auto_174103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_174097 ?auto_174098 ?auto_174099 ?auto_174100 ?auto_174101 ?auto_174102 ?auto_174103 )
      ( MAKE-11PILE ?auto_174097 ?auto_174098 ?auto_174099 ?auto_174100 ?auto_174101 ?auto_174102 ?auto_174103 ?auto_174104 ?auto_174105 ?auto_174106 ?auto_174107 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_174120 - BLOCK
      ?auto_174121 - BLOCK
      ?auto_174122 - BLOCK
      ?auto_174123 - BLOCK
      ?auto_174124 - BLOCK
      ?auto_174125 - BLOCK
      ?auto_174126 - BLOCK
      ?auto_174127 - BLOCK
      ?auto_174128 - BLOCK
      ?auto_174129 - BLOCK
      ?auto_174130 - BLOCK
    )
    :vars
    (
      ?auto_174131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174130 ?auto_174131 ) ( ON-TABLE ?auto_174120 ) ( ON ?auto_174121 ?auto_174120 ) ( ON ?auto_174122 ?auto_174121 ) ( ON ?auto_174123 ?auto_174122 ) ( ON ?auto_174124 ?auto_174123 ) ( ON ?auto_174125 ?auto_174124 ) ( not ( = ?auto_174120 ?auto_174121 ) ) ( not ( = ?auto_174120 ?auto_174122 ) ) ( not ( = ?auto_174120 ?auto_174123 ) ) ( not ( = ?auto_174120 ?auto_174124 ) ) ( not ( = ?auto_174120 ?auto_174125 ) ) ( not ( = ?auto_174120 ?auto_174126 ) ) ( not ( = ?auto_174120 ?auto_174127 ) ) ( not ( = ?auto_174120 ?auto_174128 ) ) ( not ( = ?auto_174120 ?auto_174129 ) ) ( not ( = ?auto_174120 ?auto_174130 ) ) ( not ( = ?auto_174120 ?auto_174131 ) ) ( not ( = ?auto_174121 ?auto_174122 ) ) ( not ( = ?auto_174121 ?auto_174123 ) ) ( not ( = ?auto_174121 ?auto_174124 ) ) ( not ( = ?auto_174121 ?auto_174125 ) ) ( not ( = ?auto_174121 ?auto_174126 ) ) ( not ( = ?auto_174121 ?auto_174127 ) ) ( not ( = ?auto_174121 ?auto_174128 ) ) ( not ( = ?auto_174121 ?auto_174129 ) ) ( not ( = ?auto_174121 ?auto_174130 ) ) ( not ( = ?auto_174121 ?auto_174131 ) ) ( not ( = ?auto_174122 ?auto_174123 ) ) ( not ( = ?auto_174122 ?auto_174124 ) ) ( not ( = ?auto_174122 ?auto_174125 ) ) ( not ( = ?auto_174122 ?auto_174126 ) ) ( not ( = ?auto_174122 ?auto_174127 ) ) ( not ( = ?auto_174122 ?auto_174128 ) ) ( not ( = ?auto_174122 ?auto_174129 ) ) ( not ( = ?auto_174122 ?auto_174130 ) ) ( not ( = ?auto_174122 ?auto_174131 ) ) ( not ( = ?auto_174123 ?auto_174124 ) ) ( not ( = ?auto_174123 ?auto_174125 ) ) ( not ( = ?auto_174123 ?auto_174126 ) ) ( not ( = ?auto_174123 ?auto_174127 ) ) ( not ( = ?auto_174123 ?auto_174128 ) ) ( not ( = ?auto_174123 ?auto_174129 ) ) ( not ( = ?auto_174123 ?auto_174130 ) ) ( not ( = ?auto_174123 ?auto_174131 ) ) ( not ( = ?auto_174124 ?auto_174125 ) ) ( not ( = ?auto_174124 ?auto_174126 ) ) ( not ( = ?auto_174124 ?auto_174127 ) ) ( not ( = ?auto_174124 ?auto_174128 ) ) ( not ( = ?auto_174124 ?auto_174129 ) ) ( not ( = ?auto_174124 ?auto_174130 ) ) ( not ( = ?auto_174124 ?auto_174131 ) ) ( not ( = ?auto_174125 ?auto_174126 ) ) ( not ( = ?auto_174125 ?auto_174127 ) ) ( not ( = ?auto_174125 ?auto_174128 ) ) ( not ( = ?auto_174125 ?auto_174129 ) ) ( not ( = ?auto_174125 ?auto_174130 ) ) ( not ( = ?auto_174125 ?auto_174131 ) ) ( not ( = ?auto_174126 ?auto_174127 ) ) ( not ( = ?auto_174126 ?auto_174128 ) ) ( not ( = ?auto_174126 ?auto_174129 ) ) ( not ( = ?auto_174126 ?auto_174130 ) ) ( not ( = ?auto_174126 ?auto_174131 ) ) ( not ( = ?auto_174127 ?auto_174128 ) ) ( not ( = ?auto_174127 ?auto_174129 ) ) ( not ( = ?auto_174127 ?auto_174130 ) ) ( not ( = ?auto_174127 ?auto_174131 ) ) ( not ( = ?auto_174128 ?auto_174129 ) ) ( not ( = ?auto_174128 ?auto_174130 ) ) ( not ( = ?auto_174128 ?auto_174131 ) ) ( not ( = ?auto_174129 ?auto_174130 ) ) ( not ( = ?auto_174129 ?auto_174131 ) ) ( not ( = ?auto_174130 ?auto_174131 ) ) ( ON ?auto_174129 ?auto_174130 ) ( ON ?auto_174128 ?auto_174129 ) ( ON ?auto_174127 ?auto_174128 ) ( CLEAR ?auto_174125 ) ( ON ?auto_174126 ?auto_174127 ) ( CLEAR ?auto_174126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_174120 ?auto_174121 ?auto_174122 ?auto_174123 ?auto_174124 ?auto_174125 ?auto_174126 )
      ( MAKE-11PILE ?auto_174120 ?auto_174121 ?auto_174122 ?auto_174123 ?auto_174124 ?auto_174125 ?auto_174126 ?auto_174127 ?auto_174128 ?auto_174129 ?auto_174130 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_174143 - BLOCK
      ?auto_174144 - BLOCK
      ?auto_174145 - BLOCK
      ?auto_174146 - BLOCK
      ?auto_174147 - BLOCK
      ?auto_174148 - BLOCK
      ?auto_174149 - BLOCK
      ?auto_174150 - BLOCK
      ?auto_174151 - BLOCK
      ?auto_174152 - BLOCK
      ?auto_174153 - BLOCK
    )
    :vars
    (
      ?auto_174154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174153 ?auto_174154 ) ( ON-TABLE ?auto_174143 ) ( ON ?auto_174144 ?auto_174143 ) ( ON ?auto_174145 ?auto_174144 ) ( ON ?auto_174146 ?auto_174145 ) ( ON ?auto_174147 ?auto_174146 ) ( not ( = ?auto_174143 ?auto_174144 ) ) ( not ( = ?auto_174143 ?auto_174145 ) ) ( not ( = ?auto_174143 ?auto_174146 ) ) ( not ( = ?auto_174143 ?auto_174147 ) ) ( not ( = ?auto_174143 ?auto_174148 ) ) ( not ( = ?auto_174143 ?auto_174149 ) ) ( not ( = ?auto_174143 ?auto_174150 ) ) ( not ( = ?auto_174143 ?auto_174151 ) ) ( not ( = ?auto_174143 ?auto_174152 ) ) ( not ( = ?auto_174143 ?auto_174153 ) ) ( not ( = ?auto_174143 ?auto_174154 ) ) ( not ( = ?auto_174144 ?auto_174145 ) ) ( not ( = ?auto_174144 ?auto_174146 ) ) ( not ( = ?auto_174144 ?auto_174147 ) ) ( not ( = ?auto_174144 ?auto_174148 ) ) ( not ( = ?auto_174144 ?auto_174149 ) ) ( not ( = ?auto_174144 ?auto_174150 ) ) ( not ( = ?auto_174144 ?auto_174151 ) ) ( not ( = ?auto_174144 ?auto_174152 ) ) ( not ( = ?auto_174144 ?auto_174153 ) ) ( not ( = ?auto_174144 ?auto_174154 ) ) ( not ( = ?auto_174145 ?auto_174146 ) ) ( not ( = ?auto_174145 ?auto_174147 ) ) ( not ( = ?auto_174145 ?auto_174148 ) ) ( not ( = ?auto_174145 ?auto_174149 ) ) ( not ( = ?auto_174145 ?auto_174150 ) ) ( not ( = ?auto_174145 ?auto_174151 ) ) ( not ( = ?auto_174145 ?auto_174152 ) ) ( not ( = ?auto_174145 ?auto_174153 ) ) ( not ( = ?auto_174145 ?auto_174154 ) ) ( not ( = ?auto_174146 ?auto_174147 ) ) ( not ( = ?auto_174146 ?auto_174148 ) ) ( not ( = ?auto_174146 ?auto_174149 ) ) ( not ( = ?auto_174146 ?auto_174150 ) ) ( not ( = ?auto_174146 ?auto_174151 ) ) ( not ( = ?auto_174146 ?auto_174152 ) ) ( not ( = ?auto_174146 ?auto_174153 ) ) ( not ( = ?auto_174146 ?auto_174154 ) ) ( not ( = ?auto_174147 ?auto_174148 ) ) ( not ( = ?auto_174147 ?auto_174149 ) ) ( not ( = ?auto_174147 ?auto_174150 ) ) ( not ( = ?auto_174147 ?auto_174151 ) ) ( not ( = ?auto_174147 ?auto_174152 ) ) ( not ( = ?auto_174147 ?auto_174153 ) ) ( not ( = ?auto_174147 ?auto_174154 ) ) ( not ( = ?auto_174148 ?auto_174149 ) ) ( not ( = ?auto_174148 ?auto_174150 ) ) ( not ( = ?auto_174148 ?auto_174151 ) ) ( not ( = ?auto_174148 ?auto_174152 ) ) ( not ( = ?auto_174148 ?auto_174153 ) ) ( not ( = ?auto_174148 ?auto_174154 ) ) ( not ( = ?auto_174149 ?auto_174150 ) ) ( not ( = ?auto_174149 ?auto_174151 ) ) ( not ( = ?auto_174149 ?auto_174152 ) ) ( not ( = ?auto_174149 ?auto_174153 ) ) ( not ( = ?auto_174149 ?auto_174154 ) ) ( not ( = ?auto_174150 ?auto_174151 ) ) ( not ( = ?auto_174150 ?auto_174152 ) ) ( not ( = ?auto_174150 ?auto_174153 ) ) ( not ( = ?auto_174150 ?auto_174154 ) ) ( not ( = ?auto_174151 ?auto_174152 ) ) ( not ( = ?auto_174151 ?auto_174153 ) ) ( not ( = ?auto_174151 ?auto_174154 ) ) ( not ( = ?auto_174152 ?auto_174153 ) ) ( not ( = ?auto_174152 ?auto_174154 ) ) ( not ( = ?auto_174153 ?auto_174154 ) ) ( ON ?auto_174152 ?auto_174153 ) ( ON ?auto_174151 ?auto_174152 ) ( ON ?auto_174150 ?auto_174151 ) ( ON ?auto_174149 ?auto_174150 ) ( CLEAR ?auto_174147 ) ( ON ?auto_174148 ?auto_174149 ) ( CLEAR ?auto_174148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_174143 ?auto_174144 ?auto_174145 ?auto_174146 ?auto_174147 ?auto_174148 )
      ( MAKE-11PILE ?auto_174143 ?auto_174144 ?auto_174145 ?auto_174146 ?auto_174147 ?auto_174148 ?auto_174149 ?auto_174150 ?auto_174151 ?auto_174152 ?auto_174153 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_174166 - BLOCK
      ?auto_174167 - BLOCK
      ?auto_174168 - BLOCK
      ?auto_174169 - BLOCK
      ?auto_174170 - BLOCK
      ?auto_174171 - BLOCK
      ?auto_174172 - BLOCK
      ?auto_174173 - BLOCK
      ?auto_174174 - BLOCK
      ?auto_174175 - BLOCK
      ?auto_174176 - BLOCK
    )
    :vars
    (
      ?auto_174177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174176 ?auto_174177 ) ( ON-TABLE ?auto_174166 ) ( ON ?auto_174167 ?auto_174166 ) ( ON ?auto_174168 ?auto_174167 ) ( ON ?auto_174169 ?auto_174168 ) ( ON ?auto_174170 ?auto_174169 ) ( not ( = ?auto_174166 ?auto_174167 ) ) ( not ( = ?auto_174166 ?auto_174168 ) ) ( not ( = ?auto_174166 ?auto_174169 ) ) ( not ( = ?auto_174166 ?auto_174170 ) ) ( not ( = ?auto_174166 ?auto_174171 ) ) ( not ( = ?auto_174166 ?auto_174172 ) ) ( not ( = ?auto_174166 ?auto_174173 ) ) ( not ( = ?auto_174166 ?auto_174174 ) ) ( not ( = ?auto_174166 ?auto_174175 ) ) ( not ( = ?auto_174166 ?auto_174176 ) ) ( not ( = ?auto_174166 ?auto_174177 ) ) ( not ( = ?auto_174167 ?auto_174168 ) ) ( not ( = ?auto_174167 ?auto_174169 ) ) ( not ( = ?auto_174167 ?auto_174170 ) ) ( not ( = ?auto_174167 ?auto_174171 ) ) ( not ( = ?auto_174167 ?auto_174172 ) ) ( not ( = ?auto_174167 ?auto_174173 ) ) ( not ( = ?auto_174167 ?auto_174174 ) ) ( not ( = ?auto_174167 ?auto_174175 ) ) ( not ( = ?auto_174167 ?auto_174176 ) ) ( not ( = ?auto_174167 ?auto_174177 ) ) ( not ( = ?auto_174168 ?auto_174169 ) ) ( not ( = ?auto_174168 ?auto_174170 ) ) ( not ( = ?auto_174168 ?auto_174171 ) ) ( not ( = ?auto_174168 ?auto_174172 ) ) ( not ( = ?auto_174168 ?auto_174173 ) ) ( not ( = ?auto_174168 ?auto_174174 ) ) ( not ( = ?auto_174168 ?auto_174175 ) ) ( not ( = ?auto_174168 ?auto_174176 ) ) ( not ( = ?auto_174168 ?auto_174177 ) ) ( not ( = ?auto_174169 ?auto_174170 ) ) ( not ( = ?auto_174169 ?auto_174171 ) ) ( not ( = ?auto_174169 ?auto_174172 ) ) ( not ( = ?auto_174169 ?auto_174173 ) ) ( not ( = ?auto_174169 ?auto_174174 ) ) ( not ( = ?auto_174169 ?auto_174175 ) ) ( not ( = ?auto_174169 ?auto_174176 ) ) ( not ( = ?auto_174169 ?auto_174177 ) ) ( not ( = ?auto_174170 ?auto_174171 ) ) ( not ( = ?auto_174170 ?auto_174172 ) ) ( not ( = ?auto_174170 ?auto_174173 ) ) ( not ( = ?auto_174170 ?auto_174174 ) ) ( not ( = ?auto_174170 ?auto_174175 ) ) ( not ( = ?auto_174170 ?auto_174176 ) ) ( not ( = ?auto_174170 ?auto_174177 ) ) ( not ( = ?auto_174171 ?auto_174172 ) ) ( not ( = ?auto_174171 ?auto_174173 ) ) ( not ( = ?auto_174171 ?auto_174174 ) ) ( not ( = ?auto_174171 ?auto_174175 ) ) ( not ( = ?auto_174171 ?auto_174176 ) ) ( not ( = ?auto_174171 ?auto_174177 ) ) ( not ( = ?auto_174172 ?auto_174173 ) ) ( not ( = ?auto_174172 ?auto_174174 ) ) ( not ( = ?auto_174172 ?auto_174175 ) ) ( not ( = ?auto_174172 ?auto_174176 ) ) ( not ( = ?auto_174172 ?auto_174177 ) ) ( not ( = ?auto_174173 ?auto_174174 ) ) ( not ( = ?auto_174173 ?auto_174175 ) ) ( not ( = ?auto_174173 ?auto_174176 ) ) ( not ( = ?auto_174173 ?auto_174177 ) ) ( not ( = ?auto_174174 ?auto_174175 ) ) ( not ( = ?auto_174174 ?auto_174176 ) ) ( not ( = ?auto_174174 ?auto_174177 ) ) ( not ( = ?auto_174175 ?auto_174176 ) ) ( not ( = ?auto_174175 ?auto_174177 ) ) ( not ( = ?auto_174176 ?auto_174177 ) ) ( ON ?auto_174175 ?auto_174176 ) ( ON ?auto_174174 ?auto_174175 ) ( ON ?auto_174173 ?auto_174174 ) ( ON ?auto_174172 ?auto_174173 ) ( CLEAR ?auto_174170 ) ( ON ?auto_174171 ?auto_174172 ) ( CLEAR ?auto_174171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_174166 ?auto_174167 ?auto_174168 ?auto_174169 ?auto_174170 ?auto_174171 )
      ( MAKE-11PILE ?auto_174166 ?auto_174167 ?auto_174168 ?auto_174169 ?auto_174170 ?auto_174171 ?auto_174172 ?auto_174173 ?auto_174174 ?auto_174175 ?auto_174176 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_174189 - BLOCK
      ?auto_174190 - BLOCK
      ?auto_174191 - BLOCK
      ?auto_174192 - BLOCK
      ?auto_174193 - BLOCK
      ?auto_174194 - BLOCK
      ?auto_174195 - BLOCK
      ?auto_174196 - BLOCK
      ?auto_174197 - BLOCK
      ?auto_174198 - BLOCK
      ?auto_174199 - BLOCK
    )
    :vars
    (
      ?auto_174200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174199 ?auto_174200 ) ( ON-TABLE ?auto_174189 ) ( ON ?auto_174190 ?auto_174189 ) ( ON ?auto_174191 ?auto_174190 ) ( ON ?auto_174192 ?auto_174191 ) ( not ( = ?auto_174189 ?auto_174190 ) ) ( not ( = ?auto_174189 ?auto_174191 ) ) ( not ( = ?auto_174189 ?auto_174192 ) ) ( not ( = ?auto_174189 ?auto_174193 ) ) ( not ( = ?auto_174189 ?auto_174194 ) ) ( not ( = ?auto_174189 ?auto_174195 ) ) ( not ( = ?auto_174189 ?auto_174196 ) ) ( not ( = ?auto_174189 ?auto_174197 ) ) ( not ( = ?auto_174189 ?auto_174198 ) ) ( not ( = ?auto_174189 ?auto_174199 ) ) ( not ( = ?auto_174189 ?auto_174200 ) ) ( not ( = ?auto_174190 ?auto_174191 ) ) ( not ( = ?auto_174190 ?auto_174192 ) ) ( not ( = ?auto_174190 ?auto_174193 ) ) ( not ( = ?auto_174190 ?auto_174194 ) ) ( not ( = ?auto_174190 ?auto_174195 ) ) ( not ( = ?auto_174190 ?auto_174196 ) ) ( not ( = ?auto_174190 ?auto_174197 ) ) ( not ( = ?auto_174190 ?auto_174198 ) ) ( not ( = ?auto_174190 ?auto_174199 ) ) ( not ( = ?auto_174190 ?auto_174200 ) ) ( not ( = ?auto_174191 ?auto_174192 ) ) ( not ( = ?auto_174191 ?auto_174193 ) ) ( not ( = ?auto_174191 ?auto_174194 ) ) ( not ( = ?auto_174191 ?auto_174195 ) ) ( not ( = ?auto_174191 ?auto_174196 ) ) ( not ( = ?auto_174191 ?auto_174197 ) ) ( not ( = ?auto_174191 ?auto_174198 ) ) ( not ( = ?auto_174191 ?auto_174199 ) ) ( not ( = ?auto_174191 ?auto_174200 ) ) ( not ( = ?auto_174192 ?auto_174193 ) ) ( not ( = ?auto_174192 ?auto_174194 ) ) ( not ( = ?auto_174192 ?auto_174195 ) ) ( not ( = ?auto_174192 ?auto_174196 ) ) ( not ( = ?auto_174192 ?auto_174197 ) ) ( not ( = ?auto_174192 ?auto_174198 ) ) ( not ( = ?auto_174192 ?auto_174199 ) ) ( not ( = ?auto_174192 ?auto_174200 ) ) ( not ( = ?auto_174193 ?auto_174194 ) ) ( not ( = ?auto_174193 ?auto_174195 ) ) ( not ( = ?auto_174193 ?auto_174196 ) ) ( not ( = ?auto_174193 ?auto_174197 ) ) ( not ( = ?auto_174193 ?auto_174198 ) ) ( not ( = ?auto_174193 ?auto_174199 ) ) ( not ( = ?auto_174193 ?auto_174200 ) ) ( not ( = ?auto_174194 ?auto_174195 ) ) ( not ( = ?auto_174194 ?auto_174196 ) ) ( not ( = ?auto_174194 ?auto_174197 ) ) ( not ( = ?auto_174194 ?auto_174198 ) ) ( not ( = ?auto_174194 ?auto_174199 ) ) ( not ( = ?auto_174194 ?auto_174200 ) ) ( not ( = ?auto_174195 ?auto_174196 ) ) ( not ( = ?auto_174195 ?auto_174197 ) ) ( not ( = ?auto_174195 ?auto_174198 ) ) ( not ( = ?auto_174195 ?auto_174199 ) ) ( not ( = ?auto_174195 ?auto_174200 ) ) ( not ( = ?auto_174196 ?auto_174197 ) ) ( not ( = ?auto_174196 ?auto_174198 ) ) ( not ( = ?auto_174196 ?auto_174199 ) ) ( not ( = ?auto_174196 ?auto_174200 ) ) ( not ( = ?auto_174197 ?auto_174198 ) ) ( not ( = ?auto_174197 ?auto_174199 ) ) ( not ( = ?auto_174197 ?auto_174200 ) ) ( not ( = ?auto_174198 ?auto_174199 ) ) ( not ( = ?auto_174198 ?auto_174200 ) ) ( not ( = ?auto_174199 ?auto_174200 ) ) ( ON ?auto_174198 ?auto_174199 ) ( ON ?auto_174197 ?auto_174198 ) ( ON ?auto_174196 ?auto_174197 ) ( ON ?auto_174195 ?auto_174196 ) ( ON ?auto_174194 ?auto_174195 ) ( CLEAR ?auto_174192 ) ( ON ?auto_174193 ?auto_174194 ) ( CLEAR ?auto_174193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_174189 ?auto_174190 ?auto_174191 ?auto_174192 ?auto_174193 )
      ( MAKE-11PILE ?auto_174189 ?auto_174190 ?auto_174191 ?auto_174192 ?auto_174193 ?auto_174194 ?auto_174195 ?auto_174196 ?auto_174197 ?auto_174198 ?auto_174199 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_174212 - BLOCK
      ?auto_174213 - BLOCK
      ?auto_174214 - BLOCK
      ?auto_174215 - BLOCK
      ?auto_174216 - BLOCK
      ?auto_174217 - BLOCK
      ?auto_174218 - BLOCK
      ?auto_174219 - BLOCK
      ?auto_174220 - BLOCK
      ?auto_174221 - BLOCK
      ?auto_174222 - BLOCK
    )
    :vars
    (
      ?auto_174223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174222 ?auto_174223 ) ( ON-TABLE ?auto_174212 ) ( ON ?auto_174213 ?auto_174212 ) ( ON ?auto_174214 ?auto_174213 ) ( ON ?auto_174215 ?auto_174214 ) ( not ( = ?auto_174212 ?auto_174213 ) ) ( not ( = ?auto_174212 ?auto_174214 ) ) ( not ( = ?auto_174212 ?auto_174215 ) ) ( not ( = ?auto_174212 ?auto_174216 ) ) ( not ( = ?auto_174212 ?auto_174217 ) ) ( not ( = ?auto_174212 ?auto_174218 ) ) ( not ( = ?auto_174212 ?auto_174219 ) ) ( not ( = ?auto_174212 ?auto_174220 ) ) ( not ( = ?auto_174212 ?auto_174221 ) ) ( not ( = ?auto_174212 ?auto_174222 ) ) ( not ( = ?auto_174212 ?auto_174223 ) ) ( not ( = ?auto_174213 ?auto_174214 ) ) ( not ( = ?auto_174213 ?auto_174215 ) ) ( not ( = ?auto_174213 ?auto_174216 ) ) ( not ( = ?auto_174213 ?auto_174217 ) ) ( not ( = ?auto_174213 ?auto_174218 ) ) ( not ( = ?auto_174213 ?auto_174219 ) ) ( not ( = ?auto_174213 ?auto_174220 ) ) ( not ( = ?auto_174213 ?auto_174221 ) ) ( not ( = ?auto_174213 ?auto_174222 ) ) ( not ( = ?auto_174213 ?auto_174223 ) ) ( not ( = ?auto_174214 ?auto_174215 ) ) ( not ( = ?auto_174214 ?auto_174216 ) ) ( not ( = ?auto_174214 ?auto_174217 ) ) ( not ( = ?auto_174214 ?auto_174218 ) ) ( not ( = ?auto_174214 ?auto_174219 ) ) ( not ( = ?auto_174214 ?auto_174220 ) ) ( not ( = ?auto_174214 ?auto_174221 ) ) ( not ( = ?auto_174214 ?auto_174222 ) ) ( not ( = ?auto_174214 ?auto_174223 ) ) ( not ( = ?auto_174215 ?auto_174216 ) ) ( not ( = ?auto_174215 ?auto_174217 ) ) ( not ( = ?auto_174215 ?auto_174218 ) ) ( not ( = ?auto_174215 ?auto_174219 ) ) ( not ( = ?auto_174215 ?auto_174220 ) ) ( not ( = ?auto_174215 ?auto_174221 ) ) ( not ( = ?auto_174215 ?auto_174222 ) ) ( not ( = ?auto_174215 ?auto_174223 ) ) ( not ( = ?auto_174216 ?auto_174217 ) ) ( not ( = ?auto_174216 ?auto_174218 ) ) ( not ( = ?auto_174216 ?auto_174219 ) ) ( not ( = ?auto_174216 ?auto_174220 ) ) ( not ( = ?auto_174216 ?auto_174221 ) ) ( not ( = ?auto_174216 ?auto_174222 ) ) ( not ( = ?auto_174216 ?auto_174223 ) ) ( not ( = ?auto_174217 ?auto_174218 ) ) ( not ( = ?auto_174217 ?auto_174219 ) ) ( not ( = ?auto_174217 ?auto_174220 ) ) ( not ( = ?auto_174217 ?auto_174221 ) ) ( not ( = ?auto_174217 ?auto_174222 ) ) ( not ( = ?auto_174217 ?auto_174223 ) ) ( not ( = ?auto_174218 ?auto_174219 ) ) ( not ( = ?auto_174218 ?auto_174220 ) ) ( not ( = ?auto_174218 ?auto_174221 ) ) ( not ( = ?auto_174218 ?auto_174222 ) ) ( not ( = ?auto_174218 ?auto_174223 ) ) ( not ( = ?auto_174219 ?auto_174220 ) ) ( not ( = ?auto_174219 ?auto_174221 ) ) ( not ( = ?auto_174219 ?auto_174222 ) ) ( not ( = ?auto_174219 ?auto_174223 ) ) ( not ( = ?auto_174220 ?auto_174221 ) ) ( not ( = ?auto_174220 ?auto_174222 ) ) ( not ( = ?auto_174220 ?auto_174223 ) ) ( not ( = ?auto_174221 ?auto_174222 ) ) ( not ( = ?auto_174221 ?auto_174223 ) ) ( not ( = ?auto_174222 ?auto_174223 ) ) ( ON ?auto_174221 ?auto_174222 ) ( ON ?auto_174220 ?auto_174221 ) ( ON ?auto_174219 ?auto_174220 ) ( ON ?auto_174218 ?auto_174219 ) ( ON ?auto_174217 ?auto_174218 ) ( CLEAR ?auto_174215 ) ( ON ?auto_174216 ?auto_174217 ) ( CLEAR ?auto_174216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_174212 ?auto_174213 ?auto_174214 ?auto_174215 ?auto_174216 )
      ( MAKE-11PILE ?auto_174212 ?auto_174213 ?auto_174214 ?auto_174215 ?auto_174216 ?auto_174217 ?auto_174218 ?auto_174219 ?auto_174220 ?auto_174221 ?auto_174222 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_174235 - BLOCK
      ?auto_174236 - BLOCK
      ?auto_174237 - BLOCK
      ?auto_174238 - BLOCK
      ?auto_174239 - BLOCK
      ?auto_174240 - BLOCK
      ?auto_174241 - BLOCK
      ?auto_174242 - BLOCK
      ?auto_174243 - BLOCK
      ?auto_174244 - BLOCK
      ?auto_174245 - BLOCK
    )
    :vars
    (
      ?auto_174246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174245 ?auto_174246 ) ( ON-TABLE ?auto_174235 ) ( ON ?auto_174236 ?auto_174235 ) ( ON ?auto_174237 ?auto_174236 ) ( not ( = ?auto_174235 ?auto_174236 ) ) ( not ( = ?auto_174235 ?auto_174237 ) ) ( not ( = ?auto_174235 ?auto_174238 ) ) ( not ( = ?auto_174235 ?auto_174239 ) ) ( not ( = ?auto_174235 ?auto_174240 ) ) ( not ( = ?auto_174235 ?auto_174241 ) ) ( not ( = ?auto_174235 ?auto_174242 ) ) ( not ( = ?auto_174235 ?auto_174243 ) ) ( not ( = ?auto_174235 ?auto_174244 ) ) ( not ( = ?auto_174235 ?auto_174245 ) ) ( not ( = ?auto_174235 ?auto_174246 ) ) ( not ( = ?auto_174236 ?auto_174237 ) ) ( not ( = ?auto_174236 ?auto_174238 ) ) ( not ( = ?auto_174236 ?auto_174239 ) ) ( not ( = ?auto_174236 ?auto_174240 ) ) ( not ( = ?auto_174236 ?auto_174241 ) ) ( not ( = ?auto_174236 ?auto_174242 ) ) ( not ( = ?auto_174236 ?auto_174243 ) ) ( not ( = ?auto_174236 ?auto_174244 ) ) ( not ( = ?auto_174236 ?auto_174245 ) ) ( not ( = ?auto_174236 ?auto_174246 ) ) ( not ( = ?auto_174237 ?auto_174238 ) ) ( not ( = ?auto_174237 ?auto_174239 ) ) ( not ( = ?auto_174237 ?auto_174240 ) ) ( not ( = ?auto_174237 ?auto_174241 ) ) ( not ( = ?auto_174237 ?auto_174242 ) ) ( not ( = ?auto_174237 ?auto_174243 ) ) ( not ( = ?auto_174237 ?auto_174244 ) ) ( not ( = ?auto_174237 ?auto_174245 ) ) ( not ( = ?auto_174237 ?auto_174246 ) ) ( not ( = ?auto_174238 ?auto_174239 ) ) ( not ( = ?auto_174238 ?auto_174240 ) ) ( not ( = ?auto_174238 ?auto_174241 ) ) ( not ( = ?auto_174238 ?auto_174242 ) ) ( not ( = ?auto_174238 ?auto_174243 ) ) ( not ( = ?auto_174238 ?auto_174244 ) ) ( not ( = ?auto_174238 ?auto_174245 ) ) ( not ( = ?auto_174238 ?auto_174246 ) ) ( not ( = ?auto_174239 ?auto_174240 ) ) ( not ( = ?auto_174239 ?auto_174241 ) ) ( not ( = ?auto_174239 ?auto_174242 ) ) ( not ( = ?auto_174239 ?auto_174243 ) ) ( not ( = ?auto_174239 ?auto_174244 ) ) ( not ( = ?auto_174239 ?auto_174245 ) ) ( not ( = ?auto_174239 ?auto_174246 ) ) ( not ( = ?auto_174240 ?auto_174241 ) ) ( not ( = ?auto_174240 ?auto_174242 ) ) ( not ( = ?auto_174240 ?auto_174243 ) ) ( not ( = ?auto_174240 ?auto_174244 ) ) ( not ( = ?auto_174240 ?auto_174245 ) ) ( not ( = ?auto_174240 ?auto_174246 ) ) ( not ( = ?auto_174241 ?auto_174242 ) ) ( not ( = ?auto_174241 ?auto_174243 ) ) ( not ( = ?auto_174241 ?auto_174244 ) ) ( not ( = ?auto_174241 ?auto_174245 ) ) ( not ( = ?auto_174241 ?auto_174246 ) ) ( not ( = ?auto_174242 ?auto_174243 ) ) ( not ( = ?auto_174242 ?auto_174244 ) ) ( not ( = ?auto_174242 ?auto_174245 ) ) ( not ( = ?auto_174242 ?auto_174246 ) ) ( not ( = ?auto_174243 ?auto_174244 ) ) ( not ( = ?auto_174243 ?auto_174245 ) ) ( not ( = ?auto_174243 ?auto_174246 ) ) ( not ( = ?auto_174244 ?auto_174245 ) ) ( not ( = ?auto_174244 ?auto_174246 ) ) ( not ( = ?auto_174245 ?auto_174246 ) ) ( ON ?auto_174244 ?auto_174245 ) ( ON ?auto_174243 ?auto_174244 ) ( ON ?auto_174242 ?auto_174243 ) ( ON ?auto_174241 ?auto_174242 ) ( ON ?auto_174240 ?auto_174241 ) ( ON ?auto_174239 ?auto_174240 ) ( CLEAR ?auto_174237 ) ( ON ?auto_174238 ?auto_174239 ) ( CLEAR ?auto_174238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_174235 ?auto_174236 ?auto_174237 ?auto_174238 )
      ( MAKE-11PILE ?auto_174235 ?auto_174236 ?auto_174237 ?auto_174238 ?auto_174239 ?auto_174240 ?auto_174241 ?auto_174242 ?auto_174243 ?auto_174244 ?auto_174245 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_174258 - BLOCK
      ?auto_174259 - BLOCK
      ?auto_174260 - BLOCK
      ?auto_174261 - BLOCK
      ?auto_174262 - BLOCK
      ?auto_174263 - BLOCK
      ?auto_174264 - BLOCK
      ?auto_174265 - BLOCK
      ?auto_174266 - BLOCK
      ?auto_174267 - BLOCK
      ?auto_174268 - BLOCK
    )
    :vars
    (
      ?auto_174269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174268 ?auto_174269 ) ( ON-TABLE ?auto_174258 ) ( ON ?auto_174259 ?auto_174258 ) ( ON ?auto_174260 ?auto_174259 ) ( not ( = ?auto_174258 ?auto_174259 ) ) ( not ( = ?auto_174258 ?auto_174260 ) ) ( not ( = ?auto_174258 ?auto_174261 ) ) ( not ( = ?auto_174258 ?auto_174262 ) ) ( not ( = ?auto_174258 ?auto_174263 ) ) ( not ( = ?auto_174258 ?auto_174264 ) ) ( not ( = ?auto_174258 ?auto_174265 ) ) ( not ( = ?auto_174258 ?auto_174266 ) ) ( not ( = ?auto_174258 ?auto_174267 ) ) ( not ( = ?auto_174258 ?auto_174268 ) ) ( not ( = ?auto_174258 ?auto_174269 ) ) ( not ( = ?auto_174259 ?auto_174260 ) ) ( not ( = ?auto_174259 ?auto_174261 ) ) ( not ( = ?auto_174259 ?auto_174262 ) ) ( not ( = ?auto_174259 ?auto_174263 ) ) ( not ( = ?auto_174259 ?auto_174264 ) ) ( not ( = ?auto_174259 ?auto_174265 ) ) ( not ( = ?auto_174259 ?auto_174266 ) ) ( not ( = ?auto_174259 ?auto_174267 ) ) ( not ( = ?auto_174259 ?auto_174268 ) ) ( not ( = ?auto_174259 ?auto_174269 ) ) ( not ( = ?auto_174260 ?auto_174261 ) ) ( not ( = ?auto_174260 ?auto_174262 ) ) ( not ( = ?auto_174260 ?auto_174263 ) ) ( not ( = ?auto_174260 ?auto_174264 ) ) ( not ( = ?auto_174260 ?auto_174265 ) ) ( not ( = ?auto_174260 ?auto_174266 ) ) ( not ( = ?auto_174260 ?auto_174267 ) ) ( not ( = ?auto_174260 ?auto_174268 ) ) ( not ( = ?auto_174260 ?auto_174269 ) ) ( not ( = ?auto_174261 ?auto_174262 ) ) ( not ( = ?auto_174261 ?auto_174263 ) ) ( not ( = ?auto_174261 ?auto_174264 ) ) ( not ( = ?auto_174261 ?auto_174265 ) ) ( not ( = ?auto_174261 ?auto_174266 ) ) ( not ( = ?auto_174261 ?auto_174267 ) ) ( not ( = ?auto_174261 ?auto_174268 ) ) ( not ( = ?auto_174261 ?auto_174269 ) ) ( not ( = ?auto_174262 ?auto_174263 ) ) ( not ( = ?auto_174262 ?auto_174264 ) ) ( not ( = ?auto_174262 ?auto_174265 ) ) ( not ( = ?auto_174262 ?auto_174266 ) ) ( not ( = ?auto_174262 ?auto_174267 ) ) ( not ( = ?auto_174262 ?auto_174268 ) ) ( not ( = ?auto_174262 ?auto_174269 ) ) ( not ( = ?auto_174263 ?auto_174264 ) ) ( not ( = ?auto_174263 ?auto_174265 ) ) ( not ( = ?auto_174263 ?auto_174266 ) ) ( not ( = ?auto_174263 ?auto_174267 ) ) ( not ( = ?auto_174263 ?auto_174268 ) ) ( not ( = ?auto_174263 ?auto_174269 ) ) ( not ( = ?auto_174264 ?auto_174265 ) ) ( not ( = ?auto_174264 ?auto_174266 ) ) ( not ( = ?auto_174264 ?auto_174267 ) ) ( not ( = ?auto_174264 ?auto_174268 ) ) ( not ( = ?auto_174264 ?auto_174269 ) ) ( not ( = ?auto_174265 ?auto_174266 ) ) ( not ( = ?auto_174265 ?auto_174267 ) ) ( not ( = ?auto_174265 ?auto_174268 ) ) ( not ( = ?auto_174265 ?auto_174269 ) ) ( not ( = ?auto_174266 ?auto_174267 ) ) ( not ( = ?auto_174266 ?auto_174268 ) ) ( not ( = ?auto_174266 ?auto_174269 ) ) ( not ( = ?auto_174267 ?auto_174268 ) ) ( not ( = ?auto_174267 ?auto_174269 ) ) ( not ( = ?auto_174268 ?auto_174269 ) ) ( ON ?auto_174267 ?auto_174268 ) ( ON ?auto_174266 ?auto_174267 ) ( ON ?auto_174265 ?auto_174266 ) ( ON ?auto_174264 ?auto_174265 ) ( ON ?auto_174263 ?auto_174264 ) ( ON ?auto_174262 ?auto_174263 ) ( CLEAR ?auto_174260 ) ( ON ?auto_174261 ?auto_174262 ) ( CLEAR ?auto_174261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_174258 ?auto_174259 ?auto_174260 ?auto_174261 )
      ( MAKE-11PILE ?auto_174258 ?auto_174259 ?auto_174260 ?auto_174261 ?auto_174262 ?auto_174263 ?auto_174264 ?auto_174265 ?auto_174266 ?auto_174267 ?auto_174268 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_174281 - BLOCK
      ?auto_174282 - BLOCK
      ?auto_174283 - BLOCK
      ?auto_174284 - BLOCK
      ?auto_174285 - BLOCK
      ?auto_174286 - BLOCK
      ?auto_174287 - BLOCK
      ?auto_174288 - BLOCK
      ?auto_174289 - BLOCK
      ?auto_174290 - BLOCK
      ?auto_174291 - BLOCK
    )
    :vars
    (
      ?auto_174292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174291 ?auto_174292 ) ( ON-TABLE ?auto_174281 ) ( ON ?auto_174282 ?auto_174281 ) ( not ( = ?auto_174281 ?auto_174282 ) ) ( not ( = ?auto_174281 ?auto_174283 ) ) ( not ( = ?auto_174281 ?auto_174284 ) ) ( not ( = ?auto_174281 ?auto_174285 ) ) ( not ( = ?auto_174281 ?auto_174286 ) ) ( not ( = ?auto_174281 ?auto_174287 ) ) ( not ( = ?auto_174281 ?auto_174288 ) ) ( not ( = ?auto_174281 ?auto_174289 ) ) ( not ( = ?auto_174281 ?auto_174290 ) ) ( not ( = ?auto_174281 ?auto_174291 ) ) ( not ( = ?auto_174281 ?auto_174292 ) ) ( not ( = ?auto_174282 ?auto_174283 ) ) ( not ( = ?auto_174282 ?auto_174284 ) ) ( not ( = ?auto_174282 ?auto_174285 ) ) ( not ( = ?auto_174282 ?auto_174286 ) ) ( not ( = ?auto_174282 ?auto_174287 ) ) ( not ( = ?auto_174282 ?auto_174288 ) ) ( not ( = ?auto_174282 ?auto_174289 ) ) ( not ( = ?auto_174282 ?auto_174290 ) ) ( not ( = ?auto_174282 ?auto_174291 ) ) ( not ( = ?auto_174282 ?auto_174292 ) ) ( not ( = ?auto_174283 ?auto_174284 ) ) ( not ( = ?auto_174283 ?auto_174285 ) ) ( not ( = ?auto_174283 ?auto_174286 ) ) ( not ( = ?auto_174283 ?auto_174287 ) ) ( not ( = ?auto_174283 ?auto_174288 ) ) ( not ( = ?auto_174283 ?auto_174289 ) ) ( not ( = ?auto_174283 ?auto_174290 ) ) ( not ( = ?auto_174283 ?auto_174291 ) ) ( not ( = ?auto_174283 ?auto_174292 ) ) ( not ( = ?auto_174284 ?auto_174285 ) ) ( not ( = ?auto_174284 ?auto_174286 ) ) ( not ( = ?auto_174284 ?auto_174287 ) ) ( not ( = ?auto_174284 ?auto_174288 ) ) ( not ( = ?auto_174284 ?auto_174289 ) ) ( not ( = ?auto_174284 ?auto_174290 ) ) ( not ( = ?auto_174284 ?auto_174291 ) ) ( not ( = ?auto_174284 ?auto_174292 ) ) ( not ( = ?auto_174285 ?auto_174286 ) ) ( not ( = ?auto_174285 ?auto_174287 ) ) ( not ( = ?auto_174285 ?auto_174288 ) ) ( not ( = ?auto_174285 ?auto_174289 ) ) ( not ( = ?auto_174285 ?auto_174290 ) ) ( not ( = ?auto_174285 ?auto_174291 ) ) ( not ( = ?auto_174285 ?auto_174292 ) ) ( not ( = ?auto_174286 ?auto_174287 ) ) ( not ( = ?auto_174286 ?auto_174288 ) ) ( not ( = ?auto_174286 ?auto_174289 ) ) ( not ( = ?auto_174286 ?auto_174290 ) ) ( not ( = ?auto_174286 ?auto_174291 ) ) ( not ( = ?auto_174286 ?auto_174292 ) ) ( not ( = ?auto_174287 ?auto_174288 ) ) ( not ( = ?auto_174287 ?auto_174289 ) ) ( not ( = ?auto_174287 ?auto_174290 ) ) ( not ( = ?auto_174287 ?auto_174291 ) ) ( not ( = ?auto_174287 ?auto_174292 ) ) ( not ( = ?auto_174288 ?auto_174289 ) ) ( not ( = ?auto_174288 ?auto_174290 ) ) ( not ( = ?auto_174288 ?auto_174291 ) ) ( not ( = ?auto_174288 ?auto_174292 ) ) ( not ( = ?auto_174289 ?auto_174290 ) ) ( not ( = ?auto_174289 ?auto_174291 ) ) ( not ( = ?auto_174289 ?auto_174292 ) ) ( not ( = ?auto_174290 ?auto_174291 ) ) ( not ( = ?auto_174290 ?auto_174292 ) ) ( not ( = ?auto_174291 ?auto_174292 ) ) ( ON ?auto_174290 ?auto_174291 ) ( ON ?auto_174289 ?auto_174290 ) ( ON ?auto_174288 ?auto_174289 ) ( ON ?auto_174287 ?auto_174288 ) ( ON ?auto_174286 ?auto_174287 ) ( ON ?auto_174285 ?auto_174286 ) ( ON ?auto_174284 ?auto_174285 ) ( CLEAR ?auto_174282 ) ( ON ?auto_174283 ?auto_174284 ) ( CLEAR ?auto_174283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174281 ?auto_174282 ?auto_174283 )
      ( MAKE-11PILE ?auto_174281 ?auto_174282 ?auto_174283 ?auto_174284 ?auto_174285 ?auto_174286 ?auto_174287 ?auto_174288 ?auto_174289 ?auto_174290 ?auto_174291 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_174304 - BLOCK
      ?auto_174305 - BLOCK
      ?auto_174306 - BLOCK
      ?auto_174307 - BLOCK
      ?auto_174308 - BLOCK
      ?auto_174309 - BLOCK
      ?auto_174310 - BLOCK
      ?auto_174311 - BLOCK
      ?auto_174312 - BLOCK
      ?auto_174313 - BLOCK
      ?auto_174314 - BLOCK
    )
    :vars
    (
      ?auto_174315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174314 ?auto_174315 ) ( ON-TABLE ?auto_174304 ) ( ON ?auto_174305 ?auto_174304 ) ( not ( = ?auto_174304 ?auto_174305 ) ) ( not ( = ?auto_174304 ?auto_174306 ) ) ( not ( = ?auto_174304 ?auto_174307 ) ) ( not ( = ?auto_174304 ?auto_174308 ) ) ( not ( = ?auto_174304 ?auto_174309 ) ) ( not ( = ?auto_174304 ?auto_174310 ) ) ( not ( = ?auto_174304 ?auto_174311 ) ) ( not ( = ?auto_174304 ?auto_174312 ) ) ( not ( = ?auto_174304 ?auto_174313 ) ) ( not ( = ?auto_174304 ?auto_174314 ) ) ( not ( = ?auto_174304 ?auto_174315 ) ) ( not ( = ?auto_174305 ?auto_174306 ) ) ( not ( = ?auto_174305 ?auto_174307 ) ) ( not ( = ?auto_174305 ?auto_174308 ) ) ( not ( = ?auto_174305 ?auto_174309 ) ) ( not ( = ?auto_174305 ?auto_174310 ) ) ( not ( = ?auto_174305 ?auto_174311 ) ) ( not ( = ?auto_174305 ?auto_174312 ) ) ( not ( = ?auto_174305 ?auto_174313 ) ) ( not ( = ?auto_174305 ?auto_174314 ) ) ( not ( = ?auto_174305 ?auto_174315 ) ) ( not ( = ?auto_174306 ?auto_174307 ) ) ( not ( = ?auto_174306 ?auto_174308 ) ) ( not ( = ?auto_174306 ?auto_174309 ) ) ( not ( = ?auto_174306 ?auto_174310 ) ) ( not ( = ?auto_174306 ?auto_174311 ) ) ( not ( = ?auto_174306 ?auto_174312 ) ) ( not ( = ?auto_174306 ?auto_174313 ) ) ( not ( = ?auto_174306 ?auto_174314 ) ) ( not ( = ?auto_174306 ?auto_174315 ) ) ( not ( = ?auto_174307 ?auto_174308 ) ) ( not ( = ?auto_174307 ?auto_174309 ) ) ( not ( = ?auto_174307 ?auto_174310 ) ) ( not ( = ?auto_174307 ?auto_174311 ) ) ( not ( = ?auto_174307 ?auto_174312 ) ) ( not ( = ?auto_174307 ?auto_174313 ) ) ( not ( = ?auto_174307 ?auto_174314 ) ) ( not ( = ?auto_174307 ?auto_174315 ) ) ( not ( = ?auto_174308 ?auto_174309 ) ) ( not ( = ?auto_174308 ?auto_174310 ) ) ( not ( = ?auto_174308 ?auto_174311 ) ) ( not ( = ?auto_174308 ?auto_174312 ) ) ( not ( = ?auto_174308 ?auto_174313 ) ) ( not ( = ?auto_174308 ?auto_174314 ) ) ( not ( = ?auto_174308 ?auto_174315 ) ) ( not ( = ?auto_174309 ?auto_174310 ) ) ( not ( = ?auto_174309 ?auto_174311 ) ) ( not ( = ?auto_174309 ?auto_174312 ) ) ( not ( = ?auto_174309 ?auto_174313 ) ) ( not ( = ?auto_174309 ?auto_174314 ) ) ( not ( = ?auto_174309 ?auto_174315 ) ) ( not ( = ?auto_174310 ?auto_174311 ) ) ( not ( = ?auto_174310 ?auto_174312 ) ) ( not ( = ?auto_174310 ?auto_174313 ) ) ( not ( = ?auto_174310 ?auto_174314 ) ) ( not ( = ?auto_174310 ?auto_174315 ) ) ( not ( = ?auto_174311 ?auto_174312 ) ) ( not ( = ?auto_174311 ?auto_174313 ) ) ( not ( = ?auto_174311 ?auto_174314 ) ) ( not ( = ?auto_174311 ?auto_174315 ) ) ( not ( = ?auto_174312 ?auto_174313 ) ) ( not ( = ?auto_174312 ?auto_174314 ) ) ( not ( = ?auto_174312 ?auto_174315 ) ) ( not ( = ?auto_174313 ?auto_174314 ) ) ( not ( = ?auto_174313 ?auto_174315 ) ) ( not ( = ?auto_174314 ?auto_174315 ) ) ( ON ?auto_174313 ?auto_174314 ) ( ON ?auto_174312 ?auto_174313 ) ( ON ?auto_174311 ?auto_174312 ) ( ON ?auto_174310 ?auto_174311 ) ( ON ?auto_174309 ?auto_174310 ) ( ON ?auto_174308 ?auto_174309 ) ( ON ?auto_174307 ?auto_174308 ) ( CLEAR ?auto_174305 ) ( ON ?auto_174306 ?auto_174307 ) ( CLEAR ?auto_174306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174304 ?auto_174305 ?auto_174306 )
      ( MAKE-11PILE ?auto_174304 ?auto_174305 ?auto_174306 ?auto_174307 ?auto_174308 ?auto_174309 ?auto_174310 ?auto_174311 ?auto_174312 ?auto_174313 ?auto_174314 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_174327 - BLOCK
      ?auto_174328 - BLOCK
      ?auto_174329 - BLOCK
      ?auto_174330 - BLOCK
      ?auto_174331 - BLOCK
      ?auto_174332 - BLOCK
      ?auto_174333 - BLOCK
      ?auto_174334 - BLOCK
      ?auto_174335 - BLOCK
      ?auto_174336 - BLOCK
      ?auto_174337 - BLOCK
    )
    :vars
    (
      ?auto_174338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174337 ?auto_174338 ) ( ON-TABLE ?auto_174327 ) ( not ( = ?auto_174327 ?auto_174328 ) ) ( not ( = ?auto_174327 ?auto_174329 ) ) ( not ( = ?auto_174327 ?auto_174330 ) ) ( not ( = ?auto_174327 ?auto_174331 ) ) ( not ( = ?auto_174327 ?auto_174332 ) ) ( not ( = ?auto_174327 ?auto_174333 ) ) ( not ( = ?auto_174327 ?auto_174334 ) ) ( not ( = ?auto_174327 ?auto_174335 ) ) ( not ( = ?auto_174327 ?auto_174336 ) ) ( not ( = ?auto_174327 ?auto_174337 ) ) ( not ( = ?auto_174327 ?auto_174338 ) ) ( not ( = ?auto_174328 ?auto_174329 ) ) ( not ( = ?auto_174328 ?auto_174330 ) ) ( not ( = ?auto_174328 ?auto_174331 ) ) ( not ( = ?auto_174328 ?auto_174332 ) ) ( not ( = ?auto_174328 ?auto_174333 ) ) ( not ( = ?auto_174328 ?auto_174334 ) ) ( not ( = ?auto_174328 ?auto_174335 ) ) ( not ( = ?auto_174328 ?auto_174336 ) ) ( not ( = ?auto_174328 ?auto_174337 ) ) ( not ( = ?auto_174328 ?auto_174338 ) ) ( not ( = ?auto_174329 ?auto_174330 ) ) ( not ( = ?auto_174329 ?auto_174331 ) ) ( not ( = ?auto_174329 ?auto_174332 ) ) ( not ( = ?auto_174329 ?auto_174333 ) ) ( not ( = ?auto_174329 ?auto_174334 ) ) ( not ( = ?auto_174329 ?auto_174335 ) ) ( not ( = ?auto_174329 ?auto_174336 ) ) ( not ( = ?auto_174329 ?auto_174337 ) ) ( not ( = ?auto_174329 ?auto_174338 ) ) ( not ( = ?auto_174330 ?auto_174331 ) ) ( not ( = ?auto_174330 ?auto_174332 ) ) ( not ( = ?auto_174330 ?auto_174333 ) ) ( not ( = ?auto_174330 ?auto_174334 ) ) ( not ( = ?auto_174330 ?auto_174335 ) ) ( not ( = ?auto_174330 ?auto_174336 ) ) ( not ( = ?auto_174330 ?auto_174337 ) ) ( not ( = ?auto_174330 ?auto_174338 ) ) ( not ( = ?auto_174331 ?auto_174332 ) ) ( not ( = ?auto_174331 ?auto_174333 ) ) ( not ( = ?auto_174331 ?auto_174334 ) ) ( not ( = ?auto_174331 ?auto_174335 ) ) ( not ( = ?auto_174331 ?auto_174336 ) ) ( not ( = ?auto_174331 ?auto_174337 ) ) ( not ( = ?auto_174331 ?auto_174338 ) ) ( not ( = ?auto_174332 ?auto_174333 ) ) ( not ( = ?auto_174332 ?auto_174334 ) ) ( not ( = ?auto_174332 ?auto_174335 ) ) ( not ( = ?auto_174332 ?auto_174336 ) ) ( not ( = ?auto_174332 ?auto_174337 ) ) ( not ( = ?auto_174332 ?auto_174338 ) ) ( not ( = ?auto_174333 ?auto_174334 ) ) ( not ( = ?auto_174333 ?auto_174335 ) ) ( not ( = ?auto_174333 ?auto_174336 ) ) ( not ( = ?auto_174333 ?auto_174337 ) ) ( not ( = ?auto_174333 ?auto_174338 ) ) ( not ( = ?auto_174334 ?auto_174335 ) ) ( not ( = ?auto_174334 ?auto_174336 ) ) ( not ( = ?auto_174334 ?auto_174337 ) ) ( not ( = ?auto_174334 ?auto_174338 ) ) ( not ( = ?auto_174335 ?auto_174336 ) ) ( not ( = ?auto_174335 ?auto_174337 ) ) ( not ( = ?auto_174335 ?auto_174338 ) ) ( not ( = ?auto_174336 ?auto_174337 ) ) ( not ( = ?auto_174336 ?auto_174338 ) ) ( not ( = ?auto_174337 ?auto_174338 ) ) ( ON ?auto_174336 ?auto_174337 ) ( ON ?auto_174335 ?auto_174336 ) ( ON ?auto_174334 ?auto_174335 ) ( ON ?auto_174333 ?auto_174334 ) ( ON ?auto_174332 ?auto_174333 ) ( ON ?auto_174331 ?auto_174332 ) ( ON ?auto_174330 ?auto_174331 ) ( ON ?auto_174329 ?auto_174330 ) ( CLEAR ?auto_174327 ) ( ON ?auto_174328 ?auto_174329 ) ( CLEAR ?auto_174328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_174327 ?auto_174328 )
      ( MAKE-11PILE ?auto_174327 ?auto_174328 ?auto_174329 ?auto_174330 ?auto_174331 ?auto_174332 ?auto_174333 ?auto_174334 ?auto_174335 ?auto_174336 ?auto_174337 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_174350 - BLOCK
      ?auto_174351 - BLOCK
      ?auto_174352 - BLOCK
      ?auto_174353 - BLOCK
      ?auto_174354 - BLOCK
      ?auto_174355 - BLOCK
      ?auto_174356 - BLOCK
      ?auto_174357 - BLOCK
      ?auto_174358 - BLOCK
      ?auto_174359 - BLOCK
      ?auto_174360 - BLOCK
    )
    :vars
    (
      ?auto_174361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174360 ?auto_174361 ) ( ON-TABLE ?auto_174350 ) ( not ( = ?auto_174350 ?auto_174351 ) ) ( not ( = ?auto_174350 ?auto_174352 ) ) ( not ( = ?auto_174350 ?auto_174353 ) ) ( not ( = ?auto_174350 ?auto_174354 ) ) ( not ( = ?auto_174350 ?auto_174355 ) ) ( not ( = ?auto_174350 ?auto_174356 ) ) ( not ( = ?auto_174350 ?auto_174357 ) ) ( not ( = ?auto_174350 ?auto_174358 ) ) ( not ( = ?auto_174350 ?auto_174359 ) ) ( not ( = ?auto_174350 ?auto_174360 ) ) ( not ( = ?auto_174350 ?auto_174361 ) ) ( not ( = ?auto_174351 ?auto_174352 ) ) ( not ( = ?auto_174351 ?auto_174353 ) ) ( not ( = ?auto_174351 ?auto_174354 ) ) ( not ( = ?auto_174351 ?auto_174355 ) ) ( not ( = ?auto_174351 ?auto_174356 ) ) ( not ( = ?auto_174351 ?auto_174357 ) ) ( not ( = ?auto_174351 ?auto_174358 ) ) ( not ( = ?auto_174351 ?auto_174359 ) ) ( not ( = ?auto_174351 ?auto_174360 ) ) ( not ( = ?auto_174351 ?auto_174361 ) ) ( not ( = ?auto_174352 ?auto_174353 ) ) ( not ( = ?auto_174352 ?auto_174354 ) ) ( not ( = ?auto_174352 ?auto_174355 ) ) ( not ( = ?auto_174352 ?auto_174356 ) ) ( not ( = ?auto_174352 ?auto_174357 ) ) ( not ( = ?auto_174352 ?auto_174358 ) ) ( not ( = ?auto_174352 ?auto_174359 ) ) ( not ( = ?auto_174352 ?auto_174360 ) ) ( not ( = ?auto_174352 ?auto_174361 ) ) ( not ( = ?auto_174353 ?auto_174354 ) ) ( not ( = ?auto_174353 ?auto_174355 ) ) ( not ( = ?auto_174353 ?auto_174356 ) ) ( not ( = ?auto_174353 ?auto_174357 ) ) ( not ( = ?auto_174353 ?auto_174358 ) ) ( not ( = ?auto_174353 ?auto_174359 ) ) ( not ( = ?auto_174353 ?auto_174360 ) ) ( not ( = ?auto_174353 ?auto_174361 ) ) ( not ( = ?auto_174354 ?auto_174355 ) ) ( not ( = ?auto_174354 ?auto_174356 ) ) ( not ( = ?auto_174354 ?auto_174357 ) ) ( not ( = ?auto_174354 ?auto_174358 ) ) ( not ( = ?auto_174354 ?auto_174359 ) ) ( not ( = ?auto_174354 ?auto_174360 ) ) ( not ( = ?auto_174354 ?auto_174361 ) ) ( not ( = ?auto_174355 ?auto_174356 ) ) ( not ( = ?auto_174355 ?auto_174357 ) ) ( not ( = ?auto_174355 ?auto_174358 ) ) ( not ( = ?auto_174355 ?auto_174359 ) ) ( not ( = ?auto_174355 ?auto_174360 ) ) ( not ( = ?auto_174355 ?auto_174361 ) ) ( not ( = ?auto_174356 ?auto_174357 ) ) ( not ( = ?auto_174356 ?auto_174358 ) ) ( not ( = ?auto_174356 ?auto_174359 ) ) ( not ( = ?auto_174356 ?auto_174360 ) ) ( not ( = ?auto_174356 ?auto_174361 ) ) ( not ( = ?auto_174357 ?auto_174358 ) ) ( not ( = ?auto_174357 ?auto_174359 ) ) ( not ( = ?auto_174357 ?auto_174360 ) ) ( not ( = ?auto_174357 ?auto_174361 ) ) ( not ( = ?auto_174358 ?auto_174359 ) ) ( not ( = ?auto_174358 ?auto_174360 ) ) ( not ( = ?auto_174358 ?auto_174361 ) ) ( not ( = ?auto_174359 ?auto_174360 ) ) ( not ( = ?auto_174359 ?auto_174361 ) ) ( not ( = ?auto_174360 ?auto_174361 ) ) ( ON ?auto_174359 ?auto_174360 ) ( ON ?auto_174358 ?auto_174359 ) ( ON ?auto_174357 ?auto_174358 ) ( ON ?auto_174356 ?auto_174357 ) ( ON ?auto_174355 ?auto_174356 ) ( ON ?auto_174354 ?auto_174355 ) ( ON ?auto_174353 ?auto_174354 ) ( ON ?auto_174352 ?auto_174353 ) ( CLEAR ?auto_174350 ) ( ON ?auto_174351 ?auto_174352 ) ( CLEAR ?auto_174351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_174350 ?auto_174351 )
      ( MAKE-11PILE ?auto_174350 ?auto_174351 ?auto_174352 ?auto_174353 ?auto_174354 ?auto_174355 ?auto_174356 ?auto_174357 ?auto_174358 ?auto_174359 ?auto_174360 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_174373 - BLOCK
      ?auto_174374 - BLOCK
      ?auto_174375 - BLOCK
      ?auto_174376 - BLOCK
      ?auto_174377 - BLOCK
      ?auto_174378 - BLOCK
      ?auto_174379 - BLOCK
      ?auto_174380 - BLOCK
      ?auto_174381 - BLOCK
      ?auto_174382 - BLOCK
      ?auto_174383 - BLOCK
    )
    :vars
    (
      ?auto_174384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174383 ?auto_174384 ) ( not ( = ?auto_174373 ?auto_174374 ) ) ( not ( = ?auto_174373 ?auto_174375 ) ) ( not ( = ?auto_174373 ?auto_174376 ) ) ( not ( = ?auto_174373 ?auto_174377 ) ) ( not ( = ?auto_174373 ?auto_174378 ) ) ( not ( = ?auto_174373 ?auto_174379 ) ) ( not ( = ?auto_174373 ?auto_174380 ) ) ( not ( = ?auto_174373 ?auto_174381 ) ) ( not ( = ?auto_174373 ?auto_174382 ) ) ( not ( = ?auto_174373 ?auto_174383 ) ) ( not ( = ?auto_174373 ?auto_174384 ) ) ( not ( = ?auto_174374 ?auto_174375 ) ) ( not ( = ?auto_174374 ?auto_174376 ) ) ( not ( = ?auto_174374 ?auto_174377 ) ) ( not ( = ?auto_174374 ?auto_174378 ) ) ( not ( = ?auto_174374 ?auto_174379 ) ) ( not ( = ?auto_174374 ?auto_174380 ) ) ( not ( = ?auto_174374 ?auto_174381 ) ) ( not ( = ?auto_174374 ?auto_174382 ) ) ( not ( = ?auto_174374 ?auto_174383 ) ) ( not ( = ?auto_174374 ?auto_174384 ) ) ( not ( = ?auto_174375 ?auto_174376 ) ) ( not ( = ?auto_174375 ?auto_174377 ) ) ( not ( = ?auto_174375 ?auto_174378 ) ) ( not ( = ?auto_174375 ?auto_174379 ) ) ( not ( = ?auto_174375 ?auto_174380 ) ) ( not ( = ?auto_174375 ?auto_174381 ) ) ( not ( = ?auto_174375 ?auto_174382 ) ) ( not ( = ?auto_174375 ?auto_174383 ) ) ( not ( = ?auto_174375 ?auto_174384 ) ) ( not ( = ?auto_174376 ?auto_174377 ) ) ( not ( = ?auto_174376 ?auto_174378 ) ) ( not ( = ?auto_174376 ?auto_174379 ) ) ( not ( = ?auto_174376 ?auto_174380 ) ) ( not ( = ?auto_174376 ?auto_174381 ) ) ( not ( = ?auto_174376 ?auto_174382 ) ) ( not ( = ?auto_174376 ?auto_174383 ) ) ( not ( = ?auto_174376 ?auto_174384 ) ) ( not ( = ?auto_174377 ?auto_174378 ) ) ( not ( = ?auto_174377 ?auto_174379 ) ) ( not ( = ?auto_174377 ?auto_174380 ) ) ( not ( = ?auto_174377 ?auto_174381 ) ) ( not ( = ?auto_174377 ?auto_174382 ) ) ( not ( = ?auto_174377 ?auto_174383 ) ) ( not ( = ?auto_174377 ?auto_174384 ) ) ( not ( = ?auto_174378 ?auto_174379 ) ) ( not ( = ?auto_174378 ?auto_174380 ) ) ( not ( = ?auto_174378 ?auto_174381 ) ) ( not ( = ?auto_174378 ?auto_174382 ) ) ( not ( = ?auto_174378 ?auto_174383 ) ) ( not ( = ?auto_174378 ?auto_174384 ) ) ( not ( = ?auto_174379 ?auto_174380 ) ) ( not ( = ?auto_174379 ?auto_174381 ) ) ( not ( = ?auto_174379 ?auto_174382 ) ) ( not ( = ?auto_174379 ?auto_174383 ) ) ( not ( = ?auto_174379 ?auto_174384 ) ) ( not ( = ?auto_174380 ?auto_174381 ) ) ( not ( = ?auto_174380 ?auto_174382 ) ) ( not ( = ?auto_174380 ?auto_174383 ) ) ( not ( = ?auto_174380 ?auto_174384 ) ) ( not ( = ?auto_174381 ?auto_174382 ) ) ( not ( = ?auto_174381 ?auto_174383 ) ) ( not ( = ?auto_174381 ?auto_174384 ) ) ( not ( = ?auto_174382 ?auto_174383 ) ) ( not ( = ?auto_174382 ?auto_174384 ) ) ( not ( = ?auto_174383 ?auto_174384 ) ) ( ON ?auto_174382 ?auto_174383 ) ( ON ?auto_174381 ?auto_174382 ) ( ON ?auto_174380 ?auto_174381 ) ( ON ?auto_174379 ?auto_174380 ) ( ON ?auto_174378 ?auto_174379 ) ( ON ?auto_174377 ?auto_174378 ) ( ON ?auto_174376 ?auto_174377 ) ( ON ?auto_174375 ?auto_174376 ) ( ON ?auto_174374 ?auto_174375 ) ( ON ?auto_174373 ?auto_174374 ) ( CLEAR ?auto_174373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_174373 )
      ( MAKE-11PILE ?auto_174373 ?auto_174374 ?auto_174375 ?auto_174376 ?auto_174377 ?auto_174378 ?auto_174379 ?auto_174380 ?auto_174381 ?auto_174382 ?auto_174383 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_174396 - BLOCK
      ?auto_174397 - BLOCK
      ?auto_174398 - BLOCK
      ?auto_174399 - BLOCK
      ?auto_174400 - BLOCK
      ?auto_174401 - BLOCK
      ?auto_174402 - BLOCK
      ?auto_174403 - BLOCK
      ?auto_174404 - BLOCK
      ?auto_174405 - BLOCK
      ?auto_174406 - BLOCK
    )
    :vars
    (
      ?auto_174407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174406 ?auto_174407 ) ( not ( = ?auto_174396 ?auto_174397 ) ) ( not ( = ?auto_174396 ?auto_174398 ) ) ( not ( = ?auto_174396 ?auto_174399 ) ) ( not ( = ?auto_174396 ?auto_174400 ) ) ( not ( = ?auto_174396 ?auto_174401 ) ) ( not ( = ?auto_174396 ?auto_174402 ) ) ( not ( = ?auto_174396 ?auto_174403 ) ) ( not ( = ?auto_174396 ?auto_174404 ) ) ( not ( = ?auto_174396 ?auto_174405 ) ) ( not ( = ?auto_174396 ?auto_174406 ) ) ( not ( = ?auto_174396 ?auto_174407 ) ) ( not ( = ?auto_174397 ?auto_174398 ) ) ( not ( = ?auto_174397 ?auto_174399 ) ) ( not ( = ?auto_174397 ?auto_174400 ) ) ( not ( = ?auto_174397 ?auto_174401 ) ) ( not ( = ?auto_174397 ?auto_174402 ) ) ( not ( = ?auto_174397 ?auto_174403 ) ) ( not ( = ?auto_174397 ?auto_174404 ) ) ( not ( = ?auto_174397 ?auto_174405 ) ) ( not ( = ?auto_174397 ?auto_174406 ) ) ( not ( = ?auto_174397 ?auto_174407 ) ) ( not ( = ?auto_174398 ?auto_174399 ) ) ( not ( = ?auto_174398 ?auto_174400 ) ) ( not ( = ?auto_174398 ?auto_174401 ) ) ( not ( = ?auto_174398 ?auto_174402 ) ) ( not ( = ?auto_174398 ?auto_174403 ) ) ( not ( = ?auto_174398 ?auto_174404 ) ) ( not ( = ?auto_174398 ?auto_174405 ) ) ( not ( = ?auto_174398 ?auto_174406 ) ) ( not ( = ?auto_174398 ?auto_174407 ) ) ( not ( = ?auto_174399 ?auto_174400 ) ) ( not ( = ?auto_174399 ?auto_174401 ) ) ( not ( = ?auto_174399 ?auto_174402 ) ) ( not ( = ?auto_174399 ?auto_174403 ) ) ( not ( = ?auto_174399 ?auto_174404 ) ) ( not ( = ?auto_174399 ?auto_174405 ) ) ( not ( = ?auto_174399 ?auto_174406 ) ) ( not ( = ?auto_174399 ?auto_174407 ) ) ( not ( = ?auto_174400 ?auto_174401 ) ) ( not ( = ?auto_174400 ?auto_174402 ) ) ( not ( = ?auto_174400 ?auto_174403 ) ) ( not ( = ?auto_174400 ?auto_174404 ) ) ( not ( = ?auto_174400 ?auto_174405 ) ) ( not ( = ?auto_174400 ?auto_174406 ) ) ( not ( = ?auto_174400 ?auto_174407 ) ) ( not ( = ?auto_174401 ?auto_174402 ) ) ( not ( = ?auto_174401 ?auto_174403 ) ) ( not ( = ?auto_174401 ?auto_174404 ) ) ( not ( = ?auto_174401 ?auto_174405 ) ) ( not ( = ?auto_174401 ?auto_174406 ) ) ( not ( = ?auto_174401 ?auto_174407 ) ) ( not ( = ?auto_174402 ?auto_174403 ) ) ( not ( = ?auto_174402 ?auto_174404 ) ) ( not ( = ?auto_174402 ?auto_174405 ) ) ( not ( = ?auto_174402 ?auto_174406 ) ) ( not ( = ?auto_174402 ?auto_174407 ) ) ( not ( = ?auto_174403 ?auto_174404 ) ) ( not ( = ?auto_174403 ?auto_174405 ) ) ( not ( = ?auto_174403 ?auto_174406 ) ) ( not ( = ?auto_174403 ?auto_174407 ) ) ( not ( = ?auto_174404 ?auto_174405 ) ) ( not ( = ?auto_174404 ?auto_174406 ) ) ( not ( = ?auto_174404 ?auto_174407 ) ) ( not ( = ?auto_174405 ?auto_174406 ) ) ( not ( = ?auto_174405 ?auto_174407 ) ) ( not ( = ?auto_174406 ?auto_174407 ) ) ( ON ?auto_174405 ?auto_174406 ) ( ON ?auto_174404 ?auto_174405 ) ( ON ?auto_174403 ?auto_174404 ) ( ON ?auto_174402 ?auto_174403 ) ( ON ?auto_174401 ?auto_174402 ) ( ON ?auto_174400 ?auto_174401 ) ( ON ?auto_174399 ?auto_174400 ) ( ON ?auto_174398 ?auto_174399 ) ( ON ?auto_174397 ?auto_174398 ) ( ON ?auto_174396 ?auto_174397 ) ( CLEAR ?auto_174396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_174396 )
      ( MAKE-11PILE ?auto_174396 ?auto_174397 ?auto_174398 ?auto_174399 ?auto_174400 ?auto_174401 ?auto_174402 ?auto_174403 ?auto_174404 ?auto_174405 ?auto_174406 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_174420 - BLOCK
      ?auto_174421 - BLOCK
      ?auto_174422 - BLOCK
      ?auto_174423 - BLOCK
      ?auto_174424 - BLOCK
      ?auto_174425 - BLOCK
      ?auto_174426 - BLOCK
      ?auto_174427 - BLOCK
      ?auto_174428 - BLOCK
      ?auto_174429 - BLOCK
      ?auto_174430 - BLOCK
      ?auto_174431 - BLOCK
    )
    :vars
    (
      ?auto_174432 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_174430 ) ( ON ?auto_174431 ?auto_174432 ) ( CLEAR ?auto_174431 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_174420 ) ( ON ?auto_174421 ?auto_174420 ) ( ON ?auto_174422 ?auto_174421 ) ( ON ?auto_174423 ?auto_174422 ) ( ON ?auto_174424 ?auto_174423 ) ( ON ?auto_174425 ?auto_174424 ) ( ON ?auto_174426 ?auto_174425 ) ( ON ?auto_174427 ?auto_174426 ) ( ON ?auto_174428 ?auto_174427 ) ( ON ?auto_174429 ?auto_174428 ) ( ON ?auto_174430 ?auto_174429 ) ( not ( = ?auto_174420 ?auto_174421 ) ) ( not ( = ?auto_174420 ?auto_174422 ) ) ( not ( = ?auto_174420 ?auto_174423 ) ) ( not ( = ?auto_174420 ?auto_174424 ) ) ( not ( = ?auto_174420 ?auto_174425 ) ) ( not ( = ?auto_174420 ?auto_174426 ) ) ( not ( = ?auto_174420 ?auto_174427 ) ) ( not ( = ?auto_174420 ?auto_174428 ) ) ( not ( = ?auto_174420 ?auto_174429 ) ) ( not ( = ?auto_174420 ?auto_174430 ) ) ( not ( = ?auto_174420 ?auto_174431 ) ) ( not ( = ?auto_174420 ?auto_174432 ) ) ( not ( = ?auto_174421 ?auto_174422 ) ) ( not ( = ?auto_174421 ?auto_174423 ) ) ( not ( = ?auto_174421 ?auto_174424 ) ) ( not ( = ?auto_174421 ?auto_174425 ) ) ( not ( = ?auto_174421 ?auto_174426 ) ) ( not ( = ?auto_174421 ?auto_174427 ) ) ( not ( = ?auto_174421 ?auto_174428 ) ) ( not ( = ?auto_174421 ?auto_174429 ) ) ( not ( = ?auto_174421 ?auto_174430 ) ) ( not ( = ?auto_174421 ?auto_174431 ) ) ( not ( = ?auto_174421 ?auto_174432 ) ) ( not ( = ?auto_174422 ?auto_174423 ) ) ( not ( = ?auto_174422 ?auto_174424 ) ) ( not ( = ?auto_174422 ?auto_174425 ) ) ( not ( = ?auto_174422 ?auto_174426 ) ) ( not ( = ?auto_174422 ?auto_174427 ) ) ( not ( = ?auto_174422 ?auto_174428 ) ) ( not ( = ?auto_174422 ?auto_174429 ) ) ( not ( = ?auto_174422 ?auto_174430 ) ) ( not ( = ?auto_174422 ?auto_174431 ) ) ( not ( = ?auto_174422 ?auto_174432 ) ) ( not ( = ?auto_174423 ?auto_174424 ) ) ( not ( = ?auto_174423 ?auto_174425 ) ) ( not ( = ?auto_174423 ?auto_174426 ) ) ( not ( = ?auto_174423 ?auto_174427 ) ) ( not ( = ?auto_174423 ?auto_174428 ) ) ( not ( = ?auto_174423 ?auto_174429 ) ) ( not ( = ?auto_174423 ?auto_174430 ) ) ( not ( = ?auto_174423 ?auto_174431 ) ) ( not ( = ?auto_174423 ?auto_174432 ) ) ( not ( = ?auto_174424 ?auto_174425 ) ) ( not ( = ?auto_174424 ?auto_174426 ) ) ( not ( = ?auto_174424 ?auto_174427 ) ) ( not ( = ?auto_174424 ?auto_174428 ) ) ( not ( = ?auto_174424 ?auto_174429 ) ) ( not ( = ?auto_174424 ?auto_174430 ) ) ( not ( = ?auto_174424 ?auto_174431 ) ) ( not ( = ?auto_174424 ?auto_174432 ) ) ( not ( = ?auto_174425 ?auto_174426 ) ) ( not ( = ?auto_174425 ?auto_174427 ) ) ( not ( = ?auto_174425 ?auto_174428 ) ) ( not ( = ?auto_174425 ?auto_174429 ) ) ( not ( = ?auto_174425 ?auto_174430 ) ) ( not ( = ?auto_174425 ?auto_174431 ) ) ( not ( = ?auto_174425 ?auto_174432 ) ) ( not ( = ?auto_174426 ?auto_174427 ) ) ( not ( = ?auto_174426 ?auto_174428 ) ) ( not ( = ?auto_174426 ?auto_174429 ) ) ( not ( = ?auto_174426 ?auto_174430 ) ) ( not ( = ?auto_174426 ?auto_174431 ) ) ( not ( = ?auto_174426 ?auto_174432 ) ) ( not ( = ?auto_174427 ?auto_174428 ) ) ( not ( = ?auto_174427 ?auto_174429 ) ) ( not ( = ?auto_174427 ?auto_174430 ) ) ( not ( = ?auto_174427 ?auto_174431 ) ) ( not ( = ?auto_174427 ?auto_174432 ) ) ( not ( = ?auto_174428 ?auto_174429 ) ) ( not ( = ?auto_174428 ?auto_174430 ) ) ( not ( = ?auto_174428 ?auto_174431 ) ) ( not ( = ?auto_174428 ?auto_174432 ) ) ( not ( = ?auto_174429 ?auto_174430 ) ) ( not ( = ?auto_174429 ?auto_174431 ) ) ( not ( = ?auto_174429 ?auto_174432 ) ) ( not ( = ?auto_174430 ?auto_174431 ) ) ( not ( = ?auto_174430 ?auto_174432 ) ) ( not ( = ?auto_174431 ?auto_174432 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_174431 ?auto_174432 )
      ( !STACK ?auto_174431 ?auto_174430 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_174445 - BLOCK
      ?auto_174446 - BLOCK
      ?auto_174447 - BLOCK
      ?auto_174448 - BLOCK
      ?auto_174449 - BLOCK
      ?auto_174450 - BLOCK
      ?auto_174451 - BLOCK
      ?auto_174452 - BLOCK
      ?auto_174453 - BLOCK
      ?auto_174454 - BLOCK
      ?auto_174455 - BLOCK
      ?auto_174456 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_174455 ) ( ON-TABLE ?auto_174456 ) ( CLEAR ?auto_174456 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_174445 ) ( ON ?auto_174446 ?auto_174445 ) ( ON ?auto_174447 ?auto_174446 ) ( ON ?auto_174448 ?auto_174447 ) ( ON ?auto_174449 ?auto_174448 ) ( ON ?auto_174450 ?auto_174449 ) ( ON ?auto_174451 ?auto_174450 ) ( ON ?auto_174452 ?auto_174451 ) ( ON ?auto_174453 ?auto_174452 ) ( ON ?auto_174454 ?auto_174453 ) ( ON ?auto_174455 ?auto_174454 ) ( not ( = ?auto_174445 ?auto_174446 ) ) ( not ( = ?auto_174445 ?auto_174447 ) ) ( not ( = ?auto_174445 ?auto_174448 ) ) ( not ( = ?auto_174445 ?auto_174449 ) ) ( not ( = ?auto_174445 ?auto_174450 ) ) ( not ( = ?auto_174445 ?auto_174451 ) ) ( not ( = ?auto_174445 ?auto_174452 ) ) ( not ( = ?auto_174445 ?auto_174453 ) ) ( not ( = ?auto_174445 ?auto_174454 ) ) ( not ( = ?auto_174445 ?auto_174455 ) ) ( not ( = ?auto_174445 ?auto_174456 ) ) ( not ( = ?auto_174446 ?auto_174447 ) ) ( not ( = ?auto_174446 ?auto_174448 ) ) ( not ( = ?auto_174446 ?auto_174449 ) ) ( not ( = ?auto_174446 ?auto_174450 ) ) ( not ( = ?auto_174446 ?auto_174451 ) ) ( not ( = ?auto_174446 ?auto_174452 ) ) ( not ( = ?auto_174446 ?auto_174453 ) ) ( not ( = ?auto_174446 ?auto_174454 ) ) ( not ( = ?auto_174446 ?auto_174455 ) ) ( not ( = ?auto_174446 ?auto_174456 ) ) ( not ( = ?auto_174447 ?auto_174448 ) ) ( not ( = ?auto_174447 ?auto_174449 ) ) ( not ( = ?auto_174447 ?auto_174450 ) ) ( not ( = ?auto_174447 ?auto_174451 ) ) ( not ( = ?auto_174447 ?auto_174452 ) ) ( not ( = ?auto_174447 ?auto_174453 ) ) ( not ( = ?auto_174447 ?auto_174454 ) ) ( not ( = ?auto_174447 ?auto_174455 ) ) ( not ( = ?auto_174447 ?auto_174456 ) ) ( not ( = ?auto_174448 ?auto_174449 ) ) ( not ( = ?auto_174448 ?auto_174450 ) ) ( not ( = ?auto_174448 ?auto_174451 ) ) ( not ( = ?auto_174448 ?auto_174452 ) ) ( not ( = ?auto_174448 ?auto_174453 ) ) ( not ( = ?auto_174448 ?auto_174454 ) ) ( not ( = ?auto_174448 ?auto_174455 ) ) ( not ( = ?auto_174448 ?auto_174456 ) ) ( not ( = ?auto_174449 ?auto_174450 ) ) ( not ( = ?auto_174449 ?auto_174451 ) ) ( not ( = ?auto_174449 ?auto_174452 ) ) ( not ( = ?auto_174449 ?auto_174453 ) ) ( not ( = ?auto_174449 ?auto_174454 ) ) ( not ( = ?auto_174449 ?auto_174455 ) ) ( not ( = ?auto_174449 ?auto_174456 ) ) ( not ( = ?auto_174450 ?auto_174451 ) ) ( not ( = ?auto_174450 ?auto_174452 ) ) ( not ( = ?auto_174450 ?auto_174453 ) ) ( not ( = ?auto_174450 ?auto_174454 ) ) ( not ( = ?auto_174450 ?auto_174455 ) ) ( not ( = ?auto_174450 ?auto_174456 ) ) ( not ( = ?auto_174451 ?auto_174452 ) ) ( not ( = ?auto_174451 ?auto_174453 ) ) ( not ( = ?auto_174451 ?auto_174454 ) ) ( not ( = ?auto_174451 ?auto_174455 ) ) ( not ( = ?auto_174451 ?auto_174456 ) ) ( not ( = ?auto_174452 ?auto_174453 ) ) ( not ( = ?auto_174452 ?auto_174454 ) ) ( not ( = ?auto_174452 ?auto_174455 ) ) ( not ( = ?auto_174452 ?auto_174456 ) ) ( not ( = ?auto_174453 ?auto_174454 ) ) ( not ( = ?auto_174453 ?auto_174455 ) ) ( not ( = ?auto_174453 ?auto_174456 ) ) ( not ( = ?auto_174454 ?auto_174455 ) ) ( not ( = ?auto_174454 ?auto_174456 ) ) ( not ( = ?auto_174455 ?auto_174456 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_174456 )
      ( !STACK ?auto_174456 ?auto_174455 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_174469 - BLOCK
      ?auto_174470 - BLOCK
      ?auto_174471 - BLOCK
      ?auto_174472 - BLOCK
      ?auto_174473 - BLOCK
      ?auto_174474 - BLOCK
      ?auto_174475 - BLOCK
      ?auto_174476 - BLOCK
      ?auto_174477 - BLOCK
      ?auto_174478 - BLOCK
      ?auto_174479 - BLOCK
      ?auto_174480 - BLOCK
    )
    :vars
    (
      ?auto_174481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174480 ?auto_174481 ) ( ON-TABLE ?auto_174469 ) ( ON ?auto_174470 ?auto_174469 ) ( ON ?auto_174471 ?auto_174470 ) ( ON ?auto_174472 ?auto_174471 ) ( ON ?auto_174473 ?auto_174472 ) ( ON ?auto_174474 ?auto_174473 ) ( ON ?auto_174475 ?auto_174474 ) ( ON ?auto_174476 ?auto_174475 ) ( ON ?auto_174477 ?auto_174476 ) ( ON ?auto_174478 ?auto_174477 ) ( not ( = ?auto_174469 ?auto_174470 ) ) ( not ( = ?auto_174469 ?auto_174471 ) ) ( not ( = ?auto_174469 ?auto_174472 ) ) ( not ( = ?auto_174469 ?auto_174473 ) ) ( not ( = ?auto_174469 ?auto_174474 ) ) ( not ( = ?auto_174469 ?auto_174475 ) ) ( not ( = ?auto_174469 ?auto_174476 ) ) ( not ( = ?auto_174469 ?auto_174477 ) ) ( not ( = ?auto_174469 ?auto_174478 ) ) ( not ( = ?auto_174469 ?auto_174479 ) ) ( not ( = ?auto_174469 ?auto_174480 ) ) ( not ( = ?auto_174469 ?auto_174481 ) ) ( not ( = ?auto_174470 ?auto_174471 ) ) ( not ( = ?auto_174470 ?auto_174472 ) ) ( not ( = ?auto_174470 ?auto_174473 ) ) ( not ( = ?auto_174470 ?auto_174474 ) ) ( not ( = ?auto_174470 ?auto_174475 ) ) ( not ( = ?auto_174470 ?auto_174476 ) ) ( not ( = ?auto_174470 ?auto_174477 ) ) ( not ( = ?auto_174470 ?auto_174478 ) ) ( not ( = ?auto_174470 ?auto_174479 ) ) ( not ( = ?auto_174470 ?auto_174480 ) ) ( not ( = ?auto_174470 ?auto_174481 ) ) ( not ( = ?auto_174471 ?auto_174472 ) ) ( not ( = ?auto_174471 ?auto_174473 ) ) ( not ( = ?auto_174471 ?auto_174474 ) ) ( not ( = ?auto_174471 ?auto_174475 ) ) ( not ( = ?auto_174471 ?auto_174476 ) ) ( not ( = ?auto_174471 ?auto_174477 ) ) ( not ( = ?auto_174471 ?auto_174478 ) ) ( not ( = ?auto_174471 ?auto_174479 ) ) ( not ( = ?auto_174471 ?auto_174480 ) ) ( not ( = ?auto_174471 ?auto_174481 ) ) ( not ( = ?auto_174472 ?auto_174473 ) ) ( not ( = ?auto_174472 ?auto_174474 ) ) ( not ( = ?auto_174472 ?auto_174475 ) ) ( not ( = ?auto_174472 ?auto_174476 ) ) ( not ( = ?auto_174472 ?auto_174477 ) ) ( not ( = ?auto_174472 ?auto_174478 ) ) ( not ( = ?auto_174472 ?auto_174479 ) ) ( not ( = ?auto_174472 ?auto_174480 ) ) ( not ( = ?auto_174472 ?auto_174481 ) ) ( not ( = ?auto_174473 ?auto_174474 ) ) ( not ( = ?auto_174473 ?auto_174475 ) ) ( not ( = ?auto_174473 ?auto_174476 ) ) ( not ( = ?auto_174473 ?auto_174477 ) ) ( not ( = ?auto_174473 ?auto_174478 ) ) ( not ( = ?auto_174473 ?auto_174479 ) ) ( not ( = ?auto_174473 ?auto_174480 ) ) ( not ( = ?auto_174473 ?auto_174481 ) ) ( not ( = ?auto_174474 ?auto_174475 ) ) ( not ( = ?auto_174474 ?auto_174476 ) ) ( not ( = ?auto_174474 ?auto_174477 ) ) ( not ( = ?auto_174474 ?auto_174478 ) ) ( not ( = ?auto_174474 ?auto_174479 ) ) ( not ( = ?auto_174474 ?auto_174480 ) ) ( not ( = ?auto_174474 ?auto_174481 ) ) ( not ( = ?auto_174475 ?auto_174476 ) ) ( not ( = ?auto_174475 ?auto_174477 ) ) ( not ( = ?auto_174475 ?auto_174478 ) ) ( not ( = ?auto_174475 ?auto_174479 ) ) ( not ( = ?auto_174475 ?auto_174480 ) ) ( not ( = ?auto_174475 ?auto_174481 ) ) ( not ( = ?auto_174476 ?auto_174477 ) ) ( not ( = ?auto_174476 ?auto_174478 ) ) ( not ( = ?auto_174476 ?auto_174479 ) ) ( not ( = ?auto_174476 ?auto_174480 ) ) ( not ( = ?auto_174476 ?auto_174481 ) ) ( not ( = ?auto_174477 ?auto_174478 ) ) ( not ( = ?auto_174477 ?auto_174479 ) ) ( not ( = ?auto_174477 ?auto_174480 ) ) ( not ( = ?auto_174477 ?auto_174481 ) ) ( not ( = ?auto_174478 ?auto_174479 ) ) ( not ( = ?auto_174478 ?auto_174480 ) ) ( not ( = ?auto_174478 ?auto_174481 ) ) ( not ( = ?auto_174479 ?auto_174480 ) ) ( not ( = ?auto_174479 ?auto_174481 ) ) ( not ( = ?auto_174480 ?auto_174481 ) ) ( CLEAR ?auto_174478 ) ( ON ?auto_174479 ?auto_174480 ) ( CLEAR ?auto_174479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_174469 ?auto_174470 ?auto_174471 ?auto_174472 ?auto_174473 ?auto_174474 ?auto_174475 ?auto_174476 ?auto_174477 ?auto_174478 ?auto_174479 )
      ( MAKE-12PILE ?auto_174469 ?auto_174470 ?auto_174471 ?auto_174472 ?auto_174473 ?auto_174474 ?auto_174475 ?auto_174476 ?auto_174477 ?auto_174478 ?auto_174479 ?auto_174480 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_174494 - BLOCK
      ?auto_174495 - BLOCK
      ?auto_174496 - BLOCK
      ?auto_174497 - BLOCK
      ?auto_174498 - BLOCK
      ?auto_174499 - BLOCK
      ?auto_174500 - BLOCK
      ?auto_174501 - BLOCK
      ?auto_174502 - BLOCK
      ?auto_174503 - BLOCK
      ?auto_174504 - BLOCK
      ?auto_174505 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174505 ) ( ON-TABLE ?auto_174494 ) ( ON ?auto_174495 ?auto_174494 ) ( ON ?auto_174496 ?auto_174495 ) ( ON ?auto_174497 ?auto_174496 ) ( ON ?auto_174498 ?auto_174497 ) ( ON ?auto_174499 ?auto_174498 ) ( ON ?auto_174500 ?auto_174499 ) ( ON ?auto_174501 ?auto_174500 ) ( ON ?auto_174502 ?auto_174501 ) ( ON ?auto_174503 ?auto_174502 ) ( not ( = ?auto_174494 ?auto_174495 ) ) ( not ( = ?auto_174494 ?auto_174496 ) ) ( not ( = ?auto_174494 ?auto_174497 ) ) ( not ( = ?auto_174494 ?auto_174498 ) ) ( not ( = ?auto_174494 ?auto_174499 ) ) ( not ( = ?auto_174494 ?auto_174500 ) ) ( not ( = ?auto_174494 ?auto_174501 ) ) ( not ( = ?auto_174494 ?auto_174502 ) ) ( not ( = ?auto_174494 ?auto_174503 ) ) ( not ( = ?auto_174494 ?auto_174504 ) ) ( not ( = ?auto_174494 ?auto_174505 ) ) ( not ( = ?auto_174495 ?auto_174496 ) ) ( not ( = ?auto_174495 ?auto_174497 ) ) ( not ( = ?auto_174495 ?auto_174498 ) ) ( not ( = ?auto_174495 ?auto_174499 ) ) ( not ( = ?auto_174495 ?auto_174500 ) ) ( not ( = ?auto_174495 ?auto_174501 ) ) ( not ( = ?auto_174495 ?auto_174502 ) ) ( not ( = ?auto_174495 ?auto_174503 ) ) ( not ( = ?auto_174495 ?auto_174504 ) ) ( not ( = ?auto_174495 ?auto_174505 ) ) ( not ( = ?auto_174496 ?auto_174497 ) ) ( not ( = ?auto_174496 ?auto_174498 ) ) ( not ( = ?auto_174496 ?auto_174499 ) ) ( not ( = ?auto_174496 ?auto_174500 ) ) ( not ( = ?auto_174496 ?auto_174501 ) ) ( not ( = ?auto_174496 ?auto_174502 ) ) ( not ( = ?auto_174496 ?auto_174503 ) ) ( not ( = ?auto_174496 ?auto_174504 ) ) ( not ( = ?auto_174496 ?auto_174505 ) ) ( not ( = ?auto_174497 ?auto_174498 ) ) ( not ( = ?auto_174497 ?auto_174499 ) ) ( not ( = ?auto_174497 ?auto_174500 ) ) ( not ( = ?auto_174497 ?auto_174501 ) ) ( not ( = ?auto_174497 ?auto_174502 ) ) ( not ( = ?auto_174497 ?auto_174503 ) ) ( not ( = ?auto_174497 ?auto_174504 ) ) ( not ( = ?auto_174497 ?auto_174505 ) ) ( not ( = ?auto_174498 ?auto_174499 ) ) ( not ( = ?auto_174498 ?auto_174500 ) ) ( not ( = ?auto_174498 ?auto_174501 ) ) ( not ( = ?auto_174498 ?auto_174502 ) ) ( not ( = ?auto_174498 ?auto_174503 ) ) ( not ( = ?auto_174498 ?auto_174504 ) ) ( not ( = ?auto_174498 ?auto_174505 ) ) ( not ( = ?auto_174499 ?auto_174500 ) ) ( not ( = ?auto_174499 ?auto_174501 ) ) ( not ( = ?auto_174499 ?auto_174502 ) ) ( not ( = ?auto_174499 ?auto_174503 ) ) ( not ( = ?auto_174499 ?auto_174504 ) ) ( not ( = ?auto_174499 ?auto_174505 ) ) ( not ( = ?auto_174500 ?auto_174501 ) ) ( not ( = ?auto_174500 ?auto_174502 ) ) ( not ( = ?auto_174500 ?auto_174503 ) ) ( not ( = ?auto_174500 ?auto_174504 ) ) ( not ( = ?auto_174500 ?auto_174505 ) ) ( not ( = ?auto_174501 ?auto_174502 ) ) ( not ( = ?auto_174501 ?auto_174503 ) ) ( not ( = ?auto_174501 ?auto_174504 ) ) ( not ( = ?auto_174501 ?auto_174505 ) ) ( not ( = ?auto_174502 ?auto_174503 ) ) ( not ( = ?auto_174502 ?auto_174504 ) ) ( not ( = ?auto_174502 ?auto_174505 ) ) ( not ( = ?auto_174503 ?auto_174504 ) ) ( not ( = ?auto_174503 ?auto_174505 ) ) ( not ( = ?auto_174504 ?auto_174505 ) ) ( CLEAR ?auto_174503 ) ( ON ?auto_174504 ?auto_174505 ) ( CLEAR ?auto_174504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_174494 ?auto_174495 ?auto_174496 ?auto_174497 ?auto_174498 ?auto_174499 ?auto_174500 ?auto_174501 ?auto_174502 ?auto_174503 ?auto_174504 )
      ( MAKE-12PILE ?auto_174494 ?auto_174495 ?auto_174496 ?auto_174497 ?auto_174498 ?auto_174499 ?auto_174500 ?auto_174501 ?auto_174502 ?auto_174503 ?auto_174504 ?auto_174505 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_174518 - BLOCK
      ?auto_174519 - BLOCK
      ?auto_174520 - BLOCK
      ?auto_174521 - BLOCK
      ?auto_174522 - BLOCK
      ?auto_174523 - BLOCK
      ?auto_174524 - BLOCK
      ?auto_174525 - BLOCK
      ?auto_174526 - BLOCK
      ?auto_174527 - BLOCK
      ?auto_174528 - BLOCK
      ?auto_174529 - BLOCK
    )
    :vars
    (
      ?auto_174530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174529 ?auto_174530 ) ( ON-TABLE ?auto_174518 ) ( ON ?auto_174519 ?auto_174518 ) ( ON ?auto_174520 ?auto_174519 ) ( ON ?auto_174521 ?auto_174520 ) ( ON ?auto_174522 ?auto_174521 ) ( ON ?auto_174523 ?auto_174522 ) ( ON ?auto_174524 ?auto_174523 ) ( ON ?auto_174525 ?auto_174524 ) ( ON ?auto_174526 ?auto_174525 ) ( not ( = ?auto_174518 ?auto_174519 ) ) ( not ( = ?auto_174518 ?auto_174520 ) ) ( not ( = ?auto_174518 ?auto_174521 ) ) ( not ( = ?auto_174518 ?auto_174522 ) ) ( not ( = ?auto_174518 ?auto_174523 ) ) ( not ( = ?auto_174518 ?auto_174524 ) ) ( not ( = ?auto_174518 ?auto_174525 ) ) ( not ( = ?auto_174518 ?auto_174526 ) ) ( not ( = ?auto_174518 ?auto_174527 ) ) ( not ( = ?auto_174518 ?auto_174528 ) ) ( not ( = ?auto_174518 ?auto_174529 ) ) ( not ( = ?auto_174518 ?auto_174530 ) ) ( not ( = ?auto_174519 ?auto_174520 ) ) ( not ( = ?auto_174519 ?auto_174521 ) ) ( not ( = ?auto_174519 ?auto_174522 ) ) ( not ( = ?auto_174519 ?auto_174523 ) ) ( not ( = ?auto_174519 ?auto_174524 ) ) ( not ( = ?auto_174519 ?auto_174525 ) ) ( not ( = ?auto_174519 ?auto_174526 ) ) ( not ( = ?auto_174519 ?auto_174527 ) ) ( not ( = ?auto_174519 ?auto_174528 ) ) ( not ( = ?auto_174519 ?auto_174529 ) ) ( not ( = ?auto_174519 ?auto_174530 ) ) ( not ( = ?auto_174520 ?auto_174521 ) ) ( not ( = ?auto_174520 ?auto_174522 ) ) ( not ( = ?auto_174520 ?auto_174523 ) ) ( not ( = ?auto_174520 ?auto_174524 ) ) ( not ( = ?auto_174520 ?auto_174525 ) ) ( not ( = ?auto_174520 ?auto_174526 ) ) ( not ( = ?auto_174520 ?auto_174527 ) ) ( not ( = ?auto_174520 ?auto_174528 ) ) ( not ( = ?auto_174520 ?auto_174529 ) ) ( not ( = ?auto_174520 ?auto_174530 ) ) ( not ( = ?auto_174521 ?auto_174522 ) ) ( not ( = ?auto_174521 ?auto_174523 ) ) ( not ( = ?auto_174521 ?auto_174524 ) ) ( not ( = ?auto_174521 ?auto_174525 ) ) ( not ( = ?auto_174521 ?auto_174526 ) ) ( not ( = ?auto_174521 ?auto_174527 ) ) ( not ( = ?auto_174521 ?auto_174528 ) ) ( not ( = ?auto_174521 ?auto_174529 ) ) ( not ( = ?auto_174521 ?auto_174530 ) ) ( not ( = ?auto_174522 ?auto_174523 ) ) ( not ( = ?auto_174522 ?auto_174524 ) ) ( not ( = ?auto_174522 ?auto_174525 ) ) ( not ( = ?auto_174522 ?auto_174526 ) ) ( not ( = ?auto_174522 ?auto_174527 ) ) ( not ( = ?auto_174522 ?auto_174528 ) ) ( not ( = ?auto_174522 ?auto_174529 ) ) ( not ( = ?auto_174522 ?auto_174530 ) ) ( not ( = ?auto_174523 ?auto_174524 ) ) ( not ( = ?auto_174523 ?auto_174525 ) ) ( not ( = ?auto_174523 ?auto_174526 ) ) ( not ( = ?auto_174523 ?auto_174527 ) ) ( not ( = ?auto_174523 ?auto_174528 ) ) ( not ( = ?auto_174523 ?auto_174529 ) ) ( not ( = ?auto_174523 ?auto_174530 ) ) ( not ( = ?auto_174524 ?auto_174525 ) ) ( not ( = ?auto_174524 ?auto_174526 ) ) ( not ( = ?auto_174524 ?auto_174527 ) ) ( not ( = ?auto_174524 ?auto_174528 ) ) ( not ( = ?auto_174524 ?auto_174529 ) ) ( not ( = ?auto_174524 ?auto_174530 ) ) ( not ( = ?auto_174525 ?auto_174526 ) ) ( not ( = ?auto_174525 ?auto_174527 ) ) ( not ( = ?auto_174525 ?auto_174528 ) ) ( not ( = ?auto_174525 ?auto_174529 ) ) ( not ( = ?auto_174525 ?auto_174530 ) ) ( not ( = ?auto_174526 ?auto_174527 ) ) ( not ( = ?auto_174526 ?auto_174528 ) ) ( not ( = ?auto_174526 ?auto_174529 ) ) ( not ( = ?auto_174526 ?auto_174530 ) ) ( not ( = ?auto_174527 ?auto_174528 ) ) ( not ( = ?auto_174527 ?auto_174529 ) ) ( not ( = ?auto_174527 ?auto_174530 ) ) ( not ( = ?auto_174528 ?auto_174529 ) ) ( not ( = ?auto_174528 ?auto_174530 ) ) ( not ( = ?auto_174529 ?auto_174530 ) ) ( ON ?auto_174528 ?auto_174529 ) ( CLEAR ?auto_174526 ) ( ON ?auto_174527 ?auto_174528 ) ( CLEAR ?auto_174527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_174518 ?auto_174519 ?auto_174520 ?auto_174521 ?auto_174522 ?auto_174523 ?auto_174524 ?auto_174525 ?auto_174526 ?auto_174527 )
      ( MAKE-12PILE ?auto_174518 ?auto_174519 ?auto_174520 ?auto_174521 ?auto_174522 ?auto_174523 ?auto_174524 ?auto_174525 ?auto_174526 ?auto_174527 ?auto_174528 ?auto_174529 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_174543 - BLOCK
      ?auto_174544 - BLOCK
      ?auto_174545 - BLOCK
      ?auto_174546 - BLOCK
      ?auto_174547 - BLOCK
      ?auto_174548 - BLOCK
      ?auto_174549 - BLOCK
      ?auto_174550 - BLOCK
      ?auto_174551 - BLOCK
      ?auto_174552 - BLOCK
      ?auto_174553 - BLOCK
      ?auto_174554 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174554 ) ( ON-TABLE ?auto_174543 ) ( ON ?auto_174544 ?auto_174543 ) ( ON ?auto_174545 ?auto_174544 ) ( ON ?auto_174546 ?auto_174545 ) ( ON ?auto_174547 ?auto_174546 ) ( ON ?auto_174548 ?auto_174547 ) ( ON ?auto_174549 ?auto_174548 ) ( ON ?auto_174550 ?auto_174549 ) ( ON ?auto_174551 ?auto_174550 ) ( not ( = ?auto_174543 ?auto_174544 ) ) ( not ( = ?auto_174543 ?auto_174545 ) ) ( not ( = ?auto_174543 ?auto_174546 ) ) ( not ( = ?auto_174543 ?auto_174547 ) ) ( not ( = ?auto_174543 ?auto_174548 ) ) ( not ( = ?auto_174543 ?auto_174549 ) ) ( not ( = ?auto_174543 ?auto_174550 ) ) ( not ( = ?auto_174543 ?auto_174551 ) ) ( not ( = ?auto_174543 ?auto_174552 ) ) ( not ( = ?auto_174543 ?auto_174553 ) ) ( not ( = ?auto_174543 ?auto_174554 ) ) ( not ( = ?auto_174544 ?auto_174545 ) ) ( not ( = ?auto_174544 ?auto_174546 ) ) ( not ( = ?auto_174544 ?auto_174547 ) ) ( not ( = ?auto_174544 ?auto_174548 ) ) ( not ( = ?auto_174544 ?auto_174549 ) ) ( not ( = ?auto_174544 ?auto_174550 ) ) ( not ( = ?auto_174544 ?auto_174551 ) ) ( not ( = ?auto_174544 ?auto_174552 ) ) ( not ( = ?auto_174544 ?auto_174553 ) ) ( not ( = ?auto_174544 ?auto_174554 ) ) ( not ( = ?auto_174545 ?auto_174546 ) ) ( not ( = ?auto_174545 ?auto_174547 ) ) ( not ( = ?auto_174545 ?auto_174548 ) ) ( not ( = ?auto_174545 ?auto_174549 ) ) ( not ( = ?auto_174545 ?auto_174550 ) ) ( not ( = ?auto_174545 ?auto_174551 ) ) ( not ( = ?auto_174545 ?auto_174552 ) ) ( not ( = ?auto_174545 ?auto_174553 ) ) ( not ( = ?auto_174545 ?auto_174554 ) ) ( not ( = ?auto_174546 ?auto_174547 ) ) ( not ( = ?auto_174546 ?auto_174548 ) ) ( not ( = ?auto_174546 ?auto_174549 ) ) ( not ( = ?auto_174546 ?auto_174550 ) ) ( not ( = ?auto_174546 ?auto_174551 ) ) ( not ( = ?auto_174546 ?auto_174552 ) ) ( not ( = ?auto_174546 ?auto_174553 ) ) ( not ( = ?auto_174546 ?auto_174554 ) ) ( not ( = ?auto_174547 ?auto_174548 ) ) ( not ( = ?auto_174547 ?auto_174549 ) ) ( not ( = ?auto_174547 ?auto_174550 ) ) ( not ( = ?auto_174547 ?auto_174551 ) ) ( not ( = ?auto_174547 ?auto_174552 ) ) ( not ( = ?auto_174547 ?auto_174553 ) ) ( not ( = ?auto_174547 ?auto_174554 ) ) ( not ( = ?auto_174548 ?auto_174549 ) ) ( not ( = ?auto_174548 ?auto_174550 ) ) ( not ( = ?auto_174548 ?auto_174551 ) ) ( not ( = ?auto_174548 ?auto_174552 ) ) ( not ( = ?auto_174548 ?auto_174553 ) ) ( not ( = ?auto_174548 ?auto_174554 ) ) ( not ( = ?auto_174549 ?auto_174550 ) ) ( not ( = ?auto_174549 ?auto_174551 ) ) ( not ( = ?auto_174549 ?auto_174552 ) ) ( not ( = ?auto_174549 ?auto_174553 ) ) ( not ( = ?auto_174549 ?auto_174554 ) ) ( not ( = ?auto_174550 ?auto_174551 ) ) ( not ( = ?auto_174550 ?auto_174552 ) ) ( not ( = ?auto_174550 ?auto_174553 ) ) ( not ( = ?auto_174550 ?auto_174554 ) ) ( not ( = ?auto_174551 ?auto_174552 ) ) ( not ( = ?auto_174551 ?auto_174553 ) ) ( not ( = ?auto_174551 ?auto_174554 ) ) ( not ( = ?auto_174552 ?auto_174553 ) ) ( not ( = ?auto_174552 ?auto_174554 ) ) ( not ( = ?auto_174553 ?auto_174554 ) ) ( ON ?auto_174553 ?auto_174554 ) ( CLEAR ?auto_174551 ) ( ON ?auto_174552 ?auto_174553 ) ( CLEAR ?auto_174552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_174543 ?auto_174544 ?auto_174545 ?auto_174546 ?auto_174547 ?auto_174548 ?auto_174549 ?auto_174550 ?auto_174551 ?auto_174552 )
      ( MAKE-12PILE ?auto_174543 ?auto_174544 ?auto_174545 ?auto_174546 ?auto_174547 ?auto_174548 ?auto_174549 ?auto_174550 ?auto_174551 ?auto_174552 ?auto_174553 ?auto_174554 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_174567 - BLOCK
      ?auto_174568 - BLOCK
      ?auto_174569 - BLOCK
      ?auto_174570 - BLOCK
      ?auto_174571 - BLOCK
      ?auto_174572 - BLOCK
      ?auto_174573 - BLOCK
      ?auto_174574 - BLOCK
      ?auto_174575 - BLOCK
      ?auto_174576 - BLOCK
      ?auto_174577 - BLOCK
      ?auto_174578 - BLOCK
    )
    :vars
    (
      ?auto_174579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174578 ?auto_174579 ) ( ON-TABLE ?auto_174567 ) ( ON ?auto_174568 ?auto_174567 ) ( ON ?auto_174569 ?auto_174568 ) ( ON ?auto_174570 ?auto_174569 ) ( ON ?auto_174571 ?auto_174570 ) ( ON ?auto_174572 ?auto_174571 ) ( ON ?auto_174573 ?auto_174572 ) ( ON ?auto_174574 ?auto_174573 ) ( not ( = ?auto_174567 ?auto_174568 ) ) ( not ( = ?auto_174567 ?auto_174569 ) ) ( not ( = ?auto_174567 ?auto_174570 ) ) ( not ( = ?auto_174567 ?auto_174571 ) ) ( not ( = ?auto_174567 ?auto_174572 ) ) ( not ( = ?auto_174567 ?auto_174573 ) ) ( not ( = ?auto_174567 ?auto_174574 ) ) ( not ( = ?auto_174567 ?auto_174575 ) ) ( not ( = ?auto_174567 ?auto_174576 ) ) ( not ( = ?auto_174567 ?auto_174577 ) ) ( not ( = ?auto_174567 ?auto_174578 ) ) ( not ( = ?auto_174567 ?auto_174579 ) ) ( not ( = ?auto_174568 ?auto_174569 ) ) ( not ( = ?auto_174568 ?auto_174570 ) ) ( not ( = ?auto_174568 ?auto_174571 ) ) ( not ( = ?auto_174568 ?auto_174572 ) ) ( not ( = ?auto_174568 ?auto_174573 ) ) ( not ( = ?auto_174568 ?auto_174574 ) ) ( not ( = ?auto_174568 ?auto_174575 ) ) ( not ( = ?auto_174568 ?auto_174576 ) ) ( not ( = ?auto_174568 ?auto_174577 ) ) ( not ( = ?auto_174568 ?auto_174578 ) ) ( not ( = ?auto_174568 ?auto_174579 ) ) ( not ( = ?auto_174569 ?auto_174570 ) ) ( not ( = ?auto_174569 ?auto_174571 ) ) ( not ( = ?auto_174569 ?auto_174572 ) ) ( not ( = ?auto_174569 ?auto_174573 ) ) ( not ( = ?auto_174569 ?auto_174574 ) ) ( not ( = ?auto_174569 ?auto_174575 ) ) ( not ( = ?auto_174569 ?auto_174576 ) ) ( not ( = ?auto_174569 ?auto_174577 ) ) ( not ( = ?auto_174569 ?auto_174578 ) ) ( not ( = ?auto_174569 ?auto_174579 ) ) ( not ( = ?auto_174570 ?auto_174571 ) ) ( not ( = ?auto_174570 ?auto_174572 ) ) ( not ( = ?auto_174570 ?auto_174573 ) ) ( not ( = ?auto_174570 ?auto_174574 ) ) ( not ( = ?auto_174570 ?auto_174575 ) ) ( not ( = ?auto_174570 ?auto_174576 ) ) ( not ( = ?auto_174570 ?auto_174577 ) ) ( not ( = ?auto_174570 ?auto_174578 ) ) ( not ( = ?auto_174570 ?auto_174579 ) ) ( not ( = ?auto_174571 ?auto_174572 ) ) ( not ( = ?auto_174571 ?auto_174573 ) ) ( not ( = ?auto_174571 ?auto_174574 ) ) ( not ( = ?auto_174571 ?auto_174575 ) ) ( not ( = ?auto_174571 ?auto_174576 ) ) ( not ( = ?auto_174571 ?auto_174577 ) ) ( not ( = ?auto_174571 ?auto_174578 ) ) ( not ( = ?auto_174571 ?auto_174579 ) ) ( not ( = ?auto_174572 ?auto_174573 ) ) ( not ( = ?auto_174572 ?auto_174574 ) ) ( not ( = ?auto_174572 ?auto_174575 ) ) ( not ( = ?auto_174572 ?auto_174576 ) ) ( not ( = ?auto_174572 ?auto_174577 ) ) ( not ( = ?auto_174572 ?auto_174578 ) ) ( not ( = ?auto_174572 ?auto_174579 ) ) ( not ( = ?auto_174573 ?auto_174574 ) ) ( not ( = ?auto_174573 ?auto_174575 ) ) ( not ( = ?auto_174573 ?auto_174576 ) ) ( not ( = ?auto_174573 ?auto_174577 ) ) ( not ( = ?auto_174573 ?auto_174578 ) ) ( not ( = ?auto_174573 ?auto_174579 ) ) ( not ( = ?auto_174574 ?auto_174575 ) ) ( not ( = ?auto_174574 ?auto_174576 ) ) ( not ( = ?auto_174574 ?auto_174577 ) ) ( not ( = ?auto_174574 ?auto_174578 ) ) ( not ( = ?auto_174574 ?auto_174579 ) ) ( not ( = ?auto_174575 ?auto_174576 ) ) ( not ( = ?auto_174575 ?auto_174577 ) ) ( not ( = ?auto_174575 ?auto_174578 ) ) ( not ( = ?auto_174575 ?auto_174579 ) ) ( not ( = ?auto_174576 ?auto_174577 ) ) ( not ( = ?auto_174576 ?auto_174578 ) ) ( not ( = ?auto_174576 ?auto_174579 ) ) ( not ( = ?auto_174577 ?auto_174578 ) ) ( not ( = ?auto_174577 ?auto_174579 ) ) ( not ( = ?auto_174578 ?auto_174579 ) ) ( ON ?auto_174577 ?auto_174578 ) ( ON ?auto_174576 ?auto_174577 ) ( CLEAR ?auto_174574 ) ( ON ?auto_174575 ?auto_174576 ) ( CLEAR ?auto_174575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_174567 ?auto_174568 ?auto_174569 ?auto_174570 ?auto_174571 ?auto_174572 ?auto_174573 ?auto_174574 ?auto_174575 )
      ( MAKE-12PILE ?auto_174567 ?auto_174568 ?auto_174569 ?auto_174570 ?auto_174571 ?auto_174572 ?auto_174573 ?auto_174574 ?auto_174575 ?auto_174576 ?auto_174577 ?auto_174578 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_174592 - BLOCK
      ?auto_174593 - BLOCK
      ?auto_174594 - BLOCK
      ?auto_174595 - BLOCK
      ?auto_174596 - BLOCK
      ?auto_174597 - BLOCK
      ?auto_174598 - BLOCK
      ?auto_174599 - BLOCK
      ?auto_174600 - BLOCK
      ?auto_174601 - BLOCK
      ?auto_174602 - BLOCK
      ?auto_174603 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174603 ) ( ON-TABLE ?auto_174592 ) ( ON ?auto_174593 ?auto_174592 ) ( ON ?auto_174594 ?auto_174593 ) ( ON ?auto_174595 ?auto_174594 ) ( ON ?auto_174596 ?auto_174595 ) ( ON ?auto_174597 ?auto_174596 ) ( ON ?auto_174598 ?auto_174597 ) ( ON ?auto_174599 ?auto_174598 ) ( not ( = ?auto_174592 ?auto_174593 ) ) ( not ( = ?auto_174592 ?auto_174594 ) ) ( not ( = ?auto_174592 ?auto_174595 ) ) ( not ( = ?auto_174592 ?auto_174596 ) ) ( not ( = ?auto_174592 ?auto_174597 ) ) ( not ( = ?auto_174592 ?auto_174598 ) ) ( not ( = ?auto_174592 ?auto_174599 ) ) ( not ( = ?auto_174592 ?auto_174600 ) ) ( not ( = ?auto_174592 ?auto_174601 ) ) ( not ( = ?auto_174592 ?auto_174602 ) ) ( not ( = ?auto_174592 ?auto_174603 ) ) ( not ( = ?auto_174593 ?auto_174594 ) ) ( not ( = ?auto_174593 ?auto_174595 ) ) ( not ( = ?auto_174593 ?auto_174596 ) ) ( not ( = ?auto_174593 ?auto_174597 ) ) ( not ( = ?auto_174593 ?auto_174598 ) ) ( not ( = ?auto_174593 ?auto_174599 ) ) ( not ( = ?auto_174593 ?auto_174600 ) ) ( not ( = ?auto_174593 ?auto_174601 ) ) ( not ( = ?auto_174593 ?auto_174602 ) ) ( not ( = ?auto_174593 ?auto_174603 ) ) ( not ( = ?auto_174594 ?auto_174595 ) ) ( not ( = ?auto_174594 ?auto_174596 ) ) ( not ( = ?auto_174594 ?auto_174597 ) ) ( not ( = ?auto_174594 ?auto_174598 ) ) ( not ( = ?auto_174594 ?auto_174599 ) ) ( not ( = ?auto_174594 ?auto_174600 ) ) ( not ( = ?auto_174594 ?auto_174601 ) ) ( not ( = ?auto_174594 ?auto_174602 ) ) ( not ( = ?auto_174594 ?auto_174603 ) ) ( not ( = ?auto_174595 ?auto_174596 ) ) ( not ( = ?auto_174595 ?auto_174597 ) ) ( not ( = ?auto_174595 ?auto_174598 ) ) ( not ( = ?auto_174595 ?auto_174599 ) ) ( not ( = ?auto_174595 ?auto_174600 ) ) ( not ( = ?auto_174595 ?auto_174601 ) ) ( not ( = ?auto_174595 ?auto_174602 ) ) ( not ( = ?auto_174595 ?auto_174603 ) ) ( not ( = ?auto_174596 ?auto_174597 ) ) ( not ( = ?auto_174596 ?auto_174598 ) ) ( not ( = ?auto_174596 ?auto_174599 ) ) ( not ( = ?auto_174596 ?auto_174600 ) ) ( not ( = ?auto_174596 ?auto_174601 ) ) ( not ( = ?auto_174596 ?auto_174602 ) ) ( not ( = ?auto_174596 ?auto_174603 ) ) ( not ( = ?auto_174597 ?auto_174598 ) ) ( not ( = ?auto_174597 ?auto_174599 ) ) ( not ( = ?auto_174597 ?auto_174600 ) ) ( not ( = ?auto_174597 ?auto_174601 ) ) ( not ( = ?auto_174597 ?auto_174602 ) ) ( not ( = ?auto_174597 ?auto_174603 ) ) ( not ( = ?auto_174598 ?auto_174599 ) ) ( not ( = ?auto_174598 ?auto_174600 ) ) ( not ( = ?auto_174598 ?auto_174601 ) ) ( not ( = ?auto_174598 ?auto_174602 ) ) ( not ( = ?auto_174598 ?auto_174603 ) ) ( not ( = ?auto_174599 ?auto_174600 ) ) ( not ( = ?auto_174599 ?auto_174601 ) ) ( not ( = ?auto_174599 ?auto_174602 ) ) ( not ( = ?auto_174599 ?auto_174603 ) ) ( not ( = ?auto_174600 ?auto_174601 ) ) ( not ( = ?auto_174600 ?auto_174602 ) ) ( not ( = ?auto_174600 ?auto_174603 ) ) ( not ( = ?auto_174601 ?auto_174602 ) ) ( not ( = ?auto_174601 ?auto_174603 ) ) ( not ( = ?auto_174602 ?auto_174603 ) ) ( ON ?auto_174602 ?auto_174603 ) ( ON ?auto_174601 ?auto_174602 ) ( CLEAR ?auto_174599 ) ( ON ?auto_174600 ?auto_174601 ) ( CLEAR ?auto_174600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_174592 ?auto_174593 ?auto_174594 ?auto_174595 ?auto_174596 ?auto_174597 ?auto_174598 ?auto_174599 ?auto_174600 )
      ( MAKE-12PILE ?auto_174592 ?auto_174593 ?auto_174594 ?auto_174595 ?auto_174596 ?auto_174597 ?auto_174598 ?auto_174599 ?auto_174600 ?auto_174601 ?auto_174602 ?auto_174603 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_174616 - BLOCK
      ?auto_174617 - BLOCK
      ?auto_174618 - BLOCK
      ?auto_174619 - BLOCK
      ?auto_174620 - BLOCK
      ?auto_174621 - BLOCK
      ?auto_174622 - BLOCK
      ?auto_174623 - BLOCK
      ?auto_174624 - BLOCK
      ?auto_174625 - BLOCK
      ?auto_174626 - BLOCK
      ?auto_174627 - BLOCK
    )
    :vars
    (
      ?auto_174628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174627 ?auto_174628 ) ( ON-TABLE ?auto_174616 ) ( ON ?auto_174617 ?auto_174616 ) ( ON ?auto_174618 ?auto_174617 ) ( ON ?auto_174619 ?auto_174618 ) ( ON ?auto_174620 ?auto_174619 ) ( ON ?auto_174621 ?auto_174620 ) ( ON ?auto_174622 ?auto_174621 ) ( not ( = ?auto_174616 ?auto_174617 ) ) ( not ( = ?auto_174616 ?auto_174618 ) ) ( not ( = ?auto_174616 ?auto_174619 ) ) ( not ( = ?auto_174616 ?auto_174620 ) ) ( not ( = ?auto_174616 ?auto_174621 ) ) ( not ( = ?auto_174616 ?auto_174622 ) ) ( not ( = ?auto_174616 ?auto_174623 ) ) ( not ( = ?auto_174616 ?auto_174624 ) ) ( not ( = ?auto_174616 ?auto_174625 ) ) ( not ( = ?auto_174616 ?auto_174626 ) ) ( not ( = ?auto_174616 ?auto_174627 ) ) ( not ( = ?auto_174616 ?auto_174628 ) ) ( not ( = ?auto_174617 ?auto_174618 ) ) ( not ( = ?auto_174617 ?auto_174619 ) ) ( not ( = ?auto_174617 ?auto_174620 ) ) ( not ( = ?auto_174617 ?auto_174621 ) ) ( not ( = ?auto_174617 ?auto_174622 ) ) ( not ( = ?auto_174617 ?auto_174623 ) ) ( not ( = ?auto_174617 ?auto_174624 ) ) ( not ( = ?auto_174617 ?auto_174625 ) ) ( not ( = ?auto_174617 ?auto_174626 ) ) ( not ( = ?auto_174617 ?auto_174627 ) ) ( not ( = ?auto_174617 ?auto_174628 ) ) ( not ( = ?auto_174618 ?auto_174619 ) ) ( not ( = ?auto_174618 ?auto_174620 ) ) ( not ( = ?auto_174618 ?auto_174621 ) ) ( not ( = ?auto_174618 ?auto_174622 ) ) ( not ( = ?auto_174618 ?auto_174623 ) ) ( not ( = ?auto_174618 ?auto_174624 ) ) ( not ( = ?auto_174618 ?auto_174625 ) ) ( not ( = ?auto_174618 ?auto_174626 ) ) ( not ( = ?auto_174618 ?auto_174627 ) ) ( not ( = ?auto_174618 ?auto_174628 ) ) ( not ( = ?auto_174619 ?auto_174620 ) ) ( not ( = ?auto_174619 ?auto_174621 ) ) ( not ( = ?auto_174619 ?auto_174622 ) ) ( not ( = ?auto_174619 ?auto_174623 ) ) ( not ( = ?auto_174619 ?auto_174624 ) ) ( not ( = ?auto_174619 ?auto_174625 ) ) ( not ( = ?auto_174619 ?auto_174626 ) ) ( not ( = ?auto_174619 ?auto_174627 ) ) ( not ( = ?auto_174619 ?auto_174628 ) ) ( not ( = ?auto_174620 ?auto_174621 ) ) ( not ( = ?auto_174620 ?auto_174622 ) ) ( not ( = ?auto_174620 ?auto_174623 ) ) ( not ( = ?auto_174620 ?auto_174624 ) ) ( not ( = ?auto_174620 ?auto_174625 ) ) ( not ( = ?auto_174620 ?auto_174626 ) ) ( not ( = ?auto_174620 ?auto_174627 ) ) ( not ( = ?auto_174620 ?auto_174628 ) ) ( not ( = ?auto_174621 ?auto_174622 ) ) ( not ( = ?auto_174621 ?auto_174623 ) ) ( not ( = ?auto_174621 ?auto_174624 ) ) ( not ( = ?auto_174621 ?auto_174625 ) ) ( not ( = ?auto_174621 ?auto_174626 ) ) ( not ( = ?auto_174621 ?auto_174627 ) ) ( not ( = ?auto_174621 ?auto_174628 ) ) ( not ( = ?auto_174622 ?auto_174623 ) ) ( not ( = ?auto_174622 ?auto_174624 ) ) ( not ( = ?auto_174622 ?auto_174625 ) ) ( not ( = ?auto_174622 ?auto_174626 ) ) ( not ( = ?auto_174622 ?auto_174627 ) ) ( not ( = ?auto_174622 ?auto_174628 ) ) ( not ( = ?auto_174623 ?auto_174624 ) ) ( not ( = ?auto_174623 ?auto_174625 ) ) ( not ( = ?auto_174623 ?auto_174626 ) ) ( not ( = ?auto_174623 ?auto_174627 ) ) ( not ( = ?auto_174623 ?auto_174628 ) ) ( not ( = ?auto_174624 ?auto_174625 ) ) ( not ( = ?auto_174624 ?auto_174626 ) ) ( not ( = ?auto_174624 ?auto_174627 ) ) ( not ( = ?auto_174624 ?auto_174628 ) ) ( not ( = ?auto_174625 ?auto_174626 ) ) ( not ( = ?auto_174625 ?auto_174627 ) ) ( not ( = ?auto_174625 ?auto_174628 ) ) ( not ( = ?auto_174626 ?auto_174627 ) ) ( not ( = ?auto_174626 ?auto_174628 ) ) ( not ( = ?auto_174627 ?auto_174628 ) ) ( ON ?auto_174626 ?auto_174627 ) ( ON ?auto_174625 ?auto_174626 ) ( ON ?auto_174624 ?auto_174625 ) ( CLEAR ?auto_174622 ) ( ON ?auto_174623 ?auto_174624 ) ( CLEAR ?auto_174623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_174616 ?auto_174617 ?auto_174618 ?auto_174619 ?auto_174620 ?auto_174621 ?auto_174622 ?auto_174623 )
      ( MAKE-12PILE ?auto_174616 ?auto_174617 ?auto_174618 ?auto_174619 ?auto_174620 ?auto_174621 ?auto_174622 ?auto_174623 ?auto_174624 ?auto_174625 ?auto_174626 ?auto_174627 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_174641 - BLOCK
      ?auto_174642 - BLOCK
      ?auto_174643 - BLOCK
      ?auto_174644 - BLOCK
      ?auto_174645 - BLOCK
      ?auto_174646 - BLOCK
      ?auto_174647 - BLOCK
      ?auto_174648 - BLOCK
      ?auto_174649 - BLOCK
      ?auto_174650 - BLOCK
      ?auto_174651 - BLOCK
      ?auto_174652 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174652 ) ( ON-TABLE ?auto_174641 ) ( ON ?auto_174642 ?auto_174641 ) ( ON ?auto_174643 ?auto_174642 ) ( ON ?auto_174644 ?auto_174643 ) ( ON ?auto_174645 ?auto_174644 ) ( ON ?auto_174646 ?auto_174645 ) ( ON ?auto_174647 ?auto_174646 ) ( not ( = ?auto_174641 ?auto_174642 ) ) ( not ( = ?auto_174641 ?auto_174643 ) ) ( not ( = ?auto_174641 ?auto_174644 ) ) ( not ( = ?auto_174641 ?auto_174645 ) ) ( not ( = ?auto_174641 ?auto_174646 ) ) ( not ( = ?auto_174641 ?auto_174647 ) ) ( not ( = ?auto_174641 ?auto_174648 ) ) ( not ( = ?auto_174641 ?auto_174649 ) ) ( not ( = ?auto_174641 ?auto_174650 ) ) ( not ( = ?auto_174641 ?auto_174651 ) ) ( not ( = ?auto_174641 ?auto_174652 ) ) ( not ( = ?auto_174642 ?auto_174643 ) ) ( not ( = ?auto_174642 ?auto_174644 ) ) ( not ( = ?auto_174642 ?auto_174645 ) ) ( not ( = ?auto_174642 ?auto_174646 ) ) ( not ( = ?auto_174642 ?auto_174647 ) ) ( not ( = ?auto_174642 ?auto_174648 ) ) ( not ( = ?auto_174642 ?auto_174649 ) ) ( not ( = ?auto_174642 ?auto_174650 ) ) ( not ( = ?auto_174642 ?auto_174651 ) ) ( not ( = ?auto_174642 ?auto_174652 ) ) ( not ( = ?auto_174643 ?auto_174644 ) ) ( not ( = ?auto_174643 ?auto_174645 ) ) ( not ( = ?auto_174643 ?auto_174646 ) ) ( not ( = ?auto_174643 ?auto_174647 ) ) ( not ( = ?auto_174643 ?auto_174648 ) ) ( not ( = ?auto_174643 ?auto_174649 ) ) ( not ( = ?auto_174643 ?auto_174650 ) ) ( not ( = ?auto_174643 ?auto_174651 ) ) ( not ( = ?auto_174643 ?auto_174652 ) ) ( not ( = ?auto_174644 ?auto_174645 ) ) ( not ( = ?auto_174644 ?auto_174646 ) ) ( not ( = ?auto_174644 ?auto_174647 ) ) ( not ( = ?auto_174644 ?auto_174648 ) ) ( not ( = ?auto_174644 ?auto_174649 ) ) ( not ( = ?auto_174644 ?auto_174650 ) ) ( not ( = ?auto_174644 ?auto_174651 ) ) ( not ( = ?auto_174644 ?auto_174652 ) ) ( not ( = ?auto_174645 ?auto_174646 ) ) ( not ( = ?auto_174645 ?auto_174647 ) ) ( not ( = ?auto_174645 ?auto_174648 ) ) ( not ( = ?auto_174645 ?auto_174649 ) ) ( not ( = ?auto_174645 ?auto_174650 ) ) ( not ( = ?auto_174645 ?auto_174651 ) ) ( not ( = ?auto_174645 ?auto_174652 ) ) ( not ( = ?auto_174646 ?auto_174647 ) ) ( not ( = ?auto_174646 ?auto_174648 ) ) ( not ( = ?auto_174646 ?auto_174649 ) ) ( not ( = ?auto_174646 ?auto_174650 ) ) ( not ( = ?auto_174646 ?auto_174651 ) ) ( not ( = ?auto_174646 ?auto_174652 ) ) ( not ( = ?auto_174647 ?auto_174648 ) ) ( not ( = ?auto_174647 ?auto_174649 ) ) ( not ( = ?auto_174647 ?auto_174650 ) ) ( not ( = ?auto_174647 ?auto_174651 ) ) ( not ( = ?auto_174647 ?auto_174652 ) ) ( not ( = ?auto_174648 ?auto_174649 ) ) ( not ( = ?auto_174648 ?auto_174650 ) ) ( not ( = ?auto_174648 ?auto_174651 ) ) ( not ( = ?auto_174648 ?auto_174652 ) ) ( not ( = ?auto_174649 ?auto_174650 ) ) ( not ( = ?auto_174649 ?auto_174651 ) ) ( not ( = ?auto_174649 ?auto_174652 ) ) ( not ( = ?auto_174650 ?auto_174651 ) ) ( not ( = ?auto_174650 ?auto_174652 ) ) ( not ( = ?auto_174651 ?auto_174652 ) ) ( ON ?auto_174651 ?auto_174652 ) ( ON ?auto_174650 ?auto_174651 ) ( ON ?auto_174649 ?auto_174650 ) ( CLEAR ?auto_174647 ) ( ON ?auto_174648 ?auto_174649 ) ( CLEAR ?auto_174648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_174641 ?auto_174642 ?auto_174643 ?auto_174644 ?auto_174645 ?auto_174646 ?auto_174647 ?auto_174648 )
      ( MAKE-12PILE ?auto_174641 ?auto_174642 ?auto_174643 ?auto_174644 ?auto_174645 ?auto_174646 ?auto_174647 ?auto_174648 ?auto_174649 ?auto_174650 ?auto_174651 ?auto_174652 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_174665 - BLOCK
      ?auto_174666 - BLOCK
      ?auto_174667 - BLOCK
      ?auto_174668 - BLOCK
      ?auto_174669 - BLOCK
      ?auto_174670 - BLOCK
      ?auto_174671 - BLOCK
      ?auto_174672 - BLOCK
      ?auto_174673 - BLOCK
      ?auto_174674 - BLOCK
      ?auto_174675 - BLOCK
      ?auto_174676 - BLOCK
    )
    :vars
    (
      ?auto_174677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174676 ?auto_174677 ) ( ON-TABLE ?auto_174665 ) ( ON ?auto_174666 ?auto_174665 ) ( ON ?auto_174667 ?auto_174666 ) ( ON ?auto_174668 ?auto_174667 ) ( ON ?auto_174669 ?auto_174668 ) ( ON ?auto_174670 ?auto_174669 ) ( not ( = ?auto_174665 ?auto_174666 ) ) ( not ( = ?auto_174665 ?auto_174667 ) ) ( not ( = ?auto_174665 ?auto_174668 ) ) ( not ( = ?auto_174665 ?auto_174669 ) ) ( not ( = ?auto_174665 ?auto_174670 ) ) ( not ( = ?auto_174665 ?auto_174671 ) ) ( not ( = ?auto_174665 ?auto_174672 ) ) ( not ( = ?auto_174665 ?auto_174673 ) ) ( not ( = ?auto_174665 ?auto_174674 ) ) ( not ( = ?auto_174665 ?auto_174675 ) ) ( not ( = ?auto_174665 ?auto_174676 ) ) ( not ( = ?auto_174665 ?auto_174677 ) ) ( not ( = ?auto_174666 ?auto_174667 ) ) ( not ( = ?auto_174666 ?auto_174668 ) ) ( not ( = ?auto_174666 ?auto_174669 ) ) ( not ( = ?auto_174666 ?auto_174670 ) ) ( not ( = ?auto_174666 ?auto_174671 ) ) ( not ( = ?auto_174666 ?auto_174672 ) ) ( not ( = ?auto_174666 ?auto_174673 ) ) ( not ( = ?auto_174666 ?auto_174674 ) ) ( not ( = ?auto_174666 ?auto_174675 ) ) ( not ( = ?auto_174666 ?auto_174676 ) ) ( not ( = ?auto_174666 ?auto_174677 ) ) ( not ( = ?auto_174667 ?auto_174668 ) ) ( not ( = ?auto_174667 ?auto_174669 ) ) ( not ( = ?auto_174667 ?auto_174670 ) ) ( not ( = ?auto_174667 ?auto_174671 ) ) ( not ( = ?auto_174667 ?auto_174672 ) ) ( not ( = ?auto_174667 ?auto_174673 ) ) ( not ( = ?auto_174667 ?auto_174674 ) ) ( not ( = ?auto_174667 ?auto_174675 ) ) ( not ( = ?auto_174667 ?auto_174676 ) ) ( not ( = ?auto_174667 ?auto_174677 ) ) ( not ( = ?auto_174668 ?auto_174669 ) ) ( not ( = ?auto_174668 ?auto_174670 ) ) ( not ( = ?auto_174668 ?auto_174671 ) ) ( not ( = ?auto_174668 ?auto_174672 ) ) ( not ( = ?auto_174668 ?auto_174673 ) ) ( not ( = ?auto_174668 ?auto_174674 ) ) ( not ( = ?auto_174668 ?auto_174675 ) ) ( not ( = ?auto_174668 ?auto_174676 ) ) ( not ( = ?auto_174668 ?auto_174677 ) ) ( not ( = ?auto_174669 ?auto_174670 ) ) ( not ( = ?auto_174669 ?auto_174671 ) ) ( not ( = ?auto_174669 ?auto_174672 ) ) ( not ( = ?auto_174669 ?auto_174673 ) ) ( not ( = ?auto_174669 ?auto_174674 ) ) ( not ( = ?auto_174669 ?auto_174675 ) ) ( not ( = ?auto_174669 ?auto_174676 ) ) ( not ( = ?auto_174669 ?auto_174677 ) ) ( not ( = ?auto_174670 ?auto_174671 ) ) ( not ( = ?auto_174670 ?auto_174672 ) ) ( not ( = ?auto_174670 ?auto_174673 ) ) ( not ( = ?auto_174670 ?auto_174674 ) ) ( not ( = ?auto_174670 ?auto_174675 ) ) ( not ( = ?auto_174670 ?auto_174676 ) ) ( not ( = ?auto_174670 ?auto_174677 ) ) ( not ( = ?auto_174671 ?auto_174672 ) ) ( not ( = ?auto_174671 ?auto_174673 ) ) ( not ( = ?auto_174671 ?auto_174674 ) ) ( not ( = ?auto_174671 ?auto_174675 ) ) ( not ( = ?auto_174671 ?auto_174676 ) ) ( not ( = ?auto_174671 ?auto_174677 ) ) ( not ( = ?auto_174672 ?auto_174673 ) ) ( not ( = ?auto_174672 ?auto_174674 ) ) ( not ( = ?auto_174672 ?auto_174675 ) ) ( not ( = ?auto_174672 ?auto_174676 ) ) ( not ( = ?auto_174672 ?auto_174677 ) ) ( not ( = ?auto_174673 ?auto_174674 ) ) ( not ( = ?auto_174673 ?auto_174675 ) ) ( not ( = ?auto_174673 ?auto_174676 ) ) ( not ( = ?auto_174673 ?auto_174677 ) ) ( not ( = ?auto_174674 ?auto_174675 ) ) ( not ( = ?auto_174674 ?auto_174676 ) ) ( not ( = ?auto_174674 ?auto_174677 ) ) ( not ( = ?auto_174675 ?auto_174676 ) ) ( not ( = ?auto_174675 ?auto_174677 ) ) ( not ( = ?auto_174676 ?auto_174677 ) ) ( ON ?auto_174675 ?auto_174676 ) ( ON ?auto_174674 ?auto_174675 ) ( ON ?auto_174673 ?auto_174674 ) ( ON ?auto_174672 ?auto_174673 ) ( CLEAR ?auto_174670 ) ( ON ?auto_174671 ?auto_174672 ) ( CLEAR ?auto_174671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_174665 ?auto_174666 ?auto_174667 ?auto_174668 ?auto_174669 ?auto_174670 ?auto_174671 )
      ( MAKE-12PILE ?auto_174665 ?auto_174666 ?auto_174667 ?auto_174668 ?auto_174669 ?auto_174670 ?auto_174671 ?auto_174672 ?auto_174673 ?auto_174674 ?auto_174675 ?auto_174676 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_174690 - BLOCK
      ?auto_174691 - BLOCK
      ?auto_174692 - BLOCK
      ?auto_174693 - BLOCK
      ?auto_174694 - BLOCK
      ?auto_174695 - BLOCK
      ?auto_174696 - BLOCK
      ?auto_174697 - BLOCK
      ?auto_174698 - BLOCK
      ?auto_174699 - BLOCK
      ?auto_174700 - BLOCK
      ?auto_174701 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174701 ) ( ON-TABLE ?auto_174690 ) ( ON ?auto_174691 ?auto_174690 ) ( ON ?auto_174692 ?auto_174691 ) ( ON ?auto_174693 ?auto_174692 ) ( ON ?auto_174694 ?auto_174693 ) ( ON ?auto_174695 ?auto_174694 ) ( not ( = ?auto_174690 ?auto_174691 ) ) ( not ( = ?auto_174690 ?auto_174692 ) ) ( not ( = ?auto_174690 ?auto_174693 ) ) ( not ( = ?auto_174690 ?auto_174694 ) ) ( not ( = ?auto_174690 ?auto_174695 ) ) ( not ( = ?auto_174690 ?auto_174696 ) ) ( not ( = ?auto_174690 ?auto_174697 ) ) ( not ( = ?auto_174690 ?auto_174698 ) ) ( not ( = ?auto_174690 ?auto_174699 ) ) ( not ( = ?auto_174690 ?auto_174700 ) ) ( not ( = ?auto_174690 ?auto_174701 ) ) ( not ( = ?auto_174691 ?auto_174692 ) ) ( not ( = ?auto_174691 ?auto_174693 ) ) ( not ( = ?auto_174691 ?auto_174694 ) ) ( not ( = ?auto_174691 ?auto_174695 ) ) ( not ( = ?auto_174691 ?auto_174696 ) ) ( not ( = ?auto_174691 ?auto_174697 ) ) ( not ( = ?auto_174691 ?auto_174698 ) ) ( not ( = ?auto_174691 ?auto_174699 ) ) ( not ( = ?auto_174691 ?auto_174700 ) ) ( not ( = ?auto_174691 ?auto_174701 ) ) ( not ( = ?auto_174692 ?auto_174693 ) ) ( not ( = ?auto_174692 ?auto_174694 ) ) ( not ( = ?auto_174692 ?auto_174695 ) ) ( not ( = ?auto_174692 ?auto_174696 ) ) ( not ( = ?auto_174692 ?auto_174697 ) ) ( not ( = ?auto_174692 ?auto_174698 ) ) ( not ( = ?auto_174692 ?auto_174699 ) ) ( not ( = ?auto_174692 ?auto_174700 ) ) ( not ( = ?auto_174692 ?auto_174701 ) ) ( not ( = ?auto_174693 ?auto_174694 ) ) ( not ( = ?auto_174693 ?auto_174695 ) ) ( not ( = ?auto_174693 ?auto_174696 ) ) ( not ( = ?auto_174693 ?auto_174697 ) ) ( not ( = ?auto_174693 ?auto_174698 ) ) ( not ( = ?auto_174693 ?auto_174699 ) ) ( not ( = ?auto_174693 ?auto_174700 ) ) ( not ( = ?auto_174693 ?auto_174701 ) ) ( not ( = ?auto_174694 ?auto_174695 ) ) ( not ( = ?auto_174694 ?auto_174696 ) ) ( not ( = ?auto_174694 ?auto_174697 ) ) ( not ( = ?auto_174694 ?auto_174698 ) ) ( not ( = ?auto_174694 ?auto_174699 ) ) ( not ( = ?auto_174694 ?auto_174700 ) ) ( not ( = ?auto_174694 ?auto_174701 ) ) ( not ( = ?auto_174695 ?auto_174696 ) ) ( not ( = ?auto_174695 ?auto_174697 ) ) ( not ( = ?auto_174695 ?auto_174698 ) ) ( not ( = ?auto_174695 ?auto_174699 ) ) ( not ( = ?auto_174695 ?auto_174700 ) ) ( not ( = ?auto_174695 ?auto_174701 ) ) ( not ( = ?auto_174696 ?auto_174697 ) ) ( not ( = ?auto_174696 ?auto_174698 ) ) ( not ( = ?auto_174696 ?auto_174699 ) ) ( not ( = ?auto_174696 ?auto_174700 ) ) ( not ( = ?auto_174696 ?auto_174701 ) ) ( not ( = ?auto_174697 ?auto_174698 ) ) ( not ( = ?auto_174697 ?auto_174699 ) ) ( not ( = ?auto_174697 ?auto_174700 ) ) ( not ( = ?auto_174697 ?auto_174701 ) ) ( not ( = ?auto_174698 ?auto_174699 ) ) ( not ( = ?auto_174698 ?auto_174700 ) ) ( not ( = ?auto_174698 ?auto_174701 ) ) ( not ( = ?auto_174699 ?auto_174700 ) ) ( not ( = ?auto_174699 ?auto_174701 ) ) ( not ( = ?auto_174700 ?auto_174701 ) ) ( ON ?auto_174700 ?auto_174701 ) ( ON ?auto_174699 ?auto_174700 ) ( ON ?auto_174698 ?auto_174699 ) ( ON ?auto_174697 ?auto_174698 ) ( CLEAR ?auto_174695 ) ( ON ?auto_174696 ?auto_174697 ) ( CLEAR ?auto_174696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_174690 ?auto_174691 ?auto_174692 ?auto_174693 ?auto_174694 ?auto_174695 ?auto_174696 )
      ( MAKE-12PILE ?auto_174690 ?auto_174691 ?auto_174692 ?auto_174693 ?auto_174694 ?auto_174695 ?auto_174696 ?auto_174697 ?auto_174698 ?auto_174699 ?auto_174700 ?auto_174701 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_174714 - BLOCK
      ?auto_174715 - BLOCK
      ?auto_174716 - BLOCK
      ?auto_174717 - BLOCK
      ?auto_174718 - BLOCK
      ?auto_174719 - BLOCK
      ?auto_174720 - BLOCK
      ?auto_174721 - BLOCK
      ?auto_174722 - BLOCK
      ?auto_174723 - BLOCK
      ?auto_174724 - BLOCK
      ?auto_174725 - BLOCK
    )
    :vars
    (
      ?auto_174726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174725 ?auto_174726 ) ( ON-TABLE ?auto_174714 ) ( ON ?auto_174715 ?auto_174714 ) ( ON ?auto_174716 ?auto_174715 ) ( ON ?auto_174717 ?auto_174716 ) ( ON ?auto_174718 ?auto_174717 ) ( not ( = ?auto_174714 ?auto_174715 ) ) ( not ( = ?auto_174714 ?auto_174716 ) ) ( not ( = ?auto_174714 ?auto_174717 ) ) ( not ( = ?auto_174714 ?auto_174718 ) ) ( not ( = ?auto_174714 ?auto_174719 ) ) ( not ( = ?auto_174714 ?auto_174720 ) ) ( not ( = ?auto_174714 ?auto_174721 ) ) ( not ( = ?auto_174714 ?auto_174722 ) ) ( not ( = ?auto_174714 ?auto_174723 ) ) ( not ( = ?auto_174714 ?auto_174724 ) ) ( not ( = ?auto_174714 ?auto_174725 ) ) ( not ( = ?auto_174714 ?auto_174726 ) ) ( not ( = ?auto_174715 ?auto_174716 ) ) ( not ( = ?auto_174715 ?auto_174717 ) ) ( not ( = ?auto_174715 ?auto_174718 ) ) ( not ( = ?auto_174715 ?auto_174719 ) ) ( not ( = ?auto_174715 ?auto_174720 ) ) ( not ( = ?auto_174715 ?auto_174721 ) ) ( not ( = ?auto_174715 ?auto_174722 ) ) ( not ( = ?auto_174715 ?auto_174723 ) ) ( not ( = ?auto_174715 ?auto_174724 ) ) ( not ( = ?auto_174715 ?auto_174725 ) ) ( not ( = ?auto_174715 ?auto_174726 ) ) ( not ( = ?auto_174716 ?auto_174717 ) ) ( not ( = ?auto_174716 ?auto_174718 ) ) ( not ( = ?auto_174716 ?auto_174719 ) ) ( not ( = ?auto_174716 ?auto_174720 ) ) ( not ( = ?auto_174716 ?auto_174721 ) ) ( not ( = ?auto_174716 ?auto_174722 ) ) ( not ( = ?auto_174716 ?auto_174723 ) ) ( not ( = ?auto_174716 ?auto_174724 ) ) ( not ( = ?auto_174716 ?auto_174725 ) ) ( not ( = ?auto_174716 ?auto_174726 ) ) ( not ( = ?auto_174717 ?auto_174718 ) ) ( not ( = ?auto_174717 ?auto_174719 ) ) ( not ( = ?auto_174717 ?auto_174720 ) ) ( not ( = ?auto_174717 ?auto_174721 ) ) ( not ( = ?auto_174717 ?auto_174722 ) ) ( not ( = ?auto_174717 ?auto_174723 ) ) ( not ( = ?auto_174717 ?auto_174724 ) ) ( not ( = ?auto_174717 ?auto_174725 ) ) ( not ( = ?auto_174717 ?auto_174726 ) ) ( not ( = ?auto_174718 ?auto_174719 ) ) ( not ( = ?auto_174718 ?auto_174720 ) ) ( not ( = ?auto_174718 ?auto_174721 ) ) ( not ( = ?auto_174718 ?auto_174722 ) ) ( not ( = ?auto_174718 ?auto_174723 ) ) ( not ( = ?auto_174718 ?auto_174724 ) ) ( not ( = ?auto_174718 ?auto_174725 ) ) ( not ( = ?auto_174718 ?auto_174726 ) ) ( not ( = ?auto_174719 ?auto_174720 ) ) ( not ( = ?auto_174719 ?auto_174721 ) ) ( not ( = ?auto_174719 ?auto_174722 ) ) ( not ( = ?auto_174719 ?auto_174723 ) ) ( not ( = ?auto_174719 ?auto_174724 ) ) ( not ( = ?auto_174719 ?auto_174725 ) ) ( not ( = ?auto_174719 ?auto_174726 ) ) ( not ( = ?auto_174720 ?auto_174721 ) ) ( not ( = ?auto_174720 ?auto_174722 ) ) ( not ( = ?auto_174720 ?auto_174723 ) ) ( not ( = ?auto_174720 ?auto_174724 ) ) ( not ( = ?auto_174720 ?auto_174725 ) ) ( not ( = ?auto_174720 ?auto_174726 ) ) ( not ( = ?auto_174721 ?auto_174722 ) ) ( not ( = ?auto_174721 ?auto_174723 ) ) ( not ( = ?auto_174721 ?auto_174724 ) ) ( not ( = ?auto_174721 ?auto_174725 ) ) ( not ( = ?auto_174721 ?auto_174726 ) ) ( not ( = ?auto_174722 ?auto_174723 ) ) ( not ( = ?auto_174722 ?auto_174724 ) ) ( not ( = ?auto_174722 ?auto_174725 ) ) ( not ( = ?auto_174722 ?auto_174726 ) ) ( not ( = ?auto_174723 ?auto_174724 ) ) ( not ( = ?auto_174723 ?auto_174725 ) ) ( not ( = ?auto_174723 ?auto_174726 ) ) ( not ( = ?auto_174724 ?auto_174725 ) ) ( not ( = ?auto_174724 ?auto_174726 ) ) ( not ( = ?auto_174725 ?auto_174726 ) ) ( ON ?auto_174724 ?auto_174725 ) ( ON ?auto_174723 ?auto_174724 ) ( ON ?auto_174722 ?auto_174723 ) ( ON ?auto_174721 ?auto_174722 ) ( ON ?auto_174720 ?auto_174721 ) ( CLEAR ?auto_174718 ) ( ON ?auto_174719 ?auto_174720 ) ( CLEAR ?auto_174719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_174714 ?auto_174715 ?auto_174716 ?auto_174717 ?auto_174718 ?auto_174719 )
      ( MAKE-12PILE ?auto_174714 ?auto_174715 ?auto_174716 ?auto_174717 ?auto_174718 ?auto_174719 ?auto_174720 ?auto_174721 ?auto_174722 ?auto_174723 ?auto_174724 ?auto_174725 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_174739 - BLOCK
      ?auto_174740 - BLOCK
      ?auto_174741 - BLOCK
      ?auto_174742 - BLOCK
      ?auto_174743 - BLOCK
      ?auto_174744 - BLOCK
      ?auto_174745 - BLOCK
      ?auto_174746 - BLOCK
      ?auto_174747 - BLOCK
      ?auto_174748 - BLOCK
      ?auto_174749 - BLOCK
      ?auto_174750 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174750 ) ( ON-TABLE ?auto_174739 ) ( ON ?auto_174740 ?auto_174739 ) ( ON ?auto_174741 ?auto_174740 ) ( ON ?auto_174742 ?auto_174741 ) ( ON ?auto_174743 ?auto_174742 ) ( not ( = ?auto_174739 ?auto_174740 ) ) ( not ( = ?auto_174739 ?auto_174741 ) ) ( not ( = ?auto_174739 ?auto_174742 ) ) ( not ( = ?auto_174739 ?auto_174743 ) ) ( not ( = ?auto_174739 ?auto_174744 ) ) ( not ( = ?auto_174739 ?auto_174745 ) ) ( not ( = ?auto_174739 ?auto_174746 ) ) ( not ( = ?auto_174739 ?auto_174747 ) ) ( not ( = ?auto_174739 ?auto_174748 ) ) ( not ( = ?auto_174739 ?auto_174749 ) ) ( not ( = ?auto_174739 ?auto_174750 ) ) ( not ( = ?auto_174740 ?auto_174741 ) ) ( not ( = ?auto_174740 ?auto_174742 ) ) ( not ( = ?auto_174740 ?auto_174743 ) ) ( not ( = ?auto_174740 ?auto_174744 ) ) ( not ( = ?auto_174740 ?auto_174745 ) ) ( not ( = ?auto_174740 ?auto_174746 ) ) ( not ( = ?auto_174740 ?auto_174747 ) ) ( not ( = ?auto_174740 ?auto_174748 ) ) ( not ( = ?auto_174740 ?auto_174749 ) ) ( not ( = ?auto_174740 ?auto_174750 ) ) ( not ( = ?auto_174741 ?auto_174742 ) ) ( not ( = ?auto_174741 ?auto_174743 ) ) ( not ( = ?auto_174741 ?auto_174744 ) ) ( not ( = ?auto_174741 ?auto_174745 ) ) ( not ( = ?auto_174741 ?auto_174746 ) ) ( not ( = ?auto_174741 ?auto_174747 ) ) ( not ( = ?auto_174741 ?auto_174748 ) ) ( not ( = ?auto_174741 ?auto_174749 ) ) ( not ( = ?auto_174741 ?auto_174750 ) ) ( not ( = ?auto_174742 ?auto_174743 ) ) ( not ( = ?auto_174742 ?auto_174744 ) ) ( not ( = ?auto_174742 ?auto_174745 ) ) ( not ( = ?auto_174742 ?auto_174746 ) ) ( not ( = ?auto_174742 ?auto_174747 ) ) ( not ( = ?auto_174742 ?auto_174748 ) ) ( not ( = ?auto_174742 ?auto_174749 ) ) ( not ( = ?auto_174742 ?auto_174750 ) ) ( not ( = ?auto_174743 ?auto_174744 ) ) ( not ( = ?auto_174743 ?auto_174745 ) ) ( not ( = ?auto_174743 ?auto_174746 ) ) ( not ( = ?auto_174743 ?auto_174747 ) ) ( not ( = ?auto_174743 ?auto_174748 ) ) ( not ( = ?auto_174743 ?auto_174749 ) ) ( not ( = ?auto_174743 ?auto_174750 ) ) ( not ( = ?auto_174744 ?auto_174745 ) ) ( not ( = ?auto_174744 ?auto_174746 ) ) ( not ( = ?auto_174744 ?auto_174747 ) ) ( not ( = ?auto_174744 ?auto_174748 ) ) ( not ( = ?auto_174744 ?auto_174749 ) ) ( not ( = ?auto_174744 ?auto_174750 ) ) ( not ( = ?auto_174745 ?auto_174746 ) ) ( not ( = ?auto_174745 ?auto_174747 ) ) ( not ( = ?auto_174745 ?auto_174748 ) ) ( not ( = ?auto_174745 ?auto_174749 ) ) ( not ( = ?auto_174745 ?auto_174750 ) ) ( not ( = ?auto_174746 ?auto_174747 ) ) ( not ( = ?auto_174746 ?auto_174748 ) ) ( not ( = ?auto_174746 ?auto_174749 ) ) ( not ( = ?auto_174746 ?auto_174750 ) ) ( not ( = ?auto_174747 ?auto_174748 ) ) ( not ( = ?auto_174747 ?auto_174749 ) ) ( not ( = ?auto_174747 ?auto_174750 ) ) ( not ( = ?auto_174748 ?auto_174749 ) ) ( not ( = ?auto_174748 ?auto_174750 ) ) ( not ( = ?auto_174749 ?auto_174750 ) ) ( ON ?auto_174749 ?auto_174750 ) ( ON ?auto_174748 ?auto_174749 ) ( ON ?auto_174747 ?auto_174748 ) ( ON ?auto_174746 ?auto_174747 ) ( ON ?auto_174745 ?auto_174746 ) ( CLEAR ?auto_174743 ) ( ON ?auto_174744 ?auto_174745 ) ( CLEAR ?auto_174744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_174739 ?auto_174740 ?auto_174741 ?auto_174742 ?auto_174743 ?auto_174744 )
      ( MAKE-12PILE ?auto_174739 ?auto_174740 ?auto_174741 ?auto_174742 ?auto_174743 ?auto_174744 ?auto_174745 ?auto_174746 ?auto_174747 ?auto_174748 ?auto_174749 ?auto_174750 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_174763 - BLOCK
      ?auto_174764 - BLOCK
      ?auto_174765 - BLOCK
      ?auto_174766 - BLOCK
      ?auto_174767 - BLOCK
      ?auto_174768 - BLOCK
      ?auto_174769 - BLOCK
      ?auto_174770 - BLOCK
      ?auto_174771 - BLOCK
      ?auto_174772 - BLOCK
      ?auto_174773 - BLOCK
      ?auto_174774 - BLOCK
    )
    :vars
    (
      ?auto_174775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174774 ?auto_174775 ) ( ON-TABLE ?auto_174763 ) ( ON ?auto_174764 ?auto_174763 ) ( ON ?auto_174765 ?auto_174764 ) ( ON ?auto_174766 ?auto_174765 ) ( not ( = ?auto_174763 ?auto_174764 ) ) ( not ( = ?auto_174763 ?auto_174765 ) ) ( not ( = ?auto_174763 ?auto_174766 ) ) ( not ( = ?auto_174763 ?auto_174767 ) ) ( not ( = ?auto_174763 ?auto_174768 ) ) ( not ( = ?auto_174763 ?auto_174769 ) ) ( not ( = ?auto_174763 ?auto_174770 ) ) ( not ( = ?auto_174763 ?auto_174771 ) ) ( not ( = ?auto_174763 ?auto_174772 ) ) ( not ( = ?auto_174763 ?auto_174773 ) ) ( not ( = ?auto_174763 ?auto_174774 ) ) ( not ( = ?auto_174763 ?auto_174775 ) ) ( not ( = ?auto_174764 ?auto_174765 ) ) ( not ( = ?auto_174764 ?auto_174766 ) ) ( not ( = ?auto_174764 ?auto_174767 ) ) ( not ( = ?auto_174764 ?auto_174768 ) ) ( not ( = ?auto_174764 ?auto_174769 ) ) ( not ( = ?auto_174764 ?auto_174770 ) ) ( not ( = ?auto_174764 ?auto_174771 ) ) ( not ( = ?auto_174764 ?auto_174772 ) ) ( not ( = ?auto_174764 ?auto_174773 ) ) ( not ( = ?auto_174764 ?auto_174774 ) ) ( not ( = ?auto_174764 ?auto_174775 ) ) ( not ( = ?auto_174765 ?auto_174766 ) ) ( not ( = ?auto_174765 ?auto_174767 ) ) ( not ( = ?auto_174765 ?auto_174768 ) ) ( not ( = ?auto_174765 ?auto_174769 ) ) ( not ( = ?auto_174765 ?auto_174770 ) ) ( not ( = ?auto_174765 ?auto_174771 ) ) ( not ( = ?auto_174765 ?auto_174772 ) ) ( not ( = ?auto_174765 ?auto_174773 ) ) ( not ( = ?auto_174765 ?auto_174774 ) ) ( not ( = ?auto_174765 ?auto_174775 ) ) ( not ( = ?auto_174766 ?auto_174767 ) ) ( not ( = ?auto_174766 ?auto_174768 ) ) ( not ( = ?auto_174766 ?auto_174769 ) ) ( not ( = ?auto_174766 ?auto_174770 ) ) ( not ( = ?auto_174766 ?auto_174771 ) ) ( not ( = ?auto_174766 ?auto_174772 ) ) ( not ( = ?auto_174766 ?auto_174773 ) ) ( not ( = ?auto_174766 ?auto_174774 ) ) ( not ( = ?auto_174766 ?auto_174775 ) ) ( not ( = ?auto_174767 ?auto_174768 ) ) ( not ( = ?auto_174767 ?auto_174769 ) ) ( not ( = ?auto_174767 ?auto_174770 ) ) ( not ( = ?auto_174767 ?auto_174771 ) ) ( not ( = ?auto_174767 ?auto_174772 ) ) ( not ( = ?auto_174767 ?auto_174773 ) ) ( not ( = ?auto_174767 ?auto_174774 ) ) ( not ( = ?auto_174767 ?auto_174775 ) ) ( not ( = ?auto_174768 ?auto_174769 ) ) ( not ( = ?auto_174768 ?auto_174770 ) ) ( not ( = ?auto_174768 ?auto_174771 ) ) ( not ( = ?auto_174768 ?auto_174772 ) ) ( not ( = ?auto_174768 ?auto_174773 ) ) ( not ( = ?auto_174768 ?auto_174774 ) ) ( not ( = ?auto_174768 ?auto_174775 ) ) ( not ( = ?auto_174769 ?auto_174770 ) ) ( not ( = ?auto_174769 ?auto_174771 ) ) ( not ( = ?auto_174769 ?auto_174772 ) ) ( not ( = ?auto_174769 ?auto_174773 ) ) ( not ( = ?auto_174769 ?auto_174774 ) ) ( not ( = ?auto_174769 ?auto_174775 ) ) ( not ( = ?auto_174770 ?auto_174771 ) ) ( not ( = ?auto_174770 ?auto_174772 ) ) ( not ( = ?auto_174770 ?auto_174773 ) ) ( not ( = ?auto_174770 ?auto_174774 ) ) ( not ( = ?auto_174770 ?auto_174775 ) ) ( not ( = ?auto_174771 ?auto_174772 ) ) ( not ( = ?auto_174771 ?auto_174773 ) ) ( not ( = ?auto_174771 ?auto_174774 ) ) ( not ( = ?auto_174771 ?auto_174775 ) ) ( not ( = ?auto_174772 ?auto_174773 ) ) ( not ( = ?auto_174772 ?auto_174774 ) ) ( not ( = ?auto_174772 ?auto_174775 ) ) ( not ( = ?auto_174773 ?auto_174774 ) ) ( not ( = ?auto_174773 ?auto_174775 ) ) ( not ( = ?auto_174774 ?auto_174775 ) ) ( ON ?auto_174773 ?auto_174774 ) ( ON ?auto_174772 ?auto_174773 ) ( ON ?auto_174771 ?auto_174772 ) ( ON ?auto_174770 ?auto_174771 ) ( ON ?auto_174769 ?auto_174770 ) ( ON ?auto_174768 ?auto_174769 ) ( CLEAR ?auto_174766 ) ( ON ?auto_174767 ?auto_174768 ) ( CLEAR ?auto_174767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_174763 ?auto_174764 ?auto_174765 ?auto_174766 ?auto_174767 )
      ( MAKE-12PILE ?auto_174763 ?auto_174764 ?auto_174765 ?auto_174766 ?auto_174767 ?auto_174768 ?auto_174769 ?auto_174770 ?auto_174771 ?auto_174772 ?auto_174773 ?auto_174774 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_174788 - BLOCK
      ?auto_174789 - BLOCK
      ?auto_174790 - BLOCK
      ?auto_174791 - BLOCK
      ?auto_174792 - BLOCK
      ?auto_174793 - BLOCK
      ?auto_174794 - BLOCK
      ?auto_174795 - BLOCK
      ?auto_174796 - BLOCK
      ?auto_174797 - BLOCK
      ?auto_174798 - BLOCK
      ?auto_174799 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174799 ) ( ON-TABLE ?auto_174788 ) ( ON ?auto_174789 ?auto_174788 ) ( ON ?auto_174790 ?auto_174789 ) ( ON ?auto_174791 ?auto_174790 ) ( not ( = ?auto_174788 ?auto_174789 ) ) ( not ( = ?auto_174788 ?auto_174790 ) ) ( not ( = ?auto_174788 ?auto_174791 ) ) ( not ( = ?auto_174788 ?auto_174792 ) ) ( not ( = ?auto_174788 ?auto_174793 ) ) ( not ( = ?auto_174788 ?auto_174794 ) ) ( not ( = ?auto_174788 ?auto_174795 ) ) ( not ( = ?auto_174788 ?auto_174796 ) ) ( not ( = ?auto_174788 ?auto_174797 ) ) ( not ( = ?auto_174788 ?auto_174798 ) ) ( not ( = ?auto_174788 ?auto_174799 ) ) ( not ( = ?auto_174789 ?auto_174790 ) ) ( not ( = ?auto_174789 ?auto_174791 ) ) ( not ( = ?auto_174789 ?auto_174792 ) ) ( not ( = ?auto_174789 ?auto_174793 ) ) ( not ( = ?auto_174789 ?auto_174794 ) ) ( not ( = ?auto_174789 ?auto_174795 ) ) ( not ( = ?auto_174789 ?auto_174796 ) ) ( not ( = ?auto_174789 ?auto_174797 ) ) ( not ( = ?auto_174789 ?auto_174798 ) ) ( not ( = ?auto_174789 ?auto_174799 ) ) ( not ( = ?auto_174790 ?auto_174791 ) ) ( not ( = ?auto_174790 ?auto_174792 ) ) ( not ( = ?auto_174790 ?auto_174793 ) ) ( not ( = ?auto_174790 ?auto_174794 ) ) ( not ( = ?auto_174790 ?auto_174795 ) ) ( not ( = ?auto_174790 ?auto_174796 ) ) ( not ( = ?auto_174790 ?auto_174797 ) ) ( not ( = ?auto_174790 ?auto_174798 ) ) ( not ( = ?auto_174790 ?auto_174799 ) ) ( not ( = ?auto_174791 ?auto_174792 ) ) ( not ( = ?auto_174791 ?auto_174793 ) ) ( not ( = ?auto_174791 ?auto_174794 ) ) ( not ( = ?auto_174791 ?auto_174795 ) ) ( not ( = ?auto_174791 ?auto_174796 ) ) ( not ( = ?auto_174791 ?auto_174797 ) ) ( not ( = ?auto_174791 ?auto_174798 ) ) ( not ( = ?auto_174791 ?auto_174799 ) ) ( not ( = ?auto_174792 ?auto_174793 ) ) ( not ( = ?auto_174792 ?auto_174794 ) ) ( not ( = ?auto_174792 ?auto_174795 ) ) ( not ( = ?auto_174792 ?auto_174796 ) ) ( not ( = ?auto_174792 ?auto_174797 ) ) ( not ( = ?auto_174792 ?auto_174798 ) ) ( not ( = ?auto_174792 ?auto_174799 ) ) ( not ( = ?auto_174793 ?auto_174794 ) ) ( not ( = ?auto_174793 ?auto_174795 ) ) ( not ( = ?auto_174793 ?auto_174796 ) ) ( not ( = ?auto_174793 ?auto_174797 ) ) ( not ( = ?auto_174793 ?auto_174798 ) ) ( not ( = ?auto_174793 ?auto_174799 ) ) ( not ( = ?auto_174794 ?auto_174795 ) ) ( not ( = ?auto_174794 ?auto_174796 ) ) ( not ( = ?auto_174794 ?auto_174797 ) ) ( not ( = ?auto_174794 ?auto_174798 ) ) ( not ( = ?auto_174794 ?auto_174799 ) ) ( not ( = ?auto_174795 ?auto_174796 ) ) ( not ( = ?auto_174795 ?auto_174797 ) ) ( not ( = ?auto_174795 ?auto_174798 ) ) ( not ( = ?auto_174795 ?auto_174799 ) ) ( not ( = ?auto_174796 ?auto_174797 ) ) ( not ( = ?auto_174796 ?auto_174798 ) ) ( not ( = ?auto_174796 ?auto_174799 ) ) ( not ( = ?auto_174797 ?auto_174798 ) ) ( not ( = ?auto_174797 ?auto_174799 ) ) ( not ( = ?auto_174798 ?auto_174799 ) ) ( ON ?auto_174798 ?auto_174799 ) ( ON ?auto_174797 ?auto_174798 ) ( ON ?auto_174796 ?auto_174797 ) ( ON ?auto_174795 ?auto_174796 ) ( ON ?auto_174794 ?auto_174795 ) ( ON ?auto_174793 ?auto_174794 ) ( CLEAR ?auto_174791 ) ( ON ?auto_174792 ?auto_174793 ) ( CLEAR ?auto_174792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_174788 ?auto_174789 ?auto_174790 ?auto_174791 ?auto_174792 )
      ( MAKE-12PILE ?auto_174788 ?auto_174789 ?auto_174790 ?auto_174791 ?auto_174792 ?auto_174793 ?auto_174794 ?auto_174795 ?auto_174796 ?auto_174797 ?auto_174798 ?auto_174799 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_174812 - BLOCK
      ?auto_174813 - BLOCK
      ?auto_174814 - BLOCK
      ?auto_174815 - BLOCK
      ?auto_174816 - BLOCK
      ?auto_174817 - BLOCK
      ?auto_174818 - BLOCK
      ?auto_174819 - BLOCK
      ?auto_174820 - BLOCK
      ?auto_174821 - BLOCK
      ?auto_174822 - BLOCK
      ?auto_174823 - BLOCK
    )
    :vars
    (
      ?auto_174824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174823 ?auto_174824 ) ( ON-TABLE ?auto_174812 ) ( ON ?auto_174813 ?auto_174812 ) ( ON ?auto_174814 ?auto_174813 ) ( not ( = ?auto_174812 ?auto_174813 ) ) ( not ( = ?auto_174812 ?auto_174814 ) ) ( not ( = ?auto_174812 ?auto_174815 ) ) ( not ( = ?auto_174812 ?auto_174816 ) ) ( not ( = ?auto_174812 ?auto_174817 ) ) ( not ( = ?auto_174812 ?auto_174818 ) ) ( not ( = ?auto_174812 ?auto_174819 ) ) ( not ( = ?auto_174812 ?auto_174820 ) ) ( not ( = ?auto_174812 ?auto_174821 ) ) ( not ( = ?auto_174812 ?auto_174822 ) ) ( not ( = ?auto_174812 ?auto_174823 ) ) ( not ( = ?auto_174812 ?auto_174824 ) ) ( not ( = ?auto_174813 ?auto_174814 ) ) ( not ( = ?auto_174813 ?auto_174815 ) ) ( not ( = ?auto_174813 ?auto_174816 ) ) ( not ( = ?auto_174813 ?auto_174817 ) ) ( not ( = ?auto_174813 ?auto_174818 ) ) ( not ( = ?auto_174813 ?auto_174819 ) ) ( not ( = ?auto_174813 ?auto_174820 ) ) ( not ( = ?auto_174813 ?auto_174821 ) ) ( not ( = ?auto_174813 ?auto_174822 ) ) ( not ( = ?auto_174813 ?auto_174823 ) ) ( not ( = ?auto_174813 ?auto_174824 ) ) ( not ( = ?auto_174814 ?auto_174815 ) ) ( not ( = ?auto_174814 ?auto_174816 ) ) ( not ( = ?auto_174814 ?auto_174817 ) ) ( not ( = ?auto_174814 ?auto_174818 ) ) ( not ( = ?auto_174814 ?auto_174819 ) ) ( not ( = ?auto_174814 ?auto_174820 ) ) ( not ( = ?auto_174814 ?auto_174821 ) ) ( not ( = ?auto_174814 ?auto_174822 ) ) ( not ( = ?auto_174814 ?auto_174823 ) ) ( not ( = ?auto_174814 ?auto_174824 ) ) ( not ( = ?auto_174815 ?auto_174816 ) ) ( not ( = ?auto_174815 ?auto_174817 ) ) ( not ( = ?auto_174815 ?auto_174818 ) ) ( not ( = ?auto_174815 ?auto_174819 ) ) ( not ( = ?auto_174815 ?auto_174820 ) ) ( not ( = ?auto_174815 ?auto_174821 ) ) ( not ( = ?auto_174815 ?auto_174822 ) ) ( not ( = ?auto_174815 ?auto_174823 ) ) ( not ( = ?auto_174815 ?auto_174824 ) ) ( not ( = ?auto_174816 ?auto_174817 ) ) ( not ( = ?auto_174816 ?auto_174818 ) ) ( not ( = ?auto_174816 ?auto_174819 ) ) ( not ( = ?auto_174816 ?auto_174820 ) ) ( not ( = ?auto_174816 ?auto_174821 ) ) ( not ( = ?auto_174816 ?auto_174822 ) ) ( not ( = ?auto_174816 ?auto_174823 ) ) ( not ( = ?auto_174816 ?auto_174824 ) ) ( not ( = ?auto_174817 ?auto_174818 ) ) ( not ( = ?auto_174817 ?auto_174819 ) ) ( not ( = ?auto_174817 ?auto_174820 ) ) ( not ( = ?auto_174817 ?auto_174821 ) ) ( not ( = ?auto_174817 ?auto_174822 ) ) ( not ( = ?auto_174817 ?auto_174823 ) ) ( not ( = ?auto_174817 ?auto_174824 ) ) ( not ( = ?auto_174818 ?auto_174819 ) ) ( not ( = ?auto_174818 ?auto_174820 ) ) ( not ( = ?auto_174818 ?auto_174821 ) ) ( not ( = ?auto_174818 ?auto_174822 ) ) ( not ( = ?auto_174818 ?auto_174823 ) ) ( not ( = ?auto_174818 ?auto_174824 ) ) ( not ( = ?auto_174819 ?auto_174820 ) ) ( not ( = ?auto_174819 ?auto_174821 ) ) ( not ( = ?auto_174819 ?auto_174822 ) ) ( not ( = ?auto_174819 ?auto_174823 ) ) ( not ( = ?auto_174819 ?auto_174824 ) ) ( not ( = ?auto_174820 ?auto_174821 ) ) ( not ( = ?auto_174820 ?auto_174822 ) ) ( not ( = ?auto_174820 ?auto_174823 ) ) ( not ( = ?auto_174820 ?auto_174824 ) ) ( not ( = ?auto_174821 ?auto_174822 ) ) ( not ( = ?auto_174821 ?auto_174823 ) ) ( not ( = ?auto_174821 ?auto_174824 ) ) ( not ( = ?auto_174822 ?auto_174823 ) ) ( not ( = ?auto_174822 ?auto_174824 ) ) ( not ( = ?auto_174823 ?auto_174824 ) ) ( ON ?auto_174822 ?auto_174823 ) ( ON ?auto_174821 ?auto_174822 ) ( ON ?auto_174820 ?auto_174821 ) ( ON ?auto_174819 ?auto_174820 ) ( ON ?auto_174818 ?auto_174819 ) ( ON ?auto_174817 ?auto_174818 ) ( ON ?auto_174816 ?auto_174817 ) ( CLEAR ?auto_174814 ) ( ON ?auto_174815 ?auto_174816 ) ( CLEAR ?auto_174815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_174812 ?auto_174813 ?auto_174814 ?auto_174815 )
      ( MAKE-12PILE ?auto_174812 ?auto_174813 ?auto_174814 ?auto_174815 ?auto_174816 ?auto_174817 ?auto_174818 ?auto_174819 ?auto_174820 ?auto_174821 ?auto_174822 ?auto_174823 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_174837 - BLOCK
      ?auto_174838 - BLOCK
      ?auto_174839 - BLOCK
      ?auto_174840 - BLOCK
      ?auto_174841 - BLOCK
      ?auto_174842 - BLOCK
      ?auto_174843 - BLOCK
      ?auto_174844 - BLOCK
      ?auto_174845 - BLOCK
      ?auto_174846 - BLOCK
      ?auto_174847 - BLOCK
      ?auto_174848 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174848 ) ( ON-TABLE ?auto_174837 ) ( ON ?auto_174838 ?auto_174837 ) ( ON ?auto_174839 ?auto_174838 ) ( not ( = ?auto_174837 ?auto_174838 ) ) ( not ( = ?auto_174837 ?auto_174839 ) ) ( not ( = ?auto_174837 ?auto_174840 ) ) ( not ( = ?auto_174837 ?auto_174841 ) ) ( not ( = ?auto_174837 ?auto_174842 ) ) ( not ( = ?auto_174837 ?auto_174843 ) ) ( not ( = ?auto_174837 ?auto_174844 ) ) ( not ( = ?auto_174837 ?auto_174845 ) ) ( not ( = ?auto_174837 ?auto_174846 ) ) ( not ( = ?auto_174837 ?auto_174847 ) ) ( not ( = ?auto_174837 ?auto_174848 ) ) ( not ( = ?auto_174838 ?auto_174839 ) ) ( not ( = ?auto_174838 ?auto_174840 ) ) ( not ( = ?auto_174838 ?auto_174841 ) ) ( not ( = ?auto_174838 ?auto_174842 ) ) ( not ( = ?auto_174838 ?auto_174843 ) ) ( not ( = ?auto_174838 ?auto_174844 ) ) ( not ( = ?auto_174838 ?auto_174845 ) ) ( not ( = ?auto_174838 ?auto_174846 ) ) ( not ( = ?auto_174838 ?auto_174847 ) ) ( not ( = ?auto_174838 ?auto_174848 ) ) ( not ( = ?auto_174839 ?auto_174840 ) ) ( not ( = ?auto_174839 ?auto_174841 ) ) ( not ( = ?auto_174839 ?auto_174842 ) ) ( not ( = ?auto_174839 ?auto_174843 ) ) ( not ( = ?auto_174839 ?auto_174844 ) ) ( not ( = ?auto_174839 ?auto_174845 ) ) ( not ( = ?auto_174839 ?auto_174846 ) ) ( not ( = ?auto_174839 ?auto_174847 ) ) ( not ( = ?auto_174839 ?auto_174848 ) ) ( not ( = ?auto_174840 ?auto_174841 ) ) ( not ( = ?auto_174840 ?auto_174842 ) ) ( not ( = ?auto_174840 ?auto_174843 ) ) ( not ( = ?auto_174840 ?auto_174844 ) ) ( not ( = ?auto_174840 ?auto_174845 ) ) ( not ( = ?auto_174840 ?auto_174846 ) ) ( not ( = ?auto_174840 ?auto_174847 ) ) ( not ( = ?auto_174840 ?auto_174848 ) ) ( not ( = ?auto_174841 ?auto_174842 ) ) ( not ( = ?auto_174841 ?auto_174843 ) ) ( not ( = ?auto_174841 ?auto_174844 ) ) ( not ( = ?auto_174841 ?auto_174845 ) ) ( not ( = ?auto_174841 ?auto_174846 ) ) ( not ( = ?auto_174841 ?auto_174847 ) ) ( not ( = ?auto_174841 ?auto_174848 ) ) ( not ( = ?auto_174842 ?auto_174843 ) ) ( not ( = ?auto_174842 ?auto_174844 ) ) ( not ( = ?auto_174842 ?auto_174845 ) ) ( not ( = ?auto_174842 ?auto_174846 ) ) ( not ( = ?auto_174842 ?auto_174847 ) ) ( not ( = ?auto_174842 ?auto_174848 ) ) ( not ( = ?auto_174843 ?auto_174844 ) ) ( not ( = ?auto_174843 ?auto_174845 ) ) ( not ( = ?auto_174843 ?auto_174846 ) ) ( not ( = ?auto_174843 ?auto_174847 ) ) ( not ( = ?auto_174843 ?auto_174848 ) ) ( not ( = ?auto_174844 ?auto_174845 ) ) ( not ( = ?auto_174844 ?auto_174846 ) ) ( not ( = ?auto_174844 ?auto_174847 ) ) ( not ( = ?auto_174844 ?auto_174848 ) ) ( not ( = ?auto_174845 ?auto_174846 ) ) ( not ( = ?auto_174845 ?auto_174847 ) ) ( not ( = ?auto_174845 ?auto_174848 ) ) ( not ( = ?auto_174846 ?auto_174847 ) ) ( not ( = ?auto_174846 ?auto_174848 ) ) ( not ( = ?auto_174847 ?auto_174848 ) ) ( ON ?auto_174847 ?auto_174848 ) ( ON ?auto_174846 ?auto_174847 ) ( ON ?auto_174845 ?auto_174846 ) ( ON ?auto_174844 ?auto_174845 ) ( ON ?auto_174843 ?auto_174844 ) ( ON ?auto_174842 ?auto_174843 ) ( ON ?auto_174841 ?auto_174842 ) ( CLEAR ?auto_174839 ) ( ON ?auto_174840 ?auto_174841 ) ( CLEAR ?auto_174840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_174837 ?auto_174838 ?auto_174839 ?auto_174840 )
      ( MAKE-12PILE ?auto_174837 ?auto_174838 ?auto_174839 ?auto_174840 ?auto_174841 ?auto_174842 ?auto_174843 ?auto_174844 ?auto_174845 ?auto_174846 ?auto_174847 ?auto_174848 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_174861 - BLOCK
      ?auto_174862 - BLOCK
      ?auto_174863 - BLOCK
      ?auto_174864 - BLOCK
      ?auto_174865 - BLOCK
      ?auto_174866 - BLOCK
      ?auto_174867 - BLOCK
      ?auto_174868 - BLOCK
      ?auto_174869 - BLOCK
      ?auto_174870 - BLOCK
      ?auto_174871 - BLOCK
      ?auto_174872 - BLOCK
    )
    :vars
    (
      ?auto_174873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174872 ?auto_174873 ) ( ON-TABLE ?auto_174861 ) ( ON ?auto_174862 ?auto_174861 ) ( not ( = ?auto_174861 ?auto_174862 ) ) ( not ( = ?auto_174861 ?auto_174863 ) ) ( not ( = ?auto_174861 ?auto_174864 ) ) ( not ( = ?auto_174861 ?auto_174865 ) ) ( not ( = ?auto_174861 ?auto_174866 ) ) ( not ( = ?auto_174861 ?auto_174867 ) ) ( not ( = ?auto_174861 ?auto_174868 ) ) ( not ( = ?auto_174861 ?auto_174869 ) ) ( not ( = ?auto_174861 ?auto_174870 ) ) ( not ( = ?auto_174861 ?auto_174871 ) ) ( not ( = ?auto_174861 ?auto_174872 ) ) ( not ( = ?auto_174861 ?auto_174873 ) ) ( not ( = ?auto_174862 ?auto_174863 ) ) ( not ( = ?auto_174862 ?auto_174864 ) ) ( not ( = ?auto_174862 ?auto_174865 ) ) ( not ( = ?auto_174862 ?auto_174866 ) ) ( not ( = ?auto_174862 ?auto_174867 ) ) ( not ( = ?auto_174862 ?auto_174868 ) ) ( not ( = ?auto_174862 ?auto_174869 ) ) ( not ( = ?auto_174862 ?auto_174870 ) ) ( not ( = ?auto_174862 ?auto_174871 ) ) ( not ( = ?auto_174862 ?auto_174872 ) ) ( not ( = ?auto_174862 ?auto_174873 ) ) ( not ( = ?auto_174863 ?auto_174864 ) ) ( not ( = ?auto_174863 ?auto_174865 ) ) ( not ( = ?auto_174863 ?auto_174866 ) ) ( not ( = ?auto_174863 ?auto_174867 ) ) ( not ( = ?auto_174863 ?auto_174868 ) ) ( not ( = ?auto_174863 ?auto_174869 ) ) ( not ( = ?auto_174863 ?auto_174870 ) ) ( not ( = ?auto_174863 ?auto_174871 ) ) ( not ( = ?auto_174863 ?auto_174872 ) ) ( not ( = ?auto_174863 ?auto_174873 ) ) ( not ( = ?auto_174864 ?auto_174865 ) ) ( not ( = ?auto_174864 ?auto_174866 ) ) ( not ( = ?auto_174864 ?auto_174867 ) ) ( not ( = ?auto_174864 ?auto_174868 ) ) ( not ( = ?auto_174864 ?auto_174869 ) ) ( not ( = ?auto_174864 ?auto_174870 ) ) ( not ( = ?auto_174864 ?auto_174871 ) ) ( not ( = ?auto_174864 ?auto_174872 ) ) ( not ( = ?auto_174864 ?auto_174873 ) ) ( not ( = ?auto_174865 ?auto_174866 ) ) ( not ( = ?auto_174865 ?auto_174867 ) ) ( not ( = ?auto_174865 ?auto_174868 ) ) ( not ( = ?auto_174865 ?auto_174869 ) ) ( not ( = ?auto_174865 ?auto_174870 ) ) ( not ( = ?auto_174865 ?auto_174871 ) ) ( not ( = ?auto_174865 ?auto_174872 ) ) ( not ( = ?auto_174865 ?auto_174873 ) ) ( not ( = ?auto_174866 ?auto_174867 ) ) ( not ( = ?auto_174866 ?auto_174868 ) ) ( not ( = ?auto_174866 ?auto_174869 ) ) ( not ( = ?auto_174866 ?auto_174870 ) ) ( not ( = ?auto_174866 ?auto_174871 ) ) ( not ( = ?auto_174866 ?auto_174872 ) ) ( not ( = ?auto_174866 ?auto_174873 ) ) ( not ( = ?auto_174867 ?auto_174868 ) ) ( not ( = ?auto_174867 ?auto_174869 ) ) ( not ( = ?auto_174867 ?auto_174870 ) ) ( not ( = ?auto_174867 ?auto_174871 ) ) ( not ( = ?auto_174867 ?auto_174872 ) ) ( not ( = ?auto_174867 ?auto_174873 ) ) ( not ( = ?auto_174868 ?auto_174869 ) ) ( not ( = ?auto_174868 ?auto_174870 ) ) ( not ( = ?auto_174868 ?auto_174871 ) ) ( not ( = ?auto_174868 ?auto_174872 ) ) ( not ( = ?auto_174868 ?auto_174873 ) ) ( not ( = ?auto_174869 ?auto_174870 ) ) ( not ( = ?auto_174869 ?auto_174871 ) ) ( not ( = ?auto_174869 ?auto_174872 ) ) ( not ( = ?auto_174869 ?auto_174873 ) ) ( not ( = ?auto_174870 ?auto_174871 ) ) ( not ( = ?auto_174870 ?auto_174872 ) ) ( not ( = ?auto_174870 ?auto_174873 ) ) ( not ( = ?auto_174871 ?auto_174872 ) ) ( not ( = ?auto_174871 ?auto_174873 ) ) ( not ( = ?auto_174872 ?auto_174873 ) ) ( ON ?auto_174871 ?auto_174872 ) ( ON ?auto_174870 ?auto_174871 ) ( ON ?auto_174869 ?auto_174870 ) ( ON ?auto_174868 ?auto_174869 ) ( ON ?auto_174867 ?auto_174868 ) ( ON ?auto_174866 ?auto_174867 ) ( ON ?auto_174865 ?auto_174866 ) ( ON ?auto_174864 ?auto_174865 ) ( CLEAR ?auto_174862 ) ( ON ?auto_174863 ?auto_174864 ) ( CLEAR ?auto_174863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174861 ?auto_174862 ?auto_174863 )
      ( MAKE-12PILE ?auto_174861 ?auto_174862 ?auto_174863 ?auto_174864 ?auto_174865 ?auto_174866 ?auto_174867 ?auto_174868 ?auto_174869 ?auto_174870 ?auto_174871 ?auto_174872 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_174886 - BLOCK
      ?auto_174887 - BLOCK
      ?auto_174888 - BLOCK
      ?auto_174889 - BLOCK
      ?auto_174890 - BLOCK
      ?auto_174891 - BLOCK
      ?auto_174892 - BLOCK
      ?auto_174893 - BLOCK
      ?auto_174894 - BLOCK
      ?auto_174895 - BLOCK
      ?auto_174896 - BLOCK
      ?auto_174897 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174897 ) ( ON-TABLE ?auto_174886 ) ( ON ?auto_174887 ?auto_174886 ) ( not ( = ?auto_174886 ?auto_174887 ) ) ( not ( = ?auto_174886 ?auto_174888 ) ) ( not ( = ?auto_174886 ?auto_174889 ) ) ( not ( = ?auto_174886 ?auto_174890 ) ) ( not ( = ?auto_174886 ?auto_174891 ) ) ( not ( = ?auto_174886 ?auto_174892 ) ) ( not ( = ?auto_174886 ?auto_174893 ) ) ( not ( = ?auto_174886 ?auto_174894 ) ) ( not ( = ?auto_174886 ?auto_174895 ) ) ( not ( = ?auto_174886 ?auto_174896 ) ) ( not ( = ?auto_174886 ?auto_174897 ) ) ( not ( = ?auto_174887 ?auto_174888 ) ) ( not ( = ?auto_174887 ?auto_174889 ) ) ( not ( = ?auto_174887 ?auto_174890 ) ) ( not ( = ?auto_174887 ?auto_174891 ) ) ( not ( = ?auto_174887 ?auto_174892 ) ) ( not ( = ?auto_174887 ?auto_174893 ) ) ( not ( = ?auto_174887 ?auto_174894 ) ) ( not ( = ?auto_174887 ?auto_174895 ) ) ( not ( = ?auto_174887 ?auto_174896 ) ) ( not ( = ?auto_174887 ?auto_174897 ) ) ( not ( = ?auto_174888 ?auto_174889 ) ) ( not ( = ?auto_174888 ?auto_174890 ) ) ( not ( = ?auto_174888 ?auto_174891 ) ) ( not ( = ?auto_174888 ?auto_174892 ) ) ( not ( = ?auto_174888 ?auto_174893 ) ) ( not ( = ?auto_174888 ?auto_174894 ) ) ( not ( = ?auto_174888 ?auto_174895 ) ) ( not ( = ?auto_174888 ?auto_174896 ) ) ( not ( = ?auto_174888 ?auto_174897 ) ) ( not ( = ?auto_174889 ?auto_174890 ) ) ( not ( = ?auto_174889 ?auto_174891 ) ) ( not ( = ?auto_174889 ?auto_174892 ) ) ( not ( = ?auto_174889 ?auto_174893 ) ) ( not ( = ?auto_174889 ?auto_174894 ) ) ( not ( = ?auto_174889 ?auto_174895 ) ) ( not ( = ?auto_174889 ?auto_174896 ) ) ( not ( = ?auto_174889 ?auto_174897 ) ) ( not ( = ?auto_174890 ?auto_174891 ) ) ( not ( = ?auto_174890 ?auto_174892 ) ) ( not ( = ?auto_174890 ?auto_174893 ) ) ( not ( = ?auto_174890 ?auto_174894 ) ) ( not ( = ?auto_174890 ?auto_174895 ) ) ( not ( = ?auto_174890 ?auto_174896 ) ) ( not ( = ?auto_174890 ?auto_174897 ) ) ( not ( = ?auto_174891 ?auto_174892 ) ) ( not ( = ?auto_174891 ?auto_174893 ) ) ( not ( = ?auto_174891 ?auto_174894 ) ) ( not ( = ?auto_174891 ?auto_174895 ) ) ( not ( = ?auto_174891 ?auto_174896 ) ) ( not ( = ?auto_174891 ?auto_174897 ) ) ( not ( = ?auto_174892 ?auto_174893 ) ) ( not ( = ?auto_174892 ?auto_174894 ) ) ( not ( = ?auto_174892 ?auto_174895 ) ) ( not ( = ?auto_174892 ?auto_174896 ) ) ( not ( = ?auto_174892 ?auto_174897 ) ) ( not ( = ?auto_174893 ?auto_174894 ) ) ( not ( = ?auto_174893 ?auto_174895 ) ) ( not ( = ?auto_174893 ?auto_174896 ) ) ( not ( = ?auto_174893 ?auto_174897 ) ) ( not ( = ?auto_174894 ?auto_174895 ) ) ( not ( = ?auto_174894 ?auto_174896 ) ) ( not ( = ?auto_174894 ?auto_174897 ) ) ( not ( = ?auto_174895 ?auto_174896 ) ) ( not ( = ?auto_174895 ?auto_174897 ) ) ( not ( = ?auto_174896 ?auto_174897 ) ) ( ON ?auto_174896 ?auto_174897 ) ( ON ?auto_174895 ?auto_174896 ) ( ON ?auto_174894 ?auto_174895 ) ( ON ?auto_174893 ?auto_174894 ) ( ON ?auto_174892 ?auto_174893 ) ( ON ?auto_174891 ?auto_174892 ) ( ON ?auto_174890 ?auto_174891 ) ( ON ?auto_174889 ?auto_174890 ) ( CLEAR ?auto_174887 ) ( ON ?auto_174888 ?auto_174889 ) ( CLEAR ?auto_174888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174886 ?auto_174887 ?auto_174888 )
      ( MAKE-12PILE ?auto_174886 ?auto_174887 ?auto_174888 ?auto_174889 ?auto_174890 ?auto_174891 ?auto_174892 ?auto_174893 ?auto_174894 ?auto_174895 ?auto_174896 ?auto_174897 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_174910 - BLOCK
      ?auto_174911 - BLOCK
      ?auto_174912 - BLOCK
      ?auto_174913 - BLOCK
      ?auto_174914 - BLOCK
      ?auto_174915 - BLOCK
      ?auto_174916 - BLOCK
      ?auto_174917 - BLOCK
      ?auto_174918 - BLOCK
      ?auto_174919 - BLOCK
      ?auto_174920 - BLOCK
      ?auto_174921 - BLOCK
    )
    :vars
    (
      ?auto_174922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174921 ?auto_174922 ) ( ON-TABLE ?auto_174910 ) ( not ( = ?auto_174910 ?auto_174911 ) ) ( not ( = ?auto_174910 ?auto_174912 ) ) ( not ( = ?auto_174910 ?auto_174913 ) ) ( not ( = ?auto_174910 ?auto_174914 ) ) ( not ( = ?auto_174910 ?auto_174915 ) ) ( not ( = ?auto_174910 ?auto_174916 ) ) ( not ( = ?auto_174910 ?auto_174917 ) ) ( not ( = ?auto_174910 ?auto_174918 ) ) ( not ( = ?auto_174910 ?auto_174919 ) ) ( not ( = ?auto_174910 ?auto_174920 ) ) ( not ( = ?auto_174910 ?auto_174921 ) ) ( not ( = ?auto_174910 ?auto_174922 ) ) ( not ( = ?auto_174911 ?auto_174912 ) ) ( not ( = ?auto_174911 ?auto_174913 ) ) ( not ( = ?auto_174911 ?auto_174914 ) ) ( not ( = ?auto_174911 ?auto_174915 ) ) ( not ( = ?auto_174911 ?auto_174916 ) ) ( not ( = ?auto_174911 ?auto_174917 ) ) ( not ( = ?auto_174911 ?auto_174918 ) ) ( not ( = ?auto_174911 ?auto_174919 ) ) ( not ( = ?auto_174911 ?auto_174920 ) ) ( not ( = ?auto_174911 ?auto_174921 ) ) ( not ( = ?auto_174911 ?auto_174922 ) ) ( not ( = ?auto_174912 ?auto_174913 ) ) ( not ( = ?auto_174912 ?auto_174914 ) ) ( not ( = ?auto_174912 ?auto_174915 ) ) ( not ( = ?auto_174912 ?auto_174916 ) ) ( not ( = ?auto_174912 ?auto_174917 ) ) ( not ( = ?auto_174912 ?auto_174918 ) ) ( not ( = ?auto_174912 ?auto_174919 ) ) ( not ( = ?auto_174912 ?auto_174920 ) ) ( not ( = ?auto_174912 ?auto_174921 ) ) ( not ( = ?auto_174912 ?auto_174922 ) ) ( not ( = ?auto_174913 ?auto_174914 ) ) ( not ( = ?auto_174913 ?auto_174915 ) ) ( not ( = ?auto_174913 ?auto_174916 ) ) ( not ( = ?auto_174913 ?auto_174917 ) ) ( not ( = ?auto_174913 ?auto_174918 ) ) ( not ( = ?auto_174913 ?auto_174919 ) ) ( not ( = ?auto_174913 ?auto_174920 ) ) ( not ( = ?auto_174913 ?auto_174921 ) ) ( not ( = ?auto_174913 ?auto_174922 ) ) ( not ( = ?auto_174914 ?auto_174915 ) ) ( not ( = ?auto_174914 ?auto_174916 ) ) ( not ( = ?auto_174914 ?auto_174917 ) ) ( not ( = ?auto_174914 ?auto_174918 ) ) ( not ( = ?auto_174914 ?auto_174919 ) ) ( not ( = ?auto_174914 ?auto_174920 ) ) ( not ( = ?auto_174914 ?auto_174921 ) ) ( not ( = ?auto_174914 ?auto_174922 ) ) ( not ( = ?auto_174915 ?auto_174916 ) ) ( not ( = ?auto_174915 ?auto_174917 ) ) ( not ( = ?auto_174915 ?auto_174918 ) ) ( not ( = ?auto_174915 ?auto_174919 ) ) ( not ( = ?auto_174915 ?auto_174920 ) ) ( not ( = ?auto_174915 ?auto_174921 ) ) ( not ( = ?auto_174915 ?auto_174922 ) ) ( not ( = ?auto_174916 ?auto_174917 ) ) ( not ( = ?auto_174916 ?auto_174918 ) ) ( not ( = ?auto_174916 ?auto_174919 ) ) ( not ( = ?auto_174916 ?auto_174920 ) ) ( not ( = ?auto_174916 ?auto_174921 ) ) ( not ( = ?auto_174916 ?auto_174922 ) ) ( not ( = ?auto_174917 ?auto_174918 ) ) ( not ( = ?auto_174917 ?auto_174919 ) ) ( not ( = ?auto_174917 ?auto_174920 ) ) ( not ( = ?auto_174917 ?auto_174921 ) ) ( not ( = ?auto_174917 ?auto_174922 ) ) ( not ( = ?auto_174918 ?auto_174919 ) ) ( not ( = ?auto_174918 ?auto_174920 ) ) ( not ( = ?auto_174918 ?auto_174921 ) ) ( not ( = ?auto_174918 ?auto_174922 ) ) ( not ( = ?auto_174919 ?auto_174920 ) ) ( not ( = ?auto_174919 ?auto_174921 ) ) ( not ( = ?auto_174919 ?auto_174922 ) ) ( not ( = ?auto_174920 ?auto_174921 ) ) ( not ( = ?auto_174920 ?auto_174922 ) ) ( not ( = ?auto_174921 ?auto_174922 ) ) ( ON ?auto_174920 ?auto_174921 ) ( ON ?auto_174919 ?auto_174920 ) ( ON ?auto_174918 ?auto_174919 ) ( ON ?auto_174917 ?auto_174918 ) ( ON ?auto_174916 ?auto_174917 ) ( ON ?auto_174915 ?auto_174916 ) ( ON ?auto_174914 ?auto_174915 ) ( ON ?auto_174913 ?auto_174914 ) ( ON ?auto_174912 ?auto_174913 ) ( CLEAR ?auto_174910 ) ( ON ?auto_174911 ?auto_174912 ) ( CLEAR ?auto_174911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_174910 ?auto_174911 )
      ( MAKE-12PILE ?auto_174910 ?auto_174911 ?auto_174912 ?auto_174913 ?auto_174914 ?auto_174915 ?auto_174916 ?auto_174917 ?auto_174918 ?auto_174919 ?auto_174920 ?auto_174921 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_174935 - BLOCK
      ?auto_174936 - BLOCK
      ?auto_174937 - BLOCK
      ?auto_174938 - BLOCK
      ?auto_174939 - BLOCK
      ?auto_174940 - BLOCK
      ?auto_174941 - BLOCK
      ?auto_174942 - BLOCK
      ?auto_174943 - BLOCK
      ?auto_174944 - BLOCK
      ?auto_174945 - BLOCK
      ?auto_174946 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174946 ) ( ON-TABLE ?auto_174935 ) ( not ( = ?auto_174935 ?auto_174936 ) ) ( not ( = ?auto_174935 ?auto_174937 ) ) ( not ( = ?auto_174935 ?auto_174938 ) ) ( not ( = ?auto_174935 ?auto_174939 ) ) ( not ( = ?auto_174935 ?auto_174940 ) ) ( not ( = ?auto_174935 ?auto_174941 ) ) ( not ( = ?auto_174935 ?auto_174942 ) ) ( not ( = ?auto_174935 ?auto_174943 ) ) ( not ( = ?auto_174935 ?auto_174944 ) ) ( not ( = ?auto_174935 ?auto_174945 ) ) ( not ( = ?auto_174935 ?auto_174946 ) ) ( not ( = ?auto_174936 ?auto_174937 ) ) ( not ( = ?auto_174936 ?auto_174938 ) ) ( not ( = ?auto_174936 ?auto_174939 ) ) ( not ( = ?auto_174936 ?auto_174940 ) ) ( not ( = ?auto_174936 ?auto_174941 ) ) ( not ( = ?auto_174936 ?auto_174942 ) ) ( not ( = ?auto_174936 ?auto_174943 ) ) ( not ( = ?auto_174936 ?auto_174944 ) ) ( not ( = ?auto_174936 ?auto_174945 ) ) ( not ( = ?auto_174936 ?auto_174946 ) ) ( not ( = ?auto_174937 ?auto_174938 ) ) ( not ( = ?auto_174937 ?auto_174939 ) ) ( not ( = ?auto_174937 ?auto_174940 ) ) ( not ( = ?auto_174937 ?auto_174941 ) ) ( not ( = ?auto_174937 ?auto_174942 ) ) ( not ( = ?auto_174937 ?auto_174943 ) ) ( not ( = ?auto_174937 ?auto_174944 ) ) ( not ( = ?auto_174937 ?auto_174945 ) ) ( not ( = ?auto_174937 ?auto_174946 ) ) ( not ( = ?auto_174938 ?auto_174939 ) ) ( not ( = ?auto_174938 ?auto_174940 ) ) ( not ( = ?auto_174938 ?auto_174941 ) ) ( not ( = ?auto_174938 ?auto_174942 ) ) ( not ( = ?auto_174938 ?auto_174943 ) ) ( not ( = ?auto_174938 ?auto_174944 ) ) ( not ( = ?auto_174938 ?auto_174945 ) ) ( not ( = ?auto_174938 ?auto_174946 ) ) ( not ( = ?auto_174939 ?auto_174940 ) ) ( not ( = ?auto_174939 ?auto_174941 ) ) ( not ( = ?auto_174939 ?auto_174942 ) ) ( not ( = ?auto_174939 ?auto_174943 ) ) ( not ( = ?auto_174939 ?auto_174944 ) ) ( not ( = ?auto_174939 ?auto_174945 ) ) ( not ( = ?auto_174939 ?auto_174946 ) ) ( not ( = ?auto_174940 ?auto_174941 ) ) ( not ( = ?auto_174940 ?auto_174942 ) ) ( not ( = ?auto_174940 ?auto_174943 ) ) ( not ( = ?auto_174940 ?auto_174944 ) ) ( not ( = ?auto_174940 ?auto_174945 ) ) ( not ( = ?auto_174940 ?auto_174946 ) ) ( not ( = ?auto_174941 ?auto_174942 ) ) ( not ( = ?auto_174941 ?auto_174943 ) ) ( not ( = ?auto_174941 ?auto_174944 ) ) ( not ( = ?auto_174941 ?auto_174945 ) ) ( not ( = ?auto_174941 ?auto_174946 ) ) ( not ( = ?auto_174942 ?auto_174943 ) ) ( not ( = ?auto_174942 ?auto_174944 ) ) ( not ( = ?auto_174942 ?auto_174945 ) ) ( not ( = ?auto_174942 ?auto_174946 ) ) ( not ( = ?auto_174943 ?auto_174944 ) ) ( not ( = ?auto_174943 ?auto_174945 ) ) ( not ( = ?auto_174943 ?auto_174946 ) ) ( not ( = ?auto_174944 ?auto_174945 ) ) ( not ( = ?auto_174944 ?auto_174946 ) ) ( not ( = ?auto_174945 ?auto_174946 ) ) ( ON ?auto_174945 ?auto_174946 ) ( ON ?auto_174944 ?auto_174945 ) ( ON ?auto_174943 ?auto_174944 ) ( ON ?auto_174942 ?auto_174943 ) ( ON ?auto_174941 ?auto_174942 ) ( ON ?auto_174940 ?auto_174941 ) ( ON ?auto_174939 ?auto_174940 ) ( ON ?auto_174938 ?auto_174939 ) ( ON ?auto_174937 ?auto_174938 ) ( CLEAR ?auto_174935 ) ( ON ?auto_174936 ?auto_174937 ) ( CLEAR ?auto_174936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_174935 ?auto_174936 )
      ( MAKE-12PILE ?auto_174935 ?auto_174936 ?auto_174937 ?auto_174938 ?auto_174939 ?auto_174940 ?auto_174941 ?auto_174942 ?auto_174943 ?auto_174944 ?auto_174945 ?auto_174946 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_174959 - BLOCK
      ?auto_174960 - BLOCK
      ?auto_174961 - BLOCK
      ?auto_174962 - BLOCK
      ?auto_174963 - BLOCK
      ?auto_174964 - BLOCK
      ?auto_174965 - BLOCK
      ?auto_174966 - BLOCK
      ?auto_174967 - BLOCK
      ?auto_174968 - BLOCK
      ?auto_174969 - BLOCK
      ?auto_174970 - BLOCK
    )
    :vars
    (
      ?auto_174971 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174970 ?auto_174971 ) ( not ( = ?auto_174959 ?auto_174960 ) ) ( not ( = ?auto_174959 ?auto_174961 ) ) ( not ( = ?auto_174959 ?auto_174962 ) ) ( not ( = ?auto_174959 ?auto_174963 ) ) ( not ( = ?auto_174959 ?auto_174964 ) ) ( not ( = ?auto_174959 ?auto_174965 ) ) ( not ( = ?auto_174959 ?auto_174966 ) ) ( not ( = ?auto_174959 ?auto_174967 ) ) ( not ( = ?auto_174959 ?auto_174968 ) ) ( not ( = ?auto_174959 ?auto_174969 ) ) ( not ( = ?auto_174959 ?auto_174970 ) ) ( not ( = ?auto_174959 ?auto_174971 ) ) ( not ( = ?auto_174960 ?auto_174961 ) ) ( not ( = ?auto_174960 ?auto_174962 ) ) ( not ( = ?auto_174960 ?auto_174963 ) ) ( not ( = ?auto_174960 ?auto_174964 ) ) ( not ( = ?auto_174960 ?auto_174965 ) ) ( not ( = ?auto_174960 ?auto_174966 ) ) ( not ( = ?auto_174960 ?auto_174967 ) ) ( not ( = ?auto_174960 ?auto_174968 ) ) ( not ( = ?auto_174960 ?auto_174969 ) ) ( not ( = ?auto_174960 ?auto_174970 ) ) ( not ( = ?auto_174960 ?auto_174971 ) ) ( not ( = ?auto_174961 ?auto_174962 ) ) ( not ( = ?auto_174961 ?auto_174963 ) ) ( not ( = ?auto_174961 ?auto_174964 ) ) ( not ( = ?auto_174961 ?auto_174965 ) ) ( not ( = ?auto_174961 ?auto_174966 ) ) ( not ( = ?auto_174961 ?auto_174967 ) ) ( not ( = ?auto_174961 ?auto_174968 ) ) ( not ( = ?auto_174961 ?auto_174969 ) ) ( not ( = ?auto_174961 ?auto_174970 ) ) ( not ( = ?auto_174961 ?auto_174971 ) ) ( not ( = ?auto_174962 ?auto_174963 ) ) ( not ( = ?auto_174962 ?auto_174964 ) ) ( not ( = ?auto_174962 ?auto_174965 ) ) ( not ( = ?auto_174962 ?auto_174966 ) ) ( not ( = ?auto_174962 ?auto_174967 ) ) ( not ( = ?auto_174962 ?auto_174968 ) ) ( not ( = ?auto_174962 ?auto_174969 ) ) ( not ( = ?auto_174962 ?auto_174970 ) ) ( not ( = ?auto_174962 ?auto_174971 ) ) ( not ( = ?auto_174963 ?auto_174964 ) ) ( not ( = ?auto_174963 ?auto_174965 ) ) ( not ( = ?auto_174963 ?auto_174966 ) ) ( not ( = ?auto_174963 ?auto_174967 ) ) ( not ( = ?auto_174963 ?auto_174968 ) ) ( not ( = ?auto_174963 ?auto_174969 ) ) ( not ( = ?auto_174963 ?auto_174970 ) ) ( not ( = ?auto_174963 ?auto_174971 ) ) ( not ( = ?auto_174964 ?auto_174965 ) ) ( not ( = ?auto_174964 ?auto_174966 ) ) ( not ( = ?auto_174964 ?auto_174967 ) ) ( not ( = ?auto_174964 ?auto_174968 ) ) ( not ( = ?auto_174964 ?auto_174969 ) ) ( not ( = ?auto_174964 ?auto_174970 ) ) ( not ( = ?auto_174964 ?auto_174971 ) ) ( not ( = ?auto_174965 ?auto_174966 ) ) ( not ( = ?auto_174965 ?auto_174967 ) ) ( not ( = ?auto_174965 ?auto_174968 ) ) ( not ( = ?auto_174965 ?auto_174969 ) ) ( not ( = ?auto_174965 ?auto_174970 ) ) ( not ( = ?auto_174965 ?auto_174971 ) ) ( not ( = ?auto_174966 ?auto_174967 ) ) ( not ( = ?auto_174966 ?auto_174968 ) ) ( not ( = ?auto_174966 ?auto_174969 ) ) ( not ( = ?auto_174966 ?auto_174970 ) ) ( not ( = ?auto_174966 ?auto_174971 ) ) ( not ( = ?auto_174967 ?auto_174968 ) ) ( not ( = ?auto_174967 ?auto_174969 ) ) ( not ( = ?auto_174967 ?auto_174970 ) ) ( not ( = ?auto_174967 ?auto_174971 ) ) ( not ( = ?auto_174968 ?auto_174969 ) ) ( not ( = ?auto_174968 ?auto_174970 ) ) ( not ( = ?auto_174968 ?auto_174971 ) ) ( not ( = ?auto_174969 ?auto_174970 ) ) ( not ( = ?auto_174969 ?auto_174971 ) ) ( not ( = ?auto_174970 ?auto_174971 ) ) ( ON ?auto_174969 ?auto_174970 ) ( ON ?auto_174968 ?auto_174969 ) ( ON ?auto_174967 ?auto_174968 ) ( ON ?auto_174966 ?auto_174967 ) ( ON ?auto_174965 ?auto_174966 ) ( ON ?auto_174964 ?auto_174965 ) ( ON ?auto_174963 ?auto_174964 ) ( ON ?auto_174962 ?auto_174963 ) ( ON ?auto_174961 ?auto_174962 ) ( ON ?auto_174960 ?auto_174961 ) ( ON ?auto_174959 ?auto_174960 ) ( CLEAR ?auto_174959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_174959 )
      ( MAKE-12PILE ?auto_174959 ?auto_174960 ?auto_174961 ?auto_174962 ?auto_174963 ?auto_174964 ?auto_174965 ?auto_174966 ?auto_174967 ?auto_174968 ?auto_174969 ?auto_174970 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_174984 - BLOCK
      ?auto_174985 - BLOCK
      ?auto_174986 - BLOCK
      ?auto_174987 - BLOCK
      ?auto_174988 - BLOCK
      ?auto_174989 - BLOCK
      ?auto_174990 - BLOCK
      ?auto_174991 - BLOCK
      ?auto_174992 - BLOCK
      ?auto_174993 - BLOCK
      ?auto_174994 - BLOCK
      ?auto_174995 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174995 ) ( not ( = ?auto_174984 ?auto_174985 ) ) ( not ( = ?auto_174984 ?auto_174986 ) ) ( not ( = ?auto_174984 ?auto_174987 ) ) ( not ( = ?auto_174984 ?auto_174988 ) ) ( not ( = ?auto_174984 ?auto_174989 ) ) ( not ( = ?auto_174984 ?auto_174990 ) ) ( not ( = ?auto_174984 ?auto_174991 ) ) ( not ( = ?auto_174984 ?auto_174992 ) ) ( not ( = ?auto_174984 ?auto_174993 ) ) ( not ( = ?auto_174984 ?auto_174994 ) ) ( not ( = ?auto_174984 ?auto_174995 ) ) ( not ( = ?auto_174985 ?auto_174986 ) ) ( not ( = ?auto_174985 ?auto_174987 ) ) ( not ( = ?auto_174985 ?auto_174988 ) ) ( not ( = ?auto_174985 ?auto_174989 ) ) ( not ( = ?auto_174985 ?auto_174990 ) ) ( not ( = ?auto_174985 ?auto_174991 ) ) ( not ( = ?auto_174985 ?auto_174992 ) ) ( not ( = ?auto_174985 ?auto_174993 ) ) ( not ( = ?auto_174985 ?auto_174994 ) ) ( not ( = ?auto_174985 ?auto_174995 ) ) ( not ( = ?auto_174986 ?auto_174987 ) ) ( not ( = ?auto_174986 ?auto_174988 ) ) ( not ( = ?auto_174986 ?auto_174989 ) ) ( not ( = ?auto_174986 ?auto_174990 ) ) ( not ( = ?auto_174986 ?auto_174991 ) ) ( not ( = ?auto_174986 ?auto_174992 ) ) ( not ( = ?auto_174986 ?auto_174993 ) ) ( not ( = ?auto_174986 ?auto_174994 ) ) ( not ( = ?auto_174986 ?auto_174995 ) ) ( not ( = ?auto_174987 ?auto_174988 ) ) ( not ( = ?auto_174987 ?auto_174989 ) ) ( not ( = ?auto_174987 ?auto_174990 ) ) ( not ( = ?auto_174987 ?auto_174991 ) ) ( not ( = ?auto_174987 ?auto_174992 ) ) ( not ( = ?auto_174987 ?auto_174993 ) ) ( not ( = ?auto_174987 ?auto_174994 ) ) ( not ( = ?auto_174987 ?auto_174995 ) ) ( not ( = ?auto_174988 ?auto_174989 ) ) ( not ( = ?auto_174988 ?auto_174990 ) ) ( not ( = ?auto_174988 ?auto_174991 ) ) ( not ( = ?auto_174988 ?auto_174992 ) ) ( not ( = ?auto_174988 ?auto_174993 ) ) ( not ( = ?auto_174988 ?auto_174994 ) ) ( not ( = ?auto_174988 ?auto_174995 ) ) ( not ( = ?auto_174989 ?auto_174990 ) ) ( not ( = ?auto_174989 ?auto_174991 ) ) ( not ( = ?auto_174989 ?auto_174992 ) ) ( not ( = ?auto_174989 ?auto_174993 ) ) ( not ( = ?auto_174989 ?auto_174994 ) ) ( not ( = ?auto_174989 ?auto_174995 ) ) ( not ( = ?auto_174990 ?auto_174991 ) ) ( not ( = ?auto_174990 ?auto_174992 ) ) ( not ( = ?auto_174990 ?auto_174993 ) ) ( not ( = ?auto_174990 ?auto_174994 ) ) ( not ( = ?auto_174990 ?auto_174995 ) ) ( not ( = ?auto_174991 ?auto_174992 ) ) ( not ( = ?auto_174991 ?auto_174993 ) ) ( not ( = ?auto_174991 ?auto_174994 ) ) ( not ( = ?auto_174991 ?auto_174995 ) ) ( not ( = ?auto_174992 ?auto_174993 ) ) ( not ( = ?auto_174992 ?auto_174994 ) ) ( not ( = ?auto_174992 ?auto_174995 ) ) ( not ( = ?auto_174993 ?auto_174994 ) ) ( not ( = ?auto_174993 ?auto_174995 ) ) ( not ( = ?auto_174994 ?auto_174995 ) ) ( ON ?auto_174994 ?auto_174995 ) ( ON ?auto_174993 ?auto_174994 ) ( ON ?auto_174992 ?auto_174993 ) ( ON ?auto_174991 ?auto_174992 ) ( ON ?auto_174990 ?auto_174991 ) ( ON ?auto_174989 ?auto_174990 ) ( ON ?auto_174988 ?auto_174989 ) ( ON ?auto_174987 ?auto_174988 ) ( ON ?auto_174986 ?auto_174987 ) ( ON ?auto_174985 ?auto_174986 ) ( ON ?auto_174984 ?auto_174985 ) ( CLEAR ?auto_174984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_174984 )
      ( MAKE-12PILE ?auto_174984 ?auto_174985 ?auto_174986 ?auto_174987 ?auto_174988 ?auto_174989 ?auto_174990 ?auto_174991 ?auto_174992 ?auto_174993 ?auto_174994 ?auto_174995 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_175008 - BLOCK
      ?auto_175009 - BLOCK
      ?auto_175010 - BLOCK
      ?auto_175011 - BLOCK
      ?auto_175012 - BLOCK
      ?auto_175013 - BLOCK
      ?auto_175014 - BLOCK
      ?auto_175015 - BLOCK
      ?auto_175016 - BLOCK
      ?auto_175017 - BLOCK
      ?auto_175018 - BLOCK
      ?auto_175019 - BLOCK
    )
    :vars
    (
      ?auto_175020 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175008 ?auto_175009 ) ) ( not ( = ?auto_175008 ?auto_175010 ) ) ( not ( = ?auto_175008 ?auto_175011 ) ) ( not ( = ?auto_175008 ?auto_175012 ) ) ( not ( = ?auto_175008 ?auto_175013 ) ) ( not ( = ?auto_175008 ?auto_175014 ) ) ( not ( = ?auto_175008 ?auto_175015 ) ) ( not ( = ?auto_175008 ?auto_175016 ) ) ( not ( = ?auto_175008 ?auto_175017 ) ) ( not ( = ?auto_175008 ?auto_175018 ) ) ( not ( = ?auto_175008 ?auto_175019 ) ) ( not ( = ?auto_175009 ?auto_175010 ) ) ( not ( = ?auto_175009 ?auto_175011 ) ) ( not ( = ?auto_175009 ?auto_175012 ) ) ( not ( = ?auto_175009 ?auto_175013 ) ) ( not ( = ?auto_175009 ?auto_175014 ) ) ( not ( = ?auto_175009 ?auto_175015 ) ) ( not ( = ?auto_175009 ?auto_175016 ) ) ( not ( = ?auto_175009 ?auto_175017 ) ) ( not ( = ?auto_175009 ?auto_175018 ) ) ( not ( = ?auto_175009 ?auto_175019 ) ) ( not ( = ?auto_175010 ?auto_175011 ) ) ( not ( = ?auto_175010 ?auto_175012 ) ) ( not ( = ?auto_175010 ?auto_175013 ) ) ( not ( = ?auto_175010 ?auto_175014 ) ) ( not ( = ?auto_175010 ?auto_175015 ) ) ( not ( = ?auto_175010 ?auto_175016 ) ) ( not ( = ?auto_175010 ?auto_175017 ) ) ( not ( = ?auto_175010 ?auto_175018 ) ) ( not ( = ?auto_175010 ?auto_175019 ) ) ( not ( = ?auto_175011 ?auto_175012 ) ) ( not ( = ?auto_175011 ?auto_175013 ) ) ( not ( = ?auto_175011 ?auto_175014 ) ) ( not ( = ?auto_175011 ?auto_175015 ) ) ( not ( = ?auto_175011 ?auto_175016 ) ) ( not ( = ?auto_175011 ?auto_175017 ) ) ( not ( = ?auto_175011 ?auto_175018 ) ) ( not ( = ?auto_175011 ?auto_175019 ) ) ( not ( = ?auto_175012 ?auto_175013 ) ) ( not ( = ?auto_175012 ?auto_175014 ) ) ( not ( = ?auto_175012 ?auto_175015 ) ) ( not ( = ?auto_175012 ?auto_175016 ) ) ( not ( = ?auto_175012 ?auto_175017 ) ) ( not ( = ?auto_175012 ?auto_175018 ) ) ( not ( = ?auto_175012 ?auto_175019 ) ) ( not ( = ?auto_175013 ?auto_175014 ) ) ( not ( = ?auto_175013 ?auto_175015 ) ) ( not ( = ?auto_175013 ?auto_175016 ) ) ( not ( = ?auto_175013 ?auto_175017 ) ) ( not ( = ?auto_175013 ?auto_175018 ) ) ( not ( = ?auto_175013 ?auto_175019 ) ) ( not ( = ?auto_175014 ?auto_175015 ) ) ( not ( = ?auto_175014 ?auto_175016 ) ) ( not ( = ?auto_175014 ?auto_175017 ) ) ( not ( = ?auto_175014 ?auto_175018 ) ) ( not ( = ?auto_175014 ?auto_175019 ) ) ( not ( = ?auto_175015 ?auto_175016 ) ) ( not ( = ?auto_175015 ?auto_175017 ) ) ( not ( = ?auto_175015 ?auto_175018 ) ) ( not ( = ?auto_175015 ?auto_175019 ) ) ( not ( = ?auto_175016 ?auto_175017 ) ) ( not ( = ?auto_175016 ?auto_175018 ) ) ( not ( = ?auto_175016 ?auto_175019 ) ) ( not ( = ?auto_175017 ?auto_175018 ) ) ( not ( = ?auto_175017 ?auto_175019 ) ) ( not ( = ?auto_175018 ?auto_175019 ) ) ( ON ?auto_175008 ?auto_175020 ) ( not ( = ?auto_175019 ?auto_175020 ) ) ( not ( = ?auto_175018 ?auto_175020 ) ) ( not ( = ?auto_175017 ?auto_175020 ) ) ( not ( = ?auto_175016 ?auto_175020 ) ) ( not ( = ?auto_175015 ?auto_175020 ) ) ( not ( = ?auto_175014 ?auto_175020 ) ) ( not ( = ?auto_175013 ?auto_175020 ) ) ( not ( = ?auto_175012 ?auto_175020 ) ) ( not ( = ?auto_175011 ?auto_175020 ) ) ( not ( = ?auto_175010 ?auto_175020 ) ) ( not ( = ?auto_175009 ?auto_175020 ) ) ( not ( = ?auto_175008 ?auto_175020 ) ) ( ON ?auto_175009 ?auto_175008 ) ( ON ?auto_175010 ?auto_175009 ) ( ON ?auto_175011 ?auto_175010 ) ( ON ?auto_175012 ?auto_175011 ) ( ON ?auto_175013 ?auto_175012 ) ( ON ?auto_175014 ?auto_175013 ) ( ON ?auto_175015 ?auto_175014 ) ( ON ?auto_175016 ?auto_175015 ) ( ON ?auto_175017 ?auto_175016 ) ( ON ?auto_175018 ?auto_175017 ) ( ON ?auto_175019 ?auto_175018 ) ( CLEAR ?auto_175019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_175019 ?auto_175018 ?auto_175017 ?auto_175016 ?auto_175015 ?auto_175014 ?auto_175013 ?auto_175012 ?auto_175011 ?auto_175010 ?auto_175009 ?auto_175008 )
      ( MAKE-12PILE ?auto_175008 ?auto_175009 ?auto_175010 ?auto_175011 ?auto_175012 ?auto_175013 ?auto_175014 ?auto_175015 ?auto_175016 ?auto_175017 ?auto_175018 ?auto_175019 ) )
  )

)

