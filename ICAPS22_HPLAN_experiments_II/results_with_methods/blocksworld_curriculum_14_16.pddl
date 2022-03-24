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
      ?auto_343481 - BLOCK
    )
    :vars
    (
      ?auto_343482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343481 ?auto_343482 ) ( CLEAR ?auto_343481 ) ( HAND-EMPTY ) ( not ( = ?auto_343481 ?auto_343482 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_343481 ?auto_343482 )
      ( !PUTDOWN ?auto_343481 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_343484 - BLOCK
    )
    :vars
    (
      ?auto_343485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343484 ?auto_343485 ) ( CLEAR ?auto_343484 ) ( HAND-EMPTY ) ( not ( = ?auto_343484 ?auto_343485 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_343484 ?auto_343485 )
      ( !PUTDOWN ?auto_343484 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_343488 - BLOCK
      ?auto_343489 - BLOCK
    )
    :vars
    (
      ?auto_343490 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_343488 ) ( ON ?auto_343489 ?auto_343490 ) ( CLEAR ?auto_343489 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_343488 ) ( not ( = ?auto_343488 ?auto_343489 ) ) ( not ( = ?auto_343488 ?auto_343490 ) ) ( not ( = ?auto_343489 ?auto_343490 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_343489 ?auto_343490 )
      ( !STACK ?auto_343489 ?auto_343488 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_343493 - BLOCK
      ?auto_343494 - BLOCK
    )
    :vars
    (
      ?auto_343495 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_343493 ) ( ON ?auto_343494 ?auto_343495 ) ( CLEAR ?auto_343494 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_343493 ) ( not ( = ?auto_343493 ?auto_343494 ) ) ( not ( = ?auto_343493 ?auto_343495 ) ) ( not ( = ?auto_343494 ?auto_343495 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_343494 ?auto_343495 )
      ( !STACK ?auto_343494 ?auto_343493 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_343498 - BLOCK
      ?auto_343499 - BLOCK
    )
    :vars
    (
      ?auto_343500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343499 ?auto_343500 ) ( not ( = ?auto_343498 ?auto_343499 ) ) ( not ( = ?auto_343498 ?auto_343500 ) ) ( not ( = ?auto_343499 ?auto_343500 ) ) ( ON ?auto_343498 ?auto_343499 ) ( CLEAR ?auto_343498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_343498 )
      ( MAKE-2PILE ?auto_343498 ?auto_343499 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_343503 - BLOCK
      ?auto_343504 - BLOCK
    )
    :vars
    (
      ?auto_343505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343504 ?auto_343505 ) ( not ( = ?auto_343503 ?auto_343504 ) ) ( not ( = ?auto_343503 ?auto_343505 ) ) ( not ( = ?auto_343504 ?auto_343505 ) ) ( ON ?auto_343503 ?auto_343504 ) ( CLEAR ?auto_343503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_343503 )
      ( MAKE-2PILE ?auto_343503 ?auto_343504 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_343509 - BLOCK
      ?auto_343510 - BLOCK
      ?auto_343511 - BLOCK
    )
    :vars
    (
      ?auto_343512 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_343510 ) ( ON ?auto_343511 ?auto_343512 ) ( CLEAR ?auto_343511 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_343509 ) ( ON ?auto_343510 ?auto_343509 ) ( not ( = ?auto_343509 ?auto_343510 ) ) ( not ( = ?auto_343509 ?auto_343511 ) ) ( not ( = ?auto_343509 ?auto_343512 ) ) ( not ( = ?auto_343510 ?auto_343511 ) ) ( not ( = ?auto_343510 ?auto_343512 ) ) ( not ( = ?auto_343511 ?auto_343512 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_343511 ?auto_343512 )
      ( !STACK ?auto_343511 ?auto_343510 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_343516 - BLOCK
      ?auto_343517 - BLOCK
      ?auto_343518 - BLOCK
    )
    :vars
    (
      ?auto_343519 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_343517 ) ( ON ?auto_343518 ?auto_343519 ) ( CLEAR ?auto_343518 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_343516 ) ( ON ?auto_343517 ?auto_343516 ) ( not ( = ?auto_343516 ?auto_343517 ) ) ( not ( = ?auto_343516 ?auto_343518 ) ) ( not ( = ?auto_343516 ?auto_343519 ) ) ( not ( = ?auto_343517 ?auto_343518 ) ) ( not ( = ?auto_343517 ?auto_343519 ) ) ( not ( = ?auto_343518 ?auto_343519 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_343518 ?auto_343519 )
      ( !STACK ?auto_343518 ?auto_343517 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_343523 - BLOCK
      ?auto_343524 - BLOCK
      ?auto_343525 - BLOCK
    )
    :vars
    (
      ?auto_343526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343525 ?auto_343526 ) ( ON-TABLE ?auto_343523 ) ( not ( = ?auto_343523 ?auto_343524 ) ) ( not ( = ?auto_343523 ?auto_343525 ) ) ( not ( = ?auto_343523 ?auto_343526 ) ) ( not ( = ?auto_343524 ?auto_343525 ) ) ( not ( = ?auto_343524 ?auto_343526 ) ) ( not ( = ?auto_343525 ?auto_343526 ) ) ( CLEAR ?auto_343523 ) ( ON ?auto_343524 ?auto_343525 ) ( CLEAR ?auto_343524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_343523 ?auto_343524 )
      ( MAKE-3PILE ?auto_343523 ?auto_343524 ?auto_343525 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_343530 - BLOCK
      ?auto_343531 - BLOCK
      ?auto_343532 - BLOCK
    )
    :vars
    (
      ?auto_343533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343532 ?auto_343533 ) ( ON-TABLE ?auto_343530 ) ( not ( = ?auto_343530 ?auto_343531 ) ) ( not ( = ?auto_343530 ?auto_343532 ) ) ( not ( = ?auto_343530 ?auto_343533 ) ) ( not ( = ?auto_343531 ?auto_343532 ) ) ( not ( = ?auto_343531 ?auto_343533 ) ) ( not ( = ?auto_343532 ?auto_343533 ) ) ( CLEAR ?auto_343530 ) ( ON ?auto_343531 ?auto_343532 ) ( CLEAR ?auto_343531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_343530 ?auto_343531 )
      ( MAKE-3PILE ?auto_343530 ?auto_343531 ?auto_343532 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_343537 - BLOCK
      ?auto_343538 - BLOCK
      ?auto_343539 - BLOCK
    )
    :vars
    (
      ?auto_343540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343539 ?auto_343540 ) ( not ( = ?auto_343537 ?auto_343538 ) ) ( not ( = ?auto_343537 ?auto_343539 ) ) ( not ( = ?auto_343537 ?auto_343540 ) ) ( not ( = ?auto_343538 ?auto_343539 ) ) ( not ( = ?auto_343538 ?auto_343540 ) ) ( not ( = ?auto_343539 ?auto_343540 ) ) ( ON ?auto_343538 ?auto_343539 ) ( ON ?auto_343537 ?auto_343538 ) ( CLEAR ?auto_343537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_343537 )
      ( MAKE-3PILE ?auto_343537 ?auto_343538 ?auto_343539 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_343544 - BLOCK
      ?auto_343545 - BLOCK
      ?auto_343546 - BLOCK
    )
    :vars
    (
      ?auto_343547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343546 ?auto_343547 ) ( not ( = ?auto_343544 ?auto_343545 ) ) ( not ( = ?auto_343544 ?auto_343546 ) ) ( not ( = ?auto_343544 ?auto_343547 ) ) ( not ( = ?auto_343545 ?auto_343546 ) ) ( not ( = ?auto_343545 ?auto_343547 ) ) ( not ( = ?auto_343546 ?auto_343547 ) ) ( ON ?auto_343545 ?auto_343546 ) ( ON ?auto_343544 ?auto_343545 ) ( CLEAR ?auto_343544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_343544 )
      ( MAKE-3PILE ?auto_343544 ?auto_343545 ?auto_343546 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_343552 - BLOCK
      ?auto_343553 - BLOCK
      ?auto_343554 - BLOCK
      ?auto_343555 - BLOCK
    )
    :vars
    (
      ?auto_343556 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_343554 ) ( ON ?auto_343555 ?auto_343556 ) ( CLEAR ?auto_343555 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_343552 ) ( ON ?auto_343553 ?auto_343552 ) ( ON ?auto_343554 ?auto_343553 ) ( not ( = ?auto_343552 ?auto_343553 ) ) ( not ( = ?auto_343552 ?auto_343554 ) ) ( not ( = ?auto_343552 ?auto_343555 ) ) ( not ( = ?auto_343552 ?auto_343556 ) ) ( not ( = ?auto_343553 ?auto_343554 ) ) ( not ( = ?auto_343553 ?auto_343555 ) ) ( not ( = ?auto_343553 ?auto_343556 ) ) ( not ( = ?auto_343554 ?auto_343555 ) ) ( not ( = ?auto_343554 ?auto_343556 ) ) ( not ( = ?auto_343555 ?auto_343556 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_343555 ?auto_343556 )
      ( !STACK ?auto_343555 ?auto_343554 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_343561 - BLOCK
      ?auto_343562 - BLOCK
      ?auto_343563 - BLOCK
      ?auto_343564 - BLOCK
    )
    :vars
    (
      ?auto_343565 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_343563 ) ( ON ?auto_343564 ?auto_343565 ) ( CLEAR ?auto_343564 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_343561 ) ( ON ?auto_343562 ?auto_343561 ) ( ON ?auto_343563 ?auto_343562 ) ( not ( = ?auto_343561 ?auto_343562 ) ) ( not ( = ?auto_343561 ?auto_343563 ) ) ( not ( = ?auto_343561 ?auto_343564 ) ) ( not ( = ?auto_343561 ?auto_343565 ) ) ( not ( = ?auto_343562 ?auto_343563 ) ) ( not ( = ?auto_343562 ?auto_343564 ) ) ( not ( = ?auto_343562 ?auto_343565 ) ) ( not ( = ?auto_343563 ?auto_343564 ) ) ( not ( = ?auto_343563 ?auto_343565 ) ) ( not ( = ?auto_343564 ?auto_343565 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_343564 ?auto_343565 )
      ( !STACK ?auto_343564 ?auto_343563 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_343570 - BLOCK
      ?auto_343571 - BLOCK
      ?auto_343572 - BLOCK
      ?auto_343573 - BLOCK
    )
    :vars
    (
      ?auto_343574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343573 ?auto_343574 ) ( ON-TABLE ?auto_343570 ) ( ON ?auto_343571 ?auto_343570 ) ( not ( = ?auto_343570 ?auto_343571 ) ) ( not ( = ?auto_343570 ?auto_343572 ) ) ( not ( = ?auto_343570 ?auto_343573 ) ) ( not ( = ?auto_343570 ?auto_343574 ) ) ( not ( = ?auto_343571 ?auto_343572 ) ) ( not ( = ?auto_343571 ?auto_343573 ) ) ( not ( = ?auto_343571 ?auto_343574 ) ) ( not ( = ?auto_343572 ?auto_343573 ) ) ( not ( = ?auto_343572 ?auto_343574 ) ) ( not ( = ?auto_343573 ?auto_343574 ) ) ( CLEAR ?auto_343571 ) ( ON ?auto_343572 ?auto_343573 ) ( CLEAR ?auto_343572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_343570 ?auto_343571 ?auto_343572 )
      ( MAKE-4PILE ?auto_343570 ?auto_343571 ?auto_343572 ?auto_343573 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_343579 - BLOCK
      ?auto_343580 - BLOCK
      ?auto_343581 - BLOCK
      ?auto_343582 - BLOCK
    )
    :vars
    (
      ?auto_343583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343582 ?auto_343583 ) ( ON-TABLE ?auto_343579 ) ( ON ?auto_343580 ?auto_343579 ) ( not ( = ?auto_343579 ?auto_343580 ) ) ( not ( = ?auto_343579 ?auto_343581 ) ) ( not ( = ?auto_343579 ?auto_343582 ) ) ( not ( = ?auto_343579 ?auto_343583 ) ) ( not ( = ?auto_343580 ?auto_343581 ) ) ( not ( = ?auto_343580 ?auto_343582 ) ) ( not ( = ?auto_343580 ?auto_343583 ) ) ( not ( = ?auto_343581 ?auto_343582 ) ) ( not ( = ?auto_343581 ?auto_343583 ) ) ( not ( = ?auto_343582 ?auto_343583 ) ) ( CLEAR ?auto_343580 ) ( ON ?auto_343581 ?auto_343582 ) ( CLEAR ?auto_343581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_343579 ?auto_343580 ?auto_343581 )
      ( MAKE-4PILE ?auto_343579 ?auto_343580 ?auto_343581 ?auto_343582 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_343588 - BLOCK
      ?auto_343589 - BLOCK
      ?auto_343590 - BLOCK
      ?auto_343591 - BLOCK
    )
    :vars
    (
      ?auto_343592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343591 ?auto_343592 ) ( ON-TABLE ?auto_343588 ) ( not ( = ?auto_343588 ?auto_343589 ) ) ( not ( = ?auto_343588 ?auto_343590 ) ) ( not ( = ?auto_343588 ?auto_343591 ) ) ( not ( = ?auto_343588 ?auto_343592 ) ) ( not ( = ?auto_343589 ?auto_343590 ) ) ( not ( = ?auto_343589 ?auto_343591 ) ) ( not ( = ?auto_343589 ?auto_343592 ) ) ( not ( = ?auto_343590 ?auto_343591 ) ) ( not ( = ?auto_343590 ?auto_343592 ) ) ( not ( = ?auto_343591 ?auto_343592 ) ) ( ON ?auto_343590 ?auto_343591 ) ( CLEAR ?auto_343588 ) ( ON ?auto_343589 ?auto_343590 ) ( CLEAR ?auto_343589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_343588 ?auto_343589 )
      ( MAKE-4PILE ?auto_343588 ?auto_343589 ?auto_343590 ?auto_343591 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_343597 - BLOCK
      ?auto_343598 - BLOCK
      ?auto_343599 - BLOCK
      ?auto_343600 - BLOCK
    )
    :vars
    (
      ?auto_343601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343600 ?auto_343601 ) ( ON-TABLE ?auto_343597 ) ( not ( = ?auto_343597 ?auto_343598 ) ) ( not ( = ?auto_343597 ?auto_343599 ) ) ( not ( = ?auto_343597 ?auto_343600 ) ) ( not ( = ?auto_343597 ?auto_343601 ) ) ( not ( = ?auto_343598 ?auto_343599 ) ) ( not ( = ?auto_343598 ?auto_343600 ) ) ( not ( = ?auto_343598 ?auto_343601 ) ) ( not ( = ?auto_343599 ?auto_343600 ) ) ( not ( = ?auto_343599 ?auto_343601 ) ) ( not ( = ?auto_343600 ?auto_343601 ) ) ( ON ?auto_343599 ?auto_343600 ) ( CLEAR ?auto_343597 ) ( ON ?auto_343598 ?auto_343599 ) ( CLEAR ?auto_343598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_343597 ?auto_343598 )
      ( MAKE-4PILE ?auto_343597 ?auto_343598 ?auto_343599 ?auto_343600 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_343606 - BLOCK
      ?auto_343607 - BLOCK
      ?auto_343608 - BLOCK
      ?auto_343609 - BLOCK
    )
    :vars
    (
      ?auto_343610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343609 ?auto_343610 ) ( not ( = ?auto_343606 ?auto_343607 ) ) ( not ( = ?auto_343606 ?auto_343608 ) ) ( not ( = ?auto_343606 ?auto_343609 ) ) ( not ( = ?auto_343606 ?auto_343610 ) ) ( not ( = ?auto_343607 ?auto_343608 ) ) ( not ( = ?auto_343607 ?auto_343609 ) ) ( not ( = ?auto_343607 ?auto_343610 ) ) ( not ( = ?auto_343608 ?auto_343609 ) ) ( not ( = ?auto_343608 ?auto_343610 ) ) ( not ( = ?auto_343609 ?auto_343610 ) ) ( ON ?auto_343608 ?auto_343609 ) ( ON ?auto_343607 ?auto_343608 ) ( ON ?auto_343606 ?auto_343607 ) ( CLEAR ?auto_343606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_343606 )
      ( MAKE-4PILE ?auto_343606 ?auto_343607 ?auto_343608 ?auto_343609 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_343615 - BLOCK
      ?auto_343616 - BLOCK
      ?auto_343617 - BLOCK
      ?auto_343618 - BLOCK
    )
    :vars
    (
      ?auto_343619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343618 ?auto_343619 ) ( not ( = ?auto_343615 ?auto_343616 ) ) ( not ( = ?auto_343615 ?auto_343617 ) ) ( not ( = ?auto_343615 ?auto_343618 ) ) ( not ( = ?auto_343615 ?auto_343619 ) ) ( not ( = ?auto_343616 ?auto_343617 ) ) ( not ( = ?auto_343616 ?auto_343618 ) ) ( not ( = ?auto_343616 ?auto_343619 ) ) ( not ( = ?auto_343617 ?auto_343618 ) ) ( not ( = ?auto_343617 ?auto_343619 ) ) ( not ( = ?auto_343618 ?auto_343619 ) ) ( ON ?auto_343617 ?auto_343618 ) ( ON ?auto_343616 ?auto_343617 ) ( ON ?auto_343615 ?auto_343616 ) ( CLEAR ?auto_343615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_343615 )
      ( MAKE-4PILE ?auto_343615 ?auto_343616 ?auto_343617 ?auto_343618 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_343625 - BLOCK
      ?auto_343626 - BLOCK
      ?auto_343627 - BLOCK
      ?auto_343628 - BLOCK
      ?auto_343629 - BLOCK
    )
    :vars
    (
      ?auto_343630 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_343628 ) ( ON ?auto_343629 ?auto_343630 ) ( CLEAR ?auto_343629 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_343625 ) ( ON ?auto_343626 ?auto_343625 ) ( ON ?auto_343627 ?auto_343626 ) ( ON ?auto_343628 ?auto_343627 ) ( not ( = ?auto_343625 ?auto_343626 ) ) ( not ( = ?auto_343625 ?auto_343627 ) ) ( not ( = ?auto_343625 ?auto_343628 ) ) ( not ( = ?auto_343625 ?auto_343629 ) ) ( not ( = ?auto_343625 ?auto_343630 ) ) ( not ( = ?auto_343626 ?auto_343627 ) ) ( not ( = ?auto_343626 ?auto_343628 ) ) ( not ( = ?auto_343626 ?auto_343629 ) ) ( not ( = ?auto_343626 ?auto_343630 ) ) ( not ( = ?auto_343627 ?auto_343628 ) ) ( not ( = ?auto_343627 ?auto_343629 ) ) ( not ( = ?auto_343627 ?auto_343630 ) ) ( not ( = ?auto_343628 ?auto_343629 ) ) ( not ( = ?auto_343628 ?auto_343630 ) ) ( not ( = ?auto_343629 ?auto_343630 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_343629 ?auto_343630 )
      ( !STACK ?auto_343629 ?auto_343628 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_343636 - BLOCK
      ?auto_343637 - BLOCK
      ?auto_343638 - BLOCK
      ?auto_343639 - BLOCK
      ?auto_343640 - BLOCK
    )
    :vars
    (
      ?auto_343641 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_343639 ) ( ON ?auto_343640 ?auto_343641 ) ( CLEAR ?auto_343640 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_343636 ) ( ON ?auto_343637 ?auto_343636 ) ( ON ?auto_343638 ?auto_343637 ) ( ON ?auto_343639 ?auto_343638 ) ( not ( = ?auto_343636 ?auto_343637 ) ) ( not ( = ?auto_343636 ?auto_343638 ) ) ( not ( = ?auto_343636 ?auto_343639 ) ) ( not ( = ?auto_343636 ?auto_343640 ) ) ( not ( = ?auto_343636 ?auto_343641 ) ) ( not ( = ?auto_343637 ?auto_343638 ) ) ( not ( = ?auto_343637 ?auto_343639 ) ) ( not ( = ?auto_343637 ?auto_343640 ) ) ( not ( = ?auto_343637 ?auto_343641 ) ) ( not ( = ?auto_343638 ?auto_343639 ) ) ( not ( = ?auto_343638 ?auto_343640 ) ) ( not ( = ?auto_343638 ?auto_343641 ) ) ( not ( = ?auto_343639 ?auto_343640 ) ) ( not ( = ?auto_343639 ?auto_343641 ) ) ( not ( = ?auto_343640 ?auto_343641 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_343640 ?auto_343641 )
      ( !STACK ?auto_343640 ?auto_343639 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_343647 - BLOCK
      ?auto_343648 - BLOCK
      ?auto_343649 - BLOCK
      ?auto_343650 - BLOCK
      ?auto_343651 - BLOCK
    )
    :vars
    (
      ?auto_343652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343651 ?auto_343652 ) ( ON-TABLE ?auto_343647 ) ( ON ?auto_343648 ?auto_343647 ) ( ON ?auto_343649 ?auto_343648 ) ( not ( = ?auto_343647 ?auto_343648 ) ) ( not ( = ?auto_343647 ?auto_343649 ) ) ( not ( = ?auto_343647 ?auto_343650 ) ) ( not ( = ?auto_343647 ?auto_343651 ) ) ( not ( = ?auto_343647 ?auto_343652 ) ) ( not ( = ?auto_343648 ?auto_343649 ) ) ( not ( = ?auto_343648 ?auto_343650 ) ) ( not ( = ?auto_343648 ?auto_343651 ) ) ( not ( = ?auto_343648 ?auto_343652 ) ) ( not ( = ?auto_343649 ?auto_343650 ) ) ( not ( = ?auto_343649 ?auto_343651 ) ) ( not ( = ?auto_343649 ?auto_343652 ) ) ( not ( = ?auto_343650 ?auto_343651 ) ) ( not ( = ?auto_343650 ?auto_343652 ) ) ( not ( = ?auto_343651 ?auto_343652 ) ) ( CLEAR ?auto_343649 ) ( ON ?auto_343650 ?auto_343651 ) ( CLEAR ?auto_343650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_343647 ?auto_343648 ?auto_343649 ?auto_343650 )
      ( MAKE-5PILE ?auto_343647 ?auto_343648 ?auto_343649 ?auto_343650 ?auto_343651 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_343658 - BLOCK
      ?auto_343659 - BLOCK
      ?auto_343660 - BLOCK
      ?auto_343661 - BLOCK
      ?auto_343662 - BLOCK
    )
    :vars
    (
      ?auto_343663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343662 ?auto_343663 ) ( ON-TABLE ?auto_343658 ) ( ON ?auto_343659 ?auto_343658 ) ( ON ?auto_343660 ?auto_343659 ) ( not ( = ?auto_343658 ?auto_343659 ) ) ( not ( = ?auto_343658 ?auto_343660 ) ) ( not ( = ?auto_343658 ?auto_343661 ) ) ( not ( = ?auto_343658 ?auto_343662 ) ) ( not ( = ?auto_343658 ?auto_343663 ) ) ( not ( = ?auto_343659 ?auto_343660 ) ) ( not ( = ?auto_343659 ?auto_343661 ) ) ( not ( = ?auto_343659 ?auto_343662 ) ) ( not ( = ?auto_343659 ?auto_343663 ) ) ( not ( = ?auto_343660 ?auto_343661 ) ) ( not ( = ?auto_343660 ?auto_343662 ) ) ( not ( = ?auto_343660 ?auto_343663 ) ) ( not ( = ?auto_343661 ?auto_343662 ) ) ( not ( = ?auto_343661 ?auto_343663 ) ) ( not ( = ?auto_343662 ?auto_343663 ) ) ( CLEAR ?auto_343660 ) ( ON ?auto_343661 ?auto_343662 ) ( CLEAR ?auto_343661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_343658 ?auto_343659 ?auto_343660 ?auto_343661 )
      ( MAKE-5PILE ?auto_343658 ?auto_343659 ?auto_343660 ?auto_343661 ?auto_343662 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_343669 - BLOCK
      ?auto_343670 - BLOCK
      ?auto_343671 - BLOCK
      ?auto_343672 - BLOCK
      ?auto_343673 - BLOCK
    )
    :vars
    (
      ?auto_343674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343673 ?auto_343674 ) ( ON-TABLE ?auto_343669 ) ( ON ?auto_343670 ?auto_343669 ) ( not ( = ?auto_343669 ?auto_343670 ) ) ( not ( = ?auto_343669 ?auto_343671 ) ) ( not ( = ?auto_343669 ?auto_343672 ) ) ( not ( = ?auto_343669 ?auto_343673 ) ) ( not ( = ?auto_343669 ?auto_343674 ) ) ( not ( = ?auto_343670 ?auto_343671 ) ) ( not ( = ?auto_343670 ?auto_343672 ) ) ( not ( = ?auto_343670 ?auto_343673 ) ) ( not ( = ?auto_343670 ?auto_343674 ) ) ( not ( = ?auto_343671 ?auto_343672 ) ) ( not ( = ?auto_343671 ?auto_343673 ) ) ( not ( = ?auto_343671 ?auto_343674 ) ) ( not ( = ?auto_343672 ?auto_343673 ) ) ( not ( = ?auto_343672 ?auto_343674 ) ) ( not ( = ?auto_343673 ?auto_343674 ) ) ( ON ?auto_343672 ?auto_343673 ) ( CLEAR ?auto_343670 ) ( ON ?auto_343671 ?auto_343672 ) ( CLEAR ?auto_343671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_343669 ?auto_343670 ?auto_343671 )
      ( MAKE-5PILE ?auto_343669 ?auto_343670 ?auto_343671 ?auto_343672 ?auto_343673 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_343680 - BLOCK
      ?auto_343681 - BLOCK
      ?auto_343682 - BLOCK
      ?auto_343683 - BLOCK
      ?auto_343684 - BLOCK
    )
    :vars
    (
      ?auto_343685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343684 ?auto_343685 ) ( ON-TABLE ?auto_343680 ) ( ON ?auto_343681 ?auto_343680 ) ( not ( = ?auto_343680 ?auto_343681 ) ) ( not ( = ?auto_343680 ?auto_343682 ) ) ( not ( = ?auto_343680 ?auto_343683 ) ) ( not ( = ?auto_343680 ?auto_343684 ) ) ( not ( = ?auto_343680 ?auto_343685 ) ) ( not ( = ?auto_343681 ?auto_343682 ) ) ( not ( = ?auto_343681 ?auto_343683 ) ) ( not ( = ?auto_343681 ?auto_343684 ) ) ( not ( = ?auto_343681 ?auto_343685 ) ) ( not ( = ?auto_343682 ?auto_343683 ) ) ( not ( = ?auto_343682 ?auto_343684 ) ) ( not ( = ?auto_343682 ?auto_343685 ) ) ( not ( = ?auto_343683 ?auto_343684 ) ) ( not ( = ?auto_343683 ?auto_343685 ) ) ( not ( = ?auto_343684 ?auto_343685 ) ) ( ON ?auto_343683 ?auto_343684 ) ( CLEAR ?auto_343681 ) ( ON ?auto_343682 ?auto_343683 ) ( CLEAR ?auto_343682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_343680 ?auto_343681 ?auto_343682 )
      ( MAKE-5PILE ?auto_343680 ?auto_343681 ?auto_343682 ?auto_343683 ?auto_343684 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_343691 - BLOCK
      ?auto_343692 - BLOCK
      ?auto_343693 - BLOCK
      ?auto_343694 - BLOCK
      ?auto_343695 - BLOCK
    )
    :vars
    (
      ?auto_343696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343695 ?auto_343696 ) ( ON-TABLE ?auto_343691 ) ( not ( = ?auto_343691 ?auto_343692 ) ) ( not ( = ?auto_343691 ?auto_343693 ) ) ( not ( = ?auto_343691 ?auto_343694 ) ) ( not ( = ?auto_343691 ?auto_343695 ) ) ( not ( = ?auto_343691 ?auto_343696 ) ) ( not ( = ?auto_343692 ?auto_343693 ) ) ( not ( = ?auto_343692 ?auto_343694 ) ) ( not ( = ?auto_343692 ?auto_343695 ) ) ( not ( = ?auto_343692 ?auto_343696 ) ) ( not ( = ?auto_343693 ?auto_343694 ) ) ( not ( = ?auto_343693 ?auto_343695 ) ) ( not ( = ?auto_343693 ?auto_343696 ) ) ( not ( = ?auto_343694 ?auto_343695 ) ) ( not ( = ?auto_343694 ?auto_343696 ) ) ( not ( = ?auto_343695 ?auto_343696 ) ) ( ON ?auto_343694 ?auto_343695 ) ( ON ?auto_343693 ?auto_343694 ) ( CLEAR ?auto_343691 ) ( ON ?auto_343692 ?auto_343693 ) ( CLEAR ?auto_343692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_343691 ?auto_343692 )
      ( MAKE-5PILE ?auto_343691 ?auto_343692 ?auto_343693 ?auto_343694 ?auto_343695 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_343702 - BLOCK
      ?auto_343703 - BLOCK
      ?auto_343704 - BLOCK
      ?auto_343705 - BLOCK
      ?auto_343706 - BLOCK
    )
    :vars
    (
      ?auto_343707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343706 ?auto_343707 ) ( ON-TABLE ?auto_343702 ) ( not ( = ?auto_343702 ?auto_343703 ) ) ( not ( = ?auto_343702 ?auto_343704 ) ) ( not ( = ?auto_343702 ?auto_343705 ) ) ( not ( = ?auto_343702 ?auto_343706 ) ) ( not ( = ?auto_343702 ?auto_343707 ) ) ( not ( = ?auto_343703 ?auto_343704 ) ) ( not ( = ?auto_343703 ?auto_343705 ) ) ( not ( = ?auto_343703 ?auto_343706 ) ) ( not ( = ?auto_343703 ?auto_343707 ) ) ( not ( = ?auto_343704 ?auto_343705 ) ) ( not ( = ?auto_343704 ?auto_343706 ) ) ( not ( = ?auto_343704 ?auto_343707 ) ) ( not ( = ?auto_343705 ?auto_343706 ) ) ( not ( = ?auto_343705 ?auto_343707 ) ) ( not ( = ?auto_343706 ?auto_343707 ) ) ( ON ?auto_343705 ?auto_343706 ) ( ON ?auto_343704 ?auto_343705 ) ( CLEAR ?auto_343702 ) ( ON ?auto_343703 ?auto_343704 ) ( CLEAR ?auto_343703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_343702 ?auto_343703 )
      ( MAKE-5PILE ?auto_343702 ?auto_343703 ?auto_343704 ?auto_343705 ?auto_343706 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_343713 - BLOCK
      ?auto_343714 - BLOCK
      ?auto_343715 - BLOCK
      ?auto_343716 - BLOCK
      ?auto_343717 - BLOCK
    )
    :vars
    (
      ?auto_343718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343717 ?auto_343718 ) ( not ( = ?auto_343713 ?auto_343714 ) ) ( not ( = ?auto_343713 ?auto_343715 ) ) ( not ( = ?auto_343713 ?auto_343716 ) ) ( not ( = ?auto_343713 ?auto_343717 ) ) ( not ( = ?auto_343713 ?auto_343718 ) ) ( not ( = ?auto_343714 ?auto_343715 ) ) ( not ( = ?auto_343714 ?auto_343716 ) ) ( not ( = ?auto_343714 ?auto_343717 ) ) ( not ( = ?auto_343714 ?auto_343718 ) ) ( not ( = ?auto_343715 ?auto_343716 ) ) ( not ( = ?auto_343715 ?auto_343717 ) ) ( not ( = ?auto_343715 ?auto_343718 ) ) ( not ( = ?auto_343716 ?auto_343717 ) ) ( not ( = ?auto_343716 ?auto_343718 ) ) ( not ( = ?auto_343717 ?auto_343718 ) ) ( ON ?auto_343716 ?auto_343717 ) ( ON ?auto_343715 ?auto_343716 ) ( ON ?auto_343714 ?auto_343715 ) ( ON ?auto_343713 ?auto_343714 ) ( CLEAR ?auto_343713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_343713 )
      ( MAKE-5PILE ?auto_343713 ?auto_343714 ?auto_343715 ?auto_343716 ?auto_343717 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_343724 - BLOCK
      ?auto_343725 - BLOCK
      ?auto_343726 - BLOCK
      ?auto_343727 - BLOCK
      ?auto_343728 - BLOCK
    )
    :vars
    (
      ?auto_343729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343728 ?auto_343729 ) ( not ( = ?auto_343724 ?auto_343725 ) ) ( not ( = ?auto_343724 ?auto_343726 ) ) ( not ( = ?auto_343724 ?auto_343727 ) ) ( not ( = ?auto_343724 ?auto_343728 ) ) ( not ( = ?auto_343724 ?auto_343729 ) ) ( not ( = ?auto_343725 ?auto_343726 ) ) ( not ( = ?auto_343725 ?auto_343727 ) ) ( not ( = ?auto_343725 ?auto_343728 ) ) ( not ( = ?auto_343725 ?auto_343729 ) ) ( not ( = ?auto_343726 ?auto_343727 ) ) ( not ( = ?auto_343726 ?auto_343728 ) ) ( not ( = ?auto_343726 ?auto_343729 ) ) ( not ( = ?auto_343727 ?auto_343728 ) ) ( not ( = ?auto_343727 ?auto_343729 ) ) ( not ( = ?auto_343728 ?auto_343729 ) ) ( ON ?auto_343727 ?auto_343728 ) ( ON ?auto_343726 ?auto_343727 ) ( ON ?auto_343725 ?auto_343726 ) ( ON ?auto_343724 ?auto_343725 ) ( CLEAR ?auto_343724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_343724 )
      ( MAKE-5PILE ?auto_343724 ?auto_343725 ?auto_343726 ?auto_343727 ?auto_343728 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_343736 - BLOCK
      ?auto_343737 - BLOCK
      ?auto_343738 - BLOCK
      ?auto_343739 - BLOCK
      ?auto_343740 - BLOCK
      ?auto_343741 - BLOCK
    )
    :vars
    (
      ?auto_343742 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_343740 ) ( ON ?auto_343741 ?auto_343742 ) ( CLEAR ?auto_343741 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_343736 ) ( ON ?auto_343737 ?auto_343736 ) ( ON ?auto_343738 ?auto_343737 ) ( ON ?auto_343739 ?auto_343738 ) ( ON ?auto_343740 ?auto_343739 ) ( not ( = ?auto_343736 ?auto_343737 ) ) ( not ( = ?auto_343736 ?auto_343738 ) ) ( not ( = ?auto_343736 ?auto_343739 ) ) ( not ( = ?auto_343736 ?auto_343740 ) ) ( not ( = ?auto_343736 ?auto_343741 ) ) ( not ( = ?auto_343736 ?auto_343742 ) ) ( not ( = ?auto_343737 ?auto_343738 ) ) ( not ( = ?auto_343737 ?auto_343739 ) ) ( not ( = ?auto_343737 ?auto_343740 ) ) ( not ( = ?auto_343737 ?auto_343741 ) ) ( not ( = ?auto_343737 ?auto_343742 ) ) ( not ( = ?auto_343738 ?auto_343739 ) ) ( not ( = ?auto_343738 ?auto_343740 ) ) ( not ( = ?auto_343738 ?auto_343741 ) ) ( not ( = ?auto_343738 ?auto_343742 ) ) ( not ( = ?auto_343739 ?auto_343740 ) ) ( not ( = ?auto_343739 ?auto_343741 ) ) ( not ( = ?auto_343739 ?auto_343742 ) ) ( not ( = ?auto_343740 ?auto_343741 ) ) ( not ( = ?auto_343740 ?auto_343742 ) ) ( not ( = ?auto_343741 ?auto_343742 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_343741 ?auto_343742 )
      ( !STACK ?auto_343741 ?auto_343740 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_343749 - BLOCK
      ?auto_343750 - BLOCK
      ?auto_343751 - BLOCK
      ?auto_343752 - BLOCK
      ?auto_343753 - BLOCK
      ?auto_343754 - BLOCK
    )
    :vars
    (
      ?auto_343755 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_343753 ) ( ON ?auto_343754 ?auto_343755 ) ( CLEAR ?auto_343754 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_343749 ) ( ON ?auto_343750 ?auto_343749 ) ( ON ?auto_343751 ?auto_343750 ) ( ON ?auto_343752 ?auto_343751 ) ( ON ?auto_343753 ?auto_343752 ) ( not ( = ?auto_343749 ?auto_343750 ) ) ( not ( = ?auto_343749 ?auto_343751 ) ) ( not ( = ?auto_343749 ?auto_343752 ) ) ( not ( = ?auto_343749 ?auto_343753 ) ) ( not ( = ?auto_343749 ?auto_343754 ) ) ( not ( = ?auto_343749 ?auto_343755 ) ) ( not ( = ?auto_343750 ?auto_343751 ) ) ( not ( = ?auto_343750 ?auto_343752 ) ) ( not ( = ?auto_343750 ?auto_343753 ) ) ( not ( = ?auto_343750 ?auto_343754 ) ) ( not ( = ?auto_343750 ?auto_343755 ) ) ( not ( = ?auto_343751 ?auto_343752 ) ) ( not ( = ?auto_343751 ?auto_343753 ) ) ( not ( = ?auto_343751 ?auto_343754 ) ) ( not ( = ?auto_343751 ?auto_343755 ) ) ( not ( = ?auto_343752 ?auto_343753 ) ) ( not ( = ?auto_343752 ?auto_343754 ) ) ( not ( = ?auto_343752 ?auto_343755 ) ) ( not ( = ?auto_343753 ?auto_343754 ) ) ( not ( = ?auto_343753 ?auto_343755 ) ) ( not ( = ?auto_343754 ?auto_343755 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_343754 ?auto_343755 )
      ( !STACK ?auto_343754 ?auto_343753 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_343762 - BLOCK
      ?auto_343763 - BLOCK
      ?auto_343764 - BLOCK
      ?auto_343765 - BLOCK
      ?auto_343766 - BLOCK
      ?auto_343767 - BLOCK
    )
    :vars
    (
      ?auto_343768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343767 ?auto_343768 ) ( ON-TABLE ?auto_343762 ) ( ON ?auto_343763 ?auto_343762 ) ( ON ?auto_343764 ?auto_343763 ) ( ON ?auto_343765 ?auto_343764 ) ( not ( = ?auto_343762 ?auto_343763 ) ) ( not ( = ?auto_343762 ?auto_343764 ) ) ( not ( = ?auto_343762 ?auto_343765 ) ) ( not ( = ?auto_343762 ?auto_343766 ) ) ( not ( = ?auto_343762 ?auto_343767 ) ) ( not ( = ?auto_343762 ?auto_343768 ) ) ( not ( = ?auto_343763 ?auto_343764 ) ) ( not ( = ?auto_343763 ?auto_343765 ) ) ( not ( = ?auto_343763 ?auto_343766 ) ) ( not ( = ?auto_343763 ?auto_343767 ) ) ( not ( = ?auto_343763 ?auto_343768 ) ) ( not ( = ?auto_343764 ?auto_343765 ) ) ( not ( = ?auto_343764 ?auto_343766 ) ) ( not ( = ?auto_343764 ?auto_343767 ) ) ( not ( = ?auto_343764 ?auto_343768 ) ) ( not ( = ?auto_343765 ?auto_343766 ) ) ( not ( = ?auto_343765 ?auto_343767 ) ) ( not ( = ?auto_343765 ?auto_343768 ) ) ( not ( = ?auto_343766 ?auto_343767 ) ) ( not ( = ?auto_343766 ?auto_343768 ) ) ( not ( = ?auto_343767 ?auto_343768 ) ) ( CLEAR ?auto_343765 ) ( ON ?auto_343766 ?auto_343767 ) ( CLEAR ?auto_343766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_343762 ?auto_343763 ?auto_343764 ?auto_343765 ?auto_343766 )
      ( MAKE-6PILE ?auto_343762 ?auto_343763 ?auto_343764 ?auto_343765 ?auto_343766 ?auto_343767 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_343775 - BLOCK
      ?auto_343776 - BLOCK
      ?auto_343777 - BLOCK
      ?auto_343778 - BLOCK
      ?auto_343779 - BLOCK
      ?auto_343780 - BLOCK
    )
    :vars
    (
      ?auto_343781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343780 ?auto_343781 ) ( ON-TABLE ?auto_343775 ) ( ON ?auto_343776 ?auto_343775 ) ( ON ?auto_343777 ?auto_343776 ) ( ON ?auto_343778 ?auto_343777 ) ( not ( = ?auto_343775 ?auto_343776 ) ) ( not ( = ?auto_343775 ?auto_343777 ) ) ( not ( = ?auto_343775 ?auto_343778 ) ) ( not ( = ?auto_343775 ?auto_343779 ) ) ( not ( = ?auto_343775 ?auto_343780 ) ) ( not ( = ?auto_343775 ?auto_343781 ) ) ( not ( = ?auto_343776 ?auto_343777 ) ) ( not ( = ?auto_343776 ?auto_343778 ) ) ( not ( = ?auto_343776 ?auto_343779 ) ) ( not ( = ?auto_343776 ?auto_343780 ) ) ( not ( = ?auto_343776 ?auto_343781 ) ) ( not ( = ?auto_343777 ?auto_343778 ) ) ( not ( = ?auto_343777 ?auto_343779 ) ) ( not ( = ?auto_343777 ?auto_343780 ) ) ( not ( = ?auto_343777 ?auto_343781 ) ) ( not ( = ?auto_343778 ?auto_343779 ) ) ( not ( = ?auto_343778 ?auto_343780 ) ) ( not ( = ?auto_343778 ?auto_343781 ) ) ( not ( = ?auto_343779 ?auto_343780 ) ) ( not ( = ?auto_343779 ?auto_343781 ) ) ( not ( = ?auto_343780 ?auto_343781 ) ) ( CLEAR ?auto_343778 ) ( ON ?auto_343779 ?auto_343780 ) ( CLEAR ?auto_343779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_343775 ?auto_343776 ?auto_343777 ?auto_343778 ?auto_343779 )
      ( MAKE-6PILE ?auto_343775 ?auto_343776 ?auto_343777 ?auto_343778 ?auto_343779 ?auto_343780 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_343788 - BLOCK
      ?auto_343789 - BLOCK
      ?auto_343790 - BLOCK
      ?auto_343791 - BLOCK
      ?auto_343792 - BLOCK
      ?auto_343793 - BLOCK
    )
    :vars
    (
      ?auto_343794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343793 ?auto_343794 ) ( ON-TABLE ?auto_343788 ) ( ON ?auto_343789 ?auto_343788 ) ( ON ?auto_343790 ?auto_343789 ) ( not ( = ?auto_343788 ?auto_343789 ) ) ( not ( = ?auto_343788 ?auto_343790 ) ) ( not ( = ?auto_343788 ?auto_343791 ) ) ( not ( = ?auto_343788 ?auto_343792 ) ) ( not ( = ?auto_343788 ?auto_343793 ) ) ( not ( = ?auto_343788 ?auto_343794 ) ) ( not ( = ?auto_343789 ?auto_343790 ) ) ( not ( = ?auto_343789 ?auto_343791 ) ) ( not ( = ?auto_343789 ?auto_343792 ) ) ( not ( = ?auto_343789 ?auto_343793 ) ) ( not ( = ?auto_343789 ?auto_343794 ) ) ( not ( = ?auto_343790 ?auto_343791 ) ) ( not ( = ?auto_343790 ?auto_343792 ) ) ( not ( = ?auto_343790 ?auto_343793 ) ) ( not ( = ?auto_343790 ?auto_343794 ) ) ( not ( = ?auto_343791 ?auto_343792 ) ) ( not ( = ?auto_343791 ?auto_343793 ) ) ( not ( = ?auto_343791 ?auto_343794 ) ) ( not ( = ?auto_343792 ?auto_343793 ) ) ( not ( = ?auto_343792 ?auto_343794 ) ) ( not ( = ?auto_343793 ?auto_343794 ) ) ( ON ?auto_343792 ?auto_343793 ) ( CLEAR ?auto_343790 ) ( ON ?auto_343791 ?auto_343792 ) ( CLEAR ?auto_343791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_343788 ?auto_343789 ?auto_343790 ?auto_343791 )
      ( MAKE-6PILE ?auto_343788 ?auto_343789 ?auto_343790 ?auto_343791 ?auto_343792 ?auto_343793 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_343801 - BLOCK
      ?auto_343802 - BLOCK
      ?auto_343803 - BLOCK
      ?auto_343804 - BLOCK
      ?auto_343805 - BLOCK
      ?auto_343806 - BLOCK
    )
    :vars
    (
      ?auto_343807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343806 ?auto_343807 ) ( ON-TABLE ?auto_343801 ) ( ON ?auto_343802 ?auto_343801 ) ( ON ?auto_343803 ?auto_343802 ) ( not ( = ?auto_343801 ?auto_343802 ) ) ( not ( = ?auto_343801 ?auto_343803 ) ) ( not ( = ?auto_343801 ?auto_343804 ) ) ( not ( = ?auto_343801 ?auto_343805 ) ) ( not ( = ?auto_343801 ?auto_343806 ) ) ( not ( = ?auto_343801 ?auto_343807 ) ) ( not ( = ?auto_343802 ?auto_343803 ) ) ( not ( = ?auto_343802 ?auto_343804 ) ) ( not ( = ?auto_343802 ?auto_343805 ) ) ( not ( = ?auto_343802 ?auto_343806 ) ) ( not ( = ?auto_343802 ?auto_343807 ) ) ( not ( = ?auto_343803 ?auto_343804 ) ) ( not ( = ?auto_343803 ?auto_343805 ) ) ( not ( = ?auto_343803 ?auto_343806 ) ) ( not ( = ?auto_343803 ?auto_343807 ) ) ( not ( = ?auto_343804 ?auto_343805 ) ) ( not ( = ?auto_343804 ?auto_343806 ) ) ( not ( = ?auto_343804 ?auto_343807 ) ) ( not ( = ?auto_343805 ?auto_343806 ) ) ( not ( = ?auto_343805 ?auto_343807 ) ) ( not ( = ?auto_343806 ?auto_343807 ) ) ( ON ?auto_343805 ?auto_343806 ) ( CLEAR ?auto_343803 ) ( ON ?auto_343804 ?auto_343805 ) ( CLEAR ?auto_343804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_343801 ?auto_343802 ?auto_343803 ?auto_343804 )
      ( MAKE-6PILE ?auto_343801 ?auto_343802 ?auto_343803 ?auto_343804 ?auto_343805 ?auto_343806 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_343814 - BLOCK
      ?auto_343815 - BLOCK
      ?auto_343816 - BLOCK
      ?auto_343817 - BLOCK
      ?auto_343818 - BLOCK
      ?auto_343819 - BLOCK
    )
    :vars
    (
      ?auto_343820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343819 ?auto_343820 ) ( ON-TABLE ?auto_343814 ) ( ON ?auto_343815 ?auto_343814 ) ( not ( = ?auto_343814 ?auto_343815 ) ) ( not ( = ?auto_343814 ?auto_343816 ) ) ( not ( = ?auto_343814 ?auto_343817 ) ) ( not ( = ?auto_343814 ?auto_343818 ) ) ( not ( = ?auto_343814 ?auto_343819 ) ) ( not ( = ?auto_343814 ?auto_343820 ) ) ( not ( = ?auto_343815 ?auto_343816 ) ) ( not ( = ?auto_343815 ?auto_343817 ) ) ( not ( = ?auto_343815 ?auto_343818 ) ) ( not ( = ?auto_343815 ?auto_343819 ) ) ( not ( = ?auto_343815 ?auto_343820 ) ) ( not ( = ?auto_343816 ?auto_343817 ) ) ( not ( = ?auto_343816 ?auto_343818 ) ) ( not ( = ?auto_343816 ?auto_343819 ) ) ( not ( = ?auto_343816 ?auto_343820 ) ) ( not ( = ?auto_343817 ?auto_343818 ) ) ( not ( = ?auto_343817 ?auto_343819 ) ) ( not ( = ?auto_343817 ?auto_343820 ) ) ( not ( = ?auto_343818 ?auto_343819 ) ) ( not ( = ?auto_343818 ?auto_343820 ) ) ( not ( = ?auto_343819 ?auto_343820 ) ) ( ON ?auto_343818 ?auto_343819 ) ( ON ?auto_343817 ?auto_343818 ) ( CLEAR ?auto_343815 ) ( ON ?auto_343816 ?auto_343817 ) ( CLEAR ?auto_343816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_343814 ?auto_343815 ?auto_343816 )
      ( MAKE-6PILE ?auto_343814 ?auto_343815 ?auto_343816 ?auto_343817 ?auto_343818 ?auto_343819 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_343827 - BLOCK
      ?auto_343828 - BLOCK
      ?auto_343829 - BLOCK
      ?auto_343830 - BLOCK
      ?auto_343831 - BLOCK
      ?auto_343832 - BLOCK
    )
    :vars
    (
      ?auto_343833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343832 ?auto_343833 ) ( ON-TABLE ?auto_343827 ) ( ON ?auto_343828 ?auto_343827 ) ( not ( = ?auto_343827 ?auto_343828 ) ) ( not ( = ?auto_343827 ?auto_343829 ) ) ( not ( = ?auto_343827 ?auto_343830 ) ) ( not ( = ?auto_343827 ?auto_343831 ) ) ( not ( = ?auto_343827 ?auto_343832 ) ) ( not ( = ?auto_343827 ?auto_343833 ) ) ( not ( = ?auto_343828 ?auto_343829 ) ) ( not ( = ?auto_343828 ?auto_343830 ) ) ( not ( = ?auto_343828 ?auto_343831 ) ) ( not ( = ?auto_343828 ?auto_343832 ) ) ( not ( = ?auto_343828 ?auto_343833 ) ) ( not ( = ?auto_343829 ?auto_343830 ) ) ( not ( = ?auto_343829 ?auto_343831 ) ) ( not ( = ?auto_343829 ?auto_343832 ) ) ( not ( = ?auto_343829 ?auto_343833 ) ) ( not ( = ?auto_343830 ?auto_343831 ) ) ( not ( = ?auto_343830 ?auto_343832 ) ) ( not ( = ?auto_343830 ?auto_343833 ) ) ( not ( = ?auto_343831 ?auto_343832 ) ) ( not ( = ?auto_343831 ?auto_343833 ) ) ( not ( = ?auto_343832 ?auto_343833 ) ) ( ON ?auto_343831 ?auto_343832 ) ( ON ?auto_343830 ?auto_343831 ) ( CLEAR ?auto_343828 ) ( ON ?auto_343829 ?auto_343830 ) ( CLEAR ?auto_343829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_343827 ?auto_343828 ?auto_343829 )
      ( MAKE-6PILE ?auto_343827 ?auto_343828 ?auto_343829 ?auto_343830 ?auto_343831 ?auto_343832 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_343840 - BLOCK
      ?auto_343841 - BLOCK
      ?auto_343842 - BLOCK
      ?auto_343843 - BLOCK
      ?auto_343844 - BLOCK
      ?auto_343845 - BLOCK
    )
    :vars
    (
      ?auto_343846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343845 ?auto_343846 ) ( ON-TABLE ?auto_343840 ) ( not ( = ?auto_343840 ?auto_343841 ) ) ( not ( = ?auto_343840 ?auto_343842 ) ) ( not ( = ?auto_343840 ?auto_343843 ) ) ( not ( = ?auto_343840 ?auto_343844 ) ) ( not ( = ?auto_343840 ?auto_343845 ) ) ( not ( = ?auto_343840 ?auto_343846 ) ) ( not ( = ?auto_343841 ?auto_343842 ) ) ( not ( = ?auto_343841 ?auto_343843 ) ) ( not ( = ?auto_343841 ?auto_343844 ) ) ( not ( = ?auto_343841 ?auto_343845 ) ) ( not ( = ?auto_343841 ?auto_343846 ) ) ( not ( = ?auto_343842 ?auto_343843 ) ) ( not ( = ?auto_343842 ?auto_343844 ) ) ( not ( = ?auto_343842 ?auto_343845 ) ) ( not ( = ?auto_343842 ?auto_343846 ) ) ( not ( = ?auto_343843 ?auto_343844 ) ) ( not ( = ?auto_343843 ?auto_343845 ) ) ( not ( = ?auto_343843 ?auto_343846 ) ) ( not ( = ?auto_343844 ?auto_343845 ) ) ( not ( = ?auto_343844 ?auto_343846 ) ) ( not ( = ?auto_343845 ?auto_343846 ) ) ( ON ?auto_343844 ?auto_343845 ) ( ON ?auto_343843 ?auto_343844 ) ( ON ?auto_343842 ?auto_343843 ) ( CLEAR ?auto_343840 ) ( ON ?auto_343841 ?auto_343842 ) ( CLEAR ?auto_343841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_343840 ?auto_343841 )
      ( MAKE-6PILE ?auto_343840 ?auto_343841 ?auto_343842 ?auto_343843 ?auto_343844 ?auto_343845 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_343853 - BLOCK
      ?auto_343854 - BLOCK
      ?auto_343855 - BLOCK
      ?auto_343856 - BLOCK
      ?auto_343857 - BLOCK
      ?auto_343858 - BLOCK
    )
    :vars
    (
      ?auto_343859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343858 ?auto_343859 ) ( ON-TABLE ?auto_343853 ) ( not ( = ?auto_343853 ?auto_343854 ) ) ( not ( = ?auto_343853 ?auto_343855 ) ) ( not ( = ?auto_343853 ?auto_343856 ) ) ( not ( = ?auto_343853 ?auto_343857 ) ) ( not ( = ?auto_343853 ?auto_343858 ) ) ( not ( = ?auto_343853 ?auto_343859 ) ) ( not ( = ?auto_343854 ?auto_343855 ) ) ( not ( = ?auto_343854 ?auto_343856 ) ) ( not ( = ?auto_343854 ?auto_343857 ) ) ( not ( = ?auto_343854 ?auto_343858 ) ) ( not ( = ?auto_343854 ?auto_343859 ) ) ( not ( = ?auto_343855 ?auto_343856 ) ) ( not ( = ?auto_343855 ?auto_343857 ) ) ( not ( = ?auto_343855 ?auto_343858 ) ) ( not ( = ?auto_343855 ?auto_343859 ) ) ( not ( = ?auto_343856 ?auto_343857 ) ) ( not ( = ?auto_343856 ?auto_343858 ) ) ( not ( = ?auto_343856 ?auto_343859 ) ) ( not ( = ?auto_343857 ?auto_343858 ) ) ( not ( = ?auto_343857 ?auto_343859 ) ) ( not ( = ?auto_343858 ?auto_343859 ) ) ( ON ?auto_343857 ?auto_343858 ) ( ON ?auto_343856 ?auto_343857 ) ( ON ?auto_343855 ?auto_343856 ) ( CLEAR ?auto_343853 ) ( ON ?auto_343854 ?auto_343855 ) ( CLEAR ?auto_343854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_343853 ?auto_343854 )
      ( MAKE-6PILE ?auto_343853 ?auto_343854 ?auto_343855 ?auto_343856 ?auto_343857 ?auto_343858 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_343866 - BLOCK
      ?auto_343867 - BLOCK
      ?auto_343868 - BLOCK
      ?auto_343869 - BLOCK
      ?auto_343870 - BLOCK
      ?auto_343871 - BLOCK
    )
    :vars
    (
      ?auto_343872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343871 ?auto_343872 ) ( not ( = ?auto_343866 ?auto_343867 ) ) ( not ( = ?auto_343866 ?auto_343868 ) ) ( not ( = ?auto_343866 ?auto_343869 ) ) ( not ( = ?auto_343866 ?auto_343870 ) ) ( not ( = ?auto_343866 ?auto_343871 ) ) ( not ( = ?auto_343866 ?auto_343872 ) ) ( not ( = ?auto_343867 ?auto_343868 ) ) ( not ( = ?auto_343867 ?auto_343869 ) ) ( not ( = ?auto_343867 ?auto_343870 ) ) ( not ( = ?auto_343867 ?auto_343871 ) ) ( not ( = ?auto_343867 ?auto_343872 ) ) ( not ( = ?auto_343868 ?auto_343869 ) ) ( not ( = ?auto_343868 ?auto_343870 ) ) ( not ( = ?auto_343868 ?auto_343871 ) ) ( not ( = ?auto_343868 ?auto_343872 ) ) ( not ( = ?auto_343869 ?auto_343870 ) ) ( not ( = ?auto_343869 ?auto_343871 ) ) ( not ( = ?auto_343869 ?auto_343872 ) ) ( not ( = ?auto_343870 ?auto_343871 ) ) ( not ( = ?auto_343870 ?auto_343872 ) ) ( not ( = ?auto_343871 ?auto_343872 ) ) ( ON ?auto_343870 ?auto_343871 ) ( ON ?auto_343869 ?auto_343870 ) ( ON ?auto_343868 ?auto_343869 ) ( ON ?auto_343867 ?auto_343868 ) ( ON ?auto_343866 ?auto_343867 ) ( CLEAR ?auto_343866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_343866 )
      ( MAKE-6PILE ?auto_343866 ?auto_343867 ?auto_343868 ?auto_343869 ?auto_343870 ?auto_343871 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_343879 - BLOCK
      ?auto_343880 - BLOCK
      ?auto_343881 - BLOCK
      ?auto_343882 - BLOCK
      ?auto_343883 - BLOCK
      ?auto_343884 - BLOCK
    )
    :vars
    (
      ?auto_343885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343884 ?auto_343885 ) ( not ( = ?auto_343879 ?auto_343880 ) ) ( not ( = ?auto_343879 ?auto_343881 ) ) ( not ( = ?auto_343879 ?auto_343882 ) ) ( not ( = ?auto_343879 ?auto_343883 ) ) ( not ( = ?auto_343879 ?auto_343884 ) ) ( not ( = ?auto_343879 ?auto_343885 ) ) ( not ( = ?auto_343880 ?auto_343881 ) ) ( not ( = ?auto_343880 ?auto_343882 ) ) ( not ( = ?auto_343880 ?auto_343883 ) ) ( not ( = ?auto_343880 ?auto_343884 ) ) ( not ( = ?auto_343880 ?auto_343885 ) ) ( not ( = ?auto_343881 ?auto_343882 ) ) ( not ( = ?auto_343881 ?auto_343883 ) ) ( not ( = ?auto_343881 ?auto_343884 ) ) ( not ( = ?auto_343881 ?auto_343885 ) ) ( not ( = ?auto_343882 ?auto_343883 ) ) ( not ( = ?auto_343882 ?auto_343884 ) ) ( not ( = ?auto_343882 ?auto_343885 ) ) ( not ( = ?auto_343883 ?auto_343884 ) ) ( not ( = ?auto_343883 ?auto_343885 ) ) ( not ( = ?auto_343884 ?auto_343885 ) ) ( ON ?auto_343883 ?auto_343884 ) ( ON ?auto_343882 ?auto_343883 ) ( ON ?auto_343881 ?auto_343882 ) ( ON ?auto_343880 ?auto_343881 ) ( ON ?auto_343879 ?auto_343880 ) ( CLEAR ?auto_343879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_343879 )
      ( MAKE-6PILE ?auto_343879 ?auto_343880 ?auto_343881 ?auto_343882 ?auto_343883 ?auto_343884 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_343893 - BLOCK
      ?auto_343894 - BLOCK
      ?auto_343895 - BLOCK
      ?auto_343896 - BLOCK
      ?auto_343897 - BLOCK
      ?auto_343898 - BLOCK
      ?auto_343899 - BLOCK
    )
    :vars
    (
      ?auto_343900 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_343898 ) ( ON ?auto_343899 ?auto_343900 ) ( CLEAR ?auto_343899 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_343893 ) ( ON ?auto_343894 ?auto_343893 ) ( ON ?auto_343895 ?auto_343894 ) ( ON ?auto_343896 ?auto_343895 ) ( ON ?auto_343897 ?auto_343896 ) ( ON ?auto_343898 ?auto_343897 ) ( not ( = ?auto_343893 ?auto_343894 ) ) ( not ( = ?auto_343893 ?auto_343895 ) ) ( not ( = ?auto_343893 ?auto_343896 ) ) ( not ( = ?auto_343893 ?auto_343897 ) ) ( not ( = ?auto_343893 ?auto_343898 ) ) ( not ( = ?auto_343893 ?auto_343899 ) ) ( not ( = ?auto_343893 ?auto_343900 ) ) ( not ( = ?auto_343894 ?auto_343895 ) ) ( not ( = ?auto_343894 ?auto_343896 ) ) ( not ( = ?auto_343894 ?auto_343897 ) ) ( not ( = ?auto_343894 ?auto_343898 ) ) ( not ( = ?auto_343894 ?auto_343899 ) ) ( not ( = ?auto_343894 ?auto_343900 ) ) ( not ( = ?auto_343895 ?auto_343896 ) ) ( not ( = ?auto_343895 ?auto_343897 ) ) ( not ( = ?auto_343895 ?auto_343898 ) ) ( not ( = ?auto_343895 ?auto_343899 ) ) ( not ( = ?auto_343895 ?auto_343900 ) ) ( not ( = ?auto_343896 ?auto_343897 ) ) ( not ( = ?auto_343896 ?auto_343898 ) ) ( not ( = ?auto_343896 ?auto_343899 ) ) ( not ( = ?auto_343896 ?auto_343900 ) ) ( not ( = ?auto_343897 ?auto_343898 ) ) ( not ( = ?auto_343897 ?auto_343899 ) ) ( not ( = ?auto_343897 ?auto_343900 ) ) ( not ( = ?auto_343898 ?auto_343899 ) ) ( not ( = ?auto_343898 ?auto_343900 ) ) ( not ( = ?auto_343899 ?auto_343900 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_343899 ?auto_343900 )
      ( !STACK ?auto_343899 ?auto_343898 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_343908 - BLOCK
      ?auto_343909 - BLOCK
      ?auto_343910 - BLOCK
      ?auto_343911 - BLOCK
      ?auto_343912 - BLOCK
      ?auto_343913 - BLOCK
      ?auto_343914 - BLOCK
    )
    :vars
    (
      ?auto_343915 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_343913 ) ( ON ?auto_343914 ?auto_343915 ) ( CLEAR ?auto_343914 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_343908 ) ( ON ?auto_343909 ?auto_343908 ) ( ON ?auto_343910 ?auto_343909 ) ( ON ?auto_343911 ?auto_343910 ) ( ON ?auto_343912 ?auto_343911 ) ( ON ?auto_343913 ?auto_343912 ) ( not ( = ?auto_343908 ?auto_343909 ) ) ( not ( = ?auto_343908 ?auto_343910 ) ) ( not ( = ?auto_343908 ?auto_343911 ) ) ( not ( = ?auto_343908 ?auto_343912 ) ) ( not ( = ?auto_343908 ?auto_343913 ) ) ( not ( = ?auto_343908 ?auto_343914 ) ) ( not ( = ?auto_343908 ?auto_343915 ) ) ( not ( = ?auto_343909 ?auto_343910 ) ) ( not ( = ?auto_343909 ?auto_343911 ) ) ( not ( = ?auto_343909 ?auto_343912 ) ) ( not ( = ?auto_343909 ?auto_343913 ) ) ( not ( = ?auto_343909 ?auto_343914 ) ) ( not ( = ?auto_343909 ?auto_343915 ) ) ( not ( = ?auto_343910 ?auto_343911 ) ) ( not ( = ?auto_343910 ?auto_343912 ) ) ( not ( = ?auto_343910 ?auto_343913 ) ) ( not ( = ?auto_343910 ?auto_343914 ) ) ( not ( = ?auto_343910 ?auto_343915 ) ) ( not ( = ?auto_343911 ?auto_343912 ) ) ( not ( = ?auto_343911 ?auto_343913 ) ) ( not ( = ?auto_343911 ?auto_343914 ) ) ( not ( = ?auto_343911 ?auto_343915 ) ) ( not ( = ?auto_343912 ?auto_343913 ) ) ( not ( = ?auto_343912 ?auto_343914 ) ) ( not ( = ?auto_343912 ?auto_343915 ) ) ( not ( = ?auto_343913 ?auto_343914 ) ) ( not ( = ?auto_343913 ?auto_343915 ) ) ( not ( = ?auto_343914 ?auto_343915 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_343914 ?auto_343915 )
      ( !STACK ?auto_343914 ?auto_343913 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_343923 - BLOCK
      ?auto_343924 - BLOCK
      ?auto_343925 - BLOCK
      ?auto_343926 - BLOCK
      ?auto_343927 - BLOCK
      ?auto_343928 - BLOCK
      ?auto_343929 - BLOCK
    )
    :vars
    (
      ?auto_343930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343929 ?auto_343930 ) ( ON-TABLE ?auto_343923 ) ( ON ?auto_343924 ?auto_343923 ) ( ON ?auto_343925 ?auto_343924 ) ( ON ?auto_343926 ?auto_343925 ) ( ON ?auto_343927 ?auto_343926 ) ( not ( = ?auto_343923 ?auto_343924 ) ) ( not ( = ?auto_343923 ?auto_343925 ) ) ( not ( = ?auto_343923 ?auto_343926 ) ) ( not ( = ?auto_343923 ?auto_343927 ) ) ( not ( = ?auto_343923 ?auto_343928 ) ) ( not ( = ?auto_343923 ?auto_343929 ) ) ( not ( = ?auto_343923 ?auto_343930 ) ) ( not ( = ?auto_343924 ?auto_343925 ) ) ( not ( = ?auto_343924 ?auto_343926 ) ) ( not ( = ?auto_343924 ?auto_343927 ) ) ( not ( = ?auto_343924 ?auto_343928 ) ) ( not ( = ?auto_343924 ?auto_343929 ) ) ( not ( = ?auto_343924 ?auto_343930 ) ) ( not ( = ?auto_343925 ?auto_343926 ) ) ( not ( = ?auto_343925 ?auto_343927 ) ) ( not ( = ?auto_343925 ?auto_343928 ) ) ( not ( = ?auto_343925 ?auto_343929 ) ) ( not ( = ?auto_343925 ?auto_343930 ) ) ( not ( = ?auto_343926 ?auto_343927 ) ) ( not ( = ?auto_343926 ?auto_343928 ) ) ( not ( = ?auto_343926 ?auto_343929 ) ) ( not ( = ?auto_343926 ?auto_343930 ) ) ( not ( = ?auto_343927 ?auto_343928 ) ) ( not ( = ?auto_343927 ?auto_343929 ) ) ( not ( = ?auto_343927 ?auto_343930 ) ) ( not ( = ?auto_343928 ?auto_343929 ) ) ( not ( = ?auto_343928 ?auto_343930 ) ) ( not ( = ?auto_343929 ?auto_343930 ) ) ( CLEAR ?auto_343927 ) ( ON ?auto_343928 ?auto_343929 ) ( CLEAR ?auto_343928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_343923 ?auto_343924 ?auto_343925 ?auto_343926 ?auto_343927 ?auto_343928 )
      ( MAKE-7PILE ?auto_343923 ?auto_343924 ?auto_343925 ?auto_343926 ?auto_343927 ?auto_343928 ?auto_343929 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_343938 - BLOCK
      ?auto_343939 - BLOCK
      ?auto_343940 - BLOCK
      ?auto_343941 - BLOCK
      ?auto_343942 - BLOCK
      ?auto_343943 - BLOCK
      ?auto_343944 - BLOCK
    )
    :vars
    (
      ?auto_343945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343944 ?auto_343945 ) ( ON-TABLE ?auto_343938 ) ( ON ?auto_343939 ?auto_343938 ) ( ON ?auto_343940 ?auto_343939 ) ( ON ?auto_343941 ?auto_343940 ) ( ON ?auto_343942 ?auto_343941 ) ( not ( = ?auto_343938 ?auto_343939 ) ) ( not ( = ?auto_343938 ?auto_343940 ) ) ( not ( = ?auto_343938 ?auto_343941 ) ) ( not ( = ?auto_343938 ?auto_343942 ) ) ( not ( = ?auto_343938 ?auto_343943 ) ) ( not ( = ?auto_343938 ?auto_343944 ) ) ( not ( = ?auto_343938 ?auto_343945 ) ) ( not ( = ?auto_343939 ?auto_343940 ) ) ( not ( = ?auto_343939 ?auto_343941 ) ) ( not ( = ?auto_343939 ?auto_343942 ) ) ( not ( = ?auto_343939 ?auto_343943 ) ) ( not ( = ?auto_343939 ?auto_343944 ) ) ( not ( = ?auto_343939 ?auto_343945 ) ) ( not ( = ?auto_343940 ?auto_343941 ) ) ( not ( = ?auto_343940 ?auto_343942 ) ) ( not ( = ?auto_343940 ?auto_343943 ) ) ( not ( = ?auto_343940 ?auto_343944 ) ) ( not ( = ?auto_343940 ?auto_343945 ) ) ( not ( = ?auto_343941 ?auto_343942 ) ) ( not ( = ?auto_343941 ?auto_343943 ) ) ( not ( = ?auto_343941 ?auto_343944 ) ) ( not ( = ?auto_343941 ?auto_343945 ) ) ( not ( = ?auto_343942 ?auto_343943 ) ) ( not ( = ?auto_343942 ?auto_343944 ) ) ( not ( = ?auto_343942 ?auto_343945 ) ) ( not ( = ?auto_343943 ?auto_343944 ) ) ( not ( = ?auto_343943 ?auto_343945 ) ) ( not ( = ?auto_343944 ?auto_343945 ) ) ( CLEAR ?auto_343942 ) ( ON ?auto_343943 ?auto_343944 ) ( CLEAR ?auto_343943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_343938 ?auto_343939 ?auto_343940 ?auto_343941 ?auto_343942 ?auto_343943 )
      ( MAKE-7PILE ?auto_343938 ?auto_343939 ?auto_343940 ?auto_343941 ?auto_343942 ?auto_343943 ?auto_343944 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_343953 - BLOCK
      ?auto_343954 - BLOCK
      ?auto_343955 - BLOCK
      ?auto_343956 - BLOCK
      ?auto_343957 - BLOCK
      ?auto_343958 - BLOCK
      ?auto_343959 - BLOCK
    )
    :vars
    (
      ?auto_343960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343959 ?auto_343960 ) ( ON-TABLE ?auto_343953 ) ( ON ?auto_343954 ?auto_343953 ) ( ON ?auto_343955 ?auto_343954 ) ( ON ?auto_343956 ?auto_343955 ) ( not ( = ?auto_343953 ?auto_343954 ) ) ( not ( = ?auto_343953 ?auto_343955 ) ) ( not ( = ?auto_343953 ?auto_343956 ) ) ( not ( = ?auto_343953 ?auto_343957 ) ) ( not ( = ?auto_343953 ?auto_343958 ) ) ( not ( = ?auto_343953 ?auto_343959 ) ) ( not ( = ?auto_343953 ?auto_343960 ) ) ( not ( = ?auto_343954 ?auto_343955 ) ) ( not ( = ?auto_343954 ?auto_343956 ) ) ( not ( = ?auto_343954 ?auto_343957 ) ) ( not ( = ?auto_343954 ?auto_343958 ) ) ( not ( = ?auto_343954 ?auto_343959 ) ) ( not ( = ?auto_343954 ?auto_343960 ) ) ( not ( = ?auto_343955 ?auto_343956 ) ) ( not ( = ?auto_343955 ?auto_343957 ) ) ( not ( = ?auto_343955 ?auto_343958 ) ) ( not ( = ?auto_343955 ?auto_343959 ) ) ( not ( = ?auto_343955 ?auto_343960 ) ) ( not ( = ?auto_343956 ?auto_343957 ) ) ( not ( = ?auto_343956 ?auto_343958 ) ) ( not ( = ?auto_343956 ?auto_343959 ) ) ( not ( = ?auto_343956 ?auto_343960 ) ) ( not ( = ?auto_343957 ?auto_343958 ) ) ( not ( = ?auto_343957 ?auto_343959 ) ) ( not ( = ?auto_343957 ?auto_343960 ) ) ( not ( = ?auto_343958 ?auto_343959 ) ) ( not ( = ?auto_343958 ?auto_343960 ) ) ( not ( = ?auto_343959 ?auto_343960 ) ) ( ON ?auto_343958 ?auto_343959 ) ( CLEAR ?auto_343956 ) ( ON ?auto_343957 ?auto_343958 ) ( CLEAR ?auto_343957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_343953 ?auto_343954 ?auto_343955 ?auto_343956 ?auto_343957 )
      ( MAKE-7PILE ?auto_343953 ?auto_343954 ?auto_343955 ?auto_343956 ?auto_343957 ?auto_343958 ?auto_343959 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_343968 - BLOCK
      ?auto_343969 - BLOCK
      ?auto_343970 - BLOCK
      ?auto_343971 - BLOCK
      ?auto_343972 - BLOCK
      ?auto_343973 - BLOCK
      ?auto_343974 - BLOCK
    )
    :vars
    (
      ?auto_343975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343974 ?auto_343975 ) ( ON-TABLE ?auto_343968 ) ( ON ?auto_343969 ?auto_343968 ) ( ON ?auto_343970 ?auto_343969 ) ( ON ?auto_343971 ?auto_343970 ) ( not ( = ?auto_343968 ?auto_343969 ) ) ( not ( = ?auto_343968 ?auto_343970 ) ) ( not ( = ?auto_343968 ?auto_343971 ) ) ( not ( = ?auto_343968 ?auto_343972 ) ) ( not ( = ?auto_343968 ?auto_343973 ) ) ( not ( = ?auto_343968 ?auto_343974 ) ) ( not ( = ?auto_343968 ?auto_343975 ) ) ( not ( = ?auto_343969 ?auto_343970 ) ) ( not ( = ?auto_343969 ?auto_343971 ) ) ( not ( = ?auto_343969 ?auto_343972 ) ) ( not ( = ?auto_343969 ?auto_343973 ) ) ( not ( = ?auto_343969 ?auto_343974 ) ) ( not ( = ?auto_343969 ?auto_343975 ) ) ( not ( = ?auto_343970 ?auto_343971 ) ) ( not ( = ?auto_343970 ?auto_343972 ) ) ( not ( = ?auto_343970 ?auto_343973 ) ) ( not ( = ?auto_343970 ?auto_343974 ) ) ( not ( = ?auto_343970 ?auto_343975 ) ) ( not ( = ?auto_343971 ?auto_343972 ) ) ( not ( = ?auto_343971 ?auto_343973 ) ) ( not ( = ?auto_343971 ?auto_343974 ) ) ( not ( = ?auto_343971 ?auto_343975 ) ) ( not ( = ?auto_343972 ?auto_343973 ) ) ( not ( = ?auto_343972 ?auto_343974 ) ) ( not ( = ?auto_343972 ?auto_343975 ) ) ( not ( = ?auto_343973 ?auto_343974 ) ) ( not ( = ?auto_343973 ?auto_343975 ) ) ( not ( = ?auto_343974 ?auto_343975 ) ) ( ON ?auto_343973 ?auto_343974 ) ( CLEAR ?auto_343971 ) ( ON ?auto_343972 ?auto_343973 ) ( CLEAR ?auto_343972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_343968 ?auto_343969 ?auto_343970 ?auto_343971 ?auto_343972 )
      ( MAKE-7PILE ?auto_343968 ?auto_343969 ?auto_343970 ?auto_343971 ?auto_343972 ?auto_343973 ?auto_343974 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_343983 - BLOCK
      ?auto_343984 - BLOCK
      ?auto_343985 - BLOCK
      ?auto_343986 - BLOCK
      ?auto_343987 - BLOCK
      ?auto_343988 - BLOCK
      ?auto_343989 - BLOCK
    )
    :vars
    (
      ?auto_343990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343989 ?auto_343990 ) ( ON-TABLE ?auto_343983 ) ( ON ?auto_343984 ?auto_343983 ) ( ON ?auto_343985 ?auto_343984 ) ( not ( = ?auto_343983 ?auto_343984 ) ) ( not ( = ?auto_343983 ?auto_343985 ) ) ( not ( = ?auto_343983 ?auto_343986 ) ) ( not ( = ?auto_343983 ?auto_343987 ) ) ( not ( = ?auto_343983 ?auto_343988 ) ) ( not ( = ?auto_343983 ?auto_343989 ) ) ( not ( = ?auto_343983 ?auto_343990 ) ) ( not ( = ?auto_343984 ?auto_343985 ) ) ( not ( = ?auto_343984 ?auto_343986 ) ) ( not ( = ?auto_343984 ?auto_343987 ) ) ( not ( = ?auto_343984 ?auto_343988 ) ) ( not ( = ?auto_343984 ?auto_343989 ) ) ( not ( = ?auto_343984 ?auto_343990 ) ) ( not ( = ?auto_343985 ?auto_343986 ) ) ( not ( = ?auto_343985 ?auto_343987 ) ) ( not ( = ?auto_343985 ?auto_343988 ) ) ( not ( = ?auto_343985 ?auto_343989 ) ) ( not ( = ?auto_343985 ?auto_343990 ) ) ( not ( = ?auto_343986 ?auto_343987 ) ) ( not ( = ?auto_343986 ?auto_343988 ) ) ( not ( = ?auto_343986 ?auto_343989 ) ) ( not ( = ?auto_343986 ?auto_343990 ) ) ( not ( = ?auto_343987 ?auto_343988 ) ) ( not ( = ?auto_343987 ?auto_343989 ) ) ( not ( = ?auto_343987 ?auto_343990 ) ) ( not ( = ?auto_343988 ?auto_343989 ) ) ( not ( = ?auto_343988 ?auto_343990 ) ) ( not ( = ?auto_343989 ?auto_343990 ) ) ( ON ?auto_343988 ?auto_343989 ) ( ON ?auto_343987 ?auto_343988 ) ( CLEAR ?auto_343985 ) ( ON ?auto_343986 ?auto_343987 ) ( CLEAR ?auto_343986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_343983 ?auto_343984 ?auto_343985 ?auto_343986 )
      ( MAKE-7PILE ?auto_343983 ?auto_343984 ?auto_343985 ?auto_343986 ?auto_343987 ?auto_343988 ?auto_343989 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_343998 - BLOCK
      ?auto_343999 - BLOCK
      ?auto_344000 - BLOCK
      ?auto_344001 - BLOCK
      ?auto_344002 - BLOCK
      ?auto_344003 - BLOCK
      ?auto_344004 - BLOCK
    )
    :vars
    (
      ?auto_344005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344004 ?auto_344005 ) ( ON-TABLE ?auto_343998 ) ( ON ?auto_343999 ?auto_343998 ) ( ON ?auto_344000 ?auto_343999 ) ( not ( = ?auto_343998 ?auto_343999 ) ) ( not ( = ?auto_343998 ?auto_344000 ) ) ( not ( = ?auto_343998 ?auto_344001 ) ) ( not ( = ?auto_343998 ?auto_344002 ) ) ( not ( = ?auto_343998 ?auto_344003 ) ) ( not ( = ?auto_343998 ?auto_344004 ) ) ( not ( = ?auto_343998 ?auto_344005 ) ) ( not ( = ?auto_343999 ?auto_344000 ) ) ( not ( = ?auto_343999 ?auto_344001 ) ) ( not ( = ?auto_343999 ?auto_344002 ) ) ( not ( = ?auto_343999 ?auto_344003 ) ) ( not ( = ?auto_343999 ?auto_344004 ) ) ( not ( = ?auto_343999 ?auto_344005 ) ) ( not ( = ?auto_344000 ?auto_344001 ) ) ( not ( = ?auto_344000 ?auto_344002 ) ) ( not ( = ?auto_344000 ?auto_344003 ) ) ( not ( = ?auto_344000 ?auto_344004 ) ) ( not ( = ?auto_344000 ?auto_344005 ) ) ( not ( = ?auto_344001 ?auto_344002 ) ) ( not ( = ?auto_344001 ?auto_344003 ) ) ( not ( = ?auto_344001 ?auto_344004 ) ) ( not ( = ?auto_344001 ?auto_344005 ) ) ( not ( = ?auto_344002 ?auto_344003 ) ) ( not ( = ?auto_344002 ?auto_344004 ) ) ( not ( = ?auto_344002 ?auto_344005 ) ) ( not ( = ?auto_344003 ?auto_344004 ) ) ( not ( = ?auto_344003 ?auto_344005 ) ) ( not ( = ?auto_344004 ?auto_344005 ) ) ( ON ?auto_344003 ?auto_344004 ) ( ON ?auto_344002 ?auto_344003 ) ( CLEAR ?auto_344000 ) ( ON ?auto_344001 ?auto_344002 ) ( CLEAR ?auto_344001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_343998 ?auto_343999 ?auto_344000 ?auto_344001 )
      ( MAKE-7PILE ?auto_343998 ?auto_343999 ?auto_344000 ?auto_344001 ?auto_344002 ?auto_344003 ?auto_344004 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_344013 - BLOCK
      ?auto_344014 - BLOCK
      ?auto_344015 - BLOCK
      ?auto_344016 - BLOCK
      ?auto_344017 - BLOCK
      ?auto_344018 - BLOCK
      ?auto_344019 - BLOCK
    )
    :vars
    (
      ?auto_344020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344019 ?auto_344020 ) ( ON-TABLE ?auto_344013 ) ( ON ?auto_344014 ?auto_344013 ) ( not ( = ?auto_344013 ?auto_344014 ) ) ( not ( = ?auto_344013 ?auto_344015 ) ) ( not ( = ?auto_344013 ?auto_344016 ) ) ( not ( = ?auto_344013 ?auto_344017 ) ) ( not ( = ?auto_344013 ?auto_344018 ) ) ( not ( = ?auto_344013 ?auto_344019 ) ) ( not ( = ?auto_344013 ?auto_344020 ) ) ( not ( = ?auto_344014 ?auto_344015 ) ) ( not ( = ?auto_344014 ?auto_344016 ) ) ( not ( = ?auto_344014 ?auto_344017 ) ) ( not ( = ?auto_344014 ?auto_344018 ) ) ( not ( = ?auto_344014 ?auto_344019 ) ) ( not ( = ?auto_344014 ?auto_344020 ) ) ( not ( = ?auto_344015 ?auto_344016 ) ) ( not ( = ?auto_344015 ?auto_344017 ) ) ( not ( = ?auto_344015 ?auto_344018 ) ) ( not ( = ?auto_344015 ?auto_344019 ) ) ( not ( = ?auto_344015 ?auto_344020 ) ) ( not ( = ?auto_344016 ?auto_344017 ) ) ( not ( = ?auto_344016 ?auto_344018 ) ) ( not ( = ?auto_344016 ?auto_344019 ) ) ( not ( = ?auto_344016 ?auto_344020 ) ) ( not ( = ?auto_344017 ?auto_344018 ) ) ( not ( = ?auto_344017 ?auto_344019 ) ) ( not ( = ?auto_344017 ?auto_344020 ) ) ( not ( = ?auto_344018 ?auto_344019 ) ) ( not ( = ?auto_344018 ?auto_344020 ) ) ( not ( = ?auto_344019 ?auto_344020 ) ) ( ON ?auto_344018 ?auto_344019 ) ( ON ?auto_344017 ?auto_344018 ) ( ON ?auto_344016 ?auto_344017 ) ( CLEAR ?auto_344014 ) ( ON ?auto_344015 ?auto_344016 ) ( CLEAR ?auto_344015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_344013 ?auto_344014 ?auto_344015 )
      ( MAKE-7PILE ?auto_344013 ?auto_344014 ?auto_344015 ?auto_344016 ?auto_344017 ?auto_344018 ?auto_344019 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_344028 - BLOCK
      ?auto_344029 - BLOCK
      ?auto_344030 - BLOCK
      ?auto_344031 - BLOCK
      ?auto_344032 - BLOCK
      ?auto_344033 - BLOCK
      ?auto_344034 - BLOCK
    )
    :vars
    (
      ?auto_344035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344034 ?auto_344035 ) ( ON-TABLE ?auto_344028 ) ( ON ?auto_344029 ?auto_344028 ) ( not ( = ?auto_344028 ?auto_344029 ) ) ( not ( = ?auto_344028 ?auto_344030 ) ) ( not ( = ?auto_344028 ?auto_344031 ) ) ( not ( = ?auto_344028 ?auto_344032 ) ) ( not ( = ?auto_344028 ?auto_344033 ) ) ( not ( = ?auto_344028 ?auto_344034 ) ) ( not ( = ?auto_344028 ?auto_344035 ) ) ( not ( = ?auto_344029 ?auto_344030 ) ) ( not ( = ?auto_344029 ?auto_344031 ) ) ( not ( = ?auto_344029 ?auto_344032 ) ) ( not ( = ?auto_344029 ?auto_344033 ) ) ( not ( = ?auto_344029 ?auto_344034 ) ) ( not ( = ?auto_344029 ?auto_344035 ) ) ( not ( = ?auto_344030 ?auto_344031 ) ) ( not ( = ?auto_344030 ?auto_344032 ) ) ( not ( = ?auto_344030 ?auto_344033 ) ) ( not ( = ?auto_344030 ?auto_344034 ) ) ( not ( = ?auto_344030 ?auto_344035 ) ) ( not ( = ?auto_344031 ?auto_344032 ) ) ( not ( = ?auto_344031 ?auto_344033 ) ) ( not ( = ?auto_344031 ?auto_344034 ) ) ( not ( = ?auto_344031 ?auto_344035 ) ) ( not ( = ?auto_344032 ?auto_344033 ) ) ( not ( = ?auto_344032 ?auto_344034 ) ) ( not ( = ?auto_344032 ?auto_344035 ) ) ( not ( = ?auto_344033 ?auto_344034 ) ) ( not ( = ?auto_344033 ?auto_344035 ) ) ( not ( = ?auto_344034 ?auto_344035 ) ) ( ON ?auto_344033 ?auto_344034 ) ( ON ?auto_344032 ?auto_344033 ) ( ON ?auto_344031 ?auto_344032 ) ( CLEAR ?auto_344029 ) ( ON ?auto_344030 ?auto_344031 ) ( CLEAR ?auto_344030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_344028 ?auto_344029 ?auto_344030 )
      ( MAKE-7PILE ?auto_344028 ?auto_344029 ?auto_344030 ?auto_344031 ?auto_344032 ?auto_344033 ?auto_344034 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_344043 - BLOCK
      ?auto_344044 - BLOCK
      ?auto_344045 - BLOCK
      ?auto_344046 - BLOCK
      ?auto_344047 - BLOCK
      ?auto_344048 - BLOCK
      ?auto_344049 - BLOCK
    )
    :vars
    (
      ?auto_344050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344049 ?auto_344050 ) ( ON-TABLE ?auto_344043 ) ( not ( = ?auto_344043 ?auto_344044 ) ) ( not ( = ?auto_344043 ?auto_344045 ) ) ( not ( = ?auto_344043 ?auto_344046 ) ) ( not ( = ?auto_344043 ?auto_344047 ) ) ( not ( = ?auto_344043 ?auto_344048 ) ) ( not ( = ?auto_344043 ?auto_344049 ) ) ( not ( = ?auto_344043 ?auto_344050 ) ) ( not ( = ?auto_344044 ?auto_344045 ) ) ( not ( = ?auto_344044 ?auto_344046 ) ) ( not ( = ?auto_344044 ?auto_344047 ) ) ( not ( = ?auto_344044 ?auto_344048 ) ) ( not ( = ?auto_344044 ?auto_344049 ) ) ( not ( = ?auto_344044 ?auto_344050 ) ) ( not ( = ?auto_344045 ?auto_344046 ) ) ( not ( = ?auto_344045 ?auto_344047 ) ) ( not ( = ?auto_344045 ?auto_344048 ) ) ( not ( = ?auto_344045 ?auto_344049 ) ) ( not ( = ?auto_344045 ?auto_344050 ) ) ( not ( = ?auto_344046 ?auto_344047 ) ) ( not ( = ?auto_344046 ?auto_344048 ) ) ( not ( = ?auto_344046 ?auto_344049 ) ) ( not ( = ?auto_344046 ?auto_344050 ) ) ( not ( = ?auto_344047 ?auto_344048 ) ) ( not ( = ?auto_344047 ?auto_344049 ) ) ( not ( = ?auto_344047 ?auto_344050 ) ) ( not ( = ?auto_344048 ?auto_344049 ) ) ( not ( = ?auto_344048 ?auto_344050 ) ) ( not ( = ?auto_344049 ?auto_344050 ) ) ( ON ?auto_344048 ?auto_344049 ) ( ON ?auto_344047 ?auto_344048 ) ( ON ?auto_344046 ?auto_344047 ) ( ON ?auto_344045 ?auto_344046 ) ( CLEAR ?auto_344043 ) ( ON ?auto_344044 ?auto_344045 ) ( CLEAR ?auto_344044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_344043 ?auto_344044 )
      ( MAKE-7PILE ?auto_344043 ?auto_344044 ?auto_344045 ?auto_344046 ?auto_344047 ?auto_344048 ?auto_344049 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_344058 - BLOCK
      ?auto_344059 - BLOCK
      ?auto_344060 - BLOCK
      ?auto_344061 - BLOCK
      ?auto_344062 - BLOCK
      ?auto_344063 - BLOCK
      ?auto_344064 - BLOCK
    )
    :vars
    (
      ?auto_344065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344064 ?auto_344065 ) ( ON-TABLE ?auto_344058 ) ( not ( = ?auto_344058 ?auto_344059 ) ) ( not ( = ?auto_344058 ?auto_344060 ) ) ( not ( = ?auto_344058 ?auto_344061 ) ) ( not ( = ?auto_344058 ?auto_344062 ) ) ( not ( = ?auto_344058 ?auto_344063 ) ) ( not ( = ?auto_344058 ?auto_344064 ) ) ( not ( = ?auto_344058 ?auto_344065 ) ) ( not ( = ?auto_344059 ?auto_344060 ) ) ( not ( = ?auto_344059 ?auto_344061 ) ) ( not ( = ?auto_344059 ?auto_344062 ) ) ( not ( = ?auto_344059 ?auto_344063 ) ) ( not ( = ?auto_344059 ?auto_344064 ) ) ( not ( = ?auto_344059 ?auto_344065 ) ) ( not ( = ?auto_344060 ?auto_344061 ) ) ( not ( = ?auto_344060 ?auto_344062 ) ) ( not ( = ?auto_344060 ?auto_344063 ) ) ( not ( = ?auto_344060 ?auto_344064 ) ) ( not ( = ?auto_344060 ?auto_344065 ) ) ( not ( = ?auto_344061 ?auto_344062 ) ) ( not ( = ?auto_344061 ?auto_344063 ) ) ( not ( = ?auto_344061 ?auto_344064 ) ) ( not ( = ?auto_344061 ?auto_344065 ) ) ( not ( = ?auto_344062 ?auto_344063 ) ) ( not ( = ?auto_344062 ?auto_344064 ) ) ( not ( = ?auto_344062 ?auto_344065 ) ) ( not ( = ?auto_344063 ?auto_344064 ) ) ( not ( = ?auto_344063 ?auto_344065 ) ) ( not ( = ?auto_344064 ?auto_344065 ) ) ( ON ?auto_344063 ?auto_344064 ) ( ON ?auto_344062 ?auto_344063 ) ( ON ?auto_344061 ?auto_344062 ) ( ON ?auto_344060 ?auto_344061 ) ( CLEAR ?auto_344058 ) ( ON ?auto_344059 ?auto_344060 ) ( CLEAR ?auto_344059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_344058 ?auto_344059 )
      ( MAKE-7PILE ?auto_344058 ?auto_344059 ?auto_344060 ?auto_344061 ?auto_344062 ?auto_344063 ?auto_344064 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_344073 - BLOCK
      ?auto_344074 - BLOCK
      ?auto_344075 - BLOCK
      ?auto_344076 - BLOCK
      ?auto_344077 - BLOCK
      ?auto_344078 - BLOCK
      ?auto_344079 - BLOCK
    )
    :vars
    (
      ?auto_344080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344079 ?auto_344080 ) ( not ( = ?auto_344073 ?auto_344074 ) ) ( not ( = ?auto_344073 ?auto_344075 ) ) ( not ( = ?auto_344073 ?auto_344076 ) ) ( not ( = ?auto_344073 ?auto_344077 ) ) ( not ( = ?auto_344073 ?auto_344078 ) ) ( not ( = ?auto_344073 ?auto_344079 ) ) ( not ( = ?auto_344073 ?auto_344080 ) ) ( not ( = ?auto_344074 ?auto_344075 ) ) ( not ( = ?auto_344074 ?auto_344076 ) ) ( not ( = ?auto_344074 ?auto_344077 ) ) ( not ( = ?auto_344074 ?auto_344078 ) ) ( not ( = ?auto_344074 ?auto_344079 ) ) ( not ( = ?auto_344074 ?auto_344080 ) ) ( not ( = ?auto_344075 ?auto_344076 ) ) ( not ( = ?auto_344075 ?auto_344077 ) ) ( not ( = ?auto_344075 ?auto_344078 ) ) ( not ( = ?auto_344075 ?auto_344079 ) ) ( not ( = ?auto_344075 ?auto_344080 ) ) ( not ( = ?auto_344076 ?auto_344077 ) ) ( not ( = ?auto_344076 ?auto_344078 ) ) ( not ( = ?auto_344076 ?auto_344079 ) ) ( not ( = ?auto_344076 ?auto_344080 ) ) ( not ( = ?auto_344077 ?auto_344078 ) ) ( not ( = ?auto_344077 ?auto_344079 ) ) ( not ( = ?auto_344077 ?auto_344080 ) ) ( not ( = ?auto_344078 ?auto_344079 ) ) ( not ( = ?auto_344078 ?auto_344080 ) ) ( not ( = ?auto_344079 ?auto_344080 ) ) ( ON ?auto_344078 ?auto_344079 ) ( ON ?auto_344077 ?auto_344078 ) ( ON ?auto_344076 ?auto_344077 ) ( ON ?auto_344075 ?auto_344076 ) ( ON ?auto_344074 ?auto_344075 ) ( ON ?auto_344073 ?auto_344074 ) ( CLEAR ?auto_344073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_344073 )
      ( MAKE-7PILE ?auto_344073 ?auto_344074 ?auto_344075 ?auto_344076 ?auto_344077 ?auto_344078 ?auto_344079 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_344088 - BLOCK
      ?auto_344089 - BLOCK
      ?auto_344090 - BLOCK
      ?auto_344091 - BLOCK
      ?auto_344092 - BLOCK
      ?auto_344093 - BLOCK
      ?auto_344094 - BLOCK
    )
    :vars
    (
      ?auto_344095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344094 ?auto_344095 ) ( not ( = ?auto_344088 ?auto_344089 ) ) ( not ( = ?auto_344088 ?auto_344090 ) ) ( not ( = ?auto_344088 ?auto_344091 ) ) ( not ( = ?auto_344088 ?auto_344092 ) ) ( not ( = ?auto_344088 ?auto_344093 ) ) ( not ( = ?auto_344088 ?auto_344094 ) ) ( not ( = ?auto_344088 ?auto_344095 ) ) ( not ( = ?auto_344089 ?auto_344090 ) ) ( not ( = ?auto_344089 ?auto_344091 ) ) ( not ( = ?auto_344089 ?auto_344092 ) ) ( not ( = ?auto_344089 ?auto_344093 ) ) ( not ( = ?auto_344089 ?auto_344094 ) ) ( not ( = ?auto_344089 ?auto_344095 ) ) ( not ( = ?auto_344090 ?auto_344091 ) ) ( not ( = ?auto_344090 ?auto_344092 ) ) ( not ( = ?auto_344090 ?auto_344093 ) ) ( not ( = ?auto_344090 ?auto_344094 ) ) ( not ( = ?auto_344090 ?auto_344095 ) ) ( not ( = ?auto_344091 ?auto_344092 ) ) ( not ( = ?auto_344091 ?auto_344093 ) ) ( not ( = ?auto_344091 ?auto_344094 ) ) ( not ( = ?auto_344091 ?auto_344095 ) ) ( not ( = ?auto_344092 ?auto_344093 ) ) ( not ( = ?auto_344092 ?auto_344094 ) ) ( not ( = ?auto_344092 ?auto_344095 ) ) ( not ( = ?auto_344093 ?auto_344094 ) ) ( not ( = ?auto_344093 ?auto_344095 ) ) ( not ( = ?auto_344094 ?auto_344095 ) ) ( ON ?auto_344093 ?auto_344094 ) ( ON ?auto_344092 ?auto_344093 ) ( ON ?auto_344091 ?auto_344092 ) ( ON ?auto_344090 ?auto_344091 ) ( ON ?auto_344089 ?auto_344090 ) ( ON ?auto_344088 ?auto_344089 ) ( CLEAR ?auto_344088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_344088 )
      ( MAKE-7PILE ?auto_344088 ?auto_344089 ?auto_344090 ?auto_344091 ?auto_344092 ?auto_344093 ?auto_344094 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_344104 - BLOCK
      ?auto_344105 - BLOCK
      ?auto_344106 - BLOCK
      ?auto_344107 - BLOCK
      ?auto_344108 - BLOCK
      ?auto_344109 - BLOCK
      ?auto_344110 - BLOCK
      ?auto_344111 - BLOCK
    )
    :vars
    (
      ?auto_344112 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_344110 ) ( ON ?auto_344111 ?auto_344112 ) ( CLEAR ?auto_344111 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_344104 ) ( ON ?auto_344105 ?auto_344104 ) ( ON ?auto_344106 ?auto_344105 ) ( ON ?auto_344107 ?auto_344106 ) ( ON ?auto_344108 ?auto_344107 ) ( ON ?auto_344109 ?auto_344108 ) ( ON ?auto_344110 ?auto_344109 ) ( not ( = ?auto_344104 ?auto_344105 ) ) ( not ( = ?auto_344104 ?auto_344106 ) ) ( not ( = ?auto_344104 ?auto_344107 ) ) ( not ( = ?auto_344104 ?auto_344108 ) ) ( not ( = ?auto_344104 ?auto_344109 ) ) ( not ( = ?auto_344104 ?auto_344110 ) ) ( not ( = ?auto_344104 ?auto_344111 ) ) ( not ( = ?auto_344104 ?auto_344112 ) ) ( not ( = ?auto_344105 ?auto_344106 ) ) ( not ( = ?auto_344105 ?auto_344107 ) ) ( not ( = ?auto_344105 ?auto_344108 ) ) ( not ( = ?auto_344105 ?auto_344109 ) ) ( not ( = ?auto_344105 ?auto_344110 ) ) ( not ( = ?auto_344105 ?auto_344111 ) ) ( not ( = ?auto_344105 ?auto_344112 ) ) ( not ( = ?auto_344106 ?auto_344107 ) ) ( not ( = ?auto_344106 ?auto_344108 ) ) ( not ( = ?auto_344106 ?auto_344109 ) ) ( not ( = ?auto_344106 ?auto_344110 ) ) ( not ( = ?auto_344106 ?auto_344111 ) ) ( not ( = ?auto_344106 ?auto_344112 ) ) ( not ( = ?auto_344107 ?auto_344108 ) ) ( not ( = ?auto_344107 ?auto_344109 ) ) ( not ( = ?auto_344107 ?auto_344110 ) ) ( not ( = ?auto_344107 ?auto_344111 ) ) ( not ( = ?auto_344107 ?auto_344112 ) ) ( not ( = ?auto_344108 ?auto_344109 ) ) ( not ( = ?auto_344108 ?auto_344110 ) ) ( not ( = ?auto_344108 ?auto_344111 ) ) ( not ( = ?auto_344108 ?auto_344112 ) ) ( not ( = ?auto_344109 ?auto_344110 ) ) ( not ( = ?auto_344109 ?auto_344111 ) ) ( not ( = ?auto_344109 ?auto_344112 ) ) ( not ( = ?auto_344110 ?auto_344111 ) ) ( not ( = ?auto_344110 ?auto_344112 ) ) ( not ( = ?auto_344111 ?auto_344112 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_344111 ?auto_344112 )
      ( !STACK ?auto_344111 ?auto_344110 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_344121 - BLOCK
      ?auto_344122 - BLOCK
      ?auto_344123 - BLOCK
      ?auto_344124 - BLOCK
      ?auto_344125 - BLOCK
      ?auto_344126 - BLOCK
      ?auto_344127 - BLOCK
      ?auto_344128 - BLOCK
    )
    :vars
    (
      ?auto_344129 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_344127 ) ( ON ?auto_344128 ?auto_344129 ) ( CLEAR ?auto_344128 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_344121 ) ( ON ?auto_344122 ?auto_344121 ) ( ON ?auto_344123 ?auto_344122 ) ( ON ?auto_344124 ?auto_344123 ) ( ON ?auto_344125 ?auto_344124 ) ( ON ?auto_344126 ?auto_344125 ) ( ON ?auto_344127 ?auto_344126 ) ( not ( = ?auto_344121 ?auto_344122 ) ) ( not ( = ?auto_344121 ?auto_344123 ) ) ( not ( = ?auto_344121 ?auto_344124 ) ) ( not ( = ?auto_344121 ?auto_344125 ) ) ( not ( = ?auto_344121 ?auto_344126 ) ) ( not ( = ?auto_344121 ?auto_344127 ) ) ( not ( = ?auto_344121 ?auto_344128 ) ) ( not ( = ?auto_344121 ?auto_344129 ) ) ( not ( = ?auto_344122 ?auto_344123 ) ) ( not ( = ?auto_344122 ?auto_344124 ) ) ( not ( = ?auto_344122 ?auto_344125 ) ) ( not ( = ?auto_344122 ?auto_344126 ) ) ( not ( = ?auto_344122 ?auto_344127 ) ) ( not ( = ?auto_344122 ?auto_344128 ) ) ( not ( = ?auto_344122 ?auto_344129 ) ) ( not ( = ?auto_344123 ?auto_344124 ) ) ( not ( = ?auto_344123 ?auto_344125 ) ) ( not ( = ?auto_344123 ?auto_344126 ) ) ( not ( = ?auto_344123 ?auto_344127 ) ) ( not ( = ?auto_344123 ?auto_344128 ) ) ( not ( = ?auto_344123 ?auto_344129 ) ) ( not ( = ?auto_344124 ?auto_344125 ) ) ( not ( = ?auto_344124 ?auto_344126 ) ) ( not ( = ?auto_344124 ?auto_344127 ) ) ( not ( = ?auto_344124 ?auto_344128 ) ) ( not ( = ?auto_344124 ?auto_344129 ) ) ( not ( = ?auto_344125 ?auto_344126 ) ) ( not ( = ?auto_344125 ?auto_344127 ) ) ( not ( = ?auto_344125 ?auto_344128 ) ) ( not ( = ?auto_344125 ?auto_344129 ) ) ( not ( = ?auto_344126 ?auto_344127 ) ) ( not ( = ?auto_344126 ?auto_344128 ) ) ( not ( = ?auto_344126 ?auto_344129 ) ) ( not ( = ?auto_344127 ?auto_344128 ) ) ( not ( = ?auto_344127 ?auto_344129 ) ) ( not ( = ?auto_344128 ?auto_344129 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_344128 ?auto_344129 )
      ( !STACK ?auto_344128 ?auto_344127 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_344138 - BLOCK
      ?auto_344139 - BLOCK
      ?auto_344140 - BLOCK
      ?auto_344141 - BLOCK
      ?auto_344142 - BLOCK
      ?auto_344143 - BLOCK
      ?auto_344144 - BLOCK
      ?auto_344145 - BLOCK
    )
    :vars
    (
      ?auto_344146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344145 ?auto_344146 ) ( ON-TABLE ?auto_344138 ) ( ON ?auto_344139 ?auto_344138 ) ( ON ?auto_344140 ?auto_344139 ) ( ON ?auto_344141 ?auto_344140 ) ( ON ?auto_344142 ?auto_344141 ) ( ON ?auto_344143 ?auto_344142 ) ( not ( = ?auto_344138 ?auto_344139 ) ) ( not ( = ?auto_344138 ?auto_344140 ) ) ( not ( = ?auto_344138 ?auto_344141 ) ) ( not ( = ?auto_344138 ?auto_344142 ) ) ( not ( = ?auto_344138 ?auto_344143 ) ) ( not ( = ?auto_344138 ?auto_344144 ) ) ( not ( = ?auto_344138 ?auto_344145 ) ) ( not ( = ?auto_344138 ?auto_344146 ) ) ( not ( = ?auto_344139 ?auto_344140 ) ) ( not ( = ?auto_344139 ?auto_344141 ) ) ( not ( = ?auto_344139 ?auto_344142 ) ) ( not ( = ?auto_344139 ?auto_344143 ) ) ( not ( = ?auto_344139 ?auto_344144 ) ) ( not ( = ?auto_344139 ?auto_344145 ) ) ( not ( = ?auto_344139 ?auto_344146 ) ) ( not ( = ?auto_344140 ?auto_344141 ) ) ( not ( = ?auto_344140 ?auto_344142 ) ) ( not ( = ?auto_344140 ?auto_344143 ) ) ( not ( = ?auto_344140 ?auto_344144 ) ) ( not ( = ?auto_344140 ?auto_344145 ) ) ( not ( = ?auto_344140 ?auto_344146 ) ) ( not ( = ?auto_344141 ?auto_344142 ) ) ( not ( = ?auto_344141 ?auto_344143 ) ) ( not ( = ?auto_344141 ?auto_344144 ) ) ( not ( = ?auto_344141 ?auto_344145 ) ) ( not ( = ?auto_344141 ?auto_344146 ) ) ( not ( = ?auto_344142 ?auto_344143 ) ) ( not ( = ?auto_344142 ?auto_344144 ) ) ( not ( = ?auto_344142 ?auto_344145 ) ) ( not ( = ?auto_344142 ?auto_344146 ) ) ( not ( = ?auto_344143 ?auto_344144 ) ) ( not ( = ?auto_344143 ?auto_344145 ) ) ( not ( = ?auto_344143 ?auto_344146 ) ) ( not ( = ?auto_344144 ?auto_344145 ) ) ( not ( = ?auto_344144 ?auto_344146 ) ) ( not ( = ?auto_344145 ?auto_344146 ) ) ( CLEAR ?auto_344143 ) ( ON ?auto_344144 ?auto_344145 ) ( CLEAR ?auto_344144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_344138 ?auto_344139 ?auto_344140 ?auto_344141 ?auto_344142 ?auto_344143 ?auto_344144 )
      ( MAKE-8PILE ?auto_344138 ?auto_344139 ?auto_344140 ?auto_344141 ?auto_344142 ?auto_344143 ?auto_344144 ?auto_344145 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_344155 - BLOCK
      ?auto_344156 - BLOCK
      ?auto_344157 - BLOCK
      ?auto_344158 - BLOCK
      ?auto_344159 - BLOCK
      ?auto_344160 - BLOCK
      ?auto_344161 - BLOCK
      ?auto_344162 - BLOCK
    )
    :vars
    (
      ?auto_344163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344162 ?auto_344163 ) ( ON-TABLE ?auto_344155 ) ( ON ?auto_344156 ?auto_344155 ) ( ON ?auto_344157 ?auto_344156 ) ( ON ?auto_344158 ?auto_344157 ) ( ON ?auto_344159 ?auto_344158 ) ( ON ?auto_344160 ?auto_344159 ) ( not ( = ?auto_344155 ?auto_344156 ) ) ( not ( = ?auto_344155 ?auto_344157 ) ) ( not ( = ?auto_344155 ?auto_344158 ) ) ( not ( = ?auto_344155 ?auto_344159 ) ) ( not ( = ?auto_344155 ?auto_344160 ) ) ( not ( = ?auto_344155 ?auto_344161 ) ) ( not ( = ?auto_344155 ?auto_344162 ) ) ( not ( = ?auto_344155 ?auto_344163 ) ) ( not ( = ?auto_344156 ?auto_344157 ) ) ( not ( = ?auto_344156 ?auto_344158 ) ) ( not ( = ?auto_344156 ?auto_344159 ) ) ( not ( = ?auto_344156 ?auto_344160 ) ) ( not ( = ?auto_344156 ?auto_344161 ) ) ( not ( = ?auto_344156 ?auto_344162 ) ) ( not ( = ?auto_344156 ?auto_344163 ) ) ( not ( = ?auto_344157 ?auto_344158 ) ) ( not ( = ?auto_344157 ?auto_344159 ) ) ( not ( = ?auto_344157 ?auto_344160 ) ) ( not ( = ?auto_344157 ?auto_344161 ) ) ( not ( = ?auto_344157 ?auto_344162 ) ) ( not ( = ?auto_344157 ?auto_344163 ) ) ( not ( = ?auto_344158 ?auto_344159 ) ) ( not ( = ?auto_344158 ?auto_344160 ) ) ( not ( = ?auto_344158 ?auto_344161 ) ) ( not ( = ?auto_344158 ?auto_344162 ) ) ( not ( = ?auto_344158 ?auto_344163 ) ) ( not ( = ?auto_344159 ?auto_344160 ) ) ( not ( = ?auto_344159 ?auto_344161 ) ) ( not ( = ?auto_344159 ?auto_344162 ) ) ( not ( = ?auto_344159 ?auto_344163 ) ) ( not ( = ?auto_344160 ?auto_344161 ) ) ( not ( = ?auto_344160 ?auto_344162 ) ) ( not ( = ?auto_344160 ?auto_344163 ) ) ( not ( = ?auto_344161 ?auto_344162 ) ) ( not ( = ?auto_344161 ?auto_344163 ) ) ( not ( = ?auto_344162 ?auto_344163 ) ) ( CLEAR ?auto_344160 ) ( ON ?auto_344161 ?auto_344162 ) ( CLEAR ?auto_344161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_344155 ?auto_344156 ?auto_344157 ?auto_344158 ?auto_344159 ?auto_344160 ?auto_344161 )
      ( MAKE-8PILE ?auto_344155 ?auto_344156 ?auto_344157 ?auto_344158 ?auto_344159 ?auto_344160 ?auto_344161 ?auto_344162 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_344172 - BLOCK
      ?auto_344173 - BLOCK
      ?auto_344174 - BLOCK
      ?auto_344175 - BLOCK
      ?auto_344176 - BLOCK
      ?auto_344177 - BLOCK
      ?auto_344178 - BLOCK
      ?auto_344179 - BLOCK
    )
    :vars
    (
      ?auto_344180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344179 ?auto_344180 ) ( ON-TABLE ?auto_344172 ) ( ON ?auto_344173 ?auto_344172 ) ( ON ?auto_344174 ?auto_344173 ) ( ON ?auto_344175 ?auto_344174 ) ( ON ?auto_344176 ?auto_344175 ) ( not ( = ?auto_344172 ?auto_344173 ) ) ( not ( = ?auto_344172 ?auto_344174 ) ) ( not ( = ?auto_344172 ?auto_344175 ) ) ( not ( = ?auto_344172 ?auto_344176 ) ) ( not ( = ?auto_344172 ?auto_344177 ) ) ( not ( = ?auto_344172 ?auto_344178 ) ) ( not ( = ?auto_344172 ?auto_344179 ) ) ( not ( = ?auto_344172 ?auto_344180 ) ) ( not ( = ?auto_344173 ?auto_344174 ) ) ( not ( = ?auto_344173 ?auto_344175 ) ) ( not ( = ?auto_344173 ?auto_344176 ) ) ( not ( = ?auto_344173 ?auto_344177 ) ) ( not ( = ?auto_344173 ?auto_344178 ) ) ( not ( = ?auto_344173 ?auto_344179 ) ) ( not ( = ?auto_344173 ?auto_344180 ) ) ( not ( = ?auto_344174 ?auto_344175 ) ) ( not ( = ?auto_344174 ?auto_344176 ) ) ( not ( = ?auto_344174 ?auto_344177 ) ) ( not ( = ?auto_344174 ?auto_344178 ) ) ( not ( = ?auto_344174 ?auto_344179 ) ) ( not ( = ?auto_344174 ?auto_344180 ) ) ( not ( = ?auto_344175 ?auto_344176 ) ) ( not ( = ?auto_344175 ?auto_344177 ) ) ( not ( = ?auto_344175 ?auto_344178 ) ) ( not ( = ?auto_344175 ?auto_344179 ) ) ( not ( = ?auto_344175 ?auto_344180 ) ) ( not ( = ?auto_344176 ?auto_344177 ) ) ( not ( = ?auto_344176 ?auto_344178 ) ) ( not ( = ?auto_344176 ?auto_344179 ) ) ( not ( = ?auto_344176 ?auto_344180 ) ) ( not ( = ?auto_344177 ?auto_344178 ) ) ( not ( = ?auto_344177 ?auto_344179 ) ) ( not ( = ?auto_344177 ?auto_344180 ) ) ( not ( = ?auto_344178 ?auto_344179 ) ) ( not ( = ?auto_344178 ?auto_344180 ) ) ( not ( = ?auto_344179 ?auto_344180 ) ) ( ON ?auto_344178 ?auto_344179 ) ( CLEAR ?auto_344176 ) ( ON ?auto_344177 ?auto_344178 ) ( CLEAR ?auto_344177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_344172 ?auto_344173 ?auto_344174 ?auto_344175 ?auto_344176 ?auto_344177 )
      ( MAKE-8PILE ?auto_344172 ?auto_344173 ?auto_344174 ?auto_344175 ?auto_344176 ?auto_344177 ?auto_344178 ?auto_344179 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_344189 - BLOCK
      ?auto_344190 - BLOCK
      ?auto_344191 - BLOCK
      ?auto_344192 - BLOCK
      ?auto_344193 - BLOCK
      ?auto_344194 - BLOCK
      ?auto_344195 - BLOCK
      ?auto_344196 - BLOCK
    )
    :vars
    (
      ?auto_344197 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344196 ?auto_344197 ) ( ON-TABLE ?auto_344189 ) ( ON ?auto_344190 ?auto_344189 ) ( ON ?auto_344191 ?auto_344190 ) ( ON ?auto_344192 ?auto_344191 ) ( ON ?auto_344193 ?auto_344192 ) ( not ( = ?auto_344189 ?auto_344190 ) ) ( not ( = ?auto_344189 ?auto_344191 ) ) ( not ( = ?auto_344189 ?auto_344192 ) ) ( not ( = ?auto_344189 ?auto_344193 ) ) ( not ( = ?auto_344189 ?auto_344194 ) ) ( not ( = ?auto_344189 ?auto_344195 ) ) ( not ( = ?auto_344189 ?auto_344196 ) ) ( not ( = ?auto_344189 ?auto_344197 ) ) ( not ( = ?auto_344190 ?auto_344191 ) ) ( not ( = ?auto_344190 ?auto_344192 ) ) ( not ( = ?auto_344190 ?auto_344193 ) ) ( not ( = ?auto_344190 ?auto_344194 ) ) ( not ( = ?auto_344190 ?auto_344195 ) ) ( not ( = ?auto_344190 ?auto_344196 ) ) ( not ( = ?auto_344190 ?auto_344197 ) ) ( not ( = ?auto_344191 ?auto_344192 ) ) ( not ( = ?auto_344191 ?auto_344193 ) ) ( not ( = ?auto_344191 ?auto_344194 ) ) ( not ( = ?auto_344191 ?auto_344195 ) ) ( not ( = ?auto_344191 ?auto_344196 ) ) ( not ( = ?auto_344191 ?auto_344197 ) ) ( not ( = ?auto_344192 ?auto_344193 ) ) ( not ( = ?auto_344192 ?auto_344194 ) ) ( not ( = ?auto_344192 ?auto_344195 ) ) ( not ( = ?auto_344192 ?auto_344196 ) ) ( not ( = ?auto_344192 ?auto_344197 ) ) ( not ( = ?auto_344193 ?auto_344194 ) ) ( not ( = ?auto_344193 ?auto_344195 ) ) ( not ( = ?auto_344193 ?auto_344196 ) ) ( not ( = ?auto_344193 ?auto_344197 ) ) ( not ( = ?auto_344194 ?auto_344195 ) ) ( not ( = ?auto_344194 ?auto_344196 ) ) ( not ( = ?auto_344194 ?auto_344197 ) ) ( not ( = ?auto_344195 ?auto_344196 ) ) ( not ( = ?auto_344195 ?auto_344197 ) ) ( not ( = ?auto_344196 ?auto_344197 ) ) ( ON ?auto_344195 ?auto_344196 ) ( CLEAR ?auto_344193 ) ( ON ?auto_344194 ?auto_344195 ) ( CLEAR ?auto_344194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_344189 ?auto_344190 ?auto_344191 ?auto_344192 ?auto_344193 ?auto_344194 )
      ( MAKE-8PILE ?auto_344189 ?auto_344190 ?auto_344191 ?auto_344192 ?auto_344193 ?auto_344194 ?auto_344195 ?auto_344196 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_344206 - BLOCK
      ?auto_344207 - BLOCK
      ?auto_344208 - BLOCK
      ?auto_344209 - BLOCK
      ?auto_344210 - BLOCK
      ?auto_344211 - BLOCK
      ?auto_344212 - BLOCK
      ?auto_344213 - BLOCK
    )
    :vars
    (
      ?auto_344214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344213 ?auto_344214 ) ( ON-TABLE ?auto_344206 ) ( ON ?auto_344207 ?auto_344206 ) ( ON ?auto_344208 ?auto_344207 ) ( ON ?auto_344209 ?auto_344208 ) ( not ( = ?auto_344206 ?auto_344207 ) ) ( not ( = ?auto_344206 ?auto_344208 ) ) ( not ( = ?auto_344206 ?auto_344209 ) ) ( not ( = ?auto_344206 ?auto_344210 ) ) ( not ( = ?auto_344206 ?auto_344211 ) ) ( not ( = ?auto_344206 ?auto_344212 ) ) ( not ( = ?auto_344206 ?auto_344213 ) ) ( not ( = ?auto_344206 ?auto_344214 ) ) ( not ( = ?auto_344207 ?auto_344208 ) ) ( not ( = ?auto_344207 ?auto_344209 ) ) ( not ( = ?auto_344207 ?auto_344210 ) ) ( not ( = ?auto_344207 ?auto_344211 ) ) ( not ( = ?auto_344207 ?auto_344212 ) ) ( not ( = ?auto_344207 ?auto_344213 ) ) ( not ( = ?auto_344207 ?auto_344214 ) ) ( not ( = ?auto_344208 ?auto_344209 ) ) ( not ( = ?auto_344208 ?auto_344210 ) ) ( not ( = ?auto_344208 ?auto_344211 ) ) ( not ( = ?auto_344208 ?auto_344212 ) ) ( not ( = ?auto_344208 ?auto_344213 ) ) ( not ( = ?auto_344208 ?auto_344214 ) ) ( not ( = ?auto_344209 ?auto_344210 ) ) ( not ( = ?auto_344209 ?auto_344211 ) ) ( not ( = ?auto_344209 ?auto_344212 ) ) ( not ( = ?auto_344209 ?auto_344213 ) ) ( not ( = ?auto_344209 ?auto_344214 ) ) ( not ( = ?auto_344210 ?auto_344211 ) ) ( not ( = ?auto_344210 ?auto_344212 ) ) ( not ( = ?auto_344210 ?auto_344213 ) ) ( not ( = ?auto_344210 ?auto_344214 ) ) ( not ( = ?auto_344211 ?auto_344212 ) ) ( not ( = ?auto_344211 ?auto_344213 ) ) ( not ( = ?auto_344211 ?auto_344214 ) ) ( not ( = ?auto_344212 ?auto_344213 ) ) ( not ( = ?auto_344212 ?auto_344214 ) ) ( not ( = ?auto_344213 ?auto_344214 ) ) ( ON ?auto_344212 ?auto_344213 ) ( ON ?auto_344211 ?auto_344212 ) ( CLEAR ?auto_344209 ) ( ON ?auto_344210 ?auto_344211 ) ( CLEAR ?auto_344210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_344206 ?auto_344207 ?auto_344208 ?auto_344209 ?auto_344210 )
      ( MAKE-8PILE ?auto_344206 ?auto_344207 ?auto_344208 ?auto_344209 ?auto_344210 ?auto_344211 ?auto_344212 ?auto_344213 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_344223 - BLOCK
      ?auto_344224 - BLOCK
      ?auto_344225 - BLOCK
      ?auto_344226 - BLOCK
      ?auto_344227 - BLOCK
      ?auto_344228 - BLOCK
      ?auto_344229 - BLOCK
      ?auto_344230 - BLOCK
    )
    :vars
    (
      ?auto_344231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344230 ?auto_344231 ) ( ON-TABLE ?auto_344223 ) ( ON ?auto_344224 ?auto_344223 ) ( ON ?auto_344225 ?auto_344224 ) ( ON ?auto_344226 ?auto_344225 ) ( not ( = ?auto_344223 ?auto_344224 ) ) ( not ( = ?auto_344223 ?auto_344225 ) ) ( not ( = ?auto_344223 ?auto_344226 ) ) ( not ( = ?auto_344223 ?auto_344227 ) ) ( not ( = ?auto_344223 ?auto_344228 ) ) ( not ( = ?auto_344223 ?auto_344229 ) ) ( not ( = ?auto_344223 ?auto_344230 ) ) ( not ( = ?auto_344223 ?auto_344231 ) ) ( not ( = ?auto_344224 ?auto_344225 ) ) ( not ( = ?auto_344224 ?auto_344226 ) ) ( not ( = ?auto_344224 ?auto_344227 ) ) ( not ( = ?auto_344224 ?auto_344228 ) ) ( not ( = ?auto_344224 ?auto_344229 ) ) ( not ( = ?auto_344224 ?auto_344230 ) ) ( not ( = ?auto_344224 ?auto_344231 ) ) ( not ( = ?auto_344225 ?auto_344226 ) ) ( not ( = ?auto_344225 ?auto_344227 ) ) ( not ( = ?auto_344225 ?auto_344228 ) ) ( not ( = ?auto_344225 ?auto_344229 ) ) ( not ( = ?auto_344225 ?auto_344230 ) ) ( not ( = ?auto_344225 ?auto_344231 ) ) ( not ( = ?auto_344226 ?auto_344227 ) ) ( not ( = ?auto_344226 ?auto_344228 ) ) ( not ( = ?auto_344226 ?auto_344229 ) ) ( not ( = ?auto_344226 ?auto_344230 ) ) ( not ( = ?auto_344226 ?auto_344231 ) ) ( not ( = ?auto_344227 ?auto_344228 ) ) ( not ( = ?auto_344227 ?auto_344229 ) ) ( not ( = ?auto_344227 ?auto_344230 ) ) ( not ( = ?auto_344227 ?auto_344231 ) ) ( not ( = ?auto_344228 ?auto_344229 ) ) ( not ( = ?auto_344228 ?auto_344230 ) ) ( not ( = ?auto_344228 ?auto_344231 ) ) ( not ( = ?auto_344229 ?auto_344230 ) ) ( not ( = ?auto_344229 ?auto_344231 ) ) ( not ( = ?auto_344230 ?auto_344231 ) ) ( ON ?auto_344229 ?auto_344230 ) ( ON ?auto_344228 ?auto_344229 ) ( CLEAR ?auto_344226 ) ( ON ?auto_344227 ?auto_344228 ) ( CLEAR ?auto_344227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_344223 ?auto_344224 ?auto_344225 ?auto_344226 ?auto_344227 )
      ( MAKE-8PILE ?auto_344223 ?auto_344224 ?auto_344225 ?auto_344226 ?auto_344227 ?auto_344228 ?auto_344229 ?auto_344230 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_344240 - BLOCK
      ?auto_344241 - BLOCK
      ?auto_344242 - BLOCK
      ?auto_344243 - BLOCK
      ?auto_344244 - BLOCK
      ?auto_344245 - BLOCK
      ?auto_344246 - BLOCK
      ?auto_344247 - BLOCK
    )
    :vars
    (
      ?auto_344248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344247 ?auto_344248 ) ( ON-TABLE ?auto_344240 ) ( ON ?auto_344241 ?auto_344240 ) ( ON ?auto_344242 ?auto_344241 ) ( not ( = ?auto_344240 ?auto_344241 ) ) ( not ( = ?auto_344240 ?auto_344242 ) ) ( not ( = ?auto_344240 ?auto_344243 ) ) ( not ( = ?auto_344240 ?auto_344244 ) ) ( not ( = ?auto_344240 ?auto_344245 ) ) ( not ( = ?auto_344240 ?auto_344246 ) ) ( not ( = ?auto_344240 ?auto_344247 ) ) ( not ( = ?auto_344240 ?auto_344248 ) ) ( not ( = ?auto_344241 ?auto_344242 ) ) ( not ( = ?auto_344241 ?auto_344243 ) ) ( not ( = ?auto_344241 ?auto_344244 ) ) ( not ( = ?auto_344241 ?auto_344245 ) ) ( not ( = ?auto_344241 ?auto_344246 ) ) ( not ( = ?auto_344241 ?auto_344247 ) ) ( not ( = ?auto_344241 ?auto_344248 ) ) ( not ( = ?auto_344242 ?auto_344243 ) ) ( not ( = ?auto_344242 ?auto_344244 ) ) ( not ( = ?auto_344242 ?auto_344245 ) ) ( not ( = ?auto_344242 ?auto_344246 ) ) ( not ( = ?auto_344242 ?auto_344247 ) ) ( not ( = ?auto_344242 ?auto_344248 ) ) ( not ( = ?auto_344243 ?auto_344244 ) ) ( not ( = ?auto_344243 ?auto_344245 ) ) ( not ( = ?auto_344243 ?auto_344246 ) ) ( not ( = ?auto_344243 ?auto_344247 ) ) ( not ( = ?auto_344243 ?auto_344248 ) ) ( not ( = ?auto_344244 ?auto_344245 ) ) ( not ( = ?auto_344244 ?auto_344246 ) ) ( not ( = ?auto_344244 ?auto_344247 ) ) ( not ( = ?auto_344244 ?auto_344248 ) ) ( not ( = ?auto_344245 ?auto_344246 ) ) ( not ( = ?auto_344245 ?auto_344247 ) ) ( not ( = ?auto_344245 ?auto_344248 ) ) ( not ( = ?auto_344246 ?auto_344247 ) ) ( not ( = ?auto_344246 ?auto_344248 ) ) ( not ( = ?auto_344247 ?auto_344248 ) ) ( ON ?auto_344246 ?auto_344247 ) ( ON ?auto_344245 ?auto_344246 ) ( ON ?auto_344244 ?auto_344245 ) ( CLEAR ?auto_344242 ) ( ON ?auto_344243 ?auto_344244 ) ( CLEAR ?auto_344243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_344240 ?auto_344241 ?auto_344242 ?auto_344243 )
      ( MAKE-8PILE ?auto_344240 ?auto_344241 ?auto_344242 ?auto_344243 ?auto_344244 ?auto_344245 ?auto_344246 ?auto_344247 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_344257 - BLOCK
      ?auto_344258 - BLOCK
      ?auto_344259 - BLOCK
      ?auto_344260 - BLOCK
      ?auto_344261 - BLOCK
      ?auto_344262 - BLOCK
      ?auto_344263 - BLOCK
      ?auto_344264 - BLOCK
    )
    :vars
    (
      ?auto_344265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344264 ?auto_344265 ) ( ON-TABLE ?auto_344257 ) ( ON ?auto_344258 ?auto_344257 ) ( ON ?auto_344259 ?auto_344258 ) ( not ( = ?auto_344257 ?auto_344258 ) ) ( not ( = ?auto_344257 ?auto_344259 ) ) ( not ( = ?auto_344257 ?auto_344260 ) ) ( not ( = ?auto_344257 ?auto_344261 ) ) ( not ( = ?auto_344257 ?auto_344262 ) ) ( not ( = ?auto_344257 ?auto_344263 ) ) ( not ( = ?auto_344257 ?auto_344264 ) ) ( not ( = ?auto_344257 ?auto_344265 ) ) ( not ( = ?auto_344258 ?auto_344259 ) ) ( not ( = ?auto_344258 ?auto_344260 ) ) ( not ( = ?auto_344258 ?auto_344261 ) ) ( not ( = ?auto_344258 ?auto_344262 ) ) ( not ( = ?auto_344258 ?auto_344263 ) ) ( not ( = ?auto_344258 ?auto_344264 ) ) ( not ( = ?auto_344258 ?auto_344265 ) ) ( not ( = ?auto_344259 ?auto_344260 ) ) ( not ( = ?auto_344259 ?auto_344261 ) ) ( not ( = ?auto_344259 ?auto_344262 ) ) ( not ( = ?auto_344259 ?auto_344263 ) ) ( not ( = ?auto_344259 ?auto_344264 ) ) ( not ( = ?auto_344259 ?auto_344265 ) ) ( not ( = ?auto_344260 ?auto_344261 ) ) ( not ( = ?auto_344260 ?auto_344262 ) ) ( not ( = ?auto_344260 ?auto_344263 ) ) ( not ( = ?auto_344260 ?auto_344264 ) ) ( not ( = ?auto_344260 ?auto_344265 ) ) ( not ( = ?auto_344261 ?auto_344262 ) ) ( not ( = ?auto_344261 ?auto_344263 ) ) ( not ( = ?auto_344261 ?auto_344264 ) ) ( not ( = ?auto_344261 ?auto_344265 ) ) ( not ( = ?auto_344262 ?auto_344263 ) ) ( not ( = ?auto_344262 ?auto_344264 ) ) ( not ( = ?auto_344262 ?auto_344265 ) ) ( not ( = ?auto_344263 ?auto_344264 ) ) ( not ( = ?auto_344263 ?auto_344265 ) ) ( not ( = ?auto_344264 ?auto_344265 ) ) ( ON ?auto_344263 ?auto_344264 ) ( ON ?auto_344262 ?auto_344263 ) ( ON ?auto_344261 ?auto_344262 ) ( CLEAR ?auto_344259 ) ( ON ?auto_344260 ?auto_344261 ) ( CLEAR ?auto_344260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_344257 ?auto_344258 ?auto_344259 ?auto_344260 )
      ( MAKE-8PILE ?auto_344257 ?auto_344258 ?auto_344259 ?auto_344260 ?auto_344261 ?auto_344262 ?auto_344263 ?auto_344264 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_344274 - BLOCK
      ?auto_344275 - BLOCK
      ?auto_344276 - BLOCK
      ?auto_344277 - BLOCK
      ?auto_344278 - BLOCK
      ?auto_344279 - BLOCK
      ?auto_344280 - BLOCK
      ?auto_344281 - BLOCK
    )
    :vars
    (
      ?auto_344282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344281 ?auto_344282 ) ( ON-TABLE ?auto_344274 ) ( ON ?auto_344275 ?auto_344274 ) ( not ( = ?auto_344274 ?auto_344275 ) ) ( not ( = ?auto_344274 ?auto_344276 ) ) ( not ( = ?auto_344274 ?auto_344277 ) ) ( not ( = ?auto_344274 ?auto_344278 ) ) ( not ( = ?auto_344274 ?auto_344279 ) ) ( not ( = ?auto_344274 ?auto_344280 ) ) ( not ( = ?auto_344274 ?auto_344281 ) ) ( not ( = ?auto_344274 ?auto_344282 ) ) ( not ( = ?auto_344275 ?auto_344276 ) ) ( not ( = ?auto_344275 ?auto_344277 ) ) ( not ( = ?auto_344275 ?auto_344278 ) ) ( not ( = ?auto_344275 ?auto_344279 ) ) ( not ( = ?auto_344275 ?auto_344280 ) ) ( not ( = ?auto_344275 ?auto_344281 ) ) ( not ( = ?auto_344275 ?auto_344282 ) ) ( not ( = ?auto_344276 ?auto_344277 ) ) ( not ( = ?auto_344276 ?auto_344278 ) ) ( not ( = ?auto_344276 ?auto_344279 ) ) ( not ( = ?auto_344276 ?auto_344280 ) ) ( not ( = ?auto_344276 ?auto_344281 ) ) ( not ( = ?auto_344276 ?auto_344282 ) ) ( not ( = ?auto_344277 ?auto_344278 ) ) ( not ( = ?auto_344277 ?auto_344279 ) ) ( not ( = ?auto_344277 ?auto_344280 ) ) ( not ( = ?auto_344277 ?auto_344281 ) ) ( not ( = ?auto_344277 ?auto_344282 ) ) ( not ( = ?auto_344278 ?auto_344279 ) ) ( not ( = ?auto_344278 ?auto_344280 ) ) ( not ( = ?auto_344278 ?auto_344281 ) ) ( not ( = ?auto_344278 ?auto_344282 ) ) ( not ( = ?auto_344279 ?auto_344280 ) ) ( not ( = ?auto_344279 ?auto_344281 ) ) ( not ( = ?auto_344279 ?auto_344282 ) ) ( not ( = ?auto_344280 ?auto_344281 ) ) ( not ( = ?auto_344280 ?auto_344282 ) ) ( not ( = ?auto_344281 ?auto_344282 ) ) ( ON ?auto_344280 ?auto_344281 ) ( ON ?auto_344279 ?auto_344280 ) ( ON ?auto_344278 ?auto_344279 ) ( ON ?auto_344277 ?auto_344278 ) ( CLEAR ?auto_344275 ) ( ON ?auto_344276 ?auto_344277 ) ( CLEAR ?auto_344276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_344274 ?auto_344275 ?auto_344276 )
      ( MAKE-8PILE ?auto_344274 ?auto_344275 ?auto_344276 ?auto_344277 ?auto_344278 ?auto_344279 ?auto_344280 ?auto_344281 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_344291 - BLOCK
      ?auto_344292 - BLOCK
      ?auto_344293 - BLOCK
      ?auto_344294 - BLOCK
      ?auto_344295 - BLOCK
      ?auto_344296 - BLOCK
      ?auto_344297 - BLOCK
      ?auto_344298 - BLOCK
    )
    :vars
    (
      ?auto_344299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344298 ?auto_344299 ) ( ON-TABLE ?auto_344291 ) ( ON ?auto_344292 ?auto_344291 ) ( not ( = ?auto_344291 ?auto_344292 ) ) ( not ( = ?auto_344291 ?auto_344293 ) ) ( not ( = ?auto_344291 ?auto_344294 ) ) ( not ( = ?auto_344291 ?auto_344295 ) ) ( not ( = ?auto_344291 ?auto_344296 ) ) ( not ( = ?auto_344291 ?auto_344297 ) ) ( not ( = ?auto_344291 ?auto_344298 ) ) ( not ( = ?auto_344291 ?auto_344299 ) ) ( not ( = ?auto_344292 ?auto_344293 ) ) ( not ( = ?auto_344292 ?auto_344294 ) ) ( not ( = ?auto_344292 ?auto_344295 ) ) ( not ( = ?auto_344292 ?auto_344296 ) ) ( not ( = ?auto_344292 ?auto_344297 ) ) ( not ( = ?auto_344292 ?auto_344298 ) ) ( not ( = ?auto_344292 ?auto_344299 ) ) ( not ( = ?auto_344293 ?auto_344294 ) ) ( not ( = ?auto_344293 ?auto_344295 ) ) ( not ( = ?auto_344293 ?auto_344296 ) ) ( not ( = ?auto_344293 ?auto_344297 ) ) ( not ( = ?auto_344293 ?auto_344298 ) ) ( not ( = ?auto_344293 ?auto_344299 ) ) ( not ( = ?auto_344294 ?auto_344295 ) ) ( not ( = ?auto_344294 ?auto_344296 ) ) ( not ( = ?auto_344294 ?auto_344297 ) ) ( not ( = ?auto_344294 ?auto_344298 ) ) ( not ( = ?auto_344294 ?auto_344299 ) ) ( not ( = ?auto_344295 ?auto_344296 ) ) ( not ( = ?auto_344295 ?auto_344297 ) ) ( not ( = ?auto_344295 ?auto_344298 ) ) ( not ( = ?auto_344295 ?auto_344299 ) ) ( not ( = ?auto_344296 ?auto_344297 ) ) ( not ( = ?auto_344296 ?auto_344298 ) ) ( not ( = ?auto_344296 ?auto_344299 ) ) ( not ( = ?auto_344297 ?auto_344298 ) ) ( not ( = ?auto_344297 ?auto_344299 ) ) ( not ( = ?auto_344298 ?auto_344299 ) ) ( ON ?auto_344297 ?auto_344298 ) ( ON ?auto_344296 ?auto_344297 ) ( ON ?auto_344295 ?auto_344296 ) ( ON ?auto_344294 ?auto_344295 ) ( CLEAR ?auto_344292 ) ( ON ?auto_344293 ?auto_344294 ) ( CLEAR ?auto_344293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_344291 ?auto_344292 ?auto_344293 )
      ( MAKE-8PILE ?auto_344291 ?auto_344292 ?auto_344293 ?auto_344294 ?auto_344295 ?auto_344296 ?auto_344297 ?auto_344298 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_344308 - BLOCK
      ?auto_344309 - BLOCK
      ?auto_344310 - BLOCK
      ?auto_344311 - BLOCK
      ?auto_344312 - BLOCK
      ?auto_344313 - BLOCK
      ?auto_344314 - BLOCK
      ?auto_344315 - BLOCK
    )
    :vars
    (
      ?auto_344316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344315 ?auto_344316 ) ( ON-TABLE ?auto_344308 ) ( not ( = ?auto_344308 ?auto_344309 ) ) ( not ( = ?auto_344308 ?auto_344310 ) ) ( not ( = ?auto_344308 ?auto_344311 ) ) ( not ( = ?auto_344308 ?auto_344312 ) ) ( not ( = ?auto_344308 ?auto_344313 ) ) ( not ( = ?auto_344308 ?auto_344314 ) ) ( not ( = ?auto_344308 ?auto_344315 ) ) ( not ( = ?auto_344308 ?auto_344316 ) ) ( not ( = ?auto_344309 ?auto_344310 ) ) ( not ( = ?auto_344309 ?auto_344311 ) ) ( not ( = ?auto_344309 ?auto_344312 ) ) ( not ( = ?auto_344309 ?auto_344313 ) ) ( not ( = ?auto_344309 ?auto_344314 ) ) ( not ( = ?auto_344309 ?auto_344315 ) ) ( not ( = ?auto_344309 ?auto_344316 ) ) ( not ( = ?auto_344310 ?auto_344311 ) ) ( not ( = ?auto_344310 ?auto_344312 ) ) ( not ( = ?auto_344310 ?auto_344313 ) ) ( not ( = ?auto_344310 ?auto_344314 ) ) ( not ( = ?auto_344310 ?auto_344315 ) ) ( not ( = ?auto_344310 ?auto_344316 ) ) ( not ( = ?auto_344311 ?auto_344312 ) ) ( not ( = ?auto_344311 ?auto_344313 ) ) ( not ( = ?auto_344311 ?auto_344314 ) ) ( not ( = ?auto_344311 ?auto_344315 ) ) ( not ( = ?auto_344311 ?auto_344316 ) ) ( not ( = ?auto_344312 ?auto_344313 ) ) ( not ( = ?auto_344312 ?auto_344314 ) ) ( not ( = ?auto_344312 ?auto_344315 ) ) ( not ( = ?auto_344312 ?auto_344316 ) ) ( not ( = ?auto_344313 ?auto_344314 ) ) ( not ( = ?auto_344313 ?auto_344315 ) ) ( not ( = ?auto_344313 ?auto_344316 ) ) ( not ( = ?auto_344314 ?auto_344315 ) ) ( not ( = ?auto_344314 ?auto_344316 ) ) ( not ( = ?auto_344315 ?auto_344316 ) ) ( ON ?auto_344314 ?auto_344315 ) ( ON ?auto_344313 ?auto_344314 ) ( ON ?auto_344312 ?auto_344313 ) ( ON ?auto_344311 ?auto_344312 ) ( ON ?auto_344310 ?auto_344311 ) ( CLEAR ?auto_344308 ) ( ON ?auto_344309 ?auto_344310 ) ( CLEAR ?auto_344309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_344308 ?auto_344309 )
      ( MAKE-8PILE ?auto_344308 ?auto_344309 ?auto_344310 ?auto_344311 ?auto_344312 ?auto_344313 ?auto_344314 ?auto_344315 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_344325 - BLOCK
      ?auto_344326 - BLOCK
      ?auto_344327 - BLOCK
      ?auto_344328 - BLOCK
      ?auto_344329 - BLOCK
      ?auto_344330 - BLOCK
      ?auto_344331 - BLOCK
      ?auto_344332 - BLOCK
    )
    :vars
    (
      ?auto_344333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344332 ?auto_344333 ) ( ON-TABLE ?auto_344325 ) ( not ( = ?auto_344325 ?auto_344326 ) ) ( not ( = ?auto_344325 ?auto_344327 ) ) ( not ( = ?auto_344325 ?auto_344328 ) ) ( not ( = ?auto_344325 ?auto_344329 ) ) ( not ( = ?auto_344325 ?auto_344330 ) ) ( not ( = ?auto_344325 ?auto_344331 ) ) ( not ( = ?auto_344325 ?auto_344332 ) ) ( not ( = ?auto_344325 ?auto_344333 ) ) ( not ( = ?auto_344326 ?auto_344327 ) ) ( not ( = ?auto_344326 ?auto_344328 ) ) ( not ( = ?auto_344326 ?auto_344329 ) ) ( not ( = ?auto_344326 ?auto_344330 ) ) ( not ( = ?auto_344326 ?auto_344331 ) ) ( not ( = ?auto_344326 ?auto_344332 ) ) ( not ( = ?auto_344326 ?auto_344333 ) ) ( not ( = ?auto_344327 ?auto_344328 ) ) ( not ( = ?auto_344327 ?auto_344329 ) ) ( not ( = ?auto_344327 ?auto_344330 ) ) ( not ( = ?auto_344327 ?auto_344331 ) ) ( not ( = ?auto_344327 ?auto_344332 ) ) ( not ( = ?auto_344327 ?auto_344333 ) ) ( not ( = ?auto_344328 ?auto_344329 ) ) ( not ( = ?auto_344328 ?auto_344330 ) ) ( not ( = ?auto_344328 ?auto_344331 ) ) ( not ( = ?auto_344328 ?auto_344332 ) ) ( not ( = ?auto_344328 ?auto_344333 ) ) ( not ( = ?auto_344329 ?auto_344330 ) ) ( not ( = ?auto_344329 ?auto_344331 ) ) ( not ( = ?auto_344329 ?auto_344332 ) ) ( not ( = ?auto_344329 ?auto_344333 ) ) ( not ( = ?auto_344330 ?auto_344331 ) ) ( not ( = ?auto_344330 ?auto_344332 ) ) ( not ( = ?auto_344330 ?auto_344333 ) ) ( not ( = ?auto_344331 ?auto_344332 ) ) ( not ( = ?auto_344331 ?auto_344333 ) ) ( not ( = ?auto_344332 ?auto_344333 ) ) ( ON ?auto_344331 ?auto_344332 ) ( ON ?auto_344330 ?auto_344331 ) ( ON ?auto_344329 ?auto_344330 ) ( ON ?auto_344328 ?auto_344329 ) ( ON ?auto_344327 ?auto_344328 ) ( CLEAR ?auto_344325 ) ( ON ?auto_344326 ?auto_344327 ) ( CLEAR ?auto_344326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_344325 ?auto_344326 )
      ( MAKE-8PILE ?auto_344325 ?auto_344326 ?auto_344327 ?auto_344328 ?auto_344329 ?auto_344330 ?auto_344331 ?auto_344332 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_344342 - BLOCK
      ?auto_344343 - BLOCK
      ?auto_344344 - BLOCK
      ?auto_344345 - BLOCK
      ?auto_344346 - BLOCK
      ?auto_344347 - BLOCK
      ?auto_344348 - BLOCK
      ?auto_344349 - BLOCK
    )
    :vars
    (
      ?auto_344350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344349 ?auto_344350 ) ( not ( = ?auto_344342 ?auto_344343 ) ) ( not ( = ?auto_344342 ?auto_344344 ) ) ( not ( = ?auto_344342 ?auto_344345 ) ) ( not ( = ?auto_344342 ?auto_344346 ) ) ( not ( = ?auto_344342 ?auto_344347 ) ) ( not ( = ?auto_344342 ?auto_344348 ) ) ( not ( = ?auto_344342 ?auto_344349 ) ) ( not ( = ?auto_344342 ?auto_344350 ) ) ( not ( = ?auto_344343 ?auto_344344 ) ) ( not ( = ?auto_344343 ?auto_344345 ) ) ( not ( = ?auto_344343 ?auto_344346 ) ) ( not ( = ?auto_344343 ?auto_344347 ) ) ( not ( = ?auto_344343 ?auto_344348 ) ) ( not ( = ?auto_344343 ?auto_344349 ) ) ( not ( = ?auto_344343 ?auto_344350 ) ) ( not ( = ?auto_344344 ?auto_344345 ) ) ( not ( = ?auto_344344 ?auto_344346 ) ) ( not ( = ?auto_344344 ?auto_344347 ) ) ( not ( = ?auto_344344 ?auto_344348 ) ) ( not ( = ?auto_344344 ?auto_344349 ) ) ( not ( = ?auto_344344 ?auto_344350 ) ) ( not ( = ?auto_344345 ?auto_344346 ) ) ( not ( = ?auto_344345 ?auto_344347 ) ) ( not ( = ?auto_344345 ?auto_344348 ) ) ( not ( = ?auto_344345 ?auto_344349 ) ) ( not ( = ?auto_344345 ?auto_344350 ) ) ( not ( = ?auto_344346 ?auto_344347 ) ) ( not ( = ?auto_344346 ?auto_344348 ) ) ( not ( = ?auto_344346 ?auto_344349 ) ) ( not ( = ?auto_344346 ?auto_344350 ) ) ( not ( = ?auto_344347 ?auto_344348 ) ) ( not ( = ?auto_344347 ?auto_344349 ) ) ( not ( = ?auto_344347 ?auto_344350 ) ) ( not ( = ?auto_344348 ?auto_344349 ) ) ( not ( = ?auto_344348 ?auto_344350 ) ) ( not ( = ?auto_344349 ?auto_344350 ) ) ( ON ?auto_344348 ?auto_344349 ) ( ON ?auto_344347 ?auto_344348 ) ( ON ?auto_344346 ?auto_344347 ) ( ON ?auto_344345 ?auto_344346 ) ( ON ?auto_344344 ?auto_344345 ) ( ON ?auto_344343 ?auto_344344 ) ( ON ?auto_344342 ?auto_344343 ) ( CLEAR ?auto_344342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_344342 )
      ( MAKE-8PILE ?auto_344342 ?auto_344343 ?auto_344344 ?auto_344345 ?auto_344346 ?auto_344347 ?auto_344348 ?auto_344349 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_344359 - BLOCK
      ?auto_344360 - BLOCK
      ?auto_344361 - BLOCK
      ?auto_344362 - BLOCK
      ?auto_344363 - BLOCK
      ?auto_344364 - BLOCK
      ?auto_344365 - BLOCK
      ?auto_344366 - BLOCK
    )
    :vars
    (
      ?auto_344367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344366 ?auto_344367 ) ( not ( = ?auto_344359 ?auto_344360 ) ) ( not ( = ?auto_344359 ?auto_344361 ) ) ( not ( = ?auto_344359 ?auto_344362 ) ) ( not ( = ?auto_344359 ?auto_344363 ) ) ( not ( = ?auto_344359 ?auto_344364 ) ) ( not ( = ?auto_344359 ?auto_344365 ) ) ( not ( = ?auto_344359 ?auto_344366 ) ) ( not ( = ?auto_344359 ?auto_344367 ) ) ( not ( = ?auto_344360 ?auto_344361 ) ) ( not ( = ?auto_344360 ?auto_344362 ) ) ( not ( = ?auto_344360 ?auto_344363 ) ) ( not ( = ?auto_344360 ?auto_344364 ) ) ( not ( = ?auto_344360 ?auto_344365 ) ) ( not ( = ?auto_344360 ?auto_344366 ) ) ( not ( = ?auto_344360 ?auto_344367 ) ) ( not ( = ?auto_344361 ?auto_344362 ) ) ( not ( = ?auto_344361 ?auto_344363 ) ) ( not ( = ?auto_344361 ?auto_344364 ) ) ( not ( = ?auto_344361 ?auto_344365 ) ) ( not ( = ?auto_344361 ?auto_344366 ) ) ( not ( = ?auto_344361 ?auto_344367 ) ) ( not ( = ?auto_344362 ?auto_344363 ) ) ( not ( = ?auto_344362 ?auto_344364 ) ) ( not ( = ?auto_344362 ?auto_344365 ) ) ( not ( = ?auto_344362 ?auto_344366 ) ) ( not ( = ?auto_344362 ?auto_344367 ) ) ( not ( = ?auto_344363 ?auto_344364 ) ) ( not ( = ?auto_344363 ?auto_344365 ) ) ( not ( = ?auto_344363 ?auto_344366 ) ) ( not ( = ?auto_344363 ?auto_344367 ) ) ( not ( = ?auto_344364 ?auto_344365 ) ) ( not ( = ?auto_344364 ?auto_344366 ) ) ( not ( = ?auto_344364 ?auto_344367 ) ) ( not ( = ?auto_344365 ?auto_344366 ) ) ( not ( = ?auto_344365 ?auto_344367 ) ) ( not ( = ?auto_344366 ?auto_344367 ) ) ( ON ?auto_344365 ?auto_344366 ) ( ON ?auto_344364 ?auto_344365 ) ( ON ?auto_344363 ?auto_344364 ) ( ON ?auto_344362 ?auto_344363 ) ( ON ?auto_344361 ?auto_344362 ) ( ON ?auto_344360 ?auto_344361 ) ( ON ?auto_344359 ?auto_344360 ) ( CLEAR ?auto_344359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_344359 )
      ( MAKE-8PILE ?auto_344359 ?auto_344360 ?auto_344361 ?auto_344362 ?auto_344363 ?auto_344364 ?auto_344365 ?auto_344366 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_344377 - BLOCK
      ?auto_344378 - BLOCK
      ?auto_344379 - BLOCK
      ?auto_344380 - BLOCK
      ?auto_344381 - BLOCK
      ?auto_344382 - BLOCK
      ?auto_344383 - BLOCK
      ?auto_344384 - BLOCK
      ?auto_344385 - BLOCK
    )
    :vars
    (
      ?auto_344386 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_344384 ) ( ON ?auto_344385 ?auto_344386 ) ( CLEAR ?auto_344385 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_344377 ) ( ON ?auto_344378 ?auto_344377 ) ( ON ?auto_344379 ?auto_344378 ) ( ON ?auto_344380 ?auto_344379 ) ( ON ?auto_344381 ?auto_344380 ) ( ON ?auto_344382 ?auto_344381 ) ( ON ?auto_344383 ?auto_344382 ) ( ON ?auto_344384 ?auto_344383 ) ( not ( = ?auto_344377 ?auto_344378 ) ) ( not ( = ?auto_344377 ?auto_344379 ) ) ( not ( = ?auto_344377 ?auto_344380 ) ) ( not ( = ?auto_344377 ?auto_344381 ) ) ( not ( = ?auto_344377 ?auto_344382 ) ) ( not ( = ?auto_344377 ?auto_344383 ) ) ( not ( = ?auto_344377 ?auto_344384 ) ) ( not ( = ?auto_344377 ?auto_344385 ) ) ( not ( = ?auto_344377 ?auto_344386 ) ) ( not ( = ?auto_344378 ?auto_344379 ) ) ( not ( = ?auto_344378 ?auto_344380 ) ) ( not ( = ?auto_344378 ?auto_344381 ) ) ( not ( = ?auto_344378 ?auto_344382 ) ) ( not ( = ?auto_344378 ?auto_344383 ) ) ( not ( = ?auto_344378 ?auto_344384 ) ) ( not ( = ?auto_344378 ?auto_344385 ) ) ( not ( = ?auto_344378 ?auto_344386 ) ) ( not ( = ?auto_344379 ?auto_344380 ) ) ( not ( = ?auto_344379 ?auto_344381 ) ) ( not ( = ?auto_344379 ?auto_344382 ) ) ( not ( = ?auto_344379 ?auto_344383 ) ) ( not ( = ?auto_344379 ?auto_344384 ) ) ( not ( = ?auto_344379 ?auto_344385 ) ) ( not ( = ?auto_344379 ?auto_344386 ) ) ( not ( = ?auto_344380 ?auto_344381 ) ) ( not ( = ?auto_344380 ?auto_344382 ) ) ( not ( = ?auto_344380 ?auto_344383 ) ) ( not ( = ?auto_344380 ?auto_344384 ) ) ( not ( = ?auto_344380 ?auto_344385 ) ) ( not ( = ?auto_344380 ?auto_344386 ) ) ( not ( = ?auto_344381 ?auto_344382 ) ) ( not ( = ?auto_344381 ?auto_344383 ) ) ( not ( = ?auto_344381 ?auto_344384 ) ) ( not ( = ?auto_344381 ?auto_344385 ) ) ( not ( = ?auto_344381 ?auto_344386 ) ) ( not ( = ?auto_344382 ?auto_344383 ) ) ( not ( = ?auto_344382 ?auto_344384 ) ) ( not ( = ?auto_344382 ?auto_344385 ) ) ( not ( = ?auto_344382 ?auto_344386 ) ) ( not ( = ?auto_344383 ?auto_344384 ) ) ( not ( = ?auto_344383 ?auto_344385 ) ) ( not ( = ?auto_344383 ?auto_344386 ) ) ( not ( = ?auto_344384 ?auto_344385 ) ) ( not ( = ?auto_344384 ?auto_344386 ) ) ( not ( = ?auto_344385 ?auto_344386 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_344385 ?auto_344386 )
      ( !STACK ?auto_344385 ?auto_344384 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_344396 - BLOCK
      ?auto_344397 - BLOCK
      ?auto_344398 - BLOCK
      ?auto_344399 - BLOCK
      ?auto_344400 - BLOCK
      ?auto_344401 - BLOCK
      ?auto_344402 - BLOCK
      ?auto_344403 - BLOCK
      ?auto_344404 - BLOCK
    )
    :vars
    (
      ?auto_344405 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_344403 ) ( ON ?auto_344404 ?auto_344405 ) ( CLEAR ?auto_344404 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_344396 ) ( ON ?auto_344397 ?auto_344396 ) ( ON ?auto_344398 ?auto_344397 ) ( ON ?auto_344399 ?auto_344398 ) ( ON ?auto_344400 ?auto_344399 ) ( ON ?auto_344401 ?auto_344400 ) ( ON ?auto_344402 ?auto_344401 ) ( ON ?auto_344403 ?auto_344402 ) ( not ( = ?auto_344396 ?auto_344397 ) ) ( not ( = ?auto_344396 ?auto_344398 ) ) ( not ( = ?auto_344396 ?auto_344399 ) ) ( not ( = ?auto_344396 ?auto_344400 ) ) ( not ( = ?auto_344396 ?auto_344401 ) ) ( not ( = ?auto_344396 ?auto_344402 ) ) ( not ( = ?auto_344396 ?auto_344403 ) ) ( not ( = ?auto_344396 ?auto_344404 ) ) ( not ( = ?auto_344396 ?auto_344405 ) ) ( not ( = ?auto_344397 ?auto_344398 ) ) ( not ( = ?auto_344397 ?auto_344399 ) ) ( not ( = ?auto_344397 ?auto_344400 ) ) ( not ( = ?auto_344397 ?auto_344401 ) ) ( not ( = ?auto_344397 ?auto_344402 ) ) ( not ( = ?auto_344397 ?auto_344403 ) ) ( not ( = ?auto_344397 ?auto_344404 ) ) ( not ( = ?auto_344397 ?auto_344405 ) ) ( not ( = ?auto_344398 ?auto_344399 ) ) ( not ( = ?auto_344398 ?auto_344400 ) ) ( not ( = ?auto_344398 ?auto_344401 ) ) ( not ( = ?auto_344398 ?auto_344402 ) ) ( not ( = ?auto_344398 ?auto_344403 ) ) ( not ( = ?auto_344398 ?auto_344404 ) ) ( not ( = ?auto_344398 ?auto_344405 ) ) ( not ( = ?auto_344399 ?auto_344400 ) ) ( not ( = ?auto_344399 ?auto_344401 ) ) ( not ( = ?auto_344399 ?auto_344402 ) ) ( not ( = ?auto_344399 ?auto_344403 ) ) ( not ( = ?auto_344399 ?auto_344404 ) ) ( not ( = ?auto_344399 ?auto_344405 ) ) ( not ( = ?auto_344400 ?auto_344401 ) ) ( not ( = ?auto_344400 ?auto_344402 ) ) ( not ( = ?auto_344400 ?auto_344403 ) ) ( not ( = ?auto_344400 ?auto_344404 ) ) ( not ( = ?auto_344400 ?auto_344405 ) ) ( not ( = ?auto_344401 ?auto_344402 ) ) ( not ( = ?auto_344401 ?auto_344403 ) ) ( not ( = ?auto_344401 ?auto_344404 ) ) ( not ( = ?auto_344401 ?auto_344405 ) ) ( not ( = ?auto_344402 ?auto_344403 ) ) ( not ( = ?auto_344402 ?auto_344404 ) ) ( not ( = ?auto_344402 ?auto_344405 ) ) ( not ( = ?auto_344403 ?auto_344404 ) ) ( not ( = ?auto_344403 ?auto_344405 ) ) ( not ( = ?auto_344404 ?auto_344405 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_344404 ?auto_344405 )
      ( !STACK ?auto_344404 ?auto_344403 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_344415 - BLOCK
      ?auto_344416 - BLOCK
      ?auto_344417 - BLOCK
      ?auto_344418 - BLOCK
      ?auto_344419 - BLOCK
      ?auto_344420 - BLOCK
      ?auto_344421 - BLOCK
      ?auto_344422 - BLOCK
      ?auto_344423 - BLOCK
    )
    :vars
    (
      ?auto_344424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344423 ?auto_344424 ) ( ON-TABLE ?auto_344415 ) ( ON ?auto_344416 ?auto_344415 ) ( ON ?auto_344417 ?auto_344416 ) ( ON ?auto_344418 ?auto_344417 ) ( ON ?auto_344419 ?auto_344418 ) ( ON ?auto_344420 ?auto_344419 ) ( ON ?auto_344421 ?auto_344420 ) ( not ( = ?auto_344415 ?auto_344416 ) ) ( not ( = ?auto_344415 ?auto_344417 ) ) ( not ( = ?auto_344415 ?auto_344418 ) ) ( not ( = ?auto_344415 ?auto_344419 ) ) ( not ( = ?auto_344415 ?auto_344420 ) ) ( not ( = ?auto_344415 ?auto_344421 ) ) ( not ( = ?auto_344415 ?auto_344422 ) ) ( not ( = ?auto_344415 ?auto_344423 ) ) ( not ( = ?auto_344415 ?auto_344424 ) ) ( not ( = ?auto_344416 ?auto_344417 ) ) ( not ( = ?auto_344416 ?auto_344418 ) ) ( not ( = ?auto_344416 ?auto_344419 ) ) ( not ( = ?auto_344416 ?auto_344420 ) ) ( not ( = ?auto_344416 ?auto_344421 ) ) ( not ( = ?auto_344416 ?auto_344422 ) ) ( not ( = ?auto_344416 ?auto_344423 ) ) ( not ( = ?auto_344416 ?auto_344424 ) ) ( not ( = ?auto_344417 ?auto_344418 ) ) ( not ( = ?auto_344417 ?auto_344419 ) ) ( not ( = ?auto_344417 ?auto_344420 ) ) ( not ( = ?auto_344417 ?auto_344421 ) ) ( not ( = ?auto_344417 ?auto_344422 ) ) ( not ( = ?auto_344417 ?auto_344423 ) ) ( not ( = ?auto_344417 ?auto_344424 ) ) ( not ( = ?auto_344418 ?auto_344419 ) ) ( not ( = ?auto_344418 ?auto_344420 ) ) ( not ( = ?auto_344418 ?auto_344421 ) ) ( not ( = ?auto_344418 ?auto_344422 ) ) ( not ( = ?auto_344418 ?auto_344423 ) ) ( not ( = ?auto_344418 ?auto_344424 ) ) ( not ( = ?auto_344419 ?auto_344420 ) ) ( not ( = ?auto_344419 ?auto_344421 ) ) ( not ( = ?auto_344419 ?auto_344422 ) ) ( not ( = ?auto_344419 ?auto_344423 ) ) ( not ( = ?auto_344419 ?auto_344424 ) ) ( not ( = ?auto_344420 ?auto_344421 ) ) ( not ( = ?auto_344420 ?auto_344422 ) ) ( not ( = ?auto_344420 ?auto_344423 ) ) ( not ( = ?auto_344420 ?auto_344424 ) ) ( not ( = ?auto_344421 ?auto_344422 ) ) ( not ( = ?auto_344421 ?auto_344423 ) ) ( not ( = ?auto_344421 ?auto_344424 ) ) ( not ( = ?auto_344422 ?auto_344423 ) ) ( not ( = ?auto_344422 ?auto_344424 ) ) ( not ( = ?auto_344423 ?auto_344424 ) ) ( CLEAR ?auto_344421 ) ( ON ?auto_344422 ?auto_344423 ) ( CLEAR ?auto_344422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_344415 ?auto_344416 ?auto_344417 ?auto_344418 ?auto_344419 ?auto_344420 ?auto_344421 ?auto_344422 )
      ( MAKE-9PILE ?auto_344415 ?auto_344416 ?auto_344417 ?auto_344418 ?auto_344419 ?auto_344420 ?auto_344421 ?auto_344422 ?auto_344423 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_344434 - BLOCK
      ?auto_344435 - BLOCK
      ?auto_344436 - BLOCK
      ?auto_344437 - BLOCK
      ?auto_344438 - BLOCK
      ?auto_344439 - BLOCK
      ?auto_344440 - BLOCK
      ?auto_344441 - BLOCK
      ?auto_344442 - BLOCK
    )
    :vars
    (
      ?auto_344443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344442 ?auto_344443 ) ( ON-TABLE ?auto_344434 ) ( ON ?auto_344435 ?auto_344434 ) ( ON ?auto_344436 ?auto_344435 ) ( ON ?auto_344437 ?auto_344436 ) ( ON ?auto_344438 ?auto_344437 ) ( ON ?auto_344439 ?auto_344438 ) ( ON ?auto_344440 ?auto_344439 ) ( not ( = ?auto_344434 ?auto_344435 ) ) ( not ( = ?auto_344434 ?auto_344436 ) ) ( not ( = ?auto_344434 ?auto_344437 ) ) ( not ( = ?auto_344434 ?auto_344438 ) ) ( not ( = ?auto_344434 ?auto_344439 ) ) ( not ( = ?auto_344434 ?auto_344440 ) ) ( not ( = ?auto_344434 ?auto_344441 ) ) ( not ( = ?auto_344434 ?auto_344442 ) ) ( not ( = ?auto_344434 ?auto_344443 ) ) ( not ( = ?auto_344435 ?auto_344436 ) ) ( not ( = ?auto_344435 ?auto_344437 ) ) ( not ( = ?auto_344435 ?auto_344438 ) ) ( not ( = ?auto_344435 ?auto_344439 ) ) ( not ( = ?auto_344435 ?auto_344440 ) ) ( not ( = ?auto_344435 ?auto_344441 ) ) ( not ( = ?auto_344435 ?auto_344442 ) ) ( not ( = ?auto_344435 ?auto_344443 ) ) ( not ( = ?auto_344436 ?auto_344437 ) ) ( not ( = ?auto_344436 ?auto_344438 ) ) ( not ( = ?auto_344436 ?auto_344439 ) ) ( not ( = ?auto_344436 ?auto_344440 ) ) ( not ( = ?auto_344436 ?auto_344441 ) ) ( not ( = ?auto_344436 ?auto_344442 ) ) ( not ( = ?auto_344436 ?auto_344443 ) ) ( not ( = ?auto_344437 ?auto_344438 ) ) ( not ( = ?auto_344437 ?auto_344439 ) ) ( not ( = ?auto_344437 ?auto_344440 ) ) ( not ( = ?auto_344437 ?auto_344441 ) ) ( not ( = ?auto_344437 ?auto_344442 ) ) ( not ( = ?auto_344437 ?auto_344443 ) ) ( not ( = ?auto_344438 ?auto_344439 ) ) ( not ( = ?auto_344438 ?auto_344440 ) ) ( not ( = ?auto_344438 ?auto_344441 ) ) ( not ( = ?auto_344438 ?auto_344442 ) ) ( not ( = ?auto_344438 ?auto_344443 ) ) ( not ( = ?auto_344439 ?auto_344440 ) ) ( not ( = ?auto_344439 ?auto_344441 ) ) ( not ( = ?auto_344439 ?auto_344442 ) ) ( not ( = ?auto_344439 ?auto_344443 ) ) ( not ( = ?auto_344440 ?auto_344441 ) ) ( not ( = ?auto_344440 ?auto_344442 ) ) ( not ( = ?auto_344440 ?auto_344443 ) ) ( not ( = ?auto_344441 ?auto_344442 ) ) ( not ( = ?auto_344441 ?auto_344443 ) ) ( not ( = ?auto_344442 ?auto_344443 ) ) ( CLEAR ?auto_344440 ) ( ON ?auto_344441 ?auto_344442 ) ( CLEAR ?auto_344441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_344434 ?auto_344435 ?auto_344436 ?auto_344437 ?auto_344438 ?auto_344439 ?auto_344440 ?auto_344441 )
      ( MAKE-9PILE ?auto_344434 ?auto_344435 ?auto_344436 ?auto_344437 ?auto_344438 ?auto_344439 ?auto_344440 ?auto_344441 ?auto_344442 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_344453 - BLOCK
      ?auto_344454 - BLOCK
      ?auto_344455 - BLOCK
      ?auto_344456 - BLOCK
      ?auto_344457 - BLOCK
      ?auto_344458 - BLOCK
      ?auto_344459 - BLOCK
      ?auto_344460 - BLOCK
      ?auto_344461 - BLOCK
    )
    :vars
    (
      ?auto_344462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344461 ?auto_344462 ) ( ON-TABLE ?auto_344453 ) ( ON ?auto_344454 ?auto_344453 ) ( ON ?auto_344455 ?auto_344454 ) ( ON ?auto_344456 ?auto_344455 ) ( ON ?auto_344457 ?auto_344456 ) ( ON ?auto_344458 ?auto_344457 ) ( not ( = ?auto_344453 ?auto_344454 ) ) ( not ( = ?auto_344453 ?auto_344455 ) ) ( not ( = ?auto_344453 ?auto_344456 ) ) ( not ( = ?auto_344453 ?auto_344457 ) ) ( not ( = ?auto_344453 ?auto_344458 ) ) ( not ( = ?auto_344453 ?auto_344459 ) ) ( not ( = ?auto_344453 ?auto_344460 ) ) ( not ( = ?auto_344453 ?auto_344461 ) ) ( not ( = ?auto_344453 ?auto_344462 ) ) ( not ( = ?auto_344454 ?auto_344455 ) ) ( not ( = ?auto_344454 ?auto_344456 ) ) ( not ( = ?auto_344454 ?auto_344457 ) ) ( not ( = ?auto_344454 ?auto_344458 ) ) ( not ( = ?auto_344454 ?auto_344459 ) ) ( not ( = ?auto_344454 ?auto_344460 ) ) ( not ( = ?auto_344454 ?auto_344461 ) ) ( not ( = ?auto_344454 ?auto_344462 ) ) ( not ( = ?auto_344455 ?auto_344456 ) ) ( not ( = ?auto_344455 ?auto_344457 ) ) ( not ( = ?auto_344455 ?auto_344458 ) ) ( not ( = ?auto_344455 ?auto_344459 ) ) ( not ( = ?auto_344455 ?auto_344460 ) ) ( not ( = ?auto_344455 ?auto_344461 ) ) ( not ( = ?auto_344455 ?auto_344462 ) ) ( not ( = ?auto_344456 ?auto_344457 ) ) ( not ( = ?auto_344456 ?auto_344458 ) ) ( not ( = ?auto_344456 ?auto_344459 ) ) ( not ( = ?auto_344456 ?auto_344460 ) ) ( not ( = ?auto_344456 ?auto_344461 ) ) ( not ( = ?auto_344456 ?auto_344462 ) ) ( not ( = ?auto_344457 ?auto_344458 ) ) ( not ( = ?auto_344457 ?auto_344459 ) ) ( not ( = ?auto_344457 ?auto_344460 ) ) ( not ( = ?auto_344457 ?auto_344461 ) ) ( not ( = ?auto_344457 ?auto_344462 ) ) ( not ( = ?auto_344458 ?auto_344459 ) ) ( not ( = ?auto_344458 ?auto_344460 ) ) ( not ( = ?auto_344458 ?auto_344461 ) ) ( not ( = ?auto_344458 ?auto_344462 ) ) ( not ( = ?auto_344459 ?auto_344460 ) ) ( not ( = ?auto_344459 ?auto_344461 ) ) ( not ( = ?auto_344459 ?auto_344462 ) ) ( not ( = ?auto_344460 ?auto_344461 ) ) ( not ( = ?auto_344460 ?auto_344462 ) ) ( not ( = ?auto_344461 ?auto_344462 ) ) ( ON ?auto_344460 ?auto_344461 ) ( CLEAR ?auto_344458 ) ( ON ?auto_344459 ?auto_344460 ) ( CLEAR ?auto_344459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_344453 ?auto_344454 ?auto_344455 ?auto_344456 ?auto_344457 ?auto_344458 ?auto_344459 )
      ( MAKE-9PILE ?auto_344453 ?auto_344454 ?auto_344455 ?auto_344456 ?auto_344457 ?auto_344458 ?auto_344459 ?auto_344460 ?auto_344461 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_344472 - BLOCK
      ?auto_344473 - BLOCK
      ?auto_344474 - BLOCK
      ?auto_344475 - BLOCK
      ?auto_344476 - BLOCK
      ?auto_344477 - BLOCK
      ?auto_344478 - BLOCK
      ?auto_344479 - BLOCK
      ?auto_344480 - BLOCK
    )
    :vars
    (
      ?auto_344481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344480 ?auto_344481 ) ( ON-TABLE ?auto_344472 ) ( ON ?auto_344473 ?auto_344472 ) ( ON ?auto_344474 ?auto_344473 ) ( ON ?auto_344475 ?auto_344474 ) ( ON ?auto_344476 ?auto_344475 ) ( ON ?auto_344477 ?auto_344476 ) ( not ( = ?auto_344472 ?auto_344473 ) ) ( not ( = ?auto_344472 ?auto_344474 ) ) ( not ( = ?auto_344472 ?auto_344475 ) ) ( not ( = ?auto_344472 ?auto_344476 ) ) ( not ( = ?auto_344472 ?auto_344477 ) ) ( not ( = ?auto_344472 ?auto_344478 ) ) ( not ( = ?auto_344472 ?auto_344479 ) ) ( not ( = ?auto_344472 ?auto_344480 ) ) ( not ( = ?auto_344472 ?auto_344481 ) ) ( not ( = ?auto_344473 ?auto_344474 ) ) ( not ( = ?auto_344473 ?auto_344475 ) ) ( not ( = ?auto_344473 ?auto_344476 ) ) ( not ( = ?auto_344473 ?auto_344477 ) ) ( not ( = ?auto_344473 ?auto_344478 ) ) ( not ( = ?auto_344473 ?auto_344479 ) ) ( not ( = ?auto_344473 ?auto_344480 ) ) ( not ( = ?auto_344473 ?auto_344481 ) ) ( not ( = ?auto_344474 ?auto_344475 ) ) ( not ( = ?auto_344474 ?auto_344476 ) ) ( not ( = ?auto_344474 ?auto_344477 ) ) ( not ( = ?auto_344474 ?auto_344478 ) ) ( not ( = ?auto_344474 ?auto_344479 ) ) ( not ( = ?auto_344474 ?auto_344480 ) ) ( not ( = ?auto_344474 ?auto_344481 ) ) ( not ( = ?auto_344475 ?auto_344476 ) ) ( not ( = ?auto_344475 ?auto_344477 ) ) ( not ( = ?auto_344475 ?auto_344478 ) ) ( not ( = ?auto_344475 ?auto_344479 ) ) ( not ( = ?auto_344475 ?auto_344480 ) ) ( not ( = ?auto_344475 ?auto_344481 ) ) ( not ( = ?auto_344476 ?auto_344477 ) ) ( not ( = ?auto_344476 ?auto_344478 ) ) ( not ( = ?auto_344476 ?auto_344479 ) ) ( not ( = ?auto_344476 ?auto_344480 ) ) ( not ( = ?auto_344476 ?auto_344481 ) ) ( not ( = ?auto_344477 ?auto_344478 ) ) ( not ( = ?auto_344477 ?auto_344479 ) ) ( not ( = ?auto_344477 ?auto_344480 ) ) ( not ( = ?auto_344477 ?auto_344481 ) ) ( not ( = ?auto_344478 ?auto_344479 ) ) ( not ( = ?auto_344478 ?auto_344480 ) ) ( not ( = ?auto_344478 ?auto_344481 ) ) ( not ( = ?auto_344479 ?auto_344480 ) ) ( not ( = ?auto_344479 ?auto_344481 ) ) ( not ( = ?auto_344480 ?auto_344481 ) ) ( ON ?auto_344479 ?auto_344480 ) ( CLEAR ?auto_344477 ) ( ON ?auto_344478 ?auto_344479 ) ( CLEAR ?auto_344478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_344472 ?auto_344473 ?auto_344474 ?auto_344475 ?auto_344476 ?auto_344477 ?auto_344478 )
      ( MAKE-9PILE ?auto_344472 ?auto_344473 ?auto_344474 ?auto_344475 ?auto_344476 ?auto_344477 ?auto_344478 ?auto_344479 ?auto_344480 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_344491 - BLOCK
      ?auto_344492 - BLOCK
      ?auto_344493 - BLOCK
      ?auto_344494 - BLOCK
      ?auto_344495 - BLOCK
      ?auto_344496 - BLOCK
      ?auto_344497 - BLOCK
      ?auto_344498 - BLOCK
      ?auto_344499 - BLOCK
    )
    :vars
    (
      ?auto_344500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344499 ?auto_344500 ) ( ON-TABLE ?auto_344491 ) ( ON ?auto_344492 ?auto_344491 ) ( ON ?auto_344493 ?auto_344492 ) ( ON ?auto_344494 ?auto_344493 ) ( ON ?auto_344495 ?auto_344494 ) ( not ( = ?auto_344491 ?auto_344492 ) ) ( not ( = ?auto_344491 ?auto_344493 ) ) ( not ( = ?auto_344491 ?auto_344494 ) ) ( not ( = ?auto_344491 ?auto_344495 ) ) ( not ( = ?auto_344491 ?auto_344496 ) ) ( not ( = ?auto_344491 ?auto_344497 ) ) ( not ( = ?auto_344491 ?auto_344498 ) ) ( not ( = ?auto_344491 ?auto_344499 ) ) ( not ( = ?auto_344491 ?auto_344500 ) ) ( not ( = ?auto_344492 ?auto_344493 ) ) ( not ( = ?auto_344492 ?auto_344494 ) ) ( not ( = ?auto_344492 ?auto_344495 ) ) ( not ( = ?auto_344492 ?auto_344496 ) ) ( not ( = ?auto_344492 ?auto_344497 ) ) ( not ( = ?auto_344492 ?auto_344498 ) ) ( not ( = ?auto_344492 ?auto_344499 ) ) ( not ( = ?auto_344492 ?auto_344500 ) ) ( not ( = ?auto_344493 ?auto_344494 ) ) ( not ( = ?auto_344493 ?auto_344495 ) ) ( not ( = ?auto_344493 ?auto_344496 ) ) ( not ( = ?auto_344493 ?auto_344497 ) ) ( not ( = ?auto_344493 ?auto_344498 ) ) ( not ( = ?auto_344493 ?auto_344499 ) ) ( not ( = ?auto_344493 ?auto_344500 ) ) ( not ( = ?auto_344494 ?auto_344495 ) ) ( not ( = ?auto_344494 ?auto_344496 ) ) ( not ( = ?auto_344494 ?auto_344497 ) ) ( not ( = ?auto_344494 ?auto_344498 ) ) ( not ( = ?auto_344494 ?auto_344499 ) ) ( not ( = ?auto_344494 ?auto_344500 ) ) ( not ( = ?auto_344495 ?auto_344496 ) ) ( not ( = ?auto_344495 ?auto_344497 ) ) ( not ( = ?auto_344495 ?auto_344498 ) ) ( not ( = ?auto_344495 ?auto_344499 ) ) ( not ( = ?auto_344495 ?auto_344500 ) ) ( not ( = ?auto_344496 ?auto_344497 ) ) ( not ( = ?auto_344496 ?auto_344498 ) ) ( not ( = ?auto_344496 ?auto_344499 ) ) ( not ( = ?auto_344496 ?auto_344500 ) ) ( not ( = ?auto_344497 ?auto_344498 ) ) ( not ( = ?auto_344497 ?auto_344499 ) ) ( not ( = ?auto_344497 ?auto_344500 ) ) ( not ( = ?auto_344498 ?auto_344499 ) ) ( not ( = ?auto_344498 ?auto_344500 ) ) ( not ( = ?auto_344499 ?auto_344500 ) ) ( ON ?auto_344498 ?auto_344499 ) ( ON ?auto_344497 ?auto_344498 ) ( CLEAR ?auto_344495 ) ( ON ?auto_344496 ?auto_344497 ) ( CLEAR ?auto_344496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_344491 ?auto_344492 ?auto_344493 ?auto_344494 ?auto_344495 ?auto_344496 )
      ( MAKE-9PILE ?auto_344491 ?auto_344492 ?auto_344493 ?auto_344494 ?auto_344495 ?auto_344496 ?auto_344497 ?auto_344498 ?auto_344499 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_344510 - BLOCK
      ?auto_344511 - BLOCK
      ?auto_344512 - BLOCK
      ?auto_344513 - BLOCK
      ?auto_344514 - BLOCK
      ?auto_344515 - BLOCK
      ?auto_344516 - BLOCK
      ?auto_344517 - BLOCK
      ?auto_344518 - BLOCK
    )
    :vars
    (
      ?auto_344519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344518 ?auto_344519 ) ( ON-TABLE ?auto_344510 ) ( ON ?auto_344511 ?auto_344510 ) ( ON ?auto_344512 ?auto_344511 ) ( ON ?auto_344513 ?auto_344512 ) ( ON ?auto_344514 ?auto_344513 ) ( not ( = ?auto_344510 ?auto_344511 ) ) ( not ( = ?auto_344510 ?auto_344512 ) ) ( not ( = ?auto_344510 ?auto_344513 ) ) ( not ( = ?auto_344510 ?auto_344514 ) ) ( not ( = ?auto_344510 ?auto_344515 ) ) ( not ( = ?auto_344510 ?auto_344516 ) ) ( not ( = ?auto_344510 ?auto_344517 ) ) ( not ( = ?auto_344510 ?auto_344518 ) ) ( not ( = ?auto_344510 ?auto_344519 ) ) ( not ( = ?auto_344511 ?auto_344512 ) ) ( not ( = ?auto_344511 ?auto_344513 ) ) ( not ( = ?auto_344511 ?auto_344514 ) ) ( not ( = ?auto_344511 ?auto_344515 ) ) ( not ( = ?auto_344511 ?auto_344516 ) ) ( not ( = ?auto_344511 ?auto_344517 ) ) ( not ( = ?auto_344511 ?auto_344518 ) ) ( not ( = ?auto_344511 ?auto_344519 ) ) ( not ( = ?auto_344512 ?auto_344513 ) ) ( not ( = ?auto_344512 ?auto_344514 ) ) ( not ( = ?auto_344512 ?auto_344515 ) ) ( not ( = ?auto_344512 ?auto_344516 ) ) ( not ( = ?auto_344512 ?auto_344517 ) ) ( not ( = ?auto_344512 ?auto_344518 ) ) ( not ( = ?auto_344512 ?auto_344519 ) ) ( not ( = ?auto_344513 ?auto_344514 ) ) ( not ( = ?auto_344513 ?auto_344515 ) ) ( not ( = ?auto_344513 ?auto_344516 ) ) ( not ( = ?auto_344513 ?auto_344517 ) ) ( not ( = ?auto_344513 ?auto_344518 ) ) ( not ( = ?auto_344513 ?auto_344519 ) ) ( not ( = ?auto_344514 ?auto_344515 ) ) ( not ( = ?auto_344514 ?auto_344516 ) ) ( not ( = ?auto_344514 ?auto_344517 ) ) ( not ( = ?auto_344514 ?auto_344518 ) ) ( not ( = ?auto_344514 ?auto_344519 ) ) ( not ( = ?auto_344515 ?auto_344516 ) ) ( not ( = ?auto_344515 ?auto_344517 ) ) ( not ( = ?auto_344515 ?auto_344518 ) ) ( not ( = ?auto_344515 ?auto_344519 ) ) ( not ( = ?auto_344516 ?auto_344517 ) ) ( not ( = ?auto_344516 ?auto_344518 ) ) ( not ( = ?auto_344516 ?auto_344519 ) ) ( not ( = ?auto_344517 ?auto_344518 ) ) ( not ( = ?auto_344517 ?auto_344519 ) ) ( not ( = ?auto_344518 ?auto_344519 ) ) ( ON ?auto_344517 ?auto_344518 ) ( ON ?auto_344516 ?auto_344517 ) ( CLEAR ?auto_344514 ) ( ON ?auto_344515 ?auto_344516 ) ( CLEAR ?auto_344515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_344510 ?auto_344511 ?auto_344512 ?auto_344513 ?auto_344514 ?auto_344515 )
      ( MAKE-9PILE ?auto_344510 ?auto_344511 ?auto_344512 ?auto_344513 ?auto_344514 ?auto_344515 ?auto_344516 ?auto_344517 ?auto_344518 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_344529 - BLOCK
      ?auto_344530 - BLOCK
      ?auto_344531 - BLOCK
      ?auto_344532 - BLOCK
      ?auto_344533 - BLOCK
      ?auto_344534 - BLOCK
      ?auto_344535 - BLOCK
      ?auto_344536 - BLOCK
      ?auto_344537 - BLOCK
    )
    :vars
    (
      ?auto_344538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344537 ?auto_344538 ) ( ON-TABLE ?auto_344529 ) ( ON ?auto_344530 ?auto_344529 ) ( ON ?auto_344531 ?auto_344530 ) ( ON ?auto_344532 ?auto_344531 ) ( not ( = ?auto_344529 ?auto_344530 ) ) ( not ( = ?auto_344529 ?auto_344531 ) ) ( not ( = ?auto_344529 ?auto_344532 ) ) ( not ( = ?auto_344529 ?auto_344533 ) ) ( not ( = ?auto_344529 ?auto_344534 ) ) ( not ( = ?auto_344529 ?auto_344535 ) ) ( not ( = ?auto_344529 ?auto_344536 ) ) ( not ( = ?auto_344529 ?auto_344537 ) ) ( not ( = ?auto_344529 ?auto_344538 ) ) ( not ( = ?auto_344530 ?auto_344531 ) ) ( not ( = ?auto_344530 ?auto_344532 ) ) ( not ( = ?auto_344530 ?auto_344533 ) ) ( not ( = ?auto_344530 ?auto_344534 ) ) ( not ( = ?auto_344530 ?auto_344535 ) ) ( not ( = ?auto_344530 ?auto_344536 ) ) ( not ( = ?auto_344530 ?auto_344537 ) ) ( not ( = ?auto_344530 ?auto_344538 ) ) ( not ( = ?auto_344531 ?auto_344532 ) ) ( not ( = ?auto_344531 ?auto_344533 ) ) ( not ( = ?auto_344531 ?auto_344534 ) ) ( not ( = ?auto_344531 ?auto_344535 ) ) ( not ( = ?auto_344531 ?auto_344536 ) ) ( not ( = ?auto_344531 ?auto_344537 ) ) ( not ( = ?auto_344531 ?auto_344538 ) ) ( not ( = ?auto_344532 ?auto_344533 ) ) ( not ( = ?auto_344532 ?auto_344534 ) ) ( not ( = ?auto_344532 ?auto_344535 ) ) ( not ( = ?auto_344532 ?auto_344536 ) ) ( not ( = ?auto_344532 ?auto_344537 ) ) ( not ( = ?auto_344532 ?auto_344538 ) ) ( not ( = ?auto_344533 ?auto_344534 ) ) ( not ( = ?auto_344533 ?auto_344535 ) ) ( not ( = ?auto_344533 ?auto_344536 ) ) ( not ( = ?auto_344533 ?auto_344537 ) ) ( not ( = ?auto_344533 ?auto_344538 ) ) ( not ( = ?auto_344534 ?auto_344535 ) ) ( not ( = ?auto_344534 ?auto_344536 ) ) ( not ( = ?auto_344534 ?auto_344537 ) ) ( not ( = ?auto_344534 ?auto_344538 ) ) ( not ( = ?auto_344535 ?auto_344536 ) ) ( not ( = ?auto_344535 ?auto_344537 ) ) ( not ( = ?auto_344535 ?auto_344538 ) ) ( not ( = ?auto_344536 ?auto_344537 ) ) ( not ( = ?auto_344536 ?auto_344538 ) ) ( not ( = ?auto_344537 ?auto_344538 ) ) ( ON ?auto_344536 ?auto_344537 ) ( ON ?auto_344535 ?auto_344536 ) ( ON ?auto_344534 ?auto_344535 ) ( CLEAR ?auto_344532 ) ( ON ?auto_344533 ?auto_344534 ) ( CLEAR ?auto_344533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_344529 ?auto_344530 ?auto_344531 ?auto_344532 ?auto_344533 )
      ( MAKE-9PILE ?auto_344529 ?auto_344530 ?auto_344531 ?auto_344532 ?auto_344533 ?auto_344534 ?auto_344535 ?auto_344536 ?auto_344537 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_344548 - BLOCK
      ?auto_344549 - BLOCK
      ?auto_344550 - BLOCK
      ?auto_344551 - BLOCK
      ?auto_344552 - BLOCK
      ?auto_344553 - BLOCK
      ?auto_344554 - BLOCK
      ?auto_344555 - BLOCK
      ?auto_344556 - BLOCK
    )
    :vars
    (
      ?auto_344557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344556 ?auto_344557 ) ( ON-TABLE ?auto_344548 ) ( ON ?auto_344549 ?auto_344548 ) ( ON ?auto_344550 ?auto_344549 ) ( ON ?auto_344551 ?auto_344550 ) ( not ( = ?auto_344548 ?auto_344549 ) ) ( not ( = ?auto_344548 ?auto_344550 ) ) ( not ( = ?auto_344548 ?auto_344551 ) ) ( not ( = ?auto_344548 ?auto_344552 ) ) ( not ( = ?auto_344548 ?auto_344553 ) ) ( not ( = ?auto_344548 ?auto_344554 ) ) ( not ( = ?auto_344548 ?auto_344555 ) ) ( not ( = ?auto_344548 ?auto_344556 ) ) ( not ( = ?auto_344548 ?auto_344557 ) ) ( not ( = ?auto_344549 ?auto_344550 ) ) ( not ( = ?auto_344549 ?auto_344551 ) ) ( not ( = ?auto_344549 ?auto_344552 ) ) ( not ( = ?auto_344549 ?auto_344553 ) ) ( not ( = ?auto_344549 ?auto_344554 ) ) ( not ( = ?auto_344549 ?auto_344555 ) ) ( not ( = ?auto_344549 ?auto_344556 ) ) ( not ( = ?auto_344549 ?auto_344557 ) ) ( not ( = ?auto_344550 ?auto_344551 ) ) ( not ( = ?auto_344550 ?auto_344552 ) ) ( not ( = ?auto_344550 ?auto_344553 ) ) ( not ( = ?auto_344550 ?auto_344554 ) ) ( not ( = ?auto_344550 ?auto_344555 ) ) ( not ( = ?auto_344550 ?auto_344556 ) ) ( not ( = ?auto_344550 ?auto_344557 ) ) ( not ( = ?auto_344551 ?auto_344552 ) ) ( not ( = ?auto_344551 ?auto_344553 ) ) ( not ( = ?auto_344551 ?auto_344554 ) ) ( not ( = ?auto_344551 ?auto_344555 ) ) ( not ( = ?auto_344551 ?auto_344556 ) ) ( not ( = ?auto_344551 ?auto_344557 ) ) ( not ( = ?auto_344552 ?auto_344553 ) ) ( not ( = ?auto_344552 ?auto_344554 ) ) ( not ( = ?auto_344552 ?auto_344555 ) ) ( not ( = ?auto_344552 ?auto_344556 ) ) ( not ( = ?auto_344552 ?auto_344557 ) ) ( not ( = ?auto_344553 ?auto_344554 ) ) ( not ( = ?auto_344553 ?auto_344555 ) ) ( not ( = ?auto_344553 ?auto_344556 ) ) ( not ( = ?auto_344553 ?auto_344557 ) ) ( not ( = ?auto_344554 ?auto_344555 ) ) ( not ( = ?auto_344554 ?auto_344556 ) ) ( not ( = ?auto_344554 ?auto_344557 ) ) ( not ( = ?auto_344555 ?auto_344556 ) ) ( not ( = ?auto_344555 ?auto_344557 ) ) ( not ( = ?auto_344556 ?auto_344557 ) ) ( ON ?auto_344555 ?auto_344556 ) ( ON ?auto_344554 ?auto_344555 ) ( ON ?auto_344553 ?auto_344554 ) ( CLEAR ?auto_344551 ) ( ON ?auto_344552 ?auto_344553 ) ( CLEAR ?auto_344552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_344548 ?auto_344549 ?auto_344550 ?auto_344551 ?auto_344552 )
      ( MAKE-9PILE ?auto_344548 ?auto_344549 ?auto_344550 ?auto_344551 ?auto_344552 ?auto_344553 ?auto_344554 ?auto_344555 ?auto_344556 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_344567 - BLOCK
      ?auto_344568 - BLOCK
      ?auto_344569 - BLOCK
      ?auto_344570 - BLOCK
      ?auto_344571 - BLOCK
      ?auto_344572 - BLOCK
      ?auto_344573 - BLOCK
      ?auto_344574 - BLOCK
      ?auto_344575 - BLOCK
    )
    :vars
    (
      ?auto_344576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344575 ?auto_344576 ) ( ON-TABLE ?auto_344567 ) ( ON ?auto_344568 ?auto_344567 ) ( ON ?auto_344569 ?auto_344568 ) ( not ( = ?auto_344567 ?auto_344568 ) ) ( not ( = ?auto_344567 ?auto_344569 ) ) ( not ( = ?auto_344567 ?auto_344570 ) ) ( not ( = ?auto_344567 ?auto_344571 ) ) ( not ( = ?auto_344567 ?auto_344572 ) ) ( not ( = ?auto_344567 ?auto_344573 ) ) ( not ( = ?auto_344567 ?auto_344574 ) ) ( not ( = ?auto_344567 ?auto_344575 ) ) ( not ( = ?auto_344567 ?auto_344576 ) ) ( not ( = ?auto_344568 ?auto_344569 ) ) ( not ( = ?auto_344568 ?auto_344570 ) ) ( not ( = ?auto_344568 ?auto_344571 ) ) ( not ( = ?auto_344568 ?auto_344572 ) ) ( not ( = ?auto_344568 ?auto_344573 ) ) ( not ( = ?auto_344568 ?auto_344574 ) ) ( not ( = ?auto_344568 ?auto_344575 ) ) ( not ( = ?auto_344568 ?auto_344576 ) ) ( not ( = ?auto_344569 ?auto_344570 ) ) ( not ( = ?auto_344569 ?auto_344571 ) ) ( not ( = ?auto_344569 ?auto_344572 ) ) ( not ( = ?auto_344569 ?auto_344573 ) ) ( not ( = ?auto_344569 ?auto_344574 ) ) ( not ( = ?auto_344569 ?auto_344575 ) ) ( not ( = ?auto_344569 ?auto_344576 ) ) ( not ( = ?auto_344570 ?auto_344571 ) ) ( not ( = ?auto_344570 ?auto_344572 ) ) ( not ( = ?auto_344570 ?auto_344573 ) ) ( not ( = ?auto_344570 ?auto_344574 ) ) ( not ( = ?auto_344570 ?auto_344575 ) ) ( not ( = ?auto_344570 ?auto_344576 ) ) ( not ( = ?auto_344571 ?auto_344572 ) ) ( not ( = ?auto_344571 ?auto_344573 ) ) ( not ( = ?auto_344571 ?auto_344574 ) ) ( not ( = ?auto_344571 ?auto_344575 ) ) ( not ( = ?auto_344571 ?auto_344576 ) ) ( not ( = ?auto_344572 ?auto_344573 ) ) ( not ( = ?auto_344572 ?auto_344574 ) ) ( not ( = ?auto_344572 ?auto_344575 ) ) ( not ( = ?auto_344572 ?auto_344576 ) ) ( not ( = ?auto_344573 ?auto_344574 ) ) ( not ( = ?auto_344573 ?auto_344575 ) ) ( not ( = ?auto_344573 ?auto_344576 ) ) ( not ( = ?auto_344574 ?auto_344575 ) ) ( not ( = ?auto_344574 ?auto_344576 ) ) ( not ( = ?auto_344575 ?auto_344576 ) ) ( ON ?auto_344574 ?auto_344575 ) ( ON ?auto_344573 ?auto_344574 ) ( ON ?auto_344572 ?auto_344573 ) ( ON ?auto_344571 ?auto_344572 ) ( CLEAR ?auto_344569 ) ( ON ?auto_344570 ?auto_344571 ) ( CLEAR ?auto_344570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_344567 ?auto_344568 ?auto_344569 ?auto_344570 )
      ( MAKE-9PILE ?auto_344567 ?auto_344568 ?auto_344569 ?auto_344570 ?auto_344571 ?auto_344572 ?auto_344573 ?auto_344574 ?auto_344575 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_344586 - BLOCK
      ?auto_344587 - BLOCK
      ?auto_344588 - BLOCK
      ?auto_344589 - BLOCK
      ?auto_344590 - BLOCK
      ?auto_344591 - BLOCK
      ?auto_344592 - BLOCK
      ?auto_344593 - BLOCK
      ?auto_344594 - BLOCK
    )
    :vars
    (
      ?auto_344595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344594 ?auto_344595 ) ( ON-TABLE ?auto_344586 ) ( ON ?auto_344587 ?auto_344586 ) ( ON ?auto_344588 ?auto_344587 ) ( not ( = ?auto_344586 ?auto_344587 ) ) ( not ( = ?auto_344586 ?auto_344588 ) ) ( not ( = ?auto_344586 ?auto_344589 ) ) ( not ( = ?auto_344586 ?auto_344590 ) ) ( not ( = ?auto_344586 ?auto_344591 ) ) ( not ( = ?auto_344586 ?auto_344592 ) ) ( not ( = ?auto_344586 ?auto_344593 ) ) ( not ( = ?auto_344586 ?auto_344594 ) ) ( not ( = ?auto_344586 ?auto_344595 ) ) ( not ( = ?auto_344587 ?auto_344588 ) ) ( not ( = ?auto_344587 ?auto_344589 ) ) ( not ( = ?auto_344587 ?auto_344590 ) ) ( not ( = ?auto_344587 ?auto_344591 ) ) ( not ( = ?auto_344587 ?auto_344592 ) ) ( not ( = ?auto_344587 ?auto_344593 ) ) ( not ( = ?auto_344587 ?auto_344594 ) ) ( not ( = ?auto_344587 ?auto_344595 ) ) ( not ( = ?auto_344588 ?auto_344589 ) ) ( not ( = ?auto_344588 ?auto_344590 ) ) ( not ( = ?auto_344588 ?auto_344591 ) ) ( not ( = ?auto_344588 ?auto_344592 ) ) ( not ( = ?auto_344588 ?auto_344593 ) ) ( not ( = ?auto_344588 ?auto_344594 ) ) ( not ( = ?auto_344588 ?auto_344595 ) ) ( not ( = ?auto_344589 ?auto_344590 ) ) ( not ( = ?auto_344589 ?auto_344591 ) ) ( not ( = ?auto_344589 ?auto_344592 ) ) ( not ( = ?auto_344589 ?auto_344593 ) ) ( not ( = ?auto_344589 ?auto_344594 ) ) ( not ( = ?auto_344589 ?auto_344595 ) ) ( not ( = ?auto_344590 ?auto_344591 ) ) ( not ( = ?auto_344590 ?auto_344592 ) ) ( not ( = ?auto_344590 ?auto_344593 ) ) ( not ( = ?auto_344590 ?auto_344594 ) ) ( not ( = ?auto_344590 ?auto_344595 ) ) ( not ( = ?auto_344591 ?auto_344592 ) ) ( not ( = ?auto_344591 ?auto_344593 ) ) ( not ( = ?auto_344591 ?auto_344594 ) ) ( not ( = ?auto_344591 ?auto_344595 ) ) ( not ( = ?auto_344592 ?auto_344593 ) ) ( not ( = ?auto_344592 ?auto_344594 ) ) ( not ( = ?auto_344592 ?auto_344595 ) ) ( not ( = ?auto_344593 ?auto_344594 ) ) ( not ( = ?auto_344593 ?auto_344595 ) ) ( not ( = ?auto_344594 ?auto_344595 ) ) ( ON ?auto_344593 ?auto_344594 ) ( ON ?auto_344592 ?auto_344593 ) ( ON ?auto_344591 ?auto_344592 ) ( ON ?auto_344590 ?auto_344591 ) ( CLEAR ?auto_344588 ) ( ON ?auto_344589 ?auto_344590 ) ( CLEAR ?auto_344589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_344586 ?auto_344587 ?auto_344588 ?auto_344589 )
      ( MAKE-9PILE ?auto_344586 ?auto_344587 ?auto_344588 ?auto_344589 ?auto_344590 ?auto_344591 ?auto_344592 ?auto_344593 ?auto_344594 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_344605 - BLOCK
      ?auto_344606 - BLOCK
      ?auto_344607 - BLOCK
      ?auto_344608 - BLOCK
      ?auto_344609 - BLOCK
      ?auto_344610 - BLOCK
      ?auto_344611 - BLOCK
      ?auto_344612 - BLOCK
      ?auto_344613 - BLOCK
    )
    :vars
    (
      ?auto_344614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344613 ?auto_344614 ) ( ON-TABLE ?auto_344605 ) ( ON ?auto_344606 ?auto_344605 ) ( not ( = ?auto_344605 ?auto_344606 ) ) ( not ( = ?auto_344605 ?auto_344607 ) ) ( not ( = ?auto_344605 ?auto_344608 ) ) ( not ( = ?auto_344605 ?auto_344609 ) ) ( not ( = ?auto_344605 ?auto_344610 ) ) ( not ( = ?auto_344605 ?auto_344611 ) ) ( not ( = ?auto_344605 ?auto_344612 ) ) ( not ( = ?auto_344605 ?auto_344613 ) ) ( not ( = ?auto_344605 ?auto_344614 ) ) ( not ( = ?auto_344606 ?auto_344607 ) ) ( not ( = ?auto_344606 ?auto_344608 ) ) ( not ( = ?auto_344606 ?auto_344609 ) ) ( not ( = ?auto_344606 ?auto_344610 ) ) ( not ( = ?auto_344606 ?auto_344611 ) ) ( not ( = ?auto_344606 ?auto_344612 ) ) ( not ( = ?auto_344606 ?auto_344613 ) ) ( not ( = ?auto_344606 ?auto_344614 ) ) ( not ( = ?auto_344607 ?auto_344608 ) ) ( not ( = ?auto_344607 ?auto_344609 ) ) ( not ( = ?auto_344607 ?auto_344610 ) ) ( not ( = ?auto_344607 ?auto_344611 ) ) ( not ( = ?auto_344607 ?auto_344612 ) ) ( not ( = ?auto_344607 ?auto_344613 ) ) ( not ( = ?auto_344607 ?auto_344614 ) ) ( not ( = ?auto_344608 ?auto_344609 ) ) ( not ( = ?auto_344608 ?auto_344610 ) ) ( not ( = ?auto_344608 ?auto_344611 ) ) ( not ( = ?auto_344608 ?auto_344612 ) ) ( not ( = ?auto_344608 ?auto_344613 ) ) ( not ( = ?auto_344608 ?auto_344614 ) ) ( not ( = ?auto_344609 ?auto_344610 ) ) ( not ( = ?auto_344609 ?auto_344611 ) ) ( not ( = ?auto_344609 ?auto_344612 ) ) ( not ( = ?auto_344609 ?auto_344613 ) ) ( not ( = ?auto_344609 ?auto_344614 ) ) ( not ( = ?auto_344610 ?auto_344611 ) ) ( not ( = ?auto_344610 ?auto_344612 ) ) ( not ( = ?auto_344610 ?auto_344613 ) ) ( not ( = ?auto_344610 ?auto_344614 ) ) ( not ( = ?auto_344611 ?auto_344612 ) ) ( not ( = ?auto_344611 ?auto_344613 ) ) ( not ( = ?auto_344611 ?auto_344614 ) ) ( not ( = ?auto_344612 ?auto_344613 ) ) ( not ( = ?auto_344612 ?auto_344614 ) ) ( not ( = ?auto_344613 ?auto_344614 ) ) ( ON ?auto_344612 ?auto_344613 ) ( ON ?auto_344611 ?auto_344612 ) ( ON ?auto_344610 ?auto_344611 ) ( ON ?auto_344609 ?auto_344610 ) ( ON ?auto_344608 ?auto_344609 ) ( CLEAR ?auto_344606 ) ( ON ?auto_344607 ?auto_344608 ) ( CLEAR ?auto_344607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_344605 ?auto_344606 ?auto_344607 )
      ( MAKE-9PILE ?auto_344605 ?auto_344606 ?auto_344607 ?auto_344608 ?auto_344609 ?auto_344610 ?auto_344611 ?auto_344612 ?auto_344613 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_344624 - BLOCK
      ?auto_344625 - BLOCK
      ?auto_344626 - BLOCK
      ?auto_344627 - BLOCK
      ?auto_344628 - BLOCK
      ?auto_344629 - BLOCK
      ?auto_344630 - BLOCK
      ?auto_344631 - BLOCK
      ?auto_344632 - BLOCK
    )
    :vars
    (
      ?auto_344633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344632 ?auto_344633 ) ( ON-TABLE ?auto_344624 ) ( ON ?auto_344625 ?auto_344624 ) ( not ( = ?auto_344624 ?auto_344625 ) ) ( not ( = ?auto_344624 ?auto_344626 ) ) ( not ( = ?auto_344624 ?auto_344627 ) ) ( not ( = ?auto_344624 ?auto_344628 ) ) ( not ( = ?auto_344624 ?auto_344629 ) ) ( not ( = ?auto_344624 ?auto_344630 ) ) ( not ( = ?auto_344624 ?auto_344631 ) ) ( not ( = ?auto_344624 ?auto_344632 ) ) ( not ( = ?auto_344624 ?auto_344633 ) ) ( not ( = ?auto_344625 ?auto_344626 ) ) ( not ( = ?auto_344625 ?auto_344627 ) ) ( not ( = ?auto_344625 ?auto_344628 ) ) ( not ( = ?auto_344625 ?auto_344629 ) ) ( not ( = ?auto_344625 ?auto_344630 ) ) ( not ( = ?auto_344625 ?auto_344631 ) ) ( not ( = ?auto_344625 ?auto_344632 ) ) ( not ( = ?auto_344625 ?auto_344633 ) ) ( not ( = ?auto_344626 ?auto_344627 ) ) ( not ( = ?auto_344626 ?auto_344628 ) ) ( not ( = ?auto_344626 ?auto_344629 ) ) ( not ( = ?auto_344626 ?auto_344630 ) ) ( not ( = ?auto_344626 ?auto_344631 ) ) ( not ( = ?auto_344626 ?auto_344632 ) ) ( not ( = ?auto_344626 ?auto_344633 ) ) ( not ( = ?auto_344627 ?auto_344628 ) ) ( not ( = ?auto_344627 ?auto_344629 ) ) ( not ( = ?auto_344627 ?auto_344630 ) ) ( not ( = ?auto_344627 ?auto_344631 ) ) ( not ( = ?auto_344627 ?auto_344632 ) ) ( not ( = ?auto_344627 ?auto_344633 ) ) ( not ( = ?auto_344628 ?auto_344629 ) ) ( not ( = ?auto_344628 ?auto_344630 ) ) ( not ( = ?auto_344628 ?auto_344631 ) ) ( not ( = ?auto_344628 ?auto_344632 ) ) ( not ( = ?auto_344628 ?auto_344633 ) ) ( not ( = ?auto_344629 ?auto_344630 ) ) ( not ( = ?auto_344629 ?auto_344631 ) ) ( not ( = ?auto_344629 ?auto_344632 ) ) ( not ( = ?auto_344629 ?auto_344633 ) ) ( not ( = ?auto_344630 ?auto_344631 ) ) ( not ( = ?auto_344630 ?auto_344632 ) ) ( not ( = ?auto_344630 ?auto_344633 ) ) ( not ( = ?auto_344631 ?auto_344632 ) ) ( not ( = ?auto_344631 ?auto_344633 ) ) ( not ( = ?auto_344632 ?auto_344633 ) ) ( ON ?auto_344631 ?auto_344632 ) ( ON ?auto_344630 ?auto_344631 ) ( ON ?auto_344629 ?auto_344630 ) ( ON ?auto_344628 ?auto_344629 ) ( ON ?auto_344627 ?auto_344628 ) ( CLEAR ?auto_344625 ) ( ON ?auto_344626 ?auto_344627 ) ( CLEAR ?auto_344626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_344624 ?auto_344625 ?auto_344626 )
      ( MAKE-9PILE ?auto_344624 ?auto_344625 ?auto_344626 ?auto_344627 ?auto_344628 ?auto_344629 ?auto_344630 ?auto_344631 ?auto_344632 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_344643 - BLOCK
      ?auto_344644 - BLOCK
      ?auto_344645 - BLOCK
      ?auto_344646 - BLOCK
      ?auto_344647 - BLOCK
      ?auto_344648 - BLOCK
      ?auto_344649 - BLOCK
      ?auto_344650 - BLOCK
      ?auto_344651 - BLOCK
    )
    :vars
    (
      ?auto_344652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344651 ?auto_344652 ) ( ON-TABLE ?auto_344643 ) ( not ( = ?auto_344643 ?auto_344644 ) ) ( not ( = ?auto_344643 ?auto_344645 ) ) ( not ( = ?auto_344643 ?auto_344646 ) ) ( not ( = ?auto_344643 ?auto_344647 ) ) ( not ( = ?auto_344643 ?auto_344648 ) ) ( not ( = ?auto_344643 ?auto_344649 ) ) ( not ( = ?auto_344643 ?auto_344650 ) ) ( not ( = ?auto_344643 ?auto_344651 ) ) ( not ( = ?auto_344643 ?auto_344652 ) ) ( not ( = ?auto_344644 ?auto_344645 ) ) ( not ( = ?auto_344644 ?auto_344646 ) ) ( not ( = ?auto_344644 ?auto_344647 ) ) ( not ( = ?auto_344644 ?auto_344648 ) ) ( not ( = ?auto_344644 ?auto_344649 ) ) ( not ( = ?auto_344644 ?auto_344650 ) ) ( not ( = ?auto_344644 ?auto_344651 ) ) ( not ( = ?auto_344644 ?auto_344652 ) ) ( not ( = ?auto_344645 ?auto_344646 ) ) ( not ( = ?auto_344645 ?auto_344647 ) ) ( not ( = ?auto_344645 ?auto_344648 ) ) ( not ( = ?auto_344645 ?auto_344649 ) ) ( not ( = ?auto_344645 ?auto_344650 ) ) ( not ( = ?auto_344645 ?auto_344651 ) ) ( not ( = ?auto_344645 ?auto_344652 ) ) ( not ( = ?auto_344646 ?auto_344647 ) ) ( not ( = ?auto_344646 ?auto_344648 ) ) ( not ( = ?auto_344646 ?auto_344649 ) ) ( not ( = ?auto_344646 ?auto_344650 ) ) ( not ( = ?auto_344646 ?auto_344651 ) ) ( not ( = ?auto_344646 ?auto_344652 ) ) ( not ( = ?auto_344647 ?auto_344648 ) ) ( not ( = ?auto_344647 ?auto_344649 ) ) ( not ( = ?auto_344647 ?auto_344650 ) ) ( not ( = ?auto_344647 ?auto_344651 ) ) ( not ( = ?auto_344647 ?auto_344652 ) ) ( not ( = ?auto_344648 ?auto_344649 ) ) ( not ( = ?auto_344648 ?auto_344650 ) ) ( not ( = ?auto_344648 ?auto_344651 ) ) ( not ( = ?auto_344648 ?auto_344652 ) ) ( not ( = ?auto_344649 ?auto_344650 ) ) ( not ( = ?auto_344649 ?auto_344651 ) ) ( not ( = ?auto_344649 ?auto_344652 ) ) ( not ( = ?auto_344650 ?auto_344651 ) ) ( not ( = ?auto_344650 ?auto_344652 ) ) ( not ( = ?auto_344651 ?auto_344652 ) ) ( ON ?auto_344650 ?auto_344651 ) ( ON ?auto_344649 ?auto_344650 ) ( ON ?auto_344648 ?auto_344649 ) ( ON ?auto_344647 ?auto_344648 ) ( ON ?auto_344646 ?auto_344647 ) ( ON ?auto_344645 ?auto_344646 ) ( CLEAR ?auto_344643 ) ( ON ?auto_344644 ?auto_344645 ) ( CLEAR ?auto_344644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_344643 ?auto_344644 )
      ( MAKE-9PILE ?auto_344643 ?auto_344644 ?auto_344645 ?auto_344646 ?auto_344647 ?auto_344648 ?auto_344649 ?auto_344650 ?auto_344651 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_344662 - BLOCK
      ?auto_344663 - BLOCK
      ?auto_344664 - BLOCK
      ?auto_344665 - BLOCK
      ?auto_344666 - BLOCK
      ?auto_344667 - BLOCK
      ?auto_344668 - BLOCK
      ?auto_344669 - BLOCK
      ?auto_344670 - BLOCK
    )
    :vars
    (
      ?auto_344671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344670 ?auto_344671 ) ( ON-TABLE ?auto_344662 ) ( not ( = ?auto_344662 ?auto_344663 ) ) ( not ( = ?auto_344662 ?auto_344664 ) ) ( not ( = ?auto_344662 ?auto_344665 ) ) ( not ( = ?auto_344662 ?auto_344666 ) ) ( not ( = ?auto_344662 ?auto_344667 ) ) ( not ( = ?auto_344662 ?auto_344668 ) ) ( not ( = ?auto_344662 ?auto_344669 ) ) ( not ( = ?auto_344662 ?auto_344670 ) ) ( not ( = ?auto_344662 ?auto_344671 ) ) ( not ( = ?auto_344663 ?auto_344664 ) ) ( not ( = ?auto_344663 ?auto_344665 ) ) ( not ( = ?auto_344663 ?auto_344666 ) ) ( not ( = ?auto_344663 ?auto_344667 ) ) ( not ( = ?auto_344663 ?auto_344668 ) ) ( not ( = ?auto_344663 ?auto_344669 ) ) ( not ( = ?auto_344663 ?auto_344670 ) ) ( not ( = ?auto_344663 ?auto_344671 ) ) ( not ( = ?auto_344664 ?auto_344665 ) ) ( not ( = ?auto_344664 ?auto_344666 ) ) ( not ( = ?auto_344664 ?auto_344667 ) ) ( not ( = ?auto_344664 ?auto_344668 ) ) ( not ( = ?auto_344664 ?auto_344669 ) ) ( not ( = ?auto_344664 ?auto_344670 ) ) ( not ( = ?auto_344664 ?auto_344671 ) ) ( not ( = ?auto_344665 ?auto_344666 ) ) ( not ( = ?auto_344665 ?auto_344667 ) ) ( not ( = ?auto_344665 ?auto_344668 ) ) ( not ( = ?auto_344665 ?auto_344669 ) ) ( not ( = ?auto_344665 ?auto_344670 ) ) ( not ( = ?auto_344665 ?auto_344671 ) ) ( not ( = ?auto_344666 ?auto_344667 ) ) ( not ( = ?auto_344666 ?auto_344668 ) ) ( not ( = ?auto_344666 ?auto_344669 ) ) ( not ( = ?auto_344666 ?auto_344670 ) ) ( not ( = ?auto_344666 ?auto_344671 ) ) ( not ( = ?auto_344667 ?auto_344668 ) ) ( not ( = ?auto_344667 ?auto_344669 ) ) ( not ( = ?auto_344667 ?auto_344670 ) ) ( not ( = ?auto_344667 ?auto_344671 ) ) ( not ( = ?auto_344668 ?auto_344669 ) ) ( not ( = ?auto_344668 ?auto_344670 ) ) ( not ( = ?auto_344668 ?auto_344671 ) ) ( not ( = ?auto_344669 ?auto_344670 ) ) ( not ( = ?auto_344669 ?auto_344671 ) ) ( not ( = ?auto_344670 ?auto_344671 ) ) ( ON ?auto_344669 ?auto_344670 ) ( ON ?auto_344668 ?auto_344669 ) ( ON ?auto_344667 ?auto_344668 ) ( ON ?auto_344666 ?auto_344667 ) ( ON ?auto_344665 ?auto_344666 ) ( ON ?auto_344664 ?auto_344665 ) ( CLEAR ?auto_344662 ) ( ON ?auto_344663 ?auto_344664 ) ( CLEAR ?auto_344663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_344662 ?auto_344663 )
      ( MAKE-9PILE ?auto_344662 ?auto_344663 ?auto_344664 ?auto_344665 ?auto_344666 ?auto_344667 ?auto_344668 ?auto_344669 ?auto_344670 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_344681 - BLOCK
      ?auto_344682 - BLOCK
      ?auto_344683 - BLOCK
      ?auto_344684 - BLOCK
      ?auto_344685 - BLOCK
      ?auto_344686 - BLOCK
      ?auto_344687 - BLOCK
      ?auto_344688 - BLOCK
      ?auto_344689 - BLOCK
    )
    :vars
    (
      ?auto_344690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344689 ?auto_344690 ) ( not ( = ?auto_344681 ?auto_344682 ) ) ( not ( = ?auto_344681 ?auto_344683 ) ) ( not ( = ?auto_344681 ?auto_344684 ) ) ( not ( = ?auto_344681 ?auto_344685 ) ) ( not ( = ?auto_344681 ?auto_344686 ) ) ( not ( = ?auto_344681 ?auto_344687 ) ) ( not ( = ?auto_344681 ?auto_344688 ) ) ( not ( = ?auto_344681 ?auto_344689 ) ) ( not ( = ?auto_344681 ?auto_344690 ) ) ( not ( = ?auto_344682 ?auto_344683 ) ) ( not ( = ?auto_344682 ?auto_344684 ) ) ( not ( = ?auto_344682 ?auto_344685 ) ) ( not ( = ?auto_344682 ?auto_344686 ) ) ( not ( = ?auto_344682 ?auto_344687 ) ) ( not ( = ?auto_344682 ?auto_344688 ) ) ( not ( = ?auto_344682 ?auto_344689 ) ) ( not ( = ?auto_344682 ?auto_344690 ) ) ( not ( = ?auto_344683 ?auto_344684 ) ) ( not ( = ?auto_344683 ?auto_344685 ) ) ( not ( = ?auto_344683 ?auto_344686 ) ) ( not ( = ?auto_344683 ?auto_344687 ) ) ( not ( = ?auto_344683 ?auto_344688 ) ) ( not ( = ?auto_344683 ?auto_344689 ) ) ( not ( = ?auto_344683 ?auto_344690 ) ) ( not ( = ?auto_344684 ?auto_344685 ) ) ( not ( = ?auto_344684 ?auto_344686 ) ) ( not ( = ?auto_344684 ?auto_344687 ) ) ( not ( = ?auto_344684 ?auto_344688 ) ) ( not ( = ?auto_344684 ?auto_344689 ) ) ( not ( = ?auto_344684 ?auto_344690 ) ) ( not ( = ?auto_344685 ?auto_344686 ) ) ( not ( = ?auto_344685 ?auto_344687 ) ) ( not ( = ?auto_344685 ?auto_344688 ) ) ( not ( = ?auto_344685 ?auto_344689 ) ) ( not ( = ?auto_344685 ?auto_344690 ) ) ( not ( = ?auto_344686 ?auto_344687 ) ) ( not ( = ?auto_344686 ?auto_344688 ) ) ( not ( = ?auto_344686 ?auto_344689 ) ) ( not ( = ?auto_344686 ?auto_344690 ) ) ( not ( = ?auto_344687 ?auto_344688 ) ) ( not ( = ?auto_344687 ?auto_344689 ) ) ( not ( = ?auto_344687 ?auto_344690 ) ) ( not ( = ?auto_344688 ?auto_344689 ) ) ( not ( = ?auto_344688 ?auto_344690 ) ) ( not ( = ?auto_344689 ?auto_344690 ) ) ( ON ?auto_344688 ?auto_344689 ) ( ON ?auto_344687 ?auto_344688 ) ( ON ?auto_344686 ?auto_344687 ) ( ON ?auto_344685 ?auto_344686 ) ( ON ?auto_344684 ?auto_344685 ) ( ON ?auto_344683 ?auto_344684 ) ( ON ?auto_344682 ?auto_344683 ) ( ON ?auto_344681 ?auto_344682 ) ( CLEAR ?auto_344681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_344681 )
      ( MAKE-9PILE ?auto_344681 ?auto_344682 ?auto_344683 ?auto_344684 ?auto_344685 ?auto_344686 ?auto_344687 ?auto_344688 ?auto_344689 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_344700 - BLOCK
      ?auto_344701 - BLOCK
      ?auto_344702 - BLOCK
      ?auto_344703 - BLOCK
      ?auto_344704 - BLOCK
      ?auto_344705 - BLOCK
      ?auto_344706 - BLOCK
      ?auto_344707 - BLOCK
      ?auto_344708 - BLOCK
    )
    :vars
    (
      ?auto_344709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344708 ?auto_344709 ) ( not ( = ?auto_344700 ?auto_344701 ) ) ( not ( = ?auto_344700 ?auto_344702 ) ) ( not ( = ?auto_344700 ?auto_344703 ) ) ( not ( = ?auto_344700 ?auto_344704 ) ) ( not ( = ?auto_344700 ?auto_344705 ) ) ( not ( = ?auto_344700 ?auto_344706 ) ) ( not ( = ?auto_344700 ?auto_344707 ) ) ( not ( = ?auto_344700 ?auto_344708 ) ) ( not ( = ?auto_344700 ?auto_344709 ) ) ( not ( = ?auto_344701 ?auto_344702 ) ) ( not ( = ?auto_344701 ?auto_344703 ) ) ( not ( = ?auto_344701 ?auto_344704 ) ) ( not ( = ?auto_344701 ?auto_344705 ) ) ( not ( = ?auto_344701 ?auto_344706 ) ) ( not ( = ?auto_344701 ?auto_344707 ) ) ( not ( = ?auto_344701 ?auto_344708 ) ) ( not ( = ?auto_344701 ?auto_344709 ) ) ( not ( = ?auto_344702 ?auto_344703 ) ) ( not ( = ?auto_344702 ?auto_344704 ) ) ( not ( = ?auto_344702 ?auto_344705 ) ) ( not ( = ?auto_344702 ?auto_344706 ) ) ( not ( = ?auto_344702 ?auto_344707 ) ) ( not ( = ?auto_344702 ?auto_344708 ) ) ( not ( = ?auto_344702 ?auto_344709 ) ) ( not ( = ?auto_344703 ?auto_344704 ) ) ( not ( = ?auto_344703 ?auto_344705 ) ) ( not ( = ?auto_344703 ?auto_344706 ) ) ( not ( = ?auto_344703 ?auto_344707 ) ) ( not ( = ?auto_344703 ?auto_344708 ) ) ( not ( = ?auto_344703 ?auto_344709 ) ) ( not ( = ?auto_344704 ?auto_344705 ) ) ( not ( = ?auto_344704 ?auto_344706 ) ) ( not ( = ?auto_344704 ?auto_344707 ) ) ( not ( = ?auto_344704 ?auto_344708 ) ) ( not ( = ?auto_344704 ?auto_344709 ) ) ( not ( = ?auto_344705 ?auto_344706 ) ) ( not ( = ?auto_344705 ?auto_344707 ) ) ( not ( = ?auto_344705 ?auto_344708 ) ) ( not ( = ?auto_344705 ?auto_344709 ) ) ( not ( = ?auto_344706 ?auto_344707 ) ) ( not ( = ?auto_344706 ?auto_344708 ) ) ( not ( = ?auto_344706 ?auto_344709 ) ) ( not ( = ?auto_344707 ?auto_344708 ) ) ( not ( = ?auto_344707 ?auto_344709 ) ) ( not ( = ?auto_344708 ?auto_344709 ) ) ( ON ?auto_344707 ?auto_344708 ) ( ON ?auto_344706 ?auto_344707 ) ( ON ?auto_344705 ?auto_344706 ) ( ON ?auto_344704 ?auto_344705 ) ( ON ?auto_344703 ?auto_344704 ) ( ON ?auto_344702 ?auto_344703 ) ( ON ?auto_344701 ?auto_344702 ) ( ON ?auto_344700 ?auto_344701 ) ( CLEAR ?auto_344700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_344700 )
      ( MAKE-9PILE ?auto_344700 ?auto_344701 ?auto_344702 ?auto_344703 ?auto_344704 ?auto_344705 ?auto_344706 ?auto_344707 ?auto_344708 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_344720 - BLOCK
      ?auto_344721 - BLOCK
      ?auto_344722 - BLOCK
      ?auto_344723 - BLOCK
      ?auto_344724 - BLOCK
      ?auto_344725 - BLOCK
      ?auto_344726 - BLOCK
      ?auto_344727 - BLOCK
      ?auto_344728 - BLOCK
      ?auto_344729 - BLOCK
    )
    :vars
    (
      ?auto_344730 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_344728 ) ( ON ?auto_344729 ?auto_344730 ) ( CLEAR ?auto_344729 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_344720 ) ( ON ?auto_344721 ?auto_344720 ) ( ON ?auto_344722 ?auto_344721 ) ( ON ?auto_344723 ?auto_344722 ) ( ON ?auto_344724 ?auto_344723 ) ( ON ?auto_344725 ?auto_344724 ) ( ON ?auto_344726 ?auto_344725 ) ( ON ?auto_344727 ?auto_344726 ) ( ON ?auto_344728 ?auto_344727 ) ( not ( = ?auto_344720 ?auto_344721 ) ) ( not ( = ?auto_344720 ?auto_344722 ) ) ( not ( = ?auto_344720 ?auto_344723 ) ) ( not ( = ?auto_344720 ?auto_344724 ) ) ( not ( = ?auto_344720 ?auto_344725 ) ) ( not ( = ?auto_344720 ?auto_344726 ) ) ( not ( = ?auto_344720 ?auto_344727 ) ) ( not ( = ?auto_344720 ?auto_344728 ) ) ( not ( = ?auto_344720 ?auto_344729 ) ) ( not ( = ?auto_344720 ?auto_344730 ) ) ( not ( = ?auto_344721 ?auto_344722 ) ) ( not ( = ?auto_344721 ?auto_344723 ) ) ( not ( = ?auto_344721 ?auto_344724 ) ) ( not ( = ?auto_344721 ?auto_344725 ) ) ( not ( = ?auto_344721 ?auto_344726 ) ) ( not ( = ?auto_344721 ?auto_344727 ) ) ( not ( = ?auto_344721 ?auto_344728 ) ) ( not ( = ?auto_344721 ?auto_344729 ) ) ( not ( = ?auto_344721 ?auto_344730 ) ) ( not ( = ?auto_344722 ?auto_344723 ) ) ( not ( = ?auto_344722 ?auto_344724 ) ) ( not ( = ?auto_344722 ?auto_344725 ) ) ( not ( = ?auto_344722 ?auto_344726 ) ) ( not ( = ?auto_344722 ?auto_344727 ) ) ( not ( = ?auto_344722 ?auto_344728 ) ) ( not ( = ?auto_344722 ?auto_344729 ) ) ( not ( = ?auto_344722 ?auto_344730 ) ) ( not ( = ?auto_344723 ?auto_344724 ) ) ( not ( = ?auto_344723 ?auto_344725 ) ) ( not ( = ?auto_344723 ?auto_344726 ) ) ( not ( = ?auto_344723 ?auto_344727 ) ) ( not ( = ?auto_344723 ?auto_344728 ) ) ( not ( = ?auto_344723 ?auto_344729 ) ) ( not ( = ?auto_344723 ?auto_344730 ) ) ( not ( = ?auto_344724 ?auto_344725 ) ) ( not ( = ?auto_344724 ?auto_344726 ) ) ( not ( = ?auto_344724 ?auto_344727 ) ) ( not ( = ?auto_344724 ?auto_344728 ) ) ( not ( = ?auto_344724 ?auto_344729 ) ) ( not ( = ?auto_344724 ?auto_344730 ) ) ( not ( = ?auto_344725 ?auto_344726 ) ) ( not ( = ?auto_344725 ?auto_344727 ) ) ( not ( = ?auto_344725 ?auto_344728 ) ) ( not ( = ?auto_344725 ?auto_344729 ) ) ( not ( = ?auto_344725 ?auto_344730 ) ) ( not ( = ?auto_344726 ?auto_344727 ) ) ( not ( = ?auto_344726 ?auto_344728 ) ) ( not ( = ?auto_344726 ?auto_344729 ) ) ( not ( = ?auto_344726 ?auto_344730 ) ) ( not ( = ?auto_344727 ?auto_344728 ) ) ( not ( = ?auto_344727 ?auto_344729 ) ) ( not ( = ?auto_344727 ?auto_344730 ) ) ( not ( = ?auto_344728 ?auto_344729 ) ) ( not ( = ?auto_344728 ?auto_344730 ) ) ( not ( = ?auto_344729 ?auto_344730 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_344729 ?auto_344730 )
      ( !STACK ?auto_344729 ?auto_344728 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_344741 - BLOCK
      ?auto_344742 - BLOCK
      ?auto_344743 - BLOCK
      ?auto_344744 - BLOCK
      ?auto_344745 - BLOCK
      ?auto_344746 - BLOCK
      ?auto_344747 - BLOCK
      ?auto_344748 - BLOCK
      ?auto_344749 - BLOCK
      ?auto_344750 - BLOCK
    )
    :vars
    (
      ?auto_344751 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_344749 ) ( ON ?auto_344750 ?auto_344751 ) ( CLEAR ?auto_344750 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_344741 ) ( ON ?auto_344742 ?auto_344741 ) ( ON ?auto_344743 ?auto_344742 ) ( ON ?auto_344744 ?auto_344743 ) ( ON ?auto_344745 ?auto_344744 ) ( ON ?auto_344746 ?auto_344745 ) ( ON ?auto_344747 ?auto_344746 ) ( ON ?auto_344748 ?auto_344747 ) ( ON ?auto_344749 ?auto_344748 ) ( not ( = ?auto_344741 ?auto_344742 ) ) ( not ( = ?auto_344741 ?auto_344743 ) ) ( not ( = ?auto_344741 ?auto_344744 ) ) ( not ( = ?auto_344741 ?auto_344745 ) ) ( not ( = ?auto_344741 ?auto_344746 ) ) ( not ( = ?auto_344741 ?auto_344747 ) ) ( not ( = ?auto_344741 ?auto_344748 ) ) ( not ( = ?auto_344741 ?auto_344749 ) ) ( not ( = ?auto_344741 ?auto_344750 ) ) ( not ( = ?auto_344741 ?auto_344751 ) ) ( not ( = ?auto_344742 ?auto_344743 ) ) ( not ( = ?auto_344742 ?auto_344744 ) ) ( not ( = ?auto_344742 ?auto_344745 ) ) ( not ( = ?auto_344742 ?auto_344746 ) ) ( not ( = ?auto_344742 ?auto_344747 ) ) ( not ( = ?auto_344742 ?auto_344748 ) ) ( not ( = ?auto_344742 ?auto_344749 ) ) ( not ( = ?auto_344742 ?auto_344750 ) ) ( not ( = ?auto_344742 ?auto_344751 ) ) ( not ( = ?auto_344743 ?auto_344744 ) ) ( not ( = ?auto_344743 ?auto_344745 ) ) ( not ( = ?auto_344743 ?auto_344746 ) ) ( not ( = ?auto_344743 ?auto_344747 ) ) ( not ( = ?auto_344743 ?auto_344748 ) ) ( not ( = ?auto_344743 ?auto_344749 ) ) ( not ( = ?auto_344743 ?auto_344750 ) ) ( not ( = ?auto_344743 ?auto_344751 ) ) ( not ( = ?auto_344744 ?auto_344745 ) ) ( not ( = ?auto_344744 ?auto_344746 ) ) ( not ( = ?auto_344744 ?auto_344747 ) ) ( not ( = ?auto_344744 ?auto_344748 ) ) ( not ( = ?auto_344744 ?auto_344749 ) ) ( not ( = ?auto_344744 ?auto_344750 ) ) ( not ( = ?auto_344744 ?auto_344751 ) ) ( not ( = ?auto_344745 ?auto_344746 ) ) ( not ( = ?auto_344745 ?auto_344747 ) ) ( not ( = ?auto_344745 ?auto_344748 ) ) ( not ( = ?auto_344745 ?auto_344749 ) ) ( not ( = ?auto_344745 ?auto_344750 ) ) ( not ( = ?auto_344745 ?auto_344751 ) ) ( not ( = ?auto_344746 ?auto_344747 ) ) ( not ( = ?auto_344746 ?auto_344748 ) ) ( not ( = ?auto_344746 ?auto_344749 ) ) ( not ( = ?auto_344746 ?auto_344750 ) ) ( not ( = ?auto_344746 ?auto_344751 ) ) ( not ( = ?auto_344747 ?auto_344748 ) ) ( not ( = ?auto_344747 ?auto_344749 ) ) ( not ( = ?auto_344747 ?auto_344750 ) ) ( not ( = ?auto_344747 ?auto_344751 ) ) ( not ( = ?auto_344748 ?auto_344749 ) ) ( not ( = ?auto_344748 ?auto_344750 ) ) ( not ( = ?auto_344748 ?auto_344751 ) ) ( not ( = ?auto_344749 ?auto_344750 ) ) ( not ( = ?auto_344749 ?auto_344751 ) ) ( not ( = ?auto_344750 ?auto_344751 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_344750 ?auto_344751 )
      ( !STACK ?auto_344750 ?auto_344749 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_344762 - BLOCK
      ?auto_344763 - BLOCK
      ?auto_344764 - BLOCK
      ?auto_344765 - BLOCK
      ?auto_344766 - BLOCK
      ?auto_344767 - BLOCK
      ?auto_344768 - BLOCK
      ?auto_344769 - BLOCK
      ?auto_344770 - BLOCK
      ?auto_344771 - BLOCK
    )
    :vars
    (
      ?auto_344772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344771 ?auto_344772 ) ( ON-TABLE ?auto_344762 ) ( ON ?auto_344763 ?auto_344762 ) ( ON ?auto_344764 ?auto_344763 ) ( ON ?auto_344765 ?auto_344764 ) ( ON ?auto_344766 ?auto_344765 ) ( ON ?auto_344767 ?auto_344766 ) ( ON ?auto_344768 ?auto_344767 ) ( ON ?auto_344769 ?auto_344768 ) ( not ( = ?auto_344762 ?auto_344763 ) ) ( not ( = ?auto_344762 ?auto_344764 ) ) ( not ( = ?auto_344762 ?auto_344765 ) ) ( not ( = ?auto_344762 ?auto_344766 ) ) ( not ( = ?auto_344762 ?auto_344767 ) ) ( not ( = ?auto_344762 ?auto_344768 ) ) ( not ( = ?auto_344762 ?auto_344769 ) ) ( not ( = ?auto_344762 ?auto_344770 ) ) ( not ( = ?auto_344762 ?auto_344771 ) ) ( not ( = ?auto_344762 ?auto_344772 ) ) ( not ( = ?auto_344763 ?auto_344764 ) ) ( not ( = ?auto_344763 ?auto_344765 ) ) ( not ( = ?auto_344763 ?auto_344766 ) ) ( not ( = ?auto_344763 ?auto_344767 ) ) ( not ( = ?auto_344763 ?auto_344768 ) ) ( not ( = ?auto_344763 ?auto_344769 ) ) ( not ( = ?auto_344763 ?auto_344770 ) ) ( not ( = ?auto_344763 ?auto_344771 ) ) ( not ( = ?auto_344763 ?auto_344772 ) ) ( not ( = ?auto_344764 ?auto_344765 ) ) ( not ( = ?auto_344764 ?auto_344766 ) ) ( not ( = ?auto_344764 ?auto_344767 ) ) ( not ( = ?auto_344764 ?auto_344768 ) ) ( not ( = ?auto_344764 ?auto_344769 ) ) ( not ( = ?auto_344764 ?auto_344770 ) ) ( not ( = ?auto_344764 ?auto_344771 ) ) ( not ( = ?auto_344764 ?auto_344772 ) ) ( not ( = ?auto_344765 ?auto_344766 ) ) ( not ( = ?auto_344765 ?auto_344767 ) ) ( not ( = ?auto_344765 ?auto_344768 ) ) ( not ( = ?auto_344765 ?auto_344769 ) ) ( not ( = ?auto_344765 ?auto_344770 ) ) ( not ( = ?auto_344765 ?auto_344771 ) ) ( not ( = ?auto_344765 ?auto_344772 ) ) ( not ( = ?auto_344766 ?auto_344767 ) ) ( not ( = ?auto_344766 ?auto_344768 ) ) ( not ( = ?auto_344766 ?auto_344769 ) ) ( not ( = ?auto_344766 ?auto_344770 ) ) ( not ( = ?auto_344766 ?auto_344771 ) ) ( not ( = ?auto_344766 ?auto_344772 ) ) ( not ( = ?auto_344767 ?auto_344768 ) ) ( not ( = ?auto_344767 ?auto_344769 ) ) ( not ( = ?auto_344767 ?auto_344770 ) ) ( not ( = ?auto_344767 ?auto_344771 ) ) ( not ( = ?auto_344767 ?auto_344772 ) ) ( not ( = ?auto_344768 ?auto_344769 ) ) ( not ( = ?auto_344768 ?auto_344770 ) ) ( not ( = ?auto_344768 ?auto_344771 ) ) ( not ( = ?auto_344768 ?auto_344772 ) ) ( not ( = ?auto_344769 ?auto_344770 ) ) ( not ( = ?auto_344769 ?auto_344771 ) ) ( not ( = ?auto_344769 ?auto_344772 ) ) ( not ( = ?auto_344770 ?auto_344771 ) ) ( not ( = ?auto_344770 ?auto_344772 ) ) ( not ( = ?auto_344771 ?auto_344772 ) ) ( CLEAR ?auto_344769 ) ( ON ?auto_344770 ?auto_344771 ) ( CLEAR ?auto_344770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_344762 ?auto_344763 ?auto_344764 ?auto_344765 ?auto_344766 ?auto_344767 ?auto_344768 ?auto_344769 ?auto_344770 )
      ( MAKE-10PILE ?auto_344762 ?auto_344763 ?auto_344764 ?auto_344765 ?auto_344766 ?auto_344767 ?auto_344768 ?auto_344769 ?auto_344770 ?auto_344771 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_344783 - BLOCK
      ?auto_344784 - BLOCK
      ?auto_344785 - BLOCK
      ?auto_344786 - BLOCK
      ?auto_344787 - BLOCK
      ?auto_344788 - BLOCK
      ?auto_344789 - BLOCK
      ?auto_344790 - BLOCK
      ?auto_344791 - BLOCK
      ?auto_344792 - BLOCK
    )
    :vars
    (
      ?auto_344793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344792 ?auto_344793 ) ( ON-TABLE ?auto_344783 ) ( ON ?auto_344784 ?auto_344783 ) ( ON ?auto_344785 ?auto_344784 ) ( ON ?auto_344786 ?auto_344785 ) ( ON ?auto_344787 ?auto_344786 ) ( ON ?auto_344788 ?auto_344787 ) ( ON ?auto_344789 ?auto_344788 ) ( ON ?auto_344790 ?auto_344789 ) ( not ( = ?auto_344783 ?auto_344784 ) ) ( not ( = ?auto_344783 ?auto_344785 ) ) ( not ( = ?auto_344783 ?auto_344786 ) ) ( not ( = ?auto_344783 ?auto_344787 ) ) ( not ( = ?auto_344783 ?auto_344788 ) ) ( not ( = ?auto_344783 ?auto_344789 ) ) ( not ( = ?auto_344783 ?auto_344790 ) ) ( not ( = ?auto_344783 ?auto_344791 ) ) ( not ( = ?auto_344783 ?auto_344792 ) ) ( not ( = ?auto_344783 ?auto_344793 ) ) ( not ( = ?auto_344784 ?auto_344785 ) ) ( not ( = ?auto_344784 ?auto_344786 ) ) ( not ( = ?auto_344784 ?auto_344787 ) ) ( not ( = ?auto_344784 ?auto_344788 ) ) ( not ( = ?auto_344784 ?auto_344789 ) ) ( not ( = ?auto_344784 ?auto_344790 ) ) ( not ( = ?auto_344784 ?auto_344791 ) ) ( not ( = ?auto_344784 ?auto_344792 ) ) ( not ( = ?auto_344784 ?auto_344793 ) ) ( not ( = ?auto_344785 ?auto_344786 ) ) ( not ( = ?auto_344785 ?auto_344787 ) ) ( not ( = ?auto_344785 ?auto_344788 ) ) ( not ( = ?auto_344785 ?auto_344789 ) ) ( not ( = ?auto_344785 ?auto_344790 ) ) ( not ( = ?auto_344785 ?auto_344791 ) ) ( not ( = ?auto_344785 ?auto_344792 ) ) ( not ( = ?auto_344785 ?auto_344793 ) ) ( not ( = ?auto_344786 ?auto_344787 ) ) ( not ( = ?auto_344786 ?auto_344788 ) ) ( not ( = ?auto_344786 ?auto_344789 ) ) ( not ( = ?auto_344786 ?auto_344790 ) ) ( not ( = ?auto_344786 ?auto_344791 ) ) ( not ( = ?auto_344786 ?auto_344792 ) ) ( not ( = ?auto_344786 ?auto_344793 ) ) ( not ( = ?auto_344787 ?auto_344788 ) ) ( not ( = ?auto_344787 ?auto_344789 ) ) ( not ( = ?auto_344787 ?auto_344790 ) ) ( not ( = ?auto_344787 ?auto_344791 ) ) ( not ( = ?auto_344787 ?auto_344792 ) ) ( not ( = ?auto_344787 ?auto_344793 ) ) ( not ( = ?auto_344788 ?auto_344789 ) ) ( not ( = ?auto_344788 ?auto_344790 ) ) ( not ( = ?auto_344788 ?auto_344791 ) ) ( not ( = ?auto_344788 ?auto_344792 ) ) ( not ( = ?auto_344788 ?auto_344793 ) ) ( not ( = ?auto_344789 ?auto_344790 ) ) ( not ( = ?auto_344789 ?auto_344791 ) ) ( not ( = ?auto_344789 ?auto_344792 ) ) ( not ( = ?auto_344789 ?auto_344793 ) ) ( not ( = ?auto_344790 ?auto_344791 ) ) ( not ( = ?auto_344790 ?auto_344792 ) ) ( not ( = ?auto_344790 ?auto_344793 ) ) ( not ( = ?auto_344791 ?auto_344792 ) ) ( not ( = ?auto_344791 ?auto_344793 ) ) ( not ( = ?auto_344792 ?auto_344793 ) ) ( CLEAR ?auto_344790 ) ( ON ?auto_344791 ?auto_344792 ) ( CLEAR ?auto_344791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_344783 ?auto_344784 ?auto_344785 ?auto_344786 ?auto_344787 ?auto_344788 ?auto_344789 ?auto_344790 ?auto_344791 )
      ( MAKE-10PILE ?auto_344783 ?auto_344784 ?auto_344785 ?auto_344786 ?auto_344787 ?auto_344788 ?auto_344789 ?auto_344790 ?auto_344791 ?auto_344792 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_344804 - BLOCK
      ?auto_344805 - BLOCK
      ?auto_344806 - BLOCK
      ?auto_344807 - BLOCK
      ?auto_344808 - BLOCK
      ?auto_344809 - BLOCK
      ?auto_344810 - BLOCK
      ?auto_344811 - BLOCK
      ?auto_344812 - BLOCK
      ?auto_344813 - BLOCK
    )
    :vars
    (
      ?auto_344814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344813 ?auto_344814 ) ( ON-TABLE ?auto_344804 ) ( ON ?auto_344805 ?auto_344804 ) ( ON ?auto_344806 ?auto_344805 ) ( ON ?auto_344807 ?auto_344806 ) ( ON ?auto_344808 ?auto_344807 ) ( ON ?auto_344809 ?auto_344808 ) ( ON ?auto_344810 ?auto_344809 ) ( not ( = ?auto_344804 ?auto_344805 ) ) ( not ( = ?auto_344804 ?auto_344806 ) ) ( not ( = ?auto_344804 ?auto_344807 ) ) ( not ( = ?auto_344804 ?auto_344808 ) ) ( not ( = ?auto_344804 ?auto_344809 ) ) ( not ( = ?auto_344804 ?auto_344810 ) ) ( not ( = ?auto_344804 ?auto_344811 ) ) ( not ( = ?auto_344804 ?auto_344812 ) ) ( not ( = ?auto_344804 ?auto_344813 ) ) ( not ( = ?auto_344804 ?auto_344814 ) ) ( not ( = ?auto_344805 ?auto_344806 ) ) ( not ( = ?auto_344805 ?auto_344807 ) ) ( not ( = ?auto_344805 ?auto_344808 ) ) ( not ( = ?auto_344805 ?auto_344809 ) ) ( not ( = ?auto_344805 ?auto_344810 ) ) ( not ( = ?auto_344805 ?auto_344811 ) ) ( not ( = ?auto_344805 ?auto_344812 ) ) ( not ( = ?auto_344805 ?auto_344813 ) ) ( not ( = ?auto_344805 ?auto_344814 ) ) ( not ( = ?auto_344806 ?auto_344807 ) ) ( not ( = ?auto_344806 ?auto_344808 ) ) ( not ( = ?auto_344806 ?auto_344809 ) ) ( not ( = ?auto_344806 ?auto_344810 ) ) ( not ( = ?auto_344806 ?auto_344811 ) ) ( not ( = ?auto_344806 ?auto_344812 ) ) ( not ( = ?auto_344806 ?auto_344813 ) ) ( not ( = ?auto_344806 ?auto_344814 ) ) ( not ( = ?auto_344807 ?auto_344808 ) ) ( not ( = ?auto_344807 ?auto_344809 ) ) ( not ( = ?auto_344807 ?auto_344810 ) ) ( not ( = ?auto_344807 ?auto_344811 ) ) ( not ( = ?auto_344807 ?auto_344812 ) ) ( not ( = ?auto_344807 ?auto_344813 ) ) ( not ( = ?auto_344807 ?auto_344814 ) ) ( not ( = ?auto_344808 ?auto_344809 ) ) ( not ( = ?auto_344808 ?auto_344810 ) ) ( not ( = ?auto_344808 ?auto_344811 ) ) ( not ( = ?auto_344808 ?auto_344812 ) ) ( not ( = ?auto_344808 ?auto_344813 ) ) ( not ( = ?auto_344808 ?auto_344814 ) ) ( not ( = ?auto_344809 ?auto_344810 ) ) ( not ( = ?auto_344809 ?auto_344811 ) ) ( not ( = ?auto_344809 ?auto_344812 ) ) ( not ( = ?auto_344809 ?auto_344813 ) ) ( not ( = ?auto_344809 ?auto_344814 ) ) ( not ( = ?auto_344810 ?auto_344811 ) ) ( not ( = ?auto_344810 ?auto_344812 ) ) ( not ( = ?auto_344810 ?auto_344813 ) ) ( not ( = ?auto_344810 ?auto_344814 ) ) ( not ( = ?auto_344811 ?auto_344812 ) ) ( not ( = ?auto_344811 ?auto_344813 ) ) ( not ( = ?auto_344811 ?auto_344814 ) ) ( not ( = ?auto_344812 ?auto_344813 ) ) ( not ( = ?auto_344812 ?auto_344814 ) ) ( not ( = ?auto_344813 ?auto_344814 ) ) ( ON ?auto_344812 ?auto_344813 ) ( CLEAR ?auto_344810 ) ( ON ?auto_344811 ?auto_344812 ) ( CLEAR ?auto_344811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_344804 ?auto_344805 ?auto_344806 ?auto_344807 ?auto_344808 ?auto_344809 ?auto_344810 ?auto_344811 )
      ( MAKE-10PILE ?auto_344804 ?auto_344805 ?auto_344806 ?auto_344807 ?auto_344808 ?auto_344809 ?auto_344810 ?auto_344811 ?auto_344812 ?auto_344813 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_344825 - BLOCK
      ?auto_344826 - BLOCK
      ?auto_344827 - BLOCK
      ?auto_344828 - BLOCK
      ?auto_344829 - BLOCK
      ?auto_344830 - BLOCK
      ?auto_344831 - BLOCK
      ?auto_344832 - BLOCK
      ?auto_344833 - BLOCK
      ?auto_344834 - BLOCK
    )
    :vars
    (
      ?auto_344835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344834 ?auto_344835 ) ( ON-TABLE ?auto_344825 ) ( ON ?auto_344826 ?auto_344825 ) ( ON ?auto_344827 ?auto_344826 ) ( ON ?auto_344828 ?auto_344827 ) ( ON ?auto_344829 ?auto_344828 ) ( ON ?auto_344830 ?auto_344829 ) ( ON ?auto_344831 ?auto_344830 ) ( not ( = ?auto_344825 ?auto_344826 ) ) ( not ( = ?auto_344825 ?auto_344827 ) ) ( not ( = ?auto_344825 ?auto_344828 ) ) ( not ( = ?auto_344825 ?auto_344829 ) ) ( not ( = ?auto_344825 ?auto_344830 ) ) ( not ( = ?auto_344825 ?auto_344831 ) ) ( not ( = ?auto_344825 ?auto_344832 ) ) ( not ( = ?auto_344825 ?auto_344833 ) ) ( not ( = ?auto_344825 ?auto_344834 ) ) ( not ( = ?auto_344825 ?auto_344835 ) ) ( not ( = ?auto_344826 ?auto_344827 ) ) ( not ( = ?auto_344826 ?auto_344828 ) ) ( not ( = ?auto_344826 ?auto_344829 ) ) ( not ( = ?auto_344826 ?auto_344830 ) ) ( not ( = ?auto_344826 ?auto_344831 ) ) ( not ( = ?auto_344826 ?auto_344832 ) ) ( not ( = ?auto_344826 ?auto_344833 ) ) ( not ( = ?auto_344826 ?auto_344834 ) ) ( not ( = ?auto_344826 ?auto_344835 ) ) ( not ( = ?auto_344827 ?auto_344828 ) ) ( not ( = ?auto_344827 ?auto_344829 ) ) ( not ( = ?auto_344827 ?auto_344830 ) ) ( not ( = ?auto_344827 ?auto_344831 ) ) ( not ( = ?auto_344827 ?auto_344832 ) ) ( not ( = ?auto_344827 ?auto_344833 ) ) ( not ( = ?auto_344827 ?auto_344834 ) ) ( not ( = ?auto_344827 ?auto_344835 ) ) ( not ( = ?auto_344828 ?auto_344829 ) ) ( not ( = ?auto_344828 ?auto_344830 ) ) ( not ( = ?auto_344828 ?auto_344831 ) ) ( not ( = ?auto_344828 ?auto_344832 ) ) ( not ( = ?auto_344828 ?auto_344833 ) ) ( not ( = ?auto_344828 ?auto_344834 ) ) ( not ( = ?auto_344828 ?auto_344835 ) ) ( not ( = ?auto_344829 ?auto_344830 ) ) ( not ( = ?auto_344829 ?auto_344831 ) ) ( not ( = ?auto_344829 ?auto_344832 ) ) ( not ( = ?auto_344829 ?auto_344833 ) ) ( not ( = ?auto_344829 ?auto_344834 ) ) ( not ( = ?auto_344829 ?auto_344835 ) ) ( not ( = ?auto_344830 ?auto_344831 ) ) ( not ( = ?auto_344830 ?auto_344832 ) ) ( not ( = ?auto_344830 ?auto_344833 ) ) ( not ( = ?auto_344830 ?auto_344834 ) ) ( not ( = ?auto_344830 ?auto_344835 ) ) ( not ( = ?auto_344831 ?auto_344832 ) ) ( not ( = ?auto_344831 ?auto_344833 ) ) ( not ( = ?auto_344831 ?auto_344834 ) ) ( not ( = ?auto_344831 ?auto_344835 ) ) ( not ( = ?auto_344832 ?auto_344833 ) ) ( not ( = ?auto_344832 ?auto_344834 ) ) ( not ( = ?auto_344832 ?auto_344835 ) ) ( not ( = ?auto_344833 ?auto_344834 ) ) ( not ( = ?auto_344833 ?auto_344835 ) ) ( not ( = ?auto_344834 ?auto_344835 ) ) ( ON ?auto_344833 ?auto_344834 ) ( CLEAR ?auto_344831 ) ( ON ?auto_344832 ?auto_344833 ) ( CLEAR ?auto_344832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_344825 ?auto_344826 ?auto_344827 ?auto_344828 ?auto_344829 ?auto_344830 ?auto_344831 ?auto_344832 )
      ( MAKE-10PILE ?auto_344825 ?auto_344826 ?auto_344827 ?auto_344828 ?auto_344829 ?auto_344830 ?auto_344831 ?auto_344832 ?auto_344833 ?auto_344834 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_344846 - BLOCK
      ?auto_344847 - BLOCK
      ?auto_344848 - BLOCK
      ?auto_344849 - BLOCK
      ?auto_344850 - BLOCK
      ?auto_344851 - BLOCK
      ?auto_344852 - BLOCK
      ?auto_344853 - BLOCK
      ?auto_344854 - BLOCK
      ?auto_344855 - BLOCK
    )
    :vars
    (
      ?auto_344856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344855 ?auto_344856 ) ( ON-TABLE ?auto_344846 ) ( ON ?auto_344847 ?auto_344846 ) ( ON ?auto_344848 ?auto_344847 ) ( ON ?auto_344849 ?auto_344848 ) ( ON ?auto_344850 ?auto_344849 ) ( ON ?auto_344851 ?auto_344850 ) ( not ( = ?auto_344846 ?auto_344847 ) ) ( not ( = ?auto_344846 ?auto_344848 ) ) ( not ( = ?auto_344846 ?auto_344849 ) ) ( not ( = ?auto_344846 ?auto_344850 ) ) ( not ( = ?auto_344846 ?auto_344851 ) ) ( not ( = ?auto_344846 ?auto_344852 ) ) ( not ( = ?auto_344846 ?auto_344853 ) ) ( not ( = ?auto_344846 ?auto_344854 ) ) ( not ( = ?auto_344846 ?auto_344855 ) ) ( not ( = ?auto_344846 ?auto_344856 ) ) ( not ( = ?auto_344847 ?auto_344848 ) ) ( not ( = ?auto_344847 ?auto_344849 ) ) ( not ( = ?auto_344847 ?auto_344850 ) ) ( not ( = ?auto_344847 ?auto_344851 ) ) ( not ( = ?auto_344847 ?auto_344852 ) ) ( not ( = ?auto_344847 ?auto_344853 ) ) ( not ( = ?auto_344847 ?auto_344854 ) ) ( not ( = ?auto_344847 ?auto_344855 ) ) ( not ( = ?auto_344847 ?auto_344856 ) ) ( not ( = ?auto_344848 ?auto_344849 ) ) ( not ( = ?auto_344848 ?auto_344850 ) ) ( not ( = ?auto_344848 ?auto_344851 ) ) ( not ( = ?auto_344848 ?auto_344852 ) ) ( not ( = ?auto_344848 ?auto_344853 ) ) ( not ( = ?auto_344848 ?auto_344854 ) ) ( not ( = ?auto_344848 ?auto_344855 ) ) ( not ( = ?auto_344848 ?auto_344856 ) ) ( not ( = ?auto_344849 ?auto_344850 ) ) ( not ( = ?auto_344849 ?auto_344851 ) ) ( not ( = ?auto_344849 ?auto_344852 ) ) ( not ( = ?auto_344849 ?auto_344853 ) ) ( not ( = ?auto_344849 ?auto_344854 ) ) ( not ( = ?auto_344849 ?auto_344855 ) ) ( not ( = ?auto_344849 ?auto_344856 ) ) ( not ( = ?auto_344850 ?auto_344851 ) ) ( not ( = ?auto_344850 ?auto_344852 ) ) ( not ( = ?auto_344850 ?auto_344853 ) ) ( not ( = ?auto_344850 ?auto_344854 ) ) ( not ( = ?auto_344850 ?auto_344855 ) ) ( not ( = ?auto_344850 ?auto_344856 ) ) ( not ( = ?auto_344851 ?auto_344852 ) ) ( not ( = ?auto_344851 ?auto_344853 ) ) ( not ( = ?auto_344851 ?auto_344854 ) ) ( not ( = ?auto_344851 ?auto_344855 ) ) ( not ( = ?auto_344851 ?auto_344856 ) ) ( not ( = ?auto_344852 ?auto_344853 ) ) ( not ( = ?auto_344852 ?auto_344854 ) ) ( not ( = ?auto_344852 ?auto_344855 ) ) ( not ( = ?auto_344852 ?auto_344856 ) ) ( not ( = ?auto_344853 ?auto_344854 ) ) ( not ( = ?auto_344853 ?auto_344855 ) ) ( not ( = ?auto_344853 ?auto_344856 ) ) ( not ( = ?auto_344854 ?auto_344855 ) ) ( not ( = ?auto_344854 ?auto_344856 ) ) ( not ( = ?auto_344855 ?auto_344856 ) ) ( ON ?auto_344854 ?auto_344855 ) ( ON ?auto_344853 ?auto_344854 ) ( CLEAR ?auto_344851 ) ( ON ?auto_344852 ?auto_344853 ) ( CLEAR ?auto_344852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_344846 ?auto_344847 ?auto_344848 ?auto_344849 ?auto_344850 ?auto_344851 ?auto_344852 )
      ( MAKE-10PILE ?auto_344846 ?auto_344847 ?auto_344848 ?auto_344849 ?auto_344850 ?auto_344851 ?auto_344852 ?auto_344853 ?auto_344854 ?auto_344855 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_344867 - BLOCK
      ?auto_344868 - BLOCK
      ?auto_344869 - BLOCK
      ?auto_344870 - BLOCK
      ?auto_344871 - BLOCK
      ?auto_344872 - BLOCK
      ?auto_344873 - BLOCK
      ?auto_344874 - BLOCK
      ?auto_344875 - BLOCK
      ?auto_344876 - BLOCK
    )
    :vars
    (
      ?auto_344877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344876 ?auto_344877 ) ( ON-TABLE ?auto_344867 ) ( ON ?auto_344868 ?auto_344867 ) ( ON ?auto_344869 ?auto_344868 ) ( ON ?auto_344870 ?auto_344869 ) ( ON ?auto_344871 ?auto_344870 ) ( ON ?auto_344872 ?auto_344871 ) ( not ( = ?auto_344867 ?auto_344868 ) ) ( not ( = ?auto_344867 ?auto_344869 ) ) ( not ( = ?auto_344867 ?auto_344870 ) ) ( not ( = ?auto_344867 ?auto_344871 ) ) ( not ( = ?auto_344867 ?auto_344872 ) ) ( not ( = ?auto_344867 ?auto_344873 ) ) ( not ( = ?auto_344867 ?auto_344874 ) ) ( not ( = ?auto_344867 ?auto_344875 ) ) ( not ( = ?auto_344867 ?auto_344876 ) ) ( not ( = ?auto_344867 ?auto_344877 ) ) ( not ( = ?auto_344868 ?auto_344869 ) ) ( not ( = ?auto_344868 ?auto_344870 ) ) ( not ( = ?auto_344868 ?auto_344871 ) ) ( not ( = ?auto_344868 ?auto_344872 ) ) ( not ( = ?auto_344868 ?auto_344873 ) ) ( not ( = ?auto_344868 ?auto_344874 ) ) ( not ( = ?auto_344868 ?auto_344875 ) ) ( not ( = ?auto_344868 ?auto_344876 ) ) ( not ( = ?auto_344868 ?auto_344877 ) ) ( not ( = ?auto_344869 ?auto_344870 ) ) ( not ( = ?auto_344869 ?auto_344871 ) ) ( not ( = ?auto_344869 ?auto_344872 ) ) ( not ( = ?auto_344869 ?auto_344873 ) ) ( not ( = ?auto_344869 ?auto_344874 ) ) ( not ( = ?auto_344869 ?auto_344875 ) ) ( not ( = ?auto_344869 ?auto_344876 ) ) ( not ( = ?auto_344869 ?auto_344877 ) ) ( not ( = ?auto_344870 ?auto_344871 ) ) ( not ( = ?auto_344870 ?auto_344872 ) ) ( not ( = ?auto_344870 ?auto_344873 ) ) ( not ( = ?auto_344870 ?auto_344874 ) ) ( not ( = ?auto_344870 ?auto_344875 ) ) ( not ( = ?auto_344870 ?auto_344876 ) ) ( not ( = ?auto_344870 ?auto_344877 ) ) ( not ( = ?auto_344871 ?auto_344872 ) ) ( not ( = ?auto_344871 ?auto_344873 ) ) ( not ( = ?auto_344871 ?auto_344874 ) ) ( not ( = ?auto_344871 ?auto_344875 ) ) ( not ( = ?auto_344871 ?auto_344876 ) ) ( not ( = ?auto_344871 ?auto_344877 ) ) ( not ( = ?auto_344872 ?auto_344873 ) ) ( not ( = ?auto_344872 ?auto_344874 ) ) ( not ( = ?auto_344872 ?auto_344875 ) ) ( not ( = ?auto_344872 ?auto_344876 ) ) ( not ( = ?auto_344872 ?auto_344877 ) ) ( not ( = ?auto_344873 ?auto_344874 ) ) ( not ( = ?auto_344873 ?auto_344875 ) ) ( not ( = ?auto_344873 ?auto_344876 ) ) ( not ( = ?auto_344873 ?auto_344877 ) ) ( not ( = ?auto_344874 ?auto_344875 ) ) ( not ( = ?auto_344874 ?auto_344876 ) ) ( not ( = ?auto_344874 ?auto_344877 ) ) ( not ( = ?auto_344875 ?auto_344876 ) ) ( not ( = ?auto_344875 ?auto_344877 ) ) ( not ( = ?auto_344876 ?auto_344877 ) ) ( ON ?auto_344875 ?auto_344876 ) ( ON ?auto_344874 ?auto_344875 ) ( CLEAR ?auto_344872 ) ( ON ?auto_344873 ?auto_344874 ) ( CLEAR ?auto_344873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_344867 ?auto_344868 ?auto_344869 ?auto_344870 ?auto_344871 ?auto_344872 ?auto_344873 )
      ( MAKE-10PILE ?auto_344867 ?auto_344868 ?auto_344869 ?auto_344870 ?auto_344871 ?auto_344872 ?auto_344873 ?auto_344874 ?auto_344875 ?auto_344876 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_344888 - BLOCK
      ?auto_344889 - BLOCK
      ?auto_344890 - BLOCK
      ?auto_344891 - BLOCK
      ?auto_344892 - BLOCK
      ?auto_344893 - BLOCK
      ?auto_344894 - BLOCK
      ?auto_344895 - BLOCK
      ?auto_344896 - BLOCK
      ?auto_344897 - BLOCK
    )
    :vars
    (
      ?auto_344898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344897 ?auto_344898 ) ( ON-TABLE ?auto_344888 ) ( ON ?auto_344889 ?auto_344888 ) ( ON ?auto_344890 ?auto_344889 ) ( ON ?auto_344891 ?auto_344890 ) ( ON ?auto_344892 ?auto_344891 ) ( not ( = ?auto_344888 ?auto_344889 ) ) ( not ( = ?auto_344888 ?auto_344890 ) ) ( not ( = ?auto_344888 ?auto_344891 ) ) ( not ( = ?auto_344888 ?auto_344892 ) ) ( not ( = ?auto_344888 ?auto_344893 ) ) ( not ( = ?auto_344888 ?auto_344894 ) ) ( not ( = ?auto_344888 ?auto_344895 ) ) ( not ( = ?auto_344888 ?auto_344896 ) ) ( not ( = ?auto_344888 ?auto_344897 ) ) ( not ( = ?auto_344888 ?auto_344898 ) ) ( not ( = ?auto_344889 ?auto_344890 ) ) ( not ( = ?auto_344889 ?auto_344891 ) ) ( not ( = ?auto_344889 ?auto_344892 ) ) ( not ( = ?auto_344889 ?auto_344893 ) ) ( not ( = ?auto_344889 ?auto_344894 ) ) ( not ( = ?auto_344889 ?auto_344895 ) ) ( not ( = ?auto_344889 ?auto_344896 ) ) ( not ( = ?auto_344889 ?auto_344897 ) ) ( not ( = ?auto_344889 ?auto_344898 ) ) ( not ( = ?auto_344890 ?auto_344891 ) ) ( not ( = ?auto_344890 ?auto_344892 ) ) ( not ( = ?auto_344890 ?auto_344893 ) ) ( not ( = ?auto_344890 ?auto_344894 ) ) ( not ( = ?auto_344890 ?auto_344895 ) ) ( not ( = ?auto_344890 ?auto_344896 ) ) ( not ( = ?auto_344890 ?auto_344897 ) ) ( not ( = ?auto_344890 ?auto_344898 ) ) ( not ( = ?auto_344891 ?auto_344892 ) ) ( not ( = ?auto_344891 ?auto_344893 ) ) ( not ( = ?auto_344891 ?auto_344894 ) ) ( not ( = ?auto_344891 ?auto_344895 ) ) ( not ( = ?auto_344891 ?auto_344896 ) ) ( not ( = ?auto_344891 ?auto_344897 ) ) ( not ( = ?auto_344891 ?auto_344898 ) ) ( not ( = ?auto_344892 ?auto_344893 ) ) ( not ( = ?auto_344892 ?auto_344894 ) ) ( not ( = ?auto_344892 ?auto_344895 ) ) ( not ( = ?auto_344892 ?auto_344896 ) ) ( not ( = ?auto_344892 ?auto_344897 ) ) ( not ( = ?auto_344892 ?auto_344898 ) ) ( not ( = ?auto_344893 ?auto_344894 ) ) ( not ( = ?auto_344893 ?auto_344895 ) ) ( not ( = ?auto_344893 ?auto_344896 ) ) ( not ( = ?auto_344893 ?auto_344897 ) ) ( not ( = ?auto_344893 ?auto_344898 ) ) ( not ( = ?auto_344894 ?auto_344895 ) ) ( not ( = ?auto_344894 ?auto_344896 ) ) ( not ( = ?auto_344894 ?auto_344897 ) ) ( not ( = ?auto_344894 ?auto_344898 ) ) ( not ( = ?auto_344895 ?auto_344896 ) ) ( not ( = ?auto_344895 ?auto_344897 ) ) ( not ( = ?auto_344895 ?auto_344898 ) ) ( not ( = ?auto_344896 ?auto_344897 ) ) ( not ( = ?auto_344896 ?auto_344898 ) ) ( not ( = ?auto_344897 ?auto_344898 ) ) ( ON ?auto_344896 ?auto_344897 ) ( ON ?auto_344895 ?auto_344896 ) ( ON ?auto_344894 ?auto_344895 ) ( CLEAR ?auto_344892 ) ( ON ?auto_344893 ?auto_344894 ) ( CLEAR ?auto_344893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_344888 ?auto_344889 ?auto_344890 ?auto_344891 ?auto_344892 ?auto_344893 )
      ( MAKE-10PILE ?auto_344888 ?auto_344889 ?auto_344890 ?auto_344891 ?auto_344892 ?auto_344893 ?auto_344894 ?auto_344895 ?auto_344896 ?auto_344897 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_344909 - BLOCK
      ?auto_344910 - BLOCK
      ?auto_344911 - BLOCK
      ?auto_344912 - BLOCK
      ?auto_344913 - BLOCK
      ?auto_344914 - BLOCK
      ?auto_344915 - BLOCK
      ?auto_344916 - BLOCK
      ?auto_344917 - BLOCK
      ?auto_344918 - BLOCK
    )
    :vars
    (
      ?auto_344919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344918 ?auto_344919 ) ( ON-TABLE ?auto_344909 ) ( ON ?auto_344910 ?auto_344909 ) ( ON ?auto_344911 ?auto_344910 ) ( ON ?auto_344912 ?auto_344911 ) ( ON ?auto_344913 ?auto_344912 ) ( not ( = ?auto_344909 ?auto_344910 ) ) ( not ( = ?auto_344909 ?auto_344911 ) ) ( not ( = ?auto_344909 ?auto_344912 ) ) ( not ( = ?auto_344909 ?auto_344913 ) ) ( not ( = ?auto_344909 ?auto_344914 ) ) ( not ( = ?auto_344909 ?auto_344915 ) ) ( not ( = ?auto_344909 ?auto_344916 ) ) ( not ( = ?auto_344909 ?auto_344917 ) ) ( not ( = ?auto_344909 ?auto_344918 ) ) ( not ( = ?auto_344909 ?auto_344919 ) ) ( not ( = ?auto_344910 ?auto_344911 ) ) ( not ( = ?auto_344910 ?auto_344912 ) ) ( not ( = ?auto_344910 ?auto_344913 ) ) ( not ( = ?auto_344910 ?auto_344914 ) ) ( not ( = ?auto_344910 ?auto_344915 ) ) ( not ( = ?auto_344910 ?auto_344916 ) ) ( not ( = ?auto_344910 ?auto_344917 ) ) ( not ( = ?auto_344910 ?auto_344918 ) ) ( not ( = ?auto_344910 ?auto_344919 ) ) ( not ( = ?auto_344911 ?auto_344912 ) ) ( not ( = ?auto_344911 ?auto_344913 ) ) ( not ( = ?auto_344911 ?auto_344914 ) ) ( not ( = ?auto_344911 ?auto_344915 ) ) ( not ( = ?auto_344911 ?auto_344916 ) ) ( not ( = ?auto_344911 ?auto_344917 ) ) ( not ( = ?auto_344911 ?auto_344918 ) ) ( not ( = ?auto_344911 ?auto_344919 ) ) ( not ( = ?auto_344912 ?auto_344913 ) ) ( not ( = ?auto_344912 ?auto_344914 ) ) ( not ( = ?auto_344912 ?auto_344915 ) ) ( not ( = ?auto_344912 ?auto_344916 ) ) ( not ( = ?auto_344912 ?auto_344917 ) ) ( not ( = ?auto_344912 ?auto_344918 ) ) ( not ( = ?auto_344912 ?auto_344919 ) ) ( not ( = ?auto_344913 ?auto_344914 ) ) ( not ( = ?auto_344913 ?auto_344915 ) ) ( not ( = ?auto_344913 ?auto_344916 ) ) ( not ( = ?auto_344913 ?auto_344917 ) ) ( not ( = ?auto_344913 ?auto_344918 ) ) ( not ( = ?auto_344913 ?auto_344919 ) ) ( not ( = ?auto_344914 ?auto_344915 ) ) ( not ( = ?auto_344914 ?auto_344916 ) ) ( not ( = ?auto_344914 ?auto_344917 ) ) ( not ( = ?auto_344914 ?auto_344918 ) ) ( not ( = ?auto_344914 ?auto_344919 ) ) ( not ( = ?auto_344915 ?auto_344916 ) ) ( not ( = ?auto_344915 ?auto_344917 ) ) ( not ( = ?auto_344915 ?auto_344918 ) ) ( not ( = ?auto_344915 ?auto_344919 ) ) ( not ( = ?auto_344916 ?auto_344917 ) ) ( not ( = ?auto_344916 ?auto_344918 ) ) ( not ( = ?auto_344916 ?auto_344919 ) ) ( not ( = ?auto_344917 ?auto_344918 ) ) ( not ( = ?auto_344917 ?auto_344919 ) ) ( not ( = ?auto_344918 ?auto_344919 ) ) ( ON ?auto_344917 ?auto_344918 ) ( ON ?auto_344916 ?auto_344917 ) ( ON ?auto_344915 ?auto_344916 ) ( CLEAR ?auto_344913 ) ( ON ?auto_344914 ?auto_344915 ) ( CLEAR ?auto_344914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_344909 ?auto_344910 ?auto_344911 ?auto_344912 ?auto_344913 ?auto_344914 )
      ( MAKE-10PILE ?auto_344909 ?auto_344910 ?auto_344911 ?auto_344912 ?auto_344913 ?auto_344914 ?auto_344915 ?auto_344916 ?auto_344917 ?auto_344918 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_344930 - BLOCK
      ?auto_344931 - BLOCK
      ?auto_344932 - BLOCK
      ?auto_344933 - BLOCK
      ?auto_344934 - BLOCK
      ?auto_344935 - BLOCK
      ?auto_344936 - BLOCK
      ?auto_344937 - BLOCK
      ?auto_344938 - BLOCK
      ?auto_344939 - BLOCK
    )
    :vars
    (
      ?auto_344940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344939 ?auto_344940 ) ( ON-TABLE ?auto_344930 ) ( ON ?auto_344931 ?auto_344930 ) ( ON ?auto_344932 ?auto_344931 ) ( ON ?auto_344933 ?auto_344932 ) ( not ( = ?auto_344930 ?auto_344931 ) ) ( not ( = ?auto_344930 ?auto_344932 ) ) ( not ( = ?auto_344930 ?auto_344933 ) ) ( not ( = ?auto_344930 ?auto_344934 ) ) ( not ( = ?auto_344930 ?auto_344935 ) ) ( not ( = ?auto_344930 ?auto_344936 ) ) ( not ( = ?auto_344930 ?auto_344937 ) ) ( not ( = ?auto_344930 ?auto_344938 ) ) ( not ( = ?auto_344930 ?auto_344939 ) ) ( not ( = ?auto_344930 ?auto_344940 ) ) ( not ( = ?auto_344931 ?auto_344932 ) ) ( not ( = ?auto_344931 ?auto_344933 ) ) ( not ( = ?auto_344931 ?auto_344934 ) ) ( not ( = ?auto_344931 ?auto_344935 ) ) ( not ( = ?auto_344931 ?auto_344936 ) ) ( not ( = ?auto_344931 ?auto_344937 ) ) ( not ( = ?auto_344931 ?auto_344938 ) ) ( not ( = ?auto_344931 ?auto_344939 ) ) ( not ( = ?auto_344931 ?auto_344940 ) ) ( not ( = ?auto_344932 ?auto_344933 ) ) ( not ( = ?auto_344932 ?auto_344934 ) ) ( not ( = ?auto_344932 ?auto_344935 ) ) ( not ( = ?auto_344932 ?auto_344936 ) ) ( not ( = ?auto_344932 ?auto_344937 ) ) ( not ( = ?auto_344932 ?auto_344938 ) ) ( not ( = ?auto_344932 ?auto_344939 ) ) ( not ( = ?auto_344932 ?auto_344940 ) ) ( not ( = ?auto_344933 ?auto_344934 ) ) ( not ( = ?auto_344933 ?auto_344935 ) ) ( not ( = ?auto_344933 ?auto_344936 ) ) ( not ( = ?auto_344933 ?auto_344937 ) ) ( not ( = ?auto_344933 ?auto_344938 ) ) ( not ( = ?auto_344933 ?auto_344939 ) ) ( not ( = ?auto_344933 ?auto_344940 ) ) ( not ( = ?auto_344934 ?auto_344935 ) ) ( not ( = ?auto_344934 ?auto_344936 ) ) ( not ( = ?auto_344934 ?auto_344937 ) ) ( not ( = ?auto_344934 ?auto_344938 ) ) ( not ( = ?auto_344934 ?auto_344939 ) ) ( not ( = ?auto_344934 ?auto_344940 ) ) ( not ( = ?auto_344935 ?auto_344936 ) ) ( not ( = ?auto_344935 ?auto_344937 ) ) ( not ( = ?auto_344935 ?auto_344938 ) ) ( not ( = ?auto_344935 ?auto_344939 ) ) ( not ( = ?auto_344935 ?auto_344940 ) ) ( not ( = ?auto_344936 ?auto_344937 ) ) ( not ( = ?auto_344936 ?auto_344938 ) ) ( not ( = ?auto_344936 ?auto_344939 ) ) ( not ( = ?auto_344936 ?auto_344940 ) ) ( not ( = ?auto_344937 ?auto_344938 ) ) ( not ( = ?auto_344937 ?auto_344939 ) ) ( not ( = ?auto_344937 ?auto_344940 ) ) ( not ( = ?auto_344938 ?auto_344939 ) ) ( not ( = ?auto_344938 ?auto_344940 ) ) ( not ( = ?auto_344939 ?auto_344940 ) ) ( ON ?auto_344938 ?auto_344939 ) ( ON ?auto_344937 ?auto_344938 ) ( ON ?auto_344936 ?auto_344937 ) ( ON ?auto_344935 ?auto_344936 ) ( CLEAR ?auto_344933 ) ( ON ?auto_344934 ?auto_344935 ) ( CLEAR ?auto_344934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_344930 ?auto_344931 ?auto_344932 ?auto_344933 ?auto_344934 )
      ( MAKE-10PILE ?auto_344930 ?auto_344931 ?auto_344932 ?auto_344933 ?auto_344934 ?auto_344935 ?auto_344936 ?auto_344937 ?auto_344938 ?auto_344939 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_344951 - BLOCK
      ?auto_344952 - BLOCK
      ?auto_344953 - BLOCK
      ?auto_344954 - BLOCK
      ?auto_344955 - BLOCK
      ?auto_344956 - BLOCK
      ?auto_344957 - BLOCK
      ?auto_344958 - BLOCK
      ?auto_344959 - BLOCK
      ?auto_344960 - BLOCK
    )
    :vars
    (
      ?auto_344961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344960 ?auto_344961 ) ( ON-TABLE ?auto_344951 ) ( ON ?auto_344952 ?auto_344951 ) ( ON ?auto_344953 ?auto_344952 ) ( ON ?auto_344954 ?auto_344953 ) ( not ( = ?auto_344951 ?auto_344952 ) ) ( not ( = ?auto_344951 ?auto_344953 ) ) ( not ( = ?auto_344951 ?auto_344954 ) ) ( not ( = ?auto_344951 ?auto_344955 ) ) ( not ( = ?auto_344951 ?auto_344956 ) ) ( not ( = ?auto_344951 ?auto_344957 ) ) ( not ( = ?auto_344951 ?auto_344958 ) ) ( not ( = ?auto_344951 ?auto_344959 ) ) ( not ( = ?auto_344951 ?auto_344960 ) ) ( not ( = ?auto_344951 ?auto_344961 ) ) ( not ( = ?auto_344952 ?auto_344953 ) ) ( not ( = ?auto_344952 ?auto_344954 ) ) ( not ( = ?auto_344952 ?auto_344955 ) ) ( not ( = ?auto_344952 ?auto_344956 ) ) ( not ( = ?auto_344952 ?auto_344957 ) ) ( not ( = ?auto_344952 ?auto_344958 ) ) ( not ( = ?auto_344952 ?auto_344959 ) ) ( not ( = ?auto_344952 ?auto_344960 ) ) ( not ( = ?auto_344952 ?auto_344961 ) ) ( not ( = ?auto_344953 ?auto_344954 ) ) ( not ( = ?auto_344953 ?auto_344955 ) ) ( not ( = ?auto_344953 ?auto_344956 ) ) ( not ( = ?auto_344953 ?auto_344957 ) ) ( not ( = ?auto_344953 ?auto_344958 ) ) ( not ( = ?auto_344953 ?auto_344959 ) ) ( not ( = ?auto_344953 ?auto_344960 ) ) ( not ( = ?auto_344953 ?auto_344961 ) ) ( not ( = ?auto_344954 ?auto_344955 ) ) ( not ( = ?auto_344954 ?auto_344956 ) ) ( not ( = ?auto_344954 ?auto_344957 ) ) ( not ( = ?auto_344954 ?auto_344958 ) ) ( not ( = ?auto_344954 ?auto_344959 ) ) ( not ( = ?auto_344954 ?auto_344960 ) ) ( not ( = ?auto_344954 ?auto_344961 ) ) ( not ( = ?auto_344955 ?auto_344956 ) ) ( not ( = ?auto_344955 ?auto_344957 ) ) ( not ( = ?auto_344955 ?auto_344958 ) ) ( not ( = ?auto_344955 ?auto_344959 ) ) ( not ( = ?auto_344955 ?auto_344960 ) ) ( not ( = ?auto_344955 ?auto_344961 ) ) ( not ( = ?auto_344956 ?auto_344957 ) ) ( not ( = ?auto_344956 ?auto_344958 ) ) ( not ( = ?auto_344956 ?auto_344959 ) ) ( not ( = ?auto_344956 ?auto_344960 ) ) ( not ( = ?auto_344956 ?auto_344961 ) ) ( not ( = ?auto_344957 ?auto_344958 ) ) ( not ( = ?auto_344957 ?auto_344959 ) ) ( not ( = ?auto_344957 ?auto_344960 ) ) ( not ( = ?auto_344957 ?auto_344961 ) ) ( not ( = ?auto_344958 ?auto_344959 ) ) ( not ( = ?auto_344958 ?auto_344960 ) ) ( not ( = ?auto_344958 ?auto_344961 ) ) ( not ( = ?auto_344959 ?auto_344960 ) ) ( not ( = ?auto_344959 ?auto_344961 ) ) ( not ( = ?auto_344960 ?auto_344961 ) ) ( ON ?auto_344959 ?auto_344960 ) ( ON ?auto_344958 ?auto_344959 ) ( ON ?auto_344957 ?auto_344958 ) ( ON ?auto_344956 ?auto_344957 ) ( CLEAR ?auto_344954 ) ( ON ?auto_344955 ?auto_344956 ) ( CLEAR ?auto_344955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_344951 ?auto_344952 ?auto_344953 ?auto_344954 ?auto_344955 )
      ( MAKE-10PILE ?auto_344951 ?auto_344952 ?auto_344953 ?auto_344954 ?auto_344955 ?auto_344956 ?auto_344957 ?auto_344958 ?auto_344959 ?auto_344960 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_344972 - BLOCK
      ?auto_344973 - BLOCK
      ?auto_344974 - BLOCK
      ?auto_344975 - BLOCK
      ?auto_344976 - BLOCK
      ?auto_344977 - BLOCK
      ?auto_344978 - BLOCK
      ?auto_344979 - BLOCK
      ?auto_344980 - BLOCK
      ?auto_344981 - BLOCK
    )
    :vars
    (
      ?auto_344982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_344981 ?auto_344982 ) ( ON-TABLE ?auto_344972 ) ( ON ?auto_344973 ?auto_344972 ) ( ON ?auto_344974 ?auto_344973 ) ( not ( = ?auto_344972 ?auto_344973 ) ) ( not ( = ?auto_344972 ?auto_344974 ) ) ( not ( = ?auto_344972 ?auto_344975 ) ) ( not ( = ?auto_344972 ?auto_344976 ) ) ( not ( = ?auto_344972 ?auto_344977 ) ) ( not ( = ?auto_344972 ?auto_344978 ) ) ( not ( = ?auto_344972 ?auto_344979 ) ) ( not ( = ?auto_344972 ?auto_344980 ) ) ( not ( = ?auto_344972 ?auto_344981 ) ) ( not ( = ?auto_344972 ?auto_344982 ) ) ( not ( = ?auto_344973 ?auto_344974 ) ) ( not ( = ?auto_344973 ?auto_344975 ) ) ( not ( = ?auto_344973 ?auto_344976 ) ) ( not ( = ?auto_344973 ?auto_344977 ) ) ( not ( = ?auto_344973 ?auto_344978 ) ) ( not ( = ?auto_344973 ?auto_344979 ) ) ( not ( = ?auto_344973 ?auto_344980 ) ) ( not ( = ?auto_344973 ?auto_344981 ) ) ( not ( = ?auto_344973 ?auto_344982 ) ) ( not ( = ?auto_344974 ?auto_344975 ) ) ( not ( = ?auto_344974 ?auto_344976 ) ) ( not ( = ?auto_344974 ?auto_344977 ) ) ( not ( = ?auto_344974 ?auto_344978 ) ) ( not ( = ?auto_344974 ?auto_344979 ) ) ( not ( = ?auto_344974 ?auto_344980 ) ) ( not ( = ?auto_344974 ?auto_344981 ) ) ( not ( = ?auto_344974 ?auto_344982 ) ) ( not ( = ?auto_344975 ?auto_344976 ) ) ( not ( = ?auto_344975 ?auto_344977 ) ) ( not ( = ?auto_344975 ?auto_344978 ) ) ( not ( = ?auto_344975 ?auto_344979 ) ) ( not ( = ?auto_344975 ?auto_344980 ) ) ( not ( = ?auto_344975 ?auto_344981 ) ) ( not ( = ?auto_344975 ?auto_344982 ) ) ( not ( = ?auto_344976 ?auto_344977 ) ) ( not ( = ?auto_344976 ?auto_344978 ) ) ( not ( = ?auto_344976 ?auto_344979 ) ) ( not ( = ?auto_344976 ?auto_344980 ) ) ( not ( = ?auto_344976 ?auto_344981 ) ) ( not ( = ?auto_344976 ?auto_344982 ) ) ( not ( = ?auto_344977 ?auto_344978 ) ) ( not ( = ?auto_344977 ?auto_344979 ) ) ( not ( = ?auto_344977 ?auto_344980 ) ) ( not ( = ?auto_344977 ?auto_344981 ) ) ( not ( = ?auto_344977 ?auto_344982 ) ) ( not ( = ?auto_344978 ?auto_344979 ) ) ( not ( = ?auto_344978 ?auto_344980 ) ) ( not ( = ?auto_344978 ?auto_344981 ) ) ( not ( = ?auto_344978 ?auto_344982 ) ) ( not ( = ?auto_344979 ?auto_344980 ) ) ( not ( = ?auto_344979 ?auto_344981 ) ) ( not ( = ?auto_344979 ?auto_344982 ) ) ( not ( = ?auto_344980 ?auto_344981 ) ) ( not ( = ?auto_344980 ?auto_344982 ) ) ( not ( = ?auto_344981 ?auto_344982 ) ) ( ON ?auto_344980 ?auto_344981 ) ( ON ?auto_344979 ?auto_344980 ) ( ON ?auto_344978 ?auto_344979 ) ( ON ?auto_344977 ?auto_344978 ) ( ON ?auto_344976 ?auto_344977 ) ( CLEAR ?auto_344974 ) ( ON ?auto_344975 ?auto_344976 ) ( CLEAR ?auto_344975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_344972 ?auto_344973 ?auto_344974 ?auto_344975 )
      ( MAKE-10PILE ?auto_344972 ?auto_344973 ?auto_344974 ?auto_344975 ?auto_344976 ?auto_344977 ?auto_344978 ?auto_344979 ?auto_344980 ?auto_344981 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_344993 - BLOCK
      ?auto_344994 - BLOCK
      ?auto_344995 - BLOCK
      ?auto_344996 - BLOCK
      ?auto_344997 - BLOCK
      ?auto_344998 - BLOCK
      ?auto_344999 - BLOCK
      ?auto_345000 - BLOCK
      ?auto_345001 - BLOCK
      ?auto_345002 - BLOCK
    )
    :vars
    (
      ?auto_345003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345002 ?auto_345003 ) ( ON-TABLE ?auto_344993 ) ( ON ?auto_344994 ?auto_344993 ) ( ON ?auto_344995 ?auto_344994 ) ( not ( = ?auto_344993 ?auto_344994 ) ) ( not ( = ?auto_344993 ?auto_344995 ) ) ( not ( = ?auto_344993 ?auto_344996 ) ) ( not ( = ?auto_344993 ?auto_344997 ) ) ( not ( = ?auto_344993 ?auto_344998 ) ) ( not ( = ?auto_344993 ?auto_344999 ) ) ( not ( = ?auto_344993 ?auto_345000 ) ) ( not ( = ?auto_344993 ?auto_345001 ) ) ( not ( = ?auto_344993 ?auto_345002 ) ) ( not ( = ?auto_344993 ?auto_345003 ) ) ( not ( = ?auto_344994 ?auto_344995 ) ) ( not ( = ?auto_344994 ?auto_344996 ) ) ( not ( = ?auto_344994 ?auto_344997 ) ) ( not ( = ?auto_344994 ?auto_344998 ) ) ( not ( = ?auto_344994 ?auto_344999 ) ) ( not ( = ?auto_344994 ?auto_345000 ) ) ( not ( = ?auto_344994 ?auto_345001 ) ) ( not ( = ?auto_344994 ?auto_345002 ) ) ( not ( = ?auto_344994 ?auto_345003 ) ) ( not ( = ?auto_344995 ?auto_344996 ) ) ( not ( = ?auto_344995 ?auto_344997 ) ) ( not ( = ?auto_344995 ?auto_344998 ) ) ( not ( = ?auto_344995 ?auto_344999 ) ) ( not ( = ?auto_344995 ?auto_345000 ) ) ( not ( = ?auto_344995 ?auto_345001 ) ) ( not ( = ?auto_344995 ?auto_345002 ) ) ( not ( = ?auto_344995 ?auto_345003 ) ) ( not ( = ?auto_344996 ?auto_344997 ) ) ( not ( = ?auto_344996 ?auto_344998 ) ) ( not ( = ?auto_344996 ?auto_344999 ) ) ( not ( = ?auto_344996 ?auto_345000 ) ) ( not ( = ?auto_344996 ?auto_345001 ) ) ( not ( = ?auto_344996 ?auto_345002 ) ) ( not ( = ?auto_344996 ?auto_345003 ) ) ( not ( = ?auto_344997 ?auto_344998 ) ) ( not ( = ?auto_344997 ?auto_344999 ) ) ( not ( = ?auto_344997 ?auto_345000 ) ) ( not ( = ?auto_344997 ?auto_345001 ) ) ( not ( = ?auto_344997 ?auto_345002 ) ) ( not ( = ?auto_344997 ?auto_345003 ) ) ( not ( = ?auto_344998 ?auto_344999 ) ) ( not ( = ?auto_344998 ?auto_345000 ) ) ( not ( = ?auto_344998 ?auto_345001 ) ) ( not ( = ?auto_344998 ?auto_345002 ) ) ( not ( = ?auto_344998 ?auto_345003 ) ) ( not ( = ?auto_344999 ?auto_345000 ) ) ( not ( = ?auto_344999 ?auto_345001 ) ) ( not ( = ?auto_344999 ?auto_345002 ) ) ( not ( = ?auto_344999 ?auto_345003 ) ) ( not ( = ?auto_345000 ?auto_345001 ) ) ( not ( = ?auto_345000 ?auto_345002 ) ) ( not ( = ?auto_345000 ?auto_345003 ) ) ( not ( = ?auto_345001 ?auto_345002 ) ) ( not ( = ?auto_345001 ?auto_345003 ) ) ( not ( = ?auto_345002 ?auto_345003 ) ) ( ON ?auto_345001 ?auto_345002 ) ( ON ?auto_345000 ?auto_345001 ) ( ON ?auto_344999 ?auto_345000 ) ( ON ?auto_344998 ?auto_344999 ) ( ON ?auto_344997 ?auto_344998 ) ( CLEAR ?auto_344995 ) ( ON ?auto_344996 ?auto_344997 ) ( CLEAR ?auto_344996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_344993 ?auto_344994 ?auto_344995 ?auto_344996 )
      ( MAKE-10PILE ?auto_344993 ?auto_344994 ?auto_344995 ?auto_344996 ?auto_344997 ?auto_344998 ?auto_344999 ?auto_345000 ?auto_345001 ?auto_345002 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_345014 - BLOCK
      ?auto_345015 - BLOCK
      ?auto_345016 - BLOCK
      ?auto_345017 - BLOCK
      ?auto_345018 - BLOCK
      ?auto_345019 - BLOCK
      ?auto_345020 - BLOCK
      ?auto_345021 - BLOCK
      ?auto_345022 - BLOCK
      ?auto_345023 - BLOCK
    )
    :vars
    (
      ?auto_345024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345023 ?auto_345024 ) ( ON-TABLE ?auto_345014 ) ( ON ?auto_345015 ?auto_345014 ) ( not ( = ?auto_345014 ?auto_345015 ) ) ( not ( = ?auto_345014 ?auto_345016 ) ) ( not ( = ?auto_345014 ?auto_345017 ) ) ( not ( = ?auto_345014 ?auto_345018 ) ) ( not ( = ?auto_345014 ?auto_345019 ) ) ( not ( = ?auto_345014 ?auto_345020 ) ) ( not ( = ?auto_345014 ?auto_345021 ) ) ( not ( = ?auto_345014 ?auto_345022 ) ) ( not ( = ?auto_345014 ?auto_345023 ) ) ( not ( = ?auto_345014 ?auto_345024 ) ) ( not ( = ?auto_345015 ?auto_345016 ) ) ( not ( = ?auto_345015 ?auto_345017 ) ) ( not ( = ?auto_345015 ?auto_345018 ) ) ( not ( = ?auto_345015 ?auto_345019 ) ) ( not ( = ?auto_345015 ?auto_345020 ) ) ( not ( = ?auto_345015 ?auto_345021 ) ) ( not ( = ?auto_345015 ?auto_345022 ) ) ( not ( = ?auto_345015 ?auto_345023 ) ) ( not ( = ?auto_345015 ?auto_345024 ) ) ( not ( = ?auto_345016 ?auto_345017 ) ) ( not ( = ?auto_345016 ?auto_345018 ) ) ( not ( = ?auto_345016 ?auto_345019 ) ) ( not ( = ?auto_345016 ?auto_345020 ) ) ( not ( = ?auto_345016 ?auto_345021 ) ) ( not ( = ?auto_345016 ?auto_345022 ) ) ( not ( = ?auto_345016 ?auto_345023 ) ) ( not ( = ?auto_345016 ?auto_345024 ) ) ( not ( = ?auto_345017 ?auto_345018 ) ) ( not ( = ?auto_345017 ?auto_345019 ) ) ( not ( = ?auto_345017 ?auto_345020 ) ) ( not ( = ?auto_345017 ?auto_345021 ) ) ( not ( = ?auto_345017 ?auto_345022 ) ) ( not ( = ?auto_345017 ?auto_345023 ) ) ( not ( = ?auto_345017 ?auto_345024 ) ) ( not ( = ?auto_345018 ?auto_345019 ) ) ( not ( = ?auto_345018 ?auto_345020 ) ) ( not ( = ?auto_345018 ?auto_345021 ) ) ( not ( = ?auto_345018 ?auto_345022 ) ) ( not ( = ?auto_345018 ?auto_345023 ) ) ( not ( = ?auto_345018 ?auto_345024 ) ) ( not ( = ?auto_345019 ?auto_345020 ) ) ( not ( = ?auto_345019 ?auto_345021 ) ) ( not ( = ?auto_345019 ?auto_345022 ) ) ( not ( = ?auto_345019 ?auto_345023 ) ) ( not ( = ?auto_345019 ?auto_345024 ) ) ( not ( = ?auto_345020 ?auto_345021 ) ) ( not ( = ?auto_345020 ?auto_345022 ) ) ( not ( = ?auto_345020 ?auto_345023 ) ) ( not ( = ?auto_345020 ?auto_345024 ) ) ( not ( = ?auto_345021 ?auto_345022 ) ) ( not ( = ?auto_345021 ?auto_345023 ) ) ( not ( = ?auto_345021 ?auto_345024 ) ) ( not ( = ?auto_345022 ?auto_345023 ) ) ( not ( = ?auto_345022 ?auto_345024 ) ) ( not ( = ?auto_345023 ?auto_345024 ) ) ( ON ?auto_345022 ?auto_345023 ) ( ON ?auto_345021 ?auto_345022 ) ( ON ?auto_345020 ?auto_345021 ) ( ON ?auto_345019 ?auto_345020 ) ( ON ?auto_345018 ?auto_345019 ) ( ON ?auto_345017 ?auto_345018 ) ( CLEAR ?auto_345015 ) ( ON ?auto_345016 ?auto_345017 ) ( CLEAR ?auto_345016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_345014 ?auto_345015 ?auto_345016 )
      ( MAKE-10PILE ?auto_345014 ?auto_345015 ?auto_345016 ?auto_345017 ?auto_345018 ?auto_345019 ?auto_345020 ?auto_345021 ?auto_345022 ?auto_345023 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_345035 - BLOCK
      ?auto_345036 - BLOCK
      ?auto_345037 - BLOCK
      ?auto_345038 - BLOCK
      ?auto_345039 - BLOCK
      ?auto_345040 - BLOCK
      ?auto_345041 - BLOCK
      ?auto_345042 - BLOCK
      ?auto_345043 - BLOCK
      ?auto_345044 - BLOCK
    )
    :vars
    (
      ?auto_345045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345044 ?auto_345045 ) ( ON-TABLE ?auto_345035 ) ( ON ?auto_345036 ?auto_345035 ) ( not ( = ?auto_345035 ?auto_345036 ) ) ( not ( = ?auto_345035 ?auto_345037 ) ) ( not ( = ?auto_345035 ?auto_345038 ) ) ( not ( = ?auto_345035 ?auto_345039 ) ) ( not ( = ?auto_345035 ?auto_345040 ) ) ( not ( = ?auto_345035 ?auto_345041 ) ) ( not ( = ?auto_345035 ?auto_345042 ) ) ( not ( = ?auto_345035 ?auto_345043 ) ) ( not ( = ?auto_345035 ?auto_345044 ) ) ( not ( = ?auto_345035 ?auto_345045 ) ) ( not ( = ?auto_345036 ?auto_345037 ) ) ( not ( = ?auto_345036 ?auto_345038 ) ) ( not ( = ?auto_345036 ?auto_345039 ) ) ( not ( = ?auto_345036 ?auto_345040 ) ) ( not ( = ?auto_345036 ?auto_345041 ) ) ( not ( = ?auto_345036 ?auto_345042 ) ) ( not ( = ?auto_345036 ?auto_345043 ) ) ( not ( = ?auto_345036 ?auto_345044 ) ) ( not ( = ?auto_345036 ?auto_345045 ) ) ( not ( = ?auto_345037 ?auto_345038 ) ) ( not ( = ?auto_345037 ?auto_345039 ) ) ( not ( = ?auto_345037 ?auto_345040 ) ) ( not ( = ?auto_345037 ?auto_345041 ) ) ( not ( = ?auto_345037 ?auto_345042 ) ) ( not ( = ?auto_345037 ?auto_345043 ) ) ( not ( = ?auto_345037 ?auto_345044 ) ) ( not ( = ?auto_345037 ?auto_345045 ) ) ( not ( = ?auto_345038 ?auto_345039 ) ) ( not ( = ?auto_345038 ?auto_345040 ) ) ( not ( = ?auto_345038 ?auto_345041 ) ) ( not ( = ?auto_345038 ?auto_345042 ) ) ( not ( = ?auto_345038 ?auto_345043 ) ) ( not ( = ?auto_345038 ?auto_345044 ) ) ( not ( = ?auto_345038 ?auto_345045 ) ) ( not ( = ?auto_345039 ?auto_345040 ) ) ( not ( = ?auto_345039 ?auto_345041 ) ) ( not ( = ?auto_345039 ?auto_345042 ) ) ( not ( = ?auto_345039 ?auto_345043 ) ) ( not ( = ?auto_345039 ?auto_345044 ) ) ( not ( = ?auto_345039 ?auto_345045 ) ) ( not ( = ?auto_345040 ?auto_345041 ) ) ( not ( = ?auto_345040 ?auto_345042 ) ) ( not ( = ?auto_345040 ?auto_345043 ) ) ( not ( = ?auto_345040 ?auto_345044 ) ) ( not ( = ?auto_345040 ?auto_345045 ) ) ( not ( = ?auto_345041 ?auto_345042 ) ) ( not ( = ?auto_345041 ?auto_345043 ) ) ( not ( = ?auto_345041 ?auto_345044 ) ) ( not ( = ?auto_345041 ?auto_345045 ) ) ( not ( = ?auto_345042 ?auto_345043 ) ) ( not ( = ?auto_345042 ?auto_345044 ) ) ( not ( = ?auto_345042 ?auto_345045 ) ) ( not ( = ?auto_345043 ?auto_345044 ) ) ( not ( = ?auto_345043 ?auto_345045 ) ) ( not ( = ?auto_345044 ?auto_345045 ) ) ( ON ?auto_345043 ?auto_345044 ) ( ON ?auto_345042 ?auto_345043 ) ( ON ?auto_345041 ?auto_345042 ) ( ON ?auto_345040 ?auto_345041 ) ( ON ?auto_345039 ?auto_345040 ) ( ON ?auto_345038 ?auto_345039 ) ( CLEAR ?auto_345036 ) ( ON ?auto_345037 ?auto_345038 ) ( CLEAR ?auto_345037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_345035 ?auto_345036 ?auto_345037 )
      ( MAKE-10PILE ?auto_345035 ?auto_345036 ?auto_345037 ?auto_345038 ?auto_345039 ?auto_345040 ?auto_345041 ?auto_345042 ?auto_345043 ?auto_345044 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_345056 - BLOCK
      ?auto_345057 - BLOCK
      ?auto_345058 - BLOCK
      ?auto_345059 - BLOCK
      ?auto_345060 - BLOCK
      ?auto_345061 - BLOCK
      ?auto_345062 - BLOCK
      ?auto_345063 - BLOCK
      ?auto_345064 - BLOCK
      ?auto_345065 - BLOCK
    )
    :vars
    (
      ?auto_345066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345065 ?auto_345066 ) ( ON-TABLE ?auto_345056 ) ( not ( = ?auto_345056 ?auto_345057 ) ) ( not ( = ?auto_345056 ?auto_345058 ) ) ( not ( = ?auto_345056 ?auto_345059 ) ) ( not ( = ?auto_345056 ?auto_345060 ) ) ( not ( = ?auto_345056 ?auto_345061 ) ) ( not ( = ?auto_345056 ?auto_345062 ) ) ( not ( = ?auto_345056 ?auto_345063 ) ) ( not ( = ?auto_345056 ?auto_345064 ) ) ( not ( = ?auto_345056 ?auto_345065 ) ) ( not ( = ?auto_345056 ?auto_345066 ) ) ( not ( = ?auto_345057 ?auto_345058 ) ) ( not ( = ?auto_345057 ?auto_345059 ) ) ( not ( = ?auto_345057 ?auto_345060 ) ) ( not ( = ?auto_345057 ?auto_345061 ) ) ( not ( = ?auto_345057 ?auto_345062 ) ) ( not ( = ?auto_345057 ?auto_345063 ) ) ( not ( = ?auto_345057 ?auto_345064 ) ) ( not ( = ?auto_345057 ?auto_345065 ) ) ( not ( = ?auto_345057 ?auto_345066 ) ) ( not ( = ?auto_345058 ?auto_345059 ) ) ( not ( = ?auto_345058 ?auto_345060 ) ) ( not ( = ?auto_345058 ?auto_345061 ) ) ( not ( = ?auto_345058 ?auto_345062 ) ) ( not ( = ?auto_345058 ?auto_345063 ) ) ( not ( = ?auto_345058 ?auto_345064 ) ) ( not ( = ?auto_345058 ?auto_345065 ) ) ( not ( = ?auto_345058 ?auto_345066 ) ) ( not ( = ?auto_345059 ?auto_345060 ) ) ( not ( = ?auto_345059 ?auto_345061 ) ) ( not ( = ?auto_345059 ?auto_345062 ) ) ( not ( = ?auto_345059 ?auto_345063 ) ) ( not ( = ?auto_345059 ?auto_345064 ) ) ( not ( = ?auto_345059 ?auto_345065 ) ) ( not ( = ?auto_345059 ?auto_345066 ) ) ( not ( = ?auto_345060 ?auto_345061 ) ) ( not ( = ?auto_345060 ?auto_345062 ) ) ( not ( = ?auto_345060 ?auto_345063 ) ) ( not ( = ?auto_345060 ?auto_345064 ) ) ( not ( = ?auto_345060 ?auto_345065 ) ) ( not ( = ?auto_345060 ?auto_345066 ) ) ( not ( = ?auto_345061 ?auto_345062 ) ) ( not ( = ?auto_345061 ?auto_345063 ) ) ( not ( = ?auto_345061 ?auto_345064 ) ) ( not ( = ?auto_345061 ?auto_345065 ) ) ( not ( = ?auto_345061 ?auto_345066 ) ) ( not ( = ?auto_345062 ?auto_345063 ) ) ( not ( = ?auto_345062 ?auto_345064 ) ) ( not ( = ?auto_345062 ?auto_345065 ) ) ( not ( = ?auto_345062 ?auto_345066 ) ) ( not ( = ?auto_345063 ?auto_345064 ) ) ( not ( = ?auto_345063 ?auto_345065 ) ) ( not ( = ?auto_345063 ?auto_345066 ) ) ( not ( = ?auto_345064 ?auto_345065 ) ) ( not ( = ?auto_345064 ?auto_345066 ) ) ( not ( = ?auto_345065 ?auto_345066 ) ) ( ON ?auto_345064 ?auto_345065 ) ( ON ?auto_345063 ?auto_345064 ) ( ON ?auto_345062 ?auto_345063 ) ( ON ?auto_345061 ?auto_345062 ) ( ON ?auto_345060 ?auto_345061 ) ( ON ?auto_345059 ?auto_345060 ) ( ON ?auto_345058 ?auto_345059 ) ( CLEAR ?auto_345056 ) ( ON ?auto_345057 ?auto_345058 ) ( CLEAR ?auto_345057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_345056 ?auto_345057 )
      ( MAKE-10PILE ?auto_345056 ?auto_345057 ?auto_345058 ?auto_345059 ?auto_345060 ?auto_345061 ?auto_345062 ?auto_345063 ?auto_345064 ?auto_345065 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_345077 - BLOCK
      ?auto_345078 - BLOCK
      ?auto_345079 - BLOCK
      ?auto_345080 - BLOCK
      ?auto_345081 - BLOCK
      ?auto_345082 - BLOCK
      ?auto_345083 - BLOCK
      ?auto_345084 - BLOCK
      ?auto_345085 - BLOCK
      ?auto_345086 - BLOCK
    )
    :vars
    (
      ?auto_345087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345086 ?auto_345087 ) ( ON-TABLE ?auto_345077 ) ( not ( = ?auto_345077 ?auto_345078 ) ) ( not ( = ?auto_345077 ?auto_345079 ) ) ( not ( = ?auto_345077 ?auto_345080 ) ) ( not ( = ?auto_345077 ?auto_345081 ) ) ( not ( = ?auto_345077 ?auto_345082 ) ) ( not ( = ?auto_345077 ?auto_345083 ) ) ( not ( = ?auto_345077 ?auto_345084 ) ) ( not ( = ?auto_345077 ?auto_345085 ) ) ( not ( = ?auto_345077 ?auto_345086 ) ) ( not ( = ?auto_345077 ?auto_345087 ) ) ( not ( = ?auto_345078 ?auto_345079 ) ) ( not ( = ?auto_345078 ?auto_345080 ) ) ( not ( = ?auto_345078 ?auto_345081 ) ) ( not ( = ?auto_345078 ?auto_345082 ) ) ( not ( = ?auto_345078 ?auto_345083 ) ) ( not ( = ?auto_345078 ?auto_345084 ) ) ( not ( = ?auto_345078 ?auto_345085 ) ) ( not ( = ?auto_345078 ?auto_345086 ) ) ( not ( = ?auto_345078 ?auto_345087 ) ) ( not ( = ?auto_345079 ?auto_345080 ) ) ( not ( = ?auto_345079 ?auto_345081 ) ) ( not ( = ?auto_345079 ?auto_345082 ) ) ( not ( = ?auto_345079 ?auto_345083 ) ) ( not ( = ?auto_345079 ?auto_345084 ) ) ( not ( = ?auto_345079 ?auto_345085 ) ) ( not ( = ?auto_345079 ?auto_345086 ) ) ( not ( = ?auto_345079 ?auto_345087 ) ) ( not ( = ?auto_345080 ?auto_345081 ) ) ( not ( = ?auto_345080 ?auto_345082 ) ) ( not ( = ?auto_345080 ?auto_345083 ) ) ( not ( = ?auto_345080 ?auto_345084 ) ) ( not ( = ?auto_345080 ?auto_345085 ) ) ( not ( = ?auto_345080 ?auto_345086 ) ) ( not ( = ?auto_345080 ?auto_345087 ) ) ( not ( = ?auto_345081 ?auto_345082 ) ) ( not ( = ?auto_345081 ?auto_345083 ) ) ( not ( = ?auto_345081 ?auto_345084 ) ) ( not ( = ?auto_345081 ?auto_345085 ) ) ( not ( = ?auto_345081 ?auto_345086 ) ) ( not ( = ?auto_345081 ?auto_345087 ) ) ( not ( = ?auto_345082 ?auto_345083 ) ) ( not ( = ?auto_345082 ?auto_345084 ) ) ( not ( = ?auto_345082 ?auto_345085 ) ) ( not ( = ?auto_345082 ?auto_345086 ) ) ( not ( = ?auto_345082 ?auto_345087 ) ) ( not ( = ?auto_345083 ?auto_345084 ) ) ( not ( = ?auto_345083 ?auto_345085 ) ) ( not ( = ?auto_345083 ?auto_345086 ) ) ( not ( = ?auto_345083 ?auto_345087 ) ) ( not ( = ?auto_345084 ?auto_345085 ) ) ( not ( = ?auto_345084 ?auto_345086 ) ) ( not ( = ?auto_345084 ?auto_345087 ) ) ( not ( = ?auto_345085 ?auto_345086 ) ) ( not ( = ?auto_345085 ?auto_345087 ) ) ( not ( = ?auto_345086 ?auto_345087 ) ) ( ON ?auto_345085 ?auto_345086 ) ( ON ?auto_345084 ?auto_345085 ) ( ON ?auto_345083 ?auto_345084 ) ( ON ?auto_345082 ?auto_345083 ) ( ON ?auto_345081 ?auto_345082 ) ( ON ?auto_345080 ?auto_345081 ) ( ON ?auto_345079 ?auto_345080 ) ( CLEAR ?auto_345077 ) ( ON ?auto_345078 ?auto_345079 ) ( CLEAR ?auto_345078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_345077 ?auto_345078 )
      ( MAKE-10PILE ?auto_345077 ?auto_345078 ?auto_345079 ?auto_345080 ?auto_345081 ?auto_345082 ?auto_345083 ?auto_345084 ?auto_345085 ?auto_345086 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_345098 - BLOCK
      ?auto_345099 - BLOCK
      ?auto_345100 - BLOCK
      ?auto_345101 - BLOCK
      ?auto_345102 - BLOCK
      ?auto_345103 - BLOCK
      ?auto_345104 - BLOCK
      ?auto_345105 - BLOCK
      ?auto_345106 - BLOCK
      ?auto_345107 - BLOCK
    )
    :vars
    (
      ?auto_345108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345107 ?auto_345108 ) ( not ( = ?auto_345098 ?auto_345099 ) ) ( not ( = ?auto_345098 ?auto_345100 ) ) ( not ( = ?auto_345098 ?auto_345101 ) ) ( not ( = ?auto_345098 ?auto_345102 ) ) ( not ( = ?auto_345098 ?auto_345103 ) ) ( not ( = ?auto_345098 ?auto_345104 ) ) ( not ( = ?auto_345098 ?auto_345105 ) ) ( not ( = ?auto_345098 ?auto_345106 ) ) ( not ( = ?auto_345098 ?auto_345107 ) ) ( not ( = ?auto_345098 ?auto_345108 ) ) ( not ( = ?auto_345099 ?auto_345100 ) ) ( not ( = ?auto_345099 ?auto_345101 ) ) ( not ( = ?auto_345099 ?auto_345102 ) ) ( not ( = ?auto_345099 ?auto_345103 ) ) ( not ( = ?auto_345099 ?auto_345104 ) ) ( not ( = ?auto_345099 ?auto_345105 ) ) ( not ( = ?auto_345099 ?auto_345106 ) ) ( not ( = ?auto_345099 ?auto_345107 ) ) ( not ( = ?auto_345099 ?auto_345108 ) ) ( not ( = ?auto_345100 ?auto_345101 ) ) ( not ( = ?auto_345100 ?auto_345102 ) ) ( not ( = ?auto_345100 ?auto_345103 ) ) ( not ( = ?auto_345100 ?auto_345104 ) ) ( not ( = ?auto_345100 ?auto_345105 ) ) ( not ( = ?auto_345100 ?auto_345106 ) ) ( not ( = ?auto_345100 ?auto_345107 ) ) ( not ( = ?auto_345100 ?auto_345108 ) ) ( not ( = ?auto_345101 ?auto_345102 ) ) ( not ( = ?auto_345101 ?auto_345103 ) ) ( not ( = ?auto_345101 ?auto_345104 ) ) ( not ( = ?auto_345101 ?auto_345105 ) ) ( not ( = ?auto_345101 ?auto_345106 ) ) ( not ( = ?auto_345101 ?auto_345107 ) ) ( not ( = ?auto_345101 ?auto_345108 ) ) ( not ( = ?auto_345102 ?auto_345103 ) ) ( not ( = ?auto_345102 ?auto_345104 ) ) ( not ( = ?auto_345102 ?auto_345105 ) ) ( not ( = ?auto_345102 ?auto_345106 ) ) ( not ( = ?auto_345102 ?auto_345107 ) ) ( not ( = ?auto_345102 ?auto_345108 ) ) ( not ( = ?auto_345103 ?auto_345104 ) ) ( not ( = ?auto_345103 ?auto_345105 ) ) ( not ( = ?auto_345103 ?auto_345106 ) ) ( not ( = ?auto_345103 ?auto_345107 ) ) ( not ( = ?auto_345103 ?auto_345108 ) ) ( not ( = ?auto_345104 ?auto_345105 ) ) ( not ( = ?auto_345104 ?auto_345106 ) ) ( not ( = ?auto_345104 ?auto_345107 ) ) ( not ( = ?auto_345104 ?auto_345108 ) ) ( not ( = ?auto_345105 ?auto_345106 ) ) ( not ( = ?auto_345105 ?auto_345107 ) ) ( not ( = ?auto_345105 ?auto_345108 ) ) ( not ( = ?auto_345106 ?auto_345107 ) ) ( not ( = ?auto_345106 ?auto_345108 ) ) ( not ( = ?auto_345107 ?auto_345108 ) ) ( ON ?auto_345106 ?auto_345107 ) ( ON ?auto_345105 ?auto_345106 ) ( ON ?auto_345104 ?auto_345105 ) ( ON ?auto_345103 ?auto_345104 ) ( ON ?auto_345102 ?auto_345103 ) ( ON ?auto_345101 ?auto_345102 ) ( ON ?auto_345100 ?auto_345101 ) ( ON ?auto_345099 ?auto_345100 ) ( ON ?auto_345098 ?auto_345099 ) ( CLEAR ?auto_345098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_345098 )
      ( MAKE-10PILE ?auto_345098 ?auto_345099 ?auto_345100 ?auto_345101 ?auto_345102 ?auto_345103 ?auto_345104 ?auto_345105 ?auto_345106 ?auto_345107 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_345119 - BLOCK
      ?auto_345120 - BLOCK
      ?auto_345121 - BLOCK
      ?auto_345122 - BLOCK
      ?auto_345123 - BLOCK
      ?auto_345124 - BLOCK
      ?auto_345125 - BLOCK
      ?auto_345126 - BLOCK
      ?auto_345127 - BLOCK
      ?auto_345128 - BLOCK
    )
    :vars
    (
      ?auto_345129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345128 ?auto_345129 ) ( not ( = ?auto_345119 ?auto_345120 ) ) ( not ( = ?auto_345119 ?auto_345121 ) ) ( not ( = ?auto_345119 ?auto_345122 ) ) ( not ( = ?auto_345119 ?auto_345123 ) ) ( not ( = ?auto_345119 ?auto_345124 ) ) ( not ( = ?auto_345119 ?auto_345125 ) ) ( not ( = ?auto_345119 ?auto_345126 ) ) ( not ( = ?auto_345119 ?auto_345127 ) ) ( not ( = ?auto_345119 ?auto_345128 ) ) ( not ( = ?auto_345119 ?auto_345129 ) ) ( not ( = ?auto_345120 ?auto_345121 ) ) ( not ( = ?auto_345120 ?auto_345122 ) ) ( not ( = ?auto_345120 ?auto_345123 ) ) ( not ( = ?auto_345120 ?auto_345124 ) ) ( not ( = ?auto_345120 ?auto_345125 ) ) ( not ( = ?auto_345120 ?auto_345126 ) ) ( not ( = ?auto_345120 ?auto_345127 ) ) ( not ( = ?auto_345120 ?auto_345128 ) ) ( not ( = ?auto_345120 ?auto_345129 ) ) ( not ( = ?auto_345121 ?auto_345122 ) ) ( not ( = ?auto_345121 ?auto_345123 ) ) ( not ( = ?auto_345121 ?auto_345124 ) ) ( not ( = ?auto_345121 ?auto_345125 ) ) ( not ( = ?auto_345121 ?auto_345126 ) ) ( not ( = ?auto_345121 ?auto_345127 ) ) ( not ( = ?auto_345121 ?auto_345128 ) ) ( not ( = ?auto_345121 ?auto_345129 ) ) ( not ( = ?auto_345122 ?auto_345123 ) ) ( not ( = ?auto_345122 ?auto_345124 ) ) ( not ( = ?auto_345122 ?auto_345125 ) ) ( not ( = ?auto_345122 ?auto_345126 ) ) ( not ( = ?auto_345122 ?auto_345127 ) ) ( not ( = ?auto_345122 ?auto_345128 ) ) ( not ( = ?auto_345122 ?auto_345129 ) ) ( not ( = ?auto_345123 ?auto_345124 ) ) ( not ( = ?auto_345123 ?auto_345125 ) ) ( not ( = ?auto_345123 ?auto_345126 ) ) ( not ( = ?auto_345123 ?auto_345127 ) ) ( not ( = ?auto_345123 ?auto_345128 ) ) ( not ( = ?auto_345123 ?auto_345129 ) ) ( not ( = ?auto_345124 ?auto_345125 ) ) ( not ( = ?auto_345124 ?auto_345126 ) ) ( not ( = ?auto_345124 ?auto_345127 ) ) ( not ( = ?auto_345124 ?auto_345128 ) ) ( not ( = ?auto_345124 ?auto_345129 ) ) ( not ( = ?auto_345125 ?auto_345126 ) ) ( not ( = ?auto_345125 ?auto_345127 ) ) ( not ( = ?auto_345125 ?auto_345128 ) ) ( not ( = ?auto_345125 ?auto_345129 ) ) ( not ( = ?auto_345126 ?auto_345127 ) ) ( not ( = ?auto_345126 ?auto_345128 ) ) ( not ( = ?auto_345126 ?auto_345129 ) ) ( not ( = ?auto_345127 ?auto_345128 ) ) ( not ( = ?auto_345127 ?auto_345129 ) ) ( not ( = ?auto_345128 ?auto_345129 ) ) ( ON ?auto_345127 ?auto_345128 ) ( ON ?auto_345126 ?auto_345127 ) ( ON ?auto_345125 ?auto_345126 ) ( ON ?auto_345124 ?auto_345125 ) ( ON ?auto_345123 ?auto_345124 ) ( ON ?auto_345122 ?auto_345123 ) ( ON ?auto_345121 ?auto_345122 ) ( ON ?auto_345120 ?auto_345121 ) ( ON ?auto_345119 ?auto_345120 ) ( CLEAR ?auto_345119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_345119 )
      ( MAKE-10PILE ?auto_345119 ?auto_345120 ?auto_345121 ?auto_345122 ?auto_345123 ?auto_345124 ?auto_345125 ?auto_345126 ?auto_345127 ?auto_345128 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_345141 - BLOCK
      ?auto_345142 - BLOCK
      ?auto_345143 - BLOCK
      ?auto_345144 - BLOCK
      ?auto_345145 - BLOCK
      ?auto_345146 - BLOCK
      ?auto_345147 - BLOCK
      ?auto_345148 - BLOCK
      ?auto_345149 - BLOCK
      ?auto_345150 - BLOCK
      ?auto_345151 - BLOCK
    )
    :vars
    (
      ?auto_345152 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_345150 ) ( ON ?auto_345151 ?auto_345152 ) ( CLEAR ?auto_345151 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_345141 ) ( ON ?auto_345142 ?auto_345141 ) ( ON ?auto_345143 ?auto_345142 ) ( ON ?auto_345144 ?auto_345143 ) ( ON ?auto_345145 ?auto_345144 ) ( ON ?auto_345146 ?auto_345145 ) ( ON ?auto_345147 ?auto_345146 ) ( ON ?auto_345148 ?auto_345147 ) ( ON ?auto_345149 ?auto_345148 ) ( ON ?auto_345150 ?auto_345149 ) ( not ( = ?auto_345141 ?auto_345142 ) ) ( not ( = ?auto_345141 ?auto_345143 ) ) ( not ( = ?auto_345141 ?auto_345144 ) ) ( not ( = ?auto_345141 ?auto_345145 ) ) ( not ( = ?auto_345141 ?auto_345146 ) ) ( not ( = ?auto_345141 ?auto_345147 ) ) ( not ( = ?auto_345141 ?auto_345148 ) ) ( not ( = ?auto_345141 ?auto_345149 ) ) ( not ( = ?auto_345141 ?auto_345150 ) ) ( not ( = ?auto_345141 ?auto_345151 ) ) ( not ( = ?auto_345141 ?auto_345152 ) ) ( not ( = ?auto_345142 ?auto_345143 ) ) ( not ( = ?auto_345142 ?auto_345144 ) ) ( not ( = ?auto_345142 ?auto_345145 ) ) ( not ( = ?auto_345142 ?auto_345146 ) ) ( not ( = ?auto_345142 ?auto_345147 ) ) ( not ( = ?auto_345142 ?auto_345148 ) ) ( not ( = ?auto_345142 ?auto_345149 ) ) ( not ( = ?auto_345142 ?auto_345150 ) ) ( not ( = ?auto_345142 ?auto_345151 ) ) ( not ( = ?auto_345142 ?auto_345152 ) ) ( not ( = ?auto_345143 ?auto_345144 ) ) ( not ( = ?auto_345143 ?auto_345145 ) ) ( not ( = ?auto_345143 ?auto_345146 ) ) ( not ( = ?auto_345143 ?auto_345147 ) ) ( not ( = ?auto_345143 ?auto_345148 ) ) ( not ( = ?auto_345143 ?auto_345149 ) ) ( not ( = ?auto_345143 ?auto_345150 ) ) ( not ( = ?auto_345143 ?auto_345151 ) ) ( not ( = ?auto_345143 ?auto_345152 ) ) ( not ( = ?auto_345144 ?auto_345145 ) ) ( not ( = ?auto_345144 ?auto_345146 ) ) ( not ( = ?auto_345144 ?auto_345147 ) ) ( not ( = ?auto_345144 ?auto_345148 ) ) ( not ( = ?auto_345144 ?auto_345149 ) ) ( not ( = ?auto_345144 ?auto_345150 ) ) ( not ( = ?auto_345144 ?auto_345151 ) ) ( not ( = ?auto_345144 ?auto_345152 ) ) ( not ( = ?auto_345145 ?auto_345146 ) ) ( not ( = ?auto_345145 ?auto_345147 ) ) ( not ( = ?auto_345145 ?auto_345148 ) ) ( not ( = ?auto_345145 ?auto_345149 ) ) ( not ( = ?auto_345145 ?auto_345150 ) ) ( not ( = ?auto_345145 ?auto_345151 ) ) ( not ( = ?auto_345145 ?auto_345152 ) ) ( not ( = ?auto_345146 ?auto_345147 ) ) ( not ( = ?auto_345146 ?auto_345148 ) ) ( not ( = ?auto_345146 ?auto_345149 ) ) ( not ( = ?auto_345146 ?auto_345150 ) ) ( not ( = ?auto_345146 ?auto_345151 ) ) ( not ( = ?auto_345146 ?auto_345152 ) ) ( not ( = ?auto_345147 ?auto_345148 ) ) ( not ( = ?auto_345147 ?auto_345149 ) ) ( not ( = ?auto_345147 ?auto_345150 ) ) ( not ( = ?auto_345147 ?auto_345151 ) ) ( not ( = ?auto_345147 ?auto_345152 ) ) ( not ( = ?auto_345148 ?auto_345149 ) ) ( not ( = ?auto_345148 ?auto_345150 ) ) ( not ( = ?auto_345148 ?auto_345151 ) ) ( not ( = ?auto_345148 ?auto_345152 ) ) ( not ( = ?auto_345149 ?auto_345150 ) ) ( not ( = ?auto_345149 ?auto_345151 ) ) ( not ( = ?auto_345149 ?auto_345152 ) ) ( not ( = ?auto_345150 ?auto_345151 ) ) ( not ( = ?auto_345150 ?auto_345152 ) ) ( not ( = ?auto_345151 ?auto_345152 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_345151 ?auto_345152 )
      ( !STACK ?auto_345151 ?auto_345150 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_345164 - BLOCK
      ?auto_345165 - BLOCK
      ?auto_345166 - BLOCK
      ?auto_345167 - BLOCK
      ?auto_345168 - BLOCK
      ?auto_345169 - BLOCK
      ?auto_345170 - BLOCK
      ?auto_345171 - BLOCK
      ?auto_345172 - BLOCK
      ?auto_345173 - BLOCK
      ?auto_345174 - BLOCK
    )
    :vars
    (
      ?auto_345175 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_345173 ) ( ON ?auto_345174 ?auto_345175 ) ( CLEAR ?auto_345174 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_345164 ) ( ON ?auto_345165 ?auto_345164 ) ( ON ?auto_345166 ?auto_345165 ) ( ON ?auto_345167 ?auto_345166 ) ( ON ?auto_345168 ?auto_345167 ) ( ON ?auto_345169 ?auto_345168 ) ( ON ?auto_345170 ?auto_345169 ) ( ON ?auto_345171 ?auto_345170 ) ( ON ?auto_345172 ?auto_345171 ) ( ON ?auto_345173 ?auto_345172 ) ( not ( = ?auto_345164 ?auto_345165 ) ) ( not ( = ?auto_345164 ?auto_345166 ) ) ( not ( = ?auto_345164 ?auto_345167 ) ) ( not ( = ?auto_345164 ?auto_345168 ) ) ( not ( = ?auto_345164 ?auto_345169 ) ) ( not ( = ?auto_345164 ?auto_345170 ) ) ( not ( = ?auto_345164 ?auto_345171 ) ) ( not ( = ?auto_345164 ?auto_345172 ) ) ( not ( = ?auto_345164 ?auto_345173 ) ) ( not ( = ?auto_345164 ?auto_345174 ) ) ( not ( = ?auto_345164 ?auto_345175 ) ) ( not ( = ?auto_345165 ?auto_345166 ) ) ( not ( = ?auto_345165 ?auto_345167 ) ) ( not ( = ?auto_345165 ?auto_345168 ) ) ( not ( = ?auto_345165 ?auto_345169 ) ) ( not ( = ?auto_345165 ?auto_345170 ) ) ( not ( = ?auto_345165 ?auto_345171 ) ) ( not ( = ?auto_345165 ?auto_345172 ) ) ( not ( = ?auto_345165 ?auto_345173 ) ) ( not ( = ?auto_345165 ?auto_345174 ) ) ( not ( = ?auto_345165 ?auto_345175 ) ) ( not ( = ?auto_345166 ?auto_345167 ) ) ( not ( = ?auto_345166 ?auto_345168 ) ) ( not ( = ?auto_345166 ?auto_345169 ) ) ( not ( = ?auto_345166 ?auto_345170 ) ) ( not ( = ?auto_345166 ?auto_345171 ) ) ( not ( = ?auto_345166 ?auto_345172 ) ) ( not ( = ?auto_345166 ?auto_345173 ) ) ( not ( = ?auto_345166 ?auto_345174 ) ) ( not ( = ?auto_345166 ?auto_345175 ) ) ( not ( = ?auto_345167 ?auto_345168 ) ) ( not ( = ?auto_345167 ?auto_345169 ) ) ( not ( = ?auto_345167 ?auto_345170 ) ) ( not ( = ?auto_345167 ?auto_345171 ) ) ( not ( = ?auto_345167 ?auto_345172 ) ) ( not ( = ?auto_345167 ?auto_345173 ) ) ( not ( = ?auto_345167 ?auto_345174 ) ) ( not ( = ?auto_345167 ?auto_345175 ) ) ( not ( = ?auto_345168 ?auto_345169 ) ) ( not ( = ?auto_345168 ?auto_345170 ) ) ( not ( = ?auto_345168 ?auto_345171 ) ) ( not ( = ?auto_345168 ?auto_345172 ) ) ( not ( = ?auto_345168 ?auto_345173 ) ) ( not ( = ?auto_345168 ?auto_345174 ) ) ( not ( = ?auto_345168 ?auto_345175 ) ) ( not ( = ?auto_345169 ?auto_345170 ) ) ( not ( = ?auto_345169 ?auto_345171 ) ) ( not ( = ?auto_345169 ?auto_345172 ) ) ( not ( = ?auto_345169 ?auto_345173 ) ) ( not ( = ?auto_345169 ?auto_345174 ) ) ( not ( = ?auto_345169 ?auto_345175 ) ) ( not ( = ?auto_345170 ?auto_345171 ) ) ( not ( = ?auto_345170 ?auto_345172 ) ) ( not ( = ?auto_345170 ?auto_345173 ) ) ( not ( = ?auto_345170 ?auto_345174 ) ) ( not ( = ?auto_345170 ?auto_345175 ) ) ( not ( = ?auto_345171 ?auto_345172 ) ) ( not ( = ?auto_345171 ?auto_345173 ) ) ( not ( = ?auto_345171 ?auto_345174 ) ) ( not ( = ?auto_345171 ?auto_345175 ) ) ( not ( = ?auto_345172 ?auto_345173 ) ) ( not ( = ?auto_345172 ?auto_345174 ) ) ( not ( = ?auto_345172 ?auto_345175 ) ) ( not ( = ?auto_345173 ?auto_345174 ) ) ( not ( = ?auto_345173 ?auto_345175 ) ) ( not ( = ?auto_345174 ?auto_345175 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_345174 ?auto_345175 )
      ( !STACK ?auto_345174 ?auto_345173 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_345187 - BLOCK
      ?auto_345188 - BLOCK
      ?auto_345189 - BLOCK
      ?auto_345190 - BLOCK
      ?auto_345191 - BLOCK
      ?auto_345192 - BLOCK
      ?auto_345193 - BLOCK
      ?auto_345194 - BLOCK
      ?auto_345195 - BLOCK
      ?auto_345196 - BLOCK
      ?auto_345197 - BLOCK
    )
    :vars
    (
      ?auto_345198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345197 ?auto_345198 ) ( ON-TABLE ?auto_345187 ) ( ON ?auto_345188 ?auto_345187 ) ( ON ?auto_345189 ?auto_345188 ) ( ON ?auto_345190 ?auto_345189 ) ( ON ?auto_345191 ?auto_345190 ) ( ON ?auto_345192 ?auto_345191 ) ( ON ?auto_345193 ?auto_345192 ) ( ON ?auto_345194 ?auto_345193 ) ( ON ?auto_345195 ?auto_345194 ) ( not ( = ?auto_345187 ?auto_345188 ) ) ( not ( = ?auto_345187 ?auto_345189 ) ) ( not ( = ?auto_345187 ?auto_345190 ) ) ( not ( = ?auto_345187 ?auto_345191 ) ) ( not ( = ?auto_345187 ?auto_345192 ) ) ( not ( = ?auto_345187 ?auto_345193 ) ) ( not ( = ?auto_345187 ?auto_345194 ) ) ( not ( = ?auto_345187 ?auto_345195 ) ) ( not ( = ?auto_345187 ?auto_345196 ) ) ( not ( = ?auto_345187 ?auto_345197 ) ) ( not ( = ?auto_345187 ?auto_345198 ) ) ( not ( = ?auto_345188 ?auto_345189 ) ) ( not ( = ?auto_345188 ?auto_345190 ) ) ( not ( = ?auto_345188 ?auto_345191 ) ) ( not ( = ?auto_345188 ?auto_345192 ) ) ( not ( = ?auto_345188 ?auto_345193 ) ) ( not ( = ?auto_345188 ?auto_345194 ) ) ( not ( = ?auto_345188 ?auto_345195 ) ) ( not ( = ?auto_345188 ?auto_345196 ) ) ( not ( = ?auto_345188 ?auto_345197 ) ) ( not ( = ?auto_345188 ?auto_345198 ) ) ( not ( = ?auto_345189 ?auto_345190 ) ) ( not ( = ?auto_345189 ?auto_345191 ) ) ( not ( = ?auto_345189 ?auto_345192 ) ) ( not ( = ?auto_345189 ?auto_345193 ) ) ( not ( = ?auto_345189 ?auto_345194 ) ) ( not ( = ?auto_345189 ?auto_345195 ) ) ( not ( = ?auto_345189 ?auto_345196 ) ) ( not ( = ?auto_345189 ?auto_345197 ) ) ( not ( = ?auto_345189 ?auto_345198 ) ) ( not ( = ?auto_345190 ?auto_345191 ) ) ( not ( = ?auto_345190 ?auto_345192 ) ) ( not ( = ?auto_345190 ?auto_345193 ) ) ( not ( = ?auto_345190 ?auto_345194 ) ) ( not ( = ?auto_345190 ?auto_345195 ) ) ( not ( = ?auto_345190 ?auto_345196 ) ) ( not ( = ?auto_345190 ?auto_345197 ) ) ( not ( = ?auto_345190 ?auto_345198 ) ) ( not ( = ?auto_345191 ?auto_345192 ) ) ( not ( = ?auto_345191 ?auto_345193 ) ) ( not ( = ?auto_345191 ?auto_345194 ) ) ( not ( = ?auto_345191 ?auto_345195 ) ) ( not ( = ?auto_345191 ?auto_345196 ) ) ( not ( = ?auto_345191 ?auto_345197 ) ) ( not ( = ?auto_345191 ?auto_345198 ) ) ( not ( = ?auto_345192 ?auto_345193 ) ) ( not ( = ?auto_345192 ?auto_345194 ) ) ( not ( = ?auto_345192 ?auto_345195 ) ) ( not ( = ?auto_345192 ?auto_345196 ) ) ( not ( = ?auto_345192 ?auto_345197 ) ) ( not ( = ?auto_345192 ?auto_345198 ) ) ( not ( = ?auto_345193 ?auto_345194 ) ) ( not ( = ?auto_345193 ?auto_345195 ) ) ( not ( = ?auto_345193 ?auto_345196 ) ) ( not ( = ?auto_345193 ?auto_345197 ) ) ( not ( = ?auto_345193 ?auto_345198 ) ) ( not ( = ?auto_345194 ?auto_345195 ) ) ( not ( = ?auto_345194 ?auto_345196 ) ) ( not ( = ?auto_345194 ?auto_345197 ) ) ( not ( = ?auto_345194 ?auto_345198 ) ) ( not ( = ?auto_345195 ?auto_345196 ) ) ( not ( = ?auto_345195 ?auto_345197 ) ) ( not ( = ?auto_345195 ?auto_345198 ) ) ( not ( = ?auto_345196 ?auto_345197 ) ) ( not ( = ?auto_345196 ?auto_345198 ) ) ( not ( = ?auto_345197 ?auto_345198 ) ) ( CLEAR ?auto_345195 ) ( ON ?auto_345196 ?auto_345197 ) ( CLEAR ?auto_345196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_345187 ?auto_345188 ?auto_345189 ?auto_345190 ?auto_345191 ?auto_345192 ?auto_345193 ?auto_345194 ?auto_345195 ?auto_345196 )
      ( MAKE-11PILE ?auto_345187 ?auto_345188 ?auto_345189 ?auto_345190 ?auto_345191 ?auto_345192 ?auto_345193 ?auto_345194 ?auto_345195 ?auto_345196 ?auto_345197 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_345210 - BLOCK
      ?auto_345211 - BLOCK
      ?auto_345212 - BLOCK
      ?auto_345213 - BLOCK
      ?auto_345214 - BLOCK
      ?auto_345215 - BLOCK
      ?auto_345216 - BLOCK
      ?auto_345217 - BLOCK
      ?auto_345218 - BLOCK
      ?auto_345219 - BLOCK
      ?auto_345220 - BLOCK
    )
    :vars
    (
      ?auto_345221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345220 ?auto_345221 ) ( ON-TABLE ?auto_345210 ) ( ON ?auto_345211 ?auto_345210 ) ( ON ?auto_345212 ?auto_345211 ) ( ON ?auto_345213 ?auto_345212 ) ( ON ?auto_345214 ?auto_345213 ) ( ON ?auto_345215 ?auto_345214 ) ( ON ?auto_345216 ?auto_345215 ) ( ON ?auto_345217 ?auto_345216 ) ( ON ?auto_345218 ?auto_345217 ) ( not ( = ?auto_345210 ?auto_345211 ) ) ( not ( = ?auto_345210 ?auto_345212 ) ) ( not ( = ?auto_345210 ?auto_345213 ) ) ( not ( = ?auto_345210 ?auto_345214 ) ) ( not ( = ?auto_345210 ?auto_345215 ) ) ( not ( = ?auto_345210 ?auto_345216 ) ) ( not ( = ?auto_345210 ?auto_345217 ) ) ( not ( = ?auto_345210 ?auto_345218 ) ) ( not ( = ?auto_345210 ?auto_345219 ) ) ( not ( = ?auto_345210 ?auto_345220 ) ) ( not ( = ?auto_345210 ?auto_345221 ) ) ( not ( = ?auto_345211 ?auto_345212 ) ) ( not ( = ?auto_345211 ?auto_345213 ) ) ( not ( = ?auto_345211 ?auto_345214 ) ) ( not ( = ?auto_345211 ?auto_345215 ) ) ( not ( = ?auto_345211 ?auto_345216 ) ) ( not ( = ?auto_345211 ?auto_345217 ) ) ( not ( = ?auto_345211 ?auto_345218 ) ) ( not ( = ?auto_345211 ?auto_345219 ) ) ( not ( = ?auto_345211 ?auto_345220 ) ) ( not ( = ?auto_345211 ?auto_345221 ) ) ( not ( = ?auto_345212 ?auto_345213 ) ) ( not ( = ?auto_345212 ?auto_345214 ) ) ( not ( = ?auto_345212 ?auto_345215 ) ) ( not ( = ?auto_345212 ?auto_345216 ) ) ( not ( = ?auto_345212 ?auto_345217 ) ) ( not ( = ?auto_345212 ?auto_345218 ) ) ( not ( = ?auto_345212 ?auto_345219 ) ) ( not ( = ?auto_345212 ?auto_345220 ) ) ( not ( = ?auto_345212 ?auto_345221 ) ) ( not ( = ?auto_345213 ?auto_345214 ) ) ( not ( = ?auto_345213 ?auto_345215 ) ) ( not ( = ?auto_345213 ?auto_345216 ) ) ( not ( = ?auto_345213 ?auto_345217 ) ) ( not ( = ?auto_345213 ?auto_345218 ) ) ( not ( = ?auto_345213 ?auto_345219 ) ) ( not ( = ?auto_345213 ?auto_345220 ) ) ( not ( = ?auto_345213 ?auto_345221 ) ) ( not ( = ?auto_345214 ?auto_345215 ) ) ( not ( = ?auto_345214 ?auto_345216 ) ) ( not ( = ?auto_345214 ?auto_345217 ) ) ( not ( = ?auto_345214 ?auto_345218 ) ) ( not ( = ?auto_345214 ?auto_345219 ) ) ( not ( = ?auto_345214 ?auto_345220 ) ) ( not ( = ?auto_345214 ?auto_345221 ) ) ( not ( = ?auto_345215 ?auto_345216 ) ) ( not ( = ?auto_345215 ?auto_345217 ) ) ( not ( = ?auto_345215 ?auto_345218 ) ) ( not ( = ?auto_345215 ?auto_345219 ) ) ( not ( = ?auto_345215 ?auto_345220 ) ) ( not ( = ?auto_345215 ?auto_345221 ) ) ( not ( = ?auto_345216 ?auto_345217 ) ) ( not ( = ?auto_345216 ?auto_345218 ) ) ( not ( = ?auto_345216 ?auto_345219 ) ) ( not ( = ?auto_345216 ?auto_345220 ) ) ( not ( = ?auto_345216 ?auto_345221 ) ) ( not ( = ?auto_345217 ?auto_345218 ) ) ( not ( = ?auto_345217 ?auto_345219 ) ) ( not ( = ?auto_345217 ?auto_345220 ) ) ( not ( = ?auto_345217 ?auto_345221 ) ) ( not ( = ?auto_345218 ?auto_345219 ) ) ( not ( = ?auto_345218 ?auto_345220 ) ) ( not ( = ?auto_345218 ?auto_345221 ) ) ( not ( = ?auto_345219 ?auto_345220 ) ) ( not ( = ?auto_345219 ?auto_345221 ) ) ( not ( = ?auto_345220 ?auto_345221 ) ) ( CLEAR ?auto_345218 ) ( ON ?auto_345219 ?auto_345220 ) ( CLEAR ?auto_345219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_345210 ?auto_345211 ?auto_345212 ?auto_345213 ?auto_345214 ?auto_345215 ?auto_345216 ?auto_345217 ?auto_345218 ?auto_345219 )
      ( MAKE-11PILE ?auto_345210 ?auto_345211 ?auto_345212 ?auto_345213 ?auto_345214 ?auto_345215 ?auto_345216 ?auto_345217 ?auto_345218 ?auto_345219 ?auto_345220 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_345233 - BLOCK
      ?auto_345234 - BLOCK
      ?auto_345235 - BLOCK
      ?auto_345236 - BLOCK
      ?auto_345237 - BLOCK
      ?auto_345238 - BLOCK
      ?auto_345239 - BLOCK
      ?auto_345240 - BLOCK
      ?auto_345241 - BLOCK
      ?auto_345242 - BLOCK
      ?auto_345243 - BLOCK
    )
    :vars
    (
      ?auto_345244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345243 ?auto_345244 ) ( ON-TABLE ?auto_345233 ) ( ON ?auto_345234 ?auto_345233 ) ( ON ?auto_345235 ?auto_345234 ) ( ON ?auto_345236 ?auto_345235 ) ( ON ?auto_345237 ?auto_345236 ) ( ON ?auto_345238 ?auto_345237 ) ( ON ?auto_345239 ?auto_345238 ) ( ON ?auto_345240 ?auto_345239 ) ( not ( = ?auto_345233 ?auto_345234 ) ) ( not ( = ?auto_345233 ?auto_345235 ) ) ( not ( = ?auto_345233 ?auto_345236 ) ) ( not ( = ?auto_345233 ?auto_345237 ) ) ( not ( = ?auto_345233 ?auto_345238 ) ) ( not ( = ?auto_345233 ?auto_345239 ) ) ( not ( = ?auto_345233 ?auto_345240 ) ) ( not ( = ?auto_345233 ?auto_345241 ) ) ( not ( = ?auto_345233 ?auto_345242 ) ) ( not ( = ?auto_345233 ?auto_345243 ) ) ( not ( = ?auto_345233 ?auto_345244 ) ) ( not ( = ?auto_345234 ?auto_345235 ) ) ( not ( = ?auto_345234 ?auto_345236 ) ) ( not ( = ?auto_345234 ?auto_345237 ) ) ( not ( = ?auto_345234 ?auto_345238 ) ) ( not ( = ?auto_345234 ?auto_345239 ) ) ( not ( = ?auto_345234 ?auto_345240 ) ) ( not ( = ?auto_345234 ?auto_345241 ) ) ( not ( = ?auto_345234 ?auto_345242 ) ) ( not ( = ?auto_345234 ?auto_345243 ) ) ( not ( = ?auto_345234 ?auto_345244 ) ) ( not ( = ?auto_345235 ?auto_345236 ) ) ( not ( = ?auto_345235 ?auto_345237 ) ) ( not ( = ?auto_345235 ?auto_345238 ) ) ( not ( = ?auto_345235 ?auto_345239 ) ) ( not ( = ?auto_345235 ?auto_345240 ) ) ( not ( = ?auto_345235 ?auto_345241 ) ) ( not ( = ?auto_345235 ?auto_345242 ) ) ( not ( = ?auto_345235 ?auto_345243 ) ) ( not ( = ?auto_345235 ?auto_345244 ) ) ( not ( = ?auto_345236 ?auto_345237 ) ) ( not ( = ?auto_345236 ?auto_345238 ) ) ( not ( = ?auto_345236 ?auto_345239 ) ) ( not ( = ?auto_345236 ?auto_345240 ) ) ( not ( = ?auto_345236 ?auto_345241 ) ) ( not ( = ?auto_345236 ?auto_345242 ) ) ( not ( = ?auto_345236 ?auto_345243 ) ) ( not ( = ?auto_345236 ?auto_345244 ) ) ( not ( = ?auto_345237 ?auto_345238 ) ) ( not ( = ?auto_345237 ?auto_345239 ) ) ( not ( = ?auto_345237 ?auto_345240 ) ) ( not ( = ?auto_345237 ?auto_345241 ) ) ( not ( = ?auto_345237 ?auto_345242 ) ) ( not ( = ?auto_345237 ?auto_345243 ) ) ( not ( = ?auto_345237 ?auto_345244 ) ) ( not ( = ?auto_345238 ?auto_345239 ) ) ( not ( = ?auto_345238 ?auto_345240 ) ) ( not ( = ?auto_345238 ?auto_345241 ) ) ( not ( = ?auto_345238 ?auto_345242 ) ) ( not ( = ?auto_345238 ?auto_345243 ) ) ( not ( = ?auto_345238 ?auto_345244 ) ) ( not ( = ?auto_345239 ?auto_345240 ) ) ( not ( = ?auto_345239 ?auto_345241 ) ) ( not ( = ?auto_345239 ?auto_345242 ) ) ( not ( = ?auto_345239 ?auto_345243 ) ) ( not ( = ?auto_345239 ?auto_345244 ) ) ( not ( = ?auto_345240 ?auto_345241 ) ) ( not ( = ?auto_345240 ?auto_345242 ) ) ( not ( = ?auto_345240 ?auto_345243 ) ) ( not ( = ?auto_345240 ?auto_345244 ) ) ( not ( = ?auto_345241 ?auto_345242 ) ) ( not ( = ?auto_345241 ?auto_345243 ) ) ( not ( = ?auto_345241 ?auto_345244 ) ) ( not ( = ?auto_345242 ?auto_345243 ) ) ( not ( = ?auto_345242 ?auto_345244 ) ) ( not ( = ?auto_345243 ?auto_345244 ) ) ( ON ?auto_345242 ?auto_345243 ) ( CLEAR ?auto_345240 ) ( ON ?auto_345241 ?auto_345242 ) ( CLEAR ?auto_345241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_345233 ?auto_345234 ?auto_345235 ?auto_345236 ?auto_345237 ?auto_345238 ?auto_345239 ?auto_345240 ?auto_345241 )
      ( MAKE-11PILE ?auto_345233 ?auto_345234 ?auto_345235 ?auto_345236 ?auto_345237 ?auto_345238 ?auto_345239 ?auto_345240 ?auto_345241 ?auto_345242 ?auto_345243 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_345256 - BLOCK
      ?auto_345257 - BLOCK
      ?auto_345258 - BLOCK
      ?auto_345259 - BLOCK
      ?auto_345260 - BLOCK
      ?auto_345261 - BLOCK
      ?auto_345262 - BLOCK
      ?auto_345263 - BLOCK
      ?auto_345264 - BLOCK
      ?auto_345265 - BLOCK
      ?auto_345266 - BLOCK
    )
    :vars
    (
      ?auto_345267 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345266 ?auto_345267 ) ( ON-TABLE ?auto_345256 ) ( ON ?auto_345257 ?auto_345256 ) ( ON ?auto_345258 ?auto_345257 ) ( ON ?auto_345259 ?auto_345258 ) ( ON ?auto_345260 ?auto_345259 ) ( ON ?auto_345261 ?auto_345260 ) ( ON ?auto_345262 ?auto_345261 ) ( ON ?auto_345263 ?auto_345262 ) ( not ( = ?auto_345256 ?auto_345257 ) ) ( not ( = ?auto_345256 ?auto_345258 ) ) ( not ( = ?auto_345256 ?auto_345259 ) ) ( not ( = ?auto_345256 ?auto_345260 ) ) ( not ( = ?auto_345256 ?auto_345261 ) ) ( not ( = ?auto_345256 ?auto_345262 ) ) ( not ( = ?auto_345256 ?auto_345263 ) ) ( not ( = ?auto_345256 ?auto_345264 ) ) ( not ( = ?auto_345256 ?auto_345265 ) ) ( not ( = ?auto_345256 ?auto_345266 ) ) ( not ( = ?auto_345256 ?auto_345267 ) ) ( not ( = ?auto_345257 ?auto_345258 ) ) ( not ( = ?auto_345257 ?auto_345259 ) ) ( not ( = ?auto_345257 ?auto_345260 ) ) ( not ( = ?auto_345257 ?auto_345261 ) ) ( not ( = ?auto_345257 ?auto_345262 ) ) ( not ( = ?auto_345257 ?auto_345263 ) ) ( not ( = ?auto_345257 ?auto_345264 ) ) ( not ( = ?auto_345257 ?auto_345265 ) ) ( not ( = ?auto_345257 ?auto_345266 ) ) ( not ( = ?auto_345257 ?auto_345267 ) ) ( not ( = ?auto_345258 ?auto_345259 ) ) ( not ( = ?auto_345258 ?auto_345260 ) ) ( not ( = ?auto_345258 ?auto_345261 ) ) ( not ( = ?auto_345258 ?auto_345262 ) ) ( not ( = ?auto_345258 ?auto_345263 ) ) ( not ( = ?auto_345258 ?auto_345264 ) ) ( not ( = ?auto_345258 ?auto_345265 ) ) ( not ( = ?auto_345258 ?auto_345266 ) ) ( not ( = ?auto_345258 ?auto_345267 ) ) ( not ( = ?auto_345259 ?auto_345260 ) ) ( not ( = ?auto_345259 ?auto_345261 ) ) ( not ( = ?auto_345259 ?auto_345262 ) ) ( not ( = ?auto_345259 ?auto_345263 ) ) ( not ( = ?auto_345259 ?auto_345264 ) ) ( not ( = ?auto_345259 ?auto_345265 ) ) ( not ( = ?auto_345259 ?auto_345266 ) ) ( not ( = ?auto_345259 ?auto_345267 ) ) ( not ( = ?auto_345260 ?auto_345261 ) ) ( not ( = ?auto_345260 ?auto_345262 ) ) ( not ( = ?auto_345260 ?auto_345263 ) ) ( not ( = ?auto_345260 ?auto_345264 ) ) ( not ( = ?auto_345260 ?auto_345265 ) ) ( not ( = ?auto_345260 ?auto_345266 ) ) ( not ( = ?auto_345260 ?auto_345267 ) ) ( not ( = ?auto_345261 ?auto_345262 ) ) ( not ( = ?auto_345261 ?auto_345263 ) ) ( not ( = ?auto_345261 ?auto_345264 ) ) ( not ( = ?auto_345261 ?auto_345265 ) ) ( not ( = ?auto_345261 ?auto_345266 ) ) ( not ( = ?auto_345261 ?auto_345267 ) ) ( not ( = ?auto_345262 ?auto_345263 ) ) ( not ( = ?auto_345262 ?auto_345264 ) ) ( not ( = ?auto_345262 ?auto_345265 ) ) ( not ( = ?auto_345262 ?auto_345266 ) ) ( not ( = ?auto_345262 ?auto_345267 ) ) ( not ( = ?auto_345263 ?auto_345264 ) ) ( not ( = ?auto_345263 ?auto_345265 ) ) ( not ( = ?auto_345263 ?auto_345266 ) ) ( not ( = ?auto_345263 ?auto_345267 ) ) ( not ( = ?auto_345264 ?auto_345265 ) ) ( not ( = ?auto_345264 ?auto_345266 ) ) ( not ( = ?auto_345264 ?auto_345267 ) ) ( not ( = ?auto_345265 ?auto_345266 ) ) ( not ( = ?auto_345265 ?auto_345267 ) ) ( not ( = ?auto_345266 ?auto_345267 ) ) ( ON ?auto_345265 ?auto_345266 ) ( CLEAR ?auto_345263 ) ( ON ?auto_345264 ?auto_345265 ) ( CLEAR ?auto_345264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_345256 ?auto_345257 ?auto_345258 ?auto_345259 ?auto_345260 ?auto_345261 ?auto_345262 ?auto_345263 ?auto_345264 )
      ( MAKE-11PILE ?auto_345256 ?auto_345257 ?auto_345258 ?auto_345259 ?auto_345260 ?auto_345261 ?auto_345262 ?auto_345263 ?auto_345264 ?auto_345265 ?auto_345266 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_345279 - BLOCK
      ?auto_345280 - BLOCK
      ?auto_345281 - BLOCK
      ?auto_345282 - BLOCK
      ?auto_345283 - BLOCK
      ?auto_345284 - BLOCK
      ?auto_345285 - BLOCK
      ?auto_345286 - BLOCK
      ?auto_345287 - BLOCK
      ?auto_345288 - BLOCK
      ?auto_345289 - BLOCK
    )
    :vars
    (
      ?auto_345290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345289 ?auto_345290 ) ( ON-TABLE ?auto_345279 ) ( ON ?auto_345280 ?auto_345279 ) ( ON ?auto_345281 ?auto_345280 ) ( ON ?auto_345282 ?auto_345281 ) ( ON ?auto_345283 ?auto_345282 ) ( ON ?auto_345284 ?auto_345283 ) ( ON ?auto_345285 ?auto_345284 ) ( not ( = ?auto_345279 ?auto_345280 ) ) ( not ( = ?auto_345279 ?auto_345281 ) ) ( not ( = ?auto_345279 ?auto_345282 ) ) ( not ( = ?auto_345279 ?auto_345283 ) ) ( not ( = ?auto_345279 ?auto_345284 ) ) ( not ( = ?auto_345279 ?auto_345285 ) ) ( not ( = ?auto_345279 ?auto_345286 ) ) ( not ( = ?auto_345279 ?auto_345287 ) ) ( not ( = ?auto_345279 ?auto_345288 ) ) ( not ( = ?auto_345279 ?auto_345289 ) ) ( not ( = ?auto_345279 ?auto_345290 ) ) ( not ( = ?auto_345280 ?auto_345281 ) ) ( not ( = ?auto_345280 ?auto_345282 ) ) ( not ( = ?auto_345280 ?auto_345283 ) ) ( not ( = ?auto_345280 ?auto_345284 ) ) ( not ( = ?auto_345280 ?auto_345285 ) ) ( not ( = ?auto_345280 ?auto_345286 ) ) ( not ( = ?auto_345280 ?auto_345287 ) ) ( not ( = ?auto_345280 ?auto_345288 ) ) ( not ( = ?auto_345280 ?auto_345289 ) ) ( not ( = ?auto_345280 ?auto_345290 ) ) ( not ( = ?auto_345281 ?auto_345282 ) ) ( not ( = ?auto_345281 ?auto_345283 ) ) ( not ( = ?auto_345281 ?auto_345284 ) ) ( not ( = ?auto_345281 ?auto_345285 ) ) ( not ( = ?auto_345281 ?auto_345286 ) ) ( not ( = ?auto_345281 ?auto_345287 ) ) ( not ( = ?auto_345281 ?auto_345288 ) ) ( not ( = ?auto_345281 ?auto_345289 ) ) ( not ( = ?auto_345281 ?auto_345290 ) ) ( not ( = ?auto_345282 ?auto_345283 ) ) ( not ( = ?auto_345282 ?auto_345284 ) ) ( not ( = ?auto_345282 ?auto_345285 ) ) ( not ( = ?auto_345282 ?auto_345286 ) ) ( not ( = ?auto_345282 ?auto_345287 ) ) ( not ( = ?auto_345282 ?auto_345288 ) ) ( not ( = ?auto_345282 ?auto_345289 ) ) ( not ( = ?auto_345282 ?auto_345290 ) ) ( not ( = ?auto_345283 ?auto_345284 ) ) ( not ( = ?auto_345283 ?auto_345285 ) ) ( not ( = ?auto_345283 ?auto_345286 ) ) ( not ( = ?auto_345283 ?auto_345287 ) ) ( not ( = ?auto_345283 ?auto_345288 ) ) ( not ( = ?auto_345283 ?auto_345289 ) ) ( not ( = ?auto_345283 ?auto_345290 ) ) ( not ( = ?auto_345284 ?auto_345285 ) ) ( not ( = ?auto_345284 ?auto_345286 ) ) ( not ( = ?auto_345284 ?auto_345287 ) ) ( not ( = ?auto_345284 ?auto_345288 ) ) ( not ( = ?auto_345284 ?auto_345289 ) ) ( not ( = ?auto_345284 ?auto_345290 ) ) ( not ( = ?auto_345285 ?auto_345286 ) ) ( not ( = ?auto_345285 ?auto_345287 ) ) ( not ( = ?auto_345285 ?auto_345288 ) ) ( not ( = ?auto_345285 ?auto_345289 ) ) ( not ( = ?auto_345285 ?auto_345290 ) ) ( not ( = ?auto_345286 ?auto_345287 ) ) ( not ( = ?auto_345286 ?auto_345288 ) ) ( not ( = ?auto_345286 ?auto_345289 ) ) ( not ( = ?auto_345286 ?auto_345290 ) ) ( not ( = ?auto_345287 ?auto_345288 ) ) ( not ( = ?auto_345287 ?auto_345289 ) ) ( not ( = ?auto_345287 ?auto_345290 ) ) ( not ( = ?auto_345288 ?auto_345289 ) ) ( not ( = ?auto_345288 ?auto_345290 ) ) ( not ( = ?auto_345289 ?auto_345290 ) ) ( ON ?auto_345288 ?auto_345289 ) ( ON ?auto_345287 ?auto_345288 ) ( CLEAR ?auto_345285 ) ( ON ?auto_345286 ?auto_345287 ) ( CLEAR ?auto_345286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_345279 ?auto_345280 ?auto_345281 ?auto_345282 ?auto_345283 ?auto_345284 ?auto_345285 ?auto_345286 )
      ( MAKE-11PILE ?auto_345279 ?auto_345280 ?auto_345281 ?auto_345282 ?auto_345283 ?auto_345284 ?auto_345285 ?auto_345286 ?auto_345287 ?auto_345288 ?auto_345289 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_345302 - BLOCK
      ?auto_345303 - BLOCK
      ?auto_345304 - BLOCK
      ?auto_345305 - BLOCK
      ?auto_345306 - BLOCK
      ?auto_345307 - BLOCK
      ?auto_345308 - BLOCK
      ?auto_345309 - BLOCK
      ?auto_345310 - BLOCK
      ?auto_345311 - BLOCK
      ?auto_345312 - BLOCK
    )
    :vars
    (
      ?auto_345313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345312 ?auto_345313 ) ( ON-TABLE ?auto_345302 ) ( ON ?auto_345303 ?auto_345302 ) ( ON ?auto_345304 ?auto_345303 ) ( ON ?auto_345305 ?auto_345304 ) ( ON ?auto_345306 ?auto_345305 ) ( ON ?auto_345307 ?auto_345306 ) ( ON ?auto_345308 ?auto_345307 ) ( not ( = ?auto_345302 ?auto_345303 ) ) ( not ( = ?auto_345302 ?auto_345304 ) ) ( not ( = ?auto_345302 ?auto_345305 ) ) ( not ( = ?auto_345302 ?auto_345306 ) ) ( not ( = ?auto_345302 ?auto_345307 ) ) ( not ( = ?auto_345302 ?auto_345308 ) ) ( not ( = ?auto_345302 ?auto_345309 ) ) ( not ( = ?auto_345302 ?auto_345310 ) ) ( not ( = ?auto_345302 ?auto_345311 ) ) ( not ( = ?auto_345302 ?auto_345312 ) ) ( not ( = ?auto_345302 ?auto_345313 ) ) ( not ( = ?auto_345303 ?auto_345304 ) ) ( not ( = ?auto_345303 ?auto_345305 ) ) ( not ( = ?auto_345303 ?auto_345306 ) ) ( not ( = ?auto_345303 ?auto_345307 ) ) ( not ( = ?auto_345303 ?auto_345308 ) ) ( not ( = ?auto_345303 ?auto_345309 ) ) ( not ( = ?auto_345303 ?auto_345310 ) ) ( not ( = ?auto_345303 ?auto_345311 ) ) ( not ( = ?auto_345303 ?auto_345312 ) ) ( not ( = ?auto_345303 ?auto_345313 ) ) ( not ( = ?auto_345304 ?auto_345305 ) ) ( not ( = ?auto_345304 ?auto_345306 ) ) ( not ( = ?auto_345304 ?auto_345307 ) ) ( not ( = ?auto_345304 ?auto_345308 ) ) ( not ( = ?auto_345304 ?auto_345309 ) ) ( not ( = ?auto_345304 ?auto_345310 ) ) ( not ( = ?auto_345304 ?auto_345311 ) ) ( not ( = ?auto_345304 ?auto_345312 ) ) ( not ( = ?auto_345304 ?auto_345313 ) ) ( not ( = ?auto_345305 ?auto_345306 ) ) ( not ( = ?auto_345305 ?auto_345307 ) ) ( not ( = ?auto_345305 ?auto_345308 ) ) ( not ( = ?auto_345305 ?auto_345309 ) ) ( not ( = ?auto_345305 ?auto_345310 ) ) ( not ( = ?auto_345305 ?auto_345311 ) ) ( not ( = ?auto_345305 ?auto_345312 ) ) ( not ( = ?auto_345305 ?auto_345313 ) ) ( not ( = ?auto_345306 ?auto_345307 ) ) ( not ( = ?auto_345306 ?auto_345308 ) ) ( not ( = ?auto_345306 ?auto_345309 ) ) ( not ( = ?auto_345306 ?auto_345310 ) ) ( not ( = ?auto_345306 ?auto_345311 ) ) ( not ( = ?auto_345306 ?auto_345312 ) ) ( not ( = ?auto_345306 ?auto_345313 ) ) ( not ( = ?auto_345307 ?auto_345308 ) ) ( not ( = ?auto_345307 ?auto_345309 ) ) ( not ( = ?auto_345307 ?auto_345310 ) ) ( not ( = ?auto_345307 ?auto_345311 ) ) ( not ( = ?auto_345307 ?auto_345312 ) ) ( not ( = ?auto_345307 ?auto_345313 ) ) ( not ( = ?auto_345308 ?auto_345309 ) ) ( not ( = ?auto_345308 ?auto_345310 ) ) ( not ( = ?auto_345308 ?auto_345311 ) ) ( not ( = ?auto_345308 ?auto_345312 ) ) ( not ( = ?auto_345308 ?auto_345313 ) ) ( not ( = ?auto_345309 ?auto_345310 ) ) ( not ( = ?auto_345309 ?auto_345311 ) ) ( not ( = ?auto_345309 ?auto_345312 ) ) ( not ( = ?auto_345309 ?auto_345313 ) ) ( not ( = ?auto_345310 ?auto_345311 ) ) ( not ( = ?auto_345310 ?auto_345312 ) ) ( not ( = ?auto_345310 ?auto_345313 ) ) ( not ( = ?auto_345311 ?auto_345312 ) ) ( not ( = ?auto_345311 ?auto_345313 ) ) ( not ( = ?auto_345312 ?auto_345313 ) ) ( ON ?auto_345311 ?auto_345312 ) ( ON ?auto_345310 ?auto_345311 ) ( CLEAR ?auto_345308 ) ( ON ?auto_345309 ?auto_345310 ) ( CLEAR ?auto_345309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_345302 ?auto_345303 ?auto_345304 ?auto_345305 ?auto_345306 ?auto_345307 ?auto_345308 ?auto_345309 )
      ( MAKE-11PILE ?auto_345302 ?auto_345303 ?auto_345304 ?auto_345305 ?auto_345306 ?auto_345307 ?auto_345308 ?auto_345309 ?auto_345310 ?auto_345311 ?auto_345312 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_345325 - BLOCK
      ?auto_345326 - BLOCK
      ?auto_345327 - BLOCK
      ?auto_345328 - BLOCK
      ?auto_345329 - BLOCK
      ?auto_345330 - BLOCK
      ?auto_345331 - BLOCK
      ?auto_345332 - BLOCK
      ?auto_345333 - BLOCK
      ?auto_345334 - BLOCK
      ?auto_345335 - BLOCK
    )
    :vars
    (
      ?auto_345336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345335 ?auto_345336 ) ( ON-TABLE ?auto_345325 ) ( ON ?auto_345326 ?auto_345325 ) ( ON ?auto_345327 ?auto_345326 ) ( ON ?auto_345328 ?auto_345327 ) ( ON ?auto_345329 ?auto_345328 ) ( ON ?auto_345330 ?auto_345329 ) ( not ( = ?auto_345325 ?auto_345326 ) ) ( not ( = ?auto_345325 ?auto_345327 ) ) ( not ( = ?auto_345325 ?auto_345328 ) ) ( not ( = ?auto_345325 ?auto_345329 ) ) ( not ( = ?auto_345325 ?auto_345330 ) ) ( not ( = ?auto_345325 ?auto_345331 ) ) ( not ( = ?auto_345325 ?auto_345332 ) ) ( not ( = ?auto_345325 ?auto_345333 ) ) ( not ( = ?auto_345325 ?auto_345334 ) ) ( not ( = ?auto_345325 ?auto_345335 ) ) ( not ( = ?auto_345325 ?auto_345336 ) ) ( not ( = ?auto_345326 ?auto_345327 ) ) ( not ( = ?auto_345326 ?auto_345328 ) ) ( not ( = ?auto_345326 ?auto_345329 ) ) ( not ( = ?auto_345326 ?auto_345330 ) ) ( not ( = ?auto_345326 ?auto_345331 ) ) ( not ( = ?auto_345326 ?auto_345332 ) ) ( not ( = ?auto_345326 ?auto_345333 ) ) ( not ( = ?auto_345326 ?auto_345334 ) ) ( not ( = ?auto_345326 ?auto_345335 ) ) ( not ( = ?auto_345326 ?auto_345336 ) ) ( not ( = ?auto_345327 ?auto_345328 ) ) ( not ( = ?auto_345327 ?auto_345329 ) ) ( not ( = ?auto_345327 ?auto_345330 ) ) ( not ( = ?auto_345327 ?auto_345331 ) ) ( not ( = ?auto_345327 ?auto_345332 ) ) ( not ( = ?auto_345327 ?auto_345333 ) ) ( not ( = ?auto_345327 ?auto_345334 ) ) ( not ( = ?auto_345327 ?auto_345335 ) ) ( not ( = ?auto_345327 ?auto_345336 ) ) ( not ( = ?auto_345328 ?auto_345329 ) ) ( not ( = ?auto_345328 ?auto_345330 ) ) ( not ( = ?auto_345328 ?auto_345331 ) ) ( not ( = ?auto_345328 ?auto_345332 ) ) ( not ( = ?auto_345328 ?auto_345333 ) ) ( not ( = ?auto_345328 ?auto_345334 ) ) ( not ( = ?auto_345328 ?auto_345335 ) ) ( not ( = ?auto_345328 ?auto_345336 ) ) ( not ( = ?auto_345329 ?auto_345330 ) ) ( not ( = ?auto_345329 ?auto_345331 ) ) ( not ( = ?auto_345329 ?auto_345332 ) ) ( not ( = ?auto_345329 ?auto_345333 ) ) ( not ( = ?auto_345329 ?auto_345334 ) ) ( not ( = ?auto_345329 ?auto_345335 ) ) ( not ( = ?auto_345329 ?auto_345336 ) ) ( not ( = ?auto_345330 ?auto_345331 ) ) ( not ( = ?auto_345330 ?auto_345332 ) ) ( not ( = ?auto_345330 ?auto_345333 ) ) ( not ( = ?auto_345330 ?auto_345334 ) ) ( not ( = ?auto_345330 ?auto_345335 ) ) ( not ( = ?auto_345330 ?auto_345336 ) ) ( not ( = ?auto_345331 ?auto_345332 ) ) ( not ( = ?auto_345331 ?auto_345333 ) ) ( not ( = ?auto_345331 ?auto_345334 ) ) ( not ( = ?auto_345331 ?auto_345335 ) ) ( not ( = ?auto_345331 ?auto_345336 ) ) ( not ( = ?auto_345332 ?auto_345333 ) ) ( not ( = ?auto_345332 ?auto_345334 ) ) ( not ( = ?auto_345332 ?auto_345335 ) ) ( not ( = ?auto_345332 ?auto_345336 ) ) ( not ( = ?auto_345333 ?auto_345334 ) ) ( not ( = ?auto_345333 ?auto_345335 ) ) ( not ( = ?auto_345333 ?auto_345336 ) ) ( not ( = ?auto_345334 ?auto_345335 ) ) ( not ( = ?auto_345334 ?auto_345336 ) ) ( not ( = ?auto_345335 ?auto_345336 ) ) ( ON ?auto_345334 ?auto_345335 ) ( ON ?auto_345333 ?auto_345334 ) ( ON ?auto_345332 ?auto_345333 ) ( CLEAR ?auto_345330 ) ( ON ?auto_345331 ?auto_345332 ) ( CLEAR ?auto_345331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_345325 ?auto_345326 ?auto_345327 ?auto_345328 ?auto_345329 ?auto_345330 ?auto_345331 )
      ( MAKE-11PILE ?auto_345325 ?auto_345326 ?auto_345327 ?auto_345328 ?auto_345329 ?auto_345330 ?auto_345331 ?auto_345332 ?auto_345333 ?auto_345334 ?auto_345335 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_345348 - BLOCK
      ?auto_345349 - BLOCK
      ?auto_345350 - BLOCK
      ?auto_345351 - BLOCK
      ?auto_345352 - BLOCK
      ?auto_345353 - BLOCK
      ?auto_345354 - BLOCK
      ?auto_345355 - BLOCK
      ?auto_345356 - BLOCK
      ?auto_345357 - BLOCK
      ?auto_345358 - BLOCK
    )
    :vars
    (
      ?auto_345359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345358 ?auto_345359 ) ( ON-TABLE ?auto_345348 ) ( ON ?auto_345349 ?auto_345348 ) ( ON ?auto_345350 ?auto_345349 ) ( ON ?auto_345351 ?auto_345350 ) ( ON ?auto_345352 ?auto_345351 ) ( ON ?auto_345353 ?auto_345352 ) ( not ( = ?auto_345348 ?auto_345349 ) ) ( not ( = ?auto_345348 ?auto_345350 ) ) ( not ( = ?auto_345348 ?auto_345351 ) ) ( not ( = ?auto_345348 ?auto_345352 ) ) ( not ( = ?auto_345348 ?auto_345353 ) ) ( not ( = ?auto_345348 ?auto_345354 ) ) ( not ( = ?auto_345348 ?auto_345355 ) ) ( not ( = ?auto_345348 ?auto_345356 ) ) ( not ( = ?auto_345348 ?auto_345357 ) ) ( not ( = ?auto_345348 ?auto_345358 ) ) ( not ( = ?auto_345348 ?auto_345359 ) ) ( not ( = ?auto_345349 ?auto_345350 ) ) ( not ( = ?auto_345349 ?auto_345351 ) ) ( not ( = ?auto_345349 ?auto_345352 ) ) ( not ( = ?auto_345349 ?auto_345353 ) ) ( not ( = ?auto_345349 ?auto_345354 ) ) ( not ( = ?auto_345349 ?auto_345355 ) ) ( not ( = ?auto_345349 ?auto_345356 ) ) ( not ( = ?auto_345349 ?auto_345357 ) ) ( not ( = ?auto_345349 ?auto_345358 ) ) ( not ( = ?auto_345349 ?auto_345359 ) ) ( not ( = ?auto_345350 ?auto_345351 ) ) ( not ( = ?auto_345350 ?auto_345352 ) ) ( not ( = ?auto_345350 ?auto_345353 ) ) ( not ( = ?auto_345350 ?auto_345354 ) ) ( not ( = ?auto_345350 ?auto_345355 ) ) ( not ( = ?auto_345350 ?auto_345356 ) ) ( not ( = ?auto_345350 ?auto_345357 ) ) ( not ( = ?auto_345350 ?auto_345358 ) ) ( not ( = ?auto_345350 ?auto_345359 ) ) ( not ( = ?auto_345351 ?auto_345352 ) ) ( not ( = ?auto_345351 ?auto_345353 ) ) ( not ( = ?auto_345351 ?auto_345354 ) ) ( not ( = ?auto_345351 ?auto_345355 ) ) ( not ( = ?auto_345351 ?auto_345356 ) ) ( not ( = ?auto_345351 ?auto_345357 ) ) ( not ( = ?auto_345351 ?auto_345358 ) ) ( not ( = ?auto_345351 ?auto_345359 ) ) ( not ( = ?auto_345352 ?auto_345353 ) ) ( not ( = ?auto_345352 ?auto_345354 ) ) ( not ( = ?auto_345352 ?auto_345355 ) ) ( not ( = ?auto_345352 ?auto_345356 ) ) ( not ( = ?auto_345352 ?auto_345357 ) ) ( not ( = ?auto_345352 ?auto_345358 ) ) ( not ( = ?auto_345352 ?auto_345359 ) ) ( not ( = ?auto_345353 ?auto_345354 ) ) ( not ( = ?auto_345353 ?auto_345355 ) ) ( not ( = ?auto_345353 ?auto_345356 ) ) ( not ( = ?auto_345353 ?auto_345357 ) ) ( not ( = ?auto_345353 ?auto_345358 ) ) ( not ( = ?auto_345353 ?auto_345359 ) ) ( not ( = ?auto_345354 ?auto_345355 ) ) ( not ( = ?auto_345354 ?auto_345356 ) ) ( not ( = ?auto_345354 ?auto_345357 ) ) ( not ( = ?auto_345354 ?auto_345358 ) ) ( not ( = ?auto_345354 ?auto_345359 ) ) ( not ( = ?auto_345355 ?auto_345356 ) ) ( not ( = ?auto_345355 ?auto_345357 ) ) ( not ( = ?auto_345355 ?auto_345358 ) ) ( not ( = ?auto_345355 ?auto_345359 ) ) ( not ( = ?auto_345356 ?auto_345357 ) ) ( not ( = ?auto_345356 ?auto_345358 ) ) ( not ( = ?auto_345356 ?auto_345359 ) ) ( not ( = ?auto_345357 ?auto_345358 ) ) ( not ( = ?auto_345357 ?auto_345359 ) ) ( not ( = ?auto_345358 ?auto_345359 ) ) ( ON ?auto_345357 ?auto_345358 ) ( ON ?auto_345356 ?auto_345357 ) ( ON ?auto_345355 ?auto_345356 ) ( CLEAR ?auto_345353 ) ( ON ?auto_345354 ?auto_345355 ) ( CLEAR ?auto_345354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_345348 ?auto_345349 ?auto_345350 ?auto_345351 ?auto_345352 ?auto_345353 ?auto_345354 )
      ( MAKE-11PILE ?auto_345348 ?auto_345349 ?auto_345350 ?auto_345351 ?auto_345352 ?auto_345353 ?auto_345354 ?auto_345355 ?auto_345356 ?auto_345357 ?auto_345358 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_345371 - BLOCK
      ?auto_345372 - BLOCK
      ?auto_345373 - BLOCK
      ?auto_345374 - BLOCK
      ?auto_345375 - BLOCK
      ?auto_345376 - BLOCK
      ?auto_345377 - BLOCK
      ?auto_345378 - BLOCK
      ?auto_345379 - BLOCK
      ?auto_345380 - BLOCK
      ?auto_345381 - BLOCK
    )
    :vars
    (
      ?auto_345382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345381 ?auto_345382 ) ( ON-TABLE ?auto_345371 ) ( ON ?auto_345372 ?auto_345371 ) ( ON ?auto_345373 ?auto_345372 ) ( ON ?auto_345374 ?auto_345373 ) ( ON ?auto_345375 ?auto_345374 ) ( not ( = ?auto_345371 ?auto_345372 ) ) ( not ( = ?auto_345371 ?auto_345373 ) ) ( not ( = ?auto_345371 ?auto_345374 ) ) ( not ( = ?auto_345371 ?auto_345375 ) ) ( not ( = ?auto_345371 ?auto_345376 ) ) ( not ( = ?auto_345371 ?auto_345377 ) ) ( not ( = ?auto_345371 ?auto_345378 ) ) ( not ( = ?auto_345371 ?auto_345379 ) ) ( not ( = ?auto_345371 ?auto_345380 ) ) ( not ( = ?auto_345371 ?auto_345381 ) ) ( not ( = ?auto_345371 ?auto_345382 ) ) ( not ( = ?auto_345372 ?auto_345373 ) ) ( not ( = ?auto_345372 ?auto_345374 ) ) ( not ( = ?auto_345372 ?auto_345375 ) ) ( not ( = ?auto_345372 ?auto_345376 ) ) ( not ( = ?auto_345372 ?auto_345377 ) ) ( not ( = ?auto_345372 ?auto_345378 ) ) ( not ( = ?auto_345372 ?auto_345379 ) ) ( not ( = ?auto_345372 ?auto_345380 ) ) ( not ( = ?auto_345372 ?auto_345381 ) ) ( not ( = ?auto_345372 ?auto_345382 ) ) ( not ( = ?auto_345373 ?auto_345374 ) ) ( not ( = ?auto_345373 ?auto_345375 ) ) ( not ( = ?auto_345373 ?auto_345376 ) ) ( not ( = ?auto_345373 ?auto_345377 ) ) ( not ( = ?auto_345373 ?auto_345378 ) ) ( not ( = ?auto_345373 ?auto_345379 ) ) ( not ( = ?auto_345373 ?auto_345380 ) ) ( not ( = ?auto_345373 ?auto_345381 ) ) ( not ( = ?auto_345373 ?auto_345382 ) ) ( not ( = ?auto_345374 ?auto_345375 ) ) ( not ( = ?auto_345374 ?auto_345376 ) ) ( not ( = ?auto_345374 ?auto_345377 ) ) ( not ( = ?auto_345374 ?auto_345378 ) ) ( not ( = ?auto_345374 ?auto_345379 ) ) ( not ( = ?auto_345374 ?auto_345380 ) ) ( not ( = ?auto_345374 ?auto_345381 ) ) ( not ( = ?auto_345374 ?auto_345382 ) ) ( not ( = ?auto_345375 ?auto_345376 ) ) ( not ( = ?auto_345375 ?auto_345377 ) ) ( not ( = ?auto_345375 ?auto_345378 ) ) ( not ( = ?auto_345375 ?auto_345379 ) ) ( not ( = ?auto_345375 ?auto_345380 ) ) ( not ( = ?auto_345375 ?auto_345381 ) ) ( not ( = ?auto_345375 ?auto_345382 ) ) ( not ( = ?auto_345376 ?auto_345377 ) ) ( not ( = ?auto_345376 ?auto_345378 ) ) ( not ( = ?auto_345376 ?auto_345379 ) ) ( not ( = ?auto_345376 ?auto_345380 ) ) ( not ( = ?auto_345376 ?auto_345381 ) ) ( not ( = ?auto_345376 ?auto_345382 ) ) ( not ( = ?auto_345377 ?auto_345378 ) ) ( not ( = ?auto_345377 ?auto_345379 ) ) ( not ( = ?auto_345377 ?auto_345380 ) ) ( not ( = ?auto_345377 ?auto_345381 ) ) ( not ( = ?auto_345377 ?auto_345382 ) ) ( not ( = ?auto_345378 ?auto_345379 ) ) ( not ( = ?auto_345378 ?auto_345380 ) ) ( not ( = ?auto_345378 ?auto_345381 ) ) ( not ( = ?auto_345378 ?auto_345382 ) ) ( not ( = ?auto_345379 ?auto_345380 ) ) ( not ( = ?auto_345379 ?auto_345381 ) ) ( not ( = ?auto_345379 ?auto_345382 ) ) ( not ( = ?auto_345380 ?auto_345381 ) ) ( not ( = ?auto_345380 ?auto_345382 ) ) ( not ( = ?auto_345381 ?auto_345382 ) ) ( ON ?auto_345380 ?auto_345381 ) ( ON ?auto_345379 ?auto_345380 ) ( ON ?auto_345378 ?auto_345379 ) ( ON ?auto_345377 ?auto_345378 ) ( CLEAR ?auto_345375 ) ( ON ?auto_345376 ?auto_345377 ) ( CLEAR ?auto_345376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_345371 ?auto_345372 ?auto_345373 ?auto_345374 ?auto_345375 ?auto_345376 )
      ( MAKE-11PILE ?auto_345371 ?auto_345372 ?auto_345373 ?auto_345374 ?auto_345375 ?auto_345376 ?auto_345377 ?auto_345378 ?auto_345379 ?auto_345380 ?auto_345381 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_345394 - BLOCK
      ?auto_345395 - BLOCK
      ?auto_345396 - BLOCK
      ?auto_345397 - BLOCK
      ?auto_345398 - BLOCK
      ?auto_345399 - BLOCK
      ?auto_345400 - BLOCK
      ?auto_345401 - BLOCK
      ?auto_345402 - BLOCK
      ?auto_345403 - BLOCK
      ?auto_345404 - BLOCK
    )
    :vars
    (
      ?auto_345405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345404 ?auto_345405 ) ( ON-TABLE ?auto_345394 ) ( ON ?auto_345395 ?auto_345394 ) ( ON ?auto_345396 ?auto_345395 ) ( ON ?auto_345397 ?auto_345396 ) ( ON ?auto_345398 ?auto_345397 ) ( not ( = ?auto_345394 ?auto_345395 ) ) ( not ( = ?auto_345394 ?auto_345396 ) ) ( not ( = ?auto_345394 ?auto_345397 ) ) ( not ( = ?auto_345394 ?auto_345398 ) ) ( not ( = ?auto_345394 ?auto_345399 ) ) ( not ( = ?auto_345394 ?auto_345400 ) ) ( not ( = ?auto_345394 ?auto_345401 ) ) ( not ( = ?auto_345394 ?auto_345402 ) ) ( not ( = ?auto_345394 ?auto_345403 ) ) ( not ( = ?auto_345394 ?auto_345404 ) ) ( not ( = ?auto_345394 ?auto_345405 ) ) ( not ( = ?auto_345395 ?auto_345396 ) ) ( not ( = ?auto_345395 ?auto_345397 ) ) ( not ( = ?auto_345395 ?auto_345398 ) ) ( not ( = ?auto_345395 ?auto_345399 ) ) ( not ( = ?auto_345395 ?auto_345400 ) ) ( not ( = ?auto_345395 ?auto_345401 ) ) ( not ( = ?auto_345395 ?auto_345402 ) ) ( not ( = ?auto_345395 ?auto_345403 ) ) ( not ( = ?auto_345395 ?auto_345404 ) ) ( not ( = ?auto_345395 ?auto_345405 ) ) ( not ( = ?auto_345396 ?auto_345397 ) ) ( not ( = ?auto_345396 ?auto_345398 ) ) ( not ( = ?auto_345396 ?auto_345399 ) ) ( not ( = ?auto_345396 ?auto_345400 ) ) ( not ( = ?auto_345396 ?auto_345401 ) ) ( not ( = ?auto_345396 ?auto_345402 ) ) ( not ( = ?auto_345396 ?auto_345403 ) ) ( not ( = ?auto_345396 ?auto_345404 ) ) ( not ( = ?auto_345396 ?auto_345405 ) ) ( not ( = ?auto_345397 ?auto_345398 ) ) ( not ( = ?auto_345397 ?auto_345399 ) ) ( not ( = ?auto_345397 ?auto_345400 ) ) ( not ( = ?auto_345397 ?auto_345401 ) ) ( not ( = ?auto_345397 ?auto_345402 ) ) ( not ( = ?auto_345397 ?auto_345403 ) ) ( not ( = ?auto_345397 ?auto_345404 ) ) ( not ( = ?auto_345397 ?auto_345405 ) ) ( not ( = ?auto_345398 ?auto_345399 ) ) ( not ( = ?auto_345398 ?auto_345400 ) ) ( not ( = ?auto_345398 ?auto_345401 ) ) ( not ( = ?auto_345398 ?auto_345402 ) ) ( not ( = ?auto_345398 ?auto_345403 ) ) ( not ( = ?auto_345398 ?auto_345404 ) ) ( not ( = ?auto_345398 ?auto_345405 ) ) ( not ( = ?auto_345399 ?auto_345400 ) ) ( not ( = ?auto_345399 ?auto_345401 ) ) ( not ( = ?auto_345399 ?auto_345402 ) ) ( not ( = ?auto_345399 ?auto_345403 ) ) ( not ( = ?auto_345399 ?auto_345404 ) ) ( not ( = ?auto_345399 ?auto_345405 ) ) ( not ( = ?auto_345400 ?auto_345401 ) ) ( not ( = ?auto_345400 ?auto_345402 ) ) ( not ( = ?auto_345400 ?auto_345403 ) ) ( not ( = ?auto_345400 ?auto_345404 ) ) ( not ( = ?auto_345400 ?auto_345405 ) ) ( not ( = ?auto_345401 ?auto_345402 ) ) ( not ( = ?auto_345401 ?auto_345403 ) ) ( not ( = ?auto_345401 ?auto_345404 ) ) ( not ( = ?auto_345401 ?auto_345405 ) ) ( not ( = ?auto_345402 ?auto_345403 ) ) ( not ( = ?auto_345402 ?auto_345404 ) ) ( not ( = ?auto_345402 ?auto_345405 ) ) ( not ( = ?auto_345403 ?auto_345404 ) ) ( not ( = ?auto_345403 ?auto_345405 ) ) ( not ( = ?auto_345404 ?auto_345405 ) ) ( ON ?auto_345403 ?auto_345404 ) ( ON ?auto_345402 ?auto_345403 ) ( ON ?auto_345401 ?auto_345402 ) ( ON ?auto_345400 ?auto_345401 ) ( CLEAR ?auto_345398 ) ( ON ?auto_345399 ?auto_345400 ) ( CLEAR ?auto_345399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_345394 ?auto_345395 ?auto_345396 ?auto_345397 ?auto_345398 ?auto_345399 )
      ( MAKE-11PILE ?auto_345394 ?auto_345395 ?auto_345396 ?auto_345397 ?auto_345398 ?auto_345399 ?auto_345400 ?auto_345401 ?auto_345402 ?auto_345403 ?auto_345404 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_345417 - BLOCK
      ?auto_345418 - BLOCK
      ?auto_345419 - BLOCK
      ?auto_345420 - BLOCK
      ?auto_345421 - BLOCK
      ?auto_345422 - BLOCK
      ?auto_345423 - BLOCK
      ?auto_345424 - BLOCK
      ?auto_345425 - BLOCK
      ?auto_345426 - BLOCK
      ?auto_345427 - BLOCK
    )
    :vars
    (
      ?auto_345428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345427 ?auto_345428 ) ( ON-TABLE ?auto_345417 ) ( ON ?auto_345418 ?auto_345417 ) ( ON ?auto_345419 ?auto_345418 ) ( ON ?auto_345420 ?auto_345419 ) ( not ( = ?auto_345417 ?auto_345418 ) ) ( not ( = ?auto_345417 ?auto_345419 ) ) ( not ( = ?auto_345417 ?auto_345420 ) ) ( not ( = ?auto_345417 ?auto_345421 ) ) ( not ( = ?auto_345417 ?auto_345422 ) ) ( not ( = ?auto_345417 ?auto_345423 ) ) ( not ( = ?auto_345417 ?auto_345424 ) ) ( not ( = ?auto_345417 ?auto_345425 ) ) ( not ( = ?auto_345417 ?auto_345426 ) ) ( not ( = ?auto_345417 ?auto_345427 ) ) ( not ( = ?auto_345417 ?auto_345428 ) ) ( not ( = ?auto_345418 ?auto_345419 ) ) ( not ( = ?auto_345418 ?auto_345420 ) ) ( not ( = ?auto_345418 ?auto_345421 ) ) ( not ( = ?auto_345418 ?auto_345422 ) ) ( not ( = ?auto_345418 ?auto_345423 ) ) ( not ( = ?auto_345418 ?auto_345424 ) ) ( not ( = ?auto_345418 ?auto_345425 ) ) ( not ( = ?auto_345418 ?auto_345426 ) ) ( not ( = ?auto_345418 ?auto_345427 ) ) ( not ( = ?auto_345418 ?auto_345428 ) ) ( not ( = ?auto_345419 ?auto_345420 ) ) ( not ( = ?auto_345419 ?auto_345421 ) ) ( not ( = ?auto_345419 ?auto_345422 ) ) ( not ( = ?auto_345419 ?auto_345423 ) ) ( not ( = ?auto_345419 ?auto_345424 ) ) ( not ( = ?auto_345419 ?auto_345425 ) ) ( not ( = ?auto_345419 ?auto_345426 ) ) ( not ( = ?auto_345419 ?auto_345427 ) ) ( not ( = ?auto_345419 ?auto_345428 ) ) ( not ( = ?auto_345420 ?auto_345421 ) ) ( not ( = ?auto_345420 ?auto_345422 ) ) ( not ( = ?auto_345420 ?auto_345423 ) ) ( not ( = ?auto_345420 ?auto_345424 ) ) ( not ( = ?auto_345420 ?auto_345425 ) ) ( not ( = ?auto_345420 ?auto_345426 ) ) ( not ( = ?auto_345420 ?auto_345427 ) ) ( not ( = ?auto_345420 ?auto_345428 ) ) ( not ( = ?auto_345421 ?auto_345422 ) ) ( not ( = ?auto_345421 ?auto_345423 ) ) ( not ( = ?auto_345421 ?auto_345424 ) ) ( not ( = ?auto_345421 ?auto_345425 ) ) ( not ( = ?auto_345421 ?auto_345426 ) ) ( not ( = ?auto_345421 ?auto_345427 ) ) ( not ( = ?auto_345421 ?auto_345428 ) ) ( not ( = ?auto_345422 ?auto_345423 ) ) ( not ( = ?auto_345422 ?auto_345424 ) ) ( not ( = ?auto_345422 ?auto_345425 ) ) ( not ( = ?auto_345422 ?auto_345426 ) ) ( not ( = ?auto_345422 ?auto_345427 ) ) ( not ( = ?auto_345422 ?auto_345428 ) ) ( not ( = ?auto_345423 ?auto_345424 ) ) ( not ( = ?auto_345423 ?auto_345425 ) ) ( not ( = ?auto_345423 ?auto_345426 ) ) ( not ( = ?auto_345423 ?auto_345427 ) ) ( not ( = ?auto_345423 ?auto_345428 ) ) ( not ( = ?auto_345424 ?auto_345425 ) ) ( not ( = ?auto_345424 ?auto_345426 ) ) ( not ( = ?auto_345424 ?auto_345427 ) ) ( not ( = ?auto_345424 ?auto_345428 ) ) ( not ( = ?auto_345425 ?auto_345426 ) ) ( not ( = ?auto_345425 ?auto_345427 ) ) ( not ( = ?auto_345425 ?auto_345428 ) ) ( not ( = ?auto_345426 ?auto_345427 ) ) ( not ( = ?auto_345426 ?auto_345428 ) ) ( not ( = ?auto_345427 ?auto_345428 ) ) ( ON ?auto_345426 ?auto_345427 ) ( ON ?auto_345425 ?auto_345426 ) ( ON ?auto_345424 ?auto_345425 ) ( ON ?auto_345423 ?auto_345424 ) ( ON ?auto_345422 ?auto_345423 ) ( CLEAR ?auto_345420 ) ( ON ?auto_345421 ?auto_345422 ) ( CLEAR ?auto_345421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_345417 ?auto_345418 ?auto_345419 ?auto_345420 ?auto_345421 )
      ( MAKE-11PILE ?auto_345417 ?auto_345418 ?auto_345419 ?auto_345420 ?auto_345421 ?auto_345422 ?auto_345423 ?auto_345424 ?auto_345425 ?auto_345426 ?auto_345427 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_345440 - BLOCK
      ?auto_345441 - BLOCK
      ?auto_345442 - BLOCK
      ?auto_345443 - BLOCK
      ?auto_345444 - BLOCK
      ?auto_345445 - BLOCK
      ?auto_345446 - BLOCK
      ?auto_345447 - BLOCK
      ?auto_345448 - BLOCK
      ?auto_345449 - BLOCK
      ?auto_345450 - BLOCK
    )
    :vars
    (
      ?auto_345451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345450 ?auto_345451 ) ( ON-TABLE ?auto_345440 ) ( ON ?auto_345441 ?auto_345440 ) ( ON ?auto_345442 ?auto_345441 ) ( ON ?auto_345443 ?auto_345442 ) ( not ( = ?auto_345440 ?auto_345441 ) ) ( not ( = ?auto_345440 ?auto_345442 ) ) ( not ( = ?auto_345440 ?auto_345443 ) ) ( not ( = ?auto_345440 ?auto_345444 ) ) ( not ( = ?auto_345440 ?auto_345445 ) ) ( not ( = ?auto_345440 ?auto_345446 ) ) ( not ( = ?auto_345440 ?auto_345447 ) ) ( not ( = ?auto_345440 ?auto_345448 ) ) ( not ( = ?auto_345440 ?auto_345449 ) ) ( not ( = ?auto_345440 ?auto_345450 ) ) ( not ( = ?auto_345440 ?auto_345451 ) ) ( not ( = ?auto_345441 ?auto_345442 ) ) ( not ( = ?auto_345441 ?auto_345443 ) ) ( not ( = ?auto_345441 ?auto_345444 ) ) ( not ( = ?auto_345441 ?auto_345445 ) ) ( not ( = ?auto_345441 ?auto_345446 ) ) ( not ( = ?auto_345441 ?auto_345447 ) ) ( not ( = ?auto_345441 ?auto_345448 ) ) ( not ( = ?auto_345441 ?auto_345449 ) ) ( not ( = ?auto_345441 ?auto_345450 ) ) ( not ( = ?auto_345441 ?auto_345451 ) ) ( not ( = ?auto_345442 ?auto_345443 ) ) ( not ( = ?auto_345442 ?auto_345444 ) ) ( not ( = ?auto_345442 ?auto_345445 ) ) ( not ( = ?auto_345442 ?auto_345446 ) ) ( not ( = ?auto_345442 ?auto_345447 ) ) ( not ( = ?auto_345442 ?auto_345448 ) ) ( not ( = ?auto_345442 ?auto_345449 ) ) ( not ( = ?auto_345442 ?auto_345450 ) ) ( not ( = ?auto_345442 ?auto_345451 ) ) ( not ( = ?auto_345443 ?auto_345444 ) ) ( not ( = ?auto_345443 ?auto_345445 ) ) ( not ( = ?auto_345443 ?auto_345446 ) ) ( not ( = ?auto_345443 ?auto_345447 ) ) ( not ( = ?auto_345443 ?auto_345448 ) ) ( not ( = ?auto_345443 ?auto_345449 ) ) ( not ( = ?auto_345443 ?auto_345450 ) ) ( not ( = ?auto_345443 ?auto_345451 ) ) ( not ( = ?auto_345444 ?auto_345445 ) ) ( not ( = ?auto_345444 ?auto_345446 ) ) ( not ( = ?auto_345444 ?auto_345447 ) ) ( not ( = ?auto_345444 ?auto_345448 ) ) ( not ( = ?auto_345444 ?auto_345449 ) ) ( not ( = ?auto_345444 ?auto_345450 ) ) ( not ( = ?auto_345444 ?auto_345451 ) ) ( not ( = ?auto_345445 ?auto_345446 ) ) ( not ( = ?auto_345445 ?auto_345447 ) ) ( not ( = ?auto_345445 ?auto_345448 ) ) ( not ( = ?auto_345445 ?auto_345449 ) ) ( not ( = ?auto_345445 ?auto_345450 ) ) ( not ( = ?auto_345445 ?auto_345451 ) ) ( not ( = ?auto_345446 ?auto_345447 ) ) ( not ( = ?auto_345446 ?auto_345448 ) ) ( not ( = ?auto_345446 ?auto_345449 ) ) ( not ( = ?auto_345446 ?auto_345450 ) ) ( not ( = ?auto_345446 ?auto_345451 ) ) ( not ( = ?auto_345447 ?auto_345448 ) ) ( not ( = ?auto_345447 ?auto_345449 ) ) ( not ( = ?auto_345447 ?auto_345450 ) ) ( not ( = ?auto_345447 ?auto_345451 ) ) ( not ( = ?auto_345448 ?auto_345449 ) ) ( not ( = ?auto_345448 ?auto_345450 ) ) ( not ( = ?auto_345448 ?auto_345451 ) ) ( not ( = ?auto_345449 ?auto_345450 ) ) ( not ( = ?auto_345449 ?auto_345451 ) ) ( not ( = ?auto_345450 ?auto_345451 ) ) ( ON ?auto_345449 ?auto_345450 ) ( ON ?auto_345448 ?auto_345449 ) ( ON ?auto_345447 ?auto_345448 ) ( ON ?auto_345446 ?auto_345447 ) ( ON ?auto_345445 ?auto_345446 ) ( CLEAR ?auto_345443 ) ( ON ?auto_345444 ?auto_345445 ) ( CLEAR ?auto_345444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_345440 ?auto_345441 ?auto_345442 ?auto_345443 ?auto_345444 )
      ( MAKE-11PILE ?auto_345440 ?auto_345441 ?auto_345442 ?auto_345443 ?auto_345444 ?auto_345445 ?auto_345446 ?auto_345447 ?auto_345448 ?auto_345449 ?auto_345450 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_345463 - BLOCK
      ?auto_345464 - BLOCK
      ?auto_345465 - BLOCK
      ?auto_345466 - BLOCK
      ?auto_345467 - BLOCK
      ?auto_345468 - BLOCK
      ?auto_345469 - BLOCK
      ?auto_345470 - BLOCK
      ?auto_345471 - BLOCK
      ?auto_345472 - BLOCK
      ?auto_345473 - BLOCK
    )
    :vars
    (
      ?auto_345474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345473 ?auto_345474 ) ( ON-TABLE ?auto_345463 ) ( ON ?auto_345464 ?auto_345463 ) ( ON ?auto_345465 ?auto_345464 ) ( not ( = ?auto_345463 ?auto_345464 ) ) ( not ( = ?auto_345463 ?auto_345465 ) ) ( not ( = ?auto_345463 ?auto_345466 ) ) ( not ( = ?auto_345463 ?auto_345467 ) ) ( not ( = ?auto_345463 ?auto_345468 ) ) ( not ( = ?auto_345463 ?auto_345469 ) ) ( not ( = ?auto_345463 ?auto_345470 ) ) ( not ( = ?auto_345463 ?auto_345471 ) ) ( not ( = ?auto_345463 ?auto_345472 ) ) ( not ( = ?auto_345463 ?auto_345473 ) ) ( not ( = ?auto_345463 ?auto_345474 ) ) ( not ( = ?auto_345464 ?auto_345465 ) ) ( not ( = ?auto_345464 ?auto_345466 ) ) ( not ( = ?auto_345464 ?auto_345467 ) ) ( not ( = ?auto_345464 ?auto_345468 ) ) ( not ( = ?auto_345464 ?auto_345469 ) ) ( not ( = ?auto_345464 ?auto_345470 ) ) ( not ( = ?auto_345464 ?auto_345471 ) ) ( not ( = ?auto_345464 ?auto_345472 ) ) ( not ( = ?auto_345464 ?auto_345473 ) ) ( not ( = ?auto_345464 ?auto_345474 ) ) ( not ( = ?auto_345465 ?auto_345466 ) ) ( not ( = ?auto_345465 ?auto_345467 ) ) ( not ( = ?auto_345465 ?auto_345468 ) ) ( not ( = ?auto_345465 ?auto_345469 ) ) ( not ( = ?auto_345465 ?auto_345470 ) ) ( not ( = ?auto_345465 ?auto_345471 ) ) ( not ( = ?auto_345465 ?auto_345472 ) ) ( not ( = ?auto_345465 ?auto_345473 ) ) ( not ( = ?auto_345465 ?auto_345474 ) ) ( not ( = ?auto_345466 ?auto_345467 ) ) ( not ( = ?auto_345466 ?auto_345468 ) ) ( not ( = ?auto_345466 ?auto_345469 ) ) ( not ( = ?auto_345466 ?auto_345470 ) ) ( not ( = ?auto_345466 ?auto_345471 ) ) ( not ( = ?auto_345466 ?auto_345472 ) ) ( not ( = ?auto_345466 ?auto_345473 ) ) ( not ( = ?auto_345466 ?auto_345474 ) ) ( not ( = ?auto_345467 ?auto_345468 ) ) ( not ( = ?auto_345467 ?auto_345469 ) ) ( not ( = ?auto_345467 ?auto_345470 ) ) ( not ( = ?auto_345467 ?auto_345471 ) ) ( not ( = ?auto_345467 ?auto_345472 ) ) ( not ( = ?auto_345467 ?auto_345473 ) ) ( not ( = ?auto_345467 ?auto_345474 ) ) ( not ( = ?auto_345468 ?auto_345469 ) ) ( not ( = ?auto_345468 ?auto_345470 ) ) ( not ( = ?auto_345468 ?auto_345471 ) ) ( not ( = ?auto_345468 ?auto_345472 ) ) ( not ( = ?auto_345468 ?auto_345473 ) ) ( not ( = ?auto_345468 ?auto_345474 ) ) ( not ( = ?auto_345469 ?auto_345470 ) ) ( not ( = ?auto_345469 ?auto_345471 ) ) ( not ( = ?auto_345469 ?auto_345472 ) ) ( not ( = ?auto_345469 ?auto_345473 ) ) ( not ( = ?auto_345469 ?auto_345474 ) ) ( not ( = ?auto_345470 ?auto_345471 ) ) ( not ( = ?auto_345470 ?auto_345472 ) ) ( not ( = ?auto_345470 ?auto_345473 ) ) ( not ( = ?auto_345470 ?auto_345474 ) ) ( not ( = ?auto_345471 ?auto_345472 ) ) ( not ( = ?auto_345471 ?auto_345473 ) ) ( not ( = ?auto_345471 ?auto_345474 ) ) ( not ( = ?auto_345472 ?auto_345473 ) ) ( not ( = ?auto_345472 ?auto_345474 ) ) ( not ( = ?auto_345473 ?auto_345474 ) ) ( ON ?auto_345472 ?auto_345473 ) ( ON ?auto_345471 ?auto_345472 ) ( ON ?auto_345470 ?auto_345471 ) ( ON ?auto_345469 ?auto_345470 ) ( ON ?auto_345468 ?auto_345469 ) ( ON ?auto_345467 ?auto_345468 ) ( CLEAR ?auto_345465 ) ( ON ?auto_345466 ?auto_345467 ) ( CLEAR ?auto_345466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_345463 ?auto_345464 ?auto_345465 ?auto_345466 )
      ( MAKE-11PILE ?auto_345463 ?auto_345464 ?auto_345465 ?auto_345466 ?auto_345467 ?auto_345468 ?auto_345469 ?auto_345470 ?auto_345471 ?auto_345472 ?auto_345473 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_345486 - BLOCK
      ?auto_345487 - BLOCK
      ?auto_345488 - BLOCK
      ?auto_345489 - BLOCK
      ?auto_345490 - BLOCK
      ?auto_345491 - BLOCK
      ?auto_345492 - BLOCK
      ?auto_345493 - BLOCK
      ?auto_345494 - BLOCK
      ?auto_345495 - BLOCK
      ?auto_345496 - BLOCK
    )
    :vars
    (
      ?auto_345497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345496 ?auto_345497 ) ( ON-TABLE ?auto_345486 ) ( ON ?auto_345487 ?auto_345486 ) ( ON ?auto_345488 ?auto_345487 ) ( not ( = ?auto_345486 ?auto_345487 ) ) ( not ( = ?auto_345486 ?auto_345488 ) ) ( not ( = ?auto_345486 ?auto_345489 ) ) ( not ( = ?auto_345486 ?auto_345490 ) ) ( not ( = ?auto_345486 ?auto_345491 ) ) ( not ( = ?auto_345486 ?auto_345492 ) ) ( not ( = ?auto_345486 ?auto_345493 ) ) ( not ( = ?auto_345486 ?auto_345494 ) ) ( not ( = ?auto_345486 ?auto_345495 ) ) ( not ( = ?auto_345486 ?auto_345496 ) ) ( not ( = ?auto_345486 ?auto_345497 ) ) ( not ( = ?auto_345487 ?auto_345488 ) ) ( not ( = ?auto_345487 ?auto_345489 ) ) ( not ( = ?auto_345487 ?auto_345490 ) ) ( not ( = ?auto_345487 ?auto_345491 ) ) ( not ( = ?auto_345487 ?auto_345492 ) ) ( not ( = ?auto_345487 ?auto_345493 ) ) ( not ( = ?auto_345487 ?auto_345494 ) ) ( not ( = ?auto_345487 ?auto_345495 ) ) ( not ( = ?auto_345487 ?auto_345496 ) ) ( not ( = ?auto_345487 ?auto_345497 ) ) ( not ( = ?auto_345488 ?auto_345489 ) ) ( not ( = ?auto_345488 ?auto_345490 ) ) ( not ( = ?auto_345488 ?auto_345491 ) ) ( not ( = ?auto_345488 ?auto_345492 ) ) ( not ( = ?auto_345488 ?auto_345493 ) ) ( not ( = ?auto_345488 ?auto_345494 ) ) ( not ( = ?auto_345488 ?auto_345495 ) ) ( not ( = ?auto_345488 ?auto_345496 ) ) ( not ( = ?auto_345488 ?auto_345497 ) ) ( not ( = ?auto_345489 ?auto_345490 ) ) ( not ( = ?auto_345489 ?auto_345491 ) ) ( not ( = ?auto_345489 ?auto_345492 ) ) ( not ( = ?auto_345489 ?auto_345493 ) ) ( not ( = ?auto_345489 ?auto_345494 ) ) ( not ( = ?auto_345489 ?auto_345495 ) ) ( not ( = ?auto_345489 ?auto_345496 ) ) ( not ( = ?auto_345489 ?auto_345497 ) ) ( not ( = ?auto_345490 ?auto_345491 ) ) ( not ( = ?auto_345490 ?auto_345492 ) ) ( not ( = ?auto_345490 ?auto_345493 ) ) ( not ( = ?auto_345490 ?auto_345494 ) ) ( not ( = ?auto_345490 ?auto_345495 ) ) ( not ( = ?auto_345490 ?auto_345496 ) ) ( not ( = ?auto_345490 ?auto_345497 ) ) ( not ( = ?auto_345491 ?auto_345492 ) ) ( not ( = ?auto_345491 ?auto_345493 ) ) ( not ( = ?auto_345491 ?auto_345494 ) ) ( not ( = ?auto_345491 ?auto_345495 ) ) ( not ( = ?auto_345491 ?auto_345496 ) ) ( not ( = ?auto_345491 ?auto_345497 ) ) ( not ( = ?auto_345492 ?auto_345493 ) ) ( not ( = ?auto_345492 ?auto_345494 ) ) ( not ( = ?auto_345492 ?auto_345495 ) ) ( not ( = ?auto_345492 ?auto_345496 ) ) ( not ( = ?auto_345492 ?auto_345497 ) ) ( not ( = ?auto_345493 ?auto_345494 ) ) ( not ( = ?auto_345493 ?auto_345495 ) ) ( not ( = ?auto_345493 ?auto_345496 ) ) ( not ( = ?auto_345493 ?auto_345497 ) ) ( not ( = ?auto_345494 ?auto_345495 ) ) ( not ( = ?auto_345494 ?auto_345496 ) ) ( not ( = ?auto_345494 ?auto_345497 ) ) ( not ( = ?auto_345495 ?auto_345496 ) ) ( not ( = ?auto_345495 ?auto_345497 ) ) ( not ( = ?auto_345496 ?auto_345497 ) ) ( ON ?auto_345495 ?auto_345496 ) ( ON ?auto_345494 ?auto_345495 ) ( ON ?auto_345493 ?auto_345494 ) ( ON ?auto_345492 ?auto_345493 ) ( ON ?auto_345491 ?auto_345492 ) ( ON ?auto_345490 ?auto_345491 ) ( CLEAR ?auto_345488 ) ( ON ?auto_345489 ?auto_345490 ) ( CLEAR ?auto_345489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_345486 ?auto_345487 ?auto_345488 ?auto_345489 )
      ( MAKE-11PILE ?auto_345486 ?auto_345487 ?auto_345488 ?auto_345489 ?auto_345490 ?auto_345491 ?auto_345492 ?auto_345493 ?auto_345494 ?auto_345495 ?auto_345496 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_345509 - BLOCK
      ?auto_345510 - BLOCK
      ?auto_345511 - BLOCK
      ?auto_345512 - BLOCK
      ?auto_345513 - BLOCK
      ?auto_345514 - BLOCK
      ?auto_345515 - BLOCK
      ?auto_345516 - BLOCK
      ?auto_345517 - BLOCK
      ?auto_345518 - BLOCK
      ?auto_345519 - BLOCK
    )
    :vars
    (
      ?auto_345520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345519 ?auto_345520 ) ( ON-TABLE ?auto_345509 ) ( ON ?auto_345510 ?auto_345509 ) ( not ( = ?auto_345509 ?auto_345510 ) ) ( not ( = ?auto_345509 ?auto_345511 ) ) ( not ( = ?auto_345509 ?auto_345512 ) ) ( not ( = ?auto_345509 ?auto_345513 ) ) ( not ( = ?auto_345509 ?auto_345514 ) ) ( not ( = ?auto_345509 ?auto_345515 ) ) ( not ( = ?auto_345509 ?auto_345516 ) ) ( not ( = ?auto_345509 ?auto_345517 ) ) ( not ( = ?auto_345509 ?auto_345518 ) ) ( not ( = ?auto_345509 ?auto_345519 ) ) ( not ( = ?auto_345509 ?auto_345520 ) ) ( not ( = ?auto_345510 ?auto_345511 ) ) ( not ( = ?auto_345510 ?auto_345512 ) ) ( not ( = ?auto_345510 ?auto_345513 ) ) ( not ( = ?auto_345510 ?auto_345514 ) ) ( not ( = ?auto_345510 ?auto_345515 ) ) ( not ( = ?auto_345510 ?auto_345516 ) ) ( not ( = ?auto_345510 ?auto_345517 ) ) ( not ( = ?auto_345510 ?auto_345518 ) ) ( not ( = ?auto_345510 ?auto_345519 ) ) ( not ( = ?auto_345510 ?auto_345520 ) ) ( not ( = ?auto_345511 ?auto_345512 ) ) ( not ( = ?auto_345511 ?auto_345513 ) ) ( not ( = ?auto_345511 ?auto_345514 ) ) ( not ( = ?auto_345511 ?auto_345515 ) ) ( not ( = ?auto_345511 ?auto_345516 ) ) ( not ( = ?auto_345511 ?auto_345517 ) ) ( not ( = ?auto_345511 ?auto_345518 ) ) ( not ( = ?auto_345511 ?auto_345519 ) ) ( not ( = ?auto_345511 ?auto_345520 ) ) ( not ( = ?auto_345512 ?auto_345513 ) ) ( not ( = ?auto_345512 ?auto_345514 ) ) ( not ( = ?auto_345512 ?auto_345515 ) ) ( not ( = ?auto_345512 ?auto_345516 ) ) ( not ( = ?auto_345512 ?auto_345517 ) ) ( not ( = ?auto_345512 ?auto_345518 ) ) ( not ( = ?auto_345512 ?auto_345519 ) ) ( not ( = ?auto_345512 ?auto_345520 ) ) ( not ( = ?auto_345513 ?auto_345514 ) ) ( not ( = ?auto_345513 ?auto_345515 ) ) ( not ( = ?auto_345513 ?auto_345516 ) ) ( not ( = ?auto_345513 ?auto_345517 ) ) ( not ( = ?auto_345513 ?auto_345518 ) ) ( not ( = ?auto_345513 ?auto_345519 ) ) ( not ( = ?auto_345513 ?auto_345520 ) ) ( not ( = ?auto_345514 ?auto_345515 ) ) ( not ( = ?auto_345514 ?auto_345516 ) ) ( not ( = ?auto_345514 ?auto_345517 ) ) ( not ( = ?auto_345514 ?auto_345518 ) ) ( not ( = ?auto_345514 ?auto_345519 ) ) ( not ( = ?auto_345514 ?auto_345520 ) ) ( not ( = ?auto_345515 ?auto_345516 ) ) ( not ( = ?auto_345515 ?auto_345517 ) ) ( not ( = ?auto_345515 ?auto_345518 ) ) ( not ( = ?auto_345515 ?auto_345519 ) ) ( not ( = ?auto_345515 ?auto_345520 ) ) ( not ( = ?auto_345516 ?auto_345517 ) ) ( not ( = ?auto_345516 ?auto_345518 ) ) ( not ( = ?auto_345516 ?auto_345519 ) ) ( not ( = ?auto_345516 ?auto_345520 ) ) ( not ( = ?auto_345517 ?auto_345518 ) ) ( not ( = ?auto_345517 ?auto_345519 ) ) ( not ( = ?auto_345517 ?auto_345520 ) ) ( not ( = ?auto_345518 ?auto_345519 ) ) ( not ( = ?auto_345518 ?auto_345520 ) ) ( not ( = ?auto_345519 ?auto_345520 ) ) ( ON ?auto_345518 ?auto_345519 ) ( ON ?auto_345517 ?auto_345518 ) ( ON ?auto_345516 ?auto_345517 ) ( ON ?auto_345515 ?auto_345516 ) ( ON ?auto_345514 ?auto_345515 ) ( ON ?auto_345513 ?auto_345514 ) ( ON ?auto_345512 ?auto_345513 ) ( CLEAR ?auto_345510 ) ( ON ?auto_345511 ?auto_345512 ) ( CLEAR ?auto_345511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_345509 ?auto_345510 ?auto_345511 )
      ( MAKE-11PILE ?auto_345509 ?auto_345510 ?auto_345511 ?auto_345512 ?auto_345513 ?auto_345514 ?auto_345515 ?auto_345516 ?auto_345517 ?auto_345518 ?auto_345519 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_345532 - BLOCK
      ?auto_345533 - BLOCK
      ?auto_345534 - BLOCK
      ?auto_345535 - BLOCK
      ?auto_345536 - BLOCK
      ?auto_345537 - BLOCK
      ?auto_345538 - BLOCK
      ?auto_345539 - BLOCK
      ?auto_345540 - BLOCK
      ?auto_345541 - BLOCK
      ?auto_345542 - BLOCK
    )
    :vars
    (
      ?auto_345543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345542 ?auto_345543 ) ( ON-TABLE ?auto_345532 ) ( ON ?auto_345533 ?auto_345532 ) ( not ( = ?auto_345532 ?auto_345533 ) ) ( not ( = ?auto_345532 ?auto_345534 ) ) ( not ( = ?auto_345532 ?auto_345535 ) ) ( not ( = ?auto_345532 ?auto_345536 ) ) ( not ( = ?auto_345532 ?auto_345537 ) ) ( not ( = ?auto_345532 ?auto_345538 ) ) ( not ( = ?auto_345532 ?auto_345539 ) ) ( not ( = ?auto_345532 ?auto_345540 ) ) ( not ( = ?auto_345532 ?auto_345541 ) ) ( not ( = ?auto_345532 ?auto_345542 ) ) ( not ( = ?auto_345532 ?auto_345543 ) ) ( not ( = ?auto_345533 ?auto_345534 ) ) ( not ( = ?auto_345533 ?auto_345535 ) ) ( not ( = ?auto_345533 ?auto_345536 ) ) ( not ( = ?auto_345533 ?auto_345537 ) ) ( not ( = ?auto_345533 ?auto_345538 ) ) ( not ( = ?auto_345533 ?auto_345539 ) ) ( not ( = ?auto_345533 ?auto_345540 ) ) ( not ( = ?auto_345533 ?auto_345541 ) ) ( not ( = ?auto_345533 ?auto_345542 ) ) ( not ( = ?auto_345533 ?auto_345543 ) ) ( not ( = ?auto_345534 ?auto_345535 ) ) ( not ( = ?auto_345534 ?auto_345536 ) ) ( not ( = ?auto_345534 ?auto_345537 ) ) ( not ( = ?auto_345534 ?auto_345538 ) ) ( not ( = ?auto_345534 ?auto_345539 ) ) ( not ( = ?auto_345534 ?auto_345540 ) ) ( not ( = ?auto_345534 ?auto_345541 ) ) ( not ( = ?auto_345534 ?auto_345542 ) ) ( not ( = ?auto_345534 ?auto_345543 ) ) ( not ( = ?auto_345535 ?auto_345536 ) ) ( not ( = ?auto_345535 ?auto_345537 ) ) ( not ( = ?auto_345535 ?auto_345538 ) ) ( not ( = ?auto_345535 ?auto_345539 ) ) ( not ( = ?auto_345535 ?auto_345540 ) ) ( not ( = ?auto_345535 ?auto_345541 ) ) ( not ( = ?auto_345535 ?auto_345542 ) ) ( not ( = ?auto_345535 ?auto_345543 ) ) ( not ( = ?auto_345536 ?auto_345537 ) ) ( not ( = ?auto_345536 ?auto_345538 ) ) ( not ( = ?auto_345536 ?auto_345539 ) ) ( not ( = ?auto_345536 ?auto_345540 ) ) ( not ( = ?auto_345536 ?auto_345541 ) ) ( not ( = ?auto_345536 ?auto_345542 ) ) ( not ( = ?auto_345536 ?auto_345543 ) ) ( not ( = ?auto_345537 ?auto_345538 ) ) ( not ( = ?auto_345537 ?auto_345539 ) ) ( not ( = ?auto_345537 ?auto_345540 ) ) ( not ( = ?auto_345537 ?auto_345541 ) ) ( not ( = ?auto_345537 ?auto_345542 ) ) ( not ( = ?auto_345537 ?auto_345543 ) ) ( not ( = ?auto_345538 ?auto_345539 ) ) ( not ( = ?auto_345538 ?auto_345540 ) ) ( not ( = ?auto_345538 ?auto_345541 ) ) ( not ( = ?auto_345538 ?auto_345542 ) ) ( not ( = ?auto_345538 ?auto_345543 ) ) ( not ( = ?auto_345539 ?auto_345540 ) ) ( not ( = ?auto_345539 ?auto_345541 ) ) ( not ( = ?auto_345539 ?auto_345542 ) ) ( not ( = ?auto_345539 ?auto_345543 ) ) ( not ( = ?auto_345540 ?auto_345541 ) ) ( not ( = ?auto_345540 ?auto_345542 ) ) ( not ( = ?auto_345540 ?auto_345543 ) ) ( not ( = ?auto_345541 ?auto_345542 ) ) ( not ( = ?auto_345541 ?auto_345543 ) ) ( not ( = ?auto_345542 ?auto_345543 ) ) ( ON ?auto_345541 ?auto_345542 ) ( ON ?auto_345540 ?auto_345541 ) ( ON ?auto_345539 ?auto_345540 ) ( ON ?auto_345538 ?auto_345539 ) ( ON ?auto_345537 ?auto_345538 ) ( ON ?auto_345536 ?auto_345537 ) ( ON ?auto_345535 ?auto_345536 ) ( CLEAR ?auto_345533 ) ( ON ?auto_345534 ?auto_345535 ) ( CLEAR ?auto_345534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_345532 ?auto_345533 ?auto_345534 )
      ( MAKE-11PILE ?auto_345532 ?auto_345533 ?auto_345534 ?auto_345535 ?auto_345536 ?auto_345537 ?auto_345538 ?auto_345539 ?auto_345540 ?auto_345541 ?auto_345542 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_345555 - BLOCK
      ?auto_345556 - BLOCK
      ?auto_345557 - BLOCK
      ?auto_345558 - BLOCK
      ?auto_345559 - BLOCK
      ?auto_345560 - BLOCK
      ?auto_345561 - BLOCK
      ?auto_345562 - BLOCK
      ?auto_345563 - BLOCK
      ?auto_345564 - BLOCK
      ?auto_345565 - BLOCK
    )
    :vars
    (
      ?auto_345566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345565 ?auto_345566 ) ( ON-TABLE ?auto_345555 ) ( not ( = ?auto_345555 ?auto_345556 ) ) ( not ( = ?auto_345555 ?auto_345557 ) ) ( not ( = ?auto_345555 ?auto_345558 ) ) ( not ( = ?auto_345555 ?auto_345559 ) ) ( not ( = ?auto_345555 ?auto_345560 ) ) ( not ( = ?auto_345555 ?auto_345561 ) ) ( not ( = ?auto_345555 ?auto_345562 ) ) ( not ( = ?auto_345555 ?auto_345563 ) ) ( not ( = ?auto_345555 ?auto_345564 ) ) ( not ( = ?auto_345555 ?auto_345565 ) ) ( not ( = ?auto_345555 ?auto_345566 ) ) ( not ( = ?auto_345556 ?auto_345557 ) ) ( not ( = ?auto_345556 ?auto_345558 ) ) ( not ( = ?auto_345556 ?auto_345559 ) ) ( not ( = ?auto_345556 ?auto_345560 ) ) ( not ( = ?auto_345556 ?auto_345561 ) ) ( not ( = ?auto_345556 ?auto_345562 ) ) ( not ( = ?auto_345556 ?auto_345563 ) ) ( not ( = ?auto_345556 ?auto_345564 ) ) ( not ( = ?auto_345556 ?auto_345565 ) ) ( not ( = ?auto_345556 ?auto_345566 ) ) ( not ( = ?auto_345557 ?auto_345558 ) ) ( not ( = ?auto_345557 ?auto_345559 ) ) ( not ( = ?auto_345557 ?auto_345560 ) ) ( not ( = ?auto_345557 ?auto_345561 ) ) ( not ( = ?auto_345557 ?auto_345562 ) ) ( not ( = ?auto_345557 ?auto_345563 ) ) ( not ( = ?auto_345557 ?auto_345564 ) ) ( not ( = ?auto_345557 ?auto_345565 ) ) ( not ( = ?auto_345557 ?auto_345566 ) ) ( not ( = ?auto_345558 ?auto_345559 ) ) ( not ( = ?auto_345558 ?auto_345560 ) ) ( not ( = ?auto_345558 ?auto_345561 ) ) ( not ( = ?auto_345558 ?auto_345562 ) ) ( not ( = ?auto_345558 ?auto_345563 ) ) ( not ( = ?auto_345558 ?auto_345564 ) ) ( not ( = ?auto_345558 ?auto_345565 ) ) ( not ( = ?auto_345558 ?auto_345566 ) ) ( not ( = ?auto_345559 ?auto_345560 ) ) ( not ( = ?auto_345559 ?auto_345561 ) ) ( not ( = ?auto_345559 ?auto_345562 ) ) ( not ( = ?auto_345559 ?auto_345563 ) ) ( not ( = ?auto_345559 ?auto_345564 ) ) ( not ( = ?auto_345559 ?auto_345565 ) ) ( not ( = ?auto_345559 ?auto_345566 ) ) ( not ( = ?auto_345560 ?auto_345561 ) ) ( not ( = ?auto_345560 ?auto_345562 ) ) ( not ( = ?auto_345560 ?auto_345563 ) ) ( not ( = ?auto_345560 ?auto_345564 ) ) ( not ( = ?auto_345560 ?auto_345565 ) ) ( not ( = ?auto_345560 ?auto_345566 ) ) ( not ( = ?auto_345561 ?auto_345562 ) ) ( not ( = ?auto_345561 ?auto_345563 ) ) ( not ( = ?auto_345561 ?auto_345564 ) ) ( not ( = ?auto_345561 ?auto_345565 ) ) ( not ( = ?auto_345561 ?auto_345566 ) ) ( not ( = ?auto_345562 ?auto_345563 ) ) ( not ( = ?auto_345562 ?auto_345564 ) ) ( not ( = ?auto_345562 ?auto_345565 ) ) ( not ( = ?auto_345562 ?auto_345566 ) ) ( not ( = ?auto_345563 ?auto_345564 ) ) ( not ( = ?auto_345563 ?auto_345565 ) ) ( not ( = ?auto_345563 ?auto_345566 ) ) ( not ( = ?auto_345564 ?auto_345565 ) ) ( not ( = ?auto_345564 ?auto_345566 ) ) ( not ( = ?auto_345565 ?auto_345566 ) ) ( ON ?auto_345564 ?auto_345565 ) ( ON ?auto_345563 ?auto_345564 ) ( ON ?auto_345562 ?auto_345563 ) ( ON ?auto_345561 ?auto_345562 ) ( ON ?auto_345560 ?auto_345561 ) ( ON ?auto_345559 ?auto_345560 ) ( ON ?auto_345558 ?auto_345559 ) ( ON ?auto_345557 ?auto_345558 ) ( CLEAR ?auto_345555 ) ( ON ?auto_345556 ?auto_345557 ) ( CLEAR ?auto_345556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_345555 ?auto_345556 )
      ( MAKE-11PILE ?auto_345555 ?auto_345556 ?auto_345557 ?auto_345558 ?auto_345559 ?auto_345560 ?auto_345561 ?auto_345562 ?auto_345563 ?auto_345564 ?auto_345565 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_345578 - BLOCK
      ?auto_345579 - BLOCK
      ?auto_345580 - BLOCK
      ?auto_345581 - BLOCK
      ?auto_345582 - BLOCK
      ?auto_345583 - BLOCK
      ?auto_345584 - BLOCK
      ?auto_345585 - BLOCK
      ?auto_345586 - BLOCK
      ?auto_345587 - BLOCK
      ?auto_345588 - BLOCK
    )
    :vars
    (
      ?auto_345589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345588 ?auto_345589 ) ( ON-TABLE ?auto_345578 ) ( not ( = ?auto_345578 ?auto_345579 ) ) ( not ( = ?auto_345578 ?auto_345580 ) ) ( not ( = ?auto_345578 ?auto_345581 ) ) ( not ( = ?auto_345578 ?auto_345582 ) ) ( not ( = ?auto_345578 ?auto_345583 ) ) ( not ( = ?auto_345578 ?auto_345584 ) ) ( not ( = ?auto_345578 ?auto_345585 ) ) ( not ( = ?auto_345578 ?auto_345586 ) ) ( not ( = ?auto_345578 ?auto_345587 ) ) ( not ( = ?auto_345578 ?auto_345588 ) ) ( not ( = ?auto_345578 ?auto_345589 ) ) ( not ( = ?auto_345579 ?auto_345580 ) ) ( not ( = ?auto_345579 ?auto_345581 ) ) ( not ( = ?auto_345579 ?auto_345582 ) ) ( not ( = ?auto_345579 ?auto_345583 ) ) ( not ( = ?auto_345579 ?auto_345584 ) ) ( not ( = ?auto_345579 ?auto_345585 ) ) ( not ( = ?auto_345579 ?auto_345586 ) ) ( not ( = ?auto_345579 ?auto_345587 ) ) ( not ( = ?auto_345579 ?auto_345588 ) ) ( not ( = ?auto_345579 ?auto_345589 ) ) ( not ( = ?auto_345580 ?auto_345581 ) ) ( not ( = ?auto_345580 ?auto_345582 ) ) ( not ( = ?auto_345580 ?auto_345583 ) ) ( not ( = ?auto_345580 ?auto_345584 ) ) ( not ( = ?auto_345580 ?auto_345585 ) ) ( not ( = ?auto_345580 ?auto_345586 ) ) ( not ( = ?auto_345580 ?auto_345587 ) ) ( not ( = ?auto_345580 ?auto_345588 ) ) ( not ( = ?auto_345580 ?auto_345589 ) ) ( not ( = ?auto_345581 ?auto_345582 ) ) ( not ( = ?auto_345581 ?auto_345583 ) ) ( not ( = ?auto_345581 ?auto_345584 ) ) ( not ( = ?auto_345581 ?auto_345585 ) ) ( not ( = ?auto_345581 ?auto_345586 ) ) ( not ( = ?auto_345581 ?auto_345587 ) ) ( not ( = ?auto_345581 ?auto_345588 ) ) ( not ( = ?auto_345581 ?auto_345589 ) ) ( not ( = ?auto_345582 ?auto_345583 ) ) ( not ( = ?auto_345582 ?auto_345584 ) ) ( not ( = ?auto_345582 ?auto_345585 ) ) ( not ( = ?auto_345582 ?auto_345586 ) ) ( not ( = ?auto_345582 ?auto_345587 ) ) ( not ( = ?auto_345582 ?auto_345588 ) ) ( not ( = ?auto_345582 ?auto_345589 ) ) ( not ( = ?auto_345583 ?auto_345584 ) ) ( not ( = ?auto_345583 ?auto_345585 ) ) ( not ( = ?auto_345583 ?auto_345586 ) ) ( not ( = ?auto_345583 ?auto_345587 ) ) ( not ( = ?auto_345583 ?auto_345588 ) ) ( not ( = ?auto_345583 ?auto_345589 ) ) ( not ( = ?auto_345584 ?auto_345585 ) ) ( not ( = ?auto_345584 ?auto_345586 ) ) ( not ( = ?auto_345584 ?auto_345587 ) ) ( not ( = ?auto_345584 ?auto_345588 ) ) ( not ( = ?auto_345584 ?auto_345589 ) ) ( not ( = ?auto_345585 ?auto_345586 ) ) ( not ( = ?auto_345585 ?auto_345587 ) ) ( not ( = ?auto_345585 ?auto_345588 ) ) ( not ( = ?auto_345585 ?auto_345589 ) ) ( not ( = ?auto_345586 ?auto_345587 ) ) ( not ( = ?auto_345586 ?auto_345588 ) ) ( not ( = ?auto_345586 ?auto_345589 ) ) ( not ( = ?auto_345587 ?auto_345588 ) ) ( not ( = ?auto_345587 ?auto_345589 ) ) ( not ( = ?auto_345588 ?auto_345589 ) ) ( ON ?auto_345587 ?auto_345588 ) ( ON ?auto_345586 ?auto_345587 ) ( ON ?auto_345585 ?auto_345586 ) ( ON ?auto_345584 ?auto_345585 ) ( ON ?auto_345583 ?auto_345584 ) ( ON ?auto_345582 ?auto_345583 ) ( ON ?auto_345581 ?auto_345582 ) ( ON ?auto_345580 ?auto_345581 ) ( CLEAR ?auto_345578 ) ( ON ?auto_345579 ?auto_345580 ) ( CLEAR ?auto_345579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_345578 ?auto_345579 )
      ( MAKE-11PILE ?auto_345578 ?auto_345579 ?auto_345580 ?auto_345581 ?auto_345582 ?auto_345583 ?auto_345584 ?auto_345585 ?auto_345586 ?auto_345587 ?auto_345588 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_345601 - BLOCK
      ?auto_345602 - BLOCK
      ?auto_345603 - BLOCK
      ?auto_345604 - BLOCK
      ?auto_345605 - BLOCK
      ?auto_345606 - BLOCK
      ?auto_345607 - BLOCK
      ?auto_345608 - BLOCK
      ?auto_345609 - BLOCK
      ?auto_345610 - BLOCK
      ?auto_345611 - BLOCK
    )
    :vars
    (
      ?auto_345612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345611 ?auto_345612 ) ( not ( = ?auto_345601 ?auto_345602 ) ) ( not ( = ?auto_345601 ?auto_345603 ) ) ( not ( = ?auto_345601 ?auto_345604 ) ) ( not ( = ?auto_345601 ?auto_345605 ) ) ( not ( = ?auto_345601 ?auto_345606 ) ) ( not ( = ?auto_345601 ?auto_345607 ) ) ( not ( = ?auto_345601 ?auto_345608 ) ) ( not ( = ?auto_345601 ?auto_345609 ) ) ( not ( = ?auto_345601 ?auto_345610 ) ) ( not ( = ?auto_345601 ?auto_345611 ) ) ( not ( = ?auto_345601 ?auto_345612 ) ) ( not ( = ?auto_345602 ?auto_345603 ) ) ( not ( = ?auto_345602 ?auto_345604 ) ) ( not ( = ?auto_345602 ?auto_345605 ) ) ( not ( = ?auto_345602 ?auto_345606 ) ) ( not ( = ?auto_345602 ?auto_345607 ) ) ( not ( = ?auto_345602 ?auto_345608 ) ) ( not ( = ?auto_345602 ?auto_345609 ) ) ( not ( = ?auto_345602 ?auto_345610 ) ) ( not ( = ?auto_345602 ?auto_345611 ) ) ( not ( = ?auto_345602 ?auto_345612 ) ) ( not ( = ?auto_345603 ?auto_345604 ) ) ( not ( = ?auto_345603 ?auto_345605 ) ) ( not ( = ?auto_345603 ?auto_345606 ) ) ( not ( = ?auto_345603 ?auto_345607 ) ) ( not ( = ?auto_345603 ?auto_345608 ) ) ( not ( = ?auto_345603 ?auto_345609 ) ) ( not ( = ?auto_345603 ?auto_345610 ) ) ( not ( = ?auto_345603 ?auto_345611 ) ) ( not ( = ?auto_345603 ?auto_345612 ) ) ( not ( = ?auto_345604 ?auto_345605 ) ) ( not ( = ?auto_345604 ?auto_345606 ) ) ( not ( = ?auto_345604 ?auto_345607 ) ) ( not ( = ?auto_345604 ?auto_345608 ) ) ( not ( = ?auto_345604 ?auto_345609 ) ) ( not ( = ?auto_345604 ?auto_345610 ) ) ( not ( = ?auto_345604 ?auto_345611 ) ) ( not ( = ?auto_345604 ?auto_345612 ) ) ( not ( = ?auto_345605 ?auto_345606 ) ) ( not ( = ?auto_345605 ?auto_345607 ) ) ( not ( = ?auto_345605 ?auto_345608 ) ) ( not ( = ?auto_345605 ?auto_345609 ) ) ( not ( = ?auto_345605 ?auto_345610 ) ) ( not ( = ?auto_345605 ?auto_345611 ) ) ( not ( = ?auto_345605 ?auto_345612 ) ) ( not ( = ?auto_345606 ?auto_345607 ) ) ( not ( = ?auto_345606 ?auto_345608 ) ) ( not ( = ?auto_345606 ?auto_345609 ) ) ( not ( = ?auto_345606 ?auto_345610 ) ) ( not ( = ?auto_345606 ?auto_345611 ) ) ( not ( = ?auto_345606 ?auto_345612 ) ) ( not ( = ?auto_345607 ?auto_345608 ) ) ( not ( = ?auto_345607 ?auto_345609 ) ) ( not ( = ?auto_345607 ?auto_345610 ) ) ( not ( = ?auto_345607 ?auto_345611 ) ) ( not ( = ?auto_345607 ?auto_345612 ) ) ( not ( = ?auto_345608 ?auto_345609 ) ) ( not ( = ?auto_345608 ?auto_345610 ) ) ( not ( = ?auto_345608 ?auto_345611 ) ) ( not ( = ?auto_345608 ?auto_345612 ) ) ( not ( = ?auto_345609 ?auto_345610 ) ) ( not ( = ?auto_345609 ?auto_345611 ) ) ( not ( = ?auto_345609 ?auto_345612 ) ) ( not ( = ?auto_345610 ?auto_345611 ) ) ( not ( = ?auto_345610 ?auto_345612 ) ) ( not ( = ?auto_345611 ?auto_345612 ) ) ( ON ?auto_345610 ?auto_345611 ) ( ON ?auto_345609 ?auto_345610 ) ( ON ?auto_345608 ?auto_345609 ) ( ON ?auto_345607 ?auto_345608 ) ( ON ?auto_345606 ?auto_345607 ) ( ON ?auto_345605 ?auto_345606 ) ( ON ?auto_345604 ?auto_345605 ) ( ON ?auto_345603 ?auto_345604 ) ( ON ?auto_345602 ?auto_345603 ) ( ON ?auto_345601 ?auto_345602 ) ( CLEAR ?auto_345601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_345601 )
      ( MAKE-11PILE ?auto_345601 ?auto_345602 ?auto_345603 ?auto_345604 ?auto_345605 ?auto_345606 ?auto_345607 ?auto_345608 ?auto_345609 ?auto_345610 ?auto_345611 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_345624 - BLOCK
      ?auto_345625 - BLOCK
      ?auto_345626 - BLOCK
      ?auto_345627 - BLOCK
      ?auto_345628 - BLOCK
      ?auto_345629 - BLOCK
      ?auto_345630 - BLOCK
      ?auto_345631 - BLOCK
      ?auto_345632 - BLOCK
      ?auto_345633 - BLOCK
      ?auto_345634 - BLOCK
    )
    :vars
    (
      ?auto_345635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345634 ?auto_345635 ) ( not ( = ?auto_345624 ?auto_345625 ) ) ( not ( = ?auto_345624 ?auto_345626 ) ) ( not ( = ?auto_345624 ?auto_345627 ) ) ( not ( = ?auto_345624 ?auto_345628 ) ) ( not ( = ?auto_345624 ?auto_345629 ) ) ( not ( = ?auto_345624 ?auto_345630 ) ) ( not ( = ?auto_345624 ?auto_345631 ) ) ( not ( = ?auto_345624 ?auto_345632 ) ) ( not ( = ?auto_345624 ?auto_345633 ) ) ( not ( = ?auto_345624 ?auto_345634 ) ) ( not ( = ?auto_345624 ?auto_345635 ) ) ( not ( = ?auto_345625 ?auto_345626 ) ) ( not ( = ?auto_345625 ?auto_345627 ) ) ( not ( = ?auto_345625 ?auto_345628 ) ) ( not ( = ?auto_345625 ?auto_345629 ) ) ( not ( = ?auto_345625 ?auto_345630 ) ) ( not ( = ?auto_345625 ?auto_345631 ) ) ( not ( = ?auto_345625 ?auto_345632 ) ) ( not ( = ?auto_345625 ?auto_345633 ) ) ( not ( = ?auto_345625 ?auto_345634 ) ) ( not ( = ?auto_345625 ?auto_345635 ) ) ( not ( = ?auto_345626 ?auto_345627 ) ) ( not ( = ?auto_345626 ?auto_345628 ) ) ( not ( = ?auto_345626 ?auto_345629 ) ) ( not ( = ?auto_345626 ?auto_345630 ) ) ( not ( = ?auto_345626 ?auto_345631 ) ) ( not ( = ?auto_345626 ?auto_345632 ) ) ( not ( = ?auto_345626 ?auto_345633 ) ) ( not ( = ?auto_345626 ?auto_345634 ) ) ( not ( = ?auto_345626 ?auto_345635 ) ) ( not ( = ?auto_345627 ?auto_345628 ) ) ( not ( = ?auto_345627 ?auto_345629 ) ) ( not ( = ?auto_345627 ?auto_345630 ) ) ( not ( = ?auto_345627 ?auto_345631 ) ) ( not ( = ?auto_345627 ?auto_345632 ) ) ( not ( = ?auto_345627 ?auto_345633 ) ) ( not ( = ?auto_345627 ?auto_345634 ) ) ( not ( = ?auto_345627 ?auto_345635 ) ) ( not ( = ?auto_345628 ?auto_345629 ) ) ( not ( = ?auto_345628 ?auto_345630 ) ) ( not ( = ?auto_345628 ?auto_345631 ) ) ( not ( = ?auto_345628 ?auto_345632 ) ) ( not ( = ?auto_345628 ?auto_345633 ) ) ( not ( = ?auto_345628 ?auto_345634 ) ) ( not ( = ?auto_345628 ?auto_345635 ) ) ( not ( = ?auto_345629 ?auto_345630 ) ) ( not ( = ?auto_345629 ?auto_345631 ) ) ( not ( = ?auto_345629 ?auto_345632 ) ) ( not ( = ?auto_345629 ?auto_345633 ) ) ( not ( = ?auto_345629 ?auto_345634 ) ) ( not ( = ?auto_345629 ?auto_345635 ) ) ( not ( = ?auto_345630 ?auto_345631 ) ) ( not ( = ?auto_345630 ?auto_345632 ) ) ( not ( = ?auto_345630 ?auto_345633 ) ) ( not ( = ?auto_345630 ?auto_345634 ) ) ( not ( = ?auto_345630 ?auto_345635 ) ) ( not ( = ?auto_345631 ?auto_345632 ) ) ( not ( = ?auto_345631 ?auto_345633 ) ) ( not ( = ?auto_345631 ?auto_345634 ) ) ( not ( = ?auto_345631 ?auto_345635 ) ) ( not ( = ?auto_345632 ?auto_345633 ) ) ( not ( = ?auto_345632 ?auto_345634 ) ) ( not ( = ?auto_345632 ?auto_345635 ) ) ( not ( = ?auto_345633 ?auto_345634 ) ) ( not ( = ?auto_345633 ?auto_345635 ) ) ( not ( = ?auto_345634 ?auto_345635 ) ) ( ON ?auto_345633 ?auto_345634 ) ( ON ?auto_345632 ?auto_345633 ) ( ON ?auto_345631 ?auto_345632 ) ( ON ?auto_345630 ?auto_345631 ) ( ON ?auto_345629 ?auto_345630 ) ( ON ?auto_345628 ?auto_345629 ) ( ON ?auto_345627 ?auto_345628 ) ( ON ?auto_345626 ?auto_345627 ) ( ON ?auto_345625 ?auto_345626 ) ( ON ?auto_345624 ?auto_345625 ) ( CLEAR ?auto_345624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_345624 )
      ( MAKE-11PILE ?auto_345624 ?auto_345625 ?auto_345626 ?auto_345627 ?auto_345628 ?auto_345629 ?auto_345630 ?auto_345631 ?auto_345632 ?auto_345633 ?auto_345634 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_345648 - BLOCK
      ?auto_345649 - BLOCK
      ?auto_345650 - BLOCK
      ?auto_345651 - BLOCK
      ?auto_345652 - BLOCK
      ?auto_345653 - BLOCK
      ?auto_345654 - BLOCK
      ?auto_345655 - BLOCK
      ?auto_345656 - BLOCK
      ?auto_345657 - BLOCK
      ?auto_345658 - BLOCK
      ?auto_345659 - BLOCK
    )
    :vars
    (
      ?auto_345660 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_345658 ) ( ON ?auto_345659 ?auto_345660 ) ( CLEAR ?auto_345659 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_345648 ) ( ON ?auto_345649 ?auto_345648 ) ( ON ?auto_345650 ?auto_345649 ) ( ON ?auto_345651 ?auto_345650 ) ( ON ?auto_345652 ?auto_345651 ) ( ON ?auto_345653 ?auto_345652 ) ( ON ?auto_345654 ?auto_345653 ) ( ON ?auto_345655 ?auto_345654 ) ( ON ?auto_345656 ?auto_345655 ) ( ON ?auto_345657 ?auto_345656 ) ( ON ?auto_345658 ?auto_345657 ) ( not ( = ?auto_345648 ?auto_345649 ) ) ( not ( = ?auto_345648 ?auto_345650 ) ) ( not ( = ?auto_345648 ?auto_345651 ) ) ( not ( = ?auto_345648 ?auto_345652 ) ) ( not ( = ?auto_345648 ?auto_345653 ) ) ( not ( = ?auto_345648 ?auto_345654 ) ) ( not ( = ?auto_345648 ?auto_345655 ) ) ( not ( = ?auto_345648 ?auto_345656 ) ) ( not ( = ?auto_345648 ?auto_345657 ) ) ( not ( = ?auto_345648 ?auto_345658 ) ) ( not ( = ?auto_345648 ?auto_345659 ) ) ( not ( = ?auto_345648 ?auto_345660 ) ) ( not ( = ?auto_345649 ?auto_345650 ) ) ( not ( = ?auto_345649 ?auto_345651 ) ) ( not ( = ?auto_345649 ?auto_345652 ) ) ( not ( = ?auto_345649 ?auto_345653 ) ) ( not ( = ?auto_345649 ?auto_345654 ) ) ( not ( = ?auto_345649 ?auto_345655 ) ) ( not ( = ?auto_345649 ?auto_345656 ) ) ( not ( = ?auto_345649 ?auto_345657 ) ) ( not ( = ?auto_345649 ?auto_345658 ) ) ( not ( = ?auto_345649 ?auto_345659 ) ) ( not ( = ?auto_345649 ?auto_345660 ) ) ( not ( = ?auto_345650 ?auto_345651 ) ) ( not ( = ?auto_345650 ?auto_345652 ) ) ( not ( = ?auto_345650 ?auto_345653 ) ) ( not ( = ?auto_345650 ?auto_345654 ) ) ( not ( = ?auto_345650 ?auto_345655 ) ) ( not ( = ?auto_345650 ?auto_345656 ) ) ( not ( = ?auto_345650 ?auto_345657 ) ) ( not ( = ?auto_345650 ?auto_345658 ) ) ( not ( = ?auto_345650 ?auto_345659 ) ) ( not ( = ?auto_345650 ?auto_345660 ) ) ( not ( = ?auto_345651 ?auto_345652 ) ) ( not ( = ?auto_345651 ?auto_345653 ) ) ( not ( = ?auto_345651 ?auto_345654 ) ) ( not ( = ?auto_345651 ?auto_345655 ) ) ( not ( = ?auto_345651 ?auto_345656 ) ) ( not ( = ?auto_345651 ?auto_345657 ) ) ( not ( = ?auto_345651 ?auto_345658 ) ) ( not ( = ?auto_345651 ?auto_345659 ) ) ( not ( = ?auto_345651 ?auto_345660 ) ) ( not ( = ?auto_345652 ?auto_345653 ) ) ( not ( = ?auto_345652 ?auto_345654 ) ) ( not ( = ?auto_345652 ?auto_345655 ) ) ( not ( = ?auto_345652 ?auto_345656 ) ) ( not ( = ?auto_345652 ?auto_345657 ) ) ( not ( = ?auto_345652 ?auto_345658 ) ) ( not ( = ?auto_345652 ?auto_345659 ) ) ( not ( = ?auto_345652 ?auto_345660 ) ) ( not ( = ?auto_345653 ?auto_345654 ) ) ( not ( = ?auto_345653 ?auto_345655 ) ) ( not ( = ?auto_345653 ?auto_345656 ) ) ( not ( = ?auto_345653 ?auto_345657 ) ) ( not ( = ?auto_345653 ?auto_345658 ) ) ( not ( = ?auto_345653 ?auto_345659 ) ) ( not ( = ?auto_345653 ?auto_345660 ) ) ( not ( = ?auto_345654 ?auto_345655 ) ) ( not ( = ?auto_345654 ?auto_345656 ) ) ( not ( = ?auto_345654 ?auto_345657 ) ) ( not ( = ?auto_345654 ?auto_345658 ) ) ( not ( = ?auto_345654 ?auto_345659 ) ) ( not ( = ?auto_345654 ?auto_345660 ) ) ( not ( = ?auto_345655 ?auto_345656 ) ) ( not ( = ?auto_345655 ?auto_345657 ) ) ( not ( = ?auto_345655 ?auto_345658 ) ) ( not ( = ?auto_345655 ?auto_345659 ) ) ( not ( = ?auto_345655 ?auto_345660 ) ) ( not ( = ?auto_345656 ?auto_345657 ) ) ( not ( = ?auto_345656 ?auto_345658 ) ) ( not ( = ?auto_345656 ?auto_345659 ) ) ( not ( = ?auto_345656 ?auto_345660 ) ) ( not ( = ?auto_345657 ?auto_345658 ) ) ( not ( = ?auto_345657 ?auto_345659 ) ) ( not ( = ?auto_345657 ?auto_345660 ) ) ( not ( = ?auto_345658 ?auto_345659 ) ) ( not ( = ?auto_345658 ?auto_345660 ) ) ( not ( = ?auto_345659 ?auto_345660 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_345659 ?auto_345660 )
      ( !STACK ?auto_345659 ?auto_345658 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_345673 - BLOCK
      ?auto_345674 - BLOCK
      ?auto_345675 - BLOCK
      ?auto_345676 - BLOCK
      ?auto_345677 - BLOCK
      ?auto_345678 - BLOCK
      ?auto_345679 - BLOCK
      ?auto_345680 - BLOCK
      ?auto_345681 - BLOCK
      ?auto_345682 - BLOCK
      ?auto_345683 - BLOCK
      ?auto_345684 - BLOCK
    )
    :vars
    (
      ?auto_345685 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_345683 ) ( ON ?auto_345684 ?auto_345685 ) ( CLEAR ?auto_345684 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_345673 ) ( ON ?auto_345674 ?auto_345673 ) ( ON ?auto_345675 ?auto_345674 ) ( ON ?auto_345676 ?auto_345675 ) ( ON ?auto_345677 ?auto_345676 ) ( ON ?auto_345678 ?auto_345677 ) ( ON ?auto_345679 ?auto_345678 ) ( ON ?auto_345680 ?auto_345679 ) ( ON ?auto_345681 ?auto_345680 ) ( ON ?auto_345682 ?auto_345681 ) ( ON ?auto_345683 ?auto_345682 ) ( not ( = ?auto_345673 ?auto_345674 ) ) ( not ( = ?auto_345673 ?auto_345675 ) ) ( not ( = ?auto_345673 ?auto_345676 ) ) ( not ( = ?auto_345673 ?auto_345677 ) ) ( not ( = ?auto_345673 ?auto_345678 ) ) ( not ( = ?auto_345673 ?auto_345679 ) ) ( not ( = ?auto_345673 ?auto_345680 ) ) ( not ( = ?auto_345673 ?auto_345681 ) ) ( not ( = ?auto_345673 ?auto_345682 ) ) ( not ( = ?auto_345673 ?auto_345683 ) ) ( not ( = ?auto_345673 ?auto_345684 ) ) ( not ( = ?auto_345673 ?auto_345685 ) ) ( not ( = ?auto_345674 ?auto_345675 ) ) ( not ( = ?auto_345674 ?auto_345676 ) ) ( not ( = ?auto_345674 ?auto_345677 ) ) ( not ( = ?auto_345674 ?auto_345678 ) ) ( not ( = ?auto_345674 ?auto_345679 ) ) ( not ( = ?auto_345674 ?auto_345680 ) ) ( not ( = ?auto_345674 ?auto_345681 ) ) ( not ( = ?auto_345674 ?auto_345682 ) ) ( not ( = ?auto_345674 ?auto_345683 ) ) ( not ( = ?auto_345674 ?auto_345684 ) ) ( not ( = ?auto_345674 ?auto_345685 ) ) ( not ( = ?auto_345675 ?auto_345676 ) ) ( not ( = ?auto_345675 ?auto_345677 ) ) ( not ( = ?auto_345675 ?auto_345678 ) ) ( not ( = ?auto_345675 ?auto_345679 ) ) ( not ( = ?auto_345675 ?auto_345680 ) ) ( not ( = ?auto_345675 ?auto_345681 ) ) ( not ( = ?auto_345675 ?auto_345682 ) ) ( not ( = ?auto_345675 ?auto_345683 ) ) ( not ( = ?auto_345675 ?auto_345684 ) ) ( not ( = ?auto_345675 ?auto_345685 ) ) ( not ( = ?auto_345676 ?auto_345677 ) ) ( not ( = ?auto_345676 ?auto_345678 ) ) ( not ( = ?auto_345676 ?auto_345679 ) ) ( not ( = ?auto_345676 ?auto_345680 ) ) ( not ( = ?auto_345676 ?auto_345681 ) ) ( not ( = ?auto_345676 ?auto_345682 ) ) ( not ( = ?auto_345676 ?auto_345683 ) ) ( not ( = ?auto_345676 ?auto_345684 ) ) ( not ( = ?auto_345676 ?auto_345685 ) ) ( not ( = ?auto_345677 ?auto_345678 ) ) ( not ( = ?auto_345677 ?auto_345679 ) ) ( not ( = ?auto_345677 ?auto_345680 ) ) ( not ( = ?auto_345677 ?auto_345681 ) ) ( not ( = ?auto_345677 ?auto_345682 ) ) ( not ( = ?auto_345677 ?auto_345683 ) ) ( not ( = ?auto_345677 ?auto_345684 ) ) ( not ( = ?auto_345677 ?auto_345685 ) ) ( not ( = ?auto_345678 ?auto_345679 ) ) ( not ( = ?auto_345678 ?auto_345680 ) ) ( not ( = ?auto_345678 ?auto_345681 ) ) ( not ( = ?auto_345678 ?auto_345682 ) ) ( not ( = ?auto_345678 ?auto_345683 ) ) ( not ( = ?auto_345678 ?auto_345684 ) ) ( not ( = ?auto_345678 ?auto_345685 ) ) ( not ( = ?auto_345679 ?auto_345680 ) ) ( not ( = ?auto_345679 ?auto_345681 ) ) ( not ( = ?auto_345679 ?auto_345682 ) ) ( not ( = ?auto_345679 ?auto_345683 ) ) ( not ( = ?auto_345679 ?auto_345684 ) ) ( not ( = ?auto_345679 ?auto_345685 ) ) ( not ( = ?auto_345680 ?auto_345681 ) ) ( not ( = ?auto_345680 ?auto_345682 ) ) ( not ( = ?auto_345680 ?auto_345683 ) ) ( not ( = ?auto_345680 ?auto_345684 ) ) ( not ( = ?auto_345680 ?auto_345685 ) ) ( not ( = ?auto_345681 ?auto_345682 ) ) ( not ( = ?auto_345681 ?auto_345683 ) ) ( not ( = ?auto_345681 ?auto_345684 ) ) ( not ( = ?auto_345681 ?auto_345685 ) ) ( not ( = ?auto_345682 ?auto_345683 ) ) ( not ( = ?auto_345682 ?auto_345684 ) ) ( not ( = ?auto_345682 ?auto_345685 ) ) ( not ( = ?auto_345683 ?auto_345684 ) ) ( not ( = ?auto_345683 ?auto_345685 ) ) ( not ( = ?auto_345684 ?auto_345685 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_345684 ?auto_345685 )
      ( !STACK ?auto_345684 ?auto_345683 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_345698 - BLOCK
      ?auto_345699 - BLOCK
      ?auto_345700 - BLOCK
      ?auto_345701 - BLOCK
      ?auto_345702 - BLOCK
      ?auto_345703 - BLOCK
      ?auto_345704 - BLOCK
      ?auto_345705 - BLOCK
      ?auto_345706 - BLOCK
      ?auto_345707 - BLOCK
      ?auto_345708 - BLOCK
      ?auto_345709 - BLOCK
    )
    :vars
    (
      ?auto_345710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345709 ?auto_345710 ) ( ON-TABLE ?auto_345698 ) ( ON ?auto_345699 ?auto_345698 ) ( ON ?auto_345700 ?auto_345699 ) ( ON ?auto_345701 ?auto_345700 ) ( ON ?auto_345702 ?auto_345701 ) ( ON ?auto_345703 ?auto_345702 ) ( ON ?auto_345704 ?auto_345703 ) ( ON ?auto_345705 ?auto_345704 ) ( ON ?auto_345706 ?auto_345705 ) ( ON ?auto_345707 ?auto_345706 ) ( not ( = ?auto_345698 ?auto_345699 ) ) ( not ( = ?auto_345698 ?auto_345700 ) ) ( not ( = ?auto_345698 ?auto_345701 ) ) ( not ( = ?auto_345698 ?auto_345702 ) ) ( not ( = ?auto_345698 ?auto_345703 ) ) ( not ( = ?auto_345698 ?auto_345704 ) ) ( not ( = ?auto_345698 ?auto_345705 ) ) ( not ( = ?auto_345698 ?auto_345706 ) ) ( not ( = ?auto_345698 ?auto_345707 ) ) ( not ( = ?auto_345698 ?auto_345708 ) ) ( not ( = ?auto_345698 ?auto_345709 ) ) ( not ( = ?auto_345698 ?auto_345710 ) ) ( not ( = ?auto_345699 ?auto_345700 ) ) ( not ( = ?auto_345699 ?auto_345701 ) ) ( not ( = ?auto_345699 ?auto_345702 ) ) ( not ( = ?auto_345699 ?auto_345703 ) ) ( not ( = ?auto_345699 ?auto_345704 ) ) ( not ( = ?auto_345699 ?auto_345705 ) ) ( not ( = ?auto_345699 ?auto_345706 ) ) ( not ( = ?auto_345699 ?auto_345707 ) ) ( not ( = ?auto_345699 ?auto_345708 ) ) ( not ( = ?auto_345699 ?auto_345709 ) ) ( not ( = ?auto_345699 ?auto_345710 ) ) ( not ( = ?auto_345700 ?auto_345701 ) ) ( not ( = ?auto_345700 ?auto_345702 ) ) ( not ( = ?auto_345700 ?auto_345703 ) ) ( not ( = ?auto_345700 ?auto_345704 ) ) ( not ( = ?auto_345700 ?auto_345705 ) ) ( not ( = ?auto_345700 ?auto_345706 ) ) ( not ( = ?auto_345700 ?auto_345707 ) ) ( not ( = ?auto_345700 ?auto_345708 ) ) ( not ( = ?auto_345700 ?auto_345709 ) ) ( not ( = ?auto_345700 ?auto_345710 ) ) ( not ( = ?auto_345701 ?auto_345702 ) ) ( not ( = ?auto_345701 ?auto_345703 ) ) ( not ( = ?auto_345701 ?auto_345704 ) ) ( not ( = ?auto_345701 ?auto_345705 ) ) ( not ( = ?auto_345701 ?auto_345706 ) ) ( not ( = ?auto_345701 ?auto_345707 ) ) ( not ( = ?auto_345701 ?auto_345708 ) ) ( not ( = ?auto_345701 ?auto_345709 ) ) ( not ( = ?auto_345701 ?auto_345710 ) ) ( not ( = ?auto_345702 ?auto_345703 ) ) ( not ( = ?auto_345702 ?auto_345704 ) ) ( not ( = ?auto_345702 ?auto_345705 ) ) ( not ( = ?auto_345702 ?auto_345706 ) ) ( not ( = ?auto_345702 ?auto_345707 ) ) ( not ( = ?auto_345702 ?auto_345708 ) ) ( not ( = ?auto_345702 ?auto_345709 ) ) ( not ( = ?auto_345702 ?auto_345710 ) ) ( not ( = ?auto_345703 ?auto_345704 ) ) ( not ( = ?auto_345703 ?auto_345705 ) ) ( not ( = ?auto_345703 ?auto_345706 ) ) ( not ( = ?auto_345703 ?auto_345707 ) ) ( not ( = ?auto_345703 ?auto_345708 ) ) ( not ( = ?auto_345703 ?auto_345709 ) ) ( not ( = ?auto_345703 ?auto_345710 ) ) ( not ( = ?auto_345704 ?auto_345705 ) ) ( not ( = ?auto_345704 ?auto_345706 ) ) ( not ( = ?auto_345704 ?auto_345707 ) ) ( not ( = ?auto_345704 ?auto_345708 ) ) ( not ( = ?auto_345704 ?auto_345709 ) ) ( not ( = ?auto_345704 ?auto_345710 ) ) ( not ( = ?auto_345705 ?auto_345706 ) ) ( not ( = ?auto_345705 ?auto_345707 ) ) ( not ( = ?auto_345705 ?auto_345708 ) ) ( not ( = ?auto_345705 ?auto_345709 ) ) ( not ( = ?auto_345705 ?auto_345710 ) ) ( not ( = ?auto_345706 ?auto_345707 ) ) ( not ( = ?auto_345706 ?auto_345708 ) ) ( not ( = ?auto_345706 ?auto_345709 ) ) ( not ( = ?auto_345706 ?auto_345710 ) ) ( not ( = ?auto_345707 ?auto_345708 ) ) ( not ( = ?auto_345707 ?auto_345709 ) ) ( not ( = ?auto_345707 ?auto_345710 ) ) ( not ( = ?auto_345708 ?auto_345709 ) ) ( not ( = ?auto_345708 ?auto_345710 ) ) ( not ( = ?auto_345709 ?auto_345710 ) ) ( CLEAR ?auto_345707 ) ( ON ?auto_345708 ?auto_345709 ) ( CLEAR ?auto_345708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_345698 ?auto_345699 ?auto_345700 ?auto_345701 ?auto_345702 ?auto_345703 ?auto_345704 ?auto_345705 ?auto_345706 ?auto_345707 ?auto_345708 )
      ( MAKE-12PILE ?auto_345698 ?auto_345699 ?auto_345700 ?auto_345701 ?auto_345702 ?auto_345703 ?auto_345704 ?auto_345705 ?auto_345706 ?auto_345707 ?auto_345708 ?auto_345709 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_345723 - BLOCK
      ?auto_345724 - BLOCK
      ?auto_345725 - BLOCK
      ?auto_345726 - BLOCK
      ?auto_345727 - BLOCK
      ?auto_345728 - BLOCK
      ?auto_345729 - BLOCK
      ?auto_345730 - BLOCK
      ?auto_345731 - BLOCK
      ?auto_345732 - BLOCK
      ?auto_345733 - BLOCK
      ?auto_345734 - BLOCK
    )
    :vars
    (
      ?auto_345735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345734 ?auto_345735 ) ( ON-TABLE ?auto_345723 ) ( ON ?auto_345724 ?auto_345723 ) ( ON ?auto_345725 ?auto_345724 ) ( ON ?auto_345726 ?auto_345725 ) ( ON ?auto_345727 ?auto_345726 ) ( ON ?auto_345728 ?auto_345727 ) ( ON ?auto_345729 ?auto_345728 ) ( ON ?auto_345730 ?auto_345729 ) ( ON ?auto_345731 ?auto_345730 ) ( ON ?auto_345732 ?auto_345731 ) ( not ( = ?auto_345723 ?auto_345724 ) ) ( not ( = ?auto_345723 ?auto_345725 ) ) ( not ( = ?auto_345723 ?auto_345726 ) ) ( not ( = ?auto_345723 ?auto_345727 ) ) ( not ( = ?auto_345723 ?auto_345728 ) ) ( not ( = ?auto_345723 ?auto_345729 ) ) ( not ( = ?auto_345723 ?auto_345730 ) ) ( not ( = ?auto_345723 ?auto_345731 ) ) ( not ( = ?auto_345723 ?auto_345732 ) ) ( not ( = ?auto_345723 ?auto_345733 ) ) ( not ( = ?auto_345723 ?auto_345734 ) ) ( not ( = ?auto_345723 ?auto_345735 ) ) ( not ( = ?auto_345724 ?auto_345725 ) ) ( not ( = ?auto_345724 ?auto_345726 ) ) ( not ( = ?auto_345724 ?auto_345727 ) ) ( not ( = ?auto_345724 ?auto_345728 ) ) ( not ( = ?auto_345724 ?auto_345729 ) ) ( not ( = ?auto_345724 ?auto_345730 ) ) ( not ( = ?auto_345724 ?auto_345731 ) ) ( not ( = ?auto_345724 ?auto_345732 ) ) ( not ( = ?auto_345724 ?auto_345733 ) ) ( not ( = ?auto_345724 ?auto_345734 ) ) ( not ( = ?auto_345724 ?auto_345735 ) ) ( not ( = ?auto_345725 ?auto_345726 ) ) ( not ( = ?auto_345725 ?auto_345727 ) ) ( not ( = ?auto_345725 ?auto_345728 ) ) ( not ( = ?auto_345725 ?auto_345729 ) ) ( not ( = ?auto_345725 ?auto_345730 ) ) ( not ( = ?auto_345725 ?auto_345731 ) ) ( not ( = ?auto_345725 ?auto_345732 ) ) ( not ( = ?auto_345725 ?auto_345733 ) ) ( not ( = ?auto_345725 ?auto_345734 ) ) ( not ( = ?auto_345725 ?auto_345735 ) ) ( not ( = ?auto_345726 ?auto_345727 ) ) ( not ( = ?auto_345726 ?auto_345728 ) ) ( not ( = ?auto_345726 ?auto_345729 ) ) ( not ( = ?auto_345726 ?auto_345730 ) ) ( not ( = ?auto_345726 ?auto_345731 ) ) ( not ( = ?auto_345726 ?auto_345732 ) ) ( not ( = ?auto_345726 ?auto_345733 ) ) ( not ( = ?auto_345726 ?auto_345734 ) ) ( not ( = ?auto_345726 ?auto_345735 ) ) ( not ( = ?auto_345727 ?auto_345728 ) ) ( not ( = ?auto_345727 ?auto_345729 ) ) ( not ( = ?auto_345727 ?auto_345730 ) ) ( not ( = ?auto_345727 ?auto_345731 ) ) ( not ( = ?auto_345727 ?auto_345732 ) ) ( not ( = ?auto_345727 ?auto_345733 ) ) ( not ( = ?auto_345727 ?auto_345734 ) ) ( not ( = ?auto_345727 ?auto_345735 ) ) ( not ( = ?auto_345728 ?auto_345729 ) ) ( not ( = ?auto_345728 ?auto_345730 ) ) ( not ( = ?auto_345728 ?auto_345731 ) ) ( not ( = ?auto_345728 ?auto_345732 ) ) ( not ( = ?auto_345728 ?auto_345733 ) ) ( not ( = ?auto_345728 ?auto_345734 ) ) ( not ( = ?auto_345728 ?auto_345735 ) ) ( not ( = ?auto_345729 ?auto_345730 ) ) ( not ( = ?auto_345729 ?auto_345731 ) ) ( not ( = ?auto_345729 ?auto_345732 ) ) ( not ( = ?auto_345729 ?auto_345733 ) ) ( not ( = ?auto_345729 ?auto_345734 ) ) ( not ( = ?auto_345729 ?auto_345735 ) ) ( not ( = ?auto_345730 ?auto_345731 ) ) ( not ( = ?auto_345730 ?auto_345732 ) ) ( not ( = ?auto_345730 ?auto_345733 ) ) ( not ( = ?auto_345730 ?auto_345734 ) ) ( not ( = ?auto_345730 ?auto_345735 ) ) ( not ( = ?auto_345731 ?auto_345732 ) ) ( not ( = ?auto_345731 ?auto_345733 ) ) ( not ( = ?auto_345731 ?auto_345734 ) ) ( not ( = ?auto_345731 ?auto_345735 ) ) ( not ( = ?auto_345732 ?auto_345733 ) ) ( not ( = ?auto_345732 ?auto_345734 ) ) ( not ( = ?auto_345732 ?auto_345735 ) ) ( not ( = ?auto_345733 ?auto_345734 ) ) ( not ( = ?auto_345733 ?auto_345735 ) ) ( not ( = ?auto_345734 ?auto_345735 ) ) ( CLEAR ?auto_345732 ) ( ON ?auto_345733 ?auto_345734 ) ( CLEAR ?auto_345733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_345723 ?auto_345724 ?auto_345725 ?auto_345726 ?auto_345727 ?auto_345728 ?auto_345729 ?auto_345730 ?auto_345731 ?auto_345732 ?auto_345733 )
      ( MAKE-12PILE ?auto_345723 ?auto_345724 ?auto_345725 ?auto_345726 ?auto_345727 ?auto_345728 ?auto_345729 ?auto_345730 ?auto_345731 ?auto_345732 ?auto_345733 ?auto_345734 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_345748 - BLOCK
      ?auto_345749 - BLOCK
      ?auto_345750 - BLOCK
      ?auto_345751 - BLOCK
      ?auto_345752 - BLOCK
      ?auto_345753 - BLOCK
      ?auto_345754 - BLOCK
      ?auto_345755 - BLOCK
      ?auto_345756 - BLOCK
      ?auto_345757 - BLOCK
      ?auto_345758 - BLOCK
      ?auto_345759 - BLOCK
    )
    :vars
    (
      ?auto_345760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345759 ?auto_345760 ) ( ON-TABLE ?auto_345748 ) ( ON ?auto_345749 ?auto_345748 ) ( ON ?auto_345750 ?auto_345749 ) ( ON ?auto_345751 ?auto_345750 ) ( ON ?auto_345752 ?auto_345751 ) ( ON ?auto_345753 ?auto_345752 ) ( ON ?auto_345754 ?auto_345753 ) ( ON ?auto_345755 ?auto_345754 ) ( ON ?auto_345756 ?auto_345755 ) ( not ( = ?auto_345748 ?auto_345749 ) ) ( not ( = ?auto_345748 ?auto_345750 ) ) ( not ( = ?auto_345748 ?auto_345751 ) ) ( not ( = ?auto_345748 ?auto_345752 ) ) ( not ( = ?auto_345748 ?auto_345753 ) ) ( not ( = ?auto_345748 ?auto_345754 ) ) ( not ( = ?auto_345748 ?auto_345755 ) ) ( not ( = ?auto_345748 ?auto_345756 ) ) ( not ( = ?auto_345748 ?auto_345757 ) ) ( not ( = ?auto_345748 ?auto_345758 ) ) ( not ( = ?auto_345748 ?auto_345759 ) ) ( not ( = ?auto_345748 ?auto_345760 ) ) ( not ( = ?auto_345749 ?auto_345750 ) ) ( not ( = ?auto_345749 ?auto_345751 ) ) ( not ( = ?auto_345749 ?auto_345752 ) ) ( not ( = ?auto_345749 ?auto_345753 ) ) ( not ( = ?auto_345749 ?auto_345754 ) ) ( not ( = ?auto_345749 ?auto_345755 ) ) ( not ( = ?auto_345749 ?auto_345756 ) ) ( not ( = ?auto_345749 ?auto_345757 ) ) ( not ( = ?auto_345749 ?auto_345758 ) ) ( not ( = ?auto_345749 ?auto_345759 ) ) ( not ( = ?auto_345749 ?auto_345760 ) ) ( not ( = ?auto_345750 ?auto_345751 ) ) ( not ( = ?auto_345750 ?auto_345752 ) ) ( not ( = ?auto_345750 ?auto_345753 ) ) ( not ( = ?auto_345750 ?auto_345754 ) ) ( not ( = ?auto_345750 ?auto_345755 ) ) ( not ( = ?auto_345750 ?auto_345756 ) ) ( not ( = ?auto_345750 ?auto_345757 ) ) ( not ( = ?auto_345750 ?auto_345758 ) ) ( not ( = ?auto_345750 ?auto_345759 ) ) ( not ( = ?auto_345750 ?auto_345760 ) ) ( not ( = ?auto_345751 ?auto_345752 ) ) ( not ( = ?auto_345751 ?auto_345753 ) ) ( not ( = ?auto_345751 ?auto_345754 ) ) ( not ( = ?auto_345751 ?auto_345755 ) ) ( not ( = ?auto_345751 ?auto_345756 ) ) ( not ( = ?auto_345751 ?auto_345757 ) ) ( not ( = ?auto_345751 ?auto_345758 ) ) ( not ( = ?auto_345751 ?auto_345759 ) ) ( not ( = ?auto_345751 ?auto_345760 ) ) ( not ( = ?auto_345752 ?auto_345753 ) ) ( not ( = ?auto_345752 ?auto_345754 ) ) ( not ( = ?auto_345752 ?auto_345755 ) ) ( not ( = ?auto_345752 ?auto_345756 ) ) ( not ( = ?auto_345752 ?auto_345757 ) ) ( not ( = ?auto_345752 ?auto_345758 ) ) ( not ( = ?auto_345752 ?auto_345759 ) ) ( not ( = ?auto_345752 ?auto_345760 ) ) ( not ( = ?auto_345753 ?auto_345754 ) ) ( not ( = ?auto_345753 ?auto_345755 ) ) ( not ( = ?auto_345753 ?auto_345756 ) ) ( not ( = ?auto_345753 ?auto_345757 ) ) ( not ( = ?auto_345753 ?auto_345758 ) ) ( not ( = ?auto_345753 ?auto_345759 ) ) ( not ( = ?auto_345753 ?auto_345760 ) ) ( not ( = ?auto_345754 ?auto_345755 ) ) ( not ( = ?auto_345754 ?auto_345756 ) ) ( not ( = ?auto_345754 ?auto_345757 ) ) ( not ( = ?auto_345754 ?auto_345758 ) ) ( not ( = ?auto_345754 ?auto_345759 ) ) ( not ( = ?auto_345754 ?auto_345760 ) ) ( not ( = ?auto_345755 ?auto_345756 ) ) ( not ( = ?auto_345755 ?auto_345757 ) ) ( not ( = ?auto_345755 ?auto_345758 ) ) ( not ( = ?auto_345755 ?auto_345759 ) ) ( not ( = ?auto_345755 ?auto_345760 ) ) ( not ( = ?auto_345756 ?auto_345757 ) ) ( not ( = ?auto_345756 ?auto_345758 ) ) ( not ( = ?auto_345756 ?auto_345759 ) ) ( not ( = ?auto_345756 ?auto_345760 ) ) ( not ( = ?auto_345757 ?auto_345758 ) ) ( not ( = ?auto_345757 ?auto_345759 ) ) ( not ( = ?auto_345757 ?auto_345760 ) ) ( not ( = ?auto_345758 ?auto_345759 ) ) ( not ( = ?auto_345758 ?auto_345760 ) ) ( not ( = ?auto_345759 ?auto_345760 ) ) ( ON ?auto_345758 ?auto_345759 ) ( CLEAR ?auto_345756 ) ( ON ?auto_345757 ?auto_345758 ) ( CLEAR ?auto_345757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_345748 ?auto_345749 ?auto_345750 ?auto_345751 ?auto_345752 ?auto_345753 ?auto_345754 ?auto_345755 ?auto_345756 ?auto_345757 )
      ( MAKE-12PILE ?auto_345748 ?auto_345749 ?auto_345750 ?auto_345751 ?auto_345752 ?auto_345753 ?auto_345754 ?auto_345755 ?auto_345756 ?auto_345757 ?auto_345758 ?auto_345759 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_345773 - BLOCK
      ?auto_345774 - BLOCK
      ?auto_345775 - BLOCK
      ?auto_345776 - BLOCK
      ?auto_345777 - BLOCK
      ?auto_345778 - BLOCK
      ?auto_345779 - BLOCK
      ?auto_345780 - BLOCK
      ?auto_345781 - BLOCK
      ?auto_345782 - BLOCK
      ?auto_345783 - BLOCK
      ?auto_345784 - BLOCK
    )
    :vars
    (
      ?auto_345785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345784 ?auto_345785 ) ( ON-TABLE ?auto_345773 ) ( ON ?auto_345774 ?auto_345773 ) ( ON ?auto_345775 ?auto_345774 ) ( ON ?auto_345776 ?auto_345775 ) ( ON ?auto_345777 ?auto_345776 ) ( ON ?auto_345778 ?auto_345777 ) ( ON ?auto_345779 ?auto_345778 ) ( ON ?auto_345780 ?auto_345779 ) ( ON ?auto_345781 ?auto_345780 ) ( not ( = ?auto_345773 ?auto_345774 ) ) ( not ( = ?auto_345773 ?auto_345775 ) ) ( not ( = ?auto_345773 ?auto_345776 ) ) ( not ( = ?auto_345773 ?auto_345777 ) ) ( not ( = ?auto_345773 ?auto_345778 ) ) ( not ( = ?auto_345773 ?auto_345779 ) ) ( not ( = ?auto_345773 ?auto_345780 ) ) ( not ( = ?auto_345773 ?auto_345781 ) ) ( not ( = ?auto_345773 ?auto_345782 ) ) ( not ( = ?auto_345773 ?auto_345783 ) ) ( not ( = ?auto_345773 ?auto_345784 ) ) ( not ( = ?auto_345773 ?auto_345785 ) ) ( not ( = ?auto_345774 ?auto_345775 ) ) ( not ( = ?auto_345774 ?auto_345776 ) ) ( not ( = ?auto_345774 ?auto_345777 ) ) ( not ( = ?auto_345774 ?auto_345778 ) ) ( not ( = ?auto_345774 ?auto_345779 ) ) ( not ( = ?auto_345774 ?auto_345780 ) ) ( not ( = ?auto_345774 ?auto_345781 ) ) ( not ( = ?auto_345774 ?auto_345782 ) ) ( not ( = ?auto_345774 ?auto_345783 ) ) ( not ( = ?auto_345774 ?auto_345784 ) ) ( not ( = ?auto_345774 ?auto_345785 ) ) ( not ( = ?auto_345775 ?auto_345776 ) ) ( not ( = ?auto_345775 ?auto_345777 ) ) ( not ( = ?auto_345775 ?auto_345778 ) ) ( not ( = ?auto_345775 ?auto_345779 ) ) ( not ( = ?auto_345775 ?auto_345780 ) ) ( not ( = ?auto_345775 ?auto_345781 ) ) ( not ( = ?auto_345775 ?auto_345782 ) ) ( not ( = ?auto_345775 ?auto_345783 ) ) ( not ( = ?auto_345775 ?auto_345784 ) ) ( not ( = ?auto_345775 ?auto_345785 ) ) ( not ( = ?auto_345776 ?auto_345777 ) ) ( not ( = ?auto_345776 ?auto_345778 ) ) ( not ( = ?auto_345776 ?auto_345779 ) ) ( not ( = ?auto_345776 ?auto_345780 ) ) ( not ( = ?auto_345776 ?auto_345781 ) ) ( not ( = ?auto_345776 ?auto_345782 ) ) ( not ( = ?auto_345776 ?auto_345783 ) ) ( not ( = ?auto_345776 ?auto_345784 ) ) ( not ( = ?auto_345776 ?auto_345785 ) ) ( not ( = ?auto_345777 ?auto_345778 ) ) ( not ( = ?auto_345777 ?auto_345779 ) ) ( not ( = ?auto_345777 ?auto_345780 ) ) ( not ( = ?auto_345777 ?auto_345781 ) ) ( not ( = ?auto_345777 ?auto_345782 ) ) ( not ( = ?auto_345777 ?auto_345783 ) ) ( not ( = ?auto_345777 ?auto_345784 ) ) ( not ( = ?auto_345777 ?auto_345785 ) ) ( not ( = ?auto_345778 ?auto_345779 ) ) ( not ( = ?auto_345778 ?auto_345780 ) ) ( not ( = ?auto_345778 ?auto_345781 ) ) ( not ( = ?auto_345778 ?auto_345782 ) ) ( not ( = ?auto_345778 ?auto_345783 ) ) ( not ( = ?auto_345778 ?auto_345784 ) ) ( not ( = ?auto_345778 ?auto_345785 ) ) ( not ( = ?auto_345779 ?auto_345780 ) ) ( not ( = ?auto_345779 ?auto_345781 ) ) ( not ( = ?auto_345779 ?auto_345782 ) ) ( not ( = ?auto_345779 ?auto_345783 ) ) ( not ( = ?auto_345779 ?auto_345784 ) ) ( not ( = ?auto_345779 ?auto_345785 ) ) ( not ( = ?auto_345780 ?auto_345781 ) ) ( not ( = ?auto_345780 ?auto_345782 ) ) ( not ( = ?auto_345780 ?auto_345783 ) ) ( not ( = ?auto_345780 ?auto_345784 ) ) ( not ( = ?auto_345780 ?auto_345785 ) ) ( not ( = ?auto_345781 ?auto_345782 ) ) ( not ( = ?auto_345781 ?auto_345783 ) ) ( not ( = ?auto_345781 ?auto_345784 ) ) ( not ( = ?auto_345781 ?auto_345785 ) ) ( not ( = ?auto_345782 ?auto_345783 ) ) ( not ( = ?auto_345782 ?auto_345784 ) ) ( not ( = ?auto_345782 ?auto_345785 ) ) ( not ( = ?auto_345783 ?auto_345784 ) ) ( not ( = ?auto_345783 ?auto_345785 ) ) ( not ( = ?auto_345784 ?auto_345785 ) ) ( ON ?auto_345783 ?auto_345784 ) ( CLEAR ?auto_345781 ) ( ON ?auto_345782 ?auto_345783 ) ( CLEAR ?auto_345782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_345773 ?auto_345774 ?auto_345775 ?auto_345776 ?auto_345777 ?auto_345778 ?auto_345779 ?auto_345780 ?auto_345781 ?auto_345782 )
      ( MAKE-12PILE ?auto_345773 ?auto_345774 ?auto_345775 ?auto_345776 ?auto_345777 ?auto_345778 ?auto_345779 ?auto_345780 ?auto_345781 ?auto_345782 ?auto_345783 ?auto_345784 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_345798 - BLOCK
      ?auto_345799 - BLOCK
      ?auto_345800 - BLOCK
      ?auto_345801 - BLOCK
      ?auto_345802 - BLOCK
      ?auto_345803 - BLOCK
      ?auto_345804 - BLOCK
      ?auto_345805 - BLOCK
      ?auto_345806 - BLOCK
      ?auto_345807 - BLOCK
      ?auto_345808 - BLOCK
      ?auto_345809 - BLOCK
    )
    :vars
    (
      ?auto_345810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345809 ?auto_345810 ) ( ON-TABLE ?auto_345798 ) ( ON ?auto_345799 ?auto_345798 ) ( ON ?auto_345800 ?auto_345799 ) ( ON ?auto_345801 ?auto_345800 ) ( ON ?auto_345802 ?auto_345801 ) ( ON ?auto_345803 ?auto_345802 ) ( ON ?auto_345804 ?auto_345803 ) ( ON ?auto_345805 ?auto_345804 ) ( not ( = ?auto_345798 ?auto_345799 ) ) ( not ( = ?auto_345798 ?auto_345800 ) ) ( not ( = ?auto_345798 ?auto_345801 ) ) ( not ( = ?auto_345798 ?auto_345802 ) ) ( not ( = ?auto_345798 ?auto_345803 ) ) ( not ( = ?auto_345798 ?auto_345804 ) ) ( not ( = ?auto_345798 ?auto_345805 ) ) ( not ( = ?auto_345798 ?auto_345806 ) ) ( not ( = ?auto_345798 ?auto_345807 ) ) ( not ( = ?auto_345798 ?auto_345808 ) ) ( not ( = ?auto_345798 ?auto_345809 ) ) ( not ( = ?auto_345798 ?auto_345810 ) ) ( not ( = ?auto_345799 ?auto_345800 ) ) ( not ( = ?auto_345799 ?auto_345801 ) ) ( not ( = ?auto_345799 ?auto_345802 ) ) ( not ( = ?auto_345799 ?auto_345803 ) ) ( not ( = ?auto_345799 ?auto_345804 ) ) ( not ( = ?auto_345799 ?auto_345805 ) ) ( not ( = ?auto_345799 ?auto_345806 ) ) ( not ( = ?auto_345799 ?auto_345807 ) ) ( not ( = ?auto_345799 ?auto_345808 ) ) ( not ( = ?auto_345799 ?auto_345809 ) ) ( not ( = ?auto_345799 ?auto_345810 ) ) ( not ( = ?auto_345800 ?auto_345801 ) ) ( not ( = ?auto_345800 ?auto_345802 ) ) ( not ( = ?auto_345800 ?auto_345803 ) ) ( not ( = ?auto_345800 ?auto_345804 ) ) ( not ( = ?auto_345800 ?auto_345805 ) ) ( not ( = ?auto_345800 ?auto_345806 ) ) ( not ( = ?auto_345800 ?auto_345807 ) ) ( not ( = ?auto_345800 ?auto_345808 ) ) ( not ( = ?auto_345800 ?auto_345809 ) ) ( not ( = ?auto_345800 ?auto_345810 ) ) ( not ( = ?auto_345801 ?auto_345802 ) ) ( not ( = ?auto_345801 ?auto_345803 ) ) ( not ( = ?auto_345801 ?auto_345804 ) ) ( not ( = ?auto_345801 ?auto_345805 ) ) ( not ( = ?auto_345801 ?auto_345806 ) ) ( not ( = ?auto_345801 ?auto_345807 ) ) ( not ( = ?auto_345801 ?auto_345808 ) ) ( not ( = ?auto_345801 ?auto_345809 ) ) ( not ( = ?auto_345801 ?auto_345810 ) ) ( not ( = ?auto_345802 ?auto_345803 ) ) ( not ( = ?auto_345802 ?auto_345804 ) ) ( not ( = ?auto_345802 ?auto_345805 ) ) ( not ( = ?auto_345802 ?auto_345806 ) ) ( not ( = ?auto_345802 ?auto_345807 ) ) ( not ( = ?auto_345802 ?auto_345808 ) ) ( not ( = ?auto_345802 ?auto_345809 ) ) ( not ( = ?auto_345802 ?auto_345810 ) ) ( not ( = ?auto_345803 ?auto_345804 ) ) ( not ( = ?auto_345803 ?auto_345805 ) ) ( not ( = ?auto_345803 ?auto_345806 ) ) ( not ( = ?auto_345803 ?auto_345807 ) ) ( not ( = ?auto_345803 ?auto_345808 ) ) ( not ( = ?auto_345803 ?auto_345809 ) ) ( not ( = ?auto_345803 ?auto_345810 ) ) ( not ( = ?auto_345804 ?auto_345805 ) ) ( not ( = ?auto_345804 ?auto_345806 ) ) ( not ( = ?auto_345804 ?auto_345807 ) ) ( not ( = ?auto_345804 ?auto_345808 ) ) ( not ( = ?auto_345804 ?auto_345809 ) ) ( not ( = ?auto_345804 ?auto_345810 ) ) ( not ( = ?auto_345805 ?auto_345806 ) ) ( not ( = ?auto_345805 ?auto_345807 ) ) ( not ( = ?auto_345805 ?auto_345808 ) ) ( not ( = ?auto_345805 ?auto_345809 ) ) ( not ( = ?auto_345805 ?auto_345810 ) ) ( not ( = ?auto_345806 ?auto_345807 ) ) ( not ( = ?auto_345806 ?auto_345808 ) ) ( not ( = ?auto_345806 ?auto_345809 ) ) ( not ( = ?auto_345806 ?auto_345810 ) ) ( not ( = ?auto_345807 ?auto_345808 ) ) ( not ( = ?auto_345807 ?auto_345809 ) ) ( not ( = ?auto_345807 ?auto_345810 ) ) ( not ( = ?auto_345808 ?auto_345809 ) ) ( not ( = ?auto_345808 ?auto_345810 ) ) ( not ( = ?auto_345809 ?auto_345810 ) ) ( ON ?auto_345808 ?auto_345809 ) ( ON ?auto_345807 ?auto_345808 ) ( CLEAR ?auto_345805 ) ( ON ?auto_345806 ?auto_345807 ) ( CLEAR ?auto_345806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_345798 ?auto_345799 ?auto_345800 ?auto_345801 ?auto_345802 ?auto_345803 ?auto_345804 ?auto_345805 ?auto_345806 )
      ( MAKE-12PILE ?auto_345798 ?auto_345799 ?auto_345800 ?auto_345801 ?auto_345802 ?auto_345803 ?auto_345804 ?auto_345805 ?auto_345806 ?auto_345807 ?auto_345808 ?auto_345809 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_345823 - BLOCK
      ?auto_345824 - BLOCK
      ?auto_345825 - BLOCK
      ?auto_345826 - BLOCK
      ?auto_345827 - BLOCK
      ?auto_345828 - BLOCK
      ?auto_345829 - BLOCK
      ?auto_345830 - BLOCK
      ?auto_345831 - BLOCK
      ?auto_345832 - BLOCK
      ?auto_345833 - BLOCK
      ?auto_345834 - BLOCK
    )
    :vars
    (
      ?auto_345835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345834 ?auto_345835 ) ( ON-TABLE ?auto_345823 ) ( ON ?auto_345824 ?auto_345823 ) ( ON ?auto_345825 ?auto_345824 ) ( ON ?auto_345826 ?auto_345825 ) ( ON ?auto_345827 ?auto_345826 ) ( ON ?auto_345828 ?auto_345827 ) ( ON ?auto_345829 ?auto_345828 ) ( ON ?auto_345830 ?auto_345829 ) ( not ( = ?auto_345823 ?auto_345824 ) ) ( not ( = ?auto_345823 ?auto_345825 ) ) ( not ( = ?auto_345823 ?auto_345826 ) ) ( not ( = ?auto_345823 ?auto_345827 ) ) ( not ( = ?auto_345823 ?auto_345828 ) ) ( not ( = ?auto_345823 ?auto_345829 ) ) ( not ( = ?auto_345823 ?auto_345830 ) ) ( not ( = ?auto_345823 ?auto_345831 ) ) ( not ( = ?auto_345823 ?auto_345832 ) ) ( not ( = ?auto_345823 ?auto_345833 ) ) ( not ( = ?auto_345823 ?auto_345834 ) ) ( not ( = ?auto_345823 ?auto_345835 ) ) ( not ( = ?auto_345824 ?auto_345825 ) ) ( not ( = ?auto_345824 ?auto_345826 ) ) ( not ( = ?auto_345824 ?auto_345827 ) ) ( not ( = ?auto_345824 ?auto_345828 ) ) ( not ( = ?auto_345824 ?auto_345829 ) ) ( not ( = ?auto_345824 ?auto_345830 ) ) ( not ( = ?auto_345824 ?auto_345831 ) ) ( not ( = ?auto_345824 ?auto_345832 ) ) ( not ( = ?auto_345824 ?auto_345833 ) ) ( not ( = ?auto_345824 ?auto_345834 ) ) ( not ( = ?auto_345824 ?auto_345835 ) ) ( not ( = ?auto_345825 ?auto_345826 ) ) ( not ( = ?auto_345825 ?auto_345827 ) ) ( not ( = ?auto_345825 ?auto_345828 ) ) ( not ( = ?auto_345825 ?auto_345829 ) ) ( not ( = ?auto_345825 ?auto_345830 ) ) ( not ( = ?auto_345825 ?auto_345831 ) ) ( not ( = ?auto_345825 ?auto_345832 ) ) ( not ( = ?auto_345825 ?auto_345833 ) ) ( not ( = ?auto_345825 ?auto_345834 ) ) ( not ( = ?auto_345825 ?auto_345835 ) ) ( not ( = ?auto_345826 ?auto_345827 ) ) ( not ( = ?auto_345826 ?auto_345828 ) ) ( not ( = ?auto_345826 ?auto_345829 ) ) ( not ( = ?auto_345826 ?auto_345830 ) ) ( not ( = ?auto_345826 ?auto_345831 ) ) ( not ( = ?auto_345826 ?auto_345832 ) ) ( not ( = ?auto_345826 ?auto_345833 ) ) ( not ( = ?auto_345826 ?auto_345834 ) ) ( not ( = ?auto_345826 ?auto_345835 ) ) ( not ( = ?auto_345827 ?auto_345828 ) ) ( not ( = ?auto_345827 ?auto_345829 ) ) ( not ( = ?auto_345827 ?auto_345830 ) ) ( not ( = ?auto_345827 ?auto_345831 ) ) ( not ( = ?auto_345827 ?auto_345832 ) ) ( not ( = ?auto_345827 ?auto_345833 ) ) ( not ( = ?auto_345827 ?auto_345834 ) ) ( not ( = ?auto_345827 ?auto_345835 ) ) ( not ( = ?auto_345828 ?auto_345829 ) ) ( not ( = ?auto_345828 ?auto_345830 ) ) ( not ( = ?auto_345828 ?auto_345831 ) ) ( not ( = ?auto_345828 ?auto_345832 ) ) ( not ( = ?auto_345828 ?auto_345833 ) ) ( not ( = ?auto_345828 ?auto_345834 ) ) ( not ( = ?auto_345828 ?auto_345835 ) ) ( not ( = ?auto_345829 ?auto_345830 ) ) ( not ( = ?auto_345829 ?auto_345831 ) ) ( not ( = ?auto_345829 ?auto_345832 ) ) ( not ( = ?auto_345829 ?auto_345833 ) ) ( not ( = ?auto_345829 ?auto_345834 ) ) ( not ( = ?auto_345829 ?auto_345835 ) ) ( not ( = ?auto_345830 ?auto_345831 ) ) ( not ( = ?auto_345830 ?auto_345832 ) ) ( not ( = ?auto_345830 ?auto_345833 ) ) ( not ( = ?auto_345830 ?auto_345834 ) ) ( not ( = ?auto_345830 ?auto_345835 ) ) ( not ( = ?auto_345831 ?auto_345832 ) ) ( not ( = ?auto_345831 ?auto_345833 ) ) ( not ( = ?auto_345831 ?auto_345834 ) ) ( not ( = ?auto_345831 ?auto_345835 ) ) ( not ( = ?auto_345832 ?auto_345833 ) ) ( not ( = ?auto_345832 ?auto_345834 ) ) ( not ( = ?auto_345832 ?auto_345835 ) ) ( not ( = ?auto_345833 ?auto_345834 ) ) ( not ( = ?auto_345833 ?auto_345835 ) ) ( not ( = ?auto_345834 ?auto_345835 ) ) ( ON ?auto_345833 ?auto_345834 ) ( ON ?auto_345832 ?auto_345833 ) ( CLEAR ?auto_345830 ) ( ON ?auto_345831 ?auto_345832 ) ( CLEAR ?auto_345831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_345823 ?auto_345824 ?auto_345825 ?auto_345826 ?auto_345827 ?auto_345828 ?auto_345829 ?auto_345830 ?auto_345831 )
      ( MAKE-12PILE ?auto_345823 ?auto_345824 ?auto_345825 ?auto_345826 ?auto_345827 ?auto_345828 ?auto_345829 ?auto_345830 ?auto_345831 ?auto_345832 ?auto_345833 ?auto_345834 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_345848 - BLOCK
      ?auto_345849 - BLOCK
      ?auto_345850 - BLOCK
      ?auto_345851 - BLOCK
      ?auto_345852 - BLOCK
      ?auto_345853 - BLOCK
      ?auto_345854 - BLOCK
      ?auto_345855 - BLOCK
      ?auto_345856 - BLOCK
      ?auto_345857 - BLOCK
      ?auto_345858 - BLOCK
      ?auto_345859 - BLOCK
    )
    :vars
    (
      ?auto_345860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345859 ?auto_345860 ) ( ON-TABLE ?auto_345848 ) ( ON ?auto_345849 ?auto_345848 ) ( ON ?auto_345850 ?auto_345849 ) ( ON ?auto_345851 ?auto_345850 ) ( ON ?auto_345852 ?auto_345851 ) ( ON ?auto_345853 ?auto_345852 ) ( ON ?auto_345854 ?auto_345853 ) ( not ( = ?auto_345848 ?auto_345849 ) ) ( not ( = ?auto_345848 ?auto_345850 ) ) ( not ( = ?auto_345848 ?auto_345851 ) ) ( not ( = ?auto_345848 ?auto_345852 ) ) ( not ( = ?auto_345848 ?auto_345853 ) ) ( not ( = ?auto_345848 ?auto_345854 ) ) ( not ( = ?auto_345848 ?auto_345855 ) ) ( not ( = ?auto_345848 ?auto_345856 ) ) ( not ( = ?auto_345848 ?auto_345857 ) ) ( not ( = ?auto_345848 ?auto_345858 ) ) ( not ( = ?auto_345848 ?auto_345859 ) ) ( not ( = ?auto_345848 ?auto_345860 ) ) ( not ( = ?auto_345849 ?auto_345850 ) ) ( not ( = ?auto_345849 ?auto_345851 ) ) ( not ( = ?auto_345849 ?auto_345852 ) ) ( not ( = ?auto_345849 ?auto_345853 ) ) ( not ( = ?auto_345849 ?auto_345854 ) ) ( not ( = ?auto_345849 ?auto_345855 ) ) ( not ( = ?auto_345849 ?auto_345856 ) ) ( not ( = ?auto_345849 ?auto_345857 ) ) ( not ( = ?auto_345849 ?auto_345858 ) ) ( not ( = ?auto_345849 ?auto_345859 ) ) ( not ( = ?auto_345849 ?auto_345860 ) ) ( not ( = ?auto_345850 ?auto_345851 ) ) ( not ( = ?auto_345850 ?auto_345852 ) ) ( not ( = ?auto_345850 ?auto_345853 ) ) ( not ( = ?auto_345850 ?auto_345854 ) ) ( not ( = ?auto_345850 ?auto_345855 ) ) ( not ( = ?auto_345850 ?auto_345856 ) ) ( not ( = ?auto_345850 ?auto_345857 ) ) ( not ( = ?auto_345850 ?auto_345858 ) ) ( not ( = ?auto_345850 ?auto_345859 ) ) ( not ( = ?auto_345850 ?auto_345860 ) ) ( not ( = ?auto_345851 ?auto_345852 ) ) ( not ( = ?auto_345851 ?auto_345853 ) ) ( not ( = ?auto_345851 ?auto_345854 ) ) ( not ( = ?auto_345851 ?auto_345855 ) ) ( not ( = ?auto_345851 ?auto_345856 ) ) ( not ( = ?auto_345851 ?auto_345857 ) ) ( not ( = ?auto_345851 ?auto_345858 ) ) ( not ( = ?auto_345851 ?auto_345859 ) ) ( not ( = ?auto_345851 ?auto_345860 ) ) ( not ( = ?auto_345852 ?auto_345853 ) ) ( not ( = ?auto_345852 ?auto_345854 ) ) ( not ( = ?auto_345852 ?auto_345855 ) ) ( not ( = ?auto_345852 ?auto_345856 ) ) ( not ( = ?auto_345852 ?auto_345857 ) ) ( not ( = ?auto_345852 ?auto_345858 ) ) ( not ( = ?auto_345852 ?auto_345859 ) ) ( not ( = ?auto_345852 ?auto_345860 ) ) ( not ( = ?auto_345853 ?auto_345854 ) ) ( not ( = ?auto_345853 ?auto_345855 ) ) ( not ( = ?auto_345853 ?auto_345856 ) ) ( not ( = ?auto_345853 ?auto_345857 ) ) ( not ( = ?auto_345853 ?auto_345858 ) ) ( not ( = ?auto_345853 ?auto_345859 ) ) ( not ( = ?auto_345853 ?auto_345860 ) ) ( not ( = ?auto_345854 ?auto_345855 ) ) ( not ( = ?auto_345854 ?auto_345856 ) ) ( not ( = ?auto_345854 ?auto_345857 ) ) ( not ( = ?auto_345854 ?auto_345858 ) ) ( not ( = ?auto_345854 ?auto_345859 ) ) ( not ( = ?auto_345854 ?auto_345860 ) ) ( not ( = ?auto_345855 ?auto_345856 ) ) ( not ( = ?auto_345855 ?auto_345857 ) ) ( not ( = ?auto_345855 ?auto_345858 ) ) ( not ( = ?auto_345855 ?auto_345859 ) ) ( not ( = ?auto_345855 ?auto_345860 ) ) ( not ( = ?auto_345856 ?auto_345857 ) ) ( not ( = ?auto_345856 ?auto_345858 ) ) ( not ( = ?auto_345856 ?auto_345859 ) ) ( not ( = ?auto_345856 ?auto_345860 ) ) ( not ( = ?auto_345857 ?auto_345858 ) ) ( not ( = ?auto_345857 ?auto_345859 ) ) ( not ( = ?auto_345857 ?auto_345860 ) ) ( not ( = ?auto_345858 ?auto_345859 ) ) ( not ( = ?auto_345858 ?auto_345860 ) ) ( not ( = ?auto_345859 ?auto_345860 ) ) ( ON ?auto_345858 ?auto_345859 ) ( ON ?auto_345857 ?auto_345858 ) ( ON ?auto_345856 ?auto_345857 ) ( CLEAR ?auto_345854 ) ( ON ?auto_345855 ?auto_345856 ) ( CLEAR ?auto_345855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_345848 ?auto_345849 ?auto_345850 ?auto_345851 ?auto_345852 ?auto_345853 ?auto_345854 ?auto_345855 )
      ( MAKE-12PILE ?auto_345848 ?auto_345849 ?auto_345850 ?auto_345851 ?auto_345852 ?auto_345853 ?auto_345854 ?auto_345855 ?auto_345856 ?auto_345857 ?auto_345858 ?auto_345859 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_345873 - BLOCK
      ?auto_345874 - BLOCK
      ?auto_345875 - BLOCK
      ?auto_345876 - BLOCK
      ?auto_345877 - BLOCK
      ?auto_345878 - BLOCK
      ?auto_345879 - BLOCK
      ?auto_345880 - BLOCK
      ?auto_345881 - BLOCK
      ?auto_345882 - BLOCK
      ?auto_345883 - BLOCK
      ?auto_345884 - BLOCK
    )
    :vars
    (
      ?auto_345885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345884 ?auto_345885 ) ( ON-TABLE ?auto_345873 ) ( ON ?auto_345874 ?auto_345873 ) ( ON ?auto_345875 ?auto_345874 ) ( ON ?auto_345876 ?auto_345875 ) ( ON ?auto_345877 ?auto_345876 ) ( ON ?auto_345878 ?auto_345877 ) ( ON ?auto_345879 ?auto_345878 ) ( not ( = ?auto_345873 ?auto_345874 ) ) ( not ( = ?auto_345873 ?auto_345875 ) ) ( not ( = ?auto_345873 ?auto_345876 ) ) ( not ( = ?auto_345873 ?auto_345877 ) ) ( not ( = ?auto_345873 ?auto_345878 ) ) ( not ( = ?auto_345873 ?auto_345879 ) ) ( not ( = ?auto_345873 ?auto_345880 ) ) ( not ( = ?auto_345873 ?auto_345881 ) ) ( not ( = ?auto_345873 ?auto_345882 ) ) ( not ( = ?auto_345873 ?auto_345883 ) ) ( not ( = ?auto_345873 ?auto_345884 ) ) ( not ( = ?auto_345873 ?auto_345885 ) ) ( not ( = ?auto_345874 ?auto_345875 ) ) ( not ( = ?auto_345874 ?auto_345876 ) ) ( not ( = ?auto_345874 ?auto_345877 ) ) ( not ( = ?auto_345874 ?auto_345878 ) ) ( not ( = ?auto_345874 ?auto_345879 ) ) ( not ( = ?auto_345874 ?auto_345880 ) ) ( not ( = ?auto_345874 ?auto_345881 ) ) ( not ( = ?auto_345874 ?auto_345882 ) ) ( not ( = ?auto_345874 ?auto_345883 ) ) ( not ( = ?auto_345874 ?auto_345884 ) ) ( not ( = ?auto_345874 ?auto_345885 ) ) ( not ( = ?auto_345875 ?auto_345876 ) ) ( not ( = ?auto_345875 ?auto_345877 ) ) ( not ( = ?auto_345875 ?auto_345878 ) ) ( not ( = ?auto_345875 ?auto_345879 ) ) ( not ( = ?auto_345875 ?auto_345880 ) ) ( not ( = ?auto_345875 ?auto_345881 ) ) ( not ( = ?auto_345875 ?auto_345882 ) ) ( not ( = ?auto_345875 ?auto_345883 ) ) ( not ( = ?auto_345875 ?auto_345884 ) ) ( not ( = ?auto_345875 ?auto_345885 ) ) ( not ( = ?auto_345876 ?auto_345877 ) ) ( not ( = ?auto_345876 ?auto_345878 ) ) ( not ( = ?auto_345876 ?auto_345879 ) ) ( not ( = ?auto_345876 ?auto_345880 ) ) ( not ( = ?auto_345876 ?auto_345881 ) ) ( not ( = ?auto_345876 ?auto_345882 ) ) ( not ( = ?auto_345876 ?auto_345883 ) ) ( not ( = ?auto_345876 ?auto_345884 ) ) ( not ( = ?auto_345876 ?auto_345885 ) ) ( not ( = ?auto_345877 ?auto_345878 ) ) ( not ( = ?auto_345877 ?auto_345879 ) ) ( not ( = ?auto_345877 ?auto_345880 ) ) ( not ( = ?auto_345877 ?auto_345881 ) ) ( not ( = ?auto_345877 ?auto_345882 ) ) ( not ( = ?auto_345877 ?auto_345883 ) ) ( not ( = ?auto_345877 ?auto_345884 ) ) ( not ( = ?auto_345877 ?auto_345885 ) ) ( not ( = ?auto_345878 ?auto_345879 ) ) ( not ( = ?auto_345878 ?auto_345880 ) ) ( not ( = ?auto_345878 ?auto_345881 ) ) ( not ( = ?auto_345878 ?auto_345882 ) ) ( not ( = ?auto_345878 ?auto_345883 ) ) ( not ( = ?auto_345878 ?auto_345884 ) ) ( not ( = ?auto_345878 ?auto_345885 ) ) ( not ( = ?auto_345879 ?auto_345880 ) ) ( not ( = ?auto_345879 ?auto_345881 ) ) ( not ( = ?auto_345879 ?auto_345882 ) ) ( not ( = ?auto_345879 ?auto_345883 ) ) ( not ( = ?auto_345879 ?auto_345884 ) ) ( not ( = ?auto_345879 ?auto_345885 ) ) ( not ( = ?auto_345880 ?auto_345881 ) ) ( not ( = ?auto_345880 ?auto_345882 ) ) ( not ( = ?auto_345880 ?auto_345883 ) ) ( not ( = ?auto_345880 ?auto_345884 ) ) ( not ( = ?auto_345880 ?auto_345885 ) ) ( not ( = ?auto_345881 ?auto_345882 ) ) ( not ( = ?auto_345881 ?auto_345883 ) ) ( not ( = ?auto_345881 ?auto_345884 ) ) ( not ( = ?auto_345881 ?auto_345885 ) ) ( not ( = ?auto_345882 ?auto_345883 ) ) ( not ( = ?auto_345882 ?auto_345884 ) ) ( not ( = ?auto_345882 ?auto_345885 ) ) ( not ( = ?auto_345883 ?auto_345884 ) ) ( not ( = ?auto_345883 ?auto_345885 ) ) ( not ( = ?auto_345884 ?auto_345885 ) ) ( ON ?auto_345883 ?auto_345884 ) ( ON ?auto_345882 ?auto_345883 ) ( ON ?auto_345881 ?auto_345882 ) ( CLEAR ?auto_345879 ) ( ON ?auto_345880 ?auto_345881 ) ( CLEAR ?auto_345880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_345873 ?auto_345874 ?auto_345875 ?auto_345876 ?auto_345877 ?auto_345878 ?auto_345879 ?auto_345880 )
      ( MAKE-12PILE ?auto_345873 ?auto_345874 ?auto_345875 ?auto_345876 ?auto_345877 ?auto_345878 ?auto_345879 ?auto_345880 ?auto_345881 ?auto_345882 ?auto_345883 ?auto_345884 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_345898 - BLOCK
      ?auto_345899 - BLOCK
      ?auto_345900 - BLOCK
      ?auto_345901 - BLOCK
      ?auto_345902 - BLOCK
      ?auto_345903 - BLOCK
      ?auto_345904 - BLOCK
      ?auto_345905 - BLOCK
      ?auto_345906 - BLOCK
      ?auto_345907 - BLOCK
      ?auto_345908 - BLOCK
      ?auto_345909 - BLOCK
    )
    :vars
    (
      ?auto_345910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345909 ?auto_345910 ) ( ON-TABLE ?auto_345898 ) ( ON ?auto_345899 ?auto_345898 ) ( ON ?auto_345900 ?auto_345899 ) ( ON ?auto_345901 ?auto_345900 ) ( ON ?auto_345902 ?auto_345901 ) ( ON ?auto_345903 ?auto_345902 ) ( not ( = ?auto_345898 ?auto_345899 ) ) ( not ( = ?auto_345898 ?auto_345900 ) ) ( not ( = ?auto_345898 ?auto_345901 ) ) ( not ( = ?auto_345898 ?auto_345902 ) ) ( not ( = ?auto_345898 ?auto_345903 ) ) ( not ( = ?auto_345898 ?auto_345904 ) ) ( not ( = ?auto_345898 ?auto_345905 ) ) ( not ( = ?auto_345898 ?auto_345906 ) ) ( not ( = ?auto_345898 ?auto_345907 ) ) ( not ( = ?auto_345898 ?auto_345908 ) ) ( not ( = ?auto_345898 ?auto_345909 ) ) ( not ( = ?auto_345898 ?auto_345910 ) ) ( not ( = ?auto_345899 ?auto_345900 ) ) ( not ( = ?auto_345899 ?auto_345901 ) ) ( not ( = ?auto_345899 ?auto_345902 ) ) ( not ( = ?auto_345899 ?auto_345903 ) ) ( not ( = ?auto_345899 ?auto_345904 ) ) ( not ( = ?auto_345899 ?auto_345905 ) ) ( not ( = ?auto_345899 ?auto_345906 ) ) ( not ( = ?auto_345899 ?auto_345907 ) ) ( not ( = ?auto_345899 ?auto_345908 ) ) ( not ( = ?auto_345899 ?auto_345909 ) ) ( not ( = ?auto_345899 ?auto_345910 ) ) ( not ( = ?auto_345900 ?auto_345901 ) ) ( not ( = ?auto_345900 ?auto_345902 ) ) ( not ( = ?auto_345900 ?auto_345903 ) ) ( not ( = ?auto_345900 ?auto_345904 ) ) ( not ( = ?auto_345900 ?auto_345905 ) ) ( not ( = ?auto_345900 ?auto_345906 ) ) ( not ( = ?auto_345900 ?auto_345907 ) ) ( not ( = ?auto_345900 ?auto_345908 ) ) ( not ( = ?auto_345900 ?auto_345909 ) ) ( not ( = ?auto_345900 ?auto_345910 ) ) ( not ( = ?auto_345901 ?auto_345902 ) ) ( not ( = ?auto_345901 ?auto_345903 ) ) ( not ( = ?auto_345901 ?auto_345904 ) ) ( not ( = ?auto_345901 ?auto_345905 ) ) ( not ( = ?auto_345901 ?auto_345906 ) ) ( not ( = ?auto_345901 ?auto_345907 ) ) ( not ( = ?auto_345901 ?auto_345908 ) ) ( not ( = ?auto_345901 ?auto_345909 ) ) ( not ( = ?auto_345901 ?auto_345910 ) ) ( not ( = ?auto_345902 ?auto_345903 ) ) ( not ( = ?auto_345902 ?auto_345904 ) ) ( not ( = ?auto_345902 ?auto_345905 ) ) ( not ( = ?auto_345902 ?auto_345906 ) ) ( not ( = ?auto_345902 ?auto_345907 ) ) ( not ( = ?auto_345902 ?auto_345908 ) ) ( not ( = ?auto_345902 ?auto_345909 ) ) ( not ( = ?auto_345902 ?auto_345910 ) ) ( not ( = ?auto_345903 ?auto_345904 ) ) ( not ( = ?auto_345903 ?auto_345905 ) ) ( not ( = ?auto_345903 ?auto_345906 ) ) ( not ( = ?auto_345903 ?auto_345907 ) ) ( not ( = ?auto_345903 ?auto_345908 ) ) ( not ( = ?auto_345903 ?auto_345909 ) ) ( not ( = ?auto_345903 ?auto_345910 ) ) ( not ( = ?auto_345904 ?auto_345905 ) ) ( not ( = ?auto_345904 ?auto_345906 ) ) ( not ( = ?auto_345904 ?auto_345907 ) ) ( not ( = ?auto_345904 ?auto_345908 ) ) ( not ( = ?auto_345904 ?auto_345909 ) ) ( not ( = ?auto_345904 ?auto_345910 ) ) ( not ( = ?auto_345905 ?auto_345906 ) ) ( not ( = ?auto_345905 ?auto_345907 ) ) ( not ( = ?auto_345905 ?auto_345908 ) ) ( not ( = ?auto_345905 ?auto_345909 ) ) ( not ( = ?auto_345905 ?auto_345910 ) ) ( not ( = ?auto_345906 ?auto_345907 ) ) ( not ( = ?auto_345906 ?auto_345908 ) ) ( not ( = ?auto_345906 ?auto_345909 ) ) ( not ( = ?auto_345906 ?auto_345910 ) ) ( not ( = ?auto_345907 ?auto_345908 ) ) ( not ( = ?auto_345907 ?auto_345909 ) ) ( not ( = ?auto_345907 ?auto_345910 ) ) ( not ( = ?auto_345908 ?auto_345909 ) ) ( not ( = ?auto_345908 ?auto_345910 ) ) ( not ( = ?auto_345909 ?auto_345910 ) ) ( ON ?auto_345908 ?auto_345909 ) ( ON ?auto_345907 ?auto_345908 ) ( ON ?auto_345906 ?auto_345907 ) ( ON ?auto_345905 ?auto_345906 ) ( CLEAR ?auto_345903 ) ( ON ?auto_345904 ?auto_345905 ) ( CLEAR ?auto_345904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_345898 ?auto_345899 ?auto_345900 ?auto_345901 ?auto_345902 ?auto_345903 ?auto_345904 )
      ( MAKE-12PILE ?auto_345898 ?auto_345899 ?auto_345900 ?auto_345901 ?auto_345902 ?auto_345903 ?auto_345904 ?auto_345905 ?auto_345906 ?auto_345907 ?auto_345908 ?auto_345909 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_345923 - BLOCK
      ?auto_345924 - BLOCK
      ?auto_345925 - BLOCK
      ?auto_345926 - BLOCK
      ?auto_345927 - BLOCK
      ?auto_345928 - BLOCK
      ?auto_345929 - BLOCK
      ?auto_345930 - BLOCK
      ?auto_345931 - BLOCK
      ?auto_345932 - BLOCK
      ?auto_345933 - BLOCK
      ?auto_345934 - BLOCK
    )
    :vars
    (
      ?auto_345935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345934 ?auto_345935 ) ( ON-TABLE ?auto_345923 ) ( ON ?auto_345924 ?auto_345923 ) ( ON ?auto_345925 ?auto_345924 ) ( ON ?auto_345926 ?auto_345925 ) ( ON ?auto_345927 ?auto_345926 ) ( ON ?auto_345928 ?auto_345927 ) ( not ( = ?auto_345923 ?auto_345924 ) ) ( not ( = ?auto_345923 ?auto_345925 ) ) ( not ( = ?auto_345923 ?auto_345926 ) ) ( not ( = ?auto_345923 ?auto_345927 ) ) ( not ( = ?auto_345923 ?auto_345928 ) ) ( not ( = ?auto_345923 ?auto_345929 ) ) ( not ( = ?auto_345923 ?auto_345930 ) ) ( not ( = ?auto_345923 ?auto_345931 ) ) ( not ( = ?auto_345923 ?auto_345932 ) ) ( not ( = ?auto_345923 ?auto_345933 ) ) ( not ( = ?auto_345923 ?auto_345934 ) ) ( not ( = ?auto_345923 ?auto_345935 ) ) ( not ( = ?auto_345924 ?auto_345925 ) ) ( not ( = ?auto_345924 ?auto_345926 ) ) ( not ( = ?auto_345924 ?auto_345927 ) ) ( not ( = ?auto_345924 ?auto_345928 ) ) ( not ( = ?auto_345924 ?auto_345929 ) ) ( not ( = ?auto_345924 ?auto_345930 ) ) ( not ( = ?auto_345924 ?auto_345931 ) ) ( not ( = ?auto_345924 ?auto_345932 ) ) ( not ( = ?auto_345924 ?auto_345933 ) ) ( not ( = ?auto_345924 ?auto_345934 ) ) ( not ( = ?auto_345924 ?auto_345935 ) ) ( not ( = ?auto_345925 ?auto_345926 ) ) ( not ( = ?auto_345925 ?auto_345927 ) ) ( not ( = ?auto_345925 ?auto_345928 ) ) ( not ( = ?auto_345925 ?auto_345929 ) ) ( not ( = ?auto_345925 ?auto_345930 ) ) ( not ( = ?auto_345925 ?auto_345931 ) ) ( not ( = ?auto_345925 ?auto_345932 ) ) ( not ( = ?auto_345925 ?auto_345933 ) ) ( not ( = ?auto_345925 ?auto_345934 ) ) ( not ( = ?auto_345925 ?auto_345935 ) ) ( not ( = ?auto_345926 ?auto_345927 ) ) ( not ( = ?auto_345926 ?auto_345928 ) ) ( not ( = ?auto_345926 ?auto_345929 ) ) ( not ( = ?auto_345926 ?auto_345930 ) ) ( not ( = ?auto_345926 ?auto_345931 ) ) ( not ( = ?auto_345926 ?auto_345932 ) ) ( not ( = ?auto_345926 ?auto_345933 ) ) ( not ( = ?auto_345926 ?auto_345934 ) ) ( not ( = ?auto_345926 ?auto_345935 ) ) ( not ( = ?auto_345927 ?auto_345928 ) ) ( not ( = ?auto_345927 ?auto_345929 ) ) ( not ( = ?auto_345927 ?auto_345930 ) ) ( not ( = ?auto_345927 ?auto_345931 ) ) ( not ( = ?auto_345927 ?auto_345932 ) ) ( not ( = ?auto_345927 ?auto_345933 ) ) ( not ( = ?auto_345927 ?auto_345934 ) ) ( not ( = ?auto_345927 ?auto_345935 ) ) ( not ( = ?auto_345928 ?auto_345929 ) ) ( not ( = ?auto_345928 ?auto_345930 ) ) ( not ( = ?auto_345928 ?auto_345931 ) ) ( not ( = ?auto_345928 ?auto_345932 ) ) ( not ( = ?auto_345928 ?auto_345933 ) ) ( not ( = ?auto_345928 ?auto_345934 ) ) ( not ( = ?auto_345928 ?auto_345935 ) ) ( not ( = ?auto_345929 ?auto_345930 ) ) ( not ( = ?auto_345929 ?auto_345931 ) ) ( not ( = ?auto_345929 ?auto_345932 ) ) ( not ( = ?auto_345929 ?auto_345933 ) ) ( not ( = ?auto_345929 ?auto_345934 ) ) ( not ( = ?auto_345929 ?auto_345935 ) ) ( not ( = ?auto_345930 ?auto_345931 ) ) ( not ( = ?auto_345930 ?auto_345932 ) ) ( not ( = ?auto_345930 ?auto_345933 ) ) ( not ( = ?auto_345930 ?auto_345934 ) ) ( not ( = ?auto_345930 ?auto_345935 ) ) ( not ( = ?auto_345931 ?auto_345932 ) ) ( not ( = ?auto_345931 ?auto_345933 ) ) ( not ( = ?auto_345931 ?auto_345934 ) ) ( not ( = ?auto_345931 ?auto_345935 ) ) ( not ( = ?auto_345932 ?auto_345933 ) ) ( not ( = ?auto_345932 ?auto_345934 ) ) ( not ( = ?auto_345932 ?auto_345935 ) ) ( not ( = ?auto_345933 ?auto_345934 ) ) ( not ( = ?auto_345933 ?auto_345935 ) ) ( not ( = ?auto_345934 ?auto_345935 ) ) ( ON ?auto_345933 ?auto_345934 ) ( ON ?auto_345932 ?auto_345933 ) ( ON ?auto_345931 ?auto_345932 ) ( ON ?auto_345930 ?auto_345931 ) ( CLEAR ?auto_345928 ) ( ON ?auto_345929 ?auto_345930 ) ( CLEAR ?auto_345929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_345923 ?auto_345924 ?auto_345925 ?auto_345926 ?auto_345927 ?auto_345928 ?auto_345929 )
      ( MAKE-12PILE ?auto_345923 ?auto_345924 ?auto_345925 ?auto_345926 ?auto_345927 ?auto_345928 ?auto_345929 ?auto_345930 ?auto_345931 ?auto_345932 ?auto_345933 ?auto_345934 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_345948 - BLOCK
      ?auto_345949 - BLOCK
      ?auto_345950 - BLOCK
      ?auto_345951 - BLOCK
      ?auto_345952 - BLOCK
      ?auto_345953 - BLOCK
      ?auto_345954 - BLOCK
      ?auto_345955 - BLOCK
      ?auto_345956 - BLOCK
      ?auto_345957 - BLOCK
      ?auto_345958 - BLOCK
      ?auto_345959 - BLOCK
    )
    :vars
    (
      ?auto_345960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345959 ?auto_345960 ) ( ON-TABLE ?auto_345948 ) ( ON ?auto_345949 ?auto_345948 ) ( ON ?auto_345950 ?auto_345949 ) ( ON ?auto_345951 ?auto_345950 ) ( ON ?auto_345952 ?auto_345951 ) ( not ( = ?auto_345948 ?auto_345949 ) ) ( not ( = ?auto_345948 ?auto_345950 ) ) ( not ( = ?auto_345948 ?auto_345951 ) ) ( not ( = ?auto_345948 ?auto_345952 ) ) ( not ( = ?auto_345948 ?auto_345953 ) ) ( not ( = ?auto_345948 ?auto_345954 ) ) ( not ( = ?auto_345948 ?auto_345955 ) ) ( not ( = ?auto_345948 ?auto_345956 ) ) ( not ( = ?auto_345948 ?auto_345957 ) ) ( not ( = ?auto_345948 ?auto_345958 ) ) ( not ( = ?auto_345948 ?auto_345959 ) ) ( not ( = ?auto_345948 ?auto_345960 ) ) ( not ( = ?auto_345949 ?auto_345950 ) ) ( not ( = ?auto_345949 ?auto_345951 ) ) ( not ( = ?auto_345949 ?auto_345952 ) ) ( not ( = ?auto_345949 ?auto_345953 ) ) ( not ( = ?auto_345949 ?auto_345954 ) ) ( not ( = ?auto_345949 ?auto_345955 ) ) ( not ( = ?auto_345949 ?auto_345956 ) ) ( not ( = ?auto_345949 ?auto_345957 ) ) ( not ( = ?auto_345949 ?auto_345958 ) ) ( not ( = ?auto_345949 ?auto_345959 ) ) ( not ( = ?auto_345949 ?auto_345960 ) ) ( not ( = ?auto_345950 ?auto_345951 ) ) ( not ( = ?auto_345950 ?auto_345952 ) ) ( not ( = ?auto_345950 ?auto_345953 ) ) ( not ( = ?auto_345950 ?auto_345954 ) ) ( not ( = ?auto_345950 ?auto_345955 ) ) ( not ( = ?auto_345950 ?auto_345956 ) ) ( not ( = ?auto_345950 ?auto_345957 ) ) ( not ( = ?auto_345950 ?auto_345958 ) ) ( not ( = ?auto_345950 ?auto_345959 ) ) ( not ( = ?auto_345950 ?auto_345960 ) ) ( not ( = ?auto_345951 ?auto_345952 ) ) ( not ( = ?auto_345951 ?auto_345953 ) ) ( not ( = ?auto_345951 ?auto_345954 ) ) ( not ( = ?auto_345951 ?auto_345955 ) ) ( not ( = ?auto_345951 ?auto_345956 ) ) ( not ( = ?auto_345951 ?auto_345957 ) ) ( not ( = ?auto_345951 ?auto_345958 ) ) ( not ( = ?auto_345951 ?auto_345959 ) ) ( not ( = ?auto_345951 ?auto_345960 ) ) ( not ( = ?auto_345952 ?auto_345953 ) ) ( not ( = ?auto_345952 ?auto_345954 ) ) ( not ( = ?auto_345952 ?auto_345955 ) ) ( not ( = ?auto_345952 ?auto_345956 ) ) ( not ( = ?auto_345952 ?auto_345957 ) ) ( not ( = ?auto_345952 ?auto_345958 ) ) ( not ( = ?auto_345952 ?auto_345959 ) ) ( not ( = ?auto_345952 ?auto_345960 ) ) ( not ( = ?auto_345953 ?auto_345954 ) ) ( not ( = ?auto_345953 ?auto_345955 ) ) ( not ( = ?auto_345953 ?auto_345956 ) ) ( not ( = ?auto_345953 ?auto_345957 ) ) ( not ( = ?auto_345953 ?auto_345958 ) ) ( not ( = ?auto_345953 ?auto_345959 ) ) ( not ( = ?auto_345953 ?auto_345960 ) ) ( not ( = ?auto_345954 ?auto_345955 ) ) ( not ( = ?auto_345954 ?auto_345956 ) ) ( not ( = ?auto_345954 ?auto_345957 ) ) ( not ( = ?auto_345954 ?auto_345958 ) ) ( not ( = ?auto_345954 ?auto_345959 ) ) ( not ( = ?auto_345954 ?auto_345960 ) ) ( not ( = ?auto_345955 ?auto_345956 ) ) ( not ( = ?auto_345955 ?auto_345957 ) ) ( not ( = ?auto_345955 ?auto_345958 ) ) ( not ( = ?auto_345955 ?auto_345959 ) ) ( not ( = ?auto_345955 ?auto_345960 ) ) ( not ( = ?auto_345956 ?auto_345957 ) ) ( not ( = ?auto_345956 ?auto_345958 ) ) ( not ( = ?auto_345956 ?auto_345959 ) ) ( not ( = ?auto_345956 ?auto_345960 ) ) ( not ( = ?auto_345957 ?auto_345958 ) ) ( not ( = ?auto_345957 ?auto_345959 ) ) ( not ( = ?auto_345957 ?auto_345960 ) ) ( not ( = ?auto_345958 ?auto_345959 ) ) ( not ( = ?auto_345958 ?auto_345960 ) ) ( not ( = ?auto_345959 ?auto_345960 ) ) ( ON ?auto_345958 ?auto_345959 ) ( ON ?auto_345957 ?auto_345958 ) ( ON ?auto_345956 ?auto_345957 ) ( ON ?auto_345955 ?auto_345956 ) ( ON ?auto_345954 ?auto_345955 ) ( CLEAR ?auto_345952 ) ( ON ?auto_345953 ?auto_345954 ) ( CLEAR ?auto_345953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_345948 ?auto_345949 ?auto_345950 ?auto_345951 ?auto_345952 ?auto_345953 )
      ( MAKE-12PILE ?auto_345948 ?auto_345949 ?auto_345950 ?auto_345951 ?auto_345952 ?auto_345953 ?auto_345954 ?auto_345955 ?auto_345956 ?auto_345957 ?auto_345958 ?auto_345959 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_345973 - BLOCK
      ?auto_345974 - BLOCK
      ?auto_345975 - BLOCK
      ?auto_345976 - BLOCK
      ?auto_345977 - BLOCK
      ?auto_345978 - BLOCK
      ?auto_345979 - BLOCK
      ?auto_345980 - BLOCK
      ?auto_345981 - BLOCK
      ?auto_345982 - BLOCK
      ?auto_345983 - BLOCK
      ?auto_345984 - BLOCK
    )
    :vars
    (
      ?auto_345985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_345984 ?auto_345985 ) ( ON-TABLE ?auto_345973 ) ( ON ?auto_345974 ?auto_345973 ) ( ON ?auto_345975 ?auto_345974 ) ( ON ?auto_345976 ?auto_345975 ) ( ON ?auto_345977 ?auto_345976 ) ( not ( = ?auto_345973 ?auto_345974 ) ) ( not ( = ?auto_345973 ?auto_345975 ) ) ( not ( = ?auto_345973 ?auto_345976 ) ) ( not ( = ?auto_345973 ?auto_345977 ) ) ( not ( = ?auto_345973 ?auto_345978 ) ) ( not ( = ?auto_345973 ?auto_345979 ) ) ( not ( = ?auto_345973 ?auto_345980 ) ) ( not ( = ?auto_345973 ?auto_345981 ) ) ( not ( = ?auto_345973 ?auto_345982 ) ) ( not ( = ?auto_345973 ?auto_345983 ) ) ( not ( = ?auto_345973 ?auto_345984 ) ) ( not ( = ?auto_345973 ?auto_345985 ) ) ( not ( = ?auto_345974 ?auto_345975 ) ) ( not ( = ?auto_345974 ?auto_345976 ) ) ( not ( = ?auto_345974 ?auto_345977 ) ) ( not ( = ?auto_345974 ?auto_345978 ) ) ( not ( = ?auto_345974 ?auto_345979 ) ) ( not ( = ?auto_345974 ?auto_345980 ) ) ( not ( = ?auto_345974 ?auto_345981 ) ) ( not ( = ?auto_345974 ?auto_345982 ) ) ( not ( = ?auto_345974 ?auto_345983 ) ) ( not ( = ?auto_345974 ?auto_345984 ) ) ( not ( = ?auto_345974 ?auto_345985 ) ) ( not ( = ?auto_345975 ?auto_345976 ) ) ( not ( = ?auto_345975 ?auto_345977 ) ) ( not ( = ?auto_345975 ?auto_345978 ) ) ( not ( = ?auto_345975 ?auto_345979 ) ) ( not ( = ?auto_345975 ?auto_345980 ) ) ( not ( = ?auto_345975 ?auto_345981 ) ) ( not ( = ?auto_345975 ?auto_345982 ) ) ( not ( = ?auto_345975 ?auto_345983 ) ) ( not ( = ?auto_345975 ?auto_345984 ) ) ( not ( = ?auto_345975 ?auto_345985 ) ) ( not ( = ?auto_345976 ?auto_345977 ) ) ( not ( = ?auto_345976 ?auto_345978 ) ) ( not ( = ?auto_345976 ?auto_345979 ) ) ( not ( = ?auto_345976 ?auto_345980 ) ) ( not ( = ?auto_345976 ?auto_345981 ) ) ( not ( = ?auto_345976 ?auto_345982 ) ) ( not ( = ?auto_345976 ?auto_345983 ) ) ( not ( = ?auto_345976 ?auto_345984 ) ) ( not ( = ?auto_345976 ?auto_345985 ) ) ( not ( = ?auto_345977 ?auto_345978 ) ) ( not ( = ?auto_345977 ?auto_345979 ) ) ( not ( = ?auto_345977 ?auto_345980 ) ) ( not ( = ?auto_345977 ?auto_345981 ) ) ( not ( = ?auto_345977 ?auto_345982 ) ) ( not ( = ?auto_345977 ?auto_345983 ) ) ( not ( = ?auto_345977 ?auto_345984 ) ) ( not ( = ?auto_345977 ?auto_345985 ) ) ( not ( = ?auto_345978 ?auto_345979 ) ) ( not ( = ?auto_345978 ?auto_345980 ) ) ( not ( = ?auto_345978 ?auto_345981 ) ) ( not ( = ?auto_345978 ?auto_345982 ) ) ( not ( = ?auto_345978 ?auto_345983 ) ) ( not ( = ?auto_345978 ?auto_345984 ) ) ( not ( = ?auto_345978 ?auto_345985 ) ) ( not ( = ?auto_345979 ?auto_345980 ) ) ( not ( = ?auto_345979 ?auto_345981 ) ) ( not ( = ?auto_345979 ?auto_345982 ) ) ( not ( = ?auto_345979 ?auto_345983 ) ) ( not ( = ?auto_345979 ?auto_345984 ) ) ( not ( = ?auto_345979 ?auto_345985 ) ) ( not ( = ?auto_345980 ?auto_345981 ) ) ( not ( = ?auto_345980 ?auto_345982 ) ) ( not ( = ?auto_345980 ?auto_345983 ) ) ( not ( = ?auto_345980 ?auto_345984 ) ) ( not ( = ?auto_345980 ?auto_345985 ) ) ( not ( = ?auto_345981 ?auto_345982 ) ) ( not ( = ?auto_345981 ?auto_345983 ) ) ( not ( = ?auto_345981 ?auto_345984 ) ) ( not ( = ?auto_345981 ?auto_345985 ) ) ( not ( = ?auto_345982 ?auto_345983 ) ) ( not ( = ?auto_345982 ?auto_345984 ) ) ( not ( = ?auto_345982 ?auto_345985 ) ) ( not ( = ?auto_345983 ?auto_345984 ) ) ( not ( = ?auto_345983 ?auto_345985 ) ) ( not ( = ?auto_345984 ?auto_345985 ) ) ( ON ?auto_345983 ?auto_345984 ) ( ON ?auto_345982 ?auto_345983 ) ( ON ?auto_345981 ?auto_345982 ) ( ON ?auto_345980 ?auto_345981 ) ( ON ?auto_345979 ?auto_345980 ) ( CLEAR ?auto_345977 ) ( ON ?auto_345978 ?auto_345979 ) ( CLEAR ?auto_345978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_345973 ?auto_345974 ?auto_345975 ?auto_345976 ?auto_345977 ?auto_345978 )
      ( MAKE-12PILE ?auto_345973 ?auto_345974 ?auto_345975 ?auto_345976 ?auto_345977 ?auto_345978 ?auto_345979 ?auto_345980 ?auto_345981 ?auto_345982 ?auto_345983 ?auto_345984 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_345998 - BLOCK
      ?auto_345999 - BLOCK
      ?auto_346000 - BLOCK
      ?auto_346001 - BLOCK
      ?auto_346002 - BLOCK
      ?auto_346003 - BLOCK
      ?auto_346004 - BLOCK
      ?auto_346005 - BLOCK
      ?auto_346006 - BLOCK
      ?auto_346007 - BLOCK
      ?auto_346008 - BLOCK
      ?auto_346009 - BLOCK
    )
    :vars
    (
      ?auto_346010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346009 ?auto_346010 ) ( ON-TABLE ?auto_345998 ) ( ON ?auto_345999 ?auto_345998 ) ( ON ?auto_346000 ?auto_345999 ) ( ON ?auto_346001 ?auto_346000 ) ( not ( = ?auto_345998 ?auto_345999 ) ) ( not ( = ?auto_345998 ?auto_346000 ) ) ( not ( = ?auto_345998 ?auto_346001 ) ) ( not ( = ?auto_345998 ?auto_346002 ) ) ( not ( = ?auto_345998 ?auto_346003 ) ) ( not ( = ?auto_345998 ?auto_346004 ) ) ( not ( = ?auto_345998 ?auto_346005 ) ) ( not ( = ?auto_345998 ?auto_346006 ) ) ( not ( = ?auto_345998 ?auto_346007 ) ) ( not ( = ?auto_345998 ?auto_346008 ) ) ( not ( = ?auto_345998 ?auto_346009 ) ) ( not ( = ?auto_345998 ?auto_346010 ) ) ( not ( = ?auto_345999 ?auto_346000 ) ) ( not ( = ?auto_345999 ?auto_346001 ) ) ( not ( = ?auto_345999 ?auto_346002 ) ) ( not ( = ?auto_345999 ?auto_346003 ) ) ( not ( = ?auto_345999 ?auto_346004 ) ) ( not ( = ?auto_345999 ?auto_346005 ) ) ( not ( = ?auto_345999 ?auto_346006 ) ) ( not ( = ?auto_345999 ?auto_346007 ) ) ( not ( = ?auto_345999 ?auto_346008 ) ) ( not ( = ?auto_345999 ?auto_346009 ) ) ( not ( = ?auto_345999 ?auto_346010 ) ) ( not ( = ?auto_346000 ?auto_346001 ) ) ( not ( = ?auto_346000 ?auto_346002 ) ) ( not ( = ?auto_346000 ?auto_346003 ) ) ( not ( = ?auto_346000 ?auto_346004 ) ) ( not ( = ?auto_346000 ?auto_346005 ) ) ( not ( = ?auto_346000 ?auto_346006 ) ) ( not ( = ?auto_346000 ?auto_346007 ) ) ( not ( = ?auto_346000 ?auto_346008 ) ) ( not ( = ?auto_346000 ?auto_346009 ) ) ( not ( = ?auto_346000 ?auto_346010 ) ) ( not ( = ?auto_346001 ?auto_346002 ) ) ( not ( = ?auto_346001 ?auto_346003 ) ) ( not ( = ?auto_346001 ?auto_346004 ) ) ( not ( = ?auto_346001 ?auto_346005 ) ) ( not ( = ?auto_346001 ?auto_346006 ) ) ( not ( = ?auto_346001 ?auto_346007 ) ) ( not ( = ?auto_346001 ?auto_346008 ) ) ( not ( = ?auto_346001 ?auto_346009 ) ) ( not ( = ?auto_346001 ?auto_346010 ) ) ( not ( = ?auto_346002 ?auto_346003 ) ) ( not ( = ?auto_346002 ?auto_346004 ) ) ( not ( = ?auto_346002 ?auto_346005 ) ) ( not ( = ?auto_346002 ?auto_346006 ) ) ( not ( = ?auto_346002 ?auto_346007 ) ) ( not ( = ?auto_346002 ?auto_346008 ) ) ( not ( = ?auto_346002 ?auto_346009 ) ) ( not ( = ?auto_346002 ?auto_346010 ) ) ( not ( = ?auto_346003 ?auto_346004 ) ) ( not ( = ?auto_346003 ?auto_346005 ) ) ( not ( = ?auto_346003 ?auto_346006 ) ) ( not ( = ?auto_346003 ?auto_346007 ) ) ( not ( = ?auto_346003 ?auto_346008 ) ) ( not ( = ?auto_346003 ?auto_346009 ) ) ( not ( = ?auto_346003 ?auto_346010 ) ) ( not ( = ?auto_346004 ?auto_346005 ) ) ( not ( = ?auto_346004 ?auto_346006 ) ) ( not ( = ?auto_346004 ?auto_346007 ) ) ( not ( = ?auto_346004 ?auto_346008 ) ) ( not ( = ?auto_346004 ?auto_346009 ) ) ( not ( = ?auto_346004 ?auto_346010 ) ) ( not ( = ?auto_346005 ?auto_346006 ) ) ( not ( = ?auto_346005 ?auto_346007 ) ) ( not ( = ?auto_346005 ?auto_346008 ) ) ( not ( = ?auto_346005 ?auto_346009 ) ) ( not ( = ?auto_346005 ?auto_346010 ) ) ( not ( = ?auto_346006 ?auto_346007 ) ) ( not ( = ?auto_346006 ?auto_346008 ) ) ( not ( = ?auto_346006 ?auto_346009 ) ) ( not ( = ?auto_346006 ?auto_346010 ) ) ( not ( = ?auto_346007 ?auto_346008 ) ) ( not ( = ?auto_346007 ?auto_346009 ) ) ( not ( = ?auto_346007 ?auto_346010 ) ) ( not ( = ?auto_346008 ?auto_346009 ) ) ( not ( = ?auto_346008 ?auto_346010 ) ) ( not ( = ?auto_346009 ?auto_346010 ) ) ( ON ?auto_346008 ?auto_346009 ) ( ON ?auto_346007 ?auto_346008 ) ( ON ?auto_346006 ?auto_346007 ) ( ON ?auto_346005 ?auto_346006 ) ( ON ?auto_346004 ?auto_346005 ) ( ON ?auto_346003 ?auto_346004 ) ( CLEAR ?auto_346001 ) ( ON ?auto_346002 ?auto_346003 ) ( CLEAR ?auto_346002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_345998 ?auto_345999 ?auto_346000 ?auto_346001 ?auto_346002 )
      ( MAKE-12PILE ?auto_345998 ?auto_345999 ?auto_346000 ?auto_346001 ?auto_346002 ?auto_346003 ?auto_346004 ?auto_346005 ?auto_346006 ?auto_346007 ?auto_346008 ?auto_346009 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_346023 - BLOCK
      ?auto_346024 - BLOCK
      ?auto_346025 - BLOCK
      ?auto_346026 - BLOCK
      ?auto_346027 - BLOCK
      ?auto_346028 - BLOCK
      ?auto_346029 - BLOCK
      ?auto_346030 - BLOCK
      ?auto_346031 - BLOCK
      ?auto_346032 - BLOCK
      ?auto_346033 - BLOCK
      ?auto_346034 - BLOCK
    )
    :vars
    (
      ?auto_346035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346034 ?auto_346035 ) ( ON-TABLE ?auto_346023 ) ( ON ?auto_346024 ?auto_346023 ) ( ON ?auto_346025 ?auto_346024 ) ( ON ?auto_346026 ?auto_346025 ) ( not ( = ?auto_346023 ?auto_346024 ) ) ( not ( = ?auto_346023 ?auto_346025 ) ) ( not ( = ?auto_346023 ?auto_346026 ) ) ( not ( = ?auto_346023 ?auto_346027 ) ) ( not ( = ?auto_346023 ?auto_346028 ) ) ( not ( = ?auto_346023 ?auto_346029 ) ) ( not ( = ?auto_346023 ?auto_346030 ) ) ( not ( = ?auto_346023 ?auto_346031 ) ) ( not ( = ?auto_346023 ?auto_346032 ) ) ( not ( = ?auto_346023 ?auto_346033 ) ) ( not ( = ?auto_346023 ?auto_346034 ) ) ( not ( = ?auto_346023 ?auto_346035 ) ) ( not ( = ?auto_346024 ?auto_346025 ) ) ( not ( = ?auto_346024 ?auto_346026 ) ) ( not ( = ?auto_346024 ?auto_346027 ) ) ( not ( = ?auto_346024 ?auto_346028 ) ) ( not ( = ?auto_346024 ?auto_346029 ) ) ( not ( = ?auto_346024 ?auto_346030 ) ) ( not ( = ?auto_346024 ?auto_346031 ) ) ( not ( = ?auto_346024 ?auto_346032 ) ) ( not ( = ?auto_346024 ?auto_346033 ) ) ( not ( = ?auto_346024 ?auto_346034 ) ) ( not ( = ?auto_346024 ?auto_346035 ) ) ( not ( = ?auto_346025 ?auto_346026 ) ) ( not ( = ?auto_346025 ?auto_346027 ) ) ( not ( = ?auto_346025 ?auto_346028 ) ) ( not ( = ?auto_346025 ?auto_346029 ) ) ( not ( = ?auto_346025 ?auto_346030 ) ) ( not ( = ?auto_346025 ?auto_346031 ) ) ( not ( = ?auto_346025 ?auto_346032 ) ) ( not ( = ?auto_346025 ?auto_346033 ) ) ( not ( = ?auto_346025 ?auto_346034 ) ) ( not ( = ?auto_346025 ?auto_346035 ) ) ( not ( = ?auto_346026 ?auto_346027 ) ) ( not ( = ?auto_346026 ?auto_346028 ) ) ( not ( = ?auto_346026 ?auto_346029 ) ) ( not ( = ?auto_346026 ?auto_346030 ) ) ( not ( = ?auto_346026 ?auto_346031 ) ) ( not ( = ?auto_346026 ?auto_346032 ) ) ( not ( = ?auto_346026 ?auto_346033 ) ) ( not ( = ?auto_346026 ?auto_346034 ) ) ( not ( = ?auto_346026 ?auto_346035 ) ) ( not ( = ?auto_346027 ?auto_346028 ) ) ( not ( = ?auto_346027 ?auto_346029 ) ) ( not ( = ?auto_346027 ?auto_346030 ) ) ( not ( = ?auto_346027 ?auto_346031 ) ) ( not ( = ?auto_346027 ?auto_346032 ) ) ( not ( = ?auto_346027 ?auto_346033 ) ) ( not ( = ?auto_346027 ?auto_346034 ) ) ( not ( = ?auto_346027 ?auto_346035 ) ) ( not ( = ?auto_346028 ?auto_346029 ) ) ( not ( = ?auto_346028 ?auto_346030 ) ) ( not ( = ?auto_346028 ?auto_346031 ) ) ( not ( = ?auto_346028 ?auto_346032 ) ) ( not ( = ?auto_346028 ?auto_346033 ) ) ( not ( = ?auto_346028 ?auto_346034 ) ) ( not ( = ?auto_346028 ?auto_346035 ) ) ( not ( = ?auto_346029 ?auto_346030 ) ) ( not ( = ?auto_346029 ?auto_346031 ) ) ( not ( = ?auto_346029 ?auto_346032 ) ) ( not ( = ?auto_346029 ?auto_346033 ) ) ( not ( = ?auto_346029 ?auto_346034 ) ) ( not ( = ?auto_346029 ?auto_346035 ) ) ( not ( = ?auto_346030 ?auto_346031 ) ) ( not ( = ?auto_346030 ?auto_346032 ) ) ( not ( = ?auto_346030 ?auto_346033 ) ) ( not ( = ?auto_346030 ?auto_346034 ) ) ( not ( = ?auto_346030 ?auto_346035 ) ) ( not ( = ?auto_346031 ?auto_346032 ) ) ( not ( = ?auto_346031 ?auto_346033 ) ) ( not ( = ?auto_346031 ?auto_346034 ) ) ( not ( = ?auto_346031 ?auto_346035 ) ) ( not ( = ?auto_346032 ?auto_346033 ) ) ( not ( = ?auto_346032 ?auto_346034 ) ) ( not ( = ?auto_346032 ?auto_346035 ) ) ( not ( = ?auto_346033 ?auto_346034 ) ) ( not ( = ?auto_346033 ?auto_346035 ) ) ( not ( = ?auto_346034 ?auto_346035 ) ) ( ON ?auto_346033 ?auto_346034 ) ( ON ?auto_346032 ?auto_346033 ) ( ON ?auto_346031 ?auto_346032 ) ( ON ?auto_346030 ?auto_346031 ) ( ON ?auto_346029 ?auto_346030 ) ( ON ?auto_346028 ?auto_346029 ) ( CLEAR ?auto_346026 ) ( ON ?auto_346027 ?auto_346028 ) ( CLEAR ?auto_346027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_346023 ?auto_346024 ?auto_346025 ?auto_346026 ?auto_346027 )
      ( MAKE-12PILE ?auto_346023 ?auto_346024 ?auto_346025 ?auto_346026 ?auto_346027 ?auto_346028 ?auto_346029 ?auto_346030 ?auto_346031 ?auto_346032 ?auto_346033 ?auto_346034 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_346048 - BLOCK
      ?auto_346049 - BLOCK
      ?auto_346050 - BLOCK
      ?auto_346051 - BLOCK
      ?auto_346052 - BLOCK
      ?auto_346053 - BLOCK
      ?auto_346054 - BLOCK
      ?auto_346055 - BLOCK
      ?auto_346056 - BLOCK
      ?auto_346057 - BLOCK
      ?auto_346058 - BLOCK
      ?auto_346059 - BLOCK
    )
    :vars
    (
      ?auto_346060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346059 ?auto_346060 ) ( ON-TABLE ?auto_346048 ) ( ON ?auto_346049 ?auto_346048 ) ( ON ?auto_346050 ?auto_346049 ) ( not ( = ?auto_346048 ?auto_346049 ) ) ( not ( = ?auto_346048 ?auto_346050 ) ) ( not ( = ?auto_346048 ?auto_346051 ) ) ( not ( = ?auto_346048 ?auto_346052 ) ) ( not ( = ?auto_346048 ?auto_346053 ) ) ( not ( = ?auto_346048 ?auto_346054 ) ) ( not ( = ?auto_346048 ?auto_346055 ) ) ( not ( = ?auto_346048 ?auto_346056 ) ) ( not ( = ?auto_346048 ?auto_346057 ) ) ( not ( = ?auto_346048 ?auto_346058 ) ) ( not ( = ?auto_346048 ?auto_346059 ) ) ( not ( = ?auto_346048 ?auto_346060 ) ) ( not ( = ?auto_346049 ?auto_346050 ) ) ( not ( = ?auto_346049 ?auto_346051 ) ) ( not ( = ?auto_346049 ?auto_346052 ) ) ( not ( = ?auto_346049 ?auto_346053 ) ) ( not ( = ?auto_346049 ?auto_346054 ) ) ( not ( = ?auto_346049 ?auto_346055 ) ) ( not ( = ?auto_346049 ?auto_346056 ) ) ( not ( = ?auto_346049 ?auto_346057 ) ) ( not ( = ?auto_346049 ?auto_346058 ) ) ( not ( = ?auto_346049 ?auto_346059 ) ) ( not ( = ?auto_346049 ?auto_346060 ) ) ( not ( = ?auto_346050 ?auto_346051 ) ) ( not ( = ?auto_346050 ?auto_346052 ) ) ( not ( = ?auto_346050 ?auto_346053 ) ) ( not ( = ?auto_346050 ?auto_346054 ) ) ( not ( = ?auto_346050 ?auto_346055 ) ) ( not ( = ?auto_346050 ?auto_346056 ) ) ( not ( = ?auto_346050 ?auto_346057 ) ) ( not ( = ?auto_346050 ?auto_346058 ) ) ( not ( = ?auto_346050 ?auto_346059 ) ) ( not ( = ?auto_346050 ?auto_346060 ) ) ( not ( = ?auto_346051 ?auto_346052 ) ) ( not ( = ?auto_346051 ?auto_346053 ) ) ( not ( = ?auto_346051 ?auto_346054 ) ) ( not ( = ?auto_346051 ?auto_346055 ) ) ( not ( = ?auto_346051 ?auto_346056 ) ) ( not ( = ?auto_346051 ?auto_346057 ) ) ( not ( = ?auto_346051 ?auto_346058 ) ) ( not ( = ?auto_346051 ?auto_346059 ) ) ( not ( = ?auto_346051 ?auto_346060 ) ) ( not ( = ?auto_346052 ?auto_346053 ) ) ( not ( = ?auto_346052 ?auto_346054 ) ) ( not ( = ?auto_346052 ?auto_346055 ) ) ( not ( = ?auto_346052 ?auto_346056 ) ) ( not ( = ?auto_346052 ?auto_346057 ) ) ( not ( = ?auto_346052 ?auto_346058 ) ) ( not ( = ?auto_346052 ?auto_346059 ) ) ( not ( = ?auto_346052 ?auto_346060 ) ) ( not ( = ?auto_346053 ?auto_346054 ) ) ( not ( = ?auto_346053 ?auto_346055 ) ) ( not ( = ?auto_346053 ?auto_346056 ) ) ( not ( = ?auto_346053 ?auto_346057 ) ) ( not ( = ?auto_346053 ?auto_346058 ) ) ( not ( = ?auto_346053 ?auto_346059 ) ) ( not ( = ?auto_346053 ?auto_346060 ) ) ( not ( = ?auto_346054 ?auto_346055 ) ) ( not ( = ?auto_346054 ?auto_346056 ) ) ( not ( = ?auto_346054 ?auto_346057 ) ) ( not ( = ?auto_346054 ?auto_346058 ) ) ( not ( = ?auto_346054 ?auto_346059 ) ) ( not ( = ?auto_346054 ?auto_346060 ) ) ( not ( = ?auto_346055 ?auto_346056 ) ) ( not ( = ?auto_346055 ?auto_346057 ) ) ( not ( = ?auto_346055 ?auto_346058 ) ) ( not ( = ?auto_346055 ?auto_346059 ) ) ( not ( = ?auto_346055 ?auto_346060 ) ) ( not ( = ?auto_346056 ?auto_346057 ) ) ( not ( = ?auto_346056 ?auto_346058 ) ) ( not ( = ?auto_346056 ?auto_346059 ) ) ( not ( = ?auto_346056 ?auto_346060 ) ) ( not ( = ?auto_346057 ?auto_346058 ) ) ( not ( = ?auto_346057 ?auto_346059 ) ) ( not ( = ?auto_346057 ?auto_346060 ) ) ( not ( = ?auto_346058 ?auto_346059 ) ) ( not ( = ?auto_346058 ?auto_346060 ) ) ( not ( = ?auto_346059 ?auto_346060 ) ) ( ON ?auto_346058 ?auto_346059 ) ( ON ?auto_346057 ?auto_346058 ) ( ON ?auto_346056 ?auto_346057 ) ( ON ?auto_346055 ?auto_346056 ) ( ON ?auto_346054 ?auto_346055 ) ( ON ?auto_346053 ?auto_346054 ) ( ON ?auto_346052 ?auto_346053 ) ( CLEAR ?auto_346050 ) ( ON ?auto_346051 ?auto_346052 ) ( CLEAR ?auto_346051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_346048 ?auto_346049 ?auto_346050 ?auto_346051 )
      ( MAKE-12PILE ?auto_346048 ?auto_346049 ?auto_346050 ?auto_346051 ?auto_346052 ?auto_346053 ?auto_346054 ?auto_346055 ?auto_346056 ?auto_346057 ?auto_346058 ?auto_346059 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_346073 - BLOCK
      ?auto_346074 - BLOCK
      ?auto_346075 - BLOCK
      ?auto_346076 - BLOCK
      ?auto_346077 - BLOCK
      ?auto_346078 - BLOCK
      ?auto_346079 - BLOCK
      ?auto_346080 - BLOCK
      ?auto_346081 - BLOCK
      ?auto_346082 - BLOCK
      ?auto_346083 - BLOCK
      ?auto_346084 - BLOCK
    )
    :vars
    (
      ?auto_346085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346084 ?auto_346085 ) ( ON-TABLE ?auto_346073 ) ( ON ?auto_346074 ?auto_346073 ) ( ON ?auto_346075 ?auto_346074 ) ( not ( = ?auto_346073 ?auto_346074 ) ) ( not ( = ?auto_346073 ?auto_346075 ) ) ( not ( = ?auto_346073 ?auto_346076 ) ) ( not ( = ?auto_346073 ?auto_346077 ) ) ( not ( = ?auto_346073 ?auto_346078 ) ) ( not ( = ?auto_346073 ?auto_346079 ) ) ( not ( = ?auto_346073 ?auto_346080 ) ) ( not ( = ?auto_346073 ?auto_346081 ) ) ( not ( = ?auto_346073 ?auto_346082 ) ) ( not ( = ?auto_346073 ?auto_346083 ) ) ( not ( = ?auto_346073 ?auto_346084 ) ) ( not ( = ?auto_346073 ?auto_346085 ) ) ( not ( = ?auto_346074 ?auto_346075 ) ) ( not ( = ?auto_346074 ?auto_346076 ) ) ( not ( = ?auto_346074 ?auto_346077 ) ) ( not ( = ?auto_346074 ?auto_346078 ) ) ( not ( = ?auto_346074 ?auto_346079 ) ) ( not ( = ?auto_346074 ?auto_346080 ) ) ( not ( = ?auto_346074 ?auto_346081 ) ) ( not ( = ?auto_346074 ?auto_346082 ) ) ( not ( = ?auto_346074 ?auto_346083 ) ) ( not ( = ?auto_346074 ?auto_346084 ) ) ( not ( = ?auto_346074 ?auto_346085 ) ) ( not ( = ?auto_346075 ?auto_346076 ) ) ( not ( = ?auto_346075 ?auto_346077 ) ) ( not ( = ?auto_346075 ?auto_346078 ) ) ( not ( = ?auto_346075 ?auto_346079 ) ) ( not ( = ?auto_346075 ?auto_346080 ) ) ( not ( = ?auto_346075 ?auto_346081 ) ) ( not ( = ?auto_346075 ?auto_346082 ) ) ( not ( = ?auto_346075 ?auto_346083 ) ) ( not ( = ?auto_346075 ?auto_346084 ) ) ( not ( = ?auto_346075 ?auto_346085 ) ) ( not ( = ?auto_346076 ?auto_346077 ) ) ( not ( = ?auto_346076 ?auto_346078 ) ) ( not ( = ?auto_346076 ?auto_346079 ) ) ( not ( = ?auto_346076 ?auto_346080 ) ) ( not ( = ?auto_346076 ?auto_346081 ) ) ( not ( = ?auto_346076 ?auto_346082 ) ) ( not ( = ?auto_346076 ?auto_346083 ) ) ( not ( = ?auto_346076 ?auto_346084 ) ) ( not ( = ?auto_346076 ?auto_346085 ) ) ( not ( = ?auto_346077 ?auto_346078 ) ) ( not ( = ?auto_346077 ?auto_346079 ) ) ( not ( = ?auto_346077 ?auto_346080 ) ) ( not ( = ?auto_346077 ?auto_346081 ) ) ( not ( = ?auto_346077 ?auto_346082 ) ) ( not ( = ?auto_346077 ?auto_346083 ) ) ( not ( = ?auto_346077 ?auto_346084 ) ) ( not ( = ?auto_346077 ?auto_346085 ) ) ( not ( = ?auto_346078 ?auto_346079 ) ) ( not ( = ?auto_346078 ?auto_346080 ) ) ( not ( = ?auto_346078 ?auto_346081 ) ) ( not ( = ?auto_346078 ?auto_346082 ) ) ( not ( = ?auto_346078 ?auto_346083 ) ) ( not ( = ?auto_346078 ?auto_346084 ) ) ( not ( = ?auto_346078 ?auto_346085 ) ) ( not ( = ?auto_346079 ?auto_346080 ) ) ( not ( = ?auto_346079 ?auto_346081 ) ) ( not ( = ?auto_346079 ?auto_346082 ) ) ( not ( = ?auto_346079 ?auto_346083 ) ) ( not ( = ?auto_346079 ?auto_346084 ) ) ( not ( = ?auto_346079 ?auto_346085 ) ) ( not ( = ?auto_346080 ?auto_346081 ) ) ( not ( = ?auto_346080 ?auto_346082 ) ) ( not ( = ?auto_346080 ?auto_346083 ) ) ( not ( = ?auto_346080 ?auto_346084 ) ) ( not ( = ?auto_346080 ?auto_346085 ) ) ( not ( = ?auto_346081 ?auto_346082 ) ) ( not ( = ?auto_346081 ?auto_346083 ) ) ( not ( = ?auto_346081 ?auto_346084 ) ) ( not ( = ?auto_346081 ?auto_346085 ) ) ( not ( = ?auto_346082 ?auto_346083 ) ) ( not ( = ?auto_346082 ?auto_346084 ) ) ( not ( = ?auto_346082 ?auto_346085 ) ) ( not ( = ?auto_346083 ?auto_346084 ) ) ( not ( = ?auto_346083 ?auto_346085 ) ) ( not ( = ?auto_346084 ?auto_346085 ) ) ( ON ?auto_346083 ?auto_346084 ) ( ON ?auto_346082 ?auto_346083 ) ( ON ?auto_346081 ?auto_346082 ) ( ON ?auto_346080 ?auto_346081 ) ( ON ?auto_346079 ?auto_346080 ) ( ON ?auto_346078 ?auto_346079 ) ( ON ?auto_346077 ?auto_346078 ) ( CLEAR ?auto_346075 ) ( ON ?auto_346076 ?auto_346077 ) ( CLEAR ?auto_346076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_346073 ?auto_346074 ?auto_346075 ?auto_346076 )
      ( MAKE-12PILE ?auto_346073 ?auto_346074 ?auto_346075 ?auto_346076 ?auto_346077 ?auto_346078 ?auto_346079 ?auto_346080 ?auto_346081 ?auto_346082 ?auto_346083 ?auto_346084 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_346098 - BLOCK
      ?auto_346099 - BLOCK
      ?auto_346100 - BLOCK
      ?auto_346101 - BLOCK
      ?auto_346102 - BLOCK
      ?auto_346103 - BLOCK
      ?auto_346104 - BLOCK
      ?auto_346105 - BLOCK
      ?auto_346106 - BLOCK
      ?auto_346107 - BLOCK
      ?auto_346108 - BLOCK
      ?auto_346109 - BLOCK
    )
    :vars
    (
      ?auto_346110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346109 ?auto_346110 ) ( ON-TABLE ?auto_346098 ) ( ON ?auto_346099 ?auto_346098 ) ( not ( = ?auto_346098 ?auto_346099 ) ) ( not ( = ?auto_346098 ?auto_346100 ) ) ( not ( = ?auto_346098 ?auto_346101 ) ) ( not ( = ?auto_346098 ?auto_346102 ) ) ( not ( = ?auto_346098 ?auto_346103 ) ) ( not ( = ?auto_346098 ?auto_346104 ) ) ( not ( = ?auto_346098 ?auto_346105 ) ) ( not ( = ?auto_346098 ?auto_346106 ) ) ( not ( = ?auto_346098 ?auto_346107 ) ) ( not ( = ?auto_346098 ?auto_346108 ) ) ( not ( = ?auto_346098 ?auto_346109 ) ) ( not ( = ?auto_346098 ?auto_346110 ) ) ( not ( = ?auto_346099 ?auto_346100 ) ) ( not ( = ?auto_346099 ?auto_346101 ) ) ( not ( = ?auto_346099 ?auto_346102 ) ) ( not ( = ?auto_346099 ?auto_346103 ) ) ( not ( = ?auto_346099 ?auto_346104 ) ) ( not ( = ?auto_346099 ?auto_346105 ) ) ( not ( = ?auto_346099 ?auto_346106 ) ) ( not ( = ?auto_346099 ?auto_346107 ) ) ( not ( = ?auto_346099 ?auto_346108 ) ) ( not ( = ?auto_346099 ?auto_346109 ) ) ( not ( = ?auto_346099 ?auto_346110 ) ) ( not ( = ?auto_346100 ?auto_346101 ) ) ( not ( = ?auto_346100 ?auto_346102 ) ) ( not ( = ?auto_346100 ?auto_346103 ) ) ( not ( = ?auto_346100 ?auto_346104 ) ) ( not ( = ?auto_346100 ?auto_346105 ) ) ( not ( = ?auto_346100 ?auto_346106 ) ) ( not ( = ?auto_346100 ?auto_346107 ) ) ( not ( = ?auto_346100 ?auto_346108 ) ) ( not ( = ?auto_346100 ?auto_346109 ) ) ( not ( = ?auto_346100 ?auto_346110 ) ) ( not ( = ?auto_346101 ?auto_346102 ) ) ( not ( = ?auto_346101 ?auto_346103 ) ) ( not ( = ?auto_346101 ?auto_346104 ) ) ( not ( = ?auto_346101 ?auto_346105 ) ) ( not ( = ?auto_346101 ?auto_346106 ) ) ( not ( = ?auto_346101 ?auto_346107 ) ) ( not ( = ?auto_346101 ?auto_346108 ) ) ( not ( = ?auto_346101 ?auto_346109 ) ) ( not ( = ?auto_346101 ?auto_346110 ) ) ( not ( = ?auto_346102 ?auto_346103 ) ) ( not ( = ?auto_346102 ?auto_346104 ) ) ( not ( = ?auto_346102 ?auto_346105 ) ) ( not ( = ?auto_346102 ?auto_346106 ) ) ( not ( = ?auto_346102 ?auto_346107 ) ) ( not ( = ?auto_346102 ?auto_346108 ) ) ( not ( = ?auto_346102 ?auto_346109 ) ) ( not ( = ?auto_346102 ?auto_346110 ) ) ( not ( = ?auto_346103 ?auto_346104 ) ) ( not ( = ?auto_346103 ?auto_346105 ) ) ( not ( = ?auto_346103 ?auto_346106 ) ) ( not ( = ?auto_346103 ?auto_346107 ) ) ( not ( = ?auto_346103 ?auto_346108 ) ) ( not ( = ?auto_346103 ?auto_346109 ) ) ( not ( = ?auto_346103 ?auto_346110 ) ) ( not ( = ?auto_346104 ?auto_346105 ) ) ( not ( = ?auto_346104 ?auto_346106 ) ) ( not ( = ?auto_346104 ?auto_346107 ) ) ( not ( = ?auto_346104 ?auto_346108 ) ) ( not ( = ?auto_346104 ?auto_346109 ) ) ( not ( = ?auto_346104 ?auto_346110 ) ) ( not ( = ?auto_346105 ?auto_346106 ) ) ( not ( = ?auto_346105 ?auto_346107 ) ) ( not ( = ?auto_346105 ?auto_346108 ) ) ( not ( = ?auto_346105 ?auto_346109 ) ) ( not ( = ?auto_346105 ?auto_346110 ) ) ( not ( = ?auto_346106 ?auto_346107 ) ) ( not ( = ?auto_346106 ?auto_346108 ) ) ( not ( = ?auto_346106 ?auto_346109 ) ) ( not ( = ?auto_346106 ?auto_346110 ) ) ( not ( = ?auto_346107 ?auto_346108 ) ) ( not ( = ?auto_346107 ?auto_346109 ) ) ( not ( = ?auto_346107 ?auto_346110 ) ) ( not ( = ?auto_346108 ?auto_346109 ) ) ( not ( = ?auto_346108 ?auto_346110 ) ) ( not ( = ?auto_346109 ?auto_346110 ) ) ( ON ?auto_346108 ?auto_346109 ) ( ON ?auto_346107 ?auto_346108 ) ( ON ?auto_346106 ?auto_346107 ) ( ON ?auto_346105 ?auto_346106 ) ( ON ?auto_346104 ?auto_346105 ) ( ON ?auto_346103 ?auto_346104 ) ( ON ?auto_346102 ?auto_346103 ) ( ON ?auto_346101 ?auto_346102 ) ( CLEAR ?auto_346099 ) ( ON ?auto_346100 ?auto_346101 ) ( CLEAR ?auto_346100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_346098 ?auto_346099 ?auto_346100 )
      ( MAKE-12PILE ?auto_346098 ?auto_346099 ?auto_346100 ?auto_346101 ?auto_346102 ?auto_346103 ?auto_346104 ?auto_346105 ?auto_346106 ?auto_346107 ?auto_346108 ?auto_346109 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_346123 - BLOCK
      ?auto_346124 - BLOCK
      ?auto_346125 - BLOCK
      ?auto_346126 - BLOCK
      ?auto_346127 - BLOCK
      ?auto_346128 - BLOCK
      ?auto_346129 - BLOCK
      ?auto_346130 - BLOCK
      ?auto_346131 - BLOCK
      ?auto_346132 - BLOCK
      ?auto_346133 - BLOCK
      ?auto_346134 - BLOCK
    )
    :vars
    (
      ?auto_346135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346134 ?auto_346135 ) ( ON-TABLE ?auto_346123 ) ( ON ?auto_346124 ?auto_346123 ) ( not ( = ?auto_346123 ?auto_346124 ) ) ( not ( = ?auto_346123 ?auto_346125 ) ) ( not ( = ?auto_346123 ?auto_346126 ) ) ( not ( = ?auto_346123 ?auto_346127 ) ) ( not ( = ?auto_346123 ?auto_346128 ) ) ( not ( = ?auto_346123 ?auto_346129 ) ) ( not ( = ?auto_346123 ?auto_346130 ) ) ( not ( = ?auto_346123 ?auto_346131 ) ) ( not ( = ?auto_346123 ?auto_346132 ) ) ( not ( = ?auto_346123 ?auto_346133 ) ) ( not ( = ?auto_346123 ?auto_346134 ) ) ( not ( = ?auto_346123 ?auto_346135 ) ) ( not ( = ?auto_346124 ?auto_346125 ) ) ( not ( = ?auto_346124 ?auto_346126 ) ) ( not ( = ?auto_346124 ?auto_346127 ) ) ( not ( = ?auto_346124 ?auto_346128 ) ) ( not ( = ?auto_346124 ?auto_346129 ) ) ( not ( = ?auto_346124 ?auto_346130 ) ) ( not ( = ?auto_346124 ?auto_346131 ) ) ( not ( = ?auto_346124 ?auto_346132 ) ) ( not ( = ?auto_346124 ?auto_346133 ) ) ( not ( = ?auto_346124 ?auto_346134 ) ) ( not ( = ?auto_346124 ?auto_346135 ) ) ( not ( = ?auto_346125 ?auto_346126 ) ) ( not ( = ?auto_346125 ?auto_346127 ) ) ( not ( = ?auto_346125 ?auto_346128 ) ) ( not ( = ?auto_346125 ?auto_346129 ) ) ( not ( = ?auto_346125 ?auto_346130 ) ) ( not ( = ?auto_346125 ?auto_346131 ) ) ( not ( = ?auto_346125 ?auto_346132 ) ) ( not ( = ?auto_346125 ?auto_346133 ) ) ( not ( = ?auto_346125 ?auto_346134 ) ) ( not ( = ?auto_346125 ?auto_346135 ) ) ( not ( = ?auto_346126 ?auto_346127 ) ) ( not ( = ?auto_346126 ?auto_346128 ) ) ( not ( = ?auto_346126 ?auto_346129 ) ) ( not ( = ?auto_346126 ?auto_346130 ) ) ( not ( = ?auto_346126 ?auto_346131 ) ) ( not ( = ?auto_346126 ?auto_346132 ) ) ( not ( = ?auto_346126 ?auto_346133 ) ) ( not ( = ?auto_346126 ?auto_346134 ) ) ( not ( = ?auto_346126 ?auto_346135 ) ) ( not ( = ?auto_346127 ?auto_346128 ) ) ( not ( = ?auto_346127 ?auto_346129 ) ) ( not ( = ?auto_346127 ?auto_346130 ) ) ( not ( = ?auto_346127 ?auto_346131 ) ) ( not ( = ?auto_346127 ?auto_346132 ) ) ( not ( = ?auto_346127 ?auto_346133 ) ) ( not ( = ?auto_346127 ?auto_346134 ) ) ( not ( = ?auto_346127 ?auto_346135 ) ) ( not ( = ?auto_346128 ?auto_346129 ) ) ( not ( = ?auto_346128 ?auto_346130 ) ) ( not ( = ?auto_346128 ?auto_346131 ) ) ( not ( = ?auto_346128 ?auto_346132 ) ) ( not ( = ?auto_346128 ?auto_346133 ) ) ( not ( = ?auto_346128 ?auto_346134 ) ) ( not ( = ?auto_346128 ?auto_346135 ) ) ( not ( = ?auto_346129 ?auto_346130 ) ) ( not ( = ?auto_346129 ?auto_346131 ) ) ( not ( = ?auto_346129 ?auto_346132 ) ) ( not ( = ?auto_346129 ?auto_346133 ) ) ( not ( = ?auto_346129 ?auto_346134 ) ) ( not ( = ?auto_346129 ?auto_346135 ) ) ( not ( = ?auto_346130 ?auto_346131 ) ) ( not ( = ?auto_346130 ?auto_346132 ) ) ( not ( = ?auto_346130 ?auto_346133 ) ) ( not ( = ?auto_346130 ?auto_346134 ) ) ( not ( = ?auto_346130 ?auto_346135 ) ) ( not ( = ?auto_346131 ?auto_346132 ) ) ( not ( = ?auto_346131 ?auto_346133 ) ) ( not ( = ?auto_346131 ?auto_346134 ) ) ( not ( = ?auto_346131 ?auto_346135 ) ) ( not ( = ?auto_346132 ?auto_346133 ) ) ( not ( = ?auto_346132 ?auto_346134 ) ) ( not ( = ?auto_346132 ?auto_346135 ) ) ( not ( = ?auto_346133 ?auto_346134 ) ) ( not ( = ?auto_346133 ?auto_346135 ) ) ( not ( = ?auto_346134 ?auto_346135 ) ) ( ON ?auto_346133 ?auto_346134 ) ( ON ?auto_346132 ?auto_346133 ) ( ON ?auto_346131 ?auto_346132 ) ( ON ?auto_346130 ?auto_346131 ) ( ON ?auto_346129 ?auto_346130 ) ( ON ?auto_346128 ?auto_346129 ) ( ON ?auto_346127 ?auto_346128 ) ( ON ?auto_346126 ?auto_346127 ) ( CLEAR ?auto_346124 ) ( ON ?auto_346125 ?auto_346126 ) ( CLEAR ?auto_346125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_346123 ?auto_346124 ?auto_346125 )
      ( MAKE-12PILE ?auto_346123 ?auto_346124 ?auto_346125 ?auto_346126 ?auto_346127 ?auto_346128 ?auto_346129 ?auto_346130 ?auto_346131 ?auto_346132 ?auto_346133 ?auto_346134 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_346148 - BLOCK
      ?auto_346149 - BLOCK
      ?auto_346150 - BLOCK
      ?auto_346151 - BLOCK
      ?auto_346152 - BLOCK
      ?auto_346153 - BLOCK
      ?auto_346154 - BLOCK
      ?auto_346155 - BLOCK
      ?auto_346156 - BLOCK
      ?auto_346157 - BLOCK
      ?auto_346158 - BLOCK
      ?auto_346159 - BLOCK
    )
    :vars
    (
      ?auto_346160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346159 ?auto_346160 ) ( ON-TABLE ?auto_346148 ) ( not ( = ?auto_346148 ?auto_346149 ) ) ( not ( = ?auto_346148 ?auto_346150 ) ) ( not ( = ?auto_346148 ?auto_346151 ) ) ( not ( = ?auto_346148 ?auto_346152 ) ) ( not ( = ?auto_346148 ?auto_346153 ) ) ( not ( = ?auto_346148 ?auto_346154 ) ) ( not ( = ?auto_346148 ?auto_346155 ) ) ( not ( = ?auto_346148 ?auto_346156 ) ) ( not ( = ?auto_346148 ?auto_346157 ) ) ( not ( = ?auto_346148 ?auto_346158 ) ) ( not ( = ?auto_346148 ?auto_346159 ) ) ( not ( = ?auto_346148 ?auto_346160 ) ) ( not ( = ?auto_346149 ?auto_346150 ) ) ( not ( = ?auto_346149 ?auto_346151 ) ) ( not ( = ?auto_346149 ?auto_346152 ) ) ( not ( = ?auto_346149 ?auto_346153 ) ) ( not ( = ?auto_346149 ?auto_346154 ) ) ( not ( = ?auto_346149 ?auto_346155 ) ) ( not ( = ?auto_346149 ?auto_346156 ) ) ( not ( = ?auto_346149 ?auto_346157 ) ) ( not ( = ?auto_346149 ?auto_346158 ) ) ( not ( = ?auto_346149 ?auto_346159 ) ) ( not ( = ?auto_346149 ?auto_346160 ) ) ( not ( = ?auto_346150 ?auto_346151 ) ) ( not ( = ?auto_346150 ?auto_346152 ) ) ( not ( = ?auto_346150 ?auto_346153 ) ) ( not ( = ?auto_346150 ?auto_346154 ) ) ( not ( = ?auto_346150 ?auto_346155 ) ) ( not ( = ?auto_346150 ?auto_346156 ) ) ( not ( = ?auto_346150 ?auto_346157 ) ) ( not ( = ?auto_346150 ?auto_346158 ) ) ( not ( = ?auto_346150 ?auto_346159 ) ) ( not ( = ?auto_346150 ?auto_346160 ) ) ( not ( = ?auto_346151 ?auto_346152 ) ) ( not ( = ?auto_346151 ?auto_346153 ) ) ( not ( = ?auto_346151 ?auto_346154 ) ) ( not ( = ?auto_346151 ?auto_346155 ) ) ( not ( = ?auto_346151 ?auto_346156 ) ) ( not ( = ?auto_346151 ?auto_346157 ) ) ( not ( = ?auto_346151 ?auto_346158 ) ) ( not ( = ?auto_346151 ?auto_346159 ) ) ( not ( = ?auto_346151 ?auto_346160 ) ) ( not ( = ?auto_346152 ?auto_346153 ) ) ( not ( = ?auto_346152 ?auto_346154 ) ) ( not ( = ?auto_346152 ?auto_346155 ) ) ( not ( = ?auto_346152 ?auto_346156 ) ) ( not ( = ?auto_346152 ?auto_346157 ) ) ( not ( = ?auto_346152 ?auto_346158 ) ) ( not ( = ?auto_346152 ?auto_346159 ) ) ( not ( = ?auto_346152 ?auto_346160 ) ) ( not ( = ?auto_346153 ?auto_346154 ) ) ( not ( = ?auto_346153 ?auto_346155 ) ) ( not ( = ?auto_346153 ?auto_346156 ) ) ( not ( = ?auto_346153 ?auto_346157 ) ) ( not ( = ?auto_346153 ?auto_346158 ) ) ( not ( = ?auto_346153 ?auto_346159 ) ) ( not ( = ?auto_346153 ?auto_346160 ) ) ( not ( = ?auto_346154 ?auto_346155 ) ) ( not ( = ?auto_346154 ?auto_346156 ) ) ( not ( = ?auto_346154 ?auto_346157 ) ) ( not ( = ?auto_346154 ?auto_346158 ) ) ( not ( = ?auto_346154 ?auto_346159 ) ) ( not ( = ?auto_346154 ?auto_346160 ) ) ( not ( = ?auto_346155 ?auto_346156 ) ) ( not ( = ?auto_346155 ?auto_346157 ) ) ( not ( = ?auto_346155 ?auto_346158 ) ) ( not ( = ?auto_346155 ?auto_346159 ) ) ( not ( = ?auto_346155 ?auto_346160 ) ) ( not ( = ?auto_346156 ?auto_346157 ) ) ( not ( = ?auto_346156 ?auto_346158 ) ) ( not ( = ?auto_346156 ?auto_346159 ) ) ( not ( = ?auto_346156 ?auto_346160 ) ) ( not ( = ?auto_346157 ?auto_346158 ) ) ( not ( = ?auto_346157 ?auto_346159 ) ) ( not ( = ?auto_346157 ?auto_346160 ) ) ( not ( = ?auto_346158 ?auto_346159 ) ) ( not ( = ?auto_346158 ?auto_346160 ) ) ( not ( = ?auto_346159 ?auto_346160 ) ) ( ON ?auto_346158 ?auto_346159 ) ( ON ?auto_346157 ?auto_346158 ) ( ON ?auto_346156 ?auto_346157 ) ( ON ?auto_346155 ?auto_346156 ) ( ON ?auto_346154 ?auto_346155 ) ( ON ?auto_346153 ?auto_346154 ) ( ON ?auto_346152 ?auto_346153 ) ( ON ?auto_346151 ?auto_346152 ) ( ON ?auto_346150 ?auto_346151 ) ( CLEAR ?auto_346148 ) ( ON ?auto_346149 ?auto_346150 ) ( CLEAR ?auto_346149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_346148 ?auto_346149 )
      ( MAKE-12PILE ?auto_346148 ?auto_346149 ?auto_346150 ?auto_346151 ?auto_346152 ?auto_346153 ?auto_346154 ?auto_346155 ?auto_346156 ?auto_346157 ?auto_346158 ?auto_346159 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_346173 - BLOCK
      ?auto_346174 - BLOCK
      ?auto_346175 - BLOCK
      ?auto_346176 - BLOCK
      ?auto_346177 - BLOCK
      ?auto_346178 - BLOCK
      ?auto_346179 - BLOCK
      ?auto_346180 - BLOCK
      ?auto_346181 - BLOCK
      ?auto_346182 - BLOCK
      ?auto_346183 - BLOCK
      ?auto_346184 - BLOCK
    )
    :vars
    (
      ?auto_346185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346184 ?auto_346185 ) ( ON-TABLE ?auto_346173 ) ( not ( = ?auto_346173 ?auto_346174 ) ) ( not ( = ?auto_346173 ?auto_346175 ) ) ( not ( = ?auto_346173 ?auto_346176 ) ) ( not ( = ?auto_346173 ?auto_346177 ) ) ( not ( = ?auto_346173 ?auto_346178 ) ) ( not ( = ?auto_346173 ?auto_346179 ) ) ( not ( = ?auto_346173 ?auto_346180 ) ) ( not ( = ?auto_346173 ?auto_346181 ) ) ( not ( = ?auto_346173 ?auto_346182 ) ) ( not ( = ?auto_346173 ?auto_346183 ) ) ( not ( = ?auto_346173 ?auto_346184 ) ) ( not ( = ?auto_346173 ?auto_346185 ) ) ( not ( = ?auto_346174 ?auto_346175 ) ) ( not ( = ?auto_346174 ?auto_346176 ) ) ( not ( = ?auto_346174 ?auto_346177 ) ) ( not ( = ?auto_346174 ?auto_346178 ) ) ( not ( = ?auto_346174 ?auto_346179 ) ) ( not ( = ?auto_346174 ?auto_346180 ) ) ( not ( = ?auto_346174 ?auto_346181 ) ) ( not ( = ?auto_346174 ?auto_346182 ) ) ( not ( = ?auto_346174 ?auto_346183 ) ) ( not ( = ?auto_346174 ?auto_346184 ) ) ( not ( = ?auto_346174 ?auto_346185 ) ) ( not ( = ?auto_346175 ?auto_346176 ) ) ( not ( = ?auto_346175 ?auto_346177 ) ) ( not ( = ?auto_346175 ?auto_346178 ) ) ( not ( = ?auto_346175 ?auto_346179 ) ) ( not ( = ?auto_346175 ?auto_346180 ) ) ( not ( = ?auto_346175 ?auto_346181 ) ) ( not ( = ?auto_346175 ?auto_346182 ) ) ( not ( = ?auto_346175 ?auto_346183 ) ) ( not ( = ?auto_346175 ?auto_346184 ) ) ( not ( = ?auto_346175 ?auto_346185 ) ) ( not ( = ?auto_346176 ?auto_346177 ) ) ( not ( = ?auto_346176 ?auto_346178 ) ) ( not ( = ?auto_346176 ?auto_346179 ) ) ( not ( = ?auto_346176 ?auto_346180 ) ) ( not ( = ?auto_346176 ?auto_346181 ) ) ( not ( = ?auto_346176 ?auto_346182 ) ) ( not ( = ?auto_346176 ?auto_346183 ) ) ( not ( = ?auto_346176 ?auto_346184 ) ) ( not ( = ?auto_346176 ?auto_346185 ) ) ( not ( = ?auto_346177 ?auto_346178 ) ) ( not ( = ?auto_346177 ?auto_346179 ) ) ( not ( = ?auto_346177 ?auto_346180 ) ) ( not ( = ?auto_346177 ?auto_346181 ) ) ( not ( = ?auto_346177 ?auto_346182 ) ) ( not ( = ?auto_346177 ?auto_346183 ) ) ( not ( = ?auto_346177 ?auto_346184 ) ) ( not ( = ?auto_346177 ?auto_346185 ) ) ( not ( = ?auto_346178 ?auto_346179 ) ) ( not ( = ?auto_346178 ?auto_346180 ) ) ( not ( = ?auto_346178 ?auto_346181 ) ) ( not ( = ?auto_346178 ?auto_346182 ) ) ( not ( = ?auto_346178 ?auto_346183 ) ) ( not ( = ?auto_346178 ?auto_346184 ) ) ( not ( = ?auto_346178 ?auto_346185 ) ) ( not ( = ?auto_346179 ?auto_346180 ) ) ( not ( = ?auto_346179 ?auto_346181 ) ) ( not ( = ?auto_346179 ?auto_346182 ) ) ( not ( = ?auto_346179 ?auto_346183 ) ) ( not ( = ?auto_346179 ?auto_346184 ) ) ( not ( = ?auto_346179 ?auto_346185 ) ) ( not ( = ?auto_346180 ?auto_346181 ) ) ( not ( = ?auto_346180 ?auto_346182 ) ) ( not ( = ?auto_346180 ?auto_346183 ) ) ( not ( = ?auto_346180 ?auto_346184 ) ) ( not ( = ?auto_346180 ?auto_346185 ) ) ( not ( = ?auto_346181 ?auto_346182 ) ) ( not ( = ?auto_346181 ?auto_346183 ) ) ( not ( = ?auto_346181 ?auto_346184 ) ) ( not ( = ?auto_346181 ?auto_346185 ) ) ( not ( = ?auto_346182 ?auto_346183 ) ) ( not ( = ?auto_346182 ?auto_346184 ) ) ( not ( = ?auto_346182 ?auto_346185 ) ) ( not ( = ?auto_346183 ?auto_346184 ) ) ( not ( = ?auto_346183 ?auto_346185 ) ) ( not ( = ?auto_346184 ?auto_346185 ) ) ( ON ?auto_346183 ?auto_346184 ) ( ON ?auto_346182 ?auto_346183 ) ( ON ?auto_346181 ?auto_346182 ) ( ON ?auto_346180 ?auto_346181 ) ( ON ?auto_346179 ?auto_346180 ) ( ON ?auto_346178 ?auto_346179 ) ( ON ?auto_346177 ?auto_346178 ) ( ON ?auto_346176 ?auto_346177 ) ( ON ?auto_346175 ?auto_346176 ) ( CLEAR ?auto_346173 ) ( ON ?auto_346174 ?auto_346175 ) ( CLEAR ?auto_346174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_346173 ?auto_346174 )
      ( MAKE-12PILE ?auto_346173 ?auto_346174 ?auto_346175 ?auto_346176 ?auto_346177 ?auto_346178 ?auto_346179 ?auto_346180 ?auto_346181 ?auto_346182 ?auto_346183 ?auto_346184 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_346198 - BLOCK
      ?auto_346199 - BLOCK
      ?auto_346200 - BLOCK
      ?auto_346201 - BLOCK
      ?auto_346202 - BLOCK
      ?auto_346203 - BLOCK
      ?auto_346204 - BLOCK
      ?auto_346205 - BLOCK
      ?auto_346206 - BLOCK
      ?auto_346207 - BLOCK
      ?auto_346208 - BLOCK
      ?auto_346209 - BLOCK
    )
    :vars
    (
      ?auto_346210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346209 ?auto_346210 ) ( not ( = ?auto_346198 ?auto_346199 ) ) ( not ( = ?auto_346198 ?auto_346200 ) ) ( not ( = ?auto_346198 ?auto_346201 ) ) ( not ( = ?auto_346198 ?auto_346202 ) ) ( not ( = ?auto_346198 ?auto_346203 ) ) ( not ( = ?auto_346198 ?auto_346204 ) ) ( not ( = ?auto_346198 ?auto_346205 ) ) ( not ( = ?auto_346198 ?auto_346206 ) ) ( not ( = ?auto_346198 ?auto_346207 ) ) ( not ( = ?auto_346198 ?auto_346208 ) ) ( not ( = ?auto_346198 ?auto_346209 ) ) ( not ( = ?auto_346198 ?auto_346210 ) ) ( not ( = ?auto_346199 ?auto_346200 ) ) ( not ( = ?auto_346199 ?auto_346201 ) ) ( not ( = ?auto_346199 ?auto_346202 ) ) ( not ( = ?auto_346199 ?auto_346203 ) ) ( not ( = ?auto_346199 ?auto_346204 ) ) ( not ( = ?auto_346199 ?auto_346205 ) ) ( not ( = ?auto_346199 ?auto_346206 ) ) ( not ( = ?auto_346199 ?auto_346207 ) ) ( not ( = ?auto_346199 ?auto_346208 ) ) ( not ( = ?auto_346199 ?auto_346209 ) ) ( not ( = ?auto_346199 ?auto_346210 ) ) ( not ( = ?auto_346200 ?auto_346201 ) ) ( not ( = ?auto_346200 ?auto_346202 ) ) ( not ( = ?auto_346200 ?auto_346203 ) ) ( not ( = ?auto_346200 ?auto_346204 ) ) ( not ( = ?auto_346200 ?auto_346205 ) ) ( not ( = ?auto_346200 ?auto_346206 ) ) ( not ( = ?auto_346200 ?auto_346207 ) ) ( not ( = ?auto_346200 ?auto_346208 ) ) ( not ( = ?auto_346200 ?auto_346209 ) ) ( not ( = ?auto_346200 ?auto_346210 ) ) ( not ( = ?auto_346201 ?auto_346202 ) ) ( not ( = ?auto_346201 ?auto_346203 ) ) ( not ( = ?auto_346201 ?auto_346204 ) ) ( not ( = ?auto_346201 ?auto_346205 ) ) ( not ( = ?auto_346201 ?auto_346206 ) ) ( not ( = ?auto_346201 ?auto_346207 ) ) ( not ( = ?auto_346201 ?auto_346208 ) ) ( not ( = ?auto_346201 ?auto_346209 ) ) ( not ( = ?auto_346201 ?auto_346210 ) ) ( not ( = ?auto_346202 ?auto_346203 ) ) ( not ( = ?auto_346202 ?auto_346204 ) ) ( not ( = ?auto_346202 ?auto_346205 ) ) ( not ( = ?auto_346202 ?auto_346206 ) ) ( not ( = ?auto_346202 ?auto_346207 ) ) ( not ( = ?auto_346202 ?auto_346208 ) ) ( not ( = ?auto_346202 ?auto_346209 ) ) ( not ( = ?auto_346202 ?auto_346210 ) ) ( not ( = ?auto_346203 ?auto_346204 ) ) ( not ( = ?auto_346203 ?auto_346205 ) ) ( not ( = ?auto_346203 ?auto_346206 ) ) ( not ( = ?auto_346203 ?auto_346207 ) ) ( not ( = ?auto_346203 ?auto_346208 ) ) ( not ( = ?auto_346203 ?auto_346209 ) ) ( not ( = ?auto_346203 ?auto_346210 ) ) ( not ( = ?auto_346204 ?auto_346205 ) ) ( not ( = ?auto_346204 ?auto_346206 ) ) ( not ( = ?auto_346204 ?auto_346207 ) ) ( not ( = ?auto_346204 ?auto_346208 ) ) ( not ( = ?auto_346204 ?auto_346209 ) ) ( not ( = ?auto_346204 ?auto_346210 ) ) ( not ( = ?auto_346205 ?auto_346206 ) ) ( not ( = ?auto_346205 ?auto_346207 ) ) ( not ( = ?auto_346205 ?auto_346208 ) ) ( not ( = ?auto_346205 ?auto_346209 ) ) ( not ( = ?auto_346205 ?auto_346210 ) ) ( not ( = ?auto_346206 ?auto_346207 ) ) ( not ( = ?auto_346206 ?auto_346208 ) ) ( not ( = ?auto_346206 ?auto_346209 ) ) ( not ( = ?auto_346206 ?auto_346210 ) ) ( not ( = ?auto_346207 ?auto_346208 ) ) ( not ( = ?auto_346207 ?auto_346209 ) ) ( not ( = ?auto_346207 ?auto_346210 ) ) ( not ( = ?auto_346208 ?auto_346209 ) ) ( not ( = ?auto_346208 ?auto_346210 ) ) ( not ( = ?auto_346209 ?auto_346210 ) ) ( ON ?auto_346208 ?auto_346209 ) ( ON ?auto_346207 ?auto_346208 ) ( ON ?auto_346206 ?auto_346207 ) ( ON ?auto_346205 ?auto_346206 ) ( ON ?auto_346204 ?auto_346205 ) ( ON ?auto_346203 ?auto_346204 ) ( ON ?auto_346202 ?auto_346203 ) ( ON ?auto_346201 ?auto_346202 ) ( ON ?auto_346200 ?auto_346201 ) ( ON ?auto_346199 ?auto_346200 ) ( ON ?auto_346198 ?auto_346199 ) ( CLEAR ?auto_346198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_346198 )
      ( MAKE-12PILE ?auto_346198 ?auto_346199 ?auto_346200 ?auto_346201 ?auto_346202 ?auto_346203 ?auto_346204 ?auto_346205 ?auto_346206 ?auto_346207 ?auto_346208 ?auto_346209 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_346223 - BLOCK
      ?auto_346224 - BLOCK
      ?auto_346225 - BLOCK
      ?auto_346226 - BLOCK
      ?auto_346227 - BLOCK
      ?auto_346228 - BLOCK
      ?auto_346229 - BLOCK
      ?auto_346230 - BLOCK
      ?auto_346231 - BLOCK
      ?auto_346232 - BLOCK
      ?auto_346233 - BLOCK
      ?auto_346234 - BLOCK
    )
    :vars
    (
      ?auto_346235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346234 ?auto_346235 ) ( not ( = ?auto_346223 ?auto_346224 ) ) ( not ( = ?auto_346223 ?auto_346225 ) ) ( not ( = ?auto_346223 ?auto_346226 ) ) ( not ( = ?auto_346223 ?auto_346227 ) ) ( not ( = ?auto_346223 ?auto_346228 ) ) ( not ( = ?auto_346223 ?auto_346229 ) ) ( not ( = ?auto_346223 ?auto_346230 ) ) ( not ( = ?auto_346223 ?auto_346231 ) ) ( not ( = ?auto_346223 ?auto_346232 ) ) ( not ( = ?auto_346223 ?auto_346233 ) ) ( not ( = ?auto_346223 ?auto_346234 ) ) ( not ( = ?auto_346223 ?auto_346235 ) ) ( not ( = ?auto_346224 ?auto_346225 ) ) ( not ( = ?auto_346224 ?auto_346226 ) ) ( not ( = ?auto_346224 ?auto_346227 ) ) ( not ( = ?auto_346224 ?auto_346228 ) ) ( not ( = ?auto_346224 ?auto_346229 ) ) ( not ( = ?auto_346224 ?auto_346230 ) ) ( not ( = ?auto_346224 ?auto_346231 ) ) ( not ( = ?auto_346224 ?auto_346232 ) ) ( not ( = ?auto_346224 ?auto_346233 ) ) ( not ( = ?auto_346224 ?auto_346234 ) ) ( not ( = ?auto_346224 ?auto_346235 ) ) ( not ( = ?auto_346225 ?auto_346226 ) ) ( not ( = ?auto_346225 ?auto_346227 ) ) ( not ( = ?auto_346225 ?auto_346228 ) ) ( not ( = ?auto_346225 ?auto_346229 ) ) ( not ( = ?auto_346225 ?auto_346230 ) ) ( not ( = ?auto_346225 ?auto_346231 ) ) ( not ( = ?auto_346225 ?auto_346232 ) ) ( not ( = ?auto_346225 ?auto_346233 ) ) ( not ( = ?auto_346225 ?auto_346234 ) ) ( not ( = ?auto_346225 ?auto_346235 ) ) ( not ( = ?auto_346226 ?auto_346227 ) ) ( not ( = ?auto_346226 ?auto_346228 ) ) ( not ( = ?auto_346226 ?auto_346229 ) ) ( not ( = ?auto_346226 ?auto_346230 ) ) ( not ( = ?auto_346226 ?auto_346231 ) ) ( not ( = ?auto_346226 ?auto_346232 ) ) ( not ( = ?auto_346226 ?auto_346233 ) ) ( not ( = ?auto_346226 ?auto_346234 ) ) ( not ( = ?auto_346226 ?auto_346235 ) ) ( not ( = ?auto_346227 ?auto_346228 ) ) ( not ( = ?auto_346227 ?auto_346229 ) ) ( not ( = ?auto_346227 ?auto_346230 ) ) ( not ( = ?auto_346227 ?auto_346231 ) ) ( not ( = ?auto_346227 ?auto_346232 ) ) ( not ( = ?auto_346227 ?auto_346233 ) ) ( not ( = ?auto_346227 ?auto_346234 ) ) ( not ( = ?auto_346227 ?auto_346235 ) ) ( not ( = ?auto_346228 ?auto_346229 ) ) ( not ( = ?auto_346228 ?auto_346230 ) ) ( not ( = ?auto_346228 ?auto_346231 ) ) ( not ( = ?auto_346228 ?auto_346232 ) ) ( not ( = ?auto_346228 ?auto_346233 ) ) ( not ( = ?auto_346228 ?auto_346234 ) ) ( not ( = ?auto_346228 ?auto_346235 ) ) ( not ( = ?auto_346229 ?auto_346230 ) ) ( not ( = ?auto_346229 ?auto_346231 ) ) ( not ( = ?auto_346229 ?auto_346232 ) ) ( not ( = ?auto_346229 ?auto_346233 ) ) ( not ( = ?auto_346229 ?auto_346234 ) ) ( not ( = ?auto_346229 ?auto_346235 ) ) ( not ( = ?auto_346230 ?auto_346231 ) ) ( not ( = ?auto_346230 ?auto_346232 ) ) ( not ( = ?auto_346230 ?auto_346233 ) ) ( not ( = ?auto_346230 ?auto_346234 ) ) ( not ( = ?auto_346230 ?auto_346235 ) ) ( not ( = ?auto_346231 ?auto_346232 ) ) ( not ( = ?auto_346231 ?auto_346233 ) ) ( not ( = ?auto_346231 ?auto_346234 ) ) ( not ( = ?auto_346231 ?auto_346235 ) ) ( not ( = ?auto_346232 ?auto_346233 ) ) ( not ( = ?auto_346232 ?auto_346234 ) ) ( not ( = ?auto_346232 ?auto_346235 ) ) ( not ( = ?auto_346233 ?auto_346234 ) ) ( not ( = ?auto_346233 ?auto_346235 ) ) ( not ( = ?auto_346234 ?auto_346235 ) ) ( ON ?auto_346233 ?auto_346234 ) ( ON ?auto_346232 ?auto_346233 ) ( ON ?auto_346231 ?auto_346232 ) ( ON ?auto_346230 ?auto_346231 ) ( ON ?auto_346229 ?auto_346230 ) ( ON ?auto_346228 ?auto_346229 ) ( ON ?auto_346227 ?auto_346228 ) ( ON ?auto_346226 ?auto_346227 ) ( ON ?auto_346225 ?auto_346226 ) ( ON ?auto_346224 ?auto_346225 ) ( ON ?auto_346223 ?auto_346224 ) ( CLEAR ?auto_346223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_346223 )
      ( MAKE-12PILE ?auto_346223 ?auto_346224 ?auto_346225 ?auto_346226 ?auto_346227 ?auto_346228 ?auto_346229 ?auto_346230 ?auto_346231 ?auto_346232 ?auto_346233 ?auto_346234 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_346249 - BLOCK
      ?auto_346250 - BLOCK
      ?auto_346251 - BLOCK
      ?auto_346252 - BLOCK
      ?auto_346253 - BLOCK
      ?auto_346254 - BLOCK
      ?auto_346255 - BLOCK
      ?auto_346256 - BLOCK
      ?auto_346257 - BLOCK
      ?auto_346258 - BLOCK
      ?auto_346259 - BLOCK
      ?auto_346260 - BLOCK
      ?auto_346261 - BLOCK
    )
    :vars
    (
      ?auto_346262 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_346260 ) ( ON ?auto_346261 ?auto_346262 ) ( CLEAR ?auto_346261 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_346249 ) ( ON ?auto_346250 ?auto_346249 ) ( ON ?auto_346251 ?auto_346250 ) ( ON ?auto_346252 ?auto_346251 ) ( ON ?auto_346253 ?auto_346252 ) ( ON ?auto_346254 ?auto_346253 ) ( ON ?auto_346255 ?auto_346254 ) ( ON ?auto_346256 ?auto_346255 ) ( ON ?auto_346257 ?auto_346256 ) ( ON ?auto_346258 ?auto_346257 ) ( ON ?auto_346259 ?auto_346258 ) ( ON ?auto_346260 ?auto_346259 ) ( not ( = ?auto_346249 ?auto_346250 ) ) ( not ( = ?auto_346249 ?auto_346251 ) ) ( not ( = ?auto_346249 ?auto_346252 ) ) ( not ( = ?auto_346249 ?auto_346253 ) ) ( not ( = ?auto_346249 ?auto_346254 ) ) ( not ( = ?auto_346249 ?auto_346255 ) ) ( not ( = ?auto_346249 ?auto_346256 ) ) ( not ( = ?auto_346249 ?auto_346257 ) ) ( not ( = ?auto_346249 ?auto_346258 ) ) ( not ( = ?auto_346249 ?auto_346259 ) ) ( not ( = ?auto_346249 ?auto_346260 ) ) ( not ( = ?auto_346249 ?auto_346261 ) ) ( not ( = ?auto_346249 ?auto_346262 ) ) ( not ( = ?auto_346250 ?auto_346251 ) ) ( not ( = ?auto_346250 ?auto_346252 ) ) ( not ( = ?auto_346250 ?auto_346253 ) ) ( not ( = ?auto_346250 ?auto_346254 ) ) ( not ( = ?auto_346250 ?auto_346255 ) ) ( not ( = ?auto_346250 ?auto_346256 ) ) ( not ( = ?auto_346250 ?auto_346257 ) ) ( not ( = ?auto_346250 ?auto_346258 ) ) ( not ( = ?auto_346250 ?auto_346259 ) ) ( not ( = ?auto_346250 ?auto_346260 ) ) ( not ( = ?auto_346250 ?auto_346261 ) ) ( not ( = ?auto_346250 ?auto_346262 ) ) ( not ( = ?auto_346251 ?auto_346252 ) ) ( not ( = ?auto_346251 ?auto_346253 ) ) ( not ( = ?auto_346251 ?auto_346254 ) ) ( not ( = ?auto_346251 ?auto_346255 ) ) ( not ( = ?auto_346251 ?auto_346256 ) ) ( not ( = ?auto_346251 ?auto_346257 ) ) ( not ( = ?auto_346251 ?auto_346258 ) ) ( not ( = ?auto_346251 ?auto_346259 ) ) ( not ( = ?auto_346251 ?auto_346260 ) ) ( not ( = ?auto_346251 ?auto_346261 ) ) ( not ( = ?auto_346251 ?auto_346262 ) ) ( not ( = ?auto_346252 ?auto_346253 ) ) ( not ( = ?auto_346252 ?auto_346254 ) ) ( not ( = ?auto_346252 ?auto_346255 ) ) ( not ( = ?auto_346252 ?auto_346256 ) ) ( not ( = ?auto_346252 ?auto_346257 ) ) ( not ( = ?auto_346252 ?auto_346258 ) ) ( not ( = ?auto_346252 ?auto_346259 ) ) ( not ( = ?auto_346252 ?auto_346260 ) ) ( not ( = ?auto_346252 ?auto_346261 ) ) ( not ( = ?auto_346252 ?auto_346262 ) ) ( not ( = ?auto_346253 ?auto_346254 ) ) ( not ( = ?auto_346253 ?auto_346255 ) ) ( not ( = ?auto_346253 ?auto_346256 ) ) ( not ( = ?auto_346253 ?auto_346257 ) ) ( not ( = ?auto_346253 ?auto_346258 ) ) ( not ( = ?auto_346253 ?auto_346259 ) ) ( not ( = ?auto_346253 ?auto_346260 ) ) ( not ( = ?auto_346253 ?auto_346261 ) ) ( not ( = ?auto_346253 ?auto_346262 ) ) ( not ( = ?auto_346254 ?auto_346255 ) ) ( not ( = ?auto_346254 ?auto_346256 ) ) ( not ( = ?auto_346254 ?auto_346257 ) ) ( not ( = ?auto_346254 ?auto_346258 ) ) ( not ( = ?auto_346254 ?auto_346259 ) ) ( not ( = ?auto_346254 ?auto_346260 ) ) ( not ( = ?auto_346254 ?auto_346261 ) ) ( not ( = ?auto_346254 ?auto_346262 ) ) ( not ( = ?auto_346255 ?auto_346256 ) ) ( not ( = ?auto_346255 ?auto_346257 ) ) ( not ( = ?auto_346255 ?auto_346258 ) ) ( not ( = ?auto_346255 ?auto_346259 ) ) ( not ( = ?auto_346255 ?auto_346260 ) ) ( not ( = ?auto_346255 ?auto_346261 ) ) ( not ( = ?auto_346255 ?auto_346262 ) ) ( not ( = ?auto_346256 ?auto_346257 ) ) ( not ( = ?auto_346256 ?auto_346258 ) ) ( not ( = ?auto_346256 ?auto_346259 ) ) ( not ( = ?auto_346256 ?auto_346260 ) ) ( not ( = ?auto_346256 ?auto_346261 ) ) ( not ( = ?auto_346256 ?auto_346262 ) ) ( not ( = ?auto_346257 ?auto_346258 ) ) ( not ( = ?auto_346257 ?auto_346259 ) ) ( not ( = ?auto_346257 ?auto_346260 ) ) ( not ( = ?auto_346257 ?auto_346261 ) ) ( not ( = ?auto_346257 ?auto_346262 ) ) ( not ( = ?auto_346258 ?auto_346259 ) ) ( not ( = ?auto_346258 ?auto_346260 ) ) ( not ( = ?auto_346258 ?auto_346261 ) ) ( not ( = ?auto_346258 ?auto_346262 ) ) ( not ( = ?auto_346259 ?auto_346260 ) ) ( not ( = ?auto_346259 ?auto_346261 ) ) ( not ( = ?auto_346259 ?auto_346262 ) ) ( not ( = ?auto_346260 ?auto_346261 ) ) ( not ( = ?auto_346260 ?auto_346262 ) ) ( not ( = ?auto_346261 ?auto_346262 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_346261 ?auto_346262 )
      ( !STACK ?auto_346261 ?auto_346260 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_346276 - BLOCK
      ?auto_346277 - BLOCK
      ?auto_346278 - BLOCK
      ?auto_346279 - BLOCK
      ?auto_346280 - BLOCK
      ?auto_346281 - BLOCK
      ?auto_346282 - BLOCK
      ?auto_346283 - BLOCK
      ?auto_346284 - BLOCK
      ?auto_346285 - BLOCK
      ?auto_346286 - BLOCK
      ?auto_346287 - BLOCK
      ?auto_346288 - BLOCK
    )
    :vars
    (
      ?auto_346289 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_346287 ) ( ON ?auto_346288 ?auto_346289 ) ( CLEAR ?auto_346288 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_346276 ) ( ON ?auto_346277 ?auto_346276 ) ( ON ?auto_346278 ?auto_346277 ) ( ON ?auto_346279 ?auto_346278 ) ( ON ?auto_346280 ?auto_346279 ) ( ON ?auto_346281 ?auto_346280 ) ( ON ?auto_346282 ?auto_346281 ) ( ON ?auto_346283 ?auto_346282 ) ( ON ?auto_346284 ?auto_346283 ) ( ON ?auto_346285 ?auto_346284 ) ( ON ?auto_346286 ?auto_346285 ) ( ON ?auto_346287 ?auto_346286 ) ( not ( = ?auto_346276 ?auto_346277 ) ) ( not ( = ?auto_346276 ?auto_346278 ) ) ( not ( = ?auto_346276 ?auto_346279 ) ) ( not ( = ?auto_346276 ?auto_346280 ) ) ( not ( = ?auto_346276 ?auto_346281 ) ) ( not ( = ?auto_346276 ?auto_346282 ) ) ( not ( = ?auto_346276 ?auto_346283 ) ) ( not ( = ?auto_346276 ?auto_346284 ) ) ( not ( = ?auto_346276 ?auto_346285 ) ) ( not ( = ?auto_346276 ?auto_346286 ) ) ( not ( = ?auto_346276 ?auto_346287 ) ) ( not ( = ?auto_346276 ?auto_346288 ) ) ( not ( = ?auto_346276 ?auto_346289 ) ) ( not ( = ?auto_346277 ?auto_346278 ) ) ( not ( = ?auto_346277 ?auto_346279 ) ) ( not ( = ?auto_346277 ?auto_346280 ) ) ( not ( = ?auto_346277 ?auto_346281 ) ) ( not ( = ?auto_346277 ?auto_346282 ) ) ( not ( = ?auto_346277 ?auto_346283 ) ) ( not ( = ?auto_346277 ?auto_346284 ) ) ( not ( = ?auto_346277 ?auto_346285 ) ) ( not ( = ?auto_346277 ?auto_346286 ) ) ( not ( = ?auto_346277 ?auto_346287 ) ) ( not ( = ?auto_346277 ?auto_346288 ) ) ( not ( = ?auto_346277 ?auto_346289 ) ) ( not ( = ?auto_346278 ?auto_346279 ) ) ( not ( = ?auto_346278 ?auto_346280 ) ) ( not ( = ?auto_346278 ?auto_346281 ) ) ( not ( = ?auto_346278 ?auto_346282 ) ) ( not ( = ?auto_346278 ?auto_346283 ) ) ( not ( = ?auto_346278 ?auto_346284 ) ) ( not ( = ?auto_346278 ?auto_346285 ) ) ( not ( = ?auto_346278 ?auto_346286 ) ) ( not ( = ?auto_346278 ?auto_346287 ) ) ( not ( = ?auto_346278 ?auto_346288 ) ) ( not ( = ?auto_346278 ?auto_346289 ) ) ( not ( = ?auto_346279 ?auto_346280 ) ) ( not ( = ?auto_346279 ?auto_346281 ) ) ( not ( = ?auto_346279 ?auto_346282 ) ) ( not ( = ?auto_346279 ?auto_346283 ) ) ( not ( = ?auto_346279 ?auto_346284 ) ) ( not ( = ?auto_346279 ?auto_346285 ) ) ( not ( = ?auto_346279 ?auto_346286 ) ) ( not ( = ?auto_346279 ?auto_346287 ) ) ( not ( = ?auto_346279 ?auto_346288 ) ) ( not ( = ?auto_346279 ?auto_346289 ) ) ( not ( = ?auto_346280 ?auto_346281 ) ) ( not ( = ?auto_346280 ?auto_346282 ) ) ( not ( = ?auto_346280 ?auto_346283 ) ) ( not ( = ?auto_346280 ?auto_346284 ) ) ( not ( = ?auto_346280 ?auto_346285 ) ) ( not ( = ?auto_346280 ?auto_346286 ) ) ( not ( = ?auto_346280 ?auto_346287 ) ) ( not ( = ?auto_346280 ?auto_346288 ) ) ( not ( = ?auto_346280 ?auto_346289 ) ) ( not ( = ?auto_346281 ?auto_346282 ) ) ( not ( = ?auto_346281 ?auto_346283 ) ) ( not ( = ?auto_346281 ?auto_346284 ) ) ( not ( = ?auto_346281 ?auto_346285 ) ) ( not ( = ?auto_346281 ?auto_346286 ) ) ( not ( = ?auto_346281 ?auto_346287 ) ) ( not ( = ?auto_346281 ?auto_346288 ) ) ( not ( = ?auto_346281 ?auto_346289 ) ) ( not ( = ?auto_346282 ?auto_346283 ) ) ( not ( = ?auto_346282 ?auto_346284 ) ) ( not ( = ?auto_346282 ?auto_346285 ) ) ( not ( = ?auto_346282 ?auto_346286 ) ) ( not ( = ?auto_346282 ?auto_346287 ) ) ( not ( = ?auto_346282 ?auto_346288 ) ) ( not ( = ?auto_346282 ?auto_346289 ) ) ( not ( = ?auto_346283 ?auto_346284 ) ) ( not ( = ?auto_346283 ?auto_346285 ) ) ( not ( = ?auto_346283 ?auto_346286 ) ) ( not ( = ?auto_346283 ?auto_346287 ) ) ( not ( = ?auto_346283 ?auto_346288 ) ) ( not ( = ?auto_346283 ?auto_346289 ) ) ( not ( = ?auto_346284 ?auto_346285 ) ) ( not ( = ?auto_346284 ?auto_346286 ) ) ( not ( = ?auto_346284 ?auto_346287 ) ) ( not ( = ?auto_346284 ?auto_346288 ) ) ( not ( = ?auto_346284 ?auto_346289 ) ) ( not ( = ?auto_346285 ?auto_346286 ) ) ( not ( = ?auto_346285 ?auto_346287 ) ) ( not ( = ?auto_346285 ?auto_346288 ) ) ( not ( = ?auto_346285 ?auto_346289 ) ) ( not ( = ?auto_346286 ?auto_346287 ) ) ( not ( = ?auto_346286 ?auto_346288 ) ) ( not ( = ?auto_346286 ?auto_346289 ) ) ( not ( = ?auto_346287 ?auto_346288 ) ) ( not ( = ?auto_346287 ?auto_346289 ) ) ( not ( = ?auto_346288 ?auto_346289 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_346288 ?auto_346289 )
      ( !STACK ?auto_346288 ?auto_346287 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_346303 - BLOCK
      ?auto_346304 - BLOCK
      ?auto_346305 - BLOCK
      ?auto_346306 - BLOCK
      ?auto_346307 - BLOCK
      ?auto_346308 - BLOCK
      ?auto_346309 - BLOCK
      ?auto_346310 - BLOCK
      ?auto_346311 - BLOCK
      ?auto_346312 - BLOCK
      ?auto_346313 - BLOCK
      ?auto_346314 - BLOCK
      ?auto_346315 - BLOCK
    )
    :vars
    (
      ?auto_346316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346315 ?auto_346316 ) ( ON-TABLE ?auto_346303 ) ( ON ?auto_346304 ?auto_346303 ) ( ON ?auto_346305 ?auto_346304 ) ( ON ?auto_346306 ?auto_346305 ) ( ON ?auto_346307 ?auto_346306 ) ( ON ?auto_346308 ?auto_346307 ) ( ON ?auto_346309 ?auto_346308 ) ( ON ?auto_346310 ?auto_346309 ) ( ON ?auto_346311 ?auto_346310 ) ( ON ?auto_346312 ?auto_346311 ) ( ON ?auto_346313 ?auto_346312 ) ( not ( = ?auto_346303 ?auto_346304 ) ) ( not ( = ?auto_346303 ?auto_346305 ) ) ( not ( = ?auto_346303 ?auto_346306 ) ) ( not ( = ?auto_346303 ?auto_346307 ) ) ( not ( = ?auto_346303 ?auto_346308 ) ) ( not ( = ?auto_346303 ?auto_346309 ) ) ( not ( = ?auto_346303 ?auto_346310 ) ) ( not ( = ?auto_346303 ?auto_346311 ) ) ( not ( = ?auto_346303 ?auto_346312 ) ) ( not ( = ?auto_346303 ?auto_346313 ) ) ( not ( = ?auto_346303 ?auto_346314 ) ) ( not ( = ?auto_346303 ?auto_346315 ) ) ( not ( = ?auto_346303 ?auto_346316 ) ) ( not ( = ?auto_346304 ?auto_346305 ) ) ( not ( = ?auto_346304 ?auto_346306 ) ) ( not ( = ?auto_346304 ?auto_346307 ) ) ( not ( = ?auto_346304 ?auto_346308 ) ) ( not ( = ?auto_346304 ?auto_346309 ) ) ( not ( = ?auto_346304 ?auto_346310 ) ) ( not ( = ?auto_346304 ?auto_346311 ) ) ( not ( = ?auto_346304 ?auto_346312 ) ) ( not ( = ?auto_346304 ?auto_346313 ) ) ( not ( = ?auto_346304 ?auto_346314 ) ) ( not ( = ?auto_346304 ?auto_346315 ) ) ( not ( = ?auto_346304 ?auto_346316 ) ) ( not ( = ?auto_346305 ?auto_346306 ) ) ( not ( = ?auto_346305 ?auto_346307 ) ) ( not ( = ?auto_346305 ?auto_346308 ) ) ( not ( = ?auto_346305 ?auto_346309 ) ) ( not ( = ?auto_346305 ?auto_346310 ) ) ( not ( = ?auto_346305 ?auto_346311 ) ) ( not ( = ?auto_346305 ?auto_346312 ) ) ( not ( = ?auto_346305 ?auto_346313 ) ) ( not ( = ?auto_346305 ?auto_346314 ) ) ( not ( = ?auto_346305 ?auto_346315 ) ) ( not ( = ?auto_346305 ?auto_346316 ) ) ( not ( = ?auto_346306 ?auto_346307 ) ) ( not ( = ?auto_346306 ?auto_346308 ) ) ( not ( = ?auto_346306 ?auto_346309 ) ) ( not ( = ?auto_346306 ?auto_346310 ) ) ( not ( = ?auto_346306 ?auto_346311 ) ) ( not ( = ?auto_346306 ?auto_346312 ) ) ( not ( = ?auto_346306 ?auto_346313 ) ) ( not ( = ?auto_346306 ?auto_346314 ) ) ( not ( = ?auto_346306 ?auto_346315 ) ) ( not ( = ?auto_346306 ?auto_346316 ) ) ( not ( = ?auto_346307 ?auto_346308 ) ) ( not ( = ?auto_346307 ?auto_346309 ) ) ( not ( = ?auto_346307 ?auto_346310 ) ) ( not ( = ?auto_346307 ?auto_346311 ) ) ( not ( = ?auto_346307 ?auto_346312 ) ) ( not ( = ?auto_346307 ?auto_346313 ) ) ( not ( = ?auto_346307 ?auto_346314 ) ) ( not ( = ?auto_346307 ?auto_346315 ) ) ( not ( = ?auto_346307 ?auto_346316 ) ) ( not ( = ?auto_346308 ?auto_346309 ) ) ( not ( = ?auto_346308 ?auto_346310 ) ) ( not ( = ?auto_346308 ?auto_346311 ) ) ( not ( = ?auto_346308 ?auto_346312 ) ) ( not ( = ?auto_346308 ?auto_346313 ) ) ( not ( = ?auto_346308 ?auto_346314 ) ) ( not ( = ?auto_346308 ?auto_346315 ) ) ( not ( = ?auto_346308 ?auto_346316 ) ) ( not ( = ?auto_346309 ?auto_346310 ) ) ( not ( = ?auto_346309 ?auto_346311 ) ) ( not ( = ?auto_346309 ?auto_346312 ) ) ( not ( = ?auto_346309 ?auto_346313 ) ) ( not ( = ?auto_346309 ?auto_346314 ) ) ( not ( = ?auto_346309 ?auto_346315 ) ) ( not ( = ?auto_346309 ?auto_346316 ) ) ( not ( = ?auto_346310 ?auto_346311 ) ) ( not ( = ?auto_346310 ?auto_346312 ) ) ( not ( = ?auto_346310 ?auto_346313 ) ) ( not ( = ?auto_346310 ?auto_346314 ) ) ( not ( = ?auto_346310 ?auto_346315 ) ) ( not ( = ?auto_346310 ?auto_346316 ) ) ( not ( = ?auto_346311 ?auto_346312 ) ) ( not ( = ?auto_346311 ?auto_346313 ) ) ( not ( = ?auto_346311 ?auto_346314 ) ) ( not ( = ?auto_346311 ?auto_346315 ) ) ( not ( = ?auto_346311 ?auto_346316 ) ) ( not ( = ?auto_346312 ?auto_346313 ) ) ( not ( = ?auto_346312 ?auto_346314 ) ) ( not ( = ?auto_346312 ?auto_346315 ) ) ( not ( = ?auto_346312 ?auto_346316 ) ) ( not ( = ?auto_346313 ?auto_346314 ) ) ( not ( = ?auto_346313 ?auto_346315 ) ) ( not ( = ?auto_346313 ?auto_346316 ) ) ( not ( = ?auto_346314 ?auto_346315 ) ) ( not ( = ?auto_346314 ?auto_346316 ) ) ( not ( = ?auto_346315 ?auto_346316 ) ) ( CLEAR ?auto_346313 ) ( ON ?auto_346314 ?auto_346315 ) ( CLEAR ?auto_346314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_346303 ?auto_346304 ?auto_346305 ?auto_346306 ?auto_346307 ?auto_346308 ?auto_346309 ?auto_346310 ?auto_346311 ?auto_346312 ?auto_346313 ?auto_346314 )
      ( MAKE-13PILE ?auto_346303 ?auto_346304 ?auto_346305 ?auto_346306 ?auto_346307 ?auto_346308 ?auto_346309 ?auto_346310 ?auto_346311 ?auto_346312 ?auto_346313 ?auto_346314 ?auto_346315 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_346330 - BLOCK
      ?auto_346331 - BLOCK
      ?auto_346332 - BLOCK
      ?auto_346333 - BLOCK
      ?auto_346334 - BLOCK
      ?auto_346335 - BLOCK
      ?auto_346336 - BLOCK
      ?auto_346337 - BLOCK
      ?auto_346338 - BLOCK
      ?auto_346339 - BLOCK
      ?auto_346340 - BLOCK
      ?auto_346341 - BLOCK
      ?auto_346342 - BLOCK
    )
    :vars
    (
      ?auto_346343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346342 ?auto_346343 ) ( ON-TABLE ?auto_346330 ) ( ON ?auto_346331 ?auto_346330 ) ( ON ?auto_346332 ?auto_346331 ) ( ON ?auto_346333 ?auto_346332 ) ( ON ?auto_346334 ?auto_346333 ) ( ON ?auto_346335 ?auto_346334 ) ( ON ?auto_346336 ?auto_346335 ) ( ON ?auto_346337 ?auto_346336 ) ( ON ?auto_346338 ?auto_346337 ) ( ON ?auto_346339 ?auto_346338 ) ( ON ?auto_346340 ?auto_346339 ) ( not ( = ?auto_346330 ?auto_346331 ) ) ( not ( = ?auto_346330 ?auto_346332 ) ) ( not ( = ?auto_346330 ?auto_346333 ) ) ( not ( = ?auto_346330 ?auto_346334 ) ) ( not ( = ?auto_346330 ?auto_346335 ) ) ( not ( = ?auto_346330 ?auto_346336 ) ) ( not ( = ?auto_346330 ?auto_346337 ) ) ( not ( = ?auto_346330 ?auto_346338 ) ) ( not ( = ?auto_346330 ?auto_346339 ) ) ( not ( = ?auto_346330 ?auto_346340 ) ) ( not ( = ?auto_346330 ?auto_346341 ) ) ( not ( = ?auto_346330 ?auto_346342 ) ) ( not ( = ?auto_346330 ?auto_346343 ) ) ( not ( = ?auto_346331 ?auto_346332 ) ) ( not ( = ?auto_346331 ?auto_346333 ) ) ( not ( = ?auto_346331 ?auto_346334 ) ) ( not ( = ?auto_346331 ?auto_346335 ) ) ( not ( = ?auto_346331 ?auto_346336 ) ) ( not ( = ?auto_346331 ?auto_346337 ) ) ( not ( = ?auto_346331 ?auto_346338 ) ) ( not ( = ?auto_346331 ?auto_346339 ) ) ( not ( = ?auto_346331 ?auto_346340 ) ) ( not ( = ?auto_346331 ?auto_346341 ) ) ( not ( = ?auto_346331 ?auto_346342 ) ) ( not ( = ?auto_346331 ?auto_346343 ) ) ( not ( = ?auto_346332 ?auto_346333 ) ) ( not ( = ?auto_346332 ?auto_346334 ) ) ( not ( = ?auto_346332 ?auto_346335 ) ) ( not ( = ?auto_346332 ?auto_346336 ) ) ( not ( = ?auto_346332 ?auto_346337 ) ) ( not ( = ?auto_346332 ?auto_346338 ) ) ( not ( = ?auto_346332 ?auto_346339 ) ) ( not ( = ?auto_346332 ?auto_346340 ) ) ( not ( = ?auto_346332 ?auto_346341 ) ) ( not ( = ?auto_346332 ?auto_346342 ) ) ( not ( = ?auto_346332 ?auto_346343 ) ) ( not ( = ?auto_346333 ?auto_346334 ) ) ( not ( = ?auto_346333 ?auto_346335 ) ) ( not ( = ?auto_346333 ?auto_346336 ) ) ( not ( = ?auto_346333 ?auto_346337 ) ) ( not ( = ?auto_346333 ?auto_346338 ) ) ( not ( = ?auto_346333 ?auto_346339 ) ) ( not ( = ?auto_346333 ?auto_346340 ) ) ( not ( = ?auto_346333 ?auto_346341 ) ) ( not ( = ?auto_346333 ?auto_346342 ) ) ( not ( = ?auto_346333 ?auto_346343 ) ) ( not ( = ?auto_346334 ?auto_346335 ) ) ( not ( = ?auto_346334 ?auto_346336 ) ) ( not ( = ?auto_346334 ?auto_346337 ) ) ( not ( = ?auto_346334 ?auto_346338 ) ) ( not ( = ?auto_346334 ?auto_346339 ) ) ( not ( = ?auto_346334 ?auto_346340 ) ) ( not ( = ?auto_346334 ?auto_346341 ) ) ( not ( = ?auto_346334 ?auto_346342 ) ) ( not ( = ?auto_346334 ?auto_346343 ) ) ( not ( = ?auto_346335 ?auto_346336 ) ) ( not ( = ?auto_346335 ?auto_346337 ) ) ( not ( = ?auto_346335 ?auto_346338 ) ) ( not ( = ?auto_346335 ?auto_346339 ) ) ( not ( = ?auto_346335 ?auto_346340 ) ) ( not ( = ?auto_346335 ?auto_346341 ) ) ( not ( = ?auto_346335 ?auto_346342 ) ) ( not ( = ?auto_346335 ?auto_346343 ) ) ( not ( = ?auto_346336 ?auto_346337 ) ) ( not ( = ?auto_346336 ?auto_346338 ) ) ( not ( = ?auto_346336 ?auto_346339 ) ) ( not ( = ?auto_346336 ?auto_346340 ) ) ( not ( = ?auto_346336 ?auto_346341 ) ) ( not ( = ?auto_346336 ?auto_346342 ) ) ( not ( = ?auto_346336 ?auto_346343 ) ) ( not ( = ?auto_346337 ?auto_346338 ) ) ( not ( = ?auto_346337 ?auto_346339 ) ) ( not ( = ?auto_346337 ?auto_346340 ) ) ( not ( = ?auto_346337 ?auto_346341 ) ) ( not ( = ?auto_346337 ?auto_346342 ) ) ( not ( = ?auto_346337 ?auto_346343 ) ) ( not ( = ?auto_346338 ?auto_346339 ) ) ( not ( = ?auto_346338 ?auto_346340 ) ) ( not ( = ?auto_346338 ?auto_346341 ) ) ( not ( = ?auto_346338 ?auto_346342 ) ) ( not ( = ?auto_346338 ?auto_346343 ) ) ( not ( = ?auto_346339 ?auto_346340 ) ) ( not ( = ?auto_346339 ?auto_346341 ) ) ( not ( = ?auto_346339 ?auto_346342 ) ) ( not ( = ?auto_346339 ?auto_346343 ) ) ( not ( = ?auto_346340 ?auto_346341 ) ) ( not ( = ?auto_346340 ?auto_346342 ) ) ( not ( = ?auto_346340 ?auto_346343 ) ) ( not ( = ?auto_346341 ?auto_346342 ) ) ( not ( = ?auto_346341 ?auto_346343 ) ) ( not ( = ?auto_346342 ?auto_346343 ) ) ( CLEAR ?auto_346340 ) ( ON ?auto_346341 ?auto_346342 ) ( CLEAR ?auto_346341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_346330 ?auto_346331 ?auto_346332 ?auto_346333 ?auto_346334 ?auto_346335 ?auto_346336 ?auto_346337 ?auto_346338 ?auto_346339 ?auto_346340 ?auto_346341 )
      ( MAKE-13PILE ?auto_346330 ?auto_346331 ?auto_346332 ?auto_346333 ?auto_346334 ?auto_346335 ?auto_346336 ?auto_346337 ?auto_346338 ?auto_346339 ?auto_346340 ?auto_346341 ?auto_346342 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_346357 - BLOCK
      ?auto_346358 - BLOCK
      ?auto_346359 - BLOCK
      ?auto_346360 - BLOCK
      ?auto_346361 - BLOCK
      ?auto_346362 - BLOCK
      ?auto_346363 - BLOCK
      ?auto_346364 - BLOCK
      ?auto_346365 - BLOCK
      ?auto_346366 - BLOCK
      ?auto_346367 - BLOCK
      ?auto_346368 - BLOCK
      ?auto_346369 - BLOCK
    )
    :vars
    (
      ?auto_346370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346369 ?auto_346370 ) ( ON-TABLE ?auto_346357 ) ( ON ?auto_346358 ?auto_346357 ) ( ON ?auto_346359 ?auto_346358 ) ( ON ?auto_346360 ?auto_346359 ) ( ON ?auto_346361 ?auto_346360 ) ( ON ?auto_346362 ?auto_346361 ) ( ON ?auto_346363 ?auto_346362 ) ( ON ?auto_346364 ?auto_346363 ) ( ON ?auto_346365 ?auto_346364 ) ( ON ?auto_346366 ?auto_346365 ) ( not ( = ?auto_346357 ?auto_346358 ) ) ( not ( = ?auto_346357 ?auto_346359 ) ) ( not ( = ?auto_346357 ?auto_346360 ) ) ( not ( = ?auto_346357 ?auto_346361 ) ) ( not ( = ?auto_346357 ?auto_346362 ) ) ( not ( = ?auto_346357 ?auto_346363 ) ) ( not ( = ?auto_346357 ?auto_346364 ) ) ( not ( = ?auto_346357 ?auto_346365 ) ) ( not ( = ?auto_346357 ?auto_346366 ) ) ( not ( = ?auto_346357 ?auto_346367 ) ) ( not ( = ?auto_346357 ?auto_346368 ) ) ( not ( = ?auto_346357 ?auto_346369 ) ) ( not ( = ?auto_346357 ?auto_346370 ) ) ( not ( = ?auto_346358 ?auto_346359 ) ) ( not ( = ?auto_346358 ?auto_346360 ) ) ( not ( = ?auto_346358 ?auto_346361 ) ) ( not ( = ?auto_346358 ?auto_346362 ) ) ( not ( = ?auto_346358 ?auto_346363 ) ) ( not ( = ?auto_346358 ?auto_346364 ) ) ( not ( = ?auto_346358 ?auto_346365 ) ) ( not ( = ?auto_346358 ?auto_346366 ) ) ( not ( = ?auto_346358 ?auto_346367 ) ) ( not ( = ?auto_346358 ?auto_346368 ) ) ( not ( = ?auto_346358 ?auto_346369 ) ) ( not ( = ?auto_346358 ?auto_346370 ) ) ( not ( = ?auto_346359 ?auto_346360 ) ) ( not ( = ?auto_346359 ?auto_346361 ) ) ( not ( = ?auto_346359 ?auto_346362 ) ) ( not ( = ?auto_346359 ?auto_346363 ) ) ( not ( = ?auto_346359 ?auto_346364 ) ) ( not ( = ?auto_346359 ?auto_346365 ) ) ( not ( = ?auto_346359 ?auto_346366 ) ) ( not ( = ?auto_346359 ?auto_346367 ) ) ( not ( = ?auto_346359 ?auto_346368 ) ) ( not ( = ?auto_346359 ?auto_346369 ) ) ( not ( = ?auto_346359 ?auto_346370 ) ) ( not ( = ?auto_346360 ?auto_346361 ) ) ( not ( = ?auto_346360 ?auto_346362 ) ) ( not ( = ?auto_346360 ?auto_346363 ) ) ( not ( = ?auto_346360 ?auto_346364 ) ) ( not ( = ?auto_346360 ?auto_346365 ) ) ( not ( = ?auto_346360 ?auto_346366 ) ) ( not ( = ?auto_346360 ?auto_346367 ) ) ( not ( = ?auto_346360 ?auto_346368 ) ) ( not ( = ?auto_346360 ?auto_346369 ) ) ( not ( = ?auto_346360 ?auto_346370 ) ) ( not ( = ?auto_346361 ?auto_346362 ) ) ( not ( = ?auto_346361 ?auto_346363 ) ) ( not ( = ?auto_346361 ?auto_346364 ) ) ( not ( = ?auto_346361 ?auto_346365 ) ) ( not ( = ?auto_346361 ?auto_346366 ) ) ( not ( = ?auto_346361 ?auto_346367 ) ) ( not ( = ?auto_346361 ?auto_346368 ) ) ( not ( = ?auto_346361 ?auto_346369 ) ) ( not ( = ?auto_346361 ?auto_346370 ) ) ( not ( = ?auto_346362 ?auto_346363 ) ) ( not ( = ?auto_346362 ?auto_346364 ) ) ( not ( = ?auto_346362 ?auto_346365 ) ) ( not ( = ?auto_346362 ?auto_346366 ) ) ( not ( = ?auto_346362 ?auto_346367 ) ) ( not ( = ?auto_346362 ?auto_346368 ) ) ( not ( = ?auto_346362 ?auto_346369 ) ) ( not ( = ?auto_346362 ?auto_346370 ) ) ( not ( = ?auto_346363 ?auto_346364 ) ) ( not ( = ?auto_346363 ?auto_346365 ) ) ( not ( = ?auto_346363 ?auto_346366 ) ) ( not ( = ?auto_346363 ?auto_346367 ) ) ( not ( = ?auto_346363 ?auto_346368 ) ) ( not ( = ?auto_346363 ?auto_346369 ) ) ( not ( = ?auto_346363 ?auto_346370 ) ) ( not ( = ?auto_346364 ?auto_346365 ) ) ( not ( = ?auto_346364 ?auto_346366 ) ) ( not ( = ?auto_346364 ?auto_346367 ) ) ( not ( = ?auto_346364 ?auto_346368 ) ) ( not ( = ?auto_346364 ?auto_346369 ) ) ( not ( = ?auto_346364 ?auto_346370 ) ) ( not ( = ?auto_346365 ?auto_346366 ) ) ( not ( = ?auto_346365 ?auto_346367 ) ) ( not ( = ?auto_346365 ?auto_346368 ) ) ( not ( = ?auto_346365 ?auto_346369 ) ) ( not ( = ?auto_346365 ?auto_346370 ) ) ( not ( = ?auto_346366 ?auto_346367 ) ) ( not ( = ?auto_346366 ?auto_346368 ) ) ( not ( = ?auto_346366 ?auto_346369 ) ) ( not ( = ?auto_346366 ?auto_346370 ) ) ( not ( = ?auto_346367 ?auto_346368 ) ) ( not ( = ?auto_346367 ?auto_346369 ) ) ( not ( = ?auto_346367 ?auto_346370 ) ) ( not ( = ?auto_346368 ?auto_346369 ) ) ( not ( = ?auto_346368 ?auto_346370 ) ) ( not ( = ?auto_346369 ?auto_346370 ) ) ( ON ?auto_346368 ?auto_346369 ) ( CLEAR ?auto_346366 ) ( ON ?auto_346367 ?auto_346368 ) ( CLEAR ?auto_346367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_346357 ?auto_346358 ?auto_346359 ?auto_346360 ?auto_346361 ?auto_346362 ?auto_346363 ?auto_346364 ?auto_346365 ?auto_346366 ?auto_346367 )
      ( MAKE-13PILE ?auto_346357 ?auto_346358 ?auto_346359 ?auto_346360 ?auto_346361 ?auto_346362 ?auto_346363 ?auto_346364 ?auto_346365 ?auto_346366 ?auto_346367 ?auto_346368 ?auto_346369 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_346384 - BLOCK
      ?auto_346385 - BLOCK
      ?auto_346386 - BLOCK
      ?auto_346387 - BLOCK
      ?auto_346388 - BLOCK
      ?auto_346389 - BLOCK
      ?auto_346390 - BLOCK
      ?auto_346391 - BLOCK
      ?auto_346392 - BLOCK
      ?auto_346393 - BLOCK
      ?auto_346394 - BLOCK
      ?auto_346395 - BLOCK
      ?auto_346396 - BLOCK
    )
    :vars
    (
      ?auto_346397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346396 ?auto_346397 ) ( ON-TABLE ?auto_346384 ) ( ON ?auto_346385 ?auto_346384 ) ( ON ?auto_346386 ?auto_346385 ) ( ON ?auto_346387 ?auto_346386 ) ( ON ?auto_346388 ?auto_346387 ) ( ON ?auto_346389 ?auto_346388 ) ( ON ?auto_346390 ?auto_346389 ) ( ON ?auto_346391 ?auto_346390 ) ( ON ?auto_346392 ?auto_346391 ) ( ON ?auto_346393 ?auto_346392 ) ( not ( = ?auto_346384 ?auto_346385 ) ) ( not ( = ?auto_346384 ?auto_346386 ) ) ( not ( = ?auto_346384 ?auto_346387 ) ) ( not ( = ?auto_346384 ?auto_346388 ) ) ( not ( = ?auto_346384 ?auto_346389 ) ) ( not ( = ?auto_346384 ?auto_346390 ) ) ( not ( = ?auto_346384 ?auto_346391 ) ) ( not ( = ?auto_346384 ?auto_346392 ) ) ( not ( = ?auto_346384 ?auto_346393 ) ) ( not ( = ?auto_346384 ?auto_346394 ) ) ( not ( = ?auto_346384 ?auto_346395 ) ) ( not ( = ?auto_346384 ?auto_346396 ) ) ( not ( = ?auto_346384 ?auto_346397 ) ) ( not ( = ?auto_346385 ?auto_346386 ) ) ( not ( = ?auto_346385 ?auto_346387 ) ) ( not ( = ?auto_346385 ?auto_346388 ) ) ( not ( = ?auto_346385 ?auto_346389 ) ) ( not ( = ?auto_346385 ?auto_346390 ) ) ( not ( = ?auto_346385 ?auto_346391 ) ) ( not ( = ?auto_346385 ?auto_346392 ) ) ( not ( = ?auto_346385 ?auto_346393 ) ) ( not ( = ?auto_346385 ?auto_346394 ) ) ( not ( = ?auto_346385 ?auto_346395 ) ) ( not ( = ?auto_346385 ?auto_346396 ) ) ( not ( = ?auto_346385 ?auto_346397 ) ) ( not ( = ?auto_346386 ?auto_346387 ) ) ( not ( = ?auto_346386 ?auto_346388 ) ) ( not ( = ?auto_346386 ?auto_346389 ) ) ( not ( = ?auto_346386 ?auto_346390 ) ) ( not ( = ?auto_346386 ?auto_346391 ) ) ( not ( = ?auto_346386 ?auto_346392 ) ) ( not ( = ?auto_346386 ?auto_346393 ) ) ( not ( = ?auto_346386 ?auto_346394 ) ) ( not ( = ?auto_346386 ?auto_346395 ) ) ( not ( = ?auto_346386 ?auto_346396 ) ) ( not ( = ?auto_346386 ?auto_346397 ) ) ( not ( = ?auto_346387 ?auto_346388 ) ) ( not ( = ?auto_346387 ?auto_346389 ) ) ( not ( = ?auto_346387 ?auto_346390 ) ) ( not ( = ?auto_346387 ?auto_346391 ) ) ( not ( = ?auto_346387 ?auto_346392 ) ) ( not ( = ?auto_346387 ?auto_346393 ) ) ( not ( = ?auto_346387 ?auto_346394 ) ) ( not ( = ?auto_346387 ?auto_346395 ) ) ( not ( = ?auto_346387 ?auto_346396 ) ) ( not ( = ?auto_346387 ?auto_346397 ) ) ( not ( = ?auto_346388 ?auto_346389 ) ) ( not ( = ?auto_346388 ?auto_346390 ) ) ( not ( = ?auto_346388 ?auto_346391 ) ) ( not ( = ?auto_346388 ?auto_346392 ) ) ( not ( = ?auto_346388 ?auto_346393 ) ) ( not ( = ?auto_346388 ?auto_346394 ) ) ( not ( = ?auto_346388 ?auto_346395 ) ) ( not ( = ?auto_346388 ?auto_346396 ) ) ( not ( = ?auto_346388 ?auto_346397 ) ) ( not ( = ?auto_346389 ?auto_346390 ) ) ( not ( = ?auto_346389 ?auto_346391 ) ) ( not ( = ?auto_346389 ?auto_346392 ) ) ( not ( = ?auto_346389 ?auto_346393 ) ) ( not ( = ?auto_346389 ?auto_346394 ) ) ( not ( = ?auto_346389 ?auto_346395 ) ) ( not ( = ?auto_346389 ?auto_346396 ) ) ( not ( = ?auto_346389 ?auto_346397 ) ) ( not ( = ?auto_346390 ?auto_346391 ) ) ( not ( = ?auto_346390 ?auto_346392 ) ) ( not ( = ?auto_346390 ?auto_346393 ) ) ( not ( = ?auto_346390 ?auto_346394 ) ) ( not ( = ?auto_346390 ?auto_346395 ) ) ( not ( = ?auto_346390 ?auto_346396 ) ) ( not ( = ?auto_346390 ?auto_346397 ) ) ( not ( = ?auto_346391 ?auto_346392 ) ) ( not ( = ?auto_346391 ?auto_346393 ) ) ( not ( = ?auto_346391 ?auto_346394 ) ) ( not ( = ?auto_346391 ?auto_346395 ) ) ( not ( = ?auto_346391 ?auto_346396 ) ) ( not ( = ?auto_346391 ?auto_346397 ) ) ( not ( = ?auto_346392 ?auto_346393 ) ) ( not ( = ?auto_346392 ?auto_346394 ) ) ( not ( = ?auto_346392 ?auto_346395 ) ) ( not ( = ?auto_346392 ?auto_346396 ) ) ( not ( = ?auto_346392 ?auto_346397 ) ) ( not ( = ?auto_346393 ?auto_346394 ) ) ( not ( = ?auto_346393 ?auto_346395 ) ) ( not ( = ?auto_346393 ?auto_346396 ) ) ( not ( = ?auto_346393 ?auto_346397 ) ) ( not ( = ?auto_346394 ?auto_346395 ) ) ( not ( = ?auto_346394 ?auto_346396 ) ) ( not ( = ?auto_346394 ?auto_346397 ) ) ( not ( = ?auto_346395 ?auto_346396 ) ) ( not ( = ?auto_346395 ?auto_346397 ) ) ( not ( = ?auto_346396 ?auto_346397 ) ) ( ON ?auto_346395 ?auto_346396 ) ( CLEAR ?auto_346393 ) ( ON ?auto_346394 ?auto_346395 ) ( CLEAR ?auto_346394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_346384 ?auto_346385 ?auto_346386 ?auto_346387 ?auto_346388 ?auto_346389 ?auto_346390 ?auto_346391 ?auto_346392 ?auto_346393 ?auto_346394 )
      ( MAKE-13PILE ?auto_346384 ?auto_346385 ?auto_346386 ?auto_346387 ?auto_346388 ?auto_346389 ?auto_346390 ?auto_346391 ?auto_346392 ?auto_346393 ?auto_346394 ?auto_346395 ?auto_346396 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_346411 - BLOCK
      ?auto_346412 - BLOCK
      ?auto_346413 - BLOCK
      ?auto_346414 - BLOCK
      ?auto_346415 - BLOCK
      ?auto_346416 - BLOCK
      ?auto_346417 - BLOCK
      ?auto_346418 - BLOCK
      ?auto_346419 - BLOCK
      ?auto_346420 - BLOCK
      ?auto_346421 - BLOCK
      ?auto_346422 - BLOCK
      ?auto_346423 - BLOCK
    )
    :vars
    (
      ?auto_346424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346423 ?auto_346424 ) ( ON-TABLE ?auto_346411 ) ( ON ?auto_346412 ?auto_346411 ) ( ON ?auto_346413 ?auto_346412 ) ( ON ?auto_346414 ?auto_346413 ) ( ON ?auto_346415 ?auto_346414 ) ( ON ?auto_346416 ?auto_346415 ) ( ON ?auto_346417 ?auto_346416 ) ( ON ?auto_346418 ?auto_346417 ) ( ON ?auto_346419 ?auto_346418 ) ( not ( = ?auto_346411 ?auto_346412 ) ) ( not ( = ?auto_346411 ?auto_346413 ) ) ( not ( = ?auto_346411 ?auto_346414 ) ) ( not ( = ?auto_346411 ?auto_346415 ) ) ( not ( = ?auto_346411 ?auto_346416 ) ) ( not ( = ?auto_346411 ?auto_346417 ) ) ( not ( = ?auto_346411 ?auto_346418 ) ) ( not ( = ?auto_346411 ?auto_346419 ) ) ( not ( = ?auto_346411 ?auto_346420 ) ) ( not ( = ?auto_346411 ?auto_346421 ) ) ( not ( = ?auto_346411 ?auto_346422 ) ) ( not ( = ?auto_346411 ?auto_346423 ) ) ( not ( = ?auto_346411 ?auto_346424 ) ) ( not ( = ?auto_346412 ?auto_346413 ) ) ( not ( = ?auto_346412 ?auto_346414 ) ) ( not ( = ?auto_346412 ?auto_346415 ) ) ( not ( = ?auto_346412 ?auto_346416 ) ) ( not ( = ?auto_346412 ?auto_346417 ) ) ( not ( = ?auto_346412 ?auto_346418 ) ) ( not ( = ?auto_346412 ?auto_346419 ) ) ( not ( = ?auto_346412 ?auto_346420 ) ) ( not ( = ?auto_346412 ?auto_346421 ) ) ( not ( = ?auto_346412 ?auto_346422 ) ) ( not ( = ?auto_346412 ?auto_346423 ) ) ( not ( = ?auto_346412 ?auto_346424 ) ) ( not ( = ?auto_346413 ?auto_346414 ) ) ( not ( = ?auto_346413 ?auto_346415 ) ) ( not ( = ?auto_346413 ?auto_346416 ) ) ( not ( = ?auto_346413 ?auto_346417 ) ) ( not ( = ?auto_346413 ?auto_346418 ) ) ( not ( = ?auto_346413 ?auto_346419 ) ) ( not ( = ?auto_346413 ?auto_346420 ) ) ( not ( = ?auto_346413 ?auto_346421 ) ) ( not ( = ?auto_346413 ?auto_346422 ) ) ( not ( = ?auto_346413 ?auto_346423 ) ) ( not ( = ?auto_346413 ?auto_346424 ) ) ( not ( = ?auto_346414 ?auto_346415 ) ) ( not ( = ?auto_346414 ?auto_346416 ) ) ( not ( = ?auto_346414 ?auto_346417 ) ) ( not ( = ?auto_346414 ?auto_346418 ) ) ( not ( = ?auto_346414 ?auto_346419 ) ) ( not ( = ?auto_346414 ?auto_346420 ) ) ( not ( = ?auto_346414 ?auto_346421 ) ) ( not ( = ?auto_346414 ?auto_346422 ) ) ( not ( = ?auto_346414 ?auto_346423 ) ) ( not ( = ?auto_346414 ?auto_346424 ) ) ( not ( = ?auto_346415 ?auto_346416 ) ) ( not ( = ?auto_346415 ?auto_346417 ) ) ( not ( = ?auto_346415 ?auto_346418 ) ) ( not ( = ?auto_346415 ?auto_346419 ) ) ( not ( = ?auto_346415 ?auto_346420 ) ) ( not ( = ?auto_346415 ?auto_346421 ) ) ( not ( = ?auto_346415 ?auto_346422 ) ) ( not ( = ?auto_346415 ?auto_346423 ) ) ( not ( = ?auto_346415 ?auto_346424 ) ) ( not ( = ?auto_346416 ?auto_346417 ) ) ( not ( = ?auto_346416 ?auto_346418 ) ) ( not ( = ?auto_346416 ?auto_346419 ) ) ( not ( = ?auto_346416 ?auto_346420 ) ) ( not ( = ?auto_346416 ?auto_346421 ) ) ( not ( = ?auto_346416 ?auto_346422 ) ) ( not ( = ?auto_346416 ?auto_346423 ) ) ( not ( = ?auto_346416 ?auto_346424 ) ) ( not ( = ?auto_346417 ?auto_346418 ) ) ( not ( = ?auto_346417 ?auto_346419 ) ) ( not ( = ?auto_346417 ?auto_346420 ) ) ( not ( = ?auto_346417 ?auto_346421 ) ) ( not ( = ?auto_346417 ?auto_346422 ) ) ( not ( = ?auto_346417 ?auto_346423 ) ) ( not ( = ?auto_346417 ?auto_346424 ) ) ( not ( = ?auto_346418 ?auto_346419 ) ) ( not ( = ?auto_346418 ?auto_346420 ) ) ( not ( = ?auto_346418 ?auto_346421 ) ) ( not ( = ?auto_346418 ?auto_346422 ) ) ( not ( = ?auto_346418 ?auto_346423 ) ) ( not ( = ?auto_346418 ?auto_346424 ) ) ( not ( = ?auto_346419 ?auto_346420 ) ) ( not ( = ?auto_346419 ?auto_346421 ) ) ( not ( = ?auto_346419 ?auto_346422 ) ) ( not ( = ?auto_346419 ?auto_346423 ) ) ( not ( = ?auto_346419 ?auto_346424 ) ) ( not ( = ?auto_346420 ?auto_346421 ) ) ( not ( = ?auto_346420 ?auto_346422 ) ) ( not ( = ?auto_346420 ?auto_346423 ) ) ( not ( = ?auto_346420 ?auto_346424 ) ) ( not ( = ?auto_346421 ?auto_346422 ) ) ( not ( = ?auto_346421 ?auto_346423 ) ) ( not ( = ?auto_346421 ?auto_346424 ) ) ( not ( = ?auto_346422 ?auto_346423 ) ) ( not ( = ?auto_346422 ?auto_346424 ) ) ( not ( = ?auto_346423 ?auto_346424 ) ) ( ON ?auto_346422 ?auto_346423 ) ( ON ?auto_346421 ?auto_346422 ) ( CLEAR ?auto_346419 ) ( ON ?auto_346420 ?auto_346421 ) ( CLEAR ?auto_346420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_346411 ?auto_346412 ?auto_346413 ?auto_346414 ?auto_346415 ?auto_346416 ?auto_346417 ?auto_346418 ?auto_346419 ?auto_346420 )
      ( MAKE-13PILE ?auto_346411 ?auto_346412 ?auto_346413 ?auto_346414 ?auto_346415 ?auto_346416 ?auto_346417 ?auto_346418 ?auto_346419 ?auto_346420 ?auto_346421 ?auto_346422 ?auto_346423 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_346438 - BLOCK
      ?auto_346439 - BLOCK
      ?auto_346440 - BLOCK
      ?auto_346441 - BLOCK
      ?auto_346442 - BLOCK
      ?auto_346443 - BLOCK
      ?auto_346444 - BLOCK
      ?auto_346445 - BLOCK
      ?auto_346446 - BLOCK
      ?auto_346447 - BLOCK
      ?auto_346448 - BLOCK
      ?auto_346449 - BLOCK
      ?auto_346450 - BLOCK
    )
    :vars
    (
      ?auto_346451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346450 ?auto_346451 ) ( ON-TABLE ?auto_346438 ) ( ON ?auto_346439 ?auto_346438 ) ( ON ?auto_346440 ?auto_346439 ) ( ON ?auto_346441 ?auto_346440 ) ( ON ?auto_346442 ?auto_346441 ) ( ON ?auto_346443 ?auto_346442 ) ( ON ?auto_346444 ?auto_346443 ) ( ON ?auto_346445 ?auto_346444 ) ( ON ?auto_346446 ?auto_346445 ) ( not ( = ?auto_346438 ?auto_346439 ) ) ( not ( = ?auto_346438 ?auto_346440 ) ) ( not ( = ?auto_346438 ?auto_346441 ) ) ( not ( = ?auto_346438 ?auto_346442 ) ) ( not ( = ?auto_346438 ?auto_346443 ) ) ( not ( = ?auto_346438 ?auto_346444 ) ) ( not ( = ?auto_346438 ?auto_346445 ) ) ( not ( = ?auto_346438 ?auto_346446 ) ) ( not ( = ?auto_346438 ?auto_346447 ) ) ( not ( = ?auto_346438 ?auto_346448 ) ) ( not ( = ?auto_346438 ?auto_346449 ) ) ( not ( = ?auto_346438 ?auto_346450 ) ) ( not ( = ?auto_346438 ?auto_346451 ) ) ( not ( = ?auto_346439 ?auto_346440 ) ) ( not ( = ?auto_346439 ?auto_346441 ) ) ( not ( = ?auto_346439 ?auto_346442 ) ) ( not ( = ?auto_346439 ?auto_346443 ) ) ( not ( = ?auto_346439 ?auto_346444 ) ) ( not ( = ?auto_346439 ?auto_346445 ) ) ( not ( = ?auto_346439 ?auto_346446 ) ) ( not ( = ?auto_346439 ?auto_346447 ) ) ( not ( = ?auto_346439 ?auto_346448 ) ) ( not ( = ?auto_346439 ?auto_346449 ) ) ( not ( = ?auto_346439 ?auto_346450 ) ) ( not ( = ?auto_346439 ?auto_346451 ) ) ( not ( = ?auto_346440 ?auto_346441 ) ) ( not ( = ?auto_346440 ?auto_346442 ) ) ( not ( = ?auto_346440 ?auto_346443 ) ) ( not ( = ?auto_346440 ?auto_346444 ) ) ( not ( = ?auto_346440 ?auto_346445 ) ) ( not ( = ?auto_346440 ?auto_346446 ) ) ( not ( = ?auto_346440 ?auto_346447 ) ) ( not ( = ?auto_346440 ?auto_346448 ) ) ( not ( = ?auto_346440 ?auto_346449 ) ) ( not ( = ?auto_346440 ?auto_346450 ) ) ( not ( = ?auto_346440 ?auto_346451 ) ) ( not ( = ?auto_346441 ?auto_346442 ) ) ( not ( = ?auto_346441 ?auto_346443 ) ) ( not ( = ?auto_346441 ?auto_346444 ) ) ( not ( = ?auto_346441 ?auto_346445 ) ) ( not ( = ?auto_346441 ?auto_346446 ) ) ( not ( = ?auto_346441 ?auto_346447 ) ) ( not ( = ?auto_346441 ?auto_346448 ) ) ( not ( = ?auto_346441 ?auto_346449 ) ) ( not ( = ?auto_346441 ?auto_346450 ) ) ( not ( = ?auto_346441 ?auto_346451 ) ) ( not ( = ?auto_346442 ?auto_346443 ) ) ( not ( = ?auto_346442 ?auto_346444 ) ) ( not ( = ?auto_346442 ?auto_346445 ) ) ( not ( = ?auto_346442 ?auto_346446 ) ) ( not ( = ?auto_346442 ?auto_346447 ) ) ( not ( = ?auto_346442 ?auto_346448 ) ) ( not ( = ?auto_346442 ?auto_346449 ) ) ( not ( = ?auto_346442 ?auto_346450 ) ) ( not ( = ?auto_346442 ?auto_346451 ) ) ( not ( = ?auto_346443 ?auto_346444 ) ) ( not ( = ?auto_346443 ?auto_346445 ) ) ( not ( = ?auto_346443 ?auto_346446 ) ) ( not ( = ?auto_346443 ?auto_346447 ) ) ( not ( = ?auto_346443 ?auto_346448 ) ) ( not ( = ?auto_346443 ?auto_346449 ) ) ( not ( = ?auto_346443 ?auto_346450 ) ) ( not ( = ?auto_346443 ?auto_346451 ) ) ( not ( = ?auto_346444 ?auto_346445 ) ) ( not ( = ?auto_346444 ?auto_346446 ) ) ( not ( = ?auto_346444 ?auto_346447 ) ) ( not ( = ?auto_346444 ?auto_346448 ) ) ( not ( = ?auto_346444 ?auto_346449 ) ) ( not ( = ?auto_346444 ?auto_346450 ) ) ( not ( = ?auto_346444 ?auto_346451 ) ) ( not ( = ?auto_346445 ?auto_346446 ) ) ( not ( = ?auto_346445 ?auto_346447 ) ) ( not ( = ?auto_346445 ?auto_346448 ) ) ( not ( = ?auto_346445 ?auto_346449 ) ) ( not ( = ?auto_346445 ?auto_346450 ) ) ( not ( = ?auto_346445 ?auto_346451 ) ) ( not ( = ?auto_346446 ?auto_346447 ) ) ( not ( = ?auto_346446 ?auto_346448 ) ) ( not ( = ?auto_346446 ?auto_346449 ) ) ( not ( = ?auto_346446 ?auto_346450 ) ) ( not ( = ?auto_346446 ?auto_346451 ) ) ( not ( = ?auto_346447 ?auto_346448 ) ) ( not ( = ?auto_346447 ?auto_346449 ) ) ( not ( = ?auto_346447 ?auto_346450 ) ) ( not ( = ?auto_346447 ?auto_346451 ) ) ( not ( = ?auto_346448 ?auto_346449 ) ) ( not ( = ?auto_346448 ?auto_346450 ) ) ( not ( = ?auto_346448 ?auto_346451 ) ) ( not ( = ?auto_346449 ?auto_346450 ) ) ( not ( = ?auto_346449 ?auto_346451 ) ) ( not ( = ?auto_346450 ?auto_346451 ) ) ( ON ?auto_346449 ?auto_346450 ) ( ON ?auto_346448 ?auto_346449 ) ( CLEAR ?auto_346446 ) ( ON ?auto_346447 ?auto_346448 ) ( CLEAR ?auto_346447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_346438 ?auto_346439 ?auto_346440 ?auto_346441 ?auto_346442 ?auto_346443 ?auto_346444 ?auto_346445 ?auto_346446 ?auto_346447 )
      ( MAKE-13PILE ?auto_346438 ?auto_346439 ?auto_346440 ?auto_346441 ?auto_346442 ?auto_346443 ?auto_346444 ?auto_346445 ?auto_346446 ?auto_346447 ?auto_346448 ?auto_346449 ?auto_346450 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_346465 - BLOCK
      ?auto_346466 - BLOCK
      ?auto_346467 - BLOCK
      ?auto_346468 - BLOCK
      ?auto_346469 - BLOCK
      ?auto_346470 - BLOCK
      ?auto_346471 - BLOCK
      ?auto_346472 - BLOCK
      ?auto_346473 - BLOCK
      ?auto_346474 - BLOCK
      ?auto_346475 - BLOCK
      ?auto_346476 - BLOCK
      ?auto_346477 - BLOCK
    )
    :vars
    (
      ?auto_346478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346477 ?auto_346478 ) ( ON-TABLE ?auto_346465 ) ( ON ?auto_346466 ?auto_346465 ) ( ON ?auto_346467 ?auto_346466 ) ( ON ?auto_346468 ?auto_346467 ) ( ON ?auto_346469 ?auto_346468 ) ( ON ?auto_346470 ?auto_346469 ) ( ON ?auto_346471 ?auto_346470 ) ( ON ?auto_346472 ?auto_346471 ) ( not ( = ?auto_346465 ?auto_346466 ) ) ( not ( = ?auto_346465 ?auto_346467 ) ) ( not ( = ?auto_346465 ?auto_346468 ) ) ( not ( = ?auto_346465 ?auto_346469 ) ) ( not ( = ?auto_346465 ?auto_346470 ) ) ( not ( = ?auto_346465 ?auto_346471 ) ) ( not ( = ?auto_346465 ?auto_346472 ) ) ( not ( = ?auto_346465 ?auto_346473 ) ) ( not ( = ?auto_346465 ?auto_346474 ) ) ( not ( = ?auto_346465 ?auto_346475 ) ) ( not ( = ?auto_346465 ?auto_346476 ) ) ( not ( = ?auto_346465 ?auto_346477 ) ) ( not ( = ?auto_346465 ?auto_346478 ) ) ( not ( = ?auto_346466 ?auto_346467 ) ) ( not ( = ?auto_346466 ?auto_346468 ) ) ( not ( = ?auto_346466 ?auto_346469 ) ) ( not ( = ?auto_346466 ?auto_346470 ) ) ( not ( = ?auto_346466 ?auto_346471 ) ) ( not ( = ?auto_346466 ?auto_346472 ) ) ( not ( = ?auto_346466 ?auto_346473 ) ) ( not ( = ?auto_346466 ?auto_346474 ) ) ( not ( = ?auto_346466 ?auto_346475 ) ) ( not ( = ?auto_346466 ?auto_346476 ) ) ( not ( = ?auto_346466 ?auto_346477 ) ) ( not ( = ?auto_346466 ?auto_346478 ) ) ( not ( = ?auto_346467 ?auto_346468 ) ) ( not ( = ?auto_346467 ?auto_346469 ) ) ( not ( = ?auto_346467 ?auto_346470 ) ) ( not ( = ?auto_346467 ?auto_346471 ) ) ( not ( = ?auto_346467 ?auto_346472 ) ) ( not ( = ?auto_346467 ?auto_346473 ) ) ( not ( = ?auto_346467 ?auto_346474 ) ) ( not ( = ?auto_346467 ?auto_346475 ) ) ( not ( = ?auto_346467 ?auto_346476 ) ) ( not ( = ?auto_346467 ?auto_346477 ) ) ( not ( = ?auto_346467 ?auto_346478 ) ) ( not ( = ?auto_346468 ?auto_346469 ) ) ( not ( = ?auto_346468 ?auto_346470 ) ) ( not ( = ?auto_346468 ?auto_346471 ) ) ( not ( = ?auto_346468 ?auto_346472 ) ) ( not ( = ?auto_346468 ?auto_346473 ) ) ( not ( = ?auto_346468 ?auto_346474 ) ) ( not ( = ?auto_346468 ?auto_346475 ) ) ( not ( = ?auto_346468 ?auto_346476 ) ) ( not ( = ?auto_346468 ?auto_346477 ) ) ( not ( = ?auto_346468 ?auto_346478 ) ) ( not ( = ?auto_346469 ?auto_346470 ) ) ( not ( = ?auto_346469 ?auto_346471 ) ) ( not ( = ?auto_346469 ?auto_346472 ) ) ( not ( = ?auto_346469 ?auto_346473 ) ) ( not ( = ?auto_346469 ?auto_346474 ) ) ( not ( = ?auto_346469 ?auto_346475 ) ) ( not ( = ?auto_346469 ?auto_346476 ) ) ( not ( = ?auto_346469 ?auto_346477 ) ) ( not ( = ?auto_346469 ?auto_346478 ) ) ( not ( = ?auto_346470 ?auto_346471 ) ) ( not ( = ?auto_346470 ?auto_346472 ) ) ( not ( = ?auto_346470 ?auto_346473 ) ) ( not ( = ?auto_346470 ?auto_346474 ) ) ( not ( = ?auto_346470 ?auto_346475 ) ) ( not ( = ?auto_346470 ?auto_346476 ) ) ( not ( = ?auto_346470 ?auto_346477 ) ) ( not ( = ?auto_346470 ?auto_346478 ) ) ( not ( = ?auto_346471 ?auto_346472 ) ) ( not ( = ?auto_346471 ?auto_346473 ) ) ( not ( = ?auto_346471 ?auto_346474 ) ) ( not ( = ?auto_346471 ?auto_346475 ) ) ( not ( = ?auto_346471 ?auto_346476 ) ) ( not ( = ?auto_346471 ?auto_346477 ) ) ( not ( = ?auto_346471 ?auto_346478 ) ) ( not ( = ?auto_346472 ?auto_346473 ) ) ( not ( = ?auto_346472 ?auto_346474 ) ) ( not ( = ?auto_346472 ?auto_346475 ) ) ( not ( = ?auto_346472 ?auto_346476 ) ) ( not ( = ?auto_346472 ?auto_346477 ) ) ( not ( = ?auto_346472 ?auto_346478 ) ) ( not ( = ?auto_346473 ?auto_346474 ) ) ( not ( = ?auto_346473 ?auto_346475 ) ) ( not ( = ?auto_346473 ?auto_346476 ) ) ( not ( = ?auto_346473 ?auto_346477 ) ) ( not ( = ?auto_346473 ?auto_346478 ) ) ( not ( = ?auto_346474 ?auto_346475 ) ) ( not ( = ?auto_346474 ?auto_346476 ) ) ( not ( = ?auto_346474 ?auto_346477 ) ) ( not ( = ?auto_346474 ?auto_346478 ) ) ( not ( = ?auto_346475 ?auto_346476 ) ) ( not ( = ?auto_346475 ?auto_346477 ) ) ( not ( = ?auto_346475 ?auto_346478 ) ) ( not ( = ?auto_346476 ?auto_346477 ) ) ( not ( = ?auto_346476 ?auto_346478 ) ) ( not ( = ?auto_346477 ?auto_346478 ) ) ( ON ?auto_346476 ?auto_346477 ) ( ON ?auto_346475 ?auto_346476 ) ( ON ?auto_346474 ?auto_346475 ) ( CLEAR ?auto_346472 ) ( ON ?auto_346473 ?auto_346474 ) ( CLEAR ?auto_346473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_346465 ?auto_346466 ?auto_346467 ?auto_346468 ?auto_346469 ?auto_346470 ?auto_346471 ?auto_346472 ?auto_346473 )
      ( MAKE-13PILE ?auto_346465 ?auto_346466 ?auto_346467 ?auto_346468 ?auto_346469 ?auto_346470 ?auto_346471 ?auto_346472 ?auto_346473 ?auto_346474 ?auto_346475 ?auto_346476 ?auto_346477 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_346492 - BLOCK
      ?auto_346493 - BLOCK
      ?auto_346494 - BLOCK
      ?auto_346495 - BLOCK
      ?auto_346496 - BLOCK
      ?auto_346497 - BLOCK
      ?auto_346498 - BLOCK
      ?auto_346499 - BLOCK
      ?auto_346500 - BLOCK
      ?auto_346501 - BLOCK
      ?auto_346502 - BLOCK
      ?auto_346503 - BLOCK
      ?auto_346504 - BLOCK
    )
    :vars
    (
      ?auto_346505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346504 ?auto_346505 ) ( ON-TABLE ?auto_346492 ) ( ON ?auto_346493 ?auto_346492 ) ( ON ?auto_346494 ?auto_346493 ) ( ON ?auto_346495 ?auto_346494 ) ( ON ?auto_346496 ?auto_346495 ) ( ON ?auto_346497 ?auto_346496 ) ( ON ?auto_346498 ?auto_346497 ) ( ON ?auto_346499 ?auto_346498 ) ( not ( = ?auto_346492 ?auto_346493 ) ) ( not ( = ?auto_346492 ?auto_346494 ) ) ( not ( = ?auto_346492 ?auto_346495 ) ) ( not ( = ?auto_346492 ?auto_346496 ) ) ( not ( = ?auto_346492 ?auto_346497 ) ) ( not ( = ?auto_346492 ?auto_346498 ) ) ( not ( = ?auto_346492 ?auto_346499 ) ) ( not ( = ?auto_346492 ?auto_346500 ) ) ( not ( = ?auto_346492 ?auto_346501 ) ) ( not ( = ?auto_346492 ?auto_346502 ) ) ( not ( = ?auto_346492 ?auto_346503 ) ) ( not ( = ?auto_346492 ?auto_346504 ) ) ( not ( = ?auto_346492 ?auto_346505 ) ) ( not ( = ?auto_346493 ?auto_346494 ) ) ( not ( = ?auto_346493 ?auto_346495 ) ) ( not ( = ?auto_346493 ?auto_346496 ) ) ( not ( = ?auto_346493 ?auto_346497 ) ) ( not ( = ?auto_346493 ?auto_346498 ) ) ( not ( = ?auto_346493 ?auto_346499 ) ) ( not ( = ?auto_346493 ?auto_346500 ) ) ( not ( = ?auto_346493 ?auto_346501 ) ) ( not ( = ?auto_346493 ?auto_346502 ) ) ( not ( = ?auto_346493 ?auto_346503 ) ) ( not ( = ?auto_346493 ?auto_346504 ) ) ( not ( = ?auto_346493 ?auto_346505 ) ) ( not ( = ?auto_346494 ?auto_346495 ) ) ( not ( = ?auto_346494 ?auto_346496 ) ) ( not ( = ?auto_346494 ?auto_346497 ) ) ( not ( = ?auto_346494 ?auto_346498 ) ) ( not ( = ?auto_346494 ?auto_346499 ) ) ( not ( = ?auto_346494 ?auto_346500 ) ) ( not ( = ?auto_346494 ?auto_346501 ) ) ( not ( = ?auto_346494 ?auto_346502 ) ) ( not ( = ?auto_346494 ?auto_346503 ) ) ( not ( = ?auto_346494 ?auto_346504 ) ) ( not ( = ?auto_346494 ?auto_346505 ) ) ( not ( = ?auto_346495 ?auto_346496 ) ) ( not ( = ?auto_346495 ?auto_346497 ) ) ( not ( = ?auto_346495 ?auto_346498 ) ) ( not ( = ?auto_346495 ?auto_346499 ) ) ( not ( = ?auto_346495 ?auto_346500 ) ) ( not ( = ?auto_346495 ?auto_346501 ) ) ( not ( = ?auto_346495 ?auto_346502 ) ) ( not ( = ?auto_346495 ?auto_346503 ) ) ( not ( = ?auto_346495 ?auto_346504 ) ) ( not ( = ?auto_346495 ?auto_346505 ) ) ( not ( = ?auto_346496 ?auto_346497 ) ) ( not ( = ?auto_346496 ?auto_346498 ) ) ( not ( = ?auto_346496 ?auto_346499 ) ) ( not ( = ?auto_346496 ?auto_346500 ) ) ( not ( = ?auto_346496 ?auto_346501 ) ) ( not ( = ?auto_346496 ?auto_346502 ) ) ( not ( = ?auto_346496 ?auto_346503 ) ) ( not ( = ?auto_346496 ?auto_346504 ) ) ( not ( = ?auto_346496 ?auto_346505 ) ) ( not ( = ?auto_346497 ?auto_346498 ) ) ( not ( = ?auto_346497 ?auto_346499 ) ) ( not ( = ?auto_346497 ?auto_346500 ) ) ( not ( = ?auto_346497 ?auto_346501 ) ) ( not ( = ?auto_346497 ?auto_346502 ) ) ( not ( = ?auto_346497 ?auto_346503 ) ) ( not ( = ?auto_346497 ?auto_346504 ) ) ( not ( = ?auto_346497 ?auto_346505 ) ) ( not ( = ?auto_346498 ?auto_346499 ) ) ( not ( = ?auto_346498 ?auto_346500 ) ) ( not ( = ?auto_346498 ?auto_346501 ) ) ( not ( = ?auto_346498 ?auto_346502 ) ) ( not ( = ?auto_346498 ?auto_346503 ) ) ( not ( = ?auto_346498 ?auto_346504 ) ) ( not ( = ?auto_346498 ?auto_346505 ) ) ( not ( = ?auto_346499 ?auto_346500 ) ) ( not ( = ?auto_346499 ?auto_346501 ) ) ( not ( = ?auto_346499 ?auto_346502 ) ) ( not ( = ?auto_346499 ?auto_346503 ) ) ( not ( = ?auto_346499 ?auto_346504 ) ) ( not ( = ?auto_346499 ?auto_346505 ) ) ( not ( = ?auto_346500 ?auto_346501 ) ) ( not ( = ?auto_346500 ?auto_346502 ) ) ( not ( = ?auto_346500 ?auto_346503 ) ) ( not ( = ?auto_346500 ?auto_346504 ) ) ( not ( = ?auto_346500 ?auto_346505 ) ) ( not ( = ?auto_346501 ?auto_346502 ) ) ( not ( = ?auto_346501 ?auto_346503 ) ) ( not ( = ?auto_346501 ?auto_346504 ) ) ( not ( = ?auto_346501 ?auto_346505 ) ) ( not ( = ?auto_346502 ?auto_346503 ) ) ( not ( = ?auto_346502 ?auto_346504 ) ) ( not ( = ?auto_346502 ?auto_346505 ) ) ( not ( = ?auto_346503 ?auto_346504 ) ) ( not ( = ?auto_346503 ?auto_346505 ) ) ( not ( = ?auto_346504 ?auto_346505 ) ) ( ON ?auto_346503 ?auto_346504 ) ( ON ?auto_346502 ?auto_346503 ) ( ON ?auto_346501 ?auto_346502 ) ( CLEAR ?auto_346499 ) ( ON ?auto_346500 ?auto_346501 ) ( CLEAR ?auto_346500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_346492 ?auto_346493 ?auto_346494 ?auto_346495 ?auto_346496 ?auto_346497 ?auto_346498 ?auto_346499 ?auto_346500 )
      ( MAKE-13PILE ?auto_346492 ?auto_346493 ?auto_346494 ?auto_346495 ?auto_346496 ?auto_346497 ?auto_346498 ?auto_346499 ?auto_346500 ?auto_346501 ?auto_346502 ?auto_346503 ?auto_346504 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_346519 - BLOCK
      ?auto_346520 - BLOCK
      ?auto_346521 - BLOCK
      ?auto_346522 - BLOCK
      ?auto_346523 - BLOCK
      ?auto_346524 - BLOCK
      ?auto_346525 - BLOCK
      ?auto_346526 - BLOCK
      ?auto_346527 - BLOCK
      ?auto_346528 - BLOCK
      ?auto_346529 - BLOCK
      ?auto_346530 - BLOCK
      ?auto_346531 - BLOCK
    )
    :vars
    (
      ?auto_346532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346531 ?auto_346532 ) ( ON-TABLE ?auto_346519 ) ( ON ?auto_346520 ?auto_346519 ) ( ON ?auto_346521 ?auto_346520 ) ( ON ?auto_346522 ?auto_346521 ) ( ON ?auto_346523 ?auto_346522 ) ( ON ?auto_346524 ?auto_346523 ) ( ON ?auto_346525 ?auto_346524 ) ( not ( = ?auto_346519 ?auto_346520 ) ) ( not ( = ?auto_346519 ?auto_346521 ) ) ( not ( = ?auto_346519 ?auto_346522 ) ) ( not ( = ?auto_346519 ?auto_346523 ) ) ( not ( = ?auto_346519 ?auto_346524 ) ) ( not ( = ?auto_346519 ?auto_346525 ) ) ( not ( = ?auto_346519 ?auto_346526 ) ) ( not ( = ?auto_346519 ?auto_346527 ) ) ( not ( = ?auto_346519 ?auto_346528 ) ) ( not ( = ?auto_346519 ?auto_346529 ) ) ( not ( = ?auto_346519 ?auto_346530 ) ) ( not ( = ?auto_346519 ?auto_346531 ) ) ( not ( = ?auto_346519 ?auto_346532 ) ) ( not ( = ?auto_346520 ?auto_346521 ) ) ( not ( = ?auto_346520 ?auto_346522 ) ) ( not ( = ?auto_346520 ?auto_346523 ) ) ( not ( = ?auto_346520 ?auto_346524 ) ) ( not ( = ?auto_346520 ?auto_346525 ) ) ( not ( = ?auto_346520 ?auto_346526 ) ) ( not ( = ?auto_346520 ?auto_346527 ) ) ( not ( = ?auto_346520 ?auto_346528 ) ) ( not ( = ?auto_346520 ?auto_346529 ) ) ( not ( = ?auto_346520 ?auto_346530 ) ) ( not ( = ?auto_346520 ?auto_346531 ) ) ( not ( = ?auto_346520 ?auto_346532 ) ) ( not ( = ?auto_346521 ?auto_346522 ) ) ( not ( = ?auto_346521 ?auto_346523 ) ) ( not ( = ?auto_346521 ?auto_346524 ) ) ( not ( = ?auto_346521 ?auto_346525 ) ) ( not ( = ?auto_346521 ?auto_346526 ) ) ( not ( = ?auto_346521 ?auto_346527 ) ) ( not ( = ?auto_346521 ?auto_346528 ) ) ( not ( = ?auto_346521 ?auto_346529 ) ) ( not ( = ?auto_346521 ?auto_346530 ) ) ( not ( = ?auto_346521 ?auto_346531 ) ) ( not ( = ?auto_346521 ?auto_346532 ) ) ( not ( = ?auto_346522 ?auto_346523 ) ) ( not ( = ?auto_346522 ?auto_346524 ) ) ( not ( = ?auto_346522 ?auto_346525 ) ) ( not ( = ?auto_346522 ?auto_346526 ) ) ( not ( = ?auto_346522 ?auto_346527 ) ) ( not ( = ?auto_346522 ?auto_346528 ) ) ( not ( = ?auto_346522 ?auto_346529 ) ) ( not ( = ?auto_346522 ?auto_346530 ) ) ( not ( = ?auto_346522 ?auto_346531 ) ) ( not ( = ?auto_346522 ?auto_346532 ) ) ( not ( = ?auto_346523 ?auto_346524 ) ) ( not ( = ?auto_346523 ?auto_346525 ) ) ( not ( = ?auto_346523 ?auto_346526 ) ) ( not ( = ?auto_346523 ?auto_346527 ) ) ( not ( = ?auto_346523 ?auto_346528 ) ) ( not ( = ?auto_346523 ?auto_346529 ) ) ( not ( = ?auto_346523 ?auto_346530 ) ) ( not ( = ?auto_346523 ?auto_346531 ) ) ( not ( = ?auto_346523 ?auto_346532 ) ) ( not ( = ?auto_346524 ?auto_346525 ) ) ( not ( = ?auto_346524 ?auto_346526 ) ) ( not ( = ?auto_346524 ?auto_346527 ) ) ( not ( = ?auto_346524 ?auto_346528 ) ) ( not ( = ?auto_346524 ?auto_346529 ) ) ( not ( = ?auto_346524 ?auto_346530 ) ) ( not ( = ?auto_346524 ?auto_346531 ) ) ( not ( = ?auto_346524 ?auto_346532 ) ) ( not ( = ?auto_346525 ?auto_346526 ) ) ( not ( = ?auto_346525 ?auto_346527 ) ) ( not ( = ?auto_346525 ?auto_346528 ) ) ( not ( = ?auto_346525 ?auto_346529 ) ) ( not ( = ?auto_346525 ?auto_346530 ) ) ( not ( = ?auto_346525 ?auto_346531 ) ) ( not ( = ?auto_346525 ?auto_346532 ) ) ( not ( = ?auto_346526 ?auto_346527 ) ) ( not ( = ?auto_346526 ?auto_346528 ) ) ( not ( = ?auto_346526 ?auto_346529 ) ) ( not ( = ?auto_346526 ?auto_346530 ) ) ( not ( = ?auto_346526 ?auto_346531 ) ) ( not ( = ?auto_346526 ?auto_346532 ) ) ( not ( = ?auto_346527 ?auto_346528 ) ) ( not ( = ?auto_346527 ?auto_346529 ) ) ( not ( = ?auto_346527 ?auto_346530 ) ) ( not ( = ?auto_346527 ?auto_346531 ) ) ( not ( = ?auto_346527 ?auto_346532 ) ) ( not ( = ?auto_346528 ?auto_346529 ) ) ( not ( = ?auto_346528 ?auto_346530 ) ) ( not ( = ?auto_346528 ?auto_346531 ) ) ( not ( = ?auto_346528 ?auto_346532 ) ) ( not ( = ?auto_346529 ?auto_346530 ) ) ( not ( = ?auto_346529 ?auto_346531 ) ) ( not ( = ?auto_346529 ?auto_346532 ) ) ( not ( = ?auto_346530 ?auto_346531 ) ) ( not ( = ?auto_346530 ?auto_346532 ) ) ( not ( = ?auto_346531 ?auto_346532 ) ) ( ON ?auto_346530 ?auto_346531 ) ( ON ?auto_346529 ?auto_346530 ) ( ON ?auto_346528 ?auto_346529 ) ( ON ?auto_346527 ?auto_346528 ) ( CLEAR ?auto_346525 ) ( ON ?auto_346526 ?auto_346527 ) ( CLEAR ?auto_346526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_346519 ?auto_346520 ?auto_346521 ?auto_346522 ?auto_346523 ?auto_346524 ?auto_346525 ?auto_346526 )
      ( MAKE-13PILE ?auto_346519 ?auto_346520 ?auto_346521 ?auto_346522 ?auto_346523 ?auto_346524 ?auto_346525 ?auto_346526 ?auto_346527 ?auto_346528 ?auto_346529 ?auto_346530 ?auto_346531 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_346546 - BLOCK
      ?auto_346547 - BLOCK
      ?auto_346548 - BLOCK
      ?auto_346549 - BLOCK
      ?auto_346550 - BLOCK
      ?auto_346551 - BLOCK
      ?auto_346552 - BLOCK
      ?auto_346553 - BLOCK
      ?auto_346554 - BLOCK
      ?auto_346555 - BLOCK
      ?auto_346556 - BLOCK
      ?auto_346557 - BLOCK
      ?auto_346558 - BLOCK
    )
    :vars
    (
      ?auto_346559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346558 ?auto_346559 ) ( ON-TABLE ?auto_346546 ) ( ON ?auto_346547 ?auto_346546 ) ( ON ?auto_346548 ?auto_346547 ) ( ON ?auto_346549 ?auto_346548 ) ( ON ?auto_346550 ?auto_346549 ) ( ON ?auto_346551 ?auto_346550 ) ( ON ?auto_346552 ?auto_346551 ) ( not ( = ?auto_346546 ?auto_346547 ) ) ( not ( = ?auto_346546 ?auto_346548 ) ) ( not ( = ?auto_346546 ?auto_346549 ) ) ( not ( = ?auto_346546 ?auto_346550 ) ) ( not ( = ?auto_346546 ?auto_346551 ) ) ( not ( = ?auto_346546 ?auto_346552 ) ) ( not ( = ?auto_346546 ?auto_346553 ) ) ( not ( = ?auto_346546 ?auto_346554 ) ) ( not ( = ?auto_346546 ?auto_346555 ) ) ( not ( = ?auto_346546 ?auto_346556 ) ) ( not ( = ?auto_346546 ?auto_346557 ) ) ( not ( = ?auto_346546 ?auto_346558 ) ) ( not ( = ?auto_346546 ?auto_346559 ) ) ( not ( = ?auto_346547 ?auto_346548 ) ) ( not ( = ?auto_346547 ?auto_346549 ) ) ( not ( = ?auto_346547 ?auto_346550 ) ) ( not ( = ?auto_346547 ?auto_346551 ) ) ( not ( = ?auto_346547 ?auto_346552 ) ) ( not ( = ?auto_346547 ?auto_346553 ) ) ( not ( = ?auto_346547 ?auto_346554 ) ) ( not ( = ?auto_346547 ?auto_346555 ) ) ( not ( = ?auto_346547 ?auto_346556 ) ) ( not ( = ?auto_346547 ?auto_346557 ) ) ( not ( = ?auto_346547 ?auto_346558 ) ) ( not ( = ?auto_346547 ?auto_346559 ) ) ( not ( = ?auto_346548 ?auto_346549 ) ) ( not ( = ?auto_346548 ?auto_346550 ) ) ( not ( = ?auto_346548 ?auto_346551 ) ) ( not ( = ?auto_346548 ?auto_346552 ) ) ( not ( = ?auto_346548 ?auto_346553 ) ) ( not ( = ?auto_346548 ?auto_346554 ) ) ( not ( = ?auto_346548 ?auto_346555 ) ) ( not ( = ?auto_346548 ?auto_346556 ) ) ( not ( = ?auto_346548 ?auto_346557 ) ) ( not ( = ?auto_346548 ?auto_346558 ) ) ( not ( = ?auto_346548 ?auto_346559 ) ) ( not ( = ?auto_346549 ?auto_346550 ) ) ( not ( = ?auto_346549 ?auto_346551 ) ) ( not ( = ?auto_346549 ?auto_346552 ) ) ( not ( = ?auto_346549 ?auto_346553 ) ) ( not ( = ?auto_346549 ?auto_346554 ) ) ( not ( = ?auto_346549 ?auto_346555 ) ) ( not ( = ?auto_346549 ?auto_346556 ) ) ( not ( = ?auto_346549 ?auto_346557 ) ) ( not ( = ?auto_346549 ?auto_346558 ) ) ( not ( = ?auto_346549 ?auto_346559 ) ) ( not ( = ?auto_346550 ?auto_346551 ) ) ( not ( = ?auto_346550 ?auto_346552 ) ) ( not ( = ?auto_346550 ?auto_346553 ) ) ( not ( = ?auto_346550 ?auto_346554 ) ) ( not ( = ?auto_346550 ?auto_346555 ) ) ( not ( = ?auto_346550 ?auto_346556 ) ) ( not ( = ?auto_346550 ?auto_346557 ) ) ( not ( = ?auto_346550 ?auto_346558 ) ) ( not ( = ?auto_346550 ?auto_346559 ) ) ( not ( = ?auto_346551 ?auto_346552 ) ) ( not ( = ?auto_346551 ?auto_346553 ) ) ( not ( = ?auto_346551 ?auto_346554 ) ) ( not ( = ?auto_346551 ?auto_346555 ) ) ( not ( = ?auto_346551 ?auto_346556 ) ) ( not ( = ?auto_346551 ?auto_346557 ) ) ( not ( = ?auto_346551 ?auto_346558 ) ) ( not ( = ?auto_346551 ?auto_346559 ) ) ( not ( = ?auto_346552 ?auto_346553 ) ) ( not ( = ?auto_346552 ?auto_346554 ) ) ( not ( = ?auto_346552 ?auto_346555 ) ) ( not ( = ?auto_346552 ?auto_346556 ) ) ( not ( = ?auto_346552 ?auto_346557 ) ) ( not ( = ?auto_346552 ?auto_346558 ) ) ( not ( = ?auto_346552 ?auto_346559 ) ) ( not ( = ?auto_346553 ?auto_346554 ) ) ( not ( = ?auto_346553 ?auto_346555 ) ) ( not ( = ?auto_346553 ?auto_346556 ) ) ( not ( = ?auto_346553 ?auto_346557 ) ) ( not ( = ?auto_346553 ?auto_346558 ) ) ( not ( = ?auto_346553 ?auto_346559 ) ) ( not ( = ?auto_346554 ?auto_346555 ) ) ( not ( = ?auto_346554 ?auto_346556 ) ) ( not ( = ?auto_346554 ?auto_346557 ) ) ( not ( = ?auto_346554 ?auto_346558 ) ) ( not ( = ?auto_346554 ?auto_346559 ) ) ( not ( = ?auto_346555 ?auto_346556 ) ) ( not ( = ?auto_346555 ?auto_346557 ) ) ( not ( = ?auto_346555 ?auto_346558 ) ) ( not ( = ?auto_346555 ?auto_346559 ) ) ( not ( = ?auto_346556 ?auto_346557 ) ) ( not ( = ?auto_346556 ?auto_346558 ) ) ( not ( = ?auto_346556 ?auto_346559 ) ) ( not ( = ?auto_346557 ?auto_346558 ) ) ( not ( = ?auto_346557 ?auto_346559 ) ) ( not ( = ?auto_346558 ?auto_346559 ) ) ( ON ?auto_346557 ?auto_346558 ) ( ON ?auto_346556 ?auto_346557 ) ( ON ?auto_346555 ?auto_346556 ) ( ON ?auto_346554 ?auto_346555 ) ( CLEAR ?auto_346552 ) ( ON ?auto_346553 ?auto_346554 ) ( CLEAR ?auto_346553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_346546 ?auto_346547 ?auto_346548 ?auto_346549 ?auto_346550 ?auto_346551 ?auto_346552 ?auto_346553 )
      ( MAKE-13PILE ?auto_346546 ?auto_346547 ?auto_346548 ?auto_346549 ?auto_346550 ?auto_346551 ?auto_346552 ?auto_346553 ?auto_346554 ?auto_346555 ?auto_346556 ?auto_346557 ?auto_346558 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_346573 - BLOCK
      ?auto_346574 - BLOCK
      ?auto_346575 - BLOCK
      ?auto_346576 - BLOCK
      ?auto_346577 - BLOCK
      ?auto_346578 - BLOCK
      ?auto_346579 - BLOCK
      ?auto_346580 - BLOCK
      ?auto_346581 - BLOCK
      ?auto_346582 - BLOCK
      ?auto_346583 - BLOCK
      ?auto_346584 - BLOCK
      ?auto_346585 - BLOCK
    )
    :vars
    (
      ?auto_346586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346585 ?auto_346586 ) ( ON-TABLE ?auto_346573 ) ( ON ?auto_346574 ?auto_346573 ) ( ON ?auto_346575 ?auto_346574 ) ( ON ?auto_346576 ?auto_346575 ) ( ON ?auto_346577 ?auto_346576 ) ( ON ?auto_346578 ?auto_346577 ) ( not ( = ?auto_346573 ?auto_346574 ) ) ( not ( = ?auto_346573 ?auto_346575 ) ) ( not ( = ?auto_346573 ?auto_346576 ) ) ( not ( = ?auto_346573 ?auto_346577 ) ) ( not ( = ?auto_346573 ?auto_346578 ) ) ( not ( = ?auto_346573 ?auto_346579 ) ) ( not ( = ?auto_346573 ?auto_346580 ) ) ( not ( = ?auto_346573 ?auto_346581 ) ) ( not ( = ?auto_346573 ?auto_346582 ) ) ( not ( = ?auto_346573 ?auto_346583 ) ) ( not ( = ?auto_346573 ?auto_346584 ) ) ( not ( = ?auto_346573 ?auto_346585 ) ) ( not ( = ?auto_346573 ?auto_346586 ) ) ( not ( = ?auto_346574 ?auto_346575 ) ) ( not ( = ?auto_346574 ?auto_346576 ) ) ( not ( = ?auto_346574 ?auto_346577 ) ) ( not ( = ?auto_346574 ?auto_346578 ) ) ( not ( = ?auto_346574 ?auto_346579 ) ) ( not ( = ?auto_346574 ?auto_346580 ) ) ( not ( = ?auto_346574 ?auto_346581 ) ) ( not ( = ?auto_346574 ?auto_346582 ) ) ( not ( = ?auto_346574 ?auto_346583 ) ) ( not ( = ?auto_346574 ?auto_346584 ) ) ( not ( = ?auto_346574 ?auto_346585 ) ) ( not ( = ?auto_346574 ?auto_346586 ) ) ( not ( = ?auto_346575 ?auto_346576 ) ) ( not ( = ?auto_346575 ?auto_346577 ) ) ( not ( = ?auto_346575 ?auto_346578 ) ) ( not ( = ?auto_346575 ?auto_346579 ) ) ( not ( = ?auto_346575 ?auto_346580 ) ) ( not ( = ?auto_346575 ?auto_346581 ) ) ( not ( = ?auto_346575 ?auto_346582 ) ) ( not ( = ?auto_346575 ?auto_346583 ) ) ( not ( = ?auto_346575 ?auto_346584 ) ) ( not ( = ?auto_346575 ?auto_346585 ) ) ( not ( = ?auto_346575 ?auto_346586 ) ) ( not ( = ?auto_346576 ?auto_346577 ) ) ( not ( = ?auto_346576 ?auto_346578 ) ) ( not ( = ?auto_346576 ?auto_346579 ) ) ( not ( = ?auto_346576 ?auto_346580 ) ) ( not ( = ?auto_346576 ?auto_346581 ) ) ( not ( = ?auto_346576 ?auto_346582 ) ) ( not ( = ?auto_346576 ?auto_346583 ) ) ( not ( = ?auto_346576 ?auto_346584 ) ) ( not ( = ?auto_346576 ?auto_346585 ) ) ( not ( = ?auto_346576 ?auto_346586 ) ) ( not ( = ?auto_346577 ?auto_346578 ) ) ( not ( = ?auto_346577 ?auto_346579 ) ) ( not ( = ?auto_346577 ?auto_346580 ) ) ( not ( = ?auto_346577 ?auto_346581 ) ) ( not ( = ?auto_346577 ?auto_346582 ) ) ( not ( = ?auto_346577 ?auto_346583 ) ) ( not ( = ?auto_346577 ?auto_346584 ) ) ( not ( = ?auto_346577 ?auto_346585 ) ) ( not ( = ?auto_346577 ?auto_346586 ) ) ( not ( = ?auto_346578 ?auto_346579 ) ) ( not ( = ?auto_346578 ?auto_346580 ) ) ( not ( = ?auto_346578 ?auto_346581 ) ) ( not ( = ?auto_346578 ?auto_346582 ) ) ( not ( = ?auto_346578 ?auto_346583 ) ) ( not ( = ?auto_346578 ?auto_346584 ) ) ( not ( = ?auto_346578 ?auto_346585 ) ) ( not ( = ?auto_346578 ?auto_346586 ) ) ( not ( = ?auto_346579 ?auto_346580 ) ) ( not ( = ?auto_346579 ?auto_346581 ) ) ( not ( = ?auto_346579 ?auto_346582 ) ) ( not ( = ?auto_346579 ?auto_346583 ) ) ( not ( = ?auto_346579 ?auto_346584 ) ) ( not ( = ?auto_346579 ?auto_346585 ) ) ( not ( = ?auto_346579 ?auto_346586 ) ) ( not ( = ?auto_346580 ?auto_346581 ) ) ( not ( = ?auto_346580 ?auto_346582 ) ) ( not ( = ?auto_346580 ?auto_346583 ) ) ( not ( = ?auto_346580 ?auto_346584 ) ) ( not ( = ?auto_346580 ?auto_346585 ) ) ( not ( = ?auto_346580 ?auto_346586 ) ) ( not ( = ?auto_346581 ?auto_346582 ) ) ( not ( = ?auto_346581 ?auto_346583 ) ) ( not ( = ?auto_346581 ?auto_346584 ) ) ( not ( = ?auto_346581 ?auto_346585 ) ) ( not ( = ?auto_346581 ?auto_346586 ) ) ( not ( = ?auto_346582 ?auto_346583 ) ) ( not ( = ?auto_346582 ?auto_346584 ) ) ( not ( = ?auto_346582 ?auto_346585 ) ) ( not ( = ?auto_346582 ?auto_346586 ) ) ( not ( = ?auto_346583 ?auto_346584 ) ) ( not ( = ?auto_346583 ?auto_346585 ) ) ( not ( = ?auto_346583 ?auto_346586 ) ) ( not ( = ?auto_346584 ?auto_346585 ) ) ( not ( = ?auto_346584 ?auto_346586 ) ) ( not ( = ?auto_346585 ?auto_346586 ) ) ( ON ?auto_346584 ?auto_346585 ) ( ON ?auto_346583 ?auto_346584 ) ( ON ?auto_346582 ?auto_346583 ) ( ON ?auto_346581 ?auto_346582 ) ( ON ?auto_346580 ?auto_346581 ) ( CLEAR ?auto_346578 ) ( ON ?auto_346579 ?auto_346580 ) ( CLEAR ?auto_346579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_346573 ?auto_346574 ?auto_346575 ?auto_346576 ?auto_346577 ?auto_346578 ?auto_346579 )
      ( MAKE-13PILE ?auto_346573 ?auto_346574 ?auto_346575 ?auto_346576 ?auto_346577 ?auto_346578 ?auto_346579 ?auto_346580 ?auto_346581 ?auto_346582 ?auto_346583 ?auto_346584 ?auto_346585 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_346600 - BLOCK
      ?auto_346601 - BLOCK
      ?auto_346602 - BLOCK
      ?auto_346603 - BLOCK
      ?auto_346604 - BLOCK
      ?auto_346605 - BLOCK
      ?auto_346606 - BLOCK
      ?auto_346607 - BLOCK
      ?auto_346608 - BLOCK
      ?auto_346609 - BLOCK
      ?auto_346610 - BLOCK
      ?auto_346611 - BLOCK
      ?auto_346612 - BLOCK
    )
    :vars
    (
      ?auto_346613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346612 ?auto_346613 ) ( ON-TABLE ?auto_346600 ) ( ON ?auto_346601 ?auto_346600 ) ( ON ?auto_346602 ?auto_346601 ) ( ON ?auto_346603 ?auto_346602 ) ( ON ?auto_346604 ?auto_346603 ) ( ON ?auto_346605 ?auto_346604 ) ( not ( = ?auto_346600 ?auto_346601 ) ) ( not ( = ?auto_346600 ?auto_346602 ) ) ( not ( = ?auto_346600 ?auto_346603 ) ) ( not ( = ?auto_346600 ?auto_346604 ) ) ( not ( = ?auto_346600 ?auto_346605 ) ) ( not ( = ?auto_346600 ?auto_346606 ) ) ( not ( = ?auto_346600 ?auto_346607 ) ) ( not ( = ?auto_346600 ?auto_346608 ) ) ( not ( = ?auto_346600 ?auto_346609 ) ) ( not ( = ?auto_346600 ?auto_346610 ) ) ( not ( = ?auto_346600 ?auto_346611 ) ) ( not ( = ?auto_346600 ?auto_346612 ) ) ( not ( = ?auto_346600 ?auto_346613 ) ) ( not ( = ?auto_346601 ?auto_346602 ) ) ( not ( = ?auto_346601 ?auto_346603 ) ) ( not ( = ?auto_346601 ?auto_346604 ) ) ( not ( = ?auto_346601 ?auto_346605 ) ) ( not ( = ?auto_346601 ?auto_346606 ) ) ( not ( = ?auto_346601 ?auto_346607 ) ) ( not ( = ?auto_346601 ?auto_346608 ) ) ( not ( = ?auto_346601 ?auto_346609 ) ) ( not ( = ?auto_346601 ?auto_346610 ) ) ( not ( = ?auto_346601 ?auto_346611 ) ) ( not ( = ?auto_346601 ?auto_346612 ) ) ( not ( = ?auto_346601 ?auto_346613 ) ) ( not ( = ?auto_346602 ?auto_346603 ) ) ( not ( = ?auto_346602 ?auto_346604 ) ) ( not ( = ?auto_346602 ?auto_346605 ) ) ( not ( = ?auto_346602 ?auto_346606 ) ) ( not ( = ?auto_346602 ?auto_346607 ) ) ( not ( = ?auto_346602 ?auto_346608 ) ) ( not ( = ?auto_346602 ?auto_346609 ) ) ( not ( = ?auto_346602 ?auto_346610 ) ) ( not ( = ?auto_346602 ?auto_346611 ) ) ( not ( = ?auto_346602 ?auto_346612 ) ) ( not ( = ?auto_346602 ?auto_346613 ) ) ( not ( = ?auto_346603 ?auto_346604 ) ) ( not ( = ?auto_346603 ?auto_346605 ) ) ( not ( = ?auto_346603 ?auto_346606 ) ) ( not ( = ?auto_346603 ?auto_346607 ) ) ( not ( = ?auto_346603 ?auto_346608 ) ) ( not ( = ?auto_346603 ?auto_346609 ) ) ( not ( = ?auto_346603 ?auto_346610 ) ) ( not ( = ?auto_346603 ?auto_346611 ) ) ( not ( = ?auto_346603 ?auto_346612 ) ) ( not ( = ?auto_346603 ?auto_346613 ) ) ( not ( = ?auto_346604 ?auto_346605 ) ) ( not ( = ?auto_346604 ?auto_346606 ) ) ( not ( = ?auto_346604 ?auto_346607 ) ) ( not ( = ?auto_346604 ?auto_346608 ) ) ( not ( = ?auto_346604 ?auto_346609 ) ) ( not ( = ?auto_346604 ?auto_346610 ) ) ( not ( = ?auto_346604 ?auto_346611 ) ) ( not ( = ?auto_346604 ?auto_346612 ) ) ( not ( = ?auto_346604 ?auto_346613 ) ) ( not ( = ?auto_346605 ?auto_346606 ) ) ( not ( = ?auto_346605 ?auto_346607 ) ) ( not ( = ?auto_346605 ?auto_346608 ) ) ( not ( = ?auto_346605 ?auto_346609 ) ) ( not ( = ?auto_346605 ?auto_346610 ) ) ( not ( = ?auto_346605 ?auto_346611 ) ) ( not ( = ?auto_346605 ?auto_346612 ) ) ( not ( = ?auto_346605 ?auto_346613 ) ) ( not ( = ?auto_346606 ?auto_346607 ) ) ( not ( = ?auto_346606 ?auto_346608 ) ) ( not ( = ?auto_346606 ?auto_346609 ) ) ( not ( = ?auto_346606 ?auto_346610 ) ) ( not ( = ?auto_346606 ?auto_346611 ) ) ( not ( = ?auto_346606 ?auto_346612 ) ) ( not ( = ?auto_346606 ?auto_346613 ) ) ( not ( = ?auto_346607 ?auto_346608 ) ) ( not ( = ?auto_346607 ?auto_346609 ) ) ( not ( = ?auto_346607 ?auto_346610 ) ) ( not ( = ?auto_346607 ?auto_346611 ) ) ( not ( = ?auto_346607 ?auto_346612 ) ) ( not ( = ?auto_346607 ?auto_346613 ) ) ( not ( = ?auto_346608 ?auto_346609 ) ) ( not ( = ?auto_346608 ?auto_346610 ) ) ( not ( = ?auto_346608 ?auto_346611 ) ) ( not ( = ?auto_346608 ?auto_346612 ) ) ( not ( = ?auto_346608 ?auto_346613 ) ) ( not ( = ?auto_346609 ?auto_346610 ) ) ( not ( = ?auto_346609 ?auto_346611 ) ) ( not ( = ?auto_346609 ?auto_346612 ) ) ( not ( = ?auto_346609 ?auto_346613 ) ) ( not ( = ?auto_346610 ?auto_346611 ) ) ( not ( = ?auto_346610 ?auto_346612 ) ) ( not ( = ?auto_346610 ?auto_346613 ) ) ( not ( = ?auto_346611 ?auto_346612 ) ) ( not ( = ?auto_346611 ?auto_346613 ) ) ( not ( = ?auto_346612 ?auto_346613 ) ) ( ON ?auto_346611 ?auto_346612 ) ( ON ?auto_346610 ?auto_346611 ) ( ON ?auto_346609 ?auto_346610 ) ( ON ?auto_346608 ?auto_346609 ) ( ON ?auto_346607 ?auto_346608 ) ( CLEAR ?auto_346605 ) ( ON ?auto_346606 ?auto_346607 ) ( CLEAR ?auto_346606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_346600 ?auto_346601 ?auto_346602 ?auto_346603 ?auto_346604 ?auto_346605 ?auto_346606 )
      ( MAKE-13PILE ?auto_346600 ?auto_346601 ?auto_346602 ?auto_346603 ?auto_346604 ?auto_346605 ?auto_346606 ?auto_346607 ?auto_346608 ?auto_346609 ?auto_346610 ?auto_346611 ?auto_346612 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_346627 - BLOCK
      ?auto_346628 - BLOCK
      ?auto_346629 - BLOCK
      ?auto_346630 - BLOCK
      ?auto_346631 - BLOCK
      ?auto_346632 - BLOCK
      ?auto_346633 - BLOCK
      ?auto_346634 - BLOCK
      ?auto_346635 - BLOCK
      ?auto_346636 - BLOCK
      ?auto_346637 - BLOCK
      ?auto_346638 - BLOCK
      ?auto_346639 - BLOCK
    )
    :vars
    (
      ?auto_346640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346639 ?auto_346640 ) ( ON-TABLE ?auto_346627 ) ( ON ?auto_346628 ?auto_346627 ) ( ON ?auto_346629 ?auto_346628 ) ( ON ?auto_346630 ?auto_346629 ) ( ON ?auto_346631 ?auto_346630 ) ( not ( = ?auto_346627 ?auto_346628 ) ) ( not ( = ?auto_346627 ?auto_346629 ) ) ( not ( = ?auto_346627 ?auto_346630 ) ) ( not ( = ?auto_346627 ?auto_346631 ) ) ( not ( = ?auto_346627 ?auto_346632 ) ) ( not ( = ?auto_346627 ?auto_346633 ) ) ( not ( = ?auto_346627 ?auto_346634 ) ) ( not ( = ?auto_346627 ?auto_346635 ) ) ( not ( = ?auto_346627 ?auto_346636 ) ) ( not ( = ?auto_346627 ?auto_346637 ) ) ( not ( = ?auto_346627 ?auto_346638 ) ) ( not ( = ?auto_346627 ?auto_346639 ) ) ( not ( = ?auto_346627 ?auto_346640 ) ) ( not ( = ?auto_346628 ?auto_346629 ) ) ( not ( = ?auto_346628 ?auto_346630 ) ) ( not ( = ?auto_346628 ?auto_346631 ) ) ( not ( = ?auto_346628 ?auto_346632 ) ) ( not ( = ?auto_346628 ?auto_346633 ) ) ( not ( = ?auto_346628 ?auto_346634 ) ) ( not ( = ?auto_346628 ?auto_346635 ) ) ( not ( = ?auto_346628 ?auto_346636 ) ) ( not ( = ?auto_346628 ?auto_346637 ) ) ( not ( = ?auto_346628 ?auto_346638 ) ) ( not ( = ?auto_346628 ?auto_346639 ) ) ( not ( = ?auto_346628 ?auto_346640 ) ) ( not ( = ?auto_346629 ?auto_346630 ) ) ( not ( = ?auto_346629 ?auto_346631 ) ) ( not ( = ?auto_346629 ?auto_346632 ) ) ( not ( = ?auto_346629 ?auto_346633 ) ) ( not ( = ?auto_346629 ?auto_346634 ) ) ( not ( = ?auto_346629 ?auto_346635 ) ) ( not ( = ?auto_346629 ?auto_346636 ) ) ( not ( = ?auto_346629 ?auto_346637 ) ) ( not ( = ?auto_346629 ?auto_346638 ) ) ( not ( = ?auto_346629 ?auto_346639 ) ) ( not ( = ?auto_346629 ?auto_346640 ) ) ( not ( = ?auto_346630 ?auto_346631 ) ) ( not ( = ?auto_346630 ?auto_346632 ) ) ( not ( = ?auto_346630 ?auto_346633 ) ) ( not ( = ?auto_346630 ?auto_346634 ) ) ( not ( = ?auto_346630 ?auto_346635 ) ) ( not ( = ?auto_346630 ?auto_346636 ) ) ( not ( = ?auto_346630 ?auto_346637 ) ) ( not ( = ?auto_346630 ?auto_346638 ) ) ( not ( = ?auto_346630 ?auto_346639 ) ) ( not ( = ?auto_346630 ?auto_346640 ) ) ( not ( = ?auto_346631 ?auto_346632 ) ) ( not ( = ?auto_346631 ?auto_346633 ) ) ( not ( = ?auto_346631 ?auto_346634 ) ) ( not ( = ?auto_346631 ?auto_346635 ) ) ( not ( = ?auto_346631 ?auto_346636 ) ) ( not ( = ?auto_346631 ?auto_346637 ) ) ( not ( = ?auto_346631 ?auto_346638 ) ) ( not ( = ?auto_346631 ?auto_346639 ) ) ( not ( = ?auto_346631 ?auto_346640 ) ) ( not ( = ?auto_346632 ?auto_346633 ) ) ( not ( = ?auto_346632 ?auto_346634 ) ) ( not ( = ?auto_346632 ?auto_346635 ) ) ( not ( = ?auto_346632 ?auto_346636 ) ) ( not ( = ?auto_346632 ?auto_346637 ) ) ( not ( = ?auto_346632 ?auto_346638 ) ) ( not ( = ?auto_346632 ?auto_346639 ) ) ( not ( = ?auto_346632 ?auto_346640 ) ) ( not ( = ?auto_346633 ?auto_346634 ) ) ( not ( = ?auto_346633 ?auto_346635 ) ) ( not ( = ?auto_346633 ?auto_346636 ) ) ( not ( = ?auto_346633 ?auto_346637 ) ) ( not ( = ?auto_346633 ?auto_346638 ) ) ( not ( = ?auto_346633 ?auto_346639 ) ) ( not ( = ?auto_346633 ?auto_346640 ) ) ( not ( = ?auto_346634 ?auto_346635 ) ) ( not ( = ?auto_346634 ?auto_346636 ) ) ( not ( = ?auto_346634 ?auto_346637 ) ) ( not ( = ?auto_346634 ?auto_346638 ) ) ( not ( = ?auto_346634 ?auto_346639 ) ) ( not ( = ?auto_346634 ?auto_346640 ) ) ( not ( = ?auto_346635 ?auto_346636 ) ) ( not ( = ?auto_346635 ?auto_346637 ) ) ( not ( = ?auto_346635 ?auto_346638 ) ) ( not ( = ?auto_346635 ?auto_346639 ) ) ( not ( = ?auto_346635 ?auto_346640 ) ) ( not ( = ?auto_346636 ?auto_346637 ) ) ( not ( = ?auto_346636 ?auto_346638 ) ) ( not ( = ?auto_346636 ?auto_346639 ) ) ( not ( = ?auto_346636 ?auto_346640 ) ) ( not ( = ?auto_346637 ?auto_346638 ) ) ( not ( = ?auto_346637 ?auto_346639 ) ) ( not ( = ?auto_346637 ?auto_346640 ) ) ( not ( = ?auto_346638 ?auto_346639 ) ) ( not ( = ?auto_346638 ?auto_346640 ) ) ( not ( = ?auto_346639 ?auto_346640 ) ) ( ON ?auto_346638 ?auto_346639 ) ( ON ?auto_346637 ?auto_346638 ) ( ON ?auto_346636 ?auto_346637 ) ( ON ?auto_346635 ?auto_346636 ) ( ON ?auto_346634 ?auto_346635 ) ( ON ?auto_346633 ?auto_346634 ) ( CLEAR ?auto_346631 ) ( ON ?auto_346632 ?auto_346633 ) ( CLEAR ?auto_346632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_346627 ?auto_346628 ?auto_346629 ?auto_346630 ?auto_346631 ?auto_346632 )
      ( MAKE-13PILE ?auto_346627 ?auto_346628 ?auto_346629 ?auto_346630 ?auto_346631 ?auto_346632 ?auto_346633 ?auto_346634 ?auto_346635 ?auto_346636 ?auto_346637 ?auto_346638 ?auto_346639 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_346654 - BLOCK
      ?auto_346655 - BLOCK
      ?auto_346656 - BLOCK
      ?auto_346657 - BLOCK
      ?auto_346658 - BLOCK
      ?auto_346659 - BLOCK
      ?auto_346660 - BLOCK
      ?auto_346661 - BLOCK
      ?auto_346662 - BLOCK
      ?auto_346663 - BLOCK
      ?auto_346664 - BLOCK
      ?auto_346665 - BLOCK
      ?auto_346666 - BLOCK
    )
    :vars
    (
      ?auto_346667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346666 ?auto_346667 ) ( ON-TABLE ?auto_346654 ) ( ON ?auto_346655 ?auto_346654 ) ( ON ?auto_346656 ?auto_346655 ) ( ON ?auto_346657 ?auto_346656 ) ( ON ?auto_346658 ?auto_346657 ) ( not ( = ?auto_346654 ?auto_346655 ) ) ( not ( = ?auto_346654 ?auto_346656 ) ) ( not ( = ?auto_346654 ?auto_346657 ) ) ( not ( = ?auto_346654 ?auto_346658 ) ) ( not ( = ?auto_346654 ?auto_346659 ) ) ( not ( = ?auto_346654 ?auto_346660 ) ) ( not ( = ?auto_346654 ?auto_346661 ) ) ( not ( = ?auto_346654 ?auto_346662 ) ) ( not ( = ?auto_346654 ?auto_346663 ) ) ( not ( = ?auto_346654 ?auto_346664 ) ) ( not ( = ?auto_346654 ?auto_346665 ) ) ( not ( = ?auto_346654 ?auto_346666 ) ) ( not ( = ?auto_346654 ?auto_346667 ) ) ( not ( = ?auto_346655 ?auto_346656 ) ) ( not ( = ?auto_346655 ?auto_346657 ) ) ( not ( = ?auto_346655 ?auto_346658 ) ) ( not ( = ?auto_346655 ?auto_346659 ) ) ( not ( = ?auto_346655 ?auto_346660 ) ) ( not ( = ?auto_346655 ?auto_346661 ) ) ( not ( = ?auto_346655 ?auto_346662 ) ) ( not ( = ?auto_346655 ?auto_346663 ) ) ( not ( = ?auto_346655 ?auto_346664 ) ) ( not ( = ?auto_346655 ?auto_346665 ) ) ( not ( = ?auto_346655 ?auto_346666 ) ) ( not ( = ?auto_346655 ?auto_346667 ) ) ( not ( = ?auto_346656 ?auto_346657 ) ) ( not ( = ?auto_346656 ?auto_346658 ) ) ( not ( = ?auto_346656 ?auto_346659 ) ) ( not ( = ?auto_346656 ?auto_346660 ) ) ( not ( = ?auto_346656 ?auto_346661 ) ) ( not ( = ?auto_346656 ?auto_346662 ) ) ( not ( = ?auto_346656 ?auto_346663 ) ) ( not ( = ?auto_346656 ?auto_346664 ) ) ( not ( = ?auto_346656 ?auto_346665 ) ) ( not ( = ?auto_346656 ?auto_346666 ) ) ( not ( = ?auto_346656 ?auto_346667 ) ) ( not ( = ?auto_346657 ?auto_346658 ) ) ( not ( = ?auto_346657 ?auto_346659 ) ) ( not ( = ?auto_346657 ?auto_346660 ) ) ( not ( = ?auto_346657 ?auto_346661 ) ) ( not ( = ?auto_346657 ?auto_346662 ) ) ( not ( = ?auto_346657 ?auto_346663 ) ) ( not ( = ?auto_346657 ?auto_346664 ) ) ( not ( = ?auto_346657 ?auto_346665 ) ) ( not ( = ?auto_346657 ?auto_346666 ) ) ( not ( = ?auto_346657 ?auto_346667 ) ) ( not ( = ?auto_346658 ?auto_346659 ) ) ( not ( = ?auto_346658 ?auto_346660 ) ) ( not ( = ?auto_346658 ?auto_346661 ) ) ( not ( = ?auto_346658 ?auto_346662 ) ) ( not ( = ?auto_346658 ?auto_346663 ) ) ( not ( = ?auto_346658 ?auto_346664 ) ) ( not ( = ?auto_346658 ?auto_346665 ) ) ( not ( = ?auto_346658 ?auto_346666 ) ) ( not ( = ?auto_346658 ?auto_346667 ) ) ( not ( = ?auto_346659 ?auto_346660 ) ) ( not ( = ?auto_346659 ?auto_346661 ) ) ( not ( = ?auto_346659 ?auto_346662 ) ) ( not ( = ?auto_346659 ?auto_346663 ) ) ( not ( = ?auto_346659 ?auto_346664 ) ) ( not ( = ?auto_346659 ?auto_346665 ) ) ( not ( = ?auto_346659 ?auto_346666 ) ) ( not ( = ?auto_346659 ?auto_346667 ) ) ( not ( = ?auto_346660 ?auto_346661 ) ) ( not ( = ?auto_346660 ?auto_346662 ) ) ( not ( = ?auto_346660 ?auto_346663 ) ) ( not ( = ?auto_346660 ?auto_346664 ) ) ( not ( = ?auto_346660 ?auto_346665 ) ) ( not ( = ?auto_346660 ?auto_346666 ) ) ( not ( = ?auto_346660 ?auto_346667 ) ) ( not ( = ?auto_346661 ?auto_346662 ) ) ( not ( = ?auto_346661 ?auto_346663 ) ) ( not ( = ?auto_346661 ?auto_346664 ) ) ( not ( = ?auto_346661 ?auto_346665 ) ) ( not ( = ?auto_346661 ?auto_346666 ) ) ( not ( = ?auto_346661 ?auto_346667 ) ) ( not ( = ?auto_346662 ?auto_346663 ) ) ( not ( = ?auto_346662 ?auto_346664 ) ) ( not ( = ?auto_346662 ?auto_346665 ) ) ( not ( = ?auto_346662 ?auto_346666 ) ) ( not ( = ?auto_346662 ?auto_346667 ) ) ( not ( = ?auto_346663 ?auto_346664 ) ) ( not ( = ?auto_346663 ?auto_346665 ) ) ( not ( = ?auto_346663 ?auto_346666 ) ) ( not ( = ?auto_346663 ?auto_346667 ) ) ( not ( = ?auto_346664 ?auto_346665 ) ) ( not ( = ?auto_346664 ?auto_346666 ) ) ( not ( = ?auto_346664 ?auto_346667 ) ) ( not ( = ?auto_346665 ?auto_346666 ) ) ( not ( = ?auto_346665 ?auto_346667 ) ) ( not ( = ?auto_346666 ?auto_346667 ) ) ( ON ?auto_346665 ?auto_346666 ) ( ON ?auto_346664 ?auto_346665 ) ( ON ?auto_346663 ?auto_346664 ) ( ON ?auto_346662 ?auto_346663 ) ( ON ?auto_346661 ?auto_346662 ) ( ON ?auto_346660 ?auto_346661 ) ( CLEAR ?auto_346658 ) ( ON ?auto_346659 ?auto_346660 ) ( CLEAR ?auto_346659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_346654 ?auto_346655 ?auto_346656 ?auto_346657 ?auto_346658 ?auto_346659 )
      ( MAKE-13PILE ?auto_346654 ?auto_346655 ?auto_346656 ?auto_346657 ?auto_346658 ?auto_346659 ?auto_346660 ?auto_346661 ?auto_346662 ?auto_346663 ?auto_346664 ?auto_346665 ?auto_346666 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_346681 - BLOCK
      ?auto_346682 - BLOCK
      ?auto_346683 - BLOCK
      ?auto_346684 - BLOCK
      ?auto_346685 - BLOCK
      ?auto_346686 - BLOCK
      ?auto_346687 - BLOCK
      ?auto_346688 - BLOCK
      ?auto_346689 - BLOCK
      ?auto_346690 - BLOCK
      ?auto_346691 - BLOCK
      ?auto_346692 - BLOCK
      ?auto_346693 - BLOCK
    )
    :vars
    (
      ?auto_346694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346693 ?auto_346694 ) ( ON-TABLE ?auto_346681 ) ( ON ?auto_346682 ?auto_346681 ) ( ON ?auto_346683 ?auto_346682 ) ( ON ?auto_346684 ?auto_346683 ) ( not ( = ?auto_346681 ?auto_346682 ) ) ( not ( = ?auto_346681 ?auto_346683 ) ) ( not ( = ?auto_346681 ?auto_346684 ) ) ( not ( = ?auto_346681 ?auto_346685 ) ) ( not ( = ?auto_346681 ?auto_346686 ) ) ( not ( = ?auto_346681 ?auto_346687 ) ) ( not ( = ?auto_346681 ?auto_346688 ) ) ( not ( = ?auto_346681 ?auto_346689 ) ) ( not ( = ?auto_346681 ?auto_346690 ) ) ( not ( = ?auto_346681 ?auto_346691 ) ) ( not ( = ?auto_346681 ?auto_346692 ) ) ( not ( = ?auto_346681 ?auto_346693 ) ) ( not ( = ?auto_346681 ?auto_346694 ) ) ( not ( = ?auto_346682 ?auto_346683 ) ) ( not ( = ?auto_346682 ?auto_346684 ) ) ( not ( = ?auto_346682 ?auto_346685 ) ) ( not ( = ?auto_346682 ?auto_346686 ) ) ( not ( = ?auto_346682 ?auto_346687 ) ) ( not ( = ?auto_346682 ?auto_346688 ) ) ( not ( = ?auto_346682 ?auto_346689 ) ) ( not ( = ?auto_346682 ?auto_346690 ) ) ( not ( = ?auto_346682 ?auto_346691 ) ) ( not ( = ?auto_346682 ?auto_346692 ) ) ( not ( = ?auto_346682 ?auto_346693 ) ) ( not ( = ?auto_346682 ?auto_346694 ) ) ( not ( = ?auto_346683 ?auto_346684 ) ) ( not ( = ?auto_346683 ?auto_346685 ) ) ( not ( = ?auto_346683 ?auto_346686 ) ) ( not ( = ?auto_346683 ?auto_346687 ) ) ( not ( = ?auto_346683 ?auto_346688 ) ) ( not ( = ?auto_346683 ?auto_346689 ) ) ( not ( = ?auto_346683 ?auto_346690 ) ) ( not ( = ?auto_346683 ?auto_346691 ) ) ( not ( = ?auto_346683 ?auto_346692 ) ) ( not ( = ?auto_346683 ?auto_346693 ) ) ( not ( = ?auto_346683 ?auto_346694 ) ) ( not ( = ?auto_346684 ?auto_346685 ) ) ( not ( = ?auto_346684 ?auto_346686 ) ) ( not ( = ?auto_346684 ?auto_346687 ) ) ( not ( = ?auto_346684 ?auto_346688 ) ) ( not ( = ?auto_346684 ?auto_346689 ) ) ( not ( = ?auto_346684 ?auto_346690 ) ) ( not ( = ?auto_346684 ?auto_346691 ) ) ( not ( = ?auto_346684 ?auto_346692 ) ) ( not ( = ?auto_346684 ?auto_346693 ) ) ( not ( = ?auto_346684 ?auto_346694 ) ) ( not ( = ?auto_346685 ?auto_346686 ) ) ( not ( = ?auto_346685 ?auto_346687 ) ) ( not ( = ?auto_346685 ?auto_346688 ) ) ( not ( = ?auto_346685 ?auto_346689 ) ) ( not ( = ?auto_346685 ?auto_346690 ) ) ( not ( = ?auto_346685 ?auto_346691 ) ) ( not ( = ?auto_346685 ?auto_346692 ) ) ( not ( = ?auto_346685 ?auto_346693 ) ) ( not ( = ?auto_346685 ?auto_346694 ) ) ( not ( = ?auto_346686 ?auto_346687 ) ) ( not ( = ?auto_346686 ?auto_346688 ) ) ( not ( = ?auto_346686 ?auto_346689 ) ) ( not ( = ?auto_346686 ?auto_346690 ) ) ( not ( = ?auto_346686 ?auto_346691 ) ) ( not ( = ?auto_346686 ?auto_346692 ) ) ( not ( = ?auto_346686 ?auto_346693 ) ) ( not ( = ?auto_346686 ?auto_346694 ) ) ( not ( = ?auto_346687 ?auto_346688 ) ) ( not ( = ?auto_346687 ?auto_346689 ) ) ( not ( = ?auto_346687 ?auto_346690 ) ) ( not ( = ?auto_346687 ?auto_346691 ) ) ( not ( = ?auto_346687 ?auto_346692 ) ) ( not ( = ?auto_346687 ?auto_346693 ) ) ( not ( = ?auto_346687 ?auto_346694 ) ) ( not ( = ?auto_346688 ?auto_346689 ) ) ( not ( = ?auto_346688 ?auto_346690 ) ) ( not ( = ?auto_346688 ?auto_346691 ) ) ( not ( = ?auto_346688 ?auto_346692 ) ) ( not ( = ?auto_346688 ?auto_346693 ) ) ( not ( = ?auto_346688 ?auto_346694 ) ) ( not ( = ?auto_346689 ?auto_346690 ) ) ( not ( = ?auto_346689 ?auto_346691 ) ) ( not ( = ?auto_346689 ?auto_346692 ) ) ( not ( = ?auto_346689 ?auto_346693 ) ) ( not ( = ?auto_346689 ?auto_346694 ) ) ( not ( = ?auto_346690 ?auto_346691 ) ) ( not ( = ?auto_346690 ?auto_346692 ) ) ( not ( = ?auto_346690 ?auto_346693 ) ) ( not ( = ?auto_346690 ?auto_346694 ) ) ( not ( = ?auto_346691 ?auto_346692 ) ) ( not ( = ?auto_346691 ?auto_346693 ) ) ( not ( = ?auto_346691 ?auto_346694 ) ) ( not ( = ?auto_346692 ?auto_346693 ) ) ( not ( = ?auto_346692 ?auto_346694 ) ) ( not ( = ?auto_346693 ?auto_346694 ) ) ( ON ?auto_346692 ?auto_346693 ) ( ON ?auto_346691 ?auto_346692 ) ( ON ?auto_346690 ?auto_346691 ) ( ON ?auto_346689 ?auto_346690 ) ( ON ?auto_346688 ?auto_346689 ) ( ON ?auto_346687 ?auto_346688 ) ( ON ?auto_346686 ?auto_346687 ) ( CLEAR ?auto_346684 ) ( ON ?auto_346685 ?auto_346686 ) ( CLEAR ?auto_346685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_346681 ?auto_346682 ?auto_346683 ?auto_346684 ?auto_346685 )
      ( MAKE-13PILE ?auto_346681 ?auto_346682 ?auto_346683 ?auto_346684 ?auto_346685 ?auto_346686 ?auto_346687 ?auto_346688 ?auto_346689 ?auto_346690 ?auto_346691 ?auto_346692 ?auto_346693 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_346708 - BLOCK
      ?auto_346709 - BLOCK
      ?auto_346710 - BLOCK
      ?auto_346711 - BLOCK
      ?auto_346712 - BLOCK
      ?auto_346713 - BLOCK
      ?auto_346714 - BLOCK
      ?auto_346715 - BLOCK
      ?auto_346716 - BLOCK
      ?auto_346717 - BLOCK
      ?auto_346718 - BLOCK
      ?auto_346719 - BLOCK
      ?auto_346720 - BLOCK
    )
    :vars
    (
      ?auto_346721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346720 ?auto_346721 ) ( ON-TABLE ?auto_346708 ) ( ON ?auto_346709 ?auto_346708 ) ( ON ?auto_346710 ?auto_346709 ) ( ON ?auto_346711 ?auto_346710 ) ( not ( = ?auto_346708 ?auto_346709 ) ) ( not ( = ?auto_346708 ?auto_346710 ) ) ( not ( = ?auto_346708 ?auto_346711 ) ) ( not ( = ?auto_346708 ?auto_346712 ) ) ( not ( = ?auto_346708 ?auto_346713 ) ) ( not ( = ?auto_346708 ?auto_346714 ) ) ( not ( = ?auto_346708 ?auto_346715 ) ) ( not ( = ?auto_346708 ?auto_346716 ) ) ( not ( = ?auto_346708 ?auto_346717 ) ) ( not ( = ?auto_346708 ?auto_346718 ) ) ( not ( = ?auto_346708 ?auto_346719 ) ) ( not ( = ?auto_346708 ?auto_346720 ) ) ( not ( = ?auto_346708 ?auto_346721 ) ) ( not ( = ?auto_346709 ?auto_346710 ) ) ( not ( = ?auto_346709 ?auto_346711 ) ) ( not ( = ?auto_346709 ?auto_346712 ) ) ( not ( = ?auto_346709 ?auto_346713 ) ) ( not ( = ?auto_346709 ?auto_346714 ) ) ( not ( = ?auto_346709 ?auto_346715 ) ) ( not ( = ?auto_346709 ?auto_346716 ) ) ( not ( = ?auto_346709 ?auto_346717 ) ) ( not ( = ?auto_346709 ?auto_346718 ) ) ( not ( = ?auto_346709 ?auto_346719 ) ) ( not ( = ?auto_346709 ?auto_346720 ) ) ( not ( = ?auto_346709 ?auto_346721 ) ) ( not ( = ?auto_346710 ?auto_346711 ) ) ( not ( = ?auto_346710 ?auto_346712 ) ) ( not ( = ?auto_346710 ?auto_346713 ) ) ( not ( = ?auto_346710 ?auto_346714 ) ) ( not ( = ?auto_346710 ?auto_346715 ) ) ( not ( = ?auto_346710 ?auto_346716 ) ) ( not ( = ?auto_346710 ?auto_346717 ) ) ( not ( = ?auto_346710 ?auto_346718 ) ) ( not ( = ?auto_346710 ?auto_346719 ) ) ( not ( = ?auto_346710 ?auto_346720 ) ) ( not ( = ?auto_346710 ?auto_346721 ) ) ( not ( = ?auto_346711 ?auto_346712 ) ) ( not ( = ?auto_346711 ?auto_346713 ) ) ( not ( = ?auto_346711 ?auto_346714 ) ) ( not ( = ?auto_346711 ?auto_346715 ) ) ( not ( = ?auto_346711 ?auto_346716 ) ) ( not ( = ?auto_346711 ?auto_346717 ) ) ( not ( = ?auto_346711 ?auto_346718 ) ) ( not ( = ?auto_346711 ?auto_346719 ) ) ( not ( = ?auto_346711 ?auto_346720 ) ) ( not ( = ?auto_346711 ?auto_346721 ) ) ( not ( = ?auto_346712 ?auto_346713 ) ) ( not ( = ?auto_346712 ?auto_346714 ) ) ( not ( = ?auto_346712 ?auto_346715 ) ) ( not ( = ?auto_346712 ?auto_346716 ) ) ( not ( = ?auto_346712 ?auto_346717 ) ) ( not ( = ?auto_346712 ?auto_346718 ) ) ( not ( = ?auto_346712 ?auto_346719 ) ) ( not ( = ?auto_346712 ?auto_346720 ) ) ( not ( = ?auto_346712 ?auto_346721 ) ) ( not ( = ?auto_346713 ?auto_346714 ) ) ( not ( = ?auto_346713 ?auto_346715 ) ) ( not ( = ?auto_346713 ?auto_346716 ) ) ( not ( = ?auto_346713 ?auto_346717 ) ) ( not ( = ?auto_346713 ?auto_346718 ) ) ( not ( = ?auto_346713 ?auto_346719 ) ) ( not ( = ?auto_346713 ?auto_346720 ) ) ( not ( = ?auto_346713 ?auto_346721 ) ) ( not ( = ?auto_346714 ?auto_346715 ) ) ( not ( = ?auto_346714 ?auto_346716 ) ) ( not ( = ?auto_346714 ?auto_346717 ) ) ( not ( = ?auto_346714 ?auto_346718 ) ) ( not ( = ?auto_346714 ?auto_346719 ) ) ( not ( = ?auto_346714 ?auto_346720 ) ) ( not ( = ?auto_346714 ?auto_346721 ) ) ( not ( = ?auto_346715 ?auto_346716 ) ) ( not ( = ?auto_346715 ?auto_346717 ) ) ( not ( = ?auto_346715 ?auto_346718 ) ) ( not ( = ?auto_346715 ?auto_346719 ) ) ( not ( = ?auto_346715 ?auto_346720 ) ) ( not ( = ?auto_346715 ?auto_346721 ) ) ( not ( = ?auto_346716 ?auto_346717 ) ) ( not ( = ?auto_346716 ?auto_346718 ) ) ( not ( = ?auto_346716 ?auto_346719 ) ) ( not ( = ?auto_346716 ?auto_346720 ) ) ( not ( = ?auto_346716 ?auto_346721 ) ) ( not ( = ?auto_346717 ?auto_346718 ) ) ( not ( = ?auto_346717 ?auto_346719 ) ) ( not ( = ?auto_346717 ?auto_346720 ) ) ( not ( = ?auto_346717 ?auto_346721 ) ) ( not ( = ?auto_346718 ?auto_346719 ) ) ( not ( = ?auto_346718 ?auto_346720 ) ) ( not ( = ?auto_346718 ?auto_346721 ) ) ( not ( = ?auto_346719 ?auto_346720 ) ) ( not ( = ?auto_346719 ?auto_346721 ) ) ( not ( = ?auto_346720 ?auto_346721 ) ) ( ON ?auto_346719 ?auto_346720 ) ( ON ?auto_346718 ?auto_346719 ) ( ON ?auto_346717 ?auto_346718 ) ( ON ?auto_346716 ?auto_346717 ) ( ON ?auto_346715 ?auto_346716 ) ( ON ?auto_346714 ?auto_346715 ) ( ON ?auto_346713 ?auto_346714 ) ( CLEAR ?auto_346711 ) ( ON ?auto_346712 ?auto_346713 ) ( CLEAR ?auto_346712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_346708 ?auto_346709 ?auto_346710 ?auto_346711 ?auto_346712 )
      ( MAKE-13PILE ?auto_346708 ?auto_346709 ?auto_346710 ?auto_346711 ?auto_346712 ?auto_346713 ?auto_346714 ?auto_346715 ?auto_346716 ?auto_346717 ?auto_346718 ?auto_346719 ?auto_346720 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_346735 - BLOCK
      ?auto_346736 - BLOCK
      ?auto_346737 - BLOCK
      ?auto_346738 - BLOCK
      ?auto_346739 - BLOCK
      ?auto_346740 - BLOCK
      ?auto_346741 - BLOCK
      ?auto_346742 - BLOCK
      ?auto_346743 - BLOCK
      ?auto_346744 - BLOCK
      ?auto_346745 - BLOCK
      ?auto_346746 - BLOCK
      ?auto_346747 - BLOCK
    )
    :vars
    (
      ?auto_346748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346747 ?auto_346748 ) ( ON-TABLE ?auto_346735 ) ( ON ?auto_346736 ?auto_346735 ) ( ON ?auto_346737 ?auto_346736 ) ( not ( = ?auto_346735 ?auto_346736 ) ) ( not ( = ?auto_346735 ?auto_346737 ) ) ( not ( = ?auto_346735 ?auto_346738 ) ) ( not ( = ?auto_346735 ?auto_346739 ) ) ( not ( = ?auto_346735 ?auto_346740 ) ) ( not ( = ?auto_346735 ?auto_346741 ) ) ( not ( = ?auto_346735 ?auto_346742 ) ) ( not ( = ?auto_346735 ?auto_346743 ) ) ( not ( = ?auto_346735 ?auto_346744 ) ) ( not ( = ?auto_346735 ?auto_346745 ) ) ( not ( = ?auto_346735 ?auto_346746 ) ) ( not ( = ?auto_346735 ?auto_346747 ) ) ( not ( = ?auto_346735 ?auto_346748 ) ) ( not ( = ?auto_346736 ?auto_346737 ) ) ( not ( = ?auto_346736 ?auto_346738 ) ) ( not ( = ?auto_346736 ?auto_346739 ) ) ( not ( = ?auto_346736 ?auto_346740 ) ) ( not ( = ?auto_346736 ?auto_346741 ) ) ( not ( = ?auto_346736 ?auto_346742 ) ) ( not ( = ?auto_346736 ?auto_346743 ) ) ( not ( = ?auto_346736 ?auto_346744 ) ) ( not ( = ?auto_346736 ?auto_346745 ) ) ( not ( = ?auto_346736 ?auto_346746 ) ) ( not ( = ?auto_346736 ?auto_346747 ) ) ( not ( = ?auto_346736 ?auto_346748 ) ) ( not ( = ?auto_346737 ?auto_346738 ) ) ( not ( = ?auto_346737 ?auto_346739 ) ) ( not ( = ?auto_346737 ?auto_346740 ) ) ( not ( = ?auto_346737 ?auto_346741 ) ) ( not ( = ?auto_346737 ?auto_346742 ) ) ( not ( = ?auto_346737 ?auto_346743 ) ) ( not ( = ?auto_346737 ?auto_346744 ) ) ( not ( = ?auto_346737 ?auto_346745 ) ) ( not ( = ?auto_346737 ?auto_346746 ) ) ( not ( = ?auto_346737 ?auto_346747 ) ) ( not ( = ?auto_346737 ?auto_346748 ) ) ( not ( = ?auto_346738 ?auto_346739 ) ) ( not ( = ?auto_346738 ?auto_346740 ) ) ( not ( = ?auto_346738 ?auto_346741 ) ) ( not ( = ?auto_346738 ?auto_346742 ) ) ( not ( = ?auto_346738 ?auto_346743 ) ) ( not ( = ?auto_346738 ?auto_346744 ) ) ( not ( = ?auto_346738 ?auto_346745 ) ) ( not ( = ?auto_346738 ?auto_346746 ) ) ( not ( = ?auto_346738 ?auto_346747 ) ) ( not ( = ?auto_346738 ?auto_346748 ) ) ( not ( = ?auto_346739 ?auto_346740 ) ) ( not ( = ?auto_346739 ?auto_346741 ) ) ( not ( = ?auto_346739 ?auto_346742 ) ) ( not ( = ?auto_346739 ?auto_346743 ) ) ( not ( = ?auto_346739 ?auto_346744 ) ) ( not ( = ?auto_346739 ?auto_346745 ) ) ( not ( = ?auto_346739 ?auto_346746 ) ) ( not ( = ?auto_346739 ?auto_346747 ) ) ( not ( = ?auto_346739 ?auto_346748 ) ) ( not ( = ?auto_346740 ?auto_346741 ) ) ( not ( = ?auto_346740 ?auto_346742 ) ) ( not ( = ?auto_346740 ?auto_346743 ) ) ( not ( = ?auto_346740 ?auto_346744 ) ) ( not ( = ?auto_346740 ?auto_346745 ) ) ( not ( = ?auto_346740 ?auto_346746 ) ) ( not ( = ?auto_346740 ?auto_346747 ) ) ( not ( = ?auto_346740 ?auto_346748 ) ) ( not ( = ?auto_346741 ?auto_346742 ) ) ( not ( = ?auto_346741 ?auto_346743 ) ) ( not ( = ?auto_346741 ?auto_346744 ) ) ( not ( = ?auto_346741 ?auto_346745 ) ) ( not ( = ?auto_346741 ?auto_346746 ) ) ( not ( = ?auto_346741 ?auto_346747 ) ) ( not ( = ?auto_346741 ?auto_346748 ) ) ( not ( = ?auto_346742 ?auto_346743 ) ) ( not ( = ?auto_346742 ?auto_346744 ) ) ( not ( = ?auto_346742 ?auto_346745 ) ) ( not ( = ?auto_346742 ?auto_346746 ) ) ( not ( = ?auto_346742 ?auto_346747 ) ) ( not ( = ?auto_346742 ?auto_346748 ) ) ( not ( = ?auto_346743 ?auto_346744 ) ) ( not ( = ?auto_346743 ?auto_346745 ) ) ( not ( = ?auto_346743 ?auto_346746 ) ) ( not ( = ?auto_346743 ?auto_346747 ) ) ( not ( = ?auto_346743 ?auto_346748 ) ) ( not ( = ?auto_346744 ?auto_346745 ) ) ( not ( = ?auto_346744 ?auto_346746 ) ) ( not ( = ?auto_346744 ?auto_346747 ) ) ( not ( = ?auto_346744 ?auto_346748 ) ) ( not ( = ?auto_346745 ?auto_346746 ) ) ( not ( = ?auto_346745 ?auto_346747 ) ) ( not ( = ?auto_346745 ?auto_346748 ) ) ( not ( = ?auto_346746 ?auto_346747 ) ) ( not ( = ?auto_346746 ?auto_346748 ) ) ( not ( = ?auto_346747 ?auto_346748 ) ) ( ON ?auto_346746 ?auto_346747 ) ( ON ?auto_346745 ?auto_346746 ) ( ON ?auto_346744 ?auto_346745 ) ( ON ?auto_346743 ?auto_346744 ) ( ON ?auto_346742 ?auto_346743 ) ( ON ?auto_346741 ?auto_346742 ) ( ON ?auto_346740 ?auto_346741 ) ( ON ?auto_346739 ?auto_346740 ) ( CLEAR ?auto_346737 ) ( ON ?auto_346738 ?auto_346739 ) ( CLEAR ?auto_346738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_346735 ?auto_346736 ?auto_346737 ?auto_346738 )
      ( MAKE-13PILE ?auto_346735 ?auto_346736 ?auto_346737 ?auto_346738 ?auto_346739 ?auto_346740 ?auto_346741 ?auto_346742 ?auto_346743 ?auto_346744 ?auto_346745 ?auto_346746 ?auto_346747 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_346762 - BLOCK
      ?auto_346763 - BLOCK
      ?auto_346764 - BLOCK
      ?auto_346765 - BLOCK
      ?auto_346766 - BLOCK
      ?auto_346767 - BLOCK
      ?auto_346768 - BLOCK
      ?auto_346769 - BLOCK
      ?auto_346770 - BLOCK
      ?auto_346771 - BLOCK
      ?auto_346772 - BLOCK
      ?auto_346773 - BLOCK
      ?auto_346774 - BLOCK
    )
    :vars
    (
      ?auto_346775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346774 ?auto_346775 ) ( ON-TABLE ?auto_346762 ) ( ON ?auto_346763 ?auto_346762 ) ( ON ?auto_346764 ?auto_346763 ) ( not ( = ?auto_346762 ?auto_346763 ) ) ( not ( = ?auto_346762 ?auto_346764 ) ) ( not ( = ?auto_346762 ?auto_346765 ) ) ( not ( = ?auto_346762 ?auto_346766 ) ) ( not ( = ?auto_346762 ?auto_346767 ) ) ( not ( = ?auto_346762 ?auto_346768 ) ) ( not ( = ?auto_346762 ?auto_346769 ) ) ( not ( = ?auto_346762 ?auto_346770 ) ) ( not ( = ?auto_346762 ?auto_346771 ) ) ( not ( = ?auto_346762 ?auto_346772 ) ) ( not ( = ?auto_346762 ?auto_346773 ) ) ( not ( = ?auto_346762 ?auto_346774 ) ) ( not ( = ?auto_346762 ?auto_346775 ) ) ( not ( = ?auto_346763 ?auto_346764 ) ) ( not ( = ?auto_346763 ?auto_346765 ) ) ( not ( = ?auto_346763 ?auto_346766 ) ) ( not ( = ?auto_346763 ?auto_346767 ) ) ( not ( = ?auto_346763 ?auto_346768 ) ) ( not ( = ?auto_346763 ?auto_346769 ) ) ( not ( = ?auto_346763 ?auto_346770 ) ) ( not ( = ?auto_346763 ?auto_346771 ) ) ( not ( = ?auto_346763 ?auto_346772 ) ) ( not ( = ?auto_346763 ?auto_346773 ) ) ( not ( = ?auto_346763 ?auto_346774 ) ) ( not ( = ?auto_346763 ?auto_346775 ) ) ( not ( = ?auto_346764 ?auto_346765 ) ) ( not ( = ?auto_346764 ?auto_346766 ) ) ( not ( = ?auto_346764 ?auto_346767 ) ) ( not ( = ?auto_346764 ?auto_346768 ) ) ( not ( = ?auto_346764 ?auto_346769 ) ) ( not ( = ?auto_346764 ?auto_346770 ) ) ( not ( = ?auto_346764 ?auto_346771 ) ) ( not ( = ?auto_346764 ?auto_346772 ) ) ( not ( = ?auto_346764 ?auto_346773 ) ) ( not ( = ?auto_346764 ?auto_346774 ) ) ( not ( = ?auto_346764 ?auto_346775 ) ) ( not ( = ?auto_346765 ?auto_346766 ) ) ( not ( = ?auto_346765 ?auto_346767 ) ) ( not ( = ?auto_346765 ?auto_346768 ) ) ( not ( = ?auto_346765 ?auto_346769 ) ) ( not ( = ?auto_346765 ?auto_346770 ) ) ( not ( = ?auto_346765 ?auto_346771 ) ) ( not ( = ?auto_346765 ?auto_346772 ) ) ( not ( = ?auto_346765 ?auto_346773 ) ) ( not ( = ?auto_346765 ?auto_346774 ) ) ( not ( = ?auto_346765 ?auto_346775 ) ) ( not ( = ?auto_346766 ?auto_346767 ) ) ( not ( = ?auto_346766 ?auto_346768 ) ) ( not ( = ?auto_346766 ?auto_346769 ) ) ( not ( = ?auto_346766 ?auto_346770 ) ) ( not ( = ?auto_346766 ?auto_346771 ) ) ( not ( = ?auto_346766 ?auto_346772 ) ) ( not ( = ?auto_346766 ?auto_346773 ) ) ( not ( = ?auto_346766 ?auto_346774 ) ) ( not ( = ?auto_346766 ?auto_346775 ) ) ( not ( = ?auto_346767 ?auto_346768 ) ) ( not ( = ?auto_346767 ?auto_346769 ) ) ( not ( = ?auto_346767 ?auto_346770 ) ) ( not ( = ?auto_346767 ?auto_346771 ) ) ( not ( = ?auto_346767 ?auto_346772 ) ) ( not ( = ?auto_346767 ?auto_346773 ) ) ( not ( = ?auto_346767 ?auto_346774 ) ) ( not ( = ?auto_346767 ?auto_346775 ) ) ( not ( = ?auto_346768 ?auto_346769 ) ) ( not ( = ?auto_346768 ?auto_346770 ) ) ( not ( = ?auto_346768 ?auto_346771 ) ) ( not ( = ?auto_346768 ?auto_346772 ) ) ( not ( = ?auto_346768 ?auto_346773 ) ) ( not ( = ?auto_346768 ?auto_346774 ) ) ( not ( = ?auto_346768 ?auto_346775 ) ) ( not ( = ?auto_346769 ?auto_346770 ) ) ( not ( = ?auto_346769 ?auto_346771 ) ) ( not ( = ?auto_346769 ?auto_346772 ) ) ( not ( = ?auto_346769 ?auto_346773 ) ) ( not ( = ?auto_346769 ?auto_346774 ) ) ( not ( = ?auto_346769 ?auto_346775 ) ) ( not ( = ?auto_346770 ?auto_346771 ) ) ( not ( = ?auto_346770 ?auto_346772 ) ) ( not ( = ?auto_346770 ?auto_346773 ) ) ( not ( = ?auto_346770 ?auto_346774 ) ) ( not ( = ?auto_346770 ?auto_346775 ) ) ( not ( = ?auto_346771 ?auto_346772 ) ) ( not ( = ?auto_346771 ?auto_346773 ) ) ( not ( = ?auto_346771 ?auto_346774 ) ) ( not ( = ?auto_346771 ?auto_346775 ) ) ( not ( = ?auto_346772 ?auto_346773 ) ) ( not ( = ?auto_346772 ?auto_346774 ) ) ( not ( = ?auto_346772 ?auto_346775 ) ) ( not ( = ?auto_346773 ?auto_346774 ) ) ( not ( = ?auto_346773 ?auto_346775 ) ) ( not ( = ?auto_346774 ?auto_346775 ) ) ( ON ?auto_346773 ?auto_346774 ) ( ON ?auto_346772 ?auto_346773 ) ( ON ?auto_346771 ?auto_346772 ) ( ON ?auto_346770 ?auto_346771 ) ( ON ?auto_346769 ?auto_346770 ) ( ON ?auto_346768 ?auto_346769 ) ( ON ?auto_346767 ?auto_346768 ) ( ON ?auto_346766 ?auto_346767 ) ( CLEAR ?auto_346764 ) ( ON ?auto_346765 ?auto_346766 ) ( CLEAR ?auto_346765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_346762 ?auto_346763 ?auto_346764 ?auto_346765 )
      ( MAKE-13PILE ?auto_346762 ?auto_346763 ?auto_346764 ?auto_346765 ?auto_346766 ?auto_346767 ?auto_346768 ?auto_346769 ?auto_346770 ?auto_346771 ?auto_346772 ?auto_346773 ?auto_346774 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_346789 - BLOCK
      ?auto_346790 - BLOCK
      ?auto_346791 - BLOCK
      ?auto_346792 - BLOCK
      ?auto_346793 - BLOCK
      ?auto_346794 - BLOCK
      ?auto_346795 - BLOCK
      ?auto_346796 - BLOCK
      ?auto_346797 - BLOCK
      ?auto_346798 - BLOCK
      ?auto_346799 - BLOCK
      ?auto_346800 - BLOCK
      ?auto_346801 - BLOCK
    )
    :vars
    (
      ?auto_346802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346801 ?auto_346802 ) ( ON-TABLE ?auto_346789 ) ( ON ?auto_346790 ?auto_346789 ) ( not ( = ?auto_346789 ?auto_346790 ) ) ( not ( = ?auto_346789 ?auto_346791 ) ) ( not ( = ?auto_346789 ?auto_346792 ) ) ( not ( = ?auto_346789 ?auto_346793 ) ) ( not ( = ?auto_346789 ?auto_346794 ) ) ( not ( = ?auto_346789 ?auto_346795 ) ) ( not ( = ?auto_346789 ?auto_346796 ) ) ( not ( = ?auto_346789 ?auto_346797 ) ) ( not ( = ?auto_346789 ?auto_346798 ) ) ( not ( = ?auto_346789 ?auto_346799 ) ) ( not ( = ?auto_346789 ?auto_346800 ) ) ( not ( = ?auto_346789 ?auto_346801 ) ) ( not ( = ?auto_346789 ?auto_346802 ) ) ( not ( = ?auto_346790 ?auto_346791 ) ) ( not ( = ?auto_346790 ?auto_346792 ) ) ( not ( = ?auto_346790 ?auto_346793 ) ) ( not ( = ?auto_346790 ?auto_346794 ) ) ( not ( = ?auto_346790 ?auto_346795 ) ) ( not ( = ?auto_346790 ?auto_346796 ) ) ( not ( = ?auto_346790 ?auto_346797 ) ) ( not ( = ?auto_346790 ?auto_346798 ) ) ( not ( = ?auto_346790 ?auto_346799 ) ) ( not ( = ?auto_346790 ?auto_346800 ) ) ( not ( = ?auto_346790 ?auto_346801 ) ) ( not ( = ?auto_346790 ?auto_346802 ) ) ( not ( = ?auto_346791 ?auto_346792 ) ) ( not ( = ?auto_346791 ?auto_346793 ) ) ( not ( = ?auto_346791 ?auto_346794 ) ) ( not ( = ?auto_346791 ?auto_346795 ) ) ( not ( = ?auto_346791 ?auto_346796 ) ) ( not ( = ?auto_346791 ?auto_346797 ) ) ( not ( = ?auto_346791 ?auto_346798 ) ) ( not ( = ?auto_346791 ?auto_346799 ) ) ( not ( = ?auto_346791 ?auto_346800 ) ) ( not ( = ?auto_346791 ?auto_346801 ) ) ( not ( = ?auto_346791 ?auto_346802 ) ) ( not ( = ?auto_346792 ?auto_346793 ) ) ( not ( = ?auto_346792 ?auto_346794 ) ) ( not ( = ?auto_346792 ?auto_346795 ) ) ( not ( = ?auto_346792 ?auto_346796 ) ) ( not ( = ?auto_346792 ?auto_346797 ) ) ( not ( = ?auto_346792 ?auto_346798 ) ) ( not ( = ?auto_346792 ?auto_346799 ) ) ( not ( = ?auto_346792 ?auto_346800 ) ) ( not ( = ?auto_346792 ?auto_346801 ) ) ( not ( = ?auto_346792 ?auto_346802 ) ) ( not ( = ?auto_346793 ?auto_346794 ) ) ( not ( = ?auto_346793 ?auto_346795 ) ) ( not ( = ?auto_346793 ?auto_346796 ) ) ( not ( = ?auto_346793 ?auto_346797 ) ) ( not ( = ?auto_346793 ?auto_346798 ) ) ( not ( = ?auto_346793 ?auto_346799 ) ) ( not ( = ?auto_346793 ?auto_346800 ) ) ( not ( = ?auto_346793 ?auto_346801 ) ) ( not ( = ?auto_346793 ?auto_346802 ) ) ( not ( = ?auto_346794 ?auto_346795 ) ) ( not ( = ?auto_346794 ?auto_346796 ) ) ( not ( = ?auto_346794 ?auto_346797 ) ) ( not ( = ?auto_346794 ?auto_346798 ) ) ( not ( = ?auto_346794 ?auto_346799 ) ) ( not ( = ?auto_346794 ?auto_346800 ) ) ( not ( = ?auto_346794 ?auto_346801 ) ) ( not ( = ?auto_346794 ?auto_346802 ) ) ( not ( = ?auto_346795 ?auto_346796 ) ) ( not ( = ?auto_346795 ?auto_346797 ) ) ( not ( = ?auto_346795 ?auto_346798 ) ) ( not ( = ?auto_346795 ?auto_346799 ) ) ( not ( = ?auto_346795 ?auto_346800 ) ) ( not ( = ?auto_346795 ?auto_346801 ) ) ( not ( = ?auto_346795 ?auto_346802 ) ) ( not ( = ?auto_346796 ?auto_346797 ) ) ( not ( = ?auto_346796 ?auto_346798 ) ) ( not ( = ?auto_346796 ?auto_346799 ) ) ( not ( = ?auto_346796 ?auto_346800 ) ) ( not ( = ?auto_346796 ?auto_346801 ) ) ( not ( = ?auto_346796 ?auto_346802 ) ) ( not ( = ?auto_346797 ?auto_346798 ) ) ( not ( = ?auto_346797 ?auto_346799 ) ) ( not ( = ?auto_346797 ?auto_346800 ) ) ( not ( = ?auto_346797 ?auto_346801 ) ) ( not ( = ?auto_346797 ?auto_346802 ) ) ( not ( = ?auto_346798 ?auto_346799 ) ) ( not ( = ?auto_346798 ?auto_346800 ) ) ( not ( = ?auto_346798 ?auto_346801 ) ) ( not ( = ?auto_346798 ?auto_346802 ) ) ( not ( = ?auto_346799 ?auto_346800 ) ) ( not ( = ?auto_346799 ?auto_346801 ) ) ( not ( = ?auto_346799 ?auto_346802 ) ) ( not ( = ?auto_346800 ?auto_346801 ) ) ( not ( = ?auto_346800 ?auto_346802 ) ) ( not ( = ?auto_346801 ?auto_346802 ) ) ( ON ?auto_346800 ?auto_346801 ) ( ON ?auto_346799 ?auto_346800 ) ( ON ?auto_346798 ?auto_346799 ) ( ON ?auto_346797 ?auto_346798 ) ( ON ?auto_346796 ?auto_346797 ) ( ON ?auto_346795 ?auto_346796 ) ( ON ?auto_346794 ?auto_346795 ) ( ON ?auto_346793 ?auto_346794 ) ( ON ?auto_346792 ?auto_346793 ) ( CLEAR ?auto_346790 ) ( ON ?auto_346791 ?auto_346792 ) ( CLEAR ?auto_346791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_346789 ?auto_346790 ?auto_346791 )
      ( MAKE-13PILE ?auto_346789 ?auto_346790 ?auto_346791 ?auto_346792 ?auto_346793 ?auto_346794 ?auto_346795 ?auto_346796 ?auto_346797 ?auto_346798 ?auto_346799 ?auto_346800 ?auto_346801 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_346816 - BLOCK
      ?auto_346817 - BLOCK
      ?auto_346818 - BLOCK
      ?auto_346819 - BLOCK
      ?auto_346820 - BLOCK
      ?auto_346821 - BLOCK
      ?auto_346822 - BLOCK
      ?auto_346823 - BLOCK
      ?auto_346824 - BLOCK
      ?auto_346825 - BLOCK
      ?auto_346826 - BLOCK
      ?auto_346827 - BLOCK
      ?auto_346828 - BLOCK
    )
    :vars
    (
      ?auto_346829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346828 ?auto_346829 ) ( ON-TABLE ?auto_346816 ) ( ON ?auto_346817 ?auto_346816 ) ( not ( = ?auto_346816 ?auto_346817 ) ) ( not ( = ?auto_346816 ?auto_346818 ) ) ( not ( = ?auto_346816 ?auto_346819 ) ) ( not ( = ?auto_346816 ?auto_346820 ) ) ( not ( = ?auto_346816 ?auto_346821 ) ) ( not ( = ?auto_346816 ?auto_346822 ) ) ( not ( = ?auto_346816 ?auto_346823 ) ) ( not ( = ?auto_346816 ?auto_346824 ) ) ( not ( = ?auto_346816 ?auto_346825 ) ) ( not ( = ?auto_346816 ?auto_346826 ) ) ( not ( = ?auto_346816 ?auto_346827 ) ) ( not ( = ?auto_346816 ?auto_346828 ) ) ( not ( = ?auto_346816 ?auto_346829 ) ) ( not ( = ?auto_346817 ?auto_346818 ) ) ( not ( = ?auto_346817 ?auto_346819 ) ) ( not ( = ?auto_346817 ?auto_346820 ) ) ( not ( = ?auto_346817 ?auto_346821 ) ) ( not ( = ?auto_346817 ?auto_346822 ) ) ( not ( = ?auto_346817 ?auto_346823 ) ) ( not ( = ?auto_346817 ?auto_346824 ) ) ( not ( = ?auto_346817 ?auto_346825 ) ) ( not ( = ?auto_346817 ?auto_346826 ) ) ( not ( = ?auto_346817 ?auto_346827 ) ) ( not ( = ?auto_346817 ?auto_346828 ) ) ( not ( = ?auto_346817 ?auto_346829 ) ) ( not ( = ?auto_346818 ?auto_346819 ) ) ( not ( = ?auto_346818 ?auto_346820 ) ) ( not ( = ?auto_346818 ?auto_346821 ) ) ( not ( = ?auto_346818 ?auto_346822 ) ) ( not ( = ?auto_346818 ?auto_346823 ) ) ( not ( = ?auto_346818 ?auto_346824 ) ) ( not ( = ?auto_346818 ?auto_346825 ) ) ( not ( = ?auto_346818 ?auto_346826 ) ) ( not ( = ?auto_346818 ?auto_346827 ) ) ( not ( = ?auto_346818 ?auto_346828 ) ) ( not ( = ?auto_346818 ?auto_346829 ) ) ( not ( = ?auto_346819 ?auto_346820 ) ) ( not ( = ?auto_346819 ?auto_346821 ) ) ( not ( = ?auto_346819 ?auto_346822 ) ) ( not ( = ?auto_346819 ?auto_346823 ) ) ( not ( = ?auto_346819 ?auto_346824 ) ) ( not ( = ?auto_346819 ?auto_346825 ) ) ( not ( = ?auto_346819 ?auto_346826 ) ) ( not ( = ?auto_346819 ?auto_346827 ) ) ( not ( = ?auto_346819 ?auto_346828 ) ) ( not ( = ?auto_346819 ?auto_346829 ) ) ( not ( = ?auto_346820 ?auto_346821 ) ) ( not ( = ?auto_346820 ?auto_346822 ) ) ( not ( = ?auto_346820 ?auto_346823 ) ) ( not ( = ?auto_346820 ?auto_346824 ) ) ( not ( = ?auto_346820 ?auto_346825 ) ) ( not ( = ?auto_346820 ?auto_346826 ) ) ( not ( = ?auto_346820 ?auto_346827 ) ) ( not ( = ?auto_346820 ?auto_346828 ) ) ( not ( = ?auto_346820 ?auto_346829 ) ) ( not ( = ?auto_346821 ?auto_346822 ) ) ( not ( = ?auto_346821 ?auto_346823 ) ) ( not ( = ?auto_346821 ?auto_346824 ) ) ( not ( = ?auto_346821 ?auto_346825 ) ) ( not ( = ?auto_346821 ?auto_346826 ) ) ( not ( = ?auto_346821 ?auto_346827 ) ) ( not ( = ?auto_346821 ?auto_346828 ) ) ( not ( = ?auto_346821 ?auto_346829 ) ) ( not ( = ?auto_346822 ?auto_346823 ) ) ( not ( = ?auto_346822 ?auto_346824 ) ) ( not ( = ?auto_346822 ?auto_346825 ) ) ( not ( = ?auto_346822 ?auto_346826 ) ) ( not ( = ?auto_346822 ?auto_346827 ) ) ( not ( = ?auto_346822 ?auto_346828 ) ) ( not ( = ?auto_346822 ?auto_346829 ) ) ( not ( = ?auto_346823 ?auto_346824 ) ) ( not ( = ?auto_346823 ?auto_346825 ) ) ( not ( = ?auto_346823 ?auto_346826 ) ) ( not ( = ?auto_346823 ?auto_346827 ) ) ( not ( = ?auto_346823 ?auto_346828 ) ) ( not ( = ?auto_346823 ?auto_346829 ) ) ( not ( = ?auto_346824 ?auto_346825 ) ) ( not ( = ?auto_346824 ?auto_346826 ) ) ( not ( = ?auto_346824 ?auto_346827 ) ) ( not ( = ?auto_346824 ?auto_346828 ) ) ( not ( = ?auto_346824 ?auto_346829 ) ) ( not ( = ?auto_346825 ?auto_346826 ) ) ( not ( = ?auto_346825 ?auto_346827 ) ) ( not ( = ?auto_346825 ?auto_346828 ) ) ( not ( = ?auto_346825 ?auto_346829 ) ) ( not ( = ?auto_346826 ?auto_346827 ) ) ( not ( = ?auto_346826 ?auto_346828 ) ) ( not ( = ?auto_346826 ?auto_346829 ) ) ( not ( = ?auto_346827 ?auto_346828 ) ) ( not ( = ?auto_346827 ?auto_346829 ) ) ( not ( = ?auto_346828 ?auto_346829 ) ) ( ON ?auto_346827 ?auto_346828 ) ( ON ?auto_346826 ?auto_346827 ) ( ON ?auto_346825 ?auto_346826 ) ( ON ?auto_346824 ?auto_346825 ) ( ON ?auto_346823 ?auto_346824 ) ( ON ?auto_346822 ?auto_346823 ) ( ON ?auto_346821 ?auto_346822 ) ( ON ?auto_346820 ?auto_346821 ) ( ON ?auto_346819 ?auto_346820 ) ( CLEAR ?auto_346817 ) ( ON ?auto_346818 ?auto_346819 ) ( CLEAR ?auto_346818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_346816 ?auto_346817 ?auto_346818 )
      ( MAKE-13PILE ?auto_346816 ?auto_346817 ?auto_346818 ?auto_346819 ?auto_346820 ?auto_346821 ?auto_346822 ?auto_346823 ?auto_346824 ?auto_346825 ?auto_346826 ?auto_346827 ?auto_346828 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_346843 - BLOCK
      ?auto_346844 - BLOCK
      ?auto_346845 - BLOCK
      ?auto_346846 - BLOCK
      ?auto_346847 - BLOCK
      ?auto_346848 - BLOCK
      ?auto_346849 - BLOCK
      ?auto_346850 - BLOCK
      ?auto_346851 - BLOCK
      ?auto_346852 - BLOCK
      ?auto_346853 - BLOCK
      ?auto_346854 - BLOCK
      ?auto_346855 - BLOCK
    )
    :vars
    (
      ?auto_346856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346855 ?auto_346856 ) ( ON-TABLE ?auto_346843 ) ( not ( = ?auto_346843 ?auto_346844 ) ) ( not ( = ?auto_346843 ?auto_346845 ) ) ( not ( = ?auto_346843 ?auto_346846 ) ) ( not ( = ?auto_346843 ?auto_346847 ) ) ( not ( = ?auto_346843 ?auto_346848 ) ) ( not ( = ?auto_346843 ?auto_346849 ) ) ( not ( = ?auto_346843 ?auto_346850 ) ) ( not ( = ?auto_346843 ?auto_346851 ) ) ( not ( = ?auto_346843 ?auto_346852 ) ) ( not ( = ?auto_346843 ?auto_346853 ) ) ( not ( = ?auto_346843 ?auto_346854 ) ) ( not ( = ?auto_346843 ?auto_346855 ) ) ( not ( = ?auto_346843 ?auto_346856 ) ) ( not ( = ?auto_346844 ?auto_346845 ) ) ( not ( = ?auto_346844 ?auto_346846 ) ) ( not ( = ?auto_346844 ?auto_346847 ) ) ( not ( = ?auto_346844 ?auto_346848 ) ) ( not ( = ?auto_346844 ?auto_346849 ) ) ( not ( = ?auto_346844 ?auto_346850 ) ) ( not ( = ?auto_346844 ?auto_346851 ) ) ( not ( = ?auto_346844 ?auto_346852 ) ) ( not ( = ?auto_346844 ?auto_346853 ) ) ( not ( = ?auto_346844 ?auto_346854 ) ) ( not ( = ?auto_346844 ?auto_346855 ) ) ( not ( = ?auto_346844 ?auto_346856 ) ) ( not ( = ?auto_346845 ?auto_346846 ) ) ( not ( = ?auto_346845 ?auto_346847 ) ) ( not ( = ?auto_346845 ?auto_346848 ) ) ( not ( = ?auto_346845 ?auto_346849 ) ) ( not ( = ?auto_346845 ?auto_346850 ) ) ( not ( = ?auto_346845 ?auto_346851 ) ) ( not ( = ?auto_346845 ?auto_346852 ) ) ( not ( = ?auto_346845 ?auto_346853 ) ) ( not ( = ?auto_346845 ?auto_346854 ) ) ( not ( = ?auto_346845 ?auto_346855 ) ) ( not ( = ?auto_346845 ?auto_346856 ) ) ( not ( = ?auto_346846 ?auto_346847 ) ) ( not ( = ?auto_346846 ?auto_346848 ) ) ( not ( = ?auto_346846 ?auto_346849 ) ) ( not ( = ?auto_346846 ?auto_346850 ) ) ( not ( = ?auto_346846 ?auto_346851 ) ) ( not ( = ?auto_346846 ?auto_346852 ) ) ( not ( = ?auto_346846 ?auto_346853 ) ) ( not ( = ?auto_346846 ?auto_346854 ) ) ( not ( = ?auto_346846 ?auto_346855 ) ) ( not ( = ?auto_346846 ?auto_346856 ) ) ( not ( = ?auto_346847 ?auto_346848 ) ) ( not ( = ?auto_346847 ?auto_346849 ) ) ( not ( = ?auto_346847 ?auto_346850 ) ) ( not ( = ?auto_346847 ?auto_346851 ) ) ( not ( = ?auto_346847 ?auto_346852 ) ) ( not ( = ?auto_346847 ?auto_346853 ) ) ( not ( = ?auto_346847 ?auto_346854 ) ) ( not ( = ?auto_346847 ?auto_346855 ) ) ( not ( = ?auto_346847 ?auto_346856 ) ) ( not ( = ?auto_346848 ?auto_346849 ) ) ( not ( = ?auto_346848 ?auto_346850 ) ) ( not ( = ?auto_346848 ?auto_346851 ) ) ( not ( = ?auto_346848 ?auto_346852 ) ) ( not ( = ?auto_346848 ?auto_346853 ) ) ( not ( = ?auto_346848 ?auto_346854 ) ) ( not ( = ?auto_346848 ?auto_346855 ) ) ( not ( = ?auto_346848 ?auto_346856 ) ) ( not ( = ?auto_346849 ?auto_346850 ) ) ( not ( = ?auto_346849 ?auto_346851 ) ) ( not ( = ?auto_346849 ?auto_346852 ) ) ( not ( = ?auto_346849 ?auto_346853 ) ) ( not ( = ?auto_346849 ?auto_346854 ) ) ( not ( = ?auto_346849 ?auto_346855 ) ) ( not ( = ?auto_346849 ?auto_346856 ) ) ( not ( = ?auto_346850 ?auto_346851 ) ) ( not ( = ?auto_346850 ?auto_346852 ) ) ( not ( = ?auto_346850 ?auto_346853 ) ) ( not ( = ?auto_346850 ?auto_346854 ) ) ( not ( = ?auto_346850 ?auto_346855 ) ) ( not ( = ?auto_346850 ?auto_346856 ) ) ( not ( = ?auto_346851 ?auto_346852 ) ) ( not ( = ?auto_346851 ?auto_346853 ) ) ( not ( = ?auto_346851 ?auto_346854 ) ) ( not ( = ?auto_346851 ?auto_346855 ) ) ( not ( = ?auto_346851 ?auto_346856 ) ) ( not ( = ?auto_346852 ?auto_346853 ) ) ( not ( = ?auto_346852 ?auto_346854 ) ) ( not ( = ?auto_346852 ?auto_346855 ) ) ( not ( = ?auto_346852 ?auto_346856 ) ) ( not ( = ?auto_346853 ?auto_346854 ) ) ( not ( = ?auto_346853 ?auto_346855 ) ) ( not ( = ?auto_346853 ?auto_346856 ) ) ( not ( = ?auto_346854 ?auto_346855 ) ) ( not ( = ?auto_346854 ?auto_346856 ) ) ( not ( = ?auto_346855 ?auto_346856 ) ) ( ON ?auto_346854 ?auto_346855 ) ( ON ?auto_346853 ?auto_346854 ) ( ON ?auto_346852 ?auto_346853 ) ( ON ?auto_346851 ?auto_346852 ) ( ON ?auto_346850 ?auto_346851 ) ( ON ?auto_346849 ?auto_346850 ) ( ON ?auto_346848 ?auto_346849 ) ( ON ?auto_346847 ?auto_346848 ) ( ON ?auto_346846 ?auto_346847 ) ( ON ?auto_346845 ?auto_346846 ) ( CLEAR ?auto_346843 ) ( ON ?auto_346844 ?auto_346845 ) ( CLEAR ?auto_346844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_346843 ?auto_346844 )
      ( MAKE-13PILE ?auto_346843 ?auto_346844 ?auto_346845 ?auto_346846 ?auto_346847 ?auto_346848 ?auto_346849 ?auto_346850 ?auto_346851 ?auto_346852 ?auto_346853 ?auto_346854 ?auto_346855 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_346870 - BLOCK
      ?auto_346871 - BLOCK
      ?auto_346872 - BLOCK
      ?auto_346873 - BLOCK
      ?auto_346874 - BLOCK
      ?auto_346875 - BLOCK
      ?auto_346876 - BLOCK
      ?auto_346877 - BLOCK
      ?auto_346878 - BLOCK
      ?auto_346879 - BLOCK
      ?auto_346880 - BLOCK
      ?auto_346881 - BLOCK
      ?auto_346882 - BLOCK
    )
    :vars
    (
      ?auto_346883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346882 ?auto_346883 ) ( ON-TABLE ?auto_346870 ) ( not ( = ?auto_346870 ?auto_346871 ) ) ( not ( = ?auto_346870 ?auto_346872 ) ) ( not ( = ?auto_346870 ?auto_346873 ) ) ( not ( = ?auto_346870 ?auto_346874 ) ) ( not ( = ?auto_346870 ?auto_346875 ) ) ( not ( = ?auto_346870 ?auto_346876 ) ) ( not ( = ?auto_346870 ?auto_346877 ) ) ( not ( = ?auto_346870 ?auto_346878 ) ) ( not ( = ?auto_346870 ?auto_346879 ) ) ( not ( = ?auto_346870 ?auto_346880 ) ) ( not ( = ?auto_346870 ?auto_346881 ) ) ( not ( = ?auto_346870 ?auto_346882 ) ) ( not ( = ?auto_346870 ?auto_346883 ) ) ( not ( = ?auto_346871 ?auto_346872 ) ) ( not ( = ?auto_346871 ?auto_346873 ) ) ( not ( = ?auto_346871 ?auto_346874 ) ) ( not ( = ?auto_346871 ?auto_346875 ) ) ( not ( = ?auto_346871 ?auto_346876 ) ) ( not ( = ?auto_346871 ?auto_346877 ) ) ( not ( = ?auto_346871 ?auto_346878 ) ) ( not ( = ?auto_346871 ?auto_346879 ) ) ( not ( = ?auto_346871 ?auto_346880 ) ) ( not ( = ?auto_346871 ?auto_346881 ) ) ( not ( = ?auto_346871 ?auto_346882 ) ) ( not ( = ?auto_346871 ?auto_346883 ) ) ( not ( = ?auto_346872 ?auto_346873 ) ) ( not ( = ?auto_346872 ?auto_346874 ) ) ( not ( = ?auto_346872 ?auto_346875 ) ) ( not ( = ?auto_346872 ?auto_346876 ) ) ( not ( = ?auto_346872 ?auto_346877 ) ) ( not ( = ?auto_346872 ?auto_346878 ) ) ( not ( = ?auto_346872 ?auto_346879 ) ) ( not ( = ?auto_346872 ?auto_346880 ) ) ( not ( = ?auto_346872 ?auto_346881 ) ) ( not ( = ?auto_346872 ?auto_346882 ) ) ( not ( = ?auto_346872 ?auto_346883 ) ) ( not ( = ?auto_346873 ?auto_346874 ) ) ( not ( = ?auto_346873 ?auto_346875 ) ) ( not ( = ?auto_346873 ?auto_346876 ) ) ( not ( = ?auto_346873 ?auto_346877 ) ) ( not ( = ?auto_346873 ?auto_346878 ) ) ( not ( = ?auto_346873 ?auto_346879 ) ) ( not ( = ?auto_346873 ?auto_346880 ) ) ( not ( = ?auto_346873 ?auto_346881 ) ) ( not ( = ?auto_346873 ?auto_346882 ) ) ( not ( = ?auto_346873 ?auto_346883 ) ) ( not ( = ?auto_346874 ?auto_346875 ) ) ( not ( = ?auto_346874 ?auto_346876 ) ) ( not ( = ?auto_346874 ?auto_346877 ) ) ( not ( = ?auto_346874 ?auto_346878 ) ) ( not ( = ?auto_346874 ?auto_346879 ) ) ( not ( = ?auto_346874 ?auto_346880 ) ) ( not ( = ?auto_346874 ?auto_346881 ) ) ( not ( = ?auto_346874 ?auto_346882 ) ) ( not ( = ?auto_346874 ?auto_346883 ) ) ( not ( = ?auto_346875 ?auto_346876 ) ) ( not ( = ?auto_346875 ?auto_346877 ) ) ( not ( = ?auto_346875 ?auto_346878 ) ) ( not ( = ?auto_346875 ?auto_346879 ) ) ( not ( = ?auto_346875 ?auto_346880 ) ) ( not ( = ?auto_346875 ?auto_346881 ) ) ( not ( = ?auto_346875 ?auto_346882 ) ) ( not ( = ?auto_346875 ?auto_346883 ) ) ( not ( = ?auto_346876 ?auto_346877 ) ) ( not ( = ?auto_346876 ?auto_346878 ) ) ( not ( = ?auto_346876 ?auto_346879 ) ) ( not ( = ?auto_346876 ?auto_346880 ) ) ( not ( = ?auto_346876 ?auto_346881 ) ) ( not ( = ?auto_346876 ?auto_346882 ) ) ( not ( = ?auto_346876 ?auto_346883 ) ) ( not ( = ?auto_346877 ?auto_346878 ) ) ( not ( = ?auto_346877 ?auto_346879 ) ) ( not ( = ?auto_346877 ?auto_346880 ) ) ( not ( = ?auto_346877 ?auto_346881 ) ) ( not ( = ?auto_346877 ?auto_346882 ) ) ( not ( = ?auto_346877 ?auto_346883 ) ) ( not ( = ?auto_346878 ?auto_346879 ) ) ( not ( = ?auto_346878 ?auto_346880 ) ) ( not ( = ?auto_346878 ?auto_346881 ) ) ( not ( = ?auto_346878 ?auto_346882 ) ) ( not ( = ?auto_346878 ?auto_346883 ) ) ( not ( = ?auto_346879 ?auto_346880 ) ) ( not ( = ?auto_346879 ?auto_346881 ) ) ( not ( = ?auto_346879 ?auto_346882 ) ) ( not ( = ?auto_346879 ?auto_346883 ) ) ( not ( = ?auto_346880 ?auto_346881 ) ) ( not ( = ?auto_346880 ?auto_346882 ) ) ( not ( = ?auto_346880 ?auto_346883 ) ) ( not ( = ?auto_346881 ?auto_346882 ) ) ( not ( = ?auto_346881 ?auto_346883 ) ) ( not ( = ?auto_346882 ?auto_346883 ) ) ( ON ?auto_346881 ?auto_346882 ) ( ON ?auto_346880 ?auto_346881 ) ( ON ?auto_346879 ?auto_346880 ) ( ON ?auto_346878 ?auto_346879 ) ( ON ?auto_346877 ?auto_346878 ) ( ON ?auto_346876 ?auto_346877 ) ( ON ?auto_346875 ?auto_346876 ) ( ON ?auto_346874 ?auto_346875 ) ( ON ?auto_346873 ?auto_346874 ) ( ON ?auto_346872 ?auto_346873 ) ( CLEAR ?auto_346870 ) ( ON ?auto_346871 ?auto_346872 ) ( CLEAR ?auto_346871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_346870 ?auto_346871 )
      ( MAKE-13PILE ?auto_346870 ?auto_346871 ?auto_346872 ?auto_346873 ?auto_346874 ?auto_346875 ?auto_346876 ?auto_346877 ?auto_346878 ?auto_346879 ?auto_346880 ?auto_346881 ?auto_346882 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_346897 - BLOCK
      ?auto_346898 - BLOCK
      ?auto_346899 - BLOCK
      ?auto_346900 - BLOCK
      ?auto_346901 - BLOCK
      ?auto_346902 - BLOCK
      ?auto_346903 - BLOCK
      ?auto_346904 - BLOCK
      ?auto_346905 - BLOCK
      ?auto_346906 - BLOCK
      ?auto_346907 - BLOCK
      ?auto_346908 - BLOCK
      ?auto_346909 - BLOCK
    )
    :vars
    (
      ?auto_346910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346909 ?auto_346910 ) ( not ( = ?auto_346897 ?auto_346898 ) ) ( not ( = ?auto_346897 ?auto_346899 ) ) ( not ( = ?auto_346897 ?auto_346900 ) ) ( not ( = ?auto_346897 ?auto_346901 ) ) ( not ( = ?auto_346897 ?auto_346902 ) ) ( not ( = ?auto_346897 ?auto_346903 ) ) ( not ( = ?auto_346897 ?auto_346904 ) ) ( not ( = ?auto_346897 ?auto_346905 ) ) ( not ( = ?auto_346897 ?auto_346906 ) ) ( not ( = ?auto_346897 ?auto_346907 ) ) ( not ( = ?auto_346897 ?auto_346908 ) ) ( not ( = ?auto_346897 ?auto_346909 ) ) ( not ( = ?auto_346897 ?auto_346910 ) ) ( not ( = ?auto_346898 ?auto_346899 ) ) ( not ( = ?auto_346898 ?auto_346900 ) ) ( not ( = ?auto_346898 ?auto_346901 ) ) ( not ( = ?auto_346898 ?auto_346902 ) ) ( not ( = ?auto_346898 ?auto_346903 ) ) ( not ( = ?auto_346898 ?auto_346904 ) ) ( not ( = ?auto_346898 ?auto_346905 ) ) ( not ( = ?auto_346898 ?auto_346906 ) ) ( not ( = ?auto_346898 ?auto_346907 ) ) ( not ( = ?auto_346898 ?auto_346908 ) ) ( not ( = ?auto_346898 ?auto_346909 ) ) ( not ( = ?auto_346898 ?auto_346910 ) ) ( not ( = ?auto_346899 ?auto_346900 ) ) ( not ( = ?auto_346899 ?auto_346901 ) ) ( not ( = ?auto_346899 ?auto_346902 ) ) ( not ( = ?auto_346899 ?auto_346903 ) ) ( not ( = ?auto_346899 ?auto_346904 ) ) ( not ( = ?auto_346899 ?auto_346905 ) ) ( not ( = ?auto_346899 ?auto_346906 ) ) ( not ( = ?auto_346899 ?auto_346907 ) ) ( not ( = ?auto_346899 ?auto_346908 ) ) ( not ( = ?auto_346899 ?auto_346909 ) ) ( not ( = ?auto_346899 ?auto_346910 ) ) ( not ( = ?auto_346900 ?auto_346901 ) ) ( not ( = ?auto_346900 ?auto_346902 ) ) ( not ( = ?auto_346900 ?auto_346903 ) ) ( not ( = ?auto_346900 ?auto_346904 ) ) ( not ( = ?auto_346900 ?auto_346905 ) ) ( not ( = ?auto_346900 ?auto_346906 ) ) ( not ( = ?auto_346900 ?auto_346907 ) ) ( not ( = ?auto_346900 ?auto_346908 ) ) ( not ( = ?auto_346900 ?auto_346909 ) ) ( not ( = ?auto_346900 ?auto_346910 ) ) ( not ( = ?auto_346901 ?auto_346902 ) ) ( not ( = ?auto_346901 ?auto_346903 ) ) ( not ( = ?auto_346901 ?auto_346904 ) ) ( not ( = ?auto_346901 ?auto_346905 ) ) ( not ( = ?auto_346901 ?auto_346906 ) ) ( not ( = ?auto_346901 ?auto_346907 ) ) ( not ( = ?auto_346901 ?auto_346908 ) ) ( not ( = ?auto_346901 ?auto_346909 ) ) ( not ( = ?auto_346901 ?auto_346910 ) ) ( not ( = ?auto_346902 ?auto_346903 ) ) ( not ( = ?auto_346902 ?auto_346904 ) ) ( not ( = ?auto_346902 ?auto_346905 ) ) ( not ( = ?auto_346902 ?auto_346906 ) ) ( not ( = ?auto_346902 ?auto_346907 ) ) ( not ( = ?auto_346902 ?auto_346908 ) ) ( not ( = ?auto_346902 ?auto_346909 ) ) ( not ( = ?auto_346902 ?auto_346910 ) ) ( not ( = ?auto_346903 ?auto_346904 ) ) ( not ( = ?auto_346903 ?auto_346905 ) ) ( not ( = ?auto_346903 ?auto_346906 ) ) ( not ( = ?auto_346903 ?auto_346907 ) ) ( not ( = ?auto_346903 ?auto_346908 ) ) ( not ( = ?auto_346903 ?auto_346909 ) ) ( not ( = ?auto_346903 ?auto_346910 ) ) ( not ( = ?auto_346904 ?auto_346905 ) ) ( not ( = ?auto_346904 ?auto_346906 ) ) ( not ( = ?auto_346904 ?auto_346907 ) ) ( not ( = ?auto_346904 ?auto_346908 ) ) ( not ( = ?auto_346904 ?auto_346909 ) ) ( not ( = ?auto_346904 ?auto_346910 ) ) ( not ( = ?auto_346905 ?auto_346906 ) ) ( not ( = ?auto_346905 ?auto_346907 ) ) ( not ( = ?auto_346905 ?auto_346908 ) ) ( not ( = ?auto_346905 ?auto_346909 ) ) ( not ( = ?auto_346905 ?auto_346910 ) ) ( not ( = ?auto_346906 ?auto_346907 ) ) ( not ( = ?auto_346906 ?auto_346908 ) ) ( not ( = ?auto_346906 ?auto_346909 ) ) ( not ( = ?auto_346906 ?auto_346910 ) ) ( not ( = ?auto_346907 ?auto_346908 ) ) ( not ( = ?auto_346907 ?auto_346909 ) ) ( not ( = ?auto_346907 ?auto_346910 ) ) ( not ( = ?auto_346908 ?auto_346909 ) ) ( not ( = ?auto_346908 ?auto_346910 ) ) ( not ( = ?auto_346909 ?auto_346910 ) ) ( ON ?auto_346908 ?auto_346909 ) ( ON ?auto_346907 ?auto_346908 ) ( ON ?auto_346906 ?auto_346907 ) ( ON ?auto_346905 ?auto_346906 ) ( ON ?auto_346904 ?auto_346905 ) ( ON ?auto_346903 ?auto_346904 ) ( ON ?auto_346902 ?auto_346903 ) ( ON ?auto_346901 ?auto_346902 ) ( ON ?auto_346900 ?auto_346901 ) ( ON ?auto_346899 ?auto_346900 ) ( ON ?auto_346898 ?auto_346899 ) ( ON ?auto_346897 ?auto_346898 ) ( CLEAR ?auto_346897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_346897 )
      ( MAKE-13PILE ?auto_346897 ?auto_346898 ?auto_346899 ?auto_346900 ?auto_346901 ?auto_346902 ?auto_346903 ?auto_346904 ?auto_346905 ?auto_346906 ?auto_346907 ?auto_346908 ?auto_346909 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_346924 - BLOCK
      ?auto_346925 - BLOCK
      ?auto_346926 - BLOCK
      ?auto_346927 - BLOCK
      ?auto_346928 - BLOCK
      ?auto_346929 - BLOCK
      ?auto_346930 - BLOCK
      ?auto_346931 - BLOCK
      ?auto_346932 - BLOCK
      ?auto_346933 - BLOCK
      ?auto_346934 - BLOCK
      ?auto_346935 - BLOCK
      ?auto_346936 - BLOCK
    )
    :vars
    (
      ?auto_346937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346936 ?auto_346937 ) ( not ( = ?auto_346924 ?auto_346925 ) ) ( not ( = ?auto_346924 ?auto_346926 ) ) ( not ( = ?auto_346924 ?auto_346927 ) ) ( not ( = ?auto_346924 ?auto_346928 ) ) ( not ( = ?auto_346924 ?auto_346929 ) ) ( not ( = ?auto_346924 ?auto_346930 ) ) ( not ( = ?auto_346924 ?auto_346931 ) ) ( not ( = ?auto_346924 ?auto_346932 ) ) ( not ( = ?auto_346924 ?auto_346933 ) ) ( not ( = ?auto_346924 ?auto_346934 ) ) ( not ( = ?auto_346924 ?auto_346935 ) ) ( not ( = ?auto_346924 ?auto_346936 ) ) ( not ( = ?auto_346924 ?auto_346937 ) ) ( not ( = ?auto_346925 ?auto_346926 ) ) ( not ( = ?auto_346925 ?auto_346927 ) ) ( not ( = ?auto_346925 ?auto_346928 ) ) ( not ( = ?auto_346925 ?auto_346929 ) ) ( not ( = ?auto_346925 ?auto_346930 ) ) ( not ( = ?auto_346925 ?auto_346931 ) ) ( not ( = ?auto_346925 ?auto_346932 ) ) ( not ( = ?auto_346925 ?auto_346933 ) ) ( not ( = ?auto_346925 ?auto_346934 ) ) ( not ( = ?auto_346925 ?auto_346935 ) ) ( not ( = ?auto_346925 ?auto_346936 ) ) ( not ( = ?auto_346925 ?auto_346937 ) ) ( not ( = ?auto_346926 ?auto_346927 ) ) ( not ( = ?auto_346926 ?auto_346928 ) ) ( not ( = ?auto_346926 ?auto_346929 ) ) ( not ( = ?auto_346926 ?auto_346930 ) ) ( not ( = ?auto_346926 ?auto_346931 ) ) ( not ( = ?auto_346926 ?auto_346932 ) ) ( not ( = ?auto_346926 ?auto_346933 ) ) ( not ( = ?auto_346926 ?auto_346934 ) ) ( not ( = ?auto_346926 ?auto_346935 ) ) ( not ( = ?auto_346926 ?auto_346936 ) ) ( not ( = ?auto_346926 ?auto_346937 ) ) ( not ( = ?auto_346927 ?auto_346928 ) ) ( not ( = ?auto_346927 ?auto_346929 ) ) ( not ( = ?auto_346927 ?auto_346930 ) ) ( not ( = ?auto_346927 ?auto_346931 ) ) ( not ( = ?auto_346927 ?auto_346932 ) ) ( not ( = ?auto_346927 ?auto_346933 ) ) ( not ( = ?auto_346927 ?auto_346934 ) ) ( not ( = ?auto_346927 ?auto_346935 ) ) ( not ( = ?auto_346927 ?auto_346936 ) ) ( not ( = ?auto_346927 ?auto_346937 ) ) ( not ( = ?auto_346928 ?auto_346929 ) ) ( not ( = ?auto_346928 ?auto_346930 ) ) ( not ( = ?auto_346928 ?auto_346931 ) ) ( not ( = ?auto_346928 ?auto_346932 ) ) ( not ( = ?auto_346928 ?auto_346933 ) ) ( not ( = ?auto_346928 ?auto_346934 ) ) ( not ( = ?auto_346928 ?auto_346935 ) ) ( not ( = ?auto_346928 ?auto_346936 ) ) ( not ( = ?auto_346928 ?auto_346937 ) ) ( not ( = ?auto_346929 ?auto_346930 ) ) ( not ( = ?auto_346929 ?auto_346931 ) ) ( not ( = ?auto_346929 ?auto_346932 ) ) ( not ( = ?auto_346929 ?auto_346933 ) ) ( not ( = ?auto_346929 ?auto_346934 ) ) ( not ( = ?auto_346929 ?auto_346935 ) ) ( not ( = ?auto_346929 ?auto_346936 ) ) ( not ( = ?auto_346929 ?auto_346937 ) ) ( not ( = ?auto_346930 ?auto_346931 ) ) ( not ( = ?auto_346930 ?auto_346932 ) ) ( not ( = ?auto_346930 ?auto_346933 ) ) ( not ( = ?auto_346930 ?auto_346934 ) ) ( not ( = ?auto_346930 ?auto_346935 ) ) ( not ( = ?auto_346930 ?auto_346936 ) ) ( not ( = ?auto_346930 ?auto_346937 ) ) ( not ( = ?auto_346931 ?auto_346932 ) ) ( not ( = ?auto_346931 ?auto_346933 ) ) ( not ( = ?auto_346931 ?auto_346934 ) ) ( not ( = ?auto_346931 ?auto_346935 ) ) ( not ( = ?auto_346931 ?auto_346936 ) ) ( not ( = ?auto_346931 ?auto_346937 ) ) ( not ( = ?auto_346932 ?auto_346933 ) ) ( not ( = ?auto_346932 ?auto_346934 ) ) ( not ( = ?auto_346932 ?auto_346935 ) ) ( not ( = ?auto_346932 ?auto_346936 ) ) ( not ( = ?auto_346932 ?auto_346937 ) ) ( not ( = ?auto_346933 ?auto_346934 ) ) ( not ( = ?auto_346933 ?auto_346935 ) ) ( not ( = ?auto_346933 ?auto_346936 ) ) ( not ( = ?auto_346933 ?auto_346937 ) ) ( not ( = ?auto_346934 ?auto_346935 ) ) ( not ( = ?auto_346934 ?auto_346936 ) ) ( not ( = ?auto_346934 ?auto_346937 ) ) ( not ( = ?auto_346935 ?auto_346936 ) ) ( not ( = ?auto_346935 ?auto_346937 ) ) ( not ( = ?auto_346936 ?auto_346937 ) ) ( ON ?auto_346935 ?auto_346936 ) ( ON ?auto_346934 ?auto_346935 ) ( ON ?auto_346933 ?auto_346934 ) ( ON ?auto_346932 ?auto_346933 ) ( ON ?auto_346931 ?auto_346932 ) ( ON ?auto_346930 ?auto_346931 ) ( ON ?auto_346929 ?auto_346930 ) ( ON ?auto_346928 ?auto_346929 ) ( ON ?auto_346927 ?auto_346928 ) ( ON ?auto_346926 ?auto_346927 ) ( ON ?auto_346925 ?auto_346926 ) ( ON ?auto_346924 ?auto_346925 ) ( CLEAR ?auto_346924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_346924 )
      ( MAKE-13PILE ?auto_346924 ?auto_346925 ?auto_346926 ?auto_346927 ?auto_346928 ?auto_346929 ?auto_346930 ?auto_346931 ?auto_346932 ?auto_346933 ?auto_346934 ?auto_346935 ?auto_346936 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_346952 - BLOCK
      ?auto_346953 - BLOCK
      ?auto_346954 - BLOCK
      ?auto_346955 - BLOCK
      ?auto_346956 - BLOCK
      ?auto_346957 - BLOCK
      ?auto_346958 - BLOCK
      ?auto_346959 - BLOCK
      ?auto_346960 - BLOCK
      ?auto_346961 - BLOCK
      ?auto_346962 - BLOCK
      ?auto_346963 - BLOCK
      ?auto_346964 - BLOCK
      ?auto_346965 - BLOCK
    )
    :vars
    (
      ?auto_346966 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_346964 ) ( ON ?auto_346965 ?auto_346966 ) ( CLEAR ?auto_346965 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_346952 ) ( ON ?auto_346953 ?auto_346952 ) ( ON ?auto_346954 ?auto_346953 ) ( ON ?auto_346955 ?auto_346954 ) ( ON ?auto_346956 ?auto_346955 ) ( ON ?auto_346957 ?auto_346956 ) ( ON ?auto_346958 ?auto_346957 ) ( ON ?auto_346959 ?auto_346958 ) ( ON ?auto_346960 ?auto_346959 ) ( ON ?auto_346961 ?auto_346960 ) ( ON ?auto_346962 ?auto_346961 ) ( ON ?auto_346963 ?auto_346962 ) ( ON ?auto_346964 ?auto_346963 ) ( not ( = ?auto_346952 ?auto_346953 ) ) ( not ( = ?auto_346952 ?auto_346954 ) ) ( not ( = ?auto_346952 ?auto_346955 ) ) ( not ( = ?auto_346952 ?auto_346956 ) ) ( not ( = ?auto_346952 ?auto_346957 ) ) ( not ( = ?auto_346952 ?auto_346958 ) ) ( not ( = ?auto_346952 ?auto_346959 ) ) ( not ( = ?auto_346952 ?auto_346960 ) ) ( not ( = ?auto_346952 ?auto_346961 ) ) ( not ( = ?auto_346952 ?auto_346962 ) ) ( not ( = ?auto_346952 ?auto_346963 ) ) ( not ( = ?auto_346952 ?auto_346964 ) ) ( not ( = ?auto_346952 ?auto_346965 ) ) ( not ( = ?auto_346952 ?auto_346966 ) ) ( not ( = ?auto_346953 ?auto_346954 ) ) ( not ( = ?auto_346953 ?auto_346955 ) ) ( not ( = ?auto_346953 ?auto_346956 ) ) ( not ( = ?auto_346953 ?auto_346957 ) ) ( not ( = ?auto_346953 ?auto_346958 ) ) ( not ( = ?auto_346953 ?auto_346959 ) ) ( not ( = ?auto_346953 ?auto_346960 ) ) ( not ( = ?auto_346953 ?auto_346961 ) ) ( not ( = ?auto_346953 ?auto_346962 ) ) ( not ( = ?auto_346953 ?auto_346963 ) ) ( not ( = ?auto_346953 ?auto_346964 ) ) ( not ( = ?auto_346953 ?auto_346965 ) ) ( not ( = ?auto_346953 ?auto_346966 ) ) ( not ( = ?auto_346954 ?auto_346955 ) ) ( not ( = ?auto_346954 ?auto_346956 ) ) ( not ( = ?auto_346954 ?auto_346957 ) ) ( not ( = ?auto_346954 ?auto_346958 ) ) ( not ( = ?auto_346954 ?auto_346959 ) ) ( not ( = ?auto_346954 ?auto_346960 ) ) ( not ( = ?auto_346954 ?auto_346961 ) ) ( not ( = ?auto_346954 ?auto_346962 ) ) ( not ( = ?auto_346954 ?auto_346963 ) ) ( not ( = ?auto_346954 ?auto_346964 ) ) ( not ( = ?auto_346954 ?auto_346965 ) ) ( not ( = ?auto_346954 ?auto_346966 ) ) ( not ( = ?auto_346955 ?auto_346956 ) ) ( not ( = ?auto_346955 ?auto_346957 ) ) ( not ( = ?auto_346955 ?auto_346958 ) ) ( not ( = ?auto_346955 ?auto_346959 ) ) ( not ( = ?auto_346955 ?auto_346960 ) ) ( not ( = ?auto_346955 ?auto_346961 ) ) ( not ( = ?auto_346955 ?auto_346962 ) ) ( not ( = ?auto_346955 ?auto_346963 ) ) ( not ( = ?auto_346955 ?auto_346964 ) ) ( not ( = ?auto_346955 ?auto_346965 ) ) ( not ( = ?auto_346955 ?auto_346966 ) ) ( not ( = ?auto_346956 ?auto_346957 ) ) ( not ( = ?auto_346956 ?auto_346958 ) ) ( not ( = ?auto_346956 ?auto_346959 ) ) ( not ( = ?auto_346956 ?auto_346960 ) ) ( not ( = ?auto_346956 ?auto_346961 ) ) ( not ( = ?auto_346956 ?auto_346962 ) ) ( not ( = ?auto_346956 ?auto_346963 ) ) ( not ( = ?auto_346956 ?auto_346964 ) ) ( not ( = ?auto_346956 ?auto_346965 ) ) ( not ( = ?auto_346956 ?auto_346966 ) ) ( not ( = ?auto_346957 ?auto_346958 ) ) ( not ( = ?auto_346957 ?auto_346959 ) ) ( not ( = ?auto_346957 ?auto_346960 ) ) ( not ( = ?auto_346957 ?auto_346961 ) ) ( not ( = ?auto_346957 ?auto_346962 ) ) ( not ( = ?auto_346957 ?auto_346963 ) ) ( not ( = ?auto_346957 ?auto_346964 ) ) ( not ( = ?auto_346957 ?auto_346965 ) ) ( not ( = ?auto_346957 ?auto_346966 ) ) ( not ( = ?auto_346958 ?auto_346959 ) ) ( not ( = ?auto_346958 ?auto_346960 ) ) ( not ( = ?auto_346958 ?auto_346961 ) ) ( not ( = ?auto_346958 ?auto_346962 ) ) ( not ( = ?auto_346958 ?auto_346963 ) ) ( not ( = ?auto_346958 ?auto_346964 ) ) ( not ( = ?auto_346958 ?auto_346965 ) ) ( not ( = ?auto_346958 ?auto_346966 ) ) ( not ( = ?auto_346959 ?auto_346960 ) ) ( not ( = ?auto_346959 ?auto_346961 ) ) ( not ( = ?auto_346959 ?auto_346962 ) ) ( not ( = ?auto_346959 ?auto_346963 ) ) ( not ( = ?auto_346959 ?auto_346964 ) ) ( not ( = ?auto_346959 ?auto_346965 ) ) ( not ( = ?auto_346959 ?auto_346966 ) ) ( not ( = ?auto_346960 ?auto_346961 ) ) ( not ( = ?auto_346960 ?auto_346962 ) ) ( not ( = ?auto_346960 ?auto_346963 ) ) ( not ( = ?auto_346960 ?auto_346964 ) ) ( not ( = ?auto_346960 ?auto_346965 ) ) ( not ( = ?auto_346960 ?auto_346966 ) ) ( not ( = ?auto_346961 ?auto_346962 ) ) ( not ( = ?auto_346961 ?auto_346963 ) ) ( not ( = ?auto_346961 ?auto_346964 ) ) ( not ( = ?auto_346961 ?auto_346965 ) ) ( not ( = ?auto_346961 ?auto_346966 ) ) ( not ( = ?auto_346962 ?auto_346963 ) ) ( not ( = ?auto_346962 ?auto_346964 ) ) ( not ( = ?auto_346962 ?auto_346965 ) ) ( not ( = ?auto_346962 ?auto_346966 ) ) ( not ( = ?auto_346963 ?auto_346964 ) ) ( not ( = ?auto_346963 ?auto_346965 ) ) ( not ( = ?auto_346963 ?auto_346966 ) ) ( not ( = ?auto_346964 ?auto_346965 ) ) ( not ( = ?auto_346964 ?auto_346966 ) ) ( not ( = ?auto_346965 ?auto_346966 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_346965 ?auto_346966 )
      ( !STACK ?auto_346965 ?auto_346964 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_346981 - BLOCK
      ?auto_346982 - BLOCK
      ?auto_346983 - BLOCK
      ?auto_346984 - BLOCK
      ?auto_346985 - BLOCK
      ?auto_346986 - BLOCK
      ?auto_346987 - BLOCK
      ?auto_346988 - BLOCK
      ?auto_346989 - BLOCK
      ?auto_346990 - BLOCK
      ?auto_346991 - BLOCK
      ?auto_346992 - BLOCK
      ?auto_346993 - BLOCK
      ?auto_346994 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_346993 ) ( ON-TABLE ?auto_346994 ) ( CLEAR ?auto_346994 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_346981 ) ( ON ?auto_346982 ?auto_346981 ) ( ON ?auto_346983 ?auto_346982 ) ( ON ?auto_346984 ?auto_346983 ) ( ON ?auto_346985 ?auto_346984 ) ( ON ?auto_346986 ?auto_346985 ) ( ON ?auto_346987 ?auto_346986 ) ( ON ?auto_346988 ?auto_346987 ) ( ON ?auto_346989 ?auto_346988 ) ( ON ?auto_346990 ?auto_346989 ) ( ON ?auto_346991 ?auto_346990 ) ( ON ?auto_346992 ?auto_346991 ) ( ON ?auto_346993 ?auto_346992 ) ( not ( = ?auto_346981 ?auto_346982 ) ) ( not ( = ?auto_346981 ?auto_346983 ) ) ( not ( = ?auto_346981 ?auto_346984 ) ) ( not ( = ?auto_346981 ?auto_346985 ) ) ( not ( = ?auto_346981 ?auto_346986 ) ) ( not ( = ?auto_346981 ?auto_346987 ) ) ( not ( = ?auto_346981 ?auto_346988 ) ) ( not ( = ?auto_346981 ?auto_346989 ) ) ( not ( = ?auto_346981 ?auto_346990 ) ) ( not ( = ?auto_346981 ?auto_346991 ) ) ( not ( = ?auto_346981 ?auto_346992 ) ) ( not ( = ?auto_346981 ?auto_346993 ) ) ( not ( = ?auto_346981 ?auto_346994 ) ) ( not ( = ?auto_346982 ?auto_346983 ) ) ( not ( = ?auto_346982 ?auto_346984 ) ) ( not ( = ?auto_346982 ?auto_346985 ) ) ( not ( = ?auto_346982 ?auto_346986 ) ) ( not ( = ?auto_346982 ?auto_346987 ) ) ( not ( = ?auto_346982 ?auto_346988 ) ) ( not ( = ?auto_346982 ?auto_346989 ) ) ( not ( = ?auto_346982 ?auto_346990 ) ) ( not ( = ?auto_346982 ?auto_346991 ) ) ( not ( = ?auto_346982 ?auto_346992 ) ) ( not ( = ?auto_346982 ?auto_346993 ) ) ( not ( = ?auto_346982 ?auto_346994 ) ) ( not ( = ?auto_346983 ?auto_346984 ) ) ( not ( = ?auto_346983 ?auto_346985 ) ) ( not ( = ?auto_346983 ?auto_346986 ) ) ( not ( = ?auto_346983 ?auto_346987 ) ) ( not ( = ?auto_346983 ?auto_346988 ) ) ( not ( = ?auto_346983 ?auto_346989 ) ) ( not ( = ?auto_346983 ?auto_346990 ) ) ( not ( = ?auto_346983 ?auto_346991 ) ) ( not ( = ?auto_346983 ?auto_346992 ) ) ( not ( = ?auto_346983 ?auto_346993 ) ) ( not ( = ?auto_346983 ?auto_346994 ) ) ( not ( = ?auto_346984 ?auto_346985 ) ) ( not ( = ?auto_346984 ?auto_346986 ) ) ( not ( = ?auto_346984 ?auto_346987 ) ) ( not ( = ?auto_346984 ?auto_346988 ) ) ( not ( = ?auto_346984 ?auto_346989 ) ) ( not ( = ?auto_346984 ?auto_346990 ) ) ( not ( = ?auto_346984 ?auto_346991 ) ) ( not ( = ?auto_346984 ?auto_346992 ) ) ( not ( = ?auto_346984 ?auto_346993 ) ) ( not ( = ?auto_346984 ?auto_346994 ) ) ( not ( = ?auto_346985 ?auto_346986 ) ) ( not ( = ?auto_346985 ?auto_346987 ) ) ( not ( = ?auto_346985 ?auto_346988 ) ) ( not ( = ?auto_346985 ?auto_346989 ) ) ( not ( = ?auto_346985 ?auto_346990 ) ) ( not ( = ?auto_346985 ?auto_346991 ) ) ( not ( = ?auto_346985 ?auto_346992 ) ) ( not ( = ?auto_346985 ?auto_346993 ) ) ( not ( = ?auto_346985 ?auto_346994 ) ) ( not ( = ?auto_346986 ?auto_346987 ) ) ( not ( = ?auto_346986 ?auto_346988 ) ) ( not ( = ?auto_346986 ?auto_346989 ) ) ( not ( = ?auto_346986 ?auto_346990 ) ) ( not ( = ?auto_346986 ?auto_346991 ) ) ( not ( = ?auto_346986 ?auto_346992 ) ) ( not ( = ?auto_346986 ?auto_346993 ) ) ( not ( = ?auto_346986 ?auto_346994 ) ) ( not ( = ?auto_346987 ?auto_346988 ) ) ( not ( = ?auto_346987 ?auto_346989 ) ) ( not ( = ?auto_346987 ?auto_346990 ) ) ( not ( = ?auto_346987 ?auto_346991 ) ) ( not ( = ?auto_346987 ?auto_346992 ) ) ( not ( = ?auto_346987 ?auto_346993 ) ) ( not ( = ?auto_346987 ?auto_346994 ) ) ( not ( = ?auto_346988 ?auto_346989 ) ) ( not ( = ?auto_346988 ?auto_346990 ) ) ( not ( = ?auto_346988 ?auto_346991 ) ) ( not ( = ?auto_346988 ?auto_346992 ) ) ( not ( = ?auto_346988 ?auto_346993 ) ) ( not ( = ?auto_346988 ?auto_346994 ) ) ( not ( = ?auto_346989 ?auto_346990 ) ) ( not ( = ?auto_346989 ?auto_346991 ) ) ( not ( = ?auto_346989 ?auto_346992 ) ) ( not ( = ?auto_346989 ?auto_346993 ) ) ( not ( = ?auto_346989 ?auto_346994 ) ) ( not ( = ?auto_346990 ?auto_346991 ) ) ( not ( = ?auto_346990 ?auto_346992 ) ) ( not ( = ?auto_346990 ?auto_346993 ) ) ( not ( = ?auto_346990 ?auto_346994 ) ) ( not ( = ?auto_346991 ?auto_346992 ) ) ( not ( = ?auto_346991 ?auto_346993 ) ) ( not ( = ?auto_346991 ?auto_346994 ) ) ( not ( = ?auto_346992 ?auto_346993 ) ) ( not ( = ?auto_346992 ?auto_346994 ) ) ( not ( = ?auto_346993 ?auto_346994 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_346994 )
      ( !STACK ?auto_346994 ?auto_346993 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_347009 - BLOCK
      ?auto_347010 - BLOCK
      ?auto_347011 - BLOCK
      ?auto_347012 - BLOCK
      ?auto_347013 - BLOCK
      ?auto_347014 - BLOCK
      ?auto_347015 - BLOCK
      ?auto_347016 - BLOCK
      ?auto_347017 - BLOCK
      ?auto_347018 - BLOCK
      ?auto_347019 - BLOCK
      ?auto_347020 - BLOCK
      ?auto_347021 - BLOCK
      ?auto_347022 - BLOCK
    )
    :vars
    (
      ?auto_347023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347022 ?auto_347023 ) ( ON-TABLE ?auto_347009 ) ( ON ?auto_347010 ?auto_347009 ) ( ON ?auto_347011 ?auto_347010 ) ( ON ?auto_347012 ?auto_347011 ) ( ON ?auto_347013 ?auto_347012 ) ( ON ?auto_347014 ?auto_347013 ) ( ON ?auto_347015 ?auto_347014 ) ( ON ?auto_347016 ?auto_347015 ) ( ON ?auto_347017 ?auto_347016 ) ( ON ?auto_347018 ?auto_347017 ) ( ON ?auto_347019 ?auto_347018 ) ( ON ?auto_347020 ?auto_347019 ) ( not ( = ?auto_347009 ?auto_347010 ) ) ( not ( = ?auto_347009 ?auto_347011 ) ) ( not ( = ?auto_347009 ?auto_347012 ) ) ( not ( = ?auto_347009 ?auto_347013 ) ) ( not ( = ?auto_347009 ?auto_347014 ) ) ( not ( = ?auto_347009 ?auto_347015 ) ) ( not ( = ?auto_347009 ?auto_347016 ) ) ( not ( = ?auto_347009 ?auto_347017 ) ) ( not ( = ?auto_347009 ?auto_347018 ) ) ( not ( = ?auto_347009 ?auto_347019 ) ) ( not ( = ?auto_347009 ?auto_347020 ) ) ( not ( = ?auto_347009 ?auto_347021 ) ) ( not ( = ?auto_347009 ?auto_347022 ) ) ( not ( = ?auto_347009 ?auto_347023 ) ) ( not ( = ?auto_347010 ?auto_347011 ) ) ( not ( = ?auto_347010 ?auto_347012 ) ) ( not ( = ?auto_347010 ?auto_347013 ) ) ( not ( = ?auto_347010 ?auto_347014 ) ) ( not ( = ?auto_347010 ?auto_347015 ) ) ( not ( = ?auto_347010 ?auto_347016 ) ) ( not ( = ?auto_347010 ?auto_347017 ) ) ( not ( = ?auto_347010 ?auto_347018 ) ) ( not ( = ?auto_347010 ?auto_347019 ) ) ( not ( = ?auto_347010 ?auto_347020 ) ) ( not ( = ?auto_347010 ?auto_347021 ) ) ( not ( = ?auto_347010 ?auto_347022 ) ) ( not ( = ?auto_347010 ?auto_347023 ) ) ( not ( = ?auto_347011 ?auto_347012 ) ) ( not ( = ?auto_347011 ?auto_347013 ) ) ( not ( = ?auto_347011 ?auto_347014 ) ) ( not ( = ?auto_347011 ?auto_347015 ) ) ( not ( = ?auto_347011 ?auto_347016 ) ) ( not ( = ?auto_347011 ?auto_347017 ) ) ( not ( = ?auto_347011 ?auto_347018 ) ) ( not ( = ?auto_347011 ?auto_347019 ) ) ( not ( = ?auto_347011 ?auto_347020 ) ) ( not ( = ?auto_347011 ?auto_347021 ) ) ( not ( = ?auto_347011 ?auto_347022 ) ) ( not ( = ?auto_347011 ?auto_347023 ) ) ( not ( = ?auto_347012 ?auto_347013 ) ) ( not ( = ?auto_347012 ?auto_347014 ) ) ( not ( = ?auto_347012 ?auto_347015 ) ) ( not ( = ?auto_347012 ?auto_347016 ) ) ( not ( = ?auto_347012 ?auto_347017 ) ) ( not ( = ?auto_347012 ?auto_347018 ) ) ( not ( = ?auto_347012 ?auto_347019 ) ) ( not ( = ?auto_347012 ?auto_347020 ) ) ( not ( = ?auto_347012 ?auto_347021 ) ) ( not ( = ?auto_347012 ?auto_347022 ) ) ( not ( = ?auto_347012 ?auto_347023 ) ) ( not ( = ?auto_347013 ?auto_347014 ) ) ( not ( = ?auto_347013 ?auto_347015 ) ) ( not ( = ?auto_347013 ?auto_347016 ) ) ( not ( = ?auto_347013 ?auto_347017 ) ) ( not ( = ?auto_347013 ?auto_347018 ) ) ( not ( = ?auto_347013 ?auto_347019 ) ) ( not ( = ?auto_347013 ?auto_347020 ) ) ( not ( = ?auto_347013 ?auto_347021 ) ) ( not ( = ?auto_347013 ?auto_347022 ) ) ( not ( = ?auto_347013 ?auto_347023 ) ) ( not ( = ?auto_347014 ?auto_347015 ) ) ( not ( = ?auto_347014 ?auto_347016 ) ) ( not ( = ?auto_347014 ?auto_347017 ) ) ( not ( = ?auto_347014 ?auto_347018 ) ) ( not ( = ?auto_347014 ?auto_347019 ) ) ( not ( = ?auto_347014 ?auto_347020 ) ) ( not ( = ?auto_347014 ?auto_347021 ) ) ( not ( = ?auto_347014 ?auto_347022 ) ) ( not ( = ?auto_347014 ?auto_347023 ) ) ( not ( = ?auto_347015 ?auto_347016 ) ) ( not ( = ?auto_347015 ?auto_347017 ) ) ( not ( = ?auto_347015 ?auto_347018 ) ) ( not ( = ?auto_347015 ?auto_347019 ) ) ( not ( = ?auto_347015 ?auto_347020 ) ) ( not ( = ?auto_347015 ?auto_347021 ) ) ( not ( = ?auto_347015 ?auto_347022 ) ) ( not ( = ?auto_347015 ?auto_347023 ) ) ( not ( = ?auto_347016 ?auto_347017 ) ) ( not ( = ?auto_347016 ?auto_347018 ) ) ( not ( = ?auto_347016 ?auto_347019 ) ) ( not ( = ?auto_347016 ?auto_347020 ) ) ( not ( = ?auto_347016 ?auto_347021 ) ) ( not ( = ?auto_347016 ?auto_347022 ) ) ( not ( = ?auto_347016 ?auto_347023 ) ) ( not ( = ?auto_347017 ?auto_347018 ) ) ( not ( = ?auto_347017 ?auto_347019 ) ) ( not ( = ?auto_347017 ?auto_347020 ) ) ( not ( = ?auto_347017 ?auto_347021 ) ) ( not ( = ?auto_347017 ?auto_347022 ) ) ( not ( = ?auto_347017 ?auto_347023 ) ) ( not ( = ?auto_347018 ?auto_347019 ) ) ( not ( = ?auto_347018 ?auto_347020 ) ) ( not ( = ?auto_347018 ?auto_347021 ) ) ( not ( = ?auto_347018 ?auto_347022 ) ) ( not ( = ?auto_347018 ?auto_347023 ) ) ( not ( = ?auto_347019 ?auto_347020 ) ) ( not ( = ?auto_347019 ?auto_347021 ) ) ( not ( = ?auto_347019 ?auto_347022 ) ) ( not ( = ?auto_347019 ?auto_347023 ) ) ( not ( = ?auto_347020 ?auto_347021 ) ) ( not ( = ?auto_347020 ?auto_347022 ) ) ( not ( = ?auto_347020 ?auto_347023 ) ) ( not ( = ?auto_347021 ?auto_347022 ) ) ( not ( = ?auto_347021 ?auto_347023 ) ) ( not ( = ?auto_347022 ?auto_347023 ) ) ( CLEAR ?auto_347020 ) ( ON ?auto_347021 ?auto_347022 ) ( CLEAR ?auto_347021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_347009 ?auto_347010 ?auto_347011 ?auto_347012 ?auto_347013 ?auto_347014 ?auto_347015 ?auto_347016 ?auto_347017 ?auto_347018 ?auto_347019 ?auto_347020 ?auto_347021 )
      ( MAKE-14PILE ?auto_347009 ?auto_347010 ?auto_347011 ?auto_347012 ?auto_347013 ?auto_347014 ?auto_347015 ?auto_347016 ?auto_347017 ?auto_347018 ?auto_347019 ?auto_347020 ?auto_347021 ?auto_347022 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_347038 - BLOCK
      ?auto_347039 - BLOCK
      ?auto_347040 - BLOCK
      ?auto_347041 - BLOCK
      ?auto_347042 - BLOCK
      ?auto_347043 - BLOCK
      ?auto_347044 - BLOCK
      ?auto_347045 - BLOCK
      ?auto_347046 - BLOCK
      ?auto_347047 - BLOCK
      ?auto_347048 - BLOCK
      ?auto_347049 - BLOCK
      ?auto_347050 - BLOCK
      ?auto_347051 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_347051 ) ( ON-TABLE ?auto_347038 ) ( ON ?auto_347039 ?auto_347038 ) ( ON ?auto_347040 ?auto_347039 ) ( ON ?auto_347041 ?auto_347040 ) ( ON ?auto_347042 ?auto_347041 ) ( ON ?auto_347043 ?auto_347042 ) ( ON ?auto_347044 ?auto_347043 ) ( ON ?auto_347045 ?auto_347044 ) ( ON ?auto_347046 ?auto_347045 ) ( ON ?auto_347047 ?auto_347046 ) ( ON ?auto_347048 ?auto_347047 ) ( ON ?auto_347049 ?auto_347048 ) ( not ( = ?auto_347038 ?auto_347039 ) ) ( not ( = ?auto_347038 ?auto_347040 ) ) ( not ( = ?auto_347038 ?auto_347041 ) ) ( not ( = ?auto_347038 ?auto_347042 ) ) ( not ( = ?auto_347038 ?auto_347043 ) ) ( not ( = ?auto_347038 ?auto_347044 ) ) ( not ( = ?auto_347038 ?auto_347045 ) ) ( not ( = ?auto_347038 ?auto_347046 ) ) ( not ( = ?auto_347038 ?auto_347047 ) ) ( not ( = ?auto_347038 ?auto_347048 ) ) ( not ( = ?auto_347038 ?auto_347049 ) ) ( not ( = ?auto_347038 ?auto_347050 ) ) ( not ( = ?auto_347038 ?auto_347051 ) ) ( not ( = ?auto_347039 ?auto_347040 ) ) ( not ( = ?auto_347039 ?auto_347041 ) ) ( not ( = ?auto_347039 ?auto_347042 ) ) ( not ( = ?auto_347039 ?auto_347043 ) ) ( not ( = ?auto_347039 ?auto_347044 ) ) ( not ( = ?auto_347039 ?auto_347045 ) ) ( not ( = ?auto_347039 ?auto_347046 ) ) ( not ( = ?auto_347039 ?auto_347047 ) ) ( not ( = ?auto_347039 ?auto_347048 ) ) ( not ( = ?auto_347039 ?auto_347049 ) ) ( not ( = ?auto_347039 ?auto_347050 ) ) ( not ( = ?auto_347039 ?auto_347051 ) ) ( not ( = ?auto_347040 ?auto_347041 ) ) ( not ( = ?auto_347040 ?auto_347042 ) ) ( not ( = ?auto_347040 ?auto_347043 ) ) ( not ( = ?auto_347040 ?auto_347044 ) ) ( not ( = ?auto_347040 ?auto_347045 ) ) ( not ( = ?auto_347040 ?auto_347046 ) ) ( not ( = ?auto_347040 ?auto_347047 ) ) ( not ( = ?auto_347040 ?auto_347048 ) ) ( not ( = ?auto_347040 ?auto_347049 ) ) ( not ( = ?auto_347040 ?auto_347050 ) ) ( not ( = ?auto_347040 ?auto_347051 ) ) ( not ( = ?auto_347041 ?auto_347042 ) ) ( not ( = ?auto_347041 ?auto_347043 ) ) ( not ( = ?auto_347041 ?auto_347044 ) ) ( not ( = ?auto_347041 ?auto_347045 ) ) ( not ( = ?auto_347041 ?auto_347046 ) ) ( not ( = ?auto_347041 ?auto_347047 ) ) ( not ( = ?auto_347041 ?auto_347048 ) ) ( not ( = ?auto_347041 ?auto_347049 ) ) ( not ( = ?auto_347041 ?auto_347050 ) ) ( not ( = ?auto_347041 ?auto_347051 ) ) ( not ( = ?auto_347042 ?auto_347043 ) ) ( not ( = ?auto_347042 ?auto_347044 ) ) ( not ( = ?auto_347042 ?auto_347045 ) ) ( not ( = ?auto_347042 ?auto_347046 ) ) ( not ( = ?auto_347042 ?auto_347047 ) ) ( not ( = ?auto_347042 ?auto_347048 ) ) ( not ( = ?auto_347042 ?auto_347049 ) ) ( not ( = ?auto_347042 ?auto_347050 ) ) ( not ( = ?auto_347042 ?auto_347051 ) ) ( not ( = ?auto_347043 ?auto_347044 ) ) ( not ( = ?auto_347043 ?auto_347045 ) ) ( not ( = ?auto_347043 ?auto_347046 ) ) ( not ( = ?auto_347043 ?auto_347047 ) ) ( not ( = ?auto_347043 ?auto_347048 ) ) ( not ( = ?auto_347043 ?auto_347049 ) ) ( not ( = ?auto_347043 ?auto_347050 ) ) ( not ( = ?auto_347043 ?auto_347051 ) ) ( not ( = ?auto_347044 ?auto_347045 ) ) ( not ( = ?auto_347044 ?auto_347046 ) ) ( not ( = ?auto_347044 ?auto_347047 ) ) ( not ( = ?auto_347044 ?auto_347048 ) ) ( not ( = ?auto_347044 ?auto_347049 ) ) ( not ( = ?auto_347044 ?auto_347050 ) ) ( not ( = ?auto_347044 ?auto_347051 ) ) ( not ( = ?auto_347045 ?auto_347046 ) ) ( not ( = ?auto_347045 ?auto_347047 ) ) ( not ( = ?auto_347045 ?auto_347048 ) ) ( not ( = ?auto_347045 ?auto_347049 ) ) ( not ( = ?auto_347045 ?auto_347050 ) ) ( not ( = ?auto_347045 ?auto_347051 ) ) ( not ( = ?auto_347046 ?auto_347047 ) ) ( not ( = ?auto_347046 ?auto_347048 ) ) ( not ( = ?auto_347046 ?auto_347049 ) ) ( not ( = ?auto_347046 ?auto_347050 ) ) ( not ( = ?auto_347046 ?auto_347051 ) ) ( not ( = ?auto_347047 ?auto_347048 ) ) ( not ( = ?auto_347047 ?auto_347049 ) ) ( not ( = ?auto_347047 ?auto_347050 ) ) ( not ( = ?auto_347047 ?auto_347051 ) ) ( not ( = ?auto_347048 ?auto_347049 ) ) ( not ( = ?auto_347048 ?auto_347050 ) ) ( not ( = ?auto_347048 ?auto_347051 ) ) ( not ( = ?auto_347049 ?auto_347050 ) ) ( not ( = ?auto_347049 ?auto_347051 ) ) ( not ( = ?auto_347050 ?auto_347051 ) ) ( CLEAR ?auto_347049 ) ( ON ?auto_347050 ?auto_347051 ) ( CLEAR ?auto_347050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_347038 ?auto_347039 ?auto_347040 ?auto_347041 ?auto_347042 ?auto_347043 ?auto_347044 ?auto_347045 ?auto_347046 ?auto_347047 ?auto_347048 ?auto_347049 ?auto_347050 )
      ( MAKE-14PILE ?auto_347038 ?auto_347039 ?auto_347040 ?auto_347041 ?auto_347042 ?auto_347043 ?auto_347044 ?auto_347045 ?auto_347046 ?auto_347047 ?auto_347048 ?auto_347049 ?auto_347050 ?auto_347051 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_347066 - BLOCK
      ?auto_347067 - BLOCK
      ?auto_347068 - BLOCK
      ?auto_347069 - BLOCK
      ?auto_347070 - BLOCK
      ?auto_347071 - BLOCK
      ?auto_347072 - BLOCK
      ?auto_347073 - BLOCK
      ?auto_347074 - BLOCK
      ?auto_347075 - BLOCK
      ?auto_347076 - BLOCK
      ?auto_347077 - BLOCK
      ?auto_347078 - BLOCK
      ?auto_347079 - BLOCK
    )
    :vars
    (
      ?auto_347080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347079 ?auto_347080 ) ( ON-TABLE ?auto_347066 ) ( ON ?auto_347067 ?auto_347066 ) ( ON ?auto_347068 ?auto_347067 ) ( ON ?auto_347069 ?auto_347068 ) ( ON ?auto_347070 ?auto_347069 ) ( ON ?auto_347071 ?auto_347070 ) ( ON ?auto_347072 ?auto_347071 ) ( ON ?auto_347073 ?auto_347072 ) ( ON ?auto_347074 ?auto_347073 ) ( ON ?auto_347075 ?auto_347074 ) ( ON ?auto_347076 ?auto_347075 ) ( not ( = ?auto_347066 ?auto_347067 ) ) ( not ( = ?auto_347066 ?auto_347068 ) ) ( not ( = ?auto_347066 ?auto_347069 ) ) ( not ( = ?auto_347066 ?auto_347070 ) ) ( not ( = ?auto_347066 ?auto_347071 ) ) ( not ( = ?auto_347066 ?auto_347072 ) ) ( not ( = ?auto_347066 ?auto_347073 ) ) ( not ( = ?auto_347066 ?auto_347074 ) ) ( not ( = ?auto_347066 ?auto_347075 ) ) ( not ( = ?auto_347066 ?auto_347076 ) ) ( not ( = ?auto_347066 ?auto_347077 ) ) ( not ( = ?auto_347066 ?auto_347078 ) ) ( not ( = ?auto_347066 ?auto_347079 ) ) ( not ( = ?auto_347066 ?auto_347080 ) ) ( not ( = ?auto_347067 ?auto_347068 ) ) ( not ( = ?auto_347067 ?auto_347069 ) ) ( not ( = ?auto_347067 ?auto_347070 ) ) ( not ( = ?auto_347067 ?auto_347071 ) ) ( not ( = ?auto_347067 ?auto_347072 ) ) ( not ( = ?auto_347067 ?auto_347073 ) ) ( not ( = ?auto_347067 ?auto_347074 ) ) ( not ( = ?auto_347067 ?auto_347075 ) ) ( not ( = ?auto_347067 ?auto_347076 ) ) ( not ( = ?auto_347067 ?auto_347077 ) ) ( not ( = ?auto_347067 ?auto_347078 ) ) ( not ( = ?auto_347067 ?auto_347079 ) ) ( not ( = ?auto_347067 ?auto_347080 ) ) ( not ( = ?auto_347068 ?auto_347069 ) ) ( not ( = ?auto_347068 ?auto_347070 ) ) ( not ( = ?auto_347068 ?auto_347071 ) ) ( not ( = ?auto_347068 ?auto_347072 ) ) ( not ( = ?auto_347068 ?auto_347073 ) ) ( not ( = ?auto_347068 ?auto_347074 ) ) ( not ( = ?auto_347068 ?auto_347075 ) ) ( not ( = ?auto_347068 ?auto_347076 ) ) ( not ( = ?auto_347068 ?auto_347077 ) ) ( not ( = ?auto_347068 ?auto_347078 ) ) ( not ( = ?auto_347068 ?auto_347079 ) ) ( not ( = ?auto_347068 ?auto_347080 ) ) ( not ( = ?auto_347069 ?auto_347070 ) ) ( not ( = ?auto_347069 ?auto_347071 ) ) ( not ( = ?auto_347069 ?auto_347072 ) ) ( not ( = ?auto_347069 ?auto_347073 ) ) ( not ( = ?auto_347069 ?auto_347074 ) ) ( not ( = ?auto_347069 ?auto_347075 ) ) ( not ( = ?auto_347069 ?auto_347076 ) ) ( not ( = ?auto_347069 ?auto_347077 ) ) ( not ( = ?auto_347069 ?auto_347078 ) ) ( not ( = ?auto_347069 ?auto_347079 ) ) ( not ( = ?auto_347069 ?auto_347080 ) ) ( not ( = ?auto_347070 ?auto_347071 ) ) ( not ( = ?auto_347070 ?auto_347072 ) ) ( not ( = ?auto_347070 ?auto_347073 ) ) ( not ( = ?auto_347070 ?auto_347074 ) ) ( not ( = ?auto_347070 ?auto_347075 ) ) ( not ( = ?auto_347070 ?auto_347076 ) ) ( not ( = ?auto_347070 ?auto_347077 ) ) ( not ( = ?auto_347070 ?auto_347078 ) ) ( not ( = ?auto_347070 ?auto_347079 ) ) ( not ( = ?auto_347070 ?auto_347080 ) ) ( not ( = ?auto_347071 ?auto_347072 ) ) ( not ( = ?auto_347071 ?auto_347073 ) ) ( not ( = ?auto_347071 ?auto_347074 ) ) ( not ( = ?auto_347071 ?auto_347075 ) ) ( not ( = ?auto_347071 ?auto_347076 ) ) ( not ( = ?auto_347071 ?auto_347077 ) ) ( not ( = ?auto_347071 ?auto_347078 ) ) ( not ( = ?auto_347071 ?auto_347079 ) ) ( not ( = ?auto_347071 ?auto_347080 ) ) ( not ( = ?auto_347072 ?auto_347073 ) ) ( not ( = ?auto_347072 ?auto_347074 ) ) ( not ( = ?auto_347072 ?auto_347075 ) ) ( not ( = ?auto_347072 ?auto_347076 ) ) ( not ( = ?auto_347072 ?auto_347077 ) ) ( not ( = ?auto_347072 ?auto_347078 ) ) ( not ( = ?auto_347072 ?auto_347079 ) ) ( not ( = ?auto_347072 ?auto_347080 ) ) ( not ( = ?auto_347073 ?auto_347074 ) ) ( not ( = ?auto_347073 ?auto_347075 ) ) ( not ( = ?auto_347073 ?auto_347076 ) ) ( not ( = ?auto_347073 ?auto_347077 ) ) ( not ( = ?auto_347073 ?auto_347078 ) ) ( not ( = ?auto_347073 ?auto_347079 ) ) ( not ( = ?auto_347073 ?auto_347080 ) ) ( not ( = ?auto_347074 ?auto_347075 ) ) ( not ( = ?auto_347074 ?auto_347076 ) ) ( not ( = ?auto_347074 ?auto_347077 ) ) ( not ( = ?auto_347074 ?auto_347078 ) ) ( not ( = ?auto_347074 ?auto_347079 ) ) ( not ( = ?auto_347074 ?auto_347080 ) ) ( not ( = ?auto_347075 ?auto_347076 ) ) ( not ( = ?auto_347075 ?auto_347077 ) ) ( not ( = ?auto_347075 ?auto_347078 ) ) ( not ( = ?auto_347075 ?auto_347079 ) ) ( not ( = ?auto_347075 ?auto_347080 ) ) ( not ( = ?auto_347076 ?auto_347077 ) ) ( not ( = ?auto_347076 ?auto_347078 ) ) ( not ( = ?auto_347076 ?auto_347079 ) ) ( not ( = ?auto_347076 ?auto_347080 ) ) ( not ( = ?auto_347077 ?auto_347078 ) ) ( not ( = ?auto_347077 ?auto_347079 ) ) ( not ( = ?auto_347077 ?auto_347080 ) ) ( not ( = ?auto_347078 ?auto_347079 ) ) ( not ( = ?auto_347078 ?auto_347080 ) ) ( not ( = ?auto_347079 ?auto_347080 ) ) ( ON ?auto_347078 ?auto_347079 ) ( CLEAR ?auto_347076 ) ( ON ?auto_347077 ?auto_347078 ) ( CLEAR ?auto_347077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_347066 ?auto_347067 ?auto_347068 ?auto_347069 ?auto_347070 ?auto_347071 ?auto_347072 ?auto_347073 ?auto_347074 ?auto_347075 ?auto_347076 ?auto_347077 )
      ( MAKE-14PILE ?auto_347066 ?auto_347067 ?auto_347068 ?auto_347069 ?auto_347070 ?auto_347071 ?auto_347072 ?auto_347073 ?auto_347074 ?auto_347075 ?auto_347076 ?auto_347077 ?auto_347078 ?auto_347079 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_347095 - BLOCK
      ?auto_347096 - BLOCK
      ?auto_347097 - BLOCK
      ?auto_347098 - BLOCK
      ?auto_347099 - BLOCK
      ?auto_347100 - BLOCK
      ?auto_347101 - BLOCK
      ?auto_347102 - BLOCK
      ?auto_347103 - BLOCK
      ?auto_347104 - BLOCK
      ?auto_347105 - BLOCK
      ?auto_347106 - BLOCK
      ?auto_347107 - BLOCK
      ?auto_347108 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_347108 ) ( ON-TABLE ?auto_347095 ) ( ON ?auto_347096 ?auto_347095 ) ( ON ?auto_347097 ?auto_347096 ) ( ON ?auto_347098 ?auto_347097 ) ( ON ?auto_347099 ?auto_347098 ) ( ON ?auto_347100 ?auto_347099 ) ( ON ?auto_347101 ?auto_347100 ) ( ON ?auto_347102 ?auto_347101 ) ( ON ?auto_347103 ?auto_347102 ) ( ON ?auto_347104 ?auto_347103 ) ( ON ?auto_347105 ?auto_347104 ) ( not ( = ?auto_347095 ?auto_347096 ) ) ( not ( = ?auto_347095 ?auto_347097 ) ) ( not ( = ?auto_347095 ?auto_347098 ) ) ( not ( = ?auto_347095 ?auto_347099 ) ) ( not ( = ?auto_347095 ?auto_347100 ) ) ( not ( = ?auto_347095 ?auto_347101 ) ) ( not ( = ?auto_347095 ?auto_347102 ) ) ( not ( = ?auto_347095 ?auto_347103 ) ) ( not ( = ?auto_347095 ?auto_347104 ) ) ( not ( = ?auto_347095 ?auto_347105 ) ) ( not ( = ?auto_347095 ?auto_347106 ) ) ( not ( = ?auto_347095 ?auto_347107 ) ) ( not ( = ?auto_347095 ?auto_347108 ) ) ( not ( = ?auto_347096 ?auto_347097 ) ) ( not ( = ?auto_347096 ?auto_347098 ) ) ( not ( = ?auto_347096 ?auto_347099 ) ) ( not ( = ?auto_347096 ?auto_347100 ) ) ( not ( = ?auto_347096 ?auto_347101 ) ) ( not ( = ?auto_347096 ?auto_347102 ) ) ( not ( = ?auto_347096 ?auto_347103 ) ) ( not ( = ?auto_347096 ?auto_347104 ) ) ( not ( = ?auto_347096 ?auto_347105 ) ) ( not ( = ?auto_347096 ?auto_347106 ) ) ( not ( = ?auto_347096 ?auto_347107 ) ) ( not ( = ?auto_347096 ?auto_347108 ) ) ( not ( = ?auto_347097 ?auto_347098 ) ) ( not ( = ?auto_347097 ?auto_347099 ) ) ( not ( = ?auto_347097 ?auto_347100 ) ) ( not ( = ?auto_347097 ?auto_347101 ) ) ( not ( = ?auto_347097 ?auto_347102 ) ) ( not ( = ?auto_347097 ?auto_347103 ) ) ( not ( = ?auto_347097 ?auto_347104 ) ) ( not ( = ?auto_347097 ?auto_347105 ) ) ( not ( = ?auto_347097 ?auto_347106 ) ) ( not ( = ?auto_347097 ?auto_347107 ) ) ( not ( = ?auto_347097 ?auto_347108 ) ) ( not ( = ?auto_347098 ?auto_347099 ) ) ( not ( = ?auto_347098 ?auto_347100 ) ) ( not ( = ?auto_347098 ?auto_347101 ) ) ( not ( = ?auto_347098 ?auto_347102 ) ) ( not ( = ?auto_347098 ?auto_347103 ) ) ( not ( = ?auto_347098 ?auto_347104 ) ) ( not ( = ?auto_347098 ?auto_347105 ) ) ( not ( = ?auto_347098 ?auto_347106 ) ) ( not ( = ?auto_347098 ?auto_347107 ) ) ( not ( = ?auto_347098 ?auto_347108 ) ) ( not ( = ?auto_347099 ?auto_347100 ) ) ( not ( = ?auto_347099 ?auto_347101 ) ) ( not ( = ?auto_347099 ?auto_347102 ) ) ( not ( = ?auto_347099 ?auto_347103 ) ) ( not ( = ?auto_347099 ?auto_347104 ) ) ( not ( = ?auto_347099 ?auto_347105 ) ) ( not ( = ?auto_347099 ?auto_347106 ) ) ( not ( = ?auto_347099 ?auto_347107 ) ) ( not ( = ?auto_347099 ?auto_347108 ) ) ( not ( = ?auto_347100 ?auto_347101 ) ) ( not ( = ?auto_347100 ?auto_347102 ) ) ( not ( = ?auto_347100 ?auto_347103 ) ) ( not ( = ?auto_347100 ?auto_347104 ) ) ( not ( = ?auto_347100 ?auto_347105 ) ) ( not ( = ?auto_347100 ?auto_347106 ) ) ( not ( = ?auto_347100 ?auto_347107 ) ) ( not ( = ?auto_347100 ?auto_347108 ) ) ( not ( = ?auto_347101 ?auto_347102 ) ) ( not ( = ?auto_347101 ?auto_347103 ) ) ( not ( = ?auto_347101 ?auto_347104 ) ) ( not ( = ?auto_347101 ?auto_347105 ) ) ( not ( = ?auto_347101 ?auto_347106 ) ) ( not ( = ?auto_347101 ?auto_347107 ) ) ( not ( = ?auto_347101 ?auto_347108 ) ) ( not ( = ?auto_347102 ?auto_347103 ) ) ( not ( = ?auto_347102 ?auto_347104 ) ) ( not ( = ?auto_347102 ?auto_347105 ) ) ( not ( = ?auto_347102 ?auto_347106 ) ) ( not ( = ?auto_347102 ?auto_347107 ) ) ( not ( = ?auto_347102 ?auto_347108 ) ) ( not ( = ?auto_347103 ?auto_347104 ) ) ( not ( = ?auto_347103 ?auto_347105 ) ) ( not ( = ?auto_347103 ?auto_347106 ) ) ( not ( = ?auto_347103 ?auto_347107 ) ) ( not ( = ?auto_347103 ?auto_347108 ) ) ( not ( = ?auto_347104 ?auto_347105 ) ) ( not ( = ?auto_347104 ?auto_347106 ) ) ( not ( = ?auto_347104 ?auto_347107 ) ) ( not ( = ?auto_347104 ?auto_347108 ) ) ( not ( = ?auto_347105 ?auto_347106 ) ) ( not ( = ?auto_347105 ?auto_347107 ) ) ( not ( = ?auto_347105 ?auto_347108 ) ) ( not ( = ?auto_347106 ?auto_347107 ) ) ( not ( = ?auto_347106 ?auto_347108 ) ) ( not ( = ?auto_347107 ?auto_347108 ) ) ( ON ?auto_347107 ?auto_347108 ) ( CLEAR ?auto_347105 ) ( ON ?auto_347106 ?auto_347107 ) ( CLEAR ?auto_347106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_347095 ?auto_347096 ?auto_347097 ?auto_347098 ?auto_347099 ?auto_347100 ?auto_347101 ?auto_347102 ?auto_347103 ?auto_347104 ?auto_347105 ?auto_347106 )
      ( MAKE-14PILE ?auto_347095 ?auto_347096 ?auto_347097 ?auto_347098 ?auto_347099 ?auto_347100 ?auto_347101 ?auto_347102 ?auto_347103 ?auto_347104 ?auto_347105 ?auto_347106 ?auto_347107 ?auto_347108 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_347123 - BLOCK
      ?auto_347124 - BLOCK
      ?auto_347125 - BLOCK
      ?auto_347126 - BLOCK
      ?auto_347127 - BLOCK
      ?auto_347128 - BLOCK
      ?auto_347129 - BLOCK
      ?auto_347130 - BLOCK
      ?auto_347131 - BLOCK
      ?auto_347132 - BLOCK
      ?auto_347133 - BLOCK
      ?auto_347134 - BLOCK
      ?auto_347135 - BLOCK
      ?auto_347136 - BLOCK
    )
    :vars
    (
      ?auto_347137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347136 ?auto_347137 ) ( ON-TABLE ?auto_347123 ) ( ON ?auto_347124 ?auto_347123 ) ( ON ?auto_347125 ?auto_347124 ) ( ON ?auto_347126 ?auto_347125 ) ( ON ?auto_347127 ?auto_347126 ) ( ON ?auto_347128 ?auto_347127 ) ( ON ?auto_347129 ?auto_347128 ) ( ON ?auto_347130 ?auto_347129 ) ( ON ?auto_347131 ?auto_347130 ) ( ON ?auto_347132 ?auto_347131 ) ( not ( = ?auto_347123 ?auto_347124 ) ) ( not ( = ?auto_347123 ?auto_347125 ) ) ( not ( = ?auto_347123 ?auto_347126 ) ) ( not ( = ?auto_347123 ?auto_347127 ) ) ( not ( = ?auto_347123 ?auto_347128 ) ) ( not ( = ?auto_347123 ?auto_347129 ) ) ( not ( = ?auto_347123 ?auto_347130 ) ) ( not ( = ?auto_347123 ?auto_347131 ) ) ( not ( = ?auto_347123 ?auto_347132 ) ) ( not ( = ?auto_347123 ?auto_347133 ) ) ( not ( = ?auto_347123 ?auto_347134 ) ) ( not ( = ?auto_347123 ?auto_347135 ) ) ( not ( = ?auto_347123 ?auto_347136 ) ) ( not ( = ?auto_347123 ?auto_347137 ) ) ( not ( = ?auto_347124 ?auto_347125 ) ) ( not ( = ?auto_347124 ?auto_347126 ) ) ( not ( = ?auto_347124 ?auto_347127 ) ) ( not ( = ?auto_347124 ?auto_347128 ) ) ( not ( = ?auto_347124 ?auto_347129 ) ) ( not ( = ?auto_347124 ?auto_347130 ) ) ( not ( = ?auto_347124 ?auto_347131 ) ) ( not ( = ?auto_347124 ?auto_347132 ) ) ( not ( = ?auto_347124 ?auto_347133 ) ) ( not ( = ?auto_347124 ?auto_347134 ) ) ( not ( = ?auto_347124 ?auto_347135 ) ) ( not ( = ?auto_347124 ?auto_347136 ) ) ( not ( = ?auto_347124 ?auto_347137 ) ) ( not ( = ?auto_347125 ?auto_347126 ) ) ( not ( = ?auto_347125 ?auto_347127 ) ) ( not ( = ?auto_347125 ?auto_347128 ) ) ( not ( = ?auto_347125 ?auto_347129 ) ) ( not ( = ?auto_347125 ?auto_347130 ) ) ( not ( = ?auto_347125 ?auto_347131 ) ) ( not ( = ?auto_347125 ?auto_347132 ) ) ( not ( = ?auto_347125 ?auto_347133 ) ) ( not ( = ?auto_347125 ?auto_347134 ) ) ( not ( = ?auto_347125 ?auto_347135 ) ) ( not ( = ?auto_347125 ?auto_347136 ) ) ( not ( = ?auto_347125 ?auto_347137 ) ) ( not ( = ?auto_347126 ?auto_347127 ) ) ( not ( = ?auto_347126 ?auto_347128 ) ) ( not ( = ?auto_347126 ?auto_347129 ) ) ( not ( = ?auto_347126 ?auto_347130 ) ) ( not ( = ?auto_347126 ?auto_347131 ) ) ( not ( = ?auto_347126 ?auto_347132 ) ) ( not ( = ?auto_347126 ?auto_347133 ) ) ( not ( = ?auto_347126 ?auto_347134 ) ) ( not ( = ?auto_347126 ?auto_347135 ) ) ( not ( = ?auto_347126 ?auto_347136 ) ) ( not ( = ?auto_347126 ?auto_347137 ) ) ( not ( = ?auto_347127 ?auto_347128 ) ) ( not ( = ?auto_347127 ?auto_347129 ) ) ( not ( = ?auto_347127 ?auto_347130 ) ) ( not ( = ?auto_347127 ?auto_347131 ) ) ( not ( = ?auto_347127 ?auto_347132 ) ) ( not ( = ?auto_347127 ?auto_347133 ) ) ( not ( = ?auto_347127 ?auto_347134 ) ) ( not ( = ?auto_347127 ?auto_347135 ) ) ( not ( = ?auto_347127 ?auto_347136 ) ) ( not ( = ?auto_347127 ?auto_347137 ) ) ( not ( = ?auto_347128 ?auto_347129 ) ) ( not ( = ?auto_347128 ?auto_347130 ) ) ( not ( = ?auto_347128 ?auto_347131 ) ) ( not ( = ?auto_347128 ?auto_347132 ) ) ( not ( = ?auto_347128 ?auto_347133 ) ) ( not ( = ?auto_347128 ?auto_347134 ) ) ( not ( = ?auto_347128 ?auto_347135 ) ) ( not ( = ?auto_347128 ?auto_347136 ) ) ( not ( = ?auto_347128 ?auto_347137 ) ) ( not ( = ?auto_347129 ?auto_347130 ) ) ( not ( = ?auto_347129 ?auto_347131 ) ) ( not ( = ?auto_347129 ?auto_347132 ) ) ( not ( = ?auto_347129 ?auto_347133 ) ) ( not ( = ?auto_347129 ?auto_347134 ) ) ( not ( = ?auto_347129 ?auto_347135 ) ) ( not ( = ?auto_347129 ?auto_347136 ) ) ( not ( = ?auto_347129 ?auto_347137 ) ) ( not ( = ?auto_347130 ?auto_347131 ) ) ( not ( = ?auto_347130 ?auto_347132 ) ) ( not ( = ?auto_347130 ?auto_347133 ) ) ( not ( = ?auto_347130 ?auto_347134 ) ) ( not ( = ?auto_347130 ?auto_347135 ) ) ( not ( = ?auto_347130 ?auto_347136 ) ) ( not ( = ?auto_347130 ?auto_347137 ) ) ( not ( = ?auto_347131 ?auto_347132 ) ) ( not ( = ?auto_347131 ?auto_347133 ) ) ( not ( = ?auto_347131 ?auto_347134 ) ) ( not ( = ?auto_347131 ?auto_347135 ) ) ( not ( = ?auto_347131 ?auto_347136 ) ) ( not ( = ?auto_347131 ?auto_347137 ) ) ( not ( = ?auto_347132 ?auto_347133 ) ) ( not ( = ?auto_347132 ?auto_347134 ) ) ( not ( = ?auto_347132 ?auto_347135 ) ) ( not ( = ?auto_347132 ?auto_347136 ) ) ( not ( = ?auto_347132 ?auto_347137 ) ) ( not ( = ?auto_347133 ?auto_347134 ) ) ( not ( = ?auto_347133 ?auto_347135 ) ) ( not ( = ?auto_347133 ?auto_347136 ) ) ( not ( = ?auto_347133 ?auto_347137 ) ) ( not ( = ?auto_347134 ?auto_347135 ) ) ( not ( = ?auto_347134 ?auto_347136 ) ) ( not ( = ?auto_347134 ?auto_347137 ) ) ( not ( = ?auto_347135 ?auto_347136 ) ) ( not ( = ?auto_347135 ?auto_347137 ) ) ( not ( = ?auto_347136 ?auto_347137 ) ) ( ON ?auto_347135 ?auto_347136 ) ( ON ?auto_347134 ?auto_347135 ) ( CLEAR ?auto_347132 ) ( ON ?auto_347133 ?auto_347134 ) ( CLEAR ?auto_347133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_347123 ?auto_347124 ?auto_347125 ?auto_347126 ?auto_347127 ?auto_347128 ?auto_347129 ?auto_347130 ?auto_347131 ?auto_347132 ?auto_347133 )
      ( MAKE-14PILE ?auto_347123 ?auto_347124 ?auto_347125 ?auto_347126 ?auto_347127 ?auto_347128 ?auto_347129 ?auto_347130 ?auto_347131 ?auto_347132 ?auto_347133 ?auto_347134 ?auto_347135 ?auto_347136 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_347152 - BLOCK
      ?auto_347153 - BLOCK
      ?auto_347154 - BLOCK
      ?auto_347155 - BLOCK
      ?auto_347156 - BLOCK
      ?auto_347157 - BLOCK
      ?auto_347158 - BLOCK
      ?auto_347159 - BLOCK
      ?auto_347160 - BLOCK
      ?auto_347161 - BLOCK
      ?auto_347162 - BLOCK
      ?auto_347163 - BLOCK
      ?auto_347164 - BLOCK
      ?auto_347165 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_347165 ) ( ON-TABLE ?auto_347152 ) ( ON ?auto_347153 ?auto_347152 ) ( ON ?auto_347154 ?auto_347153 ) ( ON ?auto_347155 ?auto_347154 ) ( ON ?auto_347156 ?auto_347155 ) ( ON ?auto_347157 ?auto_347156 ) ( ON ?auto_347158 ?auto_347157 ) ( ON ?auto_347159 ?auto_347158 ) ( ON ?auto_347160 ?auto_347159 ) ( ON ?auto_347161 ?auto_347160 ) ( not ( = ?auto_347152 ?auto_347153 ) ) ( not ( = ?auto_347152 ?auto_347154 ) ) ( not ( = ?auto_347152 ?auto_347155 ) ) ( not ( = ?auto_347152 ?auto_347156 ) ) ( not ( = ?auto_347152 ?auto_347157 ) ) ( not ( = ?auto_347152 ?auto_347158 ) ) ( not ( = ?auto_347152 ?auto_347159 ) ) ( not ( = ?auto_347152 ?auto_347160 ) ) ( not ( = ?auto_347152 ?auto_347161 ) ) ( not ( = ?auto_347152 ?auto_347162 ) ) ( not ( = ?auto_347152 ?auto_347163 ) ) ( not ( = ?auto_347152 ?auto_347164 ) ) ( not ( = ?auto_347152 ?auto_347165 ) ) ( not ( = ?auto_347153 ?auto_347154 ) ) ( not ( = ?auto_347153 ?auto_347155 ) ) ( not ( = ?auto_347153 ?auto_347156 ) ) ( not ( = ?auto_347153 ?auto_347157 ) ) ( not ( = ?auto_347153 ?auto_347158 ) ) ( not ( = ?auto_347153 ?auto_347159 ) ) ( not ( = ?auto_347153 ?auto_347160 ) ) ( not ( = ?auto_347153 ?auto_347161 ) ) ( not ( = ?auto_347153 ?auto_347162 ) ) ( not ( = ?auto_347153 ?auto_347163 ) ) ( not ( = ?auto_347153 ?auto_347164 ) ) ( not ( = ?auto_347153 ?auto_347165 ) ) ( not ( = ?auto_347154 ?auto_347155 ) ) ( not ( = ?auto_347154 ?auto_347156 ) ) ( not ( = ?auto_347154 ?auto_347157 ) ) ( not ( = ?auto_347154 ?auto_347158 ) ) ( not ( = ?auto_347154 ?auto_347159 ) ) ( not ( = ?auto_347154 ?auto_347160 ) ) ( not ( = ?auto_347154 ?auto_347161 ) ) ( not ( = ?auto_347154 ?auto_347162 ) ) ( not ( = ?auto_347154 ?auto_347163 ) ) ( not ( = ?auto_347154 ?auto_347164 ) ) ( not ( = ?auto_347154 ?auto_347165 ) ) ( not ( = ?auto_347155 ?auto_347156 ) ) ( not ( = ?auto_347155 ?auto_347157 ) ) ( not ( = ?auto_347155 ?auto_347158 ) ) ( not ( = ?auto_347155 ?auto_347159 ) ) ( not ( = ?auto_347155 ?auto_347160 ) ) ( not ( = ?auto_347155 ?auto_347161 ) ) ( not ( = ?auto_347155 ?auto_347162 ) ) ( not ( = ?auto_347155 ?auto_347163 ) ) ( not ( = ?auto_347155 ?auto_347164 ) ) ( not ( = ?auto_347155 ?auto_347165 ) ) ( not ( = ?auto_347156 ?auto_347157 ) ) ( not ( = ?auto_347156 ?auto_347158 ) ) ( not ( = ?auto_347156 ?auto_347159 ) ) ( not ( = ?auto_347156 ?auto_347160 ) ) ( not ( = ?auto_347156 ?auto_347161 ) ) ( not ( = ?auto_347156 ?auto_347162 ) ) ( not ( = ?auto_347156 ?auto_347163 ) ) ( not ( = ?auto_347156 ?auto_347164 ) ) ( not ( = ?auto_347156 ?auto_347165 ) ) ( not ( = ?auto_347157 ?auto_347158 ) ) ( not ( = ?auto_347157 ?auto_347159 ) ) ( not ( = ?auto_347157 ?auto_347160 ) ) ( not ( = ?auto_347157 ?auto_347161 ) ) ( not ( = ?auto_347157 ?auto_347162 ) ) ( not ( = ?auto_347157 ?auto_347163 ) ) ( not ( = ?auto_347157 ?auto_347164 ) ) ( not ( = ?auto_347157 ?auto_347165 ) ) ( not ( = ?auto_347158 ?auto_347159 ) ) ( not ( = ?auto_347158 ?auto_347160 ) ) ( not ( = ?auto_347158 ?auto_347161 ) ) ( not ( = ?auto_347158 ?auto_347162 ) ) ( not ( = ?auto_347158 ?auto_347163 ) ) ( not ( = ?auto_347158 ?auto_347164 ) ) ( not ( = ?auto_347158 ?auto_347165 ) ) ( not ( = ?auto_347159 ?auto_347160 ) ) ( not ( = ?auto_347159 ?auto_347161 ) ) ( not ( = ?auto_347159 ?auto_347162 ) ) ( not ( = ?auto_347159 ?auto_347163 ) ) ( not ( = ?auto_347159 ?auto_347164 ) ) ( not ( = ?auto_347159 ?auto_347165 ) ) ( not ( = ?auto_347160 ?auto_347161 ) ) ( not ( = ?auto_347160 ?auto_347162 ) ) ( not ( = ?auto_347160 ?auto_347163 ) ) ( not ( = ?auto_347160 ?auto_347164 ) ) ( not ( = ?auto_347160 ?auto_347165 ) ) ( not ( = ?auto_347161 ?auto_347162 ) ) ( not ( = ?auto_347161 ?auto_347163 ) ) ( not ( = ?auto_347161 ?auto_347164 ) ) ( not ( = ?auto_347161 ?auto_347165 ) ) ( not ( = ?auto_347162 ?auto_347163 ) ) ( not ( = ?auto_347162 ?auto_347164 ) ) ( not ( = ?auto_347162 ?auto_347165 ) ) ( not ( = ?auto_347163 ?auto_347164 ) ) ( not ( = ?auto_347163 ?auto_347165 ) ) ( not ( = ?auto_347164 ?auto_347165 ) ) ( ON ?auto_347164 ?auto_347165 ) ( ON ?auto_347163 ?auto_347164 ) ( CLEAR ?auto_347161 ) ( ON ?auto_347162 ?auto_347163 ) ( CLEAR ?auto_347162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_347152 ?auto_347153 ?auto_347154 ?auto_347155 ?auto_347156 ?auto_347157 ?auto_347158 ?auto_347159 ?auto_347160 ?auto_347161 ?auto_347162 )
      ( MAKE-14PILE ?auto_347152 ?auto_347153 ?auto_347154 ?auto_347155 ?auto_347156 ?auto_347157 ?auto_347158 ?auto_347159 ?auto_347160 ?auto_347161 ?auto_347162 ?auto_347163 ?auto_347164 ?auto_347165 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_347180 - BLOCK
      ?auto_347181 - BLOCK
      ?auto_347182 - BLOCK
      ?auto_347183 - BLOCK
      ?auto_347184 - BLOCK
      ?auto_347185 - BLOCK
      ?auto_347186 - BLOCK
      ?auto_347187 - BLOCK
      ?auto_347188 - BLOCK
      ?auto_347189 - BLOCK
      ?auto_347190 - BLOCK
      ?auto_347191 - BLOCK
      ?auto_347192 - BLOCK
      ?auto_347193 - BLOCK
    )
    :vars
    (
      ?auto_347194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347193 ?auto_347194 ) ( ON-TABLE ?auto_347180 ) ( ON ?auto_347181 ?auto_347180 ) ( ON ?auto_347182 ?auto_347181 ) ( ON ?auto_347183 ?auto_347182 ) ( ON ?auto_347184 ?auto_347183 ) ( ON ?auto_347185 ?auto_347184 ) ( ON ?auto_347186 ?auto_347185 ) ( ON ?auto_347187 ?auto_347186 ) ( ON ?auto_347188 ?auto_347187 ) ( not ( = ?auto_347180 ?auto_347181 ) ) ( not ( = ?auto_347180 ?auto_347182 ) ) ( not ( = ?auto_347180 ?auto_347183 ) ) ( not ( = ?auto_347180 ?auto_347184 ) ) ( not ( = ?auto_347180 ?auto_347185 ) ) ( not ( = ?auto_347180 ?auto_347186 ) ) ( not ( = ?auto_347180 ?auto_347187 ) ) ( not ( = ?auto_347180 ?auto_347188 ) ) ( not ( = ?auto_347180 ?auto_347189 ) ) ( not ( = ?auto_347180 ?auto_347190 ) ) ( not ( = ?auto_347180 ?auto_347191 ) ) ( not ( = ?auto_347180 ?auto_347192 ) ) ( not ( = ?auto_347180 ?auto_347193 ) ) ( not ( = ?auto_347180 ?auto_347194 ) ) ( not ( = ?auto_347181 ?auto_347182 ) ) ( not ( = ?auto_347181 ?auto_347183 ) ) ( not ( = ?auto_347181 ?auto_347184 ) ) ( not ( = ?auto_347181 ?auto_347185 ) ) ( not ( = ?auto_347181 ?auto_347186 ) ) ( not ( = ?auto_347181 ?auto_347187 ) ) ( not ( = ?auto_347181 ?auto_347188 ) ) ( not ( = ?auto_347181 ?auto_347189 ) ) ( not ( = ?auto_347181 ?auto_347190 ) ) ( not ( = ?auto_347181 ?auto_347191 ) ) ( not ( = ?auto_347181 ?auto_347192 ) ) ( not ( = ?auto_347181 ?auto_347193 ) ) ( not ( = ?auto_347181 ?auto_347194 ) ) ( not ( = ?auto_347182 ?auto_347183 ) ) ( not ( = ?auto_347182 ?auto_347184 ) ) ( not ( = ?auto_347182 ?auto_347185 ) ) ( not ( = ?auto_347182 ?auto_347186 ) ) ( not ( = ?auto_347182 ?auto_347187 ) ) ( not ( = ?auto_347182 ?auto_347188 ) ) ( not ( = ?auto_347182 ?auto_347189 ) ) ( not ( = ?auto_347182 ?auto_347190 ) ) ( not ( = ?auto_347182 ?auto_347191 ) ) ( not ( = ?auto_347182 ?auto_347192 ) ) ( not ( = ?auto_347182 ?auto_347193 ) ) ( not ( = ?auto_347182 ?auto_347194 ) ) ( not ( = ?auto_347183 ?auto_347184 ) ) ( not ( = ?auto_347183 ?auto_347185 ) ) ( not ( = ?auto_347183 ?auto_347186 ) ) ( not ( = ?auto_347183 ?auto_347187 ) ) ( not ( = ?auto_347183 ?auto_347188 ) ) ( not ( = ?auto_347183 ?auto_347189 ) ) ( not ( = ?auto_347183 ?auto_347190 ) ) ( not ( = ?auto_347183 ?auto_347191 ) ) ( not ( = ?auto_347183 ?auto_347192 ) ) ( not ( = ?auto_347183 ?auto_347193 ) ) ( not ( = ?auto_347183 ?auto_347194 ) ) ( not ( = ?auto_347184 ?auto_347185 ) ) ( not ( = ?auto_347184 ?auto_347186 ) ) ( not ( = ?auto_347184 ?auto_347187 ) ) ( not ( = ?auto_347184 ?auto_347188 ) ) ( not ( = ?auto_347184 ?auto_347189 ) ) ( not ( = ?auto_347184 ?auto_347190 ) ) ( not ( = ?auto_347184 ?auto_347191 ) ) ( not ( = ?auto_347184 ?auto_347192 ) ) ( not ( = ?auto_347184 ?auto_347193 ) ) ( not ( = ?auto_347184 ?auto_347194 ) ) ( not ( = ?auto_347185 ?auto_347186 ) ) ( not ( = ?auto_347185 ?auto_347187 ) ) ( not ( = ?auto_347185 ?auto_347188 ) ) ( not ( = ?auto_347185 ?auto_347189 ) ) ( not ( = ?auto_347185 ?auto_347190 ) ) ( not ( = ?auto_347185 ?auto_347191 ) ) ( not ( = ?auto_347185 ?auto_347192 ) ) ( not ( = ?auto_347185 ?auto_347193 ) ) ( not ( = ?auto_347185 ?auto_347194 ) ) ( not ( = ?auto_347186 ?auto_347187 ) ) ( not ( = ?auto_347186 ?auto_347188 ) ) ( not ( = ?auto_347186 ?auto_347189 ) ) ( not ( = ?auto_347186 ?auto_347190 ) ) ( not ( = ?auto_347186 ?auto_347191 ) ) ( not ( = ?auto_347186 ?auto_347192 ) ) ( not ( = ?auto_347186 ?auto_347193 ) ) ( not ( = ?auto_347186 ?auto_347194 ) ) ( not ( = ?auto_347187 ?auto_347188 ) ) ( not ( = ?auto_347187 ?auto_347189 ) ) ( not ( = ?auto_347187 ?auto_347190 ) ) ( not ( = ?auto_347187 ?auto_347191 ) ) ( not ( = ?auto_347187 ?auto_347192 ) ) ( not ( = ?auto_347187 ?auto_347193 ) ) ( not ( = ?auto_347187 ?auto_347194 ) ) ( not ( = ?auto_347188 ?auto_347189 ) ) ( not ( = ?auto_347188 ?auto_347190 ) ) ( not ( = ?auto_347188 ?auto_347191 ) ) ( not ( = ?auto_347188 ?auto_347192 ) ) ( not ( = ?auto_347188 ?auto_347193 ) ) ( not ( = ?auto_347188 ?auto_347194 ) ) ( not ( = ?auto_347189 ?auto_347190 ) ) ( not ( = ?auto_347189 ?auto_347191 ) ) ( not ( = ?auto_347189 ?auto_347192 ) ) ( not ( = ?auto_347189 ?auto_347193 ) ) ( not ( = ?auto_347189 ?auto_347194 ) ) ( not ( = ?auto_347190 ?auto_347191 ) ) ( not ( = ?auto_347190 ?auto_347192 ) ) ( not ( = ?auto_347190 ?auto_347193 ) ) ( not ( = ?auto_347190 ?auto_347194 ) ) ( not ( = ?auto_347191 ?auto_347192 ) ) ( not ( = ?auto_347191 ?auto_347193 ) ) ( not ( = ?auto_347191 ?auto_347194 ) ) ( not ( = ?auto_347192 ?auto_347193 ) ) ( not ( = ?auto_347192 ?auto_347194 ) ) ( not ( = ?auto_347193 ?auto_347194 ) ) ( ON ?auto_347192 ?auto_347193 ) ( ON ?auto_347191 ?auto_347192 ) ( ON ?auto_347190 ?auto_347191 ) ( CLEAR ?auto_347188 ) ( ON ?auto_347189 ?auto_347190 ) ( CLEAR ?auto_347189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_347180 ?auto_347181 ?auto_347182 ?auto_347183 ?auto_347184 ?auto_347185 ?auto_347186 ?auto_347187 ?auto_347188 ?auto_347189 )
      ( MAKE-14PILE ?auto_347180 ?auto_347181 ?auto_347182 ?auto_347183 ?auto_347184 ?auto_347185 ?auto_347186 ?auto_347187 ?auto_347188 ?auto_347189 ?auto_347190 ?auto_347191 ?auto_347192 ?auto_347193 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_347209 - BLOCK
      ?auto_347210 - BLOCK
      ?auto_347211 - BLOCK
      ?auto_347212 - BLOCK
      ?auto_347213 - BLOCK
      ?auto_347214 - BLOCK
      ?auto_347215 - BLOCK
      ?auto_347216 - BLOCK
      ?auto_347217 - BLOCK
      ?auto_347218 - BLOCK
      ?auto_347219 - BLOCK
      ?auto_347220 - BLOCK
      ?auto_347221 - BLOCK
      ?auto_347222 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_347222 ) ( ON-TABLE ?auto_347209 ) ( ON ?auto_347210 ?auto_347209 ) ( ON ?auto_347211 ?auto_347210 ) ( ON ?auto_347212 ?auto_347211 ) ( ON ?auto_347213 ?auto_347212 ) ( ON ?auto_347214 ?auto_347213 ) ( ON ?auto_347215 ?auto_347214 ) ( ON ?auto_347216 ?auto_347215 ) ( ON ?auto_347217 ?auto_347216 ) ( not ( = ?auto_347209 ?auto_347210 ) ) ( not ( = ?auto_347209 ?auto_347211 ) ) ( not ( = ?auto_347209 ?auto_347212 ) ) ( not ( = ?auto_347209 ?auto_347213 ) ) ( not ( = ?auto_347209 ?auto_347214 ) ) ( not ( = ?auto_347209 ?auto_347215 ) ) ( not ( = ?auto_347209 ?auto_347216 ) ) ( not ( = ?auto_347209 ?auto_347217 ) ) ( not ( = ?auto_347209 ?auto_347218 ) ) ( not ( = ?auto_347209 ?auto_347219 ) ) ( not ( = ?auto_347209 ?auto_347220 ) ) ( not ( = ?auto_347209 ?auto_347221 ) ) ( not ( = ?auto_347209 ?auto_347222 ) ) ( not ( = ?auto_347210 ?auto_347211 ) ) ( not ( = ?auto_347210 ?auto_347212 ) ) ( not ( = ?auto_347210 ?auto_347213 ) ) ( not ( = ?auto_347210 ?auto_347214 ) ) ( not ( = ?auto_347210 ?auto_347215 ) ) ( not ( = ?auto_347210 ?auto_347216 ) ) ( not ( = ?auto_347210 ?auto_347217 ) ) ( not ( = ?auto_347210 ?auto_347218 ) ) ( not ( = ?auto_347210 ?auto_347219 ) ) ( not ( = ?auto_347210 ?auto_347220 ) ) ( not ( = ?auto_347210 ?auto_347221 ) ) ( not ( = ?auto_347210 ?auto_347222 ) ) ( not ( = ?auto_347211 ?auto_347212 ) ) ( not ( = ?auto_347211 ?auto_347213 ) ) ( not ( = ?auto_347211 ?auto_347214 ) ) ( not ( = ?auto_347211 ?auto_347215 ) ) ( not ( = ?auto_347211 ?auto_347216 ) ) ( not ( = ?auto_347211 ?auto_347217 ) ) ( not ( = ?auto_347211 ?auto_347218 ) ) ( not ( = ?auto_347211 ?auto_347219 ) ) ( not ( = ?auto_347211 ?auto_347220 ) ) ( not ( = ?auto_347211 ?auto_347221 ) ) ( not ( = ?auto_347211 ?auto_347222 ) ) ( not ( = ?auto_347212 ?auto_347213 ) ) ( not ( = ?auto_347212 ?auto_347214 ) ) ( not ( = ?auto_347212 ?auto_347215 ) ) ( not ( = ?auto_347212 ?auto_347216 ) ) ( not ( = ?auto_347212 ?auto_347217 ) ) ( not ( = ?auto_347212 ?auto_347218 ) ) ( not ( = ?auto_347212 ?auto_347219 ) ) ( not ( = ?auto_347212 ?auto_347220 ) ) ( not ( = ?auto_347212 ?auto_347221 ) ) ( not ( = ?auto_347212 ?auto_347222 ) ) ( not ( = ?auto_347213 ?auto_347214 ) ) ( not ( = ?auto_347213 ?auto_347215 ) ) ( not ( = ?auto_347213 ?auto_347216 ) ) ( not ( = ?auto_347213 ?auto_347217 ) ) ( not ( = ?auto_347213 ?auto_347218 ) ) ( not ( = ?auto_347213 ?auto_347219 ) ) ( not ( = ?auto_347213 ?auto_347220 ) ) ( not ( = ?auto_347213 ?auto_347221 ) ) ( not ( = ?auto_347213 ?auto_347222 ) ) ( not ( = ?auto_347214 ?auto_347215 ) ) ( not ( = ?auto_347214 ?auto_347216 ) ) ( not ( = ?auto_347214 ?auto_347217 ) ) ( not ( = ?auto_347214 ?auto_347218 ) ) ( not ( = ?auto_347214 ?auto_347219 ) ) ( not ( = ?auto_347214 ?auto_347220 ) ) ( not ( = ?auto_347214 ?auto_347221 ) ) ( not ( = ?auto_347214 ?auto_347222 ) ) ( not ( = ?auto_347215 ?auto_347216 ) ) ( not ( = ?auto_347215 ?auto_347217 ) ) ( not ( = ?auto_347215 ?auto_347218 ) ) ( not ( = ?auto_347215 ?auto_347219 ) ) ( not ( = ?auto_347215 ?auto_347220 ) ) ( not ( = ?auto_347215 ?auto_347221 ) ) ( not ( = ?auto_347215 ?auto_347222 ) ) ( not ( = ?auto_347216 ?auto_347217 ) ) ( not ( = ?auto_347216 ?auto_347218 ) ) ( not ( = ?auto_347216 ?auto_347219 ) ) ( not ( = ?auto_347216 ?auto_347220 ) ) ( not ( = ?auto_347216 ?auto_347221 ) ) ( not ( = ?auto_347216 ?auto_347222 ) ) ( not ( = ?auto_347217 ?auto_347218 ) ) ( not ( = ?auto_347217 ?auto_347219 ) ) ( not ( = ?auto_347217 ?auto_347220 ) ) ( not ( = ?auto_347217 ?auto_347221 ) ) ( not ( = ?auto_347217 ?auto_347222 ) ) ( not ( = ?auto_347218 ?auto_347219 ) ) ( not ( = ?auto_347218 ?auto_347220 ) ) ( not ( = ?auto_347218 ?auto_347221 ) ) ( not ( = ?auto_347218 ?auto_347222 ) ) ( not ( = ?auto_347219 ?auto_347220 ) ) ( not ( = ?auto_347219 ?auto_347221 ) ) ( not ( = ?auto_347219 ?auto_347222 ) ) ( not ( = ?auto_347220 ?auto_347221 ) ) ( not ( = ?auto_347220 ?auto_347222 ) ) ( not ( = ?auto_347221 ?auto_347222 ) ) ( ON ?auto_347221 ?auto_347222 ) ( ON ?auto_347220 ?auto_347221 ) ( ON ?auto_347219 ?auto_347220 ) ( CLEAR ?auto_347217 ) ( ON ?auto_347218 ?auto_347219 ) ( CLEAR ?auto_347218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_347209 ?auto_347210 ?auto_347211 ?auto_347212 ?auto_347213 ?auto_347214 ?auto_347215 ?auto_347216 ?auto_347217 ?auto_347218 )
      ( MAKE-14PILE ?auto_347209 ?auto_347210 ?auto_347211 ?auto_347212 ?auto_347213 ?auto_347214 ?auto_347215 ?auto_347216 ?auto_347217 ?auto_347218 ?auto_347219 ?auto_347220 ?auto_347221 ?auto_347222 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_347237 - BLOCK
      ?auto_347238 - BLOCK
      ?auto_347239 - BLOCK
      ?auto_347240 - BLOCK
      ?auto_347241 - BLOCK
      ?auto_347242 - BLOCK
      ?auto_347243 - BLOCK
      ?auto_347244 - BLOCK
      ?auto_347245 - BLOCK
      ?auto_347246 - BLOCK
      ?auto_347247 - BLOCK
      ?auto_347248 - BLOCK
      ?auto_347249 - BLOCK
      ?auto_347250 - BLOCK
    )
    :vars
    (
      ?auto_347251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347250 ?auto_347251 ) ( ON-TABLE ?auto_347237 ) ( ON ?auto_347238 ?auto_347237 ) ( ON ?auto_347239 ?auto_347238 ) ( ON ?auto_347240 ?auto_347239 ) ( ON ?auto_347241 ?auto_347240 ) ( ON ?auto_347242 ?auto_347241 ) ( ON ?auto_347243 ?auto_347242 ) ( ON ?auto_347244 ?auto_347243 ) ( not ( = ?auto_347237 ?auto_347238 ) ) ( not ( = ?auto_347237 ?auto_347239 ) ) ( not ( = ?auto_347237 ?auto_347240 ) ) ( not ( = ?auto_347237 ?auto_347241 ) ) ( not ( = ?auto_347237 ?auto_347242 ) ) ( not ( = ?auto_347237 ?auto_347243 ) ) ( not ( = ?auto_347237 ?auto_347244 ) ) ( not ( = ?auto_347237 ?auto_347245 ) ) ( not ( = ?auto_347237 ?auto_347246 ) ) ( not ( = ?auto_347237 ?auto_347247 ) ) ( not ( = ?auto_347237 ?auto_347248 ) ) ( not ( = ?auto_347237 ?auto_347249 ) ) ( not ( = ?auto_347237 ?auto_347250 ) ) ( not ( = ?auto_347237 ?auto_347251 ) ) ( not ( = ?auto_347238 ?auto_347239 ) ) ( not ( = ?auto_347238 ?auto_347240 ) ) ( not ( = ?auto_347238 ?auto_347241 ) ) ( not ( = ?auto_347238 ?auto_347242 ) ) ( not ( = ?auto_347238 ?auto_347243 ) ) ( not ( = ?auto_347238 ?auto_347244 ) ) ( not ( = ?auto_347238 ?auto_347245 ) ) ( not ( = ?auto_347238 ?auto_347246 ) ) ( not ( = ?auto_347238 ?auto_347247 ) ) ( not ( = ?auto_347238 ?auto_347248 ) ) ( not ( = ?auto_347238 ?auto_347249 ) ) ( not ( = ?auto_347238 ?auto_347250 ) ) ( not ( = ?auto_347238 ?auto_347251 ) ) ( not ( = ?auto_347239 ?auto_347240 ) ) ( not ( = ?auto_347239 ?auto_347241 ) ) ( not ( = ?auto_347239 ?auto_347242 ) ) ( not ( = ?auto_347239 ?auto_347243 ) ) ( not ( = ?auto_347239 ?auto_347244 ) ) ( not ( = ?auto_347239 ?auto_347245 ) ) ( not ( = ?auto_347239 ?auto_347246 ) ) ( not ( = ?auto_347239 ?auto_347247 ) ) ( not ( = ?auto_347239 ?auto_347248 ) ) ( not ( = ?auto_347239 ?auto_347249 ) ) ( not ( = ?auto_347239 ?auto_347250 ) ) ( not ( = ?auto_347239 ?auto_347251 ) ) ( not ( = ?auto_347240 ?auto_347241 ) ) ( not ( = ?auto_347240 ?auto_347242 ) ) ( not ( = ?auto_347240 ?auto_347243 ) ) ( not ( = ?auto_347240 ?auto_347244 ) ) ( not ( = ?auto_347240 ?auto_347245 ) ) ( not ( = ?auto_347240 ?auto_347246 ) ) ( not ( = ?auto_347240 ?auto_347247 ) ) ( not ( = ?auto_347240 ?auto_347248 ) ) ( not ( = ?auto_347240 ?auto_347249 ) ) ( not ( = ?auto_347240 ?auto_347250 ) ) ( not ( = ?auto_347240 ?auto_347251 ) ) ( not ( = ?auto_347241 ?auto_347242 ) ) ( not ( = ?auto_347241 ?auto_347243 ) ) ( not ( = ?auto_347241 ?auto_347244 ) ) ( not ( = ?auto_347241 ?auto_347245 ) ) ( not ( = ?auto_347241 ?auto_347246 ) ) ( not ( = ?auto_347241 ?auto_347247 ) ) ( not ( = ?auto_347241 ?auto_347248 ) ) ( not ( = ?auto_347241 ?auto_347249 ) ) ( not ( = ?auto_347241 ?auto_347250 ) ) ( not ( = ?auto_347241 ?auto_347251 ) ) ( not ( = ?auto_347242 ?auto_347243 ) ) ( not ( = ?auto_347242 ?auto_347244 ) ) ( not ( = ?auto_347242 ?auto_347245 ) ) ( not ( = ?auto_347242 ?auto_347246 ) ) ( not ( = ?auto_347242 ?auto_347247 ) ) ( not ( = ?auto_347242 ?auto_347248 ) ) ( not ( = ?auto_347242 ?auto_347249 ) ) ( not ( = ?auto_347242 ?auto_347250 ) ) ( not ( = ?auto_347242 ?auto_347251 ) ) ( not ( = ?auto_347243 ?auto_347244 ) ) ( not ( = ?auto_347243 ?auto_347245 ) ) ( not ( = ?auto_347243 ?auto_347246 ) ) ( not ( = ?auto_347243 ?auto_347247 ) ) ( not ( = ?auto_347243 ?auto_347248 ) ) ( not ( = ?auto_347243 ?auto_347249 ) ) ( not ( = ?auto_347243 ?auto_347250 ) ) ( not ( = ?auto_347243 ?auto_347251 ) ) ( not ( = ?auto_347244 ?auto_347245 ) ) ( not ( = ?auto_347244 ?auto_347246 ) ) ( not ( = ?auto_347244 ?auto_347247 ) ) ( not ( = ?auto_347244 ?auto_347248 ) ) ( not ( = ?auto_347244 ?auto_347249 ) ) ( not ( = ?auto_347244 ?auto_347250 ) ) ( not ( = ?auto_347244 ?auto_347251 ) ) ( not ( = ?auto_347245 ?auto_347246 ) ) ( not ( = ?auto_347245 ?auto_347247 ) ) ( not ( = ?auto_347245 ?auto_347248 ) ) ( not ( = ?auto_347245 ?auto_347249 ) ) ( not ( = ?auto_347245 ?auto_347250 ) ) ( not ( = ?auto_347245 ?auto_347251 ) ) ( not ( = ?auto_347246 ?auto_347247 ) ) ( not ( = ?auto_347246 ?auto_347248 ) ) ( not ( = ?auto_347246 ?auto_347249 ) ) ( not ( = ?auto_347246 ?auto_347250 ) ) ( not ( = ?auto_347246 ?auto_347251 ) ) ( not ( = ?auto_347247 ?auto_347248 ) ) ( not ( = ?auto_347247 ?auto_347249 ) ) ( not ( = ?auto_347247 ?auto_347250 ) ) ( not ( = ?auto_347247 ?auto_347251 ) ) ( not ( = ?auto_347248 ?auto_347249 ) ) ( not ( = ?auto_347248 ?auto_347250 ) ) ( not ( = ?auto_347248 ?auto_347251 ) ) ( not ( = ?auto_347249 ?auto_347250 ) ) ( not ( = ?auto_347249 ?auto_347251 ) ) ( not ( = ?auto_347250 ?auto_347251 ) ) ( ON ?auto_347249 ?auto_347250 ) ( ON ?auto_347248 ?auto_347249 ) ( ON ?auto_347247 ?auto_347248 ) ( ON ?auto_347246 ?auto_347247 ) ( CLEAR ?auto_347244 ) ( ON ?auto_347245 ?auto_347246 ) ( CLEAR ?auto_347245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_347237 ?auto_347238 ?auto_347239 ?auto_347240 ?auto_347241 ?auto_347242 ?auto_347243 ?auto_347244 ?auto_347245 )
      ( MAKE-14PILE ?auto_347237 ?auto_347238 ?auto_347239 ?auto_347240 ?auto_347241 ?auto_347242 ?auto_347243 ?auto_347244 ?auto_347245 ?auto_347246 ?auto_347247 ?auto_347248 ?auto_347249 ?auto_347250 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_347266 - BLOCK
      ?auto_347267 - BLOCK
      ?auto_347268 - BLOCK
      ?auto_347269 - BLOCK
      ?auto_347270 - BLOCK
      ?auto_347271 - BLOCK
      ?auto_347272 - BLOCK
      ?auto_347273 - BLOCK
      ?auto_347274 - BLOCK
      ?auto_347275 - BLOCK
      ?auto_347276 - BLOCK
      ?auto_347277 - BLOCK
      ?auto_347278 - BLOCK
      ?auto_347279 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_347279 ) ( ON-TABLE ?auto_347266 ) ( ON ?auto_347267 ?auto_347266 ) ( ON ?auto_347268 ?auto_347267 ) ( ON ?auto_347269 ?auto_347268 ) ( ON ?auto_347270 ?auto_347269 ) ( ON ?auto_347271 ?auto_347270 ) ( ON ?auto_347272 ?auto_347271 ) ( ON ?auto_347273 ?auto_347272 ) ( not ( = ?auto_347266 ?auto_347267 ) ) ( not ( = ?auto_347266 ?auto_347268 ) ) ( not ( = ?auto_347266 ?auto_347269 ) ) ( not ( = ?auto_347266 ?auto_347270 ) ) ( not ( = ?auto_347266 ?auto_347271 ) ) ( not ( = ?auto_347266 ?auto_347272 ) ) ( not ( = ?auto_347266 ?auto_347273 ) ) ( not ( = ?auto_347266 ?auto_347274 ) ) ( not ( = ?auto_347266 ?auto_347275 ) ) ( not ( = ?auto_347266 ?auto_347276 ) ) ( not ( = ?auto_347266 ?auto_347277 ) ) ( not ( = ?auto_347266 ?auto_347278 ) ) ( not ( = ?auto_347266 ?auto_347279 ) ) ( not ( = ?auto_347267 ?auto_347268 ) ) ( not ( = ?auto_347267 ?auto_347269 ) ) ( not ( = ?auto_347267 ?auto_347270 ) ) ( not ( = ?auto_347267 ?auto_347271 ) ) ( not ( = ?auto_347267 ?auto_347272 ) ) ( not ( = ?auto_347267 ?auto_347273 ) ) ( not ( = ?auto_347267 ?auto_347274 ) ) ( not ( = ?auto_347267 ?auto_347275 ) ) ( not ( = ?auto_347267 ?auto_347276 ) ) ( not ( = ?auto_347267 ?auto_347277 ) ) ( not ( = ?auto_347267 ?auto_347278 ) ) ( not ( = ?auto_347267 ?auto_347279 ) ) ( not ( = ?auto_347268 ?auto_347269 ) ) ( not ( = ?auto_347268 ?auto_347270 ) ) ( not ( = ?auto_347268 ?auto_347271 ) ) ( not ( = ?auto_347268 ?auto_347272 ) ) ( not ( = ?auto_347268 ?auto_347273 ) ) ( not ( = ?auto_347268 ?auto_347274 ) ) ( not ( = ?auto_347268 ?auto_347275 ) ) ( not ( = ?auto_347268 ?auto_347276 ) ) ( not ( = ?auto_347268 ?auto_347277 ) ) ( not ( = ?auto_347268 ?auto_347278 ) ) ( not ( = ?auto_347268 ?auto_347279 ) ) ( not ( = ?auto_347269 ?auto_347270 ) ) ( not ( = ?auto_347269 ?auto_347271 ) ) ( not ( = ?auto_347269 ?auto_347272 ) ) ( not ( = ?auto_347269 ?auto_347273 ) ) ( not ( = ?auto_347269 ?auto_347274 ) ) ( not ( = ?auto_347269 ?auto_347275 ) ) ( not ( = ?auto_347269 ?auto_347276 ) ) ( not ( = ?auto_347269 ?auto_347277 ) ) ( not ( = ?auto_347269 ?auto_347278 ) ) ( not ( = ?auto_347269 ?auto_347279 ) ) ( not ( = ?auto_347270 ?auto_347271 ) ) ( not ( = ?auto_347270 ?auto_347272 ) ) ( not ( = ?auto_347270 ?auto_347273 ) ) ( not ( = ?auto_347270 ?auto_347274 ) ) ( not ( = ?auto_347270 ?auto_347275 ) ) ( not ( = ?auto_347270 ?auto_347276 ) ) ( not ( = ?auto_347270 ?auto_347277 ) ) ( not ( = ?auto_347270 ?auto_347278 ) ) ( not ( = ?auto_347270 ?auto_347279 ) ) ( not ( = ?auto_347271 ?auto_347272 ) ) ( not ( = ?auto_347271 ?auto_347273 ) ) ( not ( = ?auto_347271 ?auto_347274 ) ) ( not ( = ?auto_347271 ?auto_347275 ) ) ( not ( = ?auto_347271 ?auto_347276 ) ) ( not ( = ?auto_347271 ?auto_347277 ) ) ( not ( = ?auto_347271 ?auto_347278 ) ) ( not ( = ?auto_347271 ?auto_347279 ) ) ( not ( = ?auto_347272 ?auto_347273 ) ) ( not ( = ?auto_347272 ?auto_347274 ) ) ( not ( = ?auto_347272 ?auto_347275 ) ) ( not ( = ?auto_347272 ?auto_347276 ) ) ( not ( = ?auto_347272 ?auto_347277 ) ) ( not ( = ?auto_347272 ?auto_347278 ) ) ( not ( = ?auto_347272 ?auto_347279 ) ) ( not ( = ?auto_347273 ?auto_347274 ) ) ( not ( = ?auto_347273 ?auto_347275 ) ) ( not ( = ?auto_347273 ?auto_347276 ) ) ( not ( = ?auto_347273 ?auto_347277 ) ) ( not ( = ?auto_347273 ?auto_347278 ) ) ( not ( = ?auto_347273 ?auto_347279 ) ) ( not ( = ?auto_347274 ?auto_347275 ) ) ( not ( = ?auto_347274 ?auto_347276 ) ) ( not ( = ?auto_347274 ?auto_347277 ) ) ( not ( = ?auto_347274 ?auto_347278 ) ) ( not ( = ?auto_347274 ?auto_347279 ) ) ( not ( = ?auto_347275 ?auto_347276 ) ) ( not ( = ?auto_347275 ?auto_347277 ) ) ( not ( = ?auto_347275 ?auto_347278 ) ) ( not ( = ?auto_347275 ?auto_347279 ) ) ( not ( = ?auto_347276 ?auto_347277 ) ) ( not ( = ?auto_347276 ?auto_347278 ) ) ( not ( = ?auto_347276 ?auto_347279 ) ) ( not ( = ?auto_347277 ?auto_347278 ) ) ( not ( = ?auto_347277 ?auto_347279 ) ) ( not ( = ?auto_347278 ?auto_347279 ) ) ( ON ?auto_347278 ?auto_347279 ) ( ON ?auto_347277 ?auto_347278 ) ( ON ?auto_347276 ?auto_347277 ) ( ON ?auto_347275 ?auto_347276 ) ( CLEAR ?auto_347273 ) ( ON ?auto_347274 ?auto_347275 ) ( CLEAR ?auto_347274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_347266 ?auto_347267 ?auto_347268 ?auto_347269 ?auto_347270 ?auto_347271 ?auto_347272 ?auto_347273 ?auto_347274 )
      ( MAKE-14PILE ?auto_347266 ?auto_347267 ?auto_347268 ?auto_347269 ?auto_347270 ?auto_347271 ?auto_347272 ?auto_347273 ?auto_347274 ?auto_347275 ?auto_347276 ?auto_347277 ?auto_347278 ?auto_347279 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_347294 - BLOCK
      ?auto_347295 - BLOCK
      ?auto_347296 - BLOCK
      ?auto_347297 - BLOCK
      ?auto_347298 - BLOCK
      ?auto_347299 - BLOCK
      ?auto_347300 - BLOCK
      ?auto_347301 - BLOCK
      ?auto_347302 - BLOCK
      ?auto_347303 - BLOCK
      ?auto_347304 - BLOCK
      ?auto_347305 - BLOCK
      ?auto_347306 - BLOCK
      ?auto_347307 - BLOCK
    )
    :vars
    (
      ?auto_347308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347307 ?auto_347308 ) ( ON-TABLE ?auto_347294 ) ( ON ?auto_347295 ?auto_347294 ) ( ON ?auto_347296 ?auto_347295 ) ( ON ?auto_347297 ?auto_347296 ) ( ON ?auto_347298 ?auto_347297 ) ( ON ?auto_347299 ?auto_347298 ) ( ON ?auto_347300 ?auto_347299 ) ( not ( = ?auto_347294 ?auto_347295 ) ) ( not ( = ?auto_347294 ?auto_347296 ) ) ( not ( = ?auto_347294 ?auto_347297 ) ) ( not ( = ?auto_347294 ?auto_347298 ) ) ( not ( = ?auto_347294 ?auto_347299 ) ) ( not ( = ?auto_347294 ?auto_347300 ) ) ( not ( = ?auto_347294 ?auto_347301 ) ) ( not ( = ?auto_347294 ?auto_347302 ) ) ( not ( = ?auto_347294 ?auto_347303 ) ) ( not ( = ?auto_347294 ?auto_347304 ) ) ( not ( = ?auto_347294 ?auto_347305 ) ) ( not ( = ?auto_347294 ?auto_347306 ) ) ( not ( = ?auto_347294 ?auto_347307 ) ) ( not ( = ?auto_347294 ?auto_347308 ) ) ( not ( = ?auto_347295 ?auto_347296 ) ) ( not ( = ?auto_347295 ?auto_347297 ) ) ( not ( = ?auto_347295 ?auto_347298 ) ) ( not ( = ?auto_347295 ?auto_347299 ) ) ( not ( = ?auto_347295 ?auto_347300 ) ) ( not ( = ?auto_347295 ?auto_347301 ) ) ( not ( = ?auto_347295 ?auto_347302 ) ) ( not ( = ?auto_347295 ?auto_347303 ) ) ( not ( = ?auto_347295 ?auto_347304 ) ) ( not ( = ?auto_347295 ?auto_347305 ) ) ( not ( = ?auto_347295 ?auto_347306 ) ) ( not ( = ?auto_347295 ?auto_347307 ) ) ( not ( = ?auto_347295 ?auto_347308 ) ) ( not ( = ?auto_347296 ?auto_347297 ) ) ( not ( = ?auto_347296 ?auto_347298 ) ) ( not ( = ?auto_347296 ?auto_347299 ) ) ( not ( = ?auto_347296 ?auto_347300 ) ) ( not ( = ?auto_347296 ?auto_347301 ) ) ( not ( = ?auto_347296 ?auto_347302 ) ) ( not ( = ?auto_347296 ?auto_347303 ) ) ( not ( = ?auto_347296 ?auto_347304 ) ) ( not ( = ?auto_347296 ?auto_347305 ) ) ( not ( = ?auto_347296 ?auto_347306 ) ) ( not ( = ?auto_347296 ?auto_347307 ) ) ( not ( = ?auto_347296 ?auto_347308 ) ) ( not ( = ?auto_347297 ?auto_347298 ) ) ( not ( = ?auto_347297 ?auto_347299 ) ) ( not ( = ?auto_347297 ?auto_347300 ) ) ( not ( = ?auto_347297 ?auto_347301 ) ) ( not ( = ?auto_347297 ?auto_347302 ) ) ( not ( = ?auto_347297 ?auto_347303 ) ) ( not ( = ?auto_347297 ?auto_347304 ) ) ( not ( = ?auto_347297 ?auto_347305 ) ) ( not ( = ?auto_347297 ?auto_347306 ) ) ( not ( = ?auto_347297 ?auto_347307 ) ) ( not ( = ?auto_347297 ?auto_347308 ) ) ( not ( = ?auto_347298 ?auto_347299 ) ) ( not ( = ?auto_347298 ?auto_347300 ) ) ( not ( = ?auto_347298 ?auto_347301 ) ) ( not ( = ?auto_347298 ?auto_347302 ) ) ( not ( = ?auto_347298 ?auto_347303 ) ) ( not ( = ?auto_347298 ?auto_347304 ) ) ( not ( = ?auto_347298 ?auto_347305 ) ) ( not ( = ?auto_347298 ?auto_347306 ) ) ( not ( = ?auto_347298 ?auto_347307 ) ) ( not ( = ?auto_347298 ?auto_347308 ) ) ( not ( = ?auto_347299 ?auto_347300 ) ) ( not ( = ?auto_347299 ?auto_347301 ) ) ( not ( = ?auto_347299 ?auto_347302 ) ) ( not ( = ?auto_347299 ?auto_347303 ) ) ( not ( = ?auto_347299 ?auto_347304 ) ) ( not ( = ?auto_347299 ?auto_347305 ) ) ( not ( = ?auto_347299 ?auto_347306 ) ) ( not ( = ?auto_347299 ?auto_347307 ) ) ( not ( = ?auto_347299 ?auto_347308 ) ) ( not ( = ?auto_347300 ?auto_347301 ) ) ( not ( = ?auto_347300 ?auto_347302 ) ) ( not ( = ?auto_347300 ?auto_347303 ) ) ( not ( = ?auto_347300 ?auto_347304 ) ) ( not ( = ?auto_347300 ?auto_347305 ) ) ( not ( = ?auto_347300 ?auto_347306 ) ) ( not ( = ?auto_347300 ?auto_347307 ) ) ( not ( = ?auto_347300 ?auto_347308 ) ) ( not ( = ?auto_347301 ?auto_347302 ) ) ( not ( = ?auto_347301 ?auto_347303 ) ) ( not ( = ?auto_347301 ?auto_347304 ) ) ( not ( = ?auto_347301 ?auto_347305 ) ) ( not ( = ?auto_347301 ?auto_347306 ) ) ( not ( = ?auto_347301 ?auto_347307 ) ) ( not ( = ?auto_347301 ?auto_347308 ) ) ( not ( = ?auto_347302 ?auto_347303 ) ) ( not ( = ?auto_347302 ?auto_347304 ) ) ( not ( = ?auto_347302 ?auto_347305 ) ) ( not ( = ?auto_347302 ?auto_347306 ) ) ( not ( = ?auto_347302 ?auto_347307 ) ) ( not ( = ?auto_347302 ?auto_347308 ) ) ( not ( = ?auto_347303 ?auto_347304 ) ) ( not ( = ?auto_347303 ?auto_347305 ) ) ( not ( = ?auto_347303 ?auto_347306 ) ) ( not ( = ?auto_347303 ?auto_347307 ) ) ( not ( = ?auto_347303 ?auto_347308 ) ) ( not ( = ?auto_347304 ?auto_347305 ) ) ( not ( = ?auto_347304 ?auto_347306 ) ) ( not ( = ?auto_347304 ?auto_347307 ) ) ( not ( = ?auto_347304 ?auto_347308 ) ) ( not ( = ?auto_347305 ?auto_347306 ) ) ( not ( = ?auto_347305 ?auto_347307 ) ) ( not ( = ?auto_347305 ?auto_347308 ) ) ( not ( = ?auto_347306 ?auto_347307 ) ) ( not ( = ?auto_347306 ?auto_347308 ) ) ( not ( = ?auto_347307 ?auto_347308 ) ) ( ON ?auto_347306 ?auto_347307 ) ( ON ?auto_347305 ?auto_347306 ) ( ON ?auto_347304 ?auto_347305 ) ( ON ?auto_347303 ?auto_347304 ) ( ON ?auto_347302 ?auto_347303 ) ( CLEAR ?auto_347300 ) ( ON ?auto_347301 ?auto_347302 ) ( CLEAR ?auto_347301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_347294 ?auto_347295 ?auto_347296 ?auto_347297 ?auto_347298 ?auto_347299 ?auto_347300 ?auto_347301 )
      ( MAKE-14PILE ?auto_347294 ?auto_347295 ?auto_347296 ?auto_347297 ?auto_347298 ?auto_347299 ?auto_347300 ?auto_347301 ?auto_347302 ?auto_347303 ?auto_347304 ?auto_347305 ?auto_347306 ?auto_347307 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_347323 - BLOCK
      ?auto_347324 - BLOCK
      ?auto_347325 - BLOCK
      ?auto_347326 - BLOCK
      ?auto_347327 - BLOCK
      ?auto_347328 - BLOCK
      ?auto_347329 - BLOCK
      ?auto_347330 - BLOCK
      ?auto_347331 - BLOCK
      ?auto_347332 - BLOCK
      ?auto_347333 - BLOCK
      ?auto_347334 - BLOCK
      ?auto_347335 - BLOCK
      ?auto_347336 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_347336 ) ( ON-TABLE ?auto_347323 ) ( ON ?auto_347324 ?auto_347323 ) ( ON ?auto_347325 ?auto_347324 ) ( ON ?auto_347326 ?auto_347325 ) ( ON ?auto_347327 ?auto_347326 ) ( ON ?auto_347328 ?auto_347327 ) ( ON ?auto_347329 ?auto_347328 ) ( not ( = ?auto_347323 ?auto_347324 ) ) ( not ( = ?auto_347323 ?auto_347325 ) ) ( not ( = ?auto_347323 ?auto_347326 ) ) ( not ( = ?auto_347323 ?auto_347327 ) ) ( not ( = ?auto_347323 ?auto_347328 ) ) ( not ( = ?auto_347323 ?auto_347329 ) ) ( not ( = ?auto_347323 ?auto_347330 ) ) ( not ( = ?auto_347323 ?auto_347331 ) ) ( not ( = ?auto_347323 ?auto_347332 ) ) ( not ( = ?auto_347323 ?auto_347333 ) ) ( not ( = ?auto_347323 ?auto_347334 ) ) ( not ( = ?auto_347323 ?auto_347335 ) ) ( not ( = ?auto_347323 ?auto_347336 ) ) ( not ( = ?auto_347324 ?auto_347325 ) ) ( not ( = ?auto_347324 ?auto_347326 ) ) ( not ( = ?auto_347324 ?auto_347327 ) ) ( not ( = ?auto_347324 ?auto_347328 ) ) ( not ( = ?auto_347324 ?auto_347329 ) ) ( not ( = ?auto_347324 ?auto_347330 ) ) ( not ( = ?auto_347324 ?auto_347331 ) ) ( not ( = ?auto_347324 ?auto_347332 ) ) ( not ( = ?auto_347324 ?auto_347333 ) ) ( not ( = ?auto_347324 ?auto_347334 ) ) ( not ( = ?auto_347324 ?auto_347335 ) ) ( not ( = ?auto_347324 ?auto_347336 ) ) ( not ( = ?auto_347325 ?auto_347326 ) ) ( not ( = ?auto_347325 ?auto_347327 ) ) ( not ( = ?auto_347325 ?auto_347328 ) ) ( not ( = ?auto_347325 ?auto_347329 ) ) ( not ( = ?auto_347325 ?auto_347330 ) ) ( not ( = ?auto_347325 ?auto_347331 ) ) ( not ( = ?auto_347325 ?auto_347332 ) ) ( not ( = ?auto_347325 ?auto_347333 ) ) ( not ( = ?auto_347325 ?auto_347334 ) ) ( not ( = ?auto_347325 ?auto_347335 ) ) ( not ( = ?auto_347325 ?auto_347336 ) ) ( not ( = ?auto_347326 ?auto_347327 ) ) ( not ( = ?auto_347326 ?auto_347328 ) ) ( not ( = ?auto_347326 ?auto_347329 ) ) ( not ( = ?auto_347326 ?auto_347330 ) ) ( not ( = ?auto_347326 ?auto_347331 ) ) ( not ( = ?auto_347326 ?auto_347332 ) ) ( not ( = ?auto_347326 ?auto_347333 ) ) ( not ( = ?auto_347326 ?auto_347334 ) ) ( not ( = ?auto_347326 ?auto_347335 ) ) ( not ( = ?auto_347326 ?auto_347336 ) ) ( not ( = ?auto_347327 ?auto_347328 ) ) ( not ( = ?auto_347327 ?auto_347329 ) ) ( not ( = ?auto_347327 ?auto_347330 ) ) ( not ( = ?auto_347327 ?auto_347331 ) ) ( not ( = ?auto_347327 ?auto_347332 ) ) ( not ( = ?auto_347327 ?auto_347333 ) ) ( not ( = ?auto_347327 ?auto_347334 ) ) ( not ( = ?auto_347327 ?auto_347335 ) ) ( not ( = ?auto_347327 ?auto_347336 ) ) ( not ( = ?auto_347328 ?auto_347329 ) ) ( not ( = ?auto_347328 ?auto_347330 ) ) ( not ( = ?auto_347328 ?auto_347331 ) ) ( not ( = ?auto_347328 ?auto_347332 ) ) ( not ( = ?auto_347328 ?auto_347333 ) ) ( not ( = ?auto_347328 ?auto_347334 ) ) ( not ( = ?auto_347328 ?auto_347335 ) ) ( not ( = ?auto_347328 ?auto_347336 ) ) ( not ( = ?auto_347329 ?auto_347330 ) ) ( not ( = ?auto_347329 ?auto_347331 ) ) ( not ( = ?auto_347329 ?auto_347332 ) ) ( not ( = ?auto_347329 ?auto_347333 ) ) ( not ( = ?auto_347329 ?auto_347334 ) ) ( not ( = ?auto_347329 ?auto_347335 ) ) ( not ( = ?auto_347329 ?auto_347336 ) ) ( not ( = ?auto_347330 ?auto_347331 ) ) ( not ( = ?auto_347330 ?auto_347332 ) ) ( not ( = ?auto_347330 ?auto_347333 ) ) ( not ( = ?auto_347330 ?auto_347334 ) ) ( not ( = ?auto_347330 ?auto_347335 ) ) ( not ( = ?auto_347330 ?auto_347336 ) ) ( not ( = ?auto_347331 ?auto_347332 ) ) ( not ( = ?auto_347331 ?auto_347333 ) ) ( not ( = ?auto_347331 ?auto_347334 ) ) ( not ( = ?auto_347331 ?auto_347335 ) ) ( not ( = ?auto_347331 ?auto_347336 ) ) ( not ( = ?auto_347332 ?auto_347333 ) ) ( not ( = ?auto_347332 ?auto_347334 ) ) ( not ( = ?auto_347332 ?auto_347335 ) ) ( not ( = ?auto_347332 ?auto_347336 ) ) ( not ( = ?auto_347333 ?auto_347334 ) ) ( not ( = ?auto_347333 ?auto_347335 ) ) ( not ( = ?auto_347333 ?auto_347336 ) ) ( not ( = ?auto_347334 ?auto_347335 ) ) ( not ( = ?auto_347334 ?auto_347336 ) ) ( not ( = ?auto_347335 ?auto_347336 ) ) ( ON ?auto_347335 ?auto_347336 ) ( ON ?auto_347334 ?auto_347335 ) ( ON ?auto_347333 ?auto_347334 ) ( ON ?auto_347332 ?auto_347333 ) ( ON ?auto_347331 ?auto_347332 ) ( CLEAR ?auto_347329 ) ( ON ?auto_347330 ?auto_347331 ) ( CLEAR ?auto_347330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_347323 ?auto_347324 ?auto_347325 ?auto_347326 ?auto_347327 ?auto_347328 ?auto_347329 ?auto_347330 )
      ( MAKE-14PILE ?auto_347323 ?auto_347324 ?auto_347325 ?auto_347326 ?auto_347327 ?auto_347328 ?auto_347329 ?auto_347330 ?auto_347331 ?auto_347332 ?auto_347333 ?auto_347334 ?auto_347335 ?auto_347336 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_347351 - BLOCK
      ?auto_347352 - BLOCK
      ?auto_347353 - BLOCK
      ?auto_347354 - BLOCK
      ?auto_347355 - BLOCK
      ?auto_347356 - BLOCK
      ?auto_347357 - BLOCK
      ?auto_347358 - BLOCK
      ?auto_347359 - BLOCK
      ?auto_347360 - BLOCK
      ?auto_347361 - BLOCK
      ?auto_347362 - BLOCK
      ?auto_347363 - BLOCK
      ?auto_347364 - BLOCK
    )
    :vars
    (
      ?auto_347365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347364 ?auto_347365 ) ( ON-TABLE ?auto_347351 ) ( ON ?auto_347352 ?auto_347351 ) ( ON ?auto_347353 ?auto_347352 ) ( ON ?auto_347354 ?auto_347353 ) ( ON ?auto_347355 ?auto_347354 ) ( ON ?auto_347356 ?auto_347355 ) ( not ( = ?auto_347351 ?auto_347352 ) ) ( not ( = ?auto_347351 ?auto_347353 ) ) ( not ( = ?auto_347351 ?auto_347354 ) ) ( not ( = ?auto_347351 ?auto_347355 ) ) ( not ( = ?auto_347351 ?auto_347356 ) ) ( not ( = ?auto_347351 ?auto_347357 ) ) ( not ( = ?auto_347351 ?auto_347358 ) ) ( not ( = ?auto_347351 ?auto_347359 ) ) ( not ( = ?auto_347351 ?auto_347360 ) ) ( not ( = ?auto_347351 ?auto_347361 ) ) ( not ( = ?auto_347351 ?auto_347362 ) ) ( not ( = ?auto_347351 ?auto_347363 ) ) ( not ( = ?auto_347351 ?auto_347364 ) ) ( not ( = ?auto_347351 ?auto_347365 ) ) ( not ( = ?auto_347352 ?auto_347353 ) ) ( not ( = ?auto_347352 ?auto_347354 ) ) ( not ( = ?auto_347352 ?auto_347355 ) ) ( not ( = ?auto_347352 ?auto_347356 ) ) ( not ( = ?auto_347352 ?auto_347357 ) ) ( not ( = ?auto_347352 ?auto_347358 ) ) ( not ( = ?auto_347352 ?auto_347359 ) ) ( not ( = ?auto_347352 ?auto_347360 ) ) ( not ( = ?auto_347352 ?auto_347361 ) ) ( not ( = ?auto_347352 ?auto_347362 ) ) ( not ( = ?auto_347352 ?auto_347363 ) ) ( not ( = ?auto_347352 ?auto_347364 ) ) ( not ( = ?auto_347352 ?auto_347365 ) ) ( not ( = ?auto_347353 ?auto_347354 ) ) ( not ( = ?auto_347353 ?auto_347355 ) ) ( not ( = ?auto_347353 ?auto_347356 ) ) ( not ( = ?auto_347353 ?auto_347357 ) ) ( not ( = ?auto_347353 ?auto_347358 ) ) ( not ( = ?auto_347353 ?auto_347359 ) ) ( not ( = ?auto_347353 ?auto_347360 ) ) ( not ( = ?auto_347353 ?auto_347361 ) ) ( not ( = ?auto_347353 ?auto_347362 ) ) ( not ( = ?auto_347353 ?auto_347363 ) ) ( not ( = ?auto_347353 ?auto_347364 ) ) ( not ( = ?auto_347353 ?auto_347365 ) ) ( not ( = ?auto_347354 ?auto_347355 ) ) ( not ( = ?auto_347354 ?auto_347356 ) ) ( not ( = ?auto_347354 ?auto_347357 ) ) ( not ( = ?auto_347354 ?auto_347358 ) ) ( not ( = ?auto_347354 ?auto_347359 ) ) ( not ( = ?auto_347354 ?auto_347360 ) ) ( not ( = ?auto_347354 ?auto_347361 ) ) ( not ( = ?auto_347354 ?auto_347362 ) ) ( not ( = ?auto_347354 ?auto_347363 ) ) ( not ( = ?auto_347354 ?auto_347364 ) ) ( not ( = ?auto_347354 ?auto_347365 ) ) ( not ( = ?auto_347355 ?auto_347356 ) ) ( not ( = ?auto_347355 ?auto_347357 ) ) ( not ( = ?auto_347355 ?auto_347358 ) ) ( not ( = ?auto_347355 ?auto_347359 ) ) ( not ( = ?auto_347355 ?auto_347360 ) ) ( not ( = ?auto_347355 ?auto_347361 ) ) ( not ( = ?auto_347355 ?auto_347362 ) ) ( not ( = ?auto_347355 ?auto_347363 ) ) ( not ( = ?auto_347355 ?auto_347364 ) ) ( not ( = ?auto_347355 ?auto_347365 ) ) ( not ( = ?auto_347356 ?auto_347357 ) ) ( not ( = ?auto_347356 ?auto_347358 ) ) ( not ( = ?auto_347356 ?auto_347359 ) ) ( not ( = ?auto_347356 ?auto_347360 ) ) ( not ( = ?auto_347356 ?auto_347361 ) ) ( not ( = ?auto_347356 ?auto_347362 ) ) ( not ( = ?auto_347356 ?auto_347363 ) ) ( not ( = ?auto_347356 ?auto_347364 ) ) ( not ( = ?auto_347356 ?auto_347365 ) ) ( not ( = ?auto_347357 ?auto_347358 ) ) ( not ( = ?auto_347357 ?auto_347359 ) ) ( not ( = ?auto_347357 ?auto_347360 ) ) ( not ( = ?auto_347357 ?auto_347361 ) ) ( not ( = ?auto_347357 ?auto_347362 ) ) ( not ( = ?auto_347357 ?auto_347363 ) ) ( not ( = ?auto_347357 ?auto_347364 ) ) ( not ( = ?auto_347357 ?auto_347365 ) ) ( not ( = ?auto_347358 ?auto_347359 ) ) ( not ( = ?auto_347358 ?auto_347360 ) ) ( not ( = ?auto_347358 ?auto_347361 ) ) ( not ( = ?auto_347358 ?auto_347362 ) ) ( not ( = ?auto_347358 ?auto_347363 ) ) ( not ( = ?auto_347358 ?auto_347364 ) ) ( not ( = ?auto_347358 ?auto_347365 ) ) ( not ( = ?auto_347359 ?auto_347360 ) ) ( not ( = ?auto_347359 ?auto_347361 ) ) ( not ( = ?auto_347359 ?auto_347362 ) ) ( not ( = ?auto_347359 ?auto_347363 ) ) ( not ( = ?auto_347359 ?auto_347364 ) ) ( not ( = ?auto_347359 ?auto_347365 ) ) ( not ( = ?auto_347360 ?auto_347361 ) ) ( not ( = ?auto_347360 ?auto_347362 ) ) ( not ( = ?auto_347360 ?auto_347363 ) ) ( not ( = ?auto_347360 ?auto_347364 ) ) ( not ( = ?auto_347360 ?auto_347365 ) ) ( not ( = ?auto_347361 ?auto_347362 ) ) ( not ( = ?auto_347361 ?auto_347363 ) ) ( not ( = ?auto_347361 ?auto_347364 ) ) ( not ( = ?auto_347361 ?auto_347365 ) ) ( not ( = ?auto_347362 ?auto_347363 ) ) ( not ( = ?auto_347362 ?auto_347364 ) ) ( not ( = ?auto_347362 ?auto_347365 ) ) ( not ( = ?auto_347363 ?auto_347364 ) ) ( not ( = ?auto_347363 ?auto_347365 ) ) ( not ( = ?auto_347364 ?auto_347365 ) ) ( ON ?auto_347363 ?auto_347364 ) ( ON ?auto_347362 ?auto_347363 ) ( ON ?auto_347361 ?auto_347362 ) ( ON ?auto_347360 ?auto_347361 ) ( ON ?auto_347359 ?auto_347360 ) ( ON ?auto_347358 ?auto_347359 ) ( CLEAR ?auto_347356 ) ( ON ?auto_347357 ?auto_347358 ) ( CLEAR ?auto_347357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_347351 ?auto_347352 ?auto_347353 ?auto_347354 ?auto_347355 ?auto_347356 ?auto_347357 )
      ( MAKE-14PILE ?auto_347351 ?auto_347352 ?auto_347353 ?auto_347354 ?auto_347355 ?auto_347356 ?auto_347357 ?auto_347358 ?auto_347359 ?auto_347360 ?auto_347361 ?auto_347362 ?auto_347363 ?auto_347364 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_347380 - BLOCK
      ?auto_347381 - BLOCK
      ?auto_347382 - BLOCK
      ?auto_347383 - BLOCK
      ?auto_347384 - BLOCK
      ?auto_347385 - BLOCK
      ?auto_347386 - BLOCK
      ?auto_347387 - BLOCK
      ?auto_347388 - BLOCK
      ?auto_347389 - BLOCK
      ?auto_347390 - BLOCK
      ?auto_347391 - BLOCK
      ?auto_347392 - BLOCK
      ?auto_347393 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_347393 ) ( ON-TABLE ?auto_347380 ) ( ON ?auto_347381 ?auto_347380 ) ( ON ?auto_347382 ?auto_347381 ) ( ON ?auto_347383 ?auto_347382 ) ( ON ?auto_347384 ?auto_347383 ) ( ON ?auto_347385 ?auto_347384 ) ( not ( = ?auto_347380 ?auto_347381 ) ) ( not ( = ?auto_347380 ?auto_347382 ) ) ( not ( = ?auto_347380 ?auto_347383 ) ) ( not ( = ?auto_347380 ?auto_347384 ) ) ( not ( = ?auto_347380 ?auto_347385 ) ) ( not ( = ?auto_347380 ?auto_347386 ) ) ( not ( = ?auto_347380 ?auto_347387 ) ) ( not ( = ?auto_347380 ?auto_347388 ) ) ( not ( = ?auto_347380 ?auto_347389 ) ) ( not ( = ?auto_347380 ?auto_347390 ) ) ( not ( = ?auto_347380 ?auto_347391 ) ) ( not ( = ?auto_347380 ?auto_347392 ) ) ( not ( = ?auto_347380 ?auto_347393 ) ) ( not ( = ?auto_347381 ?auto_347382 ) ) ( not ( = ?auto_347381 ?auto_347383 ) ) ( not ( = ?auto_347381 ?auto_347384 ) ) ( not ( = ?auto_347381 ?auto_347385 ) ) ( not ( = ?auto_347381 ?auto_347386 ) ) ( not ( = ?auto_347381 ?auto_347387 ) ) ( not ( = ?auto_347381 ?auto_347388 ) ) ( not ( = ?auto_347381 ?auto_347389 ) ) ( not ( = ?auto_347381 ?auto_347390 ) ) ( not ( = ?auto_347381 ?auto_347391 ) ) ( not ( = ?auto_347381 ?auto_347392 ) ) ( not ( = ?auto_347381 ?auto_347393 ) ) ( not ( = ?auto_347382 ?auto_347383 ) ) ( not ( = ?auto_347382 ?auto_347384 ) ) ( not ( = ?auto_347382 ?auto_347385 ) ) ( not ( = ?auto_347382 ?auto_347386 ) ) ( not ( = ?auto_347382 ?auto_347387 ) ) ( not ( = ?auto_347382 ?auto_347388 ) ) ( not ( = ?auto_347382 ?auto_347389 ) ) ( not ( = ?auto_347382 ?auto_347390 ) ) ( not ( = ?auto_347382 ?auto_347391 ) ) ( not ( = ?auto_347382 ?auto_347392 ) ) ( not ( = ?auto_347382 ?auto_347393 ) ) ( not ( = ?auto_347383 ?auto_347384 ) ) ( not ( = ?auto_347383 ?auto_347385 ) ) ( not ( = ?auto_347383 ?auto_347386 ) ) ( not ( = ?auto_347383 ?auto_347387 ) ) ( not ( = ?auto_347383 ?auto_347388 ) ) ( not ( = ?auto_347383 ?auto_347389 ) ) ( not ( = ?auto_347383 ?auto_347390 ) ) ( not ( = ?auto_347383 ?auto_347391 ) ) ( not ( = ?auto_347383 ?auto_347392 ) ) ( not ( = ?auto_347383 ?auto_347393 ) ) ( not ( = ?auto_347384 ?auto_347385 ) ) ( not ( = ?auto_347384 ?auto_347386 ) ) ( not ( = ?auto_347384 ?auto_347387 ) ) ( not ( = ?auto_347384 ?auto_347388 ) ) ( not ( = ?auto_347384 ?auto_347389 ) ) ( not ( = ?auto_347384 ?auto_347390 ) ) ( not ( = ?auto_347384 ?auto_347391 ) ) ( not ( = ?auto_347384 ?auto_347392 ) ) ( not ( = ?auto_347384 ?auto_347393 ) ) ( not ( = ?auto_347385 ?auto_347386 ) ) ( not ( = ?auto_347385 ?auto_347387 ) ) ( not ( = ?auto_347385 ?auto_347388 ) ) ( not ( = ?auto_347385 ?auto_347389 ) ) ( not ( = ?auto_347385 ?auto_347390 ) ) ( not ( = ?auto_347385 ?auto_347391 ) ) ( not ( = ?auto_347385 ?auto_347392 ) ) ( not ( = ?auto_347385 ?auto_347393 ) ) ( not ( = ?auto_347386 ?auto_347387 ) ) ( not ( = ?auto_347386 ?auto_347388 ) ) ( not ( = ?auto_347386 ?auto_347389 ) ) ( not ( = ?auto_347386 ?auto_347390 ) ) ( not ( = ?auto_347386 ?auto_347391 ) ) ( not ( = ?auto_347386 ?auto_347392 ) ) ( not ( = ?auto_347386 ?auto_347393 ) ) ( not ( = ?auto_347387 ?auto_347388 ) ) ( not ( = ?auto_347387 ?auto_347389 ) ) ( not ( = ?auto_347387 ?auto_347390 ) ) ( not ( = ?auto_347387 ?auto_347391 ) ) ( not ( = ?auto_347387 ?auto_347392 ) ) ( not ( = ?auto_347387 ?auto_347393 ) ) ( not ( = ?auto_347388 ?auto_347389 ) ) ( not ( = ?auto_347388 ?auto_347390 ) ) ( not ( = ?auto_347388 ?auto_347391 ) ) ( not ( = ?auto_347388 ?auto_347392 ) ) ( not ( = ?auto_347388 ?auto_347393 ) ) ( not ( = ?auto_347389 ?auto_347390 ) ) ( not ( = ?auto_347389 ?auto_347391 ) ) ( not ( = ?auto_347389 ?auto_347392 ) ) ( not ( = ?auto_347389 ?auto_347393 ) ) ( not ( = ?auto_347390 ?auto_347391 ) ) ( not ( = ?auto_347390 ?auto_347392 ) ) ( not ( = ?auto_347390 ?auto_347393 ) ) ( not ( = ?auto_347391 ?auto_347392 ) ) ( not ( = ?auto_347391 ?auto_347393 ) ) ( not ( = ?auto_347392 ?auto_347393 ) ) ( ON ?auto_347392 ?auto_347393 ) ( ON ?auto_347391 ?auto_347392 ) ( ON ?auto_347390 ?auto_347391 ) ( ON ?auto_347389 ?auto_347390 ) ( ON ?auto_347388 ?auto_347389 ) ( ON ?auto_347387 ?auto_347388 ) ( CLEAR ?auto_347385 ) ( ON ?auto_347386 ?auto_347387 ) ( CLEAR ?auto_347386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_347380 ?auto_347381 ?auto_347382 ?auto_347383 ?auto_347384 ?auto_347385 ?auto_347386 )
      ( MAKE-14PILE ?auto_347380 ?auto_347381 ?auto_347382 ?auto_347383 ?auto_347384 ?auto_347385 ?auto_347386 ?auto_347387 ?auto_347388 ?auto_347389 ?auto_347390 ?auto_347391 ?auto_347392 ?auto_347393 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_347408 - BLOCK
      ?auto_347409 - BLOCK
      ?auto_347410 - BLOCK
      ?auto_347411 - BLOCK
      ?auto_347412 - BLOCK
      ?auto_347413 - BLOCK
      ?auto_347414 - BLOCK
      ?auto_347415 - BLOCK
      ?auto_347416 - BLOCK
      ?auto_347417 - BLOCK
      ?auto_347418 - BLOCK
      ?auto_347419 - BLOCK
      ?auto_347420 - BLOCK
      ?auto_347421 - BLOCK
    )
    :vars
    (
      ?auto_347422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347421 ?auto_347422 ) ( ON-TABLE ?auto_347408 ) ( ON ?auto_347409 ?auto_347408 ) ( ON ?auto_347410 ?auto_347409 ) ( ON ?auto_347411 ?auto_347410 ) ( ON ?auto_347412 ?auto_347411 ) ( not ( = ?auto_347408 ?auto_347409 ) ) ( not ( = ?auto_347408 ?auto_347410 ) ) ( not ( = ?auto_347408 ?auto_347411 ) ) ( not ( = ?auto_347408 ?auto_347412 ) ) ( not ( = ?auto_347408 ?auto_347413 ) ) ( not ( = ?auto_347408 ?auto_347414 ) ) ( not ( = ?auto_347408 ?auto_347415 ) ) ( not ( = ?auto_347408 ?auto_347416 ) ) ( not ( = ?auto_347408 ?auto_347417 ) ) ( not ( = ?auto_347408 ?auto_347418 ) ) ( not ( = ?auto_347408 ?auto_347419 ) ) ( not ( = ?auto_347408 ?auto_347420 ) ) ( not ( = ?auto_347408 ?auto_347421 ) ) ( not ( = ?auto_347408 ?auto_347422 ) ) ( not ( = ?auto_347409 ?auto_347410 ) ) ( not ( = ?auto_347409 ?auto_347411 ) ) ( not ( = ?auto_347409 ?auto_347412 ) ) ( not ( = ?auto_347409 ?auto_347413 ) ) ( not ( = ?auto_347409 ?auto_347414 ) ) ( not ( = ?auto_347409 ?auto_347415 ) ) ( not ( = ?auto_347409 ?auto_347416 ) ) ( not ( = ?auto_347409 ?auto_347417 ) ) ( not ( = ?auto_347409 ?auto_347418 ) ) ( not ( = ?auto_347409 ?auto_347419 ) ) ( not ( = ?auto_347409 ?auto_347420 ) ) ( not ( = ?auto_347409 ?auto_347421 ) ) ( not ( = ?auto_347409 ?auto_347422 ) ) ( not ( = ?auto_347410 ?auto_347411 ) ) ( not ( = ?auto_347410 ?auto_347412 ) ) ( not ( = ?auto_347410 ?auto_347413 ) ) ( not ( = ?auto_347410 ?auto_347414 ) ) ( not ( = ?auto_347410 ?auto_347415 ) ) ( not ( = ?auto_347410 ?auto_347416 ) ) ( not ( = ?auto_347410 ?auto_347417 ) ) ( not ( = ?auto_347410 ?auto_347418 ) ) ( not ( = ?auto_347410 ?auto_347419 ) ) ( not ( = ?auto_347410 ?auto_347420 ) ) ( not ( = ?auto_347410 ?auto_347421 ) ) ( not ( = ?auto_347410 ?auto_347422 ) ) ( not ( = ?auto_347411 ?auto_347412 ) ) ( not ( = ?auto_347411 ?auto_347413 ) ) ( not ( = ?auto_347411 ?auto_347414 ) ) ( not ( = ?auto_347411 ?auto_347415 ) ) ( not ( = ?auto_347411 ?auto_347416 ) ) ( not ( = ?auto_347411 ?auto_347417 ) ) ( not ( = ?auto_347411 ?auto_347418 ) ) ( not ( = ?auto_347411 ?auto_347419 ) ) ( not ( = ?auto_347411 ?auto_347420 ) ) ( not ( = ?auto_347411 ?auto_347421 ) ) ( not ( = ?auto_347411 ?auto_347422 ) ) ( not ( = ?auto_347412 ?auto_347413 ) ) ( not ( = ?auto_347412 ?auto_347414 ) ) ( not ( = ?auto_347412 ?auto_347415 ) ) ( not ( = ?auto_347412 ?auto_347416 ) ) ( not ( = ?auto_347412 ?auto_347417 ) ) ( not ( = ?auto_347412 ?auto_347418 ) ) ( not ( = ?auto_347412 ?auto_347419 ) ) ( not ( = ?auto_347412 ?auto_347420 ) ) ( not ( = ?auto_347412 ?auto_347421 ) ) ( not ( = ?auto_347412 ?auto_347422 ) ) ( not ( = ?auto_347413 ?auto_347414 ) ) ( not ( = ?auto_347413 ?auto_347415 ) ) ( not ( = ?auto_347413 ?auto_347416 ) ) ( not ( = ?auto_347413 ?auto_347417 ) ) ( not ( = ?auto_347413 ?auto_347418 ) ) ( not ( = ?auto_347413 ?auto_347419 ) ) ( not ( = ?auto_347413 ?auto_347420 ) ) ( not ( = ?auto_347413 ?auto_347421 ) ) ( not ( = ?auto_347413 ?auto_347422 ) ) ( not ( = ?auto_347414 ?auto_347415 ) ) ( not ( = ?auto_347414 ?auto_347416 ) ) ( not ( = ?auto_347414 ?auto_347417 ) ) ( not ( = ?auto_347414 ?auto_347418 ) ) ( not ( = ?auto_347414 ?auto_347419 ) ) ( not ( = ?auto_347414 ?auto_347420 ) ) ( not ( = ?auto_347414 ?auto_347421 ) ) ( not ( = ?auto_347414 ?auto_347422 ) ) ( not ( = ?auto_347415 ?auto_347416 ) ) ( not ( = ?auto_347415 ?auto_347417 ) ) ( not ( = ?auto_347415 ?auto_347418 ) ) ( not ( = ?auto_347415 ?auto_347419 ) ) ( not ( = ?auto_347415 ?auto_347420 ) ) ( not ( = ?auto_347415 ?auto_347421 ) ) ( not ( = ?auto_347415 ?auto_347422 ) ) ( not ( = ?auto_347416 ?auto_347417 ) ) ( not ( = ?auto_347416 ?auto_347418 ) ) ( not ( = ?auto_347416 ?auto_347419 ) ) ( not ( = ?auto_347416 ?auto_347420 ) ) ( not ( = ?auto_347416 ?auto_347421 ) ) ( not ( = ?auto_347416 ?auto_347422 ) ) ( not ( = ?auto_347417 ?auto_347418 ) ) ( not ( = ?auto_347417 ?auto_347419 ) ) ( not ( = ?auto_347417 ?auto_347420 ) ) ( not ( = ?auto_347417 ?auto_347421 ) ) ( not ( = ?auto_347417 ?auto_347422 ) ) ( not ( = ?auto_347418 ?auto_347419 ) ) ( not ( = ?auto_347418 ?auto_347420 ) ) ( not ( = ?auto_347418 ?auto_347421 ) ) ( not ( = ?auto_347418 ?auto_347422 ) ) ( not ( = ?auto_347419 ?auto_347420 ) ) ( not ( = ?auto_347419 ?auto_347421 ) ) ( not ( = ?auto_347419 ?auto_347422 ) ) ( not ( = ?auto_347420 ?auto_347421 ) ) ( not ( = ?auto_347420 ?auto_347422 ) ) ( not ( = ?auto_347421 ?auto_347422 ) ) ( ON ?auto_347420 ?auto_347421 ) ( ON ?auto_347419 ?auto_347420 ) ( ON ?auto_347418 ?auto_347419 ) ( ON ?auto_347417 ?auto_347418 ) ( ON ?auto_347416 ?auto_347417 ) ( ON ?auto_347415 ?auto_347416 ) ( ON ?auto_347414 ?auto_347415 ) ( CLEAR ?auto_347412 ) ( ON ?auto_347413 ?auto_347414 ) ( CLEAR ?auto_347413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_347408 ?auto_347409 ?auto_347410 ?auto_347411 ?auto_347412 ?auto_347413 )
      ( MAKE-14PILE ?auto_347408 ?auto_347409 ?auto_347410 ?auto_347411 ?auto_347412 ?auto_347413 ?auto_347414 ?auto_347415 ?auto_347416 ?auto_347417 ?auto_347418 ?auto_347419 ?auto_347420 ?auto_347421 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_347437 - BLOCK
      ?auto_347438 - BLOCK
      ?auto_347439 - BLOCK
      ?auto_347440 - BLOCK
      ?auto_347441 - BLOCK
      ?auto_347442 - BLOCK
      ?auto_347443 - BLOCK
      ?auto_347444 - BLOCK
      ?auto_347445 - BLOCK
      ?auto_347446 - BLOCK
      ?auto_347447 - BLOCK
      ?auto_347448 - BLOCK
      ?auto_347449 - BLOCK
      ?auto_347450 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_347450 ) ( ON-TABLE ?auto_347437 ) ( ON ?auto_347438 ?auto_347437 ) ( ON ?auto_347439 ?auto_347438 ) ( ON ?auto_347440 ?auto_347439 ) ( ON ?auto_347441 ?auto_347440 ) ( not ( = ?auto_347437 ?auto_347438 ) ) ( not ( = ?auto_347437 ?auto_347439 ) ) ( not ( = ?auto_347437 ?auto_347440 ) ) ( not ( = ?auto_347437 ?auto_347441 ) ) ( not ( = ?auto_347437 ?auto_347442 ) ) ( not ( = ?auto_347437 ?auto_347443 ) ) ( not ( = ?auto_347437 ?auto_347444 ) ) ( not ( = ?auto_347437 ?auto_347445 ) ) ( not ( = ?auto_347437 ?auto_347446 ) ) ( not ( = ?auto_347437 ?auto_347447 ) ) ( not ( = ?auto_347437 ?auto_347448 ) ) ( not ( = ?auto_347437 ?auto_347449 ) ) ( not ( = ?auto_347437 ?auto_347450 ) ) ( not ( = ?auto_347438 ?auto_347439 ) ) ( not ( = ?auto_347438 ?auto_347440 ) ) ( not ( = ?auto_347438 ?auto_347441 ) ) ( not ( = ?auto_347438 ?auto_347442 ) ) ( not ( = ?auto_347438 ?auto_347443 ) ) ( not ( = ?auto_347438 ?auto_347444 ) ) ( not ( = ?auto_347438 ?auto_347445 ) ) ( not ( = ?auto_347438 ?auto_347446 ) ) ( not ( = ?auto_347438 ?auto_347447 ) ) ( not ( = ?auto_347438 ?auto_347448 ) ) ( not ( = ?auto_347438 ?auto_347449 ) ) ( not ( = ?auto_347438 ?auto_347450 ) ) ( not ( = ?auto_347439 ?auto_347440 ) ) ( not ( = ?auto_347439 ?auto_347441 ) ) ( not ( = ?auto_347439 ?auto_347442 ) ) ( not ( = ?auto_347439 ?auto_347443 ) ) ( not ( = ?auto_347439 ?auto_347444 ) ) ( not ( = ?auto_347439 ?auto_347445 ) ) ( not ( = ?auto_347439 ?auto_347446 ) ) ( not ( = ?auto_347439 ?auto_347447 ) ) ( not ( = ?auto_347439 ?auto_347448 ) ) ( not ( = ?auto_347439 ?auto_347449 ) ) ( not ( = ?auto_347439 ?auto_347450 ) ) ( not ( = ?auto_347440 ?auto_347441 ) ) ( not ( = ?auto_347440 ?auto_347442 ) ) ( not ( = ?auto_347440 ?auto_347443 ) ) ( not ( = ?auto_347440 ?auto_347444 ) ) ( not ( = ?auto_347440 ?auto_347445 ) ) ( not ( = ?auto_347440 ?auto_347446 ) ) ( not ( = ?auto_347440 ?auto_347447 ) ) ( not ( = ?auto_347440 ?auto_347448 ) ) ( not ( = ?auto_347440 ?auto_347449 ) ) ( not ( = ?auto_347440 ?auto_347450 ) ) ( not ( = ?auto_347441 ?auto_347442 ) ) ( not ( = ?auto_347441 ?auto_347443 ) ) ( not ( = ?auto_347441 ?auto_347444 ) ) ( not ( = ?auto_347441 ?auto_347445 ) ) ( not ( = ?auto_347441 ?auto_347446 ) ) ( not ( = ?auto_347441 ?auto_347447 ) ) ( not ( = ?auto_347441 ?auto_347448 ) ) ( not ( = ?auto_347441 ?auto_347449 ) ) ( not ( = ?auto_347441 ?auto_347450 ) ) ( not ( = ?auto_347442 ?auto_347443 ) ) ( not ( = ?auto_347442 ?auto_347444 ) ) ( not ( = ?auto_347442 ?auto_347445 ) ) ( not ( = ?auto_347442 ?auto_347446 ) ) ( not ( = ?auto_347442 ?auto_347447 ) ) ( not ( = ?auto_347442 ?auto_347448 ) ) ( not ( = ?auto_347442 ?auto_347449 ) ) ( not ( = ?auto_347442 ?auto_347450 ) ) ( not ( = ?auto_347443 ?auto_347444 ) ) ( not ( = ?auto_347443 ?auto_347445 ) ) ( not ( = ?auto_347443 ?auto_347446 ) ) ( not ( = ?auto_347443 ?auto_347447 ) ) ( not ( = ?auto_347443 ?auto_347448 ) ) ( not ( = ?auto_347443 ?auto_347449 ) ) ( not ( = ?auto_347443 ?auto_347450 ) ) ( not ( = ?auto_347444 ?auto_347445 ) ) ( not ( = ?auto_347444 ?auto_347446 ) ) ( not ( = ?auto_347444 ?auto_347447 ) ) ( not ( = ?auto_347444 ?auto_347448 ) ) ( not ( = ?auto_347444 ?auto_347449 ) ) ( not ( = ?auto_347444 ?auto_347450 ) ) ( not ( = ?auto_347445 ?auto_347446 ) ) ( not ( = ?auto_347445 ?auto_347447 ) ) ( not ( = ?auto_347445 ?auto_347448 ) ) ( not ( = ?auto_347445 ?auto_347449 ) ) ( not ( = ?auto_347445 ?auto_347450 ) ) ( not ( = ?auto_347446 ?auto_347447 ) ) ( not ( = ?auto_347446 ?auto_347448 ) ) ( not ( = ?auto_347446 ?auto_347449 ) ) ( not ( = ?auto_347446 ?auto_347450 ) ) ( not ( = ?auto_347447 ?auto_347448 ) ) ( not ( = ?auto_347447 ?auto_347449 ) ) ( not ( = ?auto_347447 ?auto_347450 ) ) ( not ( = ?auto_347448 ?auto_347449 ) ) ( not ( = ?auto_347448 ?auto_347450 ) ) ( not ( = ?auto_347449 ?auto_347450 ) ) ( ON ?auto_347449 ?auto_347450 ) ( ON ?auto_347448 ?auto_347449 ) ( ON ?auto_347447 ?auto_347448 ) ( ON ?auto_347446 ?auto_347447 ) ( ON ?auto_347445 ?auto_347446 ) ( ON ?auto_347444 ?auto_347445 ) ( ON ?auto_347443 ?auto_347444 ) ( CLEAR ?auto_347441 ) ( ON ?auto_347442 ?auto_347443 ) ( CLEAR ?auto_347442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_347437 ?auto_347438 ?auto_347439 ?auto_347440 ?auto_347441 ?auto_347442 )
      ( MAKE-14PILE ?auto_347437 ?auto_347438 ?auto_347439 ?auto_347440 ?auto_347441 ?auto_347442 ?auto_347443 ?auto_347444 ?auto_347445 ?auto_347446 ?auto_347447 ?auto_347448 ?auto_347449 ?auto_347450 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_347465 - BLOCK
      ?auto_347466 - BLOCK
      ?auto_347467 - BLOCK
      ?auto_347468 - BLOCK
      ?auto_347469 - BLOCK
      ?auto_347470 - BLOCK
      ?auto_347471 - BLOCK
      ?auto_347472 - BLOCK
      ?auto_347473 - BLOCK
      ?auto_347474 - BLOCK
      ?auto_347475 - BLOCK
      ?auto_347476 - BLOCK
      ?auto_347477 - BLOCK
      ?auto_347478 - BLOCK
    )
    :vars
    (
      ?auto_347479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347478 ?auto_347479 ) ( ON-TABLE ?auto_347465 ) ( ON ?auto_347466 ?auto_347465 ) ( ON ?auto_347467 ?auto_347466 ) ( ON ?auto_347468 ?auto_347467 ) ( not ( = ?auto_347465 ?auto_347466 ) ) ( not ( = ?auto_347465 ?auto_347467 ) ) ( not ( = ?auto_347465 ?auto_347468 ) ) ( not ( = ?auto_347465 ?auto_347469 ) ) ( not ( = ?auto_347465 ?auto_347470 ) ) ( not ( = ?auto_347465 ?auto_347471 ) ) ( not ( = ?auto_347465 ?auto_347472 ) ) ( not ( = ?auto_347465 ?auto_347473 ) ) ( not ( = ?auto_347465 ?auto_347474 ) ) ( not ( = ?auto_347465 ?auto_347475 ) ) ( not ( = ?auto_347465 ?auto_347476 ) ) ( not ( = ?auto_347465 ?auto_347477 ) ) ( not ( = ?auto_347465 ?auto_347478 ) ) ( not ( = ?auto_347465 ?auto_347479 ) ) ( not ( = ?auto_347466 ?auto_347467 ) ) ( not ( = ?auto_347466 ?auto_347468 ) ) ( not ( = ?auto_347466 ?auto_347469 ) ) ( not ( = ?auto_347466 ?auto_347470 ) ) ( not ( = ?auto_347466 ?auto_347471 ) ) ( not ( = ?auto_347466 ?auto_347472 ) ) ( not ( = ?auto_347466 ?auto_347473 ) ) ( not ( = ?auto_347466 ?auto_347474 ) ) ( not ( = ?auto_347466 ?auto_347475 ) ) ( not ( = ?auto_347466 ?auto_347476 ) ) ( not ( = ?auto_347466 ?auto_347477 ) ) ( not ( = ?auto_347466 ?auto_347478 ) ) ( not ( = ?auto_347466 ?auto_347479 ) ) ( not ( = ?auto_347467 ?auto_347468 ) ) ( not ( = ?auto_347467 ?auto_347469 ) ) ( not ( = ?auto_347467 ?auto_347470 ) ) ( not ( = ?auto_347467 ?auto_347471 ) ) ( not ( = ?auto_347467 ?auto_347472 ) ) ( not ( = ?auto_347467 ?auto_347473 ) ) ( not ( = ?auto_347467 ?auto_347474 ) ) ( not ( = ?auto_347467 ?auto_347475 ) ) ( not ( = ?auto_347467 ?auto_347476 ) ) ( not ( = ?auto_347467 ?auto_347477 ) ) ( not ( = ?auto_347467 ?auto_347478 ) ) ( not ( = ?auto_347467 ?auto_347479 ) ) ( not ( = ?auto_347468 ?auto_347469 ) ) ( not ( = ?auto_347468 ?auto_347470 ) ) ( not ( = ?auto_347468 ?auto_347471 ) ) ( not ( = ?auto_347468 ?auto_347472 ) ) ( not ( = ?auto_347468 ?auto_347473 ) ) ( not ( = ?auto_347468 ?auto_347474 ) ) ( not ( = ?auto_347468 ?auto_347475 ) ) ( not ( = ?auto_347468 ?auto_347476 ) ) ( not ( = ?auto_347468 ?auto_347477 ) ) ( not ( = ?auto_347468 ?auto_347478 ) ) ( not ( = ?auto_347468 ?auto_347479 ) ) ( not ( = ?auto_347469 ?auto_347470 ) ) ( not ( = ?auto_347469 ?auto_347471 ) ) ( not ( = ?auto_347469 ?auto_347472 ) ) ( not ( = ?auto_347469 ?auto_347473 ) ) ( not ( = ?auto_347469 ?auto_347474 ) ) ( not ( = ?auto_347469 ?auto_347475 ) ) ( not ( = ?auto_347469 ?auto_347476 ) ) ( not ( = ?auto_347469 ?auto_347477 ) ) ( not ( = ?auto_347469 ?auto_347478 ) ) ( not ( = ?auto_347469 ?auto_347479 ) ) ( not ( = ?auto_347470 ?auto_347471 ) ) ( not ( = ?auto_347470 ?auto_347472 ) ) ( not ( = ?auto_347470 ?auto_347473 ) ) ( not ( = ?auto_347470 ?auto_347474 ) ) ( not ( = ?auto_347470 ?auto_347475 ) ) ( not ( = ?auto_347470 ?auto_347476 ) ) ( not ( = ?auto_347470 ?auto_347477 ) ) ( not ( = ?auto_347470 ?auto_347478 ) ) ( not ( = ?auto_347470 ?auto_347479 ) ) ( not ( = ?auto_347471 ?auto_347472 ) ) ( not ( = ?auto_347471 ?auto_347473 ) ) ( not ( = ?auto_347471 ?auto_347474 ) ) ( not ( = ?auto_347471 ?auto_347475 ) ) ( not ( = ?auto_347471 ?auto_347476 ) ) ( not ( = ?auto_347471 ?auto_347477 ) ) ( not ( = ?auto_347471 ?auto_347478 ) ) ( not ( = ?auto_347471 ?auto_347479 ) ) ( not ( = ?auto_347472 ?auto_347473 ) ) ( not ( = ?auto_347472 ?auto_347474 ) ) ( not ( = ?auto_347472 ?auto_347475 ) ) ( not ( = ?auto_347472 ?auto_347476 ) ) ( not ( = ?auto_347472 ?auto_347477 ) ) ( not ( = ?auto_347472 ?auto_347478 ) ) ( not ( = ?auto_347472 ?auto_347479 ) ) ( not ( = ?auto_347473 ?auto_347474 ) ) ( not ( = ?auto_347473 ?auto_347475 ) ) ( not ( = ?auto_347473 ?auto_347476 ) ) ( not ( = ?auto_347473 ?auto_347477 ) ) ( not ( = ?auto_347473 ?auto_347478 ) ) ( not ( = ?auto_347473 ?auto_347479 ) ) ( not ( = ?auto_347474 ?auto_347475 ) ) ( not ( = ?auto_347474 ?auto_347476 ) ) ( not ( = ?auto_347474 ?auto_347477 ) ) ( not ( = ?auto_347474 ?auto_347478 ) ) ( not ( = ?auto_347474 ?auto_347479 ) ) ( not ( = ?auto_347475 ?auto_347476 ) ) ( not ( = ?auto_347475 ?auto_347477 ) ) ( not ( = ?auto_347475 ?auto_347478 ) ) ( not ( = ?auto_347475 ?auto_347479 ) ) ( not ( = ?auto_347476 ?auto_347477 ) ) ( not ( = ?auto_347476 ?auto_347478 ) ) ( not ( = ?auto_347476 ?auto_347479 ) ) ( not ( = ?auto_347477 ?auto_347478 ) ) ( not ( = ?auto_347477 ?auto_347479 ) ) ( not ( = ?auto_347478 ?auto_347479 ) ) ( ON ?auto_347477 ?auto_347478 ) ( ON ?auto_347476 ?auto_347477 ) ( ON ?auto_347475 ?auto_347476 ) ( ON ?auto_347474 ?auto_347475 ) ( ON ?auto_347473 ?auto_347474 ) ( ON ?auto_347472 ?auto_347473 ) ( ON ?auto_347471 ?auto_347472 ) ( ON ?auto_347470 ?auto_347471 ) ( CLEAR ?auto_347468 ) ( ON ?auto_347469 ?auto_347470 ) ( CLEAR ?auto_347469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_347465 ?auto_347466 ?auto_347467 ?auto_347468 ?auto_347469 )
      ( MAKE-14PILE ?auto_347465 ?auto_347466 ?auto_347467 ?auto_347468 ?auto_347469 ?auto_347470 ?auto_347471 ?auto_347472 ?auto_347473 ?auto_347474 ?auto_347475 ?auto_347476 ?auto_347477 ?auto_347478 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_347494 - BLOCK
      ?auto_347495 - BLOCK
      ?auto_347496 - BLOCK
      ?auto_347497 - BLOCK
      ?auto_347498 - BLOCK
      ?auto_347499 - BLOCK
      ?auto_347500 - BLOCK
      ?auto_347501 - BLOCK
      ?auto_347502 - BLOCK
      ?auto_347503 - BLOCK
      ?auto_347504 - BLOCK
      ?auto_347505 - BLOCK
      ?auto_347506 - BLOCK
      ?auto_347507 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_347507 ) ( ON-TABLE ?auto_347494 ) ( ON ?auto_347495 ?auto_347494 ) ( ON ?auto_347496 ?auto_347495 ) ( ON ?auto_347497 ?auto_347496 ) ( not ( = ?auto_347494 ?auto_347495 ) ) ( not ( = ?auto_347494 ?auto_347496 ) ) ( not ( = ?auto_347494 ?auto_347497 ) ) ( not ( = ?auto_347494 ?auto_347498 ) ) ( not ( = ?auto_347494 ?auto_347499 ) ) ( not ( = ?auto_347494 ?auto_347500 ) ) ( not ( = ?auto_347494 ?auto_347501 ) ) ( not ( = ?auto_347494 ?auto_347502 ) ) ( not ( = ?auto_347494 ?auto_347503 ) ) ( not ( = ?auto_347494 ?auto_347504 ) ) ( not ( = ?auto_347494 ?auto_347505 ) ) ( not ( = ?auto_347494 ?auto_347506 ) ) ( not ( = ?auto_347494 ?auto_347507 ) ) ( not ( = ?auto_347495 ?auto_347496 ) ) ( not ( = ?auto_347495 ?auto_347497 ) ) ( not ( = ?auto_347495 ?auto_347498 ) ) ( not ( = ?auto_347495 ?auto_347499 ) ) ( not ( = ?auto_347495 ?auto_347500 ) ) ( not ( = ?auto_347495 ?auto_347501 ) ) ( not ( = ?auto_347495 ?auto_347502 ) ) ( not ( = ?auto_347495 ?auto_347503 ) ) ( not ( = ?auto_347495 ?auto_347504 ) ) ( not ( = ?auto_347495 ?auto_347505 ) ) ( not ( = ?auto_347495 ?auto_347506 ) ) ( not ( = ?auto_347495 ?auto_347507 ) ) ( not ( = ?auto_347496 ?auto_347497 ) ) ( not ( = ?auto_347496 ?auto_347498 ) ) ( not ( = ?auto_347496 ?auto_347499 ) ) ( not ( = ?auto_347496 ?auto_347500 ) ) ( not ( = ?auto_347496 ?auto_347501 ) ) ( not ( = ?auto_347496 ?auto_347502 ) ) ( not ( = ?auto_347496 ?auto_347503 ) ) ( not ( = ?auto_347496 ?auto_347504 ) ) ( not ( = ?auto_347496 ?auto_347505 ) ) ( not ( = ?auto_347496 ?auto_347506 ) ) ( not ( = ?auto_347496 ?auto_347507 ) ) ( not ( = ?auto_347497 ?auto_347498 ) ) ( not ( = ?auto_347497 ?auto_347499 ) ) ( not ( = ?auto_347497 ?auto_347500 ) ) ( not ( = ?auto_347497 ?auto_347501 ) ) ( not ( = ?auto_347497 ?auto_347502 ) ) ( not ( = ?auto_347497 ?auto_347503 ) ) ( not ( = ?auto_347497 ?auto_347504 ) ) ( not ( = ?auto_347497 ?auto_347505 ) ) ( not ( = ?auto_347497 ?auto_347506 ) ) ( not ( = ?auto_347497 ?auto_347507 ) ) ( not ( = ?auto_347498 ?auto_347499 ) ) ( not ( = ?auto_347498 ?auto_347500 ) ) ( not ( = ?auto_347498 ?auto_347501 ) ) ( not ( = ?auto_347498 ?auto_347502 ) ) ( not ( = ?auto_347498 ?auto_347503 ) ) ( not ( = ?auto_347498 ?auto_347504 ) ) ( not ( = ?auto_347498 ?auto_347505 ) ) ( not ( = ?auto_347498 ?auto_347506 ) ) ( not ( = ?auto_347498 ?auto_347507 ) ) ( not ( = ?auto_347499 ?auto_347500 ) ) ( not ( = ?auto_347499 ?auto_347501 ) ) ( not ( = ?auto_347499 ?auto_347502 ) ) ( not ( = ?auto_347499 ?auto_347503 ) ) ( not ( = ?auto_347499 ?auto_347504 ) ) ( not ( = ?auto_347499 ?auto_347505 ) ) ( not ( = ?auto_347499 ?auto_347506 ) ) ( not ( = ?auto_347499 ?auto_347507 ) ) ( not ( = ?auto_347500 ?auto_347501 ) ) ( not ( = ?auto_347500 ?auto_347502 ) ) ( not ( = ?auto_347500 ?auto_347503 ) ) ( not ( = ?auto_347500 ?auto_347504 ) ) ( not ( = ?auto_347500 ?auto_347505 ) ) ( not ( = ?auto_347500 ?auto_347506 ) ) ( not ( = ?auto_347500 ?auto_347507 ) ) ( not ( = ?auto_347501 ?auto_347502 ) ) ( not ( = ?auto_347501 ?auto_347503 ) ) ( not ( = ?auto_347501 ?auto_347504 ) ) ( not ( = ?auto_347501 ?auto_347505 ) ) ( not ( = ?auto_347501 ?auto_347506 ) ) ( not ( = ?auto_347501 ?auto_347507 ) ) ( not ( = ?auto_347502 ?auto_347503 ) ) ( not ( = ?auto_347502 ?auto_347504 ) ) ( not ( = ?auto_347502 ?auto_347505 ) ) ( not ( = ?auto_347502 ?auto_347506 ) ) ( not ( = ?auto_347502 ?auto_347507 ) ) ( not ( = ?auto_347503 ?auto_347504 ) ) ( not ( = ?auto_347503 ?auto_347505 ) ) ( not ( = ?auto_347503 ?auto_347506 ) ) ( not ( = ?auto_347503 ?auto_347507 ) ) ( not ( = ?auto_347504 ?auto_347505 ) ) ( not ( = ?auto_347504 ?auto_347506 ) ) ( not ( = ?auto_347504 ?auto_347507 ) ) ( not ( = ?auto_347505 ?auto_347506 ) ) ( not ( = ?auto_347505 ?auto_347507 ) ) ( not ( = ?auto_347506 ?auto_347507 ) ) ( ON ?auto_347506 ?auto_347507 ) ( ON ?auto_347505 ?auto_347506 ) ( ON ?auto_347504 ?auto_347505 ) ( ON ?auto_347503 ?auto_347504 ) ( ON ?auto_347502 ?auto_347503 ) ( ON ?auto_347501 ?auto_347502 ) ( ON ?auto_347500 ?auto_347501 ) ( ON ?auto_347499 ?auto_347500 ) ( CLEAR ?auto_347497 ) ( ON ?auto_347498 ?auto_347499 ) ( CLEAR ?auto_347498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_347494 ?auto_347495 ?auto_347496 ?auto_347497 ?auto_347498 )
      ( MAKE-14PILE ?auto_347494 ?auto_347495 ?auto_347496 ?auto_347497 ?auto_347498 ?auto_347499 ?auto_347500 ?auto_347501 ?auto_347502 ?auto_347503 ?auto_347504 ?auto_347505 ?auto_347506 ?auto_347507 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_347522 - BLOCK
      ?auto_347523 - BLOCK
      ?auto_347524 - BLOCK
      ?auto_347525 - BLOCK
      ?auto_347526 - BLOCK
      ?auto_347527 - BLOCK
      ?auto_347528 - BLOCK
      ?auto_347529 - BLOCK
      ?auto_347530 - BLOCK
      ?auto_347531 - BLOCK
      ?auto_347532 - BLOCK
      ?auto_347533 - BLOCK
      ?auto_347534 - BLOCK
      ?auto_347535 - BLOCK
    )
    :vars
    (
      ?auto_347536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347535 ?auto_347536 ) ( ON-TABLE ?auto_347522 ) ( ON ?auto_347523 ?auto_347522 ) ( ON ?auto_347524 ?auto_347523 ) ( not ( = ?auto_347522 ?auto_347523 ) ) ( not ( = ?auto_347522 ?auto_347524 ) ) ( not ( = ?auto_347522 ?auto_347525 ) ) ( not ( = ?auto_347522 ?auto_347526 ) ) ( not ( = ?auto_347522 ?auto_347527 ) ) ( not ( = ?auto_347522 ?auto_347528 ) ) ( not ( = ?auto_347522 ?auto_347529 ) ) ( not ( = ?auto_347522 ?auto_347530 ) ) ( not ( = ?auto_347522 ?auto_347531 ) ) ( not ( = ?auto_347522 ?auto_347532 ) ) ( not ( = ?auto_347522 ?auto_347533 ) ) ( not ( = ?auto_347522 ?auto_347534 ) ) ( not ( = ?auto_347522 ?auto_347535 ) ) ( not ( = ?auto_347522 ?auto_347536 ) ) ( not ( = ?auto_347523 ?auto_347524 ) ) ( not ( = ?auto_347523 ?auto_347525 ) ) ( not ( = ?auto_347523 ?auto_347526 ) ) ( not ( = ?auto_347523 ?auto_347527 ) ) ( not ( = ?auto_347523 ?auto_347528 ) ) ( not ( = ?auto_347523 ?auto_347529 ) ) ( not ( = ?auto_347523 ?auto_347530 ) ) ( not ( = ?auto_347523 ?auto_347531 ) ) ( not ( = ?auto_347523 ?auto_347532 ) ) ( not ( = ?auto_347523 ?auto_347533 ) ) ( not ( = ?auto_347523 ?auto_347534 ) ) ( not ( = ?auto_347523 ?auto_347535 ) ) ( not ( = ?auto_347523 ?auto_347536 ) ) ( not ( = ?auto_347524 ?auto_347525 ) ) ( not ( = ?auto_347524 ?auto_347526 ) ) ( not ( = ?auto_347524 ?auto_347527 ) ) ( not ( = ?auto_347524 ?auto_347528 ) ) ( not ( = ?auto_347524 ?auto_347529 ) ) ( not ( = ?auto_347524 ?auto_347530 ) ) ( not ( = ?auto_347524 ?auto_347531 ) ) ( not ( = ?auto_347524 ?auto_347532 ) ) ( not ( = ?auto_347524 ?auto_347533 ) ) ( not ( = ?auto_347524 ?auto_347534 ) ) ( not ( = ?auto_347524 ?auto_347535 ) ) ( not ( = ?auto_347524 ?auto_347536 ) ) ( not ( = ?auto_347525 ?auto_347526 ) ) ( not ( = ?auto_347525 ?auto_347527 ) ) ( not ( = ?auto_347525 ?auto_347528 ) ) ( not ( = ?auto_347525 ?auto_347529 ) ) ( not ( = ?auto_347525 ?auto_347530 ) ) ( not ( = ?auto_347525 ?auto_347531 ) ) ( not ( = ?auto_347525 ?auto_347532 ) ) ( not ( = ?auto_347525 ?auto_347533 ) ) ( not ( = ?auto_347525 ?auto_347534 ) ) ( not ( = ?auto_347525 ?auto_347535 ) ) ( not ( = ?auto_347525 ?auto_347536 ) ) ( not ( = ?auto_347526 ?auto_347527 ) ) ( not ( = ?auto_347526 ?auto_347528 ) ) ( not ( = ?auto_347526 ?auto_347529 ) ) ( not ( = ?auto_347526 ?auto_347530 ) ) ( not ( = ?auto_347526 ?auto_347531 ) ) ( not ( = ?auto_347526 ?auto_347532 ) ) ( not ( = ?auto_347526 ?auto_347533 ) ) ( not ( = ?auto_347526 ?auto_347534 ) ) ( not ( = ?auto_347526 ?auto_347535 ) ) ( not ( = ?auto_347526 ?auto_347536 ) ) ( not ( = ?auto_347527 ?auto_347528 ) ) ( not ( = ?auto_347527 ?auto_347529 ) ) ( not ( = ?auto_347527 ?auto_347530 ) ) ( not ( = ?auto_347527 ?auto_347531 ) ) ( not ( = ?auto_347527 ?auto_347532 ) ) ( not ( = ?auto_347527 ?auto_347533 ) ) ( not ( = ?auto_347527 ?auto_347534 ) ) ( not ( = ?auto_347527 ?auto_347535 ) ) ( not ( = ?auto_347527 ?auto_347536 ) ) ( not ( = ?auto_347528 ?auto_347529 ) ) ( not ( = ?auto_347528 ?auto_347530 ) ) ( not ( = ?auto_347528 ?auto_347531 ) ) ( not ( = ?auto_347528 ?auto_347532 ) ) ( not ( = ?auto_347528 ?auto_347533 ) ) ( not ( = ?auto_347528 ?auto_347534 ) ) ( not ( = ?auto_347528 ?auto_347535 ) ) ( not ( = ?auto_347528 ?auto_347536 ) ) ( not ( = ?auto_347529 ?auto_347530 ) ) ( not ( = ?auto_347529 ?auto_347531 ) ) ( not ( = ?auto_347529 ?auto_347532 ) ) ( not ( = ?auto_347529 ?auto_347533 ) ) ( not ( = ?auto_347529 ?auto_347534 ) ) ( not ( = ?auto_347529 ?auto_347535 ) ) ( not ( = ?auto_347529 ?auto_347536 ) ) ( not ( = ?auto_347530 ?auto_347531 ) ) ( not ( = ?auto_347530 ?auto_347532 ) ) ( not ( = ?auto_347530 ?auto_347533 ) ) ( not ( = ?auto_347530 ?auto_347534 ) ) ( not ( = ?auto_347530 ?auto_347535 ) ) ( not ( = ?auto_347530 ?auto_347536 ) ) ( not ( = ?auto_347531 ?auto_347532 ) ) ( not ( = ?auto_347531 ?auto_347533 ) ) ( not ( = ?auto_347531 ?auto_347534 ) ) ( not ( = ?auto_347531 ?auto_347535 ) ) ( not ( = ?auto_347531 ?auto_347536 ) ) ( not ( = ?auto_347532 ?auto_347533 ) ) ( not ( = ?auto_347532 ?auto_347534 ) ) ( not ( = ?auto_347532 ?auto_347535 ) ) ( not ( = ?auto_347532 ?auto_347536 ) ) ( not ( = ?auto_347533 ?auto_347534 ) ) ( not ( = ?auto_347533 ?auto_347535 ) ) ( not ( = ?auto_347533 ?auto_347536 ) ) ( not ( = ?auto_347534 ?auto_347535 ) ) ( not ( = ?auto_347534 ?auto_347536 ) ) ( not ( = ?auto_347535 ?auto_347536 ) ) ( ON ?auto_347534 ?auto_347535 ) ( ON ?auto_347533 ?auto_347534 ) ( ON ?auto_347532 ?auto_347533 ) ( ON ?auto_347531 ?auto_347532 ) ( ON ?auto_347530 ?auto_347531 ) ( ON ?auto_347529 ?auto_347530 ) ( ON ?auto_347528 ?auto_347529 ) ( ON ?auto_347527 ?auto_347528 ) ( ON ?auto_347526 ?auto_347527 ) ( CLEAR ?auto_347524 ) ( ON ?auto_347525 ?auto_347526 ) ( CLEAR ?auto_347525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_347522 ?auto_347523 ?auto_347524 ?auto_347525 )
      ( MAKE-14PILE ?auto_347522 ?auto_347523 ?auto_347524 ?auto_347525 ?auto_347526 ?auto_347527 ?auto_347528 ?auto_347529 ?auto_347530 ?auto_347531 ?auto_347532 ?auto_347533 ?auto_347534 ?auto_347535 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_347551 - BLOCK
      ?auto_347552 - BLOCK
      ?auto_347553 - BLOCK
      ?auto_347554 - BLOCK
      ?auto_347555 - BLOCK
      ?auto_347556 - BLOCK
      ?auto_347557 - BLOCK
      ?auto_347558 - BLOCK
      ?auto_347559 - BLOCK
      ?auto_347560 - BLOCK
      ?auto_347561 - BLOCK
      ?auto_347562 - BLOCK
      ?auto_347563 - BLOCK
      ?auto_347564 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_347564 ) ( ON-TABLE ?auto_347551 ) ( ON ?auto_347552 ?auto_347551 ) ( ON ?auto_347553 ?auto_347552 ) ( not ( = ?auto_347551 ?auto_347552 ) ) ( not ( = ?auto_347551 ?auto_347553 ) ) ( not ( = ?auto_347551 ?auto_347554 ) ) ( not ( = ?auto_347551 ?auto_347555 ) ) ( not ( = ?auto_347551 ?auto_347556 ) ) ( not ( = ?auto_347551 ?auto_347557 ) ) ( not ( = ?auto_347551 ?auto_347558 ) ) ( not ( = ?auto_347551 ?auto_347559 ) ) ( not ( = ?auto_347551 ?auto_347560 ) ) ( not ( = ?auto_347551 ?auto_347561 ) ) ( not ( = ?auto_347551 ?auto_347562 ) ) ( not ( = ?auto_347551 ?auto_347563 ) ) ( not ( = ?auto_347551 ?auto_347564 ) ) ( not ( = ?auto_347552 ?auto_347553 ) ) ( not ( = ?auto_347552 ?auto_347554 ) ) ( not ( = ?auto_347552 ?auto_347555 ) ) ( not ( = ?auto_347552 ?auto_347556 ) ) ( not ( = ?auto_347552 ?auto_347557 ) ) ( not ( = ?auto_347552 ?auto_347558 ) ) ( not ( = ?auto_347552 ?auto_347559 ) ) ( not ( = ?auto_347552 ?auto_347560 ) ) ( not ( = ?auto_347552 ?auto_347561 ) ) ( not ( = ?auto_347552 ?auto_347562 ) ) ( not ( = ?auto_347552 ?auto_347563 ) ) ( not ( = ?auto_347552 ?auto_347564 ) ) ( not ( = ?auto_347553 ?auto_347554 ) ) ( not ( = ?auto_347553 ?auto_347555 ) ) ( not ( = ?auto_347553 ?auto_347556 ) ) ( not ( = ?auto_347553 ?auto_347557 ) ) ( not ( = ?auto_347553 ?auto_347558 ) ) ( not ( = ?auto_347553 ?auto_347559 ) ) ( not ( = ?auto_347553 ?auto_347560 ) ) ( not ( = ?auto_347553 ?auto_347561 ) ) ( not ( = ?auto_347553 ?auto_347562 ) ) ( not ( = ?auto_347553 ?auto_347563 ) ) ( not ( = ?auto_347553 ?auto_347564 ) ) ( not ( = ?auto_347554 ?auto_347555 ) ) ( not ( = ?auto_347554 ?auto_347556 ) ) ( not ( = ?auto_347554 ?auto_347557 ) ) ( not ( = ?auto_347554 ?auto_347558 ) ) ( not ( = ?auto_347554 ?auto_347559 ) ) ( not ( = ?auto_347554 ?auto_347560 ) ) ( not ( = ?auto_347554 ?auto_347561 ) ) ( not ( = ?auto_347554 ?auto_347562 ) ) ( not ( = ?auto_347554 ?auto_347563 ) ) ( not ( = ?auto_347554 ?auto_347564 ) ) ( not ( = ?auto_347555 ?auto_347556 ) ) ( not ( = ?auto_347555 ?auto_347557 ) ) ( not ( = ?auto_347555 ?auto_347558 ) ) ( not ( = ?auto_347555 ?auto_347559 ) ) ( not ( = ?auto_347555 ?auto_347560 ) ) ( not ( = ?auto_347555 ?auto_347561 ) ) ( not ( = ?auto_347555 ?auto_347562 ) ) ( not ( = ?auto_347555 ?auto_347563 ) ) ( not ( = ?auto_347555 ?auto_347564 ) ) ( not ( = ?auto_347556 ?auto_347557 ) ) ( not ( = ?auto_347556 ?auto_347558 ) ) ( not ( = ?auto_347556 ?auto_347559 ) ) ( not ( = ?auto_347556 ?auto_347560 ) ) ( not ( = ?auto_347556 ?auto_347561 ) ) ( not ( = ?auto_347556 ?auto_347562 ) ) ( not ( = ?auto_347556 ?auto_347563 ) ) ( not ( = ?auto_347556 ?auto_347564 ) ) ( not ( = ?auto_347557 ?auto_347558 ) ) ( not ( = ?auto_347557 ?auto_347559 ) ) ( not ( = ?auto_347557 ?auto_347560 ) ) ( not ( = ?auto_347557 ?auto_347561 ) ) ( not ( = ?auto_347557 ?auto_347562 ) ) ( not ( = ?auto_347557 ?auto_347563 ) ) ( not ( = ?auto_347557 ?auto_347564 ) ) ( not ( = ?auto_347558 ?auto_347559 ) ) ( not ( = ?auto_347558 ?auto_347560 ) ) ( not ( = ?auto_347558 ?auto_347561 ) ) ( not ( = ?auto_347558 ?auto_347562 ) ) ( not ( = ?auto_347558 ?auto_347563 ) ) ( not ( = ?auto_347558 ?auto_347564 ) ) ( not ( = ?auto_347559 ?auto_347560 ) ) ( not ( = ?auto_347559 ?auto_347561 ) ) ( not ( = ?auto_347559 ?auto_347562 ) ) ( not ( = ?auto_347559 ?auto_347563 ) ) ( not ( = ?auto_347559 ?auto_347564 ) ) ( not ( = ?auto_347560 ?auto_347561 ) ) ( not ( = ?auto_347560 ?auto_347562 ) ) ( not ( = ?auto_347560 ?auto_347563 ) ) ( not ( = ?auto_347560 ?auto_347564 ) ) ( not ( = ?auto_347561 ?auto_347562 ) ) ( not ( = ?auto_347561 ?auto_347563 ) ) ( not ( = ?auto_347561 ?auto_347564 ) ) ( not ( = ?auto_347562 ?auto_347563 ) ) ( not ( = ?auto_347562 ?auto_347564 ) ) ( not ( = ?auto_347563 ?auto_347564 ) ) ( ON ?auto_347563 ?auto_347564 ) ( ON ?auto_347562 ?auto_347563 ) ( ON ?auto_347561 ?auto_347562 ) ( ON ?auto_347560 ?auto_347561 ) ( ON ?auto_347559 ?auto_347560 ) ( ON ?auto_347558 ?auto_347559 ) ( ON ?auto_347557 ?auto_347558 ) ( ON ?auto_347556 ?auto_347557 ) ( ON ?auto_347555 ?auto_347556 ) ( CLEAR ?auto_347553 ) ( ON ?auto_347554 ?auto_347555 ) ( CLEAR ?auto_347554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_347551 ?auto_347552 ?auto_347553 ?auto_347554 )
      ( MAKE-14PILE ?auto_347551 ?auto_347552 ?auto_347553 ?auto_347554 ?auto_347555 ?auto_347556 ?auto_347557 ?auto_347558 ?auto_347559 ?auto_347560 ?auto_347561 ?auto_347562 ?auto_347563 ?auto_347564 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_347579 - BLOCK
      ?auto_347580 - BLOCK
      ?auto_347581 - BLOCK
      ?auto_347582 - BLOCK
      ?auto_347583 - BLOCK
      ?auto_347584 - BLOCK
      ?auto_347585 - BLOCK
      ?auto_347586 - BLOCK
      ?auto_347587 - BLOCK
      ?auto_347588 - BLOCK
      ?auto_347589 - BLOCK
      ?auto_347590 - BLOCK
      ?auto_347591 - BLOCK
      ?auto_347592 - BLOCK
    )
    :vars
    (
      ?auto_347593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347592 ?auto_347593 ) ( ON-TABLE ?auto_347579 ) ( ON ?auto_347580 ?auto_347579 ) ( not ( = ?auto_347579 ?auto_347580 ) ) ( not ( = ?auto_347579 ?auto_347581 ) ) ( not ( = ?auto_347579 ?auto_347582 ) ) ( not ( = ?auto_347579 ?auto_347583 ) ) ( not ( = ?auto_347579 ?auto_347584 ) ) ( not ( = ?auto_347579 ?auto_347585 ) ) ( not ( = ?auto_347579 ?auto_347586 ) ) ( not ( = ?auto_347579 ?auto_347587 ) ) ( not ( = ?auto_347579 ?auto_347588 ) ) ( not ( = ?auto_347579 ?auto_347589 ) ) ( not ( = ?auto_347579 ?auto_347590 ) ) ( not ( = ?auto_347579 ?auto_347591 ) ) ( not ( = ?auto_347579 ?auto_347592 ) ) ( not ( = ?auto_347579 ?auto_347593 ) ) ( not ( = ?auto_347580 ?auto_347581 ) ) ( not ( = ?auto_347580 ?auto_347582 ) ) ( not ( = ?auto_347580 ?auto_347583 ) ) ( not ( = ?auto_347580 ?auto_347584 ) ) ( not ( = ?auto_347580 ?auto_347585 ) ) ( not ( = ?auto_347580 ?auto_347586 ) ) ( not ( = ?auto_347580 ?auto_347587 ) ) ( not ( = ?auto_347580 ?auto_347588 ) ) ( not ( = ?auto_347580 ?auto_347589 ) ) ( not ( = ?auto_347580 ?auto_347590 ) ) ( not ( = ?auto_347580 ?auto_347591 ) ) ( not ( = ?auto_347580 ?auto_347592 ) ) ( not ( = ?auto_347580 ?auto_347593 ) ) ( not ( = ?auto_347581 ?auto_347582 ) ) ( not ( = ?auto_347581 ?auto_347583 ) ) ( not ( = ?auto_347581 ?auto_347584 ) ) ( not ( = ?auto_347581 ?auto_347585 ) ) ( not ( = ?auto_347581 ?auto_347586 ) ) ( not ( = ?auto_347581 ?auto_347587 ) ) ( not ( = ?auto_347581 ?auto_347588 ) ) ( not ( = ?auto_347581 ?auto_347589 ) ) ( not ( = ?auto_347581 ?auto_347590 ) ) ( not ( = ?auto_347581 ?auto_347591 ) ) ( not ( = ?auto_347581 ?auto_347592 ) ) ( not ( = ?auto_347581 ?auto_347593 ) ) ( not ( = ?auto_347582 ?auto_347583 ) ) ( not ( = ?auto_347582 ?auto_347584 ) ) ( not ( = ?auto_347582 ?auto_347585 ) ) ( not ( = ?auto_347582 ?auto_347586 ) ) ( not ( = ?auto_347582 ?auto_347587 ) ) ( not ( = ?auto_347582 ?auto_347588 ) ) ( not ( = ?auto_347582 ?auto_347589 ) ) ( not ( = ?auto_347582 ?auto_347590 ) ) ( not ( = ?auto_347582 ?auto_347591 ) ) ( not ( = ?auto_347582 ?auto_347592 ) ) ( not ( = ?auto_347582 ?auto_347593 ) ) ( not ( = ?auto_347583 ?auto_347584 ) ) ( not ( = ?auto_347583 ?auto_347585 ) ) ( not ( = ?auto_347583 ?auto_347586 ) ) ( not ( = ?auto_347583 ?auto_347587 ) ) ( not ( = ?auto_347583 ?auto_347588 ) ) ( not ( = ?auto_347583 ?auto_347589 ) ) ( not ( = ?auto_347583 ?auto_347590 ) ) ( not ( = ?auto_347583 ?auto_347591 ) ) ( not ( = ?auto_347583 ?auto_347592 ) ) ( not ( = ?auto_347583 ?auto_347593 ) ) ( not ( = ?auto_347584 ?auto_347585 ) ) ( not ( = ?auto_347584 ?auto_347586 ) ) ( not ( = ?auto_347584 ?auto_347587 ) ) ( not ( = ?auto_347584 ?auto_347588 ) ) ( not ( = ?auto_347584 ?auto_347589 ) ) ( not ( = ?auto_347584 ?auto_347590 ) ) ( not ( = ?auto_347584 ?auto_347591 ) ) ( not ( = ?auto_347584 ?auto_347592 ) ) ( not ( = ?auto_347584 ?auto_347593 ) ) ( not ( = ?auto_347585 ?auto_347586 ) ) ( not ( = ?auto_347585 ?auto_347587 ) ) ( not ( = ?auto_347585 ?auto_347588 ) ) ( not ( = ?auto_347585 ?auto_347589 ) ) ( not ( = ?auto_347585 ?auto_347590 ) ) ( not ( = ?auto_347585 ?auto_347591 ) ) ( not ( = ?auto_347585 ?auto_347592 ) ) ( not ( = ?auto_347585 ?auto_347593 ) ) ( not ( = ?auto_347586 ?auto_347587 ) ) ( not ( = ?auto_347586 ?auto_347588 ) ) ( not ( = ?auto_347586 ?auto_347589 ) ) ( not ( = ?auto_347586 ?auto_347590 ) ) ( not ( = ?auto_347586 ?auto_347591 ) ) ( not ( = ?auto_347586 ?auto_347592 ) ) ( not ( = ?auto_347586 ?auto_347593 ) ) ( not ( = ?auto_347587 ?auto_347588 ) ) ( not ( = ?auto_347587 ?auto_347589 ) ) ( not ( = ?auto_347587 ?auto_347590 ) ) ( not ( = ?auto_347587 ?auto_347591 ) ) ( not ( = ?auto_347587 ?auto_347592 ) ) ( not ( = ?auto_347587 ?auto_347593 ) ) ( not ( = ?auto_347588 ?auto_347589 ) ) ( not ( = ?auto_347588 ?auto_347590 ) ) ( not ( = ?auto_347588 ?auto_347591 ) ) ( not ( = ?auto_347588 ?auto_347592 ) ) ( not ( = ?auto_347588 ?auto_347593 ) ) ( not ( = ?auto_347589 ?auto_347590 ) ) ( not ( = ?auto_347589 ?auto_347591 ) ) ( not ( = ?auto_347589 ?auto_347592 ) ) ( not ( = ?auto_347589 ?auto_347593 ) ) ( not ( = ?auto_347590 ?auto_347591 ) ) ( not ( = ?auto_347590 ?auto_347592 ) ) ( not ( = ?auto_347590 ?auto_347593 ) ) ( not ( = ?auto_347591 ?auto_347592 ) ) ( not ( = ?auto_347591 ?auto_347593 ) ) ( not ( = ?auto_347592 ?auto_347593 ) ) ( ON ?auto_347591 ?auto_347592 ) ( ON ?auto_347590 ?auto_347591 ) ( ON ?auto_347589 ?auto_347590 ) ( ON ?auto_347588 ?auto_347589 ) ( ON ?auto_347587 ?auto_347588 ) ( ON ?auto_347586 ?auto_347587 ) ( ON ?auto_347585 ?auto_347586 ) ( ON ?auto_347584 ?auto_347585 ) ( ON ?auto_347583 ?auto_347584 ) ( ON ?auto_347582 ?auto_347583 ) ( CLEAR ?auto_347580 ) ( ON ?auto_347581 ?auto_347582 ) ( CLEAR ?auto_347581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_347579 ?auto_347580 ?auto_347581 )
      ( MAKE-14PILE ?auto_347579 ?auto_347580 ?auto_347581 ?auto_347582 ?auto_347583 ?auto_347584 ?auto_347585 ?auto_347586 ?auto_347587 ?auto_347588 ?auto_347589 ?auto_347590 ?auto_347591 ?auto_347592 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_347608 - BLOCK
      ?auto_347609 - BLOCK
      ?auto_347610 - BLOCK
      ?auto_347611 - BLOCK
      ?auto_347612 - BLOCK
      ?auto_347613 - BLOCK
      ?auto_347614 - BLOCK
      ?auto_347615 - BLOCK
      ?auto_347616 - BLOCK
      ?auto_347617 - BLOCK
      ?auto_347618 - BLOCK
      ?auto_347619 - BLOCK
      ?auto_347620 - BLOCK
      ?auto_347621 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_347621 ) ( ON-TABLE ?auto_347608 ) ( ON ?auto_347609 ?auto_347608 ) ( not ( = ?auto_347608 ?auto_347609 ) ) ( not ( = ?auto_347608 ?auto_347610 ) ) ( not ( = ?auto_347608 ?auto_347611 ) ) ( not ( = ?auto_347608 ?auto_347612 ) ) ( not ( = ?auto_347608 ?auto_347613 ) ) ( not ( = ?auto_347608 ?auto_347614 ) ) ( not ( = ?auto_347608 ?auto_347615 ) ) ( not ( = ?auto_347608 ?auto_347616 ) ) ( not ( = ?auto_347608 ?auto_347617 ) ) ( not ( = ?auto_347608 ?auto_347618 ) ) ( not ( = ?auto_347608 ?auto_347619 ) ) ( not ( = ?auto_347608 ?auto_347620 ) ) ( not ( = ?auto_347608 ?auto_347621 ) ) ( not ( = ?auto_347609 ?auto_347610 ) ) ( not ( = ?auto_347609 ?auto_347611 ) ) ( not ( = ?auto_347609 ?auto_347612 ) ) ( not ( = ?auto_347609 ?auto_347613 ) ) ( not ( = ?auto_347609 ?auto_347614 ) ) ( not ( = ?auto_347609 ?auto_347615 ) ) ( not ( = ?auto_347609 ?auto_347616 ) ) ( not ( = ?auto_347609 ?auto_347617 ) ) ( not ( = ?auto_347609 ?auto_347618 ) ) ( not ( = ?auto_347609 ?auto_347619 ) ) ( not ( = ?auto_347609 ?auto_347620 ) ) ( not ( = ?auto_347609 ?auto_347621 ) ) ( not ( = ?auto_347610 ?auto_347611 ) ) ( not ( = ?auto_347610 ?auto_347612 ) ) ( not ( = ?auto_347610 ?auto_347613 ) ) ( not ( = ?auto_347610 ?auto_347614 ) ) ( not ( = ?auto_347610 ?auto_347615 ) ) ( not ( = ?auto_347610 ?auto_347616 ) ) ( not ( = ?auto_347610 ?auto_347617 ) ) ( not ( = ?auto_347610 ?auto_347618 ) ) ( not ( = ?auto_347610 ?auto_347619 ) ) ( not ( = ?auto_347610 ?auto_347620 ) ) ( not ( = ?auto_347610 ?auto_347621 ) ) ( not ( = ?auto_347611 ?auto_347612 ) ) ( not ( = ?auto_347611 ?auto_347613 ) ) ( not ( = ?auto_347611 ?auto_347614 ) ) ( not ( = ?auto_347611 ?auto_347615 ) ) ( not ( = ?auto_347611 ?auto_347616 ) ) ( not ( = ?auto_347611 ?auto_347617 ) ) ( not ( = ?auto_347611 ?auto_347618 ) ) ( not ( = ?auto_347611 ?auto_347619 ) ) ( not ( = ?auto_347611 ?auto_347620 ) ) ( not ( = ?auto_347611 ?auto_347621 ) ) ( not ( = ?auto_347612 ?auto_347613 ) ) ( not ( = ?auto_347612 ?auto_347614 ) ) ( not ( = ?auto_347612 ?auto_347615 ) ) ( not ( = ?auto_347612 ?auto_347616 ) ) ( not ( = ?auto_347612 ?auto_347617 ) ) ( not ( = ?auto_347612 ?auto_347618 ) ) ( not ( = ?auto_347612 ?auto_347619 ) ) ( not ( = ?auto_347612 ?auto_347620 ) ) ( not ( = ?auto_347612 ?auto_347621 ) ) ( not ( = ?auto_347613 ?auto_347614 ) ) ( not ( = ?auto_347613 ?auto_347615 ) ) ( not ( = ?auto_347613 ?auto_347616 ) ) ( not ( = ?auto_347613 ?auto_347617 ) ) ( not ( = ?auto_347613 ?auto_347618 ) ) ( not ( = ?auto_347613 ?auto_347619 ) ) ( not ( = ?auto_347613 ?auto_347620 ) ) ( not ( = ?auto_347613 ?auto_347621 ) ) ( not ( = ?auto_347614 ?auto_347615 ) ) ( not ( = ?auto_347614 ?auto_347616 ) ) ( not ( = ?auto_347614 ?auto_347617 ) ) ( not ( = ?auto_347614 ?auto_347618 ) ) ( not ( = ?auto_347614 ?auto_347619 ) ) ( not ( = ?auto_347614 ?auto_347620 ) ) ( not ( = ?auto_347614 ?auto_347621 ) ) ( not ( = ?auto_347615 ?auto_347616 ) ) ( not ( = ?auto_347615 ?auto_347617 ) ) ( not ( = ?auto_347615 ?auto_347618 ) ) ( not ( = ?auto_347615 ?auto_347619 ) ) ( not ( = ?auto_347615 ?auto_347620 ) ) ( not ( = ?auto_347615 ?auto_347621 ) ) ( not ( = ?auto_347616 ?auto_347617 ) ) ( not ( = ?auto_347616 ?auto_347618 ) ) ( not ( = ?auto_347616 ?auto_347619 ) ) ( not ( = ?auto_347616 ?auto_347620 ) ) ( not ( = ?auto_347616 ?auto_347621 ) ) ( not ( = ?auto_347617 ?auto_347618 ) ) ( not ( = ?auto_347617 ?auto_347619 ) ) ( not ( = ?auto_347617 ?auto_347620 ) ) ( not ( = ?auto_347617 ?auto_347621 ) ) ( not ( = ?auto_347618 ?auto_347619 ) ) ( not ( = ?auto_347618 ?auto_347620 ) ) ( not ( = ?auto_347618 ?auto_347621 ) ) ( not ( = ?auto_347619 ?auto_347620 ) ) ( not ( = ?auto_347619 ?auto_347621 ) ) ( not ( = ?auto_347620 ?auto_347621 ) ) ( ON ?auto_347620 ?auto_347621 ) ( ON ?auto_347619 ?auto_347620 ) ( ON ?auto_347618 ?auto_347619 ) ( ON ?auto_347617 ?auto_347618 ) ( ON ?auto_347616 ?auto_347617 ) ( ON ?auto_347615 ?auto_347616 ) ( ON ?auto_347614 ?auto_347615 ) ( ON ?auto_347613 ?auto_347614 ) ( ON ?auto_347612 ?auto_347613 ) ( ON ?auto_347611 ?auto_347612 ) ( CLEAR ?auto_347609 ) ( ON ?auto_347610 ?auto_347611 ) ( CLEAR ?auto_347610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_347608 ?auto_347609 ?auto_347610 )
      ( MAKE-14PILE ?auto_347608 ?auto_347609 ?auto_347610 ?auto_347611 ?auto_347612 ?auto_347613 ?auto_347614 ?auto_347615 ?auto_347616 ?auto_347617 ?auto_347618 ?auto_347619 ?auto_347620 ?auto_347621 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_347636 - BLOCK
      ?auto_347637 - BLOCK
      ?auto_347638 - BLOCK
      ?auto_347639 - BLOCK
      ?auto_347640 - BLOCK
      ?auto_347641 - BLOCK
      ?auto_347642 - BLOCK
      ?auto_347643 - BLOCK
      ?auto_347644 - BLOCK
      ?auto_347645 - BLOCK
      ?auto_347646 - BLOCK
      ?auto_347647 - BLOCK
      ?auto_347648 - BLOCK
      ?auto_347649 - BLOCK
    )
    :vars
    (
      ?auto_347650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347649 ?auto_347650 ) ( ON-TABLE ?auto_347636 ) ( not ( = ?auto_347636 ?auto_347637 ) ) ( not ( = ?auto_347636 ?auto_347638 ) ) ( not ( = ?auto_347636 ?auto_347639 ) ) ( not ( = ?auto_347636 ?auto_347640 ) ) ( not ( = ?auto_347636 ?auto_347641 ) ) ( not ( = ?auto_347636 ?auto_347642 ) ) ( not ( = ?auto_347636 ?auto_347643 ) ) ( not ( = ?auto_347636 ?auto_347644 ) ) ( not ( = ?auto_347636 ?auto_347645 ) ) ( not ( = ?auto_347636 ?auto_347646 ) ) ( not ( = ?auto_347636 ?auto_347647 ) ) ( not ( = ?auto_347636 ?auto_347648 ) ) ( not ( = ?auto_347636 ?auto_347649 ) ) ( not ( = ?auto_347636 ?auto_347650 ) ) ( not ( = ?auto_347637 ?auto_347638 ) ) ( not ( = ?auto_347637 ?auto_347639 ) ) ( not ( = ?auto_347637 ?auto_347640 ) ) ( not ( = ?auto_347637 ?auto_347641 ) ) ( not ( = ?auto_347637 ?auto_347642 ) ) ( not ( = ?auto_347637 ?auto_347643 ) ) ( not ( = ?auto_347637 ?auto_347644 ) ) ( not ( = ?auto_347637 ?auto_347645 ) ) ( not ( = ?auto_347637 ?auto_347646 ) ) ( not ( = ?auto_347637 ?auto_347647 ) ) ( not ( = ?auto_347637 ?auto_347648 ) ) ( not ( = ?auto_347637 ?auto_347649 ) ) ( not ( = ?auto_347637 ?auto_347650 ) ) ( not ( = ?auto_347638 ?auto_347639 ) ) ( not ( = ?auto_347638 ?auto_347640 ) ) ( not ( = ?auto_347638 ?auto_347641 ) ) ( not ( = ?auto_347638 ?auto_347642 ) ) ( not ( = ?auto_347638 ?auto_347643 ) ) ( not ( = ?auto_347638 ?auto_347644 ) ) ( not ( = ?auto_347638 ?auto_347645 ) ) ( not ( = ?auto_347638 ?auto_347646 ) ) ( not ( = ?auto_347638 ?auto_347647 ) ) ( not ( = ?auto_347638 ?auto_347648 ) ) ( not ( = ?auto_347638 ?auto_347649 ) ) ( not ( = ?auto_347638 ?auto_347650 ) ) ( not ( = ?auto_347639 ?auto_347640 ) ) ( not ( = ?auto_347639 ?auto_347641 ) ) ( not ( = ?auto_347639 ?auto_347642 ) ) ( not ( = ?auto_347639 ?auto_347643 ) ) ( not ( = ?auto_347639 ?auto_347644 ) ) ( not ( = ?auto_347639 ?auto_347645 ) ) ( not ( = ?auto_347639 ?auto_347646 ) ) ( not ( = ?auto_347639 ?auto_347647 ) ) ( not ( = ?auto_347639 ?auto_347648 ) ) ( not ( = ?auto_347639 ?auto_347649 ) ) ( not ( = ?auto_347639 ?auto_347650 ) ) ( not ( = ?auto_347640 ?auto_347641 ) ) ( not ( = ?auto_347640 ?auto_347642 ) ) ( not ( = ?auto_347640 ?auto_347643 ) ) ( not ( = ?auto_347640 ?auto_347644 ) ) ( not ( = ?auto_347640 ?auto_347645 ) ) ( not ( = ?auto_347640 ?auto_347646 ) ) ( not ( = ?auto_347640 ?auto_347647 ) ) ( not ( = ?auto_347640 ?auto_347648 ) ) ( not ( = ?auto_347640 ?auto_347649 ) ) ( not ( = ?auto_347640 ?auto_347650 ) ) ( not ( = ?auto_347641 ?auto_347642 ) ) ( not ( = ?auto_347641 ?auto_347643 ) ) ( not ( = ?auto_347641 ?auto_347644 ) ) ( not ( = ?auto_347641 ?auto_347645 ) ) ( not ( = ?auto_347641 ?auto_347646 ) ) ( not ( = ?auto_347641 ?auto_347647 ) ) ( not ( = ?auto_347641 ?auto_347648 ) ) ( not ( = ?auto_347641 ?auto_347649 ) ) ( not ( = ?auto_347641 ?auto_347650 ) ) ( not ( = ?auto_347642 ?auto_347643 ) ) ( not ( = ?auto_347642 ?auto_347644 ) ) ( not ( = ?auto_347642 ?auto_347645 ) ) ( not ( = ?auto_347642 ?auto_347646 ) ) ( not ( = ?auto_347642 ?auto_347647 ) ) ( not ( = ?auto_347642 ?auto_347648 ) ) ( not ( = ?auto_347642 ?auto_347649 ) ) ( not ( = ?auto_347642 ?auto_347650 ) ) ( not ( = ?auto_347643 ?auto_347644 ) ) ( not ( = ?auto_347643 ?auto_347645 ) ) ( not ( = ?auto_347643 ?auto_347646 ) ) ( not ( = ?auto_347643 ?auto_347647 ) ) ( not ( = ?auto_347643 ?auto_347648 ) ) ( not ( = ?auto_347643 ?auto_347649 ) ) ( not ( = ?auto_347643 ?auto_347650 ) ) ( not ( = ?auto_347644 ?auto_347645 ) ) ( not ( = ?auto_347644 ?auto_347646 ) ) ( not ( = ?auto_347644 ?auto_347647 ) ) ( not ( = ?auto_347644 ?auto_347648 ) ) ( not ( = ?auto_347644 ?auto_347649 ) ) ( not ( = ?auto_347644 ?auto_347650 ) ) ( not ( = ?auto_347645 ?auto_347646 ) ) ( not ( = ?auto_347645 ?auto_347647 ) ) ( not ( = ?auto_347645 ?auto_347648 ) ) ( not ( = ?auto_347645 ?auto_347649 ) ) ( not ( = ?auto_347645 ?auto_347650 ) ) ( not ( = ?auto_347646 ?auto_347647 ) ) ( not ( = ?auto_347646 ?auto_347648 ) ) ( not ( = ?auto_347646 ?auto_347649 ) ) ( not ( = ?auto_347646 ?auto_347650 ) ) ( not ( = ?auto_347647 ?auto_347648 ) ) ( not ( = ?auto_347647 ?auto_347649 ) ) ( not ( = ?auto_347647 ?auto_347650 ) ) ( not ( = ?auto_347648 ?auto_347649 ) ) ( not ( = ?auto_347648 ?auto_347650 ) ) ( not ( = ?auto_347649 ?auto_347650 ) ) ( ON ?auto_347648 ?auto_347649 ) ( ON ?auto_347647 ?auto_347648 ) ( ON ?auto_347646 ?auto_347647 ) ( ON ?auto_347645 ?auto_347646 ) ( ON ?auto_347644 ?auto_347645 ) ( ON ?auto_347643 ?auto_347644 ) ( ON ?auto_347642 ?auto_347643 ) ( ON ?auto_347641 ?auto_347642 ) ( ON ?auto_347640 ?auto_347641 ) ( ON ?auto_347639 ?auto_347640 ) ( ON ?auto_347638 ?auto_347639 ) ( CLEAR ?auto_347636 ) ( ON ?auto_347637 ?auto_347638 ) ( CLEAR ?auto_347637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_347636 ?auto_347637 )
      ( MAKE-14PILE ?auto_347636 ?auto_347637 ?auto_347638 ?auto_347639 ?auto_347640 ?auto_347641 ?auto_347642 ?auto_347643 ?auto_347644 ?auto_347645 ?auto_347646 ?auto_347647 ?auto_347648 ?auto_347649 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_347665 - BLOCK
      ?auto_347666 - BLOCK
      ?auto_347667 - BLOCK
      ?auto_347668 - BLOCK
      ?auto_347669 - BLOCK
      ?auto_347670 - BLOCK
      ?auto_347671 - BLOCK
      ?auto_347672 - BLOCK
      ?auto_347673 - BLOCK
      ?auto_347674 - BLOCK
      ?auto_347675 - BLOCK
      ?auto_347676 - BLOCK
      ?auto_347677 - BLOCK
      ?auto_347678 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_347678 ) ( ON-TABLE ?auto_347665 ) ( not ( = ?auto_347665 ?auto_347666 ) ) ( not ( = ?auto_347665 ?auto_347667 ) ) ( not ( = ?auto_347665 ?auto_347668 ) ) ( not ( = ?auto_347665 ?auto_347669 ) ) ( not ( = ?auto_347665 ?auto_347670 ) ) ( not ( = ?auto_347665 ?auto_347671 ) ) ( not ( = ?auto_347665 ?auto_347672 ) ) ( not ( = ?auto_347665 ?auto_347673 ) ) ( not ( = ?auto_347665 ?auto_347674 ) ) ( not ( = ?auto_347665 ?auto_347675 ) ) ( not ( = ?auto_347665 ?auto_347676 ) ) ( not ( = ?auto_347665 ?auto_347677 ) ) ( not ( = ?auto_347665 ?auto_347678 ) ) ( not ( = ?auto_347666 ?auto_347667 ) ) ( not ( = ?auto_347666 ?auto_347668 ) ) ( not ( = ?auto_347666 ?auto_347669 ) ) ( not ( = ?auto_347666 ?auto_347670 ) ) ( not ( = ?auto_347666 ?auto_347671 ) ) ( not ( = ?auto_347666 ?auto_347672 ) ) ( not ( = ?auto_347666 ?auto_347673 ) ) ( not ( = ?auto_347666 ?auto_347674 ) ) ( not ( = ?auto_347666 ?auto_347675 ) ) ( not ( = ?auto_347666 ?auto_347676 ) ) ( not ( = ?auto_347666 ?auto_347677 ) ) ( not ( = ?auto_347666 ?auto_347678 ) ) ( not ( = ?auto_347667 ?auto_347668 ) ) ( not ( = ?auto_347667 ?auto_347669 ) ) ( not ( = ?auto_347667 ?auto_347670 ) ) ( not ( = ?auto_347667 ?auto_347671 ) ) ( not ( = ?auto_347667 ?auto_347672 ) ) ( not ( = ?auto_347667 ?auto_347673 ) ) ( not ( = ?auto_347667 ?auto_347674 ) ) ( not ( = ?auto_347667 ?auto_347675 ) ) ( not ( = ?auto_347667 ?auto_347676 ) ) ( not ( = ?auto_347667 ?auto_347677 ) ) ( not ( = ?auto_347667 ?auto_347678 ) ) ( not ( = ?auto_347668 ?auto_347669 ) ) ( not ( = ?auto_347668 ?auto_347670 ) ) ( not ( = ?auto_347668 ?auto_347671 ) ) ( not ( = ?auto_347668 ?auto_347672 ) ) ( not ( = ?auto_347668 ?auto_347673 ) ) ( not ( = ?auto_347668 ?auto_347674 ) ) ( not ( = ?auto_347668 ?auto_347675 ) ) ( not ( = ?auto_347668 ?auto_347676 ) ) ( not ( = ?auto_347668 ?auto_347677 ) ) ( not ( = ?auto_347668 ?auto_347678 ) ) ( not ( = ?auto_347669 ?auto_347670 ) ) ( not ( = ?auto_347669 ?auto_347671 ) ) ( not ( = ?auto_347669 ?auto_347672 ) ) ( not ( = ?auto_347669 ?auto_347673 ) ) ( not ( = ?auto_347669 ?auto_347674 ) ) ( not ( = ?auto_347669 ?auto_347675 ) ) ( not ( = ?auto_347669 ?auto_347676 ) ) ( not ( = ?auto_347669 ?auto_347677 ) ) ( not ( = ?auto_347669 ?auto_347678 ) ) ( not ( = ?auto_347670 ?auto_347671 ) ) ( not ( = ?auto_347670 ?auto_347672 ) ) ( not ( = ?auto_347670 ?auto_347673 ) ) ( not ( = ?auto_347670 ?auto_347674 ) ) ( not ( = ?auto_347670 ?auto_347675 ) ) ( not ( = ?auto_347670 ?auto_347676 ) ) ( not ( = ?auto_347670 ?auto_347677 ) ) ( not ( = ?auto_347670 ?auto_347678 ) ) ( not ( = ?auto_347671 ?auto_347672 ) ) ( not ( = ?auto_347671 ?auto_347673 ) ) ( not ( = ?auto_347671 ?auto_347674 ) ) ( not ( = ?auto_347671 ?auto_347675 ) ) ( not ( = ?auto_347671 ?auto_347676 ) ) ( not ( = ?auto_347671 ?auto_347677 ) ) ( not ( = ?auto_347671 ?auto_347678 ) ) ( not ( = ?auto_347672 ?auto_347673 ) ) ( not ( = ?auto_347672 ?auto_347674 ) ) ( not ( = ?auto_347672 ?auto_347675 ) ) ( not ( = ?auto_347672 ?auto_347676 ) ) ( not ( = ?auto_347672 ?auto_347677 ) ) ( not ( = ?auto_347672 ?auto_347678 ) ) ( not ( = ?auto_347673 ?auto_347674 ) ) ( not ( = ?auto_347673 ?auto_347675 ) ) ( not ( = ?auto_347673 ?auto_347676 ) ) ( not ( = ?auto_347673 ?auto_347677 ) ) ( not ( = ?auto_347673 ?auto_347678 ) ) ( not ( = ?auto_347674 ?auto_347675 ) ) ( not ( = ?auto_347674 ?auto_347676 ) ) ( not ( = ?auto_347674 ?auto_347677 ) ) ( not ( = ?auto_347674 ?auto_347678 ) ) ( not ( = ?auto_347675 ?auto_347676 ) ) ( not ( = ?auto_347675 ?auto_347677 ) ) ( not ( = ?auto_347675 ?auto_347678 ) ) ( not ( = ?auto_347676 ?auto_347677 ) ) ( not ( = ?auto_347676 ?auto_347678 ) ) ( not ( = ?auto_347677 ?auto_347678 ) ) ( ON ?auto_347677 ?auto_347678 ) ( ON ?auto_347676 ?auto_347677 ) ( ON ?auto_347675 ?auto_347676 ) ( ON ?auto_347674 ?auto_347675 ) ( ON ?auto_347673 ?auto_347674 ) ( ON ?auto_347672 ?auto_347673 ) ( ON ?auto_347671 ?auto_347672 ) ( ON ?auto_347670 ?auto_347671 ) ( ON ?auto_347669 ?auto_347670 ) ( ON ?auto_347668 ?auto_347669 ) ( ON ?auto_347667 ?auto_347668 ) ( CLEAR ?auto_347665 ) ( ON ?auto_347666 ?auto_347667 ) ( CLEAR ?auto_347666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_347665 ?auto_347666 )
      ( MAKE-14PILE ?auto_347665 ?auto_347666 ?auto_347667 ?auto_347668 ?auto_347669 ?auto_347670 ?auto_347671 ?auto_347672 ?auto_347673 ?auto_347674 ?auto_347675 ?auto_347676 ?auto_347677 ?auto_347678 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_347693 - BLOCK
      ?auto_347694 - BLOCK
      ?auto_347695 - BLOCK
      ?auto_347696 - BLOCK
      ?auto_347697 - BLOCK
      ?auto_347698 - BLOCK
      ?auto_347699 - BLOCK
      ?auto_347700 - BLOCK
      ?auto_347701 - BLOCK
      ?auto_347702 - BLOCK
      ?auto_347703 - BLOCK
      ?auto_347704 - BLOCK
      ?auto_347705 - BLOCK
      ?auto_347706 - BLOCK
    )
    :vars
    (
      ?auto_347707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347706 ?auto_347707 ) ( not ( = ?auto_347693 ?auto_347694 ) ) ( not ( = ?auto_347693 ?auto_347695 ) ) ( not ( = ?auto_347693 ?auto_347696 ) ) ( not ( = ?auto_347693 ?auto_347697 ) ) ( not ( = ?auto_347693 ?auto_347698 ) ) ( not ( = ?auto_347693 ?auto_347699 ) ) ( not ( = ?auto_347693 ?auto_347700 ) ) ( not ( = ?auto_347693 ?auto_347701 ) ) ( not ( = ?auto_347693 ?auto_347702 ) ) ( not ( = ?auto_347693 ?auto_347703 ) ) ( not ( = ?auto_347693 ?auto_347704 ) ) ( not ( = ?auto_347693 ?auto_347705 ) ) ( not ( = ?auto_347693 ?auto_347706 ) ) ( not ( = ?auto_347693 ?auto_347707 ) ) ( not ( = ?auto_347694 ?auto_347695 ) ) ( not ( = ?auto_347694 ?auto_347696 ) ) ( not ( = ?auto_347694 ?auto_347697 ) ) ( not ( = ?auto_347694 ?auto_347698 ) ) ( not ( = ?auto_347694 ?auto_347699 ) ) ( not ( = ?auto_347694 ?auto_347700 ) ) ( not ( = ?auto_347694 ?auto_347701 ) ) ( not ( = ?auto_347694 ?auto_347702 ) ) ( not ( = ?auto_347694 ?auto_347703 ) ) ( not ( = ?auto_347694 ?auto_347704 ) ) ( not ( = ?auto_347694 ?auto_347705 ) ) ( not ( = ?auto_347694 ?auto_347706 ) ) ( not ( = ?auto_347694 ?auto_347707 ) ) ( not ( = ?auto_347695 ?auto_347696 ) ) ( not ( = ?auto_347695 ?auto_347697 ) ) ( not ( = ?auto_347695 ?auto_347698 ) ) ( not ( = ?auto_347695 ?auto_347699 ) ) ( not ( = ?auto_347695 ?auto_347700 ) ) ( not ( = ?auto_347695 ?auto_347701 ) ) ( not ( = ?auto_347695 ?auto_347702 ) ) ( not ( = ?auto_347695 ?auto_347703 ) ) ( not ( = ?auto_347695 ?auto_347704 ) ) ( not ( = ?auto_347695 ?auto_347705 ) ) ( not ( = ?auto_347695 ?auto_347706 ) ) ( not ( = ?auto_347695 ?auto_347707 ) ) ( not ( = ?auto_347696 ?auto_347697 ) ) ( not ( = ?auto_347696 ?auto_347698 ) ) ( not ( = ?auto_347696 ?auto_347699 ) ) ( not ( = ?auto_347696 ?auto_347700 ) ) ( not ( = ?auto_347696 ?auto_347701 ) ) ( not ( = ?auto_347696 ?auto_347702 ) ) ( not ( = ?auto_347696 ?auto_347703 ) ) ( not ( = ?auto_347696 ?auto_347704 ) ) ( not ( = ?auto_347696 ?auto_347705 ) ) ( not ( = ?auto_347696 ?auto_347706 ) ) ( not ( = ?auto_347696 ?auto_347707 ) ) ( not ( = ?auto_347697 ?auto_347698 ) ) ( not ( = ?auto_347697 ?auto_347699 ) ) ( not ( = ?auto_347697 ?auto_347700 ) ) ( not ( = ?auto_347697 ?auto_347701 ) ) ( not ( = ?auto_347697 ?auto_347702 ) ) ( not ( = ?auto_347697 ?auto_347703 ) ) ( not ( = ?auto_347697 ?auto_347704 ) ) ( not ( = ?auto_347697 ?auto_347705 ) ) ( not ( = ?auto_347697 ?auto_347706 ) ) ( not ( = ?auto_347697 ?auto_347707 ) ) ( not ( = ?auto_347698 ?auto_347699 ) ) ( not ( = ?auto_347698 ?auto_347700 ) ) ( not ( = ?auto_347698 ?auto_347701 ) ) ( not ( = ?auto_347698 ?auto_347702 ) ) ( not ( = ?auto_347698 ?auto_347703 ) ) ( not ( = ?auto_347698 ?auto_347704 ) ) ( not ( = ?auto_347698 ?auto_347705 ) ) ( not ( = ?auto_347698 ?auto_347706 ) ) ( not ( = ?auto_347698 ?auto_347707 ) ) ( not ( = ?auto_347699 ?auto_347700 ) ) ( not ( = ?auto_347699 ?auto_347701 ) ) ( not ( = ?auto_347699 ?auto_347702 ) ) ( not ( = ?auto_347699 ?auto_347703 ) ) ( not ( = ?auto_347699 ?auto_347704 ) ) ( not ( = ?auto_347699 ?auto_347705 ) ) ( not ( = ?auto_347699 ?auto_347706 ) ) ( not ( = ?auto_347699 ?auto_347707 ) ) ( not ( = ?auto_347700 ?auto_347701 ) ) ( not ( = ?auto_347700 ?auto_347702 ) ) ( not ( = ?auto_347700 ?auto_347703 ) ) ( not ( = ?auto_347700 ?auto_347704 ) ) ( not ( = ?auto_347700 ?auto_347705 ) ) ( not ( = ?auto_347700 ?auto_347706 ) ) ( not ( = ?auto_347700 ?auto_347707 ) ) ( not ( = ?auto_347701 ?auto_347702 ) ) ( not ( = ?auto_347701 ?auto_347703 ) ) ( not ( = ?auto_347701 ?auto_347704 ) ) ( not ( = ?auto_347701 ?auto_347705 ) ) ( not ( = ?auto_347701 ?auto_347706 ) ) ( not ( = ?auto_347701 ?auto_347707 ) ) ( not ( = ?auto_347702 ?auto_347703 ) ) ( not ( = ?auto_347702 ?auto_347704 ) ) ( not ( = ?auto_347702 ?auto_347705 ) ) ( not ( = ?auto_347702 ?auto_347706 ) ) ( not ( = ?auto_347702 ?auto_347707 ) ) ( not ( = ?auto_347703 ?auto_347704 ) ) ( not ( = ?auto_347703 ?auto_347705 ) ) ( not ( = ?auto_347703 ?auto_347706 ) ) ( not ( = ?auto_347703 ?auto_347707 ) ) ( not ( = ?auto_347704 ?auto_347705 ) ) ( not ( = ?auto_347704 ?auto_347706 ) ) ( not ( = ?auto_347704 ?auto_347707 ) ) ( not ( = ?auto_347705 ?auto_347706 ) ) ( not ( = ?auto_347705 ?auto_347707 ) ) ( not ( = ?auto_347706 ?auto_347707 ) ) ( ON ?auto_347705 ?auto_347706 ) ( ON ?auto_347704 ?auto_347705 ) ( ON ?auto_347703 ?auto_347704 ) ( ON ?auto_347702 ?auto_347703 ) ( ON ?auto_347701 ?auto_347702 ) ( ON ?auto_347700 ?auto_347701 ) ( ON ?auto_347699 ?auto_347700 ) ( ON ?auto_347698 ?auto_347699 ) ( ON ?auto_347697 ?auto_347698 ) ( ON ?auto_347696 ?auto_347697 ) ( ON ?auto_347695 ?auto_347696 ) ( ON ?auto_347694 ?auto_347695 ) ( ON ?auto_347693 ?auto_347694 ) ( CLEAR ?auto_347693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_347693 )
      ( MAKE-14PILE ?auto_347693 ?auto_347694 ?auto_347695 ?auto_347696 ?auto_347697 ?auto_347698 ?auto_347699 ?auto_347700 ?auto_347701 ?auto_347702 ?auto_347703 ?auto_347704 ?auto_347705 ?auto_347706 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_347722 - BLOCK
      ?auto_347723 - BLOCK
      ?auto_347724 - BLOCK
      ?auto_347725 - BLOCK
      ?auto_347726 - BLOCK
      ?auto_347727 - BLOCK
      ?auto_347728 - BLOCK
      ?auto_347729 - BLOCK
      ?auto_347730 - BLOCK
      ?auto_347731 - BLOCK
      ?auto_347732 - BLOCK
      ?auto_347733 - BLOCK
      ?auto_347734 - BLOCK
      ?auto_347735 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_347735 ) ( not ( = ?auto_347722 ?auto_347723 ) ) ( not ( = ?auto_347722 ?auto_347724 ) ) ( not ( = ?auto_347722 ?auto_347725 ) ) ( not ( = ?auto_347722 ?auto_347726 ) ) ( not ( = ?auto_347722 ?auto_347727 ) ) ( not ( = ?auto_347722 ?auto_347728 ) ) ( not ( = ?auto_347722 ?auto_347729 ) ) ( not ( = ?auto_347722 ?auto_347730 ) ) ( not ( = ?auto_347722 ?auto_347731 ) ) ( not ( = ?auto_347722 ?auto_347732 ) ) ( not ( = ?auto_347722 ?auto_347733 ) ) ( not ( = ?auto_347722 ?auto_347734 ) ) ( not ( = ?auto_347722 ?auto_347735 ) ) ( not ( = ?auto_347723 ?auto_347724 ) ) ( not ( = ?auto_347723 ?auto_347725 ) ) ( not ( = ?auto_347723 ?auto_347726 ) ) ( not ( = ?auto_347723 ?auto_347727 ) ) ( not ( = ?auto_347723 ?auto_347728 ) ) ( not ( = ?auto_347723 ?auto_347729 ) ) ( not ( = ?auto_347723 ?auto_347730 ) ) ( not ( = ?auto_347723 ?auto_347731 ) ) ( not ( = ?auto_347723 ?auto_347732 ) ) ( not ( = ?auto_347723 ?auto_347733 ) ) ( not ( = ?auto_347723 ?auto_347734 ) ) ( not ( = ?auto_347723 ?auto_347735 ) ) ( not ( = ?auto_347724 ?auto_347725 ) ) ( not ( = ?auto_347724 ?auto_347726 ) ) ( not ( = ?auto_347724 ?auto_347727 ) ) ( not ( = ?auto_347724 ?auto_347728 ) ) ( not ( = ?auto_347724 ?auto_347729 ) ) ( not ( = ?auto_347724 ?auto_347730 ) ) ( not ( = ?auto_347724 ?auto_347731 ) ) ( not ( = ?auto_347724 ?auto_347732 ) ) ( not ( = ?auto_347724 ?auto_347733 ) ) ( not ( = ?auto_347724 ?auto_347734 ) ) ( not ( = ?auto_347724 ?auto_347735 ) ) ( not ( = ?auto_347725 ?auto_347726 ) ) ( not ( = ?auto_347725 ?auto_347727 ) ) ( not ( = ?auto_347725 ?auto_347728 ) ) ( not ( = ?auto_347725 ?auto_347729 ) ) ( not ( = ?auto_347725 ?auto_347730 ) ) ( not ( = ?auto_347725 ?auto_347731 ) ) ( not ( = ?auto_347725 ?auto_347732 ) ) ( not ( = ?auto_347725 ?auto_347733 ) ) ( not ( = ?auto_347725 ?auto_347734 ) ) ( not ( = ?auto_347725 ?auto_347735 ) ) ( not ( = ?auto_347726 ?auto_347727 ) ) ( not ( = ?auto_347726 ?auto_347728 ) ) ( not ( = ?auto_347726 ?auto_347729 ) ) ( not ( = ?auto_347726 ?auto_347730 ) ) ( not ( = ?auto_347726 ?auto_347731 ) ) ( not ( = ?auto_347726 ?auto_347732 ) ) ( not ( = ?auto_347726 ?auto_347733 ) ) ( not ( = ?auto_347726 ?auto_347734 ) ) ( not ( = ?auto_347726 ?auto_347735 ) ) ( not ( = ?auto_347727 ?auto_347728 ) ) ( not ( = ?auto_347727 ?auto_347729 ) ) ( not ( = ?auto_347727 ?auto_347730 ) ) ( not ( = ?auto_347727 ?auto_347731 ) ) ( not ( = ?auto_347727 ?auto_347732 ) ) ( not ( = ?auto_347727 ?auto_347733 ) ) ( not ( = ?auto_347727 ?auto_347734 ) ) ( not ( = ?auto_347727 ?auto_347735 ) ) ( not ( = ?auto_347728 ?auto_347729 ) ) ( not ( = ?auto_347728 ?auto_347730 ) ) ( not ( = ?auto_347728 ?auto_347731 ) ) ( not ( = ?auto_347728 ?auto_347732 ) ) ( not ( = ?auto_347728 ?auto_347733 ) ) ( not ( = ?auto_347728 ?auto_347734 ) ) ( not ( = ?auto_347728 ?auto_347735 ) ) ( not ( = ?auto_347729 ?auto_347730 ) ) ( not ( = ?auto_347729 ?auto_347731 ) ) ( not ( = ?auto_347729 ?auto_347732 ) ) ( not ( = ?auto_347729 ?auto_347733 ) ) ( not ( = ?auto_347729 ?auto_347734 ) ) ( not ( = ?auto_347729 ?auto_347735 ) ) ( not ( = ?auto_347730 ?auto_347731 ) ) ( not ( = ?auto_347730 ?auto_347732 ) ) ( not ( = ?auto_347730 ?auto_347733 ) ) ( not ( = ?auto_347730 ?auto_347734 ) ) ( not ( = ?auto_347730 ?auto_347735 ) ) ( not ( = ?auto_347731 ?auto_347732 ) ) ( not ( = ?auto_347731 ?auto_347733 ) ) ( not ( = ?auto_347731 ?auto_347734 ) ) ( not ( = ?auto_347731 ?auto_347735 ) ) ( not ( = ?auto_347732 ?auto_347733 ) ) ( not ( = ?auto_347732 ?auto_347734 ) ) ( not ( = ?auto_347732 ?auto_347735 ) ) ( not ( = ?auto_347733 ?auto_347734 ) ) ( not ( = ?auto_347733 ?auto_347735 ) ) ( not ( = ?auto_347734 ?auto_347735 ) ) ( ON ?auto_347734 ?auto_347735 ) ( ON ?auto_347733 ?auto_347734 ) ( ON ?auto_347732 ?auto_347733 ) ( ON ?auto_347731 ?auto_347732 ) ( ON ?auto_347730 ?auto_347731 ) ( ON ?auto_347729 ?auto_347730 ) ( ON ?auto_347728 ?auto_347729 ) ( ON ?auto_347727 ?auto_347728 ) ( ON ?auto_347726 ?auto_347727 ) ( ON ?auto_347725 ?auto_347726 ) ( ON ?auto_347724 ?auto_347725 ) ( ON ?auto_347723 ?auto_347724 ) ( ON ?auto_347722 ?auto_347723 ) ( CLEAR ?auto_347722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_347722 )
      ( MAKE-14PILE ?auto_347722 ?auto_347723 ?auto_347724 ?auto_347725 ?auto_347726 ?auto_347727 ?auto_347728 ?auto_347729 ?auto_347730 ?auto_347731 ?auto_347732 ?auto_347733 ?auto_347734 ?auto_347735 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_347750 - BLOCK
      ?auto_347751 - BLOCK
      ?auto_347752 - BLOCK
      ?auto_347753 - BLOCK
      ?auto_347754 - BLOCK
      ?auto_347755 - BLOCK
      ?auto_347756 - BLOCK
      ?auto_347757 - BLOCK
      ?auto_347758 - BLOCK
      ?auto_347759 - BLOCK
      ?auto_347760 - BLOCK
      ?auto_347761 - BLOCK
      ?auto_347762 - BLOCK
      ?auto_347763 - BLOCK
    )
    :vars
    (
      ?auto_347764 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_347750 ?auto_347751 ) ) ( not ( = ?auto_347750 ?auto_347752 ) ) ( not ( = ?auto_347750 ?auto_347753 ) ) ( not ( = ?auto_347750 ?auto_347754 ) ) ( not ( = ?auto_347750 ?auto_347755 ) ) ( not ( = ?auto_347750 ?auto_347756 ) ) ( not ( = ?auto_347750 ?auto_347757 ) ) ( not ( = ?auto_347750 ?auto_347758 ) ) ( not ( = ?auto_347750 ?auto_347759 ) ) ( not ( = ?auto_347750 ?auto_347760 ) ) ( not ( = ?auto_347750 ?auto_347761 ) ) ( not ( = ?auto_347750 ?auto_347762 ) ) ( not ( = ?auto_347750 ?auto_347763 ) ) ( not ( = ?auto_347751 ?auto_347752 ) ) ( not ( = ?auto_347751 ?auto_347753 ) ) ( not ( = ?auto_347751 ?auto_347754 ) ) ( not ( = ?auto_347751 ?auto_347755 ) ) ( not ( = ?auto_347751 ?auto_347756 ) ) ( not ( = ?auto_347751 ?auto_347757 ) ) ( not ( = ?auto_347751 ?auto_347758 ) ) ( not ( = ?auto_347751 ?auto_347759 ) ) ( not ( = ?auto_347751 ?auto_347760 ) ) ( not ( = ?auto_347751 ?auto_347761 ) ) ( not ( = ?auto_347751 ?auto_347762 ) ) ( not ( = ?auto_347751 ?auto_347763 ) ) ( not ( = ?auto_347752 ?auto_347753 ) ) ( not ( = ?auto_347752 ?auto_347754 ) ) ( not ( = ?auto_347752 ?auto_347755 ) ) ( not ( = ?auto_347752 ?auto_347756 ) ) ( not ( = ?auto_347752 ?auto_347757 ) ) ( not ( = ?auto_347752 ?auto_347758 ) ) ( not ( = ?auto_347752 ?auto_347759 ) ) ( not ( = ?auto_347752 ?auto_347760 ) ) ( not ( = ?auto_347752 ?auto_347761 ) ) ( not ( = ?auto_347752 ?auto_347762 ) ) ( not ( = ?auto_347752 ?auto_347763 ) ) ( not ( = ?auto_347753 ?auto_347754 ) ) ( not ( = ?auto_347753 ?auto_347755 ) ) ( not ( = ?auto_347753 ?auto_347756 ) ) ( not ( = ?auto_347753 ?auto_347757 ) ) ( not ( = ?auto_347753 ?auto_347758 ) ) ( not ( = ?auto_347753 ?auto_347759 ) ) ( not ( = ?auto_347753 ?auto_347760 ) ) ( not ( = ?auto_347753 ?auto_347761 ) ) ( not ( = ?auto_347753 ?auto_347762 ) ) ( not ( = ?auto_347753 ?auto_347763 ) ) ( not ( = ?auto_347754 ?auto_347755 ) ) ( not ( = ?auto_347754 ?auto_347756 ) ) ( not ( = ?auto_347754 ?auto_347757 ) ) ( not ( = ?auto_347754 ?auto_347758 ) ) ( not ( = ?auto_347754 ?auto_347759 ) ) ( not ( = ?auto_347754 ?auto_347760 ) ) ( not ( = ?auto_347754 ?auto_347761 ) ) ( not ( = ?auto_347754 ?auto_347762 ) ) ( not ( = ?auto_347754 ?auto_347763 ) ) ( not ( = ?auto_347755 ?auto_347756 ) ) ( not ( = ?auto_347755 ?auto_347757 ) ) ( not ( = ?auto_347755 ?auto_347758 ) ) ( not ( = ?auto_347755 ?auto_347759 ) ) ( not ( = ?auto_347755 ?auto_347760 ) ) ( not ( = ?auto_347755 ?auto_347761 ) ) ( not ( = ?auto_347755 ?auto_347762 ) ) ( not ( = ?auto_347755 ?auto_347763 ) ) ( not ( = ?auto_347756 ?auto_347757 ) ) ( not ( = ?auto_347756 ?auto_347758 ) ) ( not ( = ?auto_347756 ?auto_347759 ) ) ( not ( = ?auto_347756 ?auto_347760 ) ) ( not ( = ?auto_347756 ?auto_347761 ) ) ( not ( = ?auto_347756 ?auto_347762 ) ) ( not ( = ?auto_347756 ?auto_347763 ) ) ( not ( = ?auto_347757 ?auto_347758 ) ) ( not ( = ?auto_347757 ?auto_347759 ) ) ( not ( = ?auto_347757 ?auto_347760 ) ) ( not ( = ?auto_347757 ?auto_347761 ) ) ( not ( = ?auto_347757 ?auto_347762 ) ) ( not ( = ?auto_347757 ?auto_347763 ) ) ( not ( = ?auto_347758 ?auto_347759 ) ) ( not ( = ?auto_347758 ?auto_347760 ) ) ( not ( = ?auto_347758 ?auto_347761 ) ) ( not ( = ?auto_347758 ?auto_347762 ) ) ( not ( = ?auto_347758 ?auto_347763 ) ) ( not ( = ?auto_347759 ?auto_347760 ) ) ( not ( = ?auto_347759 ?auto_347761 ) ) ( not ( = ?auto_347759 ?auto_347762 ) ) ( not ( = ?auto_347759 ?auto_347763 ) ) ( not ( = ?auto_347760 ?auto_347761 ) ) ( not ( = ?auto_347760 ?auto_347762 ) ) ( not ( = ?auto_347760 ?auto_347763 ) ) ( not ( = ?auto_347761 ?auto_347762 ) ) ( not ( = ?auto_347761 ?auto_347763 ) ) ( not ( = ?auto_347762 ?auto_347763 ) ) ( ON ?auto_347750 ?auto_347764 ) ( not ( = ?auto_347763 ?auto_347764 ) ) ( not ( = ?auto_347762 ?auto_347764 ) ) ( not ( = ?auto_347761 ?auto_347764 ) ) ( not ( = ?auto_347760 ?auto_347764 ) ) ( not ( = ?auto_347759 ?auto_347764 ) ) ( not ( = ?auto_347758 ?auto_347764 ) ) ( not ( = ?auto_347757 ?auto_347764 ) ) ( not ( = ?auto_347756 ?auto_347764 ) ) ( not ( = ?auto_347755 ?auto_347764 ) ) ( not ( = ?auto_347754 ?auto_347764 ) ) ( not ( = ?auto_347753 ?auto_347764 ) ) ( not ( = ?auto_347752 ?auto_347764 ) ) ( not ( = ?auto_347751 ?auto_347764 ) ) ( not ( = ?auto_347750 ?auto_347764 ) ) ( ON ?auto_347751 ?auto_347750 ) ( ON ?auto_347752 ?auto_347751 ) ( ON ?auto_347753 ?auto_347752 ) ( ON ?auto_347754 ?auto_347753 ) ( ON ?auto_347755 ?auto_347754 ) ( ON ?auto_347756 ?auto_347755 ) ( ON ?auto_347757 ?auto_347756 ) ( ON ?auto_347758 ?auto_347757 ) ( ON ?auto_347759 ?auto_347758 ) ( ON ?auto_347760 ?auto_347759 ) ( ON ?auto_347761 ?auto_347760 ) ( ON ?auto_347762 ?auto_347761 ) ( ON ?auto_347763 ?auto_347762 ) ( CLEAR ?auto_347763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_347763 ?auto_347762 ?auto_347761 ?auto_347760 ?auto_347759 ?auto_347758 ?auto_347757 ?auto_347756 ?auto_347755 ?auto_347754 ?auto_347753 ?auto_347752 ?auto_347751 ?auto_347750 )
      ( MAKE-14PILE ?auto_347750 ?auto_347751 ?auto_347752 ?auto_347753 ?auto_347754 ?auto_347755 ?auto_347756 ?auto_347757 ?auto_347758 ?auto_347759 ?auto_347760 ?auto_347761 ?auto_347762 ?auto_347763 ) )
  )

)

