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
      ?auto_296346 - BLOCK
    )
    :vars
    (
      ?auto_296347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296346 ?auto_296347 ) ( CLEAR ?auto_296346 ) ( HAND-EMPTY ) ( not ( = ?auto_296346 ?auto_296347 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_296346 ?auto_296347 )
      ( !PUTDOWN ?auto_296346 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_296349 - BLOCK
    )
    :vars
    (
      ?auto_296350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296349 ?auto_296350 ) ( CLEAR ?auto_296349 ) ( HAND-EMPTY ) ( not ( = ?auto_296349 ?auto_296350 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_296349 ?auto_296350 )
      ( !PUTDOWN ?auto_296349 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_296353 - BLOCK
      ?auto_296354 - BLOCK
    )
    :vars
    (
      ?auto_296355 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_296353 ) ( ON ?auto_296354 ?auto_296355 ) ( CLEAR ?auto_296354 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_296353 ) ( not ( = ?auto_296353 ?auto_296354 ) ) ( not ( = ?auto_296353 ?auto_296355 ) ) ( not ( = ?auto_296354 ?auto_296355 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_296354 ?auto_296355 )
      ( !STACK ?auto_296354 ?auto_296353 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_296358 - BLOCK
      ?auto_296359 - BLOCK
    )
    :vars
    (
      ?auto_296360 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_296358 ) ( ON ?auto_296359 ?auto_296360 ) ( CLEAR ?auto_296359 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_296358 ) ( not ( = ?auto_296358 ?auto_296359 ) ) ( not ( = ?auto_296358 ?auto_296360 ) ) ( not ( = ?auto_296359 ?auto_296360 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_296359 ?auto_296360 )
      ( !STACK ?auto_296359 ?auto_296358 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_296363 - BLOCK
      ?auto_296364 - BLOCK
    )
    :vars
    (
      ?auto_296365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296364 ?auto_296365 ) ( not ( = ?auto_296363 ?auto_296364 ) ) ( not ( = ?auto_296363 ?auto_296365 ) ) ( not ( = ?auto_296364 ?auto_296365 ) ) ( ON ?auto_296363 ?auto_296364 ) ( CLEAR ?auto_296363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_296363 )
      ( MAKE-2PILE ?auto_296363 ?auto_296364 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_296368 - BLOCK
      ?auto_296369 - BLOCK
    )
    :vars
    (
      ?auto_296370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296369 ?auto_296370 ) ( not ( = ?auto_296368 ?auto_296369 ) ) ( not ( = ?auto_296368 ?auto_296370 ) ) ( not ( = ?auto_296369 ?auto_296370 ) ) ( ON ?auto_296368 ?auto_296369 ) ( CLEAR ?auto_296368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_296368 )
      ( MAKE-2PILE ?auto_296368 ?auto_296369 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_296374 - BLOCK
      ?auto_296375 - BLOCK
      ?auto_296376 - BLOCK
    )
    :vars
    (
      ?auto_296377 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_296375 ) ( ON ?auto_296376 ?auto_296377 ) ( CLEAR ?auto_296376 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_296374 ) ( ON ?auto_296375 ?auto_296374 ) ( not ( = ?auto_296374 ?auto_296375 ) ) ( not ( = ?auto_296374 ?auto_296376 ) ) ( not ( = ?auto_296374 ?auto_296377 ) ) ( not ( = ?auto_296375 ?auto_296376 ) ) ( not ( = ?auto_296375 ?auto_296377 ) ) ( not ( = ?auto_296376 ?auto_296377 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_296376 ?auto_296377 )
      ( !STACK ?auto_296376 ?auto_296375 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_296381 - BLOCK
      ?auto_296382 - BLOCK
      ?auto_296383 - BLOCK
    )
    :vars
    (
      ?auto_296384 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_296382 ) ( ON ?auto_296383 ?auto_296384 ) ( CLEAR ?auto_296383 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_296381 ) ( ON ?auto_296382 ?auto_296381 ) ( not ( = ?auto_296381 ?auto_296382 ) ) ( not ( = ?auto_296381 ?auto_296383 ) ) ( not ( = ?auto_296381 ?auto_296384 ) ) ( not ( = ?auto_296382 ?auto_296383 ) ) ( not ( = ?auto_296382 ?auto_296384 ) ) ( not ( = ?auto_296383 ?auto_296384 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_296383 ?auto_296384 )
      ( !STACK ?auto_296383 ?auto_296382 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_296388 - BLOCK
      ?auto_296389 - BLOCK
      ?auto_296390 - BLOCK
    )
    :vars
    (
      ?auto_296391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296390 ?auto_296391 ) ( ON-TABLE ?auto_296388 ) ( not ( = ?auto_296388 ?auto_296389 ) ) ( not ( = ?auto_296388 ?auto_296390 ) ) ( not ( = ?auto_296388 ?auto_296391 ) ) ( not ( = ?auto_296389 ?auto_296390 ) ) ( not ( = ?auto_296389 ?auto_296391 ) ) ( not ( = ?auto_296390 ?auto_296391 ) ) ( CLEAR ?auto_296388 ) ( ON ?auto_296389 ?auto_296390 ) ( CLEAR ?auto_296389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_296388 ?auto_296389 )
      ( MAKE-3PILE ?auto_296388 ?auto_296389 ?auto_296390 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_296395 - BLOCK
      ?auto_296396 - BLOCK
      ?auto_296397 - BLOCK
    )
    :vars
    (
      ?auto_296398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296397 ?auto_296398 ) ( ON-TABLE ?auto_296395 ) ( not ( = ?auto_296395 ?auto_296396 ) ) ( not ( = ?auto_296395 ?auto_296397 ) ) ( not ( = ?auto_296395 ?auto_296398 ) ) ( not ( = ?auto_296396 ?auto_296397 ) ) ( not ( = ?auto_296396 ?auto_296398 ) ) ( not ( = ?auto_296397 ?auto_296398 ) ) ( CLEAR ?auto_296395 ) ( ON ?auto_296396 ?auto_296397 ) ( CLEAR ?auto_296396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_296395 ?auto_296396 )
      ( MAKE-3PILE ?auto_296395 ?auto_296396 ?auto_296397 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_296402 - BLOCK
      ?auto_296403 - BLOCK
      ?auto_296404 - BLOCK
    )
    :vars
    (
      ?auto_296405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296404 ?auto_296405 ) ( not ( = ?auto_296402 ?auto_296403 ) ) ( not ( = ?auto_296402 ?auto_296404 ) ) ( not ( = ?auto_296402 ?auto_296405 ) ) ( not ( = ?auto_296403 ?auto_296404 ) ) ( not ( = ?auto_296403 ?auto_296405 ) ) ( not ( = ?auto_296404 ?auto_296405 ) ) ( ON ?auto_296403 ?auto_296404 ) ( ON ?auto_296402 ?auto_296403 ) ( CLEAR ?auto_296402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_296402 )
      ( MAKE-3PILE ?auto_296402 ?auto_296403 ?auto_296404 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_296409 - BLOCK
      ?auto_296410 - BLOCK
      ?auto_296411 - BLOCK
    )
    :vars
    (
      ?auto_296412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296411 ?auto_296412 ) ( not ( = ?auto_296409 ?auto_296410 ) ) ( not ( = ?auto_296409 ?auto_296411 ) ) ( not ( = ?auto_296409 ?auto_296412 ) ) ( not ( = ?auto_296410 ?auto_296411 ) ) ( not ( = ?auto_296410 ?auto_296412 ) ) ( not ( = ?auto_296411 ?auto_296412 ) ) ( ON ?auto_296410 ?auto_296411 ) ( ON ?auto_296409 ?auto_296410 ) ( CLEAR ?auto_296409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_296409 )
      ( MAKE-3PILE ?auto_296409 ?auto_296410 ?auto_296411 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_296417 - BLOCK
      ?auto_296418 - BLOCK
      ?auto_296419 - BLOCK
      ?auto_296420 - BLOCK
    )
    :vars
    (
      ?auto_296421 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_296419 ) ( ON ?auto_296420 ?auto_296421 ) ( CLEAR ?auto_296420 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_296417 ) ( ON ?auto_296418 ?auto_296417 ) ( ON ?auto_296419 ?auto_296418 ) ( not ( = ?auto_296417 ?auto_296418 ) ) ( not ( = ?auto_296417 ?auto_296419 ) ) ( not ( = ?auto_296417 ?auto_296420 ) ) ( not ( = ?auto_296417 ?auto_296421 ) ) ( not ( = ?auto_296418 ?auto_296419 ) ) ( not ( = ?auto_296418 ?auto_296420 ) ) ( not ( = ?auto_296418 ?auto_296421 ) ) ( not ( = ?auto_296419 ?auto_296420 ) ) ( not ( = ?auto_296419 ?auto_296421 ) ) ( not ( = ?auto_296420 ?auto_296421 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_296420 ?auto_296421 )
      ( !STACK ?auto_296420 ?auto_296419 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_296426 - BLOCK
      ?auto_296427 - BLOCK
      ?auto_296428 - BLOCK
      ?auto_296429 - BLOCK
    )
    :vars
    (
      ?auto_296430 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_296428 ) ( ON ?auto_296429 ?auto_296430 ) ( CLEAR ?auto_296429 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_296426 ) ( ON ?auto_296427 ?auto_296426 ) ( ON ?auto_296428 ?auto_296427 ) ( not ( = ?auto_296426 ?auto_296427 ) ) ( not ( = ?auto_296426 ?auto_296428 ) ) ( not ( = ?auto_296426 ?auto_296429 ) ) ( not ( = ?auto_296426 ?auto_296430 ) ) ( not ( = ?auto_296427 ?auto_296428 ) ) ( not ( = ?auto_296427 ?auto_296429 ) ) ( not ( = ?auto_296427 ?auto_296430 ) ) ( not ( = ?auto_296428 ?auto_296429 ) ) ( not ( = ?auto_296428 ?auto_296430 ) ) ( not ( = ?auto_296429 ?auto_296430 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_296429 ?auto_296430 )
      ( !STACK ?auto_296429 ?auto_296428 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_296435 - BLOCK
      ?auto_296436 - BLOCK
      ?auto_296437 - BLOCK
      ?auto_296438 - BLOCK
    )
    :vars
    (
      ?auto_296439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296438 ?auto_296439 ) ( ON-TABLE ?auto_296435 ) ( ON ?auto_296436 ?auto_296435 ) ( not ( = ?auto_296435 ?auto_296436 ) ) ( not ( = ?auto_296435 ?auto_296437 ) ) ( not ( = ?auto_296435 ?auto_296438 ) ) ( not ( = ?auto_296435 ?auto_296439 ) ) ( not ( = ?auto_296436 ?auto_296437 ) ) ( not ( = ?auto_296436 ?auto_296438 ) ) ( not ( = ?auto_296436 ?auto_296439 ) ) ( not ( = ?auto_296437 ?auto_296438 ) ) ( not ( = ?auto_296437 ?auto_296439 ) ) ( not ( = ?auto_296438 ?auto_296439 ) ) ( CLEAR ?auto_296436 ) ( ON ?auto_296437 ?auto_296438 ) ( CLEAR ?auto_296437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_296435 ?auto_296436 ?auto_296437 )
      ( MAKE-4PILE ?auto_296435 ?auto_296436 ?auto_296437 ?auto_296438 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_296444 - BLOCK
      ?auto_296445 - BLOCK
      ?auto_296446 - BLOCK
      ?auto_296447 - BLOCK
    )
    :vars
    (
      ?auto_296448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296447 ?auto_296448 ) ( ON-TABLE ?auto_296444 ) ( ON ?auto_296445 ?auto_296444 ) ( not ( = ?auto_296444 ?auto_296445 ) ) ( not ( = ?auto_296444 ?auto_296446 ) ) ( not ( = ?auto_296444 ?auto_296447 ) ) ( not ( = ?auto_296444 ?auto_296448 ) ) ( not ( = ?auto_296445 ?auto_296446 ) ) ( not ( = ?auto_296445 ?auto_296447 ) ) ( not ( = ?auto_296445 ?auto_296448 ) ) ( not ( = ?auto_296446 ?auto_296447 ) ) ( not ( = ?auto_296446 ?auto_296448 ) ) ( not ( = ?auto_296447 ?auto_296448 ) ) ( CLEAR ?auto_296445 ) ( ON ?auto_296446 ?auto_296447 ) ( CLEAR ?auto_296446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_296444 ?auto_296445 ?auto_296446 )
      ( MAKE-4PILE ?auto_296444 ?auto_296445 ?auto_296446 ?auto_296447 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_296453 - BLOCK
      ?auto_296454 - BLOCK
      ?auto_296455 - BLOCK
      ?auto_296456 - BLOCK
    )
    :vars
    (
      ?auto_296457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296456 ?auto_296457 ) ( ON-TABLE ?auto_296453 ) ( not ( = ?auto_296453 ?auto_296454 ) ) ( not ( = ?auto_296453 ?auto_296455 ) ) ( not ( = ?auto_296453 ?auto_296456 ) ) ( not ( = ?auto_296453 ?auto_296457 ) ) ( not ( = ?auto_296454 ?auto_296455 ) ) ( not ( = ?auto_296454 ?auto_296456 ) ) ( not ( = ?auto_296454 ?auto_296457 ) ) ( not ( = ?auto_296455 ?auto_296456 ) ) ( not ( = ?auto_296455 ?auto_296457 ) ) ( not ( = ?auto_296456 ?auto_296457 ) ) ( ON ?auto_296455 ?auto_296456 ) ( CLEAR ?auto_296453 ) ( ON ?auto_296454 ?auto_296455 ) ( CLEAR ?auto_296454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_296453 ?auto_296454 )
      ( MAKE-4PILE ?auto_296453 ?auto_296454 ?auto_296455 ?auto_296456 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_296462 - BLOCK
      ?auto_296463 - BLOCK
      ?auto_296464 - BLOCK
      ?auto_296465 - BLOCK
    )
    :vars
    (
      ?auto_296466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296465 ?auto_296466 ) ( ON-TABLE ?auto_296462 ) ( not ( = ?auto_296462 ?auto_296463 ) ) ( not ( = ?auto_296462 ?auto_296464 ) ) ( not ( = ?auto_296462 ?auto_296465 ) ) ( not ( = ?auto_296462 ?auto_296466 ) ) ( not ( = ?auto_296463 ?auto_296464 ) ) ( not ( = ?auto_296463 ?auto_296465 ) ) ( not ( = ?auto_296463 ?auto_296466 ) ) ( not ( = ?auto_296464 ?auto_296465 ) ) ( not ( = ?auto_296464 ?auto_296466 ) ) ( not ( = ?auto_296465 ?auto_296466 ) ) ( ON ?auto_296464 ?auto_296465 ) ( CLEAR ?auto_296462 ) ( ON ?auto_296463 ?auto_296464 ) ( CLEAR ?auto_296463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_296462 ?auto_296463 )
      ( MAKE-4PILE ?auto_296462 ?auto_296463 ?auto_296464 ?auto_296465 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_296471 - BLOCK
      ?auto_296472 - BLOCK
      ?auto_296473 - BLOCK
      ?auto_296474 - BLOCK
    )
    :vars
    (
      ?auto_296475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296474 ?auto_296475 ) ( not ( = ?auto_296471 ?auto_296472 ) ) ( not ( = ?auto_296471 ?auto_296473 ) ) ( not ( = ?auto_296471 ?auto_296474 ) ) ( not ( = ?auto_296471 ?auto_296475 ) ) ( not ( = ?auto_296472 ?auto_296473 ) ) ( not ( = ?auto_296472 ?auto_296474 ) ) ( not ( = ?auto_296472 ?auto_296475 ) ) ( not ( = ?auto_296473 ?auto_296474 ) ) ( not ( = ?auto_296473 ?auto_296475 ) ) ( not ( = ?auto_296474 ?auto_296475 ) ) ( ON ?auto_296473 ?auto_296474 ) ( ON ?auto_296472 ?auto_296473 ) ( ON ?auto_296471 ?auto_296472 ) ( CLEAR ?auto_296471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_296471 )
      ( MAKE-4PILE ?auto_296471 ?auto_296472 ?auto_296473 ?auto_296474 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_296480 - BLOCK
      ?auto_296481 - BLOCK
      ?auto_296482 - BLOCK
      ?auto_296483 - BLOCK
    )
    :vars
    (
      ?auto_296484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296483 ?auto_296484 ) ( not ( = ?auto_296480 ?auto_296481 ) ) ( not ( = ?auto_296480 ?auto_296482 ) ) ( not ( = ?auto_296480 ?auto_296483 ) ) ( not ( = ?auto_296480 ?auto_296484 ) ) ( not ( = ?auto_296481 ?auto_296482 ) ) ( not ( = ?auto_296481 ?auto_296483 ) ) ( not ( = ?auto_296481 ?auto_296484 ) ) ( not ( = ?auto_296482 ?auto_296483 ) ) ( not ( = ?auto_296482 ?auto_296484 ) ) ( not ( = ?auto_296483 ?auto_296484 ) ) ( ON ?auto_296482 ?auto_296483 ) ( ON ?auto_296481 ?auto_296482 ) ( ON ?auto_296480 ?auto_296481 ) ( CLEAR ?auto_296480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_296480 )
      ( MAKE-4PILE ?auto_296480 ?auto_296481 ?auto_296482 ?auto_296483 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_296490 - BLOCK
      ?auto_296491 - BLOCK
      ?auto_296492 - BLOCK
      ?auto_296493 - BLOCK
      ?auto_296494 - BLOCK
    )
    :vars
    (
      ?auto_296495 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_296493 ) ( ON ?auto_296494 ?auto_296495 ) ( CLEAR ?auto_296494 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_296490 ) ( ON ?auto_296491 ?auto_296490 ) ( ON ?auto_296492 ?auto_296491 ) ( ON ?auto_296493 ?auto_296492 ) ( not ( = ?auto_296490 ?auto_296491 ) ) ( not ( = ?auto_296490 ?auto_296492 ) ) ( not ( = ?auto_296490 ?auto_296493 ) ) ( not ( = ?auto_296490 ?auto_296494 ) ) ( not ( = ?auto_296490 ?auto_296495 ) ) ( not ( = ?auto_296491 ?auto_296492 ) ) ( not ( = ?auto_296491 ?auto_296493 ) ) ( not ( = ?auto_296491 ?auto_296494 ) ) ( not ( = ?auto_296491 ?auto_296495 ) ) ( not ( = ?auto_296492 ?auto_296493 ) ) ( not ( = ?auto_296492 ?auto_296494 ) ) ( not ( = ?auto_296492 ?auto_296495 ) ) ( not ( = ?auto_296493 ?auto_296494 ) ) ( not ( = ?auto_296493 ?auto_296495 ) ) ( not ( = ?auto_296494 ?auto_296495 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_296494 ?auto_296495 )
      ( !STACK ?auto_296494 ?auto_296493 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_296501 - BLOCK
      ?auto_296502 - BLOCK
      ?auto_296503 - BLOCK
      ?auto_296504 - BLOCK
      ?auto_296505 - BLOCK
    )
    :vars
    (
      ?auto_296506 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_296504 ) ( ON ?auto_296505 ?auto_296506 ) ( CLEAR ?auto_296505 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_296501 ) ( ON ?auto_296502 ?auto_296501 ) ( ON ?auto_296503 ?auto_296502 ) ( ON ?auto_296504 ?auto_296503 ) ( not ( = ?auto_296501 ?auto_296502 ) ) ( not ( = ?auto_296501 ?auto_296503 ) ) ( not ( = ?auto_296501 ?auto_296504 ) ) ( not ( = ?auto_296501 ?auto_296505 ) ) ( not ( = ?auto_296501 ?auto_296506 ) ) ( not ( = ?auto_296502 ?auto_296503 ) ) ( not ( = ?auto_296502 ?auto_296504 ) ) ( not ( = ?auto_296502 ?auto_296505 ) ) ( not ( = ?auto_296502 ?auto_296506 ) ) ( not ( = ?auto_296503 ?auto_296504 ) ) ( not ( = ?auto_296503 ?auto_296505 ) ) ( not ( = ?auto_296503 ?auto_296506 ) ) ( not ( = ?auto_296504 ?auto_296505 ) ) ( not ( = ?auto_296504 ?auto_296506 ) ) ( not ( = ?auto_296505 ?auto_296506 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_296505 ?auto_296506 )
      ( !STACK ?auto_296505 ?auto_296504 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_296512 - BLOCK
      ?auto_296513 - BLOCK
      ?auto_296514 - BLOCK
      ?auto_296515 - BLOCK
      ?auto_296516 - BLOCK
    )
    :vars
    (
      ?auto_296517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296516 ?auto_296517 ) ( ON-TABLE ?auto_296512 ) ( ON ?auto_296513 ?auto_296512 ) ( ON ?auto_296514 ?auto_296513 ) ( not ( = ?auto_296512 ?auto_296513 ) ) ( not ( = ?auto_296512 ?auto_296514 ) ) ( not ( = ?auto_296512 ?auto_296515 ) ) ( not ( = ?auto_296512 ?auto_296516 ) ) ( not ( = ?auto_296512 ?auto_296517 ) ) ( not ( = ?auto_296513 ?auto_296514 ) ) ( not ( = ?auto_296513 ?auto_296515 ) ) ( not ( = ?auto_296513 ?auto_296516 ) ) ( not ( = ?auto_296513 ?auto_296517 ) ) ( not ( = ?auto_296514 ?auto_296515 ) ) ( not ( = ?auto_296514 ?auto_296516 ) ) ( not ( = ?auto_296514 ?auto_296517 ) ) ( not ( = ?auto_296515 ?auto_296516 ) ) ( not ( = ?auto_296515 ?auto_296517 ) ) ( not ( = ?auto_296516 ?auto_296517 ) ) ( CLEAR ?auto_296514 ) ( ON ?auto_296515 ?auto_296516 ) ( CLEAR ?auto_296515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_296512 ?auto_296513 ?auto_296514 ?auto_296515 )
      ( MAKE-5PILE ?auto_296512 ?auto_296513 ?auto_296514 ?auto_296515 ?auto_296516 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_296523 - BLOCK
      ?auto_296524 - BLOCK
      ?auto_296525 - BLOCK
      ?auto_296526 - BLOCK
      ?auto_296527 - BLOCK
    )
    :vars
    (
      ?auto_296528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296527 ?auto_296528 ) ( ON-TABLE ?auto_296523 ) ( ON ?auto_296524 ?auto_296523 ) ( ON ?auto_296525 ?auto_296524 ) ( not ( = ?auto_296523 ?auto_296524 ) ) ( not ( = ?auto_296523 ?auto_296525 ) ) ( not ( = ?auto_296523 ?auto_296526 ) ) ( not ( = ?auto_296523 ?auto_296527 ) ) ( not ( = ?auto_296523 ?auto_296528 ) ) ( not ( = ?auto_296524 ?auto_296525 ) ) ( not ( = ?auto_296524 ?auto_296526 ) ) ( not ( = ?auto_296524 ?auto_296527 ) ) ( not ( = ?auto_296524 ?auto_296528 ) ) ( not ( = ?auto_296525 ?auto_296526 ) ) ( not ( = ?auto_296525 ?auto_296527 ) ) ( not ( = ?auto_296525 ?auto_296528 ) ) ( not ( = ?auto_296526 ?auto_296527 ) ) ( not ( = ?auto_296526 ?auto_296528 ) ) ( not ( = ?auto_296527 ?auto_296528 ) ) ( CLEAR ?auto_296525 ) ( ON ?auto_296526 ?auto_296527 ) ( CLEAR ?auto_296526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_296523 ?auto_296524 ?auto_296525 ?auto_296526 )
      ( MAKE-5PILE ?auto_296523 ?auto_296524 ?auto_296525 ?auto_296526 ?auto_296527 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_296534 - BLOCK
      ?auto_296535 - BLOCK
      ?auto_296536 - BLOCK
      ?auto_296537 - BLOCK
      ?auto_296538 - BLOCK
    )
    :vars
    (
      ?auto_296539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296538 ?auto_296539 ) ( ON-TABLE ?auto_296534 ) ( ON ?auto_296535 ?auto_296534 ) ( not ( = ?auto_296534 ?auto_296535 ) ) ( not ( = ?auto_296534 ?auto_296536 ) ) ( not ( = ?auto_296534 ?auto_296537 ) ) ( not ( = ?auto_296534 ?auto_296538 ) ) ( not ( = ?auto_296534 ?auto_296539 ) ) ( not ( = ?auto_296535 ?auto_296536 ) ) ( not ( = ?auto_296535 ?auto_296537 ) ) ( not ( = ?auto_296535 ?auto_296538 ) ) ( not ( = ?auto_296535 ?auto_296539 ) ) ( not ( = ?auto_296536 ?auto_296537 ) ) ( not ( = ?auto_296536 ?auto_296538 ) ) ( not ( = ?auto_296536 ?auto_296539 ) ) ( not ( = ?auto_296537 ?auto_296538 ) ) ( not ( = ?auto_296537 ?auto_296539 ) ) ( not ( = ?auto_296538 ?auto_296539 ) ) ( ON ?auto_296537 ?auto_296538 ) ( CLEAR ?auto_296535 ) ( ON ?auto_296536 ?auto_296537 ) ( CLEAR ?auto_296536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_296534 ?auto_296535 ?auto_296536 )
      ( MAKE-5PILE ?auto_296534 ?auto_296535 ?auto_296536 ?auto_296537 ?auto_296538 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_296545 - BLOCK
      ?auto_296546 - BLOCK
      ?auto_296547 - BLOCK
      ?auto_296548 - BLOCK
      ?auto_296549 - BLOCK
    )
    :vars
    (
      ?auto_296550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296549 ?auto_296550 ) ( ON-TABLE ?auto_296545 ) ( ON ?auto_296546 ?auto_296545 ) ( not ( = ?auto_296545 ?auto_296546 ) ) ( not ( = ?auto_296545 ?auto_296547 ) ) ( not ( = ?auto_296545 ?auto_296548 ) ) ( not ( = ?auto_296545 ?auto_296549 ) ) ( not ( = ?auto_296545 ?auto_296550 ) ) ( not ( = ?auto_296546 ?auto_296547 ) ) ( not ( = ?auto_296546 ?auto_296548 ) ) ( not ( = ?auto_296546 ?auto_296549 ) ) ( not ( = ?auto_296546 ?auto_296550 ) ) ( not ( = ?auto_296547 ?auto_296548 ) ) ( not ( = ?auto_296547 ?auto_296549 ) ) ( not ( = ?auto_296547 ?auto_296550 ) ) ( not ( = ?auto_296548 ?auto_296549 ) ) ( not ( = ?auto_296548 ?auto_296550 ) ) ( not ( = ?auto_296549 ?auto_296550 ) ) ( ON ?auto_296548 ?auto_296549 ) ( CLEAR ?auto_296546 ) ( ON ?auto_296547 ?auto_296548 ) ( CLEAR ?auto_296547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_296545 ?auto_296546 ?auto_296547 )
      ( MAKE-5PILE ?auto_296545 ?auto_296546 ?auto_296547 ?auto_296548 ?auto_296549 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_296556 - BLOCK
      ?auto_296557 - BLOCK
      ?auto_296558 - BLOCK
      ?auto_296559 - BLOCK
      ?auto_296560 - BLOCK
    )
    :vars
    (
      ?auto_296561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296560 ?auto_296561 ) ( ON-TABLE ?auto_296556 ) ( not ( = ?auto_296556 ?auto_296557 ) ) ( not ( = ?auto_296556 ?auto_296558 ) ) ( not ( = ?auto_296556 ?auto_296559 ) ) ( not ( = ?auto_296556 ?auto_296560 ) ) ( not ( = ?auto_296556 ?auto_296561 ) ) ( not ( = ?auto_296557 ?auto_296558 ) ) ( not ( = ?auto_296557 ?auto_296559 ) ) ( not ( = ?auto_296557 ?auto_296560 ) ) ( not ( = ?auto_296557 ?auto_296561 ) ) ( not ( = ?auto_296558 ?auto_296559 ) ) ( not ( = ?auto_296558 ?auto_296560 ) ) ( not ( = ?auto_296558 ?auto_296561 ) ) ( not ( = ?auto_296559 ?auto_296560 ) ) ( not ( = ?auto_296559 ?auto_296561 ) ) ( not ( = ?auto_296560 ?auto_296561 ) ) ( ON ?auto_296559 ?auto_296560 ) ( ON ?auto_296558 ?auto_296559 ) ( CLEAR ?auto_296556 ) ( ON ?auto_296557 ?auto_296558 ) ( CLEAR ?auto_296557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_296556 ?auto_296557 )
      ( MAKE-5PILE ?auto_296556 ?auto_296557 ?auto_296558 ?auto_296559 ?auto_296560 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_296567 - BLOCK
      ?auto_296568 - BLOCK
      ?auto_296569 - BLOCK
      ?auto_296570 - BLOCK
      ?auto_296571 - BLOCK
    )
    :vars
    (
      ?auto_296572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296571 ?auto_296572 ) ( ON-TABLE ?auto_296567 ) ( not ( = ?auto_296567 ?auto_296568 ) ) ( not ( = ?auto_296567 ?auto_296569 ) ) ( not ( = ?auto_296567 ?auto_296570 ) ) ( not ( = ?auto_296567 ?auto_296571 ) ) ( not ( = ?auto_296567 ?auto_296572 ) ) ( not ( = ?auto_296568 ?auto_296569 ) ) ( not ( = ?auto_296568 ?auto_296570 ) ) ( not ( = ?auto_296568 ?auto_296571 ) ) ( not ( = ?auto_296568 ?auto_296572 ) ) ( not ( = ?auto_296569 ?auto_296570 ) ) ( not ( = ?auto_296569 ?auto_296571 ) ) ( not ( = ?auto_296569 ?auto_296572 ) ) ( not ( = ?auto_296570 ?auto_296571 ) ) ( not ( = ?auto_296570 ?auto_296572 ) ) ( not ( = ?auto_296571 ?auto_296572 ) ) ( ON ?auto_296570 ?auto_296571 ) ( ON ?auto_296569 ?auto_296570 ) ( CLEAR ?auto_296567 ) ( ON ?auto_296568 ?auto_296569 ) ( CLEAR ?auto_296568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_296567 ?auto_296568 )
      ( MAKE-5PILE ?auto_296567 ?auto_296568 ?auto_296569 ?auto_296570 ?auto_296571 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_296578 - BLOCK
      ?auto_296579 - BLOCK
      ?auto_296580 - BLOCK
      ?auto_296581 - BLOCK
      ?auto_296582 - BLOCK
    )
    :vars
    (
      ?auto_296583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296582 ?auto_296583 ) ( not ( = ?auto_296578 ?auto_296579 ) ) ( not ( = ?auto_296578 ?auto_296580 ) ) ( not ( = ?auto_296578 ?auto_296581 ) ) ( not ( = ?auto_296578 ?auto_296582 ) ) ( not ( = ?auto_296578 ?auto_296583 ) ) ( not ( = ?auto_296579 ?auto_296580 ) ) ( not ( = ?auto_296579 ?auto_296581 ) ) ( not ( = ?auto_296579 ?auto_296582 ) ) ( not ( = ?auto_296579 ?auto_296583 ) ) ( not ( = ?auto_296580 ?auto_296581 ) ) ( not ( = ?auto_296580 ?auto_296582 ) ) ( not ( = ?auto_296580 ?auto_296583 ) ) ( not ( = ?auto_296581 ?auto_296582 ) ) ( not ( = ?auto_296581 ?auto_296583 ) ) ( not ( = ?auto_296582 ?auto_296583 ) ) ( ON ?auto_296581 ?auto_296582 ) ( ON ?auto_296580 ?auto_296581 ) ( ON ?auto_296579 ?auto_296580 ) ( ON ?auto_296578 ?auto_296579 ) ( CLEAR ?auto_296578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_296578 )
      ( MAKE-5PILE ?auto_296578 ?auto_296579 ?auto_296580 ?auto_296581 ?auto_296582 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_296589 - BLOCK
      ?auto_296590 - BLOCK
      ?auto_296591 - BLOCK
      ?auto_296592 - BLOCK
      ?auto_296593 - BLOCK
    )
    :vars
    (
      ?auto_296594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296593 ?auto_296594 ) ( not ( = ?auto_296589 ?auto_296590 ) ) ( not ( = ?auto_296589 ?auto_296591 ) ) ( not ( = ?auto_296589 ?auto_296592 ) ) ( not ( = ?auto_296589 ?auto_296593 ) ) ( not ( = ?auto_296589 ?auto_296594 ) ) ( not ( = ?auto_296590 ?auto_296591 ) ) ( not ( = ?auto_296590 ?auto_296592 ) ) ( not ( = ?auto_296590 ?auto_296593 ) ) ( not ( = ?auto_296590 ?auto_296594 ) ) ( not ( = ?auto_296591 ?auto_296592 ) ) ( not ( = ?auto_296591 ?auto_296593 ) ) ( not ( = ?auto_296591 ?auto_296594 ) ) ( not ( = ?auto_296592 ?auto_296593 ) ) ( not ( = ?auto_296592 ?auto_296594 ) ) ( not ( = ?auto_296593 ?auto_296594 ) ) ( ON ?auto_296592 ?auto_296593 ) ( ON ?auto_296591 ?auto_296592 ) ( ON ?auto_296590 ?auto_296591 ) ( ON ?auto_296589 ?auto_296590 ) ( CLEAR ?auto_296589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_296589 )
      ( MAKE-5PILE ?auto_296589 ?auto_296590 ?auto_296591 ?auto_296592 ?auto_296593 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_296601 - BLOCK
      ?auto_296602 - BLOCK
      ?auto_296603 - BLOCK
      ?auto_296604 - BLOCK
      ?auto_296605 - BLOCK
      ?auto_296606 - BLOCK
    )
    :vars
    (
      ?auto_296607 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_296605 ) ( ON ?auto_296606 ?auto_296607 ) ( CLEAR ?auto_296606 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_296601 ) ( ON ?auto_296602 ?auto_296601 ) ( ON ?auto_296603 ?auto_296602 ) ( ON ?auto_296604 ?auto_296603 ) ( ON ?auto_296605 ?auto_296604 ) ( not ( = ?auto_296601 ?auto_296602 ) ) ( not ( = ?auto_296601 ?auto_296603 ) ) ( not ( = ?auto_296601 ?auto_296604 ) ) ( not ( = ?auto_296601 ?auto_296605 ) ) ( not ( = ?auto_296601 ?auto_296606 ) ) ( not ( = ?auto_296601 ?auto_296607 ) ) ( not ( = ?auto_296602 ?auto_296603 ) ) ( not ( = ?auto_296602 ?auto_296604 ) ) ( not ( = ?auto_296602 ?auto_296605 ) ) ( not ( = ?auto_296602 ?auto_296606 ) ) ( not ( = ?auto_296602 ?auto_296607 ) ) ( not ( = ?auto_296603 ?auto_296604 ) ) ( not ( = ?auto_296603 ?auto_296605 ) ) ( not ( = ?auto_296603 ?auto_296606 ) ) ( not ( = ?auto_296603 ?auto_296607 ) ) ( not ( = ?auto_296604 ?auto_296605 ) ) ( not ( = ?auto_296604 ?auto_296606 ) ) ( not ( = ?auto_296604 ?auto_296607 ) ) ( not ( = ?auto_296605 ?auto_296606 ) ) ( not ( = ?auto_296605 ?auto_296607 ) ) ( not ( = ?auto_296606 ?auto_296607 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_296606 ?auto_296607 )
      ( !STACK ?auto_296606 ?auto_296605 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_296614 - BLOCK
      ?auto_296615 - BLOCK
      ?auto_296616 - BLOCK
      ?auto_296617 - BLOCK
      ?auto_296618 - BLOCK
      ?auto_296619 - BLOCK
    )
    :vars
    (
      ?auto_296620 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_296618 ) ( ON ?auto_296619 ?auto_296620 ) ( CLEAR ?auto_296619 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_296614 ) ( ON ?auto_296615 ?auto_296614 ) ( ON ?auto_296616 ?auto_296615 ) ( ON ?auto_296617 ?auto_296616 ) ( ON ?auto_296618 ?auto_296617 ) ( not ( = ?auto_296614 ?auto_296615 ) ) ( not ( = ?auto_296614 ?auto_296616 ) ) ( not ( = ?auto_296614 ?auto_296617 ) ) ( not ( = ?auto_296614 ?auto_296618 ) ) ( not ( = ?auto_296614 ?auto_296619 ) ) ( not ( = ?auto_296614 ?auto_296620 ) ) ( not ( = ?auto_296615 ?auto_296616 ) ) ( not ( = ?auto_296615 ?auto_296617 ) ) ( not ( = ?auto_296615 ?auto_296618 ) ) ( not ( = ?auto_296615 ?auto_296619 ) ) ( not ( = ?auto_296615 ?auto_296620 ) ) ( not ( = ?auto_296616 ?auto_296617 ) ) ( not ( = ?auto_296616 ?auto_296618 ) ) ( not ( = ?auto_296616 ?auto_296619 ) ) ( not ( = ?auto_296616 ?auto_296620 ) ) ( not ( = ?auto_296617 ?auto_296618 ) ) ( not ( = ?auto_296617 ?auto_296619 ) ) ( not ( = ?auto_296617 ?auto_296620 ) ) ( not ( = ?auto_296618 ?auto_296619 ) ) ( not ( = ?auto_296618 ?auto_296620 ) ) ( not ( = ?auto_296619 ?auto_296620 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_296619 ?auto_296620 )
      ( !STACK ?auto_296619 ?auto_296618 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_296627 - BLOCK
      ?auto_296628 - BLOCK
      ?auto_296629 - BLOCK
      ?auto_296630 - BLOCK
      ?auto_296631 - BLOCK
      ?auto_296632 - BLOCK
    )
    :vars
    (
      ?auto_296633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296632 ?auto_296633 ) ( ON-TABLE ?auto_296627 ) ( ON ?auto_296628 ?auto_296627 ) ( ON ?auto_296629 ?auto_296628 ) ( ON ?auto_296630 ?auto_296629 ) ( not ( = ?auto_296627 ?auto_296628 ) ) ( not ( = ?auto_296627 ?auto_296629 ) ) ( not ( = ?auto_296627 ?auto_296630 ) ) ( not ( = ?auto_296627 ?auto_296631 ) ) ( not ( = ?auto_296627 ?auto_296632 ) ) ( not ( = ?auto_296627 ?auto_296633 ) ) ( not ( = ?auto_296628 ?auto_296629 ) ) ( not ( = ?auto_296628 ?auto_296630 ) ) ( not ( = ?auto_296628 ?auto_296631 ) ) ( not ( = ?auto_296628 ?auto_296632 ) ) ( not ( = ?auto_296628 ?auto_296633 ) ) ( not ( = ?auto_296629 ?auto_296630 ) ) ( not ( = ?auto_296629 ?auto_296631 ) ) ( not ( = ?auto_296629 ?auto_296632 ) ) ( not ( = ?auto_296629 ?auto_296633 ) ) ( not ( = ?auto_296630 ?auto_296631 ) ) ( not ( = ?auto_296630 ?auto_296632 ) ) ( not ( = ?auto_296630 ?auto_296633 ) ) ( not ( = ?auto_296631 ?auto_296632 ) ) ( not ( = ?auto_296631 ?auto_296633 ) ) ( not ( = ?auto_296632 ?auto_296633 ) ) ( CLEAR ?auto_296630 ) ( ON ?auto_296631 ?auto_296632 ) ( CLEAR ?auto_296631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_296627 ?auto_296628 ?auto_296629 ?auto_296630 ?auto_296631 )
      ( MAKE-6PILE ?auto_296627 ?auto_296628 ?auto_296629 ?auto_296630 ?auto_296631 ?auto_296632 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_296640 - BLOCK
      ?auto_296641 - BLOCK
      ?auto_296642 - BLOCK
      ?auto_296643 - BLOCK
      ?auto_296644 - BLOCK
      ?auto_296645 - BLOCK
    )
    :vars
    (
      ?auto_296646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296645 ?auto_296646 ) ( ON-TABLE ?auto_296640 ) ( ON ?auto_296641 ?auto_296640 ) ( ON ?auto_296642 ?auto_296641 ) ( ON ?auto_296643 ?auto_296642 ) ( not ( = ?auto_296640 ?auto_296641 ) ) ( not ( = ?auto_296640 ?auto_296642 ) ) ( not ( = ?auto_296640 ?auto_296643 ) ) ( not ( = ?auto_296640 ?auto_296644 ) ) ( not ( = ?auto_296640 ?auto_296645 ) ) ( not ( = ?auto_296640 ?auto_296646 ) ) ( not ( = ?auto_296641 ?auto_296642 ) ) ( not ( = ?auto_296641 ?auto_296643 ) ) ( not ( = ?auto_296641 ?auto_296644 ) ) ( not ( = ?auto_296641 ?auto_296645 ) ) ( not ( = ?auto_296641 ?auto_296646 ) ) ( not ( = ?auto_296642 ?auto_296643 ) ) ( not ( = ?auto_296642 ?auto_296644 ) ) ( not ( = ?auto_296642 ?auto_296645 ) ) ( not ( = ?auto_296642 ?auto_296646 ) ) ( not ( = ?auto_296643 ?auto_296644 ) ) ( not ( = ?auto_296643 ?auto_296645 ) ) ( not ( = ?auto_296643 ?auto_296646 ) ) ( not ( = ?auto_296644 ?auto_296645 ) ) ( not ( = ?auto_296644 ?auto_296646 ) ) ( not ( = ?auto_296645 ?auto_296646 ) ) ( CLEAR ?auto_296643 ) ( ON ?auto_296644 ?auto_296645 ) ( CLEAR ?auto_296644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_296640 ?auto_296641 ?auto_296642 ?auto_296643 ?auto_296644 )
      ( MAKE-6PILE ?auto_296640 ?auto_296641 ?auto_296642 ?auto_296643 ?auto_296644 ?auto_296645 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_296653 - BLOCK
      ?auto_296654 - BLOCK
      ?auto_296655 - BLOCK
      ?auto_296656 - BLOCK
      ?auto_296657 - BLOCK
      ?auto_296658 - BLOCK
    )
    :vars
    (
      ?auto_296659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296658 ?auto_296659 ) ( ON-TABLE ?auto_296653 ) ( ON ?auto_296654 ?auto_296653 ) ( ON ?auto_296655 ?auto_296654 ) ( not ( = ?auto_296653 ?auto_296654 ) ) ( not ( = ?auto_296653 ?auto_296655 ) ) ( not ( = ?auto_296653 ?auto_296656 ) ) ( not ( = ?auto_296653 ?auto_296657 ) ) ( not ( = ?auto_296653 ?auto_296658 ) ) ( not ( = ?auto_296653 ?auto_296659 ) ) ( not ( = ?auto_296654 ?auto_296655 ) ) ( not ( = ?auto_296654 ?auto_296656 ) ) ( not ( = ?auto_296654 ?auto_296657 ) ) ( not ( = ?auto_296654 ?auto_296658 ) ) ( not ( = ?auto_296654 ?auto_296659 ) ) ( not ( = ?auto_296655 ?auto_296656 ) ) ( not ( = ?auto_296655 ?auto_296657 ) ) ( not ( = ?auto_296655 ?auto_296658 ) ) ( not ( = ?auto_296655 ?auto_296659 ) ) ( not ( = ?auto_296656 ?auto_296657 ) ) ( not ( = ?auto_296656 ?auto_296658 ) ) ( not ( = ?auto_296656 ?auto_296659 ) ) ( not ( = ?auto_296657 ?auto_296658 ) ) ( not ( = ?auto_296657 ?auto_296659 ) ) ( not ( = ?auto_296658 ?auto_296659 ) ) ( ON ?auto_296657 ?auto_296658 ) ( CLEAR ?auto_296655 ) ( ON ?auto_296656 ?auto_296657 ) ( CLEAR ?auto_296656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_296653 ?auto_296654 ?auto_296655 ?auto_296656 )
      ( MAKE-6PILE ?auto_296653 ?auto_296654 ?auto_296655 ?auto_296656 ?auto_296657 ?auto_296658 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_296666 - BLOCK
      ?auto_296667 - BLOCK
      ?auto_296668 - BLOCK
      ?auto_296669 - BLOCK
      ?auto_296670 - BLOCK
      ?auto_296671 - BLOCK
    )
    :vars
    (
      ?auto_296672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296671 ?auto_296672 ) ( ON-TABLE ?auto_296666 ) ( ON ?auto_296667 ?auto_296666 ) ( ON ?auto_296668 ?auto_296667 ) ( not ( = ?auto_296666 ?auto_296667 ) ) ( not ( = ?auto_296666 ?auto_296668 ) ) ( not ( = ?auto_296666 ?auto_296669 ) ) ( not ( = ?auto_296666 ?auto_296670 ) ) ( not ( = ?auto_296666 ?auto_296671 ) ) ( not ( = ?auto_296666 ?auto_296672 ) ) ( not ( = ?auto_296667 ?auto_296668 ) ) ( not ( = ?auto_296667 ?auto_296669 ) ) ( not ( = ?auto_296667 ?auto_296670 ) ) ( not ( = ?auto_296667 ?auto_296671 ) ) ( not ( = ?auto_296667 ?auto_296672 ) ) ( not ( = ?auto_296668 ?auto_296669 ) ) ( not ( = ?auto_296668 ?auto_296670 ) ) ( not ( = ?auto_296668 ?auto_296671 ) ) ( not ( = ?auto_296668 ?auto_296672 ) ) ( not ( = ?auto_296669 ?auto_296670 ) ) ( not ( = ?auto_296669 ?auto_296671 ) ) ( not ( = ?auto_296669 ?auto_296672 ) ) ( not ( = ?auto_296670 ?auto_296671 ) ) ( not ( = ?auto_296670 ?auto_296672 ) ) ( not ( = ?auto_296671 ?auto_296672 ) ) ( ON ?auto_296670 ?auto_296671 ) ( CLEAR ?auto_296668 ) ( ON ?auto_296669 ?auto_296670 ) ( CLEAR ?auto_296669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_296666 ?auto_296667 ?auto_296668 ?auto_296669 )
      ( MAKE-6PILE ?auto_296666 ?auto_296667 ?auto_296668 ?auto_296669 ?auto_296670 ?auto_296671 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_296679 - BLOCK
      ?auto_296680 - BLOCK
      ?auto_296681 - BLOCK
      ?auto_296682 - BLOCK
      ?auto_296683 - BLOCK
      ?auto_296684 - BLOCK
    )
    :vars
    (
      ?auto_296685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296684 ?auto_296685 ) ( ON-TABLE ?auto_296679 ) ( ON ?auto_296680 ?auto_296679 ) ( not ( = ?auto_296679 ?auto_296680 ) ) ( not ( = ?auto_296679 ?auto_296681 ) ) ( not ( = ?auto_296679 ?auto_296682 ) ) ( not ( = ?auto_296679 ?auto_296683 ) ) ( not ( = ?auto_296679 ?auto_296684 ) ) ( not ( = ?auto_296679 ?auto_296685 ) ) ( not ( = ?auto_296680 ?auto_296681 ) ) ( not ( = ?auto_296680 ?auto_296682 ) ) ( not ( = ?auto_296680 ?auto_296683 ) ) ( not ( = ?auto_296680 ?auto_296684 ) ) ( not ( = ?auto_296680 ?auto_296685 ) ) ( not ( = ?auto_296681 ?auto_296682 ) ) ( not ( = ?auto_296681 ?auto_296683 ) ) ( not ( = ?auto_296681 ?auto_296684 ) ) ( not ( = ?auto_296681 ?auto_296685 ) ) ( not ( = ?auto_296682 ?auto_296683 ) ) ( not ( = ?auto_296682 ?auto_296684 ) ) ( not ( = ?auto_296682 ?auto_296685 ) ) ( not ( = ?auto_296683 ?auto_296684 ) ) ( not ( = ?auto_296683 ?auto_296685 ) ) ( not ( = ?auto_296684 ?auto_296685 ) ) ( ON ?auto_296683 ?auto_296684 ) ( ON ?auto_296682 ?auto_296683 ) ( CLEAR ?auto_296680 ) ( ON ?auto_296681 ?auto_296682 ) ( CLEAR ?auto_296681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_296679 ?auto_296680 ?auto_296681 )
      ( MAKE-6PILE ?auto_296679 ?auto_296680 ?auto_296681 ?auto_296682 ?auto_296683 ?auto_296684 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_296692 - BLOCK
      ?auto_296693 - BLOCK
      ?auto_296694 - BLOCK
      ?auto_296695 - BLOCK
      ?auto_296696 - BLOCK
      ?auto_296697 - BLOCK
    )
    :vars
    (
      ?auto_296698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296697 ?auto_296698 ) ( ON-TABLE ?auto_296692 ) ( ON ?auto_296693 ?auto_296692 ) ( not ( = ?auto_296692 ?auto_296693 ) ) ( not ( = ?auto_296692 ?auto_296694 ) ) ( not ( = ?auto_296692 ?auto_296695 ) ) ( not ( = ?auto_296692 ?auto_296696 ) ) ( not ( = ?auto_296692 ?auto_296697 ) ) ( not ( = ?auto_296692 ?auto_296698 ) ) ( not ( = ?auto_296693 ?auto_296694 ) ) ( not ( = ?auto_296693 ?auto_296695 ) ) ( not ( = ?auto_296693 ?auto_296696 ) ) ( not ( = ?auto_296693 ?auto_296697 ) ) ( not ( = ?auto_296693 ?auto_296698 ) ) ( not ( = ?auto_296694 ?auto_296695 ) ) ( not ( = ?auto_296694 ?auto_296696 ) ) ( not ( = ?auto_296694 ?auto_296697 ) ) ( not ( = ?auto_296694 ?auto_296698 ) ) ( not ( = ?auto_296695 ?auto_296696 ) ) ( not ( = ?auto_296695 ?auto_296697 ) ) ( not ( = ?auto_296695 ?auto_296698 ) ) ( not ( = ?auto_296696 ?auto_296697 ) ) ( not ( = ?auto_296696 ?auto_296698 ) ) ( not ( = ?auto_296697 ?auto_296698 ) ) ( ON ?auto_296696 ?auto_296697 ) ( ON ?auto_296695 ?auto_296696 ) ( CLEAR ?auto_296693 ) ( ON ?auto_296694 ?auto_296695 ) ( CLEAR ?auto_296694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_296692 ?auto_296693 ?auto_296694 )
      ( MAKE-6PILE ?auto_296692 ?auto_296693 ?auto_296694 ?auto_296695 ?auto_296696 ?auto_296697 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_296705 - BLOCK
      ?auto_296706 - BLOCK
      ?auto_296707 - BLOCK
      ?auto_296708 - BLOCK
      ?auto_296709 - BLOCK
      ?auto_296710 - BLOCK
    )
    :vars
    (
      ?auto_296711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296710 ?auto_296711 ) ( ON-TABLE ?auto_296705 ) ( not ( = ?auto_296705 ?auto_296706 ) ) ( not ( = ?auto_296705 ?auto_296707 ) ) ( not ( = ?auto_296705 ?auto_296708 ) ) ( not ( = ?auto_296705 ?auto_296709 ) ) ( not ( = ?auto_296705 ?auto_296710 ) ) ( not ( = ?auto_296705 ?auto_296711 ) ) ( not ( = ?auto_296706 ?auto_296707 ) ) ( not ( = ?auto_296706 ?auto_296708 ) ) ( not ( = ?auto_296706 ?auto_296709 ) ) ( not ( = ?auto_296706 ?auto_296710 ) ) ( not ( = ?auto_296706 ?auto_296711 ) ) ( not ( = ?auto_296707 ?auto_296708 ) ) ( not ( = ?auto_296707 ?auto_296709 ) ) ( not ( = ?auto_296707 ?auto_296710 ) ) ( not ( = ?auto_296707 ?auto_296711 ) ) ( not ( = ?auto_296708 ?auto_296709 ) ) ( not ( = ?auto_296708 ?auto_296710 ) ) ( not ( = ?auto_296708 ?auto_296711 ) ) ( not ( = ?auto_296709 ?auto_296710 ) ) ( not ( = ?auto_296709 ?auto_296711 ) ) ( not ( = ?auto_296710 ?auto_296711 ) ) ( ON ?auto_296709 ?auto_296710 ) ( ON ?auto_296708 ?auto_296709 ) ( ON ?auto_296707 ?auto_296708 ) ( CLEAR ?auto_296705 ) ( ON ?auto_296706 ?auto_296707 ) ( CLEAR ?auto_296706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_296705 ?auto_296706 )
      ( MAKE-6PILE ?auto_296705 ?auto_296706 ?auto_296707 ?auto_296708 ?auto_296709 ?auto_296710 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_296718 - BLOCK
      ?auto_296719 - BLOCK
      ?auto_296720 - BLOCK
      ?auto_296721 - BLOCK
      ?auto_296722 - BLOCK
      ?auto_296723 - BLOCK
    )
    :vars
    (
      ?auto_296724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296723 ?auto_296724 ) ( ON-TABLE ?auto_296718 ) ( not ( = ?auto_296718 ?auto_296719 ) ) ( not ( = ?auto_296718 ?auto_296720 ) ) ( not ( = ?auto_296718 ?auto_296721 ) ) ( not ( = ?auto_296718 ?auto_296722 ) ) ( not ( = ?auto_296718 ?auto_296723 ) ) ( not ( = ?auto_296718 ?auto_296724 ) ) ( not ( = ?auto_296719 ?auto_296720 ) ) ( not ( = ?auto_296719 ?auto_296721 ) ) ( not ( = ?auto_296719 ?auto_296722 ) ) ( not ( = ?auto_296719 ?auto_296723 ) ) ( not ( = ?auto_296719 ?auto_296724 ) ) ( not ( = ?auto_296720 ?auto_296721 ) ) ( not ( = ?auto_296720 ?auto_296722 ) ) ( not ( = ?auto_296720 ?auto_296723 ) ) ( not ( = ?auto_296720 ?auto_296724 ) ) ( not ( = ?auto_296721 ?auto_296722 ) ) ( not ( = ?auto_296721 ?auto_296723 ) ) ( not ( = ?auto_296721 ?auto_296724 ) ) ( not ( = ?auto_296722 ?auto_296723 ) ) ( not ( = ?auto_296722 ?auto_296724 ) ) ( not ( = ?auto_296723 ?auto_296724 ) ) ( ON ?auto_296722 ?auto_296723 ) ( ON ?auto_296721 ?auto_296722 ) ( ON ?auto_296720 ?auto_296721 ) ( CLEAR ?auto_296718 ) ( ON ?auto_296719 ?auto_296720 ) ( CLEAR ?auto_296719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_296718 ?auto_296719 )
      ( MAKE-6PILE ?auto_296718 ?auto_296719 ?auto_296720 ?auto_296721 ?auto_296722 ?auto_296723 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_296731 - BLOCK
      ?auto_296732 - BLOCK
      ?auto_296733 - BLOCK
      ?auto_296734 - BLOCK
      ?auto_296735 - BLOCK
      ?auto_296736 - BLOCK
    )
    :vars
    (
      ?auto_296737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296736 ?auto_296737 ) ( not ( = ?auto_296731 ?auto_296732 ) ) ( not ( = ?auto_296731 ?auto_296733 ) ) ( not ( = ?auto_296731 ?auto_296734 ) ) ( not ( = ?auto_296731 ?auto_296735 ) ) ( not ( = ?auto_296731 ?auto_296736 ) ) ( not ( = ?auto_296731 ?auto_296737 ) ) ( not ( = ?auto_296732 ?auto_296733 ) ) ( not ( = ?auto_296732 ?auto_296734 ) ) ( not ( = ?auto_296732 ?auto_296735 ) ) ( not ( = ?auto_296732 ?auto_296736 ) ) ( not ( = ?auto_296732 ?auto_296737 ) ) ( not ( = ?auto_296733 ?auto_296734 ) ) ( not ( = ?auto_296733 ?auto_296735 ) ) ( not ( = ?auto_296733 ?auto_296736 ) ) ( not ( = ?auto_296733 ?auto_296737 ) ) ( not ( = ?auto_296734 ?auto_296735 ) ) ( not ( = ?auto_296734 ?auto_296736 ) ) ( not ( = ?auto_296734 ?auto_296737 ) ) ( not ( = ?auto_296735 ?auto_296736 ) ) ( not ( = ?auto_296735 ?auto_296737 ) ) ( not ( = ?auto_296736 ?auto_296737 ) ) ( ON ?auto_296735 ?auto_296736 ) ( ON ?auto_296734 ?auto_296735 ) ( ON ?auto_296733 ?auto_296734 ) ( ON ?auto_296732 ?auto_296733 ) ( ON ?auto_296731 ?auto_296732 ) ( CLEAR ?auto_296731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_296731 )
      ( MAKE-6PILE ?auto_296731 ?auto_296732 ?auto_296733 ?auto_296734 ?auto_296735 ?auto_296736 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_296744 - BLOCK
      ?auto_296745 - BLOCK
      ?auto_296746 - BLOCK
      ?auto_296747 - BLOCK
      ?auto_296748 - BLOCK
      ?auto_296749 - BLOCK
    )
    :vars
    (
      ?auto_296750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296749 ?auto_296750 ) ( not ( = ?auto_296744 ?auto_296745 ) ) ( not ( = ?auto_296744 ?auto_296746 ) ) ( not ( = ?auto_296744 ?auto_296747 ) ) ( not ( = ?auto_296744 ?auto_296748 ) ) ( not ( = ?auto_296744 ?auto_296749 ) ) ( not ( = ?auto_296744 ?auto_296750 ) ) ( not ( = ?auto_296745 ?auto_296746 ) ) ( not ( = ?auto_296745 ?auto_296747 ) ) ( not ( = ?auto_296745 ?auto_296748 ) ) ( not ( = ?auto_296745 ?auto_296749 ) ) ( not ( = ?auto_296745 ?auto_296750 ) ) ( not ( = ?auto_296746 ?auto_296747 ) ) ( not ( = ?auto_296746 ?auto_296748 ) ) ( not ( = ?auto_296746 ?auto_296749 ) ) ( not ( = ?auto_296746 ?auto_296750 ) ) ( not ( = ?auto_296747 ?auto_296748 ) ) ( not ( = ?auto_296747 ?auto_296749 ) ) ( not ( = ?auto_296747 ?auto_296750 ) ) ( not ( = ?auto_296748 ?auto_296749 ) ) ( not ( = ?auto_296748 ?auto_296750 ) ) ( not ( = ?auto_296749 ?auto_296750 ) ) ( ON ?auto_296748 ?auto_296749 ) ( ON ?auto_296747 ?auto_296748 ) ( ON ?auto_296746 ?auto_296747 ) ( ON ?auto_296745 ?auto_296746 ) ( ON ?auto_296744 ?auto_296745 ) ( CLEAR ?auto_296744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_296744 )
      ( MAKE-6PILE ?auto_296744 ?auto_296745 ?auto_296746 ?auto_296747 ?auto_296748 ?auto_296749 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_296758 - BLOCK
      ?auto_296759 - BLOCK
      ?auto_296760 - BLOCK
      ?auto_296761 - BLOCK
      ?auto_296762 - BLOCK
      ?auto_296763 - BLOCK
      ?auto_296764 - BLOCK
    )
    :vars
    (
      ?auto_296765 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_296763 ) ( ON ?auto_296764 ?auto_296765 ) ( CLEAR ?auto_296764 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_296758 ) ( ON ?auto_296759 ?auto_296758 ) ( ON ?auto_296760 ?auto_296759 ) ( ON ?auto_296761 ?auto_296760 ) ( ON ?auto_296762 ?auto_296761 ) ( ON ?auto_296763 ?auto_296762 ) ( not ( = ?auto_296758 ?auto_296759 ) ) ( not ( = ?auto_296758 ?auto_296760 ) ) ( not ( = ?auto_296758 ?auto_296761 ) ) ( not ( = ?auto_296758 ?auto_296762 ) ) ( not ( = ?auto_296758 ?auto_296763 ) ) ( not ( = ?auto_296758 ?auto_296764 ) ) ( not ( = ?auto_296758 ?auto_296765 ) ) ( not ( = ?auto_296759 ?auto_296760 ) ) ( not ( = ?auto_296759 ?auto_296761 ) ) ( not ( = ?auto_296759 ?auto_296762 ) ) ( not ( = ?auto_296759 ?auto_296763 ) ) ( not ( = ?auto_296759 ?auto_296764 ) ) ( not ( = ?auto_296759 ?auto_296765 ) ) ( not ( = ?auto_296760 ?auto_296761 ) ) ( not ( = ?auto_296760 ?auto_296762 ) ) ( not ( = ?auto_296760 ?auto_296763 ) ) ( not ( = ?auto_296760 ?auto_296764 ) ) ( not ( = ?auto_296760 ?auto_296765 ) ) ( not ( = ?auto_296761 ?auto_296762 ) ) ( not ( = ?auto_296761 ?auto_296763 ) ) ( not ( = ?auto_296761 ?auto_296764 ) ) ( not ( = ?auto_296761 ?auto_296765 ) ) ( not ( = ?auto_296762 ?auto_296763 ) ) ( not ( = ?auto_296762 ?auto_296764 ) ) ( not ( = ?auto_296762 ?auto_296765 ) ) ( not ( = ?auto_296763 ?auto_296764 ) ) ( not ( = ?auto_296763 ?auto_296765 ) ) ( not ( = ?auto_296764 ?auto_296765 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_296764 ?auto_296765 )
      ( !STACK ?auto_296764 ?auto_296763 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_296773 - BLOCK
      ?auto_296774 - BLOCK
      ?auto_296775 - BLOCK
      ?auto_296776 - BLOCK
      ?auto_296777 - BLOCK
      ?auto_296778 - BLOCK
      ?auto_296779 - BLOCK
    )
    :vars
    (
      ?auto_296780 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_296778 ) ( ON ?auto_296779 ?auto_296780 ) ( CLEAR ?auto_296779 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_296773 ) ( ON ?auto_296774 ?auto_296773 ) ( ON ?auto_296775 ?auto_296774 ) ( ON ?auto_296776 ?auto_296775 ) ( ON ?auto_296777 ?auto_296776 ) ( ON ?auto_296778 ?auto_296777 ) ( not ( = ?auto_296773 ?auto_296774 ) ) ( not ( = ?auto_296773 ?auto_296775 ) ) ( not ( = ?auto_296773 ?auto_296776 ) ) ( not ( = ?auto_296773 ?auto_296777 ) ) ( not ( = ?auto_296773 ?auto_296778 ) ) ( not ( = ?auto_296773 ?auto_296779 ) ) ( not ( = ?auto_296773 ?auto_296780 ) ) ( not ( = ?auto_296774 ?auto_296775 ) ) ( not ( = ?auto_296774 ?auto_296776 ) ) ( not ( = ?auto_296774 ?auto_296777 ) ) ( not ( = ?auto_296774 ?auto_296778 ) ) ( not ( = ?auto_296774 ?auto_296779 ) ) ( not ( = ?auto_296774 ?auto_296780 ) ) ( not ( = ?auto_296775 ?auto_296776 ) ) ( not ( = ?auto_296775 ?auto_296777 ) ) ( not ( = ?auto_296775 ?auto_296778 ) ) ( not ( = ?auto_296775 ?auto_296779 ) ) ( not ( = ?auto_296775 ?auto_296780 ) ) ( not ( = ?auto_296776 ?auto_296777 ) ) ( not ( = ?auto_296776 ?auto_296778 ) ) ( not ( = ?auto_296776 ?auto_296779 ) ) ( not ( = ?auto_296776 ?auto_296780 ) ) ( not ( = ?auto_296777 ?auto_296778 ) ) ( not ( = ?auto_296777 ?auto_296779 ) ) ( not ( = ?auto_296777 ?auto_296780 ) ) ( not ( = ?auto_296778 ?auto_296779 ) ) ( not ( = ?auto_296778 ?auto_296780 ) ) ( not ( = ?auto_296779 ?auto_296780 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_296779 ?auto_296780 )
      ( !STACK ?auto_296779 ?auto_296778 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_296788 - BLOCK
      ?auto_296789 - BLOCK
      ?auto_296790 - BLOCK
      ?auto_296791 - BLOCK
      ?auto_296792 - BLOCK
      ?auto_296793 - BLOCK
      ?auto_296794 - BLOCK
    )
    :vars
    (
      ?auto_296795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296794 ?auto_296795 ) ( ON-TABLE ?auto_296788 ) ( ON ?auto_296789 ?auto_296788 ) ( ON ?auto_296790 ?auto_296789 ) ( ON ?auto_296791 ?auto_296790 ) ( ON ?auto_296792 ?auto_296791 ) ( not ( = ?auto_296788 ?auto_296789 ) ) ( not ( = ?auto_296788 ?auto_296790 ) ) ( not ( = ?auto_296788 ?auto_296791 ) ) ( not ( = ?auto_296788 ?auto_296792 ) ) ( not ( = ?auto_296788 ?auto_296793 ) ) ( not ( = ?auto_296788 ?auto_296794 ) ) ( not ( = ?auto_296788 ?auto_296795 ) ) ( not ( = ?auto_296789 ?auto_296790 ) ) ( not ( = ?auto_296789 ?auto_296791 ) ) ( not ( = ?auto_296789 ?auto_296792 ) ) ( not ( = ?auto_296789 ?auto_296793 ) ) ( not ( = ?auto_296789 ?auto_296794 ) ) ( not ( = ?auto_296789 ?auto_296795 ) ) ( not ( = ?auto_296790 ?auto_296791 ) ) ( not ( = ?auto_296790 ?auto_296792 ) ) ( not ( = ?auto_296790 ?auto_296793 ) ) ( not ( = ?auto_296790 ?auto_296794 ) ) ( not ( = ?auto_296790 ?auto_296795 ) ) ( not ( = ?auto_296791 ?auto_296792 ) ) ( not ( = ?auto_296791 ?auto_296793 ) ) ( not ( = ?auto_296791 ?auto_296794 ) ) ( not ( = ?auto_296791 ?auto_296795 ) ) ( not ( = ?auto_296792 ?auto_296793 ) ) ( not ( = ?auto_296792 ?auto_296794 ) ) ( not ( = ?auto_296792 ?auto_296795 ) ) ( not ( = ?auto_296793 ?auto_296794 ) ) ( not ( = ?auto_296793 ?auto_296795 ) ) ( not ( = ?auto_296794 ?auto_296795 ) ) ( CLEAR ?auto_296792 ) ( ON ?auto_296793 ?auto_296794 ) ( CLEAR ?auto_296793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_296788 ?auto_296789 ?auto_296790 ?auto_296791 ?auto_296792 ?auto_296793 )
      ( MAKE-7PILE ?auto_296788 ?auto_296789 ?auto_296790 ?auto_296791 ?auto_296792 ?auto_296793 ?auto_296794 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_296803 - BLOCK
      ?auto_296804 - BLOCK
      ?auto_296805 - BLOCK
      ?auto_296806 - BLOCK
      ?auto_296807 - BLOCK
      ?auto_296808 - BLOCK
      ?auto_296809 - BLOCK
    )
    :vars
    (
      ?auto_296810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296809 ?auto_296810 ) ( ON-TABLE ?auto_296803 ) ( ON ?auto_296804 ?auto_296803 ) ( ON ?auto_296805 ?auto_296804 ) ( ON ?auto_296806 ?auto_296805 ) ( ON ?auto_296807 ?auto_296806 ) ( not ( = ?auto_296803 ?auto_296804 ) ) ( not ( = ?auto_296803 ?auto_296805 ) ) ( not ( = ?auto_296803 ?auto_296806 ) ) ( not ( = ?auto_296803 ?auto_296807 ) ) ( not ( = ?auto_296803 ?auto_296808 ) ) ( not ( = ?auto_296803 ?auto_296809 ) ) ( not ( = ?auto_296803 ?auto_296810 ) ) ( not ( = ?auto_296804 ?auto_296805 ) ) ( not ( = ?auto_296804 ?auto_296806 ) ) ( not ( = ?auto_296804 ?auto_296807 ) ) ( not ( = ?auto_296804 ?auto_296808 ) ) ( not ( = ?auto_296804 ?auto_296809 ) ) ( not ( = ?auto_296804 ?auto_296810 ) ) ( not ( = ?auto_296805 ?auto_296806 ) ) ( not ( = ?auto_296805 ?auto_296807 ) ) ( not ( = ?auto_296805 ?auto_296808 ) ) ( not ( = ?auto_296805 ?auto_296809 ) ) ( not ( = ?auto_296805 ?auto_296810 ) ) ( not ( = ?auto_296806 ?auto_296807 ) ) ( not ( = ?auto_296806 ?auto_296808 ) ) ( not ( = ?auto_296806 ?auto_296809 ) ) ( not ( = ?auto_296806 ?auto_296810 ) ) ( not ( = ?auto_296807 ?auto_296808 ) ) ( not ( = ?auto_296807 ?auto_296809 ) ) ( not ( = ?auto_296807 ?auto_296810 ) ) ( not ( = ?auto_296808 ?auto_296809 ) ) ( not ( = ?auto_296808 ?auto_296810 ) ) ( not ( = ?auto_296809 ?auto_296810 ) ) ( CLEAR ?auto_296807 ) ( ON ?auto_296808 ?auto_296809 ) ( CLEAR ?auto_296808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_296803 ?auto_296804 ?auto_296805 ?auto_296806 ?auto_296807 ?auto_296808 )
      ( MAKE-7PILE ?auto_296803 ?auto_296804 ?auto_296805 ?auto_296806 ?auto_296807 ?auto_296808 ?auto_296809 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_296818 - BLOCK
      ?auto_296819 - BLOCK
      ?auto_296820 - BLOCK
      ?auto_296821 - BLOCK
      ?auto_296822 - BLOCK
      ?auto_296823 - BLOCK
      ?auto_296824 - BLOCK
    )
    :vars
    (
      ?auto_296825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296824 ?auto_296825 ) ( ON-TABLE ?auto_296818 ) ( ON ?auto_296819 ?auto_296818 ) ( ON ?auto_296820 ?auto_296819 ) ( ON ?auto_296821 ?auto_296820 ) ( not ( = ?auto_296818 ?auto_296819 ) ) ( not ( = ?auto_296818 ?auto_296820 ) ) ( not ( = ?auto_296818 ?auto_296821 ) ) ( not ( = ?auto_296818 ?auto_296822 ) ) ( not ( = ?auto_296818 ?auto_296823 ) ) ( not ( = ?auto_296818 ?auto_296824 ) ) ( not ( = ?auto_296818 ?auto_296825 ) ) ( not ( = ?auto_296819 ?auto_296820 ) ) ( not ( = ?auto_296819 ?auto_296821 ) ) ( not ( = ?auto_296819 ?auto_296822 ) ) ( not ( = ?auto_296819 ?auto_296823 ) ) ( not ( = ?auto_296819 ?auto_296824 ) ) ( not ( = ?auto_296819 ?auto_296825 ) ) ( not ( = ?auto_296820 ?auto_296821 ) ) ( not ( = ?auto_296820 ?auto_296822 ) ) ( not ( = ?auto_296820 ?auto_296823 ) ) ( not ( = ?auto_296820 ?auto_296824 ) ) ( not ( = ?auto_296820 ?auto_296825 ) ) ( not ( = ?auto_296821 ?auto_296822 ) ) ( not ( = ?auto_296821 ?auto_296823 ) ) ( not ( = ?auto_296821 ?auto_296824 ) ) ( not ( = ?auto_296821 ?auto_296825 ) ) ( not ( = ?auto_296822 ?auto_296823 ) ) ( not ( = ?auto_296822 ?auto_296824 ) ) ( not ( = ?auto_296822 ?auto_296825 ) ) ( not ( = ?auto_296823 ?auto_296824 ) ) ( not ( = ?auto_296823 ?auto_296825 ) ) ( not ( = ?auto_296824 ?auto_296825 ) ) ( ON ?auto_296823 ?auto_296824 ) ( CLEAR ?auto_296821 ) ( ON ?auto_296822 ?auto_296823 ) ( CLEAR ?auto_296822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_296818 ?auto_296819 ?auto_296820 ?auto_296821 ?auto_296822 )
      ( MAKE-7PILE ?auto_296818 ?auto_296819 ?auto_296820 ?auto_296821 ?auto_296822 ?auto_296823 ?auto_296824 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_296833 - BLOCK
      ?auto_296834 - BLOCK
      ?auto_296835 - BLOCK
      ?auto_296836 - BLOCK
      ?auto_296837 - BLOCK
      ?auto_296838 - BLOCK
      ?auto_296839 - BLOCK
    )
    :vars
    (
      ?auto_296840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296839 ?auto_296840 ) ( ON-TABLE ?auto_296833 ) ( ON ?auto_296834 ?auto_296833 ) ( ON ?auto_296835 ?auto_296834 ) ( ON ?auto_296836 ?auto_296835 ) ( not ( = ?auto_296833 ?auto_296834 ) ) ( not ( = ?auto_296833 ?auto_296835 ) ) ( not ( = ?auto_296833 ?auto_296836 ) ) ( not ( = ?auto_296833 ?auto_296837 ) ) ( not ( = ?auto_296833 ?auto_296838 ) ) ( not ( = ?auto_296833 ?auto_296839 ) ) ( not ( = ?auto_296833 ?auto_296840 ) ) ( not ( = ?auto_296834 ?auto_296835 ) ) ( not ( = ?auto_296834 ?auto_296836 ) ) ( not ( = ?auto_296834 ?auto_296837 ) ) ( not ( = ?auto_296834 ?auto_296838 ) ) ( not ( = ?auto_296834 ?auto_296839 ) ) ( not ( = ?auto_296834 ?auto_296840 ) ) ( not ( = ?auto_296835 ?auto_296836 ) ) ( not ( = ?auto_296835 ?auto_296837 ) ) ( not ( = ?auto_296835 ?auto_296838 ) ) ( not ( = ?auto_296835 ?auto_296839 ) ) ( not ( = ?auto_296835 ?auto_296840 ) ) ( not ( = ?auto_296836 ?auto_296837 ) ) ( not ( = ?auto_296836 ?auto_296838 ) ) ( not ( = ?auto_296836 ?auto_296839 ) ) ( not ( = ?auto_296836 ?auto_296840 ) ) ( not ( = ?auto_296837 ?auto_296838 ) ) ( not ( = ?auto_296837 ?auto_296839 ) ) ( not ( = ?auto_296837 ?auto_296840 ) ) ( not ( = ?auto_296838 ?auto_296839 ) ) ( not ( = ?auto_296838 ?auto_296840 ) ) ( not ( = ?auto_296839 ?auto_296840 ) ) ( ON ?auto_296838 ?auto_296839 ) ( CLEAR ?auto_296836 ) ( ON ?auto_296837 ?auto_296838 ) ( CLEAR ?auto_296837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_296833 ?auto_296834 ?auto_296835 ?auto_296836 ?auto_296837 )
      ( MAKE-7PILE ?auto_296833 ?auto_296834 ?auto_296835 ?auto_296836 ?auto_296837 ?auto_296838 ?auto_296839 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_296848 - BLOCK
      ?auto_296849 - BLOCK
      ?auto_296850 - BLOCK
      ?auto_296851 - BLOCK
      ?auto_296852 - BLOCK
      ?auto_296853 - BLOCK
      ?auto_296854 - BLOCK
    )
    :vars
    (
      ?auto_296855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296854 ?auto_296855 ) ( ON-TABLE ?auto_296848 ) ( ON ?auto_296849 ?auto_296848 ) ( ON ?auto_296850 ?auto_296849 ) ( not ( = ?auto_296848 ?auto_296849 ) ) ( not ( = ?auto_296848 ?auto_296850 ) ) ( not ( = ?auto_296848 ?auto_296851 ) ) ( not ( = ?auto_296848 ?auto_296852 ) ) ( not ( = ?auto_296848 ?auto_296853 ) ) ( not ( = ?auto_296848 ?auto_296854 ) ) ( not ( = ?auto_296848 ?auto_296855 ) ) ( not ( = ?auto_296849 ?auto_296850 ) ) ( not ( = ?auto_296849 ?auto_296851 ) ) ( not ( = ?auto_296849 ?auto_296852 ) ) ( not ( = ?auto_296849 ?auto_296853 ) ) ( not ( = ?auto_296849 ?auto_296854 ) ) ( not ( = ?auto_296849 ?auto_296855 ) ) ( not ( = ?auto_296850 ?auto_296851 ) ) ( not ( = ?auto_296850 ?auto_296852 ) ) ( not ( = ?auto_296850 ?auto_296853 ) ) ( not ( = ?auto_296850 ?auto_296854 ) ) ( not ( = ?auto_296850 ?auto_296855 ) ) ( not ( = ?auto_296851 ?auto_296852 ) ) ( not ( = ?auto_296851 ?auto_296853 ) ) ( not ( = ?auto_296851 ?auto_296854 ) ) ( not ( = ?auto_296851 ?auto_296855 ) ) ( not ( = ?auto_296852 ?auto_296853 ) ) ( not ( = ?auto_296852 ?auto_296854 ) ) ( not ( = ?auto_296852 ?auto_296855 ) ) ( not ( = ?auto_296853 ?auto_296854 ) ) ( not ( = ?auto_296853 ?auto_296855 ) ) ( not ( = ?auto_296854 ?auto_296855 ) ) ( ON ?auto_296853 ?auto_296854 ) ( ON ?auto_296852 ?auto_296853 ) ( CLEAR ?auto_296850 ) ( ON ?auto_296851 ?auto_296852 ) ( CLEAR ?auto_296851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_296848 ?auto_296849 ?auto_296850 ?auto_296851 )
      ( MAKE-7PILE ?auto_296848 ?auto_296849 ?auto_296850 ?auto_296851 ?auto_296852 ?auto_296853 ?auto_296854 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_296863 - BLOCK
      ?auto_296864 - BLOCK
      ?auto_296865 - BLOCK
      ?auto_296866 - BLOCK
      ?auto_296867 - BLOCK
      ?auto_296868 - BLOCK
      ?auto_296869 - BLOCK
    )
    :vars
    (
      ?auto_296870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296869 ?auto_296870 ) ( ON-TABLE ?auto_296863 ) ( ON ?auto_296864 ?auto_296863 ) ( ON ?auto_296865 ?auto_296864 ) ( not ( = ?auto_296863 ?auto_296864 ) ) ( not ( = ?auto_296863 ?auto_296865 ) ) ( not ( = ?auto_296863 ?auto_296866 ) ) ( not ( = ?auto_296863 ?auto_296867 ) ) ( not ( = ?auto_296863 ?auto_296868 ) ) ( not ( = ?auto_296863 ?auto_296869 ) ) ( not ( = ?auto_296863 ?auto_296870 ) ) ( not ( = ?auto_296864 ?auto_296865 ) ) ( not ( = ?auto_296864 ?auto_296866 ) ) ( not ( = ?auto_296864 ?auto_296867 ) ) ( not ( = ?auto_296864 ?auto_296868 ) ) ( not ( = ?auto_296864 ?auto_296869 ) ) ( not ( = ?auto_296864 ?auto_296870 ) ) ( not ( = ?auto_296865 ?auto_296866 ) ) ( not ( = ?auto_296865 ?auto_296867 ) ) ( not ( = ?auto_296865 ?auto_296868 ) ) ( not ( = ?auto_296865 ?auto_296869 ) ) ( not ( = ?auto_296865 ?auto_296870 ) ) ( not ( = ?auto_296866 ?auto_296867 ) ) ( not ( = ?auto_296866 ?auto_296868 ) ) ( not ( = ?auto_296866 ?auto_296869 ) ) ( not ( = ?auto_296866 ?auto_296870 ) ) ( not ( = ?auto_296867 ?auto_296868 ) ) ( not ( = ?auto_296867 ?auto_296869 ) ) ( not ( = ?auto_296867 ?auto_296870 ) ) ( not ( = ?auto_296868 ?auto_296869 ) ) ( not ( = ?auto_296868 ?auto_296870 ) ) ( not ( = ?auto_296869 ?auto_296870 ) ) ( ON ?auto_296868 ?auto_296869 ) ( ON ?auto_296867 ?auto_296868 ) ( CLEAR ?auto_296865 ) ( ON ?auto_296866 ?auto_296867 ) ( CLEAR ?auto_296866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_296863 ?auto_296864 ?auto_296865 ?auto_296866 )
      ( MAKE-7PILE ?auto_296863 ?auto_296864 ?auto_296865 ?auto_296866 ?auto_296867 ?auto_296868 ?auto_296869 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_296878 - BLOCK
      ?auto_296879 - BLOCK
      ?auto_296880 - BLOCK
      ?auto_296881 - BLOCK
      ?auto_296882 - BLOCK
      ?auto_296883 - BLOCK
      ?auto_296884 - BLOCK
    )
    :vars
    (
      ?auto_296885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296884 ?auto_296885 ) ( ON-TABLE ?auto_296878 ) ( ON ?auto_296879 ?auto_296878 ) ( not ( = ?auto_296878 ?auto_296879 ) ) ( not ( = ?auto_296878 ?auto_296880 ) ) ( not ( = ?auto_296878 ?auto_296881 ) ) ( not ( = ?auto_296878 ?auto_296882 ) ) ( not ( = ?auto_296878 ?auto_296883 ) ) ( not ( = ?auto_296878 ?auto_296884 ) ) ( not ( = ?auto_296878 ?auto_296885 ) ) ( not ( = ?auto_296879 ?auto_296880 ) ) ( not ( = ?auto_296879 ?auto_296881 ) ) ( not ( = ?auto_296879 ?auto_296882 ) ) ( not ( = ?auto_296879 ?auto_296883 ) ) ( not ( = ?auto_296879 ?auto_296884 ) ) ( not ( = ?auto_296879 ?auto_296885 ) ) ( not ( = ?auto_296880 ?auto_296881 ) ) ( not ( = ?auto_296880 ?auto_296882 ) ) ( not ( = ?auto_296880 ?auto_296883 ) ) ( not ( = ?auto_296880 ?auto_296884 ) ) ( not ( = ?auto_296880 ?auto_296885 ) ) ( not ( = ?auto_296881 ?auto_296882 ) ) ( not ( = ?auto_296881 ?auto_296883 ) ) ( not ( = ?auto_296881 ?auto_296884 ) ) ( not ( = ?auto_296881 ?auto_296885 ) ) ( not ( = ?auto_296882 ?auto_296883 ) ) ( not ( = ?auto_296882 ?auto_296884 ) ) ( not ( = ?auto_296882 ?auto_296885 ) ) ( not ( = ?auto_296883 ?auto_296884 ) ) ( not ( = ?auto_296883 ?auto_296885 ) ) ( not ( = ?auto_296884 ?auto_296885 ) ) ( ON ?auto_296883 ?auto_296884 ) ( ON ?auto_296882 ?auto_296883 ) ( ON ?auto_296881 ?auto_296882 ) ( CLEAR ?auto_296879 ) ( ON ?auto_296880 ?auto_296881 ) ( CLEAR ?auto_296880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_296878 ?auto_296879 ?auto_296880 )
      ( MAKE-7PILE ?auto_296878 ?auto_296879 ?auto_296880 ?auto_296881 ?auto_296882 ?auto_296883 ?auto_296884 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_296893 - BLOCK
      ?auto_296894 - BLOCK
      ?auto_296895 - BLOCK
      ?auto_296896 - BLOCK
      ?auto_296897 - BLOCK
      ?auto_296898 - BLOCK
      ?auto_296899 - BLOCK
    )
    :vars
    (
      ?auto_296900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296899 ?auto_296900 ) ( ON-TABLE ?auto_296893 ) ( ON ?auto_296894 ?auto_296893 ) ( not ( = ?auto_296893 ?auto_296894 ) ) ( not ( = ?auto_296893 ?auto_296895 ) ) ( not ( = ?auto_296893 ?auto_296896 ) ) ( not ( = ?auto_296893 ?auto_296897 ) ) ( not ( = ?auto_296893 ?auto_296898 ) ) ( not ( = ?auto_296893 ?auto_296899 ) ) ( not ( = ?auto_296893 ?auto_296900 ) ) ( not ( = ?auto_296894 ?auto_296895 ) ) ( not ( = ?auto_296894 ?auto_296896 ) ) ( not ( = ?auto_296894 ?auto_296897 ) ) ( not ( = ?auto_296894 ?auto_296898 ) ) ( not ( = ?auto_296894 ?auto_296899 ) ) ( not ( = ?auto_296894 ?auto_296900 ) ) ( not ( = ?auto_296895 ?auto_296896 ) ) ( not ( = ?auto_296895 ?auto_296897 ) ) ( not ( = ?auto_296895 ?auto_296898 ) ) ( not ( = ?auto_296895 ?auto_296899 ) ) ( not ( = ?auto_296895 ?auto_296900 ) ) ( not ( = ?auto_296896 ?auto_296897 ) ) ( not ( = ?auto_296896 ?auto_296898 ) ) ( not ( = ?auto_296896 ?auto_296899 ) ) ( not ( = ?auto_296896 ?auto_296900 ) ) ( not ( = ?auto_296897 ?auto_296898 ) ) ( not ( = ?auto_296897 ?auto_296899 ) ) ( not ( = ?auto_296897 ?auto_296900 ) ) ( not ( = ?auto_296898 ?auto_296899 ) ) ( not ( = ?auto_296898 ?auto_296900 ) ) ( not ( = ?auto_296899 ?auto_296900 ) ) ( ON ?auto_296898 ?auto_296899 ) ( ON ?auto_296897 ?auto_296898 ) ( ON ?auto_296896 ?auto_296897 ) ( CLEAR ?auto_296894 ) ( ON ?auto_296895 ?auto_296896 ) ( CLEAR ?auto_296895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_296893 ?auto_296894 ?auto_296895 )
      ( MAKE-7PILE ?auto_296893 ?auto_296894 ?auto_296895 ?auto_296896 ?auto_296897 ?auto_296898 ?auto_296899 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_296908 - BLOCK
      ?auto_296909 - BLOCK
      ?auto_296910 - BLOCK
      ?auto_296911 - BLOCK
      ?auto_296912 - BLOCK
      ?auto_296913 - BLOCK
      ?auto_296914 - BLOCK
    )
    :vars
    (
      ?auto_296915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296914 ?auto_296915 ) ( ON-TABLE ?auto_296908 ) ( not ( = ?auto_296908 ?auto_296909 ) ) ( not ( = ?auto_296908 ?auto_296910 ) ) ( not ( = ?auto_296908 ?auto_296911 ) ) ( not ( = ?auto_296908 ?auto_296912 ) ) ( not ( = ?auto_296908 ?auto_296913 ) ) ( not ( = ?auto_296908 ?auto_296914 ) ) ( not ( = ?auto_296908 ?auto_296915 ) ) ( not ( = ?auto_296909 ?auto_296910 ) ) ( not ( = ?auto_296909 ?auto_296911 ) ) ( not ( = ?auto_296909 ?auto_296912 ) ) ( not ( = ?auto_296909 ?auto_296913 ) ) ( not ( = ?auto_296909 ?auto_296914 ) ) ( not ( = ?auto_296909 ?auto_296915 ) ) ( not ( = ?auto_296910 ?auto_296911 ) ) ( not ( = ?auto_296910 ?auto_296912 ) ) ( not ( = ?auto_296910 ?auto_296913 ) ) ( not ( = ?auto_296910 ?auto_296914 ) ) ( not ( = ?auto_296910 ?auto_296915 ) ) ( not ( = ?auto_296911 ?auto_296912 ) ) ( not ( = ?auto_296911 ?auto_296913 ) ) ( not ( = ?auto_296911 ?auto_296914 ) ) ( not ( = ?auto_296911 ?auto_296915 ) ) ( not ( = ?auto_296912 ?auto_296913 ) ) ( not ( = ?auto_296912 ?auto_296914 ) ) ( not ( = ?auto_296912 ?auto_296915 ) ) ( not ( = ?auto_296913 ?auto_296914 ) ) ( not ( = ?auto_296913 ?auto_296915 ) ) ( not ( = ?auto_296914 ?auto_296915 ) ) ( ON ?auto_296913 ?auto_296914 ) ( ON ?auto_296912 ?auto_296913 ) ( ON ?auto_296911 ?auto_296912 ) ( ON ?auto_296910 ?auto_296911 ) ( CLEAR ?auto_296908 ) ( ON ?auto_296909 ?auto_296910 ) ( CLEAR ?auto_296909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_296908 ?auto_296909 )
      ( MAKE-7PILE ?auto_296908 ?auto_296909 ?auto_296910 ?auto_296911 ?auto_296912 ?auto_296913 ?auto_296914 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_296923 - BLOCK
      ?auto_296924 - BLOCK
      ?auto_296925 - BLOCK
      ?auto_296926 - BLOCK
      ?auto_296927 - BLOCK
      ?auto_296928 - BLOCK
      ?auto_296929 - BLOCK
    )
    :vars
    (
      ?auto_296930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296929 ?auto_296930 ) ( ON-TABLE ?auto_296923 ) ( not ( = ?auto_296923 ?auto_296924 ) ) ( not ( = ?auto_296923 ?auto_296925 ) ) ( not ( = ?auto_296923 ?auto_296926 ) ) ( not ( = ?auto_296923 ?auto_296927 ) ) ( not ( = ?auto_296923 ?auto_296928 ) ) ( not ( = ?auto_296923 ?auto_296929 ) ) ( not ( = ?auto_296923 ?auto_296930 ) ) ( not ( = ?auto_296924 ?auto_296925 ) ) ( not ( = ?auto_296924 ?auto_296926 ) ) ( not ( = ?auto_296924 ?auto_296927 ) ) ( not ( = ?auto_296924 ?auto_296928 ) ) ( not ( = ?auto_296924 ?auto_296929 ) ) ( not ( = ?auto_296924 ?auto_296930 ) ) ( not ( = ?auto_296925 ?auto_296926 ) ) ( not ( = ?auto_296925 ?auto_296927 ) ) ( not ( = ?auto_296925 ?auto_296928 ) ) ( not ( = ?auto_296925 ?auto_296929 ) ) ( not ( = ?auto_296925 ?auto_296930 ) ) ( not ( = ?auto_296926 ?auto_296927 ) ) ( not ( = ?auto_296926 ?auto_296928 ) ) ( not ( = ?auto_296926 ?auto_296929 ) ) ( not ( = ?auto_296926 ?auto_296930 ) ) ( not ( = ?auto_296927 ?auto_296928 ) ) ( not ( = ?auto_296927 ?auto_296929 ) ) ( not ( = ?auto_296927 ?auto_296930 ) ) ( not ( = ?auto_296928 ?auto_296929 ) ) ( not ( = ?auto_296928 ?auto_296930 ) ) ( not ( = ?auto_296929 ?auto_296930 ) ) ( ON ?auto_296928 ?auto_296929 ) ( ON ?auto_296927 ?auto_296928 ) ( ON ?auto_296926 ?auto_296927 ) ( ON ?auto_296925 ?auto_296926 ) ( CLEAR ?auto_296923 ) ( ON ?auto_296924 ?auto_296925 ) ( CLEAR ?auto_296924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_296923 ?auto_296924 )
      ( MAKE-7PILE ?auto_296923 ?auto_296924 ?auto_296925 ?auto_296926 ?auto_296927 ?auto_296928 ?auto_296929 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_296938 - BLOCK
      ?auto_296939 - BLOCK
      ?auto_296940 - BLOCK
      ?auto_296941 - BLOCK
      ?auto_296942 - BLOCK
      ?auto_296943 - BLOCK
      ?auto_296944 - BLOCK
    )
    :vars
    (
      ?auto_296945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296944 ?auto_296945 ) ( not ( = ?auto_296938 ?auto_296939 ) ) ( not ( = ?auto_296938 ?auto_296940 ) ) ( not ( = ?auto_296938 ?auto_296941 ) ) ( not ( = ?auto_296938 ?auto_296942 ) ) ( not ( = ?auto_296938 ?auto_296943 ) ) ( not ( = ?auto_296938 ?auto_296944 ) ) ( not ( = ?auto_296938 ?auto_296945 ) ) ( not ( = ?auto_296939 ?auto_296940 ) ) ( not ( = ?auto_296939 ?auto_296941 ) ) ( not ( = ?auto_296939 ?auto_296942 ) ) ( not ( = ?auto_296939 ?auto_296943 ) ) ( not ( = ?auto_296939 ?auto_296944 ) ) ( not ( = ?auto_296939 ?auto_296945 ) ) ( not ( = ?auto_296940 ?auto_296941 ) ) ( not ( = ?auto_296940 ?auto_296942 ) ) ( not ( = ?auto_296940 ?auto_296943 ) ) ( not ( = ?auto_296940 ?auto_296944 ) ) ( not ( = ?auto_296940 ?auto_296945 ) ) ( not ( = ?auto_296941 ?auto_296942 ) ) ( not ( = ?auto_296941 ?auto_296943 ) ) ( not ( = ?auto_296941 ?auto_296944 ) ) ( not ( = ?auto_296941 ?auto_296945 ) ) ( not ( = ?auto_296942 ?auto_296943 ) ) ( not ( = ?auto_296942 ?auto_296944 ) ) ( not ( = ?auto_296942 ?auto_296945 ) ) ( not ( = ?auto_296943 ?auto_296944 ) ) ( not ( = ?auto_296943 ?auto_296945 ) ) ( not ( = ?auto_296944 ?auto_296945 ) ) ( ON ?auto_296943 ?auto_296944 ) ( ON ?auto_296942 ?auto_296943 ) ( ON ?auto_296941 ?auto_296942 ) ( ON ?auto_296940 ?auto_296941 ) ( ON ?auto_296939 ?auto_296940 ) ( ON ?auto_296938 ?auto_296939 ) ( CLEAR ?auto_296938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_296938 )
      ( MAKE-7PILE ?auto_296938 ?auto_296939 ?auto_296940 ?auto_296941 ?auto_296942 ?auto_296943 ?auto_296944 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_296953 - BLOCK
      ?auto_296954 - BLOCK
      ?auto_296955 - BLOCK
      ?auto_296956 - BLOCK
      ?auto_296957 - BLOCK
      ?auto_296958 - BLOCK
      ?auto_296959 - BLOCK
    )
    :vars
    (
      ?auto_296960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296959 ?auto_296960 ) ( not ( = ?auto_296953 ?auto_296954 ) ) ( not ( = ?auto_296953 ?auto_296955 ) ) ( not ( = ?auto_296953 ?auto_296956 ) ) ( not ( = ?auto_296953 ?auto_296957 ) ) ( not ( = ?auto_296953 ?auto_296958 ) ) ( not ( = ?auto_296953 ?auto_296959 ) ) ( not ( = ?auto_296953 ?auto_296960 ) ) ( not ( = ?auto_296954 ?auto_296955 ) ) ( not ( = ?auto_296954 ?auto_296956 ) ) ( not ( = ?auto_296954 ?auto_296957 ) ) ( not ( = ?auto_296954 ?auto_296958 ) ) ( not ( = ?auto_296954 ?auto_296959 ) ) ( not ( = ?auto_296954 ?auto_296960 ) ) ( not ( = ?auto_296955 ?auto_296956 ) ) ( not ( = ?auto_296955 ?auto_296957 ) ) ( not ( = ?auto_296955 ?auto_296958 ) ) ( not ( = ?auto_296955 ?auto_296959 ) ) ( not ( = ?auto_296955 ?auto_296960 ) ) ( not ( = ?auto_296956 ?auto_296957 ) ) ( not ( = ?auto_296956 ?auto_296958 ) ) ( not ( = ?auto_296956 ?auto_296959 ) ) ( not ( = ?auto_296956 ?auto_296960 ) ) ( not ( = ?auto_296957 ?auto_296958 ) ) ( not ( = ?auto_296957 ?auto_296959 ) ) ( not ( = ?auto_296957 ?auto_296960 ) ) ( not ( = ?auto_296958 ?auto_296959 ) ) ( not ( = ?auto_296958 ?auto_296960 ) ) ( not ( = ?auto_296959 ?auto_296960 ) ) ( ON ?auto_296958 ?auto_296959 ) ( ON ?auto_296957 ?auto_296958 ) ( ON ?auto_296956 ?auto_296957 ) ( ON ?auto_296955 ?auto_296956 ) ( ON ?auto_296954 ?auto_296955 ) ( ON ?auto_296953 ?auto_296954 ) ( CLEAR ?auto_296953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_296953 )
      ( MAKE-7PILE ?auto_296953 ?auto_296954 ?auto_296955 ?auto_296956 ?auto_296957 ?auto_296958 ?auto_296959 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_296969 - BLOCK
      ?auto_296970 - BLOCK
      ?auto_296971 - BLOCK
      ?auto_296972 - BLOCK
      ?auto_296973 - BLOCK
      ?auto_296974 - BLOCK
      ?auto_296975 - BLOCK
      ?auto_296976 - BLOCK
    )
    :vars
    (
      ?auto_296977 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_296975 ) ( ON ?auto_296976 ?auto_296977 ) ( CLEAR ?auto_296976 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_296969 ) ( ON ?auto_296970 ?auto_296969 ) ( ON ?auto_296971 ?auto_296970 ) ( ON ?auto_296972 ?auto_296971 ) ( ON ?auto_296973 ?auto_296972 ) ( ON ?auto_296974 ?auto_296973 ) ( ON ?auto_296975 ?auto_296974 ) ( not ( = ?auto_296969 ?auto_296970 ) ) ( not ( = ?auto_296969 ?auto_296971 ) ) ( not ( = ?auto_296969 ?auto_296972 ) ) ( not ( = ?auto_296969 ?auto_296973 ) ) ( not ( = ?auto_296969 ?auto_296974 ) ) ( not ( = ?auto_296969 ?auto_296975 ) ) ( not ( = ?auto_296969 ?auto_296976 ) ) ( not ( = ?auto_296969 ?auto_296977 ) ) ( not ( = ?auto_296970 ?auto_296971 ) ) ( not ( = ?auto_296970 ?auto_296972 ) ) ( not ( = ?auto_296970 ?auto_296973 ) ) ( not ( = ?auto_296970 ?auto_296974 ) ) ( not ( = ?auto_296970 ?auto_296975 ) ) ( not ( = ?auto_296970 ?auto_296976 ) ) ( not ( = ?auto_296970 ?auto_296977 ) ) ( not ( = ?auto_296971 ?auto_296972 ) ) ( not ( = ?auto_296971 ?auto_296973 ) ) ( not ( = ?auto_296971 ?auto_296974 ) ) ( not ( = ?auto_296971 ?auto_296975 ) ) ( not ( = ?auto_296971 ?auto_296976 ) ) ( not ( = ?auto_296971 ?auto_296977 ) ) ( not ( = ?auto_296972 ?auto_296973 ) ) ( not ( = ?auto_296972 ?auto_296974 ) ) ( not ( = ?auto_296972 ?auto_296975 ) ) ( not ( = ?auto_296972 ?auto_296976 ) ) ( not ( = ?auto_296972 ?auto_296977 ) ) ( not ( = ?auto_296973 ?auto_296974 ) ) ( not ( = ?auto_296973 ?auto_296975 ) ) ( not ( = ?auto_296973 ?auto_296976 ) ) ( not ( = ?auto_296973 ?auto_296977 ) ) ( not ( = ?auto_296974 ?auto_296975 ) ) ( not ( = ?auto_296974 ?auto_296976 ) ) ( not ( = ?auto_296974 ?auto_296977 ) ) ( not ( = ?auto_296975 ?auto_296976 ) ) ( not ( = ?auto_296975 ?auto_296977 ) ) ( not ( = ?auto_296976 ?auto_296977 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_296976 ?auto_296977 )
      ( !STACK ?auto_296976 ?auto_296975 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_296986 - BLOCK
      ?auto_296987 - BLOCK
      ?auto_296988 - BLOCK
      ?auto_296989 - BLOCK
      ?auto_296990 - BLOCK
      ?auto_296991 - BLOCK
      ?auto_296992 - BLOCK
      ?auto_296993 - BLOCK
    )
    :vars
    (
      ?auto_296994 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_296992 ) ( ON ?auto_296993 ?auto_296994 ) ( CLEAR ?auto_296993 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_296986 ) ( ON ?auto_296987 ?auto_296986 ) ( ON ?auto_296988 ?auto_296987 ) ( ON ?auto_296989 ?auto_296988 ) ( ON ?auto_296990 ?auto_296989 ) ( ON ?auto_296991 ?auto_296990 ) ( ON ?auto_296992 ?auto_296991 ) ( not ( = ?auto_296986 ?auto_296987 ) ) ( not ( = ?auto_296986 ?auto_296988 ) ) ( not ( = ?auto_296986 ?auto_296989 ) ) ( not ( = ?auto_296986 ?auto_296990 ) ) ( not ( = ?auto_296986 ?auto_296991 ) ) ( not ( = ?auto_296986 ?auto_296992 ) ) ( not ( = ?auto_296986 ?auto_296993 ) ) ( not ( = ?auto_296986 ?auto_296994 ) ) ( not ( = ?auto_296987 ?auto_296988 ) ) ( not ( = ?auto_296987 ?auto_296989 ) ) ( not ( = ?auto_296987 ?auto_296990 ) ) ( not ( = ?auto_296987 ?auto_296991 ) ) ( not ( = ?auto_296987 ?auto_296992 ) ) ( not ( = ?auto_296987 ?auto_296993 ) ) ( not ( = ?auto_296987 ?auto_296994 ) ) ( not ( = ?auto_296988 ?auto_296989 ) ) ( not ( = ?auto_296988 ?auto_296990 ) ) ( not ( = ?auto_296988 ?auto_296991 ) ) ( not ( = ?auto_296988 ?auto_296992 ) ) ( not ( = ?auto_296988 ?auto_296993 ) ) ( not ( = ?auto_296988 ?auto_296994 ) ) ( not ( = ?auto_296989 ?auto_296990 ) ) ( not ( = ?auto_296989 ?auto_296991 ) ) ( not ( = ?auto_296989 ?auto_296992 ) ) ( not ( = ?auto_296989 ?auto_296993 ) ) ( not ( = ?auto_296989 ?auto_296994 ) ) ( not ( = ?auto_296990 ?auto_296991 ) ) ( not ( = ?auto_296990 ?auto_296992 ) ) ( not ( = ?auto_296990 ?auto_296993 ) ) ( not ( = ?auto_296990 ?auto_296994 ) ) ( not ( = ?auto_296991 ?auto_296992 ) ) ( not ( = ?auto_296991 ?auto_296993 ) ) ( not ( = ?auto_296991 ?auto_296994 ) ) ( not ( = ?auto_296992 ?auto_296993 ) ) ( not ( = ?auto_296992 ?auto_296994 ) ) ( not ( = ?auto_296993 ?auto_296994 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_296993 ?auto_296994 )
      ( !STACK ?auto_296993 ?auto_296992 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_297003 - BLOCK
      ?auto_297004 - BLOCK
      ?auto_297005 - BLOCK
      ?auto_297006 - BLOCK
      ?auto_297007 - BLOCK
      ?auto_297008 - BLOCK
      ?auto_297009 - BLOCK
      ?auto_297010 - BLOCK
    )
    :vars
    (
      ?auto_297011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297010 ?auto_297011 ) ( ON-TABLE ?auto_297003 ) ( ON ?auto_297004 ?auto_297003 ) ( ON ?auto_297005 ?auto_297004 ) ( ON ?auto_297006 ?auto_297005 ) ( ON ?auto_297007 ?auto_297006 ) ( ON ?auto_297008 ?auto_297007 ) ( not ( = ?auto_297003 ?auto_297004 ) ) ( not ( = ?auto_297003 ?auto_297005 ) ) ( not ( = ?auto_297003 ?auto_297006 ) ) ( not ( = ?auto_297003 ?auto_297007 ) ) ( not ( = ?auto_297003 ?auto_297008 ) ) ( not ( = ?auto_297003 ?auto_297009 ) ) ( not ( = ?auto_297003 ?auto_297010 ) ) ( not ( = ?auto_297003 ?auto_297011 ) ) ( not ( = ?auto_297004 ?auto_297005 ) ) ( not ( = ?auto_297004 ?auto_297006 ) ) ( not ( = ?auto_297004 ?auto_297007 ) ) ( not ( = ?auto_297004 ?auto_297008 ) ) ( not ( = ?auto_297004 ?auto_297009 ) ) ( not ( = ?auto_297004 ?auto_297010 ) ) ( not ( = ?auto_297004 ?auto_297011 ) ) ( not ( = ?auto_297005 ?auto_297006 ) ) ( not ( = ?auto_297005 ?auto_297007 ) ) ( not ( = ?auto_297005 ?auto_297008 ) ) ( not ( = ?auto_297005 ?auto_297009 ) ) ( not ( = ?auto_297005 ?auto_297010 ) ) ( not ( = ?auto_297005 ?auto_297011 ) ) ( not ( = ?auto_297006 ?auto_297007 ) ) ( not ( = ?auto_297006 ?auto_297008 ) ) ( not ( = ?auto_297006 ?auto_297009 ) ) ( not ( = ?auto_297006 ?auto_297010 ) ) ( not ( = ?auto_297006 ?auto_297011 ) ) ( not ( = ?auto_297007 ?auto_297008 ) ) ( not ( = ?auto_297007 ?auto_297009 ) ) ( not ( = ?auto_297007 ?auto_297010 ) ) ( not ( = ?auto_297007 ?auto_297011 ) ) ( not ( = ?auto_297008 ?auto_297009 ) ) ( not ( = ?auto_297008 ?auto_297010 ) ) ( not ( = ?auto_297008 ?auto_297011 ) ) ( not ( = ?auto_297009 ?auto_297010 ) ) ( not ( = ?auto_297009 ?auto_297011 ) ) ( not ( = ?auto_297010 ?auto_297011 ) ) ( CLEAR ?auto_297008 ) ( ON ?auto_297009 ?auto_297010 ) ( CLEAR ?auto_297009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_297003 ?auto_297004 ?auto_297005 ?auto_297006 ?auto_297007 ?auto_297008 ?auto_297009 )
      ( MAKE-8PILE ?auto_297003 ?auto_297004 ?auto_297005 ?auto_297006 ?auto_297007 ?auto_297008 ?auto_297009 ?auto_297010 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_297020 - BLOCK
      ?auto_297021 - BLOCK
      ?auto_297022 - BLOCK
      ?auto_297023 - BLOCK
      ?auto_297024 - BLOCK
      ?auto_297025 - BLOCK
      ?auto_297026 - BLOCK
      ?auto_297027 - BLOCK
    )
    :vars
    (
      ?auto_297028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297027 ?auto_297028 ) ( ON-TABLE ?auto_297020 ) ( ON ?auto_297021 ?auto_297020 ) ( ON ?auto_297022 ?auto_297021 ) ( ON ?auto_297023 ?auto_297022 ) ( ON ?auto_297024 ?auto_297023 ) ( ON ?auto_297025 ?auto_297024 ) ( not ( = ?auto_297020 ?auto_297021 ) ) ( not ( = ?auto_297020 ?auto_297022 ) ) ( not ( = ?auto_297020 ?auto_297023 ) ) ( not ( = ?auto_297020 ?auto_297024 ) ) ( not ( = ?auto_297020 ?auto_297025 ) ) ( not ( = ?auto_297020 ?auto_297026 ) ) ( not ( = ?auto_297020 ?auto_297027 ) ) ( not ( = ?auto_297020 ?auto_297028 ) ) ( not ( = ?auto_297021 ?auto_297022 ) ) ( not ( = ?auto_297021 ?auto_297023 ) ) ( not ( = ?auto_297021 ?auto_297024 ) ) ( not ( = ?auto_297021 ?auto_297025 ) ) ( not ( = ?auto_297021 ?auto_297026 ) ) ( not ( = ?auto_297021 ?auto_297027 ) ) ( not ( = ?auto_297021 ?auto_297028 ) ) ( not ( = ?auto_297022 ?auto_297023 ) ) ( not ( = ?auto_297022 ?auto_297024 ) ) ( not ( = ?auto_297022 ?auto_297025 ) ) ( not ( = ?auto_297022 ?auto_297026 ) ) ( not ( = ?auto_297022 ?auto_297027 ) ) ( not ( = ?auto_297022 ?auto_297028 ) ) ( not ( = ?auto_297023 ?auto_297024 ) ) ( not ( = ?auto_297023 ?auto_297025 ) ) ( not ( = ?auto_297023 ?auto_297026 ) ) ( not ( = ?auto_297023 ?auto_297027 ) ) ( not ( = ?auto_297023 ?auto_297028 ) ) ( not ( = ?auto_297024 ?auto_297025 ) ) ( not ( = ?auto_297024 ?auto_297026 ) ) ( not ( = ?auto_297024 ?auto_297027 ) ) ( not ( = ?auto_297024 ?auto_297028 ) ) ( not ( = ?auto_297025 ?auto_297026 ) ) ( not ( = ?auto_297025 ?auto_297027 ) ) ( not ( = ?auto_297025 ?auto_297028 ) ) ( not ( = ?auto_297026 ?auto_297027 ) ) ( not ( = ?auto_297026 ?auto_297028 ) ) ( not ( = ?auto_297027 ?auto_297028 ) ) ( CLEAR ?auto_297025 ) ( ON ?auto_297026 ?auto_297027 ) ( CLEAR ?auto_297026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_297020 ?auto_297021 ?auto_297022 ?auto_297023 ?auto_297024 ?auto_297025 ?auto_297026 )
      ( MAKE-8PILE ?auto_297020 ?auto_297021 ?auto_297022 ?auto_297023 ?auto_297024 ?auto_297025 ?auto_297026 ?auto_297027 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_297037 - BLOCK
      ?auto_297038 - BLOCK
      ?auto_297039 - BLOCK
      ?auto_297040 - BLOCK
      ?auto_297041 - BLOCK
      ?auto_297042 - BLOCK
      ?auto_297043 - BLOCK
      ?auto_297044 - BLOCK
    )
    :vars
    (
      ?auto_297045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297044 ?auto_297045 ) ( ON-TABLE ?auto_297037 ) ( ON ?auto_297038 ?auto_297037 ) ( ON ?auto_297039 ?auto_297038 ) ( ON ?auto_297040 ?auto_297039 ) ( ON ?auto_297041 ?auto_297040 ) ( not ( = ?auto_297037 ?auto_297038 ) ) ( not ( = ?auto_297037 ?auto_297039 ) ) ( not ( = ?auto_297037 ?auto_297040 ) ) ( not ( = ?auto_297037 ?auto_297041 ) ) ( not ( = ?auto_297037 ?auto_297042 ) ) ( not ( = ?auto_297037 ?auto_297043 ) ) ( not ( = ?auto_297037 ?auto_297044 ) ) ( not ( = ?auto_297037 ?auto_297045 ) ) ( not ( = ?auto_297038 ?auto_297039 ) ) ( not ( = ?auto_297038 ?auto_297040 ) ) ( not ( = ?auto_297038 ?auto_297041 ) ) ( not ( = ?auto_297038 ?auto_297042 ) ) ( not ( = ?auto_297038 ?auto_297043 ) ) ( not ( = ?auto_297038 ?auto_297044 ) ) ( not ( = ?auto_297038 ?auto_297045 ) ) ( not ( = ?auto_297039 ?auto_297040 ) ) ( not ( = ?auto_297039 ?auto_297041 ) ) ( not ( = ?auto_297039 ?auto_297042 ) ) ( not ( = ?auto_297039 ?auto_297043 ) ) ( not ( = ?auto_297039 ?auto_297044 ) ) ( not ( = ?auto_297039 ?auto_297045 ) ) ( not ( = ?auto_297040 ?auto_297041 ) ) ( not ( = ?auto_297040 ?auto_297042 ) ) ( not ( = ?auto_297040 ?auto_297043 ) ) ( not ( = ?auto_297040 ?auto_297044 ) ) ( not ( = ?auto_297040 ?auto_297045 ) ) ( not ( = ?auto_297041 ?auto_297042 ) ) ( not ( = ?auto_297041 ?auto_297043 ) ) ( not ( = ?auto_297041 ?auto_297044 ) ) ( not ( = ?auto_297041 ?auto_297045 ) ) ( not ( = ?auto_297042 ?auto_297043 ) ) ( not ( = ?auto_297042 ?auto_297044 ) ) ( not ( = ?auto_297042 ?auto_297045 ) ) ( not ( = ?auto_297043 ?auto_297044 ) ) ( not ( = ?auto_297043 ?auto_297045 ) ) ( not ( = ?auto_297044 ?auto_297045 ) ) ( ON ?auto_297043 ?auto_297044 ) ( CLEAR ?auto_297041 ) ( ON ?auto_297042 ?auto_297043 ) ( CLEAR ?auto_297042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_297037 ?auto_297038 ?auto_297039 ?auto_297040 ?auto_297041 ?auto_297042 )
      ( MAKE-8PILE ?auto_297037 ?auto_297038 ?auto_297039 ?auto_297040 ?auto_297041 ?auto_297042 ?auto_297043 ?auto_297044 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_297054 - BLOCK
      ?auto_297055 - BLOCK
      ?auto_297056 - BLOCK
      ?auto_297057 - BLOCK
      ?auto_297058 - BLOCK
      ?auto_297059 - BLOCK
      ?auto_297060 - BLOCK
      ?auto_297061 - BLOCK
    )
    :vars
    (
      ?auto_297062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297061 ?auto_297062 ) ( ON-TABLE ?auto_297054 ) ( ON ?auto_297055 ?auto_297054 ) ( ON ?auto_297056 ?auto_297055 ) ( ON ?auto_297057 ?auto_297056 ) ( ON ?auto_297058 ?auto_297057 ) ( not ( = ?auto_297054 ?auto_297055 ) ) ( not ( = ?auto_297054 ?auto_297056 ) ) ( not ( = ?auto_297054 ?auto_297057 ) ) ( not ( = ?auto_297054 ?auto_297058 ) ) ( not ( = ?auto_297054 ?auto_297059 ) ) ( not ( = ?auto_297054 ?auto_297060 ) ) ( not ( = ?auto_297054 ?auto_297061 ) ) ( not ( = ?auto_297054 ?auto_297062 ) ) ( not ( = ?auto_297055 ?auto_297056 ) ) ( not ( = ?auto_297055 ?auto_297057 ) ) ( not ( = ?auto_297055 ?auto_297058 ) ) ( not ( = ?auto_297055 ?auto_297059 ) ) ( not ( = ?auto_297055 ?auto_297060 ) ) ( not ( = ?auto_297055 ?auto_297061 ) ) ( not ( = ?auto_297055 ?auto_297062 ) ) ( not ( = ?auto_297056 ?auto_297057 ) ) ( not ( = ?auto_297056 ?auto_297058 ) ) ( not ( = ?auto_297056 ?auto_297059 ) ) ( not ( = ?auto_297056 ?auto_297060 ) ) ( not ( = ?auto_297056 ?auto_297061 ) ) ( not ( = ?auto_297056 ?auto_297062 ) ) ( not ( = ?auto_297057 ?auto_297058 ) ) ( not ( = ?auto_297057 ?auto_297059 ) ) ( not ( = ?auto_297057 ?auto_297060 ) ) ( not ( = ?auto_297057 ?auto_297061 ) ) ( not ( = ?auto_297057 ?auto_297062 ) ) ( not ( = ?auto_297058 ?auto_297059 ) ) ( not ( = ?auto_297058 ?auto_297060 ) ) ( not ( = ?auto_297058 ?auto_297061 ) ) ( not ( = ?auto_297058 ?auto_297062 ) ) ( not ( = ?auto_297059 ?auto_297060 ) ) ( not ( = ?auto_297059 ?auto_297061 ) ) ( not ( = ?auto_297059 ?auto_297062 ) ) ( not ( = ?auto_297060 ?auto_297061 ) ) ( not ( = ?auto_297060 ?auto_297062 ) ) ( not ( = ?auto_297061 ?auto_297062 ) ) ( ON ?auto_297060 ?auto_297061 ) ( CLEAR ?auto_297058 ) ( ON ?auto_297059 ?auto_297060 ) ( CLEAR ?auto_297059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_297054 ?auto_297055 ?auto_297056 ?auto_297057 ?auto_297058 ?auto_297059 )
      ( MAKE-8PILE ?auto_297054 ?auto_297055 ?auto_297056 ?auto_297057 ?auto_297058 ?auto_297059 ?auto_297060 ?auto_297061 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_297071 - BLOCK
      ?auto_297072 - BLOCK
      ?auto_297073 - BLOCK
      ?auto_297074 - BLOCK
      ?auto_297075 - BLOCK
      ?auto_297076 - BLOCK
      ?auto_297077 - BLOCK
      ?auto_297078 - BLOCK
    )
    :vars
    (
      ?auto_297079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297078 ?auto_297079 ) ( ON-TABLE ?auto_297071 ) ( ON ?auto_297072 ?auto_297071 ) ( ON ?auto_297073 ?auto_297072 ) ( ON ?auto_297074 ?auto_297073 ) ( not ( = ?auto_297071 ?auto_297072 ) ) ( not ( = ?auto_297071 ?auto_297073 ) ) ( not ( = ?auto_297071 ?auto_297074 ) ) ( not ( = ?auto_297071 ?auto_297075 ) ) ( not ( = ?auto_297071 ?auto_297076 ) ) ( not ( = ?auto_297071 ?auto_297077 ) ) ( not ( = ?auto_297071 ?auto_297078 ) ) ( not ( = ?auto_297071 ?auto_297079 ) ) ( not ( = ?auto_297072 ?auto_297073 ) ) ( not ( = ?auto_297072 ?auto_297074 ) ) ( not ( = ?auto_297072 ?auto_297075 ) ) ( not ( = ?auto_297072 ?auto_297076 ) ) ( not ( = ?auto_297072 ?auto_297077 ) ) ( not ( = ?auto_297072 ?auto_297078 ) ) ( not ( = ?auto_297072 ?auto_297079 ) ) ( not ( = ?auto_297073 ?auto_297074 ) ) ( not ( = ?auto_297073 ?auto_297075 ) ) ( not ( = ?auto_297073 ?auto_297076 ) ) ( not ( = ?auto_297073 ?auto_297077 ) ) ( not ( = ?auto_297073 ?auto_297078 ) ) ( not ( = ?auto_297073 ?auto_297079 ) ) ( not ( = ?auto_297074 ?auto_297075 ) ) ( not ( = ?auto_297074 ?auto_297076 ) ) ( not ( = ?auto_297074 ?auto_297077 ) ) ( not ( = ?auto_297074 ?auto_297078 ) ) ( not ( = ?auto_297074 ?auto_297079 ) ) ( not ( = ?auto_297075 ?auto_297076 ) ) ( not ( = ?auto_297075 ?auto_297077 ) ) ( not ( = ?auto_297075 ?auto_297078 ) ) ( not ( = ?auto_297075 ?auto_297079 ) ) ( not ( = ?auto_297076 ?auto_297077 ) ) ( not ( = ?auto_297076 ?auto_297078 ) ) ( not ( = ?auto_297076 ?auto_297079 ) ) ( not ( = ?auto_297077 ?auto_297078 ) ) ( not ( = ?auto_297077 ?auto_297079 ) ) ( not ( = ?auto_297078 ?auto_297079 ) ) ( ON ?auto_297077 ?auto_297078 ) ( ON ?auto_297076 ?auto_297077 ) ( CLEAR ?auto_297074 ) ( ON ?auto_297075 ?auto_297076 ) ( CLEAR ?auto_297075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_297071 ?auto_297072 ?auto_297073 ?auto_297074 ?auto_297075 )
      ( MAKE-8PILE ?auto_297071 ?auto_297072 ?auto_297073 ?auto_297074 ?auto_297075 ?auto_297076 ?auto_297077 ?auto_297078 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_297088 - BLOCK
      ?auto_297089 - BLOCK
      ?auto_297090 - BLOCK
      ?auto_297091 - BLOCK
      ?auto_297092 - BLOCK
      ?auto_297093 - BLOCK
      ?auto_297094 - BLOCK
      ?auto_297095 - BLOCK
    )
    :vars
    (
      ?auto_297096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297095 ?auto_297096 ) ( ON-TABLE ?auto_297088 ) ( ON ?auto_297089 ?auto_297088 ) ( ON ?auto_297090 ?auto_297089 ) ( ON ?auto_297091 ?auto_297090 ) ( not ( = ?auto_297088 ?auto_297089 ) ) ( not ( = ?auto_297088 ?auto_297090 ) ) ( not ( = ?auto_297088 ?auto_297091 ) ) ( not ( = ?auto_297088 ?auto_297092 ) ) ( not ( = ?auto_297088 ?auto_297093 ) ) ( not ( = ?auto_297088 ?auto_297094 ) ) ( not ( = ?auto_297088 ?auto_297095 ) ) ( not ( = ?auto_297088 ?auto_297096 ) ) ( not ( = ?auto_297089 ?auto_297090 ) ) ( not ( = ?auto_297089 ?auto_297091 ) ) ( not ( = ?auto_297089 ?auto_297092 ) ) ( not ( = ?auto_297089 ?auto_297093 ) ) ( not ( = ?auto_297089 ?auto_297094 ) ) ( not ( = ?auto_297089 ?auto_297095 ) ) ( not ( = ?auto_297089 ?auto_297096 ) ) ( not ( = ?auto_297090 ?auto_297091 ) ) ( not ( = ?auto_297090 ?auto_297092 ) ) ( not ( = ?auto_297090 ?auto_297093 ) ) ( not ( = ?auto_297090 ?auto_297094 ) ) ( not ( = ?auto_297090 ?auto_297095 ) ) ( not ( = ?auto_297090 ?auto_297096 ) ) ( not ( = ?auto_297091 ?auto_297092 ) ) ( not ( = ?auto_297091 ?auto_297093 ) ) ( not ( = ?auto_297091 ?auto_297094 ) ) ( not ( = ?auto_297091 ?auto_297095 ) ) ( not ( = ?auto_297091 ?auto_297096 ) ) ( not ( = ?auto_297092 ?auto_297093 ) ) ( not ( = ?auto_297092 ?auto_297094 ) ) ( not ( = ?auto_297092 ?auto_297095 ) ) ( not ( = ?auto_297092 ?auto_297096 ) ) ( not ( = ?auto_297093 ?auto_297094 ) ) ( not ( = ?auto_297093 ?auto_297095 ) ) ( not ( = ?auto_297093 ?auto_297096 ) ) ( not ( = ?auto_297094 ?auto_297095 ) ) ( not ( = ?auto_297094 ?auto_297096 ) ) ( not ( = ?auto_297095 ?auto_297096 ) ) ( ON ?auto_297094 ?auto_297095 ) ( ON ?auto_297093 ?auto_297094 ) ( CLEAR ?auto_297091 ) ( ON ?auto_297092 ?auto_297093 ) ( CLEAR ?auto_297092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_297088 ?auto_297089 ?auto_297090 ?auto_297091 ?auto_297092 )
      ( MAKE-8PILE ?auto_297088 ?auto_297089 ?auto_297090 ?auto_297091 ?auto_297092 ?auto_297093 ?auto_297094 ?auto_297095 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_297105 - BLOCK
      ?auto_297106 - BLOCK
      ?auto_297107 - BLOCK
      ?auto_297108 - BLOCK
      ?auto_297109 - BLOCK
      ?auto_297110 - BLOCK
      ?auto_297111 - BLOCK
      ?auto_297112 - BLOCK
    )
    :vars
    (
      ?auto_297113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297112 ?auto_297113 ) ( ON-TABLE ?auto_297105 ) ( ON ?auto_297106 ?auto_297105 ) ( ON ?auto_297107 ?auto_297106 ) ( not ( = ?auto_297105 ?auto_297106 ) ) ( not ( = ?auto_297105 ?auto_297107 ) ) ( not ( = ?auto_297105 ?auto_297108 ) ) ( not ( = ?auto_297105 ?auto_297109 ) ) ( not ( = ?auto_297105 ?auto_297110 ) ) ( not ( = ?auto_297105 ?auto_297111 ) ) ( not ( = ?auto_297105 ?auto_297112 ) ) ( not ( = ?auto_297105 ?auto_297113 ) ) ( not ( = ?auto_297106 ?auto_297107 ) ) ( not ( = ?auto_297106 ?auto_297108 ) ) ( not ( = ?auto_297106 ?auto_297109 ) ) ( not ( = ?auto_297106 ?auto_297110 ) ) ( not ( = ?auto_297106 ?auto_297111 ) ) ( not ( = ?auto_297106 ?auto_297112 ) ) ( not ( = ?auto_297106 ?auto_297113 ) ) ( not ( = ?auto_297107 ?auto_297108 ) ) ( not ( = ?auto_297107 ?auto_297109 ) ) ( not ( = ?auto_297107 ?auto_297110 ) ) ( not ( = ?auto_297107 ?auto_297111 ) ) ( not ( = ?auto_297107 ?auto_297112 ) ) ( not ( = ?auto_297107 ?auto_297113 ) ) ( not ( = ?auto_297108 ?auto_297109 ) ) ( not ( = ?auto_297108 ?auto_297110 ) ) ( not ( = ?auto_297108 ?auto_297111 ) ) ( not ( = ?auto_297108 ?auto_297112 ) ) ( not ( = ?auto_297108 ?auto_297113 ) ) ( not ( = ?auto_297109 ?auto_297110 ) ) ( not ( = ?auto_297109 ?auto_297111 ) ) ( not ( = ?auto_297109 ?auto_297112 ) ) ( not ( = ?auto_297109 ?auto_297113 ) ) ( not ( = ?auto_297110 ?auto_297111 ) ) ( not ( = ?auto_297110 ?auto_297112 ) ) ( not ( = ?auto_297110 ?auto_297113 ) ) ( not ( = ?auto_297111 ?auto_297112 ) ) ( not ( = ?auto_297111 ?auto_297113 ) ) ( not ( = ?auto_297112 ?auto_297113 ) ) ( ON ?auto_297111 ?auto_297112 ) ( ON ?auto_297110 ?auto_297111 ) ( ON ?auto_297109 ?auto_297110 ) ( CLEAR ?auto_297107 ) ( ON ?auto_297108 ?auto_297109 ) ( CLEAR ?auto_297108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_297105 ?auto_297106 ?auto_297107 ?auto_297108 )
      ( MAKE-8PILE ?auto_297105 ?auto_297106 ?auto_297107 ?auto_297108 ?auto_297109 ?auto_297110 ?auto_297111 ?auto_297112 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_297122 - BLOCK
      ?auto_297123 - BLOCK
      ?auto_297124 - BLOCK
      ?auto_297125 - BLOCK
      ?auto_297126 - BLOCK
      ?auto_297127 - BLOCK
      ?auto_297128 - BLOCK
      ?auto_297129 - BLOCK
    )
    :vars
    (
      ?auto_297130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297129 ?auto_297130 ) ( ON-TABLE ?auto_297122 ) ( ON ?auto_297123 ?auto_297122 ) ( ON ?auto_297124 ?auto_297123 ) ( not ( = ?auto_297122 ?auto_297123 ) ) ( not ( = ?auto_297122 ?auto_297124 ) ) ( not ( = ?auto_297122 ?auto_297125 ) ) ( not ( = ?auto_297122 ?auto_297126 ) ) ( not ( = ?auto_297122 ?auto_297127 ) ) ( not ( = ?auto_297122 ?auto_297128 ) ) ( not ( = ?auto_297122 ?auto_297129 ) ) ( not ( = ?auto_297122 ?auto_297130 ) ) ( not ( = ?auto_297123 ?auto_297124 ) ) ( not ( = ?auto_297123 ?auto_297125 ) ) ( not ( = ?auto_297123 ?auto_297126 ) ) ( not ( = ?auto_297123 ?auto_297127 ) ) ( not ( = ?auto_297123 ?auto_297128 ) ) ( not ( = ?auto_297123 ?auto_297129 ) ) ( not ( = ?auto_297123 ?auto_297130 ) ) ( not ( = ?auto_297124 ?auto_297125 ) ) ( not ( = ?auto_297124 ?auto_297126 ) ) ( not ( = ?auto_297124 ?auto_297127 ) ) ( not ( = ?auto_297124 ?auto_297128 ) ) ( not ( = ?auto_297124 ?auto_297129 ) ) ( not ( = ?auto_297124 ?auto_297130 ) ) ( not ( = ?auto_297125 ?auto_297126 ) ) ( not ( = ?auto_297125 ?auto_297127 ) ) ( not ( = ?auto_297125 ?auto_297128 ) ) ( not ( = ?auto_297125 ?auto_297129 ) ) ( not ( = ?auto_297125 ?auto_297130 ) ) ( not ( = ?auto_297126 ?auto_297127 ) ) ( not ( = ?auto_297126 ?auto_297128 ) ) ( not ( = ?auto_297126 ?auto_297129 ) ) ( not ( = ?auto_297126 ?auto_297130 ) ) ( not ( = ?auto_297127 ?auto_297128 ) ) ( not ( = ?auto_297127 ?auto_297129 ) ) ( not ( = ?auto_297127 ?auto_297130 ) ) ( not ( = ?auto_297128 ?auto_297129 ) ) ( not ( = ?auto_297128 ?auto_297130 ) ) ( not ( = ?auto_297129 ?auto_297130 ) ) ( ON ?auto_297128 ?auto_297129 ) ( ON ?auto_297127 ?auto_297128 ) ( ON ?auto_297126 ?auto_297127 ) ( CLEAR ?auto_297124 ) ( ON ?auto_297125 ?auto_297126 ) ( CLEAR ?auto_297125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_297122 ?auto_297123 ?auto_297124 ?auto_297125 )
      ( MAKE-8PILE ?auto_297122 ?auto_297123 ?auto_297124 ?auto_297125 ?auto_297126 ?auto_297127 ?auto_297128 ?auto_297129 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_297139 - BLOCK
      ?auto_297140 - BLOCK
      ?auto_297141 - BLOCK
      ?auto_297142 - BLOCK
      ?auto_297143 - BLOCK
      ?auto_297144 - BLOCK
      ?auto_297145 - BLOCK
      ?auto_297146 - BLOCK
    )
    :vars
    (
      ?auto_297147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297146 ?auto_297147 ) ( ON-TABLE ?auto_297139 ) ( ON ?auto_297140 ?auto_297139 ) ( not ( = ?auto_297139 ?auto_297140 ) ) ( not ( = ?auto_297139 ?auto_297141 ) ) ( not ( = ?auto_297139 ?auto_297142 ) ) ( not ( = ?auto_297139 ?auto_297143 ) ) ( not ( = ?auto_297139 ?auto_297144 ) ) ( not ( = ?auto_297139 ?auto_297145 ) ) ( not ( = ?auto_297139 ?auto_297146 ) ) ( not ( = ?auto_297139 ?auto_297147 ) ) ( not ( = ?auto_297140 ?auto_297141 ) ) ( not ( = ?auto_297140 ?auto_297142 ) ) ( not ( = ?auto_297140 ?auto_297143 ) ) ( not ( = ?auto_297140 ?auto_297144 ) ) ( not ( = ?auto_297140 ?auto_297145 ) ) ( not ( = ?auto_297140 ?auto_297146 ) ) ( not ( = ?auto_297140 ?auto_297147 ) ) ( not ( = ?auto_297141 ?auto_297142 ) ) ( not ( = ?auto_297141 ?auto_297143 ) ) ( not ( = ?auto_297141 ?auto_297144 ) ) ( not ( = ?auto_297141 ?auto_297145 ) ) ( not ( = ?auto_297141 ?auto_297146 ) ) ( not ( = ?auto_297141 ?auto_297147 ) ) ( not ( = ?auto_297142 ?auto_297143 ) ) ( not ( = ?auto_297142 ?auto_297144 ) ) ( not ( = ?auto_297142 ?auto_297145 ) ) ( not ( = ?auto_297142 ?auto_297146 ) ) ( not ( = ?auto_297142 ?auto_297147 ) ) ( not ( = ?auto_297143 ?auto_297144 ) ) ( not ( = ?auto_297143 ?auto_297145 ) ) ( not ( = ?auto_297143 ?auto_297146 ) ) ( not ( = ?auto_297143 ?auto_297147 ) ) ( not ( = ?auto_297144 ?auto_297145 ) ) ( not ( = ?auto_297144 ?auto_297146 ) ) ( not ( = ?auto_297144 ?auto_297147 ) ) ( not ( = ?auto_297145 ?auto_297146 ) ) ( not ( = ?auto_297145 ?auto_297147 ) ) ( not ( = ?auto_297146 ?auto_297147 ) ) ( ON ?auto_297145 ?auto_297146 ) ( ON ?auto_297144 ?auto_297145 ) ( ON ?auto_297143 ?auto_297144 ) ( ON ?auto_297142 ?auto_297143 ) ( CLEAR ?auto_297140 ) ( ON ?auto_297141 ?auto_297142 ) ( CLEAR ?auto_297141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_297139 ?auto_297140 ?auto_297141 )
      ( MAKE-8PILE ?auto_297139 ?auto_297140 ?auto_297141 ?auto_297142 ?auto_297143 ?auto_297144 ?auto_297145 ?auto_297146 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_297156 - BLOCK
      ?auto_297157 - BLOCK
      ?auto_297158 - BLOCK
      ?auto_297159 - BLOCK
      ?auto_297160 - BLOCK
      ?auto_297161 - BLOCK
      ?auto_297162 - BLOCK
      ?auto_297163 - BLOCK
    )
    :vars
    (
      ?auto_297164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297163 ?auto_297164 ) ( ON-TABLE ?auto_297156 ) ( ON ?auto_297157 ?auto_297156 ) ( not ( = ?auto_297156 ?auto_297157 ) ) ( not ( = ?auto_297156 ?auto_297158 ) ) ( not ( = ?auto_297156 ?auto_297159 ) ) ( not ( = ?auto_297156 ?auto_297160 ) ) ( not ( = ?auto_297156 ?auto_297161 ) ) ( not ( = ?auto_297156 ?auto_297162 ) ) ( not ( = ?auto_297156 ?auto_297163 ) ) ( not ( = ?auto_297156 ?auto_297164 ) ) ( not ( = ?auto_297157 ?auto_297158 ) ) ( not ( = ?auto_297157 ?auto_297159 ) ) ( not ( = ?auto_297157 ?auto_297160 ) ) ( not ( = ?auto_297157 ?auto_297161 ) ) ( not ( = ?auto_297157 ?auto_297162 ) ) ( not ( = ?auto_297157 ?auto_297163 ) ) ( not ( = ?auto_297157 ?auto_297164 ) ) ( not ( = ?auto_297158 ?auto_297159 ) ) ( not ( = ?auto_297158 ?auto_297160 ) ) ( not ( = ?auto_297158 ?auto_297161 ) ) ( not ( = ?auto_297158 ?auto_297162 ) ) ( not ( = ?auto_297158 ?auto_297163 ) ) ( not ( = ?auto_297158 ?auto_297164 ) ) ( not ( = ?auto_297159 ?auto_297160 ) ) ( not ( = ?auto_297159 ?auto_297161 ) ) ( not ( = ?auto_297159 ?auto_297162 ) ) ( not ( = ?auto_297159 ?auto_297163 ) ) ( not ( = ?auto_297159 ?auto_297164 ) ) ( not ( = ?auto_297160 ?auto_297161 ) ) ( not ( = ?auto_297160 ?auto_297162 ) ) ( not ( = ?auto_297160 ?auto_297163 ) ) ( not ( = ?auto_297160 ?auto_297164 ) ) ( not ( = ?auto_297161 ?auto_297162 ) ) ( not ( = ?auto_297161 ?auto_297163 ) ) ( not ( = ?auto_297161 ?auto_297164 ) ) ( not ( = ?auto_297162 ?auto_297163 ) ) ( not ( = ?auto_297162 ?auto_297164 ) ) ( not ( = ?auto_297163 ?auto_297164 ) ) ( ON ?auto_297162 ?auto_297163 ) ( ON ?auto_297161 ?auto_297162 ) ( ON ?auto_297160 ?auto_297161 ) ( ON ?auto_297159 ?auto_297160 ) ( CLEAR ?auto_297157 ) ( ON ?auto_297158 ?auto_297159 ) ( CLEAR ?auto_297158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_297156 ?auto_297157 ?auto_297158 )
      ( MAKE-8PILE ?auto_297156 ?auto_297157 ?auto_297158 ?auto_297159 ?auto_297160 ?auto_297161 ?auto_297162 ?auto_297163 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_297173 - BLOCK
      ?auto_297174 - BLOCK
      ?auto_297175 - BLOCK
      ?auto_297176 - BLOCK
      ?auto_297177 - BLOCK
      ?auto_297178 - BLOCK
      ?auto_297179 - BLOCK
      ?auto_297180 - BLOCK
    )
    :vars
    (
      ?auto_297181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297180 ?auto_297181 ) ( ON-TABLE ?auto_297173 ) ( not ( = ?auto_297173 ?auto_297174 ) ) ( not ( = ?auto_297173 ?auto_297175 ) ) ( not ( = ?auto_297173 ?auto_297176 ) ) ( not ( = ?auto_297173 ?auto_297177 ) ) ( not ( = ?auto_297173 ?auto_297178 ) ) ( not ( = ?auto_297173 ?auto_297179 ) ) ( not ( = ?auto_297173 ?auto_297180 ) ) ( not ( = ?auto_297173 ?auto_297181 ) ) ( not ( = ?auto_297174 ?auto_297175 ) ) ( not ( = ?auto_297174 ?auto_297176 ) ) ( not ( = ?auto_297174 ?auto_297177 ) ) ( not ( = ?auto_297174 ?auto_297178 ) ) ( not ( = ?auto_297174 ?auto_297179 ) ) ( not ( = ?auto_297174 ?auto_297180 ) ) ( not ( = ?auto_297174 ?auto_297181 ) ) ( not ( = ?auto_297175 ?auto_297176 ) ) ( not ( = ?auto_297175 ?auto_297177 ) ) ( not ( = ?auto_297175 ?auto_297178 ) ) ( not ( = ?auto_297175 ?auto_297179 ) ) ( not ( = ?auto_297175 ?auto_297180 ) ) ( not ( = ?auto_297175 ?auto_297181 ) ) ( not ( = ?auto_297176 ?auto_297177 ) ) ( not ( = ?auto_297176 ?auto_297178 ) ) ( not ( = ?auto_297176 ?auto_297179 ) ) ( not ( = ?auto_297176 ?auto_297180 ) ) ( not ( = ?auto_297176 ?auto_297181 ) ) ( not ( = ?auto_297177 ?auto_297178 ) ) ( not ( = ?auto_297177 ?auto_297179 ) ) ( not ( = ?auto_297177 ?auto_297180 ) ) ( not ( = ?auto_297177 ?auto_297181 ) ) ( not ( = ?auto_297178 ?auto_297179 ) ) ( not ( = ?auto_297178 ?auto_297180 ) ) ( not ( = ?auto_297178 ?auto_297181 ) ) ( not ( = ?auto_297179 ?auto_297180 ) ) ( not ( = ?auto_297179 ?auto_297181 ) ) ( not ( = ?auto_297180 ?auto_297181 ) ) ( ON ?auto_297179 ?auto_297180 ) ( ON ?auto_297178 ?auto_297179 ) ( ON ?auto_297177 ?auto_297178 ) ( ON ?auto_297176 ?auto_297177 ) ( ON ?auto_297175 ?auto_297176 ) ( CLEAR ?auto_297173 ) ( ON ?auto_297174 ?auto_297175 ) ( CLEAR ?auto_297174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_297173 ?auto_297174 )
      ( MAKE-8PILE ?auto_297173 ?auto_297174 ?auto_297175 ?auto_297176 ?auto_297177 ?auto_297178 ?auto_297179 ?auto_297180 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_297190 - BLOCK
      ?auto_297191 - BLOCK
      ?auto_297192 - BLOCK
      ?auto_297193 - BLOCK
      ?auto_297194 - BLOCK
      ?auto_297195 - BLOCK
      ?auto_297196 - BLOCK
      ?auto_297197 - BLOCK
    )
    :vars
    (
      ?auto_297198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297197 ?auto_297198 ) ( ON-TABLE ?auto_297190 ) ( not ( = ?auto_297190 ?auto_297191 ) ) ( not ( = ?auto_297190 ?auto_297192 ) ) ( not ( = ?auto_297190 ?auto_297193 ) ) ( not ( = ?auto_297190 ?auto_297194 ) ) ( not ( = ?auto_297190 ?auto_297195 ) ) ( not ( = ?auto_297190 ?auto_297196 ) ) ( not ( = ?auto_297190 ?auto_297197 ) ) ( not ( = ?auto_297190 ?auto_297198 ) ) ( not ( = ?auto_297191 ?auto_297192 ) ) ( not ( = ?auto_297191 ?auto_297193 ) ) ( not ( = ?auto_297191 ?auto_297194 ) ) ( not ( = ?auto_297191 ?auto_297195 ) ) ( not ( = ?auto_297191 ?auto_297196 ) ) ( not ( = ?auto_297191 ?auto_297197 ) ) ( not ( = ?auto_297191 ?auto_297198 ) ) ( not ( = ?auto_297192 ?auto_297193 ) ) ( not ( = ?auto_297192 ?auto_297194 ) ) ( not ( = ?auto_297192 ?auto_297195 ) ) ( not ( = ?auto_297192 ?auto_297196 ) ) ( not ( = ?auto_297192 ?auto_297197 ) ) ( not ( = ?auto_297192 ?auto_297198 ) ) ( not ( = ?auto_297193 ?auto_297194 ) ) ( not ( = ?auto_297193 ?auto_297195 ) ) ( not ( = ?auto_297193 ?auto_297196 ) ) ( not ( = ?auto_297193 ?auto_297197 ) ) ( not ( = ?auto_297193 ?auto_297198 ) ) ( not ( = ?auto_297194 ?auto_297195 ) ) ( not ( = ?auto_297194 ?auto_297196 ) ) ( not ( = ?auto_297194 ?auto_297197 ) ) ( not ( = ?auto_297194 ?auto_297198 ) ) ( not ( = ?auto_297195 ?auto_297196 ) ) ( not ( = ?auto_297195 ?auto_297197 ) ) ( not ( = ?auto_297195 ?auto_297198 ) ) ( not ( = ?auto_297196 ?auto_297197 ) ) ( not ( = ?auto_297196 ?auto_297198 ) ) ( not ( = ?auto_297197 ?auto_297198 ) ) ( ON ?auto_297196 ?auto_297197 ) ( ON ?auto_297195 ?auto_297196 ) ( ON ?auto_297194 ?auto_297195 ) ( ON ?auto_297193 ?auto_297194 ) ( ON ?auto_297192 ?auto_297193 ) ( CLEAR ?auto_297190 ) ( ON ?auto_297191 ?auto_297192 ) ( CLEAR ?auto_297191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_297190 ?auto_297191 )
      ( MAKE-8PILE ?auto_297190 ?auto_297191 ?auto_297192 ?auto_297193 ?auto_297194 ?auto_297195 ?auto_297196 ?auto_297197 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_297207 - BLOCK
      ?auto_297208 - BLOCK
      ?auto_297209 - BLOCK
      ?auto_297210 - BLOCK
      ?auto_297211 - BLOCK
      ?auto_297212 - BLOCK
      ?auto_297213 - BLOCK
      ?auto_297214 - BLOCK
    )
    :vars
    (
      ?auto_297215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297214 ?auto_297215 ) ( not ( = ?auto_297207 ?auto_297208 ) ) ( not ( = ?auto_297207 ?auto_297209 ) ) ( not ( = ?auto_297207 ?auto_297210 ) ) ( not ( = ?auto_297207 ?auto_297211 ) ) ( not ( = ?auto_297207 ?auto_297212 ) ) ( not ( = ?auto_297207 ?auto_297213 ) ) ( not ( = ?auto_297207 ?auto_297214 ) ) ( not ( = ?auto_297207 ?auto_297215 ) ) ( not ( = ?auto_297208 ?auto_297209 ) ) ( not ( = ?auto_297208 ?auto_297210 ) ) ( not ( = ?auto_297208 ?auto_297211 ) ) ( not ( = ?auto_297208 ?auto_297212 ) ) ( not ( = ?auto_297208 ?auto_297213 ) ) ( not ( = ?auto_297208 ?auto_297214 ) ) ( not ( = ?auto_297208 ?auto_297215 ) ) ( not ( = ?auto_297209 ?auto_297210 ) ) ( not ( = ?auto_297209 ?auto_297211 ) ) ( not ( = ?auto_297209 ?auto_297212 ) ) ( not ( = ?auto_297209 ?auto_297213 ) ) ( not ( = ?auto_297209 ?auto_297214 ) ) ( not ( = ?auto_297209 ?auto_297215 ) ) ( not ( = ?auto_297210 ?auto_297211 ) ) ( not ( = ?auto_297210 ?auto_297212 ) ) ( not ( = ?auto_297210 ?auto_297213 ) ) ( not ( = ?auto_297210 ?auto_297214 ) ) ( not ( = ?auto_297210 ?auto_297215 ) ) ( not ( = ?auto_297211 ?auto_297212 ) ) ( not ( = ?auto_297211 ?auto_297213 ) ) ( not ( = ?auto_297211 ?auto_297214 ) ) ( not ( = ?auto_297211 ?auto_297215 ) ) ( not ( = ?auto_297212 ?auto_297213 ) ) ( not ( = ?auto_297212 ?auto_297214 ) ) ( not ( = ?auto_297212 ?auto_297215 ) ) ( not ( = ?auto_297213 ?auto_297214 ) ) ( not ( = ?auto_297213 ?auto_297215 ) ) ( not ( = ?auto_297214 ?auto_297215 ) ) ( ON ?auto_297213 ?auto_297214 ) ( ON ?auto_297212 ?auto_297213 ) ( ON ?auto_297211 ?auto_297212 ) ( ON ?auto_297210 ?auto_297211 ) ( ON ?auto_297209 ?auto_297210 ) ( ON ?auto_297208 ?auto_297209 ) ( ON ?auto_297207 ?auto_297208 ) ( CLEAR ?auto_297207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_297207 )
      ( MAKE-8PILE ?auto_297207 ?auto_297208 ?auto_297209 ?auto_297210 ?auto_297211 ?auto_297212 ?auto_297213 ?auto_297214 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_297224 - BLOCK
      ?auto_297225 - BLOCK
      ?auto_297226 - BLOCK
      ?auto_297227 - BLOCK
      ?auto_297228 - BLOCK
      ?auto_297229 - BLOCK
      ?auto_297230 - BLOCK
      ?auto_297231 - BLOCK
    )
    :vars
    (
      ?auto_297232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297231 ?auto_297232 ) ( not ( = ?auto_297224 ?auto_297225 ) ) ( not ( = ?auto_297224 ?auto_297226 ) ) ( not ( = ?auto_297224 ?auto_297227 ) ) ( not ( = ?auto_297224 ?auto_297228 ) ) ( not ( = ?auto_297224 ?auto_297229 ) ) ( not ( = ?auto_297224 ?auto_297230 ) ) ( not ( = ?auto_297224 ?auto_297231 ) ) ( not ( = ?auto_297224 ?auto_297232 ) ) ( not ( = ?auto_297225 ?auto_297226 ) ) ( not ( = ?auto_297225 ?auto_297227 ) ) ( not ( = ?auto_297225 ?auto_297228 ) ) ( not ( = ?auto_297225 ?auto_297229 ) ) ( not ( = ?auto_297225 ?auto_297230 ) ) ( not ( = ?auto_297225 ?auto_297231 ) ) ( not ( = ?auto_297225 ?auto_297232 ) ) ( not ( = ?auto_297226 ?auto_297227 ) ) ( not ( = ?auto_297226 ?auto_297228 ) ) ( not ( = ?auto_297226 ?auto_297229 ) ) ( not ( = ?auto_297226 ?auto_297230 ) ) ( not ( = ?auto_297226 ?auto_297231 ) ) ( not ( = ?auto_297226 ?auto_297232 ) ) ( not ( = ?auto_297227 ?auto_297228 ) ) ( not ( = ?auto_297227 ?auto_297229 ) ) ( not ( = ?auto_297227 ?auto_297230 ) ) ( not ( = ?auto_297227 ?auto_297231 ) ) ( not ( = ?auto_297227 ?auto_297232 ) ) ( not ( = ?auto_297228 ?auto_297229 ) ) ( not ( = ?auto_297228 ?auto_297230 ) ) ( not ( = ?auto_297228 ?auto_297231 ) ) ( not ( = ?auto_297228 ?auto_297232 ) ) ( not ( = ?auto_297229 ?auto_297230 ) ) ( not ( = ?auto_297229 ?auto_297231 ) ) ( not ( = ?auto_297229 ?auto_297232 ) ) ( not ( = ?auto_297230 ?auto_297231 ) ) ( not ( = ?auto_297230 ?auto_297232 ) ) ( not ( = ?auto_297231 ?auto_297232 ) ) ( ON ?auto_297230 ?auto_297231 ) ( ON ?auto_297229 ?auto_297230 ) ( ON ?auto_297228 ?auto_297229 ) ( ON ?auto_297227 ?auto_297228 ) ( ON ?auto_297226 ?auto_297227 ) ( ON ?auto_297225 ?auto_297226 ) ( ON ?auto_297224 ?auto_297225 ) ( CLEAR ?auto_297224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_297224 )
      ( MAKE-8PILE ?auto_297224 ?auto_297225 ?auto_297226 ?auto_297227 ?auto_297228 ?auto_297229 ?auto_297230 ?auto_297231 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_297242 - BLOCK
      ?auto_297243 - BLOCK
      ?auto_297244 - BLOCK
      ?auto_297245 - BLOCK
      ?auto_297246 - BLOCK
      ?auto_297247 - BLOCK
      ?auto_297248 - BLOCK
      ?auto_297249 - BLOCK
      ?auto_297250 - BLOCK
    )
    :vars
    (
      ?auto_297251 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_297249 ) ( ON ?auto_297250 ?auto_297251 ) ( CLEAR ?auto_297250 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_297242 ) ( ON ?auto_297243 ?auto_297242 ) ( ON ?auto_297244 ?auto_297243 ) ( ON ?auto_297245 ?auto_297244 ) ( ON ?auto_297246 ?auto_297245 ) ( ON ?auto_297247 ?auto_297246 ) ( ON ?auto_297248 ?auto_297247 ) ( ON ?auto_297249 ?auto_297248 ) ( not ( = ?auto_297242 ?auto_297243 ) ) ( not ( = ?auto_297242 ?auto_297244 ) ) ( not ( = ?auto_297242 ?auto_297245 ) ) ( not ( = ?auto_297242 ?auto_297246 ) ) ( not ( = ?auto_297242 ?auto_297247 ) ) ( not ( = ?auto_297242 ?auto_297248 ) ) ( not ( = ?auto_297242 ?auto_297249 ) ) ( not ( = ?auto_297242 ?auto_297250 ) ) ( not ( = ?auto_297242 ?auto_297251 ) ) ( not ( = ?auto_297243 ?auto_297244 ) ) ( not ( = ?auto_297243 ?auto_297245 ) ) ( not ( = ?auto_297243 ?auto_297246 ) ) ( not ( = ?auto_297243 ?auto_297247 ) ) ( not ( = ?auto_297243 ?auto_297248 ) ) ( not ( = ?auto_297243 ?auto_297249 ) ) ( not ( = ?auto_297243 ?auto_297250 ) ) ( not ( = ?auto_297243 ?auto_297251 ) ) ( not ( = ?auto_297244 ?auto_297245 ) ) ( not ( = ?auto_297244 ?auto_297246 ) ) ( not ( = ?auto_297244 ?auto_297247 ) ) ( not ( = ?auto_297244 ?auto_297248 ) ) ( not ( = ?auto_297244 ?auto_297249 ) ) ( not ( = ?auto_297244 ?auto_297250 ) ) ( not ( = ?auto_297244 ?auto_297251 ) ) ( not ( = ?auto_297245 ?auto_297246 ) ) ( not ( = ?auto_297245 ?auto_297247 ) ) ( not ( = ?auto_297245 ?auto_297248 ) ) ( not ( = ?auto_297245 ?auto_297249 ) ) ( not ( = ?auto_297245 ?auto_297250 ) ) ( not ( = ?auto_297245 ?auto_297251 ) ) ( not ( = ?auto_297246 ?auto_297247 ) ) ( not ( = ?auto_297246 ?auto_297248 ) ) ( not ( = ?auto_297246 ?auto_297249 ) ) ( not ( = ?auto_297246 ?auto_297250 ) ) ( not ( = ?auto_297246 ?auto_297251 ) ) ( not ( = ?auto_297247 ?auto_297248 ) ) ( not ( = ?auto_297247 ?auto_297249 ) ) ( not ( = ?auto_297247 ?auto_297250 ) ) ( not ( = ?auto_297247 ?auto_297251 ) ) ( not ( = ?auto_297248 ?auto_297249 ) ) ( not ( = ?auto_297248 ?auto_297250 ) ) ( not ( = ?auto_297248 ?auto_297251 ) ) ( not ( = ?auto_297249 ?auto_297250 ) ) ( not ( = ?auto_297249 ?auto_297251 ) ) ( not ( = ?auto_297250 ?auto_297251 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_297250 ?auto_297251 )
      ( !STACK ?auto_297250 ?auto_297249 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_297261 - BLOCK
      ?auto_297262 - BLOCK
      ?auto_297263 - BLOCK
      ?auto_297264 - BLOCK
      ?auto_297265 - BLOCK
      ?auto_297266 - BLOCK
      ?auto_297267 - BLOCK
      ?auto_297268 - BLOCK
      ?auto_297269 - BLOCK
    )
    :vars
    (
      ?auto_297270 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_297268 ) ( ON ?auto_297269 ?auto_297270 ) ( CLEAR ?auto_297269 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_297261 ) ( ON ?auto_297262 ?auto_297261 ) ( ON ?auto_297263 ?auto_297262 ) ( ON ?auto_297264 ?auto_297263 ) ( ON ?auto_297265 ?auto_297264 ) ( ON ?auto_297266 ?auto_297265 ) ( ON ?auto_297267 ?auto_297266 ) ( ON ?auto_297268 ?auto_297267 ) ( not ( = ?auto_297261 ?auto_297262 ) ) ( not ( = ?auto_297261 ?auto_297263 ) ) ( not ( = ?auto_297261 ?auto_297264 ) ) ( not ( = ?auto_297261 ?auto_297265 ) ) ( not ( = ?auto_297261 ?auto_297266 ) ) ( not ( = ?auto_297261 ?auto_297267 ) ) ( not ( = ?auto_297261 ?auto_297268 ) ) ( not ( = ?auto_297261 ?auto_297269 ) ) ( not ( = ?auto_297261 ?auto_297270 ) ) ( not ( = ?auto_297262 ?auto_297263 ) ) ( not ( = ?auto_297262 ?auto_297264 ) ) ( not ( = ?auto_297262 ?auto_297265 ) ) ( not ( = ?auto_297262 ?auto_297266 ) ) ( not ( = ?auto_297262 ?auto_297267 ) ) ( not ( = ?auto_297262 ?auto_297268 ) ) ( not ( = ?auto_297262 ?auto_297269 ) ) ( not ( = ?auto_297262 ?auto_297270 ) ) ( not ( = ?auto_297263 ?auto_297264 ) ) ( not ( = ?auto_297263 ?auto_297265 ) ) ( not ( = ?auto_297263 ?auto_297266 ) ) ( not ( = ?auto_297263 ?auto_297267 ) ) ( not ( = ?auto_297263 ?auto_297268 ) ) ( not ( = ?auto_297263 ?auto_297269 ) ) ( not ( = ?auto_297263 ?auto_297270 ) ) ( not ( = ?auto_297264 ?auto_297265 ) ) ( not ( = ?auto_297264 ?auto_297266 ) ) ( not ( = ?auto_297264 ?auto_297267 ) ) ( not ( = ?auto_297264 ?auto_297268 ) ) ( not ( = ?auto_297264 ?auto_297269 ) ) ( not ( = ?auto_297264 ?auto_297270 ) ) ( not ( = ?auto_297265 ?auto_297266 ) ) ( not ( = ?auto_297265 ?auto_297267 ) ) ( not ( = ?auto_297265 ?auto_297268 ) ) ( not ( = ?auto_297265 ?auto_297269 ) ) ( not ( = ?auto_297265 ?auto_297270 ) ) ( not ( = ?auto_297266 ?auto_297267 ) ) ( not ( = ?auto_297266 ?auto_297268 ) ) ( not ( = ?auto_297266 ?auto_297269 ) ) ( not ( = ?auto_297266 ?auto_297270 ) ) ( not ( = ?auto_297267 ?auto_297268 ) ) ( not ( = ?auto_297267 ?auto_297269 ) ) ( not ( = ?auto_297267 ?auto_297270 ) ) ( not ( = ?auto_297268 ?auto_297269 ) ) ( not ( = ?auto_297268 ?auto_297270 ) ) ( not ( = ?auto_297269 ?auto_297270 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_297269 ?auto_297270 )
      ( !STACK ?auto_297269 ?auto_297268 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_297280 - BLOCK
      ?auto_297281 - BLOCK
      ?auto_297282 - BLOCK
      ?auto_297283 - BLOCK
      ?auto_297284 - BLOCK
      ?auto_297285 - BLOCK
      ?auto_297286 - BLOCK
      ?auto_297287 - BLOCK
      ?auto_297288 - BLOCK
    )
    :vars
    (
      ?auto_297289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297288 ?auto_297289 ) ( ON-TABLE ?auto_297280 ) ( ON ?auto_297281 ?auto_297280 ) ( ON ?auto_297282 ?auto_297281 ) ( ON ?auto_297283 ?auto_297282 ) ( ON ?auto_297284 ?auto_297283 ) ( ON ?auto_297285 ?auto_297284 ) ( ON ?auto_297286 ?auto_297285 ) ( not ( = ?auto_297280 ?auto_297281 ) ) ( not ( = ?auto_297280 ?auto_297282 ) ) ( not ( = ?auto_297280 ?auto_297283 ) ) ( not ( = ?auto_297280 ?auto_297284 ) ) ( not ( = ?auto_297280 ?auto_297285 ) ) ( not ( = ?auto_297280 ?auto_297286 ) ) ( not ( = ?auto_297280 ?auto_297287 ) ) ( not ( = ?auto_297280 ?auto_297288 ) ) ( not ( = ?auto_297280 ?auto_297289 ) ) ( not ( = ?auto_297281 ?auto_297282 ) ) ( not ( = ?auto_297281 ?auto_297283 ) ) ( not ( = ?auto_297281 ?auto_297284 ) ) ( not ( = ?auto_297281 ?auto_297285 ) ) ( not ( = ?auto_297281 ?auto_297286 ) ) ( not ( = ?auto_297281 ?auto_297287 ) ) ( not ( = ?auto_297281 ?auto_297288 ) ) ( not ( = ?auto_297281 ?auto_297289 ) ) ( not ( = ?auto_297282 ?auto_297283 ) ) ( not ( = ?auto_297282 ?auto_297284 ) ) ( not ( = ?auto_297282 ?auto_297285 ) ) ( not ( = ?auto_297282 ?auto_297286 ) ) ( not ( = ?auto_297282 ?auto_297287 ) ) ( not ( = ?auto_297282 ?auto_297288 ) ) ( not ( = ?auto_297282 ?auto_297289 ) ) ( not ( = ?auto_297283 ?auto_297284 ) ) ( not ( = ?auto_297283 ?auto_297285 ) ) ( not ( = ?auto_297283 ?auto_297286 ) ) ( not ( = ?auto_297283 ?auto_297287 ) ) ( not ( = ?auto_297283 ?auto_297288 ) ) ( not ( = ?auto_297283 ?auto_297289 ) ) ( not ( = ?auto_297284 ?auto_297285 ) ) ( not ( = ?auto_297284 ?auto_297286 ) ) ( not ( = ?auto_297284 ?auto_297287 ) ) ( not ( = ?auto_297284 ?auto_297288 ) ) ( not ( = ?auto_297284 ?auto_297289 ) ) ( not ( = ?auto_297285 ?auto_297286 ) ) ( not ( = ?auto_297285 ?auto_297287 ) ) ( not ( = ?auto_297285 ?auto_297288 ) ) ( not ( = ?auto_297285 ?auto_297289 ) ) ( not ( = ?auto_297286 ?auto_297287 ) ) ( not ( = ?auto_297286 ?auto_297288 ) ) ( not ( = ?auto_297286 ?auto_297289 ) ) ( not ( = ?auto_297287 ?auto_297288 ) ) ( not ( = ?auto_297287 ?auto_297289 ) ) ( not ( = ?auto_297288 ?auto_297289 ) ) ( CLEAR ?auto_297286 ) ( ON ?auto_297287 ?auto_297288 ) ( CLEAR ?auto_297287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_297280 ?auto_297281 ?auto_297282 ?auto_297283 ?auto_297284 ?auto_297285 ?auto_297286 ?auto_297287 )
      ( MAKE-9PILE ?auto_297280 ?auto_297281 ?auto_297282 ?auto_297283 ?auto_297284 ?auto_297285 ?auto_297286 ?auto_297287 ?auto_297288 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_297299 - BLOCK
      ?auto_297300 - BLOCK
      ?auto_297301 - BLOCK
      ?auto_297302 - BLOCK
      ?auto_297303 - BLOCK
      ?auto_297304 - BLOCK
      ?auto_297305 - BLOCK
      ?auto_297306 - BLOCK
      ?auto_297307 - BLOCK
    )
    :vars
    (
      ?auto_297308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297307 ?auto_297308 ) ( ON-TABLE ?auto_297299 ) ( ON ?auto_297300 ?auto_297299 ) ( ON ?auto_297301 ?auto_297300 ) ( ON ?auto_297302 ?auto_297301 ) ( ON ?auto_297303 ?auto_297302 ) ( ON ?auto_297304 ?auto_297303 ) ( ON ?auto_297305 ?auto_297304 ) ( not ( = ?auto_297299 ?auto_297300 ) ) ( not ( = ?auto_297299 ?auto_297301 ) ) ( not ( = ?auto_297299 ?auto_297302 ) ) ( not ( = ?auto_297299 ?auto_297303 ) ) ( not ( = ?auto_297299 ?auto_297304 ) ) ( not ( = ?auto_297299 ?auto_297305 ) ) ( not ( = ?auto_297299 ?auto_297306 ) ) ( not ( = ?auto_297299 ?auto_297307 ) ) ( not ( = ?auto_297299 ?auto_297308 ) ) ( not ( = ?auto_297300 ?auto_297301 ) ) ( not ( = ?auto_297300 ?auto_297302 ) ) ( not ( = ?auto_297300 ?auto_297303 ) ) ( not ( = ?auto_297300 ?auto_297304 ) ) ( not ( = ?auto_297300 ?auto_297305 ) ) ( not ( = ?auto_297300 ?auto_297306 ) ) ( not ( = ?auto_297300 ?auto_297307 ) ) ( not ( = ?auto_297300 ?auto_297308 ) ) ( not ( = ?auto_297301 ?auto_297302 ) ) ( not ( = ?auto_297301 ?auto_297303 ) ) ( not ( = ?auto_297301 ?auto_297304 ) ) ( not ( = ?auto_297301 ?auto_297305 ) ) ( not ( = ?auto_297301 ?auto_297306 ) ) ( not ( = ?auto_297301 ?auto_297307 ) ) ( not ( = ?auto_297301 ?auto_297308 ) ) ( not ( = ?auto_297302 ?auto_297303 ) ) ( not ( = ?auto_297302 ?auto_297304 ) ) ( not ( = ?auto_297302 ?auto_297305 ) ) ( not ( = ?auto_297302 ?auto_297306 ) ) ( not ( = ?auto_297302 ?auto_297307 ) ) ( not ( = ?auto_297302 ?auto_297308 ) ) ( not ( = ?auto_297303 ?auto_297304 ) ) ( not ( = ?auto_297303 ?auto_297305 ) ) ( not ( = ?auto_297303 ?auto_297306 ) ) ( not ( = ?auto_297303 ?auto_297307 ) ) ( not ( = ?auto_297303 ?auto_297308 ) ) ( not ( = ?auto_297304 ?auto_297305 ) ) ( not ( = ?auto_297304 ?auto_297306 ) ) ( not ( = ?auto_297304 ?auto_297307 ) ) ( not ( = ?auto_297304 ?auto_297308 ) ) ( not ( = ?auto_297305 ?auto_297306 ) ) ( not ( = ?auto_297305 ?auto_297307 ) ) ( not ( = ?auto_297305 ?auto_297308 ) ) ( not ( = ?auto_297306 ?auto_297307 ) ) ( not ( = ?auto_297306 ?auto_297308 ) ) ( not ( = ?auto_297307 ?auto_297308 ) ) ( CLEAR ?auto_297305 ) ( ON ?auto_297306 ?auto_297307 ) ( CLEAR ?auto_297306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_297299 ?auto_297300 ?auto_297301 ?auto_297302 ?auto_297303 ?auto_297304 ?auto_297305 ?auto_297306 )
      ( MAKE-9PILE ?auto_297299 ?auto_297300 ?auto_297301 ?auto_297302 ?auto_297303 ?auto_297304 ?auto_297305 ?auto_297306 ?auto_297307 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_297318 - BLOCK
      ?auto_297319 - BLOCK
      ?auto_297320 - BLOCK
      ?auto_297321 - BLOCK
      ?auto_297322 - BLOCK
      ?auto_297323 - BLOCK
      ?auto_297324 - BLOCK
      ?auto_297325 - BLOCK
      ?auto_297326 - BLOCK
    )
    :vars
    (
      ?auto_297327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297326 ?auto_297327 ) ( ON-TABLE ?auto_297318 ) ( ON ?auto_297319 ?auto_297318 ) ( ON ?auto_297320 ?auto_297319 ) ( ON ?auto_297321 ?auto_297320 ) ( ON ?auto_297322 ?auto_297321 ) ( ON ?auto_297323 ?auto_297322 ) ( not ( = ?auto_297318 ?auto_297319 ) ) ( not ( = ?auto_297318 ?auto_297320 ) ) ( not ( = ?auto_297318 ?auto_297321 ) ) ( not ( = ?auto_297318 ?auto_297322 ) ) ( not ( = ?auto_297318 ?auto_297323 ) ) ( not ( = ?auto_297318 ?auto_297324 ) ) ( not ( = ?auto_297318 ?auto_297325 ) ) ( not ( = ?auto_297318 ?auto_297326 ) ) ( not ( = ?auto_297318 ?auto_297327 ) ) ( not ( = ?auto_297319 ?auto_297320 ) ) ( not ( = ?auto_297319 ?auto_297321 ) ) ( not ( = ?auto_297319 ?auto_297322 ) ) ( not ( = ?auto_297319 ?auto_297323 ) ) ( not ( = ?auto_297319 ?auto_297324 ) ) ( not ( = ?auto_297319 ?auto_297325 ) ) ( not ( = ?auto_297319 ?auto_297326 ) ) ( not ( = ?auto_297319 ?auto_297327 ) ) ( not ( = ?auto_297320 ?auto_297321 ) ) ( not ( = ?auto_297320 ?auto_297322 ) ) ( not ( = ?auto_297320 ?auto_297323 ) ) ( not ( = ?auto_297320 ?auto_297324 ) ) ( not ( = ?auto_297320 ?auto_297325 ) ) ( not ( = ?auto_297320 ?auto_297326 ) ) ( not ( = ?auto_297320 ?auto_297327 ) ) ( not ( = ?auto_297321 ?auto_297322 ) ) ( not ( = ?auto_297321 ?auto_297323 ) ) ( not ( = ?auto_297321 ?auto_297324 ) ) ( not ( = ?auto_297321 ?auto_297325 ) ) ( not ( = ?auto_297321 ?auto_297326 ) ) ( not ( = ?auto_297321 ?auto_297327 ) ) ( not ( = ?auto_297322 ?auto_297323 ) ) ( not ( = ?auto_297322 ?auto_297324 ) ) ( not ( = ?auto_297322 ?auto_297325 ) ) ( not ( = ?auto_297322 ?auto_297326 ) ) ( not ( = ?auto_297322 ?auto_297327 ) ) ( not ( = ?auto_297323 ?auto_297324 ) ) ( not ( = ?auto_297323 ?auto_297325 ) ) ( not ( = ?auto_297323 ?auto_297326 ) ) ( not ( = ?auto_297323 ?auto_297327 ) ) ( not ( = ?auto_297324 ?auto_297325 ) ) ( not ( = ?auto_297324 ?auto_297326 ) ) ( not ( = ?auto_297324 ?auto_297327 ) ) ( not ( = ?auto_297325 ?auto_297326 ) ) ( not ( = ?auto_297325 ?auto_297327 ) ) ( not ( = ?auto_297326 ?auto_297327 ) ) ( ON ?auto_297325 ?auto_297326 ) ( CLEAR ?auto_297323 ) ( ON ?auto_297324 ?auto_297325 ) ( CLEAR ?auto_297324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_297318 ?auto_297319 ?auto_297320 ?auto_297321 ?auto_297322 ?auto_297323 ?auto_297324 )
      ( MAKE-9PILE ?auto_297318 ?auto_297319 ?auto_297320 ?auto_297321 ?auto_297322 ?auto_297323 ?auto_297324 ?auto_297325 ?auto_297326 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_297337 - BLOCK
      ?auto_297338 - BLOCK
      ?auto_297339 - BLOCK
      ?auto_297340 - BLOCK
      ?auto_297341 - BLOCK
      ?auto_297342 - BLOCK
      ?auto_297343 - BLOCK
      ?auto_297344 - BLOCK
      ?auto_297345 - BLOCK
    )
    :vars
    (
      ?auto_297346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297345 ?auto_297346 ) ( ON-TABLE ?auto_297337 ) ( ON ?auto_297338 ?auto_297337 ) ( ON ?auto_297339 ?auto_297338 ) ( ON ?auto_297340 ?auto_297339 ) ( ON ?auto_297341 ?auto_297340 ) ( ON ?auto_297342 ?auto_297341 ) ( not ( = ?auto_297337 ?auto_297338 ) ) ( not ( = ?auto_297337 ?auto_297339 ) ) ( not ( = ?auto_297337 ?auto_297340 ) ) ( not ( = ?auto_297337 ?auto_297341 ) ) ( not ( = ?auto_297337 ?auto_297342 ) ) ( not ( = ?auto_297337 ?auto_297343 ) ) ( not ( = ?auto_297337 ?auto_297344 ) ) ( not ( = ?auto_297337 ?auto_297345 ) ) ( not ( = ?auto_297337 ?auto_297346 ) ) ( not ( = ?auto_297338 ?auto_297339 ) ) ( not ( = ?auto_297338 ?auto_297340 ) ) ( not ( = ?auto_297338 ?auto_297341 ) ) ( not ( = ?auto_297338 ?auto_297342 ) ) ( not ( = ?auto_297338 ?auto_297343 ) ) ( not ( = ?auto_297338 ?auto_297344 ) ) ( not ( = ?auto_297338 ?auto_297345 ) ) ( not ( = ?auto_297338 ?auto_297346 ) ) ( not ( = ?auto_297339 ?auto_297340 ) ) ( not ( = ?auto_297339 ?auto_297341 ) ) ( not ( = ?auto_297339 ?auto_297342 ) ) ( not ( = ?auto_297339 ?auto_297343 ) ) ( not ( = ?auto_297339 ?auto_297344 ) ) ( not ( = ?auto_297339 ?auto_297345 ) ) ( not ( = ?auto_297339 ?auto_297346 ) ) ( not ( = ?auto_297340 ?auto_297341 ) ) ( not ( = ?auto_297340 ?auto_297342 ) ) ( not ( = ?auto_297340 ?auto_297343 ) ) ( not ( = ?auto_297340 ?auto_297344 ) ) ( not ( = ?auto_297340 ?auto_297345 ) ) ( not ( = ?auto_297340 ?auto_297346 ) ) ( not ( = ?auto_297341 ?auto_297342 ) ) ( not ( = ?auto_297341 ?auto_297343 ) ) ( not ( = ?auto_297341 ?auto_297344 ) ) ( not ( = ?auto_297341 ?auto_297345 ) ) ( not ( = ?auto_297341 ?auto_297346 ) ) ( not ( = ?auto_297342 ?auto_297343 ) ) ( not ( = ?auto_297342 ?auto_297344 ) ) ( not ( = ?auto_297342 ?auto_297345 ) ) ( not ( = ?auto_297342 ?auto_297346 ) ) ( not ( = ?auto_297343 ?auto_297344 ) ) ( not ( = ?auto_297343 ?auto_297345 ) ) ( not ( = ?auto_297343 ?auto_297346 ) ) ( not ( = ?auto_297344 ?auto_297345 ) ) ( not ( = ?auto_297344 ?auto_297346 ) ) ( not ( = ?auto_297345 ?auto_297346 ) ) ( ON ?auto_297344 ?auto_297345 ) ( CLEAR ?auto_297342 ) ( ON ?auto_297343 ?auto_297344 ) ( CLEAR ?auto_297343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_297337 ?auto_297338 ?auto_297339 ?auto_297340 ?auto_297341 ?auto_297342 ?auto_297343 )
      ( MAKE-9PILE ?auto_297337 ?auto_297338 ?auto_297339 ?auto_297340 ?auto_297341 ?auto_297342 ?auto_297343 ?auto_297344 ?auto_297345 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_297356 - BLOCK
      ?auto_297357 - BLOCK
      ?auto_297358 - BLOCK
      ?auto_297359 - BLOCK
      ?auto_297360 - BLOCK
      ?auto_297361 - BLOCK
      ?auto_297362 - BLOCK
      ?auto_297363 - BLOCK
      ?auto_297364 - BLOCK
    )
    :vars
    (
      ?auto_297365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297364 ?auto_297365 ) ( ON-TABLE ?auto_297356 ) ( ON ?auto_297357 ?auto_297356 ) ( ON ?auto_297358 ?auto_297357 ) ( ON ?auto_297359 ?auto_297358 ) ( ON ?auto_297360 ?auto_297359 ) ( not ( = ?auto_297356 ?auto_297357 ) ) ( not ( = ?auto_297356 ?auto_297358 ) ) ( not ( = ?auto_297356 ?auto_297359 ) ) ( not ( = ?auto_297356 ?auto_297360 ) ) ( not ( = ?auto_297356 ?auto_297361 ) ) ( not ( = ?auto_297356 ?auto_297362 ) ) ( not ( = ?auto_297356 ?auto_297363 ) ) ( not ( = ?auto_297356 ?auto_297364 ) ) ( not ( = ?auto_297356 ?auto_297365 ) ) ( not ( = ?auto_297357 ?auto_297358 ) ) ( not ( = ?auto_297357 ?auto_297359 ) ) ( not ( = ?auto_297357 ?auto_297360 ) ) ( not ( = ?auto_297357 ?auto_297361 ) ) ( not ( = ?auto_297357 ?auto_297362 ) ) ( not ( = ?auto_297357 ?auto_297363 ) ) ( not ( = ?auto_297357 ?auto_297364 ) ) ( not ( = ?auto_297357 ?auto_297365 ) ) ( not ( = ?auto_297358 ?auto_297359 ) ) ( not ( = ?auto_297358 ?auto_297360 ) ) ( not ( = ?auto_297358 ?auto_297361 ) ) ( not ( = ?auto_297358 ?auto_297362 ) ) ( not ( = ?auto_297358 ?auto_297363 ) ) ( not ( = ?auto_297358 ?auto_297364 ) ) ( not ( = ?auto_297358 ?auto_297365 ) ) ( not ( = ?auto_297359 ?auto_297360 ) ) ( not ( = ?auto_297359 ?auto_297361 ) ) ( not ( = ?auto_297359 ?auto_297362 ) ) ( not ( = ?auto_297359 ?auto_297363 ) ) ( not ( = ?auto_297359 ?auto_297364 ) ) ( not ( = ?auto_297359 ?auto_297365 ) ) ( not ( = ?auto_297360 ?auto_297361 ) ) ( not ( = ?auto_297360 ?auto_297362 ) ) ( not ( = ?auto_297360 ?auto_297363 ) ) ( not ( = ?auto_297360 ?auto_297364 ) ) ( not ( = ?auto_297360 ?auto_297365 ) ) ( not ( = ?auto_297361 ?auto_297362 ) ) ( not ( = ?auto_297361 ?auto_297363 ) ) ( not ( = ?auto_297361 ?auto_297364 ) ) ( not ( = ?auto_297361 ?auto_297365 ) ) ( not ( = ?auto_297362 ?auto_297363 ) ) ( not ( = ?auto_297362 ?auto_297364 ) ) ( not ( = ?auto_297362 ?auto_297365 ) ) ( not ( = ?auto_297363 ?auto_297364 ) ) ( not ( = ?auto_297363 ?auto_297365 ) ) ( not ( = ?auto_297364 ?auto_297365 ) ) ( ON ?auto_297363 ?auto_297364 ) ( ON ?auto_297362 ?auto_297363 ) ( CLEAR ?auto_297360 ) ( ON ?auto_297361 ?auto_297362 ) ( CLEAR ?auto_297361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_297356 ?auto_297357 ?auto_297358 ?auto_297359 ?auto_297360 ?auto_297361 )
      ( MAKE-9PILE ?auto_297356 ?auto_297357 ?auto_297358 ?auto_297359 ?auto_297360 ?auto_297361 ?auto_297362 ?auto_297363 ?auto_297364 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_297375 - BLOCK
      ?auto_297376 - BLOCK
      ?auto_297377 - BLOCK
      ?auto_297378 - BLOCK
      ?auto_297379 - BLOCK
      ?auto_297380 - BLOCK
      ?auto_297381 - BLOCK
      ?auto_297382 - BLOCK
      ?auto_297383 - BLOCK
    )
    :vars
    (
      ?auto_297384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297383 ?auto_297384 ) ( ON-TABLE ?auto_297375 ) ( ON ?auto_297376 ?auto_297375 ) ( ON ?auto_297377 ?auto_297376 ) ( ON ?auto_297378 ?auto_297377 ) ( ON ?auto_297379 ?auto_297378 ) ( not ( = ?auto_297375 ?auto_297376 ) ) ( not ( = ?auto_297375 ?auto_297377 ) ) ( not ( = ?auto_297375 ?auto_297378 ) ) ( not ( = ?auto_297375 ?auto_297379 ) ) ( not ( = ?auto_297375 ?auto_297380 ) ) ( not ( = ?auto_297375 ?auto_297381 ) ) ( not ( = ?auto_297375 ?auto_297382 ) ) ( not ( = ?auto_297375 ?auto_297383 ) ) ( not ( = ?auto_297375 ?auto_297384 ) ) ( not ( = ?auto_297376 ?auto_297377 ) ) ( not ( = ?auto_297376 ?auto_297378 ) ) ( not ( = ?auto_297376 ?auto_297379 ) ) ( not ( = ?auto_297376 ?auto_297380 ) ) ( not ( = ?auto_297376 ?auto_297381 ) ) ( not ( = ?auto_297376 ?auto_297382 ) ) ( not ( = ?auto_297376 ?auto_297383 ) ) ( not ( = ?auto_297376 ?auto_297384 ) ) ( not ( = ?auto_297377 ?auto_297378 ) ) ( not ( = ?auto_297377 ?auto_297379 ) ) ( not ( = ?auto_297377 ?auto_297380 ) ) ( not ( = ?auto_297377 ?auto_297381 ) ) ( not ( = ?auto_297377 ?auto_297382 ) ) ( not ( = ?auto_297377 ?auto_297383 ) ) ( not ( = ?auto_297377 ?auto_297384 ) ) ( not ( = ?auto_297378 ?auto_297379 ) ) ( not ( = ?auto_297378 ?auto_297380 ) ) ( not ( = ?auto_297378 ?auto_297381 ) ) ( not ( = ?auto_297378 ?auto_297382 ) ) ( not ( = ?auto_297378 ?auto_297383 ) ) ( not ( = ?auto_297378 ?auto_297384 ) ) ( not ( = ?auto_297379 ?auto_297380 ) ) ( not ( = ?auto_297379 ?auto_297381 ) ) ( not ( = ?auto_297379 ?auto_297382 ) ) ( not ( = ?auto_297379 ?auto_297383 ) ) ( not ( = ?auto_297379 ?auto_297384 ) ) ( not ( = ?auto_297380 ?auto_297381 ) ) ( not ( = ?auto_297380 ?auto_297382 ) ) ( not ( = ?auto_297380 ?auto_297383 ) ) ( not ( = ?auto_297380 ?auto_297384 ) ) ( not ( = ?auto_297381 ?auto_297382 ) ) ( not ( = ?auto_297381 ?auto_297383 ) ) ( not ( = ?auto_297381 ?auto_297384 ) ) ( not ( = ?auto_297382 ?auto_297383 ) ) ( not ( = ?auto_297382 ?auto_297384 ) ) ( not ( = ?auto_297383 ?auto_297384 ) ) ( ON ?auto_297382 ?auto_297383 ) ( ON ?auto_297381 ?auto_297382 ) ( CLEAR ?auto_297379 ) ( ON ?auto_297380 ?auto_297381 ) ( CLEAR ?auto_297380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_297375 ?auto_297376 ?auto_297377 ?auto_297378 ?auto_297379 ?auto_297380 )
      ( MAKE-9PILE ?auto_297375 ?auto_297376 ?auto_297377 ?auto_297378 ?auto_297379 ?auto_297380 ?auto_297381 ?auto_297382 ?auto_297383 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_297394 - BLOCK
      ?auto_297395 - BLOCK
      ?auto_297396 - BLOCK
      ?auto_297397 - BLOCK
      ?auto_297398 - BLOCK
      ?auto_297399 - BLOCK
      ?auto_297400 - BLOCK
      ?auto_297401 - BLOCK
      ?auto_297402 - BLOCK
    )
    :vars
    (
      ?auto_297403 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297402 ?auto_297403 ) ( ON-TABLE ?auto_297394 ) ( ON ?auto_297395 ?auto_297394 ) ( ON ?auto_297396 ?auto_297395 ) ( ON ?auto_297397 ?auto_297396 ) ( not ( = ?auto_297394 ?auto_297395 ) ) ( not ( = ?auto_297394 ?auto_297396 ) ) ( not ( = ?auto_297394 ?auto_297397 ) ) ( not ( = ?auto_297394 ?auto_297398 ) ) ( not ( = ?auto_297394 ?auto_297399 ) ) ( not ( = ?auto_297394 ?auto_297400 ) ) ( not ( = ?auto_297394 ?auto_297401 ) ) ( not ( = ?auto_297394 ?auto_297402 ) ) ( not ( = ?auto_297394 ?auto_297403 ) ) ( not ( = ?auto_297395 ?auto_297396 ) ) ( not ( = ?auto_297395 ?auto_297397 ) ) ( not ( = ?auto_297395 ?auto_297398 ) ) ( not ( = ?auto_297395 ?auto_297399 ) ) ( not ( = ?auto_297395 ?auto_297400 ) ) ( not ( = ?auto_297395 ?auto_297401 ) ) ( not ( = ?auto_297395 ?auto_297402 ) ) ( not ( = ?auto_297395 ?auto_297403 ) ) ( not ( = ?auto_297396 ?auto_297397 ) ) ( not ( = ?auto_297396 ?auto_297398 ) ) ( not ( = ?auto_297396 ?auto_297399 ) ) ( not ( = ?auto_297396 ?auto_297400 ) ) ( not ( = ?auto_297396 ?auto_297401 ) ) ( not ( = ?auto_297396 ?auto_297402 ) ) ( not ( = ?auto_297396 ?auto_297403 ) ) ( not ( = ?auto_297397 ?auto_297398 ) ) ( not ( = ?auto_297397 ?auto_297399 ) ) ( not ( = ?auto_297397 ?auto_297400 ) ) ( not ( = ?auto_297397 ?auto_297401 ) ) ( not ( = ?auto_297397 ?auto_297402 ) ) ( not ( = ?auto_297397 ?auto_297403 ) ) ( not ( = ?auto_297398 ?auto_297399 ) ) ( not ( = ?auto_297398 ?auto_297400 ) ) ( not ( = ?auto_297398 ?auto_297401 ) ) ( not ( = ?auto_297398 ?auto_297402 ) ) ( not ( = ?auto_297398 ?auto_297403 ) ) ( not ( = ?auto_297399 ?auto_297400 ) ) ( not ( = ?auto_297399 ?auto_297401 ) ) ( not ( = ?auto_297399 ?auto_297402 ) ) ( not ( = ?auto_297399 ?auto_297403 ) ) ( not ( = ?auto_297400 ?auto_297401 ) ) ( not ( = ?auto_297400 ?auto_297402 ) ) ( not ( = ?auto_297400 ?auto_297403 ) ) ( not ( = ?auto_297401 ?auto_297402 ) ) ( not ( = ?auto_297401 ?auto_297403 ) ) ( not ( = ?auto_297402 ?auto_297403 ) ) ( ON ?auto_297401 ?auto_297402 ) ( ON ?auto_297400 ?auto_297401 ) ( ON ?auto_297399 ?auto_297400 ) ( CLEAR ?auto_297397 ) ( ON ?auto_297398 ?auto_297399 ) ( CLEAR ?auto_297398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_297394 ?auto_297395 ?auto_297396 ?auto_297397 ?auto_297398 )
      ( MAKE-9PILE ?auto_297394 ?auto_297395 ?auto_297396 ?auto_297397 ?auto_297398 ?auto_297399 ?auto_297400 ?auto_297401 ?auto_297402 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_297413 - BLOCK
      ?auto_297414 - BLOCK
      ?auto_297415 - BLOCK
      ?auto_297416 - BLOCK
      ?auto_297417 - BLOCK
      ?auto_297418 - BLOCK
      ?auto_297419 - BLOCK
      ?auto_297420 - BLOCK
      ?auto_297421 - BLOCK
    )
    :vars
    (
      ?auto_297422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297421 ?auto_297422 ) ( ON-TABLE ?auto_297413 ) ( ON ?auto_297414 ?auto_297413 ) ( ON ?auto_297415 ?auto_297414 ) ( ON ?auto_297416 ?auto_297415 ) ( not ( = ?auto_297413 ?auto_297414 ) ) ( not ( = ?auto_297413 ?auto_297415 ) ) ( not ( = ?auto_297413 ?auto_297416 ) ) ( not ( = ?auto_297413 ?auto_297417 ) ) ( not ( = ?auto_297413 ?auto_297418 ) ) ( not ( = ?auto_297413 ?auto_297419 ) ) ( not ( = ?auto_297413 ?auto_297420 ) ) ( not ( = ?auto_297413 ?auto_297421 ) ) ( not ( = ?auto_297413 ?auto_297422 ) ) ( not ( = ?auto_297414 ?auto_297415 ) ) ( not ( = ?auto_297414 ?auto_297416 ) ) ( not ( = ?auto_297414 ?auto_297417 ) ) ( not ( = ?auto_297414 ?auto_297418 ) ) ( not ( = ?auto_297414 ?auto_297419 ) ) ( not ( = ?auto_297414 ?auto_297420 ) ) ( not ( = ?auto_297414 ?auto_297421 ) ) ( not ( = ?auto_297414 ?auto_297422 ) ) ( not ( = ?auto_297415 ?auto_297416 ) ) ( not ( = ?auto_297415 ?auto_297417 ) ) ( not ( = ?auto_297415 ?auto_297418 ) ) ( not ( = ?auto_297415 ?auto_297419 ) ) ( not ( = ?auto_297415 ?auto_297420 ) ) ( not ( = ?auto_297415 ?auto_297421 ) ) ( not ( = ?auto_297415 ?auto_297422 ) ) ( not ( = ?auto_297416 ?auto_297417 ) ) ( not ( = ?auto_297416 ?auto_297418 ) ) ( not ( = ?auto_297416 ?auto_297419 ) ) ( not ( = ?auto_297416 ?auto_297420 ) ) ( not ( = ?auto_297416 ?auto_297421 ) ) ( not ( = ?auto_297416 ?auto_297422 ) ) ( not ( = ?auto_297417 ?auto_297418 ) ) ( not ( = ?auto_297417 ?auto_297419 ) ) ( not ( = ?auto_297417 ?auto_297420 ) ) ( not ( = ?auto_297417 ?auto_297421 ) ) ( not ( = ?auto_297417 ?auto_297422 ) ) ( not ( = ?auto_297418 ?auto_297419 ) ) ( not ( = ?auto_297418 ?auto_297420 ) ) ( not ( = ?auto_297418 ?auto_297421 ) ) ( not ( = ?auto_297418 ?auto_297422 ) ) ( not ( = ?auto_297419 ?auto_297420 ) ) ( not ( = ?auto_297419 ?auto_297421 ) ) ( not ( = ?auto_297419 ?auto_297422 ) ) ( not ( = ?auto_297420 ?auto_297421 ) ) ( not ( = ?auto_297420 ?auto_297422 ) ) ( not ( = ?auto_297421 ?auto_297422 ) ) ( ON ?auto_297420 ?auto_297421 ) ( ON ?auto_297419 ?auto_297420 ) ( ON ?auto_297418 ?auto_297419 ) ( CLEAR ?auto_297416 ) ( ON ?auto_297417 ?auto_297418 ) ( CLEAR ?auto_297417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_297413 ?auto_297414 ?auto_297415 ?auto_297416 ?auto_297417 )
      ( MAKE-9PILE ?auto_297413 ?auto_297414 ?auto_297415 ?auto_297416 ?auto_297417 ?auto_297418 ?auto_297419 ?auto_297420 ?auto_297421 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_297432 - BLOCK
      ?auto_297433 - BLOCK
      ?auto_297434 - BLOCK
      ?auto_297435 - BLOCK
      ?auto_297436 - BLOCK
      ?auto_297437 - BLOCK
      ?auto_297438 - BLOCK
      ?auto_297439 - BLOCK
      ?auto_297440 - BLOCK
    )
    :vars
    (
      ?auto_297441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297440 ?auto_297441 ) ( ON-TABLE ?auto_297432 ) ( ON ?auto_297433 ?auto_297432 ) ( ON ?auto_297434 ?auto_297433 ) ( not ( = ?auto_297432 ?auto_297433 ) ) ( not ( = ?auto_297432 ?auto_297434 ) ) ( not ( = ?auto_297432 ?auto_297435 ) ) ( not ( = ?auto_297432 ?auto_297436 ) ) ( not ( = ?auto_297432 ?auto_297437 ) ) ( not ( = ?auto_297432 ?auto_297438 ) ) ( not ( = ?auto_297432 ?auto_297439 ) ) ( not ( = ?auto_297432 ?auto_297440 ) ) ( not ( = ?auto_297432 ?auto_297441 ) ) ( not ( = ?auto_297433 ?auto_297434 ) ) ( not ( = ?auto_297433 ?auto_297435 ) ) ( not ( = ?auto_297433 ?auto_297436 ) ) ( not ( = ?auto_297433 ?auto_297437 ) ) ( not ( = ?auto_297433 ?auto_297438 ) ) ( not ( = ?auto_297433 ?auto_297439 ) ) ( not ( = ?auto_297433 ?auto_297440 ) ) ( not ( = ?auto_297433 ?auto_297441 ) ) ( not ( = ?auto_297434 ?auto_297435 ) ) ( not ( = ?auto_297434 ?auto_297436 ) ) ( not ( = ?auto_297434 ?auto_297437 ) ) ( not ( = ?auto_297434 ?auto_297438 ) ) ( not ( = ?auto_297434 ?auto_297439 ) ) ( not ( = ?auto_297434 ?auto_297440 ) ) ( not ( = ?auto_297434 ?auto_297441 ) ) ( not ( = ?auto_297435 ?auto_297436 ) ) ( not ( = ?auto_297435 ?auto_297437 ) ) ( not ( = ?auto_297435 ?auto_297438 ) ) ( not ( = ?auto_297435 ?auto_297439 ) ) ( not ( = ?auto_297435 ?auto_297440 ) ) ( not ( = ?auto_297435 ?auto_297441 ) ) ( not ( = ?auto_297436 ?auto_297437 ) ) ( not ( = ?auto_297436 ?auto_297438 ) ) ( not ( = ?auto_297436 ?auto_297439 ) ) ( not ( = ?auto_297436 ?auto_297440 ) ) ( not ( = ?auto_297436 ?auto_297441 ) ) ( not ( = ?auto_297437 ?auto_297438 ) ) ( not ( = ?auto_297437 ?auto_297439 ) ) ( not ( = ?auto_297437 ?auto_297440 ) ) ( not ( = ?auto_297437 ?auto_297441 ) ) ( not ( = ?auto_297438 ?auto_297439 ) ) ( not ( = ?auto_297438 ?auto_297440 ) ) ( not ( = ?auto_297438 ?auto_297441 ) ) ( not ( = ?auto_297439 ?auto_297440 ) ) ( not ( = ?auto_297439 ?auto_297441 ) ) ( not ( = ?auto_297440 ?auto_297441 ) ) ( ON ?auto_297439 ?auto_297440 ) ( ON ?auto_297438 ?auto_297439 ) ( ON ?auto_297437 ?auto_297438 ) ( ON ?auto_297436 ?auto_297437 ) ( CLEAR ?auto_297434 ) ( ON ?auto_297435 ?auto_297436 ) ( CLEAR ?auto_297435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_297432 ?auto_297433 ?auto_297434 ?auto_297435 )
      ( MAKE-9PILE ?auto_297432 ?auto_297433 ?auto_297434 ?auto_297435 ?auto_297436 ?auto_297437 ?auto_297438 ?auto_297439 ?auto_297440 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_297451 - BLOCK
      ?auto_297452 - BLOCK
      ?auto_297453 - BLOCK
      ?auto_297454 - BLOCK
      ?auto_297455 - BLOCK
      ?auto_297456 - BLOCK
      ?auto_297457 - BLOCK
      ?auto_297458 - BLOCK
      ?auto_297459 - BLOCK
    )
    :vars
    (
      ?auto_297460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297459 ?auto_297460 ) ( ON-TABLE ?auto_297451 ) ( ON ?auto_297452 ?auto_297451 ) ( ON ?auto_297453 ?auto_297452 ) ( not ( = ?auto_297451 ?auto_297452 ) ) ( not ( = ?auto_297451 ?auto_297453 ) ) ( not ( = ?auto_297451 ?auto_297454 ) ) ( not ( = ?auto_297451 ?auto_297455 ) ) ( not ( = ?auto_297451 ?auto_297456 ) ) ( not ( = ?auto_297451 ?auto_297457 ) ) ( not ( = ?auto_297451 ?auto_297458 ) ) ( not ( = ?auto_297451 ?auto_297459 ) ) ( not ( = ?auto_297451 ?auto_297460 ) ) ( not ( = ?auto_297452 ?auto_297453 ) ) ( not ( = ?auto_297452 ?auto_297454 ) ) ( not ( = ?auto_297452 ?auto_297455 ) ) ( not ( = ?auto_297452 ?auto_297456 ) ) ( not ( = ?auto_297452 ?auto_297457 ) ) ( not ( = ?auto_297452 ?auto_297458 ) ) ( not ( = ?auto_297452 ?auto_297459 ) ) ( not ( = ?auto_297452 ?auto_297460 ) ) ( not ( = ?auto_297453 ?auto_297454 ) ) ( not ( = ?auto_297453 ?auto_297455 ) ) ( not ( = ?auto_297453 ?auto_297456 ) ) ( not ( = ?auto_297453 ?auto_297457 ) ) ( not ( = ?auto_297453 ?auto_297458 ) ) ( not ( = ?auto_297453 ?auto_297459 ) ) ( not ( = ?auto_297453 ?auto_297460 ) ) ( not ( = ?auto_297454 ?auto_297455 ) ) ( not ( = ?auto_297454 ?auto_297456 ) ) ( not ( = ?auto_297454 ?auto_297457 ) ) ( not ( = ?auto_297454 ?auto_297458 ) ) ( not ( = ?auto_297454 ?auto_297459 ) ) ( not ( = ?auto_297454 ?auto_297460 ) ) ( not ( = ?auto_297455 ?auto_297456 ) ) ( not ( = ?auto_297455 ?auto_297457 ) ) ( not ( = ?auto_297455 ?auto_297458 ) ) ( not ( = ?auto_297455 ?auto_297459 ) ) ( not ( = ?auto_297455 ?auto_297460 ) ) ( not ( = ?auto_297456 ?auto_297457 ) ) ( not ( = ?auto_297456 ?auto_297458 ) ) ( not ( = ?auto_297456 ?auto_297459 ) ) ( not ( = ?auto_297456 ?auto_297460 ) ) ( not ( = ?auto_297457 ?auto_297458 ) ) ( not ( = ?auto_297457 ?auto_297459 ) ) ( not ( = ?auto_297457 ?auto_297460 ) ) ( not ( = ?auto_297458 ?auto_297459 ) ) ( not ( = ?auto_297458 ?auto_297460 ) ) ( not ( = ?auto_297459 ?auto_297460 ) ) ( ON ?auto_297458 ?auto_297459 ) ( ON ?auto_297457 ?auto_297458 ) ( ON ?auto_297456 ?auto_297457 ) ( ON ?auto_297455 ?auto_297456 ) ( CLEAR ?auto_297453 ) ( ON ?auto_297454 ?auto_297455 ) ( CLEAR ?auto_297454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_297451 ?auto_297452 ?auto_297453 ?auto_297454 )
      ( MAKE-9PILE ?auto_297451 ?auto_297452 ?auto_297453 ?auto_297454 ?auto_297455 ?auto_297456 ?auto_297457 ?auto_297458 ?auto_297459 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_297470 - BLOCK
      ?auto_297471 - BLOCK
      ?auto_297472 - BLOCK
      ?auto_297473 - BLOCK
      ?auto_297474 - BLOCK
      ?auto_297475 - BLOCK
      ?auto_297476 - BLOCK
      ?auto_297477 - BLOCK
      ?auto_297478 - BLOCK
    )
    :vars
    (
      ?auto_297479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297478 ?auto_297479 ) ( ON-TABLE ?auto_297470 ) ( ON ?auto_297471 ?auto_297470 ) ( not ( = ?auto_297470 ?auto_297471 ) ) ( not ( = ?auto_297470 ?auto_297472 ) ) ( not ( = ?auto_297470 ?auto_297473 ) ) ( not ( = ?auto_297470 ?auto_297474 ) ) ( not ( = ?auto_297470 ?auto_297475 ) ) ( not ( = ?auto_297470 ?auto_297476 ) ) ( not ( = ?auto_297470 ?auto_297477 ) ) ( not ( = ?auto_297470 ?auto_297478 ) ) ( not ( = ?auto_297470 ?auto_297479 ) ) ( not ( = ?auto_297471 ?auto_297472 ) ) ( not ( = ?auto_297471 ?auto_297473 ) ) ( not ( = ?auto_297471 ?auto_297474 ) ) ( not ( = ?auto_297471 ?auto_297475 ) ) ( not ( = ?auto_297471 ?auto_297476 ) ) ( not ( = ?auto_297471 ?auto_297477 ) ) ( not ( = ?auto_297471 ?auto_297478 ) ) ( not ( = ?auto_297471 ?auto_297479 ) ) ( not ( = ?auto_297472 ?auto_297473 ) ) ( not ( = ?auto_297472 ?auto_297474 ) ) ( not ( = ?auto_297472 ?auto_297475 ) ) ( not ( = ?auto_297472 ?auto_297476 ) ) ( not ( = ?auto_297472 ?auto_297477 ) ) ( not ( = ?auto_297472 ?auto_297478 ) ) ( not ( = ?auto_297472 ?auto_297479 ) ) ( not ( = ?auto_297473 ?auto_297474 ) ) ( not ( = ?auto_297473 ?auto_297475 ) ) ( not ( = ?auto_297473 ?auto_297476 ) ) ( not ( = ?auto_297473 ?auto_297477 ) ) ( not ( = ?auto_297473 ?auto_297478 ) ) ( not ( = ?auto_297473 ?auto_297479 ) ) ( not ( = ?auto_297474 ?auto_297475 ) ) ( not ( = ?auto_297474 ?auto_297476 ) ) ( not ( = ?auto_297474 ?auto_297477 ) ) ( not ( = ?auto_297474 ?auto_297478 ) ) ( not ( = ?auto_297474 ?auto_297479 ) ) ( not ( = ?auto_297475 ?auto_297476 ) ) ( not ( = ?auto_297475 ?auto_297477 ) ) ( not ( = ?auto_297475 ?auto_297478 ) ) ( not ( = ?auto_297475 ?auto_297479 ) ) ( not ( = ?auto_297476 ?auto_297477 ) ) ( not ( = ?auto_297476 ?auto_297478 ) ) ( not ( = ?auto_297476 ?auto_297479 ) ) ( not ( = ?auto_297477 ?auto_297478 ) ) ( not ( = ?auto_297477 ?auto_297479 ) ) ( not ( = ?auto_297478 ?auto_297479 ) ) ( ON ?auto_297477 ?auto_297478 ) ( ON ?auto_297476 ?auto_297477 ) ( ON ?auto_297475 ?auto_297476 ) ( ON ?auto_297474 ?auto_297475 ) ( ON ?auto_297473 ?auto_297474 ) ( CLEAR ?auto_297471 ) ( ON ?auto_297472 ?auto_297473 ) ( CLEAR ?auto_297472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_297470 ?auto_297471 ?auto_297472 )
      ( MAKE-9PILE ?auto_297470 ?auto_297471 ?auto_297472 ?auto_297473 ?auto_297474 ?auto_297475 ?auto_297476 ?auto_297477 ?auto_297478 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_297489 - BLOCK
      ?auto_297490 - BLOCK
      ?auto_297491 - BLOCK
      ?auto_297492 - BLOCK
      ?auto_297493 - BLOCK
      ?auto_297494 - BLOCK
      ?auto_297495 - BLOCK
      ?auto_297496 - BLOCK
      ?auto_297497 - BLOCK
    )
    :vars
    (
      ?auto_297498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297497 ?auto_297498 ) ( ON-TABLE ?auto_297489 ) ( ON ?auto_297490 ?auto_297489 ) ( not ( = ?auto_297489 ?auto_297490 ) ) ( not ( = ?auto_297489 ?auto_297491 ) ) ( not ( = ?auto_297489 ?auto_297492 ) ) ( not ( = ?auto_297489 ?auto_297493 ) ) ( not ( = ?auto_297489 ?auto_297494 ) ) ( not ( = ?auto_297489 ?auto_297495 ) ) ( not ( = ?auto_297489 ?auto_297496 ) ) ( not ( = ?auto_297489 ?auto_297497 ) ) ( not ( = ?auto_297489 ?auto_297498 ) ) ( not ( = ?auto_297490 ?auto_297491 ) ) ( not ( = ?auto_297490 ?auto_297492 ) ) ( not ( = ?auto_297490 ?auto_297493 ) ) ( not ( = ?auto_297490 ?auto_297494 ) ) ( not ( = ?auto_297490 ?auto_297495 ) ) ( not ( = ?auto_297490 ?auto_297496 ) ) ( not ( = ?auto_297490 ?auto_297497 ) ) ( not ( = ?auto_297490 ?auto_297498 ) ) ( not ( = ?auto_297491 ?auto_297492 ) ) ( not ( = ?auto_297491 ?auto_297493 ) ) ( not ( = ?auto_297491 ?auto_297494 ) ) ( not ( = ?auto_297491 ?auto_297495 ) ) ( not ( = ?auto_297491 ?auto_297496 ) ) ( not ( = ?auto_297491 ?auto_297497 ) ) ( not ( = ?auto_297491 ?auto_297498 ) ) ( not ( = ?auto_297492 ?auto_297493 ) ) ( not ( = ?auto_297492 ?auto_297494 ) ) ( not ( = ?auto_297492 ?auto_297495 ) ) ( not ( = ?auto_297492 ?auto_297496 ) ) ( not ( = ?auto_297492 ?auto_297497 ) ) ( not ( = ?auto_297492 ?auto_297498 ) ) ( not ( = ?auto_297493 ?auto_297494 ) ) ( not ( = ?auto_297493 ?auto_297495 ) ) ( not ( = ?auto_297493 ?auto_297496 ) ) ( not ( = ?auto_297493 ?auto_297497 ) ) ( not ( = ?auto_297493 ?auto_297498 ) ) ( not ( = ?auto_297494 ?auto_297495 ) ) ( not ( = ?auto_297494 ?auto_297496 ) ) ( not ( = ?auto_297494 ?auto_297497 ) ) ( not ( = ?auto_297494 ?auto_297498 ) ) ( not ( = ?auto_297495 ?auto_297496 ) ) ( not ( = ?auto_297495 ?auto_297497 ) ) ( not ( = ?auto_297495 ?auto_297498 ) ) ( not ( = ?auto_297496 ?auto_297497 ) ) ( not ( = ?auto_297496 ?auto_297498 ) ) ( not ( = ?auto_297497 ?auto_297498 ) ) ( ON ?auto_297496 ?auto_297497 ) ( ON ?auto_297495 ?auto_297496 ) ( ON ?auto_297494 ?auto_297495 ) ( ON ?auto_297493 ?auto_297494 ) ( ON ?auto_297492 ?auto_297493 ) ( CLEAR ?auto_297490 ) ( ON ?auto_297491 ?auto_297492 ) ( CLEAR ?auto_297491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_297489 ?auto_297490 ?auto_297491 )
      ( MAKE-9PILE ?auto_297489 ?auto_297490 ?auto_297491 ?auto_297492 ?auto_297493 ?auto_297494 ?auto_297495 ?auto_297496 ?auto_297497 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_297508 - BLOCK
      ?auto_297509 - BLOCK
      ?auto_297510 - BLOCK
      ?auto_297511 - BLOCK
      ?auto_297512 - BLOCK
      ?auto_297513 - BLOCK
      ?auto_297514 - BLOCK
      ?auto_297515 - BLOCK
      ?auto_297516 - BLOCK
    )
    :vars
    (
      ?auto_297517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297516 ?auto_297517 ) ( ON-TABLE ?auto_297508 ) ( not ( = ?auto_297508 ?auto_297509 ) ) ( not ( = ?auto_297508 ?auto_297510 ) ) ( not ( = ?auto_297508 ?auto_297511 ) ) ( not ( = ?auto_297508 ?auto_297512 ) ) ( not ( = ?auto_297508 ?auto_297513 ) ) ( not ( = ?auto_297508 ?auto_297514 ) ) ( not ( = ?auto_297508 ?auto_297515 ) ) ( not ( = ?auto_297508 ?auto_297516 ) ) ( not ( = ?auto_297508 ?auto_297517 ) ) ( not ( = ?auto_297509 ?auto_297510 ) ) ( not ( = ?auto_297509 ?auto_297511 ) ) ( not ( = ?auto_297509 ?auto_297512 ) ) ( not ( = ?auto_297509 ?auto_297513 ) ) ( not ( = ?auto_297509 ?auto_297514 ) ) ( not ( = ?auto_297509 ?auto_297515 ) ) ( not ( = ?auto_297509 ?auto_297516 ) ) ( not ( = ?auto_297509 ?auto_297517 ) ) ( not ( = ?auto_297510 ?auto_297511 ) ) ( not ( = ?auto_297510 ?auto_297512 ) ) ( not ( = ?auto_297510 ?auto_297513 ) ) ( not ( = ?auto_297510 ?auto_297514 ) ) ( not ( = ?auto_297510 ?auto_297515 ) ) ( not ( = ?auto_297510 ?auto_297516 ) ) ( not ( = ?auto_297510 ?auto_297517 ) ) ( not ( = ?auto_297511 ?auto_297512 ) ) ( not ( = ?auto_297511 ?auto_297513 ) ) ( not ( = ?auto_297511 ?auto_297514 ) ) ( not ( = ?auto_297511 ?auto_297515 ) ) ( not ( = ?auto_297511 ?auto_297516 ) ) ( not ( = ?auto_297511 ?auto_297517 ) ) ( not ( = ?auto_297512 ?auto_297513 ) ) ( not ( = ?auto_297512 ?auto_297514 ) ) ( not ( = ?auto_297512 ?auto_297515 ) ) ( not ( = ?auto_297512 ?auto_297516 ) ) ( not ( = ?auto_297512 ?auto_297517 ) ) ( not ( = ?auto_297513 ?auto_297514 ) ) ( not ( = ?auto_297513 ?auto_297515 ) ) ( not ( = ?auto_297513 ?auto_297516 ) ) ( not ( = ?auto_297513 ?auto_297517 ) ) ( not ( = ?auto_297514 ?auto_297515 ) ) ( not ( = ?auto_297514 ?auto_297516 ) ) ( not ( = ?auto_297514 ?auto_297517 ) ) ( not ( = ?auto_297515 ?auto_297516 ) ) ( not ( = ?auto_297515 ?auto_297517 ) ) ( not ( = ?auto_297516 ?auto_297517 ) ) ( ON ?auto_297515 ?auto_297516 ) ( ON ?auto_297514 ?auto_297515 ) ( ON ?auto_297513 ?auto_297514 ) ( ON ?auto_297512 ?auto_297513 ) ( ON ?auto_297511 ?auto_297512 ) ( ON ?auto_297510 ?auto_297511 ) ( CLEAR ?auto_297508 ) ( ON ?auto_297509 ?auto_297510 ) ( CLEAR ?auto_297509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_297508 ?auto_297509 )
      ( MAKE-9PILE ?auto_297508 ?auto_297509 ?auto_297510 ?auto_297511 ?auto_297512 ?auto_297513 ?auto_297514 ?auto_297515 ?auto_297516 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_297527 - BLOCK
      ?auto_297528 - BLOCK
      ?auto_297529 - BLOCK
      ?auto_297530 - BLOCK
      ?auto_297531 - BLOCK
      ?auto_297532 - BLOCK
      ?auto_297533 - BLOCK
      ?auto_297534 - BLOCK
      ?auto_297535 - BLOCK
    )
    :vars
    (
      ?auto_297536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297535 ?auto_297536 ) ( ON-TABLE ?auto_297527 ) ( not ( = ?auto_297527 ?auto_297528 ) ) ( not ( = ?auto_297527 ?auto_297529 ) ) ( not ( = ?auto_297527 ?auto_297530 ) ) ( not ( = ?auto_297527 ?auto_297531 ) ) ( not ( = ?auto_297527 ?auto_297532 ) ) ( not ( = ?auto_297527 ?auto_297533 ) ) ( not ( = ?auto_297527 ?auto_297534 ) ) ( not ( = ?auto_297527 ?auto_297535 ) ) ( not ( = ?auto_297527 ?auto_297536 ) ) ( not ( = ?auto_297528 ?auto_297529 ) ) ( not ( = ?auto_297528 ?auto_297530 ) ) ( not ( = ?auto_297528 ?auto_297531 ) ) ( not ( = ?auto_297528 ?auto_297532 ) ) ( not ( = ?auto_297528 ?auto_297533 ) ) ( not ( = ?auto_297528 ?auto_297534 ) ) ( not ( = ?auto_297528 ?auto_297535 ) ) ( not ( = ?auto_297528 ?auto_297536 ) ) ( not ( = ?auto_297529 ?auto_297530 ) ) ( not ( = ?auto_297529 ?auto_297531 ) ) ( not ( = ?auto_297529 ?auto_297532 ) ) ( not ( = ?auto_297529 ?auto_297533 ) ) ( not ( = ?auto_297529 ?auto_297534 ) ) ( not ( = ?auto_297529 ?auto_297535 ) ) ( not ( = ?auto_297529 ?auto_297536 ) ) ( not ( = ?auto_297530 ?auto_297531 ) ) ( not ( = ?auto_297530 ?auto_297532 ) ) ( not ( = ?auto_297530 ?auto_297533 ) ) ( not ( = ?auto_297530 ?auto_297534 ) ) ( not ( = ?auto_297530 ?auto_297535 ) ) ( not ( = ?auto_297530 ?auto_297536 ) ) ( not ( = ?auto_297531 ?auto_297532 ) ) ( not ( = ?auto_297531 ?auto_297533 ) ) ( not ( = ?auto_297531 ?auto_297534 ) ) ( not ( = ?auto_297531 ?auto_297535 ) ) ( not ( = ?auto_297531 ?auto_297536 ) ) ( not ( = ?auto_297532 ?auto_297533 ) ) ( not ( = ?auto_297532 ?auto_297534 ) ) ( not ( = ?auto_297532 ?auto_297535 ) ) ( not ( = ?auto_297532 ?auto_297536 ) ) ( not ( = ?auto_297533 ?auto_297534 ) ) ( not ( = ?auto_297533 ?auto_297535 ) ) ( not ( = ?auto_297533 ?auto_297536 ) ) ( not ( = ?auto_297534 ?auto_297535 ) ) ( not ( = ?auto_297534 ?auto_297536 ) ) ( not ( = ?auto_297535 ?auto_297536 ) ) ( ON ?auto_297534 ?auto_297535 ) ( ON ?auto_297533 ?auto_297534 ) ( ON ?auto_297532 ?auto_297533 ) ( ON ?auto_297531 ?auto_297532 ) ( ON ?auto_297530 ?auto_297531 ) ( ON ?auto_297529 ?auto_297530 ) ( CLEAR ?auto_297527 ) ( ON ?auto_297528 ?auto_297529 ) ( CLEAR ?auto_297528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_297527 ?auto_297528 )
      ( MAKE-9PILE ?auto_297527 ?auto_297528 ?auto_297529 ?auto_297530 ?auto_297531 ?auto_297532 ?auto_297533 ?auto_297534 ?auto_297535 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_297546 - BLOCK
      ?auto_297547 - BLOCK
      ?auto_297548 - BLOCK
      ?auto_297549 - BLOCK
      ?auto_297550 - BLOCK
      ?auto_297551 - BLOCK
      ?auto_297552 - BLOCK
      ?auto_297553 - BLOCK
      ?auto_297554 - BLOCK
    )
    :vars
    (
      ?auto_297555 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297554 ?auto_297555 ) ( not ( = ?auto_297546 ?auto_297547 ) ) ( not ( = ?auto_297546 ?auto_297548 ) ) ( not ( = ?auto_297546 ?auto_297549 ) ) ( not ( = ?auto_297546 ?auto_297550 ) ) ( not ( = ?auto_297546 ?auto_297551 ) ) ( not ( = ?auto_297546 ?auto_297552 ) ) ( not ( = ?auto_297546 ?auto_297553 ) ) ( not ( = ?auto_297546 ?auto_297554 ) ) ( not ( = ?auto_297546 ?auto_297555 ) ) ( not ( = ?auto_297547 ?auto_297548 ) ) ( not ( = ?auto_297547 ?auto_297549 ) ) ( not ( = ?auto_297547 ?auto_297550 ) ) ( not ( = ?auto_297547 ?auto_297551 ) ) ( not ( = ?auto_297547 ?auto_297552 ) ) ( not ( = ?auto_297547 ?auto_297553 ) ) ( not ( = ?auto_297547 ?auto_297554 ) ) ( not ( = ?auto_297547 ?auto_297555 ) ) ( not ( = ?auto_297548 ?auto_297549 ) ) ( not ( = ?auto_297548 ?auto_297550 ) ) ( not ( = ?auto_297548 ?auto_297551 ) ) ( not ( = ?auto_297548 ?auto_297552 ) ) ( not ( = ?auto_297548 ?auto_297553 ) ) ( not ( = ?auto_297548 ?auto_297554 ) ) ( not ( = ?auto_297548 ?auto_297555 ) ) ( not ( = ?auto_297549 ?auto_297550 ) ) ( not ( = ?auto_297549 ?auto_297551 ) ) ( not ( = ?auto_297549 ?auto_297552 ) ) ( not ( = ?auto_297549 ?auto_297553 ) ) ( not ( = ?auto_297549 ?auto_297554 ) ) ( not ( = ?auto_297549 ?auto_297555 ) ) ( not ( = ?auto_297550 ?auto_297551 ) ) ( not ( = ?auto_297550 ?auto_297552 ) ) ( not ( = ?auto_297550 ?auto_297553 ) ) ( not ( = ?auto_297550 ?auto_297554 ) ) ( not ( = ?auto_297550 ?auto_297555 ) ) ( not ( = ?auto_297551 ?auto_297552 ) ) ( not ( = ?auto_297551 ?auto_297553 ) ) ( not ( = ?auto_297551 ?auto_297554 ) ) ( not ( = ?auto_297551 ?auto_297555 ) ) ( not ( = ?auto_297552 ?auto_297553 ) ) ( not ( = ?auto_297552 ?auto_297554 ) ) ( not ( = ?auto_297552 ?auto_297555 ) ) ( not ( = ?auto_297553 ?auto_297554 ) ) ( not ( = ?auto_297553 ?auto_297555 ) ) ( not ( = ?auto_297554 ?auto_297555 ) ) ( ON ?auto_297553 ?auto_297554 ) ( ON ?auto_297552 ?auto_297553 ) ( ON ?auto_297551 ?auto_297552 ) ( ON ?auto_297550 ?auto_297551 ) ( ON ?auto_297549 ?auto_297550 ) ( ON ?auto_297548 ?auto_297549 ) ( ON ?auto_297547 ?auto_297548 ) ( ON ?auto_297546 ?auto_297547 ) ( CLEAR ?auto_297546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_297546 )
      ( MAKE-9PILE ?auto_297546 ?auto_297547 ?auto_297548 ?auto_297549 ?auto_297550 ?auto_297551 ?auto_297552 ?auto_297553 ?auto_297554 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_297565 - BLOCK
      ?auto_297566 - BLOCK
      ?auto_297567 - BLOCK
      ?auto_297568 - BLOCK
      ?auto_297569 - BLOCK
      ?auto_297570 - BLOCK
      ?auto_297571 - BLOCK
      ?auto_297572 - BLOCK
      ?auto_297573 - BLOCK
    )
    :vars
    (
      ?auto_297574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297573 ?auto_297574 ) ( not ( = ?auto_297565 ?auto_297566 ) ) ( not ( = ?auto_297565 ?auto_297567 ) ) ( not ( = ?auto_297565 ?auto_297568 ) ) ( not ( = ?auto_297565 ?auto_297569 ) ) ( not ( = ?auto_297565 ?auto_297570 ) ) ( not ( = ?auto_297565 ?auto_297571 ) ) ( not ( = ?auto_297565 ?auto_297572 ) ) ( not ( = ?auto_297565 ?auto_297573 ) ) ( not ( = ?auto_297565 ?auto_297574 ) ) ( not ( = ?auto_297566 ?auto_297567 ) ) ( not ( = ?auto_297566 ?auto_297568 ) ) ( not ( = ?auto_297566 ?auto_297569 ) ) ( not ( = ?auto_297566 ?auto_297570 ) ) ( not ( = ?auto_297566 ?auto_297571 ) ) ( not ( = ?auto_297566 ?auto_297572 ) ) ( not ( = ?auto_297566 ?auto_297573 ) ) ( not ( = ?auto_297566 ?auto_297574 ) ) ( not ( = ?auto_297567 ?auto_297568 ) ) ( not ( = ?auto_297567 ?auto_297569 ) ) ( not ( = ?auto_297567 ?auto_297570 ) ) ( not ( = ?auto_297567 ?auto_297571 ) ) ( not ( = ?auto_297567 ?auto_297572 ) ) ( not ( = ?auto_297567 ?auto_297573 ) ) ( not ( = ?auto_297567 ?auto_297574 ) ) ( not ( = ?auto_297568 ?auto_297569 ) ) ( not ( = ?auto_297568 ?auto_297570 ) ) ( not ( = ?auto_297568 ?auto_297571 ) ) ( not ( = ?auto_297568 ?auto_297572 ) ) ( not ( = ?auto_297568 ?auto_297573 ) ) ( not ( = ?auto_297568 ?auto_297574 ) ) ( not ( = ?auto_297569 ?auto_297570 ) ) ( not ( = ?auto_297569 ?auto_297571 ) ) ( not ( = ?auto_297569 ?auto_297572 ) ) ( not ( = ?auto_297569 ?auto_297573 ) ) ( not ( = ?auto_297569 ?auto_297574 ) ) ( not ( = ?auto_297570 ?auto_297571 ) ) ( not ( = ?auto_297570 ?auto_297572 ) ) ( not ( = ?auto_297570 ?auto_297573 ) ) ( not ( = ?auto_297570 ?auto_297574 ) ) ( not ( = ?auto_297571 ?auto_297572 ) ) ( not ( = ?auto_297571 ?auto_297573 ) ) ( not ( = ?auto_297571 ?auto_297574 ) ) ( not ( = ?auto_297572 ?auto_297573 ) ) ( not ( = ?auto_297572 ?auto_297574 ) ) ( not ( = ?auto_297573 ?auto_297574 ) ) ( ON ?auto_297572 ?auto_297573 ) ( ON ?auto_297571 ?auto_297572 ) ( ON ?auto_297570 ?auto_297571 ) ( ON ?auto_297569 ?auto_297570 ) ( ON ?auto_297568 ?auto_297569 ) ( ON ?auto_297567 ?auto_297568 ) ( ON ?auto_297566 ?auto_297567 ) ( ON ?auto_297565 ?auto_297566 ) ( CLEAR ?auto_297565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_297565 )
      ( MAKE-9PILE ?auto_297565 ?auto_297566 ?auto_297567 ?auto_297568 ?auto_297569 ?auto_297570 ?auto_297571 ?auto_297572 ?auto_297573 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_297585 - BLOCK
      ?auto_297586 - BLOCK
      ?auto_297587 - BLOCK
      ?auto_297588 - BLOCK
      ?auto_297589 - BLOCK
      ?auto_297590 - BLOCK
      ?auto_297591 - BLOCK
      ?auto_297592 - BLOCK
      ?auto_297593 - BLOCK
      ?auto_297594 - BLOCK
    )
    :vars
    (
      ?auto_297595 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_297593 ) ( ON ?auto_297594 ?auto_297595 ) ( CLEAR ?auto_297594 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_297585 ) ( ON ?auto_297586 ?auto_297585 ) ( ON ?auto_297587 ?auto_297586 ) ( ON ?auto_297588 ?auto_297587 ) ( ON ?auto_297589 ?auto_297588 ) ( ON ?auto_297590 ?auto_297589 ) ( ON ?auto_297591 ?auto_297590 ) ( ON ?auto_297592 ?auto_297591 ) ( ON ?auto_297593 ?auto_297592 ) ( not ( = ?auto_297585 ?auto_297586 ) ) ( not ( = ?auto_297585 ?auto_297587 ) ) ( not ( = ?auto_297585 ?auto_297588 ) ) ( not ( = ?auto_297585 ?auto_297589 ) ) ( not ( = ?auto_297585 ?auto_297590 ) ) ( not ( = ?auto_297585 ?auto_297591 ) ) ( not ( = ?auto_297585 ?auto_297592 ) ) ( not ( = ?auto_297585 ?auto_297593 ) ) ( not ( = ?auto_297585 ?auto_297594 ) ) ( not ( = ?auto_297585 ?auto_297595 ) ) ( not ( = ?auto_297586 ?auto_297587 ) ) ( not ( = ?auto_297586 ?auto_297588 ) ) ( not ( = ?auto_297586 ?auto_297589 ) ) ( not ( = ?auto_297586 ?auto_297590 ) ) ( not ( = ?auto_297586 ?auto_297591 ) ) ( not ( = ?auto_297586 ?auto_297592 ) ) ( not ( = ?auto_297586 ?auto_297593 ) ) ( not ( = ?auto_297586 ?auto_297594 ) ) ( not ( = ?auto_297586 ?auto_297595 ) ) ( not ( = ?auto_297587 ?auto_297588 ) ) ( not ( = ?auto_297587 ?auto_297589 ) ) ( not ( = ?auto_297587 ?auto_297590 ) ) ( not ( = ?auto_297587 ?auto_297591 ) ) ( not ( = ?auto_297587 ?auto_297592 ) ) ( not ( = ?auto_297587 ?auto_297593 ) ) ( not ( = ?auto_297587 ?auto_297594 ) ) ( not ( = ?auto_297587 ?auto_297595 ) ) ( not ( = ?auto_297588 ?auto_297589 ) ) ( not ( = ?auto_297588 ?auto_297590 ) ) ( not ( = ?auto_297588 ?auto_297591 ) ) ( not ( = ?auto_297588 ?auto_297592 ) ) ( not ( = ?auto_297588 ?auto_297593 ) ) ( not ( = ?auto_297588 ?auto_297594 ) ) ( not ( = ?auto_297588 ?auto_297595 ) ) ( not ( = ?auto_297589 ?auto_297590 ) ) ( not ( = ?auto_297589 ?auto_297591 ) ) ( not ( = ?auto_297589 ?auto_297592 ) ) ( not ( = ?auto_297589 ?auto_297593 ) ) ( not ( = ?auto_297589 ?auto_297594 ) ) ( not ( = ?auto_297589 ?auto_297595 ) ) ( not ( = ?auto_297590 ?auto_297591 ) ) ( not ( = ?auto_297590 ?auto_297592 ) ) ( not ( = ?auto_297590 ?auto_297593 ) ) ( not ( = ?auto_297590 ?auto_297594 ) ) ( not ( = ?auto_297590 ?auto_297595 ) ) ( not ( = ?auto_297591 ?auto_297592 ) ) ( not ( = ?auto_297591 ?auto_297593 ) ) ( not ( = ?auto_297591 ?auto_297594 ) ) ( not ( = ?auto_297591 ?auto_297595 ) ) ( not ( = ?auto_297592 ?auto_297593 ) ) ( not ( = ?auto_297592 ?auto_297594 ) ) ( not ( = ?auto_297592 ?auto_297595 ) ) ( not ( = ?auto_297593 ?auto_297594 ) ) ( not ( = ?auto_297593 ?auto_297595 ) ) ( not ( = ?auto_297594 ?auto_297595 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_297594 ?auto_297595 )
      ( !STACK ?auto_297594 ?auto_297593 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_297606 - BLOCK
      ?auto_297607 - BLOCK
      ?auto_297608 - BLOCK
      ?auto_297609 - BLOCK
      ?auto_297610 - BLOCK
      ?auto_297611 - BLOCK
      ?auto_297612 - BLOCK
      ?auto_297613 - BLOCK
      ?auto_297614 - BLOCK
      ?auto_297615 - BLOCK
    )
    :vars
    (
      ?auto_297616 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_297614 ) ( ON ?auto_297615 ?auto_297616 ) ( CLEAR ?auto_297615 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_297606 ) ( ON ?auto_297607 ?auto_297606 ) ( ON ?auto_297608 ?auto_297607 ) ( ON ?auto_297609 ?auto_297608 ) ( ON ?auto_297610 ?auto_297609 ) ( ON ?auto_297611 ?auto_297610 ) ( ON ?auto_297612 ?auto_297611 ) ( ON ?auto_297613 ?auto_297612 ) ( ON ?auto_297614 ?auto_297613 ) ( not ( = ?auto_297606 ?auto_297607 ) ) ( not ( = ?auto_297606 ?auto_297608 ) ) ( not ( = ?auto_297606 ?auto_297609 ) ) ( not ( = ?auto_297606 ?auto_297610 ) ) ( not ( = ?auto_297606 ?auto_297611 ) ) ( not ( = ?auto_297606 ?auto_297612 ) ) ( not ( = ?auto_297606 ?auto_297613 ) ) ( not ( = ?auto_297606 ?auto_297614 ) ) ( not ( = ?auto_297606 ?auto_297615 ) ) ( not ( = ?auto_297606 ?auto_297616 ) ) ( not ( = ?auto_297607 ?auto_297608 ) ) ( not ( = ?auto_297607 ?auto_297609 ) ) ( not ( = ?auto_297607 ?auto_297610 ) ) ( not ( = ?auto_297607 ?auto_297611 ) ) ( not ( = ?auto_297607 ?auto_297612 ) ) ( not ( = ?auto_297607 ?auto_297613 ) ) ( not ( = ?auto_297607 ?auto_297614 ) ) ( not ( = ?auto_297607 ?auto_297615 ) ) ( not ( = ?auto_297607 ?auto_297616 ) ) ( not ( = ?auto_297608 ?auto_297609 ) ) ( not ( = ?auto_297608 ?auto_297610 ) ) ( not ( = ?auto_297608 ?auto_297611 ) ) ( not ( = ?auto_297608 ?auto_297612 ) ) ( not ( = ?auto_297608 ?auto_297613 ) ) ( not ( = ?auto_297608 ?auto_297614 ) ) ( not ( = ?auto_297608 ?auto_297615 ) ) ( not ( = ?auto_297608 ?auto_297616 ) ) ( not ( = ?auto_297609 ?auto_297610 ) ) ( not ( = ?auto_297609 ?auto_297611 ) ) ( not ( = ?auto_297609 ?auto_297612 ) ) ( not ( = ?auto_297609 ?auto_297613 ) ) ( not ( = ?auto_297609 ?auto_297614 ) ) ( not ( = ?auto_297609 ?auto_297615 ) ) ( not ( = ?auto_297609 ?auto_297616 ) ) ( not ( = ?auto_297610 ?auto_297611 ) ) ( not ( = ?auto_297610 ?auto_297612 ) ) ( not ( = ?auto_297610 ?auto_297613 ) ) ( not ( = ?auto_297610 ?auto_297614 ) ) ( not ( = ?auto_297610 ?auto_297615 ) ) ( not ( = ?auto_297610 ?auto_297616 ) ) ( not ( = ?auto_297611 ?auto_297612 ) ) ( not ( = ?auto_297611 ?auto_297613 ) ) ( not ( = ?auto_297611 ?auto_297614 ) ) ( not ( = ?auto_297611 ?auto_297615 ) ) ( not ( = ?auto_297611 ?auto_297616 ) ) ( not ( = ?auto_297612 ?auto_297613 ) ) ( not ( = ?auto_297612 ?auto_297614 ) ) ( not ( = ?auto_297612 ?auto_297615 ) ) ( not ( = ?auto_297612 ?auto_297616 ) ) ( not ( = ?auto_297613 ?auto_297614 ) ) ( not ( = ?auto_297613 ?auto_297615 ) ) ( not ( = ?auto_297613 ?auto_297616 ) ) ( not ( = ?auto_297614 ?auto_297615 ) ) ( not ( = ?auto_297614 ?auto_297616 ) ) ( not ( = ?auto_297615 ?auto_297616 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_297615 ?auto_297616 )
      ( !STACK ?auto_297615 ?auto_297614 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_297627 - BLOCK
      ?auto_297628 - BLOCK
      ?auto_297629 - BLOCK
      ?auto_297630 - BLOCK
      ?auto_297631 - BLOCK
      ?auto_297632 - BLOCK
      ?auto_297633 - BLOCK
      ?auto_297634 - BLOCK
      ?auto_297635 - BLOCK
      ?auto_297636 - BLOCK
    )
    :vars
    (
      ?auto_297637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297636 ?auto_297637 ) ( ON-TABLE ?auto_297627 ) ( ON ?auto_297628 ?auto_297627 ) ( ON ?auto_297629 ?auto_297628 ) ( ON ?auto_297630 ?auto_297629 ) ( ON ?auto_297631 ?auto_297630 ) ( ON ?auto_297632 ?auto_297631 ) ( ON ?auto_297633 ?auto_297632 ) ( ON ?auto_297634 ?auto_297633 ) ( not ( = ?auto_297627 ?auto_297628 ) ) ( not ( = ?auto_297627 ?auto_297629 ) ) ( not ( = ?auto_297627 ?auto_297630 ) ) ( not ( = ?auto_297627 ?auto_297631 ) ) ( not ( = ?auto_297627 ?auto_297632 ) ) ( not ( = ?auto_297627 ?auto_297633 ) ) ( not ( = ?auto_297627 ?auto_297634 ) ) ( not ( = ?auto_297627 ?auto_297635 ) ) ( not ( = ?auto_297627 ?auto_297636 ) ) ( not ( = ?auto_297627 ?auto_297637 ) ) ( not ( = ?auto_297628 ?auto_297629 ) ) ( not ( = ?auto_297628 ?auto_297630 ) ) ( not ( = ?auto_297628 ?auto_297631 ) ) ( not ( = ?auto_297628 ?auto_297632 ) ) ( not ( = ?auto_297628 ?auto_297633 ) ) ( not ( = ?auto_297628 ?auto_297634 ) ) ( not ( = ?auto_297628 ?auto_297635 ) ) ( not ( = ?auto_297628 ?auto_297636 ) ) ( not ( = ?auto_297628 ?auto_297637 ) ) ( not ( = ?auto_297629 ?auto_297630 ) ) ( not ( = ?auto_297629 ?auto_297631 ) ) ( not ( = ?auto_297629 ?auto_297632 ) ) ( not ( = ?auto_297629 ?auto_297633 ) ) ( not ( = ?auto_297629 ?auto_297634 ) ) ( not ( = ?auto_297629 ?auto_297635 ) ) ( not ( = ?auto_297629 ?auto_297636 ) ) ( not ( = ?auto_297629 ?auto_297637 ) ) ( not ( = ?auto_297630 ?auto_297631 ) ) ( not ( = ?auto_297630 ?auto_297632 ) ) ( not ( = ?auto_297630 ?auto_297633 ) ) ( not ( = ?auto_297630 ?auto_297634 ) ) ( not ( = ?auto_297630 ?auto_297635 ) ) ( not ( = ?auto_297630 ?auto_297636 ) ) ( not ( = ?auto_297630 ?auto_297637 ) ) ( not ( = ?auto_297631 ?auto_297632 ) ) ( not ( = ?auto_297631 ?auto_297633 ) ) ( not ( = ?auto_297631 ?auto_297634 ) ) ( not ( = ?auto_297631 ?auto_297635 ) ) ( not ( = ?auto_297631 ?auto_297636 ) ) ( not ( = ?auto_297631 ?auto_297637 ) ) ( not ( = ?auto_297632 ?auto_297633 ) ) ( not ( = ?auto_297632 ?auto_297634 ) ) ( not ( = ?auto_297632 ?auto_297635 ) ) ( not ( = ?auto_297632 ?auto_297636 ) ) ( not ( = ?auto_297632 ?auto_297637 ) ) ( not ( = ?auto_297633 ?auto_297634 ) ) ( not ( = ?auto_297633 ?auto_297635 ) ) ( not ( = ?auto_297633 ?auto_297636 ) ) ( not ( = ?auto_297633 ?auto_297637 ) ) ( not ( = ?auto_297634 ?auto_297635 ) ) ( not ( = ?auto_297634 ?auto_297636 ) ) ( not ( = ?auto_297634 ?auto_297637 ) ) ( not ( = ?auto_297635 ?auto_297636 ) ) ( not ( = ?auto_297635 ?auto_297637 ) ) ( not ( = ?auto_297636 ?auto_297637 ) ) ( CLEAR ?auto_297634 ) ( ON ?auto_297635 ?auto_297636 ) ( CLEAR ?auto_297635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_297627 ?auto_297628 ?auto_297629 ?auto_297630 ?auto_297631 ?auto_297632 ?auto_297633 ?auto_297634 ?auto_297635 )
      ( MAKE-10PILE ?auto_297627 ?auto_297628 ?auto_297629 ?auto_297630 ?auto_297631 ?auto_297632 ?auto_297633 ?auto_297634 ?auto_297635 ?auto_297636 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_297648 - BLOCK
      ?auto_297649 - BLOCK
      ?auto_297650 - BLOCK
      ?auto_297651 - BLOCK
      ?auto_297652 - BLOCK
      ?auto_297653 - BLOCK
      ?auto_297654 - BLOCK
      ?auto_297655 - BLOCK
      ?auto_297656 - BLOCK
      ?auto_297657 - BLOCK
    )
    :vars
    (
      ?auto_297658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297657 ?auto_297658 ) ( ON-TABLE ?auto_297648 ) ( ON ?auto_297649 ?auto_297648 ) ( ON ?auto_297650 ?auto_297649 ) ( ON ?auto_297651 ?auto_297650 ) ( ON ?auto_297652 ?auto_297651 ) ( ON ?auto_297653 ?auto_297652 ) ( ON ?auto_297654 ?auto_297653 ) ( ON ?auto_297655 ?auto_297654 ) ( not ( = ?auto_297648 ?auto_297649 ) ) ( not ( = ?auto_297648 ?auto_297650 ) ) ( not ( = ?auto_297648 ?auto_297651 ) ) ( not ( = ?auto_297648 ?auto_297652 ) ) ( not ( = ?auto_297648 ?auto_297653 ) ) ( not ( = ?auto_297648 ?auto_297654 ) ) ( not ( = ?auto_297648 ?auto_297655 ) ) ( not ( = ?auto_297648 ?auto_297656 ) ) ( not ( = ?auto_297648 ?auto_297657 ) ) ( not ( = ?auto_297648 ?auto_297658 ) ) ( not ( = ?auto_297649 ?auto_297650 ) ) ( not ( = ?auto_297649 ?auto_297651 ) ) ( not ( = ?auto_297649 ?auto_297652 ) ) ( not ( = ?auto_297649 ?auto_297653 ) ) ( not ( = ?auto_297649 ?auto_297654 ) ) ( not ( = ?auto_297649 ?auto_297655 ) ) ( not ( = ?auto_297649 ?auto_297656 ) ) ( not ( = ?auto_297649 ?auto_297657 ) ) ( not ( = ?auto_297649 ?auto_297658 ) ) ( not ( = ?auto_297650 ?auto_297651 ) ) ( not ( = ?auto_297650 ?auto_297652 ) ) ( not ( = ?auto_297650 ?auto_297653 ) ) ( not ( = ?auto_297650 ?auto_297654 ) ) ( not ( = ?auto_297650 ?auto_297655 ) ) ( not ( = ?auto_297650 ?auto_297656 ) ) ( not ( = ?auto_297650 ?auto_297657 ) ) ( not ( = ?auto_297650 ?auto_297658 ) ) ( not ( = ?auto_297651 ?auto_297652 ) ) ( not ( = ?auto_297651 ?auto_297653 ) ) ( not ( = ?auto_297651 ?auto_297654 ) ) ( not ( = ?auto_297651 ?auto_297655 ) ) ( not ( = ?auto_297651 ?auto_297656 ) ) ( not ( = ?auto_297651 ?auto_297657 ) ) ( not ( = ?auto_297651 ?auto_297658 ) ) ( not ( = ?auto_297652 ?auto_297653 ) ) ( not ( = ?auto_297652 ?auto_297654 ) ) ( not ( = ?auto_297652 ?auto_297655 ) ) ( not ( = ?auto_297652 ?auto_297656 ) ) ( not ( = ?auto_297652 ?auto_297657 ) ) ( not ( = ?auto_297652 ?auto_297658 ) ) ( not ( = ?auto_297653 ?auto_297654 ) ) ( not ( = ?auto_297653 ?auto_297655 ) ) ( not ( = ?auto_297653 ?auto_297656 ) ) ( not ( = ?auto_297653 ?auto_297657 ) ) ( not ( = ?auto_297653 ?auto_297658 ) ) ( not ( = ?auto_297654 ?auto_297655 ) ) ( not ( = ?auto_297654 ?auto_297656 ) ) ( not ( = ?auto_297654 ?auto_297657 ) ) ( not ( = ?auto_297654 ?auto_297658 ) ) ( not ( = ?auto_297655 ?auto_297656 ) ) ( not ( = ?auto_297655 ?auto_297657 ) ) ( not ( = ?auto_297655 ?auto_297658 ) ) ( not ( = ?auto_297656 ?auto_297657 ) ) ( not ( = ?auto_297656 ?auto_297658 ) ) ( not ( = ?auto_297657 ?auto_297658 ) ) ( CLEAR ?auto_297655 ) ( ON ?auto_297656 ?auto_297657 ) ( CLEAR ?auto_297656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_297648 ?auto_297649 ?auto_297650 ?auto_297651 ?auto_297652 ?auto_297653 ?auto_297654 ?auto_297655 ?auto_297656 )
      ( MAKE-10PILE ?auto_297648 ?auto_297649 ?auto_297650 ?auto_297651 ?auto_297652 ?auto_297653 ?auto_297654 ?auto_297655 ?auto_297656 ?auto_297657 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_297669 - BLOCK
      ?auto_297670 - BLOCK
      ?auto_297671 - BLOCK
      ?auto_297672 - BLOCK
      ?auto_297673 - BLOCK
      ?auto_297674 - BLOCK
      ?auto_297675 - BLOCK
      ?auto_297676 - BLOCK
      ?auto_297677 - BLOCK
      ?auto_297678 - BLOCK
    )
    :vars
    (
      ?auto_297679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297678 ?auto_297679 ) ( ON-TABLE ?auto_297669 ) ( ON ?auto_297670 ?auto_297669 ) ( ON ?auto_297671 ?auto_297670 ) ( ON ?auto_297672 ?auto_297671 ) ( ON ?auto_297673 ?auto_297672 ) ( ON ?auto_297674 ?auto_297673 ) ( ON ?auto_297675 ?auto_297674 ) ( not ( = ?auto_297669 ?auto_297670 ) ) ( not ( = ?auto_297669 ?auto_297671 ) ) ( not ( = ?auto_297669 ?auto_297672 ) ) ( not ( = ?auto_297669 ?auto_297673 ) ) ( not ( = ?auto_297669 ?auto_297674 ) ) ( not ( = ?auto_297669 ?auto_297675 ) ) ( not ( = ?auto_297669 ?auto_297676 ) ) ( not ( = ?auto_297669 ?auto_297677 ) ) ( not ( = ?auto_297669 ?auto_297678 ) ) ( not ( = ?auto_297669 ?auto_297679 ) ) ( not ( = ?auto_297670 ?auto_297671 ) ) ( not ( = ?auto_297670 ?auto_297672 ) ) ( not ( = ?auto_297670 ?auto_297673 ) ) ( not ( = ?auto_297670 ?auto_297674 ) ) ( not ( = ?auto_297670 ?auto_297675 ) ) ( not ( = ?auto_297670 ?auto_297676 ) ) ( not ( = ?auto_297670 ?auto_297677 ) ) ( not ( = ?auto_297670 ?auto_297678 ) ) ( not ( = ?auto_297670 ?auto_297679 ) ) ( not ( = ?auto_297671 ?auto_297672 ) ) ( not ( = ?auto_297671 ?auto_297673 ) ) ( not ( = ?auto_297671 ?auto_297674 ) ) ( not ( = ?auto_297671 ?auto_297675 ) ) ( not ( = ?auto_297671 ?auto_297676 ) ) ( not ( = ?auto_297671 ?auto_297677 ) ) ( not ( = ?auto_297671 ?auto_297678 ) ) ( not ( = ?auto_297671 ?auto_297679 ) ) ( not ( = ?auto_297672 ?auto_297673 ) ) ( not ( = ?auto_297672 ?auto_297674 ) ) ( not ( = ?auto_297672 ?auto_297675 ) ) ( not ( = ?auto_297672 ?auto_297676 ) ) ( not ( = ?auto_297672 ?auto_297677 ) ) ( not ( = ?auto_297672 ?auto_297678 ) ) ( not ( = ?auto_297672 ?auto_297679 ) ) ( not ( = ?auto_297673 ?auto_297674 ) ) ( not ( = ?auto_297673 ?auto_297675 ) ) ( not ( = ?auto_297673 ?auto_297676 ) ) ( not ( = ?auto_297673 ?auto_297677 ) ) ( not ( = ?auto_297673 ?auto_297678 ) ) ( not ( = ?auto_297673 ?auto_297679 ) ) ( not ( = ?auto_297674 ?auto_297675 ) ) ( not ( = ?auto_297674 ?auto_297676 ) ) ( not ( = ?auto_297674 ?auto_297677 ) ) ( not ( = ?auto_297674 ?auto_297678 ) ) ( not ( = ?auto_297674 ?auto_297679 ) ) ( not ( = ?auto_297675 ?auto_297676 ) ) ( not ( = ?auto_297675 ?auto_297677 ) ) ( not ( = ?auto_297675 ?auto_297678 ) ) ( not ( = ?auto_297675 ?auto_297679 ) ) ( not ( = ?auto_297676 ?auto_297677 ) ) ( not ( = ?auto_297676 ?auto_297678 ) ) ( not ( = ?auto_297676 ?auto_297679 ) ) ( not ( = ?auto_297677 ?auto_297678 ) ) ( not ( = ?auto_297677 ?auto_297679 ) ) ( not ( = ?auto_297678 ?auto_297679 ) ) ( ON ?auto_297677 ?auto_297678 ) ( CLEAR ?auto_297675 ) ( ON ?auto_297676 ?auto_297677 ) ( CLEAR ?auto_297676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_297669 ?auto_297670 ?auto_297671 ?auto_297672 ?auto_297673 ?auto_297674 ?auto_297675 ?auto_297676 )
      ( MAKE-10PILE ?auto_297669 ?auto_297670 ?auto_297671 ?auto_297672 ?auto_297673 ?auto_297674 ?auto_297675 ?auto_297676 ?auto_297677 ?auto_297678 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_297690 - BLOCK
      ?auto_297691 - BLOCK
      ?auto_297692 - BLOCK
      ?auto_297693 - BLOCK
      ?auto_297694 - BLOCK
      ?auto_297695 - BLOCK
      ?auto_297696 - BLOCK
      ?auto_297697 - BLOCK
      ?auto_297698 - BLOCK
      ?auto_297699 - BLOCK
    )
    :vars
    (
      ?auto_297700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297699 ?auto_297700 ) ( ON-TABLE ?auto_297690 ) ( ON ?auto_297691 ?auto_297690 ) ( ON ?auto_297692 ?auto_297691 ) ( ON ?auto_297693 ?auto_297692 ) ( ON ?auto_297694 ?auto_297693 ) ( ON ?auto_297695 ?auto_297694 ) ( ON ?auto_297696 ?auto_297695 ) ( not ( = ?auto_297690 ?auto_297691 ) ) ( not ( = ?auto_297690 ?auto_297692 ) ) ( not ( = ?auto_297690 ?auto_297693 ) ) ( not ( = ?auto_297690 ?auto_297694 ) ) ( not ( = ?auto_297690 ?auto_297695 ) ) ( not ( = ?auto_297690 ?auto_297696 ) ) ( not ( = ?auto_297690 ?auto_297697 ) ) ( not ( = ?auto_297690 ?auto_297698 ) ) ( not ( = ?auto_297690 ?auto_297699 ) ) ( not ( = ?auto_297690 ?auto_297700 ) ) ( not ( = ?auto_297691 ?auto_297692 ) ) ( not ( = ?auto_297691 ?auto_297693 ) ) ( not ( = ?auto_297691 ?auto_297694 ) ) ( not ( = ?auto_297691 ?auto_297695 ) ) ( not ( = ?auto_297691 ?auto_297696 ) ) ( not ( = ?auto_297691 ?auto_297697 ) ) ( not ( = ?auto_297691 ?auto_297698 ) ) ( not ( = ?auto_297691 ?auto_297699 ) ) ( not ( = ?auto_297691 ?auto_297700 ) ) ( not ( = ?auto_297692 ?auto_297693 ) ) ( not ( = ?auto_297692 ?auto_297694 ) ) ( not ( = ?auto_297692 ?auto_297695 ) ) ( not ( = ?auto_297692 ?auto_297696 ) ) ( not ( = ?auto_297692 ?auto_297697 ) ) ( not ( = ?auto_297692 ?auto_297698 ) ) ( not ( = ?auto_297692 ?auto_297699 ) ) ( not ( = ?auto_297692 ?auto_297700 ) ) ( not ( = ?auto_297693 ?auto_297694 ) ) ( not ( = ?auto_297693 ?auto_297695 ) ) ( not ( = ?auto_297693 ?auto_297696 ) ) ( not ( = ?auto_297693 ?auto_297697 ) ) ( not ( = ?auto_297693 ?auto_297698 ) ) ( not ( = ?auto_297693 ?auto_297699 ) ) ( not ( = ?auto_297693 ?auto_297700 ) ) ( not ( = ?auto_297694 ?auto_297695 ) ) ( not ( = ?auto_297694 ?auto_297696 ) ) ( not ( = ?auto_297694 ?auto_297697 ) ) ( not ( = ?auto_297694 ?auto_297698 ) ) ( not ( = ?auto_297694 ?auto_297699 ) ) ( not ( = ?auto_297694 ?auto_297700 ) ) ( not ( = ?auto_297695 ?auto_297696 ) ) ( not ( = ?auto_297695 ?auto_297697 ) ) ( not ( = ?auto_297695 ?auto_297698 ) ) ( not ( = ?auto_297695 ?auto_297699 ) ) ( not ( = ?auto_297695 ?auto_297700 ) ) ( not ( = ?auto_297696 ?auto_297697 ) ) ( not ( = ?auto_297696 ?auto_297698 ) ) ( not ( = ?auto_297696 ?auto_297699 ) ) ( not ( = ?auto_297696 ?auto_297700 ) ) ( not ( = ?auto_297697 ?auto_297698 ) ) ( not ( = ?auto_297697 ?auto_297699 ) ) ( not ( = ?auto_297697 ?auto_297700 ) ) ( not ( = ?auto_297698 ?auto_297699 ) ) ( not ( = ?auto_297698 ?auto_297700 ) ) ( not ( = ?auto_297699 ?auto_297700 ) ) ( ON ?auto_297698 ?auto_297699 ) ( CLEAR ?auto_297696 ) ( ON ?auto_297697 ?auto_297698 ) ( CLEAR ?auto_297697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_297690 ?auto_297691 ?auto_297692 ?auto_297693 ?auto_297694 ?auto_297695 ?auto_297696 ?auto_297697 )
      ( MAKE-10PILE ?auto_297690 ?auto_297691 ?auto_297692 ?auto_297693 ?auto_297694 ?auto_297695 ?auto_297696 ?auto_297697 ?auto_297698 ?auto_297699 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_297711 - BLOCK
      ?auto_297712 - BLOCK
      ?auto_297713 - BLOCK
      ?auto_297714 - BLOCK
      ?auto_297715 - BLOCK
      ?auto_297716 - BLOCK
      ?auto_297717 - BLOCK
      ?auto_297718 - BLOCK
      ?auto_297719 - BLOCK
      ?auto_297720 - BLOCK
    )
    :vars
    (
      ?auto_297721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297720 ?auto_297721 ) ( ON-TABLE ?auto_297711 ) ( ON ?auto_297712 ?auto_297711 ) ( ON ?auto_297713 ?auto_297712 ) ( ON ?auto_297714 ?auto_297713 ) ( ON ?auto_297715 ?auto_297714 ) ( ON ?auto_297716 ?auto_297715 ) ( not ( = ?auto_297711 ?auto_297712 ) ) ( not ( = ?auto_297711 ?auto_297713 ) ) ( not ( = ?auto_297711 ?auto_297714 ) ) ( not ( = ?auto_297711 ?auto_297715 ) ) ( not ( = ?auto_297711 ?auto_297716 ) ) ( not ( = ?auto_297711 ?auto_297717 ) ) ( not ( = ?auto_297711 ?auto_297718 ) ) ( not ( = ?auto_297711 ?auto_297719 ) ) ( not ( = ?auto_297711 ?auto_297720 ) ) ( not ( = ?auto_297711 ?auto_297721 ) ) ( not ( = ?auto_297712 ?auto_297713 ) ) ( not ( = ?auto_297712 ?auto_297714 ) ) ( not ( = ?auto_297712 ?auto_297715 ) ) ( not ( = ?auto_297712 ?auto_297716 ) ) ( not ( = ?auto_297712 ?auto_297717 ) ) ( not ( = ?auto_297712 ?auto_297718 ) ) ( not ( = ?auto_297712 ?auto_297719 ) ) ( not ( = ?auto_297712 ?auto_297720 ) ) ( not ( = ?auto_297712 ?auto_297721 ) ) ( not ( = ?auto_297713 ?auto_297714 ) ) ( not ( = ?auto_297713 ?auto_297715 ) ) ( not ( = ?auto_297713 ?auto_297716 ) ) ( not ( = ?auto_297713 ?auto_297717 ) ) ( not ( = ?auto_297713 ?auto_297718 ) ) ( not ( = ?auto_297713 ?auto_297719 ) ) ( not ( = ?auto_297713 ?auto_297720 ) ) ( not ( = ?auto_297713 ?auto_297721 ) ) ( not ( = ?auto_297714 ?auto_297715 ) ) ( not ( = ?auto_297714 ?auto_297716 ) ) ( not ( = ?auto_297714 ?auto_297717 ) ) ( not ( = ?auto_297714 ?auto_297718 ) ) ( not ( = ?auto_297714 ?auto_297719 ) ) ( not ( = ?auto_297714 ?auto_297720 ) ) ( not ( = ?auto_297714 ?auto_297721 ) ) ( not ( = ?auto_297715 ?auto_297716 ) ) ( not ( = ?auto_297715 ?auto_297717 ) ) ( not ( = ?auto_297715 ?auto_297718 ) ) ( not ( = ?auto_297715 ?auto_297719 ) ) ( not ( = ?auto_297715 ?auto_297720 ) ) ( not ( = ?auto_297715 ?auto_297721 ) ) ( not ( = ?auto_297716 ?auto_297717 ) ) ( not ( = ?auto_297716 ?auto_297718 ) ) ( not ( = ?auto_297716 ?auto_297719 ) ) ( not ( = ?auto_297716 ?auto_297720 ) ) ( not ( = ?auto_297716 ?auto_297721 ) ) ( not ( = ?auto_297717 ?auto_297718 ) ) ( not ( = ?auto_297717 ?auto_297719 ) ) ( not ( = ?auto_297717 ?auto_297720 ) ) ( not ( = ?auto_297717 ?auto_297721 ) ) ( not ( = ?auto_297718 ?auto_297719 ) ) ( not ( = ?auto_297718 ?auto_297720 ) ) ( not ( = ?auto_297718 ?auto_297721 ) ) ( not ( = ?auto_297719 ?auto_297720 ) ) ( not ( = ?auto_297719 ?auto_297721 ) ) ( not ( = ?auto_297720 ?auto_297721 ) ) ( ON ?auto_297719 ?auto_297720 ) ( ON ?auto_297718 ?auto_297719 ) ( CLEAR ?auto_297716 ) ( ON ?auto_297717 ?auto_297718 ) ( CLEAR ?auto_297717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_297711 ?auto_297712 ?auto_297713 ?auto_297714 ?auto_297715 ?auto_297716 ?auto_297717 )
      ( MAKE-10PILE ?auto_297711 ?auto_297712 ?auto_297713 ?auto_297714 ?auto_297715 ?auto_297716 ?auto_297717 ?auto_297718 ?auto_297719 ?auto_297720 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_297732 - BLOCK
      ?auto_297733 - BLOCK
      ?auto_297734 - BLOCK
      ?auto_297735 - BLOCK
      ?auto_297736 - BLOCK
      ?auto_297737 - BLOCK
      ?auto_297738 - BLOCK
      ?auto_297739 - BLOCK
      ?auto_297740 - BLOCK
      ?auto_297741 - BLOCK
    )
    :vars
    (
      ?auto_297742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297741 ?auto_297742 ) ( ON-TABLE ?auto_297732 ) ( ON ?auto_297733 ?auto_297732 ) ( ON ?auto_297734 ?auto_297733 ) ( ON ?auto_297735 ?auto_297734 ) ( ON ?auto_297736 ?auto_297735 ) ( ON ?auto_297737 ?auto_297736 ) ( not ( = ?auto_297732 ?auto_297733 ) ) ( not ( = ?auto_297732 ?auto_297734 ) ) ( not ( = ?auto_297732 ?auto_297735 ) ) ( not ( = ?auto_297732 ?auto_297736 ) ) ( not ( = ?auto_297732 ?auto_297737 ) ) ( not ( = ?auto_297732 ?auto_297738 ) ) ( not ( = ?auto_297732 ?auto_297739 ) ) ( not ( = ?auto_297732 ?auto_297740 ) ) ( not ( = ?auto_297732 ?auto_297741 ) ) ( not ( = ?auto_297732 ?auto_297742 ) ) ( not ( = ?auto_297733 ?auto_297734 ) ) ( not ( = ?auto_297733 ?auto_297735 ) ) ( not ( = ?auto_297733 ?auto_297736 ) ) ( not ( = ?auto_297733 ?auto_297737 ) ) ( not ( = ?auto_297733 ?auto_297738 ) ) ( not ( = ?auto_297733 ?auto_297739 ) ) ( not ( = ?auto_297733 ?auto_297740 ) ) ( not ( = ?auto_297733 ?auto_297741 ) ) ( not ( = ?auto_297733 ?auto_297742 ) ) ( not ( = ?auto_297734 ?auto_297735 ) ) ( not ( = ?auto_297734 ?auto_297736 ) ) ( not ( = ?auto_297734 ?auto_297737 ) ) ( not ( = ?auto_297734 ?auto_297738 ) ) ( not ( = ?auto_297734 ?auto_297739 ) ) ( not ( = ?auto_297734 ?auto_297740 ) ) ( not ( = ?auto_297734 ?auto_297741 ) ) ( not ( = ?auto_297734 ?auto_297742 ) ) ( not ( = ?auto_297735 ?auto_297736 ) ) ( not ( = ?auto_297735 ?auto_297737 ) ) ( not ( = ?auto_297735 ?auto_297738 ) ) ( not ( = ?auto_297735 ?auto_297739 ) ) ( not ( = ?auto_297735 ?auto_297740 ) ) ( not ( = ?auto_297735 ?auto_297741 ) ) ( not ( = ?auto_297735 ?auto_297742 ) ) ( not ( = ?auto_297736 ?auto_297737 ) ) ( not ( = ?auto_297736 ?auto_297738 ) ) ( not ( = ?auto_297736 ?auto_297739 ) ) ( not ( = ?auto_297736 ?auto_297740 ) ) ( not ( = ?auto_297736 ?auto_297741 ) ) ( not ( = ?auto_297736 ?auto_297742 ) ) ( not ( = ?auto_297737 ?auto_297738 ) ) ( not ( = ?auto_297737 ?auto_297739 ) ) ( not ( = ?auto_297737 ?auto_297740 ) ) ( not ( = ?auto_297737 ?auto_297741 ) ) ( not ( = ?auto_297737 ?auto_297742 ) ) ( not ( = ?auto_297738 ?auto_297739 ) ) ( not ( = ?auto_297738 ?auto_297740 ) ) ( not ( = ?auto_297738 ?auto_297741 ) ) ( not ( = ?auto_297738 ?auto_297742 ) ) ( not ( = ?auto_297739 ?auto_297740 ) ) ( not ( = ?auto_297739 ?auto_297741 ) ) ( not ( = ?auto_297739 ?auto_297742 ) ) ( not ( = ?auto_297740 ?auto_297741 ) ) ( not ( = ?auto_297740 ?auto_297742 ) ) ( not ( = ?auto_297741 ?auto_297742 ) ) ( ON ?auto_297740 ?auto_297741 ) ( ON ?auto_297739 ?auto_297740 ) ( CLEAR ?auto_297737 ) ( ON ?auto_297738 ?auto_297739 ) ( CLEAR ?auto_297738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_297732 ?auto_297733 ?auto_297734 ?auto_297735 ?auto_297736 ?auto_297737 ?auto_297738 )
      ( MAKE-10PILE ?auto_297732 ?auto_297733 ?auto_297734 ?auto_297735 ?auto_297736 ?auto_297737 ?auto_297738 ?auto_297739 ?auto_297740 ?auto_297741 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_297753 - BLOCK
      ?auto_297754 - BLOCK
      ?auto_297755 - BLOCK
      ?auto_297756 - BLOCK
      ?auto_297757 - BLOCK
      ?auto_297758 - BLOCK
      ?auto_297759 - BLOCK
      ?auto_297760 - BLOCK
      ?auto_297761 - BLOCK
      ?auto_297762 - BLOCK
    )
    :vars
    (
      ?auto_297763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297762 ?auto_297763 ) ( ON-TABLE ?auto_297753 ) ( ON ?auto_297754 ?auto_297753 ) ( ON ?auto_297755 ?auto_297754 ) ( ON ?auto_297756 ?auto_297755 ) ( ON ?auto_297757 ?auto_297756 ) ( not ( = ?auto_297753 ?auto_297754 ) ) ( not ( = ?auto_297753 ?auto_297755 ) ) ( not ( = ?auto_297753 ?auto_297756 ) ) ( not ( = ?auto_297753 ?auto_297757 ) ) ( not ( = ?auto_297753 ?auto_297758 ) ) ( not ( = ?auto_297753 ?auto_297759 ) ) ( not ( = ?auto_297753 ?auto_297760 ) ) ( not ( = ?auto_297753 ?auto_297761 ) ) ( not ( = ?auto_297753 ?auto_297762 ) ) ( not ( = ?auto_297753 ?auto_297763 ) ) ( not ( = ?auto_297754 ?auto_297755 ) ) ( not ( = ?auto_297754 ?auto_297756 ) ) ( not ( = ?auto_297754 ?auto_297757 ) ) ( not ( = ?auto_297754 ?auto_297758 ) ) ( not ( = ?auto_297754 ?auto_297759 ) ) ( not ( = ?auto_297754 ?auto_297760 ) ) ( not ( = ?auto_297754 ?auto_297761 ) ) ( not ( = ?auto_297754 ?auto_297762 ) ) ( not ( = ?auto_297754 ?auto_297763 ) ) ( not ( = ?auto_297755 ?auto_297756 ) ) ( not ( = ?auto_297755 ?auto_297757 ) ) ( not ( = ?auto_297755 ?auto_297758 ) ) ( not ( = ?auto_297755 ?auto_297759 ) ) ( not ( = ?auto_297755 ?auto_297760 ) ) ( not ( = ?auto_297755 ?auto_297761 ) ) ( not ( = ?auto_297755 ?auto_297762 ) ) ( not ( = ?auto_297755 ?auto_297763 ) ) ( not ( = ?auto_297756 ?auto_297757 ) ) ( not ( = ?auto_297756 ?auto_297758 ) ) ( not ( = ?auto_297756 ?auto_297759 ) ) ( not ( = ?auto_297756 ?auto_297760 ) ) ( not ( = ?auto_297756 ?auto_297761 ) ) ( not ( = ?auto_297756 ?auto_297762 ) ) ( not ( = ?auto_297756 ?auto_297763 ) ) ( not ( = ?auto_297757 ?auto_297758 ) ) ( not ( = ?auto_297757 ?auto_297759 ) ) ( not ( = ?auto_297757 ?auto_297760 ) ) ( not ( = ?auto_297757 ?auto_297761 ) ) ( not ( = ?auto_297757 ?auto_297762 ) ) ( not ( = ?auto_297757 ?auto_297763 ) ) ( not ( = ?auto_297758 ?auto_297759 ) ) ( not ( = ?auto_297758 ?auto_297760 ) ) ( not ( = ?auto_297758 ?auto_297761 ) ) ( not ( = ?auto_297758 ?auto_297762 ) ) ( not ( = ?auto_297758 ?auto_297763 ) ) ( not ( = ?auto_297759 ?auto_297760 ) ) ( not ( = ?auto_297759 ?auto_297761 ) ) ( not ( = ?auto_297759 ?auto_297762 ) ) ( not ( = ?auto_297759 ?auto_297763 ) ) ( not ( = ?auto_297760 ?auto_297761 ) ) ( not ( = ?auto_297760 ?auto_297762 ) ) ( not ( = ?auto_297760 ?auto_297763 ) ) ( not ( = ?auto_297761 ?auto_297762 ) ) ( not ( = ?auto_297761 ?auto_297763 ) ) ( not ( = ?auto_297762 ?auto_297763 ) ) ( ON ?auto_297761 ?auto_297762 ) ( ON ?auto_297760 ?auto_297761 ) ( ON ?auto_297759 ?auto_297760 ) ( CLEAR ?auto_297757 ) ( ON ?auto_297758 ?auto_297759 ) ( CLEAR ?auto_297758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_297753 ?auto_297754 ?auto_297755 ?auto_297756 ?auto_297757 ?auto_297758 )
      ( MAKE-10PILE ?auto_297753 ?auto_297754 ?auto_297755 ?auto_297756 ?auto_297757 ?auto_297758 ?auto_297759 ?auto_297760 ?auto_297761 ?auto_297762 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_297774 - BLOCK
      ?auto_297775 - BLOCK
      ?auto_297776 - BLOCK
      ?auto_297777 - BLOCK
      ?auto_297778 - BLOCK
      ?auto_297779 - BLOCK
      ?auto_297780 - BLOCK
      ?auto_297781 - BLOCK
      ?auto_297782 - BLOCK
      ?auto_297783 - BLOCK
    )
    :vars
    (
      ?auto_297784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297783 ?auto_297784 ) ( ON-TABLE ?auto_297774 ) ( ON ?auto_297775 ?auto_297774 ) ( ON ?auto_297776 ?auto_297775 ) ( ON ?auto_297777 ?auto_297776 ) ( ON ?auto_297778 ?auto_297777 ) ( not ( = ?auto_297774 ?auto_297775 ) ) ( not ( = ?auto_297774 ?auto_297776 ) ) ( not ( = ?auto_297774 ?auto_297777 ) ) ( not ( = ?auto_297774 ?auto_297778 ) ) ( not ( = ?auto_297774 ?auto_297779 ) ) ( not ( = ?auto_297774 ?auto_297780 ) ) ( not ( = ?auto_297774 ?auto_297781 ) ) ( not ( = ?auto_297774 ?auto_297782 ) ) ( not ( = ?auto_297774 ?auto_297783 ) ) ( not ( = ?auto_297774 ?auto_297784 ) ) ( not ( = ?auto_297775 ?auto_297776 ) ) ( not ( = ?auto_297775 ?auto_297777 ) ) ( not ( = ?auto_297775 ?auto_297778 ) ) ( not ( = ?auto_297775 ?auto_297779 ) ) ( not ( = ?auto_297775 ?auto_297780 ) ) ( not ( = ?auto_297775 ?auto_297781 ) ) ( not ( = ?auto_297775 ?auto_297782 ) ) ( not ( = ?auto_297775 ?auto_297783 ) ) ( not ( = ?auto_297775 ?auto_297784 ) ) ( not ( = ?auto_297776 ?auto_297777 ) ) ( not ( = ?auto_297776 ?auto_297778 ) ) ( not ( = ?auto_297776 ?auto_297779 ) ) ( not ( = ?auto_297776 ?auto_297780 ) ) ( not ( = ?auto_297776 ?auto_297781 ) ) ( not ( = ?auto_297776 ?auto_297782 ) ) ( not ( = ?auto_297776 ?auto_297783 ) ) ( not ( = ?auto_297776 ?auto_297784 ) ) ( not ( = ?auto_297777 ?auto_297778 ) ) ( not ( = ?auto_297777 ?auto_297779 ) ) ( not ( = ?auto_297777 ?auto_297780 ) ) ( not ( = ?auto_297777 ?auto_297781 ) ) ( not ( = ?auto_297777 ?auto_297782 ) ) ( not ( = ?auto_297777 ?auto_297783 ) ) ( not ( = ?auto_297777 ?auto_297784 ) ) ( not ( = ?auto_297778 ?auto_297779 ) ) ( not ( = ?auto_297778 ?auto_297780 ) ) ( not ( = ?auto_297778 ?auto_297781 ) ) ( not ( = ?auto_297778 ?auto_297782 ) ) ( not ( = ?auto_297778 ?auto_297783 ) ) ( not ( = ?auto_297778 ?auto_297784 ) ) ( not ( = ?auto_297779 ?auto_297780 ) ) ( not ( = ?auto_297779 ?auto_297781 ) ) ( not ( = ?auto_297779 ?auto_297782 ) ) ( not ( = ?auto_297779 ?auto_297783 ) ) ( not ( = ?auto_297779 ?auto_297784 ) ) ( not ( = ?auto_297780 ?auto_297781 ) ) ( not ( = ?auto_297780 ?auto_297782 ) ) ( not ( = ?auto_297780 ?auto_297783 ) ) ( not ( = ?auto_297780 ?auto_297784 ) ) ( not ( = ?auto_297781 ?auto_297782 ) ) ( not ( = ?auto_297781 ?auto_297783 ) ) ( not ( = ?auto_297781 ?auto_297784 ) ) ( not ( = ?auto_297782 ?auto_297783 ) ) ( not ( = ?auto_297782 ?auto_297784 ) ) ( not ( = ?auto_297783 ?auto_297784 ) ) ( ON ?auto_297782 ?auto_297783 ) ( ON ?auto_297781 ?auto_297782 ) ( ON ?auto_297780 ?auto_297781 ) ( CLEAR ?auto_297778 ) ( ON ?auto_297779 ?auto_297780 ) ( CLEAR ?auto_297779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_297774 ?auto_297775 ?auto_297776 ?auto_297777 ?auto_297778 ?auto_297779 )
      ( MAKE-10PILE ?auto_297774 ?auto_297775 ?auto_297776 ?auto_297777 ?auto_297778 ?auto_297779 ?auto_297780 ?auto_297781 ?auto_297782 ?auto_297783 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_297795 - BLOCK
      ?auto_297796 - BLOCK
      ?auto_297797 - BLOCK
      ?auto_297798 - BLOCK
      ?auto_297799 - BLOCK
      ?auto_297800 - BLOCK
      ?auto_297801 - BLOCK
      ?auto_297802 - BLOCK
      ?auto_297803 - BLOCK
      ?auto_297804 - BLOCK
    )
    :vars
    (
      ?auto_297805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297804 ?auto_297805 ) ( ON-TABLE ?auto_297795 ) ( ON ?auto_297796 ?auto_297795 ) ( ON ?auto_297797 ?auto_297796 ) ( ON ?auto_297798 ?auto_297797 ) ( not ( = ?auto_297795 ?auto_297796 ) ) ( not ( = ?auto_297795 ?auto_297797 ) ) ( not ( = ?auto_297795 ?auto_297798 ) ) ( not ( = ?auto_297795 ?auto_297799 ) ) ( not ( = ?auto_297795 ?auto_297800 ) ) ( not ( = ?auto_297795 ?auto_297801 ) ) ( not ( = ?auto_297795 ?auto_297802 ) ) ( not ( = ?auto_297795 ?auto_297803 ) ) ( not ( = ?auto_297795 ?auto_297804 ) ) ( not ( = ?auto_297795 ?auto_297805 ) ) ( not ( = ?auto_297796 ?auto_297797 ) ) ( not ( = ?auto_297796 ?auto_297798 ) ) ( not ( = ?auto_297796 ?auto_297799 ) ) ( not ( = ?auto_297796 ?auto_297800 ) ) ( not ( = ?auto_297796 ?auto_297801 ) ) ( not ( = ?auto_297796 ?auto_297802 ) ) ( not ( = ?auto_297796 ?auto_297803 ) ) ( not ( = ?auto_297796 ?auto_297804 ) ) ( not ( = ?auto_297796 ?auto_297805 ) ) ( not ( = ?auto_297797 ?auto_297798 ) ) ( not ( = ?auto_297797 ?auto_297799 ) ) ( not ( = ?auto_297797 ?auto_297800 ) ) ( not ( = ?auto_297797 ?auto_297801 ) ) ( not ( = ?auto_297797 ?auto_297802 ) ) ( not ( = ?auto_297797 ?auto_297803 ) ) ( not ( = ?auto_297797 ?auto_297804 ) ) ( not ( = ?auto_297797 ?auto_297805 ) ) ( not ( = ?auto_297798 ?auto_297799 ) ) ( not ( = ?auto_297798 ?auto_297800 ) ) ( not ( = ?auto_297798 ?auto_297801 ) ) ( not ( = ?auto_297798 ?auto_297802 ) ) ( not ( = ?auto_297798 ?auto_297803 ) ) ( not ( = ?auto_297798 ?auto_297804 ) ) ( not ( = ?auto_297798 ?auto_297805 ) ) ( not ( = ?auto_297799 ?auto_297800 ) ) ( not ( = ?auto_297799 ?auto_297801 ) ) ( not ( = ?auto_297799 ?auto_297802 ) ) ( not ( = ?auto_297799 ?auto_297803 ) ) ( not ( = ?auto_297799 ?auto_297804 ) ) ( not ( = ?auto_297799 ?auto_297805 ) ) ( not ( = ?auto_297800 ?auto_297801 ) ) ( not ( = ?auto_297800 ?auto_297802 ) ) ( not ( = ?auto_297800 ?auto_297803 ) ) ( not ( = ?auto_297800 ?auto_297804 ) ) ( not ( = ?auto_297800 ?auto_297805 ) ) ( not ( = ?auto_297801 ?auto_297802 ) ) ( not ( = ?auto_297801 ?auto_297803 ) ) ( not ( = ?auto_297801 ?auto_297804 ) ) ( not ( = ?auto_297801 ?auto_297805 ) ) ( not ( = ?auto_297802 ?auto_297803 ) ) ( not ( = ?auto_297802 ?auto_297804 ) ) ( not ( = ?auto_297802 ?auto_297805 ) ) ( not ( = ?auto_297803 ?auto_297804 ) ) ( not ( = ?auto_297803 ?auto_297805 ) ) ( not ( = ?auto_297804 ?auto_297805 ) ) ( ON ?auto_297803 ?auto_297804 ) ( ON ?auto_297802 ?auto_297803 ) ( ON ?auto_297801 ?auto_297802 ) ( ON ?auto_297800 ?auto_297801 ) ( CLEAR ?auto_297798 ) ( ON ?auto_297799 ?auto_297800 ) ( CLEAR ?auto_297799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_297795 ?auto_297796 ?auto_297797 ?auto_297798 ?auto_297799 )
      ( MAKE-10PILE ?auto_297795 ?auto_297796 ?auto_297797 ?auto_297798 ?auto_297799 ?auto_297800 ?auto_297801 ?auto_297802 ?auto_297803 ?auto_297804 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_297816 - BLOCK
      ?auto_297817 - BLOCK
      ?auto_297818 - BLOCK
      ?auto_297819 - BLOCK
      ?auto_297820 - BLOCK
      ?auto_297821 - BLOCK
      ?auto_297822 - BLOCK
      ?auto_297823 - BLOCK
      ?auto_297824 - BLOCK
      ?auto_297825 - BLOCK
    )
    :vars
    (
      ?auto_297826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297825 ?auto_297826 ) ( ON-TABLE ?auto_297816 ) ( ON ?auto_297817 ?auto_297816 ) ( ON ?auto_297818 ?auto_297817 ) ( ON ?auto_297819 ?auto_297818 ) ( not ( = ?auto_297816 ?auto_297817 ) ) ( not ( = ?auto_297816 ?auto_297818 ) ) ( not ( = ?auto_297816 ?auto_297819 ) ) ( not ( = ?auto_297816 ?auto_297820 ) ) ( not ( = ?auto_297816 ?auto_297821 ) ) ( not ( = ?auto_297816 ?auto_297822 ) ) ( not ( = ?auto_297816 ?auto_297823 ) ) ( not ( = ?auto_297816 ?auto_297824 ) ) ( not ( = ?auto_297816 ?auto_297825 ) ) ( not ( = ?auto_297816 ?auto_297826 ) ) ( not ( = ?auto_297817 ?auto_297818 ) ) ( not ( = ?auto_297817 ?auto_297819 ) ) ( not ( = ?auto_297817 ?auto_297820 ) ) ( not ( = ?auto_297817 ?auto_297821 ) ) ( not ( = ?auto_297817 ?auto_297822 ) ) ( not ( = ?auto_297817 ?auto_297823 ) ) ( not ( = ?auto_297817 ?auto_297824 ) ) ( not ( = ?auto_297817 ?auto_297825 ) ) ( not ( = ?auto_297817 ?auto_297826 ) ) ( not ( = ?auto_297818 ?auto_297819 ) ) ( not ( = ?auto_297818 ?auto_297820 ) ) ( not ( = ?auto_297818 ?auto_297821 ) ) ( not ( = ?auto_297818 ?auto_297822 ) ) ( not ( = ?auto_297818 ?auto_297823 ) ) ( not ( = ?auto_297818 ?auto_297824 ) ) ( not ( = ?auto_297818 ?auto_297825 ) ) ( not ( = ?auto_297818 ?auto_297826 ) ) ( not ( = ?auto_297819 ?auto_297820 ) ) ( not ( = ?auto_297819 ?auto_297821 ) ) ( not ( = ?auto_297819 ?auto_297822 ) ) ( not ( = ?auto_297819 ?auto_297823 ) ) ( not ( = ?auto_297819 ?auto_297824 ) ) ( not ( = ?auto_297819 ?auto_297825 ) ) ( not ( = ?auto_297819 ?auto_297826 ) ) ( not ( = ?auto_297820 ?auto_297821 ) ) ( not ( = ?auto_297820 ?auto_297822 ) ) ( not ( = ?auto_297820 ?auto_297823 ) ) ( not ( = ?auto_297820 ?auto_297824 ) ) ( not ( = ?auto_297820 ?auto_297825 ) ) ( not ( = ?auto_297820 ?auto_297826 ) ) ( not ( = ?auto_297821 ?auto_297822 ) ) ( not ( = ?auto_297821 ?auto_297823 ) ) ( not ( = ?auto_297821 ?auto_297824 ) ) ( not ( = ?auto_297821 ?auto_297825 ) ) ( not ( = ?auto_297821 ?auto_297826 ) ) ( not ( = ?auto_297822 ?auto_297823 ) ) ( not ( = ?auto_297822 ?auto_297824 ) ) ( not ( = ?auto_297822 ?auto_297825 ) ) ( not ( = ?auto_297822 ?auto_297826 ) ) ( not ( = ?auto_297823 ?auto_297824 ) ) ( not ( = ?auto_297823 ?auto_297825 ) ) ( not ( = ?auto_297823 ?auto_297826 ) ) ( not ( = ?auto_297824 ?auto_297825 ) ) ( not ( = ?auto_297824 ?auto_297826 ) ) ( not ( = ?auto_297825 ?auto_297826 ) ) ( ON ?auto_297824 ?auto_297825 ) ( ON ?auto_297823 ?auto_297824 ) ( ON ?auto_297822 ?auto_297823 ) ( ON ?auto_297821 ?auto_297822 ) ( CLEAR ?auto_297819 ) ( ON ?auto_297820 ?auto_297821 ) ( CLEAR ?auto_297820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_297816 ?auto_297817 ?auto_297818 ?auto_297819 ?auto_297820 )
      ( MAKE-10PILE ?auto_297816 ?auto_297817 ?auto_297818 ?auto_297819 ?auto_297820 ?auto_297821 ?auto_297822 ?auto_297823 ?auto_297824 ?auto_297825 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_297837 - BLOCK
      ?auto_297838 - BLOCK
      ?auto_297839 - BLOCK
      ?auto_297840 - BLOCK
      ?auto_297841 - BLOCK
      ?auto_297842 - BLOCK
      ?auto_297843 - BLOCK
      ?auto_297844 - BLOCK
      ?auto_297845 - BLOCK
      ?auto_297846 - BLOCK
    )
    :vars
    (
      ?auto_297847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297846 ?auto_297847 ) ( ON-TABLE ?auto_297837 ) ( ON ?auto_297838 ?auto_297837 ) ( ON ?auto_297839 ?auto_297838 ) ( not ( = ?auto_297837 ?auto_297838 ) ) ( not ( = ?auto_297837 ?auto_297839 ) ) ( not ( = ?auto_297837 ?auto_297840 ) ) ( not ( = ?auto_297837 ?auto_297841 ) ) ( not ( = ?auto_297837 ?auto_297842 ) ) ( not ( = ?auto_297837 ?auto_297843 ) ) ( not ( = ?auto_297837 ?auto_297844 ) ) ( not ( = ?auto_297837 ?auto_297845 ) ) ( not ( = ?auto_297837 ?auto_297846 ) ) ( not ( = ?auto_297837 ?auto_297847 ) ) ( not ( = ?auto_297838 ?auto_297839 ) ) ( not ( = ?auto_297838 ?auto_297840 ) ) ( not ( = ?auto_297838 ?auto_297841 ) ) ( not ( = ?auto_297838 ?auto_297842 ) ) ( not ( = ?auto_297838 ?auto_297843 ) ) ( not ( = ?auto_297838 ?auto_297844 ) ) ( not ( = ?auto_297838 ?auto_297845 ) ) ( not ( = ?auto_297838 ?auto_297846 ) ) ( not ( = ?auto_297838 ?auto_297847 ) ) ( not ( = ?auto_297839 ?auto_297840 ) ) ( not ( = ?auto_297839 ?auto_297841 ) ) ( not ( = ?auto_297839 ?auto_297842 ) ) ( not ( = ?auto_297839 ?auto_297843 ) ) ( not ( = ?auto_297839 ?auto_297844 ) ) ( not ( = ?auto_297839 ?auto_297845 ) ) ( not ( = ?auto_297839 ?auto_297846 ) ) ( not ( = ?auto_297839 ?auto_297847 ) ) ( not ( = ?auto_297840 ?auto_297841 ) ) ( not ( = ?auto_297840 ?auto_297842 ) ) ( not ( = ?auto_297840 ?auto_297843 ) ) ( not ( = ?auto_297840 ?auto_297844 ) ) ( not ( = ?auto_297840 ?auto_297845 ) ) ( not ( = ?auto_297840 ?auto_297846 ) ) ( not ( = ?auto_297840 ?auto_297847 ) ) ( not ( = ?auto_297841 ?auto_297842 ) ) ( not ( = ?auto_297841 ?auto_297843 ) ) ( not ( = ?auto_297841 ?auto_297844 ) ) ( not ( = ?auto_297841 ?auto_297845 ) ) ( not ( = ?auto_297841 ?auto_297846 ) ) ( not ( = ?auto_297841 ?auto_297847 ) ) ( not ( = ?auto_297842 ?auto_297843 ) ) ( not ( = ?auto_297842 ?auto_297844 ) ) ( not ( = ?auto_297842 ?auto_297845 ) ) ( not ( = ?auto_297842 ?auto_297846 ) ) ( not ( = ?auto_297842 ?auto_297847 ) ) ( not ( = ?auto_297843 ?auto_297844 ) ) ( not ( = ?auto_297843 ?auto_297845 ) ) ( not ( = ?auto_297843 ?auto_297846 ) ) ( not ( = ?auto_297843 ?auto_297847 ) ) ( not ( = ?auto_297844 ?auto_297845 ) ) ( not ( = ?auto_297844 ?auto_297846 ) ) ( not ( = ?auto_297844 ?auto_297847 ) ) ( not ( = ?auto_297845 ?auto_297846 ) ) ( not ( = ?auto_297845 ?auto_297847 ) ) ( not ( = ?auto_297846 ?auto_297847 ) ) ( ON ?auto_297845 ?auto_297846 ) ( ON ?auto_297844 ?auto_297845 ) ( ON ?auto_297843 ?auto_297844 ) ( ON ?auto_297842 ?auto_297843 ) ( ON ?auto_297841 ?auto_297842 ) ( CLEAR ?auto_297839 ) ( ON ?auto_297840 ?auto_297841 ) ( CLEAR ?auto_297840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_297837 ?auto_297838 ?auto_297839 ?auto_297840 )
      ( MAKE-10PILE ?auto_297837 ?auto_297838 ?auto_297839 ?auto_297840 ?auto_297841 ?auto_297842 ?auto_297843 ?auto_297844 ?auto_297845 ?auto_297846 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_297858 - BLOCK
      ?auto_297859 - BLOCK
      ?auto_297860 - BLOCK
      ?auto_297861 - BLOCK
      ?auto_297862 - BLOCK
      ?auto_297863 - BLOCK
      ?auto_297864 - BLOCK
      ?auto_297865 - BLOCK
      ?auto_297866 - BLOCK
      ?auto_297867 - BLOCK
    )
    :vars
    (
      ?auto_297868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297867 ?auto_297868 ) ( ON-TABLE ?auto_297858 ) ( ON ?auto_297859 ?auto_297858 ) ( ON ?auto_297860 ?auto_297859 ) ( not ( = ?auto_297858 ?auto_297859 ) ) ( not ( = ?auto_297858 ?auto_297860 ) ) ( not ( = ?auto_297858 ?auto_297861 ) ) ( not ( = ?auto_297858 ?auto_297862 ) ) ( not ( = ?auto_297858 ?auto_297863 ) ) ( not ( = ?auto_297858 ?auto_297864 ) ) ( not ( = ?auto_297858 ?auto_297865 ) ) ( not ( = ?auto_297858 ?auto_297866 ) ) ( not ( = ?auto_297858 ?auto_297867 ) ) ( not ( = ?auto_297858 ?auto_297868 ) ) ( not ( = ?auto_297859 ?auto_297860 ) ) ( not ( = ?auto_297859 ?auto_297861 ) ) ( not ( = ?auto_297859 ?auto_297862 ) ) ( not ( = ?auto_297859 ?auto_297863 ) ) ( not ( = ?auto_297859 ?auto_297864 ) ) ( not ( = ?auto_297859 ?auto_297865 ) ) ( not ( = ?auto_297859 ?auto_297866 ) ) ( not ( = ?auto_297859 ?auto_297867 ) ) ( not ( = ?auto_297859 ?auto_297868 ) ) ( not ( = ?auto_297860 ?auto_297861 ) ) ( not ( = ?auto_297860 ?auto_297862 ) ) ( not ( = ?auto_297860 ?auto_297863 ) ) ( not ( = ?auto_297860 ?auto_297864 ) ) ( not ( = ?auto_297860 ?auto_297865 ) ) ( not ( = ?auto_297860 ?auto_297866 ) ) ( not ( = ?auto_297860 ?auto_297867 ) ) ( not ( = ?auto_297860 ?auto_297868 ) ) ( not ( = ?auto_297861 ?auto_297862 ) ) ( not ( = ?auto_297861 ?auto_297863 ) ) ( not ( = ?auto_297861 ?auto_297864 ) ) ( not ( = ?auto_297861 ?auto_297865 ) ) ( not ( = ?auto_297861 ?auto_297866 ) ) ( not ( = ?auto_297861 ?auto_297867 ) ) ( not ( = ?auto_297861 ?auto_297868 ) ) ( not ( = ?auto_297862 ?auto_297863 ) ) ( not ( = ?auto_297862 ?auto_297864 ) ) ( not ( = ?auto_297862 ?auto_297865 ) ) ( not ( = ?auto_297862 ?auto_297866 ) ) ( not ( = ?auto_297862 ?auto_297867 ) ) ( not ( = ?auto_297862 ?auto_297868 ) ) ( not ( = ?auto_297863 ?auto_297864 ) ) ( not ( = ?auto_297863 ?auto_297865 ) ) ( not ( = ?auto_297863 ?auto_297866 ) ) ( not ( = ?auto_297863 ?auto_297867 ) ) ( not ( = ?auto_297863 ?auto_297868 ) ) ( not ( = ?auto_297864 ?auto_297865 ) ) ( not ( = ?auto_297864 ?auto_297866 ) ) ( not ( = ?auto_297864 ?auto_297867 ) ) ( not ( = ?auto_297864 ?auto_297868 ) ) ( not ( = ?auto_297865 ?auto_297866 ) ) ( not ( = ?auto_297865 ?auto_297867 ) ) ( not ( = ?auto_297865 ?auto_297868 ) ) ( not ( = ?auto_297866 ?auto_297867 ) ) ( not ( = ?auto_297866 ?auto_297868 ) ) ( not ( = ?auto_297867 ?auto_297868 ) ) ( ON ?auto_297866 ?auto_297867 ) ( ON ?auto_297865 ?auto_297866 ) ( ON ?auto_297864 ?auto_297865 ) ( ON ?auto_297863 ?auto_297864 ) ( ON ?auto_297862 ?auto_297863 ) ( CLEAR ?auto_297860 ) ( ON ?auto_297861 ?auto_297862 ) ( CLEAR ?auto_297861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_297858 ?auto_297859 ?auto_297860 ?auto_297861 )
      ( MAKE-10PILE ?auto_297858 ?auto_297859 ?auto_297860 ?auto_297861 ?auto_297862 ?auto_297863 ?auto_297864 ?auto_297865 ?auto_297866 ?auto_297867 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_297879 - BLOCK
      ?auto_297880 - BLOCK
      ?auto_297881 - BLOCK
      ?auto_297882 - BLOCK
      ?auto_297883 - BLOCK
      ?auto_297884 - BLOCK
      ?auto_297885 - BLOCK
      ?auto_297886 - BLOCK
      ?auto_297887 - BLOCK
      ?auto_297888 - BLOCK
    )
    :vars
    (
      ?auto_297889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297888 ?auto_297889 ) ( ON-TABLE ?auto_297879 ) ( ON ?auto_297880 ?auto_297879 ) ( not ( = ?auto_297879 ?auto_297880 ) ) ( not ( = ?auto_297879 ?auto_297881 ) ) ( not ( = ?auto_297879 ?auto_297882 ) ) ( not ( = ?auto_297879 ?auto_297883 ) ) ( not ( = ?auto_297879 ?auto_297884 ) ) ( not ( = ?auto_297879 ?auto_297885 ) ) ( not ( = ?auto_297879 ?auto_297886 ) ) ( not ( = ?auto_297879 ?auto_297887 ) ) ( not ( = ?auto_297879 ?auto_297888 ) ) ( not ( = ?auto_297879 ?auto_297889 ) ) ( not ( = ?auto_297880 ?auto_297881 ) ) ( not ( = ?auto_297880 ?auto_297882 ) ) ( not ( = ?auto_297880 ?auto_297883 ) ) ( not ( = ?auto_297880 ?auto_297884 ) ) ( not ( = ?auto_297880 ?auto_297885 ) ) ( not ( = ?auto_297880 ?auto_297886 ) ) ( not ( = ?auto_297880 ?auto_297887 ) ) ( not ( = ?auto_297880 ?auto_297888 ) ) ( not ( = ?auto_297880 ?auto_297889 ) ) ( not ( = ?auto_297881 ?auto_297882 ) ) ( not ( = ?auto_297881 ?auto_297883 ) ) ( not ( = ?auto_297881 ?auto_297884 ) ) ( not ( = ?auto_297881 ?auto_297885 ) ) ( not ( = ?auto_297881 ?auto_297886 ) ) ( not ( = ?auto_297881 ?auto_297887 ) ) ( not ( = ?auto_297881 ?auto_297888 ) ) ( not ( = ?auto_297881 ?auto_297889 ) ) ( not ( = ?auto_297882 ?auto_297883 ) ) ( not ( = ?auto_297882 ?auto_297884 ) ) ( not ( = ?auto_297882 ?auto_297885 ) ) ( not ( = ?auto_297882 ?auto_297886 ) ) ( not ( = ?auto_297882 ?auto_297887 ) ) ( not ( = ?auto_297882 ?auto_297888 ) ) ( not ( = ?auto_297882 ?auto_297889 ) ) ( not ( = ?auto_297883 ?auto_297884 ) ) ( not ( = ?auto_297883 ?auto_297885 ) ) ( not ( = ?auto_297883 ?auto_297886 ) ) ( not ( = ?auto_297883 ?auto_297887 ) ) ( not ( = ?auto_297883 ?auto_297888 ) ) ( not ( = ?auto_297883 ?auto_297889 ) ) ( not ( = ?auto_297884 ?auto_297885 ) ) ( not ( = ?auto_297884 ?auto_297886 ) ) ( not ( = ?auto_297884 ?auto_297887 ) ) ( not ( = ?auto_297884 ?auto_297888 ) ) ( not ( = ?auto_297884 ?auto_297889 ) ) ( not ( = ?auto_297885 ?auto_297886 ) ) ( not ( = ?auto_297885 ?auto_297887 ) ) ( not ( = ?auto_297885 ?auto_297888 ) ) ( not ( = ?auto_297885 ?auto_297889 ) ) ( not ( = ?auto_297886 ?auto_297887 ) ) ( not ( = ?auto_297886 ?auto_297888 ) ) ( not ( = ?auto_297886 ?auto_297889 ) ) ( not ( = ?auto_297887 ?auto_297888 ) ) ( not ( = ?auto_297887 ?auto_297889 ) ) ( not ( = ?auto_297888 ?auto_297889 ) ) ( ON ?auto_297887 ?auto_297888 ) ( ON ?auto_297886 ?auto_297887 ) ( ON ?auto_297885 ?auto_297886 ) ( ON ?auto_297884 ?auto_297885 ) ( ON ?auto_297883 ?auto_297884 ) ( ON ?auto_297882 ?auto_297883 ) ( CLEAR ?auto_297880 ) ( ON ?auto_297881 ?auto_297882 ) ( CLEAR ?auto_297881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_297879 ?auto_297880 ?auto_297881 )
      ( MAKE-10PILE ?auto_297879 ?auto_297880 ?auto_297881 ?auto_297882 ?auto_297883 ?auto_297884 ?auto_297885 ?auto_297886 ?auto_297887 ?auto_297888 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_297900 - BLOCK
      ?auto_297901 - BLOCK
      ?auto_297902 - BLOCK
      ?auto_297903 - BLOCK
      ?auto_297904 - BLOCK
      ?auto_297905 - BLOCK
      ?auto_297906 - BLOCK
      ?auto_297907 - BLOCK
      ?auto_297908 - BLOCK
      ?auto_297909 - BLOCK
    )
    :vars
    (
      ?auto_297910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297909 ?auto_297910 ) ( ON-TABLE ?auto_297900 ) ( ON ?auto_297901 ?auto_297900 ) ( not ( = ?auto_297900 ?auto_297901 ) ) ( not ( = ?auto_297900 ?auto_297902 ) ) ( not ( = ?auto_297900 ?auto_297903 ) ) ( not ( = ?auto_297900 ?auto_297904 ) ) ( not ( = ?auto_297900 ?auto_297905 ) ) ( not ( = ?auto_297900 ?auto_297906 ) ) ( not ( = ?auto_297900 ?auto_297907 ) ) ( not ( = ?auto_297900 ?auto_297908 ) ) ( not ( = ?auto_297900 ?auto_297909 ) ) ( not ( = ?auto_297900 ?auto_297910 ) ) ( not ( = ?auto_297901 ?auto_297902 ) ) ( not ( = ?auto_297901 ?auto_297903 ) ) ( not ( = ?auto_297901 ?auto_297904 ) ) ( not ( = ?auto_297901 ?auto_297905 ) ) ( not ( = ?auto_297901 ?auto_297906 ) ) ( not ( = ?auto_297901 ?auto_297907 ) ) ( not ( = ?auto_297901 ?auto_297908 ) ) ( not ( = ?auto_297901 ?auto_297909 ) ) ( not ( = ?auto_297901 ?auto_297910 ) ) ( not ( = ?auto_297902 ?auto_297903 ) ) ( not ( = ?auto_297902 ?auto_297904 ) ) ( not ( = ?auto_297902 ?auto_297905 ) ) ( not ( = ?auto_297902 ?auto_297906 ) ) ( not ( = ?auto_297902 ?auto_297907 ) ) ( not ( = ?auto_297902 ?auto_297908 ) ) ( not ( = ?auto_297902 ?auto_297909 ) ) ( not ( = ?auto_297902 ?auto_297910 ) ) ( not ( = ?auto_297903 ?auto_297904 ) ) ( not ( = ?auto_297903 ?auto_297905 ) ) ( not ( = ?auto_297903 ?auto_297906 ) ) ( not ( = ?auto_297903 ?auto_297907 ) ) ( not ( = ?auto_297903 ?auto_297908 ) ) ( not ( = ?auto_297903 ?auto_297909 ) ) ( not ( = ?auto_297903 ?auto_297910 ) ) ( not ( = ?auto_297904 ?auto_297905 ) ) ( not ( = ?auto_297904 ?auto_297906 ) ) ( not ( = ?auto_297904 ?auto_297907 ) ) ( not ( = ?auto_297904 ?auto_297908 ) ) ( not ( = ?auto_297904 ?auto_297909 ) ) ( not ( = ?auto_297904 ?auto_297910 ) ) ( not ( = ?auto_297905 ?auto_297906 ) ) ( not ( = ?auto_297905 ?auto_297907 ) ) ( not ( = ?auto_297905 ?auto_297908 ) ) ( not ( = ?auto_297905 ?auto_297909 ) ) ( not ( = ?auto_297905 ?auto_297910 ) ) ( not ( = ?auto_297906 ?auto_297907 ) ) ( not ( = ?auto_297906 ?auto_297908 ) ) ( not ( = ?auto_297906 ?auto_297909 ) ) ( not ( = ?auto_297906 ?auto_297910 ) ) ( not ( = ?auto_297907 ?auto_297908 ) ) ( not ( = ?auto_297907 ?auto_297909 ) ) ( not ( = ?auto_297907 ?auto_297910 ) ) ( not ( = ?auto_297908 ?auto_297909 ) ) ( not ( = ?auto_297908 ?auto_297910 ) ) ( not ( = ?auto_297909 ?auto_297910 ) ) ( ON ?auto_297908 ?auto_297909 ) ( ON ?auto_297907 ?auto_297908 ) ( ON ?auto_297906 ?auto_297907 ) ( ON ?auto_297905 ?auto_297906 ) ( ON ?auto_297904 ?auto_297905 ) ( ON ?auto_297903 ?auto_297904 ) ( CLEAR ?auto_297901 ) ( ON ?auto_297902 ?auto_297903 ) ( CLEAR ?auto_297902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_297900 ?auto_297901 ?auto_297902 )
      ( MAKE-10PILE ?auto_297900 ?auto_297901 ?auto_297902 ?auto_297903 ?auto_297904 ?auto_297905 ?auto_297906 ?auto_297907 ?auto_297908 ?auto_297909 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_297921 - BLOCK
      ?auto_297922 - BLOCK
      ?auto_297923 - BLOCK
      ?auto_297924 - BLOCK
      ?auto_297925 - BLOCK
      ?auto_297926 - BLOCK
      ?auto_297927 - BLOCK
      ?auto_297928 - BLOCK
      ?auto_297929 - BLOCK
      ?auto_297930 - BLOCK
    )
    :vars
    (
      ?auto_297931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297930 ?auto_297931 ) ( ON-TABLE ?auto_297921 ) ( not ( = ?auto_297921 ?auto_297922 ) ) ( not ( = ?auto_297921 ?auto_297923 ) ) ( not ( = ?auto_297921 ?auto_297924 ) ) ( not ( = ?auto_297921 ?auto_297925 ) ) ( not ( = ?auto_297921 ?auto_297926 ) ) ( not ( = ?auto_297921 ?auto_297927 ) ) ( not ( = ?auto_297921 ?auto_297928 ) ) ( not ( = ?auto_297921 ?auto_297929 ) ) ( not ( = ?auto_297921 ?auto_297930 ) ) ( not ( = ?auto_297921 ?auto_297931 ) ) ( not ( = ?auto_297922 ?auto_297923 ) ) ( not ( = ?auto_297922 ?auto_297924 ) ) ( not ( = ?auto_297922 ?auto_297925 ) ) ( not ( = ?auto_297922 ?auto_297926 ) ) ( not ( = ?auto_297922 ?auto_297927 ) ) ( not ( = ?auto_297922 ?auto_297928 ) ) ( not ( = ?auto_297922 ?auto_297929 ) ) ( not ( = ?auto_297922 ?auto_297930 ) ) ( not ( = ?auto_297922 ?auto_297931 ) ) ( not ( = ?auto_297923 ?auto_297924 ) ) ( not ( = ?auto_297923 ?auto_297925 ) ) ( not ( = ?auto_297923 ?auto_297926 ) ) ( not ( = ?auto_297923 ?auto_297927 ) ) ( not ( = ?auto_297923 ?auto_297928 ) ) ( not ( = ?auto_297923 ?auto_297929 ) ) ( not ( = ?auto_297923 ?auto_297930 ) ) ( not ( = ?auto_297923 ?auto_297931 ) ) ( not ( = ?auto_297924 ?auto_297925 ) ) ( not ( = ?auto_297924 ?auto_297926 ) ) ( not ( = ?auto_297924 ?auto_297927 ) ) ( not ( = ?auto_297924 ?auto_297928 ) ) ( not ( = ?auto_297924 ?auto_297929 ) ) ( not ( = ?auto_297924 ?auto_297930 ) ) ( not ( = ?auto_297924 ?auto_297931 ) ) ( not ( = ?auto_297925 ?auto_297926 ) ) ( not ( = ?auto_297925 ?auto_297927 ) ) ( not ( = ?auto_297925 ?auto_297928 ) ) ( not ( = ?auto_297925 ?auto_297929 ) ) ( not ( = ?auto_297925 ?auto_297930 ) ) ( not ( = ?auto_297925 ?auto_297931 ) ) ( not ( = ?auto_297926 ?auto_297927 ) ) ( not ( = ?auto_297926 ?auto_297928 ) ) ( not ( = ?auto_297926 ?auto_297929 ) ) ( not ( = ?auto_297926 ?auto_297930 ) ) ( not ( = ?auto_297926 ?auto_297931 ) ) ( not ( = ?auto_297927 ?auto_297928 ) ) ( not ( = ?auto_297927 ?auto_297929 ) ) ( not ( = ?auto_297927 ?auto_297930 ) ) ( not ( = ?auto_297927 ?auto_297931 ) ) ( not ( = ?auto_297928 ?auto_297929 ) ) ( not ( = ?auto_297928 ?auto_297930 ) ) ( not ( = ?auto_297928 ?auto_297931 ) ) ( not ( = ?auto_297929 ?auto_297930 ) ) ( not ( = ?auto_297929 ?auto_297931 ) ) ( not ( = ?auto_297930 ?auto_297931 ) ) ( ON ?auto_297929 ?auto_297930 ) ( ON ?auto_297928 ?auto_297929 ) ( ON ?auto_297927 ?auto_297928 ) ( ON ?auto_297926 ?auto_297927 ) ( ON ?auto_297925 ?auto_297926 ) ( ON ?auto_297924 ?auto_297925 ) ( ON ?auto_297923 ?auto_297924 ) ( CLEAR ?auto_297921 ) ( ON ?auto_297922 ?auto_297923 ) ( CLEAR ?auto_297922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_297921 ?auto_297922 )
      ( MAKE-10PILE ?auto_297921 ?auto_297922 ?auto_297923 ?auto_297924 ?auto_297925 ?auto_297926 ?auto_297927 ?auto_297928 ?auto_297929 ?auto_297930 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_297942 - BLOCK
      ?auto_297943 - BLOCK
      ?auto_297944 - BLOCK
      ?auto_297945 - BLOCK
      ?auto_297946 - BLOCK
      ?auto_297947 - BLOCK
      ?auto_297948 - BLOCK
      ?auto_297949 - BLOCK
      ?auto_297950 - BLOCK
      ?auto_297951 - BLOCK
    )
    :vars
    (
      ?auto_297952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297951 ?auto_297952 ) ( ON-TABLE ?auto_297942 ) ( not ( = ?auto_297942 ?auto_297943 ) ) ( not ( = ?auto_297942 ?auto_297944 ) ) ( not ( = ?auto_297942 ?auto_297945 ) ) ( not ( = ?auto_297942 ?auto_297946 ) ) ( not ( = ?auto_297942 ?auto_297947 ) ) ( not ( = ?auto_297942 ?auto_297948 ) ) ( not ( = ?auto_297942 ?auto_297949 ) ) ( not ( = ?auto_297942 ?auto_297950 ) ) ( not ( = ?auto_297942 ?auto_297951 ) ) ( not ( = ?auto_297942 ?auto_297952 ) ) ( not ( = ?auto_297943 ?auto_297944 ) ) ( not ( = ?auto_297943 ?auto_297945 ) ) ( not ( = ?auto_297943 ?auto_297946 ) ) ( not ( = ?auto_297943 ?auto_297947 ) ) ( not ( = ?auto_297943 ?auto_297948 ) ) ( not ( = ?auto_297943 ?auto_297949 ) ) ( not ( = ?auto_297943 ?auto_297950 ) ) ( not ( = ?auto_297943 ?auto_297951 ) ) ( not ( = ?auto_297943 ?auto_297952 ) ) ( not ( = ?auto_297944 ?auto_297945 ) ) ( not ( = ?auto_297944 ?auto_297946 ) ) ( not ( = ?auto_297944 ?auto_297947 ) ) ( not ( = ?auto_297944 ?auto_297948 ) ) ( not ( = ?auto_297944 ?auto_297949 ) ) ( not ( = ?auto_297944 ?auto_297950 ) ) ( not ( = ?auto_297944 ?auto_297951 ) ) ( not ( = ?auto_297944 ?auto_297952 ) ) ( not ( = ?auto_297945 ?auto_297946 ) ) ( not ( = ?auto_297945 ?auto_297947 ) ) ( not ( = ?auto_297945 ?auto_297948 ) ) ( not ( = ?auto_297945 ?auto_297949 ) ) ( not ( = ?auto_297945 ?auto_297950 ) ) ( not ( = ?auto_297945 ?auto_297951 ) ) ( not ( = ?auto_297945 ?auto_297952 ) ) ( not ( = ?auto_297946 ?auto_297947 ) ) ( not ( = ?auto_297946 ?auto_297948 ) ) ( not ( = ?auto_297946 ?auto_297949 ) ) ( not ( = ?auto_297946 ?auto_297950 ) ) ( not ( = ?auto_297946 ?auto_297951 ) ) ( not ( = ?auto_297946 ?auto_297952 ) ) ( not ( = ?auto_297947 ?auto_297948 ) ) ( not ( = ?auto_297947 ?auto_297949 ) ) ( not ( = ?auto_297947 ?auto_297950 ) ) ( not ( = ?auto_297947 ?auto_297951 ) ) ( not ( = ?auto_297947 ?auto_297952 ) ) ( not ( = ?auto_297948 ?auto_297949 ) ) ( not ( = ?auto_297948 ?auto_297950 ) ) ( not ( = ?auto_297948 ?auto_297951 ) ) ( not ( = ?auto_297948 ?auto_297952 ) ) ( not ( = ?auto_297949 ?auto_297950 ) ) ( not ( = ?auto_297949 ?auto_297951 ) ) ( not ( = ?auto_297949 ?auto_297952 ) ) ( not ( = ?auto_297950 ?auto_297951 ) ) ( not ( = ?auto_297950 ?auto_297952 ) ) ( not ( = ?auto_297951 ?auto_297952 ) ) ( ON ?auto_297950 ?auto_297951 ) ( ON ?auto_297949 ?auto_297950 ) ( ON ?auto_297948 ?auto_297949 ) ( ON ?auto_297947 ?auto_297948 ) ( ON ?auto_297946 ?auto_297947 ) ( ON ?auto_297945 ?auto_297946 ) ( ON ?auto_297944 ?auto_297945 ) ( CLEAR ?auto_297942 ) ( ON ?auto_297943 ?auto_297944 ) ( CLEAR ?auto_297943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_297942 ?auto_297943 )
      ( MAKE-10PILE ?auto_297942 ?auto_297943 ?auto_297944 ?auto_297945 ?auto_297946 ?auto_297947 ?auto_297948 ?auto_297949 ?auto_297950 ?auto_297951 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_297963 - BLOCK
      ?auto_297964 - BLOCK
      ?auto_297965 - BLOCK
      ?auto_297966 - BLOCK
      ?auto_297967 - BLOCK
      ?auto_297968 - BLOCK
      ?auto_297969 - BLOCK
      ?auto_297970 - BLOCK
      ?auto_297971 - BLOCK
      ?auto_297972 - BLOCK
    )
    :vars
    (
      ?auto_297973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297972 ?auto_297973 ) ( not ( = ?auto_297963 ?auto_297964 ) ) ( not ( = ?auto_297963 ?auto_297965 ) ) ( not ( = ?auto_297963 ?auto_297966 ) ) ( not ( = ?auto_297963 ?auto_297967 ) ) ( not ( = ?auto_297963 ?auto_297968 ) ) ( not ( = ?auto_297963 ?auto_297969 ) ) ( not ( = ?auto_297963 ?auto_297970 ) ) ( not ( = ?auto_297963 ?auto_297971 ) ) ( not ( = ?auto_297963 ?auto_297972 ) ) ( not ( = ?auto_297963 ?auto_297973 ) ) ( not ( = ?auto_297964 ?auto_297965 ) ) ( not ( = ?auto_297964 ?auto_297966 ) ) ( not ( = ?auto_297964 ?auto_297967 ) ) ( not ( = ?auto_297964 ?auto_297968 ) ) ( not ( = ?auto_297964 ?auto_297969 ) ) ( not ( = ?auto_297964 ?auto_297970 ) ) ( not ( = ?auto_297964 ?auto_297971 ) ) ( not ( = ?auto_297964 ?auto_297972 ) ) ( not ( = ?auto_297964 ?auto_297973 ) ) ( not ( = ?auto_297965 ?auto_297966 ) ) ( not ( = ?auto_297965 ?auto_297967 ) ) ( not ( = ?auto_297965 ?auto_297968 ) ) ( not ( = ?auto_297965 ?auto_297969 ) ) ( not ( = ?auto_297965 ?auto_297970 ) ) ( not ( = ?auto_297965 ?auto_297971 ) ) ( not ( = ?auto_297965 ?auto_297972 ) ) ( not ( = ?auto_297965 ?auto_297973 ) ) ( not ( = ?auto_297966 ?auto_297967 ) ) ( not ( = ?auto_297966 ?auto_297968 ) ) ( not ( = ?auto_297966 ?auto_297969 ) ) ( not ( = ?auto_297966 ?auto_297970 ) ) ( not ( = ?auto_297966 ?auto_297971 ) ) ( not ( = ?auto_297966 ?auto_297972 ) ) ( not ( = ?auto_297966 ?auto_297973 ) ) ( not ( = ?auto_297967 ?auto_297968 ) ) ( not ( = ?auto_297967 ?auto_297969 ) ) ( not ( = ?auto_297967 ?auto_297970 ) ) ( not ( = ?auto_297967 ?auto_297971 ) ) ( not ( = ?auto_297967 ?auto_297972 ) ) ( not ( = ?auto_297967 ?auto_297973 ) ) ( not ( = ?auto_297968 ?auto_297969 ) ) ( not ( = ?auto_297968 ?auto_297970 ) ) ( not ( = ?auto_297968 ?auto_297971 ) ) ( not ( = ?auto_297968 ?auto_297972 ) ) ( not ( = ?auto_297968 ?auto_297973 ) ) ( not ( = ?auto_297969 ?auto_297970 ) ) ( not ( = ?auto_297969 ?auto_297971 ) ) ( not ( = ?auto_297969 ?auto_297972 ) ) ( not ( = ?auto_297969 ?auto_297973 ) ) ( not ( = ?auto_297970 ?auto_297971 ) ) ( not ( = ?auto_297970 ?auto_297972 ) ) ( not ( = ?auto_297970 ?auto_297973 ) ) ( not ( = ?auto_297971 ?auto_297972 ) ) ( not ( = ?auto_297971 ?auto_297973 ) ) ( not ( = ?auto_297972 ?auto_297973 ) ) ( ON ?auto_297971 ?auto_297972 ) ( ON ?auto_297970 ?auto_297971 ) ( ON ?auto_297969 ?auto_297970 ) ( ON ?auto_297968 ?auto_297969 ) ( ON ?auto_297967 ?auto_297968 ) ( ON ?auto_297966 ?auto_297967 ) ( ON ?auto_297965 ?auto_297966 ) ( ON ?auto_297964 ?auto_297965 ) ( ON ?auto_297963 ?auto_297964 ) ( CLEAR ?auto_297963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_297963 )
      ( MAKE-10PILE ?auto_297963 ?auto_297964 ?auto_297965 ?auto_297966 ?auto_297967 ?auto_297968 ?auto_297969 ?auto_297970 ?auto_297971 ?auto_297972 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_297984 - BLOCK
      ?auto_297985 - BLOCK
      ?auto_297986 - BLOCK
      ?auto_297987 - BLOCK
      ?auto_297988 - BLOCK
      ?auto_297989 - BLOCK
      ?auto_297990 - BLOCK
      ?auto_297991 - BLOCK
      ?auto_297992 - BLOCK
      ?auto_297993 - BLOCK
    )
    :vars
    (
      ?auto_297994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_297993 ?auto_297994 ) ( not ( = ?auto_297984 ?auto_297985 ) ) ( not ( = ?auto_297984 ?auto_297986 ) ) ( not ( = ?auto_297984 ?auto_297987 ) ) ( not ( = ?auto_297984 ?auto_297988 ) ) ( not ( = ?auto_297984 ?auto_297989 ) ) ( not ( = ?auto_297984 ?auto_297990 ) ) ( not ( = ?auto_297984 ?auto_297991 ) ) ( not ( = ?auto_297984 ?auto_297992 ) ) ( not ( = ?auto_297984 ?auto_297993 ) ) ( not ( = ?auto_297984 ?auto_297994 ) ) ( not ( = ?auto_297985 ?auto_297986 ) ) ( not ( = ?auto_297985 ?auto_297987 ) ) ( not ( = ?auto_297985 ?auto_297988 ) ) ( not ( = ?auto_297985 ?auto_297989 ) ) ( not ( = ?auto_297985 ?auto_297990 ) ) ( not ( = ?auto_297985 ?auto_297991 ) ) ( not ( = ?auto_297985 ?auto_297992 ) ) ( not ( = ?auto_297985 ?auto_297993 ) ) ( not ( = ?auto_297985 ?auto_297994 ) ) ( not ( = ?auto_297986 ?auto_297987 ) ) ( not ( = ?auto_297986 ?auto_297988 ) ) ( not ( = ?auto_297986 ?auto_297989 ) ) ( not ( = ?auto_297986 ?auto_297990 ) ) ( not ( = ?auto_297986 ?auto_297991 ) ) ( not ( = ?auto_297986 ?auto_297992 ) ) ( not ( = ?auto_297986 ?auto_297993 ) ) ( not ( = ?auto_297986 ?auto_297994 ) ) ( not ( = ?auto_297987 ?auto_297988 ) ) ( not ( = ?auto_297987 ?auto_297989 ) ) ( not ( = ?auto_297987 ?auto_297990 ) ) ( not ( = ?auto_297987 ?auto_297991 ) ) ( not ( = ?auto_297987 ?auto_297992 ) ) ( not ( = ?auto_297987 ?auto_297993 ) ) ( not ( = ?auto_297987 ?auto_297994 ) ) ( not ( = ?auto_297988 ?auto_297989 ) ) ( not ( = ?auto_297988 ?auto_297990 ) ) ( not ( = ?auto_297988 ?auto_297991 ) ) ( not ( = ?auto_297988 ?auto_297992 ) ) ( not ( = ?auto_297988 ?auto_297993 ) ) ( not ( = ?auto_297988 ?auto_297994 ) ) ( not ( = ?auto_297989 ?auto_297990 ) ) ( not ( = ?auto_297989 ?auto_297991 ) ) ( not ( = ?auto_297989 ?auto_297992 ) ) ( not ( = ?auto_297989 ?auto_297993 ) ) ( not ( = ?auto_297989 ?auto_297994 ) ) ( not ( = ?auto_297990 ?auto_297991 ) ) ( not ( = ?auto_297990 ?auto_297992 ) ) ( not ( = ?auto_297990 ?auto_297993 ) ) ( not ( = ?auto_297990 ?auto_297994 ) ) ( not ( = ?auto_297991 ?auto_297992 ) ) ( not ( = ?auto_297991 ?auto_297993 ) ) ( not ( = ?auto_297991 ?auto_297994 ) ) ( not ( = ?auto_297992 ?auto_297993 ) ) ( not ( = ?auto_297992 ?auto_297994 ) ) ( not ( = ?auto_297993 ?auto_297994 ) ) ( ON ?auto_297992 ?auto_297993 ) ( ON ?auto_297991 ?auto_297992 ) ( ON ?auto_297990 ?auto_297991 ) ( ON ?auto_297989 ?auto_297990 ) ( ON ?auto_297988 ?auto_297989 ) ( ON ?auto_297987 ?auto_297988 ) ( ON ?auto_297986 ?auto_297987 ) ( ON ?auto_297985 ?auto_297986 ) ( ON ?auto_297984 ?auto_297985 ) ( CLEAR ?auto_297984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_297984 )
      ( MAKE-10PILE ?auto_297984 ?auto_297985 ?auto_297986 ?auto_297987 ?auto_297988 ?auto_297989 ?auto_297990 ?auto_297991 ?auto_297992 ?auto_297993 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_298006 - BLOCK
      ?auto_298007 - BLOCK
      ?auto_298008 - BLOCK
      ?auto_298009 - BLOCK
      ?auto_298010 - BLOCK
      ?auto_298011 - BLOCK
      ?auto_298012 - BLOCK
      ?auto_298013 - BLOCK
      ?auto_298014 - BLOCK
      ?auto_298015 - BLOCK
      ?auto_298016 - BLOCK
    )
    :vars
    (
      ?auto_298017 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_298015 ) ( ON ?auto_298016 ?auto_298017 ) ( CLEAR ?auto_298016 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_298006 ) ( ON ?auto_298007 ?auto_298006 ) ( ON ?auto_298008 ?auto_298007 ) ( ON ?auto_298009 ?auto_298008 ) ( ON ?auto_298010 ?auto_298009 ) ( ON ?auto_298011 ?auto_298010 ) ( ON ?auto_298012 ?auto_298011 ) ( ON ?auto_298013 ?auto_298012 ) ( ON ?auto_298014 ?auto_298013 ) ( ON ?auto_298015 ?auto_298014 ) ( not ( = ?auto_298006 ?auto_298007 ) ) ( not ( = ?auto_298006 ?auto_298008 ) ) ( not ( = ?auto_298006 ?auto_298009 ) ) ( not ( = ?auto_298006 ?auto_298010 ) ) ( not ( = ?auto_298006 ?auto_298011 ) ) ( not ( = ?auto_298006 ?auto_298012 ) ) ( not ( = ?auto_298006 ?auto_298013 ) ) ( not ( = ?auto_298006 ?auto_298014 ) ) ( not ( = ?auto_298006 ?auto_298015 ) ) ( not ( = ?auto_298006 ?auto_298016 ) ) ( not ( = ?auto_298006 ?auto_298017 ) ) ( not ( = ?auto_298007 ?auto_298008 ) ) ( not ( = ?auto_298007 ?auto_298009 ) ) ( not ( = ?auto_298007 ?auto_298010 ) ) ( not ( = ?auto_298007 ?auto_298011 ) ) ( not ( = ?auto_298007 ?auto_298012 ) ) ( not ( = ?auto_298007 ?auto_298013 ) ) ( not ( = ?auto_298007 ?auto_298014 ) ) ( not ( = ?auto_298007 ?auto_298015 ) ) ( not ( = ?auto_298007 ?auto_298016 ) ) ( not ( = ?auto_298007 ?auto_298017 ) ) ( not ( = ?auto_298008 ?auto_298009 ) ) ( not ( = ?auto_298008 ?auto_298010 ) ) ( not ( = ?auto_298008 ?auto_298011 ) ) ( not ( = ?auto_298008 ?auto_298012 ) ) ( not ( = ?auto_298008 ?auto_298013 ) ) ( not ( = ?auto_298008 ?auto_298014 ) ) ( not ( = ?auto_298008 ?auto_298015 ) ) ( not ( = ?auto_298008 ?auto_298016 ) ) ( not ( = ?auto_298008 ?auto_298017 ) ) ( not ( = ?auto_298009 ?auto_298010 ) ) ( not ( = ?auto_298009 ?auto_298011 ) ) ( not ( = ?auto_298009 ?auto_298012 ) ) ( not ( = ?auto_298009 ?auto_298013 ) ) ( not ( = ?auto_298009 ?auto_298014 ) ) ( not ( = ?auto_298009 ?auto_298015 ) ) ( not ( = ?auto_298009 ?auto_298016 ) ) ( not ( = ?auto_298009 ?auto_298017 ) ) ( not ( = ?auto_298010 ?auto_298011 ) ) ( not ( = ?auto_298010 ?auto_298012 ) ) ( not ( = ?auto_298010 ?auto_298013 ) ) ( not ( = ?auto_298010 ?auto_298014 ) ) ( not ( = ?auto_298010 ?auto_298015 ) ) ( not ( = ?auto_298010 ?auto_298016 ) ) ( not ( = ?auto_298010 ?auto_298017 ) ) ( not ( = ?auto_298011 ?auto_298012 ) ) ( not ( = ?auto_298011 ?auto_298013 ) ) ( not ( = ?auto_298011 ?auto_298014 ) ) ( not ( = ?auto_298011 ?auto_298015 ) ) ( not ( = ?auto_298011 ?auto_298016 ) ) ( not ( = ?auto_298011 ?auto_298017 ) ) ( not ( = ?auto_298012 ?auto_298013 ) ) ( not ( = ?auto_298012 ?auto_298014 ) ) ( not ( = ?auto_298012 ?auto_298015 ) ) ( not ( = ?auto_298012 ?auto_298016 ) ) ( not ( = ?auto_298012 ?auto_298017 ) ) ( not ( = ?auto_298013 ?auto_298014 ) ) ( not ( = ?auto_298013 ?auto_298015 ) ) ( not ( = ?auto_298013 ?auto_298016 ) ) ( not ( = ?auto_298013 ?auto_298017 ) ) ( not ( = ?auto_298014 ?auto_298015 ) ) ( not ( = ?auto_298014 ?auto_298016 ) ) ( not ( = ?auto_298014 ?auto_298017 ) ) ( not ( = ?auto_298015 ?auto_298016 ) ) ( not ( = ?auto_298015 ?auto_298017 ) ) ( not ( = ?auto_298016 ?auto_298017 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_298016 ?auto_298017 )
      ( !STACK ?auto_298016 ?auto_298015 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_298029 - BLOCK
      ?auto_298030 - BLOCK
      ?auto_298031 - BLOCK
      ?auto_298032 - BLOCK
      ?auto_298033 - BLOCK
      ?auto_298034 - BLOCK
      ?auto_298035 - BLOCK
      ?auto_298036 - BLOCK
      ?auto_298037 - BLOCK
      ?auto_298038 - BLOCK
      ?auto_298039 - BLOCK
    )
    :vars
    (
      ?auto_298040 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_298038 ) ( ON ?auto_298039 ?auto_298040 ) ( CLEAR ?auto_298039 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_298029 ) ( ON ?auto_298030 ?auto_298029 ) ( ON ?auto_298031 ?auto_298030 ) ( ON ?auto_298032 ?auto_298031 ) ( ON ?auto_298033 ?auto_298032 ) ( ON ?auto_298034 ?auto_298033 ) ( ON ?auto_298035 ?auto_298034 ) ( ON ?auto_298036 ?auto_298035 ) ( ON ?auto_298037 ?auto_298036 ) ( ON ?auto_298038 ?auto_298037 ) ( not ( = ?auto_298029 ?auto_298030 ) ) ( not ( = ?auto_298029 ?auto_298031 ) ) ( not ( = ?auto_298029 ?auto_298032 ) ) ( not ( = ?auto_298029 ?auto_298033 ) ) ( not ( = ?auto_298029 ?auto_298034 ) ) ( not ( = ?auto_298029 ?auto_298035 ) ) ( not ( = ?auto_298029 ?auto_298036 ) ) ( not ( = ?auto_298029 ?auto_298037 ) ) ( not ( = ?auto_298029 ?auto_298038 ) ) ( not ( = ?auto_298029 ?auto_298039 ) ) ( not ( = ?auto_298029 ?auto_298040 ) ) ( not ( = ?auto_298030 ?auto_298031 ) ) ( not ( = ?auto_298030 ?auto_298032 ) ) ( not ( = ?auto_298030 ?auto_298033 ) ) ( not ( = ?auto_298030 ?auto_298034 ) ) ( not ( = ?auto_298030 ?auto_298035 ) ) ( not ( = ?auto_298030 ?auto_298036 ) ) ( not ( = ?auto_298030 ?auto_298037 ) ) ( not ( = ?auto_298030 ?auto_298038 ) ) ( not ( = ?auto_298030 ?auto_298039 ) ) ( not ( = ?auto_298030 ?auto_298040 ) ) ( not ( = ?auto_298031 ?auto_298032 ) ) ( not ( = ?auto_298031 ?auto_298033 ) ) ( not ( = ?auto_298031 ?auto_298034 ) ) ( not ( = ?auto_298031 ?auto_298035 ) ) ( not ( = ?auto_298031 ?auto_298036 ) ) ( not ( = ?auto_298031 ?auto_298037 ) ) ( not ( = ?auto_298031 ?auto_298038 ) ) ( not ( = ?auto_298031 ?auto_298039 ) ) ( not ( = ?auto_298031 ?auto_298040 ) ) ( not ( = ?auto_298032 ?auto_298033 ) ) ( not ( = ?auto_298032 ?auto_298034 ) ) ( not ( = ?auto_298032 ?auto_298035 ) ) ( not ( = ?auto_298032 ?auto_298036 ) ) ( not ( = ?auto_298032 ?auto_298037 ) ) ( not ( = ?auto_298032 ?auto_298038 ) ) ( not ( = ?auto_298032 ?auto_298039 ) ) ( not ( = ?auto_298032 ?auto_298040 ) ) ( not ( = ?auto_298033 ?auto_298034 ) ) ( not ( = ?auto_298033 ?auto_298035 ) ) ( not ( = ?auto_298033 ?auto_298036 ) ) ( not ( = ?auto_298033 ?auto_298037 ) ) ( not ( = ?auto_298033 ?auto_298038 ) ) ( not ( = ?auto_298033 ?auto_298039 ) ) ( not ( = ?auto_298033 ?auto_298040 ) ) ( not ( = ?auto_298034 ?auto_298035 ) ) ( not ( = ?auto_298034 ?auto_298036 ) ) ( not ( = ?auto_298034 ?auto_298037 ) ) ( not ( = ?auto_298034 ?auto_298038 ) ) ( not ( = ?auto_298034 ?auto_298039 ) ) ( not ( = ?auto_298034 ?auto_298040 ) ) ( not ( = ?auto_298035 ?auto_298036 ) ) ( not ( = ?auto_298035 ?auto_298037 ) ) ( not ( = ?auto_298035 ?auto_298038 ) ) ( not ( = ?auto_298035 ?auto_298039 ) ) ( not ( = ?auto_298035 ?auto_298040 ) ) ( not ( = ?auto_298036 ?auto_298037 ) ) ( not ( = ?auto_298036 ?auto_298038 ) ) ( not ( = ?auto_298036 ?auto_298039 ) ) ( not ( = ?auto_298036 ?auto_298040 ) ) ( not ( = ?auto_298037 ?auto_298038 ) ) ( not ( = ?auto_298037 ?auto_298039 ) ) ( not ( = ?auto_298037 ?auto_298040 ) ) ( not ( = ?auto_298038 ?auto_298039 ) ) ( not ( = ?auto_298038 ?auto_298040 ) ) ( not ( = ?auto_298039 ?auto_298040 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_298039 ?auto_298040 )
      ( !STACK ?auto_298039 ?auto_298038 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_298052 - BLOCK
      ?auto_298053 - BLOCK
      ?auto_298054 - BLOCK
      ?auto_298055 - BLOCK
      ?auto_298056 - BLOCK
      ?auto_298057 - BLOCK
      ?auto_298058 - BLOCK
      ?auto_298059 - BLOCK
      ?auto_298060 - BLOCK
      ?auto_298061 - BLOCK
      ?auto_298062 - BLOCK
    )
    :vars
    (
      ?auto_298063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298062 ?auto_298063 ) ( ON-TABLE ?auto_298052 ) ( ON ?auto_298053 ?auto_298052 ) ( ON ?auto_298054 ?auto_298053 ) ( ON ?auto_298055 ?auto_298054 ) ( ON ?auto_298056 ?auto_298055 ) ( ON ?auto_298057 ?auto_298056 ) ( ON ?auto_298058 ?auto_298057 ) ( ON ?auto_298059 ?auto_298058 ) ( ON ?auto_298060 ?auto_298059 ) ( not ( = ?auto_298052 ?auto_298053 ) ) ( not ( = ?auto_298052 ?auto_298054 ) ) ( not ( = ?auto_298052 ?auto_298055 ) ) ( not ( = ?auto_298052 ?auto_298056 ) ) ( not ( = ?auto_298052 ?auto_298057 ) ) ( not ( = ?auto_298052 ?auto_298058 ) ) ( not ( = ?auto_298052 ?auto_298059 ) ) ( not ( = ?auto_298052 ?auto_298060 ) ) ( not ( = ?auto_298052 ?auto_298061 ) ) ( not ( = ?auto_298052 ?auto_298062 ) ) ( not ( = ?auto_298052 ?auto_298063 ) ) ( not ( = ?auto_298053 ?auto_298054 ) ) ( not ( = ?auto_298053 ?auto_298055 ) ) ( not ( = ?auto_298053 ?auto_298056 ) ) ( not ( = ?auto_298053 ?auto_298057 ) ) ( not ( = ?auto_298053 ?auto_298058 ) ) ( not ( = ?auto_298053 ?auto_298059 ) ) ( not ( = ?auto_298053 ?auto_298060 ) ) ( not ( = ?auto_298053 ?auto_298061 ) ) ( not ( = ?auto_298053 ?auto_298062 ) ) ( not ( = ?auto_298053 ?auto_298063 ) ) ( not ( = ?auto_298054 ?auto_298055 ) ) ( not ( = ?auto_298054 ?auto_298056 ) ) ( not ( = ?auto_298054 ?auto_298057 ) ) ( not ( = ?auto_298054 ?auto_298058 ) ) ( not ( = ?auto_298054 ?auto_298059 ) ) ( not ( = ?auto_298054 ?auto_298060 ) ) ( not ( = ?auto_298054 ?auto_298061 ) ) ( not ( = ?auto_298054 ?auto_298062 ) ) ( not ( = ?auto_298054 ?auto_298063 ) ) ( not ( = ?auto_298055 ?auto_298056 ) ) ( not ( = ?auto_298055 ?auto_298057 ) ) ( not ( = ?auto_298055 ?auto_298058 ) ) ( not ( = ?auto_298055 ?auto_298059 ) ) ( not ( = ?auto_298055 ?auto_298060 ) ) ( not ( = ?auto_298055 ?auto_298061 ) ) ( not ( = ?auto_298055 ?auto_298062 ) ) ( not ( = ?auto_298055 ?auto_298063 ) ) ( not ( = ?auto_298056 ?auto_298057 ) ) ( not ( = ?auto_298056 ?auto_298058 ) ) ( not ( = ?auto_298056 ?auto_298059 ) ) ( not ( = ?auto_298056 ?auto_298060 ) ) ( not ( = ?auto_298056 ?auto_298061 ) ) ( not ( = ?auto_298056 ?auto_298062 ) ) ( not ( = ?auto_298056 ?auto_298063 ) ) ( not ( = ?auto_298057 ?auto_298058 ) ) ( not ( = ?auto_298057 ?auto_298059 ) ) ( not ( = ?auto_298057 ?auto_298060 ) ) ( not ( = ?auto_298057 ?auto_298061 ) ) ( not ( = ?auto_298057 ?auto_298062 ) ) ( not ( = ?auto_298057 ?auto_298063 ) ) ( not ( = ?auto_298058 ?auto_298059 ) ) ( not ( = ?auto_298058 ?auto_298060 ) ) ( not ( = ?auto_298058 ?auto_298061 ) ) ( not ( = ?auto_298058 ?auto_298062 ) ) ( not ( = ?auto_298058 ?auto_298063 ) ) ( not ( = ?auto_298059 ?auto_298060 ) ) ( not ( = ?auto_298059 ?auto_298061 ) ) ( not ( = ?auto_298059 ?auto_298062 ) ) ( not ( = ?auto_298059 ?auto_298063 ) ) ( not ( = ?auto_298060 ?auto_298061 ) ) ( not ( = ?auto_298060 ?auto_298062 ) ) ( not ( = ?auto_298060 ?auto_298063 ) ) ( not ( = ?auto_298061 ?auto_298062 ) ) ( not ( = ?auto_298061 ?auto_298063 ) ) ( not ( = ?auto_298062 ?auto_298063 ) ) ( CLEAR ?auto_298060 ) ( ON ?auto_298061 ?auto_298062 ) ( CLEAR ?auto_298061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_298052 ?auto_298053 ?auto_298054 ?auto_298055 ?auto_298056 ?auto_298057 ?auto_298058 ?auto_298059 ?auto_298060 ?auto_298061 )
      ( MAKE-11PILE ?auto_298052 ?auto_298053 ?auto_298054 ?auto_298055 ?auto_298056 ?auto_298057 ?auto_298058 ?auto_298059 ?auto_298060 ?auto_298061 ?auto_298062 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_298075 - BLOCK
      ?auto_298076 - BLOCK
      ?auto_298077 - BLOCK
      ?auto_298078 - BLOCK
      ?auto_298079 - BLOCK
      ?auto_298080 - BLOCK
      ?auto_298081 - BLOCK
      ?auto_298082 - BLOCK
      ?auto_298083 - BLOCK
      ?auto_298084 - BLOCK
      ?auto_298085 - BLOCK
    )
    :vars
    (
      ?auto_298086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298085 ?auto_298086 ) ( ON-TABLE ?auto_298075 ) ( ON ?auto_298076 ?auto_298075 ) ( ON ?auto_298077 ?auto_298076 ) ( ON ?auto_298078 ?auto_298077 ) ( ON ?auto_298079 ?auto_298078 ) ( ON ?auto_298080 ?auto_298079 ) ( ON ?auto_298081 ?auto_298080 ) ( ON ?auto_298082 ?auto_298081 ) ( ON ?auto_298083 ?auto_298082 ) ( not ( = ?auto_298075 ?auto_298076 ) ) ( not ( = ?auto_298075 ?auto_298077 ) ) ( not ( = ?auto_298075 ?auto_298078 ) ) ( not ( = ?auto_298075 ?auto_298079 ) ) ( not ( = ?auto_298075 ?auto_298080 ) ) ( not ( = ?auto_298075 ?auto_298081 ) ) ( not ( = ?auto_298075 ?auto_298082 ) ) ( not ( = ?auto_298075 ?auto_298083 ) ) ( not ( = ?auto_298075 ?auto_298084 ) ) ( not ( = ?auto_298075 ?auto_298085 ) ) ( not ( = ?auto_298075 ?auto_298086 ) ) ( not ( = ?auto_298076 ?auto_298077 ) ) ( not ( = ?auto_298076 ?auto_298078 ) ) ( not ( = ?auto_298076 ?auto_298079 ) ) ( not ( = ?auto_298076 ?auto_298080 ) ) ( not ( = ?auto_298076 ?auto_298081 ) ) ( not ( = ?auto_298076 ?auto_298082 ) ) ( not ( = ?auto_298076 ?auto_298083 ) ) ( not ( = ?auto_298076 ?auto_298084 ) ) ( not ( = ?auto_298076 ?auto_298085 ) ) ( not ( = ?auto_298076 ?auto_298086 ) ) ( not ( = ?auto_298077 ?auto_298078 ) ) ( not ( = ?auto_298077 ?auto_298079 ) ) ( not ( = ?auto_298077 ?auto_298080 ) ) ( not ( = ?auto_298077 ?auto_298081 ) ) ( not ( = ?auto_298077 ?auto_298082 ) ) ( not ( = ?auto_298077 ?auto_298083 ) ) ( not ( = ?auto_298077 ?auto_298084 ) ) ( not ( = ?auto_298077 ?auto_298085 ) ) ( not ( = ?auto_298077 ?auto_298086 ) ) ( not ( = ?auto_298078 ?auto_298079 ) ) ( not ( = ?auto_298078 ?auto_298080 ) ) ( not ( = ?auto_298078 ?auto_298081 ) ) ( not ( = ?auto_298078 ?auto_298082 ) ) ( not ( = ?auto_298078 ?auto_298083 ) ) ( not ( = ?auto_298078 ?auto_298084 ) ) ( not ( = ?auto_298078 ?auto_298085 ) ) ( not ( = ?auto_298078 ?auto_298086 ) ) ( not ( = ?auto_298079 ?auto_298080 ) ) ( not ( = ?auto_298079 ?auto_298081 ) ) ( not ( = ?auto_298079 ?auto_298082 ) ) ( not ( = ?auto_298079 ?auto_298083 ) ) ( not ( = ?auto_298079 ?auto_298084 ) ) ( not ( = ?auto_298079 ?auto_298085 ) ) ( not ( = ?auto_298079 ?auto_298086 ) ) ( not ( = ?auto_298080 ?auto_298081 ) ) ( not ( = ?auto_298080 ?auto_298082 ) ) ( not ( = ?auto_298080 ?auto_298083 ) ) ( not ( = ?auto_298080 ?auto_298084 ) ) ( not ( = ?auto_298080 ?auto_298085 ) ) ( not ( = ?auto_298080 ?auto_298086 ) ) ( not ( = ?auto_298081 ?auto_298082 ) ) ( not ( = ?auto_298081 ?auto_298083 ) ) ( not ( = ?auto_298081 ?auto_298084 ) ) ( not ( = ?auto_298081 ?auto_298085 ) ) ( not ( = ?auto_298081 ?auto_298086 ) ) ( not ( = ?auto_298082 ?auto_298083 ) ) ( not ( = ?auto_298082 ?auto_298084 ) ) ( not ( = ?auto_298082 ?auto_298085 ) ) ( not ( = ?auto_298082 ?auto_298086 ) ) ( not ( = ?auto_298083 ?auto_298084 ) ) ( not ( = ?auto_298083 ?auto_298085 ) ) ( not ( = ?auto_298083 ?auto_298086 ) ) ( not ( = ?auto_298084 ?auto_298085 ) ) ( not ( = ?auto_298084 ?auto_298086 ) ) ( not ( = ?auto_298085 ?auto_298086 ) ) ( CLEAR ?auto_298083 ) ( ON ?auto_298084 ?auto_298085 ) ( CLEAR ?auto_298084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_298075 ?auto_298076 ?auto_298077 ?auto_298078 ?auto_298079 ?auto_298080 ?auto_298081 ?auto_298082 ?auto_298083 ?auto_298084 )
      ( MAKE-11PILE ?auto_298075 ?auto_298076 ?auto_298077 ?auto_298078 ?auto_298079 ?auto_298080 ?auto_298081 ?auto_298082 ?auto_298083 ?auto_298084 ?auto_298085 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_298098 - BLOCK
      ?auto_298099 - BLOCK
      ?auto_298100 - BLOCK
      ?auto_298101 - BLOCK
      ?auto_298102 - BLOCK
      ?auto_298103 - BLOCK
      ?auto_298104 - BLOCK
      ?auto_298105 - BLOCK
      ?auto_298106 - BLOCK
      ?auto_298107 - BLOCK
      ?auto_298108 - BLOCK
    )
    :vars
    (
      ?auto_298109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298108 ?auto_298109 ) ( ON-TABLE ?auto_298098 ) ( ON ?auto_298099 ?auto_298098 ) ( ON ?auto_298100 ?auto_298099 ) ( ON ?auto_298101 ?auto_298100 ) ( ON ?auto_298102 ?auto_298101 ) ( ON ?auto_298103 ?auto_298102 ) ( ON ?auto_298104 ?auto_298103 ) ( ON ?auto_298105 ?auto_298104 ) ( not ( = ?auto_298098 ?auto_298099 ) ) ( not ( = ?auto_298098 ?auto_298100 ) ) ( not ( = ?auto_298098 ?auto_298101 ) ) ( not ( = ?auto_298098 ?auto_298102 ) ) ( not ( = ?auto_298098 ?auto_298103 ) ) ( not ( = ?auto_298098 ?auto_298104 ) ) ( not ( = ?auto_298098 ?auto_298105 ) ) ( not ( = ?auto_298098 ?auto_298106 ) ) ( not ( = ?auto_298098 ?auto_298107 ) ) ( not ( = ?auto_298098 ?auto_298108 ) ) ( not ( = ?auto_298098 ?auto_298109 ) ) ( not ( = ?auto_298099 ?auto_298100 ) ) ( not ( = ?auto_298099 ?auto_298101 ) ) ( not ( = ?auto_298099 ?auto_298102 ) ) ( not ( = ?auto_298099 ?auto_298103 ) ) ( not ( = ?auto_298099 ?auto_298104 ) ) ( not ( = ?auto_298099 ?auto_298105 ) ) ( not ( = ?auto_298099 ?auto_298106 ) ) ( not ( = ?auto_298099 ?auto_298107 ) ) ( not ( = ?auto_298099 ?auto_298108 ) ) ( not ( = ?auto_298099 ?auto_298109 ) ) ( not ( = ?auto_298100 ?auto_298101 ) ) ( not ( = ?auto_298100 ?auto_298102 ) ) ( not ( = ?auto_298100 ?auto_298103 ) ) ( not ( = ?auto_298100 ?auto_298104 ) ) ( not ( = ?auto_298100 ?auto_298105 ) ) ( not ( = ?auto_298100 ?auto_298106 ) ) ( not ( = ?auto_298100 ?auto_298107 ) ) ( not ( = ?auto_298100 ?auto_298108 ) ) ( not ( = ?auto_298100 ?auto_298109 ) ) ( not ( = ?auto_298101 ?auto_298102 ) ) ( not ( = ?auto_298101 ?auto_298103 ) ) ( not ( = ?auto_298101 ?auto_298104 ) ) ( not ( = ?auto_298101 ?auto_298105 ) ) ( not ( = ?auto_298101 ?auto_298106 ) ) ( not ( = ?auto_298101 ?auto_298107 ) ) ( not ( = ?auto_298101 ?auto_298108 ) ) ( not ( = ?auto_298101 ?auto_298109 ) ) ( not ( = ?auto_298102 ?auto_298103 ) ) ( not ( = ?auto_298102 ?auto_298104 ) ) ( not ( = ?auto_298102 ?auto_298105 ) ) ( not ( = ?auto_298102 ?auto_298106 ) ) ( not ( = ?auto_298102 ?auto_298107 ) ) ( not ( = ?auto_298102 ?auto_298108 ) ) ( not ( = ?auto_298102 ?auto_298109 ) ) ( not ( = ?auto_298103 ?auto_298104 ) ) ( not ( = ?auto_298103 ?auto_298105 ) ) ( not ( = ?auto_298103 ?auto_298106 ) ) ( not ( = ?auto_298103 ?auto_298107 ) ) ( not ( = ?auto_298103 ?auto_298108 ) ) ( not ( = ?auto_298103 ?auto_298109 ) ) ( not ( = ?auto_298104 ?auto_298105 ) ) ( not ( = ?auto_298104 ?auto_298106 ) ) ( not ( = ?auto_298104 ?auto_298107 ) ) ( not ( = ?auto_298104 ?auto_298108 ) ) ( not ( = ?auto_298104 ?auto_298109 ) ) ( not ( = ?auto_298105 ?auto_298106 ) ) ( not ( = ?auto_298105 ?auto_298107 ) ) ( not ( = ?auto_298105 ?auto_298108 ) ) ( not ( = ?auto_298105 ?auto_298109 ) ) ( not ( = ?auto_298106 ?auto_298107 ) ) ( not ( = ?auto_298106 ?auto_298108 ) ) ( not ( = ?auto_298106 ?auto_298109 ) ) ( not ( = ?auto_298107 ?auto_298108 ) ) ( not ( = ?auto_298107 ?auto_298109 ) ) ( not ( = ?auto_298108 ?auto_298109 ) ) ( ON ?auto_298107 ?auto_298108 ) ( CLEAR ?auto_298105 ) ( ON ?auto_298106 ?auto_298107 ) ( CLEAR ?auto_298106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_298098 ?auto_298099 ?auto_298100 ?auto_298101 ?auto_298102 ?auto_298103 ?auto_298104 ?auto_298105 ?auto_298106 )
      ( MAKE-11PILE ?auto_298098 ?auto_298099 ?auto_298100 ?auto_298101 ?auto_298102 ?auto_298103 ?auto_298104 ?auto_298105 ?auto_298106 ?auto_298107 ?auto_298108 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_298121 - BLOCK
      ?auto_298122 - BLOCK
      ?auto_298123 - BLOCK
      ?auto_298124 - BLOCK
      ?auto_298125 - BLOCK
      ?auto_298126 - BLOCK
      ?auto_298127 - BLOCK
      ?auto_298128 - BLOCK
      ?auto_298129 - BLOCK
      ?auto_298130 - BLOCK
      ?auto_298131 - BLOCK
    )
    :vars
    (
      ?auto_298132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298131 ?auto_298132 ) ( ON-TABLE ?auto_298121 ) ( ON ?auto_298122 ?auto_298121 ) ( ON ?auto_298123 ?auto_298122 ) ( ON ?auto_298124 ?auto_298123 ) ( ON ?auto_298125 ?auto_298124 ) ( ON ?auto_298126 ?auto_298125 ) ( ON ?auto_298127 ?auto_298126 ) ( ON ?auto_298128 ?auto_298127 ) ( not ( = ?auto_298121 ?auto_298122 ) ) ( not ( = ?auto_298121 ?auto_298123 ) ) ( not ( = ?auto_298121 ?auto_298124 ) ) ( not ( = ?auto_298121 ?auto_298125 ) ) ( not ( = ?auto_298121 ?auto_298126 ) ) ( not ( = ?auto_298121 ?auto_298127 ) ) ( not ( = ?auto_298121 ?auto_298128 ) ) ( not ( = ?auto_298121 ?auto_298129 ) ) ( not ( = ?auto_298121 ?auto_298130 ) ) ( not ( = ?auto_298121 ?auto_298131 ) ) ( not ( = ?auto_298121 ?auto_298132 ) ) ( not ( = ?auto_298122 ?auto_298123 ) ) ( not ( = ?auto_298122 ?auto_298124 ) ) ( not ( = ?auto_298122 ?auto_298125 ) ) ( not ( = ?auto_298122 ?auto_298126 ) ) ( not ( = ?auto_298122 ?auto_298127 ) ) ( not ( = ?auto_298122 ?auto_298128 ) ) ( not ( = ?auto_298122 ?auto_298129 ) ) ( not ( = ?auto_298122 ?auto_298130 ) ) ( not ( = ?auto_298122 ?auto_298131 ) ) ( not ( = ?auto_298122 ?auto_298132 ) ) ( not ( = ?auto_298123 ?auto_298124 ) ) ( not ( = ?auto_298123 ?auto_298125 ) ) ( not ( = ?auto_298123 ?auto_298126 ) ) ( not ( = ?auto_298123 ?auto_298127 ) ) ( not ( = ?auto_298123 ?auto_298128 ) ) ( not ( = ?auto_298123 ?auto_298129 ) ) ( not ( = ?auto_298123 ?auto_298130 ) ) ( not ( = ?auto_298123 ?auto_298131 ) ) ( not ( = ?auto_298123 ?auto_298132 ) ) ( not ( = ?auto_298124 ?auto_298125 ) ) ( not ( = ?auto_298124 ?auto_298126 ) ) ( not ( = ?auto_298124 ?auto_298127 ) ) ( not ( = ?auto_298124 ?auto_298128 ) ) ( not ( = ?auto_298124 ?auto_298129 ) ) ( not ( = ?auto_298124 ?auto_298130 ) ) ( not ( = ?auto_298124 ?auto_298131 ) ) ( not ( = ?auto_298124 ?auto_298132 ) ) ( not ( = ?auto_298125 ?auto_298126 ) ) ( not ( = ?auto_298125 ?auto_298127 ) ) ( not ( = ?auto_298125 ?auto_298128 ) ) ( not ( = ?auto_298125 ?auto_298129 ) ) ( not ( = ?auto_298125 ?auto_298130 ) ) ( not ( = ?auto_298125 ?auto_298131 ) ) ( not ( = ?auto_298125 ?auto_298132 ) ) ( not ( = ?auto_298126 ?auto_298127 ) ) ( not ( = ?auto_298126 ?auto_298128 ) ) ( not ( = ?auto_298126 ?auto_298129 ) ) ( not ( = ?auto_298126 ?auto_298130 ) ) ( not ( = ?auto_298126 ?auto_298131 ) ) ( not ( = ?auto_298126 ?auto_298132 ) ) ( not ( = ?auto_298127 ?auto_298128 ) ) ( not ( = ?auto_298127 ?auto_298129 ) ) ( not ( = ?auto_298127 ?auto_298130 ) ) ( not ( = ?auto_298127 ?auto_298131 ) ) ( not ( = ?auto_298127 ?auto_298132 ) ) ( not ( = ?auto_298128 ?auto_298129 ) ) ( not ( = ?auto_298128 ?auto_298130 ) ) ( not ( = ?auto_298128 ?auto_298131 ) ) ( not ( = ?auto_298128 ?auto_298132 ) ) ( not ( = ?auto_298129 ?auto_298130 ) ) ( not ( = ?auto_298129 ?auto_298131 ) ) ( not ( = ?auto_298129 ?auto_298132 ) ) ( not ( = ?auto_298130 ?auto_298131 ) ) ( not ( = ?auto_298130 ?auto_298132 ) ) ( not ( = ?auto_298131 ?auto_298132 ) ) ( ON ?auto_298130 ?auto_298131 ) ( CLEAR ?auto_298128 ) ( ON ?auto_298129 ?auto_298130 ) ( CLEAR ?auto_298129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_298121 ?auto_298122 ?auto_298123 ?auto_298124 ?auto_298125 ?auto_298126 ?auto_298127 ?auto_298128 ?auto_298129 )
      ( MAKE-11PILE ?auto_298121 ?auto_298122 ?auto_298123 ?auto_298124 ?auto_298125 ?auto_298126 ?auto_298127 ?auto_298128 ?auto_298129 ?auto_298130 ?auto_298131 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_298144 - BLOCK
      ?auto_298145 - BLOCK
      ?auto_298146 - BLOCK
      ?auto_298147 - BLOCK
      ?auto_298148 - BLOCK
      ?auto_298149 - BLOCK
      ?auto_298150 - BLOCK
      ?auto_298151 - BLOCK
      ?auto_298152 - BLOCK
      ?auto_298153 - BLOCK
      ?auto_298154 - BLOCK
    )
    :vars
    (
      ?auto_298155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298154 ?auto_298155 ) ( ON-TABLE ?auto_298144 ) ( ON ?auto_298145 ?auto_298144 ) ( ON ?auto_298146 ?auto_298145 ) ( ON ?auto_298147 ?auto_298146 ) ( ON ?auto_298148 ?auto_298147 ) ( ON ?auto_298149 ?auto_298148 ) ( ON ?auto_298150 ?auto_298149 ) ( not ( = ?auto_298144 ?auto_298145 ) ) ( not ( = ?auto_298144 ?auto_298146 ) ) ( not ( = ?auto_298144 ?auto_298147 ) ) ( not ( = ?auto_298144 ?auto_298148 ) ) ( not ( = ?auto_298144 ?auto_298149 ) ) ( not ( = ?auto_298144 ?auto_298150 ) ) ( not ( = ?auto_298144 ?auto_298151 ) ) ( not ( = ?auto_298144 ?auto_298152 ) ) ( not ( = ?auto_298144 ?auto_298153 ) ) ( not ( = ?auto_298144 ?auto_298154 ) ) ( not ( = ?auto_298144 ?auto_298155 ) ) ( not ( = ?auto_298145 ?auto_298146 ) ) ( not ( = ?auto_298145 ?auto_298147 ) ) ( not ( = ?auto_298145 ?auto_298148 ) ) ( not ( = ?auto_298145 ?auto_298149 ) ) ( not ( = ?auto_298145 ?auto_298150 ) ) ( not ( = ?auto_298145 ?auto_298151 ) ) ( not ( = ?auto_298145 ?auto_298152 ) ) ( not ( = ?auto_298145 ?auto_298153 ) ) ( not ( = ?auto_298145 ?auto_298154 ) ) ( not ( = ?auto_298145 ?auto_298155 ) ) ( not ( = ?auto_298146 ?auto_298147 ) ) ( not ( = ?auto_298146 ?auto_298148 ) ) ( not ( = ?auto_298146 ?auto_298149 ) ) ( not ( = ?auto_298146 ?auto_298150 ) ) ( not ( = ?auto_298146 ?auto_298151 ) ) ( not ( = ?auto_298146 ?auto_298152 ) ) ( not ( = ?auto_298146 ?auto_298153 ) ) ( not ( = ?auto_298146 ?auto_298154 ) ) ( not ( = ?auto_298146 ?auto_298155 ) ) ( not ( = ?auto_298147 ?auto_298148 ) ) ( not ( = ?auto_298147 ?auto_298149 ) ) ( not ( = ?auto_298147 ?auto_298150 ) ) ( not ( = ?auto_298147 ?auto_298151 ) ) ( not ( = ?auto_298147 ?auto_298152 ) ) ( not ( = ?auto_298147 ?auto_298153 ) ) ( not ( = ?auto_298147 ?auto_298154 ) ) ( not ( = ?auto_298147 ?auto_298155 ) ) ( not ( = ?auto_298148 ?auto_298149 ) ) ( not ( = ?auto_298148 ?auto_298150 ) ) ( not ( = ?auto_298148 ?auto_298151 ) ) ( not ( = ?auto_298148 ?auto_298152 ) ) ( not ( = ?auto_298148 ?auto_298153 ) ) ( not ( = ?auto_298148 ?auto_298154 ) ) ( not ( = ?auto_298148 ?auto_298155 ) ) ( not ( = ?auto_298149 ?auto_298150 ) ) ( not ( = ?auto_298149 ?auto_298151 ) ) ( not ( = ?auto_298149 ?auto_298152 ) ) ( not ( = ?auto_298149 ?auto_298153 ) ) ( not ( = ?auto_298149 ?auto_298154 ) ) ( not ( = ?auto_298149 ?auto_298155 ) ) ( not ( = ?auto_298150 ?auto_298151 ) ) ( not ( = ?auto_298150 ?auto_298152 ) ) ( not ( = ?auto_298150 ?auto_298153 ) ) ( not ( = ?auto_298150 ?auto_298154 ) ) ( not ( = ?auto_298150 ?auto_298155 ) ) ( not ( = ?auto_298151 ?auto_298152 ) ) ( not ( = ?auto_298151 ?auto_298153 ) ) ( not ( = ?auto_298151 ?auto_298154 ) ) ( not ( = ?auto_298151 ?auto_298155 ) ) ( not ( = ?auto_298152 ?auto_298153 ) ) ( not ( = ?auto_298152 ?auto_298154 ) ) ( not ( = ?auto_298152 ?auto_298155 ) ) ( not ( = ?auto_298153 ?auto_298154 ) ) ( not ( = ?auto_298153 ?auto_298155 ) ) ( not ( = ?auto_298154 ?auto_298155 ) ) ( ON ?auto_298153 ?auto_298154 ) ( ON ?auto_298152 ?auto_298153 ) ( CLEAR ?auto_298150 ) ( ON ?auto_298151 ?auto_298152 ) ( CLEAR ?auto_298151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_298144 ?auto_298145 ?auto_298146 ?auto_298147 ?auto_298148 ?auto_298149 ?auto_298150 ?auto_298151 )
      ( MAKE-11PILE ?auto_298144 ?auto_298145 ?auto_298146 ?auto_298147 ?auto_298148 ?auto_298149 ?auto_298150 ?auto_298151 ?auto_298152 ?auto_298153 ?auto_298154 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_298167 - BLOCK
      ?auto_298168 - BLOCK
      ?auto_298169 - BLOCK
      ?auto_298170 - BLOCK
      ?auto_298171 - BLOCK
      ?auto_298172 - BLOCK
      ?auto_298173 - BLOCK
      ?auto_298174 - BLOCK
      ?auto_298175 - BLOCK
      ?auto_298176 - BLOCK
      ?auto_298177 - BLOCK
    )
    :vars
    (
      ?auto_298178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298177 ?auto_298178 ) ( ON-TABLE ?auto_298167 ) ( ON ?auto_298168 ?auto_298167 ) ( ON ?auto_298169 ?auto_298168 ) ( ON ?auto_298170 ?auto_298169 ) ( ON ?auto_298171 ?auto_298170 ) ( ON ?auto_298172 ?auto_298171 ) ( ON ?auto_298173 ?auto_298172 ) ( not ( = ?auto_298167 ?auto_298168 ) ) ( not ( = ?auto_298167 ?auto_298169 ) ) ( not ( = ?auto_298167 ?auto_298170 ) ) ( not ( = ?auto_298167 ?auto_298171 ) ) ( not ( = ?auto_298167 ?auto_298172 ) ) ( not ( = ?auto_298167 ?auto_298173 ) ) ( not ( = ?auto_298167 ?auto_298174 ) ) ( not ( = ?auto_298167 ?auto_298175 ) ) ( not ( = ?auto_298167 ?auto_298176 ) ) ( not ( = ?auto_298167 ?auto_298177 ) ) ( not ( = ?auto_298167 ?auto_298178 ) ) ( not ( = ?auto_298168 ?auto_298169 ) ) ( not ( = ?auto_298168 ?auto_298170 ) ) ( not ( = ?auto_298168 ?auto_298171 ) ) ( not ( = ?auto_298168 ?auto_298172 ) ) ( not ( = ?auto_298168 ?auto_298173 ) ) ( not ( = ?auto_298168 ?auto_298174 ) ) ( not ( = ?auto_298168 ?auto_298175 ) ) ( not ( = ?auto_298168 ?auto_298176 ) ) ( not ( = ?auto_298168 ?auto_298177 ) ) ( not ( = ?auto_298168 ?auto_298178 ) ) ( not ( = ?auto_298169 ?auto_298170 ) ) ( not ( = ?auto_298169 ?auto_298171 ) ) ( not ( = ?auto_298169 ?auto_298172 ) ) ( not ( = ?auto_298169 ?auto_298173 ) ) ( not ( = ?auto_298169 ?auto_298174 ) ) ( not ( = ?auto_298169 ?auto_298175 ) ) ( not ( = ?auto_298169 ?auto_298176 ) ) ( not ( = ?auto_298169 ?auto_298177 ) ) ( not ( = ?auto_298169 ?auto_298178 ) ) ( not ( = ?auto_298170 ?auto_298171 ) ) ( not ( = ?auto_298170 ?auto_298172 ) ) ( not ( = ?auto_298170 ?auto_298173 ) ) ( not ( = ?auto_298170 ?auto_298174 ) ) ( not ( = ?auto_298170 ?auto_298175 ) ) ( not ( = ?auto_298170 ?auto_298176 ) ) ( not ( = ?auto_298170 ?auto_298177 ) ) ( not ( = ?auto_298170 ?auto_298178 ) ) ( not ( = ?auto_298171 ?auto_298172 ) ) ( not ( = ?auto_298171 ?auto_298173 ) ) ( not ( = ?auto_298171 ?auto_298174 ) ) ( not ( = ?auto_298171 ?auto_298175 ) ) ( not ( = ?auto_298171 ?auto_298176 ) ) ( not ( = ?auto_298171 ?auto_298177 ) ) ( not ( = ?auto_298171 ?auto_298178 ) ) ( not ( = ?auto_298172 ?auto_298173 ) ) ( not ( = ?auto_298172 ?auto_298174 ) ) ( not ( = ?auto_298172 ?auto_298175 ) ) ( not ( = ?auto_298172 ?auto_298176 ) ) ( not ( = ?auto_298172 ?auto_298177 ) ) ( not ( = ?auto_298172 ?auto_298178 ) ) ( not ( = ?auto_298173 ?auto_298174 ) ) ( not ( = ?auto_298173 ?auto_298175 ) ) ( not ( = ?auto_298173 ?auto_298176 ) ) ( not ( = ?auto_298173 ?auto_298177 ) ) ( not ( = ?auto_298173 ?auto_298178 ) ) ( not ( = ?auto_298174 ?auto_298175 ) ) ( not ( = ?auto_298174 ?auto_298176 ) ) ( not ( = ?auto_298174 ?auto_298177 ) ) ( not ( = ?auto_298174 ?auto_298178 ) ) ( not ( = ?auto_298175 ?auto_298176 ) ) ( not ( = ?auto_298175 ?auto_298177 ) ) ( not ( = ?auto_298175 ?auto_298178 ) ) ( not ( = ?auto_298176 ?auto_298177 ) ) ( not ( = ?auto_298176 ?auto_298178 ) ) ( not ( = ?auto_298177 ?auto_298178 ) ) ( ON ?auto_298176 ?auto_298177 ) ( ON ?auto_298175 ?auto_298176 ) ( CLEAR ?auto_298173 ) ( ON ?auto_298174 ?auto_298175 ) ( CLEAR ?auto_298174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_298167 ?auto_298168 ?auto_298169 ?auto_298170 ?auto_298171 ?auto_298172 ?auto_298173 ?auto_298174 )
      ( MAKE-11PILE ?auto_298167 ?auto_298168 ?auto_298169 ?auto_298170 ?auto_298171 ?auto_298172 ?auto_298173 ?auto_298174 ?auto_298175 ?auto_298176 ?auto_298177 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_298190 - BLOCK
      ?auto_298191 - BLOCK
      ?auto_298192 - BLOCK
      ?auto_298193 - BLOCK
      ?auto_298194 - BLOCK
      ?auto_298195 - BLOCK
      ?auto_298196 - BLOCK
      ?auto_298197 - BLOCK
      ?auto_298198 - BLOCK
      ?auto_298199 - BLOCK
      ?auto_298200 - BLOCK
    )
    :vars
    (
      ?auto_298201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298200 ?auto_298201 ) ( ON-TABLE ?auto_298190 ) ( ON ?auto_298191 ?auto_298190 ) ( ON ?auto_298192 ?auto_298191 ) ( ON ?auto_298193 ?auto_298192 ) ( ON ?auto_298194 ?auto_298193 ) ( ON ?auto_298195 ?auto_298194 ) ( not ( = ?auto_298190 ?auto_298191 ) ) ( not ( = ?auto_298190 ?auto_298192 ) ) ( not ( = ?auto_298190 ?auto_298193 ) ) ( not ( = ?auto_298190 ?auto_298194 ) ) ( not ( = ?auto_298190 ?auto_298195 ) ) ( not ( = ?auto_298190 ?auto_298196 ) ) ( not ( = ?auto_298190 ?auto_298197 ) ) ( not ( = ?auto_298190 ?auto_298198 ) ) ( not ( = ?auto_298190 ?auto_298199 ) ) ( not ( = ?auto_298190 ?auto_298200 ) ) ( not ( = ?auto_298190 ?auto_298201 ) ) ( not ( = ?auto_298191 ?auto_298192 ) ) ( not ( = ?auto_298191 ?auto_298193 ) ) ( not ( = ?auto_298191 ?auto_298194 ) ) ( not ( = ?auto_298191 ?auto_298195 ) ) ( not ( = ?auto_298191 ?auto_298196 ) ) ( not ( = ?auto_298191 ?auto_298197 ) ) ( not ( = ?auto_298191 ?auto_298198 ) ) ( not ( = ?auto_298191 ?auto_298199 ) ) ( not ( = ?auto_298191 ?auto_298200 ) ) ( not ( = ?auto_298191 ?auto_298201 ) ) ( not ( = ?auto_298192 ?auto_298193 ) ) ( not ( = ?auto_298192 ?auto_298194 ) ) ( not ( = ?auto_298192 ?auto_298195 ) ) ( not ( = ?auto_298192 ?auto_298196 ) ) ( not ( = ?auto_298192 ?auto_298197 ) ) ( not ( = ?auto_298192 ?auto_298198 ) ) ( not ( = ?auto_298192 ?auto_298199 ) ) ( not ( = ?auto_298192 ?auto_298200 ) ) ( not ( = ?auto_298192 ?auto_298201 ) ) ( not ( = ?auto_298193 ?auto_298194 ) ) ( not ( = ?auto_298193 ?auto_298195 ) ) ( not ( = ?auto_298193 ?auto_298196 ) ) ( not ( = ?auto_298193 ?auto_298197 ) ) ( not ( = ?auto_298193 ?auto_298198 ) ) ( not ( = ?auto_298193 ?auto_298199 ) ) ( not ( = ?auto_298193 ?auto_298200 ) ) ( not ( = ?auto_298193 ?auto_298201 ) ) ( not ( = ?auto_298194 ?auto_298195 ) ) ( not ( = ?auto_298194 ?auto_298196 ) ) ( not ( = ?auto_298194 ?auto_298197 ) ) ( not ( = ?auto_298194 ?auto_298198 ) ) ( not ( = ?auto_298194 ?auto_298199 ) ) ( not ( = ?auto_298194 ?auto_298200 ) ) ( not ( = ?auto_298194 ?auto_298201 ) ) ( not ( = ?auto_298195 ?auto_298196 ) ) ( not ( = ?auto_298195 ?auto_298197 ) ) ( not ( = ?auto_298195 ?auto_298198 ) ) ( not ( = ?auto_298195 ?auto_298199 ) ) ( not ( = ?auto_298195 ?auto_298200 ) ) ( not ( = ?auto_298195 ?auto_298201 ) ) ( not ( = ?auto_298196 ?auto_298197 ) ) ( not ( = ?auto_298196 ?auto_298198 ) ) ( not ( = ?auto_298196 ?auto_298199 ) ) ( not ( = ?auto_298196 ?auto_298200 ) ) ( not ( = ?auto_298196 ?auto_298201 ) ) ( not ( = ?auto_298197 ?auto_298198 ) ) ( not ( = ?auto_298197 ?auto_298199 ) ) ( not ( = ?auto_298197 ?auto_298200 ) ) ( not ( = ?auto_298197 ?auto_298201 ) ) ( not ( = ?auto_298198 ?auto_298199 ) ) ( not ( = ?auto_298198 ?auto_298200 ) ) ( not ( = ?auto_298198 ?auto_298201 ) ) ( not ( = ?auto_298199 ?auto_298200 ) ) ( not ( = ?auto_298199 ?auto_298201 ) ) ( not ( = ?auto_298200 ?auto_298201 ) ) ( ON ?auto_298199 ?auto_298200 ) ( ON ?auto_298198 ?auto_298199 ) ( ON ?auto_298197 ?auto_298198 ) ( CLEAR ?auto_298195 ) ( ON ?auto_298196 ?auto_298197 ) ( CLEAR ?auto_298196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_298190 ?auto_298191 ?auto_298192 ?auto_298193 ?auto_298194 ?auto_298195 ?auto_298196 )
      ( MAKE-11PILE ?auto_298190 ?auto_298191 ?auto_298192 ?auto_298193 ?auto_298194 ?auto_298195 ?auto_298196 ?auto_298197 ?auto_298198 ?auto_298199 ?auto_298200 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_298213 - BLOCK
      ?auto_298214 - BLOCK
      ?auto_298215 - BLOCK
      ?auto_298216 - BLOCK
      ?auto_298217 - BLOCK
      ?auto_298218 - BLOCK
      ?auto_298219 - BLOCK
      ?auto_298220 - BLOCK
      ?auto_298221 - BLOCK
      ?auto_298222 - BLOCK
      ?auto_298223 - BLOCK
    )
    :vars
    (
      ?auto_298224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298223 ?auto_298224 ) ( ON-TABLE ?auto_298213 ) ( ON ?auto_298214 ?auto_298213 ) ( ON ?auto_298215 ?auto_298214 ) ( ON ?auto_298216 ?auto_298215 ) ( ON ?auto_298217 ?auto_298216 ) ( ON ?auto_298218 ?auto_298217 ) ( not ( = ?auto_298213 ?auto_298214 ) ) ( not ( = ?auto_298213 ?auto_298215 ) ) ( not ( = ?auto_298213 ?auto_298216 ) ) ( not ( = ?auto_298213 ?auto_298217 ) ) ( not ( = ?auto_298213 ?auto_298218 ) ) ( not ( = ?auto_298213 ?auto_298219 ) ) ( not ( = ?auto_298213 ?auto_298220 ) ) ( not ( = ?auto_298213 ?auto_298221 ) ) ( not ( = ?auto_298213 ?auto_298222 ) ) ( not ( = ?auto_298213 ?auto_298223 ) ) ( not ( = ?auto_298213 ?auto_298224 ) ) ( not ( = ?auto_298214 ?auto_298215 ) ) ( not ( = ?auto_298214 ?auto_298216 ) ) ( not ( = ?auto_298214 ?auto_298217 ) ) ( not ( = ?auto_298214 ?auto_298218 ) ) ( not ( = ?auto_298214 ?auto_298219 ) ) ( not ( = ?auto_298214 ?auto_298220 ) ) ( not ( = ?auto_298214 ?auto_298221 ) ) ( not ( = ?auto_298214 ?auto_298222 ) ) ( not ( = ?auto_298214 ?auto_298223 ) ) ( not ( = ?auto_298214 ?auto_298224 ) ) ( not ( = ?auto_298215 ?auto_298216 ) ) ( not ( = ?auto_298215 ?auto_298217 ) ) ( not ( = ?auto_298215 ?auto_298218 ) ) ( not ( = ?auto_298215 ?auto_298219 ) ) ( not ( = ?auto_298215 ?auto_298220 ) ) ( not ( = ?auto_298215 ?auto_298221 ) ) ( not ( = ?auto_298215 ?auto_298222 ) ) ( not ( = ?auto_298215 ?auto_298223 ) ) ( not ( = ?auto_298215 ?auto_298224 ) ) ( not ( = ?auto_298216 ?auto_298217 ) ) ( not ( = ?auto_298216 ?auto_298218 ) ) ( not ( = ?auto_298216 ?auto_298219 ) ) ( not ( = ?auto_298216 ?auto_298220 ) ) ( not ( = ?auto_298216 ?auto_298221 ) ) ( not ( = ?auto_298216 ?auto_298222 ) ) ( not ( = ?auto_298216 ?auto_298223 ) ) ( not ( = ?auto_298216 ?auto_298224 ) ) ( not ( = ?auto_298217 ?auto_298218 ) ) ( not ( = ?auto_298217 ?auto_298219 ) ) ( not ( = ?auto_298217 ?auto_298220 ) ) ( not ( = ?auto_298217 ?auto_298221 ) ) ( not ( = ?auto_298217 ?auto_298222 ) ) ( not ( = ?auto_298217 ?auto_298223 ) ) ( not ( = ?auto_298217 ?auto_298224 ) ) ( not ( = ?auto_298218 ?auto_298219 ) ) ( not ( = ?auto_298218 ?auto_298220 ) ) ( not ( = ?auto_298218 ?auto_298221 ) ) ( not ( = ?auto_298218 ?auto_298222 ) ) ( not ( = ?auto_298218 ?auto_298223 ) ) ( not ( = ?auto_298218 ?auto_298224 ) ) ( not ( = ?auto_298219 ?auto_298220 ) ) ( not ( = ?auto_298219 ?auto_298221 ) ) ( not ( = ?auto_298219 ?auto_298222 ) ) ( not ( = ?auto_298219 ?auto_298223 ) ) ( not ( = ?auto_298219 ?auto_298224 ) ) ( not ( = ?auto_298220 ?auto_298221 ) ) ( not ( = ?auto_298220 ?auto_298222 ) ) ( not ( = ?auto_298220 ?auto_298223 ) ) ( not ( = ?auto_298220 ?auto_298224 ) ) ( not ( = ?auto_298221 ?auto_298222 ) ) ( not ( = ?auto_298221 ?auto_298223 ) ) ( not ( = ?auto_298221 ?auto_298224 ) ) ( not ( = ?auto_298222 ?auto_298223 ) ) ( not ( = ?auto_298222 ?auto_298224 ) ) ( not ( = ?auto_298223 ?auto_298224 ) ) ( ON ?auto_298222 ?auto_298223 ) ( ON ?auto_298221 ?auto_298222 ) ( ON ?auto_298220 ?auto_298221 ) ( CLEAR ?auto_298218 ) ( ON ?auto_298219 ?auto_298220 ) ( CLEAR ?auto_298219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_298213 ?auto_298214 ?auto_298215 ?auto_298216 ?auto_298217 ?auto_298218 ?auto_298219 )
      ( MAKE-11PILE ?auto_298213 ?auto_298214 ?auto_298215 ?auto_298216 ?auto_298217 ?auto_298218 ?auto_298219 ?auto_298220 ?auto_298221 ?auto_298222 ?auto_298223 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_298236 - BLOCK
      ?auto_298237 - BLOCK
      ?auto_298238 - BLOCK
      ?auto_298239 - BLOCK
      ?auto_298240 - BLOCK
      ?auto_298241 - BLOCK
      ?auto_298242 - BLOCK
      ?auto_298243 - BLOCK
      ?auto_298244 - BLOCK
      ?auto_298245 - BLOCK
      ?auto_298246 - BLOCK
    )
    :vars
    (
      ?auto_298247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298246 ?auto_298247 ) ( ON-TABLE ?auto_298236 ) ( ON ?auto_298237 ?auto_298236 ) ( ON ?auto_298238 ?auto_298237 ) ( ON ?auto_298239 ?auto_298238 ) ( ON ?auto_298240 ?auto_298239 ) ( not ( = ?auto_298236 ?auto_298237 ) ) ( not ( = ?auto_298236 ?auto_298238 ) ) ( not ( = ?auto_298236 ?auto_298239 ) ) ( not ( = ?auto_298236 ?auto_298240 ) ) ( not ( = ?auto_298236 ?auto_298241 ) ) ( not ( = ?auto_298236 ?auto_298242 ) ) ( not ( = ?auto_298236 ?auto_298243 ) ) ( not ( = ?auto_298236 ?auto_298244 ) ) ( not ( = ?auto_298236 ?auto_298245 ) ) ( not ( = ?auto_298236 ?auto_298246 ) ) ( not ( = ?auto_298236 ?auto_298247 ) ) ( not ( = ?auto_298237 ?auto_298238 ) ) ( not ( = ?auto_298237 ?auto_298239 ) ) ( not ( = ?auto_298237 ?auto_298240 ) ) ( not ( = ?auto_298237 ?auto_298241 ) ) ( not ( = ?auto_298237 ?auto_298242 ) ) ( not ( = ?auto_298237 ?auto_298243 ) ) ( not ( = ?auto_298237 ?auto_298244 ) ) ( not ( = ?auto_298237 ?auto_298245 ) ) ( not ( = ?auto_298237 ?auto_298246 ) ) ( not ( = ?auto_298237 ?auto_298247 ) ) ( not ( = ?auto_298238 ?auto_298239 ) ) ( not ( = ?auto_298238 ?auto_298240 ) ) ( not ( = ?auto_298238 ?auto_298241 ) ) ( not ( = ?auto_298238 ?auto_298242 ) ) ( not ( = ?auto_298238 ?auto_298243 ) ) ( not ( = ?auto_298238 ?auto_298244 ) ) ( not ( = ?auto_298238 ?auto_298245 ) ) ( not ( = ?auto_298238 ?auto_298246 ) ) ( not ( = ?auto_298238 ?auto_298247 ) ) ( not ( = ?auto_298239 ?auto_298240 ) ) ( not ( = ?auto_298239 ?auto_298241 ) ) ( not ( = ?auto_298239 ?auto_298242 ) ) ( not ( = ?auto_298239 ?auto_298243 ) ) ( not ( = ?auto_298239 ?auto_298244 ) ) ( not ( = ?auto_298239 ?auto_298245 ) ) ( not ( = ?auto_298239 ?auto_298246 ) ) ( not ( = ?auto_298239 ?auto_298247 ) ) ( not ( = ?auto_298240 ?auto_298241 ) ) ( not ( = ?auto_298240 ?auto_298242 ) ) ( not ( = ?auto_298240 ?auto_298243 ) ) ( not ( = ?auto_298240 ?auto_298244 ) ) ( not ( = ?auto_298240 ?auto_298245 ) ) ( not ( = ?auto_298240 ?auto_298246 ) ) ( not ( = ?auto_298240 ?auto_298247 ) ) ( not ( = ?auto_298241 ?auto_298242 ) ) ( not ( = ?auto_298241 ?auto_298243 ) ) ( not ( = ?auto_298241 ?auto_298244 ) ) ( not ( = ?auto_298241 ?auto_298245 ) ) ( not ( = ?auto_298241 ?auto_298246 ) ) ( not ( = ?auto_298241 ?auto_298247 ) ) ( not ( = ?auto_298242 ?auto_298243 ) ) ( not ( = ?auto_298242 ?auto_298244 ) ) ( not ( = ?auto_298242 ?auto_298245 ) ) ( not ( = ?auto_298242 ?auto_298246 ) ) ( not ( = ?auto_298242 ?auto_298247 ) ) ( not ( = ?auto_298243 ?auto_298244 ) ) ( not ( = ?auto_298243 ?auto_298245 ) ) ( not ( = ?auto_298243 ?auto_298246 ) ) ( not ( = ?auto_298243 ?auto_298247 ) ) ( not ( = ?auto_298244 ?auto_298245 ) ) ( not ( = ?auto_298244 ?auto_298246 ) ) ( not ( = ?auto_298244 ?auto_298247 ) ) ( not ( = ?auto_298245 ?auto_298246 ) ) ( not ( = ?auto_298245 ?auto_298247 ) ) ( not ( = ?auto_298246 ?auto_298247 ) ) ( ON ?auto_298245 ?auto_298246 ) ( ON ?auto_298244 ?auto_298245 ) ( ON ?auto_298243 ?auto_298244 ) ( ON ?auto_298242 ?auto_298243 ) ( CLEAR ?auto_298240 ) ( ON ?auto_298241 ?auto_298242 ) ( CLEAR ?auto_298241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_298236 ?auto_298237 ?auto_298238 ?auto_298239 ?auto_298240 ?auto_298241 )
      ( MAKE-11PILE ?auto_298236 ?auto_298237 ?auto_298238 ?auto_298239 ?auto_298240 ?auto_298241 ?auto_298242 ?auto_298243 ?auto_298244 ?auto_298245 ?auto_298246 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_298259 - BLOCK
      ?auto_298260 - BLOCK
      ?auto_298261 - BLOCK
      ?auto_298262 - BLOCK
      ?auto_298263 - BLOCK
      ?auto_298264 - BLOCK
      ?auto_298265 - BLOCK
      ?auto_298266 - BLOCK
      ?auto_298267 - BLOCK
      ?auto_298268 - BLOCK
      ?auto_298269 - BLOCK
    )
    :vars
    (
      ?auto_298270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298269 ?auto_298270 ) ( ON-TABLE ?auto_298259 ) ( ON ?auto_298260 ?auto_298259 ) ( ON ?auto_298261 ?auto_298260 ) ( ON ?auto_298262 ?auto_298261 ) ( ON ?auto_298263 ?auto_298262 ) ( not ( = ?auto_298259 ?auto_298260 ) ) ( not ( = ?auto_298259 ?auto_298261 ) ) ( not ( = ?auto_298259 ?auto_298262 ) ) ( not ( = ?auto_298259 ?auto_298263 ) ) ( not ( = ?auto_298259 ?auto_298264 ) ) ( not ( = ?auto_298259 ?auto_298265 ) ) ( not ( = ?auto_298259 ?auto_298266 ) ) ( not ( = ?auto_298259 ?auto_298267 ) ) ( not ( = ?auto_298259 ?auto_298268 ) ) ( not ( = ?auto_298259 ?auto_298269 ) ) ( not ( = ?auto_298259 ?auto_298270 ) ) ( not ( = ?auto_298260 ?auto_298261 ) ) ( not ( = ?auto_298260 ?auto_298262 ) ) ( not ( = ?auto_298260 ?auto_298263 ) ) ( not ( = ?auto_298260 ?auto_298264 ) ) ( not ( = ?auto_298260 ?auto_298265 ) ) ( not ( = ?auto_298260 ?auto_298266 ) ) ( not ( = ?auto_298260 ?auto_298267 ) ) ( not ( = ?auto_298260 ?auto_298268 ) ) ( not ( = ?auto_298260 ?auto_298269 ) ) ( not ( = ?auto_298260 ?auto_298270 ) ) ( not ( = ?auto_298261 ?auto_298262 ) ) ( not ( = ?auto_298261 ?auto_298263 ) ) ( not ( = ?auto_298261 ?auto_298264 ) ) ( not ( = ?auto_298261 ?auto_298265 ) ) ( not ( = ?auto_298261 ?auto_298266 ) ) ( not ( = ?auto_298261 ?auto_298267 ) ) ( not ( = ?auto_298261 ?auto_298268 ) ) ( not ( = ?auto_298261 ?auto_298269 ) ) ( not ( = ?auto_298261 ?auto_298270 ) ) ( not ( = ?auto_298262 ?auto_298263 ) ) ( not ( = ?auto_298262 ?auto_298264 ) ) ( not ( = ?auto_298262 ?auto_298265 ) ) ( not ( = ?auto_298262 ?auto_298266 ) ) ( not ( = ?auto_298262 ?auto_298267 ) ) ( not ( = ?auto_298262 ?auto_298268 ) ) ( not ( = ?auto_298262 ?auto_298269 ) ) ( not ( = ?auto_298262 ?auto_298270 ) ) ( not ( = ?auto_298263 ?auto_298264 ) ) ( not ( = ?auto_298263 ?auto_298265 ) ) ( not ( = ?auto_298263 ?auto_298266 ) ) ( not ( = ?auto_298263 ?auto_298267 ) ) ( not ( = ?auto_298263 ?auto_298268 ) ) ( not ( = ?auto_298263 ?auto_298269 ) ) ( not ( = ?auto_298263 ?auto_298270 ) ) ( not ( = ?auto_298264 ?auto_298265 ) ) ( not ( = ?auto_298264 ?auto_298266 ) ) ( not ( = ?auto_298264 ?auto_298267 ) ) ( not ( = ?auto_298264 ?auto_298268 ) ) ( not ( = ?auto_298264 ?auto_298269 ) ) ( not ( = ?auto_298264 ?auto_298270 ) ) ( not ( = ?auto_298265 ?auto_298266 ) ) ( not ( = ?auto_298265 ?auto_298267 ) ) ( not ( = ?auto_298265 ?auto_298268 ) ) ( not ( = ?auto_298265 ?auto_298269 ) ) ( not ( = ?auto_298265 ?auto_298270 ) ) ( not ( = ?auto_298266 ?auto_298267 ) ) ( not ( = ?auto_298266 ?auto_298268 ) ) ( not ( = ?auto_298266 ?auto_298269 ) ) ( not ( = ?auto_298266 ?auto_298270 ) ) ( not ( = ?auto_298267 ?auto_298268 ) ) ( not ( = ?auto_298267 ?auto_298269 ) ) ( not ( = ?auto_298267 ?auto_298270 ) ) ( not ( = ?auto_298268 ?auto_298269 ) ) ( not ( = ?auto_298268 ?auto_298270 ) ) ( not ( = ?auto_298269 ?auto_298270 ) ) ( ON ?auto_298268 ?auto_298269 ) ( ON ?auto_298267 ?auto_298268 ) ( ON ?auto_298266 ?auto_298267 ) ( ON ?auto_298265 ?auto_298266 ) ( CLEAR ?auto_298263 ) ( ON ?auto_298264 ?auto_298265 ) ( CLEAR ?auto_298264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_298259 ?auto_298260 ?auto_298261 ?auto_298262 ?auto_298263 ?auto_298264 )
      ( MAKE-11PILE ?auto_298259 ?auto_298260 ?auto_298261 ?auto_298262 ?auto_298263 ?auto_298264 ?auto_298265 ?auto_298266 ?auto_298267 ?auto_298268 ?auto_298269 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_298282 - BLOCK
      ?auto_298283 - BLOCK
      ?auto_298284 - BLOCK
      ?auto_298285 - BLOCK
      ?auto_298286 - BLOCK
      ?auto_298287 - BLOCK
      ?auto_298288 - BLOCK
      ?auto_298289 - BLOCK
      ?auto_298290 - BLOCK
      ?auto_298291 - BLOCK
      ?auto_298292 - BLOCK
    )
    :vars
    (
      ?auto_298293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298292 ?auto_298293 ) ( ON-TABLE ?auto_298282 ) ( ON ?auto_298283 ?auto_298282 ) ( ON ?auto_298284 ?auto_298283 ) ( ON ?auto_298285 ?auto_298284 ) ( not ( = ?auto_298282 ?auto_298283 ) ) ( not ( = ?auto_298282 ?auto_298284 ) ) ( not ( = ?auto_298282 ?auto_298285 ) ) ( not ( = ?auto_298282 ?auto_298286 ) ) ( not ( = ?auto_298282 ?auto_298287 ) ) ( not ( = ?auto_298282 ?auto_298288 ) ) ( not ( = ?auto_298282 ?auto_298289 ) ) ( not ( = ?auto_298282 ?auto_298290 ) ) ( not ( = ?auto_298282 ?auto_298291 ) ) ( not ( = ?auto_298282 ?auto_298292 ) ) ( not ( = ?auto_298282 ?auto_298293 ) ) ( not ( = ?auto_298283 ?auto_298284 ) ) ( not ( = ?auto_298283 ?auto_298285 ) ) ( not ( = ?auto_298283 ?auto_298286 ) ) ( not ( = ?auto_298283 ?auto_298287 ) ) ( not ( = ?auto_298283 ?auto_298288 ) ) ( not ( = ?auto_298283 ?auto_298289 ) ) ( not ( = ?auto_298283 ?auto_298290 ) ) ( not ( = ?auto_298283 ?auto_298291 ) ) ( not ( = ?auto_298283 ?auto_298292 ) ) ( not ( = ?auto_298283 ?auto_298293 ) ) ( not ( = ?auto_298284 ?auto_298285 ) ) ( not ( = ?auto_298284 ?auto_298286 ) ) ( not ( = ?auto_298284 ?auto_298287 ) ) ( not ( = ?auto_298284 ?auto_298288 ) ) ( not ( = ?auto_298284 ?auto_298289 ) ) ( not ( = ?auto_298284 ?auto_298290 ) ) ( not ( = ?auto_298284 ?auto_298291 ) ) ( not ( = ?auto_298284 ?auto_298292 ) ) ( not ( = ?auto_298284 ?auto_298293 ) ) ( not ( = ?auto_298285 ?auto_298286 ) ) ( not ( = ?auto_298285 ?auto_298287 ) ) ( not ( = ?auto_298285 ?auto_298288 ) ) ( not ( = ?auto_298285 ?auto_298289 ) ) ( not ( = ?auto_298285 ?auto_298290 ) ) ( not ( = ?auto_298285 ?auto_298291 ) ) ( not ( = ?auto_298285 ?auto_298292 ) ) ( not ( = ?auto_298285 ?auto_298293 ) ) ( not ( = ?auto_298286 ?auto_298287 ) ) ( not ( = ?auto_298286 ?auto_298288 ) ) ( not ( = ?auto_298286 ?auto_298289 ) ) ( not ( = ?auto_298286 ?auto_298290 ) ) ( not ( = ?auto_298286 ?auto_298291 ) ) ( not ( = ?auto_298286 ?auto_298292 ) ) ( not ( = ?auto_298286 ?auto_298293 ) ) ( not ( = ?auto_298287 ?auto_298288 ) ) ( not ( = ?auto_298287 ?auto_298289 ) ) ( not ( = ?auto_298287 ?auto_298290 ) ) ( not ( = ?auto_298287 ?auto_298291 ) ) ( not ( = ?auto_298287 ?auto_298292 ) ) ( not ( = ?auto_298287 ?auto_298293 ) ) ( not ( = ?auto_298288 ?auto_298289 ) ) ( not ( = ?auto_298288 ?auto_298290 ) ) ( not ( = ?auto_298288 ?auto_298291 ) ) ( not ( = ?auto_298288 ?auto_298292 ) ) ( not ( = ?auto_298288 ?auto_298293 ) ) ( not ( = ?auto_298289 ?auto_298290 ) ) ( not ( = ?auto_298289 ?auto_298291 ) ) ( not ( = ?auto_298289 ?auto_298292 ) ) ( not ( = ?auto_298289 ?auto_298293 ) ) ( not ( = ?auto_298290 ?auto_298291 ) ) ( not ( = ?auto_298290 ?auto_298292 ) ) ( not ( = ?auto_298290 ?auto_298293 ) ) ( not ( = ?auto_298291 ?auto_298292 ) ) ( not ( = ?auto_298291 ?auto_298293 ) ) ( not ( = ?auto_298292 ?auto_298293 ) ) ( ON ?auto_298291 ?auto_298292 ) ( ON ?auto_298290 ?auto_298291 ) ( ON ?auto_298289 ?auto_298290 ) ( ON ?auto_298288 ?auto_298289 ) ( ON ?auto_298287 ?auto_298288 ) ( CLEAR ?auto_298285 ) ( ON ?auto_298286 ?auto_298287 ) ( CLEAR ?auto_298286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_298282 ?auto_298283 ?auto_298284 ?auto_298285 ?auto_298286 )
      ( MAKE-11PILE ?auto_298282 ?auto_298283 ?auto_298284 ?auto_298285 ?auto_298286 ?auto_298287 ?auto_298288 ?auto_298289 ?auto_298290 ?auto_298291 ?auto_298292 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_298305 - BLOCK
      ?auto_298306 - BLOCK
      ?auto_298307 - BLOCK
      ?auto_298308 - BLOCK
      ?auto_298309 - BLOCK
      ?auto_298310 - BLOCK
      ?auto_298311 - BLOCK
      ?auto_298312 - BLOCK
      ?auto_298313 - BLOCK
      ?auto_298314 - BLOCK
      ?auto_298315 - BLOCK
    )
    :vars
    (
      ?auto_298316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298315 ?auto_298316 ) ( ON-TABLE ?auto_298305 ) ( ON ?auto_298306 ?auto_298305 ) ( ON ?auto_298307 ?auto_298306 ) ( ON ?auto_298308 ?auto_298307 ) ( not ( = ?auto_298305 ?auto_298306 ) ) ( not ( = ?auto_298305 ?auto_298307 ) ) ( not ( = ?auto_298305 ?auto_298308 ) ) ( not ( = ?auto_298305 ?auto_298309 ) ) ( not ( = ?auto_298305 ?auto_298310 ) ) ( not ( = ?auto_298305 ?auto_298311 ) ) ( not ( = ?auto_298305 ?auto_298312 ) ) ( not ( = ?auto_298305 ?auto_298313 ) ) ( not ( = ?auto_298305 ?auto_298314 ) ) ( not ( = ?auto_298305 ?auto_298315 ) ) ( not ( = ?auto_298305 ?auto_298316 ) ) ( not ( = ?auto_298306 ?auto_298307 ) ) ( not ( = ?auto_298306 ?auto_298308 ) ) ( not ( = ?auto_298306 ?auto_298309 ) ) ( not ( = ?auto_298306 ?auto_298310 ) ) ( not ( = ?auto_298306 ?auto_298311 ) ) ( not ( = ?auto_298306 ?auto_298312 ) ) ( not ( = ?auto_298306 ?auto_298313 ) ) ( not ( = ?auto_298306 ?auto_298314 ) ) ( not ( = ?auto_298306 ?auto_298315 ) ) ( not ( = ?auto_298306 ?auto_298316 ) ) ( not ( = ?auto_298307 ?auto_298308 ) ) ( not ( = ?auto_298307 ?auto_298309 ) ) ( not ( = ?auto_298307 ?auto_298310 ) ) ( not ( = ?auto_298307 ?auto_298311 ) ) ( not ( = ?auto_298307 ?auto_298312 ) ) ( not ( = ?auto_298307 ?auto_298313 ) ) ( not ( = ?auto_298307 ?auto_298314 ) ) ( not ( = ?auto_298307 ?auto_298315 ) ) ( not ( = ?auto_298307 ?auto_298316 ) ) ( not ( = ?auto_298308 ?auto_298309 ) ) ( not ( = ?auto_298308 ?auto_298310 ) ) ( not ( = ?auto_298308 ?auto_298311 ) ) ( not ( = ?auto_298308 ?auto_298312 ) ) ( not ( = ?auto_298308 ?auto_298313 ) ) ( not ( = ?auto_298308 ?auto_298314 ) ) ( not ( = ?auto_298308 ?auto_298315 ) ) ( not ( = ?auto_298308 ?auto_298316 ) ) ( not ( = ?auto_298309 ?auto_298310 ) ) ( not ( = ?auto_298309 ?auto_298311 ) ) ( not ( = ?auto_298309 ?auto_298312 ) ) ( not ( = ?auto_298309 ?auto_298313 ) ) ( not ( = ?auto_298309 ?auto_298314 ) ) ( not ( = ?auto_298309 ?auto_298315 ) ) ( not ( = ?auto_298309 ?auto_298316 ) ) ( not ( = ?auto_298310 ?auto_298311 ) ) ( not ( = ?auto_298310 ?auto_298312 ) ) ( not ( = ?auto_298310 ?auto_298313 ) ) ( not ( = ?auto_298310 ?auto_298314 ) ) ( not ( = ?auto_298310 ?auto_298315 ) ) ( not ( = ?auto_298310 ?auto_298316 ) ) ( not ( = ?auto_298311 ?auto_298312 ) ) ( not ( = ?auto_298311 ?auto_298313 ) ) ( not ( = ?auto_298311 ?auto_298314 ) ) ( not ( = ?auto_298311 ?auto_298315 ) ) ( not ( = ?auto_298311 ?auto_298316 ) ) ( not ( = ?auto_298312 ?auto_298313 ) ) ( not ( = ?auto_298312 ?auto_298314 ) ) ( not ( = ?auto_298312 ?auto_298315 ) ) ( not ( = ?auto_298312 ?auto_298316 ) ) ( not ( = ?auto_298313 ?auto_298314 ) ) ( not ( = ?auto_298313 ?auto_298315 ) ) ( not ( = ?auto_298313 ?auto_298316 ) ) ( not ( = ?auto_298314 ?auto_298315 ) ) ( not ( = ?auto_298314 ?auto_298316 ) ) ( not ( = ?auto_298315 ?auto_298316 ) ) ( ON ?auto_298314 ?auto_298315 ) ( ON ?auto_298313 ?auto_298314 ) ( ON ?auto_298312 ?auto_298313 ) ( ON ?auto_298311 ?auto_298312 ) ( ON ?auto_298310 ?auto_298311 ) ( CLEAR ?auto_298308 ) ( ON ?auto_298309 ?auto_298310 ) ( CLEAR ?auto_298309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_298305 ?auto_298306 ?auto_298307 ?auto_298308 ?auto_298309 )
      ( MAKE-11PILE ?auto_298305 ?auto_298306 ?auto_298307 ?auto_298308 ?auto_298309 ?auto_298310 ?auto_298311 ?auto_298312 ?auto_298313 ?auto_298314 ?auto_298315 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_298328 - BLOCK
      ?auto_298329 - BLOCK
      ?auto_298330 - BLOCK
      ?auto_298331 - BLOCK
      ?auto_298332 - BLOCK
      ?auto_298333 - BLOCK
      ?auto_298334 - BLOCK
      ?auto_298335 - BLOCK
      ?auto_298336 - BLOCK
      ?auto_298337 - BLOCK
      ?auto_298338 - BLOCK
    )
    :vars
    (
      ?auto_298339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298338 ?auto_298339 ) ( ON-TABLE ?auto_298328 ) ( ON ?auto_298329 ?auto_298328 ) ( ON ?auto_298330 ?auto_298329 ) ( not ( = ?auto_298328 ?auto_298329 ) ) ( not ( = ?auto_298328 ?auto_298330 ) ) ( not ( = ?auto_298328 ?auto_298331 ) ) ( not ( = ?auto_298328 ?auto_298332 ) ) ( not ( = ?auto_298328 ?auto_298333 ) ) ( not ( = ?auto_298328 ?auto_298334 ) ) ( not ( = ?auto_298328 ?auto_298335 ) ) ( not ( = ?auto_298328 ?auto_298336 ) ) ( not ( = ?auto_298328 ?auto_298337 ) ) ( not ( = ?auto_298328 ?auto_298338 ) ) ( not ( = ?auto_298328 ?auto_298339 ) ) ( not ( = ?auto_298329 ?auto_298330 ) ) ( not ( = ?auto_298329 ?auto_298331 ) ) ( not ( = ?auto_298329 ?auto_298332 ) ) ( not ( = ?auto_298329 ?auto_298333 ) ) ( not ( = ?auto_298329 ?auto_298334 ) ) ( not ( = ?auto_298329 ?auto_298335 ) ) ( not ( = ?auto_298329 ?auto_298336 ) ) ( not ( = ?auto_298329 ?auto_298337 ) ) ( not ( = ?auto_298329 ?auto_298338 ) ) ( not ( = ?auto_298329 ?auto_298339 ) ) ( not ( = ?auto_298330 ?auto_298331 ) ) ( not ( = ?auto_298330 ?auto_298332 ) ) ( not ( = ?auto_298330 ?auto_298333 ) ) ( not ( = ?auto_298330 ?auto_298334 ) ) ( not ( = ?auto_298330 ?auto_298335 ) ) ( not ( = ?auto_298330 ?auto_298336 ) ) ( not ( = ?auto_298330 ?auto_298337 ) ) ( not ( = ?auto_298330 ?auto_298338 ) ) ( not ( = ?auto_298330 ?auto_298339 ) ) ( not ( = ?auto_298331 ?auto_298332 ) ) ( not ( = ?auto_298331 ?auto_298333 ) ) ( not ( = ?auto_298331 ?auto_298334 ) ) ( not ( = ?auto_298331 ?auto_298335 ) ) ( not ( = ?auto_298331 ?auto_298336 ) ) ( not ( = ?auto_298331 ?auto_298337 ) ) ( not ( = ?auto_298331 ?auto_298338 ) ) ( not ( = ?auto_298331 ?auto_298339 ) ) ( not ( = ?auto_298332 ?auto_298333 ) ) ( not ( = ?auto_298332 ?auto_298334 ) ) ( not ( = ?auto_298332 ?auto_298335 ) ) ( not ( = ?auto_298332 ?auto_298336 ) ) ( not ( = ?auto_298332 ?auto_298337 ) ) ( not ( = ?auto_298332 ?auto_298338 ) ) ( not ( = ?auto_298332 ?auto_298339 ) ) ( not ( = ?auto_298333 ?auto_298334 ) ) ( not ( = ?auto_298333 ?auto_298335 ) ) ( not ( = ?auto_298333 ?auto_298336 ) ) ( not ( = ?auto_298333 ?auto_298337 ) ) ( not ( = ?auto_298333 ?auto_298338 ) ) ( not ( = ?auto_298333 ?auto_298339 ) ) ( not ( = ?auto_298334 ?auto_298335 ) ) ( not ( = ?auto_298334 ?auto_298336 ) ) ( not ( = ?auto_298334 ?auto_298337 ) ) ( not ( = ?auto_298334 ?auto_298338 ) ) ( not ( = ?auto_298334 ?auto_298339 ) ) ( not ( = ?auto_298335 ?auto_298336 ) ) ( not ( = ?auto_298335 ?auto_298337 ) ) ( not ( = ?auto_298335 ?auto_298338 ) ) ( not ( = ?auto_298335 ?auto_298339 ) ) ( not ( = ?auto_298336 ?auto_298337 ) ) ( not ( = ?auto_298336 ?auto_298338 ) ) ( not ( = ?auto_298336 ?auto_298339 ) ) ( not ( = ?auto_298337 ?auto_298338 ) ) ( not ( = ?auto_298337 ?auto_298339 ) ) ( not ( = ?auto_298338 ?auto_298339 ) ) ( ON ?auto_298337 ?auto_298338 ) ( ON ?auto_298336 ?auto_298337 ) ( ON ?auto_298335 ?auto_298336 ) ( ON ?auto_298334 ?auto_298335 ) ( ON ?auto_298333 ?auto_298334 ) ( ON ?auto_298332 ?auto_298333 ) ( CLEAR ?auto_298330 ) ( ON ?auto_298331 ?auto_298332 ) ( CLEAR ?auto_298331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_298328 ?auto_298329 ?auto_298330 ?auto_298331 )
      ( MAKE-11PILE ?auto_298328 ?auto_298329 ?auto_298330 ?auto_298331 ?auto_298332 ?auto_298333 ?auto_298334 ?auto_298335 ?auto_298336 ?auto_298337 ?auto_298338 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_298351 - BLOCK
      ?auto_298352 - BLOCK
      ?auto_298353 - BLOCK
      ?auto_298354 - BLOCK
      ?auto_298355 - BLOCK
      ?auto_298356 - BLOCK
      ?auto_298357 - BLOCK
      ?auto_298358 - BLOCK
      ?auto_298359 - BLOCK
      ?auto_298360 - BLOCK
      ?auto_298361 - BLOCK
    )
    :vars
    (
      ?auto_298362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298361 ?auto_298362 ) ( ON-TABLE ?auto_298351 ) ( ON ?auto_298352 ?auto_298351 ) ( ON ?auto_298353 ?auto_298352 ) ( not ( = ?auto_298351 ?auto_298352 ) ) ( not ( = ?auto_298351 ?auto_298353 ) ) ( not ( = ?auto_298351 ?auto_298354 ) ) ( not ( = ?auto_298351 ?auto_298355 ) ) ( not ( = ?auto_298351 ?auto_298356 ) ) ( not ( = ?auto_298351 ?auto_298357 ) ) ( not ( = ?auto_298351 ?auto_298358 ) ) ( not ( = ?auto_298351 ?auto_298359 ) ) ( not ( = ?auto_298351 ?auto_298360 ) ) ( not ( = ?auto_298351 ?auto_298361 ) ) ( not ( = ?auto_298351 ?auto_298362 ) ) ( not ( = ?auto_298352 ?auto_298353 ) ) ( not ( = ?auto_298352 ?auto_298354 ) ) ( not ( = ?auto_298352 ?auto_298355 ) ) ( not ( = ?auto_298352 ?auto_298356 ) ) ( not ( = ?auto_298352 ?auto_298357 ) ) ( not ( = ?auto_298352 ?auto_298358 ) ) ( not ( = ?auto_298352 ?auto_298359 ) ) ( not ( = ?auto_298352 ?auto_298360 ) ) ( not ( = ?auto_298352 ?auto_298361 ) ) ( not ( = ?auto_298352 ?auto_298362 ) ) ( not ( = ?auto_298353 ?auto_298354 ) ) ( not ( = ?auto_298353 ?auto_298355 ) ) ( not ( = ?auto_298353 ?auto_298356 ) ) ( not ( = ?auto_298353 ?auto_298357 ) ) ( not ( = ?auto_298353 ?auto_298358 ) ) ( not ( = ?auto_298353 ?auto_298359 ) ) ( not ( = ?auto_298353 ?auto_298360 ) ) ( not ( = ?auto_298353 ?auto_298361 ) ) ( not ( = ?auto_298353 ?auto_298362 ) ) ( not ( = ?auto_298354 ?auto_298355 ) ) ( not ( = ?auto_298354 ?auto_298356 ) ) ( not ( = ?auto_298354 ?auto_298357 ) ) ( not ( = ?auto_298354 ?auto_298358 ) ) ( not ( = ?auto_298354 ?auto_298359 ) ) ( not ( = ?auto_298354 ?auto_298360 ) ) ( not ( = ?auto_298354 ?auto_298361 ) ) ( not ( = ?auto_298354 ?auto_298362 ) ) ( not ( = ?auto_298355 ?auto_298356 ) ) ( not ( = ?auto_298355 ?auto_298357 ) ) ( not ( = ?auto_298355 ?auto_298358 ) ) ( not ( = ?auto_298355 ?auto_298359 ) ) ( not ( = ?auto_298355 ?auto_298360 ) ) ( not ( = ?auto_298355 ?auto_298361 ) ) ( not ( = ?auto_298355 ?auto_298362 ) ) ( not ( = ?auto_298356 ?auto_298357 ) ) ( not ( = ?auto_298356 ?auto_298358 ) ) ( not ( = ?auto_298356 ?auto_298359 ) ) ( not ( = ?auto_298356 ?auto_298360 ) ) ( not ( = ?auto_298356 ?auto_298361 ) ) ( not ( = ?auto_298356 ?auto_298362 ) ) ( not ( = ?auto_298357 ?auto_298358 ) ) ( not ( = ?auto_298357 ?auto_298359 ) ) ( not ( = ?auto_298357 ?auto_298360 ) ) ( not ( = ?auto_298357 ?auto_298361 ) ) ( not ( = ?auto_298357 ?auto_298362 ) ) ( not ( = ?auto_298358 ?auto_298359 ) ) ( not ( = ?auto_298358 ?auto_298360 ) ) ( not ( = ?auto_298358 ?auto_298361 ) ) ( not ( = ?auto_298358 ?auto_298362 ) ) ( not ( = ?auto_298359 ?auto_298360 ) ) ( not ( = ?auto_298359 ?auto_298361 ) ) ( not ( = ?auto_298359 ?auto_298362 ) ) ( not ( = ?auto_298360 ?auto_298361 ) ) ( not ( = ?auto_298360 ?auto_298362 ) ) ( not ( = ?auto_298361 ?auto_298362 ) ) ( ON ?auto_298360 ?auto_298361 ) ( ON ?auto_298359 ?auto_298360 ) ( ON ?auto_298358 ?auto_298359 ) ( ON ?auto_298357 ?auto_298358 ) ( ON ?auto_298356 ?auto_298357 ) ( ON ?auto_298355 ?auto_298356 ) ( CLEAR ?auto_298353 ) ( ON ?auto_298354 ?auto_298355 ) ( CLEAR ?auto_298354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_298351 ?auto_298352 ?auto_298353 ?auto_298354 )
      ( MAKE-11PILE ?auto_298351 ?auto_298352 ?auto_298353 ?auto_298354 ?auto_298355 ?auto_298356 ?auto_298357 ?auto_298358 ?auto_298359 ?auto_298360 ?auto_298361 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_298374 - BLOCK
      ?auto_298375 - BLOCK
      ?auto_298376 - BLOCK
      ?auto_298377 - BLOCK
      ?auto_298378 - BLOCK
      ?auto_298379 - BLOCK
      ?auto_298380 - BLOCK
      ?auto_298381 - BLOCK
      ?auto_298382 - BLOCK
      ?auto_298383 - BLOCK
      ?auto_298384 - BLOCK
    )
    :vars
    (
      ?auto_298385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298384 ?auto_298385 ) ( ON-TABLE ?auto_298374 ) ( ON ?auto_298375 ?auto_298374 ) ( not ( = ?auto_298374 ?auto_298375 ) ) ( not ( = ?auto_298374 ?auto_298376 ) ) ( not ( = ?auto_298374 ?auto_298377 ) ) ( not ( = ?auto_298374 ?auto_298378 ) ) ( not ( = ?auto_298374 ?auto_298379 ) ) ( not ( = ?auto_298374 ?auto_298380 ) ) ( not ( = ?auto_298374 ?auto_298381 ) ) ( not ( = ?auto_298374 ?auto_298382 ) ) ( not ( = ?auto_298374 ?auto_298383 ) ) ( not ( = ?auto_298374 ?auto_298384 ) ) ( not ( = ?auto_298374 ?auto_298385 ) ) ( not ( = ?auto_298375 ?auto_298376 ) ) ( not ( = ?auto_298375 ?auto_298377 ) ) ( not ( = ?auto_298375 ?auto_298378 ) ) ( not ( = ?auto_298375 ?auto_298379 ) ) ( not ( = ?auto_298375 ?auto_298380 ) ) ( not ( = ?auto_298375 ?auto_298381 ) ) ( not ( = ?auto_298375 ?auto_298382 ) ) ( not ( = ?auto_298375 ?auto_298383 ) ) ( not ( = ?auto_298375 ?auto_298384 ) ) ( not ( = ?auto_298375 ?auto_298385 ) ) ( not ( = ?auto_298376 ?auto_298377 ) ) ( not ( = ?auto_298376 ?auto_298378 ) ) ( not ( = ?auto_298376 ?auto_298379 ) ) ( not ( = ?auto_298376 ?auto_298380 ) ) ( not ( = ?auto_298376 ?auto_298381 ) ) ( not ( = ?auto_298376 ?auto_298382 ) ) ( not ( = ?auto_298376 ?auto_298383 ) ) ( not ( = ?auto_298376 ?auto_298384 ) ) ( not ( = ?auto_298376 ?auto_298385 ) ) ( not ( = ?auto_298377 ?auto_298378 ) ) ( not ( = ?auto_298377 ?auto_298379 ) ) ( not ( = ?auto_298377 ?auto_298380 ) ) ( not ( = ?auto_298377 ?auto_298381 ) ) ( not ( = ?auto_298377 ?auto_298382 ) ) ( not ( = ?auto_298377 ?auto_298383 ) ) ( not ( = ?auto_298377 ?auto_298384 ) ) ( not ( = ?auto_298377 ?auto_298385 ) ) ( not ( = ?auto_298378 ?auto_298379 ) ) ( not ( = ?auto_298378 ?auto_298380 ) ) ( not ( = ?auto_298378 ?auto_298381 ) ) ( not ( = ?auto_298378 ?auto_298382 ) ) ( not ( = ?auto_298378 ?auto_298383 ) ) ( not ( = ?auto_298378 ?auto_298384 ) ) ( not ( = ?auto_298378 ?auto_298385 ) ) ( not ( = ?auto_298379 ?auto_298380 ) ) ( not ( = ?auto_298379 ?auto_298381 ) ) ( not ( = ?auto_298379 ?auto_298382 ) ) ( not ( = ?auto_298379 ?auto_298383 ) ) ( not ( = ?auto_298379 ?auto_298384 ) ) ( not ( = ?auto_298379 ?auto_298385 ) ) ( not ( = ?auto_298380 ?auto_298381 ) ) ( not ( = ?auto_298380 ?auto_298382 ) ) ( not ( = ?auto_298380 ?auto_298383 ) ) ( not ( = ?auto_298380 ?auto_298384 ) ) ( not ( = ?auto_298380 ?auto_298385 ) ) ( not ( = ?auto_298381 ?auto_298382 ) ) ( not ( = ?auto_298381 ?auto_298383 ) ) ( not ( = ?auto_298381 ?auto_298384 ) ) ( not ( = ?auto_298381 ?auto_298385 ) ) ( not ( = ?auto_298382 ?auto_298383 ) ) ( not ( = ?auto_298382 ?auto_298384 ) ) ( not ( = ?auto_298382 ?auto_298385 ) ) ( not ( = ?auto_298383 ?auto_298384 ) ) ( not ( = ?auto_298383 ?auto_298385 ) ) ( not ( = ?auto_298384 ?auto_298385 ) ) ( ON ?auto_298383 ?auto_298384 ) ( ON ?auto_298382 ?auto_298383 ) ( ON ?auto_298381 ?auto_298382 ) ( ON ?auto_298380 ?auto_298381 ) ( ON ?auto_298379 ?auto_298380 ) ( ON ?auto_298378 ?auto_298379 ) ( ON ?auto_298377 ?auto_298378 ) ( CLEAR ?auto_298375 ) ( ON ?auto_298376 ?auto_298377 ) ( CLEAR ?auto_298376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_298374 ?auto_298375 ?auto_298376 )
      ( MAKE-11PILE ?auto_298374 ?auto_298375 ?auto_298376 ?auto_298377 ?auto_298378 ?auto_298379 ?auto_298380 ?auto_298381 ?auto_298382 ?auto_298383 ?auto_298384 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_298397 - BLOCK
      ?auto_298398 - BLOCK
      ?auto_298399 - BLOCK
      ?auto_298400 - BLOCK
      ?auto_298401 - BLOCK
      ?auto_298402 - BLOCK
      ?auto_298403 - BLOCK
      ?auto_298404 - BLOCK
      ?auto_298405 - BLOCK
      ?auto_298406 - BLOCK
      ?auto_298407 - BLOCK
    )
    :vars
    (
      ?auto_298408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298407 ?auto_298408 ) ( ON-TABLE ?auto_298397 ) ( ON ?auto_298398 ?auto_298397 ) ( not ( = ?auto_298397 ?auto_298398 ) ) ( not ( = ?auto_298397 ?auto_298399 ) ) ( not ( = ?auto_298397 ?auto_298400 ) ) ( not ( = ?auto_298397 ?auto_298401 ) ) ( not ( = ?auto_298397 ?auto_298402 ) ) ( not ( = ?auto_298397 ?auto_298403 ) ) ( not ( = ?auto_298397 ?auto_298404 ) ) ( not ( = ?auto_298397 ?auto_298405 ) ) ( not ( = ?auto_298397 ?auto_298406 ) ) ( not ( = ?auto_298397 ?auto_298407 ) ) ( not ( = ?auto_298397 ?auto_298408 ) ) ( not ( = ?auto_298398 ?auto_298399 ) ) ( not ( = ?auto_298398 ?auto_298400 ) ) ( not ( = ?auto_298398 ?auto_298401 ) ) ( not ( = ?auto_298398 ?auto_298402 ) ) ( not ( = ?auto_298398 ?auto_298403 ) ) ( not ( = ?auto_298398 ?auto_298404 ) ) ( not ( = ?auto_298398 ?auto_298405 ) ) ( not ( = ?auto_298398 ?auto_298406 ) ) ( not ( = ?auto_298398 ?auto_298407 ) ) ( not ( = ?auto_298398 ?auto_298408 ) ) ( not ( = ?auto_298399 ?auto_298400 ) ) ( not ( = ?auto_298399 ?auto_298401 ) ) ( not ( = ?auto_298399 ?auto_298402 ) ) ( not ( = ?auto_298399 ?auto_298403 ) ) ( not ( = ?auto_298399 ?auto_298404 ) ) ( not ( = ?auto_298399 ?auto_298405 ) ) ( not ( = ?auto_298399 ?auto_298406 ) ) ( not ( = ?auto_298399 ?auto_298407 ) ) ( not ( = ?auto_298399 ?auto_298408 ) ) ( not ( = ?auto_298400 ?auto_298401 ) ) ( not ( = ?auto_298400 ?auto_298402 ) ) ( not ( = ?auto_298400 ?auto_298403 ) ) ( not ( = ?auto_298400 ?auto_298404 ) ) ( not ( = ?auto_298400 ?auto_298405 ) ) ( not ( = ?auto_298400 ?auto_298406 ) ) ( not ( = ?auto_298400 ?auto_298407 ) ) ( not ( = ?auto_298400 ?auto_298408 ) ) ( not ( = ?auto_298401 ?auto_298402 ) ) ( not ( = ?auto_298401 ?auto_298403 ) ) ( not ( = ?auto_298401 ?auto_298404 ) ) ( not ( = ?auto_298401 ?auto_298405 ) ) ( not ( = ?auto_298401 ?auto_298406 ) ) ( not ( = ?auto_298401 ?auto_298407 ) ) ( not ( = ?auto_298401 ?auto_298408 ) ) ( not ( = ?auto_298402 ?auto_298403 ) ) ( not ( = ?auto_298402 ?auto_298404 ) ) ( not ( = ?auto_298402 ?auto_298405 ) ) ( not ( = ?auto_298402 ?auto_298406 ) ) ( not ( = ?auto_298402 ?auto_298407 ) ) ( not ( = ?auto_298402 ?auto_298408 ) ) ( not ( = ?auto_298403 ?auto_298404 ) ) ( not ( = ?auto_298403 ?auto_298405 ) ) ( not ( = ?auto_298403 ?auto_298406 ) ) ( not ( = ?auto_298403 ?auto_298407 ) ) ( not ( = ?auto_298403 ?auto_298408 ) ) ( not ( = ?auto_298404 ?auto_298405 ) ) ( not ( = ?auto_298404 ?auto_298406 ) ) ( not ( = ?auto_298404 ?auto_298407 ) ) ( not ( = ?auto_298404 ?auto_298408 ) ) ( not ( = ?auto_298405 ?auto_298406 ) ) ( not ( = ?auto_298405 ?auto_298407 ) ) ( not ( = ?auto_298405 ?auto_298408 ) ) ( not ( = ?auto_298406 ?auto_298407 ) ) ( not ( = ?auto_298406 ?auto_298408 ) ) ( not ( = ?auto_298407 ?auto_298408 ) ) ( ON ?auto_298406 ?auto_298407 ) ( ON ?auto_298405 ?auto_298406 ) ( ON ?auto_298404 ?auto_298405 ) ( ON ?auto_298403 ?auto_298404 ) ( ON ?auto_298402 ?auto_298403 ) ( ON ?auto_298401 ?auto_298402 ) ( ON ?auto_298400 ?auto_298401 ) ( CLEAR ?auto_298398 ) ( ON ?auto_298399 ?auto_298400 ) ( CLEAR ?auto_298399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_298397 ?auto_298398 ?auto_298399 )
      ( MAKE-11PILE ?auto_298397 ?auto_298398 ?auto_298399 ?auto_298400 ?auto_298401 ?auto_298402 ?auto_298403 ?auto_298404 ?auto_298405 ?auto_298406 ?auto_298407 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_298420 - BLOCK
      ?auto_298421 - BLOCK
      ?auto_298422 - BLOCK
      ?auto_298423 - BLOCK
      ?auto_298424 - BLOCK
      ?auto_298425 - BLOCK
      ?auto_298426 - BLOCK
      ?auto_298427 - BLOCK
      ?auto_298428 - BLOCK
      ?auto_298429 - BLOCK
      ?auto_298430 - BLOCK
    )
    :vars
    (
      ?auto_298431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298430 ?auto_298431 ) ( ON-TABLE ?auto_298420 ) ( not ( = ?auto_298420 ?auto_298421 ) ) ( not ( = ?auto_298420 ?auto_298422 ) ) ( not ( = ?auto_298420 ?auto_298423 ) ) ( not ( = ?auto_298420 ?auto_298424 ) ) ( not ( = ?auto_298420 ?auto_298425 ) ) ( not ( = ?auto_298420 ?auto_298426 ) ) ( not ( = ?auto_298420 ?auto_298427 ) ) ( not ( = ?auto_298420 ?auto_298428 ) ) ( not ( = ?auto_298420 ?auto_298429 ) ) ( not ( = ?auto_298420 ?auto_298430 ) ) ( not ( = ?auto_298420 ?auto_298431 ) ) ( not ( = ?auto_298421 ?auto_298422 ) ) ( not ( = ?auto_298421 ?auto_298423 ) ) ( not ( = ?auto_298421 ?auto_298424 ) ) ( not ( = ?auto_298421 ?auto_298425 ) ) ( not ( = ?auto_298421 ?auto_298426 ) ) ( not ( = ?auto_298421 ?auto_298427 ) ) ( not ( = ?auto_298421 ?auto_298428 ) ) ( not ( = ?auto_298421 ?auto_298429 ) ) ( not ( = ?auto_298421 ?auto_298430 ) ) ( not ( = ?auto_298421 ?auto_298431 ) ) ( not ( = ?auto_298422 ?auto_298423 ) ) ( not ( = ?auto_298422 ?auto_298424 ) ) ( not ( = ?auto_298422 ?auto_298425 ) ) ( not ( = ?auto_298422 ?auto_298426 ) ) ( not ( = ?auto_298422 ?auto_298427 ) ) ( not ( = ?auto_298422 ?auto_298428 ) ) ( not ( = ?auto_298422 ?auto_298429 ) ) ( not ( = ?auto_298422 ?auto_298430 ) ) ( not ( = ?auto_298422 ?auto_298431 ) ) ( not ( = ?auto_298423 ?auto_298424 ) ) ( not ( = ?auto_298423 ?auto_298425 ) ) ( not ( = ?auto_298423 ?auto_298426 ) ) ( not ( = ?auto_298423 ?auto_298427 ) ) ( not ( = ?auto_298423 ?auto_298428 ) ) ( not ( = ?auto_298423 ?auto_298429 ) ) ( not ( = ?auto_298423 ?auto_298430 ) ) ( not ( = ?auto_298423 ?auto_298431 ) ) ( not ( = ?auto_298424 ?auto_298425 ) ) ( not ( = ?auto_298424 ?auto_298426 ) ) ( not ( = ?auto_298424 ?auto_298427 ) ) ( not ( = ?auto_298424 ?auto_298428 ) ) ( not ( = ?auto_298424 ?auto_298429 ) ) ( not ( = ?auto_298424 ?auto_298430 ) ) ( not ( = ?auto_298424 ?auto_298431 ) ) ( not ( = ?auto_298425 ?auto_298426 ) ) ( not ( = ?auto_298425 ?auto_298427 ) ) ( not ( = ?auto_298425 ?auto_298428 ) ) ( not ( = ?auto_298425 ?auto_298429 ) ) ( not ( = ?auto_298425 ?auto_298430 ) ) ( not ( = ?auto_298425 ?auto_298431 ) ) ( not ( = ?auto_298426 ?auto_298427 ) ) ( not ( = ?auto_298426 ?auto_298428 ) ) ( not ( = ?auto_298426 ?auto_298429 ) ) ( not ( = ?auto_298426 ?auto_298430 ) ) ( not ( = ?auto_298426 ?auto_298431 ) ) ( not ( = ?auto_298427 ?auto_298428 ) ) ( not ( = ?auto_298427 ?auto_298429 ) ) ( not ( = ?auto_298427 ?auto_298430 ) ) ( not ( = ?auto_298427 ?auto_298431 ) ) ( not ( = ?auto_298428 ?auto_298429 ) ) ( not ( = ?auto_298428 ?auto_298430 ) ) ( not ( = ?auto_298428 ?auto_298431 ) ) ( not ( = ?auto_298429 ?auto_298430 ) ) ( not ( = ?auto_298429 ?auto_298431 ) ) ( not ( = ?auto_298430 ?auto_298431 ) ) ( ON ?auto_298429 ?auto_298430 ) ( ON ?auto_298428 ?auto_298429 ) ( ON ?auto_298427 ?auto_298428 ) ( ON ?auto_298426 ?auto_298427 ) ( ON ?auto_298425 ?auto_298426 ) ( ON ?auto_298424 ?auto_298425 ) ( ON ?auto_298423 ?auto_298424 ) ( ON ?auto_298422 ?auto_298423 ) ( CLEAR ?auto_298420 ) ( ON ?auto_298421 ?auto_298422 ) ( CLEAR ?auto_298421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_298420 ?auto_298421 )
      ( MAKE-11PILE ?auto_298420 ?auto_298421 ?auto_298422 ?auto_298423 ?auto_298424 ?auto_298425 ?auto_298426 ?auto_298427 ?auto_298428 ?auto_298429 ?auto_298430 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_298443 - BLOCK
      ?auto_298444 - BLOCK
      ?auto_298445 - BLOCK
      ?auto_298446 - BLOCK
      ?auto_298447 - BLOCK
      ?auto_298448 - BLOCK
      ?auto_298449 - BLOCK
      ?auto_298450 - BLOCK
      ?auto_298451 - BLOCK
      ?auto_298452 - BLOCK
      ?auto_298453 - BLOCK
    )
    :vars
    (
      ?auto_298454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298453 ?auto_298454 ) ( ON-TABLE ?auto_298443 ) ( not ( = ?auto_298443 ?auto_298444 ) ) ( not ( = ?auto_298443 ?auto_298445 ) ) ( not ( = ?auto_298443 ?auto_298446 ) ) ( not ( = ?auto_298443 ?auto_298447 ) ) ( not ( = ?auto_298443 ?auto_298448 ) ) ( not ( = ?auto_298443 ?auto_298449 ) ) ( not ( = ?auto_298443 ?auto_298450 ) ) ( not ( = ?auto_298443 ?auto_298451 ) ) ( not ( = ?auto_298443 ?auto_298452 ) ) ( not ( = ?auto_298443 ?auto_298453 ) ) ( not ( = ?auto_298443 ?auto_298454 ) ) ( not ( = ?auto_298444 ?auto_298445 ) ) ( not ( = ?auto_298444 ?auto_298446 ) ) ( not ( = ?auto_298444 ?auto_298447 ) ) ( not ( = ?auto_298444 ?auto_298448 ) ) ( not ( = ?auto_298444 ?auto_298449 ) ) ( not ( = ?auto_298444 ?auto_298450 ) ) ( not ( = ?auto_298444 ?auto_298451 ) ) ( not ( = ?auto_298444 ?auto_298452 ) ) ( not ( = ?auto_298444 ?auto_298453 ) ) ( not ( = ?auto_298444 ?auto_298454 ) ) ( not ( = ?auto_298445 ?auto_298446 ) ) ( not ( = ?auto_298445 ?auto_298447 ) ) ( not ( = ?auto_298445 ?auto_298448 ) ) ( not ( = ?auto_298445 ?auto_298449 ) ) ( not ( = ?auto_298445 ?auto_298450 ) ) ( not ( = ?auto_298445 ?auto_298451 ) ) ( not ( = ?auto_298445 ?auto_298452 ) ) ( not ( = ?auto_298445 ?auto_298453 ) ) ( not ( = ?auto_298445 ?auto_298454 ) ) ( not ( = ?auto_298446 ?auto_298447 ) ) ( not ( = ?auto_298446 ?auto_298448 ) ) ( not ( = ?auto_298446 ?auto_298449 ) ) ( not ( = ?auto_298446 ?auto_298450 ) ) ( not ( = ?auto_298446 ?auto_298451 ) ) ( not ( = ?auto_298446 ?auto_298452 ) ) ( not ( = ?auto_298446 ?auto_298453 ) ) ( not ( = ?auto_298446 ?auto_298454 ) ) ( not ( = ?auto_298447 ?auto_298448 ) ) ( not ( = ?auto_298447 ?auto_298449 ) ) ( not ( = ?auto_298447 ?auto_298450 ) ) ( not ( = ?auto_298447 ?auto_298451 ) ) ( not ( = ?auto_298447 ?auto_298452 ) ) ( not ( = ?auto_298447 ?auto_298453 ) ) ( not ( = ?auto_298447 ?auto_298454 ) ) ( not ( = ?auto_298448 ?auto_298449 ) ) ( not ( = ?auto_298448 ?auto_298450 ) ) ( not ( = ?auto_298448 ?auto_298451 ) ) ( not ( = ?auto_298448 ?auto_298452 ) ) ( not ( = ?auto_298448 ?auto_298453 ) ) ( not ( = ?auto_298448 ?auto_298454 ) ) ( not ( = ?auto_298449 ?auto_298450 ) ) ( not ( = ?auto_298449 ?auto_298451 ) ) ( not ( = ?auto_298449 ?auto_298452 ) ) ( not ( = ?auto_298449 ?auto_298453 ) ) ( not ( = ?auto_298449 ?auto_298454 ) ) ( not ( = ?auto_298450 ?auto_298451 ) ) ( not ( = ?auto_298450 ?auto_298452 ) ) ( not ( = ?auto_298450 ?auto_298453 ) ) ( not ( = ?auto_298450 ?auto_298454 ) ) ( not ( = ?auto_298451 ?auto_298452 ) ) ( not ( = ?auto_298451 ?auto_298453 ) ) ( not ( = ?auto_298451 ?auto_298454 ) ) ( not ( = ?auto_298452 ?auto_298453 ) ) ( not ( = ?auto_298452 ?auto_298454 ) ) ( not ( = ?auto_298453 ?auto_298454 ) ) ( ON ?auto_298452 ?auto_298453 ) ( ON ?auto_298451 ?auto_298452 ) ( ON ?auto_298450 ?auto_298451 ) ( ON ?auto_298449 ?auto_298450 ) ( ON ?auto_298448 ?auto_298449 ) ( ON ?auto_298447 ?auto_298448 ) ( ON ?auto_298446 ?auto_298447 ) ( ON ?auto_298445 ?auto_298446 ) ( CLEAR ?auto_298443 ) ( ON ?auto_298444 ?auto_298445 ) ( CLEAR ?auto_298444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_298443 ?auto_298444 )
      ( MAKE-11PILE ?auto_298443 ?auto_298444 ?auto_298445 ?auto_298446 ?auto_298447 ?auto_298448 ?auto_298449 ?auto_298450 ?auto_298451 ?auto_298452 ?auto_298453 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_298466 - BLOCK
      ?auto_298467 - BLOCK
      ?auto_298468 - BLOCK
      ?auto_298469 - BLOCK
      ?auto_298470 - BLOCK
      ?auto_298471 - BLOCK
      ?auto_298472 - BLOCK
      ?auto_298473 - BLOCK
      ?auto_298474 - BLOCK
      ?auto_298475 - BLOCK
      ?auto_298476 - BLOCK
    )
    :vars
    (
      ?auto_298477 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298476 ?auto_298477 ) ( not ( = ?auto_298466 ?auto_298467 ) ) ( not ( = ?auto_298466 ?auto_298468 ) ) ( not ( = ?auto_298466 ?auto_298469 ) ) ( not ( = ?auto_298466 ?auto_298470 ) ) ( not ( = ?auto_298466 ?auto_298471 ) ) ( not ( = ?auto_298466 ?auto_298472 ) ) ( not ( = ?auto_298466 ?auto_298473 ) ) ( not ( = ?auto_298466 ?auto_298474 ) ) ( not ( = ?auto_298466 ?auto_298475 ) ) ( not ( = ?auto_298466 ?auto_298476 ) ) ( not ( = ?auto_298466 ?auto_298477 ) ) ( not ( = ?auto_298467 ?auto_298468 ) ) ( not ( = ?auto_298467 ?auto_298469 ) ) ( not ( = ?auto_298467 ?auto_298470 ) ) ( not ( = ?auto_298467 ?auto_298471 ) ) ( not ( = ?auto_298467 ?auto_298472 ) ) ( not ( = ?auto_298467 ?auto_298473 ) ) ( not ( = ?auto_298467 ?auto_298474 ) ) ( not ( = ?auto_298467 ?auto_298475 ) ) ( not ( = ?auto_298467 ?auto_298476 ) ) ( not ( = ?auto_298467 ?auto_298477 ) ) ( not ( = ?auto_298468 ?auto_298469 ) ) ( not ( = ?auto_298468 ?auto_298470 ) ) ( not ( = ?auto_298468 ?auto_298471 ) ) ( not ( = ?auto_298468 ?auto_298472 ) ) ( not ( = ?auto_298468 ?auto_298473 ) ) ( not ( = ?auto_298468 ?auto_298474 ) ) ( not ( = ?auto_298468 ?auto_298475 ) ) ( not ( = ?auto_298468 ?auto_298476 ) ) ( not ( = ?auto_298468 ?auto_298477 ) ) ( not ( = ?auto_298469 ?auto_298470 ) ) ( not ( = ?auto_298469 ?auto_298471 ) ) ( not ( = ?auto_298469 ?auto_298472 ) ) ( not ( = ?auto_298469 ?auto_298473 ) ) ( not ( = ?auto_298469 ?auto_298474 ) ) ( not ( = ?auto_298469 ?auto_298475 ) ) ( not ( = ?auto_298469 ?auto_298476 ) ) ( not ( = ?auto_298469 ?auto_298477 ) ) ( not ( = ?auto_298470 ?auto_298471 ) ) ( not ( = ?auto_298470 ?auto_298472 ) ) ( not ( = ?auto_298470 ?auto_298473 ) ) ( not ( = ?auto_298470 ?auto_298474 ) ) ( not ( = ?auto_298470 ?auto_298475 ) ) ( not ( = ?auto_298470 ?auto_298476 ) ) ( not ( = ?auto_298470 ?auto_298477 ) ) ( not ( = ?auto_298471 ?auto_298472 ) ) ( not ( = ?auto_298471 ?auto_298473 ) ) ( not ( = ?auto_298471 ?auto_298474 ) ) ( not ( = ?auto_298471 ?auto_298475 ) ) ( not ( = ?auto_298471 ?auto_298476 ) ) ( not ( = ?auto_298471 ?auto_298477 ) ) ( not ( = ?auto_298472 ?auto_298473 ) ) ( not ( = ?auto_298472 ?auto_298474 ) ) ( not ( = ?auto_298472 ?auto_298475 ) ) ( not ( = ?auto_298472 ?auto_298476 ) ) ( not ( = ?auto_298472 ?auto_298477 ) ) ( not ( = ?auto_298473 ?auto_298474 ) ) ( not ( = ?auto_298473 ?auto_298475 ) ) ( not ( = ?auto_298473 ?auto_298476 ) ) ( not ( = ?auto_298473 ?auto_298477 ) ) ( not ( = ?auto_298474 ?auto_298475 ) ) ( not ( = ?auto_298474 ?auto_298476 ) ) ( not ( = ?auto_298474 ?auto_298477 ) ) ( not ( = ?auto_298475 ?auto_298476 ) ) ( not ( = ?auto_298475 ?auto_298477 ) ) ( not ( = ?auto_298476 ?auto_298477 ) ) ( ON ?auto_298475 ?auto_298476 ) ( ON ?auto_298474 ?auto_298475 ) ( ON ?auto_298473 ?auto_298474 ) ( ON ?auto_298472 ?auto_298473 ) ( ON ?auto_298471 ?auto_298472 ) ( ON ?auto_298470 ?auto_298471 ) ( ON ?auto_298469 ?auto_298470 ) ( ON ?auto_298468 ?auto_298469 ) ( ON ?auto_298467 ?auto_298468 ) ( ON ?auto_298466 ?auto_298467 ) ( CLEAR ?auto_298466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_298466 )
      ( MAKE-11PILE ?auto_298466 ?auto_298467 ?auto_298468 ?auto_298469 ?auto_298470 ?auto_298471 ?auto_298472 ?auto_298473 ?auto_298474 ?auto_298475 ?auto_298476 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_298489 - BLOCK
      ?auto_298490 - BLOCK
      ?auto_298491 - BLOCK
      ?auto_298492 - BLOCK
      ?auto_298493 - BLOCK
      ?auto_298494 - BLOCK
      ?auto_298495 - BLOCK
      ?auto_298496 - BLOCK
      ?auto_298497 - BLOCK
      ?auto_298498 - BLOCK
      ?auto_298499 - BLOCK
    )
    :vars
    (
      ?auto_298500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298499 ?auto_298500 ) ( not ( = ?auto_298489 ?auto_298490 ) ) ( not ( = ?auto_298489 ?auto_298491 ) ) ( not ( = ?auto_298489 ?auto_298492 ) ) ( not ( = ?auto_298489 ?auto_298493 ) ) ( not ( = ?auto_298489 ?auto_298494 ) ) ( not ( = ?auto_298489 ?auto_298495 ) ) ( not ( = ?auto_298489 ?auto_298496 ) ) ( not ( = ?auto_298489 ?auto_298497 ) ) ( not ( = ?auto_298489 ?auto_298498 ) ) ( not ( = ?auto_298489 ?auto_298499 ) ) ( not ( = ?auto_298489 ?auto_298500 ) ) ( not ( = ?auto_298490 ?auto_298491 ) ) ( not ( = ?auto_298490 ?auto_298492 ) ) ( not ( = ?auto_298490 ?auto_298493 ) ) ( not ( = ?auto_298490 ?auto_298494 ) ) ( not ( = ?auto_298490 ?auto_298495 ) ) ( not ( = ?auto_298490 ?auto_298496 ) ) ( not ( = ?auto_298490 ?auto_298497 ) ) ( not ( = ?auto_298490 ?auto_298498 ) ) ( not ( = ?auto_298490 ?auto_298499 ) ) ( not ( = ?auto_298490 ?auto_298500 ) ) ( not ( = ?auto_298491 ?auto_298492 ) ) ( not ( = ?auto_298491 ?auto_298493 ) ) ( not ( = ?auto_298491 ?auto_298494 ) ) ( not ( = ?auto_298491 ?auto_298495 ) ) ( not ( = ?auto_298491 ?auto_298496 ) ) ( not ( = ?auto_298491 ?auto_298497 ) ) ( not ( = ?auto_298491 ?auto_298498 ) ) ( not ( = ?auto_298491 ?auto_298499 ) ) ( not ( = ?auto_298491 ?auto_298500 ) ) ( not ( = ?auto_298492 ?auto_298493 ) ) ( not ( = ?auto_298492 ?auto_298494 ) ) ( not ( = ?auto_298492 ?auto_298495 ) ) ( not ( = ?auto_298492 ?auto_298496 ) ) ( not ( = ?auto_298492 ?auto_298497 ) ) ( not ( = ?auto_298492 ?auto_298498 ) ) ( not ( = ?auto_298492 ?auto_298499 ) ) ( not ( = ?auto_298492 ?auto_298500 ) ) ( not ( = ?auto_298493 ?auto_298494 ) ) ( not ( = ?auto_298493 ?auto_298495 ) ) ( not ( = ?auto_298493 ?auto_298496 ) ) ( not ( = ?auto_298493 ?auto_298497 ) ) ( not ( = ?auto_298493 ?auto_298498 ) ) ( not ( = ?auto_298493 ?auto_298499 ) ) ( not ( = ?auto_298493 ?auto_298500 ) ) ( not ( = ?auto_298494 ?auto_298495 ) ) ( not ( = ?auto_298494 ?auto_298496 ) ) ( not ( = ?auto_298494 ?auto_298497 ) ) ( not ( = ?auto_298494 ?auto_298498 ) ) ( not ( = ?auto_298494 ?auto_298499 ) ) ( not ( = ?auto_298494 ?auto_298500 ) ) ( not ( = ?auto_298495 ?auto_298496 ) ) ( not ( = ?auto_298495 ?auto_298497 ) ) ( not ( = ?auto_298495 ?auto_298498 ) ) ( not ( = ?auto_298495 ?auto_298499 ) ) ( not ( = ?auto_298495 ?auto_298500 ) ) ( not ( = ?auto_298496 ?auto_298497 ) ) ( not ( = ?auto_298496 ?auto_298498 ) ) ( not ( = ?auto_298496 ?auto_298499 ) ) ( not ( = ?auto_298496 ?auto_298500 ) ) ( not ( = ?auto_298497 ?auto_298498 ) ) ( not ( = ?auto_298497 ?auto_298499 ) ) ( not ( = ?auto_298497 ?auto_298500 ) ) ( not ( = ?auto_298498 ?auto_298499 ) ) ( not ( = ?auto_298498 ?auto_298500 ) ) ( not ( = ?auto_298499 ?auto_298500 ) ) ( ON ?auto_298498 ?auto_298499 ) ( ON ?auto_298497 ?auto_298498 ) ( ON ?auto_298496 ?auto_298497 ) ( ON ?auto_298495 ?auto_298496 ) ( ON ?auto_298494 ?auto_298495 ) ( ON ?auto_298493 ?auto_298494 ) ( ON ?auto_298492 ?auto_298493 ) ( ON ?auto_298491 ?auto_298492 ) ( ON ?auto_298490 ?auto_298491 ) ( ON ?auto_298489 ?auto_298490 ) ( CLEAR ?auto_298489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_298489 )
      ( MAKE-11PILE ?auto_298489 ?auto_298490 ?auto_298491 ?auto_298492 ?auto_298493 ?auto_298494 ?auto_298495 ?auto_298496 ?auto_298497 ?auto_298498 ?auto_298499 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_298513 - BLOCK
      ?auto_298514 - BLOCK
      ?auto_298515 - BLOCK
      ?auto_298516 - BLOCK
      ?auto_298517 - BLOCK
      ?auto_298518 - BLOCK
      ?auto_298519 - BLOCK
      ?auto_298520 - BLOCK
      ?auto_298521 - BLOCK
      ?auto_298522 - BLOCK
      ?auto_298523 - BLOCK
      ?auto_298524 - BLOCK
    )
    :vars
    (
      ?auto_298525 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_298523 ) ( ON ?auto_298524 ?auto_298525 ) ( CLEAR ?auto_298524 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_298513 ) ( ON ?auto_298514 ?auto_298513 ) ( ON ?auto_298515 ?auto_298514 ) ( ON ?auto_298516 ?auto_298515 ) ( ON ?auto_298517 ?auto_298516 ) ( ON ?auto_298518 ?auto_298517 ) ( ON ?auto_298519 ?auto_298518 ) ( ON ?auto_298520 ?auto_298519 ) ( ON ?auto_298521 ?auto_298520 ) ( ON ?auto_298522 ?auto_298521 ) ( ON ?auto_298523 ?auto_298522 ) ( not ( = ?auto_298513 ?auto_298514 ) ) ( not ( = ?auto_298513 ?auto_298515 ) ) ( not ( = ?auto_298513 ?auto_298516 ) ) ( not ( = ?auto_298513 ?auto_298517 ) ) ( not ( = ?auto_298513 ?auto_298518 ) ) ( not ( = ?auto_298513 ?auto_298519 ) ) ( not ( = ?auto_298513 ?auto_298520 ) ) ( not ( = ?auto_298513 ?auto_298521 ) ) ( not ( = ?auto_298513 ?auto_298522 ) ) ( not ( = ?auto_298513 ?auto_298523 ) ) ( not ( = ?auto_298513 ?auto_298524 ) ) ( not ( = ?auto_298513 ?auto_298525 ) ) ( not ( = ?auto_298514 ?auto_298515 ) ) ( not ( = ?auto_298514 ?auto_298516 ) ) ( not ( = ?auto_298514 ?auto_298517 ) ) ( not ( = ?auto_298514 ?auto_298518 ) ) ( not ( = ?auto_298514 ?auto_298519 ) ) ( not ( = ?auto_298514 ?auto_298520 ) ) ( not ( = ?auto_298514 ?auto_298521 ) ) ( not ( = ?auto_298514 ?auto_298522 ) ) ( not ( = ?auto_298514 ?auto_298523 ) ) ( not ( = ?auto_298514 ?auto_298524 ) ) ( not ( = ?auto_298514 ?auto_298525 ) ) ( not ( = ?auto_298515 ?auto_298516 ) ) ( not ( = ?auto_298515 ?auto_298517 ) ) ( not ( = ?auto_298515 ?auto_298518 ) ) ( not ( = ?auto_298515 ?auto_298519 ) ) ( not ( = ?auto_298515 ?auto_298520 ) ) ( not ( = ?auto_298515 ?auto_298521 ) ) ( not ( = ?auto_298515 ?auto_298522 ) ) ( not ( = ?auto_298515 ?auto_298523 ) ) ( not ( = ?auto_298515 ?auto_298524 ) ) ( not ( = ?auto_298515 ?auto_298525 ) ) ( not ( = ?auto_298516 ?auto_298517 ) ) ( not ( = ?auto_298516 ?auto_298518 ) ) ( not ( = ?auto_298516 ?auto_298519 ) ) ( not ( = ?auto_298516 ?auto_298520 ) ) ( not ( = ?auto_298516 ?auto_298521 ) ) ( not ( = ?auto_298516 ?auto_298522 ) ) ( not ( = ?auto_298516 ?auto_298523 ) ) ( not ( = ?auto_298516 ?auto_298524 ) ) ( not ( = ?auto_298516 ?auto_298525 ) ) ( not ( = ?auto_298517 ?auto_298518 ) ) ( not ( = ?auto_298517 ?auto_298519 ) ) ( not ( = ?auto_298517 ?auto_298520 ) ) ( not ( = ?auto_298517 ?auto_298521 ) ) ( not ( = ?auto_298517 ?auto_298522 ) ) ( not ( = ?auto_298517 ?auto_298523 ) ) ( not ( = ?auto_298517 ?auto_298524 ) ) ( not ( = ?auto_298517 ?auto_298525 ) ) ( not ( = ?auto_298518 ?auto_298519 ) ) ( not ( = ?auto_298518 ?auto_298520 ) ) ( not ( = ?auto_298518 ?auto_298521 ) ) ( not ( = ?auto_298518 ?auto_298522 ) ) ( not ( = ?auto_298518 ?auto_298523 ) ) ( not ( = ?auto_298518 ?auto_298524 ) ) ( not ( = ?auto_298518 ?auto_298525 ) ) ( not ( = ?auto_298519 ?auto_298520 ) ) ( not ( = ?auto_298519 ?auto_298521 ) ) ( not ( = ?auto_298519 ?auto_298522 ) ) ( not ( = ?auto_298519 ?auto_298523 ) ) ( not ( = ?auto_298519 ?auto_298524 ) ) ( not ( = ?auto_298519 ?auto_298525 ) ) ( not ( = ?auto_298520 ?auto_298521 ) ) ( not ( = ?auto_298520 ?auto_298522 ) ) ( not ( = ?auto_298520 ?auto_298523 ) ) ( not ( = ?auto_298520 ?auto_298524 ) ) ( not ( = ?auto_298520 ?auto_298525 ) ) ( not ( = ?auto_298521 ?auto_298522 ) ) ( not ( = ?auto_298521 ?auto_298523 ) ) ( not ( = ?auto_298521 ?auto_298524 ) ) ( not ( = ?auto_298521 ?auto_298525 ) ) ( not ( = ?auto_298522 ?auto_298523 ) ) ( not ( = ?auto_298522 ?auto_298524 ) ) ( not ( = ?auto_298522 ?auto_298525 ) ) ( not ( = ?auto_298523 ?auto_298524 ) ) ( not ( = ?auto_298523 ?auto_298525 ) ) ( not ( = ?auto_298524 ?auto_298525 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_298524 ?auto_298525 )
      ( !STACK ?auto_298524 ?auto_298523 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_298538 - BLOCK
      ?auto_298539 - BLOCK
      ?auto_298540 - BLOCK
      ?auto_298541 - BLOCK
      ?auto_298542 - BLOCK
      ?auto_298543 - BLOCK
      ?auto_298544 - BLOCK
      ?auto_298545 - BLOCK
      ?auto_298546 - BLOCK
      ?auto_298547 - BLOCK
      ?auto_298548 - BLOCK
      ?auto_298549 - BLOCK
    )
    :vars
    (
      ?auto_298550 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_298548 ) ( ON ?auto_298549 ?auto_298550 ) ( CLEAR ?auto_298549 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_298538 ) ( ON ?auto_298539 ?auto_298538 ) ( ON ?auto_298540 ?auto_298539 ) ( ON ?auto_298541 ?auto_298540 ) ( ON ?auto_298542 ?auto_298541 ) ( ON ?auto_298543 ?auto_298542 ) ( ON ?auto_298544 ?auto_298543 ) ( ON ?auto_298545 ?auto_298544 ) ( ON ?auto_298546 ?auto_298545 ) ( ON ?auto_298547 ?auto_298546 ) ( ON ?auto_298548 ?auto_298547 ) ( not ( = ?auto_298538 ?auto_298539 ) ) ( not ( = ?auto_298538 ?auto_298540 ) ) ( not ( = ?auto_298538 ?auto_298541 ) ) ( not ( = ?auto_298538 ?auto_298542 ) ) ( not ( = ?auto_298538 ?auto_298543 ) ) ( not ( = ?auto_298538 ?auto_298544 ) ) ( not ( = ?auto_298538 ?auto_298545 ) ) ( not ( = ?auto_298538 ?auto_298546 ) ) ( not ( = ?auto_298538 ?auto_298547 ) ) ( not ( = ?auto_298538 ?auto_298548 ) ) ( not ( = ?auto_298538 ?auto_298549 ) ) ( not ( = ?auto_298538 ?auto_298550 ) ) ( not ( = ?auto_298539 ?auto_298540 ) ) ( not ( = ?auto_298539 ?auto_298541 ) ) ( not ( = ?auto_298539 ?auto_298542 ) ) ( not ( = ?auto_298539 ?auto_298543 ) ) ( not ( = ?auto_298539 ?auto_298544 ) ) ( not ( = ?auto_298539 ?auto_298545 ) ) ( not ( = ?auto_298539 ?auto_298546 ) ) ( not ( = ?auto_298539 ?auto_298547 ) ) ( not ( = ?auto_298539 ?auto_298548 ) ) ( not ( = ?auto_298539 ?auto_298549 ) ) ( not ( = ?auto_298539 ?auto_298550 ) ) ( not ( = ?auto_298540 ?auto_298541 ) ) ( not ( = ?auto_298540 ?auto_298542 ) ) ( not ( = ?auto_298540 ?auto_298543 ) ) ( not ( = ?auto_298540 ?auto_298544 ) ) ( not ( = ?auto_298540 ?auto_298545 ) ) ( not ( = ?auto_298540 ?auto_298546 ) ) ( not ( = ?auto_298540 ?auto_298547 ) ) ( not ( = ?auto_298540 ?auto_298548 ) ) ( not ( = ?auto_298540 ?auto_298549 ) ) ( not ( = ?auto_298540 ?auto_298550 ) ) ( not ( = ?auto_298541 ?auto_298542 ) ) ( not ( = ?auto_298541 ?auto_298543 ) ) ( not ( = ?auto_298541 ?auto_298544 ) ) ( not ( = ?auto_298541 ?auto_298545 ) ) ( not ( = ?auto_298541 ?auto_298546 ) ) ( not ( = ?auto_298541 ?auto_298547 ) ) ( not ( = ?auto_298541 ?auto_298548 ) ) ( not ( = ?auto_298541 ?auto_298549 ) ) ( not ( = ?auto_298541 ?auto_298550 ) ) ( not ( = ?auto_298542 ?auto_298543 ) ) ( not ( = ?auto_298542 ?auto_298544 ) ) ( not ( = ?auto_298542 ?auto_298545 ) ) ( not ( = ?auto_298542 ?auto_298546 ) ) ( not ( = ?auto_298542 ?auto_298547 ) ) ( not ( = ?auto_298542 ?auto_298548 ) ) ( not ( = ?auto_298542 ?auto_298549 ) ) ( not ( = ?auto_298542 ?auto_298550 ) ) ( not ( = ?auto_298543 ?auto_298544 ) ) ( not ( = ?auto_298543 ?auto_298545 ) ) ( not ( = ?auto_298543 ?auto_298546 ) ) ( not ( = ?auto_298543 ?auto_298547 ) ) ( not ( = ?auto_298543 ?auto_298548 ) ) ( not ( = ?auto_298543 ?auto_298549 ) ) ( not ( = ?auto_298543 ?auto_298550 ) ) ( not ( = ?auto_298544 ?auto_298545 ) ) ( not ( = ?auto_298544 ?auto_298546 ) ) ( not ( = ?auto_298544 ?auto_298547 ) ) ( not ( = ?auto_298544 ?auto_298548 ) ) ( not ( = ?auto_298544 ?auto_298549 ) ) ( not ( = ?auto_298544 ?auto_298550 ) ) ( not ( = ?auto_298545 ?auto_298546 ) ) ( not ( = ?auto_298545 ?auto_298547 ) ) ( not ( = ?auto_298545 ?auto_298548 ) ) ( not ( = ?auto_298545 ?auto_298549 ) ) ( not ( = ?auto_298545 ?auto_298550 ) ) ( not ( = ?auto_298546 ?auto_298547 ) ) ( not ( = ?auto_298546 ?auto_298548 ) ) ( not ( = ?auto_298546 ?auto_298549 ) ) ( not ( = ?auto_298546 ?auto_298550 ) ) ( not ( = ?auto_298547 ?auto_298548 ) ) ( not ( = ?auto_298547 ?auto_298549 ) ) ( not ( = ?auto_298547 ?auto_298550 ) ) ( not ( = ?auto_298548 ?auto_298549 ) ) ( not ( = ?auto_298548 ?auto_298550 ) ) ( not ( = ?auto_298549 ?auto_298550 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_298549 ?auto_298550 )
      ( !STACK ?auto_298549 ?auto_298548 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_298563 - BLOCK
      ?auto_298564 - BLOCK
      ?auto_298565 - BLOCK
      ?auto_298566 - BLOCK
      ?auto_298567 - BLOCK
      ?auto_298568 - BLOCK
      ?auto_298569 - BLOCK
      ?auto_298570 - BLOCK
      ?auto_298571 - BLOCK
      ?auto_298572 - BLOCK
      ?auto_298573 - BLOCK
      ?auto_298574 - BLOCK
    )
    :vars
    (
      ?auto_298575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298574 ?auto_298575 ) ( ON-TABLE ?auto_298563 ) ( ON ?auto_298564 ?auto_298563 ) ( ON ?auto_298565 ?auto_298564 ) ( ON ?auto_298566 ?auto_298565 ) ( ON ?auto_298567 ?auto_298566 ) ( ON ?auto_298568 ?auto_298567 ) ( ON ?auto_298569 ?auto_298568 ) ( ON ?auto_298570 ?auto_298569 ) ( ON ?auto_298571 ?auto_298570 ) ( ON ?auto_298572 ?auto_298571 ) ( not ( = ?auto_298563 ?auto_298564 ) ) ( not ( = ?auto_298563 ?auto_298565 ) ) ( not ( = ?auto_298563 ?auto_298566 ) ) ( not ( = ?auto_298563 ?auto_298567 ) ) ( not ( = ?auto_298563 ?auto_298568 ) ) ( not ( = ?auto_298563 ?auto_298569 ) ) ( not ( = ?auto_298563 ?auto_298570 ) ) ( not ( = ?auto_298563 ?auto_298571 ) ) ( not ( = ?auto_298563 ?auto_298572 ) ) ( not ( = ?auto_298563 ?auto_298573 ) ) ( not ( = ?auto_298563 ?auto_298574 ) ) ( not ( = ?auto_298563 ?auto_298575 ) ) ( not ( = ?auto_298564 ?auto_298565 ) ) ( not ( = ?auto_298564 ?auto_298566 ) ) ( not ( = ?auto_298564 ?auto_298567 ) ) ( not ( = ?auto_298564 ?auto_298568 ) ) ( not ( = ?auto_298564 ?auto_298569 ) ) ( not ( = ?auto_298564 ?auto_298570 ) ) ( not ( = ?auto_298564 ?auto_298571 ) ) ( not ( = ?auto_298564 ?auto_298572 ) ) ( not ( = ?auto_298564 ?auto_298573 ) ) ( not ( = ?auto_298564 ?auto_298574 ) ) ( not ( = ?auto_298564 ?auto_298575 ) ) ( not ( = ?auto_298565 ?auto_298566 ) ) ( not ( = ?auto_298565 ?auto_298567 ) ) ( not ( = ?auto_298565 ?auto_298568 ) ) ( not ( = ?auto_298565 ?auto_298569 ) ) ( not ( = ?auto_298565 ?auto_298570 ) ) ( not ( = ?auto_298565 ?auto_298571 ) ) ( not ( = ?auto_298565 ?auto_298572 ) ) ( not ( = ?auto_298565 ?auto_298573 ) ) ( not ( = ?auto_298565 ?auto_298574 ) ) ( not ( = ?auto_298565 ?auto_298575 ) ) ( not ( = ?auto_298566 ?auto_298567 ) ) ( not ( = ?auto_298566 ?auto_298568 ) ) ( not ( = ?auto_298566 ?auto_298569 ) ) ( not ( = ?auto_298566 ?auto_298570 ) ) ( not ( = ?auto_298566 ?auto_298571 ) ) ( not ( = ?auto_298566 ?auto_298572 ) ) ( not ( = ?auto_298566 ?auto_298573 ) ) ( not ( = ?auto_298566 ?auto_298574 ) ) ( not ( = ?auto_298566 ?auto_298575 ) ) ( not ( = ?auto_298567 ?auto_298568 ) ) ( not ( = ?auto_298567 ?auto_298569 ) ) ( not ( = ?auto_298567 ?auto_298570 ) ) ( not ( = ?auto_298567 ?auto_298571 ) ) ( not ( = ?auto_298567 ?auto_298572 ) ) ( not ( = ?auto_298567 ?auto_298573 ) ) ( not ( = ?auto_298567 ?auto_298574 ) ) ( not ( = ?auto_298567 ?auto_298575 ) ) ( not ( = ?auto_298568 ?auto_298569 ) ) ( not ( = ?auto_298568 ?auto_298570 ) ) ( not ( = ?auto_298568 ?auto_298571 ) ) ( not ( = ?auto_298568 ?auto_298572 ) ) ( not ( = ?auto_298568 ?auto_298573 ) ) ( not ( = ?auto_298568 ?auto_298574 ) ) ( not ( = ?auto_298568 ?auto_298575 ) ) ( not ( = ?auto_298569 ?auto_298570 ) ) ( not ( = ?auto_298569 ?auto_298571 ) ) ( not ( = ?auto_298569 ?auto_298572 ) ) ( not ( = ?auto_298569 ?auto_298573 ) ) ( not ( = ?auto_298569 ?auto_298574 ) ) ( not ( = ?auto_298569 ?auto_298575 ) ) ( not ( = ?auto_298570 ?auto_298571 ) ) ( not ( = ?auto_298570 ?auto_298572 ) ) ( not ( = ?auto_298570 ?auto_298573 ) ) ( not ( = ?auto_298570 ?auto_298574 ) ) ( not ( = ?auto_298570 ?auto_298575 ) ) ( not ( = ?auto_298571 ?auto_298572 ) ) ( not ( = ?auto_298571 ?auto_298573 ) ) ( not ( = ?auto_298571 ?auto_298574 ) ) ( not ( = ?auto_298571 ?auto_298575 ) ) ( not ( = ?auto_298572 ?auto_298573 ) ) ( not ( = ?auto_298572 ?auto_298574 ) ) ( not ( = ?auto_298572 ?auto_298575 ) ) ( not ( = ?auto_298573 ?auto_298574 ) ) ( not ( = ?auto_298573 ?auto_298575 ) ) ( not ( = ?auto_298574 ?auto_298575 ) ) ( CLEAR ?auto_298572 ) ( ON ?auto_298573 ?auto_298574 ) ( CLEAR ?auto_298573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_298563 ?auto_298564 ?auto_298565 ?auto_298566 ?auto_298567 ?auto_298568 ?auto_298569 ?auto_298570 ?auto_298571 ?auto_298572 ?auto_298573 )
      ( MAKE-12PILE ?auto_298563 ?auto_298564 ?auto_298565 ?auto_298566 ?auto_298567 ?auto_298568 ?auto_298569 ?auto_298570 ?auto_298571 ?auto_298572 ?auto_298573 ?auto_298574 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_298588 - BLOCK
      ?auto_298589 - BLOCK
      ?auto_298590 - BLOCK
      ?auto_298591 - BLOCK
      ?auto_298592 - BLOCK
      ?auto_298593 - BLOCK
      ?auto_298594 - BLOCK
      ?auto_298595 - BLOCK
      ?auto_298596 - BLOCK
      ?auto_298597 - BLOCK
      ?auto_298598 - BLOCK
      ?auto_298599 - BLOCK
    )
    :vars
    (
      ?auto_298600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298599 ?auto_298600 ) ( ON-TABLE ?auto_298588 ) ( ON ?auto_298589 ?auto_298588 ) ( ON ?auto_298590 ?auto_298589 ) ( ON ?auto_298591 ?auto_298590 ) ( ON ?auto_298592 ?auto_298591 ) ( ON ?auto_298593 ?auto_298592 ) ( ON ?auto_298594 ?auto_298593 ) ( ON ?auto_298595 ?auto_298594 ) ( ON ?auto_298596 ?auto_298595 ) ( ON ?auto_298597 ?auto_298596 ) ( not ( = ?auto_298588 ?auto_298589 ) ) ( not ( = ?auto_298588 ?auto_298590 ) ) ( not ( = ?auto_298588 ?auto_298591 ) ) ( not ( = ?auto_298588 ?auto_298592 ) ) ( not ( = ?auto_298588 ?auto_298593 ) ) ( not ( = ?auto_298588 ?auto_298594 ) ) ( not ( = ?auto_298588 ?auto_298595 ) ) ( not ( = ?auto_298588 ?auto_298596 ) ) ( not ( = ?auto_298588 ?auto_298597 ) ) ( not ( = ?auto_298588 ?auto_298598 ) ) ( not ( = ?auto_298588 ?auto_298599 ) ) ( not ( = ?auto_298588 ?auto_298600 ) ) ( not ( = ?auto_298589 ?auto_298590 ) ) ( not ( = ?auto_298589 ?auto_298591 ) ) ( not ( = ?auto_298589 ?auto_298592 ) ) ( not ( = ?auto_298589 ?auto_298593 ) ) ( not ( = ?auto_298589 ?auto_298594 ) ) ( not ( = ?auto_298589 ?auto_298595 ) ) ( not ( = ?auto_298589 ?auto_298596 ) ) ( not ( = ?auto_298589 ?auto_298597 ) ) ( not ( = ?auto_298589 ?auto_298598 ) ) ( not ( = ?auto_298589 ?auto_298599 ) ) ( not ( = ?auto_298589 ?auto_298600 ) ) ( not ( = ?auto_298590 ?auto_298591 ) ) ( not ( = ?auto_298590 ?auto_298592 ) ) ( not ( = ?auto_298590 ?auto_298593 ) ) ( not ( = ?auto_298590 ?auto_298594 ) ) ( not ( = ?auto_298590 ?auto_298595 ) ) ( not ( = ?auto_298590 ?auto_298596 ) ) ( not ( = ?auto_298590 ?auto_298597 ) ) ( not ( = ?auto_298590 ?auto_298598 ) ) ( not ( = ?auto_298590 ?auto_298599 ) ) ( not ( = ?auto_298590 ?auto_298600 ) ) ( not ( = ?auto_298591 ?auto_298592 ) ) ( not ( = ?auto_298591 ?auto_298593 ) ) ( not ( = ?auto_298591 ?auto_298594 ) ) ( not ( = ?auto_298591 ?auto_298595 ) ) ( not ( = ?auto_298591 ?auto_298596 ) ) ( not ( = ?auto_298591 ?auto_298597 ) ) ( not ( = ?auto_298591 ?auto_298598 ) ) ( not ( = ?auto_298591 ?auto_298599 ) ) ( not ( = ?auto_298591 ?auto_298600 ) ) ( not ( = ?auto_298592 ?auto_298593 ) ) ( not ( = ?auto_298592 ?auto_298594 ) ) ( not ( = ?auto_298592 ?auto_298595 ) ) ( not ( = ?auto_298592 ?auto_298596 ) ) ( not ( = ?auto_298592 ?auto_298597 ) ) ( not ( = ?auto_298592 ?auto_298598 ) ) ( not ( = ?auto_298592 ?auto_298599 ) ) ( not ( = ?auto_298592 ?auto_298600 ) ) ( not ( = ?auto_298593 ?auto_298594 ) ) ( not ( = ?auto_298593 ?auto_298595 ) ) ( not ( = ?auto_298593 ?auto_298596 ) ) ( not ( = ?auto_298593 ?auto_298597 ) ) ( not ( = ?auto_298593 ?auto_298598 ) ) ( not ( = ?auto_298593 ?auto_298599 ) ) ( not ( = ?auto_298593 ?auto_298600 ) ) ( not ( = ?auto_298594 ?auto_298595 ) ) ( not ( = ?auto_298594 ?auto_298596 ) ) ( not ( = ?auto_298594 ?auto_298597 ) ) ( not ( = ?auto_298594 ?auto_298598 ) ) ( not ( = ?auto_298594 ?auto_298599 ) ) ( not ( = ?auto_298594 ?auto_298600 ) ) ( not ( = ?auto_298595 ?auto_298596 ) ) ( not ( = ?auto_298595 ?auto_298597 ) ) ( not ( = ?auto_298595 ?auto_298598 ) ) ( not ( = ?auto_298595 ?auto_298599 ) ) ( not ( = ?auto_298595 ?auto_298600 ) ) ( not ( = ?auto_298596 ?auto_298597 ) ) ( not ( = ?auto_298596 ?auto_298598 ) ) ( not ( = ?auto_298596 ?auto_298599 ) ) ( not ( = ?auto_298596 ?auto_298600 ) ) ( not ( = ?auto_298597 ?auto_298598 ) ) ( not ( = ?auto_298597 ?auto_298599 ) ) ( not ( = ?auto_298597 ?auto_298600 ) ) ( not ( = ?auto_298598 ?auto_298599 ) ) ( not ( = ?auto_298598 ?auto_298600 ) ) ( not ( = ?auto_298599 ?auto_298600 ) ) ( CLEAR ?auto_298597 ) ( ON ?auto_298598 ?auto_298599 ) ( CLEAR ?auto_298598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_298588 ?auto_298589 ?auto_298590 ?auto_298591 ?auto_298592 ?auto_298593 ?auto_298594 ?auto_298595 ?auto_298596 ?auto_298597 ?auto_298598 )
      ( MAKE-12PILE ?auto_298588 ?auto_298589 ?auto_298590 ?auto_298591 ?auto_298592 ?auto_298593 ?auto_298594 ?auto_298595 ?auto_298596 ?auto_298597 ?auto_298598 ?auto_298599 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_298613 - BLOCK
      ?auto_298614 - BLOCK
      ?auto_298615 - BLOCK
      ?auto_298616 - BLOCK
      ?auto_298617 - BLOCK
      ?auto_298618 - BLOCK
      ?auto_298619 - BLOCK
      ?auto_298620 - BLOCK
      ?auto_298621 - BLOCK
      ?auto_298622 - BLOCK
      ?auto_298623 - BLOCK
      ?auto_298624 - BLOCK
    )
    :vars
    (
      ?auto_298625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298624 ?auto_298625 ) ( ON-TABLE ?auto_298613 ) ( ON ?auto_298614 ?auto_298613 ) ( ON ?auto_298615 ?auto_298614 ) ( ON ?auto_298616 ?auto_298615 ) ( ON ?auto_298617 ?auto_298616 ) ( ON ?auto_298618 ?auto_298617 ) ( ON ?auto_298619 ?auto_298618 ) ( ON ?auto_298620 ?auto_298619 ) ( ON ?auto_298621 ?auto_298620 ) ( not ( = ?auto_298613 ?auto_298614 ) ) ( not ( = ?auto_298613 ?auto_298615 ) ) ( not ( = ?auto_298613 ?auto_298616 ) ) ( not ( = ?auto_298613 ?auto_298617 ) ) ( not ( = ?auto_298613 ?auto_298618 ) ) ( not ( = ?auto_298613 ?auto_298619 ) ) ( not ( = ?auto_298613 ?auto_298620 ) ) ( not ( = ?auto_298613 ?auto_298621 ) ) ( not ( = ?auto_298613 ?auto_298622 ) ) ( not ( = ?auto_298613 ?auto_298623 ) ) ( not ( = ?auto_298613 ?auto_298624 ) ) ( not ( = ?auto_298613 ?auto_298625 ) ) ( not ( = ?auto_298614 ?auto_298615 ) ) ( not ( = ?auto_298614 ?auto_298616 ) ) ( not ( = ?auto_298614 ?auto_298617 ) ) ( not ( = ?auto_298614 ?auto_298618 ) ) ( not ( = ?auto_298614 ?auto_298619 ) ) ( not ( = ?auto_298614 ?auto_298620 ) ) ( not ( = ?auto_298614 ?auto_298621 ) ) ( not ( = ?auto_298614 ?auto_298622 ) ) ( not ( = ?auto_298614 ?auto_298623 ) ) ( not ( = ?auto_298614 ?auto_298624 ) ) ( not ( = ?auto_298614 ?auto_298625 ) ) ( not ( = ?auto_298615 ?auto_298616 ) ) ( not ( = ?auto_298615 ?auto_298617 ) ) ( not ( = ?auto_298615 ?auto_298618 ) ) ( not ( = ?auto_298615 ?auto_298619 ) ) ( not ( = ?auto_298615 ?auto_298620 ) ) ( not ( = ?auto_298615 ?auto_298621 ) ) ( not ( = ?auto_298615 ?auto_298622 ) ) ( not ( = ?auto_298615 ?auto_298623 ) ) ( not ( = ?auto_298615 ?auto_298624 ) ) ( not ( = ?auto_298615 ?auto_298625 ) ) ( not ( = ?auto_298616 ?auto_298617 ) ) ( not ( = ?auto_298616 ?auto_298618 ) ) ( not ( = ?auto_298616 ?auto_298619 ) ) ( not ( = ?auto_298616 ?auto_298620 ) ) ( not ( = ?auto_298616 ?auto_298621 ) ) ( not ( = ?auto_298616 ?auto_298622 ) ) ( not ( = ?auto_298616 ?auto_298623 ) ) ( not ( = ?auto_298616 ?auto_298624 ) ) ( not ( = ?auto_298616 ?auto_298625 ) ) ( not ( = ?auto_298617 ?auto_298618 ) ) ( not ( = ?auto_298617 ?auto_298619 ) ) ( not ( = ?auto_298617 ?auto_298620 ) ) ( not ( = ?auto_298617 ?auto_298621 ) ) ( not ( = ?auto_298617 ?auto_298622 ) ) ( not ( = ?auto_298617 ?auto_298623 ) ) ( not ( = ?auto_298617 ?auto_298624 ) ) ( not ( = ?auto_298617 ?auto_298625 ) ) ( not ( = ?auto_298618 ?auto_298619 ) ) ( not ( = ?auto_298618 ?auto_298620 ) ) ( not ( = ?auto_298618 ?auto_298621 ) ) ( not ( = ?auto_298618 ?auto_298622 ) ) ( not ( = ?auto_298618 ?auto_298623 ) ) ( not ( = ?auto_298618 ?auto_298624 ) ) ( not ( = ?auto_298618 ?auto_298625 ) ) ( not ( = ?auto_298619 ?auto_298620 ) ) ( not ( = ?auto_298619 ?auto_298621 ) ) ( not ( = ?auto_298619 ?auto_298622 ) ) ( not ( = ?auto_298619 ?auto_298623 ) ) ( not ( = ?auto_298619 ?auto_298624 ) ) ( not ( = ?auto_298619 ?auto_298625 ) ) ( not ( = ?auto_298620 ?auto_298621 ) ) ( not ( = ?auto_298620 ?auto_298622 ) ) ( not ( = ?auto_298620 ?auto_298623 ) ) ( not ( = ?auto_298620 ?auto_298624 ) ) ( not ( = ?auto_298620 ?auto_298625 ) ) ( not ( = ?auto_298621 ?auto_298622 ) ) ( not ( = ?auto_298621 ?auto_298623 ) ) ( not ( = ?auto_298621 ?auto_298624 ) ) ( not ( = ?auto_298621 ?auto_298625 ) ) ( not ( = ?auto_298622 ?auto_298623 ) ) ( not ( = ?auto_298622 ?auto_298624 ) ) ( not ( = ?auto_298622 ?auto_298625 ) ) ( not ( = ?auto_298623 ?auto_298624 ) ) ( not ( = ?auto_298623 ?auto_298625 ) ) ( not ( = ?auto_298624 ?auto_298625 ) ) ( ON ?auto_298623 ?auto_298624 ) ( CLEAR ?auto_298621 ) ( ON ?auto_298622 ?auto_298623 ) ( CLEAR ?auto_298622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_298613 ?auto_298614 ?auto_298615 ?auto_298616 ?auto_298617 ?auto_298618 ?auto_298619 ?auto_298620 ?auto_298621 ?auto_298622 )
      ( MAKE-12PILE ?auto_298613 ?auto_298614 ?auto_298615 ?auto_298616 ?auto_298617 ?auto_298618 ?auto_298619 ?auto_298620 ?auto_298621 ?auto_298622 ?auto_298623 ?auto_298624 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_298638 - BLOCK
      ?auto_298639 - BLOCK
      ?auto_298640 - BLOCK
      ?auto_298641 - BLOCK
      ?auto_298642 - BLOCK
      ?auto_298643 - BLOCK
      ?auto_298644 - BLOCK
      ?auto_298645 - BLOCK
      ?auto_298646 - BLOCK
      ?auto_298647 - BLOCK
      ?auto_298648 - BLOCK
      ?auto_298649 - BLOCK
    )
    :vars
    (
      ?auto_298650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298649 ?auto_298650 ) ( ON-TABLE ?auto_298638 ) ( ON ?auto_298639 ?auto_298638 ) ( ON ?auto_298640 ?auto_298639 ) ( ON ?auto_298641 ?auto_298640 ) ( ON ?auto_298642 ?auto_298641 ) ( ON ?auto_298643 ?auto_298642 ) ( ON ?auto_298644 ?auto_298643 ) ( ON ?auto_298645 ?auto_298644 ) ( ON ?auto_298646 ?auto_298645 ) ( not ( = ?auto_298638 ?auto_298639 ) ) ( not ( = ?auto_298638 ?auto_298640 ) ) ( not ( = ?auto_298638 ?auto_298641 ) ) ( not ( = ?auto_298638 ?auto_298642 ) ) ( not ( = ?auto_298638 ?auto_298643 ) ) ( not ( = ?auto_298638 ?auto_298644 ) ) ( not ( = ?auto_298638 ?auto_298645 ) ) ( not ( = ?auto_298638 ?auto_298646 ) ) ( not ( = ?auto_298638 ?auto_298647 ) ) ( not ( = ?auto_298638 ?auto_298648 ) ) ( not ( = ?auto_298638 ?auto_298649 ) ) ( not ( = ?auto_298638 ?auto_298650 ) ) ( not ( = ?auto_298639 ?auto_298640 ) ) ( not ( = ?auto_298639 ?auto_298641 ) ) ( not ( = ?auto_298639 ?auto_298642 ) ) ( not ( = ?auto_298639 ?auto_298643 ) ) ( not ( = ?auto_298639 ?auto_298644 ) ) ( not ( = ?auto_298639 ?auto_298645 ) ) ( not ( = ?auto_298639 ?auto_298646 ) ) ( not ( = ?auto_298639 ?auto_298647 ) ) ( not ( = ?auto_298639 ?auto_298648 ) ) ( not ( = ?auto_298639 ?auto_298649 ) ) ( not ( = ?auto_298639 ?auto_298650 ) ) ( not ( = ?auto_298640 ?auto_298641 ) ) ( not ( = ?auto_298640 ?auto_298642 ) ) ( not ( = ?auto_298640 ?auto_298643 ) ) ( not ( = ?auto_298640 ?auto_298644 ) ) ( not ( = ?auto_298640 ?auto_298645 ) ) ( not ( = ?auto_298640 ?auto_298646 ) ) ( not ( = ?auto_298640 ?auto_298647 ) ) ( not ( = ?auto_298640 ?auto_298648 ) ) ( not ( = ?auto_298640 ?auto_298649 ) ) ( not ( = ?auto_298640 ?auto_298650 ) ) ( not ( = ?auto_298641 ?auto_298642 ) ) ( not ( = ?auto_298641 ?auto_298643 ) ) ( not ( = ?auto_298641 ?auto_298644 ) ) ( not ( = ?auto_298641 ?auto_298645 ) ) ( not ( = ?auto_298641 ?auto_298646 ) ) ( not ( = ?auto_298641 ?auto_298647 ) ) ( not ( = ?auto_298641 ?auto_298648 ) ) ( not ( = ?auto_298641 ?auto_298649 ) ) ( not ( = ?auto_298641 ?auto_298650 ) ) ( not ( = ?auto_298642 ?auto_298643 ) ) ( not ( = ?auto_298642 ?auto_298644 ) ) ( not ( = ?auto_298642 ?auto_298645 ) ) ( not ( = ?auto_298642 ?auto_298646 ) ) ( not ( = ?auto_298642 ?auto_298647 ) ) ( not ( = ?auto_298642 ?auto_298648 ) ) ( not ( = ?auto_298642 ?auto_298649 ) ) ( not ( = ?auto_298642 ?auto_298650 ) ) ( not ( = ?auto_298643 ?auto_298644 ) ) ( not ( = ?auto_298643 ?auto_298645 ) ) ( not ( = ?auto_298643 ?auto_298646 ) ) ( not ( = ?auto_298643 ?auto_298647 ) ) ( not ( = ?auto_298643 ?auto_298648 ) ) ( not ( = ?auto_298643 ?auto_298649 ) ) ( not ( = ?auto_298643 ?auto_298650 ) ) ( not ( = ?auto_298644 ?auto_298645 ) ) ( not ( = ?auto_298644 ?auto_298646 ) ) ( not ( = ?auto_298644 ?auto_298647 ) ) ( not ( = ?auto_298644 ?auto_298648 ) ) ( not ( = ?auto_298644 ?auto_298649 ) ) ( not ( = ?auto_298644 ?auto_298650 ) ) ( not ( = ?auto_298645 ?auto_298646 ) ) ( not ( = ?auto_298645 ?auto_298647 ) ) ( not ( = ?auto_298645 ?auto_298648 ) ) ( not ( = ?auto_298645 ?auto_298649 ) ) ( not ( = ?auto_298645 ?auto_298650 ) ) ( not ( = ?auto_298646 ?auto_298647 ) ) ( not ( = ?auto_298646 ?auto_298648 ) ) ( not ( = ?auto_298646 ?auto_298649 ) ) ( not ( = ?auto_298646 ?auto_298650 ) ) ( not ( = ?auto_298647 ?auto_298648 ) ) ( not ( = ?auto_298647 ?auto_298649 ) ) ( not ( = ?auto_298647 ?auto_298650 ) ) ( not ( = ?auto_298648 ?auto_298649 ) ) ( not ( = ?auto_298648 ?auto_298650 ) ) ( not ( = ?auto_298649 ?auto_298650 ) ) ( ON ?auto_298648 ?auto_298649 ) ( CLEAR ?auto_298646 ) ( ON ?auto_298647 ?auto_298648 ) ( CLEAR ?auto_298647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_298638 ?auto_298639 ?auto_298640 ?auto_298641 ?auto_298642 ?auto_298643 ?auto_298644 ?auto_298645 ?auto_298646 ?auto_298647 )
      ( MAKE-12PILE ?auto_298638 ?auto_298639 ?auto_298640 ?auto_298641 ?auto_298642 ?auto_298643 ?auto_298644 ?auto_298645 ?auto_298646 ?auto_298647 ?auto_298648 ?auto_298649 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_298663 - BLOCK
      ?auto_298664 - BLOCK
      ?auto_298665 - BLOCK
      ?auto_298666 - BLOCK
      ?auto_298667 - BLOCK
      ?auto_298668 - BLOCK
      ?auto_298669 - BLOCK
      ?auto_298670 - BLOCK
      ?auto_298671 - BLOCK
      ?auto_298672 - BLOCK
      ?auto_298673 - BLOCK
      ?auto_298674 - BLOCK
    )
    :vars
    (
      ?auto_298675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298674 ?auto_298675 ) ( ON-TABLE ?auto_298663 ) ( ON ?auto_298664 ?auto_298663 ) ( ON ?auto_298665 ?auto_298664 ) ( ON ?auto_298666 ?auto_298665 ) ( ON ?auto_298667 ?auto_298666 ) ( ON ?auto_298668 ?auto_298667 ) ( ON ?auto_298669 ?auto_298668 ) ( ON ?auto_298670 ?auto_298669 ) ( not ( = ?auto_298663 ?auto_298664 ) ) ( not ( = ?auto_298663 ?auto_298665 ) ) ( not ( = ?auto_298663 ?auto_298666 ) ) ( not ( = ?auto_298663 ?auto_298667 ) ) ( not ( = ?auto_298663 ?auto_298668 ) ) ( not ( = ?auto_298663 ?auto_298669 ) ) ( not ( = ?auto_298663 ?auto_298670 ) ) ( not ( = ?auto_298663 ?auto_298671 ) ) ( not ( = ?auto_298663 ?auto_298672 ) ) ( not ( = ?auto_298663 ?auto_298673 ) ) ( not ( = ?auto_298663 ?auto_298674 ) ) ( not ( = ?auto_298663 ?auto_298675 ) ) ( not ( = ?auto_298664 ?auto_298665 ) ) ( not ( = ?auto_298664 ?auto_298666 ) ) ( not ( = ?auto_298664 ?auto_298667 ) ) ( not ( = ?auto_298664 ?auto_298668 ) ) ( not ( = ?auto_298664 ?auto_298669 ) ) ( not ( = ?auto_298664 ?auto_298670 ) ) ( not ( = ?auto_298664 ?auto_298671 ) ) ( not ( = ?auto_298664 ?auto_298672 ) ) ( not ( = ?auto_298664 ?auto_298673 ) ) ( not ( = ?auto_298664 ?auto_298674 ) ) ( not ( = ?auto_298664 ?auto_298675 ) ) ( not ( = ?auto_298665 ?auto_298666 ) ) ( not ( = ?auto_298665 ?auto_298667 ) ) ( not ( = ?auto_298665 ?auto_298668 ) ) ( not ( = ?auto_298665 ?auto_298669 ) ) ( not ( = ?auto_298665 ?auto_298670 ) ) ( not ( = ?auto_298665 ?auto_298671 ) ) ( not ( = ?auto_298665 ?auto_298672 ) ) ( not ( = ?auto_298665 ?auto_298673 ) ) ( not ( = ?auto_298665 ?auto_298674 ) ) ( not ( = ?auto_298665 ?auto_298675 ) ) ( not ( = ?auto_298666 ?auto_298667 ) ) ( not ( = ?auto_298666 ?auto_298668 ) ) ( not ( = ?auto_298666 ?auto_298669 ) ) ( not ( = ?auto_298666 ?auto_298670 ) ) ( not ( = ?auto_298666 ?auto_298671 ) ) ( not ( = ?auto_298666 ?auto_298672 ) ) ( not ( = ?auto_298666 ?auto_298673 ) ) ( not ( = ?auto_298666 ?auto_298674 ) ) ( not ( = ?auto_298666 ?auto_298675 ) ) ( not ( = ?auto_298667 ?auto_298668 ) ) ( not ( = ?auto_298667 ?auto_298669 ) ) ( not ( = ?auto_298667 ?auto_298670 ) ) ( not ( = ?auto_298667 ?auto_298671 ) ) ( not ( = ?auto_298667 ?auto_298672 ) ) ( not ( = ?auto_298667 ?auto_298673 ) ) ( not ( = ?auto_298667 ?auto_298674 ) ) ( not ( = ?auto_298667 ?auto_298675 ) ) ( not ( = ?auto_298668 ?auto_298669 ) ) ( not ( = ?auto_298668 ?auto_298670 ) ) ( not ( = ?auto_298668 ?auto_298671 ) ) ( not ( = ?auto_298668 ?auto_298672 ) ) ( not ( = ?auto_298668 ?auto_298673 ) ) ( not ( = ?auto_298668 ?auto_298674 ) ) ( not ( = ?auto_298668 ?auto_298675 ) ) ( not ( = ?auto_298669 ?auto_298670 ) ) ( not ( = ?auto_298669 ?auto_298671 ) ) ( not ( = ?auto_298669 ?auto_298672 ) ) ( not ( = ?auto_298669 ?auto_298673 ) ) ( not ( = ?auto_298669 ?auto_298674 ) ) ( not ( = ?auto_298669 ?auto_298675 ) ) ( not ( = ?auto_298670 ?auto_298671 ) ) ( not ( = ?auto_298670 ?auto_298672 ) ) ( not ( = ?auto_298670 ?auto_298673 ) ) ( not ( = ?auto_298670 ?auto_298674 ) ) ( not ( = ?auto_298670 ?auto_298675 ) ) ( not ( = ?auto_298671 ?auto_298672 ) ) ( not ( = ?auto_298671 ?auto_298673 ) ) ( not ( = ?auto_298671 ?auto_298674 ) ) ( not ( = ?auto_298671 ?auto_298675 ) ) ( not ( = ?auto_298672 ?auto_298673 ) ) ( not ( = ?auto_298672 ?auto_298674 ) ) ( not ( = ?auto_298672 ?auto_298675 ) ) ( not ( = ?auto_298673 ?auto_298674 ) ) ( not ( = ?auto_298673 ?auto_298675 ) ) ( not ( = ?auto_298674 ?auto_298675 ) ) ( ON ?auto_298673 ?auto_298674 ) ( ON ?auto_298672 ?auto_298673 ) ( CLEAR ?auto_298670 ) ( ON ?auto_298671 ?auto_298672 ) ( CLEAR ?auto_298671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_298663 ?auto_298664 ?auto_298665 ?auto_298666 ?auto_298667 ?auto_298668 ?auto_298669 ?auto_298670 ?auto_298671 )
      ( MAKE-12PILE ?auto_298663 ?auto_298664 ?auto_298665 ?auto_298666 ?auto_298667 ?auto_298668 ?auto_298669 ?auto_298670 ?auto_298671 ?auto_298672 ?auto_298673 ?auto_298674 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_298688 - BLOCK
      ?auto_298689 - BLOCK
      ?auto_298690 - BLOCK
      ?auto_298691 - BLOCK
      ?auto_298692 - BLOCK
      ?auto_298693 - BLOCK
      ?auto_298694 - BLOCK
      ?auto_298695 - BLOCK
      ?auto_298696 - BLOCK
      ?auto_298697 - BLOCK
      ?auto_298698 - BLOCK
      ?auto_298699 - BLOCK
    )
    :vars
    (
      ?auto_298700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298699 ?auto_298700 ) ( ON-TABLE ?auto_298688 ) ( ON ?auto_298689 ?auto_298688 ) ( ON ?auto_298690 ?auto_298689 ) ( ON ?auto_298691 ?auto_298690 ) ( ON ?auto_298692 ?auto_298691 ) ( ON ?auto_298693 ?auto_298692 ) ( ON ?auto_298694 ?auto_298693 ) ( ON ?auto_298695 ?auto_298694 ) ( not ( = ?auto_298688 ?auto_298689 ) ) ( not ( = ?auto_298688 ?auto_298690 ) ) ( not ( = ?auto_298688 ?auto_298691 ) ) ( not ( = ?auto_298688 ?auto_298692 ) ) ( not ( = ?auto_298688 ?auto_298693 ) ) ( not ( = ?auto_298688 ?auto_298694 ) ) ( not ( = ?auto_298688 ?auto_298695 ) ) ( not ( = ?auto_298688 ?auto_298696 ) ) ( not ( = ?auto_298688 ?auto_298697 ) ) ( not ( = ?auto_298688 ?auto_298698 ) ) ( not ( = ?auto_298688 ?auto_298699 ) ) ( not ( = ?auto_298688 ?auto_298700 ) ) ( not ( = ?auto_298689 ?auto_298690 ) ) ( not ( = ?auto_298689 ?auto_298691 ) ) ( not ( = ?auto_298689 ?auto_298692 ) ) ( not ( = ?auto_298689 ?auto_298693 ) ) ( not ( = ?auto_298689 ?auto_298694 ) ) ( not ( = ?auto_298689 ?auto_298695 ) ) ( not ( = ?auto_298689 ?auto_298696 ) ) ( not ( = ?auto_298689 ?auto_298697 ) ) ( not ( = ?auto_298689 ?auto_298698 ) ) ( not ( = ?auto_298689 ?auto_298699 ) ) ( not ( = ?auto_298689 ?auto_298700 ) ) ( not ( = ?auto_298690 ?auto_298691 ) ) ( not ( = ?auto_298690 ?auto_298692 ) ) ( not ( = ?auto_298690 ?auto_298693 ) ) ( not ( = ?auto_298690 ?auto_298694 ) ) ( not ( = ?auto_298690 ?auto_298695 ) ) ( not ( = ?auto_298690 ?auto_298696 ) ) ( not ( = ?auto_298690 ?auto_298697 ) ) ( not ( = ?auto_298690 ?auto_298698 ) ) ( not ( = ?auto_298690 ?auto_298699 ) ) ( not ( = ?auto_298690 ?auto_298700 ) ) ( not ( = ?auto_298691 ?auto_298692 ) ) ( not ( = ?auto_298691 ?auto_298693 ) ) ( not ( = ?auto_298691 ?auto_298694 ) ) ( not ( = ?auto_298691 ?auto_298695 ) ) ( not ( = ?auto_298691 ?auto_298696 ) ) ( not ( = ?auto_298691 ?auto_298697 ) ) ( not ( = ?auto_298691 ?auto_298698 ) ) ( not ( = ?auto_298691 ?auto_298699 ) ) ( not ( = ?auto_298691 ?auto_298700 ) ) ( not ( = ?auto_298692 ?auto_298693 ) ) ( not ( = ?auto_298692 ?auto_298694 ) ) ( not ( = ?auto_298692 ?auto_298695 ) ) ( not ( = ?auto_298692 ?auto_298696 ) ) ( not ( = ?auto_298692 ?auto_298697 ) ) ( not ( = ?auto_298692 ?auto_298698 ) ) ( not ( = ?auto_298692 ?auto_298699 ) ) ( not ( = ?auto_298692 ?auto_298700 ) ) ( not ( = ?auto_298693 ?auto_298694 ) ) ( not ( = ?auto_298693 ?auto_298695 ) ) ( not ( = ?auto_298693 ?auto_298696 ) ) ( not ( = ?auto_298693 ?auto_298697 ) ) ( not ( = ?auto_298693 ?auto_298698 ) ) ( not ( = ?auto_298693 ?auto_298699 ) ) ( not ( = ?auto_298693 ?auto_298700 ) ) ( not ( = ?auto_298694 ?auto_298695 ) ) ( not ( = ?auto_298694 ?auto_298696 ) ) ( not ( = ?auto_298694 ?auto_298697 ) ) ( not ( = ?auto_298694 ?auto_298698 ) ) ( not ( = ?auto_298694 ?auto_298699 ) ) ( not ( = ?auto_298694 ?auto_298700 ) ) ( not ( = ?auto_298695 ?auto_298696 ) ) ( not ( = ?auto_298695 ?auto_298697 ) ) ( not ( = ?auto_298695 ?auto_298698 ) ) ( not ( = ?auto_298695 ?auto_298699 ) ) ( not ( = ?auto_298695 ?auto_298700 ) ) ( not ( = ?auto_298696 ?auto_298697 ) ) ( not ( = ?auto_298696 ?auto_298698 ) ) ( not ( = ?auto_298696 ?auto_298699 ) ) ( not ( = ?auto_298696 ?auto_298700 ) ) ( not ( = ?auto_298697 ?auto_298698 ) ) ( not ( = ?auto_298697 ?auto_298699 ) ) ( not ( = ?auto_298697 ?auto_298700 ) ) ( not ( = ?auto_298698 ?auto_298699 ) ) ( not ( = ?auto_298698 ?auto_298700 ) ) ( not ( = ?auto_298699 ?auto_298700 ) ) ( ON ?auto_298698 ?auto_298699 ) ( ON ?auto_298697 ?auto_298698 ) ( CLEAR ?auto_298695 ) ( ON ?auto_298696 ?auto_298697 ) ( CLEAR ?auto_298696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_298688 ?auto_298689 ?auto_298690 ?auto_298691 ?auto_298692 ?auto_298693 ?auto_298694 ?auto_298695 ?auto_298696 )
      ( MAKE-12PILE ?auto_298688 ?auto_298689 ?auto_298690 ?auto_298691 ?auto_298692 ?auto_298693 ?auto_298694 ?auto_298695 ?auto_298696 ?auto_298697 ?auto_298698 ?auto_298699 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_298713 - BLOCK
      ?auto_298714 - BLOCK
      ?auto_298715 - BLOCK
      ?auto_298716 - BLOCK
      ?auto_298717 - BLOCK
      ?auto_298718 - BLOCK
      ?auto_298719 - BLOCK
      ?auto_298720 - BLOCK
      ?auto_298721 - BLOCK
      ?auto_298722 - BLOCK
      ?auto_298723 - BLOCK
      ?auto_298724 - BLOCK
    )
    :vars
    (
      ?auto_298725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298724 ?auto_298725 ) ( ON-TABLE ?auto_298713 ) ( ON ?auto_298714 ?auto_298713 ) ( ON ?auto_298715 ?auto_298714 ) ( ON ?auto_298716 ?auto_298715 ) ( ON ?auto_298717 ?auto_298716 ) ( ON ?auto_298718 ?auto_298717 ) ( ON ?auto_298719 ?auto_298718 ) ( not ( = ?auto_298713 ?auto_298714 ) ) ( not ( = ?auto_298713 ?auto_298715 ) ) ( not ( = ?auto_298713 ?auto_298716 ) ) ( not ( = ?auto_298713 ?auto_298717 ) ) ( not ( = ?auto_298713 ?auto_298718 ) ) ( not ( = ?auto_298713 ?auto_298719 ) ) ( not ( = ?auto_298713 ?auto_298720 ) ) ( not ( = ?auto_298713 ?auto_298721 ) ) ( not ( = ?auto_298713 ?auto_298722 ) ) ( not ( = ?auto_298713 ?auto_298723 ) ) ( not ( = ?auto_298713 ?auto_298724 ) ) ( not ( = ?auto_298713 ?auto_298725 ) ) ( not ( = ?auto_298714 ?auto_298715 ) ) ( not ( = ?auto_298714 ?auto_298716 ) ) ( not ( = ?auto_298714 ?auto_298717 ) ) ( not ( = ?auto_298714 ?auto_298718 ) ) ( not ( = ?auto_298714 ?auto_298719 ) ) ( not ( = ?auto_298714 ?auto_298720 ) ) ( not ( = ?auto_298714 ?auto_298721 ) ) ( not ( = ?auto_298714 ?auto_298722 ) ) ( not ( = ?auto_298714 ?auto_298723 ) ) ( not ( = ?auto_298714 ?auto_298724 ) ) ( not ( = ?auto_298714 ?auto_298725 ) ) ( not ( = ?auto_298715 ?auto_298716 ) ) ( not ( = ?auto_298715 ?auto_298717 ) ) ( not ( = ?auto_298715 ?auto_298718 ) ) ( not ( = ?auto_298715 ?auto_298719 ) ) ( not ( = ?auto_298715 ?auto_298720 ) ) ( not ( = ?auto_298715 ?auto_298721 ) ) ( not ( = ?auto_298715 ?auto_298722 ) ) ( not ( = ?auto_298715 ?auto_298723 ) ) ( not ( = ?auto_298715 ?auto_298724 ) ) ( not ( = ?auto_298715 ?auto_298725 ) ) ( not ( = ?auto_298716 ?auto_298717 ) ) ( not ( = ?auto_298716 ?auto_298718 ) ) ( not ( = ?auto_298716 ?auto_298719 ) ) ( not ( = ?auto_298716 ?auto_298720 ) ) ( not ( = ?auto_298716 ?auto_298721 ) ) ( not ( = ?auto_298716 ?auto_298722 ) ) ( not ( = ?auto_298716 ?auto_298723 ) ) ( not ( = ?auto_298716 ?auto_298724 ) ) ( not ( = ?auto_298716 ?auto_298725 ) ) ( not ( = ?auto_298717 ?auto_298718 ) ) ( not ( = ?auto_298717 ?auto_298719 ) ) ( not ( = ?auto_298717 ?auto_298720 ) ) ( not ( = ?auto_298717 ?auto_298721 ) ) ( not ( = ?auto_298717 ?auto_298722 ) ) ( not ( = ?auto_298717 ?auto_298723 ) ) ( not ( = ?auto_298717 ?auto_298724 ) ) ( not ( = ?auto_298717 ?auto_298725 ) ) ( not ( = ?auto_298718 ?auto_298719 ) ) ( not ( = ?auto_298718 ?auto_298720 ) ) ( not ( = ?auto_298718 ?auto_298721 ) ) ( not ( = ?auto_298718 ?auto_298722 ) ) ( not ( = ?auto_298718 ?auto_298723 ) ) ( not ( = ?auto_298718 ?auto_298724 ) ) ( not ( = ?auto_298718 ?auto_298725 ) ) ( not ( = ?auto_298719 ?auto_298720 ) ) ( not ( = ?auto_298719 ?auto_298721 ) ) ( not ( = ?auto_298719 ?auto_298722 ) ) ( not ( = ?auto_298719 ?auto_298723 ) ) ( not ( = ?auto_298719 ?auto_298724 ) ) ( not ( = ?auto_298719 ?auto_298725 ) ) ( not ( = ?auto_298720 ?auto_298721 ) ) ( not ( = ?auto_298720 ?auto_298722 ) ) ( not ( = ?auto_298720 ?auto_298723 ) ) ( not ( = ?auto_298720 ?auto_298724 ) ) ( not ( = ?auto_298720 ?auto_298725 ) ) ( not ( = ?auto_298721 ?auto_298722 ) ) ( not ( = ?auto_298721 ?auto_298723 ) ) ( not ( = ?auto_298721 ?auto_298724 ) ) ( not ( = ?auto_298721 ?auto_298725 ) ) ( not ( = ?auto_298722 ?auto_298723 ) ) ( not ( = ?auto_298722 ?auto_298724 ) ) ( not ( = ?auto_298722 ?auto_298725 ) ) ( not ( = ?auto_298723 ?auto_298724 ) ) ( not ( = ?auto_298723 ?auto_298725 ) ) ( not ( = ?auto_298724 ?auto_298725 ) ) ( ON ?auto_298723 ?auto_298724 ) ( ON ?auto_298722 ?auto_298723 ) ( ON ?auto_298721 ?auto_298722 ) ( CLEAR ?auto_298719 ) ( ON ?auto_298720 ?auto_298721 ) ( CLEAR ?auto_298720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_298713 ?auto_298714 ?auto_298715 ?auto_298716 ?auto_298717 ?auto_298718 ?auto_298719 ?auto_298720 )
      ( MAKE-12PILE ?auto_298713 ?auto_298714 ?auto_298715 ?auto_298716 ?auto_298717 ?auto_298718 ?auto_298719 ?auto_298720 ?auto_298721 ?auto_298722 ?auto_298723 ?auto_298724 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_298738 - BLOCK
      ?auto_298739 - BLOCK
      ?auto_298740 - BLOCK
      ?auto_298741 - BLOCK
      ?auto_298742 - BLOCK
      ?auto_298743 - BLOCK
      ?auto_298744 - BLOCK
      ?auto_298745 - BLOCK
      ?auto_298746 - BLOCK
      ?auto_298747 - BLOCK
      ?auto_298748 - BLOCK
      ?auto_298749 - BLOCK
    )
    :vars
    (
      ?auto_298750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298749 ?auto_298750 ) ( ON-TABLE ?auto_298738 ) ( ON ?auto_298739 ?auto_298738 ) ( ON ?auto_298740 ?auto_298739 ) ( ON ?auto_298741 ?auto_298740 ) ( ON ?auto_298742 ?auto_298741 ) ( ON ?auto_298743 ?auto_298742 ) ( ON ?auto_298744 ?auto_298743 ) ( not ( = ?auto_298738 ?auto_298739 ) ) ( not ( = ?auto_298738 ?auto_298740 ) ) ( not ( = ?auto_298738 ?auto_298741 ) ) ( not ( = ?auto_298738 ?auto_298742 ) ) ( not ( = ?auto_298738 ?auto_298743 ) ) ( not ( = ?auto_298738 ?auto_298744 ) ) ( not ( = ?auto_298738 ?auto_298745 ) ) ( not ( = ?auto_298738 ?auto_298746 ) ) ( not ( = ?auto_298738 ?auto_298747 ) ) ( not ( = ?auto_298738 ?auto_298748 ) ) ( not ( = ?auto_298738 ?auto_298749 ) ) ( not ( = ?auto_298738 ?auto_298750 ) ) ( not ( = ?auto_298739 ?auto_298740 ) ) ( not ( = ?auto_298739 ?auto_298741 ) ) ( not ( = ?auto_298739 ?auto_298742 ) ) ( not ( = ?auto_298739 ?auto_298743 ) ) ( not ( = ?auto_298739 ?auto_298744 ) ) ( not ( = ?auto_298739 ?auto_298745 ) ) ( not ( = ?auto_298739 ?auto_298746 ) ) ( not ( = ?auto_298739 ?auto_298747 ) ) ( not ( = ?auto_298739 ?auto_298748 ) ) ( not ( = ?auto_298739 ?auto_298749 ) ) ( not ( = ?auto_298739 ?auto_298750 ) ) ( not ( = ?auto_298740 ?auto_298741 ) ) ( not ( = ?auto_298740 ?auto_298742 ) ) ( not ( = ?auto_298740 ?auto_298743 ) ) ( not ( = ?auto_298740 ?auto_298744 ) ) ( not ( = ?auto_298740 ?auto_298745 ) ) ( not ( = ?auto_298740 ?auto_298746 ) ) ( not ( = ?auto_298740 ?auto_298747 ) ) ( not ( = ?auto_298740 ?auto_298748 ) ) ( not ( = ?auto_298740 ?auto_298749 ) ) ( not ( = ?auto_298740 ?auto_298750 ) ) ( not ( = ?auto_298741 ?auto_298742 ) ) ( not ( = ?auto_298741 ?auto_298743 ) ) ( not ( = ?auto_298741 ?auto_298744 ) ) ( not ( = ?auto_298741 ?auto_298745 ) ) ( not ( = ?auto_298741 ?auto_298746 ) ) ( not ( = ?auto_298741 ?auto_298747 ) ) ( not ( = ?auto_298741 ?auto_298748 ) ) ( not ( = ?auto_298741 ?auto_298749 ) ) ( not ( = ?auto_298741 ?auto_298750 ) ) ( not ( = ?auto_298742 ?auto_298743 ) ) ( not ( = ?auto_298742 ?auto_298744 ) ) ( not ( = ?auto_298742 ?auto_298745 ) ) ( not ( = ?auto_298742 ?auto_298746 ) ) ( not ( = ?auto_298742 ?auto_298747 ) ) ( not ( = ?auto_298742 ?auto_298748 ) ) ( not ( = ?auto_298742 ?auto_298749 ) ) ( not ( = ?auto_298742 ?auto_298750 ) ) ( not ( = ?auto_298743 ?auto_298744 ) ) ( not ( = ?auto_298743 ?auto_298745 ) ) ( not ( = ?auto_298743 ?auto_298746 ) ) ( not ( = ?auto_298743 ?auto_298747 ) ) ( not ( = ?auto_298743 ?auto_298748 ) ) ( not ( = ?auto_298743 ?auto_298749 ) ) ( not ( = ?auto_298743 ?auto_298750 ) ) ( not ( = ?auto_298744 ?auto_298745 ) ) ( not ( = ?auto_298744 ?auto_298746 ) ) ( not ( = ?auto_298744 ?auto_298747 ) ) ( not ( = ?auto_298744 ?auto_298748 ) ) ( not ( = ?auto_298744 ?auto_298749 ) ) ( not ( = ?auto_298744 ?auto_298750 ) ) ( not ( = ?auto_298745 ?auto_298746 ) ) ( not ( = ?auto_298745 ?auto_298747 ) ) ( not ( = ?auto_298745 ?auto_298748 ) ) ( not ( = ?auto_298745 ?auto_298749 ) ) ( not ( = ?auto_298745 ?auto_298750 ) ) ( not ( = ?auto_298746 ?auto_298747 ) ) ( not ( = ?auto_298746 ?auto_298748 ) ) ( not ( = ?auto_298746 ?auto_298749 ) ) ( not ( = ?auto_298746 ?auto_298750 ) ) ( not ( = ?auto_298747 ?auto_298748 ) ) ( not ( = ?auto_298747 ?auto_298749 ) ) ( not ( = ?auto_298747 ?auto_298750 ) ) ( not ( = ?auto_298748 ?auto_298749 ) ) ( not ( = ?auto_298748 ?auto_298750 ) ) ( not ( = ?auto_298749 ?auto_298750 ) ) ( ON ?auto_298748 ?auto_298749 ) ( ON ?auto_298747 ?auto_298748 ) ( ON ?auto_298746 ?auto_298747 ) ( CLEAR ?auto_298744 ) ( ON ?auto_298745 ?auto_298746 ) ( CLEAR ?auto_298745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_298738 ?auto_298739 ?auto_298740 ?auto_298741 ?auto_298742 ?auto_298743 ?auto_298744 ?auto_298745 )
      ( MAKE-12PILE ?auto_298738 ?auto_298739 ?auto_298740 ?auto_298741 ?auto_298742 ?auto_298743 ?auto_298744 ?auto_298745 ?auto_298746 ?auto_298747 ?auto_298748 ?auto_298749 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_298763 - BLOCK
      ?auto_298764 - BLOCK
      ?auto_298765 - BLOCK
      ?auto_298766 - BLOCK
      ?auto_298767 - BLOCK
      ?auto_298768 - BLOCK
      ?auto_298769 - BLOCK
      ?auto_298770 - BLOCK
      ?auto_298771 - BLOCK
      ?auto_298772 - BLOCK
      ?auto_298773 - BLOCK
      ?auto_298774 - BLOCK
    )
    :vars
    (
      ?auto_298775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298774 ?auto_298775 ) ( ON-TABLE ?auto_298763 ) ( ON ?auto_298764 ?auto_298763 ) ( ON ?auto_298765 ?auto_298764 ) ( ON ?auto_298766 ?auto_298765 ) ( ON ?auto_298767 ?auto_298766 ) ( ON ?auto_298768 ?auto_298767 ) ( not ( = ?auto_298763 ?auto_298764 ) ) ( not ( = ?auto_298763 ?auto_298765 ) ) ( not ( = ?auto_298763 ?auto_298766 ) ) ( not ( = ?auto_298763 ?auto_298767 ) ) ( not ( = ?auto_298763 ?auto_298768 ) ) ( not ( = ?auto_298763 ?auto_298769 ) ) ( not ( = ?auto_298763 ?auto_298770 ) ) ( not ( = ?auto_298763 ?auto_298771 ) ) ( not ( = ?auto_298763 ?auto_298772 ) ) ( not ( = ?auto_298763 ?auto_298773 ) ) ( not ( = ?auto_298763 ?auto_298774 ) ) ( not ( = ?auto_298763 ?auto_298775 ) ) ( not ( = ?auto_298764 ?auto_298765 ) ) ( not ( = ?auto_298764 ?auto_298766 ) ) ( not ( = ?auto_298764 ?auto_298767 ) ) ( not ( = ?auto_298764 ?auto_298768 ) ) ( not ( = ?auto_298764 ?auto_298769 ) ) ( not ( = ?auto_298764 ?auto_298770 ) ) ( not ( = ?auto_298764 ?auto_298771 ) ) ( not ( = ?auto_298764 ?auto_298772 ) ) ( not ( = ?auto_298764 ?auto_298773 ) ) ( not ( = ?auto_298764 ?auto_298774 ) ) ( not ( = ?auto_298764 ?auto_298775 ) ) ( not ( = ?auto_298765 ?auto_298766 ) ) ( not ( = ?auto_298765 ?auto_298767 ) ) ( not ( = ?auto_298765 ?auto_298768 ) ) ( not ( = ?auto_298765 ?auto_298769 ) ) ( not ( = ?auto_298765 ?auto_298770 ) ) ( not ( = ?auto_298765 ?auto_298771 ) ) ( not ( = ?auto_298765 ?auto_298772 ) ) ( not ( = ?auto_298765 ?auto_298773 ) ) ( not ( = ?auto_298765 ?auto_298774 ) ) ( not ( = ?auto_298765 ?auto_298775 ) ) ( not ( = ?auto_298766 ?auto_298767 ) ) ( not ( = ?auto_298766 ?auto_298768 ) ) ( not ( = ?auto_298766 ?auto_298769 ) ) ( not ( = ?auto_298766 ?auto_298770 ) ) ( not ( = ?auto_298766 ?auto_298771 ) ) ( not ( = ?auto_298766 ?auto_298772 ) ) ( not ( = ?auto_298766 ?auto_298773 ) ) ( not ( = ?auto_298766 ?auto_298774 ) ) ( not ( = ?auto_298766 ?auto_298775 ) ) ( not ( = ?auto_298767 ?auto_298768 ) ) ( not ( = ?auto_298767 ?auto_298769 ) ) ( not ( = ?auto_298767 ?auto_298770 ) ) ( not ( = ?auto_298767 ?auto_298771 ) ) ( not ( = ?auto_298767 ?auto_298772 ) ) ( not ( = ?auto_298767 ?auto_298773 ) ) ( not ( = ?auto_298767 ?auto_298774 ) ) ( not ( = ?auto_298767 ?auto_298775 ) ) ( not ( = ?auto_298768 ?auto_298769 ) ) ( not ( = ?auto_298768 ?auto_298770 ) ) ( not ( = ?auto_298768 ?auto_298771 ) ) ( not ( = ?auto_298768 ?auto_298772 ) ) ( not ( = ?auto_298768 ?auto_298773 ) ) ( not ( = ?auto_298768 ?auto_298774 ) ) ( not ( = ?auto_298768 ?auto_298775 ) ) ( not ( = ?auto_298769 ?auto_298770 ) ) ( not ( = ?auto_298769 ?auto_298771 ) ) ( not ( = ?auto_298769 ?auto_298772 ) ) ( not ( = ?auto_298769 ?auto_298773 ) ) ( not ( = ?auto_298769 ?auto_298774 ) ) ( not ( = ?auto_298769 ?auto_298775 ) ) ( not ( = ?auto_298770 ?auto_298771 ) ) ( not ( = ?auto_298770 ?auto_298772 ) ) ( not ( = ?auto_298770 ?auto_298773 ) ) ( not ( = ?auto_298770 ?auto_298774 ) ) ( not ( = ?auto_298770 ?auto_298775 ) ) ( not ( = ?auto_298771 ?auto_298772 ) ) ( not ( = ?auto_298771 ?auto_298773 ) ) ( not ( = ?auto_298771 ?auto_298774 ) ) ( not ( = ?auto_298771 ?auto_298775 ) ) ( not ( = ?auto_298772 ?auto_298773 ) ) ( not ( = ?auto_298772 ?auto_298774 ) ) ( not ( = ?auto_298772 ?auto_298775 ) ) ( not ( = ?auto_298773 ?auto_298774 ) ) ( not ( = ?auto_298773 ?auto_298775 ) ) ( not ( = ?auto_298774 ?auto_298775 ) ) ( ON ?auto_298773 ?auto_298774 ) ( ON ?auto_298772 ?auto_298773 ) ( ON ?auto_298771 ?auto_298772 ) ( ON ?auto_298770 ?auto_298771 ) ( CLEAR ?auto_298768 ) ( ON ?auto_298769 ?auto_298770 ) ( CLEAR ?auto_298769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_298763 ?auto_298764 ?auto_298765 ?auto_298766 ?auto_298767 ?auto_298768 ?auto_298769 )
      ( MAKE-12PILE ?auto_298763 ?auto_298764 ?auto_298765 ?auto_298766 ?auto_298767 ?auto_298768 ?auto_298769 ?auto_298770 ?auto_298771 ?auto_298772 ?auto_298773 ?auto_298774 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_298788 - BLOCK
      ?auto_298789 - BLOCK
      ?auto_298790 - BLOCK
      ?auto_298791 - BLOCK
      ?auto_298792 - BLOCK
      ?auto_298793 - BLOCK
      ?auto_298794 - BLOCK
      ?auto_298795 - BLOCK
      ?auto_298796 - BLOCK
      ?auto_298797 - BLOCK
      ?auto_298798 - BLOCK
      ?auto_298799 - BLOCK
    )
    :vars
    (
      ?auto_298800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298799 ?auto_298800 ) ( ON-TABLE ?auto_298788 ) ( ON ?auto_298789 ?auto_298788 ) ( ON ?auto_298790 ?auto_298789 ) ( ON ?auto_298791 ?auto_298790 ) ( ON ?auto_298792 ?auto_298791 ) ( ON ?auto_298793 ?auto_298792 ) ( not ( = ?auto_298788 ?auto_298789 ) ) ( not ( = ?auto_298788 ?auto_298790 ) ) ( not ( = ?auto_298788 ?auto_298791 ) ) ( not ( = ?auto_298788 ?auto_298792 ) ) ( not ( = ?auto_298788 ?auto_298793 ) ) ( not ( = ?auto_298788 ?auto_298794 ) ) ( not ( = ?auto_298788 ?auto_298795 ) ) ( not ( = ?auto_298788 ?auto_298796 ) ) ( not ( = ?auto_298788 ?auto_298797 ) ) ( not ( = ?auto_298788 ?auto_298798 ) ) ( not ( = ?auto_298788 ?auto_298799 ) ) ( not ( = ?auto_298788 ?auto_298800 ) ) ( not ( = ?auto_298789 ?auto_298790 ) ) ( not ( = ?auto_298789 ?auto_298791 ) ) ( not ( = ?auto_298789 ?auto_298792 ) ) ( not ( = ?auto_298789 ?auto_298793 ) ) ( not ( = ?auto_298789 ?auto_298794 ) ) ( not ( = ?auto_298789 ?auto_298795 ) ) ( not ( = ?auto_298789 ?auto_298796 ) ) ( not ( = ?auto_298789 ?auto_298797 ) ) ( not ( = ?auto_298789 ?auto_298798 ) ) ( not ( = ?auto_298789 ?auto_298799 ) ) ( not ( = ?auto_298789 ?auto_298800 ) ) ( not ( = ?auto_298790 ?auto_298791 ) ) ( not ( = ?auto_298790 ?auto_298792 ) ) ( not ( = ?auto_298790 ?auto_298793 ) ) ( not ( = ?auto_298790 ?auto_298794 ) ) ( not ( = ?auto_298790 ?auto_298795 ) ) ( not ( = ?auto_298790 ?auto_298796 ) ) ( not ( = ?auto_298790 ?auto_298797 ) ) ( not ( = ?auto_298790 ?auto_298798 ) ) ( not ( = ?auto_298790 ?auto_298799 ) ) ( not ( = ?auto_298790 ?auto_298800 ) ) ( not ( = ?auto_298791 ?auto_298792 ) ) ( not ( = ?auto_298791 ?auto_298793 ) ) ( not ( = ?auto_298791 ?auto_298794 ) ) ( not ( = ?auto_298791 ?auto_298795 ) ) ( not ( = ?auto_298791 ?auto_298796 ) ) ( not ( = ?auto_298791 ?auto_298797 ) ) ( not ( = ?auto_298791 ?auto_298798 ) ) ( not ( = ?auto_298791 ?auto_298799 ) ) ( not ( = ?auto_298791 ?auto_298800 ) ) ( not ( = ?auto_298792 ?auto_298793 ) ) ( not ( = ?auto_298792 ?auto_298794 ) ) ( not ( = ?auto_298792 ?auto_298795 ) ) ( not ( = ?auto_298792 ?auto_298796 ) ) ( not ( = ?auto_298792 ?auto_298797 ) ) ( not ( = ?auto_298792 ?auto_298798 ) ) ( not ( = ?auto_298792 ?auto_298799 ) ) ( not ( = ?auto_298792 ?auto_298800 ) ) ( not ( = ?auto_298793 ?auto_298794 ) ) ( not ( = ?auto_298793 ?auto_298795 ) ) ( not ( = ?auto_298793 ?auto_298796 ) ) ( not ( = ?auto_298793 ?auto_298797 ) ) ( not ( = ?auto_298793 ?auto_298798 ) ) ( not ( = ?auto_298793 ?auto_298799 ) ) ( not ( = ?auto_298793 ?auto_298800 ) ) ( not ( = ?auto_298794 ?auto_298795 ) ) ( not ( = ?auto_298794 ?auto_298796 ) ) ( not ( = ?auto_298794 ?auto_298797 ) ) ( not ( = ?auto_298794 ?auto_298798 ) ) ( not ( = ?auto_298794 ?auto_298799 ) ) ( not ( = ?auto_298794 ?auto_298800 ) ) ( not ( = ?auto_298795 ?auto_298796 ) ) ( not ( = ?auto_298795 ?auto_298797 ) ) ( not ( = ?auto_298795 ?auto_298798 ) ) ( not ( = ?auto_298795 ?auto_298799 ) ) ( not ( = ?auto_298795 ?auto_298800 ) ) ( not ( = ?auto_298796 ?auto_298797 ) ) ( not ( = ?auto_298796 ?auto_298798 ) ) ( not ( = ?auto_298796 ?auto_298799 ) ) ( not ( = ?auto_298796 ?auto_298800 ) ) ( not ( = ?auto_298797 ?auto_298798 ) ) ( not ( = ?auto_298797 ?auto_298799 ) ) ( not ( = ?auto_298797 ?auto_298800 ) ) ( not ( = ?auto_298798 ?auto_298799 ) ) ( not ( = ?auto_298798 ?auto_298800 ) ) ( not ( = ?auto_298799 ?auto_298800 ) ) ( ON ?auto_298798 ?auto_298799 ) ( ON ?auto_298797 ?auto_298798 ) ( ON ?auto_298796 ?auto_298797 ) ( ON ?auto_298795 ?auto_298796 ) ( CLEAR ?auto_298793 ) ( ON ?auto_298794 ?auto_298795 ) ( CLEAR ?auto_298794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_298788 ?auto_298789 ?auto_298790 ?auto_298791 ?auto_298792 ?auto_298793 ?auto_298794 )
      ( MAKE-12PILE ?auto_298788 ?auto_298789 ?auto_298790 ?auto_298791 ?auto_298792 ?auto_298793 ?auto_298794 ?auto_298795 ?auto_298796 ?auto_298797 ?auto_298798 ?auto_298799 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_298813 - BLOCK
      ?auto_298814 - BLOCK
      ?auto_298815 - BLOCK
      ?auto_298816 - BLOCK
      ?auto_298817 - BLOCK
      ?auto_298818 - BLOCK
      ?auto_298819 - BLOCK
      ?auto_298820 - BLOCK
      ?auto_298821 - BLOCK
      ?auto_298822 - BLOCK
      ?auto_298823 - BLOCK
      ?auto_298824 - BLOCK
    )
    :vars
    (
      ?auto_298825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298824 ?auto_298825 ) ( ON-TABLE ?auto_298813 ) ( ON ?auto_298814 ?auto_298813 ) ( ON ?auto_298815 ?auto_298814 ) ( ON ?auto_298816 ?auto_298815 ) ( ON ?auto_298817 ?auto_298816 ) ( not ( = ?auto_298813 ?auto_298814 ) ) ( not ( = ?auto_298813 ?auto_298815 ) ) ( not ( = ?auto_298813 ?auto_298816 ) ) ( not ( = ?auto_298813 ?auto_298817 ) ) ( not ( = ?auto_298813 ?auto_298818 ) ) ( not ( = ?auto_298813 ?auto_298819 ) ) ( not ( = ?auto_298813 ?auto_298820 ) ) ( not ( = ?auto_298813 ?auto_298821 ) ) ( not ( = ?auto_298813 ?auto_298822 ) ) ( not ( = ?auto_298813 ?auto_298823 ) ) ( not ( = ?auto_298813 ?auto_298824 ) ) ( not ( = ?auto_298813 ?auto_298825 ) ) ( not ( = ?auto_298814 ?auto_298815 ) ) ( not ( = ?auto_298814 ?auto_298816 ) ) ( not ( = ?auto_298814 ?auto_298817 ) ) ( not ( = ?auto_298814 ?auto_298818 ) ) ( not ( = ?auto_298814 ?auto_298819 ) ) ( not ( = ?auto_298814 ?auto_298820 ) ) ( not ( = ?auto_298814 ?auto_298821 ) ) ( not ( = ?auto_298814 ?auto_298822 ) ) ( not ( = ?auto_298814 ?auto_298823 ) ) ( not ( = ?auto_298814 ?auto_298824 ) ) ( not ( = ?auto_298814 ?auto_298825 ) ) ( not ( = ?auto_298815 ?auto_298816 ) ) ( not ( = ?auto_298815 ?auto_298817 ) ) ( not ( = ?auto_298815 ?auto_298818 ) ) ( not ( = ?auto_298815 ?auto_298819 ) ) ( not ( = ?auto_298815 ?auto_298820 ) ) ( not ( = ?auto_298815 ?auto_298821 ) ) ( not ( = ?auto_298815 ?auto_298822 ) ) ( not ( = ?auto_298815 ?auto_298823 ) ) ( not ( = ?auto_298815 ?auto_298824 ) ) ( not ( = ?auto_298815 ?auto_298825 ) ) ( not ( = ?auto_298816 ?auto_298817 ) ) ( not ( = ?auto_298816 ?auto_298818 ) ) ( not ( = ?auto_298816 ?auto_298819 ) ) ( not ( = ?auto_298816 ?auto_298820 ) ) ( not ( = ?auto_298816 ?auto_298821 ) ) ( not ( = ?auto_298816 ?auto_298822 ) ) ( not ( = ?auto_298816 ?auto_298823 ) ) ( not ( = ?auto_298816 ?auto_298824 ) ) ( not ( = ?auto_298816 ?auto_298825 ) ) ( not ( = ?auto_298817 ?auto_298818 ) ) ( not ( = ?auto_298817 ?auto_298819 ) ) ( not ( = ?auto_298817 ?auto_298820 ) ) ( not ( = ?auto_298817 ?auto_298821 ) ) ( not ( = ?auto_298817 ?auto_298822 ) ) ( not ( = ?auto_298817 ?auto_298823 ) ) ( not ( = ?auto_298817 ?auto_298824 ) ) ( not ( = ?auto_298817 ?auto_298825 ) ) ( not ( = ?auto_298818 ?auto_298819 ) ) ( not ( = ?auto_298818 ?auto_298820 ) ) ( not ( = ?auto_298818 ?auto_298821 ) ) ( not ( = ?auto_298818 ?auto_298822 ) ) ( not ( = ?auto_298818 ?auto_298823 ) ) ( not ( = ?auto_298818 ?auto_298824 ) ) ( not ( = ?auto_298818 ?auto_298825 ) ) ( not ( = ?auto_298819 ?auto_298820 ) ) ( not ( = ?auto_298819 ?auto_298821 ) ) ( not ( = ?auto_298819 ?auto_298822 ) ) ( not ( = ?auto_298819 ?auto_298823 ) ) ( not ( = ?auto_298819 ?auto_298824 ) ) ( not ( = ?auto_298819 ?auto_298825 ) ) ( not ( = ?auto_298820 ?auto_298821 ) ) ( not ( = ?auto_298820 ?auto_298822 ) ) ( not ( = ?auto_298820 ?auto_298823 ) ) ( not ( = ?auto_298820 ?auto_298824 ) ) ( not ( = ?auto_298820 ?auto_298825 ) ) ( not ( = ?auto_298821 ?auto_298822 ) ) ( not ( = ?auto_298821 ?auto_298823 ) ) ( not ( = ?auto_298821 ?auto_298824 ) ) ( not ( = ?auto_298821 ?auto_298825 ) ) ( not ( = ?auto_298822 ?auto_298823 ) ) ( not ( = ?auto_298822 ?auto_298824 ) ) ( not ( = ?auto_298822 ?auto_298825 ) ) ( not ( = ?auto_298823 ?auto_298824 ) ) ( not ( = ?auto_298823 ?auto_298825 ) ) ( not ( = ?auto_298824 ?auto_298825 ) ) ( ON ?auto_298823 ?auto_298824 ) ( ON ?auto_298822 ?auto_298823 ) ( ON ?auto_298821 ?auto_298822 ) ( ON ?auto_298820 ?auto_298821 ) ( ON ?auto_298819 ?auto_298820 ) ( CLEAR ?auto_298817 ) ( ON ?auto_298818 ?auto_298819 ) ( CLEAR ?auto_298818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_298813 ?auto_298814 ?auto_298815 ?auto_298816 ?auto_298817 ?auto_298818 )
      ( MAKE-12PILE ?auto_298813 ?auto_298814 ?auto_298815 ?auto_298816 ?auto_298817 ?auto_298818 ?auto_298819 ?auto_298820 ?auto_298821 ?auto_298822 ?auto_298823 ?auto_298824 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_298838 - BLOCK
      ?auto_298839 - BLOCK
      ?auto_298840 - BLOCK
      ?auto_298841 - BLOCK
      ?auto_298842 - BLOCK
      ?auto_298843 - BLOCK
      ?auto_298844 - BLOCK
      ?auto_298845 - BLOCK
      ?auto_298846 - BLOCK
      ?auto_298847 - BLOCK
      ?auto_298848 - BLOCK
      ?auto_298849 - BLOCK
    )
    :vars
    (
      ?auto_298850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298849 ?auto_298850 ) ( ON-TABLE ?auto_298838 ) ( ON ?auto_298839 ?auto_298838 ) ( ON ?auto_298840 ?auto_298839 ) ( ON ?auto_298841 ?auto_298840 ) ( ON ?auto_298842 ?auto_298841 ) ( not ( = ?auto_298838 ?auto_298839 ) ) ( not ( = ?auto_298838 ?auto_298840 ) ) ( not ( = ?auto_298838 ?auto_298841 ) ) ( not ( = ?auto_298838 ?auto_298842 ) ) ( not ( = ?auto_298838 ?auto_298843 ) ) ( not ( = ?auto_298838 ?auto_298844 ) ) ( not ( = ?auto_298838 ?auto_298845 ) ) ( not ( = ?auto_298838 ?auto_298846 ) ) ( not ( = ?auto_298838 ?auto_298847 ) ) ( not ( = ?auto_298838 ?auto_298848 ) ) ( not ( = ?auto_298838 ?auto_298849 ) ) ( not ( = ?auto_298838 ?auto_298850 ) ) ( not ( = ?auto_298839 ?auto_298840 ) ) ( not ( = ?auto_298839 ?auto_298841 ) ) ( not ( = ?auto_298839 ?auto_298842 ) ) ( not ( = ?auto_298839 ?auto_298843 ) ) ( not ( = ?auto_298839 ?auto_298844 ) ) ( not ( = ?auto_298839 ?auto_298845 ) ) ( not ( = ?auto_298839 ?auto_298846 ) ) ( not ( = ?auto_298839 ?auto_298847 ) ) ( not ( = ?auto_298839 ?auto_298848 ) ) ( not ( = ?auto_298839 ?auto_298849 ) ) ( not ( = ?auto_298839 ?auto_298850 ) ) ( not ( = ?auto_298840 ?auto_298841 ) ) ( not ( = ?auto_298840 ?auto_298842 ) ) ( not ( = ?auto_298840 ?auto_298843 ) ) ( not ( = ?auto_298840 ?auto_298844 ) ) ( not ( = ?auto_298840 ?auto_298845 ) ) ( not ( = ?auto_298840 ?auto_298846 ) ) ( not ( = ?auto_298840 ?auto_298847 ) ) ( not ( = ?auto_298840 ?auto_298848 ) ) ( not ( = ?auto_298840 ?auto_298849 ) ) ( not ( = ?auto_298840 ?auto_298850 ) ) ( not ( = ?auto_298841 ?auto_298842 ) ) ( not ( = ?auto_298841 ?auto_298843 ) ) ( not ( = ?auto_298841 ?auto_298844 ) ) ( not ( = ?auto_298841 ?auto_298845 ) ) ( not ( = ?auto_298841 ?auto_298846 ) ) ( not ( = ?auto_298841 ?auto_298847 ) ) ( not ( = ?auto_298841 ?auto_298848 ) ) ( not ( = ?auto_298841 ?auto_298849 ) ) ( not ( = ?auto_298841 ?auto_298850 ) ) ( not ( = ?auto_298842 ?auto_298843 ) ) ( not ( = ?auto_298842 ?auto_298844 ) ) ( not ( = ?auto_298842 ?auto_298845 ) ) ( not ( = ?auto_298842 ?auto_298846 ) ) ( not ( = ?auto_298842 ?auto_298847 ) ) ( not ( = ?auto_298842 ?auto_298848 ) ) ( not ( = ?auto_298842 ?auto_298849 ) ) ( not ( = ?auto_298842 ?auto_298850 ) ) ( not ( = ?auto_298843 ?auto_298844 ) ) ( not ( = ?auto_298843 ?auto_298845 ) ) ( not ( = ?auto_298843 ?auto_298846 ) ) ( not ( = ?auto_298843 ?auto_298847 ) ) ( not ( = ?auto_298843 ?auto_298848 ) ) ( not ( = ?auto_298843 ?auto_298849 ) ) ( not ( = ?auto_298843 ?auto_298850 ) ) ( not ( = ?auto_298844 ?auto_298845 ) ) ( not ( = ?auto_298844 ?auto_298846 ) ) ( not ( = ?auto_298844 ?auto_298847 ) ) ( not ( = ?auto_298844 ?auto_298848 ) ) ( not ( = ?auto_298844 ?auto_298849 ) ) ( not ( = ?auto_298844 ?auto_298850 ) ) ( not ( = ?auto_298845 ?auto_298846 ) ) ( not ( = ?auto_298845 ?auto_298847 ) ) ( not ( = ?auto_298845 ?auto_298848 ) ) ( not ( = ?auto_298845 ?auto_298849 ) ) ( not ( = ?auto_298845 ?auto_298850 ) ) ( not ( = ?auto_298846 ?auto_298847 ) ) ( not ( = ?auto_298846 ?auto_298848 ) ) ( not ( = ?auto_298846 ?auto_298849 ) ) ( not ( = ?auto_298846 ?auto_298850 ) ) ( not ( = ?auto_298847 ?auto_298848 ) ) ( not ( = ?auto_298847 ?auto_298849 ) ) ( not ( = ?auto_298847 ?auto_298850 ) ) ( not ( = ?auto_298848 ?auto_298849 ) ) ( not ( = ?auto_298848 ?auto_298850 ) ) ( not ( = ?auto_298849 ?auto_298850 ) ) ( ON ?auto_298848 ?auto_298849 ) ( ON ?auto_298847 ?auto_298848 ) ( ON ?auto_298846 ?auto_298847 ) ( ON ?auto_298845 ?auto_298846 ) ( ON ?auto_298844 ?auto_298845 ) ( CLEAR ?auto_298842 ) ( ON ?auto_298843 ?auto_298844 ) ( CLEAR ?auto_298843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_298838 ?auto_298839 ?auto_298840 ?auto_298841 ?auto_298842 ?auto_298843 )
      ( MAKE-12PILE ?auto_298838 ?auto_298839 ?auto_298840 ?auto_298841 ?auto_298842 ?auto_298843 ?auto_298844 ?auto_298845 ?auto_298846 ?auto_298847 ?auto_298848 ?auto_298849 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_298863 - BLOCK
      ?auto_298864 - BLOCK
      ?auto_298865 - BLOCK
      ?auto_298866 - BLOCK
      ?auto_298867 - BLOCK
      ?auto_298868 - BLOCK
      ?auto_298869 - BLOCK
      ?auto_298870 - BLOCK
      ?auto_298871 - BLOCK
      ?auto_298872 - BLOCK
      ?auto_298873 - BLOCK
      ?auto_298874 - BLOCK
    )
    :vars
    (
      ?auto_298875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298874 ?auto_298875 ) ( ON-TABLE ?auto_298863 ) ( ON ?auto_298864 ?auto_298863 ) ( ON ?auto_298865 ?auto_298864 ) ( ON ?auto_298866 ?auto_298865 ) ( not ( = ?auto_298863 ?auto_298864 ) ) ( not ( = ?auto_298863 ?auto_298865 ) ) ( not ( = ?auto_298863 ?auto_298866 ) ) ( not ( = ?auto_298863 ?auto_298867 ) ) ( not ( = ?auto_298863 ?auto_298868 ) ) ( not ( = ?auto_298863 ?auto_298869 ) ) ( not ( = ?auto_298863 ?auto_298870 ) ) ( not ( = ?auto_298863 ?auto_298871 ) ) ( not ( = ?auto_298863 ?auto_298872 ) ) ( not ( = ?auto_298863 ?auto_298873 ) ) ( not ( = ?auto_298863 ?auto_298874 ) ) ( not ( = ?auto_298863 ?auto_298875 ) ) ( not ( = ?auto_298864 ?auto_298865 ) ) ( not ( = ?auto_298864 ?auto_298866 ) ) ( not ( = ?auto_298864 ?auto_298867 ) ) ( not ( = ?auto_298864 ?auto_298868 ) ) ( not ( = ?auto_298864 ?auto_298869 ) ) ( not ( = ?auto_298864 ?auto_298870 ) ) ( not ( = ?auto_298864 ?auto_298871 ) ) ( not ( = ?auto_298864 ?auto_298872 ) ) ( not ( = ?auto_298864 ?auto_298873 ) ) ( not ( = ?auto_298864 ?auto_298874 ) ) ( not ( = ?auto_298864 ?auto_298875 ) ) ( not ( = ?auto_298865 ?auto_298866 ) ) ( not ( = ?auto_298865 ?auto_298867 ) ) ( not ( = ?auto_298865 ?auto_298868 ) ) ( not ( = ?auto_298865 ?auto_298869 ) ) ( not ( = ?auto_298865 ?auto_298870 ) ) ( not ( = ?auto_298865 ?auto_298871 ) ) ( not ( = ?auto_298865 ?auto_298872 ) ) ( not ( = ?auto_298865 ?auto_298873 ) ) ( not ( = ?auto_298865 ?auto_298874 ) ) ( not ( = ?auto_298865 ?auto_298875 ) ) ( not ( = ?auto_298866 ?auto_298867 ) ) ( not ( = ?auto_298866 ?auto_298868 ) ) ( not ( = ?auto_298866 ?auto_298869 ) ) ( not ( = ?auto_298866 ?auto_298870 ) ) ( not ( = ?auto_298866 ?auto_298871 ) ) ( not ( = ?auto_298866 ?auto_298872 ) ) ( not ( = ?auto_298866 ?auto_298873 ) ) ( not ( = ?auto_298866 ?auto_298874 ) ) ( not ( = ?auto_298866 ?auto_298875 ) ) ( not ( = ?auto_298867 ?auto_298868 ) ) ( not ( = ?auto_298867 ?auto_298869 ) ) ( not ( = ?auto_298867 ?auto_298870 ) ) ( not ( = ?auto_298867 ?auto_298871 ) ) ( not ( = ?auto_298867 ?auto_298872 ) ) ( not ( = ?auto_298867 ?auto_298873 ) ) ( not ( = ?auto_298867 ?auto_298874 ) ) ( not ( = ?auto_298867 ?auto_298875 ) ) ( not ( = ?auto_298868 ?auto_298869 ) ) ( not ( = ?auto_298868 ?auto_298870 ) ) ( not ( = ?auto_298868 ?auto_298871 ) ) ( not ( = ?auto_298868 ?auto_298872 ) ) ( not ( = ?auto_298868 ?auto_298873 ) ) ( not ( = ?auto_298868 ?auto_298874 ) ) ( not ( = ?auto_298868 ?auto_298875 ) ) ( not ( = ?auto_298869 ?auto_298870 ) ) ( not ( = ?auto_298869 ?auto_298871 ) ) ( not ( = ?auto_298869 ?auto_298872 ) ) ( not ( = ?auto_298869 ?auto_298873 ) ) ( not ( = ?auto_298869 ?auto_298874 ) ) ( not ( = ?auto_298869 ?auto_298875 ) ) ( not ( = ?auto_298870 ?auto_298871 ) ) ( not ( = ?auto_298870 ?auto_298872 ) ) ( not ( = ?auto_298870 ?auto_298873 ) ) ( not ( = ?auto_298870 ?auto_298874 ) ) ( not ( = ?auto_298870 ?auto_298875 ) ) ( not ( = ?auto_298871 ?auto_298872 ) ) ( not ( = ?auto_298871 ?auto_298873 ) ) ( not ( = ?auto_298871 ?auto_298874 ) ) ( not ( = ?auto_298871 ?auto_298875 ) ) ( not ( = ?auto_298872 ?auto_298873 ) ) ( not ( = ?auto_298872 ?auto_298874 ) ) ( not ( = ?auto_298872 ?auto_298875 ) ) ( not ( = ?auto_298873 ?auto_298874 ) ) ( not ( = ?auto_298873 ?auto_298875 ) ) ( not ( = ?auto_298874 ?auto_298875 ) ) ( ON ?auto_298873 ?auto_298874 ) ( ON ?auto_298872 ?auto_298873 ) ( ON ?auto_298871 ?auto_298872 ) ( ON ?auto_298870 ?auto_298871 ) ( ON ?auto_298869 ?auto_298870 ) ( ON ?auto_298868 ?auto_298869 ) ( CLEAR ?auto_298866 ) ( ON ?auto_298867 ?auto_298868 ) ( CLEAR ?auto_298867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_298863 ?auto_298864 ?auto_298865 ?auto_298866 ?auto_298867 )
      ( MAKE-12PILE ?auto_298863 ?auto_298864 ?auto_298865 ?auto_298866 ?auto_298867 ?auto_298868 ?auto_298869 ?auto_298870 ?auto_298871 ?auto_298872 ?auto_298873 ?auto_298874 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_298888 - BLOCK
      ?auto_298889 - BLOCK
      ?auto_298890 - BLOCK
      ?auto_298891 - BLOCK
      ?auto_298892 - BLOCK
      ?auto_298893 - BLOCK
      ?auto_298894 - BLOCK
      ?auto_298895 - BLOCK
      ?auto_298896 - BLOCK
      ?auto_298897 - BLOCK
      ?auto_298898 - BLOCK
      ?auto_298899 - BLOCK
    )
    :vars
    (
      ?auto_298900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298899 ?auto_298900 ) ( ON-TABLE ?auto_298888 ) ( ON ?auto_298889 ?auto_298888 ) ( ON ?auto_298890 ?auto_298889 ) ( ON ?auto_298891 ?auto_298890 ) ( not ( = ?auto_298888 ?auto_298889 ) ) ( not ( = ?auto_298888 ?auto_298890 ) ) ( not ( = ?auto_298888 ?auto_298891 ) ) ( not ( = ?auto_298888 ?auto_298892 ) ) ( not ( = ?auto_298888 ?auto_298893 ) ) ( not ( = ?auto_298888 ?auto_298894 ) ) ( not ( = ?auto_298888 ?auto_298895 ) ) ( not ( = ?auto_298888 ?auto_298896 ) ) ( not ( = ?auto_298888 ?auto_298897 ) ) ( not ( = ?auto_298888 ?auto_298898 ) ) ( not ( = ?auto_298888 ?auto_298899 ) ) ( not ( = ?auto_298888 ?auto_298900 ) ) ( not ( = ?auto_298889 ?auto_298890 ) ) ( not ( = ?auto_298889 ?auto_298891 ) ) ( not ( = ?auto_298889 ?auto_298892 ) ) ( not ( = ?auto_298889 ?auto_298893 ) ) ( not ( = ?auto_298889 ?auto_298894 ) ) ( not ( = ?auto_298889 ?auto_298895 ) ) ( not ( = ?auto_298889 ?auto_298896 ) ) ( not ( = ?auto_298889 ?auto_298897 ) ) ( not ( = ?auto_298889 ?auto_298898 ) ) ( not ( = ?auto_298889 ?auto_298899 ) ) ( not ( = ?auto_298889 ?auto_298900 ) ) ( not ( = ?auto_298890 ?auto_298891 ) ) ( not ( = ?auto_298890 ?auto_298892 ) ) ( not ( = ?auto_298890 ?auto_298893 ) ) ( not ( = ?auto_298890 ?auto_298894 ) ) ( not ( = ?auto_298890 ?auto_298895 ) ) ( not ( = ?auto_298890 ?auto_298896 ) ) ( not ( = ?auto_298890 ?auto_298897 ) ) ( not ( = ?auto_298890 ?auto_298898 ) ) ( not ( = ?auto_298890 ?auto_298899 ) ) ( not ( = ?auto_298890 ?auto_298900 ) ) ( not ( = ?auto_298891 ?auto_298892 ) ) ( not ( = ?auto_298891 ?auto_298893 ) ) ( not ( = ?auto_298891 ?auto_298894 ) ) ( not ( = ?auto_298891 ?auto_298895 ) ) ( not ( = ?auto_298891 ?auto_298896 ) ) ( not ( = ?auto_298891 ?auto_298897 ) ) ( not ( = ?auto_298891 ?auto_298898 ) ) ( not ( = ?auto_298891 ?auto_298899 ) ) ( not ( = ?auto_298891 ?auto_298900 ) ) ( not ( = ?auto_298892 ?auto_298893 ) ) ( not ( = ?auto_298892 ?auto_298894 ) ) ( not ( = ?auto_298892 ?auto_298895 ) ) ( not ( = ?auto_298892 ?auto_298896 ) ) ( not ( = ?auto_298892 ?auto_298897 ) ) ( not ( = ?auto_298892 ?auto_298898 ) ) ( not ( = ?auto_298892 ?auto_298899 ) ) ( not ( = ?auto_298892 ?auto_298900 ) ) ( not ( = ?auto_298893 ?auto_298894 ) ) ( not ( = ?auto_298893 ?auto_298895 ) ) ( not ( = ?auto_298893 ?auto_298896 ) ) ( not ( = ?auto_298893 ?auto_298897 ) ) ( not ( = ?auto_298893 ?auto_298898 ) ) ( not ( = ?auto_298893 ?auto_298899 ) ) ( not ( = ?auto_298893 ?auto_298900 ) ) ( not ( = ?auto_298894 ?auto_298895 ) ) ( not ( = ?auto_298894 ?auto_298896 ) ) ( not ( = ?auto_298894 ?auto_298897 ) ) ( not ( = ?auto_298894 ?auto_298898 ) ) ( not ( = ?auto_298894 ?auto_298899 ) ) ( not ( = ?auto_298894 ?auto_298900 ) ) ( not ( = ?auto_298895 ?auto_298896 ) ) ( not ( = ?auto_298895 ?auto_298897 ) ) ( not ( = ?auto_298895 ?auto_298898 ) ) ( not ( = ?auto_298895 ?auto_298899 ) ) ( not ( = ?auto_298895 ?auto_298900 ) ) ( not ( = ?auto_298896 ?auto_298897 ) ) ( not ( = ?auto_298896 ?auto_298898 ) ) ( not ( = ?auto_298896 ?auto_298899 ) ) ( not ( = ?auto_298896 ?auto_298900 ) ) ( not ( = ?auto_298897 ?auto_298898 ) ) ( not ( = ?auto_298897 ?auto_298899 ) ) ( not ( = ?auto_298897 ?auto_298900 ) ) ( not ( = ?auto_298898 ?auto_298899 ) ) ( not ( = ?auto_298898 ?auto_298900 ) ) ( not ( = ?auto_298899 ?auto_298900 ) ) ( ON ?auto_298898 ?auto_298899 ) ( ON ?auto_298897 ?auto_298898 ) ( ON ?auto_298896 ?auto_298897 ) ( ON ?auto_298895 ?auto_298896 ) ( ON ?auto_298894 ?auto_298895 ) ( ON ?auto_298893 ?auto_298894 ) ( CLEAR ?auto_298891 ) ( ON ?auto_298892 ?auto_298893 ) ( CLEAR ?auto_298892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_298888 ?auto_298889 ?auto_298890 ?auto_298891 ?auto_298892 )
      ( MAKE-12PILE ?auto_298888 ?auto_298889 ?auto_298890 ?auto_298891 ?auto_298892 ?auto_298893 ?auto_298894 ?auto_298895 ?auto_298896 ?auto_298897 ?auto_298898 ?auto_298899 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_298913 - BLOCK
      ?auto_298914 - BLOCK
      ?auto_298915 - BLOCK
      ?auto_298916 - BLOCK
      ?auto_298917 - BLOCK
      ?auto_298918 - BLOCK
      ?auto_298919 - BLOCK
      ?auto_298920 - BLOCK
      ?auto_298921 - BLOCK
      ?auto_298922 - BLOCK
      ?auto_298923 - BLOCK
      ?auto_298924 - BLOCK
    )
    :vars
    (
      ?auto_298925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298924 ?auto_298925 ) ( ON-TABLE ?auto_298913 ) ( ON ?auto_298914 ?auto_298913 ) ( ON ?auto_298915 ?auto_298914 ) ( not ( = ?auto_298913 ?auto_298914 ) ) ( not ( = ?auto_298913 ?auto_298915 ) ) ( not ( = ?auto_298913 ?auto_298916 ) ) ( not ( = ?auto_298913 ?auto_298917 ) ) ( not ( = ?auto_298913 ?auto_298918 ) ) ( not ( = ?auto_298913 ?auto_298919 ) ) ( not ( = ?auto_298913 ?auto_298920 ) ) ( not ( = ?auto_298913 ?auto_298921 ) ) ( not ( = ?auto_298913 ?auto_298922 ) ) ( not ( = ?auto_298913 ?auto_298923 ) ) ( not ( = ?auto_298913 ?auto_298924 ) ) ( not ( = ?auto_298913 ?auto_298925 ) ) ( not ( = ?auto_298914 ?auto_298915 ) ) ( not ( = ?auto_298914 ?auto_298916 ) ) ( not ( = ?auto_298914 ?auto_298917 ) ) ( not ( = ?auto_298914 ?auto_298918 ) ) ( not ( = ?auto_298914 ?auto_298919 ) ) ( not ( = ?auto_298914 ?auto_298920 ) ) ( not ( = ?auto_298914 ?auto_298921 ) ) ( not ( = ?auto_298914 ?auto_298922 ) ) ( not ( = ?auto_298914 ?auto_298923 ) ) ( not ( = ?auto_298914 ?auto_298924 ) ) ( not ( = ?auto_298914 ?auto_298925 ) ) ( not ( = ?auto_298915 ?auto_298916 ) ) ( not ( = ?auto_298915 ?auto_298917 ) ) ( not ( = ?auto_298915 ?auto_298918 ) ) ( not ( = ?auto_298915 ?auto_298919 ) ) ( not ( = ?auto_298915 ?auto_298920 ) ) ( not ( = ?auto_298915 ?auto_298921 ) ) ( not ( = ?auto_298915 ?auto_298922 ) ) ( not ( = ?auto_298915 ?auto_298923 ) ) ( not ( = ?auto_298915 ?auto_298924 ) ) ( not ( = ?auto_298915 ?auto_298925 ) ) ( not ( = ?auto_298916 ?auto_298917 ) ) ( not ( = ?auto_298916 ?auto_298918 ) ) ( not ( = ?auto_298916 ?auto_298919 ) ) ( not ( = ?auto_298916 ?auto_298920 ) ) ( not ( = ?auto_298916 ?auto_298921 ) ) ( not ( = ?auto_298916 ?auto_298922 ) ) ( not ( = ?auto_298916 ?auto_298923 ) ) ( not ( = ?auto_298916 ?auto_298924 ) ) ( not ( = ?auto_298916 ?auto_298925 ) ) ( not ( = ?auto_298917 ?auto_298918 ) ) ( not ( = ?auto_298917 ?auto_298919 ) ) ( not ( = ?auto_298917 ?auto_298920 ) ) ( not ( = ?auto_298917 ?auto_298921 ) ) ( not ( = ?auto_298917 ?auto_298922 ) ) ( not ( = ?auto_298917 ?auto_298923 ) ) ( not ( = ?auto_298917 ?auto_298924 ) ) ( not ( = ?auto_298917 ?auto_298925 ) ) ( not ( = ?auto_298918 ?auto_298919 ) ) ( not ( = ?auto_298918 ?auto_298920 ) ) ( not ( = ?auto_298918 ?auto_298921 ) ) ( not ( = ?auto_298918 ?auto_298922 ) ) ( not ( = ?auto_298918 ?auto_298923 ) ) ( not ( = ?auto_298918 ?auto_298924 ) ) ( not ( = ?auto_298918 ?auto_298925 ) ) ( not ( = ?auto_298919 ?auto_298920 ) ) ( not ( = ?auto_298919 ?auto_298921 ) ) ( not ( = ?auto_298919 ?auto_298922 ) ) ( not ( = ?auto_298919 ?auto_298923 ) ) ( not ( = ?auto_298919 ?auto_298924 ) ) ( not ( = ?auto_298919 ?auto_298925 ) ) ( not ( = ?auto_298920 ?auto_298921 ) ) ( not ( = ?auto_298920 ?auto_298922 ) ) ( not ( = ?auto_298920 ?auto_298923 ) ) ( not ( = ?auto_298920 ?auto_298924 ) ) ( not ( = ?auto_298920 ?auto_298925 ) ) ( not ( = ?auto_298921 ?auto_298922 ) ) ( not ( = ?auto_298921 ?auto_298923 ) ) ( not ( = ?auto_298921 ?auto_298924 ) ) ( not ( = ?auto_298921 ?auto_298925 ) ) ( not ( = ?auto_298922 ?auto_298923 ) ) ( not ( = ?auto_298922 ?auto_298924 ) ) ( not ( = ?auto_298922 ?auto_298925 ) ) ( not ( = ?auto_298923 ?auto_298924 ) ) ( not ( = ?auto_298923 ?auto_298925 ) ) ( not ( = ?auto_298924 ?auto_298925 ) ) ( ON ?auto_298923 ?auto_298924 ) ( ON ?auto_298922 ?auto_298923 ) ( ON ?auto_298921 ?auto_298922 ) ( ON ?auto_298920 ?auto_298921 ) ( ON ?auto_298919 ?auto_298920 ) ( ON ?auto_298918 ?auto_298919 ) ( ON ?auto_298917 ?auto_298918 ) ( CLEAR ?auto_298915 ) ( ON ?auto_298916 ?auto_298917 ) ( CLEAR ?auto_298916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_298913 ?auto_298914 ?auto_298915 ?auto_298916 )
      ( MAKE-12PILE ?auto_298913 ?auto_298914 ?auto_298915 ?auto_298916 ?auto_298917 ?auto_298918 ?auto_298919 ?auto_298920 ?auto_298921 ?auto_298922 ?auto_298923 ?auto_298924 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_298938 - BLOCK
      ?auto_298939 - BLOCK
      ?auto_298940 - BLOCK
      ?auto_298941 - BLOCK
      ?auto_298942 - BLOCK
      ?auto_298943 - BLOCK
      ?auto_298944 - BLOCK
      ?auto_298945 - BLOCK
      ?auto_298946 - BLOCK
      ?auto_298947 - BLOCK
      ?auto_298948 - BLOCK
      ?auto_298949 - BLOCK
    )
    :vars
    (
      ?auto_298950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298949 ?auto_298950 ) ( ON-TABLE ?auto_298938 ) ( ON ?auto_298939 ?auto_298938 ) ( ON ?auto_298940 ?auto_298939 ) ( not ( = ?auto_298938 ?auto_298939 ) ) ( not ( = ?auto_298938 ?auto_298940 ) ) ( not ( = ?auto_298938 ?auto_298941 ) ) ( not ( = ?auto_298938 ?auto_298942 ) ) ( not ( = ?auto_298938 ?auto_298943 ) ) ( not ( = ?auto_298938 ?auto_298944 ) ) ( not ( = ?auto_298938 ?auto_298945 ) ) ( not ( = ?auto_298938 ?auto_298946 ) ) ( not ( = ?auto_298938 ?auto_298947 ) ) ( not ( = ?auto_298938 ?auto_298948 ) ) ( not ( = ?auto_298938 ?auto_298949 ) ) ( not ( = ?auto_298938 ?auto_298950 ) ) ( not ( = ?auto_298939 ?auto_298940 ) ) ( not ( = ?auto_298939 ?auto_298941 ) ) ( not ( = ?auto_298939 ?auto_298942 ) ) ( not ( = ?auto_298939 ?auto_298943 ) ) ( not ( = ?auto_298939 ?auto_298944 ) ) ( not ( = ?auto_298939 ?auto_298945 ) ) ( not ( = ?auto_298939 ?auto_298946 ) ) ( not ( = ?auto_298939 ?auto_298947 ) ) ( not ( = ?auto_298939 ?auto_298948 ) ) ( not ( = ?auto_298939 ?auto_298949 ) ) ( not ( = ?auto_298939 ?auto_298950 ) ) ( not ( = ?auto_298940 ?auto_298941 ) ) ( not ( = ?auto_298940 ?auto_298942 ) ) ( not ( = ?auto_298940 ?auto_298943 ) ) ( not ( = ?auto_298940 ?auto_298944 ) ) ( not ( = ?auto_298940 ?auto_298945 ) ) ( not ( = ?auto_298940 ?auto_298946 ) ) ( not ( = ?auto_298940 ?auto_298947 ) ) ( not ( = ?auto_298940 ?auto_298948 ) ) ( not ( = ?auto_298940 ?auto_298949 ) ) ( not ( = ?auto_298940 ?auto_298950 ) ) ( not ( = ?auto_298941 ?auto_298942 ) ) ( not ( = ?auto_298941 ?auto_298943 ) ) ( not ( = ?auto_298941 ?auto_298944 ) ) ( not ( = ?auto_298941 ?auto_298945 ) ) ( not ( = ?auto_298941 ?auto_298946 ) ) ( not ( = ?auto_298941 ?auto_298947 ) ) ( not ( = ?auto_298941 ?auto_298948 ) ) ( not ( = ?auto_298941 ?auto_298949 ) ) ( not ( = ?auto_298941 ?auto_298950 ) ) ( not ( = ?auto_298942 ?auto_298943 ) ) ( not ( = ?auto_298942 ?auto_298944 ) ) ( not ( = ?auto_298942 ?auto_298945 ) ) ( not ( = ?auto_298942 ?auto_298946 ) ) ( not ( = ?auto_298942 ?auto_298947 ) ) ( not ( = ?auto_298942 ?auto_298948 ) ) ( not ( = ?auto_298942 ?auto_298949 ) ) ( not ( = ?auto_298942 ?auto_298950 ) ) ( not ( = ?auto_298943 ?auto_298944 ) ) ( not ( = ?auto_298943 ?auto_298945 ) ) ( not ( = ?auto_298943 ?auto_298946 ) ) ( not ( = ?auto_298943 ?auto_298947 ) ) ( not ( = ?auto_298943 ?auto_298948 ) ) ( not ( = ?auto_298943 ?auto_298949 ) ) ( not ( = ?auto_298943 ?auto_298950 ) ) ( not ( = ?auto_298944 ?auto_298945 ) ) ( not ( = ?auto_298944 ?auto_298946 ) ) ( not ( = ?auto_298944 ?auto_298947 ) ) ( not ( = ?auto_298944 ?auto_298948 ) ) ( not ( = ?auto_298944 ?auto_298949 ) ) ( not ( = ?auto_298944 ?auto_298950 ) ) ( not ( = ?auto_298945 ?auto_298946 ) ) ( not ( = ?auto_298945 ?auto_298947 ) ) ( not ( = ?auto_298945 ?auto_298948 ) ) ( not ( = ?auto_298945 ?auto_298949 ) ) ( not ( = ?auto_298945 ?auto_298950 ) ) ( not ( = ?auto_298946 ?auto_298947 ) ) ( not ( = ?auto_298946 ?auto_298948 ) ) ( not ( = ?auto_298946 ?auto_298949 ) ) ( not ( = ?auto_298946 ?auto_298950 ) ) ( not ( = ?auto_298947 ?auto_298948 ) ) ( not ( = ?auto_298947 ?auto_298949 ) ) ( not ( = ?auto_298947 ?auto_298950 ) ) ( not ( = ?auto_298948 ?auto_298949 ) ) ( not ( = ?auto_298948 ?auto_298950 ) ) ( not ( = ?auto_298949 ?auto_298950 ) ) ( ON ?auto_298948 ?auto_298949 ) ( ON ?auto_298947 ?auto_298948 ) ( ON ?auto_298946 ?auto_298947 ) ( ON ?auto_298945 ?auto_298946 ) ( ON ?auto_298944 ?auto_298945 ) ( ON ?auto_298943 ?auto_298944 ) ( ON ?auto_298942 ?auto_298943 ) ( CLEAR ?auto_298940 ) ( ON ?auto_298941 ?auto_298942 ) ( CLEAR ?auto_298941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_298938 ?auto_298939 ?auto_298940 ?auto_298941 )
      ( MAKE-12PILE ?auto_298938 ?auto_298939 ?auto_298940 ?auto_298941 ?auto_298942 ?auto_298943 ?auto_298944 ?auto_298945 ?auto_298946 ?auto_298947 ?auto_298948 ?auto_298949 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_298963 - BLOCK
      ?auto_298964 - BLOCK
      ?auto_298965 - BLOCK
      ?auto_298966 - BLOCK
      ?auto_298967 - BLOCK
      ?auto_298968 - BLOCK
      ?auto_298969 - BLOCK
      ?auto_298970 - BLOCK
      ?auto_298971 - BLOCK
      ?auto_298972 - BLOCK
      ?auto_298973 - BLOCK
      ?auto_298974 - BLOCK
    )
    :vars
    (
      ?auto_298975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298974 ?auto_298975 ) ( ON-TABLE ?auto_298963 ) ( ON ?auto_298964 ?auto_298963 ) ( not ( = ?auto_298963 ?auto_298964 ) ) ( not ( = ?auto_298963 ?auto_298965 ) ) ( not ( = ?auto_298963 ?auto_298966 ) ) ( not ( = ?auto_298963 ?auto_298967 ) ) ( not ( = ?auto_298963 ?auto_298968 ) ) ( not ( = ?auto_298963 ?auto_298969 ) ) ( not ( = ?auto_298963 ?auto_298970 ) ) ( not ( = ?auto_298963 ?auto_298971 ) ) ( not ( = ?auto_298963 ?auto_298972 ) ) ( not ( = ?auto_298963 ?auto_298973 ) ) ( not ( = ?auto_298963 ?auto_298974 ) ) ( not ( = ?auto_298963 ?auto_298975 ) ) ( not ( = ?auto_298964 ?auto_298965 ) ) ( not ( = ?auto_298964 ?auto_298966 ) ) ( not ( = ?auto_298964 ?auto_298967 ) ) ( not ( = ?auto_298964 ?auto_298968 ) ) ( not ( = ?auto_298964 ?auto_298969 ) ) ( not ( = ?auto_298964 ?auto_298970 ) ) ( not ( = ?auto_298964 ?auto_298971 ) ) ( not ( = ?auto_298964 ?auto_298972 ) ) ( not ( = ?auto_298964 ?auto_298973 ) ) ( not ( = ?auto_298964 ?auto_298974 ) ) ( not ( = ?auto_298964 ?auto_298975 ) ) ( not ( = ?auto_298965 ?auto_298966 ) ) ( not ( = ?auto_298965 ?auto_298967 ) ) ( not ( = ?auto_298965 ?auto_298968 ) ) ( not ( = ?auto_298965 ?auto_298969 ) ) ( not ( = ?auto_298965 ?auto_298970 ) ) ( not ( = ?auto_298965 ?auto_298971 ) ) ( not ( = ?auto_298965 ?auto_298972 ) ) ( not ( = ?auto_298965 ?auto_298973 ) ) ( not ( = ?auto_298965 ?auto_298974 ) ) ( not ( = ?auto_298965 ?auto_298975 ) ) ( not ( = ?auto_298966 ?auto_298967 ) ) ( not ( = ?auto_298966 ?auto_298968 ) ) ( not ( = ?auto_298966 ?auto_298969 ) ) ( not ( = ?auto_298966 ?auto_298970 ) ) ( not ( = ?auto_298966 ?auto_298971 ) ) ( not ( = ?auto_298966 ?auto_298972 ) ) ( not ( = ?auto_298966 ?auto_298973 ) ) ( not ( = ?auto_298966 ?auto_298974 ) ) ( not ( = ?auto_298966 ?auto_298975 ) ) ( not ( = ?auto_298967 ?auto_298968 ) ) ( not ( = ?auto_298967 ?auto_298969 ) ) ( not ( = ?auto_298967 ?auto_298970 ) ) ( not ( = ?auto_298967 ?auto_298971 ) ) ( not ( = ?auto_298967 ?auto_298972 ) ) ( not ( = ?auto_298967 ?auto_298973 ) ) ( not ( = ?auto_298967 ?auto_298974 ) ) ( not ( = ?auto_298967 ?auto_298975 ) ) ( not ( = ?auto_298968 ?auto_298969 ) ) ( not ( = ?auto_298968 ?auto_298970 ) ) ( not ( = ?auto_298968 ?auto_298971 ) ) ( not ( = ?auto_298968 ?auto_298972 ) ) ( not ( = ?auto_298968 ?auto_298973 ) ) ( not ( = ?auto_298968 ?auto_298974 ) ) ( not ( = ?auto_298968 ?auto_298975 ) ) ( not ( = ?auto_298969 ?auto_298970 ) ) ( not ( = ?auto_298969 ?auto_298971 ) ) ( not ( = ?auto_298969 ?auto_298972 ) ) ( not ( = ?auto_298969 ?auto_298973 ) ) ( not ( = ?auto_298969 ?auto_298974 ) ) ( not ( = ?auto_298969 ?auto_298975 ) ) ( not ( = ?auto_298970 ?auto_298971 ) ) ( not ( = ?auto_298970 ?auto_298972 ) ) ( not ( = ?auto_298970 ?auto_298973 ) ) ( not ( = ?auto_298970 ?auto_298974 ) ) ( not ( = ?auto_298970 ?auto_298975 ) ) ( not ( = ?auto_298971 ?auto_298972 ) ) ( not ( = ?auto_298971 ?auto_298973 ) ) ( not ( = ?auto_298971 ?auto_298974 ) ) ( not ( = ?auto_298971 ?auto_298975 ) ) ( not ( = ?auto_298972 ?auto_298973 ) ) ( not ( = ?auto_298972 ?auto_298974 ) ) ( not ( = ?auto_298972 ?auto_298975 ) ) ( not ( = ?auto_298973 ?auto_298974 ) ) ( not ( = ?auto_298973 ?auto_298975 ) ) ( not ( = ?auto_298974 ?auto_298975 ) ) ( ON ?auto_298973 ?auto_298974 ) ( ON ?auto_298972 ?auto_298973 ) ( ON ?auto_298971 ?auto_298972 ) ( ON ?auto_298970 ?auto_298971 ) ( ON ?auto_298969 ?auto_298970 ) ( ON ?auto_298968 ?auto_298969 ) ( ON ?auto_298967 ?auto_298968 ) ( ON ?auto_298966 ?auto_298967 ) ( CLEAR ?auto_298964 ) ( ON ?auto_298965 ?auto_298966 ) ( CLEAR ?auto_298965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_298963 ?auto_298964 ?auto_298965 )
      ( MAKE-12PILE ?auto_298963 ?auto_298964 ?auto_298965 ?auto_298966 ?auto_298967 ?auto_298968 ?auto_298969 ?auto_298970 ?auto_298971 ?auto_298972 ?auto_298973 ?auto_298974 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_298988 - BLOCK
      ?auto_298989 - BLOCK
      ?auto_298990 - BLOCK
      ?auto_298991 - BLOCK
      ?auto_298992 - BLOCK
      ?auto_298993 - BLOCK
      ?auto_298994 - BLOCK
      ?auto_298995 - BLOCK
      ?auto_298996 - BLOCK
      ?auto_298997 - BLOCK
      ?auto_298998 - BLOCK
      ?auto_298999 - BLOCK
    )
    :vars
    (
      ?auto_299000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_298999 ?auto_299000 ) ( ON-TABLE ?auto_298988 ) ( ON ?auto_298989 ?auto_298988 ) ( not ( = ?auto_298988 ?auto_298989 ) ) ( not ( = ?auto_298988 ?auto_298990 ) ) ( not ( = ?auto_298988 ?auto_298991 ) ) ( not ( = ?auto_298988 ?auto_298992 ) ) ( not ( = ?auto_298988 ?auto_298993 ) ) ( not ( = ?auto_298988 ?auto_298994 ) ) ( not ( = ?auto_298988 ?auto_298995 ) ) ( not ( = ?auto_298988 ?auto_298996 ) ) ( not ( = ?auto_298988 ?auto_298997 ) ) ( not ( = ?auto_298988 ?auto_298998 ) ) ( not ( = ?auto_298988 ?auto_298999 ) ) ( not ( = ?auto_298988 ?auto_299000 ) ) ( not ( = ?auto_298989 ?auto_298990 ) ) ( not ( = ?auto_298989 ?auto_298991 ) ) ( not ( = ?auto_298989 ?auto_298992 ) ) ( not ( = ?auto_298989 ?auto_298993 ) ) ( not ( = ?auto_298989 ?auto_298994 ) ) ( not ( = ?auto_298989 ?auto_298995 ) ) ( not ( = ?auto_298989 ?auto_298996 ) ) ( not ( = ?auto_298989 ?auto_298997 ) ) ( not ( = ?auto_298989 ?auto_298998 ) ) ( not ( = ?auto_298989 ?auto_298999 ) ) ( not ( = ?auto_298989 ?auto_299000 ) ) ( not ( = ?auto_298990 ?auto_298991 ) ) ( not ( = ?auto_298990 ?auto_298992 ) ) ( not ( = ?auto_298990 ?auto_298993 ) ) ( not ( = ?auto_298990 ?auto_298994 ) ) ( not ( = ?auto_298990 ?auto_298995 ) ) ( not ( = ?auto_298990 ?auto_298996 ) ) ( not ( = ?auto_298990 ?auto_298997 ) ) ( not ( = ?auto_298990 ?auto_298998 ) ) ( not ( = ?auto_298990 ?auto_298999 ) ) ( not ( = ?auto_298990 ?auto_299000 ) ) ( not ( = ?auto_298991 ?auto_298992 ) ) ( not ( = ?auto_298991 ?auto_298993 ) ) ( not ( = ?auto_298991 ?auto_298994 ) ) ( not ( = ?auto_298991 ?auto_298995 ) ) ( not ( = ?auto_298991 ?auto_298996 ) ) ( not ( = ?auto_298991 ?auto_298997 ) ) ( not ( = ?auto_298991 ?auto_298998 ) ) ( not ( = ?auto_298991 ?auto_298999 ) ) ( not ( = ?auto_298991 ?auto_299000 ) ) ( not ( = ?auto_298992 ?auto_298993 ) ) ( not ( = ?auto_298992 ?auto_298994 ) ) ( not ( = ?auto_298992 ?auto_298995 ) ) ( not ( = ?auto_298992 ?auto_298996 ) ) ( not ( = ?auto_298992 ?auto_298997 ) ) ( not ( = ?auto_298992 ?auto_298998 ) ) ( not ( = ?auto_298992 ?auto_298999 ) ) ( not ( = ?auto_298992 ?auto_299000 ) ) ( not ( = ?auto_298993 ?auto_298994 ) ) ( not ( = ?auto_298993 ?auto_298995 ) ) ( not ( = ?auto_298993 ?auto_298996 ) ) ( not ( = ?auto_298993 ?auto_298997 ) ) ( not ( = ?auto_298993 ?auto_298998 ) ) ( not ( = ?auto_298993 ?auto_298999 ) ) ( not ( = ?auto_298993 ?auto_299000 ) ) ( not ( = ?auto_298994 ?auto_298995 ) ) ( not ( = ?auto_298994 ?auto_298996 ) ) ( not ( = ?auto_298994 ?auto_298997 ) ) ( not ( = ?auto_298994 ?auto_298998 ) ) ( not ( = ?auto_298994 ?auto_298999 ) ) ( not ( = ?auto_298994 ?auto_299000 ) ) ( not ( = ?auto_298995 ?auto_298996 ) ) ( not ( = ?auto_298995 ?auto_298997 ) ) ( not ( = ?auto_298995 ?auto_298998 ) ) ( not ( = ?auto_298995 ?auto_298999 ) ) ( not ( = ?auto_298995 ?auto_299000 ) ) ( not ( = ?auto_298996 ?auto_298997 ) ) ( not ( = ?auto_298996 ?auto_298998 ) ) ( not ( = ?auto_298996 ?auto_298999 ) ) ( not ( = ?auto_298996 ?auto_299000 ) ) ( not ( = ?auto_298997 ?auto_298998 ) ) ( not ( = ?auto_298997 ?auto_298999 ) ) ( not ( = ?auto_298997 ?auto_299000 ) ) ( not ( = ?auto_298998 ?auto_298999 ) ) ( not ( = ?auto_298998 ?auto_299000 ) ) ( not ( = ?auto_298999 ?auto_299000 ) ) ( ON ?auto_298998 ?auto_298999 ) ( ON ?auto_298997 ?auto_298998 ) ( ON ?auto_298996 ?auto_298997 ) ( ON ?auto_298995 ?auto_298996 ) ( ON ?auto_298994 ?auto_298995 ) ( ON ?auto_298993 ?auto_298994 ) ( ON ?auto_298992 ?auto_298993 ) ( ON ?auto_298991 ?auto_298992 ) ( CLEAR ?auto_298989 ) ( ON ?auto_298990 ?auto_298991 ) ( CLEAR ?auto_298990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_298988 ?auto_298989 ?auto_298990 )
      ( MAKE-12PILE ?auto_298988 ?auto_298989 ?auto_298990 ?auto_298991 ?auto_298992 ?auto_298993 ?auto_298994 ?auto_298995 ?auto_298996 ?auto_298997 ?auto_298998 ?auto_298999 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_299013 - BLOCK
      ?auto_299014 - BLOCK
      ?auto_299015 - BLOCK
      ?auto_299016 - BLOCK
      ?auto_299017 - BLOCK
      ?auto_299018 - BLOCK
      ?auto_299019 - BLOCK
      ?auto_299020 - BLOCK
      ?auto_299021 - BLOCK
      ?auto_299022 - BLOCK
      ?auto_299023 - BLOCK
      ?auto_299024 - BLOCK
    )
    :vars
    (
      ?auto_299025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299024 ?auto_299025 ) ( ON-TABLE ?auto_299013 ) ( not ( = ?auto_299013 ?auto_299014 ) ) ( not ( = ?auto_299013 ?auto_299015 ) ) ( not ( = ?auto_299013 ?auto_299016 ) ) ( not ( = ?auto_299013 ?auto_299017 ) ) ( not ( = ?auto_299013 ?auto_299018 ) ) ( not ( = ?auto_299013 ?auto_299019 ) ) ( not ( = ?auto_299013 ?auto_299020 ) ) ( not ( = ?auto_299013 ?auto_299021 ) ) ( not ( = ?auto_299013 ?auto_299022 ) ) ( not ( = ?auto_299013 ?auto_299023 ) ) ( not ( = ?auto_299013 ?auto_299024 ) ) ( not ( = ?auto_299013 ?auto_299025 ) ) ( not ( = ?auto_299014 ?auto_299015 ) ) ( not ( = ?auto_299014 ?auto_299016 ) ) ( not ( = ?auto_299014 ?auto_299017 ) ) ( not ( = ?auto_299014 ?auto_299018 ) ) ( not ( = ?auto_299014 ?auto_299019 ) ) ( not ( = ?auto_299014 ?auto_299020 ) ) ( not ( = ?auto_299014 ?auto_299021 ) ) ( not ( = ?auto_299014 ?auto_299022 ) ) ( not ( = ?auto_299014 ?auto_299023 ) ) ( not ( = ?auto_299014 ?auto_299024 ) ) ( not ( = ?auto_299014 ?auto_299025 ) ) ( not ( = ?auto_299015 ?auto_299016 ) ) ( not ( = ?auto_299015 ?auto_299017 ) ) ( not ( = ?auto_299015 ?auto_299018 ) ) ( not ( = ?auto_299015 ?auto_299019 ) ) ( not ( = ?auto_299015 ?auto_299020 ) ) ( not ( = ?auto_299015 ?auto_299021 ) ) ( not ( = ?auto_299015 ?auto_299022 ) ) ( not ( = ?auto_299015 ?auto_299023 ) ) ( not ( = ?auto_299015 ?auto_299024 ) ) ( not ( = ?auto_299015 ?auto_299025 ) ) ( not ( = ?auto_299016 ?auto_299017 ) ) ( not ( = ?auto_299016 ?auto_299018 ) ) ( not ( = ?auto_299016 ?auto_299019 ) ) ( not ( = ?auto_299016 ?auto_299020 ) ) ( not ( = ?auto_299016 ?auto_299021 ) ) ( not ( = ?auto_299016 ?auto_299022 ) ) ( not ( = ?auto_299016 ?auto_299023 ) ) ( not ( = ?auto_299016 ?auto_299024 ) ) ( not ( = ?auto_299016 ?auto_299025 ) ) ( not ( = ?auto_299017 ?auto_299018 ) ) ( not ( = ?auto_299017 ?auto_299019 ) ) ( not ( = ?auto_299017 ?auto_299020 ) ) ( not ( = ?auto_299017 ?auto_299021 ) ) ( not ( = ?auto_299017 ?auto_299022 ) ) ( not ( = ?auto_299017 ?auto_299023 ) ) ( not ( = ?auto_299017 ?auto_299024 ) ) ( not ( = ?auto_299017 ?auto_299025 ) ) ( not ( = ?auto_299018 ?auto_299019 ) ) ( not ( = ?auto_299018 ?auto_299020 ) ) ( not ( = ?auto_299018 ?auto_299021 ) ) ( not ( = ?auto_299018 ?auto_299022 ) ) ( not ( = ?auto_299018 ?auto_299023 ) ) ( not ( = ?auto_299018 ?auto_299024 ) ) ( not ( = ?auto_299018 ?auto_299025 ) ) ( not ( = ?auto_299019 ?auto_299020 ) ) ( not ( = ?auto_299019 ?auto_299021 ) ) ( not ( = ?auto_299019 ?auto_299022 ) ) ( not ( = ?auto_299019 ?auto_299023 ) ) ( not ( = ?auto_299019 ?auto_299024 ) ) ( not ( = ?auto_299019 ?auto_299025 ) ) ( not ( = ?auto_299020 ?auto_299021 ) ) ( not ( = ?auto_299020 ?auto_299022 ) ) ( not ( = ?auto_299020 ?auto_299023 ) ) ( not ( = ?auto_299020 ?auto_299024 ) ) ( not ( = ?auto_299020 ?auto_299025 ) ) ( not ( = ?auto_299021 ?auto_299022 ) ) ( not ( = ?auto_299021 ?auto_299023 ) ) ( not ( = ?auto_299021 ?auto_299024 ) ) ( not ( = ?auto_299021 ?auto_299025 ) ) ( not ( = ?auto_299022 ?auto_299023 ) ) ( not ( = ?auto_299022 ?auto_299024 ) ) ( not ( = ?auto_299022 ?auto_299025 ) ) ( not ( = ?auto_299023 ?auto_299024 ) ) ( not ( = ?auto_299023 ?auto_299025 ) ) ( not ( = ?auto_299024 ?auto_299025 ) ) ( ON ?auto_299023 ?auto_299024 ) ( ON ?auto_299022 ?auto_299023 ) ( ON ?auto_299021 ?auto_299022 ) ( ON ?auto_299020 ?auto_299021 ) ( ON ?auto_299019 ?auto_299020 ) ( ON ?auto_299018 ?auto_299019 ) ( ON ?auto_299017 ?auto_299018 ) ( ON ?auto_299016 ?auto_299017 ) ( ON ?auto_299015 ?auto_299016 ) ( CLEAR ?auto_299013 ) ( ON ?auto_299014 ?auto_299015 ) ( CLEAR ?auto_299014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_299013 ?auto_299014 )
      ( MAKE-12PILE ?auto_299013 ?auto_299014 ?auto_299015 ?auto_299016 ?auto_299017 ?auto_299018 ?auto_299019 ?auto_299020 ?auto_299021 ?auto_299022 ?auto_299023 ?auto_299024 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_299038 - BLOCK
      ?auto_299039 - BLOCK
      ?auto_299040 - BLOCK
      ?auto_299041 - BLOCK
      ?auto_299042 - BLOCK
      ?auto_299043 - BLOCK
      ?auto_299044 - BLOCK
      ?auto_299045 - BLOCK
      ?auto_299046 - BLOCK
      ?auto_299047 - BLOCK
      ?auto_299048 - BLOCK
      ?auto_299049 - BLOCK
    )
    :vars
    (
      ?auto_299050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299049 ?auto_299050 ) ( ON-TABLE ?auto_299038 ) ( not ( = ?auto_299038 ?auto_299039 ) ) ( not ( = ?auto_299038 ?auto_299040 ) ) ( not ( = ?auto_299038 ?auto_299041 ) ) ( not ( = ?auto_299038 ?auto_299042 ) ) ( not ( = ?auto_299038 ?auto_299043 ) ) ( not ( = ?auto_299038 ?auto_299044 ) ) ( not ( = ?auto_299038 ?auto_299045 ) ) ( not ( = ?auto_299038 ?auto_299046 ) ) ( not ( = ?auto_299038 ?auto_299047 ) ) ( not ( = ?auto_299038 ?auto_299048 ) ) ( not ( = ?auto_299038 ?auto_299049 ) ) ( not ( = ?auto_299038 ?auto_299050 ) ) ( not ( = ?auto_299039 ?auto_299040 ) ) ( not ( = ?auto_299039 ?auto_299041 ) ) ( not ( = ?auto_299039 ?auto_299042 ) ) ( not ( = ?auto_299039 ?auto_299043 ) ) ( not ( = ?auto_299039 ?auto_299044 ) ) ( not ( = ?auto_299039 ?auto_299045 ) ) ( not ( = ?auto_299039 ?auto_299046 ) ) ( not ( = ?auto_299039 ?auto_299047 ) ) ( not ( = ?auto_299039 ?auto_299048 ) ) ( not ( = ?auto_299039 ?auto_299049 ) ) ( not ( = ?auto_299039 ?auto_299050 ) ) ( not ( = ?auto_299040 ?auto_299041 ) ) ( not ( = ?auto_299040 ?auto_299042 ) ) ( not ( = ?auto_299040 ?auto_299043 ) ) ( not ( = ?auto_299040 ?auto_299044 ) ) ( not ( = ?auto_299040 ?auto_299045 ) ) ( not ( = ?auto_299040 ?auto_299046 ) ) ( not ( = ?auto_299040 ?auto_299047 ) ) ( not ( = ?auto_299040 ?auto_299048 ) ) ( not ( = ?auto_299040 ?auto_299049 ) ) ( not ( = ?auto_299040 ?auto_299050 ) ) ( not ( = ?auto_299041 ?auto_299042 ) ) ( not ( = ?auto_299041 ?auto_299043 ) ) ( not ( = ?auto_299041 ?auto_299044 ) ) ( not ( = ?auto_299041 ?auto_299045 ) ) ( not ( = ?auto_299041 ?auto_299046 ) ) ( not ( = ?auto_299041 ?auto_299047 ) ) ( not ( = ?auto_299041 ?auto_299048 ) ) ( not ( = ?auto_299041 ?auto_299049 ) ) ( not ( = ?auto_299041 ?auto_299050 ) ) ( not ( = ?auto_299042 ?auto_299043 ) ) ( not ( = ?auto_299042 ?auto_299044 ) ) ( not ( = ?auto_299042 ?auto_299045 ) ) ( not ( = ?auto_299042 ?auto_299046 ) ) ( not ( = ?auto_299042 ?auto_299047 ) ) ( not ( = ?auto_299042 ?auto_299048 ) ) ( not ( = ?auto_299042 ?auto_299049 ) ) ( not ( = ?auto_299042 ?auto_299050 ) ) ( not ( = ?auto_299043 ?auto_299044 ) ) ( not ( = ?auto_299043 ?auto_299045 ) ) ( not ( = ?auto_299043 ?auto_299046 ) ) ( not ( = ?auto_299043 ?auto_299047 ) ) ( not ( = ?auto_299043 ?auto_299048 ) ) ( not ( = ?auto_299043 ?auto_299049 ) ) ( not ( = ?auto_299043 ?auto_299050 ) ) ( not ( = ?auto_299044 ?auto_299045 ) ) ( not ( = ?auto_299044 ?auto_299046 ) ) ( not ( = ?auto_299044 ?auto_299047 ) ) ( not ( = ?auto_299044 ?auto_299048 ) ) ( not ( = ?auto_299044 ?auto_299049 ) ) ( not ( = ?auto_299044 ?auto_299050 ) ) ( not ( = ?auto_299045 ?auto_299046 ) ) ( not ( = ?auto_299045 ?auto_299047 ) ) ( not ( = ?auto_299045 ?auto_299048 ) ) ( not ( = ?auto_299045 ?auto_299049 ) ) ( not ( = ?auto_299045 ?auto_299050 ) ) ( not ( = ?auto_299046 ?auto_299047 ) ) ( not ( = ?auto_299046 ?auto_299048 ) ) ( not ( = ?auto_299046 ?auto_299049 ) ) ( not ( = ?auto_299046 ?auto_299050 ) ) ( not ( = ?auto_299047 ?auto_299048 ) ) ( not ( = ?auto_299047 ?auto_299049 ) ) ( not ( = ?auto_299047 ?auto_299050 ) ) ( not ( = ?auto_299048 ?auto_299049 ) ) ( not ( = ?auto_299048 ?auto_299050 ) ) ( not ( = ?auto_299049 ?auto_299050 ) ) ( ON ?auto_299048 ?auto_299049 ) ( ON ?auto_299047 ?auto_299048 ) ( ON ?auto_299046 ?auto_299047 ) ( ON ?auto_299045 ?auto_299046 ) ( ON ?auto_299044 ?auto_299045 ) ( ON ?auto_299043 ?auto_299044 ) ( ON ?auto_299042 ?auto_299043 ) ( ON ?auto_299041 ?auto_299042 ) ( ON ?auto_299040 ?auto_299041 ) ( CLEAR ?auto_299038 ) ( ON ?auto_299039 ?auto_299040 ) ( CLEAR ?auto_299039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_299038 ?auto_299039 )
      ( MAKE-12PILE ?auto_299038 ?auto_299039 ?auto_299040 ?auto_299041 ?auto_299042 ?auto_299043 ?auto_299044 ?auto_299045 ?auto_299046 ?auto_299047 ?auto_299048 ?auto_299049 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_299063 - BLOCK
      ?auto_299064 - BLOCK
      ?auto_299065 - BLOCK
      ?auto_299066 - BLOCK
      ?auto_299067 - BLOCK
      ?auto_299068 - BLOCK
      ?auto_299069 - BLOCK
      ?auto_299070 - BLOCK
      ?auto_299071 - BLOCK
      ?auto_299072 - BLOCK
      ?auto_299073 - BLOCK
      ?auto_299074 - BLOCK
    )
    :vars
    (
      ?auto_299075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299074 ?auto_299075 ) ( not ( = ?auto_299063 ?auto_299064 ) ) ( not ( = ?auto_299063 ?auto_299065 ) ) ( not ( = ?auto_299063 ?auto_299066 ) ) ( not ( = ?auto_299063 ?auto_299067 ) ) ( not ( = ?auto_299063 ?auto_299068 ) ) ( not ( = ?auto_299063 ?auto_299069 ) ) ( not ( = ?auto_299063 ?auto_299070 ) ) ( not ( = ?auto_299063 ?auto_299071 ) ) ( not ( = ?auto_299063 ?auto_299072 ) ) ( not ( = ?auto_299063 ?auto_299073 ) ) ( not ( = ?auto_299063 ?auto_299074 ) ) ( not ( = ?auto_299063 ?auto_299075 ) ) ( not ( = ?auto_299064 ?auto_299065 ) ) ( not ( = ?auto_299064 ?auto_299066 ) ) ( not ( = ?auto_299064 ?auto_299067 ) ) ( not ( = ?auto_299064 ?auto_299068 ) ) ( not ( = ?auto_299064 ?auto_299069 ) ) ( not ( = ?auto_299064 ?auto_299070 ) ) ( not ( = ?auto_299064 ?auto_299071 ) ) ( not ( = ?auto_299064 ?auto_299072 ) ) ( not ( = ?auto_299064 ?auto_299073 ) ) ( not ( = ?auto_299064 ?auto_299074 ) ) ( not ( = ?auto_299064 ?auto_299075 ) ) ( not ( = ?auto_299065 ?auto_299066 ) ) ( not ( = ?auto_299065 ?auto_299067 ) ) ( not ( = ?auto_299065 ?auto_299068 ) ) ( not ( = ?auto_299065 ?auto_299069 ) ) ( not ( = ?auto_299065 ?auto_299070 ) ) ( not ( = ?auto_299065 ?auto_299071 ) ) ( not ( = ?auto_299065 ?auto_299072 ) ) ( not ( = ?auto_299065 ?auto_299073 ) ) ( not ( = ?auto_299065 ?auto_299074 ) ) ( not ( = ?auto_299065 ?auto_299075 ) ) ( not ( = ?auto_299066 ?auto_299067 ) ) ( not ( = ?auto_299066 ?auto_299068 ) ) ( not ( = ?auto_299066 ?auto_299069 ) ) ( not ( = ?auto_299066 ?auto_299070 ) ) ( not ( = ?auto_299066 ?auto_299071 ) ) ( not ( = ?auto_299066 ?auto_299072 ) ) ( not ( = ?auto_299066 ?auto_299073 ) ) ( not ( = ?auto_299066 ?auto_299074 ) ) ( not ( = ?auto_299066 ?auto_299075 ) ) ( not ( = ?auto_299067 ?auto_299068 ) ) ( not ( = ?auto_299067 ?auto_299069 ) ) ( not ( = ?auto_299067 ?auto_299070 ) ) ( not ( = ?auto_299067 ?auto_299071 ) ) ( not ( = ?auto_299067 ?auto_299072 ) ) ( not ( = ?auto_299067 ?auto_299073 ) ) ( not ( = ?auto_299067 ?auto_299074 ) ) ( not ( = ?auto_299067 ?auto_299075 ) ) ( not ( = ?auto_299068 ?auto_299069 ) ) ( not ( = ?auto_299068 ?auto_299070 ) ) ( not ( = ?auto_299068 ?auto_299071 ) ) ( not ( = ?auto_299068 ?auto_299072 ) ) ( not ( = ?auto_299068 ?auto_299073 ) ) ( not ( = ?auto_299068 ?auto_299074 ) ) ( not ( = ?auto_299068 ?auto_299075 ) ) ( not ( = ?auto_299069 ?auto_299070 ) ) ( not ( = ?auto_299069 ?auto_299071 ) ) ( not ( = ?auto_299069 ?auto_299072 ) ) ( not ( = ?auto_299069 ?auto_299073 ) ) ( not ( = ?auto_299069 ?auto_299074 ) ) ( not ( = ?auto_299069 ?auto_299075 ) ) ( not ( = ?auto_299070 ?auto_299071 ) ) ( not ( = ?auto_299070 ?auto_299072 ) ) ( not ( = ?auto_299070 ?auto_299073 ) ) ( not ( = ?auto_299070 ?auto_299074 ) ) ( not ( = ?auto_299070 ?auto_299075 ) ) ( not ( = ?auto_299071 ?auto_299072 ) ) ( not ( = ?auto_299071 ?auto_299073 ) ) ( not ( = ?auto_299071 ?auto_299074 ) ) ( not ( = ?auto_299071 ?auto_299075 ) ) ( not ( = ?auto_299072 ?auto_299073 ) ) ( not ( = ?auto_299072 ?auto_299074 ) ) ( not ( = ?auto_299072 ?auto_299075 ) ) ( not ( = ?auto_299073 ?auto_299074 ) ) ( not ( = ?auto_299073 ?auto_299075 ) ) ( not ( = ?auto_299074 ?auto_299075 ) ) ( ON ?auto_299073 ?auto_299074 ) ( ON ?auto_299072 ?auto_299073 ) ( ON ?auto_299071 ?auto_299072 ) ( ON ?auto_299070 ?auto_299071 ) ( ON ?auto_299069 ?auto_299070 ) ( ON ?auto_299068 ?auto_299069 ) ( ON ?auto_299067 ?auto_299068 ) ( ON ?auto_299066 ?auto_299067 ) ( ON ?auto_299065 ?auto_299066 ) ( ON ?auto_299064 ?auto_299065 ) ( ON ?auto_299063 ?auto_299064 ) ( CLEAR ?auto_299063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_299063 )
      ( MAKE-12PILE ?auto_299063 ?auto_299064 ?auto_299065 ?auto_299066 ?auto_299067 ?auto_299068 ?auto_299069 ?auto_299070 ?auto_299071 ?auto_299072 ?auto_299073 ?auto_299074 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_299088 - BLOCK
      ?auto_299089 - BLOCK
      ?auto_299090 - BLOCK
      ?auto_299091 - BLOCK
      ?auto_299092 - BLOCK
      ?auto_299093 - BLOCK
      ?auto_299094 - BLOCK
      ?auto_299095 - BLOCK
      ?auto_299096 - BLOCK
      ?auto_299097 - BLOCK
      ?auto_299098 - BLOCK
      ?auto_299099 - BLOCK
    )
    :vars
    (
      ?auto_299100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299099 ?auto_299100 ) ( not ( = ?auto_299088 ?auto_299089 ) ) ( not ( = ?auto_299088 ?auto_299090 ) ) ( not ( = ?auto_299088 ?auto_299091 ) ) ( not ( = ?auto_299088 ?auto_299092 ) ) ( not ( = ?auto_299088 ?auto_299093 ) ) ( not ( = ?auto_299088 ?auto_299094 ) ) ( not ( = ?auto_299088 ?auto_299095 ) ) ( not ( = ?auto_299088 ?auto_299096 ) ) ( not ( = ?auto_299088 ?auto_299097 ) ) ( not ( = ?auto_299088 ?auto_299098 ) ) ( not ( = ?auto_299088 ?auto_299099 ) ) ( not ( = ?auto_299088 ?auto_299100 ) ) ( not ( = ?auto_299089 ?auto_299090 ) ) ( not ( = ?auto_299089 ?auto_299091 ) ) ( not ( = ?auto_299089 ?auto_299092 ) ) ( not ( = ?auto_299089 ?auto_299093 ) ) ( not ( = ?auto_299089 ?auto_299094 ) ) ( not ( = ?auto_299089 ?auto_299095 ) ) ( not ( = ?auto_299089 ?auto_299096 ) ) ( not ( = ?auto_299089 ?auto_299097 ) ) ( not ( = ?auto_299089 ?auto_299098 ) ) ( not ( = ?auto_299089 ?auto_299099 ) ) ( not ( = ?auto_299089 ?auto_299100 ) ) ( not ( = ?auto_299090 ?auto_299091 ) ) ( not ( = ?auto_299090 ?auto_299092 ) ) ( not ( = ?auto_299090 ?auto_299093 ) ) ( not ( = ?auto_299090 ?auto_299094 ) ) ( not ( = ?auto_299090 ?auto_299095 ) ) ( not ( = ?auto_299090 ?auto_299096 ) ) ( not ( = ?auto_299090 ?auto_299097 ) ) ( not ( = ?auto_299090 ?auto_299098 ) ) ( not ( = ?auto_299090 ?auto_299099 ) ) ( not ( = ?auto_299090 ?auto_299100 ) ) ( not ( = ?auto_299091 ?auto_299092 ) ) ( not ( = ?auto_299091 ?auto_299093 ) ) ( not ( = ?auto_299091 ?auto_299094 ) ) ( not ( = ?auto_299091 ?auto_299095 ) ) ( not ( = ?auto_299091 ?auto_299096 ) ) ( not ( = ?auto_299091 ?auto_299097 ) ) ( not ( = ?auto_299091 ?auto_299098 ) ) ( not ( = ?auto_299091 ?auto_299099 ) ) ( not ( = ?auto_299091 ?auto_299100 ) ) ( not ( = ?auto_299092 ?auto_299093 ) ) ( not ( = ?auto_299092 ?auto_299094 ) ) ( not ( = ?auto_299092 ?auto_299095 ) ) ( not ( = ?auto_299092 ?auto_299096 ) ) ( not ( = ?auto_299092 ?auto_299097 ) ) ( not ( = ?auto_299092 ?auto_299098 ) ) ( not ( = ?auto_299092 ?auto_299099 ) ) ( not ( = ?auto_299092 ?auto_299100 ) ) ( not ( = ?auto_299093 ?auto_299094 ) ) ( not ( = ?auto_299093 ?auto_299095 ) ) ( not ( = ?auto_299093 ?auto_299096 ) ) ( not ( = ?auto_299093 ?auto_299097 ) ) ( not ( = ?auto_299093 ?auto_299098 ) ) ( not ( = ?auto_299093 ?auto_299099 ) ) ( not ( = ?auto_299093 ?auto_299100 ) ) ( not ( = ?auto_299094 ?auto_299095 ) ) ( not ( = ?auto_299094 ?auto_299096 ) ) ( not ( = ?auto_299094 ?auto_299097 ) ) ( not ( = ?auto_299094 ?auto_299098 ) ) ( not ( = ?auto_299094 ?auto_299099 ) ) ( not ( = ?auto_299094 ?auto_299100 ) ) ( not ( = ?auto_299095 ?auto_299096 ) ) ( not ( = ?auto_299095 ?auto_299097 ) ) ( not ( = ?auto_299095 ?auto_299098 ) ) ( not ( = ?auto_299095 ?auto_299099 ) ) ( not ( = ?auto_299095 ?auto_299100 ) ) ( not ( = ?auto_299096 ?auto_299097 ) ) ( not ( = ?auto_299096 ?auto_299098 ) ) ( not ( = ?auto_299096 ?auto_299099 ) ) ( not ( = ?auto_299096 ?auto_299100 ) ) ( not ( = ?auto_299097 ?auto_299098 ) ) ( not ( = ?auto_299097 ?auto_299099 ) ) ( not ( = ?auto_299097 ?auto_299100 ) ) ( not ( = ?auto_299098 ?auto_299099 ) ) ( not ( = ?auto_299098 ?auto_299100 ) ) ( not ( = ?auto_299099 ?auto_299100 ) ) ( ON ?auto_299098 ?auto_299099 ) ( ON ?auto_299097 ?auto_299098 ) ( ON ?auto_299096 ?auto_299097 ) ( ON ?auto_299095 ?auto_299096 ) ( ON ?auto_299094 ?auto_299095 ) ( ON ?auto_299093 ?auto_299094 ) ( ON ?auto_299092 ?auto_299093 ) ( ON ?auto_299091 ?auto_299092 ) ( ON ?auto_299090 ?auto_299091 ) ( ON ?auto_299089 ?auto_299090 ) ( ON ?auto_299088 ?auto_299089 ) ( CLEAR ?auto_299088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_299088 )
      ( MAKE-12PILE ?auto_299088 ?auto_299089 ?auto_299090 ?auto_299091 ?auto_299092 ?auto_299093 ?auto_299094 ?auto_299095 ?auto_299096 ?auto_299097 ?auto_299098 ?auto_299099 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_299114 - BLOCK
      ?auto_299115 - BLOCK
      ?auto_299116 - BLOCK
      ?auto_299117 - BLOCK
      ?auto_299118 - BLOCK
      ?auto_299119 - BLOCK
      ?auto_299120 - BLOCK
      ?auto_299121 - BLOCK
      ?auto_299122 - BLOCK
      ?auto_299123 - BLOCK
      ?auto_299124 - BLOCK
      ?auto_299125 - BLOCK
      ?auto_299126 - BLOCK
    )
    :vars
    (
      ?auto_299127 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_299125 ) ( ON ?auto_299126 ?auto_299127 ) ( CLEAR ?auto_299126 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_299114 ) ( ON ?auto_299115 ?auto_299114 ) ( ON ?auto_299116 ?auto_299115 ) ( ON ?auto_299117 ?auto_299116 ) ( ON ?auto_299118 ?auto_299117 ) ( ON ?auto_299119 ?auto_299118 ) ( ON ?auto_299120 ?auto_299119 ) ( ON ?auto_299121 ?auto_299120 ) ( ON ?auto_299122 ?auto_299121 ) ( ON ?auto_299123 ?auto_299122 ) ( ON ?auto_299124 ?auto_299123 ) ( ON ?auto_299125 ?auto_299124 ) ( not ( = ?auto_299114 ?auto_299115 ) ) ( not ( = ?auto_299114 ?auto_299116 ) ) ( not ( = ?auto_299114 ?auto_299117 ) ) ( not ( = ?auto_299114 ?auto_299118 ) ) ( not ( = ?auto_299114 ?auto_299119 ) ) ( not ( = ?auto_299114 ?auto_299120 ) ) ( not ( = ?auto_299114 ?auto_299121 ) ) ( not ( = ?auto_299114 ?auto_299122 ) ) ( not ( = ?auto_299114 ?auto_299123 ) ) ( not ( = ?auto_299114 ?auto_299124 ) ) ( not ( = ?auto_299114 ?auto_299125 ) ) ( not ( = ?auto_299114 ?auto_299126 ) ) ( not ( = ?auto_299114 ?auto_299127 ) ) ( not ( = ?auto_299115 ?auto_299116 ) ) ( not ( = ?auto_299115 ?auto_299117 ) ) ( not ( = ?auto_299115 ?auto_299118 ) ) ( not ( = ?auto_299115 ?auto_299119 ) ) ( not ( = ?auto_299115 ?auto_299120 ) ) ( not ( = ?auto_299115 ?auto_299121 ) ) ( not ( = ?auto_299115 ?auto_299122 ) ) ( not ( = ?auto_299115 ?auto_299123 ) ) ( not ( = ?auto_299115 ?auto_299124 ) ) ( not ( = ?auto_299115 ?auto_299125 ) ) ( not ( = ?auto_299115 ?auto_299126 ) ) ( not ( = ?auto_299115 ?auto_299127 ) ) ( not ( = ?auto_299116 ?auto_299117 ) ) ( not ( = ?auto_299116 ?auto_299118 ) ) ( not ( = ?auto_299116 ?auto_299119 ) ) ( not ( = ?auto_299116 ?auto_299120 ) ) ( not ( = ?auto_299116 ?auto_299121 ) ) ( not ( = ?auto_299116 ?auto_299122 ) ) ( not ( = ?auto_299116 ?auto_299123 ) ) ( not ( = ?auto_299116 ?auto_299124 ) ) ( not ( = ?auto_299116 ?auto_299125 ) ) ( not ( = ?auto_299116 ?auto_299126 ) ) ( not ( = ?auto_299116 ?auto_299127 ) ) ( not ( = ?auto_299117 ?auto_299118 ) ) ( not ( = ?auto_299117 ?auto_299119 ) ) ( not ( = ?auto_299117 ?auto_299120 ) ) ( not ( = ?auto_299117 ?auto_299121 ) ) ( not ( = ?auto_299117 ?auto_299122 ) ) ( not ( = ?auto_299117 ?auto_299123 ) ) ( not ( = ?auto_299117 ?auto_299124 ) ) ( not ( = ?auto_299117 ?auto_299125 ) ) ( not ( = ?auto_299117 ?auto_299126 ) ) ( not ( = ?auto_299117 ?auto_299127 ) ) ( not ( = ?auto_299118 ?auto_299119 ) ) ( not ( = ?auto_299118 ?auto_299120 ) ) ( not ( = ?auto_299118 ?auto_299121 ) ) ( not ( = ?auto_299118 ?auto_299122 ) ) ( not ( = ?auto_299118 ?auto_299123 ) ) ( not ( = ?auto_299118 ?auto_299124 ) ) ( not ( = ?auto_299118 ?auto_299125 ) ) ( not ( = ?auto_299118 ?auto_299126 ) ) ( not ( = ?auto_299118 ?auto_299127 ) ) ( not ( = ?auto_299119 ?auto_299120 ) ) ( not ( = ?auto_299119 ?auto_299121 ) ) ( not ( = ?auto_299119 ?auto_299122 ) ) ( not ( = ?auto_299119 ?auto_299123 ) ) ( not ( = ?auto_299119 ?auto_299124 ) ) ( not ( = ?auto_299119 ?auto_299125 ) ) ( not ( = ?auto_299119 ?auto_299126 ) ) ( not ( = ?auto_299119 ?auto_299127 ) ) ( not ( = ?auto_299120 ?auto_299121 ) ) ( not ( = ?auto_299120 ?auto_299122 ) ) ( not ( = ?auto_299120 ?auto_299123 ) ) ( not ( = ?auto_299120 ?auto_299124 ) ) ( not ( = ?auto_299120 ?auto_299125 ) ) ( not ( = ?auto_299120 ?auto_299126 ) ) ( not ( = ?auto_299120 ?auto_299127 ) ) ( not ( = ?auto_299121 ?auto_299122 ) ) ( not ( = ?auto_299121 ?auto_299123 ) ) ( not ( = ?auto_299121 ?auto_299124 ) ) ( not ( = ?auto_299121 ?auto_299125 ) ) ( not ( = ?auto_299121 ?auto_299126 ) ) ( not ( = ?auto_299121 ?auto_299127 ) ) ( not ( = ?auto_299122 ?auto_299123 ) ) ( not ( = ?auto_299122 ?auto_299124 ) ) ( not ( = ?auto_299122 ?auto_299125 ) ) ( not ( = ?auto_299122 ?auto_299126 ) ) ( not ( = ?auto_299122 ?auto_299127 ) ) ( not ( = ?auto_299123 ?auto_299124 ) ) ( not ( = ?auto_299123 ?auto_299125 ) ) ( not ( = ?auto_299123 ?auto_299126 ) ) ( not ( = ?auto_299123 ?auto_299127 ) ) ( not ( = ?auto_299124 ?auto_299125 ) ) ( not ( = ?auto_299124 ?auto_299126 ) ) ( not ( = ?auto_299124 ?auto_299127 ) ) ( not ( = ?auto_299125 ?auto_299126 ) ) ( not ( = ?auto_299125 ?auto_299127 ) ) ( not ( = ?auto_299126 ?auto_299127 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_299126 ?auto_299127 )
      ( !STACK ?auto_299126 ?auto_299125 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_299141 - BLOCK
      ?auto_299142 - BLOCK
      ?auto_299143 - BLOCK
      ?auto_299144 - BLOCK
      ?auto_299145 - BLOCK
      ?auto_299146 - BLOCK
      ?auto_299147 - BLOCK
      ?auto_299148 - BLOCK
      ?auto_299149 - BLOCK
      ?auto_299150 - BLOCK
      ?auto_299151 - BLOCK
      ?auto_299152 - BLOCK
      ?auto_299153 - BLOCK
    )
    :vars
    (
      ?auto_299154 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_299152 ) ( ON ?auto_299153 ?auto_299154 ) ( CLEAR ?auto_299153 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_299141 ) ( ON ?auto_299142 ?auto_299141 ) ( ON ?auto_299143 ?auto_299142 ) ( ON ?auto_299144 ?auto_299143 ) ( ON ?auto_299145 ?auto_299144 ) ( ON ?auto_299146 ?auto_299145 ) ( ON ?auto_299147 ?auto_299146 ) ( ON ?auto_299148 ?auto_299147 ) ( ON ?auto_299149 ?auto_299148 ) ( ON ?auto_299150 ?auto_299149 ) ( ON ?auto_299151 ?auto_299150 ) ( ON ?auto_299152 ?auto_299151 ) ( not ( = ?auto_299141 ?auto_299142 ) ) ( not ( = ?auto_299141 ?auto_299143 ) ) ( not ( = ?auto_299141 ?auto_299144 ) ) ( not ( = ?auto_299141 ?auto_299145 ) ) ( not ( = ?auto_299141 ?auto_299146 ) ) ( not ( = ?auto_299141 ?auto_299147 ) ) ( not ( = ?auto_299141 ?auto_299148 ) ) ( not ( = ?auto_299141 ?auto_299149 ) ) ( not ( = ?auto_299141 ?auto_299150 ) ) ( not ( = ?auto_299141 ?auto_299151 ) ) ( not ( = ?auto_299141 ?auto_299152 ) ) ( not ( = ?auto_299141 ?auto_299153 ) ) ( not ( = ?auto_299141 ?auto_299154 ) ) ( not ( = ?auto_299142 ?auto_299143 ) ) ( not ( = ?auto_299142 ?auto_299144 ) ) ( not ( = ?auto_299142 ?auto_299145 ) ) ( not ( = ?auto_299142 ?auto_299146 ) ) ( not ( = ?auto_299142 ?auto_299147 ) ) ( not ( = ?auto_299142 ?auto_299148 ) ) ( not ( = ?auto_299142 ?auto_299149 ) ) ( not ( = ?auto_299142 ?auto_299150 ) ) ( not ( = ?auto_299142 ?auto_299151 ) ) ( not ( = ?auto_299142 ?auto_299152 ) ) ( not ( = ?auto_299142 ?auto_299153 ) ) ( not ( = ?auto_299142 ?auto_299154 ) ) ( not ( = ?auto_299143 ?auto_299144 ) ) ( not ( = ?auto_299143 ?auto_299145 ) ) ( not ( = ?auto_299143 ?auto_299146 ) ) ( not ( = ?auto_299143 ?auto_299147 ) ) ( not ( = ?auto_299143 ?auto_299148 ) ) ( not ( = ?auto_299143 ?auto_299149 ) ) ( not ( = ?auto_299143 ?auto_299150 ) ) ( not ( = ?auto_299143 ?auto_299151 ) ) ( not ( = ?auto_299143 ?auto_299152 ) ) ( not ( = ?auto_299143 ?auto_299153 ) ) ( not ( = ?auto_299143 ?auto_299154 ) ) ( not ( = ?auto_299144 ?auto_299145 ) ) ( not ( = ?auto_299144 ?auto_299146 ) ) ( not ( = ?auto_299144 ?auto_299147 ) ) ( not ( = ?auto_299144 ?auto_299148 ) ) ( not ( = ?auto_299144 ?auto_299149 ) ) ( not ( = ?auto_299144 ?auto_299150 ) ) ( not ( = ?auto_299144 ?auto_299151 ) ) ( not ( = ?auto_299144 ?auto_299152 ) ) ( not ( = ?auto_299144 ?auto_299153 ) ) ( not ( = ?auto_299144 ?auto_299154 ) ) ( not ( = ?auto_299145 ?auto_299146 ) ) ( not ( = ?auto_299145 ?auto_299147 ) ) ( not ( = ?auto_299145 ?auto_299148 ) ) ( not ( = ?auto_299145 ?auto_299149 ) ) ( not ( = ?auto_299145 ?auto_299150 ) ) ( not ( = ?auto_299145 ?auto_299151 ) ) ( not ( = ?auto_299145 ?auto_299152 ) ) ( not ( = ?auto_299145 ?auto_299153 ) ) ( not ( = ?auto_299145 ?auto_299154 ) ) ( not ( = ?auto_299146 ?auto_299147 ) ) ( not ( = ?auto_299146 ?auto_299148 ) ) ( not ( = ?auto_299146 ?auto_299149 ) ) ( not ( = ?auto_299146 ?auto_299150 ) ) ( not ( = ?auto_299146 ?auto_299151 ) ) ( not ( = ?auto_299146 ?auto_299152 ) ) ( not ( = ?auto_299146 ?auto_299153 ) ) ( not ( = ?auto_299146 ?auto_299154 ) ) ( not ( = ?auto_299147 ?auto_299148 ) ) ( not ( = ?auto_299147 ?auto_299149 ) ) ( not ( = ?auto_299147 ?auto_299150 ) ) ( not ( = ?auto_299147 ?auto_299151 ) ) ( not ( = ?auto_299147 ?auto_299152 ) ) ( not ( = ?auto_299147 ?auto_299153 ) ) ( not ( = ?auto_299147 ?auto_299154 ) ) ( not ( = ?auto_299148 ?auto_299149 ) ) ( not ( = ?auto_299148 ?auto_299150 ) ) ( not ( = ?auto_299148 ?auto_299151 ) ) ( not ( = ?auto_299148 ?auto_299152 ) ) ( not ( = ?auto_299148 ?auto_299153 ) ) ( not ( = ?auto_299148 ?auto_299154 ) ) ( not ( = ?auto_299149 ?auto_299150 ) ) ( not ( = ?auto_299149 ?auto_299151 ) ) ( not ( = ?auto_299149 ?auto_299152 ) ) ( not ( = ?auto_299149 ?auto_299153 ) ) ( not ( = ?auto_299149 ?auto_299154 ) ) ( not ( = ?auto_299150 ?auto_299151 ) ) ( not ( = ?auto_299150 ?auto_299152 ) ) ( not ( = ?auto_299150 ?auto_299153 ) ) ( not ( = ?auto_299150 ?auto_299154 ) ) ( not ( = ?auto_299151 ?auto_299152 ) ) ( not ( = ?auto_299151 ?auto_299153 ) ) ( not ( = ?auto_299151 ?auto_299154 ) ) ( not ( = ?auto_299152 ?auto_299153 ) ) ( not ( = ?auto_299152 ?auto_299154 ) ) ( not ( = ?auto_299153 ?auto_299154 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_299153 ?auto_299154 )
      ( !STACK ?auto_299153 ?auto_299152 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_299168 - BLOCK
      ?auto_299169 - BLOCK
      ?auto_299170 - BLOCK
      ?auto_299171 - BLOCK
      ?auto_299172 - BLOCK
      ?auto_299173 - BLOCK
      ?auto_299174 - BLOCK
      ?auto_299175 - BLOCK
      ?auto_299176 - BLOCK
      ?auto_299177 - BLOCK
      ?auto_299178 - BLOCK
      ?auto_299179 - BLOCK
      ?auto_299180 - BLOCK
    )
    :vars
    (
      ?auto_299181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299180 ?auto_299181 ) ( ON-TABLE ?auto_299168 ) ( ON ?auto_299169 ?auto_299168 ) ( ON ?auto_299170 ?auto_299169 ) ( ON ?auto_299171 ?auto_299170 ) ( ON ?auto_299172 ?auto_299171 ) ( ON ?auto_299173 ?auto_299172 ) ( ON ?auto_299174 ?auto_299173 ) ( ON ?auto_299175 ?auto_299174 ) ( ON ?auto_299176 ?auto_299175 ) ( ON ?auto_299177 ?auto_299176 ) ( ON ?auto_299178 ?auto_299177 ) ( not ( = ?auto_299168 ?auto_299169 ) ) ( not ( = ?auto_299168 ?auto_299170 ) ) ( not ( = ?auto_299168 ?auto_299171 ) ) ( not ( = ?auto_299168 ?auto_299172 ) ) ( not ( = ?auto_299168 ?auto_299173 ) ) ( not ( = ?auto_299168 ?auto_299174 ) ) ( not ( = ?auto_299168 ?auto_299175 ) ) ( not ( = ?auto_299168 ?auto_299176 ) ) ( not ( = ?auto_299168 ?auto_299177 ) ) ( not ( = ?auto_299168 ?auto_299178 ) ) ( not ( = ?auto_299168 ?auto_299179 ) ) ( not ( = ?auto_299168 ?auto_299180 ) ) ( not ( = ?auto_299168 ?auto_299181 ) ) ( not ( = ?auto_299169 ?auto_299170 ) ) ( not ( = ?auto_299169 ?auto_299171 ) ) ( not ( = ?auto_299169 ?auto_299172 ) ) ( not ( = ?auto_299169 ?auto_299173 ) ) ( not ( = ?auto_299169 ?auto_299174 ) ) ( not ( = ?auto_299169 ?auto_299175 ) ) ( not ( = ?auto_299169 ?auto_299176 ) ) ( not ( = ?auto_299169 ?auto_299177 ) ) ( not ( = ?auto_299169 ?auto_299178 ) ) ( not ( = ?auto_299169 ?auto_299179 ) ) ( not ( = ?auto_299169 ?auto_299180 ) ) ( not ( = ?auto_299169 ?auto_299181 ) ) ( not ( = ?auto_299170 ?auto_299171 ) ) ( not ( = ?auto_299170 ?auto_299172 ) ) ( not ( = ?auto_299170 ?auto_299173 ) ) ( not ( = ?auto_299170 ?auto_299174 ) ) ( not ( = ?auto_299170 ?auto_299175 ) ) ( not ( = ?auto_299170 ?auto_299176 ) ) ( not ( = ?auto_299170 ?auto_299177 ) ) ( not ( = ?auto_299170 ?auto_299178 ) ) ( not ( = ?auto_299170 ?auto_299179 ) ) ( not ( = ?auto_299170 ?auto_299180 ) ) ( not ( = ?auto_299170 ?auto_299181 ) ) ( not ( = ?auto_299171 ?auto_299172 ) ) ( not ( = ?auto_299171 ?auto_299173 ) ) ( not ( = ?auto_299171 ?auto_299174 ) ) ( not ( = ?auto_299171 ?auto_299175 ) ) ( not ( = ?auto_299171 ?auto_299176 ) ) ( not ( = ?auto_299171 ?auto_299177 ) ) ( not ( = ?auto_299171 ?auto_299178 ) ) ( not ( = ?auto_299171 ?auto_299179 ) ) ( not ( = ?auto_299171 ?auto_299180 ) ) ( not ( = ?auto_299171 ?auto_299181 ) ) ( not ( = ?auto_299172 ?auto_299173 ) ) ( not ( = ?auto_299172 ?auto_299174 ) ) ( not ( = ?auto_299172 ?auto_299175 ) ) ( not ( = ?auto_299172 ?auto_299176 ) ) ( not ( = ?auto_299172 ?auto_299177 ) ) ( not ( = ?auto_299172 ?auto_299178 ) ) ( not ( = ?auto_299172 ?auto_299179 ) ) ( not ( = ?auto_299172 ?auto_299180 ) ) ( not ( = ?auto_299172 ?auto_299181 ) ) ( not ( = ?auto_299173 ?auto_299174 ) ) ( not ( = ?auto_299173 ?auto_299175 ) ) ( not ( = ?auto_299173 ?auto_299176 ) ) ( not ( = ?auto_299173 ?auto_299177 ) ) ( not ( = ?auto_299173 ?auto_299178 ) ) ( not ( = ?auto_299173 ?auto_299179 ) ) ( not ( = ?auto_299173 ?auto_299180 ) ) ( not ( = ?auto_299173 ?auto_299181 ) ) ( not ( = ?auto_299174 ?auto_299175 ) ) ( not ( = ?auto_299174 ?auto_299176 ) ) ( not ( = ?auto_299174 ?auto_299177 ) ) ( not ( = ?auto_299174 ?auto_299178 ) ) ( not ( = ?auto_299174 ?auto_299179 ) ) ( not ( = ?auto_299174 ?auto_299180 ) ) ( not ( = ?auto_299174 ?auto_299181 ) ) ( not ( = ?auto_299175 ?auto_299176 ) ) ( not ( = ?auto_299175 ?auto_299177 ) ) ( not ( = ?auto_299175 ?auto_299178 ) ) ( not ( = ?auto_299175 ?auto_299179 ) ) ( not ( = ?auto_299175 ?auto_299180 ) ) ( not ( = ?auto_299175 ?auto_299181 ) ) ( not ( = ?auto_299176 ?auto_299177 ) ) ( not ( = ?auto_299176 ?auto_299178 ) ) ( not ( = ?auto_299176 ?auto_299179 ) ) ( not ( = ?auto_299176 ?auto_299180 ) ) ( not ( = ?auto_299176 ?auto_299181 ) ) ( not ( = ?auto_299177 ?auto_299178 ) ) ( not ( = ?auto_299177 ?auto_299179 ) ) ( not ( = ?auto_299177 ?auto_299180 ) ) ( not ( = ?auto_299177 ?auto_299181 ) ) ( not ( = ?auto_299178 ?auto_299179 ) ) ( not ( = ?auto_299178 ?auto_299180 ) ) ( not ( = ?auto_299178 ?auto_299181 ) ) ( not ( = ?auto_299179 ?auto_299180 ) ) ( not ( = ?auto_299179 ?auto_299181 ) ) ( not ( = ?auto_299180 ?auto_299181 ) ) ( CLEAR ?auto_299178 ) ( ON ?auto_299179 ?auto_299180 ) ( CLEAR ?auto_299179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_299168 ?auto_299169 ?auto_299170 ?auto_299171 ?auto_299172 ?auto_299173 ?auto_299174 ?auto_299175 ?auto_299176 ?auto_299177 ?auto_299178 ?auto_299179 )
      ( MAKE-13PILE ?auto_299168 ?auto_299169 ?auto_299170 ?auto_299171 ?auto_299172 ?auto_299173 ?auto_299174 ?auto_299175 ?auto_299176 ?auto_299177 ?auto_299178 ?auto_299179 ?auto_299180 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_299195 - BLOCK
      ?auto_299196 - BLOCK
      ?auto_299197 - BLOCK
      ?auto_299198 - BLOCK
      ?auto_299199 - BLOCK
      ?auto_299200 - BLOCK
      ?auto_299201 - BLOCK
      ?auto_299202 - BLOCK
      ?auto_299203 - BLOCK
      ?auto_299204 - BLOCK
      ?auto_299205 - BLOCK
      ?auto_299206 - BLOCK
      ?auto_299207 - BLOCK
    )
    :vars
    (
      ?auto_299208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299207 ?auto_299208 ) ( ON-TABLE ?auto_299195 ) ( ON ?auto_299196 ?auto_299195 ) ( ON ?auto_299197 ?auto_299196 ) ( ON ?auto_299198 ?auto_299197 ) ( ON ?auto_299199 ?auto_299198 ) ( ON ?auto_299200 ?auto_299199 ) ( ON ?auto_299201 ?auto_299200 ) ( ON ?auto_299202 ?auto_299201 ) ( ON ?auto_299203 ?auto_299202 ) ( ON ?auto_299204 ?auto_299203 ) ( ON ?auto_299205 ?auto_299204 ) ( not ( = ?auto_299195 ?auto_299196 ) ) ( not ( = ?auto_299195 ?auto_299197 ) ) ( not ( = ?auto_299195 ?auto_299198 ) ) ( not ( = ?auto_299195 ?auto_299199 ) ) ( not ( = ?auto_299195 ?auto_299200 ) ) ( not ( = ?auto_299195 ?auto_299201 ) ) ( not ( = ?auto_299195 ?auto_299202 ) ) ( not ( = ?auto_299195 ?auto_299203 ) ) ( not ( = ?auto_299195 ?auto_299204 ) ) ( not ( = ?auto_299195 ?auto_299205 ) ) ( not ( = ?auto_299195 ?auto_299206 ) ) ( not ( = ?auto_299195 ?auto_299207 ) ) ( not ( = ?auto_299195 ?auto_299208 ) ) ( not ( = ?auto_299196 ?auto_299197 ) ) ( not ( = ?auto_299196 ?auto_299198 ) ) ( not ( = ?auto_299196 ?auto_299199 ) ) ( not ( = ?auto_299196 ?auto_299200 ) ) ( not ( = ?auto_299196 ?auto_299201 ) ) ( not ( = ?auto_299196 ?auto_299202 ) ) ( not ( = ?auto_299196 ?auto_299203 ) ) ( not ( = ?auto_299196 ?auto_299204 ) ) ( not ( = ?auto_299196 ?auto_299205 ) ) ( not ( = ?auto_299196 ?auto_299206 ) ) ( not ( = ?auto_299196 ?auto_299207 ) ) ( not ( = ?auto_299196 ?auto_299208 ) ) ( not ( = ?auto_299197 ?auto_299198 ) ) ( not ( = ?auto_299197 ?auto_299199 ) ) ( not ( = ?auto_299197 ?auto_299200 ) ) ( not ( = ?auto_299197 ?auto_299201 ) ) ( not ( = ?auto_299197 ?auto_299202 ) ) ( not ( = ?auto_299197 ?auto_299203 ) ) ( not ( = ?auto_299197 ?auto_299204 ) ) ( not ( = ?auto_299197 ?auto_299205 ) ) ( not ( = ?auto_299197 ?auto_299206 ) ) ( not ( = ?auto_299197 ?auto_299207 ) ) ( not ( = ?auto_299197 ?auto_299208 ) ) ( not ( = ?auto_299198 ?auto_299199 ) ) ( not ( = ?auto_299198 ?auto_299200 ) ) ( not ( = ?auto_299198 ?auto_299201 ) ) ( not ( = ?auto_299198 ?auto_299202 ) ) ( not ( = ?auto_299198 ?auto_299203 ) ) ( not ( = ?auto_299198 ?auto_299204 ) ) ( not ( = ?auto_299198 ?auto_299205 ) ) ( not ( = ?auto_299198 ?auto_299206 ) ) ( not ( = ?auto_299198 ?auto_299207 ) ) ( not ( = ?auto_299198 ?auto_299208 ) ) ( not ( = ?auto_299199 ?auto_299200 ) ) ( not ( = ?auto_299199 ?auto_299201 ) ) ( not ( = ?auto_299199 ?auto_299202 ) ) ( not ( = ?auto_299199 ?auto_299203 ) ) ( not ( = ?auto_299199 ?auto_299204 ) ) ( not ( = ?auto_299199 ?auto_299205 ) ) ( not ( = ?auto_299199 ?auto_299206 ) ) ( not ( = ?auto_299199 ?auto_299207 ) ) ( not ( = ?auto_299199 ?auto_299208 ) ) ( not ( = ?auto_299200 ?auto_299201 ) ) ( not ( = ?auto_299200 ?auto_299202 ) ) ( not ( = ?auto_299200 ?auto_299203 ) ) ( not ( = ?auto_299200 ?auto_299204 ) ) ( not ( = ?auto_299200 ?auto_299205 ) ) ( not ( = ?auto_299200 ?auto_299206 ) ) ( not ( = ?auto_299200 ?auto_299207 ) ) ( not ( = ?auto_299200 ?auto_299208 ) ) ( not ( = ?auto_299201 ?auto_299202 ) ) ( not ( = ?auto_299201 ?auto_299203 ) ) ( not ( = ?auto_299201 ?auto_299204 ) ) ( not ( = ?auto_299201 ?auto_299205 ) ) ( not ( = ?auto_299201 ?auto_299206 ) ) ( not ( = ?auto_299201 ?auto_299207 ) ) ( not ( = ?auto_299201 ?auto_299208 ) ) ( not ( = ?auto_299202 ?auto_299203 ) ) ( not ( = ?auto_299202 ?auto_299204 ) ) ( not ( = ?auto_299202 ?auto_299205 ) ) ( not ( = ?auto_299202 ?auto_299206 ) ) ( not ( = ?auto_299202 ?auto_299207 ) ) ( not ( = ?auto_299202 ?auto_299208 ) ) ( not ( = ?auto_299203 ?auto_299204 ) ) ( not ( = ?auto_299203 ?auto_299205 ) ) ( not ( = ?auto_299203 ?auto_299206 ) ) ( not ( = ?auto_299203 ?auto_299207 ) ) ( not ( = ?auto_299203 ?auto_299208 ) ) ( not ( = ?auto_299204 ?auto_299205 ) ) ( not ( = ?auto_299204 ?auto_299206 ) ) ( not ( = ?auto_299204 ?auto_299207 ) ) ( not ( = ?auto_299204 ?auto_299208 ) ) ( not ( = ?auto_299205 ?auto_299206 ) ) ( not ( = ?auto_299205 ?auto_299207 ) ) ( not ( = ?auto_299205 ?auto_299208 ) ) ( not ( = ?auto_299206 ?auto_299207 ) ) ( not ( = ?auto_299206 ?auto_299208 ) ) ( not ( = ?auto_299207 ?auto_299208 ) ) ( CLEAR ?auto_299205 ) ( ON ?auto_299206 ?auto_299207 ) ( CLEAR ?auto_299206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_299195 ?auto_299196 ?auto_299197 ?auto_299198 ?auto_299199 ?auto_299200 ?auto_299201 ?auto_299202 ?auto_299203 ?auto_299204 ?auto_299205 ?auto_299206 )
      ( MAKE-13PILE ?auto_299195 ?auto_299196 ?auto_299197 ?auto_299198 ?auto_299199 ?auto_299200 ?auto_299201 ?auto_299202 ?auto_299203 ?auto_299204 ?auto_299205 ?auto_299206 ?auto_299207 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_299222 - BLOCK
      ?auto_299223 - BLOCK
      ?auto_299224 - BLOCK
      ?auto_299225 - BLOCK
      ?auto_299226 - BLOCK
      ?auto_299227 - BLOCK
      ?auto_299228 - BLOCK
      ?auto_299229 - BLOCK
      ?auto_299230 - BLOCK
      ?auto_299231 - BLOCK
      ?auto_299232 - BLOCK
      ?auto_299233 - BLOCK
      ?auto_299234 - BLOCK
    )
    :vars
    (
      ?auto_299235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299234 ?auto_299235 ) ( ON-TABLE ?auto_299222 ) ( ON ?auto_299223 ?auto_299222 ) ( ON ?auto_299224 ?auto_299223 ) ( ON ?auto_299225 ?auto_299224 ) ( ON ?auto_299226 ?auto_299225 ) ( ON ?auto_299227 ?auto_299226 ) ( ON ?auto_299228 ?auto_299227 ) ( ON ?auto_299229 ?auto_299228 ) ( ON ?auto_299230 ?auto_299229 ) ( ON ?auto_299231 ?auto_299230 ) ( not ( = ?auto_299222 ?auto_299223 ) ) ( not ( = ?auto_299222 ?auto_299224 ) ) ( not ( = ?auto_299222 ?auto_299225 ) ) ( not ( = ?auto_299222 ?auto_299226 ) ) ( not ( = ?auto_299222 ?auto_299227 ) ) ( not ( = ?auto_299222 ?auto_299228 ) ) ( not ( = ?auto_299222 ?auto_299229 ) ) ( not ( = ?auto_299222 ?auto_299230 ) ) ( not ( = ?auto_299222 ?auto_299231 ) ) ( not ( = ?auto_299222 ?auto_299232 ) ) ( not ( = ?auto_299222 ?auto_299233 ) ) ( not ( = ?auto_299222 ?auto_299234 ) ) ( not ( = ?auto_299222 ?auto_299235 ) ) ( not ( = ?auto_299223 ?auto_299224 ) ) ( not ( = ?auto_299223 ?auto_299225 ) ) ( not ( = ?auto_299223 ?auto_299226 ) ) ( not ( = ?auto_299223 ?auto_299227 ) ) ( not ( = ?auto_299223 ?auto_299228 ) ) ( not ( = ?auto_299223 ?auto_299229 ) ) ( not ( = ?auto_299223 ?auto_299230 ) ) ( not ( = ?auto_299223 ?auto_299231 ) ) ( not ( = ?auto_299223 ?auto_299232 ) ) ( not ( = ?auto_299223 ?auto_299233 ) ) ( not ( = ?auto_299223 ?auto_299234 ) ) ( not ( = ?auto_299223 ?auto_299235 ) ) ( not ( = ?auto_299224 ?auto_299225 ) ) ( not ( = ?auto_299224 ?auto_299226 ) ) ( not ( = ?auto_299224 ?auto_299227 ) ) ( not ( = ?auto_299224 ?auto_299228 ) ) ( not ( = ?auto_299224 ?auto_299229 ) ) ( not ( = ?auto_299224 ?auto_299230 ) ) ( not ( = ?auto_299224 ?auto_299231 ) ) ( not ( = ?auto_299224 ?auto_299232 ) ) ( not ( = ?auto_299224 ?auto_299233 ) ) ( not ( = ?auto_299224 ?auto_299234 ) ) ( not ( = ?auto_299224 ?auto_299235 ) ) ( not ( = ?auto_299225 ?auto_299226 ) ) ( not ( = ?auto_299225 ?auto_299227 ) ) ( not ( = ?auto_299225 ?auto_299228 ) ) ( not ( = ?auto_299225 ?auto_299229 ) ) ( not ( = ?auto_299225 ?auto_299230 ) ) ( not ( = ?auto_299225 ?auto_299231 ) ) ( not ( = ?auto_299225 ?auto_299232 ) ) ( not ( = ?auto_299225 ?auto_299233 ) ) ( not ( = ?auto_299225 ?auto_299234 ) ) ( not ( = ?auto_299225 ?auto_299235 ) ) ( not ( = ?auto_299226 ?auto_299227 ) ) ( not ( = ?auto_299226 ?auto_299228 ) ) ( not ( = ?auto_299226 ?auto_299229 ) ) ( not ( = ?auto_299226 ?auto_299230 ) ) ( not ( = ?auto_299226 ?auto_299231 ) ) ( not ( = ?auto_299226 ?auto_299232 ) ) ( not ( = ?auto_299226 ?auto_299233 ) ) ( not ( = ?auto_299226 ?auto_299234 ) ) ( not ( = ?auto_299226 ?auto_299235 ) ) ( not ( = ?auto_299227 ?auto_299228 ) ) ( not ( = ?auto_299227 ?auto_299229 ) ) ( not ( = ?auto_299227 ?auto_299230 ) ) ( not ( = ?auto_299227 ?auto_299231 ) ) ( not ( = ?auto_299227 ?auto_299232 ) ) ( not ( = ?auto_299227 ?auto_299233 ) ) ( not ( = ?auto_299227 ?auto_299234 ) ) ( not ( = ?auto_299227 ?auto_299235 ) ) ( not ( = ?auto_299228 ?auto_299229 ) ) ( not ( = ?auto_299228 ?auto_299230 ) ) ( not ( = ?auto_299228 ?auto_299231 ) ) ( not ( = ?auto_299228 ?auto_299232 ) ) ( not ( = ?auto_299228 ?auto_299233 ) ) ( not ( = ?auto_299228 ?auto_299234 ) ) ( not ( = ?auto_299228 ?auto_299235 ) ) ( not ( = ?auto_299229 ?auto_299230 ) ) ( not ( = ?auto_299229 ?auto_299231 ) ) ( not ( = ?auto_299229 ?auto_299232 ) ) ( not ( = ?auto_299229 ?auto_299233 ) ) ( not ( = ?auto_299229 ?auto_299234 ) ) ( not ( = ?auto_299229 ?auto_299235 ) ) ( not ( = ?auto_299230 ?auto_299231 ) ) ( not ( = ?auto_299230 ?auto_299232 ) ) ( not ( = ?auto_299230 ?auto_299233 ) ) ( not ( = ?auto_299230 ?auto_299234 ) ) ( not ( = ?auto_299230 ?auto_299235 ) ) ( not ( = ?auto_299231 ?auto_299232 ) ) ( not ( = ?auto_299231 ?auto_299233 ) ) ( not ( = ?auto_299231 ?auto_299234 ) ) ( not ( = ?auto_299231 ?auto_299235 ) ) ( not ( = ?auto_299232 ?auto_299233 ) ) ( not ( = ?auto_299232 ?auto_299234 ) ) ( not ( = ?auto_299232 ?auto_299235 ) ) ( not ( = ?auto_299233 ?auto_299234 ) ) ( not ( = ?auto_299233 ?auto_299235 ) ) ( not ( = ?auto_299234 ?auto_299235 ) ) ( ON ?auto_299233 ?auto_299234 ) ( CLEAR ?auto_299231 ) ( ON ?auto_299232 ?auto_299233 ) ( CLEAR ?auto_299232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_299222 ?auto_299223 ?auto_299224 ?auto_299225 ?auto_299226 ?auto_299227 ?auto_299228 ?auto_299229 ?auto_299230 ?auto_299231 ?auto_299232 )
      ( MAKE-13PILE ?auto_299222 ?auto_299223 ?auto_299224 ?auto_299225 ?auto_299226 ?auto_299227 ?auto_299228 ?auto_299229 ?auto_299230 ?auto_299231 ?auto_299232 ?auto_299233 ?auto_299234 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_299249 - BLOCK
      ?auto_299250 - BLOCK
      ?auto_299251 - BLOCK
      ?auto_299252 - BLOCK
      ?auto_299253 - BLOCK
      ?auto_299254 - BLOCK
      ?auto_299255 - BLOCK
      ?auto_299256 - BLOCK
      ?auto_299257 - BLOCK
      ?auto_299258 - BLOCK
      ?auto_299259 - BLOCK
      ?auto_299260 - BLOCK
      ?auto_299261 - BLOCK
    )
    :vars
    (
      ?auto_299262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299261 ?auto_299262 ) ( ON-TABLE ?auto_299249 ) ( ON ?auto_299250 ?auto_299249 ) ( ON ?auto_299251 ?auto_299250 ) ( ON ?auto_299252 ?auto_299251 ) ( ON ?auto_299253 ?auto_299252 ) ( ON ?auto_299254 ?auto_299253 ) ( ON ?auto_299255 ?auto_299254 ) ( ON ?auto_299256 ?auto_299255 ) ( ON ?auto_299257 ?auto_299256 ) ( ON ?auto_299258 ?auto_299257 ) ( not ( = ?auto_299249 ?auto_299250 ) ) ( not ( = ?auto_299249 ?auto_299251 ) ) ( not ( = ?auto_299249 ?auto_299252 ) ) ( not ( = ?auto_299249 ?auto_299253 ) ) ( not ( = ?auto_299249 ?auto_299254 ) ) ( not ( = ?auto_299249 ?auto_299255 ) ) ( not ( = ?auto_299249 ?auto_299256 ) ) ( not ( = ?auto_299249 ?auto_299257 ) ) ( not ( = ?auto_299249 ?auto_299258 ) ) ( not ( = ?auto_299249 ?auto_299259 ) ) ( not ( = ?auto_299249 ?auto_299260 ) ) ( not ( = ?auto_299249 ?auto_299261 ) ) ( not ( = ?auto_299249 ?auto_299262 ) ) ( not ( = ?auto_299250 ?auto_299251 ) ) ( not ( = ?auto_299250 ?auto_299252 ) ) ( not ( = ?auto_299250 ?auto_299253 ) ) ( not ( = ?auto_299250 ?auto_299254 ) ) ( not ( = ?auto_299250 ?auto_299255 ) ) ( not ( = ?auto_299250 ?auto_299256 ) ) ( not ( = ?auto_299250 ?auto_299257 ) ) ( not ( = ?auto_299250 ?auto_299258 ) ) ( not ( = ?auto_299250 ?auto_299259 ) ) ( not ( = ?auto_299250 ?auto_299260 ) ) ( not ( = ?auto_299250 ?auto_299261 ) ) ( not ( = ?auto_299250 ?auto_299262 ) ) ( not ( = ?auto_299251 ?auto_299252 ) ) ( not ( = ?auto_299251 ?auto_299253 ) ) ( not ( = ?auto_299251 ?auto_299254 ) ) ( not ( = ?auto_299251 ?auto_299255 ) ) ( not ( = ?auto_299251 ?auto_299256 ) ) ( not ( = ?auto_299251 ?auto_299257 ) ) ( not ( = ?auto_299251 ?auto_299258 ) ) ( not ( = ?auto_299251 ?auto_299259 ) ) ( not ( = ?auto_299251 ?auto_299260 ) ) ( not ( = ?auto_299251 ?auto_299261 ) ) ( not ( = ?auto_299251 ?auto_299262 ) ) ( not ( = ?auto_299252 ?auto_299253 ) ) ( not ( = ?auto_299252 ?auto_299254 ) ) ( not ( = ?auto_299252 ?auto_299255 ) ) ( not ( = ?auto_299252 ?auto_299256 ) ) ( not ( = ?auto_299252 ?auto_299257 ) ) ( not ( = ?auto_299252 ?auto_299258 ) ) ( not ( = ?auto_299252 ?auto_299259 ) ) ( not ( = ?auto_299252 ?auto_299260 ) ) ( not ( = ?auto_299252 ?auto_299261 ) ) ( not ( = ?auto_299252 ?auto_299262 ) ) ( not ( = ?auto_299253 ?auto_299254 ) ) ( not ( = ?auto_299253 ?auto_299255 ) ) ( not ( = ?auto_299253 ?auto_299256 ) ) ( not ( = ?auto_299253 ?auto_299257 ) ) ( not ( = ?auto_299253 ?auto_299258 ) ) ( not ( = ?auto_299253 ?auto_299259 ) ) ( not ( = ?auto_299253 ?auto_299260 ) ) ( not ( = ?auto_299253 ?auto_299261 ) ) ( not ( = ?auto_299253 ?auto_299262 ) ) ( not ( = ?auto_299254 ?auto_299255 ) ) ( not ( = ?auto_299254 ?auto_299256 ) ) ( not ( = ?auto_299254 ?auto_299257 ) ) ( not ( = ?auto_299254 ?auto_299258 ) ) ( not ( = ?auto_299254 ?auto_299259 ) ) ( not ( = ?auto_299254 ?auto_299260 ) ) ( not ( = ?auto_299254 ?auto_299261 ) ) ( not ( = ?auto_299254 ?auto_299262 ) ) ( not ( = ?auto_299255 ?auto_299256 ) ) ( not ( = ?auto_299255 ?auto_299257 ) ) ( not ( = ?auto_299255 ?auto_299258 ) ) ( not ( = ?auto_299255 ?auto_299259 ) ) ( not ( = ?auto_299255 ?auto_299260 ) ) ( not ( = ?auto_299255 ?auto_299261 ) ) ( not ( = ?auto_299255 ?auto_299262 ) ) ( not ( = ?auto_299256 ?auto_299257 ) ) ( not ( = ?auto_299256 ?auto_299258 ) ) ( not ( = ?auto_299256 ?auto_299259 ) ) ( not ( = ?auto_299256 ?auto_299260 ) ) ( not ( = ?auto_299256 ?auto_299261 ) ) ( not ( = ?auto_299256 ?auto_299262 ) ) ( not ( = ?auto_299257 ?auto_299258 ) ) ( not ( = ?auto_299257 ?auto_299259 ) ) ( not ( = ?auto_299257 ?auto_299260 ) ) ( not ( = ?auto_299257 ?auto_299261 ) ) ( not ( = ?auto_299257 ?auto_299262 ) ) ( not ( = ?auto_299258 ?auto_299259 ) ) ( not ( = ?auto_299258 ?auto_299260 ) ) ( not ( = ?auto_299258 ?auto_299261 ) ) ( not ( = ?auto_299258 ?auto_299262 ) ) ( not ( = ?auto_299259 ?auto_299260 ) ) ( not ( = ?auto_299259 ?auto_299261 ) ) ( not ( = ?auto_299259 ?auto_299262 ) ) ( not ( = ?auto_299260 ?auto_299261 ) ) ( not ( = ?auto_299260 ?auto_299262 ) ) ( not ( = ?auto_299261 ?auto_299262 ) ) ( ON ?auto_299260 ?auto_299261 ) ( CLEAR ?auto_299258 ) ( ON ?auto_299259 ?auto_299260 ) ( CLEAR ?auto_299259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_299249 ?auto_299250 ?auto_299251 ?auto_299252 ?auto_299253 ?auto_299254 ?auto_299255 ?auto_299256 ?auto_299257 ?auto_299258 ?auto_299259 )
      ( MAKE-13PILE ?auto_299249 ?auto_299250 ?auto_299251 ?auto_299252 ?auto_299253 ?auto_299254 ?auto_299255 ?auto_299256 ?auto_299257 ?auto_299258 ?auto_299259 ?auto_299260 ?auto_299261 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_299276 - BLOCK
      ?auto_299277 - BLOCK
      ?auto_299278 - BLOCK
      ?auto_299279 - BLOCK
      ?auto_299280 - BLOCK
      ?auto_299281 - BLOCK
      ?auto_299282 - BLOCK
      ?auto_299283 - BLOCK
      ?auto_299284 - BLOCK
      ?auto_299285 - BLOCK
      ?auto_299286 - BLOCK
      ?auto_299287 - BLOCK
      ?auto_299288 - BLOCK
    )
    :vars
    (
      ?auto_299289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299288 ?auto_299289 ) ( ON-TABLE ?auto_299276 ) ( ON ?auto_299277 ?auto_299276 ) ( ON ?auto_299278 ?auto_299277 ) ( ON ?auto_299279 ?auto_299278 ) ( ON ?auto_299280 ?auto_299279 ) ( ON ?auto_299281 ?auto_299280 ) ( ON ?auto_299282 ?auto_299281 ) ( ON ?auto_299283 ?auto_299282 ) ( ON ?auto_299284 ?auto_299283 ) ( not ( = ?auto_299276 ?auto_299277 ) ) ( not ( = ?auto_299276 ?auto_299278 ) ) ( not ( = ?auto_299276 ?auto_299279 ) ) ( not ( = ?auto_299276 ?auto_299280 ) ) ( not ( = ?auto_299276 ?auto_299281 ) ) ( not ( = ?auto_299276 ?auto_299282 ) ) ( not ( = ?auto_299276 ?auto_299283 ) ) ( not ( = ?auto_299276 ?auto_299284 ) ) ( not ( = ?auto_299276 ?auto_299285 ) ) ( not ( = ?auto_299276 ?auto_299286 ) ) ( not ( = ?auto_299276 ?auto_299287 ) ) ( not ( = ?auto_299276 ?auto_299288 ) ) ( not ( = ?auto_299276 ?auto_299289 ) ) ( not ( = ?auto_299277 ?auto_299278 ) ) ( not ( = ?auto_299277 ?auto_299279 ) ) ( not ( = ?auto_299277 ?auto_299280 ) ) ( not ( = ?auto_299277 ?auto_299281 ) ) ( not ( = ?auto_299277 ?auto_299282 ) ) ( not ( = ?auto_299277 ?auto_299283 ) ) ( not ( = ?auto_299277 ?auto_299284 ) ) ( not ( = ?auto_299277 ?auto_299285 ) ) ( not ( = ?auto_299277 ?auto_299286 ) ) ( not ( = ?auto_299277 ?auto_299287 ) ) ( not ( = ?auto_299277 ?auto_299288 ) ) ( not ( = ?auto_299277 ?auto_299289 ) ) ( not ( = ?auto_299278 ?auto_299279 ) ) ( not ( = ?auto_299278 ?auto_299280 ) ) ( not ( = ?auto_299278 ?auto_299281 ) ) ( not ( = ?auto_299278 ?auto_299282 ) ) ( not ( = ?auto_299278 ?auto_299283 ) ) ( not ( = ?auto_299278 ?auto_299284 ) ) ( not ( = ?auto_299278 ?auto_299285 ) ) ( not ( = ?auto_299278 ?auto_299286 ) ) ( not ( = ?auto_299278 ?auto_299287 ) ) ( not ( = ?auto_299278 ?auto_299288 ) ) ( not ( = ?auto_299278 ?auto_299289 ) ) ( not ( = ?auto_299279 ?auto_299280 ) ) ( not ( = ?auto_299279 ?auto_299281 ) ) ( not ( = ?auto_299279 ?auto_299282 ) ) ( not ( = ?auto_299279 ?auto_299283 ) ) ( not ( = ?auto_299279 ?auto_299284 ) ) ( not ( = ?auto_299279 ?auto_299285 ) ) ( not ( = ?auto_299279 ?auto_299286 ) ) ( not ( = ?auto_299279 ?auto_299287 ) ) ( not ( = ?auto_299279 ?auto_299288 ) ) ( not ( = ?auto_299279 ?auto_299289 ) ) ( not ( = ?auto_299280 ?auto_299281 ) ) ( not ( = ?auto_299280 ?auto_299282 ) ) ( not ( = ?auto_299280 ?auto_299283 ) ) ( not ( = ?auto_299280 ?auto_299284 ) ) ( not ( = ?auto_299280 ?auto_299285 ) ) ( not ( = ?auto_299280 ?auto_299286 ) ) ( not ( = ?auto_299280 ?auto_299287 ) ) ( not ( = ?auto_299280 ?auto_299288 ) ) ( not ( = ?auto_299280 ?auto_299289 ) ) ( not ( = ?auto_299281 ?auto_299282 ) ) ( not ( = ?auto_299281 ?auto_299283 ) ) ( not ( = ?auto_299281 ?auto_299284 ) ) ( not ( = ?auto_299281 ?auto_299285 ) ) ( not ( = ?auto_299281 ?auto_299286 ) ) ( not ( = ?auto_299281 ?auto_299287 ) ) ( not ( = ?auto_299281 ?auto_299288 ) ) ( not ( = ?auto_299281 ?auto_299289 ) ) ( not ( = ?auto_299282 ?auto_299283 ) ) ( not ( = ?auto_299282 ?auto_299284 ) ) ( not ( = ?auto_299282 ?auto_299285 ) ) ( not ( = ?auto_299282 ?auto_299286 ) ) ( not ( = ?auto_299282 ?auto_299287 ) ) ( not ( = ?auto_299282 ?auto_299288 ) ) ( not ( = ?auto_299282 ?auto_299289 ) ) ( not ( = ?auto_299283 ?auto_299284 ) ) ( not ( = ?auto_299283 ?auto_299285 ) ) ( not ( = ?auto_299283 ?auto_299286 ) ) ( not ( = ?auto_299283 ?auto_299287 ) ) ( not ( = ?auto_299283 ?auto_299288 ) ) ( not ( = ?auto_299283 ?auto_299289 ) ) ( not ( = ?auto_299284 ?auto_299285 ) ) ( not ( = ?auto_299284 ?auto_299286 ) ) ( not ( = ?auto_299284 ?auto_299287 ) ) ( not ( = ?auto_299284 ?auto_299288 ) ) ( not ( = ?auto_299284 ?auto_299289 ) ) ( not ( = ?auto_299285 ?auto_299286 ) ) ( not ( = ?auto_299285 ?auto_299287 ) ) ( not ( = ?auto_299285 ?auto_299288 ) ) ( not ( = ?auto_299285 ?auto_299289 ) ) ( not ( = ?auto_299286 ?auto_299287 ) ) ( not ( = ?auto_299286 ?auto_299288 ) ) ( not ( = ?auto_299286 ?auto_299289 ) ) ( not ( = ?auto_299287 ?auto_299288 ) ) ( not ( = ?auto_299287 ?auto_299289 ) ) ( not ( = ?auto_299288 ?auto_299289 ) ) ( ON ?auto_299287 ?auto_299288 ) ( ON ?auto_299286 ?auto_299287 ) ( CLEAR ?auto_299284 ) ( ON ?auto_299285 ?auto_299286 ) ( CLEAR ?auto_299285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_299276 ?auto_299277 ?auto_299278 ?auto_299279 ?auto_299280 ?auto_299281 ?auto_299282 ?auto_299283 ?auto_299284 ?auto_299285 )
      ( MAKE-13PILE ?auto_299276 ?auto_299277 ?auto_299278 ?auto_299279 ?auto_299280 ?auto_299281 ?auto_299282 ?auto_299283 ?auto_299284 ?auto_299285 ?auto_299286 ?auto_299287 ?auto_299288 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_299303 - BLOCK
      ?auto_299304 - BLOCK
      ?auto_299305 - BLOCK
      ?auto_299306 - BLOCK
      ?auto_299307 - BLOCK
      ?auto_299308 - BLOCK
      ?auto_299309 - BLOCK
      ?auto_299310 - BLOCK
      ?auto_299311 - BLOCK
      ?auto_299312 - BLOCK
      ?auto_299313 - BLOCK
      ?auto_299314 - BLOCK
      ?auto_299315 - BLOCK
    )
    :vars
    (
      ?auto_299316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299315 ?auto_299316 ) ( ON-TABLE ?auto_299303 ) ( ON ?auto_299304 ?auto_299303 ) ( ON ?auto_299305 ?auto_299304 ) ( ON ?auto_299306 ?auto_299305 ) ( ON ?auto_299307 ?auto_299306 ) ( ON ?auto_299308 ?auto_299307 ) ( ON ?auto_299309 ?auto_299308 ) ( ON ?auto_299310 ?auto_299309 ) ( ON ?auto_299311 ?auto_299310 ) ( not ( = ?auto_299303 ?auto_299304 ) ) ( not ( = ?auto_299303 ?auto_299305 ) ) ( not ( = ?auto_299303 ?auto_299306 ) ) ( not ( = ?auto_299303 ?auto_299307 ) ) ( not ( = ?auto_299303 ?auto_299308 ) ) ( not ( = ?auto_299303 ?auto_299309 ) ) ( not ( = ?auto_299303 ?auto_299310 ) ) ( not ( = ?auto_299303 ?auto_299311 ) ) ( not ( = ?auto_299303 ?auto_299312 ) ) ( not ( = ?auto_299303 ?auto_299313 ) ) ( not ( = ?auto_299303 ?auto_299314 ) ) ( not ( = ?auto_299303 ?auto_299315 ) ) ( not ( = ?auto_299303 ?auto_299316 ) ) ( not ( = ?auto_299304 ?auto_299305 ) ) ( not ( = ?auto_299304 ?auto_299306 ) ) ( not ( = ?auto_299304 ?auto_299307 ) ) ( not ( = ?auto_299304 ?auto_299308 ) ) ( not ( = ?auto_299304 ?auto_299309 ) ) ( not ( = ?auto_299304 ?auto_299310 ) ) ( not ( = ?auto_299304 ?auto_299311 ) ) ( not ( = ?auto_299304 ?auto_299312 ) ) ( not ( = ?auto_299304 ?auto_299313 ) ) ( not ( = ?auto_299304 ?auto_299314 ) ) ( not ( = ?auto_299304 ?auto_299315 ) ) ( not ( = ?auto_299304 ?auto_299316 ) ) ( not ( = ?auto_299305 ?auto_299306 ) ) ( not ( = ?auto_299305 ?auto_299307 ) ) ( not ( = ?auto_299305 ?auto_299308 ) ) ( not ( = ?auto_299305 ?auto_299309 ) ) ( not ( = ?auto_299305 ?auto_299310 ) ) ( not ( = ?auto_299305 ?auto_299311 ) ) ( not ( = ?auto_299305 ?auto_299312 ) ) ( not ( = ?auto_299305 ?auto_299313 ) ) ( not ( = ?auto_299305 ?auto_299314 ) ) ( not ( = ?auto_299305 ?auto_299315 ) ) ( not ( = ?auto_299305 ?auto_299316 ) ) ( not ( = ?auto_299306 ?auto_299307 ) ) ( not ( = ?auto_299306 ?auto_299308 ) ) ( not ( = ?auto_299306 ?auto_299309 ) ) ( not ( = ?auto_299306 ?auto_299310 ) ) ( not ( = ?auto_299306 ?auto_299311 ) ) ( not ( = ?auto_299306 ?auto_299312 ) ) ( not ( = ?auto_299306 ?auto_299313 ) ) ( not ( = ?auto_299306 ?auto_299314 ) ) ( not ( = ?auto_299306 ?auto_299315 ) ) ( not ( = ?auto_299306 ?auto_299316 ) ) ( not ( = ?auto_299307 ?auto_299308 ) ) ( not ( = ?auto_299307 ?auto_299309 ) ) ( not ( = ?auto_299307 ?auto_299310 ) ) ( not ( = ?auto_299307 ?auto_299311 ) ) ( not ( = ?auto_299307 ?auto_299312 ) ) ( not ( = ?auto_299307 ?auto_299313 ) ) ( not ( = ?auto_299307 ?auto_299314 ) ) ( not ( = ?auto_299307 ?auto_299315 ) ) ( not ( = ?auto_299307 ?auto_299316 ) ) ( not ( = ?auto_299308 ?auto_299309 ) ) ( not ( = ?auto_299308 ?auto_299310 ) ) ( not ( = ?auto_299308 ?auto_299311 ) ) ( not ( = ?auto_299308 ?auto_299312 ) ) ( not ( = ?auto_299308 ?auto_299313 ) ) ( not ( = ?auto_299308 ?auto_299314 ) ) ( not ( = ?auto_299308 ?auto_299315 ) ) ( not ( = ?auto_299308 ?auto_299316 ) ) ( not ( = ?auto_299309 ?auto_299310 ) ) ( not ( = ?auto_299309 ?auto_299311 ) ) ( not ( = ?auto_299309 ?auto_299312 ) ) ( not ( = ?auto_299309 ?auto_299313 ) ) ( not ( = ?auto_299309 ?auto_299314 ) ) ( not ( = ?auto_299309 ?auto_299315 ) ) ( not ( = ?auto_299309 ?auto_299316 ) ) ( not ( = ?auto_299310 ?auto_299311 ) ) ( not ( = ?auto_299310 ?auto_299312 ) ) ( not ( = ?auto_299310 ?auto_299313 ) ) ( not ( = ?auto_299310 ?auto_299314 ) ) ( not ( = ?auto_299310 ?auto_299315 ) ) ( not ( = ?auto_299310 ?auto_299316 ) ) ( not ( = ?auto_299311 ?auto_299312 ) ) ( not ( = ?auto_299311 ?auto_299313 ) ) ( not ( = ?auto_299311 ?auto_299314 ) ) ( not ( = ?auto_299311 ?auto_299315 ) ) ( not ( = ?auto_299311 ?auto_299316 ) ) ( not ( = ?auto_299312 ?auto_299313 ) ) ( not ( = ?auto_299312 ?auto_299314 ) ) ( not ( = ?auto_299312 ?auto_299315 ) ) ( not ( = ?auto_299312 ?auto_299316 ) ) ( not ( = ?auto_299313 ?auto_299314 ) ) ( not ( = ?auto_299313 ?auto_299315 ) ) ( not ( = ?auto_299313 ?auto_299316 ) ) ( not ( = ?auto_299314 ?auto_299315 ) ) ( not ( = ?auto_299314 ?auto_299316 ) ) ( not ( = ?auto_299315 ?auto_299316 ) ) ( ON ?auto_299314 ?auto_299315 ) ( ON ?auto_299313 ?auto_299314 ) ( CLEAR ?auto_299311 ) ( ON ?auto_299312 ?auto_299313 ) ( CLEAR ?auto_299312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_299303 ?auto_299304 ?auto_299305 ?auto_299306 ?auto_299307 ?auto_299308 ?auto_299309 ?auto_299310 ?auto_299311 ?auto_299312 )
      ( MAKE-13PILE ?auto_299303 ?auto_299304 ?auto_299305 ?auto_299306 ?auto_299307 ?auto_299308 ?auto_299309 ?auto_299310 ?auto_299311 ?auto_299312 ?auto_299313 ?auto_299314 ?auto_299315 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_299330 - BLOCK
      ?auto_299331 - BLOCK
      ?auto_299332 - BLOCK
      ?auto_299333 - BLOCK
      ?auto_299334 - BLOCK
      ?auto_299335 - BLOCK
      ?auto_299336 - BLOCK
      ?auto_299337 - BLOCK
      ?auto_299338 - BLOCK
      ?auto_299339 - BLOCK
      ?auto_299340 - BLOCK
      ?auto_299341 - BLOCK
      ?auto_299342 - BLOCK
    )
    :vars
    (
      ?auto_299343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299342 ?auto_299343 ) ( ON-TABLE ?auto_299330 ) ( ON ?auto_299331 ?auto_299330 ) ( ON ?auto_299332 ?auto_299331 ) ( ON ?auto_299333 ?auto_299332 ) ( ON ?auto_299334 ?auto_299333 ) ( ON ?auto_299335 ?auto_299334 ) ( ON ?auto_299336 ?auto_299335 ) ( ON ?auto_299337 ?auto_299336 ) ( not ( = ?auto_299330 ?auto_299331 ) ) ( not ( = ?auto_299330 ?auto_299332 ) ) ( not ( = ?auto_299330 ?auto_299333 ) ) ( not ( = ?auto_299330 ?auto_299334 ) ) ( not ( = ?auto_299330 ?auto_299335 ) ) ( not ( = ?auto_299330 ?auto_299336 ) ) ( not ( = ?auto_299330 ?auto_299337 ) ) ( not ( = ?auto_299330 ?auto_299338 ) ) ( not ( = ?auto_299330 ?auto_299339 ) ) ( not ( = ?auto_299330 ?auto_299340 ) ) ( not ( = ?auto_299330 ?auto_299341 ) ) ( not ( = ?auto_299330 ?auto_299342 ) ) ( not ( = ?auto_299330 ?auto_299343 ) ) ( not ( = ?auto_299331 ?auto_299332 ) ) ( not ( = ?auto_299331 ?auto_299333 ) ) ( not ( = ?auto_299331 ?auto_299334 ) ) ( not ( = ?auto_299331 ?auto_299335 ) ) ( not ( = ?auto_299331 ?auto_299336 ) ) ( not ( = ?auto_299331 ?auto_299337 ) ) ( not ( = ?auto_299331 ?auto_299338 ) ) ( not ( = ?auto_299331 ?auto_299339 ) ) ( not ( = ?auto_299331 ?auto_299340 ) ) ( not ( = ?auto_299331 ?auto_299341 ) ) ( not ( = ?auto_299331 ?auto_299342 ) ) ( not ( = ?auto_299331 ?auto_299343 ) ) ( not ( = ?auto_299332 ?auto_299333 ) ) ( not ( = ?auto_299332 ?auto_299334 ) ) ( not ( = ?auto_299332 ?auto_299335 ) ) ( not ( = ?auto_299332 ?auto_299336 ) ) ( not ( = ?auto_299332 ?auto_299337 ) ) ( not ( = ?auto_299332 ?auto_299338 ) ) ( not ( = ?auto_299332 ?auto_299339 ) ) ( not ( = ?auto_299332 ?auto_299340 ) ) ( not ( = ?auto_299332 ?auto_299341 ) ) ( not ( = ?auto_299332 ?auto_299342 ) ) ( not ( = ?auto_299332 ?auto_299343 ) ) ( not ( = ?auto_299333 ?auto_299334 ) ) ( not ( = ?auto_299333 ?auto_299335 ) ) ( not ( = ?auto_299333 ?auto_299336 ) ) ( not ( = ?auto_299333 ?auto_299337 ) ) ( not ( = ?auto_299333 ?auto_299338 ) ) ( not ( = ?auto_299333 ?auto_299339 ) ) ( not ( = ?auto_299333 ?auto_299340 ) ) ( not ( = ?auto_299333 ?auto_299341 ) ) ( not ( = ?auto_299333 ?auto_299342 ) ) ( not ( = ?auto_299333 ?auto_299343 ) ) ( not ( = ?auto_299334 ?auto_299335 ) ) ( not ( = ?auto_299334 ?auto_299336 ) ) ( not ( = ?auto_299334 ?auto_299337 ) ) ( not ( = ?auto_299334 ?auto_299338 ) ) ( not ( = ?auto_299334 ?auto_299339 ) ) ( not ( = ?auto_299334 ?auto_299340 ) ) ( not ( = ?auto_299334 ?auto_299341 ) ) ( not ( = ?auto_299334 ?auto_299342 ) ) ( not ( = ?auto_299334 ?auto_299343 ) ) ( not ( = ?auto_299335 ?auto_299336 ) ) ( not ( = ?auto_299335 ?auto_299337 ) ) ( not ( = ?auto_299335 ?auto_299338 ) ) ( not ( = ?auto_299335 ?auto_299339 ) ) ( not ( = ?auto_299335 ?auto_299340 ) ) ( not ( = ?auto_299335 ?auto_299341 ) ) ( not ( = ?auto_299335 ?auto_299342 ) ) ( not ( = ?auto_299335 ?auto_299343 ) ) ( not ( = ?auto_299336 ?auto_299337 ) ) ( not ( = ?auto_299336 ?auto_299338 ) ) ( not ( = ?auto_299336 ?auto_299339 ) ) ( not ( = ?auto_299336 ?auto_299340 ) ) ( not ( = ?auto_299336 ?auto_299341 ) ) ( not ( = ?auto_299336 ?auto_299342 ) ) ( not ( = ?auto_299336 ?auto_299343 ) ) ( not ( = ?auto_299337 ?auto_299338 ) ) ( not ( = ?auto_299337 ?auto_299339 ) ) ( not ( = ?auto_299337 ?auto_299340 ) ) ( not ( = ?auto_299337 ?auto_299341 ) ) ( not ( = ?auto_299337 ?auto_299342 ) ) ( not ( = ?auto_299337 ?auto_299343 ) ) ( not ( = ?auto_299338 ?auto_299339 ) ) ( not ( = ?auto_299338 ?auto_299340 ) ) ( not ( = ?auto_299338 ?auto_299341 ) ) ( not ( = ?auto_299338 ?auto_299342 ) ) ( not ( = ?auto_299338 ?auto_299343 ) ) ( not ( = ?auto_299339 ?auto_299340 ) ) ( not ( = ?auto_299339 ?auto_299341 ) ) ( not ( = ?auto_299339 ?auto_299342 ) ) ( not ( = ?auto_299339 ?auto_299343 ) ) ( not ( = ?auto_299340 ?auto_299341 ) ) ( not ( = ?auto_299340 ?auto_299342 ) ) ( not ( = ?auto_299340 ?auto_299343 ) ) ( not ( = ?auto_299341 ?auto_299342 ) ) ( not ( = ?auto_299341 ?auto_299343 ) ) ( not ( = ?auto_299342 ?auto_299343 ) ) ( ON ?auto_299341 ?auto_299342 ) ( ON ?auto_299340 ?auto_299341 ) ( ON ?auto_299339 ?auto_299340 ) ( CLEAR ?auto_299337 ) ( ON ?auto_299338 ?auto_299339 ) ( CLEAR ?auto_299338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_299330 ?auto_299331 ?auto_299332 ?auto_299333 ?auto_299334 ?auto_299335 ?auto_299336 ?auto_299337 ?auto_299338 )
      ( MAKE-13PILE ?auto_299330 ?auto_299331 ?auto_299332 ?auto_299333 ?auto_299334 ?auto_299335 ?auto_299336 ?auto_299337 ?auto_299338 ?auto_299339 ?auto_299340 ?auto_299341 ?auto_299342 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_299357 - BLOCK
      ?auto_299358 - BLOCK
      ?auto_299359 - BLOCK
      ?auto_299360 - BLOCK
      ?auto_299361 - BLOCK
      ?auto_299362 - BLOCK
      ?auto_299363 - BLOCK
      ?auto_299364 - BLOCK
      ?auto_299365 - BLOCK
      ?auto_299366 - BLOCK
      ?auto_299367 - BLOCK
      ?auto_299368 - BLOCK
      ?auto_299369 - BLOCK
    )
    :vars
    (
      ?auto_299370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299369 ?auto_299370 ) ( ON-TABLE ?auto_299357 ) ( ON ?auto_299358 ?auto_299357 ) ( ON ?auto_299359 ?auto_299358 ) ( ON ?auto_299360 ?auto_299359 ) ( ON ?auto_299361 ?auto_299360 ) ( ON ?auto_299362 ?auto_299361 ) ( ON ?auto_299363 ?auto_299362 ) ( ON ?auto_299364 ?auto_299363 ) ( not ( = ?auto_299357 ?auto_299358 ) ) ( not ( = ?auto_299357 ?auto_299359 ) ) ( not ( = ?auto_299357 ?auto_299360 ) ) ( not ( = ?auto_299357 ?auto_299361 ) ) ( not ( = ?auto_299357 ?auto_299362 ) ) ( not ( = ?auto_299357 ?auto_299363 ) ) ( not ( = ?auto_299357 ?auto_299364 ) ) ( not ( = ?auto_299357 ?auto_299365 ) ) ( not ( = ?auto_299357 ?auto_299366 ) ) ( not ( = ?auto_299357 ?auto_299367 ) ) ( not ( = ?auto_299357 ?auto_299368 ) ) ( not ( = ?auto_299357 ?auto_299369 ) ) ( not ( = ?auto_299357 ?auto_299370 ) ) ( not ( = ?auto_299358 ?auto_299359 ) ) ( not ( = ?auto_299358 ?auto_299360 ) ) ( not ( = ?auto_299358 ?auto_299361 ) ) ( not ( = ?auto_299358 ?auto_299362 ) ) ( not ( = ?auto_299358 ?auto_299363 ) ) ( not ( = ?auto_299358 ?auto_299364 ) ) ( not ( = ?auto_299358 ?auto_299365 ) ) ( not ( = ?auto_299358 ?auto_299366 ) ) ( not ( = ?auto_299358 ?auto_299367 ) ) ( not ( = ?auto_299358 ?auto_299368 ) ) ( not ( = ?auto_299358 ?auto_299369 ) ) ( not ( = ?auto_299358 ?auto_299370 ) ) ( not ( = ?auto_299359 ?auto_299360 ) ) ( not ( = ?auto_299359 ?auto_299361 ) ) ( not ( = ?auto_299359 ?auto_299362 ) ) ( not ( = ?auto_299359 ?auto_299363 ) ) ( not ( = ?auto_299359 ?auto_299364 ) ) ( not ( = ?auto_299359 ?auto_299365 ) ) ( not ( = ?auto_299359 ?auto_299366 ) ) ( not ( = ?auto_299359 ?auto_299367 ) ) ( not ( = ?auto_299359 ?auto_299368 ) ) ( not ( = ?auto_299359 ?auto_299369 ) ) ( not ( = ?auto_299359 ?auto_299370 ) ) ( not ( = ?auto_299360 ?auto_299361 ) ) ( not ( = ?auto_299360 ?auto_299362 ) ) ( not ( = ?auto_299360 ?auto_299363 ) ) ( not ( = ?auto_299360 ?auto_299364 ) ) ( not ( = ?auto_299360 ?auto_299365 ) ) ( not ( = ?auto_299360 ?auto_299366 ) ) ( not ( = ?auto_299360 ?auto_299367 ) ) ( not ( = ?auto_299360 ?auto_299368 ) ) ( not ( = ?auto_299360 ?auto_299369 ) ) ( not ( = ?auto_299360 ?auto_299370 ) ) ( not ( = ?auto_299361 ?auto_299362 ) ) ( not ( = ?auto_299361 ?auto_299363 ) ) ( not ( = ?auto_299361 ?auto_299364 ) ) ( not ( = ?auto_299361 ?auto_299365 ) ) ( not ( = ?auto_299361 ?auto_299366 ) ) ( not ( = ?auto_299361 ?auto_299367 ) ) ( not ( = ?auto_299361 ?auto_299368 ) ) ( not ( = ?auto_299361 ?auto_299369 ) ) ( not ( = ?auto_299361 ?auto_299370 ) ) ( not ( = ?auto_299362 ?auto_299363 ) ) ( not ( = ?auto_299362 ?auto_299364 ) ) ( not ( = ?auto_299362 ?auto_299365 ) ) ( not ( = ?auto_299362 ?auto_299366 ) ) ( not ( = ?auto_299362 ?auto_299367 ) ) ( not ( = ?auto_299362 ?auto_299368 ) ) ( not ( = ?auto_299362 ?auto_299369 ) ) ( not ( = ?auto_299362 ?auto_299370 ) ) ( not ( = ?auto_299363 ?auto_299364 ) ) ( not ( = ?auto_299363 ?auto_299365 ) ) ( not ( = ?auto_299363 ?auto_299366 ) ) ( not ( = ?auto_299363 ?auto_299367 ) ) ( not ( = ?auto_299363 ?auto_299368 ) ) ( not ( = ?auto_299363 ?auto_299369 ) ) ( not ( = ?auto_299363 ?auto_299370 ) ) ( not ( = ?auto_299364 ?auto_299365 ) ) ( not ( = ?auto_299364 ?auto_299366 ) ) ( not ( = ?auto_299364 ?auto_299367 ) ) ( not ( = ?auto_299364 ?auto_299368 ) ) ( not ( = ?auto_299364 ?auto_299369 ) ) ( not ( = ?auto_299364 ?auto_299370 ) ) ( not ( = ?auto_299365 ?auto_299366 ) ) ( not ( = ?auto_299365 ?auto_299367 ) ) ( not ( = ?auto_299365 ?auto_299368 ) ) ( not ( = ?auto_299365 ?auto_299369 ) ) ( not ( = ?auto_299365 ?auto_299370 ) ) ( not ( = ?auto_299366 ?auto_299367 ) ) ( not ( = ?auto_299366 ?auto_299368 ) ) ( not ( = ?auto_299366 ?auto_299369 ) ) ( not ( = ?auto_299366 ?auto_299370 ) ) ( not ( = ?auto_299367 ?auto_299368 ) ) ( not ( = ?auto_299367 ?auto_299369 ) ) ( not ( = ?auto_299367 ?auto_299370 ) ) ( not ( = ?auto_299368 ?auto_299369 ) ) ( not ( = ?auto_299368 ?auto_299370 ) ) ( not ( = ?auto_299369 ?auto_299370 ) ) ( ON ?auto_299368 ?auto_299369 ) ( ON ?auto_299367 ?auto_299368 ) ( ON ?auto_299366 ?auto_299367 ) ( CLEAR ?auto_299364 ) ( ON ?auto_299365 ?auto_299366 ) ( CLEAR ?auto_299365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_299357 ?auto_299358 ?auto_299359 ?auto_299360 ?auto_299361 ?auto_299362 ?auto_299363 ?auto_299364 ?auto_299365 )
      ( MAKE-13PILE ?auto_299357 ?auto_299358 ?auto_299359 ?auto_299360 ?auto_299361 ?auto_299362 ?auto_299363 ?auto_299364 ?auto_299365 ?auto_299366 ?auto_299367 ?auto_299368 ?auto_299369 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_299384 - BLOCK
      ?auto_299385 - BLOCK
      ?auto_299386 - BLOCK
      ?auto_299387 - BLOCK
      ?auto_299388 - BLOCK
      ?auto_299389 - BLOCK
      ?auto_299390 - BLOCK
      ?auto_299391 - BLOCK
      ?auto_299392 - BLOCK
      ?auto_299393 - BLOCK
      ?auto_299394 - BLOCK
      ?auto_299395 - BLOCK
      ?auto_299396 - BLOCK
    )
    :vars
    (
      ?auto_299397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299396 ?auto_299397 ) ( ON-TABLE ?auto_299384 ) ( ON ?auto_299385 ?auto_299384 ) ( ON ?auto_299386 ?auto_299385 ) ( ON ?auto_299387 ?auto_299386 ) ( ON ?auto_299388 ?auto_299387 ) ( ON ?auto_299389 ?auto_299388 ) ( ON ?auto_299390 ?auto_299389 ) ( not ( = ?auto_299384 ?auto_299385 ) ) ( not ( = ?auto_299384 ?auto_299386 ) ) ( not ( = ?auto_299384 ?auto_299387 ) ) ( not ( = ?auto_299384 ?auto_299388 ) ) ( not ( = ?auto_299384 ?auto_299389 ) ) ( not ( = ?auto_299384 ?auto_299390 ) ) ( not ( = ?auto_299384 ?auto_299391 ) ) ( not ( = ?auto_299384 ?auto_299392 ) ) ( not ( = ?auto_299384 ?auto_299393 ) ) ( not ( = ?auto_299384 ?auto_299394 ) ) ( not ( = ?auto_299384 ?auto_299395 ) ) ( not ( = ?auto_299384 ?auto_299396 ) ) ( not ( = ?auto_299384 ?auto_299397 ) ) ( not ( = ?auto_299385 ?auto_299386 ) ) ( not ( = ?auto_299385 ?auto_299387 ) ) ( not ( = ?auto_299385 ?auto_299388 ) ) ( not ( = ?auto_299385 ?auto_299389 ) ) ( not ( = ?auto_299385 ?auto_299390 ) ) ( not ( = ?auto_299385 ?auto_299391 ) ) ( not ( = ?auto_299385 ?auto_299392 ) ) ( not ( = ?auto_299385 ?auto_299393 ) ) ( not ( = ?auto_299385 ?auto_299394 ) ) ( not ( = ?auto_299385 ?auto_299395 ) ) ( not ( = ?auto_299385 ?auto_299396 ) ) ( not ( = ?auto_299385 ?auto_299397 ) ) ( not ( = ?auto_299386 ?auto_299387 ) ) ( not ( = ?auto_299386 ?auto_299388 ) ) ( not ( = ?auto_299386 ?auto_299389 ) ) ( not ( = ?auto_299386 ?auto_299390 ) ) ( not ( = ?auto_299386 ?auto_299391 ) ) ( not ( = ?auto_299386 ?auto_299392 ) ) ( not ( = ?auto_299386 ?auto_299393 ) ) ( not ( = ?auto_299386 ?auto_299394 ) ) ( not ( = ?auto_299386 ?auto_299395 ) ) ( not ( = ?auto_299386 ?auto_299396 ) ) ( not ( = ?auto_299386 ?auto_299397 ) ) ( not ( = ?auto_299387 ?auto_299388 ) ) ( not ( = ?auto_299387 ?auto_299389 ) ) ( not ( = ?auto_299387 ?auto_299390 ) ) ( not ( = ?auto_299387 ?auto_299391 ) ) ( not ( = ?auto_299387 ?auto_299392 ) ) ( not ( = ?auto_299387 ?auto_299393 ) ) ( not ( = ?auto_299387 ?auto_299394 ) ) ( not ( = ?auto_299387 ?auto_299395 ) ) ( not ( = ?auto_299387 ?auto_299396 ) ) ( not ( = ?auto_299387 ?auto_299397 ) ) ( not ( = ?auto_299388 ?auto_299389 ) ) ( not ( = ?auto_299388 ?auto_299390 ) ) ( not ( = ?auto_299388 ?auto_299391 ) ) ( not ( = ?auto_299388 ?auto_299392 ) ) ( not ( = ?auto_299388 ?auto_299393 ) ) ( not ( = ?auto_299388 ?auto_299394 ) ) ( not ( = ?auto_299388 ?auto_299395 ) ) ( not ( = ?auto_299388 ?auto_299396 ) ) ( not ( = ?auto_299388 ?auto_299397 ) ) ( not ( = ?auto_299389 ?auto_299390 ) ) ( not ( = ?auto_299389 ?auto_299391 ) ) ( not ( = ?auto_299389 ?auto_299392 ) ) ( not ( = ?auto_299389 ?auto_299393 ) ) ( not ( = ?auto_299389 ?auto_299394 ) ) ( not ( = ?auto_299389 ?auto_299395 ) ) ( not ( = ?auto_299389 ?auto_299396 ) ) ( not ( = ?auto_299389 ?auto_299397 ) ) ( not ( = ?auto_299390 ?auto_299391 ) ) ( not ( = ?auto_299390 ?auto_299392 ) ) ( not ( = ?auto_299390 ?auto_299393 ) ) ( not ( = ?auto_299390 ?auto_299394 ) ) ( not ( = ?auto_299390 ?auto_299395 ) ) ( not ( = ?auto_299390 ?auto_299396 ) ) ( not ( = ?auto_299390 ?auto_299397 ) ) ( not ( = ?auto_299391 ?auto_299392 ) ) ( not ( = ?auto_299391 ?auto_299393 ) ) ( not ( = ?auto_299391 ?auto_299394 ) ) ( not ( = ?auto_299391 ?auto_299395 ) ) ( not ( = ?auto_299391 ?auto_299396 ) ) ( not ( = ?auto_299391 ?auto_299397 ) ) ( not ( = ?auto_299392 ?auto_299393 ) ) ( not ( = ?auto_299392 ?auto_299394 ) ) ( not ( = ?auto_299392 ?auto_299395 ) ) ( not ( = ?auto_299392 ?auto_299396 ) ) ( not ( = ?auto_299392 ?auto_299397 ) ) ( not ( = ?auto_299393 ?auto_299394 ) ) ( not ( = ?auto_299393 ?auto_299395 ) ) ( not ( = ?auto_299393 ?auto_299396 ) ) ( not ( = ?auto_299393 ?auto_299397 ) ) ( not ( = ?auto_299394 ?auto_299395 ) ) ( not ( = ?auto_299394 ?auto_299396 ) ) ( not ( = ?auto_299394 ?auto_299397 ) ) ( not ( = ?auto_299395 ?auto_299396 ) ) ( not ( = ?auto_299395 ?auto_299397 ) ) ( not ( = ?auto_299396 ?auto_299397 ) ) ( ON ?auto_299395 ?auto_299396 ) ( ON ?auto_299394 ?auto_299395 ) ( ON ?auto_299393 ?auto_299394 ) ( ON ?auto_299392 ?auto_299393 ) ( CLEAR ?auto_299390 ) ( ON ?auto_299391 ?auto_299392 ) ( CLEAR ?auto_299391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_299384 ?auto_299385 ?auto_299386 ?auto_299387 ?auto_299388 ?auto_299389 ?auto_299390 ?auto_299391 )
      ( MAKE-13PILE ?auto_299384 ?auto_299385 ?auto_299386 ?auto_299387 ?auto_299388 ?auto_299389 ?auto_299390 ?auto_299391 ?auto_299392 ?auto_299393 ?auto_299394 ?auto_299395 ?auto_299396 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_299411 - BLOCK
      ?auto_299412 - BLOCK
      ?auto_299413 - BLOCK
      ?auto_299414 - BLOCK
      ?auto_299415 - BLOCK
      ?auto_299416 - BLOCK
      ?auto_299417 - BLOCK
      ?auto_299418 - BLOCK
      ?auto_299419 - BLOCK
      ?auto_299420 - BLOCK
      ?auto_299421 - BLOCK
      ?auto_299422 - BLOCK
      ?auto_299423 - BLOCK
    )
    :vars
    (
      ?auto_299424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299423 ?auto_299424 ) ( ON-TABLE ?auto_299411 ) ( ON ?auto_299412 ?auto_299411 ) ( ON ?auto_299413 ?auto_299412 ) ( ON ?auto_299414 ?auto_299413 ) ( ON ?auto_299415 ?auto_299414 ) ( ON ?auto_299416 ?auto_299415 ) ( ON ?auto_299417 ?auto_299416 ) ( not ( = ?auto_299411 ?auto_299412 ) ) ( not ( = ?auto_299411 ?auto_299413 ) ) ( not ( = ?auto_299411 ?auto_299414 ) ) ( not ( = ?auto_299411 ?auto_299415 ) ) ( not ( = ?auto_299411 ?auto_299416 ) ) ( not ( = ?auto_299411 ?auto_299417 ) ) ( not ( = ?auto_299411 ?auto_299418 ) ) ( not ( = ?auto_299411 ?auto_299419 ) ) ( not ( = ?auto_299411 ?auto_299420 ) ) ( not ( = ?auto_299411 ?auto_299421 ) ) ( not ( = ?auto_299411 ?auto_299422 ) ) ( not ( = ?auto_299411 ?auto_299423 ) ) ( not ( = ?auto_299411 ?auto_299424 ) ) ( not ( = ?auto_299412 ?auto_299413 ) ) ( not ( = ?auto_299412 ?auto_299414 ) ) ( not ( = ?auto_299412 ?auto_299415 ) ) ( not ( = ?auto_299412 ?auto_299416 ) ) ( not ( = ?auto_299412 ?auto_299417 ) ) ( not ( = ?auto_299412 ?auto_299418 ) ) ( not ( = ?auto_299412 ?auto_299419 ) ) ( not ( = ?auto_299412 ?auto_299420 ) ) ( not ( = ?auto_299412 ?auto_299421 ) ) ( not ( = ?auto_299412 ?auto_299422 ) ) ( not ( = ?auto_299412 ?auto_299423 ) ) ( not ( = ?auto_299412 ?auto_299424 ) ) ( not ( = ?auto_299413 ?auto_299414 ) ) ( not ( = ?auto_299413 ?auto_299415 ) ) ( not ( = ?auto_299413 ?auto_299416 ) ) ( not ( = ?auto_299413 ?auto_299417 ) ) ( not ( = ?auto_299413 ?auto_299418 ) ) ( not ( = ?auto_299413 ?auto_299419 ) ) ( not ( = ?auto_299413 ?auto_299420 ) ) ( not ( = ?auto_299413 ?auto_299421 ) ) ( not ( = ?auto_299413 ?auto_299422 ) ) ( not ( = ?auto_299413 ?auto_299423 ) ) ( not ( = ?auto_299413 ?auto_299424 ) ) ( not ( = ?auto_299414 ?auto_299415 ) ) ( not ( = ?auto_299414 ?auto_299416 ) ) ( not ( = ?auto_299414 ?auto_299417 ) ) ( not ( = ?auto_299414 ?auto_299418 ) ) ( not ( = ?auto_299414 ?auto_299419 ) ) ( not ( = ?auto_299414 ?auto_299420 ) ) ( not ( = ?auto_299414 ?auto_299421 ) ) ( not ( = ?auto_299414 ?auto_299422 ) ) ( not ( = ?auto_299414 ?auto_299423 ) ) ( not ( = ?auto_299414 ?auto_299424 ) ) ( not ( = ?auto_299415 ?auto_299416 ) ) ( not ( = ?auto_299415 ?auto_299417 ) ) ( not ( = ?auto_299415 ?auto_299418 ) ) ( not ( = ?auto_299415 ?auto_299419 ) ) ( not ( = ?auto_299415 ?auto_299420 ) ) ( not ( = ?auto_299415 ?auto_299421 ) ) ( not ( = ?auto_299415 ?auto_299422 ) ) ( not ( = ?auto_299415 ?auto_299423 ) ) ( not ( = ?auto_299415 ?auto_299424 ) ) ( not ( = ?auto_299416 ?auto_299417 ) ) ( not ( = ?auto_299416 ?auto_299418 ) ) ( not ( = ?auto_299416 ?auto_299419 ) ) ( not ( = ?auto_299416 ?auto_299420 ) ) ( not ( = ?auto_299416 ?auto_299421 ) ) ( not ( = ?auto_299416 ?auto_299422 ) ) ( not ( = ?auto_299416 ?auto_299423 ) ) ( not ( = ?auto_299416 ?auto_299424 ) ) ( not ( = ?auto_299417 ?auto_299418 ) ) ( not ( = ?auto_299417 ?auto_299419 ) ) ( not ( = ?auto_299417 ?auto_299420 ) ) ( not ( = ?auto_299417 ?auto_299421 ) ) ( not ( = ?auto_299417 ?auto_299422 ) ) ( not ( = ?auto_299417 ?auto_299423 ) ) ( not ( = ?auto_299417 ?auto_299424 ) ) ( not ( = ?auto_299418 ?auto_299419 ) ) ( not ( = ?auto_299418 ?auto_299420 ) ) ( not ( = ?auto_299418 ?auto_299421 ) ) ( not ( = ?auto_299418 ?auto_299422 ) ) ( not ( = ?auto_299418 ?auto_299423 ) ) ( not ( = ?auto_299418 ?auto_299424 ) ) ( not ( = ?auto_299419 ?auto_299420 ) ) ( not ( = ?auto_299419 ?auto_299421 ) ) ( not ( = ?auto_299419 ?auto_299422 ) ) ( not ( = ?auto_299419 ?auto_299423 ) ) ( not ( = ?auto_299419 ?auto_299424 ) ) ( not ( = ?auto_299420 ?auto_299421 ) ) ( not ( = ?auto_299420 ?auto_299422 ) ) ( not ( = ?auto_299420 ?auto_299423 ) ) ( not ( = ?auto_299420 ?auto_299424 ) ) ( not ( = ?auto_299421 ?auto_299422 ) ) ( not ( = ?auto_299421 ?auto_299423 ) ) ( not ( = ?auto_299421 ?auto_299424 ) ) ( not ( = ?auto_299422 ?auto_299423 ) ) ( not ( = ?auto_299422 ?auto_299424 ) ) ( not ( = ?auto_299423 ?auto_299424 ) ) ( ON ?auto_299422 ?auto_299423 ) ( ON ?auto_299421 ?auto_299422 ) ( ON ?auto_299420 ?auto_299421 ) ( ON ?auto_299419 ?auto_299420 ) ( CLEAR ?auto_299417 ) ( ON ?auto_299418 ?auto_299419 ) ( CLEAR ?auto_299418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_299411 ?auto_299412 ?auto_299413 ?auto_299414 ?auto_299415 ?auto_299416 ?auto_299417 ?auto_299418 )
      ( MAKE-13PILE ?auto_299411 ?auto_299412 ?auto_299413 ?auto_299414 ?auto_299415 ?auto_299416 ?auto_299417 ?auto_299418 ?auto_299419 ?auto_299420 ?auto_299421 ?auto_299422 ?auto_299423 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_299438 - BLOCK
      ?auto_299439 - BLOCK
      ?auto_299440 - BLOCK
      ?auto_299441 - BLOCK
      ?auto_299442 - BLOCK
      ?auto_299443 - BLOCK
      ?auto_299444 - BLOCK
      ?auto_299445 - BLOCK
      ?auto_299446 - BLOCK
      ?auto_299447 - BLOCK
      ?auto_299448 - BLOCK
      ?auto_299449 - BLOCK
      ?auto_299450 - BLOCK
    )
    :vars
    (
      ?auto_299451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299450 ?auto_299451 ) ( ON-TABLE ?auto_299438 ) ( ON ?auto_299439 ?auto_299438 ) ( ON ?auto_299440 ?auto_299439 ) ( ON ?auto_299441 ?auto_299440 ) ( ON ?auto_299442 ?auto_299441 ) ( ON ?auto_299443 ?auto_299442 ) ( not ( = ?auto_299438 ?auto_299439 ) ) ( not ( = ?auto_299438 ?auto_299440 ) ) ( not ( = ?auto_299438 ?auto_299441 ) ) ( not ( = ?auto_299438 ?auto_299442 ) ) ( not ( = ?auto_299438 ?auto_299443 ) ) ( not ( = ?auto_299438 ?auto_299444 ) ) ( not ( = ?auto_299438 ?auto_299445 ) ) ( not ( = ?auto_299438 ?auto_299446 ) ) ( not ( = ?auto_299438 ?auto_299447 ) ) ( not ( = ?auto_299438 ?auto_299448 ) ) ( not ( = ?auto_299438 ?auto_299449 ) ) ( not ( = ?auto_299438 ?auto_299450 ) ) ( not ( = ?auto_299438 ?auto_299451 ) ) ( not ( = ?auto_299439 ?auto_299440 ) ) ( not ( = ?auto_299439 ?auto_299441 ) ) ( not ( = ?auto_299439 ?auto_299442 ) ) ( not ( = ?auto_299439 ?auto_299443 ) ) ( not ( = ?auto_299439 ?auto_299444 ) ) ( not ( = ?auto_299439 ?auto_299445 ) ) ( not ( = ?auto_299439 ?auto_299446 ) ) ( not ( = ?auto_299439 ?auto_299447 ) ) ( not ( = ?auto_299439 ?auto_299448 ) ) ( not ( = ?auto_299439 ?auto_299449 ) ) ( not ( = ?auto_299439 ?auto_299450 ) ) ( not ( = ?auto_299439 ?auto_299451 ) ) ( not ( = ?auto_299440 ?auto_299441 ) ) ( not ( = ?auto_299440 ?auto_299442 ) ) ( not ( = ?auto_299440 ?auto_299443 ) ) ( not ( = ?auto_299440 ?auto_299444 ) ) ( not ( = ?auto_299440 ?auto_299445 ) ) ( not ( = ?auto_299440 ?auto_299446 ) ) ( not ( = ?auto_299440 ?auto_299447 ) ) ( not ( = ?auto_299440 ?auto_299448 ) ) ( not ( = ?auto_299440 ?auto_299449 ) ) ( not ( = ?auto_299440 ?auto_299450 ) ) ( not ( = ?auto_299440 ?auto_299451 ) ) ( not ( = ?auto_299441 ?auto_299442 ) ) ( not ( = ?auto_299441 ?auto_299443 ) ) ( not ( = ?auto_299441 ?auto_299444 ) ) ( not ( = ?auto_299441 ?auto_299445 ) ) ( not ( = ?auto_299441 ?auto_299446 ) ) ( not ( = ?auto_299441 ?auto_299447 ) ) ( not ( = ?auto_299441 ?auto_299448 ) ) ( not ( = ?auto_299441 ?auto_299449 ) ) ( not ( = ?auto_299441 ?auto_299450 ) ) ( not ( = ?auto_299441 ?auto_299451 ) ) ( not ( = ?auto_299442 ?auto_299443 ) ) ( not ( = ?auto_299442 ?auto_299444 ) ) ( not ( = ?auto_299442 ?auto_299445 ) ) ( not ( = ?auto_299442 ?auto_299446 ) ) ( not ( = ?auto_299442 ?auto_299447 ) ) ( not ( = ?auto_299442 ?auto_299448 ) ) ( not ( = ?auto_299442 ?auto_299449 ) ) ( not ( = ?auto_299442 ?auto_299450 ) ) ( not ( = ?auto_299442 ?auto_299451 ) ) ( not ( = ?auto_299443 ?auto_299444 ) ) ( not ( = ?auto_299443 ?auto_299445 ) ) ( not ( = ?auto_299443 ?auto_299446 ) ) ( not ( = ?auto_299443 ?auto_299447 ) ) ( not ( = ?auto_299443 ?auto_299448 ) ) ( not ( = ?auto_299443 ?auto_299449 ) ) ( not ( = ?auto_299443 ?auto_299450 ) ) ( not ( = ?auto_299443 ?auto_299451 ) ) ( not ( = ?auto_299444 ?auto_299445 ) ) ( not ( = ?auto_299444 ?auto_299446 ) ) ( not ( = ?auto_299444 ?auto_299447 ) ) ( not ( = ?auto_299444 ?auto_299448 ) ) ( not ( = ?auto_299444 ?auto_299449 ) ) ( not ( = ?auto_299444 ?auto_299450 ) ) ( not ( = ?auto_299444 ?auto_299451 ) ) ( not ( = ?auto_299445 ?auto_299446 ) ) ( not ( = ?auto_299445 ?auto_299447 ) ) ( not ( = ?auto_299445 ?auto_299448 ) ) ( not ( = ?auto_299445 ?auto_299449 ) ) ( not ( = ?auto_299445 ?auto_299450 ) ) ( not ( = ?auto_299445 ?auto_299451 ) ) ( not ( = ?auto_299446 ?auto_299447 ) ) ( not ( = ?auto_299446 ?auto_299448 ) ) ( not ( = ?auto_299446 ?auto_299449 ) ) ( not ( = ?auto_299446 ?auto_299450 ) ) ( not ( = ?auto_299446 ?auto_299451 ) ) ( not ( = ?auto_299447 ?auto_299448 ) ) ( not ( = ?auto_299447 ?auto_299449 ) ) ( not ( = ?auto_299447 ?auto_299450 ) ) ( not ( = ?auto_299447 ?auto_299451 ) ) ( not ( = ?auto_299448 ?auto_299449 ) ) ( not ( = ?auto_299448 ?auto_299450 ) ) ( not ( = ?auto_299448 ?auto_299451 ) ) ( not ( = ?auto_299449 ?auto_299450 ) ) ( not ( = ?auto_299449 ?auto_299451 ) ) ( not ( = ?auto_299450 ?auto_299451 ) ) ( ON ?auto_299449 ?auto_299450 ) ( ON ?auto_299448 ?auto_299449 ) ( ON ?auto_299447 ?auto_299448 ) ( ON ?auto_299446 ?auto_299447 ) ( ON ?auto_299445 ?auto_299446 ) ( CLEAR ?auto_299443 ) ( ON ?auto_299444 ?auto_299445 ) ( CLEAR ?auto_299444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_299438 ?auto_299439 ?auto_299440 ?auto_299441 ?auto_299442 ?auto_299443 ?auto_299444 )
      ( MAKE-13PILE ?auto_299438 ?auto_299439 ?auto_299440 ?auto_299441 ?auto_299442 ?auto_299443 ?auto_299444 ?auto_299445 ?auto_299446 ?auto_299447 ?auto_299448 ?auto_299449 ?auto_299450 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_299465 - BLOCK
      ?auto_299466 - BLOCK
      ?auto_299467 - BLOCK
      ?auto_299468 - BLOCK
      ?auto_299469 - BLOCK
      ?auto_299470 - BLOCK
      ?auto_299471 - BLOCK
      ?auto_299472 - BLOCK
      ?auto_299473 - BLOCK
      ?auto_299474 - BLOCK
      ?auto_299475 - BLOCK
      ?auto_299476 - BLOCK
      ?auto_299477 - BLOCK
    )
    :vars
    (
      ?auto_299478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299477 ?auto_299478 ) ( ON-TABLE ?auto_299465 ) ( ON ?auto_299466 ?auto_299465 ) ( ON ?auto_299467 ?auto_299466 ) ( ON ?auto_299468 ?auto_299467 ) ( ON ?auto_299469 ?auto_299468 ) ( ON ?auto_299470 ?auto_299469 ) ( not ( = ?auto_299465 ?auto_299466 ) ) ( not ( = ?auto_299465 ?auto_299467 ) ) ( not ( = ?auto_299465 ?auto_299468 ) ) ( not ( = ?auto_299465 ?auto_299469 ) ) ( not ( = ?auto_299465 ?auto_299470 ) ) ( not ( = ?auto_299465 ?auto_299471 ) ) ( not ( = ?auto_299465 ?auto_299472 ) ) ( not ( = ?auto_299465 ?auto_299473 ) ) ( not ( = ?auto_299465 ?auto_299474 ) ) ( not ( = ?auto_299465 ?auto_299475 ) ) ( not ( = ?auto_299465 ?auto_299476 ) ) ( not ( = ?auto_299465 ?auto_299477 ) ) ( not ( = ?auto_299465 ?auto_299478 ) ) ( not ( = ?auto_299466 ?auto_299467 ) ) ( not ( = ?auto_299466 ?auto_299468 ) ) ( not ( = ?auto_299466 ?auto_299469 ) ) ( not ( = ?auto_299466 ?auto_299470 ) ) ( not ( = ?auto_299466 ?auto_299471 ) ) ( not ( = ?auto_299466 ?auto_299472 ) ) ( not ( = ?auto_299466 ?auto_299473 ) ) ( not ( = ?auto_299466 ?auto_299474 ) ) ( not ( = ?auto_299466 ?auto_299475 ) ) ( not ( = ?auto_299466 ?auto_299476 ) ) ( not ( = ?auto_299466 ?auto_299477 ) ) ( not ( = ?auto_299466 ?auto_299478 ) ) ( not ( = ?auto_299467 ?auto_299468 ) ) ( not ( = ?auto_299467 ?auto_299469 ) ) ( not ( = ?auto_299467 ?auto_299470 ) ) ( not ( = ?auto_299467 ?auto_299471 ) ) ( not ( = ?auto_299467 ?auto_299472 ) ) ( not ( = ?auto_299467 ?auto_299473 ) ) ( not ( = ?auto_299467 ?auto_299474 ) ) ( not ( = ?auto_299467 ?auto_299475 ) ) ( not ( = ?auto_299467 ?auto_299476 ) ) ( not ( = ?auto_299467 ?auto_299477 ) ) ( not ( = ?auto_299467 ?auto_299478 ) ) ( not ( = ?auto_299468 ?auto_299469 ) ) ( not ( = ?auto_299468 ?auto_299470 ) ) ( not ( = ?auto_299468 ?auto_299471 ) ) ( not ( = ?auto_299468 ?auto_299472 ) ) ( not ( = ?auto_299468 ?auto_299473 ) ) ( not ( = ?auto_299468 ?auto_299474 ) ) ( not ( = ?auto_299468 ?auto_299475 ) ) ( not ( = ?auto_299468 ?auto_299476 ) ) ( not ( = ?auto_299468 ?auto_299477 ) ) ( not ( = ?auto_299468 ?auto_299478 ) ) ( not ( = ?auto_299469 ?auto_299470 ) ) ( not ( = ?auto_299469 ?auto_299471 ) ) ( not ( = ?auto_299469 ?auto_299472 ) ) ( not ( = ?auto_299469 ?auto_299473 ) ) ( not ( = ?auto_299469 ?auto_299474 ) ) ( not ( = ?auto_299469 ?auto_299475 ) ) ( not ( = ?auto_299469 ?auto_299476 ) ) ( not ( = ?auto_299469 ?auto_299477 ) ) ( not ( = ?auto_299469 ?auto_299478 ) ) ( not ( = ?auto_299470 ?auto_299471 ) ) ( not ( = ?auto_299470 ?auto_299472 ) ) ( not ( = ?auto_299470 ?auto_299473 ) ) ( not ( = ?auto_299470 ?auto_299474 ) ) ( not ( = ?auto_299470 ?auto_299475 ) ) ( not ( = ?auto_299470 ?auto_299476 ) ) ( not ( = ?auto_299470 ?auto_299477 ) ) ( not ( = ?auto_299470 ?auto_299478 ) ) ( not ( = ?auto_299471 ?auto_299472 ) ) ( not ( = ?auto_299471 ?auto_299473 ) ) ( not ( = ?auto_299471 ?auto_299474 ) ) ( not ( = ?auto_299471 ?auto_299475 ) ) ( not ( = ?auto_299471 ?auto_299476 ) ) ( not ( = ?auto_299471 ?auto_299477 ) ) ( not ( = ?auto_299471 ?auto_299478 ) ) ( not ( = ?auto_299472 ?auto_299473 ) ) ( not ( = ?auto_299472 ?auto_299474 ) ) ( not ( = ?auto_299472 ?auto_299475 ) ) ( not ( = ?auto_299472 ?auto_299476 ) ) ( not ( = ?auto_299472 ?auto_299477 ) ) ( not ( = ?auto_299472 ?auto_299478 ) ) ( not ( = ?auto_299473 ?auto_299474 ) ) ( not ( = ?auto_299473 ?auto_299475 ) ) ( not ( = ?auto_299473 ?auto_299476 ) ) ( not ( = ?auto_299473 ?auto_299477 ) ) ( not ( = ?auto_299473 ?auto_299478 ) ) ( not ( = ?auto_299474 ?auto_299475 ) ) ( not ( = ?auto_299474 ?auto_299476 ) ) ( not ( = ?auto_299474 ?auto_299477 ) ) ( not ( = ?auto_299474 ?auto_299478 ) ) ( not ( = ?auto_299475 ?auto_299476 ) ) ( not ( = ?auto_299475 ?auto_299477 ) ) ( not ( = ?auto_299475 ?auto_299478 ) ) ( not ( = ?auto_299476 ?auto_299477 ) ) ( not ( = ?auto_299476 ?auto_299478 ) ) ( not ( = ?auto_299477 ?auto_299478 ) ) ( ON ?auto_299476 ?auto_299477 ) ( ON ?auto_299475 ?auto_299476 ) ( ON ?auto_299474 ?auto_299475 ) ( ON ?auto_299473 ?auto_299474 ) ( ON ?auto_299472 ?auto_299473 ) ( CLEAR ?auto_299470 ) ( ON ?auto_299471 ?auto_299472 ) ( CLEAR ?auto_299471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_299465 ?auto_299466 ?auto_299467 ?auto_299468 ?auto_299469 ?auto_299470 ?auto_299471 )
      ( MAKE-13PILE ?auto_299465 ?auto_299466 ?auto_299467 ?auto_299468 ?auto_299469 ?auto_299470 ?auto_299471 ?auto_299472 ?auto_299473 ?auto_299474 ?auto_299475 ?auto_299476 ?auto_299477 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_299492 - BLOCK
      ?auto_299493 - BLOCK
      ?auto_299494 - BLOCK
      ?auto_299495 - BLOCK
      ?auto_299496 - BLOCK
      ?auto_299497 - BLOCK
      ?auto_299498 - BLOCK
      ?auto_299499 - BLOCK
      ?auto_299500 - BLOCK
      ?auto_299501 - BLOCK
      ?auto_299502 - BLOCK
      ?auto_299503 - BLOCK
      ?auto_299504 - BLOCK
    )
    :vars
    (
      ?auto_299505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299504 ?auto_299505 ) ( ON-TABLE ?auto_299492 ) ( ON ?auto_299493 ?auto_299492 ) ( ON ?auto_299494 ?auto_299493 ) ( ON ?auto_299495 ?auto_299494 ) ( ON ?auto_299496 ?auto_299495 ) ( not ( = ?auto_299492 ?auto_299493 ) ) ( not ( = ?auto_299492 ?auto_299494 ) ) ( not ( = ?auto_299492 ?auto_299495 ) ) ( not ( = ?auto_299492 ?auto_299496 ) ) ( not ( = ?auto_299492 ?auto_299497 ) ) ( not ( = ?auto_299492 ?auto_299498 ) ) ( not ( = ?auto_299492 ?auto_299499 ) ) ( not ( = ?auto_299492 ?auto_299500 ) ) ( not ( = ?auto_299492 ?auto_299501 ) ) ( not ( = ?auto_299492 ?auto_299502 ) ) ( not ( = ?auto_299492 ?auto_299503 ) ) ( not ( = ?auto_299492 ?auto_299504 ) ) ( not ( = ?auto_299492 ?auto_299505 ) ) ( not ( = ?auto_299493 ?auto_299494 ) ) ( not ( = ?auto_299493 ?auto_299495 ) ) ( not ( = ?auto_299493 ?auto_299496 ) ) ( not ( = ?auto_299493 ?auto_299497 ) ) ( not ( = ?auto_299493 ?auto_299498 ) ) ( not ( = ?auto_299493 ?auto_299499 ) ) ( not ( = ?auto_299493 ?auto_299500 ) ) ( not ( = ?auto_299493 ?auto_299501 ) ) ( not ( = ?auto_299493 ?auto_299502 ) ) ( not ( = ?auto_299493 ?auto_299503 ) ) ( not ( = ?auto_299493 ?auto_299504 ) ) ( not ( = ?auto_299493 ?auto_299505 ) ) ( not ( = ?auto_299494 ?auto_299495 ) ) ( not ( = ?auto_299494 ?auto_299496 ) ) ( not ( = ?auto_299494 ?auto_299497 ) ) ( not ( = ?auto_299494 ?auto_299498 ) ) ( not ( = ?auto_299494 ?auto_299499 ) ) ( not ( = ?auto_299494 ?auto_299500 ) ) ( not ( = ?auto_299494 ?auto_299501 ) ) ( not ( = ?auto_299494 ?auto_299502 ) ) ( not ( = ?auto_299494 ?auto_299503 ) ) ( not ( = ?auto_299494 ?auto_299504 ) ) ( not ( = ?auto_299494 ?auto_299505 ) ) ( not ( = ?auto_299495 ?auto_299496 ) ) ( not ( = ?auto_299495 ?auto_299497 ) ) ( not ( = ?auto_299495 ?auto_299498 ) ) ( not ( = ?auto_299495 ?auto_299499 ) ) ( not ( = ?auto_299495 ?auto_299500 ) ) ( not ( = ?auto_299495 ?auto_299501 ) ) ( not ( = ?auto_299495 ?auto_299502 ) ) ( not ( = ?auto_299495 ?auto_299503 ) ) ( not ( = ?auto_299495 ?auto_299504 ) ) ( not ( = ?auto_299495 ?auto_299505 ) ) ( not ( = ?auto_299496 ?auto_299497 ) ) ( not ( = ?auto_299496 ?auto_299498 ) ) ( not ( = ?auto_299496 ?auto_299499 ) ) ( not ( = ?auto_299496 ?auto_299500 ) ) ( not ( = ?auto_299496 ?auto_299501 ) ) ( not ( = ?auto_299496 ?auto_299502 ) ) ( not ( = ?auto_299496 ?auto_299503 ) ) ( not ( = ?auto_299496 ?auto_299504 ) ) ( not ( = ?auto_299496 ?auto_299505 ) ) ( not ( = ?auto_299497 ?auto_299498 ) ) ( not ( = ?auto_299497 ?auto_299499 ) ) ( not ( = ?auto_299497 ?auto_299500 ) ) ( not ( = ?auto_299497 ?auto_299501 ) ) ( not ( = ?auto_299497 ?auto_299502 ) ) ( not ( = ?auto_299497 ?auto_299503 ) ) ( not ( = ?auto_299497 ?auto_299504 ) ) ( not ( = ?auto_299497 ?auto_299505 ) ) ( not ( = ?auto_299498 ?auto_299499 ) ) ( not ( = ?auto_299498 ?auto_299500 ) ) ( not ( = ?auto_299498 ?auto_299501 ) ) ( not ( = ?auto_299498 ?auto_299502 ) ) ( not ( = ?auto_299498 ?auto_299503 ) ) ( not ( = ?auto_299498 ?auto_299504 ) ) ( not ( = ?auto_299498 ?auto_299505 ) ) ( not ( = ?auto_299499 ?auto_299500 ) ) ( not ( = ?auto_299499 ?auto_299501 ) ) ( not ( = ?auto_299499 ?auto_299502 ) ) ( not ( = ?auto_299499 ?auto_299503 ) ) ( not ( = ?auto_299499 ?auto_299504 ) ) ( not ( = ?auto_299499 ?auto_299505 ) ) ( not ( = ?auto_299500 ?auto_299501 ) ) ( not ( = ?auto_299500 ?auto_299502 ) ) ( not ( = ?auto_299500 ?auto_299503 ) ) ( not ( = ?auto_299500 ?auto_299504 ) ) ( not ( = ?auto_299500 ?auto_299505 ) ) ( not ( = ?auto_299501 ?auto_299502 ) ) ( not ( = ?auto_299501 ?auto_299503 ) ) ( not ( = ?auto_299501 ?auto_299504 ) ) ( not ( = ?auto_299501 ?auto_299505 ) ) ( not ( = ?auto_299502 ?auto_299503 ) ) ( not ( = ?auto_299502 ?auto_299504 ) ) ( not ( = ?auto_299502 ?auto_299505 ) ) ( not ( = ?auto_299503 ?auto_299504 ) ) ( not ( = ?auto_299503 ?auto_299505 ) ) ( not ( = ?auto_299504 ?auto_299505 ) ) ( ON ?auto_299503 ?auto_299504 ) ( ON ?auto_299502 ?auto_299503 ) ( ON ?auto_299501 ?auto_299502 ) ( ON ?auto_299500 ?auto_299501 ) ( ON ?auto_299499 ?auto_299500 ) ( ON ?auto_299498 ?auto_299499 ) ( CLEAR ?auto_299496 ) ( ON ?auto_299497 ?auto_299498 ) ( CLEAR ?auto_299497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_299492 ?auto_299493 ?auto_299494 ?auto_299495 ?auto_299496 ?auto_299497 )
      ( MAKE-13PILE ?auto_299492 ?auto_299493 ?auto_299494 ?auto_299495 ?auto_299496 ?auto_299497 ?auto_299498 ?auto_299499 ?auto_299500 ?auto_299501 ?auto_299502 ?auto_299503 ?auto_299504 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_299519 - BLOCK
      ?auto_299520 - BLOCK
      ?auto_299521 - BLOCK
      ?auto_299522 - BLOCK
      ?auto_299523 - BLOCK
      ?auto_299524 - BLOCK
      ?auto_299525 - BLOCK
      ?auto_299526 - BLOCK
      ?auto_299527 - BLOCK
      ?auto_299528 - BLOCK
      ?auto_299529 - BLOCK
      ?auto_299530 - BLOCK
      ?auto_299531 - BLOCK
    )
    :vars
    (
      ?auto_299532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299531 ?auto_299532 ) ( ON-TABLE ?auto_299519 ) ( ON ?auto_299520 ?auto_299519 ) ( ON ?auto_299521 ?auto_299520 ) ( ON ?auto_299522 ?auto_299521 ) ( ON ?auto_299523 ?auto_299522 ) ( not ( = ?auto_299519 ?auto_299520 ) ) ( not ( = ?auto_299519 ?auto_299521 ) ) ( not ( = ?auto_299519 ?auto_299522 ) ) ( not ( = ?auto_299519 ?auto_299523 ) ) ( not ( = ?auto_299519 ?auto_299524 ) ) ( not ( = ?auto_299519 ?auto_299525 ) ) ( not ( = ?auto_299519 ?auto_299526 ) ) ( not ( = ?auto_299519 ?auto_299527 ) ) ( not ( = ?auto_299519 ?auto_299528 ) ) ( not ( = ?auto_299519 ?auto_299529 ) ) ( not ( = ?auto_299519 ?auto_299530 ) ) ( not ( = ?auto_299519 ?auto_299531 ) ) ( not ( = ?auto_299519 ?auto_299532 ) ) ( not ( = ?auto_299520 ?auto_299521 ) ) ( not ( = ?auto_299520 ?auto_299522 ) ) ( not ( = ?auto_299520 ?auto_299523 ) ) ( not ( = ?auto_299520 ?auto_299524 ) ) ( not ( = ?auto_299520 ?auto_299525 ) ) ( not ( = ?auto_299520 ?auto_299526 ) ) ( not ( = ?auto_299520 ?auto_299527 ) ) ( not ( = ?auto_299520 ?auto_299528 ) ) ( not ( = ?auto_299520 ?auto_299529 ) ) ( not ( = ?auto_299520 ?auto_299530 ) ) ( not ( = ?auto_299520 ?auto_299531 ) ) ( not ( = ?auto_299520 ?auto_299532 ) ) ( not ( = ?auto_299521 ?auto_299522 ) ) ( not ( = ?auto_299521 ?auto_299523 ) ) ( not ( = ?auto_299521 ?auto_299524 ) ) ( not ( = ?auto_299521 ?auto_299525 ) ) ( not ( = ?auto_299521 ?auto_299526 ) ) ( not ( = ?auto_299521 ?auto_299527 ) ) ( not ( = ?auto_299521 ?auto_299528 ) ) ( not ( = ?auto_299521 ?auto_299529 ) ) ( not ( = ?auto_299521 ?auto_299530 ) ) ( not ( = ?auto_299521 ?auto_299531 ) ) ( not ( = ?auto_299521 ?auto_299532 ) ) ( not ( = ?auto_299522 ?auto_299523 ) ) ( not ( = ?auto_299522 ?auto_299524 ) ) ( not ( = ?auto_299522 ?auto_299525 ) ) ( not ( = ?auto_299522 ?auto_299526 ) ) ( not ( = ?auto_299522 ?auto_299527 ) ) ( not ( = ?auto_299522 ?auto_299528 ) ) ( not ( = ?auto_299522 ?auto_299529 ) ) ( not ( = ?auto_299522 ?auto_299530 ) ) ( not ( = ?auto_299522 ?auto_299531 ) ) ( not ( = ?auto_299522 ?auto_299532 ) ) ( not ( = ?auto_299523 ?auto_299524 ) ) ( not ( = ?auto_299523 ?auto_299525 ) ) ( not ( = ?auto_299523 ?auto_299526 ) ) ( not ( = ?auto_299523 ?auto_299527 ) ) ( not ( = ?auto_299523 ?auto_299528 ) ) ( not ( = ?auto_299523 ?auto_299529 ) ) ( not ( = ?auto_299523 ?auto_299530 ) ) ( not ( = ?auto_299523 ?auto_299531 ) ) ( not ( = ?auto_299523 ?auto_299532 ) ) ( not ( = ?auto_299524 ?auto_299525 ) ) ( not ( = ?auto_299524 ?auto_299526 ) ) ( not ( = ?auto_299524 ?auto_299527 ) ) ( not ( = ?auto_299524 ?auto_299528 ) ) ( not ( = ?auto_299524 ?auto_299529 ) ) ( not ( = ?auto_299524 ?auto_299530 ) ) ( not ( = ?auto_299524 ?auto_299531 ) ) ( not ( = ?auto_299524 ?auto_299532 ) ) ( not ( = ?auto_299525 ?auto_299526 ) ) ( not ( = ?auto_299525 ?auto_299527 ) ) ( not ( = ?auto_299525 ?auto_299528 ) ) ( not ( = ?auto_299525 ?auto_299529 ) ) ( not ( = ?auto_299525 ?auto_299530 ) ) ( not ( = ?auto_299525 ?auto_299531 ) ) ( not ( = ?auto_299525 ?auto_299532 ) ) ( not ( = ?auto_299526 ?auto_299527 ) ) ( not ( = ?auto_299526 ?auto_299528 ) ) ( not ( = ?auto_299526 ?auto_299529 ) ) ( not ( = ?auto_299526 ?auto_299530 ) ) ( not ( = ?auto_299526 ?auto_299531 ) ) ( not ( = ?auto_299526 ?auto_299532 ) ) ( not ( = ?auto_299527 ?auto_299528 ) ) ( not ( = ?auto_299527 ?auto_299529 ) ) ( not ( = ?auto_299527 ?auto_299530 ) ) ( not ( = ?auto_299527 ?auto_299531 ) ) ( not ( = ?auto_299527 ?auto_299532 ) ) ( not ( = ?auto_299528 ?auto_299529 ) ) ( not ( = ?auto_299528 ?auto_299530 ) ) ( not ( = ?auto_299528 ?auto_299531 ) ) ( not ( = ?auto_299528 ?auto_299532 ) ) ( not ( = ?auto_299529 ?auto_299530 ) ) ( not ( = ?auto_299529 ?auto_299531 ) ) ( not ( = ?auto_299529 ?auto_299532 ) ) ( not ( = ?auto_299530 ?auto_299531 ) ) ( not ( = ?auto_299530 ?auto_299532 ) ) ( not ( = ?auto_299531 ?auto_299532 ) ) ( ON ?auto_299530 ?auto_299531 ) ( ON ?auto_299529 ?auto_299530 ) ( ON ?auto_299528 ?auto_299529 ) ( ON ?auto_299527 ?auto_299528 ) ( ON ?auto_299526 ?auto_299527 ) ( ON ?auto_299525 ?auto_299526 ) ( CLEAR ?auto_299523 ) ( ON ?auto_299524 ?auto_299525 ) ( CLEAR ?auto_299524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_299519 ?auto_299520 ?auto_299521 ?auto_299522 ?auto_299523 ?auto_299524 )
      ( MAKE-13PILE ?auto_299519 ?auto_299520 ?auto_299521 ?auto_299522 ?auto_299523 ?auto_299524 ?auto_299525 ?auto_299526 ?auto_299527 ?auto_299528 ?auto_299529 ?auto_299530 ?auto_299531 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_299546 - BLOCK
      ?auto_299547 - BLOCK
      ?auto_299548 - BLOCK
      ?auto_299549 - BLOCK
      ?auto_299550 - BLOCK
      ?auto_299551 - BLOCK
      ?auto_299552 - BLOCK
      ?auto_299553 - BLOCK
      ?auto_299554 - BLOCK
      ?auto_299555 - BLOCK
      ?auto_299556 - BLOCK
      ?auto_299557 - BLOCK
      ?auto_299558 - BLOCK
    )
    :vars
    (
      ?auto_299559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299558 ?auto_299559 ) ( ON-TABLE ?auto_299546 ) ( ON ?auto_299547 ?auto_299546 ) ( ON ?auto_299548 ?auto_299547 ) ( ON ?auto_299549 ?auto_299548 ) ( not ( = ?auto_299546 ?auto_299547 ) ) ( not ( = ?auto_299546 ?auto_299548 ) ) ( not ( = ?auto_299546 ?auto_299549 ) ) ( not ( = ?auto_299546 ?auto_299550 ) ) ( not ( = ?auto_299546 ?auto_299551 ) ) ( not ( = ?auto_299546 ?auto_299552 ) ) ( not ( = ?auto_299546 ?auto_299553 ) ) ( not ( = ?auto_299546 ?auto_299554 ) ) ( not ( = ?auto_299546 ?auto_299555 ) ) ( not ( = ?auto_299546 ?auto_299556 ) ) ( not ( = ?auto_299546 ?auto_299557 ) ) ( not ( = ?auto_299546 ?auto_299558 ) ) ( not ( = ?auto_299546 ?auto_299559 ) ) ( not ( = ?auto_299547 ?auto_299548 ) ) ( not ( = ?auto_299547 ?auto_299549 ) ) ( not ( = ?auto_299547 ?auto_299550 ) ) ( not ( = ?auto_299547 ?auto_299551 ) ) ( not ( = ?auto_299547 ?auto_299552 ) ) ( not ( = ?auto_299547 ?auto_299553 ) ) ( not ( = ?auto_299547 ?auto_299554 ) ) ( not ( = ?auto_299547 ?auto_299555 ) ) ( not ( = ?auto_299547 ?auto_299556 ) ) ( not ( = ?auto_299547 ?auto_299557 ) ) ( not ( = ?auto_299547 ?auto_299558 ) ) ( not ( = ?auto_299547 ?auto_299559 ) ) ( not ( = ?auto_299548 ?auto_299549 ) ) ( not ( = ?auto_299548 ?auto_299550 ) ) ( not ( = ?auto_299548 ?auto_299551 ) ) ( not ( = ?auto_299548 ?auto_299552 ) ) ( not ( = ?auto_299548 ?auto_299553 ) ) ( not ( = ?auto_299548 ?auto_299554 ) ) ( not ( = ?auto_299548 ?auto_299555 ) ) ( not ( = ?auto_299548 ?auto_299556 ) ) ( not ( = ?auto_299548 ?auto_299557 ) ) ( not ( = ?auto_299548 ?auto_299558 ) ) ( not ( = ?auto_299548 ?auto_299559 ) ) ( not ( = ?auto_299549 ?auto_299550 ) ) ( not ( = ?auto_299549 ?auto_299551 ) ) ( not ( = ?auto_299549 ?auto_299552 ) ) ( not ( = ?auto_299549 ?auto_299553 ) ) ( not ( = ?auto_299549 ?auto_299554 ) ) ( not ( = ?auto_299549 ?auto_299555 ) ) ( not ( = ?auto_299549 ?auto_299556 ) ) ( not ( = ?auto_299549 ?auto_299557 ) ) ( not ( = ?auto_299549 ?auto_299558 ) ) ( not ( = ?auto_299549 ?auto_299559 ) ) ( not ( = ?auto_299550 ?auto_299551 ) ) ( not ( = ?auto_299550 ?auto_299552 ) ) ( not ( = ?auto_299550 ?auto_299553 ) ) ( not ( = ?auto_299550 ?auto_299554 ) ) ( not ( = ?auto_299550 ?auto_299555 ) ) ( not ( = ?auto_299550 ?auto_299556 ) ) ( not ( = ?auto_299550 ?auto_299557 ) ) ( not ( = ?auto_299550 ?auto_299558 ) ) ( not ( = ?auto_299550 ?auto_299559 ) ) ( not ( = ?auto_299551 ?auto_299552 ) ) ( not ( = ?auto_299551 ?auto_299553 ) ) ( not ( = ?auto_299551 ?auto_299554 ) ) ( not ( = ?auto_299551 ?auto_299555 ) ) ( not ( = ?auto_299551 ?auto_299556 ) ) ( not ( = ?auto_299551 ?auto_299557 ) ) ( not ( = ?auto_299551 ?auto_299558 ) ) ( not ( = ?auto_299551 ?auto_299559 ) ) ( not ( = ?auto_299552 ?auto_299553 ) ) ( not ( = ?auto_299552 ?auto_299554 ) ) ( not ( = ?auto_299552 ?auto_299555 ) ) ( not ( = ?auto_299552 ?auto_299556 ) ) ( not ( = ?auto_299552 ?auto_299557 ) ) ( not ( = ?auto_299552 ?auto_299558 ) ) ( not ( = ?auto_299552 ?auto_299559 ) ) ( not ( = ?auto_299553 ?auto_299554 ) ) ( not ( = ?auto_299553 ?auto_299555 ) ) ( not ( = ?auto_299553 ?auto_299556 ) ) ( not ( = ?auto_299553 ?auto_299557 ) ) ( not ( = ?auto_299553 ?auto_299558 ) ) ( not ( = ?auto_299553 ?auto_299559 ) ) ( not ( = ?auto_299554 ?auto_299555 ) ) ( not ( = ?auto_299554 ?auto_299556 ) ) ( not ( = ?auto_299554 ?auto_299557 ) ) ( not ( = ?auto_299554 ?auto_299558 ) ) ( not ( = ?auto_299554 ?auto_299559 ) ) ( not ( = ?auto_299555 ?auto_299556 ) ) ( not ( = ?auto_299555 ?auto_299557 ) ) ( not ( = ?auto_299555 ?auto_299558 ) ) ( not ( = ?auto_299555 ?auto_299559 ) ) ( not ( = ?auto_299556 ?auto_299557 ) ) ( not ( = ?auto_299556 ?auto_299558 ) ) ( not ( = ?auto_299556 ?auto_299559 ) ) ( not ( = ?auto_299557 ?auto_299558 ) ) ( not ( = ?auto_299557 ?auto_299559 ) ) ( not ( = ?auto_299558 ?auto_299559 ) ) ( ON ?auto_299557 ?auto_299558 ) ( ON ?auto_299556 ?auto_299557 ) ( ON ?auto_299555 ?auto_299556 ) ( ON ?auto_299554 ?auto_299555 ) ( ON ?auto_299553 ?auto_299554 ) ( ON ?auto_299552 ?auto_299553 ) ( ON ?auto_299551 ?auto_299552 ) ( CLEAR ?auto_299549 ) ( ON ?auto_299550 ?auto_299551 ) ( CLEAR ?auto_299550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_299546 ?auto_299547 ?auto_299548 ?auto_299549 ?auto_299550 )
      ( MAKE-13PILE ?auto_299546 ?auto_299547 ?auto_299548 ?auto_299549 ?auto_299550 ?auto_299551 ?auto_299552 ?auto_299553 ?auto_299554 ?auto_299555 ?auto_299556 ?auto_299557 ?auto_299558 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_299573 - BLOCK
      ?auto_299574 - BLOCK
      ?auto_299575 - BLOCK
      ?auto_299576 - BLOCK
      ?auto_299577 - BLOCK
      ?auto_299578 - BLOCK
      ?auto_299579 - BLOCK
      ?auto_299580 - BLOCK
      ?auto_299581 - BLOCK
      ?auto_299582 - BLOCK
      ?auto_299583 - BLOCK
      ?auto_299584 - BLOCK
      ?auto_299585 - BLOCK
    )
    :vars
    (
      ?auto_299586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299585 ?auto_299586 ) ( ON-TABLE ?auto_299573 ) ( ON ?auto_299574 ?auto_299573 ) ( ON ?auto_299575 ?auto_299574 ) ( ON ?auto_299576 ?auto_299575 ) ( not ( = ?auto_299573 ?auto_299574 ) ) ( not ( = ?auto_299573 ?auto_299575 ) ) ( not ( = ?auto_299573 ?auto_299576 ) ) ( not ( = ?auto_299573 ?auto_299577 ) ) ( not ( = ?auto_299573 ?auto_299578 ) ) ( not ( = ?auto_299573 ?auto_299579 ) ) ( not ( = ?auto_299573 ?auto_299580 ) ) ( not ( = ?auto_299573 ?auto_299581 ) ) ( not ( = ?auto_299573 ?auto_299582 ) ) ( not ( = ?auto_299573 ?auto_299583 ) ) ( not ( = ?auto_299573 ?auto_299584 ) ) ( not ( = ?auto_299573 ?auto_299585 ) ) ( not ( = ?auto_299573 ?auto_299586 ) ) ( not ( = ?auto_299574 ?auto_299575 ) ) ( not ( = ?auto_299574 ?auto_299576 ) ) ( not ( = ?auto_299574 ?auto_299577 ) ) ( not ( = ?auto_299574 ?auto_299578 ) ) ( not ( = ?auto_299574 ?auto_299579 ) ) ( not ( = ?auto_299574 ?auto_299580 ) ) ( not ( = ?auto_299574 ?auto_299581 ) ) ( not ( = ?auto_299574 ?auto_299582 ) ) ( not ( = ?auto_299574 ?auto_299583 ) ) ( not ( = ?auto_299574 ?auto_299584 ) ) ( not ( = ?auto_299574 ?auto_299585 ) ) ( not ( = ?auto_299574 ?auto_299586 ) ) ( not ( = ?auto_299575 ?auto_299576 ) ) ( not ( = ?auto_299575 ?auto_299577 ) ) ( not ( = ?auto_299575 ?auto_299578 ) ) ( not ( = ?auto_299575 ?auto_299579 ) ) ( not ( = ?auto_299575 ?auto_299580 ) ) ( not ( = ?auto_299575 ?auto_299581 ) ) ( not ( = ?auto_299575 ?auto_299582 ) ) ( not ( = ?auto_299575 ?auto_299583 ) ) ( not ( = ?auto_299575 ?auto_299584 ) ) ( not ( = ?auto_299575 ?auto_299585 ) ) ( not ( = ?auto_299575 ?auto_299586 ) ) ( not ( = ?auto_299576 ?auto_299577 ) ) ( not ( = ?auto_299576 ?auto_299578 ) ) ( not ( = ?auto_299576 ?auto_299579 ) ) ( not ( = ?auto_299576 ?auto_299580 ) ) ( not ( = ?auto_299576 ?auto_299581 ) ) ( not ( = ?auto_299576 ?auto_299582 ) ) ( not ( = ?auto_299576 ?auto_299583 ) ) ( not ( = ?auto_299576 ?auto_299584 ) ) ( not ( = ?auto_299576 ?auto_299585 ) ) ( not ( = ?auto_299576 ?auto_299586 ) ) ( not ( = ?auto_299577 ?auto_299578 ) ) ( not ( = ?auto_299577 ?auto_299579 ) ) ( not ( = ?auto_299577 ?auto_299580 ) ) ( not ( = ?auto_299577 ?auto_299581 ) ) ( not ( = ?auto_299577 ?auto_299582 ) ) ( not ( = ?auto_299577 ?auto_299583 ) ) ( not ( = ?auto_299577 ?auto_299584 ) ) ( not ( = ?auto_299577 ?auto_299585 ) ) ( not ( = ?auto_299577 ?auto_299586 ) ) ( not ( = ?auto_299578 ?auto_299579 ) ) ( not ( = ?auto_299578 ?auto_299580 ) ) ( not ( = ?auto_299578 ?auto_299581 ) ) ( not ( = ?auto_299578 ?auto_299582 ) ) ( not ( = ?auto_299578 ?auto_299583 ) ) ( not ( = ?auto_299578 ?auto_299584 ) ) ( not ( = ?auto_299578 ?auto_299585 ) ) ( not ( = ?auto_299578 ?auto_299586 ) ) ( not ( = ?auto_299579 ?auto_299580 ) ) ( not ( = ?auto_299579 ?auto_299581 ) ) ( not ( = ?auto_299579 ?auto_299582 ) ) ( not ( = ?auto_299579 ?auto_299583 ) ) ( not ( = ?auto_299579 ?auto_299584 ) ) ( not ( = ?auto_299579 ?auto_299585 ) ) ( not ( = ?auto_299579 ?auto_299586 ) ) ( not ( = ?auto_299580 ?auto_299581 ) ) ( not ( = ?auto_299580 ?auto_299582 ) ) ( not ( = ?auto_299580 ?auto_299583 ) ) ( not ( = ?auto_299580 ?auto_299584 ) ) ( not ( = ?auto_299580 ?auto_299585 ) ) ( not ( = ?auto_299580 ?auto_299586 ) ) ( not ( = ?auto_299581 ?auto_299582 ) ) ( not ( = ?auto_299581 ?auto_299583 ) ) ( not ( = ?auto_299581 ?auto_299584 ) ) ( not ( = ?auto_299581 ?auto_299585 ) ) ( not ( = ?auto_299581 ?auto_299586 ) ) ( not ( = ?auto_299582 ?auto_299583 ) ) ( not ( = ?auto_299582 ?auto_299584 ) ) ( not ( = ?auto_299582 ?auto_299585 ) ) ( not ( = ?auto_299582 ?auto_299586 ) ) ( not ( = ?auto_299583 ?auto_299584 ) ) ( not ( = ?auto_299583 ?auto_299585 ) ) ( not ( = ?auto_299583 ?auto_299586 ) ) ( not ( = ?auto_299584 ?auto_299585 ) ) ( not ( = ?auto_299584 ?auto_299586 ) ) ( not ( = ?auto_299585 ?auto_299586 ) ) ( ON ?auto_299584 ?auto_299585 ) ( ON ?auto_299583 ?auto_299584 ) ( ON ?auto_299582 ?auto_299583 ) ( ON ?auto_299581 ?auto_299582 ) ( ON ?auto_299580 ?auto_299581 ) ( ON ?auto_299579 ?auto_299580 ) ( ON ?auto_299578 ?auto_299579 ) ( CLEAR ?auto_299576 ) ( ON ?auto_299577 ?auto_299578 ) ( CLEAR ?auto_299577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_299573 ?auto_299574 ?auto_299575 ?auto_299576 ?auto_299577 )
      ( MAKE-13PILE ?auto_299573 ?auto_299574 ?auto_299575 ?auto_299576 ?auto_299577 ?auto_299578 ?auto_299579 ?auto_299580 ?auto_299581 ?auto_299582 ?auto_299583 ?auto_299584 ?auto_299585 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_299600 - BLOCK
      ?auto_299601 - BLOCK
      ?auto_299602 - BLOCK
      ?auto_299603 - BLOCK
      ?auto_299604 - BLOCK
      ?auto_299605 - BLOCK
      ?auto_299606 - BLOCK
      ?auto_299607 - BLOCK
      ?auto_299608 - BLOCK
      ?auto_299609 - BLOCK
      ?auto_299610 - BLOCK
      ?auto_299611 - BLOCK
      ?auto_299612 - BLOCK
    )
    :vars
    (
      ?auto_299613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299612 ?auto_299613 ) ( ON-TABLE ?auto_299600 ) ( ON ?auto_299601 ?auto_299600 ) ( ON ?auto_299602 ?auto_299601 ) ( not ( = ?auto_299600 ?auto_299601 ) ) ( not ( = ?auto_299600 ?auto_299602 ) ) ( not ( = ?auto_299600 ?auto_299603 ) ) ( not ( = ?auto_299600 ?auto_299604 ) ) ( not ( = ?auto_299600 ?auto_299605 ) ) ( not ( = ?auto_299600 ?auto_299606 ) ) ( not ( = ?auto_299600 ?auto_299607 ) ) ( not ( = ?auto_299600 ?auto_299608 ) ) ( not ( = ?auto_299600 ?auto_299609 ) ) ( not ( = ?auto_299600 ?auto_299610 ) ) ( not ( = ?auto_299600 ?auto_299611 ) ) ( not ( = ?auto_299600 ?auto_299612 ) ) ( not ( = ?auto_299600 ?auto_299613 ) ) ( not ( = ?auto_299601 ?auto_299602 ) ) ( not ( = ?auto_299601 ?auto_299603 ) ) ( not ( = ?auto_299601 ?auto_299604 ) ) ( not ( = ?auto_299601 ?auto_299605 ) ) ( not ( = ?auto_299601 ?auto_299606 ) ) ( not ( = ?auto_299601 ?auto_299607 ) ) ( not ( = ?auto_299601 ?auto_299608 ) ) ( not ( = ?auto_299601 ?auto_299609 ) ) ( not ( = ?auto_299601 ?auto_299610 ) ) ( not ( = ?auto_299601 ?auto_299611 ) ) ( not ( = ?auto_299601 ?auto_299612 ) ) ( not ( = ?auto_299601 ?auto_299613 ) ) ( not ( = ?auto_299602 ?auto_299603 ) ) ( not ( = ?auto_299602 ?auto_299604 ) ) ( not ( = ?auto_299602 ?auto_299605 ) ) ( not ( = ?auto_299602 ?auto_299606 ) ) ( not ( = ?auto_299602 ?auto_299607 ) ) ( not ( = ?auto_299602 ?auto_299608 ) ) ( not ( = ?auto_299602 ?auto_299609 ) ) ( not ( = ?auto_299602 ?auto_299610 ) ) ( not ( = ?auto_299602 ?auto_299611 ) ) ( not ( = ?auto_299602 ?auto_299612 ) ) ( not ( = ?auto_299602 ?auto_299613 ) ) ( not ( = ?auto_299603 ?auto_299604 ) ) ( not ( = ?auto_299603 ?auto_299605 ) ) ( not ( = ?auto_299603 ?auto_299606 ) ) ( not ( = ?auto_299603 ?auto_299607 ) ) ( not ( = ?auto_299603 ?auto_299608 ) ) ( not ( = ?auto_299603 ?auto_299609 ) ) ( not ( = ?auto_299603 ?auto_299610 ) ) ( not ( = ?auto_299603 ?auto_299611 ) ) ( not ( = ?auto_299603 ?auto_299612 ) ) ( not ( = ?auto_299603 ?auto_299613 ) ) ( not ( = ?auto_299604 ?auto_299605 ) ) ( not ( = ?auto_299604 ?auto_299606 ) ) ( not ( = ?auto_299604 ?auto_299607 ) ) ( not ( = ?auto_299604 ?auto_299608 ) ) ( not ( = ?auto_299604 ?auto_299609 ) ) ( not ( = ?auto_299604 ?auto_299610 ) ) ( not ( = ?auto_299604 ?auto_299611 ) ) ( not ( = ?auto_299604 ?auto_299612 ) ) ( not ( = ?auto_299604 ?auto_299613 ) ) ( not ( = ?auto_299605 ?auto_299606 ) ) ( not ( = ?auto_299605 ?auto_299607 ) ) ( not ( = ?auto_299605 ?auto_299608 ) ) ( not ( = ?auto_299605 ?auto_299609 ) ) ( not ( = ?auto_299605 ?auto_299610 ) ) ( not ( = ?auto_299605 ?auto_299611 ) ) ( not ( = ?auto_299605 ?auto_299612 ) ) ( not ( = ?auto_299605 ?auto_299613 ) ) ( not ( = ?auto_299606 ?auto_299607 ) ) ( not ( = ?auto_299606 ?auto_299608 ) ) ( not ( = ?auto_299606 ?auto_299609 ) ) ( not ( = ?auto_299606 ?auto_299610 ) ) ( not ( = ?auto_299606 ?auto_299611 ) ) ( not ( = ?auto_299606 ?auto_299612 ) ) ( not ( = ?auto_299606 ?auto_299613 ) ) ( not ( = ?auto_299607 ?auto_299608 ) ) ( not ( = ?auto_299607 ?auto_299609 ) ) ( not ( = ?auto_299607 ?auto_299610 ) ) ( not ( = ?auto_299607 ?auto_299611 ) ) ( not ( = ?auto_299607 ?auto_299612 ) ) ( not ( = ?auto_299607 ?auto_299613 ) ) ( not ( = ?auto_299608 ?auto_299609 ) ) ( not ( = ?auto_299608 ?auto_299610 ) ) ( not ( = ?auto_299608 ?auto_299611 ) ) ( not ( = ?auto_299608 ?auto_299612 ) ) ( not ( = ?auto_299608 ?auto_299613 ) ) ( not ( = ?auto_299609 ?auto_299610 ) ) ( not ( = ?auto_299609 ?auto_299611 ) ) ( not ( = ?auto_299609 ?auto_299612 ) ) ( not ( = ?auto_299609 ?auto_299613 ) ) ( not ( = ?auto_299610 ?auto_299611 ) ) ( not ( = ?auto_299610 ?auto_299612 ) ) ( not ( = ?auto_299610 ?auto_299613 ) ) ( not ( = ?auto_299611 ?auto_299612 ) ) ( not ( = ?auto_299611 ?auto_299613 ) ) ( not ( = ?auto_299612 ?auto_299613 ) ) ( ON ?auto_299611 ?auto_299612 ) ( ON ?auto_299610 ?auto_299611 ) ( ON ?auto_299609 ?auto_299610 ) ( ON ?auto_299608 ?auto_299609 ) ( ON ?auto_299607 ?auto_299608 ) ( ON ?auto_299606 ?auto_299607 ) ( ON ?auto_299605 ?auto_299606 ) ( ON ?auto_299604 ?auto_299605 ) ( CLEAR ?auto_299602 ) ( ON ?auto_299603 ?auto_299604 ) ( CLEAR ?auto_299603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_299600 ?auto_299601 ?auto_299602 ?auto_299603 )
      ( MAKE-13PILE ?auto_299600 ?auto_299601 ?auto_299602 ?auto_299603 ?auto_299604 ?auto_299605 ?auto_299606 ?auto_299607 ?auto_299608 ?auto_299609 ?auto_299610 ?auto_299611 ?auto_299612 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_299627 - BLOCK
      ?auto_299628 - BLOCK
      ?auto_299629 - BLOCK
      ?auto_299630 - BLOCK
      ?auto_299631 - BLOCK
      ?auto_299632 - BLOCK
      ?auto_299633 - BLOCK
      ?auto_299634 - BLOCK
      ?auto_299635 - BLOCK
      ?auto_299636 - BLOCK
      ?auto_299637 - BLOCK
      ?auto_299638 - BLOCK
      ?auto_299639 - BLOCK
    )
    :vars
    (
      ?auto_299640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299639 ?auto_299640 ) ( ON-TABLE ?auto_299627 ) ( ON ?auto_299628 ?auto_299627 ) ( ON ?auto_299629 ?auto_299628 ) ( not ( = ?auto_299627 ?auto_299628 ) ) ( not ( = ?auto_299627 ?auto_299629 ) ) ( not ( = ?auto_299627 ?auto_299630 ) ) ( not ( = ?auto_299627 ?auto_299631 ) ) ( not ( = ?auto_299627 ?auto_299632 ) ) ( not ( = ?auto_299627 ?auto_299633 ) ) ( not ( = ?auto_299627 ?auto_299634 ) ) ( not ( = ?auto_299627 ?auto_299635 ) ) ( not ( = ?auto_299627 ?auto_299636 ) ) ( not ( = ?auto_299627 ?auto_299637 ) ) ( not ( = ?auto_299627 ?auto_299638 ) ) ( not ( = ?auto_299627 ?auto_299639 ) ) ( not ( = ?auto_299627 ?auto_299640 ) ) ( not ( = ?auto_299628 ?auto_299629 ) ) ( not ( = ?auto_299628 ?auto_299630 ) ) ( not ( = ?auto_299628 ?auto_299631 ) ) ( not ( = ?auto_299628 ?auto_299632 ) ) ( not ( = ?auto_299628 ?auto_299633 ) ) ( not ( = ?auto_299628 ?auto_299634 ) ) ( not ( = ?auto_299628 ?auto_299635 ) ) ( not ( = ?auto_299628 ?auto_299636 ) ) ( not ( = ?auto_299628 ?auto_299637 ) ) ( not ( = ?auto_299628 ?auto_299638 ) ) ( not ( = ?auto_299628 ?auto_299639 ) ) ( not ( = ?auto_299628 ?auto_299640 ) ) ( not ( = ?auto_299629 ?auto_299630 ) ) ( not ( = ?auto_299629 ?auto_299631 ) ) ( not ( = ?auto_299629 ?auto_299632 ) ) ( not ( = ?auto_299629 ?auto_299633 ) ) ( not ( = ?auto_299629 ?auto_299634 ) ) ( not ( = ?auto_299629 ?auto_299635 ) ) ( not ( = ?auto_299629 ?auto_299636 ) ) ( not ( = ?auto_299629 ?auto_299637 ) ) ( not ( = ?auto_299629 ?auto_299638 ) ) ( not ( = ?auto_299629 ?auto_299639 ) ) ( not ( = ?auto_299629 ?auto_299640 ) ) ( not ( = ?auto_299630 ?auto_299631 ) ) ( not ( = ?auto_299630 ?auto_299632 ) ) ( not ( = ?auto_299630 ?auto_299633 ) ) ( not ( = ?auto_299630 ?auto_299634 ) ) ( not ( = ?auto_299630 ?auto_299635 ) ) ( not ( = ?auto_299630 ?auto_299636 ) ) ( not ( = ?auto_299630 ?auto_299637 ) ) ( not ( = ?auto_299630 ?auto_299638 ) ) ( not ( = ?auto_299630 ?auto_299639 ) ) ( not ( = ?auto_299630 ?auto_299640 ) ) ( not ( = ?auto_299631 ?auto_299632 ) ) ( not ( = ?auto_299631 ?auto_299633 ) ) ( not ( = ?auto_299631 ?auto_299634 ) ) ( not ( = ?auto_299631 ?auto_299635 ) ) ( not ( = ?auto_299631 ?auto_299636 ) ) ( not ( = ?auto_299631 ?auto_299637 ) ) ( not ( = ?auto_299631 ?auto_299638 ) ) ( not ( = ?auto_299631 ?auto_299639 ) ) ( not ( = ?auto_299631 ?auto_299640 ) ) ( not ( = ?auto_299632 ?auto_299633 ) ) ( not ( = ?auto_299632 ?auto_299634 ) ) ( not ( = ?auto_299632 ?auto_299635 ) ) ( not ( = ?auto_299632 ?auto_299636 ) ) ( not ( = ?auto_299632 ?auto_299637 ) ) ( not ( = ?auto_299632 ?auto_299638 ) ) ( not ( = ?auto_299632 ?auto_299639 ) ) ( not ( = ?auto_299632 ?auto_299640 ) ) ( not ( = ?auto_299633 ?auto_299634 ) ) ( not ( = ?auto_299633 ?auto_299635 ) ) ( not ( = ?auto_299633 ?auto_299636 ) ) ( not ( = ?auto_299633 ?auto_299637 ) ) ( not ( = ?auto_299633 ?auto_299638 ) ) ( not ( = ?auto_299633 ?auto_299639 ) ) ( not ( = ?auto_299633 ?auto_299640 ) ) ( not ( = ?auto_299634 ?auto_299635 ) ) ( not ( = ?auto_299634 ?auto_299636 ) ) ( not ( = ?auto_299634 ?auto_299637 ) ) ( not ( = ?auto_299634 ?auto_299638 ) ) ( not ( = ?auto_299634 ?auto_299639 ) ) ( not ( = ?auto_299634 ?auto_299640 ) ) ( not ( = ?auto_299635 ?auto_299636 ) ) ( not ( = ?auto_299635 ?auto_299637 ) ) ( not ( = ?auto_299635 ?auto_299638 ) ) ( not ( = ?auto_299635 ?auto_299639 ) ) ( not ( = ?auto_299635 ?auto_299640 ) ) ( not ( = ?auto_299636 ?auto_299637 ) ) ( not ( = ?auto_299636 ?auto_299638 ) ) ( not ( = ?auto_299636 ?auto_299639 ) ) ( not ( = ?auto_299636 ?auto_299640 ) ) ( not ( = ?auto_299637 ?auto_299638 ) ) ( not ( = ?auto_299637 ?auto_299639 ) ) ( not ( = ?auto_299637 ?auto_299640 ) ) ( not ( = ?auto_299638 ?auto_299639 ) ) ( not ( = ?auto_299638 ?auto_299640 ) ) ( not ( = ?auto_299639 ?auto_299640 ) ) ( ON ?auto_299638 ?auto_299639 ) ( ON ?auto_299637 ?auto_299638 ) ( ON ?auto_299636 ?auto_299637 ) ( ON ?auto_299635 ?auto_299636 ) ( ON ?auto_299634 ?auto_299635 ) ( ON ?auto_299633 ?auto_299634 ) ( ON ?auto_299632 ?auto_299633 ) ( ON ?auto_299631 ?auto_299632 ) ( CLEAR ?auto_299629 ) ( ON ?auto_299630 ?auto_299631 ) ( CLEAR ?auto_299630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_299627 ?auto_299628 ?auto_299629 ?auto_299630 )
      ( MAKE-13PILE ?auto_299627 ?auto_299628 ?auto_299629 ?auto_299630 ?auto_299631 ?auto_299632 ?auto_299633 ?auto_299634 ?auto_299635 ?auto_299636 ?auto_299637 ?auto_299638 ?auto_299639 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_299654 - BLOCK
      ?auto_299655 - BLOCK
      ?auto_299656 - BLOCK
      ?auto_299657 - BLOCK
      ?auto_299658 - BLOCK
      ?auto_299659 - BLOCK
      ?auto_299660 - BLOCK
      ?auto_299661 - BLOCK
      ?auto_299662 - BLOCK
      ?auto_299663 - BLOCK
      ?auto_299664 - BLOCK
      ?auto_299665 - BLOCK
      ?auto_299666 - BLOCK
    )
    :vars
    (
      ?auto_299667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299666 ?auto_299667 ) ( ON-TABLE ?auto_299654 ) ( ON ?auto_299655 ?auto_299654 ) ( not ( = ?auto_299654 ?auto_299655 ) ) ( not ( = ?auto_299654 ?auto_299656 ) ) ( not ( = ?auto_299654 ?auto_299657 ) ) ( not ( = ?auto_299654 ?auto_299658 ) ) ( not ( = ?auto_299654 ?auto_299659 ) ) ( not ( = ?auto_299654 ?auto_299660 ) ) ( not ( = ?auto_299654 ?auto_299661 ) ) ( not ( = ?auto_299654 ?auto_299662 ) ) ( not ( = ?auto_299654 ?auto_299663 ) ) ( not ( = ?auto_299654 ?auto_299664 ) ) ( not ( = ?auto_299654 ?auto_299665 ) ) ( not ( = ?auto_299654 ?auto_299666 ) ) ( not ( = ?auto_299654 ?auto_299667 ) ) ( not ( = ?auto_299655 ?auto_299656 ) ) ( not ( = ?auto_299655 ?auto_299657 ) ) ( not ( = ?auto_299655 ?auto_299658 ) ) ( not ( = ?auto_299655 ?auto_299659 ) ) ( not ( = ?auto_299655 ?auto_299660 ) ) ( not ( = ?auto_299655 ?auto_299661 ) ) ( not ( = ?auto_299655 ?auto_299662 ) ) ( not ( = ?auto_299655 ?auto_299663 ) ) ( not ( = ?auto_299655 ?auto_299664 ) ) ( not ( = ?auto_299655 ?auto_299665 ) ) ( not ( = ?auto_299655 ?auto_299666 ) ) ( not ( = ?auto_299655 ?auto_299667 ) ) ( not ( = ?auto_299656 ?auto_299657 ) ) ( not ( = ?auto_299656 ?auto_299658 ) ) ( not ( = ?auto_299656 ?auto_299659 ) ) ( not ( = ?auto_299656 ?auto_299660 ) ) ( not ( = ?auto_299656 ?auto_299661 ) ) ( not ( = ?auto_299656 ?auto_299662 ) ) ( not ( = ?auto_299656 ?auto_299663 ) ) ( not ( = ?auto_299656 ?auto_299664 ) ) ( not ( = ?auto_299656 ?auto_299665 ) ) ( not ( = ?auto_299656 ?auto_299666 ) ) ( not ( = ?auto_299656 ?auto_299667 ) ) ( not ( = ?auto_299657 ?auto_299658 ) ) ( not ( = ?auto_299657 ?auto_299659 ) ) ( not ( = ?auto_299657 ?auto_299660 ) ) ( not ( = ?auto_299657 ?auto_299661 ) ) ( not ( = ?auto_299657 ?auto_299662 ) ) ( not ( = ?auto_299657 ?auto_299663 ) ) ( not ( = ?auto_299657 ?auto_299664 ) ) ( not ( = ?auto_299657 ?auto_299665 ) ) ( not ( = ?auto_299657 ?auto_299666 ) ) ( not ( = ?auto_299657 ?auto_299667 ) ) ( not ( = ?auto_299658 ?auto_299659 ) ) ( not ( = ?auto_299658 ?auto_299660 ) ) ( not ( = ?auto_299658 ?auto_299661 ) ) ( not ( = ?auto_299658 ?auto_299662 ) ) ( not ( = ?auto_299658 ?auto_299663 ) ) ( not ( = ?auto_299658 ?auto_299664 ) ) ( not ( = ?auto_299658 ?auto_299665 ) ) ( not ( = ?auto_299658 ?auto_299666 ) ) ( not ( = ?auto_299658 ?auto_299667 ) ) ( not ( = ?auto_299659 ?auto_299660 ) ) ( not ( = ?auto_299659 ?auto_299661 ) ) ( not ( = ?auto_299659 ?auto_299662 ) ) ( not ( = ?auto_299659 ?auto_299663 ) ) ( not ( = ?auto_299659 ?auto_299664 ) ) ( not ( = ?auto_299659 ?auto_299665 ) ) ( not ( = ?auto_299659 ?auto_299666 ) ) ( not ( = ?auto_299659 ?auto_299667 ) ) ( not ( = ?auto_299660 ?auto_299661 ) ) ( not ( = ?auto_299660 ?auto_299662 ) ) ( not ( = ?auto_299660 ?auto_299663 ) ) ( not ( = ?auto_299660 ?auto_299664 ) ) ( not ( = ?auto_299660 ?auto_299665 ) ) ( not ( = ?auto_299660 ?auto_299666 ) ) ( not ( = ?auto_299660 ?auto_299667 ) ) ( not ( = ?auto_299661 ?auto_299662 ) ) ( not ( = ?auto_299661 ?auto_299663 ) ) ( not ( = ?auto_299661 ?auto_299664 ) ) ( not ( = ?auto_299661 ?auto_299665 ) ) ( not ( = ?auto_299661 ?auto_299666 ) ) ( not ( = ?auto_299661 ?auto_299667 ) ) ( not ( = ?auto_299662 ?auto_299663 ) ) ( not ( = ?auto_299662 ?auto_299664 ) ) ( not ( = ?auto_299662 ?auto_299665 ) ) ( not ( = ?auto_299662 ?auto_299666 ) ) ( not ( = ?auto_299662 ?auto_299667 ) ) ( not ( = ?auto_299663 ?auto_299664 ) ) ( not ( = ?auto_299663 ?auto_299665 ) ) ( not ( = ?auto_299663 ?auto_299666 ) ) ( not ( = ?auto_299663 ?auto_299667 ) ) ( not ( = ?auto_299664 ?auto_299665 ) ) ( not ( = ?auto_299664 ?auto_299666 ) ) ( not ( = ?auto_299664 ?auto_299667 ) ) ( not ( = ?auto_299665 ?auto_299666 ) ) ( not ( = ?auto_299665 ?auto_299667 ) ) ( not ( = ?auto_299666 ?auto_299667 ) ) ( ON ?auto_299665 ?auto_299666 ) ( ON ?auto_299664 ?auto_299665 ) ( ON ?auto_299663 ?auto_299664 ) ( ON ?auto_299662 ?auto_299663 ) ( ON ?auto_299661 ?auto_299662 ) ( ON ?auto_299660 ?auto_299661 ) ( ON ?auto_299659 ?auto_299660 ) ( ON ?auto_299658 ?auto_299659 ) ( ON ?auto_299657 ?auto_299658 ) ( CLEAR ?auto_299655 ) ( ON ?auto_299656 ?auto_299657 ) ( CLEAR ?auto_299656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_299654 ?auto_299655 ?auto_299656 )
      ( MAKE-13PILE ?auto_299654 ?auto_299655 ?auto_299656 ?auto_299657 ?auto_299658 ?auto_299659 ?auto_299660 ?auto_299661 ?auto_299662 ?auto_299663 ?auto_299664 ?auto_299665 ?auto_299666 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_299681 - BLOCK
      ?auto_299682 - BLOCK
      ?auto_299683 - BLOCK
      ?auto_299684 - BLOCK
      ?auto_299685 - BLOCK
      ?auto_299686 - BLOCK
      ?auto_299687 - BLOCK
      ?auto_299688 - BLOCK
      ?auto_299689 - BLOCK
      ?auto_299690 - BLOCK
      ?auto_299691 - BLOCK
      ?auto_299692 - BLOCK
      ?auto_299693 - BLOCK
    )
    :vars
    (
      ?auto_299694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299693 ?auto_299694 ) ( ON-TABLE ?auto_299681 ) ( ON ?auto_299682 ?auto_299681 ) ( not ( = ?auto_299681 ?auto_299682 ) ) ( not ( = ?auto_299681 ?auto_299683 ) ) ( not ( = ?auto_299681 ?auto_299684 ) ) ( not ( = ?auto_299681 ?auto_299685 ) ) ( not ( = ?auto_299681 ?auto_299686 ) ) ( not ( = ?auto_299681 ?auto_299687 ) ) ( not ( = ?auto_299681 ?auto_299688 ) ) ( not ( = ?auto_299681 ?auto_299689 ) ) ( not ( = ?auto_299681 ?auto_299690 ) ) ( not ( = ?auto_299681 ?auto_299691 ) ) ( not ( = ?auto_299681 ?auto_299692 ) ) ( not ( = ?auto_299681 ?auto_299693 ) ) ( not ( = ?auto_299681 ?auto_299694 ) ) ( not ( = ?auto_299682 ?auto_299683 ) ) ( not ( = ?auto_299682 ?auto_299684 ) ) ( not ( = ?auto_299682 ?auto_299685 ) ) ( not ( = ?auto_299682 ?auto_299686 ) ) ( not ( = ?auto_299682 ?auto_299687 ) ) ( not ( = ?auto_299682 ?auto_299688 ) ) ( not ( = ?auto_299682 ?auto_299689 ) ) ( not ( = ?auto_299682 ?auto_299690 ) ) ( not ( = ?auto_299682 ?auto_299691 ) ) ( not ( = ?auto_299682 ?auto_299692 ) ) ( not ( = ?auto_299682 ?auto_299693 ) ) ( not ( = ?auto_299682 ?auto_299694 ) ) ( not ( = ?auto_299683 ?auto_299684 ) ) ( not ( = ?auto_299683 ?auto_299685 ) ) ( not ( = ?auto_299683 ?auto_299686 ) ) ( not ( = ?auto_299683 ?auto_299687 ) ) ( not ( = ?auto_299683 ?auto_299688 ) ) ( not ( = ?auto_299683 ?auto_299689 ) ) ( not ( = ?auto_299683 ?auto_299690 ) ) ( not ( = ?auto_299683 ?auto_299691 ) ) ( not ( = ?auto_299683 ?auto_299692 ) ) ( not ( = ?auto_299683 ?auto_299693 ) ) ( not ( = ?auto_299683 ?auto_299694 ) ) ( not ( = ?auto_299684 ?auto_299685 ) ) ( not ( = ?auto_299684 ?auto_299686 ) ) ( not ( = ?auto_299684 ?auto_299687 ) ) ( not ( = ?auto_299684 ?auto_299688 ) ) ( not ( = ?auto_299684 ?auto_299689 ) ) ( not ( = ?auto_299684 ?auto_299690 ) ) ( not ( = ?auto_299684 ?auto_299691 ) ) ( not ( = ?auto_299684 ?auto_299692 ) ) ( not ( = ?auto_299684 ?auto_299693 ) ) ( not ( = ?auto_299684 ?auto_299694 ) ) ( not ( = ?auto_299685 ?auto_299686 ) ) ( not ( = ?auto_299685 ?auto_299687 ) ) ( not ( = ?auto_299685 ?auto_299688 ) ) ( not ( = ?auto_299685 ?auto_299689 ) ) ( not ( = ?auto_299685 ?auto_299690 ) ) ( not ( = ?auto_299685 ?auto_299691 ) ) ( not ( = ?auto_299685 ?auto_299692 ) ) ( not ( = ?auto_299685 ?auto_299693 ) ) ( not ( = ?auto_299685 ?auto_299694 ) ) ( not ( = ?auto_299686 ?auto_299687 ) ) ( not ( = ?auto_299686 ?auto_299688 ) ) ( not ( = ?auto_299686 ?auto_299689 ) ) ( not ( = ?auto_299686 ?auto_299690 ) ) ( not ( = ?auto_299686 ?auto_299691 ) ) ( not ( = ?auto_299686 ?auto_299692 ) ) ( not ( = ?auto_299686 ?auto_299693 ) ) ( not ( = ?auto_299686 ?auto_299694 ) ) ( not ( = ?auto_299687 ?auto_299688 ) ) ( not ( = ?auto_299687 ?auto_299689 ) ) ( not ( = ?auto_299687 ?auto_299690 ) ) ( not ( = ?auto_299687 ?auto_299691 ) ) ( not ( = ?auto_299687 ?auto_299692 ) ) ( not ( = ?auto_299687 ?auto_299693 ) ) ( not ( = ?auto_299687 ?auto_299694 ) ) ( not ( = ?auto_299688 ?auto_299689 ) ) ( not ( = ?auto_299688 ?auto_299690 ) ) ( not ( = ?auto_299688 ?auto_299691 ) ) ( not ( = ?auto_299688 ?auto_299692 ) ) ( not ( = ?auto_299688 ?auto_299693 ) ) ( not ( = ?auto_299688 ?auto_299694 ) ) ( not ( = ?auto_299689 ?auto_299690 ) ) ( not ( = ?auto_299689 ?auto_299691 ) ) ( not ( = ?auto_299689 ?auto_299692 ) ) ( not ( = ?auto_299689 ?auto_299693 ) ) ( not ( = ?auto_299689 ?auto_299694 ) ) ( not ( = ?auto_299690 ?auto_299691 ) ) ( not ( = ?auto_299690 ?auto_299692 ) ) ( not ( = ?auto_299690 ?auto_299693 ) ) ( not ( = ?auto_299690 ?auto_299694 ) ) ( not ( = ?auto_299691 ?auto_299692 ) ) ( not ( = ?auto_299691 ?auto_299693 ) ) ( not ( = ?auto_299691 ?auto_299694 ) ) ( not ( = ?auto_299692 ?auto_299693 ) ) ( not ( = ?auto_299692 ?auto_299694 ) ) ( not ( = ?auto_299693 ?auto_299694 ) ) ( ON ?auto_299692 ?auto_299693 ) ( ON ?auto_299691 ?auto_299692 ) ( ON ?auto_299690 ?auto_299691 ) ( ON ?auto_299689 ?auto_299690 ) ( ON ?auto_299688 ?auto_299689 ) ( ON ?auto_299687 ?auto_299688 ) ( ON ?auto_299686 ?auto_299687 ) ( ON ?auto_299685 ?auto_299686 ) ( ON ?auto_299684 ?auto_299685 ) ( CLEAR ?auto_299682 ) ( ON ?auto_299683 ?auto_299684 ) ( CLEAR ?auto_299683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_299681 ?auto_299682 ?auto_299683 )
      ( MAKE-13PILE ?auto_299681 ?auto_299682 ?auto_299683 ?auto_299684 ?auto_299685 ?auto_299686 ?auto_299687 ?auto_299688 ?auto_299689 ?auto_299690 ?auto_299691 ?auto_299692 ?auto_299693 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_299708 - BLOCK
      ?auto_299709 - BLOCK
      ?auto_299710 - BLOCK
      ?auto_299711 - BLOCK
      ?auto_299712 - BLOCK
      ?auto_299713 - BLOCK
      ?auto_299714 - BLOCK
      ?auto_299715 - BLOCK
      ?auto_299716 - BLOCK
      ?auto_299717 - BLOCK
      ?auto_299718 - BLOCK
      ?auto_299719 - BLOCK
      ?auto_299720 - BLOCK
    )
    :vars
    (
      ?auto_299721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299720 ?auto_299721 ) ( ON-TABLE ?auto_299708 ) ( not ( = ?auto_299708 ?auto_299709 ) ) ( not ( = ?auto_299708 ?auto_299710 ) ) ( not ( = ?auto_299708 ?auto_299711 ) ) ( not ( = ?auto_299708 ?auto_299712 ) ) ( not ( = ?auto_299708 ?auto_299713 ) ) ( not ( = ?auto_299708 ?auto_299714 ) ) ( not ( = ?auto_299708 ?auto_299715 ) ) ( not ( = ?auto_299708 ?auto_299716 ) ) ( not ( = ?auto_299708 ?auto_299717 ) ) ( not ( = ?auto_299708 ?auto_299718 ) ) ( not ( = ?auto_299708 ?auto_299719 ) ) ( not ( = ?auto_299708 ?auto_299720 ) ) ( not ( = ?auto_299708 ?auto_299721 ) ) ( not ( = ?auto_299709 ?auto_299710 ) ) ( not ( = ?auto_299709 ?auto_299711 ) ) ( not ( = ?auto_299709 ?auto_299712 ) ) ( not ( = ?auto_299709 ?auto_299713 ) ) ( not ( = ?auto_299709 ?auto_299714 ) ) ( not ( = ?auto_299709 ?auto_299715 ) ) ( not ( = ?auto_299709 ?auto_299716 ) ) ( not ( = ?auto_299709 ?auto_299717 ) ) ( not ( = ?auto_299709 ?auto_299718 ) ) ( not ( = ?auto_299709 ?auto_299719 ) ) ( not ( = ?auto_299709 ?auto_299720 ) ) ( not ( = ?auto_299709 ?auto_299721 ) ) ( not ( = ?auto_299710 ?auto_299711 ) ) ( not ( = ?auto_299710 ?auto_299712 ) ) ( not ( = ?auto_299710 ?auto_299713 ) ) ( not ( = ?auto_299710 ?auto_299714 ) ) ( not ( = ?auto_299710 ?auto_299715 ) ) ( not ( = ?auto_299710 ?auto_299716 ) ) ( not ( = ?auto_299710 ?auto_299717 ) ) ( not ( = ?auto_299710 ?auto_299718 ) ) ( not ( = ?auto_299710 ?auto_299719 ) ) ( not ( = ?auto_299710 ?auto_299720 ) ) ( not ( = ?auto_299710 ?auto_299721 ) ) ( not ( = ?auto_299711 ?auto_299712 ) ) ( not ( = ?auto_299711 ?auto_299713 ) ) ( not ( = ?auto_299711 ?auto_299714 ) ) ( not ( = ?auto_299711 ?auto_299715 ) ) ( not ( = ?auto_299711 ?auto_299716 ) ) ( not ( = ?auto_299711 ?auto_299717 ) ) ( not ( = ?auto_299711 ?auto_299718 ) ) ( not ( = ?auto_299711 ?auto_299719 ) ) ( not ( = ?auto_299711 ?auto_299720 ) ) ( not ( = ?auto_299711 ?auto_299721 ) ) ( not ( = ?auto_299712 ?auto_299713 ) ) ( not ( = ?auto_299712 ?auto_299714 ) ) ( not ( = ?auto_299712 ?auto_299715 ) ) ( not ( = ?auto_299712 ?auto_299716 ) ) ( not ( = ?auto_299712 ?auto_299717 ) ) ( not ( = ?auto_299712 ?auto_299718 ) ) ( not ( = ?auto_299712 ?auto_299719 ) ) ( not ( = ?auto_299712 ?auto_299720 ) ) ( not ( = ?auto_299712 ?auto_299721 ) ) ( not ( = ?auto_299713 ?auto_299714 ) ) ( not ( = ?auto_299713 ?auto_299715 ) ) ( not ( = ?auto_299713 ?auto_299716 ) ) ( not ( = ?auto_299713 ?auto_299717 ) ) ( not ( = ?auto_299713 ?auto_299718 ) ) ( not ( = ?auto_299713 ?auto_299719 ) ) ( not ( = ?auto_299713 ?auto_299720 ) ) ( not ( = ?auto_299713 ?auto_299721 ) ) ( not ( = ?auto_299714 ?auto_299715 ) ) ( not ( = ?auto_299714 ?auto_299716 ) ) ( not ( = ?auto_299714 ?auto_299717 ) ) ( not ( = ?auto_299714 ?auto_299718 ) ) ( not ( = ?auto_299714 ?auto_299719 ) ) ( not ( = ?auto_299714 ?auto_299720 ) ) ( not ( = ?auto_299714 ?auto_299721 ) ) ( not ( = ?auto_299715 ?auto_299716 ) ) ( not ( = ?auto_299715 ?auto_299717 ) ) ( not ( = ?auto_299715 ?auto_299718 ) ) ( not ( = ?auto_299715 ?auto_299719 ) ) ( not ( = ?auto_299715 ?auto_299720 ) ) ( not ( = ?auto_299715 ?auto_299721 ) ) ( not ( = ?auto_299716 ?auto_299717 ) ) ( not ( = ?auto_299716 ?auto_299718 ) ) ( not ( = ?auto_299716 ?auto_299719 ) ) ( not ( = ?auto_299716 ?auto_299720 ) ) ( not ( = ?auto_299716 ?auto_299721 ) ) ( not ( = ?auto_299717 ?auto_299718 ) ) ( not ( = ?auto_299717 ?auto_299719 ) ) ( not ( = ?auto_299717 ?auto_299720 ) ) ( not ( = ?auto_299717 ?auto_299721 ) ) ( not ( = ?auto_299718 ?auto_299719 ) ) ( not ( = ?auto_299718 ?auto_299720 ) ) ( not ( = ?auto_299718 ?auto_299721 ) ) ( not ( = ?auto_299719 ?auto_299720 ) ) ( not ( = ?auto_299719 ?auto_299721 ) ) ( not ( = ?auto_299720 ?auto_299721 ) ) ( ON ?auto_299719 ?auto_299720 ) ( ON ?auto_299718 ?auto_299719 ) ( ON ?auto_299717 ?auto_299718 ) ( ON ?auto_299716 ?auto_299717 ) ( ON ?auto_299715 ?auto_299716 ) ( ON ?auto_299714 ?auto_299715 ) ( ON ?auto_299713 ?auto_299714 ) ( ON ?auto_299712 ?auto_299713 ) ( ON ?auto_299711 ?auto_299712 ) ( ON ?auto_299710 ?auto_299711 ) ( CLEAR ?auto_299708 ) ( ON ?auto_299709 ?auto_299710 ) ( CLEAR ?auto_299709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_299708 ?auto_299709 )
      ( MAKE-13PILE ?auto_299708 ?auto_299709 ?auto_299710 ?auto_299711 ?auto_299712 ?auto_299713 ?auto_299714 ?auto_299715 ?auto_299716 ?auto_299717 ?auto_299718 ?auto_299719 ?auto_299720 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_299735 - BLOCK
      ?auto_299736 - BLOCK
      ?auto_299737 - BLOCK
      ?auto_299738 - BLOCK
      ?auto_299739 - BLOCK
      ?auto_299740 - BLOCK
      ?auto_299741 - BLOCK
      ?auto_299742 - BLOCK
      ?auto_299743 - BLOCK
      ?auto_299744 - BLOCK
      ?auto_299745 - BLOCK
      ?auto_299746 - BLOCK
      ?auto_299747 - BLOCK
    )
    :vars
    (
      ?auto_299748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299747 ?auto_299748 ) ( ON-TABLE ?auto_299735 ) ( not ( = ?auto_299735 ?auto_299736 ) ) ( not ( = ?auto_299735 ?auto_299737 ) ) ( not ( = ?auto_299735 ?auto_299738 ) ) ( not ( = ?auto_299735 ?auto_299739 ) ) ( not ( = ?auto_299735 ?auto_299740 ) ) ( not ( = ?auto_299735 ?auto_299741 ) ) ( not ( = ?auto_299735 ?auto_299742 ) ) ( not ( = ?auto_299735 ?auto_299743 ) ) ( not ( = ?auto_299735 ?auto_299744 ) ) ( not ( = ?auto_299735 ?auto_299745 ) ) ( not ( = ?auto_299735 ?auto_299746 ) ) ( not ( = ?auto_299735 ?auto_299747 ) ) ( not ( = ?auto_299735 ?auto_299748 ) ) ( not ( = ?auto_299736 ?auto_299737 ) ) ( not ( = ?auto_299736 ?auto_299738 ) ) ( not ( = ?auto_299736 ?auto_299739 ) ) ( not ( = ?auto_299736 ?auto_299740 ) ) ( not ( = ?auto_299736 ?auto_299741 ) ) ( not ( = ?auto_299736 ?auto_299742 ) ) ( not ( = ?auto_299736 ?auto_299743 ) ) ( not ( = ?auto_299736 ?auto_299744 ) ) ( not ( = ?auto_299736 ?auto_299745 ) ) ( not ( = ?auto_299736 ?auto_299746 ) ) ( not ( = ?auto_299736 ?auto_299747 ) ) ( not ( = ?auto_299736 ?auto_299748 ) ) ( not ( = ?auto_299737 ?auto_299738 ) ) ( not ( = ?auto_299737 ?auto_299739 ) ) ( not ( = ?auto_299737 ?auto_299740 ) ) ( not ( = ?auto_299737 ?auto_299741 ) ) ( not ( = ?auto_299737 ?auto_299742 ) ) ( not ( = ?auto_299737 ?auto_299743 ) ) ( not ( = ?auto_299737 ?auto_299744 ) ) ( not ( = ?auto_299737 ?auto_299745 ) ) ( not ( = ?auto_299737 ?auto_299746 ) ) ( not ( = ?auto_299737 ?auto_299747 ) ) ( not ( = ?auto_299737 ?auto_299748 ) ) ( not ( = ?auto_299738 ?auto_299739 ) ) ( not ( = ?auto_299738 ?auto_299740 ) ) ( not ( = ?auto_299738 ?auto_299741 ) ) ( not ( = ?auto_299738 ?auto_299742 ) ) ( not ( = ?auto_299738 ?auto_299743 ) ) ( not ( = ?auto_299738 ?auto_299744 ) ) ( not ( = ?auto_299738 ?auto_299745 ) ) ( not ( = ?auto_299738 ?auto_299746 ) ) ( not ( = ?auto_299738 ?auto_299747 ) ) ( not ( = ?auto_299738 ?auto_299748 ) ) ( not ( = ?auto_299739 ?auto_299740 ) ) ( not ( = ?auto_299739 ?auto_299741 ) ) ( not ( = ?auto_299739 ?auto_299742 ) ) ( not ( = ?auto_299739 ?auto_299743 ) ) ( not ( = ?auto_299739 ?auto_299744 ) ) ( not ( = ?auto_299739 ?auto_299745 ) ) ( not ( = ?auto_299739 ?auto_299746 ) ) ( not ( = ?auto_299739 ?auto_299747 ) ) ( not ( = ?auto_299739 ?auto_299748 ) ) ( not ( = ?auto_299740 ?auto_299741 ) ) ( not ( = ?auto_299740 ?auto_299742 ) ) ( not ( = ?auto_299740 ?auto_299743 ) ) ( not ( = ?auto_299740 ?auto_299744 ) ) ( not ( = ?auto_299740 ?auto_299745 ) ) ( not ( = ?auto_299740 ?auto_299746 ) ) ( not ( = ?auto_299740 ?auto_299747 ) ) ( not ( = ?auto_299740 ?auto_299748 ) ) ( not ( = ?auto_299741 ?auto_299742 ) ) ( not ( = ?auto_299741 ?auto_299743 ) ) ( not ( = ?auto_299741 ?auto_299744 ) ) ( not ( = ?auto_299741 ?auto_299745 ) ) ( not ( = ?auto_299741 ?auto_299746 ) ) ( not ( = ?auto_299741 ?auto_299747 ) ) ( not ( = ?auto_299741 ?auto_299748 ) ) ( not ( = ?auto_299742 ?auto_299743 ) ) ( not ( = ?auto_299742 ?auto_299744 ) ) ( not ( = ?auto_299742 ?auto_299745 ) ) ( not ( = ?auto_299742 ?auto_299746 ) ) ( not ( = ?auto_299742 ?auto_299747 ) ) ( not ( = ?auto_299742 ?auto_299748 ) ) ( not ( = ?auto_299743 ?auto_299744 ) ) ( not ( = ?auto_299743 ?auto_299745 ) ) ( not ( = ?auto_299743 ?auto_299746 ) ) ( not ( = ?auto_299743 ?auto_299747 ) ) ( not ( = ?auto_299743 ?auto_299748 ) ) ( not ( = ?auto_299744 ?auto_299745 ) ) ( not ( = ?auto_299744 ?auto_299746 ) ) ( not ( = ?auto_299744 ?auto_299747 ) ) ( not ( = ?auto_299744 ?auto_299748 ) ) ( not ( = ?auto_299745 ?auto_299746 ) ) ( not ( = ?auto_299745 ?auto_299747 ) ) ( not ( = ?auto_299745 ?auto_299748 ) ) ( not ( = ?auto_299746 ?auto_299747 ) ) ( not ( = ?auto_299746 ?auto_299748 ) ) ( not ( = ?auto_299747 ?auto_299748 ) ) ( ON ?auto_299746 ?auto_299747 ) ( ON ?auto_299745 ?auto_299746 ) ( ON ?auto_299744 ?auto_299745 ) ( ON ?auto_299743 ?auto_299744 ) ( ON ?auto_299742 ?auto_299743 ) ( ON ?auto_299741 ?auto_299742 ) ( ON ?auto_299740 ?auto_299741 ) ( ON ?auto_299739 ?auto_299740 ) ( ON ?auto_299738 ?auto_299739 ) ( ON ?auto_299737 ?auto_299738 ) ( CLEAR ?auto_299735 ) ( ON ?auto_299736 ?auto_299737 ) ( CLEAR ?auto_299736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_299735 ?auto_299736 )
      ( MAKE-13PILE ?auto_299735 ?auto_299736 ?auto_299737 ?auto_299738 ?auto_299739 ?auto_299740 ?auto_299741 ?auto_299742 ?auto_299743 ?auto_299744 ?auto_299745 ?auto_299746 ?auto_299747 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_299762 - BLOCK
      ?auto_299763 - BLOCK
      ?auto_299764 - BLOCK
      ?auto_299765 - BLOCK
      ?auto_299766 - BLOCK
      ?auto_299767 - BLOCK
      ?auto_299768 - BLOCK
      ?auto_299769 - BLOCK
      ?auto_299770 - BLOCK
      ?auto_299771 - BLOCK
      ?auto_299772 - BLOCK
      ?auto_299773 - BLOCK
      ?auto_299774 - BLOCK
    )
    :vars
    (
      ?auto_299775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299774 ?auto_299775 ) ( not ( = ?auto_299762 ?auto_299763 ) ) ( not ( = ?auto_299762 ?auto_299764 ) ) ( not ( = ?auto_299762 ?auto_299765 ) ) ( not ( = ?auto_299762 ?auto_299766 ) ) ( not ( = ?auto_299762 ?auto_299767 ) ) ( not ( = ?auto_299762 ?auto_299768 ) ) ( not ( = ?auto_299762 ?auto_299769 ) ) ( not ( = ?auto_299762 ?auto_299770 ) ) ( not ( = ?auto_299762 ?auto_299771 ) ) ( not ( = ?auto_299762 ?auto_299772 ) ) ( not ( = ?auto_299762 ?auto_299773 ) ) ( not ( = ?auto_299762 ?auto_299774 ) ) ( not ( = ?auto_299762 ?auto_299775 ) ) ( not ( = ?auto_299763 ?auto_299764 ) ) ( not ( = ?auto_299763 ?auto_299765 ) ) ( not ( = ?auto_299763 ?auto_299766 ) ) ( not ( = ?auto_299763 ?auto_299767 ) ) ( not ( = ?auto_299763 ?auto_299768 ) ) ( not ( = ?auto_299763 ?auto_299769 ) ) ( not ( = ?auto_299763 ?auto_299770 ) ) ( not ( = ?auto_299763 ?auto_299771 ) ) ( not ( = ?auto_299763 ?auto_299772 ) ) ( not ( = ?auto_299763 ?auto_299773 ) ) ( not ( = ?auto_299763 ?auto_299774 ) ) ( not ( = ?auto_299763 ?auto_299775 ) ) ( not ( = ?auto_299764 ?auto_299765 ) ) ( not ( = ?auto_299764 ?auto_299766 ) ) ( not ( = ?auto_299764 ?auto_299767 ) ) ( not ( = ?auto_299764 ?auto_299768 ) ) ( not ( = ?auto_299764 ?auto_299769 ) ) ( not ( = ?auto_299764 ?auto_299770 ) ) ( not ( = ?auto_299764 ?auto_299771 ) ) ( not ( = ?auto_299764 ?auto_299772 ) ) ( not ( = ?auto_299764 ?auto_299773 ) ) ( not ( = ?auto_299764 ?auto_299774 ) ) ( not ( = ?auto_299764 ?auto_299775 ) ) ( not ( = ?auto_299765 ?auto_299766 ) ) ( not ( = ?auto_299765 ?auto_299767 ) ) ( not ( = ?auto_299765 ?auto_299768 ) ) ( not ( = ?auto_299765 ?auto_299769 ) ) ( not ( = ?auto_299765 ?auto_299770 ) ) ( not ( = ?auto_299765 ?auto_299771 ) ) ( not ( = ?auto_299765 ?auto_299772 ) ) ( not ( = ?auto_299765 ?auto_299773 ) ) ( not ( = ?auto_299765 ?auto_299774 ) ) ( not ( = ?auto_299765 ?auto_299775 ) ) ( not ( = ?auto_299766 ?auto_299767 ) ) ( not ( = ?auto_299766 ?auto_299768 ) ) ( not ( = ?auto_299766 ?auto_299769 ) ) ( not ( = ?auto_299766 ?auto_299770 ) ) ( not ( = ?auto_299766 ?auto_299771 ) ) ( not ( = ?auto_299766 ?auto_299772 ) ) ( not ( = ?auto_299766 ?auto_299773 ) ) ( not ( = ?auto_299766 ?auto_299774 ) ) ( not ( = ?auto_299766 ?auto_299775 ) ) ( not ( = ?auto_299767 ?auto_299768 ) ) ( not ( = ?auto_299767 ?auto_299769 ) ) ( not ( = ?auto_299767 ?auto_299770 ) ) ( not ( = ?auto_299767 ?auto_299771 ) ) ( not ( = ?auto_299767 ?auto_299772 ) ) ( not ( = ?auto_299767 ?auto_299773 ) ) ( not ( = ?auto_299767 ?auto_299774 ) ) ( not ( = ?auto_299767 ?auto_299775 ) ) ( not ( = ?auto_299768 ?auto_299769 ) ) ( not ( = ?auto_299768 ?auto_299770 ) ) ( not ( = ?auto_299768 ?auto_299771 ) ) ( not ( = ?auto_299768 ?auto_299772 ) ) ( not ( = ?auto_299768 ?auto_299773 ) ) ( not ( = ?auto_299768 ?auto_299774 ) ) ( not ( = ?auto_299768 ?auto_299775 ) ) ( not ( = ?auto_299769 ?auto_299770 ) ) ( not ( = ?auto_299769 ?auto_299771 ) ) ( not ( = ?auto_299769 ?auto_299772 ) ) ( not ( = ?auto_299769 ?auto_299773 ) ) ( not ( = ?auto_299769 ?auto_299774 ) ) ( not ( = ?auto_299769 ?auto_299775 ) ) ( not ( = ?auto_299770 ?auto_299771 ) ) ( not ( = ?auto_299770 ?auto_299772 ) ) ( not ( = ?auto_299770 ?auto_299773 ) ) ( not ( = ?auto_299770 ?auto_299774 ) ) ( not ( = ?auto_299770 ?auto_299775 ) ) ( not ( = ?auto_299771 ?auto_299772 ) ) ( not ( = ?auto_299771 ?auto_299773 ) ) ( not ( = ?auto_299771 ?auto_299774 ) ) ( not ( = ?auto_299771 ?auto_299775 ) ) ( not ( = ?auto_299772 ?auto_299773 ) ) ( not ( = ?auto_299772 ?auto_299774 ) ) ( not ( = ?auto_299772 ?auto_299775 ) ) ( not ( = ?auto_299773 ?auto_299774 ) ) ( not ( = ?auto_299773 ?auto_299775 ) ) ( not ( = ?auto_299774 ?auto_299775 ) ) ( ON ?auto_299773 ?auto_299774 ) ( ON ?auto_299772 ?auto_299773 ) ( ON ?auto_299771 ?auto_299772 ) ( ON ?auto_299770 ?auto_299771 ) ( ON ?auto_299769 ?auto_299770 ) ( ON ?auto_299768 ?auto_299769 ) ( ON ?auto_299767 ?auto_299768 ) ( ON ?auto_299766 ?auto_299767 ) ( ON ?auto_299765 ?auto_299766 ) ( ON ?auto_299764 ?auto_299765 ) ( ON ?auto_299763 ?auto_299764 ) ( ON ?auto_299762 ?auto_299763 ) ( CLEAR ?auto_299762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_299762 )
      ( MAKE-13PILE ?auto_299762 ?auto_299763 ?auto_299764 ?auto_299765 ?auto_299766 ?auto_299767 ?auto_299768 ?auto_299769 ?auto_299770 ?auto_299771 ?auto_299772 ?auto_299773 ?auto_299774 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_299789 - BLOCK
      ?auto_299790 - BLOCK
      ?auto_299791 - BLOCK
      ?auto_299792 - BLOCK
      ?auto_299793 - BLOCK
      ?auto_299794 - BLOCK
      ?auto_299795 - BLOCK
      ?auto_299796 - BLOCK
      ?auto_299797 - BLOCK
      ?auto_299798 - BLOCK
      ?auto_299799 - BLOCK
      ?auto_299800 - BLOCK
      ?auto_299801 - BLOCK
    )
    :vars
    (
      ?auto_299802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299801 ?auto_299802 ) ( not ( = ?auto_299789 ?auto_299790 ) ) ( not ( = ?auto_299789 ?auto_299791 ) ) ( not ( = ?auto_299789 ?auto_299792 ) ) ( not ( = ?auto_299789 ?auto_299793 ) ) ( not ( = ?auto_299789 ?auto_299794 ) ) ( not ( = ?auto_299789 ?auto_299795 ) ) ( not ( = ?auto_299789 ?auto_299796 ) ) ( not ( = ?auto_299789 ?auto_299797 ) ) ( not ( = ?auto_299789 ?auto_299798 ) ) ( not ( = ?auto_299789 ?auto_299799 ) ) ( not ( = ?auto_299789 ?auto_299800 ) ) ( not ( = ?auto_299789 ?auto_299801 ) ) ( not ( = ?auto_299789 ?auto_299802 ) ) ( not ( = ?auto_299790 ?auto_299791 ) ) ( not ( = ?auto_299790 ?auto_299792 ) ) ( not ( = ?auto_299790 ?auto_299793 ) ) ( not ( = ?auto_299790 ?auto_299794 ) ) ( not ( = ?auto_299790 ?auto_299795 ) ) ( not ( = ?auto_299790 ?auto_299796 ) ) ( not ( = ?auto_299790 ?auto_299797 ) ) ( not ( = ?auto_299790 ?auto_299798 ) ) ( not ( = ?auto_299790 ?auto_299799 ) ) ( not ( = ?auto_299790 ?auto_299800 ) ) ( not ( = ?auto_299790 ?auto_299801 ) ) ( not ( = ?auto_299790 ?auto_299802 ) ) ( not ( = ?auto_299791 ?auto_299792 ) ) ( not ( = ?auto_299791 ?auto_299793 ) ) ( not ( = ?auto_299791 ?auto_299794 ) ) ( not ( = ?auto_299791 ?auto_299795 ) ) ( not ( = ?auto_299791 ?auto_299796 ) ) ( not ( = ?auto_299791 ?auto_299797 ) ) ( not ( = ?auto_299791 ?auto_299798 ) ) ( not ( = ?auto_299791 ?auto_299799 ) ) ( not ( = ?auto_299791 ?auto_299800 ) ) ( not ( = ?auto_299791 ?auto_299801 ) ) ( not ( = ?auto_299791 ?auto_299802 ) ) ( not ( = ?auto_299792 ?auto_299793 ) ) ( not ( = ?auto_299792 ?auto_299794 ) ) ( not ( = ?auto_299792 ?auto_299795 ) ) ( not ( = ?auto_299792 ?auto_299796 ) ) ( not ( = ?auto_299792 ?auto_299797 ) ) ( not ( = ?auto_299792 ?auto_299798 ) ) ( not ( = ?auto_299792 ?auto_299799 ) ) ( not ( = ?auto_299792 ?auto_299800 ) ) ( not ( = ?auto_299792 ?auto_299801 ) ) ( not ( = ?auto_299792 ?auto_299802 ) ) ( not ( = ?auto_299793 ?auto_299794 ) ) ( not ( = ?auto_299793 ?auto_299795 ) ) ( not ( = ?auto_299793 ?auto_299796 ) ) ( not ( = ?auto_299793 ?auto_299797 ) ) ( not ( = ?auto_299793 ?auto_299798 ) ) ( not ( = ?auto_299793 ?auto_299799 ) ) ( not ( = ?auto_299793 ?auto_299800 ) ) ( not ( = ?auto_299793 ?auto_299801 ) ) ( not ( = ?auto_299793 ?auto_299802 ) ) ( not ( = ?auto_299794 ?auto_299795 ) ) ( not ( = ?auto_299794 ?auto_299796 ) ) ( not ( = ?auto_299794 ?auto_299797 ) ) ( not ( = ?auto_299794 ?auto_299798 ) ) ( not ( = ?auto_299794 ?auto_299799 ) ) ( not ( = ?auto_299794 ?auto_299800 ) ) ( not ( = ?auto_299794 ?auto_299801 ) ) ( not ( = ?auto_299794 ?auto_299802 ) ) ( not ( = ?auto_299795 ?auto_299796 ) ) ( not ( = ?auto_299795 ?auto_299797 ) ) ( not ( = ?auto_299795 ?auto_299798 ) ) ( not ( = ?auto_299795 ?auto_299799 ) ) ( not ( = ?auto_299795 ?auto_299800 ) ) ( not ( = ?auto_299795 ?auto_299801 ) ) ( not ( = ?auto_299795 ?auto_299802 ) ) ( not ( = ?auto_299796 ?auto_299797 ) ) ( not ( = ?auto_299796 ?auto_299798 ) ) ( not ( = ?auto_299796 ?auto_299799 ) ) ( not ( = ?auto_299796 ?auto_299800 ) ) ( not ( = ?auto_299796 ?auto_299801 ) ) ( not ( = ?auto_299796 ?auto_299802 ) ) ( not ( = ?auto_299797 ?auto_299798 ) ) ( not ( = ?auto_299797 ?auto_299799 ) ) ( not ( = ?auto_299797 ?auto_299800 ) ) ( not ( = ?auto_299797 ?auto_299801 ) ) ( not ( = ?auto_299797 ?auto_299802 ) ) ( not ( = ?auto_299798 ?auto_299799 ) ) ( not ( = ?auto_299798 ?auto_299800 ) ) ( not ( = ?auto_299798 ?auto_299801 ) ) ( not ( = ?auto_299798 ?auto_299802 ) ) ( not ( = ?auto_299799 ?auto_299800 ) ) ( not ( = ?auto_299799 ?auto_299801 ) ) ( not ( = ?auto_299799 ?auto_299802 ) ) ( not ( = ?auto_299800 ?auto_299801 ) ) ( not ( = ?auto_299800 ?auto_299802 ) ) ( not ( = ?auto_299801 ?auto_299802 ) ) ( ON ?auto_299800 ?auto_299801 ) ( ON ?auto_299799 ?auto_299800 ) ( ON ?auto_299798 ?auto_299799 ) ( ON ?auto_299797 ?auto_299798 ) ( ON ?auto_299796 ?auto_299797 ) ( ON ?auto_299795 ?auto_299796 ) ( ON ?auto_299794 ?auto_299795 ) ( ON ?auto_299793 ?auto_299794 ) ( ON ?auto_299792 ?auto_299793 ) ( ON ?auto_299791 ?auto_299792 ) ( ON ?auto_299790 ?auto_299791 ) ( ON ?auto_299789 ?auto_299790 ) ( CLEAR ?auto_299789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_299789 )
      ( MAKE-13PILE ?auto_299789 ?auto_299790 ?auto_299791 ?auto_299792 ?auto_299793 ?auto_299794 ?auto_299795 ?auto_299796 ?auto_299797 ?auto_299798 ?auto_299799 ?auto_299800 ?auto_299801 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_299817 - BLOCK
      ?auto_299818 - BLOCK
      ?auto_299819 - BLOCK
      ?auto_299820 - BLOCK
      ?auto_299821 - BLOCK
      ?auto_299822 - BLOCK
      ?auto_299823 - BLOCK
      ?auto_299824 - BLOCK
      ?auto_299825 - BLOCK
      ?auto_299826 - BLOCK
      ?auto_299827 - BLOCK
      ?auto_299828 - BLOCK
      ?auto_299829 - BLOCK
      ?auto_299830 - BLOCK
    )
    :vars
    (
      ?auto_299831 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_299829 ) ( ON ?auto_299830 ?auto_299831 ) ( CLEAR ?auto_299830 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_299817 ) ( ON ?auto_299818 ?auto_299817 ) ( ON ?auto_299819 ?auto_299818 ) ( ON ?auto_299820 ?auto_299819 ) ( ON ?auto_299821 ?auto_299820 ) ( ON ?auto_299822 ?auto_299821 ) ( ON ?auto_299823 ?auto_299822 ) ( ON ?auto_299824 ?auto_299823 ) ( ON ?auto_299825 ?auto_299824 ) ( ON ?auto_299826 ?auto_299825 ) ( ON ?auto_299827 ?auto_299826 ) ( ON ?auto_299828 ?auto_299827 ) ( ON ?auto_299829 ?auto_299828 ) ( not ( = ?auto_299817 ?auto_299818 ) ) ( not ( = ?auto_299817 ?auto_299819 ) ) ( not ( = ?auto_299817 ?auto_299820 ) ) ( not ( = ?auto_299817 ?auto_299821 ) ) ( not ( = ?auto_299817 ?auto_299822 ) ) ( not ( = ?auto_299817 ?auto_299823 ) ) ( not ( = ?auto_299817 ?auto_299824 ) ) ( not ( = ?auto_299817 ?auto_299825 ) ) ( not ( = ?auto_299817 ?auto_299826 ) ) ( not ( = ?auto_299817 ?auto_299827 ) ) ( not ( = ?auto_299817 ?auto_299828 ) ) ( not ( = ?auto_299817 ?auto_299829 ) ) ( not ( = ?auto_299817 ?auto_299830 ) ) ( not ( = ?auto_299817 ?auto_299831 ) ) ( not ( = ?auto_299818 ?auto_299819 ) ) ( not ( = ?auto_299818 ?auto_299820 ) ) ( not ( = ?auto_299818 ?auto_299821 ) ) ( not ( = ?auto_299818 ?auto_299822 ) ) ( not ( = ?auto_299818 ?auto_299823 ) ) ( not ( = ?auto_299818 ?auto_299824 ) ) ( not ( = ?auto_299818 ?auto_299825 ) ) ( not ( = ?auto_299818 ?auto_299826 ) ) ( not ( = ?auto_299818 ?auto_299827 ) ) ( not ( = ?auto_299818 ?auto_299828 ) ) ( not ( = ?auto_299818 ?auto_299829 ) ) ( not ( = ?auto_299818 ?auto_299830 ) ) ( not ( = ?auto_299818 ?auto_299831 ) ) ( not ( = ?auto_299819 ?auto_299820 ) ) ( not ( = ?auto_299819 ?auto_299821 ) ) ( not ( = ?auto_299819 ?auto_299822 ) ) ( not ( = ?auto_299819 ?auto_299823 ) ) ( not ( = ?auto_299819 ?auto_299824 ) ) ( not ( = ?auto_299819 ?auto_299825 ) ) ( not ( = ?auto_299819 ?auto_299826 ) ) ( not ( = ?auto_299819 ?auto_299827 ) ) ( not ( = ?auto_299819 ?auto_299828 ) ) ( not ( = ?auto_299819 ?auto_299829 ) ) ( not ( = ?auto_299819 ?auto_299830 ) ) ( not ( = ?auto_299819 ?auto_299831 ) ) ( not ( = ?auto_299820 ?auto_299821 ) ) ( not ( = ?auto_299820 ?auto_299822 ) ) ( not ( = ?auto_299820 ?auto_299823 ) ) ( not ( = ?auto_299820 ?auto_299824 ) ) ( not ( = ?auto_299820 ?auto_299825 ) ) ( not ( = ?auto_299820 ?auto_299826 ) ) ( not ( = ?auto_299820 ?auto_299827 ) ) ( not ( = ?auto_299820 ?auto_299828 ) ) ( not ( = ?auto_299820 ?auto_299829 ) ) ( not ( = ?auto_299820 ?auto_299830 ) ) ( not ( = ?auto_299820 ?auto_299831 ) ) ( not ( = ?auto_299821 ?auto_299822 ) ) ( not ( = ?auto_299821 ?auto_299823 ) ) ( not ( = ?auto_299821 ?auto_299824 ) ) ( not ( = ?auto_299821 ?auto_299825 ) ) ( not ( = ?auto_299821 ?auto_299826 ) ) ( not ( = ?auto_299821 ?auto_299827 ) ) ( not ( = ?auto_299821 ?auto_299828 ) ) ( not ( = ?auto_299821 ?auto_299829 ) ) ( not ( = ?auto_299821 ?auto_299830 ) ) ( not ( = ?auto_299821 ?auto_299831 ) ) ( not ( = ?auto_299822 ?auto_299823 ) ) ( not ( = ?auto_299822 ?auto_299824 ) ) ( not ( = ?auto_299822 ?auto_299825 ) ) ( not ( = ?auto_299822 ?auto_299826 ) ) ( not ( = ?auto_299822 ?auto_299827 ) ) ( not ( = ?auto_299822 ?auto_299828 ) ) ( not ( = ?auto_299822 ?auto_299829 ) ) ( not ( = ?auto_299822 ?auto_299830 ) ) ( not ( = ?auto_299822 ?auto_299831 ) ) ( not ( = ?auto_299823 ?auto_299824 ) ) ( not ( = ?auto_299823 ?auto_299825 ) ) ( not ( = ?auto_299823 ?auto_299826 ) ) ( not ( = ?auto_299823 ?auto_299827 ) ) ( not ( = ?auto_299823 ?auto_299828 ) ) ( not ( = ?auto_299823 ?auto_299829 ) ) ( not ( = ?auto_299823 ?auto_299830 ) ) ( not ( = ?auto_299823 ?auto_299831 ) ) ( not ( = ?auto_299824 ?auto_299825 ) ) ( not ( = ?auto_299824 ?auto_299826 ) ) ( not ( = ?auto_299824 ?auto_299827 ) ) ( not ( = ?auto_299824 ?auto_299828 ) ) ( not ( = ?auto_299824 ?auto_299829 ) ) ( not ( = ?auto_299824 ?auto_299830 ) ) ( not ( = ?auto_299824 ?auto_299831 ) ) ( not ( = ?auto_299825 ?auto_299826 ) ) ( not ( = ?auto_299825 ?auto_299827 ) ) ( not ( = ?auto_299825 ?auto_299828 ) ) ( not ( = ?auto_299825 ?auto_299829 ) ) ( not ( = ?auto_299825 ?auto_299830 ) ) ( not ( = ?auto_299825 ?auto_299831 ) ) ( not ( = ?auto_299826 ?auto_299827 ) ) ( not ( = ?auto_299826 ?auto_299828 ) ) ( not ( = ?auto_299826 ?auto_299829 ) ) ( not ( = ?auto_299826 ?auto_299830 ) ) ( not ( = ?auto_299826 ?auto_299831 ) ) ( not ( = ?auto_299827 ?auto_299828 ) ) ( not ( = ?auto_299827 ?auto_299829 ) ) ( not ( = ?auto_299827 ?auto_299830 ) ) ( not ( = ?auto_299827 ?auto_299831 ) ) ( not ( = ?auto_299828 ?auto_299829 ) ) ( not ( = ?auto_299828 ?auto_299830 ) ) ( not ( = ?auto_299828 ?auto_299831 ) ) ( not ( = ?auto_299829 ?auto_299830 ) ) ( not ( = ?auto_299829 ?auto_299831 ) ) ( not ( = ?auto_299830 ?auto_299831 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_299830 ?auto_299831 )
      ( !STACK ?auto_299830 ?auto_299829 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_299846 - BLOCK
      ?auto_299847 - BLOCK
      ?auto_299848 - BLOCK
      ?auto_299849 - BLOCK
      ?auto_299850 - BLOCK
      ?auto_299851 - BLOCK
      ?auto_299852 - BLOCK
      ?auto_299853 - BLOCK
      ?auto_299854 - BLOCK
      ?auto_299855 - BLOCK
      ?auto_299856 - BLOCK
      ?auto_299857 - BLOCK
      ?auto_299858 - BLOCK
      ?auto_299859 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_299858 ) ( ON-TABLE ?auto_299859 ) ( CLEAR ?auto_299859 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_299846 ) ( ON ?auto_299847 ?auto_299846 ) ( ON ?auto_299848 ?auto_299847 ) ( ON ?auto_299849 ?auto_299848 ) ( ON ?auto_299850 ?auto_299849 ) ( ON ?auto_299851 ?auto_299850 ) ( ON ?auto_299852 ?auto_299851 ) ( ON ?auto_299853 ?auto_299852 ) ( ON ?auto_299854 ?auto_299853 ) ( ON ?auto_299855 ?auto_299854 ) ( ON ?auto_299856 ?auto_299855 ) ( ON ?auto_299857 ?auto_299856 ) ( ON ?auto_299858 ?auto_299857 ) ( not ( = ?auto_299846 ?auto_299847 ) ) ( not ( = ?auto_299846 ?auto_299848 ) ) ( not ( = ?auto_299846 ?auto_299849 ) ) ( not ( = ?auto_299846 ?auto_299850 ) ) ( not ( = ?auto_299846 ?auto_299851 ) ) ( not ( = ?auto_299846 ?auto_299852 ) ) ( not ( = ?auto_299846 ?auto_299853 ) ) ( not ( = ?auto_299846 ?auto_299854 ) ) ( not ( = ?auto_299846 ?auto_299855 ) ) ( not ( = ?auto_299846 ?auto_299856 ) ) ( not ( = ?auto_299846 ?auto_299857 ) ) ( not ( = ?auto_299846 ?auto_299858 ) ) ( not ( = ?auto_299846 ?auto_299859 ) ) ( not ( = ?auto_299847 ?auto_299848 ) ) ( not ( = ?auto_299847 ?auto_299849 ) ) ( not ( = ?auto_299847 ?auto_299850 ) ) ( not ( = ?auto_299847 ?auto_299851 ) ) ( not ( = ?auto_299847 ?auto_299852 ) ) ( not ( = ?auto_299847 ?auto_299853 ) ) ( not ( = ?auto_299847 ?auto_299854 ) ) ( not ( = ?auto_299847 ?auto_299855 ) ) ( not ( = ?auto_299847 ?auto_299856 ) ) ( not ( = ?auto_299847 ?auto_299857 ) ) ( not ( = ?auto_299847 ?auto_299858 ) ) ( not ( = ?auto_299847 ?auto_299859 ) ) ( not ( = ?auto_299848 ?auto_299849 ) ) ( not ( = ?auto_299848 ?auto_299850 ) ) ( not ( = ?auto_299848 ?auto_299851 ) ) ( not ( = ?auto_299848 ?auto_299852 ) ) ( not ( = ?auto_299848 ?auto_299853 ) ) ( not ( = ?auto_299848 ?auto_299854 ) ) ( not ( = ?auto_299848 ?auto_299855 ) ) ( not ( = ?auto_299848 ?auto_299856 ) ) ( not ( = ?auto_299848 ?auto_299857 ) ) ( not ( = ?auto_299848 ?auto_299858 ) ) ( not ( = ?auto_299848 ?auto_299859 ) ) ( not ( = ?auto_299849 ?auto_299850 ) ) ( not ( = ?auto_299849 ?auto_299851 ) ) ( not ( = ?auto_299849 ?auto_299852 ) ) ( not ( = ?auto_299849 ?auto_299853 ) ) ( not ( = ?auto_299849 ?auto_299854 ) ) ( not ( = ?auto_299849 ?auto_299855 ) ) ( not ( = ?auto_299849 ?auto_299856 ) ) ( not ( = ?auto_299849 ?auto_299857 ) ) ( not ( = ?auto_299849 ?auto_299858 ) ) ( not ( = ?auto_299849 ?auto_299859 ) ) ( not ( = ?auto_299850 ?auto_299851 ) ) ( not ( = ?auto_299850 ?auto_299852 ) ) ( not ( = ?auto_299850 ?auto_299853 ) ) ( not ( = ?auto_299850 ?auto_299854 ) ) ( not ( = ?auto_299850 ?auto_299855 ) ) ( not ( = ?auto_299850 ?auto_299856 ) ) ( not ( = ?auto_299850 ?auto_299857 ) ) ( not ( = ?auto_299850 ?auto_299858 ) ) ( not ( = ?auto_299850 ?auto_299859 ) ) ( not ( = ?auto_299851 ?auto_299852 ) ) ( not ( = ?auto_299851 ?auto_299853 ) ) ( not ( = ?auto_299851 ?auto_299854 ) ) ( not ( = ?auto_299851 ?auto_299855 ) ) ( not ( = ?auto_299851 ?auto_299856 ) ) ( not ( = ?auto_299851 ?auto_299857 ) ) ( not ( = ?auto_299851 ?auto_299858 ) ) ( not ( = ?auto_299851 ?auto_299859 ) ) ( not ( = ?auto_299852 ?auto_299853 ) ) ( not ( = ?auto_299852 ?auto_299854 ) ) ( not ( = ?auto_299852 ?auto_299855 ) ) ( not ( = ?auto_299852 ?auto_299856 ) ) ( not ( = ?auto_299852 ?auto_299857 ) ) ( not ( = ?auto_299852 ?auto_299858 ) ) ( not ( = ?auto_299852 ?auto_299859 ) ) ( not ( = ?auto_299853 ?auto_299854 ) ) ( not ( = ?auto_299853 ?auto_299855 ) ) ( not ( = ?auto_299853 ?auto_299856 ) ) ( not ( = ?auto_299853 ?auto_299857 ) ) ( not ( = ?auto_299853 ?auto_299858 ) ) ( not ( = ?auto_299853 ?auto_299859 ) ) ( not ( = ?auto_299854 ?auto_299855 ) ) ( not ( = ?auto_299854 ?auto_299856 ) ) ( not ( = ?auto_299854 ?auto_299857 ) ) ( not ( = ?auto_299854 ?auto_299858 ) ) ( not ( = ?auto_299854 ?auto_299859 ) ) ( not ( = ?auto_299855 ?auto_299856 ) ) ( not ( = ?auto_299855 ?auto_299857 ) ) ( not ( = ?auto_299855 ?auto_299858 ) ) ( not ( = ?auto_299855 ?auto_299859 ) ) ( not ( = ?auto_299856 ?auto_299857 ) ) ( not ( = ?auto_299856 ?auto_299858 ) ) ( not ( = ?auto_299856 ?auto_299859 ) ) ( not ( = ?auto_299857 ?auto_299858 ) ) ( not ( = ?auto_299857 ?auto_299859 ) ) ( not ( = ?auto_299858 ?auto_299859 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_299859 )
      ( !STACK ?auto_299859 ?auto_299858 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_299874 - BLOCK
      ?auto_299875 - BLOCK
      ?auto_299876 - BLOCK
      ?auto_299877 - BLOCK
      ?auto_299878 - BLOCK
      ?auto_299879 - BLOCK
      ?auto_299880 - BLOCK
      ?auto_299881 - BLOCK
      ?auto_299882 - BLOCK
      ?auto_299883 - BLOCK
      ?auto_299884 - BLOCK
      ?auto_299885 - BLOCK
      ?auto_299886 - BLOCK
      ?auto_299887 - BLOCK
    )
    :vars
    (
      ?auto_299888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299887 ?auto_299888 ) ( ON-TABLE ?auto_299874 ) ( ON ?auto_299875 ?auto_299874 ) ( ON ?auto_299876 ?auto_299875 ) ( ON ?auto_299877 ?auto_299876 ) ( ON ?auto_299878 ?auto_299877 ) ( ON ?auto_299879 ?auto_299878 ) ( ON ?auto_299880 ?auto_299879 ) ( ON ?auto_299881 ?auto_299880 ) ( ON ?auto_299882 ?auto_299881 ) ( ON ?auto_299883 ?auto_299882 ) ( ON ?auto_299884 ?auto_299883 ) ( ON ?auto_299885 ?auto_299884 ) ( not ( = ?auto_299874 ?auto_299875 ) ) ( not ( = ?auto_299874 ?auto_299876 ) ) ( not ( = ?auto_299874 ?auto_299877 ) ) ( not ( = ?auto_299874 ?auto_299878 ) ) ( not ( = ?auto_299874 ?auto_299879 ) ) ( not ( = ?auto_299874 ?auto_299880 ) ) ( not ( = ?auto_299874 ?auto_299881 ) ) ( not ( = ?auto_299874 ?auto_299882 ) ) ( not ( = ?auto_299874 ?auto_299883 ) ) ( not ( = ?auto_299874 ?auto_299884 ) ) ( not ( = ?auto_299874 ?auto_299885 ) ) ( not ( = ?auto_299874 ?auto_299886 ) ) ( not ( = ?auto_299874 ?auto_299887 ) ) ( not ( = ?auto_299874 ?auto_299888 ) ) ( not ( = ?auto_299875 ?auto_299876 ) ) ( not ( = ?auto_299875 ?auto_299877 ) ) ( not ( = ?auto_299875 ?auto_299878 ) ) ( not ( = ?auto_299875 ?auto_299879 ) ) ( not ( = ?auto_299875 ?auto_299880 ) ) ( not ( = ?auto_299875 ?auto_299881 ) ) ( not ( = ?auto_299875 ?auto_299882 ) ) ( not ( = ?auto_299875 ?auto_299883 ) ) ( not ( = ?auto_299875 ?auto_299884 ) ) ( not ( = ?auto_299875 ?auto_299885 ) ) ( not ( = ?auto_299875 ?auto_299886 ) ) ( not ( = ?auto_299875 ?auto_299887 ) ) ( not ( = ?auto_299875 ?auto_299888 ) ) ( not ( = ?auto_299876 ?auto_299877 ) ) ( not ( = ?auto_299876 ?auto_299878 ) ) ( not ( = ?auto_299876 ?auto_299879 ) ) ( not ( = ?auto_299876 ?auto_299880 ) ) ( not ( = ?auto_299876 ?auto_299881 ) ) ( not ( = ?auto_299876 ?auto_299882 ) ) ( not ( = ?auto_299876 ?auto_299883 ) ) ( not ( = ?auto_299876 ?auto_299884 ) ) ( not ( = ?auto_299876 ?auto_299885 ) ) ( not ( = ?auto_299876 ?auto_299886 ) ) ( not ( = ?auto_299876 ?auto_299887 ) ) ( not ( = ?auto_299876 ?auto_299888 ) ) ( not ( = ?auto_299877 ?auto_299878 ) ) ( not ( = ?auto_299877 ?auto_299879 ) ) ( not ( = ?auto_299877 ?auto_299880 ) ) ( not ( = ?auto_299877 ?auto_299881 ) ) ( not ( = ?auto_299877 ?auto_299882 ) ) ( not ( = ?auto_299877 ?auto_299883 ) ) ( not ( = ?auto_299877 ?auto_299884 ) ) ( not ( = ?auto_299877 ?auto_299885 ) ) ( not ( = ?auto_299877 ?auto_299886 ) ) ( not ( = ?auto_299877 ?auto_299887 ) ) ( not ( = ?auto_299877 ?auto_299888 ) ) ( not ( = ?auto_299878 ?auto_299879 ) ) ( not ( = ?auto_299878 ?auto_299880 ) ) ( not ( = ?auto_299878 ?auto_299881 ) ) ( not ( = ?auto_299878 ?auto_299882 ) ) ( not ( = ?auto_299878 ?auto_299883 ) ) ( not ( = ?auto_299878 ?auto_299884 ) ) ( not ( = ?auto_299878 ?auto_299885 ) ) ( not ( = ?auto_299878 ?auto_299886 ) ) ( not ( = ?auto_299878 ?auto_299887 ) ) ( not ( = ?auto_299878 ?auto_299888 ) ) ( not ( = ?auto_299879 ?auto_299880 ) ) ( not ( = ?auto_299879 ?auto_299881 ) ) ( not ( = ?auto_299879 ?auto_299882 ) ) ( not ( = ?auto_299879 ?auto_299883 ) ) ( not ( = ?auto_299879 ?auto_299884 ) ) ( not ( = ?auto_299879 ?auto_299885 ) ) ( not ( = ?auto_299879 ?auto_299886 ) ) ( not ( = ?auto_299879 ?auto_299887 ) ) ( not ( = ?auto_299879 ?auto_299888 ) ) ( not ( = ?auto_299880 ?auto_299881 ) ) ( not ( = ?auto_299880 ?auto_299882 ) ) ( not ( = ?auto_299880 ?auto_299883 ) ) ( not ( = ?auto_299880 ?auto_299884 ) ) ( not ( = ?auto_299880 ?auto_299885 ) ) ( not ( = ?auto_299880 ?auto_299886 ) ) ( not ( = ?auto_299880 ?auto_299887 ) ) ( not ( = ?auto_299880 ?auto_299888 ) ) ( not ( = ?auto_299881 ?auto_299882 ) ) ( not ( = ?auto_299881 ?auto_299883 ) ) ( not ( = ?auto_299881 ?auto_299884 ) ) ( not ( = ?auto_299881 ?auto_299885 ) ) ( not ( = ?auto_299881 ?auto_299886 ) ) ( not ( = ?auto_299881 ?auto_299887 ) ) ( not ( = ?auto_299881 ?auto_299888 ) ) ( not ( = ?auto_299882 ?auto_299883 ) ) ( not ( = ?auto_299882 ?auto_299884 ) ) ( not ( = ?auto_299882 ?auto_299885 ) ) ( not ( = ?auto_299882 ?auto_299886 ) ) ( not ( = ?auto_299882 ?auto_299887 ) ) ( not ( = ?auto_299882 ?auto_299888 ) ) ( not ( = ?auto_299883 ?auto_299884 ) ) ( not ( = ?auto_299883 ?auto_299885 ) ) ( not ( = ?auto_299883 ?auto_299886 ) ) ( not ( = ?auto_299883 ?auto_299887 ) ) ( not ( = ?auto_299883 ?auto_299888 ) ) ( not ( = ?auto_299884 ?auto_299885 ) ) ( not ( = ?auto_299884 ?auto_299886 ) ) ( not ( = ?auto_299884 ?auto_299887 ) ) ( not ( = ?auto_299884 ?auto_299888 ) ) ( not ( = ?auto_299885 ?auto_299886 ) ) ( not ( = ?auto_299885 ?auto_299887 ) ) ( not ( = ?auto_299885 ?auto_299888 ) ) ( not ( = ?auto_299886 ?auto_299887 ) ) ( not ( = ?auto_299886 ?auto_299888 ) ) ( not ( = ?auto_299887 ?auto_299888 ) ) ( CLEAR ?auto_299885 ) ( ON ?auto_299886 ?auto_299887 ) ( CLEAR ?auto_299886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_299874 ?auto_299875 ?auto_299876 ?auto_299877 ?auto_299878 ?auto_299879 ?auto_299880 ?auto_299881 ?auto_299882 ?auto_299883 ?auto_299884 ?auto_299885 ?auto_299886 )
      ( MAKE-14PILE ?auto_299874 ?auto_299875 ?auto_299876 ?auto_299877 ?auto_299878 ?auto_299879 ?auto_299880 ?auto_299881 ?auto_299882 ?auto_299883 ?auto_299884 ?auto_299885 ?auto_299886 ?auto_299887 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_299903 - BLOCK
      ?auto_299904 - BLOCK
      ?auto_299905 - BLOCK
      ?auto_299906 - BLOCK
      ?auto_299907 - BLOCK
      ?auto_299908 - BLOCK
      ?auto_299909 - BLOCK
      ?auto_299910 - BLOCK
      ?auto_299911 - BLOCK
      ?auto_299912 - BLOCK
      ?auto_299913 - BLOCK
      ?auto_299914 - BLOCK
      ?auto_299915 - BLOCK
      ?auto_299916 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_299916 ) ( ON-TABLE ?auto_299903 ) ( ON ?auto_299904 ?auto_299903 ) ( ON ?auto_299905 ?auto_299904 ) ( ON ?auto_299906 ?auto_299905 ) ( ON ?auto_299907 ?auto_299906 ) ( ON ?auto_299908 ?auto_299907 ) ( ON ?auto_299909 ?auto_299908 ) ( ON ?auto_299910 ?auto_299909 ) ( ON ?auto_299911 ?auto_299910 ) ( ON ?auto_299912 ?auto_299911 ) ( ON ?auto_299913 ?auto_299912 ) ( ON ?auto_299914 ?auto_299913 ) ( not ( = ?auto_299903 ?auto_299904 ) ) ( not ( = ?auto_299903 ?auto_299905 ) ) ( not ( = ?auto_299903 ?auto_299906 ) ) ( not ( = ?auto_299903 ?auto_299907 ) ) ( not ( = ?auto_299903 ?auto_299908 ) ) ( not ( = ?auto_299903 ?auto_299909 ) ) ( not ( = ?auto_299903 ?auto_299910 ) ) ( not ( = ?auto_299903 ?auto_299911 ) ) ( not ( = ?auto_299903 ?auto_299912 ) ) ( not ( = ?auto_299903 ?auto_299913 ) ) ( not ( = ?auto_299903 ?auto_299914 ) ) ( not ( = ?auto_299903 ?auto_299915 ) ) ( not ( = ?auto_299903 ?auto_299916 ) ) ( not ( = ?auto_299904 ?auto_299905 ) ) ( not ( = ?auto_299904 ?auto_299906 ) ) ( not ( = ?auto_299904 ?auto_299907 ) ) ( not ( = ?auto_299904 ?auto_299908 ) ) ( not ( = ?auto_299904 ?auto_299909 ) ) ( not ( = ?auto_299904 ?auto_299910 ) ) ( not ( = ?auto_299904 ?auto_299911 ) ) ( not ( = ?auto_299904 ?auto_299912 ) ) ( not ( = ?auto_299904 ?auto_299913 ) ) ( not ( = ?auto_299904 ?auto_299914 ) ) ( not ( = ?auto_299904 ?auto_299915 ) ) ( not ( = ?auto_299904 ?auto_299916 ) ) ( not ( = ?auto_299905 ?auto_299906 ) ) ( not ( = ?auto_299905 ?auto_299907 ) ) ( not ( = ?auto_299905 ?auto_299908 ) ) ( not ( = ?auto_299905 ?auto_299909 ) ) ( not ( = ?auto_299905 ?auto_299910 ) ) ( not ( = ?auto_299905 ?auto_299911 ) ) ( not ( = ?auto_299905 ?auto_299912 ) ) ( not ( = ?auto_299905 ?auto_299913 ) ) ( not ( = ?auto_299905 ?auto_299914 ) ) ( not ( = ?auto_299905 ?auto_299915 ) ) ( not ( = ?auto_299905 ?auto_299916 ) ) ( not ( = ?auto_299906 ?auto_299907 ) ) ( not ( = ?auto_299906 ?auto_299908 ) ) ( not ( = ?auto_299906 ?auto_299909 ) ) ( not ( = ?auto_299906 ?auto_299910 ) ) ( not ( = ?auto_299906 ?auto_299911 ) ) ( not ( = ?auto_299906 ?auto_299912 ) ) ( not ( = ?auto_299906 ?auto_299913 ) ) ( not ( = ?auto_299906 ?auto_299914 ) ) ( not ( = ?auto_299906 ?auto_299915 ) ) ( not ( = ?auto_299906 ?auto_299916 ) ) ( not ( = ?auto_299907 ?auto_299908 ) ) ( not ( = ?auto_299907 ?auto_299909 ) ) ( not ( = ?auto_299907 ?auto_299910 ) ) ( not ( = ?auto_299907 ?auto_299911 ) ) ( not ( = ?auto_299907 ?auto_299912 ) ) ( not ( = ?auto_299907 ?auto_299913 ) ) ( not ( = ?auto_299907 ?auto_299914 ) ) ( not ( = ?auto_299907 ?auto_299915 ) ) ( not ( = ?auto_299907 ?auto_299916 ) ) ( not ( = ?auto_299908 ?auto_299909 ) ) ( not ( = ?auto_299908 ?auto_299910 ) ) ( not ( = ?auto_299908 ?auto_299911 ) ) ( not ( = ?auto_299908 ?auto_299912 ) ) ( not ( = ?auto_299908 ?auto_299913 ) ) ( not ( = ?auto_299908 ?auto_299914 ) ) ( not ( = ?auto_299908 ?auto_299915 ) ) ( not ( = ?auto_299908 ?auto_299916 ) ) ( not ( = ?auto_299909 ?auto_299910 ) ) ( not ( = ?auto_299909 ?auto_299911 ) ) ( not ( = ?auto_299909 ?auto_299912 ) ) ( not ( = ?auto_299909 ?auto_299913 ) ) ( not ( = ?auto_299909 ?auto_299914 ) ) ( not ( = ?auto_299909 ?auto_299915 ) ) ( not ( = ?auto_299909 ?auto_299916 ) ) ( not ( = ?auto_299910 ?auto_299911 ) ) ( not ( = ?auto_299910 ?auto_299912 ) ) ( not ( = ?auto_299910 ?auto_299913 ) ) ( not ( = ?auto_299910 ?auto_299914 ) ) ( not ( = ?auto_299910 ?auto_299915 ) ) ( not ( = ?auto_299910 ?auto_299916 ) ) ( not ( = ?auto_299911 ?auto_299912 ) ) ( not ( = ?auto_299911 ?auto_299913 ) ) ( not ( = ?auto_299911 ?auto_299914 ) ) ( not ( = ?auto_299911 ?auto_299915 ) ) ( not ( = ?auto_299911 ?auto_299916 ) ) ( not ( = ?auto_299912 ?auto_299913 ) ) ( not ( = ?auto_299912 ?auto_299914 ) ) ( not ( = ?auto_299912 ?auto_299915 ) ) ( not ( = ?auto_299912 ?auto_299916 ) ) ( not ( = ?auto_299913 ?auto_299914 ) ) ( not ( = ?auto_299913 ?auto_299915 ) ) ( not ( = ?auto_299913 ?auto_299916 ) ) ( not ( = ?auto_299914 ?auto_299915 ) ) ( not ( = ?auto_299914 ?auto_299916 ) ) ( not ( = ?auto_299915 ?auto_299916 ) ) ( CLEAR ?auto_299914 ) ( ON ?auto_299915 ?auto_299916 ) ( CLEAR ?auto_299915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_299903 ?auto_299904 ?auto_299905 ?auto_299906 ?auto_299907 ?auto_299908 ?auto_299909 ?auto_299910 ?auto_299911 ?auto_299912 ?auto_299913 ?auto_299914 ?auto_299915 )
      ( MAKE-14PILE ?auto_299903 ?auto_299904 ?auto_299905 ?auto_299906 ?auto_299907 ?auto_299908 ?auto_299909 ?auto_299910 ?auto_299911 ?auto_299912 ?auto_299913 ?auto_299914 ?auto_299915 ?auto_299916 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_299931 - BLOCK
      ?auto_299932 - BLOCK
      ?auto_299933 - BLOCK
      ?auto_299934 - BLOCK
      ?auto_299935 - BLOCK
      ?auto_299936 - BLOCK
      ?auto_299937 - BLOCK
      ?auto_299938 - BLOCK
      ?auto_299939 - BLOCK
      ?auto_299940 - BLOCK
      ?auto_299941 - BLOCK
      ?auto_299942 - BLOCK
      ?auto_299943 - BLOCK
      ?auto_299944 - BLOCK
    )
    :vars
    (
      ?auto_299945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_299944 ?auto_299945 ) ( ON-TABLE ?auto_299931 ) ( ON ?auto_299932 ?auto_299931 ) ( ON ?auto_299933 ?auto_299932 ) ( ON ?auto_299934 ?auto_299933 ) ( ON ?auto_299935 ?auto_299934 ) ( ON ?auto_299936 ?auto_299935 ) ( ON ?auto_299937 ?auto_299936 ) ( ON ?auto_299938 ?auto_299937 ) ( ON ?auto_299939 ?auto_299938 ) ( ON ?auto_299940 ?auto_299939 ) ( ON ?auto_299941 ?auto_299940 ) ( not ( = ?auto_299931 ?auto_299932 ) ) ( not ( = ?auto_299931 ?auto_299933 ) ) ( not ( = ?auto_299931 ?auto_299934 ) ) ( not ( = ?auto_299931 ?auto_299935 ) ) ( not ( = ?auto_299931 ?auto_299936 ) ) ( not ( = ?auto_299931 ?auto_299937 ) ) ( not ( = ?auto_299931 ?auto_299938 ) ) ( not ( = ?auto_299931 ?auto_299939 ) ) ( not ( = ?auto_299931 ?auto_299940 ) ) ( not ( = ?auto_299931 ?auto_299941 ) ) ( not ( = ?auto_299931 ?auto_299942 ) ) ( not ( = ?auto_299931 ?auto_299943 ) ) ( not ( = ?auto_299931 ?auto_299944 ) ) ( not ( = ?auto_299931 ?auto_299945 ) ) ( not ( = ?auto_299932 ?auto_299933 ) ) ( not ( = ?auto_299932 ?auto_299934 ) ) ( not ( = ?auto_299932 ?auto_299935 ) ) ( not ( = ?auto_299932 ?auto_299936 ) ) ( not ( = ?auto_299932 ?auto_299937 ) ) ( not ( = ?auto_299932 ?auto_299938 ) ) ( not ( = ?auto_299932 ?auto_299939 ) ) ( not ( = ?auto_299932 ?auto_299940 ) ) ( not ( = ?auto_299932 ?auto_299941 ) ) ( not ( = ?auto_299932 ?auto_299942 ) ) ( not ( = ?auto_299932 ?auto_299943 ) ) ( not ( = ?auto_299932 ?auto_299944 ) ) ( not ( = ?auto_299932 ?auto_299945 ) ) ( not ( = ?auto_299933 ?auto_299934 ) ) ( not ( = ?auto_299933 ?auto_299935 ) ) ( not ( = ?auto_299933 ?auto_299936 ) ) ( not ( = ?auto_299933 ?auto_299937 ) ) ( not ( = ?auto_299933 ?auto_299938 ) ) ( not ( = ?auto_299933 ?auto_299939 ) ) ( not ( = ?auto_299933 ?auto_299940 ) ) ( not ( = ?auto_299933 ?auto_299941 ) ) ( not ( = ?auto_299933 ?auto_299942 ) ) ( not ( = ?auto_299933 ?auto_299943 ) ) ( not ( = ?auto_299933 ?auto_299944 ) ) ( not ( = ?auto_299933 ?auto_299945 ) ) ( not ( = ?auto_299934 ?auto_299935 ) ) ( not ( = ?auto_299934 ?auto_299936 ) ) ( not ( = ?auto_299934 ?auto_299937 ) ) ( not ( = ?auto_299934 ?auto_299938 ) ) ( not ( = ?auto_299934 ?auto_299939 ) ) ( not ( = ?auto_299934 ?auto_299940 ) ) ( not ( = ?auto_299934 ?auto_299941 ) ) ( not ( = ?auto_299934 ?auto_299942 ) ) ( not ( = ?auto_299934 ?auto_299943 ) ) ( not ( = ?auto_299934 ?auto_299944 ) ) ( not ( = ?auto_299934 ?auto_299945 ) ) ( not ( = ?auto_299935 ?auto_299936 ) ) ( not ( = ?auto_299935 ?auto_299937 ) ) ( not ( = ?auto_299935 ?auto_299938 ) ) ( not ( = ?auto_299935 ?auto_299939 ) ) ( not ( = ?auto_299935 ?auto_299940 ) ) ( not ( = ?auto_299935 ?auto_299941 ) ) ( not ( = ?auto_299935 ?auto_299942 ) ) ( not ( = ?auto_299935 ?auto_299943 ) ) ( not ( = ?auto_299935 ?auto_299944 ) ) ( not ( = ?auto_299935 ?auto_299945 ) ) ( not ( = ?auto_299936 ?auto_299937 ) ) ( not ( = ?auto_299936 ?auto_299938 ) ) ( not ( = ?auto_299936 ?auto_299939 ) ) ( not ( = ?auto_299936 ?auto_299940 ) ) ( not ( = ?auto_299936 ?auto_299941 ) ) ( not ( = ?auto_299936 ?auto_299942 ) ) ( not ( = ?auto_299936 ?auto_299943 ) ) ( not ( = ?auto_299936 ?auto_299944 ) ) ( not ( = ?auto_299936 ?auto_299945 ) ) ( not ( = ?auto_299937 ?auto_299938 ) ) ( not ( = ?auto_299937 ?auto_299939 ) ) ( not ( = ?auto_299937 ?auto_299940 ) ) ( not ( = ?auto_299937 ?auto_299941 ) ) ( not ( = ?auto_299937 ?auto_299942 ) ) ( not ( = ?auto_299937 ?auto_299943 ) ) ( not ( = ?auto_299937 ?auto_299944 ) ) ( not ( = ?auto_299937 ?auto_299945 ) ) ( not ( = ?auto_299938 ?auto_299939 ) ) ( not ( = ?auto_299938 ?auto_299940 ) ) ( not ( = ?auto_299938 ?auto_299941 ) ) ( not ( = ?auto_299938 ?auto_299942 ) ) ( not ( = ?auto_299938 ?auto_299943 ) ) ( not ( = ?auto_299938 ?auto_299944 ) ) ( not ( = ?auto_299938 ?auto_299945 ) ) ( not ( = ?auto_299939 ?auto_299940 ) ) ( not ( = ?auto_299939 ?auto_299941 ) ) ( not ( = ?auto_299939 ?auto_299942 ) ) ( not ( = ?auto_299939 ?auto_299943 ) ) ( not ( = ?auto_299939 ?auto_299944 ) ) ( not ( = ?auto_299939 ?auto_299945 ) ) ( not ( = ?auto_299940 ?auto_299941 ) ) ( not ( = ?auto_299940 ?auto_299942 ) ) ( not ( = ?auto_299940 ?auto_299943 ) ) ( not ( = ?auto_299940 ?auto_299944 ) ) ( not ( = ?auto_299940 ?auto_299945 ) ) ( not ( = ?auto_299941 ?auto_299942 ) ) ( not ( = ?auto_299941 ?auto_299943 ) ) ( not ( = ?auto_299941 ?auto_299944 ) ) ( not ( = ?auto_299941 ?auto_299945 ) ) ( not ( = ?auto_299942 ?auto_299943 ) ) ( not ( = ?auto_299942 ?auto_299944 ) ) ( not ( = ?auto_299942 ?auto_299945 ) ) ( not ( = ?auto_299943 ?auto_299944 ) ) ( not ( = ?auto_299943 ?auto_299945 ) ) ( not ( = ?auto_299944 ?auto_299945 ) ) ( ON ?auto_299943 ?auto_299944 ) ( CLEAR ?auto_299941 ) ( ON ?auto_299942 ?auto_299943 ) ( CLEAR ?auto_299942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_299931 ?auto_299932 ?auto_299933 ?auto_299934 ?auto_299935 ?auto_299936 ?auto_299937 ?auto_299938 ?auto_299939 ?auto_299940 ?auto_299941 ?auto_299942 )
      ( MAKE-14PILE ?auto_299931 ?auto_299932 ?auto_299933 ?auto_299934 ?auto_299935 ?auto_299936 ?auto_299937 ?auto_299938 ?auto_299939 ?auto_299940 ?auto_299941 ?auto_299942 ?auto_299943 ?auto_299944 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_299960 - BLOCK
      ?auto_299961 - BLOCK
      ?auto_299962 - BLOCK
      ?auto_299963 - BLOCK
      ?auto_299964 - BLOCK
      ?auto_299965 - BLOCK
      ?auto_299966 - BLOCK
      ?auto_299967 - BLOCK
      ?auto_299968 - BLOCK
      ?auto_299969 - BLOCK
      ?auto_299970 - BLOCK
      ?auto_299971 - BLOCK
      ?auto_299972 - BLOCK
      ?auto_299973 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_299973 ) ( ON-TABLE ?auto_299960 ) ( ON ?auto_299961 ?auto_299960 ) ( ON ?auto_299962 ?auto_299961 ) ( ON ?auto_299963 ?auto_299962 ) ( ON ?auto_299964 ?auto_299963 ) ( ON ?auto_299965 ?auto_299964 ) ( ON ?auto_299966 ?auto_299965 ) ( ON ?auto_299967 ?auto_299966 ) ( ON ?auto_299968 ?auto_299967 ) ( ON ?auto_299969 ?auto_299968 ) ( ON ?auto_299970 ?auto_299969 ) ( not ( = ?auto_299960 ?auto_299961 ) ) ( not ( = ?auto_299960 ?auto_299962 ) ) ( not ( = ?auto_299960 ?auto_299963 ) ) ( not ( = ?auto_299960 ?auto_299964 ) ) ( not ( = ?auto_299960 ?auto_299965 ) ) ( not ( = ?auto_299960 ?auto_299966 ) ) ( not ( = ?auto_299960 ?auto_299967 ) ) ( not ( = ?auto_299960 ?auto_299968 ) ) ( not ( = ?auto_299960 ?auto_299969 ) ) ( not ( = ?auto_299960 ?auto_299970 ) ) ( not ( = ?auto_299960 ?auto_299971 ) ) ( not ( = ?auto_299960 ?auto_299972 ) ) ( not ( = ?auto_299960 ?auto_299973 ) ) ( not ( = ?auto_299961 ?auto_299962 ) ) ( not ( = ?auto_299961 ?auto_299963 ) ) ( not ( = ?auto_299961 ?auto_299964 ) ) ( not ( = ?auto_299961 ?auto_299965 ) ) ( not ( = ?auto_299961 ?auto_299966 ) ) ( not ( = ?auto_299961 ?auto_299967 ) ) ( not ( = ?auto_299961 ?auto_299968 ) ) ( not ( = ?auto_299961 ?auto_299969 ) ) ( not ( = ?auto_299961 ?auto_299970 ) ) ( not ( = ?auto_299961 ?auto_299971 ) ) ( not ( = ?auto_299961 ?auto_299972 ) ) ( not ( = ?auto_299961 ?auto_299973 ) ) ( not ( = ?auto_299962 ?auto_299963 ) ) ( not ( = ?auto_299962 ?auto_299964 ) ) ( not ( = ?auto_299962 ?auto_299965 ) ) ( not ( = ?auto_299962 ?auto_299966 ) ) ( not ( = ?auto_299962 ?auto_299967 ) ) ( not ( = ?auto_299962 ?auto_299968 ) ) ( not ( = ?auto_299962 ?auto_299969 ) ) ( not ( = ?auto_299962 ?auto_299970 ) ) ( not ( = ?auto_299962 ?auto_299971 ) ) ( not ( = ?auto_299962 ?auto_299972 ) ) ( not ( = ?auto_299962 ?auto_299973 ) ) ( not ( = ?auto_299963 ?auto_299964 ) ) ( not ( = ?auto_299963 ?auto_299965 ) ) ( not ( = ?auto_299963 ?auto_299966 ) ) ( not ( = ?auto_299963 ?auto_299967 ) ) ( not ( = ?auto_299963 ?auto_299968 ) ) ( not ( = ?auto_299963 ?auto_299969 ) ) ( not ( = ?auto_299963 ?auto_299970 ) ) ( not ( = ?auto_299963 ?auto_299971 ) ) ( not ( = ?auto_299963 ?auto_299972 ) ) ( not ( = ?auto_299963 ?auto_299973 ) ) ( not ( = ?auto_299964 ?auto_299965 ) ) ( not ( = ?auto_299964 ?auto_299966 ) ) ( not ( = ?auto_299964 ?auto_299967 ) ) ( not ( = ?auto_299964 ?auto_299968 ) ) ( not ( = ?auto_299964 ?auto_299969 ) ) ( not ( = ?auto_299964 ?auto_299970 ) ) ( not ( = ?auto_299964 ?auto_299971 ) ) ( not ( = ?auto_299964 ?auto_299972 ) ) ( not ( = ?auto_299964 ?auto_299973 ) ) ( not ( = ?auto_299965 ?auto_299966 ) ) ( not ( = ?auto_299965 ?auto_299967 ) ) ( not ( = ?auto_299965 ?auto_299968 ) ) ( not ( = ?auto_299965 ?auto_299969 ) ) ( not ( = ?auto_299965 ?auto_299970 ) ) ( not ( = ?auto_299965 ?auto_299971 ) ) ( not ( = ?auto_299965 ?auto_299972 ) ) ( not ( = ?auto_299965 ?auto_299973 ) ) ( not ( = ?auto_299966 ?auto_299967 ) ) ( not ( = ?auto_299966 ?auto_299968 ) ) ( not ( = ?auto_299966 ?auto_299969 ) ) ( not ( = ?auto_299966 ?auto_299970 ) ) ( not ( = ?auto_299966 ?auto_299971 ) ) ( not ( = ?auto_299966 ?auto_299972 ) ) ( not ( = ?auto_299966 ?auto_299973 ) ) ( not ( = ?auto_299967 ?auto_299968 ) ) ( not ( = ?auto_299967 ?auto_299969 ) ) ( not ( = ?auto_299967 ?auto_299970 ) ) ( not ( = ?auto_299967 ?auto_299971 ) ) ( not ( = ?auto_299967 ?auto_299972 ) ) ( not ( = ?auto_299967 ?auto_299973 ) ) ( not ( = ?auto_299968 ?auto_299969 ) ) ( not ( = ?auto_299968 ?auto_299970 ) ) ( not ( = ?auto_299968 ?auto_299971 ) ) ( not ( = ?auto_299968 ?auto_299972 ) ) ( not ( = ?auto_299968 ?auto_299973 ) ) ( not ( = ?auto_299969 ?auto_299970 ) ) ( not ( = ?auto_299969 ?auto_299971 ) ) ( not ( = ?auto_299969 ?auto_299972 ) ) ( not ( = ?auto_299969 ?auto_299973 ) ) ( not ( = ?auto_299970 ?auto_299971 ) ) ( not ( = ?auto_299970 ?auto_299972 ) ) ( not ( = ?auto_299970 ?auto_299973 ) ) ( not ( = ?auto_299971 ?auto_299972 ) ) ( not ( = ?auto_299971 ?auto_299973 ) ) ( not ( = ?auto_299972 ?auto_299973 ) ) ( ON ?auto_299972 ?auto_299973 ) ( CLEAR ?auto_299970 ) ( ON ?auto_299971 ?auto_299972 ) ( CLEAR ?auto_299971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_299960 ?auto_299961 ?auto_299962 ?auto_299963 ?auto_299964 ?auto_299965 ?auto_299966 ?auto_299967 ?auto_299968 ?auto_299969 ?auto_299970 ?auto_299971 )
      ( MAKE-14PILE ?auto_299960 ?auto_299961 ?auto_299962 ?auto_299963 ?auto_299964 ?auto_299965 ?auto_299966 ?auto_299967 ?auto_299968 ?auto_299969 ?auto_299970 ?auto_299971 ?auto_299972 ?auto_299973 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_299988 - BLOCK
      ?auto_299989 - BLOCK
      ?auto_299990 - BLOCK
      ?auto_299991 - BLOCK
      ?auto_299992 - BLOCK
      ?auto_299993 - BLOCK
      ?auto_299994 - BLOCK
      ?auto_299995 - BLOCK
      ?auto_299996 - BLOCK
      ?auto_299997 - BLOCK
      ?auto_299998 - BLOCK
      ?auto_299999 - BLOCK
      ?auto_300000 - BLOCK
      ?auto_300001 - BLOCK
    )
    :vars
    (
      ?auto_300002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_300001 ?auto_300002 ) ( ON-TABLE ?auto_299988 ) ( ON ?auto_299989 ?auto_299988 ) ( ON ?auto_299990 ?auto_299989 ) ( ON ?auto_299991 ?auto_299990 ) ( ON ?auto_299992 ?auto_299991 ) ( ON ?auto_299993 ?auto_299992 ) ( ON ?auto_299994 ?auto_299993 ) ( ON ?auto_299995 ?auto_299994 ) ( ON ?auto_299996 ?auto_299995 ) ( ON ?auto_299997 ?auto_299996 ) ( not ( = ?auto_299988 ?auto_299989 ) ) ( not ( = ?auto_299988 ?auto_299990 ) ) ( not ( = ?auto_299988 ?auto_299991 ) ) ( not ( = ?auto_299988 ?auto_299992 ) ) ( not ( = ?auto_299988 ?auto_299993 ) ) ( not ( = ?auto_299988 ?auto_299994 ) ) ( not ( = ?auto_299988 ?auto_299995 ) ) ( not ( = ?auto_299988 ?auto_299996 ) ) ( not ( = ?auto_299988 ?auto_299997 ) ) ( not ( = ?auto_299988 ?auto_299998 ) ) ( not ( = ?auto_299988 ?auto_299999 ) ) ( not ( = ?auto_299988 ?auto_300000 ) ) ( not ( = ?auto_299988 ?auto_300001 ) ) ( not ( = ?auto_299988 ?auto_300002 ) ) ( not ( = ?auto_299989 ?auto_299990 ) ) ( not ( = ?auto_299989 ?auto_299991 ) ) ( not ( = ?auto_299989 ?auto_299992 ) ) ( not ( = ?auto_299989 ?auto_299993 ) ) ( not ( = ?auto_299989 ?auto_299994 ) ) ( not ( = ?auto_299989 ?auto_299995 ) ) ( not ( = ?auto_299989 ?auto_299996 ) ) ( not ( = ?auto_299989 ?auto_299997 ) ) ( not ( = ?auto_299989 ?auto_299998 ) ) ( not ( = ?auto_299989 ?auto_299999 ) ) ( not ( = ?auto_299989 ?auto_300000 ) ) ( not ( = ?auto_299989 ?auto_300001 ) ) ( not ( = ?auto_299989 ?auto_300002 ) ) ( not ( = ?auto_299990 ?auto_299991 ) ) ( not ( = ?auto_299990 ?auto_299992 ) ) ( not ( = ?auto_299990 ?auto_299993 ) ) ( not ( = ?auto_299990 ?auto_299994 ) ) ( not ( = ?auto_299990 ?auto_299995 ) ) ( not ( = ?auto_299990 ?auto_299996 ) ) ( not ( = ?auto_299990 ?auto_299997 ) ) ( not ( = ?auto_299990 ?auto_299998 ) ) ( not ( = ?auto_299990 ?auto_299999 ) ) ( not ( = ?auto_299990 ?auto_300000 ) ) ( not ( = ?auto_299990 ?auto_300001 ) ) ( not ( = ?auto_299990 ?auto_300002 ) ) ( not ( = ?auto_299991 ?auto_299992 ) ) ( not ( = ?auto_299991 ?auto_299993 ) ) ( not ( = ?auto_299991 ?auto_299994 ) ) ( not ( = ?auto_299991 ?auto_299995 ) ) ( not ( = ?auto_299991 ?auto_299996 ) ) ( not ( = ?auto_299991 ?auto_299997 ) ) ( not ( = ?auto_299991 ?auto_299998 ) ) ( not ( = ?auto_299991 ?auto_299999 ) ) ( not ( = ?auto_299991 ?auto_300000 ) ) ( not ( = ?auto_299991 ?auto_300001 ) ) ( not ( = ?auto_299991 ?auto_300002 ) ) ( not ( = ?auto_299992 ?auto_299993 ) ) ( not ( = ?auto_299992 ?auto_299994 ) ) ( not ( = ?auto_299992 ?auto_299995 ) ) ( not ( = ?auto_299992 ?auto_299996 ) ) ( not ( = ?auto_299992 ?auto_299997 ) ) ( not ( = ?auto_299992 ?auto_299998 ) ) ( not ( = ?auto_299992 ?auto_299999 ) ) ( not ( = ?auto_299992 ?auto_300000 ) ) ( not ( = ?auto_299992 ?auto_300001 ) ) ( not ( = ?auto_299992 ?auto_300002 ) ) ( not ( = ?auto_299993 ?auto_299994 ) ) ( not ( = ?auto_299993 ?auto_299995 ) ) ( not ( = ?auto_299993 ?auto_299996 ) ) ( not ( = ?auto_299993 ?auto_299997 ) ) ( not ( = ?auto_299993 ?auto_299998 ) ) ( not ( = ?auto_299993 ?auto_299999 ) ) ( not ( = ?auto_299993 ?auto_300000 ) ) ( not ( = ?auto_299993 ?auto_300001 ) ) ( not ( = ?auto_299993 ?auto_300002 ) ) ( not ( = ?auto_299994 ?auto_299995 ) ) ( not ( = ?auto_299994 ?auto_299996 ) ) ( not ( = ?auto_299994 ?auto_299997 ) ) ( not ( = ?auto_299994 ?auto_299998 ) ) ( not ( = ?auto_299994 ?auto_299999 ) ) ( not ( = ?auto_299994 ?auto_300000 ) ) ( not ( = ?auto_299994 ?auto_300001 ) ) ( not ( = ?auto_299994 ?auto_300002 ) ) ( not ( = ?auto_299995 ?auto_299996 ) ) ( not ( = ?auto_299995 ?auto_299997 ) ) ( not ( = ?auto_299995 ?auto_299998 ) ) ( not ( = ?auto_299995 ?auto_299999 ) ) ( not ( = ?auto_299995 ?auto_300000 ) ) ( not ( = ?auto_299995 ?auto_300001 ) ) ( not ( = ?auto_299995 ?auto_300002 ) ) ( not ( = ?auto_299996 ?auto_299997 ) ) ( not ( = ?auto_299996 ?auto_299998 ) ) ( not ( = ?auto_299996 ?auto_299999 ) ) ( not ( = ?auto_299996 ?auto_300000 ) ) ( not ( = ?auto_299996 ?auto_300001 ) ) ( not ( = ?auto_299996 ?auto_300002 ) ) ( not ( = ?auto_299997 ?auto_299998 ) ) ( not ( = ?auto_299997 ?auto_299999 ) ) ( not ( = ?auto_299997 ?auto_300000 ) ) ( not ( = ?auto_299997 ?auto_300001 ) ) ( not ( = ?auto_299997 ?auto_300002 ) ) ( not ( = ?auto_299998 ?auto_299999 ) ) ( not ( = ?auto_299998 ?auto_300000 ) ) ( not ( = ?auto_299998 ?auto_300001 ) ) ( not ( = ?auto_299998 ?auto_300002 ) ) ( not ( = ?auto_299999 ?auto_300000 ) ) ( not ( = ?auto_299999 ?auto_300001 ) ) ( not ( = ?auto_299999 ?auto_300002 ) ) ( not ( = ?auto_300000 ?auto_300001 ) ) ( not ( = ?auto_300000 ?auto_300002 ) ) ( not ( = ?auto_300001 ?auto_300002 ) ) ( ON ?auto_300000 ?auto_300001 ) ( ON ?auto_299999 ?auto_300000 ) ( CLEAR ?auto_299997 ) ( ON ?auto_299998 ?auto_299999 ) ( CLEAR ?auto_299998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_299988 ?auto_299989 ?auto_299990 ?auto_299991 ?auto_299992 ?auto_299993 ?auto_299994 ?auto_299995 ?auto_299996 ?auto_299997 ?auto_299998 )
      ( MAKE-14PILE ?auto_299988 ?auto_299989 ?auto_299990 ?auto_299991 ?auto_299992 ?auto_299993 ?auto_299994 ?auto_299995 ?auto_299996 ?auto_299997 ?auto_299998 ?auto_299999 ?auto_300000 ?auto_300001 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_300017 - BLOCK
      ?auto_300018 - BLOCK
      ?auto_300019 - BLOCK
      ?auto_300020 - BLOCK
      ?auto_300021 - BLOCK
      ?auto_300022 - BLOCK
      ?auto_300023 - BLOCK
      ?auto_300024 - BLOCK
      ?auto_300025 - BLOCK
      ?auto_300026 - BLOCK
      ?auto_300027 - BLOCK
      ?auto_300028 - BLOCK
      ?auto_300029 - BLOCK
      ?auto_300030 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_300030 ) ( ON-TABLE ?auto_300017 ) ( ON ?auto_300018 ?auto_300017 ) ( ON ?auto_300019 ?auto_300018 ) ( ON ?auto_300020 ?auto_300019 ) ( ON ?auto_300021 ?auto_300020 ) ( ON ?auto_300022 ?auto_300021 ) ( ON ?auto_300023 ?auto_300022 ) ( ON ?auto_300024 ?auto_300023 ) ( ON ?auto_300025 ?auto_300024 ) ( ON ?auto_300026 ?auto_300025 ) ( not ( = ?auto_300017 ?auto_300018 ) ) ( not ( = ?auto_300017 ?auto_300019 ) ) ( not ( = ?auto_300017 ?auto_300020 ) ) ( not ( = ?auto_300017 ?auto_300021 ) ) ( not ( = ?auto_300017 ?auto_300022 ) ) ( not ( = ?auto_300017 ?auto_300023 ) ) ( not ( = ?auto_300017 ?auto_300024 ) ) ( not ( = ?auto_300017 ?auto_300025 ) ) ( not ( = ?auto_300017 ?auto_300026 ) ) ( not ( = ?auto_300017 ?auto_300027 ) ) ( not ( = ?auto_300017 ?auto_300028 ) ) ( not ( = ?auto_300017 ?auto_300029 ) ) ( not ( = ?auto_300017 ?auto_300030 ) ) ( not ( = ?auto_300018 ?auto_300019 ) ) ( not ( = ?auto_300018 ?auto_300020 ) ) ( not ( = ?auto_300018 ?auto_300021 ) ) ( not ( = ?auto_300018 ?auto_300022 ) ) ( not ( = ?auto_300018 ?auto_300023 ) ) ( not ( = ?auto_300018 ?auto_300024 ) ) ( not ( = ?auto_300018 ?auto_300025 ) ) ( not ( = ?auto_300018 ?auto_300026 ) ) ( not ( = ?auto_300018 ?auto_300027 ) ) ( not ( = ?auto_300018 ?auto_300028 ) ) ( not ( = ?auto_300018 ?auto_300029 ) ) ( not ( = ?auto_300018 ?auto_300030 ) ) ( not ( = ?auto_300019 ?auto_300020 ) ) ( not ( = ?auto_300019 ?auto_300021 ) ) ( not ( = ?auto_300019 ?auto_300022 ) ) ( not ( = ?auto_300019 ?auto_300023 ) ) ( not ( = ?auto_300019 ?auto_300024 ) ) ( not ( = ?auto_300019 ?auto_300025 ) ) ( not ( = ?auto_300019 ?auto_300026 ) ) ( not ( = ?auto_300019 ?auto_300027 ) ) ( not ( = ?auto_300019 ?auto_300028 ) ) ( not ( = ?auto_300019 ?auto_300029 ) ) ( not ( = ?auto_300019 ?auto_300030 ) ) ( not ( = ?auto_300020 ?auto_300021 ) ) ( not ( = ?auto_300020 ?auto_300022 ) ) ( not ( = ?auto_300020 ?auto_300023 ) ) ( not ( = ?auto_300020 ?auto_300024 ) ) ( not ( = ?auto_300020 ?auto_300025 ) ) ( not ( = ?auto_300020 ?auto_300026 ) ) ( not ( = ?auto_300020 ?auto_300027 ) ) ( not ( = ?auto_300020 ?auto_300028 ) ) ( not ( = ?auto_300020 ?auto_300029 ) ) ( not ( = ?auto_300020 ?auto_300030 ) ) ( not ( = ?auto_300021 ?auto_300022 ) ) ( not ( = ?auto_300021 ?auto_300023 ) ) ( not ( = ?auto_300021 ?auto_300024 ) ) ( not ( = ?auto_300021 ?auto_300025 ) ) ( not ( = ?auto_300021 ?auto_300026 ) ) ( not ( = ?auto_300021 ?auto_300027 ) ) ( not ( = ?auto_300021 ?auto_300028 ) ) ( not ( = ?auto_300021 ?auto_300029 ) ) ( not ( = ?auto_300021 ?auto_300030 ) ) ( not ( = ?auto_300022 ?auto_300023 ) ) ( not ( = ?auto_300022 ?auto_300024 ) ) ( not ( = ?auto_300022 ?auto_300025 ) ) ( not ( = ?auto_300022 ?auto_300026 ) ) ( not ( = ?auto_300022 ?auto_300027 ) ) ( not ( = ?auto_300022 ?auto_300028 ) ) ( not ( = ?auto_300022 ?auto_300029 ) ) ( not ( = ?auto_300022 ?auto_300030 ) ) ( not ( = ?auto_300023 ?auto_300024 ) ) ( not ( = ?auto_300023 ?auto_300025 ) ) ( not ( = ?auto_300023 ?auto_300026 ) ) ( not ( = ?auto_300023 ?auto_300027 ) ) ( not ( = ?auto_300023 ?auto_300028 ) ) ( not ( = ?auto_300023 ?auto_300029 ) ) ( not ( = ?auto_300023 ?auto_300030 ) ) ( not ( = ?auto_300024 ?auto_300025 ) ) ( not ( = ?auto_300024 ?auto_300026 ) ) ( not ( = ?auto_300024 ?auto_300027 ) ) ( not ( = ?auto_300024 ?auto_300028 ) ) ( not ( = ?auto_300024 ?auto_300029 ) ) ( not ( = ?auto_300024 ?auto_300030 ) ) ( not ( = ?auto_300025 ?auto_300026 ) ) ( not ( = ?auto_300025 ?auto_300027 ) ) ( not ( = ?auto_300025 ?auto_300028 ) ) ( not ( = ?auto_300025 ?auto_300029 ) ) ( not ( = ?auto_300025 ?auto_300030 ) ) ( not ( = ?auto_300026 ?auto_300027 ) ) ( not ( = ?auto_300026 ?auto_300028 ) ) ( not ( = ?auto_300026 ?auto_300029 ) ) ( not ( = ?auto_300026 ?auto_300030 ) ) ( not ( = ?auto_300027 ?auto_300028 ) ) ( not ( = ?auto_300027 ?auto_300029 ) ) ( not ( = ?auto_300027 ?auto_300030 ) ) ( not ( = ?auto_300028 ?auto_300029 ) ) ( not ( = ?auto_300028 ?auto_300030 ) ) ( not ( = ?auto_300029 ?auto_300030 ) ) ( ON ?auto_300029 ?auto_300030 ) ( ON ?auto_300028 ?auto_300029 ) ( CLEAR ?auto_300026 ) ( ON ?auto_300027 ?auto_300028 ) ( CLEAR ?auto_300027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_300017 ?auto_300018 ?auto_300019 ?auto_300020 ?auto_300021 ?auto_300022 ?auto_300023 ?auto_300024 ?auto_300025 ?auto_300026 ?auto_300027 )
      ( MAKE-14PILE ?auto_300017 ?auto_300018 ?auto_300019 ?auto_300020 ?auto_300021 ?auto_300022 ?auto_300023 ?auto_300024 ?auto_300025 ?auto_300026 ?auto_300027 ?auto_300028 ?auto_300029 ?auto_300030 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_300045 - BLOCK
      ?auto_300046 - BLOCK
      ?auto_300047 - BLOCK
      ?auto_300048 - BLOCK
      ?auto_300049 - BLOCK
      ?auto_300050 - BLOCK
      ?auto_300051 - BLOCK
      ?auto_300052 - BLOCK
      ?auto_300053 - BLOCK
      ?auto_300054 - BLOCK
      ?auto_300055 - BLOCK
      ?auto_300056 - BLOCK
      ?auto_300057 - BLOCK
      ?auto_300058 - BLOCK
    )
    :vars
    (
      ?auto_300059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_300058 ?auto_300059 ) ( ON-TABLE ?auto_300045 ) ( ON ?auto_300046 ?auto_300045 ) ( ON ?auto_300047 ?auto_300046 ) ( ON ?auto_300048 ?auto_300047 ) ( ON ?auto_300049 ?auto_300048 ) ( ON ?auto_300050 ?auto_300049 ) ( ON ?auto_300051 ?auto_300050 ) ( ON ?auto_300052 ?auto_300051 ) ( ON ?auto_300053 ?auto_300052 ) ( not ( = ?auto_300045 ?auto_300046 ) ) ( not ( = ?auto_300045 ?auto_300047 ) ) ( not ( = ?auto_300045 ?auto_300048 ) ) ( not ( = ?auto_300045 ?auto_300049 ) ) ( not ( = ?auto_300045 ?auto_300050 ) ) ( not ( = ?auto_300045 ?auto_300051 ) ) ( not ( = ?auto_300045 ?auto_300052 ) ) ( not ( = ?auto_300045 ?auto_300053 ) ) ( not ( = ?auto_300045 ?auto_300054 ) ) ( not ( = ?auto_300045 ?auto_300055 ) ) ( not ( = ?auto_300045 ?auto_300056 ) ) ( not ( = ?auto_300045 ?auto_300057 ) ) ( not ( = ?auto_300045 ?auto_300058 ) ) ( not ( = ?auto_300045 ?auto_300059 ) ) ( not ( = ?auto_300046 ?auto_300047 ) ) ( not ( = ?auto_300046 ?auto_300048 ) ) ( not ( = ?auto_300046 ?auto_300049 ) ) ( not ( = ?auto_300046 ?auto_300050 ) ) ( not ( = ?auto_300046 ?auto_300051 ) ) ( not ( = ?auto_300046 ?auto_300052 ) ) ( not ( = ?auto_300046 ?auto_300053 ) ) ( not ( = ?auto_300046 ?auto_300054 ) ) ( not ( = ?auto_300046 ?auto_300055 ) ) ( not ( = ?auto_300046 ?auto_300056 ) ) ( not ( = ?auto_300046 ?auto_300057 ) ) ( not ( = ?auto_300046 ?auto_300058 ) ) ( not ( = ?auto_300046 ?auto_300059 ) ) ( not ( = ?auto_300047 ?auto_300048 ) ) ( not ( = ?auto_300047 ?auto_300049 ) ) ( not ( = ?auto_300047 ?auto_300050 ) ) ( not ( = ?auto_300047 ?auto_300051 ) ) ( not ( = ?auto_300047 ?auto_300052 ) ) ( not ( = ?auto_300047 ?auto_300053 ) ) ( not ( = ?auto_300047 ?auto_300054 ) ) ( not ( = ?auto_300047 ?auto_300055 ) ) ( not ( = ?auto_300047 ?auto_300056 ) ) ( not ( = ?auto_300047 ?auto_300057 ) ) ( not ( = ?auto_300047 ?auto_300058 ) ) ( not ( = ?auto_300047 ?auto_300059 ) ) ( not ( = ?auto_300048 ?auto_300049 ) ) ( not ( = ?auto_300048 ?auto_300050 ) ) ( not ( = ?auto_300048 ?auto_300051 ) ) ( not ( = ?auto_300048 ?auto_300052 ) ) ( not ( = ?auto_300048 ?auto_300053 ) ) ( not ( = ?auto_300048 ?auto_300054 ) ) ( not ( = ?auto_300048 ?auto_300055 ) ) ( not ( = ?auto_300048 ?auto_300056 ) ) ( not ( = ?auto_300048 ?auto_300057 ) ) ( not ( = ?auto_300048 ?auto_300058 ) ) ( not ( = ?auto_300048 ?auto_300059 ) ) ( not ( = ?auto_300049 ?auto_300050 ) ) ( not ( = ?auto_300049 ?auto_300051 ) ) ( not ( = ?auto_300049 ?auto_300052 ) ) ( not ( = ?auto_300049 ?auto_300053 ) ) ( not ( = ?auto_300049 ?auto_300054 ) ) ( not ( = ?auto_300049 ?auto_300055 ) ) ( not ( = ?auto_300049 ?auto_300056 ) ) ( not ( = ?auto_300049 ?auto_300057 ) ) ( not ( = ?auto_300049 ?auto_300058 ) ) ( not ( = ?auto_300049 ?auto_300059 ) ) ( not ( = ?auto_300050 ?auto_300051 ) ) ( not ( = ?auto_300050 ?auto_300052 ) ) ( not ( = ?auto_300050 ?auto_300053 ) ) ( not ( = ?auto_300050 ?auto_300054 ) ) ( not ( = ?auto_300050 ?auto_300055 ) ) ( not ( = ?auto_300050 ?auto_300056 ) ) ( not ( = ?auto_300050 ?auto_300057 ) ) ( not ( = ?auto_300050 ?auto_300058 ) ) ( not ( = ?auto_300050 ?auto_300059 ) ) ( not ( = ?auto_300051 ?auto_300052 ) ) ( not ( = ?auto_300051 ?auto_300053 ) ) ( not ( = ?auto_300051 ?auto_300054 ) ) ( not ( = ?auto_300051 ?auto_300055 ) ) ( not ( = ?auto_300051 ?auto_300056 ) ) ( not ( = ?auto_300051 ?auto_300057 ) ) ( not ( = ?auto_300051 ?auto_300058 ) ) ( not ( = ?auto_300051 ?auto_300059 ) ) ( not ( = ?auto_300052 ?auto_300053 ) ) ( not ( = ?auto_300052 ?auto_300054 ) ) ( not ( = ?auto_300052 ?auto_300055 ) ) ( not ( = ?auto_300052 ?auto_300056 ) ) ( not ( = ?auto_300052 ?auto_300057 ) ) ( not ( = ?auto_300052 ?auto_300058 ) ) ( not ( = ?auto_300052 ?auto_300059 ) ) ( not ( = ?auto_300053 ?auto_300054 ) ) ( not ( = ?auto_300053 ?auto_300055 ) ) ( not ( = ?auto_300053 ?auto_300056 ) ) ( not ( = ?auto_300053 ?auto_300057 ) ) ( not ( = ?auto_300053 ?auto_300058 ) ) ( not ( = ?auto_300053 ?auto_300059 ) ) ( not ( = ?auto_300054 ?auto_300055 ) ) ( not ( = ?auto_300054 ?auto_300056 ) ) ( not ( = ?auto_300054 ?auto_300057 ) ) ( not ( = ?auto_300054 ?auto_300058 ) ) ( not ( = ?auto_300054 ?auto_300059 ) ) ( not ( = ?auto_300055 ?auto_300056 ) ) ( not ( = ?auto_300055 ?auto_300057 ) ) ( not ( = ?auto_300055 ?auto_300058 ) ) ( not ( = ?auto_300055 ?auto_300059 ) ) ( not ( = ?auto_300056 ?auto_300057 ) ) ( not ( = ?auto_300056 ?auto_300058 ) ) ( not ( = ?auto_300056 ?auto_300059 ) ) ( not ( = ?auto_300057 ?auto_300058 ) ) ( not ( = ?auto_300057 ?auto_300059 ) ) ( not ( = ?auto_300058 ?auto_300059 ) ) ( ON ?auto_300057 ?auto_300058 ) ( ON ?auto_300056 ?auto_300057 ) ( ON ?auto_300055 ?auto_300056 ) ( CLEAR ?auto_300053 ) ( ON ?auto_300054 ?auto_300055 ) ( CLEAR ?auto_300054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_300045 ?auto_300046 ?auto_300047 ?auto_300048 ?auto_300049 ?auto_300050 ?auto_300051 ?auto_300052 ?auto_300053 ?auto_300054 )
      ( MAKE-14PILE ?auto_300045 ?auto_300046 ?auto_300047 ?auto_300048 ?auto_300049 ?auto_300050 ?auto_300051 ?auto_300052 ?auto_300053 ?auto_300054 ?auto_300055 ?auto_300056 ?auto_300057 ?auto_300058 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_300074 - BLOCK
      ?auto_300075 - BLOCK
      ?auto_300076 - BLOCK
      ?auto_300077 - BLOCK
      ?auto_300078 - BLOCK
      ?auto_300079 - BLOCK
      ?auto_300080 - BLOCK
      ?auto_300081 - BLOCK
      ?auto_300082 - BLOCK
      ?auto_300083 - BLOCK
      ?auto_300084 - BLOCK
      ?auto_300085 - BLOCK
      ?auto_300086 - BLOCK
      ?auto_300087 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_300087 ) ( ON-TABLE ?auto_300074 ) ( ON ?auto_300075 ?auto_300074 ) ( ON ?auto_300076 ?auto_300075 ) ( ON ?auto_300077 ?auto_300076 ) ( ON ?auto_300078 ?auto_300077 ) ( ON ?auto_300079 ?auto_300078 ) ( ON ?auto_300080 ?auto_300079 ) ( ON ?auto_300081 ?auto_300080 ) ( ON ?auto_300082 ?auto_300081 ) ( not ( = ?auto_300074 ?auto_300075 ) ) ( not ( = ?auto_300074 ?auto_300076 ) ) ( not ( = ?auto_300074 ?auto_300077 ) ) ( not ( = ?auto_300074 ?auto_300078 ) ) ( not ( = ?auto_300074 ?auto_300079 ) ) ( not ( = ?auto_300074 ?auto_300080 ) ) ( not ( = ?auto_300074 ?auto_300081 ) ) ( not ( = ?auto_300074 ?auto_300082 ) ) ( not ( = ?auto_300074 ?auto_300083 ) ) ( not ( = ?auto_300074 ?auto_300084 ) ) ( not ( = ?auto_300074 ?auto_300085 ) ) ( not ( = ?auto_300074 ?auto_300086 ) ) ( not ( = ?auto_300074 ?auto_300087 ) ) ( not ( = ?auto_300075 ?auto_300076 ) ) ( not ( = ?auto_300075 ?auto_300077 ) ) ( not ( = ?auto_300075 ?auto_300078 ) ) ( not ( = ?auto_300075 ?auto_300079 ) ) ( not ( = ?auto_300075 ?auto_300080 ) ) ( not ( = ?auto_300075 ?auto_300081 ) ) ( not ( = ?auto_300075 ?auto_300082 ) ) ( not ( = ?auto_300075 ?auto_300083 ) ) ( not ( = ?auto_300075 ?auto_300084 ) ) ( not ( = ?auto_300075 ?auto_300085 ) ) ( not ( = ?auto_300075 ?auto_300086 ) ) ( not ( = ?auto_300075 ?auto_300087 ) ) ( not ( = ?auto_300076 ?auto_300077 ) ) ( not ( = ?auto_300076 ?auto_300078 ) ) ( not ( = ?auto_300076 ?auto_300079 ) ) ( not ( = ?auto_300076 ?auto_300080 ) ) ( not ( = ?auto_300076 ?auto_300081 ) ) ( not ( = ?auto_300076 ?auto_300082 ) ) ( not ( = ?auto_300076 ?auto_300083 ) ) ( not ( = ?auto_300076 ?auto_300084 ) ) ( not ( = ?auto_300076 ?auto_300085 ) ) ( not ( = ?auto_300076 ?auto_300086 ) ) ( not ( = ?auto_300076 ?auto_300087 ) ) ( not ( = ?auto_300077 ?auto_300078 ) ) ( not ( = ?auto_300077 ?auto_300079 ) ) ( not ( = ?auto_300077 ?auto_300080 ) ) ( not ( = ?auto_300077 ?auto_300081 ) ) ( not ( = ?auto_300077 ?auto_300082 ) ) ( not ( = ?auto_300077 ?auto_300083 ) ) ( not ( = ?auto_300077 ?auto_300084 ) ) ( not ( = ?auto_300077 ?auto_300085 ) ) ( not ( = ?auto_300077 ?auto_300086 ) ) ( not ( = ?auto_300077 ?auto_300087 ) ) ( not ( = ?auto_300078 ?auto_300079 ) ) ( not ( = ?auto_300078 ?auto_300080 ) ) ( not ( = ?auto_300078 ?auto_300081 ) ) ( not ( = ?auto_300078 ?auto_300082 ) ) ( not ( = ?auto_300078 ?auto_300083 ) ) ( not ( = ?auto_300078 ?auto_300084 ) ) ( not ( = ?auto_300078 ?auto_300085 ) ) ( not ( = ?auto_300078 ?auto_300086 ) ) ( not ( = ?auto_300078 ?auto_300087 ) ) ( not ( = ?auto_300079 ?auto_300080 ) ) ( not ( = ?auto_300079 ?auto_300081 ) ) ( not ( = ?auto_300079 ?auto_300082 ) ) ( not ( = ?auto_300079 ?auto_300083 ) ) ( not ( = ?auto_300079 ?auto_300084 ) ) ( not ( = ?auto_300079 ?auto_300085 ) ) ( not ( = ?auto_300079 ?auto_300086 ) ) ( not ( = ?auto_300079 ?auto_300087 ) ) ( not ( = ?auto_300080 ?auto_300081 ) ) ( not ( = ?auto_300080 ?auto_300082 ) ) ( not ( = ?auto_300080 ?auto_300083 ) ) ( not ( = ?auto_300080 ?auto_300084 ) ) ( not ( = ?auto_300080 ?auto_300085 ) ) ( not ( = ?auto_300080 ?auto_300086 ) ) ( not ( = ?auto_300080 ?auto_300087 ) ) ( not ( = ?auto_300081 ?auto_300082 ) ) ( not ( = ?auto_300081 ?auto_300083 ) ) ( not ( = ?auto_300081 ?auto_300084 ) ) ( not ( = ?auto_300081 ?auto_300085 ) ) ( not ( = ?auto_300081 ?auto_300086 ) ) ( not ( = ?auto_300081 ?auto_300087 ) ) ( not ( = ?auto_300082 ?auto_300083 ) ) ( not ( = ?auto_300082 ?auto_300084 ) ) ( not ( = ?auto_300082 ?auto_300085 ) ) ( not ( = ?auto_300082 ?auto_300086 ) ) ( not ( = ?auto_300082 ?auto_300087 ) ) ( not ( = ?auto_300083 ?auto_300084 ) ) ( not ( = ?auto_300083 ?auto_300085 ) ) ( not ( = ?auto_300083 ?auto_300086 ) ) ( not ( = ?auto_300083 ?auto_300087 ) ) ( not ( = ?auto_300084 ?auto_300085 ) ) ( not ( = ?auto_300084 ?auto_300086 ) ) ( not ( = ?auto_300084 ?auto_300087 ) ) ( not ( = ?auto_300085 ?auto_300086 ) ) ( not ( = ?auto_300085 ?auto_300087 ) ) ( not ( = ?auto_300086 ?auto_300087 ) ) ( ON ?auto_300086 ?auto_300087 ) ( ON ?auto_300085 ?auto_300086 ) ( ON ?auto_300084 ?auto_300085 ) ( CLEAR ?auto_300082 ) ( ON ?auto_300083 ?auto_300084 ) ( CLEAR ?auto_300083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_300074 ?auto_300075 ?auto_300076 ?auto_300077 ?auto_300078 ?auto_300079 ?auto_300080 ?auto_300081 ?auto_300082 ?auto_300083 )
      ( MAKE-14PILE ?auto_300074 ?auto_300075 ?auto_300076 ?auto_300077 ?auto_300078 ?auto_300079 ?auto_300080 ?auto_300081 ?auto_300082 ?auto_300083 ?auto_300084 ?auto_300085 ?auto_300086 ?auto_300087 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_300102 - BLOCK
      ?auto_300103 - BLOCK
      ?auto_300104 - BLOCK
      ?auto_300105 - BLOCK
      ?auto_300106 - BLOCK
      ?auto_300107 - BLOCK
      ?auto_300108 - BLOCK
      ?auto_300109 - BLOCK
      ?auto_300110 - BLOCK
      ?auto_300111 - BLOCK
      ?auto_300112 - BLOCK
      ?auto_300113 - BLOCK
      ?auto_300114 - BLOCK
      ?auto_300115 - BLOCK
    )
    :vars
    (
      ?auto_300116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_300115 ?auto_300116 ) ( ON-TABLE ?auto_300102 ) ( ON ?auto_300103 ?auto_300102 ) ( ON ?auto_300104 ?auto_300103 ) ( ON ?auto_300105 ?auto_300104 ) ( ON ?auto_300106 ?auto_300105 ) ( ON ?auto_300107 ?auto_300106 ) ( ON ?auto_300108 ?auto_300107 ) ( ON ?auto_300109 ?auto_300108 ) ( not ( = ?auto_300102 ?auto_300103 ) ) ( not ( = ?auto_300102 ?auto_300104 ) ) ( not ( = ?auto_300102 ?auto_300105 ) ) ( not ( = ?auto_300102 ?auto_300106 ) ) ( not ( = ?auto_300102 ?auto_300107 ) ) ( not ( = ?auto_300102 ?auto_300108 ) ) ( not ( = ?auto_300102 ?auto_300109 ) ) ( not ( = ?auto_300102 ?auto_300110 ) ) ( not ( = ?auto_300102 ?auto_300111 ) ) ( not ( = ?auto_300102 ?auto_300112 ) ) ( not ( = ?auto_300102 ?auto_300113 ) ) ( not ( = ?auto_300102 ?auto_300114 ) ) ( not ( = ?auto_300102 ?auto_300115 ) ) ( not ( = ?auto_300102 ?auto_300116 ) ) ( not ( = ?auto_300103 ?auto_300104 ) ) ( not ( = ?auto_300103 ?auto_300105 ) ) ( not ( = ?auto_300103 ?auto_300106 ) ) ( not ( = ?auto_300103 ?auto_300107 ) ) ( not ( = ?auto_300103 ?auto_300108 ) ) ( not ( = ?auto_300103 ?auto_300109 ) ) ( not ( = ?auto_300103 ?auto_300110 ) ) ( not ( = ?auto_300103 ?auto_300111 ) ) ( not ( = ?auto_300103 ?auto_300112 ) ) ( not ( = ?auto_300103 ?auto_300113 ) ) ( not ( = ?auto_300103 ?auto_300114 ) ) ( not ( = ?auto_300103 ?auto_300115 ) ) ( not ( = ?auto_300103 ?auto_300116 ) ) ( not ( = ?auto_300104 ?auto_300105 ) ) ( not ( = ?auto_300104 ?auto_300106 ) ) ( not ( = ?auto_300104 ?auto_300107 ) ) ( not ( = ?auto_300104 ?auto_300108 ) ) ( not ( = ?auto_300104 ?auto_300109 ) ) ( not ( = ?auto_300104 ?auto_300110 ) ) ( not ( = ?auto_300104 ?auto_300111 ) ) ( not ( = ?auto_300104 ?auto_300112 ) ) ( not ( = ?auto_300104 ?auto_300113 ) ) ( not ( = ?auto_300104 ?auto_300114 ) ) ( not ( = ?auto_300104 ?auto_300115 ) ) ( not ( = ?auto_300104 ?auto_300116 ) ) ( not ( = ?auto_300105 ?auto_300106 ) ) ( not ( = ?auto_300105 ?auto_300107 ) ) ( not ( = ?auto_300105 ?auto_300108 ) ) ( not ( = ?auto_300105 ?auto_300109 ) ) ( not ( = ?auto_300105 ?auto_300110 ) ) ( not ( = ?auto_300105 ?auto_300111 ) ) ( not ( = ?auto_300105 ?auto_300112 ) ) ( not ( = ?auto_300105 ?auto_300113 ) ) ( not ( = ?auto_300105 ?auto_300114 ) ) ( not ( = ?auto_300105 ?auto_300115 ) ) ( not ( = ?auto_300105 ?auto_300116 ) ) ( not ( = ?auto_300106 ?auto_300107 ) ) ( not ( = ?auto_300106 ?auto_300108 ) ) ( not ( = ?auto_300106 ?auto_300109 ) ) ( not ( = ?auto_300106 ?auto_300110 ) ) ( not ( = ?auto_300106 ?auto_300111 ) ) ( not ( = ?auto_300106 ?auto_300112 ) ) ( not ( = ?auto_300106 ?auto_300113 ) ) ( not ( = ?auto_300106 ?auto_300114 ) ) ( not ( = ?auto_300106 ?auto_300115 ) ) ( not ( = ?auto_300106 ?auto_300116 ) ) ( not ( = ?auto_300107 ?auto_300108 ) ) ( not ( = ?auto_300107 ?auto_300109 ) ) ( not ( = ?auto_300107 ?auto_300110 ) ) ( not ( = ?auto_300107 ?auto_300111 ) ) ( not ( = ?auto_300107 ?auto_300112 ) ) ( not ( = ?auto_300107 ?auto_300113 ) ) ( not ( = ?auto_300107 ?auto_300114 ) ) ( not ( = ?auto_300107 ?auto_300115 ) ) ( not ( = ?auto_300107 ?auto_300116 ) ) ( not ( = ?auto_300108 ?auto_300109 ) ) ( not ( = ?auto_300108 ?auto_300110 ) ) ( not ( = ?auto_300108 ?auto_300111 ) ) ( not ( = ?auto_300108 ?auto_300112 ) ) ( not ( = ?auto_300108 ?auto_300113 ) ) ( not ( = ?auto_300108 ?auto_300114 ) ) ( not ( = ?auto_300108 ?auto_300115 ) ) ( not ( = ?auto_300108 ?auto_300116 ) ) ( not ( = ?auto_300109 ?auto_300110 ) ) ( not ( = ?auto_300109 ?auto_300111 ) ) ( not ( = ?auto_300109 ?auto_300112 ) ) ( not ( = ?auto_300109 ?auto_300113 ) ) ( not ( = ?auto_300109 ?auto_300114 ) ) ( not ( = ?auto_300109 ?auto_300115 ) ) ( not ( = ?auto_300109 ?auto_300116 ) ) ( not ( = ?auto_300110 ?auto_300111 ) ) ( not ( = ?auto_300110 ?auto_300112 ) ) ( not ( = ?auto_300110 ?auto_300113 ) ) ( not ( = ?auto_300110 ?auto_300114 ) ) ( not ( = ?auto_300110 ?auto_300115 ) ) ( not ( = ?auto_300110 ?auto_300116 ) ) ( not ( = ?auto_300111 ?auto_300112 ) ) ( not ( = ?auto_300111 ?auto_300113 ) ) ( not ( = ?auto_300111 ?auto_300114 ) ) ( not ( = ?auto_300111 ?auto_300115 ) ) ( not ( = ?auto_300111 ?auto_300116 ) ) ( not ( = ?auto_300112 ?auto_300113 ) ) ( not ( = ?auto_300112 ?auto_300114 ) ) ( not ( = ?auto_300112 ?auto_300115 ) ) ( not ( = ?auto_300112 ?auto_300116 ) ) ( not ( = ?auto_300113 ?auto_300114 ) ) ( not ( = ?auto_300113 ?auto_300115 ) ) ( not ( = ?auto_300113 ?auto_300116 ) ) ( not ( = ?auto_300114 ?auto_300115 ) ) ( not ( = ?auto_300114 ?auto_300116 ) ) ( not ( = ?auto_300115 ?auto_300116 ) ) ( ON ?auto_300114 ?auto_300115 ) ( ON ?auto_300113 ?auto_300114 ) ( ON ?auto_300112 ?auto_300113 ) ( ON ?auto_300111 ?auto_300112 ) ( CLEAR ?auto_300109 ) ( ON ?auto_300110 ?auto_300111 ) ( CLEAR ?auto_300110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_300102 ?auto_300103 ?auto_300104 ?auto_300105 ?auto_300106 ?auto_300107 ?auto_300108 ?auto_300109 ?auto_300110 )
      ( MAKE-14PILE ?auto_300102 ?auto_300103 ?auto_300104 ?auto_300105 ?auto_300106 ?auto_300107 ?auto_300108 ?auto_300109 ?auto_300110 ?auto_300111 ?auto_300112 ?auto_300113 ?auto_300114 ?auto_300115 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_300131 - BLOCK
      ?auto_300132 - BLOCK
      ?auto_300133 - BLOCK
      ?auto_300134 - BLOCK
      ?auto_300135 - BLOCK
      ?auto_300136 - BLOCK
      ?auto_300137 - BLOCK
      ?auto_300138 - BLOCK
      ?auto_300139 - BLOCK
      ?auto_300140 - BLOCK
      ?auto_300141 - BLOCK
      ?auto_300142 - BLOCK
      ?auto_300143 - BLOCK
      ?auto_300144 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_300144 ) ( ON-TABLE ?auto_300131 ) ( ON ?auto_300132 ?auto_300131 ) ( ON ?auto_300133 ?auto_300132 ) ( ON ?auto_300134 ?auto_300133 ) ( ON ?auto_300135 ?auto_300134 ) ( ON ?auto_300136 ?auto_300135 ) ( ON ?auto_300137 ?auto_300136 ) ( ON ?auto_300138 ?auto_300137 ) ( not ( = ?auto_300131 ?auto_300132 ) ) ( not ( = ?auto_300131 ?auto_300133 ) ) ( not ( = ?auto_300131 ?auto_300134 ) ) ( not ( = ?auto_300131 ?auto_300135 ) ) ( not ( = ?auto_300131 ?auto_300136 ) ) ( not ( = ?auto_300131 ?auto_300137 ) ) ( not ( = ?auto_300131 ?auto_300138 ) ) ( not ( = ?auto_300131 ?auto_300139 ) ) ( not ( = ?auto_300131 ?auto_300140 ) ) ( not ( = ?auto_300131 ?auto_300141 ) ) ( not ( = ?auto_300131 ?auto_300142 ) ) ( not ( = ?auto_300131 ?auto_300143 ) ) ( not ( = ?auto_300131 ?auto_300144 ) ) ( not ( = ?auto_300132 ?auto_300133 ) ) ( not ( = ?auto_300132 ?auto_300134 ) ) ( not ( = ?auto_300132 ?auto_300135 ) ) ( not ( = ?auto_300132 ?auto_300136 ) ) ( not ( = ?auto_300132 ?auto_300137 ) ) ( not ( = ?auto_300132 ?auto_300138 ) ) ( not ( = ?auto_300132 ?auto_300139 ) ) ( not ( = ?auto_300132 ?auto_300140 ) ) ( not ( = ?auto_300132 ?auto_300141 ) ) ( not ( = ?auto_300132 ?auto_300142 ) ) ( not ( = ?auto_300132 ?auto_300143 ) ) ( not ( = ?auto_300132 ?auto_300144 ) ) ( not ( = ?auto_300133 ?auto_300134 ) ) ( not ( = ?auto_300133 ?auto_300135 ) ) ( not ( = ?auto_300133 ?auto_300136 ) ) ( not ( = ?auto_300133 ?auto_300137 ) ) ( not ( = ?auto_300133 ?auto_300138 ) ) ( not ( = ?auto_300133 ?auto_300139 ) ) ( not ( = ?auto_300133 ?auto_300140 ) ) ( not ( = ?auto_300133 ?auto_300141 ) ) ( not ( = ?auto_300133 ?auto_300142 ) ) ( not ( = ?auto_300133 ?auto_300143 ) ) ( not ( = ?auto_300133 ?auto_300144 ) ) ( not ( = ?auto_300134 ?auto_300135 ) ) ( not ( = ?auto_300134 ?auto_300136 ) ) ( not ( = ?auto_300134 ?auto_300137 ) ) ( not ( = ?auto_300134 ?auto_300138 ) ) ( not ( = ?auto_300134 ?auto_300139 ) ) ( not ( = ?auto_300134 ?auto_300140 ) ) ( not ( = ?auto_300134 ?auto_300141 ) ) ( not ( = ?auto_300134 ?auto_300142 ) ) ( not ( = ?auto_300134 ?auto_300143 ) ) ( not ( = ?auto_300134 ?auto_300144 ) ) ( not ( = ?auto_300135 ?auto_300136 ) ) ( not ( = ?auto_300135 ?auto_300137 ) ) ( not ( = ?auto_300135 ?auto_300138 ) ) ( not ( = ?auto_300135 ?auto_300139 ) ) ( not ( = ?auto_300135 ?auto_300140 ) ) ( not ( = ?auto_300135 ?auto_300141 ) ) ( not ( = ?auto_300135 ?auto_300142 ) ) ( not ( = ?auto_300135 ?auto_300143 ) ) ( not ( = ?auto_300135 ?auto_300144 ) ) ( not ( = ?auto_300136 ?auto_300137 ) ) ( not ( = ?auto_300136 ?auto_300138 ) ) ( not ( = ?auto_300136 ?auto_300139 ) ) ( not ( = ?auto_300136 ?auto_300140 ) ) ( not ( = ?auto_300136 ?auto_300141 ) ) ( not ( = ?auto_300136 ?auto_300142 ) ) ( not ( = ?auto_300136 ?auto_300143 ) ) ( not ( = ?auto_300136 ?auto_300144 ) ) ( not ( = ?auto_300137 ?auto_300138 ) ) ( not ( = ?auto_300137 ?auto_300139 ) ) ( not ( = ?auto_300137 ?auto_300140 ) ) ( not ( = ?auto_300137 ?auto_300141 ) ) ( not ( = ?auto_300137 ?auto_300142 ) ) ( not ( = ?auto_300137 ?auto_300143 ) ) ( not ( = ?auto_300137 ?auto_300144 ) ) ( not ( = ?auto_300138 ?auto_300139 ) ) ( not ( = ?auto_300138 ?auto_300140 ) ) ( not ( = ?auto_300138 ?auto_300141 ) ) ( not ( = ?auto_300138 ?auto_300142 ) ) ( not ( = ?auto_300138 ?auto_300143 ) ) ( not ( = ?auto_300138 ?auto_300144 ) ) ( not ( = ?auto_300139 ?auto_300140 ) ) ( not ( = ?auto_300139 ?auto_300141 ) ) ( not ( = ?auto_300139 ?auto_300142 ) ) ( not ( = ?auto_300139 ?auto_300143 ) ) ( not ( = ?auto_300139 ?auto_300144 ) ) ( not ( = ?auto_300140 ?auto_300141 ) ) ( not ( = ?auto_300140 ?auto_300142 ) ) ( not ( = ?auto_300140 ?auto_300143 ) ) ( not ( = ?auto_300140 ?auto_300144 ) ) ( not ( = ?auto_300141 ?auto_300142 ) ) ( not ( = ?auto_300141 ?auto_300143 ) ) ( not ( = ?auto_300141 ?auto_300144 ) ) ( not ( = ?auto_300142 ?auto_300143 ) ) ( not ( = ?auto_300142 ?auto_300144 ) ) ( not ( = ?auto_300143 ?auto_300144 ) ) ( ON ?auto_300143 ?auto_300144 ) ( ON ?auto_300142 ?auto_300143 ) ( ON ?auto_300141 ?auto_300142 ) ( ON ?auto_300140 ?auto_300141 ) ( CLEAR ?auto_300138 ) ( ON ?auto_300139 ?auto_300140 ) ( CLEAR ?auto_300139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_300131 ?auto_300132 ?auto_300133 ?auto_300134 ?auto_300135 ?auto_300136 ?auto_300137 ?auto_300138 ?auto_300139 )
      ( MAKE-14PILE ?auto_300131 ?auto_300132 ?auto_300133 ?auto_300134 ?auto_300135 ?auto_300136 ?auto_300137 ?auto_300138 ?auto_300139 ?auto_300140 ?auto_300141 ?auto_300142 ?auto_300143 ?auto_300144 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_300159 - BLOCK
      ?auto_300160 - BLOCK
      ?auto_300161 - BLOCK
      ?auto_300162 - BLOCK
      ?auto_300163 - BLOCK
      ?auto_300164 - BLOCK
      ?auto_300165 - BLOCK
      ?auto_300166 - BLOCK
      ?auto_300167 - BLOCK
      ?auto_300168 - BLOCK
      ?auto_300169 - BLOCK
      ?auto_300170 - BLOCK
      ?auto_300171 - BLOCK
      ?auto_300172 - BLOCK
    )
    :vars
    (
      ?auto_300173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_300172 ?auto_300173 ) ( ON-TABLE ?auto_300159 ) ( ON ?auto_300160 ?auto_300159 ) ( ON ?auto_300161 ?auto_300160 ) ( ON ?auto_300162 ?auto_300161 ) ( ON ?auto_300163 ?auto_300162 ) ( ON ?auto_300164 ?auto_300163 ) ( ON ?auto_300165 ?auto_300164 ) ( not ( = ?auto_300159 ?auto_300160 ) ) ( not ( = ?auto_300159 ?auto_300161 ) ) ( not ( = ?auto_300159 ?auto_300162 ) ) ( not ( = ?auto_300159 ?auto_300163 ) ) ( not ( = ?auto_300159 ?auto_300164 ) ) ( not ( = ?auto_300159 ?auto_300165 ) ) ( not ( = ?auto_300159 ?auto_300166 ) ) ( not ( = ?auto_300159 ?auto_300167 ) ) ( not ( = ?auto_300159 ?auto_300168 ) ) ( not ( = ?auto_300159 ?auto_300169 ) ) ( not ( = ?auto_300159 ?auto_300170 ) ) ( not ( = ?auto_300159 ?auto_300171 ) ) ( not ( = ?auto_300159 ?auto_300172 ) ) ( not ( = ?auto_300159 ?auto_300173 ) ) ( not ( = ?auto_300160 ?auto_300161 ) ) ( not ( = ?auto_300160 ?auto_300162 ) ) ( not ( = ?auto_300160 ?auto_300163 ) ) ( not ( = ?auto_300160 ?auto_300164 ) ) ( not ( = ?auto_300160 ?auto_300165 ) ) ( not ( = ?auto_300160 ?auto_300166 ) ) ( not ( = ?auto_300160 ?auto_300167 ) ) ( not ( = ?auto_300160 ?auto_300168 ) ) ( not ( = ?auto_300160 ?auto_300169 ) ) ( not ( = ?auto_300160 ?auto_300170 ) ) ( not ( = ?auto_300160 ?auto_300171 ) ) ( not ( = ?auto_300160 ?auto_300172 ) ) ( not ( = ?auto_300160 ?auto_300173 ) ) ( not ( = ?auto_300161 ?auto_300162 ) ) ( not ( = ?auto_300161 ?auto_300163 ) ) ( not ( = ?auto_300161 ?auto_300164 ) ) ( not ( = ?auto_300161 ?auto_300165 ) ) ( not ( = ?auto_300161 ?auto_300166 ) ) ( not ( = ?auto_300161 ?auto_300167 ) ) ( not ( = ?auto_300161 ?auto_300168 ) ) ( not ( = ?auto_300161 ?auto_300169 ) ) ( not ( = ?auto_300161 ?auto_300170 ) ) ( not ( = ?auto_300161 ?auto_300171 ) ) ( not ( = ?auto_300161 ?auto_300172 ) ) ( not ( = ?auto_300161 ?auto_300173 ) ) ( not ( = ?auto_300162 ?auto_300163 ) ) ( not ( = ?auto_300162 ?auto_300164 ) ) ( not ( = ?auto_300162 ?auto_300165 ) ) ( not ( = ?auto_300162 ?auto_300166 ) ) ( not ( = ?auto_300162 ?auto_300167 ) ) ( not ( = ?auto_300162 ?auto_300168 ) ) ( not ( = ?auto_300162 ?auto_300169 ) ) ( not ( = ?auto_300162 ?auto_300170 ) ) ( not ( = ?auto_300162 ?auto_300171 ) ) ( not ( = ?auto_300162 ?auto_300172 ) ) ( not ( = ?auto_300162 ?auto_300173 ) ) ( not ( = ?auto_300163 ?auto_300164 ) ) ( not ( = ?auto_300163 ?auto_300165 ) ) ( not ( = ?auto_300163 ?auto_300166 ) ) ( not ( = ?auto_300163 ?auto_300167 ) ) ( not ( = ?auto_300163 ?auto_300168 ) ) ( not ( = ?auto_300163 ?auto_300169 ) ) ( not ( = ?auto_300163 ?auto_300170 ) ) ( not ( = ?auto_300163 ?auto_300171 ) ) ( not ( = ?auto_300163 ?auto_300172 ) ) ( not ( = ?auto_300163 ?auto_300173 ) ) ( not ( = ?auto_300164 ?auto_300165 ) ) ( not ( = ?auto_300164 ?auto_300166 ) ) ( not ( = ?auto_300164 ?auto_300167 ) ) ( not ( = ?auto_300164 ?auto_300168 ) ) ( not ( = ?auto_300164 ?auto_300169 ) ) ( not ( = ?auto_300164 ?auto_300170 ) ) ( not ( = ?auto_300164 ?auto_300171 ) ) ( not ( = ?auto_300164 ?auto_300172 ) ) ( not ( = ?auto_300164 ?auto_300173 ) ) ( not ( = ?auto_300165 ?auto_300166 ) ) ( not ( = ?auto_300165 ?auto_300167 ) ) ( not ( = ?auto_300165 ?auto_300168 ) ) ( not ( = ?auto_300165 ?auto_300169 ) ) ( not ( = ?auto_300165 ?auto_300170 ) ) ( not ( = ?auto_300165 ?auto_300171 ) ) ( not ( = ?auto_300165 ?auto_300172 ) ) ( not ( = ?auto_300165 ?auto_300173 ) ) ( not ( = ?auto_300166 ?auto_300167 ) ) ( not ( = ?auto_300166 ?auto_300168 ) ) ( not ( = ?auto_300166 ?auto_300169 ) ) ( not ( = ?auto_300166 ?auto_300170 ) ) ( not ( = ?auto_300166 ?auto_300171 ) ) ( not ( = ?auto_300166 ?auto_300172 ) ) ( not ( = ?auto_300166 ?auto_300173 ) ) ( not ( = ?auto_300167 ?auto_300168 ) ) ( not ( = ?auto_300167 ?auto_300169 ) ) ( not ( = ?auto_300167 ?auto_300170 ) ) ( not ( = ?auto_300167 ?auto_300171 ) ) ( not ( = ?auto_300167 ?auto_300172 ) ) ( not ( = ?auto_300167 ?auto_300173 ) ) ( not ( = ?auto_300168 ?auto_300169 ) ) ( not ( = ?auto_300168 ?auto_300170 ) ) ( not ( = ?auto_300168 ?auto_300171 ) ) ( not ( = ?auto_300168 ?auto_300172 ) ) ( not ( = ?auto_300168 ?auto_300173 ) ) ( not ( = ?auto_300169 ?auto_300170 ) ) ( not ( = ?auto_300169 ?auto_300171 ) ) ( not ( = ?auto_300169 ?auto_300172 ) ) ( not ( = ?auto_300169 ?auto_300173 ) ) ( not ( = ?auto_300170 ?auto_300171 ) ) ( not ( = ?auto_300170 ?auto_300172 ) ) ( not ( = ?auto_300170 ?auto_300173 ) ) ( not ( = ?auto_300171 ?auto_300172 ) ) ( not ( = ?auto_300171 ?auto_300173 ) ) ( not ( = ?auto_300172 ?auto_300173 ) ) ( ON ?auto_300171 ?auto_300172 ) ( ON ?auto_300170 ?auto_300171 ) ( ON ?auto_300169 ?auto_300170 ) ( ON ?auto_300168 ?auto_300169 ) ( ON ?auto_300167 ?auto_300168 ) ( CLEAR ?auto_300165 ) ( ON ?auto_300166 ?auto_300167 ) ( CLEAR ?auto_300166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_300159 ?auto_300160 ?auto_300161 ?auto_300162 ?auto_300163 ?auto_300164 ?auto_300165 ?auto_300166 )
      ( MAKE-14PILE ?auto_300159 ?auto_300160 ?auto_300161 ?auto_300162 ?auto_300163 ?auto_300164 ?auto_300165 ?auto_300166 ?auto_300167 ?auto_300168 ?auto_300169 ?auto_300170 ?auto_300171 ?auto_300172 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_300188 - BLOCK
      ?auto_300189 - BLOCK
      ?auto_300190 - BLOCK
      ?auto_300191 - BLOCK
      ?auto_300192 - BLOCK
      ?auto_300193 - BLOCK
      ?auto_300194 - BLOCK
      ?auto_300195 - BLOCK
      ?auto_300196 - BLOCK
      ?auto_300197 - BLOCK
      ?auto_300198 - BLOCK
      ?auto_300199 - BLOCK
      ?auto_300200 - BLOCK
      ?auto_300201 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_300201 ) ( ON-TABLE ?auto_300188 ) ( ON ?auto_300189 ?auto_300188 ) ( ON ?auto_300190 ?auto_300189 ) ( ON ?auto_300191 ?auto_300190 ) ( ON ?auto_300192 ?auto_300191 ) ( ON ?auto_300193 ?auto_300192 ) ( ON ?auto_300194 ?auto_300193 ) ( not ( = ?auto_300188 ?auto_300189 ) ) ( not ( = ?auto_300188 ?auto_300190 ) ) ( not ( = ?auto_300188 ?auto_300191 ) ) ( not ( = ?auto_300188 ?auto_300192 ) ) ( not ( = ?auto_300188 ?auto_300193 ) ) ( not ( = ?auto_300188 ?auto_300194 ) ) ( not ( = ?auto_300188 ?auto_300195 ) ) ( not ( = ?auto_300188 ?auto_300196 ) ) ( not ( = ?auto_300188 ?auto_300197 ) ) ( not ( = ?auto_300188 ?auto_300198 ) ) ( not ( = ?auto_300188 ?auto_300199 ) ) ( not ( = ?auto_300188 ?auto_300200 ) ) ( not ( = ?auto_300188 ?auto_300201 ) ) ( not ( = ?auto_300189 ?auto_300190 ) ) ( not ( = ?auto_300189 ?auto_300191 ) ) ( not ( = ?auto_300189 ?auto_300192 ) ) ( not ( = ?auto_300189 ?auto_300193 ) ) ( not ( = ?auto_300189 ?auto_300194 ) ) ( not ( = ?auto_300189 ?auto_300195 ) ) ( not ( = ?auto_300189 ?auto_300196 ) ) ( not ( = ?auto_300189 ?auto_300197 ) ) ( not ( = ?auto_300189 ?auto_300198 ) ) ( not ( = ?auto_300189 ?auto_300199 ) ) ( not ( = ?auto_300189 ?auto_300200 ) ) ( not ( = ?auto_300189 ?auto_300201 ) ) ( not ( = ?auto_300190 ?auto_300191 ) ) ( not ( = ?auto_300190 ?auto_300192 ) ) ( not ( = ?auto_300190 ?auto_300193 ) ) ( not ( = ?auto_300190 ?auto_300194 ) ) ( not ( = ?auto_300190 ?auto_300195 ) ) ( not ( = ?auto_300190 ?auto_300196 ) ) ( not ( = ?auto_300190 ?auto_300197 ) ) ( not ( = ?auto_300190 ?auto_300198 ) ) ( not ( = ?auto_300190 ?auto_300199 ) ) ( not ( = ?auto_300190 ?auto_300200 ) ) ( not ( = ?auto_300190 ?auto_300201 ) ) ( not ( = ?auto_300191 ?auto_300192 ) ) ( not ( = ?auto_300191 ?auto_300193 ) ) ( not ( = ?auto_300191 ?auto_300194 ) ) ( not ( = ?auto_300191 ?auto_300195 ) ) ( not ( = ?auto_300191 ?auto_300196 ) ) ( not ( = ?auto_300191 ?auto_300197 ) ) ( not ( = ?auto_300191 ?auto_300198 ) ) ( not ( = ?auto_300191 ?auto_300199 ) ) ( not ( = ?auto_300191 ?auto_300200 ) ) ( not ( = ?auto_300191 ?auto_300201 ) ) ( not ( = ?auto_300192 ?auto_300193 ) ) ( not ( = ?auto_300192 ?auto_300194 ) ) ( not ( = ?auto_300192 ?auto_300195 ) ) ( not ( = ?auto_300192 ?auto_300196 ) ) ( not ( = ?auto_300192 ?auto_300197 ) ) ( not ( = ?auto_300192 ?auto_300198 ) ) ( not ( = ?auto_300192 ?auto_300199 ) ) ( not ( = ?auto_300192 ?auto_300200 ) ) ( not ( = ?auto_300192 ?auto_300201 ) ) ( not ( = ?auto_300193 ?auto_300194 ) ) ( not ( = ?auto_300193 ?auto_300195 ) ) ( not ( = ?auto_300193 ?auto_300196 ) ) ( not ( = ?auto_300193 ?auto_300197 ) ) ( not ( = ?auto_300193 ?auto_300198 ) ) ( not ( = ?auto_300193 ?auto_300199 ) ) ( not ( = ?auto_300193 ?auto_300200 ) ) ( not ( = ?auto_300193 ?auto_300201 ) ) ( not ( = ?auto_300194 ?auto_300195 ) ) ( not ( = ?auto_300194 ?auto_300196 ) ) ( not ( = ?auto_300194 ?auto_300197 ) ) ( not ( = ?auto_300194 ?auto_300198 ) ) ( not ( = ?auto_300194 ?auto_300199 ) ) ( not ( = ?auto_300194 ?auto_300200 ) ) ( not ( = ?auto_300194 ?auto_300201 ) ) ( not ( = ?auto_300195 ?auto_300196 ) ) ( not ( = ?auto_300195 ?auto_300197 ) ) ( not ( = ?auto_300195 ?auto_300198 ) ) ( not ( = ?auto_300195 ?auto_300199 ) ) ( not ( = ?auto_300195 ?auto_300200 ) ) ( not ( = ?auto_300195 ?auto_300201 ) ) ( not ( = ?auto_300196 ?auto_300197 ) ) ( not ( = ?auto_300196 ?auto_300198 ) ) ( not ( = ?auto_300196 ?auto_300199 ) ) ( not ( = ?auto_300196 ?auto_300200 ) ) ( not ( = ?auto_300196 ?auto_300201 ) ) ( not ( = ?auto_300197 ?auto_300198 ) ) ( not ( = ?auto_300197 ?auto_300199 ) ) ( not ( = ?auto_300197 ?auto_300200 ) ) ( not ( = ?auto_300197 ?auto_300201 ) ) ( not ( = ?auto_300198 ?auto_300199 ) ) ( not ( = ?auto_300198 ?auto_300200 ) ) ( not ( = ?auto_300198 ?auto_300201 ) ) ( not ( = ?auto_300199 ?auto_300200 ) ) ( not ( = ?auto_300199 ?auto_300201 ) ) ( not ( = ?auto_300200 ?auto_300201 ) ) ( ON ?auto_300200 ?auto_300201 ) ( ON ?auto_300199 ?auto_300200 ) ( ON ?auto_300198 ?auto_300199 ) ( ON ?auto_300197 ?auto_300198 ) ( ON ?auto_300196 ?auto_300197 ) ( CLEAR ?auto_300194 ) ( ON ?auto_300195 ?auto_300196 ) ( CLEAR ?auto_300195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_300188 ?auto_300189 ?auto_300190 ?auto_300191 ?auto_300192 ?auto_300193 ?auto_300194 ?auto_300195 )
      ( MAKE-14PILE ?auto_300188 ?auto_300189 ?auto_300190 ?auto_300191 ?auto_300192 ?auto_300193 ?auto_300194 ?auto_300195 ?auto_300196 ?auto_300197 ?auto_300198 ?auto_300199 ?auto_300200 ?auto_300201 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_300216 - BLOCK
      ?auto_300217 - BLOCK
      ?auto_300218 - BLOCK
      ?auto_300219 - BLOCK
      ?auto_300220 - BLOCK
      ?auto_300221 - BLOCK
      ?auto_300222 - BLOCK
      ?auto_300223 - BLOCK
      ?auto_300224 - BLOCK
      ?auto_300225 - BLOCK
      ?auto_300226 - BLOCK
      ?auto_300227 - BLOCK
      ?auto_300228 - BLOCK
      ?auto_300229 - BLOCK
    )
    :vars
    (
      ?auto_300230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_300229 ?auto_300230 ) ( ON-TABLE ?auto_300216 ) ( ON ?auto_300217 ?auto_300216 ) ( ON ?auto_300218 ?auto_300217 ) ( ON ?auto_300219 ?auto_300218 ) ( ON ?auto_300220 ?auto_300219 ) ( ON ?auto_300221 ?auto_300220 ) ( not ( = ?auto_300216 ?auto_300217 ) ) ( not ( = ?auto_300216 ?auto_300218 ) ) ( not ( = ?auto_300216 ?auto_300219 ) ) ( not ( = ?auto_300216 ?auto_300220 ) ) ( not ( = ?auto_300216 ?auto_300221 ) ) ( not ( = ?auto_300216 ?auto_300222 ) ) ( not ( = ?auto_300216 ?auto_300223 ) ) ( not ( = ?auto_300216 ?auto_300224 ) ) ( not ( = ?auto_300216 ?auto_300225 ) ) ( not ( = ?auto_300216 ?auto_300226 ) ) ( not ( = ?auto_300216 ?auto_300227 ) ) ( not ( = ?auto_300216 ?auto_300228 ) ) ( not ( = ?auto_300216 ?auto_300229 ) ) ( not ( = ?auto_300216 ?auto_300230 ) ) ( not ( = ?auto_300217 ?auto_300218 ) ) ( not ( = ?auto_300217 ?auto_300219 ) ) ( not ( = ?auto_300217 ?auto_300220 ) ) ( not ( = ?auto_300217 ?auto_300221 ) ) ( not ( = ?auto_300217 ?auto_300222 ) ) ( not ( = ?auto_300217 ?auto_300223 ) ) ( not ( = ?auto_300217 ?auto_300224 ) ) ( not ( = ?auto_300217 ?auto_300225 ) ) ( not ( = ?auto_300217 ?auto_300226 ) ) ( not ( = ?auto_300217 ?auto_300227 ) ) ( not ( = ?auto_300217 ?auto_300228 ) ) ( not ( = ?auto_300217 ?auto_300229 ) ) ( not ( = ?auto_300217 ?auto_300230 ) ) ( not ( = ?auto_300218 ?auto_300219 ) ) ( not ( = ?auto_300218 ?auto_300220 ) ) ( not ( = ?auto_300218 ?auto_300221 ) ) ( not ( = ?auto_300218 ?auto_300222 ) ) ( not ( = ?auto_300218 ?auto_300223 ) ) ( not ( = ?auto_300218 ?auto_300224 ) ) ( not ( = ?auto_300218 ?auto_300225 ) ) ( not ( = ?auto_300218 ?auto_300226 ) ) ( not ( = ?auto_300218 ?auto_300227 ) ) ( not ( = ?auto_300218 ?auto_300228 ) ) ( not ( = ?auto_300218 ?auto_300229 ) ) ( not ( = ?auto_300218 ?auto_300230 ) ) ( not ( = ?auto_300219 ?auto_300220 ) ) ( not ( = ?auto_300219 ?auto_300221 ) ) ( not ( = ?auto_300219 ?auto_300222 ) ) ( not ( = ?auto_300219 ?auto_300223 ) ) ( not ( = ?auto_300219 ?auto_300224 ) ) ( not ( = ?auto_300219 ?auto_300225 ) ) ( not ( = ?auto_300219 ?auto_300226 ) ) ( not ( = ?auto_300219 ?auto_300227 ) ) ( not ( = ?auto_300219 ?auto_300228 ) ) ( not ( = ?auto_300219 ?auto_300229 ) ) ( not ( = ?auto_300219 ?auto_300230 ) ) ( not ( = ?auto_300220 ?auto_300221 ) ) ( not ( = ?auto_300220 ?auto_300222 ) ) ( not ( = ?auto_300220 ?auto_300223 ) ) ( not ( = ?auto_300220 ?auto_300224 ) ) ( not ( = ?auto_300220 ?auto_300225 ) ) ( not ( = ?auto_300220 ?auto_300226 ) ) ( not ( = ?auto_300220 ?auto_300227 ) ) ( not ( = ?auto_300220 ?auto_300228 ) ) ( not ( = ?auto_300220 ?auto_300229 ) ) ( not ( = ?auto_300220 ?auto_300230 ) ) ( not ( = ?auto_300221 ?auto_300222 ) ) ( not ( = ?auto_300221 ?auto_300223 ) ) ( not ( = ?auto_300221 ?auto_300224 ) ) ( not ( = ?auto_300221 ?auto_300225 ) ) ( not ( = ?auto_300221 ?auto_300226 ) ) ( not ( = ?auto_300221 ?auto_300227 ) ) ( not ( = ?auto_300221 ?auto_300228 ) ) ( not ( = ?auto_300221 ?auto_300229 ) ) ( not ( = ?auto_300221 ?auto_300230 ) ) ( not ( = ?auto_300222 ?auto_300223 ) ) ( not ( = ?auto_300222 ?auto_300224 ) ) ( not ( = ?auto_300222 ?auto_300225 ) ) ( not ( = ?auto_300222 ?auto_300226 ) ) ( not ( = ?auto_300222 ?auto_300227 ) ) ( not ( = ?auto_300222 ?auto_300228 ) ) ( not ( = ?auto_300222 ?auto_300229 ) ) ( not ( = ?auto_300222 ?auto_300230 ) ) ( not ( = ?auto_300223 ?auto_300224 ) ) ( not ( = ?auto_300223 ?auto_300225 ) ) ( not ( = ?auto_300223 ?auto_300226 ) ) ( not ( = ?auto_300223 ?auto_300227 ) ) ( not ( = ?auto_300223 ?auto_300228 ) ) ( not ( = ?auto_300223 ?auto_300229 ) ) ( not ( = ?auto_300223 ?auto_300230 ) ) ( not ( = ?auto_300224 ?auto_300225 ) ) ( not ( = ?auto_300224 ?auto_300226 ) ) ( not ( = ?auto_300224 ?auto_300227 ) ) ( not ( = ?auto_300224 ?auto_300228 ) ) ( not ( = ?auto_300224 ?auto_300229 ) ) ( not ( = ?auto_300224 ?auto_300230 ) ) ( not ( = ?auto_300225 ?auto_300226 ) ) ( not ( = ?auto_300225 ?auto_300227 ) ) ( not ( = ?auto_300225 ?auto_300228 ) ) ( not ( = ?auto_300225 ?auto_300229 ) ) ( not ( = ?auto_300225 ?auto_300230 ) ) ( not ( = ?auto_300226 ?auto_300227 ) ) ( not ( = ?auto_300226 ?auto_300228 ) ) ( not ( = ?auto_300226 ?auto_300229 ) ) ( not ( = ?auto_300226 ?auto_300230 ) ) ( not ( = ?auto_300227 ?auto_300228 ) ) ( not ( = ?auto_300227 ?auto_300229 ) ) ( not ( = ?auto_300227 ?auto_300230 ) ) ( not ( = ?auto_300228 ?auto_300229 ) ) ( not ( = ?auto_300228 ?auto_300230 ) ) ( not ( = ?auto_300229 ?auto_300230 ) ) ( ON ?auto_300228 ?auto_300229 ) ( ON ?auto_300227 ?auto_300228 ) ( ON ?auto_300226 ?auto_300227 ) ( ON ?auto_300225 ?auto_300226 ) ( ON ?auto_300224 ?auto_300225 ) ( ON ?auto_300223 ?auto_300224 ) ( CLEAR ?auto_300221 ) ( ON ?auto_300222 ?auto_300223 ) ( CLEAR ?auto_300222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_300216 ?auto_300217 ?auto_300218 ?auto_300219 ?auto_300220 ?auto_300221 ?auto_300222 )
      ( MAKE-14PILE ?auto_300216 ?auto_300217 ?auto_300218 ?auto_300219 ?auto_300220 ?auto_300221 ?auto_300222 ?auto_300223 ?auto_300224 ?auto_300225 ?auto_300226 ?auto_300227 ?auto_300228 ?auto_300229 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_300245 - BLOCK
      ?auto_300246 - BLOCK
      ?auto_300247 - BLOCK
      ?auto_300248 - BLOCK
      ?auto_300249 - BLOCK
      ?auto_300250 - BLOCK
      ?auto_300251 - BLOCK
      ?auto_300252 - BLOCK
      ?auto_300253 - BLOCK
      ?auto_300254 - BLOCK
      ?auto_300255 - BLOCK
      ?auto_300256 - BLOCK
      ?auto_300257 - BLOCK
      ?auto_300258 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_300258 ) ( ON-TABLE ?auto_300245 ) ( ON ?auto_300246 ?auto_300245 ) ( ON ?auto_300247 ?auto_300246 ) ( ON ?auto_300248 ?auto_300247 ) ( ON ?auto_300249 ?auto_300248 ) ( ON ?auto_300250 ?auto_300249 ) ( not ( = ?auto_300245 ?auto_300246 ) ) ( not ( = ?auto_300245 ?auto_300247 ) ) ( not ( = ?auto_300245 ?auto_300248 ) ) ( not ( = ?auto_300245 ?auto_300249 ) ) ( not ( = ?auto_300245 ?auto_300250 ) ) ( not ( = ?auto_300245 ?auto_300251 ) ) ( not ( = ?auto_300245 ?auto_300252 ) ) ( not ( = ?auto_300245 ?auto_300253 ) ) ( not ( = ?auto_300245 ?auto_300254 ) ) ( not ( = ?auto_300245 ?auto_300255 ) ) ( not ( = ?auto_300245 ?auto_300256 ) ) ( not ( = ?auto_300245 ?auto_300257 ) ) ( not ( = ?auto_300245 ?auto_300258 ) ) ( not ( = ?auto_300246 ?auto_300247 ) ) ( not ( = ?auto_300246 ?auto_300248 ) ) ( not ( = ?auto_300246 ?auto_300249 ) ) ( not ( = ?auto_300246 ?auto_300250 ) ) ( not ( = ?auto_300246 ?auto_300251 ) ) ( not ( = ?auto_300246 ?auto_300252 ) ) ( not ( = ?auto_300246 ?auto_300253 ) ) ( not ( = ?auto_300246 ?auto_300254 ) ) ( not ( = ?auto_300246 ?auto_300255 ) ) ( not ( = ?auto_300246 ?auto_300256 ) ) ( not ( = ?auto_300246 ?auto_300257 ) ) ( not ( = ?auto_300246 ?auto_300258 ) ) ( not ( = ?auto_300247 ?auto_300248 ) ) ( not ( = ?auto_300247 ?auto_300249 ) ) ( not ( = ?auto_300247 ?auto_300250 ) ) ( not ( = ?auto_300247 ?auto_300251 ) ) ( not ( = ?auto_300247 ?auto_300252 ) ) ( not ( = ?auto_300247 ?auto_300253 ) ) ( not ( = ?auto_300247 ?auto_300254 ) ) ( not ( = ?auto_300247 ?auto_300255 ) ) ( not ( = ?auto_300247 ?auto_300256 ) ) ( not ( = ?auto_300247 ?auto_300257 ) ) ( not ( = ?auto_300247 ?auto_300258 ) ) ( not ( = ?auto_300248 ?auto_300249 ) ) ( not ( = ?auto_300248 ?auto_300250 ) ) ( not ( = ?auto_300248 ?auto_300251 ) ) ( not ( = ?auto_300248 ?auto_300252 ) ) ( not ( = ?auto_300248 ?auto_300253 ) ) ( not ( = ?auto_300248 ?auto_300254 ) ) ( not ( = ?auto_300248 ?auto_300255 ) ) ( not ( = ?auto_300248 ?auto_300256 ) ) ( not ( = ?auto_300248 ?auto_300257 ) ) ( not ( = ?auto_300248 ?auto_300258 ) ) ( not ( = ?auto_300249 ?auto_300250 ) ) ( not ( = ?auto_300249 ?auto_300251 ) ) ( not ( = ?auto_300249 ?auto_300252 ) ) ( not ( = ?auto_300249 ?auto_300253 ) ) ( not ( = ?auto_300249 ?auto_300254 ) ) ( not ( = ?auto_300249 ?auto_300255 ) ) ( not ( = ?auto_300249 ?auto_300256 ) ) ( not ( = ?auto_300249 ?auto_300257 ) ) ( not ( = ?auto_300249 ?auto_300258 ) ) ( not ( = ?auto_300250 ?auto_300251 ) ) ( not ( = ?auto_300250 ?auto_300252 ) ) ( not ( = ?auto_300250 ?auto_300253 ) ) ( not ( = ?auto_300250 ?auto_300254 ) ) ( not ( = ?auto_300250 ?auto_300255 ) ) ( not ( = ?auto_300250 ?auto_300256 ) ) ( not ( = ?auto_300250 ?auto_300257 ) ) ( not ( = ?auto_300250 ?auto_300258 ) ) ( not ( = ?auto_300251 ?auto_300252 ) ) ( not ( = ?auto_300251 ?auto_300253 ) ) ( not ( = ?auto_300251 ?auto_300254 ) ) ( not ( = ?auto_300251 ?auto_300255 ) ) ( not ( = ?auto_300251 ?auto_300256 ) ) ( not ( = ?auto_300251 ?auto_300257 ) ) ( not ( = ?auto_300251 ?auto_300258 ) ) ( not ( = ?auto_300252 ?auto_300253 ) ) ( not ( = ?auto_300252 ?auto_300254 ) ) ( not ( = ?auto_300252 ?auto_300255 ) ) ( not ( = ?auto_300252 ?auto_300256 ) ) ( not ( = ?auto_300252 ?auto_300257 ) ) ( not ( = ?auto_300252 ?auto_300258 ) ) ( not ( = ?auto_300253 ?auto_300254 ) ) ( not ( = ?auto_300253 ?auto_300255 ) ) ( not ( = ?auto_300253 ?auto_300256 ) ) ( not ( = ?auto_300253 ?auto_300257 ) ) ( not ( = ?auto_300253 ?auto_300258 ) ) ( not ( = ?auto_300254 ?auto_300255 ) ) ( not ( = ?auto_300254 ?auto_300256 ) ) ( not ( = ?auto_300254 ?auto_300257 ) ) ( not ( = ?auto_300254 ?auto_300258 ) ) ( not ( = ?auto_300255 ?auto_300256 ) ) ( not ( = ?auto_300255 ?auto_300257 ) ) ( not ( = ?auto_300255 ?auto_300258 ) ) ( not ( = ?auto_300256 ?auto_300257 ) ) ( not ( = ?auto_300256 ?auto_300258 ) ) ( not ( = ?auto_300257 ?auto_300258 ) ) ( ON ?auto_300257 ?auto_300258 ) ( ON ?auto_300256 ?auto_300257 ) ( ON ?auto_300255 ?auto_300256 ) ( ON ?auto_300254 ?auto_300255 ) ( ON ?auto_300253 ?auto_300254 ) ( ON ?auto_300252 ?auto_300253 ) ( CLEAR ?auto_300250 ) ( ON ?auto_300251 ?auto_300252 ) ( CLEAR ?auto_300251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_300245 ?auto_300246 ?auto_300247 ?auto_300248 ?auto_300249 ?auto_300250 ?auto_300251 )
      ( MAKE-14PILE ?auto_300245 ?auto_300246 ?auto_300247 ?auto_300248 ?auto_300249 ?auto_300250 ?auto_300251 ?auto_300252 ?auto_300253 ?auto_300254 ?auto_300255 ?auto_300256 ?auto_300257 ?auto_300258 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_300273 - BLOCK
      ?auto_300274 - BLOCK
      ?auto_300275 - BLOCK
      ?auto_300276 - BLOCK
      ?auto_300277 - BLOCK
      ?auto_300278 - BLOCK
      ?auto_300279 - BLOCK
      ?auto_300280 - BLOCK
      ?auto_300281 - BLOCK
      ?auto_300282 - BLOCK
      ?auto_300283 - BLOCK
      ?auto_300284 - BLOCK
      ?auto_300285 - BLOCK
      ?auto_300286 - BLOCK
    )
    :vars
    (
      ?auto_300287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_300286 ?auto_300287 ) ( ON-TABLE ?auto_300273 ) ( ON ?auto_300274 ?auto_300273 ) ( ON ?auto_300275 ?auto_300274 ) ( ON ?auto_300276 ?auto_300275 ) ( ON ?auto_300277 ?auto_300276 ) ( not ( = ?auto_300273 ?auto_300274 ) ) ( not ( = ?auto_300273 ?auto_300275 ) ) ( not ( = ?auto_300273 ?auto_300276 ) ) ( not ( = ?auto_300273 ?auto_300277 ) ) ( not ( = ?auto_300273 ?auto_300278 ) ) ( not ( = ?auto_300273 ?auto_300279 ) ) ( not ( = ?auto_300273 ?auto_300280 ) ) ( not ( = ?auto_300273 ?auto_300281 ) ) ( not ( = ?auto_300273 ?auto_300282 ) ) ( not ( = ?auto_300273 ?auto_300283 ) ) ( not ( = ?auto_300273 ?auto_300284 ) ) ( not ( = ?auto_300273 ?auto_300285 ) ) ( not ( = ?auto_300273 ?auto_300286 ) ) ( not ( = ?auto_300273 ?auto_300287 ) ) ( not ( = ?auto_300274 ?auto_300275 ) ) ( not ( = ?auto_300274 ?auto_300276 ) ) ( not ( = ?auto_300274 ?auto_300277 ) ) ( not ( = ?auto_300274 ?auto_300278 ) ) ( not ( = ?auto_300274 ?auto_300279 ) ) ( not ( = ?auto_300274 ?auto_300280 ) ) ( not ( = ?auto_300274 ?auto_300281 ) ) ( not ( = ?auto_300274 ?auto_300282 ) ) ( not ( = ?auto_300274 ?auto_300283 ) ) ( not ( = ?auto_300274 ?auto_300284 ) ) ( not ( = ?auto_300274 ?auto_300285 ) ) ( not ( = ?auto_300274 ?auto_300286 ) ) ( not ( = ?auto_300274 ?auto_300287 ) ) ( not ( = ?auto_300275 ?auto_300276 ) ) ( not ( = ?auto_300275 ?auto_300277 ) ) ( not ( = ?auto_300275 ?auto_300278 ) ) ( not ( = ?auto_300275 ?auto_300279 ) ) ( not ( = ?auto_300275 ?auto_300280 ) ) ( not ( = ?auto_300275 ?auto_300281 ) ) ( not ( = ?auto_300275 ?auto_300282 ) ) ( not ( = ?auto_300275 ?auto_300283 ) ) ( not ( = ?auto_300275 ?auto_300284 ) ) ( not ( = ?auto_300275 ?auto_300285 ) ) ( not ( = ?auto_300275 ?auto_300286 ) ) ( not ( = ?auto_300275 ?auto_300287 ) ) ( not ( = ?auto_300276 ?auto_300277 ) ) ( not ( = ?auto_300276 ?auto_300278 ) ) ( not ( = ?auto_300276 ?auto_300279 ) ) ( not ( = ?auto_300276 ?auto_300280 ) ) ( not ( = ?auto_300276 ?auto_300281 ) ) ( not ( = ?auto_300276 ?auto_300282 ) ) ( not ( = ?auto_300276 ?auto_300283 ) ) ( not ( = ?auto_300276 ?auto_300284 ) ) ( not ( = ?auto_300276 ?auto_300285 ) ) ( not ( = ?auto_300276 ?auto_300286 ) ) ( not ( = ?auto_300276 ?auto_300287 ) ) ( not ( = ?auto_300277 ?auto_300278 ) ) ( not ( = ?auto_300277 ?auto_300279 ) ) ( not ( = ?auto_300277 ?auto_300280 ) ) ( not ( = ?auto_300277 ?auto_300281 ) ) ( not ( = ?auto_300277 ?auto_300282 ) ) ( not ( = ?auto_300277 ?auto_300283 ) ) ( not ( = ?auto_300277 ?auto_300284 ) ) ( not ( = ?auto_300277 ?auto_300285 ) ) ( not ( = ?auto_300277 ?auto_300286 ) ) ( not ( = ?auto_300277 ?auto_300287 ) ) ( not ( = ?auto_300278 ?auto_300279 ) ) ( not ( = ?auto_300278 ?auto_300280 ) ) ( not ( = ?auto_300278 ?auto_300281 ) ) ( not ( = ?auto_300278 ?auto_300282 ) ) ( not ( = ?auto_300278 ?auto_300283 ) ) ( not ( = ?auto_300278 ?auto_300284 ) ) ( not ( = ?auto_300278 ?auto_300285 ) ) ( not ( = ?auto_300278 ?auto_300286 ) ) ( not ( = ?auto_300278 ?auto_300287 ) ) ( not ( = ?auto_300279 ?auto_300280 ) ) ( not ( = ?auto_300279 ?auto_300281 ) ) ( not ( = ?auto_300279 ?auto_300282 ) ) ( not ( = ?auto_300279 ?auto_300283 ) ) ( not ( = ?auto_300279 ?auto_300284 ) ) ( not ( = ?auto_300279 ?auto_300285 ) ) ( not ( = ?auto_300279 ?auto_300286 ) ) ( not ( = ?auto_300279 ?auto_300287 ) ) ( not ( = ?auto_300280 ?auto_300281 ) ) ( not ( = ?auto_300280 ?auto_300282 ) ) ( not ( = ?auto_300280 ?auto_300283 ) ) ( not ( = ?auto_300280 ?auto_300284 ) ) ( not ( = ?auto_300280 ?auto_300285 ) ) ( not ( = ?auto_300280 ?auto_300286 ) ) ( not ( = ?auto_300280 ?auto_300287 ) ) ( not ( = ?auto_300281 ?auto_300282 ) ) ( not ( = ?auto_300281 ?auto_300283 ) ) ( not ( = ?auto_300281 ?auto_300284 ) ) ( not ( = ?auto_300281 ?auto_300285 ) ) ( not ( = ?auto_300281 ?auto_300286 ) ) ( not ( = ?auto_300281 ?auto_300287 ) ) ( not ( = ?auto_300282 ?auto_300283 ) ) ( not ( = ?auto_300282 ?auto_300284 ) ) ( not ( = ?auto_300282 ?auto_300285 ) ) ( not ( = ?auto_300282 ?auto_300286 ) ) ( not ( = ?auto_300282 ?auto_300287 ) ) ( not ( = ?auto_300283 ?auto_300284 ) ) ( not ( = ?auto_300283 ?auto_300285 ) ) ( not ( = ?auto_300283 ?auto_300286 ) ) ( not ( = ?auto_300283 ?auto_300287 ) ) ( not ( = ?auto_300284 ?auto_300285 ) ) ( not ( = ?auto_300284 ?auto_300286 ) ) ( not ( = ?auto_300284 ?auto_300287 ) ) ( not ( = ?auto_300285 ?auto_300286 ) ) ( not ( = ?auto_300285 ?auto_300287 ) ) ( not ( = ?auto_300286 ?auto_300287 ) ) ( ON ?auto_300285 ?auto_300286 ) ( ON ?auto_300284 ?auto_300285 ) ( ON ?auto_300283 ?auto_300284 ) ( ON ?auto_300282 ?auto_300283 ) ( ON ?auto_300281 ?auto_300282 ) ( ON ?auto_300280 ?auto_300281 ) ( ON ?auto_300279 ?auto_300280 ) ( CLEAR ?auto_300277 ) ( ON ?auto_300278 ?auto_300279 ) ( CLEAR ?auto_300278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_300273 ?auto_300274 ?auto_300275 ?auto_300276 ?auto_300277 ?auto_300278 )
      ( MAKE-14PILE ?auto_300273 ?auto_300274 ?auto_300275 ?auto_300276 ?auto_300277 ?auto_300278 ?auto_300279 ?auto_300280 ?auto_300281 ?auto_300282 ?auto_300283 ?auto_300284 ?auto_300285 ?auto_300286 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_300302 - BLOCK
      ?auto_300303 - BLOCK
      ?auto_300304 - BLOCK
      ?auto_300305 - BLOCK
      ?auto_300306 - BLOCK
      ?auto_300307 - BLOCK
      ?auto_300308 - BLOCK
      ?auto_300309 - BLOCK
      ?auto_300310 - BLOCK
      ?auto_300311 - BLOCK
      ?auto_300312 - BLOCK
      ?auto_300313 - BLOCK
      ?auto_300314 - BLOCK
      ?auto_300315 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_300315 ) ( ON-TABLE ?auto_300302 ) ( ON ?auto_300303 ?auto_300302 ) ( ON ?auto_300304 ?auto_300303 ) ( ON ?auto_300305 ?auto_300304 ) ( ON ?auto_300306 ?auto_300305 ) ( not ( = ?auto_300302 ?auto_300303 ) ) ( not ( = ?auto_300302 ?auto_300304 ) ) ( not ( = ?auto_300302 ?auto_300305 ) ) ( not ( = ?auto_300302 ?auto_300306 ) ) ( not ( = ?auto_300302 ?auto_300307 ) ) ( not ( = ?auto_300302 ?auto_300308 ) ) ( not ( = ?auto_300302 ?auto_300309 ) ) ( not ( = ?auto_300302 ?auto_300310 ) ) ( not ( = ?auto_300302 ?auto_300311 ) ) ( not ( = ?auto_300302 ?auto_300312 ) ) ( not ( = ?auto_300302 ?auto_300313 ) ) ( not ( = ?auto_300302 ?auto_300314 ) ) ( not ( = ?auto_300302 ?auto_300315 ) ) ( not ( = ?auto_300303 ?auto_300304 ) ) ( not ( = ?auto_300303 ?auto_300305 ) ) ( not ( = ?auto_300303 ?auto_300306 ) ) ( not ( = ?auto_300303 ?auto_300307 ) ) ( not ( = ?auto_300303 ?auto_300308 ) ) ( not ( = ?auto_300303 ?auto_300309 ) ) ( not ( = ?auto_300303 ?auto_300310 ) ) ( not ( = ?auto_300303 ?auto_300311 ) ) ( not ( = ?auto_300303 ?auto_300312 ) ) ( not ( = ?auto_300303 ?auto_300313 ) ) ( not ( = ?auto_300303 ?auto_300314 ) ) ( not ( = ?auto_300303 ?auto_300315 ) ) ( not ( = ?auto_300304 ?auto_300305 ) ) ( not ( = ?auto_300304 ?auto_300306 ) ) ( not ( = ?auto_300304 ?auto_300307 ) ) ( not ( = ?auto_300304 ?auto_300308 ) ) ( not ( = ?auto_300304 ?auto_300309 ) ) ( not ( = ?auto_300304 ?auto_300310 ) ) ( not ( = ?auto_300304 ?auto_300311 ) ) ( not ( = ?auto_300304 ?auto_300312 ) ) ( not ( = ?auto_300304 ?auto_300313 ) ) ( not ( = ?auto_300304 ?auto_300314 ) ) ( not ( = ?auto_300304 ?auto_300315 ) ) ( not ( = ?auto_300305 ?auto_300306 ) ) ( not ( = ?auto_300305 ?auto_300307 ) ) ( not ( = ?auto_300305 ?auto_300308 ) ) ( not ( = ?auto_300305 ?auto_300309 ) ) ( not ( = ?auto_300305 ?auto_300310 ) ) ( not ( = ?auto_300305 ?auto_300311 ) ) ( not ( = ?auto_300305 ?auto_300312 ) ) ( not ( = ?auto_300305 ?auto_300313 ) ) ( not ( = ?auto_300305 ?auto_300314 ) ) ( not ( = ?auto_300305 ?auto_300315 ) ) ( not ( = ?auto_300306 ?auto_300307 ) ) ( not ( = ?auto_300306 ?auto_300308 ) ) ( not ( = ?auto_300306 ?auto_300309 ) ) ( not ( = ?auto_300306 ?auto_300310 ) ) ( not ( = ?auto_300306 ?auto_300311 ) ) ( not ( = ?auto_300306 ?auto_300312 ) ) ( not ( = ?auto_300306 ?auto_300313 ) ) ( not ( = ?auto_300306 ?auto_300314 ) ) ( not ( = ?auto_300306 ?auto_300315 ) ) ( not ( = ?auto_300307 ?auto_300308 ) ) ( not ( = ?auto_300307 ?auto_300309 ) ) ( not ( = ?auto_300307 ?auto_300310 ) ) ( not ( = ?auto_300307 ?auto_300311 ) ) ( not ( = ?auto_300307 ?auto_300312 ) ) ( not ( = ?auto_300307 ?auto_300313 ) ) ( not ( = ?auto_300307 ?auto_300314 ) ) ( not ( = ?auto_300307 ?auto_300315 ) ) ( not ( = ?auto_300308 ?auto_300309 ) ) ( not ( = ?auto_300308 ?auto_300310 ) ) ( not ( = ?auto_300308 ?auto_300311 ) ) ( not ( = ?auto_300308 ?auto_300312 ) ) ( not ( = ?auto_300308 ?auto_300313 ) ) ( not ( = ?auto_300308 ?auto_300314 ) ) ( not ( = ?auto_300308 ?auto_300315 ) ) ( not ( = ?auto_300309 ?auto_300310 ) ) ( not ( = ?auto_300309 ?auto_300311 ) ) ( not ( = ?auto_300309 ?auto_300312 ) ) ( not ( = ?auto_300309 ?auto_300313 ) ) ( not ( = ?auto_300309 ?auto_300314 ) ) ( not ( = ?auto_300309 ?auto_300315 ) ) ( not ( = ?auto_300310 ?auto_300311 ) ) ( not ( = ?auto_300310 ?auto_300312 ) ) ( not ( = ?auto_300310 ?auto_300313 ) ) ( not ( = ?auto_300310 ?auto_300314 ) ) ( not ( = ?auto_300310 ?auto_300315 ) ) ( not ( = ?auto_300311 ?auto_300312 ) ) ( not ( = ?auto_300311 ?auto_300313 ) ) ( not ( = ?auto_300311 ?auto_300314 ) ) ( not ( = ?auto_300311 ?auto_300315 ) ) ( not ( = ?auto_300312 ?auto_300313 ) ) ( not ( = ?auto_300312 ?auto_300314 ) ) ( not ( = ?auto_300312 ?auto_300315 ) ) ( not ( = ?auto_300313 ?auto_300314 ) ) ( not ( = ?auto_300313 ?auto_300315 ) ) ( not ( = ?auto_300314 ?auto_300315 ) ) ( ON ?auto_300314 ?auto_300315 ) ( ON ?auto_300313 ?auto_300314 ) ( ON ?auto_300312 ?auto_300313 ) ( ON ?auto_300311 ?auto_300312 ) ( ON ?auto_300310 ?auto_300311 ) ( ON ?auto_300309 ?auto_300310 ) ( ON ?auto_300308 ?auto_300309 ) ( CLEAR ?auto_300306 ) ( ON ?auto_300307 ?auto_300308 ) ( CLEAR ?auto_300307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_300302 ?auto_300303 ?auto_300304 ?auto_300305 ?auto_300306 ?auto_300307 )
      ( MAKE-14PILE ?auto_300302 ?auto_300303 ?auto_300304 ?auto_300305 ?auto_300306 ?auto_300307 ?auto_300308 ?auto_300309 ?auto_300310 ?auto_300311 ?auto_300312 ?auto_300313 ?auto_300314 ?auto_300315 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_300330 - BLOCK
      ?auto_300331 - BLOCK
      ?auto_300332 - BLOCK
      ?auto_300333 - BLOCK
      ?auto_300334 - BLOCK
      ?auto_300335 - BLOCK
      ?auto_300336 - BLOCK
      ?auto_300337 - BLOCK
      ?auto_300338 - BLOCK
      ?auto_300339 - BLOCK
      ?auto_300340 - BLOCK
      ?auto_300341 - BLOCK
      ?auto_300342 - BLOCK
      ?auto_300343 - BLOCK
    )
    :vars
    (
      ?auto_300344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_300343 ?auto_300344 ) ( ON-TABLE ?auto_300330 ) ( ON ?auto_300331 ?auto_300330 ) ( ON ?auto_300332 ?auto_300331 ) ( ON ?auto_300333 ?auto_300332 ) ( not ( = ?auto_300330 ?auto_300331 ) ) ( not ( = ?auto_300330 ?auto_300332 ) ) ( not ( = ?auto_300330 ?auto_300333 ) ) ( not ( = ?auto_300330 ?auto_300334 ) ) ( not ( = ?auto_300330 ?auto_300335 ) ) ( not ( = ?auto_300330 ?auto_300336 ) ) ( not ( = ?auto_300330 ?auto_300337 ) ) ( not ( = ?auto_300330 ?auto_300338 ) ) ( not ( = ?auto_300330 ?auto_300339 ) ) ( not ( = ?auto_300330 ?auto_300340 ) ) ( not ( = ?auto_300330 ?auto_300341 ) ) ( not ( = ?auto_300330 ?auto_300342 ) ) ( not ( = ?auto_300330 ?auto_300343 ) ) ( not ( = ?auto_300330 ?auto_300344 ) ) ( not ( = ?auto_300331 ?auto_300332 ) ) ( not ( = ?auto_300331 ?auto_300333 ) ) ( not ( = ?auto_300331 ?auto_300334 ) ) ( not ( = ?auto_300331 ?auto_300335 ) ) ( not ( = ?auto_300331 ?auto_300336 ) ) ( not ( = ?auto_300331 ?auto_300337 ) ) ( not ( = ?auto_300331 ?auto_300338 ) ) ( not ( = ?auto_300331 ?auto_300339 ) ) ( not ( = ?auto_300331 ?auto_300340 ) ) ( not ( = ?auto_300331 ?auto_300341 ) ) ( not ( = ?auto_300331 ?auto_300342 ) ) ( not ( = ?auto_300331 ?auto_300343 ) ) ( not ( = ?auto_300331 ?auto_300344 ) ) ( not ( = ?auto_300332 ?auto_300333 ) ) ( not ( = ?auto_300332 ?auto_300334 ) ) ( not ( = ?auto_300332 ?auto_300335 ) ) ( not ( = ?auto_300332 ?auto_300336 ) ) ( not ( = ?auto_300332 ?auto_300337 ) ) ( not ( = ?auto_300332 ?auto_300338 ) ) ( not ( = ?auto_300332 ?auto_300339 ) ) ( not ( = ?auto_300332 ?auto_300340 ) ) ( not ( = ?auto_300332 ?auto_300341 ) ) ( not ( = ?auto_300332 ?auto_300342 ) ) ( not ( = ?auto_300332 ?auto_300343 ) ) ( not ( = ?auto_300332 ?auto_300344 ) ) ( not ( = ?auto_300333 ?auto_300334 ) ) ( not ( = ?auto_300333 ?auto_300335 ) ) ( not ( = ?auto_300333 ?auto_300336 ) ) ( not ( = ?auto_300333 ?auto_300337 ) ) ( not ( = ?auto_300333 ?auto_300338 ) ) ( not ( = ?auto_300333 ?auto_300339 ) ) ( not ( = ?auto_300333 ?auto_300340 ) ) ( not ( = ?auto_300333 ?auto_300341 ) ) ( not ( = ?auto_300333 ?auto_300342 ) ) ( not ( = ?auto_300333 ?auto_300343 ) ) ( not ( = ?auto_300333 ?auto_300344 ) ) ( not ( = ?auto_300334 ?auto_300335 ) ) ( not ( = ?auto_300334 ?auto_300336 ) ) ( not ( = ?auto_300334 ?auto_300337 ) ) ( not ( = ?auto_300334 ?auto_300338 ) ) ( not ( = ?auto_300334 ?auto_300339 ) ) ( not ( = ?auto_300334 ?auto_300340 ) ) ( not ( = ?auto_300334 ?auto_300341 ) ) ( not ( = ?auto_300334 ?auto_300342 ) ) ( not ( = ?auto_300334 ?auto_300343 ) ) ( not ( = ?auto_300334 ?auto_300344 ) ) ( not ( = ?auto_300335 ?auto_300336 ) ) ( not ( = ?auto_300335 ?auto_300337 ) ) ( not ( = ?auto_300335 ?auto_300338 ) ) ( not ( = ?auto_300335 ?auto_300339 ) ) ( not ( = ?auto_300335 ?auto_300340 ) ) ( not ( = ?auto_300335 ?auto_300341 ) ) ( not ( = ?auto_300335 ?auto_300342 ) ) ( not ( = ?auto_300335 ?auto_300343 ) ) ( not ( = ?auto_300335 ?auto_300344 ) ) ( not ( = ?auto_300336 ?auto_300337 ) ) ( not ( = ?auto_300336 ?auto_300338 ) ) ( not ( = ?auto_300336 ?auto_300339 ) ) ( not ( = ?auto_300336 ?auto_300340 ) ) ( not ( = ?auto_300336 ?auto_300341 ) ) ( not ( = ?auto_300336 ?auto_300342 ) ) ( not ( = ?auto_300336 ?auto_300343 ) ) ( not ( = ?auto_300336 ?auto_300344 ) ) ( not ( = ?auto_300337 ?auto_300338 ) ) ( not ( = ?auto_300337 ?auto_300339 ) ) ( not ( = ?auto_300337 ?auto_300340 ) ) ( not ( = ?auto_300337 ?auto_300341 ) ) ( not ( = ?auto_300337 ?auto_300342 ) ) ( not ( = ?auto_300337 ?auto_300343 ) ) ( not ( = ?auto_300337 ?auto_300344 ) ) ( not ( = ?auto_300338 ?auto_300339 ) ) ( not ( = ?auto_300338 ?auto_300340 ) ) ( not ( = ?auto_300338 ?auto_300341 ) ) ( not ( = ?auto_300338 ?auto_300342 ) ) ( not ( = ?auto_300338 ?auto_300343 ) ) ( not ( = ?auto_300338 ?auto_300344 ) ) ( not ( = ?auto_300339 ?auto_300340 ) ) ( not ( = ?auto_300339 ?auto_300341 ) ) ( not ( = ?auto_300339 ?auto_300342 ) ) ( not ( = ?auto_300339 ?auto_300343 ) ) ( not ( = ?auto_300339 ?auto_300344 ) ) ( not ( = ?auto_300340 ?auto_300341 ) ) ( not ( = ?auto_300340 ?auto_300342 ) ) ( not ( = ?auto_300340 ?auto_300343 ) ) ( not ( = ?auto_300340 ?auto_300344 ) ) ( not ( = ?auto_300341 ?auto_300342 ) ) ( not ( = ?auto_300341 ?auto_300343 ) ) ( not ( = ?auto_300341 ?auto_300344 ) ) ( not ( = ?auto_300342 ?auto_300343 ) ) ( not ( = ?auto_300342 ?auto_300344 ) ) ( not ( = ?auto_300343 ?auto_300344 ) ) ( ON ?auto_300342 ?auto_300343 ) ( ON ?auto_300341 ?auto_300342 ) ( ON ?auto_300340 ?auto_300341 ) ( ON ?auto_300339 ?auto_300340 ) ( ON ?auto_300338 ?auto_300339 ) ( ON ?auto_300337 ?auto_300338 ) ( ON ?auto_300336 ?auto_300337 ) ( ON ?auto_300335 ?auto_300336 ) ( CLEAR ?auto_300333 ) ( ON ?auto_300334 ?auto_300335 ) ( CLEAR ?auto_300334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_300330 ?auto_300331 ?auto_300332 ?auto_300333 ?auto_300334 )
      ( MAKE-14PILE ?auto_300330 ?auto_300331 ?auto_300332 ?auto_300333 ?auto_300334 ?auto_300335 ?auto_300336 ?auto_300337 ?auto_300338 ?auto_300339 ?auto_300340 ?auto_300341 ?auto_300342 ?auto_300343 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_300359 - BLOCK
      ?auto_300360 - BLOCK
      ?auto_300361 - BLOCK
      ?auto_300362 - BLOCK
      ?auto_300363 - BLOCK
      ?auto_300364 - BLOCK
      ?auto_300365 - BLOCK
      ?auto_300366 - BLOCK
      ?auto_300367 - BLOCK
      ?auto_300368 - BLOCK
      ?auto_300369 - BLOCK
      ?auto_300370 - BLOCK
      ?auto_300371 - BLOCK
      ?auto_300372 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_300372 ) ( ON-TABLE ?auto_300359 ) ( ON ?auto_300360 ?auto_300359 ) ( ON ?auto_300361 ?auto_300360 ) ( ON ?auto_300362 ?auto_300361 ) ( not ( = ?auto_300359 ?auto_300360 ) ) ( not ( = ?auto_300359 ?auto_300361 ) ) ( not ( = ?auto_300359 ?auto_300362 ) ) ( not ( = ?auto_300359 ?auto_300363 ) ) ( not ( = ?auto_300359 ?auto_300364 ) ) ( not ( = ?auto_300359 ?auto_300365 ) ) ( not ( = ?auto_300359 ?auto_300366 ) ) ( not ( = ?auto_300359 ?auto_300367 ) ) ( not ( = ?auto_300359 ?auto_300368 ) ) ( not ( = ?auto_300359 ?auto_300369 ) ) ( not ( = ?auto_300359 ?auto_300370 ) ) ( not ( = ?auto_300359 ?auto_300371 ) ) ( not ( = ?auto_300359 ?auto_300372 ) ) ( not ( = ?auto_300360 ?auto_300361 ) ) ( not ( = ?auto_300360 ?auto_300362 ) ) ( not ( = ?auto_300360 ?auto_300363 ) ) ( not ( = ?auto_300360 ?auto_300364 ) ) ( not ( = ?auto_300360 ?auto_300365 ) ) ( not ( = ?auto_300360 ?auto_300366 ) ) ( not ( = ?auto_300360 ?auto_300367 ) ) ( not ( = ?auto_300360 ?auto_300368 ) ) ( not ( = ?auto_300360 ?auto_300369 ) ) ( not ( = ?auto_300360 ?auto_300370 ) ) ( not ( = ?auto_300360 ?auto_300371 ) ) ( not ( = ?auto_300360 ?auto_300372 ) ) ( not ( = ?auto_300361 ?auto_300362 ) ) ( not ( = ?auto_300361 ?auto_300363 ) ) ( not ( = ?auto_300361 ?auto_300364 ) ) ( not ( = ?auto_300361 ?auto_300365 ) ) ( not ( = ?auto_300361 ?auto_300366 ) ) ( not ( = ?auto_300361 ?auto_300367 ) ) ( not ( = ?auto_300361 ?auto_300368 ) ) ( not ( = ?auto_300361 ?auto_300369 ) ) ( not ( = ?auto_300361 ?auto_300370 ) ) ( not ( = ?auto_300361 ?auto_300371 ) ) ( not ( = ?auto_300361 ?auto_300372 ) ) ( not ( = ?auto_300362 ?auto_300363 ) ) ( not ( = ?auto_300362 ?auto_300364 ) ) ( not ( = ?auto_300362 ?auto_300365 ) ) ( not ( = ?auto_300362 ?auto_300366 ) ) ( not ( = ?auto_300362 ?auto_300367 ) ) ( not ( = ?auto_300362 ?auto_300368 ) ) ( not ( = ?auto_300362 ?auto_300369 ) ) ( not ( = ?auto_300362 ?auto_300370 ) ) ( not ( = ?auto_300362 ?auto_300371 ) ) ( not ( = ?auto_300362 ?auto_300372 ) ) ( not ( = ?auto_300363 ?auto_300364 ) ) ( not ( = ?auto_300363 ?auto_300365 ) ) ( not ( = ?auto_300363 ?auto_300366 ) ) ( not ( = ?auto_300363 ?auto_300367 ) ) ( not ( = ?auto_300363 ?auto_300368 ) ) ( not ( = ?auto_300363 ?auto_300369 ) ) ( not ( = ?auto_300363 ?auto_300370 ) ) ( not ( = ?auto_300363 ?auto_300371 ) ) ( not ( = ?auto_300363 ?auto_300372 ) ) ( not ( = ?auto_300364 ?auto_300365 ) ) ( not ( = ?auto_300364 ?auto_300366 ) ) ( not ( = ?auto_300364 ?auto_300367 ) ) ( not ( = ?auto_300364 ?auto_300368 ) ) ( not ( = ?auto_300364 ?auto_300369 ) ) ( not ( = ?auto_300364 ?auto_300370 ) ) ( not ( = ?auto_300364 ?auto_300371 ) ) ( not ( = ?auto_300364 ?auto_300372 ) ) ( not ( = ?auto_300365 ?auto_300366 ) ) ( not ( = ?auto_300365 ?auto_300367 ) ) ( not ( = ?auto_300365 ?auto_300368 ) ) ( not ( = ?auto_300365 ?auto_300369 ) ) ( not ( = ?auto_300365 ?auto_300370 ) ) ( not ( = ?auto_300365 ?auto_300371 ) ) ( not ( = ?auto_300365 ?auto_300372 ) ) ( not ( = ?auto_300366 ?auto_300367 ) ) ( not ( = ?auto_300366 ?auto_300368 ) ) ( not ( = ?auto_300366 ?auto_300369 ) ) ( not ( = ?auto_300366 ?auto_300370 ) ) ( not ( = ?auto_300366 ?auto_300371 ) ) ( not ( = ?auto_300366 ?auto_300372 ) ) ( not ( = ?auto_300367 ?auto_300368 ) ) ( not ( = ?auto_300367 ?auto_300369 ) ) ( not ( = ?auto_300367 ?auto_300370 ) ) ( not ( = ?auto_300367 ?auto_300371 ) ) ( not ( = ?auto_300367 ?auto_300372 ) ) ( not ( = ?auto_300368 ?auto_300369 ) ) ( not ( = ?auto_300368 ?auto_300370 ) ) ( not ( = ?auto_300368 ?auto_300371 ) ) ( not ( = ?auto_300368 ?auto_300372 ) ) ( not ( = ?auto_300369 ?auto_300370 ) ) ( not ( = ?auto_300369 ?auto_300371 ) ) ( not ( = ?auto_300369 ?auto_300372 ) ) ( not ( = ?auto_300370 ?auto_300371 ) ) ( not ( = ?auto_300370 ?auto_300372 ) ) ( not ( = ?auto_300371 ?auto_300372 ) ) ( ON ?auto_300371 ?auto_300372 ) ( ON ?auto_300370 ?auto_300371 ) ( ON ?auto_300369 ?auto_300370 ) ( ON ?auto_300368 ?auto_300369 ) ( ON ?auto_300367 ?auto_300368 ) ( ON ?auto_300366 ?auto_300367 ) ( ON ?auto_300365 ?auto_300366 ) ( ON ?auto_300364 ?auto_300365 ) ( CLEAR ?auto_300362 ) ( ON ?auto_300363 ?auto_300364 ) ( CLEAR ?auto_300363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_300359 ?auto_300360 ?auto_300361 ?auto_300362 ?auto_300363 )
      ( MAKE-14PILE ?auto_300359 ?auto_300360 ?auto_300361 ?auto_300362 ?auto_300363 ?auto_300364 ?auto_300365 ?auto_300366 ?auto_300367 ?auto_300368 ?auto_300369 ?auto_300370 ?auto_300371 ?auto_300372 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_300387 - BLOCK
      ?auto_300388 - BLOCK
      ?auto_300389 - BLOCK
      ?auto_300390 - BLOCK
      ?auto_300391 - BLOCK
      ?auto_300392 - BLOCK
      ?auto_300393 - BLOCK
      ?auto_300394 - BLOCK
      ?auto_300395 - BLOCK
      ?auto_300396 - BLOCK
      ?auto_300397 - BLOCK
      ?auto_300398 - BLOCK
      ?auto_300399 - BLOCK
      ?auto_300400 - BLOCK
    )
    :vars
    (
      ?auto_300401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_300400 ?auto_300401 ) ( ON-TABLE ?auto_300387 ) ( ON ?auto_300388 ?auto_300387 ) ( ON ?auto_300389 ?auto_300388 ) ( not ( = ?auto_300387 ?auto_300388 ) ) ( not ( = ?auto_300387 ?auto_300389 ) ) ( not ( = ?auto_300387 ?auto_300390 ) ) ( not ( = ?auto_300387 ?auto_300391 ) ) ( not ( = ?auto_300387 ?auto_300392 ) ) ( not ( = ?auto_300387 ?auto_300393 ) ) ( not ( = ?auto_300387 ?auto_300394 ) ) ( not ( = ?auto_300387 ?auto_300395 ) ) ( not ( = ?auto_300387 ?auto_300396 ) ) ( not ( = ?auto_300387 ?auto_300397 ) ) ( not ( = ?auto_300387 ?auto_300398 ) ) ( not ( = ?auto_300387 ?auto_300399 ) ) ( not ( = ?auto_300387 ?auto_300400 ) ) ( not ( = ?auto_300387 ?auto_300401 ) ) ( not ( = ?auto_300388 ?auto_300389 ) ) ( not ( = ?auto_300388 ?auto_300390 ) ) ( not ( = ?auto_300388 ?auto_300391 ) ) ( not ( = ?auto_300388 ?auto_300392 ) ) ( not ( = ?auto_300388 ?auto_300393 ) ) ( not ( = ?auto_300388 ?auto_300394 ) ) ( not ( = ?auto_300388 ?auto_300395 ) ) ( not ( = ?auto_300388 ?auto_300396 ) ) ( not ( = ?auto_300388 ?auto_300397 ) ) ( not ( = ?auto_300388 ?auto_300398 ) ) ( not ( = ?auto_300388 ?auto_300399 ) ) ( not ( = ?auto_300388 ?auto_300400 ) ) ( not ( = ?auto_300388 ?auto_300401 ) ) ( not ( = ?auto_300389 ?auto_300390 ) ) ( not ( = ?auto_300389 ?auto_300391 ) ) ( not ( = ?auto_300389 ?auto_300392 ) ) ( not ( = ?auto_300389 ?auto_300393 ) ) ( not ( = ?auto_300389 ?auto_300394 ) ) ( not ( = ?auto_300389 ?auto_300395 ) ) ( not ( = ?auto_300389 ?auto_300396 ) ) ( not ( = ?auto_300389 ?auto_300397 ) ) ( not ( = ?auto_300389 ?auto_300398 ) ) ( not ( = ?auto_300389 ?auto_300399 ) ) ( not ( = ?auto_300389 ?auto_300400 ) ) ( not ( = ?auto_300389 ?auto_300401 ) ) ( not ( = ?auto_300390 ?auto_300391 ) ) ( not ( = ?auto_300390 ?auto_300392 ) ) ( not ( = ?auto_300390 ?auto_300393 ) ) ( not ( = ?auto_300390 ?auto_300394 ) ) ( not ( = ?auto_300390 ?auto_300395 ) ) ( not ( = ?auto_300390 ?auto_300396 ) ) ( not ( = ?auto_300390 ?auto_300397 ) ) ( not ( = ?auto_300390 ?auto_300398 ) ) ( not ( = ?auto_300390 ?auto_300399 ) ) ( not ( = ?auto_300390 ?auto_300400 ) ) ( not ( = ?auto_300390 ?auto_300401 ) ) ( not ( = ?auto_300391 ?auto_300392 ) ) ( not ( = ?auto_300391 ?auto_300393 ) ) ( not ( = ?auto_300391 ?auto_300394 ) ) ( not ( = ?auto_300391 ?auto_300395 ) ) ( not ( = ?auto_300391 ?auto_300396 ) ) ( not ( = ?auto_300391 ?auto_300397 ) ) ( not ( = ?auto_300391 ?auto_300398 ) ) ( not ( = ?auto_300391 ?auto_300399 ) ) ( not ( = ?auto_300391 ?auto_300400 ) ) ( not ( = ?auto_300391 ?auto_300401 ) ) ( not ( = ?auto_300392 ?auto_300393 ) ) ( not ( = ?auto_300392 ?auto_300394 ) ) ( not ( = ?auto_300392 ?auto_300395 ) ) ( not ( = ?auto_300392 ?auto_300396 ) ) ( not ( = ?auto_300392 ?auto_300397 ) ) ( not ( = ?auto_300392 ?auto_300398 ) ) ( not ( = ?auto_300392 ?auto_300399 ) ) ( not ( = ?auto_300392 ?auto_300400 ) ) ( not ( = ?auto_300392 ?auto_300401 ) ) ( not ( = ?auto_300393 ?auto_300394 ) ) ( not ( = ?auto_300393 ?auto_300395 ) ) ( not ( = ?auto_300393 ?auto_300396 ) ) ( not ( = ?auto_300393 ?auto_300397 ) ) ( not ( = ?auto_300393 ?auto_300398 ) ) ( not ( = ?auto_300393 ?auto_300399 ) ) ( not ( = ?auto_300393 ?auto_300400 ) ) ( not ( = ?auto_300393 ?auto_300401 ) ) ( not ( = ?auto_300394 ?auto_300395 ) ) ( not ( = ?auto_300394 ?auto_300396 ) ) ( not ( = ?auto_300394 ?auto_300397 ) ) ( not ( = ?auto_300394 ?auto_300398 ) ) ( not ( = ?auto_300394 ?auto_300399 ) ) ( not ( = ?auto_300394 ?auto_300400 ) ) ( not ( = ?auto_300394 ?auto_300401 ) ) ( not ( = ?auto_300395 ?auto_300396 ) ) ( not ( = ?auto_300395 ?auto_300397 ) ) ( not ( = ?auto_300395 ?auto_300398 ) ) ( not ( = ?auto_300395 ?auto_300399 ) ) ( not ( = ?auto_300395 ?auto_300400 ) ) ( not ( = ?auto_300395 ?auto_300401 ) ) ( not ( = ?auto_300396 ?auto_300397 ) ) ( not ( = ?auto_300396 ?auto_300398 ) ) ( not ( = ?auto_300396 ?auto_300399 ) ) ( not ( = ?auto_300396 ?auto_300400 ) ) ( not ( = ?auto_300396 ?auto_300401 ) ) ( not ( = ?auto_300397 ?auto_300398 ) ) ( not ( = ?auto_300397 ?auto_300399 ) ) ( not ( = ?auto_300397 ?auto_300400 ) ) ( not ( = ?auto_300397 ?auto_300401 ) ) ( not ( = ?auto_300398 ?auto_300399 ) ) ( not ( = ?auto_300398 ?auto_300400 ) ) ( not ( = ?auto_300398 ?auto_300401 ) ) ( not ( = ?auto_300399 ?auto_300400 ) ) ( not ( = ?auto_300399 ?auto_300401 ) ) ( not ( = ?auto_300400 ?auto_300401 ) ) ( ON ?auto_300399 ?auto_300400 ) ( ON ?auto_300398 ?auto_300399 ) ( ON ?auto_300397 ?auto_300398 ) ( ON ?auto_300396 ?auto_300397 ) ( ON ?auto_300395 ?auto_300396 ) ( ON ?auto_300394 ?auto_300395 ) ( ON ?auto_300393 ?auto_300394 ) ( ON ?auto_300392 ?auto_300393 ) ( ON ?auto_300391 ?auto_300392 ) ( CLEAR ?auto_300389 ) ( ON ?auto_300390 ?auto_300391 ) ( CLEAR ?auto_300390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_300387 ?auto_300388 ?auto_300389 ?auto_300390 )
      ( MAKE-14PILE ?auto_300387 ?auto_300388 ?auto_300389 ?auto_300390 ?auto_300391 ?auto_300392 ?auto_300393 ?auto_300394 ?auto_300395 ?auto_300396 ?auto_300397 ?auto_300398 ?auto_300399 ?auto_300400 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_300416 - BLOCK
      ?auto_300417 - BLOCK
      ?auto_300418 - BLOCK
      ?auto_300419 - BLOCK
      ?auto_300420 - BLOCK
      ?auto_300421 - BLOCK
      ?auto_300422 - BLOCK
      ?auto_300423 - BLOCK
      ?auto_300424 - BLOCK
      ?auto_300425 - BLOCK
      ?auto_300426 - BLOCK
      ?auto_300427 - BLOCK
      ?auto_300428 - BLOCK
      ?auto_300429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_300429 ) ( ON-TABLE ?auto_300416 ) ( ON ?auto_300417 ?auto_300416 ) ( ON ?auto_300418 ?auto_300417 ) ( not ( = ?auto_300416 ?auto_300417 ) ) ( not ( = ?auto_300416 ?auto_300418 ) ) ( not ( = ?auto_300416 ?auto_300419 ) ) ( not ( = ?auto_300416 ?auto_300420 ) ) ( not ( = ?auto_300416 ?auto_300421 ) ) ( not ( = ?auto_300416 ?auto_300422 ) ) ( not ( = ?auto_300416 ?auto_300423 ) ) ( not ( = ?auto_300416 ?auto_300424 ) ) ( not ( = ?auto_300416 ?auto_300425 ) ) ( not ( = ?auto_300416 ?auto_300426 ) ) ( not ( = ?auto_300416 ?auto_300427 ) ) ( not ( = ?auto_300416 ?auto_300428 ) ) ( not ( = ?auto_300416 ?auto_300429 ) ) ( not ( = ?auto_300417 ?auto_300418 ) ) ( not ( = ?auto_300417 ?auto_300419 ) ) ( not ( = ?auto_300417 ?auto_300420 ) ) ( not ( = ?auto_300417 ?auto_300421 ) ) ( not ( = ?auto_300417 ?auto_300422 ) ) ( not ( = ?auto_300417 ?auto_300423 ) ) ( not ( = ?auto_300417 ?auto_300424 ) ) ( not ( = ?auto_300417 ?auto_300425 ) ) ( not ( = ?auto_300417 ?auto_300426 ) ) ( not ( = ?auto_300417 ?auto_300427 ) ) ( not ( = ?auto_300417 ?auto_300428 ) ) ( not ( = ?auto_300417 ?auto_300429 ) ) ( not ( = ?auto_300418 ?auto_300419 ) ) ( not ( = ?auto_300418 ?auto_300420 ) ) ( not ( = ?auto_300418 ?auto_300421 ) ) ( not ( = ?auto_300418 ?auto_300422 ) ) ( not ( = ?auto_300418 ?auto_300423 ) ) ( not ( = ?auto_300418 ?auto_300424 ) ) ( not ( = ?auto_300418 ?auto_300425 ) ) ( not ( = ?auto_300418 ?auto_300426 ) ) ( not ( = ?auto_300418 ?auto_300427 ) ) ( not ( = ?auto_300418 ?auto_300428 ) ) ( not ( = ?auto_300418 ?auto_300429 ) ) ( not ( = ?auto_300419 ?auto_300420 ) ) ( not ( = ?auto_300419 ?auto_300421 ) ) ( not ( = ?auto_300419 ?auto_300422 ) ) ( not ( = ?auto_300419 ?auto_300423 ) ) ( not ( = ?auto_300419 ?auto_300424 ) ) ( not ( = ?auto_300419 ?auto_300425 ) ) ( not ( = ?auto_300419 ?auto_300426 ) ) ( not ( = ?auto_300419 ?auto_300427 ) ) ( not ( = ?auto_300419 ?auto_300428 ) ) ( not ( = ?auto_300419 ?auto_300429 ) ) ( not ( = ?auto_300420 ?auto_300421 ) ) ( not ( = ?auto_300420 ?auto_300422 ) ) ( not ( = ?auto_300420 ?auto_300423 ) ) ( not ( = ?auto_300420 ?auto_300424 ) ) ( not ( = ?auto_300420 ?auto_300425 ) ) ( not ( = ?auto_300420 ?auto_300426 ) ) ( not ( = ?auto_300420 ?auto_300427 ) ) ( not ( = ?auto_300420 ?auto_300428 ) ) ( not ( = ?auto_300420 ?auto_300429 ) ) ( not ( = ?auto_300421 ?auto_300422 ) ) ( not ( = ?auto_300421 ?auto_300423 ) ) ( not ( = ?auto_300421 ?auto_300424 ) ) ( not ( = ?auto_300421 ?auto_300425 ) ) ( not ( = ?auto_300421 ?auto_300426 ) ) ( not ( = ?auto_300421 ?auto_300427 ) ) ( not ( = ?auto_300421 ?auto_300428 ) ) ( not ( = ?auto_300421 ?auto_300429 ) ) ( not ( = ?auto_300422 ?auto_300423 ) ) ( not ( = ?auto_300422 ?auto_300424 ) ) ( not ( = ?auto_300422 ?auto_300425 ) ) ( not ( = ?auto_300422 ?auto_300426 ) ) ( not ( = ?auto_300422 ?auto_300427 ) ) ( not ( = ?auto_300422 ?auto_300428 ) ) ( not ( = ?auto_300422 ?auto_300429 ) ) ( not ( = ?auto_300423 ?auto_300424 ) ) ( not ( = ?auto_300423 ?auto_300425 ) ) ( not ( = ?auto_300423 ?auto_300426 ) ) ( not ( = ?auto_300423 ?auto_300427 ) ) ( not ( = ?auto_300423 ?auto_300428 ) ) ( not ( = ?auto_300423 ?auto_300429 ) ) ( not ( = ?auto_300424 ?auto_300425 ) ) ( not ( = ?auto_300424 ?auto_300426 ) ) ( not ( = ?auto_300424 ?auto_300427 ) ) ( not ( = ?auto_300424 ?auto_300428 ) ) ( not ( = ?auto_300424 ?auto_300429 ) ) ( not ( = ?auto_300425 ?auto_300426 ) ) ( not ( = ?auto_300425 ?auto_300427 ) ) ( not ( = ?auto_300425 ?auto_300428 ) ) ( not ( = ?auto_300425 ?auto_300429 ) ) ( not ( = ?auto_300426 ?auto_300427 ) ) ( not ( = ?auto_300426 ?auto_300428 ) ) ( not ( = ?auto_300426 ?auto_300429 ) ) ( not ( = ?auto_300427 ?auto_300428 ) ) ( not ( = ?auto_300427 ?auto_300429 ) ) ( not ( = ?auto_300428 ?auto_300429 ) ) ( ON ?auto_300428 ?auto_300429 ) ( ON ?auto_300427 ?auto_300428 ) ( ON ?auto_300426 ?auto_300427 ) ( ON ?auto_300425 ?auto_300426 ) ( ON ?auto_300424 ?auto_300425 ) ( ON ?auto_300423 ?auto_300424 ) ( ON ?auto_300422 ?auto_300423 ) ( ON ?auto_300421 ?auto_300422 ) ( ON ?auto_300420 ?auto_300421 ) ( CLEAR ?auto_300418 ) ( ON ?auto_300419 ?auto_300420 ) ( CLEAR ?auto_300419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_300416 ?auto_300417 ?auto_300418 ?auto_300419 )
      ( MAKE-14PILE ?auto_300416 ?auto_300417 ?auto_300418 ?auto_300419 ?auto_300420 ?auto_300421 ?auto_300422 ?auto_300423 ?auto_300424 ?auto_300425 ?auto_300426 ?auto_300427 ?auto_300428 ?auto_300429 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_300444 - BLOCK
      ?auto_300445 - BLOCK
      ?auto_300446 - BLOCK
      ?auto_300447 - BLOCK
      ?auto_300448 - BLOCK
      ?auto_300449 - BLOCK
      ?auto_300450 - BLOCK
      ?auto_300451 - BLOCK
      ?auto_300452 - BLOCK
      ?auto_300453 - BLOCK
      ?auto_300454 - BLOCK
      ?auto_300455 - BLOCK
      ?auto_300456 - BLOCK
      ?auto_300457 - BLOCK
    )
    :vars
    (
      ?auto_300458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_300457 ?auto_300458 ) ( ON-TABLE ?auto_300444 ) ( ON ?auto_300445 ?auto_300444 ) ( not ( = ?auto_300444 ?auto_300445 ) ) ( not ( = ?auto_300444 ?auto_300446 ) ) ( not ( = ?auto_300444 ?auto_300447 ) ) ( not ( = ?auto_300444 ?auto_300448 ) ) ( not ( = ?auto_300444 ?auto_300449 ) ) ( not ( = ?auto_300444 ?auto_300450 ) ) ( not ( = ?auto_300444 ?auto_300451 ) ) ( not ( = ?auto_300444 ?auto_300452 ) ) ( not ( = ?auto_300444 ?auto_300453 ) ) ( not ( = ?auto_300444 ?auto_300454 ) ) ( not ( = ?auto_300444 ?auto_300455 ) ) ( not ( = ?auto_300444 ?auto_300456 ) ) ( not ( = ?auto_300444 ?auto_300457 ) ) ( not ( = ?auto_300444 ?auto_300458 ) ) ( not ( = ?auto_300445 ?auto_300446 ) ) ( not ( = ?auto_300445 ?auto_300447 ) ) ( not ( = ?auto_300445 ?auto_300448 ) ) ( not ( = ?auto_300445 ?auto_300449 ) ) ( not ( = ?auto_300445 ?auto_300450 ) ) ( not ( = ?auto_300445 ?auto_300451 ) ) ( not ( = ?auto_300445 ?auto_300452 ) ) ( not ( = ?auto_300445 ?auto_300453 ) ) ( not ( = ?auto_300445 ?auto_300454 ) ) ( not ( = ?auto_300445 ?auto_300455 ) ) ( not ( = ?auto_300445 ?auto_300456 ) ) ( not ( = ?auto_300445 ?auto_300457 ) ) ( not ( = ?auto_300445 ?auto_300458 ) ) ( not ( = ?auto_300446 ?auto_300447 ) ) ( not ( = ?auto_300446 ?auto_300448 ) ) ( not ( = ?auto_300446 ?auto_300449 ) ) ( not ( = ?auto_300446 ?auto_300450 ) ) ( not ( = ?auto_300446 ?auto_300451 ) ) ( not ( = ?auto_300446 ?auto_300452 ) ) ( not ( = ?auto_300446 ?auto_300453 ) ) ( not ( = ?auto_300446 ?auto_300454 ) ) ( not ( = ?auto_300446 ?auto_300455 ) ) ( not ( = ?auto_300446 ?auto_300456 ) ) ( not ( = ?auto_300446 ?auto_300457 ) ) ( not ( = ?auto_300446 ?auto_300458 ) ) ( not ( = ?auto_300447 ?auto_300448 ) ) ( not ( = ?auto_300447 ?auto_300449 ) ) ( not ( = ?auto_300447 ?auto_300450 ) ) ( not ( = ?auto_300447 ?auto_300451 ) ) ( not ( = ?auto_300447 ?auto_300452 ) ) ( not ( = ?auto_300447 ?auto_300453 ) ) ( not ( = ?auto_300447 ?auto_300454 ) ) ( not ( = ?auto_300447 ?auto_300455 ) ) ( not ( = ?auto_300447 ?auto_300456 ) ) ( not ( = ?auto_300447 ?auto_300457 ) ) ( not ( = ?auto_300447 ?auto_300458 ) ) ( not ( = ?auto_300448 ?auto_300449 ) ) ( not ( = ?auto_300448 ?auto_300450 ) ) ( not ( = ?auto_300448 ?auto_300451 ) ) ( not ( = ?auto_300448 ?auto_300452 ) ) ( not ( = ?auto_300448 ?auto_300453 ) ) ( not ( = ?auto_300448 ?auto_300454 ) ) ( not ( = ?auto_300448 ?auto_300455 ) ) ( not ( = ?auto_300448 ?auto_300456 ) ) ( not ( = ?auto_300448 ?auto_300457 ) ) ( not ( = ?auto_300448 ?auto_300458 ) ) ( not ( = ?auto_300449 ?auto_300450 ) ) ( not ( = ?auto_300449 ?auto_300451 ) ) ( not ( = ?auto_300449 ?auto_300452 ) ) ( not ( = ?auto_300449 ?auto_300453 ) ) ( not ( = ?auto_300449 ?auto_300454 ) ) ( not ( = ?auto_300449 ?auto_300455 ) ) ( not ( = ?auto_300449 ?auto_300456 ) ) ( not ( = ?auto_300449 ?auto_300457 ) ) ( not ( = ?auto_300449 ?auto_300458 ) ) ( not ( = ?auto_300450 ?auto_300451 ) ) ( not ( = ?auto_300450 ?auto_300452 ) ) ( not ( = ?auto_300450 ?auto_300453 ) ) ( not ( = ?auto_300450 ?auto_300454 ) ) ( not ( = ?auto_300450 ?auto_300455 ) ) ( not ( = ?auto_300450 ?auto_300456 ) ) ( not ( = ?auto_300450 ?auto_300457 ) ) ( not ( = ?auto_300450 ?auto_300458 ) ) ( not ( = ?auto_300451 ?auto_300452 ) ) ( not ( = ?auto_300451 ?auto_300453 ) ) ( not ( = ?auto_300451 ?auto_300454 ) ) ( not ( = ?auto_300451 ?auto_300455 ) ) ( not ( = ?auto_300451 ?auto_300456 ) ) ( not ( = ?auto_300451 ?auto_300457 ) ) ( not ( = ?auto_300451 ?auto_300458 ) ) ( not ( = ?auto_300452 ?auto_300453 ) ) ( not ( = ?auto_300452 ?auto_300454 ) ) ( not ( = ?auto_300452 ?auto_300455 ) ) ( not ( = ?auto_300452 ?auto_300456 ) ) ( not ( = ?auto_300452 ?auto_300457 ) ) ( not ( = ?auto_300452 ?auto_300458 ) ) ( not ( = ?auto_300453 ?auto_300454 ) ) ( not ( = ?auto_300453 ?auto_300455 ) ) ( not ( = ?auto_300453 ?auto_300456 ) ) ( not ( = ?auto_300453 ?auto_300457 ) ) ( not ( = ?auto_300453 ?auto_300458 ) ) ( not ( = ?auto_300454 ?auto_300455 ) ) ( not ( = ?auto_300454 ?auto_300456 ) ) ( not ( = ?auto_300454 ?auto_300457 ) ) ( not ( = ?auto_300454 ?auto_300458 ) ) ( not ( = ?auto_300455 ?auto_300456 ) ) ( not ( = ?auto_300455 ?auto_300457 ) ) ( not ( = ?auto_300455 ?auto_300458 ) ) ( not ( = ?auto_300456 ?auto_300457 ) ) ( not ( = ?auto_300456 ?auto_300458 ) ) ( not ( = ?auto_300457 ?auto_300458 ) ) ( ON ?auto_300456 ?auto_300457 ) ( ON ?auto_300455 ?auto_300456 ) ( ON ?auto_300454 ?auto_300455 ) ( ON ?auto_300453 ?auto_300454 ) ( ON ?auto_300452 ?auto_300453 ) ( ON ?auto_300451 ?auto_300452 ) ( ON ?auto_300450 ?auto_300451 ) ( ON ?auto_300449 ?auto_300450 ) ( ON ?auto_300448 ?auto_300449 ) ( ON ?auto_300447 ?auto_300448 ) ( CLEAR ?auto_300445 ) ( ON ?auto_300446 ?auto_300447 ) ( CLEAR ?auto_300446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_300444 ?auto_300445 ?auto_300446 )
      ( MAKE-14PILE ?auto_300444 ?auto_300445 ?auto_300446 ?auto_300447 ?auto_300448 ?auto_300449 ?auto_300450 ?auto_300451 ?auto_300452 ?auto_300453 ?auto_300454 ?auto_300455 ?auto_300456 ?auto_300457 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_300473 - BLOCK
      ?auto_300474 - BLOCK
      ?auto_300475 - BLOCK
      ?auto_300476 - BLOCK
      ?auto_300477 - BLOCK
      ?auto_300478 - BLOCK
      ?auto_300479 - BLOCK
      ?auto_300480 - BLOCK
      ?auto_300481 - BLOCK
      ?auto_300482 - BLOCK
      ?auto_300483 - BLOCK
      ?auto_300484 - BLOCK
      ?auto_300485 - BLOCK
      ?auto_300486 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_300486 ) ( ON-TABLE ?auto_300473 ) ( ON ?auto_300474 ?auto_300473 ) ( not ( = ?auto_300473 ?auto_300474 ) ) ( not ( = ?auto_300473 ?auto_300475 ) ) ( not ( = ?auto_300473 ?auto_300476 ) ) ( not ( = ?auto_300473 ?auto_300477 ) ) ( not ( = ?auto_300473 ?auto_300478 ) ) ( not ( = ?auto_300473 ?auto_300479 ) ) ( not ( = ?auto_300473 ?auto_300480 ) ) ( not ( = ?auto_300473 ?auto_300481 ) ) ( not ( = ?auto_300473 ?auto_300482 ) ) ( not ( = ?auto_300473 ?auto_300483 ) ) ( not ( = ?auto_300473 ?auto_300484 ) ) ( not ( = ?auto_300473 ?auto_300485 ) ) ( not ( = ?auto_300473 ?auto_300486 ) ) ( not ( = ?auto_300474 ?auto_300475 ) ) ( not ( = ?auto_300474 ?auto_300476 ) ) ( not ( = ?auto_300474 ?auto_300477 ) ) ( not ( = ?auto_300474 ?auto_300478 ) ) ( not ( = ?auto_300474 ?auto_300479 ) ) ( not ( = ?auto_300474 ?auto_300480 ) ) ( not ( = ?auto_300474 ?auto_300481 ) ) ( not ( = ?auto_300474 ?auto_300482 ) ) ( not ( = ?auto_300474 ?auto_300483 ) ) ( not ( = ?auto_300474 ?auto_300484 ) ) ( not ( = ?auto_300474 ?auto_300485 ) ) ( not ( = ?auto_300474 ?auto_300486 ) ) ( not ( = ?auto_300475 ?auto_300476 ) ) ( not ( = ?auto_300475 ?auto_300477 ) ) ( not ( = ?auto_300475 ?auto_300478 ) ) ( not ( = ?auto_300475 ?auto_300479 ) ) ( not ( = ?auto_300475 ?auto_300480 ) ) ( not ( = ?auto_300475 ?auto_300481 ) ) ( not ( = ?auto_300475 ?auto_300482 ) ) ( not ( = ?auto_300475 ?auto_300483 ) ) ( not ( = ?auto_300475 ?auto_300484 ) ) ( not ( = ?auto_300475 ?auto_300485 ) ) ( not ( = ?auto_300475 ?auto_300486 ) ) ( not ( = ?auto_300476 ?auto_300477 ) ) ( not ( = ?auto_300476 ?auto_300478 ) ) ( not ( = ?auto_300476 ?auto_300479 ) ) ( not ( = ?auto_300476 ?auto_300480 ) ) ( not ( = ?auto_300476 ?auto_300481 ) ) ( not ( = ?auto_300476 ?auto_300482 ) ) ( not ( = ?auto_300476 ?auto_300483 ) ) ( not ( = ?auto_300476 ?auto_300484 ) ) ( not ( = ?auto_300476 ?auto_300485 ) ) ( not ( = ?auto_300476 ?auto_300486 ) ) ( not ( = ?auto_300477 ?auto_300478 ) ) ( not ( = ?auto_300477 ?auto_300479 ) ) ( not ( = ?auto_300477 ?auto_300480 ) ) ( not ( = ?auto_300477 ?auto_300481 ) ) ( not ( = ?auto_300477 ?auto_300482 ) ) ( not ( = ?auto_300477 ?auto_300483 ) ) ( not ( = ?auto_300477 ?auto_300484 ) ) ( not ( = ?auto_300477 ?auto_300485 ) ) ( not ( = ?auto_300477 ?auto_300486 ) ) ( not ( = ?auto_300478 ?auto_300479 ) ) ( not ( = ?auto_300478 ?auto_300480 ) ) ( not ( = ?auto_300478 ?auto_300481 ) ) ( not ( = ?auto_300478 ?auto_300482 ) ) ( not ( = ?auto_300478 ?auto_300483 ) ) ( not ( = ?auto_300478 ?auto_300484 ) ) ( not ( = ?auto_300478 ?auto_300485 ) ) ( not ( = ?auto_300478 ?auto_300486 ) ) ( not ( = ?auto_300479 ?auto_300480 ) ) ( not ( = ?auto_300479 ?auto_300481 ) ) ( not ( = ?auto_300479 ?auto_300482 ) ) ( not ( = ?auto_300479 ?auto_300483 ) ) ( not ( = ?auto_300479 ?auto_300484 ) ) ( not ( = ?auto_300479 ?auto_300485 ) ) ( not ( = ?auto_300479 ?auto_300486 ) ) ( not ( = ?auto_300480 ?auto_300481 ) ) ( not ( = ?auto_300480 ?auto_300482 ) ) ( not ( = ?auto_300480 ?auto_300483 ) ) ( not ( = ?auto_300480 ?auto_300484 ) ) ( not ( = ?auto_300480 ?auto_300485 ) ) ( not ( = ?auto_300480 ?auto_300486 ) ) ( not ( = ?auto_300481 ?auto_300482 ) ) ( not ( = ?auto_300481 ?auto_300483 ) ) ( not ( = ?auto_300481 ?auto_300484 ) ) ( not ( = ?auto_300481 ?auto_300485 ) ) ( not ( = ?auto_300481 ?auto_300486 ) ) ( not ( = ?auto_300482 ?auto_300483 ) ) ( not ( = ?auto_300482 ?auto_300484 ) ) ( not ( = ?auto_300482 ?auto_300485 ) ) ( not ( = ?auto_300482 ?auto_300486 ) ) ( not ( = ?auto_300483 ?auto_300484 ) ) ( not ( = ?auto_300483 ?auto_300485 ) ) ( not ( = ?auto_300483 ?auto_300486 ) ) ( not ( = ?auto_300484 ?auto_300485 ) ) ( not ( = ?auto_300484 ?auto_300486 ) ) ( not ( = ?auto_300485 ?auto_300486 ) ) ( ON ?auto_300485 ?auto_300486 ) ( ON ?auto_300484 ?auto_300485 ) ( ON ?auto_300483 ?auto_300484 ) ( ON ?auto_300482 ?auto_300483 ) ( ON ?auto_300481 ?auto_300482 ) ( ON ?auto_300480 ?auto_300481 ) ( ON ?auto_300479 ?auto_300480 ) ( ON ?auto_300478 ?auto_300479 ) ( ON ?auto_300477 ?auto_300478 ) ( ON ?auto_300476 ?auto_300477 ) ( CLEAR ?auto_300474 ) ( ON ?auto_300475 ?auto_300476 ) ( CLEAR ?auto_300475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_300473 ?auto_300474 ?auto_300475 )
      ( MAKE-14PILE ?auto_300473 ?auto_300474 ?auto_300475 ?auto_300476 ?auto_300477 ?auto_300478 ?auto_300479 ?auto_300480 ?auto_300481 ?auto_300482 ?auto_300483 ?auto_300484 ?auto_300485 ?auto_300486 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_300501 - BLOCK
      ?auto_300502 - BLOCK
      ?auto_300503 - BLOCK
      ?auto_300504 - BLOCK
      ?auto_300505 - BLOCK
      ?auto_300506 - BLOCK
      ?auto_300507 - BLOCK
      ?auto_300508 - BLOCK
      ?auto_300509 - BLOCK
      ?auto_300510 - BLOCK
      ?auto_300511 - BLOCK
      ?auto_300512 - BLOCK
      ?auto_300513 - BLOCK
      ?auto_300514 - BLOCK
    )
    :vars
    (
      ?auto_300515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_300514 ?auto_300515 ) ( ON-TABLE ?auto_300501 ) ( not ( = ?auto_300501 ?auto_300502 ) ) ( not ( = ?auto_300501 ?auto_300503 ) ) ( not ( = ?auto_300501 ?auto_300504 ) ) ( not ( = ?auto_300501 ?auto_300505 ) ) ( not ( = ?auto_300501 ?auto_300506 ) ) ( not ( = ?auto_300501 ?auto_300507 ) ) ( not ( = ?auto_300501 ?auto_300508 ) ) ( not ( = ?auto_300501 ?auto_300509 ) ) ( not ( = ?auto_300501 ?auto_300510 ) ) ( not ( = ?auto_300501 ?auto_300511 ) ) ( not ( = ?auto_300501 ?auto_300512 ) ) ( not ( = ?auto_300501 ?auto_300513 ) ) ( not ( = ?auto_300501 ?auto_300514 ) ) ( not ( = ?auto_300501 ?auto_300515 ) ) ( not ( = ?auto_300502 ?auto_300503 ) ) ( not ( = ?auto_300502 ?auto_300504 ) ) ( not ( = ?auto_300502 ?auto_300505 ) ) ( not ( = ?auto_300502 ?auto_300506 ) ) ( not ( = ?auto_300502 ?auto_300507 ) ) ( not ( = ?auto_300502 ?auto_300508 ) ) ( not ( = ?auto_300502 ?auto_300509 ) ) ( not ( = ?auto_300502 ?auto_300510 ) ) ( not ( = ?auto_300502 ?auto_300511 ) ) ( not ( = ?auto_300502 ?auto_300512 ) ) ( not ( = ?auto_300502 ?auto_300513 ) ) ( not ( = ?auto_300502 ?auto_300514 ) ) ( not ( = ?auto_300502 ?auto_300515 ) ) ( not ( = ?auto_300503 ?auto_300504 ) ) ( not ( = ?auto_300503 ?auto_300505 ) ) ( not ( = ?auto_300503 ?auto_300506 ) ) ( not ( = ?auto_300503 ?auto_300507 ) ) ( not ( = ?auto_300503 ?auto_300508 ) ) ( not ( = ?auto_300503 ?auto_300509 ) ) ( not ( = ?auto_300503 ?auto_300510 ) ) ( not ( = ?auto_300503 ?auto_300511 ) ) ( not ( = ?auto_300503 ?auto_300512 ) ) ( not ( = ?auto_300503 ?auto_300513 ) ) ( not ( = ?auto_300503 ?auto_300514 ) ) ( not ( = ?auto_300503 ?auto_300515 ) ) ( not ( = ?auto_300504 ?auto_300505 ) ) ( not ( = ?auto_300504 ?auto_300506 ) ) ( not ( = ?auto_300504 ?auto_300507 ) ) ( not ( = ?auto_300504 ?auto_300508 ) ) ( not ( = ?auto_300504 ?auto_300509 ) ) ( not ( = ?auto_300504 ?auto_300510 ) ) ( not ( = ?auto_300504 ?auto_300511 ) ) ( not ( = ?auto_300504 ?auto_300512 ) ) ( not ( = ?auto_300504 ?auto_300513 ) ) ( not ( = ?auto_300504 ?auto_300514 ) ) ( not ( = ?auto_300504 ?auto_300515 ) ) ( not ( = ?auto_300505 ?auto_300506 ) ) ( not ( = ?auto_300505 ?auto_300507 ) ) ( not ( = ?auto_300505 ?auto_300508 ) ) ( not ( = ?auto_300505 ?auto_300509 ) ) ( not ( = ?auto_300505 ?auto_300510 ) ) ( not ( = ?auto_300505 ?auto_300511 ) ) ( not ( = ?auto_300505 ?auto_300512 ) ) ( not ( = ?auto_300505 ?auto_300513 ) ) ( not ( = ?auto_300505 ?auto_300514 ) ) ( not ( = ?auto_300505 ?auto_300515 ) ) ( not ( = ?auto_300506 ?auto_300507 ) ) ( not ( = ?auto_300506 ?auto_300508 ) ) ( not ( = ?auto_300506 ?auto_300509 ) ) ( not ( = ?auto_300506 ?auto_300510 ) ) ( not ( = ?auto_300506 ?auto_300511 ) ) ( not ( = ?auto_300506 ?auto_300512 ) ) ( not ( = ?auto_300506 ?auto_300513 ) ) ( not ( = ?auto_300506 ?auto_300514 ) ) ( not ( = ?auto_300506 ?auto_300515 ) ) ( not ( = ?auto_300507 ?auto_300508 ) ) ( not ( = ?auto_300507 ?auto_300509 ) ) ( not ( = ?auto_300507 ?auto_300510 ) ) ( not ( = ?auto_300507 ?auto_300511 ) ) ( not ( = ?auto_300507 ?auto_300512 ) ) ( not ( = ?auto_300507 ?auto_300513 ) ) ( not ( = ?auto_300507 ?auto_300514 ) ) ( not ( = ?auto_300507 ?auto_300515 ) ) ( not ( = ?auto_300508 ?auto_300509 ) ) ( not ( = ?auto_300508 ?auto_300510 ) ) ( not ( = ?auto_300508 ?auto_300511 ) ) ( not ( = ?auto_300508 ?auto_300512 ) ) ( not ( = ?auto_300508 ?auto_300513 ) ) ( not ( = ?auto_300508 ?auto_300514 ) ) ( not ( = ?auto_300508 ?auto_300515 ) ) ( not ( = ?auto_300509 ?auto_300510 ) ) ( not ( = ?auto_300509 ?auto_300511 ) ) ( not ( = ?auto_300509 ?auto_300512 ) ) ( not ( = ?auto_300509 ?auto_300513 ) ) ( not ( = ?auto_300509 ?auto_300514 ) ) ( not ( = ?auto_300509 ?auto_300515 ) ) ( not ( = ?auto_300510 ?auto_300511 ) ) ( not ( = ?auto_300510 ?auto_300512 ) ) ( not ( = ?auto_300510 ?auto_300513 ) ) ( not ( = ?auto_300510 ?auto_300514 ) ) ( not ( = ?auto_300510 ?auto_300515 ) ) ( not ( = ?auto_300511 ?auto_300512 ) ) ( not ( = ?auto_300511 ?auto_300513 ) ) ( not ( = ?auto_300511 ?auto_300514 ) ) ( not ( = ?auto_300511 ?auto_300515 ) ) ( not ( = ?auto_300512 ?auto_300513 ) ) ( not ( = ?auto_300512 ?auto_300514 ) ) ( not ( = ?auto_300512 ?auto_300515 ) ) ( not ( = ?auto_300513 ?auto_300514 ) ) ( not ( = ?auto_300513 ?auto_300515 ) ) ( not ( = ?auto_300514 ?auto_300515 ) ) ( ON ?auto_300513 ?auto_300514 ) ( ON ?auto_300512 ?auto_300513 ) ( ON ?auto_300511 ?auto_300512 ) ( ON ?auto_300510 ?auto_300511 ) ( ON ?auto_300509 ?auto_300510 ) ( ON ?auto_300508 ?auto_300509 ) ( ON ?auto_300507 ?auto_300508 ) ( ON ?auto_300506 ?auto_300507 ) ( ON ?auto_300505 ?auto_300506 ) ( ON ?auto_300504 ?auto_300505 ) ( ON ?auto_300503 ?auto_300504 ) ( CLEAR ?auto_300501 ) ( ON ?auto_300502 ?auto_300503 ) ( CLEAR ?auto_300502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_300501 ?auto_300502 )
      ( MAKE-14PILE ?auto_300501 ?auto_300502 ?auto_300503 ?auto_300504 ?auto_300505 ?auto_300506 ?auto_300507 ?auto_300508 ?auto_300509 ?auto_300510 ?auto_300511 ?auto_300512 ?auto_300513 ?auto_300514 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_300530 - BLOCK
      ?auto_300531 - BLOCK
      ?auto_300532 - BLOCK
      ?auto_300533 - BLOCK
      ?auto_300534 - BLOCK
      ?auto_300535 - BLOCK
      ?auto_300536 - BLOCK
      ?auto_300537 - BLOCK
      ?auto_300538 - BLOCK
      ?auto_300539 - BLOCK
      ?auto_300540 - BLOCK
      ?auto_300541 - BLOCK
      ?auto_300542 - BLOCK
      ?auto_300543 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_300543 ) ( ON-TABLE ?auto_300530 ) ( not ( = ?auto_300530 ?auto_300531 ) ) ( not ( = ?auto_300530 ?auto_300532 ) ) ( not ( = ?auto_300530 ?auto_300533 ) ) ( not ( = ?auto_300530 ?auto_300534 ) ) ( not ( = ?auto_300530 ?auto_300535 ) ) ( not ( = ?auto_300530 ?auto_300536 ) ) ( not ( = ?auto_300530 ?auto_300537 ) ) ( not ( = ?auto_300530 ?auto_300538 ) ) ( not ( = ?auto_300530 ?auto_300539 ) ) ( not ( = ?auto_300530 ?auto_300540 ) ) ( not ( = ?auto_300530 ?auto_300541 ) ) ( not ( = ?auto_300530 ?auto_300542 ) ) ( not ( = ?auto_300530 ?auto_300543 ) ) ( not ( = ?auto_300531 ?auto_300532 ) ) ( not ( = ?auto_300531 ?auto_300533 ) ) ( not ( = ?auto_300531 ?auto_300534 ) ) ( not ( = ?auto_300531 ?auto_300535 ) ) ( not ( = ?auto_300531 ?auto_300536 ) ) ( not ( = ?auto_300531 ?auto_300537 ) ) ( not ( = ?auto_300531 ?auto_300538 ) ) ( not ( = ?auto_300531 ?auto_300539 ) ) ( not ( = ?auto_300531 ?auto_300540 ) ) ( not ( = ?auto_300531 ?auto_300541 ) ) ( not ( = ?auto_300531 ?auto_300542 ) ) ( not ( = ?auto_300531 ?auto_300543 ) ) ( not ( = ?auto_300532 ?auto_300533 ) ) ( not ( = ?auto_300532 ?auto_300534 ) ) ( not ( = ?auto_300532 ?auto_300535 ) ) ( not ( = ?auto_300532 ?auto_300536 ) ) ( not ( = ?auto_300532 ?auto_300537 ) ) ( not ( = ?auto_300532 ?auto_300538 ) ) ( not ( = ?auto_300532 ?auto_300539 ) ) ( not ( = ?auto_300532 ?auto_300540 ) ) ( not ( = ?auto_300532 ?auto_300541 ) ) ( not ( = ?auto_300532 ?auto_300542 ) ) ( not ( = ?auto_300532 ?auto_300543 ) ) ( not ( = ?auto_300533 ?auto_300534 ) ) ( not ( = ?auto_300533 ?auto_300535 ) ) ( not ( = ?auto_300533 ?auto_300536 ) ) ( not ( = ?auto_300533 ?auto_300537 ) ) ( not ( = ?auto_300533 ?auto_300538 ) ) ( not ( = ?auto_300533 ?auto_300539 ) ) ( not ( = ?auto_300533 ?auto_300540 ) ) ( not ( = ?auto_300533 ?auto_300541 ) ) ( not ( = ?auto_300533 ?auto_300542 ) ) ( not ( = ?auto_300533 ?auto_300543 ) ) ( not ( = ?auto_300534 ?auto_300535 ) ) ( not ( = ?auto_300534 ?auto_300536 ) ) ( not ( = ?auto_300534 ?auto_300537 ) ) ( not ( = ?auto_300534 ?auto_300538 ) ) ( not ( = ?auto_300534 ?auto_300539 ) ) ( not ( = ?auto_300534 ?auto_300540 ) ) ( not ( = ?auto_300534 ?auto_300541 ) ) ( not ( = ?auto_300534 ?auto_300542 ) ) ( not ( = ?auto_300534 ?auto_300543 ) ) ( not ( = ?auto_300535 ?auto_300536 ) ) ( not ( = ?auto_300535 ?auto_300537 ) ) ( not ( = ?auto_300535 ?auto_300538 ) ) ( not ( = ?auto_300535 ?auto_300539 ) ) ( not ( = ?auto_300535 ?auto_300540 ) ) ( not ( = ?auto_300535 ?auto_300541 ) ) ( not ( = ?auto_300535 ?auto_300542 ) ) ( not ( = ?auto_300535 ?auto_300543 ) ) ( not ( = ?auto_300536 ?auto_300537 ) ) ( not ( = ?auto_300536 ?auto_300538 ) ) ( not ( = ?auto_300536 ?auto_300539 ) ) ( not ( = ?auto_300536 ?auto_300540 ) ) ( not ( = ?auto_300536 ?auto_300541 ) ) ( not ( = ?auto_300536 ?auto_300542 ) ) ( not ( = ?auto_300536 ?auto_300543 ) ) ( not ( = ?auto_300537 ?auto_300538 ) ) ( not ( = ?auto_300537 ?auto_300539 ) ) ( not ( = ?auto_300537 ?auto_300540 ) ) ( not ( = ?auto_300537 ?auto_300541 ) ) ( not ( = ?auto_300537 ?auto_300542 ) ) ( not ( = ?auto_300537 ?auto_300543 ) ) ( not ( = ?auto_300538 ?auto_300539 ) ) ( not ( = ?auto_300538 ?auto_300540 ) ) ( not ( = ?auto_300538 ?auto_300541 ) ) ( not ( = ?auto_300538 ?auto_300542 ) ) ( not ( = ?auto_300538 ?auto_300543 ) ) ( not ( = ?auto_300539 ?auto_300540 ) ) ( not ( = ?auto_300539 ?auto_300541 ) ) ( not ( = ?auto_300539 ?auto_300542 ) ) ( not ( = ?auto_300539 ?auto_300543 ) ) ( not ( = ?auto_300540 ?auto_300541 ) ) ( not ( = ?auto_300540 ?auto_300542 ) ) ( not ( = ?auto_300540 ?auto_300543 ) ) ( not ( = ?auto_300541 ?auto_300542 ) ) ( not ( = ?auto_300541 ?auto_300543 ) ) ( not ( = ?auto_300542 ?auto_300543 ) ) ( ON ?auto_300542 ?auto_300543 ) ( ON ?auto_300541 ?auto_300542 ) ( ON ?auto_300540 ?auto_300541 ) ( ON ?auto_300539 ?auto_300540 ) ( ON ?auto_300538 ?auto_300539 ) ( ON ?auto_300537 ?auto_300538 ) ( ON ?auto_300536 ?auto_300537 ) ( ON ?auto_300535 ?auto_300536 ) ( ON ?auto_300534 ?auto_300535 ) ( ON ?auto_300533 ?auto_300534 ) ( ON ?auto_300532 ?auto_300533 ) ( CLEAR ?auto_300530 ) ( ON ?auto_300531 ?auto_300532 ) ( CLEAR ?auto_300531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_300530 ?auto_300531 )
      ( MAKE-14PILE ?auto_300530 ?auto_300531 ?auto_300532 ?auto_300533 ?auto_300534 ?auto_300535 ?auto_300536 ?auto_300537 ?auto_300538 ?auto_300539 ?auto_300540 ?auto_300541 ?auto_300542 ?auto_300543 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_300558 - BLOCK
      ?auto_300559 - BLOCK
      ?auto_300560 - BLOCK
      ?auto_300561 - BLOCK
      ?auto_300562 - BLOCK
      ?auto_300563 - BLOCK
      ?auto_300564 - BLOCK
      ?auto_300565 - BLOCK
      ?auto_300566 - BLOCK
      ?auto_300567 - BLOCK
      ?auto_300568 - BLOCK
      ?auto_300569 - BLOCK
      ?auto_300570 - BLOCK
      ?auto_300571 - BLOCK
    )
    :vars
    (
      ?auto_300572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_300571 ?auto_300572 ) ( not ( = ?auto_300558 ?auto_300559 ) ) ( not ( = ?auto_300558 ?auto_300560 ) ) ( not ( = ?auto_300558 ?auto_300561 ) ) ( not ( = ?auto_300558 ?auto_300562 ) ) ( not ( = ?auto_300558 ?auto_300563 ) ) ( not ( = ?auto_300558 ?auto_300564 ) ) ( not ( = ?auto_300558 ?auto_300565 ) ) ( not ( = ?auto_300558 ?auto_300566 ) ) ( not ( = ?auto_300558 ?auto_300567 ) ) ( not ( = ?auto_300558 ?auto_300568 ) ) ( not ( = ?auto_300558 ?auto_300569 ) ) ( not ( = ?auto_300558 ?auto_300570 ) ) ( not ( = ?auto_300558 ?auto_300571 ) ) ( not ( = ?auto_300558 ?auto_300572 ) ) ( not ( = ?auto_300559 ?auto_300560 ) ) ( not ( = ?auto_300559 ?auto_300561 ) ) ( not ( = ?auto_300559 ?auto_300562 ) ) ( not ( = ?auto_300559 ?auto_300563 ) ) ( not ( = ?auto_300559 ?auto_300564 ) ) ( not ( = ?auto_300559 ?auto_300565 ) ) ( not ( = ?auto_300559 ?auto_300566 ) ) ( not ( = ?auto_300559 ?auto_300567 ) ) ( not ( = ?auto_300559 ?auto_300568 ) ) ( not ( = ?auto_300559 ?auto_300569 ) ) ( not ( = ?auto_300559 ?auto_300570 ) ) ( not ( = ?auto_300559 ?auto_300571 ) ) ( not ( = ?auto_300559 ?auto_300572 ) ) ( not ( = ?auto_300560 ?auto_300561 ) ) ( not ( = ?auto_300560 ?auto_300562 ) ) ( not ( = ?auto_300560 ?auto_300563 ) ) ( not ( = ?auto_300560 ?auto_300564 ) ) ( not ( = ?auto_300560 ?auto_300565 ) ) ( not ( = ?auto_300560 ?auto_300566 ) ) ( not ( = ?auto_300560 ?auto_300567 ) ) ( not ( = ?auto_300560 ?auto_300568 ) ) ( not ( = ?auto_300560 ?auto_300569 ) ) ( not ( = ?auto_300560 ?auto_300570 ) ) ( not ( = ?auto_300560 ?auto_300571 ) ) ( not ( = ?auto_300560 ?auto_300572 ) ) ( not ( = ?auto_300561 ?auto_300562 ) ) ( not ( = ?auto_300561 ?auto_300563 ) ) ( not ( = ?auto_300561 ?auto_300564 ) ) ( not ( = ?auto_300561 ?auto_300565 ) ) ( not ( = ?auto_300561 ?auto_300566 ) ) ( not ( = ?auto_300561 ?auto_300567 ) ) ( not ( = ?auto_300561 ?auto_300568 ) ) ( not ( = ?auto_300561 ?auto_300569 ) ) ( not ( = ?auto_300561 ?auto_300570 ) ) ( not ( = ?auto_300561 ?auto_300571 ) ) ( not ( = ?auto_300561 ?auto_300572 ) ) ( not ( = ?auto_300562 ?auto_300563 ) ) ( not ( = ?auto_300562 ?auto_300564 ) ) ( not ( = ?auto_300562 ?auto_300565 ) ) ( not ( = ?auto_300562 ?auto_300566 ) ) ( not ( = ?auto_300562 ?auto_300567 ) ) ( not ( = ?auto_300562 ?auto_300568 ) ) ( not ( = ?auto_300562 ?auto_300569 ) ) ( not ( = ?auto_300562 ?auto_300570 ) ) ( not ( = ?auto_300562 ?auto_300571 ) ) ( not ( = ?auto_300562 ?auto_300572 ) ) ( not ( = ?auto_300563 ?auto_300564 ) ) ( not ( = ?auto_300563 ?auto_300565 ) ) ( not ( = ?auto_300563 ?auto_300566 ) ) ( not ( = ?auto_300563 ?auto_300567 ) ) ( not ( = ?auto_300563 ?auto_300568 ) ) ( not ( = ?auto_300563 ?auto_300569 ) ) ( not ( = ?auto_300563 ?auto_300570 ) ) ( not ( = ?auto_300563 ?auto_300571 ) ) ( not ( = ?auto_300563 ?auto_300572 ) ) ( not ( = ?auto_300564 ?auto_300565 ) ) ( not ( = ?auto_300564 ?auto_300566 ) ) ( not ( = ?auto_300564 ?auto_300567 ) ) ( not ( = ?auto_300564 ?auto_300568 ) ) ( not ( = ?auto_300564 ?auto_300569 ) ) ( not ( = ?auto_300564 ?auto_300570 ) ) ( not ( = ?auto_300564 ?auto_300571 ) ) ( not ( = ?auto_300564 ?auto_300572 ) ) ( not ( = ?auto_300565 ?auto_300566 ) ) ( not ( = ?auto_300565 ?auto_300567 ) ) ( not ( = ?auto_300565 ?auto_300568 ) ) ( not ( = ?auto_300565 ?auto_300569 ) ) ( not ( = ?auto_300565 ?auto_300570 ) ) ( not ( = ?auto_300565 ?auto_300571 ) ) ( not ( = ?auto_300565 ?auto_300572 ) ) ( not ( = ?auto_300566 ?auto_300567 ) ) ( not ( = ?auto_300566 ?auto_300568 ) ) ( not ( = ?auto_300566 ?auto_300569 ) ) ( not ( = ?auto_300566 ?auto_300570 ) ) ( not ( = ?auto_300566 ?auto_300571 ) ) ( not ( = ?auto_300566 ?auto_300572 ) ) ( not ( = ?auto_300567 ?auto_300568 ) ) ( not ( = ?auto_300567 ?auto_300569 ) ) ( not ( = ?auto_300567 ?auto_300570 ) ) ( not ( = ?auto_300567 ?auto_300571 ) ) ( not ( = ?auto_300567 ?auto_300572 ) ) ( not ( = ?auto_300568 ?auto_300569 ) ) ( not ( = ?auto_300568 ?auto_300570 ) ) ( not ( = ?auto_300568 ?auto_300571 ) ) ( not ( = ?auto_300568 ?auto_300572 ) ) ( not ( = ?auto_300569 ?auto_300570 ) ) ( not ( = ?auto_300569 ?auto_300571 ) ) ( not ( = ?auto_300569 ?auto_300572 ) ) ( not ( = ?auto_300570 ?auto_300571 ) ) ( not ( = ?auto_300570 ?auto_300572 ) ) ( not ( = ?auto_300571 ?auto_300572 ) ) ( ON ?auto_300570 ?auto_300571 ) ( ON ?auto_300569 ?auto_300570 ) ( ON ?auto_300568 ?auto_300569 ) ( ON ?auto_300567 ?auto_300568 ) ( ON ?auto_300566 ?auto_300567 ) ( ON ?auto_300565 ?auto_300566 ) ( ON ?auto_300564 ?auto_300565 ) ( ON ?auto_300563 ?auto_300564 ) ( ON ?auto_300562 ?auto_300563 ) ( ON ?auto_300561 ?auto_300562 ) ( ON ?auto_300560 ?auto_300561 ) ( ON ?auto_300559 ?auto_300560 ) ( ON ?auto_300558 ?auto_300559 ) ( CLEAR ?auto_300558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_300558 )
      ( MAKE-14PILE ?auto_300558 ?auto_300559 ?auto_300560 ?auto_300561 ?auto_300562 ?auto_300563 ?auto_300564 ?auto_300565 ?auto_300566 ?auto_300567 ?auto_300568 ?auto_300569 ?auto_300570 ?auto_300571 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_300587 - BLOCK
      ?auto_300588 - BLOCK
      ?auto_300589 - BLOCK
      ?auto_300590 - BLOCK
      ?auto_300591 - BLOCK
      ?auto_300592 - BLOCK
      ?auto_300593 - BLOCK
      ?auto_300594 - BLOCK
      ?auto_300595 - BLOCK
      ?auto_300596 - BLOCK
      ?auto_300597 - BLOCK
      ?auto_300598 - BLOCK
      ?auto_300599 - BLOCK
      ?auto_300600 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_300600 ) ( not ( = ?auto_300587 ?auto_300588 ) ) ( not ( = ?auto_300587 ?auto_300589 ) ) ( not ( = ?auto_300587 ?auto_300590 ) ) ( not ( = ?auto_300587 ?auto_300591 ) ) ( not ( = ?auto_300587 ?auto_300592 ) ) ( not ( = ?auto_300587 ?auto_300593 ) ) ( not ( = ?auto_300587 ?auto_300594 ) ) ( not ( = ?auto_300587 ?auto_300595 ) ) ( not ( = ?auto_300587 ?auto_300596 ) ) ( not ( = ?auto_300587 ?auto_300597 ) ) ( not ( = ?auto_300587 ?auto_300598 ) ) ( not ( = ?auto_300587 ?auto_300599 ) ) ( not ( = ?auto_300587 ?auto_300600 ) ) ( not ( = ?auto_300588 ?auto_300589 ) ) ( not ( = ?auto_300588 ?auto_300590 ) ) ( not ( = ?auto_300588 ?auto_300591 ) ) ( not ( = ?auto_300588 ?auto_300592 ) ) ( not ( = ?auto_300588 ?auto_300593 ) ) ( not ( = ?auto_300588 ?auto_300594 ) ) ( not ( = ?auto_300588 ?auto_300595 ) ) ( not ( = ?auto_300588 ?auto_300596 ) ) ( not ( = ?auto_300588 ?auto_300597 ) ) ( not ( = ?auto_300588 ?auto_300598 ) ) ( not ( = ?auto_300588 ?auto_300599 ) ) ( not ( = ?auto_300588 ?auto_300600 ) ) ( not ( = ?auto_300589 ?auto_300590 ) ) ( not ( = ?auto_300589 ?auto_300591 ) ) ( not ( = ?auto_300589 ?auto_300592 ) ) ( not ( = ?auto_300589 ?auto_300593 ) ) ( not ( = ?auto_300589 ?auto_300594 ) ) ( not ( = ?auto_300589 ?auto_300595 ) ) ( not ( = ?auto_300589 ?auto_300596 ) ) ( not ( = ?auto_300589 ?auto_300597 ) ) ( not ( = ?auto_300589 ?auto_300598 ) ) ( not ( = ?auto_300589 ?auto_300599 ) ) ( not ( = ?auto_300589 ?auto_300600 ) ) ( not ( = ?auto_300590 ?auto_300591 ) ) ( not ( = ?auto_300590 ?auto_300592 ) ) ( not ( = ?auto_300590 ?auto_300593 ) ) ( not ( = ?auto_300590 ?auto_300594 ) ) ( not ( = ?auto_300590 ?auto_300595 ) ) ( not ( = ?auto_300590 ?auto_300596 ) ) ( not ( = ?auto_300590 ?auto_300597 ) ) ( not ( = ?auto_300590 ?auto_300598 ) ) ( not ( = ?auto_300590 ?auto_300599 ) ) ( not ( = ?auto_300590 ?auto_300600 ) ) ( not ( = ?auto_300591 ?auto_300592 ) ) ( not ( = ?auto_300591 ?auto_300593 ) ) ( not ( = ?auto_300591 ?auto_300594 ) ) ( not ( = ?auto_300591 ?auto_300595 ) ) ( not ( = ?auto_300591 ?auto_300596 ) ) ( not ( = ?auto_300591 ?auto_300597 ) ) ( not ( = ?auto_300591 ?auto_300598 ) ) ( not ( = ?auto_300591 ?auto_300599 ) ) ( not ( = ?auto_300591 ?auto_300600 ) ) ( not ( = ?auto_300592 ?auto_300593 ) ) ( not ( = ?auto_300592 ?auto_300594 ) ) ( not ( = ?auto_300592 ?auto_300595 ) ) ( not ( = ?auto_300592 ?auto_300596 ) ) ( not ( = ?auto_300592 ?auto_300597 ) ) ( not ( = ?auto_300592 ?auto_300598 ) ) ( not ( = ?auto_300592 ?auto_300599 ) ) ( not ( = ?auto_300592 ?auto_300600 ) ) ( not ( = ?auto_300593 ?auto_300594 ) ) ( not ( = ?auto_300593 ?auto_300595 ) ) ( not ( = ?auto_300593 ?auto_300596 ) ) ( not ( = ?auto_300593 ?auto_300597 ) ) ( not ( = ?auto_300593 ?auto_300598 ) ) ( not ( = ?auto_300593 ?auto_300599 ) ) ( not ( = ?auto_300593 ?auto_300600 ) ) ( not ( = ?auto_300594 ?auto_300595 ) ) ( not ( = ?auto_300594 ?auto_300596 ) ) ( not ( = ?auto_300594 ?auto_300597 ) ) ( not ( = ?auto_300594 ?auto_300598 ) ) ( not ( = ?auto_300594 ?auto_300599 ) ) ( not ( = ?auto_300594 ?auto_300600 ) ) ( not ( = ?auto_300595 ?auto_300596 ) ) ( not ( = ?auto_300595 ?auto_300597 ) ) ( not ( = ?auto_300595 ?auto_300598 ) ) ( not ( = ?auto_300595 ?auto_300599 ) ) ( not ( = ?auto_300595 ?auto_300600 ) ) ( not ( = ?auto_300596 ?auto_300597 ) ) ( not ( = ?auto_300596 ?auto_300598 ) ) ( not ( = ?auto_300596 ?auto_300599 ) ) ( not ( = ?auto_300596 ?auto_300600 ) ) ( not ( = ?auto_300597 ?auto_300598 ) ) ( not ( = ?auto_300597 ?auto_300599 ) ) ( not ( = ?auto_300597 ?auto_300600 ) ) ( not ( = ?auto_300598 ?auto_300599 ) ) ( not ( = ?auto_300598 ?auto_300600 ) ) ( not ( = ?auto_300599 ?auto_300600 ) ) ( ON ?auto_300599 ?auto_300600 ) ( ON ?auto_300598 ?auto_300599 ) ( ON ?auto_300597 ?auto_300598 ) ( ON ?auto_300596 ?auto_300597 ) ( ON ?auto_300595 ?auto_300596 ) ( ON ?auto_300594 ?auto_300595 ) ( ON ?auto_300593 ?auto_300594 ) ( ON ?auto_300592 ?auto_300593 ) ( ON ?auto_300591 ?auto_300592 ) ( ON ?auto_300590 ?auto_300591 ) ( ON ?auto_300589 ?auto_300590 ) ( ON ?auto_300588 ?auto_300589 ) ( ON ?auto_300587 ?auto_300588 ) ( CLEAR ?auto_300587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_300587 )
      ( MAKE-14PILE ?auto_300587 ?auto_300588 ?auto_300589 ?auto_300590 ?auto_300591 ?auto_300592 ?auto_300593 ?auto_300594 ?auto_300595 ?auto_300596 ?auto_300597 ?auto_300598 ?auto_300599 ?auto_300600 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_300615 - BLOCK
      ?auto_300616 - BLOCK
      ?auto_300617 - BLOCK
      ?auto_300618 - BLOCK
      ?auto_300619 - BLOCK
      ?auto_300620 - BLOCK
      ?auto_300621 - BLOCK
      ?auto_300622 - BLOCK
      ?auto_300623 - BLOCK
      ?auto_300624 - BLOCK
      ?auto_300625 - BLOCK
      ?auto_300626 - BLOCK
      ?auto_300627 - BLOCK
      ?auto_300628 - BLOCK
    )
    :vars
    (
      ?auto_300629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_300615 ?auto_300616 ) ) ( not ( = ?auto_300615 ?auto_300617 ) ) ( not ( = ?auto_300615 ?auto_300618 ) ) ( not ( = ?auto_300615 ?auto_300619 ) ) ( not ( = ?auto_300615 ?auto_300620 ) ) ( not ( = ?auto_300615 ?auto_300621 ) ) ( not ( = ?auto_300615 ?auto_300622 ) ) ( not ( = ?auto_300615 ?auto_300623 ) ) ( not ( = ?auto_300615 ?auto_300624 ) ) ( not ( = ?auto_300615 ?auto_300625 ) ) ( not ( = ?auto_300615 ?auto_300626 ) ) ( not ( = ?auto_300615 ?auto_300627 ) ) ( not ( = ?auto_300615 ?auto_300628 ) ) ( not ( = ?auto_300616 ?auto_300617 ) ) ( not ( = ?auto_300616 ?auto_300618 ) ) ( not ( = ?auto_300616 ?auto_300619 ) ) ( not ( = ?auto_300616 ?auto_300620 ) ) ( not ( = ?auto_300616 ?auto_300621 ) ) ( not ( = ?auto_300616 ?auto_300622 ) ) ( not ( = ?auto_300616 ?auto_300623 ) ) ( not ( = ?auto_300616 ?auto_300624 ) ) ( not ( = ?auto_300616 ?auto_300625 ) ) ( not ( = ?auto_300616 ?auto_300626 ) ) ( not ( = ?auto_300616 ?auto_300627 ) ) ( not ( = ?auto_300616 ?auto_300628 ) ) ( not ( = ?auto_300617 ?auto_300618 ) ) ( not ( = ?auto_300617 ?auto_300619 ) ) ( not ( = ?auto_300617 ?auto_300620 ) ) ( not ( = ?auto_300617 ?auto_300621 ) ) ( not ( = ?auto_300617 ?auto_300622 ) ) ( not ( = ?auto_300617 ?auto_300623 ) ) ( not ( = ?auto_300617 ?auto_300624 ) ) ( not ( = ?auto_300617 ?auto_300625 ) ) ( not ( = ?auto_300617 ?auto_300626 ) ) ( not ( = ?auto_300617 ?auto_300627 ) ) ( not ( = ?auto_300617 ?auto_300628 ) ) ( not ( = ?auto_300618 ?auto_300619 ) ) ( not ( = ?auto_300618 ?auto_300620 ) ) ( not ( = ?auto_300618 ?auto_300621 ) ) ( not ( = ?auto_300618 ?auto_300622 ) ) ( not ( = ?auto_300618 ?auto_300623 ) ) ( not ( = ?auto_300618 ?auto_300624 ) ) ( not ( = ?auto_300618 ?auto_300625 ) ) ( not ( = ?auto_300618 ?auto_300626 ) ) ( not ( = ?auto_300618 ?auto_300627 ) ) ( not ( = ?auto_300618 ?auto_300628 ) ) ( not ( = ?auto_300619 ?auto_300620 ) ) ( not ( = ?auto_300619 ?auto_300621 ) ) ( not ( = ?auto_300619 ?auto_300622 ) ) ( not ( = ?auto_300619 ?auto_300623 ) ) ( not ( = ?auto_300619 ?auto_300624 ) ) ( not ( = ?auto_300619 ?auto_300625 ) ) ( not ( = ?auto_300619 ?auto_300626 ) ) ( not ( = ?auto_300619 ?auto_300627 ) ) ( not ( = ?auto_300619 ?auto_300628 ) ) ( not ( = ?auto_300620 ?auto_300621 ) ) ( not ( = ?auto_300620 ?auto_300622 ) ) ( not ( = ?auto_300620 ?auto_300623 ) ) ( not ( = ?auto_300620 ?auto_300624 ) ) ( not ( = ?auto_300620 ?auto_300625 ) ) ( not ( = ?auto_300620 ?auto_300626 ) ) ( not ( = ?auto_300620 ?auto_300627 ) ) ( not ( = ?auto_300620 ?auto_300628 ) ) ( not ( = ?auto_300621 ?auto_300622 ) ) ( not ( = ?auto_300621 ?auto_300623 ) ) ( not ( = ?auto_300621 ?auto_300624 ) ) ( not ( = ?auto_300621 ?auto_300625 ) ) ( not ( = ?auto_300621 ?auto_300626 ) ) ( not ( = ?auto_300621 ?auto_300627 ) ) ( not ( = ?auto_300621 ?auto_300628 ) ) ( not ( = ?auto_300622 ?auto_300623 ) ) ( not ( = ?auto_300622 ?auto_300624 ) ) ( not ( = ?auto_300622 ?auto_300625 ) ) ( not ( = ?auto_300622 ?auto_300626 ) ) ( not ( = ?auto_300622 ?auto_300627 ) ) ( not ( = ?auto_300622 ?auto_300628 ) ) ( not ( = ?auto_300623 ?auto_300624 ) ) ( not ( = ?auto_300623 ?auto_300625 ) ) ( not ( = ?auto_300623 ?auto_300626 ) ) ( not ( = ?auto_300623 ?auto_300627 ) ) ( not ( = ?auto_300623 ?auto_300628 ) ) ( not ( = ?auto_300624 ?auto_300625 ) ) ( not ( = ?auto_300624 ?auto_300626 ) ) ( not ( = ?auto_300624 ?auto_300627 ) ) ( not ( = ?auto_300624 ?auto_300628 ) ) ( not ( = ?auto_300625 ?auto_300626 ) ) ( not ( = ?auto_300625 ?auto_300627 ) ) ( not ( = ?auto_300625 ?auto_300628 ) ) ( not ( = ?auto_300626 ?auto_300627 ) ) ( not ( = ?auto_300626 ?auto_300628 ) ) ( not ( = ?auto_300627 ?auto_300628 ) ) ( ON ?auto_300615 ?auto_300629 ) ( not ( = ?auto_300628 ?auto_300629 ) ) ( not ( = ?auto_300627 ?auto_300629 ) ) ( not ( = ?auto_300626 ?auto_300629 ) ) ( not ( = ?auto_300625 ?auto_300629 ) ) ( not ( = ?auto_300624 ?auto_300629 ) ) ( not ( = ?auto_300623 ?auto_300629 ) ) ( not ( = ?auto_300622 ?auto_300629 ) ) ( not ( = ?auto_300621 ?auto_300629 ) ) ( not ( = ?auto_300620 ?auto_300629 ) ) ( not ( = ?auto_300619 ?auto_300629 ) ) ( not ( = ?auto_300618 ?auto_300629 ) ) ( not ( = ?auto_300617 ?auto_300629 ) ) ( not ( = ?auto_300616 ?auto_300629 ) ) ( not ( = ?auto_300615 ?auto_300629 ) ) ( ON ?auto_300616 ?auto_300615 ) ( ON ?auto_300617 ?auto_300616 ) ( ON ?auto_300618 ?auto_300617 ) ( ON ?auto_300619 ?auto_300618 ) ( ON ?auto_300620 ?auto_300619 ) ( ON ?auto_300621 ?auto_300620 ) ( ON ?auto_300622 ?auto_300621 ) ( ON ?auto_300623 ?auto_300622 ) ( ON ?auto_300624 ?auto_300623 ) ( ON ?auto_300625 ?auto_300624 ) ( ON ?auto_300626 ?auto_300625 ) ( ON ?auto_300627 ?auto_300626 ) ( ON ?auto_300628 ?auto_300627 ) ( CLEAR ?auto_300628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_300628 ?auto_300627 ?auto_300626 ?auto_300625 ?auto_300624 ?auto_300623 ?auto_300622 ?auto_300621 ?auto_300620 ?auto_300619 ?auto_300618 ?auto_300617 ?auto_300616 ?auto_300615 )
      ( MAKE-14PILE ?auto_300615 ?auto_300616 ?auto_300617 ?auto_300618 ?auto_300619 ?auto_300620 ?auto_300621 ?auto_300622 ?auto_300623 ?auto_300624 ?auto_300625 ?auto_300626 ?auto_300627 ?auto_300628 ) )
  )

)

