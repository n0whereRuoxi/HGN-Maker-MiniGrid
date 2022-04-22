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
      ?auto_7481 - BLOCK
    )
    :vars
    (
      ?auto_7482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7481 ?auto_7482 ) ( CLEAR ?auto_7481 ) ( HAND-EMPTY ) ( not ( = ?auto_7481 ?auto_7482 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7481 ?auto_7482 )
      ( !PUTDOWN ?auto_7481 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7484 - BLOCK
    )
    :vars
    (
      ?auto_7485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7484 ?auto_7485 ) ( CLEAR ?auto_7484 ) ( HAND-EMPTY ) ( not ( = ?auto_7484 ?auto_7485 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7484 ?auto_7485 )
      ( !PUTDOWN ?auto_7484 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7488 - BLOCK
      ?auto_7489 - BLOCK
    )
    :vars
    (
      ?auto_7490 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7488 ) ( ON ?auto_7489 ?auto_7490 ) ( CLEAR ?auto_7489 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7488 ) ( not ( = ?auto_7488 ?auto_7489 ) ) ( not ( = ?auto_7488 ?auto_7490 ) ) ( not ( = ?auto_7489 ?auto_7490 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7489 ?auto_7490 )
      ( !STACK ?auto_7489 ?auto_7488 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7493 - BLOCK
      ?auto_7494 - BLOCK
    )
    :vars
    (
      ?auto_7495 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7493 ) ( ON ?auto_7494 ?auto_7495 ) ( CLEAR ?auto_7494 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7493 ) ( not ( = ?auto_7493 ?auto_7494 ) ) ( not ( = ?auto_7493 ?auto_7495 ) ) ( not ( = ?auto_7494 ?auto_7495 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7494 ?auto_7495 )
      ( !STACK ?auto_7494 ?auto_7493 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7498 - BLOCK
      ?auto_7499 - BLOCK
    )
    :vars
    (
      ?auto_7500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7499 ?auto_7500 ) ( not ( = ?auto_7498 ?auto_7499 ) ) ( not ( = ?auto_7498 ?auto_7500 ) ) ( not ( = ?auto_7499 ?auto_7500 ) ) ( ON ?auto_7498 ?auto_7499 ) ( CLEAR ?auto_7498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7498 )
      ( MAKE-2PILE ?auto_7498 ?auto_7499 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7503 - BLOCK
      ?auto_7504 - BLOCK
    )
    :vars
    (
      ?auto_7505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7504 ?auto_7505 ) ( not ( = ?auto_7503 ?auto_7504 ) ) ( not ( = ?auto_7503 ?auto_7505 ) ) ( not ( = ?auto_7504 ?auto_7505 ) ) ( ON ?auto_7503 ?auto_7504 ) ( CLEAR ?auto_7503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7503 )
      ( MAKE-2PILE ?auto_7503 ?auto_7504 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7509 - BLOCK
      ?auto_7510 - BLOCK
      ?auto_7511 - BLOCK
    )
    :vars
    (
      ?auto_7512 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7510 ) ( ON ?auto_7511 ?auto_7512 ) ( CLEAR ?auto_7511 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7509 ) ( ON ?auto_7510 ?auto_7509 ) ( not ( = ?auto_7509 ?auto_7510 ) ) ( not ( = ?auto_7509 ?auto_7511 ) ) ( not ( = ?auto_7509 ?auto_7512 ) ) ( not ( = ?auto_7510 ?auto_7511 ) ) ( not ( = ?auto_7510 ?auto_7512 ) ) ( not ( = ?auto_7511 ?auto_7512 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7511 ?auto_7512 )
      ( !STACK ?auto_7511 ?auto_7510 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7516 - BLOCK
      ?auto_7517 - BLOCK
      ?auto_7518 - BLOCK
    )
    :vars
    (
      ?auto_7519 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7517 ) ( ON ?auto_7518 ?auto_7519 ) ( CLEAR ?auto_7518 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7516 ) ( ON ?auto_7517 ?auto_7516 ) ( not ( = ?auto_7516 ?auto_7517 ) ) ( not ( = ?auto_7516 ?auto_7518 ) ) ( not ( = ?auto_7516 ?auto_7519 ) ) ( not ( = ?auto_7517 ?auto_7518 ) ) ( not ( = ?auto_7517 ?auto_7519 ) ) ( not ( = ?auto_7518 ?auto_7519 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7518 ?auto_7519 )
      ( !STACK ?auto_7518 ?auto_7517 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7523 - BLOCK
      ?auto_7524 - BLOCK
      ?auto_7525 - BLOCK
    )
    :vars
    (
      ?auto_7526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7525 ?auto_7526 ) ( ON-TABLE ?auto_7523 ) ( not ( = ?auto_7523 ?auto_7524 ) ) ( not ( = ?auto_7523 ?auto_7525 ) ) ( not ( = ?auto_7523 ?auto_7526 ) ) ( not ( = ?auto_7524 ?auto_7525 ) ) ( not ( = ?auto_7524 ?auto_7526 ) ) ( not ( = ?auto_7525 ?auto_7526 ) ) ( CLEAR ?auto_7523 ) ( ON ?auto_7524 ?auto_7525 ) ( CLEAR ?auto_7524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7523 ?auto_7524 )
      ( MAKE-3PILE ?auto_7523 ?auto_7524 ?auto_7525 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7530 - BLOCK
      ?auto_7531 - BLOCK
      ?auto_7532 - BLOCK
    )
    :vars
    (
      ?auto_7533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7532 ?auto_7533 ) ( ON-TABLE ?auto_7530 ) ( not ( = ?auto_7530 ?auto_7531 ) ) ( not ( = ?auto_7530 ?auto_7532 ) ) ( not ( = ?auto_7530 ?auto_7533 ) ) ( not ( = ?auto_7531 ?auto_7532 ) ) ( not ( = ?auto_7531 ?auto_7533 ) ) ( not ( = ?auto_7532 ?auto_7533 ) ) ( CLEAR ?auto_7530 ) ( ON ?auto_7531 ?auto_7532 ) ( CLEAR ?auto_7531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7530 ?auto_7531 )
      ( MAKE-3PILE ?auto_7530 ?auto_7531 ?auto_7532 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7537 - BLOCK
      ?auto_7538 - BLOCK
      ?auto_7539 - BLOCK
    )
    :vars
    (
      ?auto_7540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7539 ?auto_7540 ) ( not ( = ?auto_7537 ?auto_7538 ) ) ( not ( = ?auto_7537 ?auto_7539 ) ) ( not ( = ?auto_7537 ?auto_7540 ) ) ( not ( = ?auto_7538 ?auto_7539 ) ) ( not ( = ?auto_7538 ?auto_7540 ) ) ( not ( = ?auto_7539 ?auto_7540 ) ) ( ON ?auto_7538 ?auto_7539 ) ( ON ?auto_7537 ?auto_7538 ) ( CLEAR ?auto_7537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7537 )
      ( MAKE-3PILE ?auto_7537 ?auto_7538 ?auto_7539 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7544 - BLOCK
      ?auto_7545 - BLOCK
      ?auto_7546 - BLOCK
    )
    :vars
    (
      ?auto_7547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7546 ?auto_7547 ) ( not ( = ?auto_7544 ?auto_7545 ) ) ( not ( = ?auto_7544 ?auto_7546 ) ) ( not ( = ?auto_7544 ?auto_7547 ) ) ( not ( = ?auto_7545 ?auto_7546 ) ) ( not ( = ?auto_7545 ?auto_7547 ) ) ( not ( = ?auto_7546 ?auto_7547 ) ) ( ON ?auto_7545 ?auto_7546 ) ( ON ?auto_7544 ?auto_7545 ) ( CLEAR ?auto_7544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7544 )
      ( MAKE-3PILE ?auto_7544 ?auto_7545 ?auto_7546 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7552 - BLOCK
      ?auto_7553 - BLOCK
      ?auto_7554 - BLOCK
      ?auto_7555 - BLOCK
    )
    :vars
    (
      ?auto_7556 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7554 ) ( ON ?auto_7555 ?auto_7556 ) ( CLEAR ?auto_7555 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7552 ) ( ON ?auto_7553 ?auto_7552 ) ( ON ?auto_7554 ?auto_7553 ) ( not ( = ?auto_7552 ?auto_7553 ) ) ( not ( = ?auto_7552 ?auto_7554 ) ) ( not ( = ?auto_7552 ?auto_7555 ) ) ( not ( = ?auto_7552 ?auto_7556 ) ) ( not ( = ?auto_7553 ?auto_7554 ) ) ( not ( = ?auto_7553 ?auto_7555 ) ) ( not ( = ?auto_7553 ?auto_7556 ) ) ( not ( = ?auto_7554 ?auto_7555 ) ) ( not ( = ?auto_7554 ?auto_7556 ) ) ( not ( = ?auto_7555 ?auto_7556 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7555 ?auto_7556 )
      ( !STACK ?auto_7555 ?auto_7554 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7561 - BLOCK
      ?auto_7562 - BLOCK
      ?auto_7563 - BLOCK
      ?auto_7564 - BLOCK
    )
    :vars
    (
      ?auto_7565 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7563 ) ( ON ?auto_7564 ?auto_7565 ) ( CLEAR ?auto_7564 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7561 ) ( ON ?auto_7562 ?auto_7561 ) ( ON ?auto_7563 ?auto_7562 ) ( not ( = ?auto_7561 ?auto_7562 ) ) ( not ( = ?auto_7561 ?auto_7563 ) ) ( not ( = ?auto_7561 ?auto_7564 ) ) ( not ( = ?auto_7561 ?auto_7565 ) ) ( not ( = ?auto_7562 ?auto_7563 ) ) ( not ( = ?auto_7562 ?auto_7564 ) ) ( not ( = ?auto_7562 ?auto_7565 ) ) ( not ( = ?auto_7563 ?auto_7564 ) ) ( not ( = ?auto_7563 ?auto_7565 ) ) ( not ( = ?auto_7564 ?auto_7565 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7564 ?auto_7565 )
      ( !STACK ?auto_7564 ?auto_7563 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7570 - BLOCK
      ?auto_7571 - BLOCK
      ?auto_7572 - BLOCK
      ?auto_7573 - BLOCK
    )
    :vars
    (
      ?auto_7574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7573 ?auto_7574 ) ( ON-TABLE ?auto_7570 ) ( ON ?auto_7571 ?auto_7570 ) ( not ( = ?auto_7570 ?auto_7571 ) ) ( not ( = ?auto_7570 ?auto_7572 ) ) ( not ( = ?auto_7570 ?auto_7573 ) ) ( not ( = ?auto_7570 ?auto_7574 ) ) ( not ( = ?auto_7571 ?auto_7572 ) ) ( not ( = ?auto_7571 ?auto_7573 ) ) ( not ( = ?auto_7571 ?auto_7574 ) ) ( not ( = ?auto_7572 ?auto_7573 ) ) ( not ( = ?auto_7572 ?auto_7574 ) ) ( not ( = ?auto_7573 ?auto_7574 ) ) ( CLEAR ?auto_7571 ) ( ON ?auto_7572 ?auto_7573 ) ( CLEAR ?auto_7572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7570 ?auto_7571 ?auto_7572 )
      ( MAKE-4PILE ?auto_7570 ?auto_7571 ?auto_7572 ?auto_7573 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7579 - BLOCK
      ?auto_7580 - BLOCK
      ?auto_7581 - BLOCK
      ?auto_7582 - BLOCK
    )
    :vars
    (
      ?auto_7583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7582 ?auto_7583 ) ( ON-TABLE ?auto_7579 ) ( ON ?auto_7580 ?auto_7579 ) ( not ( = ?auto_7579 ?auto_7580 ) ) ( not ( = ?auto_7579 ?auto_7581 ) ) ( not ( = ?auto_7579 ?auto_7582 ) ) ( not ( = ?auto_7579 ?auto_7583 ) ) ( not ( = ?auto_7580 ?auto_7581 ) ) ( not ( = ?auto_7580 ?auto_7582 ) ) ( not ( = ?auto_7580 ?auto_7583 ) ) ( not ( = ?auto_7581 ?auto_7582 ) ) ( not ( = ?auto_7581 ?auto_7583 ) ) ( not ( = ?auto_7582 ?auto_7583 ) ) ( CLEAR ?auto_7580 ) ( ON ?auto_7581 ?auto_7582 ) ( CLEAR ?auto_7581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7579 ?auto_7580 ?auto_7581 )
      ( MAKE-4PILE ?auto_7579 ?auto_7580 ?auto_7581 ?auto_7582 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7588 - BLOCK
      ?auto_7589 - BLOCK
      ?auto_7590 - BLOCK
      ?auto_7591 - BLOCK
    )
    :vars
    (
      ?auto_7592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7591 ?auto_7592 ) ( ON-TABLE ?auto_7588 ) ( not ( = ?auto_7588 ?auto_7589 ) ) ( not ( = ?auto_7588 ?auto_7590 ) ) ( not ( = ?auto_7588 ?auto_7591 ) ) ( not ( = ?auto_7588 ?auto_7592 ) ) ( not ( = ?auto_7589 ?auto_7590 ) ) ( not ( = ?auto_7589 ?auto_7591 ) ) ( not ( = ?auto_7589 ?auto_7592 ) ) ( not ( = ?auto_7590 ?auto_7591 ) ) ( not ( = ?auto_7590 ?auto_7592 ) ) ( not ( = ?auto_7591 ?auto_7592 ) ) ( ON ?auto_7590 ?auto_7591 ) ( CLEAR ?auto_7588 ) ( ON ?auto_7589 ?auto_7590 ) ( CLEAR ?auto_7589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7588 ?auto_7589 )
      ( MAKE-4PILE ?auto_7588 ?auto_7589 ?auto_7590 ?auto_7591 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7597 - BLOCK
      ?auto_7598 - BLOCK
      ?auto_7599 - BLOCK
      ?auto_7600 - BLOCK
    )
    :vars
    (
      ?auto_7601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7600 ?auto_7601 ) ( ON-TABLE ?auto_7597 ) ( not ( = ?auto_7597 ?auto_7598 ) ) ( not ( = ?auto_7597 ?auto_7599 ) ) ( not ( = ?auto_7597 ?auto_7600 ) ) ( not ( = ?auto_7597 ?auto_7601 ) ) ( not ( = ?auto_7598 ?auto_7599 ) ) ( not ( = ?auto_7598 ?auto_7600 ) ) ( not ( = ?auto_7598 ?auto_7601 ) ) ( not ( = ?auto_7599 ?auto_7600 ) ) ( not ( = ?auto_7599 ?auto_7601 ) ) ( not ( = ?auto_7600 ?auto_7601 ) ) ( ON ?auto_7599 ?auto_7600 ) ( CLEAR ?auto_7597 ) ( ON ?auto_7598 ?auto_7599 ) ( CLEAR ?auto_7598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7597 ?auto_7598 )
      ( MAKE-4PILE ?auto_7597 ?auto_7598 ?auto_7599 ?auto_7600 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7606 - BLOCK
      ?auto_7607 - BLOCK
      ?auto_7608 - BLOCK
      ?auto_7609 - BLOCK
    )
    :vars
    (
      ?auto_7610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7609 ?auto_7610 ) ( not ( = ?auto_7606 ?auto_7607 ) ) ( not ( = ?auto_7606 ?auto_7608 ) ) ( not ( = ?auto_7606 ?auto_7609 ) ) ( not ( = ?auto_7606 ?auto_7610 ) ) ( not ( = ?auto_7607 ?auto_7608 ) ) ( not ( = ?auto_7607 ?auto_7609 ) ) ( not ( = ?auto_7607 ?auto_7610 ) ) ( not ( = ?auto_7608 ?auto_7609 ) ) ( not ( = ?auto_7608 ?auto_7610 ) ) ( not ( = ?auto_7609 ?auto_7610 ) ) ( ON ?auto_7608 ?auto_7609 ) ( ON ?auto_7607 ?auto_7608 ) ( ON ?auto_7606 ?auto_7607 ) ( CLEAR ?auto_7606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7606 )
      ( MAKE-4PILE ?auto_7606 ?auto_7607 ?auto_7608 ?auto_7609 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7615 - BLOCK
      ?auto_7616 - BLOCK
      ?auto_7617 - BLOCK
      ?auto_7618 - BLOCK
    )
    :vars
    (
      ?auto_7619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7618 ?auto_7619 ) ( not ( = ?auto_7615 ?auto_7616 ) ) ( not ( = ?auto_7615 ?auto_7617 ) ) ( not ( = ?auto_7615 ?auto_7618 ) ) ( not ( = ?auto_7615 ?auto_7619 ) ) ( not ( = ?auto_7616 ?auto_7617 ) ) ( not ( = ?auto_7616 ?auto_7618 ) ) ( not ( = ?auto_7616 ?auto_7619 ) ) ( not ( = ?auto_7617 ?auto_7618 ) ) ( not ( = ?auto_7617 ?auto_7619 ) ) ( not ( = ?auto_7618 ?auto_7619 ) ) ( ON ?auto_7617 ?auto_7618 ) ( ON ?auto_7616 ?auto_7617 ) ( ON ?auto_7615 ?auto_7616 ) ( CLEAR ?auto_7615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7615 )
      ( MAKE-4PILE ?auto_7615 ?auto_7616 ?auto_7617 ?auto_7618 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7625 - BLOCK
      ?auto_7626 - BLOCK
      ?auto_7627 - BLOCK
      ?auto_7628 - BLOCK
      ?auto_7629 - BLOCK
    )
    :vars
    (
      ?auto_7630 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7628 ) ( ON ?auto_7629 ?auto_7630 ) ( CLEAR ?auto_7629 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7625 ) ( ON ?auto_7626 ?auto_7625 ) ( ON ?auto_7627 ?auto_7626 ) ( ON ?auto_7628 ?auto_7627 ) ( not ( = ?auto_7625 ?auto_7626 ) ) ( not ( = ?auto_7625 ?auto_7627 ) ) ( not ( = ?auto_7625 ?auto_7628 ) ) ( not ( = ?auto_7625 ?auto_7629 ) ) ( not ( = ?auto_7625 ?auto_7630 ) ) ( not ( = ?auto_7626 ?auto_7627 ) ) ( not ( = ?auto_7626 ?auto_7628 ) ) ( not ( = ?auto_7626 ?auto_7629 ) ) ( not ( = ?auto_7626 ?auto_7630 ) ) ( not ( = ?auto_7627 ?auto_7628 ) ) ( not ( = ?auto_7627 ?auto_7629 ) ) ( not ( = ?auto_7627 ?auto_7630 ) ) ( not ( = ?auto_7628 ?auto_7629 ) ) ( not ( = ?auto_7628 ?auto_7630 ) ) ( not ( = ?auto_7629 ?auto_7630 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7629 ?auto_7630 )
      ( !STACK ?auto_7629 ?auto_7628 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7636 - BLOCK
      ?auto_7637 - BLOCK
      ?auto_7638 - BLOCK
      ?auto_7639 - BLOCK
      ?auto_7640 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7639 ) ( ON-TABLE ?auto_7640 ) ( CLEAR ?auto_7640 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7636 ) ( ON ?auto_7637 ?auto_7636 ) ( ON ?auto_7638 ?auto_7637 ) ( ON ?auto_7639 ?auto_7638 ) ( not ( = ?auto_7636 ?auto_7637 ) ) ( not ( = ?auto_7636 ?auto_7638 ) ) ( not ( = ?auto_7636 ?auto_7639 ) ) ( not ( = ?auto_7636 ?auto_7640 ) ) ( not ( = ?auto_7637 ?auto_7638 ) ) ( not ( = ?auto_7637 ?auto_7639 ) ) ( not ( = ?auto_7637 ?auto_7640 ) ) ( not ( = ?auto_7638 ?auto_7639 ) ) ( not ( = ?auto_7638 ?auto_7640 ) ) ( not ( = ?auto_7639 ?auto_7640 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_7640 )
      ( !STACK ?auto_7640 ?auto_7639 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7646 - BLOCK
      ?auto_7647 - BLOCK
      ?auto_7648 - BLOCK
      ?auto_7649 - BLOCK
      ?auto_7650 - BLOCK
    )
    :vars
    (
      ?auto_7651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7650 ?auto_7651 ) ( ON-TABLE ?auto_7646 ) ( ON ?auto_7647 ?auto_7646 ) ( ON ?auto_7648 ?auto_7647 ) ( not ( = ?auto_7646 ?auto_7647 ) ) ( not ( = ?auto_7646 ?auto_7648 ) ) ( not ( = ?auto_7646 ?auto_7649 ) ) ( not ( = ?auto_7646 ?auto_7650 ) ) ( not ( = ?auto_7646 ?auto_7651 ) ) ( not ( = ?auto_7647 ?auto_7648 ) ) ( not ( = ?auto_7647 ?auto_7649 ) ) ( not ( = ?auto_7647 ?auto_7650 ) ) ( not ( = ?auto_7647 ?auto_7651 ) ) ( not ( = ?auto_7648 ?auto_7649 ) ) ( not ( = ?auto_7648 ?auto_7650 ) ) ( not ( = ?auto_7648 ?auto_7651 ) ) ( not ( = ?auto_7649 ?auto_7650 ) ) ( not ( = ?auto_7649 ?auto_7651 ) ) ( not ( = ?auto_7650 ?auto_7651 ) ) ( CLEAR ?auto_7648 ) ( ON ?auto_7649 ?auto_7650 ) ( CLEAR ?auto_7649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7646 ?auto_7647 ?auto_7648 ?auto_7649 )
      ( MAKE-5PILE ?auto_7646 ?auto_7647 ?auto_7648 ?auto_7649 ?auto_7650 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7657 - BLOCK
      ?auto_7658 - BLOCK
      ?auto_7659 - BLOCK
      ?auto_7660 - BLOCK
      ?auto_7661 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7661 ) ( ON-TABLE ?auto_7657 ) ( ON ?auto_7658 ?auto_7657 ) ( ON ?auto_7659 ?auto_7658 ) ( not ( = ?auto_7657 ?auto_7658 ) ) ( not ( = ?auto_7657 ?auto_7659 ) ) ( not ( = ?auto_7657 ?auto_7660 ) ) ( not ( = ?auto_7657 ?auto_7661 ) ) ( not ( = ?auto_7658 ?auto_7659 ) ) ( not ( = ?auto_7658 ?auto_7660 ) ) ( not ( = ?auto_7658 ?auto_7661 ) ) ( not ( = ?auto_7659 ?auto_7660 ) ) ( not ( = ?auto_7659 ?auto_7661 ) ) ( not ( = ?auto_7660 ?auto_7661 ) ) ( CLEAR ?auto_7659 ) ( ON ?auto_7660 ?auto_7661 ) ( CLEAR ?auto_7660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7657 ?auto_7658 ?auto_7659 ?auto_7660 )
      ( MAKE-5PILE ?auto_7657 ?auto_7658 ?auto_7659 ?auto_7660 ?auto_7661 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7667 - BLOCK
      ?auto_7668 - BLOCK
      ?auto_7669 - BLOCK
      ?auto_7670 - BLOCK
      ?auto_7671 - BLOCK
    )
    :vars
    (
      ?auto_7672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7671 ?auto_7672 ) ( ON-TABLE ?auto_7667 ) ( ON ?auto_7668 ?auto_7667 ) ( not ( = ?auto_7667 ?auto_7668 ) ) ( not ( = ?auto_7667 ?auto_7669 ) ) ( not ( = ?auto_7667 ?auto_7670 ) ) ( not ( = ?auto_7667 ?auto_7671 ) ) ( not ( = ?auto_7667 ?auto_7672 ) ) ( not ( = ?auto_7668 ?auto_7669 ) ) ( not ( = ?auto_7668 ?auto_7670 ) ) ( not ( = ?auto_7668 ?auto_7671 ) ) ( not ( = ?auto_7668 ?auto_7672 ) ) ( not ( = ?auto_7669 ?auto_7670 ) ) ( not ( = ?auto_7669 ?auto_7671 ) ) ( not ( = ?auto_7669 ?auto_7672 ) ) ( not ( = ?auto_7670 ?auto_7671 ) ) ( not ( = ?auto_7670 ?auto_7672 ) ) ( not ( = ?auto_7671 ?auto_7672 ) ) ( ON ?auto_7670 ?auto_7671 ) ( CLEAR ?auto_7668 ) ( ON ?auto_7669 ?auto_7670 ) ( CLEAR ?auto_7669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7667 ?auto_7668 ?auto_7669 )
      ( MAKE-5PILE ?auto_7667 ?auto_7668 ?auto_7669 ?auto_7670 ?auto_7671 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7678 - BLOCK
      ?auto_7679 - BLOCK
      ?auto_7680 - BLOCK
      ?auto_7681 - BLOCK
      ?auto_7682 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7682 ) ( ON-TABLE ?auto_7678 ) ( ON ?auto_7679 ?auto_7678 ) ( not ( = ?auto_7678 ?auto_7679 ) ) ( not ( = ?auto_7678 ?auto_7680 ) ) ( not ( = ?auto_7678 ?auto_7681 ) ) ( not ( = ?auto_7678 ?auto_7682 ) ) ( not ( = ?auto_7679 ?auto_7680 ) ) ( not ( = ?auto_7679 ?auto_7681 ) ) ( not ( = ?auto_7679 ?auto_7682 ) ) ( not ( = ?auto_7680 ?auto_7681 ) ) ( not ( = ?auto_7680 ?auto_7682 ) ) ( not ( = ?auto_7681 ?auto_7682 ) ) ( ON ?auto_7681 ?auto_7682 ) ( CLEAR ?auto_7679 ) ( ON ?auto_7680 ?auto_7681 ) ( CLEAR ?auto_7680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7678 ?auto_7679 ?auto_7680 )
      ( MAKE-5PILE ?auto_7678 ?auto_7679 ?auto_7680 ?auto_7681 ?auto_7682 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7688 - BLOCK
      ?auto_7689 - BLOCK
      ?auto_7690 - BLOCK
      ?auto_7691 - BLOCK
      ?auto_7692 - BLOCK
    )
    :vars
    (
      ?auto_7693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7692 ?auto_7693 ) ( ON-TABLE ?auto_7688 ) ( not ( = ?auto_7688 ?auto_7689 ) ) ( not ( = ?auto_7688 ?auto_7690 ) ) ( not ( = ?auto_7688 ?auto_7691 ) ) ( not ( = ?auto_7688 ?auto_7692 ) ) ( not ( = ?auto_7688 ?auto_7693 ) ) ( not ( = ?auto_7689 ?auto_7690 ) ) ( not ( = ?auto_7689 ?auto_7691 ) ) ( not ( = ?auto_7689 ?auto_7692 ) ) ( not ( = ?auto_7689 ?auto_7693 ) ) ( not ( = ?auto_7690 ?auto_7691 ) ) ( not ( = ?auto_7690 ?auto_7692 ) ) ( not ( = ?auto_7690 ?auto_7693 ) ) ( not ( = ?auto_7691 ?auto_7692 ) ) ( not ( = ?auto_7691 ?auto_7693 ) ) ( not ( = ?auto_7692 ?auto_7693 ) ) ( ON ?auto_7691 ?auto_7692 ) ( ON ?auto_7690 ?auto_7691 ) ( CLEAR ?auto_7688 ) ( ON ?auto_7689 ?auto_7690 ) ( CLEAR ?auto_7689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7688 ?auto_7689 )
      ( MAKE-5PILE ?auto_7688 ?auto_7689 ?auto_7690 ?auto_7691 ?auto_7692 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7699 - BLOCK
      ?auto_7700 - BLOCK
      ?auto_7701 - BLOCK
      ?auto_7702 - BLOCK
      ?auto_7703 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7703 ) ( ON-TABLE ?auto_7699 ) ( not ( = ?auto_7699 ?auto_7700 ) ) ( not ( = ?auto_7699 ?auto_7701 ) ) ( not ( = ?auto_7699 ?auto_7702 ) ) ( not ( = ?auto_7699 ?auto_7703 ) ) ( not ( = ?auto_7700 ?auto_7701 ) ) ( not ( = ?auto_7700 ?auto_7702 ) ) ( not ( = ?auto_7700 ?auto_7703 ) ) ( not ( = ?auto_7701 ?auto_7702 ) ) ( not ( = ?auto_7701 ?auto_7703 ) ) ( not ( = ?auto_7702 ?auto_7703 ) ) ( ON ?auto_7702 ?auto_7703 ) ( ON ?auto_7701 ?auto_7702 ) ( CLEAR ?auto_7699 ) ( ON ?auto_7700 ?auto_7701 ) ( CLEAR ?auto_7700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7699 ?auto_7700 )
      ( MAKE-5PILE ?auto_7699 ?auto_7700 ?auto_7701 ?auto_7702 ?auto_7703 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7709 - BLOCK
      ?auto_7710 - BLOCK
      ?auto_7711 - BLOCK
      ?auto_7712 - BLOCK
      ?auto_7713 - BLOCK
    )
    :vars
    (
      ?auto_7714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7713 ?auto_7714 ) ( not ( = ?auto_7709 ?auto_7710 ) ) ( not ( = ?auto_7709 ?auto_7711 ) ) ( not ( = ?auto_7709 ?auto_7712 ) ) ( not ( = ?auto_7709 ?auto_7713 ) ) ( not ( = ?auto_7709 ?auto_7714 ) ) ( not ( = ?auto_7710 ?auto_7711 ) ) ( not ( = ?auto_7710 ?auto_7712 ) ) ( not ( = ?auto_7710 ?auto_7713 ) ) ( not ( = ?auto_7710 ?auto_7714 ) ) ( not ( = ?auto_7711 ?auto_7712 ) ) ( not ( = ?auto_7711 ?auto_7713 ) ) ( not ( = ?auto_7711 ?auto_7714 ) ) ( not ( = ?auto_7712 ?auto_7713 ) ) ( not ( = ?auto_7712 ?auto_7714 ) ) ( not ( = ?auto_7713 ?auto_7714 ) ) ( ON ?auto_7712 ?auto_7713 ) ( ON ?auto_7711 ?auto_7712 ) ( ON ?auto_7710 ?auto_7711 ) ( ON ?auto_7709 ?auto_7710 ) ( CLEAR ?auto_7709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7709 )
      ( MAKE-5PILE ?auto_7709 ?auto_7710 ?auto_7711 ?auto_7712 ?auto_7713 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7720 - BLOCK
      ?auto_7721 - BLOCK
      ?auto_7722 - BLOCK
      ?auto_7723 - BLOCK
      ?auto_7724 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7724 ) ( not ( = ?auto_7720 ?auto_7721 ) ) ( not ( = ?auto_7720 ?auto_7722 ) ) ( not ( = ?auto_7720 ?auto_7723 ) ) ( not ( = ?auto_7720 ?auto_7724 ) ) ( not ( = ?auto_7721 ?auto_7722 ) ) ( not ( = ?auto_7721 ?auto_7723 ) ) ( not ( = ?auto_7721 ?auto_7724 ) ) ( not ( = ?auto_7722 ?auto_7723 ) ) ( not ( = ?auto_7722 ?auto_7724 ) ) ( not ( = ?auto_7723 ?auto_7724 ) ) ( ON ?auto_7723 ?auto_7724 ) ( ON ?auto_7722 ?auto_7723 ) ( ON ?auto_7721 ?auto_7722 ) ( ON ?auto_7720 ?auto_7721 ) ( CLEAR ?auto_7720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7720 )
      ( MAKE-5PILE ?auto_7720 ?auto_7721 ?auto_7722 ?auto_7723 ?auto_7724 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7730 - BLOCK
      ?auto_7731 - BLOCK
      ?auto_7732 - BLOCK
      ?auto_7733 - BLOCK
      ?auto_7734 - BLOCK
    )
    :vars
    (
      ?auto_7735 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7730 ?auto_7731 ) ) ( not ( = ?auto_7730 ?auto_7732 ) ) ( not ( = ?auto_7730 ?auto_7733 ) ) ( not ( = ?auto_7730 ?auto_7734 ) ) ( not ( = ?auto_7731 ?auto_7732 ) ) ( not ( = ?auto_7731 ?auto_7733 ) ) ( not ( = ?auto_7731 ?auto_7734 ) ) ( not ( = ?auto_7732 ?auto_7733 ) ) ( not ( = ?auto_7732 ?auto_7734 ) ) ( not ( = ?auto_7733 ?auto_7734 ) ) ( ON ?auto_7730 ?auto_7735 ) ( not ( = ?auto_7734 ?auto_7735 ) ) ( not ( = ?auto_7733 ?auto_7735 ) ) ( not ( = ?auto_7732 ?auto_7735 ) ) ( not ( = ?auto_7731 ?auto_7735 ) ) ( not ( = ?auto_7730 ?auto_7735 ) ) ( ON ?auto_7731 ?auto_7730 ) ( ON ?auto_7732 ?auto_7731 ) ( ON ?auto_7733 ?auto_7732 ) ( ON ?auto_7734 ?auto_7733 ) ( CLEAR ?auto_7734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_7734 ?auto_7733 ?auto_7732 ?auto_7731 ?auto_7730 )
      ( MAKE-5PILE ?auto_7730 ?auto_7731 ?auto_7732 ?auto_7733 ?auto_7734 ) )
  )

)

