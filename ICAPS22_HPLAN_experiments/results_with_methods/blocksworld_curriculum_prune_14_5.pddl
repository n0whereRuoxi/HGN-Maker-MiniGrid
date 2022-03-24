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

