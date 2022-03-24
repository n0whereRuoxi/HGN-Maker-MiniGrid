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
      ?auto_35266 - BLOCK
    )
    :vars
    (
      ?auto_35267 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35266 ?auto_35267 ) ( CLEAR ?auto_35266 ) ( HAND-EMPTY ) ( not ( = ?auto_35266 ?auto_35267 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35266 ?auto_35267 )
      ( !PUTDOWN ?auto_35266 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35273 - BLOCK
      ?auto_35274 - BLOCK
    )
    :vars
    (
      ?auto_35275 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_35273 ) ( ON ?auto_35274 ?auto_35275 ) ( CLEAR ?auto_35274 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35273 ) ( not ( = ?auto_35273 ?auto_35274 ) ) ( not ( = ?auto_35273 ?auto_35275 ) ) ( not ( = ?auto_35274 ?auto_35275 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35274 ?auto_35275 )
      ( !STACK ?auto_35274 ?auto_35273 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35283 - BLOCK
      ?auto_35284 - BLOCK
    )
    :vars
    (
      ?auto_35285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35284 ?auto_35285 ) ( not ( = ?auto_35283 ?auto_35284 ) ) ( not ( = ?auto_35283 ?auto_35285 ) ) ( not ( = ?auto_35284 ?auto_35285 ) ) ( ON ?auto_35283 ?auto_35284 ) ( CLEAR ?auto_35283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35283 )
      ( MAKE-2PILE ?auto_35283 ?auto_35284 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35294 - BLOCK
      ?auto_35295 - BLOCK
      ?auto_35296 - BLOCK
    )
    :vars
    (
      ?auto_35297 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_35295 ) ( ON ?auto_35296 ?auto_35297 ) ( CLEAR ?auto_35296 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35294 ) ( ON ?auto_35295 ?auto_35294 ) ( not ( = ?auto_35294 ?auto_35295 ) ) ( not ( = ?auto_35294 ?auto_35296 ) ) ( not ( = ?auto_35294 ?auto_35297 ) ) ( not ( = ?auto_35295 ?auto_35296 ) ) ( not ( = ?auto_35295 ?auto_35297 ) ) ( not ( = ?auto_35296 ?auto_35297 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35296 ?auto_35297 )
      ( !STACK ?auto_35296 ?auto_35295 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35308 - BLOCK
      ?auto_35309 - BLOCK
      ?auto_35310 - BLOCK
    )
    :vars
    (
      ?auto_35311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35310 ?auto_35311 ) ( ON-TABLE ?auto_35308 ) ( not ( = ?auto_35308 ?auto_35309 ) ) ( not ( = ?auto_35308 ?auto_35310 ) ) ( not ( = ?auto_35308 ?auto_35311 ) ) ( not ( = ?auto_35309 ?auto_35310 ) ) ( not ( = ?auto_35309 ?auto_35311 ) ) ( not ( = ?auto_35310 ?auto_35311 ) ) ( CLEAR ?auto_35308 ) ( ON ?auto_35309 ?auto_35310 ) ( CLEAR ?auto_35309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35308 ?auto_35309 )
      ( MAKE-3PILE ?auto_35308 ?auto_35309 ?auto_35310 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35322 - BLOCK
      ?auto_35323 - BLOCK
      ?auto_35324 - BLOCK
    )
    :vars
    (
      ?auto_35325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35324 ?auto_35325 ) ( not ( = ?auto_35322 ?auto_35323 ) ) ( not ( = ?auto_35322 ?auto_35324 ) ) ( not ( = ?auto_35322 ?auto_35325 ) ) ( not ( = ?auto_35323 ?auto_35324 ) ) ( not ( = ?auto_35323 ?auto_35325 ) ) ( not ( = ?auto_35324 ?auto_35325 ) ) ( ON ?auto_35323 ?auto_35324 ) ( ON ?auto_35322 ?auto_35323 ) ( CLEAR ?auto_35322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35322 )
      ( MAKE-3PILE ?auto_35322 ?auto_35323 ?auto_35324 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35337 - BLOCK
      ?auto_35338 - BLOCK
      ?auto_35339 - BLOCK
      ?auto_35340 - BLOCK
    )
    :vars
    (
      ?auto_35341 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_35339 ) ( ON ?auto_35340 ?auto_35341 ) ( CLEAR ?auto_35340 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35337 ) ( ON ?auto_35338 ?auto_35337 ) ( ON ?auto_35339 ?auto_35338 ) ( not ( = ?auto_35337 ?auto_35338 ) ) ( not ( = ?auto_35337 ?auto_35339 ) ) ( not ( = ?auto_35337 ?auto_35340 ) ) ( not ( = ?auto_35337 ?auto_35341 ) ) ( not ( = ?auto_35338 ?auto_35339 ) ) ( not ( = ?auto_35338 ?auto_35340 ) ) ( not ( = ?auto_35338 ?auto_35341 ) ) ( not ( = ?auto_35339 ?auto_35340 ) ) ( not ( = ?auto_35339 ?auto_35341 ) ) ( not ( = ?auto_35340 ?auto_35341 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35340 ?auto_35341 )
      ( !STACK ?auto_35340 ?auto_35339 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35355 - BLOCK
      ?auto_35356 - BLOCK
      ?auto_35357 - BLOCK
      ?auto_35358 - BLOCK
    )
    :vars
    (
      ?auto_35359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35358 ?auto_35359 ) ( ON-TABLE ?auto_35355 ) ( ON ?auto_35356 ?auto_35355 ) ( not ( = ?auto_35355 ?auto_35356 ) ) ( not ( = ?auto_35355 ?auto_35357 ) ) ( not ( = ?auto_35355 ?auto_35358 ) ) ( not ( = ?auto_35355 ?auto_35359 ) ) ( not ( = ?auto_35356 ?auto_35357 ) ) ( not ( = ?auto_35356 ?auto_35358 ) ) ( not ( = ?auto_35356 ?auto_35359 ) ) ( not ( = ?auto_35357 ?auto_35358 ) ) ( not ( = ?auto_35357 ?auto_35359 ) ) ( not ( = ?auto_35358 ?auto_35359 ) ) ( CLEAR ?auto_35356 ) ( ON ?auto_35357 ?auto_35358 ) ( CLEAR ?auto_35357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35355 ?auto_35356 ?auto_35357 )
      ( MAKE-4PILE ?auto_35355 ?auto_35356 ?auto_35357 ?auto_35358 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35373 - BLOCK
      ?auto_35374 - BLOCK
      ?auto_35375 - BLOCK
      ?auto_35376 - BLOCK
    )
    :vars
    (
      ?auto_35377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35376 ?auto_35377 ) ( ON-TABLE ?auto_35373 ) ( not ( = ?auto_35373 ?auto_35374 ) ) ( not ( = ?auto_35373 ?auto_35375 ) ) ( not ( = ?auto_35373 ?auto_35376 ) ) ( not ( = ?auto_35373 ?auto_35377 ) ) ( not ( = ?auto_35374 ?auto_35375 ) ) ( not ( = ?auto_35374 ?auto_35376 ) ) ( not ( = ?auto_35374 ?auto_35377 ) ) ( not ( = ?auto_35375 ?auto_35376 ) ) ( not ( = ?auto_35375 ?auto_35377 ) ) ( not ( = ?auto_35376 ?auto_35377 ) ) ( ON ?auto_35375 ?auto_35376 ) ( CLEAR ?auto_35373 ) ( ON ?auto_35374 ?auto_35375 ) ( CLEAR ?auto_35374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35373 ?auto_35374 )
      ( MAKE-4PILE ?auto_35373 ?auto_35374 ?auto_35375 ?auto_35376 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35391 - BLOCK
      ?auto_35392 - BLOCK
      ?auto_35393 - BLOCK
      ?auto_35394 - BLOCK
    )
    :vars
    (
      ?auto_35395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35394 ?auto_35395 ) ( not ( = ?auto_35391 ?auto_35392 ) ) ( not ( = ?auto_35391 ?auto_35393 ) ) ( not ( = ?auto_35391 ?auto_35394 ) ) ( not ( = ?auto_35391 ?auto_35395 ) ) ( not ( = ?auto_35392 ?auto_35393 ) ) ( not ( = ?auto_35392 ?auto_35394 ) ) ( not ( = ?auto_35392 ?auto_35395 ) ) ( not ( = ?auto_35393 ?auto_35394 ) ) ( not ( = ?auto_35393 ?auto_35395 ) ) ( not ( = ?auto_35394 ?auto_35395 ) ) ( ON ?auto_35393 ?auto_35394 ) ( ON ?auto_35392 ?auto_35393 ) ( ON ?auto_35391 ?auto_35392 ) ( CLEAR ?auto_35391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35391 )
      ( MAKE-4PILE ?auto_35391 ?auto_35392 ?auto_35393 ?auto_35394 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35410 - BLOCK
      ?auto_35411 - BLOCK
      ?auto_35412 - BLOCK
      ?auto_35413 - BLOCK
      ?auto_35414 - BLOCK
    )
    :vars
    (
      ?auto_35415 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_35413 ) ( ON ?auto_35414 ?auto_35415 ) ( CLEAR ?auto_35414 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35410 ) ( ON ?auto_35411 ?auto_35410 ) ( ON ?auto_35412 ?auto_35411 ) ( ON ?auto_35413 ?auto_35412 ) ( not ( = ?auto_35410 ?auto_35411 ) ) ( not ( = ?auto_35410 ?auto_35412 ) ) ( not ( = ?auto_35410 ?auto_35413 ) ) ( not ( = ?auto_35410 ?auto_35414 ) ) ( not ( = ?auto_35410 ?auto_35415 ) ) ( not ( = ?auto_35411 ?auto_35412 ) ) ( not ( = ?auto_35411 ?auto_35413 ) ) ( not ( = ?auto_35411 ?auto_35414 ) ) ( not ( = ?auto_35411 ?auto_35415 ) ) ( not ( = ?auto_35412 ?auto_35413 ) ) ( not ( = ?auto_35412 ?auto_35414 ) ) ( not ( = ?auto_35412 ?auto_35415 ) ) ( not ( = ?auto_35413 ?auto_35414 ) ) ( not ( = ?auto_35413 ?auto_35415 ) ) ( not ( = ?auto_35414 ?auto_35415 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35414 ?auto_35415 )
      ( !STACK ?auto_35414 ?auto_35413 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35432 - BLOCK
      ?auto_35433 - BLOCK
      ?auto_35434 - BLOCK
      ?auto_35435 - BLOCK
      ?auto_35436 - BLOCK
    )
    :vars
    (
      ?auto_35437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35436 ?auto_35437 ) ( ON-TABLE ?auto_35432 ) ( ON ?auto_35433 ?auto_35432 ) ( ON ?auto_35434 ?auto_35433 ) ( not ( = ?auto_35432 ?auto_35433 ) ) ( not ( = ?auto_35432 ?auto_35434 ) ) ( not ( = ?auto_35432 ?auto_35435 ) ) ( not ( = ?auto_35432 ?auto_35436 ) ) ( not ( = ?auto_35432 ?auto_35437 ) ) ( not ( = ?auto_35433 ?auto_35434 ) ) ( not ( = ?auto_35433 ?auto_35435 ) ) ( not ( = ?auto_35433 ?auto_35436 ) ) ( not ( = ?auto_35433 ?auto_35437 ) ) ( not ( = ?auto_35434 ?auto_35435 ) ) ( not ( = ?auto_35434 ?auto_35436 ) ) ( not ( = ?auto_35434 ?auto_35437 ) ) ( not ( = ?auto_35435 ?auto_35436 ) ) ( not ( = ?auto_35435 ?auto_35437 ) ) ( not ( = ?auto_35436 ?auto_35437 ) ) ( CLEAR ?auto_35434 ) ( ON ?auto_35435 ?auto_35436 ) ( CLEAR ?auto_35435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35432 ?auto_35433 ?auto_35434 ?auto_35435 )
      ( MAKE-5PILE ?auto_35432 ?auto_35433 ?auto_35434 ?auto_35435 ?auto_35436 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35454 - BLOCK
      ?auto_35455 - BLOCK
      ?auto_35456 - BLOCK
      ?auto_35457 - BLOCK
      ?auto_35458 - BLOCK
    )
    :vars
    (
      ?auto_35459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35458 ?auto_35459 ) ( ON-TABLE ?auto_35454 ) ( ON ?auto_35455 ?auto_35454 ) ( not ( = ?auto_35454 ?auto_35455 ) ) ( not ( = ?auto_35454 ?auto_35456 ) ) ( not ( = ?auto_35454 ?auto_35457 ) ) ( not ( = ?auto_35454 ?auto_35458 ) ) ( not ( = ?auto_35454 ?auto_35459 ) ) ( not ( = ?auto_35455 ?auto_35456 ) ) ( not ( = ?auto_35455 ?auto_35457 ) ) ( not ( = ?auto_35455 ?auto_35458 ) ) ( not ( = ?auto_35455 ?auto_35459 ) ) ( not ( = ?auto_35456 ?auto_35457 ) ) ( not ( = ?auto_35456 ?auto_35458 ) ) ( not ( = ?auto_35456 ?auto_35459 ) ) ( not ( = ?auto_35457 ?auto_35458 ) ) ( not ( = ?auto_35457 ?auto_35459 ) ) ( not ( = ?auto_35458 ?auto_35459 ) ) ( ON ?auto_35457 ?auto_35458 ) ( CLEAR ?auto_35455 ) ( ON ?auto_35456 ?auto_35457 ) ( CLEAR ?auto_35456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35454 ?auto_35455 ?auto_35456 )
      ( MAKE-5PILE ?auto_35454 ?auto_35455 ?auto_35456 ?auto_35457 ?auto_35458 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35476 - BLOCK
      ?auto_35477 - BLOCK
      ?auto_35478 - BLOCK
      ?auto_35479 - BLOCK
      ?auto_35480 - BLOCK
    )
    :vars
    (
      ?auto_35481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35480 ?auto_35481 ) ( ON-TABLE ?auto_35476 ) ( not ( = ?auto_35476 ?auto_35477 ) ) ( not ( = ?auto_35476 ?auto_35478 ) ) ( not ( = ?auto_35476 ?auto_35479 ) ) ( not ( = ?auto_35476 ?auto_35480 ) ) ( not ( = ?auto_35476 ?auto_35481 ) ) ( not ( = ?auto_35477 ?auto_35478 ) ) ( not ( = ?auto_35477 ?auto_35479 ) ) ( not ( = ?auto_35477 ?auto_35480 ) ) ( not ( = ?auto_35477 ?auto_35481 ) ) ( not ( = ?auto_35478 ?auto_35479 ) ) ( not ( = ?auto_35478 ?auto_35480 ) ) ( not ( = ?auto_35478 ?auto_35481 ) ) ( not ( = ?auto_35479 ?auto_35480 ) ) ( not ( = ?auto_35479 ?auto_35481 ) ) ( not ( = ?auto_35480 ?auto_35481 ) ) ( ON ?auto_35479 ?auto_35480 ) ( ON ?auto_35478 ?auto_35479 ) ( CLEAR ?auto_35476 ) ( ON ?auto_35477 ?auto_35478 ) ( CLEAR ?auto_35477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35476 ?auto_35477 )
      ( MAKE-5PILE ?auto_35476 ?auto_35477 ?auto_35478 ?auto_35479 ?auto_35480 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35498 - BLOCK
      ?auto_35499 - BLOCK
      ?auto_35500 - BLOCK
      ?auto_35501 - BLOCK
      ?auto_35502 - BLOCK
    )
    :vars
    (
      ?auto_35503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35502 ?auto_35503 ) ( not ( = ?auto_35498 ?auto_35499 ) ) ( not ( = ?auto_35498 ?auto_35500 ) ) ( not ( = ?auto_35498 ?auto_35501 ) ) ( not ( = ?auto_35498 ?auto_35502 ) ) ( not ( = ?auto_35498 ?auto_35503 ) ) ( not ( = ?auto_35499 ?auto_35500 ) ) ( not ( = ?auto_35499 ?auto_35501 ) ) ( not ( = ?auto_35499 ?auto_35502 ) ) ( not ( = ?auto_35499 ?auto_35503 ) ) ( not ( = ?auto_35500 ?auto_35501 ) ) ( not ( = ?auto_35500 ?auto_35502 ) ) ( not ( = ?auto_35500 ?auto_35503 ) ) ( not ( = ?auto_35501 ?auto_35502 ) ) ( not ( = ?auto_35501 ?auto_35503 ) ) ( not ( = ?auto_35502 ?auto_35503 ) ) ( ON ?auto_35501 ?auto_35502 ) ( ON ?auto_35500 ?auto_35501 ) ( ON ?auto_35499 ?auto_35500 ) ( ON ?auto_35498 ?auto_35499 ) ( CLEAR ?auto_35498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35498 )
      ( MAKE-5PILE ?auto_35498 ?auto_35499 ?auto_35500 ?auto_35501 ?auto_35502 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_35521 - BLOCK
      ?auto_35522 - BLOCK
      ?auto_35523 - BLOCK
      ?auto_35524 - BLOCK
      ?auto_35525 - BLOCK
      ?auto_35526 - BLOCK
    )
    :vars
    (
      ?auto_35527 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_35525 ) ( ON ?auto_35526 ?auto_35527 ) ( CLEAR ?auto_35526 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35521 ) ( ON ?auto_35522 ?auto_35521 ) ( ON ?auto_35523 ?auto_35522 ) ( ON ?auto_35524 ?auto_35523 ) ( ON ?auto_35525 ?auto_35524 ) ( not ( = ?auto_35521 ?auto_35522 ) ) ( not ( = ?auto_35521 ?auto_35523 ) ) ( not ( = ?auto_35521 ?auto_35524 ) ) ( not ( = ?auto_35521 ?auto_35525 ) ) ( not ( = ?auto_35521 ?auto_35526 ) ) ( not ( = ?auto_35521 ?auto_35527 ) ) ( not ( = ?auto_35522 ?auto_35523 ) ) ( not ( = ?auto_35522 ?auto_35524 ) ) ( not ( = ?auto_35522 ?auto_35525 ) ) ( not ( = ?auto_35522 ?auto_35526 ) ) ( not ( = ?auto_35522 ?auto_35527 ) ) ( not ( = ?auto_35523 ?auto_35524 ) ) ( not ( = ?auto_35523 ?auto_35525 ) ) ( not ( = ?auto_35523 ?auto_35526 ) ) ( not ( = ?auto_35523 ?auto_35527 ) ) ( not ( = ?auto_35524 ?auto_35525 ) ) ( not ( = ?auto_35524 ?auto_35526 ) ) ( not ( = ?auto_35524 ?auto_35527 ) ) ( not ( = ?auto_35525 ?auto_35526 ) ) ( not ( = ?auto_35525 ?auto_35527 ) ) ( not ( = ?auto_35526 ?auto_35527 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35526 ?auto_35527 )
      ( !STACK ?auto_35526 ?auto_35525 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_35547 - BLOCK
      ?auto_35548 - BLOCK
      ?auto_35549 - BLOCK
      ?auto_35550 - BLOCK
      ?auto_35551 - BLOCK
      ?auto_35552 - BLOCK
    )
    :vars
    (
      ?auto_35553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35552 ?auto_35553 ) ( ON-TABLE ?auto_35547 ) ( ON ?auto_35548 ?auto_35547 ) ( ON ?auto_35549 ?auto_35548 ) ( ON ?auto_35550 ?auto_35549 ) ( not ( = ?auto_35547 ?auto_35548 ) ) ( not ( = ?auto_35547 ?auto_35549 ) ) ( not ( = ?auto_35547 ?auto_35550 ) ) ( not ( = ?auto_35547 ?auto_35551 ) ) ( not ( = ?auto_35547 ?auto_35552 ) ) ( not ( = ?auto_35547 ?auto_35553 ) ) ( not ( = ?auto_35548 ?auto_35549 ) ) ( not ( = ?auto_35548 ?auto_35550 ) ) ( not ( = ?auto_35548 ?auto_35551 ) ) ( not ( = ?auto_35548 ?auto_35552 ) ) ( not ( = ?auto_35548 ?auto_35553 ) ) ( not ( = ?auto_35549 ?auto_35550 ) ) ( not ( = ?auto_35549 ?auto_35551 ) ) ( not ( = ?auto_35549 ?auto_35552 ) ) ( not ( = ?auto_35549 ?auto_35553 ) ) ( not ( = ?auto_35550 ?auto_35551 ) ) ( not ( = ?auto_35550 ?auto_35552 ) ) ( not ( = ?auto_35550 ?auto_35553 ) ) ( not ( = ?auto_35551 ?auto_35552 ) ) ( not ( = ?auto_35551 ?auto_35553 ) ) ( not ( = ?auto_35552 ?auto_35553 ) ) ( CLEAR ?auto_35550 ) ( ON ?auto_35551 ?auto_35552 ) ( CLEAR ?auto_35551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35547 ?auto_35548 ?auto_35549 ?auto_35550 ?auto_35551 )
      ( MAKE-6PILE ?auto_35547 ?auto_35548 ?auto_35549 ?auto_35550 ?auto_35551 ?auto_35552 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_35573 - BLOCK
      ?auto_35574 - BLOCK
      ?auto_35575 - BLOCK
      ?auto_35576 - BLOCK
      ?auto_35577 - BLOCK
      ?auto_35578 - BLOCK
    )
    :vars
    (
      ?auto_35579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35578 ?auto_35579 ) ( ON-TABLE ?auto_35573 ) ( ON ?auto_35574 ?auto_35573 ) ( ON ?auto_35575 ?auto_35574 ) ( not ( = ?auto_35573 ?auto_35574 ) ) ( not ( = ?auto_35573 ?auto_35575 ) ) ( not ( = ?auto_35573 ?auto_35576 ) ) ( not ( = ?auto_35573 ?auto_35577 ) ) ( not ( = ?auto_35573 ?auto_35578 ) ) ( not ( = ?auto_35573 ?auto_35579 ) ) ( not ( = ?auto_35574 ?auto_35575 ) ) ( not ( = ?auto_35574 ?auto_35576 ) ) ( not ( = ?auto_35574 ?auto_35577 ) ) ( not ( = ?auto_35574 ?auto_35578 ) ) ( not ( = ?auto_35574 ?auto_35579 ) ) ( not ( = ?auto_35575 ?auto_35576 ) ) ( not ( = ?auto_35575 ?auto_35577 ) ) ( not ( = ?auto_35575 ?auto_35578 ) ) ( not ( = ?auto_35575 ?auto_35579 ) ) ( not ( = ?auto_35576 ?auto_35577 ) ) ( not ( = ?auto_35576 ?auto_35578 ) ) ( not ( = ?auto_35576 ?auto_35579 ) ) ( not ( = ?auto_35577 ?auto_35578 ) ) ( not ( = ?auto_35577 ?auto_35579 ) ) ( not ( = ?auto_35578 ?auto_35579 ) ) ( ON ?auto_35577 ?auto_35578 ) ( CLEAR ?auto_35575 ) ( ON ?auto_35576 ?auto_35577 ) ( CLEAR ?auto_35576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35573 ?auto_35574 ?auto_35575 ?auto_35576 )
      ( MAKE-6PILE ?auto_35573 ?auto_35574 ?auto_35575 ?auto_35576 ?auto_35577 ?auto_35578 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_35599 - BLOCK
      ?auto_35600 - BLOCK
      ?auto_35601 - BLOCK
      ?auto_35602 - BLOCK
      ?auto_35603 - BLOCK
      ?auto_35604 - BLOCK
    )
    :vars
    (
      ?auto_35605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35604 ?auto_35605 ) ( ON-TABLE ?auto_35599 ) ( ON ?auto_35600 ?auto_35599 ) ( not ( = ?auto_35599 ?auto_35600 ) ) ( not ( = ?auto_35599 ?auto_35601 ) ) ( not ( = ?auto_35599 ?auto_35602 ) ) ( not ( = ?auto_35599 ?auto_35603 ) ) ( not ( = ?auto_35599 ?auto_35604 ) ) ( not ( = ?auto_35599 ?auto_35605 ) ) ( not ( = ?auto_35600 ?auto_35601 ) ) ( not ( = ?auto_35600 ?auto_35602 ) ) ( not ( = ?auto_35600 ?auto_35603 ) ) ( not ( = ?auto_35600 ?auto_35604 ) ) ( not ( = ?auto_35600 ?auto_35605 ) ) ( not ( = ?auto_35601 ?auto_35602 ) ) ( not ( = ?auto_35601 ?auto_35603 ) ) ( not ( = ?auto_35601 ?auto_35604 ) ) ( not ( = ?auto_35601 ?auto_35605 ) ) ( not ( = ?auto_35602 ?auto_35603 ) ) ( not ( = ?auto_35602 ?auto_35604 ) ) ( not ( = ?auto_35602 ?auto_35605 ) ) ( not ( = ?auto_35603 ?auto_35604 ) ) ( not ( = ?auto_35603 ?auto_35605 ) ) ( not ( = ?auto_35604 ?auto_35605 ) ) ( ON ?auto_35603 ?auto_35604 ) ( ON ?auto_35602 ?auto_35603 ) ( CLEAR ?auto_35600 ) ( ON ?auto_35601 ?auto_35602 ) ( CLEAR ?auto_35601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35599 ?auto_35600 ?auto_35601 )
      ( MAKE-6PILE ?auto_35599 ?auto_35600 ?auto_35601 ?auto_35602 ?auto_35603 ?auto_35604 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_35625 - BLOCK
      ?auto_35626 - BLOCK
      ?auto_35627 - BLOCK
      ?auto_35628 - BLOCK
      ?auto_35629 - BLOCK
      ?auto_35630 - BLOCK
    )
    :vars
    (
      ?auto_35631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35630 ?auto_35631 ) ( ON-TABLE ?auto_35625 ) ( not ( = ?auto_35625 ?auto_35626 ) ) ( not ( = ?auto_35625 ?auto_35627 ) ) ( not ( = ?auto_35625 ?auto_35628 ) ) ( not ( = ?auto_35625 ?auto_35629 ) ) ( not ( = ?auto_35625 ?auto_35630 ) ) ( not ( = ?auto_35625 ?auto_35631 ) ) ( not ( = ?auto_35626 ?auto_35627 ) ) ( not ( = ?auto_35626 ?auto_35628 ) ) ( not ( = ?auto_35626 ?auto_35629 ) ) ( not ( = ?auto_35626 ?auto_35630 ) ) ( not ( = ?auto_35626 ?auto_35631 ) ) ( not ( = ?auto_35627 ?auto_35628 ) ) ( not ( = ?auto_35627 ?auto_35629 ) ) ( not ( = ?auto_35627 ?auto_35630 ) ) ( not ( = ?auto_35627 ?auto_35631 ) ) ( not ( = ?auto_35628 ?auto_35629 ) ) ( not ( = ?auto_35628 ?auto_35630 ) ) ( not ( = ?auto_35628 ?auto_35631 ) ) ( not ( = ?auto_35629 ?auto_35630 ) ) ( not ( = ?auto_35629 ?auto_35631 ) ) ( not ( = ?auto_35630 ?auto_35631 ) ) ( ON ?auto_35629 ?auto_35630 ) ( ON ?auto_35628 ?auto_35629 ) ( ON ?auto_35627 ?auto_35628 ) ( CLEAR ?auto_35625 ) ( ON ?auto_35626 ?auto_35627 ) ( CLEAR ?auto_35626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35625 ?auto_35626 )
      ( MAKE-6PILE ?auto_35625 ?auto_35626 ?auto_35627 ?auto_35628 ?auto_35629 ?auto_35630 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_35651 - BLOCK
      ?auto_35652 - BLOCK
      ?auto_35653 - BLOCK
      ?auto_35654 - BLOCK
      ?auto_35655 - BLOCK
      ?auto_35656 - BLOCK
    )
    :vars
    (
      ?auto_35657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35656 ?auto_35657 ) ( not ( = ?auto_35651 ?auto_35652 ) ) ( not ( = ?auto_35651 ?auto_35653 ) ) ( not ( = ?auto_35651 ?auto_35654 ) ) ( not ( = ?auto_35651 ?auto_35655 ) ) ( not ( = ?auto_35651 ?auto_35656 ) ) ( not ( = ?auto_35651 ?auto_35657 ) ) ( not ( = ?auto_35652 ?auto_35653 ) ) ( not ( = ?auto_35652 ?auto_35654 ) ) ( not ( = ?auto_35652 ?auto_35655 ) ) ( not ( = ?auto_35652 ?auto_35656 ) ) ( not ( = ?auto_35652 ?auto_35657 ) ) ( not ( = ?auto_35653 ?auto_35654 ) ) ( not ( = ?auto_35653 ?auto_35655 ) ) ( not ( = ?auto_35653 ?auto_35656 ) ) ( not ( = ?auto_35653 ?auto_35657 ) ) ( not ( = ?auto_35654 ?auto_35655 ) ) ( not ( = ?auto_35654 ?auto_35656 ) ) ( not ( = ?auto_35654 ?auto_35657 ) ) ( not ( = ?auto_35655 ?auto_35656 ) ) ( not ( = ?auto_35655 ?auto_35657 ) ) ( not ( = ?auto_35656 ?auto_35657 ) ) ( ON ?auto_35655 ?auto_35656 ) ( ON ?auto_35654 ?auto_35655 ) ( ON ?auto_35653 ?auto_35654 ) ( ON ?auto_35652 ?auto_35653 ) ( ON ?auto_35651 ?auto_35652 ) ( CLEAR ?auto_35651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35651 )
      ( MAKE-6PILE ?auto_35651 ?auto_35652 ?auto_35653 ?auto_35654 ?auto_35655 ?auto_35656 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_35678 - BLOCK
      ?auto_35679 - BLOCK
      ?auto_35680 - BLOCK
      ?auto_35681 - BLOCK
      ?auto_35682 - BLOCK
      ?auto_35683 - BLOCK
      ?auto_35684 - BLOCK
    )
    :vars
    (
      ?auto_35685 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_35683 ) ( ON ?auto_35684 ?auto_35685 ) ( CLEAR ?auto_35684 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35678 ) ( ON ?auto_35679 ?auto_35678 ) ( ON ?auto_35680 ?auto_35679 ) ( ON ?auto_35681 ?auto_35680 ) ( ON ?auto_35682 ?auto_35681 ) ( ON ?auto_35683 ?auto_35682 ) ( not ( = ?auto_35678 ?auto_35679 ) ) ( not ( = ?auto_35678 ?auto_35680 ) ) ( not ( = ?auto_35678 ?auto_35681 ) ) ( not ( = ?auto_35678 ?auto_35682 ) ) ( not ( = ?auto_35678 ?auto_35683 ) ) ( not ( = ?auto_35678 ?auto_35684 ) ) ( not ( = ?auto_35678 ?auto_35685 ) ) ( not ( = ?auto_35679 ?auto_35680 ) ) ( not ( = ?auto_35679 ?auto_35681 ) ) ( not ( = ?auto_35679 ?auto_35682 ) ) ( not ( = ?auto_35679 ?auto_35683 ) ) ( not ( = ?auto_35679 ?auto_35684 ) ) ( not ( = ?auto_35679 ?auto_35685 ) ) ( not ( = ?auto_35680 ?auto_35681 ) ) ( not ( = ?auto_35680 ?auto_35682 ) ) ( not ( = ?auto_35680 ?auto_35683 ) ) ( not ( = ?auto_35680 ?auto_35684 ) ) ( not ( = ?auto_35680 ?auto_35685 ) ) ( not ( = ?auto_35681 ?auto_35682 ) ) ( not ( = ?auto_35681 ?auto_35683 ) ) ( not ( = ?auto_35681 ?auto_35684 ) ) ( not ( = ?auto_35681 ?auto_35685 ) ) ( not ( = ?auto_35682 ?auto_35683 ) ) ( not ( = ?auto_35682 ?auto_35684 ) ) ( not ( = ?auto_35682 ?auto_35685 ) ) ( not ( = ?auto_35683 ?auto_35684 ) ) ( not ( = ?auto_35683 ?auto_35685 ) ) ( not ( = ?auto_35684 ?auto_35685 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35684 ?auto_35685 )
      ( !STACK ?auto_35684 ?auto_35683 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_35708 - BLOCK
      ?auto_35709 - BLOCK
      ?auto_35710 - BLOCK
      ?auto_35711 - BLOCK
      ?auto_35712 - BLOCK
      ?auto_35713 - BLOCK
      ?auto_35714 - BLOCK
    )
    :vars
    (
      ?auto_35715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35714 ?auto_35715 ) ( ON-TABLE ?auto_35708 ) ( ON ?auto_35709 ?auto_35708 ) ( ON ?auto_35710 ?auto_35709 ) ( ON ?auto_35711 ?auto_35710 ) ( ON ?auto_35712 ?auto_35711 ) ( not ( = ?auto_35708 ?auto_35709 ) ) ( not ( = ?auto_35708 ?auto_35710 ) ) ( not ( = ?auto_35708 ?auto_35711 ) ) ( not ( = ?auto_35708 ?auto_35712 ) ) ( not ( = ?auto_35708 ?auto_35713 ) ) ( not ( = ?auto_35708 ?auto_35714 ) ) ( not ( = ?auto_35708 ?auto_35715 ) ) ( not ( = ?auto_35709 ?auto_35710 ) ) ( not ( = ?auto_35709 ?auto_35711 ) ) ( not ( = ?auto_35709 ?auto_35712 ) ) ( not ( = ?auto_35709 ?auto_35713 ) ) ( not ( = ?auto_35709 ?auto_35714 ) ) ( not ( = ?auto_35709 ?auto_35715 ) ) ( not ( = ?auto_35710 ?auto_35711 ) ) ( not ( = ?auto_35710 ?auto_35712 ) ) ( not ( = ?auto_35710 ?auto_35713 ) ) ( not ( = ?auto_35710 ?auto_35714 ) ) ( not ( = ?auto_35710 ?auto_35715 ) ) ( not ( = ?auto_35711 ?auto_35712 ) ) ( not ( = ?auto_35711 ?auto_35713 ) ) ( not ( = ?auto_35711 ?auto_35714 ) ) ( not ( = ?auto_35711 ?auto_35715 ) ) ( not ( = ?auto_35712 ?auto_35713 ) ) ( not ( = ?auto_35712 ?auto_35714 ) ) ( not ( = ?auto_35712 ?auto_35715 ) ) ( not ( = ?auto_35713 ?auto_35714 ) ) ( not ( = ?auto_35713 ?auto_35715 ) ) ( not ( = ?auto_35714 ?auto_35715 ) ) ( CLEAR ?auto_35712 ) ( ON ?auto_35713 ?auto_35714 ) ( CLEAR ?auto_35713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_35708 ?auto_35709 ?auto_35710 ?auto_35711 ?auto_35712 ?auto_35713 )
      ( MAKE-7PILE ?auto_35708 ?auto_35709 ?auto_35710 ?auto_35711 ?auto_35712 ?auto_35713 ?auto_35714 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_35738 - BLOCK
      ?auto_35739 - BLOCK
      ?auto_35740 - BLOCK
      ?auto_35741 - BLOCK
      ?auto_35742 - BLOCK
      ?auto_35743 - BLOCK
      ?auto_35744 - BLOCK
    )
    :vars
    (
      ?auto_35745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35744 ?auto_35745 ) ( ON-TABLE ?auto_35738 ) ( ON ?auto_35739 ?auto_35738 ) ( ON ?auto_35740 ?auto_35739 ) ( ON ?auto_35741 ?auto_35740 ) ( not ( = ?auto_35738 ?auto_35739 ) ) ( not ( = ?auto_35738 ?auto_35740 ) ) ( not ( = ?auto_35738 ?auto_35741 ) ) ( not ( = ?auto_35738 ?auto_35742 ) ) ( not ( = ?auto_35738 ?auto_35743 ) ) ( not ( = ?auto_35738 ?auto_35744 ) ) ( not ( = ?auto_35738 ?auto_35745 ) ) ( not ( = ?auto_35739 ?auto_35740 ) ) ( not ( = ?auto_35739 ?auto_35741 ) ) ( not ( = ?auto_35739 ?auto_35742 ) ) ( not ( = ?auto_35739 ?auto_35743 ) ) ( not ( = ?auto_35739 ?auto_35744 ) ) ( not ( = ?auto_35739 ?auto_35745 ) ) ( not ( = ?auto_35740 ?auto_35741 ) ) ( not ( = ?auto_35740 ?auto_35742 ) ) ( not ( = ?auto_35740 ?auto_35743 ) ) ( not ( = ?auto_35740 ?auto_35744 ) ) ( not ( = ?auto_35740 ?auto_35745 ) ) ( not ( = ?auto_35741 ?auto_35742 ) ) ( not ( = ?auto_35741 ?auto_35743 ) ) ( not ( = ?auto_35741 ?auto_35744 ) ) ( not ( = ?auto_35741 ?auto_35745 ) ) ( not ( = ?auto_35742 ?auto_35743 ) ) ( not ( = ?auto_35742 ?auto_35744 ) ) ( not ( = ?auto_35742 ?auto_35745 ) ) ( not ( = ?auto_35743 ?auto_35744 ) ) ( not ( = ?auto_35743 ?auto_35745 ) ) ( not ( = ?auto_35744 ?auto_35745 ) ) ( ON ?auto_35743 ?auto_35744 ) ( CLEAR ?auto_35741 ) ( ON ?auto_35742 ?auto_35743 ) ( CLEAR ?auto_35742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35738 ?auto_35739 ?auto_35740 ?auto_35741 ?auto_35742 )
      ( MAKE-7PILE ?auto_35738 ?auto_35739 ?auto_35740 ?auto_35741 ?auto_35742 ?auto_35743 ?auto_35744 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_35768 - BLOCK
      ?auto_35769 - BLOCK
      ?auto_35770 - BLOCK
      ?auto_35771 - BLOCK
      ?auto_35772 - BLOCK
      ?auto_35773 - BLOCK
      ?auto_35774 - BLOCK
    )
    :vars
    (
      ?auto_35775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35774 ?auto_35775 ) ( ON-TABLE ?auto_35768 ) ( ON ?auto_35769 ?auto_35768 ) ( ON ?auto_35770 ?auto_35769 ) ( not ( = ?auto_35768 ?auto_35769 ) ) ( not ( = ?auto_35768 ?auto_35770 ) ) ( not ( = ?auto_35768 ?auto_35771 ) ) ( not ( = ?auto_35768 ?auto_35772 ) ) ( not ( = ?auto_35768 ?auto_35773 ) ) ( not ( = ?auto_35768 ?auto_35774 ) ) ( not ( = ?auto_35768 ?auto_35775 ) ) ( not ( = ?auto_35769 ?auto_35770 ) ) ( not ( = ?auto_35769 ?auto_35771 ) ) ( not ( = ?auto_35769 ?auto_35772 ) ) ( not ( = ?auto_35769 ?auto_35773 ) ) ( not ( = ?auto_35769 ?auto_35774 ) ) ( not ( = ?auto_35769 ?auto_35775 ) ) ( not ( = ?auto_35770 ?auto_35771 ) ) ( not ( = ?auto_35770 ?auto_35772 ) ) ( not ( = ?auto_35770 ?auto_35773 ) ) ( not ( = ?auto_35770 ?auto_35774 ) ) ( not ( = ?auto_35770 ?auto_35775 ) ) ( not ( = ?auto_35771 ?auto_35772 ) ) ( not ( = ?auto_35771 ?auto_35773 ) ) ( not ( = ?auto_35771 ?auto_35774 ) ) ( not ( = ?auto_35771 ?auto_35775 ) ) ( not ( = ?auto_35772 ?auto_35773 ) ) ( not ( = ?auto_35772 ?auto_35774 ) ) ( not ( = ?auto_35772 ?auto_35775 ) ) ( not ( = ?auto_35773 ?auto_35774 ) ) ( not ( = ?auto_35773 ?auto_35775 ) ) ( not ( = ?auto_35774 ?auto_35775 ) ) ( ON ?auto_35773 ?auto_35774 ) ( ON ?auto_35772 ?auto_35773 ) ( CLEAR ?auto_35770 ) ( ON ?auto_35771 ?auto_35772 ) ( CLEAR ?auto_35771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35768 ?auto_35769 ?auto_35770 ?auto_35771 )
      ( MAKE-7PILE ?auto_35768 ?auto_35769 ?auto_35770 ?auto_35771 ?auto_35772 ?auto_35773 ?auto_35774 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_35798 - BLOCK
      ?auto_35799 - BLOCK
      ?auto_35800 - BLOCK
      ?auto_35801 - BLOCK
      ?auto_35802 - BLOCK
      ?auto_35803 - BLOCK
      ?auto_35804 - BLOCK
    )
    :vars
    (
      ?auto_35805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35804 ?auto_35805 ) ( ON-TABLE ?auto_35798 ) ( ON ?auto_35799 ?auto_35798 ) ( not ( = ?auto_35798 ?auto_35799 ) ) ( not ( = ?auto_35798 ?auto_35800 ) ) ( not ( = ?auto_35798 ?auto_35801 ) ) ( not ( = ?auto_35798 ?auto_35802 ) ) ( not ( = ?auto_35798 ?auto_35803 ) ) ( not ( = ?auto_35798 ?auto_35804 ) ) ( not ( = ?auto_35798 ?auto_35805 ) ) ( not ( = ?auto_35799 ?auto_35800 ) ) ( not ( = ?auto_35799 ?auto_35801 ) ) ( not ( = ?auto_35799 ?auto_35802 ) ) ( not ( = ?auto_35799 ?auto_35803 ) ) ( not ( = ?auto_35799 ?auto_35804 ) ) ( not ( = ?auto_35799 ?auto_35805 ) ) ( not ( = ?auto_35800 ?auto_35801 ) ) ( not ( = ?auto_35800 ?auto_35802 ) ) ( not ( = ?auto_35800 ?auto_35803 ) ) ( not ( = ?auto_35800 ?auto_35804 ) ) ( not ( = ?auto_35800 ?auto_35805 ) ) ( not ( = ?auto_35801 ?auto_35802 ) ) ( not ( = ?auto_35801 ?auto_35803 ) ) ( not ( = ?auto_35801 ?auto_35804 ) ) ( not ( = ?auto_35801 ?auto_35805 ) ) ( not ( = ?auto_35802 ?auto_35803 ) ) ( not ( = ?auto_35802 ?auto_35804 ) ) ( not ( = ?auto_35802 ?auto_35805 ) ) ( not ( = ?auto_35803 ?auto_35804 ) ) ( not ( = ?auto_35803 ?auto_35805 ) ) ( not ( = ?auto_35804 ?auto_35805 ) ) ( ON ?auto_35803 ?auto_35804 ) ( ON ?auto_35802 ?auto_35803 ) ( ON ?auto_35801 ?auto_35802 ) ( CLEAR ?auto_35799 ) ( ON ?auto_35800 ?auto_35801 ) ( CLEAR ?auto_35800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35798 ?auto_35799 ?auto_35800 )
      ( MAKE-7PILE ?auto_35798 ?auto_35799 ?auto_35800 ?auto_35801 ?auto_35802 ?auto_35803 ?auto_35804 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_35828 - BLOCK
      ?auto_35829 - BLOCK
      ?auto_35830 - BLOCK
      ?auto_35831 - BLOCK
      ?auto_35832 - BLOCK
      ?auto_35833 - BLOCK
      ?auto_35834 - BLOCK
    )
    :vars
    (
      ?auto_35835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35834 ?auto_35835 ) ( ON-TABLE ?auto_35828 ) ( not ( = ?auto_35828 ?auto_35829 ) ) ( not ( = ?auto_35828 ?auto_35830 ) ) ( not ( = ?auto_35828 ?auto_35831 ) ) ( not ( = ?auto_35828 ?auto_35832 ) ) ( not ( = ?auto_35828 ?auto_35833 ) ) ( not ( = ?auto_35828 ?auto_35834 ) ) ( not ( = ?auto_35828 ?auto_35835 ) ) ( not ( = ?auto_35829 ?auto_35830 ) ) ( not ( = ?auto_35829 ?auto_35831 ) ) ( not ( = ?auto_35829 ?auto_35832 ) ) ( not ( = ?auto_35829 ?auto_35833 ) ) ( not ( = ?auto_35829 ?auto_35834 ) ) ( not ( = ?auto_35829 ?auto_35835 ) ) ( not ( = ?auto_35830 ?auto_35831 ) ) ( not ( = ?auto_35830 ?auto_35832 ) ) ( not ( = ?auto_35830 ?auto_35833 ) ) ( not ( = ?auto_35830 ?auto_35834 ) ) ( not ( = ?auto_35830 ?auto_35835 ) ) ( not ( = ?auto_35831 ?auto_35832 ) ) ( not ( = ?auto_35831 ?auto_35833 ) ) ( not ( = ?auto_35831 ?auto_35834 ) ) ( not ( = ?auto_35831 ?auto_35835 ) ) ( not ( = ?auto_35832 ?auto_35833 ) ) ( not ( = ?auto_35832 ?auto_35834 ) ) ( not ( = ?auto_35832 ?auto_35835 ) ) ( not ( = ?auto_35833 ?auto_35834 ) ) ( not ( = ?auto_35833 ?auto_35835 ) ) ( not ( = ?auto_35834 ?auto_35835 ) ) ( ON ?auto_35833 ?auto_35834 ) ( ON ?auto_35832 ?auto_35833 ) ( ON ?auto_35831 ?auto_35832 ) ( ON ?auto_35830 ?auto_35831 ) ( CLEAR ?auto_35828 ) ( ON ?auto_35829 ?auto_35830 ) ( CLEAR ?auto_35829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35828 ?auto_35829 )
      ( MAKE-7PILE ?auto_35828 ?auto_35829 ?auto_35830 ?auto_35831 ?auto_35832 ?auto_35833 ?auto_35834 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_35858 - BLOCK
      ?auto_35859 - BLOCK
      ?auto_35860 - BLOCK
      ?auto_35861 - BLOCK
      ?auto_35862 - BLOCK
      ?auto_35863 - BLOCK
      ?auto_35864 - BLOCK
    )
    :vars
    (
      ?auto_35865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35864 ?auto_35865 ) ( not ( = ?auto_35858 ?auto_35859 ) ) ( not ( = ?auto_35858 ?auto_35860 ) ) ( not ( = ?auto_35858 ?auto_35861 ) ) ( not ( = ?auto_35858 ?auto_35862 ) ) ( not ( = ?auto_35858 ?auto_35863 ) ) ( not ( = ?auto_35858 ?auto_35864 ) ) ( not ( = ?auto_35858 ?auto_35865 ) ) ( not ( = ?auto_35859 ?auto_35860 ) ) ( not ( = ?auto_35859 ?auto_35861 ) ) ( not ( = ?auto_35859 ?auto_35862 ) ) ( not ( = ?auto_35859 ?auto_35863 ) ) ( not ( = ?auto_35859 ?auto_35864 ) ) ( not ( = ?auto_35859 ?auto_35865 ) ) ( not ( = ?auto_35860 ?auto_35861 ) ) ( not ( = ?auto_35860 ?auto_35862 ) ) ( not ( = ?auto_35860 ?auto_35863 ) ) ( not ( = ?auto_35860 ?auto_35864 ) ) ( not ( = ?auto_35860 ?auto_35865 ) ) ( not ( = ?auto_35861 ?auto_35862 ) ) ( not ( = ?auto_35861 ?auto_35863 ) ) ( not ( = ?auto_35861 ?auto_35864 ) ) ( not ( = ?auto_35861 ?auto_35865 ) ) ( not ( = ?auto_35862 ?auto_35863 ) ) ( not ( = ?auto_35862 ?auto_35864 ) ) ( not ( = ?auto_35862 ?auto_35865 ) ) ( not ( = ?auto_35863 ?auto_35864 ) ) ( not ( = ?auto_35863 ?auto_35865 ) ) ( not ( = ?auto_35864 ?auto_35865 ) ) ( ON ?auto_35863 ?auto_35864 ) ( ON ?auto_35862 ?auto_35863 ) ( ON ?auto_35861 ?auto_35862 ) ( ON ?auto_35860 ?auto_35861 ) ( ON ?auto_35859 ?auto_35860 ) ( ON ?auto_35858 ?auto_35859 ) ( CLEAR ?auto_35858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35858 )
      ( MAKE-7PILE ?auto_35858 ?auto_35859 ?auto_35860 ?auto_35861 ?auto_35862 ?auto_35863 ?auto_35864 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_35889 - BLOCK
      ?auto_35890 - BLOCK
      ?auto_35891 - BLOCK
      ?auto_35892 - BLOCK
      ?auto_35893 - BLOCK
      ?auto_35894 - BLOCK
      ?auto_35895 - BLOCK
      ?auto_35896 - BLOCK
    )
    :vars
    (
      ?auto_35897 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_35895 ) ( ON ?auto_35896 ?auto_35897 ) ( CLEAR ?auto_35896 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35889 ) ( ON ?auto_35890 ?auto_35889 ) ( ON ?auto_35891 ?auto_35890 ) ( ON ?auto_35892 ?auto_35891 ) ( ON ?auto_35893 ?auto_35892 ) ( ON ?auto_35894 ?auto_35893 ) ( ON ?auto_35895 ?auto_35894 ) ( not ( = ?auto_35889 ?auto_35890 ) ) ( not ( = ?auto_35889 ?auto_35891 ) ) ( not ( = ?auto_35889 ?auto_35892 ) ) ( not ( = ?auto_35889 ?auto_35893 ) ) ( not ( = ?auto_35889 ?auto_35894 ) ) ( not ( = ?auto_35889 ?auto_35895 ) ) ( not ( = ?auto_35889 ?auto_35896 ) ) ( not ( = ?auto_35889 ?auto_35897 ) ) ( not ( = ?auto_35890 ?auto_35891 ) ) ( not ( = ?auto_35890 ?auto_35892 ) ) ( not ( = ?auto_35890 ?auto_35893 ) ) ( not ( = ?auto_35890 ?auto_35894 ) ) ( not ( = ?auto_35890 ?auto_35895 ) ) ( not ( = ?auto_35890 ?auto_35896 ) ) ( not ( = ?auto_35890 ?auto_35897 ) ) ( not ( = ?auto_35891 ?auto_35892 ) ) ( not ( = ?auto_35891 ?auto_35893 ) ) ( not ( = ?auto_35891 ?auto_35894 ) ) ( not ( = ?auto_35891 ?auto_35895 ) ) ( not ( = ?auto_35891 ?auto_35896 ) ) ( not ( = ?auto_35891 ?auto_35897 ) ) ( not ( = ?auto_35892 ?auto_35893 ) ) ( not ( = ?auto_35892 ?auto_35894 ) ) ( not ( = ?auto_35892 ?auto_35895 ) ) ( not ( = ?auto_35892 ?auto_35896 ) ) ( not ( = ?auto_35892 ?auto_35897 ) ) ( not ( = ?auto_35893 ?auto_35894 ) ) ( not ( = ?auto_35893 ?auto_35895 ) ) ( not ( = ?auto_35893 ?auto_35896 ) ) ( not ( = ?auto_35893 ?auto_35897 ) ) ( not ( = ?auto_35894 ?auto_35895 ) ) ( not ( = ?auto_35894 ?auto_35896 ) ) ( not ( = ?auto_35894 ?auto_35897 ) ) ( not ( = ?auto_35895 ?auto_35896 ) ) ( not ( = ?auto_35895 ?auto_35897 ) ) ( not ( = ?auto_35896 ?auto_35897 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35896 ?auto_35897 )
      ( !STACK ?auto_35896 ?auto_35895 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_35906 - BLOCK
      ?auto_35907 - BLOCK
      ?auto_35908 - BLOCK
      ?auto_35909 - BLOCK
      ?auto_35910 - BLOCK
      ?auto_35911 - BLOCK
      ?auto_35912 - BLOCK
      ?auto_35913 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_35912 ) ( ON-TABLE ?auto_35913 ) ( CLEAR ?auto_35913 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35906 ) ( ON ?auto_35907 ?auto_35906 ) ( ON ?auto_35908 ?auto_35907 ) ( ON ?auto_35909 ?auto_35908 ) ( ON ?auto_35910 ?auto_35909 ) ( ON ?auto_35911 ?auto_35910 ) ( ON ?auto_35912 ?auto_35911 ) ( not ( = ?auto_35906 ?auto_35907 ) ) ( not ( = ?auto_35906 ?auto_35908 ) ) ( not ( = ?auto_35906 ?auto_35909 ) ) ( not ( = ?auto_35906 ?auto_35910 ) ) ( not ( = ?auto_35906 ?auto_35911 ) ) ( not ( = ?auto_35906 ?auto_35912 ) ) ( not ( = ?auto_35906 ?auto_35913 ) ) ( not ( = ?auto_35907 ?auto_35908 ) ) ( not ( = ?auto_35907 ?auto_35909 ) ) ( not ( = ?auto_35907 ?auto_35910 ) ) ( not ( = ?auto_35907 ?auto_35911 ) ) ( not ( = ?auto_35907 ?auto_35912 ) ) ( not ( = ?auto_35907 ?auto_35913 ) ) ( not ( = ?auto_35908 ?auto_35909 ) ) ( not ( = ?auto_35908 ?auto_35910 ) ) ( not ( = ?auto_35908 ?auto_35911 ) ) ( not ( = ?auto_35908 ?auto_35912 ) ) ( not ( = ?auto_35908 ?auto_35913 ) ) ( not ( = ?auto_35909 ?auto_35910 ) ) ( not ( = ?auto_35909 ?auto_35911 ) ) ( not ( = ?auto_35909 ?auto_35912 ) ) ( not ( = ?auto_35909 ?auto_35913 ) ) ( not ( = ?auto_35910 ?auto_35911 ) ) ( not ( = ?auto_35910 ?auto_35912 ) ) ( not ( = ?auto_35910 ?auto_35913 ) ) ( not ( = ?auto_35911 ?auto_35912 ) ) ( not ( = ?auto_35911 ?auto_35913 ) ) ( not ( = ?auto_35912 ?auto_35913 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_35913 )
      ( !STACK ?auto_35913 ?auto_35912 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_35922 - BLOCK
      ?auto_35923 - BLOCK
      ?auto_35924 - BLOCK
      ?auto_35925 - BLOCK
      ?auto_35926 - BLOCK
      ?auto_35927 - BLOCK
      ?auto_35928 - BLOCK
      ?auto_35929 - BLOCK
    )
    :vars
    (
      ?auto_35930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35929 ?auto_35930 ) ( ON-TABLE ?auto_35922 ) ( ON ?auto_35923 ?auto_35922 ) ( ON ?auto_35924 ?auto_35923 ) ( ON ?auto_35925 ?auto_35924 ) ( ON ?auto_35926 ?auto_35925 ) ( ON ?auto_35927 ?auto_35926 ) ( not ( = ?auto_35922 ?auto_35923 ) ) ( not ( = ?auto_35922 ?auto_35924 ) ) ( not ( = ?auto_35922 ?auto_35925 ) ) ( not ( = ?auto_35922 ?auto_35926 ) ) ( not ( = ?auto_35922 ?auto_35927 ) ) ( not ( = ?auto_35922 ?auto_35928 ) ) ( not ( = ?auto_35922 ?auto_35929 ) ) ( not ( = ?auto_35922 ?auto_35930 ) ) ( not ( = ?auto_35923 ?auto_35924 ) ) ( not ( = ?auto_35923 ?auto_35925 ) ) ( not ( = ?auto_35923 ?auto_35926 ) ) ( not ( = ?auto_35923 ?auto_35927 ) ) ( not ( = ?auto_35923 ?auto_35928 ) ) ( not ( = ?auto_35923 ?auto_35929 ) ) ( not ( = ?auto_35923 ?auto_35930 ) ) ( not ( = ?auto_35924 ?auto_35925 ) ) ( not ( = ?auto_35924 ?auto_35926 ) ) ( not ( = ?auto_35924 ?auto_35927 ) ) ( not ( = ?auto_35924 ?auto_35928 ) ) ( not ( = ?auto_35924 ?auto_35929 ) ) ( not ( = ?auto_35924 ?auto_35930 ) ) ( not ( = ?auto_35925 ?auto_35926 ) ) ( not ( = ?auto_35925 ?auto_35927 ) ) ( not ( = ?auto_35925 ?auto_35928 ) ) ( not ( = ?auto_35925 ?auto_35929 ) ) ( not ( = ?auto_35925 ?auto_35930 ) ) ( not ( = ?auto_35926 ?auto_35927 ) ) ( not ( = ?auto_35926 ?auto_35928 ) ) ( not ( = ?auto_35926 ?auto_35929 ) ) ( not ( = ?auto_35926 ?auto_35930 ) ) ( not ( = ?auto_35927 ?auto_35928 ) ) ( not ( = ?auto_35927 ?auto_35929 ) ) ( not ( = ?auto_35927 ?auto_35930 ) ) ( not ( = ?auto_35928 ?auto_35929 ) ) ( not ( = ?auto_35928 ?auto_35930 ) ) ( not ( = ?auto_35929 ?auto_35930 ) ) ( CLEAR ?auto_35927 ) ( ON ?auto_35928 ?auto_35929 ) ( CLEAR ?auto_35928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_35922 ?auto_35923 ?auto_35924 ?auto_35925 ?auto_35926 ?auto_35927 ?auto_35928 )
      ( MAKE-8PILE ?auto_35922 ?auto_35923 ?auto_35924 ?auto_35925 ?auto_35926 ?auto_35927 ?auto_35928 ?auto_35929 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_35939 - BLOCK
      ?auto_35940 - BLOCK
      ?auto_35941 - BLOCK
      ?auto_35942 - BLOCK
      ?auto_35943 - BLOCK
      ?auto_35944 - BLOCK
      ?auto_35945 - BLOCK
      ?auto_35946 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35946 ) ( ON-TABLE ?auto_35939 ) ( ON ?auto_35940 ?auto_35939 ) ( ON ?auto_35941 ?auto_35940 ) ( ON ?auto_35942 ?auto_35941 ) ( ON ?auto_35943 ?auto_35942 ) ( ON ?auto_35944 ?auto_35943 ) ( not ( = ?auto_35939 ?auto_35940 ) ) ( not ( = ?auto_35939 ?auto_35941 ) ) ( not ( = ?auto_35939 ?auto_35942 ) ) ( not ( = ?auto_35939 ?auto_35943 ) ) ( not ( = ?auto_35939 ?auto_35944 ) ) ( not ( = ?auto_35939 ?auto_35945 ) ) ( not ( = ?auto_35939 ?auto_35946 ) ) ( not ( = ?auto_35940 ?auto_35941 ) ) ( not ( = ?auto_35940 ?auto_35942 ) ) ( not ( = ?auto_35940 ?auto_35943 ) ) ( not ( = ?auto_35940 ?auto_35944 ) ) ( not ( = ?auto_35940 ?auto_35945 ) ) ( not ( = ?auto_35940 ?auto_35946 ) ) ( not ( = ?auto_35941 ?auto_35942 ) ) ( not ( = ?auto_35941 ?auto_35943 ) ) ( not ( = ?auto_35941 ?auto_35944 ) ) ( not ( = ?auto_35941 ?auto_35945 ) ) ( not ( = ?auto_35941 ?auto_35946 ) ) ( not ( = ?auto_35942 ?auto_35943 ) ) ( not ( = ?auto_35942 ?auto_35944 ) ) ( not ( = ?auto_35942 ?auto_35945 ) ) ( not ( = ?auto_35942 ?auto_35946 ) ) ( not ( = ?auto_35943 ?auto_35944 ) ) ( not ( = ?auto_35943 ?auto_35945 ) ) ( not ( = ?auto_35943 ?auto_35946 ) ) ( not ( = ?auto_35944 ?auto_35945 ) ) ( not ( = ?auto_35944 ?auto_35946 ) ) ( not ( = ?auto_35945 ?auto_35946 ) ) ( CLEAR ?auto_35944 ) ( ON ?auto_35945 ?auto_35946 ) ( CLEAR ?auto_35945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_35939 ?auto_35940 ?auto_35941 ?auto_35942 ?auto_35943 ?auto_35944 ?auto_35945 )
      ( MAKE-8PILE ?auto_35939 ?auto_35940 ?auto_35941 ?auto_35942 ?auto_35943 ?auto_35944 ?auto_35945 ?auto_35946 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_35955 - BLOCK
      ?auto_35956 - BLOCK
      ?auto_35957 - BLOCK
      ?auto_35958 - BLOCK
      ?auto_35959 - BLOCK
      ?auto_35960 - BLOCK
      ?auto_35961 - BLOCK
      ?auto_35962 - BLOCK
    )
    :vars
    (
      ?auto_35963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35962 ?auto_35963 ) ( ON-TABLE ?auto_35955 ) ( ON ?auto_35956 ?auto_35955 ) ( ON ?auto_35957 ?auto_35956 ) ( ON ?auto_35958 ?auto_35957 ) ( ON ?auto_35959 ?auto_35958 ) ( not ( = ?auto_35955 ?auto_35956 ) ) ( not ( = ?auto_35955 ?auto_35957 ) ) ( not ( = ?auto_35955 ?auto_35958 ) ) ( not ( = ?auto_35955 ?auto_35959 ) ) ( not ( = ?auto_35955 ?auto_35960 ) ) ( not ( = ?auto_35955 ?auto_35961 ) ) ( not ( = ?auto_35955 ?auto_35962 ) ) ( not ( = ?auto_35955 ?auto_35963 ) ) ( not ( = ?auto_35956 ?auto_35957 ) ) ( not ( = ?auto_35956 ?auto_35958 ) ) ( not ( = ?auto_35956 ?auto_35959 ) ) ( not ( = ?auto_35956 ?auto_35960 ) ) ( not ( = ?auto_35956 ?auto_35961 ) ) ( not ( = ?auto_35956 ?auto_35962 ) ) ( not ( = ?auto_35956 ?auto_35963 ) ) ( not ( = ?auto_35957 ?auto_35958 ) ) ( not ( = ?auto_35957 ?auto_35959 ) ) ( not ( = ?auto_35957 ?auto_35960 ) ) ( not ( = ?auto_35957 ?auto_35961 ) ) ( not ( = ?auto_35957 ?auto_35962 ) ) ( not ( = ?auto_35957 ?auto_35963 ) ) ( not ( = ?auto_35958 ?auto_35959 ) ) ( not ( = ?auto_35958 ?auto_35960 ) ) ( not ( = ?auto_35958 ?auto_35961 ) ) ( not ( = ?auto_35958 ?auto_35962 ) ) ( not ( = ?auto_35958 ?auto_35963 ) ) ( not ( = ?auto_35959 ?auto_35960 ) ) ( not ( = ?auto_35959 ?auto_35961 ) ) ( not ( = ?auto_35959 ?auto_35962 ) ) ( not ( = ?auto_35959 ?auto_35963 ) ) ( not ( = ?auto_35960 ?auto_35961 ) ) ( not ( = ?auto_35960 ?auto_35962 ) ) ( not ( = ?auto_35960 ?auto_35963 ) ) ( not ( = ?auto_35961 ?auto_35962 ) ) ( not ( = ?auto_35961 ?auto_35963 ) ) ( not ( = ?auto_35962 ?auto_35963 ) ) ( ON ?auto_35961 ?auto_35962 ) ( CLEAR ?auto_35959 ) ( ON ?auto_35960 ?auto_35961 ) ( CLEAR ?auto_35960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_35955 ?auto_35956 ?auto_35957 ?auto_35958 ?auto_35959 ?auto_35960 )
      ( MAKE-8PILE ?auto_35955 ?auto_35956 ?auto_35957 ?auto_35958 ?auto_35959 ?auto_35960 ?auto_35961 ?auto_35962 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_35972 - BLOCK
      ?auto_35973 - BLOCK
      ?auto_35974 - BLOCK
      ?auto_35975 - BLOCK
      ?auto_35976 - BLOCK
      ?auto_35977 - BLOCK
      ?auto_35978 - BLOCK
      ?auto_35979 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35979 ) ( ON-TABLE ?auto_35972 ) ( ON ?auto_35973 ?auto_35972 ) ( ON ?auto_35974 ?auto_35973 ) ( ON ?auto_35975 ?auto_35974 ) ( ON ?auto_35976 ?auto_35975 ) ( not ( = ?auto_35972 ?auto_35973 ) ) ( not ( = ?auto_35972 ?auto_35974 ) ) ( not ( = ?auto_35972 ?auto_35975 ) ) ( not ( = ?auto_35972 ?auto_35976 ) ) ( not ( = ?auto_35972 ?auto_35977 ) ) ( not ( = ?auto_35972 ?auto_35978 ) ) ( not ( = ?auto_35972 ?auto_35979 ) ) ( not ( = ?auto_35973 ?auto_35974 ) ) ( not ( = ?auto_35973 ?auto_35975 ) ) ( not ( = ?auto_35973 ?auto_35976 ) ) ( not ( = ?auto_35973 ?auto_35977 ) ) ( not ( = ?auto_35973 ?auto_35978 ) ) ( not ( = ?auto_35973 ?auto_35979 ) ) ( not ( = ?auto_35974 ?auto_35975 ) ) ( not ( = ?auto_35974 ?auto_35976 ) ) ( not ( = ?auto_35974 ?auto_35977 ) ) ( not ( = ?auto_35974 ?auto_35978 ) ) ( not ( = ?auto_35974 ?auto_35979 ) ) ( not ( = ?auto_35975 ?auto_35976 ) ) ( not ( = ?auto_35975 ?auto_35977 ) ) ( not ( = ?auto_35975 ?auto_35978 ) ) ( not ( = ?auto_35975 ?auto_35979 ) ) ( not ( = ?auto_35976 ?auto_35977 ) ) ( not ( = ?auto_35976 ?auto_35978 ) ) ( not ( = ?auto_35976 ?auto_35979 ) ) ( not ( = ?auto_35977 ?auto_35978 ) ) ( not ( = ?auto_35977 ?auto_35979 ) ) ( not ( = ?auto_35978 ?auto_35979 ) ) ( ON ?auto_35978 ?auto_35979 ) ( CLEAR ?auto_35976 ) ( ON ?auto_35977 ?auto_35978 ) ( CLEAR ?auto_35977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_35972 ?auto_35973 ?auto_35974 ?auto_35975 ?auto_35976 ?auto_35977 )
      ( MAKE-8PILE ?auto_35972 ?auto_35973 ?auto_35974 ?auto_35975 ?auto_35976 ?auto_35977 ?auto_35978 ?auto_35979 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_35988 - BLOCK
      ?auto_35989 - BLOCK
      ?auto_35990 - BLOCK
      ?auto_35991 - BLOCK
      ?auto_35992 - BLOCK
      ?auto_35993 - BLOCK
      ?auto_35994 - BLOCK
      ?auto_35995 - BLOCK
    )
    :vars
    (
      ?auto_35996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35995 ?auto_35996 ) ( ON-TABLE ?auto_35988 ) ( ON ?auto_35989 ?auto_35988 ) ( ON ?auto_35990 ?auto_35989 ) ( ON ?auto_35991 ?auto_35990 ) ( not ( = ?auto_35988 ?auto_35989 ) ) ( not ( = ?auto_35988 ?auto_35990 ) ) ( not ( = ?auto_35988 ?auto_35991 ) ) ( not ( = ?auto_35988 ?auto_35992 ) ) ( not ( = ?auto_35988 ?auto_35993 ) ) ( not ( = ?auto_35988 ?auto_35994 ) ) ( not ( = ?auto_35988 ?auto_35995 ) ) ( not ( = ?auto_35988 ?auto_35996 ) ) ( not ( = ?auto_35989 ?auto_35990 ) ) ( not ( = ?auto_35989 ?auto_35991 ) ) ( not ( = ?auto_35989 ?auto_35992 ) ) ( not ( = ?auto_35989 ?auto_35993 ) ) ( not ( = ?auto_35989 ?auto_35994 ) ) ( not ( = ?auto_35989 ?auto_35995 ) ) ( not ( = ?auto_35989 ?auto_35996 ) ) ( not ( = ?auto_35990 ?auto_35991 ) ) ( not ( = ?auto_35990 ?auto_35992 ) ) ( not ( = ?auto_35990 ?auto_35993 ) ) ( not ( = ?auto_35990 ?auto_35994 ) ) ( not ( = ?auto_35990 ?auto_35995 ) ) ( not ( = ?auto_35990 ?auto_35996 ) ) ( not ( = ?auto_35991 ?auto_35992 ) ) ( not ( = ?auto_35991 ?auto_35993 ) ) ( not ( = ?auto_35991 ?auto_35994 ) ) ( not ( = ?auto_35991 ?auto_35995 ) ) ( not ( = ?auto_35991 ?auto_35996 ) ) ( not ( = ?auto_35992 ?auto_35993 ) ) ( not ( = ?auto_35992 ?auto_35994 ) ) ( not ( = ?auto_35992 ?auto_35995 ) ) ( not ( = ?auto_35992 ?auto_35996 ) ) ( not ( = ?auto_35993 ?auto_35994 ) ) ( not ( = ?auto_35993 ?auto_35995 ) ) ( not ( = ?auto_35993 ?auto_35996 ) ) ( not ( = ?auto_35994 ?auto_35995 ) ) ( not ( = ?auto_35994 ?auto_35996 ) ) ( not ( = ?auto_35995 ?auto_35996 ) ) ( ON ?auto_35994 ?auto_35995 ) ( ON ?auto_35993 ?auto_35994 ) ( CLEAR ?auto_35991 ) ( ON ?auto_35992 ?auto_35993 ) ( CLEAR ?auto_35992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35988 ?auto_35989 ?auto_35990 ?auto_35991 ?auto_35992 )
      ( MAKE-8PILE ?auto_35988 ?auto_35989 ?auto_35990 ?auto_35991 ?auto_35992 ?auto_35993 ?auto_35994 ?auto_35995 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_36005 - BLOCK
      ?auto_36006 - BLOCK
      ?auto_36007 - BLOCK
      ?auto_36008 - BLOCK
      ?auto_36009 - BLOCK
      ?auto_36010 - BLOCK
      ?auto_36011 - BLOCK
      ?auto_36012 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36012 ) ( ON-TABLE ?auto_36005 ) ( ON ?auto_36006 ?auto_36005 ) ( ON ?auto_36007 ?auto_36006 ) ( ON ?auto_36008 ?auto_36007 ) ( not ( = ?auto_36005 ?auto_36006 ) ) ( not ( = ?auto_36005 ?auto_36007 ) ) ( not ( = ?auto_36005 ?auto_36008 ) ) ( not ( = ?auto_36005 ?auto_36009 ) ) ( not ( = ?auto_36005 ?auto_36010 ) ) ( not ( = ?auto_36005 ?auto_36011 ) ) ( not ( = ?auto_36005 ?auto_36012 ) ) ( not ( = ?auto_36006 ?auto_36007 ) ) ( not ( = ?auto_36006 ?auto_36008 ) ) ( not ( = ?auto_36006 ?auto_36009 ) ) ( not ( = ?auto_36006 ?auto_36010 ) ) ( not ( = ?auto_36006 ?auto_36011 ) ) ( not ( = ?auto_36006 ?auto_36012 ) ) ( not ( = ?auto_36007 ?auto_36008 ) ) ( not ( = ?auto_36007 ?auto_36009 ) ) ( not ( = ?auto_36007 ?auto_36010 ) ) ( not ( = ?auto_36007 ?auto_36011 ) ) ( not ( = ?auto_36007 ?auto_36012 ) ) ( not ( = ?auto_36008 ?auto_36009 ) ) ( not ( = ?auto_36008 ?auto_36010 ) ) ( not ( = ?auto_36008 ?auto_36011 ) ) ( not ( = ?auto_36008 ?auto_36012 ) ) ( not ( = ?auto_36009 ?auto_36010 ) ) ( not ( = ?auto_36009 ?auto_36011 ) ) ( not ( = ?auto_36009 ?auto_36012 ) ) ( not ( = ?auto_36010 ?auto_36011 ) ) ( not ( = ?auto_36010 ?auto_36012 ) ) ( not ( = ?auto_36011 ?auto_36012 ) ) ( ON ?auto_36011 ?auto_36012 ) ( ON ?auto_36010 ?auto_36011 ) ( CLEAR ?auto_36008 ) ( ON ?auto_36009 ?auto_36010 ) ( CLEAR ?auto_36009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36005 ?auto_36006 ?auto_36007 ?auto_36008 ?auto_36009 )
      ( MAKE-8PILE ?auto_36005 ?auto_36006 ?auto_36007 ?auto_36008 ?auto_36009 ?auto_36010 ?auto_36011 ?auto_36012 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_36021 - BLOCK
      ?auto_36022 - BLOCK
      ?auto_36023 - BLOCK
      ?auto_36024 - BLOCK
      ?auto_36025 - BLOCK
      ?auto_36026 - BLOCK
      ?auto_36027 - BLOCK
      ?auto_36028 - BLOCK
    )
    :vars
    (
      ?auto_36029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36028 ?auto_36029 ) ( ON-TABLE ?auto_36021 ) ( ON ?auto_36022 ?auto_36021 ) ( ON ?auto_36023 ?auto_36022 ) ( not ( = ?auto_36021 ?auto_36022 ) ) ( not ( = ?auto_36021 ?auto_36023 ) ) ( not ( = ?auto_36021 ?auto_36024 ) ) ( not ( = ?auto_36021 ?auto_36025 ) ) ( not ( = ?auto_36021 ?auto_36026 ) ) ( not ( = ?auto_36021 ?auto_36027 ) ) ( not ( = ?auto_36021 ?auto_36028 ) ) ( not ( = ?auto_36021 ?auto_36029 ) ) ( not ( = ?auto_36022 ?auto_36023 ) ) ( not ( = ?auto_36022 ?auto_36024 ) ) ( not ( = ?auto_36022 ?auto_36025 ) ) ( not ( = ?auto_36022 ?auto_36026 ) ) ( not ( = ?auto_36022 ?auto_36027 ) ) ( not ( = ?auto_36022 ?auto_36028 ) ) ( not ( = ?auto_36022 ?auto_36029 ) ) ( not ( = ?auto_36023 ?auto_36024 ) ) ( not ( = ?auto_36023 ?auto_36025 ) ) ( not ( = ?auto_36023 ?auto_36026 ) ) ( not ( = ?auto_36023 ?auto_36027 ) ) ( not ( = ?auto_36023 ?auto_36028 ) ) ( not ( = ?auto_36023 ?auto_36029 ) ) ( not ( = ?auto_36024 ?auto_36025 ) ) ( not ( = ?auto_36024 ?auto_36026 ) ) ( not ( = ?auto_36024 ?auto_36027 ) ) ( not ( = ?auto_36024 ?auto_36028 ) ) ( not ( = ?auto_36024 ?auto_36029 ) ) ( not ( = ?auto_36025 ?auto_36026 ) ) ( not ( = ?auto_36025 ?auto_36027 ) ) ( not ( = ?auto_36025 ?auto_36028 ) ) ( not ( = ?auto_36025 ?auto_36029 ) ) ( not ( = ?auto_36026 ?auto_36027 ) ) ( not ( = ?auto_36026 ?auto_36028 ) ) ( not ( = ?auto_36026 ?auto_36029 ) ) ( not ( = ?auto_36027 ?auto_36028 ) ) ( not ( = ?auto_36027 ?auto_36029 ) ) ( not ( = ?auto_36028 ?auto_36029 ) ) ( ON ?auto_36027 ?auto_36028 ) ( ON ?auto_36026 ?auto_36027 ) ( ON ?auto_36025 ?auto_36026 ) ( CLEAR ?auto_36023 ) ( ON ?auto_36024 ?auto_36025 ) ( CLEAR ?auto_36024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36021 ?auto_36022 ?auto_36023 ?auto_36024 )
      ( MAKE-8PILE ?auto_36021 ?auto_36022 ?auto_36023 ?auto_36024 ?auto_36025 ?auto_36026 ?auto_36027 ?auto_36028 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_36038 - BLOCK
      ?auto_36039 - BLOCK
      ?auto_36040 - BLOCK
      ?auto_36041 - BLOCK
      ?auto_36042 - BLOCK
      ?auto_36043 - BLOCK
      ?auto_36044 - BLOCK
      ?auto_36045 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36045 ) ( ON-TABLE ?auto_36038 ) ( ON ?auto_36039 ?auto_36038 ) ( ON ?auto_36040 ?auto_36039 ) ( not ( = ?auto_36038 ?auto_36039 ) ) ( not ( = ?auto_36038 ?auto_36040 ) ) ( not ( = ?auto_36038 ?auto_36041 ) ) ( not ( = ?auto_36038 ?auto_36042 ) ) ( not ( = ?auto_36038 ?auto_36043 ) ) ( not ( = ?auto_36038 ?auto_36044 ) ) ( not ( = ?auto_36038 ?auto_36045 ) ) ( not ( = ?auto_36039 ?auto_36040 ) ) ( not ( = ?auto_36039 ?auto_36041 ) ) ( not ( = ?auto_36039 ?auto_36042 ) ) ( not ( = ?auto_36039 ?auto_36043 ) ) ( not ( = ?auto_36039 ?auto_36044 ) ) ( not ( = ?auto_36039 ?auto_36045 ) ) ( not ( = ?auto_36040 ?auto_36041 ) ) ( not ( = ?auto_36040 ?auto_36042 ) ) ( not ( = ?auto_36040 ?auto_36043 ) ) ( not ( = ?auto_36040 ?auto_36044 ) ) ( not ( = ?auto_36040 ?auto_36045 ) ) ( not ( = ?auto_36041 ?auto_36042 ) ) ( not ( = ?auto_36041 ?auto_36043 ) ) ( not ( = ?auto_36041 ?auto_36044 ) ) ( not ( = ?auto_36041 ?auto_36045 ) ) ( not ( = ?auto_36042 ?auto_36043 ) ) ( not ( = ?auto_36042 ?auto_36044 ) ) ( not ( = ?auto_36042 ?auto_36045 ) ) ( not ( = ?auto_36043 ?auto_36044 ) ) ( not ( = ?auto_36043 ?auto_36045 ) ) ( not ( = ?auto_36044 ?auto_36045 ) ) ( ON ?auto_36044 ?auto_36045 ) ( ON ?auto_36043 ?auto_36044 ) ( ON ?auto_36042 ?auto_36043 ) ( CLEAR ?auto_36040 ) ( ON ?auto_36041 ?auto_36042 ) ( CLEAR ?auto_36041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36038 ?auto_36039 ?auto_36040 ?auto_36041 )
      ( MAKE-8PILE ?auto_36038 ?auto_36039 ?auto_36040 ?auto_36041 ?auto_36042 ?auto_36043 ?auto_36044 ?auto_36045 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_36054 - BLOCK
      ?auto_36055 - BLOCK
      ?auto_36056 - BLOCK
      ?auto_36057 - BLOCK
      ?auto_36058 - BLOCK
      ?auto_36059 - BLOCK
      ?auto_36060 - BLOCK
      ?auto_36061 - BLOCK
    )
    :vars
    (
      ?auto_36062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36061 ?auto_36062 ) ( ON-TABLE ?auto_36054 ) ( ON ?auto_36055 ?auto_36054 ) ( not ( = ?auto_36054 ?auto_36055 ) ) ( not ( = ?auto_36054 ?auto_36056 ) ) ( not ( = ?auto_36054 ?auto_36057 ) ) ( not ( = ?auto_36054 ?auto_36058 ) ) ( not ( = ?auto_36054 ?auto_36059 ) ) ( not ( = ?auto_36054 ?auto_36060 ) ) ( not ( = ?auto_36054 ?auto_36061 ) ) ( not ( = ?auto_36054 ?auto_36062 ) ) ( not ( = ?auto_36055 ?auto_36056 ) ) ( not ( = ?auto_36055 ?auto_36057 ) ) ( not ( = ?auto_36055 ?auto_36058 ) ) ( not ( = ?auto_36055 ?auto_36059 ) ) ( not ( = ?auto_36055 ?auto_36060 ) ) ( not ( = ?auto_36055 ?auto_36061 ) ) ( not ( = ?auto_36055 ?auto_36062 ) ) ( not ( = ?auto_36056 ?auto_36057 ) ) ( not ( = ?auto_36056 ?auto_36058 ) ) ( not ( = ?auto_36056 ?auto_36059 ) ) ( not ( = ?auto_36056 ?auto_36060 ) ) ( not ( = ?auto_36056 ?auto_36061 ) ) ( not ( = ?auto_36056 ?auto_36062 ) ) ( not ( = ?auto_36057 ?auto_36058 ) ) ( not ( = ?auto_36057 ?auto_36059 ) ) ( not ( = ?auto_36057 ?auto_36060 ) ) ( not ( = ?auto_36057 ?auto_36061 ) ) ( not ( = ?auto_36057 ?auto_36062 ) ) ( not ( = ?auto_36058 ?auto_36059 ) ) ( not ( = ?auto_36058 ?auto_36060 ) ) ( not ( = ?auto_36058 ?auto_36061 ) ) ( not ( = ?auto_36058 ?auto_36062 ) ) ( not ( = ?auto_36059 ?auto_36060 ) ) ( not ( = ?auto_36059 ?auto_36061 ) ) ( not ( = ?auto_36059 ?auto_36062 ) ) ( not ( = ?auto_36060 ?auto_36061 ) ) ( not ( = ?auto_36060 ?auto_36062 ) ) ( not ( = ?auto_36061 ?auto_36062 ) ) ( ON ?auto_36060 ?auto_36061 ) ( ON ?auto_36059 ?auto_36060 ) ( ON ?auto_36058 ?auto_36059 ) ( ON ?auto_36057 ?auto_36058 ) ( CLEAR ?auto_36055 ) ( ON ?auto_36056 ?auto_36057 ) ( CLEAR ?auto_36056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36054 ?auto_36055 ?auto_36056 )
      ( MAKE-8PILE ?auto_36054 ?auto_36055 ?auto_36056 ?auto_36057 ?auto_36058 ?auto_36059 ?auto_36060 ?auto_36061 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_36071 - BLOCK
      ?auto_36072 - BLOCK
      ?auto_36073 - BLOCK
      ?auto_36074 - BLOCK
      ?auto_36075 - BLOCK
      ?auto_36076 - BLOCK
      ?auto_36077 - BLOCK
      ?auto_36078 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36078 ) ( ON-TABLE ?auto_36071 ) ( ON ?auto_36072 ?auto_36071 ) ( not ( = ?auto_36071 ?auto_36072 ) ) ( not ( = ?auto_36071 ?auto_36073 ) ) ( not ( = ?auto_36071 ?auto_36074 ) ) ( not ( = ?auto_36071 ?auto_36075 ) ) ( not ( = ?auto_36071 ?auto_36076 ) ) ( not ( = ?auto_36071 ?auto_36077 ) ) ( not ( = ?auto_36071 ?auto_36078 ) ) ( not ( = ?auto_36072 ?auto_36073 ) ) ( not ( = ?auto_36072 ?auto_36074 ) ) ( not ( = ?auto_36072 ?auto_36075 ) ) ( not ( = ?auto_36072 ?auto_36076 ) ) ( not ( = ?auto_36072 ?auto_36077 ) ) ( not ( = ?auto_36072 ?auto_36078 ) ) ( not ( = ?auto_36073 ?auto_36074 ) ) ( not ( = ?auto_36073 ?auto_36075 ) ) ( not ( = ?auto_36073 ?auto_36076 ) ) ( not ( = ?auto_36073 ?auto_36077 ) ) ( not ( = ?auto_36073 ?auto_36078 ) ) ( not ( = ?auto_36074 ?auto_36075 ) ) ( not ( = ?auto_36074 ?auto_36076 ) ) ( not ( = ?auto_36074 ?auto_36077 ) ) ( not ( = ?auto_36074 ?auto_36078 ) ) ( not ( = ?auto_36075 ?auto_36076 ) ) ( not ( = ?auto_36075 ?auto_36077 ) ) ( not ( = ?auto_36075 ?auto_36078 ) ) ( not ( = ?auto_36076 ?auto_36077 ) ) ( not ( = ?auto_36076 ?auto_36078 ) ) ( not ( = ?auto_36077 ?auto_36078 ) ) ( ON ?auto_36077 ?auto_36078 ) ( ON ?auto_36076 ?auto_36077 ) ( ON ?auto_36075 ?auto_36076 ) ( ON ?auto_36074 ?auto_36075 ) ( CLEAR ?auto_36072 ) ( ON ?auto_36073 ?auto_36074 ) ( CLEAR ?auto_36073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36071 ?auto_36072 ?auto_36073 )
      ( MAKE-8PILE ?auto_36071 ?auto_36072 ?auto_36073 ?auto_36074 ?auto_36075 ?auto_36076 ?auto_36077 ?auto_36078 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_36087 - BLOCK
      ?auto_36088 - BLOCK
      ?auto_36089 - BLOCK
      ?auto_36090 - BLOCK
      ?auto_36091 - BLOCK
      ?auto_36092 - BLOCK
      ?auto_36093 - BLOCK
      ?auto_36094 - BLOCK
    )
    :vars
    (
      ?auto_36095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36094 ?auto_36095 ) ( ON-TABLE ?auto_36087 ) ( not ( = ?auto_36087 ?auto_36088 ) ) ( not ( = ?auto_36087 ?auto_36089 ) ) ( not ( = ?auto_36087 ?auto_36090 ) ) ( not ( = ?auto_36087 ?auto_36091 ) ) ( not ( = ?auto_36087 ?auto_36092 ) ) ( not ( = ?auto_36087 ?auto_36093 ) ) ( not ( = ?auto_36087 ?auto_36094 ) ) ( not ( = ?auto_36087 ?auto_36095 ) ) ( not ( = ?auto_36088 ?auto_36089 ) ) ( not ( = ?auto_36088 ?auto_36090 ) ) ( not ( = ?auto_36088 ?auto_36091 ) ) ( not ( = ?auto_36088 ?auto_36092 ) ) ( not ( = ?auto_36088 ?auto_36093 ) ) ( not ( = ?auto_36088 ?auto_36094 ) ) ( not ( = ?auto_36088 ?auto_36095 ) ) ( not ( = ?auto_36089 ?auto_36090 ) ) ( not ( = ?auto_36089 ?auto_36091 ) ) ( not ( = ?auto_36089 ?auto_36092 ) ) ( not ( = ?auto_36089 ?auto_36093 ) ) ( not ( = ?auto_36089 ?auto_36094 ) ) ( not ( = ?auto_36089 ?auto_36095 ) ) ( not ( = ?auto_36090 ?auto_36091 ) ) ( not ( = ?auto_36090 ?auto_36092 ) ) ( not ( = ?auto_36090 ?auto_36093 ) ) ( not ( = ?auto_36090 ?auto_36094 ) ) ( not ( = ?auto_36090 ?auto_36095 ) ) ( not ( = ?auto_36091 ?auto_36092 ) ) ( not ( = ?auto_36091 ?auto_36093 ) ) ( not ( = ?auto_36091 ?auto_36094 ) ) ( not ( = ?auto_36091 ?auto_36095 ) ) ( not ( = ?auto_36092 ?auto_36093 ) ) ( not ( = ?auto_36092 ?auto_36094 ) ) ( not ( = ?auto_36092 ?auto_36095 ) ) ( not ( = ?auto_36093 ?auto_36094 ) ) ( not ( = ?auto_36093 ?auto_36095 ) ) ( not ( = ?auto_36094 ?auto_36095 ) ) ( ON ?auto_36093 ?auto_36094 ) ( ON ?auto_36092 ?auto_36093 ) ( ON ?auto_36091 ?auto_36092 ) ( ON ?auto_36090 ?auto_36091 ) ( ON ?auto_36089 ?auto_36090 ) ( CLEAR ?auto_36087 ) ( ON ?auto_36088 ?auto_36089 ) ( CLEAR ?auto_36088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36087 ?auto_36088 )
      ( MAKE-8PILE ?auto_36087 ?auto_36088 ?auto_36089 ?auto_36090 ?auto_36091 ?auto_36092 ?auto_36093 ?auto_36094 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_36104 - BLOCK
      ?auto_36105 - BLOCK
      ?auto_36106 - BLOCK
      ?auto_36107 - BLOCK
      ?auto_36108 - BLOCK
      ?auto_36109 - BLOCK
      ?auto_36110 - BLOCK
      ?auto_36111 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36111 ) ( ON-TABLE ?auto_36104 ) ( not ( = ?auto_36104 ?auto_36105 ) ) ( not ( = ?auto_36104 ?auto_36106 ) ) ( not ( = ?auto_36104 ?auto_36107 ) ) ( not ( = ?auto_36104 ?auto_36108 ) ) ( not ( = ?auto_36104 ?auto_36109 ) ) ( not ( = ?auto_36104 ?auto_36110 ) ) ( not ( = ?auto_36104 ?auto_36111 ) ) ( not ( = ?auto_36105 ?auto_36106 ) ) ( not ( = ?auto_36105 ?auto_36107 ) ) ( not ( = ?auto_36105 ?auto_36108 ) ) ( not ( = ?auto_36105 ?auto_36109 ) ) ( not ( = ?auto_36105 ?auto_36110 ) ) ( not ( = ?auto_36105 ?auto_36111 ) ) ( not ( = ?auto_36106 ?auto_36107 ) ) ( not ( = ?auto_36106 ?auto_36108 ) ) ( not ( = ?auto_36106 ?auto_36109 ) ) ( not ( = ?auto_36106 ?auto_36110 ) ) ( not ( = ?auto_36106 ?auto_36111 ) ) ( not ( = ?auto_36107 ?auto_36108 ) ) ( not ( = ?auto_36107 ?auto_36109 ) ) ( not ( = ?auto_36107 ?auto_36110 ) ) ( not ( = ?auto_36107 ?auto_36111 ) ) ( not ( = ?auto_36108 ?auto_36109 ) ) ( not ( = ?auto_36108 ?auto_36110 ) ) ( not ( = ?auto_36108 ?auto_36111 ) ) ( not ( = ?auto_36109 ?auto_36110 ) ) ( not ( = ?auto_36109 ?auto_36111 ) ) ( not ( = ?auto_36110 ?auto_36111 ) ) ( ON ?auto_36110 ?auto_36111 ) ( ON ?auto_36109 ?auto_36110 ) ( ON ?auto_36108 ?auto_36109 ) ( ON ?auto_36107 ?auto_36108 ) ( ON ?auto_36106 ?auto_36107 ) ( CLEAR ?auto_36104 ) ( ON ?auto_36105 ?auto_36106 ) ( CLEAR ?auto_36105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36104 ?auto_36105 )
      ( MAKE-8PILE ?auto_36104 ?auto_36105 ?auto_36106 ?auto_36107 ?auto_36108 ?auto_36109 ?auto_36110 ?auto_36111 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_36120 - BLOCK
      ?auto_36121 - BLOCK
      ?auto_36122 - BLOCK
      ?auto_36123 - BLOCK
      ?auto_36124 - BLOCK
      ?auto_36125 - BLOCK
      ?auto_36126 - BLOCK
      ?auto_36127 - BLOCK
    )
    :vars
    (
      ?auto_36128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36127 ?auto_36128 ) ( not ( = ?auto_36120 ?auto_36121 ) ) ( not ( = ?auto_36120 ?auto_36122 ) ) ( not ( = ?auto_36120 ?auto_36123 ) ) ( not ( = ?auto_36120 ?auto_36124 ) ) ( not ( = ?auto_36120 ?auto_36125 ) ) ( not ( = ?auto_36120 ?auto_36126 ) ) ( not ( = ?auto_36120 ?auto_36127 ) ) ( not ( = ?auto_36120 ?auto_36128 ) ) ( not ( = ?auto_36121 ?auto_36122 ) ) ( not ( = ?auto_36121 ?auto_36123 ) ) ( not ( = ?auto_36121 ?auto_36124 ) ) ( not ( = ?auto_36121 ?auto_36125 ) ) ( not ( = ?auto_36121 ?auto_36126 ) ) ( not ( = ?auto_36121 ?auto_36127 ) ) ( not ( = ?auto_36121 ?auto_36128 ) ) ( not ( = ?auto_36122 ?auto_36123 ) ) ( not ( = ?auto_36122 ?auto_36124 ) ) ( not ( = ?auto_36122 ?auto_36125 ) ) ( not ( = ?auto_36122 ?auto_36126 ) ) ( not ( = ?auto_36122 ?auto_36127 ) ) ( not ( = ?auto_36122 ?auto_36128 ) ) ( not ( = ?auto_36123 ?auto_36124 ) ) ( not ( = ?auto_36123 ?auto_36125 ) ) ( not ( = ?auto_36123 ?auto_36126 ) ) ( not ( = ?auto_36123 ?auto_36127 ) ) ( not ( = ?auto_36123 ?auto_36128 ) ) ( not ( = ?auto_36124 ?auto_36125 ) ) ( not ( = ?auto_36124 ?auto_36126 ) ) ( not ( = ?auto_36124 ?auto_36127 ) ) ( not ( = ?auto_36124 ?auto_36128 ) ) ( not ( = ?auto_36125 ?auto_36126 ) ) ( not ( = ?auto_36125 ?auto_36127 ) ) ( not ( = ?auto_36125 ?auto_36128 ) ) ( not ( = ?auto_36126 ?auto_36127 ) ) ( not ( = ?auto_36126 ?auto_36128 ) ) ( not ( = ?auto_36127 ?auto_36128 ) ) ( ON ?auto_36126 ?auto_36127 ) ( ON ?auto_36125 ?auto_36126 ) ( ON ?auto_36124 ?auto_36125 ) ( ON ?auto_36123 ?auto_36124 ) ( ON ?auto_36122 ?auto_36123 ) ( ON ?auto_36121 ?auto_36122 ) ( ON ?auto_36120 ?auto_36121 ) ( CLEAR ?auto_36120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36120 )
      ( MAKE-8PILE ?auto_36120 ?auto_36121 ?auto_36122 ?auto_36123 ?auto_36124 ?auto_36125 ?auto_36126 ?auto_36127 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_36137 - BLOCK
      ?auto_36138 - BLOCK
      ?auto_36139 - BLOCK
      ?auto_36140 - BLOCK
      ?auto_36141 - BLOCK
      ?auto_36142 - BLOCK
      ?auto_36143 - BLOCK
      ?auto_36144 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36144 ) ( not ( = ?auto_36137 ?auto_36138 ) ) ( not ( = ?auto_36137 ?auto_36139 ) ) ( not ( = ?auto_36137 ?auto_36140 ) ) ( not ( = ?auto_36137 ?auto_36141 ) ) ( not ( = ?auto_36137 ?auto_36142 ) ) ( not ( = ?auto_36137 ?auto_36143 ) ) ( not ( = ?auto_36137 ?auto_36144 ) ) ( not ( = ?auto_36138 ?auto_36139 ) ) ( not ( = ?auto_36138 ?auto_36140 ) ) ( not ( = ?auto_36138 ?auto_36141 ) ) ( not ( = ?auto_36138 ?auto_36142 ) ) ( not ( = ?auto_36138 ?auto_36143 ) ) ( not ( = ?auto_36138 ?auto_36144 ) ) ( not ( = ?auto_36139 ?auto_36140 ) ) ( not ( = ?auto_36139 ?auto_36141 ) ) ( not ( = ?auto_36139 ?auto_36142 ) ) ( not ( = ?auto_36139 ?auto_36143 ) ) ( not ( = ?auto_36139 ?auto_36144 ) ) ( not ( = ?auto_36140 ?auto_36141 ) ) ( not ( = ?auto_36140 ?auto_36142 ) ) ( not ( = ?auto_36140 ?auto_36143 ) ) ( not ( = ?auto_36140 ?auto_36144 ) ) ( not ( = ?auto_36141 ?auto_36142 ) ) ( not ( = ?auto_36141 ?auto_36143 ) ) ( not ( = ?auto_36141 ?auto_36144 ) ) ( not ( = ?auto_36142 ?auto_36143 ) ) ( not ( = ?auto_36142 ?auto_36144 ) ) ( not ( = ?auto_36143 ?auto_36144 ) ) ( ON ?auto_36143 ?auto_36144 ) ( ON ?auto_36142 ?auto_36143 ) ( ON ?auto_36141 ?auto_36142 ) ( ON ?auto_36140 ?auto_36141 ) ( ON ?auto_36139 ?auto_36140 ) ( ON ?auto_36138 ?auto_36139 ) ( ON ?auto_36137 ?auto_36138 ) ( CLEAR ?auto_36137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36137 )
      ( MAKE-8PILE ?auto_36137 ?auto_36138 ?auto_36139 ?auto_36140 ?auto_36141 ?auto_36142 ?auto_36143 ?auto_36144 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_36153 - BLOCK
      ?auto_36154 - BLOCK
      ?auto_36155 - BLOCK
      ?auto_36156 - BLOCK
      ?auto_36157 - BLOCK
      ?auto_36158 - BLOCK
      ?auto_36159 - BLOCK
      ?auto_36160 - BLOCK
    )
    :vars
    (
      ?auto_36161 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36153 ?auto_36154 ) ) ( not ( = ?auto_36153 ?auto_36155 ) ) ( not ( = ?auto_36153 ?auto_36156 ) ) ( not ( = ?auto_36153 ?auto_36157 ) ) ( not ( = ?auto_36153 ?auto_36158 ) ) ( not ( = ?auto_36153 ?auto_36159 ) ) ( not ( = ?auto_36153 ?auto_36160 ) ) ( not ( = ?auto_36154 ?auto_36155 ) ) ( not ( = ?auto_36154 ?auto_36156 ) ) ( not ( = ?auto_36154 ?auto_36157 ) ) ( not ( = ?auto_36154 ?auto_36158 ) ) ( not ( = ?auto_36154 ?auto_36159 ) ) ( not ( = ?auto_36154 ?auto_36160 ) ) ( not ( = ?auto_36155 ?auto_36156 ) ) ( not ( = ?auto_36155 ?auto_36157 ) ) ( not ( = ?auto_36155 ?auto_36158 ) ) ( not ( = ?auto_36155 ?auto_36159 ) ) ( not ( = ?auto_36155 ?auto_36160 ) ) ( not ( = ?auto_36156 ?auto_36157 ) ) ( not ( = ?auto_36156 ?auto_36158 ) ) ( not ( = ?auto_36156 ?auto_36159 ) ) ( not ( = ?auto_36156 ?auto_36160 ) ) ( not ( = ?auto_36157 ?auto_36158 ) ) ( not ( = ?auto_36157 ?auto_36159 ) ) ( not ( = ?auto_36157 ?auto_36160 ) ) ( not ( = ?auto_36158 ?auto_36159 ) ) ( not ( = ?auto_36158 ?auto_36160 ) ) ( not ( = ?auto_36159 ?auto_36160 ) ) ( ON ?auto_36153 ?auto_36161 ) ( not ( = ?auto_36160 ?auto_36161 ) ) ( not ( = ?auto_36159 ?auto_36161 ) ) ( not ( = ?auto_36158 ?auto_36161 ) ) ( not ( = ?auto_36157 ?auto_36161 ) ) ( not ( = ?auto_36156 ?auto_36161 ) ) ( not ( = ?auto_36155 ?auto_36161 ) ) ( not ( = ?auto_36154 ?auto_36161 ) ) ( not ( = ?auto_36153 ?auto_36161 ) ) ( ON ?auto_36154 ?auto_36153 ) ( ON ?auto_36155 ?auto_36154 ) ( ON ?auto_36156 ?auto_36155 ) ( ON ?auto_36157 ?auto_36156 ) ( ON ?auto_36158 ?auto_36157 ) ( ON ?auto_36159 ?auto_36158 ) ( ON ?auto_36160 ?auto_36159 ) ( CLEAR ?auto_36160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_36160 ?auto_36159 ?auto_36158 ?auto_36157 ?auto_36156 ?auto_36155 ?auto_36154 ?auto_36153 )
      ( MAKE-8PILE ?auto_36153 ?auto_36154 ?auto_36155 ?auto_36156 ?auto_36157 ?auto_36158 ?auto_36159 ?auto_36160 ) )
  )

)

