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
      ?auto_8319 - BLOCK
      ?auto_8320 - BLOCK
      ?auto_8321 - BLOCK
      ?auto_8322 - BLOCK
    )
    :vars
    (
      ?auto_8323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8323 ?auto_8322 ) ( CLEAR ?auto_8323 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8319 ) ( ON ?auto_8320 ?auto_8319 ) ( ON ?auto_8321 ?auto_8320 ) ( ON ?auto_8322 ?auto_8321 ) ( not ( = ?auto_8319 ?auto_8320 ) ) ( not ( = ?auto_8319 ?auto_8321 ) ) ( not ( = ?auto_8319 ?auto_8322 ) ) ( not ( = ?auto_8319 ?auto_8323 ) ) ( not ( = ?auto_8320 ?auto_8321 ) ) ( not ( = ?auto_8320 ?auto_8322 ) ) ( not ( = ?auto_8320 ?auto_8323 ) ) ( not ( = ?auto_8321 ?auto_8322 ) ) ( not ( = ?auto_8321 ?auto_8323 ) ) ( not ( = ?auto_8322 ?auto_8323 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8323 ?auto_8322 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8325 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_8325 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_8325 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8326 - BLOCK
    )
    :vars
    (
      ?auto_8327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8326 ?auto_8327 ) ( CLEAR ?auto_8326 ) ( HAND-EMPTY ) ( not ( = ?auto_8326 ?auto_8327 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8326 ?auto_8327 )
      ( MAKE-1PILE ?auto_8326 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8331 - BLOCK
      ?auto_8332 - BLOCK
      ?auto_8333 - BLOCK
    )
    :vars
    (
      ?auto_8334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8334 ?auto_8333 ) ( CLEAR ?auto_8334 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8331 ) ( ON ?auto_8332 ?auto_8331 ) ( ON ?auto_8333 ?auto_8332 ) ( not ( = ?auto_8331 ?auto_8332 ) ) ( not ( = ?auto_8331 ?auto_8333 ) ) ( not ( = ?auto_8331 ?auto_8334 ) ) ( not ( = ?auto_8332 ?auto_8333 ) ) ( not ( = ?auto_8332 ?auto_8334 ) ) ( not ( = ?auto_8333 ?auto_8334 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8334 ?auto_8333 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8335 - BLOCK
      ?auto_8336 - BLOCK
      ?auto_8337 - BLOCK
    )
    :vars
    (
      ?auto_8338 - BLOCK
      ?auto_8339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8338 ?auto_8337 ) ( CLEAR ?auto_8338 ) ( ON-TABLE ?auto_8335 ) ( ON ?auto_8336 ?auto_8335 ) ( ON ?auto_8337 ?auto_8336 ) ( not ( = ?auto_8335 ?auto_8336 ) ) ( not ( = ?auto_8335 ?auto_8337 ) ) ( not ( = ?auto_8335 ?auto_8338 ) ) ( not ( = ?auto_8336 ?auto_8337 ) ) ( not ( = ?auto_8336 ?auto_8338 ) ) ( not ( = ?auto_8337 ?auto_8338 ) ) ( HOLDING ?auto_8339 ) ( not ( = ?auto_8335 ?auto_8339 ) ) ( not ( = ?auto_8336 ?auto_8339 ) ) ( not ( = ?auto_8337 ?auto_8339 ) ) ( not ( = ?auto_8338 ?auto_8339 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_8339 )
      ( MAKE-3PILE ?auto_8335 ?auto_8336 ?auto_8337 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8340 - BLOCK
      ?auto_8341 - BLOCK
      ?auto_8342 - BLOCK
    )
    :vars
    (
      ?auto_8344 - BLOCK
      ?auto_8343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8344 ?auto_8342 ) ( ON-TABLE ?auto_8340 ) ( ON ?auto_8341 ?auto_8340 ) ( ON ?auto_8342 ?auto_8341 ) ( not ( = ?auto_8340 ?auto_8341 ) ) ( not ( = ?auto_8340 ?auto_8342 ) ) ( not ( = ?auto_8340 ?auto_8344 ) ) ( not ( = ?auto_8341 ?auto_8342 ) ) ( not ( = ?auto_8341 ?auto_8344 ) ) ( not ( = ?auto_8342 ?auto_8344 ) ) ( not ( = ?auto_8340 ?auto_8343 ) ) ( not ( = ?auto_8341 ?auto_8343 ) ) ( not ( = ?auto_8342 ?auto_8343 ) ) ( not ( = ?auto_8344 ?auto_8343 ) ) ( ON ?auto_8343 ?auto_8344 ) ( CLEAR ?auto_8343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8340 ?auto_8341 ?auto_8342 ?auto_8344 )
      ( MAKE-3PILE ?auto_8340 ?auto_8341 ?auto_8342 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8347 - BLOCK
      ?auto_8348 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_8348 ) ( CLEAR ?auto_8347 ) ( ON-TABLE ?auto_8347 ) ( not ( = ?auto_8347 ?auto_8348 ) ) )
    :subtasks
    ( ( !STACK ?auto_8348 ?auto_8347 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8349 - BLOCK
      ?auto_8350 - BLOCK
    )
    :vars
    (
      ?auto_8351 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8349 ) ( ON-TABLE ?auto_8349 ) ( not ( = ?auto_8349 ?auto_8350 ) ) ( ON ?auto_8350 ?auto_8351 ) ( CLEAR ?auto_8350 ) ( HAND-EMPTY ) ( not ( = ?auto_8349 ?auto_8351 ) ) ( not ( = ?auto_8350 ?auto_8351 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8350 ?auto_8351 )
      ( MAKE-2PILE ?auto_8349 ?auto_8350 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8352 - BLOCK
      ?auto_8353 - BLOCK
    )
    :vars
    (
      ?auto_8354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8352 ?auto_8353 ) ) ( ON ?auto_8353 ?auto_8354 ) ( CLEAR ?auto_8353 ) ( not ( = ?auto_8352 ?auto_8354 ) ) ( not ( = ?auto_8353 ?auto_8354 ) ) ( HOLDING ?auto_8352 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8352 )
      ( MAKE-2PILE ?auto_8352 ?auto_8353 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8355 - BLOCK
      ?auto_8356 - BLOCK
    )
    :vars
    (
      ?auto_8357 - BLOCK
      ?auto_8359 - BLOCK
      ?auto_8358 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8355 ?auto_8356 ) ) ( ON ?auto_8356 ?auto_8357 ) ( not ( = ?auto_8355 ?auto_8357 ) ) ( not ( = ?auto_8356 ?auto_8357 ) ) ( ON ?auto_8355 ?auto_8356 ) ( CLEAR ?auto_8355 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8359 ) ( ON ?auto_8358 ?auto_8359 ) ( ON ?auto_8357 ?auto_8358 ) ( not ( = ?auto_8359 ?auto_8358 ) ) ( not ( = ?auto_8359 ?auto_8357 ) ) ( not ( = ?auto_8359 ?auto_8356 ) ) ( not ( = ?auto_8359 ?auto_8355 ) ) ( not ( = ?auto_8358 ?auto_8357 ) ) ( not ( = ?auto_8358 ?auto_8356 ) ) ( not ( = ?auto_8358 ?auto_8355 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8359 ?auto_8358 ?auto_8357 ?auto_8356 )
      ( MAKE-2PILE ?auto_8355 ?auto_8356 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8362 - BLOCK
      ?auto_8363 - BLOCK
    )
    :vars
    (
      ?auto_8364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8364 ?auto_8363 ) ( CLEAR ?auto_8364 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8362 ) ( ON ?auto_8363 ?auto_8362 ) ( not ( = ?auto_8362 ?auto_8363 ) ) ( not ( = ?auto_8362 ?auto_8364 ) ) ( not ( = ?auto_8363 ?auto_8364 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8364 ?auto_8363 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8365 - BLOCK
      ?auto_8366 - BLOCK
    )
    :vars
    (
      ?auto_8367 - BLOCK
      ?auto_8368 - BLOCK
      ?auto_8369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8367 ?auto_8366 ) ( CLEAR ?auto_8367 ) ( ON-TABLE ?auto_8365 ) ( ON ?auto_8366 ?auto_8365 ) ( not ( = ?auto_8365 ?auto_8366 ) ) ( not ( = ?auto_8365 ?auto_8367 ) ) ( not ( = ?auto_8366 ?auto_8367 ) ) ( HOLDING ?auto_8368 ) ( CLEAR ?auto_8369 ) ( not ( = ?auto_8365 ?auto_8368 ) ) ( not ( = ?auto_8365 ?auto_8369 ) ) ( not ( = ?auto_8366 ?auto_8368 ) ) ( not ( = ?auto_8366 ?auto_8369 ) ) ( not ( = ?auto_8367 ?auto_8368 ) ) ( not ( = ?auto_8367 ?auto_8369 ) ) ( not ( = ?auto_8368 ?auto_8369 ) ) )
    :subtasks
    ( ( !STACK ?auto_8368 ?auto_8369 )
      ( MAKE-2PILE ?auto_8365 ?auto_8366 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8370 - BLOCK
      ?auto_8371 - BLOCK
    )
    :vars
    (
      ?auto_8372 - BLOCK
      ?auto_8373 - BLOCK
      ?auto_8374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8372 ?auto_8371 ) ( ON-TABLE ?auto_8370 ) ( ON ?auto_8371 ?auto_8370 ) ( not ( = ?auto_8370 ?auto_8371 ) ) ( not ( = ?auto_8370 ?auto_8372 ) ) ( not ( = ?auto_8371 ?auto_8372 ) ) ( CLEAR ?auto_8373 ) ( not ( = ?auto_8370 ?auto_8374 ) ) ( not ( = ?auto_8370 ?auto_8373 ) ) ( not ( = ?auto_8371 ?auto_8374 ) ) ( not ( = ?auto_8371 ?auto_8373 ) ) ( not ( = ?auto_8372 ?auto_8374 ) ) ( not ( = ?auto_8372 ?auto_8373 ) ) ( not ( = ?auto_8374 ?auto_8373 ) ) ( ON ?auto_8374 ?auto_8372 ) ( CLEAR ?auto_8374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8370 ?auto_8371 ?auto_8372 )
      ( MAKE-2PILE ?auto_8370 ?auto_8371 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8375 - BLOCK
      ?auto_8376 - BLOCK
    )
    :vars
    (
      ?auto_8379 - BLOCK
      ?auto_8377 - BLOCK
      ?auto_8378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8379 ?auto_8376 ) ( ON-TABLE ?auto_8375 ) ( ON ?auto_8376 ?auto_8375 ) ( not ( = ?auto_8375 ?auto_8376 ) ) ( not ( = ?auto_8375 ?auto_8379 ) ) ( not ( = ?auto_8376 ?auto_8379 ) ) ( not ( = ?auto_8375 ?auto_8377 ) ) ( not ( = ?auto_8375 ?auto_8378 ) ) ( not ( = ?auto_8376 ?auto_8377 ) ) ( not ( = ?auto_8376 ?auto_8378 ) ) ( not ( = ?auto_8379 ?auto_8377 ) ) ( not ( = ?auto_8379 ?auto_8378 ) ) ( not ( = ?auto_8377 ?auto_8378 ) ) ( ON ?auto_8377 ?auto_8379 ) ( CLEAR ?auto_8377 ) ( HOLDING ?auto_8378 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8378 )
      ( MAKE-2PILE ?auto_8375 ?auto_8376 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8380 - BLOCK
      ?auto_8381 - BLOCK
    )
    :vars
    (
      ?auto_8382 - BLOCK
      ?auto_8383 - BLOCK
      ?auto_8384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8382 ?auto_8381 ) ( ON-TABLE ?auto_8380 ) ( ON ?auto_8381 ?auto_8380 ) ( not ( = ?auto_8380 ?auto_8381 ) ) ( not ( = ?auto_8380 ?auto_8382 ) ) ( not ( = ?auto_8381 ?auto_8382 ) ) ( not ( = ?auto_8380 ?auto_8383 ) ) ( not ( = ?auto_8380 ?auto_8384 ) ) ( not ( = ?auto_8381 ?auto_8383 ) ) ( not ( = ?auto_8381 ?auto_8384 ) ) ( not ( = ?auto_8382 ?auto_8383 ) ) ( not ( = ?auto_8382 ?auto_8384 ) ) ( not ( = ?auto_8383 ?auto_8384 ) ) ( ON ?auto_8383 ?auto_8382 ) ( ON ?auto_8384 ?auto_8383 ) ( CLEAR ?auto_8384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8380 ?auto_8381 ?auto_8382 ?auto_8383 )
      ( MAKE-2PILE ?auto_8380 ?auto_8381 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8388 - BLOCK
      ?auto_8389 - BLOCK
      ?auto_8390 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_8390 ) ( CLEAR ?auto_8389 ) ( ON-TABLE ?auto_8388 ) ( ON ?auto_8389 ?auto_8388 ) ( not ( = ?auto_8388 ?auto_8389 ) ) ( not ( = ?auto_8388 ?auto_8390 ) ) ( not ( = ?auto_8389 ?auto_8390 ) ) )
    :subtasks
    ( ( !STACK ?auto_8390 ?auto_8389 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8391 - BLOCK
      ?auto_8392 - BLOCK
      ?auto_8393 - BLOCK
    )
    :vars
    (
      ?auto_8394 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8392 ) ( ON-TABLE ?auto_8391 ) ( ON ?auto_8392 ?auto_8391 ) ( not ( = ?auto_8391 ?auto_8392 ) ) ( not ( = ?auto_8391 ?auto_8393 ) ) ( not ( = ?auto_8392 ?auto_8393 ) ) ( ON ?auto_8393 ?auto_8394 ) ( CLEAR ?auto_8393 ) ( HAND-EMPTY ) ( not ( = ?auto_8391 ?auto_8394 ) ) ( not ( = ?auto_8392 ?auto_8394 ) ) ( not ( = ?auto_8393 ?auto_8394 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8393 ?auto_8394 )
      ( MAKE-3PILE ?auto_8391 ?auto_8392 ?auto_8393 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8395 - BLOCK
      ?auto_8396 - BLOCK
      ?auto_8397 - BLOCK
    )
    :vars
    (
      ?auto_8398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8395 ) ( not ( = ?auto_8395 ?auto_8396 ) ) ( not ( = ?auto_8395 ?auto_8397 ) ) ( not ( = ?auto_8396 ?auto_8397 ) ) ( ON ?auto_8397 ?auto_8398 ) ( CLEAR ?auto_8397 ) ( not ( = ?auto_8395 ?auto_8398 ) ) ( not ( = ?auto_8396 ?auto_8398 ) ) ( not ( = ?auto_8397 ?auto_8398 ) ) ( HOLDING ?auto_8396 ) ( CLEAR ?auto_8395 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8395 ?auto_8396 )
      ( MAKE-3PILE ?auto_8395 ?auto_8396 ?auto_8397 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8399 - BLOCK
      ?auto_8400 - BLOCK
      ?auto_8401 - BLOCK
    )
    :vars
    (
      ?auto_8402 - BLOCK
      ?auto_8403 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8399 ) ( not ( = ?auto_8399 ?auto_8400 ) ) ( not ( = ?auto_8399 ?auto_8401 ) ) ( not ( = ?auto_8400 ?auto_8401 ) ) ( ON ?auto_8401 ?auto_8402 ) ( not ( = ?auto_8399 ?auto_8402 ) ) ( not ( = ?auto_8400 ?auto_8402 ) ) ( not ( = ?auto_8401 ?auto_8402 ) ) ( CLEAR ?auto_8399 ) ( ON ?auto_8400 ?auto_8401 ) ( CLEAR ?auto_8400 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8403 ) ( ON ?auto_8402 ?auto_8403 ) ( not ( = ?auto_8403 ?auto_8402 ) ) ( not ( = ?auto_8403 ?auto_8401 ) ) ( not ( = ?auto_8403 ?auto_8400 ) ) ( not ( = ?auto_8399 ?auto_8403 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8403 ?auto_8402 ?auto_8401 )
      ( MAKE-3PILE ?auto_8399 ?auto_8400 ?auto_8401 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8404 - BLOCK
      ?auto_8405 - BLOCK
      ?auto_8406 - BLOCK
    )
    :vars
    (
      ?auto_8408 - BLOCK
      ?auto_8407 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8404 ?auto_8405 ) ) ( not ( = ?auto_8404 ?auto_8406 ) ) ( not ( = ?auto_8405 ?auto_8406 ) ) ( ON ?auto_8406 ?auto_8408 ) ( not ( = ?auto_8404 ?auto_8408 ) ) ( not ( = ?auto_8405 ?auto_8408 ) ) ( not ( = ?auto_8406 ?auto_8408 ) ) ( ON ?auto_8405 ?auto_8406 ) ( CLEAR ?auto_8405 ) ( ON-TABLE ?auto_8407 ) ( ON ?auto_8408 ?auto_8407 ) ( not ( = ?auto_8407 ?auto_8408 ) ) ( not ( = ?auto_8407 ?auto_8406 ) ) ( not ( = ?auto_8407 ?auto_8405 ) ) ( not ( = ?auto_8404 ?auto_8407 ) ) ( HOLDING ?auto_8404 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8404 )
      ( MAKE-3PILE ?auto_8404 ?auto_8405 ?auto_8406 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8409 - BLOCK
      ?auto_8410 - BLOCK
      ?auto_8411 - BLOCK
    )
    :vars
    (
      ?auto_8413 - BLOCK
      ?auto_8412 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8409 ?auto_8410 ) ) ( not ( = ?auto_8409 ?auto_8411 ) ) ( not ( = ?auto_8410 ?auto_8411 ) ) ( ON ?auto_8411 ?auto_8413 ) ( not ( = ?auto_8409 ?auto_8413 ) ) ( not ( = ?auto_8410 ?auto_8413 ) ) ( not ( = ?auto_8411 ?auto_8413 ) ) ( ON ?auto_8410 ?auto_8411 ) ( ON-TABLE ?auto_8412 ) ( ON ?auto_8413 ?auto_8412 ) ( not ( = ?auto_8412 ?auto_8413 ) ) ( not ( = ?auto_8412 ?auto_8411 ) ) ( not ( = ?auto_8412 ?auto_8410 ) ) ( not ( = ?auto_8409 ?auto_8412 ) ) ( ON ?auto_8409 ?auto_8410 ) ( CLEAR ?auto_8409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8412 ?auto_8413 ?auto_8411 ?auto_8410 )
      ( MAKE-3PILE ?auto_8409 ?auto_8410 ?auto_8411 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8415 - BLOCK
    )
    :vars
    (
      ?auto_8416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8416 ?auto_8415 ) ( CLEAR ?auto_8416 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8415 ) ( not ( = ?auto_8415 ?auto_8416 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8416 ?auto_8415 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8417 - BLOCK
    )
    :vars
    (
      ?auto_8418 - BLOCK
      ?auto_8419 - BLOCK
      ?auto_8420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8418 ?auto_8417 ) ( CLEAR ?auto_8418 ) ( ON-TABLE ?auto_8417 ) ( not ( = ?auto_8417 ?auto_8418 ) ) ( HOLDING ?auto_8419 ) ( CLEAR ?auto_8420 ) ( not ( = ?auto_8417 ?auto_8419 ) ) ( not ( = ?auto_8417 ?auto_8420 ) ) ( not ( = ?auto_8418 ?auto_8419 ) ) ( not ( = ?auto_8418 ?auto_8420 ) ) ( not ( = ?auto_8419 ?auto_8420 ) ) )
    :subtasks
    ( ( !STACK ?auto_8419 ?auto_8420 )
      ( MAKE-1PILE ?auto_8417 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8421 - BLOCK
    )
    :vars
    (
      ?auto_8424 - BLOCK
      ?auto_8423 - BLOCK
      ?auto_8422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8424 ?auto_8421 ) ( ON-TABLE ?auto_8421 ) ( not ( = ?auto_8421 ?auto_8424 ) ) ( CLEAR ?auto_8423 ) ( not ( = ?auto_8421 ?auto_8422 ) ) ( not ( = ?auto_8421 ?auto_8423 ) ) ( not ( = ?auto_8424 ?auto_8422 ) ) ( not ( = ?auto_8424 ?auto_8423 ) ) ( not ( = ?auto_8422 ?auto_8423 ) ) ( ON ?auto_8422 ?auto_8424 ) ( CLEAR ?auto_8422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8421 ?auto_8424 )
      ( MAKE-1PILE ?auto_8421 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8425 - BLOCK
    )
    :vars
    (
      ?auto_8427 - BLOCK
      ?auto_8426 - BLOCK
      ?auto_8428 - BLOCK
      ?auto_8429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8427 ?auto_8425 ) ( ON-TABLE ?auto_8425 ) ( not ( = ?auto_8425 ?auto_8427 ) ) ( not ( = ?auto_8425 ?auto_8426 ) ) ( not ( = ?auto_8425 ?auto_8428 ) ) ( not ( = ?auto_8427 ?auto_8426 ) ) ( not ( = ?auto_8427 ?auto_8428 ) ) ( not ( = ?auto_8426 ?auto_8428 ) ) ( ON ?auto_8426 ?auto_8427 ) ( CLEAR ?auto_8426 ) ( HOLDING ?auto_8428 ) ( CLEAR ?auto_8429 ) ( ON-TABLE ?auto_8429 ) ( not ( = ?auto_8429 ?auto_8428 ) ) ( not ( = ?auto_8425 ?auto_8429 ) ) ( not ( = ?auto_8427 ?auto_8429 ) ) ( not ( = ?auto_8426 ?auto_8429 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8429 ?auto_8428 )
      ( MAKE-1PILE ?auto_8425 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8430 - BLOCK
    )
    :vars
    (
      ?auto_8432 - BLOCK
      ?auto_8431 - BLOCK
      ?auto_8433 - BLOCK
      ?auto_8434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8432 ?auto_8430 ) ( ON-TABLE ?auto_8430 ) ( not ( = ?auto_8430 ?auto_8432 ) ) ( not ( = ?auto_8430 ?auto_8431 ) ) ( not ( = ?auto_8430 ?auto_8433 ) ) ( not ( = ?auto_8432 ?auto_8431 ) ) ( not ( = ?auto_8432 ?auto_8433 ) ) ( not ( = ?auto_8431 ?auto_8433 ) ) ( ON ?auto_8431 ?auto_8432 ) ( CLEAR ?auto_8434 ) ( ON-TABLE ?auto_8434 ) ( not ( = ?auto_8434 ?auto_8433 ) ) ( not ( = ?auto_8430 ?auto_8434 ) ) ( not ( = ?auto_8432 ?auto_8434 ) ) ( not ( = ?auto_8431 ?auto_8434 ) ) ( ON ?auto_8433 ?auto_8431 ) ( CLEAR ?auto_8433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8430 ?auto_8432 ?auto_8431 )
      ( MAKE-1PILE ?auto_8430 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8435 - BLOCK
    )
    :vars
    (
      ?auto_8438 - BLOCK
      ?auto_8439 - BLOCK
      ?auto_8437 - BLOCK
      ?auto_8436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8438 ?auto_8435 ) ( ON-TABLE ?auto_8435 ) ( not ( = ?auto_8435 ?auto_8438 ) ) ( not ( = ?auto_8435 ?auto_8439 ) ) ( not ( = ?auto_8435 ?auto_8437 ) ) ( not ( = ?auto_8438 ?auto_8439 ) ) ( not ( = ?auto_8438 ?auto_8437 ) ) ( not ( = ?auto_8439 ?auto_8437 ) ) ( ON ?auto_8439 ?auto_8438 ) ( not ( = ?auto_8436 ?auto_8437 ) ) ( not ( = ?auto_8435 ?auto_8436 ) ) ( not ( = ?auto_8438 ?auto_8436 ) ) ( not ( = ?auto_8439 ?auto_8436 ) ) ( ON ?auto_8437 ?auto_8439 ) ( CLEAR ?auto_8437 ) ( HOLDING ?auto_8436 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8436 )
      ( MAKE-1PILE ?auto_8435 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8440 - BLOCK
    )
    :vars
    (
      ?auto_8443 - BLOCK
      ?auto_8444 - BLOCK
      ?auto_8441 - BLOCK
      ?auto_8442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8443 ?auto_8440 ) ( ON-TABLE ?auto_8440 ) ( not ( = ?auto_8440 ?auto_8443 ) ) ( not ( = ?auto_8440 ?auto_8444 ) ) ( not ( = ?auto_8440 ?auto_8441 ) ) ( not ( = ?auto_8443 ?auto_8444 ) ) ( not ( = ?auto_8443 ?auto_8441 ) ) ( not ( = ?auto_8444 ?auto_8441 ) ) ( ON ?auto_8444 ?auto_8443 ) ( not ( = ?auto_8442 ?auto_8441 ) ) ( not ( = ?auto_8440 ?auto_8442 ) ) ( not ( = ?auto_8443 ?auto_8442 ) ) ( not ( = ?auto_8444 ?auto_8442 ) ) ( ON ?auto_8441 ?auto_8444 ) ( ON ?auto_8442 ?auto_8441 ) ( CLEAR ?auto_8442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8440 ?auto_8443 ?auto_8444 ?auto_8441 )
      ( MAKE-1PILE ?auto_8440 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8449 - BLOCK
      ?auto_8450 - BLOCK
      ?auto_8451 - BLOCK
      ?auto_8452 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_8452 ) ( CLEAR ?auto_8451 ) ( ON-TABLE ?auto_8449 ) ( ON ?auto_8450 ?auto_8449 ) ( ON ?auto_8451 ?auto_8450 ) ( not ( = ?auto_8449 ?auto_8450 ) ) ( not ( = ?auto_8449 ?auto_8451 ) ) ( not ( = ?auto_8449 ?auto_8452 ) ) ( not ( = ?auto_8450 ?auto_8451 ) ) ( not ( = ?auto_8450 ?auto_8452 ) ) ( not ( = ?auto_8451 ?auto_8452 ) ) )
    :subtasks
    ( ( !STACK ?auto_8452 ?auto_8451 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8453 - BLOCK
      ?auto_8454 - BLOCK
      ?auto_8455 - BLOCK
      ?auto_8456 - BLOCK
    )
    :vars
    (
      ?auto_8457 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8455 ) ( ON-TABLE ?auto_8453 ) ( ON ?auto_8454 ?auto_8453 ) ( ON ?auto_8455 ?auto_8454 ) ( not ( = ?auto_8453 ?auto_8454 ) ) ( not ( = ?auto_8453 ?auto_8455 ) ) ( not ( = ?auto_8453 ?auto_8456 ) ) ( not ( = ?auto_8454 ?auto_8455 ) ) ( not ( = ?auto_8454 ?auto_8456 ) ) ( not ( = ?auto_8455 ?auto_8456 ) ) ( ON ?auto_8456 ?auto_8457 ) ( CLEAR ?auto_8456 ) ( HAND-EMPTY ) ( not ( = ?auto_8453 ?auto_8457 ) ) ( not ( = ?auto_8454 ?auto_8457 ) ) ( not ( = ?auto_8455 ?auto_8457 ) ) ( not ( = ?auto_8456 ?auto_8457 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8456 ?auto_8457 )
      ( MAKE-4PILE ?auto_8453 ?auto_8454 ?auto_8455 ?auto_8456 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8458 - BLOCK
      ?auto_8459 - BLOCK
      ?auto_8460 - BLOCK
      ?auto_8461 - BLOCK
    )
    :vars
    (
      ?auto_8462 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8458 ) ( ON ?auto_8459 ?auto_8458 ) ( not ( = ?auto_8458 ?auto_8459 ) ) ( not ( = ?auto_8458 ?auto_8460 ) ) ( not ( = ?auto_8458 ?auto_8461 ) ) ( not ( = ?auto_8459 ?auto_8460 ) ) ( not ( = ?auto_8459 ?auto_8461 ) ) ( not ( = ?auto_8460 ?auto_8461 ) ) ( ON ?auto_8461 ?auto_8462 ) ( CLEAR ?auto_8461 ) ( not ( = ?auto_8458 ?auto_8462 ) ) ( not ( = ?auto_8459 ?auto_8462 ) ) ( not ( = ?auto_8460 ?auto_8462 ) ) ( not ( = ?auto_8461 ?auto_8462 ) ) ( HOLDING ?auto_8460 ) ( CLEAR ?auto_8459 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8458 ?auto_8459 ?auto_8460 )
      ( MAKE-4PILE ?auto_8458 ?auto_8459 ?auto_8460 ?auto_8461 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8463 - BLOCK
      ?auto_8464 - BLOCK
      ?auto_8465 - BLOCK
      ?auto_8466 - BLOCK
    )
    :vars
    (
      ?auto_8467 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8463 ) ( ON ?auto_8464 ?auto_8463 ) ( not ( = ?auto_8463 ?auto_8464 ) ) ( not ( = ?auto_8463 ?auto_8465 ) ) ( not ( = ?auto_8463 ?auto_8466 ) ) ( not ( = ?auto_8464 ?auto_8465 ) ) ( not ( = ?auto_8464 ?auto_8466 ) ) ( not ( = ?auto_8465 ?auto_8466 ) ) ( ON ?auto_8466 ?auto_8467 ) ( not ( = ?auto_8463 ?auto_8467 ) ) ( not ( = ?auto_8464 ?auto_8467 ) ) ( not ( = ?auto_8465 ?auto_8467 ) ) ( not ( = ?auto_8466 ?auto_8467 ) ) ( CLEAR ?auto_8464 ) ( ON ?auto_8465 ?auto_8466 ) ( CLEAR ?auto_8465 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8467 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8467 ?auto_8466 )
      ( MAKE-4PILE ?auto_8463 ?auto_8464 ?auto_8465 ?auto_8466 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8468 - BLOCK
      ?auto_8469 - BLOCK
      ?auto_8470 - BLOCK
      ?auto_8471 - BLOCK
    )
    :vars
    (
      ?auto_8472 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8468 ) ( not ( = ?auto_8468 ?auto_8469 ) ) ( not ( = ?auto_8468 ?auto_8470 ) ) ( not ( = ?auto_8468 ?auto_8471 ) ) ( not ( = ?auto_8469 ?auto_8470 ) ) ( not ( = ?auto_8469 ?auto_8471 ) ) ( not ( = ?auto_8470 ?auto_8471 ) ) ( ON ?auto_8471 ?auto_8472 ) ( not ( = ?auto_8468 ?auto_8472 ) ) ( not ( = ?auto_8469 ?auto_8472 ) ) ( not ( = ?auto_8470 ?auto_8472 ) ) ( not ( = ?auto_8471 ?auto_8472 ) ) ( ON ?auto_8470 ?auto_8471 ) ( CLEAR ?auto_8470 ) ( ON-TABLE ?auto_8472 ) ( HOLDING ?auto_8469 ) ( CLEAR ?auto_8468 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8468 ?auto_8469 )
      ( MAKE-4PILE ?auto_8468 ?auto_8469 ?auto_8470 ?auto_8471 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8473 - BLOCK
      ?auto_8474 - BLOCK
      ?auto_8475 - BLOCK
      ?auto_8476 - BLOCK
    )
    :vars
    (
      ?auto_8477 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8473 ) ( not ( = ?auto_8473 ?auto_8474 ) ) ( not ( = ?auto_8473 ?auto_8475 ) ) ( not ( = ?auto_8473 ?auto_8476 ) ) ( not ( = ?auto_8474 ?auto_8475 ) ) ( not ( = ?auto_8474 ?auto_8476 ) ) ( not ( = ?auto_8475 ?auto_8476 ) ) ( ON ?auto_8476 ?auto_8477 ) ( not ( = ?auto_8473 ?auto_8477 ) ) ( not ( = ?auto_8474 ?auto_8477 ) ) ( not ( = ?auto_8475 ?auto_8477 ) ) ( not ( = ?auto_8476 ?auto_8477 ) ) ( ON ?auto_8475 ?auto_8476 ) ( ON-TABLE ?auto_8477 ) ( CLEAR ?auto_8473 ) ( ON ?auto_8474 ?auto_8475 ) ( CLEAR ?auto_8474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8477 ?auto_8476 ?auto_8475 )
      ( MAKE-4PILE ?auto_8473 ?auto_8474 ?auto_8475 ?auto_8476 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8478 - BLOCK
      ?auto_8479 - BLOCK
      ?auto_8480 - BLOCK
      ?auto_8481 - BLOCK
    )
    :vars
    (
      ?auto_8482 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8478 ?auto_8479 ) ) ( not ( = ?auto_8478 ?auto_8480 ) ) ( not ( = ?auto_8478 ?auto_8481 ) ) ( not ( = ?auto_8479 ?auto_8480 ) ) ( not ( = ?auto_8479 ?auto_8481 ) ) ( not ( = ?auto_8480 ?auto_8481 ) ) ( ON ?auto_8481 ?auto_8482 ) ( not ( = ?auto_8478 ?auto_8482 ) ) ( not ( = ?auto_8479 ?auto_8482 ) ) ( not ( = ?auto_8480 ?auto_8482 ) ) ( not ( = ?auto_8481 ?auto_8482 ) ) ( ON ?auto_8480 ?auto_8481 ) ( ON-TABLE ?auto_8482 ) ( ON ?auto_8479 ?auto_8480 ) ( CLEAR ?auto_8479 ) ( HOLDING ?auto_8478 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8478 )
      ( MAKE-4PILE ?auto_8478 ?auto_8479 ?auto_8480 ?auto_8481 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8483 - BLOCK
      ?auto_8484 - BLOCK
      ?auto_8485 - BLOCK
      ?auto_8486 - BLOCK
    )
    :vars
    (
      ?auto_8487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8483 ?auto_8484 ) ) ( not ( = ?auto_8483 ?auto_8485 ) ) ( not ( = ?auto_8483 ?auto_8486 ) ) ( not ( = ?auto_8484 ?auto_8485 ) ) ( not ( = ?auto_8484 ?auto_8486 ) ) ( not ( = ?auto_8485 ?auto_8486 ) ) ( ON ?auto_8486 ?auto_8487 ) ( not ( = ?auto_8483 ?auto_8487 ) ) ( not ( = ?auto_8484 ?auto_8487 ) ) ( not ( = ?auto_8485 ?auto_8487 ) ) ( not ( = ?auto_8486 ?auto_8487 ) ) ( ON ?auto_8485 ?auto_8486 ) ( ON-TABLE ?auto_8487 ) ( ON ?auto_8484 ?auto_8485 ) ( ON ?auto_8483 ?auto_8484 ) ( CLEAR ?auto_8483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8487 ?auto_8486 ?auto_8485 ?auto_8484 )
      ( MAKE-4PILE ?auto_8483 ?auto_8484 ?auto_8485 ?auto_8486 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8491 - BLOCK
      ?auto_8492 - BLOCK
      ?auto_8493 - BLOCK
    )
    :vars
    (
      ?auto_8494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8494 ?auto_8493 ) ( CLEAR ?auto_8494 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8491 ) ( ON ?auto_8492 ?auto_8491 ) ( ON ?auto_8493 ?auto_8492 ) ( not ( = ?auto_8491 ?auto_8492 ) ) ( not ( = ?auto_8491 ?auto_8493 ) ) ( not ( = ?auto_8491 ?auto_8494 ) ) ( not ( = ?auto_8492 ?auto_8493 ) ) ( not ( = ?auto_8492 ?auto_8494 ) ) ( not ( = ?auto_8493 ?auto_8494 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8494 ?auto_8493 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8504 - BLOCK
      ?auto_8505 - BLOCK
      ?auto_8506 - BLOCK
    )
    :vars
    (
      ?auto_8507 - BLOCK
      ?auto_8508 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8504 ) ( ON ?auto_8505 ?auto_8504 ) ( not ( = ?auto_8504 ?auto_8505 ) ) ( not ( = ?auto_8504 ?auto_8506 ) ) ( not ( = ?auto_8504 ?auto_8507 ) ) ( not ( = ?auto_8505 ?auto_8506 ) ) ( not ( = ?auto_8505 ?auto_8507 ) ) ( not ( = ?auto_8506 ?auto_8507 ) ) ( ON ?auto_8507 ?auto_8508 ) ( CLEAR ?auto_8507 ) ( not ( = ?auto_8504 ?auto_8508 ) ) ( not ( = ?auto_8505 ?auto_8508 ) ) ( not ( = ?auto_8506 ?auto_8508 ) ) ( not ( = ?auto_8507 ?auto_8508 ) ) ( HOLDING ?auto_8506 ) ( CLEAR ?auto_8505 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8504 ?auto_8505 ?auto_8506 ?auto_8507 )
      ( MAKE-3PILE ?auto_8504 ?auto_8505 ?auto_8506 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8509 - BLOCK
      ?auto_8510 - BLOCK
      ?auto_8511 - BLOCK
    )
    :vars
    (
      ?auto_8512 - BLOCK
      ?auto_8513 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8509 ) ( ON ?auto_8510 ?auto_8509 ) ( not ( = ?auto_8509 ?auto_8510 ) ) ( not ( = ?auto_8509 ?auto_8511 ) ) ( not ( = ?auto_8509 ?auto_8512 ) ) ( not ( = ?auto_8510 ?auto_8511 ) ) ( not ( = ?auto_8510 ?auto_8512 ) ) ( not ( = ?auto_8511 ?auto_8512 ) ) ( ON ?auto_8512 ?auto_8513 ) ( not ( = ?auto_8509 ?auto_8513 ) ) ( not ( = ?auto_8510 ?auto_8513 ) ) ( not ( = ?auto_8511 ?auto_8513 ) ) ( not ( = ?auto_8512 ?auto_8513 ) ) ( CLEAR ?auto_8510 ) ( ON ?auto_8511 ?auto_8512 ) ( CLEAR ?auto_8511 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8513 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8513 ?auto_8512 )
      ( MAKE-3PILE ?auto_8509 ?auto_8510 ?auto_8511 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8514 - BLOCK
      ?auto_8515 - BLOCK
      ?auto_8516 - BLOCK
    )
    :vars
    (
      ?auto_8518 - BLOCK
      ?auto_8517 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8514 ) ( not ( = ?auto_8514 ?auto_8515 ) ) ( not ( = ?auto_8514 ?auto_8516 ) ) ( not ( = ?auto_8514 ?auto_8518 ) ) ( not ( = ?auto_8515 ?auto_8516 ) ) ( not ( = ?auto_8515 ?auto_8518 ) ) ( not ( = ?auto_8516 ?auto_8518 ) ) ( ON ?auto_8518 ?auto_8517 ) ( not ( = ?auto_8514 ?auto_8517 ) ) ( not ( = ?auto_8515 ?auto_8517 ) ) ( not ( = ?auto_8516 ?auto_8517 ) ) ( not ( = ?auto_8518 ?auto_8517 ) ) ( ON ?auto_8516 ?auto_8518 ) ( CLEAR ?auto_8516 ) ( ON-TABLE ?auto_8517 ) ( HOLDING ?auto_8515 ) ( CLEAR ?auto_8514 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8514 ?auto_8515 )
      ( MAKE-3PILE ?auto_8514 ?auto_8515 ?auto_8516 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8519 - BLOCK
      ?auto_8520 - BLOCK
      ?auto_8521 - BLOCK
    )
    :vars
    (
      ?auto_8523 - BLOCK
      ?auto_8522 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8519 ) ( not ( = ?auto_8519 ?auto_8520 ) ) ( not ( = ?auto_8519 ?auto_8521 ) ) ( not ( = ?auto_8519 ?auto_8523 ) ) ( not ( = ?auto_8520 ?auto_8521 ) ) ( not ( = ?auto_8520 ?auto_8523 ) ) ( not ( = ?auto_8521 ?auto_8523 ) ) ( ON ?auto_8523 ?auto_8522 ) ( not ( = ?auto_8519 ?auto_8522 ) ) ( not ( = ?auto_8520 ?auto_8522 ) ) ( not ( = ?auto_8521 ?auto_8522 ) ) ( not ( = ?auto_8523 ?auto_8522 ) ) ( ON ?auto_8521 ?auto_8523 ) ( ON-TABLE ?auto_8522 ) ( CLEAR ?auto_8519 ) ( ON ?auto_8520 ?auto_8521 ) ( CLEAR ?auto_8520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8522 ?auto_8523 ?auto_8521 )
      ( MAKE-3PILE ?auto_8519 ?auto_8520 ?auto_8521 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8524 - BLOCK
      ?auto_8525 - BLOCK
      ?auto_8526 - BLOCK
    )
    :vars
    (
      ?auto_8527 - BLOCK
      ?auto_8528 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8524 ?auto_8525 ) ) ( not ( = ?auto_8524 ?auto_8526 ) ) ( not ( = ?auto_8524 ?auto_8527 ) ) ( not ( = ?auto_8525 ?auto_8526 ) ) ( not ( = ?auto_8525 ?auto_8527 ) ) ( not ( = ?auto_8526 ?auto_8527 ) ) ( ON ?auto_8527 ?auto_8528 ) ( not ( = ?auto_8524 ?auto_8528 ) ) ( not ( = ?auto_8525 ?auto_8528 ) ) ( not ( = ?auto_8526 ?auto_8528 ) ) ( not ( = ?auto_8527 ?auto_8528 ) ) ( ON ?auto_8526 ?auto_8527 ) ( ON-TABLE ?auto_8528 ) ( ON ?auto_8525 ?auto_8526 ) ( CLEAR ?auto_8525 ) ( HOLDING ?auto_8524 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8524 )
      ( MAKE-3PILE ?auto_8524 ?auto_8525 ?auto_8526 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8529 - BLOCK
      ?auto_8530 - BLOCK
      ?auto_8531 - BLOCK
    )
    :vars
    (
      ?auto_8533 - BLOCK
      ?auto_8532 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8529 ?auto_8530 ) ) ( not ( = ?auto_8529 ?auto_8531 ) ) ( not ( = ?auto_8529 ?auto_8533 ) ) ( not ( = ?auto_8530 ?auto_8531 ) ) ( not ( = ?auto_8530 ?auto_8533 ) ) ( not ( = ?auto_8531 ?auto_8533 ) ) ( ON ?auto_8533 ?auto_8532 ) ( not ( = ?auto_8529 ?auto_8532 ) ) ( not ( = ?auto_8530 ?auto_8532 ) ) ( not ( = ?auto_8531 ?auto_8532 ) ) ( not ( = ?auto_8533 ?auto_8532 ) ) ( ON ?auto_8531 ?auto_8533 ) ( ON-TABLE ?auto_8532 ) ( ON ?auto_8530 ?auto_8531 ) ( ON ?auto_8529 ?auto_8530 ) ( CLEAR ?auto_8529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8532 ?auto_8533 ?auto_8531 ?auto_8530 )
      ( MAKE-3PILE ?auto_8529 ?auto_8530 ?auto_8531 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8535 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_8535 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_8535 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8536 - BLOCK
    )
    :vars
    (
      ?auto_8537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8536 ?auto_8537 ) ( CLEAR ?auto_8536 ) ( HAND-EMPTY ) ( not ( = ?auto_8536 ?auto_8537 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8536 ?auto_8537 )
      ( MAKE-1PILE ?auto_8536 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8538 - BLOCK
    )
    :vars
    (
      ?auto_8539 - BLOCK
      ?auto_8541 - BLOCK
      ?auto_8540 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8538 ?auto_8539 ) ) ( HOLDING ?auto_8538 ) ( CLEAR ?auto_8539 ) ( ON-TABLE ?auto_8541 ) ( ON ?auto_8540 ?auto_8541 ) ( ON ?auto_8539 ?auto_8540 ) ( not ( = ?auto_8541 ?auto_8540 ) ) ( not ( = ?auto_8541 ?auto_8539 ) ) ( not ( = ?auto_8541 ?auto_8538 ) ) ( not ( = ?auto_8540 ?auto_8539 ) ) ( not ( = ?auto_8540 ?auto_8538 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8541 ?auto_8540 ?auto_8539 ?auto_8538 )
      ( MAKE-1PILE ?auto_8538 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8542 - BLOCK
    )
    :vars
    (
      ?auto_8543 - BLOCK
      ?auto_8544 - BLOCK
      ?auto_8545 - BLOCK
      ?auto_8546 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8542 ?auto_8543 ) ) ( CLEAR ?auto_8543 ) ( ON-TABLE ?auto_8544 ) ( ON ?auto_8545 ?auto_8544 ) ( ON ?auto_8543 ?auto_8545 ) ( not ( = ?auto_8544 ?auto_8545 ) ) ( not ( = ?auto_8544 ?auto_8543 ) ) ( not ( = ?auto_8544 ?auto_8542 ) ) ( not ( = ?auto_8545 ?auto_8543 ) ) ( not ( = ?auto_8545 ?auto_8542 ) ) ( ON ?auto_8542 ?auto_8546 ) ( CLEAR ?auto_8542 ) ( HAND-EMPTY ) ( not ( = ?auto_8542 ?auto_8546 ) ) ( not ( = ?auto_8543 ?auto_8546 ) ) ( not ( = ?auto_8544 ?auto_8546 ) ) ( not ( = ?auto_8545 ?auto_8546 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8542 ?auto_8546 )
      ( MAKE-1PILE ?auto_8542 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8547 - BLOCK
    )
    :vars
    (
      ?auto_8550 - BLOCK
      ?auto_8548 - BLOCK
      ?auto_8551 - BLOCK
      ?auto_8549 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8547 ?auto_8550 ) ) ( ON-TABLE ?auto_8548 ) ( ON ?auto_8551 ?auto_8548 ) ( not ( = ?auto_8548 ?auto_8551 ) ) ( not ( = ?auto_8548 ?auto_8550 ) ) ( not ( = ?auto_8548 ?auto_8547 ) ) ( not ( = ?auto_8551 ?auto_8550 ) ) ( not ( = ?auto_8551 ?auto_8547 ) ) ( ON ?auto_8547 ?auto_8549 ) ( CLEAR ?auto_8547 ) ( not ( = ?auto_8547 ?auto_8549 ) ) ( not ( = ?auto_8550 ?auto_8549 ) ) ( not ( = ?auto_8548 ?auto_8549 ) ) ( not ( = ?auto_8551 ?auto_8549 ) ) ( HOLDING ?auto_8550 ) ( CLEAR ?auto_8551 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8548 ?auto_8551 ?auto_8550 )
      ( MAKE-1PILE ?auto_8547 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8552 - BLOCK
    )
    :vars
    (
      ?auto_8553 - BLOCK
      ?auto_8556 - BLOCK
      ?auto_8555 - BLOCK
      ?auto_8554 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8552 ?auto_8553 ) ) ( ON-TABLE ?auto_8556 ) ( ON ?auto_8555 ?auto_8556 ) ( not ( = ?auto_8556 ?auto_8555 ) ) ( not ( = ?auto_8556 ?auto_8553 ) ) ( not ( = ?auto_8556 ?auto_8552 ) ) ( not ( = ?auto_8555 ?auto_8553 ) ) ( not ( = ?auto_8555 ?auto_8552 ) ) ( ON ?auto_8552 ?auto_8554 ) ( not ( = ?auto_8552 ?auto_8554 ) ) ( not ( = ?auto_8553 ?auto_8554 ) ) ( not ( = ?auto_8556 ?auto_8554 ) ) ( not ( = ?auto_8555 ?auto_8554 ) ) ( CLEAR ?auto_8555 ) ( ON ?auto_8553 ?auto_8552 ) ( CLEAR ?auto_8553 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8554 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8554 ?auto_8552 )
      ( MAKE-1PILE ?auto_8552 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8557 - BLOCK
    )
    :vars
    (
      ?auto_8558 - BLOCK
      ?auto_8560 - BLOCK
      ?auto_8561 - BLOCK
      ?auto_8559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8557 ?auto_8558 ) ) ( ON-TABLE ?auto_8560 ) ( not ( = ?auto_8560 ?auto_8561 ) ) ( not ( = ?auto_8560 ?auto_8558 ) ) ( not ( = ?auto_8560 ?auto_8557 ) ) ( not ( = ?auto_8561 ?auto_8558 ) ) ( not ( = ?auto_8561 ?auto_8557 ) ) ( ON ?auto_8557 ?auto_8559 ) ( not ( = ?auto_8557 ?auto_8559 ) ) ( not ( = ?auto_8558 ?auto_8559 ) ) ( not ( = ?auto_8560 ?auto_8559 ) ) ( not ( = ?auto_8561 ?auto_8559 ) ) ( ON ?auto_8558 ?auto_8557 ) ( CLEAR ?auto_8558 ) ( ON-TABLE ?auto_8559 ) ( HOLDING ?auto_8561 ) ( CLEAR ?auto_8560 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8560 ?auto_8561 )
      ( MAKE-1PILE ?auto_8557 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8562 - BLOCK
    )
    :vars
    (
      ?auto_8564 - BLOCK
      ?auto_8563 - BLOCK
      ?auto_8566 - BLOCK
      ?auto_8565 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8562 ?auto_8564 ) ) ( ON-TABLE ?auto_8563 ) ( not ( = ?auto_8563 ?auto_8566 ) ) ( not ( = ?auto_8563 ?auto_8564 ) ) ( not ( = ?auto_8563 ?auto_8562 ) ) ( not ( = ?auto_8566 ?auto_8564 ) ) ( not ( = ?auto_8566 ?auto_8562 ) ) ( ON ?auto_8562 ?auto_8565 ) ( not ( = ?auto_8562 ?auto_8565 ) ) ( not ( = ?auto_8564 ?auto_8565 ) ) ( not ( = ?auto_8563 ?auto_8565 ) ) ( not ( = ?auto_8566 ?auto_8565 ) ) ( ON ?auto_8564 ?auto_8562 ) ( ON-TABLE ?auto_8565 ) ( CLEAR ?auto_8563 ) ( ON ?auto_8566 ?auto_8564 ) ( CLEAR ?auto_8566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8565 ?auto_8562 ?auto_8564 )
      ( MAKE-1PILE ?auto_8562 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8567 - BLOCK
    )
    :vars
    (
      ?auto_8570 - BLOCK
      ?auto_8568 - BLOCK
      ?auto_8571 - BLOCK
      ?auto_8569 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8567 ?auto_8570 ) ) ( not ( = ?auto_8568 ?auto_8571 ) ) ( not ( = ?auto_8568 ?auto_8570 ) ) ( not ( = ?auto_8568 ?auto_8567 ) ) ( not ( = ?auto_8571 ?auto_8570 ) ) ( not ( = ?auto_8571 ?auto_8567 ) ) ( ON ?auto_8567 ?auto_8569 ) ( not ( = ?auto_8567 ?auto_8569 ) ) ( not ( = ?auto_8570 ?auto_8569 ) ) ( not ( = ?auto_8568 ?auto_8569 ) ) ( not ( = ?auto_8571 ?auto_8569 ) ) ( ON ?auto_8570 ?auto_8567 ) ( ON-TABLE ?auto_8569 ) ( ON ?auto_8571 ?auto_8570 ) ( CLEAR ?auto_8571 ) ( HOLDING ?auto_8568 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8568 )
      ( MAKE-1PILE ?auto_8567 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8572 - BLOCK
    )
    :vars
    (
      ?auto_8573 - BLOCK
      ?auto_8575 - BLOCK
      ?auto_8576 - BLOCK
      ?auto_8574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8572 ?auto_8573 ) ) ( not ( = ?auto_8575 ?auto_8576 ) ) ( not ( = ?auto_8575 ?auto_8573 ) ) ( not ( = ?auto_8575 ?auto_8572 ) ) ( not ( = ?auto_8576 ?auto_8573 ) ) ( not ( = ?auto_8576 ?auto_8572 ) ) ( ON ?auto_8572 ?auto_8574 ) ( not ( = ?auto_8572 ?auto_8574 ) ) ( not ( = ?auto_8573 ?auto_8574 ) ) ( not ( = ?auto_8575 ?auto_8574 ) ) ( not ( = ?auto_8576 ?auto_8574 ) ) ( ON ?auto_8573 ?auto_8572 ) ( ON-TABLE ?auto_8574 ) ( ON ?auto_8576 ?auto_8573 ) ( ON ?auto_8575 ?auto_8576 ) ( CLEAR ?auto_8575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8574 ?auto_8572 ?auto_8573 ?auto_8576 )
      ( MAKE-1PILE ?auto_8572 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8579 - BLOCK
      ?auto_8580 - BLOCK
    )
    :vars
    (
      ?auto_8581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8581 ?auto_8580 ) ( CLEAR ?auto_8581 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8579 ) ( ON ?auto_8580 ?auto_8579 ) ( not ( = ?auto_8579 ?auto_8580 ) ) ( not ( = ?auto_8579 ?auto_8581 ) ) ( not ( = ?auto_8580 ?auto_8581 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8581 ?auto_8580 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8582 - BLOCK
      ?auto_8583 - BLOCK
    )
    :vars
    (
      ?auto_8584 - BLOCK
      ?auto_8585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8584 ?auto_8583 ) ( CLEAR ?auto_8584 ) ( ON-TABLE ?auto_8582 ) ( ON ?auto_8583 ?auto_8582 ) ( not ( = ?auto_8582 ?auto_8583 ) ) ( not ( = ?auto_8582 ?auto_8584 ) ) ( not ( = ?auto_8583 ?auto_8584 ) ) ( HOLDING ?auto_8585 ) ( not ( = ?auto_8582 ?auto_8585 ) ) ( not ( = ?auto_8583 ?auto_8585 ) ) ( not ( = ?auto_8584 ?auto_8585 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_8585 )
      ( MAKE-2PILE ?auto_8582 ?auto_8583 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8586 - BLOCK
      ?auto_8587 - BLOCK
    )
    :vars
    (
      ?auto_8589 - BLOCK
      ?auto_8588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8589 ?auto_8587 ) ( ON-TABLE ?auto_8586 ) ( ON ?auto_8587 ?auto_8586 ) ( not ( = ?auto_8586 ?auto_8587 ) ) ( not ( = ?auto_8586 ?auto_8589 ) ) ( not ( = ?auto_8587 ?auto_8589 ) ) ( not ( = ?auto_8586 ?auto_8588 ) ) ( not ( = ?auto_8587 ?auto_8588 ) ) ( not ( = ?auto_8589 ?auto_8588 ) ) ( ON ?auto_8588 ?auto_8589 ) ( CLEAR ?auto_8588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8586 ?auto_8587 ?auto_8589 )
      ( MAKE-2PILE ?auto_8586 ?auto_8587 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8590 - BLOCK
      ?auto_8591 - BLOCK
    )
    :vars
    (
      ?auto_8592 - BLOCK
      ?auto_8593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8592 ?auto_8591 ) ( ON-TABLE ?auto_8590 ) ( ON ?auto_8591 ?auto_8590 ) ( not ( = ?auto_8590 ?auto_8591 ) ) ( not ( = ?auto_8590 ?auto_8592 ) ) ( not ( = ?auto_8591 ?auto_8592 ) ) ( not ( = ?auto_8590 ?auto_8593 ) ) ( not ( = ?auto_8591 ?auto_8593 ) ) ( not ( = ?auto_8592 ?auto_8593 ) ) ( HOLDING ?auto_8593 ) ( CLEAR ?auto_8592 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8590 ?auto_8591 ?auto_8592 ?auto_8593 )
      ( MAKE-2PILE ?auto_8590 ?auto_8591 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8594 - BLOCK
      ?auto_8595 - BLOCK
    )
    :vars
    (
      ?auto_8597 - BLOCK
      ?auto_8596 - BLOCK
      ?auto_8598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8597 ?auto_8595 ) ( ON-TABLE ?auto_8594 ) ( ON ?auto_8595 ?auto_8594 ) ( not ( = ?auto_8594 ?auto_8595 ) ) ( not ( = ?auto_8594 ?auto_8597 ) ) ( not ( = ?auto_8595 ?auto_8597 ) ) ( not ( = ?auto_8594 ?auto_8596 ) ) ( not ( = ?auto_8595 ?auto_8596 ) ) ( not ( = ?auto_8597 ?auto_8596 ) ) ( CLEAR ?auto_8597 ) ( ON ?auto_8596 ?auto_8598 ) ( CLEAR ?auto_8596 ) ( HAND-EMPTY ) ( not ( = ?auto_8594 ?auto_8598 ) ) ( not ( = ?auto_8595 ?auto_8598 ) ) ( not ( = ?auto_8597 ?auto_8598 ) ) ( not ( = ?auto_8596 ?auto_8598 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8596 ?auto_8598 )
      ( MAKE-2PILE ?auto_8594 ?auto_8595 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8609 - BLOCK
      ?auto_8610 - BLOCK
    )
    :vars
    (
      ?auto_8613 - BLOCK
      ?auto_8612 - BLOCK
      ?auto_8611 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8609 ) ( not ( = ?auto_8609 ?auto_8610 ) ) ( not ( = ?auto_8609 ?auto_8613 ) ) ( not ( = ?auto_8610 ?auto_8613 ) ) ( not ( = ?auto_8609 ?auto_8612 ) ) ( not ( = ?auto_8610 ?auto_8612 ) ) ( not ( = ?auto_8613 ?auto_8612 ) ) ( ON ?auto_8612 ?auto_8611 ) ( not ( = ?auto_8609 ?auto_8611 ) ) ( not ( = ?auto_8610 ?auto_8611 ) ) ( not ( = ?auto_8613 ?auto_8611 ) ) ( not ( = ?auto_8612 ?auto_8611 ) ) ( ON ?auto_8613 ?auto_8612 ) ( CLEAR ?auto_8613 ) ( HOLDING ?auto_8610 ) ( CLEAR ?auto_8609 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8609 ?auto_8610 ?auto_8613 )
      ( MAKE-2PILE ?auto_8609 ?auto_8610 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8614 - BLOCK
      ?auto_8615 - BLOCK
    )
    :vars
    (
      ?auto_8617 - BLOCK
      ?auto_8618 - BLOCK
      ?auto_8616 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8614 ) ( not ( = ?auto_8614 ?auto_8615 ) ) ( not ( = ?auto_8614 ?auto_8617 ) ) ( not ( = ?auto_8615 ?auto_8617 ) ) ( not ( = ?auto_8614 ?auto_8618 ) ) ( not ( = ?auto_8615 ?auto_8618 ) ) ( not ( = ?auto_8617 ?auto_8618 ) ) ( ON ?auto_8618 ?auto_8616 ) ( not ( = ?auto_8614 ?auto_8616 ) ) ( not ( = ?auto_8615 ?auto_8616 ) ) ( not ( = ?auto_8617 ?auto_8616 ) ) ( not ( = ?auto_8618 ?auto_8616 ) ) ( ON ?auto_8617 ?auto_8618 ) ( CLEAR ?auto_8614 ) ( ON ?auto_8615 ?auto_8617 ) ( CLEAR ?auto_8615 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8616 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8616 ?auto_8618 ?auto_8617 )
      ( MAKE-2PILE ?auto_8614 ?auto_8615 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8619 - BLOCK
      ?auto_8620 - BLOCK
    )
    :vars
    (
      ?auto_8622 - BLOCK
      ?auto_8623 - BLOCK
      ?auto_8621 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8619 ?auto_8620 ) ) ( not ( = ?auto_8619 ?auto_8622 ) ) ( not ( = ?auto_8620 ?auto_8622 ) ) ( not ( = ?auto_8619 ?auto_8623 ) ) ( not ( = ?auto_8620 ?auto_8623 ) ) ( not ( = ?auto_8622 ?auto_8623 ) ) ( ON ?auto_8623 ?auto_8621 ) ( not ( = ?auto_8619 ?auto_8621 ) ) ( not ( = ?auto_8620 ?auto_8621 ) ) ( not ( = ?auto_8622 ?auto_8621 ) ) ( not ( = ?auto_8623 ?auto_8621 ) ) ( ON ?auto_8622 ?auto_8623 ) ( ON ?auto_8620 ?auto_8622 ) ( CLEAR ?auto_8620 ) ( ON-TABLE ?auto_8621 ) ( HOLDING ?auto_8619 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8619 )
      ( MAKE-2PILE ?auto_8619 ?auto_8620 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8624 - BLOCK
      ?auto_8625 - BLOCK
    )
    :vars
    (
      ?auto_8627 - BLOCK
      ?auto_8626 - BLOCK
      ?auto_8628 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8624 ?auto_8625 ) ) ( not ( = ?auto_8624 ?auto_8627 ) ) ( not ( = ?auto_8625 ?auto_8627 ) ) ( not ( = ?auto_8624 ?auto_8626 ) ) ( not ( = ?auto_8625 ?auto_8626 ) ) ( not ( = ?auto_8627 ?auto_8626 ) ) ( ON ?auto_8626 ?auto_8628 ) ( not ( = ?auto_8624 ?auto_8628 ) ) ( not ( = ?auto_8625 ?auto_8628 ) ) ( not ( = ?auto_8627 ?auto_8628 ) ) ( not ( = ?auto_8626 ?auto_8628 ) ) ( ON ?auto_8627 ?auto_8626 ) ( ON ?auto_8625 ?auto_8627 ) ( ON-TABLE ?auto_8628 ) ( ON ?auto_8624 ?auto_8625 ) ( CLEAR ?auto_8624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8628 ?auto_8626 ?auto_8627 ?auto_8625 )
      ( MAKE-2PILE ?auto_8624 ?auto_8625 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8631 - BLOCK
      ?auto_8632 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_8632 ) ( CLEAR ?auto_8631 ) ( ON-TABLE ?auto_8631 ) ( not ( = ?auto_8631 ?auto_8632 ) ) )
    :subtasks
    ( ( !STACK ?auto_8632 ?auto_8631 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8633 - BLOCK
      ?auto_8634 - BLOCK
    )
    :vars
    (
      ?auto_8635 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8633 ) ( ON-TABLE ?auto_8633 ) ( not ( = ?auto_8633 ?auto_8634 ) ) ( ON ?auto_8634 ?auto_8635 ) ( CLEAR ?auto_8634 ) ( HAND-EMPTY ) ( not ( = ?auto_8633 ?auto_8635 ) ) ( not ( = ?auto_8634 ?auto_8635 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8634 ?auto_8635 )
      ( MAKE-2PILE ?auto_8633 ?auto_8634 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8636 - BLOCK
      ?auto_8637 - BLOCK
    )
    :vars
    (
      ?auto_8638 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8636 ?auto_8637 ) ) ( ON ?auto_8637 ?auto_8638 ) ( CLEAR ?auto_8637 ) ( not ( = ?auto_8636 ?auto_8638 ) ) ( not ( = ?auto_8637 ?auto_8638 ) ) ( HOLDING ?auto_8636 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8636 )
      ( MAKE-2PILE ?auto_8636 ?auto_8637 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8639 - BLOCK
      ?auto_8640 - BLOCK
    )
    :vars
    (
      ?auto_8641 - BLOCK
      ?auto_8642 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8639 ?auto_8640 ) ) ( ON ?auto_8640 ?auto_8641 ) ( not ( = ?auto_8639 ?auto_8641 ) ) ( not ( = ?auto_8640 ?auto_8641 ) ) ( ON ?auto_8639 ?auto_8640 ) ( CLEAR ?auto_8639 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8642 ) ( ON ?auto_8641 ?auto_8642 ) ( not ( = ?auto_8642 ?auto_8641 ) ) ( not ( = ?auto_8642 ?auto_8640 ) ) ( not ( = ?auto_8642 ?auto_8639 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8642 ?auto_8641 ?auto_8640 )
      ( MAKE-2PILE ?auto_8639 ?auto_8640 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8643 - BLOCK
      ?auto_8644 - BLOCK
    )
    :vars
    (
      ?auto_8646 - BLOCK
      ?auto_8645 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8643 ?auto_8644 ) ) ( ON ?auto_8644 ?auto_8646 ) ( not ( = ?auto_8643 ?auto_8646 ) ) ( not ( = ?auto_8644 ?auto_8646 ) ) ( ON-TABLE ?auto_8645 ) ( ON ?auto_8646 ?auto_8645 ) ( not ( = ?auto_8645 ?auto_8646 ) ) ( not ( = ?auto_8645 ?auto_8644 ) ) ( not ( = ?auto_8645 ?auto_8643 ) ) ( HOLDING ?auto_8643 ) ( CLEAR ?auto_8644 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8645 ?auto_8646 ?auto_8644 ?auto_8643 )
      ( MAKE-2PILE ?auto_8643 ?auto_8644 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8647 - BLOCK
      ?auto_8648 - BLOCK
    )
    :vars
    (
      ?auto_8649 - BLOCK
      ?auto_8650 - BLOCK
      ?auto_8651 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8647 ?auto_8648 ) ) ( ON ?auto_8648 ?auto_8649 ) ( not ( = ?auto_8647 ?auto_8649 ) ) ( not ( = ?auto_8648 ?auto_8649 ) ) ( ON-TABLE ?auto_8650 ) ( ON ?auto_8649 ?auto_8650 ) ( not ( = ?auto_8650 ?auto_8649 ) ) ( not ( = ?auto_8650 ?auto_8648 ) ) ( not ( = ?auto_8650 ?auto_8647 ) ) ( CLEAR ?auto_8648 ) ( ON ?auto_8647 ?auto_8651 ) ( CLEAR ?auto_8647 ) ( HAND-EMPTY ) ( not ( = ?auto_8647 ?auto_8651 ) ) ( not ( = ?auto_8648 ?auto_8651 ) ) ( not ( = ?auto_8649 ?auto_8651 ) ) ( not ( = ?auto_8650 ?auto_8651 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8647 ?auto_8651 )
      ( MAKE-2PILE ?auto_8647 ?auto_8648 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8652 - BLOCK
      ?auto_8653 - BLOCK
    )
    :vars
    (
      ?auto_8656 - BLOCK
      ?auto_8655 - BLOCK
      ?auto_8654 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8652 ?auto_8653 ) ) ( not ( = ?auto_8652 ?auto_8656 ) ) ( not ( = ?auto_8653 ?auto_8656 ) ) ( ON-TABLE ?auto_8655 ) ( ON ?auto_8656 ?auto_8655 ) ( not ( = ?auto_8655 ?auto_8656 ) ) ( not ( = ?auto_8655 ?auto_8653 ) ) ( not ( = ?auto_8655 ?auto_8652 ) ) ( ON ?auto_8652 ?auto_8654 ) ( CLEAR ?auto_8652 ) ( not ( = ?auto_8652 ?auto_8654 ) ) ( not ( = ?auto_8653 ?auto_8654 ) ) ( not ( = ?auto_8656 ?auto_8654 ) ) ( not ( = ?auto_8655 ?auto_8654 ) ) ( HOLDING ?auto_8653 ) ( CLEAR ?auto_8656 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8655 ?auto_8656 ?auto_8653 )
      ( MAKE-2PILE ?auto_8652 ?auto_8653 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8657 - BLOCK
      ?auto_8658 - BLOCK
    )
    :vars
    (
      ?auto_8661 - BLOCK
      ?auto_8659 - BLOCK
      ?auto_8660 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8657 ?auto_8658 ) ) ( not ( = ?auto_8657 ?auto_8661 ) ) ( not ( = ?auto_8658 ?auto_8661 ) ) ( ON-TABLE ?auto_8659 ) ( ON ?auto_8661 ?auto_8659 ) ( not ( = ?auto_8659 ?auto_8661 ) ) ( not ( = ?auto_8659 ?auto_8658 ) ) ( not ( = ?auto_8659 ?auto_8657 ) ) ( ON ?auto_8657 ?auto_8660 ) ( not ( = ?auto_8657 ?auto_8660 ) ) ( not ( = ?auto_8658 ?auto_8660 ) ) ( not ( = ?auto_8661 ?auto_8660 ) ) ( not ( = ?auto_8659 ?auto_8660 ) ) ( CLEAR ?auto_8661 ) ( ON ?auto_8658 ?auto_8657 ) ( CLEAR ?auto_8658 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8660 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8660 ?auto_8657 )
      ( MAKE-2PILE ?auto_8657 ?auto_8658 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8662 - BLOCK
      ?auto_8663 - BLOCK
    )
    :vars
    (
      ?auto_8665 - BLOCK
      ?auto_8666 - BLOCK
      ?auto_8664 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8662 ?auto_8663 ) ) ( not ( = ?auto_8662 ?auto_8665 ) ) ( not ( = ?auto_8663 ?auto_8665 ) ) ( ON-TABLE ?auto_8666 ) ( not ( = ?auto_8666 ?auto_8665 ) ) ( not ( = ?auto_8666 ?auto_8663 ) ) ( not ( = ?auto_8666 ?auto_8662 ) ) ( ON ?auto_8662 ?auto_8664 ) ( not ( = ?auto_8662 ?auto_8664 ) ) ( not ( = ?auto_8663 ?auto_8664 ) ) ( not ( = ?auto_8665 ?auto_8664 ) ) ( not ( = ?auto_8666 ?auto_8664 ) ) ( ON ?auto_8663 ?auto_8662 ) ( CLEAR ?auto_8663 ) ( ON-TABLE ?auto_8664 ) ( HOLDING ?auto_8665 ) ( CLEAR ?auto_8666 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8666 ?auto_8665 )
      ( MAKE-2PILE ?auto_8662 ?auto_8663 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8667 - BLOCK
      ?auto_8668 - BLOCK
    )
    :vars
    (
      ?auto_8671 - BLOCK
      ?auto_8669 - BLOCK
      ?auto_8670 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8667 ?auto_8668 ) ) ( not ( = ?auto_8667 ?auto_8671 ) ) ( not ( = ?auto_8668 ?auto_8671 ) ) ( ON-TABLE ?auto_8669 ) ( not ( = ?auto_8669 ?auto_8671 ) ) ( not ( = ?auto_8669 ?auto_8668 ) ) ( not ( = ?auto_8669 ?auto_8667 ) ) ( ON ?auto_8667 ?auto_8670 ) ( not ( = ?auto_8667 ?auto_8670 ) ) ( not ( = ?auto_8668 ?auto_8670 ) ) ( not ( = ?auto_8671 ?auto_8670 ) ) ( not ( = ?auto_8669 ?auto_8670 ) ) ( ON ?auto_8668 ?auto_8667 ) ( ON-TABLE ?auto_8670 ) ( CLEAR ?auto_8669 ) ( ON ?auto_8671 ?auto_8668 ) ( CLEAR ?auto_8671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8670 ?auto_8667 ?auto_8668 )
      ( MAKE-2PILE ?auto_8667 ?auto_8668 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8672 - BLOCK
      ?auto_8673 - BLOCK
    )
    :vars
    (
      ?auto_8675 - BLOCK
      ?auto_8676 - BLOCK
      ?auto_8674 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8672 ?auto_8673 ) ) ( not ( = ?auto_8672 ?auto_8675 ) ) ( not ( = ?auto_8673 ?auto_8675 ) ) ( not ( = ?auto_8676 ?auto_8675 ) ) ( not ( = ?auto_8676 ?auto_8673 ) ) ( not ( = ?auto_8676 ?auto_8672 ) ) ( ON ?auto_8672 ?auto_8674 ) ( not ( = ?auto_8672 ?auto_8674 ) ) ( not ( = ?auto_8673 ?auto_8674 ) ) ( not ( = ?auto_8675 ?auto_8674 ) ) ( not ( = ?auto_8676 ?auto_8674 ) ) ( ON ?auto_8673 ?auto_8672 ) ( ON-TABLE ?auto_8674 ) ( ON ?auto_8675 ?auto_8673 ) ( CLEAR ?auto_8675 ) ( HOLDING ?auto_8676 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8676 )
      ( MAKE-2PILE ?auto_8672 ?auto_8673 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8677 - BLOCK
      ?auto_8678 - BLOCK
    )
    :vars
    (
      ?auto_8681 - BLOCK
      ?auto_8680 - BLOCK
      ?auto_8679 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8677 ?auto_8678 ) ) ( not ( = ?auto_8677 ?auto_8681 ) ) ( not ( = ?auto_8678 ?auto_8681 ) ) ( not ( = ?auto_8680 ?auto_8681 ) ) ( not ( = ?auto_8680 ?auto_8678 ) ) ( not ( = ?auto_8680 ?auto_8677 ) ) ( ON ?auto_8677 ?auto_8679 ) ( not ( = ?auto_8677 ?auto_8679 ) ) ( not ( = ?auto_8678 ?auto_8679 ) ) ( not ( = ?auto_8681 ?auto_8679 ) ) ( not ( = ?auto_8680 ?auto_8679 ) ) ( ON ?auto_8678 ?auto_8677 ) ( ON-TABLE ?auto_8679 ) ( ON ?auto_8681 ?auto_8678 ) ( ON ?auto_8680 ?auto_8681 ) ( CLEAR ?auto_8680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8679 ?auto_8677 ?auto_8678 ?auto_8681 )
      ( MAKE-2PILE ?auto_8677 ?auto_8678 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8683 - BLOCK
    )
    :vars
    (
      ?auto_8684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8684 ?auto_8683 ) ( CLEAR ?auto_8684 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8683 ) ( not ( = ?auto_8683 ?auto_8684 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8684 ?auto_8683 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8685 - BLOCK
    )
    :vars
    (
      ?auto_8686 - BLOCK
      ?auto_8687 - BLOCK
      ?auto_8688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8686 ?auto_8685 ) ( CLEAR ?auto_8686 ) ( ON-TABLE ?auto_8685 ) ( not ( = ?auto_8685 ?auto_8686 ) ) ( HOLDING ?auto_8687 ) ( CLEAR ?auto_8688 ) ( not ( = ?auto_8685 ?auto_8687 ) ) ( not ( = ?auto_8685 ?auto_8688 ) ) ( not ( = ?auto_8686 ?auto_8687 ) ) ( not ( = ?auto_8686 ?auto_8688 ) ) ( not ( = ?auto_8687 ?auto_8688 ) ) )
    :subtasks
    ( ( !STACK ?auto_8687 ?auto_8688 )
      ( MAKE-1PILE ?auto_8685 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8689 - BLOCK
    )
    :vars
    (
      ?auto_8691 - BLOCK
      ?auto_8690 - BLOCK
      ?auto_8692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8691 ?auto_8689 ) ( ON-TABLE ?auto_8689 ) ( not ( = ?auto_8689 ?auto_8691 ) ) ( CLEAR ?auto_8690 ) ( not ( = ?auto_8689 ?auto_8692 ) ) ( not ( = ?auto_8689 ?auto_8690 ) ) ( not ( = ?auto_8691 ?auto_8692 ) ) ( not ( = ?auto_8691 ?auto_8690 ) ) ( not ( = ?auto_8692 ?auto_8690 ) ) ( ON ?auto_8692 ?auto_8691 ) ( CLEAR ?auto_8692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8689 ?auto_8691 )
      ( MAKE-1PILE ?auto_8689 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8693 - BLOCK
    )
    :vars
    (
      ?auto_8696 - BLOCK
      ?auto_8694 - BLOCK
      ?auto_8695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8696 ?auto_8693 ) ( ON-TABLE ?auto_8693 ) ( not ( = ?auto_8693 ?auto_8696 ) ) ( not ( = ?auto_8693 ?auto_8694 ) ) ( not ( = ?auto_8693 ?auto_8695 ) ) ( not ( = ?auto_8696 ?auto_8694 ) ) ( not ( = ?auto_8696 ?auto_8695 ) ) ( not ( = ?auto_8694 ?auto_8695 ) ) ( ON ?auto_8694 ?auto_8696 ) ( CLEAR ?auto_8694 ) ( HOLDING ?auto_8695 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8695 )
      ( MAKE-1PILE ?auto_8693 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8697 - BLOCK
    )
    :vars
    (
      ?auto_8699 - BLOCK
      ?auto_8700 - BLOCK
      ?auto_8698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8699 ?auto_8697 ) ( ON-TABLE ?auto_8697 ) ( not ( = ?auto_8697 ?auto_8699 ) ) ( not ( = ?auto_8697 ?auto_8700 ) ) ( not ( = ?auto_8697 ?auto_8698 ) ) ( not ( = ?auto_8699 ?auto_8700 ) ) ( not ( = ?auto_8699 ?auto_8698 ) ) ( not ( = ?auto_8700 ?auto_8698 ) ) ( ON ?auto_8700 ?auto_8699 ) ( ON ?auto_8698 ?auto_8700 ) ( CLEAR ?auto_8698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8697 ?auto_8699 ?auto_8700 )
      ( MAKE-1PILE ?auto_8697 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8701 - BLOCK
    )
    :vars
    (
      ?auto_8702 - BLOCK
      ?auto_8703 - BLOCK
      ?auto_8704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8702 ?auto_8701 ) ( ON-TABLE ?auto_8701 ) ( not ( = ?auto_8701 ?auto_8702 ) ) ( not ( = ?auto_8701 ?auto_8703 ) ) ( not ( = ?auto_8701 ?auto_8704 ) ) ( not ( = ?auto_8702 ?auto_8703 ) ) ( not ( = ?auto_8702 ?auto_8704 ) ) ( not ( = ?auto_8703 ?auto_8704 ) ) ( ON ?auto_8703 ?auto_8702 ) ( HOLDING ?auto_8704 ) ( CLEAR ?auto_8703 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8701 ?auto_8702 ?auto_8703 ?auto_8704 )
      ( MAKE-1PILE ?auto_8701 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8705 - BLOCK
    )
    :vars
    (
      ?auto_8708 - BLOCK
      ?auto_8707 - BLOCK
      ?auto_8706 - BLOCK
      ?auto_8709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8708 ?auto_8705 ) ( ON-TABLE ?auto_8705 ) ( not ( = ?auto_8705 ?auto_8708 ) ) ( not ( = ?auto_8705 ?auto_8707 ) ) ( not ( = ?auto_8705 ?auto_8706 ) ) ( not ( = ?auto_8708 ?auto_8707 ) ) ( not ( = ?auto_8708 ?auto_8706 ) ) ( not ( = ?auto_8707 ?auto_8706 ) ) ( ON ?auto_8707 ?auto_8708 ) ( CLEAR ?auto_8707 ) ( ON ?auto_8706 ?auto_8709 ) ( CLEAR ?auto_8706 ) ( HAND-EMPTY ) ( not ( = ?auto_8705 ?auto_8709 ) ) ( not ( = ?auto_8708 ?auto_8709 ) ) ( not ( = ?auto_8707 ?auto_8709 ) ) ( not ( = ?auto_8706 ?auto_8709 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8706 ?auto_8709 )
      ( MAKE-1PILE ?auto_8705 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8710 - BLOCK
    )
    :vars
    (
      ?auto_8711 - BLOCK
      ?auto_8714 - BLOCK
      ?auto_8712 - BLOCK
      ?auto_8713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8711 ?auto_8710 ) ( ON-TABLE ?auto_8710 ) ( not ( = ?auto_8710 ?auto_8711 ) ) ( not ( = ?auto_8710 ?auto_8714 ) ) ( not ( = ?auto_8710 ?auto_8712 ) ) ( not ( = ?auto_8711 ?auto_8714 ) ) ( not ( = ?auto_8711 ?auto_8712 ) ) ( not ( = ?auto_8714 ?auto_8712 ) ) ( ON ?auto_8712 ?auto_8713 ) ( CLEAR ?auto_8712 ) ( not ( = ?auto_8710 ?auto_8713 ) ) ( not ( = ?auto_8711 ?auto_8713 ) ) ( not ( = ?auto_8714 ?auto_8713 ) ) ( not ( = ?auto_8712 ?auto_8713 ) ) ( HOLDING ?auto_8714 ) ( CLEAR ?auto_8711 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8710 ?auto_8711 ?auto_8714 )
      ( MAKE-1PILE ?auto_8710 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8715 - BLOCK
    )
    :vars
    (
      ?auto_8716 - BLOCK
      ?auto_8719 - BLOCK
      ?auto_8718 - BLOCK
      ?auto_8717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8716 ?auto_8715 ) ( ON-TABLE ?auto_8715 ) ( not ( = ?auto_8715 ?auto_8716 ) ) ( not ( = ?auto_8715 ?auto_8719 ) ) ( not ( = ?auto_8715 ?auto_8718 ) ) ( not ( = ?auto_8716 ?auto_8719 ) ) ( not ( = ?auto_8716 ?auto_8718 ) ) ( not ( = ?auto_8719 ?auto_8718 ) ) ( ON ?auto_8718 ?auto_8717 ) ( not ( = ?auto_8715 ?auto_8717 ) ) ( not ( = ?auto_8716 ?auto_8717 ) ) ( not ( = ?auto_8719 ?auto_8717 ) ) ( not ( = ?auto_8718 ?auto_8717 ) ) ( CLEAR ?auto_8716 ) ( ON ?auto_8719 ?auto_8718 ) ( CLEAR ?auto_8719 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8717 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8717 ?auto_8718 )
      ( MAKE-1PILE ?auto_8715 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8730 - BLOCK
    )
    :vars
    (
      ?auto_8733 - BLOCK
      ?auto_8732 - BLOCK
      ?auto_8734 - BLOCK
      ?auto_8731 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8730 ?auto_8733 ) ) ( not ( = ?auto_8730 ?auto_8732 ) ) ( not ( = ?auto_8730 ?auto_8734 ) ) ( not ( = ?auto_8733 ?auto_8732 ) ) ( not ( = ?auto_8733 ?auto_8734 ) ) ( not ( = ?auto_8732 ?auto_8734 ) ) ( ON ?auto_8734 ?auto_8731 ) ( not ( = ?auto_8730 ?auto_8731 ) ) ( not ( = ?auto_8733 ?auto_8731 ) ) ( not ( = ?auto_8732 ?auto_8731 ) ) ( not ( = ?auto_8734 ?auto_8731 ) ) ( ON ?auto_8732 ?auto_8734 ) ( ON-TABLE ?auto_8731 ) ( ON ?auto_8733 ?auto_8732 ) ( CLEAR ?auto_8733 ) ( HOLDING ?auto_8730 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8730 ?auto_8733 )
      ( MAKE-1PILE ?auto_8730 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8735 - BLOCK
    )
    :vars
    (
      ?auto_8739 - BLOCK
      ?auto_8738 - BLOCK
      ?auto_8737 - BLOCK
      ?auto_8736 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8735 ?auto_8739 ) ) ( not ( = ?auto_8735 ?auto_8738 ) ) ( not ( = ?auto_8735 ?auto_8737 ) ) ( not ( = ?auto_8739 ?auto_8738 ) ) ( not ( = ?auto_8739 ?auto_8737 ) ) ( not ( = ?auto_8738 ?auto_8737 ) ) ( ON ?auto_8737 ?auto_8736 ) ( not ( = ?auto_8735 ?auto_8736 ) ) ( not ( = ?auto_8739 ?auto_8736 ) ) ( not ( = ?auto_8738 ?auto_8736 ) ) ( not ( = ?auto_8737 ?auto_8736 ) ) ( ON ?auto_8738 ?auto_8737 ) ( ON-TABLE ?auto_8736 ) ( ON ?auto_8739 ?auto_8738 ) ( ON ?auto_8735 ?auto_8739 ) ( CLEAR ?auto_8735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8736 ?auto_8737 ?auto_8738 ?auto_8739 )
      ( MAKE-1PILE ?auto_8735 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8743 - BLOCK
      ?auto_8744 - BLOCK
      ?auto_8745 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_8745 ) ( CLEAR ?auto_8744 ) ( ON-TABLE ?auto_8743 ) ( ON ?auto_8744 ?auto_8743 ) ( not ( = ?auto_8743 ?auto_8744 ) ) ( not ( = ?auto_8743 ?auto_8745 ) ) ( not ( = ?auto_8744 ?auto_8745 ) ) )
    :subtasks
    ( ( !STACK ?auto_8745 ?auto_8744 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8746 - BLOCK
      ?auto_8747 - BLOCK
      ?auto_8748 - BLOCK
    )
    :vars
    (
      ?auto_8749 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8747 ) ( ON-TABLE ?auto_8746 ) ( ON ?auto_8747 ?auto_8746 ) ( not ( = ?auto_8746 ?auto_8747 ) ) ( not ( = ?auto_8746 ?auto_8748 ) ) ( not ( = ?auto_8747 ?auto_8748 ) ) ( ON ?auto_8748 ?auto_8749 ) ( CLEAR ?auto_8748 ) ( HAND-EMPTY ) ( not ( = ?auto_8746 ?auto_8749 ) ) ( not ( = ?auto_8747 ?auto_8749 ) ) ( not ( = ?auto_8748 ?auto_8749 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8748 ?auto_8749 )
      ( MAKE-3PILE ?auto_8746 ?auto_8747 ?auto_8748 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8750 - BLOCK
      ?auto_8751 - BLOCK
      ?auto_8752 - BLOCK
    )
    :vars
    (
      ?auto_8753 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8750 ) ( not ( = ?auto_8750 ?auto_8751 ) ) ( not ( = ?auto_8750 ?auto_8752 ) ) ( not ( = ?auto_8751 ?auto_8752 ) ) ( ON ?auto_8752 ?auto_8753 ) ( CLEAR ?auto_8752 ) ( not ( = ?auto_8750 ?auto_8753 ) ) ( not ( = ?auto_8751 ?auto_8753 ) ) ( not ( = ?auto_8752 ?auto_8753 ) ) ( HOLDING ?auto_8751 ) ( CLEAR ?auto_8750 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8750 ?auto_8751 )
      ( MAKE-3PILE ?auto_8750 ?auto_8751 ?auto_8752 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8754 - BLOCK
      ?auto_8755 - BLOCK
      ?auto_8756 - BLOCK
    )
    :vars
    (
      ?auto_8757 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8754 ) ( not ( = ?auto_8754 ?auto_8755 ) ) ( not ( = ?auto_8754 ?auto_8756 ) ) ( not ( = ?auto_8755 ?auto_8756 ) ) ( ON ?auto_8756 ?auto_8757 ) ( not ( = ?auto_8754 ?auto_8757 ) ) ( not ( = ?auto_8755 ?auto_8757 ) ) ( not ( = ?auto_8756 ?auto_8757 ) ) ( CLEAR ?auto_8754 ) ( ON ?auto_8755 ?auto_8756 ) ( CLEAR ?auto_8755 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8757 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8757 ?auto_8756 )
      ( MAKE-3PILE ?auto_8754 ?auto_8755 ?auto_8756 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8758 - BLOCK
      ?auto_8759 - BLOCK
      ?auto_8760 - BLOCK
    )
    :vars
    (
      ?auto_8761 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8758 ?auto_8759 ) ) ( not ( = ?auto_8758 ?auto_8760 ) ) ( not ( = ?auto_8759 ?auto_8760 ) ) ( ON ?auto_8760 ?auto_8761 ) ( not ( = ?auto_8758 ?auto_8761 ) ) ( not ( = ?auto_8759 ?auto_8761 ) ) ( not ( = ?auto_8760 ?auto_8761 ) ) ( ON ?auto_8759 ?auto_8760 ) ( CLEAR ?auto_8759 ) ( ON-TABLE ?auto_8761 ) ( HOLDING ?auto_8758 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8758 )
      ( MAKE-3PILE ?auto_8758 ?auto_8759 ?auto_8760 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8762 - BLOCK
      ?auto_8763 - BLOCK
      ?auto_8764 - BLOCK
    )
    :vars
    (
      ?auto_8765 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8762 ?auto_8763 ) ) ( not ( = ?auto_8762 ?auto_8764 ) ) ( not ( = ?auto_8763 ?auto_8764 ) ) ( ON ?auto_8764 ?auto_8765 ) ( not ( = ?auto_8762 ?auto_8765 ) ) ( not ( = ?auto_8763 ?auto_8765 ) ) ( not ( = ?auto_8764 ?auto_8765 ) ) ( ON ?auto_8763 ?auto_8764 ) ( ON-TABLE ?auto_8765 ) ( ON ?auto_8762 ?auto_8763 ) ( CLEAR ?auto_8762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8765 ?auto_8764 ?auto_8763 )
      ( MAKE-3PILE ?auto_8762 ?auto_8763 ?auto_8764 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8766 - BLOCK
      ?auto_8767 - BLOCK
      ?auto_8768 - BLOCK
    )
    :vars
    (
      ?auto_8769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8766 ?auto_8767 ) ) ( not ( = ?auto_8766 ?auto_8768 ) ) ( not ( = ?auto_8767 ?auto_8768 ) ) ( ON ?auto_8768 ?auto_8769 ) ( not ( = ?auto_8766 ?auto_8769 ) ) ( not ( = ?auto_8767 ?auto_8769 ) ) ( not ( = ?auto_8768 ?auto_8769 ) ) ( ON ?auto_8767 ?auto_8768 ) ( ON-TABLE ?auto_8769 ) ( HOLDING ?auto_8766 ) ( CLEAR ?auto_8767 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8769 ?auto_8768 ?auto_8767 ?auto_8766 )
      ( MAKE-3PILE ?auto_8766 ?auto_8767 ?auto_8768 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8770 - BLOCK
      ?auto_8771 - BLOCK
      ?auto_8772 - BLOCK
    )
    :vars
    (
      ?auto_8773 - BLOCK
      ?auto_8774 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8770 ?auto_8771 ) ) ( not ( = ?auto_8770 ?auto_8772 ) ) ( not ( = ?auto_8771 ?auto_8772 ) ) ( ON ?auto_8772 ?auto_8773 ) ( not ( = ?auto_8770 ?auto_8773 ) ) ( not ( = ?auto_8771 ?auto_8773 ) ) ( not ( = ?auto_8772 ?auto_8773 ) ) ( ON ?auto_8771 ?auto_8772 ) ( ON-TABLE ?auto_8773 ) ( CLEAR ?auto_8771 ) ( ON ?auto_8770 ?auto_8774 ) ( CLEAR ?auto_8770 ) ( HAND-EMPTY ) ( not ( = ?auto_8770 ?auto_8774 ) ) ( not ( = ?auto_8771 ?auto_8774 ) ) ( not ( = ?auto_8772 ?auto_8774 ) ) ( not ( = ?auto_8773 ?auto_8774 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8770 ?auto_8774 )
      ( MAKE-3PILE ?auto_8770 ?auto_8771 ?auto_8772 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8775 - BLOCK
      ?auto_8776 - BLOCK
      ?auto_8777 - BLOCK
    )
    :vars
    (
      ?auto_8779 - BLOCK
      ?auto_8778 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8775 ?auto_8776 ) ) ( not ( = ?auto_8775 ?auto_8777 ) ) ( not ( = ?auto_8776 ?auto_8777 ) ) ( ON ?auto_8777 ?auto_8779 ) ( not ( = ?auto_8775 ?auto_8779 ) ) ( not ( = ?auto_8776 ?auto_8779 ) ) ( not ( = ?auto_8777 ?auto_8779 ) ) ( ON-TABLE ?auto_8779 ) ( ON ?auto_8775 ?auto_8778 ) ( CLEAR ?auto_8775 ) ( not ( = ?auto_8775 ?auto_8778 ) ) ( not ( = ?auto_8776 ?auto_8778 ) ) ( not ( = ?auto_8777 ?auto_8778 ) ) ( not ( = ?auto_8779 ?auto_8778 ) ) ( HOLDING ?auto_8776 ) ( CLEAR ?auto_8777 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8779 ?auto_8777 ?auto_8776 )
      ( MAKE-3PILE ?auto_8775 ?auto_8776 ?auto_8777 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8780 - BLOCK
      ?auto_8781 - BLOCK
      ?auto_8782 - BLOCK
    )
    :vars
    (
      ?auto_8783 - BLOCK
      ?auto_8784 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8780 ?auto_8781 ) ) ( not ( = ?auto_8780 ?auto_8782 ) ) ( not ( = ?auto_8781 ?auto_8782 ) ) ( ON ?auto_8782 ?auto_8783 ) ( not ( = ?auto_8780 ?auto_8783 ) ) ( not ( = ?auto_8781 ?auto_8783 ) ) ( not ( = ?auto_8782 ?auto_8783 ) ) ( ON-TABLE ?auto_8783 ) ( ON ?auto_8780 ?auto_8784 ) ( not ( = ?auto_8780 ?auto_8784 ) ) ( not ( = ?auto_8781 ?auto_8784 ) ) ( not ( = ?auto_8782 ?auto_8784 ) ) ( not ( = ?auto_8783 ?auto_8784 ) ) ( CLEAR ?auto_8782 ) ( ON ?auto_8781 ?auto_8780 ) ( CLEAR ?auto_8781 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8784 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8784 ?auto_8780 )
      ( MAKE-3PILE ?auto_8780 ?auto_8781 ?auto_8782 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8785 - BLOCK
      ?auto_8786 - BLOCK
      ?auto_8787 - BLOCK
    )
    :vars
    (
      ?auto_8788 - BLOCK
      ?auto_8789 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8785 ?auto_8786 ) ) ( not ( = ?auto_8785 ?auto_8787 ) ) ( not ( = ?auto_8786 ?auto_8787 ) ) ( not ( = ?auto_8785 ?auto_8788 ) ) ( not ( = ?auto_8786 ?auto_8788 ) ) ( not ( = ?auto_8787 ?auto_8788 ) ) ( ON-TABLE ?auto_8788 ) ( ON ?auto_8785 ?auto_8789 ) ( not ( = ?auto_8785 ?auto_8789 ) ) ( not ( = ?auto_8786 ?auto_8789 ) ) ( not ( = ?auto_8787 ?auto_8789 ) ) ( not ( = ?auto_8788 ?auto_8789 ) ) ( ON ?auto_8786 ?auto_8785 ) ( CLEAR ?auto_8786 ) ( ON-TABLE ?auto_8789 ) ( HOLDING ?auto_8787 ) ( CLEAR ?auto_8788 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8788 ?auto_8787 )
      ( MAKE-3PILE ?auto_8785 ?auto_8786 ?auto_8787 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8790 - BLOCK
      ?auto_8791 - BLOCK
      ?auto_8792 - BLOCK
    )
    :vars
    (
      ?auto_8793 - BLOCK
      ?auto_8794 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8790 ?auto_8791 ) ) ( not ( = ?auto_8790 ?auto_8792 ) ) ( not ( = ?auto_8791 ?auto_8792 ) ) ( not ( = ?auto_8790 ?auto_8793 ) ) ( not ( = ?auto_8791 ?auto_8793 ) ) ( not ( = ?auto_8792 ?auto_8793 ) ) ( ON-TABLE ?auto_8793 ) ( ON ?auto_8790 ?auto_8794 ) ( not ( = ?auto_8790 ?auto_8794 ) ) ( not ( = ?auto_8791 ?auto_8794 ) ) ( not ( = ?auto_8792 ?auto_8794 ) ) ( not ( = ?auto_8793 ?auto_8794 ) ) ( ON ?auto_8791 ?auto_8790 ) ( ON-TABLE ?auto_8794 ) ( CLEAR ?auto_8793 ) ( ON ?auto_8792 ?auto_8791 ) ( CLEAR ?auto_8792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8794 ?auto_8790 ?auto_8791 )
      ( MAKE-3PILE ?auto_8790 ?auto_8791 ?auto_8792 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8795 - BLOCK
      ?auto_8796 - BLOCK
      ?auto_8797 - BLOCK
    )
    :vars
    (
      ?auto_8799 - BLOCK
      ?auto_8798 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8795 ?auto_8796 ) ) ( not ( = ?auto_8795 ?auto_8797 ) ) ( not ( = ?auto_8796 ?auto_8797 ) ) ( not ( = ?auto_8795 ?auto_8799 ) ) ( not ( = ?auto_8796 ?auto_8799 ) ) ( not ( = ?auto_8797 ?auto_8799 ) ) ( ON ?auto_8795 ?auto_8798 ) ( not ( = ?auto_8795 ?auto_8798 ) ) ( not ( = ?auto_8796 ?auto_8798 ) ) ( not ( = ?auto_8797 ?auto_8798 ) ) ( not ( = ?auto_8799 ?auto_8798 ) ) ( ON ?auto_8796 ?auto_8795 ) ( ON-TABLE ?auto_8798 ) ( ON ?auto_8797 ?auto_8796 ) ( CLEAR ?auto_8797 ) ( HOLDING ?auto_8799 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8799 )
      ( MAKE-3PILE ?auto_8795 ?auto_8796 ?auto_8797 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8800 - BLOCK
      ?auto_8801 - BLOCK
      ?auto_8802 - BLOCK
    )
    :vars
    (
      ?auto_8803 - BLOCK
      ?auto_8804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8800 ?auto_8801 ) ) ( not ( = ?auto_8800 ?auto_8802 ) ) ( not ( = ?auto_8801 ?auto_8802 ) ) ( not ( = ?auto_8800 ?auto_8803 ) ) ( not ( = ?auto_8801 ?auto_8803 ) ) ( not ( = ?auto_8802 ?auto_8803 ) ) ( ON ?auto_8800 ?auto_8804 ) ( not ( = ?auto_8800 ?auto_8804 ) ) ( not ( = ?auto_8801 ?auto_8804 ) ) ( not ( = ?auto_8802 ?auto_8804 ) ) ( not ( = ?auto_8803 ?auto_8804 ) ) ( ON ?auto_8801 ?auto_8800 ) ( ON-TABLE ?auto_8804 ) ( ON ?auto_8802 ?auto_8801 ) ( ON ?auto_8803 ?auto_8802 ) ( CLEAR ?auto_8803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8804 ?auto_8800 ?auto_8801 ?auto_8802 )
      ( MAKE-3PILE ?auto_8800 ?auto_8801 ?auto_8802 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8809 - BLOCK
      ?auto_8810 - BLOCK
      ?auto_8811 - BLOCK
      ?auto_8812 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_8812 ) ( CLEAR ?auto_8811 ) ( ON-TABLE ?auto_8809 ) ( ON ?auto_8810 ?auto_8809 ) ( ON ?auto_8811 ?auto_8810 ) ( not ( = ?auto_8809 ?auto_8810 ) ) ( not ( = ?auto_8809 ?auto_8811 ) ) ( not ( = ?auto_8809 ?auto_8812 ) ) ( not ( = ?auto_8810 ?auto_8811 ) ) ( not ( = ?auto_8810 ?auto_8812 ) ) ( not ( = ?auto_8811 ?auto_8812 ) ) )
    :subtasks
    ( ( !STACK ?auto_8812 ?auto_8811 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8813 - BLOCK
      ?auto_8814 - BLOCK
      ?auto_8815 - BLOCK
      ?auto_8816 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8815 ) ( ON-TABLE ?auto_8813 ) ( ON ?auto_8814 ?auto_8813 ) ( ON ?auto_8815 ?auto_8814 ) ( not ( = ?auto_8813 ?auto_8814 ) ) ( not ( = ?auto_8813 ?auto_8815 ) ) ( not ( = ?auto_8813 ?auto_8816 ) ) ( not ( = ?auto_8814 ?auto_8815 ) ) ( not ( = ?auto_8814 ?auto_8816 ) ) ( not ( = ?auto_8815 ?auto_8816 ) ) ( ON-TABLE ?auto_8816 ) ( CLEAR ?auto_8816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_8816 )
      ( MAKE-4PILE ?auto_8813 ?auto_8814 ?auto_8815 ?auto_8816 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8817 - BLOCK
      ?auto_8818 - BLOCK
      ?auto_8819 - BLOCK
      ?auto_8820 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8817 ) ( ON ?auto_8818 ?auto_8817 ) ( not ( = ?auto_8817 ?auto_8818 ) ) ( not ( = ?auto_8817 ?auto_8819 ) ) ( not ( = ?auto_8817 ?auto_8820 ) ) ( not ( = ?auto_8818 ?auto_8819 ) ) ( not ( = ?auto_8818 ?auto_8820 ) ) ( not ( = ?auto_8819 ?auto_8820 ) ) ( ON-TABLE ?auto_8820 ) ( CLEAR ?auto_8820 ) ( HOLDING ?auto_8819 ) ( CLEAR ?auto_8818 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8817 ?auto_8818 ?auto_8819 )
      ( MAKE-4PILE ?auto_8817 ?auto_8818 ?auto_8819 ?auto_8820 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8821 - BLOCK
      ?auto_8822 - BLOCK
      ?auto_8823 - BLOCK
      ?auto_8824 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8821 ) ( ON ?auto_8822 ?auto_8821 ) ( not ( = ?auto_8821 ?auto_8822 ) ) ( not ( = ?auto_8821 ?auto_8823 ) ) ( not ( = ?auto_8821 ?auto_8824 ) ) ( not ( = ?auto_8822 ?auto_8823 ) ) ( not ( = ?auto_8822 ?auto_8824 ) ) ( not ( = ?auto_8823 ?auto_8824 ) ) ( ON-TABLE ?auto_8824 ) ( CLEAR ?auto_8822 ) ( ON ?auto_8823 ?auto_8824 ) ( CLEAR ?auto_8823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8824 )
      ( MAKE-4PILE ?auto_8821 ?auto_8822 ?auto_8823 ?auto_8824 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8825 - BLOCK
      ?auto_8826 - BLOCK
      ?auto_8827 - BLOCK
      ?auto_8828 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8825 ) ( not ( = ?auto_8825 ?auto_8826 ) ) ( not ( = ?auto_8825 ?auto_8827 ) ) ( not ( = ?auto_8825 ?auto_8828 ) ) ( not ( = ?auto_8826 ?auto_8827 ) ) ( not ( = ?auto_8826 ?auto_8828 ) ) ( not ( = ?auto_8827 ?auto_8828 ) ) ( ON-TABLE ?auto_8828 ) ( ON ?auto_8827 ?auto_8828 ) ( CLEAR ?auto_8827 ) ( HOLDING ?auto_8826 ) ( CLEAR ?auto_8825 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8825 ?auto_8826 )
      ( MAKE-4PILE ?auto_8825 ?auto_8826 ?auto_8827 ?auto_8828 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8829 - BLOCK
      ?auto_8830 - BLOCK
      ?auto_8831 - BLOCK
      ?auto_8832 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8829 ) ( not ( = ?auto_8829 ?auto_8830 ) ) ( not ( = ?auto_8829 ?auto_8831 ) ) ( not ( = ?auto_8829 ?auto_8832 ) ) ( not ( = ?auto_8830 ?auto_8831 ) ) ( not ( = ?auto_8830 ?auto_8832 ) ) ( not ( = ?auto_8831 ?auto_8832 ) ) ( ON-TABLE ?auto_8832 ) ( ON ?auto_8831 ?auto_8832 ) ( CLEAR ?auto_8829 ) ( ON ?auto_8830 ?auto_8831 ) ( CLEAR ?auto_8830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8832 ?auto_8831 )
      ( MAKE-4PILE ?auto_8829 ?auto_8830 ?auto_8831 ?auto_8832 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8833 - BLOCK
      ?auto_8834 - BLOCK
      ?auto_8835 - BLOCK
      ?auto_8836 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8833 ?auto_8834 ) ) ( not ( = ?auto_8833 ?auto_8835 ) ) ( not ( = ?auto_8833 ?auto_8836 ) ) ( not ( = ?auto_8834 ?auto_8835 ) ) ( not ( = ?auto_8834 ?auto_8836 ) ) ( not ( = ?auto_8835 ?auto_8836 ) ) ( ON-TABLE ?auto_8836 ) ( ON ?auto_8835 ?auto_8836 ) ( ON ?auto_8834 ?auto_8835 ) ( CLEAR ?auto_8834 ) ( HOLDING ?auto_8833 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8833 )
      ( MAKE-4PILE ?auto_8833 ?auto_8834 ?auto_8835 ?auto_8836 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8837 - BLOCK
      ?auto_8838 - BLOCK
      ?auto_8839 - BLOCK
      ?auto_8840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8837 ?auto_8838 ) ) ( not ( = ?auto_8837 ?auto_8839 ) ) ( not ( = ?auto_8837 ?auto_8840 ) ) ( not ( = ?auto_8838 ?auto_8839 ) ) ( not ( = ?auto_8838 ?auto_8840 ) ) ( not ( = ?auto_8839 ?auto_8840 ) ) ( ON-TABLE ?auto_8840 ) ( ON ?auto_8839 ?auto_8840 ) ( ON ?auto_8838 ?auto_8839 ) ( ON ?auto_8837 ?auto_8838 ) ( CLEAR ?auto_8837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8840 ?auto_8839 ?auto_8838 )
      ( MAKE-4PILE ?auto_8837 ?auto_8838 ?auto_8839 ?auto_8840 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8841 - BLOCK
      ?auto_8842 - BLOCK
      ?auto_8843 - BLOCK
      ?auto_8844 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8841 ?auto_8842 ) ) ( not ( = ?auto_8841 ?auto_8843 ) ) ( not ( = ?auto_8841 ?auto_8844 ) ) ( not ( = ?auto_8842 ?auto_8843 ) ) ( not ( = ?auto_8842 ?auto_8844 ) ) ( not ( = ?auto_8843 ?auto_8844 ) ) ( ON-TABLE ?auto_8844 ) ( ON ?auto_8843 ?auto_8844 ) ( ON ?auto_8842 ?auto_8843 ) ( HOLDING ?auto_8841 ) ( CLEAR ?auto_8842 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8844 ?auto_8843 ?auto_8842 ?auto_8841 )
      ( MAKE-4PILE ?auto_8841 ?auto_8842 ?auto_8843 ?auto_8844 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8845 - BLOCK
      ?auto_8846 - BLOCK
      ?auto_8847 - BLOCK
      ?auto_8848 - BLOCK
    )
    :vars
    (
      ?auto_8849 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8845 ?auto_8846 ) ) ( not ( = ?auto_8845 ?auto_8847 ) ) ( not ( = ?auto_8845 ?auto_8848 ) ) ( not ( = ?auto_8846 ?auto_8847 ) ) ( not ( = ?auto_8846 ?auto_8848 ) ) ( not ( = ?auto_8847 ?auto_8848 ) ) ( ON-TABLE ?auto_8848 ) ( ON ?auto_8847 ?auto_8848 ) ( ON ?auto_8846 ?auto_8847 ) ( CLEAR ?auto_8846 ) ( ON ?auto_8845 ?auto_8849 ) ( CLEAR ?auto_8845 ) ( HAND-EMPTY ) ( not ( = ?auto_8845 ?auto_8849 ) ) ( not ( = ?auto_8846 ?auto_8849 ) ) ( not ( = ?auto_8847 ?auto_8849 ) ) ( not ( = ?auto_8848 ?auto_8849 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8845 ?auto_8849 )
      ( MAKE-4PILE ?auto_8845 ?auto_8846 ?auto_8847 ?auto_8848 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8850 - BLOCK
      ?auto_8851 - BLOCK
      ?auto_8852 - BLOCK
      ?auto_8853 - BLOCK
    )
    :vars
    (
      ?auto_8854 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8850 ?auto_8851 ) ) ( not ( = ?auto_8850 ?auto_8852 ) ) ( not ( = ?auto_8850 ?auto_8853 ) ) ( not ( = ?auto_8851 ?auto_8852 ) ) ( not ( = ?auto_8851 ?auto_8853 ) ) ( not ( = ?auto_8852 ?auto_8853 ) ) ( ON-TABLE ?auto_8853 ) ( ON ?auto_8852 ?auto_8853 ) ( ON ?auto_8850 ?auto_8854 ) ( CLEAR ?auto_8850 ) ( not ( = ?auto_8850 ?auto_8854 ) ) ( not ( = ?auto_8851 ?auto_8854 ) ) ( not ( = ?auto_8852 ?auto_8854 ) ) ( not ( = ?auto_8853 ?auto_8854 ) ) ( HOLDING ?auto_8851 ) ( CLEAR ?auto_8852 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8853 ?auto_8852 ?auto_8851 )
      ( MAKE-4PILE ?auto_8850 ?auto_8851 ?auto_8852 ?auto_8853 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8855 - BLOCK
      ?auto_8856 - BLOCK
      ?auto_8857 - BLOCK
      ?auto_8858 - BLOCK
    )
    :vars
    (
      ?auto_8859 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8855 ?auto_8856 ) ) ( not ( = ?auto_8855 ?auto_8857 ) ) ( not ( = ?auto_8855 ?auto_8858 ) ) ( not ( = ?auto_8856 ?auto_8857 ) ) ( not ( = ?auto_8856 ?auto_8858 ) ) ( not ( = ?auto_8857 ?auto_8858 ) ) ( ON-TABLE ?auto_8858 ) ( ON ?auto_8857 ?auto_8858 ) ( ON ?auto_8855 ?auto_8859 ) ( not ( = ?auto_8855 ?auto_8859 ) ) ( not ( = ?auto_8856 ?auto_8859 ) ) ( not ( = ?auto_8857 ?auto_8859 ) ) ( not ( = ?auto_8858 ?auto_8859 ) ) ( CLEAR ?auto_8857 ) ( ON ?auto_8856 ?auto_8855 ) ( CLEAR ?auto_8856 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8859 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8859 ?auto_8855 )
      ( MAKE-4PILE ?auto_8855 ?auto_8856 ?auto_8857 ?auto_8858 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8860 - BLOCK
      ?auto_8861 - BLOCK
      ?auto_8862 - BLOCK
      ?auto_8863 - BLOCK
    )
    :vars
    (
      ?auto_8864 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8860 ?auto_8861 ) ) ( not ( = ?auto_8860 ?auto_8862 ) ) ( not ( = ?auto_8860 ?auto_8863 ) ) ( not ( = ?auto_8861 ?auto_8862 ) ) ( not ( = ?auto_8861 ?auto_8863 ) ) ( not ( = ?auto_8862 ?auto_8863 ) ) ( ON-TABLE ?auto_8863 ) ( ON ?auto_8860 ?auto_8864 ) ( not ( = ?auto_8860 ?auto_8864 ) ) ( not ( = ?auto_8861 ?auto_8864 ) ) ( not ( = ?auto_8862 ?auto_8864 ) ) ( not ( = ?auto_8863 ?auto_8864 ) ) ( ON ?auto_8861 ?auto_8860 ) ( CLEAR ?auto_8861 ) ( ON-TABLE ?auto_8864 ) ( HOLDING ?auto_8862 ) ( CLEAR ?auto_8863 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8863 ?auto_8862 )
      ( MAKE-4PILE ?auto_8860 ?auto_8861 ?auto_8862 ?auto_8863 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8865 - BLOCK
      ?auto_8866 - BLOCK
      ?auto_8867 - BLOCK
      ?auto_8868 - BLOCK
    )
    :vars
    (
      ?auto_8869 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8865 ?auto_8866 ) ) ( not ( = ?auto_8865 ?auto_8867 ) ) ( not ( = ?auto_8865 ?auto_8868 ) ) ( not ( = ?auto_8866 ?auto_8867 ) ) ( not ( = ?auto_8866 ?auto_8868 ) ) ( not ( = ?auto_8867 ?auto_8868 ) ) ( ON-TABLE ?auto_8868 ) ( ON ?auto_8865 ?auto_8869 ) ( not ( = ?auto_8865 ?auto_8869 ) ) ( not ( = ?auto_8866 ?auto_8869 ) ) ( not ( = ?auto_8867 ?auto_8869 ) ) ( not ( = ?auto_8868 ?auto_8869 ) ) ( ON ?auto_8866 ?auto_8865 ) ( ON-TABLE ?auto_8869 ) ( CLEAR ?auto_8868 ) ( ON ?auto_8867 ?auto_8866 ) ( CLEAR ?auto_8867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8869 ?auto_8865 ?auto_8866 )
      ( MAKE-4PILE ?auto_8865 ?auto_8866 ?auto_8867 ?auto_8868 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8870 - BLOCK
      ?auto_8871 - BLOCK
      ?auto_8872 - BLOCK
      ?auto_8873 - BLOCK
    )
    :vars
    (
      ?auto_8874 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8870 ?auto_8871 ) ) ( not ( = ?auto_8870 ?auto_8872 ) ) ( not ( = ?auto_8870 ?auto_8873 ) ) ( not ( = ?auto_8871 ?auto_8872 ) ) ( not ( = ?auto_8871 ?auto_8873 ) ) ( not ( = ?auto_8872 ?auto_8873 ) ) ( ON ?auto_8870 ?auto_8874 ) ( not ( = ?auto_8870 ?auto_8874 ) ) ( not ( = ?auto_8871 ?auto_8874 ) ) ( not ( = ?auto_8872 ?auto_8874 ) ) ( not ( = ?auto_8873 ?auto_8874 ) ) ( ON ?auto_8871 ?auto_8870 ) ( ON-TABLE ?auto_8874 ) ( ON ?auto_8872 ?auto_8871 ) ( CLEAR ?auto_8872 ) ( HOLDING ?auto_8873 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8873 )
      ( MAKE-4PILE ?auto_8870 ?auto_8871 ?auto_8872 ?auto_8873 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8875 - BLOCK
      ?auto_8876 - BLOCK
      ?auto_8877 - BLOCK
      ?auto_8878 - BLOCK
    )
    :vars
    (
      ?auto_8879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8875 ?auto_8876 ) ) ( not ( = ?auto_8875 ?auto_8877 ) ) ( not ( = ?auto_8875 ?auto_8878 ) ) ( not ( = ?auto_8876 ?auto_8877 ) ) ( not ( = ?auto_8876 ?auto_8878 ) ) ( not ( = ?auto_8877 ?auto_8878 ) ) ( ON ?auto_8875 ?auto_8879 ) ( not ( = ?auto_8875 ?auto_8879 ) ) ( not ( = ?auto_8876 ?auto_8879 ) ) ( not ( = ?auto_8877 ?auto_8879 ) ) ( not ( = ?auto_8878 ?auto_8879 ) ) ( ON ?auto_8876 ?auto_8875 ) ( ON-TABLE ?auto_8879 ) ( ON ?auto_8877 ?auto_8876 ) ( ON ?auto_8878 ?auto_8877 ) ( CLEAR ?auto_8878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8879 ?auto_8875 ?auto_8876 ?auto_8877 )
      ( MAKE-4PILE ?auto_8875 ?auto_8876 ?auto_8877 ?auto_8878 ) )
  )

)

