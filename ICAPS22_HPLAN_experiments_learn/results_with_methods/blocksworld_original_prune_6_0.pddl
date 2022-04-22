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
      ?auto_34506 - BLOCK
      ?auto_34507 - BLOCK
      ?auto_34508 - BLOCK
      ?auto_34509 - BLOCK
      ?auto_34510 - BLOCK
      ?auto_34511 - BLOCK
    )
    :vars
    (
      ?auto_34512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34512 ?auto_34511 ) ( CLEAR ?auto_34512 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34506 ) ( ON ?auto_34507 ?auto_34506 ) ( ON ?auto_34508 ?auto_34507 ) ( ON ?auto_34509 ?auto_34508 ) ( ON ?auto_34510 ?auto_34509 ) ( ON ?auto_34511 ?auto_34510 ) ( not ( = ?auto_34506 ?auto_34507 ) ) ( not ( = ?auto_34506 ?auto_34508 ) ) ( not ( = ?auto_34506 ?auto_34509 ) ) ( not ( = ?auto_34506 ?auto_34510 ) ) ( not ( = ?auto_34506 ?auto_34511 ) ) ( not ( = ?auto_34506 ?auto_34512 ) ) ( not ( = ?auto_34507 ?auto_34508 ) ) ( not ( = ?auto_34507 ?auto_34509 ) ) ( not ( = ?auto_34507 ?auto_34510 ) ) ( not ( = ?auto_34507 ?auto_34511 ) ) ( not ( = ?auto_34507 ?auto_34512 ) ) ( not ( = ?auto_34508 ?auto_34509 ) ) ( not ( = ?auto_34508 ?auto_34510 ) ) ( not ( = ?auto_34508 ?auto_34511 ) ) ( not ( = ?auto_34508 ?auto_34512 ) ) ( not ( = ?auto_34509 ?auto_34510 ) ) ( not ( = ?auto_34509 ?auto_34511 ) ) ( not ( = ?auto_34509 ?auto_34512 ) ) ( not ( = ?auto_34510 ?auto_34511 ) ) ( not ( = ?auto_34510 ?auto_34512 ) ) ( not ( = ?auto_34511 ?auto_34512 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34512 ?auto_34511 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34514 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_34514 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_34514 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34515 - BLOCK
    )
    :vars
    (
      ?auto_34516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34515 ?auto_34516 ) ( CLEAR ?auto_34515 ) ( HAND-EMPTY ) ( not ( = ?auto_34515 ?auto_34516 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34515 ?auto_34516 )
      ( MAKE-1PILE ?auto_34515 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34522 - BLOCK
      ?auto_34523 - BLOCK
      ?auto_34524 - BLOCK
      ?auto_34525 - BLOCK
      ?auto_34526 - BLOCK
    )
    :vars
    (
      ?auto_34527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34527 ?auto_34526 ) ( CLEAR ?auto_34527 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34522 ) ( ON ?auto_34523 ?auto_34522 ) ( ON ?auto_34524 ?auto_34523 ) ( ON ?auto_34525 ?auto_34524 ) ( ON ?auto_34526 ?auto_34525 ) ( not ( = ?auto_34522 ?auto_34523 ) ) ( not ( = ?auto_34522 ?auto_34524 ) ) ( not ( = ?auto_34522 ?auto_34525 ) ) ( not ( = ?auto_34522 ?auto_34526 ) ) ( not ( = ?auto_34522 ?auto_34527 ) ) ( not ( = ?auto_34523 ?auto_34524 ) ) ( not ( = ?auto_34523 ?auto_34525 ) ) ( not ( = ?auto_34523 ?auto_34526 ) ) ( not ( = ?auto_34523 ?auto_34527 ) ) ( not ( = ?auto_34524 ?auto_34525 ) ) ( not ( = ?auto_34524 ?auto_34526 ) ) ( not ( = ?auto_34524 ?auto_34527 ) ) ( not ( = ?auto_34525 ?auto_34526 ) ) ( not ( = ?auto_34525 ?auto_34527 ) ) ( not ( = ?auto_34526 ?auto_34527 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34527 ?auto_34526 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34528 - BLOCK
      ?auto_34529 - BLOCK
      ?auto_34530 - BLOCK
      ?auto_34531 - BLOCK
      ?auto_34532 - BLOCK
    )
    :vars
    (
      ?auto_34533 - BLOCK
      ?auto_34534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34533 ?auto_34532 ) ( CLEAR ?auto_34533 ) ( ON-TABLE ?auto_34528 ) ( ON ?auto_34529 ?auto_34528 ) ( ON ?auto_34530 ?auto_34529 ) ( ON ?auto_34531 ?auto_34530 ) ( ON ?auto_34532 ?auto_34531 ) ( not ( = ?auto_34528 ?auto_34529 ) ) ( not ( = ?auto_34528 ?auto_34530 ) ) ( not ( = ?auto_34528 ?auto_34531 ) ) ( not ( = ?auto_34528 ?auto_34532 ) ) ( not ( = ?auto_34528 ?auto_34533 ) ) ( not ( = ?auto_34529 ?auto_34530 ) ) ( not ( = ?auto_34529 ?auto_34531 ) ) ( not ( = ?auto_34529 ?auto_34532 ) ) ( not ( = ?auto_34529 ?auto_34533 ) ) ( not ( = ?auto_34530 ?auto_34531 ) ) ( not ( = ?auto_34530 ?auto_34532 ) ) ( not ( = ?auto_34530 ?auto_34533 ) ) ( not ( = ?auto_34531 ?auto_34532 ) ) ( not ( = ?auto_34531 ?auto_34533 ) ) ( not ( = ?auto_34532 ?auto_34533 ) ) ( HOLDING ?auto_34534 ) ( not ( = ?auto_34528 ?auto_34534 ) ) ( not ( = ?auto_34529 ?auto_34534 ) ) ( not ( = ?auto_34530 ?auto_34534 ) ) ( not ( = ?auto_34531 ?auto_34534 ) ) ( not ( = ?auto_34532 ?auto_34534 ) ) ( not ( = ?auto_34533 ?auto_34534 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_34534 )
      ( MAKE-5PILE ?auto_34528 ?auto_34529 ?auto_34530 ?auto_34531 ?auto_34532 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34535 - BLOCK
      ?auto_34536 - BLOCK
      ?auto_34537 - BLOCK
      ?auto_34538 - BLOCK
      ?auto_34539 - BLOCK
    )
    :vars
    (
      ?auto_34540 - BLOCK
      ?auto_34541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34540 ?auto_34539 ) ( ON-TABLE ?auto_34535 ) ( ON ?auto_34536 ?auto_34535 ) ( ON ?auto_34537 ?auto_34536 ) ( ON ?auto_34538 ?auto_34537 ) ( ON ?auto_34539 ?auto_34538 ) ( not ( = ?auto_34535 ?auto_34536 ) ) ( not ( = ?auto_34535 ?auto_34537 ) ) ( not ( = ?auto_34535 ?auto_34538 ) ) ( not ( = ?auto_34535 ?auto_34539 ) ) ( not ( = ?auto_34535 ?auto_34540 ) ) ( not ( = ?auto_34536 ?auto_34537 ) ) ( not ( = ?auto_34536 ?auto_34538 ) ) ( not ( = ?auto_34536 ?auto_34539 ) ) ( not ( = ?auto_34536 ?auto_34540 ) ) ( not ( = ?auto_34537 ?auto_34538 ) ) ( not ( = ?auto_34537 ?auto_34539 ) ) ( not ( = ?auto_34537 ?auto_34540 ) ) ( not ( = ?auto_34538 ?auto_34539 ) ) ( not ( = ?auto_34538 ?auto_34540 ) ) ( not ( = ?auto_34539 ?auto_34540 ) ) ( not ( = ?auto_34535 ?auto_34541 ) ) ( not ( = ?auto_34536 ?auto_34541 ) ) ( not ( = ?auto_34537 ?auto_34541 ) ) ( not ( = ?auto_34538 ?auto_34541 ) ) ( not ( = ?auto_34539 ?auto_34541 ) ) ( not ( = ?auto_34540 ?auto_34541 ) ) ( ON ?auto_34541 ?auto_34540 ) ( CLEAR ?auto_34541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_34535 ?auto_34536 ?auto_34537 ?auto_34538 ?auto_34539 ?auto_34540 )
      ( MAKE-5PILE ?auto_34535 ?auto_34536 ?auto_34537 ?auto_34538 ?auto_34539 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34544 - BLOCK
      ?auto_34545 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_34545 ) ( CLEAR ?auto_34544 ) ( ON-TABLE ?auto_34544 ) ( not ( = ?auto_34544 ?auto_34545 ) ) )
    :subtasks
    ( ( !STACK ?auto_34545 ?auto_34544 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34546 - BLOCK
      ?auto_34547 - BLOCK
    )
    :vars
    (
      ?auto_34548 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_34546 ) ( ON-TABLE ?auto_34546 ) ( not ( = ?auto_34546 ?auto_34547 ) ) ( ON ?auto_34547 ?auto_34548 ) ( CLEAR ?auto_34547 ) ( HAND-EMPTY ) ( not ( = ?auto_34546 ?auto_34548 ) ) ( not ( = ?auto_34547 ?auto_34548 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34547 ?auto_34548 )
      ( MAKE-2PILE ?auto_34546 ?auto_34547 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34549 - BLOCK
      ?auto_34550 - BLOCK
    )
    :vars
    (
      ?auto_34551 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34549 ?auto_34550 ) ) ( ON ?auto_34550 ?auto_34551 ) ( CLEAR ?auto_34550 ) ( not ( = ?auto_34549 ?auto_34551 ) ) ( not ( = ?auto_34550 ?auto_34551 ) ) ( HOLDING ?auto_34549 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34549 )
      ( MAKE-2PILE ?auto_34549 ?auto_34550 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34552 - BLOCK
      ?auto_34553 - BLOCK
    )
    :vars
    (
      ?auto_34554 - BLOCK
      ?auto_34558 - BLOCK
      ?auto_34555 - BLOCK
      ?auto_34556 - BLOCK
      ?auto_34557 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34552 ?auto_34553 ) ) ( ON ?auto_34553 ?auto_34554 ) ( not ( = ?auto_34552 ?auto_34554 ) ) ( not ( = ?auto_34553 ?auto_34554 ) ) ( ON ?auto_34552 ?auto_34553 ) ( CLEAR ?auto_34552 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34558 ) ( ON ?auto_34555 ?auto_34558 ) ( ON ?auto_34556 ?auto_34555 ) ( ON ?auto_34557 ?auto_34556 ) ( ON ?auto_34554 ?auto_34557 ) ( not ( = ?auto_34558 ?auto_34555 ) ) ( not ( = ?auto_34558 ?auto_34556 ) ) ( not ( = ?auto_34558 ?auto_34557 ) ) ( not ( = ?auto_34558 ?auto_34554 ) ) ( not ( = ?auto_34558 ?auto_34553 ) ) ( not ( = ?auto_34558 ?auto_34552 ) ) ( not ( = ?auto_34555 ?auto_34556 ) ) ( not ( = ?auto_34555 ?auto_34557 ) ) ( not ( = ?auto_34555 ?auto_34554 ) ) ( not ( = ?auto_34555 ?auto_34553 ) ) ( not ( = ?auto_34555 ?auto_34552 ) ) ( not ( = ?auto_34556 ?auto_34557 ) ) ( not ( = ?auto_34556 ?auto_34554 ) ) ( not ( = ?auto_34556 ?auto_34553 ) ) ( not ( = ?auto_34556 ?auto_34552 ) ) ( not ( = ?auto_34557 ?auto_34554 ) ) ( not ( = ?auto_34557 ?auto_34553 ) ) ( not ( = ?auto_34557 ?auto_34552 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_34558 ?auto_34555 ?auto_34556 ?auto_34557 ?auto_34554 ?auto_34553 )
      ( MAKE-2PILE ?auto_34552 ?auto_34553 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34563 - BLOCK
      ?auto_34564 - BLOCK
      ?auto_34565 - BLOCK
      ?auto_34566 - BLOCK
    )
    :vars
    (
      ?auto_34567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34567 ?auto_34566 ) ( CLEAR ?auto_34567 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34563 ) ( ON ?auto_34564 ?auto_34563 ) ( ON ?auto_34565 ?auto_34564 ) ( ON ?auto_34566 ?auto_34565 ) ( not ( = ?auto_34563 ?auto_34564 ) ) ( not ( = ?auto_34563 ?auto_34565 ) ) ( not ( = ?auto_34563 ?auto_34566 ) ) ( not ( = ?auto_34563 ?auto_34567 ) ) ( not ( = ?auto_34564 ?auto_34565 ) ) ( not ( = ?auto_34564 ?auto_34566 ) ) ( not ( = ?auto_34564 ?auto_34567 ) ) ( not ( = ?auto_34565 ?auto_34566 ) ) ( not ( = ?auto_34565 ?auto_34567 ) ) ( not ( = ?auto_34566 ?auto_34567 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34567 ?auto_34566 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34568 - BLOCK
      ?auto_34569 - BLOCK
      ?auto_34570 - BLOCK
      ?auto_34571 - BLOCK
    )
    :vars
    (
      ?auto_34572 - BLOCK
      ?auto_34573 - BLOCK
      ?auto_34574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34572 ?auto_34571 ) ( CLEAR ?auto_34572 ) ( ON-TABLE ?auto_34568 ) ( ON ?auto_34569 ?auto_34568 ) ( ON ?auto_34570 ?auto_34569 ) ( ON ?auto_34571 ?auto_34570 ) ( not ( = ?auto_34568 ?auto_34569 ) ) ( not ( = ?auto_34568 ?auto_34570 ) ) ( not ( = ?auto_34568 ?auto_34571 ) ) ( not ( = ?auto_34568 ?auto_34572 ) ) ( not ( = ?auto_34569 ?auto_34570 ) ) ( not ( = ?auto_34569 ?auto_34571 ) ) ( not ( = ?auto_34569 ?auto_34572 ) ) ( not ( = ?auto_34570 ?auto_34571 ) ) ( not ( = ?auto_34570 ?auto_34572 ) ) ( not ( = ?auto_34571 ?auto_34572 ) ) ( HOLDING ?auto_34573 ) ( CLEAR ?auto_34574 ) ( not ( = ?auto_34568 ?auto_34573 ) ) ( not ( = ?auto_34568 ?auto_34574 ) ) ( not ( = ?auto_34569 ?auto_34573 ) ) ( not ( = ?auto_34569 ?auto_34574 ) ) ( not ( = ?auto_34570 ?auto_34573 ) ) ( not ( = ?auto_34570 ?auto_34574 ) ) ( not ( = ?auto_34571 ?auto_34573 ) ) ( not ( = ?auto_34571 ?auto_34574 ) ) ( not ( = ?auto_34572 ?auto_34573 ) ) ( not ( = ?auto_34572 ?auto_34574 ) ) ( not ( = ?auto_34573 ?auto_34574 ) ) )
    :subtasks
    ( ( !STACK ?auto_34573 ?auto_34574 )
      ( MAKE-4PILE ?auto_34568 ?auto_34569 ?auto_34570 ?auto_34571 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35174 - BLOCK
      ?auto_35175 - BLOCK
      ?auto_35176 - BLOCK
      ?auto_35177 - BLOCK
    )
    :vars
    (
      ?auto_35179 - BLOCK
      ?auto_35178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35179 ?auto_35177 ) ( ON-TABLE ?auto_35174 ) ( ON ?auto_35175 ?auto_35174 ) ( ON ?auto_35176 ?auto_35175 ) ( ON ?auto_35177 ?auto_35176 ) ( not ( = ?auto_35174 ?auto_35175 ) ) ( not ( = ?auto_35174 ?auto_35176 ) ) ( not ( = ?auto_35174 ?auto_35177 ) ) ( not ( = ?auto_35174 ?auto_35179 ) ) ( not ( = ?auto_35175 ?auto_35176 ) ) ( not ( = ?auto_35175 ?auto_35177 ) ) ( not ( = ?auto_35175 ?auto_35179 ) ) ( not ( = ?auto_35176 ?auto_35177 ) ) ( not ( = ?auto_35176 ?auto_35179 ) ) ( not ( = ?auto_35177 ?auto_35179 ) ) ( not ( = ?auto_35174 ?auto_35178 ) ) ( not ( = ?auto_35175 ?auto_35178 ) ) ( not ( = ?auto_35176 ?auto_35178 ) ) ( not ( = ?auto_35177 ?auto_35178 ) ) ( not ( = ?auto_35179 ?auto_35178 ) ) ( ON ?auto_35178 ?auto_35179 ) ( CLEAR ?auto_35178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35174 ?auto_35175 ?auto_35176 ?auto_35177 ?auto_35179 )
      ( MAKE-4PILE ?auto_35174 ?auto_35175 ?auto_35176 ?auto_35177 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34582 - BLOCK
      ?auto_34583 - BLOCK
      ?auto_34584 - BLOCK
      ?auto_34585 - BLOCK
    )
    :vars
    (
      ?auto_34587 - BLOCK
      ?auto_34586 - BLOCK
      ?auto_34588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34587 ?auto_34585 ) ( ON-TABLE ?auto_34582 ) ( ON ?auto_34583 ?auto_34582 ) ( ON ?auto_34584 ?auto_34583 ) ( ON ?auto_34585 ?auto_34584 ) ( not ( = ?auto_34582 ?auto_34583 ) ) ( not ( = ?auto_34582 ?auto_34584 ) ) ( not ( = ?auto_34582 ?auto_34585 ) ) ( not ( = ?auto_34582 ?auto_34587 ) ) ( not ( = ?auto_34583 ?auto_34584 ) ) ( not ( = ?auto_34583 ?auto_34585 ) ) ( not ( = ?auto_34583 ?auto_34587 ) ) ( not ( = ?auto_34584 ?auto_34585 ) ) ( not ( = ?auto_34584 ?auto_34587 ) ) ( not ( = ?auto_34585 ?auto_34587 ) ) ( not ( = ?auto_34582 ?auto_34586 ) ) ( not ( = ?auto_34582 ?auto_34588 ) ) ( not ( = ?auto_34583 ?auto_34586 ) ) ( not ( = ?auto_34583 ?auto_34588 ) ) ( not ( = ?auto_34584 ?auto_34586 ) ) ( not ( = ?auto_34584 ?auto_34588 ) ) ( not ( = ?auto_34585 ?auto_34586 ) ) ( not ( = ?auto_34585 ?auto_34588 ) ) ( not ( = ?auto_34587 ?auto_34586 ) ) ( not ( = ?auto_34587 ?auto_34588 ) ) ( not ( = ?auto_34586 ?auto_34588 ) ) ( ON ?auto_34586 ?auto_34587 ) ( CLEAR ?auto_34586 ) ( HOLDING ?auto_34588 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34588 )
      ( MAKE-4PILE ?auto_34582 ?auto_34583 ?auto_34584 ?auto_34585 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34589 - BLOCK
      ?auto_34590 - BLOCK
      ?auto_34591 - BLOCK
      ?auto_34592 - BLOCK
    )
    :vars
    (
      ?auto_34593 - BLOCK
      ?auto_34595 - BLOCK
      ?auto_34594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34593 ?auto_34592 ) ( ON-TABLE ?auto_34589 ) ( ON ?auto_34590 ?auto_34589 ) ( ON ?auto_34591 ?auto_34590 ) ( ON ?auto_34592 ?auto_34591 ) ( not ( = ?auto_34589 ?auto_34590 ) ) ( not ( = ?auto_34589 ?auto_34591 ) ) ( not ( = ?auto_34589 ?auto_34592 ) ) ( not ( = ?auto_34589 ?auto_34593 ) ) ( not ( = ?auto_34590 ?auto_34591 ) ) ( not ( = ?auto_34590 ?auto_34592 ) ) ( not ( = ?auto_34590 ?auto_34593 ) ) ( not ( = ?auto_34591 ?auto_34592 ) ) ( not ( = ?auto_34591 ?auto_34593 ) ) ( not ( = ?auto_34592 ?auto_34593 ) ) ( not ( = ?auto_34589 ?auto_34595 ) ) ( not ( = ?auto_34589 ?auto_34594 ) ) ( not ( = ?auto_34590 ?auto_34595 ) ) ( not ( = ?auto_34590 ?auto_34594 ) ) ( not ( = ?auto_34591 ?auto_34595 ) ) ( not ( = ?auto_34591 ?auto_34594 ) ) ( not ( = ?auto_34592 ?auto_34595 ) ) ( not ( = ?auto_34592 ?auto_34594 ) ) ( not ( = ?auto_34593 ?auto_34595 ) ) ( not ( = ?auto_34593 ?auto_34594 ) ) ( not ( = ?auto_34595 ?auto_34594 ) ) ( ON ?auto_34595 ?auto_34593 ) ( ON ?auto_34594 ?auto_34595 ) ( CLEAR ?auto_34594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_34589 ?auto_34590 ?auto_34591 ?auto_34592 ?auto_34593 ?auto_34595 )
      ( MAKE-4PILE ?auto_34589 ?auto_34590 ?auto_34591 ?auto_34592 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34599 - BLOCK
      ?auto_34600 - BLOCK
      ?auto_34601 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_34601 ) ( CLEAR ?auto_34600 ) ( ON-TABLE ?auto_34599 ) ( ON ?auto_34600 ?auto_34599 ) ( not ( = ?auto_34599 ?auto_34600 ) ) ( not ( = ?auto_34599 ?auto_34601 ) ) ( not ( = ?auto_34600 ?auto_34601 ) ) )
    :subtasks
    ( ( !STACK ?auto_34601 ?auto_34600 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34602 - BLOCK
      ?auto_34603 - BLOCK
      ?auto_34604 - BLOCK
    )
    :vars
    (
      ?auto_34605 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_34603 ) ( ON-TABLE ?auto_34602 ) ( ON ?auto_34603 ?auto_34602 ) ( not ( = ?auto_34602 ?auto_34603 ) ) ( not ( = ?auto_34602 ?auto_34604 ) ) ( not ( = ?auto_34603 ?auto_34604 ) ) ( ON ?auto_34604 ?auto_34605 ) ( CLEAR ?auto_34604 ) ( HAND-EMPTY ) ( not ( = ?auto_34602 ?auto_34605 ) ) ( not ( = ?auto_34603 ?auto_34605 ) ) ( not ( = ?auto_34604 ?auto_34605 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34604 ?auto_34605 )
      ( MAKE-3PILE ?auto_34602 ?auto_34603 ?auto_34604 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34606 - BLOCK
      ?auto_34607 - BLOCK
      ?auto_34608 - BLOCK
    )
    :vars
    (
      ?auto_34609 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34606 ) ( not ( = ?auto_34606 ?auto_34607 ) ) ( not ( = ?auto_34606 ?auto_34608 ) ) ( not ( = ?auto_34607 ?auto_34608 ) ) ( ON ?auto_34608 ?auto_34609 ) ( CLEAR ?auto_34608 ) ( not ( = ?auto_34606 ?auto_34609 ) ) ( not ( = ?auto_34607 ?auto_34609 ) ) ( not ( = ?auto_34608 ?auto_34609 ) ) ( HOLDING ?auto_34607 ) ( CLEAR ?auto_34606 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34606 ?auto_34607 )
      ( MAKE-3PILE ?auto_34606 ?auto_34607 ?auto_34608 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34610 - BLOCK
      ?auto_34611 - BLOCK
      ?auto_34612 - BLOCK
    )
    :vars
    (
      ?auto_34613 - BLOCK
      ?auto_34615 - BLOCK
      ?auto_34616 - BLOCK
      ?auto_34614 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34610 ) ( not ( = ?auto_34610 ?auto_34611 ) ) ( not ( = ?auto_34610 ?auto_34612 ) ) ( not ( = ?auto_34611 ?auto_34612 ) ) ( ON ?auto_34612 ?auto_34613 ) ( not ( = ?auto_34610 ?auto_34613 ) ) ( not ( = ?auto_34611 ?auto_34613 ) ) ( not ( = ?auto_34612 ?auto_34613 ) ) ( CLEAR ?auto_34610 ) ( ON ?auto_34611 ?auto_34612 ) ( CLEAR ?auto_34611 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34615 ) ( ON ?auto_34616 ?auto_34615 ) ( ON ?auto_34614 ?auto_34616 ) ( ON ?auto_34613 ?auto_34614 ) ( not ( = ?auto_34615 ?auto_34616 ) ) ( not ( = ?auto_34615 ?auto_34614 ) ) ( not ( = ?auto_34615 ?auto_34613 ) ) ( not ( = ?auto_34615 ?auto_34612 ) ) ( not ( = ?auto_34615 ?auto_34611 ) ) ( not ( = ?auto_34616 ?auto_34614 ) ) ( not ( = ?auto_34616 ?auto_34613 ) ) ( not ( = ?auto_34616 ?auto_34612 ) ) ( not ( = ?auto_34616 ?auto_34611 ) ) ( not ( = ?auto_34614 ?auto_34613 ) ) ( not ( = ?auto_34614 ?auto_34612 ) ) ( not ( = ?auto_34614 ?auto_34611 ) ) ( not ( = ?auto_34610 ?auto_34615 ) ) ( not ( = ?auto_34610 ?auto_34616 ) ) ( not ( = ?auto_34610 ?auto_34614 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34615 ?auto_34616 ?auto_34614 ?auto_34613 ?auto_34612 )
      ( MAKE-3PILE ?auto_34610 ?auto_34611 ?auto_34612 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34617 - BLOCK
      ?auto_34618 - BLOCK
      ?auto_34619 - BLOCK
    )
    :vars
    (
      ?auto_34622 - BLOCK
      ?auto_34620 - BLOCK
      ?auto_34623 - BLOCK
      ?auto_34621 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34617 ?auto_34618 ) ) ( not ( = ?auto_34617 ?auto_34619 ) ) ( not ( = ?auto_34618 ?auto_34619 ) ) ( ON ?auto_34619 ?auto_34622 ) ( not ( = ?auto_34617 ?auto_34622 ) ) ( not ( = ?auto_34618 ?auto_34622 ) ) ( not ( = ?auto_34619 ?auto_34622 ) ) ( ON ?auto_34618 ?auto_34619 ) ( CLEAR ?auto_34618 ) ( ON-TABLE ?auto_34620 ) ( ON ?auto_34623 ?auto_34620 ) ( ON ?auto_34621 ?auto_34623 ) ( ON ?auto_34622 ?auto_34621 ) ( not ( = ?auto_34620 ?auto_34623 ) ) ( not ( = ?auto_34620 ?auto_34621 ) ) ( not ( = ?auto_34620 ?auto_34622 ) ) ( not ( = ?auto_34620 ?auto_34619 ) ) ( not ( = ?auto_34620 ?auto_34618 ) ) ( not ( = ?auto_34623 ?auto_34621 ) ) ( not ( = ?auto_34623 ?auto_34622 ) ) ( not ( = ?auto_34623 ?auto_34619 ) ) ( not ( = ?auto_34623 ?auto_34618 ) ) ( not ( = ?auto_34621 ?auto_34622 ) ) ( not ( = ?auto_34621 ?auto_34619 ) ) ( not ( = ?auto_34621 ?auto_34618 ) ) ( not ( = ?auto_34617 ?auto_34620 ) ) ( not ( = ?auto_34617 ?auto_34623 ) ) ( not ( = ?auto_34617 ?auto_34621 ) ) ( HOLDING ?auto_34617 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34617 )
      ( MAKE-3PILE ?auto_34617 ?auto_34618 ?auto_34619 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34624 - BLOCK
      ?auto_34625 - BLOCK
      ?auto_34626 - BLOCK
    )
    :vars
    (
      ?auto_34627 - BLOCK
      ?auto_34630 - BLOCK
      ?auto_34628 - BLOCK
      ?auto_34629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34624 ?auto_34625 ) ) ( not ( = ?auto_34624 ?auto_34626 ) ) ( not ( = ?auto_34625 ?auto_34626 ) ) ( ON ?auto_34626 ?auto_34627 ) ( not ( = ?auto_34624 ?auto_34627 ) ) ( not ( = ?auto_34625 ?auto_34627 ) ) ( not ( = ?auto_34626 ?auto_34627 ) ) ( ON ?auto_34625 ?auto_34626 ) ( ON-TABLE ?auto_34630 ) ( ON ?auto_34628 ?auto_34630 ) ( ON ?auto_34629 ?auto_34628 ) ( ON ?auto_34627 ?auto_34629 ) ( not ( = ?auto_34630 ?auto_34628 ) ) ( not ( = ?auto_34630 ?auto_34629 ) ) ( not ( = ?auto_34630 ?auto_34627 ) ) ( not ( = ?auto_34630 ?auto_34626 ) ) ( not ( = ?auto_34630 ?auto_34625 ) ) ( not ( = ?auto_34628 ?auto_34629 ) ) ( not ( = ?auto_34628 ?auto_34627 ) ) ( not ( = ?auto_34628 ?auto_34626 ) ) ( not ( = ?auto_34628 ?auto_34625 ) ) ( not ( = ?auto_34629 ?auto_34627 ) ) ( not ( = ?auto_34629 ?auto_34626 ) ) ( not ( = ?auto_34629 ?auto_34625 ) ) ( not ( = ?auto_34624 ?auto_34630 ) ) ( not ( = ?auto_34624 ?auto_34628 ) ) ( not ( = ?auto_34624 ?auto_34629 ) ) ( ON ?auto_34624 ?auto_34625 ) ( CLEAR ?auto_34624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_34630 ?auto_34628 ?auto_34629 ?auto_34627 ?auto_34626 ?auto_34625 )
      ( MAKE-3PILE ?auto_34624 ?auto_34625 ?auto_34626 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34634 - BLOCK
      ?auto_34635 - BLOCK
      ?auto_34636 - BLOCK
    )
    :vars
    (
      ?auto_34637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34637 ?auto_34636 ) ( CLEAR ?auto_34637 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34634 ) ( ON ?auto_34635 ?auto_34634 ) ( ON ?auto_34636 ?auto_34635 ) ( not ( = ?auto_34634 ?auto_34635 ) ) ( not ( = ?auto_34634 ?auto_34636 ) ) ( not ( = ?auto_34634 ?auto_34637 ) ) ( not ( = ?auto_34635 ?auto_34636 ) ) ( not ( = ?auto_34635 ?auto_34637 ) ) ( not ( = ?auto_34636 ?auto_34637 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34637 ?auto_34636 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34638 - BLOCK
      ?auto_34639 - BLOCK
      ?auto_34640 - BLOCK
    )
    :vars
    (
      ?auto_34641 - BLOCK
      ?auto_34642 - BLOCK
      ?auto_34643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34641 ?auto_34640 ) ( CLEAR ?auto_34641 ) ( ON-TABLE ?auto_34638 ) ( ON ?auto_34639 ?auto_34638 ) ( ON ?auto_34640 ?auto_34639 ) ( not ( = ?auto_34638 ?auto_34639 ) ) ( not ( = ?auto_34638 ?auto_34640 ) ) ( not ( = ?auto_34638 ?auto_34641 ) ) ( not ( = ?auto_34639 ?auto_34640 ) ) ( not ( = ?auto_34639 ?auto_34641 ) ) ( not ( = ?auto_34640 ?auto_34641 ) ) ( HOLDING ?auto_34642 ) ( CLEAR ?auto_34643 ) ( not ( = ?auto_34638 ?auto_34642 ) ) ( not ( = ?auto_34638 ?auto_34643 ) ) ( not ( = ?auto_34639 ?auto_34642 ) ) ( not ( = ?auto_34639 ?auto_34643 ) ) ( not ( = ?auto_34640 ?auto_34642 ) ) ( not ( = ?auto_34640 ?auto_34643 ) ) ( not ( = ?auto_34641 ?auto_34642 ) ) ( not ( = ?auto_34641 ?auto_34643 ) ) ( not ( = ?auto_34642 ?auto_34643 ) ) )
    :subtasks
    ( ( !STACK ?auto_34642 ?auto_34643 )
      ( MAKE-3PILE ?auto_34638 ?auto_34639 ?auto_34640 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34644 - BLOCK
      ?auto_34645 - BLOCK
      ?auto_34646 - BLOCK
    )
    :vars
    (
      ?auto_34649 - BLOCK
      ?auto_34648 - BLOCK
      ?auto_34647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34649 ?auto_34646 ) ( ON-TABLE ?auto_34644 ) ( ON ?auto_34645 ?auto_34644 ) ( ON ?auto_34646 ?auto_34645 ) ( not ( = ?auto_34644 ?auto_34645 ) ) ( not ( = ?auto_34644 ?auto_34646 ) ) ( not ( = ?auto_34644 ?auto_34649 ) ) ( not ( = ?auto_34645 ?auto_34646 ) ) ( not ( = ?auto_34645 ?auto_34649 ) ) ( not ( = ?auto_34646 ?auto_34649 ) ) ( CLEAR ?auto_34648 ) ( not ( = ?auto_34644 ?auto_34647 ) ) ( not ( = ?auto_34644 ?auto_34648 ) ) ( not ( = ?auto_34645 ?auto_34647 ) ) ( not ( = ?auto_34645 ?auto_34648 ) ) ( not ( = ?auto_34646 ?auto_34647 ) ) ( not ( = ?auto_34646 ?auto_34648 ) ) ( not ( = ?auto_34649 ?auto_34647 ) ) ( not ( = ?auto_34649 ?auto_34648 ) ) ( not ( = ?auto_34647 ?auto_34648 ) ) ( ON ?auto_34647 ?auto_34649 ) ( CLEAR ?auto_34647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34644 ?auto_34645 ?auto_34646 ?auto_34649 )
      ( MAKE-3PILE ?auto_34644 ?auto_34645 ?auto_34646 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34650 - BLOCK
      ?auto_34651 - BLOCK
      ?auto_34652 - BLOCK
    )
    :vars
    (
      ?auto_34655 - BLOCK
      ?auto_34654 - BLOCK
      ?auto_34653 - BLOCK
      ?auto_34656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34655 ?auto_34652 ) ( ON-TABLE ?auto_34650 ) ( ON ?auto_34651 ?auto_34650 ) ( ON ?auto_34652 ?auto_34651 ) ( not ( = ?auto_34650 ?auto_34651 ) ) ( not ( = ?auto_34650 ?auto_34652 ) ) ( not ( = ?auto_34650 ?auto_34655 ) ) ( not ( = ?auto_34651 ?auto_34652 ) ) ( not ( = ?auto_34651 ?auto_34655 ) ) ( not ( = ?auto_34652 ?auto_34655 ) ) ( not ( = ?auto_34650 ?auto_34654 ) ) ( not ( = ?auto_34650 ?auto_34653 ) ) ( not ( = ?auto_34651 ?auto_34654 ) ) ( not ( = ?auto_34651 ?auto_34653 ) ) ( not ( = ?auto_34652 ?auto_34654 ) ) ( not ( = ?auto_34652 ?auto_34653 ) ) ( not ( = ?auto_34655 ?auto_34654 ) ) ( not ( = ?auto_34655 ?auto_34653 ) ) ( not ( = ?auto_34654 ?auto_34653 ) ) ( ON ?auto_34654 ?auto_34655 ) ( CLEAR ?auto_34654 ) ( HOLDING ?auto_34653 ) ( CLEAR ?auto_34656 ) ( ON-TABLE ?auto_34656 ) ( not ( = ?auto_34656 ?auto_34653 ) ) ( not ( = ?auto_34650 ?auto_34656 ) ) ( not ( = ?auto_34651 ?auto_34656 ) ) ( not ( = ?auto_34652 ?auto_34656 ) ) ( not ( = ?auto_34655 ?auto_34656 ) ) ( not ( = ?auto_34654 ?auto_34656 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34656 ?auto_34653 )
      ( MAKE-3PILE ?auto_34650 ?auto_34651 ?auto_34652 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35348 - BLOCK
      ?auto_35349 - BLOCK
      ?auto_35350 - BLOCK
    )
    :vars
    (
      ?auto_35353 - BLOCK
      ?auto_35352 - BLOCK
      ?auto_35351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35353 ?auto_35350 ) ( ON-TABLE ?auto_35348 ) ( ON ?auto_35349 ?auto_35348 ) ( ON ?auto_35350 ?auto_35349 ) ( not ( = ?auto_35348 ?auto_35349 ) ) ( not ( = ?auto_35348 ?auto_35350 ) ) ( not ( = ?auto_35348 ?auto_35353 ) ) ( not ( = ?auto_35349 ?auto_35350 ) ) ( not ( = ?auto_35349 ?auto_35353 ) ) ( not ( = ?auto_35350 ?auto_35353 ) ) ( not ( = ?auto_35348 ?auto_35352 ) ) ( not ( = ?auto_35348 ?auto_35351 ) ) ( not ( = ?auto_35349 ?auto_35352 ) ) ( not ( = ?auto_35349 ?auto_35351 ) ) ( not ( = ?auto_35350 ?auto_35352 ) ) ( not ( = ?auto_35350 ?auto_35351 ) ) ( not ( = ?auto_35353 ?auto_35352 ) ) ( not ( = ?auto_35353 ?auto_35351 ) ) ( not ( = ?auto_35352 ?auto_35351 ) ) ( ON ?auto_35352 ?auto_35353 ) ( ON ?auto_35351 ?auto_35352 ) ( CLEAR ?auto_35351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35348 ?auto_35349 ?auto_35350 ?auto_35353 ?auto_35352 )
      ( MAKE-3PILE ?auto_35348 ?auto_35349 ?auto_35350 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34664 - BLOCK
      ?auto_34665 - BLOCK
      ?auto_34666 - BLOCK
    )
    :vars
    (
      ?auto_34669 - BLOCK
      ?auto_34667 - BLOCK
      ?auto_34670 - BLOCK
      ?auto_34668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34669 ?auto_34666 ) ( ON-TABLE ?auto_34664 ) ( ON ?auto_34665 ?auto_34664 ) ( ON ?auto_34666 ?auto_34665 ) ( not ( = ?auto_34664 ?auto_34665 ) ) ( not ( = ?auto_34664 ?auto_34666 ) ) ( not ( = ?auto_34664 ?auto_34669 ) ) ( not ( = ?auto_34665 ?auto_34666 ) ) ( not ( = ?auto_34665 ?auto_34669 ) ) ( not ( = ?auto_34666 ?auto_34669 ) ) ( not ( = ?auto_34664 ?auto_34667 ) ) ( not ( = ?auto_34664 ?auto_34670 ) ) ( not ( = ?auto_34665 ?auto_34667 ) ) ( not ( = ?auto_34665 ?auto_34670 ) ) ( not ( = ?auto_34666 ?auto_34667 ) ) ( not ( = ?auto_34666 ?auto_34670 ) ) ( not ( = ?auto_34669 ?auto_34667 ) ) ( not ( = ?auto_34669 ?auto_34670 ) ) ( not ( = ?auto_34667 ?auto_34670 ) ) ( ON ?auto_34667 ?auto_34669 ) ( not ( = ?auto_34668 ?auto_34670 ) ) ( not ( = ?auto_34664 ?auto_34668 ) ) ( not ( = ?auto_34665 ?auto_34668 ) ) ( not ( = ?auto_34666 ?auto_34668 ) ) ( not ( = ?auto_34669 ?auto_34668 ) ) ( not ( = ?auto_34667 ?auto_34668 ) ) ( ON ?auto_34670 ?auto_34667 ) ( CLEAR ?auto_34670 ) ( HOLDING ?auto_34668 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34668 )
      ( MAKE-3PILE ?auto_34664 ?auto_34665 ?auto_34666 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34671 - BLOCK
      ?auto_34672 - BLOCK
      ?auto_34673 - BLOCK
    )
    :vars
    (
      ?auto_34676 - BLOCK
      ?auto_34674 - BLOCK
      ?auto_34675 - BLOCK
      ?auto_34677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34676 ?auto_34673 ) ( ON-TABLE ?auto_34671 ) ( ON ?auto_34672 ?auto_34671 ) ( ON ?auto_34673 ?auto_34672 ) ( not ( = ?auto_34671 ?auto_34672 ) ) ( not ( = ?auto_34671 ?auto_34673 ) ) ( not ( = ?auto_34671 ?auto_34676 ) ) ( not ( = ?auto_34672 ?auto_34673 ) ) ( not ( = ?auto_34672 ?auto_34676 ) ) ( not ( = ?auto_34673 ?auto_34676 ) ) ( not ( = ?auto_34671 ?auto_34674 ) ) ( not ( = ?auto_34671 ?auto_34675 ) ) ( not ( = ?auto_34672 ?auto_34674 ) ) ( not ( = ?auto_34672 ?auto_34675 ) ) ( not ( = ?auto_34673 ?auto_34674 ) ) ( not ( = ?auto_34673 ?auto_34675 ) ) ( not ( = ?auto_34676 ?auto_34674 ) ) ( not ( = ?auto_34676 ?auto_34675 ) ) ( not ( = ?auto_34674 ?auto_34675 ) ) ( ON ?auto_34674 ?auto_34676 ) ( not ( = ?auto_34677 ?auto_34675 ) ) ( not ( = ?auto_34671 ?auto_34677 ) ) ( not ( = ?auto_34672 ?auto_34677 ) ) ( not ( = ?auto_34673 ?auto_34677 ) ) ( not ( = ?auto_34676 ?auto_34677 ) ) ( not ( = ?auto_34674 ?auto_34677 ) ) ( ON ?auto_34675 ?auto_34674 ) ( ON ?auto_34677 ?auto_34675 ) ( CLEAR ?auto_34677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_34671 ?auto_34672 ?auto_34673 ?auto_34676 ?auto_34674 ?auto_34675 )
      ( MAKE-3PILE ?auto_34671 ?auto_34672 ?auto_34673 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34682 - BLOCK
      ?auto_34683 - BLOCK
      ?auto_34684 - BLOCK
      ?auto_34685 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_34685 ) ( CLEAR ?auto_34684 ) ( ON-TABLE ?auto_34682 ) ( ON ?auto_34683 ?auto_34682 ) ( ON ?auto_34684 ?auto_34683 ) ( not ( = ?auto_34682 ?auto_34683 ) ) ( not ( = ?auto_34682 ?auto_34684 ) ) ( not ( = ?auto_34682 ?auto_34685 ) ) ( not ( = ?auto_34683 ?auto_34684 ) ) ( not ( = ?auto_34683 ?auto_34685 ) ) ( not ( = ?auto_34684 ?auto_34685 ) ) )
    :subtasks
    ( ( !STACK ?auto_34685 ?auto_34684 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34686 - BLOCK
      ?auto_34687 - BLOCK
      ?auto_34688 - BLOCK
      ?auto_34689 - BLOCK
    )
    :vars
    (
      ?auto_34690 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_34688 ) ( ON-TABLE ?auto_34686 ) ( ON ?auto_34687 ?auto_34686 ) ( ON ?auto_34688 ?auto_34687 ) ( not ( = ?auto_34686 ?auto_34687 ) ) ( not ( = ?auto_34686 ?auto_34688 ) ) ( not ( = ?auto_34686 ?auto_34689 ) ) ( not ( = ?auto_34687 ?auto_34688 ) ) ( not ( = ?auto_34687 ?auto_34689 ) ) ( not ( = ?auto_34688 ?auto_34689 ) ) ( ON ?auto_34689 ?auto_34690 ) ( CLEAR ?auto_34689 ) ( HAND-EMPTY ) ( not ( = ?auto_34686 ?auto_34690 ) ) ( not ( = ?auto_34687 ?auto_34690 ) ) ( not ( = ?auto_34688 ?auto_34690 ) ) ( not ( = ?auto_34689 ?auto_34690 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34689 ?auto_34690 )
      ( MAKE-4PILE ?auto_34686 ?auto_34687 ?auto_34688 ?auto_34689 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34691 - BLOCK
      ?auto_34692 - BLOCK
      ?auto_34693 - BLOCK
      ?auto_34694 - BLOCK
    )
    :vars
    (
      ?auto_34695 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34691 ) ( ON ?auto_34692 ?auto_34691 ) ( not ( = ?auto_34691 ?auto_34692 ) ) ( not ( = ?auto_34691 ?auto_34693 ) ) ( not ( = ?auto_34691 ?auto_34694 ) ) ( not ( = ?auto_34692 ?auto_34693 ) ) ( not ( = ?auto_34692 ?auto_34694 ) ) ( not ( = ?auto_34693 ?auto_34694 ) ) ( ON ?auto_34694 ?auto_34695 ) ( CLEAR ?auto_34694 ) ( not ( = ?auto_34691 ?auto_34695 ) ) ( not ( = ?auto_34692 ?auto_34695 ) ) ( not ( = ?auto_34693 ?auto_34695 ) ) ( not ( = ?auto_34694 ?auto_34695 ) ) ( HOLDING ?auto_34693 ) ( CLEAR ?auto_34692 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34691 ?auto_34692 ?auto_34693 )
      ( MAKE-4PILE ?auto_34691 ?auto_34692 ?auto_34693 ?auto_34694 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34696 - BLOCK
      ?auto_34697 - BLOCK
      ?auto_34698 - BLOCK
      ?auto_34699 - BLOCK
    )
    :vars
    (
      ?auto_34700 - BLOCK
      ?auto_34701 - BLOCK
      ?auto_34702 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34696 ) ( ON ?auto_34697 ?auto_34696 ) ( not ( = ?auto_34696 ?auto_34697 ) ) ( not ( = ?auto_34696 ?auto_34698 ) ) ( not ( = ?auto_34696 ?auto_34699 ) ) ( not ( = ?auto_34697 ?auto_34698 ) ) ( not ( = ?auto_34697 ?auto_34699 ) ) ( not ( = ?auto_34698 ?auto_34699 ) ) ( ON ?auto_34699 ?auto_34700 ) ( not ( = ?auto_34696 ?auto_34700 ) ) ( not ( = ?auto_34697 ?auto_34700 ) ) ( not ( = ?auto_34698 ?auto_34700 ) ) ( not ( = ?auto_34699 ?auto_34700 ) ) ( CLEAR ?auto_34697 ) ( ON ?auto_34698 ?auto_34699 ) ( CLEAR ?auto_34698 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34701 ) ( ON ?auto_34702 ?auto_34701 ) ( ON ?auto_34700 ?auto_34702 ) ( not ( = ?auto_34701 ?auto_34702 ) ) ( not ( = ?auto_34701 ?auto_34700 ) ) ( not ( = ?auto_34701 ?auto_34699 ) ) ( not ( = ?auto_34701 ?auto_34698 ) ) ( not ( = ?auto_34702 ?auto_34700 ) ) ( not ( = ?auto_34702 ?auto_34699 ) ) ( not ( = ?auto_34702 ?auto_34698 ) ) ( not ( = ?auto_34696 ?auto_34701 ) ) ( not ( = ?auto_34696 ?auto_34702 ) ) ( not ( = ?auto_34697 ?auto_34701 ) ) ( not ( = ?auto_34697 ?auto_34702 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34701 ?auto_34702 ?auto_34700 ?auto_34699 )
      ( MAKE-4PILE ?auto_34696 ?auto_34697 ?auto_34698 ?auto_34699 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34703 - BLOCK
      ?auto_34704 - BLOCK
      ?auto_34705 - BLOCK
      ?auto_34706 - BLOCK
    )
    :vars
    (
      ?auto_34709 - BLOCK
      ?auto_34708 - BLOCK
      ?auto_34707 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34703 ) ( not ( = ?auto_34703 ?auto_34704 ) ) ( not ( = ?auto_34703 ?auto_34705 ) ) ( not ( = ?auto_34703 ?auto_34706 ) ) ( not ( = ?auto_34704 ?auto_34705 ) ) ( not ( = ?auto_34704 ?auto_34706 ) ) ( not ( = ?auto_34705 ?auto_34706 ) ) ( ON ?auto_34706 ?auto_34709 ) ( not ( = ?auto_34703 ?auto_34709 ) ) ( not ( = ?auto_34704 ?auto_34709 ) ) ( not ( = ?auto_34705 ?auto_34709 ) ) ( not ( = ?auto_34706 ?auto_34709 ) ) ( ON ?auto_34705 ?auto_34706 ) ( CLEAR ?auto_34705 ) ( ON-TABLE ?auto_34708 ) ( ON ?auto_34707 ?auto_34708 ) ( ON ?auto_34709 ?auto_34707 ) ( not ( = ?auto_34708 ?auto_34707 ) ) ( not ( = ?auto_34708 ?auto_34709 ) ) ( not ( = ?auto_34708 ?auto_34706 ) ) ( not ( = ?auto_34708 ?auto_34705 ) ) ( not ( = ?auto_34707 ?auto_34709 ) ) ( not ( = ?auto_34707 ?auto_34706 ) ) ( not ( = ?auto_34707 ?auto_34705 ) ) ( not ( = ?auto_34703 ?auto_34708 ) ) ( not ( = ?auto_34703 ?auto_34707 ) ) ( not ( = ?auto_34704 ?auto_34708 ) ) ( not ( = ?auto_34704 ?auto_34707 ) ) ( HOLDING ?auto_34704 ) ( CLEAR ?auto_34703 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34703 ?auto_34704 )
      ( MAKE-4PILE ?auto_34703 ?auto_34704 ?auto_34705 ?auto_34706 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34710 - BLOCK
      ?auto_34711 - BLOCK
      ?auto_34712 - BLOCK
      ?auto_34713 - BLOCK
    )
    :vars
    (
      ?auto_34715 - BLOCK
      ?auto_34714 - BLOCK
      ?auto_34716 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34710 ) ( not ( = ?auto_34710 ?auto_34711 ) ) ( not ( = ?auto_34710 ?auto_34712 ) ) ( not ( = ?auto_34710 ?auto_34713 ) ) ( not ( = ?auto_34711 ?auto_34712 ) ) ( not ( = ?auto_34711 ?auto_34713 ) ) ( not ( = ?auto_34712 ?auto_34713 ) ) ( ON ?auto_34713 ?auto_34715 ) ( not ( = ?auto_34710 ?auto_34715 ) ) ( not ( = ?auto_34711 ?auto_34715 ) ) ( not ( = ?auto_34712 ?auto_34715 ) ) ( not ( = ?auto_34713 ?auto_34715 ) ) ( ON ?auto_34712 ?auto_34713 ) ( ON-TABLE ?auto_34714 ) ( ON ?auto_34716 ?auto_34714 ) ( ON ?auto_34715 ?auto_34716 ) ( not ( = ?auto_34714 ?auto_34716 ) ) ( not ( = ?auto_34714 ?auto_34715 ) ) ( not ( = ?auto_34714 ?auto_34713 ) ) ( not ( = ?auto_34714 ?auto_34712 ) ) ( not ( = ?auto_34716 ?auto_34715 ) ) ( not ( = ?auto_34716 ?auto_34713 ) ) ( not ( = ?auto_34716 ?auto_34712 ) ) ( not ( = ?auto_34710 ?auto_34714 ) ) ( not ( = ?auto_34710 ?auto_34716 ) ) ( not ( = ?auto_34711 ?auto_34714 ) ) ( not ( = ?auto_34711 ?auto_34716 ) ) ( CLEAR ?auto_34710 ) ( ON ?auto_34711 ?auto_34712 ) ( CLEAR ?auto_34711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34714 ?auto_34716 ?auto_34715 ?auto_34713 ?auto_34712 )
      ( MAKE-4PILE ?auto_34710 ?auto_34711 ?auto_34712 ?auto_34713 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34717 - BLOCK
      ?auto_34718 - BLOCK
      ?auto_34719 - BLOCK
      ?auto_34720 - BLOCK
    )
    :vars
    (
      ?auto_34721 - BLOCK
      ?auto_34722 - BLOCK
      ?auto_34723 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34717 ?auto_34718 ) ) ( not ( = ?auto_34717 ?auto_34719 ) ) ( not ( = ?auto_34717 ?auto_34720 ) ) ( not ( = ?auto_34718 ?auto_34719 ) ) ( not ( = ?auto_34718 ?auto_34720 ) ) ( not ( = ?auto_34719 ?auto_34720 ) ) ( ON ?auto_34720 ?auto_34721 ) ( not ( = ?auto_34717 ?auto_34721 ) ) ( not ( = ?auto_34718 ?auto_34721 ) ) ( not ( = ?auto_34719 ?auto_34721 ) ) ( not ( = ?auto_34720 ?auto_34721 ) ) ( ON ?auto_34719 ?auto_34720 ) ( ON-TABLE ?auto_34722 ) ( ON ?auto_34723 ?auto_34722 ) ( ON ?auto_34721 ?auto_34723 ) ( not ( = ?auto_34722 ?auto_34723 ) ) ( not ( = ?auto_34722 ?auto_34721 ) ) ( not ( = ?auto_34722 ?auto_34720 ) ) ( not ( = ?auto_34722 ?auto_34719 ) ) ( not ( = ?auto_34723 ?auto_34721 ) ) ( not ( = ?auto_34723 ?auto_34720 ) ) ( not ( = ?auto_34723 ?auto_34719 ) ) ( not ( = ?auto_34717 ?auto_34722 ) ) ( not ( = ?auto_34717 ?auto_34723 ) ) ( not ( = ?auto_34718 ?auto_34722 ) ) ( not ( = ?auto_34718 ?auto_34723 ) ) ( ON ?auto_34718 ?auto_34719 ) ( CLEAR ?auto_34718 ) ( HOLDING ?auto_34717 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34717 )
      ( MAKE-4PILE ?auto_34717 ?auto_34718 ?auto_34719 ?auto_34720 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34724 - BLOCK
      ?auto_34725 - BLOCK
      ?auto_34726 - BLOCK
      ?auto_34727 - BLOCK
    )
    :vars
    (
      ?auto_34730 - BLOCK
      ?auto_34729 - BLOCK
      ?auto_34728 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34724 ?auto_34725 ) ) ( not ( = ?auto_34724 ?auto_34726 ) ) ( not ( = ?auto_34724 ?auto_34727 ) ) ( not ( = ?auto_34725 ?auto_34726 ) ) ( not ( = ?auto_34725 ?auto_34727 ) ) ( not ( = ?auto_34726 ?auto_34727 ) ) ( ON ?auto_34727 ?auto_34730 ) ( not ( = ?auto_34724 ?auto_34730 ) ) ( not ( = ?auto_34725 ?auto_34730 ) ) ( not ( = ?auto_34726 ?auto_34730 ) ) ( not ( = ?auto_34727 ?auto_34730 ) ) ( ON ?auto_34726 ?auto_34727 ) ( ON-TABLE ?auto_34729 ) ( ON ?auto_34728 ?auto_34729 ) ( ON ?auto_34730 ?auto_34728 ) ( not ( = ?auto_34729 ?auto_34728 ) ) ( not ( = ?auto_34729 ?auto_34730 ) ) ( not ( = ?auto_34729 ?auto_34727 ) ) ( not ( = ?auto_34729 ?auto_34726 ) ) ( not ( = ?auto_34728 ?auto_34730 ) ) ( not ( = ?auto_34728 ?auto_34727 ) ) ( not ( = ?auto_34728 ?auto_34726 ) ) ( not ( = ?auto_34724 ?auto_34729 ) ) ( not ( = ?auto_34724 ?auto_34728 ) ) ( not ( = ?auto_34725 ?auto_34729 ) ) ( not ( = ?auto_34725 ?auto_34728 ) ) ( ON ?auto_34725 ?auto_34726 ) ( ON ?auto_34724 ?auto_34725 ) ( CLEAR ?auto_34724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_34729 ?auto_34728 ?auto_34730 ?auto_34727 ?auto_34726 ?auto_34725 )
      ( MAKE-4PILE ?auto_34724 ?auto_34725 ?auto_34726 ?auto_34727 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34733 - BLOCK
      ?auto_34734 - BLOCK
    )
    :vars
    (
      ?auto_34735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34735 ?auto_34734 ) ( CLEAR ?auto_34735 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34733 ) ( ON ?auto_34734 ?auto_34733 ) ( not ( = ?auto_34733 ?auto_34734 ) ) ( not ( = ?auto_34733 ?auto_34735 ) ) ( not ( = ?auto_34734 ?auto_34735 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34735 ?auto_34734 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34736 - BLOCK
      ?auto_34737 - BLOCK
    )
    :vars
    (
      ?auto_34738 - BLOCK
      ?auto_34739 - BLOCK
      ?auto_34740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34738 ?auto_34737 ) ( CLEAR ?auto_34738 ) ( ON-TABLE ?auto_34736 ) ( ON ?auto_34737 ?auto_34736 ) ( not ( = ?auto_34736 ?auto_34737 ) ) ( not ( = ?auto_34736 ?auto_34738 ) ) ( not ( = ?auto_34737 ?auto_34738 ) ) ( HOLDING ?auto_34739 ) ( CLEAR ?auto_34740 ) ( not ( = ?auto_34736 ?auto_34739 ) ) ( not ( = ?auto_34736 ?auto_34740 ) ) ( not ( = ?auto_34737 ?auto_34739 ) ) ( not ( = ?auto_34737 ?auto_34740 ) ) ( not ( = ?auto_34738 ?auto_34739 ) ) ( not ( = ?auto_34738 ?auto_34740 ) ) ( not ( = ?auto_34739 ?auto_34740 ) ) )
    :subtasks
    ( ( !STACK ?auto_34739 ?auto_34740 )
      ( MAKE-2PILE ?auto_34736 ?auto_34737 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34741 - BLOCK
      ?auto_34742 - BLOCK
    )
    :vars
    (
      ?auto_34743 - BLOCK
      ?auto_34744 - BLOCK
      ?auto_34745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34743 ?auto_34742 ) ( ON-TABLE ?auto_34741 ) ( ON ?auto_34742 ?auto_34741 ) ( not ( = ?auto_34741 ?auto_34742 ) ) ( not ( = ?auto_34741 ?auto_34743 ) ) ( not ( = ?auto_34742 ?auto_34743 ) ) ( CLEAR ?auto_34744 ) ( not ( = ?auto_34741 ?auto_34745 ) ) ( not ( = ?auto_34741 ?auto_34744 ) ) ( not ( = ?auto_34742 ?auto_34745 ) ) ( not ( = ?auto_34742 ?auto_34744 ) ) ( not ( = ?auto_34743 ?auto_34745 ) ) ( not ( = ?auto_34743 ?auto_34744 ) ) ( not ( = ?auto_34745 ?auto_34744 ) ) ( ON ?auto_34745 ?auto_34743 ) ( CLEAR ?auto_34745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34741 ?auto_34742 ?auto_34743 )
      ( MAKE-2PILE ?auto_34741 ?auto_34742 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34746 - BLOCK
      ?auto_34747 - BLOCK
    )
    :vars
    (
      ?auto_34748 - BLOCK
      ?auto_34750 - BLOCK
      ?auto_34749 - BLOCK
      ?auto_34751 - BLOCK
      ?auto_34752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34748 ?auto_34747 ) ( ON-TABLE ?auto_34746 ) ( ON ?auto_34747 ?auto_34746 ) ( not ( = ?auto_34746 ?auto_34747 ) ) ( not ( = ?auto_34746 ?auto_34748 ) ) ( not ( = ?auto_34747 ?auto_34748 ) ) ( not ( = ?auto_34746 ?auto_34750 ) ) ( not ( = ?auto_34746 ?auto_34749 ) ) ( not ( = ?auto_34747 ?auto_34750 ) ) ( not ( = ?auto_34747 ?auto_34749 ) ) ( not ( = ?auto_34748 ?auto_34750 ) ) ( not ( = ?auto_34748 ?auto_34749 ) ) ( not ( = ?auto_34750 ?auto_34749 ) ) ( ON ?auto_34750 ?auto_34748 ) ( CLEAR ?auto_34750 ) ( HOLDING ?auto_34749 ) ( CLEAR ?auto_34751 ) ( ON-TABLE ?auto_34752 ) ( ON ?auto_34751 ?auto_34752 ) ( not ( = ?auto_34752 ?auto_34751 ) ) ( not ( = ?auto_34752 ?auto_34749 ) ) ( not ( = ?auto_34751 ?auto_34749 ) ) ( not ( = ?auto_34746 ?auto_34751 ) ) ( not ( = ?auto_34746 ?auto_34752 ) ) ( not ( = ?auto_34747 ?auto_34751 ) ) ( not ( = ?auto_34747 ?auto_34752 ) ) ( not ( = ?auto_34748 ?auto_34751 ) ) ( not ( = ?auto_34748 ?auto_34752 ) ) ( not ( = ?auto_34750 ?auto_34751 ) ) ( not ( = ?auto_34750 ?auto_34752 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34752 ?auto_34751 ?auto_34749 )
      ( MAKE-2PILE ?auto_34746 ?auto_34747 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34753 - BLOCK
      ?auto_34754 - BLOCK
    )
    :vars
    (
      ?auto_34756 - BLOCK
      ?auto_34755 - BLOCK
      ?auto_34757 - BLOCK
      ?auto_34758 - BLOCK
      ?auto_34759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34756 ?auto_34754 ) ( ON-TABLE ?auto_34753 ) ( ON ?auto_34754 ?auto_34753 ) ( not ( = ?auto_34753 ?auto_34754 ) ) ( not ( = ?auto_34753 ?auto_34756 ) ) ( not ( = ?auto_34754 ?auto_34756 ) ) ( not ( = ?auto_34753 ?auto_34755 ) ) ( not ( = ?auto_34753 ?auto_34757 ) ) ( not ( = ?auto_34754 ?auto_34755 ) ) ( not ( = ?auto_34754 ?auto_34757 ) ) ( not ( = ?auto_34756 ?auto_34755 ) ) ( not ( = ?auto_34756 ?auto_34757 ) ) ( not ( = ?auto_34755 ?auto_34757 ) ) ( ON ?auto_34755 ?auto_34756 ) ( CLEAR ?auto_34758 ) ( ON-TABLE ?auto_34759 ) ( ON ?auto_34758 ?auto_34759 ) ( not ( = ?auto_34759 ?auto_34758 ) ) ( not ( = ?auto_34759 ?auto_34757 ) ) ( not ( = ?auto_34758 ?auto_34757 ) ) ( not ( = ?auto_34753 ?auto_34758 ) ) ( not ( = ?auto_34753 ?auto_34759 ) ) ( not ( = ?auto_34754 ?auto_34758 ) ) ( not ( = ?auto_34754 ?auto_34759 ) ) ( not ( = ?auto_34756 ?auto_34758 ) ) ( not ( = ?auto_34756 ?auto_34759 ) ) ( not ( = ?auto_34755 ?auto_34758 ) ) ( not ( = ?auto_34755 ?auto_34759 ) ) ( ON ?auto_34757 ?auto_34755 ) ( CLEAR ?auto_34757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34753 ?auto_34754 ?auto_34756 ?auto_34755 )
      ( MAKE-2PILE ?auto_34753 ?auto_34754 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34760 - BLOCK
      ?auto_34761 - BLOCK
    )
    :vars
    (
      ?auto_34766 - BLOCK
      ?auto_34764 - BLOCK
      ?auto_34762 - BLOCK
      ?auto_34763 - BLOCK
      ?auto_34765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34766 ?auto_34761 ) ( ON-TABLE ?auto_34760 ) ( ON ?auto_34761 ?auto_34760 ) ( not ( = ?auto_34760 ?auto_34761 ) ) ( not ( = ?auto_34760 ?auto_34766 ) ) ( not ( = ?auto_34761 ?auto_34766 ) ) ( not ( = ?auto_34760 ?auto_34764 ) ) ( not ( = ?auto_34760 ?auto_34762 ) ) ( not ( = ?auto_34761 ?auto_34764 ) ) ( not ( = ?auto_34761 ?auto_34762 ) ) ( not ( = ?auto_34766 ?auto_34764 ) ) ( not ( = ?auto_34766 ?auto_34762 ) ) ( not ( = ?auto_34764 ?auto_34762 ) ) ( ON ?auto_34764 ?auto_34766 ) ( ON-TABLE ?auto_34763 ) ( not ( = ?auto_34763 ?auto_34765 ) ) ( not ( = ?auto_34763 ?auto_34762 ) ) ( not ( = ?auto_34765 ?auto_34762 ) ) ( not ( = ?auto_34760 ?auto_34765 ) ) ( not ( = ?auto_34760 ?auto_34763 ) ) ( not ( = ?auto_34761 ?auto_34765 ) ) ( not ( = ?auto_34761 ?auto_34763 ) ) ( not ( = ?auto_34766 ?auto_34765 ) ) ( not ( = ?auto_34766 ?auto_34763 ) ) ( not ( = ?auto_34764 ?auto_34765 ) ) ( not ( = ?auto_34764 ?auto_34763 ) ) ( ON ?auto_34762 ?auto_34764 ) ( CLEAR ?auto_34762 ) ( HOLDING ?auto_34765 ) ( CLEAR ?auto_34763 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34763 ?auto_34765 )
      ( MAKE-2PILE ?auto_34760 ?auto_34761 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35538 - BLOCK
      ?auto_35539 - BLOCK
    )
    :vars
    (
      ?auto_35542 - BLOCK
      ?auto_35541 - BLOCK
      ?auto_35540 - BLOCK
      ?auto_35543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35542 ?auto_35539 ) ( ON-TABLE ?auto_35538 ) ( ON ?auto_35539 ?auto_35538 ) ( not ( = ?auto_35538 ?auto_35539 ) ) ( not ( = ?auto_35538 ?auto_35542 ) ) ( not ( = ?auto_35539 ?auto_35542 ) ) ( not ( = ?auto_35538 ?auto_35541 ) ) ( not ( = ?auto_35538 ?auto_35540 ) ) ( not ( = ?auto_35539 ?auto_35541 ) ) ( not ( = ?auto_35539 ?auto_35540 ) ) ( not ( = ?auto_35542 ?auto_35541 ) ) ( not ( = ?auto_35542 ?auto_35540 ) ) ( not ( = ?auto_35541 ?auto_35540 ) ) ( ON ?auto_35541 ?auto_35542 ) ( not ( = ?auto_35543 ?auto_35540 ) ) ( not ( = ?auto_35538 ?auto_35543 ) ) ( not ( = ?auto_35539 ?auto_35543 ) ) ( not ( = ?auto_35542 ?auto_35543 ) ) ( not ( = ?auto_35541 ?auto_35543 ) ) ( ON ?auto_35540 ?auto_35541 ) ( ON ?auto_35543 ?auto_35540 ) ( CLEAR ?auto_35543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35538 ?auto_35539 ?auto_35542 ?auto_35541 ?auto_35540 )
      ( MAKE-2PILE ?auto_35538 ?auto_35539 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34774 - BLOCK
      ?auto_34775 - BLOCK
    )
    :vars
    (
      ?auto_34780 - BLOCK
      ?auto_34777 - BLOCK
      ?auto_34779 - BLOCK
      ?auto_34778 - BLOCK
      ?auto_34776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34780 ?auto_34775 ) ( ON-TABLE ?auto_34774 ) ( ON ?auto_34775 ?auto_34774 ) ( not ( = ?auto_34774 ?auto_34775 ) ) ( not ( = ?auto_34774 ?auto_34780 ) ) ( not ( = ?auto_34775 ?auto_34780 ) ) ( not ( = ?auto_34774 ?auto_34777 ) ) ( not ( = ?auto_34774 ?auto_34779 ) ) ( not ( = ?auto_34775 ?auto_34777 ) ) ( not ( = ?auto_34775 ?auto_34779 ) ) ( not ( = ?auto_34780 ?auto_34777 ) ) ( not ( = ?auto_34780 ?auto_34779 ) ) ( not ( = ?auto_34777 ?auto_34779 ) ) ( ON ?auto_34777 ?auto_34780 ) ( not ( = ?auto_34778 ?auto_34776 ) ) ( not ( = ?auto_34778 ?auto_34779 ) ) ( not ( = ?auto_34776 ?auto_34779 ) ) ( not ( = ?auto_34774 ?auto_34776 ) ) ( not ( = ?auto_34774 ?auto_34778 ) ) ( not ( = ?auto_34775 ?auto_34776 ) ) ( not ( = ?auto_34775 ?auto_34778 ) ) ( not ( = ?auto_34780 ?auto_34776 ) ) ( not ( = ?auto_34780 ?auto_34778 ) ) ( not ( = ?auto_34777 ?auto_34776 ) ) ( not ( = ?auto_34777 ?auto_34778 ) ) ( ON ?auto_34779 ?auto_34777 ) ( ON ?auto_34776 ?auto_34779 ) ( CLEAR ?auto_34776 ) ( HOLDING ?auto_34778 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34778 )
      ( MAKE-2PILE ?auto_34774 ?auto_34775 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34781 - BLOCK
      ?auto_34782 - BLOCK
    )
    :vars
    (
      ?auto_34784 - BLOCK
      ?auto_34787 - BLOCK
      ?auto_34786 - BLOCK
      ?auto_34785 - BLOCK
      ?auto_34783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34784 ?auto_34782 ) ( ON-TABLE ?auto_34781 ) ( ON ?auto_34782 ?auto_34781 ) ( not ( = ?auto_34781 ?auto_34782 ) ) ( not ( = ?auto_34781 ?auto_34784 ) ) ( not ( = ?auto_34782 ?auto_34784 ) ) ( not ( = ?auto_34781 ?auto_34787 ) ) ( not ( = ?auto_34781 ?auto_34786 ) ) ( not ( = ?auto_34782 ?auto_34787 ) ) ( not ( = ?auto_34782 ?auto_34786 ) ) ( not ( = ?auto_34784 ?auto_34787 ) ) ( not ( = ?auto_34784 ?auto_34786 ) ) ( not ( = ?auto_34787 ?auto_34786 ) ) ( ON ?auto_34787 ?auto_34784 ) ( not ( = ?auto_34785 ?auto_34783 ) ) ( not ( = ?auto_34785 ?auto_34786 ) ) ( not ( = ?auto_34783 ?auto_34786 ) ) ( not ( = ?auto_34781 ?auto_34783 ) ) ( not ( = ?auto_34781 ?auto_34785 ) ) ( not ( = ?auto_34782 ?auto_34783 ) ) ( not ( = ?auto_34782 ?auto_34785 ) ) ( not ( = ?auto_34784 ?auto_34783 ) ) ( not ( = ?auto_34784 ?auto_34785 ) ) ( not ( = ?auto_34787 ?auto_34783 ) ) ( not ( = ?auto_34787 ?auto_34785 ) ) ( ON ?auto_34786 ?auto_34787 ) ( ON ?auto_34783 ?auto_34786 ) ( ON ?auto_34785 ?auto_34783 ) ( CLEAR ?auto_34785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_34781 ?auto_34782 ?auto_34784 ?auto_34787 ?auto_34786 ?auto_34783 )
      ( MAKE-2PILE ?auto_34781 ?auto_34782 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34793 - BLOCK
      ?auto_34794 - BLOCK
      ?auto_34795 - BLOCK
      ?auto_34796 - BLOCK
      ?auto_34797 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_34797 ) ( CLEAR ?auto_34796 ) ( ON-TABLE ?auto_34793 ) ( ON ?auto_34794 ?auto_34793 ) ( ON ?auto_34795 ?auto_34794 ) ( ON ?auto_34796 ?auto_34795 ) ( not ( = ?auto_34793 ?auto_34794 ) ) ( not ( = ?auto_34793 ?auto_34795 ) ) ( not ( = ?auto_34793 ?auto_34796 ) ) ( not ( = ?auto_34793 ?auto_34797 ) ) ( not ( = ?auto_34794 ?auto_34795 ) ) ( not ( = ?auto_34794 ?auto_34796 ) ) ( not ( = ?auto_34794 ?auto_34797 ) ) ( not ( = ?auto_34795 ?auto_34796 ) ) ( not ( = ?auto_34795 ?auto_34797 ) ) ( not ( = ?auto_34796 ?auto_34797 ) ) )
    :subtasks
    ( ( !STACK ?auto_34797 ?auto_34796 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34798 - BLOCK
      ?auto_34799 - BLOCK
      ?auto_34800 - BLOCK
      ?auto_34801 - BLOCK
      ?auto_34802 - BLOCK
    )
    :vars
    (
      ?auto_34803 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_34801 ) ( ON-TABLE ?auto_34798 ) ( ON ?auto_34799 ?auto_34798 ) ( ON ?auto_34800 ?auto_34799 ) ( ON ?auto_34801 ?auto_34800 ) ( not ( = ?auto_34798 ?auto_34799 ) ) ( not ( = ?auto_34798 ?auto_34800 ) ) ( not ( = ?auto_34798 ?auto_34801 ) ) ( not ( = ?auto_34798 ?auto_34802 ) ) ( not ( = ?auto_34799 ?auto_34800 ) ) ( not ( = ?auto_34799 ?auto_34801 ) ) ( not ( = ?auto_34799 ?auto_34802 ) ) ( not ( = ?auto_34800 ?auto_34801 ) ) ( not ( = ?auto_34800 ?auto_34802 ) ) ( not ( = ?auto_34801 ?auto_34802 ) ) ( ON ?auto_34802 ?auto_34803 ) ( CLEAR ?auto_34802 ) ( HAND-EMPTY ) ( not ( = ?auto_34798 ?auto_34803 ) ) ( not ( = ?auto_34799 ?auto_34803 ) ) ( not ( = ?auto_34800 ?auto_34803 ) ) ( not ( = ?auto_34801 ?auto_34803 ) ) ( not ( = ?auto_34802 ?auto_34803 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34802 ?auto_34803 )
      ( MAKE-5PILE ?auto_34798 ?auto_34799 ?auto_34800 ?auto_34801 ?auto_34802 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34804 - BLOCK
      ?auto_34805 - BLOCK
      ?auto_34806 - BLOCK
      ?auto_34807 - BLOCK
      ?auto_34808 - BLOCK
    )
    :vars
    (
      ?auto_34809 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34804 ) ( ON ?auto_34805 ?auto_34804 ) ( ON ?auto_34806 ?auto_34805 ) ( not ( = ?auto_34804 ?auto_34805 ) ) ( not ( = ?auto_34804 ?auto_34806 ) ) ( not ( = ?auto_34804 ?auto_34807 ) ) ( not ( = ?auto_34804 ?auto_34808 ) ) ( not ( = ?auto_34805 ?auto_34806 ) ) ( not ( = ?auto_34805 ?auto_34807 ) ) ( not ( = ?auto_34805 ?auto_34808 ) ) ( not ( = ?auto_34806 ?auto_34807 ) ) ( not ( = ?auto_34806 ?auto_34808 ) ) ( not ( = ?auto_34807 ?auto_34808 ) ) ( ON ?auto_34808 ?auto_34809 ) ( CLEAR ?auto_34808 ) ( not ( = ?auto_34804 ?auto_34809 ) ) ( not ( = ?auto_34805 ?auto_34809 ) ) ( not ( = ?auto_34806 ?auto_34809 ) ) ( not ( = ?auto_34807 ?auto_34809 ) ) ( not ( = ?auto_34808 ?auto_34809 ) ) ( HOLDING ?auto_34807 ) ( CLEAR ?auto_34806 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34804 ?auto_34805 ?auto_34806 ?auto_34807 )
      ( MAKE-5PILE ?auto_34804 ?auto_34805 ?auto_34806 ?auto_34807 ?auto_34808 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34810 - BLOCK
      ?auto_34811 - BLOCK
      ?auto_34812 - BLOCK
      ?auto_34813 - BLOCK
      ?auto_34814 - BLOCK
    )
    :vars
    (
      ?auto_34815 - BLOCK
      ?auto_34816 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34810 ) ( ON ?auto_34811 ?auto_34810 ) ( ON ?auto_34812 ?auto_34811 ) ( not ( = ?auto_34810 ?auto_34811 ) ) ( not ( = ?auto_34810 ?auto_34812 ) ) ( not ( = ?auto_34810 ?auto_34813 ) ) ( not ( = ?auto_34810 ?auto_34814 ) ) ( not ( = ?auto_34811 ?auto_34812 ) ) ( not ( = ?auto_34811 ?auto_34813 ) ) ( not ( = ?auto_34811 ?auto_34814 ) ) ( not ( = ?auto_34812 ?auto_34813 ) ) ( not ( = ?auto_34812 ?auto_34814 ) ) ( not ( = ?auto_34813 ?auto_34814 ) ) ( ON ?auto_34814 ?auto_34815 ) ( not ( = ?auto_34810 ?auto_34815 ) ) ( not ( = ?auto_34811 ?auto_34815 ) ) ( not ( = ?auto_34812 ?auto_34815 ) ) ( not ( = ?auto_34813 ?auto_34815 ) ) ( not ( = ?auto_34814 ?auto_34815 ) ) ( CLEAR ?auto_34812 ) ( ON ?auto_34813 ?auto_34814 ) ( CLEAR ?auto_34813 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34816 ) ( ON ?auto_34815 ?auto_34816 ) ( not ( = ?auto_34816 ?auto_34815 ) ) ( not ( = ?auto_34816 ?auto_34814 ) ) ( not ( = ?auto_34816 ?auto_34813 ) ) ( not ( = ?auto_34810 ?auto_34816 ) ) ( not ( = ?auto_34811 ?auto_34816 ) ) ( not ( = ?auto_34812 ?auto_34816 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34816 ?auto_34815 ?auto_34814 )
      ( MAKE-5PILE ?auto_34810 ?auto_34811 ?auto_34812 ?auto_34813 ?auto_34814 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34817 - BLOCK
      ?auto_34818 - BLOCK
      ?auto_34819 - BLOCK
      ?auto_34820 - BLOCK
      ?auto_34821 - BLOCK
    )
    :vars
    (
      ?auto_34822 - BLOCK
      ?auto_34823 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34817 ) ( ON ?auto_34818 ?auto_34817 ) ( not ( = ?auto_34817 ?auto_34818 ) ) ( not ( = ?auto_34817 ?auto_34819 ) ) ( not ( = ?auto_34817 ?auto_34820 ) ) ( not ( = ?auto_34817 ?auto_34821 ) ) ( not ( = ?auto_34818 ?auto_34819 ) ) ( not ( = ?auto_34818 ?auto_34820 ) ) ( not ( = ?auto_34818 ?auto_34821 ) ) ( not ( = ?auto_34819 ?auto_34820 ) ) ( not ( = ?auto_34819 ?auto_34821 ) ) ( not ( = ?auto_34820 ?auto_34821 ) ) ( ON ?auto_34821 ?auto_34822 ) ( not ( = ?auto_34817 ?auto_34822 ) ) ( not ( = ?auto_34818 ?auto_34822 ) ) ( not ( = ?auto_34819 ?auto_34822 ) ) ( not ( = ?auto_34820 ?auto_34822 ) ) ( not ( = ?auto_34821 ?auto_34822 ) ) ( ON ?auto_34820 ?auto_34821 ) ( CLEAR ?auto_34820 ) ( ON-TABLE ?auto_34823 ) ( ON ?auto_34822 ?auto_34823 ) ( not ( = ?auto_34823 ?auto_34822 ) ) ( not ( = ?auto_34823 ?auto_34821 ) ) ( not ( = ?auto_34823 ?auto_34820 ) ) ( not ( = ?auto_34817 ?auto_34823 ) ) ( not ( = ?auto_34818 ?auto_34823 ) ) ( not ( = ?auto_34819 ?auto_34823 ) ) ( HOLDING ?auto_34819 ) ( CLEAR ?auto_34818 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34817 ?auto_34818 ?auto_34819 )
      ( MAKE-5PILE ?auto_34817 ?auto_34818 ?auto_34819 ?auto_34820 ?auto_34821 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34824 - BLOCK
      ?auto_34825 - BLOCK
      ?auto_34826 - BLOCK
      ?auto_34827 - BLOCK
      ?auto_34828 - BLOCK
    )
    :vars
    (
      ?auto_34829 - BLOCK
      ?auto_34830 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34824 ) ( ON ?auto_34825 ?auto_34824 ) ( not ( = ?auto_34824 ?auto_34825 ) ) ( not ( = ?auto_34824 ?auto_34826 ) ) ( not ( = ?auto_34824 ?auto_34827 ) ) ( not ( = ?auto_34824 ?auto_34828 ) ) ( not ( = ?auto_34825 ?auto_34826 ) ) ( not ( = ?auto_34825 ?auto_34827 ) ) ( not ( = ?auto_34825 ?auto_34828 ) ) ( not ( = ?auto_34826 ?auto_34827 ) ) ( not ( = ?auto_34826 ?auto_34828 ) ) ( not ( = ?auto_34827 ?auto_34828 ) ) ( ON ?auto_34828 ?auto_34829 ) ( not ( = ?auto_34824 ?auto_34829 ) ) ( not ( = ?auto_34825 ?auto_34829 ) ) ( not ( = ?auto_34826 ?auto_34829 ) ) ( not ( = ?auto_34827 ?auto_34829 ) ) ( not ( = ?auto_34828 ?auto_34829 ) ) ( ON ?auto_34827 ?auto_34828 ) ( ON-TABLE ?auto_34830 ) ( ON ?auto_34829 ?auto_34830 ) ( not ( = ?auto_34830 ?auto_34829 ) ) ( not ( = ?auto_34830 ?auto_34828 ) ) ( not ( = ?auto_34830 ?auto_34827 ) ) ( not ( = ?auto_34824 ?auto_34830 ) ) ( not ( = ?auto_34825 ?auto_34830 ) ) ( not ( = ?auto_34826 ?auto_34830 ) ) ( CLEAR ?auto_34825 ) ( ON ?auto_34826 ?auto_34827 ) ( CLEAR ?auto_34826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34830 ?auto_34829 ?auto_34828 ?auto_34827 )
      ( MAKE-5PILE ?auto_34824 ?auto_34825 ?auto_34826 ?auto_34827 ?auto_34828 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34831 - BLOCK
      ?auto_34832 - BLOCK
      ?auto_34833 - BLOCK
      ?auto_34834 - BLOCK
      ?auto_34835 - BLOCK
    )
    :vars
    (
      ?auto_34836 - BLOCK
      ?auto_34837 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34831 ) ( not ( = ?auto_34831 ?auto_34832 ) ) ( not ( = ?auto_34831 ?auto_34833 ) ) ( not ( = ?auto_34831 ?auto_34834 ) ) ( not ( = ?auto_34831 ?auto_34835 ) ) ( not ( = ?auto_34832 ?auto_34833 ) ) ( not ( = ?auto_34832 ?auto_34834 ) ) ( not ( = ?auto_34832 ?auto_34835 ) ) ( not ( = ?auto_34833 ?auto_34834 ) ) ( not ( = ?auto_34833 ?auto_34835 ) ) ( not ( = ?auto_34834 ?auto_34835 ) ) ( ON ?auto_34835 ?auto_34836 ) ( not ( = ?auto_34831 ?auto_34836 ) ) ( not ( = ?auto_34832 ?auto_34836 ) ) ( not ( = ?auto_34833 ?auto_34836 ) ) ( not ( = ?auto_34834 ?auto_34836 ) ) ( not ( = ?auto_34835 ?auto_34836 ) ) ( ON ?auto_34834 ?auto_34835 ) ( ON-TABLE ?auto_34837 ) ( ON ?auto_34836 ?auto_34837 ) ( not ( = ?auto_34837 ?auto_34836 ) ) ( not ( = ?auto_34837 ?auto_34835 ) ) ( not ( = ?auto_34837 ?auto_34834 ) ) ( not ( = ?auto_34831 ?auto_34837 ) ) ( not ( = ?auto_34832 ?auto_34837 ) ) ( not ( = ?auto_34833 ?auto_34837 ) ) ( ON ?auto_34833 ?auto_34834 ) ( CLEAR ?auto_34833 ) ( HOLDING ?auto_34832 ) ( CLEAR ?auto_34831 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34831 ?auto_34832 )
      ( MAKE-5PILE ?auto_34831 ?auto_34832 ?auto_34833 ?auto_34834 ?auto_34835 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34838 - BLOCK
      ?auto_34839 - BLOCK
      ?auto_34840 - BLOCK
      ?auto_34841 - BLOCK
      ?auto_34842 - BLOCK
    )
    :vars
    (
      ?auto_34843 - BLOCK
      ?auto_34844 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34838 ) ( not ( = ?auto_34838 ?auto_34839 ) ) ( not ( = ?auto_34838 ?auto_34840 ) ) ( not ( = ?auto_34838 ?auto_34841 ) ) ( not ( = ?auto_34838 ?auto_34842 ) ) ( not ( = ?auto_34839 ?auto_34840 ) ) ( not ( = ?auto_34839 ?auto_34841 ) ) ( not ( = ?auto_34839 ?auto_34842 ) ) ( not ( = ?auto_34840 ?auto_34841 ) ) ( not ( = ?auto_34840 ?auto_34842 ) ) ( not ( = ?auto_34841 ?auto_34842 ) ) ( ON ?auto_34842 ?auto_34843 ) ( not ( = ?auto_34838 ?auto_34843 ) ) ( not ( = ?auto_34839 ?auto_34843 ) ) ( not ( = ?auto_34840 ?auto_34843 ) ) ( not ( = ?auto_34841 ?auto_34843 ) ) ( not ( = ?auto_34842 ?auto_34843 ) ) ( ON ?auto_34841 ?auto_34842 ) ( ON-TABLE ?auto_34844 ) ( ON ?auto_34843 ?auto_34844 ) ( not ( = ?auto_34844 ?auto_34843 ) ) ( not ( = ?auto_34844 ?auto_34842 ) ) ( not ( = ?auto_34844 ?auto_34841 ) ) ( not ( = ?auto_34838 ?auto_34844 ) ) ( not ( = ?auto_34839 ?auto_34844 ) ) ( not ( = ?auto_34840 ?auto_34844 ) ) ( ON ?auto_34840 ?auto_34841 ) ( CLEAR ?auto_34838 ) ( ON ?auto_34839 ?auto_34840 ) ( CLEAR ?auto_34839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34844 ?auto_34843 ?auto_34842 ?auto_34841 ?auto_34840 )
      ( MAKE-5PILE ?auto_34838 ?auto_34839 ?auto_34840 ?auto_34841 ?auto_34842 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34845 - BLOCK
      ?auto_34846 - BLOCK
      ?auto_34847 - BLOCK
      ?auto_34848 - BLOCK
      ?auto_34849 - BLOCK
    )
    :vars
    (
      ?auto_34850 - BLOCK
      ?auto_34851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34845 ?auto_34846 ) ) ( not ( = ?auto_34845 ?auto_34847 ) ) ( not ( = ?auto_34845 ?auto_34848 ) ) ( not ( = ?auto_34845 ?auto_34849 ) ) ( not ( = ?auto_34846 ?auto_34847 ) ) ( not ( = ?auto_34846 ?auto_34848 ) ) ( not ( = ?auto_34846 ?auto_34849 ) ) ( not ( = ?auto_34847 ?auto_34848 ) ) ( not ( = ?auto_34847 ?auto_34849 ) ) ( not ( = ?auto_34848 ?auto_34849 ) ) ( ON ?auto_34849 ?auto_34850 ) ( not ( = ?auto_34845 ?auto_34850 ) ) ( not ( = ?auto_34846 ?auto_34850 ) ) ( not ( = ?auto_34847 ?auto_34850 ) ) ( not ( = ?auto_34848 ?auto_34850 ) ) ( not ( = ?auto_34849 ?auto_34850 ) ) ( ON ?auto_34848 ?auto_34849 ) ( ON-TABLE ?auto_34851 ) ( ON ?auto_34850 ?auto_34851 ) ( not ( = ?auto_34851 ?auto_34850 ) ) ( not ( = ?auto_34851 ?auto_34849 ) ) ( not ( = ?auto_34851 ?auto_34848 ) ) ( not ( = ?auto_34845 ?auto_34851 ) ) ( not ( = ?auto_34846 ?auto_34851 ) ) ( not ( = ?auto_34847 ?auto_34851 ) ) ( ON ?auto_34847 ?auto_34848 ) ( ON ?auto_34846 ?auto_34847 ) ( CLEAR ?auto_34846 ) ( HOLDING ?auto_34845 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34845 )
      ( MAKE-5PILE ?auto_34845 ?auto_34846 ?auto_34847 ?auto_34848 ?auto_34849 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34852 - BLOCK
      ?auto_34853 - BLOCK
      ?auto_34854 - BLOCK
      ?auto_34855 - BLOCK
      ?auto_34856 - BLOCK
    )
    :vars
    (
      ?auto_34858 - BLOCK
      ?auto_34857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34852 ?auto_34853 ) ) ( not ( = ?auto_34852 ?auto_34854 ) ) ( not ( = ?auto_34852 ?auto_34855 ) ) ( not ( = ?auto_34852 ?auto_34856 ) ) ( not ( = ?auto_34853 ?auto_34854 ) ) ( not ( = ?auto_34853 ?auto_34855 ) ) ( not ( = ?auto_34853 ?auto_34856 ) ) ( not ( = ?auto_34854 ?auto_34855 ) ) ( not ( = ?auto_34854 ?auto_34856 ) ) ( not ( = ?auto_34855 ?auto_34856 ) ) ( ON ?auto_34856 ?auto_34858 ) ( not ( = ?auto_34852 ?auto_34858 ) ) ( not ( = ?auto_34853 ?auto_34858 ) ) ( not ( = ?auto_34854 ?auto_34858 ) ) ( not ( = ?auto_34855 ?auto_34858 ) ) ( not ( = ?auto_34856 ?auto_34858 ) ) ( ON ?auto_34855 ?auto_34856 ) ( ON-TABLE ?auto_34857 ) ( ON ?auto_34858 ?auto_34857 ) ( not ( = ?auto_34857 ?auto_34858 ) ) ( not ( = ?auto_34857 ?auto_34856 ) ) ( not ( = ?auto_34857 ?auto_34855 ) ) ( not ( = ?auto_34852 ?auto_34857 ) ) ( not ( = ?auto_34853 ?auto_34857 ) ) ( not ( = ?auto_34854 ?auto_34857 ) ) ( ON ?auto_34854 ?auto_34855 ) ( ON ?auto_34853 ?auto_34854 ) ( ON ?auto_34852 ?auto_34853 ) ( CLEAR ?auto_34852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_34857 ?auto_34858 ?auto_34856 ?auto_34855 ?auto_34854 ?auto_34853 )
      ( MAKE-5PILE ?auto_34852 ?auto_34853 ?auto_34854 ?auto_34855 ?auto_34856 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34860 - BLOCK
    )
    :vars
    (
      ?auto_34861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34861 ?auto_34860 ) ( CLEAR ?auto_34861 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34860 ) ( not ( = ?auto_34860 ?auto_34861 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34861 ?auto_34860 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34862 - BLOCK
    )
    :vars
    (
      ?auto_34863 - BLOCK
      ?auto_34864 - BLOCK
      ?auto_34865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34863 ?auto_34862 ) ( CLEAR ?auto_34863 ) ( ON-TABLE ?auto_34862 ) ( not ( = ?auto_34862 ?auto_34863 ) ) ( HOLDING ?auto_34864 ) ( CLEAR ?auto_34865 ) ( not ( = ?auto_34862 ?auto_34864 ) ) ( not ( = ?auto_34862 ?auto_34865 ) ) ( not ( = ?auto_34863 ?auto_34864 ) ) ( not ( = ?auto_34863 ?auto_34865 ) ) ( not ( = ?auto_34864 ?auto_34865 ) ) )
    :subtasks
    ( ( !STACK ?auto_34864 ?auto_34865 )
      ( MAKE-1PILE ?auto_34862 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34866 - BLOCK
    )
    :vars
    (
      ?auto_34868 - BLOCK
      ?auto_34869 - BLOCK
      ?auto_34867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34868 ?auto_34866 ) ( ON-TABLE ?auto_34866 ) ( not ( = ?auto_34866 ?auto_34868 ) ) ( CLEAR ?auto_34869 ) ( not ( = ?auto_34866 ?auto_34867 ) ) ( not ( = ?auto_34866 ?auto_34869 ) ) ( not ( = ?auto_34868 ?auto_34867 ) ) ( not ( = ?auto_34868 ?auto_34869 ) ) ( not ( = ?auto_34867 ?auto_34869 ) ) ( ON ?auto_34867 ?auto_34868 ) ( CLEAR ?auto_34867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34866 ?auto_34868 )
      ( MAKE-1PILE ?auto_34866 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34870 - BLOCK
    )
    :vars
    (
      ?auto_34872 - BLOCK
      ?auto_34871 - BLOCK
      ?auto_34873 - BLOCK
      ?auto_34875 - BLOCK
      ?auto_34874 - BLOCK
      ?auto_34876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34872 ?auto_34870 ) ( ON-TABLE ?auto_34870 ) ( not ( = ?auto_34870 ?auto_34872 ) ) ( not ( = ?auto_34870 ?auto_34871 ) ) ( not ( = ?auto_34870 ?auto_34873 ) ) ( not ( = ?auto_34872 ?auto_34871 ) ) ( not ( = ?auto_34872 ?auto_34873 ) ) ( not ( = ?auto_34871 ?auto_34873 ) ) ( ON ?auto_34871 ?auto_34872 ) ( CLEAR ?auto_34871 ) ( HOLDING ?auto_34873 ) ( CLEAR ?auto_34875 ) ( ON-TABLE ?auto_34874 ) ( ON ?auto_34876 ?auto_34874 ) ( ON ?auto_34875 ?auto_34876 ) ( not ( = ?auto_34874 ?auto_34876 ) ) ( not ( = ?auto_34874 ?auto_34875 ) ) ( not ( = ?auto_34874 ?auto_34873 ) ) ( not ( = ?auto_34876 ?auto_34875 ) ) ( not ( = ?auto_34876 ?auto_34873 ) ) ( not ( = ?auto_34875 ?auto_34873 ) ) ( not ( = ?auto_34870 ?auto_34875 ) ) ( not ( = ?auto_34870 ?auto_34874 ) ) ( not ( = ?auto_34870 ?auto_34876 ) ) ( not ( = ?auto_34872 ?auto_34875 ) ) ( not ( = ?auto_34872 ?auto_34874 ) ) ( not ( = ?auto_34872 ?auto_34876 ) ) ( not ( = ?auto_34871 ?auto_34875 ) ) ( not ( = ?auto_34871 ?auto_34874 ) ) ( not ( = ?auto_34871 ?auto_34876 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34874 ?auto_34876 ?auto_34875 ?auto_34873 )
      ( MAKE-1PILE ?auto_34870 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34877 - BLOCK
    )
    :vars
    (
      ?auto_34880 - BLOCK
      ?auto_34878 - BLOCK
      ?auto_34879 - BLOCK
      ?auto_34883 - BLOCK
      ?auto_34881 - BLOCK
      ?auto_34882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34880 ?auto_34877 ) ( ON-TABLE ?auto_34877 ) ( not ( = ?auto_34877 ?auto_34880 ) ) ( not ( = ?auto_34877 ?auto_34878 ) ) ( not ( = ?auto_34877 ?auto_34879 ) ) ( not ( = ?auto_34880 ?auto_34878 ) ) ( not ( = ?auto_34880 ?auto_34879 ) ) ( not ( = ?auto_34878 ?auto_34879 ) ) ( ON ?auto_34878 ?auto_34880 ) ( CLEAR ?auto_34883 ) ( ON-TABLE ?auto_34881 ) ( ON ?auto_34882 ?auto_34881 ) ( ON ?auto_34883 ?auto_34882 ) ( not ( = ?auto_34881 ?auto_34882 ) ) ( not ( = ?auto_34881 ?auto_34883 ) ) ( not ( = ?auto_34881 ?auto_34879 ) ) ( not ( = ?auto_34882 ?auto_34883 ) ) ( not ( = ?auto_34882 ?auto_34879 ) ) ( not ( = ?auto_34883 ?auto_34879 ) ) ( not ( = ?auto_34877 ?auto_34883 ) ) ( not ( = ?auto_34877 ?auto_34881 ) ) ( not ( = ?auto_34877 ?auto_34882 ) ) ( not ( = ?auto_34880 ?auto_34883 ) ) ( not ( = ?auto_34880 ?auto_34881 ) ) ( not ( = ?auto_34880 ?auto_34882 ) ) ( not ( = ?auto_34878 ?auto_34883 ) ) ( not ( = ?auto_34878 ?auto_34881 ) ) ( not ( = ?auto_34878 ?auto_34882 ) ) ( ON ?auto_34879 ?auto_34878 ) ( CLEAR ?auto_34879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34877 ?auto_34880 ?auto_34878 )
      ( MAKE-1PILE ?auto_34877 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34884 - BLOCK
    )
    :vars
    (
      ?auto_34888 - BLOCK
      ?auto_34890 - BLOCK
      ?auto_34887 - BLOCK
      ?auto_34886 - BLOCK
      ?auto_34889 - BLOCK
      ?auto_34885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34888 ?auto_34884 ) ( ON-TABLE ?auto_34884 ) ( not ( = ?auto_34884 ?auto_34888 ) ) ( not ( = ?auto_34884 ?auto_34890 ) ) ( not ( = ?auto_34884 ?auto_34887 ) ) ( not ( = ?auto_34888 ?auto_34890 ) ) ( not ( = ?auto_34888 ?auto_34887 ) ) ( not ( = ?auto_34890 ?auto_34887 ) ) ( ON ?auto_34890 ?auto_34888 ) ( ON-TABLE ?auto_34886 ) ( ON ?auto_34889 ?auto_34886 ) ( not ( = ?auto_34886 ?auto_34889 ) ) ( not ( = ?auto_34886 ?auto_34885 ) ) ( not ( = ?auto_34886 ?auto_34887 ) ) ( not ( = ?auto_34889 ?auto_34885 ) ) ( not ( = ?auto_34889 ?auto_34887 ) ) ( not ( = ?auto_34885 ?auto_34887 ) ) ( not ( = ?auto_34884 ?auto_34885 ) ) ( not ( = ?auto_34884 ?auto_34886 ) ) ( not ( = ?auto_34884 ?auto_34889 ) ) ( not ( = ?auto_34888 ?auto_34885 ) ) ( not ( = ?auto_34888 ?auto_34886 ) ) ( not ( = ?auto_34888 ?auto_34889 ) ) ( not ( = ?auto_34890 ?auto_34885 ) ) ( not ( = ?auto_34890 ?auto_34886 ) ) ( not ( = ?auto_34890 ?auto_34889 ) ) ( ON ?auto_34887 ?auto_34890 ) ( CLEAR ?auto_34887 ) ( HOLDING ?auto_34885 ) ( CLEAR ?auto_34889 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34886 ?auto_34889 ?auto_34885 )
      ( MAKE-1PILE ?auto_34884 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34891 - BLOCK
    )
    :vars
    (
      ?auto_34893 - BLOCK
      ?auto_34894 - BLOCK
      ?auto_34892 - BLOCK
      ?auto_34896 - BLOCK
      ?auto_34897 - BLOCK
      ?auto_34895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34893 ?auto_34891 ) ( ON-TABLE ?auto_34891 ) ( not ( = ?auto_34891 ?auto_34893 ) ) ( not ( = ?auto_34891 ?auto_34894 ) ) ( not ( = ?auto_34891 ?auto_34892 ) ) ( not ( = ?auto_34893 ?auto_34894 ) ) ( not ( = ?auto_34893 ?auto_34892 ) ) ( not ( = ?auto_34894 ?auto_34892 ) ) ( ON ?auto_34894 ?auto_34893 ) ( ON-TABLE ?auto_34896 ) ( ON ?auto_34897 ?auto_34896 ) ( not ( = ?auto_34896 ?auto_34897 ) ) ( not ( = ?auto_34896 ?auto_34895 ) ) ( not ( = ?auto_34896 ?auto_34892 ) ) ( not ( = ?auto_34897 ?auto_34895 ) ) ( not ( = ?auto_34897 ?auto_34892 ) ) ( not ( = ?auto_34895 ?auto_34892 ) ) ( not ( = ?auto_34891 ?auto_34895 ) ) ( not ( = ?auto_34891 ?auto_34896 ) ) ( not ( = ?auto_34891 ?auto_34897 ) ) ( not ( = ?auto_34893 ?auto_34895 ) ) ( not ( = ?auto_34893 ?auto_34896 ) ) ( not ( = ?auto_34893 ?auto_34897 ) ) ( not ( = ?auto_34894 ?auto_34895 ) ) ( not ( = ?auto_34894 ?auto_34896 ) ) ( not ( = ?auto_34894 ?auto_34897 ) ) ( ON ?auto_34892 ?auto_34894 ) ( CLEAR ?auto_34897 ) ( ON ?auto_34895 ?auto_34892 ) ( CLEAR ?auto_34895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34891 ?auto_34893 ?auto_34894 ?auto_34892 )
      ( MAKE-1PILE ?auto_34891 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34898 - BLOCK
    )
    :vars
    (
      ?auto_34904 - BLOCK
      ?auto_34901 - BLOCK
      ?auto_34900 - BLOCK
      ?auto_34899 - BLOCK
      ?auto_34903 - BLOCK
      ?auto_34902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34904 ?auto_34898 ) ( ON-TABLE ?auto_34898 ) ( not ( = ?auto_34898 ?auto_34904 ) ) ( not ( = ?auto_34898 ?auto_34901 ) ) ( not ( = ?auto_34898 ?auto_34900 ) ) ( not ( = ?auto_34904 ?auto_34901 ) ) ( not ( = ?auto_34904 ?auto_34900 ) ) ( not ( = ?auto_34901 ?auto_34900 ) ) ( ON ?auto_34901 ?auto_34904 ) ( ON-TABLE ?auto_34899 ) ( not ( = ?auto_34899 ?auto_34903 ) ) ( not ( = ?auto_34899 ?auto_34902 ) ) ( not ( = ?auto_34899 ?auto_34900 ) ) ( not ( = ?auto_34903 ?auto_34902 ) ) ( not ( = ?auto_34903 ?auto_34900 ) ) ( not ( = ?auto_34902 ?auto_34900 ) ) ( not ( = ?auto_34898 ?auto_34902 ) ) ( not ( = ?auto_34898 ?auto_34899 ) ) ( not ( = ?auto_34898 ?auto_34903 ) ) ( not ( = ?auto_34904 ?auto_34902 ) ) ( not ( = ?auto_34904 ?auto_34899 ) ) ( not ( = ?auto_34904 ?auto_34903 ) ) ( not ( = ?auto_34901 ?auto_34902 ) ) ( not ( = ?auto_34901 ?auto_34899 ) ) ( not ( = ?auto_34901 ?auto_34903 ) ) ( ON ?auto_34900 ?auto_34901 ) ( ON ?auto_34902 ?auto_34900 ) ( CLEAR ?auto_34902 ) ( HOLDING ?auto_34903 ) ( CLEAR ?auto_34899 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34899 ?auto_34903 )
      ( MAKE-1PILE ?auto_34898 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35751 - BLOCK
    )
    :vars
    (
      ?auto_35756 - BLOCK
      ?auto_35752 - BLOCK
      ?auto_35754 - BLOCK
      ?auto_35755 - BLOCK
      ?auto_35753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35756 ?auto_35751 ) ( ON-TABLE ?auto_35751 ) ( not ( = ?auto_35751 ?auto_35756 ) ) ( not ( = ?auto_35751 ?auto_35752 ) ) ( not ( = ?auto_35751 ?auto_35754 ) ) ( not ( = ?auto_35756 ?auto_35752 ) ) ( not ( = ?auto_35756 ?auto_35754 ) ) ( not ( = ?auto_35752 ?auto_35754 ) ) ( ON ?auto_35752 ?auto_35756 ) ( not ( = ?auto_35755 ?auto_35753 ) ) ( not ( = ?auto_35755 ?auto_35754 ) ) ( not ( = ?auto_35753 ?auto_35754 ) ) ( not ( = ?auto_35751 ?auto_35753 ) ) ( not ( = ?auto_35751 ?auto_35755 ) ) ( not ( = ?auto_35756 ?auto_35753 ) ) ( not ( = ?auto_35756 ?auto_35755 ) ) ( not ( = ?auto_35752 ?auto_35753 ) ) ( not ( = ?auto_35752 ?auto_35755 ) ) ( ON ?auto_35754 ?auto_35752 ) ( ON ?auto_35753 ?auto_35754 ) ( ON ?auto_35755 ?auto_35753 ) ( CLEAR ?auto_35755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35751 ?auto_35756 ?auto_35752 ?auto_35754 ?auto_35753 )
      ( MAKE-1PILE ?auto_35751 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34912 - BLOCK
    )
    :vars
    (
      ?auto_34916 - BLOCK
      ?auto_34918 - BLOCK
      ?auto_34914 - BLOCK
      ?auto_34915 - BLOCK
      ?auto_34913 - BLOCK
      ?auto_34917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34916 ?auto_34912 ) ( ON-TABLE ?auto_34912 ) ( not ( = ?auto_34912 ?auto_34916 ) ) ( not ( = ?auto_34912 ?auto_34918 ) ) ( not ( = ?auto_34912 ?auto_34914 ) ) ( not ( = ?auto_34916 ?auto_34918 ) ) ( not ( = ?auto_34916 ?auto_34914 ) ) ( not ( = ?auto_34918 ?auto_34914 ) ) ( ON ?auto_34918 ?auto_34916 ) ( not ( = ?auto_34915 ?auto_34913 ) ) ( not ( = ?auto_34915 ?auto_34917 ) ) ( not ( = ?auto_34915 ?auto_34914 ) ) ( not ( = ?auto_34913 ?auto_34917 ) ) ( not ( = ?auto_34913 ?auto_34914 ) ) ( not ( = ?auto_34917 ?auto_34914 ) ) ( not ( = ?auto_34912 ?auto_34917 ) ) ( not ( = ?auto_34912 ?auto_34915 ) ) ( not ( = ?auto_34912 ?auto_34913 ) ) ( not ( = ?auto_34916 ?auto_34917 ) ) ( not ( = ?auto_34916 ?auto_34915 ) ) ( not ( = ?auto_34916 ?auto_34913 ) ) ( not ( = ?auto_34918 ?auto_34917 ) ) ( not ( = ?auto_34918 ?auto_34915 ) ) ( not ( = ?auto_34918 ?auto_34913 ) ) ( ON ?auto_34914 ?auto_34918 ) ( ON ?auto_34917 ?auto_34914 ) ( ON ?auto_34913 ?auto_34917 ) ( CLEAR ?auto_34913 ) ( HOLDING ?auto_34915 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34915 )
      ( MAKE-1PILE ?auto_34912 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34919 - BLOCK
    )
    :vars
    (
      ?auto_34921 - BLOCK
      ?auto_34923 - BLOCK
      ?auto_34922 - BLOCK
      ?auto_34925 - BLOCK
      ?auto_34920 - BLOCK
      ?auto_34924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34921 ?auto_34919 ) ( ON-TABLE ?auto_34919 ) ( not ( = ?auto_34919 ?auto_34921 ) ) ( not ( = ?auto_34919 ?auto_34923 ) ) ( not ( = ?auto_34919 ?auto_34922 ) ) ( not ( = ?auto_34921 ?auto_34923 ) ) ( not ( = ?auto_34921 ?auto_34922 ) ) ( not ( = ?auto_34923 ?auto_34922 ) ) ( ON ?auto_34923 ?auto_34921 ) ( not ( = ?auto_34925 ?auto_34920 ) ) ( not ( = ?auto_34925 ?auto_34924 ) ) ( not ( = ?auto_34925 ?auto_34922 ) ) ( not ( = ?auto_34920 ?auto_34924 ) ) ( not ( = ?auto_34920 ?auto_34922 ) ) ( not ( = ?auto_34924 ?auto_34922 ) ) ( not ( = ?auto_34919 ?auto_34924 ) ) ( not ( = ?auto_34919 ?auto_34925 ) ) ( not ( = ?auto_34919 ?auto_34920 ) ) ( not ( = ?auto_34921 ?auto_34924 ) ) ( not ( = ?auto_34921 ?auto_34925 ) ) ( not ( = ?auto_34921 ?auto_34920 ) ) ( not ( = ?auto_34923 ?auto_34924 ) ) ( not ( = ?auto_34923 ?auto_34925 ) ) ( not ( = ?auto_34923 ?auto_34920 ) ) ( ON ?auto_34922 ?auto_34923 ) ( ON ?auto_34924 ?auto_34922 ) ( ON ?auto_34920 ?auto_34924 ) ( ON ?auto_34925 ?auto_34920 ) ( CLEAR ?auto_34925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_34919 ?auto_34921 ?auto_34923 ?auto_34922 ?auto_34924 ?auto_34920 )
      ( MAKE-1PILE ?auto_34919 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_34932 - BLOCK
      ?auto_34933 - BLOCK
      ?auto_34934 - BLOCK
      ?auto_34935 - BLOCK
      ?auto_34936 - BLOCK
      ?auto_34937 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_34937 ) ( CLEAR ?auto_34936 ) ( ON-TABLE ?auto_34932 ) ( ON ?auto_34933 ?auto_34932 ) ( ON ?auto_34934 ?auto_34933 ) ( ON ?auto_34935 ?auto_34934 ) ( ON ?auto_34936 ?auto_34935 ) ( not ( = ?auto_34932 ?auto_34933 ) ) ( not ( = ?auto_34932 ?auto_34934 ) ) ( not ( = ?auto_34932 ?auto_34935 ) ) ( not ( = ?auto_34932 ?auto_34936 ) ) ( not ( = ?auto_34932 ?auto_34937 ) ) ( not ( = ?auto_34933 ?auto_34934 ) ) ( not ( = ?auto_34933 ?auto_34935 ) ) ( not ( = ?auto_34933 ?auto_34936 ) ) ( not ( = ?auto_34933 ?auto_34937 ) ) ( not ( = ?auto_34934 ?auto_34935 ) ) ( not ( = ?auto_34934 ?auto_34936 ) ) ( not ( = ?auto_34934 ?auto_34937 ) ) ( not ( = ?auto_34935 ?auto_34936 ) ) ( not ( = ?auto_34935 ?auto_34937 ) ) ( not ( = ?auto_34936 ?auto_34937 ) ) )
    :subtasks
    ( ( !STACK ?auto_34937 ?auto_34936 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_34938 - BLOCK
      ?auto_34939 - BLOCK
      ?auto_34940 - BLOCK
      ?auto_34941 - BLOCK
      ?auto_34942 - BLOCK
      ?auto_34943 - BLOCK
    )
    :vars
    (
      ?auto_34944 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_34942 ) ( ON-TABLE ?auto_34938 ) ( ON ?auto_34939 ?auto_34938 ) ( ON ?auto_34940 ?auto_34939 ) ( ON ?auto_34941 ?auto_34940 ) ( ON ?auto_34942 ?auto_34941 ) ( not ( = ?auto_34938 ?auto_34939 ) ) ( not ( = ?auto_34938 ?auto_34940 ) ) ( not ( = ?auto_34938 ?auto_34941 ) ) ( not ( = ?auto_34938 ?auto_34942 ) ) ( not ( = ?auto_34938 ?auto_34943 ) ) ( not ( = ?auto_34939 ?auto_34940 ) ) ( not ( = ?auto_34939 ?auto_34941 ) ) ( not ( = ?auto_34939 ?auto_34942 ) ) ( not ( = ?auto_34939 ?auto_34943 ) ) ( not ( = ?auto_34940 ?auto_34941 ) ) ( not ( = ?auto_34940 ?auto_34942 ) ) ( not ( = ?auto_34940 ?auto_34943 ) ) ( not ( = ?auto_34941 ?auto_34942 ) ) ( not ( = ?auto_34941 ?auto_34943 ) ) ( not ( = ?auto_34942 ?auto_34943 ) ) ( ON ?auto_34943 ?auto_34944 ) ( CLEAR ?auto_34943 ) ( HAND-EMPTY ) ( not ( = ?auto_34938 ?auto_34944 ) ) ( not ( = ?auto_34939 ?auto_34944 ) ) ( not ( = ?auto_34940 ?auto_34944 ) ) ( not ( = ?auto_34941 ?auto_34944 ) ) ( not ( = ?auto_34942 ?auto_34944 ) ) ( not ( = ?auto_34943 ?auto_34944 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34943 ?auto_34944 )
      ( MAKE-6PILE ?auto_34938 ?auto_34939 ?auto_34940 ?auto_34941 ?auto_34942 ?auto_34943 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_34945 - BLOCK
      ?auto_34946 - BLOCK
      ?auto_34947 - BLOCK
      ?auto_34948 - BLOCK
      ?auto_34949 - BLOCK
      ?auto_34950 - BLOCK
    )
    :vars
    (
      ?auto_34951 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34945 ) ( ON ?auto_34946 ?auto_34945 ) ( ON ?auto_34947 ?auto_34946 ) ( ON ?auto_34948 ?auto_34947 ) ( not ( = ?auto_34945 ?auto_34946 ) ) ( not ( = ?auto_34945 ?auto_34947 ) ) ( not ( = ?auto_34945 ?auto_34948 ) ) ( not ( = ?auto_34945 ?auto_34949 ) ) ( not ( = ?auto_34945 ?auto_34950 ) ) ( not ( = ?auto_34946 ?auto_34947 ) ) ( not ( = ?auto_34946 ?auto_34948 ) ) ( not ( = ?auto_34946 ?auto_34949 ) ) ( not ( = ?auto_34946 ?auto_34950 ) ) ( not ( = ?auto_34947 ?auto_34948 ) ) ( not ( = ?auto_34947 ?auto_34949 ) ) ( not ( = ?auto_34947 ?auto_34950 ) ) ( not ( = ?auto_34948 ?auto_34949 ) ) ( not ( = ?auto_34948 ?auto_34950 ) ) ( not ( = ?auto_34949 ?auto_34950 ) ) ( ON ?auto_34950 ?auto_34951 ) ( CLEAR ?auto_34950 ) ( not ( = ?auto_34945 ?auto_34951 ) ) ( not ( = ?auto_34946 ?auto_34951 ) ) ( not ( = ?auto_34947 ?auto_34951 ) ) ( not ( = ?auto_34948 ?auto_34951 ) ) ( not ( = ?auto_34949 ?auto_34951 ) ) ( not ( = ?auto_34950 ?auto_34951 ) ) ( HOLDING ?auto_34949 ) ( CLEAR ?auto_34948 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34945 ?auto_34946 ?auto_34947 ?auto_34948 ?auto_34949 )
      ( MAKE-6PILE ?auto_34945 ?auto_34946 ?auto_34947 ?auto_34948 ?auto_34949 ?auto_34950 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_34952 - BLOCK
      ?auto_34953 - BLOCK
      ?auto_34954 - BLOCK
      ?auto_34955 - BLOCK
      ?auto_34956 - BLOCK
      ?auto_34957 - BLOCK
    )
    :vars
    (
      ?auto_34958 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34952 ) ( ON ?auto_34953 ?auto_34952 ) ( ON ?auto_34954 ?auto_34953 ) ( ON ?auto_34955 ?auto_34954 ) ( not ( = ?auto_34952 ?auto_34953 ) ) ( not ( = ?auto_34952 ?auto_34954 ) ) ( not ( = ?auto_34952 ?auto_34955 ) ) ( not ( = ?auto_34952 ?auto_34956 ) ) ( not ( = ?auto_34952 ?auto_34957 ) ) ( not ( = ?auto_34953 ?auto_34954 ) ) ( not ( = ?auto_34953 ?auto_34955 ) ) ( not ( = ?auto_34953 ?auto_34956 ) ) ( not ( = ?auto_34953 ?auto_34957 ) ) ( not ( = ?auto_34954 ?auto_34955 ) ) ( not ( = ?auto_34954 ?auto_34956 ) ) ( not ( = ?auto_34954 ?auto_34957 ) ) ( not ( = ?auto_34955 ?auto_34956 ) ) ( not ( = ?auto_34955 ?auto_34957 ) ) ( not ( = ?auto_34956 ?auto_34957 ) ) ( ON ?auto_34957 ?auto_34958 ) ( not ( = ?auto_34952 ?auto_34958 ) ) ( not ( = ?auto_34953 ?auto_34958 ) ) ( not ( = ?auto_34954 ?auto_34958 ) ) ( not ( = ?auto_34955 ?auto_34958 ) ) ( not ( = ?auto_34956 ?auto_34958 ) ) ( not ( = ?auto_34957 ?auto_34958 ) ) ( CLEAR ?auto_34955 ) ( ON ?auto_34956 ?auto_34957 ) ( CLEAR ?auto_34956 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34958 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34958 ?auto_34957 )
      ( MAKE-6PILE ?auto_34952 ?auto_34953 ?auto_34954 ?auto_34955 ?auto_34956 ?auto_34957 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_34959 - BLOCK
      ?auto_34960 - BLOCK
      ?auto_34961 - BLOCK
      ?auto_34962 - BLOCK
      ?auto_34963 - BLOCK
      ?auto_34964 - BLOCK
    )
    :vars
    (
      ?auto_34965 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34959 ) ( ON ?auto_34960 ?auto_34959 ) ( ON ?auto_34961 ?auto_34960 ) ( not ( = ?auto_34959 ?auto_34960 ) ) ( not ( = ?auto_34959 ?auto_34961 ) ) ( not ( = ?auto_34959 ?auto_34962 ) ) ( not ( = ?auto_34959 ?auto_34963 ) ) ( not ( = ?auto_34959 ?auto_34964 ) ) ( not ( = ?auto_34960 ?auto_34961 ) ) ( not ( = ?auto_34960 ?auto_34962 ) ) ( not ( = ?auto_34960 ?auto_34963 ) ) ( not ( = ?auto_34960 ?auto_34964 ) ) ( not ( = ?auto_34961 ?auto_34962 ) ) ( not ( = ?auto_34961 ?auto_34963 ) ) ( not ( = ?auto_34961 ?auto_34964 ) ) ( not ( = ?auto_34962 ?auto_34963 ) ) ( not ( = ?auto_34962 ?auto_34964 ) ) ( not ( = ?auto_34963 ?auto_34964 ) ) ( ON ?auto_34964 ?auto_34965 ) ( not ( = ?auto_34959 ?auto_34965 ) ) ( not ( = ?auto_34960 ?auto_34965 ) ) ( not ( = ?auto_34961 ?auto_34965 ) ) ( not ( = ?auto_34962 ?auto_34965 ) ) ( not ( = ?auto_34963 ?auto_34965 ) ) ( not ( = ?auto_34964 ?auto_34965 ) ) ( ON ?auto_34963 ?auto_34964 ) ( CLEAR ?auto_34963 ) ( ON-TABLE ?auto_34965 ) ( HOLDING ?auto_34962 ) ( CLEAR ?auto_34961 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34959 ?auto_34960 ?auto_34961 ?auto_34962 )
      ( MAKE-6PILE ?auto_34959 ?auto_34960 ?auto_34961 ?auto_34962 ?auto_34963 ?auto_34964 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_34966 - BLOCK
      ?auto_34967 - BLOCK
      ?auto_34968 - BLOCK
      ?auto_34969 - BLOCK
      ?auto_34970 - BLOCK
      ?auto_34971 - BLOCK
    )
    :vars
    (
      ?auto_34972 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34966 ) ( ON ?auto_34967 ?auto_34966 ) ( ON ?auto_34968 ?auto_34967 ) ( not ( = ?auto_34966 ?auto_34967 ) ) ( not ( = ?auto_34966 ?auto_34968 ) ) ( not ( = ?auto_34966 ?auto_34969 ) ) ( not ( = ?auto_34966 ?auto_34970 ) ) ( not ( = ?auto_34966 ?auto_34971 ) ) ( not ( = ?auto_34967 ?auto_34968 ) ) ( not ( = ?auto_34967 ?auto_34969 ) ) ( not ( = ?auto_34967 ?auto_34970 ) ) ( not ( = ?auto_34967 ?auto_34971 ) ) ( not ( = ?auto_34968 ?auto_34969 ) ) ( not ( = ?auto_34968 ?auto_34970 ) ) ( not ( = ?auto_34968 ?auto_34971 ) ) ( not ( = ?auto_34969 ?auto_34970 ) ) ( not ( = ?auto_34969 ?auto_34971 ) ) ( not ( = ?auto_34970 ?auto_34971 ) ) ( ON ?auto_34971 ?auto_34972 ) ( not ( = ?auto_34966 ?auto_34972 ) ) ( not ( = ?auto_34967 ?auto_34972 ) ) ( not ( = ?auto_34968 ?auto_34972 ) ) ( not ( = ?auto_34969 ?auto_34972 ) ) ( not ( = ?auto_34970 ?auto_34972 ) ) ( not ( = ?auto_34971 ?auto_34972 ) ) ( ON ?auto_34970 ?auto_34971 ) ( ON-TABLE ?auto_34972 ) ( CLEAR ?auto_34968 ) ( ON ?auto_34969 ?auto_34970 ) ( CLEAR ?auto_34969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34972 ?auto_34971 ?auto_34970 )
      ( MAKE-6PILE ?auto_34966 ?auto_34967 ?auto_34968 ?auto_34969 ?auto_34970 ?auto_34971 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_34973 - BLOCK
      ?auto_34974 - BLOCK
      ?auto_34975 - BLOCK
      ?auto_34976 - BLOCK
      ?auto_34977 - BLOCK
      ?auto_34978 - BLOCK
    )
    :vars
    (
      ?auto_34979 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34973 ) ( ON ?auto_34974 ?auto_34973 ) ( not ( = ?auto_34973 ?auto_34974 ) ) ( not ( = ?auto_34973 ?auto_34975 ) ) ( not ( = ?auto_34973 ?auto_34976 ) ) ( not ( = ?auto_34973 ?auto_34977 ) ) ( not ( = ?auto_34973 ?auto_34978 ) ) ( not ( = ?auto_34974 ?auto_34975 ) ) ( not ( = ?auto_34974 ?auto_34976 ) ) ( not ( = ?auto_34974 ?auto_34977 ) ) ( not ( = ?auto_34974 ?auto_34978 ) ) ( not ( = ?auto_34975 ?auto_34976 ) ) ( not ( = ?auto_34975 ?auto_34977 ) ) ( not ( = ?auto_34975 ?auto_34978 ) ) ( not ( = ?auto_34976 ?auto_34977 ) ) ( not ( = ?auto_34976 ?auto_34978 ) ) ( not ( = ?auto_34977 ?auto_34978 ) ) ( ON ?auto_34978 ?auto_34979 ) ( not ( = ?auto_34973 ?auto_34979 ) ) ( not ( = ?auto_34974 ?auto_34979 ) ) ( not ( = ?auto_34975 ?auto_34979 ) ) ( not ( = ?auto_34976 ?auto_34979 ) ) ( not ( = ?auto_34977 ?auto_34979 ) ) ( not ( = ?auto_34978 ?auto_34979 ) ) ( ON ?auto_34977 ?auto_34978 ) ( ON-TABLE ?auto_34979 ) ( ON ?auto_34976 ?auto_34977 ) ( CLEAR ?auto_34976 ) ( HOLDING ?auto_34975 ) ( CLEAR ?auto_34974 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34973 ?auto_34974 ?auto_34975 )
      ( MAKE-6PILE ?auto_34973 ?auto_34974 ?auto_34975 ?auto_34976 ?auto_34977 ?auto_34978 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_34980 - BLOCK
      ?auto_34981 - BLOCK
      ?auto_34982 - BLOCK
      ?auto_34983 - BLOCK
      ?auto_34984 - BLOCK
      ?auto_34985 - BLOCK
    )
    :vars
    (
      ?auto_34986 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34980 ) ( ON ?auto_34981 ?auto_34980 ) ( not ( = ?auto_34980 ?auto_34981 ) ) ( not ( = ?auto_34980 ?auto_34982 ) ) ( not ( = ?auto_34980 ?auto_34983 ) ) ( not ( = ?auto_34980 ?auto_34984 ) ) ( not ( = ?auto_34980 ?auto_34985 ) ) ( not ( = ?auto_34981 ?auto_34982 ) ) ( not ( = ?auto_34981 ?auto_34983 ) ) ( not ( = ?auto_34981 ?auto_34984 ) ) ( not ( = ?auto_34981 ?auto_34985 ) ) ( not ( = ?auto_34982 ?auto_34983 ) ) ( not ( = ?auto_34982 ?auto_34984 ) ) ( not ( = ?auto_34982 ?auto_34985 ) ) ( not ( = ?auto_34983 ?auto_34984 ) ) ( not ( = ?auto_34983 ?auto_34985 ) ) ( not ( = ?auto_34984 ?auto_34985 ) ) ( ON ?auto_34985 ?auto_34986 ) ( not ( = ?auto_34980 ?auto_34986 ) ) ( not ( = ?auto_34981 ?auto_34986 ) ) ( not ( = ?auto_34982 ?auto_34986 ) ) ( not ( = ?auto_34983 ?auto_34986 ) ) ( not ( = ?auto_34984 ?auto_34986 ) ) ( not ( = ?auto_34985 ?auto_34986 ) ) ( ON ?auto_34984 ?auto_34985 ) ( ON-TABLE ?auto_34986 ) ( ON ?auto_34983 ?auto_34984 ) ( CLEAR ?auto_34981 ) ( ON ?auto_34982 ?auto_34983 ) ( CLEAR ?auto_34982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34986 ?auto_34985 ?auto_34984 ?auto_34983 )
      ( MAKE-6PILE ?auto_34980 ?auto_34981 ?auto_34982 ?auto_34983 ?auto_34984 ?auto_34985 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_34987 - BLOCK
      ?auto_34988 - BLOCK
      ?auto_34989 - BLOCK
      ?auto_34990 - BLOCK
      ?auto_34991 - BLOCK
      ?auto_34992 - BLOCK
    )
    :vars
    (
      ?auto_34993 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34987 ) ( not ( = ?auto_34987 ?auto_34988 ) ) ( not ( = ?auto_34987 ?auto_34989 ) ) ( not ( = ?auto_34987 ?auto_34990 ) ) ( not ( = ?auto_34987 ?auto_34991 ) ) ( not ( = ?auto_34987 ?auto_34992 ) ) ( not ( = ?auto_34988 ?auto_34989 ) ) ( not ( = ?auto_34988 ?auto_34990 ) ) ( not ( = ?auto_34988 ?auto_34991 ) ) ( not ( = ?auto_34988 ?auto_34992 ) ) ( not ( = ?auto_34989 ?auto_34990 ) ) ( not ( = ?auto_34989 ?auto_34991 ) ) ( not ( = ?auto_34989 ?auto_34992 ) ) ( not ( = ?auto_34990 ?auto_34991 ) ) ( not ( = ?auto_34990 ?auto_34992 ) ) ( not ( = ?auto_34991 ?auto_34992 ) ) ( ON ?auto_34992 ?auto_34993 ) ( not ( = ?auto_34987 ?auto_34993 ) ) ( not ( = ?auto_34988 ?auto_34993 ) ) ( not ( = ?auto_34989 ?auto_34993 ) ) ( not ( = ?auto_34990 ?auto_34993 ) ) ( not ( = ?auto_34991 ?auto_34993 ) ) ( not ( = ?auto_34992 ?auto_34993 ) ) ( ON ?auto_34991 ?auto_34992 ) ( ON-TABLE ?auto_34993 ) ( ON ?auto_34990 ?auto_34991 ) ( ON ?auto_34989 ?auto_34990 ) ( CLEAR ?auto_34989 ) ( HOLDING ?auto_34988 ) ( CLEAR ?auto_34987 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34987 ?auto_34988 )
      ( MAKE-6PILE ?auto_34987 ?auto_34988 ?auto_34989 ?auto_34990 ?auto_34991 ?auto_34992 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_34994 - BLOCK
      ?auto_34995 - BLOCK
      ?auto_34996 - BLOCK
      ?auto_34997 - BLOCK
      ?auto_34998 - BLOCK
      ?auto_34999 - BLOCK
    )
    :vars
    (
      ?auto_35000 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34994 ) ( not ( = ?auto_34994 ?auto_34995 ) ) ( not ( = ?auto_34994 ?auto_34996 ) ) ( not ( = ?auto_34994 ?auto_34997 ) ) ( not ( = ?auto_34994 ?auto_34998 ) ) ( not ( = ?auto_34994 ?auto_34999 ) ) ( not ( = ?auto_34995 ?auto_34996 ) ) ( not ( = ?auto_34995 ?auto_34997 ) ) ( not ( = ?auto_34995 ?auto_34998 ) ) ( not ( = ?auto_34995 ?auto_34999 ) ) ( not ( = ?auto_34996 ?auto_34997 ) ) ( not ( = ?auto_34996 ?auto_34998 ) ) ( not ( = ?auto_34996 ?auto_34999 ) ) ( not ( = ?auto_34997 ?auto_34998 ) ) ( not ( = ?auto_34997 ?auto_34999 ) ) ( not ( = ?auto_34998 ?auto_34999 ) ) ( ON ?auto_34999 ?auto_35000 ) ( not ( = ?auto_34994 ?auto_35000 ) ) ( not ( = ?auto_34995 ?auto_35000 ) ) ( not ( = ?auto_34996 ?auto_35000 ) ) ( not ( = ?auto_34997 ?auto_35000 ) ) ( not ( = ?auto_34998 ?auto_35000 ) ) ( not ( = ?auto_34999 ?auto_35000 ) ) ( ON ?auto_34998 ?auto_34999 ) ( ON-TABLE ?auto_35000 ) ( ON ?auto_34997 ?auto_34998 ) ( ON ?auto_34996 ?auto_34997 ) ( CLEAR ?auto_34994 ) ( ON ?auto_34995 ?auto_34996 ) ( CLEAR ?auto_34995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35000 ?auto_34999 ?auto_34998 ?auto_34997 ?auto_34996 )
      ( MAKE-6PILE ?auto_34994 ?auto_34995 ?auto_34996 ?auto_34997 ?auto_34998 ?auto_34999 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_35001 - BLOCK
      ?auto_35002 - BLOCK
      ?auto_35003 - BLOCK
      ?auto_35004 - BLOCK
      ?auto_35005 - BLOCK
      ?auto_35006 - BLOCK
    )
    :vars
    (
      ?auto_35007 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35001 ?auto_35002 ) ) ( not ( = ?auto_35001 ?auto_35003 ) ) ( not ( = ?auto_35001 ?auto_35004 ) ) ( not ( = ?auto_35001 ?auto_35005 ) ) ( not ( = ?auto_35001 ?auto_35006 ) ) ( not ( = ?auto_35002 ?auto_35003 ) ) ( not ( = ?auto_35002 ?auto_35004 ) ) ( not ( = ?auto_35002 ?auto_35005 ) ) ( not ( = ?auto_35002 ?auto_35006 ) ) ( not ( = ?auto_35003 ?auto_35004 ) ) ( not ( = ?auto_35003 ?auto_35005 ) ) ( not ( = ?auto_35003 ?auto_35006 ) ) ( not ( = ?auto_35004 ?auto_35005 ) ) ( not ( = ?auto_35004 ?auto_35006 ) ) ( not ( = ?auto_35005 ?auto_35006 ) ) ( ON ?auto_35006 ?auto_35007 ) ( not ( = ?auto_35001 ?auto_35007 ) ) ( not ( = ?auto_35002 ?auto_35007 ) ) ( not ( = ?auto_35003 ?auto_35007 ) ) ( not ( = ?auto_35004 ?auto_35007 ) ) ( not ( = ?auto_35005 ?auto_35007 ) ) ( not ( = ?auto_35006 ?auto_35007 ) ) ( ON ?auto_35005 ?auto_35006 ) ( ON-TABLE ?auto_35007 ) ( ON ?auto_35004 ?auto_35005 ) ( ON ?auto_35003 ?auto_35004 ) ( ON ?auto_35002 ?auto_35003 ) ( CLEAR ?auto_35002 ) ( HOLDING ?auto_35001 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35001 )
      ( MAKE-6PILE ?auto_35001 ?auto_35002 ?auto_35003 ?auto_35004 ?auto_35005 ?auto_35006 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_35008 - BLOCK
      ?auto_35009 - BLOCK
      ?auto_35010 - BLOCK
      ?auto_35011 - BLOCK
      ?auto_35012 - BLOCK
      ?auto_35013 - BLOCK
    )
    :vars
    (
      ?auto_35014 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35008 ?auto_35009 ) ) ( not ( = ?auto_35008 ?auto_35010 ) ) ( not ( = ?auto_35008 ?auto_35011 ) ) ( not ( = ?auto_35008 ?auto_35012 ) ) ( not ( = ?auto_35008 ?auto_35013 ) ) ( not ( = ?auto_35009 ?auto_35010 ) ) ( not ( = ?auto_35009 ?auto_35011 ) ) ( not ( = ?auto_35009 ?auto_35012 ) ) ( not ( = ?auto_35009 ?auto_35013 ) ) ( not ( = ?auto_35010 ?auto_35011 ) ) ( not ( = ?auto_35010 ?auto_35012 ) ) ( not ( = ?auto_35010 ?auto_35013 ) ) ( not ( = ?auto_35011 ?auto_35012 ) ) ( not ( = ?auto_35011 ?auto_35013 ) ) ( not ( = ?auto_35012 ?auto_35013 ) ) ( ON ?auto_35013 ?auto_35014 ) ( not ( = ?auto_35008 ?auto_35014 ) ) ( not ( = ?auto_35009 ?auto_35014 ) ) ( not ( = ?auto_35010 ?auto_35014 ) ) ( not ( = ?auto_35011 ?auto_35014 ) ) ( not ( = ?auto_35012 ?auto_35014 ) ) ( not ( = ?auto_35013 ?auto_35014 ) ) ( ON ?auto_35012 ?auto_35013 ) ( ON-TABLE ?auto_35014 ) ( ON ?auto_35011 ?auto_35012 ) ( ON ?auto_35010 ?auto_35011 ) ( ON ?auto_35009 ?auto_35010 ) ( ON ?auto_35008 ?auto_35009 ) ( CLEAR ?auto_35008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_35014 ?auto_35013 ?auto_35012 ?auto_35011 ?auto_35010 ?auto_35009 )
      ( MAKE-6PILE ?auto_35008 ?auto_35009 ?auto_35010 ?auto_35011 ?auto_35012 ?auto_35013 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35095 - BLOCK
    )
    :vars
    (
      ?auto_35096 - BLOCK
      ?auto_35097 - BLOCK
      ?auto_35098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35095 ?auto_35096 ) ( CLEAR ?auto_35095 ) ( not ( = ?auto_35095 ?auto_35096 ) ) ( HOLDING ?auto_35097 ) ( CLEAR ?auto_35098 ) ( not ( = ?auto_35095 ?auto_35097 ) ) ( not ( = ?auto_35095 ?auto_35098 ) ) ( not ( = ?auto_35096 ?auto_35097 ) ) ( not ( = ?auto_35096 ?auto_35098 ) ) ( not ( = ?auto_35097 ?auto_35098 ) ) )
    :subtasks
    ( ( !STACK ?auto_35097 ?auto_35098 )
      ( MAKE-1PILE ?auto_35095 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35099 - BLOCK
    )
    :vars
    (
      ?auto_35101 - BLOCK
      ?auto_35100 - BLOCK
      ?auto_35102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35099 ?auto_35101 ) ( not ( = ?auto_35099 ?auto_35101 ) ) ( CLEAR ?auto_35100 ) ( not ( = ?auto_35099 ?auto_35102 ) ) ( not ( = ?auto_35099 ?auto_35100 ) ) ( not ( = ?auto_35101 ?auto_35102 ) ) ( not ( = ?auto_35101 ?auto_35100 ) ) ( not ( = ?auto_35102 ?auto_35100 ) ) ( ON ?auto_35102 ?auto_35099 ) ( CLEAR ?auto_35102 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35101 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35101 ?auto_35099 )
      ( MAKE-1PILE ?auto_35099 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35103 - BLOCK
    )
    :vars
    (
      ?auto_35106 - BLOCK
      ?auto_35104 - BLOCK
      ?auto_35105 - BLOCK
      ?auto_35108 - BLOCK
      ?auto_35107 - BLOCK
      ?auto_35109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35103 ?auto_35106 ) ( not ( = ?auto_35103 ?auto_35106 ) ) ( not ( = ?auto_35103 ?auto_35104 ) ) ( not ( = ?auto_35103 ?auto_35105 ) ) ( not ( = ?auto_35106 ?auto_35104 ) ) ( not ( = ?auto_35106 ?auto_35105 ) ) ( not ( = ?auto_35104 ?auto_35105 ) ) ( ON ?auto_35104 ?auto_35103 ) ( CLEAR ?auto_35104 ) ( ON-TABLE ?auto_35106 ) ( HOLDING ?auto_35105 ) ( CLEAR ?auto_35108 ) ( ON-TABLE ?auto_35107 ) ( ON ?auto_35109 ?auto_35107 ) ( ON ?auto_35108 ?auto_35109 ) ( not ( = ?auto_35107 ?auto_35109 ) ) ( not ( = ?auto_35107 ?auto_35108 ) ) ( not ( = ?auto_35107 ?auto_35105 ) ) ( not ( = ?auto_35109 ?auto_35108 ) ) ( not ( = ?auto_35109 ?auto_35105 ) ) ( not ( = ?auto_35108 ?auto_35105 ) ) ( not ( = ?auto_35103 ?auto_35108 ) ) ( not ( = ?auto_35103 ?auto_35107 ) ) ( not ( = ?auto_35103 ?auto_35109 ) ) ( not ( = ?auto_35106 ?auto_35108 ) ) ( not ( = ?auto_35106 ?auto_35107 ) ) ( not ( = ?auto_35106 ?auto_35109 ) ) ( not ( = ?auto_35104 ?auto_35108 ) ) ( not ( = ?auto_35104 ?auto_35107 ) ) ( not ( = ?auto_35104 ?auto_35109 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35107 ?auto_35109 ?auto_35108 ?auto_35105 )
      ( MAKE-1PILE ?auto_35103 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35110 - BLOCK
    )
    :vars
    (
      ?auto_35115 - BLOCK
      ?auto_35112 - BLOCK
      ?auto_35111 - BLOCK
      ?auto_35114 - BLOCK
      ?auto_35116 - BLOCK
      ?auto_35113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35110 ?auto_35115 ) ( not ( = ?auto_35110 ?auto_35115 ) ) ( not ( = ?auto_35110 ?auto_35112 ) ) ( not ( = ?auto_35110 ?auto_35111 ) ) ( not ( = ?auto_35115 ?auto_35112 ) ) ( not ( = ?auto_35115 ?auto_35111 ) ) ( not ( = ?auto_35112 ?auto_35111 ) ) ( ON ?auto_35112 ?auto_35110 ) ( ON-TABLE ?auto_35115 ) ( CLEAR ?auto_35114 ) ( ON-TABLE ?auto_35116 ) ( ON ?auto_35113 ?auto_35116 ) ( ON ?auto_35114 ?auto_35113 ) ( not ( = ?auto_35116 ?auto_35113 ) ) ( not ( = ?auto_35116 ?auto_35114 ) ) ( not ( = ?auto_35116 ?auto_35111 ) ) ( not ( = ?auto_35113 ?auto_35114 ) ) ( not ( = ?auto_35113 ?auto_35111 ) ) ( not ( = ?auto_35114 ?auto_35111 ) ) ( not ( = ?auto_35110 ?auto_35114 ) ) ( not ( = ?auto_35110 ?auto_35116 ) ) ( not ( = ?auto_35110 ?auto_35113 ) ) ( not ( = ?auto_35115 ?auto_35114 ) ) ( not ( = ?auto_35115 ?auto_35116 ) ) ( not ( = ?auto_35115 ?auto_35113 ) ) ( not ( = ?auto_35112 ?auto_35114 ) ) ( not ( = ?auto_35112 ?auto_35116 ) ) ( not ( = ?auto_35112 ?auto_35113 ) ) ( ON ?auto_35111 ?auto_35112 ) ( CLEAR ?auto_35111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35115 ?auto_35110 ?auto_35112 )
      ( MAKE-1PILE ?auto_35110 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35117 - BLOCK
    )
    :vars
    (
      ?auto_35121 - BLOCK
      ?auto_35118 - BLOCK
      ?auto_35123 - BLOCK
      ?auto_35122 - BLOCK
      ?auto_35119 - BLOCK
      ?auto_35120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35117 ?auto_35121 ) ( not ( = ?auto_35117 ?auto_35121 ) ) ( not ( = ?auto_35117 ?auto_35118 ) ) ( not ( = ?auto_35117 ?auto_35123 ) ) ( not ( = ?auto_35121 ?auto_35118 ) ) ( not ( = ?auto_35121 ?auto_35123 ) ) ( not ( = ?auto_35118 ?auto_35123 ) ) ( ON ?auto_35118 ?auto_35117 ) ( ON-TABLE ?auto_35121 ) ( ON-TABLE ?auto_35122 ) ( ON ?auto_35119 ?auto_35122 ) ( not ( = ?auto_35122 ?auto_35119 ) ) ( not ( = ?auto_35122 ?auto_35120 ) ) ( not ( = ?auto_35122 ?auto_35123 ) ) ( not ( = ?auto_35119 ?auto_35120 ) ) ( not ( = ?auto_35119 ?auto_35123 ) ) ( not ( = ?auto_35120 ?auto_35123 ) ) ( not ( = ?auto_35117 ?auto_35120 ) ) ( not ( = ?auto_35117 ?auto_35122 ) ) ( not ( = ?auto_35117 ?auto_35119 ) ) ( not ( = ?auto_35121 ?auto_35120 ) ) ( not ( = ?auto_35121 ?auto_35122 ) ) ( not ( = ?auto_35121 ?auto_35119 ) ) ( not ( = ?auto_35118 ?auto_35120 ) ) ( not ( = ?auto_35118 ?auto_35122 ) ) ( not ( = ?auto_35118 ?auto_35119 ) ) ( ON ?auto_35123 ?auto_35118 ) ( CLEAR ?auto_35123 ) ( HOLDING ?auto_35120 ) ( CLEAR ?auto_35119 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35122 ?auto_35119 ?auto_35120 )
      ( MAKE-1PILE ?auto_35117 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35124 - BLOCK
    )
    :vars
    (
      ?auto_35126 - BLOCK
      ?auto_35125 - BLOCK
      ?auto_35129 - BLOCK
      ?auto_35127 - BLOCK
      ?auto_35130 - BLOCK
      ?auto_35128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35124 ?auto_35126 ) ( not ( = ?auto_35124 ?auto_35126 ) ) ( not ( = ?auto_35124 ?auto_35125 ) ) ( not ( = ?auto_35124 ?auto_35129 ) ) ( not ( = ?auto_35126 ?auto_35125 ) ) ( not ( = ?auto_35126 ?auto_35129 ) ) ( not ( = ?auto_35125 ?auto_35129 ) ) ( ON ?auto_35125 ?auto_35124 ) ( ON-TABLE ?auto_35126 ) ( ON-TABLE ?auto_35127 ) ( ON ?auto_35130 ?auto_35127 ) ( not ( = ?auto_35127 ?auto_35130 ) ) ( not ( = ?auto_35127 ?auto_35128 ) ) ( not ( = ?auto_35127 ?auto_35129 ) ) ( not ( = ?auto_35130 ?auto_35128 ) ) ( not ( = ?auto_35130 ?auto_35129 ) ) ( not ( = ?auto_35128 ?auto_35129 ) ) ( not ( = ?auto_35124 ?auto_35128 ) ) ( not ( = ?auto_35124 ?auto_35127 ) ) ( not ( = ?auto_35124 ?auto_35130 ) ) ( not ( = ?auto_35126 ?auto_35128 ) ) ( not ( = ?auto_35126 ?auto_35127 ) ) ( not ( = ?auto_35126 ?auto_35130 ) ) ( not ( = ?auto_35125 ?auto_35128 ) ) ( not ( = ?auto_35125 ?auto_35127 ) ) ( not ( = ?auto_35125 ?auto_35130 ) ) ( ON ?auto_35129 ?auto_35125 ) ( CLEAR ?auto_35130 ) ( ON ?auto_35128 ?auto_35129 ) ( CLEAR ?auto_35128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35126 ?auto_35124 ?auto_35125 ?auto_35129 )
      ( MAKE-1PILE ?auto_35124 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35131 - BLOCK
    )
    :vars
    (
      ?auto_35134 - BLOCK
      ?auto_35136 - BLOCK
      ?auto_35135 - BLOCK
      ?auto_35133 - BLOCK
      ?auto_35137 - BLOCK
      ?auto_35132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35131 ?auto_35134 ) ( not ( = ?auto_35131 ?auto_35134 ) ) ( not ( = ?auto_35131 ?auto_35136 ) ) ( not ( = ?auto_35131 ?auto_35135 ) ) ( not ( = ?auto_35134 ?auto_35136 ) ) ( not ( = ?auto_35134 ?auto_35135 ) ) ( not ( = ?auto_35136 ?auto_35135 ) ) ( ON ?auto_35136 ?auto_35131 ) ( ON-TABLE ?auto_35134 ) ( ON-TABLE ?auto_35133 ) ( not ( = ?auto_35133 ?auto_35137 ) ) ( not ( = ?auto_35133 ?auto_35132 ) ) ( not ( = ?auto_35133 ?auto_35135 ) ) ( not ( = ?auto_35137 ?auto_35132 ) ) ( not ( = ?auto_35137 ?auto_35135 ) ) ( not ( = ?auto_35132 ?auto_35135 ) ) ( not ( = ?auto_35131 ?auto_35132 ) ) ( not ( = ?auto_35131 ?auto_35133 ) ) ( not ( = ?auto_35131 ?auto_35137 ) ) ( not ( = ?auto_35134 ?auto_35132 ) ) ( not ( = ?auto_35134 ?auto_35133 ) ) ( not ( = ?auto_35134 ?auto_35137 ) ) ( not ( = ?auto_35136 ?auto_35132 ) ) ( not ( = ?auto_35136 ?auto_35133 ) ) ( not ( = ?auto_35136 ?auto_35137 ) ) ( ON ?auto_35135 ?auto_35136 ) ( ON ?auto_35132 ?auto_35135 ) ( CLEAR ?auto_35132 ) ( HOLDING ?auto_35137 ) ( CLEAR ?auto_35133 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35133 ?auto_35137 )
      ( MAKE-1PILE ?auto_35131 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35138 - BLOCK
    )
    :vars
    (
      ?auto_35139 - BLOCK
      ?auto_35144 - BLOCK
      ?auto_35142 - BLOCK
      ?auto_35140 - BLOCK
      ?auto_35141 - BLOCK
      ?auto_35143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35138 ?auto_35139 ) ( not ( = ?auto_35138 ?auto_35139 ) ) ( not ( = ?auto_35138 ?auto_35144 ) ) ( not ( = ?auto_35138 ?auto_35142 ) ) ( not ( = ?auto_35139 ?auto_35144 ) ) ( not ( = ?auto_35139 ?auto_35142 ) ) ( not ( = ?auto_35144 ?auto_35142 ) ) ( ON ?auto_35144 ?auto_35138 ) ( ON-TABLE ?auto_35139 ) ( ON-TABLE ?auto_35140 ) ( not ( = ?auto_35140 ?auto_35141 ) ) ( not ( = ?auto_35140 ?auto_35143 ) ) ( not ( = ?auto_35140 ?auto_35142 ) ) ( not ( = ?auto_35141 ?auto_35143 ) ) ( not ( = ?auto_35141 ?auto_35142 ) ) ( not ( = ?auto_35143 ?auto_35142 ) ) ( not ( = ?auto_35138 ?auto_35143 ) ) ( not ( = ?auto_35138 ?auto_35140 ) ) ( not ( = ?auto_35138 ?auto_35141 ) ) ( not ( = ?auto_35139 ?auto_35143 ) ) ( not ( = ?auto_35139 ?auto_35140 ) ) ( not ( = ?auto_35139 ?auto_35141 ) ) ( not ( = ?auto_35144 ?auto_35143 ) ) ( not ( = ?auto_35144 ?auto_35140 ) ) ( not ( = ?auto_35144 ?auto_35141 ) ) ( ON ?auto_35142 ?auto_35144 ) ( ON ?auto_35143 ?auto_35142 ) ( CLEAR ?auto_35140 ) ( ON ?auto_35141 ?auto_35143 ) ( CLEAR ?auto_35141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35139 ?auto_35138 ?auto_35144 ?auto_35142 ?auto_35143 )
      ( MAKE-1PILE ?auto_35138 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35145 - BLOCK
    )
    :vars
    (
      ?auto_35147 - BLOCK
      ?auto_35151 - BLOCK
      ?auto_35149 - BLOCK
      ?auto_35150 - BLOCK
      ?auto_35146 - BLOCK
      ?auto_35148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35145 ?auto_35147 ) ( not ( = ?auto_35145 ?auto_35147 ) ) ( not ( = ?auto_35145 ?auto_35151 ) ) ( not ( = ?auto_35145 ?auto_35149 ) ) ( not ( = ?auto_35147 ?auto_35151 ) ) ( not ( = ?auto_35147 ?auto_35149 ) ) ( not ( = ?auto_35151 ?auto_35149 ) ) ( ON ?auto_35151 ?auto_35145 ) ( ON-TABLE ?auto_35147 ) ( not ( = ?auto_35150 ?auto_35146 ) ) ( not ( = ?auto_35150 ?auto_35148 ) ) ( not ( = ?auto_35150 ?auto_35149 ) ) ( not ( = ?auto_35146 ?auto_35148 ) ) ( not ( = ?auto_35146 ?auto_35149 ) ) ( not ( = ?auto_35148 ?auto_35149 ) ) ( not ( = ?auto_35145 ?auto_35148 ) ) ( not ( = ?auto_35145 ?auto_35150 ) ) ( not ( = ?auto_35145 ?auto_35146 ) ) ( not ( = ?auto_35147 ?auto_35148 ) ) ( not ( = ?auto_35147 ?auto_35150 ) ) ( not ( = ?auto_35147 ?auto_35146 ) ) ( not ( = ?auto_35151 ?auto_35148 ) ) ( not ( = ?auto_35151 ?auto_35150 ) ) ( not ( = ?auto_35151 ?auto_35146 ) ) ( ON ?auto_35149 ?auto_35151 ) ( ON ?auto_35148 ?auto_35149 ) ( ON ?auto_35146 ?auto_35148 ) ( CLEAR ?auto_35146 ) ( HOLDING ?auto_35150 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35150 )
      ( MAKE-1PILE ?auto_35145 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35152 - BLOCK
    )
    :vars
    (
      ?auto_35156 - BLOCK
      ?auto_35155 - BLOCK
      ?auto_35158 - BLOCK
      ?auto_35153 - BLOCK
      ?auto_35154 - BLOCK
      ?auto_35157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35152 ?auto_35156 ) ( not ( = ?auto_35152 ?auto_35156 ) ) ( not ( = ?auto_35152 ?auto_35155 ) ) ( not ( = ?auto_35152 ?auto_35158 ) ) ( not ( = ?auto_35156 ?auto_35155 ) ) ( not ( = ?auto_35156 ?auto_35158 ) ) ( not ( = ?auto_35155 ?auto_35158 ) ) ( ON ?auto_35155 ?auto_35152 ) ( ON-TABLE ?auto_35156 ) ( not ( = ?auto_35153 ?auto_35154 ) ) ( not ( = ?auto_35153 ?auto_35157 ) ) ( not ( = ?auto_35153 ?auto_35158 ) ) ( not ( = ?auto_35154 ?auto_35157 ) ) ( not ( = ?auto_35154 ?auto_35158 ) ) ( not ( = ?auto_35157 ?auto_35158 ) ) ( not ( = ?auto_35152 ?auto_35157 ) ) ( not ( = ?auto_35152 ?auto_35153 ) ) ( not ( = ?auto_35152 ?auto_35154 ) ) ( not ( = ?auto_35156 ?auto_35157 ) ) ( not ( = ?auto_35156 ?auto_35153 ) ) ( not ( = ?auto_35156 ?auto_35154 ) ) ( not ( = ?auto_35155 ?auto_35157 ) ) ( not ( = ?auto_35155 ?auto_35153 ) ) ( not ( = ?auto_35155 ?auto_35154 ) ) ( ON ?auto_35158 ?auto_35155 ) ( ON ?auto_35157 ?auto_35158 ) ( ON ?auto_35154 ?auto_35157 ) ( ON ?auto_35153 ?auto_35154 ) ( CLEAR ?auto_35153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_35156 ?auto_35152 ?auto_35155 ?auto_35158 ?auto_35157 ?auto_35154 )
      ( MAKE-1PILE ?auto_35152 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35168 - BLOCK
      ?auto_35169 - BLOCK
      ?auto_35170 - BLOCK
      ?auto_35171 - BLOCK
    )
    :vars
    (
      ?auto_35172 - BLOCK
      ?auto_35173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35172 ?auto_35171 ) ( CLEAR ?auto_35172 ) ( ON-TABLE ?auto_35168 ) ( ON ?auto_35169 ?auto_35168 ) ( ON ?auto_35170 ?auto_35169 ) ( ON ?auto_35171 ?auto_35170 ) ( not ( = ?auto_35168 ?auto_35169 ) ) ( not ( = ?auto_35168 ?auto_35170 ) ) ( not ( = ?auto_35168 ?auto_35171 ) ) ( not ( = ?auto_35168 ?auto_35172 ) ) ( not ( = ?auto_35169 ?auto_35170 ) ) ( not ( = ?auto_35169 ?auto_35171 ) ) ( not ( = ?auto_35169 ?auto_35172 ) ) ( not ( = ?auto_35170 ?auto_35171 ) ) ( not ( = ?auto_35170 ?auto_35172 ) ) ( not ( = ?auto_35171 ?auto_35172 ) ) ( HOLDING ?auto_35173 ) ( not ( = ?auto_35168 ?auto_35173 ) ) ( not ( = ?auto_35169 ?auto_35173 ) ) ( not ( = ?auto_35170 ?auto_35173 ) ) ( not ( = ?auto_35171 ?auto_35173 ) ) ( not ( = ?auto_35172 ?auto_35173 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_35173 )
      ( MAKE-4PILE ?auto_35168 ?auto_35169 ?auto_35170 ?auto_35171 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35241 - BLOCK
      ?auto_35242 - BLOCK
    )
    :vars
    (
      ?auto_35243 - BLOCK
      ?auto_35244 - BLOCK
      ?auto_35245 - BLOCK
      ?auto_35246 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35241 ?auto_35242 ) ) ( ON ?auto_35242 ?auto_35243 ) ( not ( = ?auto_35241 ?auto_35243 ) ) ( not ( = ?auto_35242 ?auto_35243 ) ) ( ON ?auto_35241 ?auto_35242 ) ( CLEAR ?auto_35241 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35244 ) ( ON ?auto_35245 ?auto_35244 ) ( ON ?auto_35246 ?auto_35245 ) ( ON ?auto_35243 ?auto_35246 ) ( not ( = ?auto_35244 ?auto_35245 ) ) ( not ( = ?auto_35244 ?auto_35246 ) ) ( not ( = ?auto_35244 ?auto_35243 ) ) ( not ( = ?auto_35244 ?auto_35242 ) ) ( not ( = ?auto_35244 ?auto_35241 ) ) ( not ( = ?auto_35245 ?auto_35246 ) ) ( not ( = ?auto_35245 ?auto_35243 ) ) ( not ( = ?auto_35245 ?auto_35242 ) ) ( not ( = ?auto_35245 ?auto_35241 ) ) ( not ( = ?auto_35246 ?auto_35243 ) ) ( not ( = ?auto_35246 ?auto_35242 ) ) ( not ( = ?auto_35246 ?auto_35241 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35244 ?auto_35245 ?auto_35246 ?auto_35243 ?auto_35242 )
      ( MAKE-2PILE ?auto_35241 ?auto_35242 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35249 - BLOCK
      ?auto_35250 - BLOCK
    )
    :vars
    (
      ?auto_35251 - BLOCK
      ?auto_35252 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35249 ?auto_35250 ) ) ( ON ?auto_35250 ?auto_35251 ) ( CLEAR ?auto_35250 ) ( not ( = ?auto_35249 ?auto_35251 ) ) ( not ( = ?auto_35250 ?auto_35251 ) ) ( ON ?auto_35249 ?auto_35252 ) ( CLEAR ?auto_35249 ) ( HAND-EMPTY ) ( not ( = ?auto_35249 ?auto_35252 ) ) ( not ( = ?auto_35250 ?auto_35252 ) ) ( not ( = ?auto_35251 ?auto_35252 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35249 ?auto_35252 )
      ( MAKE-2PILE ?auto_35249 ?auto_35250 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35253 - BLOCK
      ?auto_35254 - BLOCK
    )
    :vars
    (
      ?auto_35256 - BLOCK
      ?auto_35255 - BLOCK
      ?auto_35257 - BLOCK
      ?auto_35259 - BLOCK
      ?auto_35258 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35253 ?auto_35254 ) ) ( not ( = ?auto_35253 ?auto_35256 ) ) ( not ( = ?auto_35254 ?auto_35256 ) ) ( ON ?auto_35253 ?auto_35255 ) ( CLEAR ?auto_35253 ) ( not ( = ?auto_35253 ?auto_35255 ) ) ( not ( = ?auto_35254 ?auto_35255 ) ) ( not ( = ?auto_35256 ?auto_35255 ) ) ( HOLDING ?auto_35254 ) ( CLEAR ?auto_35256 ) ( ON-TABLE ?auto_35257 ) ( ON ?auto_35259 ?auto_35257 ) ( ON ?auto_35258 ?auto_35259 ) ( ON ?auto_35256 ?auto_35258 ) ( not ( = ?auto_35257 ?auto_35259 ) ) ( not ( = ?auto_35257 ?auto_35258 ) ) ( not ( = ?auto_35257 ?auto_35256 ) ) ( not ( = ?auto_35257 ?auto_35254 ) ) ( not ( = ?auto_35259 ?auto_35258 ) ) ( not ( = ?auto_35259 ?auto_35256 ) ) ( not ( = ?auto_35259 ?auto_35254 ) ) ( not ( = ?auto_35258 ?auto_35256 ) ) ( not ( = ?auto_35258 ?auto_35254 ) ) ( not ( = ?auto_35253 ?auto_35257 ) ) ( not ( = ?auto_35253 ?auto_35259 ) ) ( not ( = ?auto_35253 ?auto_35258 ) ) ( not ( = ?auto_35255 ?auto_35257 ) ) ( not ( = ?auto_35255 ?auto_35259 ) ) ( not ( = ?auto_35255 ?auto_35258 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35257 ?auto_35259 ?auto_35258 ?auto_35256 ?auto_35254 )
      ( MAKE-2PILE ?auto_35253 ?auto_35254 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35260 - BLOCK
      ?auto_35261 - BLOCK
    )
    :vars
    (
      ?auto_35264 - BLOCK
      ?auto_35262 - BLOCK
      ?auto_35263 - BLOCK
      ?auto_35265 - BLOCK
      ?auto_35266 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35260 ?auto_35261 ) ) ( not ( = ?auto_35260 ?auto_35264 ) ) ( not ( = ?auto_35261 ?auto_35264 ) ) ( ON ?auto_35260 ?auto_35262 ) ( not ( = ?auto_35260 ?auto_35262 ) ) ( not ( = ?auto_35261 ?auto_35262 ) ) ( not ( = ?auto_35264 ?auto_35262 ) ) ( CLEAR ?auto_35264 ) ( ON-TABLE ?auto_35263 ) ( ON ?auto_35265 ?auto_35263 ) ( ON ?auto_35266 ?auto_35265 ) ( ON ?auto_35264 ?auto_35266 ) ( not ( = ?auto_35263 ?auto_35265 ) ) ( not ( = ?auto_35263 ?auto_35266 ) ) ( not ( = ?auto_35263 ?auto_35264 ) ) ( not ( = ?auto_35263 ?auto_35261 ) ) ( not ( = ?auto_35265 ?auto_35266 ) ) ( not ( = ?auto_35265 ?auto_35264 ) ) ( not ( = ?auto_35265 ?auto_35261 ) ) ( not ( = ?auto_35266 ?auto_35264 ) ) ( not ( = ?auto_35266 ?auto_35261 ) ) ( not ( = ?auto_35260 ?auto_35263 ) ) ( not ( = ?auto_35260 ?auto_35265 ) ) ( not ( = ?auto_35260 ?auto_35266 ) ) ( not ( = ?auto_35262 ?auto_35263 ) ) ( not ( = ?auto_35262 ?auto_35265 ) ) ( not ( = ?auto_35262 ?auto_35266 ) ) ( ON ?auto_35261 ?auto_35260 ) ( CLEAR ?auto_35261 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35262 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35262 ?auto_35260 )
      ( MAKE-2PILE ?auto_35260 ?auto_35261 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35267 - BLOCK
      ?auto_35268 - BLOCK
    )
    :vars
    (
      ?auto_35273 - BLOCK
      ?auto_35272 - BLOCK
      ?auto_35271 - BLOCK
      ?auto_35270 - BLOCK
      ?auto_35269 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35267 ?auto_35268 ) ) ( not ( = ?auto_35267 ?auto_35273 ) ) ( not ( = ?auto_35268 ?auto_35273 ) ) ( ON ?auto_35267 ?auto_35272 ) ( not ( = ?auto_35267 ?auto_35272 ) ) ( not ( = ?auto_35268 ?auto_35272 ) ) ( not ( = ?auto_35273 ?auto_35272 ) ) ( ON-TABLE ?auto_35271 ) ( ON ?auto_35270 ?auto_35271 ) ( ON ?auto_35269 ?auto_35270 ) ( not ( = ?auto_35271 ?auto_35270 ) ) ( not ( = ?auto_35271 ?auto_35269 ) ) ( not ( = ?auto_35271 ?auto_35273 ) ) ( not ( = ?auto_35271 ?auto_35268 ) ) ( not ( = ?auto_35270 ?auto_35269 ) ) ( not ( = ?auto_35270 ?auto_35273 ) ) ( not ( = ?auto_35270 ?auto_35268 ) ) ( not ( = ?auto_35269 ?auto_35273 ) ) ( not ( = ?auto_35269 ?auto_35268 ) ) ( not ( = ?auto_35267 ?auto_35271 ) ) ( not ( = ?auto_35267 ?auto_35270 ) ) ( not ( = ?auto_35267 ?auto_35269 ) ) ( not ( = ?auto_35272 ?auto_35271 ) ) ( not ( = ?auto_35272 ?auto_35270 ) ) ( not ( = ?auto_35272 ?auto_35269 ) ) ( ON ?auto_35268 ?auto_35267 ) ( CLEAR ?auto_35268 ) ( ON-TABLE ?auto_35272 ) ( HOLDING ?auto_35273 ) ( CLEAR ?auto_35269 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35271 ?auto_35270 ?auto_35269 ?auto_35273 )
      ( MAKE-2PILE ?auto_35267 ?auto_35268 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35274 - BLOCK
      ?auto_35275 - BLOCK
    )
    :vars
    (
      ?auto_35277 - BLOCK
      ?auto_35276 - BLOCK
      ?auto_35280 - BLOCK
      ?auto_35278 - BLOCK
      ?auto_35279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35274 ?auto_35275 ) ) ( not ( = ?auto_35274 ?auto_35277 ) ) ( not ( = ?auto_35275 ?auto_35277 ) ) ( ON ?auto_35274 ?auto_35276 ) ( not ( = ?auto_35274 ?auto_35276 ) ) ( not ( = ?auto_35275 ?auto_35276 ) ) ( not ( = ?auto_35277 ?auto_35276 ) ) ( ON-TABLE ?auto_35280 ) ( ON ?auto_35278 ?auto_35280 ) ( ON ?auto_35279 ?auto_35278 ) ( not ( = ?auto_35280 ?auto_35278 ) ) ( not ( = ?auto_35280 ?auto_35279 ) ) ( not ( = ?auto_35280 ?auto_35277 ) ) ( not ( = ?auto_35280 ?auto_35275 ) ) ( not ( = ?auto_35278 ?auto_35279 ) ) ( not ( = ?auto_35278 ?auto_35277 ) ) ( not ( = ?auto_35278 ?auto_35275 ) ) ( not ( = ?auto_35279 ?auto_35277 ) ) ( not ( = ?auto_35279 ?auto_35275 ) ) ( not ( = ?auto_35274 ?auto_35280 ) ) ( not ( = ?auto_35274 ?auto_35278 ) ) ( not ( = ?auto_35274 ?auto_35279 ) ) ( not ( = ?auto_35276 ?auto_35280 ) ) ( not ( = ?auto_35276 ?auto_35278 ) ) ( not ( = ?auto_35276 ?auto_35279 ) ) ( ON ?auto_35275 ?auto_35274 ) ( ON-TABLE ?auto_35276 ) ( CLEAR ?auto_35279 ) ( ON ?auto_35277 ?auto_35275 ) ( CLEAR ?auto_35277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35276 ?auto_35274 ?auto_35275 )
      ( MAKE-2PILE ?auto_35274 ?auto_35275 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35281 - BLOCK
      ?auto_35282 - BLOCK
    )
    :vars
    (
      ?auto_35286 - BLOCK
      ?auto_35285 - BLOCK
      ?auto_35283 - BLOCK
      ?auto_35284 - BLOCK
      ?auto_35287 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35281 ?auto_35282 ) ) ( not ( = ?auto_35281 ?auto_35286 ) ) ( not ( = ?auto_35282 ?auto_35286 ) ) ( ON ?auto_35281 ?auto_35285 ) ( not ( = ?auto_35281 ?auto_35285 ) ) ( not ( = ?auto_35282 ?auto_35285 ) ) ( not ( = ?auto_35286 ?auto_35285 ) ) ( ON-TABLE ?auto_35283 ) ( ON ?auto_35284 ?auto_35283 ) ( not ( = ?auto_35283 ?auto_35284 ) ) ( not ( = ?auto_35283 ?auto_35287 ) ) ( not ( = ?auto_35283 ?auto_35286 ) ) ( not ( = ?auto_35283 ?auto_35282 ) ) ( not ( = ?auto_35284 ?auto_35287 ) ) ( not ( = ?auto_35284 ?auto_35286 ) ) ( not ( = ?auto_35284 ?auto_35282 ) ) ( not ( = ?auto_35287 ?auto_35286 ) ) ( not ( = ?auto_35287 ?auto_35282 ) ) ( not ( = ?auto_35281 ?auto_35283 ) ) ( not ( = ?auto_35281 ?auto_35284 ) ) ( not ( = ?auto_35281 ?auto_35287 ) ) ( not ( = ?auto_35285 ?auto_35283 ) ) ( not ( = ?auto_35285 ?auto_35284 ) ) ( not ( = ?auto_35285 ?auto_35287 ) ) ( ON ?auto_35282 ?auto_35281 ) ( ON-TABLE ?auto_35285 ) ( ON ?auto_35286 ?auto_35282 ) ( CLEAR ?auto_35286 ) ( HOLDING ?auto_35287 ) ( CLEAR ?auto_35284 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35283 ?auto_35284 ?auto_35287 )
      ( MAKE-2PILE ?auto_35281 ?auto_35282 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35288 - BLOCK
      ?auto_35289 - BLOCK
    )
    :vars
    (
      ?auto_35291 - BLOCK
      ?auto_35294 - BLOCK
      ?auto_35290 - BLOCK
      ?auto_35293 - BLOCK
      ?auto_35292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35288 ?auto_35289 ) ) ( not ( = ?auto_35288 ?auto_35291 ) ) ( not ( = ?auto_35289 ?auto_35291 ) ) ( ON ?auto_35288 ?auto_35294 ) ( not ( = ?auto_35288 ?auto_35294 ) ) ( not ( = ?auto_35289 ?auto_35294 ) ) ( not ( = ?auto_35291 ?auto_35294 ) ) ( ON-TABLE ?auto_35290 ) ( ON ?auto_35293 ?auto_35290 ) ( not ( = ?auto_35290 ?auto_35293 ) ) ( not ( = ?auto_35290 ?auto_35292 ) ) ( not ( = ?auto_35290 ?auto_35291 ) ) ( not ( = ?auto_35290 ?auto_35289 ) ) ( not ( = ?auto_35293 ?auto_35292 ) ) ( not ( = ?auto_35293 ?auto_35291 ) ) ( not ( = ?auto_35293 ?auto_35289 ) ) ( not ( = ?auto_35292 ?auto_35291 ) ) ( not ( = ?auto_35292 ?auto_35289 ) ) ( not ( = ?auto_35288 ?auto_35290 ) ) ( not ( = ?auto_35288 ?auto_35293 ) ) ( not ( = ?auto_35288 ?auto_35292 ) ) ( not ( = ?auto_35294 ?auto_35290 ) ) ( not ( = ?auto_35294 ?auto_35293 ) ) ( not ( = ?auto_35294 ?auto_35292 ) ) ( ON ?auto_35289 ?auto_35288 ) ( ON-TABLE ?auto_35294 ) ( ON ?auto_35291 ?auto_35289 ) ( CLEAR ?auto_35293 ) ( ON ?auto_35292 ?auto_35291 ) ( CLEAR ?auto_35292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35294 ?auto_35288 ?auto_35289 ?auto_35291 )
      ( MAKE-2PILE ?auto_35288 ?auto_35289 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35295 - BLOCK
      ?auto_35296 - BLOCK
    )
    :vars
    (
      ?auto_35299 - BLOCK
      ?auto_35298 - BLOCK
      ?auto_35300 - BLOCK
      ?auto_35301 - BLOCK
      ?auto_35297 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35295 ?auto_35296 ) ) ( not ( = ?auto_35295 ?auto_35299 ) ) ( not ( = ?auto_35296 ?auto_35299 ) ) ( ON ?auto_35295 ?auto_35298 ) ( not ( = ?auto_35295 ?auto_35298 ) ) ( not ( = ?auto_35296 ?auto_35298 ) ) ( not ( = ?auto_35299 ?auto_35298 ) ) ( ON-TABLE ?auto_35300 ) ( not ( = ?auto_35300 ?auto_35301 ) ) ( not ( = ?auto_35300 ?auto_35297 ) ) ( not ( = ?auto_35300 ?auto_35299 ) ) ( not ( = ?auto_35300 ?auto_35296 ) ) ( not ( = ?auto_35301 ?auto_35297 ) ) ( not ( = ?auto_35301 ?auto_35299 ) ) ( not ( = ?auto_35301 ?auto_35296 ) ) ( not ( = ?auto_35297 ?auto_35299 ) ) ( not ( = ?auto_35297 ?auto_35296 ) ) ( not ( = ?auto_35295 ?auto_35300 ) ) ( not ( = ?auto_35295 ?auto_35301 ) ) ( not ( = ?auto_35295 ?auto_35297 ) ) ( not ( = ?auto_35298 ?auto_35300 ) ) ( not ( = ?auto_35298 ?auto_35301 ) ) ( not ( = ?auto_35298 ?auto_35297 ) ) ( ON ?auto_35296 ?auto_35295 ) ( ON-TABLE ?auto_35298 ) ( ON ?auto_35299 ?auto_35296 ) ( ON ?auto_35297 ?auto_35299 ) ( CLEAR ?auto_35297 ) ( HOLDING ?auto_35301 ) ( CLEAR ?auto_35300 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35300 ?auto_35301 )
      ( MAKE-2PILE ?auto_35295 ?auto_35296 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35302 - BLOCK
      ?auto_35303 - BLOCK
    )
    :vars
    (
      ?auto_35308 - BLOCK
      ?auto_35307 - BLOCK
      ?auto_35304 - BLOCK
      ?auto_35305 - BLOCK
      ?auto_35306 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35302 ?auto_35303 ) ) ( not ( = ?auto_35302 ?auto_35308 ) ) ( not ( = ?auto_35303 ?auto_35308 ) ) ( ON ?auto_35302 ?auto_35307 ) ( not ( = ?auto_35302 ?auto_35307 ) ) ( not ( = ?auto_35303 ?auto_35307 ) ) ( not ( = ?auto_35308 ?auto_35307 ) ) ( ON-TABLE ?auto_35304 ) ( not ( = ?auto_35304 ?auto_35305 ) ) ( not ( = ?auto_35304 ?auto_35306 ) ) ( not ( = ?auto_35304 ?auto_35308 ) ) ( not ( = ?auto_35304 ?auto_35303 ) ) ( not ( = ?auto_35305 ?auto_35306 ) ) ( not ( = ?auto_35305 ?auto_35308 ) ) ( not ( = ?auto_35305 ?auto_35303 ) ) ( not ( = ?auto_35306 ?auto_35308 ) ) ( not ( = ?auto_35306 ?auto_35303 ) ) ( not ( = ?auto_35302 ?auto_35304 ) ) ( not ( = ?auto_35302 ?auto_35305 ) ) ( not ( = ?auto_35302 ?auto_35306 ) ) ( not ( = ?auto_35307 ?auto_35304 ) ) ( not ( = ?auto_35307 ?auto_35305 ) ) ( not ( = ?auto_35307 ?auto_35306 ) ) ( ON ?auto_35303 ?auto_35302 ) ( ON-TABLE ?auto_35307 ) ( ON ?auto_35308 ?auto_35303 ) ( ON ?auto_35306 ?auto_35308 ) ( CLEAR ?auto_35304 ) ( ON ?auto_35305 ?auto_35306 ) ( CLEAR ?auto_35305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35307 ?auto_35302 ?auto_35303 ?auto_35308 ?auto_35306 )
      ( MAKE-2PILE ?auto_35302 ?auto_35303 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35309 - BLOCK
      ?auto_35310 - BLOCK
    )
    :vars
    (
      ?auto_35312 - BLOCK
      ?auto_35314 - BLOCK
      ?auto_35315 - BLOCK
      ?auto_35313 - BLOCK
      ?auto_35311 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35309 ?auto_35310 ) ) ( not ( = ?auto_35309 ?auto_35312 ) ) ( not ( = ?auto_35310 ?auto_35312 ) ) ( ON ?auto_35309 ?auto_35314 ) ( not ( = ?auto_35309 ?auto_35314 ) ) ( not ( = ?auto_35310 ?auto_35314 ) ) ( not ( = ?auto_35312 ?auto_35314 ) ) ( not ( = ?auto_35315 ?auto_35313 ) ) ( not ( = ?auto_35315 ?auto_35311 ) ) ( not ( = ?auto_35315 ?auto_35312 ) ) ( not ( = ?auto_35315 ?auto_35310 ) ) ( not ( = ?auto_35313 ?auto_35311 ) ) ( not ( = ?auto_35313 ?auto_35312 ) ) ( not ( = ?auto_35313 ?auto_35310 ) ) ( not ( = ?auto_35311 ?auto_35312 ) ) ( not ( = ?auto_35311 ?auto_35310 ) ) ( not ( = ?auto_35309 ?auto_35315 ) ) ( not ( = ?auto_35309 ?auto_35313 ) ) ( not ( = ?auto_35309 ?auto_35311 ) ) ( not ( = ?auto_35314 ?auto_35315 ) ) ( not ( = ?auto_35314 ?auto_35313 ) ) ( not ( = ?auto_35314 ?auto_35311 ) ) ( ON ?auto_35310 ?auto_35309 ) ( ON-TABLE ?auto_35314 ) ( ON ?auto_35312 ?auto_35310 ) ( ON ?auto_35311 ?auto_35312 ) ( ON ?auto_35313 ?auto_35311 ) ( CLEAR ?auto_35313 ) ( HOLDING ?auto_35315 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35315 )
      ( MAKE-2PILE ?auto_35309 ?auto_35310 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35316 - BLOCK
      ?auto_35317 - BLOCK
    )
    :vars
    (
      ?auto_35322 - BLOCK
      ?auto_35320 - BLOCK
      ?auto_35318 - BLOCK
      ?auto_35319 - BLOCK
      ?auto_35321 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35316 ?auto_35317 ) ) ( not ( = ?auto_35316 ?auto_35322 ) ) ( not ( = ?auto_35317 ?auto_35322 ) ) ( ON ?auto_35316 ?auto_35320 ) ( not ( = ?auto_35316 ?auto_35320 ) ) ( not ( = ?auto_35317 ?auto_35320 ) ) ( not ( = ?auto_35322 ?auto_35320 ) ) ( not ( = ?auto_35318 ?auto_35319 ) ) ( not ( = ?auto_35318 ?auto_35321 ) ) ( not ( = ?auto_35318 ?auto_35322 ) ) ( not ( = ?auto_35318 ?auto_35317 ) ) ( not ( = ?auto_35319 ?auto_35321 ) ) ( not ( = ?auto_35319 ?auto_35322 ) ) ( not ( = ?auto_35319 ?auto_35317 ) ) ( not ( = ?auto_35321 ?auto_35322 ) ) ( not ( = ?auto_35321 ?auto_35317 ) ) ( not ( = ?auto_35316 ?auto_35318 ) ) ( not ( = ?auto_35316 ?auto_35319 ) ) ( not ( = ?auto_35316 ?auto_35321 ) ) ( not ( = ?auto_35320 ?auto_35318 ) ) ( not ( = ?auto_35320 ?auto_35319 ) ) ( not ( = ?auto_35320 ?auto_35321 ) ) ( ON ?auto_35317 ?auto_35316 ) ( ON-TABLE ?auto_35320 ) ( ON ?auto_35322 ?auto_35317 ) ( ON ?auto_35321 ?auto_35322 ) ( ON ?auto_35319 ?auto_35321 ) ( ON ?auto_35318 ?auto_35319 ) ( CLEAR ?auto_35318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_35320 ?auto_35316 ?auto_35317 ?auto_35322 ?auto_35321 ?auto_35319 )
      ( MAKE-2PILE ?auto_35316 ?auto_35317 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35342 - BLOCK
      ?auto_35343 - BLOCK
      ?auto_35344 - BLOCK
    )
    :vars
    (
      ?auto_35347 - BLOCK
      ?auto_35346 - BLOCK
      ?auto_35345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35347 ?auto_35344 ) ( ON-TABLE ?auto_35342 ) ( ON ?auto_35343 ?auto_35342 ) ( ON ?auto_35344 ?auto_35343 ) ( not ( = ?auto_35342 ?auto_35343 ) ) ( not ( = ?auto_35342 ?auto_35344 ) ) ( not ( = ?auto_35342 ?auto_35347 ) ) ( not ( = ?auto_35343 ?auto_35344 ) ) ( not ( = ?auto_35343 ?auto_35347 ) ) ( not ( = ?auto_35344 ?auto_35347 ) ) ( not ( = ?auto_35342 ?auto_35346 ) ) ( not ( = ?auto_35342 ?auto_35345 ) ) ( not ( = ?auto_35343 ?auto_35346 ) ) ( not ( = ?auto_35343 ?auto_35345 ) ) ( not ( = ?auto_35344 ?auto_35346 ) ) ( not ( = ?auto_35344 ?auto_35345 ) ) ( not ( = ?auto_35347 ?auto_35346 ) ) ( not ( = ?auto_35347 ?auto_35345 ) ) ( not ( = ?auto_35346 ?auto_35345 ) ) ( ON ?auto_35346 ?auto_35347 ) ( CLEAR ?auto_35346 ) ( HOLDING ?auto_35345 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35345 )
      ( MAKE-3PILE ?auto_35342 ?auto_35343 ?auto_35344 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35407 - BLOCK
      ?auto_35408 - BLOCK
      ?auto_35409 - BLOCK
    )
    :vars
    (
      ?auto_35410 - BLOCK
      ?auto_35411 - BLOCK
      ?auto_35412 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35407 ) ( not ( = ?auto_35407 ?auto_35408 ) ) ( not ( = ?auto_35407 ?auto_35409 ) ) ( not ( = ?auto_35408 ?auto_35409 ) ) ( ON ?auto_35409 ?auto_35410 ) ( not ( = ?auto_35407 ?auto_35410 ) ) ( not ( = ?auto_35408 ?auto_35410 ) ) ( not ( = ?auto_35409 ?auto_35410 ) ) ( CLEAR ?auto_35407 ) ( ON ?auto_35408 ?auto_35409 ) ( CLEAR ?auto_35408 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35411 ) ( ON ?auto_35412 ?auto_35411 ) ( ON ?auto_35410 ?auto_35412 ) ( not ( = ?auto_35411 ?auto_35412 ) ) ( not ( = ?auto_35411 ?auto_35410 ) ) ( not ( = ?auto_35411 ?auto_35409 ) ) ( not ( = ?auto_35411 ?auto_35408 ) ) ( not ( = ?auto_35412 ?auto_35410 ) ) ( not ( = ?auto_35412 ?auto_35409 ) ) ( not ( = ?auto_35412 ?auto_35408 ) ) ( not ( = ?auto_35407 ?auto_35411 ) ) ( not ( = ?auto_35407 ?auto_35412 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35411 ?auto_35412 ?auto_35410 ?auto_35409 )
      ( MAKE-3PILE ?auto_35407 ?auto_35408 ?auto_35409 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35413 - BLOCK
      ?auto_35414 - BLOCK
      ?auto_35415 - BLOCK
    )
    :vars
    (
      ?auto_35416 - BLOCK
      ?auto_35418 - BLOCK
      ?auto_35417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35413 ?auto_35414 ) ) ( not ( = ?auto_35413 ?auto_35415 ) ) ( not ( = ?auto_35414 ?auto_35415 ) ) ( ON ?auto_35415 ?auto_35416 ) ( not ( = ?auto_35413 ?auto_35416 ) ) ( not ( = ?auto_35414 ?auto_35416 ) ) ( not ( = ?auto_35415 ?auto_35416 ) ) ( ON ?auto_35414 ?auto_35415 ) ( CLEAR ?auto_35414 ) ( ON-TABLE ?auto_35418 ) ( ON ?auto_35417 ?auto_35418 ) ( ON ?auto_35416 ?auto_35417 ) ( not ( = ?auto_35418 ?auto_35417 ) ) ( not ( = ?auto_35418 ?auto_35416 ) ) ( not ( = ?auto_35418 ?auto_35415 ) ) ( not ( = ?auto_35418 ?auto_35414 ) ) ( not ( = ?auto_35417 ?auto_35416 ) ) ( not ( = ?auto_35417 ?auto_35415 ) ) ( not ( = ?auto_35417 ?auto_35414 ) ) ( not ( = ?auto_35413 ?auto_35418 ) ) ( not ( = ?auto_35413 ?auto_35417 ) ) ( HOLDING ?auto_35413 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35413 )
      ( MAKE-3PILE ?auto_35413 ?auto_35414 ?auto_35415 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35419 - BLOCK
      ?auto_35420 - BLOCK
      ?auto_35421 - BLOCK
    )
    :vars
    (
      ?auto_35424 - BLOCK
      ?auto_35422 - BLOCK
      ?auto_35423 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35419 ?auto_35420 ) ) ( not ( = ?auto_35419 ?auto_35421 ) ) ( not ( = ?auto_35420 ?auto_35421 ) ) ( ON ?auto_35421 ?auto_35424 ) ( not ( = ?auto_35419 ?auto_35424 ) ) ( not ( = ?auto_35420 ?auto_35424 ) ) ( not ( = ?auto_35421 ?auto_35424 ) ) ( ON ?auto_35420 ?auto_35421 ) ( ON-TABLE ?auto_35422 ) ( ON ?auto_35423 ?auto_35422 ) ( ON ?auto_35424 ?auto_35423 ) ( not ( = ?auto_35422 ?auto_35423 ) ) ( not ( = ?auto_35422 ?auto_35424 ) ) ( not ( = ?auto_35422 ?auto_35421 ) ) ( not ( = ?auto_35422 ?auto_35420 ) ) ( not ( = ?auto_35423 ?auto_35424 ) ) ( not ( = ?auto_35423 ?auto_35421 ) ) ( not ( = ?auto_35423 ?auto_35420 ) ) ( not ( = ?auto_35419 ?auto_35422 ) ) ( not ( = ?auto_35419 ?auto_35423 ) ) ( ON ?auto_35419 ?auto_35420 ) ( CLEAR ?auto_35419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35422 ?auto_35423 ?auto_35424 ?auto_35421 ?auto_35420 )
      ( MAKE-3PILE ?auto_35419 ?auto_35420 ?auto_35421 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35428 - BLOCK
      ?auto_35429 - BLOCK
      ?auto_35430 - BLOCK
    )
    :vars
    (
      ?auto_35431 - BLOCK
      ?auto_35432 - BLOCK
      ?auto_35433 - BLOCK
      ?auto_35434 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35428 ?auto_35429 ) ) ( not ( = ?auto_35428 ?auto_35430 ) ) ( not ( = ?auto_35429 ?auto_35430 ) ) ( ON ?auto_35430 ?auto_35431 ) ( not ( = ?auto_35428 ?auto_35431 ) ) ( not ( = ?auto_35429 ?auto_35431 ) ) ( not ( = ?auto_35430 ?auto_35431 ) ) ( ON ?auto_35429 ?auto_35430 ) ( CLEAR ?auto_35429 ) ( ON-TABLE ?auto_35432 ) ( ON ?auto_35433 ?auto_35432 ) ( ON ?auto_35431 ?auto_35433 ) ( not ( = ?auto_35432 ?auto_35433 ) ) ( not ( = ?auto_35432 ?auto_35431 ) ) ( not ( = ?auto_35432 ?auto_35430 ) ) ( not ( = ?auto_35432 ?auto_35429 ) ) ( not ( = ?auto_35433 ?auto_35431 ) ) ( not ( = ?auto_35433 ?auto_35430 ) ) ( not ( = ?auto_35433 ?auto_35429 ) ) ( not ( = ?auto_35428 ?auto_35432 ) ) ( not ( = ?auto_35428 ?auto_35433 ) ) ( ON ?auto_35428 ?auto_35434 ) ( CLEAR ?auto_35428 ) ( HAND-EMPTY ) ( not ( = ?auto_35428 ?auto_35434 ) ) ( not ( = ?auto_35429 ?auto_35434 ) ) ( not ( = ?auto_35430 ?auto_35434 ) ) ( not ( = ?auto_35431 ?auto_35434 ) ) ( not ( = ?auto_35432 ?auto_35434 ) ) ( not ( = ?auto_35433 ?auto_35434 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35428 ?auto_35434 )
      ( MAKE-3PILE ?auto_35428 ?auto_35429 ?auto_35430 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35435 - BLOCK
      ?auto_35436 - BLOCK
      ?auto_35437 - BLOCK
    )
    :vars
    (
      ?auto_35438 - BLOCK
      ?auto_35441 - BLOCK
      ?auto_35439 - BLOCK
      ?auto_35440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35435 ?auto_35436 ) ) ( not ( = ?auto_35435 ?auto_35437 ) ) ( not ( = ?auto_35436 ?auto_35437 ) ) ( ON ?auto_35437 ?auto_35438 ) ( not ( = ?auto_35435 ?auto_35438 ) ) ( not ( = ?auto_35436 ?auto_35438 ) ) ( not ( = ?auto_35437 ?auto_35438 ) ) ( ON-TABLE ?auto_35441 ) ( ON ?auto_35439 ?auto_35441 ) ( ON ?auto_35438 ?auto_35439 ) ( not ( = ?auto_35441 ?auto_35439 ) ) ( not ( = ?auto_35441 ?auto_35438 ) ) ( not ( = ?auto_35441 ?auto_35437 ) ) ( not ( = ?auto_35441 ?auto_35436 ) ) ( not ( = ?auto_35439 ?auto_35438 ) ) ( not ( = ?auto_35439 ?auto_35437 ) ) ( not ( = ?auto_35439 ?auto_35436 ) ) ( not ( = ?auto_35435 ?auto_35441 ) ) ( not ( = ?auto_35435 ?auto_35439 ) ) ( ON ?auto_35435 ?auto_35440 ) ( CLEAR ?auto_35435 ) ( not ( = ?auto_35435 ?auto_35440 ) ) ( not ( = ?auto_35436 ?auto_35440 ) ) ( not ( = ?auto_35437 ?auto_35440 ) ) ( not ( = ?auto_35438 ?auto_35440 ) ) ( not ( = ?auto_35441 ?auto_35440 ) ) ( not ( = ?auto_35439 ?auto_35440 ) ) ( HOLDING ?auto_35436 ) ( CLEAR ?auto_35437 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35441 ?auto_35439 ?auto_35438 ?auto_35437 ?auto_35436 )
      ( MAKE-3PILE ?auto_35435 ?auto_35436 ?auto_35437 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35442 - BLOCK
      ?auto_35443 - BLOCK
      ?auto_35444 - BLOCK
    )
    :vars
    (
      ?auto_35445 - BLOCK
      ?auto_35448 - BLOCK
      ?auto_35446 - BLOCK
      ?auto_35447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35442 ?auto_35443 ) ) ( not ( = ?auto_35442 ?auto_35444 ) ) ( not ( = ?auto_35443 ?auto_35444 ) ) ( ON ?auto_35444 ?auto_35445 ) ( not ( = ?auto_35442 ?auto_35445 ) ) ( not ( = ?auto_35443 ?auto_35445 ) ) ( not ( = ?auto_35444 ?auto_35445 ) ) ( ON-TABLE ?auto_35448 ) ( ON ?auto_35446 ?auto_35448 ) ( ON ?auto_35445 ?auto_35446 ) ( not ( = ?auto_35448 ?auto_35446 ) ) ( not ( = ?auto_35448 ?auto_35445 ) ) ( not ( = ?auto_35448 ?auto_35444 ) ) ( not ( = ?auto_35448 ?auto_35443 ) ) ( not ( = ?auto_35446 ?auto_35445 ) ) ( not ( = ?auto_35446 ?auto_35444 ) ) ( not ( = ?auto_35446 ?auto_35443 ) ) ( not ( = ?auto_35442 ?auto_35448 ) ) ( not ( = ?auto_35442 ?auto_35446 ) ) ( ON ?auto_35442 ?auto_35447 ) ( not ( = ?auto_35442 ?auto_35447 ) ) ( not ( = ?auto_35443 ?auto_35447 ) ) ( not ( = ?auto_35444 ?auto_35447 ) ) ( not ( = ?auto_35445 ?auto_35447 ) ) ( not ( = ?auto_35448 ?auto_35447 ) ) ( not ( = ?auto_35446 ?auto_35447 ) ) ( CLEAR ?auto_35444 ) ( ON ?auto_35443 ?auto_35442 ) ( CLEAR ?auto_35443 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35447 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35447 ?auto_35442 )
      ( MAKE-3PILE ?auto_35442 ?auto_35443 ?auto_35444 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35449 - BLOCK
      ?auto_35450 - BLOCK
      ?auto_35451 - BLOCK
    )
    :vars
    (
      ?auto_35452 - BLOCK
      ?auto_35454 - BLOCK
      ?auto_35453 - BLOCK
      ?auto_35455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35449 ?auto_35450 ) ) ( not ( = ?auto_35449 ?auto_35451 ) ) ( not ( = ?auto_35450 ?auto_35451 ) ) ( not ( = ?auto_35449 ?auto_35452 ) ) ( not ( = ?auto_35450 ?auto_35452 ) ) ( not ( = ?auto_35451 ?auto_35452 ) ) ( ON-TABLE ?auto_35454 ) ( ON ?auto_35453 ?auto_35454 ) ( ON ?auto_35452 ?auto_35453 ) ( not ( = ?auto_35454 ?auto_35453 ) ) ( not ( = ?auto_35454 ?auto_35452 ) ) ( not ( = ?auto_35454 ?auto_35451 ) ) ( not ( = ?auto_35454 ?auto_35450 ) ) ( not ( = ?auto_35453 ?auto_35452 ) ) ( not ( = ?auto_35453 ?auto_35451 ) ) ( not ( = ?auto_35453 ?auto_35450 ) ) ( not ( = ?auto_35449 ?auto_35454 ) ) ( not ( = ?auto_35449 ?auto_35453 ) ) ( ON ?auto_35449 ?auto_35455 ) ( not ( = ?auto_35449 ?auto_35455 ) ) ( not ( = ?auto_35450 ?auto_35455 ) ) ( not ( = ?auto_35451 ?auto_35455 ) ) ( not ( = ?auto_35452 ?auto_35455 ) ) ( not ( = ?auto_35454 ?auto_35455 ) ) ( not ( = ?auto_35453 ?auto_35455 ) ) ( ON ?auto_35450 ?auto_35449 ) ( CLEAR ?auto_35450 ) ( ON-TABLE ?auto_35455 ) ( HOLDING ?auto_35451 ) ( CLEAR ?auto_35452 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35454 ?auto_35453 ?auto_35452 ?auto_35451 )
      ( MAKE-3PILE ?auto_35449 ?auto_35450 ?auto_35451 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35456 - BLOCK
      ?auto_35457 - BLOCK
      ?auto_35458 - BLOCK
    )
    :vars
    (
      ?auto_35460 - BLOCK
      ?auto_35462 - BLOCK
      ?auto_35459 - BLOCK
      ?auto_35461 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35456 ?auto_35457 ) ) ( not ( = ?auto_35456 ?auto_35458 ) ) ( not ( = ?auto_35457 ?auto_35458 ) ) ( not ( = ?auto_35456 ?auto_35460 ) ) ( not ( = ?auto_35457 ?auto_35460 ) ) ( not ( = ?auto_35458 ?auto_35460 ) ) ( ON-TABLE ?auto_35462 ) ( ON ?auto_35459 ?auto_35462 ) ( ON ?auto_35460 ?auto_35459 ) ( not ( = ?auto_35462 ?auto_35459 ) ) ( not ( = ?auto_35462 ?auto_35460 ) ) ( not ( = ?auto_35462 ?auto_35458 ) ) ( not ( = ?auto_35462 ?auto_35457 ) ) ( not ( = ?auto_35459 ?auto_35460 ) ) ( not ( = ?auto_35459 ?auto_35458 ) ) ( not ( = ?auto_35459 ?auto_35457 ) ) ( not ( = ?auto_35456 ?auto_35462 ) ) ( not ( = ?auto_35456 ?auto_35459 ) ) ( ON ?auto_35456 ?auto_35461 ) ( not ( = ?auto_35456 ?auto_35461 ) ) ( not ( = ?auto_35457 ?auto_35461 ) ) ( not ( = ?auto_35458 ?auto_35461 ) ) ( not ( = ?auto_35460 ?auto_35461 ) ) ( not ( = ?auto_35462 ?auto_35461 ) ) ( not ( = ?auto_35459 ?auto_35461 ) ) ( ON ?auto_35457 ?auto_35456 ) ( ON-TABLE ?auto_35461 ) ( CLEAR ?auto_35460 ) ( ON ?auto_35458 ?auto_35457 ) ( CLEAR ?auto_35458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35461 ?auto_35456 ?auto_35457 )
      ( MAKE-3PILE ?auto_35456 ?auto_35457 ?auto_35458 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35463 - BLOCK
      ?auto_35464 - BLOCK
      ?auto_35465 - BLOCK
    )
    :vars
    (
      ?auto_35467 - BLOCK
      ?auto_35469 - BLOCK
      ?auto_35466 - BLOCK
      ?auto_35468 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35463 ?auto_35464 ) ) ( not ( = ?auto_35463 ?auto_35465 ) ) ( not ( = ?auto_35464 ?auto_35465 ) ) ( not ( = ?auto_35463 ?auto_35467 ) ) ( not ( = ?auto_35464 ?auto_35467 ) ) ( not ( = ?auto_35465 ?auto_35467 ) ) ( ON-TABLE ?auto_35469 ) ( ON ?auto_35466 ?auto_35469 ) ( not ( = ?auto_35469 ?auto_35466 ) ) ( not ( = ?auto_35469 ?auto_35467 ) ) ( not ( = ?auto_35469 ?auto_35465 ) ) ( not ( = ?auto_35469 ?auto_35464 ) ) ( not ( = ?auto_35466 ?auto_35467 ) ) ( not ( = ?auto_35466 ?auto_35465 ) ) ( not ( = ?auto_35466 ?auto_35464 ) ) ( not ( = ?auto_35463 ?auto_35469 ) ) ( not ( = ?auto_35463 ?auto_35466 ) ) ( ON ?auto_35463 ?auto_35468 ) ( not ( = ?auto_35463 ?auto_35468 ) ) ( not ( = ?auto_35464 ?auto_35468 ) ) ( not ( = ?auto_35465 ?auto_35468 ) ) ( not ( = ?auto_35467 ?auto_35468 ) ) ( not ( = ?auto_35469 ?auto_35468 ) ) ( not ( = ?auto_35466 ?auto_35468 ) ) ( ON ?auto_35464 ?auto_35463 ) ( ON-TABLE ?auto_35468 ) ( ON ?auto_35465 ?auto_35464 ) ( CLEAR ?auto_35465 ) ( HOLDING ?auto_35467 ) ( CLEAR ?auto_35466 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35469 ?auto_35466 ?auto_35467 )
      ( MAKE-3PILE ?auto_35463 ?auto_35464 ?auto_35465 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35470 - BLOCK
      ?auto_35471 - BLOCK
      ?auto_35472 - BLOCK
    )
    :vars
    (
      ?auto_35473 - BLOCK
      ?auto_35476 - BLOCK
      ?auto_35475 - BLOCK
      ?auto_35474 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35470 ?auto_35471 ) ) ( not ( = ?auto_35470 ?auto_35472 ) ) ( not ( = ?auto_35471 ?auto_35472 ) ) ( not ( = ?auto_35470 ?auto_35473 ) ) ( not ( = ?auto_35471 ?auto_35473 ) ) ( not ( = ?auto_35472 ?auto_35473 ) ) ( ON-TABLE ?auto_35476 ) ( ON ?auto_35475 ?auto_35476 ) ( not ( = ?auto_35476 ?auto_35475 ) ) ( not ( = ?auto_35476 ?auto_35473 ) ) ( not ( = ?auto_35476 ?auto_35472 ) ) ( not ( = ?auto_35476 ?auto_35471 ) ) ( not ( = ?auto_35475 ?auto_35473 ) ) ( not ( = ?auto_35475 ?auto_35472 ) ) ( not ( = ?auto_35475 ?auto_35471 ) ) ( not ( = ?auto_35470 ?auto_35476 ) ) ( not ( = ?auto_35470 ?auto_35475 ) ) ( ON ?auto_35470 ?auto_35474 ) ( not ( = ?auto_35470 ?auto_35474 ) ) ( not ( = ?auto_35471 ?auto_35474 ) ) ( not ( = ?auto_35472 ?auto_35474 ) ) ( not ( = ?auto_35473 ?auto_35474 ) ) ( not ( = ?auto_35476 ?auto_35474 ) ) ( not ( = ?auto_35475 ?auto_35474 ) ) ( ON ?auto_35471 ?auto_35470 ) ( ON-TABLE ?auto_35474 ) ( ON ?auto_35472 ?auto_35471 ) ( CLEAR ?auto_35475 ) ( ON ?auto_35473 ?auto_35472 ) ( CLEAR ?auto_35473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35474 ?auto_35470 ?auto_35471 ?auto_35472 )
      ( MAKE-3PILE ?auto_35470 ?auto_35471 ?auto_35472 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35477 - BLOCK
      ?auto_35478 - BLOCK
      ?auto_35479 - BLOCK
    )
    :vars
    (
      ?auto_35481 - BLOCK
      ?auto_35483 - BLOCK
      ?auto_35482 - BLOCK
      ?auto_35480 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35477 ?auto_35478 ) ) ( not ( = ?auto_35477 ?auto_35479 ) ) ( not ( = ?auto_35478 ?auto_35479 ) ) ( not ( = ?auto_35477 ?auto_35481 ) ) ( not ( = ?auto_35478 ?auto_35481 ) ) ( not ( = ?auto_35479 ?auto_35481 ) ) ( ON-TABLE ?auto_35483 ) ( not ( = ?auto_35483 ?auto_35482 ) ) ( not ( = ?auto_35483 ?auto_35481 ) ) ( not ( = ?auto_35483 ?auto_35479 ) ) ( not ( = ?auto_35483 ?auto_35478 ) ) ( not ( = ?auto_35482 ?auto_35481 ) ) ( not ( = ?auto_35482 ?auto_35479 ) ) ( not ( = ?auto_35482 ?auto_35478 ) ) ( not ( = ?auto_35477 ?auto_35483 ) ) ( not ( = ?auto_35477 ?auto_35482 ) ) ( ON ?auto_35477 ?auto_35480 ) ( not ( = ?auto_35477 ?auto_35480 ) ) ( not ( = ?auto_35478 ?auto_35480 ) ) ( not ( = ?auto_35479 ?auto_35480 ) ) ( not ( = ?auto_35481 ?auto_35480 ) ) ( not ( = ?auto_35483 ?auto_35480 ) ) ( not ( = ?auto_35482 ?auto_35480 ) ) ( ON ?auto_35478 ?auto_35477 ) ( ON-TABLE ?auto_35480 ) ( ON ?auto_35479 ?auto_35478 ) ( ON ?auto_35481 ?auto_35479 ) ( CLEAR ?auto_35481 ) ( HOLDING ?auto_35482 ) ( CLEAR ?auto_35483 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35483 ?auto_35482 )
      ( MAKE-3PILE ?auto_35477 ?auto_35478 ?auto_35479 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35484 - BLOCK
      ?auto_35485 - BLOCK
      ?auto_35486 - BLOCK
    )
    :vars
    (
      ?auto_35487 - BLOCK
      ?auto_35488 - BLOCK
      ?auto_35490 - BLOCK
      ?auto_35489 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35484 ?auto_35485 ) ) ( not ( = ?auto_35484 ?auto_35486 ) ) ( not ( = ?auto_35485 ?auto_35486 ) ) ( not ( = ?auto_35484 ?auto_35487 ) ) ( not ( = ?auto_35485 ?auto_35487 ) ) ( not ( = ?auto_35486 ?auto_35487 ) ) ( ON-TABLE ?auto_35488 ) ( not ( = ?auto_35488 ?auto_35490 ) ) ( not ( = ?auto_35488 ?auto_35487 ) ) ( not ( = ?auto_35488 ?auto_35486 ) ) ( not ( = ?auto_35488 ?auto_35485 ) ) ( not ( = ?auto_35490 ?auto_35487 ) ) ( not ( = ?auto_35490 ?auto_35486 ) ) ( not ( = ?auto_35490 ?auto_35485 ) ) ( not ( = ?auto_35484 ?auto_35488 ) ) ( not ( = ?auto_35484 ?auto_35490 ) ) ( ON ?auto_35484 ?auto_35489 ) ( not ( = ?auto_35484 ?auto_35489 ) ) ( not ( = ?auto_35485 ?auto_35489 ) ) ( not ( = ?auto_35486 ?auto_35489 ) ) ( not ( = ?auto_35487 ?auto_35489 ) ) ( not ( = ?auto_35488 ?auto_35489 ) ) ( not ( = ?auto_35490 ?auto_35489 ) ) ( ON ?auto_35485 ?auto_35484 ) ( ON-TABLE ?auto_35489 ) ( ON ?auto_35486 ?auto_35485 ) ( ON ?auto_35487 ?auto_35486 ) ( CLEAR ?auto_35488 ) ( ON ?auto_35490 ?auto_35487 ) ( CLEAR ?auto_35490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35489 ?auto_35484 ?auto_35485 ?auto_35486 ?auto_35487 )
      ( MAKE-3PILE ?auto_35484 ?auto_35485 ?auto_35486 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35491 - BLOCK
      ?auto_35492 - BLOCK
      ?auto_35493 - BLOCK
    )
    :vars
    (
      ?auto_35497 - BLOCK
      ?auto_35494 - BLOCK
      ?auto_35495 - BLOCK
      ?auto_35496 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35491 ?auto_35492 ) ) ( not ( = ?auto_35491 ?auto_35493 ) ) ( not ( = ?auto_35492 ?auto_35493 ) ) ( not ( = ?auto_35491 ?auto_35497 ) ) ( not ( = ?auto_35492 ?auto_35497 ) ) ( not ( = ?auto_35493 ?auto_35497 ) ) ( not ( = ?auto_35494 ?auto_35495 ) ) ( not ( = ?auto_35494 ?auto_35497 ) ) ( not ( = ?auto_35494 ?auto_35493 ) ) ( not ( = ?auto_35494 ?auto_35492 ) ) ( not ( = ?auto_35495 ?auto_35497 ) ) ( not ( = ?auto_35495 ?auto_35493 ) ) ( not ( = ?auto_35495 ?auto_35492 ) ) ( not ( = ?auto_35491 ?auto_35494 ) ) ( not ( = ?auto_35491 ?auto_35495 ) ) ( ON ?auto_35491 ?auto_35496 ) ( not ( = ?auto_35491 ?auto_35496 ) ) ( not ( = ?auto_35492 ?auto_35496 ) ) ( not ( = ?auto_35493 ?auto_35496 ) ) ( not ( = ?auto_35497 ?auto_35496 ) ) ( not ( = ?auto_35494 ?auto_35496 ) ) ( not ( = ?auto_35495 ?auto_35496 ) ) ( ON ?auto_35492 ?auto_35491 ) ( ON-TABLE ?auto_35496 ) ( ON ?auto_35493 ?auto_35492 ) ( ON ?auto_35497 ?auto_35493 ) ( ON ?auto_35495 ?auto_35497 ) ( CLEAR ?auto_35495 ) ( HOLDING ?auto_35494 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35494 )
      ( MAKE-3PILE ?auto_35491 ?auto_35492 ?auto_35493 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35498 - BLOCK
      ?auto_35499 - BLOCK
      ?auto_35500 - BLOCK
    )
    :vars
    (
      ?auto_35501 - BLOCK
      ?auto_35504 - BLOCK
      ?auto_35502 - BLOCK
      ?auto_35503 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35498 ?auto_35499 ) ) ( not ( = ?auto_35498 ?auto_35500 ) ) ( not ( = ?auto_35499 ?auto_35500 ) ) ( not ( = ?auto_35498 ?auto_35501 ) ) ( not ( = ?auto_35499 ?auto_35501 ) ) ( not ( = ?auto_35500 ?auto_35501 ) ) ( not ( = ?auto_35504 ?auto_35502 ) ) ( not ( = ?auto_35504 ?auto_35501 ) ) ( not ( = ?auto_35504 ?auto_35500 ) ) ( not ( = ?auto_35504 ?auto_35499 ) ) ( not ( = ?auto_35502 ?auto_35501 ) ) ( not ( = ?auto_35502 ?auto_35500 ) ) ( not ( = ?auto_35502 ?auto_35499 ) ) ( not ( = ?auto_35498 ?auto_35504 ) ) ( not ( = ?auto_35498 ?auto_35502 ) ) ( ON ?auto_35498 ?auto_35503 ) ( not ( = ?auto_35498 ?auto_35503 ) ) ( not ( = ?auto_35499 ?auto_35503 ) ) ( not ( = ?auto_35500 ?auto_35503 ) ) ( not ( = ?auto_35501 ?auto_35503 ) ) ( not ( = ?auto_35504 ?auto_35503 ) ) ( not ( = ?auto_35502 ?auto_35503 ) ) ( ON ?auto_35499 ?auto_35498 ) ( ON-TABLE ?auto_35503 ) ( ON ?auto_35500 ?auto_35499 ) ( ON ?auto_35501 ?auto_35500 ) ( ON ?auto_35502 ?auto_35501 ) ( ON ?auto_35504 ?auto_35502 ) ( CLEAR ?auto_35504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_35503 ?auto_35498 ?auto_35499 ?auto_35500 ?auto_35501 ?auto_35502 )
      ( MAKE-3PILE ?auto_35498 ?auto_35499 ?auto_35500 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35520 - BLOCK
      ?auto_35521 - BLOCK
    )
    :vars
    (
      ?auto_35523 - BLOCK
      ?auto_35524 - BLOCK
      ?auto_35522 - BLOCK
      ?auto_35525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35523 ?auto_35521 ) ( ON-TABLE ?auto_35520 ) ( ON ?auto_35521 ?auto_35520 ) ( not ( = ?auto_35520 ?auto_35521 ) ) ( not ( = ?auto_35520 ?auto_35523 ) ) ( not ( = ?auto_35521 ?auto_35523 ) ) ( not ( = ?auto_35520 ?auto_35524 ) ) ( not ( = ?auto_35520 ?auto_35522 ) ) ( not ( = ?auto_35521 ?auto_35524 ) ) ( not ( = ?auto_35521 ?auto_35522 ) ) ( not ( = ?auto_35523 ?auto_35524 ) ) ( not ( = ?auto_35523 ?auto_35522 ) ) ( not ( = ?auto_35524 ?auto_35522 ) ) ( ON ?auto_35524 ?auto_35523 ) ( CLEAR ?auto_35524 ) ( HOLDING ?auto_35522 ) ( CLEAR ?auto_35525 ) ( ON-TABLE ?auto_35525 ) ( not ( = ?auto_35525 ?auto_35522 ) ) ( not ( = ?auto_35520 ?auto_35525 ) ) ( not ( = ?auto_35521 ?auto_35525 ) ) ( not ( = ?auto_35523 ?auto_35525 ) ) ( not ( = ?auto_35524 ?auto_35525 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35525 ?auto_35522 )
      ( MAKE-2PILE ?auto_35520 ?auto_35521 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35526 - BLOCK
      ?auto_35527 - BLOCK
    )
    :vars
    (
      ?auto_35529 - BLOCK
      ?auto_35528 - BLOCK
      ?auto_35530 - BLOCK
      ?auto_35531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35529 ?auto_35527 ) ( ON-TABLE ?auto_35526 ) ( ON ?auto_35527 ?auto_35526 ) ( not ( = ?auto_35526 ?auto_35527 ) ) ( not ( = ?auto_35526 ?auto_35529 ) ) ( not ( = ?auto_35527 ?auto_35529 ) ) ( not ( = ?auto_35526 ?auto_35528 ) ) ( not ( = ?auto_35526 ?auto_35530 ) ) ( not ( = ?auto_35527 ?auto_35528 ) ) ( not ( = ?auto_35527 ?auto_35530 ) ) ( not ( = ?auto_35529 ?auto_35528 ) ) ( not ( = ?auto_35529 ?auto_35530 ) ) ( not ( = ?auto_35528 ?auto_35530 ) ) ( ON ?auto_35528 ?auto_35529 ) ( CLEAR ?auto_35531 ) ( ON-TABLE ?auto_35531 ) ( not ( = ?auto_35531 ?auto_35530 ) ) ( not ( = ?auto_35526 ?auto_35531 ) ) ( not ( = ?auto_35527 ?auto_35531 ) ) ( not ( = ?auto_35529 ?auto_35531 ) ) ( not ( = ?auto_35528 ?auto_35531 ) ) ( ON ?auto_35530 ?auto_35528 ) ( CLEAR ?auto_35530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35526 ?auto_35527 ?auto_35529 ?auto_35528 )
      ( MAKE-2PILE ?auto_35526 ?auto_35527 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35532 - BLOCK
      ?auto_35533 - BLOCK
    )
    :vars
    (
      ?auto_35535 - BLOCK
      ?auto_35537 - BLOCK
      ?auto_35534 - BLOCK
      ?auto_35536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35535 ?auto_35533 ) ( ON-TABLE ?auto_35532 ) ( ON ?auto_35533 ?auto_35532 ) ( not ( = ?auto_35532 ?auto_35533 ) ) ( not ( = ?auto_35532 ?auto_35535 ) ) ( not ( = ?auto_35533 ?auto_35535 ) ) ( not ( = ?auto_35532 ?auto_35537 ) ) ( not ( = ?auto_35532 ?auto_35534 ) ) ( not ( = ?auto_35533 ?auto_35537 ) ) ( not ( = ?auto_35533 ?auto_35534 ) ) ( not ( = ?auto_35535 ?auto_35537 ) ) ( not ( = ?auto_35535 ?auto_35534 ) ) ( not ( = ?auto_35537 ?auto_35534 ) ) ( ON ?auto_35537 ?auto_35535 ) ( not ( = ?auto_35536 ?auto_35534 ) ) ( not ( = ?auto_35532 ?auto_35536 ) ) ( not ( = ?auto_35533 ?auto_35536 ) ) ( not ( = ?auto_35535 ?auto_35536 ) ) ( not ( = ?auto_35537 ?auto_35536 ) ) ( ON ?auto_35534 ?auto_35537 ) ( CLEAR ?auto_35534 ) ( HOLDING ?auto_35536 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35536 )
      ( MAKE-2PILE ?auto_35532 ?auto_35533 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35546 - BLOCK
      ?auto_35547 - BLOCK
    )
    :vars
    (
      ?auto_35548 - BLOCK
      ?auto_35551 - BLOCK
      ?auto_35550 - BLOCK
      ?auto_35549 - BLOCK
      ?auto_35552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35548 ?auto_35547 ) ( ON-TABLE ?auto_35546 ) ( ON ?auto_35547 ?auto_35546 ) ( not ( = ?auto_35546 ?auto_35547 ) ) ( not ( = ?auto_35546 ?auto_35548 ) ) ( not ( = ?auto_35547 ?auto_35548 ) ) ( not ( = ?auto_35546 ?auto_35551 ) ) ( not ( = ?auto_35546 ?auto_35550 ) ) ( not ( = ?auto_35547 ?auto_35551 ) ) ( not ( = ?auto_35547 ?auto_35550 ) ) ( not ( = ?auto_35548 ?auto_35551 ) ) ( not ( = ?auto_35548 ?auto_35550 ) ) ( not ( = ?auto_35551 ?auto_35550 ) ) ( ON ?auto_35551 ?auto_35548 ) ( not ( = ?auto_35549 ?auto_35550 ) ) ( not ( = ?auto_35546 ?auto_35549 ) ) ( not ( = ?auto_35547 ?auto_35549 ) ) ( not ( = ?auto_35548 ?auto_35549 ) ) ( not ( = ?auto_35551 ?auto_35549 ) ) ( ON ?auto_35550 ?auto_35551 ) ( CLEAR ?auto_35550 ) ( ON ?auto_35549 ?auto_35552 ) ( CLEAR ?auto_35549 ) ( HAND-EMPTY ) ( not ( = ?auto_35546 ?auto_35552 ) ) ( not ( = ?auto_35547 ?auto_35552 ) ) ( not ( = ?auto_35548 ?auto_35552 ) ) ( not ( = ?auto_35551 ?auto_35552 ) ) ( not ( = ?auto_35550 ?auto_35552 ) ) ( not ( = ?auto_35549 ?auto_35552 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35549 ?auto_35552 )
      ( MAKE-2PILE ?auto_35546 ?auto_35547 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35553 - BLOCK
      ?auto_35554 - BLOCK
    )
    :vars
    (
      ?auto_35559 - BLOCK
      ?auto_35557 - BLOCK
      ?auto_35558 - BLOCK
      ?auto_35556 - BLOCK
      ?auto_35555 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35559 ?auto_35554 ) ( ON-TABLE ?auto_35553 ) ( ON ?auto_35554 ?auto_35553 ) ( not ( = ?auto_35553 ?auto_35554 ) ) ( not ( = ?auto_35553 ?auto_35559 ) ) ( not ( = ?auto_35554 ?auto_35559 ) ) ( not ( = ?auto_35553 ?auto_35557 ) ) ( not ( = ?auto_35553 ?auto_35558 ) ) ( not ( = ?auto_35554 ?auto_35557 ) ) ( not ( = ?auto_35554 ?auto_35558 ) ) ( not ( = ?auto_35559 ?auto_35557 ) ) ( not ( = ?auto_35559 ?auto_35558 ) ) ( not ( = ?auto_35557 ?auto_35558 ) ) ( ON ?auto_35557 ?auto_35559 ) ( not ( = ?auto_35556 ?auto_35558 ) ) ( not ( = ?auto_35553 ?auto_35556 ) ) ( not ( = ?auto_35554 ?auto_35556 ) ) ( not ( = ?auto_35559 ?auto_35556 ) ) ( not ( = ?auto_35557 ?auto_35556 ) ) ( ON ?auto_35556 ?auto_35555 ) ( CLEAR ?auto_35556 ) ( not ( = ?auto_35553 ?auto_35555 ) ) ( not ( = ?auto_35554 ?auto_35555 ) ) ( not ( = ?auto_35559 ?auto_35555 ) ) ( not ( = ?auto_35557 ?auto_35555 ) ) ( not ( = ?auto_35558 ?auto_35555 ) ) ( not ( = ?auto_35556 ?auto_35555 ) ) ( HOLDING ?auto_35558 ) ( CLEAR ?auto_35557 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35553 ?auto_35554 ?auto_35559 ?auto_35557 ?auto_35558 )
      ( MAKE-2PILE ?auto_35553 ?auto_35554 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35599 - BLOCK
      ?auto_35600 - BLOCK
      ?auto_35601 - BLOCK
      ?auto_35602 - BLOCK
    )
    :vars
    (
      ?auto_35603 - BLOCK
      ?auto_35604 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35599 ) ( ON ?auto_35600 ?auto_35599 ) ( not ( = ?auto_35599 ?auto_35600 ) ) ( not ( = ?auto_35599 ?auto_35601 ) ) ( not ( = ?auto_35599 ?auto_35602 ) ) ( not ( = ?auto_35600 ?auto_35601 ) ) ( not ( = ?auto_35600 ?auto_35602 ) ) ( not ( = ?auto_35601 ?auto_35602 ) ) ( ON ?auto_35602 ?auto_35603 ) ( not ( = ?auto_35599 ?auto_35603 ) ) ( not ( = ?auto_35600 ?auto_35603 ) ) ( not ( = ?auto_35601 ?auto_35603 ) ) ( not ( = ?auto_35602 ?auto_35603 ) ) ( CLEAR ?auto_35600 ) ( ON ?auto_35601 ?auto_35602 ) ( CLEAR ?auto_35601 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35604 ) ( ON ?auto_35603 ?auto_35604 ) ( not ( = ?auto_35604 ?auto_35603 ) ) ( not ( = ?auto_35604 ?auto_35602 ) ) ( not ( = ?auto_35604 ?auto_35601 ) ) ( not ( = ?auto_35599 ?auto_35604 ) ) ( not ( = ?auto_35600 ?auto_35604 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35604 ?auto_35603 ?auto_35602 )
      ( MAKE-4PILE ?auto_35599 ?auto_35600 ?auto_35601 ?auto_35602 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35605 - BLOCK
      ?auto_35606 - BLOCK
      ?auto_35607 - BLOCK
      ?auto_35608 - BLOCK
    )
    :vars
    (
      ?auto_35609 - BLOCK
      ?auto_35610 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35605 ) ( not ( = ?auto_35605 ?auto_35606 ) ) ( not ( = ?auto_35605 ?auto_35607 ) ) ( not ( = ?auto_35605 ?auto_35608 ) ) ( not ( = ?auto_35606 ?auto_35607 ) ) ( not ( = ?auto_35606 ?auto_35608 ) ) ( not ( = ?auto_35607 ?auto_35608 ) ) ( ON ?auto_35608 ?auto_35609 ) ( not ( = ?auto_35605 ?auto_35609 ) ) ( not ( = ?auto_35606 ?auto_35609 ) ) ( not ( = ?auto_35607 ?auto_35609 ) ) ( not ( = ?auto_35608 ?auto_35609 ) ) ( ON ?auto_35607 ?auto_35608 ) ( CLEAR ?auto_35607 ) ( ON-TABLE ?auto_35610 ) ( ON ?auto_35609 ?auto_35610 ) ( not ( = ?auto_35610 ?auto_35609 ) ) ( not ( = ?auto_35610 ?auto_35608 ) ) ( not ( = ?auto_35610 ?auto_35607 ) ) ( not ( = ?auto_35605 ?auto_35610 ) ) ( not ( = ?auto_35606 ?auto_35610 ) ) ( HOLDING ?auto_35606 ) ( CLEAR ?auto_35605 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35605 ?auto_35606 )
      ( MAKE-4PILE ?auto_35605 ?auto_35606 ?auto_35607 ?auto_35608 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35611 - BLOCK
      ?auto_35612 - BLOCK
      ?auto_35613 - BLOCK
      ?auto_35614 - BLOCK
    )
    :vars
    (
      ?auto_35615 - BLOCK
      ?auto_35616 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35611 ) ( not ( = ?auto_35611 ?auto_35612 ) ) ( not ( = ?auto_35611 ?auto_35613 ) ) ( not ( = ?auto_35611 ?auto_35614 ) ) ( not ( = ?auto_35612 ?auto_35613 ) ) ( not ( = ?auto_35612 ?auto_35614 ) ) ( not ( = ?auto_35613 ?auto_35614 ) ) ( ON ?auto_35614 ?auto_35615 ) ( not ( = ?auto_35611 ?auto_35615 ) ) ( not ( = ?auto_35612 ?auto_35615 ) ) ( not ( = ?auto_35613 ?auto_35615 ) ) ( not ( = ?auto_35614 ?auto_35615 ) ) ( ON ?auto_35613 ?auto_35614 ) ( ON-TABLE ?auto_35616 ) ( ON ?auto_35615 ?auto_35616 ) ( not ( = ?auto_35616 ?auto_35615 ) ) ( not ( = ?auto_35616 ?auto_35614 ) ) ( not ( = ?auto_35616 ?auto_35613 ) ) ( not ( = ?auto_35611 ?auto_35616 ) ) ( not ( = ?auto_35612 ?auto_35616 ) ) ( CLEAR ?auto_35611 ) ( ON ?auto_35612 ?auto_35613 ) ( CLEAR ?auto_35612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35616 ?auto_35615 ?auto_35614 ?auto_35613 )
      ( MAKE-4PILE ?auto_35611 ?auto_35612 ?auto_35613 ?auto_35614 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35617 - BLOCK
      ?auto_35618 - BLOCK
      ?auto_35619 - BLOCK
      ?auto_35620 - BLOCK
    )
    :vars
    (
      ?auto_35622 - BLOCK
      ?auto_35621 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35617 ?auto_35618 ) ) ( not ( = ?auto_35617 ?auto_35619 ) ) ( not ( = ?auto_35617 ?auto_35620 ) ) ( not ( = ?auto_35618 ?auto_35619 ) ) ( not ( = ?auto_35618 ?auto_35620 ) ) ( not ( = ?auto_35619 ?auto_35620 ) ) ( ON ?auto_35620 ?auto_35622 ) ( not ( = ?auto_35617 ?auto_35622 ) ) ( not ( = ?auto_35618 ?auto_35622 ) ) ( not ( = ?auto_35619 ?auto_35622 ) ) ( not ( = ?auto_35620 ?auto_35622 ) ) ( ON ?auto_35619 ?auto_35620 ) ( ON-TABLE ?auto_35621 ) ( ON ?auto_35622 ?auto_35621 ) ( not ( = ?auto_35621 ?auto_35622 ) ) ( not ( = ?auto_35621 ?auto_35620 ) ) ( not ( = ?auto_35621 ?auto_35619 ) ) ( not ( = ?auto_35617 ?auto_35621 ) ) ( not ( = ?auto_35618 ?auto_35621 ) ) ( ON ?auto_35618 ?auto_35619 ) ( CLEAR ?auto_35618 ) ( HOLDING ?auto_35617 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35617 )
      ( MAKE-4PILE ?auto_35617 ?auto_35618 ?auto_35619 ?auto_35620 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35623 - BLOCK
      ?auto_35624 - BLOCK
      ?auto_35625 - BLOCK
      ?auto_35626 - BLOCK
    )
    :vars
    (
      ?auto_35627 - BLOCK
      ?auto_35628 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35623 ?auto_35624 ) ) ( not ( = ?auto_35623 ?auto_35625 ) ) ( not ( = ?auto_35623 ?auto_35626 ) ) ( not ( = ?auto_35624 ?auto_35625 ) ) ( not ( = ?auto_35624 ?auto_35626 ) ) ( not ( = ?auto_35625 ?auto_35626 ) ) ( ON ?auto_35626 ?auto_35627 ) ( not ( = ?auto_35623 ?auto_35627 ) ) ( not ( = ?auto_35624 ?auto_35627 ) ) ( not ( = ?auto_35625 ?auto_35627 ) ) ( not ( = ?auto_35626 ?auto_35627 ) ) ( ON ?auto_35625 ?auto_35626 ) ( ON-TABLE ?auto_35628 ) ( ON ?auto_35627 ?auto_35628 ) ( not ( = ?auto_35628 ?auto_35627 ) ) ( not ( = ?auto_35628 ?auto_35626 ) ) ( not ( = ?auto_35628 ?auto_35625 ) ) ( not ( = ?auto_35623 ?auto_35628 ) ) ( not ( = ?auto_35624 ?auto_35628 ) ) ( ON ?auto_35624 ?auto_35625 ) ( ON ?auto_35623 ?auto_35624 ) ( CLEAR ?auto_35623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35628 ?auto_35627 ?auto_35626 ?auto_35625 ?auto_35624 )
      ( MAKE-4PILE ?auto_35623 ?auto_35624 ?auto_35625 ?auto_35626 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35633 - BLOCK
      ?auto_35634 - BLOCK
      ?auto_35635 - BLOCK
      ?auto_35636 - BLOCK
    )
    :vars
    (
      ?auto_35637 - BLOCK
      ?auto_35638 - BLOCK
      ?auto_35639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35633 ?auto_35634 ) ) ( not ( = ?auto_35633 ?auto_35635 ) ) ( not ( = ?auto_35633 ?auto_35636 ) ) ( not ( = ?auto_35634 ?auto_35635 ) ) ( not ( = ?auto_35634 ?auto_35636 ) ) ( not ( = ?auto_35635 ?auto_35636 ) ) ( ON ?auto_35636 ?auto_35637 ) ( not ( = ?auto_35633 ?auto_35637 ) ) ( not ( = ?auto_35634 ?auto_35637 ) ) ( not ( = ?auto_35635 ?auto_35637 ) ) ( not ( = ?auto_35636 ?auto_35637 ) ) ( ON ?auto_35635 ?auto_35636 ) ( ON-TABLE ?auto_35638 ) ( ON ?auto_35637 ?auto_35638 ) ( not ( = ?auto_35638 ?auto_35637 ) ) ( not ( = ?auto_35638 ?auto_35636 ) ) ( not ( = ?auto_35638 ?auto_35635 ) ) ( not ( = ?auto_35633 ?auto_35638 ) ) ( not ( = ?auto_35634 ?auto_35638 ) ) ( ON ?auto_35634 ?auto_35635 ) ( CLEAR ?auto_35634 ) ( ON ?auto_35633 ?auto_35639 ) ( CLEAR ?auto_35633 ) ( HAND-EMPTY ) ( not ( = ?auto_35633 ?auto_35639 ) ) ( not ( = ?auto_35634 ?auto_35639 ) ) ( not ( = ?auto_35635 ?auto_35639 ) ) ( not ( = ?auto_35636 ?auto_35639 ) ) ( not ( = ?auto_35637 ?auto_35639 ) ) ( not ( = ?auto_35638 ?auto_35639 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35633 ?auto_35639 )
      ( MAKE-4PILE ?auto_35633 ?auto_35634 ?auto_35635 ?auto_35636 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35640 - BLOCK
      ?auto_35641 - BLOCK
      ?auto_35642 - BLOCK
      ?auto_35643 - BLOCK
    )
    :vars
    (
      ?auto_35646 - BLOCK
      ?auto_35644 - BLOCK
      ?auto_35645 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35640 ?auto_35641 ) ) ( not ( = ?auto_35640 ?auto_35642 ) ) ( not ( = ?auto_35640 ?auto_35643 ) ) ( not ( = ?auto_35641 ?auto_35642 ) ) ( not ( = ?auto_35641 ?auto_35643 ) ) ( not ( = ?auto_35642 ?auto_35643 ) ) ( ON ?auto_35643 ?auto_35646 ) ( not ( = ?auto_35640 ?auto_35646 ) ) ( not ( = ?auto_35641 ?auto_35646 ) ) ( not ( = ?auto_35642 ?auto_35646 ) ) ( not ( = ?auto_35643 ?auto_35646 ) ) ( ON ?auto_35642 ?auto_35643 ) ( ON-TABLE ?auto_35644 ) ( ON ?auto_35646 ?auto_35644 ) ( not ( = ?auto_35644 ?auto_35646 ) ) ( not ( = ?auto_35644 ?auto_35643 ) ) ( not ( = ?auto_35644 ?auto_35642 ) ) ( not ( = ?auto_35640 ?auto_35644 ) ) ( not ( = ?auto_35641 ?auto_35644 ) ) ( ON ?auto_35640 ?auto_35645 ) ( CLEAR ?auto_35640 ) ( not ( = ?auto_35640 ?auto_35645 ) ) ( not ( = ?auto_35641 ?auto_35645 ) ) ( not ( = ?auto_35642 ?auto_35645 ) ) ( not ( = ?auto_35643 ?auto_35645 ) ) ( not ( = ?auto_35646 ?auto_35645 ) ) ( not ( = ?auto_35644 ?auto_35645 ) ) ( HOLDING ?auto_35641 ) ( CLEAR ?auto_35642 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35644 ?auto_35646 ?auto_35643 ?auto_35642 ?auto_35641 )
      ( MAKE-4PILE ?auto_35640 ?auto_35641 ?auto_35642 ?auto_35643 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35647 - BLOCK
      ?auto_35648 - BLOCK
      ?auto_35649 - BLOCK
      ?auto_35650 - BLOCK
    )
    :vars
    (
      ?auto_35652 - BLOCK
      ?auto_35651 - BLOCK
      ?auto_35653 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35647 ?auto_35648 ) ) ( not ( = ?auto_35647 ?auto_35649 ) ) ( not ( = ?auto_35647 ?auto_35650 ) ) ( not ( = ?auto_35648 ?auto_35649 ) ) ( not ( = ?auto_35648 ?auto_35650 ) ) ( not ( = ?auto_35649 ?auto_35650 ) ) ( ON ?auto_35650 ?auto_35652 ) ( not ( = ?auto_35647 ?auto_35652 ) ) ( not ( = ?auto_35648 ?auto_35652 ) ) ( not ( = ?auto_35649 ?auto_35652 ) ) ( not ( = ?auto_35650 ?auto_35652 ) ) ( ON ?auto_35649 ?auto_35650 ) ( ON-TABLE ?auto_35651 ) ( ON ?auto_35652 ?auto_35651 ) ( not ( = ?auto_35651 ?auto_35652 ) ) ( not ( = ?auto_35651 ?auto_35650 ) ) ( not ( = ?auto_35651 ?auto_35649 ) ) ( not ( = ?auto_35647 ?auto_35651 ) ) ( not ( = ?auto_35648 ?auto_35651 ) ) ( ON ?auto_35647 ?auto_35653 ) ( not ( = ?auto_35647 ?auto_35653 ) ) ( not ( = ?auto_35648 ?auto_35653 ) ) ( not ( = ?auto_35649 ?auto_35653 ) ) ( not ( = ?auto_35650 ?auto_35653 ) ) ( not ( = ?auto_35652 ?auto_35653 ) ) ( not ( = ?auto_35651 ?auto_35653 ) ) ( CLEAR ?auto_35649 ) ( ON ?auto_35648 ?auto_35647 ) ( CLEAR ?auto_35648 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35653 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35653 ?auto_35647 )
      ( MAKE-4PILE ?auto_35647 ?auto_35648 ?auto_35649 ?auto_35650 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35654 - BLOCK
      ?auto_35655 - BLOCK
      ?auto_35656 - BLOCK
      ?auto_35657 - BLOCK
    )
    :vars
    (
      ?auto_35658 - BLOCK
      ?auto_35660 - BLOCK
      ?auto_35659 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35654 ?auto_35655 ) ) ( not ( = ?auto_35654 ?auto_35656 ) ) ( not ( = ?auto_35654 ?auto_35657 ) ) ( not ( = ?auto_35655 ?auto_35656 ) ) ( not ( = ?auto_35655 ?auto_35657 ) ) ( not ( = ?auto_35656 ?auto_35657 ) ) ( ON ?auto_35657 ?auto_35658 ) ( not ( = ?auto_35654 ?auto_35658 ) ) ( not ( = ?auto_35655 ?auto_35658 ) ) ( not ( = ?auto_35656 ?auto_35658 ) ) ( not ( = ?auto_35657 ?auto_35658 ) ) ( ON-TABLE ?auto_35660 ) ( ON ?auto_35658 ?auto_35660 ) ( not ( = ?auto_35660 ?auto_35658 ) ) ( not ( = ?auto_35660 ?auto_35657 ) ) ( not ( = ?auto_35660 ?auto_35656 ) ) ( not ( = ?auto_35654 ?auto_35660 ) ) ( not ( = ?auto_35655 ?auto_35660 ) ) ( ON ?auto_35654 ?auto_35659 ) ( not ( = ?auto_35654 ?auto_35659 ) ) ( not ( = ?auto_35655 ?auto_35659 ) ) ( not ( = ?auto_35656 ?auto_35659 ) ) ( not ( = ?auto_35657 ?auto_35659 ) ) ( not ( = ?auto_35658 ?auto_35659 ) ) ( not ( = ?auto_35660 ?auto_35659 ) ) ( ON ?auto_35655 ?auto_35654 ) ( CLEAR ?auto_35655 ) ( ON-TABLE ?auto_35659 ) ( HOLDING ?auto_35656 ) ( CLEAR ?auto_35657 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35660 ?auto_35658 ?auto_35657 ?auto_35656 )
      ( MAKE-4PILE ?auto_35654 ?auto_35655 ?auto_35656 ?auto_35657 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35661 - BLOCK
      ?auto_35662 - BLOCK
      ?auto_35663 - BLOCK
      ?auto_35664 - BLOCK
    )
    :vars
    (
      ?auto_35666 - BLOCK
      ?auto_35667 - BLOCK
      ?auto_35665 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35661 ?auto_35662 ) ) ( not ( = ?auto_35661 ?auto_35663 ) ) ( not ( = ?auto_35661 ?auto_35664 ) ) ( not ( = ?auto_35662 ?auto_35663 ) ) ( not ( = ?auto_35662 ?auto_35664 ) ) ( not ( = ?auto_35663 ?auto_35664 ) ) ( ON ?auto_35664 ?auto_35666 ) ( not ( = ?auto_35661 ?auto_35666 ) ) ( not ( = ?auto_35662 ?auto_35666 ) ) ( not ( = ?auto_35663 ?auto_35666 ) ) ( not ( = ?auto_35664 ?auto_35666 ) ) ( ON-TABLE ?auto_35667 ) ( ON ?auto_35666 ?auto_35667 ) ( not ( = ?auto_35667 ?auto_35666 ) ) ( not ( = ?auto_35667 ?auto_35664 ) ) ( not ( = ?auto_35667 ?auto_35663 ) ) ( not ( = ?auto_35661 ?auto_35667 ) ) ( not ( = ?auto_35662 ?auto_35667 ) ) ( ON ?auto_35661 ?auto_35665 ) ( not ( = ?auto_35661 ?auto_35665 ) ) ( not ( = ?auto_35662 ?auto_35665 ) ) ( not ( = ?auto_35663 ?auto_35665 ) ) ( not ( = ?auto_35664 ?auto_35665 ) ) ( not ( = ?auto_35666 ?auto_35665 ) ) ( not ( = ?auto_35667 ?auto_35665 ) ) ( ON ?auto_35662 ?auto_35661 ) ( ON-TABLE ?auto_35665 ) ( CLEAR ?auto_35664 ) ( ON ?auto_35663 ?auto_35662 ) ( CLEAR ?auto_35663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35665 ?auto_35661 ?auto_35662 )
      ( MAKE-4PILE ?auto_35661 ?auto_35662 ?auto_35663 ?auto_35664 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35668 - BLOCK
      ?auto_35669 - BLOCK
      ?auto_35670 - BLOCK
      ?auto_35671 - BLOCK
    )
    :vars
    (
      ?auto_35673 - BLOCK
      ?auto_35674 - BLOCK
      ?auto_35672 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35668 ?auto_35669 ) ) ( not ( = ?auto_35668 ?auto_35670 ) ) ( not ( = ?auto_35668 ?auto_35671 ) ) ( not ( = ?auto_35669 ?auto_35670 ) ) ( not ( = ?auto_35669 ?auto_35671 ) ) ( not ( = ?auto_35670 ?auto_35671 ) ) ( not ( = ?auto_35668 ?auto_35673 ) ) ( not ( = ?auto_35669 ?auto_35673 ) ) ( not ( = ?auto_35670 ?auto_35673 ) ) ( not ( = ?auto_35671 ?auto_35673 ) ) ( ON-TABLE ?auto_35674 ) ( ON ?auto_35673 ?auto_35674 ) ( not ( = ?auto_35674 ?auto_35673 ) ) ( not ( = ?auto_35674 ?auto_35671 ) ) ( not ( = ?auto_35674 ?auto_35670 ) ) ( not ( = ?auto_35668 ?auto_35674 ) ) ( not ( = ?auto_35669 ?auto_35674 ) ) ( ON ?auto_35668 ?auto_35672 ) ( not ( = ?auto_35668 ?auto_35672 ) ) ( not ( = ?auto_35669 ?auto_35672 ) ) ( not ( = ?auto_35670 ?auto_35672 ) ) ( not ( = ?auto_35671 ?auto_35672 ) ) ( not ( = ?auto_35673 ?auto_35672 ) ) ( not ( = ?auto_35674 ?auto_35672 ) ) ( ON ?auto_35669 ?auto_35668 ) ( ON-TABLE ?auto_35672 ) ( ON ?auto_35670 ?auto_35669 ) ( CLEAR ?auto_35670 ) ( HOLDING ?auto_35671 ) ( CLEAR ?auto_35673 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35674 ?auto_35673 ?auto_35671 )
      ( MAKE-4PILE ?auto_35668 ?auto_35669 ?auto_35670 ?auto_35671 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35675 - BLOCK
      ?auto_35676 - BLOCK
      ?auto_35677 - BLOCK
      ?auto_35678 - BLOCK
    )
    :vars
    (
      ?auto_35681 - BLOCK
      ?auto_35680 - BLOCK
      ?auto_35679 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35675 ?auto_35676 ) ) ( not ( = ?auto_35675 ?auto_35677 ) ) ( not ( = ?auto_35675 ?auto_35678 ) ) ( not ( = ?auto_35676 ?auto_35677 ) ) ( not ( = ?auto_35676 ?auto_35678 ) ) ( not ( = ?auto_35677 ?auto_35678 ) ) ( not ( = ?auto_35675 ?auto_35681 ) ) ( not ( = ?auto_35676 ?auto_35681 ) ) ( not ( = ?auto_35677 ?auto_35681 ) ) ( not ( = ?auto_35678 ?auto_35681 ) ) ( ON-TABLE ?auto_35680 ) ( ON ?auto_35681 ?auto_35680 ) ( not ( = ?auto_35680 ?auto_35681 ) ) ( not ( = ?auto_35680 ?auto_35678 ) ) ( not ( = ?auto_35680 ?auto_35677 ) ) ( not ( = ?auto_35675 ?auto_35680 ) ) ( not ( = ?auto_35676 ?auto_35680 ) ) ( ON ?auto_35675 ?auto_35679 ) ( not ( = ?auto_35675 ?auto_35679 ) ) ( not ( = ?auto_35676 ?auto_35679 ) ) ( not ( = ?auto_35677 ?auto_35679 ) ) ( not ( = ?auto_35678 ?auto_35679 ) ) ( not ( = ?auto_35681 ?auto_35679 ) ) ( not ( = ?auto_35680 ?auto_35679 ) ) ( ON ?auto_35676 ?auto_35675 ) ( ON-TABLE ?auto_35679 ) ( ON ?auto_35677 ?auto_35676 ) ( CLEAR ?auto_35681 ) ( ON ?auto_35678 ?auto_35677 ) ( CLEAR ?auto_35678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35679 ?auto_35675 ?auto_35676 ?auto_35677 )
      ( MAKE-4PILE ?auto_35675 ?auto_35676 ?auto_35677 ?auto_35678 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35682 - BLOCK
      ?auto_35683 - BLOCK
      ?auto_35684 - BLOCK
      ?auto_35685 - BLOCK
    )
    :vars
    (
      ?auto_35686 - BLOCK
      ?auto_35687 - BLOCK
      ?auto_35688 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35682 ?auto_35683 ) ) ( not ( = ?auto_35682 ?auto_35684 ) ) ( not ( = ?auto_35682 ?auto_35685 ) ) ( not ( = ?auto_35683 ?auto_35684 ) ) ( not ( = ?auto_35683 ?auto_35685 ) ) ( not ( = ?auto_35684 ?auto_35685 ) ) ( not ( = ?auto_35682 ?auto_35686 ) ) ( not ( = ?auto_35683 ?auto_35686 ) ) ( not ( = ?auto_35684 ?auto_35686 ) ) ( not ( = ?auto_35685 ?auto_35686 ) ) ( ON-TABLE ?auto_35687 ) ( not ( = ?auto_35687 ?auto_35686 ) ) ( not ( = ?auto_35687 ?auto_35685 ) ) ( not ( = ?auto_35687 ?auto_35684 ) ) ( not ( = ?auto_35682 ?auto_35687 ) ) ( not ( = ?auto_35683 ?auto_35687 ) ) ( ON ?auto_35682 ?auto_35688 ) ( not ( = ?auto_35682 ?auto_35688 ) ) ( not ( = ?auto_35683 ?auto_35688 ) ) ( not ( = ?auto_35684 ?auto_35688 ) ) ( not ( = ?auto_35685 ?auto_35688 ) ) ( not ( = ?auto_35686 ?auto_35688 ) ) ( not ( = ?auto_35687 ?auto_35688 ) ) ( ON ?auto_35683 ?auto_35682 ) ( ON-TABLE ?auto_35688 ) ( ON ?auto_35684 ?auto_35683 ) ( ON ?auto_35685 ?auto_35684 ) ( CLEAR ?auto_35685 ) ( HOLDING ?auto_35686 ) ( CLEAR ?auto_35687 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35687 ?auto_35686 )
      ( MAKE-4PILE ?auto_35682 ?auto_35683 ?auto_35684 ?auto_35685 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35689 - BLOCK
      ?auto_35690 - BLOCK
      ?auto_35691 - BLOCK
      ?auto_35692 - BLOCK
    )
    :vars
    (
      ?auto_35693 - BLOCK
      ?auto_35695 - BLOCK
      ?auto_35694 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35689 ?auto_35690 ) ) ( not ( = ?auto_35689 ?auto_35691 ) ) ( not ( = ?auto_35689 ?auto_35692 ) ) ( not ( = ?auto_35690 ?auto_35691 ) ) ( not ( = ?auto_35690 ?auto_35692 ) ) ( not ( = ?auto_35691 ?auto_35692 ) ) ( not ( = ?auto_35689 ?auto_35693 ) ) ( not ( = ?auto_35690 ?auto_35693 ) ) ( not ( = ?auto_35691 ?auto_35693 ) ) ( not ( = ?auto_35692 ?auto_35693 ) ) ( ON-TABLE ?auto_35695 ) ( not ( = ?auto_35695 ?auto_35693 ) ) ( not ( = ?auto_35695 ?auto_35692 ) ) ( not ( = ?auto_35695 ?auto_35691 ) ) ( not ( = ?auto_35689 ?auto_35695 ) ) ( not ( = ?auto_35690 ?auto_35695 ) ) ( ON ?auto_35689 ?auto_35694 ) ( not ( = ?auto_35689 ?auto_35694 ) ) ( not ( = ?auto_35690 ?auto_35694 ) ) ( not ( = ?auto_35691 ?auto_35694 ) ) ( not ( = ?auto_35692 ?auto_35694 ) ) ( not ( = ?auto_35693 ?auto_35694 ) ) ( not ( = ?auto_35695 ?auto_35694 ) ) ( ON ?auto_35690 ?auto_35689 ) ( ON-TABLE ?auto_35694 ) ( ON ?auto_35691 ?auto_35690 ) ( ON ?auto_35692 ?auto_35691 ) ( CLEAR ?auto_35695 ) ( ON ?auto_35693 ?auto_35692 ) ( CLEAR ?auto_35693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35694 ?auto_35689 ?auto_35690 ?auto_35691 ?auto_35692 )
      ( MAKE-4PILE ?auto_35689 ?auto_35690 ?auto_35691 ?auto_35692 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35696 - BLOCK
      ?auto_35697 - BLOCK
      ?auto_35698 - BLOCK
      ?auto_35699 - BLOCK
    )
    :vars
    (
      ?auto_35701 - BLOCK
      ?auto_35702 - BLOCK
      ?auto_35700 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35696 ?auto_35697 ) ) ( not ( = ?auto_35696 ?auto_35698 ) ) ( not ( = ?auto_35696 ?auto_35699 ) ) ( not ( = ?auto_35697 ?auto_35698 ) ) ( not ( = ?auto_35697 ?auto_35699 ) ) ( not ( = ?auto_35698 ?auto_35699 ) ) ( not ( = ?auto_35696 ?auto_35701 ) ) ( not ( = ?auto_35697 ?auto_35701 ) ) ( not ( = ?auto_35698 ?auto_35701 ) ) ( not ( = ?auto_35699 ?auto_35701 ) ) ( not ( = ?auto_35702 ?auto_35701 ) ) ( not ( = ?auto_35702 ?auto_35699 ) ) ( not ( = ?auto_35702 ?auto_35698 ) ) ( not ( = ?auto_35696 ?auto_35702 ) ) ( not ( = ?auto_35697 ?auto_35702 ) ) ( ON ?auto_35696 ?auto_35700 ) ( not ( = ?auto_35696 ?auto_35700 ) ) ( not ( = ?auto_35697 ?auto_35700 ) ) ( not ( = ?auto_35698 ?auto_35700 ) ) ( not ( = ?auto_35699 ?auto_35700 ) ) ( not ( = ?auto_35701 ?auto_35700 ) ) ( not ( = ?auto_35702 ?auto_35700 ) ) ( ON ?auto_35697 ?auto_35696 ) ( ON-TABLE ?auto_35700 ) ( ON ?auto_35698 ?auto_35697 ) ( ON ?auto_35699 ?auto_35698 ) ( ON ?auto_35701 ?auto_35699 ) ( CLEAR ?auto_35701 ) ( HOLDING ?auto_35702 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35702 )
      ( MAKE-4PILE ?auto_35696 ?auto_35697 ?auto_35698 ?auto_35699 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35703 - BLOCK
      ?auto_35704 - BLOCK
      ?auto_35705 - BLOCK
      ?auto_35706 - BLOCK
    )
    :vars
    (
      ?auto_35707 - BLOCK
      ?auto_35709 - BLOCK
      ?auto_35708 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35703 ?auto_35704 ) ) ( not ( = ?auto_35703 ?auto_35705 ) ) ( not ( = ?auto_35703 ?auto_35706 ) ) ( not ( = ?auto_35704 ?auto_35705 ) ) ( not ( = ?auto_35704 ?auto_35706 ) ) ( not ( = ?auto_35705 ?auto_35706 ) ) ( not ( = ?auto_35703 ?auto_35707 ) ) ( not ( = ?auto_35704 ?auto_35707 ) ) ( not ( = ?auto_35705 ?auto_35707 ) ) ( not ( = ?auto_35706 ?auto_35707 ) ) ( not ( = ?auto_35709 ?auto_35707 ) ) ( not ( = ?auto_35709 ?auto_35706 ) ) ( not ( = ?auto_35709 ?auto_35705 ) ) ( not ( = ?auto_35703 ?auto_35709 ) ) ( not ( = ?auto_35704 ?auto_35709 ) ) ( ON ?auto_35703 ?auto_35708 ) ( not ( = ?auto_35703 ?auto_35708 ) ) ( not ( = ?auto_35704 ?auto_35708 ) ) ( not ( = ?auto_35705 ?auto_35708 ) ) ( not ( = ?auto_35706 ?auto_35708 ) ) ( not ( = ?auto_35707 ?auto_35708 ) ) ( not ( = ?auto_35709 ?auto_35708 ) ) ( ON ?auto_35704 ?auto_35703 ) ( ON-TABLE ?auto_35708 ) ( ON ?auto_35705 ?auto_35704 ) ( ON ?auto_35706 ?auto_35705 ) ( ON ?auto_35707 ?auto_35706 ) ( ON ?auto_35709 ?auto_35707 ) ( CLEAR ?auto_35709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_35708 ?auto_35703 ?auto_35704 ?auto_35705 ?auto_35706 ?auto_35707 )
      ( MAKE-4PILE ?auto_35703 ?auto_35704 ?auto_35705 ?auto_35706 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35721 - BLOCK
    )
    :vars
    (
      ?auto_35724 - BLOCK
      ?auto_35722 - BLOCK
      ?auto_35723 - BLOCK
      ?auto_35726 - BLOCK
      ?auto_35725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35724 ?auto_35721 ) ( ON-TABLE ?auto_35721 ) ( not ( = ?auto_35721 ?auto_35724 ) ) ( not ( = ?auto_35721 ?auto_35722 ) ) ( not ( = ?auto_35721 ?auto_35723 ) ) ( not ( = ?auto_35724 ?auto_35722 ) ) ( not ( = ?auto_35724 ?auto_35723 ) ) ( not ( = ?auto_35722 ?auto_35723 ) ) ( ON ?auto_35722 ?auto_35724 ) ( CLEAR ?auto_35722 ) ( HOLDING ?auto_35723 ) ( CLEAR ?auto_35726 ) ( ON-TABLE ?auto_35725 ) ( ON ?auto_35726 ?auto_35725 ) ( not ( = ?auto_35725 ?auto_35726 ) ) ( not ( = ?auto_35725 ?auto_35723 ) ) ( not ( = ?auto_35726 ?auto_35723 ) ) ( not ( = ?auto_35721 ?auto_35726 ) ) ( not ( = ?auto_35721 ?auto_35725 ) ) ( not ( = ?auto_35724 ?auto_35726 ) ) ( not ( = ?auto_35724 ?auto_35725 ) ) ( not ( = ?auto_35722 ?auto_35726 ) ) ( not ( = ?auto_35722 ?auto_35725 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35725 ?auto_35726 ?auto_35723 )
      ( MAKE-1PILE ?auto_35721 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35727 - BLOCK
    )
    :vars
    (
      ?auto_35730 - BLOCK
      ?auto_35728 - BLOCK
      ?auto_35729 - BLOCK
      ?auto_35732 - BLOCK
      ?auto_35731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35730 ?auto_35727 ) ( ON-TABLE ?auto_35727 ) ( not ( = ?auto_35727 ?auto_35730 ) ) ( not ( = ?auto_35727 ?auto_35728 ) ) ( not ( = ?auto_35727 ?auto_35729 ) ) ( not ( = ?auto_35730 ?auto_35728 ) ) ( not ( = ?auto_35730 ?auto_35729 ) ) ( not ( = ?auto_35728 ?auto_35729 ) ) ( ON ?auto_35728 ?auto_35730 ) ( CLEAR ?auto_35732 ) ( ON-TABLE ?auto_35731 ) ( ON ?auto_35732 ?auto_35731 ) ( not ( = ?auto_35731 ?auto_35732 ) ) ( not ( = ?auto_35731 ?auto_35729 ) ) ( not ( = ?auto_35732 ?auto_35729 ) ) ( not ( = ?auto_35727 ?auto_35732 ) ) ( not ( = ?auto_35727 ?auto_35731 ) ) ( not ( = ?auto_35730 ?auto_35732 ) ) ( not ( = ?auto_35730 ?auto_35731 ) ) ( not ( = ?auto_35728 ?auto_35732 ) ) ( not ( = ?auto_35728 ?auto_35731 ) ) ( ON ?auto_35729 ?auto_35728 ) ( CLEAR ?auto_35729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35727 ?auto_35730 ?auto_35728 )
      ( MAKE-1PILE ?auto_35727 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35733 - BLOCK
    )
    :vars
    (
      ?auto_35736 - BLOCK
      ?auto_35735 - BLOCK
      ?auto_35738 - BLOCK
      ?auto_35737 - BLOCK
      ?auto_35734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35736 ?auto_35733 ) ( ON-TABLE ?auto_35733 ) ( not ( = ?auto_35733 ?auto_35736 ) ) ( not ( = ?auto_35733 ?auto_35735 ) ) ( not ( = ?auto_35733 ?auto_35738 ) ) ( not ( = ?auto_35736 ?auto_35735 ) ) ( not ( = ?auto_35736 ?auto_35738 ) ) ( not ( = ?auto_35735 ?auto_35738 ) ) ( ON ?auto_35735 ?auto_35736 ) ( ON-TABLE ?auto_35737 ) ( not ( = ?auto_35737 ?auto_35734 ) ) ( not ( = ?auto_35737 ?auto_35738 ) ) ( not ( = ?auto_35734 ?auto_35738 ) ) ( not ( = ?auto_35733 ?auto_35734 ) ) ( not ( = ?auto_35733 ?auto_35737 ) ) ( not ( = ?auto_35736 ?auto_35734 ) ) ( not ( = ?auto_35736 ?auto_35737 ) ) ( not ( = ?auto_35735 ?auto_35734 ) ) ( not ( = ?auto_35735 ?auto_35737 ) ) ( ON ?auto_35738 ?auto_35735 ) ( CLEAR ?auto_35738 ) ( HOLDING ?auto_35734 ) ( CLEAR ?auto_35737 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35737 ?auto_35734 )
      ( MAKE-1PILE ?auto_35733 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35739 - BLOCK
    )
    :vars
    (
      ?auto_35740 - BLOCK
      ?auto_35744 - BLOCK
      ?auto_35742 - BLOCK
      ?auto_35741 - BLOCK
      ?auto_35743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35740 ?auto_35739 ) ( ON-TABLE ?auto_35739 ) ( not ( = ?auto_35739 ?auto_35740 ) ) ( not ( = ?auto_35739 ?auto_35744 ) ) ( not ( = ?auto_35739 ?auto_35742 ) ) ( not ( = ?auto_35740 ?auto_35744 ) ) ( not ( = ?auto_35740 ?auto_35742 ) ) ( not ( = ?auto_35744 ?auto_35742 ) ) ( ON ?auto_35744 ?auto_35740 ) ( ON-TABLE ?auto_35741 ) ( not ( = ?auto_35741 ?auto_35743 ) ) ( not ( = ?auto_35741 ?auto_35742 ) ) ( not ( = ?auto_35743 ?auto_35742 ) ) ( not ( = ?auto_35739 ?auto_35743 ) ) ( not ( = ?auto_35739 ?auto_35741 ) ) ( not ( = ?auto_35740 ?auto_35743 ) ) ( not ( = ?auto_35740 ?auto_35741 ) ) ( not ( = ?auto_35744 ?auto_35743 ) ) ( not ( = ?auto_35744 ?auto_35741 ) ) ( ON ?auto_35742 ?auto_35744 ) ( CLEAR ?auto_35741 ) ( ON ?auto_35743 ?auto_35742 ) ( CLEAR ?auto_35743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35739 ?auto_35740 ?auto_35744 ?auto_35742 )
      ( MAKE-1PILE ?auto_35739 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35745 - BLOCK
    )
    :vars
    (
      ?auto_35749 - BLOCK
      ?auto_35747 - BLOCK
      ?auto_35748 - BLOCK
      ?auto_35746 - BLOCK
      ?auto_35750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35749 ?auto_35745 ) ( ON-TABLE ?auto_35745 ) ( not ( = ?auto_35745 ?auto_35749 ) ) ( not ( = ?auto_35745 ?auto_35747 ) ) ( not ( = ?auto_35745 ?auto_35748 ) ) ( not ( = ?auto_35749 ?auto_35747 ) ) ( not ( = ?auto_35749 ?auto_35748 ) ) ( not ( = ?auto_35747 ?auto_35748 ) ) ( ON ?auto_35747 ?auto_35749 ) ( not ( = ?auto_35746 ?auto_35750 ) ) ( not ( = ?auto_35746 ?auto_35748 ) ) ( not ( = ?auto_35750 ?auto_35748 ) ) ( not ( = ?auto_35745 ?auto_35750 ) ) ( not ( = ?auto_35745 ?auto_35746 ) ) ( not ( = ?auto_35749 ?auto_35750 ) ) ( not ( = ?auto_35749 ?auto_35746 ) ) ( not ( = ?auto_35747 ?auto_35750 ) ) ( not ( = ?auto_35747 ?auto_35746 ) ) ( ON ?auto_35748 ?auto_35747 ) ( ON ?auto_35750 ?auto_35748 ) ( CLEAR ?auto_35750 ) ( HOLDING ?auto_35746 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35746 )
      ( MAKE-1PILE ?auto_35745 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35758 - BLOCK
    )
    :vars
    (
      ?auto_35759 - BLOCK
      ?auto_35762 - BLOCK
      ?auto_35763 - BLOCK
      ?auto_35760 - BLOCK
      ?auto_35761 - BLOCK
      ?auto_35764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35759 ?auto_35758 ) ( ON-TABLE ?auto_35758 ) ( not ( = ?auto_35758 ?auto_35759 ) ) ( not ( = ?auto_35758 ?auto_35762 ) ) ( not ( = ?auto_35758 ?auto_35763 ) ) ( not ( = ?auto_35759 ?auto_35762 ) ) ( not ( = ?auto_35759 ?auto_35763 ) ) ( not ( = ?auto_35762 ?auto_35763 ) ) ( ON ?auto_35762 ?auto_35759 ) ( not ( = ?auto_35760 ?auto_35761 ) ) ( not ( = ?auto_35760 ?auto_35763 ) ) ( not ( = ?auto_35761 ?auto_35763 ) ) ( not ( = ?auto_35758 ?auto_35761 ) ) ( not ( = ?auto_35758 ?auto_35760 ) ) ( not ( = ?auto_35759 ?auto_35761 ) ) ( not ( = ?auto_35759 ?auto_35760 ) ) ( not ( = ?auto_35762 ?auto_35761 ) ) ( not ( = ?auto_35762 ?auto_35760 ) ) ( ON ?auto_35763 ?auto_35762 ) ( ON ?auto_35761 ?auto_35763 ) ( CLEAR ?auto_35761 ) ( ON ?auto_35760 ?auto_35764 ) ( CLEAR ?auto_35760 ) ( HAND-EMPTY ) ( not ( = ?auto_35758 ?auto_35764 ) ) ( not ( = ?auto_35759 ?auto_35764 ) ) ( not ( = ?auto_35762 ?auto_35764 ) ) ( not ( = ?auto_35763 ?auto_35764 ) ) ( not ( = ?auto_35760 ?auto_35764 ) ) ( not ( = ?auto_35761 ?auto_35764 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35760 ?auto_35764 )
      ( MAKE-1PILE ?auto_35758 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35765 - BLOCK
    )
    :vars
    (
      ?auto_35768 - BLOCK
      ?auto_35771 - BLOCK
      ?auto_35767 - BLOCK
      ?auto_35770 - BLOCK
      ?auto_35769 - BLOCK
      ?auto_35766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35768 ?auto_35765 ) ( ON-TABLE ?auto_35765 ) ( not ( = ?auto_35765 ?auto_35768 ) ) ( not ( = ?auto_35765 ?auto_35771 ) ) ( not ( = ?auto_35765 ?auto_35767 ) ) ( not ( = ?auto_35768 ?auto_35771 ) ) ( not ( = ?auto_35768 ?auto_35767 ) ) ( not ( = ?auto_35771 ?auto_35767 ) ) ( ON ?auto_35771 ?auto_35768 ) ( not ( = ?auto_35770 ?auto_35769 ) ) ( not ( = ?auto_35770 ?auto_35767 ) ) ( not ( = ?auto_35769 ?auto_35767 ) ) ( not ( = ?auto_35765 ?auto_35769 ) ) ( not ( = ?auto_35765 ?auto_35770 ) ) ( not ( = ?auto_35768 ?auto_35769 ) ) ( not ( = ?auto_35768 ?auto_35770 ) ) ( not ( = ?auto_35771 ?auto_35769 ) ) ( not ( = ?auto_35771 ?auto_35770 ) ) ( ON ?auto_35767 ?auto_35771 ) ( ON ?auto_35770 ?auto_35766 ) ( CLEAR ?auto_35770 ) ( not ( = ?auto_35765 ?auto_35766 ) ) ( not ( = ?auto_35768 ?auto_35766 ) ) ( not ( = ?auto_35771 ?auto_35766 ) ) ( not ( = ?auto_35767 ?auto_35766 ) ) ( not ( = ?auto_35770 ?auto_35766 ) ) ( not ( = ?auto_35769 ?auto_35766 ) ) ( HOLDING ?auto_35769 ) ( CLEAR ?auto_35767 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35765 ?auto_35768 ?auto_35771 ?auto_35767 ?auto_35769 )
      ( MAKE-1PILE ?auto_35765 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35772 - BLOCK
    )
    :vars
    (
      ?auto_35773 - BLOCK
      ?auto_35774 - BLOCK
      ?auto_35777 - BLOCK
      ?auto_35778 - BLOCK
      ?auto_35776 - BLOCK
      ?auto_35775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35773 ?auto_35772 ) ( ON-TABLE ?auto_35772 ) ( not ( = ?auto_35772 ?auto_35773 ) ) ( not ( = ?auto_35772 ?auto_35774 ) ) ( not ( = ?auto_35772 ?auto_35777 ) ) ( not ( = ?auto_35773 ?auto_35774 ) ) ( not ( = ?auto_35773 ?auto_35777 ) ) ( not ( = ?auto_35774 ?auto_35777 ) ) ( ON ?auto_35774 ?auto_35773 ) ( not ( = ?auto_35778 ?auto_35776 ) ) ( not ( = ?auto_35778 ?auto_35777 ) ) ( not ( = ?auto_35776 ?auto_35777 ) ) ( not ( = ?auto_35772 ?auto_35776 ) ) ( not ( = ?auto_35772 ?auto_35778 ) ) ( not ( = ?auto_35773 ?auto_35776 ) ) ( not ( = ?auto_35773 ?auto_35778 ) ) ( not ( = ?auto_35774 ?auto_35776 ) ) ( not ( = ?auto_35774 ?auto_35778 ) ) ( ON ?auto_35777 ?auto_35774 ) ( ON ?auto_35778 ?auto_35775 ) ( not ( = ?auto_35772 ?auto_35775 ) ) ( not ( = ?auto_35773 ?auto_35775 ) ) ( not ( = ?auto_35774 ?auto_35775 ) ) ( not ( = ?auto_35777 ?auto_35775 ) ) ( not ( = ?auto_35778 ?auto_35775 ) ) ( not ( = ?auto_35776 ?auto_35775 ) ) ( CLEAR ?auto_35777 ) ( ON ?auto_35776 ?auto_35778 ) ( CLEAR ?auto_35776 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35775 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35775 ?auto_35778 )
      ( MAKE-1PILE ?auto_35772 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35812 - BLOCK
      ?auto_35813 - BLOCK
      ?auto_35814 - BLOCK
      ?auto_35815 - BLOCK
      ?auto_35816 - BLOCK
    )
    :vars
    (
      ?auto_35817 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35812 ) ( ON ?auto_35813 ?auto_35812 ) ( ON ?auto_35814 ?auto_35813 ) ( not ( = ?auto_35812 ?auto_35813 ) ) ( not ( = ?auto_35812 ?auto_35814 ) ) ( not ( = ?auto_35812 ?auto_35815 ) ) ( not ( = ?auto_35812 ?auto_35816 ) ) ( not ( = ?auto_35813 ?auto_35814 ) ) ( not ( = ?auto_35813 ?auto_35815 ) ) ( not ( = ?auto_35813 ?auto_35816 ) ) ( not ( = ?auto_35814 ?auto_35815 ) ) ( not ( = ?auto_35814 ?auto_35816 ) ) ( not ( = ?auto_35815 ?auto_35816 ) ) ( ON ?auto_35816 ?auto_35817 ) ( not ( = ?auto_35812 ?auto_35817 ) ) ( not ( = ?auto_35813 ?auto_35817 ) ) ( not ( = ?auto_35814 ?auto_35817 ) ) ( not ( = ?auto_35815 ?auto_35817 ) ) ( not ( = ?auto_35816 ?auto_35817 ) ) ( CLEAR ?auto_35814 ) ( ON ?auto_35815 ?auto_35816 ) ( CLEAR ?auto_35815 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35817 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35817 ?auto_35816 )
      ( MAKE-5PILE ?auto_35812 ?auto_35813 ?auto_35814 ?auto_35815 ?auto_35816 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35818 - BLOCK
      ?auto_35819 - BLOCK
      ?auto_35820 - BLOCK
      ?auto_35821 - BLOCK
      ?auto_35822 - BLOCK
    )
    :vars
    (
      ?auto_35823 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35818 ) ( ON ?auto_35819 ?auto_35818 ) ( not ( = ?auto_35818 ?auto_35819 ) ) ( not ( = ?auto_35818 ?auto_35820 ) ) ( not ( = ?auto_35818 ?auto_35821 ) ) ( not ( = ?auto_35818 ?auto_35822 ) ) ( not ( = ?auto_35819 ?auto_35820 ) ) ( not ( = ?auto_35819 ?auto_35821 ) ) ( not ( = ?auto_35819 ?auto_35822 ) ) ( not ( = ?auto_35820 ?auto_35821 ) ) ( not ( = ?auto_35820 ?auto_35822 ) ) ( not ( = ?auto_35821 ?auto_35822 ) ) ( ON ?auto_35822 ?auto_35823 ) ( not ( = ?auto_35818 ?auto_35823 ) ) ( not ( = ?auto_35819 ?auto_35823 ) ) ( not ( = ?auto_35820 ?auto_35823 ) ) ( not ( = ?auto_35821 ?auto_35823 ) ) ( not ( = ?auto_35822 ?auto_35823 ) ) ( ON ?auto_35821 ?auto_35822 ) ( CLEAR ?auto_35821 ) ( ON-TABLE ?auto_35823 ) ( HOLDING ?auto_35820 ) ( CLEAR ?auto_35819 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35818 ?auto_35819 ?auto_35820 )
      ( MAKE-5PILE ?auto_35818 ?auto_35819 ?auto_35820 ?auto_35821 ?auto_35822 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35824 - BLOCK
      ?auto_35825 - BLOCK
      ?auto_35826 - BLOCK
      ?auto_35827 - BLOCK
      ?auto_35828 - BLOCK
    )
    :vars
    (
      ?auto_35829 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35824 ) ( ON ?auto_35825 ?auto_35824 ) ( not ( = ?auto_35824 ?auto_35825 ) ) ( not ( = ?auto_35824 ?auto_35826 ) ) ( not ( = ?auto_35824 ?auto_35827 ) ) ( not ( = ?auto_35824 ?auto_35828 ) ) ( not ( = ?auto_35825 ?auto_35826 ) ) ( not ( = ?auto_35825 ?auto_35827 ) ) ( not ( = ?auto_35825 ?auto_35828 ) ) ( not ( = ?auto_35826 ?auto_35827 ) ) ( not ( = ?auto_35826 ?auto_35828 ) ) ( not ( = ?auto_35827 ?auto_35828 ) ) ( ON ?auto_35828 ?auto_35829 ) ( not ( = ?auto_35824 ?auto_35829 ) ) ( not ( = ?auto_35825 ?auto_35829 ) ) ( not ( = ?auto_35826 ?auto_35829 ) ) ( not ( = ?auto_35827 ?auto_35829 ) ) ( not ( = ?auto_35828 ?auto_35829 ) ) ( ON ?auto_35827 ?auto_35828 ) ( ON-TABLE ?auto_35829 ) ( CLEAR ?auto_35825 ) ( ON ?auto_35826 ?auto_35827 ) ( CLEAR ?auto_35826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35829 ?auto_35828 ?auto_35827 )
      ( MAKE-5PILE ?auto_35824 ?auto_35825 ?auto_35826 ?auto_35827 ?auto_35828 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
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
    ( and ( ON-TABLE ?auto_35830 ) ( not ( = ?auto_35830 ?auto_35831 ) ) ( not ( = ?auto_35830 ?auto_35832 ) ) ( not ( = ?auto_35830 ?auto_35833 ) ) ( not ( = ?auto_35830 ?auto_35834 ) ) ( not ( = ?auto_35831 ?auto_35832 ) ) ( not ( = ?auto_35831 ?auto_35833 ) ) ( not ( = ?auto_35831 ?auto_35834 ) ) ( not ( = ?auto_35832 ?auto_35833 ) ) ( not ( = ?auto_35832 ?auto_35834 ) ) ( not ( = ?auto_35833 ?auto_35834 ) ) ( ON ?auto_35834 ?auto_35835 ) ( not ( = ?auto_35830 ?auto_35835 ) ) ( not ( = ?auto_35831 ?auto_35835 ) ) ( not ( = ?auto_35832 ?auto_35835 ) ) ( not ( = ?auto_35833 ?auto_35835 ) ) ( not ( = ?auto_35834 ?auto_35835 ) ) ( ON ?auto_35833 ?auto_35834 ) ( ON-TABLE ?auto_35835 ) ( ON ?auto_35832 ?auto_35833 ) ( CLEAR ?auto_35832 ) ( HOLDING ?auto_35831 ) ( CLEAR ?auto_35830 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35830 ?auto_35831 )
      ( MAKE-5PILE ?auto_35830 ?auto_35831 ?auto_35832 ?auto_35833 ?auto_35834 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35836 - BLOCK
      ?auto_35837 - BLOCK
      ?auto_35838 - BLOCK
      ?auto_35839 - BLOCK
      ?auto_35840 - BLOCK
    )
    :vars
    (
      ?auto_35841 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35836 ) ( not ( = ?auto_35836 ?auto_35837 ) ) ( not ( = ?auto_35836 ?auto_35838 ) ) ( not ( = ?auto_35836 ?auto_35839 ) ) ( not ( = ?auto_35836 ?auto_35840 ) ) ( not ( = ?auto_35837 ?auto_35838 ) ) ( not ( = ?auto_35837 ?auto_35839 ) ) ( not ( = ?auto_35837 ?auto_35840 ) ) ( not ( = ?auto_35838 ?auto_35839 ) ) ( not ( = ?auto_35838 ?auto_35840 ) ) ( not ( = ?auto_35839 ?auto_35840 ) ) ( ON ?auto_35840 ?auto_35841 ) ( not ( = ?auto_35836 ?auto_35841 ) ) ( not ( = ?auto_35837 ?auto_35841 ) ) ( not ( = ?auto_35838 ?auto_35841 ) ) ( not ( = ?auto_35839 ?auto_35841 ) ) ( not ( = ?auto_35840 ?auto_35841 ) ) ( ON ?auto_35839 ?auto_35840 ) ( ON-TABLE ?auto_35841 ) ( ON ?auto_35838 ?auto_35839 ) ( CLEAR ?auto_35836 ) ( ON ?auto_35837 ?auto_35838 ) ( CLEAR ?auto_35837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35841 ?auto_35840 ?auto_35839 ?auto_35838 )
      ( MAKE-5PILE ?auto_35836 ?auto_35837 ?auto_35838 ?auto_35839 ?auto_35840 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35842 - BLOCK
      ?auto_35843 - BLOCK
      ?auto_35844 - BLOCK
      ?auto_35845 - BLOCK
      ?auto_35846 - BLOCK
    )
    :vars
    (
      ?auto_35847 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35842 ?auto_35843 ) ) ( not ( = ?auto_35842 ?auto_35844 ) ) ( not ( = ?auto_35842 ?auto_35845 ) ) ( not ( = ?auto_35842 ?auto_35846 ) ) ( not ( = ?auto_35843 ?auto_35844 ) ) ( not ( = ?auto_35843 ?auto_35845 ) ) ( not ( = ?auto_35843 ?auto_35846 ) ) ( not ( = ?auto_35844 ?auto_35845 ) ) ( not ( = ?auto_35844 ?auto_35846 ) ) ( not ( = ?auto_35845 ?auto_35846 ) ) ( ON ?auto_35846 ?auto_35847 ) ( not ( = ?auto_35842 ?auto_35847 ) ) ( not ( = ?auto_35843 ?auto_35847 ) ) ( not ( = ?auto_35844 ?auto_35847 ) ) ( not ( = ?auto_35845 ?auto_35847 ) ) ( not ( = ?auto_35846 ?auto_35847 ) ) ( ON ?auto_35845 ?auto_35846 ) ( ON-TABLE ?auto_35847 ) ( ON ?auto_35844 ?auto_35845 ) ( ON ?auto_35843 ?auto_35844 ) ( CLEAR ?auto_35843 ) ( HOLDING ?auto_35842 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35842 )
      ( MAKE-5PILE ?auto_35842 ?auto_35843 ?auto_35844 ?auto_35845 ?auto_35846 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35848 - BLOCK
      ?auto_35849 - BLOCK
      ?auto_35850 - BLOCK
      ?auto_35851 - BLOCK
      ?auto_35852 - BLOCK
    )
    :vars
    (
      ?auto_35853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35848 ?auto_35849 ) ) ( not ( = ?auto_35848 ?auto_35850 ) ) ( not ( = ?auto_35848 ?auto_35851 ) ) ( not ( = ?auto_35848 ?auto_35852 ) ) ( not ( = ?auto_35849 ?auto_35850 ) ) ( not ( = ?auto_35849 ?auto_35851 ) ) ( not ( = ?auto_35849 ?auto_35852 ) ) ( not ( = ?auto_35850 ?auto_35851 ) ) ( not ( = ?auto_35850 ?auto_35852 ) ) ( not ( = ?auto_35851 ?auto_35852 ) ) ( ON ?auto_35852 ?auto_35853 ) ( not ( = ?auto_35848 ?auto_35853 ) ) ( not ( = ?auto_35849 ?auto_35853 ) ) ( not ( = ?auto_35850 ?auto_35853 ) ) ( not ( = ?auto_35851 ?auto_35853 ) ) ( not ( = ?auto_35852 ?auto_35853 ) ) ( ON ?auto_35851 ?auto_35852 ) ( ON-TABLE ?auto_35853 ) ( ON ?auto_35850 ?auto_35851 ) ( ON ?auto_35849 ?auto_35850 ) ( ON ?auto_35848 ?auto_35849 ) ( CLEAR ?auto_35848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35853 ?auto_35852 ?auto_35851 ?auto_35850 ?auto_35849 )
      ( MAKE-5PILE ?auto_35848 ?auto_35849 ?auto_35850 ?auto_35851 ?auto_35852 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35859 - BLOCK
      ?auto_35860 - BLOCK
      ?auto_35861 - BLOCK
      ?auto_35862 - BLOCK
      ?auto_35863 - BLOCK
    )
    :vars
    (
      ?auto_35864 - BLOCK
      ?auto_35865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35859 ?auto_35860 ) ) ( not ( = ?auto_35859 ?auto_35861 ) ) ( not ( = ?auto_35859 ?auto_35862 ) ) ( not ( = ?auto_35859 ?auto_35863 ) ) ( not ( = ?auto_35860 ?auto_35861 ) ) ( not ( = ?auto_35860 ?auto_35862 ) ) ( not ( = ?auto_35860 ?auto_35863 ) ) ( not ( = ?auto_35861 ?auto_35862 ) ) ( not ( = ?auto_35861 ?auto_35863 ) ) ( not ( = ?auto_35862 ?auto_35863 ) ) ( ON ?auto_35863 ?auto_35864 ) ( not ( = ?auto_35859 ?auto_35864 ) ) ( not ( = ?auto_35860 ?auto_35864 ) ) ( not ( = ?auto_35861 ?auto_35864 ) ) ( not ( = ?auto_35862 ?auto_35864 ) ) ( not ( = ?auto_35863 ?auto_35864 ) ) ( ON ?auto_35862 ?auto_35863 ) ( ON-TABLE ?auto_35864 ) ( ON ?auto_35861 ?auto_35862 ) ( ON ?auto_35860 ?auto_35861 ) ( CLEAR ?auto_35860 ) ( ON ?auto_35859 ?auto_35865 ) ( CLEAR ?auto_35859 ) ( HAND-EMPTY ) ( not ( = ?auto_35859 ?auto_35865 ) ) ( not ( = ?auto_35860 ?auto_35865 ) ) ( not ( = ?auto_35861 ?auto_35865 ) ) ( not ( = ?auto_35862 ?auto_35865 ) ) ( not ( = ?auto_35863 ?auto_35865 ) ) ( not ( = ?auto_35864 ?auto_35865 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35859 ?auto_35865 )
      ( MAKE-5PILE ?auto_35859 ?auto_35860 ?auto_35861 ?auto_35862 ?auto_35863 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35866 - BLOCK
      ?auto_35867 - BLOCK
      ?auto_35868 - BLOCK
      ?auto_35869 - BLOCK
      ?auto_35870 - BLOCK
    )
    :vars
    (
      ?auto_35872 - BLOCK
      ?auto_35871 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35866 ?auto_35867 ) ) ( not ( = ?auto_35866 ?auto_35868 ) ) ( not ( = ?auto_35866 ?auto_35869 ) ) ( not ( = ?auto_35866 ?auto_35870 ) ) ( not ( = ?auto_35867 ?auto_35868 ) ) ( not ( = ?auto_35867 ?auto_35869 ) ) ( not ( = ?auto_35867 ?auto_35870 ) ) ( not ( = ?auto_35868 ?auto_35869 ) ) ( not ( = ?auto_35868 ?auto_35870 ) ) ( not ( = ?auto_35869 ?auto_35870 ) ) ( ON ?auto_35870 ?auto_35872 ) ( not ( = ?auto_35866 ?auto_35872 ) ) ( not ( = ?auto_35867 ?auto_35872 ) ) ( not ( = ?auto_35868 ?auto_35872 ) ) ( not ( = ?auto_35869 ?auto_35872 ) ) ( not ( = ?auto_35870 ?auto_35872 ) ) ( ON ?auto_35869 ?auto_35870 ) ( ON-TABLE ?auto_35872 ) ( ON ?auto_35868 ?auto_35869 ) ( ON ?auto_35866 ?auto_35871 ) ( CLEAR ?auto_35866 ) ( not ( = ?auto_35866 ?auto_35871 ) ) ( not ( = ?auto_35867 ?auto_35871 ) ) ( not ( = ?auto_35868 ?auto_35871 ) ) ( not ( = ?auto_35869 ?auto_35871 ) ) ( not ( = ?auto_35870 ?auto_35871 ) ) ( not ( = ?auto_35872 ?auto_35871 ) ) ( HOLDING ?auto_35867 ) ( CLEAR ?auto_35868 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35872 ?auto_35870 ?auto_35869 ?auto_35868 ?auto_35867 )
      ( MAKE-5PILE ?auto_35866 ?auto_35867 ?auto_35868 ?auto_35869 ?auto_35870 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35873 - BLOCK
      ?auto_35874 - BLOCK
      ?auto_35875 - BLOCK
      ?auto_35876 - BLOCK
      ?auto_35877 - BLOCK
    )
    :vars
    (
      ?auto_35878 - BLOCK
      ?auto_35879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35873 ?auto_35874 ) ) ( not ( = ?auto_35873 ?auto_35875 ) ) ( not ( = ?auto_35873 ?auto_35876 ) ) ( not ( = ?auto_35873 ?auto_35877 ) ) ( not ( = ?auto_35874 ?auto_35875 ) ) ( not ( = ?auto_35874 ?auto_35876 ) ) ( not ( = ?auto_35874 ?auto_35877 ) ) ( not ( = ?auto_35875 ?auto_35876 ) ) ( not ( = ?auto_35875 ?auto_35877 ) ) ( not ( = ?auto_35876 ?auto_35877 ) ) ( ON ?auto_35877 ?auto_35878 ) ( not ( = ?auto_35873 ?auto_35878 ) ) ( not ( = ?auto_35874 ?auto_35878 ) ) ( not ( = ?auto_35875 ?auto_35878 ) ) ( not ( = ?auto_35876 ?auto_35878 ) ) ( not ( = ?auto_35877 ?auto_35878 ) ) ( ON ?auto_35876 ?auto_35877 ) ( ON-TABLE ?auto_35878 ) ( ON ?auto_35875 ?auto_35876 ) ( ON ?auto_35873 ?auto_35879 ) ( not ( = ?auto_35873 ?auto_35879 ) ) ( not ( = ?auto_35874 ?auto_35879 ) ) ( not ( = ?auto_35875 ?auto_35879 ) ) ( not ( = ?auto_35876 ?auto_35879 ) ) ( not ( = ?auto_35877 ?auto_35879 ) ) ( not ( = ?auto_35878 ?auto_35879 ) ) ( CLEAR ?auto_35875 ) ( ON ?auto_35874 ?auto_35873 ) ( CLEAR ?auto_35874 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35879 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35879 ?auto_35873 )
      ( MAKE-5PILE ?auto_35873 ?auto_35874 ?auto_35875 ?auto_35876 ?auto_35877 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35880 - BLOCK
      ?auto_35881 - BLOCK
      ?auto_35882 - BLOCK
      ?auto_35883 - BLOCK
      ?auto_35884 - BLOCK
    )
    :vars
    (
      ?auto_35885 - BLOCK
      ?auto_35886 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35880 ?auto_35881 ) ) ( not ( = ?auto_35880 ?auto_35882 ) ) ( not ( = ?auto_35880 ?auto_35883 ) ) ( not ( = ?auto_35880 ?auto_35884 ) ) ( not ( = ?auto_35881 ?auto_35882 ) ) ( not ( = ?auto_35881 ?auto_35883 ) ) ( not ( = ?auto_35881 ?auto_35884 ) ) ( not ( = ?auto_35882 ?auto_35883 ) ) ( not ( = ?auto_35882 ?auto_35884 ) ) ( not ( = ?auto_35883 ?auto_35884 ) ) ( ON ?auto_35884 ?auto_35885 ) ( not ( = ?auto_35880 ?auto_35885 ) ) ( not ( = ?auto_35881 ?auto_35885 ) ) ( not ( = ?auto_35882 ?auto_35885 ) ) ( not ( = ?auto_35883 ?auto_35885 ) ) ( not ( = ?auto_35884 ?auto_35885 ) ) ( ON ?auto_35883 ?auto_35884 ) ( ON-TABLE ?auto_35885 ) ( ON ?auto_35880 ?auto_35886 ) ( not ( = ?auto_35880 ?auto_35886 ) ) ( not ( = ?auto_35881 ?auto_35886 ) ) ( not ( = ?auto_35882 ?auto_35886 ) ) ( not ( = ?auto_35883 ?auto_35886 ) ) ( not ( = ?auto_35884 ?auto_35886 ) ) ( not ( = ?auto_35885 ?auto_35886 ) ) ( ON ?auto_35881 ?auto_35880 ) ( CLEAR ?auto_35881 ) ( ON-TABLE ?auto_35886 ) ( HOLDING ?auto_35882 ) ( CLEAR ?auto_35883 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35885 ?auto_35884 ?auto_35883 ?auto_35882 )
      ( MAKE-5PILE ?auto_35880 ?auto_35881 ?auto_35882 ?auto_35883 ?auto_35884 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35887 - BLOCK
      ?auto_35888 - BLOCK
      ?auto_35889 - BLOCK
      ?auto_35890 - BLOCK
      ?auto_35891 - BLOCK
    )
    :vars
    (
      ?auto_35893 - BLOCK
      ?auto_35892 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35887 ?auto_35888 ) ) ( not ( = ?auto_35887 ?auto_35889 ) ) ( not ( = ?auto_35887 ?auto_35890 ) ) ( not ( = ?auto_35887 ?auto_35891 ) ) ( not ( = ?auto_35888 ?auto_35889 ) ) ( not ( = ?auto_35888 ?auto_35890 ) ) ( not ( = ?auto_35888 ?auto_35891 ) ) ( not ( = ?auto_35889 ?auto_35890 ) ) ( not ( = ?auto_35889 ?auto_35891 ) ) ( not ( = ?auto_35890 ?auto_35891 ) ) ( ON ?auto_35891 ?auto_35893 ) ( not ( = ?auto_35887 ?auto_35893 ) ) ( not ( = ?auto_35888 ?auto_35893 ) ) ( not ( = ?auto_35889 ?auto_35893 ) ) ( not ( = ?auto_35890 ?auto_35893 ) ) ( not ( = ?auto_35891 ?auto_35893 ) ) ( ON ?auto_35890 ?auto_35891 ) ( ON-TABLE ?auto_35893 ) ( ON ?auto_35887 ?auto_35892 ) ( not ( = ?auto_35887 ?auto_35892 ) ) ( not ( = ?auto_35888 ?auto_35892 ) ) ( not ( = ?auto_35889 ?auto_35892 ) ) ( not ( = ?auto_35890 ?auto_35892 ) ) ( not ( = ?auto_35891 ?auto_35892 ) ) ( not ( = ?auto_35893 ?auto_35892 ) ) ( ON ?auto_35888 ?auto_35887 ) ( ON-TABLE ?auto_35892 ) ( CLEAR ?auto_35890 ) ( ON ?auto_35889 ?auto_35888 ) ( CLEAR ?auto_35889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35892 ?auto_35887 ?auto_35888 )
      ( MAKE-5PILE ?auto_35887 ?auto_35888 ?auto_35889 ?auto_35890 ?auto_35891 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35894 - BLOCK
      ?auto_35895 - BLOCK
      ?auto_35896 - BLOCK
      ?auto_35897 - BLOCK
      ?auto_35898 - BLOCK
    )
    :vars
    (
      ?auto_35899 - BLOCK
      ?auto_35900 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35894 ?auto_35895 ) ) ( not ( = ?auto_35894 ?auto_35896 ) ) ( not ( = ?auto_35894 ?auto_35897 ) ) ( not ( = ?auto_35894 ?auto_35898 ) ) ( not ( = ?auto_35895 ?auto_35896 ) ) ( not ( = ?auto_35895 ?auto_35897 ) ) ( not ( = ?auto_35895 ?auto_35898 ) ) ( not ( = ?auto_35896 ?auto_35897 ) ) ( not ( = ?auto_35896 ?auto_35898 ) ) ( not ( = ?auto_35897 ?auto_35898 ) ) ( ON ?auto_35898 ?auto_35899 ) ( not ( = ?auto_35894 ?auto_35899 ) ) ( not ( = ?auto_35895 ?auto_35899 ) ) ( not ( = ?auto_35896 ?auto_35899 ) ) ( not ( = ?auto_35897 ?auto_35899 ) ) ( not ( = ?auto_35898 ?auto_35899 ) ) ( ON-TABLE ?auto_35899 ) ( ON ?auto_35894 ?auto_35900 ) ( not ( = ?auto_35894 ?auto_35900 ) ) ( not ( = ?auto_35895 ?auto_35900 ) ) ( not ( = ?auto_35896 ?auto_35900 ) ) ( not ( = ?auto_35897 ?auto_35900 ) ) ( not ( = ?auto_35898 ?auto_35900 ) ) ( not ( = ?auto_35899 ?auto_35900 ) ) ( ON ?auto_35895 ?auto_35894 ) ( ON-TABLE ?auto_35900 ) ( ON ?auto_35896 ?auto_35895 ) ( CLEAR ?auto_35896 ) ( HOLDING ?auto_35897 ) ( CLEAR ?auto_35898 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35899 ?auto_35898 ?auto_35897 )
      ( MAKE-5PILE ?auto_35894 ?auto_35895 ?auto_35896 ?auto_35897 ?auto_35898 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35901 - BLOCK
      ?auto_35902 - BLOCK
      ?auto_35903 - BLOCK
      ?auto_35904 - BLOCK
      ?auto_35905 - BLOCK
    )
    :vars
    (
      ?auto_35906 - BLOCK
      ?auto_35907 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35901 ?auto_35902 ) ) ( not ( = ?auto_35901 ?auto_35903 ) ) ( not ( = ?auto_35901 ?auto_35904 ) ) ( not ( = ?auto_35901 ?auto_35905 ) ) ( not ( = ?auto_35902 ?auto_35903 ) ) ( not ( = ?auto_35902 ?auto_35904 ) ) ( not ( = ?auto_35902 ?auto_35905 ) ) ( not ( = ?auto_35903 ?auto_35904 ) ) ( not ( = ?auto_35903 ?auto_35905 ) ) ( not ( = ?auto_35904 ?auto_35905 ) ) ( ON ?auto_35905 ?auto_35906 ) ( not ( = ?auto_35901 ?auto_35906 ) ) ( not ( = ?auto_35902 ?auto_35906 ) ) ( not ( = ?auto_35903 ?auto_35906 ) ) ( not ( = ?auto_35904 ?auto_35906 ) ) ( not ( = ?auto_35905 ?auto_35906 ) ) ( ON-TABLE ?auto_35906 ) ( ON ?auto_35901 ?auto_35907 ) ( not ( = ?auto_35901 ?auto_35907 ) ) ( not ( = ?auto_35902 ?auto_35907 ) ) ( not ( = ?auto_35903 ?auto_35907 ) ) ( not ( = ?auto_35904 ?auto_35907 ) ) ( not ( = ?auto_35905 ?auto_35907 ) ) ( not ( = ?auto_35906 ?auto_35907 ) ) ( ON ?auto_35902 ?auto_35901 ) ( ON-TABLE ?auto_35907 ) ( ON ?auto_35903 ?auto_35902 ) ( CLEAR ?auto_35905 ) ( ON ?auto_35904 ?auto_35903 ) ( CLEAR ?auto_35904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35907 ?auto_35901 ?auto_35902 ?auto_35903 )
      ( MAKE-5PILE ?auto_35901 ?auto_35902 ?auto_35903 ?auto_35904 ?auto_35905 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35908 - BLOCK
      ?auto_35909 - BLOCK
      ?auto_35910 - BLOCK
      ?auto_35911 - BLOCK
      ?auto_35912 - BLOCK
    )
    :vars
    (
      ?auto_35914 - BLOCK
      ?auto_35913 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35908 ?auto_35909 ) ) ( not ( = ?auto_35908 ?auto_35910 ) ) ( not ( = ?auto_35908 ?auto_35911 ) ) ( not ( = ?auto_35908 ?auto_35912 ) ) ( not ( = ?auto_35909 ?auto_35910 ) ) ( not ( = ?auto_35909 ?auto_35911 ) ) ( not ( = ?auto_35909 ?auto_35912 ) ) ( not ( = ?auto_35910 ?auto_35911 ) ) ( not ( = ?auto_35910 ?auto_35912 ) ) ( not ( = ?auto_35911 ?auto_35912 ) ) ( not ( = ?auto_35908 ?auto_35914 ) ) ( not ( = ?auto_35909 ?auto_35914 ) ) ( not ( = ?auto_35910 ?auto_35914 ) ) ( not ( = ?auto_35911 ?auto_35914 ) ) ( not ( = ?auto_35912 ?auto_35914 ) ) ( ON-TABLE ?auto_35914 ) ( ON ?auto_35908 ?auto_35913 ) ( not ( = ?auto_35908 ?auto_35913 ) ) ( not ( = ?auto_35909 ?auto_35913 ) ) ( not ( = ?auto_35910 ?auto_35913 ) ) ( not ( = ?auto_35911 ?auto_35913 ) ) ( not ( = ?auto_35912 ?auto_35913 ) ) ( not ( = ?auto_35914 ?auto_35913 ) ) ( ON ?auto_35909 ?auto_35908 ) ( ON-TABLE ?auto_35913 ) ( ON ?auto_35910 ?auto_35909 ) ( ON ?auto_35911 ?auto_35910 ) ( CLEAR ?auto_35911 ) ( HOLDING ?auto_35912 ) ( CLEAR ?auto_35914 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35914 ?auto_35912 )
      ( MAKE-5PILE ?auto_35908 ?auto_35909 ?auto_35910 ?auto_35911 ?auto_35912 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35915 - BLOCK
      ?auto_35916 - BLOCK
      ?auto_35917 - BLOCK
      ?auto_35918 - BLOCK
      ?auto_35919 - BLOCK
    )
    :vars
    (
      ?auto_35920 - BLOCK
      ?auto_35921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35915 ?auto_35916 ) ) ( not ( = ?auto_35915 ?auto_35917 ) ) ( not ( = ?auto_35915 ?auto_35918 ) ) ( not ( = ?auto_35915 ?auto_35919 ) ) ( not ( = ?auto_35916 ?auto_35917 ) ) ( not ( = ?auto_35916 ?auto_35918 ) ) ( not ( = ?auto_35916 ?auto_35919 ) ) ( not ( = ?auto_35917 ?auto_35918 ) ) ( not ( = ?auto_35917 ?auto_35919 ) ) ( not ( = ?auto_35918 ?auto_35919 ) ) ( not ( = ?auto_35915 ?auto_35920 ) ) ( not ( = ?auto_35916 ?auto_35920 ) ) ( not ( = ?auto_35917 ?auto_35920 ) ) ( not ( = ?auto_35918 ?auto_35920 ) ) ( not ( = ?auto_35919 ?auto_35920 ) ) ( ON-TABLE ?auto_35920 ) ( ON ?auto_35915 ?auto_35921 ) ( not ( = ?auto_35915 ?auto_35921 ) ) ( not ( = ?auto_35916 ?auto_35921 ) ) ( not ( = ?auto_35917 ?auto_35921 ) ) ( not ( = ?auto_35918 ?auto_35921 ) ) ( not ( = ?auto_35919 ?auto_35921 ) ) ( not ( = ?auto_35920 ?auto_35921 ) ) ( ON ?auto_35916 ?auto_35915 ) ( ON-TABLE ?auto_35921 ) ( ON ?auto_35917 ?auto_35916 ) ( ON ?auto_35918 ?auto_35917 ) ( CLEAR ?auto_35920 ) ( ON ?auto_35919 ?auto_35918 ) ( CLEAR ?auto_35919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35921 ?auto_35915 ?auto_35916 ?auto_35917 ?auto_35918 )
      ( MAKE-5PILE ?auto_35915 ?auto_35916 ?auto_35917 ?auto_35918 ?auto_35919 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35922 - BLOCK
      ?auto_35923 - BLOCK
      ?auto_35924 - BLOCK
      ?auto_35925 - BLOCK
      ?auto_35926 - BLOCK
    )
    :vars
    (
      ?auto_35927 - BLOCK
      ?auto_35928 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35922 ?auto_35923 ) ) ( not ( = ?auto_35922 ?auto_35924 ) ) ( not ( = ?auto_35922 ?auto_35925 ) ) ( not ( = ?auto_35922 ?auto_35926 ) ) ( not ( = ?auto_35923 ?auto_35924 ) ) ( not ( = ?auto_35923 ?auto_35925 ) ) ( not ( = ?auto_35923 ?auto_35926 ) ) ( not ( = ?auto_35924 ?auto_35925 ) ) ( not ( = ?auto_35924 ?auto_35926 ) ) ( not ( = ?auto_35925 ?auto_35926 ) ) ( not ( = ?auto_35922 ?auto_35927 ) ) ( not ( = ?auto_35923 ?auto_35927 ) ) ( not ( = ?auto_35924 ?auto_35927 ) ) ( not ( = ?auto_35925 ?auto_35927 ) ) ( not ( = ?auto_35926 ?auto_35927 ) ) ( ON ?auto_35922 ?auto_35928 ) ( not ( = ?auto_35922 ?auto_35928 ) ) ( not ( = ?auto_35923 ?auto_35928 ) ) ( not ( = ?auto_35924 ?auto_35928 ) ) ( not ( = ?auto_35925 ?auto_35928 ) ) ( not ( = ?auto_35926 ?auto_35928 ) ) ( not ( = ?auto_35927 ?auto_35928 ) ) ( ON ?auto_35923 ?auto_35922 ) ( ON-TABLE ?auto_35928 ) ( ON ?auto_35924 ?auto_35923 ) ( ON ?auto_35925 ?auto_35924 ) ( ON ?auto_35926 ?auto_35925 ) ( CLEAR ?auto_35926 ) ( HOLDING ?auto_35927 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35927 )
      ( MAKE-5PILE ?auto_35922 ?auto_35923 ?auto_35924 ?auto_35925 ?auto_35926 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35929 - BLOCK
      ?auto_35930 - BLOCK
      ?auto_35931 - BLOCK
      ?auto_35932 - BLOCK
      ?auto_35933 - BLOCK
    )
    :vars
    (
      ?auto_35934 - BLOCK
      ?auto_35935 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35929 ?auto_35930 ) ) ( not ( = ?auto_35929 ?auto_35931 ) ) ( not ( = ?auto_35929 ?auto_35932 ) ) ( not ( = ?auto_35929 ?auto_35933 ) ) ( not ( = ?auto_35930 ?auto_35931 ) ) ( not ( = ?auto_35930 ?auto_35932 ) ) ( not ( = ?auto_35930 ?auto_35933 ) ) ( not ( = ?auto_35931 ?auto_35932 ) ) ( not ( = ?auto_35931 ?auto_35933 ) ) ( not ( = ?auto_35932 ?auto_35933 ) ) ( not ( = ?auto_35929 ?auto_35934 ) ) ( not ( = ?auto_35930 ?auto_35934 ) ) ( not ( = ?auto_35931 ?auto_35934 ) ) ( not ( = ?auto_35932 ?auto_35934 ) ) ( not ( = ?auto_35933 ?auto_35934 ) ) ( ON ?auto_35929 ?auto_35935 ) ( not ( = ?auto_35929 ?auto_35935 ) ) ( not ( = ?auto_35930 ?auto_35935 ) ) ( not ( = ?auto_35931 ?auto_35935 ) ) ( not ( = ?auto_35932 ?auto_35935 ) ) ( not ( = ?auto_35933 ?auto_35935 ) ) ( not ( = ?auto_35934 ?auto_35935 ) ) ( ON ?auto_35930 ?auto_35929 ) ( ON-TABLE ?auto_35935 ) ( ON ?auto_35931 ?auto_35930 ) ( ON ?auto_35932 ?auto_35931 ) ( ON ?auto_35933 ?auto_35932 ) ( ON ?auto_35934 ?auto_35933 ) ( CLEAR ?auto_35934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_35935 ?auto_35929 ?auto_35930 ?auto_35931 ?auto_35932 ?auto_35933 )
      ( MAKE-5PILE ?auto_35929 ?auto_35930 ?auto_35931 ?auto_35932 ?auto_35933 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_35948 - BLOCK
      ?auto_35949 - BLOCK
      ?auto_35950 - BLOCK
      ?auto_35951 - BLOCK
      ?auto_35952 - BLOCK
      ?auto_35953 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_35952 ) ( ON-TABLE ?auto_35948 ) ( ON ?auto_35949 ?auto_35948 ) ( ON ?auto_35950 ?auto_35949 ) ( ON ?auto_35951 ?auto_35950 ) ( ON ?auto_35952 ?auto_35951 ) ( not ( = ?auto_35948 ?auto_35949 ) ) ( not ( = ?auto_35948 ?auto_35950 ) ) ( not ( = ?auto_35948 ?auto_35951 ) ) ( not ( = ?auto_35948 ?auto_35952 ) ) ( not ( = ?auto_35948 ?auto_35953 ) ) ( not ( = ?auto_35949 ?auto_35950 ) ) ( not ( = ?auto_35949 ?auto_35951 ) ) ( not ( = ?auto_35949 ?auto_35952 ) ) ( not ( = ?auto_35949 ?auto_35953 ) ) ( not ( = ?auto_35950 ?auto_35951 ) ) ( not ( = ?auto_35950 ?auto_35952 ) ) ( not ( = ?auto_35950 ?auto_35953 ) ) ( not ( = ?auto_35951 ?auto_35952 ) ) ( not ( = ?auto_35951 ?auto_35953 ) ) ( not ( = ?auto_35952 ?auto_35953 ) ) ( ON-TABLE ?auto_35953 ) ( CLEAR ?auto_35953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_35953 )
      ( MAKE-6PILE ?auto_35948 ?auto_35949 ?auto_35950 ?auto_35951 ?auto_35952 ?auto_35953 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_35954 - BLOCK
      ?auto_35955 - BLOCK
      ?auto_35956 - BLOCK
      ?auto_35957 - BLOCK
      ?auto_35958 - BLOCK
      ?auto_35959 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35954 ) ( ON ?auto_35955 ?auto_35954 ) ( ON ?auto_35956 ?auto_35955 ) ( ON ?auto_35957 ?auto_35956 ) ( not ( = ?auto_35954 ?auto_35955 ) ) ( not ( = ?auto_35954 ?auto_35956 ) ) ( not ( = ?auto_35954 ?auto_35957 ) ) ( not ( = ?auto_35954 ?auto_35958 ) ) ( not ( = ?auto_35954 ?auto_35959 ) ) ( not ( = ?auto_35955 ?auto_35956 ) ) ( not ( = ?auto_35955 ?auto_35957 ) ) ( not ( = ?auto_35955 ?auto_35958 ) ) ( not ( = ?auto_35955 ?auto_35959 ) ) ( not ( = ?auto_35956 ?auto_35957 ) ) ( not ( = ?auto_35956 ?auto_35958 ) ) ( not ( = ?auto_35956 ?auto_35959 ) ) ( not ( = ?auto_35957 ?auto_35958 ) ) ( not ( = ?auto_35957 ?auto_35959 ) ) ( not ( = ?auto_35958 ?auto_35959 ) ) ( ON-TABLE ?auto_35959 ) ( CLEAR ?auto_35959 ) ( HOLDING ?auto_35958 ) ( CLEAR ?auto_35957 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35954 ?auto_35955 ?auto_35956 ?auto_35957 ?auto_35958 )
      ( MAKE-6PILE ?auto_35954 ?auto_35955 ?auto_35956 ?auto_35957 ?auto_35958 ?auto_35959 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_35960 - BLOCK
      ?auto_35961 - BLOCK
      ?auto_35962 - BLOCK
      ?auto_35963 - BLOCK
      ?auto_35964 - BLOCK
      ?auto_35965 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35960 ) ( ON ?auto_35961 ?auto_35960 ) ( ON ?auto_35962 ?auto_35961 ) ( ON ?auto_35963 ?auto_35962 ) ( not ( = ?auto_35960 ?auto_35961 ) ) ( not ( = ?auto_35960 ?auto_35962 ) ) ( not ( = ?auto_35960 ?auto_35963 ) ) ( not ( = ?auto_35960 ?auto_35964 ) ) ( not ( = ?auto_35960 ?auto_35965 ) ) ( not ( = ?auto_35961 ?auto_35962 ) ) ( not ( = ?auto_35961 ?auto_35963 ) ) ( not ( = ?auto_35961 ?auto_35964 ) ) ( not ( = ?auto_35961 ?auto_35965 ) ) ( not ( = ?auto_35962 ?auto_35963 ) ) ( not ( = ?auto_35962 ?auto_35964 ) ) ( not ( = ?auto_35962 ?auto_35965 ) ) ( not ( = ?auto_35963 ?auto_35964 ) ) ( not ( = ?auto_35963 ?auto_35965 ) ) ( not ( = ?auto_35964 ?auto_35965 ) ) ( ON-TABLE ?auto_35965 ) ( CLEAR ?auto_35963 ) ( ON ?auto_35964 ?auto_35965 ) ( CLEAR ?auto_35964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35965 )
      ( MAKE-6PILE ?auto_35960 ?auto_35961 ?auto_35962 ?auto_35963 ?auto_35964 ?auto_35965 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_35966 - BLOCK
      ?auto_35967 - BLOCK
      ?auto_35968 - BLOCK
      ?auto_35969 - BLOCK
      ?auto_35970 - BLOCK
      ?auto_35971 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35966 ) ( ON ?auto_35967 ?auto_35966 ) ( ON ?auto_35968 ?auto_35967 ) ( not ( = ?auto_35966 ?auto_35967 ) ) ( not ( = ?auto_35966 ?auto_35968 ) ) ( not ( = ?auto_35966 ?auto_35969 ) ) ( not ( = ?auto_35966 ?auto_35970 ) ) ( not ( = ?auto_35966 ?auto_35971 ) ) ( not ( = ?auto_35967 ?auto_35968 ) ) ( not ( = ?auto_35967 ?auto_35969 ) ) ( not ( = ?auto_35967 ?auto_35970 ) ) ( not ( = ?auto_35967 ?auto_35971 ) ) ( not ( = ?auto_35968 ?auto_35969 ) ) ( not ( = ?auto_35968 ?auto_35970 ) ) ( not ( = ?auto_35968 ?auto_35971 ) ) ( not ( = ?auto_35969 ?auto_35970 ) ) ( not ( = ?auto_35969 ?auto_35971 ) ) ( not ( = ?auto_35970 ?auto_35971 ) ) ( ON-TABLE ?auto_35971 ) ( ON ?auto_35970 ?auto_35971 ) ( CLEAR ?auto_35970 ) ( HOLDING ?auto_35969 ) ( CLEAR ?auto_35968 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35966 ?auto_35967 ?auto_35968 ?auto_35969 )
      ( MAKE-6PILE ?auto_35966 ?auto_35967 ?auto_35968 ?auto_35969 ?auto_35970 ?auto_35971 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_35972 - BLOCK
      ?auto_35973 - BLOCK
      ?auto_35974 - BLOCK
      ?auto_35975 - BLOCK
      ?auto_35976 - BLOCK
      ?auto_35977 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35972 ) ( ON ?auto_35973 ?auto_35972 ) ( ON ?auto_35974 ?auto_35973 ) ( not ( = ?auto_35972 ?auto_35973 ) ) ( not ( = ?auto_35972 ?auto_35974 ) ) ( not ( = ?auto_35972 ?auto_35975 ) ) ( not ( = ?auto_35972 ?auto_35976 ) ) ( not ( = ?auto_35972 ?auto_35977 ) ) ( not ( = ?auto_35973 ?auto_35974 ) ) ( not ( = ?auto_35973 ?auto_35975 ) ) ( not ( = ?auto_35973 ?auto_35976 ) ) ( not ( = ?auto_35973 ?auto_35977 ) ) ( not ( = ?auto_35974 ?auto_35975 ) ) ( not ( = ?auto_35974 ?auto_35976 ) ) ( not ( = ?auto_35974 ?auto_35977 ) ) ( not ( = ?auto_35975 ?auto_35976 ) ) ( not ( = ?auto_35975 ?auto_35977 ) ) ( not ( = ?auto_35976 ?auto_35977 ) ) ( ON-TABLE ?auto_35977 ) ( ON ?auto_35976 ?auto_35977 ) ( CLEAR ?auto_35974 ) ( ON ?auto_35975 ?auto_35976 ) ( CLEAR ?auto_35975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35977 ?auto_35976 )
      ( MAKE-6PILE ?auto_35972 ?auto_35973 ?auto_35974 ?auto_35975 ?auto_35976 ?auto_35977 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_35978 - BLOCK
      ?auto_35979 - BLOCK
      ?auto_35980 - BLOCK
      ?auto_35981 - BLOCK
      ?auto_35982 - BLOCK
      ?auto_35983 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35978 ) ( ON ?auto_35979 ?auto_35978 ) ( not ( = ?auto_35978 ?auto_35979 ) ) ( not ( = ?auto_35978 ?auto_35980 ) ) ( not ( = ?auto_35978 ?auto_35981 ) ) ( not ( = ?auto_35978 ?auto_35982 ) ) ( not ( = ?auto_35978 ?auto_35983 ) ) ( not ( = ?auto_35979 ?auto_35980 ) ) ( not ( = ?auto_35979 ?auto_35981 ) ) ( not ( = ?auto_35979 ?auto_35982 ) ) ( not ( = ?auto_35979 ?auto_35983 ) ) ( not ( = ?auto_35980 ?auto_35981 ) ) ( not ( = ?auto_35980 ?auto_35982 ) ) ( not ( = ?auto_35980 ?auto_35983 ) ) ( not ( = ?auto_35981 ?auto_35982 ) ) ( not ( = ?auto_35981 ?auto_35983 ) ) ( not ( = ?auto_35982 ?auto_35983 ) ) ( ON-TABLE ?auto_35983 ) ( ON ?auto_35982 ?auto_35983 ) ( ON ?auto_35981 ?auto_35982 ) ( CLEAR ?auto_35981 ) ( HOLDING ?auto_35980 ) ( CLEAR ?auto_35979 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35978 ?auto_35979 ?auto_35980 )
      ( MAKE-6PILE ?auto_35978 ?auto_35979 ?auto_35980 ?auto_35981 ?auto_35982 ?auto_35983 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_35984 - BLOCK
      ?auto_35985 - BLOCK
      ?auto_35986 - BLOCK
      ?auto_35987 - BLOCK
      ?auto_35988 - BLOCK
      ?auto_35989 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35984 ) ( ON ?auto_35985 ?auto_35984 ) ( not ( = ?auto_35984 ?auto_35985 ) ) ( not ( = ?auto_35984 ?auto_35986 ) ) ( not ( = ?auto_35984 ?auto_35987 ) ) ( not ( = ?auto_35984 ?auto_35988 ) ) ( not ( = ?auto_35984 ?auto_35989 ) ) ( not ( = ?auto_35985 ?auto_35986 ) ) ( not ( = ?auto_35985 ?auto_35987 ) ) ( not ( = ?auto_35985 ?auto_35988 ) ) ( not ( = ?auto_35985 ?auto_35989 ) ) ( not ( = ?auto_35986 ?auto_35987 ) ) ( not ( = ?auto_35986 ?auto_35988 ) ) ( not ( = ?auto_35986 ?auto_35989 ) ) ( not ( = ?auto_35987 ?auto_35988 ) ) ( not ( = ?auto_35987 ?auto_35989 ) ) ( not ( = ?auto_35988 ?auto_35989 ) ) ( ON-TABLE ?auto_35989 ) ( ON ?auto_35988 ?auto_35989 ) ( ON ?auto_35987 ?auto_35988 ) ( CLEAR ?auto_35985 ) ( ON ?auto_35986 ?auto_35987 ) ( CLEAR ?auto_35986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35989 ?auto_35988 ?auto_35987 )
      ( MAKE-6PILE ?auto_35984 ?auto_35985 ?auto_35986 ?auto_35987 ?auto_35988 ?auto_35989 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_35990 - BLOCK
      ?auto_35991 - BLOCK
      ?auto_35992 - BLOCK
      ?auto_35993 - BLOCK
      ?auto_35994 - BLOCK
      ?auto_35995 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35990 ) ( not ( = ?auto_35990 ?auto_35991 ) ) ( not ( = ?auto_35990 ?auto_35992 ) ) ( not ( = ?auto_35990 ?auto_35993 ) ) ( not ( = ?auto_35990 ?auto_35994 ) ) ( not ( = ?auto_35990 ?auto_35995 ) ) ( not ( = ?auto_35991 ?auto_35992 ) ) ( not ( = ?auto_35991 ?auto_35993 ) ) ( not ( = ?auto_35991 ?auto_35994 ) ) ( not ( = ?auto_35991 ?auto_35995 ) ) ( not ( = ?auto_35992 ?auto_35993 ) ) ( not ( = ?auto_35992 ?auto_35994 ) ) ( not ( = ?auto_35992 ?auto_35995 ) ) ( not ( = ?auto_35993 ?auto_35994 ) ) ( not ( = ?auto_35993 ?auto_35995 ) ) ( not ( = ?auto_35994 ?auto_35995 ) ) ( ON-TABLE ?auto_35995 ) ( ON ?auto_35994 ?auto_35995 ) ( ON ?auto_35993 ?auto_35994 ) ( ON ?auto_35992 ?auto_35993 ) ( CLEAR ?auto_35992 ) ( HOLDING ?auto_35991 ) ( CLEAR ?auto_35990 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35990 ?auto_35991 )
      ( MAKE-6PILE ?auto_35990 ?auto_35991 ?auto_35992 ?auto_35993 ?auto_35994 ?auto_35995 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_35996 - BLOCK
      ?auto_35997 - BLOCK
      ?auto_35998 - BLOCK
      ?auto_35999 - BLOCK
      ?auto_36000 - BLOCK
      ?auto_36001 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35996 ) ( not ( = ?auto_35996 ?auto_35997 ) ) ( not ( = ?auto_35996 ?auto_35998 ) ) ( not ( = ?auto_35996 ?auto_35999 ) ) ( not ( = ?auto_35996 ?auto_36000 ) ) ( not ( = ?auto_35996 ?auto_36001 ) ) ( not ( = ?auto_35997 ?auto_35998 ) ) ( not ( = ?auto_35997 ?auto_35999 ) ) ( not ( = ?auto_35997 ?auto_36000 ) ) ( not ( = ?auto_35997 ?auto_36001 ) ) ( not ( = ?auto_35998 ?auto_35999 ) ) ( not ( = ?auto_35998 ?auto_36000 ) ) ( not ( = ?auto_35998 ?auto_36001 ) ) ( not ( = ?auto_35999 ?auto_36000 ) ) ( not ( = ?auto_35999 ?auto_36001 ) ) ( not ( = ?auto_36000 ?auto_36001 ) ) ( ON-TABLE ?auto_36001 ) ( ON ?auto_36000 ?auto_36001 ) ( ON ?auto_35999 ?auto_36000 ) ( ON ?auto_35998 ?auto_35999 ) ( CLEAR ?auto_35996 ) ( ON ?auto_35997 ?auto_35998 ) ( CLEAR ?auto_35997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36001 ?auto_36000 ?auto_35999 ?auto_35998 )
      ( MAKE-6PILE ?auto_35996 ?auto_35997 ?auto_35998 ?auto_35999 ?auto_36000 ?auto_36001 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36002 - BLOCK
      ?auto_36003 - BLOCK
      ?auto_36004 - BLOCK
      ?auto_36005 - BLOCK
      ?auto_36006 - BLOCK
      ?auto_36007 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36002 ?auto_36003 ) ) ( not ( = ?auto_36002 ?auto_36004 ) ) ( not ( = ?auto_36002 ?auto_36005 ) ) ( not ( = ?auto_36002 ?auto_36006 ) ) ( not ( = ?auto_36002 ?auto_36007 ) ) ( not ( = ?auto_36003 ?auto_36004 ) ) ( not ( = ?auto_36003 ?auto_36005 ) ) ( not ( = ?auto_36003 ?auto_36006 ) ) ( not ( = ?auto_36003 ?auto_36007 ) ) ( not ( = ?auto_36004 ?auto_36005 ) ) ( not ( = ?auto_36004 ?auto_36006 ) ) ( not ( = ?auto_36004 ?auto_36007 ) ) ( not ( = ?auto_36005 ?auto_36006 ) ) ( not ( = ?auto_36005 ?auto_36007 ) ) ( not ( = ?auto_36006 ?auto_36007 ) ) ( ON-TABLE ?auto_36007 ) ( ON ?auto_36006 ?auto_36007 ) ( ON ?auto_36005 ?auto_36006 ) ( ON ?auto_36004 ?auto_36005 ) ( ON ?auto_36003 ?auto_36004 ) ( CLEAR ?auto_36003 ) ( HOLDING ?auto_36002 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36002 )
      ( MAKE-6PILE ?auto_36002 ?auto_36003 ?auto_36004 ?auto_36005 ?auto_36006 ?auto_36007 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36008 - BLOCK
      ?auto_36009 - BLOCK
      ?auto_36010 - BLOCK
      ?auto_36011 - BLOCK
      ?auto_36012 - BLOCK
      ?auto_36013 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36008 ?auto_36009 ) ) ( not ( = ?auto_36008 ?auto_36010 ) ) ( not ( = ?auto_36008 ?auto_36011 ) ) ( not ( = ?auto_36008 ?auto_36012 ) ) ( not ( = ?auto_36008 ?auto_36013 ) ) ( not ( = ?auto_36009 ?auto_36010 ) ) ( not ( = ?auto_36009 ?auto_36011 ) ) ( not ( = ?auto_36009 ?auto_36012 ) ) ( not ( = ?auto_36009 ?auto_36013 ) ) ( not ( = ?auto_36010 ?auto_36011 ) ) ( not ( = ?auto_36010 ?auto_36012 ) ) ( not ( = ?auto_36010 ?auto_36013 ) ) ( not ( = ?auto_36011 ?auto_36012 ) ) ( not ( = ?auto_36011 ?auto_36013 ) ) ( not ( = ?auto_36012 ?auto_36013 ) ) ( ON-TABLE ?auto_36013 ) ( ON ?auto_36012 ?auto_36013 ) ( ON ?auto_36011 ?auto_36012 ) ( ON ?auto_36010 ?auto_36011 ) ( ON ?auto_36009 ?auto_36010 ) ( ON ?auto_36008 ?auto_36009 ) ( CLEAR ?auto_36008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36013 ?auto_36012 ?auto_36011 ?auto_36010 ?auto_36009 )
      ( MAKE-6PILE ?auto_36008 ?auto_36009 ?auto_36010 ?auto_36011 ?auto_36012 ?auto_36013 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36020 - BLOCK
      ?auto_36021 - BLOCK
      ?auto_36022 - BLOCK
      ?auto_36023 - BLOCK
      ?auto_36024 - BLOCK
      ?auto_36025 - BLOCK
    )
    :vars
    (
      ?auto_36026 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36020 ?auto_36021 ) ) ( not ( = ?auto_36020 ?auto_36022 ) ) ( not ( = ?auto_36020 ?auto_36023 ) ) ( not ( = ?auto_36020 ?auto_36024 ) ) ( not ( = ?auto_36020 ?auto_36025 ) ) ( not ( = ?auto_36021 ?auto_36022 ) ) ( not ( = ?auto_36021 ?auto_36023 ) ) ( not ( = ?auto_36021 ?auto_36024 ) ) ( not ( = ?auto_36021 ?auto_36025 ) ) ( not ( = ?auto_36022 ?auto_36023 ) ) ( not ( = ?auto_36022 ?auto_36024 ) ) ( not ( = ?auto_36022 ?auto_36025 ) ) ( not ( = ?auto_36023 ?auto_36024 ) ) ( not ( = ?auto_36023 ?auto_36025 ) ) ( not ( = ?auto_36024 ?auto_36025 ) ) ( ON-TABLE ?auto_36025 ) ( ON ?auto_36024 ?auto_36025 ) ( ON ?auto_36023 ?auto_36024 ) ( ON ?auto_36022 ?auto_36023 ) ( ON ?auto_36021 ?auto_36022 ) ( CLEAR ?auto_36021 ) ( ON ?auto_36020 ?auto_36026 ) ( CLEAR ?auto_36020 ) ( HAND-EMPTY ) ( not ( = ?auto_36020 ?auto_36026 ) ) ( not ( = ?auto_36021 ?auto_36026 ) ) ( not ( = ?auto_36022 ?auto_36026 ) ) ( not ( = ?auto_36023 ?auto_36026 ) ) ( not ( = ?auto_36024 ?auto_36026 ) ) ( not ( = ?auto_36025 ?auto_36026 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36020 ?auto_36026 )
      ( MAKE-6PILE ?auto_36020 ?auto_36021 ?auto_36022 ?auto_36023 ?auto_36024 ?auto_36025 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36027 - BLOCK
      ?auto_36028 - BLOCK
      ?auto_36029 - BLOCK
      ?auto_36030 - BLOCK
      ?auto_36031 - BLOCK
      ?auto_36032 - BLOCK
    )
    :vars
    (
      ?auto_36033 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36027 ?auto_36028 ) ) ( not ( = ?auto_36027 ?auto_36029 ) ) ( not ( = ?auto_36027 ?auto_36030 ) ) ( not ( = ?auto_36027 ?auto_36031 ) ) ( not ( = ?auto_36027 ?auto_36032 ) ) ( not ( = ?auto_36028 ?auto_36029 ) ) ( not ( = ?auto_36028 ?auto_36030 ) ) ( not ( = ?auto_36028 ?auto_36031 ) ) ( not ( = ?auto_36028 ?auto_36032 ) ) ( not ( = ?auto_36029 ?auto_36030 ) ) ( not ( = ?auto_36029 ?auto_36031 ) ) ( not ( = ?auto_36029 ?auto_36032 ) ) ( not ( = ?auto_36030 ?auto_36031 ) ) ( not ( = ?auto_36030 ?auto_36032 ) ) ( not ( = ?auto_36031 ?auto_36032 ) ) ( ON-TABLE ?auto_36032 ) ( ON ?auto_36031 ?auto_36032 ) ( ON ?auto_36030 ?auto_36031 ) ( ON ?auto_36029 ?auto_36030 ) ( ON ?auto_36027 ?auto_36033 ) ( CLEAR ?auto_36027 ) ( not ( = ?auto_36027 ?auto_36033 ) ) ( not ( = ?auto_36028 ?auto_36033 ) ) ( not ( = ?auto_36029 ?auto_36033 ) ) ( not ( = ?auto_36030 ?auto_36033 ) ) ( not ( = ?auto_36031 ?auto_36033 ) ) ( not ( = ?auto_36032 ?auto_36033 ) ) ( HOLDING ?auto_36028 ) ( CLEAR ?auto_36029 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36032 ?auto_36031 ?auto_36030 ?auto_36029 ?auto_36028 )
      ( MAKE-6PILE ?auto_36027 ?auto_36028 ?auto_36029 ?auto_36030 ?auto_36031 ?auto_36032 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36034 - BLOCK
      ?auto_36035 - BLOCK
      ?auto_36036 - BLOCK
      ?auto_36037 - BLOCK
      ?auto_36038 - BLOCK
      ?auto_36039 - BLOCK
    )
    :vars
    (
      ?auto_36040 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36034 ?auto_36035 ) ) ( not ( = ?auto_36034 ?auto_36036 ) ) ( not ( = ?auto_36034 ?auto_36037 ) ) ( not ( = ?auto_36034 ?auto_36038 ) ) ( not ( = ?auto_36034 ?auto_36039 ) ) ( not ( = ?auto_36035 ?auto_36036 ) ) ( not ( = ?auto_36035 ?auto_36037 ) ) ( not ( = ?auto_36035 ?auto_36038 ) ) ( not ( = ?auto_36035 ?auto_36039 ) ) ( not ( = ?auto_36036 ?auto_36037 ) ) ( not ( = ?auto_36036 ?auto_36038 ) ) ( not ( = ?auto_36036 ?auto_36039 ) ) ( not ( = ?auto_36037 ?auto_36038 ) ) ( not ( = ?auto_36037 ?auto_36039 ) ) ( not ( = ?auto_36038 ?auto_36039 ) ) ( ON-TABLE ?auto_36039 ) ( ON ?auto_36038 ?auto_36039 ) ( ON ?auto_36037 ?auto_36038 ) ( ON ?auto_36036 ?auto_36037 ) ( ON ?auto_36034 ?auto_36040 ) ( not ( = ?auto_36034 ?auto_36040 ) ) ( not ( = ?auto_36035 ?auto_36040 ) ) ( not ( = ?auto_36036 ?auto_36040 ) ) ( not ( = ?auto_36037 ?auto_36040 ) ) ( not ( = ?auto_36038 ?auto_36040 ) ) ( not ( = ?auto_36039 ?auto_36040 ) ) ( CLEAR ?auto_36036 ) ( ON ?auto_36035 ?auto_36034 ) ( CLEAR ?auto_36035 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36040 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36040 ?auto_36034 )
      ( MAKE-6PILE ?auto_36034 ?auto_36035 ?auto_36036 ?auto_36037 ?auto_36038 ?auto_36039 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36041 - BLOCK
      ?auto_36042 - BLOCK
      ?auto_36043 - BLOCK
      ?auto_36044 - BLOCK
      ?auto_36045 - BLOCK
      ?auto_36046 - BLOCK
    )
    :vars
    (
      ?auto_36047 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36041 ?auto_36042 ) ) ( not ( = ?auto_36041 ?auto_36043 ) ) ( not ( = ?auto_36041 ?auto_36044 ) ) ( not ( = ?auto_36041 ?auto_36045 ) ) ( not ( = ?auto_36041 ?auto_36046 ) ) ( not ( = ?auto_36042 ?auto_36043 ) ) ( not ( = ?auto_36042 ?auto_36044 ) ) ( not ( = ?auto_36042 ?auto_36045 ) ) ( not ( = ?auto_36042 ?auto_36046 ) ) ( not ( = ?auto_36043 ?auto_36044 ) ) ( not ( = ?auto_36043 ?auto_36045 ) ) ( not ( = ?auto_36043 ?auto_36046 ) ) ( not ( = ?auto_36044 ?auto_36045 ) ) ( not ( = ?auto_36044 ?auto_36046 ) ) ( not ( = ?auto_36045 ?auto_36046 ) ) ( ON-TABLE ?auto_36046 ) ( ON ?auto_36045 ?auto_36046 ) ( ON ?auto_36044 ?auto_36045 ) ( ON ?auto_36041 ?auto_36047 ) ( not ( = ?auto_36041 ?auto_36047 ) ) ( not ( = ?auto_36042 ?auto_36047 ) ) ( not ( = ?auto_36043 ?auto_36047 ) ) ( not ( = ?auto_36044 ?auto_36047 ) ) ( not ( = ?auto_36045 ?auto_36047 ) ) ( not ( = ?auto_36046 ?auto_36047 ) ) ( ON ?auto_36042 ?auto_36041 ) ( CLEAR ?auto_36042 ) ( ON-TABLE ?auto_36047 ) ( HOLDING ?auto_36043 ) ( CLEAR ?auto_36044 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36046 ?auto_36045 ?auto_36044 ?auto_36043 )
      ( MAKE-6PILE ?auto_36041 ?auto_36042 ?auto_36043 ?auto_36044 ?auto_36045 ?auto_36046 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36048 - BLOCK
      ?auto_36049 - BLOCK
      ?auto_36050 - BLOCK
      ?auto_36051 - BLOCK
      ?auto_36052 - BLOCK
      ?auto_36053 - BLOCK
    )
    :vars
    (
      ?auto_36054 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36048 ?auto_36049 ) ) ( not ( = ?auto_36048 ?auto_36050 ) ) ( not ( = ?auto_36048 ?auto_36051 ) ) ( not ( = ?auto_36048 ?auto_36052 ) ) ( not ( = ?auto_36048 ?auto_36053 ) ) ( not ( = ?auto_36049 ?auto_36050 ) ) ( not ( = ?auto_36049 ?auto_36051 ) ) ( not ( = ?auto_36049 ?auto_36052 ) ) ( not ( = ?auto_36049 ?auto_36053 ) ) ( not ( = ?auto_36050 ?auto_36051 ) ) ( not ( = ?auto_36050 ?auto_36052 ) ) ( not ( = ?auto_36050 ?auto_36053 ) ) ( not ( = ?auto_36051 ?auto_36052 ) ) ( not ( = ?auto_36051 ?auto_36053 ) ) ( not ( = ?auto_36052 ?auto_36053 ) ) ( ON-TABLE ?auto_36053 ) ( ON ?auto_36052 ?auto_36053 ) ( ON ?auto_36051 ?auto_36052 ) ( ON ?auto_36048 ?auto_36054 ) ( not ( = ?auto_36048 ?auto_36054 ) ) ( not ( = ?auto_36049 ?auto_36054 ) ) ( not ( = ?auto_36050 ?auto_36054 ) ) ( not ( = ?auto_36051 ?auto_36054 ) ) ( not ( = ?auto_36052 ?auto_36054 ) ) ( not ( = ?auto_36053 ?auto_36054 ) ) ( ON ?auto_36049 ?auto_36048 ) ( ON-TABLE ?auto_36054 ) ( CLEAR ?auto_36051 ) ( ON ?auto_36050 ?auto_36049 ) ( CLEAR ?auto_36050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36054 ?auto_36048 ?auto_36049 )
      ( MAKE-6PILE ?auto_36048 ?auto_36049 ?auto_36050 ?auto_36051 ?auto_36052 ?auto_36053 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36055 - BLOCK
      ?auto_36056 - BLOCK
      ?auto_36057 - BLOCK
      ?auto_36058 - BLOCK
      ?auto_36059 - BLOCK
      ?auto_36060 - BLOCK
    )
    :vars
    (
      ?auto_36061 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36055 ?auto_36056 ) ) ( not ( = ?auto_36055 ?auto_36057 ) ) ( not ( = ?auto_36055 ?auto_36058 ) ) ( not ( = ?auto_36055 ?auto_36059 ) ) ( not ( = ?auto_36055 ?auto_36060 ) ) ( not ( = ?auto_36056 ?auto_36057 ) ) ( not ( = ?auto_36056 ?auto_36058 ) ) ( not ( = ?auto_36056 ?auto_36059 ) ) ( not ( = ?auto_36056 ?auto_36060 ) ) ( not ( = ?auto_36057 ?auto_36058 ) ) ( not ( = ?auto_36057 ?auto_36059 ) ) ( not ( = ?auto_36057 ?auto_36060 ) ) ( not ( = ?auto_36058 ?auto_36059 ) ) ( not ( = ?auto_36058 ?auto_36060 ) ) ( not ( = ?auto_36059 ?auto_36060 ) ) ( ON-TABLE ?auto_36060 ) ( ON ?auto_36059 ?auto_36060 ) ( ON ?auto_36055 ?auto_36061 ) ( not ( = ?auto_36055 ?auto_36061 ) ) ( not ( = ?auto_36056 ?auto_36061 ) ) ( not ( = ?auto_36057 ?auto_36061 ) ) ( not ( = ?auto_36058 ?auto_36061 ) ) ( not ( = ?auto_36059 ?auto_36061 ) ) ( not ( = ?auto_36060 ?auto_36061 ) ) ( ON ?auto_36056 ?auto_36055 ) ( ON-TABLE ?auto_36061 ) ( ON ?auto_36057 ?auto_36056 ) ( CLEAR ?auto_36057 ) ( HOLDING ?auto_36058 ) ( CLEAR ?auto_36059 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36060 ?auto_36059 ?auto_36058 )
      ( MAKE-6PILE ?auto_36055 ?auto_36056 ?auto_36057 ?auto_36058 ?auto_36059 ?auto_36060 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36062 - BLOCK
      ?auto_36063 - BLOCK
      ?auto_36064 - BLOCK
      ?auto_36065 - BLOCK
      ?auto_36066 - BLOCK
      ?auto_36067 - BLOCK
    )
    :vars
    (
      ?auto_36068 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36062 ?auto_36063 ) ) ( not ( = ?auto_36062 ?auto_36064 ) ) ( not ( = ?auto_36062 ?auto_36065 ) ) ( not ( = ?auto_36062 ?auto_36066 ) ) ( not ( = ?auto_36062 ?auto_36067 ) ) ( not ( = ?auto_36063 ?auto_36064 ) ) ( not ( = ?auto_36063 ?auto_36065 ) ) ( not ( = ?auto_36063 ?auto_36066 ) ) ( not ( = ?auto_36063 ?auto_36067 ) ) ( not ( = ?auto_36064 ?auto_36065 ) ) ( not ( = ?auto_36064 ?auto_36066 ) ) ( not ( = ?auto_36064 ?auto_36067 ) ) ( not ( = ?auto_36065 ?auto_36066 ) ) ( not ( = ?auto_36065 ?auto_36067 ) ) ( not ( = ?auto_36066 ?auto_36067 ) ) ( ON-TABLE ?auto_36067 ) ( ON ?auto_36066 ?auto_36067 ) ( ON ?auto_36062 ?auto_36068 ) ( not ( = ?auto_36062 ?auto_36068 ) ) ( not ( = ?auto_36063 ?auto_36068 ) ) ( not ( = ?auto_36064 ?auto_36068 ) ) ( not ( = ?auto_36065 ?auto_36068 ) ) ( not ( = ?auto_36066 ?auto_36068 ) ) ( not ( = ?auto_36067 ?auto_36068 ) ) ( ON ?auto_36063 ?auto_36062 ) ( ON-TABLE ?auto_36068 ) ( ON ?auto_36064 ?auto_36063 ) ( CLEAR ?auto_36066 ) ( ON ?auto_36065 ?auto_36064 ) ( CLEAR ?auto_36065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36068 ?auto_36062 ?auto_36063 ?auto_36064 )
      ( MAKE-6PILE ?auto_36062 ?auto_36063 ?auto_36064 ?auto_36065 ?auto_36066 ?auto_36067 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36069 - BLOCK
      ?auto_36070 - BLOCK
      ?auto_36071 - BLOCK
      ?auto_36072 - BLOCK
      ?auto_36073 - BLOCK
      ?auto_36074 - BLOCK
    )
    :vars
    (
      ?auto_36075 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36069 ?auto_36070 ) ) ( not ( = ?auto_36069 ?auto_36071 ) ) ( not ( = ?auto_36069 ?auto_36072 ) ) ( not ( = ?auto_36069 ?auto_36073 ) ) ( not ( = ?auto_36069 ?auto_36074 ) ) ( not ( = ?auto_36070 ?auto_36071 ) ) ( not ( = ?auto_36070 ?auto_36072 ) ) ( not ( = ?auto_36070 ?auto_36073 ) ) ( not ( = ?auto_36070 ?auto_36074 ) ) ( not ( = ?auto_36071 ?auto_36072 ) ) ( not ( = ?auto_36071 ?auto_36073 ) ) ( not ( = ?auto_36071 ?auto_36074 ) ) ( not ( = ?auto_36072 ?auto_36073 ) ) ( not ( = ?auto_36072 ?auto_36074 ) ) ( not ( = ?auto_36073 ?auto_36074 ) ) ( ON-TABLE ?auto_36074 ) ( ON ?auto_36069 ?auto_36075 ) ( not ( = ?auto_36069 ?auto_36075 ) ) ( not ( = ?auto_36070 ?auto_36075 ) ) ( not ( = ?auto_36071 ?auto_36075 ) ) ( not ( = ?auto_36072 ?auto_36075 ) ) ( not ( = ?auto_36073 ?auto_36075 ) ) ( not ( = ?auto_36074 ?auto_36075 ) ) ( ON ?auto_36070 ?auto_36069 ) ( ON-TABLE ?auto_36075 ) ( ON ?auto_36071 ?auto_36070 ) ( ON ?auto_36072 ?auto_36071 ) ( CLEAR ?auto_36072 ) ( HOLDING ?auto_36073 ) ( CLEAR ?auto_36074 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36074 ?auto_36073 )
      ( MAKE-6PILE ?auto_36069 ?auto_36070 ?auto_36071 ?auto_36072 ?auto_36073 ?auto_36074 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36076 - BLOCK
      ?auto_36077 - BLOCK
      ?auto_36078 - BLOCK
      ?auto_36079 - BLOCK
      ?auto_36080 - BLOCK
      ?auto_36081 - BLOCK
    )
    :vars
    (
      ?auto_36082 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36076 ?auto_36077 ) ) ( not ( = ?auto_36076 ?auto_36078 ) ) ( not ( = ?auto_36076 ?auto_36079 ) ) ( not ( = ?auto_36076 ?auto_36080 ) ) ( not ( = ?auto_36076 ?auto_36081 ) ) ( not ( = ?auto_36077 ?auto_36078 ) ) ( not ( = ?auto_36077 ?auto_36079 ) ) ( not ( = ?auto_36077 ?auto_36080 ) ) ( not ( = ?auto_36077 ?auto_36081 ) ) ( not ( = ?auto_36078 ?auto_36079 ) ) ( not ( = ?auto_36078 ?auto_36080 ) ) ( not ( = ?auto_36078 ?auto_36081 ) ) ( not ( = ?auto_36079 ?auto_36080 ) ) ( not ( = ?auto_36079 ?auto_36081 ) ) ( not ( = ?auto_36080 ?auto_36081 ) ) ( ON-TABLE ?auto_36081 ) ( ON ?auto_36076 ?auto_36082 ) ( not ( = ?auto_36076 ?auto_36082 ) ) ( not ( = ?auto_36077 ?auto_36082 ) ) ( not ( = ?auto_36078 ?auto_36082 ) ) ( not ( = ?auto_36079 ?auto_36082 ) ) ( not ( = ?auto_36080 ?auto_36082 ) ) ( not ( = ?auto_36081 ?auto_36082 ) ) ( ON ?auto_36077 ?auto_36076 ) ( ON-TABLE ?auto_36082 ) ( ON ?auto_36078 ?auto_36077 ) ( ON ?auto_36079 ?auto_36078 ) ( CLEAR ?auto_36081 ) ( ON ?auto_36080 ?auto_36079 ) ( CLEAR ?auto_36080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36082 ?auto_36076 ?auto_36077 ?auto_36078 ?auto_36079 )
      ( MAKE-6PILE ?auto_36076 ?auto_36077 ?auto_36078 ?auto_36079 ?auto_36080 ?auto_36081 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36083 - BLOCK
      ?auto_36084 - BLOCK
      ?auto_36085 - BLOCK
      ?auto_36086 - BLOCK
      ?auto_36087 - BLOCK
      ?auto_36088 - BLOCK
    )
    :vars
    (
      ?auto_36089 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36083 ?auto_36084 ) ) ( not ( = ?auto_36083 ?auto_36085 ) ) ( not ( = ?auto_36083 ?auto_36086 ) ) ( not ( = ?auto_36083 ?auto_36087 ) ) ( not ( = ?auto_36083 ?auto_36088 ) ) ( not ( = ?auto_36084 ?auto_36085 ) ) ( not ( = ?auto_36084 ?auto_36086 ) ) ( not ( = ?auto_36084 ?auto_36087 ) ) ( not ( = ?auto_36084 ?auto_36088 ) ) ( not ( = ?auto_36085 ?auto_36086 ) ) ( not ( = ?auto_36085 ?auto_36087 ) ) ( not ( = ?auto_36085 ?auto_36088 ) ) ( not ( = ?auto_36086 ?auto_36087 ) ) ( not ( = ?auto_36086 ?auto_36088 ) ) ( not ( = ?auto_36087 ?auto_36088 ) ) ( ON ?auto_36083 ?auto_36089 ) ( not ( = ?auto_36083 ?auto_36089 ) ) ( not ( = ?auto_36084 ?auto_36089 ) ) ( not ( = ?auto_36085 ?auto_36089 ) ) ( not ( = ?auto_36086 ?auto_36089 ) ) ( not ( = ?auto_36087 ?auto_36089 ) ) ( not ( = ?auto_36088 ?auto_36089 ) ) ( ON ?auto_36084 ?auto_36083 ) ( ON-TABLE ?auto_36089 ) ( ON ?auto_36085 ?auto_36084 ) ( ON ?auto_36086 ?auto_36085 ) ( ON ?auto_36087 ?auto_36086 ) ( CLEAR ?auto_36087 ) ( HOLDING ?auto_36088 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36088 )
      ( MAKE-6PILE ?auto_36083 ?auto_36084 ?auto_36085 ?auto_36086 ?auto_36087 ?auto_36088 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36090 - BLOCK
      ?auto_36091 - BLOCK
      ?auto_36092 - BLOCK
      ?auto_36093 - BLOCK
      ?auto_36094 - BLOCK
      ?auto_36095 - BLOCK
    )
    :vars
    (
      ?auto_36096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36090 ?auto_36091 ) ) ( not ( = ?auto_36090 ?auto_36092 ) ) ( not ( = ?auto_36090 ?auto_36093 ) ) ( not ( = ?auto_36090 ?auto_36094 ) ) ( not ( = ?auto_36090 ?auto_36095 ) ) ( not ( = ?auto_36091 ?auto_36092 ) ) ( not ( = ?auto_36091 ?auto_36093 ) ) ( not ( = ?auto_36091 ?auto_36094 ) ) ( not ( = ?auto_36091 ?auto_36095 ) ) ( not ( = ?auto_36092 ?auto_36093 ) ) ( not ( = ?auto_36092 ?auto_36094 ) ) ( not ( = ?auto_36092 ?auto_36095 ) ) ( not ( = ?auto_36093 ?auto_36094 ) ) ( not ( = ?auto_36093 ?auto_36095 ) ) ( not ( = ?auto_36094 ?auto_36095 ) ) ( ON ?auto_36090 ?auto_36096 ) ( not ( = ?auto_36090 ?auto_36096 ) ) ( not ( = ?auto_36091 ?auto_36096 ) ) ( not ( = ?auto_36092 ?auto_36096 ) ) ( not ( = ?auto_36093 ?auto_36096 ) ) ( not ( = ?auto_36094 ?auto_36096 ) ) ( not ( = ?auto_36095 ?auto_36096 ) ) ( ON ?auto_36091 ?auto_36090 ) ( ON-TABLE ?auto_36096 ) ( ON ?auto_36092 ?auto_36091 ) ( ON ?auto_36093 ?auto_36092 ) ( ON ?auto_36094 ?auto_36093 ) ( ON ?auto_36095 ?auto_36094 ) ( CLEAR ?auto_36095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_36096 ?auto_36090 ?auto_36091 ?auto_36092 ?auto_36093 ?auto_36094 )
      ( MAKE-6PILE ?auto_36090 ?auto_36091 ?auto_36092 ?auto_36093 ?auto_36094 ?auto_36095 ) )
  )

)

