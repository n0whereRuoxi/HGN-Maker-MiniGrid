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

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50476 - BLOCK
      ?auto_50477 - BLOCK
      ?auto_50478 - BLOCK
      ?auto_50479 - BLOCK
      ?auto_50480 - BLOCK
      ?auto_50481 - BLOCK
    )
    :vars
    (
      ?auto_50482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50482 ?auto_50481 ) ( CLEAR ?auto_50482 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50476 ) ( ON ?auto_50477 ?auto_50476 ) ( ON ?auto_50478 ?auto_50477 ) ( ON ?auto_50479 ?auto_50478 ) ( ON ?auto_50480 ?auto_50479 ) ( ON ?auto_50481 ?auto_50480 ) ( not ( = ?auto_50476 ?auto_50477 ) ) ( not ( = ?auto_50476 ?auto_50478 ) ) ( not ( = ?auto_50476 ?auto_50479 ) ) ( not ( = ?auto_50476 ?auto_50480 ) ) ( not ( = ?auto_50476 ?auto_50481 ) ) ( not ( = ?auto_50476 ?auto_50482 ) ) ( not ( = ?auto_50477 ?auto_50478 ) ) ( not ( = ?auto_50477 ?auto_50479 ) ) ( not ( = ?auto_50477 ?auto_50480 ) ) ( not ( = ?auto_50477 ?auto_50481 ) ) ( not ( = ?auto_50477 ?auto_50482 ) ) ( not ( = ?auto_50478 ?auto_50479 ) ) ( not ( = ?auto_50478 ?auto_50480 ) ) ( not ( = ?auto_50478 ?auto_50481 ) ) ( not ( = ?auto_50478 ?auto_50482 ) ) ( not ( = ?auto_50479 ?auto_50480 ) ) ( not ( = ?auto_50479 ?auto_50481 ) ) ( not ( = ?auto_50479 ?auto_50482 ) ) ( not ( = ?auto_50480 ?auto_50481 ) ) ( not ( = ?auto_50480 ?auto_50482 ) ) ( not ( = ?auto_50481 ?auto_50482 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50482 ?auto_50481 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50484 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_50484 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_50484 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50485 - BLOCK
    )
    :vars
    (
      ?auto_50486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50485 ?auto_50486 ) ( CLEAR ?auto_50485 ) ( HAND-EMPTY ) ( not ( = ?auto_50485 ?auto_50486 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50485 ?auto_50486 )
      ( MAKE-1PILE ?auto_50485 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50492 - BLOCK
      ?auto_50493 - BLOCK
      ?auto_50494 - BLOCK
      ?auto_50495 - BLOCK
      ?auto_50496 - BLOCK
    )
    :vars
    (
      ?auto_50497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50497 ?auto_50496 ) ( CLEAR ?auto_50497 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50492 ) ( ON ?auto_50493 ?auto_50492 ) ( ON ?auto_50494 ?auto_50493 ) ( ON ?auto_50495 ?auto_50494 ) ( ON ?auto_50496 ?auto_50495 ) ( not ( = ?auto_50492 ?auto_50493 ) ) ( not ( = ?auto_50492 ?auto_50494 ) ) ( not ( = ?auto_50492 ?auto_50495 ) ) ( not ( = ?auto_50492 ?auto_50496 ) ) ( not ( = ?auto_50492 ?auto_50497 ) ) ( not ( = ?auto_50493 ?auto_50494 ) ) ( not ( = ?auto_50493 ?auto_50495 ) ) ( not ( = ?auto_50493 ?auto_50496 ) ) ( not ( = ?auto_50493 ?auto_50497 ) ) ( not ( = ?auto_50494 ?auto_50495 ) ) ( not ( = ?auto_50494 ?auto_50496 ) ) ( not ( = ?auto_50494 ?auto_50497 ) ) ( not ( = ?auto_50495 ?auto_50496 ) ) ( not ( = ?auto_50495 ?auto_50497 ) ) ( not ( = ?auto_50496 ?auto_50497 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50497 ?auto_50496 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50498 - BLOCK
      ?auto_50499 - BLOCK
      ?auto_50500 - BLOCK
      ?auto_50501 - BLOCK
      ?auto_50502 - BLOCK
    )
    :vars
    (
      ?auto_50503 - BLOCK
      ?auto_50504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50503 ?auto_50502 ) ( CLEAR ?auto_50503 ) ( ON-TABLE ?auto_50498 ) ( ON ?auto_50499 ?auto_50498 ) ( ON ?auto_50500 ?auto_50499 ) ( ON ?auto_50501 ?auto_50500 ) ( ON ?auto_50502 ?auto_50501 ) ( not ( = ?auto_50498 ?auto_50499 ) ) ( not ( = ?auto_50498 ?auto_50500 ) ) ( not ( = ?auto_50498 ?auto_50501 ) ) ( not ( = ?auto_50498 ?auto_50502 ) ) ( not ( = ?auto_50498 ?auto_50503 ) ) ( not ( = ?auto_50499 ?auto_50500 ) ) ( not ( = ?auto_50499 ?auto_50501 ) ) ( not ( = ?auto_50499 ?auto_50502 ) ) ( not ( = ?auto_50499 ?auto_50503 ) ) ( not ( = ?auto_50500 ?auto_50501 ) ) ( not ( = ?auto_50500 ?auto_50502 ) ) ( not ( = ?auto_50500 ?auto_50503 ) ) ( not ( = ?auto_50501 ?auto_50502 ) ) ( not ( = ?auto_50501 ?auto_50503 ) ) ( not ( = ?auto_50502 ?auto_50503 ) ) ( HOLDING ?auto_50504 ) ( not ( = ?auto_50498 ?auto_50504 ) ) ( not ( = ?auto_50499 ?auto_50504 ) ) ( not ( = ?auto_50500 ?auto_50504 ) ) ( not ( = ?auto_50501 ?auto_50504 ) ) ( not ( = ?auto_50502 ?auto_50504 ) ) ( not ( = ?auto_50503 ?auto_50504 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_50504 )
      ( MAKE-5PILE ?auto_50498 ?auto_50499 ?auto_50500 ?auto_50501 ?auto_50502 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50505 - BLOCK
      ?auto_50506 - BLOCK
      ?auto_50507 - BLOCK
      ?auto_50508 - BLOCK
      ?auto_50509 - BLOCK
    )
    :vars
    (
      ?auto_50511 - BLOCK
      ?auto_50510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50511 ?auto_50509 ) ( ON-TABLE ?auto_50505 ) ( ON ?auto_50506 ?auto_50505 ) ( ON ?auto_50507 ?auto_50506 ) ( ON ?auto_50508 ?auto_50507 ) ( ON ?auto_50509 ?auto_50508 ) ( not ( = ?auto_50505 ?auto_50506 ) ) ( not ( = ?auto_50505 ?auto_50507 ) ) ( not ( = ?auto_50505 ?auto_50508 ) ) ( not ( = ?auto_50505 ?auto_50509 ) ) ( not ( = ?auto_50505 ?auto_50511 ) ) ( not ( = ?auto_50506 ?auto_50507 ) ) ( not ( = ?auto_50506 ?auto_50508 ) ) ( not ( = ?auto_50506 ?auto_50509 ) ) ( not ( = ?auto_50506 ?auto_50511 ) ) ( not ( = ?auto_50507 ?auto_50508 ) ) ( not ( = ?auto_50507 ?auto_50509 ) ) ( not ( = ?auto_50507 ?auto_50511 ) ) ( not ( = ?auto_50508 ?auto_50509 ) ) ( not ( = ?auto_50508 ?auto_50511 ) ) ( not ( = ?auto_50509 ?auto_50511 ) ) ( not ( = ?auto_50505 ?auto_50510 ) ) ( not ( = ?auto_50506 ?auto_50510 ) ) ( not ( = ?auto_50507 ?auto_50510 ) ) ( not ( = ?auto_50508 ?auto_50510 ) ) ( not ( = ?auto_50509 ?auto_50510 ) ) ( not ( = ?auto_50511 ?auto_50510 ) ) ( ON ?auto_50510 ?auto_50511 ) ( CLEAR ?auto_50510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50505 ?auto_50506 ?auto_50507 ?auto_50508 ?auto_50509 ?auto_50511 )
      ( MAKE-5PILE ?auto_50505 ?auto_50506 ?auto_50507 ?auto_50508 ?auto_50509 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_50514 - BLOCK
      ?auto_50515 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_50515 ) ( CLEAR ?auto_50514 ) ( ON-TABLE ?auto_50514 ) ( not ( = ?auto_50514 ?auto_50515 ) ) )
    :subtasks
    ( ( !STACK ?auto_50515 ?auto_50514 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_50516 - BLOCK
      ?auto_50517 - BLOCK
    )
    :vars
    (
      ?auto_50518 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_50516 ) ( ON-TABLE ?auto_50516 ) ( not ( = ?auto_50516 ?auto_50517 ) ) ( ON ?auto_50517 ?auto_50518 ) ( CLEAR ?auto_50517 ) ( HAND-EMPTY ) ( not ( = ?auto_50516 ?auto_50518 ) ) ( not ( = ?auto_50517 ?auto_50518 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50517 ?auto_50518 )
      ( MAKE-2PILE ?auto_50516 ?auto_50517 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_50519 - BLOCK
      ?auto_50520 - BLOCK
    )
    :vars
    (
      ?auto_50521 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50519 ?auto_50520 ) ) ( ON ?auto_50520 ?auto_50521 ) ( CLEAR ?auto_50520 ) ( not ( = ?auto_50519 ?auto_50521 ) ) ( not ( = ?auto_50520 ?auto_50521 ) ) ( HOLDING ?auto_50519 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50519 )
      ( MAKE-2PILE ?auto_50519 ?auto_50520 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_50522 - BLOCK
      ?auto_50523 - BLOCK
    )
    :vars
    (
      ?auto_50524 - BLOCK
      ?auto_50527 - BLOCK
      ?auto_50525 - BLOCK
      ?auto_50528 - BLOCK
      ?auto_50526 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50522 ?auto_50523 ) ) ( ON ?auto_50523 ?auto_50524 ) ( not ( = ?auto_50522 ?auto_50524 ) ) ( not ( = ?auto_50523 ?auto_50524 ) ) ( ON ?auto_50522 ?auto_50523 ) ( CLEAR ?auto_50522 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50527 ) ( ON ?auto_50525 ?auto_50527 ) ( ON ?auto_50528 ?auto_50525 ) ( ON ?auto_50526 ?auto_50528 ) ( ON ?auto_50524 ?auto_50526 ) ( not ( = ?auto_50527 ?auto_50525 ) ) ( not ( = ?auto_50527 ?auto_50528 ) ) ( not ( = ?auto_50527 ?auto_50526 ) ) ( not ( = ?auto_50527 ?auto_50524 ) ) ( not ( = ?auto_50527 ?auto_50523 ) ) ( not ( = ?auto_50527 ?auto_50522 ) ) ( not ( = ?auto_50525 ?auto_50528 ) ) ( not ( = ?auto_50525 ?auto_50526 ) ) ( not ( = ?auto_50525 ?auto_50524 ) ) ( not ( = ?auto_50525 ?auto_50523 ) ) ( not ( = ?auto_50525 ?auto_50522 ) ) ( not ( = ?auto_50528 ?auto_50526 ) ) ( not ( = ?auto_50528 ?auto_50524 ) ) ( not ( = ?auto_50528 ?auto_50523 ) ) ( not ( = ?auto_50528 ?auto_50522 ) ) ( not ( = ?auto_50526 ?auto_50524 ) ) ( not ( = ?auto_50526 ?auto_50523 ) ) ( not ( = ?auto_50526 ?auto_50522 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50527 ?auto_50525 ?auto_50528 ?auto_50526 ?auto_50524 ?auto_50523 )
      ( MAKE-2PILE ?auto_50522 ?auto_50523 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50533 - BLOCK
      ?auto_50534 - BLOCK
      ?auto_50535 - BLOCK
      ?auto_50536 - BLOCK
    )
    :vars
    (
      ?auto_50537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50537 ?auto_50536 ) ( CLEAR ?auto_50537 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50533 ) ( ON ?auto_50534 ?auto_50533 ) ( ON ?auto_50535 ?auto_50534 ) ( ON ?auto_50536 ?auto_50535 ) ( not ( = ?auto_50533 ?auto_50534 ) ) ( not ( = ?auto_50533 ?auto_50535 ) ) ( not ( = ?auto_50533 ?auto_50536 ) ) ( not ( = ?auto_50533 ?auto_50537 ) ) ( not ( = ?auto_50534 ?auto_50535 ) ) ( not ( = ?auto_50534 ?auto_50536 ) ) ( not ( = ?auto_50534 ?auto_50537 ) ) ( not ( = ?auto_50535 ?auto_50536 ) ) ( not ( = ?auto_50535 ?auto_50537 ) ) ( not ( = ?auto_50536 ?auto_50537 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50537 ?auto_50536 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50538 - BLOCK
      ?auto_50539 - BLOCK
      ?auto_50540 - BLOCK
      ?auto_50541 - BLOCK
    )
    :vars
    (
      ?auto_50542 - BLOCK
      ?auto_50543 - BLOCK
      ?auto_50544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50542 ?auto_50541 ) ( CLEAR ?auto_50542 ) ( ON-TABLE ?auto_50538 ) ( ON ?auto_50539 ?auto_50538 ) ( ON ?auto_50540 ?auto_50539 ) ( ON ?auto_50541 ?auto_50540 ) ( not ( = ?auto_50538 ?auto_50539 ) ) ( not ( = ?auto_50538 ?auto_50540 ) ) ( not ( = ?auto_50538 ?auto_50541 ) ) ( not ( = ?auto_50538 ?auto_50542 ) ) ( not ( = ?auto_50539 ?auto_50540 ) ) ( not ( = ?auto_50539 ?auto_50541 ) ) ( not ( = ?auto_50539 ?auto_50542 ) ) ( not ( = ?auto_50540 ?auto_50541 ) ) ( not ( = ?auto_50540 ?auto_50542 ) ) ( not ( = ?auto_50541 ?auto_50542 ) ) ( HOLDING ?auto_50543 ) ( CLEAR ?auto_50544 ) ( not ( = ?auto_50538 ?auto_50543 ) ) ( not ( = ?auto_50538 ?auto_50544 ) ) ( not ( = ?auto_50539 ?auto_50543 ) ) ( not ( = ?auto_50539 ?auto_50544 ) ) ( not ( = ?auto_50540 ?auto_50543 ) ) ( not ( = ?auto_50540 ?auto_50544 ) ) ( not ( = ?auto_50541 ?auto_50543 ) ) ( not ( = ?auto_50541 ?auto_50544 ) ) ( not ( = ?auto_50542 ?auto_50543 ) ) ( not ( = ?auto_50542 ?auto_50544 ) ) ( not ( = ?auto_50543 ?auto_50544 ) ) )
    :subtasks
    ( ( !STACK ?auto_50543 ?auto_50544 )
      ( MAKE-4PILE ?auto_50538 ?auto_50539 ?auto_50540 ?auto_50541 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51144 - BLOCK
      ?auto_51145 - BLOCK
      ?auto_51146 - BLOCK
      ?auto_51147 - BLOCK
    )
    :vars
    (
      ?auto_51149 - BLOCK
      ?auto_51148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51149 ?auto_51147 ) ( ON-TABLE ?auto_51144 ) ( ON ?auto_51145 ?auto_51144 ) ( ON ?auto_51146 ?auto_51145 ) ( ON ?auto_51147 ?auto_51146 ) ( not ( = ?auto_51144 ?auto_51145 ) ) ( not ( = ?auto_51144 ?auto_51146 ) ) ( not ( = ?auto_51144 ?auto_51147 ) ) ( not ( = ?auto_51144 ?auto_51149 ) ) ( not ( = ?auto_51145 ?auto_51146 ) ) ( not ( = ?auto_51145 ?auto_51147 ) ) ( not ( = ?auto_51145 ?auto_51149 ) ) ( not ( = ?auto_51146 ?auto_51147 ) ) ( not ( = ?auto_51146 ?auto_51149 ) ) ( not ( = ?auto_51147 ?auto_51149 ) ) ( not ( = ?auto_51144 ?auto_51148 ) ) ( not ( = ?auto_51145 ?auto_51148 ) ) ( not ( = ?auto_51146 ?auto_51148 ) ) ( not ( = ?auto_51147 ?auto_51148 ) ) ( not ( = ?auto_51149 ?auto_51148 ) ) ( ON ?auto_51148 ?auto_51149 ) ( CLEAR ?auto_51148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51144 ?auto_51145 ?auto_51146 ?auto_51147 ?auto_51149 )
      ( MAKE-4PILE ?auto_51144 ?auto_51145 ?auto_51146 ?auto_51147 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50552 - BLOCK
      ?auto_50553 - BLOCK
      ?auto_50554 - BLOCK
      ?auto_50555 - BLOCK
    )
    :vars
    (
      ?auto_50558 - BLOCK
      ?auto_50556 - BLOCK
      ?auto_50557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50558 ?auto_50555 ) ( ON-TABLE ?auto_50552 ) ( ON ?auto_50553 ?auto_50552 ) ( ON ?auto_50554 ?auto_50553 ) ( ON ?auto_50555 ?auto_50554 ) ( not ( = ?auto_50552 ?auto_50553 ) ) ( not ( = ?auto_50552 ?auto_50554 ) ) ( not ( = ?auto_50552 ?auto_50555 ) ) ( not ( = ?auto_50552 ?auto_50558 ) ) ( not ( = ?auto_50553 ?auto_50554 ) ) ( not ( = ?auto_50553 ?auto_50555 ) ) ( not ( = ?auto_50553 ?auto_50558 ) ) ( not ( = ?auto_50554 ?auto_50555 ) ) ( not ( = ?auto_50554 ?auto_50558 ) ) ( not ( = ?auto_50555 ?auto_50558 ) ) ( not ( = ?auto_50552 ?auto_50556 ) ) ( not ( = ?auto_50552 ?auto_50557 ) ) ( not ( = ?auto_50553 ?auto_50556 ) ) ( not ( = ?auto_50553 ?auto_50557 ) ) ( not ( = ?auto_50554 ?auto_50556 ) ) ( not ( = ?auto_50554 ?auto_50557 ) ) ( not ( = ?auto_50555 ?auto_50556 ) ) ( not ( = ?auto_50555 ?auto_50557 ) ) ( not ( = ?auto_50558 ?auto_50556 ) ) ( not ( = ?auto_50558 ?auto_50557 ) ) ( not ( = ?auto_50556 ?auto_50557 ) ) ( ON ?auto_50556 ?auto_50558 ) ( CLEAR ?auto_50556 ) ( HOLDING ?auto_50557 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50557 )
      ( MAKE-4PILE ?auto_50552 ?auto_50553 ?auto_50554 ?auto_50555 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50559 - BLOCK
      ?auto_50560 - BLOCK
      ?auto_50561 - BLOCK
      ?auto_50562 - BLOCK
    )
    :vars
    (
      ?auto_50565 - BLOCK
      ?auto_50564 - BLOCK
      ?auto_50563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50565 ?auto_50562 ) ( ON-TABLE ?auto_50559 ) ( ON ?auto_50560 ?auto_50559 ) ( ON ?auto_50561 ?auto_50560 ) ( ON ?auto_50562 ?auto_50561 ) ( not ( = ?auto_50559 ?auto_50560 ) ) ( not ( = ?auto_50559 ?auto_50561 ) ) ( not ( = ?auto_50559 ?auto_50562 ) ) ( not ( = ?auto_50559 ?auto_50565 ) ) ( not ( = ?auto_50560 ?auto_50561 ) ) ( not ( = ?auto_50560 ?auto_50562 ) ) ( not ( = ?auto_50560 ?auto_50565 ) ) ( not ( = ?auto_50561 ?auto_50562 ) ) ( not ( = ?auto_50561 ?auto_50565 ) ) ( not ( = ?auto_50562 ?auto_50565 ) ) ( not ( = ?auto_50559 ?auto_50564 ) ) ( not ( = ?auto_50559 ?auto_50563 ) ) ( not ( = ?auto_50560 ?auto_50564 ) ) ( not ( = ?auto_50560 ?auto_50563 ) ) ( not ( = ?auto_50561 ?auto_50564 ) ) ( not ( = ?auto_50561 ?auto_50563 ) ) ( not ( = ?auto_50562 ?auto_50564 ) ) ( not ( = ?auto_50562 ?auto_50563 ) ) ( not ( = ?auto_50565 ?auto_50564 ) ) ( not ( = ?auto_50565 ?auto_50563 ) ) ( not ( = ?auto_50564 ?auto_50563 ) ) ( ON ?auto_50564 ?auto_50565 ) ( ON ?auto_50563 ?auto_50564 ) ( CLEAR ?auto_50563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50559 ?auto_50560 ?auto_50561 ?auto_50562 ?auto_50565 ?auto_50564 )
      ( MAKE-4PILE ?auto_50559 ?auto_50560 ?auto_50561 ?auto_50562 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50569 - BLOCK
      ?auto_50570 - BLOCK
      ?auto_50571 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_50571 ) ( CLEAR ?auto_50570 ) ( ON-TABLE ?auto_50569 ) ( ON ?auto_50570 ?auto_50569 ) ( not ( = ?auto_50569 ?auto_50570 ) ) ( not ( = ?auto_50569 ?auto_50571 ) ) ( not ( = ?auto_50570 ?auto_50571 ) ) )
    :subtasks
    ( ( !STACK ?auto_50571 ?auto_50570 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50572 - BLOCK
      ?auto_50573 - BLOCK
      ?auto_50574 - BLOCK
    )
    :vars
    (
      ?auto_50575 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_50573 ) ( ON-TABLE ?auto_50572 ) ( ON ?auto_50573 ?auto_50572 ) ( not ( = ?auto_50572 ?auto_50573 ) ) ( not ( = ?auto_50572 ?auto_50574 ) ) ( not ( = ?auto_50573 ?auto_50574 ) ) ( ON ?auto_50574 ?auto_50575 ) ( CLEAR ?auto_50574 ) ( HAND-EMPTY ) ( not ( = ?auto_50572 ?auto_50575 ) ) ( not ( = ?auto_50573 ?auto_50575 ) ) ( not ( = ?auto_50574 ?auto_50575 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50574 ?auto_50575 )
      ( MAKE-3PILE ?auto_50572 ?auto_50573 ?auto_50574 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50576 - BLOCK
      ?auto_50577 - BLOCK
      ?auto_50578 - BLOCK
    )
    :vars
    (
      ?auto_50579 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50576 ) ( not ( = ?auto_50576 ?auto_50577 ) ) ( not ( = ?auto_50576 ?auto_50578 ) ) ( not ( = ?auto_50577 ?auto_50578 ) ) ( ON ?auto_50578 ?auto_50579 ) ( CLEAR ?auto_50578 ) ( not ( = ?auto_50576 ?auto_50579 ) ) ( not ( = ?auto_50577 ?auto_50579 ) ) ( not ( = ?auto_50578 ?auto_50579 ) ) ( HOLDING ?auto_50577 ) ( CLEAR ?auto_50576 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50576 ?auto_50577 )
      ( MAKE-3PILE ?auto_50576 ?auto_50577 ?auto_50578 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50580 - BLOCK
      ?auto_50581 - BLOCK
      ?auto_50582 - BLOCK
    )
    :vars
    (
      ?auto_50583 - BLOCK
      ?auto_50584 - BLOCK
      ?auto_50586 - BLOCK
      ?auto_50585 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50580 ) ( not ( = ?auto_50580 ?auto_50581 ) ) ( not ( = ?auto_50580 ?auto_50582 ) ) ( not ( = ?auto_50581 ?auto_50582 ) ) ( ON ?auto_50582 ?auto_50583 ) ( not ( = ?auto_50580 ?auto_50583 ) ) ( not ( = ?auto_50581 ?auto_50583 ) ) ( not ( = ?auto_50582 ?auto_50583 ) ) ( CLEAR ?auto_50580 ) ( ON ?auto_50581 ?auto_50582 ) ( CLEAR ?auto_50581 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50584 ) ( ON ?auto_50586 ?auto_50584 ) ( ON ?auto_50585 ?auto_50586 ) ( ON ?auto_50583 ?auto_50585 ) ( not ( = ?auto_50584 ?auto_50586 ) ) ( not ( = ?auto_50584 ?auto_50585 ) ) ( not ( = ?auto_50584 ?auto_50583 ) ) ( not ( = ?auto_50584 ?auto_50582 ) ) ( not ( = ?auto_50584 ?auto_50581 ) ) ( not ( = ?auto_50586 ?auto_50585 ) ) ( not ( = ?auto_50586 ?auto_50583 ) ) ( not ( = ?auto_50586 ?auto_50582 ) ) ( not ( = ?auto_50586 ?auto_50581 ) ) ( not ( = ?auto_50585 ?auto_50583 ) ) ( not ( = ?auto_50585 ?auto_50582 ) ) ( not ( = ?auto_50585 ?auto_50581 ) ) ( not ( = ?auto_50580 ?auto_50584 ) ) ( not ( = ?auto_50580 ?auto_50586 ) ) ( not ( = ?auto_50580 ?auto_50585 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50584 ?auto_50586 ?auto_50585 ?auto_50583 ?auto_50582 )
      ( MAKE-3PILE ?auto_50580 ?auto_50581 ?auto_50582 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50587 - BLOCK
      ?auto_50588 - BLOCK
      ?auto_50589 - BLOCK
    )
    :vars
    (
      ?auto_50592 - BLOCK
      ?auto_50593 - BLOCK
      ?auto_50590 - BLOCK
      ?auto_50591 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50587 ?auto_50588 ) ) ( not ( = ?auto_50587 ?auto_50589 ) ) ( not ( = ?auto_50588 ?auto_50589 ) ) ( ON ?auto_50589 ?auto_50592 ) ( not ( = ?auto_50587 ?auto_50592 ) ) ( not ( = ?auto_50588 ?auto_50592 ) ) ( not ( = ?auto_50589 ?auto_50592 ) ) ( ON ?auto_50588 ?auto_50589 ) ( CLEAR ?auto_50588 ) ( ON-TABLE ?auto_50593 ) ( ON ?auto_50590 ?auto_50593 ) ( ON ?auto_50591 ?auto_50590 ) ( ON ?auto_50592 ?auto_50591 ) ( not ( = ?auto_50593 ?auto_50590 ) ) ( not ( = ?auto_50593 ?auto_50591 ) ) ( not ( = ?auto_50593 ?auto_50592 ) ) ( not ( = ?auto_50593 ?auto_50589 ) ) ( not ( = ?auto_50593 ?auto_50588 ) ) ( not ( = ?auto_50590 ?auto_50591 ) ) ( not ( = ?auto_50590 ?auto_50592 ) ) ( not ( = ?auto_50590 ?auto_50589 ) ) ( not ( = ?auto_50590 ?auto_50588 ) ) ( not ( = ?auto_50591 ?auto_50592 ) ) ( not ( = ?auto_50591 ?auto_50589 ) ) ( not ( = ?auto_50591 ?auto_50588 ) ) ( not ( = ?auto_50587 ?auto_50593 ) ) ( not ( = ?auto_50587 ?auto_50590 ) ) ( not ( = ?auto_50587 ?auto_50591 ) ) ( HOLDING ?auto_50587 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50587 )
      ( MAKE-3PILE ?auto_50587 ?auto_50588 ?auto_50589 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50594 - BLOCK
      ?auto_50595 - BLOCK
      ?auto_50596 - BLOCK
    )
    :vars
    (
      ?auto_50597 - BLOCK
      ?auto_50600 - BLOCK
      ?auto_50598 - BLOCK
      ?auto_50599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50594 ?auto_50595 ) ) ( not ( = ?auto_50594 ?auto_50596 ) ) ( not ( = ?auto_50595 ?auto_50596 ) ) ( ON ?auto_50596 ?auto_50597 ) ( not ( = ?auto_50594 ?auto_50597 ) ) ( not ( = ?auto_50595 ?auto_50597 ) ) ( not ( = ?auto_50596 ?auto_50597 ) ) ( ON ?auto_50595 ?auto_50596 ) ( ON-TABLE ?auto_50600 ) ( ON ?auto_50598 ?auto_50600 ) ( ON ?auto_50599 ?auto_50598 ) ( ON ?auto_50597 ?auto_50599 ) ( not ( = ?auto_50600 ?auto_50598 ) ) ( not ( = ?auto_50600 ?auto_50599 ) ) ( not ( = ?auto_50600 ?auto_50597 ) ) ( not ( = ?auto_50600 ?auto_50596 ) ) ( not ( = ?auto_50600 ?auto_50595 ) ) ( not ( = ?auto_50598 ?auto_50599 ) ) ( not ( = ?auto_50598 ?auto_50597 ) ) ( not ( = ?auto_50598 ?auto_50596 ) ) ( not ( = ?auto_50598 ?auto_50595 ) ) ( not ( = ?auto_50599 ?auto_50597 ) ) ( not ( = ?auto_50599 ?auto_50596 ) ) ( not ( = ?auto_50599 ?auto_50595 ) ) ( not ( = ?auto_50594 ?auto_50600 ) ) ( not ( = ?auto_50594 ?auto_50598 ) ) ( not ( = ?auto_50594 ?auto_50599 ) ) ( ON ?auto_50594 ?auto_50595 ) ( CLEAR ?auto_50594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50600 ?auto_50598 ?auto_50599 ?auto_50597 ?auto_50596 ?auto_50595 )
      ( MAKE-3PILE ?auto_50594 ?auto_50595 ?auto_50596 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50604 - BLOCK
      ?auto_50605 - BLOCK
      ?auto_50606 - BLOCK
    )
    :vars
    (
      ?auto_50607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50607 ?auto_50606 ) ( CLEAR ?auto_50607 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50604 ) ( ON ?auto_50605 ?auto_50604 ) ( ON ?auto_50606 ?auto_50605 ) ( not ( = ?auto_50604 ?auto_50605 ) ) ( not ( = ?auto_50604 ?auto_50606 ) ) ( not ( = ?auto_50604 ?auto_50607 ) ) ( not ( = ?auto_50605 ?auto_50606 ) ) ( not ( = ?auto_50605 ?auto_50607 ) ) ( not ( = ?auto_50606 ?auto_50607 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50607 ?auto_50606 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50608 - BLOCK
      ?auto_50609 - BLOCK
      ?auto_50610 - BLOCK
    )
    :vars
    (
      ?auto_50611 - BLOCK
      ?auto_50612 - BLOCK
      ?auto_50613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50611 ?auto_50610 ) ( CLEAR ?auto_50611 ) ( ON-TABLE ?auto_50608 ) ( ON ?auto_50609 ?auto_50608 ) ( ON ?auto_50610 ?auto_50609 ) ( not ( = ?auto_50608 ?auto_50609 ) ) ( not ( = ?auto_50608 ?auto_50610 ) ) ( not ( = ?auto_50608 ?auto_50611 ) ) ( not ( = ?auto_50609 ?auto_50610 ) ) ( not ( = ?auto_50609 ?auto_50611 ) ) ( not ( = ?auto_50610 ?auto_50611 ) ) ( HOLDING ?auto_50612 ) ( CLEAR ?auto_50613 ) ( not ( = ?auto_50608 ?auto_50612 ) ) ( not ( = ?auto_50608 ?auto_50613 ) ) ( not ( = ?auto_50609 ?auto_50612 ) ) ( not ( = ?auto_50609 ?auto_50613 ) ) ( not ( = ?auto_50610 ?auto_50612 ) ) ( not ( = ?auto_50610 ?auto_50613 ) ) ( not ( = ?auto_50611 ?auto_50612 ) ) ( not ( = ?auto_50611 ?auto_50613 ) ) ( not ( = ?auto_50612 ?auto_50613 ) ) )
    :subtasks
    ( ( !STACK ?auto_50612 ?auto_50613 )
      ( MAKE-3PILE ?auto_50608 ?auto_50609 ?auto_50610 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50614 - BLOCK
      ?auto_50615 - BLOCK
      ?auto_50616 - BLOCK
    )
    :vars
    (
      ?auto_50617 - BLOCK
      ?auto_50619 - BLOCK
      ?auto_50618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50617 ?auto_50616 ) ( ON-TABLE ?auto_50614 ) ( ON ?auto_50615 ?auto_50614 ) ( ON ?auto_50616 ?auto_50615 ) ( not ( = ?auto_50614 ?auto_50615 ) ) ( not ( = ?auto_50614 ?auto_50616 ) ) ( not ( = ?auto_50614 ?auto_50617 ) ) ( not ( = ?auto_50615 ?auto_50616 ) ) ( not ( = ?auto_50615 ?auto_50617 ) ) ( not ( = ?auto_50616 ?auto_50617 ) ) ( CLEAR ?auto_50619 ) ( not ( = ?auto_50614 ?auto_50618 ) ) ( not ( = ?auto_50614 ?auto_50619 ) ) ( not ( = ?auto_50615 ?auto_50618 ) ) ( not ( = ?auto_50615 ?auto_50619 ) ) ( not ( = ?auto_50616 ?auto_50618 ) ) ( not ( = ?auto_50616 ?auto_50619 ) ) ( not ( = ?auto_50617 ?auto_50618 ) ) ( not ( = ?auto_50617 ?auto_50619 ) ) ( not ( = ?auto_50618 ?auto_50619 ) ) ( ON ?auto_50618 ?auto_50617 ) ( CLEAR ?auto_50618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50614 ?auto_50615 ?auto_50616 ?auto_50617 )
      ( MAKE-3PILE ?auto_50614 ?auto_50615 ?auto_50616 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50620 - BLOCK
      ?auto_50621 - BLOCK
      ?auto_50622 - BLOCK
    )
    :vars
    (
      ?auto_50624 - BLOCK
      ?auto_50625 - BLOCK
      ?auto_50623 - BLOCK
      ?auto_50626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50624 ?auto_50622 ) ( ON-TABLE ?auto_50620 ) ( ON ?auto_50621 ?auto_50620 ) ( ON ?auto_50622 ?auto_50621 ) ( not ( = ?auto_50620 ?auto_50621 ) ) ( not ( = ?auto_50620 ?auto_50622 ) ) ( not ( = ?auto_50620 ?auto_50624 ) ) ( not ( = ?auto_50621 ?auto_50622 ) ) ( not ( = ?auto_50621 ?auto_50624 ) ) ( not ( = ?auto_50622 ?auto_50624 ) ) ( not ( = ?auto_50620 ?auto_50625 ) ) ( not ( = ?auto_50620 ?auto_50623 ) ) ( not ( = ?auto_50621 ?auto_50625 ) ) ( not ( = ?auto_50621 ?auto_50623 ) ) ( not ( = ?auto_50622 ?auto_50625 ) ) ( not ( = ?auto_50622 ?auto_50623 ) ) ( not ( = ?auto_50624 ?auto_50625 ) ) ( not ( = ?auto_50624 ?auto_50623 ) ) ( not ( = ?auto_50625 ?auto_50623 ) ) ( ON ?auto_50625 ?auto_50624 ) ( CLEAR ?auto_50625 ) ( HOLDING ?auto_50623 ) ( CLEAR ?auto_50626 ) ( ON-TABLE ?auto_50626 ) ( not ( = ?auto_50626 ?auto_50623 ) ) ( not ( = ?auto_50620 ?auto_50626 ) ) ( not ( = ?auto_50621 ?auto_50626 ) ) ( not ( = ?auto_50622 ?auto_50626 ) ) ( not ( = ?auto_50624 ?auto_50626 ) ) ( not ( = ?auto_50625 ?auto_50626 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50626 ?auto_50623 )
      ( MAKE-3PILE ?auto_50620 ?auto_50621 ?auto_50622 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51318 - BLOCK
      ?auto_51319 - BLOCK
      ?auto_51320 - BLOCK
    )
    :vars
    (
      ?auto_51322 - BLOCK
      ?auto_51323 - BLOCK
      ?auto_51321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51322 ?auto_51320 ) ( ON-TABLE ?auto_51318 ) ( ON ?auto_51319 ?auto_51318 ) ( ON ?auto_51320 ?auto_51319 ) ( not ( = ?auto_51318 ?auto_51319 ) ) ( not ( = ?auto_51318 ?auto_51320 ) ) ( not ( = ?auto_51318 ?auto_51322 ) ) ( not ( = ?auto_51319 ?auto_51320 ) ) ( not ( = ?auto_51319 ?auto_51322 ) ) ( not ( = ?auto_51320 ?auto_51322 ) ) ( not ( = ?auto_51318 ?auto_51323 ) ) ( not ( = ?auto_51318 ?auto_51321 ) ) ( not ( = ?auto_51319 ?auto_51323 ) ) ( not ( = ?auto_51319 ?auto_51321 ) ) ( not ( = ?auto_51320 ?auto_51323 ) ) ( not ( = ?auto_51320 ?auto_51321 ) ) ( not ( = ?auto_51322 ?auto_51323 ) ) ( not ( = ?auto_51322 ?auto_51321 ) ) ( not ( = ?auto_51323 ?auto_51321 ) ) ( ON ?auto_51323 ?auto_51322 ) ( ON ?auto_51321 ?auto_51323 ) ( CLEAR ?auto_51321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51318 ?auto_51319 ?auto_51320 ?auto_51322 ?auto_51323 )
      ( MAKE-3PILE ?auto_51318 ?auto_51319 ?auto_51320 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50634 - BLOCK
      ?auto_50635 - BLOCK
      ?auto_50636 - BLOCK
    )
    :vars
    (
      ?auto_50637 - BLOCK
      ?auto_50639 - BLOCK
      ?auto_50640 - BLOCK
      ?auto_50638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50637 ?auto_50636 ) ( ON-TABLE ?auto_50634 ) ( ON ?auto_50635 ?auto_50634 ) ( ON ?auto_50636 ?auto_50635 ) ( not ( = ?auto_50634 ?auto_50635 ) ) ( not ( = ?auto_50634 ?auto_50636 ) ) ( not ( = ?auto_50634 ?auto_50637 ) ) ( not ( = ?auto_50635 ?auto_50636 ) ) ( not ( = ?auto_50635 ?auto_50637 ) ) ( not ( = ?auto_50636 ?auto_50637 ) ) ( not ( = ?auto_50634 ?auto_50639 ) ) ( not ( = ?auto_50634 ?auto_50640 ) ) ( not ( = ?auto_50635 ?auto_50639 ) ) ( not ( = ?auto_50635 ?auto_50640 ) ) ( not ( = ?auto_50636 ?auto_50639 ) ) ( not ( = ?auto_50636 ?auto_50640 ) ) ( not ( = ?auto_50637 ?auto_50639 ) ) ( not ( = ?auto_50637 ?auto_50640 ) ) ( not ( = ?auto_50639 ?auto_50640 ) ) ( ON ?auto_50639 ?auto_50637 ) ( not ( = ?auto_50638 ?auto_50640 ) ) ( not ( = ?auto_50634 ?auto_50638 ) ) ( not ( = ?auto_50635 ?auto_50638 ) ) ( not ( = ?auto_50636 ?auto_50638 ) ) ( not ( = ?auto_50637 ?auto_50638 ) ) ( not ( = ?auto_50639 ?auto_50638 ) ) ( ON ?auto_50640 ?auto_50639 ) ( CLEAR ?auto_50640 ) ( HOLDING ?auto_50638 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50638 )
      ( MAKE-3PILE ?auto_50634 ?auto_50635 ?auto_50636 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50641 - BLOCK
      ?auto_50642 - BLOCK
      ?auto_50643 - BLOCK
    )
    :vars
    (
      ?auto_50647 - BLOCK
      ?auto_50644 - BLOCK
      ?auto_50645 - BLOCK
      ?auto_50646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50647 ?auto_50643 ) ( ON-TABLE ?auto_50641 ) ( ON ?auto_50642 ?auto_50641 ) ( ON ?auto_50643 ?auto_50642 ) ( not ( = ?auto_50641 ?auto_50642 ) ) ( not ( = ?auto_50641 ?auto_50643 ) ) ( not ( = ?auto_50641 ?auto_50647 ) ) ( not ( = ?auto_50642 ?auto_50643 ) ) ( not ( = ?auto_50642 ?auto_50647 ) ) ( not ( = ?auto_50643 ?auto_50647 ) ) ( not ( = ?auto_50641 ?auto_50644 ) ) ( not ( = ?auto_50641 ?auto_50645 ) ) ( not ( = ?auto_50642 ?auto_50644 ) ) ( not ( = ?auto_50642 ?auto_50645 ) ) ( not ( = ?auto_50643 ?auto_50644 ) ) ( not ( = ?auto_50643 ?auto_50645 ) ) ( not ( = ?auto_50647 ?auto_50644 ) ) ( not ( = ?auto_50647 ?auto_50645 ) ) ( not ( = ?auto_50644 ?auto_50645 ) ) ( ON ?auto_50644 ?auto_50647 ) ( not ( = ?auto_50646 ?auto_50645 ) ) ( not ( = ?auto_50641 ?auto_50646 ) ) ( not ( = ?auto_50642 ?auto_50646 ) ) ( not ( = ?auto_50643 ?auto_50646 ) ) ( not ( = ?auto_50647 ?auto_50646 ) ) ( not ( = ?auto_50644 ?auto_50646 ) ) ( ON ?auto_50645 ?auto_50644 ) ( ON ?auto_50646 ?auto_50645 ) ( CLEAR ?auto_50646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50641 ?auto_50642 ?auto_50643 ?auto_50647 ?auto_50644 ?auto_50645 )
      ( MAKE-3PILE ?auto_50641 ?auto_50642 ?auto_50643 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50652 - BLOCK
      ?auto_50653 - BLOCK
      ?auto_50654 - BLOCK
      ?auto_50655 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_50655 ) ( CLEAR ?auto_50654 ) ( ON-TABLE ?auto_50652 ) ( ON ?auto_50653 ?auto_50652 ) ( ON ?auto_50654 ?auto_50653 ) ( not ( = ?auto_50652 ?auto_50653 ) ) ( not ( = ?auto_50652 ?auto_50654 ) ) ( not ( = ?auto_50652 ?auto_50655 ) ) ( not ( = ?auto_50653 ?auto_50654 ) ) ( not ( = ?auto_50653 ?auto_50655 ) ) ( not ( = ?auto_50654 ?auto_50655 ) ) )
    :subtasks
    ( ( !STACK ?auto_50655 ?auto_50654 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50656 - BLOCK
      ?auto_50657 - BLOCK
      ?auto_50658 - BLOCK
      ?auto_50659 - BLOCK
    )
    :vars
    (
      ?auto_50660 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_50658 ) ( ON-TABLE ?auto_50656 ) ( ON ?auto_50657 ?auto_50656 ) ( ON ?auto_50658 ?auto_50657 ) ( not ( = ?auto_50656 ?auto_50657 ) ) ( not ( = ?auto_50656 ?auto_50658 ) ) ( not ( = ?auto_50656 ?auto_50659 ) ) ( not ( = ?auto_50657 ?auto_50658 ) ) ( not ( = ?auto_50657 ?auto_50659 ) ) ( not ( = ?auto_50658 ?auto_50659 ) ) ( ON ?auto_50659 ?auto_50660 ) ( CLEAR ?auto_50659 ) ( HAND-EMPTY ) ( not ( = ?auto_50656 ?auto_50660 ) ) ( not ( = ?auto_50657 ?auto_50660 ) ) ( not ( = ?auto_50658 ?auto_50660 ) ) ( not ( = ?auto_50659 ?auto_50660 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50659 ?auto_50660 )
      ( MAKE-4PILE ?auto_50656 ?auto_50657 ?auto_50658 ?auto_50659 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50661 - BLOCK
      ?auto_50662 - BLOCK
      ?auto_50663 - BLOCK
      ?auto_50664 - BLOCK
    )
    :vars
    (
      ?auto_50665 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50661 ) ( ON ?auto_50662 ?auto_50661 ) ( not ( = ?auto_50661 ?auto_50662 ) ) ( not ( = ?auto_50661 ?auto_50663 ) ) ( not ( = ?auto_50661 ?auto_50664 ) ) ( not ( = ?auto_50662 ?auto_50663 ) ) ( not ( = ?auto_50662 ?auto_50664 ) ) ( not ( = ?auto_50663 ?auto_50664 ) ) ( ON ?auto_50664 ?auto_50665 ) ( CLEAR ?auto_50664 ) ( not ( = ?auto_50661 ?auto_50665 ) ) ( not ( = ?auto_50662 ?auto_50665 ) ) ( not ( = ?auto_50663 ?auto_50665 ) ) ( not ( = ?auto_50664 ?auto_50665 ) ) ( HOLDING ?auto_50663 ) ( CLEAR ?auto_50662 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50661 ?auto_50662 ?auto_50663 )
      ( MAKE-4PILE ?auto_50661 ?auto_50662 ?auto_50663 ?auto_50664 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50666 - BLOCK
      ?auto_50667 - BLOCK
      ?auto_50668 - BLOCK
      ?auto_50669 - BLOCK
    )
    :vars
    (
      ?auto_50670 - BLOCK
      ?auto_50672 - BLOCK
      ?auto_50671 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50666 ) ( ON ?auto_50667 ?auto_50666 ) ( not ( = ?auto_50666 ?auto_50667 ) ) ( not ( = ?auto_50666 ?auto_50668 ) ) ( not ( = ?auto_50666 ?auto_50669 ) ) ( not ( = ?auto_50667 ?auto_50668 ) ) ( not ( = ?auto_50667 ?auto_50669 ) ) ( not ( = ?auto_50668 ?auto_50669 ) ) ( ON ?auto_50669 ?auto_50670 ) ( not ( = ?auto_50666 ?auto_50670 ) ) ( not ( = ?auto_50667 ?auto_50670 ) ) ( not ( = ?auto_50668 ?auto_50670 ) ) ( not ( = ?auto_50669 ?auto_50670 ) ) ( CLEAR ?auto_50667 ) ( ON ?auto_50668 ?auto_50669 ) ( CLEAR ?auto_50668 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50672 ) ( ON ?auto_50671 ?auto_50672 ) ( ON ?auto_50670 ?auto_50671 ) ( not ( = ?auto_50672 ?auto_50671 ) ) ( not ( = ?auto_50672 ?auto_50670 ) ) ( not ( = ?auto_50672 ?auto_50669 ) ) ( not ( = ?auto_50672 ?auto_50668 ) ) ( not ( = ?auto_50671 ?auto_50670 ) ) ( not ( = ?auto_50671 ?auto_50669 ) ) ( not ( = ?auto_50671 ?auto_50668 ) ) ( not ( = ?auto_50666 ?auto_50672 ) ) ( not ( = ?auto_50666 ?auto_50671 ) ) ( not ( = ?auto_50667 ?auto_50672 ) ) ( not ( = ?auto_50667 ?auto_50671 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50672 ?auto_50671 ?auto_50670 ?auto_50669 )
      ( MAKE-4PILE ?auto_50666 ?auto_50667 ?auto_50668 ?auto_50669 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50673 - BLOCK
      ?auto_50674 - BLOCK
      ?auto_50675 - BLOCK
      ?auto_50676 - BLOCK
    )
    :vars
    (
      ?auto_50677 - BLOCK
      ?auto_50678 - BLOCK
      ?auto_50679 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50673 ) ( not ( = ?auto_50673 ?auto_50674 ) ) ( not ( = ?auto_50673 ?auto_50675 ) ) ( not ( = ?auto_50673 ?auto_50676 ) ) ( not ( = ?auto_50674 ?auto_50675 ) ) ( not ( = ?auto_50674 ?auto_50676 ) ) ( not ( = ?auto_50675 ?auto_50676 ) ) ( ON ?auto_50676 ?auto_50677 ) ( not ( = ?auto_50673 ?auto_50677 ) ) ( not ( = ?auto_50674 ?auto_50677 ) ) ( not ( = ?auto_50675 ?auto_50677 ) ) ( not ( = ?auto_50676 ?auto_50677 ) ) ( ON ?auto_50675 ?auto_50676 ) ( CLEAR ?auto_50675 ) ( ON-TABLE ?auto_50678 ) ( ON ?auto_50679 ?auto_50678 ) ( ON ?auto_50677 ?auto_50679 ) ( not ( = ?auto_50678 ?auto_50679 ) ) ( not ( = ?auto_50678 ?auto_50677 ) ) ( not ( = ?auto_50678 ?auto_50676 ) ) ( not ( = ?auto_50678 ?auto_50675 ) ) ( not ( = ?auto_50679 ?auto_50677 ) ) ( not ( = ?auto_50679 ?auto_50676 ) ) ( not ( = ?auto_50679 ?auto_50675 ) ) ( not ( = ?auto_50673 ?auto_50678 ) ) ( not ( = ?auto_50673 ?auto_50679 ) ) ( not ( = ?auto_50674 ?auto_50678 ) ) ( not ( = ?auto_50674 ?auto_50679 ) ) ( HOLDING ?auto_50674 ) ( CLEAR ?auto_50673 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50673 ?auto_50674 )
      ( MAKE-4PILE ?auto_50673 ?auto_50674 ?auto_50675 ?auto_50676 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50680 - BLOCK
      ?auto_50681 - BLOCK
      ?auto_50682 - BLOCK
      ?auto_50683 - BLOCK
    )
    :vars
    (
      ?auto_50686 - BLOCK
      ?auto_50685 - BLOCK
      ?auto_50684 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50680 ) ( not ( = ?auto_50680 ?auto_50681 ) ) ( not ( = ?auto_50680 ?auto_50682 ) ) ( not ( = ?auto_50680 ?auto_50683 ) ) ( not ( = ?auto_50681 ?auto_50682 ) ) ( not ( = ?auto_50681 ?auto_50683 ) ) ( not ( = ?auto_50682 ?auto_50683 ) ) ( ON ?auto_50683 ?auto_50686 ) ( not ( = ?auto_50680 ?auto_50686 ) ) ( not ( = ?auto_50681 ?auto_50686 ) ) ( not ( = ?auto_50682 ?auto_50686 ) ) ( not ( = ?auto_50683 ?auto_50686 ) ) ( ON ?auto_50682 ?auto_50683 ) ( ON-TABLE ?auto_50685 ) ( ON ?auto_50684 ?auto_50685 ) ( ON ?auto_50686 ?auto_50684 ) ( not ( = ?auto_50685 ?auto_50684 ) ) ( not ( = ?auto_50685 ?auto_50686 ) ) ( not ( = ?auto_50685 ?auto_50683 ) ) ( not ( = ?auto_50685 ?auto_50682 ) ) ( not ( = ?auto_50684 ?auto_50686 ) ) ( not ( = ?auto_50684 ?auto_50683 ) ) ( not ( = ?auto_50684 ?auto_50682 ) ) ( not ( = ?auto_50680 ?auto_50685 ) ) ( not ( = ?auto_50680 ?auto_50684 ) ) ( not ( = ?auto_50681 ?auto_50685 ) ) ( not ( = ?auto_50681 ?auto_50684 ) ) ( CLEAR ?auto_50680 ) ( ON ?auto_50681 ?auto_50682 ) ( CLEAR ?auto_50681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50685 ?auto_50684 ?auto_50686 ?auto_50683 ?auto_50682 )
      ( MAKE-4PILE ?auto_50680 ?auto_50681 ?auto_50682 ?auto_50683 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50687 - BLOCK
      ?auto_50688 - BLOCK
      ?auto_50689 - BLOCK
      ?auto_50690 - BLOCK
    )
    :vars
    (
      ?auto_50692 - BLOCK
      ?auto_50693 - BLOCK
      ?auto_50691 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50687 ?auto_50688 ) ) ( not ( = ?auto_50687 ?auto_50689 ) ) ( not ( = ?auto_50687 ?auto_50690 ) ) ( not ( = ?auto_50688 ?auto_50689 ) ) ( not ( = ?auto_50688 ?auto_50690 ) ) ( not ( = ?auto_50689 ?auto_50690 ) ) ( ON ?auto_50690 ?auto_50692 ) ( not ( = ?auto_50687 ?auto_50692 ) ) ( not ( = ?auto_50688 ?auto_50692 ) ) ( not ( = ?auto_50689 ?auto_50692 ) ) ( not ( = ?auto_50690 ?auto_50692 ) ) ( ON ?auto_50689 ?auto_50690 ) ( ON-TABLE ?auto_50693 ) ( ON ?auto_50691 ?auto_50693 ) ( ON ?auto_50692 ?auto_50691 ) ( not ( = ?auto_50693 ?auto_50691 ) ) ( not ( = ?auto_50693 ?auto_50692 ) ) ( not ( = ?auto_50693 ?auto_50690 ) ) ( not ( = ?auto_50693 ?auto_50689 ) ) ( not ( = ?auto_50691 ?auto_50692 ) ) ( not ( = ?auto_50691 ?auto_50690 ) ) ( not ( = ?auto_50691 ?auto_50689 ) ) ( not ( = ?auto_50687 ?auto_50693 ) ) ( not ( = ?auto_50687 ?auto_50691 ) ) ( not ( = ?auto_50688 ?auto_50693 ) ) ( not ( = ?auto_50688 ?auto_50691 ) ) ( ON ?auto_50688 ?auto_50689 ) ( CLEAR ?auto_50688 ) ( HOLDING ?auto_50687 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50687 )
      ( MAKE-4PILE ?auto_50687 ?auto_50688 ?auto_50689 ?auto_50690 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50694 - BLOCK
      ?auto_50695 - BLOCK
      ?auto_50696 - BLOCK
      ?auto_50697 - BLOCK
    )
    :vars
    (
      ?auto_50700 - BLOCK
      ?auto_50698 - BLOCK
      ?auto_50699 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50694 ?auto_50695 ) ) ( not ( = ?auto_50694 ?auto_50696 ) ) ( not ( = ?auto_50694 ?auto_50697 ) ) ( not ( = ?auto_50695 ?auto_50696 ) ) ( not ( = ?auto_50695 ?auto_50697 ) ) ( not ( = ?auto_50696 ?auto_50697 ) ) ( ON ?auto_50697 ?auto_50700 ) ( not ( = ?auto_50694 ?auto_50700 ) ) ( not ( = ?auto_50695 ?auto_50700 ) ) ( not ( = ?auto_50696 ?auto_50700 ) ) ( not ( = ?auto_50697 ?auto_50700 ) ) ( ON ?auto_50696 ?auto_50697 ) ( ON-TABLE ?auto_50698 ) ( ON ?auto_50699 ?auto_50698 ) ( ON ?auto_50700 ?auto_50699 ) ( not ( = ?auto_50698 ?auto_50699 ) ) ( not ( = ?auto_50698 ?auto_50700 ) ) ( not ( = ?auto_50698 ?auto_50697 ) ) ( not ( = ?auto_50698 ?auto_50696 ) ) ( not ( = ?auto_50699 ?auto_50700 ) ) ( not ( = ?auto_50699 ?auto_50697 ) ) ( not ( = ?auto_50699 ?auto_50696 ) ) ( not ( = ?auto_50694 ?auto_50698 ) ) ( not ( = ?auto_50694 ?auto_50699 ) ) ( not ( = ?auto_50695 ?auto_50698 ) ) ( not ( = ?auto_50695 ?auto_50699 ) ) ( ON ?auto_50695 ?auto_50696 ) ( ON ?auto_50694 ?auto_50695 ) ( CLEAR ?auto_50694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50698 ?auto_50699 ?auto_50700 ?auto_50697 ?auto_50696 ?auto_50695 )
      ( MAKE-4PILE ?auto_50694 ?auto_50695 ?auto_50696 ?auto_50697 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_50703 - BLOCK
      ?auto_50704 - BLOCK
    )
    :vars
    (
      ?auto_50705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50705 ?auto_50704 ) ( CLEAR ?auto_50705 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50703 ) ( ON ?auto_50704 ?auto_50703 ) ( not ( = ?auto_50703 ?auto_50704 ) ) ( not ( = ?auto_50703 ?auto_50705 ) ) ( not ( = ?auto_50704 ?auto_50705 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50705 ?auto_50704 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_50706 - BLOCK
      ?auto_50707 - BLOCK
    )
    :vars
    (
      ?auto_50708 - BLOCK
      ?auto_50709 - BLOCK
      ?auto_50710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50708 ?auto_50707 ) ( CLEAR ?auto_50708 ) ( ON-TABLE ?auto_50706 ) ( ON ?auto_50707 ?auto_50706 ) ( not ( = ?auto_50706 ?auto_50707 ) ) ( not ( = ?auto_50706 ?auto_50708 ) ) ( not ( = ?auto_50707 ?auto_50708 ) ) ( HOLDING ?auto_50709 ) ( CLEAR ?auto_50710 ) ( not ( = ?auto_50706 ?auto_50709 ) ) ( not ( = ?auto_50706 ?auto_50710 ) ) ( not ( = ?auto_50707 ?auto_50709 ) ) ( not ( = ?auto_50707 ?auto_50710 ) ) ( not ( = ?auto_50708 ?auto_50709 ) ) ( not ( = ?auto_50708 ?auto_50710 ) ) ( not ( = ?auto_50709 ?auto_50710 ) ) )
    :subtasks
    ( ( !STACK ?auto_50709 ?auto_50710 )
      ( MAKE-2PILE ?auto_50706 ?auto_50707 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_50711 - BLOCK
      ?auto_50712 - BLOCK
    )
    :vars
    (
      ?auto_50713 - BLOCK
      ?auto_50715 - BLOCK
      ?auto_50714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50713 ?auto_50712 ) ( ON-TABLE ?auto_50711 ) ( ON ?auto_50712 ?auto_50711 ) ( not ( = ?auto_50711 ?auto_50712 ) ) ( not ( = ?auto_50711 ?auto_50713 ) ) ( not ( = ?auto_50712 ?auto_50713 ) ) ( CLEAR ?auto_50715 ) ( not ( = ?auto_50711 ?auto_50714 ) ) ( not ( = ?auto_50711 ?auto_50715 ) ) ( not ( = ?auto_50712 ?auto_50714 ) ) ( not ( = ?auto_50712 ?auto_50715 ) ) ( not ( = ?auto_50713 ?auto_50714 ) ) ( not ( = ?auto_50713 ?auto_50715 ) ) ( not ( = ?auto_50714 ?auto_50715 ) ) ( ON ?auto_50714 ?auto_50713 ) ( CLEAR ?auto_50714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50711 ?auto_50712 ?auto_50713 )
      ( MAKE-2PILE ?auto_50711 ?auto_50712 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_50716 - BLOCK
      ?auto_50717 - BLOCK
    )
    :vars
    (
      ?auto_50718 - BLOCK
      ?auto_50720 - BLOCK
      ?auto_50719 - BLOCK
      ?auto_50721 - BLOCK
      ?auto_50722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50718 ?auto_50717 ) ( ON-TABLE ?auto_50716 ) ( ON ?auto_50717 ?auto_50716 ) ( not ( = ?auto_50716 ?auto_50717 ) ) ( not ( = ?auto_50716 ?auto_50718 ) ) ( not ( = ?auto_50717 ?auto_50718 ) ) ( not ( = ?auto_50716 ?auto_50720 ) ) ( not ( = ?auto_50716 ?auto_50719 ) ) ( not ( = ?auto_50717 ?auto_50720 ) ) ( not ( = ?auto_50717 ?auto_50719 ) ) ( not ( = ?auto_50718 ?auto_50720 ) ) ( not ( = ?auto_50718 ?auto_50719 ) ) ( not ( = ?auto_50720 ?auto_50719 ) ) ( ON ?auto_50720 ?auto_50718 ) ( CLEAR ?auto_50720 ) ( HOLDING ?auto_50719 ) ( CLEAR ?auto_50721 ) ( ON-TABLE ?auto_50722 ) ( ON ?auto_50721 ?auto_50722 ) ( not ( = ?auto_50722 ?auto_50721 ) ) ( not ( = ?auto_50722 ?auto_50719 ) ) ( not ( = ?auto_50721 ?auto_50719 ) ) ( not ( = ?auto_50716 ?auto_50721 ) ) ( not ( = ?auto_50716 ?auto_50722 ) ) ( not ( = ?auto_50717 ?auto_50721 ) ) ( not ( = ?auto_50717 ?auto_50722 ) ) ( not ( = ?auto_50718 ?auto_50721 ) ) ( not ( = ?auto_50718 ?auto_50722 ) ) ( not ( = ?auto_50720 ?auto_50721 ) ) ( not ( = ?auto_50720 ?auto_50722 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50722 ?auto_50721 ?auto_50719 )
      ( MAKE-2PILE ?auto_50716 ?auto_50717 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_50723 - BLOCK
      ?auto_50724 - BLOCK
    )
    :vars
    (
      ?auto_50725 - BLOCK
      ?auto_50727 - BLOCK
      ?auto_50728 - BLOCK
      ?auto_50729 - BLOCK
      ?auto_50726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50725 ?auto_50724 ) ( ON-TABLE ?auto_50723 ) ( ON ?auto_50724 ?auto_50723 ) ( not ( = ?auto_50723 ?auto_50724 ) ) ( not ( = ?auto_50723 ?auto_50725 ) ) ( not ( = ?auto_50724 ?auto_50725 ) ) ( not ( = ?auto_50723 ?auto_50727 ) ) ( not ( = ?auto_50723 ?auto_50728 ) ) ( not ( = ?auto_50724 ?auto_50727 ) ) ( not ( = ?auto_50724 ?auto_50728 ) ) ( not ( = ?auto_50725 ?auto_50727 ) ) ( not ( = ?auto_50725 ?auto_50728 ) ) ( not ( = ?auto_50727 ?auto_50728 ) ) ( ON ?auto_50727 ?auto_50725 ) ( CLEAR ?auto_50729 ) ( ON-TABLE ?auto_50726 ) ( ON ?auto_50729 ?auto_50726 ) ( not ( = ?auto_50726 ?auto_50729 ) ) ( not ( = ?auto_50726 ?auto_50728 ) ) ( not ( = ?auto_50729 ?auto_50728 ) ) ( not ( = ?auto_50723 ?auto_50729 ) ) ( not ( = ?auto_50723 ?auto_50726 ) ) ( not ( = ?auto_50724 ?auto_50729 ) ) ( not ( = ?auto_50724 ?auto_50726 ) ) ( not ( = ?auto_50725 ?auto_50729 ) ) ( not ( = ?auto_50725 ?auto_50726 ) ) ( not ( = ?auto_50727 ?auto_50729 ) ) ( not ( = ?auto_50727 ?auto_50726 ) ) ( ON ?auto_50728 ?auto_50727 ) ( CLEAR ?auto_50728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50723 ?auto_50724 ?auto_50725 ?auto_50727 )
      ( MAKE-2PILE ?auto_50723 ?auto_50724 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_50730 - BLOCK
      ?auto_50731 - BLOCK
    )
    :vars
    (
      ?auto_50736 - BLOCK
      ?auto_50732 - BLOCK
      ?auto_50735 - BLOCK
      ?auto_50734 - BLOCK
      ?auto_50733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50736 ?auto_50731 ) ( ON-TABLE ?auto_50730 ) ( ON ?auto_50731 ?auto_50730 ) ( not ( = ?auto_50730 ?auto_50731 ) ) ( not ( = ?auto_50730 ?auto_50736 ) ) ( not ( = ?auto_50731 ?auto_50736 ) ) ( not ( = ?auto_50730 ?auto_50732 ) ) ( not ( = ?auto_50730 ?auto_50735 ) ) ( not ( = ?auto_50731 ?auto_50732 ) ) ( not ( = ?auto_50731 ?auto_50735 ) ) ( not ( = ?auto_50736 ?auto_50732 ) ) ( not ( = ?auto_50736 ?auto_50735 ) ) ( not ( = ?auto_50732 ?auto_50735 ) ) ( ON ?auto_50732 ?auto_50736 ) ( ON-TABLE ?auto_50734 ) ( not ( = ?auto_50734 ?auto_50733 ) ) ( not ( = ?auto_50734 ?auto_50735 ) ) ( not ( = ?auto_50733 ?auto_50735 ) ) ( not ( = ?auto_50730 ?auto_50733 ) ) ( not ( = ?auto_50730 ?auto_50734 ) ) ( not ( = ?auto_50731 ?auto_50733 ) ) ( not ( = ?auto_50731 ?auto_50734 ) ) ( not ( = ?auto_50736 ?auto_50733 ) ) ( not ( = ?auto_50736 ?auto_50734 ) ) ( not ( = ?auto_50732 ?auto_50733 ) ) ( not ( = ?auto_50732 ?auto_50734 ) ) ( ON ?auto_50735 ?auto_50732 ) ( CLEAR ?auto_50735 ) ( HOLDING ?auto_50733 ) ( CLEAR ?auto_50734 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50734 ?auto_50733 )
      ( MAKE-2PILE ?auto_50730 ?auto_50731 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51508 - BLOCK
      ?auto_51509 - BLOCK
    )
    :vars
    (
      ?auto_51510 - BLOCK
      ?auto_51512 - BLOCK
      ?auto_51511 - BLOCK
      ?auto_51513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51510 ?auto_51509 ) ( ON-TABLE ?auto_51508 ) ( ON ?auto_51509 ?auto_51508 ) ( not ( = ?auto_51508 ?auto_51509 ) ) ( not ( = ?auto_51508 ?auto_51510 ) ) ( not ( = ?auto_51509 ?auto_51510 ) ) ( not ( = ?auto_51508 ?auto_51512 ) ) ( not ( = ?auto_51508 ?auto_51511 ) ) ( not ( = ?auto_51509 ?auto_51512 ) ) ( not ( = ?auto_51509 ?auto_51511 ) ) ( not ( = ?auto_51510 ?auto_51512 ) ) ( not ( = ?auto_51510 ?auto_51511 ) ) ( not ( = ?auto_51512 ?auto_51511 ) ) ( ON ?auto_51512 ?auto_51510 ) ( not ( = ?auto_51513 ?auto_51511 ) ) ( not ( = ?auto_51508 ?auto_51513 ) ) ( not ( = ?auto_51509 ?auto_51513 ) ) ( not ( = ?auto_51510 ?auto_51513 ) ) ( not ( = ?auto_51512 ?auto_51513 ) ) ( ON ?auto_51511 ?auto_51512 ) ( ON ?auto_51513 ?auto_51511 ) ( CLEAR ?auto_51513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51508 ?auto_51509 ?auto_51510 ?auto_51512 ?auto_51511 )
      ( MAKE-2PILE ?auto_51508 ?auto_51509 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_50744 - BLOCK
      ?auto_50745 - BLOCK
    )
    :vars
    (
      ?auto_50746 - BLOCK
      ?auto_50749 - BLOCK
      ?auto_50748 - BLOCK
      ?auto_50747 - BLOCK
      ?auto_50750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50746 ?auto_50745 ) ( ON-TABLE ?auto_50744 ) ( ON ?auto_50745 ?auto_50744 ) ( not ( = ?auto_50744 ?auto_50745 ) ) ( not ( = ?auto_50744 ?auto_50746 ) ) ( not ( = ?auto_50745 ?auto_50746 ) ) ( not ( = ?auto_50744 ?auto_50749 ) ) ( not ( = ?auto_50744 ?auto_50748 ) ) ( not ( = ?auto_50745 ?auto_50749 ) ) ( not ( = ?auto_50745 ?auto_50748 ) ) ( not ( = ?auto_50746 ?auto_50749 ) ) ( not ( = ?auto_50746 ?auto_50748 ) ) ( not ( = ?auto_50749 ?auto_50748 ) ) ( ON ?auto_50749 ?auto_50746 ) ( not ( = ?auto_50747 ?auto_50750 ) ) ( not ( = ?auto_50747 ?auto_50748 ) ) ( not ( = ?auto_50750 ?auto_50748 ) ) ( not ( = ?auto_50744 ?auto_50750 ) ) ( not ( = ?auto_50744 ?auto_50747 ) ) ( not ( = ?auto_50745 ?auto_50750 ) ) ( not ( = ?auto_50745 ?auto_50747 ) ) ( not ( = ?auto_50746 ?auto_50750 ) ) ( not ( = ?auto_50746 ?auto_50747 ) ) ( not ( = ?auto_50749 ?auto_50750 ) ) ( not ( = ?auto_50749 ?auto_50747 ) ) ( ON ?auto_50748 ?auto_50749 ) ( ON ?auto_50750 ?auto_50748 ) ( CLEAR ?auto_50750 ) ( HOLDING ?auto_50747 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50747 )
      ( MAKE-2PILE ?auto_50744 ?auto_50745 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_50751 - BLOCK
      ?auto_50752 - BLOCK
    )
    :vars
    (
      ?auto_50755 - BLOCK
      ?auto_50756 - BLOCK
      ?auto_50753 - BLOCK
      ?auto_50757 - BLOCK
      ?auto_50754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50755 ?auto_50752 ) ( ON-TABLE ?auto_50751 ) ( ON ?auto_50752 ?auto_50751 ) ( not ( = ?auto_50751 ?auto_50752 ) ) ( not ( = ?auto_50751 ?auto_50755 ) ) ( not ( = ?auto_50752 ?auto_50755 ) ) ( not ( = ?auto_50751 ?auto_50756 ) ) ( not ( = ?auto_50751 ?auto_50753 ) ) ( not ( = ?auto_50752 ?auto_50756 ) ) ( not ( = ?auto_50752 ?auto_50753 ) ) ( not ( = ?auto_50755 ?auto_50756 ) ) ( not ( = ?auto_50755 ?auto_50753 ) ) ( not ( = ?auto_50756 ?auto_50753 ) ) ( ON ?auto_50756 ?auto_50755 ) ( not ( = ?auto_50757 ?auto_50754 ) ) ( not ( = ?auto_50757 ?auto_50753 ) ) ( not ( = ?auto_50754 ?auto_50753 ) ) ( not ( = ?auto_50751 ?auto_50754 ) ) ( not ( = ?auto_50751 ?auto_50757 ) ) ( not ( = ?auto_50752 ?auto_50754 ) ) ( not ( = ?auto_50752 ?auto_50757 ) ) ( not ( = ?auto_50755 ?auto_50754 ) ) ( not ( = ?auto_50755 ?auto_50757 ) ) ( not ( = ?auto_50756 ?auto_50754 ) ) ( not ( = ?auto_50756 ?auto_50757 ) ) ( ON ?auto_50753 ?auto_50756 ) ( ON ?auto_50754 ?auto_50753 ) ( ON ?auto_50757 ?auto_50754 ) ( CLEAR ?auto_50757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50751 ?auto_50752 ?auto_50755 ?auto_50756 ?auto_50753 ?auto_50754 )
      ( MAKE-2PILE ?auto_50751 ?auto_50752 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50763 - BLOCK
      ?auto_50764 - BLOCK
      ?auto_50765 - BLOCK
      ?auto_50766 - BLOCK
      ?auto_50767 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_50767 ) ( CLEAR ?auto_50766 ) ( ON-TABLE ?auto_50763 ) ( ON ?auto_50764 ?auto_50763 ) ( ON ?auto_50765 ?auto_50764 ) ( ON ?auto_50766 ?auto_50765 ) ( not ( = ?auto_50763 ?auto_50764 ) ) ( not ( = ?auto_50763 ?auto_50765 ) ) ( not ( = ?auto_50763 ?auto_50766 ) ) ( not ( = ?auto_50763 ?auto_50767 ) ) ( not ( = ?auto_50764 ?auto_50765 ) ) ( not ( = ?auto_50764 ?auto_50766 ) ) ( not ( = ?auto_50764 ?auto_50767 ) ) ( not ( = ?auto_50765 ?auto_50766 ) ) ( not ( = ?auto_50765 ?auto_50767 ) ) ( not ( = ?auto_50766 ?auto_50767 ) ) )
    :subtasks
    ( ( !STACK ?auto_50767 ?auto_50766 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50768 - BLOCK
      ?auto_50769 - BLOCK
      ?auto_50770 - BLOCK
      ?auto_50771 - BLOCK
      ?auto_50772 - BLOCK
    )
    :vars
    (
      ?auto_50773 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_50771 ) ( ON-TABLE ?auto_50768 ) ( ON ?auto_50769 ?auto_50768 ) ( ON ?auto_50770 ?auto_50769 ) ( ON ?auto_50771 ?auto_50770 ) ( not ( = ?auto_50768 ?auto_50769 ) ) ( not ( = ?auto_50768 ?auto_50770 ) ) ( not ( = ?auto_50768 ?auto_50771 ) ) ( not ( = ?auto_50768 ?auto_50772 ) ) ( not ( = ?auto_50769 ?auto_50770 ) ) ( not ( = ?auto_50769 ?auto_50771 ) ) ( not ( = ?auto_50769 ?auto_50772 ) ) ( not ( = ?auto_50770 ?auto_50771 ) ) ( not ( = ?auto_50770 ?auto_50772 ) ) ( not ( = ?auto_50771 ?auto_50772 ) ) ( ON ?auto_50772 ?auto_50773 ) ( CLEAR ?auto_50772 ) ( HAND-EMPTY ) ( not ( = ?auto_50768 ?auto_50773 ) ) ( not ( = ?auto_50769 ?auto_50773 ) ) ( not ( = ?auto_50770 ?auto_50773 ) ) ( not ( = ?auto_50771 ?auto_50773 ) ) ( not ( = ?auto_50772 ?auto_50773 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50772 ?auto_50773 )
      ( MAKE-5PILE ?auto_50768 ?auto_50769 ?auto_50770 ?auto_50771 ?auto_50772 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50774 - BLOCK
      ?auto_50775 - BLOCK
      ?auto_50776 - BLOCK
      ?auto_50777 - BLOCK
      ?auto_50778 - BLOCK
    )
    :vars
    (
      ?auto_50779 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50774 ) ( ON ?auto_50775 ?auto_50774 ) ( ON ?auto_50776 ?auto_50775 ) ( not ( = ?auto_50774 ?auto_50775 ) ) ( not ( = ?auto_50774 ?auto_50776 ) ) ( not ( = ?auto_50774 ?auto_50777 ) ) ( not ( = ?auto_50774 ?auto_50778 ) ) ( not ( = ?auto_50775 ?auto_50776 ) ) ( not ( = ?auto_50775 ?auto_50777 ) ) ( not ( = ?auto_50775 ?auto_50778 ) ) ( not ( = ?auto_50776 ?auto_50777 ) ) ( not ( = ?auto_50776 ?auto_50778 ) ) ( not ( = ?auto_50777 ?auto_50778 ) ) ( ON ?auto_50778 ?auto_50779 ) ( CLEAR ?auto_50778 ) ( not ( = ?auto_50774 ?auto_50779 ) ) ( not ( = ?auto_50775 ?auto_50779 ) ) ( not ( = ?auto_50776 ?auto_50779 ) ) ( not ( = ?auto_50777 ?auto_50779 ) ) ( not ( = ?auto_50778 ?auto_50779 ) ) ( HOLDING ?auto_50777 ) ( CLEAR ?auto_50776 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50774 ?auto_50775 ?auto_50776 ?auto_50777 )
      ( MAKE-5PILE ?auto_50774 ?auto_50775 ?auto_50776 ?auto_50777 ?auto_50778 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50780 - BLOCK
      ?auto_50781 - BLOCK
      ?auto_50782 - BLOCK
      ?auto_50783 - BLOCK
      ?auto_50784 - BLOCK
    )
    :vars
    (
      ?auto_50785 - BLOCK
      ?auto_50786 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50780 ) ( ON ?auto_50781 ?auto_50780 ) ( ON ?auto_50782 ?auto_50781 ) ( not ( = ?auto_50780 ?auto_50781 ) ) ( not ( = ?auto_50780 ?auto_50782 ) ) ( not ( = ?auto_50780 ?auto_50783 ) ) ( not ( = ?auto_50780 ?auto_50784 ) ) ( not ( = ?auto_50781 ?auto_50782 ) ) ( not ( = ?auto_50781 ?auto_50783 ) ) ( not ( = ?auto_50781 ?auto_50784 ) ) ( not ( = ?auto_50782 ?auto_50783 ) ) ( not ( = ?auto_50782 ?auto_50784 ) ) ( not ( = ?auto_50783 ?auto_50784 ) ) ( ON ?auto_50784 ?auto_50785 ) ( not ( = ?auto_50780 ?auto_50785 ) ) ( not ( = ?auto_50781 ?auto_50785 ) ) ( not ( = ?auto_50782 ?auto_50785 ) ) ( not ( = ?auto_50783 ?auto_50785 ) ) ( not ( = ?auto_50784 ?auto_50785 ) ) ( CLEAR ?auto_50782 ) ( ON ?auto_50783 ?auto_50784 ) ( CLEAR ?auto_50783 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50786 ) ( ON ?auto_50785 ?auto_50786 ) ( not ( = ?auto_50786 ?auto_50785 ) ) ( not ( = ?auto_50786 ?auto_50784 ) ) ( not ( = ?auto_50786 ?auto_50783 ) ) ( not ( = ?auto_50780 ?auto_50786 ) ) ( not ( = ?auto_50781 ?auto_50786 ) ) ( not ( = ?auto_50782 ?auto_50786 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50786 ?auto_50785 ?auto_50784 )
      ( MAKE-5PILE ?auto_50780 ?auto_50781 ?auto_50782 ?auto_50783 ?auto_50784 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50787 - BLOCK
      ?auto_50788 - BLOCK
      ?auto_50789 - BLOCK
      ?auto_50790 - BLOCK
      ?auto_50791 - BLOCK
    )
    :vars
    (
      ?auto_50792 - BLOCK
      ?auto_50793 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50787 ) ( ON ?auto_50788 ?auto_50787 ) ( not ( = ?auto_50787 ?auto_50788 ) ) ( not ( = ?auto_50787 ?auto_50789 ) ) ( not ( = ?auto_50787 ?auto_50790 ) ) ( not ( = ?auto_50787 ?auto_50791 ) ) ( not ( = ?auto_50788 ?auto_50789 ) ) ( not ( = ?auto_50788 ?auto_50790 ) ) ( not ( = ?auto_50788 ?auto_50791 ) ) ( not ( = ?auto_50789 ?auto_50790 ) ) ( not ( = ?auto_50789 ?auto_50791 ) ) ( not ( = ?auto_50790 ?auto_50791 ) ) ( ON ?auto_50791 ?auto_50792 ) ( not ( = ?auto_50787 ?auto_50792 ) ) ( not ( = ?auto_50788 ?auto_50792 ) ) ( not ( = ?auto_50789 ?auto_50792 ) ) ( not ( = ?auto_50790 ?auto_50792 ) ) ( not ( = ?auto_50791 ?auto_50792 ) ) ( ON ?auto_50790 ?auto_50791 ) ( CLEAR ?auto_50790 ) ( ON-TABLE ?auto_50793 ) ( ON ?auto_50792 ?auto_50793 ) ( not ( = ?auto_50793 ?auto_50792 ) ) ( not ( = ?auto_50793 ?auto_50791 ) ) ( not ( = ?auto_50793 ?auto_50790 ) ) ( not ( = ?auto_50787 ?auto_50793 ) ) ( not ( = ?auto_50788 ?auto_50793 ) ) ( not ( = ?auto_50789 ?auto_50793 ) ) ( HOLDING ?auto_50789 ) ( CLEAR ?auto_50788 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50787 ?auto_50788 ?auto_50789 )
      ( MAKE-5PILE ?auto_50787 ?auto_50788 ?auto_50789 ?auto_50790 ?auto_50791 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50794 - BLOCK
      ?auto_50795 - BLOCK
      ?auto_50796 - BLOCK
      ?auto_50797 - BLOCK
      ?auto_50798 - BLOCK
    )
    :vars
    (
      ?auto_50800 - BLOCK
      ?auto_50799 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50794 ) ( ON ?auto_50795 ?auto_50794 ) ( not ( = ?auto_50794 ?auto_50795 ) ) ( not ( = ?auto_50794 ?auto_50796 ) ) ( not ( = ?auto_50794 ?auto_50797 ) ) ( not ( = ?auto_50794 ?auto_50798 ) ) ( not ( = ?auto_50795 ?auto_50796 ) ) ( not ( = ?auto_50795 ?auto_50797 ) ) ( not ( = ?auto_50795 ?auto_50798 ) ) ( not ( = ?auto_50796 ?auto_50797 ) ) ( not ( = ?auto_50796 ?auto_50798 ) ) ( not ( = ?auto_50797 ?auto_50798 ) ) ( ON ?auto_50798 ?auto_50800 ) ( not ( = ?auto_50794 ?auto_50800 ) ) ( not ( = ?auto_50795 ?auto_50800 ) ) ( not ( = ?auto_50796 ?auto_50800 ) ) ( not ( = ?auto_50797 ?auto_50800 ) ) ( not ( = ?auto_50798 ?auto_50800 ) ) ( ON ?auto_50797 ?auto_50798 ) ( ON-TABLE ?auto_50799 ) ( ON ?auto_50800 ?auto_50799 ) ( not ( = ?auto_50799 ?auto_50800 ) ) ( not ( = ?auto_50799 ?auto_50798 ) ) ( not ( = ?auto_50799 ?auto_50797 ) ) ( not ( = ?auto_50794 ?auto_50799 ) ) ( not ( = ?auto_50795 ?auto_50799 ) ) ( not ( = ?auto_50796 ?auto_50799 ) ) ( CLEAR ?auto_50795 ) ( ON ?auto_50796 ?auto_50797 ) ( CLEAR ?auto_50796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50799 ?auto_50800 ?auto_50798 ?auto_50797 )
      ( MAKE-5PILE ?auto_50794 ?auto_50795 ?auto_50796 ?auto_50797 ?auto_50798 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50801 - BLOCK
      ?auto_50802 - BLOCK
      ?auto_50803 - BLOCK
      ?auto_50804 - BLOCK
      ?auto_50805 - BLOCK
    )
    :vars
    (
      ?auto_50807 - BLOCK
      ?auto_50806 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50801 ) ( not ( = ?auto_50801 ?auto_50802 ) ) ( not ( = ?auto_50801 ?auto_50803 ) ) ( not ( = ?auto_50801 ?auto_50804 ) ) ( not ( = ?auto_50801 ?auto_50805 ) ) ( not ( = ?auto_50802 ?auto_50803 ) ) ( not ( = ?auto_50802 ?auto_50804 ) ) ( not ( = ?auto_50802 ?auto_50805 ) ) ( not ( = ?auto_50803 ?auto_50804 ) ) ( not ( = ?auto_50803 ?auto_50805 ) ) ( not ( = ?auto_50804 ?auto_50805 ) ) ( ON ?auto_50805 ?auto_50807 ) ( not ( = ?auto_50801 ?auto_50807 ) ) ( not ( = ?auto_50802 ?auto_50807 ) ) ( not ( = ?auto_50803 ?auto_50807 ) ) ( not ( = ?auto_50804 ?auto_50807 ) ) ( not ( = ?auto_50805 ?auto_50807 ) ) ( ON ?auto_50804 ?auto_50805 ) ( ON-TABLE ?auto_50806 ) ( ON ?auto_50807 ?auto_50806 ) ( not ( = ?auto_50806 ?auto_50807 ) ) ( not ( = ?auto_50806 ?auto_50805 ) ) ( not ( = ?auto_50806 ?auto_50804 ) ) ( not ( = ?auto_50801 ?auto_50806 ) ) ( not ( = ?auto_50802 ?auto_50806 ) ) ( not ( = ?auto_50803 ?auto_50806 ) ) ( ON ?auto_50803 ?auto_50804 ) ( CLEAR ?auto_50803 ) ( HOLDING ?auto_50802 ) ( CLEAR ?auto_50801 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50801 ?auto_50802 )
      ( MAKE-5PILE ?auto_50801 ?auto_50802 ?auto_50803 ?auto_50804 ?auto_50805 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50808 - BLOCK
      ?auto_50809 - BLOCK
      ?auto_50810 - BLOCK
      ?auto_50811 - BLOCK
      ?auto_50812 - BLOCK
    )
    :vars
    (
      ?auto_50814 - BLOCK
      ?auto_50813 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50808 ) ( not ( = ?auto_50808 ?auto_50809 ) ) ( not ( = ?auto_50808 ?auto_50810 ) ) ( not ( = ?auto_50808 ?auto_50811 ) ) ( not ( = ?auto_50808 ?auto_50812 ) ) ( not ( = ?auto_50809 ?auto_50810 ) ) ( not ( = ?auto_50809 ?auto_50811 ) ) ( not ( = ?auto_50809 ?auto_50812 ) ) ( not ( = ?auto_50810 ?auto_50811 ) ) ( not ( = ?auto_50810 ?auto_50812 ) ) ( not ( = ?auto_50811 ?auto_50812 ) ) ( ON ?auto_50812 ?auto_50814 ) ( not ( = ?auto_50808 ?auto_50814 ) ) ( not ( = ?auto_50809 ?auto_50814 ) ) ( not ( = ?auto_50810 ?auto_50814 ) ) ( not ( = ?auto_50811 ?auto_50814 ) ) ( not ( = ?auto_50812 ?auto_50814 ) ) ( ON ?auto_50811 ?auto_50812 ) ( ON-TABLE ?auto_50813 ) ( ON ?auto_50814 ?auto_50813 ) ( not ( = ?auto_50813 ?auto_50814 ) ) ( not ( = ?auto_50813 ?auto_50812 ) ) ( not ( = ?auto_50813 ?auto_50811 ) ) ( not ( = ?auto_50808 ?auto_50813 ) ) ( not ( = ?auto_50809 ?auto_50813 ) ) ( not ( = ?auto_50810 ?auto_50813 ) ) ( ON ?auto_50810 ?auto_50811 ) ( CLEAR ?auto_50808 ) ( ON ?auto_50809 ?auto_50810 ) ( CLEAR ?auto_50809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50813 ?auto_50814 ?auto_50812 ?auto_50811 ?auto_50810 )
      ( MAKE-5PILE ?auto_50808 ?auto_50809 ?auto_50810 ?auto_50811 ?auto_50812 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50815 - BLOCK
      ?auto_50816 - BLOCK
      ?auto_50817 - BLOCK
      ?auto_50818 - BLOCK
      ?auto_50819 - BLOCK
    )
    :vars
    (
      ?auto_50821 - BLOCK
      ?auto_50820 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50815 ?auto_50816 ) ) ( not ( = ?auto_50815 ?auto_50817 ) ) ( not ( = ?auto_50815 ?auto_50818 ) ) ( not ( = ?auto_50815 ?auto_50819 ) ) ( not ( = ?auto_50816 ?auto_50817 ) ) ( not ( = ?auto_50816 ?auto_50818 ) ) ( not ( = ?auto_50816 ?auto_50819 ) ) ( not ( = ?auto_50817 ?auto_50818 ) ) ( not ( = ?auto_50817 ?auto_50819 ) ) ( not ( = ?auto_50818 ?auto_50819 ) ) ( ON ?auto_50819 ?auto_50821 ) ( not ( = ?auto_50815 ?auto_50821 ) ) ( not ( = ?auto_50816 ?auto_50821 ) ) ( not ( = ?auto_50817 ?auto_50821 ) ) ( not ( = ?auto_50818 ?auto_50821 ) ) ( not ( = ?auto_50819 ?auto_50821 ) ) ( ON ?auto_50818 ?auto_50819 ) ( ON-TABLE ?auto_50820 ) ( ON ?auto_50821 ?auto_50820 ) ( not ( = ?auto_50820 ?auto_50821 ) ) ( not ( = ?auto_50820 ?auto_50819 ) ) ( not ( = ?auto_50820 ?auto_50818 ) ) ( not ( = ?auto_50815 ?auto_50820 ) ) ( not ( = ?auto_50816 ?auto_50820 ) ) ( not ( = ?auto_50817 ?auto_50820 ) ) ( ON ?auto_50817 ?auto_50818 ) ( ON ?auto_50816 ?auto_50817 ) ( CLEAR ?auto_50816 ) ( HOLDING ?auto_50815 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50815 )
      ( MAKE-5PILE ?auto_50815 ?auto_50816 ?auto_50817 ?auto_50818 ?auto_50819 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50822 - BLOCK
      ?auto_50823 - BLOCK
      ?auto_50824 - BLOCK
      ?auto_50825 - BLOCK
      ?auto_50826 - BLOCK
    )
    :vars
    (
      ?auto_50827 - BLOCK
      ?auto_50828 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50822 ?auto_50823 ) ) ( not ( = ?auto_50822 ?auto_50824 ) ) ( not ( = ?auto_50822 ?auto_50825 ) ) ( not ( = ?auto_50822 ?auto_50826 ) ) ( not ( = ?auto_50823 ?auto_50824 ) ) ( not ( = ?auto_50823 ?auto_50825 ) ) ( not ( = ?auto_50823 ?auto_50826 ) ) ( not ( = ?auto_50824 ?auto_50825 ) ) ( not ( = ?auto_50824 ?auto_50826 ) ) ( not ( = ?auto_50825 ?auto_50826 ) ) ( ON ?auto_50826 ?auto_50827 ) ( not ( = ?auto_50822 ?auto_50827 ) ) ( not ( = ?auto_50823 ?auto_50827 ) ) ( not ( = ?auto_50824 ?auto_50827 ) ) ( not ( = ?auto_50825 ?auto_50827 ) ) ( not ( = ?auto_50826 ?auto_50827 ) ) ( ON ?auto_50825 ?auto_50826 ) ( ON-TABLE ?auto_50828 ) ( ON ?auto_50827 ?auto_50828 ) ( not ( = ?auto_50828 ?auto_50827 ) ) ( not ( = ?auto_50828 ?auto_50826 ) ) ( not ( = ?auto_50828 ?auto_50825 ) ) ( not ( = ?auto_50822 ?auto_50828 ) ) ( not ( = ?auto_50823 ?auto_50828 ) ) ( not ( = ?auto_50824 ?auto_50828 ) ) ( ON ?auto_50824 ?auto_50825 ) ( ON ?auto_50823 ?auto_50824 ) ( ON ?auto_50822 ?auto_50823 ) ( CLEAR ?auto_50822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50828 ?auto_50827 ?auto_50826 ?auto_50825 ?auto_50824 ?auto_50823 )
      ( MAKE-5PILE ?auto_50822 ?auto_50823 ?auto_50824 ?auto_50825 ?auto_50826 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50830 - BLOCK
    )
    :vars
    (
      ?auto_50831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50831 ?auto_50830 ) ( CLEAR ?auto_50831 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50830 ) ( not ( = ?auto_50830 ?auto_50831 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50831 ?auto_50830 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50832 - BLOCK
    )
    :vars
    (
      ?auto_50833 - BLOCK
      ?auto_50834 - BLOCK
      ?auto_50835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50833 ?auto_50832 ) ( CLEAR ?auto_50833 ) ( ON-TABLE ?auto_50832 ) ( not ( = ?auto_50832 ?auto_50833 ) ) ( HOLDING ?auto_50834 ) ( CLEAR ?auto_50835 ) ( not ( = ?auto_50832 ?auto_50834 ) ) ( not ( = ?auto_50832 ?auto_50835 ) ) ( not ( = ?auto_50833 ?auto_50834 ) ) ( not ( = ?auto_50833 ?auto_50835 ) ) ( not ( = ?auto_50834 ?auto_50835 ) ) )
    :subtasks
    ( ( !STACK ?auto_50834 ?auto_50835 )
      ( MAKE-1PILE ?auto_50832 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50836 - BLOCK
    )
    :vars
    (
      ?auto_50838 - BLOCK
      ?auto_50839 - BLOCK
      ?auto_50837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50838 ?auto_50836 ) ( ON-TABLE ?auto_50836 ) ( not ( = ?auto_50836 ?auto_50838 ) ) ( CLEAR ?auto_50839 ) ( not ( = ?auto_50836 ?auto_50837 ) ) ( not ( = ?auto_50836 ?auto_50839 ) ) ( not ( = ?auto_50838 ?auto_50837 ) ) ( not ( = ?auto_50838 ?auto_50839 ) ) ( not ( = ?auto_50837 ?auto_50839 ) ) ( ON ?auto_50837 ?auto_50838 ) ( CLEAR ?auto_50837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50836 ?auto_50838 )
      ( MAKE-1PILE ?auto_50836 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50840 - BLOCK
    )
    :vars
    (
      ?auto_50842 - BLOCK
      ?auto_50843 - BLOCK
      ?auto_50841 - BLOCK
      ?auto_50846 - BLOCK
      ?auto_50844 - BLOCK
      ?auto_50845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50842 ?auto_50840 ) ( ON-TABLE ?auto_50840 ) ( not ( = ?auto_50840 ?auto_50842 ) ) ( not ( = ?auto_50840 ?auto_50843 ) ) ( not ( = ?auto_50840 ?auto_50841 ) ) ( not ( = ?auto_50842 ?auto_50843 ) ) ( not ( = ?auto_50842 ?auto_50841 ) ) ( not ( = ?auto_50843 ?auto_50841 ) ) ( ON ?auto_50843 ?auto_50842 ) ( CLEAR ?auto_50843 ) ( HOLDING ?auto_50841 ) ( CLEAR ?auto_50846 ) ( ON-TABLE ?auto_50844 ) ( ON ?auto_50845 ?auto_50844 ) ( ON ?auto_50846 ?auto_50845 ) ( not ( = ?auto_50844 ?auto_50845 ) ) ( not ( = ?auto_50844 ?auto_50846 ) ) ( not ( = ?auto_50844 ?auto_50841 ) ) ( not ( = ?auto_50845 ?auto_50846 ) ) ( not ( = ?auto_50845 ?auto_50841 ) ) ( not ( = ?auto_50846 ?auto_50841 ) ) ( not ( = ?auto_50840 ?auto_50846 ) ) ( not ( = ?auto_50840 ?auto_50844 ) ) ( not ( = ?auto_50840 ?auto_50845 ) ) ( not ( = ?auto_50842 ?auto_50846 ) ) ( not ( = ?auto_50842 ?auto_50844 ) ) ( not ( = ?auto_50842 ?auto_50845 ) ) ( not ( = ?auto_50843 ?auto_50846 ) ) ( not ( = ?auto_50843 ?auto_50844 ) ) ( not ( = ?auto_50843 ?auto_50845 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50844 ?auto_50845 ?auto_50846 ?auto_50841 )
      ( MAKE-1PILE ?auto_50840 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50847 - BLOCK
    )
    :vars
    (
      ?auto_50849 - BLOCK
      ?auto_50851 - BLOCK
      ?auto_50850 - BLOCK
      ?auto_50852 - BLOCK
      ?auto_50848 - BLOCK
      ?auto_50853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50849 ?auto_50847 ) ( ON-TABLE ?auto_50847 ) ( not ( = ?auto_50847 ?auto_50849 ) ) ( not ( = ?auto_50847 ?auto_50851 ) ) ( not ( = ?auto_50847 ?auto_50850 ) ) ( not ( = ?auto_50849 ?auto_50851 ) ) ( not ( = ?auto_50849 ?auto_50850 ) ) ( not ( = ?auto_50851 ?auto_50850 ) ) ( ON ?auto_50851 ?auto_50849 ) ( CLEAR ?auto_50852 ) ( ON-TABLE ?auto_50848 ) ( ON ?auto_50853 ?auto_50848 ) ( ON ?auto_50852 ?auto_50853 ) ( not ( = ?auto_50848 ?auto_50853 ) ) ( not ( = ?auto_50848 ?auto_50852 ) ) ( not ( = ?auto_50848 ?auto_50850 ) ) ( not ( = ?auto_50853 ?auto_50852 ) ) ( not ( = ?auto_50853 ?auto_50850 ) ) ( not ( = ?auto_50852 ?auto_50850 ) ) ( not ( = ?auto_50847 ?auto_50852 ) ) ( not ( = ?auto_50847 ?auto_50848 ) ) ( not ( = ?auto_50847 ?auto_50853 ) ) ( not ( = ?auto_50849 ?auto_50852 ) ) ( not ( = ?auto_50849 ?auto_50848 ) ) ( not ( = ?auto_50849 ?auto_50853 ) ) ( not ( = ?auto_50851 ?auto_50852 ) ) ( not ( = ?auto_50851 ?auto_50848 ) ) ( not ( = ?auto_50851 ?auto_50853 ) ) ( ON ?auto_50850 ?auto_50851 ) ( CLEAR ?auto_50850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50847 ?auto_50849 ?auto_50851 )
      ( MAKE-1PILE ?auto_50847 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50854 - BLOCK
    )
    :vars
    (
      ?auto_50855 - BLOCK
      ?auto_50856 - BLOCK
      ?auto_50860 - BLOCK
      ?auto_50857 - BLOCK
      ?auto_50859 - BLOCK
      ?auto_50858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50855 ?auto_50854 ) ( ON-TABLE ?auto_50854 ) ( not ( = ?auto_50854 ?auto_50855 ) ) ( not ( = ?auto_50854 ?auto_50856 ) ) ( not ( = ?auto_50854 ?auto_50860 ) ) ( not ( = ?auto_50855 ?auto_50856 ) ) ( not ( = ?auto_50855 ?auto_50860 ) ) ( not ( = ?auto_50856 ?auto_50860 ) ) ( ON ?auto_50856 ?auto_50855 ) ( ON-TABLE ?auto_50857 ) ( ON ?auto_50859 ?auto_50857 ) ( not ( = ?auto_50857 ?auto_50859 ) ) ( not ( = ?auto_50857 ?auto_50858 ) ) ( not ( = ?auto_50857 ?auto_50860 ) ) ( not ( = ?auto_50859 ?auto_50858 ) ) ( not ( = ?auto_50859 ?auto_50860 ) ) ( not ( = ?auto_50858 ?auto_50860 ) ) ( not ( = ?auto_50854 ?auto_50858 ) ) ( not ( = ?auto_50854 ?auto_50857 ) ) ( not ( = ?auto_50854 ?auto_50859 ) ) ( not ( = ?auto_50855 ?auto_50858 ) ) ( not ( = ?auto_50855 ?auto_50857 ) ) ( not ( = ?auto_50855 ?auto_50859 ) ) ( not ( = ?auto_50856 ?auto_50858 ) ) ( not ( = ?auto_50856 ?auto_50857 ) ) ( not ( = ?auto_50856 ?auto_50859 ) ) ( ON ?auto_50860 ?auto_50856 ) ( CLEAR ?auto_50860 ) ( HOLDING ?auto_50858 ) ( CLEAR ?auto_50859 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50857 ?auto_50859 ?auto_50858 )
      ( MAKE-1PILE ?auto_50854 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50861 - BLOCK
    )
    :vars
    (
      ?auto_50865 - BLOCK
      ?auto_50867 - BLOCK
      ?auto_50864 - BLOCK
      ?auto_50866 - BLOCK
      ?auto_50862 - BLOCK
      ?auto_50863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50865 ?auto_50861 ) ( ON-TABLE ?auto_50861 ) ( not ( = ?auto_50861 ?auto_50865 ) ) ( not ( = ?auto_50861 ?auto_50867 ) ) ( not ( = ?auto_50861 ?auto_50864 ) ) ( not ( = ?auto_50865 ?auto_50867 ) ) ( not ( = ?auto_50865 ?auto_50864 ) ) ( not ( = ?auto_50867 ?auto_50864 ) ) ( ON ?auto_50867 ?auto_50865 ) ( ON-TABLE ?auto_50866 ) ( ON ?auto_50862 ?auto_50866 ) ( not ( = ?auto_50866 ?auto_50862 ) ) ( not ( = ?auto_50866 ?auto_50863 ) ) ( not ( = ?auto_50866 ?auto_50864 ) ) ( not ( = ?auto_50862 ?auto_50863 ) ) ( not ( = ?auto_50862 ?auto_50864 ) ) ( not ( = ?auto_50863 ?auto_50864 ) ) ( not ( = ?auto_50861 ?auto_50863 ) ) ( not ( = ?auto_50861 ?auto_50866 ) ) ( not ( = ?auto_50861 ?auto_50862 ) ) ( not ( = ?auto_50865 ?auto_50863 ) ) ( not ( = ?auto_50865 ?auto_50866 ) ) ( not ( = ?auto_50865 ?auto_50862 ) ) ( not ( = ?auto_50867 ?auto_50863 ) ) ( not ( = ?auto_50867 ?auto_50866 ) ) ( not ( = ?auto_50867 ?auto_50862 ) ) ( ON ?auto_50864 ?auto_50867 ) ( CLEAR ?auto_50862 ) ( ON ?auto_50863 ?auto_50864 ) ( CLEAR ?auto_50863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50861 ?auto_50865 ?auto_50867 ?auto_50864 )
      ( MAKE-1PILE ?auto_50861 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50868 - BLOCK
    )
    :vars
    (
      ?auto_50870 - BLOCK
      ?auto_50874 - BLOCK
      ?auto_50873 - BLOCK
      ?auto_50869 - BLOCK
      ?auto_50872 - BLOCK
      ?auto_50871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50870 ?auto_50868 ) ( ON-TABLE ?auto_50868 ) ( not ( = ?auto_50868 ?auto_50870 ) ) ( not ( = ?auto_50868 ?auto_50874 ) ) ( not ( = ?auto_50868 ?auto_50873 ) ) ( not ( = ?auto_50870 ?auto_50874 ) ) ( not ( = ?auto_50870 ?auto_50873 ) ) ( not ( = ?auto_50874 ?auto_50873 ) ) ( ON ?auto_50874 ?auto_50870 ) ( ON-TABLE ?auto_50869 ) ( not ( = ?auto_50869 ?auto_50872 ) ) ( not ( = ?auto_50869 ?auto_50871 ) ) ( not ( = ?auto_50869 ?auto_50873 ) ) ( not ( = ?auto_50872 ?auto_50871 ) ) ( not ( = ?auto_50872 ?auto_50873 ) ) ( not ( = ?auto_50871 ?auto_50873 ) ) ( not ( = ?auto_50868 ?auto_50871 ) ) ( not ( = ?auto_50868 ?auto_50869 ) ) ( not ( = ?auto_50868 ?auto_50872 ) ) ( not ( = ?auto_50870 ?auto_50871 ) ) ( not ( = ?auto_50870 ?auto_50869 ) ) ( not ( = ?auto_50870 ?auto_50872 ) ) ( not ( = ?auto_50874 ?auto_50871 ) ) ( not ( = ?auto_50874 ?auto_50869 ) ) ( not ( = ?auto_50874 ?auto_50872 ) ) ( ON ?auto_50873 ?auto_50874 ) ( ON ?auto_50871 ?auto_50873 ) ( CLEAR ?auto_50871 ) ( HOLDING ?auto_50872 ) ( CLEAR ?auto_50869 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50869 ?auto_50872 )
      ( MAKE-1PILE ?auto_50868 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51721 - BLOCK
    )
    :vars
    (
      ?auto_51722 - BLOCK
      ?auto_51724 - BLOCK
      ?auto_51725 - BLOCK
      ?auto_51726 - BLOCK
      ?auto_51723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51722 ?auto_51721 ) ( ON-TABLE ?auto_51721 ) ( not ( = ?auto_51721 ?auto_51722 ) ) ( not ( = ?auto_51721 ?auto_51724 ) ) ( not ( = ?auto_51721 ?auto_51725 ) ) ( not ( = ?auto_51722 ?auto_51724 ) ) ( not ( = ?auto_51722 ?auto_51725 ) ) ( not ( = ?auto_51724 ?auto_51725 ) ) ( ON ?auto_51724 ?auto_51722 ) ( not ( = ?auto_51726 ?auto_51723 ) ) ( not ( = ?auto_51726 ?auto_51725 ) ) ( not ( = ?auto_51723 ?auto_51725 ) ) ( not ( = ?auto_51721 ?auto_51723 ) ) ( not ( = ?auto_51721 ?auto_51726 ) ) ( not ( = ?auto_51722 ?auto_51723 ) ) ( not ( = ?auto_51722 ?auto_51726 ) ) ( not ( = ?auto_51724 ?auto_51723 ) ) ( not ( = ?auto_51724 ?auto_51726 ) ) ( ON ?auto_51725 ?auto_51724 ) ( ON ?auto_51723 ?auto_51725 ) ( ON ?auto_51726 ?auto_51723 ) ( CLEAR ?auto_51726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51721 ?auto_51722 ?auto_51724 ?auto_51725 ?auto_51723 )
      ( MAKE-1PILE ?auto_51721 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50882 - BLOCK
    )
    :vars
    (
      ?auto_50888 - BLOCK
      ?auto_50883 - BLOCK
      ?auto_50886 - BLOCK
      ?auto_50885 - BLOCK
      ?auto_50887 - BLOCK
      ?auto_50884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50888 ?auto_50882 ) ( ON-TABLE ?auto_50882 ) ( not ( = ?auto_50882 ?auto_50888 ) ) ( not ( = ?auto_50882 ?auto_50883 ) ) ( not ( = ?auto_50882 ?auto_50886 ) ) ( not ( = ?auto_50888 ?auto_50883 ) ) ( not ( = ?auto_50888 ?auto_50886 ) ) ( not ( = ?auto_50883 ?auto_50886 ) ) ( ON ?auto_50883 ?auto_50888 ) ( not ( = ?auto_50885 ?auto_50887 ) ) ( not ( = ?auto_50885 ?auto_50884 ) ) ( not ( = ?auto_50885 ?auto_50886 ) ) ( not ( = ?auto_50887 ?auto_50884 ) ) ( not ( = ?auto_50887 ?auto_50886 ) ) ( not ( = ?auto_50884 ?auto_50886 ) ) ( not ( = ?auto_50882 ?auto_50884 ) ) ( not ( = ?auto_50882 ?auto_50885 ) ) ( not ( = ?auto_50882 ?auto_50887 ) ) ( not ( = ?auto_50888 ?auto_50884 ) ) ( not ( = ?auto_50888 ?auto_50885 ) ) ( not ( = ?auto_50888 ?auto_50887 ) ) ( not ( = ?auto_50883 ?auto_50884 ) ) ( not ( = ?auto_50883 ?auto_50885 ) ) ( not ( = ?auto_50883 ?auto_50887 ) ) ( ON ?auto_50886 ?auto_50883 ) ( ON ?auto_50884 ?auto_50886 ) ( ON ?auto_50887 ?auto_50884 ) ( CLEAR ?auto_50887 ) ( HOLDING ?auto_50885 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50885 )
      ( MAKE-1PILE ?auto_50882 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50889 - BLOCK
    )
    :vars
    (
      ?auto_50894 - BLOCK
      ?auto_50895 - BLOCK
      ?auto_50890 - BLOCK
      ?auto_50891 - BLOCK
      ?auto_50893 - BLOCK
      ?auto_50892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50894 ?auto_50889 ) ( ON-TABLE ?auto_50889 ) ( not ( = ?auto_50889 ?auto_50894 ) ) ( not ( = ?auto_50889 ?auto_50895 ) ) ( not ( = ?auto_50889 ?auto_50890 ) ) ( not ( = ?auto_50894 ?auto_50895 ) ) ( not ( = ?auto_50894 ?auto_50890 ) ) ( not ( = ?auto_50895 ?auto_50890 ) ) ( ON ?auto_50895 ?auto_50894 ) ( not ( = ?auto_50891 ?auto_50893 ) ) ( not ( = ?auto_50891 ?auto_50892 ) ) ( not ( = ?auto_50891 ?auto_50890 ) ) ( not ( = ?auto_50893 ?auto_50892 ) ) ( not ( = ?auto_50893 ?auto_50890 ) ) ( not ( = ?auto_50892 ?auto_50890 ) ) ( not ( = ?auto_50889 ?auto_50892 ) ) ( not ( = ?auto_50889 ?auto_50891 ) ) ( not ( = ?auto_50889 ?auto_50893 ) ) ( not ( = ?auto_50894 ?auto_50892 ) ) ( not ( = ?auto_50894 ?auto_50891 ) ) ( not ( = ?auto_50894 ?auto_50893 ) ) ( not ( = ?auto_50895 ?auto_50892 ) ) ( not ( = ?auto_50895 ?auto_50891 ) ) ( not ( = ?auto_50895 ?auto_50893 ) ) ( ON ?auto_50890 ?auto_50895 ) ( ON ?auto_50892 ?auto_50890 ) ( ON ?auto_50893 ?auto_50892 ) ( ON ?auto_50891 ?auto_50893 ) ( CLEAR ?auto_50891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50889 ?auto_50894 ?auto_50895 ?auto_50890 ?auto_50892 ?auto_50893 )
      ( MAKE-1PILE ?auto_50889 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50902 - BLOCK
      ?auto_50903 - BLOCK
      ?auto_50904 - BLOCK
      ?auto_50905 - BLOCK
      ?auto_50906 - BLOCK
      ?auto_50907 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_50907 ) ( CLEAR ?auto_50906 ) ( ON-TABLE ?auto_50902 ) ( ON ?auto_50903 ?auto_50902 ) ( ON ?auto_50904 ?auto_50903 ) ( ON ?auto_50905 ?auto_50904 ) ( ON ?auto_50906 ?auto_50905 ) ( not ( = ?auto_50902 ?auto_50903 ) ) ( not ( = ?auto_50902 ?auto_50904 ) ) ( not ( = ?auto_50902 ?auto_50905 ) ) ( not ( = ?auto_50902 ?auto_50906 ) ) ( not ( = ?auto_50902 ?auto_50907 ) ) ( not ( = ?auto_50903 ?auto_50904 ) ) ( not ( = ?auto_50903 ?auto_50905 ) ) ( not ( = ?auto_50903 ?auto_50906 ) ) ( not ( = ?auto_50903 ?auto_50907 ) ) ( not ( = ?auto_50904 ?auto_50905 ) ) ( not ( = ?auto_50904 ?auto_50906 ) ) ( not ( = ?auto_50904 ?auto_50907 ) ) ( not ( = ?auto_50905 ?auto_50906 ) ) ( not ( = ?auto_50905 ?auto_50907 ) ) ( not ( = ?auto_50906 ?auto_50907 ) ) )
    :subtasks
    ( ( !STACK ?auto_50907 ?auto_50906 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50908 - BLOCK
      ?auto_50909 - BLOCK
      ?auto_50910 - BLOCK
      ?auto_50911 - BLOCK
      ?auto_50912 - BLOCK
      ?auto_50913 - BLOCK
    )
    :vars
    (
      ?auto_50914 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_50912 ) ( ON-TABLE ?auto_50908 ) ( ON ?auto_50909 ?auto_50908 ) ( ON ?auto_50910 ?auto_50909 ) ( ON ?auto_50911 ?auto_50910 ) ( ON ?auto_50912 ?auto_50911 ) ( not ( = ?auto_50908 ?auto_50909 ) ) ( not ( = ?auto_50908 ?auto_50910 ) ) ( not ( = ?auto_50908 ?auto_50911 ) ) ( not ( = ?auto_50908 ?auto_50912 ) ) ( not ( = ?auto_50908 ?auto_50913 ) ) ( not ( = ?auto_50909 ?auto_50910 ) ) ( not ( = ?auto_50909 ?auto_50911 ) ) ( not ( = ?auto_50909 ?auto_50912 ) ) ( not ( = ?auto_50909 ?auto_50913 ) ) ( not ( = ?auto_50910 ?auto_50911 ) ) ( not ( = ?auto_50910 ?auto_50912 ) ) ( not ( = ?auto_50910 ?auto_50913 ) ) ( not ( = ?auto_50911 ?auto_50912 ) ) ( not ( = ?auto_50911 ?auto_50913 ) ) ( not ( = ?auto_50912 ?auto_50913 ) ) ( ON ?auto_50913 ?auto_50914 ) ( CLEAR ?auto_50913 ) ( HAND-EMPTY ) ( not ( = ?auto_50908 ?auto_50914 ) ) ( not ( = ?auto_50909 ?auto_50914 ) ) ( not ( = ?auto_50910 ?auto_50914 ) ) ( not ( = ?auto_50911 ?auto_50914 ) ) ( not ( = ?auto_50912 ?auto_50914 ) ) ( not ( = ?auto_50913 ?auto_50914 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50913 ?auto_50914 )
      ( MAKE-6PILE ?auto_50908 ?auto_50909 ?auto_50910 ?auto_50911 ?auto_50912 ?auto_50913 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50915 - BLOCK
      ?auto_50916 - BLOCK
      ?auto_50917 - BLOCK
      ?auto_50918 - BLOCK
      ?auto_50919 - BLOCK
      ?auto_50920 - BLOCK
    )
    :vars
    (
      ?auto_50921 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50915 ) ( ON ?auto_50916 ?auto_50915 ) ( ON ?auto_50917 ?auto_50916 ) ( ON ?auto_50918 ?auto_50917 ) ( not ( = ?auto_50915 ?auto_50916 ) ) ( not ( = ?auto_50915 ?auto_50917 ) ) ( not ( = ?auto_50915 ?auto_50918 ) ) ( not ( = ?auto_50915 ?auto_50919 ) ) ( not ( = ?auto_50915 ?auto_50920 ) ) ( not ( = ?auto_50916 ?auto_50917 ) ) ( not ( = ?auto_50916 ?auto_50918 ) ) ( not ( = ?auto_50916 ?auto_50919 ) ) ( not ( = ?auto_50916 ?auto_50920 ) ) ( not ( = ?auto_50917 ?auto_50918 ) ) ( not ( = ?auto_50917 ?auto_50919 ) ) ( not ( = ?auto_50917 ?auto_50920 ) ) ( not ( = ?auto_50918 ?auto_50919 ) ) ( not ( = ?auto_50918 ?auto_50920 ) ) ( not ( = ?auto_50919 ?auto_50920 ) ) ( ON ?auto_50920 ?auto_50921 ) ( CLEAR ?auto_50920 ) ( not ( = ?auto_50915 ?auto_50921 ) ) ( not ( = ?auto_50916 ?auto_50921 ) ) ( not ( = ?auto_50917 ?auto_50921 ) ) ( not ( = ?auto_50918 ?auto_50921 ) ) ( not ( = ?auto_50919 ?auto_50921 ) ) ( not ( = ?auto_50920 ?auto_50921 ) ) ( HOLDING ?auto_50919 ) ( CLEAR ?auto_50918 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50915 ?auto_50916 ?auto_50917 ?auto_50918 ?auto_50919 )
      ( MAKE-6PILE ?auto_50915 ?auto_50916 ?auto_50917 ?auto_50918 ?auto_50919 ?auto_50920 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50922 - BLOCK
      ?auto_50923 - BLOCK
      ?auto_50924 - BLOCK
      ?auto_50925 - BLOCK
      ?auto_50926 - BLOCK
      ?auto_50927 - BLOCK
    )
    :vars
    (
      ?auto_50928 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50922 ) ( ON ?auto_50923 ?auto_50922 ) ( ON ?auto_50924 ?auto_50923 ) ( ON ?auto_50925 ?auto_50924 ) ( not ( = ?auto_50922 ?auto_50923 ) ) ( not ( = ?auto_50922 ?auto_50924 ) ) ( not ( = ?auto_50922 ?auto_50925 ) ) ( not ( = ?auto_50922 ?auto_50926 ) ) ( not ( = ?auto_50922 ?auto_50927 ) ) ( not ( = ?auto_50923 ?auto_50924 ) ) ( not ( = ?auto_50923 ?auto_50925 ) ) ( not ( = ?auto_50923 ?auto_50926 ) ) ( not ( = ?auto_50923 ?auto_50927 ) ) ( not ( = ?auto_50924 ?auto_50925 ) ) ( not ( = ?auto_50924 ?auto_50926 ) ) ( not ( = ?auto_50924 ?auto_50927 ) ) ( not ( = ?auto_50925 ?auto_50926 ) ) ( not ( = ?auto_50925 ?auto_50927 ) ) ( not ( = ?auto_50926 ?auto_50927 ) ) ( ON ?auto_50927 ?auto_50928 ) ( not ( = ?auto_50922 ?auto_50928 ) ) ( not ( = ?auto_50923 ?auto_50928 ) ) ( not ( = ?auto_50924 ?auto_50928 ) ) ( not ( = ?auto_50925 ?auto_50928 ) ) ( not ( = ?auto_50926 ?auto_50928 ) ) ( not ( = ?auto_50927 ?auto_50928 ) ) ( CLEAR ?auto_50925 ) ( ON ?auto_50926 ?auto_50927 ) ( CLEAR ?auto_50926 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50928 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50928 ?auto_50927 )
      ( MAKE-6PILE ?auto_50922 ?auto_50923 ?auto_50924 ?auto_50925 ?auto_50926 ?auto_50927 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50929 - BLOCK
      ?auto_50930 - BLOCK
      ?auto_50931 - BLOCK
      ?auto_50932 - BLOCK
      ?auto_50933 - BLOCK
      ?auto_50934 - BLOCK
    )
    :vars
    (
      ?auto_50935 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50929 ) ( ON ?auto_50930 ?auto_50929 ) ( ON ?auto_50931 ?auto_50930 ) ( not ( = ?auto_50929 ?auto_50930 ) ) ( not ( = ?auto_50929 ?auto_50931 ) ) ( not ( = ?auto_50929 ?auto_50932 ) ) ( not ( = ?auto_50929 ?auto_50933 ) ) ( not ( = ?auto_50929 ?auto_50934 ) ) ( not ( = ?auto_50930 ?auto_50931 ) ) ( not ( = ?auto_50930 ?auto_50932 ) ) ( not ( = ?auto_50930 ?auto_50933 ) ) ( not ( = ?auto_50930 ?auto_50934 ) ) ( not ( = ?auto_50931 ?auto_50932 ) ) ( not ( = ?auto_50931 ?auto_50933 ) ) ( not ( = ?auto_50931 ?auto_50934 ) ) ( not ( = ?auto_50932 ?auto_50933 ) ) ( not ( = ?auto_50932 ?auto_50934 ) ) ( not ( = ?auto_50933 ?auto_50934 ) ) ( ON ?auto_50934 ?auto_50935 ) ( not ( = ?auto_50929 ?auto_50935 ) ) ( not ( = ?auto_50930 ?auto_50935 ) ) ( not ( = ?auto_50931 ?auto_50935 ) ) ( not ( = ?auto_50932 ?auto_50935 ) ) ( not ( = ?auto_50933 ?auto_50935 ) ) ( not ( = ?auto_50934 ?auto_50935 ) ) ( ON ?auto_50933 ?auto_50934 ) ( CLEAR ?auto_50933 ) ( ON-TABLE ?auto_50935 ) ( HOLDING ?auto_50932 ) ( CLEAR ?auto_50931 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50929 ?auto_50930 ?auto_50931 ?auto_50932 )
      ( MAKE-6PILE ?auto_50929 ?auto_50930 ?auto_50931 ?auto_50932 ?auto_50933 ?auto_50934 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50936 - BLOCK
      ?auto_50937 - BLOCK
      ?auto_50938 - BLOCK
      ?auto_50939 - BLOCK
      ?auto_50940 - BLOCK
      ?auto_50941 - BLOCK
    )
    :vars
    (
      ?auto_50942 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50936 ) ( ON ?auto_50937 ?auto_50936 ) ( ON ?auto_50938 ?auto_50937 ) ( not ( = ?auto_50936 ?auto_50937 ) ) ( not ( = ?auto_50936 ?auto_50938 ) ) ( not ( = ?auto_50936 ?auto_50939 ) ) ( not ( = ?auto_50936 ?auto_50940 ) ) ( not ( = ?auto_50936 ?auto_50941 ) ) ( not ( = ?auto_50937 ?auto_50938 ) ) ( not ( = ?auto_50937 ?auto_50939 ) ) ( not ( = ?auto_50937 ?auto_50940 ) ) ( not ( = ?auto_50937 ?auto_50941 ) ) ( not ( = ?auto_50938 ?auto_50939 ) ) ( not ( = ?auto_50938 ?auto_50940 ) ) ( not ( = ?auto_50938 ?auto_50941 ) ) ( not ( = ?auto_50939 ?auto_50940 ) ) ( not ( = ?auto_50939 ?auto_50941 ) ) ( not ( = ?auto_50940 ?auto_50941 ) ) ( ON ?auto_50941 ?auto_50942 ) ( not ( = ?auto_50936 ?auto_50942 ) ) ( not ( = ?auto_50937 ?auto_50942 ) ) ( not ( = ?auto_50938 ?auto_50942 ) ) ( not ( = ?auto_50939 ?auto_50942 ) ) ( not ( = ?auto_50940 ?auto_50942 ) ) ( not ( = ?auto_50941 ?auto_50942 ) ) ( ON ?auto_50940 ?auto_50941 ) ( ON-TABLE ?auto_50942 ) ( CLEAR ?auto_50938 ) ( ON ?auto_50939 ?auto_50940 ) ( CLEAR ?auto_50939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50942 ?auto_50941 ?auto_50940 )
      ( MAKE-6PILE ?auto_50936 ?auto_50937 ?auto_50938 ?auto_50939 ?auto_50940 ?auto_50941 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50943 - BLOCK
      ?auto_50944 - BLOCK
      ?auto_50945 - BLOCK
      ?auto_50946 - BLOCK
      ?auto_50947 - BLOCK
      ?auto_50948 - BLOCK
    )
    :vars
    (
      ?auto_50949 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50943 ) ( ON ?auto_50944 ?auto_50943 ) ( not ( = ?auto_50943 ?auto_50944 ) ) ( not ( = ?auto_50943 ?auto_50945 ) ) ( not ( = ?auto_50943 ?auto_50946 ) ) ( not ( = ?auto_50943 ?auto_50947 ) ) ( not ( = ?auto_50943 ?auto_50948 ) ) ( not ( = ?auto_50944 ?auto_50945 ) ) ( not ( = ?auto_50944 ?auto_50946 ) ) ( not ( = ?auto_50944 ?auto_50947 ) ) ( not ( = ?auto_50944 ?auto_50948 ) ) ( not ( = ?auto_50945 ?auto_50946 ) ) ( not ( = ?auto_50945 ?auto_50947 ) ) ( not ( = ?auto_50945 ?auto_50948 ) ) ( not ( = ?auto_50946 ?auto_50947 ) ) ( not ( = ?auto_50946 ?auto_50948 ) ) ( not ( = ?auto_50947 ?auto_50948 ) ) ( ON ?auto_50948 ?auto_50949 ) ( not ( = ?auto_50943 ?auto_50949 ) ) ( not ( = ?auto_50944 ?auto_50949 ) ) ( not ( = ?auto_50945 ?auto_50949 ) ) ( not ( = ?auto_50946 ?auto_50949 ) ) ( not ( = ?auto_50947 ?auto_50949 ) ) ( not ( = ?auto_50948 ?auto_50949 ) ) ( ON ?auto_50947 ?auto_50948 ) ( ON-TABLE ?auto_50949 ) ( ON ?auto_50946 ?auto_50947 ) ( CLEAR ?auto_50946 ) ( HOLDING ?auto_50945 ) ( CLEAR ?auto_50944 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50943 ?auto_50944 ?auto_50945 )
      ( MAKE-6PILE ?auto_50943 ?auto_50944 ?auto_50945 ?auto_50946 ?auto_50947 ?auto_50948 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50950 - BLOCK
      ?auto_50951 - BLOCK
      ?auto_50952 - BLOCK
      ?auto_50953 - BLOCK
      ?auto_50954 - BLOCK
      ?auto_50955 - BLOCK
    )
    :vars
    (
      ?auto_50956 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50950 ) ( ON ?auto_50951 ?auto_50950 ) ( not ( = ?auto_50950 ?auto_50951 ) ) ( not ( = ?auto_50950 ?auto_50952 ) ) ( not ( = ?auto_50950 ?auto_50953 ) ) ( not ( = ?auto_50950 ?auto_50954 ) ) ( not ( = ?auto_50950 ?auto_50955 ) ) ( not ( = ?auto_50951 ?auto_50952 ) ) ( not ( = ?auto_50951 ?auto_50953 ) ) ( not ( = ?auto_50951 ?auto_50954 ) ) ( not ( = ?auto_50951 ?auto_50955 ) ) ( not ( = ?auto_50952 ?auto_50953 ) ) ( not ( = ?auto_50952 ?auto_50954 ) ) ( not ( = ?auto_50952 ?auto_50955 ) ) ( not ( = ?auto_50953 ?auto_50954 ) ) ( not ( = ?auto_50953 ?auto_50955 ) ) ( not ( = ?auto_50954 ?auto_50955 ) ) ( ON ?auto_50955 ?auto_50956 ) ( not ( = ?auto_50950 ?auto_50956 ) ) ( not ( = ?auto_50951 ?auto_50956 ) ) ( not ( = ?auto_50952 ?auto_50956 ) ) ( not ( = ?auto_50953 ?auto_50956 ) ) ( not ( = ?auto_50954 ?auto_50956 ) ) ( not ( = ?auto_50955 ?auto_50956 ) ) ( ON ?auto_50954 ?auto_50955 ) ( ON-TABLE ?auto_50956 ) ( ON ?auto_50953 ?auto_50954 ) ( CLEAR ?auto_50951 ) ( ON ?auto_50952 ?auto_50953 ) ( CLEAR ?auto_50952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50956 ?auto_50955 ?auto_50954 ?auto_50953 )
      ( MAKE-6PILE ?auto_50950 ?auto_50951 ?auto_50952 ?auto_50953 ?auto_50954 ?auto_50955 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50957 - BLOCK
      ?auto_50958 - BLOCK
      ?auto_50959 - BLOCK
      ?auto_50960 - BLOCK
      ?auto_50961 - BLOCK
      ?auto_50962 - BLOCK
    )
    :vars
    (
      ?auto_50963 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50957 ) ( not ( = ?auto_50957 ?auto_50958 ) ) ( not ( = ?auto_50957 ?auto_50959 ) ) ( not ( = ?auto_50957 ?auto_50960 ) ) ( not ( = ?auto_50957 ?auto_50961 ) ) ( not ( = ?auto_50957 ?auto_50962 ) ) ( not ( = ?auto_50958 ?auto_50959 ) ) ( not ( = ?auto_50958 ?auto_50960 ) ) ( not ( = ?auto_50958 ?auto_50961 ) ) ( not ( = ?auto_50958 ?auto_50962 ) ) ( not ( = ?auto_50959 ?auto_50960 ) ) ( not ( = ?auto_50959 ?auto_50961 ) ) ( not ( = ?auto_50959 ?auto_50962 ) ) ( not ( = ?auto_50960 ?auto_50961 ) ) ( not ( = ?auto_50960 ?auto_50962 ) ) ( not ( = ?auto_50961 ?auto_50962 ) ) ( ON ?auto_50962 ?auto_50963 ) ( not ( = ?auto_50957 ?auto_50963 ) ) ( not ( = ?auto_50958 ?auto_50963 ) ) ( not ( = ?auto_50959 ?auto_50963 ) ) ( not ( = ?auto_50960 ?auto_50963 ) ) ( not ( = ?auto_50961 ?auto_50963 ) ) ( not ( = ?auto_50962 ?auto_50963 ) ) ( ON ?auto_50961 ?auto_50962 ) ( ON-TABLE ?auto_50963 ) ( ON ?auto_50960 ?auto_50961 ) ( ON ?auto_50959 ?auto_50960 ) ( CLEAR ?auto_50959 ) ( HOLDING ?auto_50958 ) ( CLEAR ?auto_50957 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50957 ?auto_50958 )
      ( MAKE-6PILE ?auto_50957 ?auto_50958 ?auto_50959 ?auto_50960 ?auto_50961 ?auto_50962 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50964 - BLOCK
      ?auto_50965 - BLOCK
      ?auto_50966 - BLOCK
      ?auto_50967 - BLOCK
      ?auto_50968 - BLOCK
      ?auto_50969 - BLOCK
    )
    :vars
    (
      ?auto_50970 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50964 ) ( not ( = ?auto_50964 ?auto_50965 ) ) ( not ( = ?auto_50964 ?auto_50966 ) ) ( not ( = ?auto_50964 ?auto_50967 ) ) ( not ( = ?auto_50964 ?auto_50968 ) ) ( not ( = ?auto_50964 ?auto_50969 ) ) ( not ( = ?auto_50965 ?auto_50966 ) ) ( not ( = ?auto_50965 ?auto_50967 ) ) ( not ( = ?auto_50965 ?auto_50968 ) ) ( not ( = ?auto_50965 ?auto_50969 ) ) ( not ( = ?auto_50966 ?auto_50967 ) ) ( not ( = ?auto_50966 ?auto_50968 ) ) ( not ( = ?auto_50966 ?auto_50969 ) ) ( not ( = ?auto_50967 ?auto_50968 ) ) ( not ( = ?auto_50967 ?auto_50969 ) ) ( not ( = ?auto_50968 ?auto_50969 ) ) ( ON ?auto_50969 ?auto_50970 ) ( not ( = ?auto_50964 ?auto_50970 ) ) ( not ( = ?auto_50965 ?auto_50970 ) ) ( not ( = ?auto_50966 ?auto_50970 ) ) ( not ( = ?auto_50967 ?auto_50970 ) ) ( not ( = ?auto_50968 ?auto_50970 ) ) ( not ( = ?auto_50969 ?auto_50970 ) ) ( ON ?auto_50968 ?auto_50969 ) ( ON-TABLE ?auto_50970 ) ( ON ?auto_50967 ?auto_50968 ) ( ON ?auto_50966 ?auto_50967 ) ( CLEAR ?auto_50964 ) ( ON ?auto_50965 ?auto_50966 ) ( CLEAR ?auto_50965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50970 ?auto_50969 ?auto_50968 ?auto_50967 ?auto_50966 )
      ( MAKE-6PILE ?auto_50964 ?auto_50965 ?auto_50966 ?auto_50967 ?auto_50968 ?auto_50969 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50971 - BLOCK
      ?auto_50972 - BLOCK
      ?auto_50973 - BLOCK
      ?auto_50974 - BLOCK
      ?auto_50975 - BLOCK
      ?auto_50976 - BLOCK
    )
    :vars
    (
      ?auto_50977 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50971 ?auto_50972 ) ) ( not ( = ?auto_50971 ?auto_50973 ) ) ( not ( = ?auto_50971 ?auto_50974 ) ) ( not ( = ?auto_50971 ?auto_50975 ) ) ( not ( = ?auto_50971 ?auto_50976 ) ) ( not ( = ?auto_50972 ?auto_50973 ) ) ( not ( = ?auto_50972 ?auto_50974 ) ) ( not ( = ?auto_50972 ?auto_50975 ) ) ( not ( = ?auto_50972 ?auto_50976 ) ) ( not ( = ?auto_50973 ?auto_50974 ) ) ( not ( = ?auto_50973 ?auto_50975 ) ) ( not ( = ?auto_50973 ?auto_50976 ) ) ( not ( = ?auto_50974 ?auto_50975 ) ) ( not ( = ?auto_50974 ?auto_50976 ) ) ( not ( = ?auto_50975 ?auto_50976 ) ) ( ON ?auto_50976 ?auto_50977 ) ( not ( = ?auto_50971 ?auto_50977 ) ) ( not ( = ?auto_50972 ?auto_50977 ) ) ( not ( = ?auto_50973 ?auto_50977 ) ) ( not ( = ?auto_50974 ?auto_50977 ) ) ( not ( = ?auto_50975 ?auto_50977 ) ) ( not ( = ?auto_50976 ?auto_50977 ) ) ( ON ?auto_50975 ?auto_50976 ) ( ON-TABLE ?auto_50977 ) ( ON ?auto_50974 ?auto_50975 ) ( ON ?auto_50973 ?auto_50974 ) ( ON ?auto_50972 ?auto_50973 ) ( CLEAR ?auto_50972 ) ( HOLDING ?auto_50971 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50971 )
      ( MAKE-6PILE ?auto_50971 ?auto_50972 ?auto_50973 ?auto_50974 ?auto_50975 ?auto_50976 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50978 - BLOCK
      ?auto_50979 - BLOCK
      ?auto_50980 - BLOCK
      ?auto_50981 - BLOCK
      ?auto_50982 - BLOCK
      ?auto_50983 - BLOCK
    )
    :vars
    (
      ?auto_50984 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50978 ?auto_50979 ) ) ( not ( = ?auto_50978 ?auto_50980 ) ) ( not ( = ?auto_50978 ?auto_50981 ) ) ( not ( = ?auto_50978 ?auto_50982 ) ) ( not ( = ?auto_50978 ?auto_50983 ) ) ( not ( = ?auto_50979 ?auto_50980 ) ) ( not ( = ?auto_50979 ?auto_50981 ) ) ( not ( = ?auto_50979 ?auto_50982 ) ) ( not ( = ?auto_50979 ?auto_50983 ) ) ( not ( = ?auto_50980 ?auto_50981 ) ) ( not ( = ?auto_50980 ?auto_50982 ) ) ( not ( = ?auto_50980 ?auto_50983 ) ) ( not ( = ?auto_50981 ?auto_50982 ) ) ( not ( = ?auto_50981 ?auto_50983 ) ) ( not ( = ?auto_50982 ?auto_50983 ) ) ( ON ?auto_50983 ?auto_50984 ) ( not ( = ?auto_50978 ?auto_50984 ) ) ( not ( = ?auto_50979 ?auto_50984 ) ) ( not ( = ?auto_50980 ?auto_50984 ) ) ( not ( = ?auto_50981 ?auto_50984 ) ) ( not ( = ?auto_50982 ?auto_50984 ) ) ( not ( = ?auto_50983 ?auto_50984 ) ) ( ON ?auto_50982 ?auto_50983 ) ( ON-TABLE ?auto_50984 ) ( ON ?auto_50981 ?auto_50982 ) ( ON ?auto_50980 ?auto_50981 ) ( ON ?auto_50979 ?auto_50980 ) ( ON ?auto_50978 ?auto_50979 ) ( CLEAR ?auto_50978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50984 ?auto_50983 ?auto_50982 ?auto_50981 ?auto_50980 ?auto_50979 )
      ( MAKE-6PILE ?auto_50978 ?auto_50979 ?auto_50980 ?auto_50981 ?auto_50982 ?auto_50983 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51065 - BLOCK
    )
    :vars
    (
      ?auto_51066 - BLOCK
      ?auto_51067 - BLOCK
      ?auto_51068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51065 ?auto_51066 ) ( CLEAR ?auto_51065 ) ( not ( = ?auto_51065 ?auto_51066 ) ) ( HOLDING ?auto_51067 ) ( CLEAR ?auto_51068 ) ( not ( = ?auto_51065 ?auto_51067 ) ) ( not ( = ?auto_51065 ?auto_51068 ) ) ( not ( = ?auto_51066 ?auto_51067 ) ) ( not ( = ?auto_51066 ?auto_51068 ) ) ( not ( = ?auto_51067 ?auto_51068 ) ) )
    :subtasks
    ( ( !STACK ?auto_51067 ?auto_51068 )
      ( MAKE-1PILE ?auto_51065 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51069 - BLOCK
    )
    :vars
    (
      ?auto_51071 - BLOCK
      ?auto_51070 - BLOCK
      ?auto_51072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51069 ?auto_51071 ) ( not ( = ?auto_51069 ?auto_51071 ) ) ( CLEAR ?auto_51070 ) ( not ( = ?auto_51069 ?auto_51072 ) ) ( not ( = ?auto_51069 ?auto_51070 ) ) ( not ( = ?auto_51071 ?auto_51072 ) ) ( not ( = ?auto_51071 ?auto_51070 ) ) ( not ( = ?auto_51072 ?auto_51070 ) ) ( ON ?auto_51072 ?auto_51069 ) ( CLEAR ?auto_51072 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51071 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51071 ?auto_51069 )
      ( MAKE-1PILE ?auto_51069 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51073 - BLOCK
    )
    :vars
    (
      ?auto_51076 - BLOCK
      ?auto_51075 - BLOCK
      ?auto_51074 - BLOCK
      ?auto_51079 - BLOCK
      ?auto_51077 - BLOCK
      ?auto_51078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51073 ?auto_51076 ) ( not ( = ?auto_51073 ?auto_51076 ) ) ( not ( = ?auto_51073 ?auto_51075 ) ) ( not ( = ?auto_51073 ?auto_51074 ) ) ( not ( = ?auto_51076 ?auto_51075 ) ) ( not ( = ?auto_51076 ?auto_51074 ) ) ( not ( = ?auto_51075 ?auto_51074 ) ) ( ON ?auto_51075 ?auto_51073 ) ( CLEAR ?auto_51075 ) ( ON-TABLE ?auto_51076 ) ( HOLDING ?auto_51074 ) ( CLEAR ?auto_51079 ) ( ON-TABLE ?auto_51077 ) ( ON ?auto_51078 ?auto_51077 ) ( ON ?auto_51079 ?auto_51078 ) ( not ( = ?auto_51077 ?auto_51078 ) ) ( not ( = ?auto_51077 ?auto_51079 ) ) ( not ( = ?auto_51077 ?auto_51074 ) ) ( not ( = ?auto_51078 ?auto_51079 ) ) ( not ( = ?auto_51078 ?auto_51074 ) ) ( not ( = ?auto_51079 ?auto_51074 ) ) ( not ( = ?auto_51073 ?auto_51079 ) ) ( not ( = ?auto_51073 ?auto_51077 ) ) ( not ( = ?auto_51073 ?auto_51078 ) ) ( not ( = ?auto_51076 ?auto_51079 ) ) ( not ( = ?auto_51076 ?auto_51077 ) ) ( not ( = ?auto_51076 ?auto_51078 ) ) ( not ( = ?auto_51075 ?auto_51079 ) ) ( not ( = ?auto_51075 ?auto_51077 ) ) ( not ( = ?auto_51075 ?auto_51078 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51077 ?auto_51078 ?auto_51079 ?auto_51074 )
      ( MAKE-1PILE ?auto_51073 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51080 - BLOCK
    )
    :vars
    (
      ?auto_51084 - BLOCK
      ?auto_51082 - BLOCK
      ?auto_51086 - BLOCK
      ?auto_51083 - BLOCK
      ?auto_51085 - BLOCK
      ?auto_51081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51080 ?auto_51084 ) ( not ( = ?auto_51080 ?auto_51084 ) ) ( not ( = ?auto_51080 ?auto_51082 ) ) ( not ( = ?auto_51080 ?auto_51086 ) ) ( not ( = ?auto_51084 ?auto_51082 ) ) ( not ( = ?auto_51084 ?auto_51086 ) ) ( not ( = ?auto_51082 ?auto_51086 ) ) ( ON ?auto_51082 ?auto_51080 ) ( ON-TABLE ?auto_51084 ) ( CLEAR ?auto_51083 ) ( ON-TABLE ?auto_51085 ) ( ON ?auto_51081 ?auto_51085 ) ( ON ?auto_51083 ?auto_51081 ) ( not ( = ?auto_51085 ?auto_51081 ) ) ( not ( = ?auto_51085 ?auto_51083 ) ) ( not ( = ?auto_51085 ?auto_51086 ) ) ( not ( = ?auto_51081 ?auto_51083 ) ) ( not ( = ?auto_51081 ?auto_51086 ) ) ( not ( = ?auto_51083 ?auto_51086 ) ) ( not ( = ?auto_51080 ?auto_51083 ) ) ( not ( = ?auto_51080 ?auto_51085 ) ) ( not ( = ?auto_51080 ?auto_51081 ) ) ( not ( = ?auto_51084 ?auto_51083 ) ) ( not ( = ?auto_51084 ?auto_51085 ) ) ( not ( = ?auto_51084 ?auto_51081 ) ) ( not ( = ?auto_51082 ?auto_51083 ) ) ( not ( = ?auto_51082 ?auto_51085 ) ) ( not ( = ?auto_51082 ?auto_51081 ) ) ( ON ?auto_51086 ?auto_51082 ) ( CLEAR ?auto_51086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51084 ?auto_51080 ?auto_51082 )
      ( MAKE-1PILE ?auto_51080 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51087 - BLOCK
    )
    :vars
    (
      ?auto_51093 - BLOCK
      ?auto_51092 - BLOCK
      ?auto_51088 - BLOCK
      ?auto_51090 - BLOCK
      ?auto_51089 - BLOCK
      ?auto_51091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51087 ?auto_51093 ) ( not ( = ?auto_51087 ?auto_51093 ) ) ( not ( = ?auto_51087 ?auto_51092 ) ) ( not ( = ?auto_51087 ?auto_51088 ) ) ( not ( = ?auto_51093 ?auto_51092 ) ) ( not ( = ?auto_51093 ?auto_51088 ) ) ( not ( = ?auto_51092 ?auto_51088 ) ) ( ON ?auto_51092 ?auto_51087 ) ( ON-TABLE ?auto_51093 ) ( ON-TABLE ?auto_51090 ) ( ON ?auto_51089 ?auto_51090 ) ( not ( = ?auto_51090 ?auto_51089 ) ) ( not ( = ?auto_51090 ?auto_51091 ) ) ( not ( = ?auto_51090 ?auto_51088 ) ) ( not ( = ?auto_51089 ?auto_51091 ) ) ( not ( = ?auto_51089 ?auto_51088 ) ) ( not ( = ?auto_51091 ?auto_51088 ) ) ( not ( = ?auto_51087 ?auto_51091 ) ) ( not ( = ?auto_51087 ?auto_51090 ) ) ( not ( = ?auto_51087 ?auto_51089 ) ) ( not ( = ?auto_51093 ?auto_51091 ) ) ( not ( = ?auto_51093 ?auto_51090 ) ) ( not ( = ?auto_51093 ?auto_51089 ) ) ( not ( = ?auto_51092 ?auto_51091 ) ) ( not ( = ?auto_51092 ?auto_51090 ) ) ( not ( = ?auto_51092 ?auto_51089 ) ) ( ON ?auto_51088 ?auto_51092 ) ( CLEAR ?auto_51088 ) ( HOLDING ?auto_51091 ) ( CLEAR ?auto_51089 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51090 ?auto_51089 ?auto_51091 )
      ( MAKE-1PILE ?auto_51087 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51094 - BLOCK
    )
    :vars
    (
      ?auto_51097 - BLOCK
      ?auto_51098 - BLOCK
      ?auto_51099 - BLOCK
      ?auto_51096 - BLOCK
      ?auto_51100 - BLOCK
      ?auto_51095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51094 ?auto_51097 ) ( not ( = ?auto_51094 ?auto_51097 ) ) ( not ( = ?auto_51094 ?auto_51098 ) ) ( not ( = ?auto_51094 ?auto_51099 ) ) ( not ( = ?auto_51097 ?auto_51098 ) ) ( not ( = ?auto_51097 ?auto_51099 ) ) ( not ( = ?auto_51098 ?auto_51099 ) ) ( ON ?auto_51098 ?auto_51094 ) ( ON-TABLE ?auto_51097 ) ( ON-TABLE ?auto_51096 ) ( ON ?auto_51100 ?auto_51096 ) ( not ( = ?auto_51096 ?auto_51100 ) ) ( not ( = ?auto_51096 ?auto_51095 ) ) ( not ( = ?auto_51096 ?auto_51099 ) ) ( not ( = ?auto_51100 ?auto_51095 ) ) ( not ( = ?auto_51100 ?auto_51099 ) ) ( not ( = ?auto_51095 ?auto_51099 ) ) ( not ( = ?auto_51094 ?auto_51095 ) ) ( not ( = ?auto_51094 ?auto_51096 ) ) ( not ( = ?auto_51094 ?auto_51100 ) ) ( not ( = ?auto_51097 ?auto_51095 ) ) ( not ( = ?auto_51097 ?auto_51096 ) ) ( not ( = ?auto_51097 ?auto_51100 ) ) ( not ( = ?auto_51098 ?auto_51095 ) ) ( not ( = ?auto_51098 ?auto_51096 ) ) ( not ( = ?auto_51098 ?auto_51100 ) ) ( ON ?auto_51099 ?auto_51098 ) ( CLEAR ?auto_51100 ) ( ON ?auto_51095 ?auto_51099 ) ( CLEAR ?auto_51095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51097 ?auto_51094 ?auto_51098 ?auto_51099 )
      ( MAKE-1PILE ?auto_51094 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51101 - BLOCK
    )
    :vars
    (
      ?auto_51105 - BLOCK
      ?auto_51103 - BLOCK
      ?auto_51107 - BLOCK
      ?auto_51106 - BLOCK
      ?auto_51102 - BLOCK
      ?auto_51104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51101 ?auto_51105 ) ( not ( = ?auto_51101 ?auto_51105 ) ) ( not ( = ?auto_51101 ?auto_51103 ) ) ( not ( = ?auto_51101 ?auto_51107 ) ) ( not ( = ?auto_51105 ?auto_51103 ) ) ( not ( = ?auto_51105 ?auto_51107 ) ) ( not ( = ?auto_51103 ?auto_51107 ) ) ( ON ?auto_51103 ?auto_51101 ) ( ON-TABLE ?auto_51105 ) ( ON-TABLE ?auto_51106 ) ( not ( = ?auto_51106 ?auto_51102 ) ) ( not ( = ?auto_51106 ?auto_51104 ) ) ( not ( = ?auto_51106 ?auto_51107 ) ) ( not ( = ?auto_51102 ?auto_51104 ) ) ( not ( = ?auto_51102 ?auto_51107 ) ) ( not ( = ?auto_51104 ?auto_51107 ) ) ( not ( = ?auto_51101 ?auto_51104 ) ) ( not ( = ?auto_51101 ?auto_51106 ) ) ( not ( = ?auto_51101 ?auto_51102 ) ) ( not ( = ?auto_51105 ?auto_51104 ) ) ( not ( = ?auto_51105 ?auto_51106 ) ) ( not ( = ?auto_51105 ?auto_51102 ) ) ( not ( = ?auto_51103 ?auto_51104 ) ) ( not ( = ?auto_51103 ?auto_51106 ) ) ( not ( = ?auto_51103 ?auto_51102 ) ) ( ON ?auto_51107 ?auto_51103 ) ( ON ?auto_51104 ?auto_51107 ) ( CLEAR ?auto_51104 ) ( HOLDING ?auto_51102 ) ( CLEAR ?auto_51106 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51106 ?auto_51102 )
      ( MAKE-1PILE ?auto_51101 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51108 - BLOCK
    )
    :vars
    (
      ?auto_51113 - BLOCK
      ?auto_51109 - BLOCK
      ?auto_51110 - BLOCK
      ?auto_51111 - BLOCK
      ?auto_51112 - BLOCK
      ?auto_51114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51108 ?auto_51113 ) ( not ( = ?auto_51108 ?auto_51113 ) ) ( not ( = ?auto_51108 ?auto_51109 ) ) ( not ( = ?auto_51108 ?auto_51110 ) ) ( not ( = ?auto_51113 ?auto_51109 ) ) ( not ( = ?auto_51113 ?auto_51110 ) ) ( not ( = ?auto_51109 ?auto_51110 ) ) ( ON ?auto_51109 ?auto_51108 ) ( ON-TABLE ?auto_51113 ) ( ON-TABLE ?auto_51111 ) ( not ( = ?auto_51111 ?auto_51112 ) ) ( not ( = ?auto_51111 ?auto_51114 ) ) ( not ( = ?auto_51111 ?auto_51110 ) ) ( not ( = ?auto_51112 ?auto_51114 ) ) ( not ( = ?auto_51112 ?auto_51110 ) ) ( not ( = ?auto_51114 ?auto_51110 ) ) ( not ( = ?auto_51108 ?auto_51114 ) ) ( not ( = ?auto_51108 ?auto_51111 ) ) ( not ( = ?auto_51108 ?auto_51112 ) ) ( not ( = ?auto_51113 ?auto_51114 ) ) ( not ( = ?auto_51113 ?auto_51111 ) ) ( not ( = ?auto_51113 ?auto_51112 ) ) ( not ( = ?auto_51109 ?auto_51114 ) ) ( not ( = ?auto_51109 ?auto_51111 ) ) ( not ( = ?auto_51109 ?auto_51112 ) ) ( ON ?auto_51110 ?auto_51109 ) ( ON ?auto_51114 ?auto_51110 ) ( CLEAR ?auto_51111 ) ( ON ?auto_51112 ?auto_51114 ) ( CLEAR ?auto_51112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51113 ?auto_51108 ?auto_51109 ?auto_51110 ?auto_51114 )
      ( MAKE-1PILE ?auto_51108 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51115 - BLOCK
    )
    :vars
    (
      ?auto_51117 - BLOCK
      ?auto_51118 - BLOCK
      ?auto_51121 - BLOCK
      ?auto_51119 - BLOCK
      ?auto_51116 - BLOCK
      ?auto_51120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51115 ?auto_51117 ) ( not ( = ?auto_51115 ?auto_51117 ) ) ( not ( = ?auto_51115 ?auto_51118 ) ) ( not ( = ?auto_51115 ?auto_51121 ) ) ( not ( = ?auto_51117 ?auto_51118 ) ) ( not ( = ?auto_51117 ?auto_51121 ) ) ( not ( = ?auto_51118 ?auto_51121 ) ) ( ON ?auto_51118 ?auto_51115 ) ( ON-TABLE ?auto_51117 ) ( not ( = ?auto_51119 ?auto_51116 ) ) ( not ( = ?auto_51119 ?auto_51120 ) ) ( not ( = ?auto_51119 ?auto_51121 ) ) ( not ( = ?auto_51116 ?auto_51120 ) ) ( not ( = ?auto_51116 ?auto_51121 ) ) ( not ( = ?auto_51120 ?auto_51121 ) ) ( not ( = ?auto_51115 ?auto_51120 ) ) ( not ( = ?auto_51115 ?auto_51119 ) ) ( not ( = ?auto_51115 ?auto_51116 ) ) ( not ( = ?auto_51117 ?auto_51120 ) ) ( not ( = ?auto_51117 ?auto_51119 ) ) ( not ( = ?auto_51117 ?auto_51116 ) ) ( not ( = ?auto_51118 ?auto_51120 ) ) ( not ( = ?auto_51118 ?auto_51119 ) ) ( not ( = ?auto_51118 ?auto_51116 ) ) ( ON ?auto_51121 ?auto_51118 ) ( ON ?auto_51120 ?auto_51121 ) ( ON ?auto_51116 ?auto_51120 ) ( CLEAR ?auto_51116 ) ( HOLDING ?auto_51119 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51119 )
      ( MAKE-1PILE ?auto_51115 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51122 - BLOCK
    )
    :vars
    (
      ?auto_51123 - BLOCK
      ?auto_51126 - BLOCK
      ?auto_51127 - BLOCK
      ?auto_51125 - BLOCK
      ?auto_51128 - BLOCK
      ?auto_51124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51122 ?auto_51123 ) ( not ( = ?auto_51122 ?auto_51123 ) ) ( not ( = ?auto_51122 ?auto_51126 ) ) ( not ( = ?auto_51122 ?auto_51127 ) ) ( not ( = ?auto_51123 ?auto_51126 ) ) ( not ( = ?auto_51123 ?auto_51127 ) ) ( not ( = ?auto_51126 ?auto_51127 ) ) ( ON ?auto_51126 ?auto_51122 ) ( ON-TABLE ?auto_51123 ) ( not ( = ?auto_51125 ?auto_51128 ) ) ( not ( = ?auto_51125 ?auto_51124 ) ) ( not ( = ?auto_51125 ?auto_51127 ) ) ( not ( = ?auto_51128 ?auto_51124 ) ) ( not ( = ?auto_51128 ?auto_51127 ) ) ( not ( = ?auto_51124 ?auto_51127 ) ) ( not ( = ?auto_51122 ?auto_51124 ) ) ( not ( = ?auto_51122 ?auto_51125 ) ) ( not ( = ?auto_51122 ?auto_51128 ) ) ( not ( = ?auto_51123 ?auto_51124 ) ) ( not ( = ?auto_51123 ?auto_51125 ) ) ( not ( = ?auto_51123 ?auto_51128 ) ) ( not ( = ?auto_51126 ?auto_51124 ) ) ( not ( = ?auto_51126 ?auto_51125 ) ) ( not ( = ?auto_51126 ?auto_51128 ) ) ( ON ?auto_51127 ?auto_51126 ) ( ON ?auto_51124 ?auto_51127 ) ( ON ?auto_51128 ?auto_51124 ) ( ON ?auto_51125 ?auto_51128 ) ( CLEAR ?auto_51125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_51123 ?auto_51122 ?auto_51126 ?auto_51127 ?auto_51124 ?auto_51128 )
      ( MAKE-1PILE ?auto_51122 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51138 - BLOCK
      ?auto_51139 - BLOCK
      ?auto_51140 - BLOCK
      ?auto_51141 - BLOCK
    )
    :vars
    (
      ?auto_51142 - BLOCK
      ?auto_51143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51142 ?auto_51141 ) ( CLEAR ?auto_51142 ) ( ON-TABLE ?auto_51138 ) ( ON ?auto_51139 ?auto_51138 ) ( ON ?auto_51140 ?auto_51139 ) ( ON ?auto_51141 ?auto_51140 ) ( not ( = ?auto_51138 ?auto_51139 ) ) ( not ( = ?auto_51138 ?auto_51140 ) ) ( not ( = ?auto_51138 ?auto_51141 ) ) ( not ( = ?auto_51138 ?auto_51142 ) ) ( not ( = ?auto_51139 ?auto_51140 ) ) ( not ( = ?auto_51139 ?auto_51141 ) ) ( not ( = ?auto_51139 ?auto_51142 ) ) ( not ( = ?auto_51140 ?auto_51141 ) ) ( not ( = ?auto_51140 ?auto_51142 ) ) ( not ( = ?auto_51141 ?auto_51142 ) ) ( HOLDING ?auto_51143 ) ( not ( = ?auto_51138 ?auto_51143 ) ) ( not ( = ?auto_51139 ?auto_51143 ) ) ( not ( = ?auto_51140 ?auto_51143 ) ) ( not ( = ?auto_51141 ?auto_51143 ) ) ( not ( = ?auto_51142 ?auto_51143 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_51143 )
      ( MAKE-4PILE ?auto_51138 ?auto_51139 ?auto_51140 ?auto_51141 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51211 - BLOCK
      ?auto_51212 - BLOCK
    )
    :vars
    (
      ?auto_51213 - BLOCK
      ?auto_51216 - BLOCK
      ?auto_51215 - BLOCK
      ?auto_51214 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51211 ?auto_51212 ) ) ( ON ?auto_51212 ?auto_51213 ) ( not ( = ?auto_51211 ?auto_51213 ) ) ( not ( = ?auto_51212 ?auto_51213 ) ) ( ON ?auto_51211 ?auto_51212 ) ( CLEAR ?auto_51211 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51216 ) ( ON ?auto_51215 ?auto_51216 ) ( ON ?auto_51214 ?auto_51215 ) ( ON ?auto_51213 ?auto_51214 ) ( not ( = ?auto_51216 ?auto_51215 ) ) ( not ( = ?auto_51216 ?auto_51214 ) ) ( not ( = ?auto_51216 ?auto_51213 ) ) ( not ( = ?auto_51216 ?auto_51212 ) ) ( not ( = ?auto_51216 ?auto_51211 ) ) ( not ( = ?auto_51215 ?auto_51214 ) ) ( not ( = ?auto_51215 ?auto_51213 ) ) ( not ( = ?auto_51215 ?auto_51212 ) ) ( not ( = ?auto_51215 ?auto_51211 ) ) ( not ( = ?auto_51214 ?auto_51213 ) ) ( not ( = ?auto_51214 ?auto_51212 ) ) ( not ( = ?auto_51214 ?auto_51211 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51216 ?auto_51215 ?auto_51214 ?auto_51213 ?auto_51212 )
      ( MAKE-2PILE ?auto_51211 ?auto_51212 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51219 - BLOCK
      ?auto_51220 - BLOCK
    )
    :vars
    (
      ?auto_51221 - BLOCK
      ?auto_51222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51219 ?auto_51220 ) ) ( ON ?auto_51220 ?auto_51221 ) ( CLEAR ?auto_51220 ) ( not ( = ?auto_51219 ?auto_51221 ) ) ( not ( = ?auto_51220 ?auto_51221 ) ) ( ON ?auto_51219 ?auto_51222 ) ( CLEAR ?auto_51219 ) ( HAND-EMPTY ) ( not ( = ?auto_51219 ?auto_51222 ) ) ( not ( = ?auto_51220 ?auto_51222 ) ) ( not ( = ?auto_51221 ?auto_51222 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51219 ?auto_51222 )
      ( MAKE-2PILE ?auto_51219 ?auto_51220 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51223 - BLOCK
      ?auto_51224 - BLOCK
    )
    :vars
    (
      ?auto_51225 - BLOCK
      ?auto_51226 - BLOCK
      ?auto_51229 - BLOCK
      ?auto_51227 - BLOCK
      ?auto_51228 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51223 ?auto_51224 ) ) ( not ( = ?auto_51223 ?auto_51225 ) ) ( not ( = ?auto_51224 ?auto_51225 ) ) ( ON ?auto_51223 ?auto_51226 ) ( CLEAR ?auto_51223 ) ( not ( = ?auto_51223 ?auto_51226 ) ) ( not ( = ?auto_51224 ?auto_51226 ) ) ( not ( = ?auto_51225 ?auto_51226 ) ) ( HOLDING ?auto_51224 ) ( CLEAR ?auto_51225 ) ( ON-TABLE ?auto_51229 ) ( ON ?auto_51227 ?auto_51229 ) ( ON ?auto_51228 ?auto_51227 ) ( ON ?auto_51225 ?auto_51228 ) ( not ( = ?auto_51229 ?auto_51227 ) ) ( not ( = ?auto_51229 ?auto_51228 ) ) ( not ( = ?auto_51229 ?auto_51225 ) ) ( not ( = ?auto_51229 ?auto_51224 ) ) ( not ( = ?auto_51227 ?auto_51228 ) ) ( not ( = ?auto_51227 ?auto_51225 ) ) ( not ( = ?auto_51227 ?auto_51224 ) ) ( not ( = ?auto_51228 ?auto_51225 ) ) ( not ( = ?auto_51228 ?auto_51224 ) ) ( not ( = ?auto_51223 ?auto_51229 ) ) ( not ( = ?auto_51223 ?auto_51227 ) ) ( not ( = ?auto_51223 ?auto_51228 ) ) ( not ( = ?auto_51226 ?auto_51229 ) ) ( not ( = ?auto_51226 ?auto_51227 ) ) ( not ( = ?auto_51226 ?auto_51228 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51229 ?auto_51227 ?auto_51228 ?auto_51225 ?auto_51224 )
      ( MAKE-2PILE ?auto_51223 ?auto_51224 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51230 - BLOCK
      ?auto_51231 - BLOCK
    )
    :vars
    (
      ?auto_51235 - BLOCK
      ?auto_51234 - BLOCK
      ?auto_51236 - BLOCK
      ?auto_51233 - BLOCK
      ?auto_51232 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51230 ?auto_51231 ) ) ( not ( = ?auto_51230 ?auto_51235 ) ) ( not ( = ?auto_51231 ?auto_51235 ) ) ( ON ?auto_51230 ?auto_51234 ) ( not ( = ?auto_51230 ?auto_51234 ) ) ( not ( = ?auto_51231 ?auto_51234 ) ) ( not ( = ?auto_51235 ?auto_51234 ) ) ( CLEAR ?auto_51235 ) ( ON-TABLE ?auto_51236 ) ( ON ?auto_51233 ?auto_51236 ) ( ON ?auto_51232 ?auto_51233 ) ( ON ?auto_51235 ?auto_51232 ) ( not ( = ?auto_51236 ?auto_51233 ) ) ( not ( = ?auto_51236 ?auto_51232 ) ) ( not ( = ?auto_51236 ?auto_51235 ) ) ( not ( = ?auto_51236 ?auto_51231 ) ) ( not ( = ?auto_51233 ?auto_51232 ) ) ( not ( = ?auto_51233 ?auto_51235 ) ) ( not ( = ?auto_51233 ?auto_51231 ) ) ( not ( = ?auto_51232 ?auto_51235 ) ) ( not ( = ?auto_51232 ?auto_51231 ) ) ( not ( = ?auto_51230 ?auto_51236 ) ) ( not ( = ?auto_51230 ?auto_51233 ) ) ( not ( = ?auto_51230 ?auto_51232 ) ) ( not ( = ?auto_51234 ?auto_51236 ) ) ( not ( = ?auto_51234 ?auto_51233 ) ) ( not ( = ?auto_51234 ?auto_51232 ) ) ( ON ?auto_51231 ?auto_51230 ) ( CLEAR ?auto_51231 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51234 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51234 ?auto_51230 )
      ( MAKE-2PILE ?auto_51230 ?auto_51231 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51237 - BLOCK
      ?auto_51238 - BLOCK
    )
    :vars
    (
      ?auto_51243 - BLOCK
      ?auto_51241 - BLOCK
      ?auto_51240 - BLOCK
      ?auto_51239 - BLOCK
      ?auto_51242 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51237 ?auto_51238 ) ) ( not ( = ?auto_51237 ?auto_51243 ) ) ( not ( = ?auto_51238 ?auto_51243 ) ) ( ON ?auto_51237 ?auto_51241 ) ( not ( = ?auto_51237 ?auto_51241 ) ) ( not ( = ?auto_51238 ?auto_51241 ) ) ( not ( = ?auto_51243 ?auto_51241 ) ) ( ON-TABLE ?auto_51240 ) ( ON ?auto_51239 ?auto_51240 ) ( ON ?auto_51242 ?auto_51239 ) ( not ( = ?auto_51240 ?auto_51239 ) ) ( not ( = ?auto_51240 ?auto_51242 ) ) ( not ( = ?auto_51240 ?auto_51243 ) ) ( not ( = ?auto_51240 ?auto_51238 ) ) ( not ( = ?auto_51239 ?auto_51242 ) ) ( not ( = ?auto_51239 ?auto_51243 ) ) ( not ( = ?auto_51239 ?auto_51238 ) ) ( not ( = ?auto_51242 ?auto_51243 ) ) ( not ( = ?auto_51242 ?auto_51238 ) ) ( not ( = ?auto_51237 ?auto_51240 ) ) ( not ( = ?auto_51237 ?auto_51239 ) ) ( not ( = ?auto_51237 ?auto_51242 ) ) ( not ( = ?auto_51241 ?auto_51240 ) ) ( not ( = ?auto_51241 ?auto_51239 ) ) ( not ( = ?auto_51241 ?auto_51242 ) ) ( ON ?auto_51238 ?auto_51237 ) ( CLEAR ?auto_51238 ) ( ON-TABLE ?auto_51241 ) ( HOLDING ?auto_51243 ) ( CLEAR ?auto_51242 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51240 ?auto_51239 ?auto_51242 ?auto_51243 )
      ( MAKE-2PILE ?auto_51237 ?auto_51238 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51244 - BLOCK
      ?auto_51245 - BLOCK
    )
    :vars
    (
      ?auto_51247 - BLOCK
      ?auto_51250 - BLOCK
      ?auto_51249 - BLOCK
      ?auto_51248 - BLOCK
      ?auto_51246 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51244 ?auto_51245 ) ) ( not ( = ?auto_51244 ?auto_51247 ) ) ( not ( = ?auto_51245 ?auto_51247 ) ) ( ON ?auto_51244 ?auto_51250 ) ( not ( = ?auto_51244 ?auto_51250 ) ) ( not ( = ?auto_51245 ?auto_51250 ) ) ( not ( = ?auto_51247 ?auto_51250 ) ) ( ON-TABLE ?auto_51249 ) ( ON ?auto_51248 ?auto_51249 ) ( ON ?auto_51246 ?auto_51248 ) ( not ( = ?auto_51249 ?auto_51248 ) ) ( not ( = ?auto_51249 ?auto_51246 ) ) ( not ( = ?auto_51249 ?auto_51247 ) ) ( not ( = ?auto_51249 ?auto_51245 ) ) ( not ( = ?auto_51248 ?auto_51246 ) ) ( not ( = ?auto_51248 ?auto_51247 ) ) ( not ( = ?auto_51248 ?auto_51245 ) ) ( not ( = ?auto_51246 ?auto_51247 ) ) ( not ( = ?auto_51246 ?auto_51245 ) ) ( not ( = ?auto_51244 ?auto_51249 ) ) ( not ( = ?auto_51244 ?auto_51248 ) ) ( not ( = ?auto_51244 ?auto_51246 ) ) ( not ( = ?auto_51250 ?auto_51249 ) ) ( not ( = ?auto_51250 ?auto_51248 ) ) ( not ( = ?auto_51250 ?auto_51246 ) ) ( ON ?auto_51245 ?auto_51244 ) ( ON-TABLE ?auto_51250 ) ( CLEAR ?auto_51246 ) ( ON ?auto_51247 ?auto_51245 ) ( CLEAR ?auto_51247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51250 ?auto_51244 ?auto_51245 )
      ( MAKE-2PILE ?auto_51244 ?auto_51245 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51251 - BLOCK
      ?auto_51252 - BLOCK
    )
    :vars
    (
      ?auto_51257 - BLOCK
      ?auto_51256 - BLOCK
      ?auto_51255 - BLOCK
      ?auto_51254 - BLOCK
      ?auto_51253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51251 ?auto_51252 ) ) ( not ( = ?auto_51251 ?auto_51257 ) ) ( not ( = ?auto_51252 ?auto_51257 ) ) ( ON ?auto_51251 ?auto_51256 ) ( not ( = ?auto_51251 ?auto_51256 ) ) ( not ( = ?auto_51252 ?auto_51256 ) ) ( not ( = ?auto_51257 ?auto_51256 ) ) ( ON-TABLE ?auto_51255 ) ( ON ?auto_51254 ?auto_51255 ) ( not ( = ?auto_51255 ?auto_51254 ) ) ( not ( = ?auto_51255 ?auto_51253 ) ) ( not ( = ?auto_51255 ?auto_51257 ) ) ( not ( = ?auto_51255 ?auto_51252 ) ) ( not ( = ?auto_51254 ?auto_51253 ) ) ( not ( = ?auto_51254 ?auto_51257 ) ) ( not ( = ?auto_51254 ?auto_51252 ) ) ( not ( = ?auto_51253 ?auto_51257 ) ) ( not ( = ?auto_51253 ?auto_51252 ) ) ( not ( = ?auto_51251 ?auto_51255 ) ) ( not ( = ?auto_51251 ?auto_51254 ) ) ( not ( = ?auto_51251 ?auto_51253 ) ) ( not ( = ?auto_51256 ?auto_51255 ) ) ( not ( = ?auto_51256 ?auto_51254 ) ) ( not ( = ?auto_51256 ?auto_51253 ) ) ( ON ?auto_51252 ?auto_51251 ) ( ON-TABLE ?auto_51256 ) ( ON ?auto_51257 ?auto_51252 ) ( CLEAR ?auto_51257 ) ( HOLDING ?auto_51253 ) ( CLEAR ?auto_51254 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51255 ?auto_51254 ?auto_51253 )
      ( MAKE-2PILE ?auto_51251 ?auto_51252 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51258 - BLOCK
      ?auto_51259 - BLOCK
    )
    :vars
    (
      ?auto_51260 - BLOCK
      ?auto_51264 - BLOCK
      ?auto_51262 - BLOCK
      ?auto_51261 - BLOCK
      ?auto_51263 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51258 ?auto_51259 ) ) ( not ( = ?auto_51258 ?auto_51260 ) ) ( not ( = ?auto_51259 ?auto_51260 ) ) ( ON ?auto_51258 ?auto_51264 ) ( not ( = ?auto_51258 ?auto_51264 ) ) ( not ( = ?auto_51259 ?auto_51264 ) ) ( not ( = ?auto_51260 ?auto_51264 ) ) ( ON-TABLE ?auto_51262 ) ( ON ?auto_51261 ?auto_51262 ) ( not ( = ?auto_51262 ?auto_51261 ) ) ( not ( = ?auto_51262 ?auto_51263 ) ) ( not ( = ?auto_51262 ?auto_51260 ) ) ( not ( = ?auto_51262 ?auto_51259 ) ) ( not ( = ?auto_51261 ?auto_51263 ) ) ( not ( = ?auto_51261 ?auto_51260 ) ) ( not ( = ?auto_51261 ?auto_51259 ) ) ( not ( = ?auto_51263 ?auto_51260 ) ) ( not ( = ?auto_51263 ?auto_51259 ) ) ( not ( = ?auto_51258 ?auto_51262 ) ) ( not ( = ?auto_51258 ?auto_51261 ) ) ( not ( = ?auto_51258 ?auto_51263 ) ) ( not ( = ?auto_51264 ?auto_51262 ) ) ( not ( = ?auto_51264 ?auto_51261 ) ) ( not ( = ?auto_51264 ?auto_51263 ) ) ( ON ?auto_51259 ?auto_51258 ) ( ON-TABLE ?auto_51264 ) ( ON ?auto_51260 ?auto_51259 ) ( CLEAR ?auto_51261 ) ( ON ?auto_51263 ?auto_51260 ) ( CLEAR ?auto_51263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51264 ?auto_51258 ?auto_51259 ?auto_51260 )
      ( MAKE-2PILE ?auto_51258 ?auto_51259 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51265 - BLOCK
      ?auto_51266 - BLOCK
    )
    :vars
    (
      ?auto_51269 - BLOCK
      ?auto_51270 - BLOCK
      ?auto_51271 - BLOCK
      ?auto_51268 - BLOCK
      ?auto_51267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51265 ?auto_51266 ) ) ( not ( = ?auto_51265 ?auto_51269 ) ) ( not ( = ?auto_51266 ?auto_51269 ) ) ( ON ?auto_51265 ?auto_51270 ) ( not ( = ?auto_51265 ?auto_51270 ) ) ( not ( = ?auto_51266 ?auto_51270 ) ) ( not ( = ?auto_51269 ?auto_51270 ) ) ( ON-TABLE ?auto_51271 ) ( not ( = ?auto_51271 ?auto_51268 ) ) ( not ( = ?auto_51271 ?auto_51267 ) ) ( not ( = ?auto_51271 ?auto_51269 ) ) ( not ( = ?auto_51271 ?auto_51266 ) ) ( not ( = ?auto_51268 ?auto_51267 ) ) ( not ( = ?auto_51268 ?auto_51269 ) ) ( not ( = ?auto_51268 ?auto_51266 ) ) ( not ( = ?auto_51267 ?auto_51269 ) ) ( not ( = ?auto_51267 ?auto_51266 ) ) ( not ( = ?auto_51265 ?auto_51271 ) ) ( not ( = ?auto_51265 ?auto_51268 ) ) ( not ( = ?auto_51265 ?auto_51267 ) ) ( not ( = ?auto_51270 ?auto_51271 ) ) ( not ( = ?auto_51270 ?auto_51268 ) ) ( not ( = ?auto_51270 ?auto_51267 ) ) ( ON ?auto_51266 ?auto_51265 ) ( ON-TABLE ?auto_51270 ) ( ON ?auto_51269 ?auto_51266 ) ( ON ?auto_51267 ?auto_51269 ) ( CLEAR ?auto_51267 ) ( HOLDING ?auto_51268 ) ( CLEAR ?auto_51271 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51271 ?auto_51268 )
      ( MAKE-2PILE ?auto_51265 ?auto_51266 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51272 - BLOCK
      ?auto_51273 - BLOCK
    )
    :vars
    (
      ?auto_51275 - BLOCK
      ?auto_51277 - BLOCK
      ?auto_51278 - BLOCK
      ?auto_51274 - BLOCK
      ?auto_51276 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51272 ?auto_51273 ) ) ( not ( = ?auto_51272 ?auto_51275 ) ) ( not ( = ?auto_51273 ?auto_51275 ) ) ( ON ?auto_51272 ?auto_51277 ) ( not ( = ?auto_51272 ?auto_51277 ) ) ( not ( = ?auto_51273 ?auto_51277 ) ) ( not ( = ?auto_51275 ?auto_51277 ) ) ( ON-TABLE ?auto_51278 ) ( not ( = ?auto_51278 ?auto_51274 ) ) ( not ( = ?auto_51278 ?auto_51276 ) ) ( not ( = ?auto_51278 ?auto_51275 ) ) ( not ( = ?auto_51278 ?auto_51273 ) ) ( not ( = ?auto_51274 ?auto_51276 ) ) ( not ( = ?auto_51274 ?auto_51275 ) ) ( not ( = ?auto_51274 ?auto_51273 ) ) ( not ( = ?auto_51276 ?auto_51275 ) ) ( not ( = ?auto_51276 ?auto_51273 ) ) ( not ( = ?auto_51272 ?auto_51278 ) ) ( not ( = ?auto_51272 ?auto_51274 ) ) ( not ( = ?auto_51272 ?auto_51276 ) ) ( not ( = ?auto_51277 ?auto_51278 ) ) ( not ( = ?auto_51277 ?auto_51274 ) ) ( not ( = ?auto_51277 ?auto_51276 ) ) ( ON ?auto_51273 ?auto_51272 ) ( ON-TABLE ?auto_51277 ) ( ON ?auto_51275 ?auto_51273 ) ( ON ?auto_51276 ?auto_51275 ) ( CLEAR ?auto_51278 ) ( ON ?auto_51274 ?auto_51276 ) ( CLEAR ?auto_51274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51277 ?auto_51272 ?auto_51273 ?auto_51275 ?auto_51276 )
      ( MAKE-2PILE ?auto_51272 ?auto_51273 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51279 - BLOCK
      ?auto_51280 - BLOCK
    )
    :vars
    (
      ?auto_51284 - BLOCK
      ?auto_51282 - BLOCK
      ?auto_51283 - BLOCK
      ?auto_51281 - BLOCK
      ?auto_51285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51279 ?auto_51280 ) ) ( not ( = ?auto_51279 ?auto_51284 ) ) ( not ( = ?auto_51280 ?auto_51284 ) ) ( ON ?auto_51279 ?auto_51282 ) ( not ( = ?auto_51279 ?auto_51282 ) ) ( not ( = ?auto_51280 ?auto_51282 ) ) ( not ( = ?auto_51284 ?auto_51282 ) ) ( not ( = ?auto_51283 ?auto_51281 ) ) ( not ( = ?auto_51283 ?auto_51285 ) ) ( not ( = ?auto_51283 ?auto_51284 ) ) ( not ( = ?auto_51283 ?auto_51280 ) ) ( not ( = ?auto_51281 ?auto_51285 ) ) ( not ( = ?auto_51281 ?auto_51284 ) ) ( not ( = ?auto_51281 ?auto_51280 ) ) ( not ( = ?auto_51285 ?auto_51284 ) ) ( not ( = ?auto_51285 ?auto_51280 ) ) ( not ( = ?auto_51279 ?auto_51283 ) ) ( not ( = ?auto_51279 ?auto_51281 ) ) ( not ( = ?auto_51279 ?auto_51285 ) ) ( not ( = ?auto_51282 ?auto_51283 ) ) ( not ( = ?auto_51282 ?auto_51281 ) ) ( not ( = ?auto_51282 ?auto_51285 ) ) ( ON ?auto_51280 ?auto_51279 ) ( ON-TABLE ?auto_51282 ) ( ON ?auto_51284 ?auto_51280 ) ( ON ?auto_51285 ?auto_51284 ) ( ON ?auto_51281 ?auto_51285 ) ( CLEAR ?auto_51281 ) ( HOLDING ?auto_51283 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51283 )
      ( MAKE-2PILE ?auto_51279 ?auto_51280 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51286 - BLOCK
      ?auto_51287 - BLOCK
    )
    :vars
    (
      ?auto_51291 - BLOCK
      ?auto_51292 - BLOCK
      ?auto_51288 - BLOCK
      ?auto_51290 - BLOCK
      ?auto_51289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51286 ?auto_51287 ) ) ( not ( = ?auto_51286 ?auto_51291 ) ) ( not ( = ?auto_51287 ?auto_51291 ) ) ( ON ?auto_51286 ?auto_51292 ) ( not ( = ?auto_51286 ?auto_51292 ) ) ( not ( = ?auto_51287 ?auto_51292 ) ) ( not ( = ?auto_51291 ?auto_51292 ) ) ( not ( = ?auto_51288 ?auto_51290 ) ) ( not ( = ?auto_51288 ?auto_51289 ) ) ( not ( = ?auto_51288 ?auto_51291 ) ) ( not ( = ?auto_51288 ?auto_51287 ) ) ( not ( = ?auto_51290 ?auto_51289 ) ) ( not ( = ?auto_51290 ?auto_51291 ) ) ( not ( = ?auto_51290 ?auto_51287 ) ) ( not ( = ?auto_51289 ?auto_51291 ) ) ( not ( = ?auto_51289 ?auto_51287 ) ) ( not ( = ?auto_51286 ?auto_51288 ) ) ( not ( = ?auto_51286 ?auto_51290 ) ) ( not ( = ?auto_51286 ?auto_51289 ) ) ( not ( = ?auto_51292 ?auto_51288 ) ) ( not ( = ?auto_51292 ?auto_51290 ) ) ( not ( = ?auto_51292 ?auto_51289 ) ) ( ON ?auto_51287 ?auto_51286 ) ( ON-TABLE ?auto_51292 ) ( ON ?auto_51291 ?auto_51287 ) ( ON ?auto_51289 ?auto_51291 ) ( ON ?auto_51290 ?auto_51289 ) ( ON ?auto_51288 ?auto_51290 ) ( CLEAR ?auto_51288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_51292 ?auto_51286 ?auto_51287 ?auto_51291 ?auto_51289 ?auto_51290 )
      ( MAKE-2PILE ?auto_51286 ?auto_51287 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51312 - BLOCK
      ?auto_51313 - BLOCK
      ?auto_51314 - BLOCK
    )
    :vars
    (
      ?auto_51315 - BLOCK
      ?auto_51316 - BLOCK
      ?auto_51317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51315 ?auto_51314 ) ( ON-TABLE ?auto_51312 ) ( ON ?auto_51313 ?auto_51312 ) ( ON ?auto_51314 ?auto_51313 ) ( not ( = ?auto_51312 ?auto_51313 ) ) ( not ( = ?auto_51312 ?auto_51314 ) ) ( not ( = ?auto_51312 ?auto_51315 ) ) ( not ( = ?auto_51313 ?auto_51314 ) ) ( not ( = ?auto_51313 ?auto_51315 ) ) ( not ( = ?auto_51314 ?auto_51315 ) ) ( not ( = ?auto_51312 ?auto_51316 ) ) ( not ( = ?auto_51312 ?auto_51317 ) ) ( not ( = ?auto_51313 ?auto_51316 ) ) ( not ( = ?auto_51313 ?auto_51317 ) ) ( not ( = ?auto_51314 ?auto_51316 ) ) ( not ( = ?auto_51314 ?auto_51317 ) ) ( not ( = ?auto_51315 ?auto_51316 ) ) ( not ( = ?auto_51315 ?auto_51317 ) ) ( not ( = ?auto_51316 ?auto_51317 ) ) ( ON ?auto_51316 ?auto_51315 ) ( CLEAR ?auto_51316 ) ( HOLDING ?auto_51317 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51317 )
      ( MAKE-3PILE ?auto_51312 ?auto_51313 ?auto_51314 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51377 - BLOCK
      ?auto_51378 - BLOCK
      ?auto_51379 - BLOCK
    )
    :vars
    (
      ?auto_51380 - BLOCK
      ?auto_51381 - BLOCK
      ?auto_51382 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51377 ) ( not ( = ?auto_51377 ?auto_51378 ) ) ( not ( = ?auto_51377 ?auto_51379 ) ) ( not ( = ?auto_51378 ?auto_51379 ) ) ( ON ?auto_51379 ?auto_51380 ) ( not ( = ?auto_51377 ?auto_51380 ) ) ( not ( = ?auto_51378 ?auto_51380 ) ) ( not ( = ?auto_51379 ?auto_51380 ) ) ( CLEAR ?auto_51377 ) ( ON ?auto_51378 ?auto_51379 ) ( CLEAR ?auto_51378 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51381 ) ( ON ?auto_51382 ?auto_51381 ) ( ON ?auto_51380 ?auto_51382 ) ( not ( = ?auto_51381 ?auto_51382 ) ) ( not ( = ?auto_51381 ?auto_51380 ) ) ( not ( = ?auto_51381 ?auto_51379 ) ) ( not ( = ?auto_51381 ?auto_51378 ) ) ( not ( = ?auto_51382 ?auto_51380 ) ) ( not ( = ?auto_51382 ?auto_51379 ) ) ( not ( = ?auto_51382 ?auto_51378 ) ) ( not ( = ?auto_51377 ?auto_51381 ) ) ( not ( = ?auto_51377 ?auto_51382 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51381 ?auto_51382 ?auto_51380 ?auto_51379 )
      ( MAKE-3PILE ?auto_51377 ?auto_51378 ?auto_51379 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51383 - BLOCK
      ?auto_51384 - BLOCK
      ?auto_51385 - BLOCK
    )
    :vars
    (
      ?auto_51386 - BLOCK
      ?auto_51388 - BLOCK
      ?auto_51387 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51383 ?auto_51384 ) ) ( not ( = ?auto_51383 ?auto_51385 ) ) ( not ( = ?auto_51384 ?auto_51385 ) ) ( ON ?auto_51385 ?auto_51386 ) ( not ( = ?auto_51383 ?auto_51386 ) ) ( not ( = ?auto_51384 ?auto_51386 ) ) ( not ( = ?auto_51385 ?auto_51386 ) ) ( ON ?auto_51384 ?auto_51385 ) ( CLEAR ?auto_51384 ) ( ON-TABLE ?auto_51388 ) ( ON ?auto_51387 ?auto_51388 ) ( ON ?auto_51386 ?auto_51387 ) ( not ( = ?auto_51388 ?auto_51387 ) ) ( not ( = ?auto_51388 ?auto_51386 ) ) ( not ( = ?auto_51388 ?auto_51385 ) ) ( not ( = ?auto_51388 ?auto_51384 ) ) ( not ( = ?auto_51387 ?auto_51386 ) ) ( not ( = ?auto_51387 ?auto_51385 ) ) ( not ( = ?auto_51387 ?auto_51384 ) ) ( not ( = ?auto_51383 ?auto_51388 ) ) ( not ( = ?auto_51383 ?auto_51387 ) ) ( HOLDING ?auto_51383 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51383 )
      ( MAKE-3PILE ?auto_51383 ?auto_51384 ?auto_51385 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51389 - BLOCK
      ?auto_51390 - BLOCK
      ?auto_51391 - BLOCK
    )
    :vars
    (
      ?auto_51392 - BLOCK
      ?auto_51394 - BLOCK
      ?auto_51393 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51389 ?auto_51390 ) ) ( not ( = ?auto_51389 ?auto_51391 ) ) ( not ( = ?auto_51390 ?auto_51391 ) ) ( ON ?auto_51391 ?auto_51392 ) ( not ( = ?auto_51389 ?auto_51392 ) ) ( not ( = ?auto_51390 ?auto_51392 ) ) ( not ( = ?auto_51391 ?auto_51392 ) ) ( ON ?auto_51390 ?auto_51391 ) ( ON-TABLE ?auto_51394 ) ( ON ?auto_51393 ?auto_51394 ) ( ON ?auto_51392 ?auto_51393 ) ( not ( = ?auto_51394 ?auto_51393 ) ) ( not ( = ?auto_51394 ?auto_51392 ) ) ( not ( = ?auto_51394 ?auto_51391 ) ) ( not ( = ?auto_51394 ?auto_51390 ) ) ( not ( = ?auto_51393 ?auto_51392 ) ) ( not ( = ?auto_51393 ?auto_51391 ) ) ( not ( = ?auto_51393 ?auto_51390 ) ) ( not ( = ?auto_51389 ?auto_51394 ) ) ( not ( = ?auto_51389 ?auto_51393 ) ) ( ON ?auto_51389 ?auto_51390 ) ( CLEAR ?auto_51389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51394 ?auto_51393 ?auto_51392 ?auto_51391 ?auto_51390 )
      ( MAKE-3PILE ?auto_51389 ?auto_51390 ?auto_51391 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51398 - BLOCK
      ?auto_51399 - BLOCK
      ?auto_51400 - BLOCK
    )
    :vars
    (
      ?auto_51403 - BLOCK
      ?auto_51402 - BLOCK
      ?auto_51401 - BLOCK
      ?auto_51404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51398 ?auto_51399 ) ) ( not ( = ?auto_51398 ?auto_51400 ) ) ( not ( = ?auto_51399 ?auto_51400 ) ) ( ON ?auto_51400 ?auto_51403 ) ( not ( = ?auto_51398 ?auto_51403 ) ) ( not ( = ?auto_51399 ?auto_51403 ) ) ( not ( = ?auto_51400 ?auto_51403 ) ) ( ON ?auto_51399 ?auto_51400 ) ( CLEAR ?auto_51399 ) ( ON-TABLE ?auto_51402 ) ( ON ?auto_51401 ?auto_51402 ) ( ON ?auto_51403 ?auto_51401 ) ( not ( = ?auto_51402 ?auto_51401 ) ) ( not ( = ?auto_51402 ?auto_51403 ) ) ( not ( = ?auto_51402 ?auto_51400 ) ) ( not ( = ?auto_51402 ?auto_51399 ) ) ( not ( = ?auto_51401 ?auto_51403 ) ) ( not ( = ?auto_51401 ?auto_51400 ) ) ( not ( = ?auto_51401 ?auto_51399 ) ) ( not ( = ?auto_51398 ?auto_51402 ) ) ( not ( = ?auto_51398 ?auto_51401 ) ) ( ON ?auto_51398 ?auto_51404 ) ( CLEAR ?auto_51398 ) ( HAND-EMPTY ) ( not ( = ?auto_51398 ?auto_51404 ) ) ( not ( = ?auto_51399 ?auto_51404 ) ) ( not ( = ?auto_51400 ?auto_51404 ) ) ( not ( = ?auto_51403 ?auto_51404 ) ) ( not ( = ?auto_51402 ?auto_51404 ) ) ( not ( = ?auto_51401 ?auto_51404 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51398 ?auto_51404 )
      ( MAKE-3PILE ?auto_51398 ?auto_51399 ?auto_51400 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51405 - BLOCK
      ?auto_51406 - BLOCK
      ?auto_51407 - BLOCK
    )
    :vars
    (
      ?auto_51411 - BLOCK
      ?auto_51409 - BLOCK
      ?auto_51408 - BLOCK
      ?auto_51410 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51405 ?auto_51406 ) ) ( not ( = ?auto_51405 ?auto_51407 ) ) ( not ( = ?auto_51406 ?auto_51407 ) ) ( ON ?auto_51407 ?auto_51411 ) ( not ( = ?auto_51405 ?auto_51411 ) ) ( not ( = ?auto_51406 ?auto_51411 ) ) ( not ( = ?auto_51407 ?auto_51411 ) ) ( ON-TABLE ?auto_51409 ) ( ON ?auto_51408 ?auto_51409 ) ( ON ?auto_51411 ?auto_51408 ) ( not ( = ?auto_51409 ?auto_51408 ) ) ( not ( = ?auto_51409 ?auto_51411 ) ) ( not ( = ?auto_51409 ?auto_51407 ) ) ( not ( = ?auto_51409 ?auto_51406 ) ) ( not ( = ?auto_51408 ?auto_51411 ) ) ( not ( = ?auto_51408 ?auto_51407 ) ) ( not ( = ?auto_51408 ?auto_51406 ) ) ( not ( = ?auto_51405 ?auto_51409 ) ) ( not ( = ?auto_51405 ?auto_51408 ) ) ( ON ?auto_51405 ?auto_51410 ) ( CLEAR ?auto_51405 ) ( not ( = ?auto_51405 ?auto_51410 ) ) ( not ( = ?auto_51406 ?auto_51410 ) ) ( not ( = ?auto_51407 ?auto_51410 ) ) ( not ( = ?auto_51411 ?auto_51410 ) ) ( not ( = ?auto_51409 ?auto_51410 ) ) ( not ( = ?auto_51408 ?auto_51410 ) ) ( HOLDING ?auto_51406 ) ( CLEAR ?auto_51407 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51409 ?auto_51408 ?auto_51411 ?auto_51407 ?auto_51406 )
      ( MAKE-3PILE ?auto_51405 ?auto_51406 ?auto_51407 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51412 - BLOCK
      ?auto_51413 - BLOCK
      ?auto_51414 - BLOCK
    )
    :vars
    (
      ?auto_51417 - BLOCK
      ?auto_51415 - BLOCK
      ?auto_51416 - BLOCK
      ?auto_51418 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51412 ?auto_51413 ) ) ( not ( = ?auto_51412 ?auto_51414 ) ) ( not ( = ?auto_51413 ?auto_51414 ) ) ( ON ?auto_51414 ?auto_51417 ) ( not ( = ?auto_51412 ?auto_51417 ) ) ( not ( = ?auto_51413 ?auto_51417 ) ) ( not ( = ?auto_51414 ?auto_51417 ) ) ( ON-TABLE ?auto_51415 ) ( ON ?auto_51416 ?auto_51415 ) ( ON ?auto_51417 ?auto_51416 ) ( not ( = ?auto_51415 ?auto_51416 ) ) ( not ( = ?auto_51415 ?auto_51417 ) ) ( not ( = ?auto_51415 ?auto_51414 ) ) ( not ( = ?auto_51415 ?auto_51413 ) ) ( not ( = ?auto_51416 ?auto_51417 ) ) ( not ( = ?auto_51416 ?auto_51414 ) ) ( not ( = ?auto_51416 ?auto_51413 ) ) ( not ( = ?auto_51412 ?auto_51415 ) ) ( not ( = ?auto_51412 ?auto_51416 ) ) ( ON ?auto_51412 ?auto_51418 ) ( not ( = ?auto_51412 ?auto_51418 ) ) ( not ( = ?auto_51413 ?auto_51418 ) ) ( not ( = ?auto_51414 ?auto_51418 ) ) ( not ( = ?auto_51417 ?auto_51418 ) ) ( not ( = ?auto_51415 ?auto_51418 ) ) ( not ( = ?auto_51416 ?auto_51418 ) ) ( CLEAR ?auto_51414 ) ( ON ?auto_51413 ?auto_51412 ) ( CLEAR ?auto_51413 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51418 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51418 ?auto_51412 )
      ( MAKE-3PILE ?auto_51412 ?auto_51413 ?auto_51414 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51419 - BLOCK
      ?auto_51420 - BLOCK
      ?auto_51421 - BLOCK
    )
    :vars
    (
      ?auto_51424 - BLOCK
      ?auto_51423 - BLOCK
      ?auto_51425 - BLOCK
      ?auto_51422 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51419 ?auto_51420 ) ) ( not ( = ?auto_51419 ?auto_51421 ) ) ( not ( = ?auto_51420 ?auto_51421 ) ) ( not ( = ?auto_51419 ?auto_51424 ) ) ( not ( = ?auto_51420 ?auto_51424 ) ) ( not ( = ?auto_51421 ?auto_51424 ) ) ( ON-TABLE ?auto_51423 ) ( ON ?auto_51425 ?auto_51423 ) ( ON ?auto_51424 ?auto_51425 ) ( not ( = ?auto_51423 ?auto_51425 ) ) ( not ( = ?auto_51423 ?auto_51424 ) ) ( not ( = ?auto_51423 ?auto_51421 ) ) ( not ( = ?auto_51423 ?auto_51420 ) ) ( not ( = ?auto_51425 ?auto_51424 ) ) ( not ( = ?auto_51425 ?auto_51421 ) ) ( not ( = ?auto_51425 ?auto_51420 ) ) ( not ( = ?auto_51419 ?auto_51423 ) ) ( not ( = ?auto_51419 ?auto_51425 ) ) ( ON ?auto_51419 ?auto_51422 ) ( not ( = ?auto_51419 ?auto_51422 ) ) ( not ( = ?auto_51420 ?auto_51422 ) ) ( not ( = ?auto_51421 ?auto_51422 ) ) ( not ( = ?auto_51424 ?auto_51422 ) ) ( not ( = ?auto_51423 ?auto_51422 ) ) ( not ( = ?auto_51425 ?auto_51422 ) ) ( ON ?auto_51420 ?auto_51419 ) ( CLEAR ?auto_51420 ) ( ON-TABLE ?auto_51422 ) ( HOLDING ?auto_51421 ) ( CLEAR ?auto_51424 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51423 ?auto_51425 ?auto_51424 ?auto_51421 )
      ( MAKE-3PILE ?auto_51419 ?auto_51420 ?auto_51421 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51426 - BLOCK
      ?auto_51427 - BLOCK
      ?auto_51428 - BLOCK
    )
    :vars
    (
      ?auto_51432 - BLOCK
      ?auto_51430 - BLOCK
      ?auto_51429 - BLOCK
      ?auto_51431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51426 ?auto_51427 ) ) ( not ( = ?auto_51426 ?auto_51428 ) ) ( not ( = ?auto_51427 ?auto_51428 ) ) ( not ( = ?auto_51426 ?auto_51432 ) ) ( not ( = ?auto_51427 ?auto_51432 ) ) ( not ( = ?auto_51428 ?auto_51432 ) ) ( ON-TABLE ?auto_51430 ) ( ON ?auto_51429 ?auto_51430 ) ( ON ?auto_51432 ?auto_51429 ) ( not ( = ?auto_51430 ?auto_51429 ) ) ( not ( = ?auto_51430 ?auto_51432 ) ) ( not ( = ?auto_51430 ?auto_51428 ) ) ( not ( = ?auto_51430 ?auto_51427 ) ) ( not ( = ?auto_51429 ?auto_51432 ) ) ( not ( = ?auto_51429 ?auto_51428 ) ) ( not ( = ?auto_51429 ?auto_51427 ) ) ( not ( = ?auto_51426 ?auto_51430 ) ) ( not ( = ?auto_51426 ?auto_51429 ) ) ( ON ?auto_51426 ?auto_51431 ) ( not ( = ?auto_51426 ?auto_51431 ) ) ( not ( = ?auto_51427 ?auto_51431 ) ) ( not ( = ?auto_51428 ?auto_51431 ) ) ( not ( = ?auto_51432 ?auto_51431 ) ) ( not ( = ?auto_51430 ?auto_51431 ) ) ( not ( = ?auto_51429 ?auto_51431 ) ) ( ON ?auto_51427 ?auto_51426 ) ( ON-TABLE ?auto_51431 ) ( CLEAR ?auto_51432 ) ( ON ?auto_51428 ?auto_51427 ) ( CLEAR ?auto_51428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51431 ?auto_51426 ?auto_51427 )
      ( MAKE-3PILE ?auto_51426 ?auto_51427 ?auto_51428 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51433 - BLOCK
      ?auto_51434 - BLOCK
      ?auto_51435 - BLOCK
    )
    :vars
    (
      ?auto_51439 - BLOCK
      ?auto_51438 - BLOCK
      ?auto_51436 - BLOCK
      ?auto_51437 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51433 ?auto_51434 ) ) ( not ( = ?auto_51433 ?auto_51435 ) ) ( not ( = ?auto_51434 ?auto_51435 ) ) ( not ( = ?auto_51433 ?auto_51439 ) ) ( not ( = ?auto_51434 ?auto_51439 ) ) ( not ( = ?auto_51435 ?auto_51439 ) ) ( ON-TABLE ?auto_51438 ) ( ON ?auto_51436 ?auto_51438 ) ( not ( = ?auto_51438 ?auto_51436 ) ) ( not ( = ?auto_51438 ?auto_51439 ) ) ( not ( = ?auto_51438 ?auto_51435 ) ) ( not ( = ?auto_51438 ?auto_51434 ) ) ( not ( = ?auto_51436 ?auto_51439 ) ) ( not ( = ?auto_51436 ?auto_51435 ) ) ( not ( = ?auto_51436 ?auto_51434 ) ) ( not ( = ?auto_51433 ?auto_51438 ) ) ( not ( = ?auto_51433 ?auto_51436 ) ) ( ON ?auto_51433 ?auto_51437 ) ( not ( = ?auto_51433 ?auto_51437 ) ) ( not ( = ?auto_51434 ?auto_51437 ) ) ( not ( = ?auto_51435 ?auto_51437 ) ) ( not ( = ?auto_51439 ?auto_51437 ) ) ( not ( = ?auto_51438 ?auto_51437 ) ) ( not ( = ?auto_51436 ?auto_51437 ) ) ( ON ?auto_51434 ?auto_51433 ) ( ON-TABLE ?auto_51437 ) ( ON ?auto_51435 ?auto_51434 ) ( CLEAR ?auto_51435 ) ( HOLDING ?auto_51439 ) ( CLEAR ?auto_51436 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51438 ?auto_51436 ?auto_51439 )
      ( MAKE-3PILE ?auto_51433 ?auto_51434 ?auto_51435 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51440 - BLOCK
      ?auto_51441 - BLOCK
      ?auto_51442 - BLOCK
    )
    :vars
    (
      ?auto_51444 - BLOCK
      ?auto_51443 - BLOCK
      ?auto_51445 - BLOCK
      ?auto_51446 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51440 ?auto_51441 ) ) ( not ( = ?auto_51440 ?auto_51442 ) ) ( not ( = ?auto_51441 ?auto_51442 ) ) ( not ( = ?auto_51440 ?auto_51444 ) ) ( not ( = ?auto_51441 ?auto_51444 ) ) ( not ( = ?auto_51442 ?auto_51444 ) ) ( ON-TABLE ?auto_51443 ) ( ON ?auto_51445 ?auto_51443 ) ( not ( = ?auto_51443 ?auto_51445 ) ) ( not ( = ?auto_51443 ?auto_51444 ) ) ( not ( = ?auto_51443 ?auto_51442 ) ) ( not ( = ?auto_51443 ?auto_51441 ) ) ( not ( = ?auto_51445 ?auto_51444 ) ) ( not ( = ?auto_51445 ?auto_51442 ) ) ( not ( = ?auto_51445 ?auto_51441 ) ) ( not ( = ?auto_51440 ?auto_51443 ) ) ( not ( = ?auto_51440 ?auto_51445 ) ) ( ON ?auto_51440 ?auto_51446 ) ( not ( = ?auto_51440 ?auto_51446 ) ) ( not ( = ?auto_51441 ?auto_51446 ) ) ( not ( = ?auto_51442 ?auto_51446 ) ) ( not ( = ?auto_51444 ?auto_51446 ) ) ( not ( = ?auto_51443 ?auto_51446 ) ) ( not ( = ?auto_51445 ?auto_51446 ) ) ( ON ?auto_51441 ?auto_51440 ) ( ON-TABLE ?auto_51446 ) ( ON ?auto_51442 ?auto_51441 ) ( CLEAR ?auto_51445 ) ( ON ?auto_51444 ?auto_51442 ) ( CLEAR ?auto_51444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51446 ?auto_51440 ?auto_51441 ?auto_51442 )
      ( MAKE-3PILE ?auto_51440 ?auto_51441 ?auto_51442 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51447 - BLOCK
      ?auto_51448 - BLOCK
      ?auto_51449 - BLOCK
    )
    :vars
    (
      ?auto_51453 - BLOCK
      ?auto_51452 - BLOCK
      ?auto_51450 - BLOCK
      ?auto_51451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51447 ?auto_51448 ) ) ( not ( = ?auto_51447 ?auto_51449 ) ) ( not ( = ?auto_51448 ?auto_51449 ) ) ( not ( = ?auto_51447 ?auto_51453 ) ) ( not ( = ?auto_51448 ?auto_51453 ) ) ( not ( = ?auto_51449 ?auto_51453 ) ) ( ON-TABLE ?auto_51452 ) ( not ( = ?auto_51452 ?auto_51450 ) ) ( not ( = ?auto_51452 ?auto_51453 ) ) ( not ( = ?auto_51452 ?auto_51449 ) ) ( not ( = ?auto_51452 ?auto_51448 ) ) ( not ( = ?auto_51450 ?auto_51453 ) ) ( not ( = ?auto_51450 ?auto_51449 ) ) ( not ( = ?auto_51450 ?auto_51448 ) ) ( not ( = ?auto_51447 ?auto_51452 ) ) ( not ( = ?auto_51447 ?auto_51450 ) ) ( ON ?auto_51447 ?auto_51451 ) ( not ( = ?auto_51447 ?auto_51451 ) ) ( not ( = ?auto_51448 ?auto_51451 ) ) ( not ( = ?auto_51449 ?auto_51451 ) ) ( not ( = ?auto_51453 ?auto_51451 ) ) ( not ( = ?auto_51452 ?auto_51451 ) ) ( not ( = ?auto_51450 ?auto_51451 ) ) ( ON ?auto_51448 ?auto_51447 ) ( ON-TABLE ?auto_51451 ) ( ON ?auto_51449 ?auto_51448 ) ( ON ?auto_51453 ?auto_51449 ) ( CLEAR ?auto_51453 ) ( HOLDING ?auto_51450 ) ( CLEAR ?auto_51452 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51452 ?auto_51450 )
      ( MAKE-3PILE ?auto_51447 ?auto_51448 ?auto_51449 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51454 - BLOCK
      ?auto_51455 - BLOCK
      ?auto_51456 - BLOCK
    )
    :vars
    (
      ?auto_51459 - BLOCK
      ?auto_51458 - BLOCK
      ?auto_51460 - BLOCK
      ?auto_51457 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51454 ?auto_51455 ) ) ( not ( = ?auto_51454 ?auto_51456 ) ) ( not ( = ?auto_51455 ?auto_51456 ) ) ( not ( = ?auto_51454 ?auto_51459 ) ) ( not ( = ?auto_51455 ?auto_51459 ) ) ( not ( = ?auto_51456 ?auto_51459 ) ) ( ON-TABLE ?auto_51458 ) ( not ( = ?auto_51458 ?auto_51460 ) ) ( not ( = ?auto_51458 ?auto_51459 ) ) ( not ( = ?auto_51458 ?auto_51456 ) ) ( not ( = ?auto_51458 ?auto_51455 ) ) ( not ( = ?auto_51460 ?auto_51459 ) ) ( not ( = ?auto_51460 ?auto_51456 ) ) ( not ( = ?auto_51460 ?auto_51455 ) ) ( not ( = ?auto_51454 ?auto_51458 ) ) ( not ( = ?auto_51454 ?auto_51460 ) ) ( ON ?auto_51454 ?auto_51457 ) ( not ( = ?auto_51454 ?auto_51457 ) ) ( not ( = ?auto_51455 ?auto_51457 ) ) ( not ( = ?auto_51456 ?auto_51457 ) ) ( not ( = ?auto_51459 ?auto_51457 ) ) ( not ( = ?auto_51458 ?auto_51457 ) ) ( not ( = ?auto_51460 ?auto_51457 ) ) ( ON ?auto_51455 ?auto_51454 ) ( ON-TABLE ?auto_51457 ) ( ON ?auto_51456 ?auto_51455 ) ( ON ?auto_51459 ?auto_51456 ) ( CLEAR ?auto_51458 ) ( ON ?auto_51460 ?auto_51459 ) ( CLEAR ?auto_51460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51457 ?auto_51454 ?auto_51455 ?auto_51456 ?auto_51459 )
      ( MAKE-3PILE ?auto_51454 ?auto_51455 ?auto_51456 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51461 - BLOCK
      ?auto_51462 - BLOCK
      ?auto_51463 - BLOCK
    )
    :vars
    (
      ?auto_51467 - BLOCK
      ?auto_51465 - BLOCK
      ?auto_51464 - BLOCK
      ?auto_51466 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51461 ?auto_51462 ) ) ( not ( = ?auto_51461 ?auto_51463 ) ) ( not ( = ?auto_51462 ?auto_51463 ) ) ( not ( = ?auto_51461 ?auto_51467 ) ) ( not ( = ?auto_51462 ?auto_51467 ) ) ( not ( = ?auto_51463 ?auto_51467 ) ) ( not ( = ?auto_51465 ?auto_51464 ) ) ( not ( = ?auto_51465 ?auto_51467 ) ) ( not ( = ?auto_51465 ?auto_51463 ) ) ( not ( = ?auto_51465 ?auto_51462 ) ) ( not ( = ?auto_51464 ?auto_51467 ) ) ( not ( = ?auto_51464 ?auto_51463 ) ) ( not ( = ?auto_51464 ?auto_51462 ) ) ( not ( = ?auto_51461 ?auto_51465 ) ) ( not ( = ?auto_51461 ?auto_51464 ) ) ( ON ?auto_51461 ?auto_51466 ) ( not ( = ?auto_51461 ?auto_51466 ) ) ( not ( = ?auto_51462 ?auto_51466 ) ) ( not ( = ?auto_51463 ?auto_51466 ) ) ( not ( = ?auto_51467 ?auto_51466 ) ) ( not ( = ?auto_51465 ?auto_51466 ) ) ( not ( = ?auto_51464 ?auto_51466 ) ) ( ON ?auto_51462 ?auto_51461 ) ( ON-TABLE ?auto_51466 ) ( ON ?auto_51463 ?auto_51462 ) ( ON ?auto_51467 ?auto_51463 ) ( ON ?auto_51464 ?auto_51467 ) ( CLEAR ?auto_51464 ) ( HOLDING ?auto_51465 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51465 )
      ( MAKE-3PILE ?auto_51461 ?auto_51462 ?auto_51463 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51468 - BLOCK
      ?auto_51469 - BLOCK
      ?auto_51470 - BLOCK
    )
    :vars
    (
      ?auto_51472 - BLOCK
      ?auto_51471 - BLOCK
      ?auto_51474 - BLOCK
      ?auto_51473 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51468 ?auto_51469 ) ) ( not ( = ?auto_51468 ?auto_51470 ) ) ( not ( = ?auto_51469 ?auto_51470 ) ) ( not ( = ?auto_51468 ?auto_51472 ) ) ( not ( = ?auto_51469 ?auto_51472 ) ) ( not ( = ?auto_51470 ?auto_51472 ) ) ( not ( = ?auto_51471 ?auto_51474 ) ) ( not ( = ?auto_51471 ?auto_51472 ) ) ( not ( = ?auto_51471 ?auto_51470 ) ) ( not ( = ?auto_51471 ?auto_51469 ) ) ( not ( = ?auto_51474 ?auto_51472 ) ) ( not ( = ?auto_51474 ?auto_51470 ) ) ( not ( = ?auto_51474 ?auto_51469 ) ) ( not ( = ?auto_51468 ?auto_51471 ) ) ( not ( = ?auto_51468 ?auto_51474 ) ) ( ON ?auto_51468 ?auto_51473 ) ( not ( = ?auto_51468 ?auto_51473 ) ) ( not ( = ?auto_51469 ?auto_51473 ) ) ( not ( = ?auto_51470 ?auto_51473 ) ) ( not ( = ?auto_51472 ?auto_51473 ) ) ( not ( = ?auto_51471 ?auto_51473 ) ) ( not ( = ?auto_51474 ?auto_51473 ) ) ( ON ?auto_51469 ?auto_51468 ) ( ON-TABLE ?auto_51473 ) ( ON ?auto_51470 ?auto_51469 ) ( ON ?auto_51472 ?auto_51470 ) ( ON ?auto_51474 ?auto_51472 ) ( ON ?auto_51471 ?auto_51474 ) ( CLEAR ?auto_51471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_51473 ?auto_51468 ?auto_51469 ?auto_51470 ?auto_51472 ?auto_51474 )
      ( MAKE-3PILE ?auto_51468 ?auto_51469 ?auto_51470 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51490 - BLOCK
      ?auto_51491 - BLOCK
    )
    :vars
    (
      ?auto_51493 - BLOCK
      ?auto_51492 - BLOCK
      ?auto_51494 - BLOCK
      ?auto_51495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51493 ?auto_51491 ) ( ON-TABLE ?auto_51490 ) ( ON ?auto_51491 ?auto_51490 ) ( not ( = ?auto_51490 ?auto_51491 ) ) ( not ( = ?auto_51490 ?auto_51493 ) ) ( not ( = ?auto_51491 ?auto_51493 ) ) ( not ( = ?auto_51490 ?auto_51492 ) ) ( not ( = ?auto_51490 ?auto_51494 ) ) ( not ( = ?auto_51491 ?auto_51492 ) ) ( not ( = ?auto_51491 ?auto_51494 ) ) ( not ( = ?auto_51493 ?auto_51492 ) ) ( not ( = ?auto_51493 ?auto_51494 ) ) ( not ( = ?auto_51492 ?auto_51494 ) ) ( ON ?auto_51492 ?auto_51493 ) ( CLEAR ?auto_51492 ) ( HOLDING ?auto_51494 ) ( CLEAR ?auto_51495 ) ( ON-TABLE ?auto_51495 ) ( not ( = ?auto_51495 ?auto_51494 ) ) ( not ( = ?auto_51490 ?auto_51495 ) ) ( not ( = ?auto_51491 ?auto_51495 ) ) ( not ( = ?auto_51493 ?auto_51495 ) ) ( not ( = ?auto_51492 ?auto_51495 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51495 ?auto_51494 )
      ( MAKE-2PILE ?auto_51490 ?auto_51491 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51496 - BLOCK
      ?auto_51497 - BLOCK
    )
    :vars
    (
      ?auto_51499 - BLOCK
      ?auto_51498 - BLOCK
      ?auto_51500 - BLOCK
      ?auto_51501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51499 ?auto_51497 ) ( ON-TABLE ?auto_51496 ) ( ON ?auto_51497 ?auto_51496 ) ( not ( = ?auto_51496 ?auto_51497 ) ) ( not ( = ?auto_51496 ?auto_51499 ) ) ( not ( = ?auto_51497 ?auto_51499 ) ) ( not ( = ?auto_51496 ?auto_51498 ) ) ( not ( = ?auto_51496 ?auto_51500 ) ) ( not ( = ?auto_51497 ?auto_51498 ) ) ( not ( = ?auto_51497 ?auto_51500 ) ) ( not ( = ?auto_51499 ?auto_51498 ) ) ( not ( = ?auto_51499 ?auto_51500 ) ) ( not ( = ?auto_51498 ?auto_51500 ) ) ( ON ?auto_51498 ?auto_51499 ) ( CLEAR ?auto_51501 ) ( ON-TABLE ?auto_51501 ) ( not ( = ?auto_51501 ?auto_51500 ) ) ( not ( = ?auto_51496 ?auto_51501 ) ) ( not ( = ?auto_51497 ?auto_51501 ) ) ( not ( = ?auto_51499 ?auto_51501 ) ) ( not ( = ?auto_51498 ?auto_51501 ) ) ( ON ?auto_51500 ?auto_51498 ) ( CLEAR ?auto_51500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51496 ?auto_51497 ?auto_51499 ?auto_51498 )
      ( MAKE-2PILE ?auto_51496 ?auto_51497 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51502 - BLOCK
      ?auto_51503 - BLOCK
    )
    :vars
    (
      ?auto_51504 - BLOCK
      ?auto_51505 - BLOCK
      ?auto_51507 - BLOCK
      ?auto_51506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51504 ?auto_51503 ) ( ON-TABLE ?auto_51502 ) ( ON ?auto_51503 ?auto_51502 ) ( not ( = ?auto_51502 ?auto_51503 ) ) ( not ( = ?auto_51502 ?auto_51504 ) ) ( not ( = ?auto_51503 ?auto_51504 ) ) ( not ( = ?auto_51502 ?auto_51505 ) ) ( not ( = ?auto_51502 ?auto_51507 ) ) ( not ( = ?auto_51503 ?auto_51505 ) ) ( not ( = ?auto_51503 ?auto_51507 ) ) ( not ( = ?auto_51504 ?auto_51505 ) ) ( not ( = ?auto_51504 ?auto_51507 ) ) ( not ( = ?auto_51505 ?auto_51507 ) ) ( ON ?auto_51505 ?auto_51504 ) ( not ( = ?auto_51506 ?auto_51507 ) ) ( not ( = ?auto_51502 ?auto_51506 ) ) ( not ( = ?auto_51503 ?auto_51506 ) ) ( not ( = ?auto_51504 ?auto_51506 ) ) ( not ( = ?auto_51505 ?auto_51506 ) ) ( ON ?auto_51507 ?auto_51505 ) ( CLEAR ?auto_51507 ) ( HOLDING ?auto_51506 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51506 )
      ( MAKE-2PILE ?auto_51502 ?auto_51503 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51516 - BLOCK
      ?auto_51517 - BLOCK
    )
    :vars
    (
      ?auto_51520 - BLOCK
      ?auto_51521 - BLOCK
      ?auto_51518 - BLOCK
      ?auto_51519 - BLOCK
      ?auto_51522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51520 ?auto_51517 ) ( ON-TABLE ?auto_51516 ) ( ON ?auto_51517 ?auto_51516 ) ( not ( = ?auto_51516 ?auto_51517 ) ) ( not ( = ?auto_51516 ?auto_51520 ) ) ( not ( = ?auto_51517 ?auto_51520 ) ) ( not ( = ?auto_51516 ?auto_51521 ) ) ( not ( = ?auto_51516 ?auto_51518 ) ) ( not ( = ?auto_51517 ?auto_51521 ) ) ( not ( = ?auto_51517 ?auto_51518 ) ) ( not ( = ?auto_51520 ?auto_51521 ) ) ( not ( = ?auto_51520 ?auto_51518 ) ) ( not ( = ?auto_51521 ?auto_51518 ) ) ( ON ?auto_51521 ?auto_51520 ) ( not ( = ?auto_51519 ?auto_51518 ) ) ( not ( = ?auto_51516 ?auto_51519 ) ) ( not ( = ?auto_51517 ?auto_51519 ) ) ( not ( = ?auto_51520 ?auto_51519 ) ) ( not ( = ?auto_51521 ?auto_51519 ) ) ( ON ?auto_51518 ?auto_51521 ) ( CLEAR ?auto_51518 ) ( ON ?auto_51519 ?auto_51522 ) ( CLEAR ?auto_51519 ) ( HAND-EMPTY ) ( not ( = ?auto_51516 ?auto_51522 ) ) ( not ( = ?auto_51517 ?auto_51522 ) ) ( not ( = ?auto_51520 ?auto_51522 ) ) ( not ( = ?auto_51521 ?auto_51522 ) ) ( not ( = ?auto_51518 ?auto_51522 ) ) ( not ( = ?auto_51519 ?auto_51522 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51519 ?auto_51522 )
      ( MAKE-2PILE ?auto_51516 ?auto_51517 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51523 - BLOCK
      ?auto_51524 - BLOCK
    )
    :vars
    (
      ?auto_51527 - BLOCK
      ?auto_51526 - BLOCK
      ?auto_51525 - BLOCK
      ?auto_51528 - BLOCK
      ?auto_51529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51527 ?auto_51524 ) ( ON-TABLE ?auto_51523 ) ( ON ?auto_51524 ?auto_51523 ) ( not ( = ?auto_51523 ?auto_51524 ) ) ( not ( = ?auto_51523 ?auto_51527 ) ) ( not ( = ?auto_51524 ?auto_51527 ) ) ( not ( = ?auto_51523 ?auto_51526 ) ) ( not ( = ?auto_51523 ?auto_51525 ) ) ( not ( = ?auto_51524 ?auto_51526 ) ) ( not ( = ?auto_51524 ?auto_51525 ) ) ( not ( = ?auto_51527 ?auto_51526 ) ) ( not ( = ?auto_51527 ?auto_51525 ) ) ( not ( = ?auto_51526 ?auto_51525 ) ) ( ON ?auto_51526 ?auto_51527 ) ( not ( = ?auto_51528 ?auto_51525 ) ) ( not ( = ?auto_51523 ?auto_51528 ) ) ( not ( = ?auto_51524 ?auto_51528 ) ) ( not ( = ?auto_51527 ?auto_51528 ) ) ( not ( = ?auto_51526 ?auto_51528 ) ) ( ON ?auto_51528 ?auto_51529 ) ( CLEAR ?auto_51528 ) ( not ( = ?auto_51523 ?auto_51529 ) ) ( not ( = ?auto_51524 ?auto_51529 ) ) ( not ( = ?auto_51527 ?auto_51529 ) ) ( not ( = ?auto_51526 ?auto_51529 ) ) ( not ( = ?auto_51525 ?auto_51529 ) ) ( not ( = ?auto_51528 ?auto_51529 ) ) ( HOLDING ?auto_51525 ) ( CLEAR ?auto_51526 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51523 ?auto_51524 ?auto_51527 ?auto_51526 ?auto_51525 )
      ( MAKE-2PILE ?auto_51523 ?auto_51524 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51569 - BLOCK
      ?auto_51570 - BLOCK
      ?auto_51571 - BLOCK
      ?auto_51572 - BLOCK
    )
    :vars
    (
      ?auto_51573 - BLOCK
      ?auto_51574 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51569 ) ( ON ?auto_51570 ?auto_51569 ) ( not ( = ?auto_51569 ?auto_51570 ) ) ( not ( = ?auto_51569 ?auto_51571 ) ) ( not ( = ?auto_51569 ?auto_51572 ) ) ( not ( = ?auto_51570 ?auto_51571 ) ) ( not ( = ?auto_51570 ?auto_51572 ) ) ( not ( = ?auto_51571 ?auto_51572 ) ) ( ON ?auto_51572 ?auto_51573 ) ( not ( = ?auto_51569 ?auto_51573 ) ) ( not ( = ?auto_51570 ?auto_51573 ) ) ( not ( = ?auto_51571 ?auto_51573 ) ) ( not ( = ?auto_51572 ?auto_51573 ) ) ( CLEAR ?auto_51570 ) ( ON ?auto_51571 ?auto_51572 ) ( CLEAR ?auto_51571 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51574 ) ( ON ?auto_51573 ?auto_51574 ) ( not ( = ?auto_51574 ?auto_51573 ) ) ( not ( = ?auto_51574 ?auto_51572 ) ) ( not ( = ?auto_51574 ?auto_51571 ) ) ( not ( = ?auto_51569 ?auto_51574 ) ) ( not ( = ?auto_51570 ?auto_51574 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51574 ?auto_51573 ?auto_51572 )
      ( MAKE-4PILE ?auto_51569 ?auto_51570 ?auto_51571 ?auto_51572 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51575 - BLOCK
      ?auto_51576 - BLOCK
      ?auto_51577 - BLOCK
      ?auto_51578 - BLOCK
    )
    :vars
    (
      ?auto_51579 - BLOCK
      ?auto_51580 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51575 ) ( not ( = ?auto_51575 ?auto_51576 ) ) ( not ( = ?auto_51575 ?auto_51577 ) ) ( not ( = ?auto_51575 ?auto_51578 ) ) ( not ( = ?auto_51576 ?auto_51577 ) ) ( not ( = ?auto_51576 ?auto_51578 ) ) ( not ( = ?auto_51577 ?auto_51578 ) ) ( ON ?auto_51578 ?auto_51579 ) ( not ( = ?auto_51575 ?auto_51579 ) ) ( not ( = ?auto_51576 ?auto_51579 ) ) ( not ( = ?auto_51577 ?auto_51579 ) ) ( not ( = ?auto_51578 ?auto_51579 ) ) ( ON ?auto_51577 ?auto_51578 ) ( CLEAR ?auto_51577 ) ( ON-TABLE ?auto_51580 ) ( ON ?auto_51579 ?auto_51580 ) ( not ( = ?auto_51580 ?auto_51579 ) ) ( not ( = ?auto_51580 ?auto_51578 ) ) ( not ( = ?auto_51580 ?auto_51577 ) ) ( not ( = ?auto_51575 ?auto_51580 ) ) ( not ( = ?auto_51576 ?auto_51580 ) ) ( HOLDING ?auto_51576 ) ( CLEAR ?auto_51575 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51575 ?auto_51576 )
      ( MAKE-4PILE ?auto_51575 ?auto_51576 ?auto_51577 ?auto_51578 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51581 - BLOCK
      ?auto_51582 - BLOCK
      ?auto_51583 - BLOCK
      ?auto_51584 - BLOCK
    )
    :vars
    (
      ?auto_51585 - BLOCK
      ?auto_51586 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51581 ) ( not ( = ?auto_51581 ?auto_51582 ) ) ( not ( = ?auto_51581 ?auto_51583 ) ) ( not ( = ?auto_51581 ?auto_51584 ) ) ( not ( = ?auto_51582 ?auto_51583 ) ) ( not ( = ?auto_51582 ?auto_51584 ) ) ( not ( = ?auto_51583 ?auto_51584 ) ) ( ON ?auto_51584 ?auto_51585 ) ( not ( = ?auto_51581 ?auto_51585 ) ) ( not ( = ?auto_51582 ?auto_51585 ) ) ( not ( = ?auto_51583 ?auto_51585 ) ) ( not ( = ?auto_51584 ?auto_51585 ) ) ( ON ?auto_51583 ?auto_51584 ) ( ON-TABLE ?auto_51586 ) ( ON ?auto_51585 ?auto_51586 ) ( not ( = ?auto_51586 ?auto_51585 ) ) ( not ( = ?auto_51586 ?auto_51584 ) ) ( not ( = ?auto_51586 ?auto_51583 ) ) ( not ( = ?auto_51581 ?auto_51586 ) ) ( not ( = ?auto_51582 ?auto_51586 ) ) ( CLEAR ?auto_51581 ) ( ON ?auto_51582 ?auto_51583 ) ( CLEAR ?auto_51582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51586 ?auto_51585 ?auto_51584 ?auto_51583 )
      ( MAKE-4PILE ?auto_51581 ?auto_51582 ?auto_51583 ?auto_51584 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51587 - BLOCK
      ?auto_51588 - BLOCK
      ?auto_51589 - BLOCK
      ?auto_51590 - BLOCK
    )
    :vars
    (
      ?auto_51591 - BLOCK
      ?auto_51592 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51587 ?auto_51588 ) ) ( not ( = ?auto_51587 ?auto_51589 ) ) ( not ( = ?auto_51587 ?auto_51590 ) ) ( not ( = ?auto_51588 ?auto_51589 ) ) ( not ( = ?auto_51588 ?auto_51590 ) ) ( not ( = ?auto_51589 ?auto_51590 ) ) ( ON ?auto_51590 ?auto_51591 ) ( not ( = ?auto_51587 ?auto_51591 ) ) ( not ( = ?auto_51588 ?auto_51591 ) ) ( not ( = ?auto_51589 ?auto_51591 ) ) ( not ( = ?auto_51590 ?auto_51591 ) ) ( ON ?auto_51589 ?auto_51590 ) ( ON-TABLE ?auto_51592 ) ( ON ?auto_51591 ?auto_51592 ) ( not ( = ?auto_51592 ?auto_51591 ) ) ( not ( = ?auto_51592 ?auto_51590 ) ) ( not ( = ?auto_51592 ?auto_51589 ) ) ( not ( = ?auto_51587 ?auto_51592 ) ) ( not ( = ?auto_51588 ?auto_51592 ) ) ( ON ?auto_51588 ?auto_51589 ) ( CLEAR ?auto_51588 ) ( HOLDING ?auto_51587 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51587 )
      ( MAKE-4PILE ?auto_51587 ?auto_51588 ?auto_51589 ?auto_51590 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51593 - BLOCK
      ?auto_51594 - BLOCK
      ?auto_51595 - BLOCK
      ?auto_51596 - BLOCK
    )
    :vars
    (
      ?auto_51598 - BLOCK
      ?auto_51597 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51593 ?auto_51594 ) ) ( not ( = ?auto_51593 ?auto_51595 ) ) ( not ( = ?auto_51593 ?auto_51596 ) ) ( not ( = ?auto_51594 ?auto_51595 ) ) ( not ( = ?auto_51594 ?auto_51596 ) ) ( not ( = ?auto_51595 ?auto_51596 ) ) ( ON ?auto_51596 ?auto_51598 ) ( not ( = ?auto_51593 ?auto_51598 ) ) ( not ( = ?auto_51594 ?auto_51598 ) ) ( not ( = ?auto_51595 ?auto_51598 ) ) ( not ( = ?auto_51596 ?auto_51598 ) ) ( ON ?auto_51595 ?auto_51596 ) ( ON-TABLE ?auto_51597 ) ( ON ?auto_51598 ?auto_51597 ) ( not ( = ?auto_51597 ?auto_51598 ) ) ( not ( = ?auto_51597 ?auto_51596 ) ) ( not ( = ?auto_51597 ?auto_51595 ) ) ( not ( = ?auto_51593 ?auto_51597 ) ) ( not ( = ?auto_51594 ?auto_51597 ) ) ( ON ?auto_51594 ?auto_51595 ) ( ON ?auto_51593 ?auto_51594 ) ( CLEAR ?auto_51593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51597 ?auto_51598 ?auto_51596 ?auto_51595 ?auto_51594 )
      ( MAKE-4PILE ?auto_51593 ?auto_51594 ?auto_51595 ?auto_51596 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51603 - BLOCK
      ?auto_51604 - BLOCK
      ?auto_51605 - BLOCK
      ?auto_51606 - BLOCK
    )
    :vars
    (
      ?auto_51608 - BLOCK
      ?auto_51607 - BLOCK
      ?auto_51609 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51603 ?auto_51604 ) ) ( not ( = ?auto_51603 ?auto_51605 ) ) ( not ( = ?auto_51603 ?auto_51606 ) ) ( not ( = ?auto_51604 ?auto_51605 ) ) ( not ( = ?auto_51604 ?auto_51606 ) ) ( not ( = ?auto_51605 ?auto_51606 ) ) ( ON ?auto_51606 ?auto_51608 ) ( not ( = ?auto_51603 ?auto_51608 ) ) ( not ( = ?auto_51604 ?auto_51608 ) ) ( not ( = ?auto_51605 ?auto_51608 ) ) ( not ( = ?auto_51606 ?auto_51608 ) ) ( ON ?auto_51605 ?auto_51606 ) ( ON-TABLE ?auto_51607 ) ( ON ?auto_51608 ?auto_51607 ) ( not ( = ?auto_51607 ?auto_51608 ) ) ( not ( = ?auto_51607 ?auto_51606 ) ) ( not ( = ?auto_51607 ?auto_51605 ) ) ( not ( = ?auto_51603 ?auto_51607 ) ) ( not ( = ?auto_51604 ?auto_51607 ) ) ( ON ?auto_51604 ?auto_51605 ) ( CLEAR ?auto_51604 ) ( ON ?auto_51603 ?auto_51609 ) ( CLEAR ?auto_51603 ) ( HAND-EMPTY ) ( not ( = ?auto_51603 ?auto_51609 ) ) ( not ( = ?auto_51604 ?auto_51609 ) ) ( not ( = ?auto_51605 ?auto_51609 ) ) ( not ( = ?auto_51606 ?auto_51609 ) ) ( not ( = ?auto_51608 ?auto_51609 ) ) ( not ( = ?auto_51607 ?auto_51609 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51603 ?auto_51609 )
      ( MAKE-4PILE ?auto_51603 ?auto_51604 ?auto_51605 ?auto_51606 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51610 - BLOCK
      ?auto_51611 - BLOCK
      ?auto_51612 - BLOCK
      ?auto_51613 - BLOCK
    )
    :vars
    (
      ?auto_51614 - BLOCK
      ?auto_51616 - BLOCK
      ?auto_51615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51610 ?auto_51611 ) ) ( not ( = ?auto_51610 ?auto_51612 ) ) ( not ( = ?auto_51610 ?auto_51613 ) ) ( not ( = ?auto_51611 ?auto_51612 ) ) ( not ( = ?auto_51611 ?auto_51613 ) ) ( not ( = ?auto_51612 ?auto_51613 ) ) ( ON ?auto_51613 ?auto_51614 ) ( not ( = ?auto_51610 ?auto_51614 ) ) ( not ( = ?auto_51611 ?auto_51614 ) ) ( not ( = ?auto_51612 ?auto_51614 ) ) ( not ( = ?auto_51613 ?auto_51614 ) ) ( ON ?auto_51612 ?auto_51613 ) ( ON-TABLE ?auto_51616 ) ( ON ?auto_51614 ?auto_51616 ) ( not ( = ?auto_51616 ?auto_51614 ) ) ( not ( = ?auto_51616 ?auto_51613 ) ) ( not ( = ?auto_51616 ?auto_51612 ) ) ( not ( = ?auto_51610 ?auto_51616 ) ) ( not ( = ?auto_51611 ?auto_51616 ) ) ( ON ?auto_51610 ?auto_51615 ) ( CLEAR ?auto_51610 ) ( not ( = ?auto_51610 ?auto_51615 ) ) ( not ( = ?auto_51611 ?auto_51615 ) ) ( not ( = ?auto_51612 ?auto_51615 ) ) ( not ( = ?auto_51613 ?auto_51615 ) ) ( not ( = ?auto_51614 ?auto_51615 ) ) ( not ( = ?auto_51616 ?auto_51615 ) ) ( HOLDING ?auto_51611 ) ( CLEAR ?auto_51612 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51616 ?auto_51614 ?auto_51613 ?auto_51612 ?auto_51611 )
      ( MAKE-4PILE ?auto_51610 ?auto_51611 ?auto_51612 ?auto_51613 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51617 - BLOCK
      ?auto_51618 - BLOCK
      ?auto_51619 - BLOCK
      ?auto_51620 - BLOCK
    )
    :vars
    (
      ?auto_51621 - BLOCK
      ?auto_51622 - BLOCK
      ?auto_51623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51617 ?auto_51618 ) ) ( not ( = ?auto_51617 ?auto_51619 ) ) ( not ( = ?auto_51617 ?auto_51620 ) ) ( not ( = ?auto_51618 ?auto_51619 ) ) ( not ( = ?auto_51618 ?auto_51620 ) ) ( not ( = ?auto_51619 ?auto_51620 ) ) ( ON ?auto_51620 ?auto_51621 ) ( not ( = ?auto_51617 ?auto_51621 ) ) ( not ( = ?auto_51618 ?auto_51621 ) ) ( not ( = ?auto_51619 ?auto_51621 ) ) ( not ( = ?auto_51620 ?auto_51621 ) ) ( ON ?auto_51619 ?auto_51620 ) ( ON-TABLE ?auto_51622 ) ( ON ?auto_51621 ?auto_51622 ) ( not ( = ?auto_51622 ?auto_51621 ) ) ( not ( = ?auto_51622 ?auto_51620 ) ) ( not ( = ?auto_51622 ?auto_51619 ) ) ( not ( = ?auto_51617 ?auto_51622 ) ) ( not ( = ?auto_51618 ?auto_51622 ) ) ( ON ?auto_51617 ?auto_51623 ) ( not ( = ?auto_51617 ?auto_51623 ) ) ( not ( = ?auto_51618 ?auto_51623 ) ) ( not ( = ?auto_51619 ?auto_51623 ) ) ( not ( = ?auto_51620 ?auto_51623 ) ) ( not ( = ?auto_51621 ?auto_51623 ) ) ( not ( = ?auto_51622 ?auto_51623 ) ) ( CLEAR ?auto_51619 ) ( ON ?auto_51618 ?auto_51617 ) ( CLEAR ?auto_51618 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51623 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51623 ?auto_51617 )
      ( MAKE-4PILE ?auto_51617 ?auto_51618 ?auto_51619 ?auto_51620 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51624 - BLOCK
      ?auto_51625 - BLOCK
      ?auto_51626 - BLOCK
      ?auto_51627 - BLOCK
    )
    :vars
    (
      ?auto_51629 - BLOCK
      ?auto_51630 - BLOCK
      ?auto_51628 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51624 ?auto_51625 ) ) ( not ( = ?auto_51624 ?auto_51626 ) ) ( not ( = ?auto_51624 ?auto_51627 ) ) ( not ( = ?auto_51625 ?auto_51626 ) ) ( not ( = ?auto_51625 ?auto_51627 ) ) ( not ( = ?auto_51626 ?auto_51627 ) ) ( ON ?auto_51627 ?auto_51629 ) ( not ( = ?auto_51624 ?auto_51629 ) ) ( not ( = ?auto_51625 ?auto_51629 ) ) ( not ( = ?auto_51626 ?auto_51629 ) ) ( not ( = ?auto_51627 ?auto_51629 ) ) ( ON-TABLE ?auto_51630 ) ( ON ?auto_51629 ?auto_51630 ) ( not ( = ?auto_51630 ?auto_51629 ) ) ( not ( = ?auto_51630 ?auto_51627 ) ) ( not ( = ?auto_51630 ?auto_51626 ) ) ( not ( = ?auto_51624 ?auto_51630 ) ) ( not ( = ?auto_51625 ?auto_51630 ) ) ( ON ?auto_51624 ?auto_51628 ) ( not ( = ?auto_51624 ?auto_51628 ) ) ( not ( = ?auto_51625 ?auto_51628 ) ) ( not ( = ?auto_51626 ?auto_51628 ) ) ( not ( = ?auto_51627 ?auto_51628 ) ) ( not ( = ?auto_51629 ?auto_51628 ) ) ( not ( = ?auto_51630 ?auto_51628 ) ) ( ON ?auto_51625 ?auto_51624 ) ( CLEAR ?auto_51625 ) ( ON-TABLE ?auto_51628 ) ( HOLDING ?auto_51626 ) ( CLEAR ?auto_51627 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51630 ?auto_51629 ?auto_51627 ?auto_51626 )
      ( MAKE-4PILE ?auto_51624 ?auto_51625 ?auto_51626 ?auto_51627 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51631 - BLOCK
      ?auto_51632 - BLOCK
      ?auto_51633 - BLOCK
      ?auto_51634 - BLOCK
    )
    :vars
    (
      ?auto_51635 - BLOCK
      ?auto_51637 - BLOCK
      ?auto_51636 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51631 ?auto_51632 ) ) ( not ( = ?auto_51631 ?auto_51633 ) ) ( not ( = ?auto_51631 ?auto_51634 ) ) ( not ( = ?auto_51632 ?auto_51633 ) ) ( not ( = ?auto_51632 ?auto_51634 ) ) ( not ( = ?auto_51633 ?auto_51634 ) ) ( ON ?auto_51634 ?auto_51635 ) ( not ( = ?auto_51631 ?auto_51635 ) ) ( not ( = ?auto_51632 ?auto_51635 ) ) ( not ( = ?auto_51633 ?auto_51635 ) ) ( not ( = ?auto_51634 ?auto_51635 ) ) ( ON-TABLE ?auto_51637 ) ( ON ?auto_51635 ?auto_51637 ) ( not ( = ?auto_51637 ?auto_51635 ) ) ( not ( = ?auto_51637 ?auto_51634 ) ) ( not ( = ?auto_51637 ?auto_51633 ) ) ( not ( = ?auto_51631 ?auto_51637 ) ) ( not ( = ?auto_51632 ?auto_51637 ) ) ( ON ?auto_51631 ?auto_51636 ) ( not ( = ?auto_51631 ?auto_51636 ) ) ( not ( = ?auto_51632 ?auto_51636 ) ) ( not ( = ?auto_51633 ?auto_51636 ) ) ( not ( = ?auto_51634 ?auto_51636 ) ) ( not ( = ?auto_51635 ?auto_51636 ) ) ( not ( = ?auto_51637 ?auto_51636 ) ) ( ON ?auto_51632 ?auto_51631 ) ( ON-TABLE ?auto_51636 ) ( CLEAR ?auto_51634 ) ( ON ?auto_51633 ?auto_51632 ) ( CLEAR ?auto_51633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51636 ?auto_51631 ?auto_51632 )
      ( MAKE-4PILE ?auto_51631 ?auto_51632 ?auto_51633 ?auto_51634 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51638 - BLOCK
      ?auto_51639 - BLOCK
      ?auto_51640 - BLOCK
      ?auto_51641 - BLOCK
    )
    :vars
    (
      ?auto_51642 - BLOCK
      ?auto_51644 - BLOCK
      ?auto_51643 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51638 ?auto_51639 ) ) ( not ( = ?auto_51638 ?auto_51640 ) ) ( not ( = ?auto_51638 ?auto_51641 ) ) ( not ( = ?auto_51639 ?auto_51640 ) ) ( not ( = ?auto_51639 ?auto_51641 ) ) ( not ( = ?auto_51640 ?auto_51641 ) ) ( not ( = ?auto_51638 ?auto_51642 ) ) ( not ( = ?auto_51639 ?auto_51642 ) ) ( not ( = ?auto_51640 ?auto_51642 ) ) ( not ( = ?auto_51641 ?auto_51642 ) ) ( ON-TABLE ?auto_51644 ) ( ON ?auto_51642 ?auto_51644 ) ( not ( = ?auto_51644 ?auto_51642 ) ) ( not ( = ?auto_51644 ?auto_51641 ) ) ( not ( = ?auto_51644 ?auto_51640 ) ) ( not ( = ?auto_51638 ?auto_51644 ) ) ( not ( = ?auto_51639 ?auto_51644 ) ) ( ON ?auto_51638 ?auto_51643 ) ( not ( = ?auto_51638 ?auto_51643 ) ) ( not ( = ?auto_51639 ?auto_51643 ) ) ( not ( = ?auto_51640 ?auto_51643 ) ) ( not ( = ?auto_51641 ?auto_51643 ) ) ( not ( = ?auto_51642 ?auto_51643 ) ) ( not ( = ?auto_51644 ?auto_51643 ) ) ( ON ?auto_51639 ?auto_51638 ) ( ON-TABLE ?auto_51643 ) ( ON ?auto_51640 ?auto_51639 ) ( CLEAR ?auto_51640 ) ( HOLDING ?auto_51641 ) ( CLEAR ?auto_51642 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51644 ?auto_51642 ?auto_51641 )
      ( MAKE-4PILE ?auto_51638 ?auto_51639 ?auto_51640 ?auto_51641 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51645 - BLOCK
      ?auto_51646 - BLOCK
      ?auto_51647 - BLOCK
      ?auto_51648 - BLOCK
    )
    :vars
    (
      ?auto_51649 - BLOCK
      ?auto_51650 - BLOCK
      ?auto_51651 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51645 ?auto_51646 ) ) ( not ( = ?auto_51645 ?auto_51647 ) ) ( not ( = ?auto_51645 ?auto_51648 ) ) ( not ( = ?auto_51646 ?auto_51647 ) ) ( not ( = ?auto_51646 ?auto_51648 ) ) ( not ( = ?auto_51647 ?auto_51648 ) ) ( not ( = ?auto_51645 ?auto_51649 ) ) ( not ( = ?auto_51646 ?auto_51649 ) ) ( not ( = ?auto_51647 ?auto_51649 ) ) ( not ( = ?auto_51648 ?auto_51649 ) ) ( ON-TABLE ?auto_51650 ) ( ON ?auto_51649 ?auto_51650 ) ( not ( = ?auto_51650 ?auto_51649 ) ) ( not ( = ?auto_51650 ?auto_51648 ) ) ( not ( = ?auto_51650 ?auto_51647 ) ) ( not ( = ?auto_51645 ?auto_51650 ) ) ( not ( = ?auto_51646 ?auto_51650 ) ) ( ON ?auto_51645 ?auto_51651 ) ( not ( = ?auto_51645 ?auto_51651 ) ) ( not ( = ?auto_51646 ?auto_51651 ) ) ( not ( = ?auto_51647 ?auto_51651 ) ) ( not ( = ?auto_51648 ?auto_51651 ) ) ( not ( = ?auto_51649 ?auto_51651 ) ) ( not ( = ?auto_51650 ?auto_51651 ) ) ( ON ?auto_51646 ?auto_51645 ) ( ON-TABLE ?auto_51651 ) ( ON ?auto_51647 ?auto_51646 ) ( CLEAR ?auto_51649 ) ( ON ?auto_51648 ?auto_51647 ) ( CLEAR ?auto_51648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51651 ?auto_51645 ?auto_51646 ?auto_51647 )
      ( MAKE-4PILE ?auto_51645 ?auto_51646 ?auto_51647 ?auto_51648 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51652 - BLOCK
      ?auto_51653 - BLOCK
      ?auto_51654 - BLOCK
      ?auto_51655 - BLOCK
    )
    :vars
    (
      ?auto_51658 - BLOCK
      ?auto_51657 - BLOCK
      ?auto_51656 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51652 ?auto_51653 ) ) ( not ( = ?auto_51652 ?auto_51654 ) ) ( not ( = ?auto_51652 ?auto_51655 ) ) ( not ( = ?auto_51653 ?auto_51654 ) ) ( not ( = ?auto_51653 ?auto_51655 ) ) ( not ( = ?auto_51654 ?auto_51655 ) ) ( not ( = ?auto_51652 ?auto_51658 ) ) ( not ( = ?auto_51653 ?auto_51658 ) ) ( not ( = ?auto_51654 ?auto_51658 ) ) ( not ( = ?auto_51655 ?auto_51658 ) ) ( ON-TABLE ?auto_51657 ) ( not ( = ?auto_51657 ?auto_51658 ) ) ( not ( = ?auto_51657 ?auto_51655 ) ) ( not ( = ?auto_51657 ?auto_51654 ) ) ( not ( = ?auto_51652 ?auto_51657 ) ) ( not ( = ?auto_51653 ?auto_51657 ) ) ( ON ?auto_51652 ?auto_51656 ) ( not ( = ?auto_51652 ?auto_51656 ) ) ( not ( = ?auto_51653 ?auto_51656 ) ) ( not ( = ?auto_51654 ?auto_51656 ) ) ( not ( = ?auto_51655 ?auto_51656 ) ) ( not ( = ?auto_51658 ?auto_51656 ) ) ( not ( = ?auto_51657 ?auto_51656 ) ) ( ON ?auto_51653 ?auto_51652 ) ( ON-TABLE ?auto_51656 ) ( ON ?auto_51654 ?auto_51653 ) ( ON ?auto_51655 ?auto_51654 ) ( CLEAR ?auto_51655 ) ( HOLDING ?auto_51658 ) ( CLEAR ?auto_51657 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51657 ?auto_51658 )
      ( MAKE-4PILE ?auto_51652 ?auto_51653 ?auto_51654 ?auto_51655 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51659 - BLOCK
      ?auto_51660 - BLOCK
      ?auto_51661 - BLOCK
      ?auto_51662 - BLOCK
    )
    :vars
    (
      ?auto_51664 - BLOCK
      ?auto_51665 - BLOCK
      ?auto_51663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51659 ?auto_51660 ) ) ( not ( = ?auto_51659 ?auto_51661 ) ) ( not ( = ?auto_51659 ?auto_51662 ) ) ( not ( = ?auto_51660 ?auto_51661 ) ) ( not ( = ?auto_51660 ?auto_51662 ) ) ( not ( = ?auto_51661 ?auto_51662 ) ) ( not ( = ?auto_51659 ?auto_51664 ) ) ( not ( = ?auto_51660 ?auto_51664 ) ) ( not ( = ?auto_51661 ?auto_51664 ) ) ( not ( = ?auto_51662 ?auto_51664 ) ) ( ON-TABLE ?auto_51665 ) ( not ( = ?auto_51665 ?auto_51664 ) ) ( not ( = ?auto_51665 ?auto_51662 ) ) ( not ( = ?auto_51665 ?auto_51661 ) ) ( not ( = ?auto_51659 ?auto_51665 ) ) ( not ( = ?auto_51660 ?auto_51665 ) ) ( ON ?auto_51659 ?auto_51663 ) ( not ( = ?auto_51659 ?auto_51663 ) ) ( not ( = ?auto_51660 ?auto_51663 ) ) ( not ( = ?auto_51661 ?auto_51663 ) ) ( not ( = ?auto_51662 ?auto_51663 ) ) ( not ( = ?auto_51664 ?auto_51663 ) ) ( not ( = ?auto_51665 ?auto_51663 ) ) ( ON ?auto_51660 ?auto_51659 ) ( ON-TABLE ?auto_51663 ) ( ON ?auto_51661 ?auto_51660 ) ( ON ?auto_51662 ?auto_51661 ) ( CLEAR ?auto_51665 ) ( ON ?auto_51664 ?auto_51662 ) ( CLEAR ?auto_51664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51663 ?auto_51659 ?auto_51660 ?auto_51661 ?auto_51662 )
      ( MAKE-4PILE ?auto_51659 ?auto_51660 ?auto_51661 ?auto_51662 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51666 - BLOCK
      ?auto_51667 - BLOCK
      ?auto_51668 - BLOCK
      ?auto_51669 - BLOCK
    )
    :vars
    (
      ?auto_51670 - BLOCK
      ?auto_51672 - BLOCK
      ?auto_51671 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51666 ?auto_51667 ) ) ( not ( = ?auto_51666 ?auto_51668 ) ) ( not ( = ?auto_51666 ?auto_51669 ) ) ( not ( = ?auto_51667 ?auto_51668 ) ) ( not ( = ?auto_51667 ?auto_51669 ) ) ( not ( = ?auto_51668 ?auto_51669 ) ) ( not ( = ?auto_51666 ?auto_51670 ) ) ( not ( = ?auto_51667 ?auto_51670 ) ) ( not ( = ?auto_51668 ?auto_51670 ) ) ( not ( = ?auto_51669 ?auto_51670 ) ) ( not ( = ?auto_51672 ?auto_51670 ) ) ( not ( = ?auto_51672 ?auto_51669 ) ) ( not ( = ?auto_51672 ?auto_51668 ) ) ( not ( = ?auto_51666 ?auto_51672 ) ) ( not ( = ?auto_51667 ?auto_51672 ) ) ( ON ?auto_51666 ?auto_51671 ) ( not ( = ?auto_51666 ?auto_51671 ) ) ( not ( = ?auto_51667 ?auto_51671 ) ) ( not ( = ?auto_51668 ?auto_51671 ) ) ( not ( = ?auto_51669 ?auto_51671 ) ) ( not ( = ?auto_51670 ?auto_51671 ) ) ( not ( = ?auto_51672 ?auto_51671 ) ) ( ON ?auto_51667 ?auto_51666 ) ( ON-TABLE ?auto_51671 ) ( ON ?auto_51668 ?auto_51667 ) ( ON ?auto_51669 ?auto_51668 ) ( ON ?auto_51670 ?auto_51669 ) ( CLEAR ?auto_51670 ) ( HOLDING ?auto_51672 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51672 )
      ( MAKE-4PILE ?auto_51666 ?auto_51667 ?auto_51668 ?auto_51669 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51673 - BLOCK
      ?auto_51674 - BLOCK
      ?auto_51675 - BLOCK
      ?auto_51676 - BLOCK
    )
    :vars
    (
      ?auto_51678 - BLOCK
      ?auto_51679 - BLOCK
      ?auto_51677 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51673 ?auto_51674 ) ) ( not ( = ?auto_51673 ?auto_51675 ) ) ( not ( = ?auto_51673 ?auto_51676 ) ) ( not ( = ?auto_51674 ?auto_51675 ) ) ( not ( = ?auto_51674 ?auto_51676 ) ) ( not ( = ?auto_51675 ?auto_51676 ) ) ( not ( = ?auto_51673 ?auto_51678 ) ) ( not ( = ?auto_51674 ?auto_51678 ) ) ( not ( = ?auto_51675 ?auto_51678 ) ) ( not ( = ?auto_51676 ?auto_51678 ) ) ( not ( = ?auto_51679 ?auto_51678 ) ) ( not ( = ?auto_51679 ?auto_51676 ) ) ( not ( = ?auto_51679 ?auto_51675 ) ) ( not ( = ?auto_51673 ?auto_51679 ) ) ( not ( = ?auto_51674 ?auto_51679 ) ) ( ON ?auto_51673 ?auto_51677 ) ( not ( = ?auto_51673 ?auto_51677 ) ) ( not ( = ?auto_51674 ?auto_51677 ) ) ( not ( = ?auto_51675 ?auto_51677 ) ) ( not ( = ?auto_51676 ?auto_51677 ) ) ( not ( = ?auto_51678 ?auto_51677 ) ) ( not ( = ?auto_51679 ?auto_51677 ) ) ( ON ?auto_51674 ?auto_51673 ) ( ON-TABLE ?auto_51677 ) ( ON ?auto_51675 ?auto_51674 ) ( ON ?auto_51676 ?auto_51675 ) ( ON ?auto_51678 ?auto_51676 ) ( ON ?auto_51679 ?auto_51678 ) ( CLEAR ?auto_51679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_51677 ?auto_51673 ?auto_51674 ?auto_51675 ?auto_51676 ?auto_51678 )
      ( MAKE-4PILE ?auto_51673 ?auto_51674 ?auto_51675 ?auto_51676 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51691 - BLOCK
    )
    :vars
    (
      ?auto_51693 - BLOCK
      ?auto_51694 - BLOCK
      ?auto_51692 - BLOCK
      ?auto_51696 - BLOCK
      ?auto_51695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51693 ?auto_51691 ) ( ON-TABLE ?auto_51691 ) ( not ( = ?auto_51691 ?auto_51693 ) ) ( not ( = ?auto_51691 ?auto_51694 ) ) ( not ( = ?auto_51691 ?auto_51692 ) ) ( not ( = ?auto_51693 ?auto_51694 ) ) ( not ( = ?auto_51693 ?auto_51692 ) ) ( not ( = ?auto_51694 ?auto_51692 ) ) ( ON ?auto_51694 ?auto_51693 ) ( CLEAR ?auto_51694 ) ( HOLDING ?auto_51692 ) ( CLEAR ?auto_51696 ) ( ON-TABLE ?auto_51695 ) ( ON ?auto_51696 ?auto_51695 ) ( not ( = ?auto_51695 ?auto_51696 ) ) ( not ( = ?auto_51695 ?auto_51692 ) ) ( not ( = ?auto_51696 ?auto_51692 ) ) ( not ( = ?auto_51691 ?auto_51696 ) ) ( not ( = ?auto_51691 ?auto_51695 ) ) ( not ( = ?auto_51693 ?auto_51696 ) ) ( not ( = ?auto_51693 ?auto_51695 ) ) ( not ( = ?auto_51694 ?auto_51696 ) ) ( not ( = ?auto_51694 ?auto_51695 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51695 ?auto_51696 ?auto_51692 )
      ( MAKE-1PILE ?auto_51691 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51697 - BLOCK
    )
    :vars
    (
      ?auto_51699 - BLOCK
      ?auto_51700 - BLOCK
      ?auto_51698 - BLOCK
      ?auto_51702 - BLOCK
      ?auto_51701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51699 ?auto_51697 ) ( ON-TABLE ?auto_51697 ) ( not ( = ?auto_51697 ?auto_51699 ) ) ( not ( = ?auto_51697 ?auto_51700 ) ) ( not ( = ?auto_51697 ?auto_51698 ) ) ( not ( = ?auto_51699 ?auto_51700 ) ) ( not ( = ?auto_51699 ?auto_51698 ) ) ( not ( = ?auto_51700 ?auto_51698 ) ) ( ON ?auto_51700 ?auto_51699 ) ( CLEAR ?auto_51702 ) ( ON-TABLE ?auto_51701 ) ( ON ?auto_51702 ?auto_51701 ) ( not ( = ?auto_51701 ?auto_51702 ) ) ( not ( = ?auto_51701 ?auto_51698 ) ) ( not ( = ?auto_51702 ?auto_51698 ) ) ( not ( = ?auto_51697 ?auto_51702 ) ) ( not ( = ?auto_51697 ?auto_51701 ) ) ( not ( = ?auto_51699 ?auto_51702 ) ) ( not ( = ?auto_51699 ?auto_51701 ) ) ( not ( = ?auto_51700 ?auto_51702 ) ) ( not ( = ?auto_51700 ?auto_51701 ) ) ( ON ?auto_51698 ?auto_51700 ) ( CLEAR ?auto_51698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51697 ?auto_51699 ?auto_51700 )
      ( MAKE-1PILE ?auto_51697 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51703 - BLOCK
    )
    :vars
    (
      ?auto_51708 - BLOCK
      ?auto_51707 - BLOCK
      ?auto_51705 - BLOCK
      ?auto_51706 - BLOCK
      ?auto_51704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51708 ?auto_51703 ) ( ON-TABLE ?auto_51703 ) ( not ( = ?auto_51703 ?auto_51708 ) ) ( not ( = ?auto_51703 ?auto_51707 ) ) ( not ( = ?auto_51703 ?auto_51705 ) ) ( not ( = ?auto_51708 ?auto_51707 ) ) ( not ( = ?auto_51708 ?auto_51705 ) ) ( not ( = ?auto_51707 ?auto_51705 ) ) ( ON ?auto_51707 ?auto_51708 ) ( ON-TABLE ?auto_51706 ) ( not ( = ?auto_51706 ?auto_51704 ) ) ( not ( = ?auto_51706 ?auto_51705 ) ) ( not ( = ?auto_51704 ?auto_51705 ) ) ( not ( = ?auto_51703 ?auto_51704 ) ) ( not ( = ?auto_51703 ?auto_51706 ) ) ( not ( = ?auto_51708 ?auto_51704 ) ) ( not ( = ?auto_51708 ?auto_51706 ) ) ( not ( = ?auto_51707 ?auto_51704 ) ) ( not ( = ?auto_51707 ?auto_51706 ) ) ( ON ?auto_51705 ?auto_51707 ) ( CLEAR ?auto_51705 ) ( HOLDING ?auto_51704 ) ( CLEAR ?auto_51706 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51706 ?auto_51704 )
      ( MAKE-1PILE ?auto_51703 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51709 - BLOCK
    )
    :vars
    (
      ?auto_51711 - BLOCK
      ?auto_51710 - BLOCK
      ?auto_51714 - BLOCK
      ?auto_51712 - BLOCK
      ?auto_51713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51711 ?auto_51709 ) ( ON-TABLE ?auto_51709 ) ( not ( = ?auto_51709 ?auto_51711 ) ) ( not ( = ?auto_51709 ?auto_51710 ) ) ( not ( = ?auto_51709 ?auto_51714 ) ) ( not ( = ?auto_51711 ?auto_51710 ) ) ( not ( = ?auto_51711 ?auto_51714 ) ) ( not ( = ?auto_51710 ?auto_51714 ) ) ( ON ?auto_51710 ?auto_51711 ) ( ON-TABLE ?auto_51712 ) ( not ( = ?auto_51712 ?auto_51713 ) ) ( not ( = ?auto_51712 ?auto_51714 ) ) ( not ( = ?auto_51713 ?auto_51714 ) ) ( not ( = ?auto_51709 ?auto_51713 ) ) ( not ( = ?auto_51709 ?auto_51712 ) ) ( not ( = ?auto_51711 ?auto_51713 ) ) ( not ( = ?auto_51711 ?auto_51712 ) ) ( not ( = ?auto_51710 ?auto_51713 ) ) ( not ( = ?auto_51710 ?auto_51712 ) ) ( ON ?auto_51714 ?auto_51710 ) ( CLEAR ?auto_51712 ) ( ON ?auto_51713 ?auto_51714 ) ( CLEAR ?auto_51713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51709 ?auto_51711 ?auto_51710 ?auto_51714 )
      ( MAKE-1PILE ?auto_51709 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51715 - BLOCK
    )
    :vars
    (
      ?auto_51717 - BLOCK
      ?auto_51719 - BLOCK
      ?auto_51718 - BLOCK
      ?auto_51716 - BLOCK
      ?auto_51720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51717 ?auto_51715 ) ( ON-TABLE ?auto_51715 ) ( not ( = ?auto_51715 ?auto_51717 ) ) ( not ( = ?auto_51715 ?auto_51719 ) ) ( not ( = ?auto_51715 ?auto_51718 ) ) ( not ( = ?auto_51717 ?auto_51719 ) ) ( not ( = ?auto_51717 ?auto_51718 ) ) ( not ( = ?auto_51719 ?auto_51718 ) ) ( ON ?auto_51719 ?auto_51717 ) ( not ( = ?auto_51716 ?auto_51720 ) ) ( not ( = ?auto_51716 ?auto_51718 ) ) ( not ( = ?auto_51720 ?auto_51718 ) ) ( not ( = ?auto_51715 ?auto_51720 ) ) ( not ( = ?auto_51715 ?auto_51716 ) ) ( not ( = ?auto_51717 ?auto_51720 ) ) ( not ( = ?auto_51717 ?auto_51716 ) ) ( not ( = ?auto_51719 ?auto_51720 ) ) ( not ( = ?auto_51719 ?auto_51716 ) ) ( ON ?auto_51718 ?auto_51719 ) ( ON ?auto_51720 ?auto_51718 ) ( CLEAR ?auto_51720 ) ( HOLDING ?auto_51716 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51716 )
      ( MAKE-1PILE ?auto_51715 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51728 - BLOCK
    )
    :vars
    (
      ?auto_51729 - BLOCK
      ?auto_51731 - BLOCK
      ?auto_51733 - BLOCK
      ?auto_51730 - BLOCK
      ?auto_51732 - BLOCK
      ?auto_51734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51729 ?auto_51728 ) ( ON-TABLE ?auto_51728 ) ( not ( = ?auto_51728 ?auto_51729 ) ) ( not ( = ?auto_51728 ?auto_51731 ) ) ( not ( = ?auto_51728 ?auto_51733 ) ) ( not ( = ?auto_51729 ?auto_51731 ) ) ( not ( = ?auto_51729 ?auto_51733 ) ) ( not ( = ?auto_51731 ?auto_51733 ) ) ( ON ?auto_51731 ?auto_51729 ) ( not ( = ?auto_51730 ?auto_51732 ) ) ( not ( = ?auto_51730 ?auto_51733 ) ) ( not ( = ?auto_51732 ?auto_51733 ) ) ( not ( = ?auto_51728 ?auto_51732 ) ) ( not ( = ?auto_51728 ?auto_51730 ) ) ( not ( = ?auto_51729 ?auto_51732 ) ) ( not ( = ?auto_51729 ?auto_51730 ) ) ( not ( = ?auto_51731 ?auto_51732 ) ) ( not ( = ?auto_51731 ?auto_51730 ) ) ( ON ?auto_51733 ?auto_51731 ) ( ON ?auto_51732 ?auto_51733 ) ( CLEAR ?auto_51732 ) ( ON ?auto_51730 ?auto_51734 ) ( CLEAR ?auto_51730 ) ( HAND-EMPTY ) ( not ( = ?auto_51728 ?auto_51734 ) ) ( not ( = ?auto_51729 ?auto_51734 ) ) ( not ( = ?auto_51731 ?auto_51734 ) ) ( not ( = ?auto_51733 ?auto_51734 ) ) ( not ( = ?auto_51730 ?auto_51734 ) ) ( not ( = ?auto_51732 ?auto_51734 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51730 ?auto_51734 )
      ( MAKE-1PILE ?auto_51728 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51735 - BLOCK
    )
    :vars
    (
      ?auto_51738 - BLOCK
      ?auto_51739 - BLOCK
      ?auto_51737 - BLOCK
      ?auto_51741 - BLOCK
      ?auto_51740 - BLOCK
      ?auto_51736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51738 ?auto_51735 ) ( ON-TABLE ?auto_51735 ) ( not ( = ?auto_51735 ?auto_51738 ) ) ( not ( = ?auto_51735 ?auto_51739 ) ) ( not ( = ?auto_51735 ?auto_51737 ) ) ( not ( = ?auto_51738 ?auto_51739 ) ) ( not ( = ?auto_51738 ?auto_51737 ) ) ( not ( = ?auto_51739 ?auto_51737 ) ) ( ON ?auto_51739 ?auto_51738 ) ( not ( = ?auto_51741 ?auto_51740 ) ) ( not ( = ?auto_51741 ?auto_51737 ) ) ( not ( = ?auto_51740 ?auto_51737 ) ) ( not ( = ?auto_51735 ?auto_51740 ) ) ( not ( = ?auto_51735 ?auto_51741 ) ) ( not ( = ?auto_51738 ?auto_51740 ) ) ( not ( = ?auto_51738 ?auto_51741 ) ) ( not ( = ?auto_51739 ?auto_51740 ) ) ( not ( = ?auto_51739 ?auto_51741 ) ) ( ON ?auto_51737 ?auto_51739 ) ( ON ?auto_51741 ?auto_51736 ) ( CLEAR ?auto_51741 ) ( not ( = ?auto_51735 ?auto_51736 ) ) ( not ( = ?auto_51738 ?auto_51736 ) ) ( not ( = ?auto_51739 ?auto_51736 ) ) ( not ( = ?auto_51737 ?auto_51736 ) ) ( not ( = ?auto_51741 ?auto_51736 ) ) ( not ( = ?auto_51740 ?auto_51736 ) ) ( HOLDING ?auto_51740 ) ( CLEAR ?auto_51737 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51735 ?auto_51738 ?auto_51739 ?auto_51737 ?auto_51740 )
      ( MAKE-1PILE ?auto_51735 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51742 - BLOCK
    )
    :vars
    (
      ?auto_51743 - BLOCK
      ?auto_51746 - BLOCK
      ?auto_51747 - BLOCK
      ?auto_51744 - BLOCK
      ?auto_51748 - BLOCK
      ?auto_51745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51743 ?auto_51742 ) ( ON-TABLE ?auto_51742 ) ( not ( = ?auto_51742 ?auto_51743 ) ) ( not ( = ?auto_51742 ?auto_51746 ) ) ( not ( = ?auto_51742 ?auto_51747 ) ) ( not ( = ?auto_51743 ?auto_51746 ) ) ( not ( = ?auto_51743 ?auto_51747 ) ) ( not ( = ?auto_51746 ?auto_51747 ) ) ( ON ?auto_51746 ?auto_51743 ) ( not ( = ?auto_51744 ?auto_51748 ) ) ( not ( = ?auto_51744 ?auto_51747 ) ) ( not ( = ?auto_51748 ?auto_51747 ) ) ( not ( = ?auto_51742 ?auto_51748 ) ) ( not ( = ?auto_51742 ?auto_51744 ) ) ( not ( = ?auto_51743 ?auto_51748 ) ) ( not ( = ?auto_51743 ?auto_51744 ) ) ( not ( = ?auto_51746 ?auto_51748 ) ) ( not ( = ?auto_51746 ?auto_51744 ) ) ( ON ?auto_51747 ?auto_51746 ) ( ON ?auto_51744 ?auto_51745 ) ( not ( = ?auto_51742 ?auto_51745 ) ) ( not ( = ?auto_51743 ?auto_51745 ) ) ( not ( = ?auto_51746 ?auto_51745 ) ) ( not ( = ?auto_51747 ?auto_51745 ) ) ( not ( = ?auto_51744 ?auto_51745 ) ) ( not ( = ?auto_51748 ?auto_51745 ) ) ( CLEAR ?auto_51747 ) ( ON ?auto_51748 ?auto_51744 ) ( CLEAR ?auto_51748 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51745 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51745 ?auto_51744 )
      ( MAKE-1PILE ?auto_51742 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51782 - BLOCK
      ?auto_51783 - BLOCK
      ?auto_51784 - BLOCK
      ?auto_51785 - BLOCK
      ?auto_51786 - BLOCK
    )
    :vars
    (
      ?auto_51787 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51782 ) ( ON ?auto_51783 ?auto_51782 ) ( ON ?auto_51784 ?auto_51783 ) ( not ( = ?auto_51782 ?auto_51783 ) ) ( not ( = ?auto_51782 ?auto_51784 ) ) ( not ( = ?auto_51782 ?auto_51785 ) ) ( not ( = ?auto_51782 ?auto_51786 ) ) ( not ( = ?auto_51783 ?auto_51784 ) ) ( not ( = ?auto_51783 ?auto_51785 ) ) ( not ( = ?auto_51783 ?auto_51786 ) ) ( not ( = ?auto_51784 ?auto_51785 ) ) ( not ( = ?auto_51784 ?auto_51786 ) ) ( not ( = ?auto_51785 ?auto_51786 ) ) ( ON ?auto_51786 ?auto_51787 ) ( not ( = ?auto_51782 ?auto_51787 ) ) ( not ( = ?auto_51783 ?auto_51787 ) ) ( not ( = ?auto_51784 ?auto_51787 ) ) ( not ( = ?auto_51785 ?auto_51787 ) ) ( not ( = ?auto_51786 ?auto_51787 ) ) ( CLEAR ?auto_51784 ) ( ON ?auto_51785 ?auto_51786 ) ( CLEAR ?auto_51785 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51787 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51787 ?auto_51786 )
      ( MAKE-5PILE ?auto_51782 ?auto_51783 ?auto_51784 ?auto_51785 ?auto_51786 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51788 - BLOCK
      ?auto_51789 - BLOCK
      ?auto_51790 - BLOCK
      ?auto_51791 - BLOCK
      ?auto_51792 - BLOCK
    )
    :vars
    (
      ?auto_51793 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51788 ) ( ON ?auto_51789 ?auto_51788 ) ( not ( = ?auto_51788 ?auto_51789 ) ) ( not ( = ?auto_51788 ?auto_51790 ) ) ( not ( = ?auto_51788 ?auto_51791 ) ) ( not ( = ?auto_51788 ?auto_51792 ) ) ( not ( = ?auto_51789 ?auto_51790 ) ) ( not ( = ?auto_51789 ?auto_51791 ) ) ( not ( = ?auto_51789 ?auto_51792 ) ) ( not ( = ?auto_51790 ?auto_51791 ) ) ( not ( = ?auto_51790 ?auto_51792 ) ) ( not ( = ?auto_51791 ?auto_51792 ) ) ( ON ?auto_51792 ?auto_51793 ) ( not ( = ?auto_51788 ?auto_51793 ) ) ( not ( = ?auto_51789 ?auto_51793 ) ) ( not ( = ?auto_51790 ?auto_51793 ) ) ( not ( = ?auto_51791 ?auto_51793 ) ) ( not ( = ?auto_51792 ?auto_51793 ) ) ( ON ?auto_51791 ?auto_51792 ) ( CLEAR ?auto_51791 ) ( ON-TABLE ?auto_51793 ) ( HOLDING ?auto_51790 ) ( CLEAR ?auto_51789 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51788 ?auto_51789 ?auto_51790 )
      ( MAKE-5PILE ?auto_51788 ?auto_51789 ?auto_51790 ?auto_51791 ?auto_51792 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51794 - BLOCK
      ?auto_51795 - BLOCK
      ?auto_51796 - BLOCK
      ?auto_51797 - BLOCK
      ?auto_51798 - BLOCK
    )
    :vars
    (
      ?auto_51799 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51794 ) ( ON ?auto_51795 ?auto_51794 ) ( not ( = ?auto_51794 ?auto_51795 ) ) ( not ( = ?auto_51794 ?auto_51796 ) ) ( not ( = ?auto_51794 ?auto_51797 ) ) ( not ( = ?auto_51794 ?auto_51798 ) ) ( not ( = ?auto_51795 ?auto_51796 ) ) ( not ( = ?auto_51795 ?auto_51797 ) ) ( not ( = ?auto_51795 ?auto_51798 ) ) ( not ( = ?auto_51796 ?auto_51797 ) ) ( not ( = ?auto_51796 ?auto_51798 ) ) ( not ( = ?auto_51797 ?auto_51798 ) ) ( ON ?auto_51798 ?auto_51799 ) ( not ( = ?auto_51794 ?auto_51799 ) ) ( not ( = ?auto_51795 ?auto_51799 ) ) ( not ( = ?auto_51796 ?auto_51799 ) ) ( not ( = ?auto_51797 ?auto_51799 ) ) ( not ( = ?auto_51798 ?auto_51799 ) ) ( ON ?auto_51797 ?auto_51798 ) ( ON-TABLE ?auto_51799 ) ( CLEAR ?auto_51795 ) ( ON ?auto_51796 ?auto_51797 ) ( CLEAR ?auto_51796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51799 ?auto_51798 ?auto_51797 )
      ( MAKE-5PILE ?auto_51794 ?auto_51795 ?auto_51796 ?auto_51797 ?auto_51798 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51800 - BLOCK
      ?auto_51801 - BLOCK
      ?auto_51802 - BLOCK
      ?auto_51803 - BLOCK
      ?auto_51804 - BLOCK
    )
    :vars
    (
      ?auto_51805 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51800 ) ( not ( = ?auto_51800 ?auto_51801 ) ) ( not ( = ?auto_51800 ?auto_51802 ) ) ( not ( = ?auto_51800 ?auto_51803 ) ) ( not ( = ?auto_51800 ?auto_51804 ) ) ( not ( = ?auto_51801 ?auto_51802 ) ) ( not ( = ?auto_51801 ?auto_51803 ) ) ( not ( = ?auto_51801 ?auto_51804 ) ) ( not ( = ?auto_51802 ?auto_51803 ) ) ( not ( = ?auto_51802 ?auto_51804 ) ) ( not ( = ?auto_51803 ?auto_51804 ) ) ( ON ?auto_51804 ?auto_51805 ) ( not ( = ?auto_51800 ?auto_51805 ) ) ( not ( = ?auto_51801 ?auto_51805 ) ) ( not ( = ?auto_51802 ?auto_51805 ) ) ( not ( = ?auto_51803 ?auto_51805 ) ) ( not ( = ?auto_51804 ?auto_51805 ) ) ( ON ?auto_51803 ?auto_51804 ) ( ON-TABLE ?auto_51805 ) ( ON ?auto_51802 ?auto_51803 ) ( CLEAR ?auto_51802 ) ( HOLDING ?auto_51801 ) ( CLEAR ?auto_51800 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51800 ?auto_51801 )
      ( MAKE-5PILE ?auto_51800 ?auto_51801 ?auto_51802 ?auto_51803 ?auto_51804 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51806 - BLOCK
      ?auto_51807 - BLOCK
      ?auto_51808 - BLOCK
      ?auto_51809 - BLOCK
      ?auto_51810 - BLOCK
    )
    :vars
    (
      ?auto_51811 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51806 ) ( not ( = ?auto_51806 ?auto_51807 ) ) ( not ( = ?auto_51806 ?auto_51808 ) ) ( not ( = ?auto_51806 ?auto_51809 ) ) ( not ( = ?auto_51806 ?auto_51810 ) ) ( not ( = ?auto_51807 ?auto_51808 ) ) ( not ( = ?auto_51807 ?auto_51809 ) ) ( not ( = ?auto_51807 ?auto_51810 ) ) ( not ( = ?auto_51808 ?auto_51809 ) ) ( not ( = ?auto_51808 ?auto_51810 ) ) ( not ( = ?auto_51809 ?auto_51810 ) ) ( ON ?auto_51810 ?auto_51811 ) ( not ( = ?auto_51806 ?auto_51811 ) ) ( not ( = ?auto_51807 ?auto_51811 ) ) ( not ( = ?auto_51808 ?auto_51811 ) ) ( not ( = ?auto_51809 ?auto_51811 ) ) ( not ( = ?auto_51810 ?auto_51811 ) ) ( ON ?auto_51809 ?auto_51810 ) ( ON-TABLE ?auto_51811 ) ( ON ?auto_51808 ?auto_51809 ) ( CLEAR ?auto_51806 ) ( ON ?auto_51807 ?auto_51808 ) ( CLEAR ?auto_51807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51811 ?auto_51810 ?auto_51809 ?auto_51808 )
      ( MAKE-5PILE ?auto_51806 ?auto_51807 ?auto_51808 ?auto_51809 ?auto_51810 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51812 - BLOCK
      ?auto_51813 - BLOCK
      ?auto_51814 - BLOCK
      ?auto_51815 - BLOCK
      ?auto_51816 - BLOCK
    )
    :vars
    (
      ?auto_51817 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51812 ?auto_51813 ) ) ( not ( = ?auto_51812 ?auto_51814 ) ) ( not ( = ?auto_51812 ?auto_51815 ) ) ( not ( = ?auto_51812 ?auto_51816 ) ) ( not ( = ?auto_51813 ?auto_51814 ) ) ( not ( = ?auto_51813 ?auto_51815 ) ) ( not ( = ?auto_51813 ?auto_51816 ) ) ( not ( = ?auto_51814 ?auto_51815 ) ) ( not ( = ?auto_51814 ?auto_51816 ) ) ( not ( = ?auto_51815 ?auto_51816 ) ) ( ON ?auto_51816 ?auto_51817 ) ( not ( = ?auto_51812 ?auto_51817 ) ) ( not ( = ?auto_51813 ?auto_51817 ) ) ( not ( = ?auto_51814 ?auto_51817 ) ) ( not ( = ?auto_51815 ?auto_51817 ) ) ( not ( = ?auto_51816 ?auto_51817 ) ) ( ON ?auto_51815 ?auto_51816 ) ( ON-TABLE ?auto_51817 ) ( ON ?auto_51814 ?auto_51815 ) ( ON ?auto_51813 ?auto_51814 ) ( CLEAR ?auto_51813 ) ( HOLDING ?auto_51812 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51812 )
      ( MAKE-5PILE ?auto_51812 ?auto_51813 ?auto_51814 ?auto_51815 ?auto_51816 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51818 - BLOCK
      ?auto_51819 - BLOCK
      ?auto_51820 - BLOCK
      ?auto_51821 - BLOCK
      ?auto_51822 - BLOCK
    )
    :vars
    (
      ?auto_51823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51818 ?auto_51819 ) ) ( not ( = ?auto_51818 ?auto_51820 ) ) ( not ( = ?auto_51818 ?auto_51821 ) ) ( not ( = ?auto_51818 ?auto_51822 ) ) ( not ( = ?auto_51819 ?auto_51820 ) ) ( not ( = ?auto_51819 ?auto_51821 ) ) ( not ( = ?auto_51819 ?auto_51822 ) ) ( not ( = ?auto_51820 ?auto_51821 ) ) ( not ( = ?auto_51820 ?auto_51822 ) ) ( not ( = ?auto_51821 ?auto_51822 ) ) ( ON ?auto_51822 ?auto_51823 ) ( not ( = ?auto_51818 ?auto_51823 ) ) ( not ( = ?auto_51819 ?auto_51823 ) ) ( not ( = ?auto_51820 ?auto_51823 ) ) ( not ( = ?auto_51821 ?auto_51823 ) ) ( not ( = ?auto_51822 ?auto_51823 ) ) ( ON ?auto_51821 ?auto_51822 ) ( ON-TABLE ?auto_51823 ) ( ON ?auto_51820 ?auto_51821 ) ( ON ?auto_51819 ?auto_51820 ) ( ON ?auto_51818 ?auto_51819 ) ( CLEAR ?auto_51818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51823 ?auto_51822 ?auto_51821 ?auto_51820 ?auto_51819 )
      ( MAKE-5PILE ?auto_51818 ?auto_51819 ?auto_51820 ?auto_51821 ?auto_51822 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51829 - BLOCK
      ?auto_51830 - BLOCK
      ?auto_51831 - BLOCK
      ?auto_51832 - BLOCK
      ?auto_51833 - BLOCK
    )
    :vars
    (
      ?auto_51834 - BLOCK
      ?auto_51835 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51829 ?auto_51830 ) ) ( not ( = ?auto_51829 ?auto_51831 ) ) ( not ( = ?auto_51829 ?auto_51832 ) ) ( not ( = ?auto_51829 ?auto_51833 ) ) ( not ( = ?auto_51830 ?auto_51831 ) ) ( not ( = ?auto_51830 ?auto_51832 ) ) ( not ( = ?auto_51830 ?auto_51833 ) ) ( not ( = ?auto_51831 ?auto_51832 ) ) ( not ( = ?auto_51831 ?auto_51833 ) ) ( not ( = ?auto_51832 ?auto_51833 ) ) ( ON ?auto_51833 ?auto_51834 ) ( not ( = ?auto_51829 ?auto_51834 ) ) ( not ( = ?auto_51830 ?auto_51834 ) ) ( not ( = ?auto_51831 ?auto_51834 ) ) ( not ( = ?auto_51832 ?auto_51834 ) ) ( not ( = ?auto_51833 ?auto_51834 ) ) ( ON ?auto_51832 ?auto_51833 ) ( ON-TABLE ?auto_51834 ) ( ON ?auto_51831 ?auto_51832 ) ( ON ?auto_51830 ?auto_51831 ) ( CLEAR ?auto_51830 ) ( ON ?auto_51829 ?auto_51835 ) ( CLEAR ?auto_51829 ) ( HAND-EMPTY ) ( not ( = ?auto_51829 ?auto_51835 ) ) ( not ( = ?auto_51830 ?auto_51835 ) ) ( not ( = ?auto_51831 ?auto_51835 ) ) ( not ( = ?auto_51832 ?auto_51835 ) ) ( not ( = ?auto_51833 ?auto_51835 ) ) ( not ( = ?auto_51834 ?auto_51835 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51829 ?auto_51835 )
      ( MAKE-5PILE ?auto_51829 ?auto_51830 ?auto_51831 ?auto_51832 ?auto_51833 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51836 - BLOCK
      ?auto_51837 - BLOCK
      ?auto_51838 - BLOCK
      ?auto_51839 - BLOCK
      ?auto_51840 - BLOCK
    )
    :vars
    (
      ?auto_51842 - BLOCK
      ?auto_51841 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51836 ?auto_51837 ) ) ( not ( = ?auto_51836 ?auto_51838 ) ) ( not ( = ?auto_51836 ?auto_51839 ) ) ( not ( = ?auto_51836 ?auto_51840 ) ) ( not ( = ?auto_51837 ?auto_51838 ) ) ( not ( = ?auto_51837 ?auto_51839 ) ) ( not ( = ?auto_51837 ?auto_51840 ) ) ( not ( = ?auto_51838 ?auto_51839 ) ) ( not ( = ?auto_51838 ?auto_51840 ) ) ( not ( = ?auto_51839 ?auto_51840 ) ) ( ON ?auto_51840 ?auto_51842 ) ( not ( = ?auto_51836 ?auto_51842 ) ) ( not ( = ?auto_51837 ?auto_51842 ) ) ( not ( = ?auto_51838 ?auto_51842 ) ) ( not ( = ?auto_51839 ?auto_51842 ) ) ( not ( = ?auto_51840 ?auto_51842 ) ) ( ON ?auto_51839 ?auto_51840 ) ( ON-TABLE ?auto_51842 ) ( ON ?auto_51838 ?auto_51839 ) ( ON ?auto_51836 ?auto_51841 ) ( CLEAR ?auto_51836 ) ( not ( = ?auto_51836 ?auto_51841 ) ) ( not ( = ?auto_51837 ?auto_51841 ) ) ( not ( = ?auto_51838 ?auto_51841 ) ) ( not ( = ?auto_51839 ?auto_51841 ) ) ( not ( = ?auto_51840 ?auto_51841 ) ) ( not ( = ?auto_51842 ?auto_51841 ) ) ( HOLDING ?auto_51837 ) ( CLEAR ?auto_51838 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51842 ?auto_51840 ?auto_51839 ?auto_51838 ?auto_51837 )
      ( MAKE-5PILE ?auto_51836 ?auto_51837 ?auto_51838 ?auto_51839 ?auto_51840 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51843 - BLOCK
      ?auto_51844 - BLOCK
      ?auto_51845 - BLOCK
      ?auto_51846 - BLOCK
      ?auto_51847 - BLOCK
    )
    :vars
    (
      ?auto_51848 - BLOCK
      ?auto_51849 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51843 ?auto_51844 ) ) ( not ( = ?auto_51843 ?auto_51845 ) ) ( not ( = ?auto_51843 ?auto_51846 ) ) ( not ( = ?auto_51843 ?auto_51847 ) ) ( not ( = ?auto_51844 ?auto_51845 ) ) ( not ( = ?auto_51844 ?auto_51846 ) ) ( not ( = ?auto_51844 ?auto_51847 ) ) ( not ( = ?auto_51845 ?auto_51846 ) ) ( not ( = ?auto_51845 ?auto_51847 ) ) ( not ( = ?auto_51846 ?auto_51847 ) ) ( ON ?auto_51847 ?auto_51848 ) ( not ( = ?auto_51843 ?auto_51848 ) ) ( not ( = ?auto_51844 ?auto_51848 ) ) ( not ( = ?auto_51845 ?auto_51848 ) ) ( not ( = ?auto_51846 ?auto_51848 ) ) ( not ( = ?auto_51847 ?auto_51848 ) ) ( ON ?auto_51846 ?auto_51847 ) ( ON-TABLE ?auto_51848 ) ( ON ?auto_51845 ?auto_51846 ) ( ON ?auto_51843 ?auto_51849 ) ( not ( = ?auto_51843 ?auto_51849 ) ) ( not ( = ?auto_51844 ?auto_51849 ) ) ( not ( = ?auto_51845 ?auto_51849 ) ) ( not ( = ?auto_51846 ?auto_51849 ) ) ( not ( = ?auto_51847 ?auto_51849 ) ) ( not ( = ?auto_51848 ?auto_51849 ) ) ( CLEAR ?auto_51845 ) ( ON ?auto_51844 ?auto_51843 ) ( CLEAR ?auto_51844 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51849 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51849 ?auto_51843 )
      ( MAKE-5PILE ?auto_51843 ?auto_51844 ?auto_51845 ?auto_51846 ?auto_51847 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51850 - BLOCK
      ?auto_51851 - BLOCK
      ?auto_51852 - BLOCK
      ?auto_51853 - BLOCK
      ?auto_51854 - BLOCK
    )
    :vars
    (
      ?auto_51856 - BLOCK
      ?auto_51855 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51850 ?auto_51851 ) ) ( not ( = ?auto_51850 ?auto_51852 ) ) ( not ( = ?auto_51850 ?auto_51853 ) ) ( not ( = ?auto_51850 ?auto_51854 ) ) ( not ( = ?auto_51851 ?auto_51852 ) ) ( not ( = ?auto_51851 ?auto_51853 ) ) ( not ( = ?auto_51851 ?auto_51854 ) ) ( not ( = ?auto_51852 ?auto_51853 ) ) ( not ( = ?auto_51852 ?auto_51854 ) ) ( not ( = ?auto_51853 ?auto_51854 ) ) ( ON ?auto_51854 ?auto_51856 ) ( not ( = ?auto_51850 ?auto_51856 ) ) ( not ( = ?auto_51851 ?auto_51856 ) ) ( not ( = ?auto_51852 ?auto_51856 ) ) ( not ( = ?auto_51853 ?auto_51856 ) ) ( not ( = ?auto_51854 ?auto_51856 ) ) ( ON ?auto_51853 ?auto_51854 ) ( ON-TABLE ?auto_51856 ) ( ON ?auto_51850 ?auto_51855 ) ( not ( = ?auto_51850 ?auto_51855 ) ) ( not ( = ?auto_51851 ?auto_51855 ) ) ( not ( = ?auto_51852 ?auto_51855 ) ) ( not ( = ?auto_51853 ?auto_51855 ) ) ( not ( = ?auto_51854 ?auto_51855 ) ) ( not ( = ?auto_51856 ?auto_51855 ) ) ( ON ?auto_51851 ?auto_51850 ) ( CLEAR ?auto_51851 ) ( ON-TABLE ?auto_51855 ) ( HOLDING ?auto_51852 ) ( CLEAR ?auto_51853 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51856 ?auto_51854 ?auto_51853 ?auto_51852 )
      ( MAKE-5PILE ?auto_51850 ?auto_51851 ?auto_51852 ?auto_51853 ?auto_51854 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51857 - BLOCK
      ?auto_51858 - BLOCK
      ?auto_51859 - BLOCK
      ?auto_51860 - BLOCK
      ?auto_51861 - BLOCK
    )
    :vars
    (
      ?auto_51862 - BLOCK
      ?auto_51863 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51857 ?auto_51858 ) ) ( not ( = ?auto_51857 ?auto_51859 ) ) ( not ( = ?auto_51857 ?auto_51860 ) ) ( not ( = ?auto_51857 ?auto_51861 ) ) ( not ( = ?auto_51858 ?auto_51859 ) ) ( not ( = ?auto_51858 ?auto_51860 ) ) ( not ( = ?auto_51858 ?auto_51861 ) ) ( not ( = ?auto_51859 ?auto_51860 ) ) ( not ( = ?auto_51859 ?auto_51861 ) ) ( not ( = ?auto_51860 ?auto_51861 ) ) ( ON ?auto_51861 ?auto_51862 ) ( not ( = ?auto_51857 ?auto_51862 ) ) ( not ( = ?auto_51858 ?auto_51862 ) ) ( not ( = ?auto_51859 ?auto_51862 ) ) ( not ( = ?auto_51860 ?auto_51862 ) ) ( not ( = ?auto_51861 ?auto_51862 ) ) ( ON ?auto_51860 ?auto_51861 ) ( ON-TABLE ?auto_51862 ) ( ON ?auto_51857 ?auto_51863 ) ( not ( = ?auto_51857 ?auto_51863 ) ) ( not ( = ?auto_51858 ?auto_51863 ) ) ( not ( = ?auto_51859 ?auto_51863 ) ) ( not ( = ?auto_51860 ?auto_51863 ) ) ( not ( = ?auto_51861 ?auto_51863 ) ) ( not ( = ?auto_51862 ?auto_51863 ) ) ( ON ?auto_51858 ?auto_51857 ) ( ON-TABLE ?auto_51863 ) ( CLEAR ?auto_51860 ) ( ON ?auto_51859 ?auto_51858 ) ( CLEAR ?auto_51859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51863 ?auto_51857 ?auto_51858 )
      ( MAKE-5PILE ?auto_51857 ?auto_51858 ?auto_51859 ?auto_51860 ?auto_51861 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51864 - BLOCK
      ?auto_51865 - BLOCK
      ?auto_51866 - BLOCK
      ?auto_51867 - BLOCK
      ?auto_51868 - BLOCK
    )
    :vars
    (
      ?auto_51870 - BLOCK
      ?auto_51869 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51864 ?auto_51865 ) ) ( not ( = ?auto_51864 ?auto_51866 ) ) ( not ( = ?auto_51864 ?auto_51867 ) ) ( not ( = ?auto_51864 ?auto_51868 ) ) ( not ( = ?auto_51865 ?auto_51866 ) ) ( not ( = ?auto_51865 ?auto_51867 ) ) ( not ( = ?auto_51865 ?auto_51868 ) ) ( not ( = ?auto_51866 ?auto_51867 ) ) ( not ( = ?auto_51866 ?auto_51868 ) ) ( not ( = ?auto_51867 ?auto_51868 ) ) ( ON ?auto_51868 ?auto_51870 ) ( not ( = ?auto_51864 ?auto_51870 ) ) ( not ( = ?auto_51865 ?auto_51870 ) ) ( not ( = ?auto_51866 ?auto_51870 ) ) ( not ( = ?auto_51867 ?auto_51870 ) ) ( not ( = ?auto_51868 ?auto_51870 ) ) ( ON-TABLE ?auto_51870 ) ( ON ?auto_51864 ?auto_51869 ) ( not ( = ?auto_51864 ?auto_51869 ) ) ( not ( = ?auto_51865 ?auto_51869 ) ) ( not ( = ?auto_51866 ?auto_51869 ) ) ( not ( = ?auto_51867 ?auto_51869 ) ) ( not ( = ?auto_51868 ?auto_51869 ) ) ( not ( = ?auto_51870 ?auto_51869 ) ) ( ON ?auto_51865 ?auto_51864 ) ( ON-TABLE ?auto_51869 ) ( ON ?auto_51866 ?auto_51865 ) ( CLEAR ?auto_51866 ) ( HOLDING ?auto_51867 ) ( CLEAR ?auto_51868 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51870 ?auto_51868 ?auto_51867 )
      ( MAKE-5PILE ?auto_51864 ?auto_51865 ?auto_51866 ?auto_51867 ?auto_51868 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51871 - BLOCK
      ?auto_51872 - BLOCK
      ?auto_51873 - BLOCK
      ?auto_51874 - BLOCK
      ?auto_51875 - BLOCK
    )
    :vars
    (
      ?auto_51877 - BLOCK
      ?auto_51876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51871 ?auto_51872 ) ) ( not ( = ?auto_51871 ?auto_51873 ) ) ( not ( = ?auto_51871 ?auto_51874 ) ) ( not ( = ?auto_51871 ?auto_51875 ) ) ( not ( = ?auto_51872 ?auto_51873 ) ) ( not ( = ?auto_51872 ?auto_51874 ) ) ( not ( = ?auto_51872 ?auto_51875 ) ) ( not ( = ?auto_51873 ?auto_51874 ) ) ( not ( = ?auto_51873 ?auto_51875 ) ) ( not ( = ?auto_51874 ?auto_51875 ) ) ( ON ?auto_51875 ?auto_51877 ) ( not ( = ?auto_51871 ?auto_51877 ) ) ( not ( = ?auto_51872 ?auto_51877 ) ) ( not ( = ?auto_51873 ?auto_51877 ) ) ( not ( = ?auto_51874 ?auto_51877 ) ) ( not ( = ?auto_51875 ?auto_51877 ) ) ( ON-TABLE ?auto_51877 ) ( ON ?auto_51871 ?auto_51876 ) ( not ( = ?auto_51871 ?auto_51876 ) ) ( not ( = ?auto_51872 ?auto_51876 ) ) ( not ( = ?auto_51873 ?auto_51876 ) ) ( not ( = ?auto_51874 ?auto_51876 ) ) ( not ( = ?auto_51875 ?auto_51876 ) ) ( not ( = ?auto_51877 ?auto_51876 ) ) ( ON ?auto_51872 ?auto_51871 ) ( ON-TABLE ?auto_51876 ) ( ON ?auto_51873 ?auto_51872 ) ( CLEAR ?auto_51875 ) ( ON ?auto_51874 ?auto_51873 ) ( CLEAR ?auto_51874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51876 ?auto_51871 ?auto_51872 ?auto_51873 )
      ( MAKE-5PILE ?auto_51871 ?auto_51872 ?auto_51873 ?auto_51874 ?auto_51875 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51878 - BLOCK
      ?auto_51879 - BLOCK
      ?auto_51880 - BLOCK
      ?auto_51881 - BLOCK
      ?auto_51882 - BLOCK
    )
    :vars
    (
      ?auto_51884 - BLOCK
      ?auto_51883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51878 ?auto_51879 ) ) ( not ( = ?auto_51878 ?auto_51880 ) ) ( not ( = ?auto_51878 ?auto_51881 ) ) ( not ( = ?auto_51878 ?auto_51882 ) ) ( not ( = ?auto_51879 ?auto_51880 ) ) ( not ( = ?auto_51879 ?auto_51881 ) ) ( not ( = ?auto_51879 ?auto_51882 ) ) ( not ( = ?auto_51880 ?auto_51881 ) ) ( not ( = ?auto_51880 ?auto_51882 ) ) ( not ( = ?auto_51881 ?auto_51882 ) ) ( not ( = ?auto_51878 ?auto_51884 ) ) ( not ( = ?auto_51879 ?auto_51884 ) ) ( not ( = ?auto_51880 ?auto_51884 ) ) ( not ( = ?auto_51881 ?auto_51884 ) ) ( not ( = ?auto_51882 ?auto_51884 ) ) ( ON-TABLE ?auto_51884 ) ( ON ?auto_51878 ?auto_51883 ) ( not ( = ?auto_51878 ?auto_51883 ) ) ( not ( = ?auto_51879 ?auto_51883 ) ) ( not ( = ?auto_51880 ?auto_51883 ) ) ( not ( = ?auto_51881 ?auto_51883 ) ) ( not ( = ?auto_51882 ?auto_51883 ) ) ( not ( = ?auto_51884 ?auto_51883 ) ) ( ON ?auto_51879 ?auto_51878 ) ( ON-TABLE ?auto_51883 ) ( ON ?auto_51880 ?auto_51879 ) ( ON ?auto_51881 ?auto_51880 ) ( CLEAR ?auto_51881 ) ( HOLDING ?auto_51882 ) ( CLEAR ?auto_51884 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51884 ?auto_51882 )
      ( MAKE-5PILE ?auto_51878 ?auto_51879 ?auto_51880 ?auto_51881 ?auto_51882 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51885 - BLOCK
      ?auto_51886 - BLOCK
      ?auto_51887 - BLOCK
      ?auto_51888 - BLOCK
      ?auto_51889 - BLOCK
    )
    :vars
    (
      ?auto_51890 - BLOCK
      ?auto_51891 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51885 ?auto_51886 ) ) ( not ( = ?auto_51885 ?auto_51887 ) ) ( not ( = ?auto_51885 ?auto_51888 ) ) ( not ( = ?auto_51885 ?auto_51889 ) ) ( not ( = ?auto_51886 ?auto_51887 ) ) ( not ( = ?auto_51886 ?auto_51888 ) ) ( not ( = ?auto_51886 ?auto_51889 ) ) ( not ( = ?auto_51887 ?auto_51888 ) ) ( not ( = ?auto_51887 ?auto_51889 ) ) ( not ( = ?auto_51888 ?auto_51889 ) ) ( not ( = ?auto_51885 ?auto_51890 ) ) ( not ( = ?auto_51886 ?auto_51890 ) ) ( not ( = ?auto_51887 ?auto_51890 ) ) ( not ( = ?auto_51888 ?auto_51890 ) ) ( not ( = ?auto_51889 ?auto_51890 ) ) ( ON-TABLE ?auto_51890 ) ( ON ?auto_51885 ?auto_51891 ) ( not ( = ?auto_51885 ?auto_51891 ) ) ( not ( = ?auto_51886 ?auto_51891 ) ) ( not ( = ?auto_51887 ?auto_51891 ) ) ( not ( = ?auto_51888 ?auto_51891 ) ) ( not ( = ?auto_51889 ?auto_51891 ) ) ( not ( = ?auto_51890 ?auto_51891 ) ) ( ON ?auto_51886 ?auto_51885 ) ( ON-TABLE ?auto_51891 ) ( ON ?auto_51887 ?auto_51886 ) ( ON ?auto_51888 ?auto_51887 ) ( CLEAR ?auto_51890 ) ( ON ?auto_51889 ?auto_51888 ) ( CLEAR ?auto_51889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51891 ?auto_51885 ?auto_51886 ?auto_51887 ?auto_51888 )
      ( MAKE-5PILE ?auto_51885 ?auto_51886 ?auto_51887 ?auto_51888 ?auto_51889 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51892 - BLOCK
      ?auto_51893 - BLOCK
      ?auto_51894 - BLOCK
      ?auto_51895 - BLOCK
      ?auto_51896 - BLOCK
    )
    :vars
    (
      ?auto_51897 - BLOCK
      ?auto_51898 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51892 ?auto_51893 ) ) ( not ( = ?auto_51892 ?auto_51894 ) ) ( not ( = ?auto_51892 ?auto_51895 ) ) ( not ( = ?auto_51892 ?auto_51896 ) ) ( not ( = ?auto_51893 ?auto_51894 ) ) ( not ( = ?auto_51893 ?auto_51895 ) ) ( not ( = ?auto_51893 ?auto_51896 ) ) ( not ( = ?auto_51894 ?auto_51895 ) ) ( not ( = ?auto_51894 ?auto_51896 ) ) ( not ( = ?auto_51895 ?auto_51896 ) ) ( not ( = ?auto_51892 ?auto_51897 ) ) ( not ( = ?auto_51893 ?auto_51897 ) ) ( not ( = ?auto_51894 ?auto_51897 ) ) ( not ( = ?auto_51895 ?auto_51897 ) ) ( not ( = ?auto_51896 ?auto_51897 ) ) ( ON ?auto_51892 ?auto_51898 ) ( not ( = ?auto_51892 ?auto_51898 ) ) ( not ( = ?auto_51893 ?auto_51898 ) ) ( not ( = ?auto_51894 ?auto_51898 ) ) ( not ( = ?auto_51895 ?auto_51898 ) ) ( not ( = ?auto_51896 ?auto_51898 ) ) ( not ( = ?auto_51897 ?auto_51898 ) ) ( ON ?auto_51893 ?auto_51892 ) ( ON-TABLE ?auto_51898 ) ( ON ?auto_51894 ?auto_51893 ) ( ON ?auto_51895 ?auto_51894 ) ( ON ?auto_51896 ?auto_51895 ) ( CLEAR ?auto_51896 ) ( HOLDING ?auto_51897 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51897 )
      ( MAKE-5PILE ?auto_51892 ?auto_51893 ?auto_51894 ?auto_51895 ?auto_51896 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51899 - BLOCK
      ?auto_51900 - BLOCK
      ?auto_51901 - BLOCK
      ?auto_51902 - BLOCK
      ?auto_51903 - BLOCK
    )
    :vars
    (
      ?auto_51904 - BLOCK
      ?auto_51905 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51899 ?auto_51900 ) ) ( not ( = ?auto_51899 ?auto_51901 ) ) ( not ( = ?auto_51899 ?auto_51902 ) ) ( not ( = ?auto_51899 ?auto_51903 ) ) ( not ( = ?auto_51900 ?auto_51901 ) ) ( not ( = ?auto_51900 ?auto_51902 ) ) ( not ( = ?auto_51900 ?auto_51903 ) ) ( not ( = ?auto_51901 ?auto_51902 ) ) ( not ( = ?auto_51901 ?auto_51903 ) ) ( not ( = ?auto_51902 ?auto_51903 ) ) ( not ( = ?auto_51899 ?auto_51904 ) ) ( not ( = ?auto_51900 ?auto_51904 ) ) ( not ( = ?auto_51901 ?auto_51904 ) ) ( not ( = ?auto_51902 ?auto_51904 ) ) ( not ( = ?auto_51903 ?auto_51904 ) ) ( ON ?auto_51899 ?auto_51905 ) ( not ( = ?auto_51899 ?auto_51905 ) ) ( not ( = ?auto_51900 ?auto_51905 ) ) ( not ( = ?auto_51901 ?auto_51905 ) ) ( not ( = ?auto_51902 ?auto_51905 ) ) ( not ( = ?auto_51903 ?auto_51905 ) ) ( not ( = ?auto_51904 ?auto_51905 ) ) ( ON ?auto_51900 ?auto_51899 ) ( ON-TABLE ?auto_51905 ) ( ON ?auto_51901 ?auto_51900 ) ( ON ?auto_51902 ?auto_51901 ) ( ON ?auto_51903 ?auto_51902 ) ( ON ?auto_51904 ?auto_51903 ) ( CLEAR ?auto_51904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_51905 ?auto_51899 ?auto_51900 ?auto_51901 ?auto_51902 ?auto_51903 )
      ( MAKE-5PILE ?auto_51899 ?auto_51900 ?auto_51901 ?auto_51902 ?auto_51903 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51918 - BLOCK
      ?auto_51919 - BLOCK
      ?auto_51920 - BLOCK
      ?auto_51921 - BLOCK
      ?auto_51922 - BLOCK
      ?auto_51923 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_51922 ) ( ON-TABLE ?auto_51918 ) ( ON ?auto_51919 ?auto_51918 ) ( ON ?auto_51920 ?auto_51919 ) ( ON ?auto_51921 ?auto_51920 ) ( ON ?auto_51922 ?auto_51921 ) ( not ( = ?auto_51918 ?auto_51919 ) ) ( not ( = ?auto_51918 ?auto_51920 ) ) ( not ( = ?auto_51918 ?auto_51921 ) ) ( not ( = ?auto_51918 ?auto_51922 ) ) ( not ( = ?auto_51918 ?auto_51923 ) ) ( not ( = ?auto_51919 ?auto_51920 ) ) ( not ( = ?auto_51919 ?auto_51921 ) ) ( not ( = ?auto_51919 ?auto_51922 ) ) ( not ( = ?auto_51919 ?auto_51923 ) ) ( not ( = ?auto_51920 ?auto_51921 ) ) ( not ( = ?auto_51920 ?auto_51922 ) ) ( not ( = ?auto_51920 ?auto_51923 ) ) ( not ( = ?auto_51921 ?auto_51922 ) ) ( not ( = ?auto_51921 ?auto_51923 ) ) ( not ( = ?auto_51922 ?auto_51923 ) ) ( ON-TABLE ?auto_51923 ) ( CLEAR ?auto_51923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_51923 )
      ( MAKE-6PILE ?auto_51918 ?auto_51919 ?auto_51920 ?auto_51921 ?auto_51922 ?auto_51923 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51924 - BLOCK
      ?auto_51925 - BLOCK
      ?auto_51926 - BLOCK
      ?auto_51927 - BLOCK
      ?auto_51928 - BLOCK
      ?auto_51929 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51924 ) ( ON ?auto_51925 ?auto_51924 ) ( ON ?auto_51926 ?auto_51925 ) ( ON ?auto_51927 ?auto_51926 ) ( not ( = ?auto_51924 ?auto_51925 ) ) ( not ( = ?auto_51924 ?auto_51926 ) ) ( not ( = ?auto_51924 ?auto_51927 ) ) ( not ( = ?auto_51924 ?auto_51928 ) ) ( not ( = ?auto_51924 ?auto_51929 ) ) ( not ( = ?auto_51925 ?auto_51926 ) ) ( not ( = ?auto_51925 ?auto_51927 ) ) ( not ( = ?auto_51925 ?auto_51928 ) ) ( not ( = ?auto_51925 ?auto_51929 ) ) ( not ( = ?auto_51926 ?auto_51927 ) ) ( not ( = ?auto_51926 ?auto_51928 ) ) ( not ( = ?auto_51926 ?auto_51929 ) ) ( not ( = ?auto_51927 ?auto_51928 ) ) ( not ( = ?auto_51927 ?auto_51929 ) ) ( not ( = ?auto_51928 ?auto_51929 ) ) ( ON-TABLE ?auto_51929 ) ( CLEAR ?auto_51929 ) ( HOLDING ?auto_51928 ) ( CLEAR ?auto_51927 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51924 ?auto_51925 ?auto_51926 ?auto_51927 ?auto_51928 )
      ( MAKE-6PILE ?auto_51924 ?auto_51925 ?auto_51926 ?auto_51927 ?auto_51928 ?auto_51929 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51930 - BLOCK
      ?auto_51931 - BLOCK
      ?auto_51932 - BLOCK
      ?auto_51933 - BLOCK
      ?auto_51934 - BLOCK
      ?auto_51935 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51930 ) ( ON ?auto_51931 ?auto_51930 ) ( ON ?auto_51932 ?auto_51931 ) ( ON ?auto_51933 ?auto_51932 ) ( not ( = ?auto_51930 ?auto_51931 ) ) ( not ( = ?auto_51930 ?auto_51932 ) ) ( not ( = ?auto_51930 ?auto_51933 ) ) ( not ( = ?auto_51930 ?auto_51934 ) ) ( not ( = ?auto_51930 ?auto_51935 ) ) ( not ( = ?auto_51931 ?auto_51932 ) ) ( not ( = ?auto_51931 ?auto_51933 ) ) ( not ( = ?auto_51931 ?auto_51934 ) ) ( not ( = ?auto_51931 ?auto_51935 ) ) ( not ( = ?auto_51932 ?auto_51933 ) ) ( not ( = ?auto_51932 ?auto_51934 ) ) ( not ( = ?auto_51932 ?auto_51935 ) ) ( not ( = ?auto_51933 ?auto_51934 ) ) ( not ( = ?auto_51933 ?auto_51935 ) ) ( not ( = ?auto_51934 ?auto_51935 ) ) ( ON-TABLE ?auto_51935 ) ( CLEAR ?auto_51933 ) ( ON ?auto_51934 ?auto_51935 ) ( CLEAR ?auto_51934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51935 )
      ( MAKE-6PILE ?auto_51930 ?auto_51931 ?auto_51932 ?auto_51933 ?auto_51934 ?auto_51935 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51936 - BLOCK
      ?auto_51937 - BLOCK
      ?auto_51938 - BLOCK
      ?auto_51939 - BLOCK
      ?auto_51940 - BLOCK
      ?auto_51941 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51936 ) ( ON ?auto_51937 ?auto_51936 ) ( ON ?auto_51938 ?auto_51937 ) ( not ( = ?auto_51936 ?auto_51937 ) ) ( not ( = ?auto_51936 ?auto_51938 ) ) ( not ( = ?auto_51936 ?auto_51939 ) ) ( not ( = ?auto_51936 ?auto_51940 ) ) ( not ( = ?auto_51936 ?auto_51941 ) ) ( not ( = ?auto_51937 ?auto_51938 ) ) ( not ( = ?auto_51937 ?auto_51939 ) ) ( not ( = ?auto_51937 ?auto_51940 ) ) ( not ( = ?auto_51937 ?auto_51941 ) ) ( not ( = ?auto_51938 ?auto_51939 ) ) ( not ( = ?auto_51938 ?auto_51940 ) ) ( not ( = ?auto_51938 ?auto_51941 ) ) ( not ( = ?auto_51939 ?auto_51940 ) ) ( not ( = ?auto_51939 ?auto_51941 ) ) ( not ( = ?auto_51940 ?auto_51941 ) ) ( ON-TABLE ?auto_51941 ) ( ON ?auto_51940 ?auto_51941 ) ( CLEAR ?auto_51940 ) ( HOLDING ?auto_51939 ) ( CLEAR ?auto_51938 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51936 ?auto_51937 ?auto_51938 ?auto_51939 )
      ( MAKE-6PILE ?auto_51936 ?auto_51937 ?auto_51938 ?auto_51939 ?auto_51940 ?auto_51941 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51942 - BLOCK
      ?auto_51943 - BLOCK
      ?auto_51944 - BLOCK
      ?auto_51945 - BLOCK
      ?auto_51946 - BLOCK
      ?auto_51947 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51942 ) ( ON ?auto_51943 ?auto_51942 ) ( ON ?auto_51944 ?auto_51943 ) ( not ( = ?auto_51942 ?auto_51943 ) ) ( not ( = ?auto_51942 ?auto_51944 ) ) ( not ( = ?auto_51942 ?auto_51945 ) ) ( not ( = ?auto_51942 ?auto_51946 ) ) ( not ( = ?auto_51942 ?auto_51947 ) ) ( not ( = ?auto_51943 ?auto_51944 ) ) ( not ( = ?auto_51943 ?auto_51945 ) ) ( not ( = ?auto_51943 ?auto_51946 ) ) ( not ( = ?auto_51943 ?auto_51947 ) ) ( not ( = ?auto_51944 ?auto_51945 ) ) ( not ( = ?auto_51944 ?auto_51946 ) ) ( not ( = ?auto_51944 ?auto_51947 ) ) ( not ( = ?auto_51945 ?auto_51946 ) ) ( not ( = ?auto_51945 ?auto_51947 ) ) ( not ( = ?auto_51946 ?auto_51947 ) ) ( ON-TABLE ?auto_51947 ) ( ON ?auto_51946 ?auto_51947 ) ( CLEAR ?auto_51944 ) ( ON ?auto_51945 ?auto_51946 ) ( CLEAR ?auto_51945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51947 ?auto_51946 )
      ( MAKE-6PILE ?auto_51942 ?auto_51943 ?auto_51944 ?auto_51945 ?auto_51946 ?auto_51947 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51948 - BLOCK
      ?auto_51949 - BLOCK
      ?auto_51950 - BLOCK
      ?auto_51951 - BLOCK
      ?auto_51952 - BLOCK
      ?auto_51953 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51948 ) ( ON ?auto_51949 ?auto_51948 ) ( not ( = ?auto_51948 ?auto_51949 ) ) ( not ( = ?auto_51948 ?auto_51950 ) ) ( not ( = ?auto_51948 ?auto_51951 ) ) ( not ( = ?auto_51948 ?auto_51952 ) ) ( not ( = ?auto_51948 ?auto_51953 ) ) ( not ( = ?auto_51949 ?auto_51950 ) ) ( not ( = ?auto_51949 ?auto_51951 ) ) ( not ( = ?auto_51949 ?auto_51952 ) ) ( not ( = ?auto_51949 ?auto_51953 ) ) ( not ( = ?auto_51950 ?auto_51951 ) ) ( not ( = ?auto_51950 ?auto_51952 ) ) ( not ( = ?auto_51950 ?auto_51953 ) ) ( not ( = ?auto_51951 ?auto_51952 ) ) ( not ( = ?auto_51951 ?auto_51953 ) ) ( not ( = ?auto_51952 ?auto_51953 ) ) ( ON-TABLE ?auto_51953 ) ( ON ?auto_51952 ?auto_51953 ) ( ON ?auto_51951 ?auto_51952 ) ( CLEAR ?auto_51951 ) ( HOLDING ?auto_51950 ) ( CLEAR ?auto_51949 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51948 ?auto_51949 ?auto_51950 )
      ( MAKE-6PILE ?auto_51948 ?auto_51949 ?auto_51950 ?auto_51951 ?auto_51952 ?auto_51953 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51954 - BLOCK
      ?auto_51955 - BLOCK
      ?auto_51956 - BLOCK
      ?auto_51957 - BLOCK
      ?auto_51958 - BLOCK
      ?auto_51959 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51954 ) ( ON ?auto_51955 ?auto_51954 ) ( not ( = ?auto_51954 ?auto_51955 ) ) ( not ( = ?auto_51954 ?auto_51956 ) ) ( not ( = ?auto_51954 ?auto_51957 ) ) ( not ( = ?auto_51954 ?auto_51958 ) ) ( not ( = ?auto_51954 ?auto_51959 ) ) ( not ( = ?auto_51955 ?auto_51956 ) ) ( not ( = ?auto_51955 ?auto_51957 ) ) ( not ( = ?auto_51955 ?auto_51958 ) ) ( not ( = ?auto_51955 ?auto_51959 ) ) ( not ( = ?auto_51956 ?auto_51957 ) ) ( not ( = ?auto_51956 ?auto_51958 ) ) ( not ( = ?auto_51956 ?auto_51959 ) ) ( not ( = ?auto_51957 ?auto_51958 ) ) ( not ( = ?auto_51957 ?auto_51959 ) ) ( not ( = ?auto_51958 ?auto_51959 ) ) ( ON-TABLE ?auto_51959 ) ( ON ?auto_51958 ?auto_51959 ) ( ON ?auto_51957 ?auto_51958 ) ( CLEAR ?auto_51955 ) ( ON ?auto_51956 ?auto_51957 ) ( CLEAR ?auto_51956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51959 ?auto_51958 ?auto_51957 )
      ( MAKE-6PILE ?auto_51954 ?auto_51955 ?auto_51956 ?auto_51957 ?auto_51958 ?auto_51959 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51960 - BLOCK
      ?auto_51961 - BLOCK
      ?auto_51962 - BLOCK
      ?auto_51963 - BLOCK
      ?auto_51964 - BLOCK
      ?auto_51965 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51960 ) ( not ( = ?auto_51960 ?auto_51961 ) ) ( not ( = ?auto_51960 ?auto_51962 ) ) ( not ( = ?auto_51960 ?auto_51963 ) ) ( not ( = ?auto_51960 ?auto_51964 ) ) ( not ( = ?auto_51960 ?auto_51965 ) ) ( not ( = ?auto_51961 ?auto_51962 ) ) ( not ( = ?auto_51961 ?auto_51963 ) ) ( not ( = ?auto_51961 ?auto_51964 ) ) ( not ( = ?auto_51961 ?auto_51965 ) ) ( not ( = ?auto_51962 ?auto_51963 ) ) ( not ( = ?auto_51962 ?auto_51964 ) ) ( not ( = ?auto_51962 ?auto_51965 ) ) ( not ( = ?auto_51963 ?auto_51964 ) ) ( not ( = ?auto_51963 ?auto_51965 ) ) ( not ( = ?auto_51964 ?auto_51965 ) ) ( ON-TABLE ?auto_51965 ) ( ON ?auto_51964 ?auto_51965 ) ( ON ?auto_51963 ?auto_51964 ) ( ON ?auto_51962 ?auto_51963 ) ( CLEAR ?auto_51962 ) ( HOLDING ?auto_51961 ) ( CLEAR ?auto_51960 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51960 ?auto_51961 )
      ( MAKE-6PILE ?auto_51960 ?auto_51961 ?auto_51962 ?auto_51963 ?auto_51964 ?auto_51965 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51966 - BLOCK
      ?auto_51967 - BLOCK
      ?auto_51968 - BLOCK
      ?auto_51969 - BLOCK
      ?auto_51970 - BLOCK
      ?auto_51971 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51966 ) ( not ( = ?auto_51966 ?auto_51967 ) ) ( not ( = ?auto_51966 ?auto_51968 ) ) ( not ( = ?auto_51966 ?auto_51969 ) ) ( not ( = ?auto_51966 ?auto_51970 ) ) ( not ( = ?auto_51966 ?auto_51971 ) ) ( not ( = ?auto_51967 ?auto_51968 ) ) ( not ( = ?auto_51967 ?auto_51969 ) ) ( not ( = ?auto_51967 ?auto_51970 ) ) ( not ( = ?auto_51967 ?auto_51971 ) ) ( not ( = ?auto_51968 ?auto_51969 ) ) ( not ( = ?auto_51968 ?auto_51970 ) ) ( not ( = ?auto_51968 ?auto_51971 ) ) ( not ( = ?auto_51969 ?auto_51970 ) ) ( not ( = ?auto_51969 ?auto_51971 ) ) ( not ( = ?auto_51970 ?auto_51971 ) ) ( ON-TABLE ?auto_51971 ) ( ON ?auto_51970 ?auto_51971 ) ( ON ?auto_51969 ?auto_51970 ) ( ON ?auto_51968 ?auto_51969 ) ( CLEAR ?auto_51966 ) ( ON ?auto_51967 ?auto_51968 ) ( CLEAR ?auto_51967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51971 ?auto_51970 ?auto_51969 ?auto_51968 )
      ( MAKE-6PILE ?auto_51966 ?auto_51967 ?auto_51968 ?auto_51969 ?auto_51970 ?auto_51971 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51972 - BLOCK
      ?auto_51973 - BLOCK
      ?auto_51974 - BLOCK
      ?auto_51975 - BLOCK
      ?auto_51976 - BLOCK
      ?auto_51977 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51972 ?auto_51973 ) ) ( not ( = ?auto_51972 ?auto_51974 ) ) ( not ( = ?auto_51972 ?auto_51975 ) ) ( not ( = ?auto_51972 ?auto_51976 ) ) ( not ( = ?auto_51972 ?auto_51977 ) ) ( not ( = ?auto_51973 ?auto_51974 ) ) ( not ( = ?auto_51973 ?auto_51975 ) ) ( not ( = ?auto_51973 ?auto_51976 ) ) ( not ( = ?auto_51973 ?auto_51977 ) ) ( not ( = ?auto_51974 ?auto_51975 ) ) ( not ( = ?auto_51974 ?auto_51976 ) ) ( not ( = ?auto_51974 ?auto_51977 ) ) ( not ( = ?auto_51975 ?auto_51976 ) ) ( not ( = ?auto_51975 ?auto_51977 ) ) ( not ( = ?auto_51976 ?auto_51977 ) ) ( ON-TABLE ?auto_51977 ) ( ON ?auto_51976 ?auto_51977 ) ( ON ?auto_51975 ?auto_51976 ) ( ON ?auto_51974 ?auto_51975 ) ( ON ?auto_51973 ?auto_51974 ) ( CLEAR ?auto_51973 ) ( HOLDING ?auto_51972 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51972 )
      ( MAKE-6PILE ?auto_51972 ?auto_51973 ?auto_51974 ?auto_51975 ?auto_51976 ?auto_51977 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51978 - BLOCK
      ?auto_51979 - BLOCK
      ?auto_51980 - BLOCK
      ?auto_51981 - BLOCK
      ?auto_51982 - BLOCK
      ?auto_51983 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51978 ?auto_51979 ) ) ( not ( = ?auto_51978 ?auto_51980 ) ) ( not ( = ?auto_51978 ?auto_51981 ) ) ( not ( = ?auto_51978 ?auto_51982 ) ) ( not ( = ?auto_51978 ?auto_51983 ) ) ( not ( = ?auto_51979 ?auto_51980 ) ) ( not ( = ?auto_51979 ?auto_51981 ) ) ( not ( = ?auto_51979 ?auto_51982 ) ) ( not ( = ?auto_51979 ?auto_51983 ) ) ( not ( = ?auto_51980 ?auto_51981 ) ) ( not ( = ?auto_51980 ?auto_51982 ) ) ( not ( = ?auto_51980 ?auto_51983 ) ) ( not ( = ?auto_51981 ?auto_51982 ) ) ( not ( = ?auto_51981 ?auto_51983 ) ) ( not ( = ?auto_51982 ?auto_51983 ) ) ( ON-TABLE ?auto_51983 ) ( ON ?auto_51982 ?auto_51983 ) ( ON ?auto_51981 ?auto_51982 ) ( ON ?auto_51980 ?auto_51981 ) ( ON ?auto_51979 ?auto_51980 ) ( ON ?auto_51978 ?auto_51979 ) ( CLEAR ?auto_51978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51983 ?auto_51982 ?auto_51981 ?auto_51980 ?auto_51979 )
      ( MAKE-6PILE ?auto_51978 ?auto_51979 ?auto_51980 ?auto_51981 ?auto_51982 ?auto_51983 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51990 - BLOCK
      ?auto_51991 - BLOCK
      ?auto_51992 - BLOCK
      ?auto_51993 - BLOCK
      ?auto_51994 - BLOCK
      ?auto_51995 - BLOCK
    )
    :vars
    (
      ?auto_51996 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51990 ?auto_51991 ) ) ( not ( = ?auto_51990 ?auto_51992 ) ) ( not ( = ?auto_51990 ?auto_51993 ) ) ( not ( = ?auto_51990 ?auto_51994 ) ) ( not ( = ?auto_51990 ?auto_51995 ) ) ( not ( = ?auto_51991 ?auto_51992 ) ) ( not ( = ?auto_51991 ?auto_51993 ) ) ( not ( = ?auto_51991 ?auto_51994 ) ) ( not ( = ?auto_51991 ?auto_51995 ) ) ( not ( = ?auto_51992 ?auto_51993 ) ) ( not ( = ?auto_51992 ?auto_51994 ) ) ( not ( = ?auto_51992 ?auto_51995 ) ) ( not ( = ?auto_51993 ?auto_51994 ) ) ( not ( = ?auto_51993 ?auto_51995 ) ) ( not ( = ?auto_51994 ?auto_51995 ) ) ( ON-TABLE ?auto_51995 ) ( ON ?auto_51994 ?auto_51995 ) ( ON ?auto_51993 ?auto_51994 ) ( ON ?auto_51992 ?auto_51993 ) ( ON ?auto_51991 ?auto_51992 ) ( CLEAR ?auto_51991 ) ( ON ?auto_51990 ?auto_51996 ) ( CLEAR ?auto_51990 ) ( HAND-EMPTY ) ( not ( = ?auto_51990 ?auto_51996 ) ) ( not ( = ?auto_51991 ?auto_51996 ) ) ( not ( = ?auto_51992 ?auto_51996 ) ) ( not ( = ?auto_51993 ?auto_51996 ) ) ( not ( = ?auto_51994 ?auto_51996 ) ) ( not ( = ?auto_51995 ?auto_51996 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51990 ?auto_51996 )
      ( MAKE-6PILE ?auto_51990 ?auto_51991 ?auto_51992 ?auto_51993 ?auto_51994 ?auto_51995 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51997 - BLOCK
      ?auto_51998 - BLOCK
      ?auto_51999 - BLOCK
      ?auto_52000 - BLOCK
      ?auto_52001 - BLOCK
      ?auto_52002 - BLOCK
    )
    :vars
    (
      ?auto_52003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51997 ?auto_51998 ) ) ( not ( = ?auto_51997 ?auto_51999 ) ) ( not ( = ?auto_51997 ?auto_52000 ) ) ( not ( = ?auto_51997 ?auto_52001 ) ) ( not ( = ?auto_51997 ?auto_52002 ) ) ( not ( = ?auto_51998 ?auto_51999 ) ) ( not ( = ?auto_51998 ?auto_52000 ) ) ( not ( = ?auto_51998 ?auto_52001 ) ) ( not ( = ?auto_51998 ?auto_52002 ) ) ( not ( = ?auto_51999 ?auto_52000 ) ) ( not ( = ?auto_51999 ?auto_52001 ) ) ( not ( = ?auto_51999 ?auto_52002 ) ) ( not ( = ?auto_52000 ?auto_52001 ) ) ( not ( = ?auto_52000 ?auto_52002 ) ) ( not ( = ?auto_52001 ?auto_52002 ) ) ( ON-TABLE ?auto_52002 ) ( ON ?auto_52001 ?auto_52002 ) ( ON ?auto_52000 ?auto_52001 ) ( ON ?auto_51999 ?auto_52000 ) ( ON ?auto_51997 ?auto_52003 ) ( CLEAR ?auto_51997 ) ( not ( = ?auto_51997 ?auto_52003 ) ) ( not ( = ?auto_51998 ?auto_52003 ) ) ( not ( = ?auto_51999 ?auto_52003 ) ) ( not ( = ?auto_52000 ?auto_52003 ) ) ( not ( = ?auto_52001 ?auto_52003 ) ) ( not ( = ?auto_52002 ?auto_52003 ) ) ( HOLDING ?auto_51998 ) ( CLEAR ?auto_51999 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52002 ?auto_52001 ?auto_52000 ?auto_51999 ?auto_51998 )
      ( MAKE-6PILE ?auto_51997 ?auto_51998 ?auto_51999 ?auto_52000 ?auto_52001 ?auto_52002 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52004 - BLOCK
      ?auto_52005 - BLOCK
      ?auto_52006 - BLOCK
      ?auto_52007 - BLOCK
      ?auto_52008 - BLOCK
      ?auto_52009 - BLOCK
    )
    :vars
    (
      ?auto_52010 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52004 ?auto_52005 ) ) ( not ( = ?auto_52004 ?auto_52006 ) ) ( not ( = ?auto_52004 ?auto_52007 ) ) ( not ( = ?auto_52004 ?auto_52008 ) ) ( not ( = ?auto_52004 ?auto_52009 ) ) ( not ( = ?auto_52005 ?auto_52006 ) ) ( not ( = ?auto_52005 ?auto_52007 ) ) ( not ( = ?auto_52005 ?auto_52008 ) ) ( not ( = ?auto_52005 ?auto_52009 ) ) ( not ( = ?auto_52006 ?auto_52007 ) ) ( not ( = ?auto_52006 ?auto_52008 ) ) ( not ( = ?auto_52006 ?auto_52009 ) ) ( not ( = ?auto_52007 ?auto_52008 ) ) ( not ( = ?auto_52007 ?auto_52009 ) ) ( not ( = ?auto_52008 ?auto_52009 ) ) ( ON-TABLE ?auto_52009 ) ( ON ?auto_52008 ?auto_52009 ) ( ON ?auto_52007 ?auto_52008 ) ( ON ?auto_52006 ?auto_52007 ) ( ON ?auto_52004 ?auto_52010 ) ( not ( = ?auto_52004 ?auto_52010 ) ) ( not ( = ?auto_52005 ?auto_52010 ) ) ( not ( = ?auto_52006 ?auto_52010 ) ) ( not ( = ?auto_52007 ?auto_52010 ) ) ( not ( = ?auto_52008 ?auto_52010 ) ) ( not ( = ?auto_52009 ?auto_52010 ) ) ( CLEAR ?auto_52006 ) ( ON ?auto_52005 ?auto_52004 ) ( CLEAR ?auto_52005 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52010 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52010 ?auto_52004 )
      ( MAKE-6PILE ?auto_52004 ?auto_52005 ?auto_52006 ?auto_52007 ?auto_52008 ?auto_52009 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52011 - BLOCK
      ?auto_52012 - BLOCK
      ?auto_52013 - BLOCK
      ?auto_52014 - BLOCK
      ?auto_52015 - BLOCK
      ?auto_52016 - BLOCK
    )
    :vars
    (
      ?auto_52017 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52011 ?auto_52012 ) ) ( not ( = ?auto_52011 ?auto_52013 ) ) ( not ( = ?auto_52011 ?auto_52014 ) ) ( not ( = ?auto_52011 ?auto_52015 ) ) ( not ( = ?auto_52011 ?auto_52016 ) ) ( not ( = ?auto_52012 ?auto_52013 ) ) ( not ( = ?auto_52012 ?auto_52014 ) ) ( not ( = ?auto_52012 ?auto_52015 ) ) ( not ( = ?auto_52012 ?auto_52016 ) ) ( not ( = ?auto_52013 ?auto_52014 ) ) ( not ( = ?auto_52013 ?auto_52015 ) ) ( not ( = ?auto_52013 ?auto_52016 ) ) ( not ( = ?auto_52014 ?auto_52015 ) ) ( not ( = ?auto_52014 ?auto_52016 ) ) ( not ( = ?auto_52015 ?auto_52016 ) ) ( ON-TABLE ?auto_52016 ) ( ON ?auto_52015 ?auto_52016 ) ( ON ?auto_52014 ?auto_52015 ) ( ON ?auto_52011 ?auto_52017 ) ( not ( = ?auto_52011 ?auto_52017 ) ) ( not ( = ?auto_52012 ?auto_52017 ) ) ( not ( = ?auto_52013 ?auto_52017 ) ) ( not ( = ?auto_52014 ?auto_52017 ) ) ( not ( = ?auto_52015 ?auto_52017 ) ) ( not ( = ?auto_52016 ?auto_52017 ) ) ( ON ?auto_52012 ?auto_52011 ) ( CLEAR ?auto_52012 ) ( ON-TABLE ?auto_52017 ) ( HOLDING ?auto_52013 ) ( CLEAR ?auto_52014 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52016 ?auto_52015 ?auto_52014 ?auto_52013 )
      ( MAKE-6PILE ?auto_52011 ?auto_52012 ?auto_52013 ?auto_52014 ?auto_52015 ?auto_52016 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52018 - BLOCK
      ?auto_52019 - BLOCK
      ?auto_52020 - BLOCK
      ?auto_52021 - BLOCK
      ?auto_52022 - BLOCK
      ?auto_52023 - BLOCK
    )
    :vars
    (
      ?auto_52024 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52018 ?auto_52019 ) ) ( not ( = ?auto_52018 ?auto_52020 ) ) ( not ( = ?auto_52018 ?auto_52021 ) ) ( not ( = ?auto_52018 ?auto_52022 ) ) ( not ( = ?auto_52018 ?auto_52023 ) ) ( not ( = ?auto_52019 ?auto_52020 ) ) ( not ( = ?auto_52019 ?auto_52021 ) ) ( not ( = ?auto_52019 ?auto_52022 ) ) ( not ( = ?auto_52019 ?auto_52023 ) ) ( not ( = ?auto_52020 ?auto_52021 ) ) ( not ( = ?auto_52020 ?auto_52022 ) ) ( not ( = ?auto_52020 ?auto_52023 ) ) ( not ( = ?auto_52021 ?auto_52022 ) ) ( not ( = ?auto_52021 ?auto_52023 ) ) ( not ( = ?auto_52022 ?auto_52023 ) ) ( ON-TABLE ?auto_52023 ) ( ON ?auto_52022 ?auto_52023 ) ( ON ?auto_52021 ?auto_52022 ) ( ON ?auto_52018 ?auto_52024 ) ( not ( = ?auto_52018 ?auto_52024 ) ) ( not ( = ?auto_52019 ?auto_52024 ) ) ( not ( = ?auto_52020 ?auto_52024 ) ) ( not ( = ?auto_52021 ?auto_52024 ) ) ( not ( = ?auto_52022 ?auto_52024 ) ) ( not ( = ?auto_52023 ?auto_52024 ) ) ( ON ?auto_52019 ?auto_52018 ) ( ON-TABLE ?auto_52024 ) ( CLEAR ?auto_52021 ) ( ON ?auto_52020 ?auto_52019 ) ( CLEAR ?auto_52020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52024 ?auto_52018 ?auto_52019 )
      ( MAKE-6PILE ?auto_52018 ?auto_52019 ?auto_52020 ?auto_52021 ?auto_52022 ?auto_52023 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52025 - BLOCK
      ?auto_52026 - BLOCK
      ?auto_52027 - BLOCK
      ?auto_52028 - BLOCK
      ?auto_52029 - BLOCK
      ?auto_52030 - BLOCK
    )
    :vars
    (
      ?auto_52031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52025 ?auto_52026 ) ) ( not ( = ?auto_52025 ?auto_52027 ) ) ( not ( = ?auto_52025 ?auto_52028 ) ) ( not ( = ?auto_52025 ?auto_52029 ) ) ( not ( = ?auto_52025 ?auto_52030 ) ) ( not ( = ?auto_52026 ?auto_52027 ) ) ( not ( = ?auto_52026 ?auto_52028 ) ) ( not ( = ?auto_52026 ?auto_52029 ) ) ( not ( = ?auto_52026 ?auto_52030 ) ) ( not ( = ?auto_52027 ?auto_52028 ) ) ( not ( = ?auto_52027 ?auto_52029 ) ) ( not ( = ?auto_52027 ?auto_52030 ) ) ( not ( = ?auto_52028 ?auto_52029 ) ) ( not ( = ?auto_52028 ?auto_52030 ) ) ( not ( = ?auto_52029 ?auto_52030 ) ) ( ON-TABLE ?auto_52030 ) ( ON ?auto_52029 ?auto_52030 ) ( ON ?auto_52025 ?auto_52031 ) ( not ( = ?auto_52025 ?auto_52031 ) ) ( not ( = ?auto_52026 ?auto_52031 ) ) ( not ( = ?auto_52027 ?auto_52031 ) ) ( not ( = ?auto_52028 ?auto_52031 ) ) ( not ( = ?auto_52029 ?auto_52031 ) ) ( not ( = ?auto_52030 ?auto_52031 ) ) ( ON ?auto_52026 ?auto_52025 ) ( ON-TABLE ?auto_52031 ) ( ON ?auto_52027 ?auto_52026 ) ( CLEAR ?auto_52027 ) ( HOLDING ?auto_52028 ) ( CLEAR ?auto_52029 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52030 ?auto_52029 ?auto_52028 )
      ( MAKE-6PILE ?auto_52025 ?auto_52026 ?auto_52027 ?auto_52028 ?auto_52029 ?auto_52030 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52032 - BLOCK
      ?auto_52033 - BLOCK
      ?auto_52034 - BLOCK
      ?auto_52035 - BLOCK
      ?auto_52036 - BLOCK
      ?auto_52037 - BLOCK
    )
    :vars
    (
      ?auto_52038 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52032 ?auto_52033 ) ) ( not ( = ?auto_52032 ?auto_52034 ) ) ( not ( = ?auto_52032 ?auto_52035 ) ) ( not ( = ?auto_52032 ?auto_52036 ) ) ( not ( = ?auto_52032 ?auto_52037 ) ) ( not ( = ?auto_52033 ?auto_52034 ) ) ( not ( = ?auto_52033 ?auto_52035 ) ) ( not ( = ?auto_52033 ?auto_52036 ) ) ( not ( = ?auto_52033 ?auto_52037 ) ) ( not ( = ?auto_52034 ?auto_52035 ) ) ( not ( = ?auto_52034 ?auto_52036 ) ) ( not ( = ?auto_52034 ?auto_52037 ) ) ( not ( = ?auto_52035 ?auto_52036 ) ) ( not ( = ?auto_52035 ?auto_52037 ) ) ( not ( = ?auto_52036 ?auto_52037 ) ) ( ON-TABLE ?auto_52037 ) ( ON ?auto_52036 ?auto_52037 ) ( ON ?auto_52032 ?auto_52038 ) ( not ( = ?auto_52032 ?auto_52038 ) ) ( not ( = ?auto_52033 ?auto_52038 ) ) ( not ( = ?auto_52034 ?auto_52038 ) ) ( not ( = ?auto_52035 ?auto_52038 ) ) ( not ( = ?auto_52036 ?auto_52038 ) ) ( not ( = ?auto_52037 ?auto_52038 ) ) ( ON ?auto_52033 ?auto_52032 ) ( ON-TABLE ?auto_52038 ) ( ON ?auto_52034 ?auto_52033 ) ( CLEAR ?auto_52036 ) ( ON ?auto_52035 ?auto_52034 ) ( CLEAR ?auto_52035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52038 ?auto_52032 ?auto_52033 ?auto_52034 )
      ( MAKE-6PILE ?auto_52032 ?auto_52033 ?auto_52034 ?auto_52035 ?auto_52036 ?auto_52037 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52039 - BLOCK
      ?auto_52040 - BLOCK
      ?auto_52041 - BLOCK
      ?auto_52042 - BLOCK
      ?auto_52043 - BLOCK
      ?auto_52044 - BLOCK
    )
    :vars
    (
      ?auto_52045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52039 ?auto_52040 ) ) ( not ( = ?auto_52039 ?auto_52041 ) ) ( not ( = ?auto_52039 ?auto_52042 ) ) ( not ( = ?auto_52039 ?auto_52043 ) ) ( not ( = ?auto_52039 ?auto_52044 ) ) ( not ( = ?auto_52040 ?auto_52041 ) ) ( not ( = ?auto_52040 ?auto_52042 ) ) ( not ( = ?auto_52040 ?auto_52043 ) ) ( not ( = ?auto_52040 ?auto_52044 ) ) ( not ( = ?auto_52041 ?auto_52042 ) ) ( not ( = ?auto_52041 ?auto_52043 ) ) ( not ( = ?auto_52041 ?auto_52044 ) ) ( not ( = ?auto_52042 ?auto_52043 ) ) ( not ( = ?auto_52042 ?auto_52044 ) ) ( not ( = ?auto_52043 ?auto_52044 ) ) ( ON-TABLE ?auto_52044 ) ( ON ?auto_52039 ?auto_52045 ) ( not ( = ?auto_52039 ?auto_52045 ) ) ( not ( = ?auto_52040 ?auto_52045 ) ) ( not ( = ?auto_52041 ?auto_52045 ) ) ( not ( = ?auto_52042 ?auto_52045 ) ) ( not ( = ?auto_52043 ?auto_52045 ) ) ( not ( = ?auto_52044 ?auto_52045 ) ) ( ON ?auto_52040 ?auto_52039 ) ( ON-TABLE ?auto_52045 ) ( ON ?auto_52041 ?auto_52040 ) ( ON ?auto_52042 ?auto_52041 ) ( CLEAR ?auto_52042 ) ( HOLDING ?auto_52043 ) ( CLEAR ?auto_52044 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52044 ?auto_52043 )
      ( MAKE-6PILE ?auto_52039 ?auto_52040 ?auto_52041 ?auto_52042 ?auto_52043 ?auto_52044 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52046 - BLOCK
      ?auto_52047 - BLOCK
      ?auto_52048 - BLOCK
      ?auto_52049 - BLOCK
      ?auto_52050 - BLOCK
      ?auto_52051 - BLOCK
    )
    :vars
    (
      ?auto_52052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52046 ?auto_52047 ) ) ( not ( = ?auto_52046 ?auto_52048 ) ) ( not ( = ?auto_52046 ?auto_52049 ) ) ( not ( = ?auto_52046 ?auto_52050 ) ) ( not ( = ?auto_52046 ?auto_52051 ) ) ( not ( = ?auto_52047 ?auto_52048 ) ) ( not ( = ?auto_52047 ?auto_52049 ) ) ( not ( = ?auto_52047 ?auto_52050 ) ) ( not ( = ?auto_52047 ?auto_52051 ) ) ( not ( = ?auto_52048 ?auto_52049 ) ) ( not ( = ?auto_52048 ?auto_52050 ) ) ( not ( = ?auto_52048 ?auto_52051 ) ) ( not ( = ?auto_52049 ?auto_52050 ) ) ( not ( = ?auto_52049 ?auto_52051 ) ) ( not ( = ?auto_52050 ?auto_52051 ) ) ( ON-TABLE ?auto_52051 ) ( ON ?auto_52046 ?auto_52052 ) ( not ( = ?auto_52046 ?auto_52052 ) ) ( not ( = ?auto_52047 ?auto_52052 ) ) ( not ( = ?auto_52048 ?auto_52052 ) ) ( not ( = ?auto_52049 ?auto_52052 ) ) ( not ( = ?auto_52050 ?auto_52052 ) ) ( not ( = ?auto_52051 ?auto_52052 ) ) ( ON ?auto_52047 ?auto_52046 ) ( ON-TABLE ?auto_52052 ) ( ON ?auto_52048 ?auto_52047 ) ( ON ?auto_52049 ?auto_52048 ) ( CLEAR ?auto_52051 ) ( ON ?auto_52050 ?auto_52049 ) ( CLEAR ?auto_52050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52052 ?auto_52046 ?auto_52047 ?auto_52048 ?auto_52049 )
      ( MAKE-6PILE ?auto_52046 ?auto_52047 ?auto_52048 ?auto_52049 ?auto_52050 ?auto_52051 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52053 - BLOCK
      ?auto_52054 - BLOCK
      ?auto_52055 - BLOCK
      ?auto_52056 - BLOCK
      ?auto_52057 - BLOCK
      ?auto_52058 - BLOCK
    )
    :vars
    (
      ?auto_52059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52053 ?auto_52054 ) ) ( not ( = ?auto_52053 ?auto_52055 ) ) ( not ( = ?auto_52053 ?auto_52056 ) ) ( not ( = ?auto_52053 ?auto_52057 ) ) ( not ( = ?auto_52053 ?auto_52058 ) ) ( not ( = ?auto_52054 ?auto_52055 ) ) ( not ( = ?auto_52054 ?auto_52056 ) ) ( not ( = ?auto_52054 ?auto_52057 ) ) ( not ( = ?auto_52054 ?auto_52058 ) ) ( not ( = ?auto_52055 ?auto_52056 ) ) ( not ( = ?auto_52055 ?auto_52057 ) ) ( not ( = ?auto_52055 ?auto_52058 ) ) ( not ( = ?auto_52056 ?auto_52057 ) ) ( not ( = ?auto_52056 ?auto_52058 ) ) ( not ( = ?auto_52057 ?auto_52058 ) ) ( ON ?auto_52053 ?auto_52059 ) ( not ( = ?auto_52053 ?auto_52059 ) ) ( not ( = ?auto_52054 ?auto_52059 ) ) ( not ( = ?auto_52055 ?auto_52059 ) ) ( not ( = ?auto_52056 ?auto_52059 ) ) ( not ( = ?auto_52057 ?auto_52059 ) ) ( not ( = ?auto_52058 ?auto_52059 ) ) ( ON ?auto_52054 ?auto_52053 ) ( ON-TABLE ?auto_52059 ) ( ON ?auto_52055 ?auto_52054 ) ( ON ?auto_52056 ?auto_52055 ) ( ON ?auto_52057 ?auto_52056 ) ( CLEAR ?auto_52057 ) ( HOLDING ?auto_52058 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52058 )
      ( MAKE-6PILE ?auto_52053 ?auto_52054 ?auto_52055 ?auto_52056 ?auto_52057 ?auto_52058 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52060 - BLOCK
      ?auto_52061 - BLOCK
      ?auto_52062 - BLOCK
      ?auto_52063 - BLOCK
      ?auto_52064 - BLOCK
      ?auto_52065 - BLOCK
    )
    :vars
    (
      ?auto_52066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52060 ?auto_52061 ) ) ( not ( = ?auto_52060 ?auto_52062 ) ) ( not ( = ?auto_52060 ?auto_52063 ) ) ( not ( = ?auto_52060 ?auto_52064 ) ) ( not ( = ?auto_52060 ?auto_52065 ) ) ( not ( = ?auto_52061 ?auto_52062 ) ) ( not ( = ?auto_52061 ?auto_52063 ) ) ( not ( = ?auto_52061 ?auto_52064 ) ) ( not ( = ?auto_52061 ?auto_52065 ) ) ( not ( = ?auto_52062 ?auto_52063 ) ) ( not ( = ?auto_52062 ?auto_52064 ) ) ( not ( = ?auto_52062 ?auto_52065 ) ) ( not ( = ?auto_52063 ?auto_52064 ) ) ( not ( = ?auto_52063 ?auto_52065 ) ) ( not ( = ?auto_52064 ?auto_52065 ) ) ( ON ?auto_52060 ?auto_52066 ) ( not ( = ?auto_52060 ?auto_52066 ) ) ( not ( = ?auto_52061 ?auto_52066 ) ) ( not ( = ?auto_52062 ?auto_52066 ) ) ( not ( = ?auto_52063 ?auto_52066 ) ) ( not ( = ?auto_52064 ?auto_52066 ) ) ( not ( = ?auto_52065 ?auto_52066 ) ) ( ON ?auto_52061 ?auto_52060 ) ( ON-TABLE ?auto_52066 ) ( ON ?auto_52062 ?auto_52061 ) ( ON ?auto_52063 ?auto_52062 ) ( ON ?auto_52064 ?auto_52063 ) ( ON ?auto_52065 ?auto_52064 ) ( CLEAR ?auto_52065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52066 ?auto_52060 ?auto_52061 ?auto_52062 ?auto_52063 ?auto_52064 )
      ( MAKE-6PILE ?auto_52060 ?auto_52061 ?auto_52062 ?auto_52063 ?auto_52064 ?auto_52065 ) )
  )

)

