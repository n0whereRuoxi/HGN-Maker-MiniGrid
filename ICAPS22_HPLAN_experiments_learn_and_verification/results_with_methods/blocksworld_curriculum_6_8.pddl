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
      ?auto_13345 - BLOCK
    )
    :vars
    (
      ?auto_13346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13345 ?auto_13346 ) ( CLEAR ?auto_13345 ) ( HAND-EMPTY ) ( not ( = ?auto_13345 ?auto_13346 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13345 ?auto_13346 )
      ( !PUTDOWN ?auto_13345 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13348 - BLOCK
    )
    :vars
    (
      ?auto_13349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13348 ?auto_13349 ) ( CLEAR ?auto_13348 ) ( HAND-EMPTY ) ( not ( = ?auto_13348 ?auto_13349 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13348 ?auto_13349 )
      ( !PUTDOWN ?auto_13348 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13352 - BLOCK
      ?auto_13353 - BLOCK
    )
    :vars
    (
      ?auto_13354 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13352 ) ( ON ?auto_13353 ?auto_13354 ) ( CLEAR ?auto_13353 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13352 ) ( not ( = ?auto_13352 ?auto_13353 ) ) ( not ( = ?auto_13352 ?auto_13354 ) ) ( not ( = ?auto_13353 ?auto_13354 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13353 ?auto_13354 )
      ( !STACK ?auto_13353 ?auto_13352 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13357 - BLOCK
      ?auto_13358 - BLOCK
    )
    :vars
    (
      ?auto_13359 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13357 ) ( ON ?auto_13358 ?auto_13359 ) ( CLEAR ?auto_13358 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13357 ) ( not ( = ?auto_13357 ?auto_13358 ) ) ( not ( = ?auto_13357 ?auto_13359 ) ) ( not ( = ?auto_13358 ?auto_13359 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13358 ?auto_13359 )
      ( !STACK ?auto_13358 ?auto_13357 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13362 - BLOCK
      ?auto_13363 - BLOCK
    )
    :vars
    (
      ?auto_13364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13363 ?auto_13364 ) ( not ( = ?auto_13362 ?auto_13363 ) ) ( not ( = ?auto_13362 ?auto_13364 ) ) ( not ( = ?auto_13363 ?auto_13364 ) ) ( ON ?auto_13362 ?auto_13363 ) ( CLEAR ?auto_13362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13362 )
      ( MAKE-2PILE ?auto_13362 ?auto_13363 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13367 - BLOCK
      ?auto_13368 - BLOCK
    )
    :vars
    (
      ?auto_13369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13368 ?auto_13369 ) ( not ( = ?auto_13367 ?auto_13368 ) ) ( not ( = ?auto_13367 ?auto_13369 ) ) ( not ( = ?auto_13368 ?auto_13369 ) ) ( ON ?auto_13367 ?auto_13368 ) ( CLEAR ?auto_13367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13367 )
      ( MAKE-2PILE ?auto_13367 ?auto_13368 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13373 - BLOCK
      ?auto_13374 - BLOCK
      ?auto_13375 - BLOCK
    )
    :vars
    (
      ?auto_13376 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13374 ) ( ON ?auto_13375 ?auto_13376 ) ( CLEAR ?auto_13375 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13373 ) ( ON ?auto_13374 ?auto_13373 ) ( not ( = ?auto_13373 ?auto_13374 ) ) ( not ( = ?auto_13373 ?auto_13375 ) ) ( not ( = ?auto_13373 ?auto_13376 ) ) ( not ( = ?auto_13374 ?auto_13375 ) ) ( not ( = ?auto_13374 ?auto_13376 ) ) ( not ( = ?auto_13375 ?auto_13376 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13375 ?auto_13376 )
      ( !STACK ?auto_13375 ?auto_13374 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13380 - BLOCK
      ?auto_13381 - BLOCK
      ?auto_13382 - BLOCK
    )
    :vars
    (
      ?auto_13383 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13381 ) ( ON ?auto_13382 ?auto_13383 ) ( CLEAR ?auto_13382 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13380 ) ( ON ?auto_13381 ?auto_13380 ) ( not ( = ?auto_13380 ?auto_13381 ) ) ( not ( = ?auto_13380 ?auto_13382 ) ) ( not ( = ?auto_13380 ?auto_13383 ) ) ( not ( = ?auto_13381 ?auto_13382 ) ) ( not ( = ?auto_13381 ?auto_13383 ) ) ( not ( = ?auto_13382 ?auto_13383 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13382 ?auto_13383 )
      ( !STACK ?auto_13382 ?auto_13381 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13387 - BLOCK
      ?auto_13388 - BLOCK
      ?auto_13389 - BLOCK
    )
    :vars
    (
      ?auto_13390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13389 ?auto_13390 ) ( ON-TABLE ?auto_13387 ) ( not ( = ?auto_13387 ?auto_13388 ) ) ( not ( = ?auto_13387 ?auto_13389 ) ) ( not ( = ?auto_13387 ?auto_13390 ) ) ( not ( = ?auto_13388 ?auto_13389 ) ) ( not ( = ?auto_13388 ?auto_13390 ) ) ( not ( = ?auto_13389 ?auto_13390 ) ) ( CLEAR ?auto_13387 ) ( ON ?auto_13388 ?auto_13389 ) ( CLEAR ?auto_13388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13387 ?auto_13388 )
      ( MAKE-3PILE ?auto_13387 ?auto_13388 ?auto_13389 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13394 - BLOCK
      ?auto_13395 - BLOCK
      ?auto_13396 - BLOCK
    )
    :vars
    (
      ?auto_13397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13396 ?auto_13397 ) ( ON-TABLE ?auto_13394 ) ( not ( = ?auto_13394 ?auto_13395 ) ) ( not ( = ?auto_13394 ?auto_13396 ) ) ( not ( = ?auto_13394 ?auto_13397 ) ) ( not ( = ?auto_13395 ?auto_13396 ) ) ( not ( = ?auto_13395 ?auto_13397 ) ) ( not ( = ?auto_13396 ?auto_13397 ) ) ( CLEAR ?auto_13394 ) ( ON ?auto_13395 ?auto_13396 ) ( CLEAR ?auto_13395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13394 ?auto_13395 )
      ( MAKE-3PILE ?auto_13394 ?auto_13395 ?auto_13396 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13401 - BLOCK
      ?auto_13402 - BLOCK
      ?auto_13403 - BLOCK
    )
    :vars
    (
      ?auto_13404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13403 ?auto_13404 ) ( not ( = ?auto_13401 ?auto_13402 ) ) ( not ( = ?auto_13401 ?auto_13403 ) ) ( not ( = ?auto_13401 ?auto_13404 ) ) ( not ( = ?auto_13402 ?auto_13403 ) ) ( not ( = ?auto_13402 ?auto_13404 ) ) ( not ( = ?auto_13403 ?auto_13404 ) ) ( ON ?auto_13402 ?auto_13403 ) ( ON ?auto_13401 ?auto_13402 ) ( CLEAR ?auto_13401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13401 )
      ( MAKE-3PILE ?auto_13401 ?auto_13402 ?auto_13403 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13408 - BLOCK
      ?auto_13409 - BLOCK
      ?auto_13410 - BLOCK
    )
    :vars
    (
      ?auto_13411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13410 ?auto_13411 ) ( not ( = ?auto_13408 ?auto_13409 ) ) ( not ( = ?auto_13408 ?auto_13410 ) ) ( not ( = ?auto_13408 ?auto_13411 ) ) ( not ( = ?auto_13409 ?auto_13410 ) ) ( not ( = ?auto_13409 ?auto_13411 ) ) ( not ( = ?auto_13410 ?auto_13411 ) ) ( ON ?auto_13409 ?auto_13410 ) ( ON ?auto_13408 ?auto_13409 ) ( CLEAR ?auto_13408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13408 )
      ( MAKE-3PILE ?auto_13408 ?auto_13409 ?auto_13410 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13416 - BLOCK
      ?auto_13417 - BLOCK
      ?auto_13418 - BLOCK
      ?auto_13419 - BLOCK
    )
    :vars
    (
      ?auto_13420 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13418 ) ( ON ?auto_13419 ?auto_13420 ) ( CLEAR ?auto_13419 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13416 ) ( ON ?auto_13417 ?auto_13416 ) ( ON ?auto_13418 ?auto_13417 ) ( not ( = ?auto_13416 ?auto_13417 ) ) ( not ( = ?auto_13416 ?auto_13418 ) ) ( not ( = ?auto_13416 ?auto_13419 ) ) ( not ( = ?auto_13416 ?auto_13420 ) ) ( not ( = ?auto_13417 ?auto_13418 ) ) ( not ( = ?auto_13417 ?auto_13419 ) ) ( not ( = ?auto_13417 ?auto_13420 ) ) ( not ( = ?auto_13418 ?auto_13419 ) ) ( not ( = ?auto_13418 ?auto_13420 ) ) ( not ( = ?auto_13419 ?auto_13420 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13419 ?auto_13420 )
      ( !STACK ?auto_13419 ?auto_13418 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13425 - BLOCK
      ?auto_13426 - BLOCK
      ?auto_13427 - BLOCK
      ?auto_13428 - BLOCK
    )
    :vars
    (
      ?auto_13429 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13427 ) ( ON ?auto_13428 ?auto_13429 ) ( CLEAR ?auto_13428 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13425 ) ( ON ?auto_13426 ?auto_13425 ) ( ON ?auto_13427 ?auto_13426 ) ( not ( = ?auto_13425 ?auto_13426 ) ) ( not ( = ?auto_13425 ?auto_13427 ) ) ( not ( = ?auto_13425 ?auto_13428 ) ) ( not ( = ?auto_13425 ?auto_13429 ) ) ( not ( = ?auto_13426 ?auto_13427 ) ) ( not ( = ?auto_13426 ?auto_13428 ) ) ( not ( = ?auto_13426 ?auto_13429 ) ) ( not ( = ?auto_13427 ?auto_13428 ) ) ( not ( = ?auto_13427 ?auto_13429 ) ) ( not ( = ?auto_13428 ?auto_13429 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13428 ?auto_13429 )
      ( !STACK ?auto_13428 ?auto_13427 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13434 - BLOCK
      ?auto_13435 - BLOCK
      ?auto_13436 - BLOCK
      ?auto_13437 - BLOCK
    )
    :vars
    (
      ?auto_13438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13437 ?auto_13438 ) ( ON-TABLE ?auto_13434 ) ( ON ?auto_13435 ?auto_13434 ) ( not ( = ?auto_13434 ?auto_13435 ) ) ( not ( = ?auto_13434 ?auto_13436 ) ) ( not ( = ?auto_13434 ?auto_13437 ) ) ( not ( = ?auto_13434 ?auto_13438 ) ) ( not ( = ?auto_13435 ?auto_13436 ) ) ( not ( = ?auto_13435 ?auto_13437 ) ) ( not ( = ?auto_13435 ?auto_13438 ) ) ( not ( = ?auto_13436 ?auto_13437 ) ) ( not ( = ?auto_13436 ?auto_13438 ) ) ( not ( = ?auto_13437 ?auto_13438 ) ) ( CLEAR ?auto_13435 ) ( ON ?auto_13436 ?auto_13437 ) ( CLEAR ?auto_13436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13434 ?auto_13435 ?auto_13436 )
      ( MAKE-4PILE ?auto_13434 ?auto_13435 ?auto_13436 ?auto_13437 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13443 - BLOCK
      ?auto_13444 - BLOCK
      ?auto_13445 - BLOCK
      ?auto_13446 - BLOCK
    )
    :vars
    (
      ?auto_13447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13446 ?auto_13447 ) ( ON-TABLE ?auto_13443 ) ( ON ?auto_13444 ?auto_13443 ) ( not ( = ?auto_13443 ?auto_13444 ) ) ( not ( = ?auto_13443 ?auto_13445 ) ) ( not ( = ?auto_13443 ?auto_13446 ) ) ( not ( = ?auto_13443 ?auto_13447 ) ) ( not ( = ?auto_13444 ?auto_13445 ) ) ( not ( = ?auto_13444 ?auto_13446 ) ) ( not ( = ?auto_13444 ?auto_13447 ) ) ( not ( = ?auto_13445 ?auto_13446 ) ) ( not ( = ?auto_13445 ?auto_13447 ) ) ( not ( = ?auto_13446 ?auto_13447 ) ) ( CLEAR ?auto_13444 ) ( ON ?auto_13445 ?auto_13446 ) ( CLEAR ?auto_13445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13443 ?auto_13444 ?auto_13445 )
      ( MAKE-4PILE ?auto_13443 ?auto_13444 ?auto_13445 ?auto_13446 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13452 - BLOCK
      ?auto_13453 - BLOCK
      ?auto_13454 - BLOCK
      ?auto_13455 - BLOCK
    )
    :vars
    (
      ?auto_13456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13455 ?auto_13456 ) ( ON-TABLE ?auto_13452 ) ( not ( = ?auto_13452 ?auto_13453 ) ) ( not ( = ?auto_13452 ?auto_13454 ) ) ( not ( = ?auto_13452 ?auto_13455 ) ) ( not ( = ?auto_13452 ?auto_13456 ) ) ( not ( = ?auto_13453 ?auto_13454 ) ) ( not ( = ?auto_13453 ?auto_13455 ) ) ( not ( = ?auto_13453 ?auto_13456 ) ) ( not ( = ?auto_13454 ?auto_13455 ) ) ( not ( = ?auto_13454 ?auto_13456 ) ) ( not ( = ?auto_13455 ?auto_13456 ) ) ( ON ?auto_13454 ?auto_13455 ) ( CLEAR ?auto_13452 ) ( ON ?auto_13453 ?auto_13454 ) ( CLEAR ?auto_13453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13452 ?auto_13453 )
      ( MAKE-4PILE ?auto_13452 ?auto_13453 ?auto_13454 ?auto_13455 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13461 - BLOCK
      ?auto_13462 - BLOCK
      ?auto_13463 - BLOCK
      ?auto_13464 - BLOCK
    )
    :vars
    (
      ?auto_13465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13464 ?auto_13465 ) ( ON-TABLE ?auto_13461 ) ( not ( = ?auto_13461 ?auto_13462 ) ) ( not ( = ?auto_13461 ?auto_13463 ) ) ( not ( = ?auto_13461 ?auto_13464 ) ) ( not ( = ?auto_13461 ?auto_13465 ) ) ( not ( = ?auto_13462 ?auto_13463 ) ) ( not ( = ?auto_13462 ?auto_13464 ) ) ( not ( = ?auto_13462 ?auto_13465 ) ) ( not ( = ?auto_13463 ?auto_13464 ) ) ( not ( = ?auto_13463 ?auto_13465 ) ) ( not ( = ?auto_13464 ?auto_13465 ) ) ( ON ?auto_13463 ?auto_13464 ) ( CLEAR ?auto_13461 ) ( ON ?auto_13462 ?auto_13463 ) ( CLEAR ?auto_13462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13461 ?auto_13462 )
      ( MAKE-4PILE ?auto_13461 ?auto_13462 ?auto_13463 ?auto_13464 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13470 - BLOCK
      ?auto_13471 - BLOCK
      ?auto_13472 - BLOCK
      ?auto_13473 - BLOCK
    )
    :vars
    (
      ?auto_13474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13473 ?auto_13474 ) ( not ( = ?auto_13470 ?auto_13471 ) ) ( not ( = ?auto_13470 ?auto_13472 ) ) ( not ( = ?auto_13470 ?auto_13473 ) ) ( not ( = ?auto_13470 ?auto_13474 ) ) ( not ( = ?auto_13471 ?auto_13472 ) ) ( not ( = ?auto_13471 ?auto_13473 ) ) ( not ( = ?auto_13471 ?auto_13474 ) ) ( not ( = ?auto_13472 ?auto_13473 ) ) ( not ( = ?auto_13472 ?auto_13474 ) ) ( not ( = ?auto_13473 ?auto_13474 ) ) ( ON ?auto_13472 ?auto_13473 ) ( ON ?auto_13471 ?auto_13472 ) ( ON ?auto_13470 ?auto_13471 ) ( CLEAR ?auto_13470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13470 )
      ( MAKE-4PILE ?auto_13470 ?auto_13471 ?auto_13472 ?auto_13473 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13479 - BLOCK
      ?auto_13480 - BLOCK
      ?auto_13481 - BLOCK
      ?auto_13482 - BLOCK
    )
    :vars
    (
      ?auto_13483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13482 ?auto_13483 ) ( not ( = ?auto_13479 ?auto_13480 ) ) ( not ( = ?auto_13479 ?auto_13481 ) ) ( not ( = ?auto_13479 ?auto_13482 ) ) ( not ( = ?auto_13479 ?auto_13483 ) ) ( not ( = ?auto_13480 ?auto_13481 ) ) ( not ( = ?auto_13480 ?auto_13482 ) ) ( not ( = ?auto_13480 ?auto_13483 ) ) ( not ( = ?auto_13481 ?auto_13482 ) ) ( not ( = ?auto_13481 ?auto_13483 ) ) ( not ( = ?auto_13482 ?auto_13483 ) ) ( ON ?auto_13481 ?auto_13482 ) ( ON ?auto_13480 ?auto_13481 ) ( ON ?auto_13479 ?auto_13480 ) ( CLEAR ?auto_13479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13479 )
      ( MAKE-4PILE ?auto_13479 ?auto_13480 ?auto_13481 ?auto_13482 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_13489 - BLOCK
      ?auto_13490 - BLOCK
      ?auto_13491 - BLOCK
      ?auto_13492 - BLOCK
      ?auto_13493 - BLOCK
    )
    :vars
    (
      ?auto_13494 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13492 ) ( ON ?auto_13493 ?auto_13494 ) ( CLEAR ?auto_13493 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13489 ) ( ON ?auto_13490 ?auto_13489 ) ( ON ?auto_13491 ?auto_13490 ) ( ON ?auto_13492 ?auto_13491 ) ( not ( = ?auto_13489 ?auto_13490 ) ) ( not ( = ?auto_13489 ?auto_13491 ) ) ( not ( = ?auto_13489 ?auto_13492 ) ) ( not ( = ?auto_13489 ?auto_13493 ) ) ( not ( = ?auto_13489 ?auto_13494 ) ) ( not ( = ?auto_13490 ?auto_13491 ) ) ( not ( = ?auto_13490 ?auto_13492 ) ) ( not ( = ?auto_13490 ?auto_13493 ) ) ( not ( = ?auto_13490 ?auto_13494 ) ) ( not ( = ?auto_13491 ?auto_13492 ) ) ( not ( = ?auto_13491 ?auto_13493 ) ) ( not ( = ?auto_13491 ?auto_13494 ) ) ( not ( = ?auto_13492 ?auto_13493 ) ) ( not ( = ?auto_13492 ?auto_13494 ) ) ( not ( = ?auto_13493 ?auto_13494 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13493 ?auto_13494 )
      ( !STACK ?auto_13493 ?auto_13492 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_13500 - BLOCK
      ?auto_13501 - BLOCK
      ?auto_13502 - BLOCK
      ?auto_13503 - BLOCK
      ?auto_13504 - BLOCK
    )
    :vars
    (
      ?auto_13505 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13503 ) ( ON ?auto_13504 ?auto_13505 ) ( CLEAR ?auto_13504 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13500 ) ( ON ?auto_13501 ?auto_13500 ) ( ON ?auto_13502 ?auto_13501 ) ( ON ?auto_13503 ?auto_13502 ) ( not ( = ?auto_13500 ?auto_13501 ) ) ( not ( = ?auto_13500 ?auto_13502 ) ) ( not ( = ?auto_13500 ?auto_13503 ) ) ( not ( = ?auto_13500 ?auto_13504 ) ) ( not ( = ?auto_13500 ?auto_13505 ) ) ( not ( = ?auto_13501 ?auto_13502 ) ) ( not ( = ?auto_13501 ?auto_13503 ) ) ( not ( = ?auto_13501 ?auto_13504 ) ) ( not ( = ?auto_13501 ?auto_13505 ) ) ( not ( = ?auto_13502 ?auto_13503 ) ) ( not ( = ?auto_13502 ?auto_13504 ) ) ( not ( = ?auto_13502 ?auto_13505 ) ) ( not ( = ?auto_13503 ?auto_13504 ) ) ( not ( = ?auto_13503 ?auto_13505 ) ) ( not ( = ?auto_13504 ?auto_13505 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13504 ?auto_13505 )
      ( !STACK ?auto_13504 ?auto_13503 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_13511 - BLOCK
      ?auto_13512 - BLOCK
      ?auto_13513 - BLOCK
      ?auto_13514 - BLOCK
      ?auto_13515 - BLOCK
    )
    :vars
    (
      ?auto_13516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13515 ?auto_13516 ) ( ON-TABLE ?auto_13511 ) ( ON ?auto_13512 ?auto_13511 ) ( ON ?auto_13513 ?auto_13512 ) ( not ( = ?auto_13511 ?auto_13512 ) ) ( not ( = ?auto_13511 ?auto_13513 ) ) ( not ( = ?auto_13511 ?auto_13514 ) ) ( not ( = ?auto_13511 ?auto_13515 ) ) ( not ( = ?auto_13511 ?auto_13516 ) ) ( not ( = ?auto_13512 ?auto_13513 ) ) ( not ( = ?auto_13512 ?auto_13514 ) ) ( not ( = ?auto_13512 ?auto_13515 ) ) ( not ( = ?auto_13512 ?auto_13516 ) ) ( not ( = ?auto_13513 ?auto_13514 ) ) ( not ( = ?auto_13513 ?auto_13515 ) ) ( not ( = ?auto_13513 ?auto_13516 ) ) ( not ( = ?auto_13514 ?auto_13515 ) ) ( not ( = ?auto_13514 ?auto_13516 ) ) ( not ( = ?auto_13515 ?auto_13516 ) ) ( CLEAR ?auto_13513 ) ( ON ?auto_13514 ?auto_13515 ) ( CLEAR ?auto_13514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13511 ?auto_13512 ?auto_13513 ?auto_13514 )
      ( MAKE-5PILE ?auto_13511 ?auto_13512 ?auto_13513 ?auto_13514 ?auto_13515 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_13522 - BLOCK
      ?auto_13523 - BLOCK
      ?auto_13524 - BLOCK
      ?auto_13525 - BLOCK
      ?auto_13526 - BLOCK
    )
    :vars
    (
      ?auto_13527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13526 ?auto_13527 ) ( ON-TABLE ?auto_13522 ) ( ON ?auto_13523 ?auto_13522 ) ( ON ?auto_13524 ?auto_13523 ) ( not ( = ?auto_13522 ?auto_13523 ) ) ( not ( = ?auto_13522 ?auto_13524 ) ) ( not ( = ?auto_13522 ?auto_13525 ) ) ( not ( = ?auto_13522 ?auto_13526 ) ) ( not ( = ?auto_13522 ?auto_13527 ) ) ( not ( = ?auto_13523 ?auto_13524 ) ) ( not ( = ?auto_13523 ?auto_13525 ) ) ( not ( = ?auto_13523 ?auto_13526 ) ) ( not ( = ?auto_13523 ?auto_13527 ) ) ( not ( = ?auto_13524 ?auto_13525 ) ) ( not ( = ?auto_13524 ?auto_13526 ) ) ( not ( = ?auto_13524 ?auto_13527 ) ) ( not ( = ?auto_13525 ?auto_13526 ) ) ( not ( = ?auto_13525 ?auto_13527 ) ) ( not ( = ?auto_13526 ?auto_13527 ) ) ( CLEAR ?auto_13524 ) ( ON ?auto_13525 ?auto_13526 ) ( CLEAR ?auto_13525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13522 ?auto_13523 ?auto_13524 ?auto_13525 )
      ( MAKE-5PILE ?auto_13522 ?auto_13523 ?auto_13524 ?auto_13525 ?auto_13526 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_13533 - BLOCK
      ?auto_13534 - BLOCK
      ?auto_13535 - BLOCK
      ?auto_13536 - BLOCK
      ?auto_13537 - BLOCK
    )
    :vars
    (
      ?auto_13538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13537 ?auto_13538 ) ( ON-TABLE ?auto_13533 ) ( ON ?auto_13534 ?auto_13533 ) ( not ( = ?auto_13533 ?auto_13534 ) ) ( not ( = ?auto_13533 ?auto_13535 ) ) ( not ( = ?auto_13533 ?auto_13536 ) ) ( not ( = ?auto_13533 ?auto_13537 ) ) ( not ( = ?auto_13533 ?auto_13538 ) ) ( not ( = ?auto_13534 ?auto_13535 ) ) ( not ( = ?auto_13534 ?auto_13536 ) ) ( not ( = ?auto_13534 ?auto_13537 ) ) ( not ( = ?auto_13534 ?auto_13538 ) ) ( not ( = ?auto_13535 ?auto_13536 ) ) ( not ( = ?auto_13535 ?auto_13537 ) ) ( not ( = ?auto_13535 ?auto_13538 ) ) ( not ( = ?auto_13536 ?auto_13537 ) ) ( not ( = ?auto_13536 ?auto_13538 ) ) ( not ( = ?auto_13537 ?auto_13538 ) ) ( ON ?auto_13536 ?auto_13537 ) ( CLEAR ?auto_13534 ) ( ON ?auto_13535 ?auto_13536 ) ( CLEAR ?auto_13535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13533 ?auto_13534 ?auto_13535 )
      ( MAKE-5PILE ?auto_13533 ?auto_13534 ?auto_13535 ?auto_13536 ?auto_13537 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_13544 - BLOCK
      ?auto_13545 - BLOCK
      ?auto_13546 - BLOCK
      ?auto_13547 - BLOCK
      ?auto_13548 - BLOCK
    )
    :vars
    (
      ?auto_13549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13548 ?auto_13549 ) ( ON-TABLE ?auto_13544 ) ( ON ?auto_13545 ?auto_13544 ) ( not ( = ?auto_13544 ?auto_13545 ) ) ( not ( = ?auto_13544 ?auto_13546 ) ) ( not ( = ?auto_13544 ?auto_13547 ) ) ( not ( = ?auto_13544 ?auto_13548 ) ) ( not ( = ?auto_13544 ?auto_13549 ) ) ( not ( = ?auto_13545 ?auto_13546 ) ) ( not ( = ?auto_13545 ?auto_13547 ) ) ( not ( = ?auto_13545 ?auto_13548 ) ) ( not ( = ?auto_13545 ?auto_13549 ) ) ( not ( = ?auto_13546 ?auto_13547 ) ) ( not ( = ?auto_13546 ?auto_13548 ) ) ( not ( = ?auto_13546 ?auto_13549 ) ) ( not ( = ?auto_13547 ?auto_13548 ) ) ( not ( = ?auto_13547 ?auto_13549 ) ) ( not ( = ?auto_13548 ?auto_13549 ) ) ( ON ?auto_13547 ?auto_13548 ) ( CLEAR ?auto_13545 ) ( ON ?auto_13546 ?auto_13547 ) ( CLEAR ?auto_13546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13544 ?auto_13545 ?auto_13546 )
      ( MAKE-5PILE ?auto_13544 ?auto_13545 ?auto_13546 ?auto_13547 ?auto_13548 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_13555 - BLOCK
      ?auto_13556 - BLOCK
      ?auto_13557 - BLOCK
      ?auto_13558 - BLOCK
      ?auto_13559 - BLOCK
    )
    :vars
    (
      ?auto_13560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13559 ?auto_13560 ) ( ON-TABLE ?auto_13555 ) ( not ( = ?auto_13555 ?auto_13556 ) ) ( not ( = ?auto_13555 ?auto_13557 ) ) ( not ( = ?auto_13555 ?auto_13558 ) ) ( not ( = ?auto_13555 ?auto_13559 ) ) ( not ( = ?auto_13555 ?auto_13560 ) ) ( not ( = ?auto_13556 ?auto_13557 ) ) ( not ( = ?auto_13556 ?auto_13558 ) ) ( not ( = ?auto_13556 ?auto_13559 ) ) ( not ( = ?auto_13556 ?auto_13560 ) ) ( not ( = ?auto_13557 ?auto_13558 ) ) ( not ( = ?auto_13557 ?auto_13559 ) ) ( not ( = ?auto_13557 ?auto_13560 ) ) ( not ( = ?auto_13558 ?auto_13559 ) ) ( not ( = ?auto_13558 ?auto_13560 ) ) ( not ( = ?auto_13559 ?auto_13560 ) ) ( ON ?auto_13558 ?auto_13559 ) ( ON ?auto_13557 ?auto_13558 ) ( CLEAR ?auto_13555 ) ( ON ?auto_13556 ?auto_13557 ) ( CLEAR ?auto_13556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13555 ?auto_13556 )
      ( MAKE-5PILE ?auto_13555 ?auto_13556 ?auto_13557 ?auto_13558 ?auto_13559 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_13566 - BLOCK
      ?auto_13567 - BLOCK
      ?auto_13568 - BLOCK
      ?auto_13569 - BLOCK
      ?auto_13570 - BLOCK
    )
    :vars
    (
      ?auto_13571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13570 ?auto_13571 ) ( ON-TABLE ?auto_13566 ) ( not ( = ?auto_13566 ?auto_13567 ) ) ( not ( = ?auto_13566 ?auto_13568 ) ) ( not ( = ?auto_13566 ?auto_13569 ) ) ( not ( = ?auto_13566 ?auto_13570 ) ) ( not ( = ?auto_13566 ?auto_13571 ) ) ( not ( = ?auto_13567 ?auto_13568 ) ) ( not ( = ?auto_13567 ?auto_13569 ) ) ( not ( = ?auto_13567 ?auto_13570 ) ) ( not ( = ?auto_13567 ?auto_13571 ) ) ( not ( = ?auto_13568 ?auto_13569 ) ) ( not ( = ?auto_13568 ?auto_13570 ) ) ( not ( = ?auto_13568 ?auto_13571 ) ) ( not ( = ?auto_13569 ?auto_13570 ) ) ( not ( = ?auto_13569 ?auto_13571 ) ) ( not ( = ?auto_13570 ?auto_13571 ) ) ( ON ?auto_13569 ?auto_13570 ) ( ON ?auto_13568 ?auto_13569 ) ( CLEAR ?auto_13566 ) ( ON ?auto_13567 ?auto_13568 ) ( CLEAR ?auto_13567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13566 ?auto_13567 )
      ( MAKE-5PILE ?auto_13566 ?auto_13567 ?auto_13568 ?auto_13569 ?auto_13570 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_13577 - BLOCK
      ?auto_13578 - BLOCK
      ?auto_13579 - BLOCK
      ?auto_13580 - BLOCK
      ?auto_13581 - BLOCK
    )
    :vars
    (
      ?auto_13582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13581 ?auto_13582 ) ( not ( = ?auto_13577 ?auto_13578 ) ) ( not ( = ?auto_13577 ?auto_13579 ) ) ( not ( = ?auto_13577 ?auto_13580 ) ) ( not ( = ?auto_13577 ?auto_13581 ) ) ( not ( = ?auto_13577 ?auto_13582 ) ) ( not ( = ?auto_13578 ?auto_13579 ) ) ( not ( = ?auto_13578 ?auto_13580 ) ) ( not ( = ?auto_13578 ?auto_13581 ) ) ( not ( = ?auto_13578 ?auto_13582 ) ) ( not ( = ?auto_13579 ?auto_13580 ) ) ( not ( = ?auto_13579 ?auto_13581 ) ) ( not ( = ?auto_13579 ?auto_13582 ) ) ( not ( = ?auto_13580 ?auto_13581 ) ) ( not ( = ?auto_13580 ?auto_13582 ) ) ( not ( = ?auto_13581 ?auto_13582 ) ) ( ON ?auto_13580 ?auto_13581 ) ( ON ?auto_13579 ?auto_13580 ) ( ON ?auto_13578 ?auto_13579 ) ( ON ?auto_13577 ?auto_13578 ) ( CLEAR ?auto_13577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13577 )
      ( MAKE-5PILE ?auto_13577 ?auto_13578 ?auto_13579 ?auto_13580 ?auto_13581 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_13588 - BLOCK
      ?auto_13589 - BLOCK
      ?auto_13590 - BLOCK
      ?auto_13591 - BLOCK
      ?auto_13592 - BLOCK
    )
    :vars
    (
      ?auto_13593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13592 ?auto_13593 ) ( not ( = ?auto_13588 ?auto_13589 ) ) ( not ( = ?auto_13588 ?auto_13590 ) ) ( not ( = ?auto_13588 ?auto_13591 ) ) ( not ( = ?auto_13588 ?auto_13592 ) ) ( not ( = ?auto_13588 ?auto_13593 ) ) ( not ( = ?auto_13589 ?auto_13590 ) ) ( not ( = ?auto_13589 ?auto_13591 ) ) ( not ( = ?auto_13589 ?auto_13592 ) ) ( not ( = ?auto_13589 ?auto_13593 ) ) ( not ( = ?auto_13590 ?auto_13591 ) ) ( not ( = ?auto_13590 ?auto_13592 ) ) ( not ( = ?auto_13590 ?auto_13593 ) ) ( not ( = ?auto_13591 ?auto_13592 ) ) ( not ( = ?auto_13591 ?auto_13593 ) ) ( not ( = ?auto_13592 ?auto_13593 ) ) ( ON ?auto_13591 ?auto_13592 ) ( ON ?auto_13590 ?auto_13591 ) ( ON ?auto_13589 ?auto_13590 ) ( ON ?auto_13588 ?auto_13589 ) ( CLEAR ?auto_13588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13588 )
      ( MAKE-5PILE ?auto_13588 ?auto_13589 ?auto_13590 ?auto_13591 ?auto_13592 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_13600 - BLOCK
      ?auto_13601 - BLOCK
      ?auto_13602 - BLOCK
      ?auto_13603 - BLOCK
      ?auto_13604 - BLOCK
      ?auto_13605 - BLOCK
    )
    :vars
    (
      ?auto_13606 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13604 ) ( ON ?auto_13605 ?auto_13606 ) ( CLEAR ?auto_13605 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13600 ) ( ON ?auto_13601 ?auto_13600 ) ( ON ?auto_13602 ?auto_13601 ) ( ON ?auto_13603 ?auto_13602 ) ( ON ?auto_13604 ?auto_13603 ) ( not ( = ?auto_13600 ?auto_13601 ) ) ( not ( = ?auto_13600 ?auto_13602 ) ) ( not ( = ?auto_13600 ?auto_13603 ) ) ( not ( = ?auto_13600 ?auto_13604 ) ) ( not ( = ?auto_13600 ?auto_13605 ) ) ( not ( = ?auto_13600 ?auto_13606 ) ) ( not ( = ?auto_13601 ?auto_13602 ) ) ( not ( = ?auto_13601 ?auto_13603 ) ) ( not ( = ?auto_13601 ?auto_13604 ) ) ( not ( = ?auto_13601 ?auto_13605 ) ) ( not ( = ?auto_13601 ?auto_13606 ) ) ( not ( = ?auto_13602 ?auto_13603 ) ) ( not ( = ?auto_13602 ?auto_13604 ) ) ( not ( = ?auto_13602 ?auto_13605 ) ) ( not ( = ?auto_13602 ?auto_13606 ) ) ( not ( = ?auto_13603 ?auto_13604 ) ) ( not ( = ?auto_13603 ?auto_13605 ) ) ( not ( = ?auto_13603 ?auto_13606 ) ) ( not ( = ?auto_13604 ?auto_13605 ) ) ( not ( = ?auto_13604 ?auto_13606 ) ) ( not ( = ?auto_13605 ?auto_13606 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13605 ?auto_13606 )
      ( !STACK ?auto_13605 ?auto_13604 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_13613 - BLOCK
      ?auto_13614 - BLOCK
      ?auto_13615 - BLOCK
      ?auto_13616 - BLOCK
      ?auto_13617 - BLOCK
      ?auto_13618 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13617 ) ( ON-TABLE ?auto_13618 ) ( CLEAR ?auto_13618 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13613 ) ( ON ?auto_13614 ?auto_13613 ) ( ON ?auto_13615 ?auto_13614 ) ( ON ?auto_13616 ?auto_13615 ) ( ON ?auto_13617 ?auto_13616 ) ( not ( = ?auto_13613 ?auto_13614 ) ) ( not ( = ?auto_13613 ?auto_13615 ) ) ( not ( = ?auto_13613 ?auto_13616 ) ) ( not ( = ?auto_13613 ?auto_13617 ) ) ( not ( = ?auto_13613 ?auto_13618 ) ) ( not ( = ?auto_13614 ?auto_13615 ) ) ( not ( = ?auto_13614 ?auto_13616 ) ) ( not ( = ?auto_13614 ?auto_13617 ) ) ( not ( = ?auto_13614 ?auto_13618 ) ) ( not ( = ?auto_13615 ?auto_13616 ) ) ( not ( = ?auto_13615 ?auto_13617 ) ) ( not ( = ?auto_13615 ?auto_13618 ) ) ( not ( = ?auto_13616 ?auto_13617 ) ) ( not ( = ?auto_13616 ?auto_13618 ) ) ( not ( = ?auto_13617 ?auto_13618 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_13618 )
      ( !STACK ?auto_13618 ?auto_13617 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_13625 - BLOCK
      ?auto_13626 - BLOCK
      ?auto_13627 - BLOCK
      ?auto_13628 - BLOCK
      ?auto_13629 - BLOCK
      ?auto_13630 - BLOCK
    )
    :vars
    (
      ?auto_13631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13630 ?auto_13631 ) ( ON-TABLE ?auto_13625 ) ( ON ?auto_13626 ?auto_13625 ) ( ON ?auto_13627 ?auto_13626 ) ( ON ?auto_13628 ?auto_13627 ) ( not ( = ?auto_13625 ?auto_13626 ) ) ( not ( = ?auto_13625 ?auto_13627 ) ) ( not ( = ?auto_13625 ?auto_13628 ) ) ( not ( = ?auto_13625 ?auto_13629 ) ) ( not ( = ?auto_13625 ?auto_13630 ) ) ( not ( = ?auto_13625 ?auto_13631 ) ) ( not ( = ?auto_13626 ?auto_13627 ) ) ( not ( = ?auto_13626 ?auto_13628 ) ) ( not ( = ?auto_13626 ?auto_13629 ) ) ( not ( = ?auto_13626 ?auto_13630 ) ) ( not ( = ?auto_13626 ?auto_13631 ) ) ( not ( = ?auto_13627 ?auto_13628 ) ) ( not ( = ?auto_13627 ?auto_13629 ) ) ( not ( = ?auto_13627 ?auto_13630 ) ) ( not ( = ?auto_13627 ?auto_13631 ) ) ( not ( = ?auto_13628 ?auto_13629 ) ) ( not ( = ?auto_13628 ?auto_13630 ) ) ( not ( = ?auto_13628 ?auto_13631 ) ) ( not ( = ?auto_13629 ?auto_13630 ) ) ( not ( = ?auto_13629 ?auto_13631 ) ) ( not ( = ?auto_13630 ?auto_13631 ) ) ( CLEAR ?auto_13628 ) ( ON ?auto_13629 ?auto_13630 ) ( CLEAR ?auto_13629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_13625 ?auto_13626 ?auto_13627 ?auto_13628 ?auto_13629 )
      ( MAKE-6PILE ?auto_13625 ?auto_13626 ?auto_13627 ?auto_13628 ?auto_13629 ?auto_13630 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_13638 - BLOCK
      ?auto_13639 - BLOCK
      ?auto_13640 - BLOCK
      ?auto_13641 - BLOCK
      ?auto_13642 - BLOCK
      ?auto_13643 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13643 ) ( ON-TABLE ?auto_13638 ) ( ON ?auto_13639 ?auto_13638 ) ( ON ?auto_13640 ?auto_13639 ) ( ON ?auto_13641 ?auto_13640 ) ( not ( = ?auto_13638 ?auto_13639 ) ) ( not ( = ?auto_13638 ?auto_13640 ) ) ( not ( = ?auto_13638 ?auto_13641 ) ) ( not ( = ?auto_13638 ?auto_13642 ) ) ( not ( = ?auto_13638 ?auto_13643 ) ) ( not ( = ?auto_13639 ?auto_13640 ) ) ( not ( = ?auto_13639 ?auto_13641 ) ) ( not ( = ?auto_13639 ?auto_13642 ) ) ( not ( = ?auto_13639 ?auto_13643 ) ) ( not ( = ?auto_13640 ?auto_13641 ) ) ( not ( = ?auto_13640 ?auto_13642 ) ) ( not ( = ?auto_13640 ?auto_13643 ) ) ( not ( = ?auto_13641 ?auto_13642 ) ) ( not ( = ?auto_13641 ?auto_13643 ) ) ( not ( = ?auto_13642 ?auto_13643 ) ) ( CLEAR ?auto_13641 ) ( ON ?auto_13642 ?auto_13643 ) ( CLEAR ?auto_13642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_13638 ?auto_13639 ?auto_13640 ?auto_13641 ?auto_13642 )
      ( MAKE-6PILE ?auto_13638 ?auto_13639 ?auto_13640 ?auto_13641 ?auto_13642 ?auto_13643 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_13650 - BLOCK
      ?auto_13651 - BLOCK
      ?auto_13652 - BLOCK
      ?auto_13653 - BLOCK
      ?auto_13654 - BLOCK
      ?auto_13655 - BLOCK
    )
    :vars
    (
      ?auto_13656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13655 ?auto_13656 ) ( ON-TABLE ?auto_13650 ) ( ON ?auto_13651 ?auto_13650 ) ( ON ?auto_13652 ?auto_13651 ) ( not ( = ?auto_13650 ?auto_13651 ) ) ( not ( = ?auto_13650 ?auto_13652 ) ) ( not ( = ?auto_13650 ?auto_13653 ) ) ( not ( = ?auto_13650 ?auto_13654 ) ) ( not ( = ?auto_13650 ?auto_13655 ) ) ( not ( = ?auto_13650 ?auto_13656 ) ) ( not ( = ?auto_13651 ?auto_13652 ) ) ( not ( = ?auto_13651 ?auto_13653 ) ) ( not ( = ?auto_13651 ?auto_13654 ) ) ( not ( = ?auto_13651 ?auto_13655 ) ) ( not ( = ?auto_13651 ?auto_13656 ) ) ( not ( = ?auto_13652 ?auto_13653 ) ) ( not ( = ?auto_13652 ?auto_13654 ) ) ( not ( = ?auto_13652 ?auto_13655 ) ) ( not ( = ?auto_13652 ?auto_13656 ) ) ( not ( = ?auto_13653 ?auto_13654 ) ) ( not ( = ?auto_13653 ?auto_13655 ) ) ( not ( = ?auto_13653 ?auto_13656 ) ) ( not ( = ?auto_13654 ?auto_13655 ) ) ( not ( = ?auto_13654 ?auto_13656 ) ) ( not ( = ?auto_13655 ?auto_13656 ) ) ( ON ?auto_13654 ?auto_13655 ) ( CLEAR ?auto_13652 ) ( ON ?auto_13653 ?auto_13654 ) ( CLEAR ?auto_13653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13650 ?auto_13651 ?auto_13652 ?auto_13653 )
      ( MAKE-6PILE ?auto_13650 ?auto_13651 ?auto_13652 ?auto_13653 ?auto_13654 ?auto_13655 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_13663 - BLOCK
      ?auto_13664 - BLOCK
      ?auto_13665 - BLOCK
      ?auto_13666 - BLOCK
      ?auto_13667 - BLOCK
      ?auto_13668 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13668 ) ( ON-TABLE ?auto_13663 ) ( ON ?auto_13664 ?auto_13663 ) ( ON ?auto_13665 ?auto_13664 ) ( not ( = ?auto_13663 ?auto_13664 ) ) ( not ( = ?auto_13663 ?auto_13665 ) ) ( not ( = ?auto_13663 ?auto_13666 ) ) ( not ( = ?auto_13663 ?auto_13667 ) ) ( not ( = ?auto_13663 ?auto_13668 ) ) ( not ( = ?auto_13664 ?auto_13665 ) ) ( not ( = ?auto_13664 ?auto_13666 ) ) ( not ( = ?auto_13664 ?auto_13667 ) ) ( not ( = ?auto_13664 ?auto_13668 ) ) ( not ( = ?auto_13665 ?auto_13666 ) ) ( not ( = ?auto_13665 ?auto_13667 ) ) ( not ( = ?auto_13665 ?auto_13668 ) ) ( not ( = ?auto_13666 ?auto_13667 ) ) ( not ( = ?auto_13666 ?auto_13668 ) ) ( not ( = ?auto_13667 ?auto_13668 ) ) ( ON ?auto_13667 ?auto_13668 ) ( CLEAR ?auto_13665 ) ( ON ?auto_13666 ?auto_13667 ) ( CLEAR ?auto_13666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13663 ?auto_13664 ?auto_13665 ?auto_13666 )
      ( MAKE-6PILE ?auto_13663 ?auto_13664 ?auto_13665 ?auto_13666 ?auto_13667 ?auto_13668 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_13675 - BLOCK
      ?auto_13676 - BLOCK
      ?auto_13677 - BLOCK
      ?auto_13678 - BLOCK
      ?auto_13679 - BLOCK
      ?auto_13680 - BLOCK
    )
    :vars
    (
      ?auto_13681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13680 ?auto_13681 ) ( ON-TABLE ?auto_13675 ) ( ON ?auto_13676 ?auto_13675 ) ( not ( = ?auto_13675 ?auto_13676 ) ) ( not ( = ?auto_13675 ?auto_13677 ) ) ( not ( = ?auto_13675 ?auto_13678 ) ) ( not ( = ?auto_13675 ?auto_13679 ) ) ( not ( = ?auto_13675 ?auto_13680 ) ) ( not ( = ?auto_13675 ?auto_13681 ) ) ( not ( = ?auto_13676 ?auto_13677 ) ) ( not ( = ?auto_13676 ?auto_13678 ) ) ( not ( = ?auto_13676 ?auto_13679 ) ) ( not ( = ?auto_13676 ?auto_13680 ) ) ( not ( = ?auto_13676 ?auto_13681 ) ) ( not ( = ?auto_13677 ?auto_13678 ) ) ( not ( = ?auto_13677 ?auto_13679 ) ) ( not ( = ?auto_13677 ?auto_13680 ) ) ( not ( = ?auto_13677 ?auto_13681 ) ) ( not ( = ?auto_13678 ?auto_13679 ) ) ( not ( = ?auto_13678 ?auto_13680 ) ) ( not ( = ?auto_13678 ?auto_13681 ) ) ( not ( = ?auto_13679 ?auto_13680 ) ) ( not ( = ?auto_13679 ?auto_13681 ) ) ( not ( = ?auto_13680 ?auto_13681 ) ) ( ON ?auto_13679 ?auto_13680 ) ( ON ?auto_13678 ?auto_13679 ) ( CLEAR ?auto_13676 ) ( ON ?auto_13677 ?auto_13678 ) ( CLEAR ?auto_13677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13675 ?auto_13676 ?auto_13677 )
      ( MAKE-6PILE ?auto_13675 ?auto_13676 ?auto_13677 ?auto_13678 ?auto_13679 ?auto_13680 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_13688 - BLOCK
      ?auto_13689 - BLOCK
      ?auto_13690 - BLOCK
      ?auto_13691 - BLOCK
      ?auto_13692 - BLOCK
      ?auto_13693 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13693 ) ( ON-TABLE ?auto_13688 ) ( ON ?auto_13689 ?auto_13688 ) ( not ( = ?auto_13688 ?auto_13689 ) ) ( not ( = ?auto_13688 ?auto_13690 ) ) ( not ( = ?auto_13688 ?auto_13691 ) ) ( not ( = ?auto_13688 ?auto_13692 ) ) ( not ( = ?auto_13688 ?auto_13693 ) ) ( not ( = ?auto_13689 ?auto_13690 ) ) ( not ( = ?auto_13689 ?auto_13691 ) ) ( not ( = ?auto_13689 ?auto_13692 ) ) ( not ( = ?auto_13689 ?auto_13693 ) ) ( not ( = ?auto_13690 ?auto_13691 ) ) ( not ( = ?auto_13690 ?auto_13692 ) ) ( not ( = ?auto_13690 ?auto_13693 ) ) ( not ( = ?auto_13691 ?auto_13692 ) ) ( not ( = ?auto_13691 ?auto_13693 ) ) ( not ( = ?auto_13692 ?auto_13693 ) ) ( ON ?auto_13692 ?auto_13693 ) ( ON ?auto_13691 ?auto_13692 ) ( CLEAR ?auto_13689 ) ( ON ?auto_13690 ?auto_13691 ) ( CLEAR ?auto_13690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13688 ?auto_13689 ?auto_13690 )
      ( MAKE-6PILE ?auto_13688 ?auto_13689 ?auto_13690 ?auto_13691 ?auto_13692 ?auto_13693 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_13700 - BLOCK
      ?auto_13701 - BLOCK
      ?auto_13702 - BLOCK
      ?auto_13703 - BLOCK
      ?auto_13704 - BLOCK
      ?auto_13705 - BLOCK
    )
    :vars
    (
      ?auto_13706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13705 ?auto_13706 ) ( ON-TABLE ?auto_13700 ) ( not ( = ?auto_13700 ?auto_13701 ) ) ( not ( = ?auto_13700 ?auto_13702 ) ) ( not ( = ?auto_13700 ?auto_13703 ) ) ( not ( = ?auto_13700 ?auto_13704 ) ) ( not ( = ?auto_13700 ?auto_13705 ) ) ( not ( = ?auto_13700 ?auto_13706 ) ) ( not ( = ?auto_13701 ?auto_13702 ) ) ( not ( = ?auto_13701 ?auto_13703 ) ) ( not ( = ?auto_13701 ?auto_13704 ) ) ( not ( = ?auto_13701 ?auto_13705 ) ) ( not ( = ?auto_13701 ?auto_13706 ) ) ( not ( = ?auto_13702 ?auto_13703 ) ) ( not ( = ?auto_13702 ?auto_13704 ) ) ( not ( = ?auto_13702 ?auto_13705 ) ) ( not ( = ?auto_13702 ?auto_13706 ) ) ( not ( = ?auto_13703 ?auto_13704 ) ) ( not ( = ?auto_13703 ?auto_13705 ) ) ( not ( = ?auto_13703 ?auto_13706 ) ) ( not ( = ?auto_13704 ?auto_13705 ) ) ( not ( = ?auto_13704 ?auto_13706 ) ) ( not ( = ?auto_13705 ?auto_13706 ) ) ( ON ?auto_13704 ?auto_13705 ) ( ON ?auto_13703 ?auto_13704 ) ( ON ?auto_13702 ?auto_13703 ) ( CLEAR ?auto_13700 ) ( ON ?auto_13701 ?auto_13702 ) ( CLEAR ?auto_13701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13700 ?auto_13701 )
      ( MAKE-6PILE ?auto_13700 ?auto_13701 ?auto_13702 ?auto_13703 ?auto_13704 ?auto_13705 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_13713 - BLOCK
      ?auto_13714 - BLOCK
      ?auto_13715 - BLOCK
      ?auto_13716 - BLOCK
      ?auto_13717 - BLOCK
      ?auto_13718 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13718 ) ( ON-TABLE ?auto_13713 ) ( not ( = ?auto_13713 ?auto_13714 ) ) ( not ( = ?auto_13713 ?auto_13715 ) ) ( not ( = ?auto_13713 ?auto_13716 ) ) ( not ( = ?auto_13713 ?auto_13717 ) ) ( not ( = ?auto_13713 ?auto_13718 ) ) ( not ( = ?auto_13714 ?auto_13715 ) ) ( not ( = ?auto_13714 ?auto_13716 ) ) ( not ( = ?auto_13714 ?auto_13717 ) ) ( not ( = ?auto_13714 ?auto_13718 ) ) ( not ( = ?auto_13715 ?auto_13716 ) ) ( not ( = ?auto_13715 ?auto_13717 ) ) ( not ( = ?auto_13715 ?auto_13718 ) ) ( not ( = ?auto_13716 ?auto_13717 ) ) ( not ( = ?auto_13716 ?auto_13718 ) ) ( not ( = ?auto_13717 ?auto_13718 ) ) ( ON ?auto_13717 ?auto_13718 ) ( ON ?auto_13716 ?auto_13717 ) ( ON ?auto_13715 ?auto_13716 ) ( CLEAR ?auto_13713 ) ( ON ?auto_13714 ?auto_13715 ) ( CLEAR ?auto_13714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13713 ?auto_13714 )
      ( MAKE-6PILE ?auto_13713 ?auto_13714 ?auto_13715 ?auto_13716 ?auto_13717 ?auto_13718 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_13725 - BLOCK
      ?auto_13726 - BLOCK
      ?auto_13727 - BLOCK
      ?auto_13728 - BLOCK
      ?auto_13729 - BLOCK
      ?auto_13730 - BLOCK
    )
    :vars
    (
      ?auto_13731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13730 ?auto_13731 ) ( not ( = ?auto_13725 ?auto_13726 ) ) ( not ( = ?auto_13725 ?auto_13727 ) ) ( not ( = ?auto_13725 ?auto_13728 ) ) ( not ( = ?auto_13725 ?auto_13729 ) ) ( not ( = ?auto_13725 ?auto_13730 ) ) ( not ( = ?auto_13725 ?auto_13731 ) ) ( not ( = ?auto_13726 ?auto_13727 ) ) ( not ( = ?auto_13726 ?auto_13728 ) ) ( not ( = ?auto_13726 ?auto_13729 ) ) ( not ( = ?auto_13726 ?auto_13730 ) ) ( not ( = ?auto_13726 ?auto_13731 ) ) ( not ( = ?auto_13727 ?auto_13728 ) ) ( not ( = ?auto_13727 ?auto_13729 ) ) ( not ( = ?auto_13727 ?auto_13730 ) ) ( not ( = ?auto_13727 ?auto_13731 ) ) ( not ( = ?auto_13728 ?auto_13729 ) ) ( not ( = ?auto_13728 ?auto_13730 ) ) ( not ( = ?auto_13728 ?auto_13731 ) ) ( not ( = ?auto_13729 ?auto_13730 ) ) ( not ( = ?auto_13729 ?auto_13731 ) ) ( not ( = ?auto_13730 ?auto_13731 ) ) ( ON ?auto_13729 ?auto_13730 ) ( ON ?auto_13728 ?auto_13729 ) ( ON ?auto_13727 ?auto_13728 ) ( ON ?auto_13726 ?auto_13727 ) ( ON ?auto_13725 ?auto_13726 ) ( CLEAR ?auto_13725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13725 )
      ( MAKE-6PILE ?auto_13725 ?auto_13726 ?auto_13727 ?auto_13728 ?auto_13729 ?auto_13730 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_13738 - BLOCK
      ?auto_13739 - BLOCK
      ?auto_13740 - BLOCK
      ?auto_13741 - BLOCK
      ?auto_13742 - BLOCK
      ?auto_13743 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13743 ) ( not ( = ?auto_13738 ?auto_13739 ) ) ( not ( = ?auto_13738 ?auto_13740 ) ) ( not ( = ?auto_13738 ?auto_13741 ) ) ( not ( = ?auto_13738 ?auto_13742 ) ) ( not ( = ?auto_13738 ?auto_13743 ) ) ( not ( = ?auto_13739 ?auto_13740 ) ) ( not ( = ?auto_13739 ?auto_13741 ) ) ( not ( = ?auto_13739 ?auto_13742 ) ) ( not ( = ?auto_13739 ?auto_13743 ) ) ( not ( = ?auto_13740 ?auto_13741 ) ) ( not ( = ?auto_13740 ?auto_13742 ) ) ( not ( = ?auto_13740 ?auto_13743 ) ) ( not ( = ?auto_13741 ?auto_13742 ) ) ( not ( = ?auto_13741 ?auto_13743 ) ) ( not ( = ?auto_13742 ?auto_13743 ) ) ( ON ?auto_13742 ?auto_13743 ) ( ON ?auto_13741 ?auto_13742 ) ( ON ?auto_13740 ?auto_13741 ) ( ON ?auto_13739 ?auto_13740 ) ( ON ?auto_13738 ?auto_13739 ) ( CLEAR ?auto_13738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13738 )
      ( MAKE-6PILE ?auto_13738 ?auto_13739 ?auto_13740 ?auto_13741 ?auto_13742 ?auto_13743 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_13750 - BLOCK
      ?auto_13751 - BLOCK
      ?auto_13752 - BLOCK
      ?auto_13753 - BLOCK
      ?auto_13754 - BLOCK
      ?auto_13755 - BLOCK
    )
    :vars
    (
      ?auto_13756 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13750 ?auto_13751 ) ) ( not ( = ?auto_13750 ?auto_13752 ) ) ( not ( = ?auto_13750 ?auto_13753 ) ) ( not ( = ?auto_13750 ?auto_13754 ) ) ( not ( = ?auto_13750 ?auto_13755 ) ) ( not ( = ?auto_13751 ?auto_13752 ) ) ( not ( = ?auto_13751 ?auto_13753 ) ) ( not ( = ?auto_13751 ?auto_13754 ) ) ( not ( = ?auto_13751 ?auto_13755 ) ) ( not ( = ?auto_13752 ?auto_13753 ) ) ( not ( = ?auto_13752 ?auto_13754 ) ) ( not ( = ?auto_13752 ?auto_13755 ) ) ( not ( = ?auto_13753 ?auto_13754 ) ) ( not ( = ?auto_13753 ?auto_13755 ) ) ( not ( = ?auto_13754 ?auto_13755 ) ) ( ON ?auto_13750 ?auto_13756 ) ( not ( = ?auto_13755 ?auto_13756 ) ) ( not ( = ?auto_13754 ?auto_13756 ) ) ( not ( = ?auto_13753 ?auto_13756 ) ) ( not ( = ?auto_13752 ?auto_13756 ) ) ( not ( = ?auto_13751 ?auto_13756 ) ) ( not ( = ?auto_13750 ?auto_13756 ) ) ( ON ?auto_13751 ?auto_13750 ) ( ON ?auto_13752 ?auto_13751 ) ( ON ?auto_13753 ?auto_13752 ) ( ON ?auto_13754 ?auto_13753 ) ( ON ?auto_13755 ?auto_13754 ) ( CLEAR ?auto_13755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_13755 ?auto_13754 ?auto_13753 ?auto_13752 ?auto_13751 ?auto_13750 )
      ( MAKE-6PILE ?auto_13750 ?auto_13751 ?auto_13752 ?auto_13753 ?auto_13754 ?auto_13755 ) )
  )

)

