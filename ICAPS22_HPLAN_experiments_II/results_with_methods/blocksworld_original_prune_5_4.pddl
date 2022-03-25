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
      ?auto_19513 - BLOCK
      ?auto_19514 - BLOCK
      ?auto_19515 - BLOCK
      ?auto_19516 - BLOCK
      ?auto_19517 - BLOCK
    )
    :vars
    (
      ?auto_19518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19518 ?auto_19517 ) ( CLEAR ?auto_19518 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19513 ) ( ON ?auto_19514 ?auto_19513 ) ( ON ?auto_19515 ?auto_19514 ) ( ON ?auto_19516 ?auto_19515 ) ( ON ?auto_19517 ?auto_19516 ) ( not ( = ?auto_19513 ?auto_19514 ) ) ( not ( = ?auto_19513 ?auto_19515 ) ) ( not ( = ?auto_19513 ?auto_19516 ) ) ( not ( = ?auto_19513 ?auto_19517 ) ) ( not ( = ?auto_19513 ?auto_19518 ) ) ( not ( = ?auto_19514 ?auto_19515 ) ) ( not ( = ?auto_19514 ?auto_19516 ) ) ( not ( = ?auto_19514 ?auto_19517 ) ) ( not ( = ?auto_19514 ?auto_19518 ) ) ( not ( = ?auto_19515 ?auto_19516 ) ) ( not ( = ?auto_19515 ?auto_19517 ) ) ( not ( = ?auto_19515 ?auto_19518 ) ) ( not ( = ?auto_19516 ?auto_19517 ) ) ( not ( = ?auto_19516 ?auto_19518 ) ) ( not ( = ?auto_19517 ?auto_19518 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19518 ?auto_19517 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19520 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_19520 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_19520 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19521 - BLOCK
    )
    :vars
    (
      ?auto_19522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19521 ?auto_19522 ) ( CLEAR ?auto_19521 ) ( HAND-EMPTY ) ( not ( = ?auto_19521 ?auto_19522 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19521 ?auto_19522 )
      ( MAKE-1PILE ?auto_19521 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19527 - BLOCK
      ?auto_19528 - BLOCK
      ?auto_19529 - BLOCK
      ?auto_19530 - BLOCK
    )
    :vars
    (
      ?auto_19531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19531 ?auto_19530 ) ( CLEAR ?auto_19531 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19527 ) ( ON ?auto_19528 ?auto_19527 ) ( ON ?auto_19529 ?auto_19528 ) ( ON ?auto_19530 ?auto_19529 ) ( not ( = ?auto_19527 ?auto_19528 ) ) ( not ( = ?auto_19527 ?auto_19529 ) ) ( not ( = ?auto_19527 ?auto_19530 ) ) ( not ( = ?auto_19527 ?auto_19531 ) ) ( not ( = ?auto_19528 ?auto_19529 ) ) ( not ( = ?auto_19528 ?auto_19530 ) ) ( not ( = ?auto_19528 ?auto_19531 ) ) ( not ( = ?auto_19529 ?auto_19530 ) ) ( not ( = ?auto_19529 ?auto_19531 ) ) ( not ( = ?auto_19530 ?auto_19531 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19531 ?auto_19530 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19532 - BLOCK
      ?auto_19533 - BLOCK
      ?auto_19534 - BLOCK
      ?auto_19535 - BLOCK
    )
    :vars
    (
      ?auto_19536 - BLOCK
      ?auto_19537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19536 ?auto_19535 ) ( CLEAR ?auto_19536 ) ( ON-TABLE ?auto_19532 ) ( ON ?auto_19533 ?auto_19532 ) ( ON ?auto_19534 ?auto_19533 ) ( ON ?auto_19535 ?auto_19534 ) ( not ( = ?auto_19532 ?auto_19533 ) ) ( not ( = ?auto_19532 ?auto_19534 ) ) ( not ( = ?auto_19532 ?auto_19535 ) ) ( not ( = ?auto_19532 ?auto_19536 ) ) ( not ( = ?auto_19533 ?auto_19534 ) ) ( not ( = ?auto_19533 ?auto_19535 ) ) ( not ( = ?auto_19533 ?auto_19536 ) ) ( not ( = ?auto_19534 ?auto_19535 ) ) ( not ( = ?auto_19534 ?auto_19536 ) ) ( not ( = ?auto_19535 ?auto_19536 ) ) ( HOLDING ?auto_19537 ) ( not ( = ?auto_19532 ?auto_19537 ) ) ( not ( = ?auto_19533 ?auto_19537 ) ) ( not ( = ?auto_19534 ?auto_19537 ) ) ( not ( = ?auto_19535 ?auto_19537 ) ) ( not ( = ?auto_19536 ?auto_19537 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_19537 )
      ( MAKE-4PILE ?auto_19532 ?auto_19533 ?auto_19534 ?auto_19535 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19538 - BLOCK
      ?auto_19539 - BLOCK
      ?auto_19540 - BLOCK
      ?auto_19541 - BLOCK
    )
    :vars
    (
      ?auto_19543 - BLOCK
      ?auto_19542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19543 ?auto_19541 ) ( ON-TABLE ?auto_19538 ) ( ON ?auto_19539 ?auto_19538 ) ( ON ?auto_19540 ?auto_19539 ) ( ON ?auto_19541 ?auto_19540 ) ( not ( = ?auto_19538 ?auto_19539 ) ) ( not ( = ?auto_19538 ?auto_19540 ) ) ( not ( = ?auto_19538 ?auto_19541 ) ) ( not ( = ?auto_19538 ?auto_19543 ) ) ( not ( = ?auto_19539 ?auto_19540 ) ) ( not ( = ?auto_19539 ?auto_19541 ) ) ( not ( = ?auto_19539 ?auto_19543 ) ) ( not ( = ?auto_19540 ?auto_19541 ) ) ( not ( = ?auto_19540 ?auto_19543 ) ) ( not ( = ?auto_19541 ?auto_19543 ) ) ( not ( = ?auto_19538 ?auto_19542 ) ) ( not ( = ?auto_19539 ?auto_19542 ) ) ( not ( = ?auto_19540 ?auto_19542 ) ) ( not ( = ?auto_19541 ?auto_19542 ) ) ( not ( = ?auto_19543 ?auto_19542 ) ) ( ON ?auto_19542 ?auto_19543 ) ( CLEAR ?auto_19542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19538 ?auto_19539 ?auto_19540 ?auto_19541 ?auto_19543 )
      ( MAKE-4PILE ?auto_19538 ?auto_19539 ?auto_19540 ?auto_19541 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19546 - BLOCK
      ?auto_19547 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_19547 ) ( CLEAR ?auto_19546 ) ( ON-TABLE ?auto_19546 ) ( not ( = ?auto_19546 ?auto_19547 ) ) )
    :subtasks
    ( ( !STACK ?auto_19547 ?auto_19546 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19548 - BLOCK
      ?auto_19549 - BLOCK
    )
    :vars
    (
      ?auto_19550 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19548 ) ( ON-TABLE ?auto_19548 ) ( not ( = ?auto_19548 ?auto_19549 ) ) ( ON ?auto_19549 ?auto_19550 ) ( CLEAR ?auto_19549 ) ( HAND-EMPTY ) ( not ( = ?auto_19548 ?auto_19550 ) ) ( not ( = ?auto_19549 ?auto_19550 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19549 ?auto_19550 )
      ( MAKE-2PILE ?auto_19548 ?auto_19549 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19551 - BLOCK
      ?auto_19552 - BLOCK
    )
    :vars
    (
      ?auto_19553 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19551 ?auto_19552 ) ) ( ON ?auto_19552 ?auto_19553 ) ( CLEAR ?auto_19552 ) ( not ( = ?auto_19551 ?auto_19553 ) ) ( not ( = ?auto_19552 ?auto_19553 ) ) ( HOLDING ?auto_19551 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19551 )
      ( MAKE-2PILE ?auto_19551 ?auto_19552 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19554 - BLOCK
      ?auto_19555 - BLOCK
    )
    :vars
    (
      ?auto_19556 - BLOCK
      ?auto_19559 - BLOCK
      ?auto_19558 - BLOCK
      ?auto_19557 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19554 ?auto_19555 ) ) ( ON ?auto_19555 ?auto_19556 ) ( not ( = ?auto_19554 ?auto_19556 ) ) ( not ( = ?auto_19555 ?auto_19556 ) ) ( ON ?auto_19554 ?auto_19555 ) ( CLEAR ?auto_19554 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19559 ) ( ON ?auto_19558 ?auto_19559 ) ( ON ?auto_19557 ?auto_19558 ) ( ON ?auto_19556 ?auto_19557 ) ( not ( = ?auto_19559 ?auto_19558 ) ) ( not ( = ?auto_19559 ?auto_19557 ) ) ( not ( = ?auto_19559 ?auto_19556 ) ) ( not ( = ?auto_19559 ?auto_19555 ) ) ( not ( = ?auto_19559 ?auto_19554 ) ) ( not ( = ?auto_19558 ?auto_19557 ) ) ( not ( = ?auto_19558 ?auto_19556 ) ) ( not ( = ?auto_19558 ?auto_19555 ) ) ( not ( = ?auto_19558 ?auto_19554 ) ) ( not ( = ?auto_19557 ?auto_19556 ) ) ( not ( = ?auto_19557 ?auto_19555 ) ) ( not ( = ?auto_19557 ?auto_19554 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19559 ?auto_19558 ?auto_19557 ?auto_19556 ?auto_19555 )
      ( MAKE-2PILE ?auto_19554 ?auto_19555 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19563 - BLOCK
      ?auto_19564 - BLOCK
      ?auto_19565 - BLOCK
    )
    :vars
    (
      ?auto_19566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19566 ?auto_19565 ) ( CLEAR ?auto_19566 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19563 ) ( ON ?auto_19564 ?auto_19563 ) ( ON ?auto_19565 ?auto_19564 ) ( not ( = ?auto_19563 ?auto_19564 ) ) ( not ( = ?auto_19563 ?auto_19565 ) ) ( not ( = ?auto_19563 ?auto_19566 ) ) ( not ( = ?auto_19564 ?auto_19565 ) ) ( not ( = ?auto_19564 ?auto_19566 ) ) ( not ( = ?auto_19565 ?auto_19566 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19566 ?auto_19565 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19567 - BLOCK
      ?auto_19568 - BLOCK
      ?auto_19569 - BLOCK
    )
    :vars
    (
      ?auto_19570 - BLOCK
      ?auto_19571 - BLOCK
      ?auto_19572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19570 ?auto_19569 ) ( CLEAR ?auto_19570 ) ( ON-TABLE ?auto_19567 ) ( ON ?auto_19568 ?auto_19567 ) ( ON ?auto_19569 ?auto_19568 ) ( not ( = ?auto_19567 ?auto_19568 ) ) ( not ( = ?auto_19567 ?auto_19569 ) ) ( not ( = ?auto_19567 ?auto_19570 ) ) ( not ( = ?auto_19568 ?auto_19569 ) ) ( not ( = ?auto_19568 ?auto_19570 ) ) ( not ( = ?auto_19569 ?auto_19570 ) ) ( HOLDING ?auto_19571 ) ( CLEAR ?auto_19572 ) ( not ( = ?auto_19567 ?auto_19571 ) ) ( not ( = ?auto_19567 ?auto_19572 ) ) ( not ( = ?auto_19568 ?auto_19571 ) ) ( not ( = ?auto_19568 ?auto_19572 ) ) ( not ( = ?auto_19569 ?auto_19571 ) ) ( not ( = ?auto_19569 ?auto_19572 ) ) ( not ( = ?auto_19570 ?auto_19571 ) ) ( not ( = ?auto_19570 ?auto_19572 ) ) ( not ( = ?auto_19571 ?auto_19572 ) ) )
    :subtasks
    ( ( !STACK ?auto_19571 ?auto_19572 )
      ( MAKE-3PILE ?auto_19567 ?auto_19568 ?auto_19569 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19935 - BLOCK
      ?auto_19936 - BLOCK
      ?auto_19937 - BLOCK
    )
    :vars
    (
      ?auto_19938 - BLOCK
      ?auto_19939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19938 ?auto_19937 ) ( ON-TABLE ?auto_19935 ) ( ON ?auto_19936 ?auto_19935 ) ( ON ?auto_19937 ?auto_19936 ) ( not ( = ?auto_19935 ?auto_19936 ) ) ( not ( = ?auto_19935 ?auto_19937 ) ) ( not ( = ?auto_19935 ?auto_19938 ) ) ( not ( = ?auto_19936 ?auto_19937 ) ) ( not ( = ?auto_19936 ?auto_19938 ) ) ( not ( = ?auto_19937 ?auto_19938 ) ) ( not ( = ?auto_19935 ?auto_19939 ) ) ( not ( = ?auto_19936 ?auto_19939 ) ) ( not ( = ?auto_19937 ?auto_19939 ) ) ( not ( = ?auto_19938 ?auto_19939 ) ) ( ON ?auto_19939 ?auto_19938 ) ( CLEAR ?auto_19939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19935 ?auto_19936 ?auto_19937 ?auto_19938 )
      ( MAKE-3PILE ?auto_19935 ?auto_19936 ?auto_19937 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19579 - BLOCK
      ?auto_19580 - BLOCK
      ?auto_19581 - BLOCK
    )
    :vars
    (
      ?auto_19584 - BLOCK
      ?auto_19583 - BLOCK
      ?auto_19582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19584 ?auto_19581 ) ( ON-TABLE ?auto_19579 ) ( ON ?auto_19580 ?auto_19579 ) ( ON ?auto_19581 ?auto_19580 ) ( not ( = ?auto_19579 ?auto_19580 ) ) ( not ( = ?auto_19579 ?auto_19581 ) ) ( not ( = ?auto_19579 ?auto_19584 ) ) ( not ( = ?auto_19580 ?auto_19581 ) ) ( not ( = ?auto_19580 ?auto_19584 ) ) ( not ( = ?auto_19581 ?auto_19584 ) ) ( not ( = ?auto_19579 ?auto_19583 ) ) ( not ( = ?auto_19579 ?auto_19582 ) ) ( not ( = ?auto_19580 ?auto_19583 ) ) ( not ( = ?auto_19580 ?auto_19582 ) ) ( not ( = ?auto_19581 ?auto_19583 ) ) ( not ( = ?auto_19581 ?auto_19582 ) ) ( not ( = ?auto_19584 ?auto_19583 ) ) ( not ( = ?auto_19584 ?auto_19582 ) ) ( not ( = ?auto_19583 ?auto_19582 ) ) ( ON ?auto_19583 ?auto_19584 ) ( CLEAR ?auto_19583 ) ( HOLDING ?auto_19582 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19582 )
      ( MAKE-3PILE ?auto_19579 ?auto_19580 ?auto_19581 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19585 - BLOCK
      ?auto_19586 - BLOCK
      ?auto_19587 - BLOCK
    )
    :vars
    (
      ?auto_19589 - BLOCK
      ?auto_19590 - BLOCK
      ?auto_19588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19589 ?auto_19587 ) ( ON-TABLE ?auto_19585 ) ( ON ?auto_19586 ?auto_19585 ) ( ON ?auto_19587 ?auto_19586 ) ( not ( = ?auto_19585 ?auto_19586 ) ) ( not ( = ?auto_19585 ?auto_19587 ) ) ( not ( = ?auto_19585 ?auto_19589 ) ) ( not ( = ?auto_19586 ?auto_19587 ) ) ( not ( = ?auto_19586 ?auto_19589 ) ) ( not ( = ?auto_19587 ?auto_19589 ) ) ( not ( = ?auto_19585 ?auto_19590 ) ) ( not ( = ?auto_19585 ?auto_19588 ) ) ( not ( = ?auto_19586 ?auto_19590 ) ) ( not ( = ?auto_19586 ?auto_19588 ) ) ( not ( = ?auto_19587 ?auto_19590 ) ) ( not ( = ?auto_19587 ?auto_19588 ) ) ( not ( = ?auto_19589 ?auto_19590 ) ) ( not ( = ?auto_19589 ?auto_19588 ) ) ( not ( = ?auto_19590 ?auto_19588 ) ) ( ON ?auto_19590 ?auto_19589 ) ( ON ?auto_19588 ?auto_19590 ) ( CLEAR ?auto_19588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19585 ?auto_19586 ?auto_19587 ?auto_19589 ?auto_19590 )
      ( MAKE-3PILE ?auto_19585 ?auto_19586 ?auto_19587 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19594 - BLOCK
      ?auto_19595 - BLOCK
      ?auto_19596 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_19596 ) ( CLEAR ?auto_19595 ) ( ON-TABLE ?auto_19594 ) ( ON ?auto_19595 ?auto_19594 ) ( not ( = ?auto_19594 ?auto_19595 ) ) ( not ( = ?auto_19594 ?auto_19596 ) ) ( not ( = ?auto_19595 ?auto_19596 ) ) )
    :subtasks
    ( ( !STACK ?auto_19596 ?auto_19595 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19597 - BLOCK
      ?auto_19598 - BLOCK
      ?auto_19599 - BLOCK
    )
    :vars
    (
      ?auto_19600 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19598 ) ( ON-TABLE ?auto_19597 ) ( ON ?auto_19598 ?auto_19597 ) ( not ( = ?auto_19597 ?auto_19598 ) ) ( not ( = ?auto_19597 ?auto_19599 ) ) ( not ( = ?auto_19598 ?auto_19599 ) ) ( ON ?auto_19599 ?auto_19600 ) ( CLEAR ?auto_19599 ) ( HAND-EMPTY ) ( not ( = ?auto_19597 ?auto_19600 ) ) ( not ( = ?auto_19598 ?auto_19600 ) ) ( not ( = ?auto_19599 ?auto_19600 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19599 ?auto_19600 )
      ( MAKE-3PILE ?auto_19597 ?auto_19598 ?auto_19599 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19601 - BLOCK
      ?auto_19602 - BLOCK
      ?auto_19603 - BLOCK
    )
    :vars
    (
      ?auto_19604 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19601 ) ( not ( = ?auto_19601 ?auto_19602 ) ) ( not ( = ?auto_19601 ?auto_19603 ) ) ( not ( = ?auto_19602 ?auto_19603 ) ) ( ON ?auto_19603 ?auto_19604 ) ( CLEAR ?auto_19603 ) ( not ( = ?auto_19601 ?auto_19604 ) ) ( not ( = ?auto_19602 ?auto_19604 ) ) ( not ( = ?auto_19603 ?auto_19604 ) ) ( HOLDING ?auto_19602 ) ( CLEAR ?auto_19601 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19601 ?auto_19602 )
      ( MAKE-3PILE ?auto_19601 ?auto_19602 ?auto_19603 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19605 - BLOCK
      ?auto_19606 - BLOCK
      ?auto_19607 - BLOCK
    )
    :vars
    (
      ?auto_19608 - BLOCK
      ?auto_19609 - BLOCK
      ?auto_19610 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19605 ) ( not ( = ?auto_19605 ?auto_19606 ) ) ( not ( = ?auto_19605 ?auto_19607 ) ) ( not ( = ?auto_19606 ?auto_19607 ) ) ( ON ?auto_19607 ?auto_19608 ) ( not ( = ?auto_19605 ?auto_19608 ) ) ( not ( = ?auto_19606 ?auto_19608 ) ) ( not ( = ?auto_19607 ?auto_19608 ) ) ( CLEAR ?auto_19605 ) ( ON ?auto_19606 ?auto_19607 ) ( CLEAR ?auto_19606 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19609 ) ( ON ?auto_19610 ?auto_19609 ) ( ON ?auto_19608 ?auto_19610 ) ( not ( = ?auto_19609 ?auto_19610 ) ) ( not ( = ?auto_19609 ?auto_19608 ) ) ( not ( = ?auto_19609 ?auto_19607 ) ) ( not ( = ?auto_19609 ?auto_19606 ) ) ( not ( = ?auto_19610 ?auto_19608 ) ) ( not ( = ?auto_19610 ?auto_19607 ) ) ( not ( = ?auto_19610 ?auto_19606 ) ) ( not ( = ?auto_19605 ?auto_19609 ) ) ( not ( = ?auto_19605 ?auto_19610 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19609 ?auto_19610 ?auto_19608 ?auto_19607 )
      ( MAKE-3PILE ?auto_19605 ?auto_19606 ?auto_19607 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19611 - BLOCK
      ?auto_19612 - BLOCK
      ?auto_19613 - BLOCK
    )
    :vars
    (
      ?auto_19615 - BLOCK
      ?auto_19616 - BLOCK
      ?auto_19614 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19611 ?auto_19612 ) ) ( not ( = ?auto_19611 ?auto_19613 ) ) ( not ( = ?auto_19612 ?auto_19613 ) ) ( ON ?auto_19613 ?auto_19615 ) ( not ( = ?auto_19611 ?auto_19615 ) ) ( not ( = ?auto_19612 ?auto_19615 ) ) ( not ( = ?auto_19613 ?auto_19615 ) ) ( ON ?auto_19612 ?auto_19613 ) ( CLEAR ?auto_19612 ) ( ON-TABLE ?auto_19616 ) ( ON ?auto_19614 ?auto_19616 ) ( ON ?auto_19615 ?auto_19614 ) ( not ( = ?auto_19616 ?auto_19614 ) ) ( not ( = ?auto_19616 ?auto_19615 ) ) ( not ( = ?auto_19616 ?auto_19613 ) ) ( not ( = ?auto_19616 ?auto_19612 ) ) ( not ( = ?auto_19614 ?auto_19615 ) ) ( not ( = ?auto_19614 ?auto_19613 ) ) ( not ( = ?auto_19614 ?auto_19612 ) ) ( not ( = ?auto_19611 ?auto_19616 ) ) ( not ( = ?auto_19611 ?auto_19614 ) ) ( HOLDING ?auto_19611 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19611 )
      ( MAKE-3PILE ?auto_19611 ?auto_19612 ?auto_19613 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19617 - BLOCK
      ?auto_19618 - BLOCK
      ?auto_19619 - BLOCK
    )
    :vars
    (
      ?auto_19622 - BLOCK
      ?auto_19620 - BLOCK
      ?auto_19621 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19617 ?auto_19618 ) ) ( not ( = ?auto_19617 ?auto_19619 ) ) ( not ( = ?auto_19618 ?auto_19619 ) ) ( ON ?auto_19619 ?auto_19622 ) ( not ( = ?auto_19617 ?auto_19622 ) ) ( not ( = ?auto_19618 ?auto_19622 ) ) ( not ( = ?auto_19619 ?auto_19622 ) ) ( ON ?auto_19618 ?auto_19619 ) ( ON-TABLE ?auto_19620 ) ( ON ?auto_19621 ?auto_19620 ) ( ON ?auto_19622 ?auto_19621 ) ( not ( = ?auto_19620 ?auto_19621 ) ) ( not ( = ?auto_19620 ?auto_19622 ) ) ( not ( = ?auto_19620 ?auto_19619 ) ) ( not ( = ?auto_19620 ?auto_19618 ) ) ( not ( = ?auto_19621 ?auto_19622 ) ) ( not ( = ?auto_19621 ?auto_19619 ) ) ( not ( = ?auto_19621 ?auto_19618 ) ) ( not ( = ?auto_19617 ?auto_19620 ) ) ( not ( = ?auto_19617 ?auto_19621 ) ) ( ON ?auto_19617 ?auto_19618 ) ( CLEAR ?auto_19617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19620 ?auto_19621 ?auto_19622 ?auto_19619 ?auto_19618 )
      ( MAKE-3PILE ?auto_19617 ?auto_19618 ?auto_19619 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19625 - BLOCK
      ?auto_19626 - BLOCK
    )
    :vars
    (
      ?auto_19627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19627 ?auto_19626 ) ( CLEAR ?auto_19627 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19625 ) ( ON ?auto_19626 ?auto_19625 ) ( not ( = ?auto_19625 ?auto_19626 ) ) ( not ( = ?auto_19625 ?auto_19627 ) ) ( not ( = ?auto_19626 ?auto_19627 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19627 ?auto_19626 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19628 - BLOCK
      ?auto_19629 - BLOCK
    )
    :vars
    (
      ?auto_19630 - BLOCK
      ?auto_19631 - BLOCK
      ?auto_19632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19630 ?auto_19629 ) ( CLEAR ?auto_19630 ) ( ON-TABLE ?auto_19628 ) ( ON ?auto_19629 ?auto_19628 ) ( not ( = ?auto_19628 ?auto_19629 ) ) ( not ( = ?auto_19628 ?auto_19630 ) ) ( not ( = ?auto_19629 ?auto_19630 ) ) ( HOLDING ?auto_19631 ) ( CLEAR ?auto_19632 ) ( not ( = ?auto_19628 ?auto_19631 ) ) ( not ( = ?auto_19628 ?auto_19632 ) ) ( not ( = ?auto_19629 ?auto_19631 ) ) ( not ( = ?auto_19629 ?auto_19632 ) ) ( not ( = ?auto_19630 ?auto_19631 ) ) ( not ( = ?auto_19630 ?auto_19632 ) ) ( not ( = ?auto_19631 ?auto_19632 ) ) )
    :subtasks
    ( ( !STACK ?auto_19631 ?auto_19632 )
      ( MAKE-2PILE ?auto_19628 ?auto_19629 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19633 - BLOCK
      ?auto_19634 - BLOCK
    )
    :vars
    (
      ?auto_19636 - BLOCK
      ?auto_19635 - BLOCK
      ?auto_19637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19636 ?auto_19634 ) ( ON-TABLE ?auto_19633 ) ( ON ?auto_19634 ?auto_19633 ) ( not ( = ?auto_19633 ?auto_19634 ) ) ( not ( = ?auto_19633 ?auto_19636 ) ) ( not ( = ?auto_19634 ?auto_19636 ) ) ( CLEAR ?auto_19635 ) ( not ( = ?auto_19633 ?auto_19637 ) ) ( not ( = ?auto_19633 ?auto_19635 ) ) ( not ( = ?auto_19634 ?auto_19637 ) ) ( not ( = ?auto_19634 ?auto_19635 ) ) ( not ( = ?auto_19636 ?auto_19637 ) ) ( not ( = ?auto_19636 ?auto_19635 ) ) ( not ( = ?auto_19637 ?auto_19635 ) ) ( ON ?auto_19637 ?auto_19636 ) ( CLEAR ?auto_19637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19633 ?auto_19634 ?auto_19636 )
      ( MAKE-2PILE ?auto_19633 ?auto_19634 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19638 - BLOCK
      ?auto_19639 - BLOCK
    )
    :vars
    (
      ?auto_19642 - BLOCK
      ?auto_19640 - BLOCK
      ?auto_19641 - BLOCK
      ?auto_19643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19642 ?auto_19639 ) ( ON-TABLE ?auto_19638 ) ( ON ?auto_19639 ?auto_19638 ) ( not ( = ?auto_19638 ?auto_19639 ) ) ( not ( = ?auto_19638 ?auto_19642 ) ) ( not ( = ?auto_19639 ?auto_19642 ) ) ( not ( = ?auto_19638 ?auto_19640 ) ) ( not ( = ?auto_19638 ?auto_19641 ) ) ( not ( = ?auto_19639 ?auto_19640 ) ) ( not ( = ?auto_19639 ?auto_19641 ) ) ( not ( = ?auto_19642 ?auto_19640 ) ) ( not ( = ?auto_19642 ?auto_19641 ) ) ( not ( = ?auto_19640 ?auto_19641 ) ) ( ON ?auto_19640 ?auto_19642 ) ( CLEAR ?auto_19640 ) ( HOLDING ?auto_19641 ) ( CLEAR ?auto_19643 ) ( ON-TABLE ?auto_19643 ) ( not ( = ?auto_19643 ?auto_19641 ) ) ( not ( = ?auto_19638 ?auto_19643 ) ) ( not ( = ?auto_19639 ?auto_19643 ) ) ( not ( = ?auto_19642 ?auto_19643 ) ) ( not ( = ?auto_19640 ?auto_19643 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19643 ?auto_19641 )
      ( MAKE-2PILE ?auto_19638 ?auto_19639 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20062 - BLOCK
      ?auto_20063 - BLOCK
    )
    :vars
    (
      ?auto_20064 - BLOCK
      ?auto_20065 - BLOCK
      ?auto_20066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20064 ?auto_20063 ) ( ON-TABLE ?auto_20062 ) ( ON ?auto_20063 ?auto_20062 ) ( not ( = ?auto_20062 ?auto_20063 ) ) ( not ( = ?auto_20062 ?auto_20064 ) ) ( not ( = ?auto_20063 ?auto_20064 ) ) ( not ( = ?auto_20062 ?auto_20065 ) ) ( not ( = ?auto_20062 ?auto_20066 ) ) ( not ( = ?auto_20063 ?auto_20065 ) ) ( not ( = ?auto_20063 ?auto_20066 ) ) ( not ( = ?auto_20064 ?auto_20065 ) ) ( not ( = ?auto_20064 ?auto_20066 ) ) ( not ( = ?auto_20065 ?auto_20066 ) ) ( ON ?auto_20065 ?auto_20064 ) ( ON ?auto_20066 ?auto_20065 ) ( CLEAR ?auto_20066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20062 ?auto_20063 ?auto_20064 ?auto_20065 )
      ( MAKE-2PILE ?auto_20062 ?auto_20063 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19650 - BLOCK
      ?auto_19651 - BLOCK
    )
    :vars
    (
      ?auto_19654 - BLOCK
      ?auto_19652 - BLOCK
      ?auto_19655 - BLOCK
      ?auto_19653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19654 ?auto_19651 ) ( ON-TABLE ?auto_19650 ) ( ON ?auto_19651 ?auto_19650 ) ( not ( = ?auto_19650 ?auto_19651 ) ) ( not ( = ?auto_19650 ?auto_19654 ) ) ( not ( = ?auto_19651 ?auto_19654 ) ) ( not ( = ?auto_19650 ?auto_19652 ) ) ( not ( = ?auto_19650 ?auto_19655 ) ) ( not ( = ?auto_19651 ?auto_19652 ) ) ( not ( = ?auto_19651 ?auto_19655 ) ) ( not ( = ?auto_19654 ?auto_19652 ) ) ( not ( = ?auto_19654 ?auto_19655 ) ) ( not ( = ?auto_19652 ?auto_19655 ) ) ( ON ?auto_19652 ?auto_19654 ) ( not ( = ?auto_19653 ?auto_19655 ) ) ( not ( = ?auto_19650 ?auto_19653 ) ) ( not ( = ?auto_19651 ?auto_19653 ) ) ( not ( = ?auto_19654 ?auto_19653 ) ) ( not ( = ?auto_19652 ?auto_19653 ) ) ( ON ?auto_19655 ?auto_19652 ) ( CLEAR ?auto_19655 ) ( HOLDING ?auto_19653 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19653 )
      ( MAKE-2PILE ?auto_19650 ?auto_19651 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19656 - BLOCK
      ?auto_19657 - BLOCK
    )
    :vars
    (
      ?auto_19659 - BLOCK
      ?auto_19660 - BLOCK
      ?auto_19661 - BLOCK
      ?auto_19658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19659 ?auto_19657 ) ( ON-TABLE ?auto_19656 ) ( ON ?auto_19657 ?auto_19656 ) ( not ( = ?auto_19656 ?auto_19657 ) ) ( not ( = ?auto_19656 ?auto_19659 ) ) ( not ( = ?auto_19657 ?auto_19659 ) ) ( not ( = ?auto_19656 ?auto_19660 ) ) ( not ( = ?auto_19656 ?auto_19661 ) ) ( not ( = ?auto_19657 ?auto_19660 ) ) ( not ( = ?auto_19657 ?auto_19661 ) ) ( not ( = ?auto_19659 ?auto_19660 ) ) ( not ( = ?auto_19659 ?auto_19661 ) ) ( not ( = ?auto_19660 ?auto_19661 ) ) ( ON ?auto_19660 ?auto_19659 ) ( not ( = ?auto_19658 ?auto_19661 ) ) ( not ( = ?auto_19656 ?auto_19658 ) ) ( not ( = ?auto_19657 ?auto_19658 ) ) ( not ( = ?auto_19659 ?auto_19658 ) ) ( not ( = ?auto_19660 ?auto_19658 ) ) ( ON ?auto_19661 ?auto_19660 ) ( ON ?auto_19658 ?auto_19661 ) ( CLEAR ?auto_19658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19656 ?auto_19657 ?auto_19659 ?auto_19660 ?auto_19661 )
      ( MAKE-2PILE ?auto_19656 ?auto_19657 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19666 - BLOCK
      ?auto_19667 - BLOCK
      ?auto_19668 - BLOCK
      ?auto_19669 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_19669 ) ( CLEAR ?auto_19668 ) ( ON-TABLE ?auto_19666 ) ( ON ?auto_19667 ?auto_19666 ) ( ON ?auto_19668 ?auto_19667 ) ( not ( = ?auto_19666 ?auto_19667 ) ) ( not ( = ?auto_19666 ?auto_19668 ) ) ( not ( = ?auto_19666 ?auto_19669 ) ) ( not ( = ?auto_19667 ?auto_19668 ) ) ( not ( = ?auto_19667 ?auto_19669 ) ) ( not ( = ?auto_19668 ?auto_19669 ) ) )
    :subtasks
    ( ( !STACK ?auto_19669 ?auto_19668 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19670 - BLOCK
      ?auto_19671 - BLOCK
      ?auto_19672 - BLOCK
      ?auto_19673 - BLOCK
    )
    :vars
    (
      ?auto_19674 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19672 ) ( ON-TABLE ?auto_19670 ) ( ON ?auto_19671 ?auto_19670 ) ( ON ?auto_19672 ?auto_19671 ) ( not ( = ?auto_19670 ?auto_19671 ) ) ( not ( = ?auto_19670 ?auto_19672 ) ) ( not ( = ?auto_19670 ?auto_19673 ) ) ( not ( = ?auto_19671 ?auto_19672 ) ) ( not ( = ?auto_19671 ?auto_19673 ) ) ( not ( = ?auto_19672 ?auto_19673 ) ) ( ON ?auto_19673 ?auto_19674 ) ( CLEAR ?auto_19673 ) ( HAND-EMPTY ) ( not ( = ?auto_19670 ?auto_19674 ) ) ( not ( = ?auto_19671 ?auto_19674 ) ) ( not ( = ?auto_19672 ?auto_19674 ) ) ( not ( = ?auto_19673 ?auto_19674 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19673 ?auto_19674 )
      ( MAKE-4PILE ?auto_19670 ?auto_19671 ?auto_19672 ?auto_19673 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19675 - BLOCK
      ?auto_19676 - BLOCK
      ?auto_19677 - BLOCK
      ?auto_19678 - BLOCK
    )
    :vars
    (
      ?auto_19679 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19675 ) ( ON ?auto_19676 ?auto_19675 ) ( not ( = ?auto_19675 ?auto_19676 ) ) ( not ( = ?auto_19675 ?auto_19677 ) ) ( not ( = ?auto_19675 ?auto_19678 ) ) ( not ( = ?auto_19676 ?auto_19677 ) ) ( not ( = ?auto_19676 ?auto_19678 ) ) ( not ( = ?auto_19677 ?auto_19678 ) ) ( ON ?auto_19678 ?auto_19679 ) ( CLEAR ?auto_19678 ) ( not ( = ?auto_19675 ?auto_19679 ) ) ( not ( = ?auto_19676 ?auto_19679 ) ) ( not ( = ?auto_19677 ?auto_19679 ) ) ( not ( = ?auto_19678 ?auto_19679 ) ) ( HOLDING ?auto_19677 ) ( CLEAR ?auto_19676 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19675 ?auto_19676 ?auto_19677 )
      ( MAKE-4PILE ?auto_19675 ?auto_19676 ?auto_19677 ?auto_19678 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19680 - BLOCK
      ?auto_19681 - BLOCK
      ?auto_19682 - BLOCK
      ?auto_19683 - BLOCK
    )
    :vars
    (
      ?auto_19684 - BLOCK
      ?auto_19685 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19680 ) ( ON ?auto_19681 ?auto_19680 ) ( not ( = ?auto_19680 ?auto_19681 ) ) ( not ( = ?auto_19680 ?auto_19682 ) ) ( not ( = ?auto_19680 ?auto_19683 ) ) ( not ( = ?auto_19681 ?auto_19682 ) ) ( not ( = ?auto_19681 ?auto_19683 ) ) ( not ( = ?auto_19682 ?auto_19683 ) ) ( ON ?auto_19683 ?auto_19684 ) ( not ( = ?auto_19680 ?auto_19684 ) ) ( not ( = ?auto_19681 ?auto_19684 ) ) ( not ( = ?auto_19682 ?auto_19684 ) ) ( not ( = ?auto_19683 ?auto_19684 ) ) ( CLEAR ?auto_19681 ) ( ON ?auto_19682 ?auto_19683 ) ( CLEAR ?auto_19682 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19685 ) ( ON ?auto_19684 ?auto_19685 ) ( not ( = ?auto_19685 ?auto_19684 ) ) ( not ( = ?auto_19685 ?auto_19683 ) ) ( not ( = ?auto_19685 ?auto_19682 ) ) ( not ( = ?auto_19680 ?auto_19685 ) ) ( not ( = ?auto_19681 ?auto_19685 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19685 ?auto_19684 ?auto_19683 )
      ( MAKE-4PILE ?auto_19680 ?auto_19681 ?auto_19682 ?auto_19683 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19686 - BLOCK
      ?auto_19687 - BLOCK
      ?auto_19688 - BLOCK
      ?auto_19689 - BLOCK
    )
    :vars
    (
      ?auto_19690 - BLOCK
      ?auto_19691 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19686 ) ( not ( = ?auto_19686 ?auto_19687 ) ) ( not ( = ?auto_19686 ?auto_19688 ) ) ( not ( = ?auto_19686 ?auto_19689 ) ) ( not ( = ?auto_19687 ?auto_19688 ) ) ( not ( = ?auto_19687 ?auto_19689 ) ) ( not ( = ?auto_19688 ?auto_19689 ) ) ( ON ?auto_19689 ?auto_19690 ) ( not ( = ?auto_19686 ?auto_19690 ) ) ( not ( = ?auto_19687 ?auto_19690 ) ) ( not ( = ?auto_19688 ?auto_19690 ) ) ( not ( = ?auto_19689 ?auto_19690 ) ) ( ON ?auto_19688 ?auto_19689 ) ( CLEAR ?auto_19688 ) ( ON-TABLE ?auto_19691 ) ( ON ?auto_19690 ?auto_19691 ) ( not ( = ?auto_19691 ?auto_19690 ) ) ( not ( = ?auto_19691 ?auto_19689 ) ) ( not ( = ?auto_19691 ?auto_19688 ) ) ( not ( = ?auto_19686 ?auto_19691 ) ) ( not ( = ?auto_19687 ?auto_19691 ) ) ( HOLDING ?auto_19687 ) ( CLEAR ?auto_19686 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19686 ?auto_19687 )
      ( MAKE-4PILE ?auto_19686 ?auto_19687 ?auto_19688 ?auto_19689 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19692 - BLOCK
      ?auto_19693 - BLOCK
      ?auto_19694 - BLOCK
      ?auto_19695 - BLOCK
    )
    :vars
    (
      ?auto_19696 - BLOCK
      ?auto_19697 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19692 ) ( not ( = ?auto_19692 ?auto_19693 ) ) ( not ( = ?auto_19692 ?auto_19694 ) ) ( not ( = ?auto_19692 ?auto_19695 ) ) ( not ( = ?auto_19693 ?auto_19694 ) ) ( not ( = ?auto_19693 ?auto_19695 ) ) ( not ( = ?auto_19694 ?auto_19695 ) ) ( ON ?auto_19695 ?auto_19696 ) ( not ( = ?auto_19692 ?auto_19696 ) ) ( not ( = ?auto_19693 ?auto_19696 ) ) ( not ( = ?auto_19694 ?auto_19696 ) ) ( not ( = ?auto_19695 ?auto_19696 ) ) ( ON ?auto_19694 ?auto_19695 ) ( ON-TABLE ?auto_19697 ) ( ON ?auto_19696 ?auto_19697 ) ( not ( = ?auto_19697 ?auto_19696 ) ) ( not ( = ?auto_19697 ?auto_19695 ) ) ( not ( = ?auto_19697 ?auto_19694 ) ) ( not ( = ?auto_19692 ?auto_19697 ) ) ( not ( = ?auto_19693 ?auto_19697 ) ) ( CLEAR ?auto_19692 ) ( ON ?auto_19693 ?auto_19694 ) ( CLEAR ?auto_19693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19697 ?auto_19696 ?auto_19695 ?auto_19694 )
      ( MAKE-4PILE ?auto_19692 ?auto_19693 ?auto_19694 ?auto_19695 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19698 - BLOCK
      ?auto_19699 - BLOCK
      ?auto_19700 - BLOCK
      ?auto_19701 - BLOCK
    )
    :vars
    (
      ?auto_19702 - BLOCK
      ?auto_19703 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19698 ?auto_19699 ) ) ( not ( = ?auto_19698 ?auto_19700 ) ) ( not ( = ?auto_19698 ?auto_19701 ) ) ( not ( = ?auto_19699 ?auto_19700 ) ) ( not ( = ?auto_19699 ?auto_19701 ) ) ( not ( = ?auto_19700 ?auto_19701 ) ) ( ON ?auto_19701 ?auto_19702 ) ( not ( = ?auto_19698 ?auto_19702 ) ) ( not ( = ?auto_19699 ?auto_19702 ) ) ( not ( = ?auto_19700 ?auto_19702 ) ) ( not ( = ?auto_19701 ?auto_19702 ) ) ( ON ?auto_19700 ?auto_19701 ) ( ON-TABLE ?auto_19703 ) ( ON ?auto_19702 ?auto_19703 ) ( not ( = ?auto_19703 ?auto_19702 ) ) ( not ( = ?auto_19703 ?auto_19701 ) ) ( not ( = ?auto_19703 ?auto_19700 ) ) ( not ( = ?auto_19698 ?auto_19703 ) ) ( not ( = ?auto_19699 ?auto_19703 ) ) ( ON ?auto_19699 ?auto_19700 ) ( CLEAR ?auto_19699 ) ( HOLDING ?auto_19698 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19698 )
      ( MAKE-4PILE ?auto_19698 ?auto_19699 ?auto_19700 ?auto_19701 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19704 - BLOCK
      ?auto_19705 - BLOCK
      ?auto_19706 - BLOCK
      ?auto_19707 - BLOCK
    )
    :vars
    (
      ?auto_19708 - BLOCK
      ?auto_19709 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19704 ?auto_19705 ) ) ( not ( = ?auto_19704 ?auto_19706 ) ) ( not ( = ?auto_19704 ?auto_19707 ) ) ( not ( = ?auto_19705 ?auto_19706 ) ) ( not ( = ?auto_19705 ?auto_19707 ) ) ( not ( = ?auto_19706 ?auto_19707 ) ) ( ON ?auto_19707 ?auto_19708 ) ( not ( = ?auto_19704 ?auto_19708 ) ) ( not ( = ?auto_19705 ?auto_19708 ) ) ( not ( = ?auto_19706 ?auto_19708 ) ) ( not ( = ?auto_19707 ?auto_19708 ) ) ( ON ?auto_19706 ?auto_19707 ) ( ON-TABLE ?auto_19709 ) ( ON ?auto_19708 ?auto_19709 ) ( not ( = ?auto_19709 ?auto_19708 ) ) ( not ( = ?auto_19709 ?auto_19707 ) ) ( not ( = ?auto_19709 ?auto_19706 ) ) ( not ( = ?auto_19704 ?auto_19709 ) ) ( not ( = ?auto_19705 ?auto_19709 ) ) ( ON ?auto_19705 ?auto_19706 ) ( ON ?auto_19704 ?auto_19705 ) ( CLEAR ?auto_19704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19709 ?auto_19708 ?auto_19707 ?auto_19706 ?auto_19705 )
      ( MAKE-4PILE ?auto_19704 ?auto_19705 ?auto_19706 ?auto_19707 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19711 - BLOCK
    )
    :vars
    (
      ?auto_19712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19712 ?auto_19711 ) ( CLEAR ?auto_19712 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19711 ) ( not ( = ?auto_19711 ?auto_19712 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19712 ?auto_19711 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19713 - BLOCK
    )
    :vars
    (
      ?auto_19714 - BLOCK
      ?auto_19715 - BLOCK
      ?auto_19716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19714 ?auto_19713 ) ( CLEAR ?auto_19714 ) ( ON-TABLE ?auto_19713 ) ( not ( = ?auto_19713 ?auto_19714 ) ) ( HOLDING ?auto_19715 ) ( CLEAR ?auto_19716 ) ( not ( = ?auto_19713 ?auto_19715 ) ) ( not ( = ?auto_19713 ?auto_19716 ) ) ( not ( = ?auto_19714 ?auto_19715 ) ) ( not ( = ?auto_19714 ?auto_19716 ) ) ( not ( = ?auto_19715 ?auto_19716 ) ) )
    :subtasks
    ( ( !STACK ?auto_19715 ?auto_19716 )
      ( MAKE-1PILE ?auto_19713 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19717 - BLOCK
    )
    :vars
    (
      ?auto_19719 - BLOCK
      ?auto_19718 - BLOCK
      ?auto_19720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19719 ?auto_19717 ) ( ON-TABLE ?auto_19717 ) ( not ( = ?auto_19717 ?auto_19719 ) ) ( CLEAR ?auto_19718 ) ( not ( = ?auto_19717 ?auto_19720 ) ) ( not ( = ?auto_19717 ?auto_19718 ) ) ( not ( = ?auto_19719 ?auto_19720 ) ) ( not ( = ?auto_19719 ?auto_19718 ) ) ( not ( = ?auto_19720 ?auto_19718 ) ) ( ON ?auto_19720 ?auto_19719 ) ( CLEAR ?auto_19720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19717 ?auto_19719 )
      ( MAKE-1PILE ?auto_19717 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19721 - BLOCK
    )
    :vars
    (
      ?auto_19723 - BLOCK
      ?auto_19724 - BLOCK
      ?auto_19722 - BLOCK
      ?auto_19726 - BLOCK
      ?auto_19725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19723 ?auto_19721 ) ( ON-TABLE ?auto_19721 ) ( not ( = ?auto_19721 ?auto_19723 ) ) ( not ( = ?auto_19721 ?auto_19724 ) ) ( not ( = ?auto_19721 ?auto_19722 ) ) ( not ( = ?auto_19723 ?auto_19724 ) ) ( not ( = ?auto_19723 ?auto_19722 ) ) ( not ( = ?auto_19724 ?auto_19722 ) ) ( ON ?auto_19724 ?auto_19723 ) ( CLEAR ?auto_19724 ) ( HOLDING ?auto_19722 ) ( CLEAR ?auto_19726 ) ( ON-TABLE ?auto_19725 ) ( ON ?auto_19726 ?auto_19725 ) ( not ( = ?auto_19725 ?auto_19726 ) ) ( not ( = ?auto_19725 ?auto_19722 ) ) ( not ( = ?auto_19726 ?auto_19722 ) ) ( not ( = ?auto_19721 ?auto_19726 ) ) ( not ( = ?auto_19721 ?auto_19725 ) ) ( not ( = ?auto_19723 ?auto_19726 ) ) ( not ( = ?auto_19723 ?auto_19725 ) ) ( not ( = ?auto_19724 ?auto_19726 ) ) ( not ( = ?auto_19724 ?auto_19725 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19725 ?auto_19726 ?auto_19722 )
      ( MAKE-1PILE ?auto_19721 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19727 - BLOCK
    )
    :vars
    (
      ?auto_19730 - BLOCK
      ?auto_19728 - BLOCK
      ?auto_19729 - BLOCK
      ?auto_19732 - BLOCK
      ?auto_19731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19730 ?auto_19727 ) ( ON-TABLE ?auto_19727 ) ( not ( = ?auto_19727 ?auto_19730 ) ) ( not ( = ?auto_19727 ?auto_19728 ) ) ( not ( = ?auto_19727 ?auto_19729 ) ) ( not ( = ?auto_19730 ?auto_19728 ) ) ( not ( = ?auto_19730 ?auto_19729 ) ) ( not ( = ?auto_19728 ?auto_19729 ) ) ( ON ?auto_19728 ?auto_19730 ) ( CLEAR ?auto_19732 ) ( ON-TABLE ?auto_19731 ) ( ON ?auto_19732 ?auto_19731 ) ( not ( = ?auto_19731 ?auto_19732 ) ) ( not ( = ?auto_19731 ?auto_19729 ) ) ( not ( = ?auto_19732 ?auto_19729 ) ) ( not ( = ?auto_19727 ?auto_19732 ) ) ( not ( = ?auto_19727 ?auto_19731 ) ) ( not ( = ?auto_19730 ?auto_19732 ) ) ( not ( = ?auto_19730 ?auto_19731 ) ) ( not ( = ?auto_19728 ?auto_19732 ) ) ( not ( = ?auto_19728 ?auto_19731 ) ) ( ON ?auto_19729 ?auto_19728 ) ( CLEAR ?auto_19729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19727 ?auto_19730 ?auto_19728 )
      ( MAKE-1PILE ?auto_19727 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19733 - BLOCK
    )
    :vars
    (
      ?auto_19736 - BLOCK
      ?auto_19735 - BLOCK
      ?auto_19737 - BLOCK
      ?auto_19734 - BLOCK
      ?auto_19738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19736 ?auto_19733 ) ( ON-TABLE ?auto_19733 ) ( not ( = ?auto_19733 ?auto_19736 ) ) ( not ( = ?auto_19733 ?auto_19735 ) ) ( not ( = ?auto_19733 ?auto_19737 ) ) ( not ( = ?auto_19736 ?auto_19735 ) ) ( not ( = ?auto_19736 ?auto_19737 ) ) ( not ( = ?auto_19735 ?auto_19737 ) ) ( ON ?auto_19735 ?auto_19736 ) ( ON-TABLE ?auto_19734 ) ( not ( = ?auto_19734 ?auto_19738 ) ) ( not ( = ?auto_19734 ?auto_19737 ) ) ( not ( = ?auto_19738 ?auto_19737 ) ) ( not ( = ?auto_19733 ?auto_19738 ) ) ( not ( = ?auto_19733 ?auto_19734 ) ) ( not ( = ?auto_19736 ?auto_19738 ) ) ( not ( = ?auto_19736 ?auto_19734 ) ) ( not ( = ?auto_19735 ?auto_19738 ) ) ( not ( = ?auto_19735 ?auto_19734 ) ) ( ON ?auto_19737 ?auto_19735 ) ( CLEAR ?auto_19737 ) ( HOLDING ?auto_19738 ) ( CLEAR ?auto_19734 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19734 ?auto_19738 )
      ( MAKE-1PILE ?auto_19733 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20202 - BLOCK
    )
    :vars
    (
      ?auto_20206 - BLOCK
      ?auto_20205 - BLOCK
      ?auto_20203 - BLOCK
      ?auto_20204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20206 ?auto_20202 ) ( ON-TABLE ?auto_20202 ) ( not ( = ?auto_20202 ?auto_20206 ) ) ( not ( = ?auto_20202 ?auto_20205 ) ) ( not ( = ?auto_20202 ?auto_20203 ) ) ( not ( = ?auto_20206 ?auto_20205 ) ) ( not ( = ?auto_20206 ?auto_20203 ) ) ( not ( = ?auto_20205 ?auto_20203 ) ) ( ON ?auto_20205 ?auto_20206 ) ( not ( = ?auto_20204 ?auto_20203 ) ) ( not ( = ?auto_20202 ?auto_20204 ) ) ( not ( = ?auto_20206 ?auto_20204 ) ) ( not ( = ?auto_20205 ?auto_20204 ) ) ( ON ?auto_20203 ?auto_20205 ) ( ON ?auto_20204 ?auto_20203 ) ( CLEAR ?auto_20204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20202 ?auto_20206 ?auto_20205 ?auto_20203 )
      ( MAKE-1PILE ?auto_20202 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19745 - BLOCK
    )
    :vars
    (
      ?auto_19748 - BLOCK
      ?auto_19750 - BLOCK
      ?auto_19749 - BLOCK
      ?auto_19746 - BLOCK
      ?auto_19747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19748 ?auto_19745 ) ( ON-TABLE ?auto_19745 ) ( not ( = ?auto_19745 ?auto_19748 ) ) ( not ( = ?auto_19745 ?auto_19750 ) ) ( not ( = ?auto_19745 ?auto_19749 ) ) ( not ( = ?auto_19748 ?auto_19750 ) ) ( not ( = ?auto_19748 ?auto_19749 ) ) ( not ( = ?auto_19750 ?auto_19749 ) ) ( ON ?auto_19750 ?auto_19748 ) ( not ( = ?auto_19746 ?auto_19747 ) ) ( not ( = ?auto_19746 ?auto_19749 ) ) ( not ( = ?auto_19747 ?auto_19749 ) ) ( not ( = ?auto_19745 ?auto_19747 ) ) ( not ( = ?auto_19745 ?auto_19746 ) ) ( not ( = ?auto_19748 ?auto_19747 ) ) ( not ( = ?auto_19748 ?auto_19746 ) ) ( not ( = ?auto_19750 ?auto_19747 ) ) ( not ( = ?auto_19750 ?auto_19746 ) ) ( ON ?auto_19749 ?auto_19750 ) ( ON ?auto_19747 ?auto_19749 ) ( CLEAR ?auto_19747 ) ( HOLDING ?auto_19746 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19746 )
      ( MAKE-1PILE ?auto_19745 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19751 - BLOCK
    )
    :vars
    (
      ?auto_19752 - BLOCK
      ?auto_19753 - BLOCK
      ?auto_19755 - BLOCK
      ?auto_19754 - BLOCK
      ?auto_19756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19752 ?auto_19751 ) ( ON-TABLE ?auto_19751 ) ( not ( = ?auto_19751 ?auto_19752 ) ) ( not ( = ?auto_19751 ?auto_19753 ) ) ( not ( = ?auto_19751 ?auto_19755 ) ) ( not ( = ?auto_19752 ?auto_19753 ) ) ( not ( = ?auto_19752 ?auto_19755 ) ) ( not ( = ?auto_19753 ?auto_19755 ) ) ( ON ?auto_19753 ?auto_19752 ) ( not ( = ?auto_19754 ?auto_19756 ) ) ( not ( = ?auto_19754 ?auto_19755 ) ) ( not ( = ?auto_19756 ?auto_19755 ) ) ( not ( = ?auto_19751 ?auto_19756 ) ) ( not ( = ?auto_19751 ?auto_19754 ) ) ( not ( = ?auto_19752 ?auto_19756 ) ) ( not ( = ?auto_19752 ?auto_19754 ) ) ( not ( = ?auto_19753 ?auto_19756 ) ) ( not ( = ?auto_19753 ?auto_19754 ) ) ( ON ?auto_19755 ?auto_19753 ) ( ON ?auto_19756 ?auto_19755 ) ( ON ?auto_19754 ?auto_19756 ) ( CLEAR ?auto_19754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19751 ?auto_19752 ?auto_19753 ?auto_19755 ?auto_19756 )
      ( MAKE-1PILE ?auto_19751 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19762 - BLOCK
      ?auto_19763 - BLOCK
      ?auto_19764 - BLOCK
      ?auto_19765 - BLOCK
      ?auto_19766 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_19766 ) ( CLEAR ?auto_19765 ) ( ON-TABLE ?auto_19762 ) ( ON ?auto_19763 ?auto_19762 ) ( ON ?auto_19764 ?auto_19763 ) ( ON ?auto_19765 ?auto_19764 ) ( not ( = ?auto_19762 ?auto_19763 ) ) ( not ( = ?auto_19762 ?auto_19764 ) ) ( not ( = ?auto_19762 ?auto_19765 ) ) ( not ( = ?auto_19762 ?auto_19766 ) ) ( not ( = ?auto_19763 ?auto_19764 ) ) ( not ( = ?auto_19763 ?auto_19765 ) ) ( not ( = ?auto_19763 ?auto_19766 ) ) ( not ( = ?auto_19764 ?auto_19765 ) ) ( not ( = ?auto_19764 ?auto_19766 ) ) ( not ( = ?auto_19765 ?auto_19766 ) ) )
    :subtasks
    ( ( !STACK ?auto_19766 ?auto_19765 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19767 - BLOCK
      ?auto_19768 - BLOCK
      ?auto_19769 - BLOCK
      ?auto_19770 - BLOCK
      ?auto_19771 - BLOCK
    )
    :vars
    (
      ?auto_19772 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19770 ) ( ON-TABLE ?auto_19767 ) ( ON ?auto_19768 ?auto_19767 ) ( ON ?auto_19769 ?auto_19768 ) ( ON ?auto_19770 ?auto_19769 ) ( not ( = ?auto_19767 ?auto_19768 ) ) ( not ( = ?auto_19767 ?auto_19769 ) ) ( not ( = ?auto_19767 ?auto_19770 ) ) ( not ( = ?auto_19767 ?auto_19771 ) ) ( not ( = ?auto_19768 ?auto_19769 ) ) ( not ( = ?auto_19768 ?auto_19770 ) ) ( not ( = ?auto_19768 ?auto_19771 ) ) ( not ( = ?auto_19769 ?auto_19770 ) ) ( not ( = ?auto_19769 ?auto_19771 ) ) ( not ( = ?auto_19770 ?auto_19771 ) ) ( ON ?auto_19771 ?auto_19772 ) ( CLEAR ?auto_19771 ) ( HAND-EMPTY ) ( not ( = ?auto_19767 ?auto_19772 ) ) ( not ( = ?auto_19768 ?auto_19772 ) ) ( not ( = ?auto_19769 ?auto_19772 ) ) ( not ( = ?auto_19770 ?auto_19772 ) ) ( not ( = ?auto_19771 ?auto_19772 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19771 ?auto_19772 )
      ( MAKE-5PILE ?auto_19767 ?auto_19768 ?auto_19769 ?auto_19770 ?auto_19771 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19773 - BLOCK
      ?auto_19774 - BLOCK
      ?auto_19775 - BLOCK
      ?auto_19776 - BLOCK
      ?auto_19777 - BLOCK
    )
    :vars
    (
      ?auto_19778 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19773 ) ( ON ?auto_19774 ?auto_19773 ) ( ON ?auto_19775 ?auto_19774 ) ( not ( = ?auto_19773 ?auto_19774 ) ) ( not ( = ?auto_19773 ?auto_19775 ) ) ( not ( = ?auto_19773 ?auto_19776 ) ) ( not ( = ?auto_19773 ?auto_19777 ) ) ( not ( = ?auto_19774 ?auto_19775 ) ) ( not ( = ?auto_19774 ?auto_19776 ) ) ( not ( = ?auto_19774 ?auto_19777 ) ) ( not ( = ?auto_19775 ?auto_19776 ) ) ( not ( = ?auto_19775 ?auto_19777 ) ) ( not ( = ?auto_19776 ?auto_19777 ) ) ( ON ?auto_19777 ?auto_19778 ) ( CLEAR ?auto_19777 ) ( not ( = ?auto_19773 ?auto_19778 ) ) ( not ( = ?auto_19774 ?auto_19778 ) ) ( not ( = ?auto_19775 ?auto_19778 ) ) ( not ( = ?auto_19776 ?auto_19778 ) ) ( not ( = ?auto_19777 ?auto_19778 ) ) ( HOLDING ?auto_19776 ) ( CLEAR ?auto_19775 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19773 ?auto_19774 ?auto_19775 ?auto_19776 )
      ( MAKE-5PILE ?auto_19773 ?auto_19774 ?auto_19775 ?auto_19776 ?auto_19777 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19779 - BLOCK
      ?auto_19780 - BLOCK
      ?auto_19781 - BLOCK
      ?auto_19782 - BLOCK
      ?auto_19783 - BLOCK
    )
    :vars
    (
      ?auto_19784 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19779 ) ( ON ?auto_19780 ?auto_19779 ) ( ON ?auto_19781 ?auto_19780 ) ( not ( = ?auto_19779 ?auto_19780 ) ) ( not ( = ?auto_19779 ?auto_19781 ) ) ( not ( = ?auto_19779 ?auto_19782 ) ) ( not ( = ?auto_19779 ?auto_19783 ) ) ( not ( = ?auto_19780 ?auto_19781 ) ) ( not ( = ?auto_19780 ?auto_19782 ) ) ( not ( = ?auto_19780 ?auto_19783 ) ) ( not ( = ?auto_19781 ?auto_19782 ) ) ( not ( = ?auto_19781 ?auto_19783 ) ) ( not ( = ?auto_19782 ?auto_19783 ) ) ( ON ?auto_19783 ?auto_19784 ) ( not ( = ?auto_19779 ?auto_19784 ) ) ( not ( = ?auto_19780 ?auto_19784 ) ) ( not ( = ?auto_19781 ?auto_19784 ) ) ( not ( = ?auto_19782 ?auto_19784 ) ) ( not ( = ?auto_19783 ?auto_19784 ) ) ( CLEAR ?auto_19781 ) ( ON ?auto_19782 ?auto_19783 ) ( CLEAR ?auto_19782 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19784 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19784 ?auto_19783 )
      ( MAKE-5PILE ?auto_19779 ?auto_19780 ?auto_19781 ?auto_19782 ?auto_19783 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19785 - BLOCK
      ?auto_19786 - BLOCK
      ?auto_19787 - BLOCK
      ?auto_19788 - BLOCK
      ?auto_19789 - BLOCK
    )
    :vars
    (
      ?auto_19790 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19785 ) ( ON ?auto_19786 ?auto_19785 ) ( not ( = ?auto_19785 ?auto_19786 ) ) ( not ( = ?auto_19785 ?auto_19787 ) ) ( not ( = ?auto_19785 ?auto_19788 ) ) ( not ( = ?auto_19785 ?auto_19789 ) ) ( not ( = ?auto_19786 ?auto_19787 ) ) ( not ( = ?auto_19786 ?auto_19788 ) ) ( not ( = ?auto_19786 ?auto_19789 ) ) ( not ( = ?auto_19787 ?auto_19788 ) ) ( not ( = ?auto_19787 ?auto_19789 ) ) ( not ( = ?auto_19788 ?auto_19789 ) ) ( ON ?auto_19789 ?auto_19790 ) ( not ( = ?auto_19785 ?auto_19790 ) ) ( not ( = ?auto_19786 ?auto_19790 ) ) ( not ( = ?auto_19787 ?auto_19790 ) ) ( not ( = ?auto_19788 ?auto_19790 ) ) ( not ( = ?auto_19789 ?auto_19790 ) ) ( ON ?auto_19788 ?auto_19789 ) ( CLEAR ?auto_19788 ) ( ON-TABLE ?auto_19790 ) ( HOLDING ?auto_19787 ) ( CLEAR ?auto_19786 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19785 ?auto_19786 ?auto_19787 )
      ( MAKE-5PILE ?auto_19785 ?auto_19786 ?auto_19787 ?auto_19788 ?auto_19789 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19791 - BLOCK
      ?auto_19792 - BLOCK
      ?auto_19793 - BLOCK
      ?auto_19794 - BLOCK
      ?auto_19795 - BLOCK
    )
    :vars
    (
      ?auto_19796 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19791 ) ( ON ?auto_19792 ?auto_19791 ) ( not ( = ?auto_19791 ?auto_19792 ) ) ( not ( = ?auto_19791 ?auto_19793 ) ) ( not ( = ?auto_19791 ?auto_19794 ) ) ( not ( = ?auto_19791 ?auto_19795 ) ) ( not ( = ?auto_19792 ?auto_19793 ) ) ( not ( = ?auto_19792 ?auto_19794 ) ) ( not ( = ?auto_19792 ?auto_19795 ) ) ( not ( = ?auto_19793 ?auto_19794 ) ) ( not ( = ?auto_19793 ?auto_19795 ) ) ( not ( = ?auto_19794 ?auto_19795 ) ) ( ON ?auto_19795 ?auto_19796 ) ( not ( = ?auto_19791 ?auto_19796 ) ) ( not ( = ?auto_19792 ?auto_19796 ) ) ( not ( = ?auto_19793 ?auto_19796 ) ) ( not ( = ?auto_19794 ?auto_19796 ) ) ( not ( = ?auto_19795 ?auto_19796 ) ) ( ON ?auto_19794 ?auto_19795 ) ( ON-TABLE ?auto_19796 ) ( CLEAR ?auto_19792 ) ( ON ?auto_19793 ?auto_19794 ) ( CLEAR ?auto_19793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19796 ?auto_19795 ?auto_19794 )
      ( MAKE-5PILE ?auto_19791 ?auto_19792 ?auto_19793 ?auto_19794 ?auto_19795 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19797 - BLOCK
      ?auto_19798 - BLOCK
      ?auto_19799 - BLOCK
      ?auto_19800 - BLOCK
      ?auto_19801 - BLOCK
    )
    :vars
    (
      ?auto_19802 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19797 ) ( not ( = ?auto_19797 ?auto_19798 ) ) ( not ( = ?auto_19797 ?auto_19799 ) ) ( not ( = ?auto_19797 ?auto_19800 ) ) ( not ( = ?auto_19797 ?auto_19801 ) ) ( not ( = ?auto_19798 ?auto_19799 ) ) ( not ( = ?auto_19798 ?auto_19800 ) ) ( not ( = ?auto_19798 ?auto_19801 ) ) ( not ( = ?auto_19799 ?auto_19800 ) ) ( not ( = ?auto_19799 ?auto_19801 ) ) ( not ( = ?auto_19800 ?auto_19801 ) ) ( ON ?auto_19801 ?auto_19802 ) ( not ( = ?auto_19797 ?auto_19802 ) ) ( not ( = ?auto_19798 ?auto_19802 ) ) ( not ( = ?auto_19799 ?auto_19802 ) ) ( not ( = ?auto_19800 ?auto_19802 ) ) ( not ( = ?auto_19801 ?auto_19802 ) ) ( ON ?auto_19800 ?auto_19801 ) ( ON-TABLE ?auto_19802 ) ( ON ?auto_19799 ?auto_19800 ) ( CLEAR ?auto_19799 ) ( HOLDING ?auto_19798 ) ( CLEAR ?auto_19797 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19797 ?auto_19798 )
      ( MAKE-5PILE ?auto_19797 ?auto_19798 ?auto_19799 ?auto_19800 ?auto_19801 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19803 - BLOCK
      ?auto_19804 - BLOCK
      ?auto_19805 - BLOCK
      ?auto_19806 - BLOCK
      ?auto_19807 - BLOCK
    )
    :vars
    (
      ?auto_19808 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19803 ) ( not ( = ?auto_19803 ?auto_19804 ) ) ( not ( = ?auto_19803 ?auto_19805 ) ) ( not ( = ?auto_19803 ?auto_19806 ) ) ( not ( = ?auto_19803 ?auto_19807 ) ) ( not ( = ?auto_19804 ?auto_19805 ) ) ( not ( = ?auto_19804 ?auto_19806 ) ) ( not ( = ?auto_19804 ?auto_19807 ) ) ( not ( = ?auto_19805 ?auto_19806 ) ) ( not ( = ?auto_19805 ?auto_19807 ) ) ( not ( = ?auto_19806 ?auto_19807 ) ) ( ON ?auto_19807 ?auto_19808 ) ( not ( = ?auto_19803 ?auto_19808 ) ) ( not ( = ?auto_19804 ?auto_19808 ) ) ( not ( = ?auto_19805 ?auto_19808 ) ) ( not ( = ?auto_19806 ?auto_19808 ) ) ( not ( = ?auto_19807 ?auto_19808 ) ) ( ON ?auto_19806 ?auto_19807 ) ( ON-TABLE ?auto_19808 ) ( ON ?auto_19805 ?auto_19806 ) ( CLEAR ?auto_19803 ) ( ON ?auto_19804 ?auto_19805 ) ( CLEAR ?auto_19804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19808 ?auto_19807 ?auto_19806 ?auto_19805 )
      ( MAKE-5PILE ?auto_19803 ?auto_19804 ?auto_19805 ?auto_19806 ?auto_19807 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19809 - BLOCK
      ?auto_19810 - BLOCK
      ?auto_19811 - BLOCK
      ?auto_19812 - BLOCK
      ?auto_19813 - BLOCK
    )
    :vars
    (
      ?auto_19814 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19809 ?auto_19810 ) ) ( not ( = ?auto_19809 ?auto_19811 ) ) ( not ( = ?auto_19809 ?auto_19812 ) ) ( not ( = ?auto_19809 ?auto_19813 ) ) ( not ( = ?auto_19810 ?auto_19811 ) ) ( not ( = ?auto_19810 ?auto_19812 ) ) ( not ( = ?auto_19810 ?auto_19813 ) ) ( not ( = ?auto_19811 ?auto_19812 ) ) ( not ( = ?auto_19811 ?auto_19813 ) ) ( not ( = ?auto_19812 ?auto_19813 ) ) ( ON ?auto_19813 ?auto_19814 ) ( not ( = ?auto_19809 ?auto_19814 ) ) ( not ( = ?auto_19810 ?auto_19814 ) ) ( not ( = ?auto_19811 ?auto_19814 ) ) ( not ( = ?auto_19812 ?auto_19814 ) ) ( not ( = ?auto_19813 ?auto_19814 ) ) ( ON ?auto_19812 ?auto_19813 ) ( ON-TABLE ?auto_19814 ) ( ON ?auto_19811 ?auto_19812 ) ( ON ?auto_19810 ?auto_19811 ) ( CLEAR ?auto_19810 ) ( HOLDING ?auto_19809 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19809 )
      ( MAKE-5PILE ?auto_19809 ?auto_19810 ?auto_19811 ?auto_19812 ?auto_19813 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19815 - BLOCK
      ?auto_19816 - BLOCK
      ?auto_19817 - BLOCK
      ?auto_19818 - BLOCK
      ?auto_19819 - BLOCK
    )
    :vars
    (
      ?auto_19820 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19815 ?auto_19816 ) ) ( not ( = ?auto_19815 ?auto_19817 ) ) ( not ( = ?auto_19815 ?auto_19818 ) ) ( not ( = ?auto_19815 ?auto_19819 ) ) ( not ( = ?auto_19816 ?auto_19817 ) ) ( not ( = ?auto_19816 ?auto_19818 ) ) ( not ( = ?auto_19816 ?auto_19819 ) ) ( not ( = ?auto_19817 ?auto_19818 ) ) ( not ( = ?auto_19817 ?auto_19819 ) ) ( not ( = ?auto_19818 ?auto_19819 ) ) ( ON ?auto_19819 ?auto_19820 ) ( not ( = ?auto_19815 ?auto_19820 ) ) ( not ( = ?auto_19816 ?auto_19820 ) ) ( not ( = ?auto_19817 ?auto_19820 ) ) ( not ( = ?auto_19818 ?auto_19820 ) ) ( not ( = ?auto_19819 ?auto_19820 ) ) ( ON ?auto_19818 ?auto_19819 ) ( ON-TABLE ?auto_19820 ) ( ON ?auto_19817 ?auto_19818 ) ( ON ?auto_19816 ?auto_19817 ) ( ON ?auto_19815 ?auto_19816 ) ( CLEAR ?auto_19815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19820 ?auto_19819 ?auto_19818 ?auto_19817 ?auto_19816 )
      ( MAKE-5PILE ?auto_19815 ?auto_19816 ?auto_19817 ?auto_19818 ?auto_19819 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19879 - BLOCK
    )
    :vars
    (
      ?auto_19880 - BLOCK
      ?auto_19881 - BLOCK
      ?auto_19882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19879 ?auto_19880 ) ( CLEAR ?auto_19879 ) ( not ( = ?auto_19879 ?auto_19880 ) ) ( HOLDING ?auto_19881 ) ( CLEAR ?auto_19882 ) ( not ( = ?auto_19879 ?auto_19881 ) ) ( not ( = ?auto_19879 ?auto_19882 ) ) ( not ( = ?auto_19880 ?auto_19881 ) ) ( not ( = ?auto_19880 ?auto_19882 ) ) ( not ( = ?auto_19881 ?auto_19882 ) ) )
    :subtasks
    ( ( !STACK ?auto_19881 ?auto_19882 )
      ( MAKE-1PILE ?auto_19879 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19883 - BLOCK
    )
    :vars
    (
      ?auto_19885 - BLOCK
      ?auto_19886 - BLOCK
      ?auto_19884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19883 ?auto_19885 ) ( not ( = ?auto_19883 ?auto_19885 ) ) ( CLEAR ?auto_19886 ) ( not ( = ?auto_19883 ?auto_19884 ) ) ( not ( = ?auto_19883 ?auto_19886 ) ) ( not ( = ?auto_19885 ?auto_19884 ) ) ( not ( = ?auto_19885 ?auto_19886 ) ) ( not ( = ?auto_19884 ?auto_19886 ) ) ( ON ?auto_19884 ?auto_19883 ) ( CLEAR ?auto_19884 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19885 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19885 ?auto_19883 )
      ( MAKE-1PILE ?auto_19883 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19887 - BLOCK
    )
    :vars
    (
      ?auto_19888 - BLOCK
      ?auto_19890 - BLOCK
      ?auto_19889 - BLOCK
      ?auto_19892 - BLOCK
      ?auto_19891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19887 ?auto_19888 ) ( not ( = ?auto_19887 ?auto_19888 ) ) ( not ( = ?auto_19887 ?auto_19890 ) ) ( not ( = ?auto_19887 ?auto_19889 ) ) ( not ( = ?auto_19888 ?auto_19890 ) ) ( not ( = ?auto_19888 ?auto_19889 ) ) ( not ( = ?auto_19890 ?auto_19889 ) ) ( ON ?auto_19890 ?auto_19887 ) ( CLEAR ?auto_19890 ) ( ON-TABLE ?auto_19888 ) ( HOLDING ?auto_19889 ) ( CLEAR ?auto_19892 ) ( ON-TABLE ?auto_19891 ) ( ON ?auto_19892 ?auto_19891 ) ( not ( = ?auto_19891 ?auto_19892 ) ) ( not ( = ?auto_19891 ?auto_19889 ) ) ( not ( = ?auto_19892 ?auto_19889 ) ) ( not ( = ?auto_19887 ?auto_19892 ) ) ( not ( = ?auto_19887 ?auto_19891 ) ) ( not ( = ?auto_19888 ?auto_19892 ) ) ( not ( = ?auto_19888 ?auto_19891 ) ) ( not ( = ?auto_19890 ?auto_19892 ) ) ( not ( = ?auto_19890 ?auto_19891 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19891 ?auto_19892 ?auto_19889 )
      ( MAKE-1PILE ?auto_19887 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19893 - BLOCK
    )
    :vars
    (
      ?auto_19894 - BLOCK
      ?auto_19897 - BLOCK
      ?auto_19895 - BLOCK
      ?auto_19898 - BLOCK
      ?auto_19896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19893 ?auto_19894 ) ( not ( = ?auto_19893 ?auto_19894 ) ) ( not ( = ?auto_19893 ?auto_19897 ) ) ( not ( = ?auto_19893 ?auto_19895 ) ) ( not ( = ?auto_19894 ?auto_19897 ) ) ( not ( = ?auto_19894 ?auto_19895 ) ) ( not ( = ?auto_19897 ?auto_19895 ) ) ( ON ?auto_19897 ?auto_19893 ) ( ON-TABLE ?auto_19894 ) ( CLEAR ?auto_19898 ) ( ON-TABLE ?auto_19896 ) ( ON ?auto_19898 ?auto_19896 ) ( not ( = ?auto_19896 ?auto_19898 ) ) ( not ( = ?auto_19896 ?auto_19895 ) ) ( not ( = ?auto_19898 ?auto_19895 ) ) ( not ( = ?auto_19893 ?auto_19898 ) ) ( not ( = ?auto_19893 ?auto_19896 ) ) ( not ( = ?auto_19894 ?auto_19898 ) ) ( not ( = ?auto_19894 ?auto_19896 ) ) ( not ( = ?auto_19897 ?auto_19898 ) ) ( not ( = ?auto_19897 ?auto_19896 ) ) ( ON ?auto_19895 ?auto_19897 ) ( CLEAR ?auto_19895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19894 ?auto_19893 ?auto_19897 )
      ( MAKE-1PILE ?auto_19893 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19899 - BLOCK
    )
    :vars
    (
      ?auto_19903 - BLOCK
      ?auto_19901 - BLOCK
      ?auto_19900 - BLOCK
      ?auto_19902 - BLOCK
      ?auto_19904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19899 ?auto_19903 ) ( not ( = ?auto_19899 ?auto_19903 ) ) ( not ( = ?auto_19899 ?auto_19901 ) ) ( not ( = ?auto_19899 ?auto_19900 ) ) ( not ( = ?auto_19903 ?auto_19901 ) ) ( not ( = ?auto_19903 ?auto_19900 ) ) ( not ( = ?auto_19901 ?auto_19900 ) ) ( ON ?auto_19901 ?auto_19899 ) ( ON-TABLE ?auto_19903 ) ( ON-TABLE ?auto_19902 ) ( not ( = ?auto_19902 ?auto_19904 ) ) ( not ( = ?auto_19902 ?auto_19900 ) ) ( not ( = ?auto_19904 ?auto_19900 ) ) ( not ( = ?auto_19899 ?auto_19904 ) ) ( not ( = ?auto_19899 ?auto_19902 ) ) ( not ( = ?auto_19903 ?auto_19904 ) ) ( not ( = ?auto_19903 ?auto_19902 ) ) ( not ( = ?auto_19901 ?auto_19904 ) ) ( not ( = ?auto_19901 ?auto_19902 ) ) ( ON ?auto_19900 ?auto_19901 ) ( CLEAR ?auto_19900 ) ( HOLDING ?auto_19904 ) ( CLEAR ?auto_19902 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19902 ?auto_19904 )
      ( MAKE-1PILE ?auto_19899 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19905 - BLOCK
    )
    :vars
    (
      ?auto_19909 - BLOCK
      ?auto_19908 - BLOCK
      ?auto_19910 - BLOCK
      ?auto_19906 - BLOCK
      ?auto_19907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19905 ?auto_19909 ) ( not ( = ?auto_19905 ?auto_19909 ) ) ( not ( = ?auto_19905 ?auto_19908 ) ) ( not ( = ?auto_19905 ?auto_19910 ) ) ( not ( = ?auto_19909 ?auto_19908 ) ) ( not ( = ?auto_19909 ?auto_19910 ) ) ( not ( = ?auto_19908 ?auto_19910 ) ) ( ON ?auto_19908 ?auto_19905 ) ( ON-TABLE ?auto_19909 ) ( ON-TABLE ?auto_19906 ) ( not ( = ?auto_19906 ?auto_19907 ) ) ( not ( = ?auto_19906 ?auto_19910 ) ) ( not ( = ?auto_19907 ?auto_19910 ) ) ( not ( = ?auto_19905 ?auto_19907 ) ) ( not ( = ?auto_19905 ?auto_19906 ) ) ( not ( = ?auto_19909 ?auto_19907 ) ) ( not ( = ?auto_19909 ?auto_19906 ) ) ( not ( = ?auto_19908 ?auto_19907 ) ) ( not ( = ?auto_19908 ?auto_19906 ) ) ( ON ?auto_19910 ?auto_19908 ) ( CLEAR ?auto_19906 ) ( ON ?auto_19907 ?auto_19910 ) ( CLEAR ?auto_19907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19909 ?auto_19905 ?auto_19908 ?auto_19910 )
      ( MAKE-1PILE ?auto_19905 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19911 - BLOCK
    )
    :vars
    (
      ?auto_19915 - BLOCK
      ?auto_19912 - BLOCK
      ?auto_19914 - BLOCK
      ?auto_19916 - BLOCK
      ?auto_19913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19911 ?auto_19915 ) ( not ( = ?auto_19911 ?auto_19915 ) ) ( not ( = ?auto_19911 ?auto_19912 ) ) ( not ( = ?auto_19911 ?auto_19914 ) ) ( not ( = ?auto_19915 ?auto_19912 ) ) ( not ( = ?auto_19915 ?auto_19914 ) ) ( not ( = ?auto_19912 ?auto_19914 ) ) ( ON ?auto_19912 ?auto_19911 ) ( ON-TABLE ?auto_19915 ) ( not ( = ?auto_19916 ?auto_19913 ) ) ( not ( = ?auto_19916 ?auto_19914 ) ) ( not ( = ?auto_19913 ?auto_19914 ) ) ( not ( = ?auto_19911 ?auto_19913 ) ) ( not ( = ?auto_19911 ?auto_19916 ) ) ( not ( = ?auto_19915 ?auto_19913 ) ) ( not ( = ?auto_19915 ?auto_19916 ) ) ( not ( = ?auto_19912 ?auto_19913 ) ) ( not ( = ?auto_19912 ?auto_19916 ) ) ( ON ?auto_19914 ?auto_19912 ) ( ON ?auto_19913 ?auto_19914 ) ( CLEAR ?auto_19913 ) ( HOLDING ?auto_19916 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19916 )
      ( MAKE-1PILE ?auto_19911 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19917 - BLOCK
    )
    :vars
    (
      ?auto_19920 - BLOCK
      ?auto_19918 - BLOCK
      ?auto_19922 - BLOCK
      ?auto_19919 - BLOCK
      ?auto_19921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19917 ?auto_19920 ) ( not ( = ?auto_19917 ?auto_19920 ) ) ( not ( = ?auto_19917 ?auto_19918 ) ) ( not ( = ?auto_19917 ?auto_19922 ) ) ( not ( = ?auto_19920 ?auto_19918 ) ) ( not ( = ?auto_19920 ?auto_19922 ) ) ( not ( = ?auto_19918 ?auto_19922 ) ) ( ON ?auto_19918 ?auto_19917 ) ( ON-TABLE ?auto_19920 ) ( not ( = ?auto_19919 ?auto_19921 ) ) ( not ( = ?auto_19919 ?auto_19922 ) ) ( not ( = ?auto_19921 ?auto_19922 ) ) ( not ( = ?auto_19917 ?auto_19921 ) ) ( not ( = ?auto_19917 ?auto_19919 ) ) ( not ( = ?auto_19920 ?auto_19921 ) ) ( not ( = ?auto_19920 ?auto_19919 ) ) ( not ( = ?auto_19918 ?auto_19921 ) ) ( not ( = ?auto_19918 ?auto_19919 ) ) ( ON ?auto_19922 ?auto_19918 ) ( ON ?auto_19921 ?auto_19922 ) ( ON ?auto_19919 ?auto_19921 ) ( CLEAR ?auto_19919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19920 ?auto_19917 ?auto_19918 ?auto_19922 ?auto_19921 )
      ( MAKE-1PILE ?auto_19917 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19930 - BLOCK
      ?auto_19931 - BLOCK
      ?auto_19932 - BLOCK
    )
    :vars
    (
      ?auto_19933 - BLOCK
      ?auto_19934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19933 ?auto_19932 ) ( CLEAR ?auto_19933 ) ( ON-TABLE ?auto_19930 ) ( ON ?auto_19931 ?auto_19930 ) ( ON ?auto_19932 ?auto_19931 ) ( not ( = ?auto_19930 ?auto_19931 ) ) ( not ( = ?auto_19930 ?auto_19932 ) ) ( not ( = ?auto_19930 ?auto_19933 ) ) ( not ( = ?auto_19931 ?auto_19932 ) ) ( not ( = ?auto_19931 ?auto_19933 ) ) ( not ( = ?auto_19932 ?auto_19933 ) ) ( HOLDING ?auto_19934 ) ( not ( = ?auto_19930 ?auto_19934 ) ) ( not ( = ?auto_19931 ?auto_19934 ) ) ( not ( = ?auto_19932 ?auto_19934 ) ) ( not ( = ?auto_19933 ?auto_19934 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_19934 )
      ( MAKE-3PILE ?auto_19930 ?auto_19931 ?auto_19932 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19983 - BLOCK
      ?auto_19984 - BLOCK
    )
    :vars
    (
      ?auto_19985 - BLOCK
      ?auto_19987 - BLOCK
      ?auto_19986 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19983 ?auto_19984 ) ) ( ON ?auto_19984 ?auto_19985 ) ( not ( = ?auto_19983 ?auto_19985 ) ) ( not ( = ?auto_19984 ?auto_19985 ) ) ( ON ?auto_19983 ?auto_19984 ) ( CLEAR ?auto_19983 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19987 ) ( ON ?auto_19986 ?auto_19987 ) ( ON ?auto_19985 ?auto_19986 ) ( not ( = ?auto_19987 ?auto_19986 ) ) ( not ( = ?auto_19987 ?auto_19985 ) ) ( not ( = ?auto_19987 ?auto_19984 ) ) ( not ( = ?auto_19987 ?auto_19983 ) ) ( not ( = ?auto_19986 ?auto_19985 ) ) ( not ( = ?auto_19986 ?auto_19984 ) ) ( not ( = ?auto_19986 ?auto_19983 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19987 ?auto_19986 ?auto_19985 ?auto_19984 )
      ( MAKE-2PILE ?auto_19983 ?auto_19984 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19990 - BLOCK
      ?auto_19991 - BLOCK
    )
    :vars
    (
      ?auto_19992 - BLOCK
      ?auto_19993 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19990 ?auto_19991 ) ) ( ON ?auto_19991 ?auto_19992 ) ( CLEAR ?auto_19991 ) ( not ( = ?auto_19990 ?auto_19992 ) ) ( not ( = ?auto_19991 ?auto_19992 ) ) ( ON ?auto_19990 ?auto_19993 ) ( CLEAR ?auto_19990 ) ( HAND-EMPTY ) ( not ( = ?auto_19990 ?auto_19993 ) ) ( not ( = ?auto_19991 ?auto_19993 ) ) ( not ( = ?auto_19992 ?auto_19993 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19990 ?auto_19993 )
      ( MAKE-2PILE ?auto_19990 ?auto_19991 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19994 - BLOCK
      ?auto_19995 - BLOCK
    )
    :vars
    (
      ?auto_19996 - BLOCK
      ?auto_19997 - BLOCK
      ?auto_19998 - BLOCK
      ?auto_19999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19994 ?auto_19995 ) ) ( not ( = ?auto_19994 ?auto_19996 ) ) ( not ( = ?auto_19995 ?auto_19996 ) ) ( ON ?auto_19994 ?auto_19997 ) ( CLEAR ?auto_19994 ) ( not ( = ?auto_19994 ?auto_19997 ) ) ( not ( = ?auto_19995 ?auto_19997 ) ) ( not ( = ?auto_19996 ?auto_19997 ) ) ( HOLDING ?auto_19995 ) ( CLEAR ?auto_19996 ) ( ON-TABLE ?auto_19998 ) ( ON ?auto_19999 ?auto_19998 ) ( ON ?auto_19996 ?auto_19999 ) ( not ( = ?auto_19998 ?auto_19999 ) ) ( not ( = ?auto_19998 ?auto_19996 ) ) ( not ( = ?auto_19998 ?auto_19995 ) ) ( not ( = ?auto_19999 ?auto_19996 ) ) ( not ( = ?auto_19999 ?auto_19995 ) ) ( not ( = ?auto_19994 ?auto_19998 ) ) ( not ( = ?auto_19994 ?auto_19999 ) ) ( not ( = ?auto_19997 ?auto_19998 ) ) ( not ( = ?auto_19997 ?auto_19999 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19998 ?auto_19999 ?auto_19996 ?auto_19995 )
      ( MAKE-2PILE ?auto_19994 ?auto_19995 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20000 - BLOCK
      ?auto_20001 - BLOCK
    )
    :vars
    (
      ?auto_20005 - BLOCK
      ?auto_20003 - BLOCK
      ?auto_20004 - BLOCK
      ?auto_20002 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20000 ?auto_20001 ) ) ( not ( = ?auto_20000 ?auto_20005 ) ) ( not ( = ?auto_20001 ?auto_20005 ) ) ( ON ?auto_20000 ?auto_20003 ) ( not ( = ?auto_20000 ?auto_20003 ) ) ( not ( = ?auto_20001 ?auto_20003 ) ) ( not ( = ?auto_20005 ?auto_20003 ) ) ( CLEAR ?auto_20005 ) ( ON-TABLE ?auto_20004 ) ( ON ?auto_20002 ?auto_20004 ) ( ON ?auto_20005 ?auto_20002 ) ( not ( = ?auto_20004 ?auto_20002 ) ) ( not ( = ?auto_20004 ?auto_20005 ) ) ( not ( = ?auto_20004 ?auto_20001 ) ) ( not ( = ?auto_20002 ?auto_20005 ) ) ( not ( = ?auto_20002 ?auto_20001 ) ) ( not ( = ?auto_20000 ?auto_20004 ) ) ( not ( = ?auto_20000 ?auto_20002 ) ) ( not ( = ?auto_20003 ?auto_20004 ) ) ( not ( = ?auto_20003 ?auto_20002 ) ) ( ON ?auto_20001 ?auto_20000 ) ( CLEAR ?auto_20001 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20003 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20003 ?auto_20000 )
      ( MAKE-2PILE ?auto_20000 ?auto_20001 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20006 - BLOCK
      ?auto_20007 - BLOCK
    )
    :vars
    (
      ?auto_20008 - BLOCK
      ?auto_20009 - BLOCK
      ?auto_20011 - BLOCK
      ?auto_20010 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20006 ?auto_20007 ) ) ( not ( = ?auto_20006 ?auto_20008 ) ) ( not ( = ?auto_20007 ?auto_20008 ) ) ( ON ?auto_20006 ?auto_20009 ) ( not ( = ?auto_20006 ?auto_20009 ) ) ( not ( = ?auto_20007 ?auto_20009 ) ) ( not ( = ?auto_20008 ?auto_20009 ) ) ( ON-TABLE ?auto_20011 ) ( ON ?auto_20010 ?auto_20011 ) ( not ( = ?auto_20011 ?auto_20010 ) ) ( not ( = ?auto_20011 ?auto_20008 ) ) ( not ( = ?auto_20011 ?auto_20007 ) ) ( not ( = ?auto_20010 ?auto_20008 ) ) ( not ( = ?auto_20010 ?auto_20007 ) ) ( not ( = ?auto_20006 ?auto_20011 ) ) ( not ( = ?auto_20006 ?auto_20010 ) ) ( not ( = ?auto_20009 ?auto_20011 ) ) ( not ( = ?auto_20009 ?auto_20010 ) ) ( ON ?auto_20007 ?auto_20006 ) ( CLEAR ?auto_20007 ) ( ON-TABLE ?auto_20009 ) ( HOLDING ?auto_20008 ) ( CLEAR ?auto_20010 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20011 ?auto_20010 ?auto_20008 )
      ( MAKE-2PILE ?auto_20006 ?auto_20007 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20012 - BLOCK
      ?auto_20013 - BLOCK
    )
    :vars
    (
      ?auto_20015 - BLOCK
      ?auto_20014 - BLOCK
      ?auto_20016 - BLOCK
      ?auto_20017 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20012 ?auto_20013 ) ) ( not ( = ?auto_20012 ?auto_20015 ) ) ( not ( = ?auto_20013 ?auto_20015 ) ) ( ON ?auto_20012 ?auto_20014 ) ( not ( = ?auto_20012 ?auto_20014 ) ) ( not ( = ?auto_20013 ?auto_20014 ) ) ( not ( = ?auto_20015 ?auto_20014 ) ) ( ON-TABLE ?auto_20016 ) ( ON ?auto_20017 ?auto_20016 ) ( not ( = ?auto_20016 ?auto_20017 ) ) ( not ( = ?auto_20016 ?auto_20015 ) ) ( not ( = ?auto_20016 ?auto_20013 ) ) ( not ( = ?auto_20017 ?auto_20015 ) ) ( not ( = ?auto_20017 ?auto_20013 ) ) ( not ( = ?auto_20012 ?auto_20016 ) ) ( not ( = ?auto_20012 ?auto_20017 ) ) ( not ( = ?auto_20014 ?auto_20016 ) ) ( not ( = ?auto_20014 ?auto_20017 ) ) ( ON ?auto_20013 ?auto_20012 ) ( ON-TABLE ?auto_20014 ) ( CLEAR ?auto_20017 ) ( ON ?auto_20015 ?auto_20013 ) ( CLEAR ?auto_20015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20014 ?auto_20012 ?auto_20013 )
      ( MAKE-2PILE ?auto_20012 ?auto_20013 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20018 - BLOCK
      ?auto_20019 - BLOCK
    )
    :vars
    (
      ?auto_20022 - BLOCK
      ?auto_20021 - BLOCK
      ?auto_20023 - BLOCK
      ?auto_20020 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20018 ?auto_20019 ) ) ( not ( = ?auto_20018 ?auto_20022 ) ) ( not ( = ?auto_20019 ?auto_20022 ) ) ( ON ?auto_20018 ?auto_20021 ) ( not ( = ?auto_20018 ?auto_20021 ) ) ( not ( = ?auto_20019 ?auto_20021 ) ) ( not ( = ?auto_20022 ?auto_20021 ) ) ( ON-TABLE ?auto_20023 ) ( not ( = ?auto_20023 ?auto_20020 ) ) ( not ( = ?auto_20023 ?auto_20022 ) ) ( not ( = ?auto_20023 ?auto_20019 ) ) ( not ( = ?auto_20020 ?auto_20022 ) ) ( not ( = ?auto_20020 ?auto_20019 ) ) ( not ( = ?auto_20018 ?auto_20023 ) ) ( not ( = ?auto_20018 ?auto_20020 ) ) ( not ( = ?auto_20021 ?auto_20023 ) ) ( not ( = ?auto_20021 ?auto_20020 ) ) ( ON ?auto_20019 ?auto_20018 ) ( ON-TABLE ?auto_20021 ) ( ON ?auto_20022 ?auto_20019 ) ( CLEAR ?auto_20022 ) ( HOLDING ?auto_20020 ) ( CLEAR ?auto_20023 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20023 ?auto_20020 )
      ( MAKE-2PILE ?auto_20018 ?auto_20019 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20024 - BLOCK
      ?auto_20025 - BLOCK
    )
    :vars
    (
      ?auto_20026 - BLOCK
      ?auto_20029 - BLOCK
      ?auto_20028 - BLOCK
      ?auto_20027 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20024 ?auto_20025 ) ) ( not ( = ?auto_20024 ?auto_20026 ) ) ( not ( = ?auto_20025 ?auto_20026 ) ) ( ON ?auto_20024 ?auto_20029 ) ( not ( = ?auto_20024 ?auto_20029 ) ) ( not ( = ?auto_20025 ?auto_20029 ) ) ( not ( = ?auto_20026 ?auto_20029 ) ) ( ON-TABLE ?auto_20028 ) ( not ( = ?auto_20028 ?auto_20027 ) ) ( not ( = ?auto_20028 ?auto_20026 ) ) ( not ( = ?auto_20028 ?auto_20025 ) ) ( not ( = ?auto_20027 ?auto_20026 ) ) ( not ( = ?auto_20027 ?auto_20025 ) ) ( not ( = ?auto_20024 ?auto_20028 ) ) ( not ( = ?auto_20024 ?auto_20027 ) ) ( not ( = ?auto_20029 ?auto_20028 ) ) ( not ( = ?auto_20029 ?auto_20027 ) ) ( ON ?auto_20025 ?auto_20024 ) ( ON-TABLE ?auto_20029 ) ( ON ?auto_20026 ?auto_20025 ) ( CLEAR ?auto_20028 ) ( ON ?auto_20027 ?auto_20026 ) ( CLEAR ?auto_20027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20029 ?auto_20024 ?auto_20025 ?auto_20026 )
      ( MAKE-2PILE ?auto_20024 ?auto_20025 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20030 - BLOCK
      ?auto_20031 - BLOCK
    )
    :vars
    (
      ?auto_20033 - BLOCK
      ?auto_20035 - BLOCK
      ?auto_20032 - BLOCK
      ?auto_20034 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20030 ?auto_20031 ) ) ( not ( = ?auto_20030 ?auto_20033 ) ) ( not ( = ?auto_20031 ?auto_20033 ) ) ( ON ?auto_20030 ?auto_20035 ) ( not ( = ?auto_20030 ?auto_20035 ) ) ( not ( = ?auto_20031 ?auto_20035 ) ) ( not ( = ?auto_20033 ?auto_20035 ) ) ( not ( = ?auto_20032 ?auto_20034 ) ) ( not ( = ?auto_20032 ?auto_20033 ) ) ( not ( = ?auto_20032 ?auto_20031 ) ) ( not ( = ?auto_20034 ?auto_20033 ) ) ( not ( = ?auto_20034 ?auto_20031 ) ) ( not ( = ?auto_20030 ?auto_20032 ) ) ( not ( = ?auto_20030 ?auto_20034 ) ) ( not ( = ?auto_20035 ?auto_20032 ) ) ( not ( = ?auto_20035 ?auto_20034 ) ) ( ON ?auto_20031 ?auto_20030 ) ( ON-TABLE ?auto_20035 ) ( ON ?auto_20033 ?auto_20031 ) ( ON ?auto_20034 ?auto_20033 ) ( CLEAR ?auto_20034 ) ( HOLDING ?auto_20032 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20032 )
      ( MAKE-2PILE ?auto_20030 ?auto_20031 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20036 - BLOCK
      ?auto_20037 - BLOCK
    )
    :vars
    (
      ?auto_20038 - BLOCK
      ?auto_20040 - BLOCK
      ?auto_20041 - BLOCK
      ?auto_20039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20036 ?auto_20037 ) ) ( not ( = ?auto_20036 ?auto_20038 ) ) ( not ( = ?auto_20037 ?auto_20038 ) ) ( ON ?auto_20036 ?auto_20040 ) ( not ( = ?auto_20036 ?auto_20040 ) ) ( not ( = ?auto_20037 ?auto_20040 ) ) ( not ( = ?auto_20038 ?auto_20040 ) ) ( not ( = ?auto_20041 ?auto_20039 ) ) ( not ( = ?auto_20041 ?auto_20038 ) ) ( not ( = ?auto_20041 ?auto_20037 ) ) ( not ( = ?auto_20039 ?auto_20038 ) ) ( not ( = ?auto_20039 ?auto_20037 ) ) ( not ( = ?auto_20036 ?auto_20041 ) ) ( not ( = ?auto_20036 ?auto_20039 ) ) ( not ( = ?auto_20040 ?auto_20041 ) ) ( not ( = ?auto_20040 ?auto_20039 ) ) ( ON ?auto_20037 ?auto_20036 ) ( ON-TABLE ?auto_20040 ) ( ON ?auto_20038 ?auto_20037 ) ( ON ?auto_20039 ?auto_20038 ) ( ON ?auto_20041 ?auto_20039 ) ( CLEAR ?auto_20041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20040 ?auto_20036 ?auto_20037 ?auto_20038 ?auto_20039 )
      ( MAKE-2PILE ?auto_20036 ?auto_20037 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20057 - BLOCK
      ?auto_20058 - BLOCK
    )
    :vars
    (
      ?auto_20061 - BLOCK
      ?auto_20060 - BLOCK
      ?auto_20059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20061 ?auto_20058 ) ( ON-TABLE ?auto_20057 ) ( ON ?auto_20058 ?auto_20057 ) ( not ( = ?auto_20057 ?auto_20058 ) ) ( not ( = ?auto_20057 ?auto_20061 ) ) ( not ( = ?auto_20058 ?auto_20061 ) ) ( not ( = ?auto_20057 ?auto_20060 ) ) ( not ( = ?auto_20057 ?auto_20059 ) ) ( not ( = ?auto_20058 ?auto_20060 ) ) ( not ( = ?auto_20058 ?auto_20059 ) ) ( not ( = ?auto_20061 ?auto_20060 ) ) ( not ( = ?auto_20061 ?auto_20059 ) ) ( not ( = ?auto_20060 ?auto_20059 ) ) ( ON ?auto_20060 ?auto_20061 ) ( CLEAR ?auto_20060 ) ( HOLDING ?auto_20059 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20059 )
      ( MAKE-2PILE ?auto_20057 ?auto_20058 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20104 - BLOCK
      ?auto_20105 - BLOCK
      ?auto_20106 - BLOCK
    )
    :vars
    (
      ?auto_20107 - BLOCK
      ?auto_20108 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20104 ) ( not ( = ?auto_20104 ?auto_20105 ) ) ( not ( = ?auto_20104 ?auto_20106 ) ) ( not ( = ?auto_20105 ?auto_20106 ) ) ( ON ?auto_20106 ?auto_20107 ) ( not ( = ?auto_20104 ?auto_20107 ) ) ( not ( = ?auto_20105 ?auto_20107 ) ) ( not ( = ?auto_20106 ?auto_20107 ) ) ( CLEAR ?auto_20104 ) ( ON ?auto_20105 ?auto_20106 ) ( CLEAR ?auto_20105 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20108 ) ( ON ?auto_20107 ?auto_20108 ) ( not ( = ?auto_20108 ?auto_20107 ) ) ( not ( = ?auto_20108 ?auto_20106 ) ) ( not ( = ?auto_20108 ?auto_20105 ) ) ( not ( = ?auto_20104 ?auto_20108 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20108 ?auto_20107 ?auto_20106 )
      ( MAKE-3PILE ?auto_20104 ?auto_20105 ?auto_20106 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20109 - BLOCK
      ?auto_20110 - BLOCK
      ?auto_20111 - BLOCK
    )
    :vars
    (
      ?auto_20112 - BLOCK
      ?auto_20113 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20109 ?auto_20110 ) ) ( not ( = ?auto_20109 ?auto_20111 ) ) ( not ( = ?auto_20110 ?auto_20111 ) ) ( ON ?auto_20111 ?auto_20112 ) ( not ( = ?auto_20109 ?auto_20112 ) ) ( not ( = ?auto_20110 ?auto_20112 ) ) ( not ( = ?auto_20111 ?auto_20112 ) ) ( ON ?auto_20110 ?auto_20111 ) ( CLEAR ?auto_20110 ) ( ON-TABLE ?auto_20113 ) ( ON ?auto_20112 ?auto_20113 ) ( not ( = ?auto_20113 ?auto_20112 ) ) ( not ( = ?auto_20113 ?auto_20111 ) ) ( not ( = ?auto_20113 ?auto_20110 ) ) ( not ( = ?auto_20109 ?auto_20113 ) ) ( HOLDING ?auto_20109 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20109 )
      ( MAKE-3PILE ?auto_20109 ?auto_20110 ?auto_20111 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20114 - BLOCK
      ?auto_20115 - BLOCK
      ?auto_20116 - BLOCK
    )
    :vars
    (
      ?auto_20117 - BLOCK
      ?auto_20118 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20114 ?auto_20115 ) ) ( not ( = ?auto_20114 ?auto_20116 ) ) ( not ( = ?auto_20115 ?auto_20116 ) ) ( ON ?auto_20116 ?auto_20117 ) ( not ( = ?auto_20114 ?auto_20117 ) ) ( not ( = ?auto_20115 ?auto_20117 ) ) ( not ( = ?auto_20116 ?auto_20117 ) ) ( ON ?auto_20115 ?auto_20116 ) ( ON-TABLE ?auto_20118 ) ( ON ?auto_20117 ?auto_20118 ) ( not ( = ?auto_20118 ?auto_20117 ) ) ( not ( = ?auto_20118 ?auto_20116 ) ) ( not ( = ?auto_20118 ?auto_20115 ) ) ( not ( = ?auto_20114 ?auto_20118 ) ) ( ON ?auto_20114 ?auto_20115 ) ( CLEAR ?auto_20114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20118 ?auto_20117 ?auto_20116 ?auto_20115 )
      ( MAKE-3PILE ?auto_20114 ?auto_20115 ?auto_20116 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20122 - BLOCK
      ?auto_20123 - BLOCK
      ?auto_20124 - BLOCK
    )
    :vars
    (
      ?auto_20126 - BLOCK
      ?auto_20125 - BLOCK
      ?auto_20127 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20122 ?auto_20123 ) ) ( not ( = ?auto_20122 ?auto_20124 ) ) ( not ( = ?auto_20123 ?auto_20124 ) ) ( ON ?auto_20124 ?auto_20126 ) ( not ( = ?auto_20122 ?auto_20126 ) ) ( not ( = ?auto_20123 ?auto_20126 ) ) ( not ( = ?auto_20124 ?auto_20126 ) ) ( ON ?auto_20123 ?auto_20124 ) ( CLEAR ?auto_20123 ) ( ON-TABLE ?auto_20125 ) ( ON ?auto_20126 ?auto_20125 ) ( not ( = ?auto_20125 ?auto_20126 ) ) ( not ( = ?auto_20125 ?auto_20124 ) ) ( not ( = ?auto_20125 ?auto_20123 ) ) ( not ( = ?auto_20122 ?auto_20125 ) ) ( ON ?auto_20122 ?auto_20127 ) ( CLEAR ?auto_20122 ) ( HAND-EMPTY ) ( not ( = ?auto_20122 ?auto_20127 ) ) ( not ( = ?auto_20123 ?auto_20127 ) ) ( not ( = ?auto_20124 ?auto_20127 ) ) ( not ( = ?auto_20126 ?auto_20127 ) ) ( not ( = ?auto_20125 ?auto_20127 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20122 ?auto_20127 )
      ( MAKE-3PILE ?auto_20122 ?auto_20123 ?auto_20124 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20128 - BLOCK
      ?auto_20129 - BLOCK
      ?auto_20130 - BLOCK
    )
    :vars
    (
      ?auto_20133 - BLOCK
      ?auto_20131 - BLOCK
      ?auto_20132 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20128 ?auto_20129 ) ) ( not ( = ?auto_20128 ?auto_20130 ) ) ( not ( = ?auto_20129 ?auto_20130 ) ) ( ON ?auto_20130 ?auto_20133 ) ( not ( = ?auto_20128 ?auto_20133 ) ) ( not ( = ?auto_20129 ?auto_20133 ) ) ( not ( = ?auto_20130 ?auto_20133 ) ) ( ON-TABLE ?auto_20131 ) ( ON ?auto_20133 ?auto_20131 ) ( not ( = ?auto_20131 ?auto_20133 ) ) ( not ( = ?auto_20131 ?auto_20130 ) ) ( not ( = ?auto_20131 ?auto_20129 ) ) ( not ( = ?auto_20128 ?auto_20131 ) ) ( ON ?auto_20128 ?auto_20132 ) ( CLEAR ?auto_20128 ) ( not ( = ?auto_20128 ?auto_20132 ) ) ( not ( = ?auto_20129 ?auto_20132 ) ) ( not ( = ?auto_20130 ?auto_20132 ) ) ( not ( = ?auto_20133 ?auto_20132 ) ) ( not ( = ?auto_20131 ?auto_20132 ) ) ( HOLDING ?auto_20129 ) ( CLEAR ?auto_20130 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20131 ?auto_20133 ?auto_20130 ?auto_20129 )
      ( MAKE-3PILE ?auto_20128 ?auto_20129 ?auto_20130 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20134 - BLOCK
      ?auto_20135 - BLOCK
      ?auto_20136 - BLOCK
    )
    :vars
    (
      ?auto_20139 - BLOCK
      ?auto_20138 - BLOCK
      ?auto_20137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20134 ?auto_20135 ) ) ( not ( = ?auto_20134 ?auto_20136 ) ) ( not ( = ?auto_20135 ?auto_20136 ) ) ( ON ?auto_20136 ?auto_20139 ) ( not ( = ?auto_20134 ?auto_20139 ) ) ( not ( = ?auto_20135 ?auto_20139 ) ) ( not ( = ?auto_20136 ?auto_20139 ) ) ( ON-TABLE ?auto_20138 ) ( ON ?auto_20139 ?auto_20138 ) ( not ( = ?auto_20138 ?auto_20139 ) ) ( not ( = ?auto_20138 ?auto_20136 ) ) ( not ( = ?auto_20138 ?auto_20135 ) ) ( not ( = ?auto_20134 ?auto_20138 ) ) ( ON ?auto_20134 ?auto_20137 ) ( not ( = ?auto_20134 ?auto_20137 ) ) ( not ( = ?auto_20135 ?auto_20137 ) ) ( not ( = ?auto_20136 ?auto_20137 ) ) ( not ( = ?auto_20139 ?auto_20137 ) ) ( not ( = ?auto_20138 ?auto_20137 ) ) ( CLEAR ?auto_20136 ) ( ON ?auto_20135 ?auto_20134 ) ( CLEAR ?auto_20135 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20137 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20137 ?auto_20134 )
      ( MAKE-3PILE ?auto_20134 ?auto_20135 ?auto_20136 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20140 - BLOCK
      ?auto_20141 - BLOCK
      ?auto_20142 - BLOCK
    )
    :vars
    (
      ?auto_20144 - BLOCK
      ?auto_20145 - BLOCK
      ?auto_20143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20140 ?auto_20141 ) ) ( not ( = ?auto_20140 ?auto_20142 ) ) ( not ( = ?auto_20141 ?auto_20142 ) ) ( not ( = ?auto_20140 ?auto_20144 ) ) ( not ( = ?auto_20141 ?auto_20144 ) ) ( not ( = ?auto_20142 ?auto_20144 ) ) ( ON-TABLE ?auto_20145 ) ( ON ?auto_20144 ?auto_20145 ) ( not ( = ?auto_20145 ?auto_20144 ) ) ( not ( = ?auto_20145 ?auto_20142 ) ) ( not ( = ?auto_20145 ?auto_20141 ) ) ( not ( = ?auto_20140 ?auto_20145 ) ) ( ON ?auto_20140 ?auto_20143 ) ( not ( = ?auto_20140 ?auto_20143 ) ) ( not ( = ?auto_20141 ?auto_20143 ) ) ( not ( = ?auto_20142 ?auto_20143 ) ) ( not ( = ?auto_20144 ?auto_20143 ) ) ( not ( = ?auto_20145 ?auto_20143 ) ) ( ON ?auto_20141 ?auto_20140 ) ( CLEAR ?auto_20141 ) ( ON-TABLE ?auto_20143 ) ( HOLDING ?auto_20142 ) ( CLEAR ?auto_20144 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20145 ?auto_20144 ?auto_20142 )
      ( MAKE-3PILE ?auto_20140 ?auto_20141 ?auto_20142 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20146 - BLOCK
      ?auto_20147 - BLOCK
      ?auto_20148 - BLOCK
    )
    :vars
    (
      ?auto_20151 - BLOCK
      ?auto_20150 - BLOCK
      ?auto_20149 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20146 ?auto_20147 ) ) ( not ( = ?auto_20146 ?auto_20148 ) ) ( not ( = ?auto_20147 ?auto_20148 ) ) ( not ( = ?auto_20146 ?auto_20151 ) ) ( not ( = ?auto_20147 ?auto_20151 ) ) ( not ( = ?auto_20148 ?auto_20151 ) ) ( ON-TABLE ?auto_20150 ) ( ON ?auto_20151 ?auto_20150 ) ( not ( = ?auto_20150 ?auto_20151 ) ) ( not ( = ?auto_20150 ?auto_20148 ) ) ( not ( = ?auto_20150 ?auto_20147 ) ) ( not ( = ?auto_20146 ?auto_20150 ) ) ( ON ?auto_20146 ?auto_20149 ) ( not ( = ?auto_20146 ?auto_20149 ) ) ( not ( = ?auto_20147 ?auto_20149 ) ) ( not ( = ?auto_20148 ?auto_20149 ) ) ( not ( = ?auto_20151 ?auto_20149 ) ) ( not ( = ?auto_20150 ?auto_20149 ) ) ( ON ?auto_20147 ?auto_20146 ) ( ON-TABLE ?auto_20149 ) ( CLEAR ?auto_20151 ) ( ON ?auto_20148 ?auto_20147 ) ( CLEAR ?auto_20148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20149 ?auto_20146 ?auto_20147 )
      ( MAKE-3PILE ?auto_20146 ?auto_20147 ?auto_20148 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20152 - BLOCK
      ?auto_20153 - BLOCK
      ?auto_20154 - BLOCK
    )
    :vars
    (
      ?auto_20157 - BLOCK
      ?auto_20156 - BLOCK
      ?auto_20155 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20152 ?auto_20153 ) ) ( not ( = ?auto_20152 ?auto_20154 ) ) ( not ( = ?auto_20153 ?auto_20154 ) ) ( not ( = ?auto_20152 ?auto_20157 ) ) ( not ( = ?auto_20153 ?auto_20157 ) ) ( not ( = ?auto_20154 ?auto_20157 ) ) ( ON-TABLE ?auto_20156 ) ( not ( = ?auto_20156 ?auto_20157 ) ) ( not ( = ?auto_20156 ?auto_20154 ) ) ( not ( = ?auto_20156 ?auto_20153 ) ) ( not ( = ?auto_20152 ?auto_20156 ) ) ( ON ?auto_20152 ?auto_20155 ) ( not ( = ?auto_20152 ?auto_20155 ) ) ( not ( = ?auto_20153 ?auto_20155 ) ) ( not ( = ?auto_20154 ?auto_20155 ) ) ( not ( = ?auto_20157 ?auto_20155 ) ) ( not ( = ?auto_20156 ?auto_20155 ) ) ( ON ?auto_20153 ?auto_20152 ) ( ON-TABLE ?auto_20155 ) ( ON ?auto_20154 ?auto_20153 ) ( CLEAR ?auto_20154 ) ( HOLDING ?auto_20157 ) ( CLEAR ?auto_20156 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20156 ?auto_20157 )
      ( MAKE-3PILE ?auto_20152 ?auto_20153 ?auto_20154 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20158 - BLOCK
      ?auto_20159 - BLOCK
      ?auto_20160 - BLOCK
    )
    :vars
    (
      ?auto_20161 - BLOCK
      ?auto_20163 - BLOCK
      ?auto_20162 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20158 ?auto_20159 ) ) ( not ( = ?auto_20158 ?auto_20160 ) ) ( not ( = ?auto_20159 ?auto_20160 ) ) ( not ( = ?auto_20158 ?auto_20161 ) ) ( not ( = ?auto_20159 ?auto_20161 ) ) ( not ( = ?auto_20160 ?auto_20161 ) ) ( ON-TABLE ?auto_20163 ) ( not ( = ?auto_20163 ?auto_20161 ) ) ( not ( = ?auto_20163 ?auto_20160 ) ) ( not ( = ?auto_20163 ?auto_20159 ) ) ( not ( = ?auto_20158 ?auto_20163 ) ) ( ON ?auto_20158 ?auto_20162 ) ( not ( = ?auto_20158 ?auto_20162 ) ) ( not ( = ?auto_20159 ?auto_20162 ) ) ( not ( = ?auto_20160 ?auto_20162 ) ) ( not ( = ?auto_20161 ?auto_20162 ) ) ( not ( = ?auto_20163 ?auto_20162 ) ) ( ON ?auto_20159 ?auto_20158 ) ( ON-TABLE ?auto_20162 ) ( ON ?auto_20160 ?auto_20159 ) ( CLEAR ?auto_20163 ) ( ON ?auto_20161 ?auto_20160 ) ( CLEAR ?auto_20161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20162 ?auto_20158 ?auto_20159 ?auto_20160 )
      ( MAKE-3PILE ?auto_20158 ?auto_20159 ?auto_20160 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20164 - BLOCK
      ?auto_20165 - BLOCK
      ?auto_20166 - BLOCK
    )
    :vars
    (
      ?auto_20167 - BLOCK
      ?auto_20169 - BLOCK
      ?auto_20168 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20164 ?auto_20165 ) ) ( not ( = ?auto_20164 ?auto_20166 ) ) ( not ( = ?auto_20165 ?auto_20166 ) ) ( not ( = ?auto_20164 ?auto_20167 ) ) ( not ( = ?auto_20165 ?auto_20167 ) ) ( not ( = ?auto_20166 ?auto_20167 ) ) ( not ( = ?auto_20169 ?auto_20167 ) ) ( not ( = ?auto_20169 ?auto_20166 ) ) ( not ( = ?auto_20169 ?auto_20165 ) ) ( not ( = ?auto_20164 ?auto_20169 ) ) ( ON ?auto_20164 ?auto_20168 ) ( not ( = ?auto_20164 ?auto_20168 ) ) ( not ( = ?auto_20165 ?auto_20168 ) ) ( not ( = ?auto_20166 ?auto_20168 ) ) ( not ( = ?auto_20167 ?auto_20168 ) ) ( not ( = ?auto_20169 ?auto_20168 ) ) ( ON ?auto_20165 ?auto_20164 ) ( ON-TABLE ?auto_20168 ) ( ON ?auto_20166 ?auto_20165 ) ( ON ?auto_20167 ?auto_20166 ) ( CLEAR ?auto_20167 ) ( HOLDING ?auto_20169 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20169 )
      ( MAKE-3PILE ?auto_20164 ?auto_20165 ?auto_20166 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20170 - BLOCK
      ?auto_20171 - BLOCK
      ?auto_20172 - BLOCK
    )
    :vars
    (
      ?auto_20173 - BLOCK
      ?auto_20175 - BLOCK
      ?auto_20174 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20170 ?auto_20171 ) ) ( not ( = ?auto_20170 ?auto_20172 ) ) ( not ( = ?auto_20171 ?auto_20172 ) ) ( not ( = ?auto_20170 ?auto_20173 ) ) ( not ( = ?auto_20171 ?auto_20173 ) ) ( not ( = ?auto_20172 ?auto_20173 ) ) ( not ( = ?auto_20175 ?auto_20173 ) ) ( not ( = ?auto_20175 ?auto_20172 ) ) ( not ( = ?auto_20175 ?auto_20171 ) ) ( not ( = ?auto_20170 ?auto_20175 ) ) ( ON ?auto_20170 ?auto_20174 ) ( not ( = ?auto_20170 ?auto_20174 ) ) ( not ( = ?auto_20171 ?auto_20174 ) ) ( not ( = ?auto_20172 ?auto_20174 ) ) ( not ( = ?auto_20173 ?auto_20174 ) ) ( not ( = ?auto_20175 ?auto_20174 ) ) ( ON ?auto_20171 ?auto_20170 ) ( ON-TABLE ?auto_20174 ) ( ON ?auto_20172 ?auto_20171 ) ( ON ?auto_20173 ?auto_20172 ) ( ON ?auto_20175 ?auto_20173 ) ( CLEAR ?auto_20175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20174 ?auto_20170 ?auto_20171 ?auto_20172 ?auto_20173 )
      ( MAKE-3PILE ?auto_20170 ?auto_20171 ?auto_20172 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20187 - BLOCK
    )
    :vars
    (
      ?auto_20190 - BLOCK
      ?auto_20189 - BLOCK
      ?auto_20188 - BLOCK
      ?auto_20191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20190 ?auto_20187 ) ( ON-TABLE ?auto_20187 ) ( not ( = ?auto_20187 ?auto_20190 ) ) ( not ( = ?auto_20187 ?auto_20189 ) ) ( not ( = ?auto_20187 ?auto_20188 ) ) ( not ( = ?auto_20190 ?auto_20189 ) ) ( not ( = ?auto_20190 ?auto_20188 ) ) ( not ( = ?auto_20189 ?auto_20188 ) ) ( ON ?auto_20189 ?auto_20190 ) ( CLEAR ?auto_20189 ) ( HOLDING ?auto_20188 ) ( CLEAR ?auto_20191 ) ( ON-TABLE ?auto_20191 ) ( not ( = ?auto_20191 ?auto_20188 ) ) ( not ( = ?auto_20187 ?auto_20191 ) ) ( not ( = ?auto_20190 ?auto_20191 ) ) ( not ( = ?auto_20189 ?auto_20191 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20191 ?auto_20188 )
      ( MAKE-1PILE ?auto_20187 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20192 - BLOCK
    )
    :vars
    (
      ?auto_20195 - BLOCK
      ?auto_20194 - BLOCK
      ?auto_20196 - BLOCK
      ?auto_20193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20195 ?auto_20192 ) ( ON-TABLE ?auto_20192 ) ( not ( = ?auto_20192 ?auto_20195 ) ) ( not ( = ?auto_20192 ?auto_20194 ) ) ( not ( = ?auto_20192 ?auto_20196 ) ) ( not ( = ?auto_20195 ?auto_20194 ) ) ( not ( = ?auto_20195 ?auto_20196 ) ) ( not ( = ?auto_20194 ?auto_20196 ) ) ( ON ?auto_20194 ?auto_20195 ) ( CLEAR ?auto_20193 ) ( ON-TABLE ?auto_20193 ) ( not ( = ?auto_20193 ?auto_20196 ) ) ( not ( = ?auto_20192 ?auto_20193 ) ) ( not ( = ?auto_20195 ?auto_20193 ) ) ( not ( = ?auto_20194 ?auto_20193 ) ) ( ON ?auto_20196 ?auto_20194 ) ( CLEAR ?auto_20196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20192 ?auto_20195 ?auto_20194 )
      ( MAKE-1PILE ?auto_20192 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20197 - BLOCK
    )
    :vars
    (
      ?auto_20198 - BLOCK
      ?auto_20200 - BLOCK
      ?auto_20201 - BLOCK
      ?auto_20199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20198 ?auto_20197 ) ( ON-TABLE ?auto_20197 ) ( not ( = ?auto_20197 ?auto_20198 ) ) ( not ( = ?auto_20197 ?auto_20200 ) ) ( not ( = ?auto_20197 ?auto_20201 ) ) ( not ( = ?auto_20198 ?auto_20200 ) ) ( not ( = ?auto_20198 ?auto_20201 ) ) ( not ( = ?auto_20200 ?auto_20201 ) ) ( ON ?auto_20200 ?auto_20198 ) ( not ( = ?auto_20199 ?auto_20201 ) ) ( not ( = ?auto_20197 ?auto_20199 ) ) ( not ( = ?auto_20198 ?auto_20199 ) ) ( not ( = ?auto_20200 ?auto_20199 ) ) ( ON ?auto_20201 ?auto_20200 ) ( CLEAR ?auto_20201 ) ( HOLDING ?auto_20199 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20199 )
      ( MAKE-1PILE ?auto_20197 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20208 - BLOCK
    )
    :vars
    (
      ?auto_20212 - BLOCK
      ?auto_20211 - BLOCK
      ?auto_20210 - BLOCK
      ?auto_20209 - BLOCK
      ?auto_20213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20212 ?auto_20208 ) ( ON-TABLE ?auto_20208 ) ( not ( = ?auto_20208 ?auto_20212 ) ) ( not ( = ?auto_20208 ?auto_20211 ) ) ( not ( = ?auto_20208 ?auto_20210 ) ) ( not ( = ?auto_20212 ?auto_20211 ) ) ( not ( = ?auto_20212 ?auto_20210 ) ) ( not ( = ?auto_20211 ?auto_20210 ) ) ( ON ?auto_20211 ?auto_20212 ) ( not ( = ?auto_20209 ?auto_20210 ) ) ( not ( = ?auto_20208 ?auto_20209 ) ) ( not ( = ?auto_20212 ?auto_20209 ) ) ( not ( = ?auto_20211 ?auto_20209 ) ) ( ON ?auto_20210 ?auto_20211 ) ( CLEAR ?auto_20210 ) ( ON ?auto_20209 ?auto_20213 ) ( CLEAR ?auto_20209 ) ( HAND-EMPTY ) ( not ( = ?auto_20208 ?auto_20213 ) ) ( not ( = ?auto_20212 ?auto_20213 ) ) ( not ( = ?auto_20211 ?auto_20213 ) ) ( not ( = ?auto_20210 ?auto_20213 ) ) ( not ( = ?auto_20209 ?auto_20213 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20209 ?auto_20213 )
      ( MAKE-1PILE ?auto_20208 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20214 - BLOCK
    )
    :vars
    (
      ?auto_20216 - BLOCK
      ?auto_20218 - BLOCK
      ?auto_20217 - BLOCK
      ?auto_20215 - BLOCK
      ?auto_20219 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20216 ?auto_20214 ) ( ON-TABLE ?auto_20214 ) ( not ( = ?auto_20214 ?auto_20216 ) ) ( not ( = ?auto_20214 ?auto_20218 ) ) ( not ( = ?auto_20214 ?auto_20217 ) ) ( not ( = ?auto_20216 ?auto_20218 ) ) ( not ( = ?auto_20216 ?auto_20217 ) ) ( not ( = ?auto_20218 ?auto_20217 ) ) ( ON ?auto_20218 ?auto_20216 ) ( not ( = ?auto_20215 ?auto_20217 ) ) ( not ( = ?auto_20214 ?auto_20215 ) ) ( not ( = ?auto_20216 ?auto_20215 ) ) ( not ( = ?auto_20218 ?auto_20215 ) ) ( ON ?auto_20215 ?auto_20219 ) ( CLEAR ?auto_20215 ) ( not ( = ?auto_20214 ?auto_20219 ) ) ( not ( = ?auto_20216 ?auto_20219 ) ) ( not ( = ?auto_20218 ?auto_20219 ) ) ( not ( = ?auto_20217 ?auto_20219 ) ) ( not ( = ?auto_20215 ?auto_20219 ) ) ( HOLDING ?auto_20217 ) ( CLEAR ?auto_20218 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20214 ?auto_20216 ?auto_20218 ?auto_20217 )
      ( MAKE-1PILE ?auto_20214 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20248 - BLOCK
      ?auto_20249 - BLOCK
      ?auto_20250 - BLOCK
      ?auto_20251 - BLOCK
    )
    :vars
    (
      ?auto_20252 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20248 ) ( ON ?auto_20249 ?auto_20248 ) ( not ( = ?auto_20248 ?auto_20249 ) ) ( not ( = ?auto_20248 ?auto_20250 ) ) ( not ( = ?auto_20248 ?auto_20251 ) ) ( not ( = ?auto_20249 ?auto_20250 ) ) ( not ( = ?auto_20249 ?auto_20251 ) ) ( not ( = ?auto_20250 ?auto_20251 ) ) ( ON ?auto_20251 ?auto_20252 ) ( not ( = ?auto_20248 ?auto_20252 ) ) ( not ( = ?auto_20249 ?auto_20252 ) ) ( not ( = ?auto_20250 ?auto_20252 ) ) ( not ( = ?auto_20251 ?auto_20252 ) ) ( CLEAR ?auto_20249 ) ( ON ?auto_20250 ?auto_20251 ) ( CLEAR ?auto_20250 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20252 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20252 ?auto_20251 )
      ( MAKE-4PILE ?auto_20248 ?auto_20249 ?auto_20250 ?auto_20251 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20253 - BLOCK
      ?auto_20254 - BLOCK
      ?auto_20255 - BLOCK
      ?auto_20256 - BLOCK
    )
    :vars
    (
      ?auto_20257 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20253 ) ( not ( = ?auto_20253 ?auto_20254 ) ) ( not ( = ?auto_20253 ?auto_20255 ) ) ( not ( = ?auto_20253 ?auto_20256 ) ) ( not ( = ?auto_20254 ?auto_20255 ) ) ( not ( = ?auto_20254 ?auto_20256 ) ) ( not ( = ?auto_20255 ?auto_20256 ) ) ( ON ?auto_20256 ?auto_20257 ) ( not ( = ?auto_20253 ?auto_20257 ) ) ( not ( = ?auto_20254 ?auto_20257 ) ) ( not ( = ?auto_20255 ?auto_20257 ) ) ( not ( = ?auto_20256 ?auto_20257 ) ) ( ON ?auto_20255 ?auto_20256 ) ( CLEAR ?auto_20255 ) ( ON-TABLE ?auto_20257 ) ( HOLDING ?auto_20254 ) ( CLEAR ?auto_20253 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20253 ?auto_20254 )
      ( MAKE-4PILE ?auto_20253 ?auto_20254 ?auto_20255 ?auto_20256 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20258 - BLOCK
      ?auto_20259 - BLOCK
      ?auto_20260 - BLOCK
      ?auto_20261 - BLOCK
    )
    :vars
    (
      ?auto_20262 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20258 ) ( not ( = ?auto_20258 ?auto_20259 ) ) ( not ( = ?auto_20258 ?auto_20260 ) ) ( not ( = ?auto_20258 ?auto_20261 ) ) ( not ( = ?auto_20259 ?auto_20260 ) ) ( not ( = ?auto_20259 ?auto_20261 ) ) ( not ( = ?auto_20260 ?auto_20261 ) ) ( ON ?auto_20261 ?auto_20262 ) ( not ( = ?auto_20258 ?auto_20262 ) ) ( not ( = ?auto_20259 ?auto_20262 ) ) ( not ( = ?auto_20260 ?auto_20262 ) ) ( not ( = ?auto_20261 ?auto_20262 ) ) ( ON ?auto_20260 ?auto_20261 ) ( ON-TABLE ?auto_20262 ) ( CLEAR ?auto_20258 ) ( ON ?auto_20259 ?auto_20260 ) ( CLEAR ?auto_20259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20262 ?auto_20261 ?auto_20260 )
      ( MAKE-4PILE ?auto_20258 ?auto_20259 ?auto_20260 ?auto_20261 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20263 - BLOCK
      ?auto_20264 - BLOCK
      ?auto_20265 - BLOCK
      ?auto_20266 - BLOCK
    )
    :vars
    (
      ?auto_20267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20263 ?auto_20264 ) ) ( not ( = ?auto_20263 ?auto_20265 ) ) ( not ( = ?auto_20263 ?auto_20266 ) ) ( not ( = ?auto_20264 ?auto_20265 ) ) ( not ( = ?auto_20264 ?auto_20266 ) ) ( not ( = ?auto_20265 ?auto_20266 ) ) ( ON ?auto_20266 ?auto_20267 ) ( not ( = ?auto_20263 ?auto_20267 ) ) ( not ( = ?auto_20264 ?auto_20267 ) ) ( not ( = ?auto_20265 ?auto_20267 ) ) ( not ( = ?auto_20266 ?auto_20267 ) ) ( ON ?auto_20265 ?auto_20266 ) ( ON-TABLE ?auto_20267 ) ( ON ?auto_20264 ?auto_20265 ) ( CLEAR ?auto_20264 ) ( HOLDING ?auto_20263 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20263 )
      ( MAKE-4PILE ?auto_20263 ?auto_20264 ?auto_20265 ?auto_20266 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20268 - BLOCK
      ?auto_20269 - BLOCK
      ?auto_20270 - BLOCK
      ?auto_20271 - BLOCK
    )
    :vars
    (
      ?auto_20272 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20268 ?auto_20269 ) ) ( not ( = ?auto_20268 ?auto_20270 ) ) ( not ( = ?auto_20268 ?auto_20271 ) ) ( not ( = ?auto_20269 ?auto_20270 ) ) ( not ( = ?auto_20269 ?auto_20271 ) ) ( not ( = ?auto_20270 ?auto_20271 ) ) ( ON ?auto_20271 ?auto_20272 ) ( not ( = ?auto_20268 ?auto_20272 ) ) ( not ( = ?auto_20269 ?auto_20272 ) ) ( not ( = ?auto_20270 ?auto_20272 ) ) ( not ( = ?auto_20271 ?auto_20272 ) ) ( ON ?auto_20270 ?auto_20271 ) ( ON-TABLE ?auto_20272 ) ( ON ?auto_20269 ?auto_20270 ) ( ON ?auto_20268 ?auto_20269 ) ( CLEAR ?auto_20268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20272 ?auto_20271 ?auto_20270 ?auto_20269 )
      ( MAKE-4PILE ?auto_20268 ?auto_20269 ?auto_20270 ?auto_20271 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20277 - BLOCK
      ?auto_20278 - BLOCK
      ?auto_20279 - BLOCK
      ?auto_20280 - BLOCK
    )
    :vars
    (
      ?auto_20281 - BLOCK
      ?auto_20282 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20277 ?auto_20278 ) ) ( not ( = ?auto_20277 ?auto_20279 ) ) ( not ( = ?auto_20277 ?auto_20280 ) ) ( not ( = ?auto_20278 ?auto_20279 ) ) ( not ( = ?auto_20278 ?auto_20280 ) ) ( not ( = ?auto_20279 ?auto_20280 ) ) ( ON ?auto_20280 ?auto_20281 ) ( not ( = ?auto_20277 ?auto_20281 ) ) ( not ( = ?auto_20278 ?auto_20281 ) ) ( not ( = ?auto_20279 ?auto_20281 ) ) ( not ( = ?auto_20280 ?auto_20281 ) ) ( ON ?auto_20279 ?auto_20280 ) ( ON-TABLE ?auto_20281 ) ( ON ?auto_20278 ?auto_20279 ) ( CLEAR ?auto_20278 ) ( ON ?auto_20277 ?auto_20282 ) ( CLEAR ?auto_20277 ) ( HAND-EMPTY ) ( not ( = ?auto_20277 ?auto_20282 ) ) ( not ( = ?auto_20278 ?auto_20282 ) ) ( not ( = ?auto_20279 ?auto_20282 ) ) ( not ( = ?auto_20280 ?auto_20282 ) ) ( not ( = ?auto_20281 ?auto_20282 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20277 ?auto_20282 )
      ( MAKE-4PILE ?auto_20277 ?auto_20278 ?auto_20279 ?auto_20280 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20283 - BLOCK
      ?auto_20284 - BLOCK
      ?auto_20285 - BLOCK
      ?auto_20286 - BLOCK
    )
    :vars
    (
      ?auto_20287 - BLOCK
      ?auto_20288 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20283 ?auto_20284 ) ) ( not ( = ?auto_20283 ?auto_20285 ) ) ( not ( = ?auto_20283 ?auto_20286 ) ) ( not ( = ?auto_20284 ?auto_20285 ) ) ( not ( = ?auto_20284 ?auto_20286 ) ) ( not ( = ?auto_20285 ?auto_20286 ) ) ( ON ?auto_20286 ?auto_20287 ) ( not ( = ?auto_20283 ?auto_20287 ) ) ( not ( = ?auto_20284 ?auto_20287 ) ) ( not ( = ?auto_20285 ?auto_20287 ) ) ( not ( = ?auto_20286 ?auto_20287 ) ) ( ON ?auto_20285 ?auto_20286 ) ( ON-TABLE ?auto_20287 ) ( ON ?auto_20283 ?auto_20288 ) ( CLEAR ?auto_20283 ) ( not ( = ?auto_20283 ?auto_20288 ) ) ( not ( = ?auto_20284 ?auto_20288 ) ) ( not ( = ?auto_20285 ?auto_20288 ) ) ( not ( = ?auto_20286 ?auto_20288 ) ) ( not ( = ?auto_20287 ?auto_20288 ) ) ( HOLDING ?auto_20284 ) ( CLEAR ?auto_20285 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20287 ?auto_20286 ?auto_20285 ?auto_20284 )
      ( MAKE-4PILE ?auto_20283 ?auto_20284 ?auto_20285 ?auto_20286 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20289 - BLOCK
      ?auto_20290 - BLOCK
      ?auto_20291 - BLOCK
      ?auto_20292 - BLOCK
    )
    :vars
    (
      ?auto_20294 - BLOCK
      ?auto_20293 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20289 ?auto_20290 ) ) ( not ( = ?auto_20289 ?auto_20291 ) ) ( not ( = ?auto_20289 ?auto_20292 ) ) ( not ( = ?auto_20290 ?auto_20291 ) ) ( not ( = ?auto_20290 ?auto_20292 ) ) ( not ( = ?auto_20291 ?auto_20292 ) ) ( ON ?auto_20292 ?auto_20294 ) ( not ( = ?auto_20289 ?auto_20294 ) ) ( not ( = ?auto_20290 ?auto_20294 ) ) ( not ( = ?auto_20291 ?auto_20294 ) ) ( not ( = ?auto_20292 ?auto_20294 ) ) ( ON ?auto_20291 ?auto_20292 ) ( ON-TABLE ?auto_20294 ) ( ON ?auto_20289 ?auto_20293 ) ( not ( = ?auto_20289 ?auto_20293 ) ) ( not ( = ?auto_20290 ?auto_20293 ) ) ( not ( = ?auto_20291 ?auto_20293 ) ) ( not ( = ?auto_20292 ?auto_20293 ) ) ( not ( = ?auto_20294 ?auto_20293 ) ) ( CLEAR ?auto_20291 ) ( ON ?auto_20290 ?auto_20289 ) ( CLEAR ?auto_20290 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20293 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20293 ?auto_20289 )
      ( MAKE-4PILE ?auto_20289 ?auto_20290 ?auto_20291 ?auto_20292 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20295 - BLOCK
      ?auto_20296 - BLOCK
      ?auto_20297 - BLOCK
      ?auto_20298 - BLOCK
    )
    :vars
    (
      ?auto_20300 - BLOCK
      ?auto_20299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20295 ?auto_20296 ) ) ( not ( = ?auto_20295 ?auto_20297 ) ) ( not ( = ?auto_20295 ?auto_20298 ) ) ( not ( = ?auto_20296 ?auto_20297 ) ) ( not ( = ?auto_20296 ?auto_20298 ) ) ( not ( = ?auto_20297 ?auto_20298 ) ) ( ON ?auto_20298 ?auto_20300 ) ( not ( = ?auto_20295 ?auto_20300 ) ) ( not ( = ?auto_20296 ?auto_20300 ) ) ( not ( = ?auto_20297 ?auto_20300 ) ) ( not ( = ?auto_20298 ?auto_20300 ) ) ( ON-TABLE ?auto_20300 ) ( ON ?auto_20295 ?auto_20299 ) ( not ( = ?auto_20295 ?auto_20299 ) ) ( not ( = ?auto_20296 ?auto_20299 ) ) ( not ( = ?auto_20297 ?auto_20299 ) ) ( not ( = ?auto_20298 ?auto_20299 ) ) ( not ( = ?auto_20300 ?auto_20299 ) ) ( ON ?auto_20296 ?auto_20295 ) ( CLEAR ?auto_20296 ) ( ON-TABLE ?auto_20299 ) ( HOLDING ?auto_20297 ) ( CLEAR ?auto_20298 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20300 ?auto_20298 ?auto_20297 )
      ( MAKE-4PILE ?auto_20295 ?auto_20296 ?auto_20297 ?auto_20298 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20301 - BLOCK
      ?auto_20302 - BLOCK
      ?auto_20303 - BLOCK
      ?auto_20304 - BLOCK
    )
    :vars
    (
      ?auto_20305 - BLOCK
      ?auto_20306 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20301 ?auto_20302 ) ) ( not ( = ?auto_20301 ?auto_20303 ) ) ( not ( = ?auto_20301 ?auto_20304 ) ) ( not ( = ?auto_20302 ?auto_20303 ) ) ( not ( = ?auto_20302 ?auto_20304 ) ) ( not ( = ?auto_20303 ?auto_20304 ) ) ( ON ?auto_20304 ?auto_20305 ) ( not ( = ?auto_20301 ?auto_20305 ) ) ( not ( = ?auto_20302 ?auto_20305 ) ) ( not ( = ?auto_20303 ?auto_20305 ) ) ( not ( = ?auto_20304 ?auto_20305 ) ) ( ON-TABLE ?auto_20305 ) ( ON ?auto_20301 ?auto_20306 ) ( not ( = ?auto_20301 ?auto_20306 ) ) ( not ( = ?auto_20302 ?auto_20306 ) ) ( not ( = ?auto_20303 ?auto_20306 ) ) ( not ( = ?auto_20304 ?auto_20306 ) ) ( not ( = ?auto_20305 ?auto_20306 ) ) ( ON ?auto_20302 ?auto_20301 ) ( ON-TABLE ?auto_20306 ) ( CLEAR ?auto_20304 ) ( ON ?auto_20303 ?auto_20302 ) ( CLEAR ?auto_20303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20306 ?auto_20301 ?auto_20302 )
      ( MAKE-4PILE ?auto_20301 ?auto_20302 ?auto_20303 ?auto_20304 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20307 - BLOCK
      ?auto_20308 - BLOCK
      ?auto_20309 - BLOCK
      ?auto_20310 - BLOCK
    )
    :vars
    (
      ?auto_20311 - BLOCK
      ?auto_20312 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20307 ?auto_20308 ) ) ( not ( = ?auto_20307 ?auto_20309 ) ) ( not ( = ?auto_20307 ?auto_20310 ) ) ( not ( = ?auto_20308 ?auto_20309 ) ) ( not ( = ?auto_20308 ?auto_20310 ) ) ( not ( = ?auto_20309 ?auto_20310 ) ) ( not ( = ?auto_20307 ?auto_20311 ) ) ( not ( = ?auto_20308 ?auto_20311 ) ) ( not ( = ?auto_20309 ?auto_20311 ) ) ( not ( = ?auto_20310 ?auto_20311 ) ) ( ON-TABLE ?auto_20311 ) ( ON ?auto_20307 ?auto_20312 ) ( not ( = ?auto_20307 ?auto_20312 ) ) ( not ( = ?auto_20308 ?auto_20312 ) ) ( not ( = ?auto_20309 ?auto_20312 ) ) ( not ( = ?auto_20310 ?auto_20312 ) ) ( not ( = ?auto_20311 ?auto_20312 ) ) ( ON ?auto_20308 ?auto_20307 ) ( ON-TABLE ?auto_20312 ) ( ON ?auto_20309 ?auto_20308 ) ( CLEAR ?auto_20309 ) ( HOLDING ?auto_20310 ) ( CLEAR ?auto_20311 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20311 ?auto_20310 )
      ( MAKE-4PILE ?auto_20307 ?auto_20308 ?auto_20309 ?auto_20310 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20313 - BLOCK
      ?auto_20314 - BLOCK
      ?auto_20315 - BLOCK
      ?auto_20316 - BLOCK
    )
    :vars
    (
      ?auto_20317 - BLOCK
      ?auto_20318 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20313 ?auto_20314 ) ) ( not ( = ?auto_20313 ?auto_20315 ) ) ( not ( = ?auto_20313 ?auto_20316 ) ) ( not ( = ?auto_20314 ?auto_20315 ) ) ( not ( = ?auto_20314 ?auto_20316 ) ) ( not ( = ?auto_20315 ?auto_20316 ) ) ( not ( = ?auto_20313 ?auto_20317 ) ) ( not ( = ?auto_20314 ?auto_20317 ) ) ( not ( = ?auto_20315 ?auto_20317 ) ) ( not ( = ?auto_20316 ?auto_20317 ) ) ( ON-TABLE ?auto_20317 ) ( ON ?auto_20313 ?auto_20318 ) ( not ( = ?auto_20313 ?auto_20318 ) ) ( not ( = ?auto_20314 ?auto_20318 ) ) ( not ( = ?auto_20315 ?auto_20318 ) ) ( not ( = ?auto_20316 ?auto_20318 ) ) ( not ( = ?auto_20317 ?auto_20318 ) ) ( ON ?auto_20314 ?auto_20313 ) ( ON-TABLE ?auto_20318 ) ( ON ?auto_20315 ?auto_20314 ) ( CLEAR ?auto_20317 ) ( ON ?auto_20316 ?auto_20315 ) ( CLEAR ?auto_20316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20318 ?auto_20313 ?auto_20314 ?auto_20315 )
      ( MAKE-4PILE ?auto_20313 ?auto_20314 ?auto_20315 ?auto_20316 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20319 - BLOCK
      ?auto_20320 - BLOCK
      ?auto_20321 - BLOCK
      ?auto_20322 - BLOCK
    )
    :vars
    (
      ?auto_20323 - BLOCK
      ?auto_20324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20319 ?auto_20320 ) ) ( not ( = ?auto_20319 ?auto_20321 ) ) ( not ( = ?auto_20319 ?auto_20322 ) ) ( not ( = ?auto_20320 ?auto_20321 ) ) ( not ( = ?auto_20320 ?auto_20322 ) ) ( not ( = ?auto_20321 ?auto_20322 ) ) ( not ( = ?auto_20319 ?auto_20323 ) ) ( not ( = ?auto_20320 ?auto_20323 ) ) ( not ( = ?auto_20321 ?auto_20323 ) ) ( not ( = ?auto_20322 ?auto_20323 ) ) ( ON ?auto_20319 ?auto_20324 ) ( not ( = ?auto_20319 ?auto_20324 ) ) ( not ( = ?auto_20320 ?auto_20324 ) ) ( not ( = ?auto_20321 ?auto_20324 ) ) ( not ( = ?auto_20322 ?auto_20324 ) ) ( not ( = ?auto_20323 ?auto_20324 ) ) ( ON ?auto_20320 ?auto_20319 ) ( ON-TABLE ?auto_20324 ) ( ON ?auto_20321 ?auto_20320 ) ( ON ?auto_20322 ?auto_20321 ) ( CLEAR ?auto_20322 ) ( HOLDING ?auto_20323 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20323 )
      ( MAKE-4PILE ?auto_20319 ?auto_20320 ?auto_20321 ?auto_20322 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20325 - BLOCK
      ?auto_20326 - BLOCK
      ?auto_20327 - BLOCK
      ?auto_20328 - BLOCK
    )
    :vars
    (
      ?auto_20329 - BLOCK
      ?auto_20330 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20325 ?auto_20326 ) ) ( not ( = ?auto_20325 ?auto_20327 ) ) ( not ( = ?auto_20325 ?auto_20328 ) ) ( not ( = ?auto_20326 ?auto_20327 ) ) ( not ( = ?auto_20326 ?auto_20328 ) ) ( not ( = ?auto_20327 ?auto_20328 ) ) ( not ( = ?auto_20325 ?auto_20329 ) ) ( not ( = ?auto_20326 ?auto_20329 ) ) ( not ( = ?auto_20327 ?auto_20329 ) ) ( not ( = ?auto_20328 ?auto_20329 ) ) ( ON ?auto_20325 ?auto_20330 ) ( not ( = ?auto_20325 ?auto_20330 ) ) ( not ( = ?auto_20326 ?auto_20330 ) ) ( not ( = ?auto_20327 ?auto_20330 ) ) ( not ( = ?auto_20328 ?auto_20330 ) ) ( not ( = ?auto_20329 ?auto_20330 ) ) ( ON ?auto_20326 ?auto_20325 ) ( ON-TABLE ?auto_20330 ) ( ON ?auto_20327 ?auto_20326 ) ( ON ?auto_20328 ?auto_20327 ) ( ON ?auto_20329 ?auto_20328 ) ( CLEAR ?auto_20329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20330 ?auto_20325 ?auto_20326 ?auto_20327 ?auto_20328 )
      ( MAKE-4PILE ?auto_20325 ?auto_20326 ?auto_20327 ?auto_20328 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20341 - BLOCK
      ?auto_20342 - BLOCK
      ?auto_20343 - BLOCK
      ?auto_20344 - BLOCK
      ?auto_20345 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_20344 ) ( ON-TABLE ?auto_20341 ) ( ON ?auto_20342 ?auto_20341 ) ( ON ?auto_20343 ?auto_20342 ) ( ON ?auto_20344 ?auto_20343 ) ( not ( = ?auto_20341 ?auto_20342 ) ) ( not ( = ?auto_20341 ?auto_20343 ) ) ( not ( = ?auto_20341 ?auto_20344 ) ) ( not ( = ?auto_20341 ?auto_20345 ) ) ( not ( = ?auto_20342 ?auto_20343 ) ) ( not ( = ?auto_20342 ?auto_20344 ) ) ( not ( = ?auto_20342 ?auto_20345 ) ) ( not ( = ?auto_20343 ?auto_20344 ) ) ( not ( = ?auto_20343 ?auto_20345 ) ) ( not ( = ?auto_20344 ?auto_20345 ) ) ( ON-TABLE ?auto_20345 ) ( CLEAR ?auto_20345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_20345 )
      ( MAKE-5PILE ?auto_20341 ?auto_20342 ?auto_20343 ?auto_20344 ?auto_20345 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20346 - BLOCK
      ?auto_20347 - BLOCK
      ?auto_20348 - BLOCK
      ?auto_20349 - BLOCK
      ?auto_20350 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20346 ) ( ON ?auto_20347 ?auto_20346 ) ( ON ?auto_20348 ?auto_20347 ) ( not ( = ?auto_20346 ?auto_20347 ) ) ( not ( = ?auto_20346 ?auto_20348 ) ) ( not ( = ?auto_20346 ?auto_20349 ) ) ( not ( = ?auto_20346 ?auto_20350 ) ) ( not ( = ?auto_20347 ?auto_20348 ) ) ( not ( = ?auto_20347 ?auto_20349 ) ) ( not ( = ?auto_20347 ?auto_20350 ) ) ( not ( = ?auto_20348 ?auto_20349 ) ) ( not ( = ?auto_20348 ?auto_20350 ) ) ( not ( = ?auto_20349 ?auto_20350 ) ) ( ON-TABLE ?auto_20350 ) ( CLEAR ?auto_20350 ) ( HOLDING ?auto_20349 ) ( CLEAR ?auto_20348 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20346 ?auto_20347 ?auto_20348 ?auto_20349 )
      ( MAKE-5PILE ?auto_20346 ?auto_20347 ?auto_20348 ?auto_20349 ?auto_20350 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20351 - BLOCK
      ?auto_20352 - BLOCK
      ?auto_20353 - BLOCK
      ?auto_20354 - BLOCK
      ?auto_20355 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20351 ) ( ON ?auto_20352 ?auto_20351 ) ( ON ?auto_20353 ?auto_20352 ) ( not ( = ?auto_20351 ?auto_20352 ) ) ( not ( = ?auto_20351 ?auto_20353 ) ) ( not ( = ?auto_20351 ?auto_20354 ) ) ( not ( = ?auto_20351 ?auto_20355 ) ) ( not ( = ?auto_20352 ?auto_20353 ) ) ( not ( = ?auto_20352 ?auto_20354 ) ) ( not ( = ?auto_20352 ?auto_20355 ) ) ( not ( = ?auto_20353 ?auto_20354 ) ) ( not ( = ?auto_20353 ?auto_20355 ) ) ( not ( = ?auto_20354 ?auto_20355 ) ) ( ON-TABLE ?auto_20355 ) ( CLEAR ?auto_20353 ) ( ON ?auto_20354 ?auto_20355 ) ( CLEAR ?auto_20354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20355 )
      ( MAKE-5PILE ?auto_20351 ?auto_20352 ?auto_20353 ?auto_20354 ?auto_20355 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20356 - BLOCK
      ?auto_20357 - BLOCK
      ?auto_20358 - BLOCK
      ?auto_20359 - BLOCK
      ?auto_20360 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20356 ) ( ON ?auto_20357 ?auto_20356 ) ( not ( = ?auto_20356 ?auto_20357 ) ) ( not ( = ?auto_20356 ?auto_20358 ) ) ( not ( = ?auto_20356 ?auto_20359 ) ) ( not ( = ?auto_20356 ?auto_20360 ) ) ( not ( = ?auto_20357 ?auto_20358 ) ) ( not ( = ?auto_20357 ?auto_20359 ) ) ( not ( = ?auto_20357 ?auto_20360 ) ) ( not ( = ?auto_20358 ?auto_20359 ) ) ( not ( = ?auto_20358 ?auto_20360 ) ) ( not ( = ?auto_20359 ?auto_20360 ) ) ( ON-TABLE ?auto_20360 ) ( ON ?auto_20359 ?auto_20360 ) ( CLEAR ?auto_20359 ) ( HOLDING ?auto_20358 ) ( CLEAR ?auto_20357 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20356 ?auto_20357 ?auto_20358 )
      ( MAKE-5PILE ?auto_20356 ?auto_20357 ?auto_20358 ?auto_20359 ?auto_20360 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20361 - BLOCK
      ?auto_20362 - BLOCK
      ?auto_20363 - BLOCK
      ?auto_20364 - BLOCK
      ?auto_20365 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20361 ) ( ON ?auto_20362 ?auto_20361 ) ( not ( = ?auto_20361 ?auto_20362 ) ) ( not ( = ?auto_20361 ?auto_20363 ) ) ( not ( = ?auto_20361 ?auto_20364 ) ) ( not ( = ?auto_20361 ?auto_20365 ) ) ( not ( = ?auto_20362 ?auto_20363 ) ) ( not ( = ?auto_20362 ?auto_20364 ) ) ( not ( = ?auto_20362 ?auto_20365 ) ) ( not ( = ?auto_20363 ?auto_20364 ) ) ( not ( = ?auto_20363 ?auto_20365 ) ) ( not ( = ?auto_20364 ?auto_20365 ) ) ( ON-TABLE ?auto_20365 ) ( ON ?auto_20364 ?auto_20365 ) ( CLEAR ?auto_20362 ) ( ON ?auto_20363 ?auto_20364 ) ( CLEAR ?auto_20363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20365 ?auto_20364 )
      ( MAKE-5PILE ?auto_20361 ?auto_20362 ?auto_20363 ?auto_20364 ?auto_20365 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20366 - BLOCK
      ?auto_20367 - BLOCK
      ?auto_20368 - BLOCK
      ?auto_20369 - BLOCK
      ?auto_20370 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20366 ) ( not ( = ?auto_20366 ?auto_20367 ) ) ( not ( = ?auto_20366 ?auto_20368 ) ) ( not ( = ?auto_20366 ?auto_20369 ) ) ( not ( = ?auto_20366 ?auto_20370 ) ) ( not ( = ?auto_20367 ?auto_20368 ) ) ( not ( = ?auto_20367 ?auto_20369 ) ) ( not ( = ?auto_20367 ?auto_20370 ) ) ( not ( = ?auto_20368 ?auto_20369 ) ) ( not ( = ?auto_20368 ?auto_20370 ) ) ( not ( = ?auto_20369 ?auto_20370 ) ) ( ON-TABLE ?auto_20370 ) ( ON ?auto_20369 ?auto_20370 ) ( ON ?auto_20368 ?auto_20369 ) ( CLEAR ?auto_20368 ) ( HOLDING ?auto_20367 ) ( CLEAR ?auto_20366 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20366 ?auto_20367 )
      ( MAKE-5PILE ?auto_20366 ?auto_20367 ?auto_20368 ?auto_20369 ?auto_20370 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20371 - BLOCK
      ?auto_20372 - BLOCK
      ?auto_20373 - BLOCK
      ?auto_20374 - BLOCK
      ?auto_20375 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20371 ) ( not ( = ?auto_20371 ?auto_20372 ) ) ( not ( = ?auto_20371 ?auto_20373 ) ) ( not ( = ?auto_20371 ?auto_20374 ) ) ( not ( = ?auto_20371 ?auto_20375 ) ) ( not ( = ?auto_20372 ?auto_20373 ) ) ( not ( = ?auto_20372 ?auto_20374 ) ) ( not ( = ?auto_20372 ?auto_20375 ) ) ( not ( = ?auto_20373 ?auto_20374 ) ) ( not ( = ?auto_20373 ?auto_20375 ) ) ( not ( = ?auto_20374 ?auto_20375 ) ) ( ON-TABLE ?auto_20375 ) ( ON ?auto_20374 ?auto_20375 ) ( ON ?auto_20373 ?auto_20374 ) ( CLEAR ?auto_20371 ) ( ON ?auto_20372 ?auto_20373 ) ( CLEAR ?auto_20372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20375 ?auto_20374 ?auto_20373 )
      ( MAKE-5PILE ?auto_20371 ?auto_20372 ?auto_20373 ?auto_20374 ?auto_20375 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20376 - BLOCK
      ?auto_20377 - BLOCK
      ?auto_20378 - BLOCK
      ?auto_20379 - BLOCK
      ?auto_20380 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20376 ?auto_20377 ) ) ( not ( = ?auto_20376 ?auto_20378 ) ) ( not ( = ?auto_20376 ?auto_20379 ) ) ( not ( = ?auto_20376 ?auto_20380 ) ) ( not ( = ?auto_20377 ?auto_20378 ) ) ( not ( = ?auto_20377 ?auto_20379 ) ) ( not ( = ?auto_20377 ?auto_20380 ) ) ( not ( = ?auto_20378 ?auto_20379 ) ) ( not ( = ?auto_20378 ?auto_20380 ) ) ( not ( = ?auto_20379 ?auto_20380 ) ) ( ON-TABLE ?auto_20380 ) ( ON ?auto_20379 ?auto_20380 ) ( ON ?auto_20378 ?auto_20379 ) ( ON ?auto_20377 ?auto_20378 ) ( CLEAR ?auto_20377 ) ( HOLDING ?auto_20376 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20376 )
      ( MAKE-5PILE ?auto_20376 ?auto_20377 ?auto_20378 ?auto_20379 ?auto_20380 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20381 - BLOCK
      ?auto_20382 - BLOCK
      ?auto_20383 - BLOCK
      ?auto_20384 - BLOCK
      ?auto_20385 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20381 ?auto_20382 ) ) ( not ( = ?auto_20381 ?auto_20383 ) ) ( not ( = ?auto_20381 ?auto_20384 ) ) ( not ( = ?auto_20381 ?auto_20385 ) ) ( not ( = ?auto_20382 ?auto_20383 ) ) ( not ( = ?auto_20382 ?auto_20384 ) ) ( not ( = ?auto_20382 ?auto_20385 ) ) ( not ( = ?auto_20383 ?auto_20384 ) ) ( not ( = ?auto_20383 ?auto_20385 ) ) ( not ( = ?auto_20384 ?auto_20385 ) ) ( ON-TABLE ?auto_20385 ) ( ON ?auto_20384 ?auto_20385 ) ( ON ?auto_20383 ?auto_20384 ) ( ON ?auto_20382 ?auto_20383 ) ( ON ?auto_20381 ?auto_20382 ) ( CLEAR ?auto_20381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20385 ?auto_20384 ?auto_20383 ?auto_20382 )
      ( MAKE-5PILE ?auto_20381 ?auto_20382 ?auto_20383 ?auto_20384 ?auto_20385 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20391 - BLOCK
      ?auto_20392 - BLOCK
      ?auto_20393 - BLOCK
      ?auto_20394 - BLOCK
      ?auto_20395 - BLOCK
    )
    :vars
    (
      ?auto_20396 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20391 ?auto_20392 ) ) ( not ( = ?auto_20391 ?auto_20393 ) ) ( not ( = ?auto_20391 ?auto_20394 ) ) ( not ( = ?auto_20391 ?auto_20395 ) ) ( not ( = ?auto_20392 ?auto_20393 ) ) ( not ( = ?auto_20392 ?auto_20394 ) ) ( not ( = ?auto_20392 ?auto_20395 ) ) ( not ( = ?auto_20393 ?auto_20394 ) ) ( not ( = ?auto_20393 ?auto_20395 ) ) ( not ( = ?auto_20394 ?auto_20395 ) ) ( ON-TABLE ?auto_20395 ) ( ON ?auto_20394 ?auto_20395 ) ( ON ?auto_20393 ?auto_20394 ) ( ON ?auto_20392 ?auto_20393 ) ( CLEAR ?auto_20392 ) ( ON ?auto_20391 ?auto_20396 ) ( CLEAR ?auto_20391 ) ( HAND-EMPTY ) ( not ( = ?auto_20391 ?auto_20396 ) ) ( not ( = ?auto_20392 ?auto_20396 ) ) ( not ( = ?auto_20393 ?auto_20396 ) ) ( not ( = ?auto_20394 ?auto_20396 ) ) ( not ( = ?auto_20395 ?auto_20396 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20391 ?auto_20396 )
      ( MAKE-5PILE ?auto_20391 ?auto_20392 ?auto_20393 ?auto_20394 ?auto_20395 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20397 - BLOCK
      ?auto_20398 - BLOCK
      ?auto_20399 - BLOCK
      ?auto_20400 - BLOCK
      ?auto_20401 - BLOCK
    )
    :vars
    (
      ?auto_20402 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20397 ?auto_20398 ) ) ( not ( = ?auto_20397 ?auto_20399 ) ) ( not ( = ?auto_20397 ?auto_20400 ) ) ( not ( = ?auto_20397 ?auto_20401 ) ) ( not ( = ?auto_20398 ?auto_20399 ) ) ( not ( = ?auto_20398 ?auto_20400 ) ) ( not ( = ?auto_20398 ?auto_20401 ) ) ( not ( = ?auto_20399 ?auto_20400 ) ) ( not ( = ?auto_20399 ?auto_20401 ) ) ( not ( = ?auto_20400 ?auto_20401 ) ) ( ON-TABLE ?auto_20401 ) ( ON ?auto_20400 ?auto_20401 ) ( ON ?auto_20399 ?auto_20400 ) ( ON ?auto_20397 ?auto_20402 ) ( CLEAR ?auto_20397 ) ( not ( = ?auto_20397 ?auto_20402 ) ) ( not ( = ?auto_20398 ?auto_20402 ) ) ( not ( = ?auto_20399 ?auto_20402 ) ) ( not ( = ?auto_20400 ?auto_20402 ) ) ( not ( = ?auto_20401 ?auto_20402 ) ) ( HOLDING ?auto_20398 ) ( CLEAR ?auto_20399 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20401 ?auto_20400 ?auto_20399 ?auto_20398 )
      ( MAKE-5PILE ?auto_20397 ?auto_20398 ?auto_20399 ?auto_20400 ?auto_20401 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20403 - BLOCK
      ?auto_20404 - BLOCK
      ?auto_20405 - BLOCK
      ?auto_20406 - BLOCK
      ?auto_20407 - BLOCK
    )
    :vars
    (
      ?auto_20408 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20403 ?auto_20404 ) ) ( not ( = ?auto_20403 ?auto_20405 ) ) ( not ( = ?auto_20403 ?auto_20406 ) ) ( not ( = ?auto_20403 ?auto_20407 ) ) ( not ( = ?auto_20404 ?auto_20405 ) ) ( not ( = ?auto_20404 ?auto_20406 ) ) ( not ( = ?auto_20404 ?auto_20407 ) ) ( not ( = ?auto_20405 ?auto_20406 ) ) ( not ( = ?auto_20405 ?auto_20407 ) ) ( not ( = ?auto_20406 ?auto_20407 ) ) ( ON-TABLE ?auto_20407 ) ( ON ?auto_20406 ?auto_20407 ) ( ON ?auto_20405 ?auto_20406 ) ( ON ?auto_20403 ?auto_20408 ) ( not ( = ?auto_20403 ?auto_20408 ) ) ( not ( = ?auto_20404 ?auto_20408 ) ) ( not ( = ?auto_20405 ?auto_20408 ) ) ( not ( = ?auto_20406 ?auto_20408 ) ) ( not ( = ?auto_20407 ?auto_20408 ) ) ( CLEAR ?auto_20405 ) ( ON ?auto_20404 ?auto_20403 ) ( CLEAR ?auto_20404 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20408 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20408 ?auto_20403 )
      ( MAKE-5PILE ?auto_20403 ?auto_20404 ?auto_20405 ?auto_20406 ?auto_20407 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20409 - BLOCK
      ?auto_20410 - BLOCK
      ?auto_20411 - BLOCK
      ?auto_20412 - BLOCK
      ?auto_20413 - BLOCK
    )
    :vars
    (
      ?auto_20414 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20409 ?auto_20410 ) ) ( not ( = ?auto_20409 ?auto_20411 ) ) ( not ( = ?auto_20409 ?auto_20412 ) ) ( not ( = ?auto_20409 ?auto_20413 ) ) ( not ( = ?auto_20410 ?auto_20411 ) ) ( not ( = ?auto_20410 ?auto_20412 ) ) ( not ( = ?auto_20410 ?auto_20413 ) ) ( not ( = ?auto_20411 ?auto_20412 ) ) ( not ( = ?auto_20411 ?auto_20413 ) ) ( not ( = ?auto_20412 ?auto_20413 ) ) ( ON-TABLE ?auto_20413 ) ( ON ?auto_20412 ?auto_20413 ) ( ON ?auto_20409 ?auto_20414 ) ( not ( = ?auto_20409 ?auto_20414 ) ) ( not ( = ?auto_20410 ?auto_20414 ) ) ( not ( = ?auto_20411 ?auto_20414 ) ) ( not ( = ?auto_20412 ?auto_20414 ) ) ( not ( = ?auto_20413 ?auto_20414 ) ) ( ON ?auto_20410 ?auto_20409 ) ( CLEAR ?auto_20410 ) ( ON-TABLE ?auto_20414 ) ( HOLDING ?auto_20411 ) ( CLEAR ?auto_20412 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20413 ?auto_20412 ?auto_20411 )
      ( MAKE-5PILE ?auto_20409 ?auto_20410 ?auto_20411 ?auto_20412 ?auto_20413 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20415 - BLOCK
      ?auto_20416 - BLOCK
      ?auto_20417 - BLOCK
      ?auto_20418 - BLOCK
      ?auto_20419 - BLOCK
    )
    :vars
    (
      ?auto_20420 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20415 ?auto_20416 ) ) ( not ( = ?auto_20415 ?auto_20417 ) ) ( not ( = ?auto_20415 ?auto_20418 ) ) ( not ( = ?auto_20415 ?auto_20419 ) ) ( not ( = ?auto_20416 ?auto_20417 ) ) ( not ( = ?auto_20416 ?auto_20418 ) ) ( not ( = ?auto_20416 ?auto_20419 ) ) ( not ( = ?auto_20417 ?auto_20418 ) ) ( not ( = ?auto_20417 ?auto_20419 ) ) ( not ( = ?auto_20418 ?auto_20419 ) ) ( ON-TABLE ?auto_20419 ) ( ON ?auto_20418 ?auto_20419 ) ( ON ?auto_20415 ?auto_20420 ) ( not ( = ?auto_20415 ?auto_20420 ) ) ( not ( = ?auto_20416 ?auto_20420 ) ) ( not ( = ?auto_20417 ?auto_20420 ) ) ( not ( = ?auto_20418 ?auto_20420 ) ) ( not ( = ?auto_20419 ?auto_20420 ) ) ( ON ?auto_20416 ?auto_20415 ) ( ON-TABLE ?auto_20420 ) ( CLEAR ?auto_20418 ) ( ON ?auto_20417 ?auto_20416 ) ( CLEAR ?auto_20417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20420 ?auto_20415 ?auto_20416 )
      ( MAKE-5PILE ?auto_20415 ?auto_20416 ?auto_20417 ?auto_20418 ?auto_20419 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20421 - BLOCK
      ?auto_20422 - BLOCK
      ?auto_20423 - BLOCK
      ?auto_20424 - BLOCK
      ?auto_20425 - BLOCK
    )
    :vars
    (
      ?auto_20426 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20421 ?auto_20422 ) ) ( not ( = ?auto_20421 ?auto_20423 ) ) ( not ( = ?auto_20421 ?auto_20424 ) ) ( not ( = ?auto_20421 ?auto_20425 ) ) ( not ( = ?auto_20422 ?auto_20423 ) ) ( not ( = ?auto_20422 ?auto_20424 ) ) ( not ( = ?auto_20422 ?auto_20425 ) ) ( not ( = ?auto_20423 ?auto_20424 ) ) ( not ( = ?auto_20423 ?auto_20425 ) ) ( not ( = ?auto_20424 ?auto_20425 ) ) ( ON-TABLE ?auto_20425 ) ( ON ?auto_20421 ?auto_20426 ) ( not ( = ?auto_20421 ?auto_20426 ) ) ( not ( = ?auto_20422 ?auto_20426 ) ) ( not ( = ?auto_20423 ?auto_20426 ) ) ( not ( = ?auto_20424 ?auto_20426 ) ) ( not ( = ?auto_20425 ?auto_20426 ) ) ( ON ?auto_20422 ?auto_20421 ) ( ON-TABLE ?auto_20426 ) ( ON ?auto_20423 ?auto_20422 ) ( CLEAR ?auto_20423 ) ( HOLDING ?auto_20424 ) ( CLEAR ?auto_20425 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20425 ?auto_20424 )
      ( MAKE-5PILE ?auto_20421 ?auto_20422 ?auto_20423 ?auto_20424 ?auto_20425 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20427 - BLOCK
      ?auto_20428 - BLOCK
      ?auto_20429 - BLOCK
      ?auto_20430 - BLOCK
      ?auto_20431 - BLOCK
    )
    :vars
    (
      ?auto_20432 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20427 ?auto_20428 ) ) ( not ( = ?auto_20427 ?auto_20429 ) ) ( not ( = ?auto_20427 ?auto_20430 ) ) ( not ( = ?auto_20427 ?auto_20431 ) ) ( not ( = ?auto_20428 ?auto_20429 ) ) ( not ( = ?auto_20428 ?auto_20430 ) ) ( not ( = ?auto_20428 ?auto_20431 ) ) ( not ( = ?auto_20429 ?auto_20430 ) ) ( not ( = ?auto_20429 ?auto_20431 ) ) ( not ( = ?auto_20430 ?auto_20431 ) ) ( ON-TABLE ?auto_20431 ) ( ON ?auto_20427 ?auto_20432 ) ( not ( = ?auto_20427 ?auto_20432 ) ) ( not ( = ?auto_20428 ?auto_20432 ) ) ( not ( = ?auto_20429 ?auto_20432 ) ) ( not ( = ?auto_20430 ?auto_20432 ) ) ( not ( = ?auto_20431 ?auto_20432 ) ) ( ON ?auto_20428 ?auto_20427 ) ( ON-TABLE ?auto_20432 ) ( ON ?auto_20429 ?auto_20428 ) ( CLEAR ?auto_20431 ) ( ON ?auto_20430 ?auto_20429 ) ( CLEAR ?auto_20430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20432 ?auto_20427 ?auto_20428 ?auto_20429 )
      ( MAKE-5PILE ?auto_20427 ?auto_20428 ?auto_20429 ?auto_20430 ?auto_20431 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20433 - BLOCK
      ?auto_20434 - BLOCK
      ?auto_20435 - BLOCK
      ?auto_20436 - BLOCK
      ?auto_20437 - BLOCK
    )
    :vars
    (
      ?auto_20438 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20433 ?auto_20434 ) ) ( not ( = ?auto_20433 ?auto_20435 ) ) ( not ( = ?auto_20433 ?auto_20436 ) ) ( not ( = ?auto_20433 ?auto_20437 ) ) ( not ( = ?auto_20434 ?auto_20435 ) ) ( not ( = ?auto_20434 ?auto_20436 ) ) ( not ( = ?auto_20434 ?auto_20437 ) ) ( not ( = ?auto_20435 ?auto_20436 ) ) ( not ( = ?auto_20435 ?auto_20437 ) ) ( not ( = ?auto_20436 ?auto_20437 ) ) ( ON ?auto_20433 ?auto_20438 ) ( not ( = ?auto_20433 ?auto_20438 ) ) ( not ( = ?auto_20434 ?auto_20438 ) ) ( not ( = ?auto_20435 ?auto_20438 ) ) ( not ( = ?auto_20436 ?auto_20438 ) ) ( not ( = ?auto_20437 ?auto_20438 ) ) ( ON ?auto_20434 ?auto_20433 ) ( ON-TABLE ?auto_20438 ) ( ON ?auto_20435 ?auto_20434 ) ( ON ?auto_20436 ?auto_20435 ) ( CLEAR ?auto_20436 ) ( HOLDING ?auto_20437 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20437 )
      ( MAKE-5PILE ?auto_20433 ?auto_20434 ?auto_20435 ?auto_20436 ?auto_20437 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20439 - BLOCK
      ?auto_20440 - BLOCK
      ?auto_20441 - BLOCK
      ?auto_20442 - BLOCK
      ?auto_20443 - BLOCK
    )
    :vars
    (
      ?auto_20444 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20439 ?auto_20440 ) ) ( not ( = ?auto_20439 ?auto_20441 ) ) ( not ( = ?auto_20439 ?auto_20442 ) ) ( not ( = ?auto_20439 ?auto_20443 ) ) ( not ( = ?auto_20440 ?auto_20441 ) ) ( not ( = ?auto_20440 ?auto_20442 ) ) ( not ( = ?auto_20440 ?auto_20443 ) ) ( not ( = ?auto_20441 ?auto_20442 ) ) ( not ( = ?auto_20441 ?auto_20443 ) ) ( not ( = ?auto_20442 ?auto_20443 ) ) ( ON ?auto_20439 ?auto_20444 ) ( not ( = ?auto_20439 ?auto_20444 ) ) ( not ( = ?auto_20440 ?auto_20444 ) ) ( not ( = ?auto_20441 ?auto_20444 ) ) ( not ( = ?auto_20442 ?auto_20444 ) ) ( not ( = ?auto_20443 ?auto_20444 ) ) ( ON ?auto_20440 ?auto_20439 ) ( ON-TABLE ?auto_20444 ) ( ON ?auto_20441 ?auto_20440 ) ( ON ?auto_20442 ?auto_20441 ) ( ON ?auto_20443 ?auto_20442 ) ( CLEAR ?auto_20443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20444 ?auto_20439 ?auto_20440 ?auto_20441 ?auto_20442 )
      ( MAKE-5PILE ?auto_20439 ?auto_20440 ?auto_20441 ?auto_20442 ?auto_20443 ) )
  )

)

