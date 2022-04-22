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

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24357 - BLOCK
      ?auto_24358 - BLOCK
      ?auto_24359 - BLOCK
      ?auto_24360 - BLOCK
      ?auto_24361 - BLOCK
    )
    :vars
    (
      ?auto_24362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24362 ?auto_24361 ) ( CLEAR ?auto_24362 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24357 ) ( ON ?auto_24358 ?auto_24357 ) ( ON ?auto_24359 ?auto_24358 ) ( ON ?auto_24360 ?auto_24359 ) ( ON ?auto_24361 ?auto_24360 ) ( not ( = ?auto_24357 ?auto_24358 ) ) ( not ( = ?auto_24357 ?auto_24359 ) ) ( not ( = ?auto_24357 ?auto_24360 ) ) ( not ( = ?auto_24357 ?auto_24361 ) ) ( not ( = ?auto_24357 ?auto_24362 ) ) ( not ( = ?auto_24358 ?auto_24359 ) ) ( not ( = ?auto_24358 ?auto_24360 ) ) ( not ( = ?auto_24358 ?auto_24361 ) ) ( not ( = ?auto_24358 ?auto_24362 ) ) ( not ( = ?auto_24359 ?auto_24360 ) ) ( not ( = ?auto_24359 ?auto_24361 ) ) ( not ( = ?auto_24359 ?auto_24362 ) ) ( not ( = ?auto_24360 ?auto_24361 ) ) ( not ( = ?auto_24360 ?auto_24362 ) ) ( not ( = ?auto_24361 ?auto_24362 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24362 ?auto_24361 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24364 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_24364 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_24364 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24365 - BLOCK
    )
    :vars
    (
      ?auto_24366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24365 ?auto_24366 ) ( CLEAR ?auto_24365 ) ( HAND-EMPTY ) ( not ( = ?auto_24365 ?auto_24366 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24365 ?auto_24366 )
      ( MAKE-1PILE ?auto_24365 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24371 - BLOCK
      ?auto_24372 - BLOCK
      ?auto_24373 - BLOCK
      ?auto_24374 - BLOCK
    )
    :vars
    (
      ?auto_24375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24375 ?auto_24374 ) ( CLEAR ?auto_24375 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24371 ) ( ON ?auto_24372 ?auto_24371 ) ( ON ?auto_24373 ?auto_24372 ) ( ON ?auto_24374 ?auto_24373 ) ( not ( = ?auto_24371 ?auto_24372 ) ) ( not ( = ?auto_24371 ?auto_24373 ) ) ( not ( = ?auto_24371 ?auto_24374 ) ) ( not ( = ?auto_24371 ?auto_24375 ) ) ( not ( = ?auto_24372 ?auto_24373 ) ) ( not ( = ?auto_24372 ?auto_24374 ) ) ( not ( = ?auto_24372 ?auto_24375 ) ) ( not ( = ?auto_24373 ?auto_24374 ) ) ( not ( = ?auto_24373 ?auto_24375 ) ) ( not ( = ?auto_24374 ?auto_24375 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24375 ?auto_24374 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24376 - BLOCK
      ?auto_24377 - BLOCK
      ?auto_24378 - BLOCK
      ?auto_24379 - BLOCK
    )
    :vars
    (
      ?auto_24380 - BLOCK
      ?auto_24381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24380 ?auto_24379 ) ( CLEAR ?auto_24380 ) ( ON-TABLE ?auto_24376 ) ( ON ?auto_24377 ?auto_24376 ) ( ON ?auto_24378 ?auto_24377 ) ( ON ?auto_24379 ?auto_24378 ) ( not ( = ?auto_24376 ?auto_24377 ) ) ( not ( = ?auto_24376 ?auto_24378 ) ) ( not ( = ?auto_24376 ?auto_24379 ) ) ( not ( = ?auto_24376 ?auto_24380 ) ) ( not ( = ?auto_24377 ?auto_24378 ) ) ( not ( = ?auto_24377 ?auto_24379 ) ) ( not ( = ?auto_24377 ?auto_24380 ) ) ( not ( = ?auto_24378 ?auto_24379 ) ) ( not ( = ?auto_24378 ?auto_24380 ) ) ( not ( = ?auto_24379 ?auto_24380 ) ) ( HOLDING ?auto_24381 ) ( not ( = ?auto_24376 ?auto_24381 ) ) ( not ( = ?auto_24377 ?auto_24381 ) ) ( not ( = ?auto_24378 ?auto_24381 ) ) ( not ( = ?auto_24379 ?auto_24381 ) ) ( not ( = ?auto_24380 ?auto_24381 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_24381 )
      ( MAKE-4PILE ?auto_24376 ?auto_24377 ?auto_24378 ?auto_24379 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24382 - BLOCK
      ?auto_24383 - BLOCK
      ?auto_24384 - BLOCK
      ?auto_24385 - BLOCK
    )
    :vars
    (
      ?auto_24386 - BLOCK
      ?auto_24387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24386 ?auto_24385 ) ( ON-TABLE ?auto_24382 ) ( ON ?auto_24383 ?auto_24382 ) ( ON ?auto_24384 ?auto_24383 ) ( ON ?auto_24385 ?auto_24384 ) ( not ( = ?auto_24382 ?auto_24383 ) ) ( not ( = ?auto_24382 ?auto_24384 ) ) ( not ( = ?auto_24382 ?auto_24385 ) ) ( not ( = ?auto_24382 ?auto_24386 ) ) ( not ( = ?auto_24383 ?auto_24384 ) ) ( not ( = ?auto_24383 ?auto_24385 ) ) ( not ( = ?auto_24383 ?auto_24386 ) ) ( not ( = ?auto_24384 ?auto_24385 ) ) ( not ( = ?auto_24384 ?auto_24386 ) ) ( not ( = ?auto_24385 ?auto_24386 ) ) ( not ( = ?auto_24382 ?auto_24387 ) ) ( not ( = ?auto_24383 ?auto_24387 ) ) ( not ( = ?auto_24384 ?auto_24387 ) ) ( not ( = ?auto_24385 ?auto_24387 ) ) ( not ( = ?auto_24386 ?auto_24387 ) ) ( ON ?auto_24387 ?auto_24386 ) ( CLEAR ?auto_24387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24382 ?auto_24383 ?auto_24384 ?auto_24385 ?auto_24386 )
      ( MAKE-4PILE ?auto_24382 ?auto_24383 ?auto_24384 ?auto_24385 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24390 - BLOCK
      ?auto_24391 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_24391 ) ( CLEAR ?auto_24390 ) ( ON-TABLE ?auto_24390 ) ( not ( = ?auto_24390 ?auto_24391 ) ) )
    :subtasks
    ( ( !STACK ?auto_24391 ?auto_24390 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24392 - BLOCK
      ?auto_24393 - BLOCK
    )
    :vars
    (
      ?auto_24394 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_24392 ) ( ON-TABLE ?auto_24392 ) ( not ( = ?auto_24392 ?auto_24393 ) ) ( ON ?auto_24393 ?auto_24394 ) ( CLEAR ?auto_24393 ) ( HAND-EMPTY ) ( not ( = ?auto_24392 ?auto_24394 ) ) ( not ( = ?auto_24393 ?auto_24394 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24393 ?auto_24394 )
      ( MAKE-2PILE ?auto_24392 ?auto_24393 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24395 - BLOCK
      ?auto_24396 - BLOCK
    )
    :vars
    (
      ?auto_24397 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24395 ?auto_24396 ) ) ( ON ?auto_24396 ?auto_24397 ) ( CLEAR ?auto_24396 ) ( not ( = ?auto_24395 ?auto_24397 ) ) ( not ( = ?auto_24396 ?auto_24397 ) ) ( HOLDING ?auto_24395 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24395 )
      ( MAKE-2PILE ?auto_24395 ?auto_24396 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24398 - BLOCK
      ?auto_24399 - BLOCK
    )
    :vars
    (
      ?auto_24400 - BLOCK
      ?auto_24402 - BLOCK
      ?auto_24403 - BLOCK
      ?auto_24401 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24398 ?auto_24399 ) ) ( ON ?auto_24399 ?auto_24400 ) ( not ( = ?auto_24398 ?auto_24400 ) ) ( not ( = ?auto_24399 ?auto_24400 ) ) ( ON ?auto_24398 ?auto_24399 ) ( CLEAR ?auto_24398 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24402 ) ( ON ?auto_24403 ?auto_24402 ) ( ON ?auto_24401 ?auto_24403 ) ( ON ?auto_24400 ?auto_24401 ) ( not ( = ?auto_24402 ?auto_24403 ) ) ( not ( = ?auto_24402 ?auto_24401 ) ) ( not ( = ?auto_24402 ?auto_24400 ) ) ( not ( = ?auto_24402 ?auto_24399 ) ) ( not ( = ?auto_24402 ?auto_24398 ) ) ( not ( = ?auto_24403 ?auto_24401 ) ) ( not ( = ?auto_24403 ?auto_24400 ) ) ( not ( = ?auto_24403 ?auto_24399 ) ) ( not ( = ?auto_24403 ?auto_24398 ) ) ( not ( = ?auto_24401 ?auto_24400 ) ) ( not ( = ?auto_24401 ?auto_24399 ) ) ( not ( = ?auto_24401 ?auto_24398 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24402 ?auto_24403 ?auto_24401 ?auto_24400 ?auto_24399 )
      ( MAKE-2PILE ?auto_24398 ?auto_24399 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24407 - BLOCK
      ?auto_24408 - BLOCK
      ?auto_24409 - BLOCK
    )
    :vars
    (
      ?auto_24410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24410 ?auto_24409 ) ( CLEAR ?auto_24410 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24407 ) ( ON ?auto_24408 ?auto_24407 ) ( ON ?auto_24409 ?auto_24408 ) ( not ( = ?auto_24407 ?auto_24408 ) ) ( not ( = ?auto_24407 ?auto_24409 ) ) ( not ( = ?auto_24407 ?auto_24410 ) ) ( not ( = ?auto_24408 ?auto_24409 ) ) ( not ( = ?auto_24408 ?auto_24410 ) ) ( not ( = ?auto_24409 ?auto_24410 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24410 ?auto_24409 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24411 - BLOCK
      ?auto_24412 - BLOCK
      ?auto_24413 - BLOCK
    )
    :vars
    (
      ?auto_24414 - BLOCK
      ?auto_24415 - BLOCK
      ?auto_24416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24414 ?auto_24413 ) ( CLEAR ?auto_24414 ) ( ON-TABLE ?auto_24411 ) ( ON ?auto_24412 ?auto_24411 ) ( ON ?auto_24413 ?auto_24412 ) ( not ( = ?auto_24411 ?auto_24412 ) ) ( not ( = ?auto_24411 ?auto_24413 ) ) ( not ( = ?auto_24411 ?auto_24414 ) ) ( not ( = ?auto_24412 ?auto_24413 ) ) ( not ( = ?auto_24412 ?auto_24414 ) ) ( not ( = ?auto_24413 ?auto_24414 ) ) ( HOLDING ?auto_24415 ) ( CLEAR ?auto_24416 ) ( not ( = ?auto_24411 ?auto_24415 ) ) ( not ( = ?auto_24411 ?auto_24416 ) ) ( not ( = ?auto_24412 ?auto_24415 ) ) ( not ( = ?auto_24412 ?auto_24416 ) ) ( not ( = ?auto_24413 ?auto_24415 ) ) ( not ( = ?auto_24413 ?auto_24416 ) ) ( not ( = ?auto_24414 ?auto_24415 ) ) ( not ( = ?auto_24414 ?auto_24416 ) ) ( not ( = ?auto_24415 ?auto_24416 ) ) )
    :subtasks
    ( ( !STACK ?auto_24415 ?auto_24416 )
      ( MAKE-3PILE ?auto_24411 ?auto_24412 ?auto_24413 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24417 - BLOCK
      ?auto_24418 - BLOCK
      ?auto_24419 - BLOCK
    )
    :vars
    (
      ?auto_24422 - BLOCK
      ?auto_24421 - BLOCK
      ?auto_24420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24422 ?auto_24419 ) ( ON-TABLE ?auto_24417 ) ( ON ?auto_24418 ?auto_24417 ) ( ON ?auto_24419 ?auto_24418 ) ( not ( = ?auto_24417 ?auto_24418 ) ) ( not ( = ?auto_24417 ?auto_24419 ) ) ( not ( = ?auto_24417 ?auto_24422 ) ) ( not ( = ?auto_24418 ?auto_24419 ) ) ( not ( = ?auto_24418 ?auto_24422 ) ) ( not ( = ?auto_24419 ?auto_24422 ) ) ( CLEAR ?auto_24421 ) ( not ( = ?auto_24417 ?auto_24420 ) ) ( not ( = ?auto_24417 ?auto_24421 ) ) ( not ( = ?auto_24418 ?auto_24420 ) ) ( not ( = ?auto_24418 ?auto_24421 ) ) ( not ( = ?auto_24419 ?auto_24420 ) ) ( not ( = ?auto_24419 ?auto_24421 ) ) ( not ( = ?auto_24422 ?auto_24420 ) ) ( not ( = ?auto_24422 ?auto_24421 ) ) ( not ( = ?auto_24420 ?auto_24421 ) ) ( ON ?auto_24420 ?auto_24422 ) ( CLEAR ?auto_24420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24417 ?auto_24418 ?auto_24419 ?auto_24422 )
      ( MAKE-3PILE ?auto_24417 ?auto_24418 ?auto_24419 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24423 - BLOCK
      ?auto_24424 - BLOCK
      ?auto_24425 - BLOCK
    )
    :vars
    (
      ?auto_24428 - BLOCK
      ?auto_24426 - BLOCK
      ?auto_24427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24428 ?auto_24425 ) ( ON-TABLE ?auto_24423 ) ( ON ?auto_24424 ?auto_24423 ) ( ON ?auto_24425 ?auto_24424 ) ( not ( = ?auto_24423 ?auto_24424 ) ) ( not ( = ?auto_24423 ?auto_24425 ) ) ( not ( = ?auto_24423 ?auto_24428 ) ) ( not ( = ?auto_24424 ?auto_24425 ) ) ( not ( = ?auto_24424 ?auto_24428 ) ) ( not ( = ?auto_24425 ?auto_24428 ) ) ( not ( = ?auto_24423 ?auto_24426 ) ) ( not ( = ?auto_24423 ?auto_24427 ) ) ( not ( = ?auto_24424 ?auto_24426 ) ) ( not ( = ?auto_24424 ?auto_24427 ) ) ( not ( = ?auto_24425 ?auto_24426 ) ) ( not ( = ?auto_24425 ?auto_24427 ) ) ( not ( = ?auto_24428 ?auto_24426 ) ) ( not ( = ?auto_24428 ?auto_24427 ) ) ( not ( = ?auto_24426 ?auto_24427 ) ) ( ON ?auto_24426 ?auto_24428 ) ( CLEAR ?auto_24426 ) ( HOLDING ?auto_24427 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24427 )
      ( MAKE-3PILE ?auto_24423 ?auto_24424 ?auto_24425 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24429 - BLOCK
      ?auto_24430 - BLOCK
      ?auto_24431 - BLOCK
    )
    :vars
    (
      ?auto_24432 - BLOCK
      ?auto_24434 - BLOCK
      ?auto_24433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24432 ?auto_24431 ) ( ON-TABLE ?auto_24429 ) ( ON ?auto_24430 ?auto_24429 ) ( ON ?auto_24431 ?auto_24430 ) ( not ( = ?auto_24429 ?auto_24430 ) ) ( not ( = ?auto_24429 ?auto_24431 ) ) ( not ( = ?auto_24429 ?auto_24432 ) ) ( not ( = ?auto_24430 ?auto_24431 ) ) ( not ( = ?auto_24430 ?auto_24432 ) ) ( not ( = ?auto_24431 ?auto_24432 ) ) ( not ( = ?auto_24429 ?auto_24434 ) ) ( not ( = ?auto_24429 ?auto_24433 ) ) ( not ( = ?auto_24430 ?auto_24434 ) ) ( not ( = ?auto_24430 ?auto_24433 ) ) ( not ( = ?auto_24431 ?auto_24434 ) ) ( not ( = ?auto_24431 ?auto_24433 ) ) ( not ( = ?auto_24432 ?auto_24434 ) ) ( not ( = ?auto_24432 ?auto_24433 ) ) ( not ( = ?auto_24434 ?auto_24433 ) ) ( ON ?auto_24434 ?auto_24432 ) ( ON ?auto_24433 ?auto_24434 ) ( CLEAR ?auto_24433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24429 ?auto_24430 ?auto_24431 ?auto_24432 ?auto_24434 )
      ( MAKE-3PILE ?auto_24429 ?auto_24430 ?auto_24431 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24438 - BLOCK
      ?auto_24439 - BLOCK
      ?auto_24440 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_24440 ) ( CLEAR ?auto_24439 ) ( ON-TABLE ?auto_24438 ) ( ON ?auto_24439 ?auto_24438 ) ( not ( = ?auto_24438 ?auto_24439 ) ) ( not ( = ?auto_24438 ?auto_24440 ) ) ( not ( = ?auto_24439 ?auto_24440 ) ) )
    :subtasks
    ( ( !STACK ?auto_24440 ?auto_24439 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24441 - BLOCK
      ?auto_24442 - BLOCK
      ?auto_24443 - BLOCK
    )
    :vars
    (
      ?auto_24444 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_24442 ) ( ON-TABLE ?auto_24441 ) ( ON ?auto_24442 ?auto_24441 ) ( not ( = ?auto_24441 ?auto_24442 ) ) ( not ( = ?auto_24441 ?auto_24443 ) ) ( not ( = ?auto_24442 ?auto_24443 ) ) ( ON ?auto_24443 ?auto_24444 ) ( CLEAR ?auto_24443 ) ( HAND-EMPTY ) ( not ( = ?auto_24441 ?auto_24444 ) ) ( not ( = ?auto_24442 ?auto_24444 ) ) ( not ( = ?auto_24443 ?auto_24444 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24443 ?auto_24444 )
      ( MAKE-3PILE ?auto_24441 ?auto_24442 ?auto_24443 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24445 - BLOCK
      ?auto_24446 - BLOCK
      ?auto_24447 - BLOCK
    )
    :vars
    (
      ?auto_24448 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24445 ) ( not ( = ?auto_24445 ?auto_24446 ) ) ( not ( = ?auto_24445 ?auto_24447 ) ) ( not ( = ?auto_24446 ?auto_24447 ) ) ( ON ?auto_24447 ?auto_24448 ) ( CLEAR ?auto_24447 ) ( not ( = ?auto_24445 ?auto_24448 ) ) ( not ( = ?auto_24446 ?auto_24448 ) ) ( not ( = ?auto_24447 ?auto_24448 ) ) ( HOLDING ?auto_24446 ) ( CLEAR ?auto_24445 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24445 ?auto_24446 )
      ( MAKE-3PILE ?auto_24445 ?auto_24446 ?auto_24447 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24449 - BLOCK
      ?auto_24450 - BLOCK
      ?auto_24451 - BLOCK
    )
    :vars
    (
      ?auto_24452 - BLOCK
      ?auto_24453 - BLOCK
      ?auto_24454 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24449 ) ( not ( = ?auto_24449 ?auto_24450 ) ) ( not ( = ?auto_24449 ?auto_24451 ) ) ( not ( = ?auto_24450 ?auto_24451 ) ) ( ON ?auto_24451 ?auto_24452 ) ( not ( = ?auto_24449 ?auto_24452 ) ) ( not ( = ?auto_24450 ?auto_24452 ) ) ( not ( = ?auto_24451 ?auto_24452 ) ) ( CLEAR ?auto_24449 ) ( ON ?auto_24450 ?auto_24451 ) ( CLEAR ?auto_24450 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24453 ) ( ON ?auto_24454 ?auto_24453 ) ( ON ?auto_24452 ?auto_24454 ) ( not ( = ?auto_24453 ?auto_24454 ) ) ( not ( = ?auto_24453 ?auto_24452 ) ) ( not ( = ?auto_24453 ?auto_24451 ) ) ( not ( = ?auto_24453 ?auto_24450 ) ) ( not ( = ?auto_24454 ?auto_24452 ) ) ( not ( = ?auto_24454 ?auto_24451 ) ) ( not ( = ?auto_24454 ?auto_24450 ) ) ( not ( = ?auto_24449 ?auto_24453 ) ) ( not ( = ?auto_24449 ?auto_24454 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24453 ?auto_24454 ?auto_24452 ?auto_24451 )
      ( MAKE-3PILE ?auto_24449 ?auto_24450 ?auto_24451 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24455 - BLOCK
      ?auto_24456 - BLOCK
      ?auto_24457 - BLOCK
    )
    :vars
    (
      ?auto_24460 - BLOCK
      ?auto_24459 - BLOCK
      ?auto_24458 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24455 ?auto_24456 ) ) ( not ( = ?auto_24455 ?auto_24457 ) ) ( not ( = ?auto_24456 ?auto_24457 ) ) ( ON ?auto_24457 ?auto_24460 ) ( not ( = ?auto_24455 ?auto_24460 ) ) ( not ( = ?auto_24456 ?auto_24460 ) ) ( not ( = ?auto_24457 ?auto_24460 ) ) ( ON ?auto_24456 ?auto_24457 ) ( CLEAR ?auto_24456 ) ( ON-TABLE ?auto_24459 ) ( ON ?auto_24458 ?auto_24459 ) ( ON ?auto_24460 ?auto_24458 ) ( not ( = ?auto_24459 ?auto_24458 ) ) ( not ( = ?auto_24459 ?auto_24460 ) ) ( not ( = ?auto_24459 ?auto_24457 ) ) ( not ( = ?auto_24459 ?auto_24456 ) ) ( not ( = ?auto_24458 ?auto_24460 ) ) ( not ( = ?auto_24458 ?auto_24457 ) ) ( not ( = ?auto_24458 ?auto_24456 ) ) ( not ( = ?auto_24455 ?auto_24459 ) ) ( not ( = ?auto_24455 ?auto_24458 ) ) ( HOLDING ?auto_24455 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24455 )
      ( MAKE-3PILE ?auto_24455 ?auto_24456 ?auto_24457 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24461 - BLOCK
      ?auto_24462 - BLOCK
      ?auto_24463 - BLOCK
    )
    :vars
    (
      ?auto_24466 - BLOCK
      ?auto_24465 - BLOCK
      ?auto_24464 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24461 ?auto_24462 ) ) ( not ( = ?auto_24461 ?auto_24463 ) ) ( not ( = ?auto_24462 ?auto_24463 ) ) ( ON ?auto_24463 ?auto_24466 ) ( not ( = ?auto_24461 ?auto_24466 ) ) ( not ( = ?auto_24462 ?auto_24466 ) ) ( not ( = ?auto_24463 ?auto_24466 ) ) ( ON ?auto_24462 ?auto_24463 ) ( ON-TABLE ?auto_24465 ) ( ON ?auto_24464 ?auto_24465 ) ( ON ?auto_24466 ?auto_24464 ) ( not ( = ?auto_24465 ?auto_24464 ) ) ( not ( = ?auto_24465 ?auto_24466 ) ) ( not ( = ?auto_24465 ?auto_24463 ) ) ( not ( = ?auto_24465 ?auto_24462 ) ) ( not ( = ?auto_24464 ?auto_24466 ) ) ( not ( = ?auto_24464 ?auto_24463 ) ) ( not ( = ?auto_24464 ?auto_24462 ) ) ( not ( = ?auto_24461 ?auto_24465 ) ) ( not ( = ?auto_24461 ?auto_24464 ) ) ( ON ?auto_24461 ?auto_24462 ) ( CLEAR ?auto_24461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24465 ?auto_24464 ?auto_24466 ?auto_24463 ?auto_24462 )
      ( MAKE-3PILE ?auto_24461 ?auto_24462 ?auto_24463 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24469 - BLOCK
      ?auto_24470 - BLOCK
    )
    :vars
    (
      ?auto_24471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24471 ?auto_24470 ) ( CLEAR ?auto_24471 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24469 ) ( ON ?auto_24470 ?auto_24469 ) ( not ( = ?auto_24469 ?auto_24470 ) ) ( not ( = ?auto_24469 ?auto_24471 ) ) ( not ( = ?auto_24470 ?auto_24471 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24471 ?auto_24470 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24472 - BLOCK
      ?auto_24473 - BLOCK
    )
    :vars
    (
      ?auto_24474 - BLOCK
      ?auto_24475 - BLOCK
      ?auto_24476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24474 ?auto_24473 ) ( CLEAR ?auto_24474 ) ( ON-TABLE ?auto_24472 ) ( ON ?auto_24473 ?auto_24472 ) ( not ( = ?auto_24472 ?auto_24473 ) ) ( not ( = ?auto_24472 ?auto_24474 ) ) ( not ( = ?auto_24473 ?auto_24474 ) ) ( HOLDING ?auto_24475 ) ( CLEAR ?auto_24476 ) ( not ( = ?auto_24472 ?auto_24475 ) ) ( not ( = ?auto_24472 ?auto_24476 ) ) ( not ( = ?auto_24473 ?auto_24475 ) ) ( not ( = ?auto_24473 ?auto_24476 ) ) ( not ( = ?auto_24474 ?auto_24475 ) ) ( not ( = ?auto_24474 ?auto_24476 ) ) ( not ( = ?auto_24475 ?auto_24476 ) ) )
    :subtasks
    ( ( !STACK ?auto_24475 ?auto_24476 )
      ( MAKE-2PILE ?auto_24472 ?auto_24473 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24477 - BLOCK
      ?auto_24478 - BLOCK
    )
    :vars
    (
      ?auto_24480 - BLOCK
      ?auto_24481 - BLOCK
      ?auto_24479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24480 ?auto_24478 ) ( ON-TABLE ?auto_24477 ) ( ON ?auto_24478 ?auto_24477 ) ( not ( = ?auto_24477 ?auto_24478 ) ) ( not ( = ?auto_24477 ?auto_24480 ) ) ( not ( = ?auto_24478 ?auto_24480 ) ) ( CLEAR ?auto_24481 ) ( not ( = ?auto_24477 ?auto_24479 ) ) ( not ( = ?auto_24477 ?auto_24481 ) ) ( not ( = ?auto_24478 ?auto_24479 ) ) ( not ( = ?auto_24478 ?auto_24481 ) ) ( not ( = ?auto_24480 ?auto_24479 ) ) ( not ( = ?auto_24480 ?auto_24481 ) ) ( not ( = ?auto_24479 ?auto_24481 ) ) ( ON ?auto_24479 ?auto_24480 ) ( CLEAR ?auto_24479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24477 ?auto_24478 ?auto_24480 )
      ( MAKE-2PILE ?auto_24477 ?auto_24478 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24482 - BLOCK
      ?auto_24483 - BLOCK
    )
    :vars
    (
      ?auto_24485 - BLOCK
      ?auto_24486 - BLOCK
      ?auto_24484 - BLOCK
      ?auto_24487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24485 ?auto_24483 ) ( ON-TABLE ?auto_24482 ) ( ON ?auto_24483 ?auto_24482 ) ( not ( = ?auto_24482 ?auto_24483 ) ) ( not ( = ?auto_24482 ?auto_24485 ) ) ( not ( = ?auto_24483 ?auto_24485 ) ) ( not ( = ?auto_24482 ?auto_24486 ) ) ( not ( = ?auto_24482 ?auto_24484 ) ) ( not ( = ?auto_24483 ?auto_24486 ) ) ( not ( = ?auto_24483 ?auto_24484 ) ) ( not ( = ?auto_24485 ?auto_24486 ) ) ( not ( = ?auto_24485 ?auto_24484 ) ) ( not ( = ?auto_24486 ?auto_24484 ) ) ( ON ?auto_24486 ?auto_24485 ) ( CLEAR ?auto_24486 ) ( HOLDING ?auto_24484 ) ( CLEAR ?auto_24487 ) ( ON-TABLE ?auto_24487 ) ( not ( = ?auto_24487 ?auto_24484 ) ) ( not ( = ?auto_24482 ?auto_24487 ) ) ( not ( = ?auto_24483 ?auto_24487 ) ) ( not ( = ?auto_24485 ?auto_24487 ) ) ( not ( = ?auto_24486 ?auto_24487 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24487 ?auto_24484 )
      ( MAKE-2PILE ?auto_24482 ?auto_24483 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24488 - BLOCK
      ?auto_24489 - BLOCK
    )
    :vars
    (
      ?auto_24492 - BLOCK
      ?auto_24491 - BLOCK
      ?auto_24493 - BLOCK
      ?auto_24490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24492 ?auto_24489 ) ( ON-TABLE ?auto_24488 ) ( ON ?auto_24489 ?auto_24488 ) ( not ( = ?auto_24488 ?auto_24489 ) ) ( not ( = ?auto_24488 ?auto_24492 ) ) ( not ( = ?auto_24489 ?auto_24492 ) ) ( not ( = ?auto_24488 ?auto_24491 ) ) ( not ( = ?auto_24488 ?auto_24493 ) ) ( not ( = ?auto_24489 ?auto_24491 ) ) ( not ( = ?auto_24489 ?auto_24493 ) ) ( not ( = ?auto_24492 ?auto_24491 ) ) ( not ( = ?auto_24492 ?auto_24493 ) ) ( not ( = ?auto_24491 ?auto_24493 ) ) ( ON ?auto_24491 ?auto_24492 ) ( CLEAR ?auto_24490 ) ( ON-TABLE ?auto_24490 ) ( not ( = ?auto_24490 ?auto_24493 ) ) ( not ( = ?auto_24488 ?auto_24490 ) ) ( not ( = ?auto_24489 ?auto_24490 ) ) ( not ( = ?auto_24492 ?auto_24490 ) ) ( not ( = ?auto_24491 ?auto_24490 ) ) ( ON ?auto_24493 ?auto_24491 ) ( CLEAR ?auto_24493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24488 ?auto_24489 ?auto_24492 ?auto_24491 )
      ( MAKE-2PILE ?auto_24488 ?auto_24489 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24494 - BLOCK
      ?auto_24495 - BLOCK
    )
    :vars
    (
      ?auto_24498 - BLOCK
      ?auto_24497 - BLOCK
      ?auto_24499 - BLOCK
      ?auto_24496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24498 ?auto_24495 ) ( ON-TABLE ?auto_24494 ) ( ON ?auto_24495 ?auto_24494 ) ( not ( = ?auto_24494 ?auto_24495 ) ) ( not ( = ?auto_24494 ?auto_24498 ) ) ( not ( = ?auto_24495 ?auto_24498 ) ) ( not ( = ?auto_24494 ?auto_24497 ) ) ( not ( = ?auto_24494 ?auto_24499 ) ) ( not ( = ?auto_24495 ?auto_24497 ) ) ( not ( = ?auto_24495 ?auto_24499 ) ) ( not ( = ?auto_24498 ?auto_24497 ) ) ( not ( = ?auto_24498 ?auto_24499 ) ) ( not ( = ?auto_24497 ?auto_24499 ) ) ( ON ?auto_24497 ?auto_24498 ) ( not ( = ?auto_24496 ?auto_24499 ) ) ( not ( = ?auto_24494 ?auto_24496 ) ) ( not ( = ?auto_24495 ?auto_24496 ) ) ( not ( = ?auto_24498 ?auto_24496 ) ) ( not ( = ?auto_24497 ?auto_24496 ) ) ( ON ?auto_24499 ?auto_24497 ) ( CLEAR ?auto_24499 ) ( HOLDING ?auto_24496 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24496 )
      ( MAKE-2PILE ?auto_24494 ?auto_24495 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24500 - BLOCK
      ?auto_24501 - BLOCK
    )
    :vars
    (
      ?auto_24502 - BLOCK
      ?auto_24503 - BLOCK
      ?auto_24505 - BLOCK
      ?auto_24504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24502 ?auto_24501 ) ( ON-TABLE ?auto_24500 ) ( ON ?auto_24501 ?auto_24500 ) ( not ( = ?auto_24500 ?auto_24501 ) ) ( not ( = ?auto_24500 ?auto_24502 ) ) ( not ( = ?auto_24501 ?auto_24502 ) ) ( not ( = ?auto_24500 ?auto_24503 ) ) ( not ( = ?auto_24500 ?auto_24505 ) ) ( not ( = ?auto_24501 ?auto_24503 ) ) ( not ( = ?auto_24501 ?auto_24505 ) ) ( not ( = ?auto_24502 ?auto_24503 ) ) ( not ( = ?auto_24502 ?auto_24505 ) ) ( not ( = ?auto_24503 ?auto_24505 ) ) ( ON ?auto_24503 ?auto_24502 ) ( not ( = ?auto_24504 ?auto_24505 ) ) ( not ( = ?auto_24500 ?auto_24504 ) ) ( not ( = ?auto_24501 ?auto_24504 ) ) ( not ( = ?auto_24502 ?auto_24504 ) ) ( not ( = ?auto_24503 ?auto_24504 ) ) ( ON ?auto_24505 ?auto_24503 ) ( ON ?auto_24504 ?auto_24505 ) ( CLEAR ?auto_24504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24500 ?auto_24501 ?auto_24502 ?auto_24503 ?auto_24505 )
      ( MAKE-2PILE ?auto_24500 ?auto_24501 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24510 - BLOCK
      ?auto_24511 - BLOCK
      ?auto_24512 - BLOCK
      ?auto_24513 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_24513 ) ( CLEAR ?auto_24512 ) ( ON-TABLE ?auto_24510 ) ( ON ?auto_24511 ?auto_24510 ) ( ON ?auto_24512 ?auto_24511 ) ( not ( = ?auto_24510 ?auto_24511 ) ) ( not ( = ?auto_24510 ?auto_24512 ) ) ( not ( = ?auto_24510 ?auto_24513 ) ) ( not ( = ?auto_24511 ?auto_24512 ) ) ( not ( = ?auto_24511 ?auto_24513 ) ) ( not ( = ?auto_24512 ?auto_24513 ) ) )
    :subtasks
    ( ( !STACK ?auto_24513 ?auto_24512 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24514 - BLOCK
      ?auto_24515 - BLOCK
      ?auto_24516 - BLOCK
      ?auto_24517 - BLOCK
    )
    :vars
    (
      ?auto_24518 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_24516 ) ( ON-TABLE ?auto_24514 ) ( ON ?auto_24515 ?auto_24514 ) ( ON ?auto_24516 ?auto_24515 ) ( not ( = ?auto_24514 ?auto_24515 ) ) ( not ( = ?auto_24514 ?auto_24516 ) ) ( not ( = ?auto_24514 ?auto_24517 ) ) ( not ( = ?auto_24515 ?auto_24516 ) ) ( not ( = ?auto_24515 ?auto_24517 ) ) ( not ( = ?auto_24516 ?auto_24517 ) ) ( ON ?auto_24517 ?auto_24518 ) ( CLEAR ?auto_24517 ) ( HAND-EMPTY ) ( not ( = ?auto_24514 ?auto_24518 ) ) ( not ( = ?auto_24515 ?auto_24518 ) ) ( not ( = ?auto_24516 ?auto_24518 ) ) ( not ( = ?auto_24517 ?auto_24518 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24517 ?auto_24518 )
      ( MAKE-4PILE ?auto_24514 ?auto_24515 ?auto_24516 ?auto_24517 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24519 - BLOCK
      ?auto_24520 - BLOCK
      ?auto_24521 - BLOCK
      ?auto_24522 - BLOCK
    )
    :vars
    (
      ?auto_24523 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24519 ) ( ON ?auto_24520 ?auto_24519 ) ( not ( = ?auto_24519 ?auto_24520 ) ) ( not ( = ?auto_24519 ?auto_24521 ) ) ( not ( = ?auto_24519 ?auto_24522 ) ) ( not ( = ?auto_24520 ?auto_24521 ) ) ( not ( = ?auto_24520 ?auto_24522 ) ) ( not ( = ?auto_24521 ?auto_24522 ) ) ( ON ?auto_24522 ?auto_24523 ) ( CLEAR ?auto_24522 ) ( not ( = ?auto_24519 ?auto_24523 ) ) ( not ( = ?auto_24520 ?auto_24523 ) ) ( not ( = ?auto_24521 ?auto_24523 ) ) ( not ( = ?auto_24522 ?auto_24523 ) ) ( HOLDING ?auto_24521 ) ( CLEAR ?auto_24520 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24519 ?auto_24520 ?auto_24521 )
      ( MAKE-4PILE ?auto_24519 ?auto_24520 ?auto_24521 ?auto_24522 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24524 - BLOCK
      ?auto_24525 - BLOCK
      ?auto_24526 - BLOCK
      ?auto_24527 - BLOCK
    )
    :vars
    (
      ?auto_24528 - BLOCK
      ?auto_24529 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24524 ) ( ON ?auto_24525 ?auto_24524 ) ( not ( = ?auto_24524 ?auto_24525 ) ) ( not ( = ?auto_24524 ?auto_24526 ) ) ( not ( = ?auto_24524 ?auto_24527 ) ) ( not ( = ?auto_24525 ?auto_24526 ) ) ( not ( = ?auto_24525 ?auto_24527 ) ) ( not ( = ?auto_24526 ?auto_24527 ) ) ( ON ?auto_24527 ?auto_24528 ) ( not ( = ?auto_24524 ?auto_24528 ) ) ( not ( = ?auto_24525 ?auto_24528 ) ) ( not ( = ?auto_24526 ?auto_24528 ) ) ( not ( = ?auto_24527 ?auto_24528 ) ) ( CLEAR ?auto_24525 ) ( ON ?auto_24526 ?auto_24527 ) ( CLEAR ?auto_24526 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24529 ) ( ON ?auto_24528 ?auto_24529 ) ( not ( = ?auto_24529 ?auto_24528 ) ) ( not ( = ?auto_24529 ?auto_24527 ) ) ( not ( = ?auto_24529 ?auto_24526 ) ) ( not ( = ?auto_24524 ?auto_24529 ) ) ( not ( = ?auto_24525 ?auto_24529 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24529 ?auto_24528 ?auto_24527 )
      ( MAKE-4PILE ?auto_24524 ?auto_24525 ?auto_24526 ?auto_24527 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24530 - BLOCK
      ?auto_24531 - BLOCK
      ?auto_24532 - BLOCK
      ?auto_24533 - BLOCK
    )
    :vars
    (
      ?auto_24535 - BLOCK
      ?auto_24534 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24530 ) ( not ( = ?auto_24530 ?auto_24531 ) ) ( not ( = ?auto_24530 ?auto_24532 ) ) ( not ( = ?auto_24530 ?auto_24533 ) ) ( not ( = ?auto_24531 ?auto_24532 ) ) ( not ( = ?auto_24531 ?auto_24533 ) ) ( not ( = ?auto_24532 ?auto_24533 ) ) ( ON ?auto_24533 ?auto_24535 ) ( not ( = ?auto_24530 ?auto_24535 ) ) ( not ( = ?auto_24531 ?auto_24535 ) ) ( not ( = ?auto_24532 ?auto_24535 ) ) ( not ( = ?auto_24533 ?auto_24535 ) ) ( ON ?auto_24532 ?auto_24533 ) ( CLEAR ?auto_24532 ) ( ON-TABLE ?auto_24534 ) ( ON ?auto_24535 ?auto_24534 ) ( not ( = ?auto_24534 ?auto_24535 ) ) ( not ( = ?auto_24534 ?auto_24533 ) ) ( not ( = ?auto_24534 ?auto_24532 ) ) ( not ( = ?auto_24530 ?auto_24534 ) ) ( not ( = ?auto_24531 ?auto_24534 ) ) ( HOLDING ?auto_24531 ) ( CLEAR ?auto_24530 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24530 ?auto_24531 )
      ( MAKE-4PILE ?auto_24530 ?auto_24531 ?auto_24532 ?auto_24533 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24536 - BLOCK
      ?auto_24537 - BLOCK
      ?auto_24538 - BLOCK
      ?auto_24539 - BLOCK
    )
    :vars
    (
      ?auto_24540 - BLOCK
      ?auto_24541 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24536 ) ( not ( = ?auto_24536 ?auto_24537 ) ) ( not ( = ?auto_24536 ?auto_24538 ) ) ( not ( = ?auto_24536 ?auto_24539 ) ) ( not ( = ?auto_24537 ?auto_24538 ) ) ( not ( = ?auto_24537 ?auto_24539 ) ) ( not ( = ?auto_24538 ?auto_24539 ) ) ( ON ?auto_24539 ?auto_24540 ) ( not ( = ?auto_24536 ?auto_24540 ) ) ( not ( = ?auto_24537 ?auto_24540 ) ) ( not ( = ?auto_24538 ?auto_24540 ) ) ( not ( = ?auto_24539 ?auto_24540 ) ) ( ON ?auto_24538 ?auto_24539 ) ( ON-TABLE ?auto_24541 ) ( ON ?auto_24540 ?auto_24541 ) ( not ( = ?auto_24541 ?auto_24540 ) ) ( not ( = ?auto_24541 ?auto_24539 ) ) ( not ( = ?auto_24541 ?auto_24538 ) ) ( not ( = ?auto_24536 ?auto_24541 ) ) ( not ( = ?auto_24537 ?auto_24541 ) ) ( CLEAR ?auto_24536 ) ( ON ?auto_24537 ?auto_24538 ) ( CLEAR ?auto_24537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24541 ?auto_24540 ?auto_24539 ?auto_24538 )
      ( MAKE-4PILE ?auto_24536 ?auto_24537 ?auto_24538 ?auto_24539 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24542 - BLOCK
      ?auto_24543 - BLOCK
      ?auto_24544 - BLOCK
      ?auto_24545 - BLOCK
    )
    :vars
    (
      ?auto_24546 - BLOCK
      ?auto_24547 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24542 ?auto_24543 ) ) ( not ( = ?auto_24542 ?auto_24544 ) ) ( not ( = ?auto_24542 ?auto_24545 ) ) ( not ( = ?auto_24543 ?auto_24544 ) ) ( not ( = ?auto_24543 ?auto_24545 ) ) ( not ( = ?auto_24544 ?auto_24545 ) ) ( ON ?auto_24545 ?auto_24546 ) ( not ( = ?auto_24542 ?auto_24546 ) ) ( not ( = ?auto_24543 ?auto_24546 ) ) ( not ( = ?auto_24544 ?auto_24546 ) ) ( not ( = ?auto_24545 ?auto_24546 ) ) ( ON ?auto_24544 ?auto_24545 ) ( ON-TABLE ?auto_24547 ) ( ON ?auto_24546 ?auto_24547 ) ( not ( = ?auto_24547 ?auto_24546 ) ) ( not ( = ?auto_24547 ?auto_24545 ) ) ( not ( = ?auto_24547 ?auto_24544 ) ) ( not ( = ?auto_24542 ?auto_24547 ) ) ( not ( = ?auto_24543 ?auto_24547 ) ) ( ON ?auto_24543 ?auto_24544 ) ( CLEAR ?auto_24543 ) ( HOLDING ?auto_24542 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24542 )
      ( MAKE-4PILE ?auto_24542 ?auto_24543 ?auto_24544 ?auto_24545 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24548 - BLOCK
      ?auto_24549 - BLOCK
      ?auto_24550 - BLOCK
      ?auto_24551 - BLOCK
    )
    :vars
    (
      ?auto_24552 - BLOCK
      ?auto_24553 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24548 ?auto_24549 ) ) ( not ( = ?auto_24548 ?auto_24550 ) ) ( not ( = ?auto_24548 ?auto_24551 ) ) ( not ( = ?auto_24549 ?auto_24550 ) ) ( not ( = ?auto_24549 ?auto_24551 ) ) ( not ( = ?auto_24550 ?auto_24551 ) ) ( ON ?auto_24551 ?auto_24552 ) ( not ( = ?auto_24548 ?auto_24552 ) ) ( not ( = ?auto_24549 ?auto_24552 ) ) ( not ( = ?auto_24550 ?auto_24552 ) ) ( not ( = ?auto_24551 ?auto_24552 ) ) ( ON ?auto_24550 ?auto_24551 ) ( ON-TABLE ?auto_24553 ) ( ON ?auto_24552 ?auto_24553 ) ( not ( = ?auto_24553 ?auto_24552 ) ) ( not ( = ?auto_24553 ?auto_24551 ) ) ( not ( = ?auto_24553 ?auto_24550 ) ) ( not ( = ?auto_24548 ?auto_24553 ) ) ( not ( = ?auto_24549 ?auto_24553 ) ) ( ON ?auto_24549 ?auto_24550 ) ( ON ?auto_24548 ?auto_24549 ) ( CLEAR ?auto_24548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24553 ?auto_24552 ?auto_24551 ?auto_24550 ?auto_24549 )
      ( MAKE-4PILE ?auto_24548 ?auto_24549 ?auto_24550 ?auto_24551 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24555 - BLOCK
    )
    :vars
    (
      ?auto_24556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24556 ?auto_24555 ) ( CLEAR ?auto_24556 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24555 ) ( not ( = ?auto_24555 ?auto_24556 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24556 ?auto_24555 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24557 - BLOCK
    )
    :vars
    (
      ?auto_24558 - BLOCK
      ?auto_24559 - BLOCK
      ?auto_24560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24558 ?auto_24557 ) ( CLEAR ?auto_24558 ) ( ON-TABLE ?auto_24557 ) ( not ( = ?auto_24557 ?auto_24558 ) ) ( HOLDING ?auto_24559 ) ( CLEAR ?auto_24560 ) ( not ( = ?auto_24557 ?auto_24559 ) ) ( not ( = ?auto_24557 ?auto_24560 ) ) ( not ( = ?auto_24558 ?auto_24559 ) ) ( not ( = ?auto_24558 ?auto_24560 ) ) ( not ( = ?auto_24559 ?auto_24560 ) ) )
    :subtasks
    ( ( !STACK ?auto_24559 ?auto_24560 )
      ( MAKE-1PILE ?auto_24557 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24561 - BLOCK
    )
    :vars
    (
      ?auto_24562 - BLOCK
      ?auto_24563 - BLOCK
      ?auto_24564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24562 ?auto_24561 ) ( ON-TABLE ?auto_24561 ) ( not ( = ?auto_24561 ?auto_24562 ) ) ( CLEAR ?auto_24563 ) ( not ( = ?auto_24561 ?auto_24564 ) ) ( not ( = ?auto_24561 ?auto_24563 ) ) ( not ( = ?auto_24562 ?auto_24564 ) ) ( not ( = ?auto_24562 ?auto_24563 ) ) ( not ( = ?auto_24564 ?auto_24563 ) ) ( ON ?auto_24564 ?auto_24562 ) ( CLEAR ?auto_24564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24561 ?auto_24562 )
      ( MAKE-1PILE ?auto_24561 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24565 - BLOCK
    )
    :vars
    (
      ?auto_24566 - BLOCK
      ?auto_24568 - BLOCK
      ?auto_24567 - BLOCK
      ?auto_24570 - BLOCK
      ?auto_24569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24566 ?auto_24565 ) ( ON-TABLE ?auto_24565 ) ( not ( = ?auto_24565 ?auto_24566 ) ) ( not ( = ?auto_24565 ?auto_24568 ) ) ( not ( = ?auto_24565 ?auto_24567 ) ) ( not ( = ?auto_24566 ?auto_24568 ) ) ( not ( = ?auto_24566 ?auto_24567 ) ) ( not ( = ?auto_24568 ?auto_24567 ) ) ( ON ?auto_24568 ?auto_24566 ) ( CLEAR ?auto_24568 ) ( HOLDING ?auto_24567 ) ( CLEAR ?auto_24570 ) ( ON-TABLE ?auto_24569 ) ( ON ?auto_24570 ?auto_24569 ) ( not ( = ?auto_24569 ?auto_24570 ) ) ( not ( = ?auto_24569 ?auto_24567 ) ) ( not ( = ?auto_24570 ?auto_24567 ) ) ( not ( = ?auto_24565 ?auto_24570 ) ) ( not ( = ?auto_24565 ?auto_24569 ) ) ( not ( = ?auto_24566 ?auto_24570 ) ) ( not ( = ?auto_24566 ?auto_24569 ) ) ( not ( = ?auto_24568 ?auto_24570 ) ) ( not ( = ?auto_24568 ?auto_24569 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24569 ?auto_24570 ?auto_24567 )
      ( MAKE-1PILE ?auto_24565 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24571 - BLOCK
    )
    :vars
    (
      ?auto_24573 - BLOCK
      ?auto_24574 - BLOCK
      ?auto_24576 - BLOCK
      ?auto_24575 - BLOCK
      ?auto_24572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24573 ?auto_24571 ) ( ON-TABLE ?auto_24571 ) ( not ( = ?auto_24571 ?auto_24573 ) ) ( not ( = ?auto_24571 ?auto_24574 ) ) ( not ( = ?auto_24571 ?auto_24576 ) ) ( not ( = ?auto_24573 ?auto_24574 ) ) ( not ( = ?auto_24573 ?auto_24576 ) ) ( not ( = ?auto_24574 ?auto_24576 ) ) ( ON ?auto_24574 ?auto_24573 ) ( CLEAR ?auto_24575 ) ( ON-TABLE ?auto_24572 ) ( ON ?auto_24575 ?auto_24572 ) ( not ( = ?auto_24572 ?auto_24575 ) ) ( not ( = ?auto_24572 ?auto_24576 ) ) ( not ( = ?auto_24575 ?auto_24576 ) ) ( not ( = ?auto_24571 ?auto_24575 ) ) ( not ( = ?auto_24571 ?auto_24572 ) ) ( not ( = ?auto_24573 ?auto_24575 ) ) ( not ( = ?auto_24573 ?auto_24572 ) ) ( not ( = ?auto_24574 ?auto_24575 ) ) ( not ( = ?auto_24574 ?auto_24572 ) ) ( ON ?auto_24576 ?auto_24574 ) ( CLEAR ?auto_24576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24571 ?auto_24573 ?auto_24574 )
      ( MAKE-1PILE ?auto_24571 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24577 - BLOCK
    )
    :vars
    (
      ?auto_24580 - BLOCK
      ?auto_24578 - BLOCK
      ?auto_24579 - BLOCK
      ?auto_24582 - BLOCK
      ?auto_24581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24580 ?auto_24577 ) ( ON-TABLE ?auto_24577 ) ( not ( = ?auto_24577 ?auto_24580 ) ) ( not ( = ?auto_24577 ?auto_24578 ) ) ( not ( = ?auto_24577 ?auto_24579 ) ) ( not ( = ?auto_24580 ?auto_24578 ) ) ( not ( = ?auto_24580 ?auto_24579 ) ) ( not ( = ?auto_24578 ?auto_24579 ) ) ( ON ?auto_24578 ?auto_24580 ) ( ON-TABLE ?auto_24582 ) ( not ( = ?auto_24582 ?auto_24581 ) ) ( not ( = ?auto_24582 ?auto_24579 ) ) ( not ( = ?auto_24581 ?auto_24579 ) ) ( not ( = ?auto_24577 ?auto_24581 ) ) ( not ( = ?auto_24577 ?auto_24582 ) ) ( not ( = ?auto_24580 ?auto_24581 ) ) ( not ( = ?auto_24580 ?auto_24582 ) ) ( not ( = ?auto_24578 ?auto_24581 ) ) ( not ( = ?auto_24578 ?auto_24582 ) ) ( ON ?auto_24579 ?auto_24578 ) ( CLEAR ?auto_24579 ) ( HOLDING ?auto_24581 ) ( CLEAR ?auto_24582 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24582 ?auto_24581 )
      ( MAKE-1PILE ?auto_24577 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24583 - BLOCK
    )
    :vars
    (
      ?auto_24587 - BLOCK
      ?auto_24586 - BLOCK
      ?auto_24585 - BLOCK
      ?auto_24584 - BLOCK
      ?auto_24588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24587 ?auto_24583 ) ( ON-TABLE ?auto_24583 ) ( not ( = ?auto_24583 ?auto_24587 ) ) ( not ( = ?auto_24583 ?auto_24586 ) ) ( not ( = ?auto_24583 ?auto_24585 ) ) ( not ( = ?auto_24587 ?auto_24586 ) ) ( not ( = ?auto_24587 ?auto_24585 ) ) ( not ( = ?auto_24586 ?auto_24585 ) ) ( ON ?auto_24586 ?auto_24587 ) ( ON-TABLE ?auto_24584 ) ( not ( = ?auto_24584 ?auto_24588 ) ) ( not ( = ?auto_24584 ?auto_24585 ) ) ( not ( = ?auto_24588 ?auto_24585 ) ) ( not ( = ?auto_24583 ?auto_24588 ) ) ( not ( = ?auto_24583 ?auto_24584 ) ) ( not ( = ?auto_24587 ?auto_24588 ) ) ( not ( = ?auto_24587 ?auto_24584 ) ) ( not ( = ?auto_24586 ?auto_24588 ) ) ( not ( = ?auto_24586 ?auto_24584 ) ) ( ON ?auto_24585 ?auto_24586 ) ( CLEAR ?auto_24584 ) ( ON ?auto_24588 ?auto_24585 ) ( CLEAR ?auto_24588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24583 ?auto_24587 ?auto_24586 ?auto_24585 )
      ( MAKE-1PILE ?auto_24583 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24589 - BLOCK
    )
    :vars
    (
      ?auto_24593 - BLOCK
      ?auto_24591 - BLOCK
      ?auto_24590 - BLOCK
      ?auto_24594 - BLOCK
      ?auto_24592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24593 ?auto_24589 ) ( ON-TABLE ?auto_24589 ) ( not ( = ?auto_24589 ?auto_24593 ) ) ( not ( = ?auto_24589 ?auto_24591 ) ) ( not ( = ?auto_24589 ?auto_24590 ) ) ( not ( = ?auto_24593 ?auto_24591 ) ) ( not ( = ?auto_24593 ?auto_24590 ) ) ( not ( = ?auto_24591 ?auto_24590 ) ) ( ON ?auto_24591 ?auto_24593 ) ( not ( = ?auto_24594 ?auto_24592 ) ) ( not ( = ?auto_24594 ?auto_24590 ) ) ( not ( = ?auto_24592 ?auto_24590 ) ) ( not ( = ?auto_24589 ?auto_24592 ) ) ( not ( = ?auto_24589 ?auto_24594 ) ) ( not ( = ?auto_24593 ?auto_24592 ) ) ( not ( = ?auto_24593 ?auto_24594 ) ) ( not ( = ?auto_24591 ?auto_24592 ) ) ( not ( = ?auto_24591 ?auto_24594 ) ) ( ON ?auto_24590 ?auto_24591 ) ( ON ?auto_24592 ?auto_24590 ) ( CLEAR ?auto_24592 ) ( HOLDING ?auto_24594 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24594 )
      ( MAKE-1PILE ?auto_24589 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24595 - BLOCK
    )
    :vars
    (
      ?auto_24596 - BLOCK
      ?auto_24598 - BLOCK
      ?auto_24599 - BLOCK
      ?auto_24597 - BLOCK
      ?auto_24600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24596 ?auto_24595 ) ( ON-TABLE ?auto_24595 ) ( not ( = ?auto_24595 ?auto_24596 ) ) ( not ( = ?auto_24595 ?auto_24598 ) ) ( not ( = ?auto_24595 ?auto_24599 ) ) ( not ( = ?auto_24596 ?auto_24598 ) ) ( not ( = ?auto_24596 ?auto_24599 ) ) ( not ( = ?auto_24598 ?auto_24599 ) ) ( ON ?auto_24598 ?auto_24596 ) ( not ( = ?auto_24597 ?auto_24600 ) ) ( not ( = ?auto_24597 ?auto_24599 ) ) ( not ( = ?auto_24600 ?auto_24599 ) ) ( not ( = ?auto_24595 ?auto_24600 ) ) ( not ( = ?auto_24595 ?auto_24597 ) ) ( not ( = ?auto_24596 ?auto_24600 ) ) ( not ( = ?auto_24596 ?auto_24597 ) ) ( not ( = ?auto_24598 ?auto_24600 ) ) ( not ( = ?auto_24598 ?auto_24597 ) ) ( ON ?auto_24599 ?auto_24598 ) ( ON ?auto_24600 ?auto_24599 ) ( ON ?auto_24597 ?auto_24600 ) ( CLEAR ?auto_24597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24595 ?auto_24596 ?auto_24598 ?auto_24599 ?auto_24600 )
      ( MAKE-1PILE ?auto_24595 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24606 - BLOCK
      ?auto_24607 - BLOCK
      ?auto_24608 - BLOCK
      ?auto_24609 - BLOCK
      ?auto_24610 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_24610 ) ( CLEAR ?auto_24609 ) ( ON-TABLE ?auto_24606 ) ( ON ?auto_24607 ?auto_24606 ) ( ON ?auto_24608 ?auto_24607 ) ( ON ?auto_24609 ?auto_24608 ) ( not ( = ?auto_24606 ?auto_24607 ) ) ( not ( = ?auto_24606 ?auto_24608 ) ) ( not ( = ?auto_24606 ?auto_24609 ) ) ( not ( = ?auto_24606 ?auto_24610 ) ) ( not ( = ?auto_24607 ?auto_24608 ) ) ( not ( = ?auto_24607 ?auto_24609 ) ) ( not ( = ?auto_24607 ?auto_24610 ) ) ( not ( = ?auto_24608 ?auto_24609 ) ) ( not ( = ?auto_24608 ?auto_24610 ) ) ( not ( = ?auto_24609 ?auto_24610 ) ) )
    :subtasks
    ( ( !STACK ?auto_24610 ?auto_24609 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24611 - BLOCK
      ?auto_24612 - BLOCK
      ?auto_24613 - BLOCK
      ?auto_24614 - BLOCK
      ?auto_24615 - BLOCK
    )
    :vars
    (
      ?auto_24616 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_24614 ) ( ON-TABLE ?auto_24611 ) ( ON ?auto_24612 ?auto_24611 ) ( ON ?auto_24613 ?auto_24612 ) ( ON ?auto_24614 ?auto_24613 ) ( not ( = ?auto_24611 ?auto_24612 ) ) ( not ( = ?auto_24611 ?auto_24613 ) ) ( not ( = ?auto_24611 ?auto_24614 ) ) ( not ( = ?auto_24611 ?auto_24615 ) ) ( not ( = ?auto_24612 ?auto_24613 ) ) ( not ( = ?auto_24612 ?auto_24614 ) ) ( not ( = ?auto_24612 ?auto_24615 ) ) ( not ( = ?auto_24613 ?auto_24614 ) ) ( not ( = ?auto_24613 ?auto_24615 ) ) ( not ( = ?auto_24614 ?auto_24615 ) ) ( ON ?auto_24615 ?auto_24616 ) ( CLEAR ?auto_24615 ) ( HAND-EMPTY ) ( not ( = ?auto_24611 ?auto_24616 ) ) ( not ( = ?auto_24612 ?auto_24616 ) ) ( not ( = ?auto_24613 ?auto_24616 ) ) ( not ( = ?auto_24614 ?auto_24616 ) ) ( not ( = ?auto_24615 ?auto_24616 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24615 ?auto_24616 )
      ( MAKE-5PILE ?auto_24611 ?auto_24612 ?auto_24613 ?auto_24614 ?auto_24615 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24617 - BLOCK
      ?auto_24618 - BLOCK
      ?auto_24619 - BLOCK
      ?auto_24620 - BLOCK
      ?auto_24621 - BLOCK
    )
    :vars
    (
      ?auto_24622 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24617 ) ( ON ?auto_24618 ?auto_24617 ) ( ON ?auto_24619 ?auto_24618 ) ( not ( = ?auto_24617 ?auto_24618 ) ) ( not ( = ?auto_24617 ?auto_24619 ) ) ( not ( = ?auto_24617 ?auto_24620 ) ) ( not ( = ?auto_24617 ?auto_24621 ) ) ( not ( = ?auto_24618 ?auto_24619 ) ) ( not ( = ?auto_24618 ?auto_24620 ) ) ( not ( = ?auto_24618 ?auto_24621 ) ) ( not ( = ?auto_24619 ?auto_24620 ) ) ( not ( = ?auto_24619 ?auto_24621 ) ) ( not ( = ?auto_24620 ?auto_24621 ) ) ( ON ?auto_24621 ?auto_24622 ) ( CLEAR ?auto_24621 ) ( not ( = ?auto_24617 ?auto_24622 ) ) ( not ( = ?auto_24618 ?auto_24622 ) ) ( not ( = ?auto_24619 ?auto_24622 ) ) ( not ( = ?auto_24620 ?auto_24622 ) ) ( not ( = ?auto_24621 ?auto_24622 ) ) ( HOLDING ?auto_24620 ) ( CLEAR ?auto_24619 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24617 ?auto_24618 ?auto_24619 ?auto_24620 )
      ( MAKE-5PILE ?auto_24617 ?auto_24618 ?auto_24619 ?auto_24620 ?auto_24621 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24623 - BLOCK
      ?auto_24624 - BLOCK
      ?auto_24625 - BLOCK
      ?auto_24626 - BLOCK
      ?auto_24627 - BLOCK
    )
    :vars
    (
      ?auto_24628 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24623 ) ( ON ?auto_24624 ?auto_24623 ) ( ON ?auto_24625 ?auto_24624 ) ( not ( = ?auto_24623 ?auto_24624 ) ) ( not ( = ?auto_24623 ?auto_24625 ) ) ( not ( = ?auto_24623 ?auto_24626 ) ) ( not ( = ?auto_24623 ?auto_24627 ) ) ( not ( = ?auto_24624 ?auto_24625 ) ) ( not ( = ?auto_24624 ?auto_24626 ) ) ( not ( = ?auto_24624 ?auto_24627 ) ) ( not ( = ?auto_24625 ?auto_24626 ) ) ( not ( = ?auto_24625 ?auto_24627 ) ) ( not ( = ?auto_24626 ?auto_24627 ) ) ( ON ?auto_24627 ?auto_24628 ) ( not ( = ?auto_24623 ?auto_24628 ) ) ( not ( = ?auto_24624 ?auto_24628 ) ) ( not ( = ?auto_24625 ?auto_24628 ) ) ( not ( = ?auto_24626 ?auto_24628 ) ) ( not ( = ?auto_24627 ?auto_24628 ) ) ( CLEAR ?auto_24625 ) ( ON ?auto_24626 ?auto_24627 ) ( CLEAR ?auto_24626 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24628 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24628 ?auto_24627 )
      ( MAKE-5PILE ?auto_24623 ?auto_24624 ?auto_24625 ?auto_24626 ?auto_24627 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24629 - BLOCK
      ?auto_24630 - BLOCK
      ?auto_24631 - BLOCK
      ?auto_24632 - BLOCK
      ?auto_24633 - BLOCK
    )
    :vars
    (
      ?auto_24634 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24629 ) ( ON ?auto_24630 ?auto_24629 ) ( not ( = ?auto_24629 ?auto_24630 ) ) ( not ( = ?auto_24629 ?auto_24631 ) ) ( not ( = ?auto_24629 ?auto_24632 ) ) ( not ( = ?auto_24629 ?auto_24633 ) ) ( not ( = ?auto_24630 ?auto_24631 ) ) ( not ( = ?auto_24630 ?auto_24632 ) ) ( not ( = ?auto_24630 ?auto_24633 ) ) ( not ( = ?auto_24631 ?auto_24632 ) ) ( not ( = ?auto_24631 ?auto_24633 ) ) ( not ( = ?auto_24632 ?auto_24633 ) ) ( ON ?auto_24633 ?auto_24634 ) ( not ( = ?auto_24629 ?auto_24634 ) ) ( not ( = ?auto_24630 ?auto_24634 ) ) ( not ( = ?auto_24631 ?auto_24634 ) ) ( not ( = ?auto_24632 ?auto_24634 ) ) ( not ( = ?auto_24633 ?auto_24634 ) ) ( ON ?auto_24632 ?auto_24633 ) ( CLEAR ?auto_24632 ) ( ON-TABLE ?auto_24634 ) ( HOLDING ?auto_24631 ) ( CLEAR ?auto_24630 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24629 ?auto_24630 ?auto_24631 )
      ( MAKE-5PILE ?auto_24629 ?auto_24630 ?auto_24631 ?auto_24632 ?auto_24633 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24635 - BLOCK
      ?auto_24636 - BLOCK
      ?auto_24637 - BLOCK
      ?auto_24638 - BLOCK
      ?auto_24639 - BLOCK
    )
    :vars
    (
      ?auto_24640 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24635 ) ( ON ?auto_24636 ?auto_24635 ) ( not ( = ?auto_24635 ?auto_24636 ) ) ( not ( = ?auto_24635 ?auto_24637 ) ) ( not ( = ?auto_24635 ?auto_24638 ) ) ( not ( = ?auto_24635 ?auto_24639 ) ) ( not ( = ?auto_24636 ?auto_24637 ) ) ( not ( = ?auto_24636 ?auto_24638 ) ) ( not ( = ?auto_24636 ?auto_24639 ) ) ( not ( = ?auto_24637 ?auto_24638 ) ) ( not ( = ?auto_24637 ?auto_24639 ) ) ( not ( = ?auto_24638 ?auto_24639 ) ) ( ON ?auto_24639 ?auto_24640 ) ( not ( = ?auto_24635 ?auto_24640 ) ) ( not ( = ?auto_24636 ?auto_24640 ) ) ( not ( = ?auto_24637 ?auto_24640 ) ) ( not ( = ?auto_24638 ?auto_24640 ) ) ( not ( = ?auto_24639 ?auto_24640 ) ) ( ON ?auto_24638 ?auto_24639 ) ( ON-TABLE ?auto_24640 ) ( CLEAR ?auto_24636 ) ( ON ?auto_24637 ?auto_24638 ) ( CLEAR ?auto_24637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24640 ?auto_24639 ?auto_24638 )
      ( MAKE-5PILE ?auto_24635 ?auto_24636 ?auto_24637 ?auto_24638 ?auto_24639 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24641 - BLOCK
      ?auto_24642 - BLOCK
      ?auto_24643 - BLOCK
      ?auto_24644 - BLOCK
      ?auto_24645 - BLOCK
    )
    :vars
    (
      ?auto_24646 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24641 ) ( not ( = ?auto_24641 ?auto_24642 ) ) ( not ( = ?auto_24641 ?auto_24643 ) ) ( not ( = ?auto_24641 ?auto_24644 ) ) ( not ( = ?auto_24641 ?auto_24645 ) ) ( not ( = ?auto_24642 ?auto_24643 ) ) ( not ( = ?auto_24642 ?auto_24644 ) ) ( not ( = ?auto_24642 ?auto_24645 ) ) ( not ( = ?auto_24643 ?auto_24644 ) ) ( not ( = ?auto_24643 ?auto_24645 ) ) ( not ( = ?auto_24644 ?auto_24645 ) ) ( ON ?auto_24645 ?auto_24646 ) ( not ( = ?auto_24641 ?auto_24646 ) ) ( not ( = ?auto_24642 ?auto_24646 ) ) ( not ( = ?auto_24643 ?auto_24646 ) ) ( not ( = ?auto_24644 ?auto_24646 ) ) ( not ( = ?auto_24645 ?auto_24646 ) ) ( ON ?auto_24644 ?auto_24645 ) ( ON-TABLE ?auto_24646 ) ( ON ?auto_24643 ?auto_24644 ) ( CLEAR ?auto_24643 ) ( HOLDING ?auto_24642 ) ( CLEAR ?auto_24641 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24641 ?auto_24642 )
      ( MAKE-5PILE ?auto_24641 ?auto_24642 ?auto_24643 ?auto_24644 ?auto_24645 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24647 - BLOCK
      ?auto_24648 - BLOCK
      ?auto_24649 - BLOCK
      ?auto_24650 - BLOCK
      ?auto_24651 - BLOCK
    )
    :vars
    (
      ?auto_24652 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24647 ) ( not ( = ?auto_24647 ?auto_24648 ) ) ( not ( = ?auto_24647 ?auto_24649 ) ) ( not ( = ?auto_24647 ?auto_24650 ) ) ( not ( = ?auto_24647 ?auto_24651 ) ) ( not ( = ?auto_24648 ?auto_24649 ) ) ( not ( = ?auto_24648 ?auto_24650 ) ) ( not ( = ?auto_24648 ?auto_24651 ) ) ( not ( = ?auto_24649 ?auto_24650 ) ) ( not ( = ?auto_24649 ?auto_24651 ) ) ( not ( = ?auto_24650 ?auto_24651 ) ) ( ON ?auto_24651 ?auto_24652 ) ( not ( = ?auto_24647 ?auto_24652 ) ) ( not ( = ?auto_24648 ?auto_24652 ) ) ( not ( = ?auto_24649 ?auto_24652 ) ) ( not ( = ?auto_24650 ?auto_24652 ) ) ( not ( = ?auto_24651 ?auto_24652 ) ) ( ON ?auto_24650 ?auto_24651 ) ( ON-TABLE ?auto_24652 ) ( ON ?auto_24649 ?auto_24650 ) ( CLEAR ?auto_24647 ) ( ON ?auto_24648 ?auto_24649 ) ( CLEAR ?auto_24648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24652 ?auto_24651 ?auto_24650 ?auto_24649 )
      ( MAKE-5PILE ?auto_24647 ?auto_24648 ?auto_24649 ?auto_24650 ?auto_24651 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24653 - BLOCK
      ?auto_24654 - BLOCK
      ?auto_24655 - BLOCK
      ?auto_24656 - BLOCK
      ?auto_24657 - BLOCK
    )
    :vars
    (
      ?auto_24658 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24653 ?auto_24654 ) ) ( not ( = ?auto_24653 ?auto_24655 ) ) ( not ( = ?auto_24653 ?auto_24656 ) ) ( not ( = ?auto_24653 ?auto_24657 ) ) ( not ( = ?auto_24654 ?auto_24655 ) ) ( not ( = ?auto_24654 ?auto_24656 ) ) ( not ( = ?auto_24654 ?auto_24657 ) ) ( not ( = ?auto_24655 ?auto_24656 ) ) ( not ( = ?auto_24655 ?auto_24657 ) ) ( not ( = ?auto_24656 ?auto_24657 ) ) ( ON ?auto_24657 ?auto_24658 ) ( not ( = ?auto_24653 ?auto_24658 ) ) ( not ( = ?auto_24654 ?auto_24658 ) ) ( not ( = ?auto_24655 ?auto_24658 ) ) ( not ( = ?auto_24656 ?auto_24658 ) ) ( not ( = ?auto_24657 ?auto_24658 ) ) ( ON ?auto_24656 ?auto_24657 ) ( ON-TABLE ?auto_24658 ) ( ON ?auto_24655 ?auto_24656 ) ( ON ?auto_24654 ?auto_24655 ) ( CLEAR ?auto_24654 ) ( HOLDING ?auto_24653 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24653 )
      ( MAKE-5PILE ?auto_24653 ?auto_24654 ?auto_24655 ?auto_24656 ?auto_24657 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24659 - BLOCK
      ?auto_24660 - BLOCK
      ?auto_24661 - BLOCK
      ?auto_24662 - BLOCK
      ?auto_24663 - BLOCK
    )
    :vars
    (
      ?auto_24664 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24659 ?auto_24660 ) ) ( not ( = ?auto_24659 ?auto_24661 ) ) ( not ( = ?auto_24659 ?auto_24662 ) ) ( not ( = ?auto_24659 ?auto_24663 ) ) ( not ( = ?auto_24660 ?auto_24661 ) ) ( not ( = ?auto_24660 ?auto_24662 ) ) ( not ( = ?auto_24660 ?auto_24663 ) ) ( not ( = ?auto_24661 ?auto_24662 ) ) ( not ( = ?auto_24661 ?auto_24663 ) ) ( not ( = ?auto_24662 ?auto_24663 ) ) ( ON ?auto_24663 ?auto_24664 ) ( not ( = ?auto_24659 ?auto_24664 ) ) ( not ( = ?auto_24660 ?auto_24664 ) ) ( not ( = ?auto_24661 ?auto_24664 ) ) ( not ( = ?auto_24662 ?auto_24664 ) ) ( not ( = ?auto_24663 ?auto_24664 ) ) ( ON ?auto_24662 ?auto_24663 ) ( ON-TABLE ?auto_24664 ) ( ON ?auto_24661 ?auto_24662 ) ( ON ?auto_24660 ?auto_24661 ) ( ON ?auto_24659 ?auto_24660 ) ( CLEAR ?auto_24659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24664 ?auto_24663 ?auto_24662 ?auto_24661 ?auto_24660 )
      ( MAKE-5PILE ?auto_24659 ?auto_24660 ?auto_24661 ?auto_24662 ?auto_24663 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24669 - BLOCK
      ?auto_24670 - BLOCK
      ?auto_24671 - BLOCK
      ?auto_24672 - BLOCK
    )
    :vars
    (
      ?auto_24673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24673 ?auto_24672 ) ( CLEAR ?auto_24673 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24669 ) ( ON ?auto_24670 ?auto_24669 ) ( ON ?auto_24671 ?auto_24670 ) ( ON ?auto_24672 ?auto_24671 ) ( not ( = ?auto_24669 ?auto_24670 ) ) ( not ( = ?auto_24669 ?auto_24671 ) ) ( not ( = ?auto_24669 ?auto_24672 ) ) ( not ( = ?auto_24669 ?auto_24673 ) ) ( not ( = ?auto_24670 ?auto_24671 ) ) ( not ( = ?auto_24670 ?auto_24672 ) ) ( not ( = ?auto_24670 ?auto_24673 ) ) ( not ( = ?auto_24671 ?auto_24672 ) ) ( not ( = ?auto_24671 ?auto_24673 ) ) ( not ( = ?auto_24672 ?auto_24673 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24673 ?auto_24672 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24685 - BLOCK
      ?auto_24686 - BLOCK
      ?auto_24687 - BLOCK
      ?auto_24688 - BLOCK
    )
    :vars
    (
      ?auto_24689 - BLOCK
      ?auto_24690 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24685 ) ( ON ?auto_24686 ?auto_24685 ) ( ON ?auto_24687 ?auto_24686 ) ( not ( = ?auto_24685 ?auto_24686 ) ) ( not ( = ?auto_24685 ?auto_24687 ) ) ( not ( = ?auto_24685 ?auto_24688 ) ) ( not ( = ?auto_24685 ?auto_24689 ) ) ( not ( = ?auto_24686 ?auto_24687 ) ) ( not ( = ?auto_24686 ?auto_24688 ) ) ( not ( = ?auto_24686 ?auto_24689 ) ) ( not ( = ?auto_24687 ?auto_24688 ) ) ( not ( = ?auto_24687 ?auto_24689 ) ) ( not ( = ?auto_24688 ?auto_24689 ) ) ( ON ?auto_24689 ?auto_24690 ) ( CLEAR ?auto_24689 ) ( not ( = ?auto_24685 ?auto_24690 ) ) ( not ( = ?auto_24686 ?auto_24690 ) ) ( not ( = ?auto_24687 ?auto_24690 ) ) ( not ( = ?auto_24688 ?auto_24690 ) ) ( not ( = ?auto_24689 ?auto_24690 ) ) ( HOLDING ?auto_24688 ) ( CLEAR ?auto_24687 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24685 ?auto_24686 ?auto_24687 ?auto_24688 ?auto_24689 )
      ( MAKE-4PILE ?auto_24685 ?auto_24686 ?auto_24687 ?auto_24688 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24691 - BLOCK
      ?auto_24692 - BLOCK
      ?auto_24693 - BLOCK
      ?auto_24694 - BLOCK
    )
    :vars
    (
      ?auto_24696 - BLOCK
      ?auto_24695 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24691 ) ( ON ?auto_24692 ?auto_24691 ) ( ON ?auto_24693 ?auto_24692 ) ( not ( = ?auto_24691 ?auto_24692 ) ) ( not ( = ?auto_24691 ?auto_24693 ) ) ( not ( = ?auto_24691 ?auto_24694 ) ) ( not ( = ?auto_24691 ?auto_24696 ) ) ( not ( = ?auto_24692 ?auto_24693 ) ) ( not ( = ?auto_24692 ?auto_24694 ) ) ( not ( = ?auto_24692 ?auto_24696 ) ) ( not ( = ?auto_24693 ?auto_24694 ) ) ( not ( = ?auto_24693 ?auto_24696 ) ) ( not ( = ?auto_24694 ?auto_24696 ) ) ( ON ?auto_24696 ?auto_24695 ) ( not ( = ?auto_24691 ?auto_24695 ) ) ( not ( = ?auto_24692 ?auto_24695 ) ) ( not ( = ?auto_24693 ?auto_24695 ) ) ( not ( = ?auto_24694 ?auto_24695 ) ) ( not ( = ?auto_24696 ?auto_24695 ) ) ( CLEAR ?auto_24693 ) ( ON ?auto_24694 ?auto_24696 ) ( CLEAR ?auto_24694 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24695 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24695 ?auto_24696 )
      ( MAKE-4PILE ?auto_24691 ?auto_24692 ?auto_24693 ?auto_24694 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24697 - BLOCK
      ?auto_24698 - BLOCK
      ?auto_24699 - BLOCK
      ?auto_24700 - BLOCK
    )
    :vars
    (
      ?auto_24701 - BLOCK
      ?auto_24702 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24697 ) ( ON ?auto_24698 ?auto_24697 ) ( not ( = ?auto_24697 ?auto_24698 ) ) ( not ( = ?auto_24697 ?auto_24699 ) ) ( not ( = ?auto_24697 ?auto_24700 ) ) ( not ( = ?auto_24697 ?auto_24701 ) ) ( not ( = ?auto_24698 ?auto_24699 ) ) ( not ( = ?auto_24698 ?auto_24700 ) ) ( not ( = ?auto_24698 ?auto_24701 ) ) ( not ( = ?auto_24699 ?auto_24700 ) ) ( not ( = ?auto_24699 ?auto_24701 ) ) ( not ( = ?auto_24700 ?auto_24701 ) ) ( ON ?auto_24701 ?auto_24702 ) ( not ( = ?auto_24697 ?auto_24702 ) ) ( not ( = ?auto_24698 ?auto_24702 ) ) ( not ( = ?auto_24699 ?auto_24702 ) ) ( not ( = ?auto_24700 ?auto_24702 ) ) ( not ( = ?auto_24701 ?auto_24702 ) ) ( ON ?auto_24700 ?auto_24701 ) ( CLEAR ?auto_24700 ) ( ON-TABLE ?auto_24702 ) ( HOLDING ?auto_24699 ) ( CLEAR ?auto_24698 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24697 ?auto_24698 ?auto_24699 )
      ( MAKE-4PILE ?auto_24697 ?auto_24698 ?auto_24699 ?auto_24700 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24703 - BLOCK
      ?auto_24704 - BLOCK
      ?auto_24705 - BLOCK
      ?auto_24706 - BLOCK
    )
    :vars
    (
      ?auto_24707 - BLOCK
      ?auto_24708 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24703 ) ( ON ?auto_24704 ?auto_24703 ) ( not ( = ?auto_24703 ?auto_24704 ) ) ( not ( = ?auto_24703 ?auto_24705 ) ) ( not ( = ?auto_24703 ?auto_24706 ) ) ( not ( = ?auto_24703 ?auto_24707 ) ) ( not ( = ?auto_24704 ?auto_24705 ) ) ( not ( = ?auto_24704 ?auto_24706 ) ) ( not ( = ?auto_24704 ?auto_24707 ) ) ( not ( = ?auto_24705 ?auto_24706 ) ) ( not ( = ?auto_24705 ?auto_24707 ) ) ( not ( = ?auto_24706 ?auto_24707 ) ) ( ON ?auto_24707 ?auto_24708 ) ( not ( = ?auto_24703 ?auto_24708 ) ) ( not ( = ?auto_24704 ?auto_24708 ) ) ( not ( = ?auto_24705 ?auto_24708 ) ) ( not ( = ?auto_24706 ?auto_24708 ) ) ( not ( = ?auto_24707 ?auto_24708 ) ) ( ON ?auto_24706 ?auto_24707 ) ( ON-TABLE ?auto_24708 ) ( CLEAR ?auto_24704 ) ( ON ?auto_24705 ?auto_24706 ) ( CLEAR ?auto_24705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24708 ?auto_24707 ?auto_24706 )
      ( MAKE-4PILE ?auto_24703 ?auto_24704 ?auto_24705 ?auto_24706 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24709 - BLOCK
      ?auto_24710 - BLOCK
      ?auto_24711 - BLOCK
      ?auto_24712 - BLOCK
    )
    :vars
    (
      ?auto_24714 - BLOCK
      ?auto_24713 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24709 ) ( not ( = ?auto_24709 ?auto_24710 ) ) ( not ( = ?auto_24709 ?auto_24711 ) ) ( not ( = ?auto_24709 ?auto_24712 ) ) ( not ( = ?auto_24709 ?auto_24714 ) ) ( not ( = ?auto_24710 ?auto_24711 ) ) ( not ( = ?auto_24710 ?auto_24712 ) ) ( not ( = ?auto_24710 ?auto_24714 ) ) ( not ( = ?auto_24711 ?auto_24712 ) ) ( not ( = ?auto_24711 ?auto_24714 ) ) ( not ( = ?auto_24712 ?auto_24714 ) ) ( ON ?auto_24714 ?auto_24713 ) ( not ( = ?auto_24709 ?auto_24713 ) ) ( not ( = ?auto_24710 ?auto_24713 ) ) ( not ( = ?auto_24711 ?auto_24713 ) ) ( not ( = ?auto_24712 ?auto_24713 ) ) ( not ( = ?auto_24714 ?auto_24713 ) ) ( ON ?auto_24712 ?auto_24714 ) ( ON-TABLE ?auto_24713 ) ( ON ?auto_24711 ?auto_24712 ) ( CLEAR ?auto_24711 ) ( HOLDING ?auto_24710 ) ( CLEAR ?auto_24709 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24709 ?auto_24710 )
      ( MAKE-4PILE ?auto_24709 ?auto_24710 ?auto_24711 ?auto_24712 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24715 - BLOCK
      ?auto_24716 - BLOCK
      ?auto_24717 - BLOCK
      ?auto_24718 - BLOCK
    )
    :vars
    (
      ?auto_24720 - BLOCK
      ?auto_24719 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24715 ) ( not ( = ?auto_24715 ?auto_24716 ) ) ( not ( = ?auto_24715 ?auto_24717 ) ) ( not ( = ?auto_24715 ?auto_24718 ) ) ( not ( = ?auto_24715 ?auto_24720 ) ) ( not ( = ?auto_24716 ?auto_24717 ) ) ( not ( = ?auto_24716 ?auto_24718 ) ) ( not ( = ?auto_24716 ?auto_24720 ) ) ( not ( = ?auto_24717 ?auto_24718 ) ) ( not ( = ?auto_24717 ?auto_24720 ) ) ( not ( = ?auto_24718 ?auto_24720 ) ) ( ON ?auto_24720 ?auto_24719 ) ( not ( = ?auto_24715 ?auto_24719 ) ) ( not ( = ?auto_24716 ?auto_24719 ) ) ( not ( = ?auto_24717 ?auto_24719 ) ) ( not ( = ?auto_24718 ?auto_24719 ) ) ( not ( = ?auto_24720 ?auto_24719 ) ) ( ON ?auto_24718 ?auto_24720 ) ( ON-TABLE ?auto_24719 ) ( ON ?auto_24717 ?auto_24718 ) ( CLEAR ?auto_24715 ) ( ON ?auto_24716 ?auto_24717 ) ( CLEAR ?auto_24716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24719 ?auto_24720 ?auto_24718 ?auto_24717 )
      ( MAKE-4PILE ?auto_24715 ?auto_24716 ?auto_24717 ?auto_24718 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24721 - BLOCK
      ?auto_24722 - BLOCK
      ?auto_24723 - BLOCK
      ?auto_24724 - BLOCK
    )
    :vars
    (
      ?auto_24725 - BLOCK
      ?auto_24726 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24721 ?auto_24722 ) ) ( not ( = ?auto_24721 ?auto_24723 ) ) ( not ( = ?auto_24721 ?auto_24724 ) ) ( not ( = ?auto_24721 ?auto_24725 ) ) ( not ( = ?auto_24722 ?auto_24723 ) ) ( not ( = ?auto_24722 ?auto_24724 ) ) ( not ( = ?auto_24722 ?auto_24725 ) ) ( not ( = ?auto_24723 ?auto_24724 ) ) ( not ( = ?auto_24723 ?auto_24725 ) ) ( not ( = ?auto_24724 ?auto_24725 ) ) ( ON ?auto_24725 ?auto_24726 ) ( not ( = ?auto_24721 ?auto_24726 ) ) ( not ( = ?auto_24722 ?auto_24726 ) ) ( not ( = ?auto_24723 ?auto_24726 ) ) ( not ( = ?auto_24724 ?auto_24726 ) ) ( not ( = ?auto_24725 ?auto_24726 ) ) ( ON ?auto_24724 ?auto_24725 ) ( ON-TABLE ?auto_24726 ) ( ON ?auto_24723 ?auto_24724 ) ( ON ?auto_24722 ?auto_24723 ) ( CLEAR ?auto_24722 ) ( HOLDING ?auto_24721 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24721 )
      ( MAKE-4PILE ?auto_24721 ?auto_24722 ?auto_24723 ?auto_24724 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24727 - BLOCK
      ?auto_24728 - BLOCK
      ?auto_24729 - BLOCK
      ?auto_24730 - BLOCK
    )
    :vars
    (
      ?auto_24731 - BLOCK
      ?auto_24732 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24727 ?auto_24728 ) ) ( not ( = ?auto_24727 ?auto_24729 ) ) ( not ( = ?auto_24727 ?auto_24730 ) ) ( not ( = ?auto_24727 ?auto_24731 ) ) ( not ( = ?auto_24728 ?auto_24729 ) ) ( not ( = ?auto_24728 ?auto_24730 ) ) ( not ( = ?auto_24728 ?auto_24731 ) ) ( not ( = ?auto_24729 ?auto_24730 ) ) ( not ( = ?auto_24729 ?auto_24731 ) ) ( not ( = ?auto_24730 ?auto_24731 ) ) ( ON ?auto_24731 ?auto_24732 ) ( not ( = ?auto_24727 ?auto_24732 ) ) ( not ( = ?auto_24728 ?auto_24732 ) ) ( not ( = ?auto_24729 ?auto_24732 ) ) ( not ( = ?auto_24730 ?auto_24732 ) ) ( not ( = ?auto_24731 ?auto_24732 ) ) ( ON ?auto_24730 ?auto_24731 ) ( ON-TABLE ?auto_24732 ) ( ON ?auto_24729 ?auto_24730 ) ( ON ?auto_24728 ?auto_24729 ) ( ON ?auto_24727 ?auto_24728 ) ( CLEAR ?auto_24727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24732 ?auto_24731 ?auto_24730 ?auto_24729 ?auto_24728 )
      ( MAKE-4PILE ?auto_24727 ?auto_24728 ?auto_24729 ?auto_24730 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24734 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_24734 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_24734 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24735 - BLOCK
    )
    :vars
    (
      ?auto_24736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24735 ?auto_24736 ) ( CLEAR ?auto_24735 ) ( HAND-EMPTY ) ( not ( = ?auto_24735 ?auto_24736 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24735 ?auto_24736 )
      ( MAKE-1PILE ?auto_24735 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24737 - BLOCK
    )
    :vars
    (
      ?auto_24738 - BLOCK
      ?auto_24739 - BLOCK
      ?auto_24740 - BLOCK
      ?auto_24741 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24737 ?auto_24738 ) ) ( HOLDING ?auto_24737 ) ( CLEAR ?auto_24738 ) ( ON-TABLE ?auto_24739 ) ( ON ?auto_24740 ?auto_24739 ) ( ON ?auto_24741 ?auto_24740 ) ( ON ?auto_24738 ?auto_24741 ) ( not ( = ?auto_24739 ?auto_24740 ) ) ( not ( = ?auto_24739 ?auto_24741 ) ) ( not ( = ?auto_24739 ?auto_24738 ) ) ( not ( = ?auto_24739 ?auto_24737 ) ) ( not ( = ?auto_24740 ?auto_24741 ) ) ( not ( = ?auto_24740 ?auto_24738 ) ) ( not ( = ?auto_24740 ?auto_24737 ) ) ( not ( = ?auto_24741 ?auto_24738 ) ) ( not ( = ?auto_24741 ?auto_24737 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24739 ?auto_24740 ?auto_24741 ?auto_24738 ?auto_24737 )
      ( MAKE-1PILE ?auto_24737 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24742 - BLOCK
    )
    :vars
    (
      ?auto_24744 - BLOCK
      ?auto_24743 - BLOCK
      ?auto_24746 - BLOCK
      ?auto_24745 - BLOCK
      ?auto_24747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24742 ?auto_24744 ) ) ( CLEAR ?auto_24744 ) ( ON-TABLE ?auto_24743 ) ( ON ?auto_24746 ?auto_24743 ) ( ON ?auto_24745 ?auto_24746 ) ( ON ?auto_24744 ?auto_24745 ) ( not ( = ?auto_24743 ?auto_24746 ) ) ( not ( = ?auto_24743 ?auto_24745 ) ) ( not ( = ?auto_24743 ?auto_24744 ) ) ( not ( = ?auto_24743 ?auto_24742 ) ) ( not ( = ?auto_24746 ?auto_24745 ) ) ( not ( = ?auto_24746 ?auto_24744 ) ) ( not ( = ?auto_24746 ?auto_24742 ) ) ( not ( = ?auto_24745 ?auto_24744 ) ) ( not ( = ?auto_24745 ?auto_24742 ) ) ( ON ?auto_24742 ?auto_24747 ) ( CLEAR ?auto_24742 ) ( HAND-EMPTY ) ( not ( = ?auto_24742 ?auto_24747 ) ) ( not ( = ?auto_24744 ?auto_24747 ) ) ( not ( = ?auto_24743 ?auto_24747 ) ) ( not ( = ?auto_24746 ?auto_24747 ) ) ( not ( = ?auto_24745 ?auto_24747 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24742 ?auto_24747 )
      ( MAKE-1PILE ?auto_24742 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24748 - BLOCK
    )
    :vars
    (
      ?auto_24750 - BLOCK
      ?auto_24752 - BLOCK
      ?auto_24753 - BLOCK
      ?auto_24751 - BLOCK
      ?auto_24749 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24748 ?auto_24750 ) ) ( ON-TABLE ?auto_24752 ) ( ON ?auto_24753 ?auto_24752 ) ( ON ?auto_24751 ?auto_24753 ) ( not ( = ?auto_24752 ?auto_24753 ) ) ( not ( = ?auto_24752 ?auto_24751 ) ) ( not ( = ?auto_24752 ?auto_24750 ) ) ( not ( = ?auto_24752 ?auto_24748 ) ) ( not ( = ?auto_24753 ?auto_24751 ) ) ( not ( = ?auto_24753 ?auto_24750 ) ) ( not ( = ?auto_24753 ?auto_24748 ) ) ( not ( = ?auto_24751 ?auto_24750 ) ) ( not ( = ?auto_24751 ?auto_24748 ) ) ( ON ?auto_24748 ?auto_24749 ) ( CLEAR ?auto_24748 ) ( not ( = ?auto_24748 ?auto_24749 ) ) ( not ( = ?auto_24750 ?auto_24749 ) ) ( not ( = ?auto_24752 ?auto_24749 ) ) ( not ( = ?auto_24753 ?auto_24749 ) ) ( not ( = ?auto_24751 ?auto_24749 ) ) ( HOLDING ?auto_24750 ) ( CLEAR ?auto_24751 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24752 ?auto_24753 ?auto_24751 ?auto_24750 )
      ( MAKE-1PILE ?auto_24748 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24754 - BLOCK
    )
    :vars
    (
      ?auto_24757 - BLOCK
      ?auto_24759 - BLOCK
      ?auto_24756 - BLOCK
      ?auto_24755 - BLOCK
      ?auto_24758 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24754 ?auto_24757 ) ) ( ON-TABLE ?auto_24759 ) ( ON ?auto_24756 ?auto_24759 ) ( ON ?auto_24755 ?auto_24756 ) ( not ( = ?auto_24759 ?auto_24756 ) ) ( not ( = ?auto_24759 ?auto_24755 ) ) ( not ( = ?auto_24759 ?auto_24757 ) ) ( not ( = ?auto_24759 ?auto_24754 ) ) ( not ( = ?auto_24756 ?auto_24755 ) ) ( not ( = ?auto_24756 ?auto_24757 ) ) ( not ( = ?auto_24756 ?auto_24754 ) ) ( not ( = ?auto_24755 ?auto_24757 ) ) ( not ( = ?auto_24755 ?auto_24754 ) ) ( ON ?auto_24754 ?auto_24758 ) ( not ( = ?auto_24754 ?auto_24758 ) ) ( not ( = ?auto_24757 ?auto_24758 ) ) ( not ( = ?auto_24759 ?auto_24758 ) ) ( not ( = ?auto_24756 ?auto_24758 ) ) ( not ( = ?auto_24755 ?auto_24758 ) ) ( CLEAR ?auto_24755 ) ( ON ?auto_24757 ?auto_24754 ) ( CLEAR ?auto_24757 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24758 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24758 ?auto_24754 )
      ( MAKE-1PILE ?auto_24754 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24760 - BLOCK
    )
    :vars
    (
      ?auto_24764 - BLOCK
      ?auto_24761 - BLOCK
      ?auto_24763 - BLOCK
      ?auto_24765 - BLOCK
      ?auto_24762 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24760 ?auto_24764 ) ) ( ON-TABLE ?auto_24761 ) ( ON ?auto_24763 ?auto_24761 ) ( not ( = ?auto_24761 ?auto_24763 ) ) ( not ( = ?auto_24761 ?auto_24765 ) ) ( not ( = ?auto_24761 ?auto_24764 ) ) ( not ( = ?auto_24761 ?auto_24760 ) ) ( not ( = ?auto_24763 ?auto_24765 ) ) ( not ( = ?auto_24763 ?auto_24764 ) ) ( not ( = ?auto_24763 ?auto_24760 ) ) ( not ( = ?auto_24765 ?auto_24764 ) ) ( not ( = ?auto_24765 ?auto_24760 ) ) ( ON ?auto_24760 ?auto_24762 ) ( not ( = ?auto_24760 ?auto_24762 ) ) ( not ( = ?auto_24764 ?auto_24762 ) ) ( not ( = ?auto_24761 ?auto_24762 ) ) ( not ( = ?auto_24763 ?auto_24762 ) ) ( not ( = ?auto_24765 ?auto_24762 ) ) ( ON ?auto_24764 ?auto_24760 ) ( CLEAR ?auto_24764 ) ( ON-TABLE ?auto_24762 ) ( HOLDING ?auto_24765 ) ( CLEAR ?auto_24763 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24761 ?auto_24763 ?auto_24765 )
      ( MAKE-1PILE ?auto_24760 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24766 - BLOCK
    )
    :vars
    (
      ?auto_24771 - BLOCK
      ?auto_24770 - BLOCK
      ?auto_24768 - BLOCK
      ?auto_24769 - BLOCK
      ?auto_24767 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24766 ?auto_24771 ) ) ( ON-TABLE ?auto_24770 ) ( ON ?auto_24768 ?auto_24770 ) ( not ( = ?auto_24770 ?auto_24768 ) ) ( not ( = ?auto_24770 ?auto_24769 ) ) ( not ( = ?auto_24770 ?auto_24771 ) ) ( not ( = ?auto_24770 ?auto_24766 ) ) ( not ( = ?auto_24768 ?auto_24769 ) ) ( not ( = ?auto_24768 ?auto_24771 ) ) ( not ( = ?auto_24768 ?auto_24766 ) ) ( not ( = ?auto_24769 ?auto_24771 ) ) ( not ( = ?auto_24769 ?auto_24766 ) ) ( ON ?auto_24766 ?auto_24767 ) ( not ( = ?auto_24766 ?auto_24767 ) ) ( not ( = ?auto_24771 ?auto_24767 ) ) ( not ( = ?auto_24770 ?auto_24767 ) ) ( not ( = ?auto_24768 ?auto_24767 ) ) ( not ( = ?auto_24769 ?auto_24767 ) ) ( ON ?auto_24771 ?auto_24766 ) ( ON-TABLE ?auto_24767 ) ( CLEAR ?auto_24768 ) ( ON ?auto_24769 ?auto_24771 ) ( CLEAR ?auto_24769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24767 ?auto_24766 ?auto_24771 )
      ( MAKE-1PILE ?auto_24766 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24772 - BLOCK
    )
    :vars
    (
      ?auto_24773 - BLOCK
      ?auto_24775 - BLOCK
      ?auto_24777 - BLOCK
      ?auto_24774 - BLOCK
      ?auto_24776 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24772 ?auto_24773 ) ) ( ON-TABLE ?auto_24775 ) ( not ( = ?auto_24775 ?auto_24777 ) ) ( not ( = ?auto_24775 ?auto_24774 ) ) ( not ( = ?auto_24775 ?auto_24773 ) ) ( not ( = ?auto_24775 ?auto_24772 ) ) ( not ( = ?auto_24777 ?auto_24774 ) ) ( not ( = ?auto_24777 ?auto_24773 ) ) ( not ( = ?auto_24777 ?auto_24772 ) ) ( not ( = ?auto_24774 ?auto_24773 ) ) ( not ( = ?auto_24774 ?auto_24772 ) ) ( ON ?auto_24772 ?auto_24776 ) ( not ( = ?auto_24772 ?auto_24776 ) ) ( not ( = ?auto_24773 ?auto_24776 ) ) ( not ( = ?auto_24775 ?auto_24776 ) ) ( not ( = ?auto_24777 ?auto_24776 ) ) ( not ( = ?auto_24774 ?auto_24776 ) ) ( ON ?auto_24773 ?auto_24772 ) ( ON-TABLE ?auto_24776 ) ( ON ?auto_24774 ?auto_24773 ) ( CLEAR ?auto_24774 ) ( HOLDING ?auto_24777 ) ( CLEAR ?auto_24775 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24775 ?auto_24777 )
      ( MAKE-1PILE ?auto_24772 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24778 - BLOCK
    )
    :vars
    (
      ?auto_24783 - BLOCK
      ?auto_24780 - BLOCK
      ?auto_24782 - BLOCK
      ?auto_24779 - BLOCK
      ?auto_24781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24778 ?auto_24783 ) ) ( ON-TABLE ?auto_24780 ) ( not ( = ?auto_24780 ?auto_24782 ) ) ( not ( = ?auto_24780 ?auto_24779 ) ) ( not ( = ?auto_24780 ?auto_24783 ) ) ( not ( = ?auto_24780 ?auto_24778 ) ) ( not ( = ?auto_24782 ?auto_24779 ) ) ( not ( = ?auto_24782 ?auto_24783 ) ) ( not ( = ?auto_24782 ?auto_24778 ) ) ( not ( = ?auto_24779 ?auto_24783 ) ) ( not ( = ?auto_24779 ?auto_24778 ) ) ( ON ?auto_24778 ?auto_24781 ) ( not ( = ?auto_24778 ?auto_24781 ) ) ( not ( = ?auto_24783 ?auto_24781 ) ) ( not ( = ?auto_24780 ?auto_24781 ) ) ( not ( = ?auto_24782 ?auto_24781 ) ) ( not ( = ?auto_24779 ?auto_24781 ) ) ( ON ?auto_24783 ?auto_24778 ) ( ON-TABLE ?auto_24781 ) ( ON ?auto_24779 ?auto_24783 ) ( CLEAR ?auto_24780 ) ( ON ?auto_24782 ?auto_24779 ) ( CLEAR ?auto_24782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24781 ?auto_24778 ?auto_24783 ?auto_24779 )
      ( MAKE-1PILE ?auto_24778 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24784 - BLOCK
    )
    :vars
    (
      ?auto_24789 - BLOCK
      ?auto_24788 - BLOCK
      ?auto_24785 - BLOCK
      ?auto_24786 - BLOCK
      ?auto_24787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24784 ?auto_24789 ) ) ( not ( = ?auto_24788 ?auto_24785 ) ) ( not ( = ?auto_24788 ?auto_24786 ) ) ( not ( = ?auto_24788 ?auto_24789 ) ) ( not ( = ?auto_24788 ?auto_24784 ) ) ( not ( = ?auto_24785 ?auto_24786 ) ) ( not ( = ?auto_24785 ?auto_24789 ) ) ( not ( = ?auto_24785 ?auto_24784 ) ) ( not ( = ?auto_24786 ?auto_24789 ) ) ( not ( = ?auto_24786 ?auto_24784 ) ) ( ON ?auto_24784 ?auto_24787 ) ( not ( = ?auto_24784 ?auto_24787 ) ) ( not ( = ?auto_24789 ?auto_24787 ) ) ( not ( = ?auto_24788 ?auto_24787 ) ) ( not ( = ?auto_24785 ?auto_24787 ) ) ( not ( = ?auto_24786 ?auto_24787 ) ) ( ON ?auto_24789 ?auto_24784 ) ( ON-TABLE ?auto_24787 ) ( ON ?auto_24786 ?auto_24789 ) ( ON ?auto_24785 ?auto_24786 ) ( CLEAR ?auto_24785 ) ( HOLDING ?auto_24788 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24788 )
      ( MAKE-1PILE ?auto_24784 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24790 - BLOCK
    )
    :vars
    (
      ?auto_24793 - BLOCK
      ?auto_24794 - BLOCK
      ?auto_24792 - BLOCK
      ?auto_24795 - BLOCK
      ?auto_24791 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24790 ?auto_24793 ) ) ( not ( = ?auto_24794 ?auto_24792 ) ) ( not ( = ?auto_24794 ?auto_24795 ) ) ( not ( = ?auto_24794 ?auto_24793 ) ) ( not ( = ?auto_24794 ?auto_24790 ) ) ( not ( = ?auto_24792 ?auto_24795 ) ) ( not ( = ?auto_24792 ?auto_24793 ) ) ( not ( = ?auto_24792 ?auto_24790 ) ) ( not ( = ?auto_24795 ?auto_24793 ) ) ( not ( = ?auto_24795 ?auto_24790 ) ) ( ON ?auto_24790 ?auto_24791 ) ( not ( = ?auto_24790 ?auto_24791 ) ) ( not ( = ?auto_24793 ?auto_24791 ) ) ( not ( = ?auto_24794 ?auto_24791 ) ) ( not ( = ?auto_24792 ?auto_24791 ) ) ( not ( = ?auto_24795 ?auto_24791 ) ) ( ON ?auto_24793 ?auto_24790 ) ( ON-TABLE ?auto_24791 ) ( ON ?auto_24795 ?auto_24793 ) ( ON ?auto_24792 ?auto_24795 ) ( ON ?auto_24794 ?auto_24792 ) ( CLEAR ?auto_24794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24791 ?auto_24790 ?auto_24793 ?auto_24795 ?auto_24792 )
      ( MAKE-1PILE ?auto_24790 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24799 - BLOCK
      ?auto_24800 - BLOCK
      ?auto_24801 - BLOCK
    )
    :vars
    (
      ?auto_24802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24802 ?auto_24801 ) ( CLEAR ?auto_24802 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24799 ) ( ON ?auto_24800 ?auto_24799 ) ( ON ?auto_24801 ?auto_24800 ) ( not ( = ?auto_24799 ?auto_24800 ) ) ( not ( = ?auto_24799 ?auto_24801 ) ) ( not ( = ?auto_24799 ?auto_24802 ) ) ( not ( = ?auto_24800 ?auto_24801 ) ) ( not ( = ?auto_24800 ?auto_24802 ) ) ( not ( = ?auto_24801 ?auto_24802 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24802 ?auto_24801 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24803 - BLOCK
      ?auto_24804 - BLOCK
      ?auto_24805 - BLOCK
    )
    :vars
    (
      ?auto_24806 - BLOCK
      ?auto_24807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24806 ?auto_24805 ) ( CLEAR ?auto_24806 ) ( ON-TABLE ?auto_24803 ) ( ON ?auto_24804 ?auto_24803 ) ( ON ?auto_24805 ?auto_24804 ) ( not ( = ?auto_24803 ?auto_24804 ) ) ( not ( = ?auto_24803 ?auto_24805 ) ) ( not ( = ?auto_24803 ?auto_24806 ) ) ( not ( = ?auto_24804 ?auto_24805 ) ) ( not ( = ?auto_24804 ?auto_24806 ) ) ( not ( = ?auto_24805 ?auto_24806 ) ) ( HOLDING ?auto_24807 ) ( not ( = ?auto_24803 ?auto_24807 ) ) ( not ( = ?auto_24804 ?auto_24807 ) ) ( not ( = ?auto_24805 ?auto_24807 ) ) ( not ( = ?auto_24806 ?auto_24807 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_24807 )
      ( MAKE-3PILE ?auto_24803 ?auto_24804 ?auto_24805 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24808 - BLOCK
      ?auto_24809 - BLOCK
      ?auto_24810 - BLOCK
    )
    :vars
    (
      ?auto_24811 - BLOCK
      ?auto_24812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24811 ?auto_24810 ) ( ON-TABLE ?auto_24808 ) ( ON ?auto_24809 ?auto_24808 ) ( ON ?auto_24810 ?auto_24809 ) ( not ( = ?auto_24808 ?auto_24809 ) ) ( not ( = ?auto_24808 ?auto_24810 ) ) ( not ( = ?auto_24808 ?auto_24811 ) ) ( not ( = ?auto_24809 ?auto_24810 ) ) ( not ( = ?auto_24809 ?auto_24811 ) ) ( not ( = ?auto_24810 ?auto_24811 ) ) ( not ( = ?auto_24808 ?auto_24812 ) ) ( not ( = ?auto_24809 ?auto_24812 ) ) ( not ( = ?auto_24810 ?auto_24812 ) ) ( not ( = ?auto_24811 ?auto_24812 ) ) ( ON ?auto_24812 ?auto_24811 ) ( CLEAR ?auto_24812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24808 ?auto_24809 ?auto_24810 ?auto_24811 )
      ( MAKE-3PILE ?auto_24808 ?auto_24809 ?auto_24810 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24813 - BLOCK
      ?auto_24814 - BLOCK
      ?auto_24815 - BLOCK
    )
    :vars
    (
      ?auto_24817 - BLOCK
      ?auto_24816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24817 ?auto_24815 ) ( ON-TABLE ?auto_24813 ) ( ON ?auto_24814 ?auto_24813 ) ( ON ?auto_24815 ?auto_24814 ) ( not ( = ?auto_24813 ?auto_24814 ) ) ( not ( = ?auto_24813 ?auto_24815 ) ) ( not ( = ?auto_24813 ?auto_24817 ) ) ( not ( = ?auto_24814 ?auto_24815 ) ) ( not ( = ?auto_24814 ?auto_24817 ) ) ( not ( = ?auto_24815 ?auto_24817 ) ) ( not ( = ?auto_24813 ?auto_24816 ) ) ( not ( = ?auto_24814 ?auto_24816 ) ) ( not ( = ?auto_24815 ?auto_24816 ) ) ( not ( = ?auto_24817 ?auto_24816 ) ) ( HOLDING ?auto_24816 ) ( CLEAR ?auto_24817 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24813 ?auto_24814 ?auto_24815 ?auto_24817 ?auto_24816 )
      ( MAKE-3PILE ?auto_24813 ?auto_24814 ?auto_24815 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24818 - BLOCK
      ?auto_24819 - BLOCK
      ?auto_24820 - BLOCK
    )
    :vars
    (
      ?auto_24821 - BLOCK
      ?auto_24822 - BLOCK
      ?auto_24823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24821 ?auto_24820 ) ( ON-TABLE ?auto_24818 ) ( ON ?auto_24819 ?auto_24818 ) ( ON ?auto_24820 ?auto_24819 ) ( not ( = ?auto_24818 ?auto_24819 ) ) ( not ( = ?auto_24818 ?auto_24820 ) ) ( not ( = ?auto_24818 ?auto_24821 ) ) ( not ( = ?auto_24819 ?auto_24820 ) ) ( not ( = ?auto_24819 ?auto_24821 ) ) ( not ( = ?auto_24820 ?auto_24821 ) ) ( not ( = ?auto_24818 ?auto_24822 ) ) ( not ( = ?auto_24819 ?auto_24822 ) ) ( not ( = ?auto_24820 ?auto_24822 ) ) ( not ( = ?auto_24821 ?auto_24822 ) ) ( CLEAR ?auto_24821 ) ( ON ?auto_24822 ?auto_24823 ) ( CLEAR ?auto_24822 ) ( HAND-EMPTY ) ( not ( = ?auto_24818 ?auto_24823 ) ) ( not ( = ?auto_24819 ?auto_24823 ) ) ( not ( = ?auto_24820 ?auto_24823 ) ) ( not ( = ?auto_24821 ?auto_24823 ) ) ( not ( = ?auto_24822 ?auto_24823 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24822 ?auto_24823 )
      ( MAKE-3PILE ?auto_24818 ?auto_24819 ?auto_24820 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24836 - BLOCK
      ?auto_24837 - BLOCK
      ?auto_24838 - BLOCK
    )
    :vars
    (
      ?auto_24840 - BLOCK
      ?auto_24841 - BLOCK
      ?auto_24839 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24836 ) ( ON ?auto_24837 ?auto_24836 ) ( not ( = ?auto_24836 ?auto_24837 ) ) ( not ( = ?auto_24836 ?auto_24838 ) ) ( not ( = ?auto_24836 ?auto_24840 ) ) ( not ( = ?auto_24837 ?auto_24838 ) ) ( not ( = ?auto_24837 ?auto_24840 ) ) ( not ( = ?auto_24838 ?auto_24840 ) ) ( not ( = ?auto_24836 ?auto_24841 ) ) ( not ( = ?auto_24837 ?auto_24841 ) ) ( not ( = ?auto_24838 ?auto_24841 ) ) ( not ( = ?auto_24840 ?auto_24841 ) ) ( ON ?auto_24841 ?auto_24839 ) ( not ( = ?auto_24836 ?auto_24839 ) ) ( not ( = ?auto_24837 ?auto_24839 ) ) ( not ( = ?auto_24838 ?auto_24839 ) ) ( not ( = ?auto_24840 ?auto_24839 ) ) ( not ( = ?auto_24841 ?auto_24839 ) ) ( ON ?auto_24840 ?auto_24841 ) ( CLEAR ?auto_24840 ) ( HOLDING ?auto_24838 ) ( CLEAR ?auto_24837 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24836 ?auto_24837 ?auto_24838 ?auto_24840 )
      ( MAKE-3PILE ?auto_24836 ?auto_24837 ?auto_24838 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24842 - BLOCK
      ?auto_24843 - BLOCK
      ?auto_24844 - BLOCK
    )
    :vars
    (
      ?auto_24847 - BLOCK
      ?auto_24846 - BLOCK
      ?auto_24845 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24842 ) ( ON ?auto_24843 ?auto_24842 ) ( not ( = ?auto_24842 ?auto_24843 ) ) ( not ( = ?auto_24842 ?auto_24844 ) ) ( not ( = ?auto_24842 ?auto_24847 ) ) ( not ( = ?auto_24843 ?auto_24844 ) ) ( not ( = ?auto_24843 ?auto_24847 ) ) ( not ( = ?auto_24844 ?auto_24847 ) ) ( not ( = ?auto_24842 ?auto_24846 ) ) ( not ( = ?auto_24843 ?auto_24846 ) ) ( not ( = ?auto_24844 ?auto_24846 ) ) ( not ( = ?auto_24847 ?auto_24846 ) ) ( ON ?auto_24846 ?auto_24845 ) ( not ( = ?auto_24842 ?auto_24845 ) ) ( not ( = ?auto_24843 ?auto_24845 ) ) ( not ( = ?auto_24844 ?auto_24845 ) ) ( not ( = ?auto_24847 ?auto_24845 ) ) ( not ( = ?auto_24846 ?auto_24845 ) ) ( ON ?auto_24847 ?auto_24846 ) ( CLEAR ?auto_24843 ) ( ON ?auto_24844 ?auto_24847 ) ( CLEAR ?auto_24844 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24845 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24845 ?auto_24846 ?auto_24847 )
      ( MAKE-3PILE ?auto_24842 ?auto_24843 ?auto_24844 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24848 - BLOCK
      ?auto_24849 - BLOCK
      ?auto_24850 - BLOCK
    )
    :vars
    (
      ?auto_24852 - BLOCK
      ?auto_24851 - BLOCK
      ?auto_24853 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24848 ) ( not ( = ?auto_24848 ?auto_24849 ) ) ( not ( = ?auto_24848 ?auto_24850 ) ) ( not ( = ?auto_24848 ?auto_24852 ) ) ( not ( = ?auto_24849 ?auto_24850 ) ) ( not ( = ?auto_24849 ?auto_24852 ) ) ( not ( = ?auto_24850 ?auto_24852 ) ) ( not ( = ?auto_24848 ?auto_24851 ) ) ( not ( = ?auto_24849 ?auto_24851 ) ) ( not ( = ?auto_24850 ?auto_24851 ) ) ( not ( = ?auto_24852 ?auto_24851 ) ) ( ON ?auto_24851 ?auto_24853 ) ( not ( = ?auto_24848 ?auto_24853 ) ) ( not ( = ?auto_24849 ?auto_24853 ) ) ( not ( = ?auto_24850 ?auto_24853 ) ) ( not ( = ?auto_24852 ?auto_24853 ) ) ( not ( = ?auto_24851 ?auto_24853 ) ) ( ON ?auto_24852 ?auto_24851 ) ( ON ?auto_24850 ?auto_24852 ) ( CLEAR ?auto_24850 ) ( ON-TABLE ?auto_24853 ) ( HOLDING ?auto_24849 ) ( CLEAR ?auto_24848 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24848 ?auto_24849 )
      ( MAKE-3PILE ?auto_24848 ?auto_24849 ?auto_24850 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24854 - BLOCK
      ?auto_24855 - BLOCK
      ?auto_24856 - BLOCK
    )
    :vars
    (
      ?auto_24858 - BLOCK
      ?auto_24857 - BLOCK
      ?auto_24859 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24854 ) ( not ( = ?auto_24854 ?auto_24855 ) ) ( not ( = ?auto_24854 ?auto_24856 ) ) ( not ( = ?auto_24854 ?auto_24858 ) ) ( not ( = ?auto_24855 ?auto_24856 ) ) ( not ( = ?auto_24855 ?auto_24858 ) ) ( not ( = ?auto_24856 ?auto_24858 ) ) ( not ( = ?auto_24854 ?auto_24857 ) ) ( not ( = ?auto_24855 ?auto_24857 ) ) ( not ( = ?auto_24856 ?auto_24857 ) ) ( not ( = ?auto_24858 ?auto_24857 ) ) ( ON ?auto_24857 ?auto_24859 ) ( not ( = ?auto_24854 ?auto_24859 ) ) ( not ( = ?auto_24855 ?auto_24859 ) ) ( not ( = ?auto_24856 ?auto_24859 ) ) ( not ( = ?auto_24858 ?auto_24859 ) ) ( not ( = ?auto_24857 ?auto_24859 ) ) ( ON ?auto_24858 ?auto_24857 ) ( ON ?auto_24856 ?auto_24858 ) ( ON-TABLE ?auto_24859 ) ( CLEAR ?auto_24854 ) ( ON ?auto_24855 ?auto_24856 ) ( CLEAR ?auto_24855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24859 ?auto_24857 ?auto_24858 ?auto_24856 )
      ( MAKE-3PILE ?auto_24854 ?auto_24855 ?auto_24856 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24860 - BLOCK
      ?auto_24861 - BLOCK
      ?auto_24862 - BLOCK
    )
    :vars
    (
      ?auto_24863 - BLOCK
      ?auto_24864 - BLOCK
      ?auto_24865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24860 ?auto_24861 ) ) ( not ( = ?auto_24860 ?auto_24862 ) ) ( not ( = ?auto_24860 ?auto_24863 ) ) ( not ( = ?auto_24861 ?auto_24862 ) ) ( not ( = ?auto_24861 ?auto_24863 ) ) ( not ( = ?auto_24862 ?auto_24863 ) ) ( not ( = ?auto_24860 ?auto_24864 ) ) ( not ( = ?auto_24861 ?auto_24864 ) ) ( not ( = ?auto_24862 ?auto_24864 ) ) ( not ( = ?auto_24863 ?auto_24864 ) ) ( ON ?auto_24864 ?auto_24865 ) ( not ( = ?auto_24860 ?auto_24865 ) ) ( not ( = ?auto_24861 ?auto_24865 ) ) ( not ( = ?auto_24862 ?auto_24865 ) ) ( not ( = ?auto_24863 ?auto_24865 ) ) ( not ( = ?auto_24864 ?auto_24865 ) ) ( ON ?auto_24863 ?auto_24864 ) ( ON ?auto_24862 ?auto_24863 ) ( ON-TABLE ?auto_24865 ) ( ON ?auto_24861 ?auto_24862 ) ( CLEAR ?auto_24861 ) ( HOLDING ?auto_24860 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24860 )
      ( MAKE-3PILE ?auto_24860 ?auto_24861 ?auto_24862 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24866 - BLOCK
      ?auto_24867 - BLOCK
      ?auto_24868 - BLOCK
    )
    :vars
    (
      ?auto_24870 - BLOCK
      ?auto_24871 - BLOCK
      ?auto_24869 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24866 ?auto_24867 ) ) ( not ( = ?auto_24866 ?auto_24868 ) ) ( not ( = ?auto_24866 ?auto_24870 ) ) ( not ( = ?auto_24867 ?auto_24868 ) ) ( not ( = ?auto_24867 ?auto_24870 ) ) ( not ( = ?auto_24868 ?auto_24870 ) ) ( not ( = ?auto_24866 ?auto_24871 ) ) ( not ( = ?auto_24867 ?auto_24871 ) ) ( not ( = ?auto_24868 ?auto_24871 ) ) ( not ( = ?auto_24870 ?auto_24871 ) ) ( ON ?auto_24871 ?auto_24869 ) ( not ( = ?auto_24866 ?auto_24869 ) ) ( not ( = ?auto_24867 ?auto_24869 ) ) ( not ( = ?auto_24868 ?auto_24869 ) ) ( not ( = ?auto_24870 ?auto_24869 ) ) ( not ( = ?auto_24871 ?auto_24869 ) ) ( ON ?auto_24870 ?auto_24871 ) ( ON ?auto_24868 ?auto_24870 ) ( ON-TABLE ?auto_24869 ) ( ON ?auto_24867 ?auto_24868 ) ( ON ?auto_24866 ?auto_24867 ) ( CLEAR ?auto_24866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24869 ?auto_24871 ?auto_24870 ?auto_24868 ?auto_24867 )
      ( MAKE-3PILE ?auto_24866 ?auto_24867 ?auto_24868 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24874 - BLOCK
      ?auto_24875 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_24875 ) ( CLEAR ?auto_24874 ) ( ON-TABLE ?auto_24874 ) ( not ( = ?auto_24874 ?auto_24875 ) ) )
    :subtasks
    ( ( !STACK ?auto_24875 ?auto_24874 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24876 - BLOCK
      ?auto_24877 - BLOCK
    )
    :vars
    (
      ?auto_24878 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_24876 ) ( ON-TABLE ?auto_24876 ) ( not ( = ?auto_24876 ?auto_24877 ) ) ( ON ?auto_24877 ?auto_24878 ) ( CLEAR ?auto_24877 ) ( HAND-EMPTY ) ( not ( = ?auto_24876 ?auto_24878 ) ) ( not ( = ?auto_24877 ?auto_24878 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24877 ?auto_24878 )
      ( MAKE-2PILE ?auto_24876 ?auto_24877 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24879 - BLOCK
      ?auto_24880 - BLOCK
    )
    :vars
    (
      ?auto_24881 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24879 ?auto_24880 ) ) ( ON ?auto_24880 ?auto_24881 ) ( CLEAR ?auto_24880 ) ( not ( = ?auto_24879 ?auto_24881 ) ) ( not ( = ?auto_24880 ?auto_24881 ) ) ( HOLDING ?auto_24879 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24879 )
      ( MAKE-2PILE ?auto_24879 ?auto_24880 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24882 - BLOCK
      ?auto_24883 - BLOCK
    )
    :vars
    (
      ?auto_24884 - BLOCK
      ?auto_24886 - BLOCK
      ?auto_24885 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24882 ?auto_24883 ) ) ( ON ?auto_24883 ?auto_24884 ) ( not ( = ?auto_24882 ?auto_24884 ) ) ( not ( = ?auto_24883 ?auto_24884 ) ) ( ON ?auto_24882 ?auto_24883 ) ( CLEAR ?auto_24882 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24886 ) ( ON ?auto_24885 ?auto_24886 ) ( ON ?auto_24884 ?auto_24885 ) ( not ( = ?auto_24886 ?auto_24885 ) ) ( not ( = ?auto_24886 ?auto_24884 ) ) ( not ( = ?auto_24886 ?auto_24883 ) ) ( not ( = ?auto_24886 ?auto_24882 ) ) ( not ( = ?auto_24885 ?auto_24884 ) ) ( not ( = ?auto_24885 ?auto_24883 ) ) ( not ( = ?auto_24885 ?auto_24882 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24886 ?auto_24885 ?auto_24884 ?auto_24883 )
      ( MAKE-2PILE ?auto_24882 ?auto_24883 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24887 - BLOCK
      ?auto_24888 - BLOCK
    )
    :vars
    (
      ?auto_24890 - BLOCK
      ?auto_24891 - BLOCK
      ?auto_24889 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24887 ?auto_24888 ) ) ( ON ?auto_24888 ?auto_24890 ) ( not ( = ?auto_24887 ?auto_24890 ) ) ( not ( = ?auto_24888 ?auto_24890 ) ) ( ON-TABLE ?auto_24891 ) ( ON ?auto_24889 ?auto_24891 ) ( ON ?auto_24890 ?auto_24889 ) ( not ( = ?auto_24891 ?auto_24889 ) ) ( not ( = ?auto_24891 ?auto_24890 ) ) ( not ( = ?auto_24891 ?auto_24888 ) ) ( not ( = ?auto_24891 ?auto_24887 ) ) ( not ( = ?auto_24889 ?auto_24890 ) ) ( not ( = ?auto_24889 ?auto_24888 ) ) ( not ( = ?auto_24889 ?auto_24887 ) ) ( HOLDING ?auto_24887 ) ( CLEAR ?auto_24888 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24891 ?auto_24889 ?auto_24890 ?auto_24888 ?auto_24887 )
      ( MAKE-2PILE ?auto_24887 ?auto_24888 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24892 - BLOCK
      ?auto_24893 - BLOCK
    )
    :vars
    (
      ?auto_24894 - BLOCK
      ?auto_24896 - BLOCK
      ?auto_24895 - BLOCK
      ?auto_24897 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24892 ?auto_24893 ) ) ( ON ?auto_24893 ?auto_24894 ) ( not ( = ?auto_24892 ?auto_24894 ) ) ( not ( = ?auto_24893 ?auto_24894 ) ) ( ON-TABLE ?auto_24896 ) ( ON ?auto_24895 ?auto_24896 ) ( ON ?auto_24894 ?auto_24895 ) ( not ( = ?auto_24896 ?auto_24895 ) ) ( not ( = ?auto_24896 ?auto_24894 ) ) ( not ( = ?auto_24896 ?auto_24893 ) ) ( not ( = ?auto_24896 ?auto_24892 ) ) ( not ( = ?auto_24895 ?auto_24894 ) ) ( not ( = ?auto_24895 ?auto_24893 ) ) ( not ( = ?auto_24895 ?auto_24892 ) ) ( CLEAR ?auto_24893 ) ( ON ?auto_24892 ?auto_24897 ) ( CLEAR ?auto_24892 ) ( HAND-EMPTY ) ( not ( = ?auto_24892 ?auto_24897 ) ) ( not ( = ?auto_24893 ?auto_24897 ) ) ( not ( = ?auto_24894 ?auto_24897 ) ) ( not ( = ?auto_24896 ?auto_24897 ) ) ( not ( = ?auto_24895 ?auto_24897 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24892 ?auto_24897 )
      ( MAKE-2PILE ?auto_24892 ?auto_24893 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24898 - BLOCK
      ?auto_24899 - BLOCK
    )
    :vars
    (
      ?auto_24901 - BLOCK
      ?auto_24900 - BLOCK
      ?auto_24902 - BLOCK
      ?auto_24903 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24898 ?auto_24899 ) ) ( not ( = ?auto_24898 ?auto_24901 ) ) ( not ( = ?auto_24899 ?auto_24901 ) ) ( ON-TABLE ?auto_24900 ) ( ON ?auto_24902 ?auto_24900 ) ( ON ?auto_24901 ?auto_24902 ) ( not ( = ?auto_24900 ?auto_24902 ) ) ( not ( = ?auto_24900 ?auto_24901 ) ) ( not ( = ?auto_24900 ?auto_24899 ) ) ( not ( = ?auto_24900 ?auto_24898 ) ) ( not ( = ?auto_24902 ?auto_24901 ) ) ( not ( = ?auto_24902 ?auto_24899 ) ) ( not ( = ?auto_24902 ?auto_24898 ) ) ( ON ?auto_24898 ?auto_24903 ) ( CLEAR ?auto_24898 ) ( not ( = ?auto_24898 ?auto_24903 ) ) ( not ( = ?auto_24899 ?auto_24903 ) ) ( not ( = ?auto_24901 ?auto_24903 ) ) ( not ( = ?auto_24900 ?auto_24903 ) ) ( not ( = ?auto_24902 ?auto_24903 ) ) ( HOLDING ?auto_24899 ) ( CLEAR ?auto_24901 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24900 ?auto_24902 ?auto_24901 ?auto_24899 )
      ( MAKE-2PILE ?auto_24898 ?auto_24899 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24904 - BLOCK
      ?auto_24905 - BLOCK
    )
    :vars
    (
      ?auto_24909 - BLOCK
      ?auto_24906 - BLOCK
      ?auto_24908 - BLOCK
      ?auto_24907 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24904 ?auto_24905 ) ) ( not ( = ?auto_24904 ?auto_24909 ) ) ( not ( = ?auto_24905 ?auto_24909 ) ) ( ON-TABLE ?auto_24906 ) ( ON ?auto_24908 ?auto_24906 ) ( ON ?auto_24909 ?auto_24908 ) ( not ( = ?auto_24906 ?auto_24908 ) ) ( not ( = ?auto_24906 ?auto_24909 ) ) ( not ( = ?auto_24906 ?auto_24905 ) ) ( not ( = ?auto_24906 ?auto_24904 ) ) ( not ( = ?auto_24908 ?auto_24909 ) ) ( not ( = ?auto_24908 ?auto_24905 ) ) ( not ( = ?auto_24908 ?auto_24904 ) ) ( ON ?auto_24904 ?auto_24907 ) ( not ( = ?auto_24904 ?auto_24907 ) ) ( not ( = ?auto_24905 ?auto_24907 ) ) ( not ( = ?auto_24909 ?auto_24907 ) ) ( not ( = ?auto_24906 ?auto_24907 ) ) ( not ( = ?auto_24908 ?auto_24907 ) ) ( CLEAR ?auto_24909 ) ( ON ?auto_24905 ?auto_24904 ) ( CLEAR ?auto_24905 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24907 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24907 ?auto_24904 )
      ( MAKE-2PILE ?auto_24904 ?auto_24905 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24910 - BLOCK
      ?auto_24911 - BLOCK
    )
    :vars
    (
      ?auto_24915 - BLOCK
      ?auto_24914 - BLOCK
      ?auto_24913 - BLOCK
      ?auto_24912 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24910 ?auto_24911 ) ) ( not ( = ?auto_24910 ?auto_24915 ) ) ( not ( = ?auto_24911 ?auto_24915 ) ) ( ON-TABLE ?auto_24914 ) ( ON ?auto_24913 ?auto_24914 ) ( not ( = ?auto_24914 ?auto_24913 ) ) ( not ( = ?auto_24914 ?auto_24915 ) ) ( not ( = ?auto_24914 ?auto_24911 ) ) ( not ( = ?auto_24914 ?auto_24910 ) ) ( not ( = ?auto_24913 ?auto_24915 ) ) ( not ( = ?auto_24913 ?auto_24911 ) ) ( not ( = ?auto_24913 ?auto_24910 ) ) ( ON ?auto_24910 ?auto_24912 ) ( not ( = ?auto_24910 ?auto_24912 ) ) ( not ( = ?auto_24911 ?auto_24912 ) ) ( not ( = ?auto_24915 ?auto_24912 ) ) ( not ( = ?auto_24914 ?auto_24912 ) ) ( not ( = ?auto_24913 ?auto_24912 ) ) ( ON ?auto_24911 ?auto_24910 ) ( CLEAR ?auto_24911 ) ( ON-TABLE ?auto_24912 ) ( HOLDING ?auto_24915 ) ( CLEAR ?auto_24913 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24914 ?auto_24913 ?auto_24915 )
      ( MAKE-2PILE ?auto_24910 ?auto_24911 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24916 - BLOCK
      ?auto_24917 - BLOCK
    )
    :vars
    (
      ?auto_24918 - BLOCK
      ?auto_24921 - BLOCK
      ?auto_24919 - BLOCK
      ?auto_24920 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24916 ?auto_24917 ) ) ( not ( = ?auto_24916 ?auto_24918 ) ) ( not ( = ?auto_24917 ?auto_24918 ) ) ( ON-TABLE ?auto_24921 ) ( ON ?auto_24919 ?auto_24921 ) ( not ( = ?auto_24921 ?auto_24919 ) ) ( not ( = ?auto_24921 ?auto_24918 ) ) ( not ( = ?auto_24921 ?auto_24917 ) ) ( not ( = ?auto_24921 ?auto_24916 ) ) ( not ( = ?auto_24919 ?auto_24918 ) ) ( not ( = ?auto_24919 ?auto_24917 ) ) ( not ( = ?auto_24919 ?auto_24916 ) ) ( ON ?auto_24916 ?auto_24920 ) ( not ( = ?auto_24916 ?auto_24920 ) ) ( not ( = ?auto_24917 ?auto_24920 ) ) ( not ( = ?auto_24918 ?auto_24920 ) ) ( not ( = ?auto_24921 ?auto_24920 ) ) ( not ( = ?auto_24919 ?auto_24920 ) ) ( ON ?auto_24917 ?auto_24916 ) ( ON-TABLE ?auto_24920 ) ( CLEAR ?auto_24919 ) ( ON ?auto_24918 ?auto_24917 ) ( CLEAR ?auto_24918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24920 ?auto_24916 ?auto_24917 )
      ( MAKE-2PILE ?auto_24916 ?auto_24917 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24922 - BLOCK
      ?auto_24923 - BLOCK
    )
    :vars
    (
      ?auto_24927 - BLOCK
      ?auto_24926 - BLOCK
      ?auto_24924 - BLOCK
      ?auto_24925 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24922 ?auto_24923 ) ) ( not ( = ?auto_24922 ?auto_24927 ) ) ( not ( = ?auto_24923 ?auto_24927 ) ) ( ON-TABLE ?auto_24926 ) ( not ( = ?auto_24926 ?auto_24924 ) ) ( not ( = ?auto_24926 ?auto_24927 ) ) ( not ( = ?auto_24926 ?auto_24923 ) ) ( not ( = ?auto_24926 ?auto_24922 ) ) ( not ( = ?auto_24924 ?auto_24927 ) ) ( not ( = ?auto_24924 ?auto_24923 ) ) ( not ( = ?auto_24924 ?auto_24922 ) ) ( ON ?auto_24922 ?auto_24925 ) ( not ( = ?auto_24922 ?auto_24925 ) ) ( not ( = ?auto_24923 ?auto_24925 ) ) ( not ( = ?auto_24927 ?auto_24925 ) ) ( not ( = ?auto_24926 ?auto_24925 ) ) ( not ( = ?auto_24924 ?auto_24925 ) ) ( ON ?auto_24923 ?auto_24922 ) ( ON-TABLE ?auto_24925 ) ( ON ?auto_24927 ?auto_24923 ) ( CLEAR ?auto_24927 ) ( HOLDING ?auto_24924 ) ( CLEAR ?auto_24926 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24926 ?auto_24924 )
      ( MAKE-2PILE ?auto_24922 ?auto_24923 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24928 - BLOCK
      ?auto_24929 - BLOCK
    )
    :vars
    (
      ?auto_24932 - BLOCK
      ?auto_24930 - BLOCK
      ?auto_24933 - BLOCK
      ?auto_24931 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24928 ?auto_24929 ) ) ( not ( = ?auto_24928 ?auto_24932 ) ) ( not ( = ?auto_24929 ?auto_24932 ) ) ( ON-TABLE ?auto_24930 ) ( not ( = ?auto_24930 ?auto_24933 ) ) ( not ( = ?auto_24930 ?auto_24932 ) ) ( not ( = ?auto_24930 ?auto_24929 ) ) ( not ( = ?auto_24930 ?auto_24928 ) ) ( not ( = ?auto_24933 ?auto_24932 ) ) ( not ( = ?auto_24933 ?auto_24929 ) ) ( not ( = ?auto_24933 ?auto_24928 ) ) ( ON ?auto_24928 ?auto_24931 ) ( not ( = ?auto_24928 ?auto_24931 ) ) ( not ( = ?auto_24929 ?auto_24931 ) ) ( not ( = ?auto_24932 ?auto_24931 ) ) ( not ( = ?auto_24930 ?auto_24931 ) ) ( not ( = ?auto_24933 ?auto_24931 ) ) ( ON ?auto_24929 ?auto_24928 ) ( ON-TABLE ?auto_24931 ) ( ON ?auto_24932 ?auto_24929 ) ( CLEAR ?auto_24930 ) ( ON ?auto_24933 ?auto_24932 ) ( CLEAR ?auto_24933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24931 ?auto_24928 ?auto_24929 ?auto_24932 )
      ( MAKE-2PILE ?auto_24928 ?auto_24929 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24934 - BLOCK
      ?auto_24935 - BLOCK
    )
    :vars
    (
      ?auto_24939 - BLOCK
      ?auto_24937 - BLOCK
      ?auto_24938 - BLOCK
      ?auto_24936 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24934 ?auto_24935 ) ) ( not ( = ?auto_24934 ?auto_24939 ) ) ( not ( = ?auto_24935 ?auto_24939 ) ) ( not ( = ?auto_24937 ?auto_24938 ) ) ( not ( = ?auto_24937 ?auto_24939 ) ) ( not ( = ?auto_24937 ?auto_24935 ) ) ( not ( = ?auto_24937 ?auto_24934 ) ) ( not ( = ?auto_24938 ?auto_24939 ) ) ( not ( = ?auto_24938 ?auto_24935 ) ) ( not ( = ?auto_24938 ?auto_24934 ) ) ( ON ?auto_24934 ?auto_24936 ) ( not ( = ?auto_24934 ?auto_24936 ) ) ( not ( = ?auto_24935 ?auto_24936 ) ) ( not ( = ?auto_24939 ?auto_24936 ) ) ( not ( = ?auto_24937 ?auto_24936 ) ) ( not ( = ?auto_24938 ?auto_24936 ) ) ( ON ?auto_24935 ?auto_24934 ) ( ON-TABLE ?auto_24936 ) ( ON ?auto_24939 ?auto_24935 ) ( ON ?auto_24938 ?auto_24939 ) ( CLEAR ?auto_24938 ) ( HOLDING ?auto_24937 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24937 )
      ( MAKE-2PILE ?auto_24934 ?auto_24935 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24940 - BLOCK
      ?auto_24941 - BLOCK
    )
    :vars
    (
      ?auto_24944 - BLOCK
      ?auto_24943 - BLOCK
      ?auto_24945 - BLOCK
      ?auto_24942 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24940 ?auto_24941 ) ) ( not ( = ?auto_24940 ?auto_24944 ) ) ( not ( = ?auto_24941 ?auto_24944 ) ) ( not ( = ?auto_24943 ?auto_24945 ) ) ( not ( = ?auto_24943 ?auto_24944 ) ) ( not ( = ?auto_24943 ?auto_24941 ) ) ( not ( = ?auto_24943 ?auto_24940 ) ) ( not ( = ?auto_24945 ?auto_24944 ) ) ( not ( = ?auto_24945 ?auto_24941 ) ) ( not ( = ?auto_24945 ?auto_24940 ) ) ( ON ?auto_24940 ?auto_24942 ) ( not ( = ?auto_24940 ?auto_24942 ) ) ( not ( = ?auto_24941 ?auto_24942 ) ) ( not ( = ?auto_24944 ?auto_24942 ) ) ( not ( = ?auto_24943 ?auto_24942 ) ) ( not ( = ?auto_24945 ?auto_24942 ) ) ( ON ?auto_24941 ?auto_24940 ) ( ON-TABLE ?auto_24942 ) ( ON ?auto_24944 ?auto_24941 ) ( ON ?auto_24945 ?auto_24944 ) ( ON ?auto_24943 ?auto_24945 ) ( CLEAR ?auto_24943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24942 ?auto_24940 ?auto_24941 ?auto_24944 ?auto_24945 )
      ( MAKE-2PILE ?auto_24940 ?auto_24941 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24948 - BLOCK
      ?auto_24949 - BLOCK
    )
    :vars
    (
      ?auto_24950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24950 ?auto_24949 ) ( CLEAR ?auto_24950 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24948 ) ( ON ?auto_24949 ?auto_24948 ) ( not ( = ?auto_24948 ?auto_24949 ) ) ( not ( = ?auto_24948 ?auto_24950 ) ) ( not ( = ?auto_24949 ?auto_24950 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24950 ?auto_24949 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24951 - BLOCK
      ?auto_24952 - BLOCK
    )
    :vars
    (
      ?auto_24953 - BLOCK
      ?auto_24954 - BLOCK
      ?auto_24955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24953 ?auto_24952 ) ( CLEAR ?auto_24953 ) ( ON-TABLE ?auto_24951 ) ( ON ?auto_24952 ?auto_24951 ) ( not ( = ?auto_24951 ?auto_24952 ) ) ( not ( = ?auto_24951 ?auto_24953 ) ) ( not ( = ?auto_24952 ?auto_24953 ) ) ( HOLDING ?auto_24954 ) ( CLEAR ?auto_24955 ) ( not ( = ?auto_24951 ?auto_24954 ) ) ( not ( = ?auto_24951 ?auto_24955 ) ) ( not ( = ?auto_24952 ?auto_24954 ) ) ( not ( = ?auto_24952 ?auto_24955 ) ) ( not ( = ?auto_24953 ?auto_24954 ) ) ( not ( = ?auto_24953 ?auto_24955 ) ) ( not ( = ?auto_24954 ?auto_24955 ) ) )
    :subtasks
    ( ( !STACK ?auto_24954 ?auto_24955 )
      ( MAKE-2PILE ?auto_24951 ?auto_24952 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24956 - BLOCK
      ?auto_24957 - BLOCK
    )
    :vars
    (
      ?auto_24959 - BLOCK
      ?auto_24960 - BLOCK
      ?auto_24958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24959 ?auto_24957 ) ( ON-TABLE ?auto_24956 ) ( ON ?auto_24957 ?auto_24956 ) ( not ( = ?auto_24956 ?auto_24957 ) ) ( not ( = ?auto_24956 ?auto_24959 ) ) ( not ( = ?auto_24957 ?auto_24959 ) ) ( CLEAR ?auto_24960 ) ( not ( = ?auto_24956 ?auto_24958 ) ) ( not ( = ?auto_24956 ?auto_24960 ) ) ( not ( = ?auto_24957 ?auto_24958 ) ) ( not ( = ?auto_24957 ?auto_24960 ) ) ( not ( = ?auto_24959 ?auto_24958 ) ) ( not ( = ?auto_24959 ?auto_24960 ) ) ( not ( = ?auto_24958 ?auto_24960 ) ) ( ON ?auto_24958 ?auto_24959 ) ( CLEAR ?auto_24958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24956 ?auto_24957 ?auto_24959 )
      ( MAKE-2PILE ?auto_24956 ?auto_24957 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24961 - BLOCK
      ?auto_24962 - BLOCK
    )
    :vars
    (
      ?auto_24963 - BLOCK
      ?auto_24965 - BLOCK
      ?auto_24964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24963 ?auto_24962 ) ( ON-TABLE ?auto_24961 ) ( ON ?auto_24962 ?auto_24961 ) ( not ( = ?auto_24961 ?auto_24962 ) ) ( not ( = ?auto_24961 ?auto_24963 ) ) ( not ( = ?auto_24962 ?auto_24963 ) ) ( not ( = ?auto_24961 ?auto_24965 ) ) ( not ( = ?auto_24961 ?auto_24964 ) ) ( not ( = ?auto_24962 ?auto_24965 ) ) ( not ( = ?auto_24962 ?auto_24964 ) ) ( not ( = ?auto_24963 ?auto_24965 ) ) ( not ( = ?auto_24963 ?auto_24964 ) ) ( not ( = ?auto_24965 ?auto_24964 ) ) ( ON ?auto_24965 ?auto_24963 ) ( CLEAR ?auto_24965 ) ( HOLDING ?auto_24964 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24964 )
      ( MAKE-2PILE ?auto_24961 ?auto_24962 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24966 - BLOCK
      ?auto_24967 - BLOCK
    )
    :vars
    (
      ?auto_24970 - BLOCK
      ?auto_24969 - BLOCK
      ?auto_24968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24970 ?auto_24967 ) ( ON-TABLE ?auto_24966 ) ( ON ?auto_24967 ?auto_24966 ) ( not ( = ?auto_24966 ?auto_24967 ) ) ( not ( = ?auto_24966 ?auto_24970 ) ) ( not ( = ?auto_24967 ?auto_24970 ) ) ( not ( = ?auto_24966 ?auto_24969 ) ) ( not ( = ?auto_24966 ?auto_24968 ) ) ( not ( = ?auto_24967 ?auto_24969 ) ) ( not ( = ?auto_24967 ?auto_24968 ) ) ( not ( = ?auto_24970 ?auto_24969 ) ) ( not ( = ?auto_24970 ?auto_24968 ) ) ( not ( = ?auto_24969 ?auto_24968 ) ) ( ON ?auto_24969 ?auto_24970 ) ( ON ?auto_24968 ?auto_24969 ) ( CLEAR ?auto_24968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24966 ?auto_24967 ?auto_24970 ?auto_24969 )
      ( MAKE-2PILE ?auto_24966 ?auto_24967 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24971 - BLOCK
      ?auto_24972 - BLOCK
    )
    :vars
    (
      ?auto_24973 - BLOCK
      ?auto_24974 - BLOCK
      ?auto_24975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24973 ?auto_24972 ) ( ON-TABLE ?auto_24971 ) ( ON ?auto_24972 ?auto_24971 ) ( not ( = ?auto_24971 ?auto_24972 ) ) ( not ( = ?auto_24971 ?auto_24973 ) ) ( not ( = ?auto_24972 ?auto_24973 ) ) ( not ( = ?auto_24971 ?auto_24974 ) ) ( not ( = ?auto_24971 ?auto_24975 ) ) ( not ( = ?auto_24972 ?auto_24974 ) ) ( not ( = ?auto_24972 ?auto_24975 ) ) ( not ( = ?auto_24973 ?auto_24974 ) ) ( not ( = ?auto_24973 ?auto_24975 ) ) ( not ( = ?auto_24974 ?auto_24975 ) ) ( ON ?auto_24974 ?auto_24973 ) ( HOLDING ?auto_24975 ) ( CLEAR ?auto_24974 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24971 ?auto_24972 ?auto_24973 ?auto_24974 ?auto_24975 )
      ( MAKE-2PILE ?auto_24971 ?auto_24972 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24976 - BLOCK
      ?auto_24977 - BLOCK
    )
    :vars
    (
      ?auto_24979 - BLOCK
      ?auto_24978 - BLOCK
      ?auto_24980 - BLOCK
      ?auto_24981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24979 ?auto_24977 ) ( ON-TABLE ?auto_24976 ) ( ON ?auto_24977 ?auto_24976 ) ( not ( = ?auto_24976 ?auto_24977 ) ) ( not ( = ?auto_24976 ?auto_24979 ) ) ( not ( = ?auto_24977 ?auto_24979 ) ) ( not ( = ?auto_24976 ?auto_24978 ) ) ( not ( = ?auto_24976 ?auto_24980 ) ) ( not ( = ?auto_24977 ?auto_24978 ) ) ( not ( = ?auto_24977 ?auto_24980 ) ) ( not ( = ?auto_24979 ?auto_24978 ) ) ( not ( = ?auto_24979 ?auto_24980 ) ) ( not ( = ?auto_24978 ?auto_24980 ) ) ( ON ?auto_24978 ?auto_24979 ) ( CLEAR ?auto_24978 ) ( ON ?auto_24980 ?auto_24981 ) ( CLEAR ?auto_24980 ) ( HAND-EMPTY ) ( not ( = ?auto_24976 ?auto_24981 ) ) ( not ( = ?auto_24977 ?auto_24981 ) ) ( not ( = ?auto_24979 ?auto_24981 ) ) ( not ( = ?auto_24978 ?auto_24981 ) ) ( not ( = ?auto_24980 ?auto_24981 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24980 ?auto_24981 )
      ( MAKE-2PILE ?auto_24976 ?auto_24977 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24982 - BLOCK
      ?auto_24983 - BLOCK
    )
    :vars
    (
      ?auto_24986 - BLOCK
      ?auto_24987 - BLOCK
      ?auto_24985 - BLOCK
      ?auto_24984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24986 ?auto_24983 ) ( ON-TABLE ?auto_24982 ) ( ON ?auto_24983 ?auto_24982 ) ( not ( = ?auto_24982 ?auto_24983 ) ) ( not ( = ?auto_24982 ?auto_24986 ) ) ( not ( = ?auto_24983 ?auto_24986 ) ) ( not ( = ?auto_24982 ?auto_24987 ) ) ( not ( = ?auto_24982 ?auto_24985 ) ) ( not ( = ?auto_24983 ?auto_24987 ) ) ( not ( = ?auto_24983 ?auto_24985 ) ) ( not ( = ?auto_24986 ?auto_24987 ) ) ( not ( = ?auto_24986 ?auto_24985 ) ) ( not ( = ?auto_24987 ?auto_24985 ) ) ( ON ?auto_24985 ?auto_24984 ) ( CLEAR ?auto_24985 ) ( not ( = ?auto_24982 ?auto_24984 ) ) ( not ( = ?auto_24983 ?auto_24984 ) ) ( not ( = ?auto_24986 ?auto_24984 ) ) ( not ( = ?auto_24987 ?auto_24984 ) ) ( not ( = ?auto_24985 ?auto_24984 ) ) ( HOLDING ?auto_24987 ) ( CLEAR ?auto_24986 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24982 ?auto_24983 ?auto_24986 ?auto_24987 )
      ( MAKE-2PILE ?auto_24982 ?auto_24983 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24988 - BLOCK
      ?auto_24989 - BLOCK
    )
    :vars
    (
      ?auto_24991 - BLOCK
      ?auto_24990 - BLOCK
      ?auto_24992 - BLOCK
      ?auto_24993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24991 ?auto_24989 ) ( ON-TABLE ?auto_24988 ) ( ON ?auto_24989 ?auto_24988 ) ( not ( = ?auto_24988 ?auto_24989 ) ) ( not ( = ?auto_24988 ?auto_24991 ) ) ( not ( = ?auto_24989 ?auto_24991 ) ) ( not ( = ?auto_24988 ?auto_24990 ) ) ( not ( = ?auto_24988 ?auto_24992 ) ) ( not ( = ?auto_24989 ?auto_24990 ) ) ( not ( = ?auto_24989 ?auto_24992 ) ) ( not ( = ?auto_24991 ?auto_24990 ) ) ( not ( = ?auto_24991 ?auto_24992 ) ) ( not ( = ?auto_24990 ?auto_24992 ) ) ( ON ?auto_24992 ?auto_24993 ) ( not ( = ?auto_24988 ?auto_24993 ) ) ( not ( = ?auto_24989 ?auto_24993 ) ) ( not ( = ?auto_24991 ?auto_24993 ) ) ( not ( = ?auto_24990 ?auto_24993 ) ) ( not ( = ?auto_24992 ?auto_24993 ) ) ( CLEAR ?auto_24991 ) ( ON ?auto_24990 ?auto_24992 ) ( CLEAR ?auto_24990 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24993 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24993 ?auto_24992 )
      ( MAKE-2PILE ?auto_24988 ?auto_24989 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25006 - BLOCK
      ?auto_25007 - BLOCK
    )
    :vars
    (
      ?auto_25009 - BLOCK
      ?auto_25010 - BLOCK
      ?auto_25008 - BLOCK
      ?auto_25011 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25006 ) ( not ( = ?auto_25006 ?auto_25007 ) ) ( not ( = ?auto_25006 ?auto_25009 ) ) ( not ( = ?auto_25007 ?auto_25009 ) ) ( not ( = ?auto_25006 ?auto_25010 ) ) ( not ( = ?auto_25006 ?auto_25008 ) ) ( not ( = ?auto_25007 ?auto_25010 ) ) ( not ( = ?auto_25007 ?auto_25008 ) ) ( not ( = ?auto_25009 ?auto_25010 ) ) ( not ( = ?auto_25009 ?auto_25008 ) ) ( not ( = ?auto_25010 ?auto_25008 ) ) ( ON ?auto_25008 ?auto_25011 ) ( not ( = ?auto_25006 ?auto_25011 ) ) ( not ( = ?auto_25007 ?auto_25011 ) ) ( not ( = ?auto_25009 ?auto_25011 ) ) ( not ( = ?auto_25010 ?auto_25011 ) ) ( not ( = ?auto_25008 ?auto_25011 ) ) ( ON ?auto_25010 ?auto_25008 ) ( ON-TABLE ?auto_25011 ) ( ON ?auto_25009 ?auto_25010 ) ( CLEAR ?auto_25009 ) ( HOLDING ?auto_25007 ) ( CLEAR ?auto_25006 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25006 ?auto_25007 ?auto_25009 )
      ( MAKE-2PILE ?auto_25006 ?auto_25007 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25012 - BLOCK
      ?auto_25013 - BLOCK
    )
    :vars
    (
      ?auto_25014 - BLOCK
      ?auto_25015 - BLOCK
      ?auto_25017 - BLOCK
      ?auto_25016 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25012 ) ( not ( = ?auto_25012 ?auto_25013 ) ) ( not ( = ?auto_25012 ?auto_25014 ) ) ( not ( = ?auto_25013 ?auto_25014 ) ) ( not ( = ?auto_25012 ?auto_25015 ) ) ( not ( = ?auto_25012 ?auto_25017 ) ) ( not ( = ?auto_25013 ?auto_25015 ) ) ( not ( = ?auto_25013 ?auto_25017 ) ) ( not ( = ?auto_25014 ?auto_25015 ) ) ( not ( = ?auto_25014 ?auto_25017 ) ) ( not ( = ?auto_25015 ?auto_25017 ) ) ( ON ?auto_25017 ?auto_25016 ) ( not ( = ?auto_25012 ?auto_25016 ) ) ( not ( = ?auto_25013 ?auto_25016 ) ) ( not ( = ?auto_25014 ?auto_25016 ) ) ( not ( = ?auto_25015 ?auto_25016 ) ) ( not ( = ?auto_25017 ?auto_25016 ) ) ( ON ?auto_25015 ?auto_25017 ) ( ON-TABLE ?auto_25016 ) ( ON ?auto_25014 ?auto_25015 ) ( CLEAR ?auto_25012 ) ( ON ?auto_25013 ?auto_25014 ) ( CLEAR ?auto_25013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25016 ?auto_25017 ?auto_25015 ?auto_25014 )
      ( MAKE-2PILE ?auto_25012 ?auto_25013 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25018 - BLOCK
      ?auto_25019 - BLOCK
    )
    :vars
    (
      ?auto_25023 - BLOCK
      ?auto_25021 - BLOCK
      ?auto_25020 - BLOCK
      ?auto_25022 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25018 ?auto_25019 ) ) ( not ( = ?auto_25018 ?auto_25023 ) ) ( not ( = ?auto_25019 ?auto_25023 ) ) ( not ( = ?auto_25018 ?auto_25021 ) ) ( not ( = ?auto_25018 ?auto_25020 ) ) ( not ( = ?auto_25019 ?auto_25021 ) ) ( not ( = ?auto_25019 ?auto_25020 ) ) ( not ( = ?auto_25023 ?auto_25021 ) ) ( not ( = ?auto_25023 ?auto_25020 ) ) ( not ( = ?auto_25021 ?auto_25020 ) ) ( ON ?auto_25020 ?auto_25022 ) ( not ( = ?auto_25018 ?auto_25022 ) ) ( not ( = ?auto_25019 ?auto_25022 ) ) ( not ( = ?auto_25023 ?auto_25022 ) ) ( not ( = ?auto_25021 ?auto_25022 ) ) ( not ( = ?auto_25020 ?auto_25022 ) ) ( ON ?auto_25021 ?auto_25020 ) ( ON-TABLE ?auto_25022 ) ( ON ?auto_25023 ?auto_25021 ) ( ON ?auto_25019 ?auto_25023 ) ( CLEAR ?auto_25019 ) ( HOLDING ?auto_25018 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25018 )
      ( MAKE-2PILE ?auto_25018 ?auto_25019 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25024 - BLOCK
      ?auto_25025 - BLOCK
    )
    :vars
    (
      ?auto_25028 - BLOCK
      ?auto_25029 - BLOCK
      ?auto_25026 - BLOCK
      ?auto_25027 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25024 ?auto_25025 ) ) ( not ( = ?auto_25024 ?auto_25028 ) ) ( not ( = ?auto_25025 ?auto_25028 ) ) ( not ( = ?auto_25024 ?auto_25029 ) ) ( not ( = ?auto_25024 ?auto_25026 ) ) ( not ( = ?auto_25025 ?auto_25029 ) ) ( not ( = ?auto_25025 ?auto_25026 ) ) ( not ( = ?auto_25028 ?auto_25029 ) ) ( not ( = ?auto_25028 ?auto_25026 ) ) ( not ( = ?auto_25029 ?auto_25026 ) ) ( ON ?auto_25026 ?auto_25027 ) ( not ( = ?auto_25024 ?auto_25027 ) ) ( not ( = ?auto_25025 ?auto_25027 ) ) ( not ( = ?auto_25028 ?auto_25027 ) ) ( not ( = ?auto_25029 ?auto_25027 ) ) ( not ( = ?auto_25026 ?auto_25027 ) ) ( ON ?auto_25029 ?auto_25026 ) ( ON-TABLE ?auto_25027 ) ( ON ?auto_25028 ?auto_25029 ) ( ON ?auto_25025 ?auto_25028 ) ( ON ?auto_25024 ?auto_25025 ) ( CLEAR ?auto_25024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25027 ?auto_25026 ?auto_25029 ?auto_25028 ?auto_25025 )
      ( MAKE-2PILE ?auto_25024 ?auto_25025 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25033 - BLOCK
      ?auto_25034 - BLOCK
      ?auto_25035 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_25035 ) ( CLEAR ?auto_25034 ) ( ON-TABLE ?auto_25033 ) ( ON ?auto_25034 ?auto_25033 ) ( not ( = ?auto_25033 ?auto_25034 ) ) ( not ( = ?auto_25033 ?auto_25035 ) ) ( not ( = ?auto_25034 ?auto_25035 ) ) )
    :subtasks
    ( ( !STACK ?auto_25035 ?auto_25034 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25036 - BLOCK
      ?auto_25037 - BLOCK
      ?auto_25038 - BLOCK
    )
    :vars
    (
      ?auto_25039 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25037 ) ( ON-TABLE ?auto_25036 ) ( ON ?auto_25037 ?auto_25036 ) ( not ( = ?auto_25036 ?auto_25037 ) ) ( not ( = ?auto_25036 ?auto_25038 ) ) ( not ( = ?auto_25037 ?auto_25038 ) ) ( ON ?auto_25038 ?auto_25039 ) ( CLEAR ?auto_25038 ) ( HAND-EMPTY ) ( not ( = ?auto_25036 ?auto_25039 ) ) ( not ( = ?auto_25037 ?auto_25039 ) ) ( not ( = ?auto_25038 ?auto_25039 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25038 ?auto_25039 )
      ( MAKE-3PILE ?auto_25036 ?auto_25037 ?auto_25038 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25040 - BLOCK
      ?auto_25041 - BLOCK
      ?auto_25042 - BLOCK
    )
    :vars
    (
      ?auto_25043 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25040 ) ( not ( = ?auto_25040 ?auto_25041 ) ) ( not ( = ?auto_25040 ?auto_25042 ) ) ( not ( = ?auto_25041 ?auto_25042 ) ) ( ON ?auto_25042 ?auto_25043 ) ( CLEAR ?auto_25042 ) ( not ( = ?auto_25040 ?auto_25043 ) ) ( not ( = ?auto_25041 ?auto_25043 ) ) ( not ( = ?auto_25042 ?auto_25043 ) ) ( HOLDING ?auto_25041 ) ( CLEAR ?auto_25040 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25040 ?auto_25041 )
      ( MAKE-3PILE ?auto_25040 ?auto_25041 ?auto_25042 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25044 - BLOCK
      ?auto_25045 - BLOCK
      ?auto_25046 - BLOCK
    )
    :vars
    (
      ?auto_25047 - BLOCK
      ?auto_25048 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25044 ) ( not ( = ?auto_25044 ?auto_25045 ) ) ( not ( = ?auto_25044 ?auto_25046 ) ) ( not ( = ?auto_25045 ?auto_25046 ) ) ( ON ?auto_25046 ?auto_25047 ) ( not ( = ?auto_25044 ?auto_25047 ) ) ( not ( = ?auto_25045 ?auto_25047 ) ) ( not ( = ?auto_25046 ?auto_25047 ) ) ( CLEAR ?auto_25044 ) ( ON ?auto_25045 ?auto_25046 ) ( CLEAR ?auto_25045 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25048 ) ( ON ?auto_25047 ?auto_25048 ) ( not ( = ?auto_25048 ?auto_25047 ) ) ( not ( = ?auto_25048 ?auto_25046 ) ) ( not ( = ?auto_25048 ?auto_25045 ) ) ( not ( = ?auto_25044 ?auto_25048 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25048 ?auto_25047 ?auto_25046 )
      ( MAKE-3PILE ?auto_25044 ?auto_25045 ?auto_25046 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25049 - BLOCK
      ?auto_25050 - BLOCK
      ?auto_25051 - BLOCK
    )
    :vars
    (
      ?auto_25052 - BLOCK
      ?auto_25053 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25049 ?auto_25050 ) ) ( not ( = ?auto_25049 ?auto_25051 ) ) ( not ( = ?auto_25050 ?auto_25051 ) ) ( ON ?auto_25051 ?auto_25052 ) ( not ( = ?auto_25049 ?auto_25052 ) ) ( not ( = ?auto_25050 ?auto_25052 ) ) ( not ( = ?auto_25051 ?auto_25052 ) ) ( ON ?auto_25050 ?auto_25051 ) ( CLEAR ?auto_25050 ) ( ON-TABLE ?auto_25053 ) ( ON ?auto_25052 ?auto_25053 ) ( not ( = ?auto_25053 ?auto_25052 ) ) ( not ( = ?auto_25053 ?auto_25051 ) ) ( not ( = ?auto_25053 ?auto_25050 ) ) ( not ( = ?auto_25049 ?auto_25053 ) ) ( HOLDING ?auto_25049 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25049 )
      ( MAKE-3PILE ?auto_25049 ?auto_25050 ?auto_25051 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25054 - BLOCK
      ?auto_25055 - BLOCK
      ?auto_25056 - BLOCK
    )
    :vars
    (
      ?auto_25057 - BLOCK
      ?auto_25058 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25054 ?auto_25055 ) ) ( not ( = ?auto_25054 ?auto_25056 ) ) ( not ( = ?auto_25055 ?auto_25056 ) ) ( ON ?auto_25056 ?auto_25057 ) ( not ( = ?auto_25054 ?auto_25057 ) ) ( not ( = ?auto_25055 ?auto_25057 ) ) ( not ( = ?auto_25056 ?auto_25057 ) ) ( ON ?auto_25055 ?auto_25056 ) ( ON-TABLE ?auto_25058 ) ( ON ?auto_25057 ?auto_25058 ) ( not ( = ?auto_25058 ?auto_25057 ) ) ( not ( = ?auto_25058 ?auto_25056 ) ) ( not ( = ?auto_25058 ?auto_25055 ) ) ( not ( = ?auto_25054 ?auto_25058 ) ) ( ON ?auto_25054 ?auto_25055 ) ( CLEAR ?auto_25054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25058 ?auto_25057 ?auto_25056 ?auto_25055 )
      ( MAKE-3PILE ?auto_25054 ?auto_25055 ?auto_25056 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25059 - BLOCK
      ?auto_25060 - BLOCK
      ?auto_25061 - BLOCK
    )
    :vars
    (
      ?auto_25062 - BLOCK
      ?auto_25063 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25059 ?auto_25060 ) ) ( not ( = ?auto_25059 ?auto_25061 ) ) ( not ( = ?auto_25060 ?auto_25061 ) ) ( ON ?auto_25061 ?auto_25062 ) ( not ( = ?auto_25059 ?auto_25062 ) ) ( not ( = ?auto_25060 ?auto_25062 ) ) ( not ( = ?auto_25061 ?auto_25062 ) ) ( ON ?auto_25060 ?auto_25061 ) ( ON-TABLE ?auto_25063 ) ( ON ?auto_25062 ?auto_25063 ) ( not ( = ?auto_25063 ?auto_25062 ) ) ( not ( = ?auto_25063 ?auto_25061 ) ) ( not ( = ?auto_25063 ?auto_25060 ) ) ( not ( = ?auto_25059 ?auto_25063 ) ) ( HOLDING ?auto_25059 ) ( CLEAR ?auto_25060 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25063 ?auto_25062 ?auto_25061 ?auto_25060 ?auto_25059 )
      ( MAKE-3PILE ?auto_25059 ?auto_25060 ?auto_25061 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25064 - BLOCK
      ?auto_25065 - BLOCK
      ?auto_25066 - BLOCK
    )
    :vars
    (
      ?auto_25068 - BLOCK
      ?auto_25067 - BLOCK
      ?auto_25069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25064 ?auto_25065 ) ) ( not ( = ?auto_25064 ?auto_25066 ) ) ( not ( = ?auto_25065 ?auto_25066 ) ) ( ON ?auto_25066 ?auto_25068 ) ( not ( = ?auto_25064 ?auto_25068 ) ) ( not ( = ?auto_25065 ?auto_25068 ) ) ( not ( = ?auto_25066 ?auto_25068 ) ) ( ON ?auto_25065 ?auto_25066 ) ( ON-TABLE ?auto_25067 ) ( ON ?auto_25068 ?auto_25067 ) ( not ( = ?auto_25067 ?auto_25068 ) ) ( not ( = ?auto_25067 ?auto_25066 ) ) ( not ( = ?auto_25067 ?auto_25065 ) ) ( not ( = ?auto_25064 ?auto_25067 ) ) ( CLEAR ?auto_25065 ) ( ON ?auto_25064 ?auto_25069 ) ( CLEAR ?auto_25064 ) ( HAND-EMPTY ) ( not ( = ?auto_25064 ?auto_25069 ) ) ( not ( = ?auto_25065 ?auto_25069 ) ) ( not ( = ?auto_25066 ?auto_25069 ) ) ( not ( = ?auto_25068 ?auto_25069 ) ) ( not ( = ?auto_25067 ?auto_25069 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25064 ?auto_25069 )
      ( MAKE-3PILE ?auto_25064 ?auto_25065 ?auto_25066 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25070 - BLOCK
      ?auto_25071 - BLOCK
      ?auto_25072 - BLOCK
    )
    :vars
    (
      ?auto_25074 - BLOCK
      ?auto_25073 - BLOCK
      ?auto_25075 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25070 ?auto_25071 ) ) ( not ( = ?auto_25070 ?auto_25072 ) ) ( not ( = ?auto_25071 ?auto_25072 ) ) ( ON ?auto_25072 ?auto_25074 ) ( not ( = ?auto_25070 ?auto_25074 ) ) ( not ( = ?auto_25071 ?auto_25074 ) ) ( not ( = ?auto_25072 ?auto_25074 ) ) ( ON-TABLE ?auto_25073 ) ( ON ?auto_25074 ?auto_25073 ) ( not ( = ?auto_25073 ?auto_25074 ) ) ( not ( = ?auto_25073 ?auto_25072 ) ) ( not ( = ?auto_25073 ?auto_25071 ) ) ( not ( = ?auto_25070 ?auto_25073 ) ) ( ON ?auto_25070 ?auto_25075 ) ( CLEAR ?auto_25070 ) ( not ( = ?auto_25070 ?auto_25075 ) ) ( not ( = ?auto_25071 ?auto_25075 ) ) ( not ( = ?auto_25072 ?auto_25075 ) ) ( not ( = ?auto_25074 ?auto_25075 ) ) ( not ( = ?auto_25073 ?auto_25075 ) ) ( HOLDING ?auto_25071 ) ( CLEAR ?auto_25072 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25073 ?auto_25074 ?auto_25072 ?auto_25071 )
      ( MAKE-3PILE ?auto_25070 ?auto_25071 ?auto_25072 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25076 - BLOCK
      ?auto_25077 - BLOCK
      ?auto_25078 - BLOCK
    )
    :vars
    (
      ?auto_25080 - BLOCK
      ?auto_25081 - BLOCK
      ?auto_25079 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25076 ?auto_25077 ) ) ( not ( = ?auto_25076 ?auto_25078 ) ) ( not ( = ?auto_25077 ?auto_25078 ) ) ( ON ?auto_25078 ?auto_25080 ) ( not ( = ?auto_25076 ?auto_25080 ) ) ( not ( = ?auto_25077 ?auto_25080 ) ) ( not ( = ?auto_25078 ?auto_25080 ) ) ( ON-TABLE ?auto_25081 ) ( ON ?auto_25080 ?auto_25081 ) ( not ( = ?auto_25081 ?auto_25080 ) ) ( not ( = ?auto_25081 ?auto_25078 ) ) ( not ( = ?auto_25081 ?auto_25077 ) ) ( not ( = ?auto_25076 ?auto_25081 ) ) ( ON ?auto_25076 ?auto_25079 ) ( not ( = ?auto_25076 ?auto_25079 ) ) ( not ( = ?auto_25077 ?auto_25079 ) ) ( not ( = ?auto_25078 ?auto_25079 ) ) ( not ( = ?auto_25080 ?auto_25079 ) ) ( not ( = ?auto_25081 ?auto_25079 ) ) ( CLEAR ?auto_25078 ) ( ON ?auto_25077 ?auto_25076 ) ( CLEAR ?auto_25077 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25079 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25079 ?auto_25076 )
      ( MAKE-3PILE ?auto_25076 ?auto_25077 ?auto_25078 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25082 - BLOCK
      ?auto_25083 - BLOCK
      ?auto_25084 - BLOCK
    )
    :vars
    (
      ?auto_25087 - BLOCK
      ?auto_25086 - BLOCK
      ?auto_25085 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25082 ?auto_25083 ) ) ( not ( = ?auto_25082 ?auto_25084 ) ) ( not ( = ?auto_25083 ?auto_25084 ) ) ( not ( = ?auto_25082 ?auto_25087 ) ) ( not ( = ?auto_25083 ?auto_25087 ) ) ( not ( = ?auto_25084 ?auto_25087 ) ) ( ON-TABLE ?auto_25086 ) ( ON ?auto_25087 ?auto_25086 ) ( not ( = ?auto_25086 ?auto_25087 ) ) ( not ( = ?auto_25086 ?auto_25084 ) ) ( not ( = ?auto_25086 ?auto_25083 ) ) ( not ( = ?auto_25082 ?auto_25086 ) ) ( ON ?auto_25082 ?auto_25085 ) ( not ( = ?auto_25082 ?auto_25085 ) ) ( not ( = ?auto_25083 ?auto_25085 ) ) ( not ( = ?auto_25084 ?auto_25085 ) ) ( not ( = ?auto_25087 ?auto_25085 ) ) ( not ( = ?auto_25086 ?auto_25085 ) ) ( ON ?auto_25083 ?auto_25082 ) ( CLEAR ?auto_25083 ) ( ON-TABLE ?auto_25085 ) ( HOLDING ?auto_25084 ) ( CLEAR ?auto_25087 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25086 ?auto_25087 ?auto_25084 )
      ( MAKE-3PILE ?auto_25082 ?auto_25083 ?auto_25084 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25088 - BLOCK
      ?auto_25089 - BLOCK
      ?auto_25090 - BLOCK
    )
    :vars
    (
      ?auto_25092 - BLOCK
      ?auto_25093 - BLOCK
      ?auto_25091 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25088 ?auto_25089 ) ) ( not ( = ?auto_25088 ?auto_25090 ) ) ( not ( = ?auto_25089 ?auto_25090 ) ) ( not ( = ?auto_25088 ?auto_25092 ) ) ( not ( = ?auto_25089 ?auto_25092 ) ) ( not ( = ?auto_25090 ?auto_25092 ) ) ( ON-TABLE ?auto_25093 ) ( ON ?auto_25092 ?auto_25093 ) ( not ( = ?auto_25093 ?auto_25092 ) ) ( not ( = ?auto_25093 ?auto_25090 ) ) ( not ( = ?auto_25093 ?auto_25089 ) ) ( not ( = ?auto_25088 ?auto_25093 ) ) ( ON ?auto_25088 ?auto_25091 ) ( not ( = ?auto_25088 ?auto_25091 ) ) ( not ( = ?auto_25089 ?auto_25091 ) ) ( not ( = ?auto_25090 ?auto_25091 ) ) ( not ( = ?auto_25092 ?auto_25091 ) ) ( not ( = ?auto_25093 ?auto_25091 ) ) ( ON ?auto_25089 ?auto_25088 ) ( ON-TABLE ?auto_25091 ) ( CLEAR ?auto_25092 ) ( ON ?auto_25090 ?auto_25089 ) ( CLEAR ?auto_25090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25091 ?auto_25088 ?auto_25089 )
      ( MAKE-3PILE ?auto_25088 ?auto_25089 ?auto_25090 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25094 - BLOCK
      ?auto_25095 - BLOCK
      ?auto_25096 - BLOCK
    )
    :vars
    (
      ?auto_25098 - BLOCK
      ?auto_25097 - BLOCK
      ?auto_25099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25094 ?auto_25095 ) ) ( not ( = ?auto_25094 ?auto_25096 ) ) ( not ( = ?auto_25095 ?auto_25096 ) ) ( not ( = ?auto_25094 ?auto_25098 ) ) ( not ( = ?auto_25095 ?auto_25098 ) ) ( not ( = ?auto_25096 ?auto_25098 ) ) ( ON-TABLE ?auto_25097 ) ( not ( = ?auto_25097 ?auto_25098 ) ) ( not ( = ?auto_25097 ?auto_25096 ) ) ( not ( = ?auto_25097 ?auto_25095 ) ) ( not ( = ?auto_25094 ?auto_25097 ) ) ( ON ?auto_25094 ?auto_25099 ) ( not ( = ?auto_25094 ?auto_25099 ) ) ( not ( = ?auto_25095 ?auto_25099 ) ) ( not ( = ?auto_25096 ?auto_25099 ) ) ( not ( = ?auto_25098 ?auto_25099 ) ) ( not ( = ?auto_25097 ?auto_25099 ) ) ( ON ?auto_25095 ?auto_25094 ) ( ON-TABLE ?auto_25099 ) ( ON ?auto_25096 ?auto_25095 ) ( CLEAR ?auto_25096 ) ( HOLDING ?auto_25098 ) ( CLEAR ?auto_25097 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25097 ?auto_25098 )
      ( MAKE-3PILE ?auto_25094 ?auto_25095 ?auto_25096 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25100 - BLOCK
      ?auto_25101 - BLOCK
      ?auto_25102 - BLOCK
    )
    :vars
    (
      ?auto_25104 - BLOCK
      ?auto_25103 - BLOCK
      ?auto_25105 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25100 ?auto_25101 ) ) ( not ( = ?auto_25100 ?auto_25102 ) ) ( not ( = ?auto_25101 ?auto_25102 ) ) ( not ( = ?auto_25100 ?auto_25104 ) ) ( not ( = ?auto_25101 ?auto_25104 ) ) ( not ( = ?auto_25102 ?auto_25104 ) ) ( ON-TABLE ?auto_25103 ) ( not ( = ?auto_25103 ?auto_25104 ) ) ( not ( = ?auto_25103 ?auto_25102 ) ) ( not ( = ?auto_25103 ?auto_25101 ) ) ( not ( = ?auto_25100 ?auto_25103 ) ) ( ON ?auto_25100 ?auto_25105 ) ( not ( = ?auto_25100 ?auto_25105 ) ) ( not ( = ?auto_25101 ?auto_25105 ) ) ( not ( = ?auto_25102 ?auto_25105 ) ) ( not ( = ?auto_25104 ?auto_25105 ) ) ( not ( = ?auto_25103 ?auto_25105 ) ) ( ON ?auto_25101 ?auto_25100 ) ( ON-TABLE ?auto_25105 ) ( ON ?auto_25102 ?auto_25101 ) ( CLEAR ?auto_25103 ) ( ON ?auto_25104 ?auto_25102 ) ( CLEAR ?auto_25104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25105 ?auto_25100 ?auto_25101 ?auto_25102 )
      ( MAKE-3PILE ?auto_25100 ?auto_25101 ?auto_25102 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25106 - BLOCK
      ?auto_25107 - BLOCK
      ?auto_25108 - BLOCK
    )
    :vars
    (
      ?auto_25111 - BLOCK
      ?auto_25109 - BLOCK
      ?auto_25110 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25106 ?auto_25107 ) ) ( not ( = ?auto_25106 ?auto_25108 ) ) ( not ( = ?auto_25107 ?auto_25108 ) ) ( not ( = ?auto_25106 ?auto_25111 ) ) ( not ( = ?auto_25107 ?auto_25111 ) ) ( not ( = ?auto_25108 ?auto_25111 ) ) ( not ( = ?auto_25109 ?auto_25111 ) ) ( not ( = ?auto_25109 ?auto_25108 ) ) ( not ( = ?auto_25109 ?auto_25107 ) ) ( not ( = ?auto_25106 ?auto_25109 ) ) ( ON ?auto_25106 ?auto_25110 ) ( not ( = ?auto_25106 ?auto_25110 ) ) ( not ( = ?auto_25107 ?auto_25110 ) ) ( not ( = ?auto_25108 ?auto_25110 ) ) ( not ( = ?auto_25111 ?auto_25110 ) ) ( not ( = ?auto_25109 ?auto_25110 ) ) ( ON ?auto_25107 ?auto_25106 ) ( ON-TABLE ?auto_25110 ) ( ON ?auto_25108 ?auto_25107 ) ( ON ?auto_25111 ?auto_25108 ) ( CLEAR ?auto_25111 ) ( HOLDING ?auto_25109 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25109 )
      ( MAKE-3PILE ?auto_25106 ?auto_25107 ?auto_25108 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25112 - BLOCK
      ?auto_25113 - BLOCK
      ?auto_25114 - BLOCK
    )
    :vars
    (
      ?auto_25116 - BLOCK
      ?auto_25115 - BLOCK
      ?auto_25117 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25112 ?auto_25113 ) ) ( not ( = ?auto_25112 ?auto_25114 ) ) ( not ( = ?auto_25113 ?auto_25114 ) ) ( not ( = ?auto_25112 ?auto_25116 ) ) ( not ( = ?auto_25113 ?auto_25116 ) ) ( not ( = ?auto_25114 ?auto_25116 ) ) ( not ( = ?auto_25115 ?auto_25116 ) ) ( not ( = ?auto_25115 ?auto_25114 ) ) ( not ( = ?auto_25115 ?auto_25113 ) ) ( not ( = ?auto_25112 ?auto_25115 ) ) ( ON ?auto_25112 ?auto_25117 ) ( not ( = ?auto_25112 ?auto_25117 ) ) ( not ( = ?auto_25113 ?auto_25117 ) ) ( not ( = ?auto_25114 ?auto_25117 ) ) ( not ( = ?auto_25116 ?auto_25117 ) ) ( not ( = ?auto_25115 ?auto_25117 ) ) ( ON ?auto_25113 ?auto_25112 ) ( ON-TABLE ?auto_25117 ) ( ON ?auto_25114 ?auto_25113 ) ( ON ?auto_25116 ?auto_25114 ) ( ON ?auto_25115 ?auto_25116 ) ( CLEAR ?auto_25115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25117 ?auto_25112 ?auto_25113 ?auto_25114 ?auto_25116 )
      ( MAKE-3PILE ?auto_25112 ?auto_25113 ?auto_25114 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25119 - BLOCK
    )
    :vars
    (
      ?auto_25120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25120 ?auto_25119 ) ( CLEAR ?auto_25120 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25119 ) ( not ( = ?auto_25119 ?auto_25120 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25120 ?auto_25119 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25121 - BLOCK
    )
    :vars
    (
      ?auto_25122 - BLOCK
      ?auto_25123 - BLOCK
      ?auto_25124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25122 ?auto_25121 ) ( CLEAR ?auto_25122 ) ( ON-TABLE ?auto_25121 ) ( not ( = ?auto_25121 ?auto_25122 ) ) ( HOLDING ?auto_25123 ) ( CLEAR ?auto_25124 ) ( not ( = ?auto_25121 ?auto_25123 ) ) ( not ( = ?auto_25121 ?auto_25124 ) ) ( not ( = ?auto_25122 ?auto_25123 ) ) ( not ( = ?auto_25122 ?auto_25124 ) ) ( not ( = ?auto_25123 ?auto_25124 ) ) )
    :subtasks
    ( ( !STACK ?auto_25123 ?auto_25124 )
      ( MAKE-1PILE ?auto_25121 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25125 - BLOCK
    )
    :vars
    (
      ?auto_25127 - BLOCK
      ?auto_25128 - BLOCK
      ?auto_25126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25127 ?auto_25125 ) ( ON-TABLE ?auto_25125 ) ( not ( = ?auto_25125 ?auto_25127 ) ) ( CLEAR ?auto_25128 ) ( not ( = ?auto_25125 ?auto_25126 ) ) ( not ( = ?auto_25125 ?auto_25128 ) ) ( not ( = ?auto_25127 ?auto_25126 ) ) ( not ( = ?auto_25127 ?auto_25128 ) ) ( not ( = ?auto_25126 ?auto_25128 ) ) ( ON ?auto_25126 ?auto_25127 ) ( CLEAR ?auto_25126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25125 ?auto_25127 )
      ( MAKE-1PILE ?auto_25125 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25129 - BLOCK
    )
    :vars
    (
      ?auto_25130 - BLOCK
      ?auto_25131 - BLOCK
      ?auto_25132 - BLOCK
      ?auto_25133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25130 ?auto_25129 ) ( ON-TABLE ?auto_25129 ) ( not ( = ?auto_25129 ?auto_25130 ) ) ( not ( = ?auto_25129 ?auto_25131 ) ) ( not ( = ?auto_25129 ?auto_25132 ) ) ( not ( = ?auto_25130 ?auto_25131 ) ) ( not ( = ?auto_25130 ?auto_25132 ) ) ( not ( = ?auto_25131 ?auto_25132 ) ) ( ON ?auto_25131 ?auto_25130 ) ( CLEAR ?auto_25131 ) ( HOLDING ?auto_25132 ) ( CLEAR ?auto_25133 ) ( ON-TABLE ?auto_25133 ) ( not ( = ?auto_25133 ?auto_25132 ) ) ( not ( = ?auto_25129 ?auto_25133 ) ) ( not ( = ?auto_25130 ?auto_25133 ) ) ( not ( = ?auto_25131 ?auto_25133 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25133 ?auto_25132 )
      ( MAKE-1PILE ?auto_25129 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25134 - BLOCK
    )
    :vars
    (
      ?auto_25137 - BLOCK
      ?auto_25135 - BLOCK
      ?auto_25136 - BLOCK
      ?auto_25138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25137 ?auto_25134 ) ( ON-TABLE ?auto_25134 ) ( not ( = ?auto_25134 ?auto_25137 ) ) ( not ( = ?auto_25134 ?auto_25135 ) ) ( not ( = ?auto_25134 ?auto_25136 ) ) ( not ( = ?auto_25137 ?auto_25135 ) ) ( not ( = ?auto_25137 ?auto_25136 ) ) ( not ( = ?auto_25135 ?auto_25136 ) ) ( ON ?auto_25135 ?auto_25137 ) ( CLEAR ?auto_25138 ) ( ON-TABLE ?auto_25138 ) ( not ( = ?auto_25138 ?auto_25136 ) ) ( not ( = ?auto_25134 ?auto_25138 ) ) ( not ( = ?auto_25137 ?auto_25138 ) ) ( not ( = ?auto_25135 ?auto_25138 ) ) ( ON ?auto_25136 ?auto_25135 ) ( CLEAR ?auto_25136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25134 ?auto_25137 ?auto_25135 )
      ( MAKE-1PILE ?auto_25134 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25139 - BLOCK
    )
    :vars
    (
      ?auto_25141 - BLOCK
      ?auto_25140 - BLOCK
      ?auto_25143 - BLOCK
      ?auto_25142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25141 ?auto_25139 ) ( ON-TABLE ?auto_25139 ) ( not ( = ?auto_25139 ?auto_25141 ) ) ( not ( = ?auto_25139 ?auto_25140 ) ) ( not ( = ?auto_25139 ?auto_25143 ) ) ( not ( = ?auto_25141 ?auto_25140 ) ) ( not ( = ?auto_25141 ?auto_25143 ) ) ( not ( = ?auto_25140 ?auto_25143 ) ) ( ON ?auto_25140 ?auto_25141 ) ( not ( = ?auto_25142 ?auto_25143 ) ) ( not ( = ?auto_25139 ?auto_25142 ) ) ( not ( = ?auto_25141 ?auto_25142 ) ) ( not ( = ?auto_25140 ?auto_25142 ) ) ( ON ?auto_25143 ?auto_25140 ) ( CLEAR ?auto_25143 ) ( HOLDING ?auto_25142 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25142 )
      ( MAKE-1PILE ?auto_25139 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25144 - BLOCK
    )
    :vars
    (
      ?auto_25146 - BLOCK
      ?auto_25145 - BLOCK
      ?auto_25148 - BLOCK
      ?auto_25147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25146 ?auto_25144 ) ( ON-TABLE ?auto_25144 ) ( not ( = ?auto_25144 ?auto_25146 ) ) ( not ( = ?auto_25144 ?auto_25145 ) ) ( not ( = ?auto_25144 ?auto_25148 ) ) ( not ( = ?auto_25146 ?auto_25145 ) ) ( not ( = ?auto_25146 ?auto_25148 ) ) ( not ( = ?auto_25145 ?auto_25148 ) ) ( ON ?auto_25145 ?auto_25146 ) ( not ( = ?auto_25147 ?auto_25148 ) ) ( not ( = ?auto_25144 ?auto_25147 ) ) ( not ( = ?auto_25146 ?auto_25147 ) ) ( not ( = ?auto_25145 ?auto_25147 ) ) ( ON ?auto_25148 ?auto_25145 ) ( ON ?auto_25147 ?auto_25148 ) ( CLEAR ?auto_25147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25144 ?auto_25146 ?auto_25145 ?auto_25148 )
      ( MAKE-1PILE ?auto_25144 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25149 - BLOCK
    )
    :vars
    (
      ?auto_25153 - BLOCK
      ?auto_25152 - BLOCK
      ?auto_25151 - BLOCK
      ?auto_25150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25153 ?auto_25149 ) ( ON-TABLE ?auto_25149 ) ( not ( = ?auto_25149 ?auto_25153 ) ) ( not ( = ?auto_25149 ?auto_25152 ) ) ( not ( = ?auto_25149 ?auto_25151 ) ) ( not ( = ?auto_25153 ?auto_25152 ) ) ( not ( = ?auto_25153 ?auto_25151 ) ) ( not ( = ?auto_25152 ?auto_25151 ) ) ( ON ?auto_25152 ?auto_25153 ) ( not ( = ?auto_25150 ?auto_25151 ) ) ( not ( = ?auto_25149 ?auto_25150 ) ) ( not ( = ?auto_25153 ?auto_25150 ) ) ( not ( = ?auto_25152 ?auto_25150 ) ) ( ON ?auto_25151 ?auto_25152 ) ( HOLDING ?auto_25150 ) ( CLEAR ?auto_25151 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25149 ?auto_25153 ?auto_25152 ?auto_25151 ?auto_25150 )
      ( MAKE-1PILE ?auto_25149 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25154 - BLOCK
    )
    :vars
    (
      ?auto_25157 - BLOCK
      ?auto_25155 - BLOCK
      ?auto_25156 - BLOCK
      ?auto_25158 - BLOCK
      ?auto_25159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25157 ?auto_25154 ) ( ON-TABLE ?auto_25154 ) ( not ( = ?auto_25154 ?auto_25157 ) ) ( not ( = ?auto_25154 ?auto_25155 ) ) ( not ( = ?auto_25154 ?auto_25156 ) ) ( not ( = ?auto_25157 ?auto_25155 ) ) ( not ( = ?auto_25157 ?auto_25156 ) ) ( not ( = ?auto_25155 ?auto_25156 ) ) ( ON ?auto_25155 ?auto_25157 ) ( not ( = ?auto_25158 ?auto_25156 ) ) ( not ( = ?auto_25154 ?auto_25158 ) ) ( not ( = ?auto_25157 ?auto_25158 ) ) ( not ( = ?auto_25155 ?auto_25158 ) ) ( ON ?auto_25156 ?auto_25155 ) ( CLEAR ?auto_25156 ) ( ON ?auto_25158 ?auto_25159 ) ( CLEAR ?auto_25158 ) ( HAND-EMPTY ) ( not ( = ?auto_25154 ?auto_25159 ) ) ( not ( = ?auto_25157 ?auto_25159 ) ) ( not ( = ?auto_25155 ?auto_25159 ) ) ( not ( = ?auto_25156 ?auto_25159 ) ) ( not ( = ?auto_25158 ?auto_25159 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25158 ?auto_25159 )
      ( MAKE-1PILE ?auto_25154 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25160 - BLOCK
    )
    :vars
    (
      ?auto_25161 - BLOCK
      ?auto_25165 - BLOCK
      ?auto_25162 - BLOCK
      ?auto_25163 - BLOCK
      ?auto_25164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25161 ?auto_25160 ) ( ON-TABLE ?auto_25160 ) ( not ( = ?auto_25160 ?auto_25161 ) ) ( not ( = ?auto_25160 ?auto_25165 ) ) ( not ( = ?auto_25160 ?auto_25162 ) ) ( not ( = ?auto_25161 ?auto_25165 ) ) ( not ( = ?auto_25161 ?auto_25162 ) ) ( not ( = ?auto_25165 ?auto_25162 ) ) ( ON ?auto_25165 ?auto_25161 ) ( not ( = ?auto_25163 ?auto_25162 ) ) ( not ( = ?auto_25160 ?auto_25163 ) ) ( not ( = ?auto_25161 ?auto_25163 ) ) ( not ( = ?auto_25165 ?auto_25163 ) ) ( ON ?auto_25163 ?auto_25164 ) ( CLEAR ?auto_25163 ) ( not ( = ?auto_25160 ?auto_25164 ) ) ( not ( = ?auto_25161 ?auto_25164 ) ) ( not ( = ?auto_25165 ?auto_25164 ) ) ( not ( = ?auto_25162 ?auto_25164 ) ) ( not ( = ?auto_25163 ?auto_25164 ) ) ( HOLDING ?auto_25162 ) ( CLEAR ?auto_25165 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25160 ?auto_25161 ?auto_25165 ?auto_25162 )
      ( MAKE-1PILE ?auto_25160 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25166 - BLOCK
    )
    :vars
    (
      ?auto_25167 - BLOCK
      ?auto_25171 - BLOCK
      ?auto_25168 - BLOCK
      ?auto_25169 - BLOCK
      ?auto_25170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25167 ?auto_25166 ) ( ON-TABLE ?auto_25166 ) ( not ( = ?auto_25166 ?auto_25167 ) ) ( not ( = ?auto_25166 ?auto_25171 ) ) ( not ( = ?auto_25166 ?auto_25168 ) ) ( not ( = ?auto_25167 ?auto_25171 ) ) ( not ( = ?auto_25167 ?auto_25168 ) ) ( not ( = ?auto_25171 ?auto_25168 ) ) ( ON ?auto_25171 ?auto_25167 ) ( not ( = ?auto_25169 ?auto_25168 ) ) ( not ( = ?auto_25166 ?auto_25169 ) ) ( not ( = ?auto_25167 ?auto_25169 ) ) ( not ( = ?auto_25171 ?auto_25169 ) ) ( ON ?auto_25169 ?auto_25170 ) ( not ( = ?auto_25166 ?auto_25170 ) ) ( not ( = ?auto_25167 ?auto_25170 ) ) ( not ( = ?auto_25171 ?auto_25170 ) ) ( not ( = ?auto_25168 ?auto_25170 ) ) ( not ( = ?auto_25169 ?auto_25170 ) ) ( CLEAR ?auto_25171 ) ( ON ?auto_25168 ?auto_25169 ) ( CLEAR ?auto_25168 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25170 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25170 ?auto_25169 )
      ( MAKE-1PILE ?auto_25166 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25172 - BLOCK
    )
    :vars
    (
      ?auto_25173 - BLOCK
      ?auto_25174 - BLOCK
      ?auto_25176 - BLOCK
      ?auto_25177 - BLOCK
      ?auto_25175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25173 ?auto_25172 ) ( ON-TABLE ?auto_25172 ) ( not ( = ?auto_25172 ?auto_25173 ) ) ( not ( = ?auto_25172 ?auto_25174 ) ) ( not ( = ?auto_25172 ?auto_25176 ) ) ( not ( = ?auto_25173 ?auto_25174 ) ) ( not ( = ?auto_25173 ?auto_25176 ) ) ( not ( = ?auto_25174 ?auto_25176 ) ) ( not ( = ?auto_25177 ?auto_25176 ) ) ( not ( = ?auto_25172 ?auto_25177 ) ) ( not ( = ?auto_25173 ?auto_25177 ) ) ( not ( = ?auto_25174 ?auto_25177 ) ) ( ON ?auto_25177 ?auto_25175 ) ( not ( = ?auto_25172 ?auto_25175 ) ) ( not ( = ?auto_25173 ?auto_25175 ) ) ( not ( = ?auto_25174 ?auto_25175 ) ) ( not ( = ?auto_25176 ?auto_25175 ) ) ( not ( = ?auto_25177 ?auto_25175 ) ) ( ON ?auto_25176 ?auto_25177 ) ( CLEAR ?auto_25176 ) ( ON-TABLE ?auto_25175 ) ( HOLDING ?auto_25174 ) ( CLEAR ?auto_25173 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25172 ?auto_25173 ?auto_25174 )
      ( MAKE-1PILE ?auto_25172 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25178 - BLOCK
    )
    :vars
    (
      ?auto_25179 - BLOCK
      ?auto_25181 - BLOCK
      ?auto_25180 - BLOCK
      ?auto_25183 - BLOCK
      ?auto_25182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25179 ?auto_25178 ) ( ON-TABLE ?auto_25178 ) ( not ( = ?auto_25178 ?auto_25179 ) ) ( not ( = ?auto_25178 ?auto_25181 ) ) ( not ( = ?auto_25178 ?auto_25180 ) ) ( not ( = ?auto_25179 ?auto_25181 ) ) ( not ( = ?auto_25179 ?auto_25180 ) ) ( not ( = ?auto_25181 ?auto_25180 ) ) ( not ( = ?auto_25183 ?auto_25180 ) ) ( not ( = ?auto_25178 ?auto_25183 ) ) ( not ( = ?auto_25179 ?auto_25183 ) ) ( not ( = ?auto_25181 ?auto_25183 ) ) ( ON ?auto_25183 ?auto_25182 ) ( not ( = ?auto_25178 ?auto_25182 ) ) ( not ( = ?auto_25179 ?auto_25182 ) ) ( not ( = ?auto_25181 ?auto_25182 ) ) ( not ( = ?auto_25180 ?auto_25182 ) ) ( not ( = ?auto_25183 ?auto_25182 ) ) ( ON ?auto_25180 ?auto_25183 ) ( ON-TABLE ?auto_25182 ) ( CLEAR ?auto_25179 ) ( ON ?auto_25181 ?auto_25180 ) ( CLEAR ?auto_25181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25182 ?auto_25183 ?auto_25180 )
      ( MAKE-1PILE ?auto_25178 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25196 - BLOCK
    )
    :vars
    (
      ?auto_25201 - BLOCK
      ?auto_25198 - BLOCK
      ?auto_25199 - BLOCK
      ?auto_25200 - BLOCK
      ?auto_25197 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25196 ?auto_25201 ) ) ( not ( = ?auto_25196 ?auto_25198 ) ) ( not ( = ?auto_25196 ?auto_25199 ) ) ( not ( = ?auto_25201 ?auto_25198 ) ) ( not ( = ?auto_25201 ?auto_25199 ) ) ( not ( = ?auto_25198 ?auto_25199 ) ) ( not ( = ?auto_25200 ?auto_25199 ) ) ( not ( = ?auto_25196 ?auto_25200 ) ) ( not ( = ?auto_25201 ?auto_25200 ) ) ( not ( = ?auto_25198 ?auto_25200 ) ) ( ON ?auto_25200 ?auto_25197 ) ( not ( = ?auto_25196 ?auto_25197 ) ) ( not ( = ?auto_25201 ?auto_25197 ) ) ( not ( = ?auto_25198 ?auto_25197 ) ) ( not ( = ?auto_25199 ?auto_25197 ) ) ( not ( = ?auto_25200 ?auto_25197 ) ) ( ON ?auto_25199 ?auto_25200 ) ( ON-TABLE ?auto_25197 ) ( ON ?auto_25198 ?auto_25199 ) ( ON ?auto_25201 ?auto_25198 ) ( CLEAR ?auto_25201 ) ( HOLDING ?auto_25196 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25196 ?auto_25201 )
      ( MAKE-1PILE ?auto_25196 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25202 - BLOCK
    )
    :vars
    (
      ?auto_25206 - BLOCK
      ?auto_25207 - BLOCK
      ?auto_25203 - BLOCK
      ?auto_25205 - BLOCK
      ?auto_25204 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25202 ?auto_25206 ) ) ( not ( = ?auto_25202 ?auto_25207 ) ) ( not ( = ?auto_25202 ?auto_25203 ) ) ( not ( = ?auto_25206 ?auto_25207 ) ) ( not ( = ?auto_25206 ?auto_25203 ) ) ( not ( = ?auto_25207 ?auto_25203 ) ) ( not ( = ?auto_25205 ?auto_25203 ) ) ( not ( = ?auto_25202 ?auto_25205 ) ) ( not ( = ?auto_25206 ?auto_25205 ) ) ( not ( = ?auto_25207 ?auto_25205 ) ) ( ON ?auto_25205 ?auto_25204 ) ( not ( = ?auto_25202 ?auto_25204 ) ) ( not ( = ?auto_25206 ?auto_25204 ) ) ( not ( = ?auto_25207 ?auto_25204 ) ) ( not ( = ?auto_25203 ?auto_25204 ) ) ( not ( = ?auto_25205 ?auto_25204 ) ) ( ON ?auto_25203 ?auto_25205 ) ( ON-TABLE ?auto_25204 ) ( ON ?auto_25207 ?auto_25203 ) ( ON ?auto_25206 ?auto_25207 ) ( ON ?auto_25202 ?auto_25206 ) ( CLEAR ?auto_25202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25204 ?auto_25205 ?auto_25203 ?auto_25207 ?auto_25206 )
      ( MAKE-1PILE ?auto_25202 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25212 - BLOCK
      ?auto_25213 - BLOCK
      ?auto_25214 - BLOCK
      ?auto_25215 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_25215 ) ( CLEAR ?auto_25214 ) ( ON-TABLE ?auto_25212 ) ( ON ?auto_25213 ?auto_25212 ) ( ON ?auto_25214 ?auto_25213 ) ( not ( = ?auto_25212 ?auto_25213 ) ) ( not ( = ?auto_25212 ?auto_25214 ) ) ( not ( = ?auto_25212 ?auto_25215 ) ) ( not ( = ?auto_25213 ?auto_25214 ) ) ( not ( = ?auto_25213 ?auto_25215 ) ) ( not ( = ?auto_25214 ?auto_25215 ) ) )
    :subtasks
    ( ( !STACK ?auto_25215 ?auto_25214 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25216 - BLOCK
      ?auto_25217 - BLOCK
      ?auto_25218 - BLOCK
      ?auto_25219 - BLOCK
    )
    :vars
    (
      ?auto_25220 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25218 ) ( ON-TABLE ?auto_25216 ) ( ON ?auto_25217 ?auto_25216 ) ( ON ?auto_25218 ?auto_25217 ) ( not ( = ?auto_25216 ?auto_25217 ) ) ( not ( = ?auto_25216 ?auto_25218 ) ) ( not ( = ?auto_25216 ?auto_25219 ) ) ( not ( = ?auto_25217 ?auto_25218 ) ) ( not ( = ?auto_25217 ?auto_25219 ) ) ( not ( = ?auto_25218 ?auto_25219 ) ) ( ON ?auto_25219 ?auto_25220 ) ( CLEAR ?auto_25219 ) ( HAND-EMPTY ) ( not ( = ?auto_25216 ?auto_25220 ) ) ( not ( = ?auto_25217 ?auto_25220 ) ) ( not ( = ?auto_25218 ?auto_25220 ) ) ( not ( = ?auto_25219 ?auto_25220 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25219 ?auto_25220 )
      ( MAKE-4PILE ?auto_25216 ?auto_25217 ?auto_25218 ?auto_25219 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25221 - BLOCK
      ?auto_25222 - BLOCK
      ?auto_25223 - BLOCK
      ?auto_25224 - BLOCK
    )
    :vars
    (
      ?auto_25225 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25221 ) ( ON ?auto_25222 ?auto_25221 ) ( not ( = ?auto_25221 ?auto_25222 ) ) ( not ( = ?auto_25221 ?auto_25223 ) ) ( not ( = ?auto_25221 ?auto_25224 ) ) ( not ( = ?auto_25222 ?auto_25223 ) ) ( not ( = ?auto_25222 ?auto_25224 ) ) ( not ( = ?auto_25223 ?auto_25224 ) ) ( ON ?auto_25224 ?auto_25225 ) ( CLEAR ?auto_25224 ) ( not ( = ?auto_25221 ?auto_25225 ) ) ( not ( = ?auto_25222 ?auto_25225 ) ) ( not ( = ?auto_25223 ?auto_25225 ) ) ( not ( = ?auto_25224 ?auto_25225 ) ) ( HOLDING ?auto_25223 ) ( CLEAR ?auto_25222 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25221 ?auto_25222 ?auto_25223 )
      ( MAKE-4PILE ?auto_25221 ?auto_25222 ?auto_25223 ?auto_25224 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25226 - BLOCK
      ?auto_25227 - BLOCK
      ?auto_25228 - BLOCK
      ?auto_25229 - BLOCK
    )
    :vars
    (
      ?auto_25230 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25226 ) ( ON ?auto_25227 ?auto_25226 ) ( not ( = ?auto_25226 ?auto_25227 ) ) ( not ( = ?auto_25226 ?auto_25228 ) ) ( not ( = ?auto_25226 ?auto_25229 ) ) ( not ( = ?auto_25227 ?auto_25228 ) ) ( not ( = ?auto_25227 ?auto_25229 ) ) ( not ( = ?auto_25228 ?auto_25229 ) ) ( ON ?auto_25229 ?auto_25230 ) ( not ( = ?auto_25226 ?auto_25230 ) ) ( not ( = ?auto_25227 ?auto_25230 ) ) ( not ( = ?auto_25228 ?auto_25230 ) ) ( not ( = ?auto_25229 ?auto_25230 ) ) ( CLEAR ?auto_25227 ) ( ON ?auto_25228 ?auto_25229 ) ( CLEAR ?auto_25228 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25230 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25230 ?auto_25229 )
      ( MAKE-4PILE ?auto_25226 ?auto_25227 ?auto_25228 ?auto_25229 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25231 - BLOCK
      ?auto_25232 - BLOCK
      ?auto_25233 - BLOCK
      ?auto_25234 - BLOCK
    )
    :vars
    (
      ?auto_25235 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25231 ) ( not ( = ?auto_25231 ?auto_25232 ) ) ( not ( = ?auto_25231 ?auto_25233 ) ) ( not ( = ?auto_25231 ?auto_25234 ) ) ( not ( = ?auto_25232 ?auto_25233 ) ) ( not ( = ?auto_25232 ?auto_25234 ) ) ( not ( = ?auto_25233 ?auto_25234 ) ) ( ON ?auto_25234 ?auto_25235 ) ( not ( = ?auto_25231 ?auto_25235 ) ) ( not ( = ?auto_25232 ?auto_25235 ) ) ( not ( = ?auto_25233 ?auto_25235 ) ) ( not ( = ?auto_25234 ?auto_25235 ) ) ( ON ?auto_25233 ?auto_25234 ) ( CLEAR ?auto_25233 ) ( ON-TABLE ?auto_25235 ) ( HOLDING ?auto_25232 ) ( CLEAR ?auto_25231 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25231 ?auto_25232 )
      ( MAKE-4PILE ?auto_25231 ?auto_25232 ?auto_25233 ?auto_25234 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25236 - BLOCK
      ?auto_25237 - BLOCK
      ?auto_25238 - BLOCK
      ?auto_25239 - BLOCK
    )
    :vars
    (
      ?auto_25240 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25236 ) ( not ( = ?auto_25236 ?auto_25237 ) ) ( not ( = ?auto_25236 ?auto_25238 ) ) ( not ( = ?auto_25236 ?auto_25239 ) ) ( not ( = ?auto_25237 ?auto_25238 ) ) ( not ( = ?auto_25237 ?auto_25239 ) ) ( not ( = ?auto_25238 ?auto_25239 ) ) ( ON ?auto_25239 ?auto_25240 ) ( not ( = ?auto_25236 ?auto_25240 ) ) ( not ( = ?auto_25237 ?auto_25240 ) ) ( not ( = ?auto_25238 ?auto_25240 ) ) ( not ( = ?auto_25239 ?auto_25240 ) ) ( ON ?auto_25238 ?auto_25239 ) ( ON-TABLE ?auto_25240 ) ( CLEAR ?auto_25236 ) ( ON ?auto_25237 ?auto_25238 ) ( CLEAR ?auto_25237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25240 ?auto_25239 ?auto_25238 )
      ( MAKE-4PILE ?auto_25236 ?auto_25237 ?auto_25238 ?auto_25239 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25241 - BLOCK
      ?auto_25242 - BLOCK
      ?auto_25243 - BLOCK
      ?auto_25244 - BLOCK
    )
    :vars
    (
      ?auto_25245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25241 ?auto_25242 ) ) ( not ( = ?auto_25241 ?auto_25243 ) ) ( not ( = ?auto_25241 ?auto_25244 ) ) ( not ( = ?auto_25242 ?auto_25243 ) ) ( not ( = ?auto_25242 ?auto_25244 ) ) ( not ( = ?auto_25243 ?auto_25244 ) ) ( ON ?auto_25244 ?auto_25245 ) ( not ( = ?auto_25241 ?auto_25245 ) ) ( not ( = ?auto_25242 ?auto_25245 ) ) ( not ( = ?auto_25243 ?auto_25245 ) ) ( not ( = ?auto_25244 ?auto_25245 ) ) ( ON ?auto_25243 ?auto_25244 ) ( ON-TABLE ?auto_25245 ) ( ON ?auto_25242 ?auto_25243 ) ( CLEAR ?auto_25242 ) ( HOLDING ?auto_25241 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25241 )
      ( MAKE-4PILE ?auto_25241 ?auto_25242 ?auto_25243 ?auto_25244 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25246 - BLOCK
      ?auto_25247 - BLOCK
      ?auto_25248 - BLOCK
      ?auto_25249 - BLOCK
    )
    :vars
    (
      ?auto_25250 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25246 ?auto_25247 ) ) ( not ( = ?auto_25246 ?auto_25248 ) ) ( not ( = ?auto_25246 ?auto_25249 ) ) ( not ( = ?auto_25247 ?auto_25248 ) ) ( not ( = ?auto_25247 ?auto_25249 ) ) ( not ( = ?auto_25248 ?auto_25249 ) ) ( ON ?auto_25249 ?auto_25250 ) ( not ( = ?auto_25246 ?auto_25250 ) ) ( not ( = ?auto_25247 ?auto_25250 ) ) ( not ( = ?auto_25248 ?auto_25250 ) ) ( not ( = ?auto_25249 ?auto_25250 ) ) ( ON ?auto_25248 ?auto_25249 ) ( ON-TABLE ?auto_25250 ) ( ON ?auto_25247 ?auto_25248 ) ( ON ?auto_25246 ?auto_25247 ) ( CLEAR ?auto_25246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25250 ?auto_25249 ?auto_25248 ?auto_25247 )
      ( MAKE-4PILE ?auto_25246 ?auto_25247 ?auto_25248 ?auto_25249 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25251 - BLOCK
      ?auto_25252 - BLOCK
      ?auto_25253 - BLOCK
      ?auto_25254 - BLOCK
    )
    :vars
    (
      ?auto_25255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25251 ?auto_25252 ) ) ( not ( = ?auto_25251 ?auto_25253 ) ) ( not ( = ?auto_25251 ?auto_25254 ) ) ( not ( = ?auto_25252 ?auto_25253 ) ) ( not ( = ?auto_25252 ?auto_25254 ) ) ( not ( = ?auto_25253 ?auto_25254 ) ) ( ON ?auto_25254 ?auto_25255 ) ( not ( = ?auto_25251 ?auto_25255 ) ) ( not ( = ?auto_25252 ?auto_25255 ) ) ( not ( = ?auto_25253 ?auto_25255 ) ) ( not ( = ?auto_25254 ?auto_25255 ) ) ( ON ?auto_25253 ?auto_25254 ) ( ON-TABLE ?auto_25255 ) ( ON ?auto_25252 ?auto_25253 ) ( HOLDING ?auto_25251 ) ( CLEAR ?auto_25252 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25255 ?auto_25254 ?auto_25253 ?auto_25252 ?auto_25251 )
      ( MAKE-4PILE ?auto_25251 ?auto_25252 ?auto_25253 ?auto_25254 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25256 - BLOCK
      ?auto_25257 - BLOCK
      ?auto_25258 - BLOCK
      ?auto_25259 - BLOCK
    )
    :vars
    (
      ?auto_25260 - BLOCK
      ?auto_25261 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25256 ?auto_25257 ) ) ( not ( = ?auto_25256 ?auto_25258 ) ) ( not ( = ?auto_25256 ?auto_25259 ) ) ( not ( = ?auto_25257 ?auto_25258 ) ) ( not ( = ?auto_25257 ?auto_25259 ) ) ( not ( = ?auto_25258 ?auto_25259 ) ) ( ON ?auto_25259 ?auto_25260 ) ( not ( = ?auto_25256 ?auto_25260 ) ) ( not ( = ?auto_25257 ?auto_25260 ) ) ( not ( = ?auto_25258 ?auto_25260 ) ) ( not ( = ?auto_25259 ?auto_25260 ) ) ( ON ?auto_25258 ?auto_25259 ) ( ON-TABLE ?auto_25260 ) ( ON ?auto_25257 ?auto_25258 ) ( CLEAR ?auto_25257 ) ( ON ?auto_25256 ?auto_25261 ) ( CLEAR ?auto_25256 ) ( HAND-EMPTY ) ( not ( = ?auto_25256 ?auto_25261 ) ) ( not ( = ?auto_25257 ?auto_25261 ) ) ( not ( = ?auto_25258 ?auto_25261 ) ) ( not ( = ?auto_25259 ?auto_25261 ) ) ( not ( = ?auto_25260 ?auto_25261 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25256 ?auto_25261 )
      ( MAKE-4PILE ?auto_25256 ?auto_25257 ?auto_25258 ?auto_25259 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25262 - BLOCK
      ?auto_25263 - BLOCK
      ?auto_25264 - BLOCK
      ?auto_25265 - BLOCK
    )
    :vars
    (
      ?auto_25267 - BLOCK
      ?auto_25266 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25262 ?auto_25263 ) ) ( not ( = ?auto_25262 ?auto_25264 ) ) ( not ( = ?auto_25262 ?auto_25265 ) ) ( not ( = ?auto_25263 ?auto_25264 ) ) ( not ( = ?auto_25263 ?auto_25265 ) ) ( not ( = ?auto_25264 ?auto_25265 ) ) ( ON ?auto_25265 ?auto_25267 ) ( not ( = ?auto_25262 ?auto_25267 ) ) ( not ( = ?auto_25263 ?auto_25267 ) ) ( not ( = ?auto_25264 ?auto_25267 ) ) ( not ( = ?auto_25265 ?auto_25267 ) ) ( ON ?auto_25264 ?auto_25265 ) ( ON-TABLE ?auto_25267 ) ( ON ?auto_25262 ?auto_25266 ) ( CLEAR ?auto_25262 ) ( not ( = ?auto_25262 ?auto_25266 ) ) ( not ( = ?auto_25263 ?auto_25266 ) ) ( not ( = ?auto_25264 ?auto_25266 ) ) ( not ( = ?auto_25265 ?auto_25266 ) ) ( not ( = ?auto_25267 ?auto_25266 ) ) ( HOLDING ?auto_25263 ) ( CLEAR ?auto_25264 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25267 ?auto_25265 ?auto_25264 ?auto_25263 )
      ( MAKE-4PILE ?auto_25262 ?auto_25263 ?auto_25264 ?auto_25265 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25268 - BLOCK
      ?auto_25269 - BLOCK
      ?auto_25270 - BLOCK
      ?auto_25271 - BLOCK
    )
    :vars
    (
      ?auto_25273 - BLOCK
      ?auto_25272 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25268 ?auto_25269 ) ) ( not ( = ?auto_25268 ?auto_25270 ) ) ( not ( = ?auto_25268 ?auto_25271 ) ) ( not ( = ?auto_25269 ?auto_25270 ) ) ( not ( = ?auto_25269 ?auto_25271 ) ) ( not ( = ?auto_25270 ?auto_25271 ) ) ( ON ?auto_25271 ?auto_25273 ) ( not ( = ?auto_25268 ?auto_25273 ) ) ( not ( = ?auto_25269 ?auto_25273 ) ) ( not ( = ?auto_25270 ?auto_25273 ) ) ( not ( = ?auto_25271 ?auto_25273 ) ) ( ON ?auto_25270 ?auto_25271 ) ( ON-TABLE ?auto_25273 ) ( ON ?auto_25268 ?auto_25272 ) ( not ( = ?auto_25268 ?auto_25272 ) ) ( not ( = ?auto_25269 ?auto_25272 ) ) ( not ( = ?auto_25270 ?auto_25272 ) ) ( not ( = ?auto_25271 ?auto_25272 ) ) ( not ( = ?auto_25273 ?auto_25272 ) ) ( CLEAR ?auto_25270 ) ( ON ?auto_25269 ?auto_25268 ) ( CLEAR ?auto_25269 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25272 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25272 ?auto_25268 )
      ( MAKE-4PILE ?auto_25268 ?auto_25269 ?auto_25270 ?auto_25271 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25274 - BLOCK
      ?auto_25275 - BLOCK
      ?auto_25276 - BLOCK
      ?auto_25277 - BLOCK
    )
    :vars
    (
      ?auto_25279 - BLOCK
      ?auto_25278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25274 ?auto_25275 ) ) ( not ( = ?auto_25274 ?auto_25276 ) ) ( not ( = ?auto_25274 ?auto_25277 ) ) ( not ( = ?auto_25275 ?auto_25276 ) ) ( not ( = ?auto_25275 ?auto_25277 ) ) ( not ( = ?auto_25276 ?auto_25277 ) ) ( ON ?auto_25277 ?auto_25279 ) ( not ( = ?auto_25274 ?auto_25279 ) ) ( not ( = ?auto_25275 ?auto_25279 ) ) ( not ( = ?auto_25276 ?auto_25279 ) ) ( not ( = ?auto_25277 ?auto_25279 ) ) ( ON-TABLE ?auto_25279 ) ( ON ?auto_25274 ?auto_25278 ) ( not ( = ?auto_25274 ?auto_25278 ) ) ( not ( = ?auto_25275 ?auto_25278 ) ) ( not ( = ?auto_25276 ?auto_25278 ) ) ( not ( = ?auto_25277 ?auto_25278 ) ) ( not ( = ?auto_25279 ?auto_25278 ) ) ( ON ?auto_25275 ?auto_25274 ) ( CLEAR ?auto_25275 ) ( ON-TABLE ?auto_25278 ) ( HOLDING ?auto_25276 ) ( CLEAR ?auto_25277 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25279 ?auto_25277 ?auto_25276 )
      ( MAKE-4PILE ?auto_25274 ?auto_25275 ?auto_25276 ?auto_25277 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25280 - BLOCK
      ?auto_25281 - BLOCK
      ?auto_25282 - BLOCK
      ?auto_25283 - BLOCK
    )
    :vars
    (
      ?auto_25284 - BLOCK
      ?auto_25285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25280 ?auto_25281 ) ) ( not ( = ?auto_25280 ?auto_25282 ) ) ( not ( = ?auto_25280 ?auto_25283 ) ) ( not ( = ?auto_25281 ?auto_25282 ) ) ( not ( = ?auto_25281 ?auto_25283 ) ) ( not ( = ?auto_25282 ?auto_25283 ) ) ( ON ?auto_25283 ?auto_25284 ) ( not ( = ?auto_25280 ?auto_25284 ) ) ( not ( = ?auto_25281 ?auto_25284 ) ) ( not ( = ?auto_25282 ?auto_25284 ) ) ( not ( = ?auto_25283 ?auto_25284 ) ) ( ON-TABLE ?auto_25284 ) ( ON ?auto_25280 ?auto_25285 ) ( not ( = ?auto_25280 ?auto_25285 ) ) ( not ( = ?auto_25281 ?auto_25285 ) ) ( not ( = ?auto_25282 ?auto_25285 ) ) ( not ( = ?auto_25283 ?auto_25285 ) ) ( not ( = ?auto_25284 ?auto_25285 ) ) ( ON ?auto_25281 ?auto_25280 ) ( ON-TABLE ?auto_25285 ) ( CLEAR ?auto_25283 ) ( ON ?auto_25282 ?auto_25281 ) ( CLEAR ?auto_25282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25285 ?auto_25280 ?auto_25281 )
      ( MAKE-4PILE ?auto_25280 ?auto_25281 ?auto_25282 ?auto_25283 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25286 - BLOCK
      ?auto_25287 - BLOCK
      ?auto_25288 - BLOCK
      ?auto_25289 - BLOCK
    )
    :vars
    (
      ?auto_25291 - BLOCK
      ?auto_25290 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25286 ?auto_25287 ) ) ( not ( = ?auto_25286 ?auto_25288 ) ) ( not ( = ?auto_25286 ?auto_25289 ) ) ( not ( = ?auto_25287 ?auto_25288 ) ) ( not ( = ?auto_25287 ?auto_25289 ) ) ( not ( = ?auto_25288 ?auto_25289 ) ) ( not ( = ?auto_25286 ?auto_25291 ) ) ( not ( = ?auto_25287 ?auto_25291 ) ) ( not ( = ?auto_25288 ?auto_25291 ) ) ( not ( = ?auto_25289 ?auto_25291 ) ) ( ON-TABLE ?auto_25291 ) ( ON ?auto_25286 ?auto_25290 ) ( not ( = ?auto_25286 ?auto_25290 ) ) ( not ( = ?auto_25287 ?auto_25290 ) ) ( not ( = ?auto_25288 ?auto_25290 ) ) ( not ( = ?auto_25289 ?auto_25290 ) ) ( not ( = ?auto_25291 ?auto_25290 ) ) ( ON ?auto_25287 ?auto_25286 ) ( ON-TABLE ?auto_25290 ) ( ON ?auto_25288 ?auto_25287 ) ( CLEAR ?auto_25288 ) ( HOLDING ?auto_25289 ) ( CLEAR ?auto_25291 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25291 ?auto_25289 )
      ( MAKE-4PILE ?auto_25286 ?auto_25287 ?auto_25288 ?auto_25289 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25292 - BLOCK
      ?auto_25293 - BLOCK
      ?auto_25294 - BLOCK
      ?auto_25295 - BLOCK
    )
    :vars
    (
      ?auto_25297 - BLOCK
      ?auto_25296 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25292 ?auto_25293 ) ) ( not ( = ?auto_25292 ?auto_25294 ) ) ( not ( = ?auto_25292 ?auto_25295 ) ) ( not ( = ?auto_25293 ?auto_25294 ) ) ( not ( = ?auto_25293 ?auto_25295 ) ) ( not ( = ?auto_25294 ?auto_25295 ) ) ( not ( = ?auto_25292 ?auto_25297 ) ) ( not ( = ?auto_25293 ?auto_25297 ) ) ( not ( = ?auto_25294 ?auto_25297 ) ) ( not ( = ?auto_25295 ?auto_25297 ) ) ( ON-TABLE ?auto_25297 ) ( ON ?auto_25292 ?auto_25296 ) ( not ( = ?auto_25292 ?auto_25296 ) ) ( not ( = ?auto_25293 ?auto_25296 ) ) ( not ( = ?auto_25294 ?auto_25296 ) ) ( not ( = ?auto_25295 ?auto_25296 ) ) ( not ( = ?auto_25297 ?auto_25296 ) ) ( ON ?auto_25293 ?auto_25292 ) ( ON-TABLE ?auto_25296 ) ( ON ?auto_25294 ?auto_25293 ) ( CLEAR ?auto_25297 ) ( ON ?auto_25295 ?auto_25294 ) ( CLEAR ?auto_25295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25296 ?auto_25292 ?auto_25293 ?auto_25294 )
      ( MAKE-4PILE ?auto_25292 ?auto_25293 ?auto_25294 ?auto_25295 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25298 - BLOCK
      ?auto_25299 - BLOCK
      ?auto_25300 - BLOCK
      ?auto_25301 - BLOCK
    )
    :vars
    (
      ?auto_25303 - BLOCK
      ?auto_25302 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25298 ?auto_25299 ) ) ( not ( = ?auto_25298 ?auto_25300 ) ) ( not ( = ?auto_25298 ?auto_25301 ) ) ( not ( = ?auto_25299 ?auto_25300 ) ) ( not ( = ?auto_25299 ?auto_25301 ) ) ( not ( = ?auto_25300 ?auto_25301 ) ) ( not ( = ?auto_25298 ?auto_25303 ) ) ( not ( = ?auto_25299 ?auto_25303 ) ) ( not ( = ?auto_25300 ?auto_25303 ) ) ( not ( = ?auto_25301 ?auto_25303 ) ) ( ON ?auto_25298 ?auto_25302 ) ( not ( = ?auto_25298 ?auto_25302 ) ) ( not ( = ?auto_25299 ?auto_25302 ) ) ( not ( = ?auto_25300 ?auto_25302 ) ) ( not ( = ?auto_25301 ?auto_25302 ) ) ( not ( = ?auto_25303 ?auto_25302 ) ) ( ON ?auto_25299 ?auto_25298 ) ( ON-TABLE ?auto_25302 ) ( ON ?auto_25300 ?auto_25299 ) ( ON ?auto_25301 ?auto_25300 ) ( CLEAR ?auto_25301 ) ( HOLDING ?auto_25303 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25303 )
      ( MAKE-4PILE ?auto_25298 ?auto_25299 ?auto_25300 ?auto_25301 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25304 - BLOCK
      ?auto_25305 - BLOCK
      ?auto_25306 - BLOCK
      ?auto_25307 - BLOCK
    )
    :vars
    (
      ?auto_25309 - BLOCK
      ?auto_25308 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25304 ?auto_25305 ) ) ( not ( = ?auto_25304 ?auto_25306 ) ) ( not ( = ?auto_25304 ?auto_25307 ) ) ( not ( = ?auto_25305 ?auto_25306 ) ) ( not ( = ?auto_25305 ?auto_25307 ) ) ( not ( = ?auto_25306 ?auto_25307 ) ) ( not ( = ?auto_25304 ?auto_25309 ) ) ( not ( = ?auto_25305 ?auto_25309 ) ) ( not ( = ?auto_25306 ?auto_25309 ) ) ( not ( = ?auto_25307 ?auto_25309 ) ) ( ON ?auto_25304 ?auto_25308 ) ( not ( = ?auto_25304 ?auto_25308 ) ) ( not ( = ?auto_25305 ?auto_25308 ) ) ( not ( = ?auto_25306 ?auto_25308 ) ) ( not ( = ?auto_25307 ?auto_25308 ) ) ( not ( = ?auto_25309 ?auto_25308 ) ) ( ON ?auto_25305 ?auto_25304 ) ( ON-TABLE ?auto_25308 ) ( ON ?auto_25306 ?auto_25305 ) ( ON ?auto_25307 ?auto_25306 ) ( ON ?auto_25309 ?auto_25307 ) ( CLEAR ?auto_25309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25308 ?auto_25304 ?auto_25305 ?auto_25306 ?auto_25307 )
      ( MAKE-4PILE ?auto_25304 ?auto_25305 ?auto_25306 ?auto_25307 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25315 - BLOCK
      ?auto_25316 - BLOCK
      ?auto_25317 - BLOCK
      ?auto_25318 - BLOCK
      ?auto_25319 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_25319 ) ( CLEAR ?auto_25318 ) ( ON-TABLE ?auto_25315 ) ( ON ?auto_25316 ?auto_25315 ) ( ON ?auto_25317 ?auto_25316 ) ( ON ?auto_25318 ?auto_25317 ) ( not ( = ?auto_25315 ?auto_25316 ) ) ( not ( = ?auto_25315 ?auto_25317 ) ) ( not ( = ?auto_25315 ?auto_25318 ) ) ( not ( = ?auto_25315 ?auto_25319 ) ) ( not ( = ?auto_25316 ?auto_25317 ) ) ( not ( = ?auto_25316 ?auto_25318 ) ) ( not ( = ?auto_25316 ?auto_25319 ) ) ( not ( = ?auto_25317 ?auto_25318 ) ) ( not ( = ?auto_25317 ?auto_25319 ) ) ( not ( = ?auto_25318 ?auto_25319 ) ) )
    :subtasks
    ( ( !STACK ?auto_25319 ?auto_25318 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25320 - BLOCK
      ?auto_25321 - BLOCK
      ?auto_25322 - BLOCK
      ?auto_25323 - BLOCK
      ?auto_25324 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25323 ) ( ON-TABLE ?auto_25320 ) ( ON ?auto_25321 ?auto_25320 ) ( ON ?auto_25322 ?auto_25321 ) ( ON ?auto_25323 ?auto_25322 ) ( not ( = ?auto_25320 ?auto_25321 ) ) ( not ( = ?auto_25320 ?auto_25322 ) ) ( not ( = ?auto_25320 ?auto_25323 ) ) ( not ( = ?auto_25320 ?auto_25324 ) ) ( not ( = ?auto_25321 ?auto_25322 ) ) ( not ( = ?auto_25321 ?auto_25323 ) ) ( not ( = ?auto_25321 ?auto_25324 ) ) ( not ( = ?auto_25322 ?auto_25323 ) ) ( not ( = ?auto_25322 ?auto_25324 ) ) ( not ( = ?auto_25323 ?auto_25324 ) ) ( ON-TABLE ?auto_25324 ) ( CLEAR ?auto_25324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_25324 )
      ( MAKE-5PILE ?auto_25320 ?auto_25321 ?auto_25322 ?auto_25323 ?auto_25324 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25325 - BLOCK
      ?auto_25326 - BLOCK
      ?auto_25327 - BLOCK
      ?auto_25328 - BLOCK
      ?auto_25329 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25325 ) ( ON ?auto_25326 ?auto_25325 ) ( ON ?auto_25327 ?auto_25326 ) ( not ( = ?auto_25325 ?auto_25326 ) ) ( not ( = ?auto_25325 ?auto_25327 ) ) ( not ( = ?auto_25325 ?auto_25328 ) ) ( not ( = ?auto_25325 ?auto_25329 ) ) ( not ( = ?auto_25326 ?auto_25327 ) ) ( not ( = ?auto_25326 ?auto_25328 ) ) ( not ( = ?auto_25326 ?auto_25329 ) ) ( not ( = ?auto_25327 ?auto_25328 ) ) ( not ( = ?auto_25327 ?auto_25329 ) ) ( not ( = ?auto_25328 ?auto_25329 ) ) ( ON-TABLE ?auto_25329 ) ( CLEAR ?auto_25329 ) ( HOLDING ?auto_25328 ) ( CLEAR ?auto_25327 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25325 ?auto_25326 ?auto_25327 ?auto_25328 )
      ( MAKE-5PILE ?auto_25325 ?auto_25326 ?auto_25327 ?auto_25328 ?auto_25329 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25330 - BLOCK
      ?auto_25331 - BLOCK
      ?auto_25332 - BLOCK
      ?auto_25333 - BLOCK
      ?auto_25334 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25330 ) ( ON ?auto_25331 ?auto_25330 ) ( ON ?auto_25332 ?auto_25331 ) ( not ( = ?auto_25330 ?auto_25331 ) ) ( not ( = ?auto_25330 ?auto_25332 ) ) ( not ( = ?auto_25330 ?auto_25333 ) ) ( not ( = ?auto_25330 ?auto_25334 ) ) ( not ( = ?auto_25331 ?auto_25332 ) ) ( not ( = ?auto_25331 ?auto_25333 ) ) ( not ( = ?auto_25331 ?auto_25334 ) ) ( not ( = ?auto_25332 ?auto_25333 ) ) ( not ( = ?auto_25332 ?auto_25334 ) ) ( not ( = ?auto_25333 ?auto_25334 ) ) ( ON-TABLE ?auto_25334 ) ( CLEAR ?auto_25332 ) ( ON ?auto_25333 ?auto_25334 ) ( CLEAR ?auto_25333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25334 )
      ( MAKE-5PILE ?auto_25330 ?auto_25331 ?auto_25332 ?auto_25333 ?auto_25334 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25335 - BLOCK
      ?auto_25336 - BLOCK
      ?auto_25337 - BLOCK
      ?auto_25338 - BLOCK
      ?auto_25339 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25335 ) ( ON ?auto_25336 ?auto_25335 ) ( not ( = ?auto_25335 ?auto_25336 ) ) ( not ( = ?auto_25335 ?auto_25337 ) ) ( not ( = ?auto_25335 ?auto_25338 ) ) ( not ( = ?auto_25335 ?auto_25339 ) ) ( not ( = ?auto_25336 ?auto_25337 ) ) ( not ( = ?auto_25336 ?auto_25338 ) ) ( not ( = ?auto_25336 ?auto_25339 ) ) ( not ( = ?auto_25337 ?auto_25338 ) ) ( not ( = ?auto_25337 ?auto_25339 ) ) ( not ( = ?auto_25338 ?auto_25339 ) ) ( ON-TABLE ?auto_25339 ) ( ON ?auto_25338 ?auto_25339 ) ( CLEAR ?auto_25338 ) ( HOLDING ?auto_25337 ) ( CLEAR ?auto_25336 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25335 ?auto_25336 ?auto_25337 )
      ( MAKE-5PILE ?auto_25335 ?auto_25336 ?auto_25337 ?auto_25338 ?auto_25339 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25340 - BLOCK
      ?auto_25341 - BLOCK
      ?auto_25342 - BLOCK
      ?auto_25343 - BLOCK
      ?auto_25344 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25340 ) ( ON ?auto_25341 ?auto_25340 ) ( not ( = ?auto_25340 ?auto_25341 ) ) ( not ( = ?auto_25340 ?auto_25342 ) ) ( not ( = ?auto_25340 ?auto_25343 ) ) ( not ( = ?auto_25340 ?auto_25344 ) ) ( not ( = ?auto_25341 ?auto_25342 ) ) ( not ( = ?auto_25341 ?auto_25343 ) ) ( not ( = ?auto_25341 ?auto_25344 ) ) ( not ( = ?auto_25342 ?auto_25343 ) ) ( not ( = ?auto_25342 ?auto_25344 ) ) ( not ( = ?auto_25343 ?auto_25344 ) ) ( ON-TABLE ?auto_25344 ) ( ON ?auto_25343 ?auto_25344 ) ( CLEAR ?auto_25341 ) ( ON ?auto_25342 ?auto_25343 ) ( CLEAR ?auto_25342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25344 ?auto_25343 )
      ( MAKE-5PILE ?auto_25340 ?auto_25341 ?auto_25342 ?auto_25343 ?auto_25344 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25345 - BLOCK
      ?auto_25346 - BLOCK
      ?auto_25347 - BLOCK
      ?auto_25348 - BLOCK
      ?auto_25349 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25345 ) ( not ( = ?auto_25345 ?auto_25346 ) ) ( not ( = ?auto_25345 ?auto_25347 ) ) ( not ( = ?auto_25345 ?auto_25348 ) ) ( not ( = ?auto_25345 ?auto_25349 ) ) ( not ( = ?auto_25346 ?auto_25347 ) ) ( not ( = ?auto_25346 ?auto_25348 ) ) ( not ( = ?auto_25346 ?auto_25349 ) ) ( not ( = ?auto_25347 ?auto_25348 ) ) ( not ( = ?auto_25347 ?auto_25349 ) ) ( not ( = ?auto_25348 ?auto_25349 ) ) ( ON-TABLE ?auto_25349 ) ( ON ?auto_25348 ?auto_25349 ) ( ON ?auto_25347 ?auto_25348 ) ( CLEAR ?auto_25347 ) ( HOLDING ?auto_25346 ) ( CLEAR ?auto_25345 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25345 ?auto_25346 )
      ( MAKE-5PILE ?auto_25345 ?auto_25346 ?auto_25347 ?auto_25348 ?auto_25349 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25350 - BLOCK
      ?auto_25351 - BLOCK
      ?auto_25352 - BLOCK
      ?auto_25353 - BLOCK
      ?auto_25354 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25350 ) ( not ( = ?auto_25350 ?auto_25351 ) ) ( not ( = ?auto_25350 ?auto_25352 ) ) ( not ( = ?auto_25350 ?auto_25353 ) ) ( not ( = ?auto_25350 ?auto_25354 ) ) ( not ( = ?auto_25351 ?auto_25352 ) ) ( not ( = ?auto_25351 ?auto_25353 ) ) ( not ( = ?auto_25351 ?auto_25354 ) ) ( not ( = ?auto_25352 ?auto_25353 ) ) ( not ( = ?auto_25352 ?auto_25354 ) ) ( not ( = ?auto_25353 ?auto_25354 ) ) ( ON-TABLE ?auto_25354 ) ( ON ?auto_25353 ?auto_25354 ) ( ON ?auto_25352 ?auto_25353 ) ( CLEAR ?auto_25350 ) ( ON ?auto_25351 ?auto_25352 ) ( CLEAR ?auto_25351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25354 ?auto_25353 ?auto_25352 )
      ( MAKE-5PILE ?auto_25350 ?auto_25351 ?auto_25352 ?auto_25353 ?auto_25354 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25355 - BLOCK
      ?auto_25356 - BLOCK
      ?auto_25357 - BLOCK
      ?auto_25358 - BLOCK
      ?auto_25359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25355 ?auto_25356 ) ) ( not ( = ?auto_25355 ?auto_25357 ) ) ( not ( = ?auto_25355 ?auto_25358 ) ) ( not ( = ?auto_25355 ?auto_25359 ) ) ( not ( = ?auto_25356 ?auto_25357 ) ) ( not ( = ?auto_25356 ?auto_25358 ) ) ( not ( = ?auto_25356 ?auto_25359 ) ) ( not ( = ?auto_25357 ?auto_25358 ) ) ( not ( = ?auto_25357 ?auto_25359 ) ) ( not ( = ?auto_25358 ?auto_25359 ) ) ( ON-TABLE ?auto_25359 ) ( ON ?auto_25358 ?auto_25359 ) ( ON ?auto_25357 ?auto_25358 ) ( ON ?auto_25356 ?auto_25357 ) ( CLEAR ?auto_25356 ) ( HOLDING ?auto_25355 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25355 )
      ( MAKE-5PILE ?auto_25355 ?auto_25356 ?auto_25357 ?auto_25358 ?auto_25359 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25360 - BLOCK
      ?auto_25361 - BLOCK
      ?auto_25362 - BLOCK
      ?auto_25363 - BLOCK
      ?auto_25364 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25360 ?auto_25361 ) ) ( not ( = ?auto_25360 ?auto_25362 ) ) ( not ( = ?auto_25360 ?auto_25363 ) ) ( not ( = ?auto_25360 ?auto_25364 ) ) ( not ( = ?auto_25361 ?auto_25362 ) ) ( not ( = ?auto_25361 ?auto_25363 ) ) ( not ( = ?auto_25361 ?auto_25364 ) ) ( not ( = ?auto_25362 ?auto_25363 ) ) ( not ( = ?auto_25362 ?auto_25364 ) ) ( not ( = ?auto_25363 ?auto_25364 ) ) ( ON-TABLE ?auto_25364 ) ( ON ?auto_25363 ?auto_25364 ) ( ON ?auto_25362 ?auto_25363 ) ( ON ?auto_25361 ?auto_25362 ) ( ON ?auto_25360 ?auto_25361 ) ( CLEAR ?auto_25360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25364 ?auto_25363 ?auto_25362 ?auto_25361 )
      ( MAKE-5PILE ?auto_25360 ?auto_25361 ?auto_25362 ?auto_25363 ?auto_25364 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25365 - BLOCK
      ?auto_25366 - BLOCK
      ?auto_25367 - BLOCK
      ?auto_25368 - BLOCK
      ?auto_25369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25365 ?auto_25366 ) ) ( not ( = ?auto_25365 ?auto_25367 ) ) ( not ( = ?auto_25365 ?auto_25368 ) ) ( not ( = ?auto_25365 ?auto_25369 ) ) ( not ( = ?auto_25366 ?auto_25367 ) ) ( not ( = ?auto_25366 ?auto_25368 ) ) ( not ( = ?auto_25366 ?auto_25369 ) ) ( not ( = ?auto_25367 ?auto_25368 ) ) ( not ( = ?auto_25367 ?auto_25369 ) ) ( not ( = ?auto_25368 ?auto_25369 ) ) ( ON-TABLE ?auto_25369 ) ( ON ?auto_25368 ?auto_25369 ) ( ON ?auto_25367 ?auto_25368 ) ( ON ?auto_25366 ?auto_25367 ) ( HOLDING ?auto_25365 ) ( CLEAR ?auto_25366 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25369 ?auto_25368 ?auto_25367 ?auto_25366 ?auto_25365 )
      ( MAKE-5PILE ?auto_25365 ?auto_25366 ?auto_25367 ?auto_25368 ?auto_25369 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25370 - BLOCK
      ?auto_25371 - BLOCK
      ?auto_25372 - BLOCK
      ?auto_25373 - BLOCK
      ?auto_25374 - BLOCK
    )
    :vars
    (
      ?auto_25375 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25370 ?auto_25371 ) ) ( not ( = ?auto_25370 ?auto_25372 ) ) ( not ( = ?auto_25370 ?auto_25373 ) ) ( not ( = ?auto_25370 ?auto_25374 ) ) ( not ( = ?auto_25371 ?auto_25372 ) ) ( not ( = ?auto_25371 ?auto_25373 ) ) ( not ( = ?auto_25371 ?auto_25374 ) ) ( not ( = ?auto_25372 ?auto_25373 ) ) ( not ( = ?auto_25372 ?auto_25374 ) ) ( not ( = ?auto_25373 ?auto_25374 ) ) ( ON-TABLE ?auto_25374 ) ( ON ?auto_25373 ?auto_25374 ) ( ON ?auto_25372 ?auto_25373 ) ( ON ?auto_25371 ?auto_25372 ) ( CLEAR ?auto_25371 ) ( ON ?auto_25370 ?auto_25375 ) ( CLEAR ?auto_25370 ) ( HAND-EMPTY ) ( not ( = ?auto_25370 ?auto_25375 ) ) ( not ( = ?auto_25371 ?auto_25375 ) ) ( not ( = ?auto_25372 ?auto_25375 ) ) ( not ( = ?auto_25373 ?auto_25375 ) ) ( not ( = ?auto_25374 ?auto_25375 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25370 ?auto_25375 )
      ( MAKE-5PILE ?auto_25370 ?auto_25371 ?auto_25372 ?auto_25373 ?auto_25374 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25376 - BLOCK
      ?auto_25377 - BLOCK
      ?auto_25378 - BLOCK
      ?auto_25379 - BLOCK
      ?auto_25380 - BLOCK
    )
    :vars
    (
      ?auto_25381 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25376 ?auto_25377 ) ) ( not ( = ?auto_25376 ?auto_25378 ) ) ( not ( = ?auto_25376 ?auto_25379 ) ) ( not ( = ?auto_25376 ?auto_25380 ) ) ( not ( = ?auto_25377 ?auto_25378 ) ) ( not ( = ?auto_25377 ?auto_25379 ) ) ( not ( = ?auto_25377 ?auto_25380 ) ) ( not ( = ?auto_25378 ?auto_25379 ) ) ( not ( = ?auto_25378 ?auto_25380 ) ) ( not ( = ?auto_25379 ?auto_25380 ) ) ( ON-TABLE ?auto_25380 ) ( ON ?auto_25379 ?auto_25380 ) ( ON ?auto_25378 ?auto_25379 ) ( ON ?auto_25376 ?auto_25381 ) ( CLEAR ?auto_25376 ) ( not ( = ?auto_25376 ?auto_25381 ) ) ( not ( = ?auto_25377 ?auto_25381 ) ) ( not ( = ?auto_25378 ?auto_25381 ) ) ( not ( = ?auto_25379 ?auto_25381 ) ) ( not ( = ?auto_25380 ?auto_25381 ) ) ( HOLDING ?auto_25377 ) ( CLEAR ?auto_25378 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25380 ?auto_25379 ?auto_25378 ?auto_25377 )
      ( MAKE-5PILE ?auto_25376 ?auto_25377 ?auto_25378 ?auto_25379 ?auto_25380 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25382 - BLOCK
      ?auto_25383 - BLOCK
      ?auto_25384 - BLOCK
      ?auto_25385 - BLOCK
      ?auto_25386 - BLOCK
    )
    :vars
    (
      ?auto_25387 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25382 ?auto_25383 ) ) ( not ( = ?auto_25382 ?auto_25384 ) ) ( not ( = ?auto_25382 ?auto_25385 ) ) ( not ( = ?auto_25382 ?auto_25386 ) ) ( not ( = ?auto_25383 ?auto_25384 ) ) ( not ( = ?auto_25383 ?auto_25385 ) ) ( not ( = ?auto_25383 ?auto_25386 ) ) ( not ( = ?auto_25384 ?auto_25385 ) ) ( not ( = ?auto_25384 ?auto_25386 ) ) ( not ( = ?auto_25385 ?auto_25386 ) ) ( ON-TABLE ?auto_25386 ) ( ON ?auto_25385 ?auto_25386 ) ( ON ?auto_25384 ?auto_25385 ) ( ON ?auto_25382 ?auto_25387 ) ( not ( = ?auto_25382 ?auto_25387 ) ) ( not ( = ?auto_25383 ?auto_25387 ) ) ( not ( = ?auto_25384 ?auto_25387 ) ) ( not ( = ?auto_25385 ?auto_25387 ) ) ( not ( = ?auto_25386 ?auto_25387 ) ) ( CLEAR ?auto_25384 ) ( ON ?auto_25383 ?auto_25382 ) ( CLEAR ?auto_25383 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25387 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25387 ?auto_25382 )
      ( MAKE-5PILE ?auto_25382 ?auto_25383 ?auto_25384 ?auto_25385 ?auto_25386 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25388 - BLOCK
      ?auto_25389 - BLOCK
      ?auto_25390 - BLOCK
      ?auto_25391 - BLOCK
      ?auto_25392 - BLOCK
    )
    :vars
    (
      ?auto_25393 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25388 ?auto_25389 ) ) ( not ( = ?auto_25388 ?auto_25390 ) ) ( not ( = ?auto_25388 ?auto_25391 ) ) ( not ( = ?auto_25388 ?auto_25392 ) ) ( not ( = ?auto_25389 ?auto_25390 ) ) ( not ( = ?auto_25389 ?auto_25391 ) ) ( not ( = ?auto_25389 ?auto_25392 ) ) ( not ( = ?auto_25390 ?auto_25391 ) ) ( not ( = ?auto_25390 ?auto_25392 ) ) ( not ( = ?auto_25391 ?auto_25392 ) ) ( ON-TABLE ?auto_25392 ) ( ON ?auto_25391 ?auto_25392 ) ( ON ?auto_25388 ?auto_25393 ) ( not ( = ?auto_25388 ?auto_25393 ) ) ( not ( = ?auto_25389 ?auto_25393 ) ) ( not ( = ?auto_25390 ?auto_25393 ) ) ( not ( = ?auto_25391 ?auto_25393 ) ) ( not ( = ?auto_25392 ?auto_25393 ) ) ( ON ?auto_25389 ?auto_25388 ) ( CLEAR ?auto_25389 ) ( ON-TABLE ?auto_25393 ) ( HOLDING ?auto_25390 ) ( CLEAR ?auto_25391 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25392 ?auto_25391 ?auto_25390 )
      ( MAKE-5PILE ?auto_25388 ?auto_25389 ?auto_25390 ?auto_25391 ?auto_25392 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25394 - BLOCK
      ?auto_25395 - BLOCK
      ?auto_25396 - BLOCK
      ?auto_25397 - BLOCK
      ?auto_25398 - BLOCK
    )
    :vars
    (
      ?auto_25399 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25394 ?auto_25395 ) ) ( not ( = ?auto_25394 ?auto_25396 ) ) ( not ( = ?auto_25394 ?auto_25397 ) ) ( not ( = ?auto_25394 ?auto_25398 ) ) ( not ( = ?auto_25395 ?auto_25396 ) ) ( not ( = ?auto_25395 ?auto_25397 ) ) ( not ( = ?auto_25395 ?auto_25398 ) ) ( not ( = ?auto_25396 ?auto_25397 ) ) ( not ( = ?auto_25396 ?auto_25398 ) ) ( not ( = ?auto_25397 ?auto_25398 ) ) ( ON-TABLE ?auto_25398 ) ( ON ?auto_25397 ?auto_25398 ) ( ON ?auto_25394 ?auto_25399 ) ( not ( = ?auto_25394 ?auto_25399 ) ) ( not ( = ?auto_25395 ?auto_25399 ) ) ( not ( = ?auto_25396 ?auto_25399 ) ) ( not ( = ?auto_25397 ?auto_25399 ) ) ( not ( = ?auto_25398 ?auto_25399 ) ) ( ON ?auto_25395 ?auto_25394 ) ( ON-TABLE ?auto_25399 ) ( CLEAR ?auto_25397 ) ( ON ?auto_25396 ?auto_25395 ) ( CLEAR ?auto_25396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25399 ?auto_25394 ?auto_25395 )
      ( MAKE-5PILE ?auto_25394 ?auto_25395 ?auto_25396 ?auto_25397 ?auto_25398 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25400 - BLOCK
      ?auto_25401 - BLOCK
      ?auto_25402 - BLOCK
      ?auto_25403 - BLOCK
      ?auto_25404 - BLOCK
    )
    :vars
    (
      ?auto_25405 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25400 ?auto_25401 ) ) ( not ( = ?auto_25400 ?auto_25402 ) ) ( not ( = ?auto_25400 ?auto_25403 ) ) ( not ( = ?auto_25400 ?auto_25404 ) ) ( not ( = ?auto_25401 ?auto_25402 ) ) ( not ( = ?auto_25401 ?auto_25403 ) ) ( not ( = ?auto_25401 ?auto_25404 ) ) ( not ( = ?auto_25402 ?auto_25403 ) ) ( not ( = ?auto_25402 ?auto_25404 ) ) ( not ( = ?auto_25403 ?auto_25404 ) ) ( ON-TABLE ?auto_25404 ) ( ON ?auto_25400 ?auto_25405 ) ( not ( = ?auto_25400 ?auto_25405 ) ) ( not ( = ?auto_25401 ?auto_25405 ) ) ( not ( = ?auto_25402 ?auto_25405 ) ) ( not ( = ?auto_25403 ?auto_25405 ) ) ( not ( = ?auto_25404 ?auto_25405 ) ) ( ON ?auto_25401 ?auto_25400 ) ( ON-TABLE ?auto_25405 ) ( ON ?auto_25402 ?auto_25401 ) ( CLEAR ?auto_25402 ) ( HOLDING ?auto_25403 ) ( CLEAR ?auto_25404 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25404 ?auto_25403 )
      ( MAKE-5PILE ?auto_25400 ?auto_25401 ?auto_25402 ?auto_25403 ?auto_25404 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25406 - BLOCK
      ?auto_25407 - BLOCK
      ?auto_25408 - BLOCK
      ?auto_25409 - BLOCK
      ?auto_25410 - BLOCK
    )
    :vars
    (
      ?auto_25411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25406 ?auto_25407 ) ) ( not ( = ?auto_25406 ?auto_25408 ) ) ( not ( = ?auto_25406 ?auto_25409 ) ) ( not ( = ?auto_25406 ?auto_25410 ) ) ( not ( = ?auto_25407 ?auto_25408 ) ) ( not ( = ?auto_25407 ?auto_25409 ) ) ( not ( = ?auto_25407 ?auto_25410 ) ) ( not ( = ?auto_25408 ?auto_25409 ) ) ( not ( = ?auto_25408 ?auto_25410 ) ) ( not ( = ?auto_25409 ?auto_25410 ) ) ( ON-TABLE ?auto_25410 ) ( ON ?auto_25406 ?auto_25411 ) ( not ( = ?auto_25406 ?auto_25411 ) ) ( not ( = ?auto_25407 ?auto_25411 ) ) ( not ( = ?auto_25408 ?auto_25411 ) ) ( not ( = ?auto_25409 ?auto_25411 ) ) ( not ( = ?auto_25410 ?auto_25411 ) ) ( ON ?auto_25407 ?auto_25406 ) ( ON-TABLE ?auto_25411 ) ( ON ?auto_25408 ?auto_25407 ) ( CLEAR ?auto_25410 ) ( ON ?auto_25409 ?auto_25408 ) ( CLEAR ?auto_25409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25411 ?auto_25406 ?auto_25407 ?auto_25408 )
      ( MAKE-5PILE ?auto_25406 ?auto_25407 ?auto_25408 ?auto_25409 ?auto_25410 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25412 - BLOCK
      ?auto_25413 - BLOCK
      ?auto_25414 - BLOCK
      ?auto_25415 - BLOCK
      ?auto_25416 - BLOCK
    )
    :vars
    (
      ?auto_25417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25412 ?auto_25413 ) ) ( not ( = ?auto_25412 ?auto_25414 ) ) ( not ( = ?auto_25412 ?auto_25415 ) ) ( not ( = ?auto_25412 ?auto_25416 ) ) ( not ( = ?auto_25413 ?auto_25414 ) ) ( not ( = ?auto_25413 ?auto_25415 ) ) ( not ( = ?auto_25413 ?auto_25416 ) ) ( not ( = ?auto_25414 ?auto_25415 ) ) ( not ( = ?auto_25414 ?auto_25416 ) ) ( not ( = ?auto_25415 ?auto_25416 ) ) ( ON ?auto_25412 ?auto_25417 ) ( not ( = ?auto_25412 ?auto_25417 ) ) ( not ( = ?auto_25413 ?auto_25417 ) ) ( not ( = ?auto_25414 ?auto_25417 ) ) ( not ( = ?auto_25415 ?auto_25417 ) ) ( not ( = ?auto_25416 ?auto_25417 ) ) ( ON ?auto_25413 ?auto_25412 ) ( ON-TABLE ?auto_25417 ) ( ON ?auto_25414 ?auto_25413 ) ( ON ?auto_25415 ?auto_25414 ) ( CLEAR ?auto_25415 ) ( HOLDING ?auto_25416 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25416 )
      ( MAKE-5PILE ?auto_25412 ?auto_25413 ?auto_25414 ?auto_25415 ?auto_25416 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25418 - BLOCK
      ?auto_25419 - BLOCK
      ?auto_25420 - BLOCK
      ?auto_25421 - BLOCK
      ?auto_25422 - BLOCK
    )
    :vars
    (
      ?auto_25423 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25418 ?auto_25419 ) ) ( not ( = ?auto_25418 ?auto_25420 ) ) ( not ( = ?auto_25418 ?auto_25421 ) ) ( not ( = ?auto_25418 ?auto_25422 ) ) ( not ( = ?auto_25419 ?auto_25420 ) ) ( not ( = ?auto_25419 ?auto_25421 ) ) ( not ( = ?auto_25419 ?auto_25422 ) ) ( not ( = ?auto_25420 ?auto_25421 ) ) ( not ( = ?auto_25420 ?auto_25422 ) ) ( not ( = ?auto_25421 ?auto_25422 ) ) ( ON ?auto_25418 ?auto_25423 ) ( not ( = ?auto_25418 ?auto_25423 ) ) ( not ( = ?auto_25419 ?auto_25423 ) ) ( not ( = ?auto_25420 ?auto_25423 ) ) ( not ( = ?auto_25421 ?auto_25423 ) ) ( not ( = ?auto_25422 ?auto_25423 ) ) ( ON ?auto_25419 ?auto_25418 ) ( ON-TABLE ?auto_25423 ) ( ON ?auto_25420 ?auto_25419 ) ( ON ?auto_25421 ?auto_25420 ) ( ON ?auto_25422 ?auto_25421 ) ( CLEAR ?auto_25422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25423 ?auto_25418 ?auto_25419 ?auto_25420 ?auto_25421 )
      ( MAKE-5PILE ?auto_25418 ?auto_25419 ?auto_25420 ?auto_25421 ?auto_25422 ) )
  )

)

