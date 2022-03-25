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
      ?auto_10352 - BLOCK
      ?auto_10353 - BLOCK
      ?auto_10354 - BLOCK
      ?auto_10355 - BLOCK
    )
    :vars
    (
      ?auto_10356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10356 ?auto_10355 ) ( CLEAR ?auto_10356 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10352 ) ( ON ?auto_10353 ?auto_10352 ) ( ON ?auto_10354 ?auto_10353 ) ( ON ?auto_10355 ?auto_10354 ) ( not ( = ?auto_10352 ?auto_10353 ) ) ( not ( = ?auto_10352 ?auto_10354 ) ) ( not ( = ?auto_10352 ?auto_10355 ) ) ( not ( = ?auto_10352 ?auto_10356 ) ) ( not ( = ?auto_10353 ?auto_10354 ) ) ( not ( = ?auto_10353 ?auto_10355 ) ) ( not ( = ?auto_10353 ?auto_10356 ) ) ( not ( = ?auto_10354 ?auto_10355 ) ) ( not ( = ?auto_10354 ?auto_10356 ) ) ( not ( = ?auto_10355 ?auto_10356 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10356 ?auto_10355 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10358 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_10358 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_10358 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10359 - BLOCK
    )
    :vars
    (
      ?auto_10360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10359 ?auto_10360 ) ( CLEAR ?auto_10359 ) ( HAND-EMPTY ) ( not ( = ?auto_10359 ?auto_10360 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10359 ?auto_10360 )
      ( MAKE-1PILE ?auto_10359 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10364 - BLOCK
      ?auto_10365 - BLOCK
      ?auto_10366 - BLOCK
    )
    :vars
    (
      ?auto_10367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10367 ?auto_10366 ) ( CLEAR ?auto_10367 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10364 ) ( ON ?auto_10365 ?auto_10364 ) ( ON ?auto_10366 ?auto_10365 ) ( not ( = ?auto_10364 ?auto_10365 ) ) ( not ( = ?auto_10364 ?auto_10366 ) ) ( not ( = ?auto_10364 ?auto_10367 ) ) ( not ( = ?auto_10365 ?auto_10366 ) ) ( not ( = ?auto_10365 ?auto_10367 ) ) ( not ( = ?auto_10366 ?auto_10367 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10367 ?auto_10366 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10368 - BLOCK
      ?auto_10369 - BLOCK
      ?auto_10370 - BLOCK
    )
    :vars
    (
      ?auto_10371 - BLOCK
      ?auto_10372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10371 ?auto_10370 ) ( CLEAR ?auto_10371 ) ( ON-TABLE ?auto_10368 ) ( ON ?auto_10369 ?auto_10368 ) ( ON ?auto_10370 ?auto_10369 ) ( not ( = ?auto_10368 ?auto_10369 ) ) ( not ( = ?auto_10368 ?auto_10370 ) ) ( not ( = ?auto_10368 ?auto_10371 ) ) ( not ( = ?auto_10369 ?auto_10370 ) ) ( not ( = ?auto_10369 ?auto_10371 ) ) ( not ( = ?auto_10370 ?auto_10371 ) ) ( HOLDING ?auto_10372 ) ( not ( = ?auto_10368 ?auto_10372 ) ) ( not ( = ?auto_10369 ?auto_10372 ) ) ( not ( = ?auto_10370 ?auto_10372 ) ) ( not ( = ?auto_10371 ?auto_10372 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_10372 )
      ( MAKE-3PILE ?auto_10368 ?auto_10369 ?auto_10370 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10373 - BLOCK
      ?auto_10374 - BLOCK
      ?auto_10375 - BLOCK
    )
    :vars
    (
      ?auto_10376 - BLOCK
      ?auto_10377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10376 ?auto_10375 ) ( ON-TABLE ?auto_10373 ) ( ON ?auto_10374 ?auto_10373 ) ( ON ?auto_10375 ?auto_10374 ) ( not ( = ?auto_10373 ?auto_10374 ) ) ( not ( = ?auto_10373 ?auto_10375 ) ) ( not ( = ?auto_10373 ?auto_10376 ) ) ( not ( = ?auto_10374 ?auto_10375 ) ) ( not ( = ?auto_10374 ?auto_10376 ) ) ( not ( = ?auto_10375 ?auto_10376 ) ) ( not ( = ?auto_10373 ?auto_10377 ) ) ( not ( = ?auto_10374 ?auto_10377 ) ) ( not ( = ?auto_10375 ?auto_10377 ) ) ( not ( = ?auto_10376 ?auto_10377 ) ) ( ON ?auto_10377 ?auto_10376 ) ( CLEAR ?auto_10377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10373 ?auto_10374 ?auto_10375 ?auto_10376 )
      ( MAKE-3PILE ?auto_10373 ?auto_10374 ?auto_10375 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10380 - BLOCK
      ?auto_10381 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_10381 ) ( CLEAR ?auto_10380 ) ( ON-TABLE ?auto_10380 ) ( not ( = ?auto_10380 ?auto_10381 ) ) )
    :subtasks
    ( ( !STACK ?auto_10381 ?auto_10380 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10382 - BLOCK
      ?auto_10383 - BLOCK
    )
    :vars
    (
      ?auto_10384 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10382 ) ( ON-TABLE ?auto_10382 ) ( not ( = ?auto_10382 ?auto_10383 ) ) ( ON ?auto_10383 ?auto_10384 ) ( CLEAR ?auto_10383 ) ( HAND-EMPTY ) ( not ( = ?auto_10382 ?auto_10384 ) ) ( not ( = ?auto_10383 ?auto_10384 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10383 ?auto_10384 )
      ( MAKE-2PILE ?auto_10382 ?auto_10383 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10385 - BLOCK
      ?auto_10386 - BLOCK
    )
    :vars
    (
      ?auto_10387 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10385 ?auto_10386 ) ) ( ON ?auto_10386 ?auto_10387 ) ( CLEAR ?auto_10386 ) ( not ( = ?auto_10385 ?auto_10387 ) ) ( not ( = ?auto_10386 ?auto_10387 ) ) ( HOLDING ?auto_10385 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10385 )
      ( MAKE-2PILE ?auto_10385 ?auto_10386 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10388 - BLOCK
      ?auto_10389 - BLOCK
    )
    :vars
    (
      ?auto_10390 - BLOCK
      ?auto_10391 - BLOCK
      ?auto_10392 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10388 ?auto_10389 ) ) ( ON ?auto_10389 ?auto_10390 ) ( not ( = ?auto_10388 ?auto_10390 ) ) ( not ( = ?auto_10389 ?auto_10390 ) ) ( ON ?auto_10388 ?auto_10389 ) ( CLEAR ?auto_10388 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10391 ) ( ON ?auto_10392 ?auto_10391 ) ( ON ?auto_10390 ?auto_10392 ) ( not ( = ?auto_10391 ?auto_10392 ) ) ( not ( = ?auto_10391 ?auto_10390 ) ) ( not ( = ?auto_10391 ?auto_10389 ) ) ( not ( = ?auto_10391 ?auto_10388 ) ) ( not ( = ?auto_10392 ?auto_10390 ) ) ( not ( = ?auto_10392 ?auto_10389 ) ) ( not ( = ?auto_10392 ?auto_10388 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10391 ?auto_10392 ?auto_10390 ?auto_10389 )
      ( MAKE-2PILE ?auto_10388 ?auto_10389 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10395 - BLOCK
      ?auto_10396 - BLOCK
    )
    :vars
    (
      ?auto_10397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10397 ?auto_10396 ) ( CLEAR ?auto_10397 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10395 ) ( ON ?auto_10396 ?auto_10395 ) ( not ( = ?auto_10395 ?auto_10396 ) ) ( not ( = ?auto_10395 ?auto_10397 ) ) ( not ( = ?auto_10396 ?auto_10397 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10397 ?auto_10396 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10398 - BLOCK
      ?auto_10399 - BLOCK
    )
    :vars
    (
      ?auto_10400 - BLOCK
      ?auto_10401 - BLOCK
      ?auto_10402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10400 ?auto_10399 ) ( CLEAR ?auto_10400 ) ( ON-TABLE ?auto_10398 ) ( ON ?auto_10399 ?auto_10398 ) ( not ( = ?auto_10398 ?auto_10399 ) ) ( not ( = ?auto_10398 ?auto_10400 ) ) ( not ( = ?auto_10399 ?auto_10400 ) ) ( HOLDING ?auto_10401 ) ( CLEAR ?auto_10402 ) ( not ( = ?auto_10398 ?auto_10401 ) ) ( not ( = ?auto_10398 ?auto_10402 ) ) ( not ( = ?auto_10399 ?auto_10401 ) ) ( not ( = ?auto_10399 ?auto_10402 ) ) ( not ( = ?auto_10400 ?auto_10401 ) ) ( not ( = ?auto_10400 ?auto_10402 ) ) ( not ( = ?auto_10401 ?auto_10402 ) ) )
    :subtasks
    ( ( !STACK ?auto_10401 ?auto_10402 )
      ( MAKE-2PILE ?auto_10398 ?auto_10399 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10598 - BLOCK
      ?auto_10599 - BLOCK
    )
    :vars
    (
      ?auto_10600 - BLOCK
      ?auto_10601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10600 ?auto_10599 ) ( ON-TABLE ?auto_10598 ) ( ON ?auto_10599 ?auto_10598 ) ( not ( = ?auto_10598 ?auto_10599 ) ) ( not ( = ?auto_10598 ?auto_10600 ) ) ( not ( = ?auto_10599 ?auto_10600 ) ) ( not ( = ?auto_10598 ?auto_10601 ) ) ( not ( = ?auto_10599 ?auto_10601 ) ) ( not ( = ?auto_10600 ?auto_10601 ) ) ( ON ?auto_10601 ?auto_10600 ) ( CLEAR ?auto_10601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10598 ?auto_10599 ?auto_10600 )
      ( MAKE-2PILE ?auto_10598 ?auto_10599 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10408 - BLOCK
      ?auto_10409 - BLOCK
    )
    :vars
    (
      ?auto_10411 - BLOCK
      ?auto_10410 - BLOCK
      ?auto_10412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10411 ?auto_10409 ) ( ON-TABLE ?auto_10408 ) ( ON ?auto_10409 ?auto_10408 ) ( not ( = ?auto_10408 ?auto_10409 ) ) ( not ( = ?auto_10408 ?auto_10411 ) ) ( not ( = ?auto_10409 ?auto_10411 ) ) ( not ( = ?auto_10408 ?auto_10410 ) ) ( not ( = ?auto_10408 ?auto_10412 ) ) ( not ( = ?auto_10409 ?auto_10410 ) ) ( not ( = ?auto_10409 ?auto_10412 ) ) ( not ( = ?auto_10411 ?auto_10410 ) ) ( not ( = ?auto_10411 ?auto_10412 ) ) ( not ( = ?auto_10410 ?auto_10412 ) ) ( ON ?auto_10410 ?auto_10411 ) ( CLEAR ?auto_10410 ) ( HOLDING ?auto_10412 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10412 )
      ( MAKE-2PILE ?auto_10408 ?auto_10409 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10413 - BLOCK
      ?auto_10414 - BLOCK
    )
    :vars
    (
      ?auto_10416 - BLOCK
      ?auto_10415 - BLOCK
      ?auto_10417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10416 ?auto_10414 ) ( ON-TABLE ?auto_10413 ) ( ON ?auto_10414 ?auto_10413 ) ( not ( = ?auto_10413 ?auto_10414 ) ) ( not ( = ?auto_10413 ?auto_10416 ) ) ( not ( = ?auto_10414 ?auto_10416 ) ) ( not ( = ?auto_10413 ?auto_10415 ) ) ( not ( = ?auto_10413 ?auto_10417 ) ) ( not ( = ?auto_10414 ?auto_10415 ) ) ( not ( = ?auto_10414 ?auto_10417 ) ) ( not ( = ?auto_10416 ?auto_10415 ) ) ( not ( = ?auto_10416 ?auto_10417 ) ) ( not ( = ?auto_10415 ?auto_10417 ) ) ( ON ?auto_10415 ?auto_10416 ) ( ON ?auto_10417 ?auto_10415 ) ( CLEAR ?auto_10417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10413 ?auto_10414 ?auto_10416 ?auto_10415 )
      ( MAKE-2PILE ?auto_10413 ?auto_10414 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10421 - BLOCK
      ?auto_10422 - BLOCK
      ?auto_10423 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_10423 ) ( CLEAR ?auto_10422 ) ( ON-TABLE ?auto_10421 ) ( ON ?auto_10422 ?auto_10421 ) ( not ( = ?auto_10421 ?auto_10422 ) ) ( not ( = ?auto_10421 ?auto_10423 ) ) ( not ( = ?auto_10422 ?auto_10423 ) ) )
    :subtasks
    ( ( !STACK ?auto_10423 ?auto_10422 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10424 - BLOCK
      ?auto_10425 - BLOCK
      ?auto_10426 - BLOCK
    )
    :vars
    (
      ?auto_10427 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10425 ) ( ON-TABLE ?auto_10424 ) ( ON ?auto_10425 ?auto_10424 ) ( not ( = ?auto_10424 ?auto_10425 ) ) ( not ( = ?auto_10424 ?auto_10426 ) ) ( not ( = ?auto_10425 ?auto_10426 ) ) ( ON ?auto_10426 ?auto_10427 ) ( CLEAR ?auto_10426 ) ( HAND-EMPTY ) ( not ( = ?auto_10424 ?auto_10427 ) ) ( not ( = ?auto_10425 ?auto_10427 ) ) ( not ( = ?auto_10426 ?auto_10427 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10426 ?auto_10427 )
      ( MAKE-3PILE ?auto_10424 ?auto_10425 ?auto_10426 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10428 - BLOCK
      ?auto_10429 - BLOCK
      ?auto_10430 - BLOCK
    )
    :vars
    (
      ?auto_10431 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10428 ) ( not ( = ?auto_10428 ?auto_10429 ) ) ( not ( = ?auto_10428 ?auto_10430 ) ) ( not ( = ?auto_10429 ?auto_10430 ) ) ( ON ?auto_10430 ?auto_10431 ) ( CLEAR ?auto_10430 ) ( not ( = ?auto_10428 ?auto_10431 ) ) ( not ( = ?auto_10429 ?auto_10431 ) ) ( not ( = ?auto_10430 ?auto_10431 ) ) ( HOLDING ?auto_10429 ) ( CLEAR ?auto_10428 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10428 ?auto_10429 )
      ( MAKE-3PILE ?auto_10428 ?auto_10429 ?auto_10430 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10432 - BLOCK
      ?auto_10433 - BLOCK
      ?auto_10434 - BLOCK
    )
    :vars
    (
      ?auto_10435 - BLOCK
      ?auto_10436 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10432 ) ( not ( = ?auto_10432 ?auto_10433 ) ) ( not ( = ?auto_10432 ?auto_10434 ) ) ( not ( = ?auto_10433 ?auto_10434 ) ) ( ON ?auto_10434 ?auto_10435 ) ( not ( = ?auto_10432 ?auto_10435 ) ) ( not ( = ?auto_10433 ?auto_10435 ) ) ( not ( = ?auto_10434 ?auto_10435 ) ) ( CLEAR ?auto_10432 ) ( ON ?auto_10433 ?auto_10434 ) ( CLEAR ?auto_10433 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10436 ) ( ON ?auto_10435 ?auto_10436 ) ( not ( = ?auto_10436 ?auto_10435 ) ) ( not ( = ?auto_10436 ?auto_10434 ) ) ( not ( = ?auto_10436 ?auto_10433 ) ) ( not ( = ?auto_10432 ?auto_10436 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10436 ?auto_10435 ?auto_10434 )
      ( MAKE-3PILE ?auto_10432 ?auto_10433 ?auto_10434 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10437 - BLOCK
      ?auto_10438 - BLOCK
      ?auto_10439 - BLOCK
    )
    :vars
    (
      ?auto_10440 - BLOCK
      ?auto_10441 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10437 ?auto_10438 ) ) ( not ( = ?auto_10437 ?auto_10439 ) ) ( not ( = ?auto_10438 ?auto_10439 ) ) ( ON ?auto_10439 ?auto_10440 ) ( not ( = ?auto_10437 ?auto_10440 ) ) ( not ( = ?auto_10438 ?auto_10440 ) ) ( not ( = ?auto_10439 ?auto_10440 ) ) ( ON ?auto_10438 ?auto_10439 ) ( CLEAR ?auto_10438 ) ( ON-TABLE ?auto_10441 ) ( ON ?auto_10440 ?auto_10441 ) ( not ( = ?auto_10441 ?auto_10440 ) ) ( not ( = ?auto_10441 ?auto_10439 ) ) ( not ( = ?auto_10441 ?auto_10438 ) ) ( not ( = ?auto_10437 ?auto_10441 ) ) ( HOLDING ?auto_10437 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10437 )
      ( MAKE-3PILE ?auto_10437 ?auto_10438 ?auto_10439 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10442 - BLOCK
      ?auto_10443 - BLOCK
      ?auto_10444 - BLOCK
    )
    :vars
    (
      ?auto_10445 - BLOCK
      ?auto_10446 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10442 ?auto_10443 ) ) ( not ( = ?auto_10442 ?auto_10444 ) ) ( not ( = ?auto_10443 ?auto_10444 ) ) ( ON ?auto_10444 ?auto_10445 ) ( not ( = ?auto_10442 ?auto_10445 ) ) ( not ( = ?auto_10443 ?auto_10445 ) ) ( not ( = ?auto_10444 ?auto_10445 ) ) ( ON ?auto_10443 ?auto_10444 ) ( ON-TABLE ?auto_10446 ) ( ON ?auto_10445 ?auto_10446 ) ( not ( = ?auto_10446 ?auto_10445 ) ) ( not ( = ?auto_10446 ?auto_10444 ) ) ( not ( = ?auto_10446 ?auto_10443 ) ) ( not ( = ?auto_10442 ?auto_10446 ) ) ( ON ?auto_10442 ?auto_10443 ) ( CLEAR ?auto_10442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10446 ?auto_10445 ?auto_10444 ?auto_10443 )
      ( MAKE-3PILE ?auto_10442 ?auto_10443 ?auto_10444 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10448 - BLOCK
    )
    :vars
    (
      ?auto_10449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10449 ?auto_10448 ) ( CLEAR ?auto_10449 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10448 ) ( not ( = ?auto_10448 ?auto_10449 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10449 ?auto_10448 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10450 - BLOCK
    )
    :vars
    (
      ?auto_10451 - BLOCK
      ?auto_10452 - BLOCK
      ?auto_10453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10451 ?auto_10450 ) ( CLEAR ?auto_10451 ) ( ON-TABLE ?auto_10450 ) ( not ( = ?auto_10450 ?auto_10451 ) ) ( HOLDING ?auto_10452 ) ( CLEAR ?auto_10453 ) ( not ( = ?auto_10450 ?auto_10452 ) ) ( not ( = ?auto_10450 ?auto_10453 ) ) ( not ( = ?auto_10451 ?auto_10452 ) ) ( not ( = ?auto_10451 ?auto_10453 ) ) ( not ( = ?auto_10452 ?auto_10453 ) ) )
    :subtasks
    ( ( !STACK ?auto_10452 ?auto_10453 )
      ( MAKE-1PILE ?auto_10450 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10454 - BLOCK
    )
    :vars
    (
      ?auto_10457 - BLOCK
      ?auto_10455 - BLOCK
      ?auto_10456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10457 ?auto_10454 ) ( ON-TABLE ?auto_10454 ) ( not ( = ?auto_10454 ?auto_10457 ) ) ( CLEAR ?auto_10455 ) ( not ( = ?auto_10454 ?auto_10456 ) ) ( not ( = ?auto_10454 ?auto_10455 ) ) ( not ( = ?auto_10457 ?auto_10456 ) ) ( not ( = ?auto_10457 ?auto_10455 ) ) ( not ( = ?auto_10456 ?auto_10455 ) ) ( ON ?auto_10456 ?auto_10457 ) ( CLEAR ?auto_10456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10454 ?auto_10457 )
      ( MAKE-1PILE ?auto_10454 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10458 - BLOCK
    )
    :vars
    (
      ?auto_10460 - BLOCK
      ?auto_10459 - BLOCK
      ?auto_10461 - BLOCK
      ?auto_10462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10460 ?auto_10458 ) ( ON-TABLE ?auto_10458 ) ( not ( = ?auto_10458 ?auto_10460 ) ) ( not ( = ?auto_10458 ?auto_10459 ) ) ( not ( = ?auto_10458 ?auto_10461 ) ) ( not ( = ?auto_10460 ?auto_10459 ) ) ( not ( = ?auto_10460 ?auto_10461 ) ) ( not ( = ?auto_10459 ?auto_10461 ) ) ( ON ?auto_10459 ?auto_10460 ) ( CLEAR ?auto_10459 ) ( HOLDING ?auto_10461 ) ( CLEAR ?auto_10462 ) ( ON-TABLE ?auto_10462 ) ( not ( = ?auto_10462 ?auto_10461 ) ) ( not ( = ?auto_10458 ?auto_10462 ) ) ( not ( = ?auto_10460 ?auto_10462 ) ) ( not ( = ?auto_10459 ?auto_10462 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10462 ?auto_10461 )
      ( MAKE-1PILE ?auto_10458 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10686 - BLOCK
    )
    :vars
    (
      ?auto_10688 - BLOCK
      ?auto_10687 - BLOCK
      ?auto_10689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10688 ?auto_10686 ) ( ON-TABLE ?auto_10686 ) ( not ( = ?auto_10686 ?auto_10688 ) ) ( not ( = ?auto_10686 ?auto_10687 ) ) ( not ( = ?auto_10686 ?auto_10689 ) ) ( not ( = ?auto_10688 ?auto_10687 ) ) ( not ( = ?auto_10688 ?auto_10689 ) ) ( not ( = ?auto_10687 ?auto_10689 ) ) ( ON ?auto_10687 ?auto_10688 ) ( ON ?auto_10689 ?auto_10687 ) ( CLEAR ?auto_10689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10686 ?auto_10688 ?auto_10687 )
      ( MAKE-1PILE ?auto_10686 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10468 - BLOCK
    )
    :vars
    (
      ?auto_10471 - BLOCK
      ?auto_10469 - BLOCK
      ?auto_10472 - BLOCK
      ?auto_10470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10471 ?auto_10468 ) ( ON-TABLE ?auto_10468 ) ( not ( = ?auto_10468 ?auto_10471 ) ) ( not ( = ?auto_10468 ?auto_10469 ) ) ( not ( = ?auto_10468 ?auto_10472 ) ) ( not ( = ?auto_10471 ?auto_10469 ) ) ( not ( = ?auto_10471 ?auto_10472 ) ) ( not ( = ?auto_10469 ?auto_10472 ) ) ( ON ?auto_10469 ?auto_10471 ) ( not ( = ?auto_10470 ?auto_10472 ) ) ( not ( = ?auto_10468 ?auto_10470 ) ) ( not ( = ?auto_10471 ?auto_10470 ) ) ( not ( = ?auto_10469 ?auto_10470 ) ) ( ON ?auto_10472 ?auto_10469 ) ( CLEAR ?auto_10472 ) ( HOLDING ?auto_10470 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10470 )
      ( MAKE-1PILE ?auto_10468 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10473 - BLOCK
    )
    :vars
    (
      ?auto_10476 - BLOCK
      ?auto_10477 - BLOCK
      ?auto_10474 - BLOCK
      ?auto_10475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10476 ?auto_10473 ) ( ON-TABLE ?auto_10473 ) ( not ( = ?auto_10473 ?auto_10476 ) ) ( not ( = ?auto_10473 ?auto_10477 ) ) ( not ( = ?auto_10473 ?auto_10474 ) ) ( not ( = ?auto_10476 ?auto_10477 ) ) ( not ( = ?auto_10476 ?auto_10474 ) ) ( not ( = ?auto_10477 ?auto_10474 ) ) ( ON ?auto_10477 ?auto_10476 ) ( not ( = ?auto_10475 ?auto_10474 ) ) ( not ( = ?auto_10473 ?auto_10475 ) ) ( not ( = ?auto_10476 ?auto_10475 ) ) ( not ( = ?auto_10477 ?auto_10475 ) ) ( ON ?auto_10474 ?auto_10477 ) ( ON ?auto_10475 ?auto_10474 ) ( CLEAR ?auto_10475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10473 ?auto_10476 ?auto_10477 ?auto_10474 )
      ( MAKE-1PILE ?auto_10473 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10482 - BLOCK
      ?auto_10483 - BLOCK
      ?auto_10484 - BLOCK
      ?auto_10485 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_10485 ) ( CLEAR ?auto_10484 ) ( ON-TABLE ?auto_10482 ) ( ON ?auto_10483 ?auto_10482 ) ( ON ?auto_10484 ?auto_10483 ) ( not ( = ?auto_10482 ?auto_10483 ) ) ( not ( = ?auto_10482 ?auto_10484 ) ) ( not ( = ?auto_10482 ?auto_10485 ) ) ( not ( = ?auto_10483 ?auto_10484 ) ) ( not ( = ?auto_10483 ?auto_10485 ) ) ( not ( = ?auto_10484 ?auto_10485 ) ) )
    :subtasks
    ( ( !STACK ?auto_10485 ?auto_10484 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10486 - BLOCK
      ?auto_10487 - BLOCK
      ?auto_10488 - BLOCK
      ?auto_10489 - BLOCK
    )
    :vars
    (
      ?auto_10490 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10488 ) ( ON-TABLE ?auto_10486 ) ( ON ?auto_10487 ?auto_10486 ) ( ON ?auto_10488 ?auto_10487 ) ( not ( = ?auto_10486 ?auto_10487 ) ) ( not ( = ?auto_10486 ?auto_10488 ) ) ( not ( = ?auto_10486 ?auto_10489 ) ) ( not ( = ?auto_10487 ?auto_10488 ) ) ( not ( = ?auto_10487 ?auto_10489 ) ) ( not ( = ?auto_10488 ?auto_10489 ) ) ( ON ?auto_10489 ?auto_10490 ) ( CLEAR ?auto_10489 ) ( HAND-EMPTY ) ( not ( = ?auto_10486 ?auto_10490 ) ) ( not ( = ?auto_10487 ?auto_10490 ) ) ( not ( = ?auto_10488 ?auto_10490 ) ) ( not ( = ?auto_10489 ?auto_10490 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10489 ?auto_10490 )
      ( MAKE-4PILE ?auto_10486 ?auto_10487 ?auto_10488 ?auto_10489 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10491 - BLOCK
      ?auto_10492 - BLOCK
      ?auto_10493 - BLOCK
      ?auto_10494 - BLOCK
    )
    :vars
    (
      ?auto_10495 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10491 ) ( ON ?auto_10492 ?auto_10491 ) ( not ( = ?auto_10491 ?auto_10492 ) ) ( not ( = ?auto_10491 ?auto_10493 ) ) ( not ( = ?auto_10491 ?auto_10494 ) ) ( not ( = ?auto_10492 ?auto_10493 ) ) ( not ( = ?auto_10492 ?auto_10494 ) ) ( not ( = ?auto_10493 ?auto_10494 ) ) ( ON ?auto_10494 ?auto_10495 ) ( CLEAR ?auto_10494 ) ( not ( = ?auto_10491 ?auto_10495 ) ) ( not ( = ?auto_10492 ?auto_10495 ) ) ( not ( = ?auto_10493 ?auto_10495 ) ) ( not ( = ?auto_10494 ?auto_10495 ) ) ( HOLDING ?auto_10493 ) ( CLEAR ?auto_10492 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10491 ?auto_10492 ?auto_10493 )
      ( MAKE-4PILE ?auto_10491 ?auto_10492 ?auto_10493 ?auto_10494 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10496 - BLOCK
      ?auto_10497 - BLOCK
      ?auto_10498 - BLOCK
      ?auto_10499 - BLOCK
    )
    :vars
    (
      ?auto_10500 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10496 ) ( ON ?auto_10497 ?auto_10496 ) ( not ( = ?auto_10496 ?auto_10497 ) ) ( not ( = ?auto_10496 ?auto_10498 ) ) ( not ( = ?auto_10496 ?auto_10499 ) ) ( not ( = ?auto_10497 ?auto_10498 ) ) ( not ( = ?auto_10497 ?auto_10499 ) ) ( not ( = ?auto_10498 ?auto_10499 ) ) ( ON ?auto_10499 ?auto_10500 ) ( not ( = ?auto_10496 ?auto_10500 ) ) ( not ( = ?auto_10497 ?auto_10500 ) ) ( not ( = ?auto_10498 ?auto_10500 ) ) ( not ( = ?auto_10499 ?auto_10500 ) ) ( CLEAR ?auto_10497 ) ( ON ?auto_10498 ?auto_10499 ) ( CLEAR ?auto_10498 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10500 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10500 ?auto_10499 )
      ( MAKE-4PILE ?auto_10496 ?auto_10497 ?auto_10498 ?auto_10499 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10501 - BLOCK
      ?auto_10502 - BLOCK
      ?auto_10503 - BLOCK
      ?auto_10504 - BLOCK
    )
    :vars
    (
      ?auto_10505 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10501 ) ( not ( = ?auto_10501 ?auto_10502 ) ) ( not ( = ?auto_10501 ?auto_10503 ) ) ( not ( = ?auto_10501 ?auto_10504 ) ) ( not ( = ?auto_10502 ?auto_10503 ) ) ( not ( = ?auto_10502 ?auto_10504 ) ) ( not ( = ?auto_10503 ?auto_10504 ) ) ( ON ?auto_10504 ?auto_10505 ) ( not ( = ?auto_10501 ?auto_10505 ) ) ( not ( = ?auto_10502 ?auto_10505 ) ) ( not ( = ?auto_10503 ?auto_10505 ) ) ( not ( = ?auto_10504 ?auto_10505 ) ) ( ON ?auto_10503 ?auto_10504 ) ( CLEAR ?auto_10503 ) ( ON-TABLE ?auto_10505 ) ( HOLDING ?auto_10502 ) ( CLEAR ?auto_10501 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10501 ?auto_10502 )
      ( MAKE-4PILE ?auto_10501 ?auto_10502 ?auto_10503 ?auto_10504 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10506 - BLOCK
      ?auto_10507 - BLOCK
      ?auto_10508 - BLOCK
      ?auto_10509 - BLOCK
    )
    :vars
    (
      ?auto_10510 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10506 ) ( not ( = ?auto_10506 ?auto_10507 ) ) ( not ( = ?auto_10506 ?auto_10508 ) ) ( not ( = ?auto_10506 ?auto_10509 ) ) ( not ( = ?auto_10507 ?auto_10508 ) ) ( not ( = ?auto_10507 ?auto_10509 ) ) ( not ( = ?auto_10508 ?auto_10509 ) ) ( ON ?auto_10509 ?auto_10510 ) ( not ( = ?auto_10506 ?auto_10510 ) ) ( not ( = ?auto_10507 ?auto_10510 ) ) ( not ( = ?auto_10508 ?auto_10510 ) ) ( not ( = ?auto_10509 ?auto_10510 ) ) ( ON ?auto_10508 ?auto_10509 ) ( ON-TABLE ?auto_10510 ) ( CLEAR ?auto_10506 ) ( ON ?auto_10507 ?auto_10508 ) ( CLEAR ?auto_10507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10510 ?auto_10509 ?auto_10508 )
      ( MAKE-4PILE ?auto_10506 ?auto_10507 ?auto_10508 ?auto_10509 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10511 - BLOCK
      ?auto_10512 - BLOCK
      ?auto_10513 - BLOCK
      ?auto_10514 - BLOCK
    )
    :vars
    (
      ?auto_10515 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10511 ?auto_10512 ) ) ( not ( = ?auto_10511 ?auto_10513 ) ) ( not ( = ?auto_10511 ?auto_10514 ) ) ( not ( = ?auto_10512 ?auto_10513 ) ) ( not ( = ?auto_10512 ?auto_10514 ) ) ( not ( = ?auto_10513 ?auto_10514 ) ) ( ON ?auto_10514 ?auto_10515 ) ( not ( = ?auto_10511 ?auto_10515 ) ) ( not ( = ?auto_10512 ?auto_10515 ) ) ( not ( = ?auto_10513 ?auto_10515 ) ) ( not ( = ?auto_10514 ?auto_10515 ) ) ( ON ?auto_10513 ?auto_10514 ) ( ON-TABLE ?auto_10515 ) ( ON ?auto_10512 ?auto_10513 ) ( CLEAR ?auto_10512 ) ( HOLDING ?auto_10511 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10511 )
      ( MAKE-4PILE ?auto_10511 ?auto_10512 ?auto_10513 ?auto_10514 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10516 - BLOCK
      ?auto_10517 - BLOCK
      ?auto_10518 - BLOCK
      ?auto_10519 - BLOCK
    )
    :vars
    (
      ?auto_10520 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10516 ?auto_10517 ) ) ( not ( = ?auto_10516 ?auto_10518 ) ) ( not ( = ?auto_10516 ?auto_10519 ) ) ( not ( = ?auto_10517 ?auto_10518 ) ) ( not ( = ?auto_10517 ?auto_10519 ) ) ( not ( = ?auto_10518 ?auto_10519 ) ) ( ON ?auto_10519 ?auto_10520 ) ( not ( = ?auto_10516 ?auto_10520 ) ) ( not ( = ?auto_10517 ?auto_10520 ) ) ( not ( = ?auto_10518 ?auto_10520 ) ) ( not ( = ?auto_10519 ?auto_10520 ) ) ( ON ?auto_10518 ?auto_10519 ) ( ON-TABLE ?auto_10520 ) ( ON ?auto_10517 ?auto_10518 ) ( ON ?auto_10516 ?auto_10517 ) ( CLEAR ?auto_10516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10520 ?auto_10519 ?auto_10518 ?auto_10517 )
      ( MAKE-4PILE ?auto_10516 ?auto_10517 ?auto_10518 ?auto_10519 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10561 - BLOCK
    )
    :vars
    (
      ?auto_10562 - BLOCK
      ?auto_10563 - BLOCK
      ?auto_10564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10561 ?auto_10562 ) ( CLEAR ?auto_10561 ) ( not ( = ?auto_10561 ?auto_10562 ) ) ( HOLDING ?auto_10563 ) ( CLEAR ?auto_10564 ) ( not ( = ?auto_10561 ?auto_10563 ) ) ( not ( = ?auto_10561 ?auto_10564 ) ) ( not ( = ?auto_10562 ?auto_10563 ) ) ( not ( = ?auto_10562 ?auto_10564 ) ) ( not ( = ?auto_10563 ?auto_10564 ) ) )
    :subtasks
    ( ( !STACK ?auto_10563 ?auto_10564 )
      ( MAKE-1PILE ?auto_10561 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10565 - BLOCK
    )
    :vars
    (
      ?auto_10566 - BLOCK
      ?auto_10568 - BLOCK
      ?auto_10567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10565 ?auto_10566 ) ( not ( = ?auto_10565 ?auto_10566 ) ) ( CLEAR ?auto_10568 ) ( not ( = ?auto_10565 ?auto_10567 ) ) ( not ( = ?auto_10565 ?auto_10568 ) ) ( not ( = ?auto_10566 ?auto_10567 ) ) ( not ( = ?auto_10566 ?auto_10568 ) ) ( not ( = ?auto_10567 ?auto_10568 ) ) ( ON ?auto_10567 ?auto_10565 ) ( CLEAR ?auto_10567 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10566 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10566 ?auto_10565 )
      ( MAKE-1PILE ?auto_10565 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10569 - BLOCK
    )
    :vars
    (
      ?auto_10572 - BLOCK
      ?auto_10570 - BLOCK
      ?auto_10571 - BLOCK
      ?auto_10573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10569 ?auto_10572 ) ( not ( = ?auto_10569 ?auto_10572 ) ) ( not ( = ?auto_10569 ?auto_10570 ) ) ( not ( = ?auto_10569 ?auto_10571 ) ) ( not ( = ?auto_10572 ?auto_10570 ) ) ( not ( = ?auto_10572 ?auto_10571 ) ) ( not ( = ?auto_10570 ?auto_10571 ) ) ( ON ?auto_10570 ?auto_10569 ) ( CLEAR ?auto_10570 ) ( ON-TABLE ?auto_10572 ) ( HOLDING ?auto_10571 ) ( CLEAR ?auto_10573 ) ( ON-TABLE ?auto_10573 ) ( not ( = ?auto_10573 ?auto_10571 ) ) ( not ( = ?auto_10569 ?auto_10573 ) ) ( not ( = ?auto_10572 ?auto_10573 ) ) ( not ( = ?auto_10570 ?auto_10573 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10573 ?auto_10571 )
      ( MAKE-1PILE ?auto_10569 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10574 - BLOCK
    )
    :vars
    (
      ?auto_10578 - BLOCK
      ?auto_10576 - BLOCK
      ?auto_10577 - BLOCK
      ?auto_10575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10574 ?auto_10578 ) ( not ( = ?auto_10574 ?auto_10578 ) ) ( not ( = ?auto_10574 ?auto_10576 ) ) ( not ( = ?auto_10574 ?auto_10577 ) ) ( not ( = ?auto_10578 ?auto_10576 ) ) ( not ( = ?auto_10578 ?auto_10577 ) ) ( not ( = ?auto_10576 ?auto_10577 ) ) ( ON ?auto_10576 ?auto_10574 ) ( ON-TABLE ?auto_10578 ) ( CLEAR ?auto_10575 ) ( ON-TABLE ?auto_10575 ) ( not ( = ?auto_10575 ?auto_10577 ) ) ( not ( = ?auto_10574 ?auto_10575 ) ) ( not ( = ?auto_10578 ?auto_10575 ) ) ( not ( = ?auto_10576 ?auto_10575 ) ) ( ON ?auto_10577 ?auto_10576 ) ( CLEAR ?auto_10577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10578 ?auto_10574 ?auto_10576 )
      ( MAKE-1PILE ?auto_10574 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10579 - BLOCK
    )
    :vars
    (
      ?auto_10580 - BLOCK
      ?auto_10583 - BLOCK
      ?auto_10582 - BLOCK
      ?auto_10581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10579 ?auto_10580 ) ( not ( = ?auto_10579 ?auto_10580 ) ) ( not ( = ?auto_10579 ?auto_10583 ) ) ( not ( = ?auto_10579 ?auto_10582 ) ) ( not ( = ?auto_10580 ?auto_10583 ) ) ( not ( = ?auto_10580 ?auto_10582 ) ) ( not ( = ?auto_10583 ?auto_10582 ) ) ( ON ?auto_10583 ?auto_10579 ) ( ON-TABLE ?auto_10580 ) ( not ( = ?auto_10581 ?auto_10582 ) ) ( not ( = ?auto_10579 ?auto_10581 ) ) ( not ( = ?auto_10580 ?auto_10581 ) ) ( not ( = ?auto_10583 ?auto_10581 ) ) ( ON ?auto_10582 ?auto_10583 ) ( CLEAR ?auto_10582 ) ( HOLDING ?auto_10581 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10581 )
      ( MAKE-1PILE ?auto_10579 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10584 - BLOCK
    )
    :vars
    (
      ?auto_10587 - BLOCK
      ?auto_10585 - BLOCK
      ?auto_10586 - BLOCK
      ?auto_10588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10584 ?auto_10587 ) ( not ( = ?auto_10584 ?auto_10587 ) ) ( not ( = ?auto_10584 ?auto_10585 ) ) ( not ( = ?auto_10584 ?auto_10586 ) ) ( not ( = ?auto_10587 ?auto_10585 ) ) ( not ( = ?auto_10587 ?auto_10586 ) ) ( not ( = ?auto_10585 ?auto_10586 ) ) ( ON ?auto_10585 ?auto_10584 ) ( ON-TABLE ?auto_10587 ) ( not ( = ?auto_10588 ?auto_10586 ) ) ( not ( = ?auto_10584 ?auto_10588 ) ) ( not ( = ?auto_10587 ?auto_10588 ) ) ( not ( = ?auto_10585 ?auto_10588 ) ) ( ON ?auto_10586 ?auto_10585 ) ( ON ?auto_10588 ?auto_10586 ) ( CLEAR ?auto_10588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10587 ?auto_10584 ?auto_10585 ?auto_10586 )
      ( MAKE-1PILE ?auto_10584 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10594 - BLOCK
      ?auto_10595 - BLOCK
    )
    :vars
    (
      ?auto_10596 - BLOCK
      ?auto_10597 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10596 ?auto_10595 ) ( CLEAR ?auto_10596 ) ( ON-TABLE ?auto_10594 ) ( ON ?auto_10595 ?auto_10594 ) ( not ( = ?auto_10594 ?auto_10595 ) ) ( not ( = ?auto_10594 ?auto_10596 ) ) ( not ( = ?auto_10595 ?auto_10596 ) ) ( HOLDING ?auto_10597 ) ( not ( = ?auto_10594 ?auto_10597 ) ) ( not ( = ?auto_10595 ?auto_10597 ) ) ( not ( = ?auto_10596 ?auto_10597 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_10597 )
      ( MAKE-2PILE ?auto_10594 ?auto_10595 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10631 - BLOCK
      ?auto_10632 - BLOCK
    )
    :vars
    (
      ?auto_10633 - BLOCK
      ?auto_10634 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10631 ?auto_10632 ) ) ( ON ?auto_10632 ?auto_10633 ) ( not ( = ?auto_10631 ?auto_10633 ) ) ( not ( = ?auto_10632 ?auto_10633 ) ) ( ON ?auto_10631 ?auto_10632 ) ( CLEAR ?auto_10631 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10634 ) ( ON ?auto_10633 ?auto_10634 ) ( not ( = ?auto_10634 ?auto_10633 ) ) ( not ( = ?auto_10634 ?auto_10632 ) ) ( not ( = ?auto_10634 ?auto_10631 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10634 ?auto_10633 ?auto_10632 )
      ( MAKE-2PILE ?auto_10631 ?auto_10632 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10637 - BLOCK
      ?auto_10638 - BLOCK
    )
    :vars
    (
      ?auto_10639 - BLOCK
      ?auto_10640 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10637 ?auto_10638 ) ) ( ON ?auto_10638 ?auto_10639 ) ( CLEAR ?auto_10638 ) ( not ( = ?auto_10637 ?auto_10639 ) ) ( not ( = ?auto_10638 ?auto_10639 ) ) ( ON ?auto_10637 ?auto_10640 ) ( CLEAR ?auto_10637 ) ( HAND-EMPTY ) ( not ( = ?auto_10637 ?auto_10640 ) ) ( not ( = ?auto_10638 ?auto_10640 ) ) ( not ( = ?auto_10639 ?auto_10640 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10637 ?auto_10640 )
      ( MAKE-2PILE ?auto_10637 ?auto_10638 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10641 - BLOCK
      ?auto_10642 - BLOCK
    )
    :vars
    (
      ?auto_10644 - BLOCK
      ?auto_10643 - BLOCK
      ?auto_10645 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10641 ?auto_10642 ) ) ( not ( = ?auto_10641 ?auto_10644 ) ) ( not ( = ?auto_10642 ?auto_10644 ) ) ( ON ?auto_10641 ?auto_10643 ) ( CLEAR ?auto_10641 ) ( not ( = ?auto_10641 ?auto_10643 ) ) ( not ( = ?auto_10642 ?auto_10643 ) ) ( not ( = ?auto_10644 ?auto_10643 ) ) ( HOLDING ?auto_10642 ) ( CLEAR ?auto_10644 ) ( ON-TABLE ?auto_10645 ) ( ON ?auto_10644 ?auto_10645 ) ( not ( = ?auto_10645 ?auto_10644 ) ) ( not ( = ?auto_10645 ?auto_10642 ) ) ( not ( = ?auto_10641 ?auto_10645 ) ) ( not ( = ?auto_10643 ?auto_10645 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10645 ?auto_10644 ?auto_10642 )
      ( MAKE-2PILE ?auto_10641 ?auto_10642 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10646 - BLOCK
      ?auto_10647 - BLOCK
    )
    :vars
    (
      ?auto_10648 - BLOCK
      ?auto_10650 - BLOCK
      ?auto_10649 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10646 ?auto_10647 ) ) ( not ( = ?auto_10646 ?auto_10648 ) ) ( not ( = ?auto_10647 ?auto_10648 ) ) ( ON ?auto_10646 ?auto_10650 ) ( not ( = ?auto_10646 ?auto_10650 ) ) ( not ( = ?auto_10647 ?auto_10650 ) ) ( not ( = ?auto_10648 ?auto_10650 ) ) ( CLEAR ?auto_10648 ) ( ON-TABLE ?auto_10649 ) ( ON ?auto_10648 ?auto_10649 ) ( not ( = ?auto_10649 ?auto_10648 ) ) ( not ( = ?auto_10649 ?auto_10647 ) ) ( not ( = ?auto_10646 ?auto_10649 ) ) ( not ( = ?auto_10650 ?auto_10649 ) ) ( ON ?auto_10647 ?auto_10646 ) ( CLEAR ?auto_10647 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10650 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10650 ?auto_10646 )
      ( MAKE-2PILE ?auto_10646 ?auto_10647 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10651 - BLOCK
      ?auto_10652 - BLOCK
    )
    :vars
    (
      ?auto_10653 - BLOCK
      ?auto_10655 - BLOCK
      ?auto_10654 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10651 ?auto_10652 ) ) ( not ( = ?auto_10651 ?auto_10653 ) ) ( not ( = ?auto_10652 ?auto_10653 ) ) ( ON ?auto_10651 ?auto_10655 ) ( not ( = ?auto_10651 ?auto_10655 ) ) ( not ( = ?auto_10652 ?auto_10655 ) ) ( not ( = ?auto_10653 ?auto_10655 ) ) ( ON-TABLE ?auto_10654 ) ( not ( = ?auto_10654 ?auto_10653 ) ) ( not ( = ?auto_10654 ?auto_10652 ) ) ( not ( = ?auto_10651 ?auto_10654 ) ) ( not ( = ?auto_10655 ?auto_10654 ) ) ( ON ?auto_10652 ?auto_10651 ) ( CLEAR ?auto_10652 ) ( ON-TABLE ?auto_10655 ) ( HOLDING ?auto_10653 ) ( CLEAR ?auto_10654 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10654 ?auto_10653 )
      ( MAKE-2PILE ?auto_10651 ?auto_10652 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10656 - BLOCK
      ?auto_10657 - BLOCK
    )
    :vars
    (
      ?auto_10659 - BLOCK
      ?auto_10658 - BLOCK
      ?auto_10660 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10656 ?auto_10657 ) ) ( not ( = ?auto_10656 ?auto_10659 ) ) ( not ( = ?auto_10657 ?auto_10659 ) ) ( ON ?auto_10656 ?auto_10658 ) ( not ( = ?auto_10656 ?auto_10658 ) ) ( not ( = ?auto_10657 ?auto_10658 ) ) ( not ( = ?auto_10659 ?auto_10658 ) ) ( ON-TABLE ?auto_10660 ) ( not ( = ?auto_10660 ?auto_10659 ) ) ( not ( = ?auto_10660 ?auto_10657 ) ) ( not ( = ?auto_10656 ?auto_10660 ) ) ( not ( = ?auto_10658 ?auto_10660 ) ) ( ON ?auto_10657 ?auto_10656 ) ( ON-TABLE ?auto_10658 ) ( CLEAR ?auto_10660 ) ( ON ?auto_10659 ?auto_10657 ) ( CLEAR ?auto_10659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10658 ?auto_10656 ?auto_10657 )
      ( MAKE-2PILE ?auto_10656 ?auto_10657 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10661 - BLOCK
      ?auto_10662 - BLOCK
    )
    :vars
    (
      ?auto_10665 - BLOCK
      ?auto_10664 - BLOCK
      ?auto_10663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10661 ?auto_10662 ) ) ( not ( = ?auto_10661 ?auto_10665 ) ) ( not ( = ?auto_10662 ?auto_10665 ) ) ( ON ?auto_10661 ?auto_10664 ) ( not ( = ?auto_10661 ?auto_10664 ) ) ( not ( = ?auto_10662 ?auto_10664 ) ) ( not ( = ?auto_10665 ?auto_10664 ) ) ( not ( = ?auto_10663 ?auto_10665 ) ) ( not ( = ?auto_10663 ?auto_10662 ) ) ( not ( = ?auto_10661 ?auto_10663 ) ) ( not ( = ?auto_10664 ?auto_10663 ) ) ( ON ?auto_10662 ?auto_10661 ) ( ON-TABLE ?auto_10664 ) ( ON ?auto_10665 ?auto_10662 ) ( CLEAR ?auto_10665 ) ( HOLDING ?auto_10663 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10663 )
      ( MAKE-2PILE ?auto_10661 ?auto_10662 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10666 - BLOCK
      ?auto_10667 - BLOCK
    )
    :vars
    (
      ?auto_10669 - BLOCK
      ?auto_10670 - BLOCK
      ?auto_10668 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10666 ?auto_10667 ) ) ( not ( = ?auto_10666 ?auto_10669 ) ) ( not ( = ?auto_10667 ?auto_10669 ) ) ( ON ?auto_10666 ?auto_10670 ) ( not ( = ?auto_10666 ?auto_10670 ) ) ( not ( = ?auto_10667 ?auto_10670 ) ) ( not ( = ?auto_10669 ?auto_10670 ) ) ( not ( = ?auto_10668 ?auto_10669 ) ) ( not ( = ?auto_10668 ?auto_10667 ) ) ( not ( = ?auto_10666 ?auto_10668 ) ) ( not ( = ?auto_10670 ?auto_10668 ) ) ( ON ?auto_10667 ?auto_10666 ) ( ON-TABLE ?auto_10670 ) ( ON ?auto_10669 ?auto_10667 ) ( ON ?auto_10668 ?auto_10669 ) ( CLEAR ?auto_10668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10670 ?auto_10666 ?auto_10667 ?auto_10669 )
      ( MAKE-2PILE ?auto_10666 ?auto_10667 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10682 - BLOCK
    )
    :vars
    (
      ?auto_10683 - BLOCK
      ?auto_10685 - BLOCK
      ?auto_10684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10683 ?auto_10682 ) ( ON-TABLE ?auto_10682 ) ( not ( = ?auto_10682 ?auto_10683 ) ) ( not ( = ?auto_10682 ?auto_10685 ) ) ( not ( = ?auto_10682 ?auto_10684 ) ) ( not ( = ?auto_10683 ?auto_10685 ) ) ( not ( = ?auto_10683 ?auto_10684 ) ) ( not ( = ?auto_10685 ?auto_10684 ) ) ( ON ?auto_10685 ?auto_10683 ) ( CLEAR ?auto_10685 ) ( HOLDING ?auto_10684 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10684 )
      ( MAKE-1PILE ?auto_10682 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10715 - BLOCK
      ?auto_10716 - BLOCK
      ?auto_10717 - BLOCK
    )
    :vars
    (
      ?auto_10718 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10715 ) ( not ( = ?auto_10715 ?auto_10716 ) ) ( not ( = ?auto_10715 ?auto_10717 ) ) ( not ( = ?auto_10716 ?auto_10717 ) ) ( ON ?auto_10717 ?auto_10718 ) ( not ( = ?auto_10715 ?auto_10718 ) ) ( not ( = ?auto_10716 ?auto_10718 ) ) ( not ( = ?auto_10717 ?auto_10718 ) ) ( CLEAR ?auto_10715 ) ( ON ?auto_10716 ?auto_10717 ) ( CLEAR ?auto_10716 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10718 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10718 ?auto_10717 )
      ( MAKE-3PILE ?auto_10715 ?auto_10716 ?auto_10717 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10719 - BLOCK
      ?auto_10720 - BLOCK
      ?auto_10721 - BLOCK
    )
    :vars
    (
      ?auto_10722 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10719 ?auto_10720 ) ) ( not ( = ?auto_10719 ?auto_10721 ) ) ( not ( = ?auto_10720 ?auto_10721 ) ) ( ON ?auto_10721 ?auto_10722 ) ( not ( = ?auto_10719 ?auto_10722 ) ) ( not ( = ?auto_10720 ?auto_10722 ) ) ( not ( = ?auto_10721 ?auto_10722 ) ) ( ON ?auto_10720 ?auto_10721 ) ( CLEAR ?auto_10720 ) ( ON-TABLE ?auto_10722 ) ( HOLDING ?auto_10719 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10719 )
      ( MAKE-3PILE ?auto_10719 ?auto_10720 ?auto_10721 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10723 - BLOCK
      ?auto_10724 - BLOCK
      ?auto_10725 - BLOCK
    )
    :vars
    (
      ?auto_10726 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10723 ?auto_10724 ) ) ( not ( = ?auto_10723 ?auto_10725 ) ) ( not ( = ?auto_10724 ?auto_10725 ) ) ( ON ?auto_10725 ?auto_10726 ) ( not ( = ?auto_10723 ?auto_10726 ) ) ( not ( = ?auto_10724 ?auto_10726 ) ) ( not ( = ?auto_10725 ?auto_10726 ) ) ( ON ?auto_10724 ?auto_10725 ) ( ON-TABLE ?auto_10726 ) ( ON ?auto_10723 ?auto_10724 ) ( CLEAR ?auto_10723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10726 ?auto_10725 ?auto_10724 )
      ( MAKE-3PILE ?auto_10723 ?auto_10724 ?auto_10725 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10730 - BLOCK
      ?auto_10731 - BLOCK
      ?auto_10732 - BLOCK
    )
    :vars
    (
      ?auto_10733 - BLOCK
      ?auto_10734 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10730 ?auto_10731 ) ) ( not ( = ?auto_10730 ?auto_10732 ) ) ( not ( = ?auto_10731 ?auto_10732 ) ) ( ON ?auto_10732 ?auto_10733 ) ( not ( = ?auto_10730 ?auto_10733 ) ) ( not ( = ?auto_10731 ?auto_10733 ) ) ( not ( = ?auto_10732 ?auto_10733 ) ) ( ON ?auto_10731 ?auto_10732 ) ( CLEAR ?auto_10731 ) ( ON-TABLE ?auto_10733 ) ( ON ?auto_10730 ?auto_10734 ) ( CLEAR ?auto_10730 ) ( HAND-EMPTY ) ( not ( = ?auto_10730 ?auto_10734 ) ) ( not ( = ?auto_10731 ?auto_10734 ) ) ( not ( = ?auto_10732 ?auto_10734 ) ) ( not ( = ?auto_10733 ?auto_10734 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10730 ?auto_10734 )
      ( MAKE-3PILE ?auto_10730 ?auto_10731 ?auto_10732 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10735 - BLOCK
      ?auto_10736 - BLOCK
      ?auto_10737 - BLOCK
    )
    :vars
    (
      ?auto_10739 - BLOCK
      ?auto_10738 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10735 ?auto_10736 ) ) ( not ( = ?auto_10735 ?auto_10737 ) ) ( not ( = ?auto_10736 ?auto_10737 ) ) ( ON ?auto_10737 ?auto_10739 ) ( not ( = ?auto_10735 ?auto_10739 ) ) ( not ( = ?auto_10736 ?auto_10739 ) ) ( not ( = ?auto_10737 ?auto_10739 ) ) ( ON-TABLE ?auto_10739 ) ( ON ?auto_10735 ?auto_10738 ) ( CLEAR ?auto_10735 ) ( not ( = ?auto_10735 ?auto_10738 ) ) ( not ( = ?auto_10736 ?auto_10738 ) ) ( not ( = ?auto_10737 ?auto_10738 ) ) ( not ( = ?auto_10739 ?auto_10738 ) ) ( HOLDING ?auto_10736 ) ( CLEAR ?auto_10737 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10739 ?auto_10737 ?auto_10736 )
      ( MAKE-3PILE ?auto_10735 ?auto_10736 ?auto_10737 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10740 - BLOCK
      ?auto_10741 - BLOCK
      ?auto_10742 - BLOCK
    )
    :vars
    (
      ?auto_10744 - BLOCK
      ?auto_10743 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10740 ?auto_10741 ) ) ( not ( = ?auto_10740 ?auto_10742 ) ) ( not ( = ?auto_10741 ?auto_10742 ) ) ( ON ?auto_10742 ?auto_10744 ) ( not ( = ?auto_10740 ?auto_10744 ) ) ( not ( = ?auto_10741 ?auto_10744 ) ) ( not ( = ?auto_10742 ?auto_10744 ) ) ( ON-TABLE ?auto_10744 ) ( ON ?auto_10740 ?auto_10743 ) ( not ( = ?auto_10740 ?auto_10743 ) ) ( not ( = ?auto_10741 ?auto_10743 ) ) ( not ( = ?auto_10742 ?auto_10743 ) ) ( not ( = ?auto_10744 ?auto_10743 ) ) ( CLEAR ?auto_10742 ) ( ON ?auto_10741 ?auto_10740 ) ( CLEAR ?auto_10741 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10743 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10743 ?auto_10740 )
      ( MAKE-3PILE ?auto_10740 ?auto_10741 ?auto_10742 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10745 - BLOCK
      ?auto_10746 - BLOCK
      ?auto_10747 - BLOCK
    )
    :vars
    (
      ?auto_10748 - BLOCK
      ?auto_10749 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10745 ?auto_10746 ) ) ( not ( = ?auto_10745 ?auto_10747 ) ) ( not ( = ?auto_10746 ?auto_10747 ) ) ( not ( = ?auto_10745 ?auto_10748 ) ) ( not ( = ?auto_10746 ?auto_10748 ) ) ( not ( = ?auto_10747 ?auto_10748 ) ) ( ON-TABLE ?auto_10748 ) ( ON ?auto_10745 ?auto_10749 ) ( not ( = ?auto_10745 ?auto_10749 ) ) ( not ( = ?auto_10746 ?auto_10749 ) ) ( not ( = ?auto_10747 ?auto_10749 ) ) ( not ( = ?auto_10748 ?auto_10749 ) ) ( ON ?auto_10746 ?auto_10745 ) ( CLEAR ?auto_10746 ) ( ON-TABLE ?auto_10749 ) ( HOLDING ?auto_10747 ) ( CLEAR ?auto_10748 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10748 ?auto_10747 )
      ( MAKE-3PILE ?auto_10745 ?auto_10746 ?auto_10747 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10750 - BLOCK
      ?auto_10751 - BLOCK
      ?auto_10752 - BLOCK
    )
    :vars
    (
      ?auto_10753 - BLOCK
      ?auto_10754 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10750 ?auto_10751 ) ) ( not ( = ?auto_10750 ?auto_10752 ) ) ( not ( = ?auto_10751 ?auto_10752 ) ) ( not ( = ?auto_10750 ?auto_10753 ) ) ( not ( = ?auto_10751 ?auto_10753 ) ) ( not ( = ?auto_10752 ?auto_10753 ) ) ( ON-TABLE ?auto_10753 ) ( ON ?auto_10750 ?auto_10754 ) ( not ( = ?auto_10750 ?auto_10754 ) ) ( not ( = ?auto_10751 ?auto_10754 ) ) ( not ( = ?auto_10752 ?auto_10754 ) ) ( not ( = ?auto_10753 ?auto_10754 ) ) ( ON ?auto_10751 ?auto_10750 ) ( ON-TABLE ?auto_10754 ) ( CLEAR ?auto_10753 ) ( ON ?auto_10752 ?auto_10751 ) ( CLEAR ?auto_10752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10754 ?auto_10750 ?auto_10751 )
      ( MAKE-3PILE ?auto_10750 ?auto_10751 ?auto_10752 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10755 - BLOCK
      ?auto_10756 - BLOCK
      ?auto_10757 - BLOCK
    )
    :vars
    (
      ?auto_10758 - BLOCK
      ?auto_10759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10755 ?auto_10756 ) ) ( not ( = ?auto_10755 ?auto_10757 ) ) ( not ( = ?auto_10756 ?auto_10757 ) ) ( not ( = ?auto_10755 ?auto_10758 ) ) ( not ( = ?auto_10756 ?auto_10758 ) ) ( not ( = ?auto_10757 ?auto_10758 ) ) ( ON ?auto_10755 ?auto_10759 ) ( not ( = ?auto_10755 ?auto_10759 ) ) ( not ( = ?auto_10756 ?auto_10759 ) ) ( not ( = ?auto_10757 ?auto_10759 ) ) ( not ( = ?auto_10758 ?auto_10759 ) ) ( ON ?auto_10756 ?auto_10755 ) ( ON-TABLE ?auto_10759 ) ( ON ?auto_10757 ?auto_10756 ) ( CLEAR ?auto_10757 ) ( HOLDING ?auto_10758 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10758 )
      ( MAKE-3PILE ?auto_10755 ?auto_10756 ?auto_10757 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10760 - BLOCK
      ?auto_10761 - BLOCK
      ?auto_10762 - BLOCK
    )
    :vars
    (
      ?auto_10763 - BLOCK
      ?auto_10764 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10760 ?auto_10761 ) ) ( not ( = ?auto_10760 ?auto_10762 ) ) ( not ( = ?auto_10761 ?auto_10762 ) ) ( not ( = ?auto_10760 ?auto_10763 ) ) ( not ( = ?auto_10761 ?auto_10763 ) ) ( not ( = ?auto_10762 ?auto_10763 ) ) ( ON ?auto_10760 ?auto_10764 ) ( not ( = ?auto_10760 ?auto_10764 ) ) ( not ( = ?auto_10761 ?auto_10764 ) ) ( not ( = ?auto_10762 ?auto_10764 ) ) ( not ( = ?auto_10763 ?auto_10764 ) ) ( ON ?auto_10761 ?auto_10760 ) ( ON-TABLE ?auto_10764 ) ( ON ?auto_10762 ?auto_10761 ) ( ON ?auto_10763 ?auto_10762 ) ( CLEAR ?auto_10763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10764 ?auto_10760 ?auto_10761 ?auto_10762 )
      ( MAKE-3PILE ?auto_10760 ?auto_10761 ?auto_10762 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10773 - BLOCK
      ?auto_10774 - BLOCK
      ?auto_10775 - BLOCK
      ?auto_10776 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10775 ) ( ON-TABLE ?auto_10773 ) ( ON ?auto_10774 ?auto_10773 ) ( ON ?auto_10775 ?auto_10774 ) ( not ( = ?auto_10773 ?auto_10774 ) ) ( not ( = ?auto_10773 ?auto_10775 ) ) ( not ( = ?auto_10773 ?auto_10776 ) ) ( not ( = ?auto_10774 ?auto_10775 ) ) ( not ( = ?auto_10774 ?auto_10776 ) ) ( not ( = ?auto_10775 ?auto_10776 ) ) ( ON-TABLE ?auto_10776 ) ( CLEAR ?auto_10776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_10776 )
      ( MAKE-4PILE ?auto_10773 ?auto_10774 ?auto_10775 ?auto_10776 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10777 - BLOCK
      ?auto_10778 - BLOCK
      ?auto_10779 - BLOCK
      ?auto_10780 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10777 ) ( ON ?auto_10778 ?auto_10777 ) ( not ( = ?auto_10777 ?auto_10778 ) ) ( not ( = ?auto_10777 ?auto_10779 ) ) ( not ( = ?auto_10777 ?auto_10780 ) ) ( not ( = ?auto_10778 ?auto_10779 ) ) ( not ( = ?auto_10778 ?auto_10780 ) ) ( not ( = ?auto_10779 ?auto_10780 ) ) ( ON-TABLE ?auto_10780 ) ( CLEAR ?auto_10780 ) ( HOLDING ?auto_10779 ) ( CLEAR ?auto_10778 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10777 ?auto_10778 ?auto_10779 )
      ( MAKE-4PILE ?auto_10777 ?auto_10778 ?auto_10779 ?auto_10780 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10781 - BLOCK
      ?auto_10782 - BLOCK
      ?auto_10783 - BLOCK
      ?auto_10784 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10781 ) ( ON ?auto_10782 ?auto_10781 ) ( not ( = ?auto_10781 ?auto_10782 ) ) ( not ( = ?auto_10781 ?auto_10783 ) ) ( not ( = ?auto_10781 ?auto_10784 ) ) ( not ( = ?auto_10782 ?auto_10783 ) ) ( not ( = ?auto_10782 ?auto_10784 ) ) ( not ( = ?auto_10783 ?auto_10784 ) ) ( ON-TABLE ?auto_10784 ) ( CLEAR ?auto_10782 ) ( ON ?auto_10783 ?auto_10784 ) ( CLEAR ?auto_10783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10784 )
      ( MAKE-4PILE ?auto_10781 ?auto_10782 ?auto_10783 ?auto_10784 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10785 - BLOCK
      ?auto_10786 - BLOCK
      ?auto_10787 - BLOCK
      ?auto_10788 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10785 ) ( not ( = ?auto_10785 ?auto_10786 ) ) ( not ( = ?auto_10785 ?auto_10787 ) ) ( not ( = ?auto_10785 ?auto_10788 ) ) ( not ( = ?auto_10786 ?auto_10787 ) ) ( not ( = ?auto_10786 ?auto_10788 ) ) ( not ( = ?auto_10787 ?auto_10788 ) ) ( ON-TABLE ?auto_10788 ) ( ON ?auto_10787 ?auto_10788 ) ( CLEAR ?auto_10787 ) ( HOLDING ?auto_10786 ) ( CLEAR ?auto_10785 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10785 ?auto_10786 )
      ( MAKE-4PILE ?auto_10785 ?auto_10786 ?auto_10787 ?auto_10788 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10789 - BLOCK
      ?auto_10790 - BLOCK
      ?auto_10791 - BLOCK
      ?auto_10792 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10789 ) ( not ( = ?auto_10789 ?auto_10790 ) ) ( not ( = ?auto_10789 ?auto_10791 ) ) ( not ( = ?auto_10789 ?auto_10792 ) ) ( not ( = ?auto_10790 ?auto_10791 ) ) ( not ( = ?auto_10790 ?auto_10792 ) ) ( not ( = ?auto_10791 ?auto_10792 ) ) ( ON-TABLE ?auto_10792 ) ( ON ?auto_10791 ?auto_10792 ) ( CLEAR ?auto_10789 ) ( ON ?auto_10790 ?auto_10791 ) ( CLEAR ?auto_10790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10792 ?auto_10791 )
      ( MAKE-4PILE ?auto_10789 ?auto_10790 ?auto_10791 ?auto_10792 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10793 - BLOCK
      ?auto_10794 - BLOCK
      ?auto_10795 - BLOCK
      ?auto_10796 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10793 ?auto_10794 ) ) ( not ( = ?auto_10793 ?auto_10795 ) ) ( not ( = ?auto_10793 ?auto_10796 ) ) ( not ( = ?auto_10794 ?auto_10795 ) ) ( not ( = ?auto_10794 ?auto_10796 ) ) ( not ( = ?auto_10795 ?auto_10796 ) ) ( ON-TABLE ?auto_10796 ) ( ON ?auto_10795 ?auto_10796 ) ( ON ?auto_10794 ?auto_10795 ) ( CLEAR ?auto_10794 ) ( HOLDING ?auto_10793 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10793 )
      ( MAKE-4PILE ?auto_10793 ?auto_10794 ?auto_10795 ?auto_10796 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10797 - BLOCK
      ?auto_10798 - BLOCK
      ?auto_10799 - BLOCK
      ?auto_10800 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10797 ?auto_10798 ) ) ( not ( = ?auto_10797 ?auto_10799 ) ) ( not ( = ?auto_10797 ?auto_10800 ) ) ( not ( = ?auto_10798 ?auto_10799 ) ) ( not ( = ?auto_10798 ?auto_10800 ) ) ( not ( = ?auto_10799 ?auto_10800 ) ) ( ON-TABLE ?auto_10800 ) ( ON ?auto_10799 ?auto_10800 ) ( ON ?auto_10798 ?auto_10799 ) ( ON ?auto_10797 ?auto_10798 ) ( CLEAR ?auto_10797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10800 ?auto_10799 ?auto_10798 )
      ( MAKE-4PILE ?auto_10797 ?auto_10798 ?auto_10799 ?auto_10800 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10805 - BLOCK
      ?auto_10806 - BLOCK
      ?auto_10807 - BLOCK
      ?auto_10808 - BLOCK
    )
    :vars
    (
      ?auto_10809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10805 ?auto_10806 ) ) ( not ( = ?auto_10805 ?auto_10807 ) ) ( not ( = ?auto_10805 ?auto_10808 ) ) ( not ( = ?auto_10806 ?auto_10807 ) ) ( not ( = ?auto_10806 ?auto_10808 ) ) ( not ( = ?auto_10807 ?auto_10808 ) ) ( ON-TABLE ?auto_10808 ) ( ON ?auto_10807 ?auto_10808 ) ( ON ?auto_10806 ?auto_10807 ) ( CLEAR ?auto_10806 ) ( ON ?auto_10805 ?auto_10809 ) ( CLEAR ?auto_10805 ) ( HAND-EMPTY ) ( not ( = ?auto_10805 ?auto_10809 ) ) ( not ( = ?auto_10806 ?auto_10809 ) ) ( not ( = ?auto_10807 ?auto_10809 ) ) ( not ( = ?auto_10808 ?auto_10809 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10805 ?auto_10809 )
      ( MAKE-4PILE ?auto_10805 ?auto_10806 ?auto_10807 ?auto_10808 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10810 - BLOCK
      ?auto_10811 - BLOCK
      ?auto_10812 - BLOCK
      ?auto_10813 - BLOCK
    )
    :vars
    (
      ?auto_10814 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10810 ?auto_10811 ) ) ( not ( = ?auto_10810 ?auto_10812 ) ) ( not ( = ?auto_10810 ?auto_10813 ) ) ( not ( = ?auto_10811 ?auto_10812 ) ) ( not ( = ?auto_10811 ?auto_10813 ) ) ( not ( = ?auto_10812 ?auto_10813 ) ) ( ON-TABLE ?auto_10813 ) ( ON ?auto_10812 ?auto_10813 ) ( ON ?auto_10810 ?auto_10814 ) ( CLEAR ?auto_10810 ) ( not ( = ?auto_10810 ?auto_10814 ) ) ( not ( = ?auto_10811 ?auto_10814 ) ) ( not ( = ?auto_10812 ?auto_10814 ) ) ( not ( = ?auto_10813 ?auto_10814 ) ) ( HOLDING ?auto_10811 ) ( CLEAR ?auto_10812 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10813 ?auto_10812 ?auto_10811 )
      ( MAKE-4PILE ?auto_10810 ?auto_10811 ?auto_10812 ?auto_10813 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10815 - BLOCK
      ?auto_10816 - BLOCK
      ?auto_10817 - BLOCK
      ?auto_10818 - BLOCK
    )
    :vars
    (
      ?auto_10819 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10815 ?auto_10816 ) ) ( not ( = ?auto_10815 ?auto_10817 ) ) ( not ( = ?auto_10815 ?auto_10818 ) ) ( not ( = ?auto_10816 ?auto_10817 ) ) ( not ( = ?auto_10816 ?auto_10818 ) ) ( not ( = ?auto_10817 ?auto_10818 ) ) ( ON-TABLE ?auto_10818 ) ( ON ?auto_10817 ?auto_10818 ) ( ON ?auto_10815 ?auto_10819 ) ( not ( = ?auto_10815 ?auto_10819 ) ) ( not ( = ?auto_10816 ?auto_10819 ) ) ( not ( = ?auto_10817 ?auto_10819 ) ) ( not ( = ?auto_10818 ?auto_10819 ) ) ( CLEAR ?auto_10817 ) ( ON ?auto_10816 ?auto_10815 ) ( CLEAR ?auto_10816 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10819 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10819 ?auto_10815 )
      ( MAKE-4PILE ?auto_10815 ?auto_10816 ?auto_10817 ?auto_10818 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10820 - BLOCK
      ?auto_10821 - BLOCK
      ?auto_10822 - BLOCK
      ?auto_10823 - BLOCK
    )
    :vars
    (
      ?auto_10824 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10820 ?auto_10821 ) ) ( not ( = ?auto_10820 ?auto_10822 ) ) ( not ( = ?auto_10820 ?auto_10823 ) ) ( not ( = ?auto_10821 ?auto_10822 ) ) ( not ( = ?auto_10821 ?auto_10823 ) ) ( not ( = ?auto_10822 ?auto_10823 ) ) ( ON-TABLE ?auto_10823 ) ( ON ?auto_10820 ?auto_10824 ) ( not ( = ?auto_10820 ?auto_10824 ) ) ( not ( = ?auto_10821 ?auto_10824 ) ) ( not ( = ?auto_10822 ?auto_10824 ) ) ( not ( = ?auto_10823 ?auto_10824 ) ) ( ON ?auto_10821 ?auto_10820 ) ( CLEAR ?auto_10821 ) ( ON-TABLE ?auto_10824 ) ( HOLDING ?auto_10822 ) ( CLEAR ?auto_10823 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10823 ?auto_10822 )
      ( MAKE-4PILE ?auto_10820 ?auto_10821 ?auto_10822 ?auto_10823 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10825 - BLOCK
      ?auto_10826 - BLOCK
      ?auto_10827 - BLOCK
      ?auto_10828 - BLOCK
    )
    :vars
    (
      ?auto_10829 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10825 ?auto_10826 ) ) ( not ( = ?auto_10825 ?auto_10827 ) ) ( not ( = ?auto_10825 ?auto_10828 ) ) ( not ( = ?auto_10826 ?auto_10827 ) ) ( not ( = ?auto_10826 ?auto_10828 ) ) ( not ( = ?auto_10827 ?auto_10828 ) ) ( ON-TABLE ?auto_10828 ) ( ON ?auto_10825 ?auto_10829 ) ( not ( = ?auto_10825 ?auto_10829 ) ) ( not ( = ?auto_10826 ?auto_10829 ) ) ( not ( = ?auto_10827 ?auto_10829 ) ) ( not ( = ?auto_10828 ?auto_10829 ) ) ( ON ?auto_10826 ?auto_10825 ) ( ON-TABLE ?auto_10829 ) ( CLEAR ?auto_10828 ) ( ON ?auto_10827 ?auto_10826 ) ( CLEAR ?auto_10827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10829 ?auto_10825 ?auto_10826 )
      ( MAKE-4PILE ?auto_10825 ?auto_10826 ?auto_10827 ?auto_10828 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10830 - BLOCK
      ?auto_10831 - BLOCK
      ?auto_10832 - BLOCK
      ?auto_10833 - BLOCK
    )
    :vars
    (
      ?auto_10834 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10830 ?auto_10831 ) ) ( not ( = ?auto_10830 ?auto_10832 ) ) ( not ( = ?auto_10830 ?auto_10833 ) ) ( not ( = ?auto_10831 ?auto_10832 ) ) ( not ( = ?auto_10831 ?auto_10833 ) ) ( not ( = ?auto_10832 ?auto_10833 ) ) ( ON ?auto_10830 ?auto_10834 ) ( not ( = ?auto_10830 ?auto_10834 ) ) ( not ( = ?auto_10831 ?auto_10834 ) ) ( not ( = ?auto_10832 ?auto_10834 ) ) ( not ( = ?auto_10833 ?auto_10834 ) ) ( ON ?auto_10831 ?auto_10830 ) ( ON-TABLE ?auto_10834 ) ( ON ?auto_10832 ?auto_10831 ) ( CLEAR ?auto_10832 ) ( HOLDING ?auto_10833 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10833 )
      ( MAKE-4PILE ?auto_10830 ?auto_10831 ?auto_10832 ?auto_10833 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10835 - BLOCK
      ?auto_10836 - BLOCK
      ?auto_10837 - BLOCK
      ?auto_10838 - BLOCK
    )
    :vars
    (
      ?auto_10839 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10835 ?auto_10836 ) ) ( not ( = ?auto_10835 ?auto_10837 ) ) ( not ( = ?auto_10835 ?auto_10838 ) ) ( not ( = ?auto_10836 ?auto_10837 ) ) ( not ( = ?auto_10836 ?auto_10838 ) ) ( not ( = ?auto_10837 ?auto_10838 ) ) ( ON ?auto_10835 ?auto_10839 ) ( not ( = ?auto_10835 ?auto_10839 ) ) ( not ( = ?auto_10836 ?auto_10839 ) ) ( not ( = ?auto_10837 ?auto_10839 ) ) ( not ( = ?auto_10838 ?auto_10839 ) ) ( ON ?auto_10836 ?auto_10835 ) ( ON-TABLE ?auto_10839 ) ( ON ?auto_10837 ?auto_10836 ) ( ON ?auto_10838 ?auto_10837 ) ( CLEAR ?auto_10838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10839 ?auto_10835 ?auto_10836 ?auto_10837 )
      ( MAKE-4PILE ?auto_10835 ?auto_10836 ?auto_10837 ?auto_10838 ) )
  )

)

